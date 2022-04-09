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
      ?auto_18617 - SURFACE
      ?auto_18618 - SURFACE
    )
    :vars
    (
      ?auto_18619 - HOIST
      ?auto_18620 - PLACE
      ?auto_18622 - PLACE
      ?auto_18623 - HOIST
      ?auto_18624 - SURFACE
      ?auto_18621 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18619 ?auto_18620 ) ( SURFACE-AT ?auto_18617 ?auto_18620 ) ( CLEAR ?auto_18617 ) ( IS-CRATE ?auto_18618 ) ( AVAILABLE ?auto_18619 ) ( not ( = ?auto_18622 ?auto_18620 ) ) ( HOIST-AT ?auto_18623 ?auto_18622 ) ( AVAILABLE ?auto_18623 ) ( SURFACE-AT ?auto_18618 ?auto_18622 ) ( ON ?auto_18618 ?auto_18624 ) ( CLEAR ?auto_18618 ) ( TRUCK-AT ?auto_18621 ?auto_18620 ) ( not ( = ?auto_18617 ?auto_18618 ) ) ( not ( = ?auto_18617 ?auto_18624 ) ) ( not ( = ?auto_18618 ?auto_18624 ) ) ( not ( = ?auto_18619 ?auto_18623 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18621 ?auto_18620 ?auto_18622 )
      ( !LIFT ?auto_18623 ?auto_18618 ?auto_18624 ?auto_18622 )
      ( !LOAD ?auto_18623 ?auto_18618 ?auto_18621 ?auto_18622 )
      ( !DRIVE ?auto_18621 ?auto_18622 ?auto_18620 )
      ( !UNLOAD ?auto_18619 ?auto_18618 ?auto_18621 ?auto_18620 )
      ( !DROP ?auto_18619 ?auto_18618 ?auto_18617 ?auto_18620 )
      ( MAKE-1CRATE-VERIFY ?auto_18617 ?auto_18618 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18627 - SURFACE
      ?auto_18628 - SURFACE
    )
    :vars
    (
      ?auto_18629 - HOIST
      ?auto_18630 - PLACE
      ?auto_18632 - PLACE
      ?auto_18633 - HOIST
      ?auto_18634 - SURFACE
      ?auto_18631 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18629 ?auto_18630 ) ( SURFACE-AT ?auto_18627 ?auto_18630 ) ( CLEAR ?auto_18627 ) ( IS-CRATE ?auto_18628 ) ( AVAILABLE ?auto_18629 ) ( not ( = ?auto_18632 ?auto_18630 ) ) ( HOIST-AT ?auto_18633 ?auto_18632 ) ( AVAILABLE ?auto_18633 ) ( SURFACE-AT ?auto_18628 ?auto_18632 ) ( ON ?auto_18628 ?auto_18634 ) ( CLEAR ?auto_18628 ) ( TRUCK-AT ?auto_18631 ?auto_18630 ) ( not ( = ?auto_18627 ?auto_18628 ) ) ( not ( = ?auto_18627 ?auto_18634 ) ) ( not ( = ?auto_18628 ?auto_18634 ) ) ( not ( = ?auto_18629 ?auto_18633 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18631 ?auto_18630 ?auto_18632 )
      ( !LIFT ?auto_18633 ?auto_18628 ?auto_18634 ?auto_18632 )
      ( !LOAD ?auto_18633 ?auto_18628 ?auto_18631 ?auto_18632 )
      ( !DRIVE ?auto_18631 ?auto_18632 ?auto_18630 )
      ( !UNLOAD ?auto_18629 ?auto_18628 ?auto_18631 ?auto_18630 )
      ( !DROP ?auto_18629 ?auto_18628 ?auto_18627 ?auto_18630 )
      ( MAKE-1CRATE-VERIFY ?auto_18627 ?auto_18628 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18638 - SURFACE
      ?auto_18639 - SURFACE
      ?auto_18640 - SURFACE
    )
    :vars
    (
      ?auto_18645 - HOIST
      ?auto_18644 - PLACE
      ?auto_18642 - PLACE
      ?auto_18646 - HOIST
      ?auto_18641 - SURFACE
      ?auto_18648 - PLACE
      ?auto_18647 - HOIST
      ?auto_18649 - SURFACE
      ?auto_18643 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18645 ?auto_18644 ) ( IS-CRATE ?auto_18640 ) ( not ( = ?auto_18642 ?auto_18644 ) ) ( HOIST-AT ?auto_18646 ?auto_18642 ) ( AVAILABLE ?auto_18646 ) ( SURFACE-AT ?auto_18640 ?auto_18642 ) ( ON ?auto_18640 ?auto_18641 ) ( CLEAR ?auto_18640 ) ( not ( = ?auto_18639 ?auto_18640 ) ) ( not ( = ?auto_18639 ?auto_18641 ) ) ( not ( = ?auto_18640 ?auto_18641 ) ) ( not ( = ?auto_18645 ?auto_18646 ) ) ( SURFACE-AT ?auto_18638 ?auto_18644 ) ( CLEAR ?auto_18638 ) ( IS-CRATE ?auto_18639 ) ( AVAILABLE ?auto_18645 ) ( not ( = ?auto_18648 ?auto_18644 ) ) ( HOIST-AT ?auto_18647 ?auto_18648 ) ( AVAILABLE ?auto_18647 ) ( SURFACE-AT ?auto_18639 ?auto_18648 ) ( ON ?auto_18639 ?auto_18649 ) ( CLEAR ?auto_18639 ) ( TRUCK-AT ?auto_18643 ?auto_18644 ) ( not ( = ?auto_18638 ?auto_18639 ) ) ( not ( = ?auto_18638 ?auto_18649 ) ) ( not ( = ?auto_18639 ?auto_18649 ) ) ( not ( = ?auto_18645 ?auto_18647 ) ) ( not ( = ?auto_18638 ?auto_18640 ) ) ( not ( = ?auto_18638 ?auto_18641 ) ) ( not ( = ?auto_18640 ?auto_18649 ) ) ( not ( = ?auto_18642 ?auto_18648 ) ) ( not ( = ?auto_18646 ?auto_18647 ) ) ( not ( = ?auto_18641 ?auto_18649 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18638 ?auto_18639 )
      ( MAKE-1CRATE ?auto_18639 ?auto_18640 )
      ( MAKE-2CRATE-VERIFY ?auto_18638 ?auto_18639 ?auto_18640 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18652 - SURFACE
      ?auto_18653 - SURFACE
    )
    :vars
    (
      ?auto_18654 - HOIST
      ?auto_18655 - PLACE
      ?auto_18657 - PLACE
      ?auto_18658 - HOIST
      ?auto_18659 - SURFACE
      ?auto_18656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18654 ?auto_18655 ) ( SURFACE-AT ?auto_18652 ?auto_18655 ) ( CLEAR ?auto_18652 ) ( IS-CRATE ?auto_18653 ) ( AVAILABLE ?auto_18654 ) ( not ( = ?auto_18657 ?auto_18655 ) ) ( HOIST-AT ?auto_18658 ?auto_18657 ) ( AVAILABLE ?auto_18658 ) ( SURFACE-AT ?auto_18653 ?auto_18657 ) ( ON ?auto_18653 ?auto_18659 ) ( CLEAR ?auto_18653 ) ( TRUCK-AT ?auto_18656 ?auto_18655 ) ( not ( = ?auto_18652 ?auto_18653 ) ) ( not ( = ?auto_18652 ?auto_18659 ) ) ( not ( = ?auto_18653 ?auto_18659 ) ) ( not ( = ?auto_18654 ?auto_18658 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18656 ?auto_18655 ?auto_18657 )
      ( !LIFT ?auto_18658 ?auto_18653 ?auto_18659 ?auto_18657 )
      ( !LOAD ?auto_18658 ?auto_18653 ?auto_18656 ?auto_18657 )
      ( !DRIVE ?auto_18656 ?auto_18657 ?auto_18655 )
      ( !UNLOAD ?auto_18654 ?auto_18653 ?auto_18656 ?auto_18655 )
      ( !DROP ?auto_18654 ?auto_18653 ?auto_18652 ?auto_18655 )
      ( MAKE-1CRATE-VERIFY ?auto_18652 ?auto_18653 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18664 - SURFACE
      ?auto_18665 - SURFACE
      ?auto_18666 - SURFACE
      ?auto_18667 - SURFACE
    )
    :vars
    (
      ?auto_18668 - HOIST
      ?auto_18671 - PLACE
      ?auto_18670 - PLACE
      ?auto_18672 - HOIST
      ?auto_18673 - SURFACE
      ?auto_18675 - PLACE
      ?auto_18679 - HOIST
      ?auto_18677 - SURFACE
      ?auto_18674 - PLACE
      ?auto_18678 - HOIST
      ?auto_18676 - SURFACE
      ?auto_18669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18668 ?auto_18671 ) ( IS-CRATE ?auto_18667 ) ( not ( = ?auto_18670 ?auto_18671 ) ) ( HOIST-AT ?auto_18672 ?auto_18670 ) ( AVAILABLE ?auto_18672 ) ( SURFACE-AT ?auto_18667 ?auto_18670 ) ( ON ?auto_18667 ?auto_18673 ) ( CLEAR ?auto_18667 ) ( not ( = ?auto_18666 ?auto_18667 ) ) ( not ( = ?auto_18666 ?auto_18673 ) ) ( not ( = ?auto_18667 ?auto_18673 ) ) ( not ( = ?auto_18668 ?auto_18672 ) ) ( IS-CRATE ?auto_18666 ) ( not ( = ?auto_18675 ?auto_18671 ) ) ( HOIST-AT ?auto_18679 ?auto_18675 ) ( AVAILABLE ?auto_18679 ) ( SURFACE-AT ?auto_18666 ?auto_18675 ) ( ON ?auto_18666 ?auto_18677 ) ( CLEAR ?auto_18666 ) ( not ( = ?auto_18665 ?auto_18666 ) ) ( not ( = ?auto_18665 ?auto_18677 ) ) ( not ( = ?auto_18666 ?auto_18677 ) ) ( not ( = ?auto_18668 ?auto_18679 ) ) ( SURFACE-AT ?auto_18664 ?auto_18671 ) ( CLEAR ?auto_18664 ) ( IS-CRATE ?auto_18665 ) ( AVAILABLE ?auto_18668 ) ( not ( = ?auto_18674 ?auto_18671 ) ) ( HOIST-AT ?auto_18678 ?auto_18674 ) ( AVAILABLE ?auto_18678 ) ( SURFACE-AT ?auto_18665 ?auto_18674 ) ( ON ?auto_18665 ?auto_18676 ) ( CLEAR ?auto_18665 ) ( TRUCK-AT ?auto_18669 ?auto_18671 ) ( not ( = ?auto_18664 ?auto_18665 ) ) ( not ( = ?auto_18664 ?auto_18676 ) ) ( not ( = ?auto_18665 ?auto_18676 ) ) ( not ( = ?auto_18668 ?auto_18678 ) ) ( not ( = ?auto_18664 ?auto_18666 ) ) ( not ( = ?auto_18664 ?auto_18677 ) ) ( not ( = ?auto_18666 ?auto_18676 ) ) ( not ( = ?auto_18675 ?auto_18674 ) ) ( not ( = ?auto_18679 ?auto_18678 ) ) ( not ( = ?auto_18677 ?auto_18676 ) ) ( not ( = ?auto_18664 ?auto_18667 ) ) ( not ( = ?auto_18664 ?auto_18673 ) ) ( not ( = ?auto_18665 ?auto_18667 ) ) ( not ( = ?auto_18665 ?auto_18673 ) ) ( not ( = ?auto_18667 ?auto_18677 ) ) ( not ( = ?auto_18667 ?auto_18676 ) ) ( not ( = ?auto_18670 ?auto_18675 ) ) ( not ( = ?auto_18670 ?auto_18674 ) ) ( not ( = ?auto_18672 ?auto_18679 ) ) ( not ( = ?auto_18672 ?auto_18678 ) ) ( not ( = ?auto_18673 ?auto_18677 ) ) ( not ( = ?auto_18673 ?auto_18676 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18664 ?auto_18665 ?auto_18666 )
      ( MAKE-1CRATE ?auto_18666 ?auto_18667 )
      ( MAKE-3CRATE-VERIFY ?auto_18664 ?auto_18665 ?auto_18666 ?auto_18667 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18682 - SURFACE
      ?auto_18683 - SURFACE
    )
    :vars
    (
      ?auto_18684 - HOIST
      ?auto_18685 - PLACE
      ?auto_18687 - PLACE
      ?auto_18688 - HOIST
      ?auto_18689 - SURFACE
      ?auto_18686 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18684 ?auto_18685 ) ( SURFACE-AT ?auto_18682 ?auto_18685 ) ( CLEAR ?auto_18682 ) ( IS-CRATE ?auto_18683 ) ( AVAILABLE ?auto_18684 ) ( not ( = ?auto_18687 ?auto_18685 ) ) ( HOIST-AT ?auto_18688 ?auto_18687 ) ( AVAILABLE ?auto_18688 ) ( SURFACE-AT ?auto_18683 ?auto_18687 ) ( ON ?auto_18683 ?auto_18689 ) ( CLEAR ?auto_18683 ) ( TRUCK-AT ?auto_18686 ?auto_18685 ) ( not ( = ?auto_18682 ?auto_18683 ) ) ( not ( = ?auto_18682 ?auto_18689 ) ) ( not ( = ?auto_18683 ?auto_18689 ) ) ( not ( = ?auto_18684 ?auto_18688 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18686 ?auto_18685 ?auto_18687 )
      ( !LIFT ?auto_18688 ?auto_18683 ?auto_18689 ?auto_18687 )
      ( !LOAD ?auto_18688 ?auto_18683 ?auto_18686 ?auto_18687 )
      ( !DRIVE ?auto_18686 ?auto_18687 ?auto_18685 )
      ( !UNLOAD ?auto_18684 ?auto_18683 ?auto_18686 ?auto_18685 )
      ( !DROP ?auto_18684 ?auto_18683 ?auto_18682 ?auto_18685 )
      ( MAKE-1CRATE-VERIFY ?auto_18682 ?auto_18683 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18695 - SURFACE
      ?auto_18696 - SURFACE
      ?auto_18697 - SURFACE
      ?auto_18698 - SURFACE
      ?auto_18699 - SURFACE
    )
    :vars
    (
      ?auto_18700 - HOIST
      ?auto_18702 - PLACE
      ?auto_18705 - PLACE
      ?auto_18701 - HOIST
      ?auto_18704 - SURFACE
      ?auto_18711 - PLACE
      ?auto_18710 - HOIST
      ?auto_18709 - SURFACE
      ?auto_18712 - PLACE
      ?auto_18708 - HOIST
      ?auto_18706 - SURFACE
      ?auto_18707 - SURFACE
      ?auto_18703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18700 ?auto_18702 ) ( IS-CRATE ?auto_18699 ) ( not ( = ?auto_18705 ?auto_18702 ) ) ( HOIST-AT ?auto_18701 ?auto_18705 ) ( SURFACE-AT ?auto_18699 ?auto_18705 ) ( ON ?auto_18699 ?auto_18704 ) ( CLEAR ?auto_18699 ) ( not ( = ?auto_18698 ?auto_18699 ) ) ( not ( = ?auto_18698 ?auto_18704 ) ) ( not ( = ?auto_18699 ?auto_18704 ) ) ( not ( = ?auto_18700 ?auto_18701 ) ) ( IS-CRATE ?auto_18698 ) ( not ( = ?auto_18711 ?auto_18702 ) ) ( HOIST-AT ?auto_18710 ?auto_18711 ) ( AVAILABLE ?auto_18710 ) ( SURFACE-AT ?auto_18698 ?auto_18711 ) ( ON ?auto_18698 ?auto_18709 ) ( CLEAR ?auto_18698 ) ( not ( = ?auto_18697 ?auto_18698 ) ) ( not ( = ?auto_18697 ?auto_18709 ) ) ( not ( = ?auto_18698 ?auto_18709 ) ) ( not ( = ?auto_18700 ?auto_18710 ) ) ( IS-CRATE ?auto_18697 ) ( not ( = ?auto_18712 ?auto_18702 ) ) ( HOIST-AT ?auto_18708 ?auto_18712 ) ( AVAILABLE ?auto_18708 ) ( SURFACE-AT ?auto_18697 ?auto_18712 ) ( ON ?auto_18697 ?auto_18706 ) ( CLEAR ?auto_18697 ) ( not ( = ?auto_18696 ?auto_18697 ) ) ( not ( = ?auto_18696 ?auto_18706 ) ) ( not ( = ?auto_18697 ?auto_18706 ) ) ( not ( = ?auto_18700 ?auto_18708 ) ) ( SURFACE-AT ?auto_18695 ?auto_18702 ) ( CLEAR ?auto_18695 ) ( IS-CRATE ?auto_18696 ) ( AVAILABLE ?auto_18700 ) ( AVAILABLE ?auto_18701 ) ( SURFACE-AT ?auto_18696 ?auto_18705 ) ( ON ?auto_18696 ?auto_18707 ) ( CLEAR ?auto_18696 ) ( TRUCK-AT ?auto_18703 ?auto_18702 ) ( not ( = ?auto_18695 ?auto_18696 ) ) ( not ( = ?auto_18695 ?auto_18707 ) ) ( not ( = ?auto_18696 ?auto_18707 ) ) ( not ( = ?auto_18695 ?auto_18697 ) ) ( not ( = ?auto_18695 ?auto_18706 ) ) ( not ( = ?auto_18697 ?auto_18707 ) ) ( not ( = ?auto_18712 ?auto_18705 ) ) ( not ( = ?auto_18708 ?auto_18701 ) ) ( not ( = ?auto_18706 ?auto_18707 ) ) ( not ( = ?auto_18695 ?auto_18698 ) ) ( not ( = ?auto_18695 ?auto_18709 ) ) ( not ( = ?auto_18696 ?auto_18698 ) ) ( not ( = ?auto_18696 ?auto_18709 ) ) ( not ( = ?auto_18698 ?auto_18706 ) ) ( not ( = ?auto_18698 ?auto_18707 ) ) ( not ( = ?auto_18711 ?auto_18712 ) ) ( not ( = ?auto_18711 ?auto_18705 ) ) ( not ( = ?auto_18710 ?auto_18708 ) ) ( not ( = ?auto_18710 ?auto_18701 ) ) ( not ( = ?auto_18709 ?auto_18706 ) ) ( not ( = ?auto_18709 ?auto_18707 ) ) ( not ( = ?auto_18695 ?auto_18699 ) ) ( not ( = ?auto_18695 ?auto_18704 ) ) ( not ( = ?auto_18696 ?auto_18699 ) ) ( not ( = ?auto_18696 ?auto_18704 ) ) ( not ( = ?auto_18697 ?auto_18699 ) ) ( not ( = ?auto_18697 ?auto_18704 ) ) ( not ( = ?auto_18699 ?auto_18709 ) ) ( not ( = ?auto_18699 ?auto_18706 ) ) ( not ( = ?auto_18699 ?auto_18707 ) ) ( not ( = ?auto_18704 ?auto_18709 ) ) ( not ( = ?auto_18704 ?auto_18706 ) ) ( not ( = ?auto_18704 ?auto_18707 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_18695 ?auto_18696 ?auto_18697 ?auto_18698 )
      ( MAKE-1CRATE ?auto_18698 ?auto_18699 )
      ( MAKE-4CRATE-VERIFY ?auto_18695 ?auto_18696 ?auto_18697 ?auto_18698 ?auto_18699 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18715 - SURFACE
      ?auto_18716 - SURFACE
    )
    :vars
    (
      ?auto_18717 - HOIST
      ?auto_18718 - PLACE
      ?auto_18720 - PLACE
      ?auto_18721 - HOIST
      ?auto_18722 - SURFACE
      ?auto_18719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18717 ?auto_18718 ) ( SURFACE-AT ?auto_18715 ?auto_18718 ) ( CLEAR ?auto_18715 ) ( IS-CRATE ?auto_18716 ) ( AVAILABLE ?auto_18717 ) ( not ( = ?auto_18720 ?auto_18718 ) ) ( HOIST-AT ?auto_18721 ?auto_18720 ) ( AVAILABLE ?auto_18721 ) ( SURFACE-AT ?auto_18716 ?auto_18720 ) ( ON ?auto_18716 ?auto_18722 ) ( CLEAR ?auto_18716 ) ( TRUCK-AT ?auto_18719 ?auto_18718 ) ( not ( = ?auto_18715 ?auto_18716 ) ) ( not ( = ?auto_18715 ?auto_18722 ) ) ( not ( = ?auto_18716 ?auto_18722 ) ) ( not ( = ?auto_18717 ?auto_18721 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18719 ?auto_18718 ?auto_18720 )
      ( !LIFT ?auto_18721 ?auto_18716 ?auto_18722 ?auto_18720 )
      ( !LOAD ?auto_18721 ?auto_18716 ?auto_18719 ?auto_18720 )
      ( !DRIVE ?auto_18719 ?auto_18720 ?auto_18718 )
      ( !UNLOAD ?auto_18717 ?auto_18716 ?auto_18719 ?auto_18718 )
      ( !DROP ?auto_18717 ?auto_18716 ?auto_18715 ?auto_18718 )
      ( MAKE-1CRATE-VERIFY ?auto_18715 ?auto_18716 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18729 - SURFACE
      ?auto_18730 - SURFACE
      ?auto_18731 - SURFACE
      ?auto_18732 - SURFACE
      ?auto_18733 - SURFACE
      ?auto_18734 - SURFACE
    )
    :vars
    (
      ?auto_18739 - HOIST
      ?auto_18738 - PLACE
      ?auto_18740 - PLACE
      ?auto_18735 - HOIST
      ?auto_18737 - SURFACE
      ?auto_18745 - PLACE
      ?auto_18744 - HOIST
      ?auto_18743 - SURFACE
      ?auto_18741 - PLACE
      ?auto_18742 - HOIST
      ?auto_18749 - SURFACE
      ?auto_18750 - PLACE
      ?auto_18747 - HOIST
      ?auto_18746 - SURFACE
      ?auto_18748 - SURFACE
      ?auto_18736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18739 ?auto_18738 ) ( IS-CRATE ?auto_18734 ) ( not ( = ?auto_18740 ?auto_18738 ) ) ( HOIST-AT ?auto_18735 ?auto_18740 ) ( AVAILABLE ?auto_18735 ) ( SURFACE-AT ?auto_18734 ?auto_18740 ) ( ON ?auto_18734 ?auto_18737 ) ( CLEAR ?auto_18734 ) ( not ( = ?auto_18733 ?auto_18734 ) ) ( not ( = ?auto_18733 ?auto_18737 ) ) ( not ( = ?auto_18734 ?auto_18737 ) ) ( not ( = ?auto_18739 ?auto_18735 ) ) ( IS-CRATE ?auto_18733 ) ( not ( = ?auto_18745 ?auto_18738 ) ) ( HOIST-AT ?auto_18744 ?auto_18745 ) ( SURFACE-AT ?auto_18733 ?auto_18745 ) ( ON ?auto_18733 ?auto_18743 ) ( CLEAR ?auto_18733 ) ( not ( = ?auto_18732 ?auto_18733 ) ) ( not ( = ?auto_18732 ?auto_18743 ) ) ( not ( = ?auto_18733 ?auto_18743 ) ) ( not ( = ?auto_18739 ?auto_18744 ) ) ( IS-CRATE ?auto_18732 ) ( not ( = ?auto_18741 ?auto_18738 ) ) ( HOIST-AT ?auto_18742 ?auto_18741 ) ( AVAILABLE ?auto_18742 ) ( SURFACE-AT ?auto_18732 ?auto_18741 ) ( ON ?auto_18732 ?auto_18749 ) ( CLEAR ?auto_18732 ) ( not ( = ?auto_18731 ?auto_18732 ) ) ( not ( = ?auto_18731 ?auto_18749 ) ) ( not ( = ?auto_18732 ?auto_18749 ) ) ( not ( = ?auto_18739 ?auto_18742 ) ) ( IS-CRATE ?auto_18731 ) ( not ( = ?auto_18750 ?auto_18738 ) ) ( HOIST-AT ?auto_18747 ?auto_18750 ) ( AVAILABLE ?auto_18747 ) ( SURFACE-AT ?auto_18731 ?auto_18750 ) ( ON ?auto_18731 ?auto_18746 ) ( CLEAR ?auto_18731 ) ( not ( = ?auto_18730 ?auto_18731 ) ) ( not ( = ?auto_18730 ?auto_18746 ) ) ( not ( = ?auto_18731 ?auto_18746 ) ) ( not ( = ?auto_18739 ?auto_18747 ) ) ( SURFACE-AT ?auto_18729 ?auto_18738 ) ( CLEAR ?auto_18729 ) ( IS-CRATE ?auto_18730 ) ( AVAILABLE ?auto_18739 ) ( AVAILABLE ?auto_18744 ) ( SURFACE-AT ?auto_18730 ?auto_18745 ) ( ON ?auto_18730 ?auto_18748 ) ( CLEAR ?auto_18730 ) ( TRUCK-AT ?auto_18736 ?auto_18738 ) ( not ( = ?auto_18729 ?auto_18730 ) ) ( not ( = ?auto_18729 ?auto_18748 ) ) ( not ( = ?auto_18730 ?auto_18748 ) ) ( not ( = ?auto_18729 ?auto_18731 ) ) ( not ( = ?auto_18729 ?auto_18746 ) ) ( not ( = ?auto_18731 ?auto_18748 ) ) ( not ( = ?auto_18750 ?auto_18745 ) ) ( not ( = ?auto_18747 ?auto_18744 ) ) ( not ( = ?auto_18746 ?auto_18748 ) ) ( not ( = ?auto_18729 ?auto_18732 ) ) ( not ( = ?auto_18729 ?auto_18749 ) ) ( not ( = ?auto_18730 ?auto_18732 ) ) ( not ( = ?auto_18730 ?auto_18749 ) ) ( not ( = ?auto_18732 ?auto_18746 ) ) ( not ( = ?auto_18732 ?auto_18748 ) ) ( not ( = ?auto_18741 ?auto_18750 ) ) ( not ( = ?auto_18741 ?auto_18745 ) ) ( not ( = ?auto_18742 ?auto_18747 ) ) ( not ( = ?auto_18742 ?auto_18744 ) ) ( not ( = ?auto_18749 ?auto_18746 ) ) ( not ( = ?auto_18749 ?auto_18748 ) ) ( not ( = ?auto_18729 ?auto_18733 ) ) ( not ( = ?auto_18729 ?auto_18743 ) ) ( not ( = ?auto_18730 ?auto_18733 ) ) ( not ( = ?auto_18730 ?auto_18743 ) ) ( not ( = ?auto_18731 ?auto_18733 ) ) ( not ( = ?auto_18731 ?auto_18743 ) ) ( not ( = ?auto_18733 ?auto_18749 ) ) ( not ( = ?auto_18733 ?auto_18746 ) ) ( not ( = ?auto_18733 ?auto_18748 ) ) ( not ( = ?auto_18743 ?auto_18749 ) ) ( not ( = ?auto_18743 ?auto_18746 ) ) ( not ( = ?auto_18743 ?auto_18748 ) ) ( not ( = ?auto_18729 ?auto_18734 ) ) ( not ( = ?auto_18729 ?auto_18737 ) ) ( not ( = ?auto_18730 ?auto_18734 ) ) ( not ( = ?auto_18730 ?auto_18737 ) ) ( not ( = ?auto_18731 ?auto_18734 ) ) ( not ( = ?auto_18731 ?auto_18737 ) ) ( not ( = ?auto_18732 ?auto_18734 ) ) ( not ( = ?auto_18732 ?auto_18737 ) ) ( not ( = ?auto_18734 ?auto_18743 ) ) ( not ( = ?auto_18734 ?auto_18749 ) ) ( not ( = ?auto_18734 ?auto_18746 ) ) ( not ( = ?auto_18734 ?auto_18748 ) ) ( not ( = ?auto_18740 ?auto_18745 ) ) ( not ( = ?auto_18740 ?auto_18741 ) ) ( not ( = ?auto_18740 ?auto_18750 ) ) ( not ( = ?auto_18735 ?auto_18744 ) ) ( not ( = ?auto_18735 ?auto_18742 ) ) ( not ( = ?auto_18735 ?auto_18747 ) ) ( not ( = ?auto_18737 ?auto_18743 ) ) ( not ( = ?auto_18737 ?auto_18749 ) ) ( not ( = ?auto_18737 ?auto_18746 ) ) ( not ( = ?auto_18737 ?auto_18748 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_18729 ?auto_18730 ?auto_18731 ?auto_18732 ?auto_18733 )
      ( MAKE-1CRATE ?auto_18733 ?auto_18734 )
      ( MAKE-5CRATE-VERIFY ?auto_18729 ?auto_18730 ?auto_18731 ?auto_18732 ?auto_18733 ?auto_18734 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18753 - SURFACE
      ?auto_18754 - SURFACE
    )
    :vars
    (
      ?auto_18755 - HOIST
      ?auto_18756 - PLACE
      ?auto_18758 - PLACE
      ?auto_18759 - HOIST
      ?auto_18760 - SURFACE
      ?auto_18757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18755 ?auto_18756 ) ( SURFACE-AT ?auto_18753 ?auto_18756 ) ( CLEAR ?auto_18753 ) ( IS-CRATE ?auto_18754 ) ( AVAILABLE ?auto_18755 ) ( not ( = ?auto_18758 ?auto_18756 ) ) ( HOIST-AT ?auto_18759 ?auto_18758 ) ( AVAILABLE ?auto_18759 ) ( SURFACE-AT ?auto_18754 ?auto_18758 ) ( ON ?auto_18754 ?auto_18760 ) ( CLEAR ?auto_18754 ) ( TRUCK-AT ?auto_18757 ?auto_18756 ) ( not ( = ?auto_18753 ?auto_18754 ) ) ( not ( = ?auto_18753 ?auto_18760 ) ) ( not ( = ?auto_18754 ?auto_18760 ) ) ( not ( = ?auto_18755 ?auto_18759 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18757 ?auto_18756 ?auto_18758 )
      ( !LIFT ?auto_18759 ?auto_18754 ?auto_18760 ?auto_18758 )
      ( !LOAD ?auto_18759 ?auto_18754 ?auto_18757 ?auto_18758 )
      ( !DRIVE ?auto_18757 ?auto_18758 ?auto_18756 )
      ( !UNLOAD ?auto_18755 ?auto_18754 ?auto_18757 ?auto_18756 )
      ( !DROP ?auto_18755 ?auto_18754 ?auto_18753 ?auto_18756 )
      ( MAKE-1CRATE-VERIFY ?auto_18753 ?auto_18754 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_18768 - SURFACE
      ?auto_18769 - SURFACE
      ?auto_18770 - SURFACE
      ?auto_18771 - SURFACE
      ?auto_18772 - SURFACE
      ?auto_18773 - SURFACE
      ?auto_18774 - SURFACE
    )
    :vars
    (
      ?auto_18779 - HOIST
      ?auto_18780 - PLACE
      ?auto_18776 - PLACE
      ?auto_18777 - HOIST
      ?auto_18778 - SURFACE
      ?auto_18784 - PLACE
      ?auto_18785 - HOIST
      ?auto_18781 - SURFACE
      ?auto_18791 - PLACE
      ?auto_18793 - HOIST
      ?auto_18783 - SURFACE
      ?auto_18786 - PLACE
      ?auto_18782 - HOIST
      ?auto_18792 - SURFACE
      ?auto_18787 - PLACE
      ?auto_18789 - HOIST
      ?auto_18790 - SURFACE
      ?auto_18788 - SURFACE
      ?auto_18775 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18779 ?auto_18780 ) ( IS-CRATE ?auto_18774 ) ( not ( = ?auto_18776 ?auto_18780 ) ) ( HOIST-AT ?auto_18777 ?auto_18776 ) ( AVAILABLE ?auto_18777 ) ( SURFACE-AT ?auto_18774 ?auto_18776 ) ( ON ?auto_18774 ?auto_18778 ) ( CLEAR ?auto_18774 ) ( not ( = ?auto_18773 ?auto_18774 ) ) ( not ( = ?auto_18773 ?auto_18778 ) ) ( not ( = ?auto_18774 ?auto_18778 ) ) ( not ( = ?auto_18779 ?auto_18777 ) ) ( IS-CRATE ?auto_18773 ) ( not ( = ?auto_18784 ?auto_18780 ) ) ( HOIST-AT ?auto_18785 ?auto_18784 ) ( AVAILABLE ?auto_18785 ) ( SURFACE-AT ?auto_18773 ?auto_18784 ) ( ON ?auto_18773 ?auto_18781 ) ( CLEAR ?auto_18773 ) ( not ( = ?auto_18772 ?auto_18773 ) ) ( not ( = ?auto_18772 ?auto_18781 ) ) ( not ( = ?auto_18773 ?auto_18781 ) ) ( not ( = ?auto_18779 ?auto_18785 ) ) ( IS-CRATE ?auto_18772 ) ( not ( = ?auto_18791 ?auto_18780 ) ) ( HOIST-AT ?auto_18793 ?auto_18791 ) ( SURFACE-AT ?auto_18772 ?auto_18791 ) ( ON ?auto_18772 ?auto_18783 ) ( CLEAR ?auto_18772 ) ( not ( = ?auto_18771 ?auto_18772 ) ) ( not ( = ?auto_18771 ?auto_18783 ) ) ( not ( = ?auto_18772 ?auto_18783 ) ) ( not ( = ?auto_18779 ?auto_18793 ) ) ( IS-CRATE ?auto_18771 ) ( not ( = ?auto_18786 ?auto_18780 ) ) ( HOIST-AT ?auto_18782 ?auto_18786 ) ( AVAILABLE ?auto_18782 ) ( SURFACE-AT ?auto_18771 ?auto_18786 ) ( ON ?auto_18771 ?auto_18792 ) ( CLEAR ?auto_18771 ) ( not ( = ?auto_18770 ?auto_18771 ) ) ( not ( = ?auto_18770 ?auto_18792 ) ) ( not ( = ?auto_18771 ?auto_18792 ) ) ( not ( = ?auto_18779 ?auto_18782 ) ) ( IS-CRATE ?auto_18770 ) ( not ( = ?auto_18787 ?auto_18780 ) ) ( HOIST-AT ?auto_18789 ?auto_18787 ) ( AVAILABLE ?auto_18789 ) ( SURFACE-AT ?auto_18770 ?auto_18787 ) ( ON ?auto_18770 ?auto_18790 ) ( CLEAR ?auto_18770 ) ( not ( = ?auto_18769 ?auto_18770 ) ) ( not ( = ?auto_18769 ?auto_18790 ) ) ( not ( = ?auto_18770 ?auto_18790 ) ) ( not ( = ?auto_18779 ?auto_18789 ) ) ( SURFACE-AT ?auto_18768 ?auto_18780 ) ( CLEAR ?auto_18768 ) ( IS-CRATE ?auto_18769 ) ( AVAILABLE ?auto_18779 ) ( AVAILABLE ?auto_18793 ) ( SURFACE-AT ?auto_18769 ?auto_18791 ) ( ON ?auto_18769 ?auto_18788 ) ( CLEAR ?auto_18769 ) ( TRUCK-AT ?auto_18775 ?auto_18780 ) ( not ( = ?auto_18768 ?auto_18769 ) ) ( not ( = ?auto_18768 ?auto_18788 ) ) ( not ( = ?auto_18769 ?auto_18788 ) ) ( not ( = ?auto_18768 ?auto_18770 ) ) ( not ( = ?auto_18768 ?auto_18790 ) ) ( not ( = ?auto_18770 ?auto_18788 ) ) ( not ( = ?auto_18787 ?auto_18791 ) ) ( not ( = ?auto_18789 ?auto_18793 ) ) ( not ( = ?auto_18790 ?auto_18788 ) ) ( not ( = ?auto_18768 ?auto_18771 ) ) ( not ( = ?auto_18768 ?auto_18792 ) ) ( not ( = ?auto_18769 ?auto_18771 ) ) ( not ( = ?auto_18769 ?auto_18792 ) ) ( not ( = ?auto_18771 ?auto_18790 ) ) ( not ( = ?auto_18771 ?auto_18788 ) ) ( not ( = ?auto_18786 ?auto_18787 ) ) ( not ( = ?auto_18786 ?auto_18791 ) ) ( not ( = ?auto_18782 ?auto_18789 ) ) ( not ( = ?auto_18782 ?auto_18793 ) ) ( not ( = ?auto_18792 ?auto_18790 ) ) ( not ( = ?auto_18792 ?auto_18788 ) ) ( not ( = ?auto_18768 ?auto_18772 ) ) ( not ( = ?auto_18768 ?auto_18783 ) ) ( not ( = ?auto_18769 ?auto_18772 ) ) ( not ( = ?auto_18769 ?auto_18783 ) ) ( not ( = ?auto_18770 ?auto_18772 ) ) ( not ( = ?auto_18770 ?auto_18783 ) ) ( not ( = ?auto_18772 ?auto_18792 ) ) ( not ( = ?auto_18772 ?auto_18790 ) ) ( not ( = ?auto_18772 ?auto_18788 ) ) ( not ( = ?auto_18783 ?auto_18792 ) ) ( not ( = ?auto_18783 ?auto_18790 ) ) ( not ( = ?auto_18783 ?auto_18788 ) ) ( not ( = ?auto_18768 ?auto_18773 ) ) ( not ( = ?auto_18768 ?auto_18781 ) ) ( not ( = ?auto_18769 ?auto_18773 ) ) ( not ( = ?auto_18769 ?auto_18781 ) ) ( not ( = ?auto_18770 ?auto_18773 ) ) ( not ( = ?auto_18770 ?auto_18781 ) ) ( not ( = ?auto_18771 ?auto_18773 ) ) ( not ( = ?auto_18771 ?auto_18781 ) ) ( not ( = ?auto_18773 ?auto_18783 ) ) ( not ( = ?auto_18773 ?auto_18792 ) ) ( not ( = ?auto_18773 ?auto_18790 ) ) ( not ( = ?auto_18773 ?auto_18788 ) ) ( not ( = ?auto_18784 ?auto_18791 ) ) ( not ( = ?auto_18784 ?auto_18786 ) ) ( not ( = ?auto_18784 ?auto_18787 ) ) ( not ( = ?auto_18785 ?auto_18793 ) ) ( not ( = ?auto_18785 ?auto_18782 ) ) ( not ( = ?auto_18785 ?auto_18789 ) ) ( not ( = ?auto_18781 ?auto_18783 ) ) ( not ( = ?auto_18781 ?auto_18792 ) ) ( not ( = ?auto_18781 ?auto_18790 ) ) ( not ( = ?auto_18781 ?auto_18788 ) ) ( not ( = ?auto_18768 ?auto_18774 ) ) ( not ( = ?auto_18768 ?auto_18778 ) ) ( not ( = ?auto_18769 ?auto_18774 ) ) ( not ( = ?auto_18769 ?auto_18778 ) ) ( not ( = ?auto_18770 ?auto_18774 ) ) ( not ( = ?auto_18770 ?auto_18778 ) ) ( not ( = ?auto_18771 ?auto_18774 ) ) ( not ( = ?auto_18771 ?auto_18778 ) ) ( not ( = ?auto_18772 ?auto_18774 ) ) ( not ( = ?auto_18772 ?auto_18778 ) ) ( not ( = ?auto_18774 ?auto_18781 ) ) ( not ( = ?auto_18774 ?auto_18783 ) ) ( not ( = ?auto_18774 ?auto_18792 ) ) ( not ( = ?auto_18774 ?auto_18790 ) ) ( not ( = ?auto_18774 ?auto_18788 ) ) ( not ( = ?auto_18776 ?auto_18784 ) ) ( not ( = ?auto_18776 ?auto_18791 ) ) ( not ( = ?auto_18776 ?auto_18786 ) ) ( not ( = ?auto_18776 ?auto_18787 ) ) ( not ( = ?auto_18777 ?auto_18785 ) ) ( not ( = ?auto_18777 ?auto_18793 ) ) ( not ( = ?auto_18777 ?auto_18782 ) ) ( not ( = ?auto_18777 ?auto_18789 ) ) ( not ( = ?auto_18778 ?auto_18781 ) ) ( not ( = ?auto_18778 ?auto_18783 ) ) ( not ( = ?auto_18778 ?auto_18792 ) ) ( not ( = ?auto_18778 ?auto_18790 ) ) ( not ( = ?auto_18778 ?auto_18788 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_18768 ?auto_18769 ?auto_18770 ?auto_18771 ?auto_18772 ?auto_18773 )
      ( MAKE-1CRATE ?auto_18773 ?auto_18774 )
      ( MAKE-6CRATE-VERIFY ?auto_18768 ?auto_18769 ?auto_18770 ?auto_18771 ?auto_18772 ?auto_18773 ?auto_18774 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18796 - SURFACE
      ?auto_18797 - SURFACE
    )
    :vars
    (
      ?auto_18798 - HOIST
      ?auto_18799 - PLACE
      ?auto_18801 - PLACE
      ?auto_18802 - HOIST
      ?auto_18803 - SURFACE
      ?auto_18800 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18798 ?auto_18799 ) ( SURFACE-AT ?auto_18796 ?auto_18799 ) ( CLEAR ?auto_18796 ) ( IS-CRATE ?auto_18797 ) ( AVAILABLE ?auto_18798 ) ( not ( = ?auto_18801 ?auto_18799 ) ) ( HOIST-AT ?auto_18802 ?auto_18801 ) ( AVAILABLE ?auto_18802 ) ( SURFACE-AT ?auto_18797 ?auto_18801 ) ( ON ?auto_18797 ?auto_18803 ) ( CLEAR ?auto_18797 ) ( TRUCK-AT ?auto_18800 ?auto_18799 ) ( not ( = ?auto_18796 ?auto_18797 ) ) ( not ( = ?auto_18796 ?auto_18803 ) ) ( not ( = ?auto_18797 ?auto_18803 ) ) ( not ( = ?auto_18798 ?auto_18802 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18800 ?auto_18799 ?auto_18801 )
      ( !LIFT ?auto_18802 ?auto_18797 ?auto_18803 ?auto_18801 )
      ( !LOAD ?auto_18802 ?auto_18797 ?auto_18800 ?auto_18801 )
      ( !DRIVE ?auto_18800 ?auto_18801 ?auto_18799 )
      ( !UNLOAD ?auto_18798 ?auto_18797 ?auto_18800 ?auto_18799 )
      ( !DROP ?auto_18798 ?auto_18797 ?auto_18796 ?auto_18799 )
      ( MAKE-1CRATE-VERIFY ?auto_18796 ?auto_18797 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_18812 - SURFACE
      ?auto_18813 - SURFACE
      ?auto_18814 - SURFACE
      ?auto_18815 - SURFACE
      ?auto_18816 - SURFACE
      ?auto_18817 - SURFACE
      ?auto_18818 - SURFACE
      ?auto_18819 - SURFACE
    )
    :vars
    (
      ?auto_18825 - HOIST
      ?auto_18823 - PLACE
      ?auto_18821 - PLACE
      ?auto_18822 - HOIST
      ?auto_18820 - SURFACE
      ?auto_18829 - PLACE
      ?auto_18827 - HOIST
      ?auto_18830 - SURFACE
      ?auto_18826 - PLACE
      ?auto_18828 - HOIST
      ?auto_18833 - SURFACE
      ?auto_18835 - PLACE
      ?auto_18838 - HOIST
      ?auto_18832 - SURFACE
      ?auto_18841 - PLACE
      ?auto_18831 - HOIST
      ?auto_18837 - SURFACE
      ?auto_18840 - PLACE
      ?auto_18834 - HOIST
      ?auto_18836 - SURFACE
      ?auto_18839 - SURFACE
      ?auto_18824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18825 ?auto_18823 ) ( IS-CRATE ?auto_18819 ) ( not ( = ?auto_18821 ?auto_18823 ) ) ( HOIST-AT ?auto_18822 ?auto_18821 ) ( AVAILABLE ?auto_18822 ) ( SURFACE-AT ?auto_18819 ?auto_18821 ) ( ON ?auto_18819 ?auto_18820 ) ( CLEAR ?auto_18819 ) ( not ( = ?auto_18818 ?auto_18819 ) ) ( not ( = ?auto_18818 ?auto_18820 ) ) ( not ( = ?auto_18819 ?auto_18820 ) ) ( not ( = ?auto_18825 ?auto_18822 ) ) ( IS-CRATE ?auto_18818 ) ( not ( = ?auto_18829 ?auto_18823 ) ) ( HOIST-AT ?auto_18827 ?auto_18829 ) ( AVAILABLE ?auto_18827 ) ( SURFACE-AT ?auto_18818 ?auto_18829 ) ( ON ?auto_18818 ?auto_18830 ) ( CLEAR ?auto_18818 ) ( not ( = ?auto_18817 ?auto_18818 ) ) ( not ( = ?auto_18817 ?auto_18830 ) ) ( not ( = ?auto_18818 ?auto_18830 ) ) ( not ( = ?auto_18825 ?auto_18827 ) ) ( IS-CRATE ?auto_18817 ) ( not ( = ?auto_18826 ?auto_18823 ) ) ( HOIST-AT ?auto_18828 ?auto_18826 ) ( AVAILABLE ?auto_18828 ) ( SURFACE-AT ?auto_18817 ?auto_18826 ) ( ON ?auto_18817 ?auto_18833 ) ( CLEAR ?auto_18817 ) ( not ( = ?auto_18816 ?auto_18817 ) ) ( not ( = ?auto_18816 ?auto_18833 ) ) ( not ( = ?auto_18817 ?auto_18833 ) ) ( not ( = ?auto_18825 ?auto_18828 ) ) ( IS-CRATE ?auto_18816 ) ( not ( = ?auto_18835 ?auto_18823 ) ) ( HOIST-AT ?auto_18838 ?auto_18835 ) ( SURFACE-AT ?auto_18816 ?auto_18835 ) ( ON ?auto_18816 ?auto_18832 ) ( CLEAR ?auto_18816 ) ( not ( = ?auto_18815 ?auto_18816 ) ) ( not ( = ?auto_18815 ?auto_18832 ) ) ( not ( = ?auto_18816 ?auto_18832 ) ) ( not ( = ?auto_18825 ?auto_18838 ) ) ( IS-CRATE ?auto_18815 ) ( not ( = ?auto_18841 ?auto_18823 ) ) ( HOIST-AT ?auto_18831 ?auto_18841 ) ( AVAILABLE ?auto_18831 ) ( SURFACE-AT ?auto_18815 ?auto_18841 ) ( ON ?auto_18815 ?auto_18837 ) ( CLEAR ?auto_18815 ) ( not ( = ?auto_18814 ?auto_18815 ) ) ( not ( = ?auto_18814 ?auto_18837 ) ) ( not ( = ?auto_18815 ?auto_18837 ) ) ( not ( = ?auto_18825 ?auto_18831 ) ) ( IS-CRATE ?auto_18814 ) ( not ( = ?auto_18840 ?auto_18823 ) ) ( HOIST-AT ?auto_18834 ?auto_18840 ) ( AVAILABLE ?auto_18834 ) ( SURFACE-AT ?auto_18814 ?auto_18840 ) ( ON ?auto_18814 ?auto_18836 ) ( CLEAR ?auto_18814 ) ( not ( = ?auto_18813 ?auto_18814 ) ) ( not ( = ?auto_18813 ?auto_18836 ) ) ( not ( = ?auto_18814 ?auto_18836 ) ) ( not ( = ?auto_18825 ?auto_18834 ) ) ( SURFACE-AT ?auto_18812 ?auto_18823 ) ( CLEAR ?auto_18812 ) ( IS-CRATE ?auto_18813 ) ( AVAILABLE ?auto_18825 ) ( AVAILABLE ?auto_18838 ) ( SURFACE-AT ?auto_18813 ?auto_18835 ) ( ON ?auto_18813 ?auto_18839 ) ( CLEAR ?auto_18813 ) ( TRUCK-AT ?auto_18824 ?auto_18823 ) ( not ( = ?auto_18812 ?auto_18813 ) ) ( not ( = ?auto_18812 ?auto_18839 ) ) ( not ( = ?auto_18813 ?auto_18839 ) ) ( not ( = ?auto_18812 ?auto_18814 ) ) ( not ( = ?auto_18812 ?auto_18836 ) ) ( not ( = ?auto_18814 ?auto_18839 ) ) ( not ( = ?auto_18840 ?auto_18835 ) ) ( not ( = ?auto_18834 ?auto_18838 ) ) ( not ( = ?auto_18836 ?auto_18839 ) ) ( not ( = ?auto_18812 ?auto_18815 ) ) ( not ( = ?auto_18812 ?auto_18837 ) ) ( not ( = ?auto_18813 ?auto_18815 ) ) ( not ( = ?auto_18813 ?auto_18837 ) ) ( not ( = ?auto_18815 ?auto_18836 ) ) ( not ( = ?auto_18815 ?auto_18839 ) ) ( not ( = ?auto_18841 ?auto_18840 ) ) ( not ( = ?auto_18841 ?auto_18835 ) ) ( not ( = ?auto_18831 ?auto_18834 ) ) ( not ( = ?auto_18831 ?auto_18838 ) ) ( not ( = ?auto_18837 ?auto_18836 ) ) ( not ( = ?auto_18837 ?auto_18839 ) ) ( not ( = ?auto_18812 ?auto_18816 ) ) ( not ( = ?auto_18812 ?auto_18832 ) ) ( not ( = ?auto_18813 ?auto_18816 ) ) ( not ( = ?auto_18813 ?auto_18832 ) ) ( not ( = ?auto_18814 ?auto_18816 ) ) ( not ( = ?auto_18814 ?auto_18832 ) ) ( not ( = ?auto_18816 ?auto_18837 ) ) ( not ( = ?auto_18816 ?auto_18836 ) ) ( not ( = ?auto_18816 ?auto_18839 ) ) ( not ( = ?auto_18832 ?auto_18837 ) ) ( not ( = ?auto_18832 ?auto_18836 ) ) ( not ( = ?auto_18832 ?auto_18839 ) ) ( not ( = ?auto_18812 ?auto_18817 ) ) ( not ( = ?auto_18812 ?auto_18833 ) ) ( not ( = ?auto_18813 ?auto_18817 ) ) ( not ( = ?auto_18813 ?auto_18833 ) ) ( not ( = ?auto_18814 ?auto_18817 ) ) ( not ( = ?auto_18814 ?auto_18833 ) ) ( not ( = ?auto_18815 ?auto_18817 ) ) ( not ( = ?auto_18815 ?auto_18833 ) ) ( not ( = ?auto_18817 ?auto_18832 ) ) ( not ( = ?auto_18817 ?auto_18837 ) ) ( not ( = ?auto_18817 ?auto_18836 ) ) ( not ( = ?auto_18817 ?auto_18839 ) ) ( not ( = ?auto_18826 ?auto_18835 ) ) ( not ( = ?auto_18826 ?auto_18841 ) ) ( not ( = ?auto_18826 ?auto_18840 ) ) ( not ( = ?auto_18828 ?auto_18838 ) ) ( not ( = ?auto_18828 ?auto_18831 ) ) ( not ( = ?auto_18828 ?auto_18834 ) ) ( not ( = ?auto_18833 ?auto_18832 ) ) ( not ( = ?auto_18833 ?auto_18837 ) ) ( not ( = ?auto_18833 ?auto_18836 ) ) ( not ( = ?auto_18833 ?auto_18839 ) ) ( not ( = ?auto_18812 ?auto_18818 ) ) ( not ( = ?auto_18812 ?auto_18830 ) ) ( not ( = ?auto_18813 ?auto_18818 ) ) ( not ( = ?auto_18813 ?auto_18830 ) ) ( not ( = ?auto_18814 ?auto_18818 ) ) ( not ( = ?auto_18814 ?auto_18830 ) ) ( not ( = ?auto_18815 ?auto_18818 ) ) ( not ( = ?auto_18815 ?auto_18830 ) ) ( not ( = ?auto_18816 ?auto_18818 ) ) ( not ( = ?auto_18816 ?auto_18830 ) ) ( not ( = ?auto_18818 ?auto_18833 ) ) ( not ( = ?auto_18818 ?auto_18832 ) ) ( not ( = ?auto_18818 ?auto_18837 ) ) ( not ( = ?auto_18818 ?auto_18836 ) ) ( not ( = ?auto_18818 ?auto_18839 ) ) ( not ( = ?auto_18829 ?auto_18826 ) ) ( not ( = ?auto_18829 ?auto_18835 ) ) ( not ( = ?auto_18829 ?auto_18841 ) ) ( not ( = ?auto_18829 ?auto_18840 ) ) ( not ( = ?auto_18827 ?auto_18828 ) ) ( not ( = ?auto_18827 ?auto_18838 ) ) ( not ( = ?auto_18827 ?auto_18831 ) ) ( not ( = ?auto_18827 ?auto_18834 ) ) ( not ( = ?auto_18830 ?auto_18833 ) ) ( not ( = ?auto_18830 ?auto_18832 ) ) ( not ( = ?auto_18830 ?auto_18837 ) ) ( not ( = ?auto_18830 ?auto_18836 ) ) ( not ( = ?auto_18830 ?auto_18839 ) ) ( not ( = ?auto_18812 ?auto_18819 ) ) ( not ( = ?auto_18812 ?auto_18820 ) ) ( not ( = ?auto_18813 ?auto_18819 ) ) ( not ( = ?auto_18813 ?auto_18820 ) ) ( not ( = ?auto_18814 ?auto_18819 ) ) ( not ( = ?auto_18814 ?auto_18820 ) ) ( not ( = ?auto_18815 ?auto_18819 ) ) ( not ( = ?auto_18815 ?auto_18820 ) ) ( not ( = ?auto_18816 ?auto_18819 ) ) ( not ( = ?auto_18816 ?auto_18820 ) ) ( not ( = ?auto_18817 ?auto_18819 ) ) ( not ( = ?auto_18817 ?auto_18820 ) ) ( not ( = ?auto_18819 ?auto_18830 ) ) ( not ( = ?auto_18819 ?auto_18833 ) ) ( not ( = ?auto_18819 ?auto_18832 ) ) ( not ( = ?auto_18819 ?auto_18837 ) ) ( not ( = ?auto_18819 ?auto_18836 ) ) ( not ( = ?auto_18819 ?auto_18839 ) ) ( not ( = ?auto_18821 ?auto_18829 ) ) ( not ( = ?auto_18821 ?auto_18826 ) ) ( not ( = ?auto_18821 ?auto_18835 ) ) ( not ( = ?auto_18821 ?auto_18841 ) ) ( not ( = ?auto_18821 ?auto_18840 ) ) ( not ( = ?auto_18822 ?auto_18827 ) ) ( not ( = ?auto_18822 ?auto_18828 ) ) ( not ( = ?auto_18822 ?auto_18838 ) ) ( not ( = ?auto_18822 ?auto_18831 ) ) ( not ( = ?auto_18822 ?auto_18834 ) ) ( not ( = ?auto_18820 ?auto_18830 ) ) ( not ( = ?auto_18820 ?auto_18833 ) ) ( not ( = ?auto_18820 ?auto_18832 ) ) ( not ( = ?auto_18820 ?auto_18837 ) ) ( not ( = ?auto_18820 ?auto_18836 ) ) ( not ( = ?auto_18820 ?auto_18839 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_18812 ?auto_18813 ?auto_18814 ?auto_18815 ?auto_18816 ?auto_18817 ?auto_18818 )
      ( MAKE-1CRATE ?auto_18818 ?auto_18819 )
      ( MAKE-7CRATE-VERIFY ?auto_18812 ?auto_18813 ?auto_18814 ?auto_18815 ?auto_18816 ?auto_18817 ?auto_18818 ?auto_18819 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18844 - SURFACE
      ?auto_18845 - SURFACE
    )
    :vars
    (
      ?auto_18846 - HOIST
      ?auto_18847 - PLACE
      ?auto_18849 - PLACE
      ?auto_18850 - HOIST
      ?auto_18851 - SURFACE
      ?auto_18848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18846 ?auto_18847 ) ( SURFACE-AT ?auto_18844 ?auto_18847 ) ( CLEAR ?auto_18844 ) ( IS-CRATE ?auto_18845 ) ( AVAILABLE ?auto_18846 ) ( not ( = ?auto_18849 ?auto_18847 ) ) ( HOIST-AT ?auto_18850 ?auto_18849 ) ( AVAILABLE ?auto_18850 ) ( SURFACE-AT ?auto_18845 ?auto_18849 ) ( ON ?auto_18845 ?auto_18851 ) ( CLEAR ?auto_18845 ) ( TRUCK-AT ?auto_18848 ?auto_18847 ) ( not ( = ?auto_18844 ?auto_18845 ) ) ( not ( = ?auto_18844 ?auto_18851 ) ) ( not ( = ?auto_18845 ?auto_18851 ) ) ( not ( = ?auto_18846 ?auto_18850 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18848 ?auto_18847 ?auto_18849 )
      ( !LIFT ?auto_18850 ?auto_18845 ?auto_18851 ?auto_18849 )
      ( !LOAD ?auto_18850 ?auto_18845 ?auto_18848 ?auto_18849 )
      ( !DRIVE ?auto_18848 ?auto_18849 ?auto_18847 )
      ( !UNLOAD ?auto_18846 ?auto_18845 ?auto_18848 ?auto_18847 )
      ( !DROP ?auto_18846 ?auto_18845 ?auto_18844 ?auto_18847 )
      ( MAKE-1CRATE-VERIFY ?auto_18844 ?auto_18845 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_18861 - SURFACE
      ?auto_18862 - SURFACE
      ?auto_18863 - SURFACE
      ?auto_18864 - SURFACE
      ?auto_18865 - SURFACE
      ?auto_18866 - SURFACE
      ?auto_18867 - SURFACE
      ?auto_18869 - SURFACE
      ?auto_18868 - SURFACE
    )
    :vars
    (
      ?auto_18875 - HOIST
      ?auto_18874 - PLACE
      ?auto_18871 - PLACE
      ?auto_18870 - HOIST
      ?auto_18872 - SURFACE
      ?auto_18884 - PLACE
      ?auto_18880 - HOIST
      ?auto_18885 - SURFACE
      ?auto_18886 - PLACE
      ?auto_18887 - HOIST
      ?auto_18876 - SURFACE
      ?auto_18890 - PLACE
      ?auto_18888 - HOIST
      ?auto_18879 - SURFACE
      ?auto_18894 - PLACE
      ?auto_18882 - HOIST
      ?auto_18878 - SURFACE
      ?auto_18891 - PLACE
      ?auto_18877 - HOIST
      ?auto_18881 - SURFACE
      ?auto_18889 - PLACE
      ?auto_18892 - HOIST
      ?auto_18893 - SURFACE
      ?auto_18883 - SURFACE
      ?auto_18873 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18875 ?auto_18874 ) ( IS-CRATE ?auto_18868 ) ( not ( = ?auto_18871 ?auto_18874 ) ) ( HOIST-AT ?auto_18870 ?auto_18871 ) ( AVAILABLE ?auto_18870 ) ( SURFACE-AT ?auto_18868 ?auto_18871 ) ( ON ?auto_18868 ?auto_18872 ) ( CLEAR ?auto_18868 ) ( not ( = ?auto_18869 ?auto_18868 ) ) ( not ( = ?auto_18869 ?auto_18872 ) ) ( not ( = ?auto_18868 ?auto_18872 ) ) ( not ( = ?auto_18875 ?auto_18870 ) ) ( IS-CRATE ?auto_18869 ) ( not ( = ?auto_18884 ?auto_18874 ) ) ( HOIST-AT ?auto_18880 ?auto_18884 ) ( AVAILABLE ?auto_18880 ) ( SURFACE-AT ?auto_18869 ?auto_18884 ) ( ON ?auto_18869 ?auto_18885 ) ( CLEAR ?auto_18869 ) ( not ( = ?auto_18867 ?auto_18869 ) ) ( not ( = ?auto_18867 ?auto_18885 ) ) ( not ( = ?auto_18869 ?auto_18885 ) ) ( not ( = ?auto_18875 ?auto_18880 ) ) ( IS-CRATE ?auto_18867 ) ( not ( = ?auto_18886 ?auto_18874 ) ) ( HOIST-AT ?auto_18887 ?auto_18886 ) ( AVAILABLE ?auto_18887 ) ( SURFACE-AT ?auto_18867 ?auto_18886 ) ( ON ?auto_18867 ?auto_18876 ) ( CLEAR ?auto_18867 ) ( not ( = ?auto_18866 ?auto_18867 ) ) ( not ( = ?auto_18866 ?auto_18876 ) ) ( not ( = ?auto_18867 ?auto_18876 ) ) ( not ( = ?auto_18875 ?auto_18887 ) ) ( IS-CRATE ?auto_18866 ) ( not ( = ?auto_18890 ?auto_18874 ) ) ( HOIST-AT ?auto_18888 ?auto_18890 ) ( AVAILABLE ?auto_18888 ) ( SURFACE-AT ?auto_18866 ?auto_18890 ) ( ON ?auto_18866 ?auto_18879 ) ( CLEAR ?auto_18866 ) ( not ( = ?auto_18865 ?auto_18866 ) ) ( not ( = ?auto_18865 ?auto_18879 ) ) ( not ( = ?auto_18866 ?auto_18879 ) ) ( not ( = ?auto_18875 ?auto_18888 ) ) ( IS-CRATE ?auto_18865 ) ( not ( = ?auto_18894 ?auto_18874 ) ) ( HOIST-AT ?auto_18882 ?auto_18894 ) ( SURFACE-AT ?auto_18865 ?auto_18894 ) ( ON ?auto_18865 ?auto_18878 ) ( CLEAR ?auto_18865 ) ( not ( = ?auto_18864 ?auto_18865 ) ) ( not ( = ?auto_18864 ?auto_18878 ) ) ( not ( = ?auto_18865 ?auto_18878 ) ) ( not ( = ?auto_18875 ?auto_18882 ) ) ( IS-CRATE ?auto_18864 ) ( not ( = ?auto_18891 ?auto_18874 ) ) ( HOIST-AT ?auto_18877 ?auto_18891 ) ( AVAILABLE ?auto_18877 ) ( SURFACE-AT ?auto_18864 ?auto_18891 ) ( ON ?auto_18864 ?auto_18881 ) ( CLEAR ?auto_18864 ) ( not ( = ?auto_18863 ?auto_18864 ) ) ( not ( = ?auto_18863 ?auto_18881 ) ) ( not ( = ?auto_18864 ?auto_18881 ) ) ( not ( = ?auto_18875 ?auto_18877 ) ) ( IS-CRATE ?auto_18863 ) ( not ( = ?auto_18889 ?auto_18874 ) ) ( HOIST-AT ?auto_18892 ?auto_18889 ) ( AVAILABLE ?auto_18892 ) ( SURFACE-AT ?auto_18863 ?auto_18889 ) ( ON ?auto_18863 ?auto_18893 ) ( CLEAR ?auto_18863 ) ( not ( = ?auto_18862 ?auto_18863 ) ) ( not ( = ?auto_18862 ?auto_18893 ) ) ( not ( = ?auto_18863 ?auto_18893 ) ) ( not ( = ?auto_18875 ?auto_18892 ) ) ( SURFACE-AT ?auto_18861 ?auto_18874 ) ( CLEAR ?auto_18861 ) ( IS-CRATE ?auto_18862 ) ( AVAILABLE ?auto_18875 ) ( AVAILABLE ?auto_18882 ) ( SURFACE-AT ?auto_18862 ?auto_18894 ) ( ON ?auto_18862 ?auto_18883 ) ( CLEAR ?auto_18862 ) ( TRUCK-AT ?auto_18873 ?auto_18874 ) ( not ( = ?auto_18861 ?auto_18862 ) ) ( not ( = ?auto_18861 ?auto_18883 ) ) ( not ( = ?auto_18862 ?auto_18883 ) ) ( not ( = ?auto_18861 ?auto_18863 ) ) ( not ( = ?auto_18861 ?auto_18893 ) ) ( not ( = ?auto_18863 ?auto_18883 ) ) ( not ( = ?auto_18889 ?auto_18894 ) ) ( not ( = ?auto_18892 ?auto_18882 ) ) ( not ( = ?auto_18893 ?auto_18883 ) ) ( not ( = ?auto_18861 ?auto_18864 ) ) ( not ( = ?auto_18861 ?auto_18881 ) ) ( not ( = ?auto_18862 ?auto_18864 ) ) ( not ( = ?auto_18862 ?auto_18881 ) ) ( not ( = ?auto_18864 ?auto_18893 ) ) ( not ( = ?auto_18864 ?auto_18883 ) ) ( not ( = ?auto_18891 ?auto_18889 ) ) ( not ( = ?auto_18891 ?auto_18894 ) ) ( not ( = ?auto_18877 ?auto_18892 ) ) ( not ( = ?auto_18877 ?auto_18882 ) ) ( not ( = ?auto_18881 ?auto_18893 ) ) ( not ( = ?auto_18881 ?auto_18883 ) ) ( not ( = ?auto_18861 ?auto_18865 ) ) ( not ( = ?auto_18861 ?auto_18878 ) ) ( not ( = ?auto_18862 ?auto_18865 ) ) ( not ( = ?auto_18862 ?auto_18878 ) ) ( not ( = ?auto_18863 ?auto_18865 ) ) ( not ( = ?auto_18863 ?auto_18878 ) ) ( not ( = ?auto_18865 ?auto_18881 ) ) ( not ( = ?auto_18865 ?auto_18893 ) ) ( not ( = ?auto_18865 ?auto_18883 ) ) ( not ( = ?auto_18878 ?auto_18881 ) ) ( not ( = ?auto_18878 ?auto_18893 ) ) ( not ( = ?auto_18878 ?auto_18883 ) ) ( not ( = ?auto_18861 ?auto_18866 ) ) ( not ( = ?auto_18861 ?auto_18879 ) ) ( not ( = ?auto_18862 ?auto_18866 ) ) ( not ( = ?auto_18862 ?auto_18879 ) ) ( not ( = ?auto_18863 ?auto_18866 ) ) ( not ( = ?auto_18863 ?auto_18879 ) ) ( not ( = ?auto_18864 ?auto_18866 ) ) ( not ( = ?auto_18864 ?auto_18879 ) ) ( not ( = ?auto_18866 ?auto_18878 ) ) ( not ( = ?auto_18866 ?auto_18881 ) ) ( not ( = ?auto_18866 ?auto_18893 ) ) ( not ( = ?auto_18866 ?auto_18883 ) ) ( not ( = ?auto_18890 ?auto_18894 ) ) ( not ( = ?auto_18890 ?auto_18891 ) ) ( not ( = ?auto_18890 ?auto_18889 ) ) ( not ( = ?auto_18888 ?auto_18882 ) ) ( not ( = ?auto_18888 ?auto_18877 ) ) ( not ( = ?auto_18888 ?auto_18892 ) ) ( not ( = ?auto_18879 ?auto_18878 ) ) ( not ( = ?auto_18879 ?auto_18881 ) ) ( not ( = ?auto_18879 ?auto_18893 ) ) ( not ( = ?auto_18879 ?auto_18883 ) ) ( not ( = ?auto_18861 ?auto_18867 ) ) ( not ( = ?auto_18861 ?auto_18876 ) ) ( not ( = ?auto_18862 ?auto_18867 ) ) ( not ( = ?auto_18862 ?auto_18876 ) ) ( not ( = ?auto_18863 ?auto_18867 ) ) ( not ( = ?auto_18863 ?auto_18876 ) ) ( not ( = ?auto_18864 ?auto_18867 ) ) ( not ( = ?auto_18864 ?auto_18876 ) ) ( not ( = ?auto_18865 ?auto_18867 ) ) ( not ( = ?auto_18865 ?auto_18876 ) ) ( not ( = ?auto_18867 ?auto_18879 ) ) ( not ( = ?auto_18867 ?auto_18878 ) ) ( not ( = ?auto_18867 ?auto_18881 ) ) ( not ( = ?auto_18867 ?auto_18893 ) ) ( not ( = ?auto_18867 ?auto_18883 ) ) ( not ( = ?auto_18886 ?auto_18890 ) ) ( not ( = ?auto_18886 ?auto_18894 ) ) ( not ( = ?auto_18886 ?auto_18891 ) ) ( not ( = ?auto_18886 ?auto_18889 ) ) ( not ( = ?auto_18887 ?auto_18888 ) ) ( not ( = ?auto_18887 ?auto_18882 ) ) ( not ( = ?auto_18887 ?auto_18877 ) ) ( not ( = ?auto_18887 ?auto_18892 ) ) ( not ( = ?auto_18876 ?auto_18879 ) ) ( not ( = ?auto_18876 ?auto_18878 ) ) ( not ( = ?auto_18876 ?auto_18881 ) ) ( not ( = ?auto_18876 ?auto_18893 ) ) ( not ( = ?auto_18876 ?auto_18883 ) ) ( not ( = ?auto_18861 ?auto_18869 ) ) ( not ( = ?auto_18861 ?auto_18885 ) ) ( not ( = ?auto_18862 ?auto_18869 ) ) ( not ( = ?auto_18862 ?auto_18885 ) ) ( not ( = ?auto_18863 ?auto_18869 ) ) ( not ( = ?auto_18863 ?auto_18885 ) ) ( not ( = ?auto_18864 ?auto_18869 ) ) ( not ( = ?auto_18864 ?auto_18885 ) ) ( not ( = ?auto_18865 ?auto_18869 ) ) ( not ( = ?auto_18865 ?auto_18885 ) ) ( not ( = ?auto_18866 ?auto_18869 ) ) ( not ( = ?auto_18866 ?auto_18885 ) ) ( not ( = ?auto_18869 ?auto_18876 ) ) ( not ( = ?auto_18869 ?auto_18879 ) ) ( not ( = ?auto_18869 ?auto_18878 ) ) ( not ( = ?auto_18869 ?auto_18881 ) ) ( not ( = ?auto_18869 ?auto_18893 ) ) ( not ( = ?auto_18869 ?auto_18883 ) ) ( not ( = ?auto_18884 ?auto_18886 ) ) ( not ( = ?auto_18884 ?auto_18890 ) ) ( not ( = ?auto_18884 ?auto_18894 ) ) ( not ( = ?auto_18884 ?auto_18891 ) ) ( not ( = ?auto_18884 ?auto_18889 ) ) ( not ( = ?auto_18880 ?auto_18887 ) ) ( not ( = ?auto_18880 ?auto_18888 ) ) ( not ( = ?auto_18880 ?auto_18882 ) ) ( not ( = ?auto_18880 ?auto_18877 ) ) ( not ( = ?auto_18880 ?auto_18892 ) ) ( not ( = ?auto_18885 ?auto_18876 ) ) ( not ( = ?auto_18885 ?auto_18879 ) ) ( not ( = ?auto_18885 ?auto_18878 ) ) ( not ( = ?auto_18885 ?auto_18881 ) ) ( not ( = ?auto_18885 ?auto_18893 ) ) ( not ( = ?auto_18885 ?auto_18883 ) ) ( not ( = ?auto_18861 ?auto_18868 ) ) ( not ( = ?auto_18861 ?auto_18872 ) ) ( not ( = ?auto_18862 ?auto_18868 ) ) ( not ( = ?auto_18862 ?auto_18872 ) ) ( not ( = ?auto_18863 ?auto_18868 ) ) ( not ( = ?auto_18863 ?auto_18872 ) ) ( not ( = ?auto_18864 ?auto_18868 ) ) ( not ( = ?auto_18864 ?auto_18872 ) ) ( not ( = ?auto_18865 ?auto_18868 ) ) ( not ( = ?auto_18865 ?auto_18872 ) ) ( not ( = ?auto_18866 ?auto_18868 ) ) ( not ( = ?auto_18866 ?auto_18872 ) ) ( not ( = ?auto_18867 ?auto_18868 ) ) ( not ( = ?auto_18867 ?auto_18872 ) ) ( not ( = ?auto_18868 ?auto_18885 ) ) ( not ( = ?auto_18868 ?auto_18876 ) ) ( not ( = ?auto_18868 ?auto_18879 ) ) ( not ( = ?auto_18868 ?auto_18878 ) ) ( not ( = ?auto_18868 ?auto_18881 ) ) ( not ( = ?auto_18868 ?auto_18893 ) ) ( not ( = ?auto_18868 ?auto_18883 ) ) ( not ( = ?auto_18871 ?auto_18884 ) ) ( not ( = ?auto_18871 ?auto_18886 ) ) ( not ( = ?auto_18871 ?auto_18890 ) ) ( not ( = ?auto_18871 ?auto_18894 ) ) ( not ( = ?auto_18871 ?auto_18891 ) ) ( not ( = ?auto_18871 ?auto_18889 ) ) ( not ( = ?auto_18870 ?auto_18880 ) ) ( not ( = ?auto_18870 ?auto_18887 ) ) ( not ( = ?auto_18870 ?auto_18888 ) ) ( not ( = ?auto_18870 ?auto_18882 ) ) ( not ( = ?auto_18870 ?auto_18877 ) ) ( not ( = ?auto_18870 ?auto_18892 ) ) ( not ( = ?auto_18872 ?auto_18885 ) ) ( not ( = ?auto_18872 ?auto_18876 ) ) ( not ( = ?auto_18872 ?auto_18879 ) ) ( not ( = ?auto_18872 ?auto_18878 ) ) ( not ( = ?auto_18872 ?auto_18881 ) ) ( not ( = ?auto_18872 ?auto_18893 ) ) ( not ( = ?auto_18872 ?auto_18883 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_18861 ?auto_18862 ?auto_18863 ?auto_18864 ?auto_18865 ?auto_18866 ?auto_18867 ?auto_18869 )
      ( MAKE-1CRATE ?auto_18869 ?auto_18868 )
      ( MAKE-8CRATE-VERIFY ?auto_18861 ?auto_18862 ?auto_18863 ?auto_18864 ?auto_18865 ?auto_18866 ?auto_18867 ?auto_18869 ?auto_18868 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18897 - SURFACE
      ?auto_18898 - SURFACE
    )
    :vars
    (
      ?auto_18899 - HOIST
      ?auto_18900 - PLACE
      ?auto_18902 - PLACE
      ?auto_18903 - HOIST
      ?auto_18904 - SURFACE
      ?auto_18901 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18899 ?auto_18900 ) ( SURFACE-AT ?auto_18897 ?auto_18900 ) ( CLEAR ?auto_18897 ) ( IS-CRATE ?auto_18898 ) ( AVAILABLE ?auto_18899 ) ( not ( = ?auto_18902 ?auto_18900 ) ) ( HOIST-AT ?auto_18903 ?auto_18902 ) ( AVAILABLE ?auto_18903 ) ( SURFACE-AT ?auto_18898 ?auto_18902 ) ( ON ?auto_18898 ?auto_18904 ) ( CLEAR ?auto_18898 ) ( TRUCK-AT ?auto_18901 ?auto_18900 ) ( not ( = ?auto_18897 ?auto_18898 ) ) ( not ( = ?auto_18897 ?auto_18904 ) ) ( not ( = ?auto_18898 ?auto_18904 ) ) ( not ( = ?auto_18899 ?auto_18903 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18901 ?auto_18900 ?auto_18902 )
      ( !LIFT ?auto_18903 ?auto_18898 ?auto_18904 ?auto_18902 )
      ( !LOAD ?auto_18903 ?auto_18898 ?auto_18901 ?auto_18902 )
      ( !DRIVE ?auto_18901 ?auto_18902 ?auto_18900 )
      ( !UNLOAD ?auto_18899 ?auto_18898 ?auto_18901 ?auto_18900 )
      ( !DROP ?auto_18899 ?auto_18898 ?auto_18897 ?auto_18900 )
      ( MAKE-1CRATE-VERIFY ?auto_18897 ?auto_18898 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_18915 - SURFACE
      ?auto_18916 - SURFACE
      ?auto_18917 - SURFACE
      ?auto_18918 - SURFACE
      ?auto_18919 - SURFACE
      ?auto_18920 - SURFACE
      ?auto_18921 - SURFACE
      ?auto_18924 - SURFACE
      ?auto_18923 - SURFACE
      ?auto_18922 - SURFACE
    )
    :vars
    (
      ?auto_18927 - HOIST
      ?auto_18930 - PLACE
      ?auto_18929 - PLACE
      ?auto_18926 - HOIST
      ?auto_18925 - SURFACE
      ?auto_18950 - PLACE
      ?auto_18938 - HOIST
      ?auto_18947 - SURFACE
      ?auto_18936 - PLACE
      ?auto_18946 - HOIST
      ?auto_18939 - SURFACE
      ?auto_18937 - PLACE
      ?auto_18940 - HOIST
      ?auto_18933 - SURFACE
      ?auto_18935 - PLACE
      ?auto_18941 - HOIST
      ?auto_18934 - SURFACE
      ?auto_18948 - PLACE
      ?auto_18944 - HOIST
      ?auto_18949 - SURFACE
      ?auto_18945 - SURFACE
      ?auto_18942 - PLACE
      ?auto_18931 - HOIST
      ?auto_18932 - SURFACE
      ?auto_18943 - SURFACE
      ?auto_18928 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18927 ?auto_18930 ) ( IS-CRATE ?auto_18922 ) ( not ( = ?auto_18929 ?auto_18930 ) ) ( HOIST-AT ?auto_18926 ?auto_18929 ) ( SURFACE-AT ?auto_18922 ?auto_18929 ) ( ON ?auto_18922 ?auto_18925 ) ( CLEAR ?auto_18922 ) ( not ( = ?auto_18923 ?auto_18922 ) ) ( not ( = ?auto_18923 ?auto_18925 ) ) ( not ( = ?auto_18922 ?auto_18925 ) ) ( not ( = ?auto_18927 ?auto_18926 ) ) ( IS-CRATE ?auto_18923 ) ( not ( = ?auto_18950 ?auto_18930 ) ) ( HOIST-AT ?auto_18938 ?auto_18950 ) ( AVAILABLE ?auto_18938 ) ( SURFACE-AT ?auto_18923 ?auto_18950 ) ( ON ?auto_18923 ?auto_18947 ) ( CLEAR ?auto_18923 ) ( not ( = ?auto_18924 ?auto_18923 ) ) ( not ( = ?auto_18924 ?auto_18947 ) ) ( not ( = ?auto_18923 ?auto_18947 ) ) ( not ( = ?auto_18927 ?auto_18938 ) ) ( IS-CRATE ?auto_18924 ) ( not ( = ?auto_18936 ?auto_18930 ) ) ( HOIST-AT ?auto_18946 ?auto_18936 ) ( AVAILABLE ?auto_18946 ) ( SURFACE-AT ?auto_18924 ?auto_18936 ) ( ON ?auto_18924 ?auto_18939 ) ( CLEAR ?auto_18924 ) ( not ( = ?auto_18921 ?auto_18924 ) ) ( not ( = ?auto_18921 ?auto_18939 ) ) ( not ( = ?auto_18924 ?auto_18939 ) ) ( not ( = ?auto_18927 ?auto_18946 ) ) ( IS-CRATE ?auto_18921 ) ( not ( = ?auto_18937 ?auto_18930 ) ) ( HOIST-AT ?auto_18940 ?auto_18937 ) ( AVAILABLE ?auto_18940 ) ( SURFACE-AT ?auto_18921 ?auto_18937 ) ( ON ?auto_18921 ?auto_18933 ) ( CLEAR ?auto_18921 ) ( not ( = ?auto_18920 ?auto_18921 ) ) ( not ( = ?auto_18920 ?auto_18933 ) ) ( not ( = ?auto_18921 ?auto_18933 ) ) ( not ( = ?auto_18927 ?auto_18940 ) ) ( IS-CRATE ?auto_18920 ) ( not ( = ?auto_18935 ?auto_18930 ) ) ( HOIST-AT ?auto_18941 ?auto_18935 ) ( AVAILABLE ?auto_18941 ) ( SURFACE-AT ?auto_18920 ?auto_18935 ) ( ON ?auto_18920 ?auto_18934 ) ( CLEAR ?auto_18920 ) ( not ( = ?auto_18919 ?auto_18920 ) ) ( not ( = ?auto_18919 ?auto_18934 ) ) ( not ( = ?auto_18920 ?auto_18934 ) ) ( not ( = ?auto_18927 ?auto_18941 ) ) ( IS-CRATE ?auto_18919 ) ( not ( = ?auto_18948 ?auto_18930 ) ) ( HOIST-AT ?auto_18944 ?auto_18948 ) ( SURFACE-AT ?auto_18919 ?auto_18948 ) ( ON ?auto_18919 ?auto_18949 ) ( CLEAR ?auto_18919 ) ( not ( = ?auto_18918 ?auto_18919 ) ) ( not ( = ?auto_18918 ?auto_18949 ) ) ( not ( = ?auto_18919 ?auto_18949 ) ) ( not ( = ?auto_18927 ?auto_18944 ) ) ( IS-CRATE ?auto_18918 ) ( AVAILABLE ?auto_18926 ) ( SURFACE-AT ?auto_18918 ?auto_18929 ) ( ON ?auto_18918 ?auto_18945 ) ( CLEAR ?auto_18918 ) ( not ( = ?auto_18917 ?auto_18918 ) ) ( not ( = ?auto_18917 ?auto_18945 ) ) ( not ( = ?auto_18918 ?auto_18945 ) ) ( IS-CRATE ?auto_18917 ) ( not ( = ?auto_18942 ?auto_18930 ) ) ( HOIST-AT ?auto_18931 ?auto_18942 ) ( AVAILABLE ?auto_18931 ) ( SURFACE-AT ?auto_18917 ?auto_18942 ) ( ON ?auto_18917 ?auto_18932 ) ( CLEAR ?auto_18917 ) ( not ( = ?auto_18916 ?auto_18917 ) ) ( not ( = ?auto_18916 ?auto_18932 ) ) ( not ( = ?auto_18917 ?auto_18932 ) ) ( not ( = ?auto_18927 ?auto_18931 ) ) ( SURFACE-AT ?auto_18915 ?auto_18930 ) ( CLEAR ?auto_18915 ) ( IS-CRATE ?auto_18916 ) ( AVAILABLE ?auto_18927 ) ( AVAILABLE ?auto_18944 ) ( SURFACE-AT ?auto_18916 ?auto_18948 ) ( ON ?auto_18916 ?auto_18943 ) ( CLEAR ?auto_18916 ) ( TRUCK-AT ?auto_18928 ?auto_18930 ) ( not ( = ?auto_18915 ?auto_18916 ) ) ( not ( = ?auto_18915 ?auto_18943 ) ) ( not ( = ?auto_18916 ?auto_18943 ) ) ( not ( = ?auto_18915 ?auto_18917 ) ) ( not ( = ?auto_18915 ?auto_18932 ) ) ( not ( = ?auto_18917 ?auto_18943 ) ) ( not ( = ?auto_18942 ?auto_18948 ) ) ( not ( = ?auto_18931 ?auto_18944 ) ) ( not ( = ?auto_18932 ?auto_18943 ) ) ( not ( = ?auto_18915 ?auto_18918 ) ) ( not ( = ?auto_18915 ?auto_18945 ) ) ( not ( = ?auto_18916 ?auto_18918 ) ) ( not ( = ?auto_18916 ?auto_18945 ) ) ( not ( = ?auto_18918 ?auto_18932 ) ) ( not ( = ?auto_18918 ?auto_18943 ) ) ( not ( = ?auto_18929 ?auto_18942 ) ) ( not ( = ?auto_18929 ?auto_18948 ) ) ( not ( = ?auto_18926 ?auto_18931 ) ) ( not ( = ?auto_18926 ?auto_18944 ) ) ( not ( = ?auto_18945 ?auto_18932 ) ) ( not ( = ?auto_18945 ?auto_18943 ) ) ( not ( = ?auto_18915 ?auto_18919 ) ) ( not ( = ?auto_18915 ?auto_18949 ) ) ( not ( = ?auto_18916 ?auto_18919 ) ) ( not ( = ?auto_18916 ?auto_18949 ) ) ( not ( = ?auto_18917 ?auto_18919 ) ) ( not ( = ?auto_18917 ?auto_18949 ) ) ( not ( = ?auto_18919 ?auto_18945 ) ) ( not ( = ?auto_18919 ?auto_18932 ) ) ( not ( = ?auto_18919 ?auto_18943 ) ) ( not ( = ?auto_18949 ?auto_18945 ) ) ( not ( = ?auto_18949 ?auto_18932 ) ) ( not ( = ?auto_18949 ?auto_18943 ) ) ( not ( = ?auto_18915 ?auto_18920 ) ) ( not ( = ?auto_18915 ?auto_18934 ) ) ( not ( = ?auto_18916 ?auto_18920 ) ) ( not ( = ?auto_18916 ?auto_18934 ) ) ( not ( = ?auto_18917 ?auto_18920 ) ) ( not ( = ?auto_18917 ?auto_18934 ) ) ( not ( = ?auto_18918 ?auto_18920 ) ) ( not ( = ?auto_18918 ?auto_18934 ) ) ( not ( = ?auto_18920 ?auto_18949 ) ) ( not ( = ?auto_18920 ?auto_18945 ) ) ( not ( = ?auto_18920 ?auto_18932 ) ) ( not ( = ?auto_18920 ?auto_18943 ) ) ( not ( = ?auto_18935 ?auto_18948 ) ) ( not ( = ?auto_18935 ?auto_18929 ) ) ( not ( = ?auto_18935 ?auto_18942 ) ) ( not ( = ?auto_18941 ?auto_18944 ) ) ( not ( = ?auto_18941 ?auto_18926 ) ) ( not ( = ?auto_18941 ?auto_18931 ) ) ( not ( = ?auto_18934 ?auto_18949 ) ) ( not ( = ?auto_18934 ?auto_18945 ) ) ( not ( = ?auto_18934 ?auto_18932 ) ) ( not ( = ?auto_18934 ?auto_18943 ) ) ( not ( = ?auto_18915 ?auto_18921 ) ) ( not ( = ?auto_18915 ?auto_18933 ) ) ( not ( = ?auto_18916 ?auto_18921 ) ) ( not ( = ?auto_18916 ?auto_18933 ) ) ( not ( = ?auto_18917 ?auto_18921 ) ) ( not ( = ?auto_18917 ?auto_18933 ) ) ( not ( = ?auto_18918 ?auto_18921 ) ) ( not ( = ?auto_18918 ?auto_18933 ) ) ( not ( = ?auto_18919 ?auto_18921 ) ) ( not ( = ?auto_18919 ?auto_18933 ) ) ( not ( = ?auto_18921 ?auto_18934 ) ) ( not ( = ?auto_18921 ?auto_18949 ) ) ( not ( = ?auto_18921 ?auto_18945 ) ) ( not ( = ?auto_18921 ?auto_18932 ) ) ( not ( = ?auto_18921 ?auto_18943 ) ) ( not ( = ?auto_18937 ?auto_18935 ) ) ( not ( = ?auto_18937 ?auto_18948 ) ) ( not ( = ?auto_18937 ?auto_18929 ) ) ( not ( = ?auto_18937 ?auto_18942 ) ) ( not ( = ?auto_18940 ?auto_18941 ) ) ( not ( = ?auto_18940 ?auto_18944 ) ) ( not ( = ?auto_18940 ?auto_18926 ) ) ( not ( = ?auto_18940 ?auto_18931 ) ) ( not ( = ?auto_18933 ?auto_18934 ) ) ( not ( = ?auto_18933 ?auto_18949 ) ) ( not ( = ?auto_18933 ?auto_18945 ) ) ( not ( = ?auto_18933 ?auto_18932 ) ) ( not ( = ?auto_18933 ?auto_18943 ) ) ( not ( = ?auto_18915 ?auto_18924 ) ) ( not ( = ?auto_18915 ?auto_18939 ) ) ( not ( = ?auto_18916 ?auto_18924 ) ) ( not ( = ?auto_18916 ?auto_18939 ) ) ( not ( = ?auto_18917 ?auto_18924 ) ) ( not ( = ?auto_18917 ?auto_18939 ) ) ( not ( = ?auto_18918 ?auto_18924 ) ) ( not ( = ?auto_18918 ?auto_18939 ) ) ( not ( = ?auto_18919 ?auto_18924 ) ) ( not ( = ?auto_18919 ?auto_18939 ) ) ( not ( = ?auto_18920 ?auto_18924 ) ) ( not ( = ?auto_18920 ?auto_18939 ) ) ( not ( = ?auto_18924 ?auto_18933 ) ) ( not ( = ?auto_18924 ?auto_18934 ) ) ( not ( = ?auto_18924 ?auto_18949 ) ) ( not ( = ?auto_18924 ?auto_18945 ) ) ( not ( = ?auto_18924 ?auto_18932 ) ) ( not ( = ?auto_18924 ?auto_18943 ) ) ( not ( = ?auto_18936 ?auto_18937 ) ) ( not ( = ?auto_18936 ?auto_18935 ) ) ( not ( = ?auto_18936 ?auto_18948 ) ) ( not ( = ?auto_18936 ?auto_18929 ) ) ( not ( = ?auto_18936 ?auto_18942 ) ) ( not ( = ?auto_18946 ?auto_18940 ) ) ( not ( = ?auto_18946 ?auto_18941 ) ) ( not ( = ?auto_18946 ?auto_18944 ) ) ( not ( = ?auto_18946 ?auto_18926 ) ) ( not ( = ?auto_18946 ?auto_18931 ) ) ( not ( = ?auto_18939 ?auto_18933 ) ) ( not ( = ?auto_18939 ?auto_18934 ) ) ( not ( = ?auto_18939 ?auto_18949 ) ) ( not ( = ?auto_18939 ?auto_18945 ) ) ( not ( = ?auto_18939 ?auto_18932 ) ) ( not ( = ?auto_18939 ?auto_18943 ) ) ( not ( = ?auto_18915 ?auto_18923 ) ) ( not ( = ?auto_18915 ?auto_18947 ) ) ( not ( = ?auto_18916 ?auto_18923 ) ) ( not ( = ?auto_18916 ?auto_18947 ) ) ( not ( = ?auto_18917 ?auto_18923 ) ) ( not ( = ?auto_18917 ?auto_18947 ) ) ( not ( = ?auto_18918 ?auto_18923 ) ) ( not ( = ?auto_18918 ?auto_18947 ) ) ( not ( = ?auto_18919 ?auto_18923 ) ) ( not ( = ?auto_18919 ?auto_18947 ) ) ( not ( = ?auto_18920 ?auto_18923 ) ) ( not ( = ?auto_18920 ?auto_18947 ) ) ( not ( = ?auto_18921 ?auto_18923 ) ) ( not ( = ?auto_18921 ?auto_18947 ) ) ( not ( = ?auto_18923 ?auto_18939 ) ) ( not ( = ?auto_18923 ?auto_18933 ) ) ( not ( = ?auto_18923 ?auto_18934 ) ) ( not ( = ?auto_18923 ?auto_18949 ) ) ( not ( = ?auto_18923 ?auto_18945 ) ) ( not ( = ?auto_18923 ?auto_18932 ) ) ( not ( = ?auto_18923 ?auto_18943 ) ) ( not ( = ?auto_18950 ?auto_18936 ) ) ( not ( = ?auto_18950 ?auto_18937 ) ) ( not ( = ?auto_18950 ?auto_18935 ) ) ( not ( = ?auto_18950 ?auto_18948 ) ) ( not ( = ?auto_18950 ?auto_18929 ) ) ( not ( = ?auto_18950 ?auto_18942 ) ) ( not ( = ?auto_18938 ?auto_18946 ) ) ( not ( = ?auto_18938 ?auto_18940 ) ) ( not ( = ?auto_18938 ?auto_18941 ) ) ( not ( = ?auto_18938 ?auto_18944 ) ) ( not ( = ?auto_18938 ?auto_18926 ) ) ( not ( = ?auto_18938 ?auto_18931 ) ) ( not ( = ?auto_18947 ?auto_18939 ) ) ( not ( = ?auto_18947 ?auto_18933 ) ) ( not ( = ?auto_18947 ?auto_18934 ) ) ( not ( = ?auto_18947 ?auto_18949 ) ) ( not ( = ?auto_18947 ?auto_18945 ) ) ( not ( = ?auto_18947 ?auto_18932 ) ) ( not ( = ?auto_18947 ?auto_18943 ) ) ( not ( = ?auto_18915 ?auto_18922 ) ) ( not ( = ?auto_18915 ?auto_18925 ) ) ( not ( = ?auto_18916 ?auto_18922 ) ) ( not ( = ?auto_18916 ?auto_18925 ) ) ( not ( = ?auto_18917 ?auto_18922 ) ) ( not ( = ?auto_18917 ?auto_18925 ) ) ( not ( = ?auto_18918 ?auto_18922 ) ) ( not ( = ?auto_18918 ?auto_18925 ) ) ( not ( = ?auto_18919 ?auto_18922 ) ) ( not ( = ?auto_18919 ?auto_18925 ) ) ( not ( = ?auto_18920 ?auto_18922 ) ) ( not ( = ?auto_18920 ?auto_18925 ) ) ( not ( = ?auto_18921 ?auto_18922 ) ) ( not ( = ?auto_18921 ?auto_18925 ) ) ( not ( = ?auto_18924 ?auto_18922 ) ) ( not ( = ?auto_18924 ?auto_18925 ) ) ( not ( = ?auto_18922 ?auto_18947 ) ) ( not ( = ?auto_18922 ?auto_18939 ) ) ( not ( = ?auto_18922 ?auto_18933 ) ) ( not ( = ?auto_18922 ?auto_18934 ) ) ( not ( = ?auto_18922 ?auto_18949 ) ) ( not ( = ?auto_18922 ?auto_18945 ) ) ( not ( = ?auto_18922 ?auto_18932 ) ) ( not ( = ?auto_18922 ?auto_18943 ) ) ( not ( = ?auto_18925 ?auto_18947 ) ) ( not ( = ?auto_18925 ?auto_18939 ) ) ( not ( = ?auto_18925 ?auto_18933 ) ) ( not ( = ?auto_18925 ?auto_18934 ) ) ( not ( = ?auto_18925 ?auto_18949 ) ) ( not ( = ?auto_18925 ?auto_18945 ) ) ( not ( = ?auto_18925 ?auto_18932 ) ) ( not ( = ?auto_18925 ?auto_18943 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_18915 ?auto_18916 ?auto_18917 ?auto_18918 ?auto_18919 ?auto_18920 ?auto_18921 ?auto_18924 ?auto_18923 )
      ( MAKE-1CRATE ?auto_18923 ?auto_18922 )
      ( MAKE-9CRATE-VERIFY ?auto_18915 ?auto_18916 ?auto_18917 ?auto_18918 ?auto_18919 ?auto_18920 ?auto_18921 ?auto_18924 ?auto_18923 ?auto_18922 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18953 - SURFACE
      ?auto_18954 - SURFACE
    )
    :vars
    (
      ?auto_18955 - HOIST
      ?auto_18956 - PLACE
      ?auto_18958 - PLACE
      ?auto_18959 - HOIST
      ?auto_18960 - SURFACE
      ?auto_18957 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18955 ?auto_18956 ) ( SURFACE-AT ?auto_18953 ?auto_18956 ) ( CLEAR ?auto_18953 ) ( IS-CRATE ?auto_18954 ) ( AVAILABLE ?auto_18955 ) ( not ( = ?auto_18958 ?auto_18956 ) ) ( HOIST-AT ?auto_18959 ?auto_18958 ) ( AVAILABLE ?auto_18959 ) ( SURFACE-AT ?auto_18954 ?auto_18958 ) ( ON ?auto_18954 ?auto_18960 ) ( CLEAR ?auto_18954 ) ( TRUCK-AT ?auto_18957 ?auto_18956 ) ( not ( = ?auto_18953 ?auto_18954 ) ) ( not ( = ?auto_18953 ?auto_18960 ) ) ( not ( = ?auto_18954 ?auto_18960 ) ) ( not ( = ?auto_18955 ?auto_18959 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18957 ?auto_18956 ?auto_18958 )
      ( !LIFT ?auto_18959 ?auto_18954 ?auto_18960 ?auto_18958 )
      ( !LOAD ?auto_18959 ?auto_18954 ?auto_18957 ?auto_18958 )
      ( !DRIVE ?auto_18957 ?auto_18958 ?auto_18956 )
      ( !UNLOAD ?auto_18955 ?auto_18954 ?auto_18957 ?auto_18956 )
      ( !DROP ?auto_18955 ?auto_18954 ?auto_18953 ?auto_18956 )
      ( MAKE-1CRATE-VERIFY ?auto_18953 ?auto_18954 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_18972 - SURFACE
      ?auto_18973 - SURFACE
      ?auto_18974 - SURFACE
      ?auto_18975 - SURFACE
      ?auto_18976 - SURFACE
      ?auto_18977 - SURFACE
      ?auto_18978 - SURFACE
      ?auto_18981 - SURFACE
      ?auto_18980 - SURFACE
      ?auto_18979 - SURFACE
      ?auto_18982 - SURFACE
    )
    :vars
    (
      ?auto_18984 - HOIST
      ?auto_18986 - PLACE
      ?auto_18985 - PLACE
      ?auto_18983 - HOIST
      ?auto_18987 - SURFACE
      ?auto_18996 - PLACE
      ?auto_18997 - HOIST
      ?auto_19004 - SURFACE
      ?auto_19009 - PLACE
      ?auto_18993 - HOIST
      ?auto_18998 - SURFACE
      ?auto_18995 - PLACE
      ?auto_19005 - HOIST
      ?auto_18999 - SURFACE
      ?auto_18994 - PLACE
      ?auto_19007 - HOIST
      ?auto_19008 - SURFACE
      ?auto_19002 - SURFACE
      ?auto_19001 - PLACE
      ?auto_18992 - HOIST
      ?auto_18989 - SURFACE
      ?auto_18990 - SURFACE
      ?auto_19006 - PLACE
      ?auto_19000 - HOIST
      ?auto_19003 - SURFACE
      ?auto_18991 - SURFACE
      ?auto_18988 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18984 ?auto_18986 ) ( IS-CRATE ?auto_18982 ) ( not ( = ?auto_18985 ?auto_18986 ) ) ( HOIST-AT ?auto_18983 ?auto_18985 ) ( SURFACE-AT ?auto_18982 ?auto_18985 ) ( ON ?auto_18982 ?auto_18987 ) ( CLEAR ?auto_18982 ) ( not ( = ?auto_18979 ?auto_18982 ) ) ( not ( = ?auto_18979 ?auto_18987 ) ) ( not ( = ?auto_18982 ?auto_18987 ) ) ( not ( = ?auto_18984 ?auto_18983 ) ) ( IS-CRATE ?auto_18979 ) ( not ( = ?auto_18996 ?auto_18986 ) ) ( HOIST-AT ?auto_18997 ?auto_18996 ) ( SURFACE-AT ?auto_18979 ?auto_18996 ) ( ON ?auto_18979 ?auto_19004 ) ( CLEAR ?auto_18979 ) ( not ( = ?auto_18980 ?auto_18979 ) ) ( not ( = ?auto_18980 ?auto_19004 ) ) ( not ( = ?auto_18979 ?auto_19004 ) ) ( not ( = ?auto_18984 ?auto_18997 ) ) ( IS-CRATE ?auto_18980 ) ( not ( = ?auto_19009 ?auto_18986 ) ) ( HOIST-AT ?auto_18993 ?auto_19009 ) ( AVAILABLE ?auto_18993 ) ( SURFACE-AT ?auto_18980 ?auto_19009 ) ( ON ?auto_18980 ?auto_18998 ) ( CLEAR ?auto_18980 ) ( not ( = ?auto_18981 ?auto_18980 ) ) ( not ( = ?auto_18981 ?auto_18998 ) ) ( not ( = ?auto_18980 ?auto_18998 ) ) ( not ( = ?auto_18984 ?auto_18993 ) ) ( IS-CRATE ?auto_18981 ) ( not ( = ?auto_18995 ?auto_18986 ) ) ( HOIST-AT ?auto_19005 ?auto_18995 ) ( AVAILABLE ?auto_19005 ) ( SURFACE-AT ?auto_18981 ?auto_18995 ) ( ON ?auto_18981 ?auto_18999 ) ( CLEAR ?auto_18981 ) ( not ( = ?auto_18978 ?auto_18981 ) ) ( not ( = ?auto_18978 ?auto_18999 ) ) ( not ( = ?auto_18981 ?auto_18999 ) ) ( not ( = ?auto_18984 ?auto_19005 ) ) ( IS-CRATE ?auto_18978 ) ( not ( = ?auto_18994 ?auto_18986 ) ) ( HOIST-AT ?auto_19007 ?auto_18994 ) ( AVAILABLE ?auto_19007 ) ( SURFACE-AT ?auto_18978 ?auto_18994 ) ( ON ?auto_18978 ?auto_19008 ) ( CLEAR ?auto_18978 ) ( not ( = ?auto_18977 ?auto_18978 ) ) ( not ( = ?auto_18977 ?auto_19008 ) ) ( not ( = ?auto_18978 ?auto_19008 ) ) ( not ( = ?auto_18984 ?auto_19007 ) ) ( IS-CRATE ?auto_18977 ) ( AVAILABLE ?auto_18983 ) ( SURFACE-AT ?auto_18977 ?auto_18985 ) ( ON ?auto_18977 ?auto_19002 ) ( CLEAR ?auto_18977 ) ( not ( = ?auto_18976 ?auto_18977 ) ) ( not ( = ?auto_18976 ?auto_19002 ) ) ( not ( = ?auto_18977 ?auto_19002 ) ) ( IS-CRATE ?auto_18976 ) ( not ( = ?auto_19001 ?auto_18986 ) ) ( HOIST-AT ?auto_18992 ?auto_19001 ) ( SURFACE-AT ?auto_18976 ?auto_19001 ) ( ON ?auto_18976 ?auto_18989 ) ( CLEAR ?auto_18976 ) ( not ( = ?auto_18975 ?auto_18976 ) ) ( not ( = ?auto_18975 ?auto_18989 ) ) ( not ( = ?auto_18976 ?auto_18989 ) ) ( not ( = ?auto_18984 ?auto_18992 ) ) ( IS-CRATE ?auto_18975 ) ( AVAILABLE ?auto_18997 ) ( SURFACE-AT ?auto_18975 ?auto_18996 ) ( ON ?auto_18975 ?auto_18990 ) ( CLEAR ?auto_18975 ) ( not ( = ?auto_18974 ?auto_18975 ) ) ( not ( = ?auto_18974 ?auto_18990 ) ) ( not ( = ?auto_18975 ?auto_18990 ) ) ( IS-CRATE ?auto_18974 ) ( not ( = ?auto_19006 ?auto_18986 ) ) ( HOIST-AT ?auto_19000 ?auto_19006 ) ( AVAILABLE ?auto_19000 ) ( SURFACE-AT ?auto_18974 ?auto_19006 ) ( ON ?auto_18974 ?auto_19003 ) ( CLEAR ?auto_18974 ) ( not ( = ?auto_18973 ?auto_18974 ) ) ( not ( = ?auto_18973 ?auto_19003 ) ) ( not ( = ?auto_18974 ?auto_19003 ) ) ( not ( = ?auto_18984 ?auto_19000 ) ) ( SURFACE-AT ?auto_18972 ?auto_18986 ) ( CLEAR ?auto_18972 ) ( IS-CRATE ?auto_18973 ) ( AVAILABLE ?auto_18984 ) ( AVAILABLE ?auto_18992 ) ( SURFACE-AT ?auto_18973 ?auto_19001 ) ( ON ?auto_18973 ?auto_18991 ) ( CLEAR ?auto_18973 ) ( TRUCK-AT ?auto_18988 ?auto_18986 ) ( not ( = ?auto_18972 ?auto_18973 ) ) ( not ( = ?auto_18972 ?auto_18991 ) ) ( not ( = ?auto_18973 ?auto_18991 ) ) ( not ( = ?auto_18972 ?auto_18974 ) ) ( not ( = ?auto_18972 ?auto_19003 ) ) ( not ( = ?auto_18974 ?auto_18991 ) ) ( not ( = ?auto_19006 ?auto_19001 ) ) ( not ( = ?auto_19000 ?auto_18992 ) ) ( not ( = ?auto_19003 ?auto_18991 ) ) ( not ( = ?auto_18972 ?auto_18975 ) ) ( not ( = ?auto_18972 ?auto_18990 ) ) ( not ( = ?auto_18973 ?auto_18975 ) ) ( not ( = ?auto_18973 ?auto_18990 ) ) ( not ( = ?auto_18975 ?auto_19003 ) ) ( not ( = ?auto_18975 ?auto_18991 ) ) ( not ( = ?auto_18996 ?auto_19006 ) ) ( not ( = ?auto_18996 ?auto_19001 ) ) ( not ( = ?auto_18997 ?auto_19000 ) ) ( not ( = ?auto_18997 ?auto_18992 ) ) ( not ( = ?auto_18990 ?auto_19003 ) ) ( not ( = ?auto_18990 ?auto_18991 ) ) ( not ( = ?auto_18972 ?auto_18976 ) ) ( not ( = ?auto_18972 ?auto_18989 ) ) ( not ( = ?auto_18973 ?auto_18976 ) ) ( not ( = ?auto_18973 ?auto_18989 ) ) ( not ( = ?auto_18974 ?auto_18976 ) ) ( not ( = ?auto_18974 ?auto_18989 ) ) ( not ( = ?auto_18976 ?auto_18990 ) ) ( not ( = ?auto_18976 ?auto_19003 ) ) ( not ( = ?auto_18976 ?auto_18991 ) ) ( not ( = ?auto_18989 ?auto_18990 ) ) ( not ( = ?auto_18989 ?auto_19003 ) ) ( not ( = ?auto_18989 ?auto_18991 ) ) ( not ( = ?auto_18972 ?auto_18977 ) ) ( not ( = ?auto_18972 ?auto_19002 ) ) ( not ( = ?auto_18973 ?auto_18977 ) ) ( not ( = ?auto_18973 ?auto_19002 ) ) ( not ( = ?auto_18974 ?auto_18977 ) ) ( not ( = ?auto_18974 ?auto_19002 ) ) ( not ( = ?auto_18975 ?auto_18977 ) ) ( not ( = ?auto_18975 ?auto_19002 ) ) ( not ( = ?auto_18977 ?auto_18989 ) ) ( not ( = ?auto_18977 ?auto_18990 ) ) ( not ( = ?auto_18977 ?auto_19003 ) ) ( not ( = ?auto_18977 ?auto_18991 ) ) ( not ( = ?auto_18985 ?auto_19001 ) ) ( not ( = ?auto_18985 ?auto_18996 ) ) ( not ( = ?auto_18985 ?auto_19006 ) ) ( not ( = ?auto_18983 ?auto_18992 ) ) ( not ( = ?auto_18983 ?auto_18997 ) ) ( not ( = ?auto_18983 ?auto_19000 ) ) ( not ( = ?auto_19002 ?auto_18989 ) ) ( not ( = ?auto_19002 ?auto_18990 ) ) ( not ( = ?auto_19002 ?auto_19003 ) ) ( not ( = ?auto_19002 ?auto_18991 ) ) ( not ( = ?auto_18972 ?auto_18978 ) ) ( not ( = ?auto_18972 ?auto_19008 ) ) ( not ( = ?auto_18973 ?auto_18978 ) ) ( not ( = ?auto_18973 ?auto_19008 ) ) ( not ( = ?auto_18974 ?auto_18978 ) ) ( not ( = ?auto_18974 ?auto_19008 ) ) ( not ( = ?auto_18975 ?auto_18978 ) ) ( not ( = ?auto_18975 ?auto_19008 ) ) ( not ( = ?auto_18976 ?auto_18978 ) ) ( not ( = ?auto_18976 ?auto_19008 ) ) ( not ( = ?auto_18978 ?auto_19002 ) ) ( not ( = ?auto_18978 ?auto_18989 ) ) ( not ( = ?auto_18978 ?auto_18990 ) ) ( not ( = ?auto_18978 ?auto_19003 ) ) ( not ( = ?auto_18978 ?auto_18991 ) ) ( not ( = ?auto_18994 ?auto_18985 ) ) ( not ( = ?auto_18994 ?auto_19001 ) ) ( not ( = ?auto_18994 ?auto_18996 ) ) ( not ( = ?auto_18994 ?auto_19006 ) ) ( not ( = ?auto_19007 ?auto_18983 ) ) ( not ( = ?auto_19007 ?auto_18992 ) ) ( not ( = ?auto_19007 ?auto_18997 ) ) ( not ( = ?auto_19007 ?auto_19000 ) ) ( not ( = ?auto_19008 ?auto_19002 ) ) ( not ( = ?auto_19008 ?auto_18989 ) ) ( not ( = ?auto_19008 ?auto_18990 ) ) ( not ( = ?auto_19008 ?auto_19003 ) ) ( not ( = ?auto_19008 ?auto_18991 ) ) ( not ( = ?auto_18972 ?auto_18981 ) ) ( not ( = ?auto_18972 ?auto_18999 ) ) ( not ( = ?auto_18973 ?auto_18981 ) ) ( not ( = ?auto_18973 ?auto_18999 ) ) ( not ( = ?auto_18974 ?auto_18981 ) ) ( not ( = ?auto_18974 ?auto_18999 ) ) ( not ( = ?auto_18975 ?auto_18981 ) ) ( not ( = ?auto_18975 ?auto_18999 ) ) ( not ( = ?auto_18976 ?auto_18981 ) ) ( not ( = ?auto_18976 ?auto_18999 ) ) ( not ( = ?auto_18977 ?auto_18981 ) ) ( not ( = ?auto_18977 ?auto_18999 ) ) ( not ( = ?auto_18981 ?auto_19008 ) ) ( not ( = ?auto_18981 ?auto_19002 ) ) ( not ( = ?auto_18981 ?auto_18989 ) ) ( not ( = ?auto_18981 ?auto_18990 ) ) ( not ( = ?auto_18981 ?auto_19003 ) ) ( not ( = ?auto_18981 ?auto_18991 ) ) ( not ( = ?auto_18995 ?auto_18994 ) ) ( not ( = ?auto_18995 ?auto_18985 ) ) ( not ( = ?auto_18995 ?auto_19001 ) ) ( not ( = ?auto_18995 ?auto_18996 ) ) ( not ( = ?auto_18995 ?auto_19006 ) ) ( not ( = ?auto_19005 ?auto_19007 ) ) ( not ( = ?auto_19005 ?auto_18983 ) ) ( not ( = ?auto_19005 ?auto_18992 ) ) ( not ( = ?auto_19005 ?auto_18997 ) ) ( not ( = ?auto_19005 ?auto_19000 ) ) ( not ( = ?auto_18999 ?auto_19008 ) ) ( not ( = ?auto_18999 ?auto_19002 ) ) ( not ( = ?auto_18999 ?auto_18989 ) ) ( not ( = ?auto_18999 ?auto_18990 ) ) ( not ( = ?auto_18999 ?auto_19003 ) ) ( not ( = ?auto_18999 ?auto_18991 ) ) ( not ( = ?auto_18972 ?auto_18980 ) ) ( not ( = ?auto_18972 ?auto_18998 ) ) ( not ( = ?auto_18973 ?auto_18980 ) ) ( not ( = ?auto_18973 ?auto_18998 ) ) ( not ( = ?auto_18974 ?auto_18980 ) ) ( not ( = ?auto_18974 ?auto_18998 ) ) ( not ( = ?auto_18975 ?auto_18980 ) ) ( not ( = ?auto_18975 ?auto_18998 ) ) ( not ( = ?auto_18976 ?auto_18980 ) ) ( not ( = ?auto_18976 ?auto_18998 ) ) ( not ( = ?auto_18977 ?auto_18980 ) ) ( not ( = ?auto_18977 ?auto_18998 ) ) ( not ( = ?auto_18978 ?auto_18980 ) ) ( not ( = ?auto_18978 ?auto_18998 ) ) ( not ( = ?auto_18980 ?auto_18999 ) ) ( not ( = ?auto_18980 ?auto_19008 ) ) ( not ( = ?auto_18980 ?auto_19002 ) ) ( not ( = ?auto_18980 ?auto_18989 ) ) ( not ( = ?auto_18980 ?auto_18990 ) ) ( not ( = ?auto_18980 ?auto_19003 ) ) ( not ( = ?auto_18980 ?auto_18991 ) ) ( not ( = ?auto_19009 ?auto_18995 ) ) ( not ( = ?auto_19009 ?auto_18994 ) ) ( not ( = ?auto_19009 ?auto_18985 ) ) ( not ( = ?auto_19009 ?auto_19001 ) ) ( not ( = ?auto_19009 ?auto_18996 ) ) ( not ( = ?auto_19009 ?auto_19006 ) ) ( not ( = ?auto_18993 ?auto_19005 ) ) ( not ( = ?auto_18993 ?auto_19007 ) ) ( not ( = ?auto_18993 ?auto_18983 ) ) ( not ( = ?auto_18993 ?auto_18992 ) ) ( not ( = ?auto_18993 ?auto_18997 ) ) ( not ( = ?auto_18993 ?auto_19000 ) ) ( not ( = ?auto_18998 ?auto_18999 ) ) ( not ( = ?auto_18998 ?auto_19008 ) ) ( not ( = ?auto_18998 ?auto_19002 ) ) ( not ( = ?auto_18998 ?auto_18989 ) ) ( not ( = ?auto_18998 ?auto_18990 ) ) ( not ( = ?auto_18998 ?auto_19003 ) ) ( not ( = ?auto_18998 ?auto_18991 ) ) ( not ( = ?auto_18972 ?auto_18979 ) ) ( not ( = ?auto_18972 ?auto_19004 ) ) ( not ( = ?auto_18973 ?auto_18979 ) ) ( not ( = ?auto_18973 ?auto_19004 ) ) ( not ( = ?auto_18974 ?auto_18979 ) ) ( not ( = ?auto_18974 ?auto_19004 ) ) ( not ( = ?auto_18975 ?auto_18979 ) ) ( not ( = ?auto_18975 ?auto_19004 ) ) ( not ( = ?auto_18976 ?auto_18979 ) ) ( not ( = ?auto_18976 ?auto_19004 ) ) ( not ( = ?auto_18977 ?auto_18979 ) ) ( not ( = ?auto_18977 ?auto_19004 ) ) ( not ( = ?auto_18978 ?auto_18979 ) ) ( not ( = ?auto_18978 ?auto_19004 ) ) ( not ( = ?auto_18981 ?auto_18979 ) ) ( not ( = ?auto_18981 ?auto_19004 ) ) ( not ( = ?auto_18979 ?auto_18998 ) ) ( not ( = ?auto_18979 ?auto_18999 ) ) ( not ( = ?auto_18979 ?auto_19008 ) ) ( not ( = ?auto_18979 ?auto_19002 ) ) ( not ( = ?auto_18979 ?auto_18989 ) ) ( not ( = ?auto_18979 ?auto_18990 ) ) ( not ( = ?auto_18979 ?auto_19003 ) ) ( not ( = ?auto_18979 ?auto_18991 ) ) ( not ( = ?auto_19004 ?auto_18998 ) ) ( not ( = ?auto_19004 ?auto_18999 ) ) ( not ( = ?auto_19004 ?auto_19008 ) ) ( not ( = ?auto_19004 ?auto_19002 ) ) ( not ( = ?auto_19004 ?auto_18989 ) ) ( not ( = ?auto_19004 ?auto_18990 ) ) ( not ( = ?auto_19004 ?auto_19003 ) ) ( not ( = ?auto_19004 ?auto_18991 ) ) ( not ( = ?auto_18972 ?auto_18982 ) ) ( not ( = ?auto_18972 ?auto_18987 ) ) ( not ( = ?auto_18973 ?auto_18982 ) ) ( not ( = ?auto_18973 ?auto_18987 ) ) ( not ( = ?auto_18974 ?auto_18982 ) ) ( not ( = ?auto_18974 ?auto_18987 ) ) ( not ( = ?auto_18975 ?auto_18982 ) ) ( not ( = ?auto_18975 ?auto_18987 ) ) ( not ( = ?auto_18976 ?auto_18982 ) ) ( not ( = ?auto_18976 ?auto_18987 ) ) ( not ( = ?auto_18977 ?auto_18982 ) ) ( not ( = ?auto_18977 ?auto_18987 ) ) ( not ( = ?auto_18978 ?auto_18982 ) ) ( not ( = ?auto_18978 ?auto_18987 ) ) ( not ( = ?auto_18981 ?auto_18982 ) ) ( not ( = ?auto_18981 ?auto_18987 ) ) ( not ( = ?auto_18980 ?auto_18982 ) ) ( not ( = ?auto_18980 ?auto_18987 ) ) ( not ( = ?auto_18982 ?auto_19004 ) ) ( not ( = ?auto_18982 ?auto_18998 ) ) ( not ( = ?auto_18982 ?auto_18999 ) ) ( not ( = ?auto_18982 ?auto_19008 ) ) ( not ( = ?auto_18982 ?auto_19002 ) ) ( not ( = ?auto_18982 ?auto_18989 ) ) ( not ( = ?auto_18982 ?auto_18990 ) ) ( not ( = ?auto_18982 ?auto_19003 ) ) ( not ( = ?auto_18982 ?auto_18991 ) ) ( not ( = ?auto_18987 ?auto_19004 ) ) ( not ( = ?auto_18987 ?auto_18998 ) ) ( not ( = ?auto_18987 ?auto_18999 ) ) ( not ( = ?auto_18987 ?auto_19008 ) ) ( not ( = ?auto_18987 ?auto_19002 ) ) ( not ( = ?auto_18987 ?auto_18989 ) ) ( not ( = ?auto_18987 ?auto_18990 ) ) ( not ( = ?auto_18987 ?auto_19003 ) ) ( not ( = ?auto_18987 ?auto_18991 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_18972 ?auto_18973 ?auto_18974 ?auto_18975 ?auto_18976 ?auto_18977 ?auto_18978 ?auto_18981 ?auto_18980 ?auto_18979 )
      ( MAKE-1CRATE ?auto_18979 ?auto_18982 )
      ( MAKE-10CRATE-VERIFY ?auto_18972 ?auto_18973 ?auto_18974 ?auto_18975 ?auto_18976 ?auto_18977 ?auto_18978 ?auto_18981 ?auto_18980 ?auto_18979 ?auto_18982 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19012 - SURFACE
      ?auto_19013 - SURFACE
    )
    :vars
    (
      ?auto_19014 - HOIST
      ?auto_19015 - PLACE
      ?auto_19017 - PLACE
      ?auto_19018 - HOIST
      ?auto_19019 - SURFACE
      ?auto_19016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19014 ?auto_19015 ) ( SURFACE-AT ?auto_19012 ?auto_19015 ) ( CLEAR ?auto_19012 ) ( IS-CRATE ?auto_19013 ) ( AVAILABLE ?auto_19014 ) ( not ( = ?auto_19017 ?auto_19015 ) ) ( HOIST-AT ?auto_19018 ?auto_19017 ) ( AVAILABLE ?auto_19018 ) ( SURFACE-AT ?auto_19013 ?auto_19017 ) ( ON ?auto_19013 ?auto_19019 ) ( CLEAR ?auto_19013 ) ( TRUCK-AT ?auto_19016 ?auto_19015 ) ( not ( = ?auto_19012 ?auto_19013 ) ) ( not ( = ?auto_19012 ?auto_19019 ) ) ( not ( = ?auto_19013 ?auto_19019 ) ) ( not ( = ?auto_19014 ?auto_19018 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19016 ?auto_19015 ?auto_19017 )
      ( !LIFT ?auto_19018 ?auto_19013 ?auto_19019 ?auto_19017 )
      ( !LOAD ?auto_19018 ?auto_19013 ?auto_19016 ?auto_19017 )
      ( !DRIVE ?auto_19016 ?auto_19017 ?auto_19015 )
      ( !UNLOAD ?auto_19014 ?auto_19013 ?auto_19016 ?auto_19015 )
      ( !DROP ?auto_19014 ?auto_19013 ?auto_19012 ?auto_19015 )
      ( MAKE-1CRATE-VERIFY ?auto_19012 ?auto_19013 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_19032 - SURFACE
      ?auto_19033 - SURFACE
      ?auto_19034 - SURFACE
      ?auto_19035 - SURFACE
      ?auto_19036 - SURFACE
      ?auto_19037 - SURFACE
      ?auto_19038 - SURFACE
      ?auto_19041 - SURFACE
      ?auto_19040 - SURFACE
      ?auto_19039 - SURFACE
      ?auto_19042 - SURFACE
      ?auto_19043 - SURFACE
    )
    :vars
    (
      ?auto_19046 - HOIST
      ?auto_19044 - PLACE
      ?auto_19048 - PLACE
      ?auto_19049 - HOIST
      ?auto_19047 - SURFACE
      ?auto_19062 - PLACE
      ?auto_19071 - HOIST
      ?auto_19061 - SURFACE
      ?auto_19054 - PLACE
      ?auto_19057 - HOIST
      ?auto_19069 - SURFACE
      ?auto_19055 - PLACE
      ?auto_19065 - HOIST
      ?auto_19059 - SURFACE
      ?auto_19053 - PLACE
      ?auto_19073 - HOIST
      ?auto_19058 - SURFACE
      ?auto_19063 - PLACE
      ?auto_19072 - HOIST
      ?auto_19056 - SURFACE
      ?auto_19068 - SURFACE
      ?auto_19060 - PLACE
      ?auto_19070 - HOIST
      ?auto_19052 - SURFACE
      ?auto_19067 - SURFACE
      ?auto_19066 - PLACE
      ?auto_19051 - HOIST
      ?auto_19064 - SURFACE
      ?auto_19050 - SURFACE
      ?auto_19045 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19046 ?auto_19044 ) ( IS-CRATE ?auto_19043 ) ( not ( = ?auto_19048 ?auto_19044 ) ) ( HOIST-AT ?auto_19049 ?auto_19048 ) ( AVAILABLE ?auto_19049 ) ( SURFACE-AT ?auto_19043 ?auto_19048 ) ( ON ?auto_19043 ?auto_19047 ) ( CLEAR ?auto_19043 ) ( not ( = ?auto_19042 ?auto_19043 ) ) ( not ( = ?auto_19042 ?auto_19047 ) ) ( not ( = ?auto_19043 ?auto_19047 ) ) ( not ( = ?auto_19046 ?auto_19049 ) ) ( IS-CRATE ?auto_19042 ) ( not ( = ?auto_19062 ?auto_19044 ) ) ( HOIST-AT ?auto_19071 ?auto_19062 ) ( SURFACE-AT ?auto_19042 ?auto_19062 ) ( ON ?auto_19042 ?auto_19061 ) ( CLEAR ?auto_19042 ) ( not ( = ?auto_19039 ?auto_19042 ) ) ( not ( = ?auto_19039 ?auto_19061 ) ) ( not ( = ?auto_19042 ?auto_19061 ) ) ( not ( = ?auto_19046 ?auto_19071 ) ) ( IS-CRATE ?auto_19039 ) ( not ( = ?auto_19054 ?auto_19044 ) ) ( HOIST-AT ?auto_19057 ?auto_19054 ) ( SURFACE-AT ?auto_19039 ?auto_19054 ) ( ON ?auto_19039 ?auto_19069 ) ( CLEAR ?auto_19039 ) ( not ( = ?auto_19040 ?auto_19039 ) ) ( not ( = ?auto_19040 ?auto_19069 ) ) ( not ( = ?auto_19039 ?auto_19069 ) ) ( not ( = ?auto_19046 ?auto_19057 ) ) ( IS-CRATE ?auto_19040 ) ( not ( = ?auto_19055 ?auto_19044 ) ) ( HOIST-AT ?auto_19065 ?auto_19055 ) ( AVAILABLE ?auto_19065 ) ( SURFACE-AT ?auto_19040 ?auto_19055 ) ( ON ?auto_19040 ?auto_19059 ) ( CLEAR ?auto_19040 ) ( not ( = ?auto_19041 ?auto_19040 ) ) ( not ( = ?auto_19041 ?auto_19059 ) ) ( not ( = ?auto_19040 ?auto_19059 ) ) ( not ( = ?auto_19046 ?auto_19065 ) ) ( IS-CRATE ?auto_19041 ) ( not ( = ?auto_19053 ?auto_19044 ) ) ( HOIST-AT ?auto_19073 ?auto_19053 ) ( AVAILABLE ?auto_19073 ) ( SURFACE-AT ?auto_19041 ?auto_19053 ) ( ON ?auto_19041 ?auto_19058 ) ( CLEAR ?auto_19041 ) ( not ( = ?auto_19038 ?auto_19041 ) ) ( not ( = ?auto_19038 ?auto_19058 ) ) ( not ( = ?auto_19041 ?auto_19058 ) ) ( not ( = ?auto_19046 ?auto_19073 ) ) ( IS-CRATE ?auto_19038 ) ( not ( = ?auto_19063 ?auto_19044 ) ) ( HOIST-AT ?auto_19072 ?auto_19063 ) ( AVAILABLE ?auto_19072 ) ( SURFACE-AT ?auto_19038 ?auto_19063 ) ( ON ?auto_19038 ?auto_19056 ) ( CLEAR ?auto_19038 ) ( not ( = ?auto_19037 ?auto_19038 ) ) ( not ( = ?auto_19037 ?auto_19056 ) ) ( not ( = ?auto_19038 ?auto_19056 ) ) ( not ( = ?auto_19046 ?auto_19072 ) ) ( IS-CRATE ?auto_19037 ) ( AVAILABLE ?auto_19071 ) ( SURFACE-AT ?auto_19037 ?auto_19062 ) ( ON ?auto_19037 ?auto_19068 ) ( CLEAR ?auto_19037 ) ( not ( = ?auto_19036 ?auto_19037 ) ) ( not ( = ?auto_19036 ?auto_19068 ) ) ( not ( = ?auto_19037 ?auto_19068 ) ) ( IS-CRATE ?auto_19036 ) ( not ( = ?auto_19060 ?auto_19044 ) ) ( HOIST-AT ?auto_19070 ?auto_19060 ) ( SURFACE-AT ?auto_19036 ?auto_19060 ) ( ON ?auto_19036 ?auto_19052 ) ( CLEAR ?auto_19036 ) ( not ( = ?auto_19035 ?auto_19036 ) ) ( not ( = ?auto_19035 ?auto_19052 ) ) ( not ( = ?auto_19036 ?auto_19052 ) ) ( not ( = ?auto_19046 ?auto_19070 ) ) ( IS-CRATE ?auto_19035 ) ( AVAILABLE ?auto_19057 ) ( SURFACE-AT ?auto_19035 ?auto_19054 ) ( ON ?auto_19035 ?auto_19067 ) ( CLEAR ?auto_19035 ) ( not ( = ?auto_19034 ?auto_19035 ) ) ( not ( = ?auto_19034 ?auto_19067 ) ) ( not ( = ?auto_19035 ?auto_19067 ) ) ( IS-CRATE ?auto_19034 ) ( not ( = ?auto_19066 ?auto_19044 ) ) ( HOIST-AT ?auto_19051 ?auto_19066 ) ( AVAILABLE ?auto_19051 ) ( SURFACE-AT ?auto_19034 ?auto_19066 ) ( ON ?auto_19034 ?auto_19064 ) ( CLEAR ?auto_19034 ) ( not ( = ?auto_19033 ?auto_19034 ) ) ( not ( = ?auto_19033 ?auto_19064 ) ) ( not ( = ?auto_19034 ?auto_19064 ) ) ( not ( = ?auto_19046 ?auto_19051 ) ) ( SURFACE-AT ?auto_19032 ?auto_19044 ) ( CLEAR ?auto_19032 ) ( IS-CRATE ?auto_19033 ) ( AVAILABLE ?auto_19046 ) ( AVAILABLE ?auto_19070 ) ( SURFACE-AT ?auto_19033 ?auto_19060 ) ( ON ?auto_19033 ?auto_19050 ) ( CLEAR ?auto_19033 ) ( TRUCK-AT ?auto_19045 ?auto_19044 ) ( not ( = ?auto_19032 ?auto_19033 ) ) ( not ( = ?auto_19032 ?auto_19050 ) ) ( not ( = ?auto_19033 ?auto_19050 ) ) ( not ( = ?auto_19032 ?auto_19034 ) ) ( not ( = ?auto_19032 ?auto_19064 ) ) ( not ( = ?auto_19034 ?auto_19050 ) ) ( not ( = ?auto_19066 ?auto_19060 ) ) ( not ( = ?auto_19051 ?auto_19070 ) ) ( not ( = ?auto_19064 ?auto_19050 ) ) ( not ( = ?auto_19032 ?auto_19035 ) ) ( not ( = ?auto_19032 ?auto_19067 ) ) ( not ( = ?auto_19033 ?auto_19035 ) ) ( not ( = ?auto_19033 ?auto_19067 ) ) ( not ( = ?auto_19035 ?auto_19064 ) ) ( not ( = ?auto_19035 ?auto_19050 ) ) ( not ( = ?auto_19054 ?auto_19066 ) ) ( not ( = ?auto_19054 ?auto_19060 ) ) ( not ( = ?auto_19057 ?auto_19051 ) ) ( not ( = ?auto_19057 ?auto_19070 ) ) ( not ( = ?auto_19067 ?auto_19064 ) ) ( not ( = ?auto_19067 ?auto_19050 ) ) ( not ( = ?auto_19032 ?auto_19036 ) ) ( not ( = ?auto_19032 ?auto_19052 ) ) ( not ( = ?auto_19033 ?auto_19036 ) ) ( not ( = ?auto_19033 ?auto_19052 ) ) ( not ( = ?auto_19034 ?auto_19036 ) ) ( not ( = ?auto_19034 ?auto_19052 ) ) ( not ( = ?auto_19036 ?auto_19067 ) ) ( not ( = ?auto_19036 ?auto_19064 ) ) ( not ( = ?auto_19036 ?auto_19050 ) ) ( not ( = ?auto_19052 ?auto_19067 ) ) ( not ( = ?auto_19052 ?auto_19064 ) ) ( not ( = ?auto_19052 ?auto_19050 ) ) ( not ( = ?auto_19032 ?auto_19037 ) ) ( not ( = ?auto_19032 ?auto_19068 ) ) ( not ( = ?auto_19033 ?auto_19037 ) ) ( not ( = ?auto_19033 ?auto_19068 ) ) ( not ( = ?auto_19034 ?auto_19037 ) ) ( not ( = ?auto_19034 ?auto_19068 ) ) ( not ( = ?auto_19035 ?auto_19037 ) ) ( not ( = ?auto_19035 ?auto_19068 ) ) ( not ( = ?auto_19037 ?auto_19052 ) ) ( not ( = ?auto_19037 ?auto_19067 ) ) ( not ( = ?auto_19037 ?auto_19064 ) ) ( not ( = ?auto_19037 ?auto_19050 ) ) ( not ( = ?auto_19062 ?auto_19060 ) ) ( not ( = ?auto_19062 ?auto_19054 ) ) ( not ( = ?auto_19062 ?auto_19066 ) ) ( not ( = ?auto_19071 ?auto_19070 ) ) ( not ( = ?auto_19071 ?auto_19057 ) ) ( not ( = ?auto_19071 ?auto_19051 ) ) ( not ( = ?auto_19068 ?auto_19052 ) ) ( not ( = ?auto_19068 ?auto_19067 ) ) ( not ( = ?auto_19068 ?auto_19064 ) ) ( not ( = ?auto_19068 ?auto_19050 ) ) ( not ( = ?auto_19032 ?auto_19038 ) ) ( not ( = ?auto_19032 ?auto_19056 ) ) ( not ( = ?auto_19033 ?auto_19038 ) ) ( not ( = ?auto_19033 ?auto_19056 ) ) ( not ( = ?auto_19034 ?auto_19038 ) ) ( not ( = ?auto_19034 ?auto_19056 ) ) ( not ( = ?auto_19035 ?auto_19038 ) ) ( not ( = ?auto_19035 ?auto_19056 ) ) ( not ( = ?auto_19036 ?auto_19038 ) ) ( not ( = ?auto_19036 ?auto_19056 ) ) ( not ( = ?auto_19038 ?auto_19068 ) ) ( not ( = ?auto_19038 ?auto_19052 ) ) ( not ( = ?auto_19038 ?auto_19067 ) ) ( not ( = ?auto_19038 ?auto_19064 ) ) ( not ( = ?auto_19038 ?auto_19050 ) ) ( not ( = ?auto_19063 ?auto_19062 ) ) ( not ( = ?auto_19063 ?auto_19060 ) ) ( not ( = ?auto_19063 ?auto_19054 ) ) ( not ( = ?auto_19063 ?auto_19066 ) ) ( not ( = ?auto_19072 ?auto_19071 ) ) ( not ( = ?auto_19072 ?auto_19070 ) ) ( not ( = ?auto_19072 ?auto_19057 ) ) ( not ( = ?auto_19072 ?auto_19051 ) ) ( not ( = ?auto_19056 ?auto_19068 ) ) ( not ( = ?auto_19056 ?auto_19052 ) ) ( not ( = ?auto_19056 ?auto_19067 ) ) ( not ( = ?auto_19056 ?auto_19064 ) ) ( not ( = ?auto_19056 ?auto_19050 ) ) ( not ( = ?auto_19032 ?auto_19041 ) ) ( not ( = ?auto_19032 ?auto_19058 ) ) ( not ( = ?auto_19033 ?auto_19041 ) ) ( not ( = ?auto_19033 ?auto_19058 ) ) ( not ( = ?auto_19034 ?auto_19041 ) ) ( not ( = ?auto_19034 ?auto_19058 ) ) ( not ( = ?auto_19035 ?auto_19041 ) ) ( not ( = ?auto_19035 ?auto_19058 ) ) ( not ( = ?auto_19036 ?auto_19041 ) ) ( not ( = ?auto_19036 ?auto_19058 ) ) ( not ( = ?auto_19037 ?auto_19041 ) ) ( not ( = ?auto_19037 ?auto_19058 ) ) ( not ( = ?auto_19041 ?auto_19056 ) ) ( not ( = ?auto_19041 ?auto_19068 ) ) ( not ( = ?auto_19041 ?auto_19052 ) ) ( not ( = ?auto_19041 ?auto_19067 ) ) ( not ( = ?auto_19041 ?auto_19064 ) ) ( not ( = ?auto_19041 ?auto_19050 ) ) ( not ( = ?auto_19053 ?auto_19063 ) ) ( not ( = ?auto_19053 ?auto_19062 ) ) ( not ( = ?auto_19053 ?auto_19060 ) ) ( not ( = ?auto_19053 ?auto_19054 ) ) ( not ( = ?auto_19053 ?auto_19066 ) ) ( not ( = ?auto_19073 ?auto_19072 ) ) ( not ( = ?auto_19073 ?auto_19071 ) ) ( not ( = ?auto_19073 ?auto_19070 ) ) ( not ( = ?auto_19073 ?auto_19057 ) ) ( not ( = ?auto_19073 ?auto_19051 ) ) ( not ( = ?auto_19058 ?auto_19056 ) ) ( not ( = ?auto_19058 ?auto_19068 ) ) ( not ( = ?auto_19058 ?auto_19052 ) ) ( not ( = ?auto_19058 ?auto_19067 ) ) ( not ( = ?auto_19058 ?auto_19064 ) ) ( not ( = ?auto_19058 ?auto_19050 ) ) ( not ( = ?auto_19032 ?auto_19040 ) ) ( not ( = ?auto_19032 ?auto_19059 ) ) ( not ( = ?auto_19033 ?auto_19040 ) ) ( not ( = ?auto_19033 ?auto_19059 ) ) ( not ( = ?auto_19034 ?auto_19040 ) ) ( not ( = ?auto_19034 ?auto_19059 ) ) ( not ( = ?auto_19035 ?auto_19040 ) ) ( not ( = ?auto_19035 ?auto_19059 ) ) ( not ( = ?auto_19036 ?auto_19040 ) ) ( not ( = ?auto_19036 ?auto_19059 ) ) ( not ( = ?auto_19037 ?auto_19040 ) ) ( not ( = ?auto_19037 ?auto_19059 ) ) ( not ( = ?auto_19038 ?auto_19040 ) ) ( not ( = ?auto_19038 ?auto_19059 ) ) ( not ( = ?auto_19040 ?auto_19058 ) ) ( not ( = ?auto_19040 ?auto_19056 ) ) ( not ( = ?auto_19040 ?auto_19068 ) ) ( not ( = ?auto_19040 ?auto_19052 ) ) ( not ( = ?auto_19040 ?auto_19067 ) ) ( not ( = ?auto_19040 ?auto_19064 ) ) ( not ( = ?auto_19040 ?auto_19050 ) ) ( not ( = ?auto_19055 ?auto_19053 ) ) ( not ( = ?auto_19055 ?auto_19063 ) ) ( not ( = ?auto_19055 ?auto_19062 ) ) ( not ( = ?auto_19055 ?auto_19060 ) ) ( not ( = ?auto_19055 ?auto_19054 ) ) ( not ( = ?auto_19055 ?auto_19066 ) ) ( not ( = ?auto_19065 ?auto_19073 ) ) ( not ( = ?auto_19065 ?auto_19072 ) ) ( not ( = ?auto_19065 ?auto_19071 ) ) ( not ( = ?auto_19065 ?auto_19070 ) ) ( not ( = ?auto_19065 ?auto_19057 ) ) ( not ( = ?auto_19065 ?auto_19051 ) ) ( not ( = ?auto_19059 ?auto_19058 ) ) ( not ( = ?auto_19059 ?auto_19056 ) ) ( not ( = ?auto_19059 ?auto_19068 ) ) ( not ( = ?auto_19059 ?auto_19052 ) ) ( not ( = ?auto_19059 ?auto_19067 ) ) ( not ( = ?auto_19059 ?auto_19064 ) ) ( not ( = ?auto_19059 ?auto_19050 ) ) ( not ( = ?auto_19032 ?auto_19039 ) ) ( not ( = ?auto_19032 ?auto_19069 ) ) ( not ( = ?auto_19033 ?auto_19039 ) ) ( not ( = ?auto_19033 ?auto_19069 ) ) ( not ( = ?auto_19034 ?auto_19039 ) ) ( not ( = ?auto_19034 ?auto_19069 ) ) ( not ( = ?auto_19035 ?auto_19039 ) ) ( not ( = ?auto_19035 ?auto_19069 ) ) ( not ( = ?auto_19036 ?auto_19039 ) ) ( not ( = ?auto_19036 ?auto_19069 ) ) ( not ( = ?auto_19037 ?auto_19039 ) ) ( not ( = ?auto_19037 ?auto_19069 ) ) ( not ( = ?auto_19038 ?auto_19039 ) ) ( not ( = ?auto_19038 ?auto_19069 ) ) ( not ( = ?auto_19041 ?auto_19039 ) ) ( not ( = ?auto_19041 ?auto_19069 ) ) ( not ( = ?auto_19039 ?auto_19059 ) ) ( not ( = ?auto_19039 ?auto_19058 ) ) ( not ( = ?auto_19039 ?auto_19056 ) ) ( not ( = ?auto_19039 ?auto_19068 ) ) ( not ( = ?auto_19039 ?auto_19052 ) ) ( not ( = ?auto_19039 ?auto_19067 ) ) ( not ( = ?auto_19039 ?auto_19064 ) ) ( not ( = ?auto_19039 ?auto_19050 ) ) ( not ( = ?auto_19069 ?auto_19059 ) ) ( not ( = ?auto_19069 ?auto_19058 ) ) ( not ( = ?auto_19069 ?auto_19056 ) ) ( not ( = ?auto_19069 ?auto_19068 ) ) ( not ( = ?auto_19069 ?auto_19052 ) ) ( not ( = ?auto_19069 ?auto_19067 ) ) ( not ( = ?auto_19069 ?auto_19064 ) ) ( not ( = ?auto_19069 ?auto_19050 ) ) ( not ( = ?auto_19032 ?auto_19042 ) ) ( not ( = ?auto_19032 ?auto_19061 ) ) ( not ( = ?auto_19033 ?auto_19042 ) ) ( not ( = ?auto_19033 ?auto_19061 ) ) ( not ( = ?auto_19034 ?auto_19042 ) ) ( not ( = ?auto_19034 ?auto_19061 ) ) ( not ( = ?auto_19035 ?auto_19042 ) ) ( not ( = ?auto_19035 ?auto_19061 ) ) ( not ( = ?auto_19036 ?auto_19042 ) ) ( not ( = ?auto_19036 ?auto_19061 ) ) ( not ( = ?auto_19037 ?auto_19042 ) ) ( not ( = ?auto_19037 ?auto_19061 ) ) ( not ( = ?auto_19038 ?auto_19042 ) ) ( not ( = ?auto_19038 ?auto_19061 ) ) ( not ( = ?auto_19041 ?auto_19042 ) ) ( not ( = ?auto_19041 ?auto_19061 ) ) ( not ( = ?auto_19040 ?auto_19042 ) ) ( not ( = ?auto_19040 ?auto_19061 ) ) ( not ( = ?auto_19042 ?auto_19069 ) ) ( not ( = ?auto_19042 ?auto_19059 ) ) ( not ( = ?auto_19042 ?auto_19058 ) ) ( not ( = ?auto_19042 ?auto_19056 ) ) ( not ( = ?auto_19042 ?auto_19068 ) ) ( not ( = ?auto_19042 ?auto_19052 ) ) ( not ( = ?auto_19042 ?auto_19067 ) ) ( not ( = ?auto_19042 ?auto_19064 ) ) ( not ( = ?auto_19042 ?auto_19050 ) ) ( not ( = ?auto_19061 ?auto_19069 ) ) ( not ( = ?auto_19061 ?auto_19059 ) ) ( not ( = ?auto_19061 ?auto_19058 ) ) ( not ( = ?auto_19061 ?auto_19056 ) ) ( not ( = ?auto_19061 ?auto_19068 ) ) ( not ( = ?auto_19061 ?auto_19052 ) ) ( not ( = ?auto_19061 ?auto_19067 ) ) ( not ( = ?auto_19061 ?auto_19064 ) ) ( not ( = ?auto_19061 ?auto_19050 ) ) ( not ( = ?auto_19032 ?auto_19043 ) ) ( not ( = ?auto_19032 ?auto_19047 ) ) ( not ( = ?auto_19033 ?auto_19043 ) ) ( not ( = ?auto_19033 ?auto_19047 ) ) ( not ( = ?auto_19034 ?auto_19043 ) ) ( not ( = ?auto_19034 ?auto_19047 ) ) ( not ( = ?auto_19035 ?auto_19043 ) ) ( not ( = ?auto_19035 ?auto_19047 ) ) ( not ( = ?auto_19036 ?auto_19043 ) ) ( not ( = ?auto_19036 ?auto_19047 ) ) ( not ( = ?auto_19037 ?auto_19043 ) ) ( not ( = ?auto_19037 ?auto_19047 ) ) ( not ( = ?auto_19038 ?auto_19043 ) ) ( not ( = ?auto_19038 ?auto_19047 ) ) ( not ( = ?auto_19041 ?auto_19043 ) ) ( not ( = ?auto_19041 ?auto_19047 ) ) ( not ( = ?auto_19040 ?auto_19043 ) ) ( not ( = ?auto_19040 ?auto_19047 ) ) ( not ( = ?auto_19039 ?auto_19043 ) ) ( not ( = ?auto_19039 ?auto_19047 ) ) ( not ( = ?auto_19043 ?auto_19061 ) ) ( not ( = ?auto_19043 ?auto_19069 ) ) ( not ( = ?auto_19043 ?auto_19059 ) ) ( not ( = ?auto_19043 ?auto_19058 ) ) ( not ( = ?auto_19043 ?auto_19056 ) ) ( not ( = ?auto_19043 ?auto_19068 ) ) ( not ( = ?auto_19043 ?auto_19052 ) ) ( not ( = ?auto_19043 ?auto_19067 ) ) ( not ( = ?auto_19043 ?auto_19064 ) ) ( not ( = ?auto_19043 ?auto_19050 ) ) ( not ( = ?auto_19048 ?auto_19062 ) ) ( not ( = ?auto_19048 ?auto_19054 ) ) ( not ( = ?auto_19048 ?auto_19055 ) ) ( not ( = ?auto_19048 ?auto_19053 ) ) ( not ( = ?auto_19048 ?auto_19063 ) ) ( not ( = ?auto_19048 ?auto_19060 ) ) ( not ( = ?auto_19048 ?auto_19066 ) ) ( not ( = ?auto_19049 ?auto_19071 ) ) ( not ( = ?auto_19049 ?auto_19057 ) ) ( not ( = ?auto_19049 ?auto_19065 ) ) ( not ( = ?auto_19049 ?auto_19073 ) ) ( not ( = ?auto_19049 ?auto_19072 ) ) ( not ( = ?auto_19049 ?auto_19070 ) ) ( not ( = ?auto_19049 ?auto_19051 ) ) ( not ( = ?auto_19047 ?auto_19061 ) ) ( not ( = ?auto_19047 ?auto_19069 ) ) ( not ( = ?auto_19047 ?auto_19059 ) ) ( not ( = ?auto_19047 ?auto_19058 ) ) ( not ( = ?auto_19047 ?auto_19056 ) ) ( not ( = ?auto_19047 ?auto_19068 ) ) ( not ( = ?auto_19047 ?auto_19052 ) ) ( not ( = ?auto_19047 ?auto_19067 ) ) ( not ( = ?auto_19047 ?auto_19064 ) ) ( not ( = ?auto_19047 ?auto_19050 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_19032 ?auto_19033 ?auto_19034 ?auto_19035 ?auto_19036 ?auto_19037 ?auto_19038 ?auto_19041 ?auto_19040 ?auto_19039 ?auto_19042 )
      ( MAKE-1CRATE ?auto_19042 ?auto_19043 )
      ( MAKE-11CRATE-VERIFY ?auto_19032 ?auto_19033 ?auto_19034 ?auto_19035 ?auto_19036 ?auto_19037 ?auto_19038 ?auto_19041 ?auto_19040 ?auto_19039 ?auto_19042 ?auto_19043 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19076 - SURFACE
      ?auto_19077 - SURFACE
    )
    :vars
    (
      ?auto_19078 - HOIST
      ?auto_19079 - PLACE
      ?auto_19081 - PLACE
      ?auto_19082 - HOIST
      ?auto_19083 - SURFACE
      ?auto_19080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19078 ?auto_19079 ) ( SURFACE-AT ?auto_19076 ?auto_19079 ) ( CLEAR ?auto_19076 ) ( IS-CRATE ?auto_19077 ) ( AVAILABLE ?auto_19078 ) ( not ( = ?auto_19081 ?auto_19079 ) ) ( HOIST-AT ?auto_19082 ?auto_19081 ) ( AVAILABLE ?auto_19082 ) ( SURFACE-AT ?auto_19077 ?auto_19081 ) ( ON ?auto_19077 ?auto_19083 ) ( CLEAR ?auto_19077 ) ( TRUCK-AT ?auto_19080 ?auto_19079 ) ( not ( = ?auto_19076 ?auto_19077 ) ) ( not ( = ?auto_19076 ?auto_19083 ) ) ( not ( = ?auto_19077 ?auto_19083 ) ) ( not ( = ?auto_19078 ?auto_19082 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19080 ?auto_19079 ?auto_19081 )
      ( !LIFT ?auto_19082 ?auto_19077 ?auto_19083 ?auto_19081 )
      ( !LOAD ?auto_19082 ?auto_19077 ?auto_19080 ?auto_19081 )
      ( !DRIVE ?auto_19080 ?auto_19081 ?auto_19079 )
      ( !UNLOAD ?auto_19078 ?auto_19077 ?auto_19080 ?auto_19079 )
      ( !DROP ?auto_19078 ?auto_19077 ?auto_19076 ?auto_19079 )
      ( MAKE-1CRATE-VERIFY ?auto_19076 ?auto_19077 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_19097 - SURFACE
      ?auto_19098 - SURFACE
      ?auto_19099 - SURFACE
      ?auto_19100 - SURFACE
      ?auto_19101 - SURFACE
      ?auto_19102 - SURFACE
      ?auto_19103 - SURFACE
      ?auto_19106 - SURFACE
      ?auto_19105 - SURFACE
      ?auto_19104 - SURFACE
      ?auto_19107 - SURFACE
      ?auto_19108 - SURFACE
      ?auto_19109 - SURFACE
    )
    :vars
    (
      ?auto_19113 - HOIST
      ?auto_19111 - PLACE
      ?auto_19114 - PLACE
      ?auto_19115 - HOIST
      ?auto_19110 - SURFACE
      ?auto_19121 - PLACE
      ?auto_19122 - HOIST
      ?auto_19141 - SURFACE
      ?auto_19117 - PLACE
      ?auto_19142 - HOIST
      ?auto_19134 - SURFACE
      ?auto_19124 - PLACE
      ?auto_19116 - HOIST
      ?auto_19140 - SURFACE
      ?auto_19136 - PLACE
      ?auto_19120 - HOIST
      ?auto_19137 - SURFACE
      ?auto_19126 - PLACE
      ?auto_19123 - HOIST
      ?auto_19128 - SURFACE
      ?auto_19125 - PLACE
      ?auto_19135 - HOIST
      ?auto_19130 - SURFACE
      ?auto_19127 - SURFACE
      ?auto_19139 - PLACE
      ?auto_19119 - HOIST
      ?auto_19129 - SURFACE
      ?auto_19132 - SURFACE
      ?auto_19131 - PLACE
      ?auto_19138 - HOIST
      ?auto_19118 - SURFACE
      ?auto_19133 - SURFACE
      ?auto_19112 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19113 ?auto_19111 ) ( IS-CRATE ?auto_19109 ) ( not ( = ?auto_19114 ?auto_19111 ) ) ( HOIST-AT ?auto_19115 ?auto_19114 ) ( AVAILABLE ?auto_19115 ) ( SURFACE-AT ?auto_19109 ?auto_19114 ) ( ON ?auto_19109 ?auto_19110 ) ( CLEAR ?auto_19109 ) ( not ( = ?auto_19108 ?auto_19109 ) ) ( not ( = ?auto_19108 ?auto_19110 ) ) ( not ( = ?auto_19109 ?auto_19110 ) ) ( not ( = ?auto_19113 ?auto_19115 ) ) ( IS-CRATE ?auto_19108 ) ( not ( = ?auto_19121 ?auto_19111 ) ) ( HOIST-AT ?auto_19122 ?auto_19121 ) ( AVAILABLE ?auto_19122 ) ( SURFACE-AT ?auto_19108 ?auto_19121 ) ( ON ?auto_19108 ?auto_19141 ) ( CLEAR ?auto_19108 ) ( not ( = ?auto_19107 ?auto_19108 ) ) ( not ( = ?auto_19107 ?auto_19141 ) ) ( not ( = ?auto_19108 ?auto_19141 ) ) ( not ( = ?auto_19113 ?auto_19122 ) ) ( IS-CRATE ?auto_19107 ) ( not ( = ?auto_19117 ?auto_19111 ) ) ( HOIST-AT ?auto_19142 ?auto_19117 ) ( SURFACE-AT ?auto_19107 ?auto_19117 ) ( ON ?auto_19107 ?auto_19134 ) ( CLEAR ?auto_19107 ) ( not ( = ?auto_19104 ?auto_19107 ) ) ( not ( = ?auto_19104 ?auto_19134 ) ) ( not ( = ?auto_19107 ?auto_19134 ) ) ( not ( = ?auto_19113 ?auto_19142 ) ) ( IS-CRATE ?auto_19104 ) ( not ( = ?auto_19124 ?auto_19111 ) ) ( HOIST-AT ?auto_19116 ?auto_19124 ) ( SURFACE-AT ?auto_19104 ?auto_19124 ) ( ON ?auto_19104 ?auto_19140 ) ( CLEAR ?auto_19104 ) ( not ( = ?auto_19105 ?auto_19104 ) ) ( not ( = ?auto_19105 ?auto_19140 ) ) ( not ( = ?auto_19104 ?auto_19140 ) ) ( not ( = ?auto_19113 ?auto_19116 ) ) ( IS-CRATE ?auto_19105 ) ( not ( = ?auto_19136 ?auto_19111 ) ) ( HOIST-AT ?auto_19120 ?auto_19136 ) ( AVAILABLE ?auto_19120 ) ( SURFACE-AT ?auto_19105 ?auto_19136 ) ( ON ?auto_19105 ?auto_19137 ) ( CLEAR ?auto_19105 ) ( not ( = ?auto_19106 ?auto_19105 ) ) ( not ( = ?auto_19106 ?auto_19137 ) ) ( not ( = ?auto_19105 ?auto_19137 ) ) ( not ( = ?auto_19113 ?auto_19120 ) ) ( IS-CRATE ?auto_19106 ) ( not ( = ?auto_19126 ?auto_19111 ) ) ( HOIST-AT ?auto_19123 ?auto_19126 ) ( AVAILABLE ?auto_19123 ) ( SURFACE-AT ?auto_19106 ?auto_19126 ) ( ON ?auto_19106 ?auto_19128 ) ( CLEAR ?auto_19106 ) ( not ( = ?auto_19103 ?auto_19106 ) ) ( not ( = ?auto_19103 ?auto_19128 ) ) ( not ( = ?auto_19106 ?auto_19128 ) ) ( not ( = ?auto_19113 ?auto_19123 ) ) ( IS-CRATE ?auto_19103 ) ( not ( = ?auto_19125 ?auto_19111 ) ) ( HOIST-AT ?auto_19135 ?auto_19125 ) ( AVAILABLE ?auto_19135 ) ( SURFACE-AT ?auto_19103 ?auto_19125 ) ( ON ?auto_19103 ?auto_19130 ) ( CLEAR ?auto_19103 ) ( not ( = ?auto_19102 ?auto_19103 ) ) ( not ( = ?auto_19102 ?auto_19130 ) ) ( not ( = ?auto_19103 ?auto_19130 ) ) ( not ( = ?auto_19113 ?auto_19135 ) ) ( IS-CRATE ?auto_19102 ) ( AVAILABLE ?auto_19142 ) ( SURFACE-AT ?auto_19102 ?auto_19117 ) ( ON ?auto_19102 ?auto_19127 ) ( CLEAR ?auto_19102 ) ( not ( = ?auto_19101 ?auto_19102 ) ) ( not ( = ?auto_19101 ?auto_19127 ) ) ( not ( = ?auto_19102 ?auto_19127 ) ) ( IS-CRATE ?auto_19101 ) ( not ( = ?auto_19139 ?auto_19111 ) ) ( HOIST-AT ?auto_19119 ?auto_19139 ) ( SURFACE-AT ?auto_19101 ?auto_19139 ) ( ON ?auto_19101 ?auto_19129 ) ( CLEAR ?auto_19101 ) ( not ( = ?auto_19100 ?auto_19101 ) ) ( not ( = ?auto_19100 ?auto_19129 ) ) ( not ( = ?auto_19101 ?auto_19129 ) ) ( not ( = ?auto_19113 ?auto_19119 ) ) ( IS-CRATE ?auto_19100 ) ( AVAILABLE ?auto_19116 ) ( SURFACE-AT ?auto_19100 ?auto_19124 ) ( ON ?auto_19100 ?auto_19132 ) ( CLEAR ?auto_19100 ) ( not ( = ?auto_19099 ?auto_19100 ) ) ( not ( = ?auto_19099 ?auto_19132 ) ) ( not ( = ?auto_19100 ?auto_19132 ) ) ( IS-CRATE ?auto_19099 ) ( not ( = ?auto_19131 ?auto_19111 ) ) ( HOIST-AT ?auto_19138 ?auto_19131 ) ( AVAILABLE ?auto_19138 ) ( SURFACE-AT ?auto_19099 ?auto_19131 ) ( ON ?auto_19099 ?auto_19118 ) ( CLEAR ?auto_19099 ) ( not ( = ?auto_19098 ?auto_19099 ) ) ( not ( = ?auto_19098 ?auto_19118 ) ) ( not ( = ?auto_19099 ?auto_19118 ) ) ( not ( = ?auto_19113 ?auto_19138 ) ) ( SURFACE-AT ?auto_19097 ?auto_19111 ) ( CLEAR ?auto_19097 ) ( IS-CRATE ?auto_19098 ) ( AVAILABLE ?auto_19113 ) ( AVAILABLE ?auto_19119 ) ( SURFACE-AT ?auto_19098 ?auto_19139 ) ( ON ?auto_19098 ?auto_19133 ) ( CLEAR ?auto_19098 ) ( TRUCK-AT ?auto_19112 ?auto_19111 ) ( not ( = ?auto_19097 ?auto_19098 ) ) ( not ( = ?auto_19097 ?auto_19133 ) ) ( not ( = ?auto_19098 ?auto_19133 ) ) ( not ( = ?auto_19097 ?auto_19099 ) ) ( not ( = ?auto_19097 ?auto_19118 ) ) ( not ( = ?auto_19099 ?auto_19133 ) ) ( not ( = ?auto_19131 ?auto_19139 ) ) ( not ( = ?auto_19138 ?auto_19119 ) ) ( not ( = ?auto_19118 ?auto_19133 ) ) ( not ( = ?auto_19097 ?auto_19100 ) ) ( not ( = ?auto_19097 ?auto_19132 ) ) ( not ( = ?auto_19098 ?auto_19100 ) ) ( not ( = ?auto_19098 ?auto_19132 ) ) ( not ( = ?auto_19100 ?auto_19118 ) ) ( not ( = ?auto_19100 ?auto_19133 ) ) ( not ( = ?auto_19124 ?auto_19131 ) ) ( not ( = ?auto_19124 ?auto_19139 ) ) ( not ( = ?auto_19116 ?auto_19138 ) ) ( not ( = ?auto_19116 ?auto_19119 ) ) ( not ( = ?auto_19132 ?auto_19118 ) ) ( not ( = ?auto_19132 ?auto_19133 ) ) ( not ( = ?auto_19097 ?auto_19101 ) ) ( not ( = ?auto_19097 ?auto_19129 ) ) ( not ( = ?auto_19098 ?auto_19101 ) ) ( not ( = ?auto_19098 ?auto_19129 ) ) ( not ( = ?auto_19099 ?auto_19101 ) ) ( not ( = ?auto_19099 ?auto_19129 ) ) ( not ( = ?auto_19101 ?auto_19132 ) ) ( not ( = ?auto_19101 ?auto_19118 ) ) ( not ( = ?auto_19101 ?auto_19133 ) ) ( not ( = ?auto_19129 ?auto_19132 ) ) ( not ( = ?auto_19129 ?auto_19118 ) ) ( not ( = ?auto_19129 ?auto_19133 ) ) ( not ( = ?auto_19097 ?auto_19102 ) ) ( not ( = ?auto_19097 ?auto_19127 ) ) ( not ( = ?auto_19098 ?auto_19102 ) ) ( not ( = ?auto_19098 ?auto_19127 ) ) ( not ( = ?auto_19099 ?auto_19102 ) ) ( not ( = ?auto_19099 ?auto_19127 ) ) ( not ( = ?auto_19100 ?auto_19102 ) ) ( not ( = ?auto_19100 ?auto_19127 ) ) ( not ( = ?auto_19102 ?auto_19129 ) ) ( not ( = ?auto_19102 ?auto_19132 ) ) ( not ( = ?auto_19102 ?auto_19118 ) ) ( not ( = ?auto_19102 ?auto_19133 ) ) ( not ( = ?auto_19117 ?auto_19139 ) ) ( not ( = ?auto_19117 ?auto_19124 ) ) ( not ( = ?auto_19117 ?auto_19131 ) ) ( not ( = ?auto_19142 ?auto_19119 ) ) ( not ( = ?auto_19142 ?auto_19116 ) ) ( not ( = ?auto_19142 ?auto_19138 ) ) ( not ( = ?auto_19127 ?auto_19129 ) ) ( not ( = ?auto_19127 ?auto_19132 ) ) ( not ( = ?auto_19127 ?auto_19118 ) ) ( not ( = ?auto_19127 ?auto_19133 ) ) ( not ( = ?auto_19097 ?auto_19103 ) ) ( not ( = ?auto_19097 ?auto_19130 ) ) ( not ( = ?auto_19098 ?auto_19103 ) ) ( not ( = ?auto_19098 ?auto_19130 ) ) ( not ( = ?auto_19099 ?auto_19103 ) ) ( not ( = ?auto_19099 ?auto_19130 ) ) ( not ( = ?auto_19100 ?auto_19103 ) ) ( not ( = ?auto_19100 ?auto_19130 ) ) ( not ( = ?auto_19101 ?auto_19103 ) ) ( not ( = ?auto_19101 ?auto_19130 ) ) ( not ( = ?auto_19103 ?auto_19127 ) ) ( not ( = ?auto_19103 ?auto_19129 ) ) ( not ( = ?auto_19103 ?auto_19132 ) ) ( not ( = ?auto_19103 ?auto_19118 ) ) ( not ( = ?auto_19103 ?auto_19133 ) ) ( not ( = ?auto_19125 ?auto_19117 ) ) ( not ( = ?auto_19125 ?auto_19139 ) ) ( not ( = ?auto_19125 ?auto_19124 ) ) ( not ( = ?auto_19125 ?auto_19131 ) ) ( not ( = ?auto_19135 ?auto_19142 ) ) ( not ( = ?auto_19135 ?auto_19119 ) ) ( not ( = ?auto_19135 ?auto_19116 ) ) ( not ( = ?auto_19135 ?auto_19138 ) ) ( not ( = ?auto_19130 ?auto_19127 ) ) ( not ( = ?auto_19130 ?auto_19129 ) ) ( not ( = ?auto_19130 ?auto_19132 ) ) ( not ( = ?auto_19130 ?auto_19118 ) ) ( not ( = ?auto_19130 ?auto_19133 ) ) ( not ( = ?auto_19097 ?auto_19106 ) ) ( not ( = ?auto_19097 ?auto_19128 ) ) ( not ( = ?auto_19098 ?auto_19106 ) ) ( not ( = ?auto_19098 ?auto_19128 ) ) ( not ( = ?auto_19099 ?auto_19106 ) ) ( not ( = ?auto_19099 ?auto_19128 ) ) ( not ( = ?auto_19100 ?auto_19106 ) ) ( not ( = ?auto_19100 ?auto_19128 ) ) ( not ( = ?auto_19101 ?auto_19106 ) ) ( not ( = ?auto_19101 ?auto_19128 ) ) ( not ( = ?auto_19102 ?auto_19106 ) ) ( not ( = ?auto_19102 ?auto_19128 ) ) ( not ( = ?auto_19106 ?auto_19130 ) ) ( not ( = ?auto_19106 ?auto_19127 ) ) ( not ( = ?auto_19106 ?auto_19129 ) ) ( not ( = ?auto_19106 ?auto_19132 ) ) ( not ( = ?auto_19106 ?auto_19118 ) ) ( not ( = ?auto_19106 ?auto_19133 ) ) ( not ( = ?auto_19126 ?auto_19125 ) ) ( not ( = ?auto_19126 ?auto_19117 ) ) ( not ( = ?auto_19126 ?auto_19139 ) ) ( not ( = ?auto_19126 ?auto_19124 ) ) ( not ( = ?auto_19126 ?auto_19131 ) ) ( not ( = ?auto_19123 ?auto_19135 ) ) ( not ( = ?auto_19123 ?auto_19142 ) ) ( not ( = ?auto_19123 ?auto_19119 ) ) ( not ( = ?auto_19123 ?auto_19116 ) ) ( not ( = ?auto_19123 ?auto_19138 ) ) ( not ( = ?auto_19128 ?auto_19130 ) ) ( not ( = ?auto_19128 ?auto_19127 ) ) ( not ( = ?auto_19128 ?auto_19129 ) ) ( not ( = ?auto_19128 ?auto_19132 ) ) ( not ( = ?auto_19128 ?auto_19118 ) ) ( not ( = ?auto_19128 ?auto_19133 ) ) ( not ( = ?auto_19097 ?auto_19105 ) ) ( not ( = ?auto_19097 ?auto_19137 ) ) ( not ( = ?auto_19098 ?auto_19105 ) ) ( not ( = ?auto_19098 ?auto_19137 ) ) ( not ( = ?auto_19099 ?auto_19105 ) ) ( not ( = ?auto_19099 ?auto_19137 ) ) ( not ( = ?auto_19100 ?auto_19105 ) ) ( not ( = ?auto_19100 ?auto_19137 ) ) ( not ( = ?auto_19101 ?auto_19105 ) ) ( not ( = ?auto_19101 ?auto_19137 ) ) ( not ( = ?auto_19102 ?auto_19105 ) ) ( not ( = ?auto_19102 ?auto_19137 ) ) ( not ( = ?auto_19103 ?auto_19105 ) ) ( not ( = ?auto_19103 ?auto_19137 ) ) ( not ( = ?auto_19105 ?auto_19128 ) ) ( not ( = ?auto_19105 ?auto_19130 ) ) ( not ( = ?auto_19105 ?auto_19127 ) ) ( not ( = ?auto_19105 ?auto_19129 ) ) ( not ( = ?auto_19105 ?auto_19132 ) ) ( not ( = ?auto_19105 ?auto_19118 ) ) ( not ( = ?auto_19105 ?auto_19133 ) ) ( not ( = ?auto_19136 ?auto_19126 ) ) ( not ( = ?auto_19136 ?auto_19125 ) ) ( not ( = ?auto_19136 ?auto_19117 ) ) ( not ( = ?auto_19136 ?auto_19139 ) ) ( not ( = ?auto_19136 ?auto_19124 ) ) ( not ( = ?auto_19136 ?auto_19131 ) ) ( not ( = ?auto_19120 ?auto_19123 ) ) ( not ( = ?auto_19120 ?auto_19135 ) ) ( not ( = ?auto_19120 ?auto_19142 ) ) ( not ( = ?auto_19120 ?auto_19119 ) ) ( not ( = ?auto_19120 ?auto_19116 ) ) ( not ( = ?auto_19120 ?auto_19138 ) ) ( not ( = ?auto_19137 ?auto_19128 ) ) ( not ( = ?auto_19137 ?auto_19130 ) ) ( not ( = ?auto_19137 ?auto_19127 ) ) ( not ( = ?auto_19137 ?auto_19129 ) ) ( not ( = ?auto_19137 ?auto_19132 ) ) ( not ( = ?auto_19137 ?auto_19118 ) ) ( not ( = ?auto_19137 ?auto_19133 ) ) ( not ( = ?auto_19097 ?auto_19104 ) ) ( not ( = ?auto_19097 ?auto_19140 ) ) ( not ( = ?auto_19098 ?auto_19104 ) ) ( not ( = ?auto_19098 ?auto_19140 ) ) ( not ( = ?auto_19099 ?auto_19104 ) ) ( not ( = ?auto_19099 ?auto_19140 ) ) ( not ( = ?auto_19100 ?auto_19104 ) ) ( not ( = ?auto_19100 ?auto_19140 ) ) ( not ( = ?auto_19101 ?auto_19104 ) ) ( not ( = ?auto_19101 ?auto_19140 ) ) ( not ( = ?auto_19102 ?auto_19104 ) ) ( not ( = ?auto_19102 ?auto_19140 ) ) ( not ( = ?auto_19103 ?auto_19104 ) ) ( not ( = ?auto_19103 ?auto_19140 ) ) ( not ( = ?auto_19106 ?auto_19104 ) ) ( not ( = ?auto_19106 ?auto_19140 ) ) ( not ( = ?auto_19104 ?auto_19137 ) ) ( not ( = ?auto_19104 ?auto_19128 ) ) ( not ( = ?auto_19104 ?auto_19130 ) ) ( not ( = ?auto_19104 ?auto_19127 ) ) ( not ( = ?auto_19104 ?auto_19129 ) ) ( not ( = ?auto_19104 ?auto_19132 ) ) ( not ( = ?auto_19104 ?auto_19118 ) ) ( not ( = ?auto_19104 ?auto_19133 ) ) ( not ( = ?auto_19140 ?auto_19137 ) ) ( not ( = ?auto_19140 ?auto_19128 ) ) ( not ( = ?auto_19140 ?auto_19130 ) ) ( not ( = ?auto_19140 ?auto_19127 ) ) ( not ( = ?auto_19140 ?auto_19129 ) ) ( not ( = ?auto_19140 ?auto_19132 ) ) ( not ( = ?auto_19140 ?auto_19118 ) ) ( not ( = ?auto_19140 ?auto_19133 ) ) ( not ( = ?auto_19097 ?auto_19107 ) ) ( not ( = ?auto_19097 ?auto_19134 ) ) ( not ( = ?auto_19098 ?auto_19107 ) ) ( not ( = ?auto_19098 ?auto_19134 ) ) ( not ( = ?auto_19099 ?auto_19107 ) ) ( not ( = ?auto_19099 ?auto_19134 ) ) ( not ( = ?auto_19100 ?auto_19107 ) ) ( not ( = ?auto_19100 ?auto_19134 ) ) ( not ( = ?auto_19101 ?auto_19107 ) ) ( not ( = ?auto_19101 ?auto_19134 ) ) ( not ( = ?auto_19102 ?auto_19107 ) ) ( not ( = ?auto_19102 ?auto_19134 ) ) ( not ( = ?auto_19103 ?auto_19107 ) ) ( not ( = ?auto_19103 ?auto_19134 ) ) ( not ( = ?auto_19106 ?auto_19107 ) ) ( not ( = ?auto_19106 ?auto_19134 ) ) ( not ( = ?auto_19105 ?auto_19107 ) ) ( not ( = ?auto_19105 ?auto_19134 ) ) ( not ( = ?auto_19107 ?auto_19140 ) ) ( not ( = ?auto_19107 ?auto_19137 ) ) ( not ( = ?auto_19107 ?auto_19128 ) ) ( not ( = ?auto_19107 ?auto_19130 ) ) ( not ( = ?auto_19107 ?auto_19127 ) ) ( not ( = ?auto_19107 ?auto_19129 ) ) ( not ( = ?auto_19107 ?auto_19132 ) ) ( not ( = ?auto_19107 ?auto_19118 ) ) ( not ( = ?auto_19107 ?auto_19133 ) ) ( not ( = ?auto_19134 ?auto_19140 ) ) ( not ( = ?auto_19134 ?auto_19137 ) ) ( not ( = ?auto_19134 ?auto_19128 ) ) ( not ( = ?auto_19134 ?auto_19130 ) ) ( not ( = ?auto_19134 ?auto_19127 ) ) ( not ( = ?auto_19134 ?auto_19129 ) ) ( not ( = ?auto_19134 ?auto_19132 ) ) ( not ( = ?auto_19134 ?auto_19118 ) ) ( not ( = ?auto_19134 ?auto_19133 ) ) ( not ( = ?auto_19097 ?auto_19108 ) ) ( not ( = ?auto_19097 ?auto_19141 ) ) ( not ( = ?auto_19098 ?auto_19108 ) ) ( not ( = ?auto_19098 ?auto_19141 ) ) ( not ( = ?auto_19099 ?auto_19108 ) ) ( not ( = ?auto_19099 ?auto_19141 ) ) ( not ( = ?auto_19100 ?auto_19108 ) ) ( not ( = ?auto_19100 ?auto_19141 ) ) ( not ( = ?auto_19101 ?auto_19108 ) ) ( not ( = ?auto_19101 ?auto_19141 ) ) ( not ( = ?auto_19102 ?auto_19108 ) ) ( not ( = ?auto_19102 ?auto_19141 ) ) ( not ( = ?auto_19103 ?auto_19108 ) ) ( not ( = ?auto_19103 ?auto_19141 ) ) ( not ( = ?auto_19106 ?auto_19108 ) ) ( not ( = ?auto_19106 ?auto_19141 ) ) ( not ( = ?auto_19105 ?auto_19108 ) ) ( not ( = ?auto_19105 ?auto_19141 ) ) ( not ( = ?auto_19104 ?auto_19108 ) ) ( not ( = ?auto_19104 ?auto_19141 ) ) ( not ( = ?auto_19108 ?auto_19134 ) ) ( not ( = ?auto_19108 ?auto_19140 ) ) ( not ( = ?auto_19108 ?auto_19137 ) ) ( not ( = ?auto_19108 ?auto_19128 ) ) ( not ( = ?auto_19108 ?auto_19130 ) ) ( not ( = ?auto_19108 ?auto_19127 ) ) ( not ( = ?auto_19108 ?auto_19129 ) ) ( not ( = ?auto_19108 ?auto_19132 ) ) ( not ( = ?auto_19108 ?auto_19118 ) ) ( not ( = ?auto_19108 ?auto_19133 ) ) ( not ( = ?auto_19121 ?auto_19117 ) ) ( not ( = ?auto_19121 ?auto_19124 ) ) ( not ( = ?auto_19121 ?auto_19136 ) ) ( not ( = ?auto_19121 ?auto_19126 ) ) ( not ( = ?auto_19121 ?auto_19125 ) ) ( not ( = ?auto_19121 ?auto_19139 ) ) ( not ( = ?auto_19121 ?auto_19131 ) ) ( not ( = ?auto_19122 ?auto_19142 ) ) ( not ( = ?auto_19122 ?auto_19116 ) ) ( not ( = ?auto_19122 ?auto_19120 ) ) ( not ( = ?auto_19122 ?auto_19123 ) ) ( not ( = ?auto_19122 ?auto_19135 ) ) ( not ( = ?auto_19122 ?auto_19119 ) ) ( not ( = ?auto_19122 ?auto_19138 ) ) ( not ( = ?auto_19141 ?auto_19134 ) ) ( not ( = ?auto_19141 ?auto_19140 ) ) ( not ( = ?auto_19141 ?auto_19137 ) ) ( not ( = ?auto_19141 ?auto_19128 ) ) ( not ( = ?auto_19141 ?auto_19130 ) ) ( not ( = ?auto_19141 ?auto_19127 ) ) ( not ( = ?auto_19141 ?auto_19129 ) ) ( not ( = ?auto_19141 ?auto_19132 ) ) ( not ( = ?auto_19141 ?auto_19118 ) ) ( not ( = ?auto_19141 ?auto_19133 ) ) ( not ( = ?auto_19097 ?auto_19109 ) ) ( not ( = ?auto_19097 ?auto_19110 ) ) ( not ( = ?auto_19098 ?auto_19109 ) ) ( not ( = ?auto_19098 ?auto_19110 ) ) ( not ( = ?auto_19099 ?auto_19109 ) ) ( not ( = ?auto_19099 ?auto_19110 ) ) ( not ( = ?auto_19100 ?auto_19109 ) ) ( not ( = ?auto_19100 ?auto_19110 ) ) ( not ( = ?auto_19101 ?auto_19109 ) ) ( not ( = ?auto_19101 ?auto_19110 ) ) ( not ( = ?auto_19102 ?auto_19109 ) ) ( not ( = ?auto_19102 ?auto_19110 ) ) ( not ( = ?auto_19103 ?auto_19109 ) ) ( not ( = ?auto_19103 ?auto_19110 ) ) ( not ( = ?auto_19106 ?auto_19109 ) ) ( not ( = ?auto_19106 ?auto_19110 ) ) ( not ( = ?auto_19105 ?auto_19109 ) ) ( not ( = ?auto_19105 ?auto_19110 ) ) ( not ( = ?auto_19104 ?auto_19109 ) ) ( not ( = ?auto_19104 ?auto_19110 ) ) ( not ( = ?auto_19107 ?auto_19109 ) ) ( not ( = ?auto_19107 ?auto_19110 ) ) ( not ( = ?auto_19109 ?auto_19141 ) ) ( not ( = ?auto_19109 ?auto_19134 ) ) ( not ( = ?auto_19109 ?auto_19140 ) ) ( not ( = ?auto_19109 ?auto_19137 ) ) ( not ( = ?auto_19109 ?auto_19128 ) ) ( not ( = ?auto_19109 ?auto_19130 ) ) ( not ( = ?auto_19109 ?auto_19127 ) ) ( not ( = ?auto_19109 ?auto_19129 ) ) ( not ( = ?auto_19109 ?auto_19132 ) ) ( not ( = ?auto_19109 ?auto_19118 ) ) ( not ( = ?auto_19109 ?auto_19133 ) ) ( not ( = ?auto_19114 ?auto_19121 ) ) ( not ( = ?auto_19114 ?auto_19117 ) ) ( not ( = ?auto_19114 ?auto_19124 ) ) ( not ( = ?auto_19114 ?auto_19136 ) ) ( not ( = ?auto_19114 ?auto_19126 ) ) ( not ( = ?auto_19114 ?auto_19125 ) ) ( not ( = ?auto_19114 ?auto_19139 ) ) ( not ( = ?auto_19114 ?auto_19131 ) ) ( not ( = ?auto_19115 ?auto_19122 ) ) ( not ( = ?auto_19115 ?auto_19142 ) ) ( not ( = ?auto_19115 ?auto_19116 ) ) ( not ( = ?auto_19115 ?auto_19120 ) ) ( not ( = ?auto_19115 ?auto_19123 ) ) ( not ( = ?auto_19115 ?auto_19135 ) ) ( not ( = ?auto_19115 ?auto_19119 ) ) ( not ( = ?auto_19115 ?auto_19138 ) ) ( not ( = ?auto_19110 ?auto_19141 ) ) ( not ( = ?auto_19110 ?auto_19134 ) ) ( not ( = ?auto_19110 ?auto_19140 ) ) ( not ( = ?auto_19110 ?auto_19137 ) ) ( not ( = ?auto_19110 ?auto_19128 ) ) ( not ( = ?auto_19110 ?auto_19130 ) ) ( not ( = ?auto_19110 ?auto_19127 ) ) ( not ( = ?auto_19110 ?auto_19129 ) ) ( not ( = ?auto_19110 ?auto_19132 ) ) ( not ( = ?auto_19110 ?auto_19118 ) ) ( not ( = ?auto_19110 ?auto_19133 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_19097 ?auto_19098 ?auto_19099 ?auto_19100 ?auto_19101 ?auto_19102 ?auto_19103 ?auto_19106 ?auto_19105 ?auto_19104 ?auto_19107 ?auto_19108 )
      ( MAKE-1CRATE ?auto_19108 ?auto_19109 )
      ( MAKE-12CRATE-VERIFY ?auto_19097 ?auto_19098 ?auto_19099 ?auto_19100 ?auto_19101 ?auto_19102 ?auto_19103 ?auto_19106 ?auto_19105 ?auto_19104 ?auto_19107 ?auto_19108 ?auto_19109 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19145 - SURFACE
      ?auto_19146 - SURFACE
    )
    :vars
    (
      ?auto_19147 - HOIST
      ?auto_19148 - PLACE
      ?auto_19150 - PLACE
      ?auto_19151 - HOIST
      ?auto_19152 - SURFACE
      ?auto_19149 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19147 ?auto_19148 ) ( SURFACE-AT ?auto_19145 ?auto_19148 ) ( CLEAR ?auto_19145 ) ( IS-CRATE ?auto_19146 ) ( AVAILABLE ?auto_19147 ) ( not ( = ?auto_19150 ?auto_19148 ) ) ( HOIST-AT ?auto_19151 ?auto_19150 ) ( AVAILABLE ?auto_19151 ) ( SURFACE-AT ?auto_19146 ?auto_19150 ) ( ON ?auto_19146 ?auto_19152 ) ( CLEAR ?auto_19146 ) ( TRUCK-AT ?auto_19149 ?auto_19148 ) ( not ( = ?auto_19145 ?auto_19146 ) ) ( not ( = ?auto_19145 ?auto_19152 ) ) ( not ( = ?auto_19146 ?auto_19152 ) ) ( not ( = ?auto_19147 ?auto_19151 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19149 ?auto_19148 ?auto_19150 )
      ( !LIFT ?auto_19151 ?auto_19146 ?auto_19152 ?auto_19150 )
      ( !LOAD ?auto_19151 ?auto_19146 ?auto_19149 ?auto_19150 )
      ( !DRIVE ?auto_19149 ?auto_19150 ?auto_19148 )
      ( !UNLOAD ?auto_19147 ?auto_19146 ?auto_19149 ?auto_19148 )
      ( !DROP ?auto_19147 ?auto_19146 ?auto_19145 ?auto_19148 )
      ( MAKE-1CRATE-VERIFY ?auto_19145 ?auto_19146 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_19167 - SURFACE
      ?auto_19168 - SURFACE
      ?auto_19169 - SURFACE
      ?auto_19170 - SURFACE
      ?auto_19171 - SURFACE
      ?auto_19172 - SURFACE
      ?auto_19173 - SURFACE
      ?auto_19176 - SURFACE
      ?auto_19175 - SURFACE
      ?auto_19174 - SURFACE
      ?auto_19177 - SURFACE
      ?auto_19178 - SURFACE
      ?auto_19179 - SURFACE
      ?auto_19180 - SURFACE
    )
    :vars
    (
      ?auto_19181 - HOIST
      ?auto_19182 - PLACE
      ?auto_19184 - PLACE
      ?auto_19183 - HOIST
      ?auto_19186 - SURFACE
      ?auto_19210 - PLACE
      ?auto_19196 - HOIST
      ?auto_19190 - SURFACE
      ?auto_19199 - PLACE
      ?auto_19208 - HOIST
      ?auto_19192 - SURFACE
      ?auto_19207 - PLACE
      ?auto_19195 - HOIST
      ?auto_19188 - SURFACE
      ?auto_19205 - PLACE
      ?auto_19209 - HOIST
      ?auto_19212 - SURFACE
      ?auto_19204 - PLACE
      ?auto_19193 - HOIST
      ?auto_19200 - SURFACE
      ?auto_19214 - PLACE
      ?auto_19187 - HOIST
      ?auto_19213 - SURFACE
      ?auto_19202 - SURFACE
      ?auto_19189 - SURFACE
      ?auto_19211 - PLACE
      ?auto_19197 - HOIST
      ?auto_19191 - SURFACE
      ?auto_19194 - SURFACE
      ?auto_19206 - PLACE
      ?auto_19203 - HOIST
      ?auto_19198 - SURFACE
      ?auto_19201 - SURFACE
      ?auto_19185 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19181 ?auto_19182 ) ( IS-CRATE ?auto_19180 ) ( not ( = ?auto_19184 ?auto_19182 ) ) ( HOIST-AT ?auto_19183 ?auto_19184 ) ( SURFACE-AT ?auto_19180 ?auto_19184 ) ( ON ?auto_19180 ?auto_19186 ) ( CLEAR ?auto_19180 ) ( not ( = ?auto_19179 ?auto_19180 ) ) ( not ( = ?auto_19179 ?auto_19186 ) ) ( not ( = ?auto_19180 ?auto_19186 ) ) ( not ( = ?auto_19181 ?auto_19183 ) ) ( IS-CRATE ?auto_19179 ) ( not ( = ?auto_19210 ?auto_19182 ) ) ( HOIST-AT ?auto_19196 ?auto_19210 ) ( AVAILABLE ?auto_19196 ) ( SURFACE-AT ?auto_19179 ?auto_19210 ) ( ON ?auto_19179 ?auto_19190 ) ( CLEAR ?auto_19179 ) ( not ( = ?auto_19178 ?auto_19179 ) ) ( not ( = ?auto_19178 ?auto_19190 ) ) ( not ( = ?auto_19179 ?auto_19190 ) ) ( not ( = ?auto_19181 ?auto_19196 ) ) ( IS-CRATE ?auto_19178 ) ( not ( = ?auto_19199 ?auto_19182 ) ) ( HOIST-AT ?auto_19208 ?auto_19199 ) ( AVAILABLE ?auto_19208 ) ( SURFACE-AT ?auto_19178 ?auto_19199 ) ( ON ?auto_19178 ?auto_19192 ) ( CLEAR ?auto_19178 ) ( not ( = ?auto_19177 ?auto_19178 ) ) ( not ( = ?auto_19177 ?auto_19192 ) ) ( not ( = ?auto_19178 ?auto_19192 ) ) ( not ( = ?auto_19181 ?auto_19208 ) ) ( IS-CRATE ?auto_19177 ) ( not ( = ?auto_19207 ?auto_19182 ) ) ( HOIST-AT ?auto_19195 ?auto_19207 ) ( SURFACE-AT ?auto_19177 ?auto_19207 ) ( ON ?auto_19177 ?auto_19188 ) ( CLEAR ?auto_19177 ) ( not ( = ?auto_19174 ?auto_19177 ) ) ( not ( = ?auto_19174 ?auto_19188 ) ) ( not ( = ?auto_19177 ?auto_19188 ) ) ( not ( = ?auto_19181 ?auto_19195 ) ) ( IS-CRATE ?auto_19174 ) ( not ( = ?auto_19205 ?auto_19182 ) ) ( HOIST-AT ?auto_19209 ?auto_19205 ) ( SURFACE-AT ?auto_19174 ?auto_19205 ) ( ON ?auto_19174 ?auto_19212 ) ( CLEAR ?auto_19174 ) ( not ( = ?auto_19175 ?auto_19174 ) ) ( not ( = ?auto_19175 ?auto_19212 ) ) ( not ( = ?auto_19174 ?auto_19212 ) ) ( not ( = ?auto_19181 ?auto_19209 ) ) ( IS-CRATE ?auto_19175 ) ( not ( = ?auto_19204 ?auto_19182 ) ) ( HOIST-AT ?auto_19193 ?auto_19204 ) ( AVAILABLE ?auto_19193 ) ( SURFACE-AT ?auto_19175 ?auto_19204 ) ( ON ?auto_19175 ?auto_19200 ) ( CLEAR ?auto_19175 ) ( not ( = ?auto_19176 ?auto_19175 ) ) ( not ( = ?auto_19176 ?auto_19200 ) ) ( not ( = ?auto_19175 ?auto_19200 ) ) ( not ( = ?auto_19181 ?auto_19193 ) ) ( IS-CRATE ?auto_19176 ) ( not ( = ?auto_19214 ?auto_19182 ) ) ( HOIST-AT ?auto_19187 ?auto_19214 ) ( AVAILABLE ?auto_19187 ) ( SURFACE-AT ?auto_19176 ?auto_19214 ) ( ON ?auto_19176 ?auto_19213 ) ( CLEAR ?auto_19176 ) ( not ( = ?auto_19173 ?auto_19176 ) ) ( not ( = ?auto_19173 ?auto_19213 ) ) ( not ( = ?auto_19176 ?auto_19213 ) ) ( not ( = ?auto_19181 ?auto_19187 ) ) ( IS-CRATE ?auto_19173 ) ( AVAILABLE ?auto_19183 ) ( SURFACE-AT ?auto_19173 ?auto_19184 ) ( ON ?auto_19173 ?auto_19202 ) ( CLEAR ?auto_19173 ) ( not ( = ?auto_19172 ?auto_19173 ) ) ( not ( = ?auto_19172 ?auto_19202 ) ) ( not ( = ?auto_19173 ?auto_19202 ) ) ( IS-CRATE ?auto_19172 ) ( AVAILABLE ?auto_19195 ) ( SURFACE-AT ?auto_19172 ?auto_19207 ) ( ON ?auto_19172 ?auto_19189 ) ( CLEAR ?auto_19172 ) ( not ( = ?auto_19171 ?auto_19172 ) ) ( not ( = ?auto_19171 ?auto_19189 ) ) ( not ( = ?auto_19172 ?auto_19189 ) ) ( IS-CRATE ?auto_19171 ) ( not ( = ?auto_19211 ?auto_19182 ) ) ( HOIST-AT ?auto_19197 ?auto_19211 ) ( SURFACE-AT ?auto_19171 ?auto_19211 ) ( ON ?auto_19171 ?auto_19191 ) ( CLEAR ?auto_19171 ) ( not ( = ?auto_19170 ?auto_19171 ) ) ( not ( = ?auto_19170 ?auto_19191 ) ) ( not ( = ?auto_19171 ?auto_19191 ) ) ( not ( = ?auto_19181 ?auto_19197 ) ) ( IS-CRATE ?auto_19170 ) ( AVAILABLE ?auto_19209 ) ( SURFACE-AT ?auto_19170 ?auto_19205 ) ( ON ?auto_19170 ?auto_19194 ) ( CLEAR ?auto_19170 ) ( not ( = ?auto_19169 ?auto_19170 ) ) ( not ( = ?auto_19169 ?auto_19194 ) ) ( not ( = ?auto_19170 ?auto_19194 ) ) ( IS-CRATE ?auto_19169 ) ( not ( = ?auto_19206 ?auto_19182 ) ) ( HOIST-AT ?auto_19203 ?auto_19206 ) ( AVAILABLE ?auto_19203 ) ( SURFACE-AT ?auto_19169 ?auto_19206 ) ( ON ?auto_19169 ?auto_19198 ) ( CLEAR ?auto_19169 ) ( not ( = ?auto_19168 ?auto_19169 ) ) ( not ( = ?auto_19168 ?auto_19198 ) ) ( not ( = ?auto_19169 ?auto_19198 ) ) ( not ( = ?auto_19181 ?auto_19203 ) ) ( SURFACE-AT ?auto_19167 ?auto_19182 ) ( CLEAR ?auto_19167 ) ( IS-CRATE ?auto_19168 ) ( AVAILABLE ?auto_19181 ) ( AVAILABLE ?auto_19197 ) ( SURFACE-AT ?auto_19168 ?auto_19211 ) ( ON ?auto_19168 ?auto_19201 ) ( CLEAR ?auto_19168 ) ( TRUCK-AT ?auto_19185 ?auto_19182 ) ( not ( = ?auto_19167 ?auto_19168 ) ) ( not ( = ?auto_19167 ?auto_19201 ) ) ( not ( = ?auto_19168 ?auto_19201 ) ) ( not ( = ?auto_19167 ?auto_19169 ) ) ( not ( = ?auto_19167 ?auto_19198 ) ) ( not ( = ?auto_19169 ?auto_19201 ) ) ( not ( = ?auto_19206 ?auto_19211 ) ) ( not ( = ?auto_19203 ?auto_19197 ) ) ( not ( = ?auto_19198 ?auto_19201 ) ) ( not ( = ?auto_19167 ?auto_19170 ) ) ( not ( = ?auto_19167 ?auto_19194 ) ) ( not ( = ?auto_19168 ?auto_19170 ) ) ( not ( = ?auto_19168 ?auto_19194 ) ) ( not ( = ?auto_19170 ?auto_19198 ) ) ( not ( = ?auto_19170 ?auto_19201 ) ) ( not ( = ?auto_19205 ?auto_19206 ) ) ( not ( = ?auto_19205 ?auto_19211 ) ) ( not ( = ?auto_19209 ?auto_19203 ) ) ( not ( = ?auto_19209 ?auto_19197 ) ) ( not ( = ?auto_19194 ?auto_19198 ) ) ( not ( = ?auto_19194 ?auto_19201 ) ) ( not ( = ?auto_19167 ?auto_19171 ) ) ( not ( = ?auto_19167 ?auto_19191 ) ) ( not ( = ?auto_19168 ?auto_19171 ) ) ( not ( = ?auto_19168 ?auto_19191 ) ) ( not ( = ?auto_19169 ?auto_19171 ) ) ( not ( = ?auto_19169 ?auto_19191 ) ) ( not ( = ?auto_19171 ?auto_19194 ) ) ( not ( = ?auto_19171 ?auto_19198 ) ) ( not ( = ?auto_19171 ?auto_19201 ) ) ( not ( = ?auto_19191 ?auto_19194 ) ) ( not ( = ?auto_19191 ?auto_19198 ) ) ( not ( = ?auto_19191 ?auto_19201 ) ) ( not ( = ?auto_19167 ?auto_19172 ) ) ( not ( = ?auto_19167 ?auto_19189 ) ) ( not ( = ?auto_19168 ?auto_19172 ) ) ( not ( = ?auto_19168 ?auto_19189 ) ) ( not ( = ?auto_19169 ?auto_19172 ) ) ( not ( = ?auto_19169 ?auto_19189 ) ) ( not ( = ?auto_19170 ?auto_19172 ) ) ( not ( = ?auto_19170 ?auto_19189 ) ) ( not ( = ?auto_19172 ?auto_19191 ) ) ( not ( = ?auto_19172 ?auto_19194 ) ) ( not ( = ?auto_19172 ?auto_19198 ) ) ( not ( = ?auto_19172 ?auto_19201 ) ) ( not ( = ?auto_19207 ?auto_19211 ) ) ( not ( = ?auto_19207 ?auto_19205 ) ) ( not ( = ?auto_19207 ?auto_19206 ) ) ( not ( = ?auto_19195 ?auto_19197 ) ) ( not ( = ?auto_19195 ?auto_19209 ) ) ( not ( = ?auto_19195 ?auto_19203 ) ) ( not ( = ?auto_19189 ?auto_19191 ) ) ( not ( = ?auto_19189 ?auto_19194 ) ) ( not ( = ?auto_19189 ?auto_19198 ) ) ( not ( = ?auto_19189 ?auto_19201 ) ) ( not ( = ?auto_19167 ?auto_19173 ) ) ( not ( = ?auto_19167 ?auto_19202 ) ) ( not ( = ?auto_19168 ?auto_19173 ) ) ( not ( = ?auto_19168 ?auto_19202 ) ) ( not ( = ?auto_19169 ?auto_19173 ) ) ( not ( = ?auto_19169 ?auto_19202 ) ) ( not ( = ?auto_19170 ?auto_19173 ) ) ( not ( = ?auto_19170 ?auto_19202 ) ) ( not ( = ?auto_19171 ?auto_19173 ) ) ( not ( = ?auto_19171 ?auto_19202 ) ) ( not ( = ?auto_19173 ?auto_19189 ) ) ( not ( = ?auto_19173 ?auto_19191 ) ) ( not ( = ?auto_19173 ?auto_19194 ) ) ( not ( = ?auto_19173 ?auto_19198 ) ) ( not ( = ?auto_19173 ?auto_19201 ) ) ( not ( = ?auto_19184 ?auto_19207 ) ) ( not ( = ?auto_19184 ?auto_19211 ) ) ( not ( = ?auto_19184 ?auto_19205 ) ) ( not ( = ?auto_19184 ?auto_19206 ) ) ( not ( = ?auto_19183 ?auto_19195 ) ) ( not ( = ?auto_19183 ?auto_19197 ) ) ( not ( = ?auto_19183 ?auto_19209 ) ) ( not ( = ?auto_19183 ?auto_19203 ) ) ( not ( = ?auto_19202 ?auto_19189 ) ) ( not ( = ?auto_19202 ?auto_19191 ) ) ( not ( = ?auto_19202 ?auto_19194 ) ) ( not ( = ?auto_19202 ?auto_19198 ) ) ( not ( = ?auto_19202 ?auto_19201 ) ) ( not ( = ?auto_19167 ?auto_19176 ) ) ( not ( = ?auto_19167 ?auto_19213 ) ) ( not ( = ?auto_19168 ?auto_19176 ) ) ( not ( = ?auto_19168 ?auto_19213 ) ) ( not ( = ?auto_19169 ?auto_19176 ) ) ( not ( = ?auto_19169 ?auto_19213 ) ) ( not ( = ?auto_19170 ?auto_19176 ) ) ( not ( = ?auto_19170 ?auto_19213 ) ) ( not ( = ?auto_19171 ?auto_19176 ) ) ( not ( = ?auto_19171 ?auto_19213 ) ) ( not ( = ?auto_19172 ?auto_19176 ) ) ( not ( = ?auto_19172 ?auto_19213 ) ) ( not ( = ?auto_19176 ?auto_19202 ) ) ( not ( = ?auto_19176 ?auto_19189 ) ) ( not ( = ?auto_19176 ?auto_19191 ) ) ( not ( = ?auto_19176 ?auto_19194 ) ) ( not ( = ?auto_19176 ?auto_19198 ) ) ( not ( = ?auto_19176 ?auto_19201 ) ) ( not ( = ?auto_19214 ?auto_19184 ) ) ( not ( = ?auto_19214 ?auto_19207 ) ) ( not ( = ?auto_19214 ?auto_19211 ) ) ( not ( = ?auto_19214 ?auto_19205 ) ) ( not ( = ?auto_19214 ?auto_19206 ) ) ( not ( = ?auto_19187 ?auto_19183 ) ) ( not ( = ?auto_19187 ?auto_19195 ) ) ( not ( = ?auto_19187 ?auto_19197 ) ) ( not ( = ?auto_19187 ?auto_19209 ) ) ( not ( = ?auto_19187 ?auto_19203 ) ) ( not ( = ?auto_19213 ?auto_19202 ) ) ( not ( = ?auto_19213 ?auto_19189 ) ) ( not ( = ?auto_19213 ?auto_19191 ) ) ( not ( = ?auto_19213 ?auto_19194 ) ) ( not ( = ?auto_19213 ?auto_19198 ) ) ( not ( = ?auto_19213 ?auto_19201 ) ) ( not ( = ?auto_19167 ?auto_19175 ) ) ( not ( = ?auto_19167 ?auto_19200 ) ) ( not ( = ?auto_19168 ?auto_19175 ) ) ( not ( = ?auto_19168 ?auto_19200 ) ) ( not ( = ?auto_19169 ?auto_19175 ) ) ( not ( = ?auto_19169 ?auto_19200 ) ) ( not ( = ?auto_19170 ?auto_19175 ) ) ( not ( = ?auto_19170 ?auto_19200 ) ) ( not ( = ?auto_19171 ?auto_19175 ) ) ( not ( = ?auto_19171 ?auto_19200 ) ) ( not ( = ?auto_19172 ?auto_19175 ) ) ( not ( = ?auto_19172 ?auto_19200 ) ) ( not ( = ?auto_19173 ?auto_19175 ) ) ( not ( = ?auto_19173 ?auto_19200 ) ) ( not ( = ?auto_19175 ?auto_19213 ) ) ( not ( = ?auto_19175 ?auto_19202 ) ) ( not ( = ?auto_19175 ?auto_19189 ) ) ( not ( = ?auto_19175 ?auto_19191 ) ) ( not ( = ?auto_19175 ?auto_19194 ) ) ( not ( = ?auto_19175 ?auto_19198 ) ) ( not ( = ?auto_19175 ?auto_19201 ) ) ( not ( = ?auto_19204 ?auto_19214 ) ) ( not ( = ?auto_19204 ?auto_19184 ) ) ( not ( = ?auto_19204 ?auto_19207 ) ) ( not ( = ?auto_19204 ?auto_19211 ) ) ( not ( = ?auto_19204 ?auto_19205 ) ) ( not ( = ?auto_19204 ?auto_19206 ) ) ( not ( = ?auto_19193 ?auto_19187 ) ) ( not ( = ?auto_19193 ?auto_19183 ) ) ( not ( = ?auto_19193 ?auto_19195 ) ) ( not ( = ?auto_19193 ?auto_19197 ) ) ( not ( = ?auto_19193 ?auto_19209 ) ) ( not ( = ?auto_19193 ?auto_19203 ) ) ( not ( = ?auto_19200 ?auto_19213 ) ) ( not ( = ?auto_19200 ?auto_19202 ) ) ( not ( = ?auto_19200 ?auto_19189 ) ) ( not ( = ?auto_19200 ?auto_19191 ) ) ( not ( = ?auto_19200 ?auto_19194 ) ) ( not ( = ?auto_19200 ?auto_19198 ) ) ( not ( = ?auto_19200 ?auto_19201 ) ) ( not ( = ?auto_19167 ?auto_19174 ) ) ( not ( = ?auto_19167 ?auto_19212 ) ) ( not ( = ?auto_19168 ?auto_19174 ) ) ( not ( = ?auto_19168 ?auto_19212 ) ) ( not ( = ?auto_19169 ?auto_19174 ) ) ( not ( = ?auto_19169 ?auto_19212 ) ) ( not ( = ?auto_19170 ?auto_19174 ) ) ( not ( = ?auto_19170 ?auto_19212 ) ) ( not ( = ?auto_19171 ?auto_19174 ) ) ( not ( = ?auto_19171 ?auto_19212 ) ) ( not ( = ?auto_19172 ?auto_19174 ) ) ( not ( = ?auto_19172 ?auto_19212 ) ) ( not ( = ?auto_19173 ?auto_19174 ) ) ( not ( = ?auto_19173 ?auto_19212 ) ) ( not ( = ?auto_19176 ?auto_19174 ) ) ( not ( = ?auto_19176 ?auto_19212 ) ) ( not ( = ?auto_19174 ?auto_19200 ) ) ( not ( = ?auto_19174 ?auto_19213 ) ) ( not ( = ?auto_19174 ?auto_19202 ) ) ( not ( = ?auto_19174 ?auto_19189 ) ) ( not ( = ?auto_19174 ?auto_19191 ) ) ( not ( = ?auto_19174 ?auto_19194 ) ) ( not ( = ?auto_19174 ?auto_19198 ) ) ( not ( = ?auto_19174 ?auto_19201 ) ) ( not ( = ?auto_19212 ?auto_19200 ) ) ( not ( = ?auto_19212 ?auto_19213 ) ) ( not ( = ?auto_19212 ?auto_19202 ) ) ( not ( = ?auto_19212 ?auto_19189 ) ) ( not ( = ?auto_19212 ?auto_19191 ) ) ( not ( = ?auto_19212 ?auto_19194 ) ) ( not ( = ?auto_19212 ?auto_19198 ) ) ( not ( = ?auto_19212 ?auto_19201 ) ) ( not ( = ?auto_19167 ?auto_19177 ) ) ( not ( = ?auto_19167 ?auto_19188 ) ) ( not ( = ?auto_19168 ?auto_19177 ) ) ( not ( = ?auto_19168 ?auto_19188 ) ) ( not ( = ?auto_19169 ?auto_19177 ) ) ( not ( = ?auto_19169 ?auto_19188 ) ) ( not ( = ?auto_19170 ?auto_19177 ) ) ( not ( = ?auto_19170 ?auto_19188 ) ) ( not ( = ?auto_19171 ?auto_19177 ) ) ( not ( = ?auto_19171 ?auto_19188 ) ) ( not ( = ?auto_19172 ?auto_19177 ) ) ( not ( = ?auto_19172 ?auto_19188 ) ) ( not ( = ?auto_19173 ?auto_19177 ) ) ( not ( = ?auto_19173 ?auto_19188 ) ) ( not ( = ?auto_19176 ?auto_19177 ) ) ( not ( = ?auto_19176 ?auto_19188 ) ) ( not ( = ?auto_19175 ?auto_19177 ) ) ( not ( = ?auto_19175 ?auto_19188 ) ) ( not ( = ?auto_19177 ?auto_19212 ) ) ( not ( = ?auto_19177 ?auto_19200 ) ) ( not ( = ?auto_19177 ?auto_19213 ) ) ( not ( = ?auto_19177 ?auto_19202 ) ) ( not ( = ?auto_19177 ?auto_19189 ) ) ( not ( = ?auto_19177 ?auto_19191 ) ) ( not ( = ?auto_19177 ?auto_19194 ) ) ( not ( = ?auto_19177 ?auto_19198 ) ) ( not ( = ?auto_19177 ?auto_19201 ) ) ( not ( = ?auto_19188 ?auto_19212 ) ) ( not ( = ?auto_19188 ?auto_19200 ) ) ( not ( = ?auto_19188 ?auto_19213 ) ) ( not ( = ?auto_19188 ?auto_19202 ) ) ( not ( = ?auto_19188 ?auto_19189 ) ) ( not ( = ?auto_19188 ?auto_19191 ) ) ( not ( = ?auto_19188 ?auto_19194 ) ) ( not ( = ?auto_19188 ?auto_19198 ) ) ( not ( = ?auto_19188 ?auto_19201 ) ) ( not ( = ?auto_19167 ?auto_19178 ) ) ( not ( = ?auto_19167 ?auto_19192 ) ) ( not ( = ?auto_19168 ?auto_19178 ) ) ( not ( = ?auto_19168 ?auto_19192 ) ) ( not ( = ?auto_19169 ?auto_19178 ) ) ( not ( = ?auto_19169 ?auto_19192 ) ) ( not ( = ?auto_19170 ?auto_19178 ) ) ( not ( = ?auto_19170 ?auto_19192 ) ) ( not ( = ?auto_19171 ?auto_19178 ) ) ( not ( = ?auto_19171 ?auto_19192 ) ) ( not ( = ?auto_19172 ?auto_19178 ) ) ( not ( = ?auto_19172 ?auto_19192 ) ) ( not ( = ?auto_19173 ?auto_19178 ) ) ( not ( = ?auto_19173 ?auto_19192 ) ) ( not ( = ?auto_19176 ?auto_19178 ) ) ( not ( = ?auto_19176 ?auto_19192 ) ) ( not ( = ?auto_19175 ?auto_19178 ) ) ( not ( = ?auto_19175 ?auto_19192 ) ) ( not ( = ?auto_19174 ?auto_19178 ) ) ( not ( = ?auto_19174 ?auto_19192 ) ) ( not ( = ?auto_19178 ?auto_19188 ) ) ( not ( = ?auto_19178 ?auto_19212 ) ) ( not ( = ?auto_19178 ?auto_19200 ) ) ( not ( = ?auto_19178 ?auto_19213 ) ) ( not ( = ?auto_19178 ?auto_19202 ) ) ( not ( = ?auto_19178 ?auto_19189 ) ) ( not ( = ?auto_19178 ?auto_19191 ) ) ( not ( = ?auto_19178 ?auto_19194 ) ) ( not ( = ?auto_19178 ?auto_19198 ) ) ( not ( = ?auto_19178 ?auto_19201 ) ) ( not ( = ?auto_19199 ?auto_19207 ) ) ( not ( = ?auto_19199 ?auto_19205 ) ) ( not ( = ?auto_19199 ?auto_19204 ) ) ( not ( = ?auto_19199 ?auto_19214 ) ) ( not ( = ?auto_19199 ?auto_19184 ) ) ( not ( = ?auto_19199 ?auto_19211 ) ) ( not ( = ?auto_19199 ?auto_19206 ) ) ( not ( = ?auto_19208 ?auto_19195 ) ) ( not ( = ?auto_19208 ?auto_19209 ) ) ( not ( = ?auto_19208 ?auto_19193 ) ) ( not ( = ?auto_19208 ?auto_19187 ) ) ( not ( = ?auto_19208 ?auto_19183 ) ) ( not ( = ?auto_19208 ?auto_19197 ) ) ( not ( = ?auto_19208 ?auto_19203 ) ) ( not ( = ?auto_19192 ?auto_19188 ) ) ( not ( = ?auto_19192 ?auto_19212 ) ) ( not ( = ?auto_19192 ?auto_19200 ) ) ( not ( = ?auto_19192 ?auto_19213 ) ) ( not ( = ?auto_19192 ?auto_19202 ) ) ( not ( = ?auto_19192 ?auto_19189 ) ) ( not ( = ?auto_19192 ?auto_19191 ) ) ( not ( = ?auto_19192 ?auto_19194 ) ) ( not ( = ?auto_19192 ?auto_19198 ) ) ( not ( = ?auto_19192 ?auto_19201 ) ) ( not ( = ?auto_19167 ?auto_19179 ) ) ( not ( = ?auto_19167 ?auto_19190 ) ) ( not ( = ?auto_19168 ?auto_19179 ) ) ( not ( = ?auto_19168 ?auto_19190 ) ) ( not ( = ?auto_19169 ?auto_19179 ) ) ( not ( = ?auto_19169 ?auto_19190 ) ) ( not ( = ?auto_19170 ?auto_19179 ) ) ( not ( = ?auto_19170 ?auto_19190 ) ) ( not ( = ?auto_19171 ?auto_19179 ) ) ( not ( = ?auto_19171 ?auto_19190 ) ) ( not ( = ?auto_19172 ?auto_19179 ) ) ( not ( = ?auto_19172 ?auto_19190 ) ) ( not ( = ?auto_19173 ?auto_19179 ) ) ( not ( = ?auto_19173 ?auto_19190 ) ) ( not ( = ?auto_19176 ?auto_19179 ) ) ( not ( = ?auto_19176 ?auto_19190 ) ) ( not ( = ?auto_19175 ?auto_19179 ) ) ( not ( = ?auto_19175 ?auto_19190 ) ) ( not ( = ?auto_19174 ?auto_19179 ) ) ( not ( = ?auto_19174 ?auto_19190 ) ) ( not ( = ?auto_19177 ?auto_19179 ) ) ( not ( = ?auto_19177 ?auto_19190 ) ) ( not ( = ?auto_19179 ?auto_19192 ) ) ( not ( = ?auto_19179 ?auto_19188 ) ) ( not ( = ?auto_19179 ?auto_19212 ) ) ( not ( = ?auto_19179 ?auto_19200 ) ) ( not ( = ?auto_19179 ?auto_19213 ) ) ( not ( = ?auto_19179 ?auto_19202 ) ) ( not ( = ?auto_19179 ?auto_19189 ) ) ( not ( = ?auto_19179 ?auto_19191 ) ) ( not ( = ?auto_19179 ?auto_19194 ) ) ( not ( = ?auto_19179 ?auto_19198 ) ) ( not ( = ?auto_19179 ?auto_19201 ) ) ( not ( = ?auto_19210 ?auto_19199 ) ) ( not ( = ?auto_19210 ?auto_19207 ) ) ( not ( = ?auto_19210 ?auto_19205 ) ) ( not ( = ?auto_19210 ?auto_19204 ) ) ( not ( = ?auto_19210 ?auto_19214 ) ) ( not ( = ?auto_19210 ?auto_19184 ) ) ( not ( = ?auto_19210 ?auto_19211 ) ) ( not ( = ?auto_19210 ?auto_19206 ) ) ( not ( = ?auto_19196 ?auto_19208 ) ) ( not ( = ?auto_19196 ?auto_19195 ) ) ( not ( = ?auto_19196 ?auto_19209 ) ) ( not ( = ?auto_19196 ?auto_19193 ) ) ( not ( = ?auto_19196 ?auto_19187 ) ) ( not ( = ?auto_19196 ?auto_19183 ) ) ( not ( = ?auto_19196 ?auto_19197 ) ) ( not ( = ?auto_19196 ?auto_19203 ) ) ( not ( = ?auto_19190 ?auto_19192 ) ) ( not ( = ?auto_19190 ?auto_19188 ) ) ( not ( = ?auto_19190 ?auto_19212 ) ) ( not ( = ?auto_19190 ?auto_19200 ) ) ( not ( = ?auto_19190 ?auto_19213 ) ) ( not ( = ?auto_19190 ?auto_19202 ) ) ( not ( = ?auto_19190 ?auto_19189 ) ) ( not ( = ?auto_19190 ?auto_19191 ) ) ( not ( = ?auto_19190 ?auto_19194 ) ) ( not ( = ?auto_19190 ?auto_19198 ) ) ( not ( = ?auto_19190 ?auto_19201 ) ) ( not ( = ?auto_19167 ?auto_19180 ) ) ( not ( = ?auto_19167 ?auto_19186 ) ) ( not ( = ?auto_19168 ?auto_19180 ) ) ( not ( = ?auto_19168 ?auto_19186 ) ) ( not ( = ?auto_19169 ?auto_19180 ) ) ( not ( = ?auto_19169 ?auto_19186 ) ) ( not ( = ?auto_19170 ?auto_19180 ) ) ( not ( = ?auto_19170 ?auto_19186 ) ) ( not ( = ?auto_19171 ?auto_19180 ) ) ( not ( = ?auto_19171 ?auto_19186 ) ) ( not ( = ?auto_19172 ?auto_19180 ) ) ( not ( = ?auto_19172 ?auto_19186 ) ) ( not ( = ?auto_19173 ?auto_19180 ) ) ( not ( = ?auto_19173 ?auto_19186 ) ) ( not ( = ?auto_19176 ?auto_19180 ) ) ( not ( = ?auto_19176 ?auto_19186 ) ) ( not ( = ?auto_19175 ?auto_19180 ) ) ( not ( = ?auto_19175 ?auto_19186 ) ) ( not ( = ?auto_19174 ?auto_19180 ) ) ( not ( = ?auto_19174 ?auto_19186 ) ) ( not ( = ?auto_19177 ?auto_19180 ) ) ( not ( = ?auto_19177 ?auto_19186 ) ) ( not ( = ?auto_19178 ?auto_19180 ) ) ( not ( = ?auto_19178 ?auto_19186 ) ) ( not ( = ?auto_19180 ?auto_19190 ) ) ( not ( = ?auto_19180 ?auto_19192 ) ) ( not ( = ?auto_19180 ?auto_19188 ) ) ( not ( = ?auto_19180 ?auto_19212 ) ) ( not ( = ?auto_19180 ?auto_19200 ) ) ( not ( = ?auto_19180 ?auto_19213 ) ) ( not ( = ?auto_19180 ?auto_19202 ) ) ( not ( = ?auto_19180 ?auto_19189 ) ) ( not ( = ?auto_19180 ?auto_19191 ) ) ( not ( = ?auto_19180 ?auto_19194 ) ) ( not ( = ?auto_19180 ?auto_19198 ) ) ( not ( = ?auto_19180 ?auto_19201 ) ) ( not ( = ?auto_19186 ?auto_19190 ) ) ( not ( = ?auto_19186 ?auto_19192 ) ) ( not ( = ?auto_19186 ?auto_19188 ) ) ( not ( = ?auto_19186 ?auto_19212 ) ) ( not ( = ?auto_19186 ?auto_19200 ) ) ( not ( = ?auto_19186 ?auto_19213 ) ) ( not ( = ?auto_19186 ?auto_19202 ) ) ( not ( = ?auto_19186 ?auto_19189 ) ) ( not ( = ?auto_19186 ?auto_19191 ) ) ( not ( = ?auto_19186 ?auto_19194 ) ) ( not ( = ?auto_19186 ?auto_19198 ) ) ( not ( = ?auto_19186 ?auto_19201 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_19167 ?auto_19168 ?auto_19169 ?auto_19170 ?auto_19171 ?auto_19172 ?auto_19173 ?auto_19176 ?auto_19175 ?auto_19174 ?auto_19177 ?auto_19178 ?auto_19179 )
      ( MAKE-1CRATE ?auto_19179 ?auto_19180 )
      ( MAKE-13CRATE-VERIFY ?auto_19167 ?auto_19168 ?auto_19169 ?auto_19170 ?auto_19171 ?auto_19172 ?auto_19173 ?auto_19176 ?auto_19175 ?auto_19174 ?auto_19177 ?auto_19178 ?auto_19179 ?auto_19180 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19217 - SURFACE
      ?auto_19218 - SURFACE
    )
    :vars
    (
      ?auto_19219 - HOIST
      ?auto_19220 - PLACE
      ?auto_19222 - PLACE
      ?auto_19223 - HOIST
      ?auto_19224 - SURFACE
      ?auto_19221 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19219 ?auto_19220 ) ( SURFACE-AT ?auto_19217 ?auto_19220 ) ( CLEAR ?auto_19217 ) ( IS-CRATE ?auto_19218 ) ( AVAILABLE ?auto_19219 ) ( not ( = ?auto_19222 ?auto_19220 ) ) ( HOIST-AT ?auto_19223 ?auto_19222 ) ( AVAILABLE ?auto_19223 ) ( SURFACE-AT ?auto_19218 ?auto_19222 ) ( ON ?auto_19218 ?auto_19224 ) ( CLEAR ?auto_19218 ) ( TRUCK-AT ?auto_19221 ?auto_19220 ) ( not ( = ?auto_19217 ?auto_19218 ) ) ( not ( = ?auto_19217 ?auto_19224 ) ) ( not ( = ?auto_19218 ?auto_19224 ) ) ( not ( = ?auto_19219 ?auto_19223 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19221 ?auto_19220 ?auto_19222 )
      ( !LIFT ?auto_19223 ?auto_19218 ?auto_19224 ?auto_19222 )
      ( !LOAD ?auto_19223 ?auto_19218 ?auto_19221 ?auto_19222 )
      ( !DRIVE ?auto_19221 ?auto_19222 ?auto_19220 )
      ( !UNLOAD ?auto_19219 ?auto_19218 ?auto_19221 ?auto_19220 )
      ( !DROP ?auto_19219 ?auto_19218 ?auto_19217 ?auto_19220 )
      ( MAKE-1CRATE-VERIFY ?auto_19217 ?auto_19218 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_19240 - SURFACE
      ?auto_19241 - SURFACE
      ?auto_19242 - SURFACE
      ?auto_19243 - SURFACE
      ?auto_19244 - SURFACE
      ?auto_19245 - SURFACE
      ?auto_19246 - SURFACE
      ?auto_19249 - SURFACE
      ?auto_19248 - SURFACE
      ?auto_19247 - SURFACE
      ?auto_19250 - SURFACE
      ?auto_19251 - SURFACE
      ?auto_19252 - SURFACE
      ?auto_19253 - SURFACE
      ?auto_19254 - SURFACE
    )
    :vars
    (
      ?auto_19257 - HOIST
      ?auto_19255 - PLACE
      ?auto_19260 - PLACE
      ?auto_19258 - HOIST
      ?auto_19259 - SURFACE
      ?auto_19269 - PLACE
      ?auto_19265 - HOIST
      ?auto_19280 - SURFACE
      ?auto_19283 - PLACE
      ?auto_19273 - HOIST
      ?auto_19289 - SURFACE
      ?auto_19264 - PLACE
      ?auto_19276 - HOIST
      ?auto_19286 - SURFACE
      ?auto_19287 - PLACE
      ?auto_19291 - HOIST
      ?auto_19261 - SURFACE
      ?auto_19277 - PLACE
      ?auto_19271 - HOIST
      ?auto_19266 - SURFACE
      ?auto_19282 - PLACE
      ?auto_19274 - HOIST
      ?auto_19267 - SURFACE
      ?auto_19278 - PLACE
      ?auto_19279 - HOIST
      ?auto_19268 - SURFACE
      ?auto_19262 - SURFACE
      ?auto_19285 - SURFACE
      ?auto_19288 - PLACE
      ?auto_19263 - HOIST
      ?auto_19290 - SURFACE
      ?auto_19284 - SURFACE
      ?auto_19281 - PLACE
      ?auto_19275 - HOIST
      ?auto_19270 - SURFACE
      ?auto_19272 - SURFACE
      ?auto_19256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19257 ?auto_19255 ) ( IS-CRATE ?auto_19254 ) ( not ( = ?auto_19260 ?auto_19255 ) ) ( HOIST-AT ?auto_19258 ?auto_19260 ) ( AVAILABLE ?auto_19258 ) ( SURFACE-AT ?auto_19254 ?auto_19260 ) ( ON ?auto_19254 ?auto_19259 ) ( CLEAR ?auto_19254 ) ( not ( = ?auto_19253 ?auto_19254 ) ) ( not ( = ?auto_19253 ?auto_19259 ) ) ( not ( = ?auto_19254 ?auto_19259 ) ) ( not ( = ?auto_19257 ?auto_19258 ) ) ( IS-CRATE ?auto_19253 ) ( not ( = ?auto_19269 ?auto_19255 ) ) ( HOIST-AT ?auto_19265 ?auto_19269 ) ( SURFACE-AT ?auto_19253 ?auto_19269 ) ( ON ?auto_19253 ?auto_19280 ) ( CLEAR ?auto_19253 ) ( not ( = ?auto_19252 ?auto_19253 ) ) ( not ( = ?auto_19252 ?auto_19280 ) ) ( not ( = ?auto_19253 ?auto_19280 ) ) ( not ( = ?auto_19257 ?auto_19265 ) ) ( IS-CRATE ?auto_19252 ) ( not ( = ?auto_19283 ?auto_19255 ) ) ( HOIST-AT ?auto_19273 ?auto_19283 ) ( AVAILABLE ?auto_19273 ) ( SURFACE-AT ?auto_19252 ?auto_19283 ) ( ON ?auto_19252 ?auto_19289 ) ( CLEAR ?auto_19252 ) ( not ( = ?auto_19251 ?auto_19252 ) ) ( not ( = ?auto_19251 ?auto_19289 ) ) ( not ( = ?auto_19252 ?auto_19289 ) ) ( not ( = ?auto_19257 ?auto_19273 ) ) ( IS-CRATE ?auto_19251 ) ( not ( = ?auto_19264 ?auto_19255 ) ) ( HOIST-AT ?auto_19276 ?auto_19264 ) ( AVAILABLE ?auto_19276 ) ( SURFACE-AT ?auto_19251 ?auto_19264 ) ( ON ?auto_19251 ?auto_19286 ) ( CLEAR ?auto_19251 ) ( not ( = ?auto_19250 ?auto_19251 ) ) ( not ( = ?auto_19250 ?auto_19286 ) ) ( not ( = ?auto_19251 ?auto_19286 ) ) ( not ( = ?auto_19257 ?auto_19276 ) ) ( IS-CRATE ?auto_19250 ) ( not ( = ?auto_19287 ?auto_19255 ) ) ( HOIST-AT ?auto_19291 ?auto_19287 ) ( SURFACE-AT ?auto_19250 ?auto_19287 ) ( ON ?auto_19250 ?auto_19261 ) ( CLEAR ?auto_19250 ) ( not ( = ?auto_19247 ?auto_19250 ) ) ( not ( = ?auto_19247 ?auto_19261 ) ) ( not ( = ?auto_19250 ?auto_19261 ) ) ( not ( = ?auto_19257 ?auto_19291 ) ) ( IS-CRATE ?auto_19247 ) ( not ( = ?auto_19277 ?auto_19255 ) ) ( HOIST-AT ?auto_19271 ?auto_19277 ) ( SURFACE-AT ?auto_19247 ?auto_19277 ) ( ON ?auto_19247 ?auto_19266 ) ( CLEAR ?auto_19247 ) ( not ( = ?auto_19248 ?auto_19247 ) ) ( not ( = ?auto_19248 ?auto_19266 ) ) ( not ( = ?auto_19247 ?auto_19266 ) ) ( not ( = ?auto_19257 ?auto_19271 ) ) ( IS-CRATE ?auto_19248 ) ( not ( = ?auto_19282 ?auto_19255 ) ) ( HOIST-AT ?auto_19274 ?auto_19282 ) ( AVAILABLE ?auto_19274 ) ( SURFACE-AT ?auto_19248 ?auto_19282 ) ( ON ?auto_19248 ?auto_19267 ) ( CLEAR ?auto_19248 ) ( not ( = ?auto_19249 ?auto_19248 ) ) ( not ( = ?auto_19249 ?auto_19267 ) ) ( not ( = ?auto_19248 ?auto_19267 ) ) ( not ( = ?auto_19257 ?auto_19274 ) ) ( IS-CRATE ?auto_19249 ) ( not ( = ?auto_19278 ?auto_19255 ) ) ( HOIST-AT ?auto_19279 ?auto_19278 ) ( AVAILABLE ?auto_19279 ) ( SURFACE-AT ?auto_19249 ?auto_19278 ) ( ON ?auto_19249 ?auto_19268 ) ( CLEAR ?auto_19249 ) ( not ( = ?auto_19246 ?auto_19249 ) ) ( not ( = ?auto_19246 ?auto_19268 ) ) ( not ( = ?auto_19249 ?auto_19268 ) ) ( not ( = ?auto_19257 ?auto_19279 ) ) ( IS-CRATE ?auto_19246 ) ( AVAILABLE ?auto_19265 ) ( SURFACE-AT ?auto_19246 ?auto_19269 ) ( ON ?auto_19246 ?auto_19262 ) ( CLEAR ?auto_19246 ) ( not ( = ?auto_19245 ?auto_19246 ) ) ( not ( = ?auto_19245 ?auto_19262 ) ) ( not ( = ?auto_19246 ?auto_19262 ) ) ( IS-CRATE ?auto_19245 ) ( AVAILABLE ?auto_19291 ) ( SURFACE-AT ?auto_19245 ?auto_19287 ) ( ON ?auto_19245 ?auto_19285 ) ( CLEAR ?auto_19245 ) ( not ( = ?auto_19244 ?auto_19245 ) ) ( not ( = ?auto_19244 ?auto_19285 ) ) ( not ( = ?auto_19245 ?auto_19285 ) ) ( IS-CRATE ?auto_19244 ) ( not ( = ?auto_19288 ?auto_19255 ) ) ( HOIST-AT ?auto_19263 ?auto_19288 ) ( SURFACE-AT ?auto_19244 ?auto_19288 ) ( ON ?auto_19244 ?auto_19290 ) ( CLEAR ?auto_19244 ) ( not ( = ?auto_19243 ?auto_19244 ) ) ( not ( = ?auto_19243 ?auto_19290 ) ) ( not ( = ?auto_19244 ?auto_19290 ) ) ( not ( = ?auto_19257 ?auto_19263 ) ) ( IS-CRATE ?auto_19243 ) ( AVAILABLE ?auto_19271 ) ( SURFACE-AT ?auto_19243 ?auto_19277 ) ( ON ?auto_19243 ?auto_19284 ) ( CLEAR ?auto_19243 ) ( not ( = ?auto_19242 ?auto_19243 ) ) ( not ( = ?auto_19242 ?auto_19284 ) ) ( not ( = ?auto_19243 ?auto_19284 ) ) ( IS-CRATE ?auto_19242 ) ( not ( = ?auto_19281 ?auto_19255 ) ) ( HOIST-AT ?auto_19275 ?auto_19281 ) ( AVAILABLE ?auto_19275 ) ( SURFACE-AT ?auto_19242 ?auto_19281 ) ( ON ?auto_19242 ?auto_19270 ) ( CLEAR ?auto_19242 ) ( not ( = ?auto_19241 ?auto_19242 ) ) ( not ( = ?auto_19241 ?auto_19270 ) ) ( not ( = ?auto_19242 ?auto_19270 ) ) ( not ( = ?auto_19257 ?auto_19275 ) ) ( SURFACE-AT ?auto_19240 ?auto_19255 ) ( CLEAR ?auto_19240 ) ( IS-CRATE ?auto_19241 ) ( AVAILABLE ?auto_19257 ) ( AVAILABLE ?auto_19263 ) ( SURFACE-AT ?auto_19241 ?auto_19288 ) ( ON ?auto_19241 ?auto_19272 ) ( CLEAR ?auto_19241 ) ( TRUCK-AT ?auto_19256 ?auto_19255 ) ( not ( = ?auto_19240 ?auto_19241 ) ) ( not ( = ?auto_19240 ?auto_19272 ) ) ( not ( = ?auto_19241 ?auto_19272 ) ) ( not ( = ?auto_19240 ?auto_19242 ) ) ( not ( = ?auto_19240 ?auto_19270 ) ) ( not ( = ?auto_19242 ?auto_19272 ) ) ( not ( = ?auto_19281 ?auto_19288 ) ) ( not ( = ?auto_19275 ?auto_19263 ) ) ( not ( = ?auto_19270 ?auto_19272 ) ) ( not ( = ?auto_19240 ?auto_19243 ) ) ( not ( = ?auto_19240 ?auto_19284 ) ) ( not ( = ?auto_19241 ?auto_19243 ) ) ( not ( = ?auto_19241 ?auto_19284 ) ) ( not ( = ?auto_19243 ?auto_19270 ) ) ( not ( = ?auto_19243 ?auto_19272 ) ) ( not ( = ?auto_19277 ?auto_19281 ) ) ( not ( = ?auto_19277 ?auto_19288 ) ) ( not ( = ?auto_19271 ?auto_19275 ) ) ( not ( = ?auto_19271 ?auto_19263 ) ) ( not ( = ?auto_19284 ?auto_19270 ) ) ( not ( = ?auto_19284 ?auto_19272 ) ) ( not ( = ?auto_19240 ?auto_19244 ) ) ( not ( = ?auto_19240 ?auto_19290 ) ) ( not ( = ?auto_19241 ?auto_19244 ) ) ( not ( = ?auto_19241 ?auto_19290 ) ) ( not ( = ?auto_19242 ?auto_19244 ) ) ( not ( = ?auto_19242 ?auto_19290 ) ) ( not ( = ?auto_19244 ?auto_19284 ) ) ( not ( = ?auto_19244 ?auto_19270 ) ) ( not ( = ?auto_19244 ?auto_19272 ) ) ( not ( = ?auto_19290 ?auto_19284 ) ) ( not ( = ?auto_19290 ?auto_19270 ) ) ( not ( = ?auto_19290 ?auto_19272 ) ) ( not ( = ?auto_19240 ?auto_19245 ) ) ( not ( = ?auto_19240 ?auto_19285 ) ) ( not ( = ?auto_19241 ?auto_19245 ) ) ( not ( = ?auto_19241 ?auto_19285 ) ) ( not ( = ?auto_19242 ?auto_19245 ) ) ( not ( = ?auto_19242 ?auto_19285 ) ) ( not ( = ?auto_19243 ?auto_19245 ) ) ( not ( = ?auto_19243 ?auto_19285 ) ) ( not ( = ?auto_19245 ?auto_19290 ) ) ( not ( = ?auto_19245 ?auto_19284 ) ) ( not ( = ?auto_19245 ?auto_19270 ) ) ( not ( = ?auto_19245 ?auto_19272 ) ) ( not ( = ?auto_19287 ?auto_19288 ) ) ( not ( = ?auto_19287 ?auto_19277 ) ) ( not ( = ?auto_19287 ?auto_19281 ) ) ( not ( = ?auto_19291 ?auto_19263 ) ) ( not ( = ?auto_19291 ?auto_19271 ) ) ( not ( = ?auto_19291 ?auto_19275 ) ) ( not ( = ?auto_19285 ?auto_19290 ) ) ( not ( = ?auto_19285 ?auto_19284 ) ) ( not ( = ?auto_19285 ?auto_19270 ) ) ( not ( = ?auto_19285 ?auto_19272 ) ) ( not ( = ?auto_19240 ?auto_19246 ) ) ( not ( = ?auto_19240 ?auto_19262 ) ) ( not ( = ?auto_19241 ?auto_19246 ) ) ( not ( = ?auto_19241 ?auto_19262 ) ) ( not ( = ?auto_19242 ?auto_19246 ) ) ( not ( = ?auto_19242 ?auto_19262 ) ) ( not ( = ?auto_19243 ?auto_19246 ) ) ( not ( = ?auto_19243 ?auto_19262 ) ) ( not ( = ?auto_19244 ?auto_19246 ) ) ( not ( = ?auto_19244 ?auto_19262 ) ) ( not ( = ?auto_19246 ?auto_19285 ) ) ( not ( = ?auto_19246 ?auto_19290 ) ) ( not ( = ?auto_19246 ?auto_19284 ) ) ( not ( = ?auto_19246 ?auto_19270 ) ) ( not ( = ?auto_19246 ?auto_19272 ) ) ( not ( = ?auto_19269 ?auto_19287 ) ) ( not ( = ?auto_19269 ?auto_19288 ) ) ( not ( = ?auto_19269 ?auto_19277 ) ) ( not ( = ?auto_19269 ?auto_19281 ) ) ( not ( = ?auto_19265 ?auto_19291 ) ) ( not ( = ?auto_19265 ?auto_19263 ) ) ( not ( = ?auto_19265 ?auto_19271 ) ) ( not ( = ?auto_19265 ?auto_19275 ) ) ( not ( = ?auto_19262 ?auto_19285 ) ) ( not ( = ?auto_19262 ?auto_19290 ) ) ( not ( = ?auto_19262 ?auto_19284 ) ) ( not ( = ?auto_19262 ?auto_19270 ) ) ( not ( = ?auto_19262 ?auto_19272 ) ) ( not ( = ?auto_19240 ?auto_19249 ) ) ( not ( = ?auto_19240 ?auto_19268 ) ) ( not ( = ?auto_19241 ?auto_19249 ) ) ( not ( = ?auto_19241 ?auto_19268 ) ) ( not ( = ?auto_19242 ?auto_19249 ) ) ( not ( = ?auto_19242 ?auto_19268 ) ) ( not ( = ?auto_19243 ?auto_19249 ) ) ( not ( = ?auto_19243 ?auto_19268 ) ) ( not ( = ?auto_19244 ?auto_19249 ) ) ( not ( = ?auto_19244 ?auto_19268 ) ) ( not ( = ?auto_19245 ?auto_19249 ) ) ( not ( = ?auto_19245 ?auto_19268 ) ) ( not ( = ?auto_19249 ?auto_19262 ) ) ( not ( = ?auto_19249 ?auto_19285 ) ) ( not ( = ?auto_19249 ?auto_19290 ) ) ( not ( = ?auto_19249 ?auto_19284 ) ) ( not ( = ?auto_19249 ?auto_19270 ) ) ( not ( = ?auto_19249 ?auto_19272 ) ) ( not ( = ?auto_19278 ?auto_19269 ) ) ( not ( = ?auto_19278 ?auto_19287 ) ) ( not ( = ?auto_19278 ?auto_19288 ) ) ( not ( = ?auto_19278 ?auto_19277 ) ) ( not ( = ?auto_19278 ?auto_19281 ) ) ( not ( = ?auto_19279 ?auto_19265 ) ) ( not ( = ?auto_19279 ?auto_19291 ) ) ( not ( = ?auto_19279 ?auto_19263 ) ) ( not ( = ?auto_19279 ?auto_19271 ) ) ( not ( = ?auto_19279 ?auto_19275 ) ) ( not ( = ?auto_19268 ?auto_19262 ) ) ( not ( = ?auto_19268 ?auto_19285 ) ) ( not ( = ?auto_19268 ?auto_19290 ) ) ( not ( = ?auto_19268 ?auto_19284 ) ) ( not ( = ?auto_19268 ?auto_19270 ) ) ( not ( = ?auto_19268 ?auto_19272 ) ) ( not ( = ?auto_19240 ?auto_19248 ) ) ( not ( = ?auto_19240 ?auto_19267 ) ) ( not ( = ?auto_19241 ?auto_19248 ) ) ( not ( = ?auto_19241 ?auto_19267 ) ) ( not ( = ?auto_19242 ?auto_19248 ) ) ( not ( = ?auto_19242 ?auto_19267 ) ) ( not ( = ?auto_19243 ?auto_19248 ) ) ( not ( = ?auto_19243 ?auto_19267 ) ) ( not ( = ?auto_19244 ?auto_19248 ) ) ( not ( = ?auto_19244 ?auto_19267 ) ) ( not ( = ?auto_19245 ?auto_19248 ) ) ( not ( = ?auto_19245 ?auto_19267 ) ) ( not ( = ?auto_19246 ?auto_19248 ) ) ( not ( = ?auto_19246 ?auto_19267 ) ) ( not ( = ?auto_19248 ?auto_19268 ) ) ( not ( = ?auto_19248 ?auto_19262 ) ) ( not ( = ?auto_19248 ?auto_19285 ) ) ( not ( = ?auto_19248 ?auto_19290 ) ) ( not ( = ?auto_19248 ?auto_19284 ) ) ( not ( = ?auto_19248 ?auto_19270 ) ) ( not ( = ?auto_19248 ?auto_19272 ) ) ( not ( = ?auto_19282 ?auto_19278 ) ) ( not ( = ?auto_19282 ?auto_19269 ) ) ( not ( = ?auto_19282 ?auto_19287 ) ) ( not ( = ?auto_19282 ?auto_19288 ) ) ( not ( = ?auto_19282 ?auto_19277 ) ) ( not ( = ?auto_19282 ?auto_19281 ) ) ( not ( = ?auto_19274 ?auto_19279 ) ) ( not ( = ?auto_19274 ?auto_19265 ) ) ( not ( = ?auto_19274 ?auto_19291 ) ) ( not ( = ?auto_19274 ?auto_19263 ) ) ( not ( = ?auto_19274 ?auto_19271 ) ) ( not ( = ?auto_19274 ?auto_19275 ) ) ( not ( = ?auto_19267 ?auto_19268 ) ) ( not ( = ?auto_19267 ?auto_19262 ) ) ( not ( = ?auto_19267 ?auto_19285 ) ) ( not ( = ?auto_19267 ?auto_19290 ) ) ( not ( = ?auto_19267 ?auto_19284 ) ) ( not ( = ?auto_19267 ?auto_19270 ) ) ( not ( = ?auto_19267 ?auto_19272 ) ) ( not ( = ?auto_19240 ?auto_19247 ) ) ( not ( = ?auto_19240 ?auto_19266 ) ) ( not ( = ?auto_19241 ?auto_19247 ) ) ( not ( = ?auto_19241 ?auto_19266 ) ) ( not ( = ?auto_19242 ?auto_19247 ) ) ( not ( = ?auto_19242 ?auto_19266 ) ) ( not ( = ?auto_19243 ?auto_19247 ) ) ( not ( = ?auto_19243 ?auto_19266 ) ) ( not ( = ?auto_19244 ?auto_19247 ) ) ( not ( = ?auto_19244 ?auto_19266 ) ) ( not ( = ?auto_19245 ?auto_19247 ) ) ( not ( = ?auto_19245 ?auto_19266 ) ) ( not ( = ?auto_19246 ?auto_19247 ) ) ( not ( = ?auto_19246 ?auto_19266 ) ) ( not ( = ?auto_19249 ?auto_19247 ) ) ( not ( = ?auto_19249 ?auto_19266 ) ) ( not ( = ?auto_19247 ?auto_19267 ) ) ( not ( = ?auto_19247 ?auto_19268 ) ) ( not ( = ?auto_19247 ?auto_19262 ) ) ( not ( = ?auto_19247 ?auto_19285 ) ) ( not ( = ?auto_19247 ?auto_19290 ) ) ( not ( = ?auto_19247 ?auto_19284 ) ) ( not ( = ?auto_19247 ?auto_19270 ) ) ( not ( = ?auto_19247 ?auto_19272 ) ) ( not ( = ?auto_19266 ?auto_19267 ) ) ( not ( = ?auto_19266 ?auto_19268 ) ) ( not ( = ?auto_19266 ?auto_19262 ) ) ( not ( = ?auto_19266 ?auto_19285 ) ) ( not ( = ?auto_19266 ?auto_19290 ) ) ( not ( = ?auto_19266 ?auto_19284 ) ) ( not ( = ?auto_19266 ?auto_19270 ) ) ( not ( = ?auto_19266 ?auto_19272 ) ) ( not ( = ?auto_19240 ?auto_19250 ) ) ( not ( = ?auto_19240 ?auto_19261 ) ) ( not ( = ?auto_19241 ?auto_19250 ) ) ( not ( = ?auto_19241 ?auto_19261 ) ) ( not ( = ?auto_19242 ?auto_19250 ) ) ( not ( = ?auto_19242 ?auto_19261 ) ) ( not ( = ?auto_19243 ?auto_19250 ) ) ( not ( = ?auto_19243 ?auto_19261 ) ) ( not ( = ?auto_19244 ?auto_19250 ) ) ( not ( = ?auto_19244 ?auto_19261 ) ) ( not ( = ?auto_19245 ?auto_19250 ) ) ( not ( = ?auto_19245 ?auto_19261 ) ) ( not ( = ?auto_19246 ?auto_19250 ) ) ( not ( = ?auto_19246 ?auto_19261 ) ) ( not ( = ?auto_19249 ?auto_19250 ) ) ( not ( = ?auto_19249 ?auto_19261 ) ) ( not ( = ?auto_19248 ?auto_19250 ) ) ( not ( = ?auto_19248 ?auto_19261 ) ) ( not ( = ?auto_19250 ?auto_19266 ) ) ( not ( = ?auto_19250 ?auto_19267 ) ) ( not ( = ?auto_19250 ?auto_19268 ) ) ( not ( = ?auto_19250 ?auto_19262 ) ) ( not ( = ?auto_19250 ?auto_19285 ) ) ( not ( = ?auto_19250 ?auto_19290 ) ) ( not ( = ?auto_19250 ?auto_19284 ) ) ( not ( = ?auto_19250 ?auto_19270 ) ) ( not ( = ?auto_19250 ?auto_19272 ) ) ( not ( = ?auto_19261 ?auto_19266 ) ) ( not ( = ?auto_19261 ?auto_19267 ) ) ( not ( = ?auto_19261 ?auto_19268 ) ) ( not ( = ?auto_19261 ?auto_19262 ) ) ( not ( = ?auto_19261 ?auto_19285 ) ) ( not ( = ?auto_19261 ?auto_19290 ) ) ( not ( = ?auto_19261 ?auto_19284 ) ) ( not ( = ?auto_19261 ?auto_19270 ) ) ( not ( = ?auto_19261 ?auto_19272 ) ) ( not ( = ?auto_19240 ?auto_19251 ) ) ( not ( = ?auto_19240 ?auto_19286 ) ) ( not ( = ?auto_19241 ?auto_19251 ) ) ( not ( = ?auto_19241 ?auto_19286 ) ) ( not ( = ?auto_19242 ?auto_19251 ) ) ( not ( = ?auto_19242 ?auto_19286 ) ) ( not ( = ?auto_19243 ?auto_19251 ) ) ( not ( = ?auto_19243 ?auto_19286 ) ) ( not ( = ?auto_19244 ?auto_19251 ) ) ( not ( = ?auto_19244 ?auto_19286 ) ) ( not ( = ?auto_19245 ?auto_19251 ) ) ( not ( = ?auto_19245 ?auto_19286 ) ) ( not ( = ?auto_19246 ?auto_19251 ) ) ( not ( = ?auto_19246 ?auto_19286 ) ) ( not ( = ?auto_19249 ?auto_19251 ) ) ( not ( = ?auto_19249 ?auto_19286 ) ) ( not ( = ?auto_19248 ?auto_19251 ) ) ( not ( = ?auto_19248 ?auto_19286 ) ) ( not ( = ?auto_19247 ?auto_19251 ) ) ( not ( = ?auto_19247 ?auto_19286 ) ) ( not ( = ?auto_19251 ?auto_19261 ) ) ( not ( = ?auto_19251 ?auto_19266 ) ) ( not ( = ?auto_19251 ?auto_19267 ) ) ( not ( = ?auto_19251 ?auto_19268 ) ) ( not ( = ?auto_19251 ?auto_19262 ) ) ( not ( = ?auto_19251 ?auto_19285 ) ) ( not ( = ?auto_19251 ?auto_19290 ) ) ( not ( = ?auto_19251 ?auto_19284 ) ) ( not ( = ?auto_19251 ?auto_19270 ) ) ( not ( = ?auto_19251 ?auto_19272 ) ) ( not ( = ?auto_19264 ?auto_19287 ) ) ( not ( = ?auto_19264 ?auto_19277 ) ) ( not ( = ?auto_19264 ?auto_19282 ) ) ( not ( = ?auto_19264 ?auto_19278 ) ) ( not ( = ?auto_19264 ?auto_19269 ) ) ( not ( = ?auto_19264 ?auto_19288 ) ) ( not ( = ?auto_19264 ?auto_19281 ) ) ( not ( = ?auto_19276 ?auto_19291 ) ) ( not ( = ?auto_19276 ?auto_19271 ) ) ( not ( = ?auto_19276 ?auto_19274 ) ) ( not ( = ?auto_19276 ?auto_19279 ) ) ( not ( = ?auto_19276 ?auto_19265 ) ) ( not ( = ?auto_19276 ?auto_19263 ) ) ( not ( = ?auto_19276 ?auto_19275 ) ) ( not ( = ?auto_19286 ?auto_19261 ) ) ( not ( = ?auto_19286 ?auto_19266 ) ) ( not ( = ?auto_19286 ?auto_19267 ) ) ( not ( = ?auto_19286 ?auto_19268 ) ) ( not ( = ?auto_19286 ?auto_19262 ) ) ( not ( = ?auto_19286 ?auto_19285 ) ) ( not ( = ?auto_19286 ?auto_19290 ) ) ( not ( = ?auto_19286 ?auto_19284 ) ) ( not ( = ?auto_19286 ?auto_19270 ) ) ( not ( = ?auto_19286 ?auto_19272 ) ) ( not ( = ?auto_19240 ?auto_19252 ) ) ( not ( = ?auto_19240 ?auto_19289 ) ) ( not ( = ?auto_19241 ?auto_19252 ) ) ( not ( = ?auto_19241 ?auto_19289 ) ) ( not ( = ?auto_19242 ?auto_19252 ) ) ( not ( = ?auto_19242 ?auto_19289 ) ) ( not ( = ?auto_19243 ?auto_19252 ) ) ( not ( = ?auto_19243 ?auto_19289 ) ) ( not ( = ?auto_19244 ?auto_19252 ) ) ( not ( = ?auto_19244 ?auto_19289 ) ) ( not ( = ?auto_19245 ?auto_19252 ) ) ( not ( = ?auto_19245 ?auto_19289 ) ) ( not ( = ?auto_19246 ?auto_19252 ) ) ( not ( = ?auto_19246 ?auto_19289 ) ) ( not ( = ?auto_19249 ?auto_19252 ) ) ( not ( = ?auto_19249 ?auto_19289 ) ) ( not ( = ?auto_19248 ?auto_19252 ) ) ( not ( = ?auto_19248 ?auto_19289 ) ) ( not ( = ?auto_19247 ?auto_19252 ) ) ( not ( = ?auto_19247 ?auto_19289 ) ) ( not ( = ?auto_19250 ?auto_19252 ) ) ( not ( = ?auto_19250 ?auto_19289 ) ) ( not ( = ?auto_19252 ?auto_19286 ) ) ( not ( = ?auto_19252 ?auto_19261 ) ) ( not ( = ?auto_19252 ?auto_19266 ) ) ( not ( = ?auto_19252 ?auto_19267 ) ) ( not ( = ?auto_19252 ?auto_19268 ) ) ( not ( = ?auto_19252 ?auto_19262 ) ) ( not ( = ?auto_19252 ?auto_19285 ) ) ( not ( = ?auto_19252 ?auto_19290 ) ) ( not ( = ?auto_19252 ?auto_19284 ) ) ( not ( = ?auto_19252 ?auto_19270 ) ) ( not ( = ?auto_19252 ?auto_19272 ) ) ( not ( = ?auto_19283 ?auto_19264 ) ) ( not ( = ?auto_19283 ?auto_19287 ) ) ( not ( = ?auto_19283 ?auto_19277 ) ) ( not ( = ?auto_19283 ?auto_19282 ) ) ( not ( = ?auto_19283 ?auto_19278 ) ) ( not ( = ?auto_19283 ?auto_19269 ) ) ( not ( = ?auto_19283 ?auto_19288 ) ) ( not ( = ?auto_19283 ?auto_19281 ) ) ( not ( = ?auto_19273 ?auto_19276 ) ) ( not ( = ?auto_19273 ?auto_19291 ) ) ( not ( = ?auto_19273 ?auto_19271 ) ) ( not ( = ?auto_19273 ?auto_19274 ) ) ( not ( = ?auto_19273 ?auto_19279 ) ) ( not ( = ?auto_19273 ?auto_19265 ) ) ( not ( = ?auto_19273 ?auto_19263 ) ) ( not ( = ?auto_19273 ?auto_19275 ) ) ( not ( = ?auto_19289 ?auto_19286 ) ) ( not ( = ?auto_19289 ?auto_19261 ) ) ( not ( = ?auto_19289 ?auto_19266 ) ) ( not ( = ?auto_19289 ?auto_19267 ) ) ( not ( = ?auto_19289 ?auto_19268 ) ) ( not ( = ?auto_19289 ?auto_19262 ) ) ( not ( = ?auto_19289 ?auto_19285 ) ) ( not ( = ?auto_19289 ?auto_19290 ) ) ( not ( = ?auto_19289 ?auto_19284 ) ) ( not ( = ?auto_19289 ?auto_19270 ) ) ( not ( = ?auto_19289 ?auto_19272 ) ) ( not ( = ?auto_19240 ?auto_19253 ) ) ( not ( = ?auto_19240 ?auto_19280 ) ) ( not ( = ?auto_19241 ?auto_19253 ) ) ( not ( = ?auto_19241 ?auto_19280 ) ) ( not ( = ?auto_19242 ?auto_19253 ) ) ( not ( = ?auto_19242 ?auto_19280 ) ) ( not ( = ?auto_19243 ?auto_19253 ) ) ( not ( = ?auto_19243 ?auto_19280 ) ) ( not ( = ?auto_19244 ?auto_19253 ) ) ( not ( = ?auto_19244 ?auto_19280 ) ) ( not ( = ?auto_19245 ?auto_19253 ) ) ( not ( = ?auto_19245 ?auto_19280 ) ) ( not ( = ?auto_19246 ?auto_19253 ) ) ( not ( = ?auto_19246 ?auto_19280 ) ) ( not ( = ?auto_19249 ?auto_19253 ) ) ( not ( = ?auto_19249 ?auto_19280 ) ) ( not ( = ?auto_19248 ?auto_19253 ) ) ( not ( = ?auto_19248 ?auto_19280 ) ) ( not ( = ?auto_19247 ?auto_19253 ) ) ( not ( = ?auto_19247 ?auto_19280 ) ) ( not ( = ?auto_19250 ?auto_19253 ) ) ( not ( = ?auto_19250 ?auto_19280 ) ) ( not ( = ?auto_19251 ?auto_19253 ) ) ( not ( = ?auto_19251 ?auto_19280 ) ) ( not ( = ?auto_19253 ?auto_19289 ) ) ( not ( = ?auto_19253 ?auto_19286 ) ) ( not ( = ?auto_19253 ?auto_19261 ) ) ( not ( = ?auto_19253 ?auto_19266 ) ) ( not ( = ?auto_19253 ?auto_19267 ) ) ( not ( = ?auto_19253 ?auto_19268 ) ) ( not ( = ?auto_19253 ?auto_19262 ) ) ( not ( = ?auto_19253 ?auto_19285 ) ) ( not ( = ?auto_19253 ?auto_19290 ) ) ( not ( = ?auto_19253 ?auto_19284 ) ) ( not ( = ?auto_19253 ?auto_19270 ) ) ( not ( = ?auto_19253 ?auto_19272 ) ) ( not ( = ?auto_19280 ?auto_19289 ) ) ( not ( = ?auto_19280 ?auto_19286 ) ) ( not ( = ?auto_19280 ?auto_19261 ) ) ( not ( = ?auto_19280 ?auto_19266 ) ) ( not ( = ?auto_19280 ?auto_19267 ) ) ( not ( = ?auto_19280 ?auto_19268 ) ) ( not ( = ?auto_19280 ?auto_19262 ) ) ( not ( = ?auto_19280 ?auto_19285 ) ) ( not ( = ?auto_19280 ?auto_19290 ) ) ( not ( = ?auto_19280 ?auto_19284 ) ) ( not ( = ?auto_19280 ?auto_19270 ) ) ( not ( = ?auto_19280 ?auto_19272 ) ) ( not ( = ?auto_19240 ?auto_19254 ) ) ( not ( = ?auto_19240 ?auto_19259 ) ) ( not ( = ?auto_19241 ?auto_19254 ) ) ( not ( = ?auto_19241 ?auto_19259 ) ) ( not ( = ?auto_19242 ?auto_19254 ) ) ( not ( = ?auto_19242 ?auto_19259 ) ) ( not ( = ?auto_19243 ?auto_19254 ) ) ( not ( = ?auto_19243 ?auto_19259 ) ) ( not ( = ?auto_19244 ?auto_19254 ) ) ( not ( = ?auto_19244 ?auto_19259 ) ) ( not ( = ?auto_19245 ?auto_19254 ) ) ( not ( = ?auto_19245 ?auto_19259 ) ) ( not ( = ?auto_19246 ?auto_19254 ) ) ( not ( = ?auto_19246 ?auto_19259 ) ) ( not ( = ?auto_19249 ?auto_19254 ) ) ( not ( = ?auto_19249 ?auto_19259 ) ) ( not ( = ?auto_19248 ?auto_19254 ) ) ( not ( = ?auto_19248 ?auto_19259 ) ) ( not ( = ?auto_19247 ?auto_19254 ) ) ( not ( = ?auto_19247 ?auto_19259 ) ) ( not ( = ?auto_19250 ?auto_19254 ) ) ( not ( = ?auto_19250 ?auto_19259 ) ) ( not ( = ?auto_19251 ?auto_19254 ) ) ( not ( = ?auto_19251 ?auto_19259 ) ) ( not ( = ?auto_19252 ?auto_19254 ) ) ( not ( = ?auto_19252 ?auto_19259 ) ) ( not ( = ?auto_19254 ?auto_19280 ) ) ( not ( = ?auto_19254 ?auto_19289 ) ) ( not ( = ?auto_19254 ?auto_19286 ) ) ( not ( = ?auto_19254 ?auto_19261 ) ) ( not ( = ?auto_19254 ?auto_19266 ) ) ( not ( = ?auto_19254 ?auto_19267 ) ) ( not ( = ?auto_19254 ?auto_19268 ) ) ( not ( = ?auto_19254 ?auto_19262 ) ) ( not ( = ?auto_19254 ?auto_19285 ) ) ( not ( = ?auto_19254 ?auto_19290 ) ) ( not ( = ?auto_19254 ?auto_19284 ) ) ( not ( = ?auto_19254 ?auto_19270 ) ) ( not ( = ?auto_19254 ?auto_19272 ) ) ( not ( = ?auto_19260 ?auto_19269 ) ) ( not ( = ?auto_19260 ?auto_19283 ) ) ( not ( = ?auto_19260 ?auto_19264 ) ) ( not ( = ?auto_19260 ?auto_19287 ) ) ( not ( = ?auto_19260 ?auto_19277 ) ) ( not ( = ?auto_19260 ?auto_19282 ) ) ( not ( = ?auto_19260 ?auto_19278 ) ) ( not ( = ?auto_19260 ?auto_19288 ) ) ( not ( = ?auto_19260 ?auto_19281 ) ) ( not ( = ?auto_19258 ?auto_19265 ) ) ( not ( = ?auto_19258 ?auto_19273 ) ) ( not ( = ?auto_19258 ?auto_19276 ) ) ( not ( = ?auto_19258 ?auto_19291 ) ) ( not ( = ?auto_19258 ?auto_19271 ) ) ( not ( = ?auto_19258 ?auto_19274 ) ) ( not ( = ?auto_19258 ?auto_19279 ) ) ( not ( = ?auto_19258 ?auto_19263 ) ) ( not ( = ?auto_19258 ?auto_19275 ) ) ( not ( = ?auto_19259 ?auto_19280 ) ) ( not ( = ?auto_19259 ?auto_19289 ) ) ( not ( = ?auto_19259 ?auto_19286 ) ) ( not ( = ?auto_19259 ?auto_19261 ) ) ( not ( = ?auto_19259 ?auto_19266 ) ) ( not ( = ?auto_19259 ?auto_19267 ) ) ( not ( = ?auto_19259 ?auto_19268 ) ) ( not ( = ?auto_19259 ?auto_19262 ) ) ( not ( = ?auto_19259 ?auto_19285 ) ) ( not ( = ?auto_19259 ?auto_19290 ) ) ( not ( = ?auto_19259 ?auto_19284 ) ) ( not ( = ?auto_19259 ?auto_19270 ) ) ( not ( = ?auto_19259 ?auto_19272 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_19240 ?auto_19241 ?auto_19242 ?auto_19243 ?auto_19244 ?auto_19245 ?auto_19246 ?auto_19249 ?auto_19248 ?auto_19247 ?auto_19250 ?auto_19251 ?auto_19252 ?auto_19253 )
      ( MAKE-1CRATE ?auto_19253 ?auto_19254 )
      ( MAKE-14CRATE-VERIFY ?auto_19240 ?auto_19241 ?auto_19242 ?auto_19243 ?auto_19244 ?auto_19245 ?auto_19246 ?auto_19249 ?auto_19248 ?auto_19247 ?auto_19250 ?auto_19251 ?auto_19252 ?auto_19253 ?auto_19254 ) )
  )

)

