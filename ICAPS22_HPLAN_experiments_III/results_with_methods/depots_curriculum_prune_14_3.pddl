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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18638 - SURFACE
      ?auto_18639 - SURFACE
      ?auto_18640 - SURFACE
    )
    :vars
    (
      ?auto_18644 - HOIST
      ?auto_18645 - PLACE
      ?auto_18641 - PLACE
      ?auto_18643 - HOIST
      ?auto_18642 - SURFACE
      ?auto_18647 - PLACE
      ?auto_18649 - HOIST
      ?auto_18648 - SURFACE
      ?auto_18646 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18644 ?auto_18645 ) ( IS-CRATE ?auto_18640 ) ( not ( = ?auto_18641 ?auto_18645 ) ) ( HOIST-AT ?auto_18643 ?auto_18641 ) ( AVAILABLE ?auto_18643 ) ( SURFACE-AT ?auto_18640 ?auto_18641 ) ( ON ?auto_18640 ?auto_18642 ) ( CLEAR ?auto_18640 ) ( not ( = ?auto_18639 ?auto_18640 ) ) ( not ( = ?auto_18639 ?auto_18642 ) ) ( not ( = ?auto_18640 ?auto_18642 ) ) ( not ( = ?auto_18644 ?auto_18643 ) ) ( SURFACE-AT ?auto_18638 ?auto_18645 ) ( CLEAR ?auto_18638 ) ( IS-CRATE ?auto_18639 ) ( AVAILABLE ?auto_18644 ) ( not ( = ?auto_18647 ?auto_18645 ) ) ( HOIST-AT ?auto_18649 ?auto_18647 ) ( AVAILABLE ?auto_18649 ) ( SURFACE-AT ?auto_18639 ?auto_18647 ) ( ON ?auto_18639 ?auto_18648 ) ( CLEAR ?auto_18639 ) ( TRUCK-AT ?auto_18646 ?auto_18645 ) ( not ( = ?auto_18638 ?auto_18639 ) ) ( not ( = ?auto_18638 ?auto_18648 ) ) ( not ( = ?auto_18639 ?auto_18648 ) ) ( not ( = ?auto_18644 ?auto_18649 ) ) ( not ( = ?auto_18638 ?auto_18640 ) ) ( not ( = ?auto_18638 ?auto_18642 ) ) ( not ( = ?auto_18640 ?auto_18648 ) ) ( not ( = ?auto_18641 ?auto_18647 ) ) ( not ( = ?auto_18643 ?auto_18649 ) ) ( not ( = ?auto_18642 ?auto_18648 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18638 ?auto_18639 )
      ( MAKE-1CRATE ?auto_18639 ?auto_18640 )
      ( MAKE-2CRATE-VERIFY ?auto_18638 ?auto_18639 ?auto_18640 ) )
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
      ?auto_18669 - HOIST
      ?auto_18670 - PLACE
      ?auto_18671 - PLACE
      ?auto_18673 - HOIST
      ?auto_18668 - SURFACE
      ?auto_18677 - PLACE
      ?auto_18678 - HOIST
      ?auto_18676 - SURFACE
      ?auto_18679 - PLACE
      ?auto_18675 - HOIST
      ?auto_18674 - SURFACE
      ?auto_18672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18669 ?auto_18670 ) ( IS-CRATE ?auto_18667 ) ( not ( = ?auto_18671 ?auto_18670 ) ) ( HOIST-AT ?auto_18673 ?auto_18671 ) ( AVAILABLE ?auto_18673 ) ( SURFACE-AT ?auto_18667 ?auto_18671 ) ( ON ?auto_18667 ?auto_18668 ) ( CLEAR ?auto_18667 ) ( not ( = ?auto_18666 ?auto_18667 ) ) ( not ( = ?auto_18666 ?auto_18668 ) ) ( not ( = ?auto_18667 ?auto_18668 ) ) ( not ( = ?auto_18669 ?auto_18673 ) ) ( IS-CRATE ?auto_18666 ) ( not ( = ?auto_18677 ?auto_18670 ) ) ( HOIST-AT ?auto_18678 ?auto_18677 ) ( AVAILABLE ?auto_18678 ) ( SURFACE-AT ?auto_18666 ?auto_18677 ) ( ON ?auto_18666 ?auto_18676 ) ( CLEAR ?auto_18666 ) ( not ( = ?auto_18665 ?auto_18666 ) ) ( not ( = ?auto_18665 ?auto_18676 ) ) ( not ( = ?auto_18666 ?auto_18676 ) ) ( not ( = ?auto_18669 ?auto_18678 ) ) ( SURFACE-AT ?auto_18664 ?auto_18670 ) ( CLEAR ?auto_18664 ) ( IS-CRATE ?auto_18665 ) ( AVAILABLE ?auto_18669 ) ( not ( = ?auto_18679 ?auto_18670 ) ) ( HOIST-AT ?auto_18675 ?auto_18679 ) ( AVAILABLE ?auto_18675 ) ( SURFACE-AT ?auto_18665 ?auto_18679 ) ( ON ?auto_18665 ?auto_18674 ) ( CLEAR ?auto_18665 ) ( TRUCK-AT ?auto_18672 ?auto_18670 ) ( not ( = ?auto_18664 ?auto_18665 ) ) ( not ( = ?auto_18664 ?auto_18674 ) ) ( not ( = ?auto_18665 ?auto_18674 ) ) ( not ( = ?auto_18669 ?auto_18675 ) ) ( not ( = ?auto_18664 ?auto_18666 ) ) ( not ( = ?auto_18664 ?auto_18676 ) ) ( not ( = ?auto_18666 ?auto_18674 ) ) ( not ( = ?auto_18677 ?auto_18679 ) ) ( not ( = ?auto_18678 ?auto_18675 ) ) ( not ( = ?auto_18676 ?auto_18674 ) ) ( not ( = ?auto_18664 ?auto_18667 ) ) ( not ( = ?auto_18664 ?auto_18668 ) ) ( not ( = ?auto_18665 ?auto_18667 ) ) ( not ( = ?auto_18665 ?auto_18668 ) ) ( not ( = ?auto_18667 ?auto_18676 ) ) ( not ( = ?auto_18667 ?auto_18674 ) ) ( not ( = ?auto_18671 ?auto_18677 ) ) ( not ( = ?auto_18671 ?auto_18679 ) ) ( not ( = ?auto_18673 ?auto_18678 ) ) ( not ( = ?auto_18673 ?auto_18675 ) ) ( not ( = ?auto_18668 ?auto_18676 ) ) ( not ( = ?auto_18668 ?auto_18674 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18664 ?auto_18665 ?auto_18666 )
      ( MAKE-1CRATE ?auto_18666 ?auto_18667 )
      ( MAKE-3CRATE-VERIFY ?auto_18664 ?auto_18665 ?auto_18666 ?auto_18667 ) )
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
      ?auto_18703 - HOIST
      ?auto_18702 - PLACE
      ?auto_18705 - PLACE
      ?auto_18704 - HOIST
      ?auto_18700 - SURFACE
      ?auto_18710 - PLACE
      ?auto_18708 - HOIST
      ?auto_18711 - SURFACE
      ?auto_18709 - PLACE
      ?auto_18712 - HOIST
      ?auto_18706 - SURFACE
      ?auto_18707 - SURFACE
      ?auto_18701 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18703 ?auto_18702 ) ( IS-CRATE ?auto_18699 ) ( not ( = ?auto_18705 ?auto_18702 ) ) ( HOIST-AT ?auto_18704 ?auto_18705 ) ( SURFACE-AT ?auto_18699 ?auto_18705 ) ( ON ?auto_18699 ?auto_18700 ) ( CLEAR ?auto_18699 ) ( not ( = ?auto_18698 ?auto_18699 ) ) ( not ( = ?auto_18698 ?auto_18700 ) ) ( not ( = ?auto_18699 ?auto_18700 ) ) ( not ( = ?auto_18703 ?auto_18704 ) ) ( IS-CRATE ?auto_18698 ) ( not ( = ?auto_18710 ?auto_18702 ) ) ( HOIST-AT ?auto_18708 ?auto_18710 ) ( AVAILABLE ?auto_18708 ) ( SURFACE-AT ?auto_18698 ?auto_18710 ) ( ON ?auto_18698 ?auto_18711 ) ( CLEAR ?auto_18698 ) ( not ( = ?auto_18697 ?auto_18698 ) ) ( not ( = ?auto_18697 ?auto_18711 ) ) ( not ( = ?auto_18698 ?auto_18711 ) ) ( not ( = ?auto_18703 ?auto_18708 ) ) ( IS-CRATE ?auto_18697 ) ( not ( = ?auto_18709 ?auto_18702 ) ) ( HOIST-AT ?auto_18712 ?auto_18709 ) ( AVAILABLE ?auto_18712 ) ( SURFACE-AT ?auto_18697 ?auto_18709 ) ( ON ?auto_18697 ?auto_18706 ) ( CLEAR ?auto_18697 ) ( not ( = ?auto_18696 ?auto_18697 ) ) ( not ( = ?auto_18696 ?auto_18706 ) ) ( not ( = ?auto_18697 ?auto_18706 ) ) ( not ( = ?auto_18703 ?auto_18712 ) ) ( SURFACE-AT ?auto_18695 ?auto_18702 ) ( CLEAR ?auto_18695 ) ( IS-CRATE ?auto_18696 ) ( AVAILABLE ?auto_18703 ) ( AVAILABLE ?auto_18704 ) ( SURFACE-AT ?auto_18696 ?auto_18705 ) ( ON ?auto_18696 ?auto_18707 ) ( CLEAR ?auto_18696 ) ( TRUCK-AT ?auto_18701 ?auto_18702 ) ( not ( = ?auto_18695 ?auto_18696 ) ) ( not ( = ?auto_18695 ?auto_18707 ) ) ( not ( = ?auto_18696 ?auto_18707 ) ) ( not ( = ?auto_18695 ?auto_18697 ) ) ( not ( = ?auto_18695 ?auto_18706 ) ) ( not ( = ?auto_18697 ?auto_18707 ) ) ( not ( = ?auto_18709 ?auto_18705 ) ) ( not ( = ?auto_18712 ?auto_18704 ) ) ( not ( = ?auto_18706 ?auto_18707 ) ) ( not ( = ?auto_18695 ?auto_18698 ) ) ( not ( = ?auto_18695 ?auto_18711 ) ) ( not ( = ?auto_18696 ?auto_18698 ) ) ( not ( = ?auto_18696 ?auto_18711 ) ) ( not ( = ?auto_18698 ?auto_18706 ) ) ( not ( = ?auto_18698 ?auto_18707 ) ) ( not ( = ?auto_18710 ?auto_18709 ) ) ( not ( = ?auto_18710 ?auto_18705 ) ) ( not ( = ?auto_18708 ?auto_18712 ) ) ( not ( = ?auto_18708 ?auto_18704 ) ) ( not ( = ?auto_18711 ?auto_18706 ) ) ( not ( = ?auto_18711 ?auto_18707 ) ) ( not ( = ?auto_18695 ?auto_18699 ) ) ( not ( = ?auto_18695 ?auto_18700 ) ) ( not ( = ?auto_18696 ?auto_18699 ) ) ( not ( = ?auto_18696 ?auto_18700 ) ) ( not ( = ?auto_18697 ?auto_18699 ) ) ( not ( = ?auto_18697 ?auto_18700 ) ) ( not ( = ?auto_18699 ?auto_18711 ) ) ( not ( = ?auto_18699 ?auto_18706 ) ) ( not ( = ?auto_18699 ?auto_18707 ) ) ( not ( = ?auto_18700 ?auto_18711 ) ) ( not ( = ?auto_18700 ?auto_18706 ) ) ( not ( = ?auto_18700 ?auto_18707 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_18695 ?auto_18696 ?auto_18697 ?auto_18698 )
      ( MAKE-1CRATE ?auto_18698 ?auto_18699 )
      ( MAKE-4CRATE-VERIFY ?auto_18695 ?auto_18696 ?auto_18697 ?auto_18698 ?auto_18699 ) )
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
      ?auto_18736 - HOIST
      ?auto_18739 - PLACE
      ?auto_18738 - PLACE
      ?auto_18737 - HOIST
      ?auto_18740 - SURFACE
      ?auto_18743 - PLACE
      ?auto_18745 - HOIST
      ?auto_18744 - SURFACE
      ?auto_18748 - PLACE
      ?auto_18742 - HOIST
      ?auto_18749 - SURFACE
      ?auto_18741 - PLACE
      ?auto_18750 - HOIST
      ?auto_18747 - SURFACE
      ?auto_18746 - SURFACE
      ?auto_18735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18736 ?auto_18739 ) ( IS-CRATE ?auto_18734 ) ( not ( = ?auto_18738 ?auto_18739 ) ) ( HOIST-AT ?auto_18737 ?auto_18738 ) ( AVAILABLE ?auto_18737 ) ( SURFACE-AT ?auto_18734 ?auto_18738 ) ( ON ?auto_18734 ?auto_18740 ) ( CLEAR ?auto_18734 ) ( not ( = ?auto_18733 ?auto_18734 ) ) ( not ( = ?auto_18733 ?auto_18740 ) ) ( not ( = ?auto_18734 ?auto_18740 ) ) ( not ( = ?auto_18736 ?auto_18737 ) ) ( IS-CRATE ?auto_18733 ) ( not ( = ?auto_18743 ?auto_18739 ) ) ( HOIST-AT ?auto_18745 ?auto_18743 ) ( SURFACE-AT ?auto_18733 ?auto_18743 ) ( ON ?auto_18733 ?auto_18744 ) ( CLEAR ?auto_18733 ) ( not ( = ?auto_18732 ?auto_18733 ) ) ( not ( = ?auto_18732 ?auto_18744 ) ) ( not ( = ?auto_18733 ?auto_18744 ) ) ( not ( = ?auto_18736 ?auto_18745 ) ) ( IS-CRATE ?auto_18732 ) ( not ( = ?auto_18748 ?auto_18739 ) ) ( HOIST-AT ?auto_18742 ?auto_18748 ) ( AVAILABLE ?auto_18742 ) ( SURFACE-AT ?auto_18732 ?auto_18748 ) ( ON ?auto_18732 ?auto_18749 ) ( CLEAR ?auto_18732 ) ( not ( = ?auto_18731 ?auto_18732 ) ) ( not ( = ?auto_18731 ?auto_18749 ) ) ( not ( = ?auto_18732 ?auto_18749 ) ) ( not ( = ?auto_18736 ?auto_18742 ) ) ( IS-CRATE ?auto_18731 ) ( not ( = ?auto_18741 ?auto_18739 ) ) ( HOIST-AT ?auto_18750 ?auto_18741 ) ( AVAILABLE ?auto_18750 ) ( SURFACE-AT ?auto_18731 ?auto_18741 ) ( ON ?auto_18731 ?auto_18747 ) ( CLEAR ?auto_18731 ) ( not ( = ?auto_18730 ?auto_18731 ) ) ( not ( = ?auto_18730 ?auto_18747 ) ) ( not ( = ?auto_18731 ?auto_18747 ) ) ( not ( = ?auto_18736 ?auto_18750 ) ) ( SURFACE-AT ?auto_18729 ?auto_18739 ) ( CLEAR ?auto_18729 ) ( IS-CRATE ?auto_18730 ) ( AVAILABLE ?auto_18736 ) ( AVAILABLE ?auto_18745 ) ( SURFACE-AT ?auto_18730 ?auto_18743 ) ( ON ?auto_18730 ?auto_18746 ) ( CLEAR ?auto_18730 ) ( TRUCK-AT ?auto_18735 ?auto_18739 ) ( not ( = ?auto_18729 ?auto_18730 ) ) ( not ( = ?auto_18729 ?auto_18746 ) ) ( not ( = ?auto_18730 ?auto_18746 ) ) ( not ( = ?auto_18729 ?auto_18731 ) ) ( not ( = ?auto_18729 ?auto_18747 ) ) ( not ( = ?auto_18731 ?auto_18746 ) ) ( not ( = ?auto_18741 ?auto_18743 ) ) ( not ( = ?auto_18750 ?auto_18745 ) ) ( not ( = ?auto_18747 ?auto_18746 ) ) ( not ( = ?auto_18729 ?auto_18732 ) ) ( not ( = ?auto_18729 ?auto_18749 ) ) ( not ( = ?auto_18730 ?auto_18732 ) ) ( not ( = ?auto_18730 ?auto_18749 ) ) ( not ( = ?auto_18732 ?auto_18747 ) ) ( not ( = ?auto_18732 ?auto_18746 ) ) ( not ( = ?auto_18748 ?auto_18741 ) ) ( not ( = ?auto_18748 ?auto_18743 ) ) ( not ( = ?auto_18742 ?auto_18750 ) ) ( not ( = ?auto_18742 ?auto_18745 ) ) ( not ( = ?auto_18749 ?auto_18747 ) ) ( not ( = ?auto_18749 ?auto_18746 ) ) ( not ( = ?auto_18729 ?auto_18733 ) ) ( not ( = ?auto_18729 ?auto_18744 ) ) ( not ( = ?auto_18730 ?auto_18733 ) ) ( not ( = ?auto_18730 ?auto_18744 ) ) ( not ( = ?auto_18731 ?auto_18733 ) ) ( not ( = ?auto_18731 ?auto_18744 ) ) ( not ( = ?auto_18733 ?auto_18749 ) ) ( not ( = ?auto_18733 ?auto_18747 ) ) ( not ( = ?auto_18733 ?auto_18746 ) ) ( not ( = ?auto_18744 ?auto_18749 ) ) ( not ( = ?auto_18744 ?auto_18747 ) ) ( not ( = ?auto_18744 ?auto_18746 ) ) ( not ( = ?auto_18729 ?auto_18734 ) ) ( not ( = ?auto_18729 ?auto_18740 ) ) ( not ( = ?auto_18730 ?auto_18734 ) ) ( not ( = ?auto_18730 ?auto_18740 ) ) ( not ( = ?auto_18731 ?auto_18734 ) ) ( not ( = ?auto_18731 ?auto_18740 ) ) ( not ( = ?auto_18732 ?auto_18734 ) ) ( not ( = ?auto_18732 ?auto_18740 ) ) ( not ( = ?auto_18734 ?auto_18744 ) ) ( not ( = ?auto_18734 ?auto_18749 ) ) ( not ( = ?auto_18734 ?auto_18747 ) ) ( not ( = ?auto_18734 ?auto_18746 ) ) ( not ( = ?auto_18738 ?auto_18743 ) ) ( not ( = ?auto_18738 ?auto_18748 ) ) ( not ( = ?auto_18738 ?auto_18741 ) ) ( not ( = ?auto_18737 ?auto_18745 ) ) ( not ( = ?auto_18737 ?auto_18742 ) ) ( not ( = ?auto_18737 ?auto_18750 ) ) ( not ( = ?auto_18740 ?auto_18744 ) ) ( not ( = ?auto_18740 ?auto_18749 ) ) ( not ( = ?auto_18740 ?auto_18747 ) ) ( not ( = ?auto_18740 ?auto_18746 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_18729 ?auto_18730 ?auto_18731 ?auto_18732 ?auto_18733 )
      ( MAKE-1CRATE ?auto_18733 ?auto_18734 )
      ( MAKE-5CRATE-VERIFY ?auto_18729 ?auto_18730 ?auto_18731 ?auto_18732 ?auto_18733 ?auto_18734 ) )
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
      ?auto_18778 - HOIST
      ?auto_18777 - PLACE
      ?auto_18775 - PLACE
      ?auto_18779 - HOIST
      ?auto_18780 - SURFACE
      ?auto_18792 - PLACE
      ?auto_18784 - HOIST
      ?auto_18791 - SURFACE
      ?auto_18787 - PLACE
      ?auto_18782 - HOIST
      ?auto_18785 - SURFACE
      ?auto_18790 - PLACE
      ?auto_18786 - HOIST
      ?auto_18793 - SURFACE
      ?auto_18783 - PLACE
      ?auto_18788 - HOIST
      ?auto_18789 - SURFACE
      ?auto_18781 - SURFACE
      ?auto_18776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18778 ?auto_18777 ) ( IS-CRATE ?auto_18774 ) ( not ( = ?auto_18775 ?auto_18777 ) ) ( HOIST-AT ?auto_18779 ?auto_18775 ) ( AVAILABLE ?auto_18779 ) ( SURFACE-AT ?auto_18774 ?auto_18775 ) ( ON ?auto_18774 ?auto_18780 ) ( CLEAR ?auto_18774 ) ( not ( = ?auto_18773 ?auto_18774 ) ) ( not ( = ?auto_18773 ?auto_18780 ) ) ( not ( = ?auto_18774 ?auto_18780 ) ) ( not ( = ?auto_18778 ?auto_18779 ) ) ( IS-CRATE ?auto_18773 ) ( not ( = ?auto_18792 ?auto_18777 ) ) ( HOIST-AT ?auto_18784 ?auto_18792 ) ( AVAILABLE ?auto_18784 ) ( SURFACE-AT ?auto_18773 ?auto_18792 ) ( ON ?auto_18773 ?auto_18791 ) ( CLEAR ?auto_18773 ) ( not ( = ?auto_18772 ?auto_18773 ) ) ( not ( = ?auto_18772 ?auto_18791 ) ) ( not ( = ?auto_18773 ?auto_18791 ) ) ( not ( = ?auto_18778 ?auto_18784 ) ) ( IS-CRATE ?auto_18772 ) ( not ( = ?auto_18787 ?auto_18777 ) ) ( HOIST-AT ?auto_18782 ?auto_18787 ) ( SURFACE-AT ?auto_18772 ?auto_18787 ) ( ON ?auto_18772 ?auto_18785 ) ( CLEAR ?auto_18772 ) ( not ( = ?auto_18771 ?auto_18772 ) ) ( not ( = ?auto_18771 ?auto_18785 ) ) ( not ( = ?auto_18772 ?auto_18785 ) ) ( not ( = ?auto_18778 ?auto_18782 ) ) ( IS-CRATE ?auto_18771 ) ( not ( = ?auto_18790 ?auto_18777 ) ) ( HOIST-AT ?auto_18786 ?auto_18790 ) ( AVAILABLE ?auto_18786 ) ( SURFACE-AT ?auto_18771 ?auto_18790 ) ( ON ?auto_18771 ?auto_18793 ) ( CLEAR ?auto_18771 ) ( not ( = ?auto_18770 ?auto_18771 ) ) ( not ( = ?auto_18770 ?auto_18793 ) ) ( not ( = ?auto_18771 ?auto_18793 ) ) ( not ( = ?auto_18778 ?auto_18786 ) ) ( IS-CRATE ?auto_18770 ) ( not ( = ?auto_18783 ?auto_18777 ) ) ( HOIST-AT ?auto_18788 ?auto_18783 ) ( AVAILABLE ?auto_18788 ) ( SURFACE-AT ?auto_18770 ?auto_18783 ) ( ON ?auto_18770 ?auto_18789 ) ( CLEAR ?auto_18770 ) ( not ( = ?auto_18769 ?auto_18770 ) ) ( not ( = ?auto_18769 ?auto_18789 ) ) ( not ( = ?auto_18770 ?auto_18789 ) ) ( not ( = ?auto_18778 ?auto_18788 ) ) ( SURFACE-AT ?auto_18768 ?auto_18777 ) ( CLEAR ?auto_18768 ) ( IS-CRATE ?auto_18769 ) ( AVAILABLE ?auto_18778 ) ( AVAILABLE ?auto_18782 ) ( SURFACE-AT ?auto_18769 ?auto_18787 ) ( ON ?auto_18769 ?auto_18781 ) ( CLEAR ?auto_18769 ) ( TRUCK-AT ?auto_18776 ?auto_18777 ) ( not ( = ?auto_18768 ?auto_18769 ) ) ( not ( = ?auto_18768 ?auto_18781 ) ) ( not ( = ?auto_18769 ?auto_18781 ) ) ( not ( = ?auto_18768 ?auto_18770 ) ) ( not ( = ?auto_18768 ?auto_18789 ) ) ( not ( = ?auto_18770 ?auto_18781 ) ) ( not ( = ?auto_18783 ?auto_18787 ) ) ( not ( = ?auto_18788 ?auto_18782 ) ) ( not ( = ?auto_18789 ?auto_18781 ) ) ( not ( = ?auto_18768 ?auto_18771 ) ) ( not ( = ?auto_18768 ?auto_18793 ) ) ( not ( = ?auto_18769 ?auto_18771 ) ) ( not ( = ?auto_18769 ?auto_18793 ) ) ( not ( = ?auto_18771 ?auto_18789 ) ) ( not ( = ?auto_18771 ?auto_18781 ) ) ( not ( = ?auto_18790 ?auto_18783 ) ) ( not ( = ?auto_18790 ?auto_18787 ) ) ( not ( = ?auto_18786 ?auto_18788 ) ) ( not ( = ?auto_18786 ?auto_18782 ) ) ( not ( = ?auto_18793 ?auto_18789 ) ) ( not ( = ?auto_18793 ?auto_18781 ) ) ( not ( = ?auto_18768 ?auto_18772 ) ) ( not ( = ?auto_18768 ?auto_18785 ) ) ( not ( = ?auto_18769 ?auto_18772 ) ) ( not ( = ?auto_18769 ?auto_18785 ) ) ( not ( = ?auto_18770 ?auto_18772 ) ) ( not ( = ?auto_18770 ?auto_18785 ) ) ( not ( = ?auto_18772 ?auto_18793 ) ) ( not ( = ?auto_18772 ?auto_18789 ) ) ( not ( = ?auto_18772 ?auto_18781 ) ) ( not ( = ?auto_18785 ?auto_18793 ) ) ( not ( = ?auto_18785 ?auto_18789 ) ) ( not ( = ?auto_18785 ?auto_18781 ) ) ( not ( = ?auto_18768 ?auto_18773 ) ) ( not ( = ?auto_18768 ?auto_18791 ) ) ( not ( = ?auto_18769 ?auto_18773 ) ) ( not ( = ?auto_18769 ?auto_18791 ) ) ( not ( = ?auto_18770 ?auto_18773 ) ) ( not ( = ?auto_18770 ?auto_18791 ) ) ( not ( = ?auto_18771 ?auto_18773 ) ) ( not ( = ?auto_18771 ?auto_18791 ) ) ( not ( = ?auto_18773 ?auto_18785 ) ) ( not ( = ?auto_18773 ?auto_18793 ) ) ( not ( = ?auto_18773 ?auto_18789 ) ) ( not ( = ?auto_18773 ?auto_18781 ) ) ( not ( = ?auto_18792 ?auto_18787 ) ) ( not ( = ?auto_18792 ?auto_18790 ) ) ( not ( = ?auto_18792 ?auto_18783 ) ) ( not ( = ?auto_18784 ?auto_18782 ) ) ( not ( = ?auto_18784 ?auto_18786 ) ) ( not ( = ?auto_18784 ?auto_18788 ) ) ( not ( = ?auto_18791 ?auto_18785 ) ) ( not ( = ?auto_18791 ?auto_18793 ) ) ( not ( = ?auto_18791 ?auto_18789 ) ) ( not ( = ?auto_18791 ?auto_18781 ) ) ( not ( = ?auto_18768 ?auto_18774 ) ) ( not ( = ?auto_18768 ?auto_18780 ) ) ( not ( = ?auto_18769 ?auto_18774 ) ) ( not ( = ?auto_18769 ?auto_18780 ) ) ( not ( = ?auto_18770 ?auto_18774 ) ) ( not ( = ?auto_18770 ?auto_18780 ) ) ( not ( = ?auto_18771 ?auto_18774 ) ) ( not ( = ?auto_18771 ?auto_18780 ) ) ( not ( = ?auto_18772 ?auto_18774 ) ) ( not ( = ?auto_18772 ?auto_18780 ) ) ( not ( = ?auto_18774 ?auto_18791 ) ) ( not ( = ?auto_18774 ?auto_18785 ) ) ( not ( = ?auto_18774 ?auto_18793 ) ) ( not ( = ?auto_18774 ?auto_18789 ) ) ( not ( = ?auto_18774 ?auto_18781 ) ) ( not ( = ?auto_18775 ?auto_18792 ) ) ( not ( = ?auto_18775 ?auto_18787 ) ) ( not ( = ?auto_18775 ?auto_18790 ) ) ( not ( = ?auto_18775 ?auto_18783 ) ) ( not ( = ?auto_18779 ?auto_18784 ) ) ( not ( = ?auto_18779 ?auto_18782 ) ) ( not ( = ?auto_18779 ?auto_18786 ) ) ( not ( = ?auto_18779 ?auto_18788 ) ) ( not ( = ?auto_18780 ?auto_18791 ) ) ( not ( = ?auto_18780 ?auto_18785 ) ) ( not ( = ?auto_18780 ?auto_18793 ) ) ( not ( = ?auto_18780 ?auto_18789 ) ) ( not ( = ?auto_18780 ?auto_18781 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_18768 ?auto_18769 ?auto_18770 ?auto_18771 ?auto_18772 ?auto_18773 )
      ( MAKE-1CRATE ?auto_18773 ?auto_18774 )
      ( MAKE-6CRATE-VERIFY ?auto_18768 ?auto_18769 ?auto_18770 ?auto_18771 ?auto_18772 ?auto_18773 ?auto_18774 ) )
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
      ?auto_18824 - HOIST
      ?auto_18825 - PLACE
      ?auto_18820 - PLACE
      ?auto_18822 - HOIST
      ?auto_18821 - SURFACE
      ?auto_18839 - PLACE
      ?auto_18832 - HOIST
      ?auto_18827 - SURFACE
      ?auto_18833 - PLACE
      ?auto_18840 - HOIST
      ?auto_18830 - SURFACE
      ?auto_18836 - PLACE
      ?auto_18841 - HOIST
      ?auto_18838 - SURFACE
      ?auto_18831 - PLACE
      ?auto_18837 - HOIST
      ?auto_18834 - SURFACE
      ?auto_18826 - PLACE
      ?auto_18835 - HOIST
      ?auto_18829 - SURFACE
      ?auto_18828 - SURFACE
      ?auto_18823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18824 ?auto_18825 ) ( IS-CRATE ?auto_18819 ) ( not ( = ?auto_18820 ?auto_18825 ) ) ( HOIST-AT ?auto_18822 ?auto_18820 ) ( AVAILABLE ?auto_18822 ) ( SURFACE-AT ?auto_18819 ?auto_18820 ) ( ON ?auto_18819 ?auto_18821 ) ( CLEAR ?auto_18819 ) ( not ( = ?auto_18818 ?auto_18819 ) ) ( not ( = ?auto_18818 ?auto_18821 ) ) ( not ( = ?auto_18819 ?auto_18821 ) ) ( not ( = ?auto_18824 ?auto_18822 ) ) ( IS-CRATE ?auto_18818 ) ( not ( = ?auto_18839 ?auto_18825 ) ) ( HOIST-AT ?auto_18832 ?auto_18839 ) ( AVAILABLE ?auto_18832 ) ( SURFACE-AT ?auto_18818 ?auto_18839 ) ( ON ?auto_18818 ?auto_18827 ) ( CLEAR ?auto_18818 ) ( not ( = ?auto_18817 ?auto_18818 ) ) ( not ( = ?auto_18817 ?auto_18827 ) ) ( not ( = ?auto_18818 ?auto_18827 ) ) ( not ( = ?auto_18824 ?auto_18832 ) ) ( IS-CRATE ?auto_18817 ) ( not ( = ?auto_18833 ?auto_18825 ) ) ( HOIST-AT ?auto_18840 ?auto_18833 ) ( AVAILABLE ?auto_18840 ) ( SURFACE-AT ?auto_18817 ?auto_18833 ) ( ON ?auto_18817 ?auto_18830 ) ( CLEAR ?auto_18817 ) ( not ( = ?auto_18816 ?auto_18817 ) ) ( not ( = ?auto_18816 ?auto_18830 ) ) ( not ( = ?auto_18817 ?auto_18830 ) ) ( not ( = ?auto_18824 ?auto_18840 ) ) ( IS-CRATE ?auto_18816 ) ( not ( = ?auto_18836 ?auto_18825 ) ) ( HOIST-AT ?auto_18841 ?auto_18836 ) ( SURFACE-AT ?auto_18816 ?auto_18836 ) ( ON ?auto_18816 ?auto_18838 ) ( CLEAR ?auto_18816 ) ( not ( = ?auto_18815 ?auto_18816 ) ) ( not ( = ?auto_18815 ?auto_18838 ) ) ( not ( = ?auto_18816 ?auto_18838 ) ) ( not ( = ?auto_18824 ?auto_18841 ) ) ( IS-CRATE ?auto_18815 ) ( not ( = ?auto_18831 ?auto_18825 ) ) ( HOIST-AT ?auto_18837 ?auto_18831 ) ( AVAILABLE ?auto_18837 ) ( SURFACE-AT ?auto_18815 ?auto_18831 ) ( ON ?auto_18815 ?auto_18834 ) ( CLEAR ?auto_18815 ) ( not ( = ?auto_18814 ?auto_18815 ) ) ( not ( = ?auto_18814 ?auto_18834 ) ) ( not ( = ?auto_18815 ?auto_18834 ) ) ( not ( = ?auto_18824 ?auto_18837 ) ) ( IS-CRATE ?auto_18814 ) ( not ( = ?auto_18826 ?auto_18825 ) ) ( HOIST-AT ?auto_18835 ?auto_18826 ) ( AVAILABLE ?auto_18835 ) ( SURFACE-AT ?auto_18814 ?auto_18826 ) ( ON ?auto_18814 ?auto_18829 ) ( CLEAR ?auto_18814 ) ( not ( = ?auto_18813 ?auto_18814 ) ) ( not ( = ?auto_18813 ?auto_18829 ) ) ( not ( = ?auto_18814 ?auto_18829 ) ) ( not ( = ?auto_18824 ?auto_18835 ) ) ( SURFACE-AT ?auto_18812 ?auto_18825 ) ( CLEAR ?auto_18812 ) ( IS-CRATE ?auto_18813 ) ( AVAILABLE ?auto_18824 ) ( AVAILABLE ?auto_18841 ) ( SURFACE-AT ?auto_18813 ?auto_18836 ) ( ON ?auto_18813 ?auto_18828 ) ( CLEAR ?auto_18813 ) ( TRUCK-AT ?auto_18823 ?auto_18825 ) ( not ( = ?auto_18812 ?auto_18813 ) ) ( not ( = ?auto_18812 ?auto_18828 ) ) ( not ( = ?auto_18813 ?auto_18828 ) ) ( not ( = ?auto_18812 ?auto_18814 ) ) ( not ( = ?auto_18812 ?auto_18829 ) ) ( not ( = ?auto_18814 ?auto_18828 ) ) ( not ( = ?auto_18826 ?auto_18836 ) ) ( not ( = ?auto_18835 ?auto_18841 ) ) ( not ( = ?auto_18829 ?auto_18828 ) ) ( not ( = ?auto_18812 ?auto_18815 ) ) ( not ( = ?auto_18812 ?auto_18834 ) ) ( not ( = ?auto_18813 ?auto_18815 ) ) ( not ( = ?auto_18813 ?auto_18834 ) ) ( not ( = ?auto_18815 ?auto_18829 ) ) ( not ( = ?auto_18815 ?auto_18828 ) ) ( not ( = ?auto_18831 ?auto_18826 ) ) ( not ( = ?auto_18831 ?auto_18836 ) ) ( not ( = ?auto_18837 ?auto_18835 ) ) ( not ( = ?auto_18837 ?auto_18841 ) ) ( not ( = ?auto_18834 ?auto_18829 ) ) ( not ( = ?auto_18834 ?auto_18828 ) ) ( not ( = ?auto_18812 ?auto_18816 ) ) ( not ( = ?auto_18812 ?auto_18838 ) ) ( not ( = ?auto_18813 ?auto_18816 ) ) ( not ( = ?auto_18813 ?auto_18838 ) ) ( not ( = ?auto_18814 ?auto_18816 ) ) ( not ( = ?auto_18814 ?auto_18838 ) ) ( not ( = ?auto_18816 ?auto_18834 ) ) ( not ( = ?auto_18816 ?auto_18829 ) ) ( not ( = ?auto_18816 ?auto_18828 ) ) ( not ( = ?auto_18838 ?auto_18834 ) ) ( not ( = ?auto_18838 ?auto_18829 ) ) ( not ( = ?auto_18838 ?auto_18828 ) ) ( not ( = ?auto_18812 ?auto_18817 ) ) ( not ( = ?auto_18812 ?auto_18830 ) ) ( not ( = ?auto_18813 ?auto_18817 ) ) ( not ( = ?auto_18813 ?auto_18830 ) ) ( not ( = ?auto_18814 ?auto_18817 ) ) ( not ( = ?auto_18814 ?auto_18830 ) ) ( not ( = ?auto_18815 ?auto_18817 ) ) ( not ( = ?auto_18815 ?auto_18830 ) ) ( not ( = ?auto_18817 ?auto_18838 ) ) ( not ( = ?auto_18817 ?auto_18834 ) ) ( not ( = ?auto_18817 ?auto_18829 ) ) ( not ( = ?auto_18817 ?auto_18828 ) ) ( not ( = ?auto_18833 ?auto_18836 ) ) ( not ( = ?auto_18833 ?auto_18831 ) ) ( not ( = ?auto_18833 ?auto_18826 ) ) ( not ( = ?auto_18840 ?auto_18841 ) ) ( not ( = ?auto_18840 ?auto_18837 ) ) ( not ( = ?auto_18840 ?auto_18835 ) ) ( not ( = ?auto_18830 ?auto_18838 ) ) ( not ( = ?auto_18830 ?auto_18834 ) ) ( not ( = ?auto_18830 ?auto_18829 ) ) ( not ( = ?auto_18830 ?auto_18828 ) ) ( not ( = ?auto_18812 ?auto_18818 ) ) ( not ( = ?auto_18812 ?auto_18827 ) ) ( not ( = ?auto_18813 ?auto_18818 ) ) ( not ( = ?auto_18813 ?auto_18827 ) ) ( not ( = ?auto_18814 ?auto_18818 ) ) ( not ( = ?auto_18814 ?auto_18827 ) ) ( not ( = ?auto_18815 ?auto_18818 ) ) ( not ( = ?auto_18815 ?auto_18827 ) ) ( not ( = ?auto_18816 ?auto_18818 ) ) ( not ( = ?auto_18816 ?auto_18827 ) ) ( not ( = ?auto_18818 ?auto_18830 ) ) ( not ( = ?auto_18818 ?auto_18838 ) ) ( not ( = ?auto_18818 ?auto_18834 ) ) ( not ( = ?auto_18818 ?auto_18829 ) ) ( not ( = ?auto_18818 ?auto_18828 ) ) ( not ( = ?auto_18839 ?auto_18833 ) ) ( not ( = ?auto_18839 ?auto_18836 ) ) ( not ( = ?auto_18839 ?auto_18831 ) ) ( not ( = ?auto_18839 ?auto_18826 ) ) ( not ( = ?auto_18832 ?auto_18840 ) ) ( not ( = ?auto_18832 ?auto_18841 ) ) ( not ( = ?auto_18832 ?auto_18837 ) ) ( not ( = ?auto_18832 ?auto_18835 ) ) ( not ( = ?auto_18827 ?auto_18830 ) ) ( not ( = ?auto_18827 ?auto_18838 ) ) ( not ( = ?auto_18827 ?auto_18834 ) ) ( not ( = ?auto_18827 ?auto_18829 ) ) ( not ( = ?auto_18827 ?auto_18828 ) ) ( not ( = ?auto_18812 ?auto_18819 ) ) ( not ( = ?auto_18812 ?auto_18821 ) ) ( not ( = ?auto_18813 ?auto_18819 ) ) ( not ( = ?auto_18813 ?auto_18821 ) ) ( not ( = ?auto_18814 ?auto_18819 ) ) ( not ( = ?auto_18814 ?auto_18821 ) ) ( not ( = ?auto_18815 ?auto_18819 ) ) ( not ( = ?auto_18815 ?auto_18821 ) ) ( not ( = ?auto_18816 ?auto_18819 ) ) ( not ( = ?auto_18816 ?auto_18821 ) ) ( not ( = ?auto_18817 ?auto_18819 ) ) ( not ( = ?auto_18817 ?auto_18821 ) ) ( not ( = ?auto_18819 ?auto_18827 ) ) ( not ( = ?auto_18819 ?auto_18830 ) ) ( not ( = ?auto_18819 ?auto_18838 ) ) ( not ( = ?auto_18819 ?auto_18834 ) ) ( not ( = ?auto_18819 ?auto_18829 ) ) ( not ( = ?auto_18819 ?auto_18828 ) ) ( not ( = ?auto_18820 ?auto_18839 ) ) ( not ( = ?auto_18820 ?auto_18833 ) ) ( not ( = ?auto_18820 ?auto_18836 ) ) ( not ( = ?auto_18820 ?auto_18831 ) ) ( not ( = ?auto_18820 ?auto_18826 ) ) ( not ( = ?auto_18822 ?auto_18832 ) ) ( not ( = ?auto_18822 ?auto_18840 ) ) ( not ( = ?auto_18822 ?auto_18841 ) ) ( not ( = ?auto_18822 ?auto_18837 ) ) ( not ( = ?auto_18822 ?auto_18835 ) ) ( not ( = ?auto_18821 ?auto_18827 ) ) ( not ( = ?auto_18821 ?auto_18830 ) ) ( not ( = ?auto_18821 ?auto_18838 ) ) ( not ( = ?auto_18821 ?auto_18834 ) ) ( not ( = ?auto_18821 ?auto_18829 ) ) ( not ( = ?auto_18821 ?auto_18828 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_18812 ?auto_18813 ?auto_18814 ?auto_18815 ?auto_18816 ?auto_18817 ?auto_18818 )
      ( MAKE-1CRATE ?auto_18818 ?auto_18819 )
      ( MAKE-7CRATE-VERIFY ?auto_18812 ?auto_18813 ?auto_18814 ?auto_18815 ?auto_18816 ?auto_18817 ?auto_18818 ?auto_18819 ) )
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
      ?auto_18868 - SURFACE
      ?auto_18869 - SURFACE
    )
    :vars
    (
      ?auto_18875 - HOIST
      ?auto_18873 - PLACE
      ?auto_18872 - PLACE
      ?auto_18874 - HOIST
      ?auto_18870 - SURFACE
      ?auto_18892 - PLACE
      ?auto_18878 - HOIST
      ?auto_18893 - SURFACE
      ?auto_18885 - PLACE
      ?auto_18887 - HOIST
      ?auto_18888 - SURFACE
      ?auto_18886 - PLACE
      ?auto_18890 - HOIST
      ?auto_18877 - SURFACE
      ?auto_18881 - PLACE
      ?auto_18879 - HOIST
      ?auto_18884 - SURFACE
      ?auto_18876 - PLACE
      ?auto_18883 - HOIST
      ?auto_18880 - SURFACE
      ?auto_18891 - PLACE
      ?auto_18882 - HOIST
      ?auto_18894 - SURFACE
      ?auto_18889 - SURFACE
      ?auto_18871 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18875 ?auto_18873 ) ( IS-CRATE ?auto_18869 ) ( not ( = ?auto_18872 ?auto_18873 ) ) ( HOIST-AT ?auto_18874 ?auto_18872 ) ( AVAILABLE ?auto_18874 ) ( SURFACE-AT ?auto_18869 ?auto_18872 ) ( ON ?auto_18869 ?auto_18870 ) ( CLEAR ?auto_18869 ) ( not ( = ?auto_18868 ?auto_18869 ) ) ( not ( = ?auto_18868 ?auto_18870 ) ) ( not ( = ?auto_18869 ?auto_18870 ) ) ( not ( = ?auto_18875 ?auto_18874 ) ) ( IS-CRATE ?auto_18868 ) ( not ( = ?auto_18892 ?auto_18873 ) ) ( HOIST-AT ?auto_18878 ?auto_18892 ) ( AVAILABLE ?auto_18878 ) ( SURFACE-AT ?auto_18868 ?auto_18892 ) ( ON ?auto_18868 ?auto_18893 ) ( CLEAR ?auto_18868 ) ( not ( = ?auto_18867 ?auto_18868 ) ) ( not ( = ?auto_18867 ?auto_18893 ) ) ( not ( = ?auto_18868 ?auto_18893 ) ) ( not ( = ?auto_18875 ?auto_18878 ) ) ( IS-CRATE ?auto_18867 ) ( not ( = ?auto_18885 ?auto_18873 ) ) ( HOIST-AT ?auto_18887 ?auto_18885 ) ( AVAILABLE ?auto_18887 ) ( SURFACE-AT ?auto_18867 ?auto_18885 ) ( ON ?auto_18867 ?auto_18888 ) ( CLEAR ?auto_18867 ) ( not ( = ?auto_18866 ?auto_18867 ) ) ( not ( = ?auto_18866 ?auto_18888 ) ) ( not ( = ?auto_18867 ?auto_18888 ) ) ( not ( = ?auto_18875 ?auto_18887 ) ) ( IS-CRATE ?auto_18866 ) ( not ( = ?auto_18886 ?auto_18873 ) ) ( HOIST-AT ?auto_18890 ?auto_18886 ) ( AVAILABLE ?auto_18890 ) ( SURFACE-AT ?auto_18866 ?auto_18886 ) ( ON ?auto_18866 ?auto_18877 ) ( CLEAR ?auto_18866 ) ( not ( = ?auto_18865 ?auto_18866 ) ) ( not ( = ?auto_18865 ?auto_18877 ) ) ( not ( = ?auto_18866 ?auto_18877 ) ) ( not ( = ?auto_18875 ?auto_18890 ) ) ( IS-CRATE ?auto_18865 ) ( not ( = ?auto_18881 ?auto_18873 ) ) ( HOIST-AT ?auto_18879 ?auto_18881 ) ( SURFACE-AT ?auto_18865 ?auto_18881 ) ( ON ?auto_18865 ?auto_18884 ) ( CLEAR ?auto_18865 ) ( not ( = ?auto_18864 ?auto_18865 ) ) ( not ( = ?auto_18864 ?auto_18884 ) ) ( not ( = ?auto_18865 ?auto_18884 ) ) ( not ( = ?auto_18875 ?auto_18879 ) ) ( IS-CRATE ?auto_18864 ) ( not ( = ?auto_18876 ?auto_18873 ) ) ( HOIST-AT ?auto_18883 ?auto_18876 ) ( AVAILABLE ?auto_18883 ) ( SURFACE-AT ?auto_18864 ?auto_18876 ) ( ON ?auto_18864 ?auto_18880 ) ( CLEAR ?auto_18864 ) ( not ( = ?auto_18863 ?auto_18864 ) ) ( not ( = ?auto_18863 ?auto_18880 ) ) ( not ( = ?auto_18864 ?auto_18880 ) ) ( not ( = ?auto_18875 ?auto_18883 ) ) ( IS-CRATE ?auto_18863 ) ( not ( = ?auto_18891 ?auto_18873 ) ) ( HOIST-AT ?auto_18882 ?auto_18891 ) ( AVAILABLE ?auto_18882 ) ( SURFACE-AT ?auto_18863 ?auto_18891 ) ( ON ?auto_18863 ?auto_18894 ) ( CLEAR ?auto_18863 ) ( not ( = ?auto_18862 ?auto_18863 ) ) ( not ( = ?auto_18862 ?auto_18894 ) ) ( not ( = ?auto_18863 ?auto_18894 ) ) ( not ( = ?auto_18875 ?auto_18882 ) ) ( SURFACE-AT ?auto_18861 ?auto_18873 ) ( CLEAR ?auto_18861 ) ( IS-CRATE ?auto_18862 ) ( AVAILABLE ?auto_18875 ) ( AVAILABLE ?auto_18879 ) ( SURFACE-AT ?auto_18862 ?auto_18881 ) ( ON ?auto_18862 ?auto_18889 ) ( CLEAR ?auto_18862 ) ( TRUCK-AT ?auto_18871 ?auto_18873 ) ( not ( = ?auto_18861 ?auto_18862 ) ) ( not ( = ?auto_18861 ?auto_18889 ) ) ( not ( = ?auto_18862 ?auto_18889 ) ) ( not ( = ?auto_18861 ?auto_18863 ) ) ( not ( = ?auto_18861 ?auto_18894 ) ) ( not ( = ?auto_18863 ?auto_18889 ) ) ( not ( = ?auto_18891 ?auto_18881 ) ) ( not ( = ?auto_18882 ?auto_18879 ) ) ( not ( = ?auto_18894 ?auto_18889 ) ) ( not ( = ?auto_18861 ?auto_18864 ) ) ( not ( = ?auto_18861 ?auto_18880 ) ) ( not ( = ?auto_18862 ?auto_18864 ) ) ( not ( = ?auto_18862 ?auto_18880 ) ) ( not ( = ?auto_18864 ?auto_18894 ) ) ( not ( = ?auto_18864 ?auto_18889 ) ) ( not ( = ?auto_18876 ?auto_18891 ) ) ( not ( = ?auto_18876 ?auto_18881 ) ) ( not ( = ?auto_18883 ?auto_18882 ) ) ( not ( = ?auto_18883 ?auto_18879 ) ) ( not ( = ?auto_18880 ?auto_18894 ) ) ( not ( = ?auto_18880 ?auto_18889 ) ) ( not ( = ?auto_18861 ?auto_18865 ) ) ( not ( = ?auto_18861 ?auto_18884 ) ) ( not ( = ?auto_18862 ?auto_18865 ) ) ( not ( = ?auto_18862 ?auto_18884 ) ) ( not ( = ?auto_18863 ?auto_18865 ) ) ( not ( = ?auto_18863 ?auto_18884 ) ) ( not ( = ?auto_18865 ?auto_18880 ) ) ( not ( = ?auto_18865 ?auto_18894 ) ) ( not ( = ?auto_18865 ?auto_18889 ) ) ( not ( = ?auto_18884 ?auto_18880 ) ) ( not ( = ?auto_18884 ?auto_18894 ) ) ( not ( = ?auto_18884 ?auto_18889 ) ) ( not ( = ?auto_18861 ?auto_18866 ) ) ( not ( = ?auto_18861 ?auto_18877 ) ) ( not ( = ?auto_18862 ?auto_18866 ) ) ( not ( = ?auto_18862 ?auto_18877 ) ) ( not ( = ?auto_18863 ?auto_18866 ) ) ( not ( = ?auto_18863 ?auto_18877 ) ) ( not ( = ?auto_18864 ?auto_18866 ) ) ( not ( = ?auto_18864 ?auto_18877 ) ) ( not ( = ?auto_18866 ?auto_18884 ) ) ( not ( = ?auto_18866 ?auto_18880 ) ) ( not ( = ?auto_18866 ?auto_18894 ) ) ( not ( = ?auto_18866 ?auto_18889 ) ) ( not ( = ?auto_18886 ?auto_18881 ) ) ( not ( = ?auto_18886 ?auto_18876 ) ) ( not ( = ?auto_18886 ?auto_18891 ) ) ( not ( = ?auto_18890 ?auto_18879 ) ) ( not ( = ?auto_18890 ?auto_18883 ) ) ( not ( = ?auto_18890 ?auto_18882 ) ) ( not ( = ?auto_18877 ?auto_18884 ) ) ( not ( = ?auto_18877 ?auto_18880 ) ) ( not ( = ?auto_18877 ?auto_18894 ) ) ( not ( = ?auto_18877 ?auto_18889 ) ) ( not ( = ?auto_18861 ?auto_18867 ) ) ( not ( = ?auto_18861 ?auto_18888 ) ) ( not ( = ?auto_18862 ?auto_18867 ) ) ( not ( = ?auto_18862 ?auto_18888 ) ) ( not ( = ?auto_18863 ?auto_18867 ) ) ( not ( = ?auto_18863 ?auto_18888 ) ) ( not ( = ?auto_18864 ?auto_18867 ) ) ( not ( = ?auto_18864 ?auto_18888 ) ) ( not ( = ?auto_18865 ?auto_18867 ) ) ( not ( = ?auto_18865 ?auto_18888 ) ) ( not ( = ?auto_18867 ?auto_18877 ) ) ( not ( = ?auto_18867 ?auto_18884 ) ) ( not ( = ?auto_18867 ?auto_18880 ) ) ( not ( = ?auto_18867 ?auto_18894 ) ) ( not ( = ?auto_18867 ?auto_18889 ) ) ( not ( = ?auto_18885 ?auto_18886 ) ) ( not ( = ?auto_18885 ?auto_18881 ) ) ( not ( = ?auto_18885 ?auto_18876 ) ) ( not ( = ?auto_18885 ?auto_18891 ) ) ( not ( = ?auto_18887 ?auto_18890 ) ) ( not ( = ?auto_18887 ?auto_18879 ) ) ( not ( = ?auto_18887 ?auto_18883 ) ) ( not ( = ?auto_18887 ?auto_18882 ) ) ( not ( = ?auto_18888 ?auto_18877 ) ) ( not ( = ?auto_18888 ?auto_18884 ) ) ( not ( = ?auto_18888 ?auto_18880 ) ) ( not ( = ?auto_18888 ?auto_18894 ) ) ( not ( = ?auto_18888 ?auto_18889 ) ) ( not ( = ?auto_18861 ?auto_18868 ) ) ( not ( = ?auto_18861 ?auto_18893 ) ) ( not ( = ?auto_18862 ?auto_18868 ) ) ( not ( = ?auto_18862 ?auto_18893 ) ) ( not ( = ?auto_18863 ?auto_18868 ) ) ( not ( = ?auto_18863 ?auto_18893 ) ) ( not ( = ?auto_18864 ?auto_18868 ) ) ( not ( = ?auto_18864 ?auto_18893 ) ) ( not ( = ?auto_18865 ?auto_18868 ) ) ( not ( = ?auto_18865 ?auto_18893 ) ) ( not ( = ?auto_18866 ?auto_18868 ) ) ( not ( = ?auto_18866 ?auto_18893 ) ) ( not ( = ?auto_18868 ?auto_18888 ) ) ( not ( = ?auto_18868 ?auto_18877 ) ) ( not ( = ?auto_18868 ?auto_18884 ) ) ( not ( = ?auto_18868 ?auto_18880 ) ) ( not ( = ?auto_18868 ?auto_18894 ) ) ( not ( = ?auto_18868 ?auto_18889 ) ) ( not ( = ?auto_18892 ?auto_18885 ) ) ( not ( = ?auto_18892 ?auto_18886 ) ) ( not ( = ?auto_18892 ?auto_18881 ) ) ( not ( = ?auto_18892 ?auto_18876 ) ) ( not ( = ?auto_18892 ?auto_18891 ) ) ( not ( = ?auto_18878 ?auto_18887 ) ) ( not ( = ?auto_18878 ?auto_18890 ) ) ( not ( = ?auto_18878 ?auto_18879 ) ) ( not ( = ?auto_18878 ?auto_18883 ) ) ( not ( = ?auto_18878 ?auto_18882 ) ) ( not ( = ?auto_18893 ?auto_18888 ) ) ( not ( = ?auto_18893 ?auto_18877 ) ) ( not ( = ?auto_18893 ?auto_18884 ) ) ( not ( = ?auto_18893 ?auto_18880 ) ) ( not ( = ?auto_18893 ?auto_18894 ) ) ( not ( = ?auto_18893 ?auto_18889 ) ) ( not ( = ?auto_18861 ?auto_18869 ) ) ( not ( = ?auto_18861 ?auto_18870 ) ) ( not ( = ?auto_18862 ?auto_18869 ) ) ( not ( = ?auto_18862 ?auto_18870 ) ) ( not ( = ?auto_18863 ?auto_18869 ) ) ( not ( = ?auto_18863 ?auto_18870 ) ) ( not ( = ?auto_18864 ?auto_18869 ) ) ( not ( = ?auto_18864 ?auto_18870 ) ) ( not ( = ?auto_18865 ?auto_18869 ) ) ( not ( = ?auto_18865 ?auto_18870 ) ) ( not ( = ?auto_18866 ?auto_18869 ) ) ( not ( = ?auto_18866 ?auto_18870 ) ) ( not ( = ?auto_18867 ?auto_18869 ) ) ( not ( = ?auto_18867 ?auto_18870 ) ) ( not ( = ?auto_18869 ?auto_18893 ) ) ( not ( = ?auto_18869 ?auto_18888 ) ) ( not ( = ?auto_18869 ?auto_18877 ) ) ( not ( = ?auto_18869 ?auto_18884 ) ) ( not ( = ?auto_18869 ?auto_18880 ) ) ( not ( = ?auto_18869 ?auto_18894 ) ) ( not ( = ?auto_18869 ?auto_18889 ) ) ( not ( = ?auto_18872 ?auto_18892 ) ) ( not ( = ?auto_18872 ?auto_18885 ) ) ( not ( = ?auto_18872 ?auto_18886 ) ) ( not ( = ?auto_18872 ?auto_18881 ) ) ( not ( = ?auto_18872 ?auto_18876 ) ) ( not ( = ?auto_18872 ?auto_18891 ) ) ( not ( = ?auto_18874 ?auto_18878 ) ) ( not ( = ?auto_18874 ?auto_18887 ) ) ( not ( = ?auto_18874 ?auto_18890 ) ) ( not ( = ?auto_18874 ?auto_18879 ) ) ( not ( = ?auto_18874 ?auto_18883 ) ) ( not ( = ?auto_18874 ?auto_18882 ) ) ( not ( = ?auto_18870 ?auto_18893 ) ) ( not ( = ?auto_18870 ?auto_18888 ) ) ( not ( = ?auto_18870 ?auto_18877 ) ) ( not ( = ?auto_18870 ?auto_18884 ) ) ( not ( = ?auto_18870 ?auto_18880 ) ) ( not ( = ?auto_18870 ?auto_18894 ) ) ( not ( = ?auto_18870 ?auto_18889 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_18861 ?auto_18862 ?auto_18863 ?auto_18864 ?auto_18865 ?auto_18866 ?auto_18867 ?auto_18868 )
      ( MAKE-1CRATE ?auto_18868 ?auto_18869 )
      ( MAKE-8CRATE-VERIFY ?auto_18861 ?auto_18862 ?auto_18863 ?auto_18864 ?auto_18865 ?auto_18866 ?auto_18867 ?auto_18868 ?auto_18869 ) )
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
      ?auto_18922 - SURFACE
      ?auto_18923 - SURFACE
      ?auto_18924 - SURFACE
    )
    :vars
    (
      ?auto_18925 - HOIST
      ?auto_18926 - PLACE
      ?auto_18930 - PLACE
      ?auto_18927 - HOIST
      ?auto_18928 - SURFACE
      ?auto_18934 - PLACE
      ?auto_18950 - HOIST
      ?auto_18935 - SURFACE
      ?auto_18936 - PLACE
      ?auto_18933 - HOIST
      ?auto_18944 - SURFACE
      ?auto_18941 - PLACE
      ?auto_18942 - HOIST
      ?auto_18945 - SURFACE
      ?auto_18940 - PLACE
      ?auto_18931 - HOIST
      ?auto_18943 - SURFACE
      ?auto_18948 - PLACE
      ?auto_18932 - HOIST
      ?auto_18939 - SURFACE
      ?auto_18949 - SURFACE
      ?auto_18938 - PLACE
      ?auto_18947 - HOIST
      ?auto_18937 - SURFACE
      ?auto_18946 - SURFACE
      ?auto_18929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18925 ?auto_18926 ) ( IS-CRATE ?auto_18924 ) ( not ( = ?auto_18930 ?auto_18926 ) ) ( HOIST-AT ?auto_18927 ?auto_18930 ) ( SURFACE-AT ?auto_18924 ?auto_18930 ) ( ON ?auto_18924 ?auto_18928 ) ( CLEAR ?auto_18924 ) ( not ( = ?auto_18923 ?auto_18924 ) ) ( not ( = ?auto_18923 ?auto_18928 ) ) ( not ( = ?auto_18924 ?auto_18928 ) ) ( not ( = ?auto_18925 ?auto_18927 ) ) ( IS-CRATE ?auto_18923 ) ( not ( = ?auto_18934 ?auto_18926 ) ) ( HOIST-AT ?auto_18950 ?auto_18934 ) ( AVAILABLE ?auto_18950 ) ( SURFACE-AT ?auto_18923 ?auto_18934 ) ( ON ?auto_18923 ?auto_18935 ) ( CLEAR ?auto_18923 ) ( not ( = ?auto_18922 ?auto_18923 ) ) ( not ( = ?auto_18922 ?auto_18935 ) ) ( not ( = ?auto_18923 ?auto_18935 ) ) ( not ( = ?auto_18925 ?auto_18950 ) ) ( IS-CRATE ?auto_18922 ) ( not ( = ?auto_18936 ?auto_18926 ) ) ( HOIST-AT ?auto_18933 ?auto_18936 ) ( AVAILABLE ?auto_18933 ) ( SURFACE-AT ?auto_18922 ?auto_18936 ) ( ON ?auto_18922 ?auto_18944 ) ( CLEAR ?auto_18922 ) ( not ( = ?auto_18921 ?auto_18922 ) ) ( not ( = ?auto_18921 ?auto_18944 ) ) ( not ( = ?auto_18922 ?auto_18944 ) ) ( not ( = ?auto_18925 ?auto_18933 ) ) ( IS-CRATE ?auto_18921 ) ( not ( = ?auto_18941 ?auto_18926 ) ) ( HOIST-AT ?auto_18942 ?auto_18941 ) ( AVAILABLE ?auto_18942 ) ( SURFACE-AT ?auto_18921 ?auto_18941 ) ( ON ?auto_18921 ?auto_18945 ) ( CLEAR ?auto_18921 ) ( not ( = ?auto_18920 ?auto_18921 ) ) ( not ( = ?auto_18920 ?auto_18945 ) ) ( not ( = ?auto_18921 ?auto_18945 ) ) ( not ( = ?auto_18925 ?auto_18942 ) ) ( IS-CRATE ?auto_18920 ) ( not ( = ?auto_18940 ?auto_18926 ) ) ( HOIST-AT ?auto_18931 ?auto_18940 ) ( AVAILABLE ?auto_18931 ) ( SURFACE-AT ?auto_18920 ?auto_18940 ) ( ON ?auto_18920 ?auto_18943 ) ( CLEAR ?auto_18920 ) ( not ( = ?auto_18919 ?auto_18920 ) ) ( not ( = ?auto_18919 ?auto_18943 ) ) ( not ( = ?auto_18920 ?auto_18943 ) ) ( not ( = ?auto_18925 ?auto_18931 ) ) ( IS-CRATE ?auto_18919 ) ( not ( = ?auto_18948 ?auto_18926 ) ) ( HOIST-AT ?auto_18932 ?auto_18948 ) ( SURFACE-AT ?auto_18919 ?auto_18948 ) ( ON ?auto_18919 ?auto_18939 ) ( CLEAR ?auto_18919 ) ( not ( = ?auto_18918 ?auto_18919 ) ) ( not ( = ?auto_18918 ?auto_18939 ) ) ( not ( = ?auto_18919 ?auto_18939 ) ) ( not ( = ?auto_18925 ?auto_18932 ) ) ( IS-CRATE ?auto_18918 ) ( AVAILABLE ?auto_18927 ) ( SURFACE-AT ?auto_18918 ?auto_18930 ) ( ON ?auto_18918 ?auto_18949 ) ( CLEAR ?auto_18918 ) ( not ( = ?auto_18917 ?auto_18918 ) ) ( not ( = ?auto_18917 ?auto_18949 ) ) ( not ( = ?auto_18918 ?auto_18949 ) ) ( IS-CRATE ?auto_18917 ) ( not ( = ?auto_18938 ?auto_18926 ) ) ( HOIST-AT ?auto_18947 ?auto_18938 ) ( AVAILABLE ?auto_18947 ) ( SURFACE-AT ?auto_18917 ?auto_18938 ) ( ON ?auto_18917 ?auto_18937 ) ( CLEAR ?auto_18917 ) ( not ( = ?auto_18916 ?auto_18917 ) ) ( not ( = ?auto_18916 ?auto_18937 ) ) ( not ( = ?auto_18917 ?auto_18937 ) ) ( not ( = ?auto_18925 ?auto_18947 ) ) ( SURFACE-AT ?auto_18915 ?auto_18926 ) ( CLEAR ?auto_18915 ) ( IS-CRATE ?auto_18916 ) ( AVAILABLE ?auto_18925 ) ( AVAILABLE ?auto_18932 ) ( SURFACE-AT ?auto_18916 ?auto_18948 ) ( ON ?auto_18916 ?auto_18946 ) ( CLEAR ?auto_18916 ) ( TRUCK-AT ?auto_18929 ?auto_18926 ) ( not ( = ?auto_18915 ?auto_18916 ) ) ( not ( = ?auto_18915 ?auto_18946 ) ) ( not ( = ?auto_18916 ?auto_18946 ) ) ( not ( = ?auto_18915 ?auto_18917 ) ) ( not ( = ?auto_18915 ?auto_18937 ) ) ( not ( = ?auto_18917 ?auto_18946 ) ) ( not ( = ?auto_18938 ?auto_18948 ) ) ( not ( = ?auto_18947 ?auto_18932 ) ) ( not ( = ?auto_18937 ?auto_18946 ) ) ( not ( = ?auto_18915 ?auto_18918 ) ) ( not ( = ?auto_18915 ?auto_18949 ) ) ( not ( = ?auto_18916 ?auto_18918 ) ) ( not ( = ?auto_18916 ?auto_18949 ) ) ( not ( = ?auto_18918 ?auto_18937 ) ) ( not ( = ?auto_18918 ?auto_18946 ) ) ( not ( = ?auto_18930 ?auto_18938 ) ) ( not ( = ?auto_18930 ?auto_18948 ) ) ( not ( = ?auto_18927 ?auto_18947 ) ) ( not ( = ?auto_18927 ?auto_18932 ) ) ( not ( = ?auto_18949 ?auto_18937 ) ) ( not ( = ?auto_18949 ?auto_18946 ) ) ( not ( = ?auto_18915 ?auto_18919 ) ) ( not ( = ?auto_18915 ?auto_18939 ) ) ( not ( = ?auto_18916 ?auto_18919 ) ) ( not ( = ?auto_18916 ?auto_18939 ) ) ( not ( = ?auto_18917 ?auto_18919 ) ) ( not ( = ?auto_18917 ?auto_18939 ) ) ( not ( = ?auto_18919 ?auto_18949 ) ) ( not ( = ?auto_18919 ?auto_18937 ) ) ( not ( = ?auto_18919 ?auto_18946 ) ) ( not ( = ?auto_18939 ?auto_18949 ) ) ( not ( = ?auto_18939 ?auto_18937 ) ) ( not ( = ?auto_18939 ?auto_18946 ) ) ( not ( = ?auto_18915 ?auto_18920 ) ) ( not ( = ?auto_18915 ?auto_18943 ) ) ( not ( = ?auto_18916 ?auto_18920 ) ) ( not ( = ?auto_18916 ?auto_18943 ) ) ( not ( = ?auto_18917 ?auto_18920 ) ) ( not ( = ?auto_18917 ?auto_18943 ) ) ( not ( = ?auto_18918 ?auto_18920 ) ) ( not ( = ?auto_18918 ?auto_18943 ) ) ( not ( = ?auto_18920 ?auto_18939 ) ) ( not ( = ?auto_18920 ?auto_18949 ) ) ( not ( = ?auto_18920 ?auto_18937 ) ) ( not ( = ?auto_18920 ?auto_18946 ) ) ( not ( = ?auto_18940 ?auto_18948 ) ) ( not ( = ?auto_18940 ?auto_18930 ) ) ( not ( = ?auto_18940 ?auto_18938 ) ) ( not ( = ?auto_18931 ?auto_18932 ) ) ( not ( = ?auto_18931 ?auto_18927 ) ) ( not ( = ?auto_18931 ?auto_18947 ) ) ( not ( = ?auto_18943 ?auto_18939 ) ) ( not ( = ?auto_18943 ?auto_18949 ) ) ( not ( = ?auto_18943 ?auto_18937 ) ) ( not ( = ?auto_18943 ?auto_18946 ) ) ( not ( = ?auto_18915 ?auto_18921 ) ) ( not ( = ?auto_18915 ?auto_18945 ) ) ( not ( = ?auto_18916 ?auto_18921 ) ) ( not ( = ?auto_18916 ?auto_18945 ) ) ( not ( = ?auto_18917 ?auto_18921 ) ) ( not ( = ?auto_18917 ?auto_18945 ) ) ( not ( = ?auto_18918 ?auto_18921 ) ) ( not ( = ?auto_18918 ?auto_18945 ) ) ( not ( = ?auto_18919 ?auto_18921 ) ) ( not ( = ?auto_18919 ?auto_18945 ) ) ( not ( = ?auto_18921 ?auto_18943 ) ) ( not ( = ?auto_18921 ?auto_18939 ) ) ( not ( = ?auto_18921 ?auto_18949 ) ) ( not ( = ?auto_18921 ?auto_18937 ) ) ( not ( = ?auto_18921 ?auto_18946 ) ) ( not ( = ?auto_18941 ?auto_18940 ) ) ( not ( = ?auto_18941 ?auto_18948 ) ) ( not ( = ?auto_18941 ?auto_18930 ) ) ( not ( = ?auto_18941 ?auto_18938 ) ) ( not ( = ?auto_18942 ?auto_18931 ) ) ( not ( = ?auto_18942 ?auto_18932 ) ) ( not ( = ?auto_18942 ?auto_18927 ) ) ( not ( = ?auto_18942 ?auto_18947 ) ) ( not ( = ?auto_18945 ?auto_18943 ) ) ( not ( = ?auto_18945 ?auto_18939 ) ) ( not ( = ?auto_18945 ?auto_18949 ) ) ( not ( = ?auto_18945 ?auto_18937 ) ) ( not ( = ?auto_18945 ?auto_18946 ) ) ( not ( = ?auto_18915 ?auto_18922 ) ) ( not ( = ?auto_18915 ?auto_18944 ) ) ( not ( = ?auto_18916 ?auto_18922 ) ) ( not ( = ?auto_18916 ?auto_18944 ) ) ( not ( = ?auto_18917 ?auto_18922 ) ) ( not ( = ?auto_18917 ?auto_18944 ) ) ( not ( = ?auto_18918 ?auto_18922 ) ) ( not ( = ?auto_18918 ?auto_18944 ) ) ( not ( = ?auto_18919 ?auto_18922 ) ) ( not ( = ?auto_18919 ?auto_18944 ) ) ( not ( = ?auto_18920 ?auto_18922 ) ) ( not ( = ?auto_18920 ?auto_18944 ) ) ( not ( = ?auto_18922 ?auto_18945 ) ) ( not ( = ?auto_18922 ?auto_18943 ) ) ( not ( = ?auto_18922 ?auto_18939 ) ) ( not ( = ?auto_18922 ?auto_18949 ) ) ( not ( = ?auto_18922 ?auto_18937 ) ) ( not ( = ?auto_18922 ?auto_18946 ) ) ( not ( = ?auto_18936 ?auto_18941 ) ) ( not ( = ?auto_18936 ?auto_18940 ) ) ( not ( = ?auto_18936 ?auto_18948 ) ) ( not ( = ?auto_18936 ?auto_18930 ) ) ( not ( = ?auto_18936 ?auto_18938 ) ) ( not ( = ?auto_18933 ?auto_18942 ) ) ( not ( = ?auto_18933 ?auto_18931 ) ) ( not ( = ?auto_18933 ?auto_18932 ) ) ( not ( = ?auto_18933 ?auto_18927 ) ) ( not ( = ?auto_18933 ?auto_18947 ) ) ( not ( = ?auto_18944 ?auto_18945 ) ) ( not ( = ?auto_18944 ?auto_18943 ) ) ( not ( = ?auto_18944 ?auto_18939 ) ) ( not ( = ?auto_18944 ?auto_18949 ) ) ( not ( = ?auto_18944 ?auto_18937 ) ) ( not ( = ?auto_18944 ?auto_18946 ) ) ( not ( = ?auto_18915 ?auto_18923 ) ) ( not ( = ?auto_18915 ?auto_18935 ) ) ( not ( = ?auto_18916 ?auto_18923 ) ) ( not ( = ?auto_18916 ?auto_18935 ) ) ( not ( = ?auto_18917 ?auto_18923 ) ) ( not ( = ?auto_18917 ?auto_18935 ) ) ( not ( = ?auto_18918 ?auto_18923 ) ) ( not ( = ?auto_18918 ?auto_18935 ) ) ( not ( = ?auto_18919 ?auto_18923 ) ) ( not ( = ?auto_18919 ?auto_18935 ) ) ( not ( = ?auto_18920 ?auto_18923 ) ) ( not ( = ?auto_18920 ?auto_18935 ) ) ( not ( = ?auto_18921 ?auto_18923 ) ) ( not ( = ?auto_18921 ?auto_18935 ) ) ( not ( = ?auto_18923 ?auto_18944 ) ) ( not ( = ?auto_18923 ?auto_18945 ) ) ( not ( = ?auto_18923 ?auto_18943 ) ) ( not ( = ?auto_18923 ?auto_18939 ) ) ( not ( = ?auto_18923 ?auto_18949 ) ) ( not ( = ?auto_18923 ?auto_18937 ) ) ( not ( = ?auto_18923 ?auto_18946 ) ) ( not ( = ?auto_18934 ?auto_18936 ) ) ( not ( = ?auto_18934 ?auto_18941 ) ) ( not ( = ?auto_18934 ?auto_18940 ) ) ( not ( = ?auto_18934 ?auto_18948 ) ) ( not ( = ?auto_18934 ?auto_18930 ) ) ( not ( = ?auto_18934 ?auto_18938 ) ) ( not ( = ?auto_18950 ?auto_18933 ) ) ( not ( = ?auto_18950 ?auto_18942 ) ) ( not ( = ?auto_18950 ?auto_18931 ) ) ( not ( = ?auto_18950 ?auto_18932 ) ) ( not ( = ?auto_18950 ?auto_18927 ) ) ( not ( = ?auto_18950 ?auto_18947 ) ) ( not ( = ?auto_18935 ?auto_18944 ) ) ( not ( = ?auto_18935 ?auto_18945 ) ) ( not ( = ?auto_18935 ?auto_18943 ) ) ( not ( = ?auto_18935 ?auto_18939 ) ) ( not ( = ?auto_18935 ?auto_18949 ) ) ( not ( = ?auto_18935 ?auto_18937 ) ) ( not ( = ?auto_18935 ?auto_18946 ) ) ( not ( = ?auto_18915 ?auto_18924 ) ) ( not ( = ?auto_18915 ?auto_18928 ) ) ( not ( = ?auto_18916 ?auto_18924 ) ) ( not ( = ?auto_18916 ?auto_18928 ) ) ( not ( = ?auto_18917 ?auto_18924 ) ) ( not ( = ?auto_18917 ?auto_18928 ) ) ( not ( = ?auto_18918 ?auto_18924 ) ) ( not ( = ?auto_18918 ?auto_18928 ) ) ( not ( = ?auto_18919 ?auto_18924 ) ) ( not ( = ?auto_18919 ?auto_18928 ) ) ( not ( = ?auto_18920 ?auto_18924 ) ) ( not ( = ?auto_18920 ?auto_18928 ) ) ( not ( = ?auto_18921 ?auto_18924 ) ) ( not ( = ?auto_18921 ?auto_18928 ) ) ( not ( = ?auto_18922 ?auto_18924 ) ) ( not ( = ?auto_18922 ?auto_18928 ) ) ( not ( = ?auto_18924 ?auto_18935 ) ) ( not ( = ?auto_18924 ?auto_18944 ) ) ( not ( = ?auto_18924 ?auto_18945 ) ) ( not ( = ?auto_18924 ?auto_18943 ) ) ( not ( = ?auto_18924 ?auto_18939 ) ) ( not ( = ?auto_18924 ?auto_18949 ) ) ( not ( = ?auto_18924 ?auto_18937 ) ) ( not ( = ?auto_18924 ?auto_18946 ) ) ( not ( = ?auto_18928 ?auto_18935 ) ) ( not ( = ?auto_18928 ?auto_18944 ) ) ( not ( = ?auto_18928 ?auto_18945 ) ) ( not ( = ?auto_18928 ?auto_18943 ) ) ( not ( = ?auto_18928 ?auto_18939 ) ) ( not ( = ?auto_18928 ?auto_18949 ) ) ( not ( = ?auto_18928 ?auto_18937 ) ) ( not ( = ?auto_18928 ?auto_18946 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_18915 ?auto_18916 ?auto_18917 ?auto_18918 ?auto_18919 ?auto_18920 ?auto_18921 ?auto_18922 ?auto_18923 )
      ( MAKE-1CRATE ?auto_18923 ?auto_18924 )
      ( MAKE-9CRATE-VERIFY ?auto_18915 ?auto_18916 ?auto_18917 ?auto_18918 ?auto_18919 ?auto_18920 ?auto_18921 ?auto_18922 ?auto_18923 ?auto_18924 ) )
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
      ?auto_18979 - SURFACE
      ?auto_18980 - SURFACE
      ?auto_18981 - SURFACE
      ?auto_18982 - SURFACE
    )
    :vars
    (
      ?auto_18984 - HOIST
      ?auto_18983 - PLACE
      ?auto_18987 - PLACE
      ?auto_18985 - HOIST
      ?auto_18986 - SURFACE
      ?auto_18998 - PLACE
      ?auto_19001 - HOIST
      ?auto_18994 - SURFACE
      ?auto_19008 - PLACE
      ?auto_19006 - HOIST
      ?auto_18993 - SURFACE
      ?auto_18992 - PLACE
      ?auto_19003 - HOIST
      ?auto_19007 - SURFACE
      ?auto_19005 - PLACE
      ?auto_19000 - HOIST
      ?auto_19004 - SURFACE
      ?auto_18997 - SURFACE
      ?auto_18989 - PLACE
      ?auto_18996 - HOIST
      ?auto_18999 - SURFACE
      ?auto_19002 - SURFACE
      ?auto_18990 - PLACE
      ?auto_18995 - HOIST
      ?auto_18991 - SURFACE
      ?auto_19009 - SURFACE
      ?auto_18988 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18984 ?auto_18983 ) ( IS-CRATE ?auto_18982 ) ( not ( = ?auto_18987 ?auto_18983 ) ) ( HOIST-AT ?auto_18985 ?auto_18987 ) ( SURFACE-AT ?auto_18982 ?auto_18987 ) ( ON ?auto_18982 ?auto_18986 ) ( CLEAR ?auto_18982 ) ( not ( = ?auto_18981 ?auto_18982 ) ) ( not ( = ?auto_18981 ?auto_18986 ) ) ( not ( = ?auto_18982 ?auto_18986 ) ) ( not ( = ?auto_18984 ?auto_18985 ) ) ( IS-CRATE ?auto_18981 ) ( not ( = ?auto_18998 ?auto_18983 ) ) ( HOIST-AT ?auto_19001 ?auto_18998 ) ( SURFACE-AT ?auto_18981 ?auto_18998 ) ( ON ?auto_18981 ?auto_18994 ) ( CLEAR ?auto_18981 ) ( not ( = ?auto_18980 ?auto_18981 ) ) ( not ( = ?auto_18980 ?auto_18994 ) ) ( not ( = ?auto_18981 ?auto_18994 ) ) ( not ( = ?auto_18984 ?auto_19001 ) ) ( IS-CRATE ?auto_18980 ) ( not ( = ?auto_19008 ?auto_18983 ) ) ( HOIST-AT ?auto_19006 ?auto_19008 ) ( AVAILABLE ?auto_19006 ) ( SURFACE-AT ?auto_18980 ?auto_19008 ) ( ON ?auto_18980 ?auto_18993 ) ( CLEAR ?auto_18980 ) ( not ( = ?auto_18979 ?auto_18980 ) ) ( not ( = ?auto_18979 ?auto_18993 ) ) ( not ( = ?auto_18980 ?auto_18993 ) ) ( not ( = ?auto_18984 ?auto_19006 ) ) ( IS-CRATE ?auto_18979 ) ( not ( = ?auto_18992 ?auto_18983 ) ) ( HOIST-AT ?auto_19003 ?auto_18992 ) ( AVAILABLE ?auto_19003 ) ( SURFACE-AT ?auto_18979 ?auto_18992 ) ( ON ?auto_18979 ?auto_19007 ) ( CLEAR ?auto_18979 ) ( not ( = ?auto_18978 ?auto_18979 ) ) ( not ( = ?auto_18978 ?auto_19007 ) ) ( not ( = ?auto_18979 ?auto_19007 ) ) ( not ( = ?auto_18984 ?auto_19003 ) ) ( IS-CRATE ?auto_18978 ) ( not ( = ?auto_19005 ?auto_18983 ) ) ( HOIST-AT ?auto_19000 ?auto_19005 ) ( AVAILABLE ?auto_19000 ) ( SURFACE-AT ?auto_18978 ?auto_19005 ) ( ON ?auto_18978 ?auto_19004 ) ( CLEAR ?auto_18978 ) ( not ( = ?auto_18977 ?auto_18978 ) ) ( not ( = ?auto_18977 ?auto_19004 ) ) ( not ( = ?auto_18978 ?auto_19004 ) ) ( not ( = ?auto_18984 ?auto_19000 ) ) ( IS-CRATE ?auto_18977 ) ( AVAILABLE ?auto_18985 ) ( SURFACE-AT ?auto_18977 ?auto_18987 ) ( ON ?auto_18977 ?auto_18997 ) ( CLEAR ?auto_18977 ) ( not ( = ?auto_18976 ?auto_18977 ) ) ( not ( = ?auto_18976 ?auto_18997 ) ) ( not ( = ?auto_18977 ?auto_18997 ) ) ( IS-CRATE ?auto_18976 ) ( not ( = ?auto_18989 ?auto_18983 ) ) ( HOIST-AT ?auto_18996 ?auto_18989 ) ( SURFACE-AT ?auto_18976 ?auto_18989 ) ( ON ?auto_18976 ?auto_18999 ) ( CLEAR ?auto_18976 ) ( not ( = ?auto_18975 ?auto_18976 ) ) ( not ( = ?auto_18975 ?auto_18999 ) ) ( not ( = ?auto_18976 ?auto_18999 ) ) ( not ( = ?auto_18984 ?auto_18996 ) ) ( IS-CRATE ?auto_18975 ) ( AVAILABLE ?auto_19001 ) ( SURFACE-AT ?auto_18975 ?auto_18998 ) ( ON ?auto_18975 ?auto_19002 ) ( CLEAR ?auto_18975 ) ( not ( = ?auto_18974 ?auto_18975 ) ) ( not ( = ?auto_18974 ?auto_19002 ) ) ( not ( = ?auto_18975 ?auto_19002 ) ) ( IS-CRATE ?auto_18974 ) ( not ( = ?auto_18990 ?auto_18983 ) ) ( HOIST-AT ?auto_18995 ?auto_18990 ) ( AVAILABLE ?auto_18995 ) ( SURFACE-AT ?auto_18974 ?auto_18990 ) ( ON ?auto_18974 ?auto_18991 ) ( CLEAR ?auto_18974 ) ( not ( = ?auto_18973 ?auto_18974 ) ) ( not ( = ?auto_18973 ?auto_18991 ) ) ( not ( = ?auto_18974 ?auto_18991 ) ) ( not ( = ?auto_18984 ?auto_18995 ) ) ( SURFACE-AT ?auto_18972 ?auto_18983 ) ( CLEAR ?auto_18972 ) ( IS-CRATE ?auto_18973 ) ( AVAILABLE ?auto_18984 ) ( AVAILABLE ?auto_18996 ) ( SURFACE-AT ?auto_18973 ?auto_18989 ) ( ON ?auto_18973 ?auto_19009 ) ( CLEAR ?auto_18973 ) ( TRUCK-AT ?auto_18988 ?auto_18983 ) ( not ( = ?auto_18972 ?auto_18973 ) ) ( not ( = ?auto_18972 ?auto_19009 ) ) ( not ( = ?auto_18973 ?auto_19009 ) ) ( not ( = ?auto_18972 ?auto_18974 ) ) ( not ( = ?auto_18972 ?auto_18991 ) ) ( not ( = ?auto_18974 ?auto_19009 ) ) ( not ( = ?auto_18990 ?auto_18989 ) ) ( not ( = ?auto_18995 ?auto_18996 ) ) ( not ( = ?auto_18991 ?auto_19009 ) ) ( not ( = ?auto_18972 ?auto_18975 ) ) ( not ( = ?auto_18972 ?auto_19002 ) ) ( not ( = ?auto_18973 ?auto_18975 ) ) ( not ( = ?auto_18973 ?auto_19002 ) ) ( not ( = ?auto_18975 ?auto_18991 ) ) ( not ( = ?auto_18975 ?auto_19009 ) ) ( not ( = ?auto_18998 ?auto_18990 ) ) ( not ( = ?auto_18998 ?auto_18989 ) ) ( not ( = ?auto_19001 ?auto_18995 ) ) ( not ( = ?auto_19001 ?auto_18996 ) ) ( not ( = ?auto_19002 ?auto_18991 ) ) ( not ( = ?auto_19002 ?auto_19009 ) ) ( not ( = ?auto_18972 ?auto_18976 ) ) ( not ( = ?auto_18972 ?auto_18999 ) ) ( not ( = ?auto_18973 ?auto_18976 ) ) ( not ( = ?auto_18973 ?auto_18999 ) ) ( not ( = ?auto_18974 ?auto_18976 ) ) ( not ( = ?auto_18974 ?auto_18999 ) ) ( not ( = ?auto_18976 ?auto_19002 ) ) ( not ( = ?auto_18976 ?auto_18991 ) ) ( not ( = ?auto_18976 ?auto_19009 ) ) ( not ( = ?auto_18999 ?auto_19002 ) ) ( not ( = ?auto_18999 ?auto_18991 ) ) ( not ( = ?auto_18999 ?auto_19009 ) ) ( not ( = ?auto_18972 ?auto_18977 ) ) ( not ( = ?auto_18972 ?auto_18997 ) ) ( not ( = ?auto_18973 ?auto_18977 ) ) ( not ( = ?auto_18973 ?auto_18997 ) ) ( not ( = ?auto_18974 ?auto_18977 ) ) ( not ( = ?auto_18974 ?auto_18997 ) ) ( not ( = ?auto_18975 ?auto_18977 ) ) ( not ( = ?auto_18975 ?auto_18997 ) ) ( not ( = ?auto_18977 ?auto_18999 ) ) ( not ( = ?auto_18977 ?auto_19002 ) ) ( not ( = ?auto_18977 ?auto_18991 ) ) ( not ( = ?auto_18977 ?auto_19009 ) ) ( not ( = ?auto_18987 ?auto_18989 ) ) ( not ( = ?auto_18987 ?auto_18998 ) ) ( not ( = ?auto_18987 ?auto_18990 ) ) ( not ( = ?auto_18985 ?auto_18996 ) ) ( not ( = ?auto_18985 ?auto_19001 ) ) ( not ( = ?auto_18985 ?auto_18995 ) ) ( not ( = ?auto_18997 ?auto_18999 ) ) ( not ( = ?auto_18997 ?auto_19002 ) ) ( not ( = ?auto_18997 ?auto_18991 ) ) ( not ( = ?auto_18997 ?auto_19009 ) ) ( not ( = ?auto_18972 ?auto_18978 ) ) ( not ( = ?auto_18972 ?auto_19004 ) ) ( not ( = ?auto_18973 ?auto_18978 ) ) ( not ( = ?auto_18973 ?auto_19004 ) ) ( not ( = ?auto_18974 ?auto_18978 ) ) ( not ( = ?auto_18974 ?auto_19004 ) ) ( not ( = ?auto_18975 ?auto_18978 ) ) ( not ( = ?auto_18975 ?auto_19004 ) ) ( not ( = ?auto_18976 ?auto_18978 ) ) ( not ( = ?auto_18976 ?auto_19004 ) ) ( not ( = ?auto_18978 ?auto_18997 ) ) ( not ( = ?auto_18978 ?auto_18999 ) ) ( not ( = ?auto_18978 ?auto_19002 ) ) ( not ( = ?auto_18978 ?auto_18991 ) ) ( not ( = ?auto_18978 ?auto_19009 ) ) ( not ( = ?auto_19005 ?auto_18987 ) ) ( not ( = ?auto_19005 ?auto_18989 ) ) ( not ( = ?auto_19005 ?auto_18998 ) ) ( not ( = ?auto_19005 ?auto_18990 ) ) ( not ( = ?auto_19000 ?auto_18985 ) ) ( not ( = ?auto_19000 ?auto_18996 ) ) ( not ( = ?auto_19000 ?auto_19001 ) ) ( not ( = ?auto_19000 ?auto_18995 ) ) ( not ( = ?auto_19004 ?auto_18997 ) ) ( not ( = ?auto_19004 ?auto_18999 ) ) ( not ( = ?auto_19004 ?auto_19002 ) ) ( not ( = ?auto_19004 ?auto_18991 ) ) ( not ( = ?auto_19004 ?auto_19009 ) ) ( not ( = ?auto_18972 ?auto_18979 ) ) ( not ( = ?auto_18972 ?auto_19007 ) ) ( not ( = ?auto_18973 ?auto_18979 ) ) ( not ( = ?auto_18973 ?auto_19007 ) ) ( not ( = ?auto_18974 ?auto_18979 ) ) ( not ( = ?auto_18974 ?auto_19007 ) ) ( not ( = ?auto_18975 ?auto_18979 ) ) ( not ( = ?auto_18975 ?auto_19007 ) ) ( not ( = ?auto_18976 ?auto_18979 ) ) ( not ( = ?auto_18976 ?auto_19007 ) ) ( not ( = ?auto_18977 ?auto_18979 ) ) ( not ( = ?auto_18977 ?auto_19007 ) ) ( not ( = ?auto_18979 ?auto_19004 ) ) ( not ( = ?auto_18979 ?auto_18997 ) ) ( not ( = ?auto_18979 ?auto_18999 ) ) ( not ( = ?auto_18979 ?auto_19002 ) ) ( not ( = ?auto_18979 ?auto_18991 ) ) ( not ( = ?auto_18979 ?auto_19009 ) ) ( not ( = ?auto_18992 ?auto_19005 ) ) ( not ( = ?auto_18992 ?auto_18987 ) ) ( not ( = ?auto_18992 ?auto_18989 ) ) ( not ( = ?auto_18992 ?auto_18998 ) ) ( not ( = ?auto_18992 ?auto_18990 ) ) ( not ( = ?auto_19003 ?auto_19000 ) ) ( not ( = ?auto_19003 ?auto_18985 ) ) ( not ( = ?auto_19003 ?auto_18996 ) ) ( not ( = ?auto_19003 ?auto_19001 ) ) ( not ( = ?auto_19003 ?auto_18995 ) ) ( not ( = ?auto_19007 ?auto_19004 ) ) ( not ( = ?auto_19007 ?auto_18997 ) ) ( not ( = ?auto_19007 ?auto_18999 ) ) ( not ( = ?auto_19007 ?auto_19002 ) ) ( not ( = ?auto_19007 ?auto_18991 ) ) ( not ( = ?auto_19007 ?auto_19009 ) ) ( not ( = ?auto_18972 ?auto_18980 ) ) ( not ( = ?auto_18972 ?auto_18993 ) ) ( not ( = ?auto_18973 ?auto_18980 ) ) ( not ( = ?auto_18973 ?auto_18993 ) ) ( not ( = ?auto_18974 ?auto_18980 ) ) ( not ( = ?auto_18974 ?auto_18993 ) ) ( not ( = ?auto_18975 ?auto_18980 ) ) ( not ( = ?auto_18975 ?auto_18993 ) ) ( not ( = ?auto_18976 ?auto_18980 ) ) ( not ( = ?auto_18976 ?auto_18993 ) ) ( not ( = ?auto_18977 ?auto_18980 ) ) ( not ( = ?auto_18977 ?auto_18993 ) ) ( not ( = ?auto_18978 ?auto_18980 ) ) ( not ( = ?auto_18978 ?auto_18993 ) ) ( not ( = ?auto_18980 ?auto_19007 ) ) ( not ( = ?auto_18980 ?auto_19004 ) ) ( not ( = ?auto_18980 ?auto_18997 ) ) ( not ( = ?auto_18980 ?auto_18999 ) ) ( not ( = ?auto_18980 ?auto_19002 ) ) ( not ( = ?auto_18980 ?auto_18991 ) ) ( not ( = ?auto_18980 ?auto_19009 ) ) ( not ( = ?auto_19008 ?auto_18992 ) ) ( not ( = ?auto_19008 ?auto_19005 ) ) ( not ( = ?auto_19008 ?auto_18987 ) ) ( not ( = ?auto_19008 ?auto_18989 ) ) ( not ( = ?auto_19008 ?auto_18998 ) ) ( not ( = ?auto_19008 ?auto_18990 ) ) ( not ( = ?auto_19006 ?auto_19003 ) ) ( not ( = ?auto_19006 ?auto_19000 ) ) ( not ( = ?auto_19006 ?auto_18985 ) ) ( not ( = ?auto_19006 ?auto_18996 ) ) ( not ( = ?auto_19006 ?auto_19001 ) ) ( not ( = ?auto_19006 ?auto_18995 ) ) ( not ( = ?auto_18993 ?auto_19007 ) ) ( not ( = ?auto_18993 ?auto_19004 ) ) ( not ( = ?auto_18993 ?auto_18997 ) ) ( not ( = ?auto_18993 ?auto_18999 ) ) ( not ( = ?auto_18993 ?auto_19002 ) ) ( not ( = ?auto_18993 ?auto_18991 ) ) ( not ( = ?auto_18993 ?auto_19009 ) ) ( not ( = ?auto_18972 ?auto_18981 ) ) ( not ( = ?auto_18972 ?auto_18994 ) ) ( not ( = ?auto_18973 ?auto_18981 ) ) ( not ( = ?auto_18973 ?auto_18994 ) ) ( not ( = ?auto_18974 ?auto_18981 ) ) ( not ( = ?auto_18974 ?auto_18994 ) ) ( not ( = ?auto_18975 ?auto_18981 ) ) ( not ( = ?auto_18975 ?auto_18994 ) ) ( not ( = ?auto_18976 ?auto_18981 ) ) ( not ( = ?auto_18976 ?auto_18994 ) ) ( not ( = ?auto_18977 ?auto_18981 ) ) ( not ( = ?auto_18977 ?auto_18994 ) ) ( not ( = ?auto_18978 ?auto_18981 ) ) ( not ( = ?auto_18978 ?auto_18994 ) ) ( not ( = ?auto_18979 ?auto_18981 ) ) ( not ( = ?auto_18979 ?auto_18994 ) ) ( not ( = ?auto_18981 ?auto_18993 ) ) ( not ( = ?auto_18981 ?auto_19007 ) ) ( not ( = ?auto_18981 ?auto_19004 ) ) ( not ( = ?auto_18981 ?auto_18997 ) ) ( not ( = ?auto_18981 ?auto_18999 ) ) ( not ( = ?auto_18981 ?auto_19002 ) ) ( not ( = ?auto_18981 ?auto_18991 ) ) ( not ( = ?auto_18981 ?auto_19009 ) ) ( not ( = ?auto_18994 ?auto_18993 ) ) ( not ( = ?auto_18994 ?auto_19007 ) ) ( not ( = ?auto_18994 ?auto_19004 ) ) ( not ( = ?auto_18994 ?auto_18997 ) ) ( not ( = ?auto_18994 ?auto_18999 ) ) ( not ( = ?auto_18994 ?auto_19002 ) ) ( not ( = ?auto_18994 ?auto_18991 ) ) ( not ( = ?auto_18994 ?auto_19009 ) ) ( not ( = ?auto_18972 ?auto_18982 ) ) ( not ( = ?auto_18972 ?auto_18986 ) ) ( not ( = ?auto_18973 ?auto_18982 ) ) ( not ( = ?auto_18973 ?auto_18986 ) ) ( not ( = ?auto_18974 ?auto_18982 ) ) ( not ( = ?auto_18974 ?auto_18986 ) ) ( not ( = ?auto_18975 ?auto_18982 ) ) ( not ( = ?auto_18975 ?auto_18986 ) ) ( not ( = ?auto_18976 ?auto_18982 ) ) ( not ( = ?auto_18976 ?auto_18986 ) ) ( not ( = ?auto_18977 ?auto_18982 ) ) ( not ( = ?auto_18977 ?auto_18986 ) ) ( not ( = ?auto_18978 ?auto_18982 ) ) ( not ( = ?auto_18978 ?auto_18986 ) ) ( not ( = ?auto_18979 ?auto_18982 ) ) ( not ( = ?auto_18979 ?auto_18986 ) ) ( not ( = ?auto_18980 ?auto_18982 ) ) ( not ( = ?auto_18980 ?auto_18986 ) ) ( not ( = ?auto_18982 ?auto_18994 ) ) ( not ( = ?auto_18982 ?auto_18993 ) ) ( not ( = ?auto_18982 ?auto_19007 ) ) ( not ( = ?auto_18982 ?auto_19004 ) ) ( not ( = ?auto_18982 ?auto_18997 ) ) ( not ( = ?auto_18982 ?auto_18999 ) ) ( not ( = ?auto_18982 ?auto_19002 ) ) ( not ( = ?auto_18982 ?auto_18991 ) ) ( not ( = ?auto_18982 ?auto_19009 ) ) ( not ( = ?auto_18986 ?auto_18994 ) ) ( not ( = ?auto_18986 ?auto_18993 ) ) ( not ( = ?auto_18986 ?auto_19007 ) ) ( not ( = ?auto_18986 ?auto_19004 ) ) ( not ( = ?auto_18986 ?auto_18997 ) ) ( not ( = ?auto_18986 ?auto_18999 ) ) ( not ( = ?auto_18986 ?auto_19002 ) ) ( not ( = ?auto_18986 ?auto_18991 ) ) ( not ( = ?auto_18986 ?auto_19009 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_18972 ?auto_18973 ?auto_18974 ?auto_18975 ?auto_18976 ?auto_18977 ?auto_18978 ?auto_18979 ?auto_18980 ?auto_18981 )
      ( MAKE-1CRATE ?auto_18981 ?auto_18982 )
      ( MAKE-10CRATE-VERIFY ?auto_18972 ?auto_18973 ?auto_18974 ?auto_18975 ?auto_18976 ?auto_18977 ?auto_18978 ?auto_18979 ?auto_18980 ?auto_18981 ?auto_18982 ) )
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
      ?auto_19039 - SURFACE
      ?auto_19040 - SURFACE
      ?auto_19041 - SURFACE
      ?auto_19042 - SURFACE
      ?auto_19043 - SURFACE
    )
    :vars
    (
      ?auto_19044 - HOIST
      ?auto_19045 - PLACE
      ?auto_19049 - PLACE
      ?auto_19048 - HOIST
      ?auto_19046 - SURFACE
      ?auto_19068 - PLACE
      ?auto_19073 - HOIST
      ?auto_19069 - SURFACE
      ?auto_19054 - PLACE
      ?auto_19057 - HOIST
      ?auto_19066 - SURFACE
      ?auto_19061 - PLACE
      ?auto_19056 - HOIST
      ?auto_19055 - SURFACE
      ?auto_19052 - PLACE
      ?auto_19050 - HOIST
      ?auto_19071 - SURFACE
      ?auto_19051 - PLACE
      ?auto_19053 - HOIST
      ?auto_19063 - SURFACE
      ?auto_19062 - SURFACE
      ?auto_19067 - PLACE
      ?auto_19065 - HOIST
      ?auto_19059 - SURFACE
      ?auto_19058 - SURFACE
      ?auto_19070 - PLACE
      ?auto_19064 - HOIST
      ?auto_19072 - SURFACE
      ?auto_19060 - SURFACE
      ?auto_19047 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19044 ?auto_19045 ) ( IS-CRATE ?auto_19043 ) ( not ( = ?auto_19049 ?auto_19045 ) ) ( HOIST-AT ?auto_19048 ?auto_19049 ) ( AVAILABLE ?auto_19048 ) ( SURFACE-AT ?auto_19043 ?auto_19049 ) ( ON ?auto_19043 ?auto_19046 ) ( CLEAR ?auto_19043 ) ( not ( = ?auto_19042 ?auto_19043 ) ) ( not ( = ?auto_19042 ?auto_19046 ) ) ( not ( = ?auto_19043 ?auto_19046 ) ) ( not ( = ?auto_19044 ?auto_19048 ) ) ( IS-CRATE ?auto_19042 ) ( not ( = ?auto_19068 ?auto_19045 ) ) ( HOIST-AT ?auto_19073 ?auto_19068 ) ( SURFACE-AT ?auto_19042 ?auto_19068 ) ( ON ?auto_19042 ?auto_19069 ) ( CLEAR ?auto_19042 ) ( not ( = ?auto_19041 ?auto_19042 ) ) ( not ( = ?auto_19041 ?auto_19069 ) ) ( not ( = ?auto_19042 ?auto_19069 ) ) ( not ( = ?auto_19044 ?auto_19073 ) ) ( IS-CRATE ?auto_19041 ) ( not ( = ?auto_19054 ?auto_19045 ) ) ( HOIST-AT ?auto_19057 ?auto_19054 ) ( SURFACE-AT ?auto_19041 ?auto_19054 ) ( ON ?auto_19041 ?auto_19066 ) ( CLEAR ?auto_19041 ) ( not ( = ?auto_19040 ?auto_19041 ) ) ( not ( = ?auto_19040 ?auto_19066 ) ) ( not ( = ?auto_19041 ?auto_19066 ) ) ( not ( = ?auto_19044 ?auto_19057 ) ) ( IS-CRATE ?auto_19040 ) ( not ( = ?auto_19061 ?auto_19045 ) ) ( HOIST-AT ?auto_19056 ?auto_19061 ) ( AVAILABLE ?auto_19056 ) ( SURFACE-AT ?auto_19040 ?auto_19061 ) ( ON ?auto_19040 ?auto_19055 ) ( CLEAR ?auto_19040 ) ( not ( = ?auto_19039 ?auto_19040 ) ) ( not ( = ?auto_19039 ?auto_19055 ) ) ( not ( = ?auto_19040 ?auto_19055 ) ) ( not ( = ?auto_19044 ?auto_19056 ) ) ( IS-CRATE ?auto_19039 ) ( not ( = ?auto_19052 ?auto_19045 ) ) ( HOIST-AT ?auto_19050 ?auto_19052 ) ( AVAILABLE ?auto_19050 ) ( SURFACE-AT ?auto_19039 ?auto_19052 ) ( ON ?auto_19039 ?auto_19071 ) ( CLEAR ?auto_19039 ) ( not ( = ?auto_19038 ?auto_19039 ) ) ( not ( = ?auto_19038 ?auto_19071 ) ) ( not ( = ?auto_19039 ?auto_19071 ) ) ( not ( = ?auto_19044 ?auto_19050 ) ) ( IS-CRATE ?auto_19038 ) ( not ( = ?auto_19051 ?auto_19045 ) ) ( HOIST-AT ?auto_19053 ?auto_19051 ) ( AVAILABLE ?auto_19053 ) ( SURFACE-AT ?auto_19038 ?auto_19051 ) ( ON ?auto_19038 ?auto_19063 ) ( CLEAR ?auto_19038 ) ( not ( = ?auto_19037 ?auto_19038 ) ) ( not ( = ?auto_19037 ?auto_19063 ) ) ( not ( = ?auto_19038 ?auto_19063 ) ) ( not ( = ?auto_19044 ?auto_19053 ) ) ( IS-CRATE ?auto_19037 ) ( AVAILABLE ?auto_19073 ) ( SURFACE-AT ?auto_19037 ?auto_19068 ) ( ON ?auto_19037 ?auto_19062 ) ( CLEAR ?auto_19037 ) ( not ( = ?auto_19036 ?auto_19037 ) ) ( not ( = ?auto_19036 ?auto_19062 ) ) ( not ( = ?auto_19037 ?auto_19062 ) ) ( IS-CRATE ?auto_19036 ) ( not ( = ?auto_19067 ?auto_19045 ) ) ( HOIST-AT ?auto_19065 ?auto_19067 ) ( SURFACE-AT ?auto_19036 ?auto_19067 ) ( ON ?auto_19036 ?auto_19059 ) ( CLEAR ?auto_19036 ) ( not ( = ?auto_19035 ?auto_19036 ) ) ( not ( = ?auto_19035 ?auto_19059 ) ) ( not ( = ?auto_19036 ?auto_19059 ) ) ( not ( = ?auto_19044 ?auto_19065 ) ) ( IS-CRATE ?auto_19035 ) ( AVAILABLE ?auto_19057 ) ( SURFACE-AT ?auto_19035 ?auto_19054 ) ( ON ?auto_19035 ?auto_19058 ) ( CLEAR ?auto_19035 ) ( not ( = ?auto_19034 ?auto_19035 ) ) ( not ( = ?auto_19034 ?auto_19058 ) ) ( not ( = ?auto_19035 ?auto_19058 ) ) ( IS-CRATE ?auto_19034 ) ( not ( = ?auto_19070 ?auto_19045 ) ) ( HOIST-AT ?auto_19064 ?auto_19070 ) ( AVAILABLE ?auto_19064 ) ( SURFACE-AT ?auto_19034 ?auto_19070 ) ( ON ?auto_19034 ?auto_19072 ) ( CLEAR ?auto_19034 ) ( not ( = ?auto_19033 ?auto_19034 ) ) ( not ( = ?auto_19033 ?auto_19072 ) ) ( not ( = ?auto_19034 ?auto_19072 ) ) ( not ( = ?auto_19044 ?auto_19064 ) ) ( SURFACE-AT ?auto_19032 ?auto_19045 ) ( CLEAR ?auto_19032 ) ( IS-CRATE ?auto_19033 ) ( AVAILABLE ?auto_19044 ) ( AVAILABLE ?auto_19065 ) ( SURFACE-AT ?auto_19033 ?auto_19067 ) ( ON ?auto_19033 ?auto_19060 ) ( CLEAR ?auto_19033 ) ( TRUCK-AT ?auto_19047 ?auto_19045 ) ( not ( = ?auto_19032 ?auto_19033 ) ) ( not ( = ?auto_19032 ?auto_19060 ) ) ( not ( = ?auto_19033 ?auto_19060 ) ) ( not ( = ?auto_19032 ?auto_19034 ) ) ( not ( = ?auto_19032 ?auto_19072 ) ) ( not ( = ?auto_19034 ?auto_19060 ) ) ( not ( = ?auto_19070 ?auto_19067 ) ) ( not ( = ?auto_19064 ?auto_19065 ) ) ( not ( = ?auto_19072 ?auto_19060 ) ) ( not ( = ?auto_19032 ?auto_19035 ) ) ( not ( = ?auto_19032 ?auto_19058 ) ) ( not ( = ?auto_19033 ?auto_19035 ) ) ( not ( = ?auto_19033 ?auto_19058 ) ) ( not ( = ?auto_19035 ?auto_19072 ) ) ( not ( = ?auto_19035 ?auto_19060 ) ) ( not ( = ?auto_19054 ?auto_19070 ) ) ( not ( = ?auto_19054 ?auto_19067 ) ) ( not ( = ?auto_19057 ?auto_19064 ) ) ( not ( = ?auto_19057 ?auto_19065 ) ) ( not ( = ?auto_19058 ?auto_19072 ) ) ( not ( = ?auto_19058 ?auto_19060 ) ) ( not ( = ?auto_19032 ?auto_19036 ) ) ( not ( = ?auto_19032 ?auto_19059 ) ) ( not ( = ?auto_19033 ?auto_19036 ) ) ( not ( = ?auto_19033 ?auto_19059 ) ) ( not ( = ?auto_19034 ?auto_19036 ) ) ( not ( = ?auto_19034 ?auto_19059 ) ) ( not ( = ?auto_19036 ?auto_19058 ) ) ( not ( = ?auto_19036 ?auto_19072 ) ) ( not ( = ?auto_19036 ?auto_19060 ) ) ( not ( = ?auto_19059 ?auto_19058 ) ) ( not ( = ?auto_19059 ?auto_19072 ) ) ( not ( = ?auto_19059 ?auto_19060 ) ) ( not ( = ?auto_19032 ?auto_19037 ) ) ( not ( = ?auto_19032 ?auto_19062 ) ) ( not ( = ?auto_19033 ?auto_19037 ) ) ( not ( = ?auto_19033 ?auto_19062 ) ) ( not ( = ?auto_19034 ?auto_19037 ) ) ( not ( = ?auto_19034 ?auto_19062 ) ) ( not ( = ?auto_19035 ?auto_19037 ) ) ( not ( = ?auto_19035 ?auto_19062 ) ) ( not ( = ?auto_19037 ?auto_19059 ) ) ( not ( = ?auto_19037 ?auto_19058 ) ) ( not ( = ?auto_19037 ?auto_19072 ) ) ( not ( = ?auto_19037 ?auto_19060 ) ) ( not ( = ?auto_19068 ?auto_19067 ) ) ( not ( = ?auto_19068 ?auto_19054 ) ) ( not ( = ?auto_19068 ?auto_19070 ) ) ( not ( = ?auto_19073 ?auto_19065 ) ) ( not ( = ?auto_19073 ?auto_19057 ) ) ( not ( = ?auto_19073 ?auto_19064 ) ) ( not ( = ?auto_19062 ?auto_19059 ) ) ( not ( = ?auto_19062 ?auto_19058 ) ) ( not ( = ?auto_19062 ?auto_19072 ) ) ( not ( = ?auto_19062 ?auto_19060 ) ) ( not ( = ?auto_19032 ?auto_19038 ) ) ( not ( = ?auto_19032 ?auto_19063 ) ) ( not ( = ?auto_19033 ?auto_19038 ) ) ( not ( = ?auto_19033 ?auto_19063 ) ) ( not ( = ?auto_19034 ?auto_19038 ) ) ( not ( = ?auto_19034 ?auto_19063 ) ) ( not ( = ?auto_19035 ?auto_19038 ) ) ( not ( = ?auto_19035 ?auto_19063 ) ) ( not ( = ?auto_19036 ?auto_19038 ) ) ( not ( = ?auto_19036 ?auto_19063 ) ) ( not ( = ?auto_19038 ?auto_19062 ) ) ( not ( = ?auto_19038 ?auto_19059 ) ) ( not ( = ?auto_19038 ?auto_19058 ) ) ( not ( = ?auto_19038 ?auto_19072 ) ) ( not ( = ?auto_19038 ?auto_19060 ) ) ( not ( = ?auto_19051 ?auto_19068 ) ) ( not ( = ?auto_19051 ?auto_19067 ) ) ( not ( = ?auto_19051 ?auto_19054 ) ) ( not ( = ?auto_19051 ?auto_19070 ) ) ( not ( = ?auto_19053 ?auto_19073 ) ) ( not ( = ?auto_19053 ?auto_19065 ) ) ( not ( = ?auto_19053 ?auto_19057 ) ) ( not ( = ?auto_19053 ?auto_19064 ) ) ( not ( = ?auto_19063 ?auto_19062 ) ) ( not ( = ?auto_19063 ?auto_19059 ) ) ( not ( = ?auto_19063 ?auto_19058 ) ) ( not ( = ?auto_19063 ?auto_19072 ) ) ( not ( = ?auto_19063 ?auto_19060 ) ) ( not ( = ?auto_19032 ?auto_19039 ) ) ( not ( = ?auto_19032 ?auto_19071 ) ) ( not ( = ?auto_19033 ?auto_19039 ) ) ( not ( = ?auto_19033 ?auto_19071 ) ) ( not ( = ?auto_19034 ?auto_19039 ) ) ( not ( = ?auto_19034 ?auto_19071 ) ) ( not ( = ?auto_19035 ?auto_19039 ) ) ( not ( = ?auto_19035 ?auto_19071 ) ) ( not ( = ?auto_19036 ?auto_19039 ) ) ( not ( = ?auto_19036 ?auto_19071 ) ) ( not ( = ?auto_19037 ?auto_19039 ) ) ( not ( = ?auto_19037 ?auto_19071 ) ) ( not ( = ?auto_19039 ?auto_19063 ) ) ( not ( = ?auto_19039 ?auto_19062 ) ) ( not ( = ?auto_19039 ?auto_19059 ) ) ( not ( = ?auto_19039 ?auto_19058 ) ) ( not ( = ?auto_19039 ?auto_19072 ) ) ( not ( = ?auto_19039 ?auto_19060 ) ) ( not ( = ?auto_19052 ?auto_19051 ) ) ( not ( = ?auto_19052 ?auto_19068 ) ) ( not ( = ?auto_19052 ?auto_19067 ) ) ( not ( = ?auto_19052 ?auto_19054 ) ) ( not ( = ?auto_19052 ?auto_19070 ) ) ( not ( = ?auto_19050 ?auto_19053 ) ) ( not ( = ?auto_19050 ?auto_19073 ) ) ( not ( = ?auto_19050 ?auto_19065 ) ) ( not ( = ?auto_19050 ?auto_19057 ) ) ( not ( = ?auto_19050 ?auto_19064 ) ) ( not ( = ?auto_19071 ?auto_19063 ) ) ( not ( = ?auto_19071 ?auto_19062 ) ) ( not ( = ?auto_19071 ?auto_19059 ) ) ( not ( = ?auto_19071 ?auto_19058 ) ) ( not ( = ?auto_19071 ?auto_19072 ) ) ( not ( = ?auto_19071 ?auto_19060 ) ) ( not ( = ?auto_19032 ?auto_19040 ) ) ( not ( = ?auto_19032 ?auto_19055 ) ) ( not ( = ?auto_19033 ?auto_19040 ) ) ( not ( = ?auto_19033 ?auto_19055 ) ) ( not ( = ?auto_19034 ?auto_19040 ) ) ( not ( = ?auto_19034 ?auto_19055 ) ) ( not ( = ?auto_19035 ?auto_19040 ) ) ( not ( = ?auto_19035 ?auto_19055 ) ) ( not ( = ?auto_19036 ?auto_19040 ) ) ( not ( = ?auto_19036 ?auto_19055 ) ) ( not ( = ?auto_19037 ?auto_19040 ) ) ( not ( = ?auto_19037 ?auto_19055 ) ) ( not ( = ?auto_19038 ?auto_19040 ) ) ( not ( = ?auto_19038 ?auto_19055 ) ) ( not ( = ?auto_19040 ?auto_19071 ) ) ( not ( = ?auto_19040 ?auto_19063 ) ) ( not ( = ?auto_19040 ?auto_19062 ) ) ( not ( = ?auto_19040 ?auto_19059 ) ) ( not ( = ?auto_19040 ?auto_19058 ) ) ( not ( = ?auto_19040 ?auto_19072 ) ) ( not ( = ?auto_19040 ?auto_19060 ) ) ( not ( = ?auto_19061 ?auto_19052 ) ) ( not ( = ?auto_19061 ?auto_19051 ) ) ( not ( = ?auto_19061 ?auto_19068 ) ) ( not ( = ?auto_19061 ?auto_19067 ) ) ( not ( = ?auto_19061 ?auto_19054 ) ) ( not ( = ?auto_19061 ?auto_19070 ) ) ( not ( = ?auto_19056 ?auto_19050 ) ) ( not ( = ?auto_19056 ?auto_19053 ) ) ( not ( = ?auto_19056 ?auto_19073 ) ) ( not ( = ?auto_19056 ?auto_19065 ) ) ( not ( = ?auto_19056 ?auto_19057 ) ) ( not ( = ?auto_19056 ?auto_19064 ) ) ( not ( = ?auto_19055 ?auto_19071 ) ) ( not ( = ?auto_19055 ?auto_19063 ) ) ( not ( = ?auto_19055 ?auto_19062 ) ) ( not ( = ?auto_19055 ?auto_19059 ) ) ( not ( = ?auto_19055 ?auto_19058 ) ) ( not ( = ?auto_19055 ?auto_19072 ) ) ( not ( = ?auto_19055 ?auto_19060 ) ) ( not ( = ?auto_19032 ?auto_19041 ) ) ( not ( = ?auto_19032 ?auto_19066 ) ) ( not ( = ?auto_19033 ?auto_19041 ) ) ( not ( = ?auto_19033 ?auto_19066 ) ) ( not ( = ?auto_19034 ?auto_19041 ) ) ( not ( = ?auto_19034 ?auto_19066 ) ) ( not ( = ?auto_19035 ?auto_19041 ) ) ( not ( = ?auto_19035 ?auto_19066 ) ) ( not ( = ?auto_19036 ?auto_19041 ) ) ( not ( = ?auto_19036 ?auto_19066 ) ) ( not ( = ?auto_19037 ?auto_19041 ) ) ( not ( = ?auto_19037 ?auto_19066 ) ) ( not ( = ?auto_19038 ?auto_19041 ) ) ( not ( = ?auto_19038 ?auto_19066 ) ) ( not ( = ?auto_19039 ?auto_19041 ) ) ( not ( = ?auto_19039 ?auto_19066 ) ) ( not ( = ?auto_19041 ?auto_19055 ) ) ( not ( = ?auto_19041 ?auto_19071 ) ) ( not ( = ?auto_19041 ?auto_19063 ) ) ( not ( = ?auto_19041 ?auto_19062 ) ) ( not ( = ?auto_19041 ?auto_19059 ) ) ( not ( = ?auto_19041 ?auto_19058 ) ) ( not ( = ?auto_19041 ?auto_19072 ) ) ( not ( = ?auto_19041 ?auto_19060 ) ) ( not ( = ?auto_19066 ?auto_19055 ) ) ( not ( = ?auto_19066 ?auto_19071 ) ) ( not ( = ?auto_19066 ?auto_19063 ) ) ( not ( = ?auto_19066 ?auto_19062 ) ) ( not ( = ?auto_19066 ?auto_19059 ) ) ( not ( = ?auto_19066 ?auto_19058 ) ) ( not ( = ?auto_19066 ?auto_19072 ) ) ( not ( = ?auto_19066 ?auto_19060 ) ) ( not ( = ?auto_19032 ?auto_19042 ) ) ( not ( = ?auto_19032 ?auto_19069 ) ) ( not ( = ?auto_19033 ?auto_19042 ) ) ( not ( = ?auto_19033 ?auto_19069 ) ) ( not ( = ?auto_19034 ?auto_19042 ) ) ( not ( = ?auto_19034 ?auto_19069 ) ) ( not ( = ?auto_19035 ?auto_19042 ) ) ( not ( = ?auto_19035 ?auto_19069 ) ) ( not ( = ?auto_19036 ?auto_19042 ) ) ( not ( = ?auto_19036 ?auto_19069 ) ) ( not ( = ?auto_19037 ?auto_19042 ) ) ( not ( = ?auto_19037 ?auto_19069 ) ) ( not ( = ?auto_19038 ?auto_19042 ) ) ( not ( = ?auto_19038 ?auto_19069 ) ) ( not ( = ?auto_19039 ?auto_19042 ) ) ( not ( = ?auto_19039 ?auto_19069 ) ) ( not ( = ?auto_19040 ?auto_19042 ) ) ( not ( = ?auto_19040 ?auto_19069 ) ) ( not ( = ?auto_19042 ?auto_19066 ) ) ( not ( = ?auto_19042 ?auto_19055 ) ) ( not ( = ?auto_19042 ?auto_19071 ) ) ( not ( = ?auto_19042 ?auto_19063 ) ) ( not ( = ?auto_19042 ?auto_19062 ) ) ( not ( = ?auto_19042 ?auto_19059 ) ) ( not ( = ?auto_19042 ?auto_19058 ) ) ( not ( = ?auto_19042 ?auto_19072 ) ) ( not ( = ?auto_19042 ?auto_19060 ) ) ( not ( = ?auto_19069 ?auto_19066 ) ) ( not ( = ?auto_19069 ?auto_19055 ) ) ( not ( = ?auto_19069 ?auto_19071 ) ) ( not ( = ?auto_19069 ?auto_19063 ) ) ( not ( = ?auto_19069 ?auto_19062 ) ) ( not ( = ?auto_19069 ?auto_19059 ) ) ( not ( = ?auto_19069 ?auto_19058 ) ) ( not ( = ?auto_19069 ?auto_19072 ) ) ( not ( = ?auto_19069 ?auto_19060 ) ) ( not ( = ?auto_19032 ?auto_19043 ) ) ( not ( = ?auto_19032 ?auto_19046 ) ) ( not ( = ?auto_19033 ?auto_19043 ) ) ( not ( = ?auto_19033 ?auto_19046 ) ) ( not ( = ?auto_19034 ?auto_19043 ) ) ( not ( = ?auto_19034 ?auto_19046 ) ) ( not ( = ?auto_19035 ?auto_19043 ) ) ( not ( = ?auto_19035 ?auto_19046 ) ) ( not ( = ?auto_19036 ?auto_19043 ) ) ( not ( = ?auto_19036 ?auto_19046 ) ) ( not ( = ?auto_19037 ?auto_19043 ) ) ( not ( = ?auto_19037 ?auto_19046 ) ) ( not ( = ?auto_19038 ?auto_19043 ) ) ( not ( = ?auto_19038 ?auto_19046 ) ) ( not ( = ?auto_19039 ?auto_19043 ) ) ( not ( = ?auto_19039 ?auto_19046 ) ) ( not ( = ?auto_19040 ?auto_19043 ) ) ( not ( = ?auto_19040 ?auto_19046 ) ) ( not ( = ?auto_19041 ?auto_19043 ) ) ( not ( = ?auto_19041 ?auto_19046 ) ) ( not ( = ?auto_19043 ?auto_19069 ) ) ( not ( = ?auto_19043 ?auto_19066 ) ) ( not ( = ?auto_19043 ?auto_19055 ) ) ( not ( = ?auto_19043 ?auto_19071 ) ) ( not ( = ?auto_19043 ?auto_19063 ) ) ( not ( = ?auto_19043 ?auto_19062 ) ) ( not ( = ?auto_19043 ?auto_19059 ) ) ( not ( = ?auto_19043 ?auto_19058 ) ) ( not ( = ?auto_19043 ?auto_19072 ) ) ( not ( = ?auto_19043 ?auto_19060 ) ) ( not ( = ?auto_19049 ?auto_19068 ) ) ( not ( = ?auto_19049 ?auto_19054 ) ) ( not ( = ?auto_19049 ?auto_19061 ) ) ( not ( = ?auto_19049 ?auto_19052 ) ) ( not ( = ?auto_19049 ?auto_19051 ) ) ( not ( = ?auto_19049 ?auto_19067 ) ) ( not ( = ?auto_19049 ?auto_19070 ) ) ( not ( = ?auto_19048 ?auto_19073 ) ) ( not ( = ?auto_19048 ?auto_19057 ) ) ( not ( = ?auto_19048 ?auto_19056 ) ) ( not ( = ?auto_19048 ?auto_19050 ) ) ( not ( = ?auto_19048 ?auto_19053 ) ) ( not ( = ?auto_19048 ?auto_19065 ) ) ( not ( = ?auto_19048 ?auto_19064 ) ) ( not ( = ?auto_19046 ?auto_19069 ) ) ( not ( = ?auto_19046 ?auto_19066 ) ) ( not ( = ?auto_19046 ?auto_19055 ) ) ( not ( = ?auto_19046 ?auto_19071 ) ) ( not ( = ?auto_19046 ?auto_19063 ) ) ( not ( = ?auto_19046 ?auto_19062 ) ) ( not ( = ?auto_19046 ?auto_19059 ) ) ( not ( = ?auto_19046 ?auto_19058 ) ) ( not ( = ?auto_19046 ?auto_19072 ) ) ( not ( = ?auto_19046 ?auto_19060 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_19032 ?auto_19033 ?auto_19034 ?auto_19035 ?auto_19036 ?auto_19037 ?auto_19038 ?auto_19039 ?auto_19040 ?auto_19041 ?auto_19042 )
      ( MAKE-1CRATE ?auto_19042 ?auto_19043 )
      ( MAKE-11CRATE-VERIFY ?auto_19032 ?auto_19033 ?auto_19034 ?auto_19035 ?auto_19036 ?auto_19037 ?auto_19038 ?auto_19039 ?auto_19040 ?auto_19041 ?auto_19042 ?auto_19043 ) )
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
      ?auto_19104 - SURFACE
      ?auto_19105 - SURFACE
      ?auto_19106 - SURFACE
      ?auto_19107 - SURFACE
      ?auto_19108 - SURFACE
      ?auto_19109 - SURFACE
    )
    :vars
    (
      ?auto_19115 - HOIST
      ?auto_19112 - PLACE
      ?auto_19114 - PLACE
      ?auto_19113 - HOIST
      ?auto_19110 - SURFACE
      ?auto_19116 - PLACE
      ?auto_19130 - HOIST
      ?auto_19117 - SURFACE
      ?auto_19136 - PLACE
      ?auto_19141 - HOIST
      ?auto_19129 - SURFACE
      ?auto_19132 - PLACE
      ?auto_19119 - HOIST
      ?auto_19126 - SURFACE
      ?auto_19142 - PLACE
      ?auto_19128 - HOIST
      ?auto_19137 - SURFACE
      ?auto_19139 - PLACE
      ?auto_19125 - HOIST
      ?auto_19135 - SURFACE
      ?auto_19131 - PLACE
      ?auto_19124 - HOIST
      ?auto_19133 - SURFACE
      ?auto_19120 - SURFACE
      ?auto_19127 - PLACE
      ?auto_19140 - HOIST
      ?auto_19118 - SURFACE
      ?auto_19138 - SURFACE
      ?auto_19123 - PLACE
      ?auto_19134 - HOIST
      ?auto_19121 - SURFACE
      ?auto_19122 - SURFACE
      ?auto_19111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19115 ?auto_19112 ) ( IS-CRATE ?auto_19109 ) ( not ( = ?auto_19114 ?auto_19112 ) ) ( HOIST-AT ?auto_19113 ?auto_19114 ) ( AVAILABLE ?auto_19113 ) ( SURFACE-AT ?auto_19109 ?auto_19114 ) ( ON ?auto_19109 ?auto_19110 ) ( CLEAR ?auto_19109 ) ( not ( = ?auto_19108 ?auto_19109 ) ) ( not ( = ?auto_19108 ?auto_19110 ) ) ( not ( = ?auto_19109 ?auto_19110 ) ) ( not ( = ?auto_19115 ?auto_19113 ) ) ( IS-CRATE ?auto_19108 ) ( not ( = ?auto_19116 ?auto_19112 ) ) ( HOIST-AT ?auto_19130 ?auto_19116 ) ( AVAILABLE ?auto_19130 ) ( SURFACE-AT ?auto_19108 ?auto_19116 ) ( ON ?auto_19108 ?auto_19117 ) ( CLEAR ?auto_19108 ) ( not ( = ?auto_19107 ?auto_19108 ) ) ( not ( = ?auto_19107 ?auto_19117 ) ) ( not ( = ?auto_19108 ?auto_19117 ) ) ( not ( = ?auto_19115 ?auto_19130 ) ) ( IS-CRATE ?auto_19107 ) ( not ( = ?auto_19136 ?auto_19112 ) ) ( HOIST-AT ?auto_19141 ?auto_19136 ) ( SURFACE-AT ?auto_19107 ?auto_19136 ) ( ON ?auto_19107 ?auto_19129 ) ( CLEAR ?auto_19107 ) ( not ( = ?auto_19106 ?auto_19107 ) ) ( not ( = ?auto_19106 ?auto_19129 ) ) ( not ( = ?auto_19107 ?auto_19129 ) ) ( not ( = ?auto_19115 ?auto_19141 ) ) ( IS-CRATE ?auto_19106 ) ( not ( = ?auto_19132 ?auto_19112 ) ) ( HOIST-AT ?auto_19119 ?auto_19132 ) ( SURFACE-AT ?auto_19106 ?auto_19132 ) ( ON ?auto_19106 ?auto_19126 ) ( CLEAR ?auto_19106 ) ( not ( = ?auto_19105 ?auto_19106 ) ) ( not ( = ?auto_19105 ?auto_19126 ) ) ( not ( = ?auto_19106 ?auto_19126 ) ) ( not ( = ?auto_19115 ?auto_19119 ) ) ( IS-CRATE ?auto_19105 ) ( not ( = ?auto_19142 ?auto_19112 ) ) ( HOIST-AT ?auto_19128 ?auto_19142 ) ( AVAILABLE ?auto_19128 ) ( SURFACE-AT ?auto_19105 ?auto_19142 ) ( ON ?auto_19105 ?auto_19137 ) ( CLEAR ?auto_19105 ) ( not ( = ?auto_19104 ?auto_19105 ) ) ( not ( = ?auto_19104 ?auto_19137 ) ) ( not ( = ?auto_19105 ?auto_19137 ) ) ( not ( = ?auto_19115 ?auto_19128 ) ) ( IS-CRATE ?auto_19104 ) ( not ( = ?auto_19139 ?auto_19112 ) ) ( HOIST-AT ?auto_19125 ?auto_19139 ) ( AVAILABLE ?auto_19125 ) ( SURFACE-AT ?auto_19104 ?auto_19139 ) ( ON ?auto_19104 ?auto_19135 ) ( CLEAR ?auto_19104 ) ( not ( = ?auto_19103 ?auto_19104 ) ) ( not ( = ?auto_19103 ?auto_19135 ) ) ( not ( = ?auto_19104 ?auto_19135 ) ) ( not ( = ?auto_19115 ?auto_19125 ) ) ( IS-CRATE ?auto_19103 ) ( not ( = ?auto_19131 ?auto_19112 ) ) ( HOIST-AT ?auto_19124 ?auto_19131 ) ( AVAILABLE ?auto_19124 ) ( SURFACE-AT ?auto_19103 ?auto_19131 ) ( ON ?auto_19103 ?auto_19133 ) ( CLEAR ?auto_19103 ) ( not ( = ?auto_19102 ?auto_19103 ) ) ( not ( = ?auto_19102 ?auto_19133 ) ) ( not ( = ?auto_19103 ?auto_19133 ) ) ( not ( = ?auto_19115 ?auto_19124 ) ) ( IS-CRATE ?auto_19102 ) ( AVAILABLE ?auto_19141 ) ( SURFACE-AT ?auto_19102 ?auto_19136 ) ( ON ?auto_19102 ?auto_19120 ) ( CLEAR ?auto_19102 ) ( not ( = ?auto_19101 ?auto_19102 ) ) ( not ( = ?auto_19101 ?auto_19120 ) ) ( not ( = ?auto_19102 ?auto_19120 ) ) ( IS-CRATE ?auto_19101 ) ( not ( = ?auto_19127 ?auto_19112 ) ) ( HOIST-AT ?auto_19140 ?auto_19127 ) ( SURFACE-AT ?auto_19101 ?auto_19127 ) ( ON ?auto_19101 ?auto_19118 ) ( CLEAR ?auto_19101 ) ( not ( = ?auto_19100 ?auto_19101 ) ) ( not ( = ?auto_19100 ?auto_19118 ) ) ( not ( = ?auto_19101 ?auto_19118 ) ) ( not ( = ?auto_19115 ?auto_19140 ) ) ( IS-CRATE ?auto_19100 ) ( AVAILABLE ?auto_19119 ) ( SURFACE-AT ?auto_19100 ?auto_19132 ) ( ON ?auto_19100 ?auto_19138 ) ( CLEAR ?auto_19100 ) ( not ( = ?auto_19099 ?auto_19100 ) ) ( not ( = ?auto_19099 ?auto_19138 ) ) ( not ( = ?auto_19100 ?auto_19138 ) ) ( IS-CRATE ?auto_19099 ) ( not ( = ?auto_19123 ?auto_19112 ) ) ( HOIST-AT ?auto_19134 ?auto_19123 ) ( AVAILABLE ?auto_19134 ) ( SURFACE-AT ?auto_19099 ?auto_19123 ) ( ON ?auto_19099 ?auto_19121 ) ( CLEAR ?auto_19099 ) ( not ( = ?auto_19098 ?auto_19099 ) ) ( not ( = ?auto_19098 ?auto_19121 ) ) ( not ( = ?auto_19099 ?auto_19121 ) ) ( not ( = ?auto_19115 ?auto_19134 ) ) ( SURFACE-AT ?auto_19097 ?auto_19112 ) ( CLEAR ?auto_19097 ) ( IS-CRATE ?auto_19098 ) ( AVAILABLE ?auto_19115 ) ( AVAILABLE ?auto_19140 ) ( SURFACE-AT ?auto_19098 ?auto_19127 ) ( ON ?auto_19098 ?auto_19122 ) ( CLEAR ?auto_19098 ) ( TRUCK-AT ?auto_19111 ?auto_19112 ) ( not ( = ?auto_19097 ?auto_19098 ) ) ( not ( = ?auto_19097 ?auto_19122 ) ) ( not ( = ?auto_19098 ?auto_19122 ) ) ( not ( = ?auto_19097 ?auto_19099 ) ) ( not ( = ?auto_19097 ?auto_19121 ) ) ( not ( = ?auto_19099 ?auto_19122 ) ) ( not ( = ?auto_19123 ?auto_19127 ) ) ( not ( = ?auto_19134 ?auto_19140 ) ) ( not ( = ?auto_19121 ?auto_19122 ) ) ( not ( = ?auto_19097 ?auto_19100 ) ) ( not ( = ?auto_19097 ?auto_19138 ) ) ( not ( = ?auto_19098 ?auto_19100 ) ) ( not ( = ?auto_19098 ?auto_19138 ) ) ( not ( = ?auto_19100 ?auto_19121 ) ) ( not ( = ?auto_19100 ?auto_19122 ) ) ( not ( = ?auto_19132 ?auto_19123 ) ) ( not ( = ?auto_19132 ?auto_19127 ) ) ( not ( = ?auto_19119 ?auto_19134 ) ) ( not ( = ?auto_19119 ?auto_19140 ) ) ( not ( = ?auto_19138 ?auto_19121 ) ) ( not ( = ?auto_19138 ?auto_19122 ) ) ( not ( = ?auto_19097 ?auto_19101 ) ) ( not ( = ?auto_19097 ?auto_19118 ) ) ( not ( = ?auto_19098 ?auto_19101 ) ) ( not ( = ?auto_19098 ?auto_19118 ) ) ( not ( = ?auto_19099 ?auto_19101 ) ) ( not ( = ?auto_19099 ?auto_19118 ) ) ( not ( = ?auto_19101 ?auto_19138 ) ) ( not ( = ?auto_19101 ?auto_19121 ) ) ( not ( = ?auto_19101 ?auto_19122 ) ) ( not ( = ?auto_19118 ?auto_19138 ) ) ( not ( = ?auto_19118 ?auto_19121 ) ) ( not ( = ?auto_19118 ?auto_19122 ) ) ( not ( = ?auto_19097 ?auto_19102 ) ) ( not ( = ?auto_19097 ?auto_19120 ) ) ( not ( = ?auto_19098 ?auto_19102 ) ) ( not ( = ?auto_19098 ?auto_19120 ) ) ( not ( = ?auto_19099 ?auto_19102 ) ) ( not ( = ?auto_19099 ?auto_19120 ) ) ( not ( = ?auto_19100 ?auto_19102 ) ) ( not ( = ?auto_19100 ?auto_19120 ) ) ( not ( = ?auto_19102 ?auto_19118 ) ) ( not ( = ?auto_19102 ?auto_19138 ) ) ( not ( = ?auto_19102 ?auto_19121 ) ) ( not ( = ?auto_19102 ?auto_19122 ) ) ( not ( = ?auto_19136 ?auto_19127 ) ) ( not ( = ?auto_19136 ?auto_19132 ) ) ( not ( = ?auto_19136 ?auto_19123 ) ) ( not ( = ?auto_19141 ?auto_19140 ) ) ( not ( = ?auto_19141 ?auto_19119 ) ) ( not ( = ?auto_19141 ?auto_19134 ) ) ( not ( = ?auto_19120 ?auto_19118 ) ) ( not ( = ?auto_19120 ?auto_19138 ) ) ( not ( = ?auto_19120 ?auto_19121 ) ) ( not ( = ?auto_19120 ?auto_19122 ) ) ( not ( = ?auto_19097 ?auto_19103 ) ) ( not ( = ?auto_19097 ?auto_19133 ) ) ( not ( = ?auto_19098 ?auto_19103 ) ) ( not ( = ?auto_19098 ?auto_19133 ) ) ( not ( = ?auto_19099 ?auto_19103 ) ) ( not ( = ?auto_19099 ?auto_19133 ) ) ( not ( = ?auto_19100 ?auto_19103 ) ) ( not ( = ?auto_19100 ?auto_19133 ) ) ( not ( = ?auto_19101 ?auto_19103 ) ) ( not ( = ?auto_19101 ?auto_19133 ) ) ( not ( = ?auto_19103 ?auto_19120 ) ) ( not ( = ?auto_19103 ?auto_19118 ) ) ( not ( = ?auto_19103 ?auto_19138 ) ) ( not ( = ?auto_19103 ?auto_19121 ) ) ( not ( = ?auto_19103 ?auto_19122 ) ) ( not ( = ?auto_19131 ?auto_19136 ) ) ( not ( = ?auto_19131 ?auto_19127 ) ) ( not ( = ?auto_19131 ?auto_19132 ) ) ( not ( = ?auto_19131 ?auto_19123 ) ) ( not ( = ?auto_19124 ?auto_19141 ) ) ( not ( = ?auto_19124 ?auto_19140 ) ) ( not ( = ?auto_19124 ?auto_19119 ) ) ( not ( = ?auto_19124 ?auto_19134 ) ) ( not ( = ?auto_19133 ?auto_19120 ) ) ( not ( = ?auto_19133 ?auto_19118 ) ) ( not ( = ?auto_19133 ?auto_19138 ) ) ( not ( = ?auto_19133 ?auto_19121 ) ) ( not ( = ?auto_19133 ?auto_19122 ) ) ( not ( = ?auto_19097 ?auto_19104 ) ) ( not ( = ?auto_19097 ?auto_19135 ) ) ( not ( = ?auto_19098 ?auto_19104 ) ) ( not ( = ?auto_19098 ?auto_19135 ) ) ( not ( = ?auto_19099 ?auto_19104 ) ) ( not ( = ?auto_19099 ?auto_19135 ) ) ( not ( = ?auto_19100 ?auto_19104 ) ) ( not ( = ?auto_19100 ?auto_19135 ) ) ( not ( = ?auto_19101 ?auto_19104 ) ) ( not ( = ?auto_19101 ?auto_19135 ) ) ( not ( = ?auto_19102 ?auto_19104 ) ) ( not ( = ?auto_19102 ?auto_19135 ) ) ( not ( = ?auto_19104 ?auto_19133 ) ) ( not ( = ?auto_19104 ?auto_19120 ) ) ( not ( = ?auto_19104 ?auto_19118 ) ) ( not ( = ?auto_19104 ?auto_19138 ) ) ( not ( = ?auto_19104 ?auto_19121 ) ) ( not ( = ?auto_19104 ?auto_19122 ) ) ( not ( = ?auto_19139 ?auto_19131 ) ) ( not ( = ?auto_19139 ?auto_19136 ) ) ( not ( = ?auto_19139 ?auto_19127 ) ) ( not ( = ?auto_19139 ?auto_19132 ) ) ( not ( = ?auto_19139 ?auto_19123 ) ) ( not ( = ?auto_19125 ?auto_19124 ) ) ( not ( = ?auto_19125 ?auto_19141 ) ) ( not ( = ?auto_19125 ?auto_19140 ) ) ( not ( = ?auto_19125 ?auto_19119 ) ) ( not ( = ?auto_19125 ?auto_19134 ) ) ( not ( = ?auto_19135 ?auto_19133 ) ) ( not ( = ?auto_19135 ?auto_19120 ) ) ( not ( = ?auto_19135 ?auto_19118 ) ) ( not ( = ?auto_19135 ?auto_19138 ) ) ( not ( = ?auto_19135 ?auto_19121 ) ) ( not ( = ?auto_19135 ?auto_19122 ) ) ( not ( = ?auto_19097 ?auto_19105 ) ) ( not ( = ?auto_19097 ?auto_19137 ) ) ( not ( = ?auto_19098 ?auto_19105 ) ) ( not ( = ?auto_19098 ?auto_19137 ) ) ( not ( = ?auto_19099 ?auto_19105 ) ) ( not ( = ?auto_19099 ?auto_19137 ) ) ( not ( = ?auto_19100 ?auto_19105 ) ) ( not ( = ?auto_19100 ?auto_19137 ) ) ( not ( = ?auto_19101 ?auto_19105 ) ) ( not ( = ?auto_19101 ?auto_19137 ) ) ( not ( = ?auto_19102 ?auto_19105 ) ) ( not ( = ?auto_19102 ?auto_19137 ) ) ( not ( = ?auto_19103 ?auto_19105 ) ) ( not ( = ?auto_19103 ?auto_19137 ) ) ( not ( = ?auto_19105 ?auto_19135 ) ) ( not ( = ?auto_19105 ?auto_19133 ) ) ( not ( = ?auto_19105 ?auto_19120 ) ) ( not ( = ?auto_19105 ?auto_19118 ) ) ( not ( = ?auto_19105 ?auto_19138 ) ) ( not ( = ?auto_19105 ?auto_19121 ) ) ( not ( = ?auto_19105 ?auto_19122 ) ) ( not ( = ?auto_19142 ?auto_19139 ) ) ( not ( = ?auto_19142 ?auto_19131 ) ) ( not ( = ?auto_19142 ?auto_19136 ) ) ( not ( = ?auto_19142 ?auto_19127 ) ) ( not ( = ?auto_19142 ?auto_19132 ) ) ( not ( = ?auto_19142 ?auto_19123 ) ) ( not ( = ?auto_19128 ?auto_19125 ) ) ( not ( = ?auto_19128 ?auto_19124 ) ) ( not ( = ?auto_19128 ?auto_19141 ) ) ( not ( = ?auto_19128 ?auto_19140 ) ) ( not ( = ?auto_19128 ?auto_19119 ) ) ( not ( = ?auto_19128 ?auto_19134 ) ) ( not ( = ?auto_19137 ?auto_19135 ) ) ( not ( = ?auto_19137 ?auto_19133 ) ) ( not ( = ?auto_19137 ?auto_19120 ) ) ( not ( = ?auto_19137 ?auto_19118 ) ) ( not ( = ?auto_19137 ?auto_19138 ) ) ( not ( = ?auto_19137 ?auto_19121 ) ) ( not ( = ?auto_19137 ?auto_19122 ) ) ( not ( = ?auto_19097 ?auto_19106 ) ) ( not ( = ?auto_19097 ?auto_19126 ) ) ( not ( = ?auto_19098 ?auto_19106 ) ) ( not ( = ?auto_19098 ?auto_19126 ) ) ( not ( = ?auto_19099 ?auto_19106 ) ) ( not ( = ?auto_19099 ?auto_19126 ) ) ( not ( = ?auto_19100 ?auto_19106 ) ) ( not ( = ?auto_19100 ?auto_19126 ) ) ( not ( = ?auto_19101 ?auto_19106 ) ) ( not ( = ?auto_19101 ?auto_19126 ) ) ( not ( = ?auto_19102 ?auto_19106 ) ) ( not ( = ?auto_19102 ?auto_19126 ) ) ( not ( = ?auto_19103 ?auto_19106 ) ) ( not ( = ?auto_19103 ?auto_19126 ) ) ( not ( = ?auto_19104 ?auto_19106 ) ) ( not ( = ?auto_19104 ?auto_19126 ) ) ( not ( = ?auto_19106 ?auto_19137 ) ) ( not ( = ?auto_19106 ?auto_19135 ) ) ( not ( = ?auto_19106 ?auto_19133 ) ) ( not ( = ?auto_19106 ?auto_19120 ) ) ( not ( = ?auto_19106 ?auto_19118 ) ) ( not ( = ?auto_19106 ?auto_19138 ) ) ( not ( = ?auto_19106 ?auto_19121 ) ) ( not ( = ?auto_19106 ?auto_19122 ) ) ( not ( = ?auto_19126 ?auto_19137 ) ) ( not ( = ?auto_19126 ?auto_19135 ) ) ( not ( = ?auto_19126 ?auto_19133 ) ) ( not ( = ?auto_19126 ?auto_19120 ) ) ( not ( = ?auto_19126 ?auto_19118 ) ) ( not ( = ?auto_19126 ?auto_19138 ) ) ( not ( = ?auto_19126 ?auto_19121 ) ) ( not ( = ?auto_19126 ?auto_19122 ) ) ( not ( = ?auto_19097 ?auto_19107 ) ) ( not ( = ?auto_19097 ?auto_19129 ) ) ( not ( = ?auto_19098 ?auto_19107 ) ) ( not ( = ?auto_19098 ?auto_19129 ) ) ( not ( = ?auto_19099 ?auto_19107 ) ) ( not ( = ?auto_19099 ?auto_19129 ) ) ( not ( = ?auto_19100 ?auto_19107 ) ) ( not ( = ?auto_19100 ?auto_19129 ) ) ( not ( = ?auto_19101 ?auto_19107 ) ) ( not ( = ?auto_19101 ?auto_19129 ) ) ( not ( = ?auto_19102 ?auto_19107 ) ) ( not ( = ?auto_19102 ?auto_19129 ) ) ( not ( = ?auto_19103 ?auto_19107 ) ) ( not ( = ?auto_19103 ?auto_19129 ) ) ( not ( = ?auto_19104 ?auto_19107 ) ) ( not ( = ?auto_19104 ?auto_19129 ) ) ( not ( = ?auto_19105 ?auto_19107 ) ) ( not ( = ?auto_19105 ?auto_19129 ) ) ( not ( = ?auto_19107 ?auto_19126 ) ) ( not ( = ?auto_19107 ?auto_19137 ) ) ( not ( = ?auto_19107 ?auto_19135 ) ) ( not ( = ?auto_19107 ?auto_19133 ) ) ( not ( = ?auto_19107 ?auto_19120 ) ) ( not ( = ?auto_19107 ?auto_19118 ) ) ( not ( = ?auto_19107 ?auto_19138 ) ) ( not ( = ?auto_19107 ?auto_19121 ) ) ( not ( = ?auto_19107 ?auto_19122 ) ) ( not ( = ?auto_19129 ?auto_19126 ) ) ( not ( = ?auto_19129 ?auto_19137 ) ) ( not ( = ?auto_19129 ?auto_19135 ) ) ( not ( = ?auto_19129 ?auto_19133 ) ) ( not ( = ?auto_19129 ?auto_19120 ) ) ( not ( = ?auto_19129 ?auto_19118 ) ) ( not ( = ?auto_19129 ?auto_19138 ) ) ( not ( = ?auto_19129 ?auto_19121 ) ) ( not ( = ?auto_19129 ?auto_19122 ) ) ( not ( = ?auto_19097 ?auto_19108 ) ) ( not ( = ?auto_19097 ?auto_19117 ) ) ( not ( = ?auto_19098 ?auto_19108 ) ) ( not ( = ?auto_19098 ?auto_19117 ) ) ( not ( = ?auto_19099 ?auto_19108 ) ) ( not ( = ?auto_19099 ?auto_19117 ) ) ( not ( = ?auto_19100 ?auto_19108 ) ) ( not ( = ?auto_19100 ?auto_19117 ) ) ( not ( = ?auto_19101 ?auto_19108 ) ) ( not ( = ?auto_19101 ?auto_19117 ) ) ( not ( = ?auto_19102 ?auto_19108 ) ) ( not ( = ?auto_19102 ?auto_19117 ) ) ( not ( = ?auto_19103 ?auto_19108 ) ) ( not ( = ?auto_19103 ?auto_19117 ) ) ( not ( = ?auto_19104 ?auto_19108 ) ) ( not ( = ?auto_19104 ?auto_19117 ) ) ( not ( = ?auto_19105 ?auto_19108 ) ) ( not ( = ?auto_19105 ?auto_19117 ) ) ( not ( = ?auto_19106 ?auto_19108 ) ) ( not ( = ?auto_19106 ?auto_19117 ) ) ( not ( = ?auto_19108 ?auto_19129 ) ) ( not ( = ?auto_19108 ?auto_19126 ) ) ( not ( = ?auto_19108 ?auto_19137 ) ) ( not ( = ?auto_19108 ?auto_19135 ) ) ( not ( = ?auto_19108 ?auto_19133 ) ) ( not ( = ?auto_19108 ?auto_19120 ) ) ( not ( = ?auto_19108 ?auto_19118 ) ) ( not ( = ?auto_19108 ?auto_19138 ) ) ( not ( = ?auto_19108 ?auto_19121 ) ) ( not ( = ?auto_19108 ?auto_19122 ) ) ( not ( = ?auto_19116 ?auto_19136 ) ) ( not ( = ?auto_19116 ?auto_19132 ) ) ( not ( = ?auto_19116 ?auto_19142 ) ) ( not ( = ?auto_19116 ?auto_19139 ) ) ( not ( = ?auto_19116 ?auto_19131 ) ) ( not ( = ?auto_19116 ?auto_19127 ) ) ( not ( = ?auto_19116 ?auto_19123 ) ) ( not ( = ?auto_19130 ?auto_19141 ) ) ( not ( = ?auto_19130 ?auto_19119 ) ) ( not ( = ?auto_19130 ?auto_19128 ) ) ( not ( = ?auto_19130 ?auto_19125 ) ) ( not ( = ?auto_19130 ?auto_19124 ) ) ( not ( = ?auto_19130 ?auto_19140 ) ) ( not ( = ?auto_19130 ?auto_19134 ) ) ( not ( = ?auto_19117 ?auto_19129 ) ) ( not ( = ?auto_19117 ?auto_19126 ) ) ( not ( = ?auto_19117 ?auto_19137 ) ) ( not ( = ?auto_19117 ?auto_19135 ) ) ( not ( = ?auto_19117 ?auto_19133 ) ) ( not ( = ?auto_19117 ?auto_19120 ) ) ( not ( = ?auto_19117 ?auto_19118 ) ) ( not ( = ?auto_19117 ?auto_19138 ) ) ( not ( = ?auto_19117 ?auto_19121 ) ) ( not ( = ?auto_19117 ?auto_19122 ) ) ( not ( = ?auto_19097 ?auto_19109 ) ) ( not ( = ?auto_19097 ?auto_19110 ) ) ( not ( = ?auto_19098 ?auto_19109 ) ) ( not ( = ?auto_19098 ?auto_19110 ) ) ( not ( = ?auto_19099 ?auto_19109 ) ) ( not ( = ?auto_19099 ?auto_19110 ) ) ( not ( = ?auto_19100 ?auto_19109 ) ) ( not ( = ?auto_19100 ?auto_19110 ) ) ( not ( = ?auto_19101 ?auto_19109 ) ) ( not ( = ?auto_19101 ?auto_19110 ) ) ( not ( = ?auto_19102 ?auto_19109 ) ) ( not ( = ?auto_19102 ?auto_19110 ) ) ( not ( = ?auto_19103 ?auto_19109 ) ) ( not ( = ?auto_19103 ?auto_19110 ) ) ( not ( = ?auto_19104 ?auto_19109 ) ) ( not ( = ?auto_19104 ?auto_19110 ) ) ( not ( = ?auto_19105 ?auto_19109 ) ) ( not ( = ?auto_19105 ?auto_19110 ) ) ( not ( = ?auto_19106 ?auto_19109 ) ) ( not ( = ?auto_19106 ?auto_19110 ) ) ( not ( = ?auto_19107 ?auto_19109 ) ) ( not ( = ?auto_19107 ?auto_19110 ) ) ( not ( = ?auto_19109 ?auto_19117 ) ) ( not ( = ?auto_19109 ?auto_19129 ) ) ( not ( = ?auto_19109 ?auto_19126 ) ) ( not ( = ?auto_19109 ?auto_19137 ) ) ( not ( = ?auto_19109 ?auto_19135 ) ) ( not ( = ?auto_19109 ?auto_19133 ) ) ( not ( = ?auto_19109 ?auto_19120 ) ) ( not ( = ?auto_19109 ?auto_19118 ) ) ( not ( = ?auto_19109 ?auto_19138 ) ) ( not ( = ?auto_19109 ?auto_19121 ) ) ( not ( = ?auto_19109 ?auto_19122 ) ) ( not ( = ?auto_19114 ?auto_19116 ) ) ( not ( = ?auto_19114 ?auto_19136 ) ) ( not ( = ?auto_19114 ?auto_19132 ) ) ( not ( = ?auto_19114 ?auto_19142 ) ) ( not ( = ?auto_19114 ?auto_19139 ) ) ( not ( = ?auto_19114 ?auto_19131 ) ) ( not ( = ?auto_19114 ?auto_19127 ) ) ( not ( = ?auto_19114 ?auto_19123 ) ) ( not ( = ?auto_19113 ?auto_19130 ) ) ( not ( = ?auto_19113 ?auto_19141 ) ) ( not ( = ?auto_19113 ?auto_19119 ) ) ( not ( = ?auto_19113 ?auto_19128 ) ) ( not ( = ?auto_19113 ?auto_19125 ) ) ( not ( = ?auto_19113 ?auto_19124 ) ) ( not ( = ?auto_19113 ?auto_19140 ) ) ( not ( = ?auto_19113 ?auto_19134 ) ) ( not ( = ?auto_19110 ?auto_19117 ) ) ( not ( = ?auto_19110 ?auto_19129 ) ) ( not ( = ?auto_19110 ?auto_19126 ) ) ( not ( = ?auto_19110 ?auto_19137 ) ) ( not ( = ?auto_19110 ?auto_19135 ) ) ( not ( = ?auto_19110 ?auto_19133 ) ) ( not ( = ?auto_19110 ?auto_19120 ) ) ( not ( = ?auto_19110 ?auto_19118 ) ) ( not ( = ?auto_19110 ?auto_19138 ) ) ( not ( = ?auto_19110 ?auto_19121 ) ) ( not ( = ?auto_19110 ?auto_19122 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_19097 ?auto_19098 ?auto_19099 ?auto_19100 ?auto_19101 ?auto_19102 ?auto_19103 ?auto_19104 ?auto_19105 ?auto_19106 ?auto_19107 ?auto_19108 )
      ( MAKE-1CRATE ?auto_19108 ?auto_19109 )
      ( MAKE-12CRATE-VERIFY ?auto_19097 ?auto_19098 ?auto_19099 ?auto_19100 ?auto_19101 ?auto_19102 ?auto_19103 ?auto_19104 ?auto_19105 ?auto_19106 ?auto_19107 ?auto_19108 ?auto_19109 ) )
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
      ?auto_19174 - SURFACE
      ?auto_19175 - SURFACE
      ?auto_19176 - SURFACE
      ?auto_19177 - SURFACE
      ?auto_19178 - SURFACE
      ?auto_19179 - SURFACE
      ?auto_19180 - SURFACE
    )
    :vars
    (
      ?auto_19183 - HOIST
      ?auto_19186 - PLACE
      ?auto_19181 - PLACE
      ?auto_19185 - HOIST
      ?auto_19184 - SURFACE
      ?auto_19207 - PLACE
      ?auto_19189 - HOIST
      ?auto_19188 - SURFACE
      ?auto_19211 - PLACE
      ?auto_19205 - HOIST
      ?auto_19210 - SURFACE
      ?auto_19208 - PLACE
      ?auto_19203 - HOIST
      ?auto_19187 - SURFACE
      ?auto_19190 - PLACE
      ?auto_19212 - HOIST
      ?auto_19214 - SURFACE
      ?auto_19191 - PLACE
      ?auto_19193 - HOIST
      ?auto_19197 - SURFACE
      ?auto_19200 - PLACE
      ?auto_19196 - HOIST
      ?auto_19206 - SURFACE
      ?auto_19202 - SURFACE
      ?auto_19192 - SURFACE
      ?auto_19209 - PLACE
      ?auto_19213 - HOIST
      ?auto_19198 - SURFACE
      ?auto_19204 - SURFACE
      ?auto_19201 - PLACE
      ?auto_19195 - HOIST
      ?auto_19199 - SURFACE
      ?auto_19194 - SURFACE
      ?auto_19182 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19183 ?auto_19186 ) ( IS-CRATE ?auto_19180 ) ( not ( = ?auto_19181 ?auto_19186 ) ) ( HOIST-AT ?auto_19185 ?auto_19181 ) ( SURFACE-AT ?auto_19180 ?auto_19181 ) ( ON ?auto_19180 ?auto_19184 ) ( CLEAR ?auto_19180 ) ( not ( = ?auto_19179 ?auto_19180 ) ) ( not ( = ?auto_19179 ?auto_19184 ) ) ( not ( = ?auto_19180 ?auto_19184 ) ) ( not ( = ?auto_19183 ?auto_19185 ) ) ( IS-CRATE ?auto_19179 ) ( not ( = ?auto_19207 ?auto_19186 ) ) ( HOIST-AT ?auto_19189 ?auto_19207 ) ( AVAILABLE ?auto_19189 ) ( SURFACE-AT ?auto_19179 ?auto_19207 ) ( ON ?auto_19179 ?auto_19188 ) ( CLEAR ?auto_19179 ) ( not ( = ?auto_19178 ?auto_19179 ) ) ( not ( = ?auto_19178 ?auto_19188 ) ) ( not ( = ?auto_19179 ?auto_19188 ) ) ( not ( = ?auto_19183 ?auto_19189 ) ) ( IS-CRATE ?auto_19178 ) ( not ( = ?auto_19211 ?auto_19186 ) ) ( HOIST-AT ?auto_19205 ?auto_19211 ) ( AVAILABLE ?auto_19205 ) ( SURFACE-AT ?auto_19178 ?auto_19211 ) ( ON ?auto_19178 ?auto_19210 ) ( CLEAR ?auto_19178 ) ( not ( = ?auto_19177 ?auto_19178 ) ) ( not ( = ?auto_19177 ?auto_19210 ) ) ( not ( = ?auto_19178 ?auto_19210 ) ) ( not ( = ?auto_19183 ?auto_19205 ) ) ( IS-CRATE ?auto_19177 ) ( not ( = ?auto_19208 ?auto_19186 ) ) ( HOIST-AT ?auto_19203 ?auto_19208 ) ( SURFACE-AT ?auto_19177 ?auto_19208 ) ( ON ?auto_19177 ?auto_19187 ) ( CLEAR ?auto_19177 ) ( not ( = ?auto_19176 ?auto_19177 ) ) ( not ( = ?auto_19176 ?auto_19187 ) ) ( not ( = ?auto_19177 ?auto_19187 ) ) ( not ( = ?auto_19183 ?auto_19203 ) ) ( IS-CRATE ?auto_19176 ) ( not ( = ?auto_19190 ?auto_19186 ) ) ( HOIST-AT ?auto_19212 ?auto_19190 ) ( SURFACE-AT ?auto_19176 ?auto_19190 ) ( ON ?auto_19176 ?auto_19214 ) ( CLEAR ?auto_19176 ) ( not ( = ?auto_19175 ?auto_19176 ) ) ( not ( = ?auto_19175 ?auto_19214 ) ) ( not ( = ?auto_19176 ?auto_19214 ) ) ( not ( = ?auto_19183 ?auto_19212 ) ) ( IS-CRATE ?auto_19175 ) ( not ( = ?auto_19191 ?auto_19186 ) ) ( HOIST-AT ?auto_19193 ?auto_19191 ) ( AVAILABLE ?auto_19193 ) ( SURFACE-AT ?auto_19175 ?auto_19191 ) ( ON ?auto_19175 ?auto_19197 ) ( CLEAR ?auto_19175 ) ( not ( = ?auto_19174 ?auto_19175 ) ) ( not ( = ?auto_19174 ?auto_19197 ) ) ( not ( = ?auto_19175 ?auto_19197 ) ) ( not ( = ?auto_19183 ?auto_19193 ) ) ( IS-CRATE ?auto_19174 ) ( not ( = ?auto_19200 ?auto_19186 ) ) ( HOIST-AT ?auto_19196 ?auto_19200 ) ( AVAILABLE ?auto_19196 ) ( SURFACE-AT ?auto_19174 ?auto_19200 ) ( ON ?auto_19174 ?auto_19206 ) ( CLEAR ?auto_19174 ) ( not ( = ?auto_19173 ?auto_19174 ) ) ( not ( = ?auto_19173 ?auto_19206 ) ) ( not ( = ?auto_19174 ?auto_19206 ) ) ( not ( = ?auto_19183 ?auto_19196 ) ) ( IS-CRATE ?auto_19173 ) ( AVAILABLE ?auto_19185 ) ( SURFACE-AT ?auto_19173 ?auto_19181 ) ( ON ?auto_19173 ?auto_19202 ) ( CLEAR ?auto_19173 ) ( not ( = ?auto_19172 ?auto_19173 ) ) ( not ( = ?auto_19172 ?auto_19202 ) ) ( not ( = ?auto_19173 ?auto_19202 ) ) ( IS-CRATE ?auto_19172 ) ( AVAILABLE ?auto_19203 ) ( SURFACE-AT ?auto_19172 ?auto_19208 ) ( ON ?auto_19172 ?auto_19192 ) ( CLEAR ?auto_19172 ) ( not ( = ?auto_19171 ?auto_19172 ) ) ( not ( = ?auto_19171 ?auto_19192 ) ) ( not ( = ?auto_19172 ?auto_19192 ) ) ( IS-CRATE ?auto_19171 ) ( not ( = ?auto_19209 ?auto_19186 ) ) ( HOIST-AT ?auto_19213 ?auto_19209 ) ( SURFACE-AT ?auto_19171 ?auto_19209 ) ( ON ?auto_19171 ?auto_19198 ) ( CLEAR ?auto_19171 ) ( not ( = ?auto_19170 ?auto_19171 ) ) ( not ( = ?auto_19170 ?auto_19198 ) ) ( not ( = ?auto_19171 ?auto_19198 ) ) ( not ( = ?auto_19183 ?auto_19213 ) ) ( IS-CRATE ?auto_19170 ) ( AVAILABLE ?auto_19212 ) ( SURFACE-AT ?auto_19170 ?auto_19190 ) ( ON ?auto_19170 ?auto_19204 ) ( CLEAR ?auto_19170 ) ( not ( = ?auto_19169 ?auto_19170 ) ) ( not ( = ?auto_19169 ?auto_19204 ) ) ( not ( = ?auto_19170 ?auto_19204 ) ) ( IS-CRATE ?auto_19169 ) ( not ( = ?auto_19201 ?auto_19186 ) ) ( HOIST-AT ?auto_19195 ?auto_19201 ) ( AVAILABLE ?auto_19195 ) ( SURFACE-AT ?auto_19169 ?auto_19201 ) ( ON ?auto_19169 ?auto_19199 ) ( CLEAR ?auto_19169 ) ( not ( = ?auto_19168 ?auto_19169 ) ) ( not ( = ?auto_19168 ?auto_19199 ) ) ( not ( = ?auto_19169 ?auto_19199 ) ) ( not ( = ?auto_19183 ?auto_19195 ) ) ( SURFACE-AT ?auto_19167 ?auto_19186 ) ( CLEAR ?auto_19167 ) ( IS-CRATE ?auto_19168 ) ( AVAILABLE ?auto_19183 ) ( AVAILABLE ?auto_19213 ) ( SURFACE-AT ?auto_19168 ?auto_19209 ) ( ON ?auto_19168 ?auto_19194 ) ( CLEAR ?auto_19168 ) ( TRUCK-AT ?auto_19182 ?auto_19186 ) ( not ( = ?auto_19167 ?auto_19168 ) ) ( not ( = ?auto_19167 ?auto_19194 ) ) ( not ( = ?auto_19168 ?auto_19194 ) ) ( not ( = ?auto_19167 ?auto_19169 ) ) ( not ( = ?auto_19167 ?auto_19199 ) ) ( not ( = ?auto_19169 ?auto_19194 ) ) ( not ( = ?auto_19201 ?auto_19209 ) ) ( not ( = ?auto_19195 ?auto_19213 ) ) ( not ( = ?auto_19199 ?auto_19194 ) ) ( not ( = ?auto_19167 ?auto_19170 ) ) ( not ( = ?auto_19167 ?auto_19204 ) ) ( not ( = ?auto_19168 ?auto_19170 ) ) ( not ( = ?auto_19168 ?auto_19204 ) ) ( not ( = ?auto_19170 ?auto_19199 ) ) ( not ( = ?auto_19170 ?auto_19194 ) ) ( not ( = ?auto_19190 ?auto_19201 ) ) ( not ( = ?auto_19190 ?auto_19209 ) ) ( not ( = ?auto_19212 ?auto_19195 ) ) ( not ( = ?auto_19212 ?auto_19213 ) ) ( not ( = ?auto_19204 ?auto_19199 ) ) ( not ( = ?auto_19204 ?auto_19194 ) ) ( not ( = ?auto_19167 ?auto_19171 ) ) ( not ( = ?auto_19167 ?auto_19198 ) ) ( not ( = ?auto_19168 ?auto_19171 ) ) ( not ( = ?auto_19168 ?auto_19198 ) ) ( not ( = ?auto_19169 ?auto_19171 ) ) ( not ( = ?auto_19169 ?auto_19198 ) ) ( not ( = ?auto_19171 ?auto_19204 ) ) ( not ( = ?auto_19171 ?auto_19199 ) ) ( not ( = ?auto_19171 ?auto_19194 ) ) ( not ( = ?auto_19198 ?auto_19204 ) ) ( not ( = ?auto_19198 ?auto_19199 ) ) ( not ( = ?auto_19198 ?auto_19194 ) ) ( not ( = ?auto_19167 ?auto_19172 ) ) ( not ( = ?auto_19167 ?auto_19192 ) ) ( not ( = ?auto_19168 ?auto_19172 ) ) ( not ( = ?auto_19168 ?auto_19192 ) ) ( not ( = ?auto_19169 ?auto_19172 ) ) ( not ( = ?auto_19169 ?auto_19192 ) ) ( not ( = ?auto_19170 ?auto_19172 ) ) ( not ( = ?auto_19170 ?auto_19192 ) ) ( not ( = ?auto_19172 ?auto_19198 ) ) ( not ( = ?auto_19172 ?auto_19204 ) ) ( not ( = ?auto_19172 ?auto_19199 ) ) ( not ( = ?auto_19172 ?auto_19194 ) ) ( not ( = ?auto_19208 ?auto_19209 ) ) ( not ( = ?auto_19208 ?auto_19190 ) ) ( not ( = ?auto_19208 ?auto_19201 ) ) ( not ( = ?auto_19203 ?auto_19213 ) ) ( not ( = ?auto_19203 ?auto_19212 ) ) ( not ( = ?auto_19203 ?auto_19195 ) ) ( not ( = ?auto_19192 ?auto_19198 ) ) ( not ( = ?auto_19192 ?auto_19204 ) ) ( not ( = ?auto_19192 ?auto_19199 ) ) ( not ( = ?auto_19192 ?auto_19194 ) ) ( not ( = ?auto_19167 ?auto_19173 ) ) ( not ( = ?auto_19167 ?auto_19202 ) ) ( not ( = ?auto_19168 ?auto_19173 ) ) ( not ( = ?auto_19168 ?auto_19202 ) ) ( not ( = ?auto_19169 ?auto_19173 ) ) ( not ( = ?auto_19169 ?auto_19202 ) ) ( not ( = ?auto_19170 ?auto_19173 ) ) ( not ( = ?auto_19170 ?auto_19202 ) ) ( not ( = ?auto_19171 ?auto_19173 ) ) ( not ( = ?auto_19171 ?auto_19202 ) ) ( not ( = ?auto_19173 ?auto_19192 ) ) ( not ( = ?auto_19173 ?auto_19198 ) ) ( not ( = ?auto_19173 ?auto_19204 ) ) ( not ( = ?auto_19173 ?auto_19199 ) ) ( not ( = ?auto_19173 ?auto_19194 ) ) ( not ( = ?auto_19181 ?auto_19208 ) ) ( not ( = ?auto_19181 ?auto_19209 ) ) ( not ( = ?auto_19181 ?auto_19190 ) ) ( not ( = ?auto_19181 ?auto_19201 ) ) ( not ( = ?auto_19185 ?auto_19203 ) ) ( not ( = ?auto_19185 ?auto_19213 ) ) ( not ( = ?auto_19185 ?auto_19212 ) ) ( not ( = ?auto_19185 ?auto_19195 ) ) ( not ( = ?auto_19202 ?auto_19192 ) ) ( not ( = ?auto_19202 ?auto_19198 ) ) ( not ( = ?auto_19202 ?auto_19204 ) ) ( not ( = ?auto_19202 ?auto_19199 ) ) ( not ( = ?auto_19202 ?auto_19194 ) ) ( not ( = ?auto_19167 ?auto_19174 ) ) ( not ( = ?auto_19167 ?auto_19206 ) ) ( not ( = ?auto_19168 ?auto_19174 ) ) ( not ( = ?auto_19168 ?auto_19206 ) ) ( not ( = ?auto_19169 ?auto_19174 ) ) ( not ( = ?auto_19169 ?auto_19206 ) ) ( not ( = ?auto_19170 ?auto_19174 ) ) ( not ( = ?auto_19170 ?auto_19206 ) ) ( not ( = ?auto_19171 ?auto_19174 ) ) ( not ( = ?auto_19171 ?auto_19206 ) ) ( not ( = ?auto_19172 ?auto_19174 ) ) ( not ( = ?auto_19172 ?auto_19206 ) ) ( not ( = ?auto_19174 ?auto_19202 ) ) ( not ( = ?auto_19174 ?auto_19192 ) ) ( not ( = ?auto_19174 ?auto_19198 ) ) ( not ( = ?auto_19174 ?auto_19204 ) ) ( not ( = ?auto_19174 ?auto_19199 ) ) ( not ( = ?auto_19174 ?auto_19194 ) ) ( not ( = ?auto_19200 ?auto_19181 ) ) ( not ( = ?auto_19200 ?auto_19208 ) ) ( not ( = ?auto_19200 ?auto_19209 ) ) ( not ( = ?auto_19200 ?auto_19190 ) ) ( not ( = ?auto_19200 ?auto_19201 ) ) ( not ( = ?auto_19196 ?auto_19185 ) ) ( not ( = ?auto_19196 ?auto_19203 ) ) ( not ( = ?auto_19196 ?auto_19213 ) ) ( not ( = ?auto_19196 ?auto_19212 ) ) ( not ( = ?auto_19196 ?auto_19195 ) ) ( not ( = ?auto_19206 ?auto_19202 ) ) ( not ( = ?auto_19206 ?auto_19192 ) ) ( not ( = ?auto_19206 ?auto_19198 ) ) ( not ( = ?auto_19206 ?auto_19204 ) ) ( not ( = ?auto_19206 ?auto_19199 ) ) ( not ( = ?auto_19206 ?auto_19194 ) ) ( not ( = ?auto_19167 ?auto_19175 ) ) ( not ( = ?auto_19167 ?auto_19197 ) ) ( not ( = ?auto_19168 ?auto_19175 ) ) ( not ( = ?auto_19168 ?auto_19197 ) ) ( not ( = ?auto_19169 ?auto_19175 ) ) ( not ( = ?auto_19169 ?auto_19197 ) ) ( not ( = ?auto_19170 ?auto_19175 ) ) ( not ( = ?auto_19170 ?auto_19197 ) ) ( not ( = ?auto_19171 ?auto_19175 ) ) ( not ( = ?auto_19171 ?auto_19197 ) ) ( not ( = ?auto_19172 ?auto_19175 ) ) ( not ( = ?auto_19172 ?auto_19197 ) ) ( not ( = ?auto_19173 ?auto_19175 ) ) ( not ( = ?auto_19173 ?auto_19197 ) ) ( not ( = ?auto_19175 ?auto_19206 ) ) ( not ( = ?auto_19175 ?auto_19202 ) ) ( not ( = ?auto_19175 ?auto_19192 ) ) ( not ( = ?auto_19175 ?auto_19198 ) ) ( not ( = ?auto_19175 ?auto_19204 ) ) ( not ( = ?auto_19175 ?auto_19199 ) ) ( not ( = ?auto_19175 ?auto_19194 ) ) ( not ( = ?auto_19191 ?auto_19200 ) ) ( not ( = ?auto_19191 ?auto_19181 ) ) ( not ( = ?auto_19191 ?auto_19208 ) ) ( not ( = ?auto_19191 ?auto_19209 ) ) ( not ( = ?auto_19191 ?auto_19190 ) ) ( not ( = ?auto_19191 ?auto_19201 ) ) ( not ( = ?auto_19193 ?auto_19196 ) ) ( not ( = ?auto_19193 ?auto_19185 ) ) ( not ( = ?auto_19193 ?auto_19203 ) ) ( not ( = ?auto_19193 ?auto_19213 ) ) ( not ( = ?auto_19193 ?auto_19212 ) ) ( not ( = ?auto_19193 ?auto_19195 ) ) ( not ( = ?auto_19197 ?auto_19206 ) ) ( not ( = ?auto_19197 ?auto_19202 ) ) ( not ( = ?auto_19197 ?auto_19192 ) ) ( not ( = ?auto_19197 ?auto_19198 ) ) ( not ( = ?auto_19197 ?auto_19204 ) ) ( not ( = ?auto_19197 ?auto_19199 ) ) ( not ( = ?auto_19197 ?auto_19194 ) ) ( not ( = ?auto_19167 ?auto_19176 ) ) ( not ( = ?auto_19167 ?auto_19214 ) ) ( not ( = ?auto_19168 ?auto_19176 ) ) ( not ( = ?auto_19168 ?auto_19214 ) ) ( not ( = ?auto_19169 ?auto_19176 ) ) ( not ( = ?auto_19169 ?auto_19214 ) ) ( not ( = ?auto_19170 ?auto_19176 ) ) ( not ( = ?auto_19170 ?auto_19214 ) ) ( not ( = ?auto_19171 ?auto_19176 ) ) ( not ( = ?auto_19171 ?auto_19214 ) ) ( not ( = ?auto_19172 ?auto_19176 ) ) ( not ( = ?auto_19172 ?auto_19214 ) ) ( not ( = ?auto_19173 ?auto_19176 ) ) ( not ( = ?auto_19173 ?auto_19214 ) ) ( not ( = ?auto_19174 ?auto_19176 ) ) ( not ( = ?auto_19174 ?auto_19214 ) ) ( not ( = ?auto_19176 ?auto_19197 ) ) ( not ( = ?auto_19176 ?auto_19206 ) ) ( not ( = ?auto_19176 ?auto_19202 ) ) ( not ( = ?auto_19176 ?auto_19192 ) ) ( not ( = ?auto_19176 ?auto_19198 ) ) ( not ( = ?auto_19176 ?auto_19204 ) ) ( not ( = ?auto_19176 ?auto_19199 ) ) ( not ( = ?auto_19176 ?auto_19194 ) ) ( not ( = ?auto_19214 ?auto_19197 ) ) ( not ( = ?auto_19214 ?auto_19206 ) ) ( not ( = ?auto_19214 ?auto_19202 ) ) ( not ( = ?auto_19214 ?auto_19192 ) ) ( not ( = ?auto_19214 ?auto_19198 ) ) ( not ( = ?auto_19214 ?auto_19204 ) ) ( not ( = ?auto_19214 ?auto_19199 ) ) ( not ( = ?auto_19214 ?auto_19194 ) ) ( not ( = ?auto_19167 ?auto_19177 ) ) ( not ( = ?auto_19167 ?auto_19187 ) ) ( not ( = ?auto_19168 ?auto_19177 ) ) ( not ( = ?auto_19168 ?auto_19187 ) ) ( not ( = ?auto_19169 ?auto_19177 ) ) ( not ( = ?auto_19169 ?auto_19187 ) ) ( not ( = ?auto_19170 ?auto_19177 ) ) ( not ( = ?auto_19170 ?auto_19187 ) ) ( not ( = ?auto_19171 ?auto_19177 ) ) ( not ( = ?auto_19171 ?auto_19187 ) ) ( not ( = ?auto_19172 ?auto_19177 ) ) ( not ( = ?auto_19172 ?auto_19187 ) ) ( not ( = ?auto_19173 ?auto_19177 ) ) ( not ( = ?auto_19173 ?auto_19187 ) ) ( not ( = ?auto_19174 ?auto_19177 ) ) ( not ( = ?auto_19174 ?auto_19187 ) ) ( not ( = ?auto_19175 ?auto_19177 ) ) ( not ( = ?auto_19175 ?auto_19187 ) ) ( not ( = ?auto_19177 ?auto_19214 ) ) ( not ( = ?auto_19177 ?auto_19197 ) ) ( not ( = ?auto_19177 ?auto_19206 ) ) ( not ( = ?auto_19177 ?auto_19202 ) ) ( not ( = ?auto_19177 ?auto_19192 ) ) ( not ( = ?auto_19177 ?auto_19198 ) ) ( not ( = ?auto_19177 ?auto_19204 ) ) ( not ( = ?auto_19177 ?auto_19199 ) ) ( not ( = ?auto_19177 ?auto_19194 ) ) ( not ( = ?auto_19187 ?auto_19214 ) ) ( not ( = ?auto_19187 ?auto_19197 ) ) ( not ( = ?auto_19187 ?auto_19206 ) ) ( not ( = ?auto_19187 ?auto_19202 ) ) ( not ( = ?auto_19187 ?auto_19192 ) ) ( not ( = ?auto_19187 ?auto_19198 ) ) ( not ( = ?auto_19187 ?auto_19204 ) ) ( not ( = ?auto_19187 ?auto_19199 ) ) ( not ( = ?auto_19187 ?auto_19194 ) ) ( not ( = ?auto_19167 ?auto_19178 ) ) ( not ( = ?auto_19167 ?auto_19210 ) ) ( not ( = ?auto_19168 ?auto_19178 ) ) ( not ( = ?auto_19168 ?auto_19210 ) ) ( not ( = ?auto_19169 ?auto_19178 ) ) ( not ( = ?auto_19169 ?auto_19210 ) ) ( not ( = ?auto_19170 ?auto_19178 ) ) ( not ( = ?auto_19170 ?auto_19210 ) ) ( not ( = ?auto_19171 ?auto_19178 ) ) ( not ( = ?auto_19171 ?auto_19210 ) ) ( not ( = ?auto_19172 ?auto_19178 ) ) ( not ( = ?auto_19172 ?auto_19210 ) ) ( not ( = ?auto_19173 ?auto_19178 ) ) ( not ( = ?auto_19173 ?auto_19210 ) ) ( not ( = ?auto_19174 ?auto_19178 ) ) ( not ( = ?auto_19174 ?auto_19210 ) ) ( not ( = ?auto_19175 ?auto_19178 ) ) ( not ( = ?auto_19175 ?auto_19210 ) ) ( not ( = ?auto_19176 ?auto_19178 ) ) ( not ( = ?auto_19176 ?auto_19210 ) ) ( not ( = ?auto_19178 ?auto_19187 ) ) ( not ( = ?auto_19178 ?auto_19214 ) ) ( not ( = ?auto_19178 ?auto_19197 ) ) ( not ( = ?auto_19178 ?auto_19206 ) ) ( not ( = ?auto_19178 ?auto_19202 ) ) ( not ( = ?auto_19178 ?auto_19192 ) ) ( not ( = ?auto_19178 ?auto_19198 ) ) ( not ( = ?auto_19178 ?auto_19204 ) ) ( not ( = ?auto_19178 ?auto_19199 ) ) ( not ( = ?auto_19178 ?auto_19194 ) ) ( not ( = ?auto_19211 ?auto_19208 ) ) ( not ( = ?auto_19211 ?auto_19190 ) ) ( not ( = ?auto_19211 ?auto_19191 ) ) ( not ( = ?auto_19211 ?auto_19200 ) ) ( not ( = ?auto_19211 ?auto_19181 ) ) ( not ( = ?auto_19211 ?auto_19209 ) ) ( not ( = ?auto_19211 ?auto_19201 ) ) ( not ( = ?auto_19205 ?auto_19203 ) ) ( not ( = ?auto_19205 ?auto_19212 ) ) ( not ( = ?auto_19205 ?auto_19193 ) ) ( not ( = ?auto_19205 ?auto_19196 ) ) ( not ( = ?auto_19205 ?auto_19185 ) ) ( not ( = ?auto_19205 ?auto_19213 ) ) ( not ( = ?auto_19205 ?auto_19195 ) ) ( not ( = ?auto_19210 ?auto_19187 ) ) ( not ( = ?auto_19210 ?auto_19214 ) ) ( not ( = ?auto_19210 ?auto_19197 ) ) ( not ( = ?auto_19210 ?auto_19206 ) ) ( not ( = ?auto_19210 ?auto_19202 ) ) ( not ( = ?auto_19210 ?auto_19192 ) ) ( not ( = ?auto_19210 ?auto_19198 ) ) ( not ( = ?auto_19210 ?auto_19204 ) ) ( not ( = ?auto_19210 ?auto_19199 ) ) ( not ( = ?auto_19210 ?auto_19194 ) ) ( not ( = ?auto_19167 ?auto_19179 ) ) ( not ( = ?auto_19167 ?auto_19188 ) ) ( not ( = ?auto_19168 ?auto_19179 ) ) ( not ( = ?auto_19168 ?auto_19188 ) ) ( not ( = ?auto_19169 ?auto_19179 ) ) ( not ( = ?auto_19169 ?auto_19188 ) ) ( not ( = ?auto_19170 ?auto_19179 ) ) ( not ( = ?auto_19170 ?auto_19188 ) ) ( not ( = ?auto_19171 ?auto_19179 ) ) ( not ( = ?auto_19171 ?auto_19188 ) ) ( not ( = ?auto_19172 ?auto_19179 ) ) ( not ( = ?auto_19172 ?auto_19188 ) ) ( not ( = ?auto_19173 ?auto_19179 ) ) ( not ( = ?auto_19173 ?auto_19188 ) ) ( not ( = ?auto_19174 ?auto_19179 ) ) ( not ( = ?auto_19174 ?auto_19188 ) ) ( not ( = ?auto_19175 ?auto_19179 ) ) ( not ( = ?auto_19175 ?auto_19188 ) ) ( not ( = ?auto_19176 ?auto_19179 ) ) ( not ( = ?auto_19176 ?auto_19188 ) ) ( not ( = ?auto_19177 ?auto_19179 ) ) ( not ( = ?auto_19177 ?auto_19188 ) ) ( not ( = ?auto_19179 ?auto_19210 ) ) ( not ( = ?auto_19179 ?auto_19187 ) ) ( not ( = ?auto_19179 ?auto_19214 ) ) ( not ( = ?auto_19179 ?auto_19197 ) ) ( not ( = ?auto_19179 ?auto_19206 ) ) ( not ( = ?auto_19179 ?auto_19202 ) ) ( not ( = ?auto_19179 ?auto_19192 ) ) ( not ( = ?auto_19179 ?auto_19198 ) ) ( not ( = ?auto_19179 ?auto_19204 ) ) ( not ( = ?auto_19179 ?auto_19199 ) ) ( not ( = ?auto_19179 ?auto_19194 ) ) ( not ( = ?auto_19207 ?auto_19211 ) ) ( not ( = ?auto_19207 ?auto_19208 ) ) ( not ( = ?auto_19207 ?auto_19190 ) ) ( not ( = ?auto_19207 ?auto_19191 ) ) ( not ( = ?auto_19207 ?auto_19200 ) ) ( not ( = ?auto_19207 ?auto_19181 ) ) ( not ( = ?auto_19207 ?auto_19209 ) ) ( not ( = ?auto_19207 ?auto_19201 ) ) ( not ( = ?auto_19189 ?auto_19205 ) ) ( not ( = ?auto_19189 ?auto_19203 ) ) ( not ( = ?auto_19189 ?auto_19212 ) ) ( not ( = ?auto_19189 ?auto_19193 ) ) ( not ( = ?auto_19189 ?auto_19196 ) ) ( not ( = ?auto_19189 ?auto_19185 ) ) ( not ( = ?auto_19189 ?auto_19213 ) ) ( not ( = ?auto_19189 ?auto_19195 ) ) ( not ( = ?auto_19188 ?auto_19210 ) ) ( not ( = ?auto_19188 ?auto_19187 ) ) ( not ( = ?auto_19188 ?auto_19214 ) ) ( not ( = ?auto_19188 ?auto_19197 ) ) ( not ( = ?auto_19188 ?auto_19206 ) ) ( not ( = ?auto_19188 ?auto_19202 ) ) ( not ( = ?auto_19188 ?auto_19192 ) ) ( not ( = ?auto_19188 ?auto_19198 ) ) ( not ( = ?auto_19188 ?auto_19204 ) ) ( not ( = ?auto_19188 ?auto_19199 ) ) ( not ( = ?auto_19188 ?auto_19194 ) ) ( not ( = ?auto_19167 ?auto_19180 ) ) ( not ( = ?auto_19167 ?auto_19184 ) ) ( not ( = ?auto_19168 ?auto_19180 ) ) ( not ( = ?auto_19168 ?auto_19184 ) ) ( not ( = ?auto_19169 ?auto_19180 ) ) ( not ( = ?auto_19169 ?auto_19184 ) ) ( not ( = ?auto_19170 ?auto_19180 ) ) ( not ( = ?auto_19170 ?auto_19184 ) ) ( not ( = ?auto_19171 ?auto_19180 ) ) ( not ( = ?auto_19171 ?auto_19184 ) ) ( not ( = ?auto_19172 ?auto_19180 ) ) ( not ( = ?auto_19172 ?auto_19184 ) ) ( not ( = ?auto_19173 ?auto_19180 ) ) ( not ( = ?auto_19173 ?auto_19184 ) ) ( not ( = ?auto_19174 ?auto_19180 ) ) ( not ( = ?auto_19174 ?auto_19184 ) ) ( not ( = ?auto_19175 ?auto_19180 ) ) ( not ( = ?auto_19175 ?auto_19184 ) ) ( not ( = ?auto_19176 ?auto_19180 ) ) ( not ( = ?auto_19176 ?auto_19184 ) ) ( not ( = ?auto_19177 ?auto_19180 ) ) ( not ( = ?auto_19177 ?auto_19184 ) ) ( not ( = ?auto_19178 ?auto_19180 ) ) ( not ( = ?auto_19178 ?auto_19184 ) ) ( not ( = ?auto_19180 ?auto_19188 ) ) ( not ( = ?auto_19180 ?auto_19210 ) ) ( not ( = ?auto_19180 ?auto_19187 ) ) ( not ( = ?auto_19180 ?auto_19214 ) ) ( not ( = ?auto_19180 ?auto_19197 ) ) ( not ( = ?auto_19180 ?auto_19206 ) ) ( not ( = ?auto_19180 ?auto_19202 ) ) ( not ( = ?auto_19180 ?auto_19192 ) ) ( not ( = ?auto_19180 ?auto_19198 ) ) ( not ( = ?auto_19180 ?auto_19204 ) ) ( not ( = ?auto_19180 ?auto_19199 ) ) ( not ( = ?auto_19180 ?auto_19194 ) ) ( not ( = ?auto_19184 ?auto_19188 ) ) ( not ( = ?auto_19184 ?auto_19210 ) ) ( not ( = ?auto_19184 ?auto_19187 ) ) ( not ( = ?auto_19184 ?auto_19214 ) ) ( not ( = ?auto_19184 ?auto_19197 ) ) ( not ( = ?auto_19184 ?auto_19206 ) ) ( not ( = ?auto_19184 ?auto_19202 ) ) ( not ( = ?auto_19184 ?auto_19192 ) ) ( not ( = ?auto_19184 ?auto_19198 ) ) ( not ( = ?auto_19184 ?auto_19204 ) ) ( not ( = ?auto_19184 ?auto_19199 ) ) ( not ( = ?auto_19184 ?auto_19194 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_19167 ?auto_19168 ?auto_19169 ?auto_19170 ?auto_19171 ?auto_19172 ?auto_19173 ?auto_19174 ?auto_19175 ?auto_19176 ?auto_19177 ?auto_19178 ?auto_19179 )
      ( MAKE-1CRATE ?auto_19179 ?auto_19180 )
      ( MAKE-13CRATE-VERIFY ?auto_19167 ?auto_19168 ?auto_19169 ?auto_19170 ?auto_19171 ?auto_19172 ?auto_19173 ?auto_19174 ?auto_19175 ?auto_19176 ?auto_19177 ?auto_19178 ?auto_19179 ?auto_19180 ) )
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
      ?auto_19247 - SURFACE
      ?auto_19248 - SURFACE
      ?auto_19249 - SURFACE
      ?auto_19250 - SURFACE
      ?auto_19251 - SURFACE
      ?auto_19252 - SURFACE
      ?auto_19254 - SURFACE
      ?auto_19253 - SURFACE
    )
    :vars
    (
      ?auto_19260 - HOIST
      ?auto_19255 - PLACE
      ?auto_19258 - PLACE
      ?auto_19256 - HOIST
      ?auto_19259 - SURFACE
      ?auto_19261 - PLACE
      ?auto_19286 - HOIST
      ?auto_19276 - SURFACE
      ?auto_19280 - PLACE
      ?auto_19278 - HOIST
      ?auto_19267 - SURFACE
      ?auto_19281 - PLACE
      ?auto_19285 - HOIST
      ?auto_19263 - SURFACE
      ?auto_19270 - PLACE
      ?auto_19271 - HOIST
      ?auto_19289 - SURFACE
      ?auto_19266 - PLACE
      ?auto_19283 - HOIST
      ?auto_19277 - SURFACE
      ?auto_19268 - PLACE
      ?auto_19282 - HOIST
      ?auto_19269 - SURFACE
      ?auto_19275 - PLACE
      ?auto_19287 - HOIST
      ?auto_19264 - SURFACE
      ?auto_19273 - SURFACE
      ?auto_19288 - SURFACE
      ?auto_19265 - PLACE
      ?auto_19279 - HOIST
      ?auto_19274 - SURFACE
      ?auto_19262 - SURFACE
      ?auto_19291 - PLACE
      ?auto_19284 - HOIST
      ?auto_19272 - SURFACE
      ?auto_19290 - SURFACE
      ?auto_19257 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19260 ?auto_19255 ) ( IS-CRATE ?auto_19253 ) ( not ( = ?auto_19258 ?auto_19255 ) ) ( HOIST-AT ?auto_19256 ?auto_19258 ) ( AVAILABLE ?auto_19256 ) ( SURFACE-AT ?auto_19253 ?auto_19258 ) ( ON ?auto_19253 ?auto_19259 ) ( CLEAR ?auto_19253 ) ( not ( = ?auto_19254 ?auto_19253 ) ) ( not ( = ?auto_19254 ?auto_19259 ) ) ( not ( = ?auto_19253 ?auto_19259 ) ) ( not ( = ?auto_19260 ?auto_19256 ) ) ( IS-CRATE ?auto_19254 ) ( not ( = ?auto_19261 ?auto_19255 ) ) ( HOIST-AT ?auto_19286 ?auto_19261 ) ( SURFACE-AT ?auto_19254 ?auto_19261 ) ( ON ?auto_19254 ?auto_19276 ) ( CLEAR ?auto_19254 ) ( not ( = ?auto_19252 ?auto_19254 ) ) ( not ( = ?auto_19252 ?auto_19276 ) ) ( not ( = ?auto_19254 ?auto_19276 ) ) ( not ( = ?auto_19260 ?auto_19286 ) ) ( IS-CRATE ?auto_19252 ) ( not ( = ?auto_19280 ?auto_19255 ) ) ( HOIST-AT ?auto_19278 ?auto_19280 ) ( AVAILABLE ?auto_19278 ) ( SURFACE-AT ?auto_19252 ?auto_19280 ) ( ON ?auto_19252 ?auto_19267 ) ( CLEAR ?auto_19252 ) ( not ( = ?auto_19251 ?auto_19252 ) ) ( not ( = ?auto_19251 ?auto_19267 ) ) ( not ( = ?auto_19252 ?auto_19267 ) ) ( not ( = ?auto_19260 ?auto_19278 ) ) ( IS-CRATE ?auto_19251 ) ( not ( = ?auto_19281 ?auto_19255 ) ) ( HOIST-AT ?auto_19285 ?auto_19281 ) ( AVAILABLE ?auto_19285 ) ( SURFACE-AT ?auto_19251 ?auto_19281 ) ( ON ?auto_19251 ?auto_19263 ) ( CLEAR ?auto_19251 ) ( not ( = ?auto_19250 ?auto_19251 ) ) ( not ( = ?auto_19250 ?auto_19263 ) ) ( not ( = ?auto_19251 ?auto_19263 ) ) ( not ( = ?auto_19260 ?auto_19285 ) ) ( IS-CRATE ?auto_19250 ) ( not ( = ?auto_19270 ?auto_19255 ) ) ( HOIST-AT ?auto_19271 ?auto_19270 ) ( SURFACE-AT ?auto_19250 ?auto_19270 ) ( ON ?auto_19250 ?auto_19289 ) ( CLEAR ?auto_19250 ) ( not ( = ?auto_19249 ?auto_19250 ) ) ( not ( = ?auto_19249 ?auto_19289 ) ) ( not ( = ?auto_19250 ?auto_19289 ) ) ( not ( = ?auto_19260 ?auto_19271 ) ) ( IS-CRATE ?auto_19249 ) ( not ( = ?auto_19266 ?auto_19255 ) ) ( HOIST-AT ?auto_19283 ?auto_19266 ) ( SURFACE-AT ?auto_19249 ?auto_19266 ) ( ON ?auto_19249 ?auto_19277 ) ( CLEAR ?auto_19249 ) ( not ( = ?auto_19248 ?auto_19249 ) ) ( not ( = ?auto_19248 ?auto_19277 ) ) ( not ( = ?auto_19249 ?auto_19277 ) ) ( not ( = ?auto_19260 ?auto_19283 ) ) ( IS-CRATE ?auto_19248 ) ( not ( = ?auto_19268 ?auto_19255 ) ) ( HOIST-AT ?auto_19282 ?auto_19268 ) ( AVAILABLE ?auto_19282 ) ( SURFACE-AT ?auto_19248 ?auto_19268 ) ( ON ?auto_19248 ?auto_19269 ) ( CLEAR ?auto_19248 ) ( not ( = ?auto_19247 ?auto_19248 ) ) ( not ( = ?auto_19247 ?auto_19269 ) ) ( not ( = ?auto_19248 ?auto_19269 ) ) ( not ( = ?auto_19260 ?auto_19282 ) ) ( IS-CRATE ?auto_19247 ) ( not ( = ?auto_19275 ?auto_19255 ) ) ( HOIST-AT ?auto_19287 ?auto_19275 ) ( AVAILABLE ?auto_19287 ) ( SURFACE-AT ?auto_19247 ?auto_19275 ) ( ON ?auto_19247 ?auto_19264 ) ( CLEAR ?auto_19247 ) ( not ( = ?auto_19246 ?auto_19247 ) ) ( not ( = ?auto_19246 ?auto_19264 ) ) ( not ( = ?auto_19247 ?auto_19264 ) ) ( not ( = ?auto_19260 ?auto_19287 ) ) ( IS-CRATE ?auto_19246 ) ( AVAILABLE ?auto_19286 ) ( SURFACE-AT ?auto_19246 ?auto_19261 ) ( ON ?auto_19246 ?auto_19273 ) ( CLEAR ?auto_19246 ) ( not ( = ?auto_19245 ?auto_19246 ) ) ( not ( = ?auto_19245 ?auto_19273 ) ) ( not ( = ?auto_19246 ?auto_19273 ) ) ( IS-CRATE ?auto_19245 ) ( AVAILABLE ?auto_19271 ) ( SURFACE-AT ?auto_19245 ?auto_19270 ) ( ON ?auto_19245 ?auto_19288 ) ( CLEAR ?auto_19245 ) ( not ( = ?auto_19244 ?auto_19245 ) ) ( not ( = ?auto_19244 ?auto_19288 ) ) ( not ( = ?auto_19245 ?auto_19288 ) ) ( IS-CRATE ?auto_19244 ) ( not ( = ?auto_19265 ?auto_19255 ) ) ( HOIST-AT ?auto_19279 ?auto_19265 ) ( SURFACE-AT ?auto_19244 ?auto_19265 ) ( ON ?auto_19244 ?auto_19274 ) ( CLEAR ?auto_19244 ) ( not ( = ?auto_19243 ?auto_19244 ) ) ( not ( = ?auto_19243 ?auto_19274 ) ) ( not ( = ?auto_19244 ?auto_19274 ) ) ( not ( = ?auto_19260 ?auto_19279 ) ) ( IS-CRATE ?auto_19243 ) ( AVAILABLE ?auto_19283 ) ( SURFACE-AT ?auto_19243 ?auto_19266 ) ( ON ?auto_19243 ?auto_19262 ) ( CLEAR ?auto_19243 ) ( not ( = ?auto_19242 ?auto_19243 ) ) ( not ( = ?auto_19242 ?auto_19262 ) ) ( not ( = ?auto_19243 ?auto_19262 ) ) ( IS-CRATE ?auto_19242 ) ( not ( = ?auto_19291 ?auto_19255 ) ) ( HOIST-AT ?auto_19284 ?auto_19291 ) ( AVAILABLE ?auto_19284 ) ( SURFACE-AT ?auto_19242 ?auto_19291 ) ( ON ?auto_19242 ?auto_19272 ) ( CLEAR ?auto_19242 ) ( not ( = ?auto_19241 ?auto_19242 ) ) ( not ( = ?auto_19241 ?auto_19272 ) ) ( not ( = ?auto_19242 ?auto_19272 ) ) ( not ( = ?auto_19260 ?auto_19284 ) ) ( SURFACE-AT ?auto_19240 ?auto_19255 ) ( CLEAR ?auto_19240 ) ( IS-CRATE ?auto_19241 ) ( AVAILABLE ?auto_19260 ) ( AVAILABLE ?auto_19279 ) ( SURFACE-AT ?auto_19241 ?auto_19265 ) ( ON ?auto_19241 ?auto_19290 ) ( CLEAR ?auto_19241 ) ( TRUCK-AT ?auto_19257 ?auto_19255 ) ( not ( = ?auto_19240 ?auto_19241 ) ) ( not ( = ?auto_19240 ?auto_19290 ) ) ( not ( = ?auto_19241 ?auto_19290 ) ) ( not ( = ?auto_19240 ?auto_19242 ) ) ( not ( = ?auto_19240 ?auto_19272 ) ) ( not ( = ?auto_19242 ?auto_19290 ) ) ( not ( = ?auto_19291 ?auto_19265 ) ) ( not ( = ?auto_19284 ?auto_19279 ) ) ( not ( = ?auto_19272 ?auto_19290 ) ) ( not ( = ?auto_19240 ?auto_19243 ) ) ( not ( = ?auto_19240 ?auto_19262 ) ) ( not ( = ?auto_19241 ?auto_19243 ) ) ( not ( = ?auto_19241 ?auto_19262 ) ) ( not ( = ?auto_19243 ?auto_19272 ) ) ( not ( = ?auto_19243 ?auto_19290 ) ) ( not ( = ?auto_19266 ?auto_19291 ) ) ( not ( = ?auto_19266 ?auto_19265 ) ) ( not ( = ?auto_19283 ?auto_19284 ) ) ( not ( = ?auto_19283 ?auto_19279 ) ) ( not ( = ?auto_19262 ?auto_19272 ) ) ( not ( = ?auto_19262 ?auto_19290 ) ) ( not ( = ?auto_19240 ?auto_19244 ) ) ( not ( = ?auto_19240 ?auto_19274 ) ) ( not ( = ?auto_19241 ?auto_19244 ) ) ( not ( = ?auto_19241 ?auto_19274 ) ) ( not ( = ?auto_19242 ?auto_19244 ) ) ( not ( = ?auto_19242 ?auto_19274 ) ) ( not ( = ?auto_19244 ?auto_19262 ) ) ( not ( = ?auto_19244 ?auto_19272 ) ) ( not ( = ?auto_19244 ?auto_19290 ) ) ( not ( = ?auto_19274 ?auto_19262 ) ) ( not ( = ?auto_19274 ?auto_19272 ) ) ( not ( = ?auto_19274 ?auto_19290 ) ) ( not ( = ?auto_19240 ?auto_19245 ) ) ( not ( = ?auto_19240 ?auto_19288 ) ) ( not ( = ?auto_19241 ?auto_19245 ) ) ( not ( = ?auto_19241 ?auto_19288 ) ) ( not ( = ?auto_19242 ?auto_19245 ) ) ( not ( = ?auto_19242 ?auto_19288 ) ) ( not ( = ?auto_19243 ?auto_19245 ) ) ( not ( = ?auto_19243 ?auto_19288 ) ) ( not ( = ?auto_19245 ?auto_19274 ) ) ( not ( = ?auto_19245 ?auto_19262 ) ) ( not ( = ?auto_19245 ?auto_19272 ) ) ( not ( = ?auto_19245 ?auto_19290 ) ) ( not ( = ?auto_19270 ?auto_19265 ) ) ( not ( = ?auto_19270 ?auto_19266 ) ) ( not ( = ?auto_19270 ?auto_19291 ) ) ( not ( = ?auto_19271 ?auto_19279 ) ) ( not ( = ?auto_19271 ?auto_19283 ) ) ( not ( = ?auto_19271 ?auto_19284 ) ) ( not ( = ?auto_19288 ?auto_19274 ) ) ( not ( = ?auto_19288 ?auto_19262 ) ) ( not ( = ?auto_19288 ?auto_19272 ) ) ( not ( = ?auto_19288 ?auto_19290 ) ) ( not ( = ?auto_19240 ?auto_19246 ) ) ( not ( = ?auto_19240 ?auto_19273 ) ) ( not ( = ?auto_19241 ?auto_19246 ) ) ( not ( = ?auto_19241 ?auto_19273 ) ) ( not ( = ?auto_19242 ?auto_19246 ) ) ( not ( = ?auto_19242 ?auto_19273 ) ) ( not ( = ?auto_19243 ?auto_19246 ) ) ( not ( = ?auto_19243 ?auto_19273 ) ) ( not ( = ?auto_19244 ?auto_19246 ) ) ( not ( = ?auto_19244 ?auto_19273 ) ) ( not ( = ?auto_19246 ?auto_19288 ) ) ( not ( = ?auto_19246 ?auto_19274 ) ) ( not ( = ?auto_19246 ?auto_19262 ) ) ( not ( = ?auto_19246 ?auto_19272 ) ) ( not ( = ?auto_19246 ?auto_19290 ) ) ( not ( = ?auto_19261 ?auto_19270 ) ) ( not ( = ?auto_19261 ?auto_19265 ) ) ( not ( = ?auto_19261 ?auto_19266 ) ) ( not ( = ?auto_19261 ?auto_19291 ) ) ( not ( = ?auto_19286 ?auto_19271 ) ) ( not ( = ?auto_19286 ?auto_19279 ) ) ( not ( = ?auto_19286 ?auto_19283 ) ) ( not ( = ?auto_19286 ?auto_19284 ) ) ( not ( = ?auto_19273 ?auto_19288 ) ) ( not ( = ?auto_19273 ?auto_19274 ) ) ( not ( = ?auto_19273 ?auto_19262 ) ) ( not ( = ?auto_19273 ?auto_19272 ) ) ( not ( = ?auto_19273 ?auto_19290 ) ) ( not ( = ?auto_19240 ?auto_19247 ) ) ( not ( = ?auto_19240 ?auto_19264 ) ) ( not ( = ?auto_19241 ?auto_19247 ) ) ( not ( = ?auto_19241 ?auto_19264 ) ) ( not ( = ?auto_19242 ?auto_19247 ) ) ( not ( = ?auto_19242 ?auto_19264 ) ) ( not ( = ?auto_19243 ?auto_19247 ) ) ( not ( = ?auto_19243 ?auto_19264 ) ) ( not ( = ?auto_19244 ?auto_19247 ) ) ( not ( = ?auto_19244 ?auto_19264 ) ) ( not ( = ?auto_19245 ?auto_19247 ) ) ( not ( = ?auto_19245 ?auto_19264 ) ) ( not ( = ?auto_19247 ?auto_19273 ) ) ( not ( = ?auto_19247 ?auto_19288 ) ) ( not ( = ?auto_19247 ?auto_19274 ) ) ( not ( = ?auto_19247 ?auto_19262 ) ) ( not ( = ?auto_19247 ?auto_19272 ) ) ( not ( = ?auto_19247 ?auto_19290 ) ) ( not ( = ?auto_19275 ?auto_19261 ) ) ( not ( = ?auto_19275 ?auto_19270 ) ) ( not ( = ?auto_19275 ?auto_19265 ) ) ( not ( = ?auto_19275 ?auto_19266 ) ) ( not ( = ?auto_19275 ?auto_19291 ) ) ( not ( = ?auto_19287 ?auto_19286 ) ) ( not ( = ?auto_19287 ?auto_19271 ) ) ( not ( = ?auto_19287 ?auto_19279 ) ) ( not ( = ?auto_19287 ?auto_19283 ) ) ( not ( = ?auto_19287 ?auto_19284 ) ) ( not ( = ?auto_19264 ?auto_19273 ) ) ( not ( = ?auto_19264 ?auto_19288 ) ) ( not ( = ?auto_19264 ?auto_19274 ) ) ( not ( = ?auto_19264 ?auto_19262 ) ) ( not ( = ?auto_19264 ?auto_19272 ) ) ( not ( = ?auto_19264 ?auto_19290 ) ) ( not ( = ?auto_19240 ?auto_19248 ) ) ( not ( = ?auto_19240 ?auto_19269 ) ) ( not ( = ?auto_19241 ?auto_19248 ) ) ( not ( = ?auto_19241 ?auto_19269 ) ) ( not ( = ?auto_19242 ?auto_19248 ) ) ( not ( = ?auto_19242 ?auto_19269 ) ) ( not ( = ?auto_19243 ?auto_19248 ) ) ( not ( = ?auto_19243 ?auto_19269 ) ) ( not ( = ?auto_19244 ?auto_19248 ) ) ( not ( = ?auto_19244 ?auto_19269 ) ) ( not ( = ?auto_19245 ?auto_19248 ) ) ( not ( = ?auto_19245 ?auto_19269 ) ) ( not ( = ?auto_19246 ?auto_19248 ) ) ( not ( = ?auto_19246 ?auto_19269 ) ) ( not ( = ?auto_19248 ?auto_19264 ) ) ( not ( = ?auto_19248 ?auto_19273 ) ) ( not ( = ?auto_19248 ?auto_19288 ) ) ( not ( = ?auto_19248 ?auto_19274 ) ) ( not ( = ?auto_19248 ?auto_19262 ) ) ( not ( = ?auto_19248 ?auto_19272 ) ) ( not ( = ?auto_19248 ?auto_19290 ) ) ( not ( = ?auto_19268 ?auto_19275 ) ) ( not ( = ?auto_19268 ?auto_19261 ) ) ( not ( = ?auto_19268 ?auto_19270 ) ) ( not ( = ?auto_19268 ?auto_19265 ) ) ( not ( = ?auto_19268 ?auto_19266 ) ) ( not ( = ?auto_19268 ?auto_19291 ) ) ( not ( = ?auto_19282 ?auto_19287 ) ) ( not ( = ?auto_19282 ?auto_19286 ) ) ( not ( = ?auto_19282 ?auto_19271 ) ) ( not ( = ?auto_19282 ?auto_19279 ) ) ( not ( = ?auto_19282 ?auto_19283 ) ) ( not ( = ?auto_19282 ?auto_19284 ) ) ( not ( = ?auto_19269 ?auto_19264 ) ) ( not ( = ?auto_19269 ?auto_19273 ) ) ( not ( = ?auto_19269 ?auto_19288 ) ) ( not ( = ?auto_19269 ?auto_19274 ) ) ( not ( = ?auto_19269 ?auto_19262 ) ) ( not ( = ?auto_19269 ?auto_19272 ) ) ( not ( = ?auto_19269 ?auto_19290 ) ) ( not ( = ?auto_19240 ?auto_19249 ) ) ( not ( = ?auto_19240 ?auto_19277 ) ) ( not ( = ?auto_19241 ?auto_19249 ) ) ( not ( = ?auto_19241 ?auto_19277 ) ) ( not ( = ?auto_19242 ?auto_19249 ) ) ( not ( = ?auto_19242 ?auto_19277 ) ) ( not ( = ?auto_19243 ?auto_19249 ) ) ( not ( = ?auto_19243 ?auto_19277 ) ) ( not ( = ?auto_19244 ?auto_19249 ) ) ( not ( = ?auto_19244 ?auto_19277 ) ) ( not ( = ?auto_19245 ?auto_19249 ) ) ( not ( = ?auto_19245 ?auto_19277 ) ) ( not ( = ?auto_19246 ?auto_19249 ) ) ( not ( = ?auto_19246 ?auto_19277 ) ) ( not ( = ?auto_19247 ?auto_19249 ) ) ( not ( = ?auto_19247 ?auto_19277 ) ) ( not ( = ?auto_19249 ?auto_19269 ) ) ( not ( = ?auto_19249 ?auto_19264 ) ) ( not ( = ?auto_19249 ?auto_19273 ) ) ( not ( = ?auto_19249 ?auto_19288 ) ) ( not ( = ?auto_19249 ?auto_19274 ) ) ( not ( = ?auto_19249 ?auto_19262 ) ) ( not ( = ?auto_19249 ?auto_19272 ) ) ( not ( = ?auto_19249 ?auto_19290 ) ) ( not ( = ?auto_19277 ?auto_19269 ) ) ( not ( = ?auto_19277 ?auto_19264 ) ) ( not ( = ?auto_19277 ?auto_19273 ) ) ( not ( = ?auto_19277 ?auto_19288 ) ) ( not ( = ?auto_19277 ?auto_19274 ) ) ( not ( = ?auto_19277 ?auto_19262 ) ) ( not ( = ?auto_19277 ?auto_19272 ) ) ( not ( = ?auto_19277 ?auto_19290 ) ) ( not ( = ?auto_19240 ?auto_19250 ) ) ( not ( = ?auto_19240 ?auto_19289 ) ) ( not ( = ?auto_19241 ?auto_19250 ) ) ( not ( = ?auto_19241 ?auto_19289 ) ) ( not ( = ?auto_19242 ?auto_19250 ) ) ( not ( = ?auto_19242 ?auto_19289 ) ) ( not ( = ?auto_19243 ?auto_19250 ) ) ( not ( = ?auto_19243 ?auto_19289 ) ) ( not ( = ?auto_19244 ?auto_19250 ) ) ( not ( = ?auto_19244 ?auto_19289 ) ) ( not ( = ?auto_19245 ?auto_19250 ) ) ( not ( = ?auto_19245 ?auto_19289 ) ) ( not ( = ?auto_19246 ?auto_19250 ) ) ( not ( = ?auto_19246 ?auto_19289 ) ) ( not ( = ?auto_19247 ?auto_19250 ) ) ( not ( = ?auto_19247 ?auto_19289 ) ) ( not ( = ?auto_19248 ?auto_19250 ) ) ( not ( = ?auto_19248 ?auto_19289 ) ) ( not ( = ?auto_19250 ?auto_19277 ) ) ( not ( = ?auto_19250 ?auto_19269 ) ) ( not ( = ?auto_19250 ?auto_19264 ) ) ( not ( = ?auto_19250 ?auto_19273 ) ) ( not ( = ?auto_19250 ?auto_19288 ) ) ( not ( = ?auto_19250 ?auto_19274 ) ) ( not ( = ?auto_19250 ?auto_19262 ) ) ( not ( = ?auto_19250 ?auto_19272 ) ) ( not ( = ?auto_19250 ?auto_19290 ) ) ( not ( = ?auto_19289 ?auto_19277 ) ) ( not ( = ?auto_19289 ?auto_19269 ) ) ( not ( = ?auto_19289 ?auto_19264 ) ) ( not ( = ?auto_19289 ?auto_19273 ) ) ( not ( = ?auto_19289 ?auto_19288 ) ) ( not ( = ?auto_19289 ?auto_19274 ) ) ( not ( = ?auto_19289 ?auto_19262 ) ) ( not ( = ?auto_19289 ?auto_19272 ) ) ( not ( = ?auto_19289 ?auto_19290 ) ) ( not ( = ?auto_19240 ?auto_19251 ) ) ( not ( = ?auto_19240 ?auto_19263 ) ) ( not ( = ?auto_19241 ?auto_19251 ) ) ( not ( = ?auto_19241 ?auto_19263 ) ) ( not ( = ?auto_19242 ?auto_19251 ) ) ( not ( = ?auto_19242 ?auto_19263 ) ) ( not ( = ?auto_19243 ?auto_19251 ) ) ( not ( = ?auto_19243 ?auto_19263 ) ) ( not ( = ?auto_19244 ?auto_19251 ) ) ( not ( = ?auto_19244 ?auto_19263 ) ) ( not ( = ?auto_19245 ?auto_19251 ) ) ( not ( = ?auto_19245 ?auto_19263 ) ) ( not ( = ?auto_19246 ?auto_19251 ) ) ( not ( = ?auto_19246 ?auto_19263 ) ) ( not ( = ?auto_19247 ?auto_19251 ) ) ( not ( = ?auto_19247 ?auto_19263 ) ) ( not ( = ?auto_19248 ?auto_19251 ) ) ( not ( = ?auto_19248 ?auto_19263 ) ) ( not ( = ?auto_19249 ?auto_19251 ) ) ( not ( = ?auto_19249 ?auto_19263 ) ) ( not ( = ?auto_19251 ?auto_19289 ) ) ( not ( = ?auto_19251 ?auto_19277 ) ) ( not ( = ?auto_19251 ?auto_19269 ) ) ( not ( = ?auto_19251 ?auto_19264 ) ) ( not ( = ?auto_19251 ?auto_19273 ) ) ( not ( = ?auto_19251 ?auto_19288 ) ) ( not ( = ?auto_19251 ?auto_19274 ) ) ( not ( = ?auto_19251 ?auto_19262 ) ) ( not ( = ?auto_19251 ?auto_19272 ) ) ( not ( = ?auto_19251 ?auto_19290 ) ) ( not ( = ?auto_19281 ?auto_19270 ) ) ( not ( = ?auto_19281 ?auto_19266 ) ) ( not ( = ?auto_19281 ?auto_19268 ) ) ( not ( = ?auto_19281 ?auto_19275 ) ) ( not ( = ?auto_19281 ?auto_19261 ) ) ( not ( = ?auto_19281 ?auto_19265 ) ) ( not ( = ?auto_19281 ?auto_19291 ) ) ( not ( = ?auto_19285 ?auto_19271 ) ) ( not ( = ?auto_19285 ?auto_19283 ) ) ( not ( = ?auto_19285 ?auto_19282 ) ) ( not ( = ?auto_19285 ?auto_19287 ) ) ( not ( = ?auto_19285 ?auto_19286 ) ) ( not ( = ?auto_19285 ?auto_19279 ) ) ( not ( = ?auto_19285 ?auto_19284 ) ) ( not ( = ?auto_19263 ?auto_19289 ) ) ( not ( = ?auto_19263 ?auto_19277 ) ) ( not ( = ?auto_19263 ?auto_19269 ) ) ( not ( = ?auto_19263 ?auto_19264 ) ) ( not ( = ?auto_19263 ?auto_19273 ) ) ( not ( = ?auto_19263 ?auto_19288 ) ) ( not ( = ?auto_19263 ?auto_19274 ) ) ( not ( = ?auto_19263 ?auto_19262 ) ) ( not ( = ?auto_19263 ?auto_19272 ) ) ( not ( = ?auto_19263 ?auto_19290 ) ) ( not ( = ?auto_19240 ?auto_19252 ) ) ( not ( = ?auto_19240 ?auto_19267 ) ) ( not ( = ?auto_19241 ?auto_19252 ) ) ( not ( = ?auto_19241 ?auto_19267 ) ) ( not ( = ?auto_19242 ?auto_19252 ) ) ( not ( = ?auto_19242 ?auto_19267 ) ) ( not ( = ?auto_19243 ?auto_19252 ) ) ( not ( = ?auto_19243 ?auto_19267 ) ) ( not ( = ?auto_19244 ?auto_19252 ) ) ( not ( = ?auto_19244 ?auto_19267 ) ) ( not ( = ?auto_19245 ?auto_19252 ) ) ( not ( = ?auto_19245 ?auto_19267 ) ) ( not ( = ?auto_19246 ?auto_19252 ) ) ( not ( = ?auto_19246 ?auto_19267 ) ) ( not ( = ?auto_19247 ?auto_19252 ) ) ( not ( = ?auto_19247 ?auto_19267 ) ) ( not ( = ?auto_19248 ?auto_19252 ) ) ( not ( = ?auto_19248 ?auto_19267 ) ) ( not ( = ?auto_19249 ?auto_19252 ) ) ( not ( = ?auto_19249 ?auto_19267 ) ) ( not ( = ?auto_19250 ?auto_19252 ) ) ( not ( = ?auto_19250 ?auto_19267 ) ) ( not ( = ?auto_19252 ?auto_19263 ) ) ( not ( = ?auto_19252 ?auto_19289 ) ) ( not ( = ?auto_19252 ?auto_19277 ) ) ( not ( = ?auto_19252 ?auto_19269 ) ) ( not ( = ?auto_19252 ?auto_19264 ) ) ( not ( = ?auto_19252 ?auto_19273 ) ) ( not ( = ?auto_19252 ?auto_19288 ) ) ( not ( = ?auto_19252 ?auto_19274 ) ) ( not ( = ?auto_19252 ?auto_19262 ) ) ( not ( = ?auto_19252 ?auto_19272 ) ) ( not ( = ?auto_19252 ?auto_19290 ) ) ( not ( = ?auto_19280 ?auto_19281 ) ) ( not ( = ?auto_19280 ?auto_19270 ) ) ( not ( = ?auto_19280 ?auto_19266 ) ) ( not ( = ?auto_19280 ?auto_19268 ) ) ( not ( = ?auto_19280 ?auto_19275 ) ) ( not ( = ?auto_19280 ?auto_19261 ) ) ( not ( = ?auto_19280 ?auto_19265 ) ) ( not ( = ?auto_19280 ?auto_19291 ) ) ( not ( = ?auto_19278 ?auto_19285 ) ) ( not ( = ?auto_19278 ?auto_19271 ) ) ( not ( = ?auto_19278 ?auto_19283 ) ) ( not ( = ?auto_19278 ?auto_19282 ) ) ( not ( = ?auto_19278 ?auto_19287 ) ) ( not ( = ?auto_19278 ?auto_19286 ) ) ( not ( = ?auto_19278 ?auto_19279 ) ) ( not ( = ?auto_19278 ?auto_19284 ) ) ( not ( = ?auto_19267 ?auto_19263 ) ) ( not ( = ?auto_19267 ?auto_19289 ) ) ( not ( = ?auto_19267 ?auto_19277 ) ) ( not ( = ?auto_19267 ?auto_19269 ) ) ( not ( = ?auto_19267 ?auto_19264 ) ) ( not ( = ?auto_19267 ?auto_19273 ) ) ( not ( = ?auto_19267 ?auto_19288 ) ) ( not ( = ?auto_19267 ?auto_19274 ) ) ( not ( = ?auto_19267 ?auto_19262 ) ) ( not ( = ?auto_19267 ?auto_19272 ) ) ( not ( = ?auto_19267 ?auto_19290 ) ) ( not ( = ?auto_19240 ?auto_19254 ) ) ( not ( = ?auto_19240 ?auto_19276 ) ) ( not ( = ?auto_19241 ?auto_19254 ) ) ( not ( = ?auto_19241 ?auto_19276 ) ) ( not ( = ?auto_19242 ?auto_19254 ) ) ( not ( = ?auto_19242 ?auto_19276 ) ) ( not ( = ?auto_19243 ?auto_19254 ) ) ( not ( = ?auto_19243 ?auto_19276 ) ) ( not ( = ?auto_19244 ?auto_19254 ) ) ( not ( = ?auto_19244 ?auto_19276 ) ) ( not ( = ?auto_19245 ?auto_19254 ) ) ( not ( = ?auto_19245 ?auto_19276 ) ) ( not ( = ?auto_19246 ?auto_19254 ) ) ( not ( = ?auto_19246 ?auto_19276 ) ) ( not ( = ?auto_19247 ?auto_19254 ) ) ( not ( = ?auto_19247 ?auto_19276 ) ) ( not ( = ?auto_19248 ?auto_19254 ) ) ( not ( = ?auto_19248 ?auto_19276 ) ) ( not ( = ?auto_19249 ?auto_19254 ) ) ( not ( = ?auto_19249 ?auto_19276 ) ) ( not ( = ?auto_19250 ?auto_19254 ) ) ( not ( = ?auto_19250 ?auto_19276 ) ) ( not ( = ?auto_19251 ?auto_19254 ) ) ( not ( = ?auto_19251 ?auto_19276 ) ) ( not ( = ?auto_19254 ?auto_19267 ) ) ( not ( = ?auto_19254 ?auto_19263 ) ) ( not ( = ?auto_19254 ?auto_19289 ) ) ( not ( = ?auto_19254 ?auto_19277 ) ) ( not ( = ?auto_19254 ?auto_19269 ) ) ( not ( = ?auto_19254 ?auto_19264 ) ) ( not ( = ?auto_19254 ?auto_19273 ) ) ( not ( = ?auto_19254 ?auto_19288 ) ) ( not ( = ?auto_19254 ?auto_19274 ) ) ( not ( = ?auto_19254 ?auto_19262 ) ) ( not ( = ?auto_19254 ?auto_19272 ) ) ( not ( = ?auto_19254 ?auto_19290 ) ) ( not ( = ?auto_19276 ?auto_19267 ) ) ( not ( = ?auto_19276 ?auto_19263 ) ) ( not ( = ?auto_19276 ?auto_19289 ) ) ( not ( = ?auto_19276 ?auto_19277 ) ) ( not ( = ?auto_19276 ?auto_19269 ) ) ( not ( = ?auto_19276 ?auto_19264 ) ) ( not ( = ?auto_19276 ?auto_19273 ) ) ( not ( = ?auto_19276 ?auto_19288 ) ) ( not ( = ?auto_19276 ?auto_19274 ) ) ( not ( = ?auto_19276 ?auto_19262 ) ) ( not ( = ?auto_19276 ?auto_19272 ) ) ( not ( = ?auto_19276 ?auto_19290 ) ) ( not ( = ?auto_19240 ?auto_19253 ) ) ( not ( = ?auto_19240 ?auto_19259 ) ) ( not ( = ?auto_19241 ?auto_19253 ) ) ( not ( = ?auto_19241 ?auto_19259 ) ) ( not ( = ?auto_19242 ?auto_19253 ) ) ( not ( = ?auto_19242 ?auto_19259 ) ) ( not ( = ?auto_19243 ?auto_19253 ) ) ( not ( = ?auto_19243 ?auto_19259 ) ) ( not ( = ?auto_19244 ?auto_19253 ) ) ( not ( = ?auto_19244 ?auto_19259 ) ) ( not ( = ?auto_19245 ?auto_19253 ) ) ( not ( = ?auto_19245 ?auto_19259 ) ) ( not ( = ?auto_19246 ?auto_19253 ) ) ( not ( = ?auto_19246 ?auto_19259 ) ) ( not ( = ?auto_19247 ?auto_19253 ) ) ( not ( = ?auto_19247 ?auto_19259 ) ) ( not ( = ?auto_19248 ?auto_19253 ) ) ( not ( = ?auto_19248 ?auto_19259 ) ) ( not ( = ?auto_19249 ?auto_19253 ) ) ( not ( = ?auto_19249 ?auto_19259 ) ) ( not ( = ?auto_19250 ?auto_19253 ) ) ( not ( = ?auto_19250 ?auto_19259 ) ) ( not ( = ?auto_19251 ?auto_19253 ) ) ( not ( = ?auto_19251 ?auto_19259 ) ) ( not ( = ?auto_19252 ?auto_19253 ) ) ( not ( = ?auto_19252 ?auto_19259 ) ) ( not ( = ?auto_19253 ?auto_19276 ) ) ( not ( = ?auto_19253 ?auto_19267 ) ) ( not ( = ?auto_19253 ?auto_19263 ) ) ( not ( = ?auto_19253 ?auto_19289 ) ) ( not ( = ?auto_19253 ?auto_19277 ) ) ( not ( = ?auto_19253 ?auto_19269 ) ) ( not ( = ?auto_19253 ?auto_19264 ) ) ( not ( = ?auto_19253 ?auto_19273 ) ) ( not ( = ?auto_19253 ?auto_19288 ) ) ( not ( = ?auto_19253 ?auto_19274 ) ) ( not ( = ?auto_19253 ?auto_19262 ) ) ( not ( = ?auto_19253 ?auto_19272 ) ) ( not ( = ?auto_19253 ?auto_19290 ) ) ( not ( = ?auto_19258 ?auto_19261 ) ) ( not ( = ?auto_19258 ?auto_19280 ) ) ( not ( = ?auto_19258 ?auto_19281 ) ) ( not ( = ?auto_19258 ?auto_19270 ) ) ( not ( = ?auto_19258 ?auto_19266 ) ) ( not ( = ?auto_19258 ?auto_19268 ) ) ( not ( = ?auto_19258 ?auto_19275 ) ) ( not ( = ?auto_19258 ?auto_19265 ) ) ( not ( = ?auto_19258 ?auto_19291 ) ) ( not ( = ?auto_19256 ?auto_19286 ) ) ( not ( = ?auto_19256 ?auto_19278 ) ) ( not ( = ?auto_19256 ?auto_19285 ) ) ( not ( = ?auto_19256 ?auto_19271 ) ) ( not ( = ?auto_19256 ?auto_19283 ) ) ( not ( = ?auto_19256 ?auto_19282 ) ) ( not ( = ?auto_19256 ?auto_19287 ) ) ( not ( = ?auto_19256 ?auto_19279 ) ) ( not ( = ?auto_19256 ?auto_19284 ) ) ( not ( = ?auto_19259 ?auto_19276 ) ) ( not ( = ?auto_19259 ?auto_19267 ) ) ( not ( = ?auto_19259 ?auto_19263 ) ) ( not ( = ?auto_19259 ?auto_19289 ) ) ( not ( = ?auto_19259 ?auto_19277 ) ) ( not ( = ?auto_19259 ?auto_19269 ) ) ( not ( = ?auto_19259 ?auto_19264 ) ) ( not ( = ?auto_19259 ?auto_19273 ) ) ( not ( = ?auto_19259 ?auto_19288 ) ) ( not ( = ?auto_19259 ?auto_19274 ) ) ( not ( = ?auto_19259 ?auto_19262 ) ) ( not ( = ?auto_19259 ?auto_19272 ) ) ( not ( = ?auto_19259 ?auto_19290 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_19240 ?auto_19241 ?auto_19242 ?auto_19243 ?auto_19244 ?auto_19245 ?auto_19246 ?auto_19247 ?auto_19248 ?auto_19249 ?auto_19250 ?auto_19251 ?auto_19252 ?auto_19254 )
      ( MAKE-1CRATE ?auto_19254 ?auto_19253 )
      ( MAKE-14CRATE-VERIFY ?auto_19240 ?auto_19241 ?auto_19242 ?auto_19243 ?auto_19244 ?auto_19245 ?auto_19246 ?auto_19247 ?auto_19248 ?auto_19249 ?auto_19250 ?auto_19251 ?auto_19252 ?auto_19254 ?auto_19253 ) )
  )

)

