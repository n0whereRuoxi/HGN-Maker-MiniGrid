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
      ?auto_1342648 - SURFACE
      ?auto_1342649 - SURFACE
    )
    :vars
    (
      ?auto_1342650 - HOIST
      ?auto_1342651 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342650 ?auto_1342651 ) ( SURFACE-AT ?auto_1342648 ?auto_1342651 ) ( CLEAR ?auto_1342648 ) ( LIFTING ?auto_1342650 ?auto_1342649 ) ( IS-CRATE ?auto_1342649 ) ( not ( = ?auto_1342648 ?auto_1342649 ) ) )
    :subtasks
    ( ( !DROP ?auto_1342650 ?auto_1342649 ?auto_1342648 ?auto_1342651 )
      ( MAKE-1CRATE-VERIFY ?auto_1342648 ?auto_1342649 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1342652 - SURFACE
      ?auto_1342653 - SURFACE
    )
    :vars
    (
      ?auto_1342655 - HOIST
      ?auto_1342654 - PLACE
      ?auto_1342656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342655 ?auto_1342654 ) ( SURFACE-AT ?auto_1342652 ?auto_1342654 ) ( CLEAR ?auto_1342652 ) ( IS-CRATE ?auto_1342653 ) ( not ( = ?auto_1342652 ?auto_1342653 ) ) ( TRUCK-AT ?auto_1342656 ?auto_1342654 ) ( AVAILABLE ?auto_1342655 ) ( IN ?auto_1342653 ?auto_1342656 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1342655 ?auto_1342653 ?auto_1342656 ?auto_1342654 )
      ( MAKE-1CRATE ?auto_1342652 ?auto_1342653 )
      ( MAKE-1CRATE-VERIFY ?auto_1342652 ?auto_1342653 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1342657 - SURFACE
      ?auto_1342658 - SURFACE
    )
    :vars
    (
      ?auto_1342659 - HOIST
      ?auto_1342660 - PLACE
      ?auto_1342661 - TRUCK
      ?auto_1342662 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342659 ?auto_1342660 ) ( SURFACE-AT ?auto_1342657 ?auto_1342660 ) ( CLEAR ?auto_1342657 ) ( IS-CRATE ?auto_1342658 ) ( not ( = ?auto_1342657 ?auto_1342658 ) ) ( AVAILABLE ?auto_1342659 ) ( IN ?auto_1342658 ?auto_1342661 ) ( TRUCK-AT ?auto_1342661 ?auto_1342662 ) ( not ( = ?auto_1342662 ?auto_1342660 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1342661 ?auto_1342662 ?auto_1342660 )
      ( MAKE-1CRATE ?auto_1342657 ?auto_1342658 )
      ( MAKE-1CRATE-VERIFY ?auto_1342657 ?auto_1342658 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1342663 - SURFACE
      ?auto_1342664 - SURFACE
    )
    :vars
    (
      ?auto_1342665 - HOIST
      ?auto_1342667 - PLACE
      ?auto_1342668 - TRUCK
      ?auto_1342666 - PLACE
      ?auto_1342669 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342665 ?auto_1342667 ) ( SURFACE-AT ?auto_1342663 ?auto_1342667 ) ( CLEAR ?auto_1342663 ) ( IS-CRATE ?auto_1342664 ) ( not ( = ?auto_1342663 ?auto_1342664 ) ) ( AVAILABLE ?auto_1342665 ) ( TRUCK-AT ?auto_1342668 ?auto_1342666 ) ( not ( = ?auto_1342666 ?auto_1342667 ) ) ( HOIST-AT ?auto_1342669 ?auto_1342666 ) ( LIFTING ?auto_1342669 ?auto_1342664 ) ( not ( = ?auto_1342665 ?auto_1342669 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1342669 ?auto_1342664 ?auto_1342668 ?auto_1342666 )
      ( MAKE-1CRATE ?auto_1342663 ?auto_1342664 )
      ( MAKE-1CRATE-VERIFY ?auto_1342663 ?auto_1342664 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1342670 - SURFACE
      ?auto_1342671 - SURFACE
    )
    :vars
    (
      ?auto_1342676 - HOIST
      ?auto_1342675 - PLACE
      ?auto_1342673 - TRUCK
      ?auto_1342672 - PLACE
      ?auto_1342674 - HOIST
      ?auto_1342677 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342676 ?auto_1342675 ) ( SURFACE-AT ?auto_1342670 ?auto_1342675 ) ( CLEAR ?auto_1342670 ) ( IS-CRATE ?auto_1342671 ) ( not ( = ?auto_1342670 ?auto_1342671 ) ) ( AVAILABLE ?auto_1342676 ) ( TRUCK-AT ?auto_1342673 ?auto_1342672 ) ( not ( = ?auto_1342672 ?auto_1342675 ) ) ( HOIST-AT ?auto_1342674 ?auto_1342672 ) ( not ( = ?auto_1342676 ?auto_1342674 ) ) ( AVAILABLE ?auto_1342674 ) ( SURFACE-AT ?auto_1342671 ?auto_1342672 ) ( ON ?auto_1342671 ?auto_1342677 ) ( CLEAR ?auto_1342671 ) ( not ( = ?auto_1342670 ?auto_1342677 ) ) ( not ( = ?auto_1342671 ?auto_1342677 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1342674 ?auto_1342671 ?auto_1342677 ?auto_1342672 )
      ( MAKE-1CRATE ?auto_1342670 ?auto_1342671 )
      ( MAKE-1CRATE-VERIFY ?auto_1342670 ?auto_1342671 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1342678 - SURFACE
      ?auto_1342679 - SURFACE
    )
    :vars
    (
      ?auto_1342683 - HOIST
      ?auto_1342685 - PLACE
      ?auto_1342684 - PLACE
      ?auto_1342681 - HOIST
      ?auto_1342682 - SURFACE
      ?auto_1342680 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342683 ?auto_1342685 ) ( SURFACE-AT ?auto_1342678 ?auto_1342685 ) ( CLEAR ?auto_1342678 ) ( IS-CRATE ?auto_1342679 ) ( not ( = ?auto_1342678 ?auto_1342679 ) ) ( AVAILABLE ?auto_1342683 ) ( not ( = ?auto_1342684 ?auto_1342685 ) ) ( HOIST-AT ?auto_1342681 ?auto_1342684 ) ( not ( = ?auto_1342683 ?auto_1342681 ) ) ( AVAILABLE ?auto_1342681 ) ( SURFACE-AT ?auto_1342679 ?auto_1342684 ) ( ON ?auto_1342679 ?auto_1342682 ) ( CLEAR ?auto_1342679 ) ( not ( = ?auto_1342678 ?auto_1342682 ) ) ( not ( = ?auto_1342679 ?auto_1342682 ) ) ( TRUCK-AT ?auto_1342680 ?auto_1342685 ) )
    :subtasks
    ( ( !DRIVE ?auto_1342680 ?auto_1342685 ?auto_1342684 )
      ( MAKE-1CRATE ?auto_1342678 ?auto_1342679 )
      ( MAKE-1CRATE-VERIFY ?auto_1342678 ?auto_1342679 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1342695 - SURFACE
      ?auto_1342696 - SURFACE
      ?auto_1342697 - SURFACE
    )
    :vars
    (
      ?auto_1342699 - HOIST
      ?auto_1342698 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342699 ?auto_1342698 ) ( SURFACE-AT ?auto_1342696 ?auto_1342698 ) ( CLEAR ?auto_1342696 ) ( LIFTING ?auto_1342699 ?auto_1342697 ) ( IS-CRATE ?auto_1342697 ) ( not ( = ?auto_1342696 ?auto_1342697 ) ) ( ON ?auto_1342696 ?auto_1342695 ) ( not ( = ?auto_1342695 ?auto_1342696 ) ) ( not ( = ?auto_1342695 ?auto_1342697 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1342696 ?auto_1342697 )
      ( MAKE-2CRATE-VERIFY ?auto_1342695 ?auto_1342696 ?auto_1342697 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1342705 - SURFACE
      ?auto_1342706 - SURFACE
      ?auto_1342707 - SURFACE
    )
    :vars
    (
      ?auto_1342708 - HOIST
      ?auto_1342710 - PLACE
      ?auto_1342709 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342708 ?auto_1342710 ) ( SURFACE-AT ?auto_1342706 ?auto_1342710 ) ( CLEAR ?auto_1342706 ) ( IS-CRATE ?auto_1342707 ) ( not ( = ?auto_1342706 ?auto_1342707 ) ) ( TRUCK-AT ?auto_1342709 ?auto_1342710 ) ( AVAILABLE ?auto_1342708 ) ( IN ?auto_1342707 ?auto_1342709 ) ( ON ?auto_1342706 ?auto_1342705 ) ( not ( = ?auto_1342705 ?auto_1342706 ) ) ( not ( = ?auto_1342705 ?auto_1342707 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1342706 ?auto_1342707 )
      ( MAKE-2CRATE-VERIFY ?auto_1342705 ?auto_1342706 ?auto_1342707 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1342711 - SURFACE
      ?auto_1342712 - SURFACE
    )
    :vars
    (
      ?auto_1342715 - HOIST
      ?auto_1342714 - PLACE
      ?auto_1342713 - TRUCK
      ?auto_1342716 - SURFACE
      ?auto_1342717 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342715 ?auto_1342714 ) ( SURFACE-AT ?auto_1342711 ?auto_1342714 ) ( CLEAR ?auto_1342711 ) ( IS-CRATE ?auto_1342712 ) ( not ( = ?auto_1342711 ?auto_1342712 ) ) ( AVAILABLE ?auto_1342715 ) ( IN ?auto_1342712 ?auto_1342713 ) ( ON ?auto_1342711 ?auto_1342716 ) ( not ( = ?auto_1342716 ?auto_1342711 ) ) ( not ( = ?auto_1342716 ?auto_1342712 ) ) ( TRUCK-AT ?auto_1342713 ?auto_1342717 ) ( not ( = ?auto_1342717 ?auto_1342714 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1342713 ?auto_1342717 ?auto_1342714 )
      ( MAKE-2CRATE ?auto_1342716 ?auto_1342711 ?auto_1342712 )
      ( MAKE-1CRATE-VERIFY ?auto_1342711 ?auto_1342712 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1342718 - SURFACE
      ?auto_1342719 - SURFACE
      ?auto_1342720 - SURFACE
    )
    :vars
    (
      ?auto_1342723 - HOIST
      ?auto_1342722 - PLACE
      ?auto_1342724 - TRUCK
      ?auto_1342721 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342723 ?auto_1342722 ) ( SURFACE-AT ?auto_1342719 ?auto_1342722 ) ( CLEAR ?auto_1342719 ) ( IS-CRATE ?auto_1342720 ) ( not ( = ?auto_1342719 ?auto_1342720 ) ) ( AVAILABLE ?auto_1342723 ) ( IN ?auto_1342720 ?auto_1342724 ) ( ON ?auto_1342719 ?auto_1342718 ) ( not ( = ?auto_1342718 ?auto_1342719 ) ) ( not ( = ?auto_1342718 ?auto_1342720 ) ) ( TRUCK-AT ?auto_1342724 ?auto_1342721 ) ( not ( = ?auto_1342721 ?auto_1342722 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1342719 ?auto_1342720 )
      ( MAKE-2CRATE-VERIFY ?auto_1342718 ?auto_1342719 ?auto_1342720 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1342725 - SURFACE
      ?auto_1342726 - SURFACE
    )
    :vars
    (
      ?auto_1342731 - HOIST
      ?auto_1342728 - PLACE
      ?auto_1342730 - SURFACE
      ?auto_1342729 - TRUCK
      ?auto_1342727 - PLACE
      ?auto_1342732 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342731 ?auto_1342728 ) ( SURFACE-AT ?auto_1342725 ?auto_1342728 ) ( CLEAR ?auto_1342725 ) ( IS-CRATE ?auto_1342726 ) ( not ( = ?auto_1342725 ?auto_1342726 ) ) ( AVAILABLE ?auto_1342731 ) ( ON ?auto_1342725 ?auto_1342730 ) ( not ( = ?auto_1342730 ?auto_1342725 ) ) ( not ( = ?auto_1342730 ?auto_1342726 ) ) ( TRUCK-AT ?auto_1342729 ?auto_1342727 ) ( not ( = ?auto_1342727 ?auto_1342728 ) ) ( HOIST-AT ?auto_1342732 ?auto_1342727 ) ( LIFTING ?auto_1342732 ?auto_1342726 ) ( not ( = ?auto_1342731 ?auto_1342732 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1342732 ?auto_1342726 ?auto_1342729 ?auto_1342727 )
      ( MAKE-2CRATE ?auto_1342730 ?auto_1342725 ?auto_1342726 )
      ( MAKE-1CRATE-VERIFY ?auto_1342725 ?auto_1342726 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1342733 - SURFACE
      ?auto_1342734 - SURFACE
      ?auto_1342735 - SURFACE
    )
    :vars
    (
      ?auto_1342740 - HOIST
      ?auto_1342736 - PLACE
      ?auto_1342738 - TRUCK
      ?auto_1342737 - PLACE
      ?auto_1342739 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342740 ?auto_1342736 ) ( SURFACE-AT ?auto_1342734 ?auto_1342736 ) ( CLEAR ?auto_1342734 ) ( IS-CRATE ?auto_1342735 ) ( not ( = ?auto_1342734 ?auto_1342735 ) ) ( AVAILABLE ?auto_1342740 ) ( ON ?auto_1342734 ?auto_1342733 ) ( not ( = ?auto_1342733 ?auto_1342734 ) ) ( not ( = ?auto_1342733 ?auto_1342735 ) ) ( TRUCK-AT ?auto_1342738 ?auto_1342737 ) ( not ( = ?auto_1342737 ?auto_1342736 ) ) ( HOIST-AT ?auto_1342739 ?auto_1342737 ) ( LIFTING ?auto_1342739 ?auto_1342735 ) ( not ( = ?auto_1342740 ?auto_1342739 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1342734 ?auto_1342735 )
      ( MAKE-2CRATE-VERIFY ?auto_1342733 ?auto_1342734 ?auto_1342735 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1342741 - SURFACE
      ?auto_1342742 - SURFACE
    )
    :vars
    (
      ?auto_1342744 - HOIST
      ?auto_1342748 - PLACE
      ?auto_1342745 - SURFACE
      ?auto_1342743 - TRUCK
      ?auto_1342747 - PLACE
      ?auto_1342746 - HOIST
      ?auto_1342749 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342744 ?auto_1342748 ) ( SURFACE-AT ?auto_1342741 ?auto_1342748 ) ( CLEAR ?auto_1342741 ) ( IS-CRATE ?auto_1342742 ) ( not ( = ?auto_1342741 ?auto_1342742 ) ) ( AVAILABLE ?auto_1342744 ) ( ON ?auto_1342741 ?auto_1342745 ) ( not ( = ?auto_1342745 ?auto_1342741 ) ) ( not ( = ?auto_1342745 ?auto_1342742 ) ) ( TRUCK-AT ?auto_1342743 ?auto_1342747 ) ( not ( = ?auto_1342747 ?auto_1342748 ) ) ( HOIST-AT ?auto_1342746 ?auto_1342747 ) ( not ( = ?auto_1342744 ?auto_1342746 ) ) ( AVAILABLE ?auto_1342746 ) ( SURFACE-AT ?auto_1342742 ?auto_1342747 ) ( ON ?auto_1342742 ?auto_1342749 ) ( CLEAR ?auto_1342742 ) ( not ( = ?auto_1342741 ?auto_1342749 ) ) ( not ( = ?auto_1342742 ?auto_1342749 ) ) ( not ( = ?auto_1342745 ?auto_1342749 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1342746 ?auto_1342742 ?auto_1342749 ?auto_1342747 )
      ( MAKE-2CRATE ?auto_1342745 ?auto_1342741 ?auto_1342742 )
      ( MAKE-1CRATE-VERIFY ?auto_1342741 ?auto_1342742 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1342750 - SURFACE
      ?auto_1342751 - SURFACE
      ?auto_1342752 - SURFACE
    )
    :vars
    (
      ?auto_1342758 - HOIST
      ?auto_1342755 - PLACE
      ?auto_1342753 - TRUCK
      ?auto_1342757 - PLACE
      ?auto_1342756 - HOIST
      ?auto_1342754 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342758 ?auto_1342755 ) ( SURFACE-AT ?auto_1342751 ?auto_1342755 ) ( CLEAR ?auto_1342751 ) ( IS-CRATE ?auto_1342752 ) ( not ( = ?auto_1342751 ?auto_1342752 ) ) ( AVAILABLE ?auto_1342758 ) ( ON ?auto_1342751 ?auto_1342750 ) ( not ( = ?auto_1342750 ?auto_1342751 ) ) ( not ( = ?auto_1342750 ?auto_1342752 ) ) ( TRUCK-AT ?auto_1342753 ?auto_1342757 ) ( not ( = ?auto_1342757 ?auto_1342755 ) ) ( HOIST-AT ?auto_1342756 ?auto_1342757 ) ( not ( = ?auto_1342758 ?auto_1342756 ) ) ( AVAILABLE ?auto_1342756 ) ( SURFACE-AT ?auto_1342752 ?auto_1342757 ) ( ON ?auto_1342752 ?auto_1342754 ) ( CLEAR ?auto_1342752 ) ( not ( = ?auto_1342751 ?auto_1342754 ) ) ( not ( = ?auto_1342752 ?auto_1342754 ) ) ( not ( = ?auto_1342750 ?auto_1342754 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1342751 ?auto_1342752 )
      ( MAKE-2CRATE-VERIFY ?auto_1342750 ?auto_1342751 ?auto_1342752 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1342759 - SURFACE
      ?auto_1342760 - SURFACE
    )
    :vars
    (
      ?auto_1342763 - HOIST
      ?auto_1342761 - PLACE
      ?auto_1342764 - SURFACE
      ?auto_1342767 - PLACE
      ?auto_1342762 - HOIST
      ?auto_1342765 - SURFACE
      ?auto_1342766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342763 ?auto_1342761 ) ( SURFACE-AT ?auto_1342759 ?auto_1342761 ) ( CLEAR ?auto_1342759 ) ( IS-CRATE ?auto_1342760 ) ( not ( = ?auto_1342759 ?auto_1342760 ) ) ( AVAILABLE ?auto_1342763 ) ( ON ?auto_1342759 ?auto_1342764 ) ( not ( = ?auto_1342764 ?auto_1342759 ) ) ( not ( = ?auto_1342764 ?auto_1342760 ) ) ( not ( = ?auto_1342767 ?auto_1342761 ) ) ( HOIST-AT ?auto_1342762 ?auto_1342767 ) ( not ( = ?auto_1342763 ?auto_1342762 ) ) ( AVAILABLE ?auto_1342762 ) ( SURFACE-AT ?auto_1342760 ?auto_1342767 ) ( ON ?auto_1342760 ?auto_1342765 ) ( CLEAR ?auto_1342760 ) ( not ( = ?auto_1342759 ?auto_1342765 ) ) ( not ( = ?auto_1342760 ?auto_1342765 ) ) ( not ( = ?auto_1342764 ?auto_1342765 ) ) ( TRUCK-AT ?auto_1342766 ?auto_1342761 ) )
    :subtasks
    ( ( !DRIVE ?auto_1342766 ?auto_1342761 ?auto_1342767 )
      ( MAKE-2CRATE ?auto_1342764 ?auto_1342759 ?auto_1342760 )
      ( MAKE-1CRATE-VERIFY ?auto_1342759 ?auto_1342760 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1342768 - SURFACE
      ?auto_1342769 - SURFACE
      ?auto_1342770 - SURFACE
    )
    :vars
    (
      ?auto_1342776 - HOIST
      ?auto_1342772 - PLACE
      ?auto_1342774 - PLACE
      ?auto_1342773 - HOIST
      ?auto_1342775 - SURFACE
      ?auto_1342771 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342776 ?auto_1342772 ) ( SURFACE-AT ?auto_1342769 ?auto_1342772 ) ( CLEAR ?auto_1342769 ) ( IS-CRATE ?auto_1342770 ) ( not ( = ?auto_1342769 ?auto_1342770 ) ) ( AVAILABLE ?auto_1342776 ) ( ON ?auto_1342769 ?auto_1342768 ) ( not ( = ?auto_1342768 ?auto_1342769 ) ) ( not ( = ?auto_1342768 ?auto_1342770 ) ) ( not ( = ?auto_1342774 ?auto_1342772 ) ) ( HOIST-AT ?auto_1342773 ?auto_1342774 ) ( not ( = ?auto_1342776 ?auto_1342773 ) ) ( AVAILABLE ?auto_1342773 ) ( SURFACE-AT ?auto_1342770 ?auto_1342774 ) ( ON ?auto_1342770 ?auto_1342775 ) ( CLEAR ?auto_1342770 ) ( not ( = ?auto_1342769 ?auto_1342775 ) ) ( not ( = ?auto_1342770 ?auto_1342775 ) ) ( not ( = ?auto_1342768 ?auto_1342775 ) ) ( TRUCK-AT ?auto_1342771 ?auto_1342772 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1342769 ?auto_1342770 )
      ( MAKE-2CRATE-VERIFY ?auto_1342768 ?auto_1342769 ?auto_1342770 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1342777 - SURFACE
      ?auto_1342778 - SURFACE
    )
    :vars
    (
      ?auto_1342783 - HOIST
      ?auto_1342784 - PLACE
      ?auto_1342785 - SURFACE
      ?auto_1342780 - PLACE
      ?auto_1342779 - HOIST
      ?auto_1342782 - SURFACE
      ?auto_1342781 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342783 ?auto_1342784 ) ( IS-CRATE ?auto_1342778 ) ( not ( = ?auto_1342777 ?auto_1342778 ) ) ( not ( = ?auto_1342785 ?auto_1342777 ) ) ( not ( = ?auto_1342785 ?auto_1342778 ) ) ( not ( = ?auto_1342780 ?auto_1342784 ) ) ( HOIST-AT ?auto_1342779 ?auto_1342780 ) ( not ( = ?auto_1342783 ?auto_1342779 ) ) ( AVAILABLE ?auto_1342779 ) ( SURFACE-AT ?auto_1342778 ?auto_1342780 ) ( ON ?auto_1342778 ?auto_1342782 ) ( CLEAR ?auto_1342778 ) ( not ( = ?auto_1342777 ?auto_1342782 ) ) ( not ( = ?auto_1342778 ?auto_1342782 ) ) ( not ( = ?auto_1342785 ?auto_1342782 ) ) ( TRUCK-AT ?auto_1342781 ?auto_1342784 ) ( SURFACE-AT ?auto_1342785 ?auto_1342784 ) ( CLEAR ?auto_1342785 ) ( LIFTING ?auto_1342783 ?auto_1342777 ) ( IS-CRATE ?auto_1342777 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1342785 ?auto_1342777 )
      ( MAKE-2CRATE ?auto_1342785 ?auto_1342777 ?auto_1342778 )
      ( MAKE-1CRATE-VERIFY ?auto_1342777 ?auto_1342778 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1342786 - SURFACE
      ?auto_1342787 - SURFACE
      ?auto_1342788 - SURFACE
    )
    :vars
    (
      ?auto_1342789 - HOIST
      ?auto_1342791 - PLACE
      ?auto_1342790 - PLACE
      ?auto_1342792 - HOIST
      ?auto_1342794 - SURFACE
      ?auto_1342793 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342789 ?auto_1342791 ) ( IS-CRATE ?auto_1342788 ) ( not ( = ?auto_1342787 ?auto_1342788 ) ) ( not ( = ?auto_1342786 ?auto_1342787 ) ) ( not ( = ?auto_1342786 ?auto_1342788 ) ) ( not ( = ?auto_1342790 ?auto_1342791 ) ) ( HOIST-AT ?auto_1342792 ?auto_1342790 ) ( not ( = ?auto_1342789 ?auto_1342792 ) ) ( AVAILABLE ?auto_1342792 ) ( SURFACE-AT ?auto_1342788 ?auto_1342790 ) ( ON ?auto_1342788 ?auto_1342794 ) ( CLEAR ?auto_1342788 ) ( not ( = ?auto_1342787 ?auto_1342794 ) ) ( not ( = ?auto_1342788 ?auto_1342794 ) ) ( not ( = ?auto_1342786 ?auto_1342794 ) ) ( TRUCK-AT ?auto_1342793 ?auto_1342791 ) ( SURFACE-AT ?auto_1342786 ?auto_1342791 ) ( CLEAR ?auto_1342786 ) ( LIFTING ?auto_1342789 ?auto_1342787 ) ( IS-CRATE ?auto_1342787 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1342787 ?auto_1342788 )
      ( MAKE-2CRATE-VERIFY ?auto_1342786 ?auto_1342787 ?auto_1342788 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1342795 - SURFACE
      ?auto_1342796 - SURFACE
    )
    :vars
    (
      ?auto_1342799 - HOIST
      ?auto_1342801 - PLACE
      ?auto_1342800 - SURFACE
      ?auto_1342803 - PLACE
      ?auto_1342802 - HOIST
      ?auto_1342797 - SURFACE
      ?auto_1342798 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342799 ?auto_1342801 ) ( IS-CRATE ?auto_1342796 ) ( not ( = ?auto_1342795 ?auto_1342796 ) ) ( not ( = ?auto_1342800 ?auto_1342795 ) ) ( not ( = ?auto_1342800 ?auto_1342796 ) ) ( not ( = ?auto_1342803 ?auto_1342801 ) ) ( HOIST-AT ?auto_1342802 ?auto_1342803 ) ( not ( = ?auto_1342799 ?auto_1342802 ) ) ( AVAILABLE ?auto_1342802 ) ( SURFACE-AT ?auto_1342796 ?auto_1342803 ) ( ON ?auto_1342796 ?auto_1342797 ) ( CLEAR ?auto_1342796 ) ( not ( = ?auto_1342795 ?auto_1342797 ) ) ( not ( = ?auto_1342796 ?auto_1342797 ) ) ( not ( = ?auto_1342800 ?auto_1342797 ) ) ( TRUCK-AT ?auto_1342798 ?auto_1342801 ) ( SURFACE-AT ?auto_1342800 ?auto_1342801 ) ( CLEAR ?auto_1342800 ) ( IS-CRATE ?auto_1342795 ) ( AVAILABLE ?auto_1342799 ) ( IN ?auto_1342795 ?auto_1342798 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1342799 ?auto_1342795 ?auto_1342798 ?auto_1342801 )
      ( MAKE-2CRATE ?auto_1342800 ?auto_1342795 ?auto_1342796 )
      ( MAKE-1CRATE-VERIFY ?auto_1342795 ?auto_1342796 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1342804 - SURFACE
      ?auto_1342805 - SURFACE
      ?auto_1342806 - SURFACE
    )
    :vars
    (
      ?auto_1342809 - HOIST
      ?auto_1342811 - PLACE
      ?auto_1342808 - PLACE
      ?auto_1342807 - HOIST
      ?auto_1342810 - SURFACE
      ?auto_1342812 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342809 ?auto_1342811 ) ( IS-CRATE ?auto_1342806 ) ( not ( = ?auto_1342805 ?auto_1342806 ) ) ( not ( = ?auto_1342804 ?auto_1342805 ) ) ( not ( = ?auto_1342804 ?auto_1342806 ) ) ( not ( = ?auto_1342808 ?auto_1342811 ) ) ( HOIST-AT ?auto_1342807 ?auto_1342808 ) ( not ( = ?auto_1342809 ?auto_1342807 ) ) ( AVAILABLE ?auto_1342807 ) ( SURFACE-AT ?auto_1342806 ?auto_1342808 ) ( ON ?auto_1342806 ?auto_1342810 ) ( CLEAR ?auto_1342806 ) ( not ( = ?auto_1342805 ?auto_1342810 ) ) ( not ( = ?auto_1342806 ?auto_1342810 ) ) ( not ( = ?auto_1342804 ?auto_1342810 ) ) ( TRUCK-AT ?auto_1342812 ?auto_1342811 ) ( SURFACE-AT ?auto_1342804 ?auto_1342811 ) ( CLEAR ?auto_1342804 ) ( IS-CRATE ?auto_1342805 ) ( AVAILABLE ?auto_1342809 ) ( IN ?auto_1342805 ?auto_1342812 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1342805 ?auto_1342806 )
      ( MAKE-2CRATE-VERIFY ?auto_1342804 ?auto_1342805 ?auto_1342806 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1342849 - SURFACE
      ?auto_1342850 - SURFACE
    )
    :vars
    (
      ?auto_1342857 - HOIST
      ?auto_1342851 - PLACE
      ?auto_1342855 - SURFACE
      ?auto_1342852 - PLACE
      ?auto_1342854 - HOIST
      ?auto_1342853 - SURFACE
      ?auto_1342856 - TRUCK
      ?auto_1342858 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342857 ?auto_1342851 ) ( SURFACE-AT ?auto_1342849 ?auto_1342851 ) ( CLEAR ?auto_1342849 ) ( IS-CRATE ?auto_1342850 ) ( not ( = ?auto_1342849 ?auto_1342850 ) ) ( AVAILABLE ?auto_1342857 ) ( ON ?auto_1342849 ?auto_1342855 ) ( not ( = ?auto_1342855 ?auto_1342849 ) ) ( not ( = ?auto_1342855 ?auto_1342850 ) ) ( not ( = ?auto_1342852 ?auto_1342851 ) ) ( HOIST-AT ?auto_1342854 ?auto_1342852 ) ( not ( = ?auto_1342857 ?auto_1342854 ) ) ( AVAILABLE ?auto_1342854 ) ( SURFACE-AT ?auto_1342850 ?auto_1342852 ) ( ON ?auto_1342850 ?auto_1342853 ) ( CLEAR ?auto_1342850 ) ( not ( = ?auto_1342849 ?auto_1342853 ) ) ( not ( = ?auto_1342850 ?auto_1342853 ) ) ( not ( = ?auto_1342855 ?auto_1342853 ) ) ( TRUCK-AT ?auto_1342856 ?auto_1342858 ) ( not ( = ?auto_1342858 ?auto_1342851 ) ) ( not ( = ?auto_1342852 ?auto_1342858 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1342856 ?auto_1342858 ?auto_1342851 )
      ( MAKE-1CRATE ?auto_1342849 ?auto_1342850 )
      ( MAKE-1CRATE-VERIFY ?auto_1342849 ?auto_1342850 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1342888 - SURFACE
      ?auto_1342889 - SURFACE
      ?auto_1342890 - SURFACE
      ?auto_1342891 - SURFACE
    )
    :vars
    (
      ?auto_1342893 - HOIST
      ?auto_1342892 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342893 ?auto_1342892 ) ( SURFACE-AT ?auto_1342890 ?auto_1342892 ) ( CLEAR ?auto_1342890 ) ( LIFTING ?auto_1342893 ?auto_1342891 ) ( IS-CRATE ?auto_1342891 ) ( not ( = ?auto_1342890 ?auto_1342891 ) ) ( ON ?auto_1342889 ?auto_1342888 ) ( ON ?auto_1342890 ?auto_1342889 ) ( not ( = ?auto_1342888 ?auto_1342889 ) ) ( not ( = ?auto_1342888 ?auto_1342890 ) ) ( not ( = ?auto_1342888 ?auto_1342891 ) ) ( not ( = ?auto_1342889 ?auto_1342890 ) ) ( not ( = ?auto_1342889 ?auto_1342891 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1342890 ?auto_1342891 )
      ( MAKE-3CRATE-VERIFY ?auto_1342888 ?auto_1342889 ?auto_1342890 ?auto_1342891 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1342905 - SURFACE
      ?auto_1342906 - SURFACE
      ?auto_1342907 - SURFACE
      ?auto_1342908 - SURFACE
    )
    :vars
    (
      ?auto_1342910 - HOIST
      ?auto_1342909 - PLACE
      ?auto_1342911 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342910 ?auto_1342909 ) ( SURFACE-AT ?auto_1342907 ?auto_1342909 ) ( CLEAR ?auto_1342907 ) ( IS-CRATE ?auto_1342908 ) ( not ( = ?auto_1342907 ?auto_1342908 ) ) ( TRUCK-AT ?auto_1342911 ?auto_1342909 ) ( AVAILABLE ?auto_1342910 ) ( IN ?auto_1342908 ?auto_1342911 ) ( ON ?auto_1342907 ?auto_1342906 ) ( not ( = ?auto_1342906 ?auto_1342907 ) ) ( not ( = ?auto_1342906 ?auto_1342908 ) ) ( ON ?auto_1342906 ?auto_1342905 ) ( not ( = ?auto_1342905 ?auto_1342906 ) ) ( not ( = ?auto_1342905 ?auto_1342907 ) ) ( not ( = ?auto_1342905 ?auto_1342908 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1342906 ?auto_1342907 ?auto_1342908 )
      ( MAKE-3CRATE-VERIFY ?auto_1342905 ?auto_1342906 ?auto_1342907 ?auto_1342908 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1342926 - SURFACE
      ?auto_1342927 - SURFACE
      ?auto_1342928 - SURFACE
      ?auto_1342929 - SURFACE
    )
    :vars
    (
      ?auto_1342930 - HOIST
      ?auto_1342932 - PLACE
      ?auto_1342931 - TRUCK
      ?auto_1342933 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342930 ?auto_1342932 ) ( SURFACE-AT ?auto_1342928 ?auto_1342932 ) ( CLEAR ?auto_1342928 ) ( IS-CRATE ?auto_1342929 ) ( not ( = ?auto_1342928 ?auto_1342929 ) ) ( AVAILABLE ?auto_1342930 ) ( IN ?auto_1342929 ?auto_1342931 ) ( ON ?auto_1342928 ?auto_1342927 ) ( not ( = ?auto_1342927 ?auto_1342928 ) ) ( not ( = ?auto_1342927 ?auto_1342929 ) ) ( TRUCK-AT ?auto_1342931 ?auto_1342933 ) ( not ( = ?auto_1342933 ?auto_1342932 ) ) ( ON ?auto_1342927 ?auto_1342926 ) ( not ( = ?auto_1342926 ?auto_1342927 ) ) ( not ( = ?auto_1342926 ?auto_1342928 ) ) ( not ( = ?auto_1342926 ?auto_1342929 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1342927 ?auto_1342928 ?auto_1342929 )
      ( MAKE-3CRATE-VERIFY ?auto_1342926 ?auto_1342927 ?auto_1342928 ?auto_1342929 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1342950 - SURFACE
      ?auto_1342951 - SURFACE
      ?auto_1342952 - SURFACE
      ?auto_1342953 - SURFACE
    )
    :vars
    (
      ?auto_1342955 - HOIST
      ?auto_1342958 - PLACE
      ?auto_1342957 - TRUCK
      ?auto_1342956 - PLACE
      ?auto_1342954 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342955 ?auto_1342958 ) ( SURFACE-AT ?auto_1342952 ?auto_1342958 ) ( CLEAR ?auto_1342952 ) ( IS-CRATE ?auto_1342953 ) ( not ( = ?auto_1342952 ?auto_1342953 ) ) ( AVAILABLE ?auto_1342955 ) ( ON ?auto_1342952 ?auto_1342951 ) ( not ( = ?auto_1342951 ?auto_1342952 ) ) ( not ( = ?auto_1342951 ?auto_1342953 ) ) ( TRUCK-AT ?auto_1342957 ?auto_1342956 ) ( not ( = ?auto_1342956 ?auto_1342958 ) ) ( HOIST-AT ?auto_1342954 ?auto_1342956 ) ( LIFTING ?auto_1342954 ?auto_1342953 ) ( not ( = ?auto_1342955 ?auto_1342954 ) ) ( ON ?auto_1342951 ?auto_1342950 ) ( not ( = ?auto_1342950 ?auto_1342951 ) ) ( not ( = ?auto_1342950 ?auto_1342952 ) ) ( not ( = ?auto_1342950 ?auto_1342953 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1342951 ?auto_1342952 ?auto_1342953 )
      ( MAKE-3CRATE-VERIFY ?auto_1342950 ?auto_1342951 ?auto_1342952 ?auto_1342953 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1342977 - SURFACE
      ?auto_1342978 - SURFACE
      ?auto_1342979 - SURFACE
      ?auto_1342980 - SURFACE
    )
    :vars
    (
      ?auto_1342982 - HOIST
      ?auto_1342984 - PLACE
      ?auto_1342981 - TRUCK
      ?auto_1342985 - PLACE
      ?auto_1342983 - HOIST
      ?auto_1342986 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1342982 ?auto_1342984 ) ( SURFACE-AT ?auto_1342979 ?auto_1342984 ) ( CLEAR ?auto_1342979 ) ( IS-CRATE ?auto_1342980 ) ( not ( = ?auto_1342979 ?auto_1342980 ) ) ( AVAILABLE ?auto_1342982 ) ( ON ?auto_1342979 ?auto_1342978 ) ( not ( = ?auto_1342978 ?auto_1342979 ) ) ( not ( = ?auto_1342978 ?auto_1342980 ) ) ( TRUCK-AT ?auto_1342981 ?auto_1342985 ) ( not ( = ?auto_1342985 ?auto_1342984 ) ) ( HOIST-AT ?auto_1342983 ?auto_1342985 ) ( not ( = ?auto_1342982 ?auto_1342983 ) ) ( AVAILABLE ?auto_1342983 ) ( SURFACE-AT ?auto_1342980 ?auto_1342985 ) ( ON ?auto_1342980 ?auto_1342986 ) ( CLEAR ?auto_1342980 ) ( not ( = ?auto_1342979 ?auto_1342986 ) ) ( not ( = ?auto_1342980 ?auto_1342986 ) ) ( not ( = ?auto_1342978 ?auto_1342986 ) ) ( ON ?auto_1342978 ?auto_1342977 ) ( not ( = ?auto_1342977 ?auto_1342978 ) ) ( not ( = ?auto_1342977 ?auto_1342979 ) ) ( not ( = ?auto_1342977 ?auto_1342980 ) ) ( not ( = ?auto_1342977 ?auto_1342986 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1342978 ?auto_1342979 ?auto_1342980 )
      ( MAKE-3CRATE-VERIFY ?auto_1342977 ?auto_1342978 ?auto_1342979 ?auto_1342980 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1343005 - SURFACE
      ?auto_1343006 - SURFACE
      ?auto_1343007 - SURFACE
      ?auto_1343008 - SURFACE
    )
    :vars
    (
      ?auto_1343012 - HOIST
      ?auto_1343011 - PLACE
      ?auto_1343013 - PLACE
      ?auto_1343010 - HOIST
      ?auto_1343014 - SURFACE
      ?auto_1343009 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343012 ?auto_1343011 ) ( SURFACE-AT ?auto_1343007 ?auto_1343011 ) ( CLEAR ?auto_1343007 ) ( IS-CRATE ?auto_1343008 ) ( not ( = ?auto_1343007 ?auto_1343008 ) ) ( AVAILABLE ?auto_1343012 ) ( ON ?auto_1343007 ?auto_1343006 ) ( not ( = ?auto_1343006 ?auto_1343007 ) ) ( not ( = ?auto_1343006 ?auto_1343008 ) ) ( not ( = ?auto_1343013 ?auto_1343011 ) ) ( HOIST-AT ?auto_1343010 ?auto_1343013 ) ( not ( = ?auto_1343012 ?auto_1343010 ) ) ( AVAILABLE ?auto_1343010 ) ( SURFACE-AT ?auto_1343008 ?auto_1343013 ) ( ON ?auto_1343008 ?auto_1343014 ) ( CLEAR ?auto_1343008 ) ( not ( = ?auto_1343007 ?auto_1343014 ) ) ( not ( = ?auto_1343008 ?auto_1343014 ) ) ( not ( = ?auto_1343006 ?auto_1343014 ) ) ( TRUCK-AT ?auto_1343009 ?auto_1343011 ) ( ON ?auto_1343006 ?auto_1343005 ) ( not ( = ?auto_1343005 ?auto_1343006 ) ) ( not ( = ?auto_1343005 ?auto_1343007 ) ) ( not ( = ?auto_1343005 ?auto_1343008 ) ) ( not ( = ?auto_1343005 ?auto_1343014 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1343006 ?auto_1343007 ?auto_1343008 )
      ( MAKE-3CRATE-VERIFY ?auto_1343005 ?auto_1343006 ?auto_1343007 ?auto_1343008 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1343033 - SURFACE
      ?auto_1343034 - SURFACE
      ?auto_1343035 - SURFACE
      ?auto_1343036 - SURFACE
    )
    :vars
    (
      ?auto_1343037 - HOIST
      ?auto_1343041 - PLACE
      ?auto_1343039 - PLACE
      ?auto_1343038 - HOIST
      ?auto_1343042 - SURFACE
      ?auto_1343040 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343037 ?auto_1343041 ) ( IS-CRATE ?auto_1343036 ) ( not ( = ?auto_1343035 ?auto_1343036 ) ) ( not ( = ?auto_1343034 ?auto_1343035 ) ) ( not ( = ?auto_1343034 ?auto_1343036 ) ) ( not ( = ?auto_1343039 ?auto_1343041 ) ) ( HOIST-AT ?auto_1343038 ?auto_1343039 ) ( not ( = ?auto_1343037 ?auto_1343038 ) ) ( AVAILABLE ?auto_1343038 ) ( SURFACE-AT ?auto_1343036 ?auto_1343039 ) ( ON ?auto_1343036 ?auto_1343042 ) ( CLEAR ?auto_1343036 ) ( not ( = ?auto_1343035 ?auto_1343042 ) ) ( not ( = ?auto_1343036 ?auto_1343042 ) ) ( not ( = ?auto_1343034 ?auto_1343042 ) ) ( TRUCK-AT ?auto_1343040 ?auto_1343041 ) ( SURFACE-AT ?auto_1343034 ?auto_1343041 ) ( CLEAR ?auto_1343034 ) ( LIFTING ?auto_1343037 ?auto_1343035 ) ( IS-CRATE ?auto_1343035 ) ( ON ?auto_1343034 ?auto_1343033 ) ( not ( = ?auto_1343033 ?auto_1343034 ) ) ( not ( = ?auto_1343033 ?auto_1343035 ) ) ( not ( = ?auto_1343033 ?auto_1343036 ) ) ( not ( = ?auto_1343033 ?auto_1343042 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1343034 ?auto_1343035 ?auto_1343036 )
      ( MAKE-3CRATE-VERIFY ?auto_1343033 ?auto_1343034 ?auto_1343035 ?auto_1343036 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1343061 - SURFACE
      ?auto_1343062 - SURFACE
      ?auto_1343063 - SURFACE
      ?auto_1343064 - SURFACE
    )
    :vars
    (
      ?auto_1343067 - HOIST
      ?auto_1343069 - PLACE
      ?auto_1343065 - PLACE
      ?auto_1343070 - HOIST
      ?auto_1343068 - SURFACE
      ?auto_1343066 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343067 ?auto_1343069 ) ( IS-CRATE ?auto_1343064 ) ( not ( = ?auto_1343063 ?auto_1343064 ) ) ( not ( = ?auto_1343062 ?auto_1343063 ) ) ( not ( = ?auto_1343062 ?auto_1343064 ) ) ( not ( = ?auto_1343065 ?auto_1343069 ) ) ( HOIST-AT ?auto_1343070 ?auto_1343065 ) ( not ( = ?auto_1343067 ?auto_1343070 ) ) ( AVAILABLE ?auto_1343070 ) ( SURFACE-AT ?auto_1343064 ?auto_1343065 ) ( ON ?auto_1343064 ?auto_1343068 ) ( CLEAR ?auto_1343064 ) ( not ( = ?auto_1343063 ?auto_1343068 ) ) ( not ( = ?auto_1343064 ?auto_1343068 ) ) ( not ( = ?auto_1343062 ?auto_1343068 ) ) ( TRUCK-AT ?auto_1343066 ?auto_1343069 ) ( SURFACE-AT ?auto_1343062 ?auto_1343069 ) ( CLEAR ?auto_1343062 ) ( IS-CRATE ?auto_1343063 ) ( AVAILABLE ?auto_1343067 ) ( IN ?auto_1343063 ?auto_1343066 ) ( ON ?auto_1343062 ?auto_1343061 ) ( not ( = ?auto_1343061 ?auto_1343062 ) ) ( not ( = ?auto_1343061 ?auto_1343063 ) ) ( not ( = ?auto_1343061 ?auto_1343064 ) ) ( not ( = ?auto_1343061 ?auto_1343068 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1343062 ?auto_1343063 ?auto_1343064 )
      ( MAKE-3CRATE-VERIFY ?auto_1343061 ?auto_1343062 ?auto_1343063 ?auto_1343064 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1343352 - SURFACE
      ?auto_1343353 - SURFACE
      ?auto_1343354 - SURFACE
      ?auto_1343356 - SURFACE
      ?auto_1343355 - SURFACE
    )
    :vars
    (
      ?auto_1343357 - HOIST
      ?auto_1343358 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343357 ?auto_1343358 ) ( SURFACE-AT ?auto_1343356 ?auto_1343358 ) ( CLEAR ?auto_1343356 ) ( LIFTING ?auto_1343357 ?auto_1343355 ) ( IS-CRATE ?auto_1343355 ) ( not ( = ?auto_1343356 ?auto_1343355 ) ) ( ON ?auto_1343353 ?auto_1343352 ) ( ON ?auto_1343354 ?auto_1343353 ) ( ON ?auto_1343356 ?auto_1343354 ) ( not ( = ?auto_1343352 ?auto_1343353 ) ) ( not ( = ?auto_1343352 ?auto_1343354 ) ) ( not ( = ?auto_1343352 ?auto_1343356 ) ) ( not ( = ?auto_1343352 ?auto_1343355 ) ) ( not ( = ?auto_1343353 ?auto_1343354 ) ) ( not ( = ?auto_1343353 ?auto_1343356 ) ) ( not ( = ?auto_1343353 ?auto_1343355 ) ) ( not ( = ?auto_1343354 ?auto_1343356 ) ) ( not ( = ?auto_1343354 ?auto_1343355 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1343356 ?auto_1343355 )
      ( MAKE-4CRATE-VERIFY ?auto_1343352 ?auto_1343353 ?auto_1343354 ?auto_1343356 ?auto_1343355 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1343377 - SURFACE
      ?auto_1343378 - SURFACE
      ?auto_1343379 - SURFACE
      ?auto_1343381 - SURFACE
      ?auto_1343380 - SURFACE
    )
    :vars
    (
      ?auto_1343384 - HOIST
      ?auto_1343383 - PLACE
      ?auto_1343382 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343384 ?auto_1343383 ) ( SURFACE-AT ?auto_1343381 ?auto_1343383 ) ( CLEAR ?auto_1343381 ) ( IS-CRATE ?auto_1343380 ) ( not ( = ?auto_1343381 ?auto_1343380 ) ) ( TRUCK-AT ?auto_1343382 ?auto_1343383 ) ( AVAILABLE ?auto_1343384 ) ( IN ?auto_1343380 ?auto_1343382 ) ( ON ?auto_1343381 ?auto_1343379 ) ( not ( = ?auto_1343379 ?auto_1343381 ) ) ( not ( = ?auto_1343379 ?auto_1343380 ) ) ( ON ?auto_1343378 ?auto_1343377 ) ( ON ?auto_1343379 ?auto_1343378 ) ( not ( = ?auto_1343377 ?auto_1343378 ) ) ( not ( = ?auto_1343377 ?auto_1343379 ) ) ( not ( = ?auto_1343377 ?auto_1343381 ) ) ( not ( = ?auto_1343377 ?auto_1343380 ) ) ( not ( = ?auto_1343378 ?auto_1343379 ) ) ( not ( = ?auto_1343378 ?auto_1343381 ) ) ( not ( = ?auto_1343378 ?auto_1343380 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1343379 ?auto_1343381 ?auto_1343380 )
      ( MAKE-4CRATE-VERIFY ?auto_1343377 ?auto_1343378 ?auto_1343379 ?auto_1343381 ?auto_1343380 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1343407 - SURFACE
      ?auto_1343408 - SURFACE
      ?auto_1343409 - SURFACE
      ?auto_1343411 - SURFACE
      ?auto_1343410 - SURFACE
    )
    :vars
    (
      ?auto_1343415 - HOIST
      ?auto_1343414 - PLACE
      ?auto_1343413 - TRUCK
      ?auto_1343412 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343415 ?auto_1343414 ) ( SURFACE-AT ?auto_1343411 ?auto_1343414 ) ( CLEAR ?auto_1343411 ) ( IS-CRATE ?auto_1343410 ) ( not ( = ?auto_1343411 ?auto_1343410 ) ) ( AVAILABLE ?auto_1343415 ) ( IN ?auto_1343410 ?auto_1343413 ) ( ON ?auto_1343411 ?auto_1343409 ) ( not ( = ?auto_1343409 ?auto_1343411 ) ) ( not ( = ?auto_1343409 ?auto_1343410 ) ) ( TRUCK-AT ?auto_1343413 ?auto_1343412 ) ( not ( = ?auto_1343412 ?auto_1343414 ) ) ( ON ?auto_1343408 ?auto_1343407 ) ( ON ?auto_1343409 ?auto_1343408 ) ( not ( = ?auto_1343407 ?auto_1343408 ) ) ( not ( = ?auto_1343407 ?auto_1343409 ) ) ( not ( = ?auto_1343407 ?auto_1343411 ) ) ( not ( = ?auto_1343407 ?auto_1343410 ) ) ( not ( = ?auto_1343408 ?auto_1343409 ) ) ( not ( = ?auto_1343408 ?auto_1343411 ) ) ( not ( = ?auto_1343408 ?auto_1343410 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1343409 ?auto_1343411 ?auto_1343410 )
      ( MAKE-4CRATE-VERIFY ?auto_1343407 ?auto_1343408 ?auto_1343409 ?auto_1343411 ?auto_1343410 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1343441 - SURFACE
      ?auto_1343442 - SURFACE
      ?auto_1343443 - SURFACE
      ?auto_1343445 - SURFACE
      ?auto_1343444 - SURFACE
    )
    :vars
    (
      ?auto_1343448 - HOIST
      ?auto_1343449 - PLACE
      ?auto_1343446 - TRUCK
      ?auto_1343450 - PLACE
      ?auto_1343447 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343448 ?auto_1343449 ) ( SURFACE-AT ?auto_1343445 ?auto_1343449 ) ( CLEAR ?auto_1343445 ) ( IS-CRATE ?auto_1343444 ) ( not ( = ?auto_1343445 ?auto_1343444 ) ) ( AVAILABLE ?auto_1343448 ) ( ON ?auto_1343445 ?auto_1343443 ) ( not ( = ?auto_1343443 ?auto_1343445 ) ) ( not ( = ?auto_1343443 ?auto_1343444 ) ) ( TRUCK-AT ?auto_1343446 ?auto_1343450 ) ( not ( = ?auto_1343450 ?auto_1343449 ) ) ( HOIST-AT ?auto_1343447 ?auto_1343450 ) ( LIFTING ?auto_1343447 ?auto_1343444 ) ( not ( = ?auto_1343448 ?auto_1343447 ) ) ( ON ?auto_1343442 ?auto_1343441 ) ( ON ?auto_1343443 ?auto_1343442 ) ( not ( = ?auto_1343441 ?auto_1343442 ) ) ( not ( = ?auto_1343441 ?auto_1343443 ) ) ( not ( = ?auto_1343441 ?auto_1343445 ) ) ( not ( = ?auto_1343441 ?auto_1343444 ) ) ( not ( = ?auto_1343442 ?auto_1343443 ) ) ( not ( = ?auto_1343442 ?auto_1343445 ) ) ( not ( = ?auto_1343442 ?auto_1343444 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1343443 ?auto_1343445 ?auto_1343444 )
      ( MAKE-4CRATE-VERIFY ?auto_1343441 ?auto_1343442 ?auto_1343443 ?auto_1343445 ?auto_1343444 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1343479 - SURFACE
      ?auto_1343480 - SURFACE
      ?auto_1343481 - SURFACE
      ?auto_1343483 - SURFACE
      ?auto_1343482 - SURFACE
    )
    :vars
    (
      ?auto_1343487 - HOIST
      ?auto_1343488 - PLACE
      ?auto_1343486 - TRUCK
      ?auto_1343485 - PLACE
      ?auto_1343484 - HOIST
      ?auto_1343489 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343487 ?auto_1343488 ) ( SURFACE-AT ?auto_1343483 ?auto_1343488 ) ( CLEAR ?auto_1343483 ) ( IS-CRATE ?auto_1343482 ) ( not ( = ?auto_1343483 ?auto_1343482 ) ) ( AVAILABLE ?auto_1343487 ) ( ON ?auto_1343483 ?auto_1343481 ) ( not ( = ?auto_1343481 ?auto_1343483 ) ) ( not ( = ?auto_1343481 ?auto_1343482 ) ) ( TRUCK-AT ?auto_1343486 ?auto_1343485 ) ( not ( = ?auto_1343485 ?auto_1343488 ) ) ( HOIST-AT ?auto_1343484 ?auto_1343485 ) ( not ( = ?auto_1343487 ?auto_1343484 ) ) ( AVAILABLE ?auto_1343484 ) ( SURFACE-AT ?auto_1343482 ?auto_1343485 ) ( ON ?auto_1343482 ?auto_1343489 ) ( CLEAR ?auto_1343482 ) ( not ( = ?auto_1343483 ?auto_1343489 ) ) ( not ( = ?auto_1343482 ?auto_1343489 ) ) ( not ( = ?auto_1343481 ?auto_1343489 ) ) ( ON ?auto_1343480 ?auto_1343479 ) ( ON ?auto_1343481 ?auto_1343480 ) ( not ( = ?auto_1343479 ?auto_1343480 ) ) ( not ( = ?auto_1343479 ?auto_1343481 ) ) ( not ( = ?auto_1343479 ?auto_1343483 ) ) ( not ( = ?auto_1343479 ?auto_1343482 ) ) ( not ( = ?auto_1343479 ?auto_1343489 ) ) ( not ( = ?auto_1343480 ?auto_1343481 ) ) ( not ( = ?auto_1343480 ?auto_1343483 ) ) ( not ( = ?auto_1343480 ?auto_1343482 ) ) ( not ( = ?auto_1343480 ?auto_1343489 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1343481 ?auto_1343483 ?auto_1343482 )
      ( MAKE-4CRATE-VERIFY ?auto_1343479 ?auto_1343480 ?auto_1343481 ?auto_1343483 ?auto_1343482 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1343518 - SURFACE
      ?auto_1343519 - SURFACE
      ?auto_1343520 - SURFACE
      ?auto_1343522 - SURFACE
      ?auto_1343521 - SURFACE
    )
    :vars
    (
      ?auto_1343527 - HOIST
      ?auto_1343523 - PLACE
      ?auto_1343524 - PLACE
      ?auto_1343525 - HOIST
      ?auto_1343526 - SURFACE
      ?auto_1343528 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343527 ?auto_1343523 ) ( SURFACE-AT ?auto_1343522 ?auto_1343523 ) ( CLEAR ?auto_1343522 ) ( IS-CRATE ?auto_1343521 ) ( not ( = ?auto_1343522 ?auto_1343521 ) ) ( AVAILABLE ?auto_1343527 ) ( ON ?auto_1343522 ?auto_1343520 ) ( not ( = ?auto_1343520 ?auto_1343522 ) ) ( not ( = ?auto_1343520 ?auto_1343521 ) ) ( not ( = ?auto_1343524 ?auto_1343523 ) ) ( HOIST-AT ?auto_1343525 ?auto_1343524 ) ( not ( = ?auto_1343527 ?auto_1343525 ) ) ( AVAILABLE ?auto_1343525 ) ( SURFACE-AT ?auto_1343521 ?auto_1343524 ) ( ON ?auto_1343521 ?auto_1343526 ) ( CLEAR ?auto_1343521 ) ( not ( = ?auto_1343522 ?auto_1343526 ) ) ( not ( = ?auto_1343521 ?auto_1343526 ) ) ( not ( = ?auto_1343520 ?auto_1343526 ) ) ( TRUCK-AT ?auto_1343528 ?auto_1343523 ) ( ON ?auto_1343519 ?auto_1343518 ) ( ON ?auto_1343520 ?auto_1343519 ) ( not ( = ?auto_1343518 ?auto_1343519 ) ) ( not ( = ?auto_1343518 ?auto_1343520 ) ) ( not ( = ?auto_1343518 ?auto_1343522 ) ) ( not ( = ?auto_1343518 ?auto_1343521 ) ) ( not ( = ?auto_1343518 ?auto_1343526 ) ) ( not ( = ?auto_1343519 ?auto_1343520 ) ) ( not ( = ?auto_1343519 ?auto_1343522 ) ) ( not ( = ?auto_1343519 ?auto_1343521 ) ) ( not ( = ?auto_1343519 ?auto_1343526 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1343520 ?auto_1343522 ?auto_1343521 )
      ( MAKE-4CRATE-VERIFY ?auto_1343518 ?auto_1343519 ?auto_1343520 ?auto_1343522 ?auto_1343521 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1343557 - SURFACE
      ?auto_1343558 - SURFACE
      ?auto_1343559 - SURFACE
      ?auto_1343561 - SURFACE
      ?auto_1343560 - SURFACE
    )
    :vars
    (
      ?auto_1343565 - HOIST
      ?auto_1343562 - PLACE
      ?auto_1343566 - PLACE
      ?auto_1343564 - HOIST
      ?auto_1343563 - SURFACE
      ?auto_1343567 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343565 ?auto_1343562 ) ( IS-CRATE ?auto_1343560 ) ( not ( = ?auto_1343561 ?auto_1343560 ) ) ( not ( = ?auto_1343559 ?auto_1343561 ) ) ( not ( = ?auto_1343559 ?auto_1343560 ) ) ( not ( = ?auto_1343566 ?auto_1343562 ) ) ( HOIST-AT ?auto_1343564 ?auto_1343566 ) ( not ( = ?auto_1343565 ?auto_1343564 ) ) ( AVAILABLE ?auto_1343564 ) ( SURFACE-AT ?auto_1343560 ?auto_1343566 ) ( ON ?auto_1343560 ?auto_1343563 ) ( CLEAR ?auto_1343560 ) ( not ( = ?auto_1343561 ?auto_1343563 ) ) ( not ( = ?auto_1343560 ?auto_1343563 ) ) ( not ( = ?auto_1343559 ?auto_1343563 ) ) ( TRUCK-AT ?auto_1343567 ?auto_1343562 ) ( SURFACE-AT ?auto_1343559 ?auto_1343562 ) ( CLEAR ?auto_1343559 ) ( LIFTING ?auto_1343565 ?auto_1343561 ) ( IS-CRATE ?auto_1343561 ) ( ON ?auto_1343558 ?auto_1343557 ) ( ON ?auto_1343559 ?auto_1343558 ) ( not ( = ?auto_1343557 ?auto_1343558 ) ) ( not ( = ?auto_1343557 ?auto_1343559 ) ) ( not ( = ?auto_1343557 ?auto_1343561 ) ) ( not ( = ?auto_1343557 ?auto_1343560 ) ) ( not ( = ?auto_1343557 ?auto_1343563 ) ) ( not ( = ?auto_1343558 ?auto_1343559 ) ) ( not ( = ?auto_1343558 ?auto_1343561 ) ) ( not ( = ?auto_1343558 ?auto_1343560 ) ) ( not ( = ?auto_1343558 ?auto_1343563 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1343559 ?auto_1343561 ?auto_1343560 )
      ( MAKE-4CRATE-VERIFY ?auto_1343557 ?auto_1343558 ?auto_1343559 ?auto_1343561 ?auto_1343560 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1343596 - SURFACE
      ?auto_1343597 - SURFACE
      ?auto_1343598 - SURFACE
      ?auto_1343600 - SURFACE
      ?auto_1343599 - SURFACE
    )
    :vars
    (
      ?auto_1343606 - HOIST
      ?auto_1343601 - PLACE
      ?auto_1343603 - PLACE
      ?auto_1343605 - HOIST
      ?auto_1343602 - SURFACE
      ?auto_1343604 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343606 ?auto_1343601 ) ( IS-CRATE ?auto_1343599 ) ( not ( = ?auto_1343600 ?auto_1343599 ) ) ( not ( = ?auto_1343598 ?auto_1343600 ) ) ( not ( = ?auto_1343598 ?auto_1343599 ) ) ( not ( = ?auto_1343603 ?auto_1343601 ) ) ( HOIST-AT ?auto_1343605 ?auto_1343603 ) ( not ( = ?auto_1343606 ?auto_1343605 ) ) ( AVAILABLE ?auto_1343605 ) ( SURFACE-AT ?auto_1343599 ?auto_1343603 ) ( ON ?auto_1343599 ?auto_1343602 ) ( CLEAR ?auto_1343599 ) ( not ( = ?auto_1343600 ?auto_1343602 ) ) ( not ( = ?auto_1343599 ?auto_1343602 ) ) ( not ( = ?auto_1343598 ?auto_1343602 ) ) ( TRUCK-AT ?auto_1343604 ?auto_1343601 ) ( SURFACE-AT ?auto_1343598 ?auto_1343601 ) ( CLEAR ?auto_1343598 ) ( IS-CRATE ?auto_1343600 ) ( AVAILABLE ?auto_1343606 ) ( IN ?auto_1343600 ?auto_1343604 ) ( ON ?auto_1343597 ?auto_1343596 ) ( ON ?auto_1343598 ?auto_1343597 ) ( not ( = ?auto_1343596 ?auto_1343597 ) ) ( not ( = ?auto_1343596 ?auto_1343598 ) ) ( not ( = ?auto_1343596 ?auto_1343600 ) ) ( not ( = ?auto_1343596 ?auto_1343599 ) ) ( not ( = ?auto_1343596 ?auto_1343602 ) ) ( not ( = ?auto_1343597 ?auto_1343598 ) ) ( not ( = ?auto_1343597 ?auto_1343600 ) ) ( not ( = ?auto_1343597 ?auto_1343599 ) ) ( not ( = ?auto_1343597 ?auto_1343602 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1343598 ?auto_1343600 ?auto_1343599 )
      ( MAKE-4CRATE-VERIFY ?auto_1343596 ?auto_1343597 ?auto_1343598 ?auto_1343600 ?auto_1343599 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1344256 - SURFACE
      ?auto_1344257 - SURFACE
      ?auto_1344258 - SURFACE
      ?auto_1344260 - SURFACE
      ?auto_1344259 - SURFACE
      ?auto_1344261 - SURFACE
    )
    :vars
    (
      ?auto_1344262 - HOIST
      ?auto_1344263 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344262 ?auto_1344263 ) ( SURFACE-AT ?auto_1344259 ?auto_1344263 ) ( CLEAR ?auto_1344259 ) ( LIFTING ?auto_1344262 ?auto_1344261 ) ( IS-CRATE ?auto_1344261 ) ( not ( = ?auto_1344259 ?auto_1344261 ) ) ( ON ?auto_1344257 ?auto_1344256 ) ( ON ?auto_1344258 ?auto_1344257 ) ( ON ?auto_1344260 ?auto_1344258 ) ( ON ?auto_1344259 ?auto_1344260 ) ( not ( = ?auto_1344256 ?auto_1344257 ) ) ( not ( = ?auto_1344256 ?auto_1344258 ) ) ( not ( = ?auto_1344256 ?auto_1344260 ) ) ( not ( = ?auto_1344256 ?auto_1344259 ) ) ( not ( = ?auto_1344256 ?auto_1344261 ) ) ( not ( = ?auto_1344257 ?auto_1344258 ) ) ( not ( = ?auto_1344257 ?auto_1344260 ) ) ( not ( = ?auto_1344257 ?auto_1344259 ) ) ( not ( = ?auto_1344257 ?auto_1344261 ) ) ( not ( = ?auto_1344258 ?auto_1344260 ) ) ( not ( = ?auto_1344258 ?auto_1344259 ) ) ( not ( = ?auto_1344258 ?auto_1344261 ) ) ( not ( = ?auto_1344260 ?auto_1344259 ) ) ( not ( = ?auto_1344260 ?auto_1344261 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1344259 ?auto_1344261 )
      ( MAKE-5CRATE-VERIFY ?auto_1344256 ?auto_1344257 ?auto_1344258 ?auto_1344260 ?auto_1344259 ?auto_1344261 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1344290 - SURFACE
      ?auto_1344291 - SURFACE
      ?auto_1344292 - SURFACE
      ?auto_1344294 - SURFACE
      ?auto_1344293 - SURFACE
      ?auto_1344295 - SURFACE
    )
    :vars
    (
      ?auto_1344297 - HOIST
      ?auto_1344298 - PLACE
      ?auto_1344296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344297 ?auto_1344298 ) ( SURFACE-AT ?auto_1344293 ?auto_1344298 ) ( CLEAR ?auto_1344293 ) ( IS-CRATE ?auto_1344295 ) ( not ( = ?auto_1344293 ?auto_1344295 ) ) ( TRUCK-AT ?auto_1344296 ?auto_1344298 ) ( AVAILABLE ?auto_1344297 ) ( IN ?auto_1344295 ?auto_1344296 ) ( ON ?auto_1344293 ?auto_1344294 ) ( not ( = ?auto_1344294 ?auto_1344293 ) ) ( not ( = ?auto_1344294 ?auto_1344295 ) ) ( ON ?auto_1344291 ?auto_1344290 ) ( ON ?auto_1344292 ?auto_1344291 ) ( ON ?auto_1344294 ?auto_1344292 ) ( not ( = ?auto_1344290 ?auto_1344291 ) ) ( not ( = ?auto_1344290 ?auto_1344292 ) ) ( not ( = ?auto_1344290 ?auto_1344294 ) ) ( not ( = ?auto_1344290 ?auto_1344293 ) ) ( not ( = ?auto_1344290 ?auto_1344295 ) ) ( not ( = ?auto_1344291 ?auto_1344292 ) ) ( not ( = ?auto_1344291 ?auto_1344294 ) ) ( not ( = ?auto_1344291 ?auto_1344293 ) ) ( not ( = ?auto_1344291 ?auto_1344295 ) ) ( not ( = ?auto_1344292 ?auto_1344294 ) ) ( not ( = ?auto_1344292 ?auto_1344293 ) ) ( not ( = ?auto_1344292 ?auto_1344295 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344294 ?auto_1344293 ?auto_1344295 )
      ( MAKE-5CRATE-VERIFY ?auto_1344290 ?auto_1344291 ?auto_1344292 ?auto_1344294 ?auto_1344293 ?auto_1344295 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1344330 - SURFACE
      ?auto_1344331 - SURFACE
      ?auto_1344332 - SURFACE
      ?auto_1344334 - SURFACE
      ?auto_1344333 - SURFACE
      ?auto_1344335 - SURFACE
    )
    :vars
    (
      ?auto_1344336 - HOIST
      ?auto_1344338 - PLACE
      ?auto_1344337 - TRUCK
      ?auto_1344339 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344336 ?auto_1344338 ) ( SURFACE-AT ?auto_1344333 ?auto_1344338 ) ( CLEAR ?auto_1344333 ) ( IS-CRATE ?auto_1344335 ) ( not ( = ?auto_1344333 ?auto_1344335 ) ) ( AVAILABLE ?auto_1344336 ) ( IN ?auto_1344335 ?auto_1344337 ) ( ON ?auto_1344333 ?auto_1344334 ) ( not ( = ?auto_1344334 ?auto_1344333 ) ) ( not ( = ?auto_1344334 ?auto_1344335 ) ) ( TRUCK-AT ?auto_1344337 ?auto_1344339 ) ( not ( = ?auto_1344339 ?auto_1344338 ) ) ( ON ?auto_1344331 ?auto_1344330 ) ( ON ?auto_1344332 ?auto_1344331 ) ( ON ?auto_1344334 ?auto_1344332 ) ( not ( = ?auto_1344330 ?auto_1344331 ) ) ( not ( = ?auto_1344330 ?auto_1344332 ) ) ( not ( = ?auto_1344330 ?auto_1344334 ) ) ( not ( = ?auto_1344330 ?auto_1344333 ) ) ( not ( = ?auto_1344330 ?auto_1344335 ) ) ( not ( = ?auto_1344331 ?auto_1344332 ) ) ( not ( = ?auto_1344331 ?auto_1344334 ) ) ( not ( = ?auto_1344331 ?auto_1344333 ) ) ( not ( = ?auto_1344331 ?auto_1344335 ) ) ( not ( = ?auto_1344332 ?auto_1344334 ) ) ( not ( = ?auto_1344332 ?auto_1344333 ) ) ( not ( = ?auto_1344332 ?auto_1344335 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344334 ?auto_1344333 ?auto_1344335 )
      ( MAKE-5CRATE-VERIFY ?auto_1344330 ?auto_1344331 ?auto_1344332 ?auto_1344334 ?auto_1344333 ?auto_1344335 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1344375 - SURFACE
      ?auto_1344376 - SURFACE
      ?auto_1344377 - SURFACE
      ?auto_1344379 - SURFACE
      ?auto_1344378 - SURFACE
      ?auto_1344380 - SURFACE
    )
    :vars
    (
      ?auto_1344382 - HOIST
      ?auto_1344384 - PLACE
      ?auto_1344381 - TRUCK
      ?auto_1344385 - PLACE
      ?auto_1344383 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344382 ?auto_1344384 ) ( SURFACE-AT ?auto_1344378 ?auto_1344384 ) ( CLEAR ?auto_1344378 ) ( IS-CRATE ?auto_1344380 ) ( not ( = ?auto_1344378 ?auto_1344380 ) ) ( AVAILABLE ?auto_1344382 ) ( ON ?auto_1344378 ?auto_1344379 ) ( not ( = ?auto_1344379 ?auto_1344378 ) ) ( not ( = ?auto_1344379 ?auto_1344380 ) ) ( TRUCK-AT ?auto_1344381 ?auto_1344385 ) ( not ( = ?auto_1344385 ?auto_1344384 ) ) ( HOIST-AT ?auto_1344383 ?auto_1344385 ) ( LIFTING ?auto_1344383 ?auto_1344380 ) ( not ( = ?auto_1344382 ?auto_1344383 ) ) ( ON ?auto_1344376 ?auto_1344375 ) ( ON ?auto_1344377 ?auto_1344376 ) ( ON ?auto_1344379 ?auto_1344377 ) ( not ( = ?auto_1344375 ?auto_1344376 ) ) ( not ( = ?auto_1344375 ?auto_1344377 ) ) ( not ( = ?auto_1344375 ?auto_1344379 ) ) ( not ( = ?auto_1344375 ?auto_1344378 ) ) ( not ( = ?auto_1344375 ?auto_1344380 ) ) ( not ( = ?auto_1344376 ?auto_1344377 ) ) ( not ( = ?auto_1344376 ?auto_1344379 ) ) ( not ( = ?auto_1344376 ?auto_1344378 ) ) ( not ( = ?auto_1344376 ?auto_1344380 ) ) ( not ( = ?auto_1344377 ?auto_1344379 ) ) ( not ( = ?auto_1344377 ?auto_1344378 ) ) ( not ( = ?auto_1344377 ?auto_1344380 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344379 ?auto_1344378 ?auto_1344380 )
      ( MAKE-5CRATE-VERIFY ?auto_1344375 ?auto_1344376 ?auto_1344377 ?auto_1344379 ?auto_1344378 ?auto_1344380 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1344425 - SURFACE
      ?auto_1344426 - SURFACE
      ?auto_1344427 - SURFACE
      ?auto_1344429 - SURFACE
      ?auto_1344428 - SURFACE
      ?auto_1344430 - SURFACE
    )
    :vars
    (
      ?auto_1344431 - HOIST
      ?auto_1344436 - PLACE
      ?auto_1344434 - TRUCK
      ?auto_1344435 - PLACE
      ?auto_1344432 - HOIST
      ?auto_1344433 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344431 ?auto_1344436 ) ( SURFACE-AT ?auto_1344428 ?auto_1344436 ) ( CLEAR ?auto_1344428 ) ( IS-CRATE ?auto_1344430 ) ( not ( = ?auto_1344428 ?auto_1344430 ) ) ( AVAILABLE ?auto_1344431 ) ( ON ?auto_1344428 ?auto_1344429 ) ( not ( = ?auto_1344429 ?auto_1344428 ) ) ( not ( = ?auto_1344429 ?auto_1344430 ) ) ( TRUCK-AT ?auto_1344434 ?auto_1344435 ) ( not ( = ?auto_1344435 ?auto_1344436 ) ) ( HOIST-AT ?auto_1344432 ?auto_1344435 ) ( not ( = ?auto_1344431 ?auto_1344432 ) ) ( AVAILABLE ?auto_1344432 ) ( SURFACE-AT ?auto_1344430 ?auto_1344435 ) ( ON ?auto_1344430 ?auto_1344433 ) ( CLEAR ?auto_1344430 ) ( not ( = ?auto_1344428 ?auto_1344433 ) ) ( not ( = ?auto_1344430 ?auto_1344433 ) ) ( not ( = ?auto_1344429 ?auto_1344433 ) ) ( ON ?auto_1344426 ?auto_1344425 ) ( ON ?auto_1344427 ?auto_1344426 ) ( ON ?auto_1344429 ?auto_1344427 ) ( not ( = ?auto_1344425 ?auto_1344426 ) ) ( not ( = ?auto_1344425 ?auto_1344427 ) ) ( not ( = ?auto_1344425 ?auto_1344429 ) ) ( not ( = ?auto_1344425 ?auto_1344428 ) ) ( not ( = ?auto_1344425 ?auto_1344430 ) ) ( not ( = ?auto_1344425 ?auto_1344433 ) ) ( not ( = ?auto_1344426 ?auto_1344427 ) ) ( not ( = ?auto_1344426 ?auto_1344429 ) ) ( not ( = ?auto_1344426 ?auto_1344428 ) ) ( not ( = ?auto_1344426 ?auto_1344430 ) ) ( not ( = ?auto_1344426 ?auto_1344433 ) ) ( not ( = ?auto_1344427 ?auto_1344429 ) ) ( not ( = ?auto_1344427 ?auto_1344428 ) ) ( not ( = ?auto_1344427 ?auto_1344430 ) ) ( not ( = ?auto_1344427 ?auto_1344433 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344429 ?auto_1344428 ?auto_1344430 )
      ( MAKE-5CRATE-VERIFY ?auto_1344425 ?auto_1344426 ?auto_1344427 ?auto_1344429 ?auto_1344428 ?auto_1344430 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1344476 - SURFACE
      ?auto_1344477 - SURFACE
      ?auto_1344478 - SURFACE
      ?auto_1344480 - SURFACE
      ?auto_1344479 - SURFACE
      ?auto_1344481 - SURFACE
    )
    :vars
    (
      ?auto_1344483 - HOIST
      ?auto_1344485 - PLACE
      ?auto_1344486 - PLACE
      ?auto_1344482 - HOIST
      ?auto_1344484 - SURFACE
      ?auto_1344487 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344483 ?auto_1344485 ) ( SURFACE-AT ?auto_1344479 ?auto_1344485 ) ( CLEAR ?auto_1344479 ) ( IS-CRATE ?auto_1344481 ) ( not ( = ?auto_1344479 ?auto_1344481 ) ) ( AVAILABLE ?auto_1344483 ) ( ON ?auto_1344479 ?auto_1344480 ) ( not ( = ?auto_1344480 ?auto_1344479 ) ) ( not ( = ?auto_1344480 ?auto_1344481 ) ) ( not ( = ?auto_1344486 ?auto_1344485 ) ) ( HOIST-AT ?auto_1344482 ?auto_1344486 ) ( not ( = ?auto_1344483 ?auto_1344482 ) ) ( AVAILABLE ?auto_1344482 ) ( SURFACE-AT ?auto_1344481 ?auto_1344486 ) ( ON ?auto_1344481 ?auto_1344484 ) ( CLEAR ?auto_1344481 ) ( not ( = ?auto_1344479 ?auto_1344484 ) ) ( not ( = ?auto_1344481 ?auto_1344484 ) ) ( not ( = ?auto_1344480 ?auto_1344484 ) ) ( TRUCK-AT ?auto_1344487 ?auto_1344485 ) ( ON ?auto_1344477 ?auto_1344476 ) ( ON ?auto_1344478 ?auto_1344477 ) ( ON ?auto_1344480 ?auto_1344478 ) ( not ( = ?auto_1344476 ?auto_1344477 ) ) ( not ( = ?auto_1344476 ?auto_1344478 ) ) ( not ( = ?auto_1344476 ?auto_1344480 ) ) ( not ( = ?auto_1344476 ?auto_1344479 ) ) ( not ( = ?auto_1344476 ?auto_1344481 ) ) ( not ( = ?auto_1344476 ?auto_1344484 ) ) ( not ( = ?auto_1344477 ?auto_1344478 ) ) ( not ( = ?auto_1344477 ?auto_1344480 ) ) ( not ( = ?auto_1344477 ?auto_1344479 ) ) ( not ( = ?auto_1344477 ?auto_1344481 ) ) ( not ( = ?auto_1344477 ?auto_1344484 ) ) ( not ( = ?auto_1344478 ?auto_1344480 ) ) ( not ( = ?auto_1344478 ?auto_1344479 ) ) ( not ( = ?auto_1344478 ?auto_1344481 ) ) ( not ( = ?auto_1344478 ?auto_1344484 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344480 ?auto_1344479 ?auto_1344481 )
      ( MAKE-5CRATE-VERIFY ?auto_1344476 ?auto_1344477 ?auto_1344478 ?auto_1344480 ?auto_1344479 ?auto_1344481 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1344527 - SURFACE
      ?auto_1344528 - SURFACE
      ?auto_1344529 - SURFACE
      ?auto_1344531 - SURFACE
      ?auto_1344530 - SURFACE
      ?auto_1344532 - SURFACE
    )
    :vars
    (
      ?auto_1344538 - HOIST
      ?auto_1344533 - PLACE
      ?auto_1344537 - PLACE
      ?auto_1344536 - HOIST
      ?auto_1344534 - SURFACE
      ?auto_1344535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344538 ?auto_1344533 ) ( IS-CRATE ?auto_1344532 ) ( not ( = ?auto_1344530 ?auto_1344532 ) ) ( not ( = ?auto_1344531 ?auto_1344530 ) ) ( not ( = ?auto_1344531 ?auto_1344532 ) ) ( not ( = ?auto_1344537 ?auto_1344533 ) ) ( HOIST-AT ?auto_1344536 ?auto_1344537 ) ( not ( = ?auto_1344538 ?auto_1344536 ) ) ( AVAILABLE ?auto_1344536 ) ( SURFACE-AT ?auto_1344532 ?auto_1344537 ) ( ON ?auto_1344532 ?auto_1344534 ) ( CLEAR ?auto_1344532 ) ( not ( = ?auto_1344530 ?auto_1344534 ) ) ( not ( = ?auto_1344532 ?auto_1344534 ) ) ( not ( = ?auto_1344531 ?auto_1344534 ) ) ( TRUCK-AT ?auto_1344535 ?auto_1344533 ) ( SURFACE-AT ?auto_1344531 ?auto_1344533 ) ( CLEAR ?auto_1344531 ) ( LIFTING ?auto_1344538 ?auto_1344530 ) ( IS-CRATE ?auto_1344530 ) ( ON ?auto_1344528 ?auto_1344527 ) ( ON ?auto_1344529 ?auto_1344528 ) ( ON ?auto_1344531 ?auto_1344529 ) ( not ( = ?auto_1344527 ?auto_1344528 ) ) ( not ( = ?auto_1344527 ?auto_1344529 ) ) ( not ( = ?auto_1344527 ?auto_1344531 ) ) ( not ( = ?auto_1344527 ?auto_1344530 ) ) ( not ( = ?auto_1344527 ?auto_1344532 ) ) ( not ( = ?auto_1344527 ?auto_1344534 ) ) ( not ( = ?auto_1344528 ?auto_1344529 ) ) ( not ( = ?auto_1344528 ?auto_1344531 ) ) ( not ( = ?auto_1344528 ?auto_1344530 ) ) ( not ( = ?auto_1344528 ?auto_1344532 ) ) ( not ( = ?auto_1344528 ?auto_1344534 ) ) ( not ( = ?auto_1344529 ?auto_1344531 ) ) ( not ( = ?auto_1344529 ?auto_1344530 ) ) ( not ( = ?auto_1344529 ?auto_1344532 ) ) ( not ( = ?auto_1344529 ?auto_1344534 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344531 ?auto_1344530 ?auto_1344532 )
      ( MAKE-5CRATE-VERIFY ?auto_1344527 ?auto_1344528 ?auto_1344529 ?auto_1344531 ?auto_1344530 ?auto_1344532 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1344578 - SURFACE
      ?auto_1344579 - SURFACE
      ?auto_1344580 - SURFACE
      ?auto_1344582 - SURFACE
      ?auto_1344581 - SURFACE
      ?auto_1344583 - SURFACE
    )
    :vars
    (
      ?auto_1344588 - HOIST
      ?auto_1344587 - PLACE
      ?auto_1344586 - PLACE
      ?auto_1344589 - HOIST
      ?auto_1344585 - SURFACE
      ?auto_1344584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344588 ?auto_1344587 ) ( IS-CRATE ?auto_1344583 ) ( not ( = ?auto_1344581 ?auto_1344583 ) ) ( not ( = ?auto_1344582 ?auto_1344581 ) ) ( not ( = ?auto_1344582 ?auto_1344583 ) ) ( not ( = ?auto_1344586 ?auto_1344587 ) ) ( HOIST-AT ?auto_1344589 ?auto_1344586 ) ( not ( = ?auto_1344588 ?auto_1344589 ) ) ( AVAILABLE ?auto_1344589 ) ( SURFACE-AT ?auto_1344583 ?auto_1344586 ) ( ON ?auto_1344583 ?auto_1344585 ) ( CLEAR ?auto_1344583 ) ( not ( = ?auto_1344581 ?auto_1344585 ) ) ( not ( = ?auto_1344583 ?auto_1344585 ) ) ( not ( = ?auto_1344582 ?auto_1344585 ) ) ( TRUCK-AT ?auto_1344584 ?auto_1344587 ) ( SURFACE-AT ?auto_1344582 ?auto_1344587 ) ( CLEAR ?auto_1344582 ) ( IS-CRATE ?auto_1344581 ) ( AVAILABLE ?auto_1344588 ) ( IN ?auto_1344581 ?auto_1344584 ) ( ON ?auto_1344579 ?auto_1344578 ) ( ON ?auto_1344580 ?auto_1344579 ) ( ON ?auto_1344582 ?auto_1344580 ) ( not ( = ?auto_1344578 ?auto_1344579 ) ) ( not ( = ?auto_1344578 ?auto_1344580 ) ) ( not ( = ?auto_1344578 ?auto_1344582 ) ) ( not ( = ?auto_1344578 ?auto_1344581 ) ) ( not ( = ?auto_1344578 ?auto_1344583 ) ) ( not ( = ?auto_1344578 ?auto_1344585 ) ) ( not ( = ?auto_1344579 ?auto_1344580 ) ) ( not ( = ?auto_1344579 ?auto_1344582 ) ) ( not ( = ?auto_1344579 ?auto_1344581 ) ) ( not ( = ?auto_1344579 ?auto_1344583 ) ) ( not ( = ?auto_1344579 ?auto_1344585 ) ) ( not ( = ?auto_1344580 ?auto_1344582 ) ) ( not ( = ?auto_1344580 ?auto_1344581 ) ) ( not ( = ?auto_1344580 ?auto_1344583 ) ) ( not ( = ?auto_1344580 ?auto_1344585 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344582 ?auto_1344581 ?auto_1344583 )
      ( MAKE-5CRATE-VERIFY ?auto_1344578 ?auto_1344579 ?auto_1344580 ?auto_1344582 ?auto_1344581 ?auto_1344583 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1345787 - SURFACE
      ?auto_1345788 - SURFACE
      ?auto_1345789 - SURFACE
      ?auto_1345791 - SURFACE
      ?auto_1345790 - SURFACE
      ?auto_1345792 - SURFACE
      ?auto_1345793 - SURFACE
    )
    :vars
    (
      ?auto_1345795 - HOIST
      ?auto_1345794 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1345795 ?auto_1345794 ) ( SURFACE-AT ?auto_1345792 ?auto_1345794 ) ( CLEAR ?auto_1345792 ) ( LIFTING ?auto_1345795 ?auto_1345793 ) ( IS-CRATE ?auto_1345793 ) ( not ( = ?auto_1345792 ?auto_1345793 ) ) ( ON ?auto_1345788 ?auto_1345787 ) ( ON ?auto_1345789 ?auto_1345788 ) ( ON ?auto_1345791 ?auto_1345789 ) ( ON ?auto_1345790 ?auto_1345791 ) ( ON ?auto_1345792 ?auto_1345790 ) ( not ( = ?auto_1345787 ?auto_1345788 ) ) ( not ( = ?auto_1345787 ?auto_1345789 ) ) ( not ( = ?auto_1345787 ?auto_1345791 ) ) ( not ( = ?auto_1345787 ?auto_1345790 ) ) ( not ( = ?auto_1345787 ?auto_1345792 ) ) ( not ( = ?auto_1345787 ?auto_1345793 ) ) ( not ( = ?auto_1345788 ?auto_1345789 ) ) ( not ( = ?auto_1345788 ?auto_1345791 ) ) ( not ( = ?auto_1345788 ?auto_1345790 ) ) ( not ( = ?auto_1345788 ?auto_1345792 ) ) ( not ( = ?auto_1345788 ?auto_1345793 ) ) ( not ( = ?auto_1345789 ?auto_1345791 ) ) ( not ( = ?auto_1345789 ?auto_1345790 ) ) ( not ( = ?auto_1345789 ?auto_1345792 ) ) ( not ( = ?auto_1345789 ?auto_1345793 ) ) ( not ( = ?auto_1345791 ?auto_1345790 ) ) ( not ( = ?auto_1345791 ?auto_1345792 ) ) ( not ( = ?auto_1345791 ?auto_1345793 ) ) ( not ( = ?auto_1345790 ?auto_1345792 ) ) ( not ( = ?auto_1345790 ?auto_1345793 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1345792 ?auto_1345793 )
      ( MAKE-6CRATE-VERIFY ?auto_1345787 ?auto_1345788 ?auto_1345789 ?auto_1345791 ?auto_1345790 ?auto_1345792 ?auto_1345793 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1345831 - SURFACE
      ?auto_1345832 - SURFACE
      ?auto_1345833 - SURFACE
      ?auto_1345835 - SURFACE
      ?auto_1345834 - SURFACE
      ?auto_1345836 - SURFACE
      ?auto_1345837 - SURFACE
    )
    :vars
    (
      ?auto_1345840 - HOIST
      ?auto_1345839 - PLACE
      ?auto_1345838 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1345840 ?auto_1345839 ) ( SURFACE-AT ?auto_1345836 ?auto_1345839 ) ( CLEAR ?auto_1345836 ) ( IS-CRATE ?auto_1345837 ) ( not ( = ?auto_1345836 ?auto_1345837 ) ) ( TRUCK-AT ?auto_1345838 ?auto_1345839 ) ( AVAILABLE ?auto_1345840 ) ( IN ?auto_1345837 ?auto_1345838 ) ( ON ?auto_1345836 ?auto_1345834 ) ( not ( = ?auto_1345834 ?auto_1345836 ) ) ( not ( = ?auto_1345834 ?auto_1345837 ) ) ( ON ?auto_1345832 ?auto_1345831 ) ( ON ?auto_1345833 ?auto_1345832 ) ( ON ?auto_1345835 ?auto_1345833 ) ( ON ?auto_1345834 ?auto_1345835 ) ( not ( = ?auto_1345831 ?auto_1345832 ) ) ( not ( = ?auto_1345831 ?auto_1345833 ) ) ( not ( = ?auto_1345831 ?auto_1345835 ) ) ( not ( = ?auto_1345831 ?auto_1345834 ) ) ( not ( = ?auto_1345831 ?auto_1345836 ) ) ( not ( = ?auto_1345831 ?auto_1345837 ) ) ( not ( = ?auto_1345832 ?auto_1345833 ) ) ( not ( = ?auto_1345832 ?auto_1345835 ) ) ( not ( = ?auto_1345832 ?auto_1345834 ) ) ( not ( = ?auto_1345832 ?auto_1345836 ) ) ( not ( = ?auto_1345832 ?auto_1345837 ) ) ( not ( = ?auto_1345833 ?auto_1345835 ) ) ( not ( = ?auto_1345833 ?auto_1345834 ) ) ( not ( = ?auto_1345833 ?auto_1345836 ) ) ( not ( = ?auto_1345833 ?auto_1345837 ) ) ( not ( = ?auto_1345835 ?auto_1345834 ) ) ( not ( = ?auto_1345835 ?auto_1345836 ) ) ( not ( = ?auto_1345835 ?auto_1345837 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1345834 ?auto_1345836 ?auto_1345837 )
      ( MAKE-6CRATE-VERIFY ?auto_1345831 ?auto_1345832 ?auto_1345833 ?auto_1345835 ?auto_1345834 ?auto_1345836 ?auto_1345837 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1345882 - SURFACE
      ?auto_1345883 - SURFACE
      ?auto_1345884 - SURFACE
      ?auto_1345886 - SURFACE
      ?auto_1345885 - SURFACE
      ?auto_1345887 - SURFACE
      ?auto_1345888 - SURFACE
    )
    :vars
    (
      ?auto_1345890 - HOIST
      ?auto_1345889 - PLACE
      ?auto_1345891 - TRUCK
      ?auto_1345892 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1345890 ?auto_1345889 ) ( SURFACE-AT ?auto_1345887 ?auto_1345889 ) ( CLEAR ?auto_1345887 ) ( IS-CRATE ?auto_1345888 ) ( not ( = ?auto_1345887 ?auto_1345888 ) ) ( AVAILABLE ?auto_1345890 ) ( IN ?auto_1345888 ?auto_1345891 ) ( ON ?auto_1345887 ?auto_1345885 ) ( not ( = ?auto_1345885 ?auto_1345887 ) ) ( not ( = ?auto_1345885 ?auto_1345888 ) ) ( TRUCK-AT ?auto_1345891 ?auto_1345892 ) ( not ( = ?auto_1345892 ?auto_1345889 ) ) ( ON ?auto_1345883 ?auto_1345882 ) ( ON ?auto_1345884 ?auto_1345883 ) ( ON ?auto_1345886 ?auto_1345884 ) ( ON ?auto_1345885 ?auto_1345886 ) ( not ( = ?auto_1345882 ?auto_1345883 ) ) ( not ( = ?auto_1345882 ?auto_1345884 ) ) ( not ( = ?auto_1345882 ?auto_1345886 ) ) ( not ( = ?auto_1345882 ?auto_1345885 ) ) ( not ( = ?auto_1345882 ?auto_1345887 ) ) ( not ( = ?auto_1345882 ?auto_1345888 ) ) ( not ( = ?auto_1345883 ?auto_1345884 ) ) ( not ( = ?auto_1345883 ?auto_1345886 ) ) ( not ( = ?auto_1345883 ?auto_1345885 ) ) ( not ( = ?auto_1345883 ?auto_1345887 ) ) ( not ( = ?auto_1345883 ?auto_1345888 ) ) ( not ( = ?auto_1345884 ?auto_1345886 ) ) ( not ( = ?auto_1345884 ?auto_1345885 ) ) ( not ( = ?auto_1345884 ?auto_1345887 ) ) ( not ( = ?auto_1345884 ?auto_1345888 ) ) ( not ( = ?auto_1345886 ?auto_1345885 ) ) ( not ( = ?auto_1345886 ?auto_1345887 ) ) ( not ( = ?auto_1345886 ?auto_1345888 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1345885 ?auto_1345887 ?auto_1345888 )
      ( MAKE-6CRATE-VERIFY ?auto_1345882 ?auto_1345883 ?auto_1345884 ?auto_1345886 ?auto_1345885 ?auto_1345887 ?auto_1345888 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1345939 - SURFACE
      ?auto_1345940 - SURFACE
      ?auto_1345941 - SURFACE
      ?auto_1345943 - SURFACE
      ?auto_1345942 - SURFACE
      ?auto_1345944 - SURFACE
      ?auto_1345945 - SURFACE
    )
    :vars
    (
      ?auto_1345950 - HOIST
      ?auto_1345948 - PLACE
      ?auto_1345947 - TRUCK
      ?auto_1345946 - PLACE
      ?auto_1345949 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1345950 ?auto_1345948 ) ( SURFACE-AT ?auto_1345944 ?auto_1345948 ) ( CLEAR ?auto_1345944 ) ( IS-CRATE ?auto_1345945 ) ( not ( = ?auto_1345944 ?auto_1345945 ) ) ( AVAILABLE ?auto_1345950 ) ( ON ?auto_1345944 ?auto_1345942 ) ( not ( = ?auto_1345942 ?auto_1345944 ) ) ( not ( = ?auto_1345942 ?auto_1345945 ) ) ( TRUCK-AT ?auto_1345947 ?auto_1345946 ) ( not ( = ?auto_1345946 ?auto_1345948 ) ) ( HOIST-AT ?auto_1345949 ?auto_1345946 ) ( LIFTING ?auto_1345949 ?auto_1345945 ) ( not ( = ?auto_1345950 ?auto_1345949 ) ) ( ON ?auto_1345940 ?auto_1345939 ) ( ON ?auto_1345941 ?auto_1345940 ) ( ON ?auto_1345943 ?auto_1345941 ) ( ON ?auto_1345942 ?auto_1345943 ) ( not ( = ?auto_1345939 ?auto_1345940 ) ) ( not ( = ?auto_1345939 ?auto_1345941 ) ) ( not ( = ?auto_1345939 ?auto_1345943 ) ) ( not ( = ?auto_1345939 ?auto_1345942 ) ) ( not ( = ?auto_1345939 ?auto_1345944 ) ) ( not ( = ?auto_1345939 ?auto_1345945 ) ) ( not ( = ?auto_1345940 ?auto_1345941 ) ) ( not ( = ?auto_1345940 ?auto_1345943 ) ) ( not ( = ?auto_1345940 ?auto_1345942 ) ) ( not ( = ?auto_1345940 ?auto_1345944 ) ) ( not ( = ?auto_1345940 ?auto_1345945 ) ) ( not ( = ?auto_1345941 ?auto_1345943 ) ) ( not ( = ?auto_1345941 ?auto_1345942 ) ) ( not ( = ?auto_1345941 ?auto_1345944 ) ) ( not ( = ?auto_1345941 ?auto_1345945 ) ) ( not ( = ?auto_1345943 ?auto_1345942 ) ) ( not ( = ?auto_1345943 ?auto_1345944 ) ) ( not ( = ?auto_1345943 ?auto_1345945 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1345942 ?auto_1345944 ?auto_1345945 )
      ( MAKE-6CRATE-VERIFY ?auto_1345939 ?auto_1345940 ?auto_1345941 ?auto_1345943 ?auto_1345942 ?auto_1345944 ?auto_1345945 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1346002 - SURFACE
      ?auto_1346003 - SURFACE
      ?auto_1346004 - SURFACE
      ?auto_1346006 - SURFACE
      ?auto_1346005 - SURFACE
      ?auto_1346007 - SURFACE
      ?auto_1346008 - SURFACE
    )
    :vars
    (
      ?auto_1346013 - HOIST
      ?auto_1346009 - PLACE
      ?auto_1346011 - TRUCK
      ?auto_1346012 - PLACE
      ?auto_1346014 - HOIST
      ?auto_1346010 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1346013 ?auto_1346009 ) ( SURFACE-AT ?auto_1346007 ?auto_1346009 ) ( CLEAR ?auto_1346007 ) ( IS-CRATE ?auto_1346008 ) ( not ( = ?auto_1346007 ?auto_1346008 ) ) ( AVAILABLE ?auto_1346013 ) ( ON ?auto_1346007 ?auto_1346005 ) ( not ( = ?auto_1346005 ?auto_1346007 ) ) ( not ( = ?auto_1346005 ?auto_1346008 ) ) ( TRUCK-AT ?auto_1346011 ?auto_1346012 ) ( not ( = ?auto_1346012 ?auto_1346009 ) ) ( HOIST-AT ?auto_1346014 ?auto_1346012 ) ( not ( = ?auto_1346013 ?auto_1346014 ) ) ( AVAILABLE ?auto_1346014 ) ( SURFACE-AT ?auto_1346008 ?auto_1346012 ) ( ON ?auto_1346008 ?auto_1346010 ) ( CLEAR ?auto_1346008 ) ( not ( = ?auto_1346007 ?auto_1346010 ) ) ( not ( = ?auto_1346008 ?auto_1346010 ) ) ( not ( = ?auto_1346005 ?auto_1346010 ) ) ( ON ?auto_1346003 ?auto_1346002 ) ( ON ?auto_1346004 ?auto_1346003 ) ( ON ?auto_1346006 ?auto_1346004 ) ( ON ?auto_1346005 ?auto_1346006 ) ( not ( = ?auto_1346002 ?auto_1346003 ) ) ( not ( = ?auto_1346002 ?auto_1346004 ) ) ( not ( = ?auto_1346002 ?auto_1346006 ) ) ( not ( = ?auto_1346002 ?auto_1346005 ) ) ( not ( = ?auto_1346002 ?auto_1346007 ) ) ( not ( = ?auto_1346002 ?auto_1346008 ) ) ( not ( = ?auto_1346002 ?auto_1346010 ) ) ( not ( = ?auto_1346003 ?auto_1346004 ) ) ( not ( = ?auto_1346003 ?auto_1346006 ) ) ( not ( = ?auto_1346003 ?auto_1346005 ) ) ( not ( = ?auto_1346003 ?auto_1346007 ) ) ( not ( = ?auto_1346003 ?auto_1346008 ) ) ( not ( = ?auto_1346003 ?auto_1346010 ) ) ( not ( = ?auto_1346004 ?auto_1346006 ) ) ( not ( = ?auto_1346004 ?auto_1346005 ) ) ( not ( = ?auto_1346004 ?auto_1346007 ) ) ( not ( = ?auto_1346004 ?auto_1346008 ) ) ( not ( = ?auto_1346004 ?auto_1346010 ) ) ( not ( = ?auto_1346006 ?auto_1346005 ) ) ( not ( = ?auto_1346006 ?auto_1346007 ) ) ( not ( = ?auto_1346006 ?auto_1346008 ) ) ( not ( = ?auto_1346006 ?auto_1346010 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1346005 ?auto_1346007 ?auto_1346008 )
      ( MAKE-6CRATE-VERIFY ?auto_1346002 ?auto_1346003 ?auto_1346004 ?auto_1346006 ?auto_1346005 ?auto_1346007 ?auto_1346008 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1346066 - SURFACE
      ?auto_1346067 - SURFACE
      ?auto_1346068 - SURFACE
      ?auto_1346070 - SURFACE
      ?auto_1346069 - SURFACE
      ?auto_1346071 - SURFACE
      ?auto_1346072 - SURFACE
    )
    :vars
    (
      ?auto_1346077 - HOIST
      ?auto_1346076 - PLACE
      ?auto_1346078 - PLACE
      ?auto_1346075 - HOIST
      ?auto_1346073 - SURFACE
      ?auto_1346074 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1346077 ?auto_1346076 ) ( SURFACE-AT ?auto_1346071 ?auto_1346076 ) ( CLEAR ?auto_1346071 ) ( IS-CRATE ?auto_1346072 ) ( not ( = ?auto_1346071 ?auto_1346072 ) ) ( AVAILABLE ?auto_1346077 ) ( ON ?auto_1346071 ?auto_1346069 ) ( not ( = ?auto_1346069 ?auto_1346071 ) ) ( not ( = ?auto_1346069 ?auto_1346072 ) ) ( not ( = ?auto_1346078 ?auto_1346076 ) ) ( HOIST-AT ?auto_1346075 ?auto_1346078 ) ( not ( = ?auto_1346077 ?auto_1346075 ) ) ( AVAILABLE ?auto_1346075 ) ( SURFACE-AT ?auto_1346072 ?auto_1346078 ) ( ON ?auto_1346072 ?auto_1346073 ) ( CLEAR ?auto_1346072 ) ( not ( = ?auto_1346071 ?auto_1346073 ) ) ( not ( = ?auto_1346072 ?auto_1346073 ) ) ( not ( = ?auto_1346069 ?auto_1346073 ) ) ( TRUCK-AT ?auto_1346074 ?auto_1346076 ) ( ON ?auto_1346067 ?auto_1346066 ) ( ON ?auto_1346068 ?auto_1346067 ) ( ON ?auto_1346070 ?auto_1346068 ) ( ON ?auto_1346069 ?auto_1346070 ) ( not ( = ?auto_1346066 ?auto_1346067 ) ) ( not ( = ?auto_1346066 ?auto_1346068 ) ) ( not ( = ?auto_1346066 ?auto_1346070 ) ) ( not ( = ?auto_1346066 ?auto_1346069 ) ) ( not ( = ?auto_1346066 ?auto_1346071 ) ) ( not ( = ?auto_1346066 ?auto_1346072 ) ) ( not ( = ?auto_1346066 ?auto_1346073 ) ) ( not ( = ?auto_1346067 ?auto_1346068 ) ) ( not ( = ?auto_1346067 ?auto_1346070 ) ) ( not ( = ?auto_1346067 ?auto_1346069 ) ) ( not ( = ?auto_1346067 ?auto_1346071 ) ) ( not ( = ?auto_1346067 ?auto_1346072 ) ) ( not ( = ?auto_1346067 ?auto_1346073 ) ) ( not ( = ?auto_1346068 ?auto_1346070 ) ) ( not ( = ?auto_1346068 ?auto_1346069 ) ) ( not ( = ?auto_1346068 ?auto_1346071 ) ) ( not ( = ?auto_1346068 ?auto_1346072 ) ) ( not ( = ?auto_1346068 ?auto_1346073 ) ) ( not ( = ?auto_1346070 ?auto_1346069 ) ) ( not ( = ?auto_1346070 ?auto_1346071 ) ) ( not ( = ?auto_1346070 ?auto_1346072 ) ) ( not ( = ?auto_1346070 ?auto_1346073 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1346069 ?auto_1346071 ?auto_1346072 )
      ( MAKE-6CRATE-VERIFY ?auto_1346066 ?auto_1346067 ?auto_1346068 ?auto_1346070 ?auto_1346069 ?auto_1346071 ?auto_1346072 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1346130 - SURFACE
      ?auto_1346131 - SURFACE
      ?auto_1346132 - SURFACE
      ?auto_1346134 - SURFACE
      ?auto_1346133 - SURFACE
      ?auto_1346135 - SURFACE
      ?auto_1346136 - SURFACE
    )
    :vars
    (
      ?auto_1346142 - HOIST
      ?auto_1346141 - PLACE
      ?auto_1346137 - PLACE
      ?auto_1346139 - HOIST
      ?auto_1346140 - SURFACE
      ?auto_1346138 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1346142 ?auto_1346141 ) ( IS-CRATE ?auto_1346136 ) ( not ( = ?auto_1346135 ?auto_1346136 ) ) ( not ( = ?auto_1346133 ?auto_1346135 ) ) ( not ( = ?auto_1346133 ?auto_1346136 ) ) ( not ( = ?auto_1346137 ?auto_1346141 ) ) ( HOIST-AT ?auto_1346139 ?auto_1346137 ) ( not ( = ?auto_1346142 ?auto_1346139 ) ) ( AVAILABLE ?auto_1346139 ) ( SURFACE-AT ?auto_1346136 ?auto_1346137 ) ( ON ?auto_1346136 ?auto_1346140 ) ( CLEAR ?auto_1346136 ) ( not ( = ?auto_1346135 ?auto_1346140 ) ) ( not ( = ?auto_1346136 ?auto_1346140 ) ) ( not ( = ?auto_1346133 ?auto_1346140 ) ) ( TRUCK-AT ?auto_1346138 ?auto_1346141 ) ( SURFACE-AT ?auto_1346133 ?auto_1346141 ) ( CLEAR ?auto_1346133 ) ( LIFTING ?auto_1346142 ?auto_1346135 ) ( IS-CRATE ?auto_1346135 ) ( ON ?auto_1346131 ?auto_1346130 ) ( ON ?auto_1346132 ?auto_1346131 ) ( ON ?auto_1346134 ?auto_1346132 ) ( ON ?auto_1346133 ?auto_1346134 ) ( not ( = ?auto_1346130 ?auto_1346131 ) ) ( not ( = ?auto_1346130 ?auto_1346132 ) ) ( not ( = ?auto_1346130 ?auto_1346134 ) ) ( not ( = ?auto_1346130 ?auto_1346133 ) ) ( not ( = ?auto_1346130 ?auto_1346135 ) ) ( not ( = ?auto_1346130 ?auto_1346136 ) ) ( not ( = ?auto_1346130 ?auto_1346140 ) ) ( not ( = ?auto_1346131 ?auto_1346132 ) ) ( not ( = ?auto_1346131 ?auto_1346134 ) ) ( not ( = ?auto_1346131 ?auto_1346133 ) ) ( not ( = ?auto_1346131 ?auto_1346135 ) ) ( not ( = ?auto_1346131 ?auto_1346136 ) ) ( not ( = ?auto_1346131 ?auto_1346140 ) ) ( not ( = ?auto_1346132 ?auto_1346134 ) ) ( not ( = ?auto_1346132 ?auto_1346133 ) ) ( not ( = ?auto_1346132 ?auto_1346135 ) ) ( not ( = ?auto_1346132 ?auto_1346136 ) ) ( not ( = ?auto_1346132 ?auto_1346140 ) ) ( not ( = ?auto_1346134 ?auto_1346133 ) ) ( not ( = ?auto_1346134 ?auto_1346135 ) ) ( not ( = ?auto_1346134 ?auto_1346136 ) ) ( not ( = ?auto_1346134 ?auto_1346140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1346133 ?auto_1346135 ?auto_1346136 )
      ( MAKE-6CRATE-VERIFY ?auto_1346130 ?auto_1346131 ?auto_1346132 ?auto_1346134 ?auto_1346133 ?auto_1346135 ?auto_1346136 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1346194 - SURFACE
      ?auto_1346195 - SURFACE
      ?auto_1346196 - SURFACE
      ?auto_1346198 - SURFACE
      ?auto_1346197 - SURFACE
      ?auto_1346199 - SURFACE
      ?auto_1346200 - SURFACE
    )
    :vars
    (
      ?auto_1346206 - HOIST
      ?auto_1346204 - PLACE
      ?auto_1346201 - PLACE
      ?auto_1346202 - HOIST
      ?auto_1346205 - SURFACE
      ?auto_1346203 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1346206 ?auto_1346204 ) ( IS-CRATE ?auto_1346200 ) ( not ( = ?auto_1346199 ?auto_1346200 ) ) ( not ( = ?auto_1346197 ?auto_1346199 ) ) ( not ( = ?auto_1346197 ?auto_1346200 ) ) ( not ( = ?auto_1346201 ?auto_1346204 ) ) ( HOIST-AT ?auto_1346202 ?auto_1346201 ) ( not ( = ?auto_1346206 ?auto_1346202 ) ) ( AVAILABLE ?auto_1346202 ) ( SURFACE-AT ?auto_1346200 ?auto_1346201 ) ( ON ?auto_1346200 ?auto_1346205 ) ( CLEAR ?auto_1346200 ) ( not ( = ?auto_1346199 ?auto_1346205 ) ) ( not ( = ?auto_1346200 ?auto_1346205 ) ) ( not ( = ?auto_1346197 ?auto_1346205 ) ) ( TRUCK-AT ?auto_1346203 ?auto_1346204 ) ( SURFACE-AT ?auto_1346197 ?auto_1346204 ) ( CLEAR ?auto_1346197 ) ( IS-CRATE ?auto_1346199 ) ( AVAILABLE ?auto_1346206 ) ( IN ?auto_1346199 ?auto_1346203 ) ( ON ?auto_1346195 ?auto_1346194 ) ( ON ?auto_1346196 ?auto_1346195 ) ( ON ?auto_1346198 ?auto_1346196 ) ( ON ?auto_1346197 ?auto_1346198 ) ( not ( = ?auto_1346194 ?auto_1346195 ) ) ( not ( = ?auto_1346194 ?auto_1346196 ) ) ( not ( = ?auto_1346194 ?auto_1346198 ) ) ( not ( = ?auto_1346194 ?auto_1346197 ) ) ( not ( = ?auto_1346194 ?auto_1346199 ) ) ( not ( = ?auto_1346194 ?auto_1346200 ) ) ( not ( = ?auto_1346194 ?auto_1346205 ) ) ( not ( = ?auto_1346195 ?auto_1346196 ) ) ( not ( = ?auto_1346195 ?auto_1346198 ) ) ( not ( = ?auto_1346195 ?auto_1346197 ) ) ( not ( = ?auto_1346195 ?auto_1346199 ) ) ( not ( = ?auto_1346195 ?auto_1346200 ) ) ( not ( = ?auto_1346195 ?auto_1346205 ) ) ( not ( = ?auto_1346196 ?auto_1346198 ) ) ( not ( = ?auto_1346196 ?auto_1346197 ) ) ( not ( = ?auto_1346196 ?auto_1346199 ) ) ( not ( = ?auto_1346196 ?auto_1346200 ) ) ( not ( = ?auto_1346196 ?auto_1346205 ) ) ( not ( = ?auto_1346198 ?auto_1346197 ) ) ( not ( = ?auto_1346198 ?auto_1346199 ) ) ( not ( = ?auto_1346198 ?auto_1346200 ) ) ( not ( = ?auto_1346198 ?auto_1346205 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1346197 ?auto_1346199 ?auto_1346200 )
      ( MAKE-6CRATE-VERIFY ?auto_1346194 ?auto_1346195 ?auto_1346196 ?auto_1346198 ?auto_1346197 ?auto_1346199 ?auto_1346200 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1348150 - SURFACE
      ?auto_1348151 - SURFACE
      ?auto_1348152 - SURFACE
      ?auto_1348154 - SURFACE
      ?auto_1348153 - SURFACE
      ?auto_1348155 - SURFACE
      ?auto_1348156 - SURFACE
      ?auto_1348157 - SURFACE
    )
    :vars
    (
      ?auto_1348158 - HOIST
      ?auto_1348159 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1348158 ?auto_1348159 ) ( SURFACE-AT ?auto_1348156 ?auto_1348159 ) ( CLEAR ?auto_1348156 ) ( LIFTING ?auto_1348158 ?auto_1348157 ) ( IS-CRATE ?auto_1348157 ) ( not ( = ?auto_1348156 ?auto_1348157 ) ) ( ON ?auto_1348151 ?auto_1348150 ) ( ON ?auto_1348152 ?auto_1348151 ) ( ON ?auto_1348154 ?auto_1348152 ) ( ON ?auto_1348153 ?auto_1348154 ) ( ON ?auto_1348155 ?auto_1348153 ) ( ON ?auto_1348156 ?auto_1348155 ) ( not ( = ?auto_1348150 ?auto_1348151 ) ) ( not ( = ?auto_1348150 ?auto_1348152 ) ) ( not ( = ?auto_1348150 ?auto_1348154 ) ) ( not ( = ?auto_1348150 ?auto_1348153 ) ) ( not ( = ?auto_1348150 ?auto_1348155 ) ) ( not ( = ?auto_1348150 ?auto_1348156 ) ) ( not ( = ?auto_1348150 ?auto_1348157 ) ) ( not ( = ?auto_1348151 ?auto_1348152 ) ) ( not ( = ?auto_1348151 ?auto_1348154 ) ) ( not ( = ?auto_1348151 ?auto_1348153 ) ) ( not ( = ?auto_1348151 ?auto_1348155 ) ) ( not ( = ?auto_1348151 ?auto_1348156 ) ) ( not ( = ?auto_1348151 ?auto_1348157 ) ) ( not ( = ?auto_1348152 ?auto_1348154 ) ) ( not ( = ?auto_1348152 ?auto_1348153 ) ) ( not ( = ?auto_1348152 ?auto_1348155 ) ) ( not ( = ?auto_1348152 ?auto_1348156 ) ) ( not ( = ?auto_1348152 ?auto_1348157 ) ) ( not ( = ?auto_1348154 ?auto_1348153 ) ) ( not ( = ?auto_1348154 ?auto_1348155 ) ) ( not ( = ?auto_1348154 ?auto_1348156 ) ) ( not ( = ?auto_1348154 ?auto_1348157 ) ) ( not ( = ?auto_1348153 ?auto_1348155 ) ) ( not ( = ?auto_1348153 ?auto_1348156 ) ) ( not ( = ?auto_1348153 ?auto_1348157 ) ) ( not ( = ?auto_1348155 ?auto_1348156 ) ) ( not ( = ?auto_1348155 ?auto_1348157 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1348156 ?auto_1348157 )
      ( MAKE-7CRATE-VERIFY ?auto_1348150 ?auto_1348151 ?auto_1348152 ?auto_1348154 ?auto_1348153 ?auto_1348155 ?auto_1348156 ?auto_1348157 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1348205 - SURFACE
      ?auto_1348206 - SURFACE
      ?auto_1348207 - SURFACE
      ?auto_1348209 - SURFACE
      ?auto_1348208 - SURFACE
      ?auto_1348210 - SURFACE
      ?auto_1348211 - SURFACE
      ?auto_1348212 - SURFACE
    )
    :vars
    (
      ?auto_1348215 - HOIST
      ?auto_1348214 - PLACE
      ?auto_1348213 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1348215 ?auto_1348214 ) ( SURFACE-AT ?auto_1348211 ?auto_1348214 ) ( CLEAR ?auto_1348211 ) ( IS-CRATE ?auto_1348212 ) ( not ( = ?auto_1348211 ?auto_1348212 ) ) ( TRUCK-AT ?auto_1348213 ?auto_1348214 ) ( AVAILABLE ?auto_1348215 ) ( IN ?auto_1348212 ?auto_1348213 ) ( ON ?auto_1348211 ?auto_1348210 ) ( not ( = ?auto_1348210 ?auto_1348211 ) ) ( not ( = ?auto_1348210 ?auto_1348212 ) ) ( ON ?auto_1348206 ?auto_1348205 ) ( ON ?auto_1348207 ?auto_1348206 ) ( ON ?auto_1348209 ?auto_1348207 ) ( ON ?auto_1348208 ?auto_1348209 ) ( ON ?auto_1348210 ?auto_1348208 ) ( not ( = ?auto_1348205 ?auto_1348206 ) ) ( not ( = ?auto_1348205 ?auto_1348207 ) ) ( not ( = ?auto_1348205 ?auto_1348209 ) ) ( not ( = ?auto_1348205 ?auto_1348208 ) ) ( not ( = ?auto_1348205 ?auto_1348210 ) ) ( not ( = ?auto_1348205 ?auto_1348211 ) ) ( not ( = ?auto_1348205 ?auto_1348212 ) ) ( not ( = ?auto_1348206 ?auto_1348207 ) ) ( not ( = ?auto_1348206 ?auto_1348209 ) ) ( not ( = ?auto_1348206 ?auto_1348208 ) ) ( not ( = ?auto_1348206 ?auto_1348210 ) ) ( not ( = ?auto_1348206 ?auto_1348211 ) ) ( not ( = ?auto_1348206 ?auto_1348212 ) ) ( not ( = ?auto_1348207 ?auto_1348209 ) ) ( not ( = ?auto_1348207 ?auto_1348208 ) ) ( not ( = ?auto_1348207 ?auto_1348210 ) ) ( not ( = ?auto_1348207 ?auto_1348211 ) ) ( not ( = ?auto_1348207 ?auto_1348212 ) ) ( not ( = ?auto_1348209 ?auto_1348208 ) ) ( not ( = ?auto_1348209 ?auto_1348210 ) ) ( not ( = ?auto_1348209 ?auto_1348211 ) ) ( not ( = ?auto_1348209 ?auto_1348212 ) ) ( not ( = ?auto_1348208 ?auto_1348210 ) ) ( not ( = ?auto_1348208 ?auto_1348211 ) ) ( not ( = ?auto_1348208 ?auto_1348212 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1348210 ?auto_1348211 ?auto_1348212 )
      ( MAKE-7CRATE-VERIFY ?auto_1348205 ?auto_1348206 ?auto_1348207 ?auto_1348209 ?auto_1348208 ?auto_1348210 ?auto_1348211 ?auto_1348212 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1348268 - SURFACE
      ?auto_1348269 - SURFACE
      ?auto_1348270 - SURFACE
      ?auto_1348272 - SURFACE
      ?auto_1348271 - SURFACE
      ?auto_1348273 - SURFACE
      ?auto_1348274 - SURFACE
      ?auto_1348275 - SURFACE
    )
    :vars
    (
      ?auto_1348277 - HOIST
      ?auto_1348279 - PLACE
      ?auto_1348276 - TRUCK
      ?auto_1348278 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1348277 ?auto_1348279 ) ( SURFACE-AT ?auto_1348274 ?auto_1348279 ) ( CLEAR ?auto_1348274 ) ( IS-CRATE ?auto_1348275 ) ( not ( = ?auto_1348274 ?auto_1348275 ) ) ( AVAILABLE ?auto_1348277 ) ( IN ?auto_1348275 ?auto_1348276 ) ( ON ?auto_1348274 ?auto_1348273 ) ( not ( = ?auto_1348273 ?auto_1348274 ) ) ( not ( = ?auto_1348273 ?auto_1348275 ) ) ( TRUCK-AT ?auto_1348276 ?auto_1348278 ) ( not ( = ?auto_1348278 ?auto_1348279 ) ) ( ON ?auto_1348269 ?auto_1348268 ) ( ON ?auto_1348270 ?auto_1348269 ) ( ON ?auto_1348272 ?auto_1348270 ) ( ON ?auto_1348271 ?auto_1348272 ) ( ON ?auto_1348273 ?auto_1348271 ) ( not ( = ?auto_1348268 ?auto_1348269 ) ) ( not ( = ?auto_1348268 ?auto_1348270 ) ) ( not ( = ?auto_1348268 ?auto_1348272 ) ) ( not ( = ?auto_1348268 ?auto_1348271 ) ) ( not ( = ?auto_1348268 ?auto_1348273 ) ) ( not ( = ?auto_1348268 ?auto_1348274 ) ) ( not ( = ?auto_1348268 ?auto_1348275 ) ) ( not ( = ?auto_1348269 ?auto_1348270 ) ) ( not ( = ?auto_1348269 ?auto_1348272 ) ) ( not ( = ?auto_1348269 ?auto_1348271 ) ) ( not ( = ?auto_1348269 ?auto_1348273 ) ) ( not ( = ?auto_1348269 ?auto_1348274 ) ) ( not ( = ?auto_1348269 ?auto_1348275 ) ) ( not ( = ?auto_1348270 ?auto_1348272 ) ) ( not ( = ?auto_1348270 ?auto_1348271 ) ) ( not ( = ?auto_1348270 ?auto_1348273 ) ) ( not ( = ?auto_1348270 ?auto_1348274 ) ) ( not ( = ?auto_1348270 ?auto_1348275 ) ) ( not ( = ?auto_1348272 ?auto_1348271 ) ) ( not ( = ?auto_1348272 ?auto_1348273 ) ) ( not ( = ?auto_1348272 ?auto_1348274 ) ) ( not ( = ?auto_1348272 ?auto_1348275 ) ) ( not ( = ?auto_1348271 ?auto_1348273 ) ) ( not ( = ?auto_1348271 ?auto_1348274 ) ) ( not ( = ?auto_1348271 ?auto_1348275 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1348273 ?auto_1348274 ?auto_1348275 )
      ( MAKE-7CRATE-VERIFY ?auto_1348268 ?auto_1348269 ?auto_1348270 ?auto_1348272 ?auto_1348271 ?auto_1348273 ?auto_1348274 ?auto_1348275 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1348338 - SURFACE
      ?auto_1348339 - SURFACE
      ?auto_1348340 - SURFACE
      ?auto_1348342 - SURFACE
      ?auto_1348341 - SURFACE
      ?auto_1348343 - SURFACE
      ?auto_1348344 - SURFACE
      ?auto_1348345 - SURFACE
    )
    :vars
    (
      ?auto_1348347 - HOIST
      ?auto_1348350 - PLACE
      ?auto_1348346 - TRUCK
      ?auto_1348349 - PLACE
      ?auto_1348348 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1348347 ?auto_1348350 ) ( SURFACE-AT ?auto_1348344 ?auto_1348350 ) ( CLEAR ?auto_1348344 ) ( IS-CRATE ?auto_1348345 ) ( not ( = ?auto_1348344 ?auto_1348345 ) ) ( AVAILABLE ?auto_1348347 ) ( ON ?auto_1348344 ?auto_1348343 ) ( not ( = ?auto_1348343 ?auto_1348344 ) ) ( not ( = ?auto_1348343 ?auto_1348345 ) ) ( TRUCK-AT ?auto_1348346 ?auto_1348349 ) ( not ( = ?auto_1348349 ?auto_1348350 ) ) ( HOIST-AT ?auto_1348348 ?auto_1348349 ) ( LIFTING ?auto_1348348 ?auto_1348345 ) ( not ( = ?auto_1348347 ?auto_1348348 ) ) ( ON ?auto_1348339 ?auto_1348338 ) ( ON ?auto_1348340 ?auto_1348339 ) ( ON ?auto_1348342 ?auto_1348340 ) ( ON ?auto_1348341 ?auto_1348342 ) ( ON ?auto_1348343 ?auto_1348341 ) ( not ( = ?auto_1348338 ?auto_1348339 ) ) ( not ( = ?auto_1348338 ?auto_1348340 ) ) ( not ( = ?auto_1348338 ?auto_1348342 ) ) ( not ( = ?auto_1348338 ?auto_1348341 ) ) ( not ( = ?auto_1348338 ?auto_1348343 ) ) ( not ( = ?auto_1348338 ?auto_1348344 ) ) ( not ( = ?auto_1348338 ?auto_1348345 ) ) ( not ( = ?auto_1348339 ?auto_1348340 ) ) ( not ( = ?auto_1348339 ?auto_1348342 ) ) ( not ( = ?auto_1348339 ?auto_1348341 ) ) ( not ( = ?auto_1348339 ?auto_1348343 ) ) ( not ( = ?auto_1348339 ?auto_1348344 ) ) ( not ( = ?auto_1348339 ?auto_1348345 ) ) ( not ( = ?auto_1348340 ?auto_1348342 ) ) ( not ( = ?auto_1348340 ?auto_1348341 ) ) ( not ( = ?auto_1348340 ?auto_1348343 ) ) ( not ( = ?auto_1348340 ?auto_1348344 ) ) ( not ( = ?auto_1348340 ?auto_1348345 ) ) ( not ( = ?auto_1348342 ?auto_1348341 ) ) ( not ( = ?auto_1348342 ?auto_1348343 ) ) ( not ( = ?auto_1348342 ?auto_1348344 ) ) ( not ( = ?auto_1348342 ?auto_1348345 ) ) ( not ( = ?auto_1348341 ?auto_1348343 ) ) ( not ( = ?auto_1348341 ?auto_1348344 ) ) ( not ( = ?auto_1348341 ?auto_1348345 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1348343 ?auto_1348344 ?auto_1348345 )
      ( MAKE-7CRATE-VERIFY ?auto_1348338 ?auto_1348339 ?auto_1348340 ?auto_1348342 ?auto_1348341 ?auto_1348343 ?auto_1348344 ?auto_1348345 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1348415 - SURFACE
      ?auto_1348416 - SURFACE
      ?auto_1348417 - SURFACE
      ?auto_1348419 - SURFACE
      ?auto_1348418 - SURFACE
      ?auto_1348420 - SURFACE
      ?auto_1348421 - SURFACE
      ?auto_1348422 - SURFACE
    )
    :vars
    (
      ?auto_1348424 - HOIST
      ?auto_1348426 - PLACE
      ?auto_1348428 - TRUCK
      ?auto_1348423 - PLACE
      ?auto_1348427 - HOIST
      ?auto_1348425 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1348424 ?auto_1348426 ) ( SURFACE-AT ?auto_1348421 ?auto_1348426 ) ( CLEAR ?auto_1348421 ) ( IS-CRATE ?auto_1348422 ) ( not ( = ?auto_1348421 ?auto_1348422 ) ) ( AVAILABLE ?auto_1348424 ) ( ON ?auto_1348421 ?auto_1348420 ) ( not ( = ?auto_1348420 ?auto_1348421 ) ) ( not ( = ?auto_1348420 ?auto_1348422 ) ) ( TRUCK-AT ?auto_1348428 ?auto_1348423 ) ( not ( = ?auto_1348423 ?auto_1348426 ) ) ( HOIST-AT ?auto_1348427 ?auto_1348423 ) ( not ( = ?auto_1348424 ?auto_1348427 ) ) ( AVAILABLE ?auto_1348427 ) ( SURFACE-AT ?auto_1348422 ?auto_1348423 ) ( ON ?auto_1348422 ?auto_1348425 ) ( CLEAR ?auto_1348422 ) ( not ( = ?auto_1348421 ?auto_1348425 ) ) ( not ( = ?auto_1348422 ?auto_1348425 ) ) ( not ( = ?auto_1348420 ?auto_1348425 ) ) ( ON ?auto_1348416 ?auto_1348415 ) ( ON ?auto_1348417 ?auto_1348416 ) ( ON ?auto_1348419 ?auto_1348417 ) ( ON ?auto_1348418 ?auto_1348419 ) ( ON ?auto_1348420 ?auto_1348418 ) ( not ( = ?auto_1348415 ?auto_1348416 ) ) ( not ( = ?auto_1348415 ?auto_1348417 ) ) ( not ( = ?auto_1348415 ?auto_1348419 ) ) ( not ( = ?auto_1348415 ?auto_1348418 ) ) ( not ( = ?auto_1348415 ?auto_1348420 ) ) ( not ( = ?auto_1348415 ?auto_1348421 ) ) ( not ( = ?auto_1348415 ?auto_1348422 ) ) ( not ( = ?auto_1348415 ?auto_1348425 ) ) ( not ( = ?auto_1348416 ?auto_1348417 ) ) ( not ( = ?auto_1348416 ?auto_1348419 ) ) ( not ( = ?auto_1348416 ?auto_1348418 ) ) ( not ( = ?auto_1348416 ?auto_1348420 ) ) ( not ( = ?auto_1348416 ?auto_1348421 ) ) ( not ( = ?auto_1348416 ?auto_1348422 ) ) ( not ( = ?auto_1348416 ?auto_1348425 ) ) ( not ( = ?auto_1348417 ?auto_1348419 ) ) ( not ( = ?auto_1348417 ?auto_1348418 ) ) ( not ( = ?auto_1348417 ?auto_1348420 ) ) ( not ( = ?auto_1348417 ?auto_1348421 ) ) ( not ( = ?auto_1348417 ?auto_1348422 ) ) ( not ( = ?auto_1348417 ?auto_1348425 ) ) ( not ( = ?auto_1348419 ?auto_1348418 ) ) ( not ( = ?auto_1348419 ?auto_1348420 ) ) ( not ( = ?auto_1348419 ?auto_1348421 ) ) ( not ( = ?auto_1348419 ?auto_1348422 ) ) ( not ( = ?auto_1348419 ?auto_1348425 ) ) ( not ( = ?auto_1348418 ?auto_1348420 ) ) ( not ( = ?auto_1348418 ?auto_1348421 ) ) ( not ( = ?auto_1348418 ?auto_1348422 ) ) ( not ( = ?auto_1348418 ?auto_1348425 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1348420 ?auto_1348421 ?auto_1348422 )
      ( MAKE-7CRATE-VERIFY ?auto_1348415 ?auto_1348416 ?auto_1348417 ?auto_1348419 ?auto_1348418 ?auto_1348420 ?auto_1348421 ?auto_1348422 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1348493 - SURFACE
      ?auto_1348494 - SURFACE
      ?auto_1348495 - SURFACE
      ?auto_1348497 - SURFACE
      ?auto_1348496 - SURFACE
      ?auto_1348498 - SURFACE
      ?auto_1348499 - SURFACE
      ?auto_1348500 - SURFACE
    )
    :vars
    (
      ?auto_1348506 - HOIST
      ?auto_1348505 - PLACE
      ?auto_1348501 - PLACE
      ?auto_1348504 - HOIST
      ?auto_1348502 - SURFACE
      ?auto_1348503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1348506 ?auto_1348505 ) ( SURFACE-AT ?auto_1348499 ?auto_1348505 ) ( CLEAR ?auto_1348499 ) ( IS-CRATE ?auto_1348500 ) ( not ( = ?auto_1348499 ?auto_1348500 ) ) ( AVAILABLE ?auto_1348506 ) ( ON ?auto_1348499 ?auto_1348498 ) ( not ( = ?auto_1348498 ?auto_1348499 ) ) ( not ( = ?auto_1348498 ?auto_1348500 ) ) ( not ( = ?auto_1348501 ?auto_1348505 ) ) ( HOIST-AT ?auto_1348504 ?auto_1348501 ) ( not ( = ?auto_1348506 ?auto_1348504 ) ) ( AVAILABLE ?auto_1348504 ) ( SURFACE-AT ?auto_1348500 ?auto_1348501 ) ( ON ?auto_1348500 ?auto_1348502 ) ( CLEAR ?auto_1348500 ) ( not ( = ?auto_1348499 ?auto_1348502 ) ) ( not ( = ?auto_1348500 ?auto_1348502 ) ) ( not ( = ?auto_1348498 ?auto_1348502 ) ) ( TRUCK-AT ?auto_1348503 ?auto_1348505 ) ( ON ?auto_1348494 ?auto_1348493 ) ( ON ?auto_1348495 ?auto_1348494 ) ( ON ?auto_1348497 ?auto_1348495 ) ( ON ?auto_1348496 ?auto_1348497 ) ( ON ?auto_1348498 ?auto_1348496 ) ( not ( = ?auto_1348493 ?auto_1348494 ) ) ( not ( = ?auto_1348493 ?auto_1348495 ) ) ( not ( = ?auto_1348493 ?auto_1348497 ) ) ( not ( = ?auto_1348493 ?auto_1348496 ) ) ( not ( = ?auto_1348493 ?auto_1348498 ) ) ( not ( = ?auto_1348493 ?auto_1348499 ) ) ( not ( = ?auto_1348493 ?auto_1348500 ) ) ( not ( = ?auto_1348493 ?auto_1348502 ) ) ( not ( = ?auto_1348494 ?auto_1348495 ) ) ( not ( = ?auto_1348494 ?auto_1348497 ) ) ( not ( = ?auto_1348494 ?auto_1348496 ) ) ( not ( = ?auto_1348494 ?auto_1348498 ) ) ( not ( = ?auto_1348494 ?auto_1348499 ) ) ( not ( = ?auto_1348494 ?auto_1348500 ) ) ( not ( = ?auto_1348494 ?auto_1348502 ) ) ( not ( = ?auto_1348495 ?auto_1348497 ) ) ( not ( = ?auto_1348495 ?auto_1348496 ) ) ( not ( = ?auto_1348495 ?auto_1348498 ) ) ( not ( = ?auto_1348495 ?auto_1348499 ) ) ( not ( = ?auto_1348495 ?auto_1348500 ) ) ( not ( = ?auto_1348495 ?auto_1348502 ) ) ( not ( = ?auto_1348497 ?auto_1348496 ) ) ( not ( = ?auto_1348497 ?auto_1348498 ) ) ( not ( = ?auto_1348497 ?auto_1348499 ) ) ( not ( = ?auto_1348497 ?auto_1348500 ) ) ( not ( = ?auto_1348497 ?auto_1348502 ) ) ( not ( = ?auto_1348496 ?auto_1348498 ) ) ( not ( = ?auto_1348496 ?auto_1348499 ) ) ( not ( = ?auto_1348496 ?auto_1348500 ) ) ( not ( = ?auto_1348496 ?auto_1348502 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1348498 ?auto_1348499 ?auto_1348500 )
      ( MAKE-7CRATE-VERIFY ?auto_1348493 ?auto_1348494 ?auto_1348495 ?auto_1348497 ?auto_1348496 ?auto_1348498 ?auto_1348499 ?auto_1348500 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1348571 - SURFACE
      ?auto_1348572 - SURFACE
      ?auto_1348573 - SURFACE
      ?auto_1348575 - SURFACE
      ?auto_1348574 - SURFACE
      ?auto_1348576 - SURFACE
      ?auto_1348577 - SURFACE
      ?auto_1348578 - SURFACE
    )
    :vars
    (
      ?auto_1348582 - HOIST
      ?auto_1348580 - PLACE
      ?auto_1348583 - PLACE
      ?auto_1348579 - HOIST
      ?auto_1348581 - SURFACE
      ?auto_1348584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1348582 ?auto_1348580 ) ( IS-CRATE ?auto_1348578 ) ( not ( = ?auto_1348577 ?auto_1348578 ) ) ( not ( = ?auto_1348576 ?auto_1348577 ) ) ( not ( = ?auto_1348576 ?auto_1348578 ) ) ( not ( = ?auto_1348583 ?auto_1348580 ) ) ( HOIST-AT ?auto_1348579 ?auto_1348583 ) ( not ( = ?auto_1348582 ?auto_1348579 ) ) ( AVAILABLE ?auto_1348579 ) ( SURFACE-AT ?auto_1348578 ?auto_1348583 ) ( ON ?auto_1348578 ?auto_1348581 ) ( CLEAR ?auto_1348578 ) ( not ( = ?auto_1348577 ?auto_1348581 ) ) ( not ( = ?auto_1348578 ?auto_1348581 ) ) ( not ( = ?auto_1348576 ?auto_1348581 ) ) ( TRUCK-AT ?auto_1348584 ?auto_1348580 ) ( SURFACE-AT ?auto_1348576 ?auto_1348580 ) ( CLEAR ?auto_1348576 ) ( LIFTING ?auto_1348582 ?auto_1348577 ) ( IS-CRATE ?auto_1348577 ) ( ON ?auto_1348572 ?auto_1348571 ) ( ON ?auto_1348573 ?auto_1348572 ) ( ON ?auto_1348575 ?auto_1348573 ) ( ON ?auto_1348574 ?auto_1348575 ) ( ON ?auto_1348576 ?auto_1348574 ) ( not ( = ?auto_1348571 ?auto_1348572 ) ) ( not ( = ?auto_1348571 ?auto_1348573 ) ) ( not ( = ?auto_1348571 ?auto_1348575 ) ) ( not ( = ?auto_1348571 ?auto_1348574 ) ) ( not ( = ?auto_1348571 ?auto_1348576 ) ) ( not ( = ?auto_1348571 ?auto_1348577 ) ) ( not ( = ?auto_1348571 ?auto_1348578 ) ) ( not ( = ?auto_1348571 ?auto_1348581 ) ) ( not ( = ?auto_1348572 ?auto_1348573 ) ) ( not ( = ?auto_1348572 ?auto_1348575 ) ) ( not ( = ?auto_1348572 ?auto_1348574 ) ) ( not ( = ?auto_1348572 ?auto_1348576 ) ) ( not ( = ?auto_1348572 ?auto_1348577 ) ) ( not ( = ?auto_1348572 ?auto_1348578 ) ) ( not ( = ?auto_1348572 ?auto_1348581 ) ) ( not ( = ?auto_1348573 ?auto_1348575 ) ) ( not ( = ?auto_1348573 ?auto_1348574 ) ) ( not ( = ?auto_1348573 ?auto_1348576 ) ) ( not ( = ?auto_1348573 ?auto_1348577 ) ) ( not ( = ?auto_1348573 ?auto_1348578 ) ) ( not ( = ?auto_1348573 ?auto_1348581 ) ) ( not ( = ?auto_1348575 ?auto_1348574 ) ) ( not ( = ?auto_1348575 ?auto_1348576 ) ) ( not ( = ?auto_1348575 ?auto_1348577 ) ) ( not ( = ?auto_1348575 ?auto_1348578 ) ) ( not ( = ?auto_1348575 ?auto_1348581 ) ) ( not ( = ?auto_1348574 ?auto_1348576 ) ) ( not ( = ?auto_1348574 ?auto_1348577 ) ) ( not ( = ?auto_1348574 ?auto_1348578 ) ) ( not ( = ?auto_1348574 ?auto_1348581 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1348576 ?auto_1348577 ?auto_1348578 )
      ( MAKE-7CRATE-VERIFY ?auto_1348571 ?auto_1348572 ?auto_1348573 ?auto_1348575 ?auto_1348574 ?auto_1348576 ?auto_1348577 ?auto_1348578 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1348649 - SURFACE
      ?auto_1348650 - SURFACE
      ?auto_1348651 - SURFACE
      ?auto_1348653 - SURFACE
      ?auto_1348652 - SURFACE
      ?auto_1348654 - SURFACE
      ?auto_1348655 - SURFACE
      ?auto_1348656 - SURFACE
    )
    :vars
    (
      ?auto_1348662 - HOIST
      ?auto_1348660 - PLACE
      ?auto_1348658 - PLACE
      ?auto_1348657 - HOIST
      ?auto_1348661 - SURFACE
      ?auto_1348659 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1348662 ?auto_1348660 ) ( IS-CRATE ?auto_1348656 ) ( not ( = ?auto_1348655 ?auto_1348656 ) ) ( not ( = ?auto_1348654 ?auto_1348655 ) ) ( not ( = ?auto_1348654 ?auto_1348656 ) ) ( not ( = ?auto_1348658 ?auto_1348660 ) ) ( HOIST-AT ?auto_1348657 ?auto_1348658 ) ( not ( = ?auto_1348662 ?auto_1348657 ) ) ( AVAILABLE ?auto_1348657 ) ( SURFACE-AT ?auto_1348656 ?auto_1348658 ) ( ON ?auto_1348656 ?auto_1348661 ) ( CLEAR ?auto_1348656 ) ( not ( = ?auto_1348655 ?auto_1348661 ) ) ( not ( = ?auto_1348656 ?auto_1348661 ) ) ( not ( = ?auto_1348654 ?auto_1348661 ) ) ( TRUCK-AT ?auto_1348659 ?auto_1348660 ) ( SURFACE-AT ?auto_1348654 ?auto_1348660 ) ( CLEAR ?auto_1348654 ) ( IS-CRATE ?auto_1348655 ) ( AVAILABLE ?auto_1348662 ) ( IN ?auto_1348655 ?auto_1348659 ) ( ON ?auto_1348650 ?auto_1348649 ) ( ON ?auto_1348651 ?auto_1348650 ) ( ON ?auto_1348653 ?auto_1348651 ) ( ON ?auto_1348652 ?auto_1348653 ) ( ON ?auto_1348654 ?auto_1348652 ) ( not ( = ?auto_1348649 ?auto_1348650 ) ) ( not ( = ?auto_1348649 ?auto_1348651 ) ) ( not ( = ?auto_1348649 ?auto_1348653 ) ) ( not ( = ?auto_1348649 ?auto_1348652 ) ) ( not ( = ?auto_1348649 ?auto_1348654 ) ) ( not ( = ?auto_1348649 ?auto_1348655 ) ) ( not ( = ?auto_1348649 ?auto_1348656 ) ) ( not ( = ?auto_1348649 ?auto_1348661 ) ) ( not ( = ?auto_1348650 ?auto_1348651 ) ) ( not ( = ?auto_1348650 ?auto_1348653 ) ) ( not ( = ?auto_1348650 ?auto_1348652 ) ) ( not ( = ?auto_1348650 ?auto_1348654 ) ) ( not ( = ?auto_1348650 ?auto_1348655 ) ) ( not ( = ?auto_1348650 ?auto_1348656 ) ) ( not ( = ?auto_1348650 ?auto_1348661 ) ) ( not ( = ?auto_1348651 ?auto_1348653 ) ) ( not ( = ?auto_1348651 ?auto_1348652 ) ) ( not ( = ?auto_1348651 ?auto_1348654 ) ) ( not ( = ?auto_1348651 ?auto_1348655 ) ) ( not ( = ?auto_1348651 ?auto_1348656 ) ) ( not ( = ?auto_1348651 ?auto_1348661 ) ) ( not ( = ?auto_1348653 ?auto_1348652 ) ) ( not ( = ?auto_1348653 ?auto_1348654 ) ) ( not ( = ?auto_1348653 ?auto_1348655 ) ) ( not ( = ?auto_1348653 ?auto_1348656 ) ) ( not ( = ?auto_1348653 ?auto_1348661 ) ) ( not ( = ?auto_1348652 ?auto_1348654 ) ) ( not ( = ?auto_1348652 ?auto_1348655 ) ) ( not ( = ?auto_1348652 ?auto_1348656 ) ) ( not ( = ?auto_1348652 ?auto_1348661 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1348654 ?auto_1348655 ?auto_1348656 )
      ( MAKE-7CRATE-VERIFY ?auto_1348649 ?auto_1348650 ?auto_1348651 ?auto_1348653 ?auto_1348652 ?auto_1348654 ?auto_1348655 ?auto_1348656 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1351568 - SURFACE
      ?auto_1351569 - SURFACE
      ?auto_1351570 - SURFACE
      ?auto_1351572 - SURFACE
      ?auto_1351571 - SURFACE
      ?auto_1351573 - SURFACE
      ?auto_1351574 - SURFACE
      ?auto_1351575 - SURFACE
      ?auto_1351576 - SURFACE
    )
    :vars
    (
      ?auto_1351577 - HOIST
      ?auto_1351578 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1351577 ?auto_1351578 ) ( SURFACE-AT ?auto_1351575 ?auto_1351578 ) ( CLEAR ?auto_1351575 ) ( LIFTING ?auto_1351577 ?auto_1351576 ) ( IS-CRATE ?auto_1351576 ) ( not ( = ?auto_1351575 ?auto_1351576 ) ) ( ON ?auto_1351569 ?auto_1351568 ) ( ON ?auto_1351570 ?auto_1351569 ) ( ON ?auto_1351572 ?auto_1351570 ) ( ON ?auto_1351571 ?auto_1351572 ) ( ON ?auto_1351573 ?auto_1351571 ) ( ON ?auto_1351574 ?auto_1351573 ) ( ON ?auto_1351575 ?auto_1351574 ) ( not ( = ?auto_1351568 ?auto_1351569 ) ) ( not ( = ?auto_1351568 ?auto_1351570 ) ) ( not ( = ?auto_1351568 ?auto_1351572 ) ) ( not ( = ?auto_1351568 ?auto_1351571 ) ) ( not ( = ?auto_1351568 ?auto_1351573 ) ) ( not ( = ?auto_1351568 ?auto_1351574 ) ) ( not ( = ?auto_1351568 ?auto_1351575 ) ) ( not ( = ?auto_1351568 ?auto_1351576 ) ) ( not ( = ?auto_1351569 ?auto_1351570 ) ) ( not ( = ?auto_1351569 ?auto_1351572 ) ) ( not ( = ?auto_1351569 ?auto_1351571 ) ) ( not ( = ?auto_1351569 ?auto_1351573 ) ) ( not ( = ?auto_1351569 ?auto_1351574 ) ) ( not ( = ?auto_1351569 ?auto_1351575 ) ) ( not ( = ?auto_1351569 ?auto_1351576 ) ) ( not ( = ?auto_1351570 ?auto_1351572 ) ) ( not ( = ?auto_1351570 ?auto_1351571 ) ) ( not ( = ?auto_1351570 ?auto_1351573 ) ) ( not ( = ?auto_1351570 ?auto_1351574 ) ) ( not ( = ?auto_1351570 ?auto_1351575 ) ) ( not ( = ?auto_1351570 ?auto_1351576 ) ) ( not ( = ?auto_1351572 ?auto_1351571 ) ) ( not ( = ?auto_1351572 ?auto_1351573 ) ) ( not ( = ?auto_1351572 ?auto_1351574 ) ) ( not ( = ?auto_1351572 ?auto_1351575 ) ) ( not ( = ?auto_1351572 ?auto_1351576 ) ) ( not ( = ?auto_1351571 ?auto_1351573 ) ) ( not ( = ?auto_1351571 ?auto_1351574 ) ) ( not ( = ?auto_1351571 ?auto_1351575 ) ) ( not ( = ?auto_1351571 ?auto_1351576 ) ) ( not ( = ?auto_1351573 ?auto_1351574 ) ) ( not ( = ?auto_1351573 ?auto_1351575 ) ) ( not ( = ?auto_1351573 ?auto_1351576 ) ) ( not ( = ?auto_1351574 ?auto_1351575 ) ) ( not ( = ?auto_1351574 ?auto_1351576 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1351575 ?auto_1351576 )
      ( MAKE-8CRATE-VERIFY ?auto_1351568 ?auto_1351569 ?auto_1351570 ?auto_1351572 ?auto_1351571 ?auto_1351573 ?auto_1351574 ?auto_1351575 ?auto_1351576 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1351635 - SURFACE
      ?auto_1351636 - SURFACE
      ?auto_1351637 - SURFACE
      ?auto_1351639 - SURFACE
      ?auto_1351638 - SURFACE
      ?auto_1351640 - SURFACE
      ?auto_1351641 - SURFACE
      ?auto_1351642 - SURFACE
      ?auto_1351643 - SURFACE
    )
    :vars
    (
      ?auto_1351646 - HOIST
      ?auto_1351644 - PLACE
      ?auto_1351645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1351646 ?auto_1351644 ) ( SURFACE-AT ?auto_1351642 ?auto_1351644 ) ( CLEAR ?auto_1351642 ) ( IS-CRATE ?auto_1351643 ) ( not ( = ?auto_1351642 ?auto_1351643 ) ) ( TRUCK-AT ?auto_1351645 ?auto_1351644 ) ( AVAILABLE ?auto_1351646 ) ( IN ?auto_1351643 ?auto_1351645 ) ( ON ?auto_1351642 ?auto_1351641 ) ( not ( = ?auto_1351641 ?auto_1351642 ) ) ( not ( = ?auto_1351641 ?auto_1351643 ) ) ( ON ?auto_1351636 ?auto_1351635 ) ( ON ?auto_1351637 ?auto_1351636 ) ( ON ?auto_1351639 ?auto_1351637 ) ( ON ?auto_1351638 ?auto_1351639 ) ( ON ?auto_1351640 ?auto_1351638 ) ( ON ?auto_1351641 ?auto_1351640 ) ( not ( = ?auto_1351635 ?auto_1351636 ) ) ( not ( = ?auto_1351635 ?auto_1351637 ) ) ( not ( = ?auto_1351635 ?auto_1351639 ) ) ( not ( = ?auto_1351635 ?auto_1351638 ) ) ( not ( = ?auto_1351635 ?auto_1351640 ) ) ( not ( = ?auto_1351635 ?auto_1351641 ) ) ( not ( = ?auto_1351635 ?auto_1351642 ) ) ( not ( = ?auto_1351635 ?auto_1351643 ) ) ( not ( = ?auto_1351636 ?auto_1351637 ) ) ( not ( = ?auto_1351636 ?auto_1351639 ) ) ( not ( = ?auto_1351636 ?auto_1351638 ) ) ( not ( = ?auto_1351636 ?auto_1351640 ) ) ( not ( = ?auto_1351636 ?auto_1351641 ) ) ( not ( = ?auto_1351636 ?auto_1351642 ) ) ( not ( = ?auto_1351636 ?auto_1351643 ) ) ( not ( = ?auto_1351637 ?auto_1351639 ) ) ( not ( = ?auto_1351637 ?auto_1351638 ) ) ( not ( = ?auto_1351637 ?auto_1351640 ) ) ( not ( = ?auto_1351637 ?auto_1351641 ) ) ( not ( = ?auto_1351637 ?auto_1351642 ) ) ( not ( = ?auto_1351637 ?auto_1351643 ) ) ( not ( = ?auto_1351639 ?auto_1351638 ) ) ( not ( = ?auto_1351639 ?auto_1351640 ) ) ( not ( = ?auto_1351639 ?auto_1351641 ) ) ( not ( = ?auto_1351639 ?auto_1351642 ) ) ( not ( = ?auto_1351639 ?auto_1351643 ) ) ( not ( = ?auto_1351638 ?auto_1351640 ) ) ( not ( = ?auto_1351638 ?auto_1351641 ) ) ( not ( = ?auto_1351638 ?auto_1351642 ) ) ( not ( = ?auto_1351638 ?auto_1351643 ) ) ( not ( = ?auto_1351640 ?auto_1351641 ) ) ( not ( = ?auto_1351640 ?auto_1351642 ) ) ( not ( = ?auto_1351640 ?auto_1351643 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1351641 ?auto_1351642 ?auto_1351643 )
      ( MAKE-8CRATE-VERIFY ?auto_1351635 ?auto_1351636 ?auto_1351637 ?auto_1351639 ?auto_1351638 ?auto_1351640 ?auto_1351641 ?auto_1351642 ?auto_1351643 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1351711 - SURFACE
      ?auto_1351712 - SURFACE
      ?auto_1351713 - SURFACE
      ?auto_1351715 - SURFACE
      ?auto_1351714 - SURFACE
      ?auto_1351716 - SURFACE
      ?auto_1351717 - SURFACE
      ?auto_1351718 - SURFACE
      ?auto_1351719 - SURFACE
    )
    :vars
    (
      ?auto_1351721 - HOIST
      ?auto_1351722 - PLACE
      ?auto_1351723 - TRUCK
      ?auto_1351720 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1351721 ?auto_1351722 ) ( SURFACE-AT ?auto_1351718 ?auto_1351722 ) ( CLEAR ?auto_1351718 ) ( IS-CRATE ?auto_1351719 ) ( not ( = ?auto_1351718 ?auto_1351719 ) ) ( AVAILABLE ?auto_1351721 ) ( IN ?auto_1351719 ?auto_1351723 ) ( ON ?auto_1351718 ?auto_1351717 ) ( not ( = ?auto_1351717 ?auto_1351718 ) ) ( not ( = ?auto_1351717 ?auto_1351719 ) ) ( TRUCK-AT ?auto_1351723 ?auto_1351720 ) ( not ( = ?auto_1351720 ?auto_1351722 ) ) ( ON ?auto_1351712 ?auto_1351711 ) ( ON ?auto_1351713 ?auto_1351712 ) ( ON ?auto_1351715 ?auto_1351713 ) ( ON ?auto_1351714 ?auto_1351715 ) ( ON ?auto_1351716 ?auto_1351714 ) ( ON ?auto_1351717 ?auto_1351716 ) ( not ( = ?auto_1351711 ?auto_1351712 ) ) ( not ( = ?auto_1351711 ?auto_1351713 ) ) ( not ( = ?auto_1351711 ?auto_1351715 ) ) ( not ( = ?auto_1351711 ?auto_1351714 ) ) ( not ( = ?auto_1351711 ?auto_1351716 ) ) ( not ( = ?auto_1351711 ?auto_1351717 ) ) ( not ( = ?auto_1351711 ?auto_1351718 ) ) ( not ( = ?auto_1351711 ?auto_1351719 ) ) ( not ( = ?auto_1351712 ?auto_1351713 ) ) ( not ( = ?auto_1351712 ?auto_1351715 ) ) ( not ( = ?auto_1351712 ?auto_1351714 ) ) ( not ( = ?auto_1351712 ?auto_1351716 ) ) ( not ( = ?auto_1351712 ?auto_1351717 ) ) ( not ( = ?auto_1351712 ?auto_1351718 ) ) ( not ( = ?auto_1351712 ?auto_1351719 ) ) ( not ( = ?auto_1351713 ?auto_1351715 ) ) ( not ( = ?auto_1351713 ?auto_1351714 ) ) ( not ( = ?auto_1351713 ?auto_1351716 ) ) ( not ( = ?auto_1351713 ?auto_1351717 ) ) ( not ( = ?auto_1351713 ?auto_1351718 ) ) ( not ( = ?auto_1351713 ?auto_1351719 ) ) ( not ( = ?auto_1351715 ?auto_1351714 ) ) ( not ( = ?auto_1351715 ?auto_1351716 ) ) ( not ( = ?auto_1351715 ?auto_1351717 ) ) ( not ( = ?auto_1351715 ?auto_1351718 ) ) ( not ( = ?auto_1351715 ?auto_1351719 ) ) ( not ( = ?auto_1351714 ?auto_1351716 ) ) ( not ( = ?auto_1351714 ?auto_1351717 ) ) ( not ( = ?auto_1351714 ?auto_1351718 ) ) ( not ( = ?auto_1351714 ?auto_1351719 ) ) ( not ( = ?auto_1351716 ?auto_1351717 ) ) ( not ( = ?auto_1351716 ?auto_1351718 ) ) ( not ( = ?auto_1351716 ?auto_1351719 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1351717 ?auto_1351718 ?auto_1351719 )
      ( MAKE-8CRATE-VERIFY ?auto_1351711 ?auto_1351712 ?auto_1351713 ?auto_1351715 ?auto_1351714 ?auto_1351716 ?auto_1351717 ?auto_1351718 ?auto_1351719 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1351795 - SURFACE
      ?auto_1351796 - SURFACE
      ?auto_1351797 - SURFACE
      ?auto_1351799 - SURFACE
      ?auto_1351798 - SURFACE
      ?auto_1351800 - SURFACE
      ?auto_1351801 - SURFACE
      ?auto_1351802 - SURFACE
      ?auto_1351803 - SURFACE
    )
    :vars
    (
      ?auto_1351807 - HOIST
      ?auto_1351804 - PLACE
      ?auto_1351806 - TRUCK
      ?auto_1351805 - PLACE
      ?auto_1351808 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1351807 ?auto_1351804 ) ( SURFACE-AT ?auto_1351802 ?auto_1351804 ) ( CLEAR ?auto_1351802 ) ( IS-CRATE ?auto_1351803 ) ( not ( = ?auto_1351802 ?auto_1351803 ) ) ( AVAILABLE ?auto_1351807 ) ( ON ?auto_1351802 ?auto_1351801 ) ( not ( = ?auto_1351801 ?auto_1351802 ) ) ( not ( = ?auto_1351801 ?auto_1351803 ) ) ( TRUCK-AT ?auto_1351806 ?auto_1351805 ) ( not ( = ?auto_1351805 ?auto_1351804 ) ) ( HOIST-AT ?auto_1351808 ?auto_1351805 ) ( LIFTING ?auto_1351808 ?auto_1351803 ) ( not ( = ?auto_1351807 ?auto_1351808 ) ) ( ON ?auto_1351796 ?auto_1351795 ) ( ON ?auto_1351797 ?auto_1351796 ) ( ON ?auto_1351799 ?auto_1351797 ) ( ON ?auto_1351798 ?auto_1351799 ) ( ON ?auto_1351800 ?auto_1351798 ) ( ON ?auto_1351801 ?auto_1351800 ) ( not ( = ?auto_1351795 ?auto_1351796 ) ) ( not ( = ?auto_1351795 ?auto_1351797 ) ) ( not ( = ?auto_1351795 ?auto_1351799 ) ) ( not ( = ?auto_1351795 ?auto_1351798 ) ) ( not ( = ?auto_1351795 ?auto_1351800 ) ) ( not ( = ?auto_1351795 ?auto_1351801 ) ) ( not ( = ?auto_1351795 ?auto_1351802 ) ) ( not ( = ?auto_1351795 ?auto_1351803 ) ) ( not ( = ?auto_1351796 ?auto_1351797 ) ) ( not ( = ?auto_1351796 ?auto_1351799 ) ) ( not ( = ?auto_1351796 ?auto_1351798 ) ) ( not ( = ?auto_1351796 ?auto_1351800 ) ) ( not ( = ?auto_1351796 ?auto_1351801 ) ) ( not ( = ?auto_1351796 ?auto_1351802 ) ) ( not ( = ?auto_1351796 ?auto_1351803 ) ) ( not ( = ?auto_1351797 ?auto_1351799 ) ) ( not ( = ?auto_1351797 ?auto_1351798 ) ) ( not ( = ?auto_1351797 ?auto_1351800 ) ) ( not ( = ?auto_1351797 ?auto_1351801 ) ) ( not ( = ?auto_1351797 ?auto_1351802 ) ) ( not ( = ?auto_1351797 ?auto_1351803 ) ) ( not ( = ?auto_1351799 ?auto_1351798 ) ) ( not ( = ?auto_1351799 ?auto_1351800 ) ) ( not ( = ?auto_1351799 ?auto_1351801 ) ) ( not ( = ?auto_1351799 ?auto_1351802 ) ) ( not ( = ?auto_1351799 ?auto_1351803 ) ) ( not ( = ?auto_1351798 ?auto_1351800 ) ) ( not ( = ?auto_1351798 ?auto_1351801 ) ) ( not ( = ?auto_1351798 ?auto_1351802 ) ) ( not ( = ?auto_1351798 ?auto_1351803 ) ) ( not ( = ?auto_1351800 ?auto_1351801 ) ) ( not ( = ?auto_1351800 ?auto_1351802 ) ) ( not ( = ?auto_1351800 ?auto_1351803 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1351801 ?auto_1351802 ?auto_1351803 )
      ( MAKE-8CRATE-VERIFY ?auto_1351795 ?auto_1351796 ?auto_1351797 ?auto_1351799 ?auto_1351798 ?auto_1351800 ?auto_1351801 ?auto_1351802 ?auto_1351803 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1351887 - SURFACE
      ?auto_1351888 - SURFACE
      ?auto_1351889 - SURFACE
      ?auto_1351891 - SURFACE
      ?auto_1351890 - SURFACE
      ?auto_1351892 - SURFACE
      ?auto_1351893 - SURFACE
      ?auto_1351894 - SURFACE
      ?auto_1351895 - SURFACE
    )
    :vars
    (
      ?auto_1351900 - HOIST
      ?auto_1351899 - PLACE
      ?auto_1351896 - TRUCK
      ?auto_1351901 - PLACE
      ?auto_1351898 - HOIST
      ?auto_1351897 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1351900 ?auto_1351899 ) ( SURFACE-AT ?auto_1351894 ?auto_1351899 ) ( CLEAR ?auto_1351894 ) ( IS-CRATE ?auto_1351895 ) ( not ( = ?auto_1351894 ?auto_1351895 ) ) ( AVAILABLE ?auto_1351900 ) ( ON ?auto_1351894 ?auto_1351893 ) ( not ( = ?auto_1351893 ?auto_1351894 ) ) ( not ( = ?auto_1351893 ?auto_1351895 ) ) ( TRUCK-AT ?auto_1351896 ?auto_1351901 ) ( not ( = ?auto_1351901 ?auto_1351899 ) ) ( HOIST-AT ?auto_1351898 ?auto_1351901 ) ( not ( = ?auto_1351900 ?auto_1351898 ) ) ( AVAILABLE ?auto_1351898 ) ( SURFACE-AT ?auto_1351895 ?auto_1351901 ) ( ON ?auto_1351895 ?auto_1351897 ) ( CLEAR ?auto_1351895 ) ( not ( = ?auto_1351894 ?auto_1351897 ) ) ( not ( = ?auto_1351895 ?auto_1351897 ) ) ( not ( = ?auto_1351893 ?auto_1351897 ) ) ( ON ?auto_1351888 ?auto_1351887 ) ( ON ?auto_1351889 ?auto_1351888 ) ( ON ?auto_1351891 ?auto_1351889 ) ( ON ?auto_1351890 ?auto_1351891 ) ( ON ?auto_1351892 ?auto_1351890 ) ( ON ?auto_1351893 ?auto_1351892 ) ( not ( = ?auto_1351887 ?auto_1351888 ) ) ( not ( = ?auto_1351887 ?auto_1351889 ) ) ( not ( = ?auto_1351887 ?auto_1351891 ) ) ( not ( = ?auto_1351887 ?auto_1351890 ) ) ( not ( = ?auto_1351887 ?auto_1351892 ) ) ( not ( = ?auto_1351887 ?auto_1351893 ) ) ( not ( = ?auto_1351887 ?auto_1351894 ) ) ( not ( = ?auto_1351887 ?auto_1351895 ) ) ( not ( = ?auto_1351887 ?auto_1351897 ) ) ( not ( = ?auto_1351888 ?auto_1351889 ) ) ( not ( = ?auto_1351888 ?auto_1351891 ) ) ( not ( = ?auto_1351888 ?auto_1351890 ) ) ( not ( = ?auto_1351888 ?auto_1351892 ) ) ( not ( = ?auto_1351888 ?auto_1351893 ) ) ( not ( = ?auto_1351888 ?auto_1351894 ) ) ( not ( = ?auto_1351888 ?auto_1351895 ) ) ( not ( = ?auto_1351888 ?auto_1351897 ) ) ( not ( = ?auto_1351889 ?auto_1351891 ) ) ( not ( = ?auto_1351889 ?auto_1351890 ) ) ( not ( = ?auto_1351889 ?auto_1351892 ) ) ( not ( = ?auto_1351889 ?auto_1351893 ) ) ( not ( = ?auto_1351889 ?auto_1351894 ) ) ( not ( = ?auto_1351889 ?auto_1351895 ) ) ( not ( = ?auto_1351889 ?auto_1351897 ) ) ( not ( = ?auto_1351891 ?auto_1351890 ) ) ( not ( = ?auto_1351891 ?auto_1351892 ) ) ( not ( = ?auto_1351891 ?auto_1351893 ) ) ( not ( = ?auto_1351891 ?auto_1351894 ) ) ( not ( = ?auto_1351891 ?auto_1351895 ) ) ( not ( = ?auto_1351891 ?auto_1351897 ) ) ( not ( = ?auto_1351890 ?auto_1351892 ) ) ( not ( = ?auto_1351890 ?auto_1351893 ) ) ( not ( = ?auto_1351890 ?auto_1351894 ) ) ( not ( = ?auto_1351890 ?auto_1351895 ) ) ( not ( = ?auto_1351890 ?auto_1351897 ) ) ( not ( = ?auto_1351892 ?auto_1351893 ) ) ( not ( = ?auto_1351892 ?auto_1351894 ) ) ( not ( = ?auto_1351892 ?auto_1351895 ) ) ( not ( = ?auto_1351892 ?auto_1351897 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1351893 ?auto_1351894 ?auto_1351895 )
      ( MAKE-8CRATE-VERIFY ?auto_1351887 ?auto_1351888 ?auto_1351889 ?auto_1351891 ?auto_1351890 ?auto_1351892 ?auto_1351893 ?auto_1351894 ?auto_1351895 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1351980 - SURFACE
      ?auto_1351981 - SURFACE
      ?auto_1351982 - SURFACE
      ?auto_1351984 - SURFACE
      ?auto_1351983 - SURFACE
      ?auto_1351985 - SURFACE
      ?auto_1351986 - SURFACE
      ?auto_1351987 - SURFACE
      ?auto_1351988 - SURFACE
    )
    :vars
    (
      ?auto_1351992 - HOIST
      ?auto_1351994 - PLACE
      ?auto_1351989 - PLACE
      ?auto_1351993 - HOIST
      ?auto_1351991 - SURFACE
      ?auto_1351990 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1351992 ?auto_1351994 ) ( SURFACE-AT ?auto_1351987 ?auto_1351994 ) ( CLEAR ?auto_1351987 ) ( IS-CRATE ?auto_1351988 ) ( not ( = ?auto_1351987 ?auto_1351988 ) ) ( AVAILABLE ?auto_1351992 ) ( ON ?auto_1351987 ?auto_1351986 ) ( not ( = ?auto_1351986 ?auto_1351987 ) ) ( not ( = ?auto_1351986 ?auto_1351988 ) ) ( not ( = ?auto_1351989 ?auto_1351994 ) ) ( HOIST-AT ?auto_1351993 ?auto_1351989 ) ( not ( = ?auto_1351992 ?auto_1351993 ) ) ( AVAILABLE ?auto_1351993 ) ( SURFACE-AT ?auto_1351988 ?auto_1351989 ) ( ON ?auto_1351988 ?auto_1351991 ) ( CLEAR ?auto_1351988 ) ( not ( = ?auto_1351987 ?auto_1351991 ) ) ( not ( = ?auto_1351988 ?auto_1351991 ) ) ( not ( = ?auto_1351986 ?auto_1351991 ) ) ( TRUCK-AT ?auto_1351990 ?auto_1351994 ) ( ON ?auto_1351981 ?auto_1351980 ) ( ON ?auto_1351982 ?auto_1351981 ) ( ON ?auto_1351984 ?auto_1351982 ) ( ON ?auto_1351983 ?auto_1351984 ) ( ON ?auto_1351985 ?auto_1351983 ) ( ON ?auto_1351986 ?auto_1351985 ) ( not ( = ?auto_1351980 ?auto_1351981 ) ) ( not ( = ?auto_1351980 ?auto_1351982 ) ) ( not ( = ?auto_1351980 ?auto_1351984 ) ) ( not ( = ?auto_1351980 ?auto_1351983 ) ) ( not ( = ?auto_1351980 ?auto_1351985 ) ) ( not ( = ?auto_1351980 ?auto_1351986 ) ) ( not ( = ?auto_1351980 ?auto_1351987 ) ) ( not ( = ?auto_1351980 ?auto_1351988 ) ) ( not ( = ?auto_1351980 ?auto_1351991 ) ) ( not ( = ?auto_1351981 ?auto_1351982 ) ) ( not ( = ?auto_1351981 ?auto_1351984 ) ) ( not ( = ?auto_1351981 ?auto_1351983 ) ) ( not ( = ?auto_1351981 ?auto_1351985 ) ) ( not ( = ?auto_1351981 ?auto_1351986 ) ) ( not ( = ?auto_1351981 ?auto_1351987 ) ) ( not ( = ?auto_1351981 ?auto_1351988 ) ) ( not ( = ?auto_1351981 ?auto_1351991 ) ) ( not ( = ?auto_1351982 ?auto_1351984 ) ) ( not ( = ?auto_1351982 ?auto_1351983 ) ) ( not ( = ?auto_1351982 ?auto_1351985 ) ) ( not ( = ?auto_1351982 ?auto_1351986 ) ) ( not ( = ?auto_1351982 ?auto_1351987 ) ) ( not ( = ?auto_1351982 ?auto_1351988 ) ) ( not ( = ?auto_1351982 ?auto_1351991 ) ) ( not ( = ?auto_1351984 ?auto_1351983 ) ) ( not ( = ?auto_1351984 ?auto_1351985 ) ) ( not ( = ?auto_1351984 ?auto_1351986 ) ) ( not ( = ?auto_1351984 ?auto_1351987 ) ) ( not ( = ?auto_1351984 ?auto_1351988 ) ) ( not ( = ?auto_1351984 ?auto_1351991 ) ) ( not ( = ?auto_1351983 ?auto_1351985 ) ) ( not ( = ?auto_1351983 ?auto_1351986 ) ) ( not ( = ?auto_1351983 ?auto_1351987 ) ) ( not ( = ?auto_1351983 ?auto_1351988 ) ) ( not ( = ?auto_1351983 ?auto_1351991 ) ) ( not ( = ?auto_1351985 ?auto_1351986 ) ) ( not ( = ?auto_1351985 ?auto_1351987 ) ) ( not ( = ?auto_1351985 ?auto_1351988 ) ) ( not ( = ?auto_1351985 ?auto_1351991 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1351986 ?auto_1351987 ?auto_1351988 )
      ( MAKE-8CRATE-VERIFY ?auto_1351980 ?auto_1351981 ?auto_1351982 ?auto_1351984 ?auto_1351983 ?auto_1351985 ?auto_1351986 ?auto_1351987 ?auto_1351988 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1352073 - SURFACE
      ?auto_1352074 - SURFACE
      ?auto_1352075 - SURFACE
      ?auto_1352077 - SURFACE
      ?auto_1352076 - SURFACE
      ?auto_1352078 - SURFACE
      ?auto_1352079 - SURFACE
      ?auto_1352080 - SURFACE
      ?auto_1352081 - SURFACE
    )
    :vars
    (
      ?auto_1352082 - HOIST
      ?auto_1352083 - PLACE
      ?auto_1352084 - PLACE
      ?auto_1352087 - HOIST
      ?auto_1352085 - SURFACE
      ?auto_1352086 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352082 ?auto_1352083 ) ( IS-CRATE ?auto_1352081 ) ( not ( = ?auto_1352080 ?auto_1352081 ) ) ( not ( = ?auto_1352079 ?auto_1352080 ) ) ( not ( = ?auto_1352079 ?auto_1352081 ) ) ( not ( = ?auto_1352084 ?auto_1352083 ) ) ( HOIST-AT ?auto_1352087 ?auto_1352084 ) ( not ( = ?auto_1352082 ?auto_1352087 ) ) ( AVAILABLE ?auto_1352087 ) ( SURFACE-AT ?auto_1352081 ?auto_1352084 ) ( ON ?auto_1352081 ?auto_1352085 ) ( CLEAR ?auto_1352081 ) ( not ( = ?auto_1352080 ?auto_1352085 ) ) ( not ( = ?auto_1352081 ?auto_1352085 ) ) ( not ( = ?auto_1352079 ?auto_1352085 ) ) ( TRUCK-AT ?auto_1352086 ?auto_1352083 ) ( SURFACE-AT ?auto_1352079 ?auto_1352083 ) ( CLEAR ?auto_1352079 ) ( LIFTING ?auto_1352082 ?auto_1352080 ) ( IS-CRATE ?auto_1352080 ) ( ON ?auto_1352074 ?auto_1352073 ) ( ON ?auto_1352075 ?auto_1352074 ) ( ON ?auto_1352077 ?auto_1352075 ) ( ON ?auto_1352076 ?auto_1352077 ) ( ON ?auto_1352078 ?auto_1352076 ) ( ON ?auto_1352079 ?auto_1352078 ) ( not ( = ?auto_1352073 ?auto_1352074 ) ) ( not ( = ?auto_1352073 ?auto_1352075 ) ) ( not ( = ?auto_1352073 ?auto_1352077 ) ) ( not ( = ?auto_1352073 ?auto_1352076 ) ) ( not ( = ?auto_1352073 ?auto_1352078 ) ) ( not ( = ?auto_1352073 ?auto_1352079 ) ) ( not ( = ?auto_1352073 ?auto_1352080 ) ) ( not ( = ?auto_1352073 ?auto_1352081 ) ) ( not ( = ?auto_1352073 ?auto_1352085 ) ) ( not ( = ?auto_1352074 ?auto_1352075 ) ) ( not ( = ?auto_1352074 ?auto_1352077 ) ) ( not ( = ?auto_1352074 ?auto_1352076 ) ) ( not ( = ?auto_1352074 ?auto_1352078 ) ) ( not ( = ?auto_1352074 ?auto_1352079 ) ) ( not ( = ?auto_1352074 ?auto_1352080 ) ) ( not ( = ?auto_1352074 ?auto_1352081 ) ) ( not ( = ?auto_1352074 ?auto_1352085 ) ) ( not ( = ?auto_1352075 ?auto_1352077 ) ) ( not ( = ?auto_1352075 ?auto_1352076 ) ) ( not ( = ?auto_1352075 ?auto_1352078 ) ) ( not ( = ?auto_1352075 ?auto_1352079 ) ) ( not ( = ?auto_1352075 ?auto_1352080 ) ) ( not ( = ?auto_1352075 ?auto_1352081 ) ) ( not ( = ?auto_1352075 ?auto_1352085 ) ) ( not ( = ?auto_1352077 ?auto_1352076 ) ) ( not ( = ?auto_1352077 ?auto_1352078 ) ) ( not ( = ?auto_1352077 ?auto_1352079 ) ) ( not ( = ?auto_1352077 ?auto_1352080 ) ) ( not ( = ?auto_1352077 ?auto_1352081 ) ) ( not ( = ?auto_1352077 ?auto_1352085 ) ) ( not ( = ?auto_1352076 ?auto_1352078 ) ) ( not ( = ?auto_1352076 ?auto_1352079 ) ) ( not ( = ?auto_1352076 ?auto_1352080 ) ) ( not ( = ?auto_1352076 ?auto_1352081 ) ) ( not ( = ?auto_1352076 ?auto_1352085 ) ) ( not ( = ?auto_1352078 ?auto_1352079 ) ) ( not ( = ?auto_1352078 ?auto_1352080 ) ) ( not ( = ?auto_1352078 ?auto_1352081 ) ) ( not ( = ?auto_1352078 ?auto_1352085 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352079 ?auto_1352080 ?auto_1352081 )
      ( MAKE-8CRATE-VERIFY ?auto_1352073 ?auto_1352074 ?auto_1352075 ?auto_1352077 ?auto_1352076 ?auto_1352078 ?auto_1352079 ?auto_1352080 ?auto_1352081 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1352166 - SURFACE
      ?auto_1352167 - SURFACE
      ?auto_1352168 - SURFACE
      ?auto_1352170 - SURFACE
      ?auto_1352169 - SURFACE
      ?auto_1352171 - SURFACE
      ?auto_1352172 - SURFACE
      ?auto_1352173 - SURFACE
      ?auto_1352174 - SURFACE
    )
    :vars
    (
      ?auto_1352179 - HOIST
      ?auto_1352178 - PLACE
      ?auto_1352175 - PLACE
      ?auto_1352176 - HOIST
      ?auto_1352180 - SURFACE
      ?auto_1352177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352179 ?auto_1352178 ) ( IS-CRATE ?auto_1352174 ) ( not ( = ?auto_1352173 ?auto_1352174 ) ) ( not ( = ?auto_1352172 ?auto_1352173 ) ) ( not ( = ?auto_1352172 ?auto_1352174 ) ) ( not ( = ?auto_1352175 ?auto_1352178 ) ) ( HOIST-AT ?auto_1352176 ?auto_1352175 ) ( not ( = ?auto_1352179 ?auto_1352176 ) ) ( AVAILABLE ?auto_1352176 ) ( SURFACE-AT ?auto_1352174 ?auto_1352175 ) ( ON ?auto_1352174 ?auto_1352180 ) ( CLEAR ?auto_1352174 ) ( not ( = ?auto_1352173 ?auto_1352180 ) ) ( not ( = ?auto_1352174 ?auto_1352180 ) ) ( not ( = ?auto_1352172 ?auto_1352180 ) ) ( TRUCK-AT ?auto_1352177 ?auto_1352178 ) ( SURFACE-AT ?auto_1352172 ?auto_1352178 ) ( CLEAR ?auto_1352172 ) ( IS-CRATE ?auto_1352173 ) ( AVAILABLE ?auto_1352179 ) ( IN ?auto_1352173 ?auto_1352177 ) ( ON ?auto_1352167 ?auto_1352166 ) ( ON ?auto_1352168 ?auto_1352167 ) ( ON ?auto_1352170 ?auto_1352168 ) ( ON ?auto_1352169 ?auto_1352170 ) ( ON ?auto_1352171 ?auto_1352169 ) ( ON ?auto_1352172 ?auto_1352171 ) ( not ( = ?auto_1352166 ?auto_1352167 ) ) ( not ( = ?auto_1352166 ?auto_1352168 ) ) ( not ( = ?auto_1352166 ?auto_1352170 ) ) ( not ( = ?auto_1352166 ?auto_1352169 ) ) ( not ( = ?auto_1352166 ?auto_1352171 ) ) ( not ( = ?auto_1352166 ?auto_1352172 ) ) ( not ( = ?auto_1352166 ?auto_1352173 ) ) ( not ( = ?auto_1352166 ?auto_1352174 ) ) ( not ( = ?auto_1352166 ?auto_1352180 ) ) ( not ( = ?auto_1352167 ?auto_1352168 ) ) ( not ( = ?auto_1352167 ?auto_1352170 ) ) ( not ( = ?auto_1352167 ?auto_1352169 ) ) ( not ( = ?auto_1352167 ?auto_1352171 ) ) ( not ( = ?auto_1352167 ?auto_1352172 ) ) ( not ( = ?auto_1352167 ?auto_1352173 ) ) ( not ( = ?auto_1352167 ?auto_1352174 ) ) ( not ( = ?auto_1352167 ?auto_1352180 ) ) ( not ( = ?auto_1352168 ?auto_1352170 ) ) ( not ( = ?auto_1352168 ?auto_1352169 ) ) ( not ( = ?auto_1352168 ?auto_1352171 ) ) ( not ( = ?auto_1352168 ?auto_1352172 ) ) ( not ( = ?auto_1352168 ?auto_1352173 ) ) ( not ( = ?auto_1352168 ?auto_1352174 ) ) ( not ( = ?auto_1352168 ?auto_1352180 ) ) ( not ( = ?auto_1352170 ?auto_1352169 ) ) ( not ( = ?auto_1352170 ?auto_1352171 ) ) ( not ( = ?auto_1352170 ?auto_1352172 ) ) ( not ( = ?auto_1352170 ?auto_1352173 ) ) ( not ( = ?auto_1352170 ?auto_1352174 ) ) ( not ( = ?auto_1352170 ?auto_1352180 ) ) ( not ( = ?auto_1352169 ?auto_1352171 ) ) ( not ( = ?auto_1352169 ?auto_1352172 ) ) ( not ( = ?auto_1352169 ?auto_1352173 ) ) ( not ( = ?auto_1352169 ?auto_1352174 ) ) ( not ( = ?auto_1352169 ?auto_1352180 ) ) ( not ( = ?auto_1352171 ?auto_1352172 ) ) ( not ( = ?auto_1352171 ?auto_1352173 ) ) ( not ( = ?auto_1352171 ?auto_1352174 ) ) ( not ( = ?auto_1352171 ?auto_1352180 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352172 ?auto_1352173 ?auto_1352174 )
      ( MAKE-8CRATE-VERIFY ?auto_1352166 ?auto_1352167 ?auto_1352168 ?auto_1352170 ?auto_1352169 ?auto_1352171 ?auto_1352172 ?auto_1352173 ?auto_1352174 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1352181 - SURFACE
      ?auto_1352182 - SURFACE
    )
    :vars
    (
      ?auto_1352187 - HOIST
      ?auto_1352186 - PLACE
      ?auto_1352189 - SURFACE
      ?auto_1352183 - PLACE
      ?auto_1352184 - HOIST
      ?auto_1352188 - SURFACE
      ?auto_1352185 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352187 ?auto_1352186 ) ( IS-CRATE ?auto_1352182 ) ( not ( = ?auto_1352181 ?auto_1352182 ) ) ( not ( = ?auto_1352189 ?auto_1352181 ) ) ( not ( = ?auto_1352189 ?auto_1352182 ) ) ( not ( = ?auto_1352183 ?auto_1352186 ) ) ( HOIST-AT ?auto_1352184 ?auto_1352183 ) ( not ( = ?auto_1352187 ?auto_1352184 ) ) ( AVAILABLE ?auto_1352184 ) ( SURFACE-AT ?auto_1352182 ?auto_1352183 ) ( ON ?auto_1352182 ?auto_1352188 ) ( CLEAR ?auto_1352182 ) ( not ( = ?auto_1352181 ?auto_1352188 ) ) ( not ( = ?auto_1352182 ?auto_1352188 ) ) ( not ( = ?auto_1352189 ?auto_1352188 ) ) ( SURFACE-AT ?auto_1352189 ?auto_1352186 ) ( CLEAR ?auto_1352189 ) ( IS-CRATE ?auto_1352181 ) ( AVAILABLE ?auto_1352187 ) ( IN ?auto_1352181 ?auto_1352185 ) ( TRUCK-AT ?auto_1352185 ?auto_1352183 ) )
    :subtasks
    ( ( !DRIVE ?auto_1352185 ?auto_1352183 ?auto_1352186 )
      ( MAKE-2CRATE ?auto_1352189 ?auto_1352181 ?auto_1352182 )
      ( MAKE-1CRATE-VERIFY ?auto_1352181 ?auto_1352182 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1352190 - SURFACE
      ?auto_1352191 - SURFACE
      ?auto_1352192 - SURFACE
    )
    :vars
    (
      ?auto_1352198 - HOIST
      ?auto_1352193 - PLACE
      ?auto_1352195 - PLACE
      ?auto_1352194 - HOIST
      ?auto_1352196 - SURFACE
      ?auto_1352197 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352198 ?auto_1352193 ) ( IS-CRATE ?auto_1352192 ) ( not ( = ?auto_1352191 ?auto_1352192 ) ) ( not ( = ?auto_1352190 ?auto_1352191 ) ) ( not ( = ?auto_1352190 ?auto_1352192 ) ) ( not ( = ?auto_1352195 ?auto_1352193 ) ) ( HOIST-AT ?auto_1352194 ?auto_1352195 ) ( not ( = ?auto_1352198 ?auto_1352194 ) ) ( AVAILABLE ?auto_1352194 ) ( SURFACE-AT ?auto_1352192 ?auto_1352195 ) ( ON ?auto_1352192 ?auto_1352196 ) ( CLEAR ?auto_1352192 ) ( not ( = ?auto_1352191 ?auto_1352196 ) ) ( not ( = ?auto_1352192 ?auto_1352196 ) ) ( not ( = ?auto_1352190 ?auto_1352196 ) ) ( SURFACE-AT ?auto_1352190 ?auto_1352193 ) ( CLEAR ?auto_1352190 ) ( IS-CRATE ?auto_1352191 ) ( AVAILABLE ?auto_1352198 ) ( IN ?auto_1352191 ?auto_1352197 ) ( TRUCK-AT ?auto_1352197 ?auto_1352195 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1352191 ?auto_1352192 )
      ( MAKE-2CRATE-VERIFY ?auto_1352190 ?auto_1352191 ?auto_1352192 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1352199 - SURFACE
      ?auto_1352200 - SURFACE
      ?auto_1352201 - SURFACE
      ?auto_1352202 - SURFACE
    )
    :vars
    (
      ?auto_1352207 - HOIST
      ?auto_1352205 - PLACE
      ?auto_1352206 - PLACE
      ?auto_1352204 - HOIST
      ?auto_1352203 - SURFACE
      ?auto_1352208 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352207 ?auto_1352205 ) ( IS-CRATE ?auto_1352202 ) ( not ( = ?auto_1352201 ?auto_1352202 ) ) ( not ( = ?auto_1352200 ?auto_1352201 ) ) ( not ( = ?auto_1352200 ?auto_1352202 ) ) ( not ( = ?auto_1352206 ?auto_1352205 ) ) ( HOIST-AT ?auto_1352204 ?auto_1352206 ) ( not ( = ?auto_1352207 ?auto_1352204 ) ) ( AVAILABLE ?auto_1352204 ) ( SURFACE-AT ?auto_1352202 ?auto_1352206 ) ( ON ?auto_1352202 ?auto_1352203 ) ( CLEAR ?auto_1352202 ) ( not ( = ?auto_1352201 ?auto_1352203 ) ) ( not ( = ?auto_1352202 ?auto_1352203 ) ) ( not ( = ?auto_1352200 ?auto_1352203 ) ) ( SURFACE-AT ?auto_1352200 ?auto_1352205 ) ( CLEAR ?auto_1352200 ) ( IS-CRATE ?auto_1352201 ) ( AVAILABLE ?auto_1352207 ) ( IN ?auto_1352201 ?auto_1352208 ) ( TRUCK-AT ?auto_1352208 ?auto_1352206 ) ( ON ?auto_1352200 ?auto_1352199 ) ( not ( = ?auto_1352199 ?auto_1352200 ) ) ( not ( = ?auto_1352199 ?auto_1352201 ) ) ( not ( = ?auto_1352199 ?auto_1352202 ) ) ( not ( = ?auto_1352199 ?auto_1352203 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352200 ?auto_1352201 ?auto_1352202 )
      ( MAKE-3CRATE-VERIFY ?auto_1352199 ?auto_1352200 ?auto_1352201 ?auto_1352202 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1352209 - SURFACE
      ?auto_1352210 - SURFACE
      ?auto_1352211 - SURFACE
      ?auto_1352213 - SURFACE
      ?auto_1352212 - SURFACE
    )
    :vars
    (
      ?auto_1352218 - HOIST
      ?auto_1352216 - PLACE
      ?auto_1352217 - PLACE
      ?auto_1352215 - HOIST
      ?auto_1352214 - SURFACE
      ?auto_1352219 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352218 ?auto_1352216 ) ( IS-CRATE ?auto_1352212 ) ( not ( = ?auto_1352213 ?auto_1352212 ) ) ( not ( = ?auto_1352211 ?auto_1352213 ) ) ( not ( = ?auto_1352211 ?auto_1352212 ) ) ( not ( = ?auto_1352217 ?auto_1352216 ) ) ( HOIST-AT ?auto_1352215 ?auto_1352217 ) ( not ( = ?auto_1352218 ?auto_1352215 ) ) ( AVAILABLE ?auto_1352215 ) ( SURFACE-AT ?auto_1352212 ?auto_1352217 ) ( ON ?auto_1352212 ?auto_1352214 ) ( CLEAR ?auto_1352212 ) ( not ( = ?auto_1352213 ?auto_1352214 ) ) ( not ( = ?auto_1352212 ?auto_1352214 ) ) ( not ( = ?auto_1352211 ?auto_1352214 ) ) ( SURFACE-AT ?auto_1352211 ?auto_1352216 ) ( CLEAR ?auto_1352211 ) ( IS-CRATE ?auto_1352213 ) ( AVAILABLE ?auto_1352218 ) ( IN ?auto_1352213 ?auto_1352219 ) ( TRUCK-AT ?auto_1352219 ?auto_1352217 ) ( ON ?auto_1352210 ?auto_1352209 ) ( ON ?auto_1352211 ?auto_1352210 ) ( not ( = ?auto_1352209 ?auto_1352210 ) ) ( not ( = ?auto_1352209 ?auto_1352211 ) ) ( not ( = ?auto_1352209 ?auto_1352213 ) ) ( not ( = ?auto_1352209 ?auto_1352212 ) ) ( not ( = ?auto_1352209 ?auto_1352214 ) ) ( not ( = ?auto_1352210 ?auto_1352211 ) ) ( not ( = ?auto_1352210 ?auto_1352213 ) ) ( not ( = ?auto_1352210 ?auto_1352212 ) ) ( not ( = ?auto_1352210 ?auto_1352214 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352211 ?auto_1352213 ?auto_1352212 )
      ( MAKE-4CRATE-VERIFY ?auto_1352209 ?auto_1352210 ?auto_1352211 ?auto_1352213 ?auto_1352212 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1352220 - SURFACE
      ?auto_1352221 - SURFACE
      ?auto_1352222 - SURFACE
      ?auto_1352224 - SURFACE
      ?auto_1352223 - SURFACE
      ?auto_1352225 - SURFACE
    )
    :vars
    (
      ?auto_1352230 - HOIST
      ?auto_1352228 - PLACE
      ?auto_1352229 - PLACE
      ?auto_1352227 - HOIST
      ?auto_1352226 - SURFACE
      ?auto_1352231 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352230 ?auto_1352228 ) ( IS-CRATE ?auto_1352225 ) ( not ( = ?auto_1352223 ?auto_1352225 ) ) ( not ( = ?auto_1352224 ?auto_1352223 ) ) ( not ( = ?auto_1352224 ?auto_1352225 ) ) ( not ( = ?auto_1352229 ?auto_1352228 ) ) ( HOIST-AT ?auto_1352227 ?auto_1352229 ) ( not ( = ?auto_1352230 ?auto_1352227 ) ) ( AVAILABLE ?auto_1352227 ) ( SURFACE-AT ?auto_1352225 ?auto_1352229 ) ( ON ?auto_1352225 ?auto_1352226 ) ( CLEAR ?auto_1352225 ) ( not ( = ?auto_1352223 ?auto_1352226 ) ) ( not ( = ?auto_1352225 ?auto_1352226 ) ) ( not ( = ?auto_1352224 ?auto_1352226 ) ) ( SURFACE-AT ?auto_1352224 ?auto_1352228 ) ( CLEAR ?auto_1352224 ) ( IS-CRATE ?auto_1352223 ) ( AVAILABLE ?auto_1352230 ) ( IN ?auto_1352223 ?auto_1352231 ) ( TRUCK-AT ?auto_1352231 ?auto_1352229 ) ( ON ?auto_1352221 ?auto_1352220 ) ( ON ?auto_1352222 ?auto_1352221 ) ( ON ?auto_1352224 ?auto_1352222 ) ( not ( = ?auto_1352220 ?auto_1352221 ) ) ( not ( = ?auto_1352220 ?auto_1352222 ) ) ( not ( = ?auto_1352220 ?auto_1352224 ) ) ( not ( = ?auto_1352220 ?auto_1352223 ) ) ( not ( = ?auto_1352220 ?auto_1352225 ) ) ( not ( = ?auto_1352220 ?auto_1352226 ) ) ( not ( = ?auto_1352221 ?auto_1352222 ) ) ( not ( = ?auto_1352221 ?auto_1352224 ) ) ( not ( = ?auto_1352221 ?auto_1352223 ) ) ( not ( = ?auto_1352221 ?auto_1352225 ) ) ( not ( = ?auto_1352221 ?auto_1352226 ) ) ( not ( = ?auto_1352222 ?auto_1352224 ) ) ( not ( = ?auto_1352222 ?auto_1352223 ) ) ( not ( = ?auto_1352222 ?auto_1352225 ) ) ( not ( = ?auto_1352222 ?auto_1352226 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352224 ?auto_1352223 ?auto_1352225 )
      ( MAKE-5CRATE-VERIFY ?auto_1352220 ?auto_1352221 ?auto_1352222 ?auto_1352224 ?auto_1352223 ?auto_1352225 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1352232 - SURFACE
      ?auto_1352233 - SURFACE
      ?auto_1352234 - SURFACE
      ?auto_1352236 - SURFACE
      ?auto_1352235 - SURFACE
      ?auto_1352237 - SURFACE
      ?auto_1352238 - SURFACE
    )
    :vars
    (
      ?auto_1352243 - HOIST
      ?auto_1352241 - PLACE
      ?auto_1352242 - PLACE
      ?auto_1352240 - HOIST
      ?auto_1352239 - SURFACE
      ?auto_1352244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352243 ?auto_1352241 ) ( IS-CRATE ?auto_1352238 ) ( not ( = ?auto_1352237 ?auto_1352238 ) ) ( not ( = ?auto_1352235 ?auto_1352237 ) ) ( not ( = ?auto_1352235 ?auto_1352238 ) ) ( not ( = ?auto_1352242 ?auto_1352241 ) ) ( HOIST-AT ?auto_1352240 ?auto_1352242 ) ( not ( = ?auto_1352243 ?auto_1352240 ) ) ( AVAILABLE ?auto_1352240 ) ( SURFACE-AT ?auto_1352238 ?auto_1352242 ) ( ON ?auto_1352238 ?auto_1352239 ) ( CLEAR ?auto_1352238 ) ( not ( = ?auto_1352237 ?auto_1352239 ) ) ( not ( = ?auto_1352238 ?auto_1352239 ) ) ( not ( = ?auto_1352235 ?auto_1352239 ) ) ( SURFACE-AT ?auto_1352235 ?auto_1352241 ) ( CLEAR ?auto_1352235 ) ( IS-CRATE ?auto_1352237 ) ( AVAILABLE ?auto_1352243 ) ( IN ?auto_1352237 ?auto_1352244 ) ( TRUCK-AT ?auto_1352244 ?auto_1352242 ) ( ON ?auto_1352233 ?auto_1352232 ) ( ON ?auto_1352234 ?auto_1352233 ) ( ON ?auto_1352236 ?auto_1352234 ) ( ON ?auto_1352235 ?auto_1352236 ) ( not ( = ?auto_1352232 ?auto_1352233 ) ) ( not ( = ?auto_1352232 ?auto_1352234 ) ) ( not ( = ?auto_1352232 ?auto_1352236 ) ) ( not ( = ?auto_1352232 ?auto_1352235 ) ) ( not ( = ?auto_1352232 ?auto_1352237 ) ) ( not ( = ?auto_1352232 ?auto_1352238 ) ) ( not ( = ?auto_1352232 ?auto_1352239 ) ) ( not ( = ?auto_1352233 ?auto_1352234 ) ) ( not ( = ?auto_1352233 ?auto_1352236 ) ) ( not ( = ?auto_1352233 ?auto_1352235 ) ) ( not ( = ?auto_1352233 ?auto_1352237 ) ) ( not ( = ?auto_1352233 ?auto_1352238 ) ) ( not ( = ?auto_1352233 ?auto_1352239 ) ) ( not ( = ?auto_1352234 ?auto_1352236 ) ) ( not ( = ?auto_1352234 ?auto_1352235 ) ) ( not ( = ?auto_1352234 ?auto_1352237 ) ) ( not ( = ?auto_1352234 ?auto_1352238 ) ) ( not ( = ?auto_1352234 ?auto_1352239 ) ) ( not ( = ?auto_1352236 ?auto_1352235 ) ) ( not ( = ?auto_1352236 ?auto_1352237 ) ) ( not ( = ?auto_1352236 ?auto_1352238 ) ) ( not ( = ?auto_1352236 ?auto_1352239 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352235 ?auto_1352237 ?auto_1352238 )
      ( MAKE-6CRATE-VERIFY ?auto_1352232 ?auto_1352233 ?auto_1352234 ?auto_1352236 ?auto_1352235 ?auto_1352237 ?auto_1352238 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1352245 - SURFACE
      ?auto_1352246 - SURFACE
      ?auto_1352247 - SURFACE
      ?auto_1352249 - SURFACE
      ?auto_1352248 - SURFACE
      ?auto_1352250 - SURFACE
      ?auto_1352251 - SURFACE
      ?auto_1352252 - SURFACE
    )
    :vars
    (
      ?auto_1352257 - HOIST
      ?auto_1352255 - PLACE
      ?auto_1352256 - PLACE
      ?auto_1352254 - HOIST
      ?auto_1352253 - SURFACE
      ?auto_1352258 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352257 ?auto_1352255 ) ( IS-CRATE ?auto_1352252 ) ( not ( = ?auto_1352251 ?auto_1352252 ) ) ( not ( = ?auto_1352250 ?auto_1352251 ) ) ( not ( = ?auto_1352250 ?auto_1352252 ) ) ( not ( = ?auto_1352256 ?auto_1352255 ) ) ( HOIST-AT ?auto_1352254 ?auto_1352256 ) ( not ( = ?auto_1352257 ?auto_1352254 ) ) ( AVAILABLE ?auto_1352254 ) ( SURFACE-AT ?auto_1352252 ?auto_1352256 ) ( ON ?auto_1352252 ?auto_1352253 ) ( CLEAR ?auto_1352252 ) ( not ( = ?auto_1352251 ?auto_1352253 ) ) ( not ( = ?auto_1352252 ?auto_1352253 ) ) ( not ( = ?auto_1352250 ?auto_1352253 ) ) ( SURFACE-AT ?auto_1352250 ?auto_1352255 ) ( CLEAR ?auto_1352250 ) ( IS-CRATE ?auto_1352251 ) ( AVAILABLE ?auto_1352257 ) ( IN ?auto_1352251 ?auto_1352258 ) ( TRUCK-AT ?auto_1352258 ?auto_1352256 ) ( ON ?auto_1352246 ?auto_1352245 ) ( ON ?auto_1352247 ?auto_1352246 ) ( ON ?auto_1352249 ?auto_1352247 ) ( ON ?auto_1352248 ?auto_1352249 ) ( ON ?auto_1352250 ?auto_1352248 ) ( not ( = ?auto_1352245 ?auto_1352246 ) ) ( not ( = ?auto_1352245 ?auto_1352247 ) ) ( not ( = ?auto_1352245 ?auto_1352249 ) ) ( not ( = ?auto_1352245 ?auto_1352248 ) ) ( not ( = ?auto_1352245 ?auto_1352250 ) ) ( not ( = ?auto_1352245 ?auto_1352251 ) ) ( not ( = ?auto_1352245 ?auto_1352252 ) ) ( not ( = ?auto_1352245 ?auto_1352253 ) ) ( not ( = ?auto_1352246 ?auto_1352247 ) ) ( not ( = ?auto_1352246 ?auto_1352249 ) ) ( not ( = ?auto_1352246 ?auto_1352248 ) ) ( not ( = ?auto_1352246 ?auto_1352250 ) ) ( not ( = ?auto_1352246 ?auto_1352251 ) ) ( not ( = ?auto_1352246 ?auto_1352252 ) ) ( not ( = ?auto_1352246 ?auto_1352253 ) ) ( not ( = ?auto_1352247 ?auto_1352249 ) ) ( not ( = ?auto_1352247 ?auto_1352248 ) ) ( not ( = ?auto_1352247 ?auto_1352250 ) ) ( not ( = ?auto_1352247 ?auto_1352251 ) ) ( not ( = ?auto_1352247 ?auto_1352252 ) ) ( not ( = ?auto_1352247 ?auto_1352253 ) ) ( not ( = ?auto_1352249 ?auto_1352248 ) ) ( not ( = ?auto_1352249 ?auto_1352250 ) ) ( not ( = ?auto_1352249 ?auto_1352251 ) ) ( not ( = ?auto_1352249 ?auto_1352252 ) ) ( not ( = ?auto_1352249 ?auto_1352253 ) ) ( not ( = ?auto_1352248 ?auto_1352250 ) ) ( not ( = ?auto_1352248 ?auto_1352251 ) ) ( not ( = ?auto_1352248 ?auto_1352252 ) ) ( not ( = ?auto_1352248 ?auto_1352253 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352250 ?auto_1352251 ?auto_1352252 )
      ( MAKE-7CRATE-VERIFY ?auto_1352245 ?auto_1352246 ?auto_1352247 ?auto_1352249 ?auto_1352248 ?auto_1352250 ?auto_1352251 ?auto_1352252 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1352259 - SURFACE
      ?auto_1352260 - SURFACE
      ?auto_1352261 - SURFACE
      ?auto_1352263 - SURFACE
      ?auto_1352262 - SURFACE
      ?auto_1352264 - SURFACE
      ?auto_1352265 - SURFACE
      ?auto_1352266 - SURFACE
      ?auto_1352267 - SURFACE
    )
    :vars
    (
      ?auto_1352272 - HOIST
      ?auto_1352270 - PLACE
      ?auto_1352271 - PLACE
      ?auto_1352269 - HOIST
      ?auto_1352268 - SURFACE
      ?auto_1352273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352272 ?auto_1352270 ) ( IS-CRATE ?auto_1352267 ) ( not ( = ?auto_1352266 ?auto_1352267 ) ) ( not ( = ?auto_1352265 ?auto_1352266 ) ) ( not ( = ?auto_1352265 ?auto_1352267 ) ) ( not ( = ?auto_1352271 ?auto_1352270 ) ) ( HOIST-AT ?auto_1352269 ?auto_1352271 ) ( not ( = ?auto_1352272 ?auto_1352269 ) ) ( AVAILABLE ?auto_1352269 ) ( SURFACE-AT ?auto_1352267 ?auto_1352271 ) ( ON ?auto_1352267 ?auto_1352268 ) ( CLEAR ?auto_1352267 ) ( not ( = ?auto_1352266 ?auto_1352268 ) ) ( not ( = ?auto_1352267 ?auto_1352268 ) ) ( not ( = ?auto_1352265 ?auto_1352268 ) ) ( SURFACE-AT ?auto_1352265 ?auto_1352270 ) ( CLEAR ?auto_1352265 ) ( IS-CRATE ?auto_1352266 ) ( AVAILABLE ?auto_1352272 ) ( IN ?auto_1352266 ?auto_1352273 ) ( TRUCK-AT ?auto_1352273 ?auto_1352271 ) ( ON ?auto_1352260 ?auto_1352259 ) ( ON ?auto_1352261 ?auto_1352260 ) ( ON ?auto_1352263 ?auto_1352261 ) ( ON ?auto_1352262 ?auto_1352263 ) ( ON ?auto_1352264 ?auto_1352262 ) ( ON ?auto_1352265 ?auto_1352264 ) ( not ( = ?auto_1352259 ?auto_1352260 ) ) ( not ( = ?auto_1352259 ?auto_1352261 ) ) ( not ( = ?auto_1352259 ?auto_1352263 ) ) ( not ( = ?auto_1352259 ?auto_1352262 ) ) ( not ( = ?auto_1352259 ?auto_1352264 ) ) ( not ( = ?auto_1352259 ?auto_1352265 ) ) ( not ( = ?auto_1352259 ?auto_1352266 ) ) ( not ( = ?auto_1352259 ?auto_1352267 ) ) ( not ( = ?auto_1352259 ?auto_1352268 ) ) ( not ( = ?auto_1352260 ?auto_1352261 ) ) ( not ( = ?auto_1352260 ?auto_1352263 ) ) ( not ( = ?auto_1352260 ?auto_1352262 ) ) ( not ( = ?auto_1352260 ?auto_1352264 ) ) ( not ( = ?auto_1352260 ?auto_1352265 ) ) ( not ( = ?auto_1352260 ?auto_1352266 ) ) ( not ( = ?auto_1352260 ?auto_1352267 ) ) ( not ( = ?auto_1352260 ?auto_1352268 ) ) ( not ( = ?auto_1352261 ?auto_1352263 ) ) ( not ( = ?auto_1352261 ?auto_1352262 ) ) ( not ( = ?auto_1352261 ?auto_1352264 ) ) ( not ( = ?auto_1352261 ?auto_1352265 ) ) ( not ( = ?auto_1352261 ?auto_1352266 ) ) ( not ( = ?auto_1352261 ?auto_1352267 ) ) ( not ( = ?auto_1352261 ?auto_1352268 ) ) ( not ( = ?auto_1352263 ?auto_1352262 ) ) ( not ( = ?auto_1352263 ?auto_1352264 ) ) ( not ( = ?auto_1352263 ?auto_1352265 ) ) ( not ( = ?auto_1352263 ?auto_1352266 ) ) ( not ( = ?auto_1352263 ?auto_1352267 ) ) ( not ( = ?auto_1352263 ?auto_1352268 ) ) ( not ( = ?auto_1352262 ?auto_1352264 ) ) ( not ( = ?auto_1352262 ?auto_1352265 ) ) ( not ( = ?auto_1352262 ?auto_1352266 ) ) ( not ( = ?auto_1352262 ?auto_1352267 ) ) ( not ( = ?auto_1352262 ?auto_1352268 ) ) ( not ( = ?auto_1352264 ?auto_1352265 ) ) ( not ( = ?auto_1352264 ?auto_1352266 ) ) ( not ( = ?auto_1352264 ?auto_1352267 ) ) ( not ( = ?auto_1352264 ?auto_1352268 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352265 ?auto_1352266 ?auto_1352267 )
      ( MAKE-8CRATE-VERIFY ?auto_1352259 ?auto_1352260 ?auto_1352261 ?auto_1352263 ?auto_1352262 ?auto_1352264 ?auto_1352265 ?auto_1352266 ?auto_1352267 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1352274 - SURFACE
      ?auto_1352275 - SURFACE
    )
    :vars
    (
      ?auto_1352281 - HOIST
      ?auto_1352279 - PLACE
      ?auto_1352277 - SURFACE
      ?auto_1352280 - PLACE
      ?auto_1352278 - HOIST
      ?auto_1352276 - SURFACE
      ?auto_1352282 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352281 ?auto_1352279 ) ( IS-CRATE ?auto_1352275 ) ( not ( = ?auto_1352274 ?auto_1352275 ) ) ( not ( = ?auto_1352277 ?auto_1352274 ) ) ( not ( = ?auto_1352277 ?auto_1352275 ) ) ( not ( = ?auto_1352280 ?auto_1352279 ) ) ( HOIST-AT ?auto_1352278 ?auto_1352280 ) ( not ( = ?auto_1352281 ?auto_1352278 ) ) ( SURFACE-AT ?auto_1352275 ?auto_1352280 ) ( ON ?auto_1352275 ?auto_1352276 ) ( CLEAR ?auto_1352275 ) ( not ( = ?auto_1352274 ?auto_1352276 ) ) ( not ( = ?auto_1352275 ?auto_1352276 ) ) ( not ( = ?auto_1352277 ?auto_1352276 ) ) ( SURFACE-AT ?auto_1352277 ?auto_1352279 ) ( CLEAR ?auto_1352277 ) ( IS-CRATE ?auto_1352274 ) ( AVAILABLE ?auto_1352281 ) ( TRUCK-AT ?auto_1352282 ?auto_1352280 ) ( LIFTING ?auto_1352278 ?auto_1352274 ) )
    :subtasks
    ( ( !LOAD ?auto_1352278 ?auto_1352274 ?auto_1352282 ?auto_1352280 )
      ( MAKE-2CRATE ?auto_1352277 ?auto_1352274 ?auto_1352275 )
      ( MAKE-1CRATE-VERIFY ?auto_1352274 ?auto_1352275 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1352283 - SURFACE
      ?auto_1352284 - SURFACE
      ?auto_1352285 - SURFACE
    )
    :vars
    (
      ?auto_1352290 - HOIST
      ?auto_1352289 - PLACE
      ?auto_1352286 - PLACE
      ?auto_1352288 - HOIST
      ?auto_1352291 - SURFACE
      ?auto_1352287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352290 ?auto_1352289 ) ( IS-CRATE ?auto_1352285 ) ( not ( = ?auto_1352284 ?auto_1352285 ) ) ( not ( = ?auto_1352283 ?auto_1352284 ) ) ( not ( = ?auto_1352283 ?auto_1352285 ) ) ( not ( = ?auto_1352286 ?auto_1352289 ) ) ( HOIST-AT ?auto_1352288 ?auto_1352286 ) ( not ( = ?auto_1352290 ?auto_1352288 ) ) ( SURFACE-AT ?auto_1352285 ?auto_1352286 ) ( ON ?auto_1352285 ?auto_1352291 ) ( CLEAR ?auto_1352285 ) ( not ( = ?auto_1352284 ?auto_1352291 ) ) ( not ( = ?auto_1352285 ?auto_1352291 ) ) ( not ( = ?auto_1352283 ?auto_1352291 ) ) ( SURFACE-AT ?auto_1352283 ?auto_1352289 ) ( CLEAR ?auto_1352283 ) ( IS-CRATE ?auto_1352284 ) ( AVAILABLE ?auto_1352290 ) ( TRUCK-AT ?auto_1352287 ?auto_1352286 ) ( LIFTING ?auto_1352288 ?auto_1352284 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1352284 ?auto_1352285 )
      ( MAKE-2CRATE-VERIFY ?auto_1352283 ?auto_1352284 ?auto_1352285 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1352292 - SURFACE
      ?auto_1352293 - SURFACE
      ?auto_1352294 - SURFACE
      ?auto_1352295 - SURFACE
    )
    :vars
    (
      ?auto_1352301 - HOIST
      ?auto_1352299 - PLACE
      ?auto_1352296 - PLACE
      ?auto_1352297 - HOIST
      ?auto_1352300 - SURFACE
      ?auto_1352298 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352301 ?auto_1352299 ) ( IS-CRATE ?auto_1352295 ) ( not ( = ?auto_1352294 ?auto_1352295 ) ) ( not ( = ?auto_1352293 ?auto_1352294 ) ) ( not ( = ?auto_1352293 ?auto_1352295 ) ) ( not ( = ?auto_1352296 ?auto_1352299 ) ) ( HOIST-AT ?auto_1352297 ?auto_1352296 ) ( not ( = ?auto_1352301 ?auto_1352297 ) ) ( SURFACE-AT ?auto_1352295 ?auto_1352296 ) ( ON ?auto_1352295 ?auto_1352300 ) ( CLEAR ?auto_1352295 ) ( not ( = ?auto_1352294 ?auto_1352300 ) ) ( not ( = ?auto_1352295 ?auto_1352300 ) ) ( not ( = ?auto_1352293 ?auto_1352300 ) ) ( SURFACE-AT ?auto_1352293 ?auto_1352299 ) ( CLEAR ?auto_1352293 ) ( IS-CRATE ?auto_1352294 ) ( AVAILABLE ?auto_1352301 ) ( TRUCK-AT ?auto_1352298 ?auto_1352296 ) ( LIFTING ?auto_1352297 ?auto_1352294 ) ( ON ?auto_1352293 ?auto_1352292 ) ( not ( = ?auto_1352292 ?auto_1352293 ) ) ( not ( = ?auto_1352292 ?auto_1352294 ) ) ( not ( = ?auto_1352292 ?auto_1352295 ) ) ( not ( = ?auto_1352292 ?auto_1352300 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352293 ?auto_1352294 ?auto_1352295 )
      ( MAKE-3CRATE-VERIFY ?auto_1352292 ?auto_1352293 ?auto_1352294 ?auto_1352295 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1352302 - SURFACE
      ?auto_1352303 - SURFACE
      ?auto_1352304 - SURFACE
      ?auto_1352306 - SURFACE
      ?auto_1352305 - SURFACE
    )
    :vars
    (
      ?auto_1352312 - HOIST
      ?auto_1352310 - PLACE
      ?auto_1352307 - PLACE
      ?auto_1352308 - HOIST
      ?auto_1352311 - SURFACE
      ?auto_1352309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352312 ?auto_1352310 ) ( IS-CRATE ?auto_1352305 ) ( not ( = ?auto_1352306 ?auto_1352305 ) ) ( not ( = ?auto_1352304 ?auto_1352306 ) ) ( not ( = ?auto_1352304 ?auto_1352305 ) ) ( not ( = ?auto_1352307 ?auto_1352310 ) ) ( HOIST-AT ?auto_1352308 ?auto_1352307 ) ( not ( = ?auto_1352312 ?auto_1352308 ) ) ( SURFACE-AT ?auto_1352305 ?auto_1352307 ) ( ON ?auto_1352305 ?auto_1352311 ) ( CLEAR ?auto_1352305 ) ( not ( = ?auto_1352306 ?auto_1352311 ) ) ( not ( = ?auto_1352305 ?auto_1352311 ) ) ( not ( = ?auto_1352304 ?auto_1352311 ) ) ( SURFACE-AT ?auto_1352304 ?auto_1352310 ) ( CLEAR ?auto_1352304 ) ( IS-CRATE ?auto_1352306 ) ( AVAILABLE ?auto_1352312 ) ( TRUCK-AT ?auto_1352309 ?auto_1352307 ) ( LIFTING ?auto_1352308 ?auto_1352306 ) ( ON ?auto_1352303 ?auto_1352302 ) ( ON ?auto_1352304 ?auto_1352303 ) ( not ( = ?auto_1352302 ?auto_1352303 ) ) ( not ( = ?auto_1352302 ?auto_1352304 ) ) ( not ( = ?auto_1352302 ?auto_1352306 ) ) ( not ( = ?auto_1352302 ?auto_1352305 ) ) ( not ( = ?auto_1352302 ?auto_1352311 ) ) ( not ( = ?auto_1352303 ?auto_1352304 ) ) ( not ( = ?auto_1352303 ?auto_1352306 ) ) ( not ( = ?auto_1352303 ?auto_1352305 ) ) ( not ( = ?auto_1352303 ?auto_1352311 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352304 ?auto_1352306 ?auto_1352305 )
      ( MAKE-4CRATE-VERIFY ?auto_1352302 ?auto_1352303 ?auto_1352304 ?auto_1352306 ?auto_1352305 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1352313 - SURFACE
      ?auto_1352314 - SURFACE
      ?auto_1352315 - SURFACE
      ?auto_1352317 - SURFACE
      ?auto_1352316 - SURFACE
      ?auto_1352318 - SURFACE
    )
    :vars
    (
      ?auto_1352324 - HOIST
      ?auto_1352322 - PLACE
      ?auto_1352319 - PLACE
      ?auto_1352320 - HOIST
      ?auto_1352323 - SURFACE
      ?auto_1352321 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352324 ?auto_1352322 ) ( IS-CRATE ?auto_1352318 ) ( not ( = ?auto_1352316 ?auto_1352318 ) ) ( not ( = ?auto_1352317 ?auto_1352316 ) ) ( not ( = ?auto_1352317 ?auto_1352318 ) ) ( not ( = ?auto_1352319 ?auto_1352322 ) ) ( HOIST-AT ?auto_1352320 ?auto_1352319 ) ( not ( = ?auto_1352324 ?auto_1352320 ) ) ( SURFACE-AT ?auto_1352318 ?auto_1352319 ) ( ON ?auto_1352318 ?auto_1352323 ) ( CLEAR ?auto_1352318 ) ( not ( = ?auto_1352316 ?auto_1352323 ) ) ( not ( = ?auto_1352318 ?auto_1352323 ) ) ( not ( = ?auto_1352317 ?auto_1352323 ) ) ( SURFACE-AT ?auto_1352317 ?auto_1352322 ) ( CLEAR ?auto_1352317 ) ( IS-CRATE ?auto_1352316 ) ( AVAILABLE ?auto_1352324 ) ( TRUCK-AT ?auto_1352321 ?auto_1352319 ) ( LIFTING ?auto_1352320 ?auto_1352316 ) ( ON ?auto_1352314 ?auto_1352313 ) ( ON ?auto_1352315 ?auto_1352314 ) ( ON ?auto_1352317 ?auto_1352315 ) ( not ( = ?auto_1352313 ?auto_1352314 ) ) ( not ( = ?auto_1352313 ?auto_1352315 ) ) ( not ( = ?auto_1352313 ?auto_1352317 ) ) ( not ( = ?auto_1352313 ?auto_1352316 ) ) ( not ( = ?auto_1352313 ?auto_1352318 ) ) ( not ( = ?auto_1352313 ?auto_1352323 ) ) ( not ( = ?auto_1352314 ?auto_1352315 ) ) ( not ( = ?auto_1352314 ?auto_1352317 ) ) ( not ( = ?auto_1352314 ?auto_1352316 ) ) ( not ( = ?auto_1352314 ?auto_1352318 ) ) ( not ( = ?auto_1352314 ?auto_1352323 ) ) ( not ( = ?auto_1352315 ?auto_1352317 ) ) ( not ( = ?auto_1352315 ?auto_1352316 ) ) ( not ( = ?auto_1352315 ?auto_1352318 ) ) ( not ( = ?auto_1352315 ?auto_1352323 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352317 ?auto_1352316 ?auto_1352318 )
      ( MAKE-5CRATE-VERIFY ?auto_1352313 ?auto_1352314 ?auto_1352315 ?auto_1352317 ?auto_1352316 ?auto_1352318 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1352325 - SURFACE
      ?auto_1352326 - SURFACE
      ?auto_1352327 - SURFACE
      ?auto_1352329 - SURFACE
      ?auto_1352328 - SURFACE
      ?auto_1352330 - SURFACE
      ?auto_1352331 - SURFACE
    )
    :vars
    (
      ?auto_1352337 - HOIST
      ?auto_1352335 - PLACE
      ?auto_1352332 - PLACE
      ?auto_1352333 - HOIST
      ?auto_1352336 - SURFACE
      ?auto_1352334 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352337 ?auto_1352335 ) ( IS-CRATE ?auto_1352331 ) ( not ( = ?auto_1352330 ?auto_1352331 ) ) ( not ( = ?auto_1352328 ?auto_1352330 ) ) ( not ( = ?auto_1352328 ?auto_1352331 ) ) ( not ( = ?auto_1352332 ?auto_1352335 ) ) ( HOIST-AT ?auto_1352333 ?auto_1352332 ) ( not ( = ?auto_1352337 ?auto_1352333 ) ) ( SURFACE-AT ?auto_1352331 ?auto_1352332 ) ( ON ?auto_1352331 ?auto_1352336 ) ( CLEAR ?auto_1352331 ) ( not ( = ?auto_1352330 ?auto_1352336 ) ) ( not ( = ?auto_1352331 ?auto_1352336 ) ) ( not ( = ?auto_1352328 ?auto_1352336 ) ) ( SURFACE-AT ?auto_1352328 ?auto_1352335 ) ( CLEAR ?auto_1352328 ) ( IS-CRATE ?auto_1352330 ) ( AVAILABLE ?auto_1352337 ) ( TRUCK-AT ?auto_1352334 ?auto_1352332 ) ( LIFTING ?auto_1352333 ?auto_1352330 ) ( ON ?auto_1352326 ?auto_1352325 ) ( ON ?auto_1352327 ?auto_1352326 ) ( ON ?auto_1352329 ?auto_1352327 ) ( ON ?auto_1352328 ?auto_1352329 ) ( not ( = ?auto_1352325 ?auto_1352326 ) ) ( not ( = ?auto_1352325 ?auto_1352327 ) ) ( not ( = ?auto_1352325 ?auto_1352329 ) ) ( not ( = ?auto_1352325 ?auto_1352328 ) ) ( not ( = ?auto_1352325 ?auto_1352330 ) ) ( not ( = ?auto_1352325 ?auto_1352331 ) ) ( not ( = ?auto_1352325 ?auto_1352336 ) ) ( not ( = ?auto_1352326 ?auto_1352327 ) ) ( not ( = ?auto_1352326 ?auto_1352329 ) ) ( not ( = ?auto_1352326 ?auto_1352328 ) ) ( not ( = ?auto_1352326 ?auto_1352330 ) ) ( not ( = ?auto_1352326 ?auto_1352331 ) ) ( not ( = ?auto_1352326 ?auto_1352336 ) ) ( not ( = ?auto_1352327 ?auto_1352329 ) ) ( not ( = ?auto_1352327 ?auto_1352328 ) ) ( not ( = ?auto_1352327 ?auto_1352330 ) ) ( not ( = ?auto_1352327 ?auto_1352331 ) ) ( not ( = ?auto_1352327 ?auto_1352336 ) ) ( not ( = ?auto_1352329 ?auto_1352328 ) ) ( not ( = ?auto_1352329 ?auto_1352330 ) ) ( not ( = ?auto_1352329 ?auto_1352331 ) ) ( not ( = ?auto_1352329 ?auto_1352336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352328 ?auto_1352330 ?auto_1352331 )
      ( MAKE-6CRATE-VERIFY ?auto_1352325 ?auto_1352326 ?auto_1352327 ?auto_1352329 ?auto_1352328 ?auto_1352330 ?auto_1352331 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1352338 - SURFACE
      ?auto_1352339 - SURFACE
      ?auto_1352340 - SURFACE
      ?auto_1352342 - SURFACE
      ?auto_1352341 - SURFACE
      ?auto_1352343 - SURFACE
      ?auto_1352344 - SURFACE
      ?auto_1352345 - SURFACE
    )
    :vars
    (
      ?auto_1352351 - HOIST
      ?auto_1352349 - PLACE
      ?auto_1352346 - PLACE
      ?auto_1352347 - HOIST
      ?auto_1352350 - SURFACE
      ?auto_1352348 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352351 ?auto_1352349 ) ( IS-CRATE ?auto_1352345 ) ( not ( = ?auto_1352344 ?auto_1352345 ) ) ( not ( = ?auto_1352343 ?auto_1352344 ) ) ( not ( = ?auto_1352343 ?auto_1352345 ) ) ( not ( = ?auto_1352346 ?auto_1352349 ) ) ( HOIST-AT ?auto_1352347 ?auto_1352346 ) ( not ( = ?auto_1352351 ?auto_1352347 ) ) ( SURFACE-AT ?auto_1352345 ?auto_1352346 ) ( ON ?auto_1352345 ?auto_1352350 ) ( CLEAR ?auto_1352345 ) ( not ( = ?auto_1352344 ?auto_1352350 ) ) ( not ( = ?auto_1352345 ?auto_1352350 ) ) ( not ( = ?auto_1352343 ?auto_1352350 ) ) ( SURFACE-AT ?auto_1352343 ?auto_1352349 ) ( CLEAR ?auto_1352343 ) ( IS-CRATE ?auto_1352344 ) ( AVAILABLE ?auto_1352351 ) ( TRUCK-AT ?auto_1352348 ?auto_1352346 ) ( LIFTING ?auto_1352347 ?auto_1352344 ) ( ON ?auto_1352339 ?auto_1352338 ) ( ON ?auto_1352340 ?auto_1352339 ) ( ON ?auto_1352342 ?auto_1352340 ) ( ON ?auto_1352341 ?auto_1352342 ) ( ON ?auto_1352343 ?auto_1352341 ) ( not ( = ?auto_1352338 ?auto_1352339 ) ) ( not ( = ?auto_1352338 ?auto_1352340 ) ) ( not ( = ?auto_1352338 ?auto_1352342 ) ) ( not ( = ?auto_1352338 ?auto_1352341 ) ) ( not ( = ?auto_1352338 ?auto_1352343 ) ) ( not ( = ?auto_1352338 ?auto_1352344 ) ) ( not ( = ?auto_1352338 ?auto_1352345 ) ) ( not ( = ?auto_1352338 ?auto_1352350 ) ) ( not ( = ?auto_1352339 ?auto_1352340 ) ) ( not ( = ?auto_1352339 ?auto_1352342 ) ) ( not ( = ?auto_1352339 ?auto_1352341 ) ) ( not ( = ?auto_1352339 ?auto_1352343 ) ) ( not ( = ?auto_1352339 ?auto_1352344 ) ) ( not ( = ?auto_1352339 ?auto_1352345 ) ) ( not ( = ?auto_1352339 ?auto_1352350 ) ) ( not ( = ?auto_1352340 ?auto_1352342 ) ) ( not ( = ?auto_1352340 ?auto_1352341 ) ) ( not ( = ?auto_1352340 ?auto_1352343 ) ) ( not ( = ?auto_1352340 ?auto_1352344 ) ) ( not ( = ?auto_1352340 ?auto_1352345 ) ) ( not ( = ?auto_1352340 ?auto_1352350 ) ) ( not ( = ?auto_1352342 ?auto_1352341 ) ) ( not ( = ?auto_1352342 ?auto_1352343 ) ) ( not ( = ?auto_1352342 ?auto_1352344 ) ) ( not ( = ?auto_1352342 ?auto_1352345 ) ) ( not ( = ?auto_1352342 ?auto_1352350 ) ) ( not ( = ?auto_1352341 ?auto_1352343 ) ) ( not ( = ?auto_1352341 ?auto_1352344 ) ) ( not ( = ?auto_1352341 ?auto_1352345 ) ) ( not ( = ?auto_1352341 ?auto_1352350 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352343 ?auto_1352344 ?auto_1352345 )
      ( MAKE-7CRATE-VERIFY ?auto_1352338 ?auto_1352339 ?auto_1352340 ?auto_1352342 ?auto_1352341 ?auto_1352343 ?auto_1352344 ?auto_1352345 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1352352 - SURFACE
      ?auto_1352353 - SURFACE
      ?auto_1352354 - SURFACE
      ?auto_1352356 - SURFACE
      ?auto_1352355 - SURFACE
      ?auto_1352357 - SURFACE
      ?auto_1352358 - SURFACE
      ?auto_1352359 - SURFACE
      ?auto_1352360 - SURFACE
    )
    :vars
    (
      ?auto_1352366 - HOIST
      ?auto_1352364 - PLACE
      ?auto_1352361 - PLACE
      ?auto_1352362 - HOIST
      ?auto_1352365 - SURFACE
      ?auto_1352363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352366 ?auto_1352364 ) ( IS-CRATE ?auto_1352360 ) ( not ( = ?auto_1352359 ?auto_1352360 ) ) ( not ( = ?auto_1352358 ?auto_1352359 ) ) ( not ( = ?auto_1352358 ?auto_1352360 ) ) ( not ( = ?auto_1352361 ?auto_1352364 ) ) ( HOIST-AT ?auto_1352362 ?auto_1352361 ) ( not ( = ?auto_1352366 ?auto_1352362 ) ) ( SURFACE-AT ?auto_1352360 ?auto_1352361 ) ( ON ?auto_1352360 ?auto_1352365 ) ( CLEAR ?auto_1352360 ) ( not ( = ?auto_1352359 ?auto_1352365 ) ) ( not ( = ?auto_1352360 ?auto_1352365 ) ) ( not ( = ?auto_1352358 ?auto_1352365 ) ) ( SURFACE-AT ?auto_1352358 ?auto_1352364 ) ( CLEAR ?auto_1352358 ) ( IS-CRATE ?auto_1352359 ) ( AVAILABLE ?auto_1352366 ) ( TRUCK-AT ?auto_1352363 ?auto_1352361 ) ( LIFTING ?auto_1352362 ?auto_1352359 ) ( ON ?auto_1352353 ?auto_1352352 ) ( ON ?auto_1352354 ?auto_1352353 ) ( ON ?auto_1352356 ?auto_1352354 ) ( ON ?auto_1352355 ?auto_1352356 ) ( ON ?auto_1352357 ?auto_1352355 ) ( ON ?auto_1352358 ?auto_1352357 ) ( not ( = ?auto_1352352 ?auto_1352353 ) ) ( not ( = ?auto_1352352 ?auto_1352354 ) ) ( not ( = ?auto_1352352 ?auto_1352356 ) ) ( not ( = ?auto_1352352 ?auto_1352355 ) ) ( not ( = ?auto_1352352 ?auto_1352357 ) ) ( not ( = ?auto_1352352 ?auto_1352358 ) ) ( not ( = ?auto_1352352 ?auto_1352359 ) ) ( not ( = ?auto_1352352 ?auto_1352360 ) ) ( not ( = ?auto_1352352 ?auto_1352365 ) ) ( not ( = ?auto_1352353 ?auto_1352354 ) ) ( not ( = ?auto_1352353 ?auto_1352356 ) ) ( not ( = ?auto_1352353 ?auto_1352355 ) ) ( not ( = ?auto_1352353 ?auto_1352357 ) ) ( not ( = ?auto_1352353 ?auto_1352358 ) ) ( not ( = ?auto_1352353 ?auto_1352359 ) ) ( not ( = ?auto_1352353 ?auto_1352360 ) ) ( not ( = ?auto_1352353 ?auto_1352365 ) ) ( not ( = ?auto_1352354 ?auto_1352356 ) ) ( not ( = ?auto_1352354 ?auto_1352355 ) ) ( not ( = ?auto_1352354 ?auto_1352357 ) ) ( not ( = ?auto_1352354 ?auto_1352358 ) ) ( not ( = ?auto_1352354 ?auto_1352359 ) ) ( not ( = ?auto_1352354 ?auto_1352360 ) ) ( not ( = ?auto_1352354 ?auto_1352365 ) ) ( not ( = ?auto_1352356 ?auto_1352355 ) ) ( not ( = ?auto_1352356 ?auto_1352357 ) ) ( not ( = ?auto_1352356 ?auto_1352358 ) ) ( not ( = ?auto_1352356 ?auto_1352359 ) ) ( not ( = ?auto_1352356 ?auto_1352360 ) ) ( not ( = ?auto_1352356 ?auto_1352365 ) ) ( not ( = ?auto_1352355 ?auto_1352357 ) ) ( not ( = ?auto_1352355 ?auto_1352358 ) ) ( not ( = ?auto_1352355 ?auto_1352359 ) ) ( not ( = ?auto_1352355 ?auto_1352360 ) ) ( not ( = ?auto_1352355 ?auto_1352365 ) ) ( not ( = ?auto_1352357 ?auto_1352358 ) ) ( not ( = ?auto_1352357 ?auto_1352359 ) ) ( not ( = ?auto_1352357 ?auto_1352360 ) ) ( not ( = ?auto_1352357 ?auto_1352365 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352358 ?auto_1352359 ?auto_1352360 )
      ( MAKE-8CRATE-VERIFY ?auto_1352352 ?auto_1352353 ?auto_1352354 ?auto_1352356 ?auto_1352355 ?auto_1352357 ?auto_1352358 ?auto_1352359 ?auto_1352360 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1352367 - SURFACE
      ?auto_1352368 - SURFACE
    )
    :vars
    (
      ?auto_1352375 - HOIST
      ?auto_1352373 - PLACE
      ?auto_1352370 - SURFACE
      ?auto_1352369 - PLACE
      ?auto_1352371 - HOIST
      ?auto_1352374 - SURFACE
      ?auto_1352372 - TRUCK
      ?auto_1352376 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352375 ?auto_1352373 ) ( IS-CRATE ?auto_1352368 ) ( not ( = ?auto_1352367 ?auto_1352368 ) ) ( not ( = ?auto_1352370 ?auto_1352367 ) ) ( not ( = ?auto_1352370 ?auto_1352368 ) ) ( not ( = ?auto_1352369 ?auto_1352373 ) ) ( HOIST-AT ?auto_1352371 ?auto_1352369 ) ( not ( = ?auto_1352375 ?auto_1352371 ) ) ( SURFACE-AT ?auto_1352368 ?auto_1352369 ) ( ON ?auto_1352368 ?auto_1352374 ) ( CLEAR ?auto_1352368 ) ( not ( = ?auto_1352367 ?auto_1352374 ) ) ( not ( = ?auto_1352368 ?auto_1352374 ) ) ( not ( = ?auto_1352370 ?auto_1352374 ) ) ( SURFACE-AT ?auto_1352370 ?auto_1352373 ) ( CLEAR ?auto_1352370 ) ( IS-CRATE ?auto_1352367 ) ( AVAILABLE ?auto_1352375 ) ( TRUCK-AT ?auto_1352372 ?auto_1352369 ) ( AVAILABLE ?auto_1352371 ) ( SURFACE-AT ?auto_1352367 ?auto_1352369 ) ( ON ?auto_1352367 ?auto_1352376 ) ( CLEAR ?auto_1352367 ) ( not ( = ?auto_1352367 ?auto_1352376 ) ) ( not ( = ?auto_1352368 ?auto_1352376 ) ) ( not ( = ?auto_1352370 ?auto_1352376 ) ) ( not ( = ?auto_1352374 ?auto_1352376 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1352371 ?auto_1352367 ?auto_1352376 ?auto_1352369 )
      ( MAKE-2CRATE ?auto_1352370 ?auto_1352367 ?auto_1352368 )
      ( MAKE-1CRATE-VERIFY ?auto_1352367 ?auto_1352368 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1352377 - SURFACE
      ?auto_1352378 - SURFACE
      ?auto_1352379 - SURFACE
    )
    :vars
    (
      ?auto_1352385 - HOIST
      ?auto_1352382 - PLACE
      ?auto_1352383 - PLACE
      ?auto_1352384 - HOIST
      ?auto_1352386 - SURFACE
      ?auto_1352380 - TRUCK
      ?auto_1352381 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352385 ?auto_1352382 ) ( IS-CRATE ?auto_1352379 ) ( not ( = ?auto_1352378 ?auto_1352379 ) ) ( not ( = ?auto_1352377 ?auto_1352378 ) ) ( not ( = ?auto_1352377 ?auto_1352379 ) ) ( not ( = ?auto_1352383 ?auto_1352382 ) ) ( HOIST-AT ?auto_1352384 ?auto_1352383 ) ( not ( = ?auto_1352385 ?auto_1352384 ) ) ( SURFACE-AT ?auto_1352379 ?auto_1352383 ) ( ON ?auto_1352379 ?auto_1352386 ) ( CLEAR ?auto_1352379 ) ( not ( = ?auto_1352378 ?auto_1352386 ) ) ( not ( = ?auto_1352379 ?auto_1352386 ) ) ( not ( = ?auto_1352377 ?auto_1352386 ) ) ( SURFACE-AT ?auto_1352377 ?auto_1352382 ) ( CLEAR ?auto_1352377 ) ( IS-CRATE ?auto_1352378 ) ( AVAILABLE ?auto_1352385 ) ( TRUCK-AT ?auto_1352380 ?auto_1352383 ) ( AVAILABLE ?auto_1352384 ) ( SURFACE-AT ?auto_1352378 ?auto_1352383 ) ( ON ?auto_1352378 ?auto_1352381 ) ( CLEAR ?auto_1352378 ) ( not ( = ?auto_1352378 ?auto_1352381 ) ) ( not ( = ?auto_1352379 ?auto_1352381 ) ) ( not ( = ?auto_1352377 ?auto_1352381 ) ) ( not ( = ?auto_1352386 ?auto_1352381 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1352378 ?auto_1352379 )
      ( MAKE-2CRATE-VERIFY ?auto_1352377 ?auto_1352378 ?auto_1352379 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1352387 - SURFACE
      ?auto_1352388 - SURFACE
      ?auto_1352389 - SURFACE
      ?auto_1352390 - SURFACE
    )
    :vars
    (
      ?auto_1352394 - HOIST
      ?auto_1352397 - PLACE
      ?auto_1352396 - PLACE
      ?auto_1352395 - HOIST
      ?auto_1352391 - SURFACE
      ?auto_1352393 - TRUCK
      ?auto_1352392 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352394 ?auto_1352397 ) ( IS-CRATE ?auto_1352390 ) ( not ( = ?auto_1352389 ?auto_1352390 ) ) ( not ( = ?auto_1352388 ?auto_1352389 ) ) ( not ( = ?auto_1352388 ?auto_1352390 ) ) ( not ( = ?auto_1352396 ?auto_1352397 ) ) ( HOIST-AT ?auto_1352395 ?auto_1352396 ) ( not ( = ?auto_1352394 ?auto_1352395 ) ) ( SURFACE-AT ?auto_1352390 ?auto_1352396 ) ( ON ?auto_1352390 ?auto_1352391 ) ( CLEAR ?auto_1352390 ) ( not ( = ?auto_1352389 ?auto_1352391 ) ) ( not ( = ?auto_1352390 ?auto_1352391 ) ) ( not ( = ?auto_1352388 ?auto_1352391 ) ) ( SURFACE-AT ?auto_1352388 ?auto_1352397 ) ( CLEAR ?auto_1352388 ) ( IS-CRATE ?auto_1352389 ) ( AVAILABLE ?auto_1352394 ) ( TRUCK-AT ?auto_1352393 ?auto_1352396 ) ( AVAILABLE ?auto_1352395 ) ( SURFACE-AT ?auto_1352389 ?auto_1352396 ) ( ON ?auto_1352389 ?auto_1352392 ) ( CLEAR ?auto_1352389 ) ( not ( = ?auto_1352389 ?auto_1352392 ) ) ( not ( = ?auto_1352390 ?auto_1352392 ) ) ( not ( = ?auto_1352388 ?auto_1352392 ) ) ( not ( = ?auto_1352391 ?auto_1352392 ) ) ( ON ?auto_1352388 ?auto_1352387 ) ( not ( = ?auto_1352387 ?auto_1352388 ) ) ( not ( = ?auto_1352387 ?auto_1352389 ) ) ( not ( = ?auto_1352387 ?auto_1352390 ) ) ( not ( = ?auto_1352387 ?auto_1352391 ) ) ( not ( = ?auto_1352387 ?auto_1352392 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352388 ?auto_1352389 ?auto_1352390 )
      ( MAKE-3CRATE-VERIFY ?auto_1352387 ?auto_1352388 ?auto_1352389 ?auto_1352390 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1352398 - SURFACE
      ?auto_1352399 - SURFACE
      ?auto_1352400 - SURFACE
      ?auto_1352402 - SURFACE
      ?auto_1352401 - SURFACE
    )
    :vars
    (
      ?auto_1352406 - HOIST
      ?auto_1352409 - PLACE
      ?auto_1352408 - PLACE
      ?auto_1352407 - HOIST
      ?auto_1352403 - SURFACE
      ?auto_1352405 - TRUCK
      ?auto_1352404 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352406 ?auto_1352409 ) ( IS-CRATE ?auto_1352401 ) ( not ( = ?auto_1352402 ?auto_1352401 ) ) ( not ( = ?auto_1352400 ?auto_1352402 ) ) ( not ( = ?auto_1352400 ?auto_1352401 ) ) ( not ( = ?auto_1352408 ?auto_1352409 ) ) ( HOIST-AT ?auto_1352407 ?auto_1352408 ) ( not ( = ?auto_1352406 ?auto_1352407 ) ) ( SURFACE-AT ?auto_1352401 ?auto_1352408 ) ( ON ?auto_1352401 ?auto_1352403 ) ( CLEAR ?auto_1352401 ) ( not ( = ?auto_1352402 ?auto_1352403 ) ) ( not ( = ?auto_1352401 ?auto_1352403 ) ) ( not ( = ?auto_1352400 ?auto_1352403 ) ) ( SURFACE-AT ?auto_1352400 ?auto_1352409 ) ( CLEAR ?auto_1352400 ) ( IS-CRATE ?auto_1352402 ) ( AVAILABLE ?auto_1352406 ) ( TRUCK-AT ?auto_1352405 ?auto_1352408 ) ( AVAILABLE ?auto_1352407 ) ( SURFACE-AT ?auto_1352402 ?auto_1352408 ) ( ON ?auto_1352402 ?auto_1352404 ) ( CLEAR ?auto_1352402 ) ( not ( = ?auto_1352402 ?auto_1352404 ) ) ( not ( = ?auto_1352401 ?auto_1352404 ) ) ( not ( = ?auto_1352400 ?auto_1352404 ) ) ( not ( = ?auto_1352403 ?auto_1352404 ) ) ( ON ?auto_1352399 ?auto_1352398 ) ( ON ?auto_1352400 ?auto_1352399 ) ( not ( = ?auto_1352398 ?auto_1352399 ) ) ( not ( = ?auto_1352398 ?auto_1352400 ) ) ( not ( = ?auto_1352398 ?auto_1352402 ) ) ( not ( = ?auto_1352398 ?auto_1352401 ) ) ( not ( = ?auto_1352398 ?auto_1352403 ) ) ( not ( = ?auto_1352398 ?auto_1352404 ) ) ( not ( = ?auto_1352399 ?auto_1352400 ) ) ( not ( = ?auto_1352399 ?auto_1352402 ) ) ( not ( = ?auto_1352399 ?auto_1352401 ) ) ( not ( = ?auto_1352399 ?auto_1352403 ) ) ( not ( = ?auto_1352399 ?auto_1352404 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352400 ?auto_1352402 ?auto_1352401 )
      ( MAKE-4CRATE-VERIFY ?auto_1352398 ?auto_1352399 ?auto_1352400 ?auto_1352402 ?auto_1352401 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1352410 - SURFACE
      ?auto_1352411 - SURFACE
      ?auto_1352412 - SURFACE
      ?auto_1352414 - SURFACE
      ?auto_1352413 - SURFACE
      ?auto_1352415 - SURFACE
    )
    :vars
    (
      ?auto_1352419 - HOIST
      ?auto_1352422 - PLACE
      ?auto_1352421 - PLACE
      ?auto_1352420 - HOIST
      ?auto_1352416 - SURFACE
      ?auto_1352418 - TRUCK
      ?auto_1352417 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352419 ?auto_1352422 ) ( IS-CRATE ?auto_1352415 ) ( not ( = ?auto_1352413 ?auto_1352415 ) ) ( not ( = ?auto_1352414 ?auto_1352413 ) ) ( not ( = ?auto_1352414 ?auto_1352415 ) ) ( not ( = ?auto_1352421 ?auto_1352422 ) ) ( HOIST-AT ?auto_1352420 ?auto_1352421 ) ( not ( = ?auto_1352419 ?auto_1352420 ) ) ( SURFACE-AT ?auto_1352415 ?auto_1352421 ) ( ON ?auto_1352415 ?auto_1352416 ) ( CLEAR ?auto_1352415 ) ( not ( = ?auto_1352413 ?auto_1352416 ) ) ( not ( = ?auto_1352415 ?auto_1352416 ) ) ( not ( = ?auto_1352414 ?auto_1352416 ) ) ( SURFACE-AT ?auto_1352414 ?auto_1352422 ) ( CLEAR ?auto_1352414 ) ( IS-CRATE ?auto_1352413 ) ( AVAILABLE ?auto_1352419 ) ( TRUCK-AT ?auto_1352418 ?auto_1352421 ) ( AVAILABLE ?auto_1352420 ) ( SURFACE-AT ?auto_1352413 ?auto_1352421 ) ( ON ?auto_1352413 ?auto_1352417 ) ( CLEAR ?auto_1352413 ) ( not ( = ?auto_1352413 ?auto_1352417 ) ) ( not ( = ?auto_1352415 ?auto_1352417 ) ) ( not ( = ?auto_1352414 ?auto_1352417 ) ) ( not ( = ?auto_1352416 ?auto_1352417 ) ) ( ON ?auto_1352411 ?auto_1352410 ) ( ON ?auto_1352412 ?auto_1352411 ) ( ON ?auto_1352414 ?auto_1352412 ) ( not ( = ?auto_1352410 ?auto_1352411 ) ) ( not ( = ?auto_1352410 ?auto_1352412 ) ) ( not ( = ?auto_1352410 ?auto_1352414 ) ) ( not ( = ?auto_1352410 ?auto_1352413 ) ) ( not ( = ?auto_1352410 ?auto_1352415 ) ) ( not ( = ?auto_1352410 ?auto_1352416 ) ) ( not ( = ?auto_1352410 ?auto_1352417 ) ) ( not ( = ?auto_1352411 ?auto_1352412 ) ) ( not ( = ?auto_1352411 ?auto_1352414 ) ) ( not ( = ?auto_1352411 ?auto_1352413 ) ) ( not ( = ?auto_1352411 ?auto_1352415 ) ) ( not ( = ?auto_1352411 ?auto_1352416 ) ) ( not ( = ?auto_1352411 ?auto_1352417 ) ) ( not ( = ?auto_1352412 ?auto_1352414 ) ) ( not ( = ?auto_1352412 ?auto_1352413 ) ) ( not ( = ?auto_1352412 ?auto_1352415 ) ) ( not ( = ?auto_1352412 ?auto_1352416 ) ) ( not ( = ?auto_1352412 ?auto_1352417 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352414 ?auto_1352413 ?auto_1352415 )
      ( MAKE-5CRATE-VERIFY ?auto_1352410 ?auto_1352411 ?auto_1352412 ?auto_1352414 ?auto_1352413 ?auto_1352415 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1352423 - SURFACE
      ?auto_1352424 - SURFACE
      ?auto_1352425 - SURFACE
      ?auto_1352427 - SURFACE
      ?auto_1352426 - SURFACE
      ?auto_1352428 - SURFACE
      ?auto_1352429 - SURFACE
    )
    :vars
    (
      ?auto_1352433 - HOIST
      ?auto_1352436 - PLACE
      ?auto_1352435 - PLACE
      ?auto_1352434 - HOIST
      ?auto_1352430 - SURFACE
      ?auto_1352432 - TRUCK
      ?auto_1352431 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352433 ?auto_1352436 ) ( IS-CRATE ?auto_1352429 ) ( not ( = ?auto_1352428 ?auto_1352429 ) ) ( not ( = ?auto_1352426 ?auto_1352428 ) ) ( not ( = ?auto_1352426 ?auto_1352429 ) ) ( not ( = ?auto_1352435 ?auto_1352436 ) ) ( HOIST-AT ?auto_1352434 ?auto_1352435 ) ( not ( = ?auto_1352433 ?auto_1352434 ) ) ( SURFACE-AT ?auto_1352429 ?auto_1352435 ) ( ON ?auto_1352429 ?auto_1352430 ) ( CLEAR ?auto_1352429 ) ( not ( = ?auto_1352428 ?auto_1352430 ) ) ( not ( = ?auto_1352429 ?auto_1352430 ) ) ( not ( = ?auto_1352426 ?auto_1352430 ) ) ( SURFACE-AT ?auto_1352426 ?auto_1352436 ) ( CLEAR ?auto_1352426 ) ( IS-CRATE ?auto_1352428 ) ( AVAILABLE ?auto_1352433 ) ( TRUCK-AT ?auto_1352432 ?auto_1352435 ) ( AVAILABLE ?auto_1352434 ) ( SURFACE-AT ?auto_1352428 ?auto_1352435 ) ( ON ?auto_1352428 ?auto_1352431 ) ( CLEAR ?auto_1352428 ) ( not ( = ?auto_1352428 ?auto_1352431 ) ) ( not ( = ?auto_1352429 ?auto_1352431 ) ) ( not ( = ?auto_1352426 ?auto_1352431 ) ) ( not ( = ?auto_1352430 ?auto_1352431 ) ) ( ON ?auto_1352424 ?auto_1352423 ) ( ON ?auto_1352425 ?auto_1352424 ) ( ON ?auto_1352427 ?auto_1352425 ) ( ON ?auto_1352426 ?auto_1352427 ) ( not ( = ?auto_1352423 ?auto_1352424 ) ) ( not ( = ?auto_1352423 ?auto_1352425 ) ) ( not ( = ?auto_1352423 ?auto_1352427 ) ) ( not ( = ?auto_1352423 ?auto_1352426 ) ) ( not ( = ?auto_1352423 ?auto_1352428 ) ) ( not ( = ?auto_1352423 ?auto_1352429 ) ) ( not ( = ?auto_1352423 ?auto_1352430 ) ) ( not ( = ?auto_1352423 ?auto_1352431 ) ) ( not ( = ?auto_1352424 ?auto_1352425 ) ) ( not ( = ?auto_1352424 ?auto_1352427 ) ) ( not ( = ?auto_1352424 ?auto_1352426 ) ) ( not ( = ?auto_1352424 ?auto_1352428 ) ) ( not ( = ?auto_1352424 ?auto_1352429 ) ) ( not ( = ?auto_1352424 ?auto_1352430 ) ) ( not ( = ?auto_1352424 ?auto_1352431 ) ) ( not ( = ?auto_1352425 ?auto_1352427 ) ) ( not ( = ?auto_1352425 ?auto_1352426 ) ) ( not ( = ?auto_1352425 ?auto_1352428 ) ) ( not ( = ?auto_1352425 ?auto_1352429 ) ) ( not ( = ?auto_1352425 ?auto_1352430 ) ) ( not ( = ?auto_1352425 ?auto_1352431 ) ) ( not ( = ?auto_1352427 ?auto_1352426 ) ) ( not ( = ?auto_1352427 ?auto_1352428 ) ) ( not ( = ?auto_1352427 ?auto_1352429 ) ) ( not ( = ?auto_1352427 ?auto_1352430 ) ) ( not ( = ?auto_1352427 ?auto_1352431 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352426 ?auto_1352428 ?auto_1352429 )
      ( MAKE-6CRATE-VERIFY ?auto_1352423 ?auto_1352424 ?auto_1352425 ?auto_1352427 ?auto_1352426 ?auto_1352428 ?auto_1352429 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1352437 - SURFACE
      ?auto_1352438 - SURFACE
      ?auto_1352439 - SURFACE
      ?auto_1352441 - SURFACE
      ?auto_1352440 - SURFACE
      ?auto_1352442 - SURFACE
      ?auto_1352443 - SURFACE
      ?auto_1352444 - SURFACE
    )
    :vars
    (
      ?auto_1352448 - HOIST
      ?auto_1352451 - PLACE
      ?auto_1352450 - PLACE
      ?auto_1352449 - HOIST
      ?auto_1352445 - SURFACE
      ?auto_1352447 - TRUCK
      ?auto_1352446 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352448 ?auto_1352451 ) ( IS-CRATE ?auto_1352444 ) ( not ( = ?auto_1352443 ?auto_1352444 ) ) ( not ( = ?auto_1352442 ?auto_1352443 ) ) ( not ( = ?auto_1352442 ?auto_1352444 ) ) ( not ( = ?auto_1352450 ?auto_1352451 ) ) ( HOIST-AT ?auto_1352449 ?auto_1352450 ) ( not ( = ?auto_1352448 ?auto_1352449 ) ) ( SURFACE-AT ?auto_1352444 ?auto_1352450 ) ( ON ?auto_1352444 ?auto_1352445 ) ( CLEAR ?auto_1352444 ) ( not ( = ?auto_1352443 ?auto_1352445 ) ) ( not ( = ?auto_1352444 ?auto_1352445 ) ) ( not ( = ?auto_1352442 ?auto_1352445 ) ) ( SURFACE-AT ?auto_1352442 ?auto_1352451 ) ( CLEAR ?auto_1352442 ) ( IS-CRATE ?auto_1352443 ) ( AVAILABLE ?auto_1352448 ) ( TRUCK-AT ?auto_1352447 ?auto_1352450 ) ( AVAILABLE ?auto_1352449 ) ( SURFACE-AT ?auto_1352443 ?auto_1352450 ) ( ON ?auto_1352443 ?auto_1352446 ) ( CLEAR ?auto_1352443 ) ( not ( = ?auto_1352443 ?auto_1352446 ) ) ( not ( = ?auto_1352444 ?auto_1352446 ) ) ( not ( = ?auto_1352442 ?auto_1352446 ) ) ( not ( = ?auto_1352445 ?auto_1352446 ) ) ( ON ?auto_1352438 ?auto_1352437 ) ( ON ?auto_1352439 ?auto_1352438 ) ( ON ?auto_1352441 ?auto_1352439 ) ( ON ?auto_1352440 ?auto_1352441 ) ( ON ?auto_1352442 ?auto_1352440 ) ( not ( = ?auto_1352437 ?auto_1352438 ) ) ( not ( = ?auto_1352437 ?auto_1352439 ) ) ( not ( = ?auto_1352437 ?auto_1352441 ) ) ( not ( = ?auto_1352437 ?auto_1352440 ) ) ( not ( = ?auto_1352437 ?auto_1352442 ) ) ( not ( = ?auto_1352437 ?auto_1352443 ) ) ( not ( = ?auto_1352437 ?auto_1352444 ) ) ( not ( = ?auto_1352437 ?auto_1352445 ) ) ( not ( = ?auto_1352437 ?auto_1352446 ) ) ( not ( = ?auto_1352438 ?auto_1352439 ) ) ( not ( = ?auto_1352438 ?auto_1352441 ) ) ( not ( = ?auto_1352438 ?auto_1352440 ) ) ( not ( = ?auto_1352438 ?auto_1352442 ) ) ( not ( = ?auto_1352438 ?auto_1352443 ) ) ( not ( = ?auto_1352438 ?auto_1352444 ) ) ( not ( = ?auto_1352438 ?auto_1352445 ) ) ( not ( = ?auto_1352438 ?auto_1352446 ) ) ( not ( = ?auto_1352439 ?auto_1352441 ) ) ( not ( = ?auto_1352439 ?auto_1352440 ) ) ( not ( = ?auto_1352439 ?auto_1352442 ) ) ( not ( = ?auto_1352439 ?auto_1352443 ) ) ( not ( = ?auto_1352439 ?auto_1352444 ) ) ( not ( = ?auto_1352439 ?auto_1352445 ) ) ( not ( = ?auto_1352439 ?auto_1352446 ) ) ( not ( = ?auto_1352441 ?auto_1352440 ) ) ( not ( = ?auto_1352441 ?auto_1352442 ) ) ( not ( = ?auto_1352441 ?auto_1352443 ) ) ( not ( = ?auto_1352441 ?auto_1352444 ) ) ( not ( = ?auto_1352441 ?auto_1352445 ) ) ( not ( = ?auto_1352441 ?auto_1352446 ) ) ( not ( = ?auto_1352440 ?auto_1352442 ) ) ( not ( = ?auto_1352440 ?auto_1352443 ) ) ( not ( = ?auto_1352440 ?auto_1352444 ) ) ( not ( = ?auto_1352440 ?auto_1352445 ) ) ( not ( = ?auto_1352440 ?auto_1352446 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352442 ?auto_1352443 ?auto_1352444 )
      ( MAKE-7CRATE-VERIFY ?auto_1352437 ?auto_1352438 ?auto_1352439 ?auto_1352441 ?auto_1352440 ?auto_1352442 ?auto_1352443 ?auto_1352444 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1352452 - SURFACE
      ?auto_1352453 - SURFACE
      ?auto_1352454 - SURFACE
      ?auto_1352456 - SURFACE
      ?auto_1352455 - SURFACE
      ?auto_1352457 - SURFACE
      ?auto_1352458 - SURFACE
      ?auto_1352459 - SURFACE
      ?auto_1352460 - SURFACE
    )
    :vars
    (
      ?auto_1352464 - HOIST
      ?auto_1352467 - PLACE
      ?auto_1352466 - PLACE
      ?auto_1352465 - HOIST
      ?auto_1352461 - SURFACE
      ?auto_1352463 - TRUCK
      ?auto_1352462 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352464 ?auto_1352467 ) ( IS-CRATE ?auto_1352460 ) ( not ( = ?auto_1352459 ?auto_1352460 ) ) ( not ( = ?auto_1352458 ?auto_1352459 ) ) ( not ( = ?auto_1352458 ?auto_1352460 ) ) ( not ( = ?auto_1352466 ?auto_1352467 ) ) ( HOIST-AT ?auto_1352465 ?auto_1352466 ) ( not ( = ?auto_1352464 ?auto_1352465 ) ) ( SURFACE-AT ?auto_1352460 ?auto_1352466 ) ( ON ?auto_1352460 ?auto_1352461 ) ( CLEAR ?auto_1352460 ) ( not ( = ?auto_1352459 ?auto_1352461 ) ) ( not ( = ?auto_1352460 ?auto_1352461 ) ) ( not ( = ?auto_1352458 ?auto_1352461 ) ) ( SURFACE-AT ?auto_1352458 ?auto_1352467 ) ( CLEAR ?auto_1352458 ) ( IS-CRATE ?auto_1352459 ) ( AVAILABLE ?auto_1352464 ) ( TRUCK-AT ?auto_1352463 ?auto_1352466 ) ( AVAILABLE ?auto_1352465 ) ( SURFACE-AT ?auto_1352459 ?auto_1352466 ) ( ON ?auto_1352459 ?auto_1352462 ) ( CLEAR ?auto_1352459 ) ( not ( = ?auto_1352459 ?auto_1352462 ) ) ( not ( = ?auto_1352460 ?auto_1352462 ) ) ( not ( = ?auto_1352458 ?auto_1352462 ) ) ( not ( = ?auto_1352461 ?auto_1352462 ) ) ( ON ?auto_1352453 ?auto_1352452 ) ( ON ?auto_1352454 ?auto_1352453 ) ( ON ?auto_1352456 ?auto_1352454 ) ( ON ?auto_1352455 ?auto_1352456 ) ( ON ?auto_1352457 ?auto_1352455 ) ( ON ?auto_1352458 ?auto_1352457 ) ( not ( = ?auto_1352452 ?auto_1352453 ) ) ( not ( = ?auto_1352452 ?auto_1352454 ) ) ( not ( = ?auto_1352452 ?auto_1352456 ) ) ( not ( = ?auto_1352452 ?auto_1352455 ) ) ( not ( = ?auto_1352452 ?auto_1352457 ) ) ( not ( = ?auto_1352452 ?auto_1352458 ) ) ( not ( = ?auto_1352452 ?auto_1352459 ) ) ( not ( = ?auto_1352452 ?auto_1352460 ) ) ( not ( = ?auto_1352452 ?auto_1352461 ) ) ( not ( = ?auto_1352452 ?auto_1352462 ) ) ( not ( = ?auto_1352453 ?auto_1352454 ) ) ( not ( = ?auto_1352453 ?auto_1352456 ) ) ( not ( = ?auto_1352453 ?auto_1352455 ) ) ( not ( = ?auto_1352453 ?auto_1352457 ) ) ( not ( = ?auto_1352453 ?auto_1352458 ) ) ( not ( = ?auto_1352453 ?auto_1352459 ) ) ( not ( = ?auto_1352453 ?auto_1352460 ) ) ( not ( = ?auto_1352453 ?auto_1352461 ) ) ( not ( = ?auto_1352453 ?auto_1352462 ) ) ( not ( = ?auto_1352454 ?auto_1352456 ) ) ( not ( = ?auto_1352454 ?auto_1352455 ) ) ( not ( = ?auto_1352454 ?auto_1352457 ) ) ( not ( = ?auto_1352454 ?auto_1352458 ) ) ( not ( = ?auto_1352454 ?auto_1352459 ) ) ( not ( = ?auto_1352454 ?auto_1352460 ) ) ( not ( = ?auto_1352454 ?auto_1352461 ) ) ( not ( = ?auto_1352454 ?auto_1352462 ) ) ( not ( = ?auto_1352456 ?auto_1352455 ) ) ( not ( = ?auto_1352456 ?auto_1352457 ) ) ( not ( = ?auto_1352456 ?auto_1352458 ) ) ( not ( = ?auto_1352456 ?auto_1352459 ) ) ( not ( = ?auto_1352456 ?auto_1352460 ) ) ( not ( = ?auto_1352456 ?auto_1352461 ) ) ( not ( = ?auto_1352456 ?auto_1352462 ) ) ( not ( = ?auto_1352455 ?auto_1352457 ) ) ( not ( = ?auto_1352455 ?auto_1352458 ) ) ( not ( = ?auto_1352455 ?auto_1352459 ) ) ( not ( = ?auto_1352455 ?auto_1352460 ) ) ( not ( = ?auto_1352455 ?auto_1352461 ) ) ( not ( = ?auto_1352455 ?auto_1352462 ) ) ( not ( = ?auto_1352457 ?auto_1352458 ) ) ( not ( = ?auto_1352457 ?auto_1352459 ) ) ( not ( = ?auto_1352457 ?auto_1352460 ) ) ( not ( = ?auto_1352457 ?auto_1352461 ) ) ( not ( = ?auto_1352457 ?auto_1352462 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352458 ?auto_1352459 ?auto_1352460 )
      ( MAKE-8CRATE-VERIFY ?auto_1352452 ?auto_1352453 ?auto_1352454 ?auto_1352456 ?auto_1352455 ?auto_1352457 ?auto_1352458 ?auto_1352459 ?auto_1352460 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1352468 - SURFACE
      ?auto_1352469 - SURFACE
    )
    :vars
    (
      ?auto_1352473 - HOIST
      ?auto_1352477 - PLACE
      ?auto_1352476 - SURFACE
      ?auto_1352475 - PLACE
      ?auto_1352474 - HOIST
      ?auto_1352470 - SURFACE
      ?auto_1352471 - SURFACE
      ?auto_1352472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352473 ?auto_1352477 ) ( IS-CRATE ?auto_1352469 ) ( not ( = ?auto_1352468 ?auto_1352469 ) ) ( not ( = ?auto_1352476 ?auto_1352468 ) ) ( not ( = ?auto_1352476 ?auto_1352469 ) ) ( not ( = ?auto_1352475 ?auto_1352477 ) ) ( HOIST-AT ?auto_1352474 ?auto_1352475 ) ( not ( = ?auto_1352473 ?auto_1352474 ) ) ( SURFACE-AT ?auto_1352469 ?auto_1352475 ) ( ON ?auto_1352469 ?auto_1352470 ) ( CLEAR ?auto_1352469 ) ( not ( = ?auto_1352468 ?auto_1352470 ) ) ( not ( = ?auto_1352469 ?auto_1352470 ) ) ( not ( = ?auto_1352476 ?auto_1352470 ) ) ( SURFACE-AT ?auto_1352476 ?auto_1352477 ) ( CLEAR ?auto_1352476 ) ( IS-CRATE ?auto_1352468 ) ( AVAILABLE ?auto_1352473 ) ( AVAILABLE ?auto_1352474 ) ( SURFACE-AT ?auto_1352468 ?auto_1352475 ) ( ON ?auto_1352468 ?auto_1352471 ) ( CLEAR ?auto_1352468 ) ( not ( = ?auto_1352468 ?auto_1352471 ) ) ( not ( = ?auto_1352469 ?auto_1352471 ) ) ( not ( = ?auto_1352476 ?auto_1352471 ) ) ( not ( = ?auto_1352470 ?auto_1352471 ) ) ( TRUCK-AT ?auto_1352472 ?auto_1352477 ) )
    :subtasks
    ( ( !DRIVE ?auto_1352472 ?auto_1352477 ?auto_1352475 )
      ( MAKE-2CRATE ?auto_1352476 ?auto_1352468 ?auto_1352469 )
      ( MAKE-1CRATE-VERIFY ?auto_1352468 ?auto_1352469 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1352478 - SURFACE
      ?auto_1352479 - SURFACE
      ?auto_1352480 - SURFACE
    )
    :vars
    (
      ?auto_1352481 - HOIST
      ?auto_1352483 - PLACE
      ?auto_1352485 - PLACE
      ?auto_1352484 - HOIST
      ?auto_1352486 - SURFACE
      ?auto_1352487 - SURFACE
      ?auto_1352482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352481 ?auto_1352483 ) ( IS-CRATE ?auto_1352480 ) ( not ( = ?auto_1352479 ?auto_1352480 ) ) ( not ( = ?auto_1352478 ?auto_1352479 ) ) ( not ( = ?auto_1352478 ?auto_1352480 ) ) ( not ( = ?auto_1352485 ?auto_1352483 ) ) ( HOIST-AT ?auto_1352484 ?auto_1352485 ) ( not ( = ?auto_1352481 ?auto_1352484 ) ) ( SURFACE-AT ?auto_1352480 ?auto_1352485 ) ( ON ?auto_1352480 ?auto_1352486 ) ( CLEAR ?auto_1352480 ) ( not ( = ?auto_1352479 ?auto_1352486 ) ) ( not ( = ?auto_1352480 ?auto_1352486 ) ) ( not ( = ?auto_1352478 ?auto_1352486 ) ) ( SURFACE-AT ?auto_1352478 ?auto_1352483 ) ( CLEAR ?auto_1352478 ) ( IS-CRATE ?auto_1352479 ) ( AVAILABLE ?auto_1352481 ) ( AVAILABLE ?auto_1352484 ) ( SURFACE-AT ?auto_1352479 ?auto_1352485 ) ( ON ?auto_1352479 ?auto_1352487 ) ( CLEAR ?auto_1352479 ) ( not ( = ?auto_1352479 ?auto_1352487 ) ) ( not ( = ?auto_1352480 ?auto_1352487 ) ) ( not ( = ?auto_1352478 ?auto_1352487 ) ) ( not ( = ?auto_1352486 ?auto_1352487 ) ) ( TRUCK-AT ?auto_1352482 ?auto_1352483 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1352479 ?auto_1352480 )
      ( MAKE-2CRATE-VERIFY ?auto_1352478 ?auto_1352479 ?auto_1352480 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1352488 - SURFACE
      ?auto_1352489 - SURFACE
      ?auto_1352490 - SURFACE
      ?auto_1352491 - SURFACE
    )
    :vars
    (
      ?auto_1352492 - HOIST
      ?auto_1352494 - PLACE
      ?auto_1352495 - PLACE
      ?auto_1352497 - HOIST
      ?auto_1352498 - SURFACE
      ?auto_1352493 - SURFACE
      ?auto_1352496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352492 ?auto_1352494 ) ( IS-CRATE ?auto_1352491 ) ( not ( = ?auto_1352490 ?auto_1352491 ) ) ( not ( = ?auto_1352489 ?auto_1352490 ) ) ( not ( = ?auto_1352489 ?auto_1352491 ) ) ( not ( = ?auto_1352495 ?auto_1352494 ) ) ( HOIST-AT ?auto_1352497 ?auto_1352495 ) ( not ( = ?auto_1352492 ?auto_1352497 ) ) ( SURFACE-AT ?auto_1352491 ?auto_1352495 ) ( ON ?auto_1352491 ?auto_1352498 ) ( CLEAR ?auto_1352491 ) ( not ( = ?auto_1352490 ?auto_1352498 ) ) ( not ( = ?auto_1352491 ?auto_1352498 ) ) ( not ( = ?auto_1352489 ?auto_1352498 ) ) ( SURFACE-AT ?auto_1352489 ?auto_1352494 ) ( CLEAR ?auto_1352489 ) ( IS-CRATE ?auto_1352490 ) ( AVAILABLE ?auto_1352492 ) ( AVAILABLE ?auto_1352497 ) ( SURFACE-AT ?auto_1352490 ?auto_1352495 ) ( ON ?auto_1352490 ?auto_1352493 ) ( CLEAR ?auto_1352490 ) ( not ( = ?auto_1352490 ?auto_1352493 ) ) ( not ( = ?auto_1352491 ?auto_1352493 ) ) ( not ( = ?auto_1352489 ?auto_1352493 ) ) ( not ( = ?auto_1352498 ?auto_1352493 ) ) ( TRUCK-AT ?auto_1352496 ?auto_1352494 ) ( ON ?auto_1352489 ?auto_1352488 ) ( not ( = ?auto_1352488 ?auto_1352489 ) ) ( not ( = ?auto_1352488 ?auto_1352490 ) ) ( not ( = ?auto_1352488 ?auto_1352491 ) ) ( not ( = ?auto_1352488 ?auto_1352498 ) ) ( not ( = ?auto_1352488 ?auto_1352493 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352489 ?auto_1352490 ?auto_1352491 )
      ( MAKE-3CRATE-VERIFY ?auto_1352488 ?auto_1352489 ?auto_1352490 ?auto_1352491 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1352499 - SURFACE
      ?auto_1352500 - SURFACE
      ?auto_1352501 - SURFACE
      ?auto_1352503 - SURFACE
      ?auto_1352502 - SURFACE
    )
    :vars
    (
      ?auto_1352504 - HOIST
      ?auto_1352506 - PLACE
      ?auto_1352507 - PLACE
      ?auto_1352509 - HOIST
      ?auto_1352510 - SURFACE
      ?auto_1352505 - SURFACE
      ?auto_1352508 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352504 ?auto_1352506 ) ( IS-CRATE ?auto_1352502 ) ( not ( = ?auto_1352503 ?auto_1352502 ) ) ( not ( = ?auto_1352501 ?auto_1352503 ) ) ( not ( = ?auto_1352501 ?auto_1352502 ) ) ( not ( = ?auto_1352507 ?auto_1352506 ) ) ( HOIST-AT ?auto_1352509 ?auto_1352507 ) ( not ( = ?auto_1352504 ?auto_1352509 ) ) ( SURFACE-AT ?auto_1352502 ?auto_1352507 ) ( ON ?auto_1352502 ?auto_1352510 ) ( CLEAR ?auto_1352502 ) ( not ( = ?auto_1352503 ?auto_1352510 ) ) ( not ( = ?auto_1352502 ?auto_1352510 ) ) ( not ( = ?auto_1352501 ?auto_1352510 ) ) ( SURFACE-AT ?auto_1352501 ?auto_1352506 ) ( CLEAR ?auto_1352501 ) ( IS-CRATE ?auto_1352503 ) ( AVAILABLE ?auto_1352504 ) ( AVAILABLE ?auto_1352509 ) ( SURFACE-AT ?auto_1352503 ?auto_1352507 ) ( ON ?auto_1352503 ?auto_1352505 ) ( CLEAR ?auto_1352503 ) ( not ( = ?auto_1352503 ?auto_1352505 ) ) ( not ( = ?auto_1352502 ?auto_1352505 ) ) ( not ( = ?auto_1352501 ?auto_1352505 ) ) ( not ( = ?auto_1352510 ?auto_1352505 ) ) ( TRUCK-AT ?auto_1352508 ?auto_1352506 ) ( ON ?auto_1352500 ?auto_1352499 ) ( ON ?auto_1352501 ?auto_1352500 ) ( not ( = ?auto_1352499 ?auto_1352500 ) ) ( not ( = ?auto_1352499 ?auto_1352501 ) ) ( not ( = ?auto_1352499 ?auto_1352503 ) ) ( not ( = ?auto_1352499 ?auto_1352502 ) ) ( not ( = ?auto_1352499 ?auto_1352510 ) ) ( not ( = ?auto_1352499 ?auto_1352505 ) ) ( not ( = ?auto_1352500 ?auto_1352501 ) ) ( not ( = ?auto_1352500 ?auto_1352503 ) ) ( not ( = ?auto_1352500 ?auto_1352502 ) ) ( not ( = ?auto_1352500 ?auto_1352510 ) ) ( not ( = ?auto_1352500 ?auto_1352505 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352501 ?auto_1352503 ?auto_1352502 )
      ( MAKE-4CRATE-VERIFY ?auto_1352499 ?auto_1352500 ?auto_1352501 ?auto_1352503 ?auto_1352502 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1352511 - SURFACE
      ?auto_1352512 - SURFACE
      ?auto_1352513 - SURFACE
      ?auto_1352515 - SURFACE
      ?auto_1352514 - SURFACE
      ?auto_1352516 - SURFACE
    )
    :vars
    (
      ?auto_1352517 - HOIST
      ?auto_1352519 - PLACE
      ?auto_1352520 - PLACE
      ?auto_1352522 - HOIST
      ?auto_1352523 - SURFACE
      ?auto_1352518 - SURFACE
      ?auto_1352521 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352517 ?auto_1352519 ) ( IS-CRATE ?auto_1352516 ) ( not ( = ?auto_1352514 ?auto_1352516 ) ) ( not ( = ?auto_1352515 ?auto_1352514 ) ) ( not ( = ?auto_1352515 ?auto_1352516 ) ) ( not ( = ?auto_1352520 ?auto_1352519 ) ) ( HOIST-AT ?auto_1352522 ?auto_1352520 ) ( not ( = ?auto_1352517 ?auto_1352522 ) ) ( SURFACE-AT ?auto_1352516 ?auto_1352520 ) ( ON ?auto_1352516 ?auto_1352523 ) ( CLEAR ?auto_1352516 ) ( not ( = ?auto_1352514 ?auto_1352523 ) ) ( not ( = ?auto_1352516 ?auto_1352523 ) ) ( not ( = ?auto_1352515 ?auto_1352523 ) ) ( SURFACE-AT ?auto_1352515 ?auto_1352519 ) ( CLEAR ?auto_1352515 ) ( IS-CRATE ?auto_1352514 ) ( AVAILABLE ?auto_1352517 ) ( AVAILABLE ?auto_1352522 ) ( SURFACE-AT ?auto_1352514 ?auto_1352520 ) ( ON ?auto_1352514 ?auto_1352518 ) ( CLEAR ?auto_1352514 ) ( not ( = ?auto_1352514 ?auto_1352518 ) ) ( not ( = ?auto_1352516 ?auto_1352518 ) ) ( not ( = ?auto_1352515 ?auto_1352518 ) ) ( not ( = ?auto_1352523 ?auto_1352518 ) ) ( TRUCK-AT ?auto_1352521 ?auto_1352519 ) ( ON ?auto_1352512 ?auto_1352511 ) ( ON ?auto_1352513 ?auto_1352512 ) ( ON ?auto_1352515 ?auto_1352513 ) ( not ( = ?auto_1352511 ?auto_1352512 ) ) ( not ( = ?auto_1352511 ?auto_1352513 ) ) ( not ( = ?auto_1352511 ?auto_1352515 ) ) ( not ( = ?auto_1352511 ?auto_1352514 ) ) ( not ( = ?auto_1352511 ?auto_1352516 ) ) ( not ( = ?auto_1352511 ?auto_1352523 ) ) ( not ( = ?auto_1352511 ?auto_1352518 ) ) ( not ( = ?auto_1352512 ?auto_1352513 ) ) ( not ( = ?auto_1352512 ?auto_1352515 ) ) ( not ( = ?auto_1352512 ?auto_1352514 ) ) ( not ( = ?auto_1352512 ?auto_1352516 ) ) ( not ( = ?auto_1352512 ?auto_1352523 ) ) ( not ( = ?auto_1352512 ?auto_1352518 ) ) ( not ( = ?auto_1352513 ?auto_1352515 ) ) ( not ( = ?auto_1352513 ?auto_1352514 ) ) ( not ( = ?auto_1352513 ?auto_1352516 ) ) ( not ( = ?auto_1352513 ?auto_1352523 ) ) ( not ( = ?auto_1352513 ?auto_1352518 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352515 ?auto_1352514 ?auto_1352516 )
      ( MAKE-5CRATE-VERIFY ?auto_1352511 ?auto_1352512 ?auto_1352513 ?auto_1352515 ?auto_1352514 ?auto_1352516 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1352524 - SURFACE
      ?auto_1352525 - SURFACE
      ?auto_1352526 - SURFACE
      ?auto_1352528 - SURFACE
      ?auto_1352527 - SURFACE
      ?auto_1352529 - SURFACE
      ?auto_1352530 - SURFACE
    )
    :vars
    (
      ?auto_1352531 - HOIST
      ?auto_1352533 - PLACE
      ?auto_1352534 - PLACE
      ?auto_1352536 - HOIST
      ?auto_1352537 - SURFACE
      ?auto_1352532 - SURFACE
      ?auto_1352535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352531 ?auto_1352533 ) ( IS-CRATE ?auto_1352530 ) ( not ( = ?auto_1352529 ?auto_1352530 ) ) ( not ( = ?auto_1352527 ?auto_1352529 ) ) ( not ( = ?auto_1352527 ?auto_1352530 ) ) ( not ( = ?auto_1352534 ?auto_1352533 ) ) ( HOIST-AT ?auto_1352536 ?auto_1352534 ) ( not ( = ?auto_1352531 ?auto_1352536 ) ) ( SURFACE-AT ?auto_1352530 ?auto_1352534 ) ( ON ?auto_1352530 ?auto_1352537 ) ( CLEAR ?auto_1352530 ) ( not ( = ?auto_1352529 ?auto_1352537 ) ) ( not ( = ?auto_1352530 ?auto_1352537 ) ) ( not ( = ?auto_1352527 ?auto_1352537 ) ) ( SURFACE-AT ?auto_1352527 ?auto_1352533 ) ( CLEAR ?auto_1352527 ) ( IS-CRATE ?auto_1352529 ) ( AVAILABLE ?auto_1352531 ) ( AVAILABLE ?auto_1352536 ) ( SURFACE-AT ?auto_1352529 ?auto_1352534 ) ( ON ?auto_1352529 ?auto_1352532 ) ( CLEAR ?auto_1352529 ) ( not ( = ?auto_1352529 ?auto_1352532 ) ) ( not ( = ?auto_1352530 ?auto_1352532 ) ) ( not ( = ?auto_1352527 ?auto_1352532 ) ) ( not ( = ?auto_1352537 ?auto_1352532 ) ) ( TRUCK-AT ?auto_1352535 ?auto_1352533 ) ( ON ?auto_1352525 ?auto_1352524 ) ( ON ?auto_1352526 ?auto_1352525 ) ( ON ?auto_1352528 ?auto_1352526 ) ( ON ?auto_1352527 ?auto_1352528 ) ( not ( = ?auto_1352524 ?auto_1352525 ) ) ( not ( = ?auto_1352524 ?auto_1352526 ) ) ( not ( = ?auto_1352524 ?auto_1352528 ) ) ( not ( = ?auto_1352524 ?auto_1352527 ) ) ( not ( = ?auto_1352524 ?auto_1352529 ) ) ( not ( = ?auto_1352524 ?auto_1352530 ) ) ( not ( = ?auto_1352524 ?auto_1352537 ) ) ( not ( = ?auto_1352524 ?auto_1352532 ) ) ( not ( = ?auto_1352525 ?auto_1352526 ) ) ( not ( = ?auto_1352525 ?auto_1352528 ) ) ( not ( = ?auto_1352525 ?auto_1352527 ) ) ( not ( = ?auto_1352525 ?auto_1352529 ) ) ( not ( = ?auto_1352525 ?auto_1352530 ) ) ( not ( = ?auto_1352525 ?auto_1352537 ) ) ( not ( = ?auto_1352525 ?auto_1352532 ) ) ( not ( = ?auto_1352526 ?auto_1352528 ) ) ( not ( = ?auto_1352526 ?auto_1352527 ) ) ( not ( = ?auto_1352526 ?auto_1352529 ) ) ( not ( = ?auto_1352526 ?auto_1352530 ) ) ( not ( = ?auto_1352526 ?auto_1352537 ) ) ( not ( = ?auto_1352526 ?auto_1352532 ) ) ( not ( = ?auto_1352528 ?auto_1352527 ) ) ( not ( = ?auto_1352528 ?auto_1352529 ) ) ( not ( = ?auto_1352528 ?auto_1352530 ) ) ( not ( = ?auto_1352528 ?auto_1352537 ) ) ( not ( = ?auto_1352528 ?auto_1352532 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352527 ?auto_1352529 ?auto_1352530 )
      ( MAKE-6CRATE-VERIFY ?auto_1352524 ?auto_1352525 ?auto_1352526 ?auto_1352528 ?auto_1352527 ?auto_1352529 ?auto_1352530 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1352538 - SURFACE
      ?auto_1352539 - SURFACE
      ?auto_1352540 - SURFACE
      ?auto_1352542 - SURFACE
      ?auto_1352541 - SURFACE
      ?auto_1352543 - SURFACE
      ?auto_1352544 - SURFACE
      ?auto_1352545 - SURFACE
    )
    :vars
    (
      ?auto_1352546 - HOIST
      ?auto_1352548 - PLACE
      ?auto_1352549 - PLACE
      ?auto_1352551 - HOIST
      ?auto_1352552 - SURFACE
      ?auto_1352547 - SURFACE
      ?auto_1352550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352546 ?auto_1352548 ) ( IS-CRATE ?auto_1352545 ) ( not ( = ?auto_1352544 ?auto_1352545 ) ) ( not ( = ?auto_1352543 ?auto_1352544 ) ) ( not ( = ?auto_1352543 ?auto_1352545 ) ) ( not ( = ?auto_1352549 ?auto_1352548 ) ) ( HOIST-AT ?auto_1352551 ?auto_1352549 ) ( not ( = ?auto_1352546 ?auto_1352551 ) ) ( SURFACE-AT ?auto_1352545 ?auto_1352549 ) ( ON ?auto_1352545 ?auto_1352552 ) ( CLEAR ?auto_1352545 ) ( not ( = ?auto_1352544 ?auto_1352552 ) ) ( not ( = ?auto_1352545 ?auto_1352552 ) ) ( not ( = ?auto_1352543 ?auto_1352552 ) ) ( SURFACE-AT ?auto_1352543 ?auto_1352548 ) ( CLEAR ?auto_1352543 ) ( IS-CRATE ?auto_1352544 ) ( AVAILABLE ?auto_1352546 ) ( AVAILABLE ?auto_1352551 ) ( SURFACE-AT ?auto_1352544 ?auto_1352549 ) ( ON ?auto_1352544 ?auto_1352547 ) ( CLEAR ?auto_1352544 ) ( not ( = ?auto_1352544 ?auto_1352547 ) ) ( not ( = ?auto_1352545 ?auto_1352547 ) ) ( not ( = ?auto_1352543 ?auto_1352547 ) ) ( not ( = ?auto_1352552 ?auto_1352547 ) ) ( TRUCK-AT ?auto_1352550 ?auto_1352548 ) ( ON ?auto_1352539 ?auto_1352538 ) ( ON ?auto_1352540 ?auto_1352539 ) ( ON ?auto_1352542 ?auto_1352540 ) ( ON ?auto_1352541 ?auto_1352542 ) ( ON ?auto_1352543 ?auto_1352541 ) ( not ( = ?auto_1352538 ?auto_1352539 ) ) ( not ( = ?auto_1352538 ?auto_1352540 ) ) ( not ( = ?auto_1352538 ?auto_1352542 ) ) ( not ( = ?auto_1352538 ?auto_1352541 ) ) ( not ( = ?auto_1352538 ?auto_1352543 ) ) ( not ( = ?auto_1352538 ?auto_1352544 ) ) ( not ( = ?auto_1352538 ?auto_1352545 ) ) ( not ( = ?auto_1352538 ?auto_1352552 ) ) ( not ( = ?auto_1352538 ?auto_1352547 ) ) ( not ( = ?auto_1352539 ?auto_1352540 ) ) ( not ( = ?auto_1352539 ?auto_1352542 ) ) ( not ( = ?auto_1352539 ?auto_1352541 ) ) ( not ( = ?auto_1352539 ?auto_1352543 ) ) ( not ( = ?auto_1352539 ?auto_1352544 ) ) ( not ( = ?auto_1352539 ?auto_1352545 ) ) ( not ( = ?auto_1352539 ?auto_1352552 ) ) ( not ( = ?auto_1352539 ?auto_1352547 ) ) ( not ( = ?auto_1352540 ?auto_1352542 ) ) ( not ( = ?auto_1352540 ?auto_1352541 ) ) ( not ( = ?auto_1352540 ?auto_1352543 ) ) ( not ( = ?auto_1352540 ?auto_1352544 ) ) ( not ( = ?auto_1352540 ?auto_1352545 ) ) ( not ( = ?auto_1352540 ?auto_1352552 ) ) ( not ( = ?auto_1352540 ?auto_1352547 ) ) ( not ( = ?auto_1352542 ?auto_1352541 ) ) ( not ( = ?auto_1352542 ?auto_1352543 ) ) ( not ( = ?auto_1352542 ?auto_1352544 ) ) ( not ( = ?auto_1352542 ?auto_1352545 ) ) ( not ( = ?auto_1352542 ?auto_1352552 ) ) ( not ( = ?auto_1352542 ?auto_1352547 ) ) ( not ( = ?auto_1352541 ?auto_1352543 ) ) ( not ( = ?auto_1352541 ?auto_1352544 ) ) ( not ( = ?auto_1352541 ?auto_1352545 ) ) ( not ( = ?auto_1352541 ?auto_1352552 ) ) ( not ( = ?auto_1352541 ?auto_1352547 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352543 ?auto_1352544 ?auto_1352545 )
      ( MAKE-7CRATE-VERIFY ?auto_1352538 ?auto_1352539 ?auto_1352540 ?auto_1352542 ?auto_1352541 ?auto_1352543 ?auto_1352544 ?auto_1352545 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1352553 - SURFACE
      ?auto_1352554 - SURFACE
      ?auto_1352555 - SURFACE
      ?auto_1352557 - SURFACE
      ?auto_1352556 - SURFACE
      ?auto_1352558 - SURFACE
      ?auto_1352559 - SURFACE
      ?auto_1352560 - SURFACE
      ?auto_1352561 - SURFACE
    )
    :vars
    (
      ?auto_1352562 - HOIST
      ?auto_1352564 - PLACE
      ?auto_1352565 - PLACE
      ?auto_1352567 - HOIST
      ?auto_1352568 - SURFACE
      ?auto_1352563 - SURFACE
      ?auto_1352566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352562 ?auto_1352564 ) ( IS-CRATE ?auto_1352561 ) ( not ( = ?auto_1352560 ?auto_1352561 ) ) ( not ( = ?auto_1352559 ?auto_1352560 ) ) ( not ( = ?auto_1352559 ?auto_1352561 ) ) ( not ( = ?auto_1352565 ?auto_1352564 ) ) ( HOIST-AT ?auto_1352567 ?auto_1352565 ) ( not ( = ?auto_1352562 ?auto_1352567 ) ) ( SURFACE-AT ?auto_1352561 ?auto_1352565 ) ( ON ?auto_1352561 ?auto_1352568 ) ( CLEAR ?auto_1352561 ) ( not ( = ?auto_1352560 ?auto_1352568 ) ) ( not ( = ?auto_1352561 ?auto_1352568 ) ) ( not ( = ?auto_1352559 ?auto_1352568 ) ) ( SURFACE-AT ?auto_1352559 ?auto_1352564 ) ( CLEAR ?auto_1352559 ) ( IS-CRATE ?auto_1352560 ) ( AVAILABLE ?auto_1352562 ) ( AVAILABLE ?auto_1352567 ) ( SURFACE-AT ?auto_1352560 ?auto_1352565 ) ( ON ?auto_1352560 ?auto_1352563 ) ( CLEAR ?auto_1352560 ) ( not ( = ?auto_1352560 ?auto_1352563 ) ) ( not ( = ?auto_1352561 ?auto_1352563 ) ) ( not ( = ?auto_1352559 ?auto_1352563 ) ) ( not ( = ?auto_1352568 ?auto_1352563 ) ) ( TRUCK-AT ?auto_1352566 ?auto_1352564 ) ( ON ?auto_1352554 ?auto_1352553 ) ( ON ?auto_1352555 ?auto_1352554 ) ( ON ?auto_1352557 ?auto_1352555 ) ( ON ?auto_1352556 ?auto_1352557 ) ( ON ?auto_1352558 ?auto_1352556 ) ( ON ?auto_1352559 ?auto_1352558 ) ( not ( = ?auto_1352553 ?auto_1352554 ) ) ( not ( = ?auto_1352553 ?auto_1352555 ) ) ( not ( = ?auto_1352553 ?auto_1352557 ) ) ( not ( = ?auto_1352553 ?auto_1352556 ) ) ( not ( = ?auto_1352553 ?auto_1352558 ) ) ( not ( = ?auto_1352553 ?auto_1352559 ) ) ( not ( = ?auto_1352553 ?auto_1352560 ) ) ( not ( = ?auto_1352553 ?auto_1352561 ) ) ( not ( = ?auto_1352553 ?auto_1352568 ) ) ( not ( = ?auto_1352553 ?auto_1352563 ) ) ( not ( = ?auto_1352554 ?auto_1352555 ) ) ( not ( = ?auto_1352554 ?auto_1352557 ) ) ( not ( = ?auto_1352554 ?auto_1352556 ) ) ( not ( = ?auto_1352554 ?auto_1352558 ) ) ( not ( = ?auto_1352554 ?auto_1352559 ) ) ( not ( = ?auto_1352554 ?auto_1352560 ) ) ( not ( = ?auto_1352554 ?auto_1352561 ) ) ( not ( = ?auto_1352554 ?auto_1352568 ) ) ( not ( = ?auto_1352554 ?auto_1352563 ) ) ( not ( = ?auto_1352555 ?auto_1352557 ) ) ( not ( = ?auto_1352555 ?auto_1352556 ) ) ( not ( = ?auto_1352555 ?auto_1352558 ) ) ( not ( = ?auto_1352555 ?auto_1352559 ) ) ( not ( = ?auto_1352555 ?auto_1352560 ) ) ( not ( = ?auto_1352555 ?auto_1352561 ) ) ( not ( = ?auto_1352555 ?auto_1352568 ) ) ( not ( = ?auto_1352555 ?auto_1352563 ) ) ( not ( = ?auto_1352557 ?auto_1352556 ) ) ( not ( = ?auto_1352557 ?auto_1352558 ) ) ( not ( = ?auto_1352557 ?auto_1352559 ) ) ( not ( = ?auto_1352557 ?auto_1352560 ) ) ( not ( = ?auto_1352557 ?auto_1352561 ) ) ( not ( = ?auto_1352557 ?auto_1352568 ) ) ( not ( = ?auto_1352557 ?auto_1352563 ) ) ( not ( = ?auto_1352556 ?auto_1352558 ) ) ( not ( = ?auto_1352556 ?auto_1352559 ) ) ( not ( = ?auto_1352556 ?auto_1352560 ) ) ( not ( = ?auto_1352556 ?auto_1352561 ) ) ( not ( = ?auto_1352556 ?auto_1352568 ) ) ( not ( = ?auto_1352556 ?auto_1352563 ) ) ( not ( = ?auto_1352558 ?auto_1352559 ) ) ( not ( = ?auto_1352558 ?auto_1352560 ) ) ( not ( = ?auto_1352558 ?auto_1352561 ) ) ( not ( = ?auto_1352558 ?auto_1352568 ) ) ( not ( = ?auto_1352558 ?auto_1352563 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352559 ?auto_1352560 ?auto_1352561 )
      ( MAKE-8CRATE-VERIFY ?auto_1352553 ?auto_1352554 ?auto_1352555 ?auto_1352557 ?auto_1352556 ?auto_1352558 ?auto_1352559 ?auto_1352560 ?auto_1352561 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1352569 - SURFACE
      ?auto_1352570 - SURFACE
    )
    :vars
    (
      ?auto_1352572 - HOIST
      ?auto_1352574 - PLACE
      ?auto_1352571 - SURFACE
      ?auto_1352575 - PLACE
      ?auto_1352577 - HOIST
      ?auto_1352578 - SURFACE
      ?auto_1352573 - SURFACE
      ?auto_1352576 - TRUCK
      ?auto_1352579 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352572 ?auto_1352574 ) ( IS-CRATE ?auto_1352570 ) ( not ( = ?auto_1352569 ?auto_1352570 ) ) ( not ( = ?auto_1352571 ?auto_1352569 ) ) ( not ( = ?auto_1352571 ?auto_1352570 ) ) ( not ( = ?auto_1352575 ?auto_1352574 ) ) ( HOIST-AT ?auto_1352577 ?auto_1352575 ) ( not ( = ?auto_1352572 ?auto_1352577 ) ) ( SURFACE-AT ?auto_1352570 ?auto_1352575 ) ( ON ?auto_1352570 ?auto_1352578 ) ( CLEAR ?auto_1352570 ) ( not ( = ?auto_1352569 ?auto_1352578 ) ) ( not ( = ?auto_1352570 ?auto_1352578 ) ) ( not ( = ?auto_1352571 ?auto_1352578 ) ) ( IS-CRATE ?auto_1352569 ) ( AVAILABLE ?auto_1352577 ) ( SURFACE-AT ?auto_1352569 ?auto_1352575 ) ( ON ?auto_1352569 ?auto_1352573 ) ( CLEAR ?auto_1352569 ) ( not ( = ?auto_1352569 ?auto_1352573 ) ) ( not ( = ?auto_1352570 ?auto_1352573 ) ) ( not ( = ?auto_1352571 ?auto_1352573 ) ) ( not ( = ?auto_1352578 ?auto_1352573 ) ) ( TRUCK-AT ?auto_1352576 ?auto_1352574 ) ( SURFACE-AT ?auto_1352579 ?auto_1352574 ) ( CLEAR ?auto_1352579 ) ( LIFTING ?auto_1352572 ?auto_1352571 ) ( IS-CRATE ?auto_1352571 ) ( not ( = ?auto_1352579 ?auto_1352571 ) ) ( not ( = ?auto_1352569 ?auto_1352579 ) ) ( not ( = ?auto_1352570 ?auto_1352579 ) ) ( not ( = ?auto_1352578 ?auto_1352579 ) ) ( not ( = ?auto_1352573 ?auto_1352579 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1352579 ?auto_1352571 )
      ( MAKE-2CRATE ?auto_1352571 ?auto_1352569 ?auto_1352570 )
      ( MAKE-1CRATE-VERIFY ?auto_1352569 ?auto_1352570 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1352580 - SURFACE
      ?auto_1352581 - SURFACE
      ?auto_1352582 - SURFACE
    )
    :vars
    (
      ?auto_1352583 - HOIST
      ?auto_1352585 - PLACE
      ?auto_1352590 - PLACE
      ?auto_1352586 - HOIST
      ?auto_1352584 - SURFACE
      ?auto_1352588 - SURFACE
      ?auto_1352589 - TRUCK
      ?auto_1352587 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352583 ?auto_1352585 ) ( IS-CRATE ?auto_1352582 ) ( not ( = ?auto_1352581 ?auto_1352582 ) ) ( not ( = ?auto_1352580 ?auto_1352581 ) ) ( not ( = ?auto_1352580 ?auto_1352582 ) ) ( not ( = ?auto_1352590 ?auto_1352585 ) ) ( HOIST-AT ?auto_1352586 ?auto_1352590 ) ( not ( = ?auto_1352583 ?auto_1352586 ) ) ( SURFACE-AT ?auto_1352582 ?auto_1352590 ) ( ON ?auto_1352582 ?auto_1352584 ) ( CLEAR ?auto_1352582 ) ( not ( = ?auto_1352581 ?auto_1352584 ) ) ( not ( = ?auto_1352582 ?auto_1352584 ) ) ( not ( = ?auto_1352580 ?auto_1352584 ) ) ( IS-CRATE ?auto_1352581 ) ( AVAILABLE ?auto_1352586 ) ( SURFACE-AT ?auto_1352581 ?auto_1352590 ) ( ON ?auto_1352581 ?auto_1352588 ) ( CLEAR ?auto_1352581 ) ( not ( = ?auto_1352581 ?auto_1352588 ) ) ( not ( = ?auto_1352582 ?auto_1352588 ) ) ( not ( = ?auto_1352580 ?auto_1352588 ) ) ( not ( = ?auto_1352584 ?auto_1352588 ) ) ( TRUCK-AT ?auto_1352589 ?auto_1352585 ) ( SURFACE-AT ?auto_1352587 ?auto_1352585 ) ( CLEAR ?auto_1352587 ) ( LIFTING ?auto_1352583 ?auto_1352580 ) ( IS-CRATE ?auto_1352580 ) ( not ( = ?auto_1352587 ?auto_1352580 ) ) ( not ( = ?auto_1352581 ?auto_1352587 ) ) ( not ( = ?auto_1352582 ?auto_1352587 ) ) ( not ( = ?auto_1352584 ?auto_1352587 ) ) ( not ( = ?auto_1352588 ?auto_1352587 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1352581 ?auto_1352582 )
      ( MAKE-2CRATE-VERIFY ?auto_1352580 ?auto_1352581 ?auto_1352582 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1352591 - SURFACE
      ?auto_1352592 - SURFACE
      ?auto_1352593 - SURFACE
      ?auto_1352594 - SURFACE
    )
    :vars
    (
      ?auto_1352595 - HOIST
      ?auto_1352598 - PLACE
      ?auto_1352597 - PLACE
      ?auto_1352599 - HOIST
      ?auto_1352596 - SURFACE
      ?auto_1352600 - SURFACE
      ?auto_1352601 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352595 ?auto_1352598 ) ( IS-CRATE ?auto_1352594 ) ( not ( = ?auto_1352593 ?auto_1352594 ) ) ( not ( = ?auto_1352592 ?auto_1352593 ) ) ( not ( = ?auto_1352592 ?auto_1352594 ) ) ( not ( = ?auto_1352597 ?auto_1352598 ) ) ( HOIST-AT ?auto_1352599 ?auto_1352597 ) ( not ( = ?auto_1352595 ?auto_1352599 ) ) ( SURFACE-AT ?auto_1352594 ?auto_1352597 ) ( ON ?auto_1352594 ?auto_1352596 ) ( CLEAR ?auto_1352594 ) ( not ( = ?auto_1352593 ?auto_1352596 ) ) ( not ( = ?auto_1352594 ?auto_1352596 ) ) ( not ( = ?auto_1352592 ?auto_1352596 ) ) ( IS-CRATE ?auto_1352593 ) ( AVAILABLE ?auto_1352599 ) ( SURFACE-AT ?auto_1352593 ?auto_1352597 ) ( ON ?auto_1352593 ?auto_1352600 ) ( CLEAR ?auto_1352593 ) ( not ( = ?auto_1352593 ?auto_1352600 ) ) ( not ( = ?auto_1352594 ?auto_1352600 ) ) ( not ( = ?auto_1352592 ?auto_1352600 ) ) ( not ( = ?auto_1352596 ?auto_1352600 ) ) ( TRUCK-AT ?auto_1352601 ?auto_1352598 ) ( SURFACE-AT ?auto_1352591 ?auto_1352598 ) ( CLEAR ?auto_1352591 ) ( LIFTING ?auto_1352595 ?auto_1352592 ) ( IS-CRATE ?auto_1352592 ) ( not ( = ?auto_1352591 ?auto_1352592 ) ) ( not ( = ?auto_1352593 ?auto_1352591 ) ) ( not ( = ?auto_1352594 ?auto_1352591 ) ) ( not ( = ?auto_1352596 ?auto_1352591 ) ) ( not ( = ?auto_1352600 ?auto_1352591 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352592 ?auto_1352593 ?auto_1352594 )
      ( MAKE-3CRATE-VERIFY ?auto_1352591 ?auto_1352592 ?auto_1352593 ?auto_1352594 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1352602 - SURFACE
      ?auto_1352603 - SURFACE
      ?auto_1352604 - SURFACE
      ?auto_1352606 - SURFACE
      ?auto_1352605 - SURFACE
    )
    :vars
    (
      ?auto_1352607 - HOIST
      ?auto_1352610 - PLACE
      ?auto_1352609 - PLACE
      ?auto_1352611 - HOIST
      ?auto_1352608 - SURFACE
      ?auto_1352612 - SURFACE
      ?auto_1352613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352607 ?auto_1352610 ) ( IS-CRATE ?auto_1352605 ) ( not ( = ?auto_1352606 ?auto_1352605 ) ) ( not ( = ?auto_1352604 ?auto_1352606 ) ) ( not ( = ?auto_1352604 ?auto_1352605 ) ) ( not ( = ?auto_1352609 ?auto_1352610 ) ) ( HOIST-AT ?auto_1352611 ?auto_1352609 ) ( not ( = ?auto_1352607 ?auto_1352611 ) ) ( SURFACE-AT ?auto_1352605 ?auto_1352609 ) ( ON ?auto_1352605 ?auto_1352608 ) ( CLEAR ?auto_1352605 ) ( not ( = ?auto_1352606 ?auto_1352608 ) ) ( not ( = ?auto_1352605 ?auto_1352608 ) ) ( not ( = ?auto_1352604 ?auto_1352608 ) ) ( IS-CRATE ?auto_1352606 ) ( AVAILABLE ?auto_1352611 ) ( SURFACE-AT ?auto_1352606 ?auto_1352609 ) ( ON ?auto_1352606 ?auto_1352612 ) ( CLEAR ?auto_1352606 ) ( not ( = ?auto_1352606 ?auto_1352612 ) ) ( not ( = ?auto_1352605 ?auto_1352612 ) ) ( not ( = ?auto_1352604 ?auto_1352612 ) ) ( not ( = ?auto_1352608 ?auto_1352612 ) ) ( TRUCK-AT ?auto_1352613 ?auto_1352610 ) ( SURFACE-AT ?auto_1352603 ?auto_1352610 ) ( CLEAR ?auto_1352603 ) ( LIFTING ?auto_1352607 ?auto_1352604 ) ( IS-CRATE ?auto_1352604 ) ( not ( = ?auto_1352603 ?auto_1352604 ) ) ( not ( = ?auto_1352606 ?auto_1352603 ) ) ( not ( = ?auto_1352605 ?auto_1352603 ) ) ( not ( = ?auto_1352608 ?auto_1352603 ) ) ( not ( = ?auto_1352612 ?auto_1352603 ) ) ( ON ?auto_1352603 ?auto_1352602 ) ( not ( = ?auto_1352602 ?auto_1352603 ) ) ( not ( = ?auto_1352602 ?auto_1352604 ) ) ( not ( = ?auto_1352602 ?auto_1352606 ) ) ( not ( = ?auto_1352602 ?auto_1352605 ) ) ( not ( = ?auto_1352602 ?auto_1352608 ) ) ( not ( = ?auto_1352602 ?auto_1352612 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352604 ?auto_1352606 ?auto_1352605 )
      ( MAKE-4CRATE-VERIFY ?auto_1352602 ?auto_1352603 ?auto_1352604 ?auto_1352606 ?auto_1352605 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1352614 - SURFACE
      ?auto_1352615 - SURFACE
      ?auto_1352616 - SURFACE
      ?auto_1352618 - SURFACE
      ?auto_1352617 - SURFACE
      ?auto_1352619 - SURFACE
    )
    :vars
    (
      ?auto_1352620 - HOIST
      ?auto_1352623 - PLACE
      ?auto_1352622 - PLACE
      ?auto_1352624 - HOIST
      ?auto_1352621 - SURFACE
      ?auto_1352625 - SURFACE
      ?auto_1352626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352620 ?auto_1352623 ) ( IS-CRATE ?auto_1352619 ) ( not ( = ?auto_1352617 ?auto_1352619 ) ) ( not ( = ?auto_1352618 ?auto_1352617 ) ) ( not ( = ?auto_1352618 ?auto_1352619 ) ) ( not ( = ?auto_1352622 ?auto_1352623 ) ) ( HOIST-AT ?auto_1352624 ?auto_1352622 ) ( not ( = ?auto_1352620 ?auto_1352624 ) ) ( SURFACE-AT ?auto_1352619 ?auto_1352622 ) ( ON ?auto_1352619 ?auto_1352621 ) ( CLEAR ?auto_1352619 ) ( not ( = ?auto_1352617 ?auto_1352621 ) ) ( not ( = ?auto_1352619 ?auto_1352621 ) ) ( not ( = ?auto_1352618 ?auto_1352621 ) ) ( IS-CRATE ?auto_1352617 ) ( AVAILABLE ?auto_1352624 ) ( SURFACE-AT ?auto_1352617 ?auto_1352622 ) ( ON ?auto_1352617 ?auto_1352625 ) ( CLEAR ?auto_1352617 ) ( not ( = ?auto_1352617 ?auto_1352625 ) ) ( not ( = ?auto_1352619 ?auto_1352625 ) ) ( not ( = ?auto_1352618 ?auto_1352625 ) ) ( not ( = ?auto_1352621 ?auto_1352625 ) ) ( TRUCK-AT ?auto_1352626 ?auto_1352623 ) ( SURFACE-AT ?auto_1352616 ?auto_1352623 ) ( CLEAR ?auto_1352616 ) ( LIFTING ?auto_1352620 ?auto_1352618 ) ( IS-CRATE ?auto_1352618 ) ( not ( = ?auto_1352616 ?auto_1352618 ) ) ( not ( = ?auto_1352617 ?auto_1352616 ) ) ( not ( = ?auto_1352619 ?auto_1352616 ) ) ( not ( = ?auto_1352621 ?auto_1352616 ) ) ( not ( = ?auto_1352625 ?auto_1352616 ) ) ( ON ?auto_1352615 ?auto_1352614 ) ( ON ?auto_1352616 ?auto_1352615 ) ( not ( = ?auto_1352614 ?auto_1352615 ) ) ( not ( = ?auto_1352614 ?auto_1352616 ) ) ( not ( = ?auto_1352614 ?auto_1352618 ) ) ( not ( = ?auto_1352614 ?auto_1352617 ) ) ( not ( = ?auto_1352614 ?auto_1352619 ) ) ( not ( = ?auto_1352614 ?auto_1352621 ) ) ( not ( = ?auto_1352614 ?auto_1352625 ) ) ( not ( = ?auto_1352615 ?auto_1352616 ) ) ( not ( = ?auto_1352615 ?auto_1352618 ) ) ( not ( = ?auto_1352615 ?auto_1352617 ) ) ( not ( = ?auto_1352615 ?auto_1352619 ) ) ( not ( = ?auto_1352615 ?auto_1352621 ) ) ( not ( = ?auto_1352615 ?auto_1352625 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352618 ?auto_1352617 ?auto_1352619 )
      ( MAKE-5CRATE-VERIFY ?auto_1352614 ?auto_1352615 ?auto_1352616 ?auto_1352618 ?auto_1352617 ?auto_1352619 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1352627 - SURFACE
      ?auto_1352628 - SURFACE
      ?auto_1352629 - SURFACE
      ?auto_1352631 - SURFACE
      ?auto_1352630 - SURFACE
      ?auto_1352632 - SURFACE
      ?auto_1352633 - SURFACE
    )
    :vars
    (
      ?auto_1352634 - HOIST
      ?auto_1352637 - PLACE
      ?auto_1352636 - PLACE
      ?auto_1352638 - HOIST
      ?auto_1352635 - SURFACE
      ?auto_1352639 - SURFACE
      ?auto_1352640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352634 ?auto_1352637 ) ( IS-CRATE ?auto_1352633 ) ( not ( = ?auto_1352632 ?auto_1352633 ) ) ( not ( = ?auto_1352630 ?auto_1352632 ) ) ( not ( = ?auto_1352630 ?auto_1352633 ) ) ( not ( = ?auto_1352636 ?auto_1352637 ) ) ( HOIST-AT ?auto_1352638 ?auto_1352636 ) ( not ( = ?auto_1352634 ?auto_1352638 ) ) ( SURFACE-AT ?auto_1352633 ?auto_1352636 ) ( ON ?auto_1352633 ?auto_1352635 ) ( CLEAR ?auto_1352633 ) ( not ( = ?auto_1352632 ?auto_1352635 ) ) ( not ( = ?auto_1352633 ?auto_1352635 ) ) ( not ( = ?auto_1352630 ?auto_1352635 ) ) ( IS-CRATE ?auto_1352632 ) ( AVAILABLE ?auto_1352638 ) ( SURFACE-AT ?auto_1352632 ?auto_1352636 ) ( ON ?auto_1352632 ?auto_1352639 ) ( CLEAR ?auto_1352632 ) ( not ( = ?auto_1352632 ?auto_1352639 ) ) ( not ( = ?auto_1352633 ?auto_1352639 ) ) ( not ( = ?auto_1352630 ?auto_1352639 ) ) ( not ( = ?auto_1352635 ?auto_1352639 ) ) ( TRUCK-AT ?auto_1352640 ?auto_1352637 ) ( SURFACE-AT ?auto_1352631 ?auto_1352637 ) ( CLEAR ?auto_1352631 ) ( LIFTING ?auto_1352634 ?auto_1352630 ) ( IS-CRATE ?auto_1352630 ) ( not ( = ?auto_1352631 ?auto_1352630 ) ) ( not ( = ?auto_1352632 ?auto_1352631 ) ) ( not ( = ?auto_1352633 ?auto_1352631 ) ) ( not ( = ?auto_1352635 ?auto_1352631 ) ) ( not ( = ?auto_1352639 ?auto_1352631 ) ) ( ON ?auto_1352628 ?auto_1352627 ) ( ON ?auto_1352629 ?auto_1352628 ) ( ON ?auto_1352631 ?auto_1352629 ) ( not ( = ?auto_1352627 ?auto_1352628 ) ) ( not ( = ?auto_1352627 ?auto_1352629 ) ) ( not ( = ?auto_1352627 ?auto_1352631 ) ) ( not ( = ?auto_1352627 ?auto_1352630 ) ) ( not ( = ?auto_1352627 ?auto_1352632 ) ) ( not ( = ?auto_1352627 ?auto_1352633 ) ) ( not ( = ?auto_1352627 ?auto_1352635 ) ) ( not ( = ?auto_1352627 ?auto_1352639 ) ) ( not ( = ?auto_1352628 ?auto_1352629 ) ) ( not ( = ?auto_1352628 ?auto_1352631 ) ) ( not ( = ?auto_1352628 ?auto_1352630 ) ) ( not ( = ?auto_1352628 ?auto_1352632 ) ) ( not ( = ?auto_1352628 ?auto_1352633 ) ) ( not ( = ?auto_1352628 ?auto_1352635 ) ) ( not ( = ?auto_1352628 ?auto_1352639 ) ) ( not ( = ?auto_1352629 ?auto_1352631 ) ) ( not ( = ?auto_1352629 ?auto_1352630 ) ) ( not ( = ?auto_1352629 ?auto_1352632 ) ) ( not ( = ?auto_1352629 ?auto_1352633 ) ) ( not ( = ?auto_1352629 ?auto_1352635 ) ) ( not ( = ?auto_1352629 ?auto_1352639 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352630 ?auto_1352632 ?auto_1352633 )
      ( MAKE-6CRATE-VERIFY ?auto_1352627 ?auto_1352628 ?auto_1352629 ?auto_1352631 ?auto_1352630 ?auto_1352632 ?auto_1352633 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1352641 - SURFACE
      ?auto_1352642 - SURFACE
      ?auto_1352643 - SURFACE
      ?auto_1352645 - SURFACE
      ?auto_1352644 - SURFACE
      ?auto_1352646 - SURFACE
      ?auto_1352647 - SURFACE
      ?auto_1352648 - SURFACE
    )
    :vars
    (
      ?auto_1352649 - HOIST
      ?auto_1352652 - PLACE
      ?auto_1352651 - PLACE
      ?auto_1352653 - HOIST
      ?auto_1352650 - SURFACE
      ?auto_1352654 - SURFACE
      ?auto_1352655 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352649 ?auto_1352652 ) ( IS-CRATE ?auto_1352648 ) ( not ( = ?auto_1352647 ?auto_1352648 ) ) ( not ( = ?auto_1352646 ?auto_1352647 ) ) ( not ( = ?auto_1352646 ?auto_1352648 ) ) ( not ( = ?auto_1352651 ?auto_1352652 ) ) ( HOIST-AT ?auto_1352653 ?auto_1352651 ) ( not ( = ?auto_1352649 ?auto_1352653 ) ) ( SURFACE-AT ?auto_1352648 ?auto_1352651 ) ( ON ?auto_1352648 ?auto_1352650 ) ( CLEAR ?auto_1352648 ) ( not ( = ?auto_1352647 ?auto_1352650 ) ) ( not ( = ?auto_1352648 ?auto_1352650 ) ) ( not ( = ?auto_1352646 ?auto_1352650 ) ) ( IS-CRATE ?auto_1352647 ) ( AVAILABLE ?auto_1352653 ) ( SURFACE-AT ?auto_1352647 ?auto_1352651 ) ( ON ?auto_1352647 ?auto_1352654 ) ( CLEAR ?auto_1352647 ) ( not ( = ?auto_1352647 ?auto_1352654 ) ) ( not ( = ?auto_1352648 ?auto_1352654 ) ) ( not ( = ?auto_1352646 ?auto_1352654 ) ) ( not ( = ?auto_1352650 ?auto_1352654 ) ) ( TRUCK-AT ?auto_1352655 ?auto_1352652 ) ( SURFACE-AT ?auto_1352644 ?auto_1352652 ) ( CLEAR ?auto_1352644 ) ( LIFTING ?auto_1352649 ?auto_1352646 ) ( IS-CRATE ?auto_1352646 ) ( not ( = ?auto_1352644 ?auto_1352646 ) ) ( not ( = ?auto_1352647 ?auto_1352644 ) ) ( not ( = ?auto_1352648 ?auto_1352644 ) ) ( not ( = ?auto_1352650 ?auto_1352644 ) ) ( not ( = ?auto_1352654 ?auto_1352644 ) ) ( ON ?auto_1352642 ?auto_1352641 ) ( ON ?auto_1352643 ?auto_1352642 ) ( ON ?auto_1352645 ?auto_1352643 ) ( ON ?auto_1352644 ?auto_1352645 ) ( not ( = ?auto_1352641 ?auto_1352642 ) ) ( not ( = ?auto_1352641 ?auto_1352643 ) ) ( not ( = ?auto_1352641 ?auto_1352645 ) ) ( not ( = ?auto_1352641 ?auto_1352644 ) ) ( not ( = ?auto_1352641 ?auto_1352646 ) ) ( not ( = ?auto_1352641 ?auto_1352647 ) ) ( not ( = ?auto_1352641 ?auto_1352648 ) ) ( not ( = ?auto_1352641 ?auto_1352650 ) ) ( not ( = ?auto_1352641 ?auto_1352654 ) ) ( not ( = ?auto_1352642 ?auto_1352643 ) ) ( not ( = ?auto_1352642 ?auto_1352645 ) ) ( not ( = ?auto_1352642 ?auto_1352644 ) ) ( not ( = ?auto_1352642 ?auto_1352646 ) ) ( not ( = ?auto_1352642 ?auto_1352647 ) ) ( not ( = ?auto_1352642 ?auto_1352648 ) ) ( not ( = ?auto_1352642 ?auto_1352650 ) ) ( not ( = ?auto_1352642 ?auto_1352654 ) ) ( not ( = ?auto_1352643 ?auto_1352645 ) ) ( not ( = ?auto_1352643 ?auto_1352644 ) ) ( not ( = ?auto_1352643 ?auto_1352646 ) ) ( not ( = ?auto_1352643 ?auto_1352647 ) ) ( not ( = ?auto_1352643 ?auto_1352648 ) ) ( not ( = ?auto_1352643 ?auto_1352650 ) ) ( not ( = ?auto_1352643 ?auto_1352654 ) ) ( not ( = ?auto_1352645 ?auto_1352644 ) ) ( not ( = ?auto_1352645 ?auto_1352646 ) ) ( not ( = ?auto_1352645 ?auto_1352647 ) ) ( not ( = ?auto_1352645 ?auto_1352648 ) ) ( not ( = ?auto_1352645 ?auto_1352650 ) ) ( not ( = ?auto_1352645 ?auto_1352654 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352646 ?auto_1352647 ?auto_1352648 )
      ( MAKE-7CRATE-VERIFY ?auto_1352641 ?auto_1352642 ?auto_1352643 ?auto_1352645 ?auto_1352644 ?auto_1352646 ?auto_1352647 ?auto_1352648 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1352656 - SURFACE
      ?auto_1352657 - SURFACE
      ?auto_1352658 - SURFACE
      ?auto_1352660 - SURFACE
      ?auto_1352659 - SURFACE
      ?auto_1352661 - SURFACE
      ?auto_1352662 - SURFACE
      ?auto_1352663 - SURFACE
      ?auto_1352664 - SURFACE
    )
    :vars
    (
      ?auto_1352665 - HOIST
      ?auto_1352668 - PLACE
      ?auto_1352667 - PLACE
      ?auto_1352669 - HOIST
      ?auto_1352666 - SURFACE
      ?auto_1352670 - SURFACE
      ?auto_1352671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352665 ?auto_1352668 ) ( IS-CRATE ?auto_1352664 ) ( not ( = ?auto_1352663 ?auto_1352664 ) ) ( not ( = ?auto_1352662 ?auto_1352663 ) ) ( not ( = ?auto_1352662 ?auto_1352664 ) ) ( not ( = ?auto_1352667 ?auto_1352668 ) ) ( HOIST-AT ?auto_1352669 ?auto_1352667 ) ( not ( = ?auto_1352665 ?auto_1352669 ) ) ( SURFACE-AT ?auto_1352664 ?auto_1352667 ) ( ON ?auto_1352664 ?auto_1352666 ) ( CLEAR ?auto_1352664 ) ( not ( = ?auto_1352663 ?auto_1352666 ) ) ( not ( = ?auto_1352664 ?auto_1352666 ) ) ( not ( = ?auto_1352662 ?auto_1352666 ) ) ( IS-CRATE ?auto_1352663 ) ( AVAILABLE ?auto_1352669 ) ( SURFACE-AT ?auto_1352663 ?auto_1352667 ) ( ON ?auto_1352663 ?auto_1352670 ) ( CLEAR ?auto_1352663 ) ( not ( = ?auto_1352663 ?auto_1352670 ) ) ( not ( = ?auto_1352664 ?auto_1352670 ) ) ( not ( = ?auto_1352662 ?auto_1352670 ) ) ( not ( = ?auto_1352666 ?auto_1352670 ) ) ( TRUCK-AT ?auto_1352671 ?auto_1352668 ) ( SURFACE-AT ?auto_1352661 ?auto_1352668 ) ( CLEAR ?auto_1352661 ) ( LIFTING ?auto_1352665 ?auto_1352662 ) ( IS-CRATE ?auto_1352662 ) ( not ( = ?auto_1352661 ?auto_1352662 ) ) ( not ( = ?auto_1352663 ?auto_1352661 ) ) ( not ( = ?auto_1352664 ?auto_1352661 ) ) ( not ( = ?auto_1352666 ?auto_1352661 ) ) ( not ( = ?auto_1352670 ?auto_1352661 ) ) ( ON ?auto_1352657 ?auto_1352656 ) ( ON ?auto_1352658 ?auto_1352657 ) ( ON ?auto_1352660 ?auto_1352658 ) ( ON ?auto_1352659 ?auto_1352660 ) ( ON ?auto_1352661 ?auto_1352659 ) ( not ( = ?auto_1352656 ?auto_1352657 ) ) ( not ( = ?auto_1352656 ?auto_1352658 ) ) ( not ( = ?auto_1352656 ?auto_1352660 ) ) ( not ( = ?auto_1352656 ?auto_1352659 ) ) ( not ( = ?auto_1352656 ?auto_1352661 ) ) ( not ( = ?auto_1352656 ?auto_1352662 ) ) ( not ( = ?auto_1352656 ?auto_1352663 ) ) ( not ( = ?auto_1352656 ?auto_1352664 ) ) ( not ( = ?auto_1352656 ?auto_1352666 ) ) ( not ( = ?auto_1352656 ?auto_1352670 ) ) ( not ( = ?auto_1352657 ?auto_1352658 ) ) ( not ( = ?auto_1352657 ?auto_1352660 ) ) ( not ( = ?auto_1352657 ?auto_1352659 ) ) ( not ( = ?auto_1352657 ?auto_1352661 ) ) ( not ( = ?auto_1352657 ?auto_1352662 ) ) ( not ( = ?auto_1352657 ?auto_1352663 ) ) ( not ( = ?auto_1352657 ?auto_1352664 ) ) ( not ( = ?auto_1352657 ?auto_1352666 ) ) ( not ( = ?auto_1352657 ?auto_1352670 ) ) ( not ( = ?auto_1352658 ?auto_1352660 ) ) ( not ( = ?auto_1352658 ?auto_1352659 ) ) ( not ( = ?auto_1352658 ?auto_1352661 ) ) ( not ( = ?auto_1352658 ?auto_1352662 ) ) ( not ( = ?auto_1352658 ?auto_1352663 ) ) ( not ( = ?auto_1352658 ?auto_1352664 ) ) ( not ( = ?auto_1352658 ?auto_1352666 ) ) ( not ( = ?auto_1352658 ?auto_1352670 ) ) ( not ( = ?auto_1352660 ?auto_1352659 ) ) ( not ( = ?auto_1352660 ?auto_1352661 ) ) ( not ( = ?auto_1352660 ?auto_1352662 ) ) ( not ( = ?auto_1352660 ?auto_1352663 ) ) ( not ( = ?auto_1352660 ?auto_1352664 ) ) ( not ( = ?auto_1352660 ?auto_1352666 ) ) ( not ( = ?auto_1352660 ?auto_1352670 ) ) ( not ( = ?auto_1352659 ?auto_1352661 ) ) ( not ( = ?auto_1352659 ?auto_1352662 ) ) ( not ( = ?auto_1352659 ?auto_1352663 ) ) ( not ( = ?auto_1352659 ?auto_1352664 ) ) ( not ( = ?auto_1352659 ?auto_1352666 ) ) ( not ( = ?auto_1352659 ?auto_1352670 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352662 ?auto_1352663 ?auto_1352664 )
      ( MAKE-8CRATE-VERIFY ?auto_1352656 ?auto_1352657 ?auto_1352658 ?auto_1352660 ?auto_1352659 ?auto_1352661 ?auto_1352662 ?auto_1352663 ?auto_1352664 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1356217 - SURFACE
      ?auto_1356218 - SURFACE
      ?auto_1356219 - SURFACE
      ?auto_1356221 - SURFACE
      ?auto_1356220 - SURFACE
      ?auto_1356222 - SURFACE
      ?auto_1356223 - SURFACE
      ?auto_1356224 - SURFACE
      ?auto_1356225 - SURFACE
      ?auto_1356226 - SURFACE
    )
    :vars
    (
      ?auto_1356227 - HOIST
      ?auto_1356228 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1356227 ?auto_1356228 ) ( SURFACE-AT ?auto_1356225 ?auto_1356228 ) ( CLEAR ?auto_1356225 ) ( LIFTING ?auto_1356227 ?auto_1356226 ) ( IS-CRATE ?auto_1356226 ) ( not ( = ?auto_1356225 ?auto_1356226 ) ) ( ON ?auto_1356218 ?auto_1356217 ) ( ON ?auto_1356219 ?auto_1356218 ) ( ON ?auto_1356221 ?auto_1356219 ) ( ON ?auto_1356220 ?auto_1356221 ) ( ON ?auto_1356222 ?auto_1356220 ) ( ON ?auto_1356223 ?auto_1356222 ) ( ON ?auto_1356224 ?auto_1356223 ) ( ON ?auto_1356225 ?auto_1356224 ) ( not ( = ?auto_1356217 ?auto_1356218 ) ) ( not ( = ?auto_1356217 ?auto_1356219 ) ) ( not ( = ?auto_1356217 ?auto_1356221 ) ) ( not ( = ?auto_1356217 ?auto_1356220 ) ) ( not ( = ?auto_1356217 ?auto_1356222 ) ) ( not ( = ?auto_1356217 ?auto_1356223 ) ) ( not ( = ?auto_1356217 ?auto_1356224 ) ) ( not ( = ?auto_1356217 ?auto_1356225 ) ) ( not ( = ?auto_1356217 ?auto_1356226 ) ) ( not ( = ?auto_1356218 ?auto_1356219 ) ) ( not ( = ?auto_1356218 ?auto_1356221 ) ) ( not ( = ?auto_1356218 ?auto_1356220 ) ) ( not ( = ?auto_1356218 ?auto_1356222 ) ) ( not ( = ?auto_1356218 ?auto_1356223 ) ) ( not ( = ?auto_1356218 ?auto_1356224 ) ) ( not ( = ?auto_1356218 ?auto_1356225 ) ) ( not ( = ?auto_1356218 ?auto_1356226 ) ) ( not ( = ?auto_1356219 ?auto_1356221 ) ) ( not ( = ?auto_1356219 ?auto_1356220 ) ) ( not ( = ?auto_1356219 ?auto_1356222 ) ) ( not ( = ?auto_1356219 ?auto_1356223 ) ) ( not ( = ?auto_1356219 ?auto_1356224 ) ) ( not ( = ?auto_1356219 ?auto_1356225 ) ) ( not ( = ?auto_1356219 ?auto_1356226 ) ) ( not ( = ?auto_1356221 ?auto_1356220 ) ) ( not ( = ?auto_1356221 ?auto_1356222 ) ) ( not ( = ?auto_1356221 ?auto_1356223 ) ) ( not ( = ?auto_1356221 ?auto_1356224 ) ) ( not ( = ?auto_1356221 ?auto_1356225 ) ) ( not ( = ?auto_1356221 ?auto_1356226 ) ) ( not ( = ?auto_1356220 ?auto_1356222 ) ) ( not ( = ?auto_1356220 ?auto_1356223 ) ) ( not ( = ?auto_1356220 ?auto_1356224 ) ) ( not ( = ?auto_1356220 ?auto_1356225 ) ) ( not ( = ?auto_1356220 ?auto_1356226 ) ) ( not ( = ?auto_1356222 ?auto_1356223 ) ) ( not ( = ?auto_1356222 ?auto_1356224 ) ) ( not ( = ?auto_1356222 ?auto_1356225 ) ) ( not ( = ?auto_1356222 ?auto_1356226 ) ) ( not ( = ?auto_1356223 ?auto_1356224 ) ) ( not ( = ?auto_1356223 ?auto_1356225 ) ) ( not ( = ?auto_1356223 ?auto_1356226 ) ) ( not ( = ?auto_1356224 ?auto_1356225 ) ) ( not ( = ?auto_1356224 ?auto_1356226 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1356225 ?auto_1356226 )
      ( MAKE-9CRATE-VERIFY ?auto_1356217 ?auto_1356218 ?auto_1356219 ?auto_1356221 ?auto_1356220 ?auto_1356222 ?auto_1356223 ?auto_1356224 ?auto_1356225 ?auto_1356226 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1356297 - SURFACE
      ?auto_1356298 - SURFACE
      ?auto_1356299 - SURFACE
      ?auto_1356301 - SURFACE
      ?auto_1356300 - SURFACE
      ?auto_1356302 - SURFACE
      ?auto_1356303 - SURFACE
      ?auto_1356304 - SURFACE
      ?auto_1356305 - SURFACE
      ?auto_1356306 - SURFACE
    )
    :vars
    (
      ?auto_1356309 - HOIST
      ?auto_1356308 - PLACE
      ?auto_1356307 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1356309 ?auto_1356308 ) ( SURFACE-AT ?auto_1356305 ?auto_1356308 ) ( CLEAR ?auto_1356305 ) ( IS-CRATE ?auto_1356306 ) ( not ( = ?auto_1356305 ?auto_1356306 ) ) ( TRUCK-AT ?auto_1356307 ?auto_1356308 ) ( AVAILABLE ?auto_1356309 ) ( IN ?auto_1356306 ?auto_1356307 ) ( ON ?auto_1356305 ?auto_1356304 ) ( not ( = ?auto_1356304 ?auto_1356305 ) ) ( not ( = ?auto_1356304 ?auto_1356306 ) ) ( ON ?auto_1356298 ?auto_1356297 ) ( ON ?auto_1356299 ?auto_1356298 ) ( ON ?auto_1356301 ?auto_1356299 ) ( ON ?auto_1356300 ?auto_1356301 ) ( ON ?auto_1356302 ?auto_1356300 ) ( ON ?auto_1356303 ?auto_1356302 ) ( ON ?auto_1356304 ?auto_1356303 ) ( not ( = ?auto_1356297 ?auto_1356298 ) ) ( not ( = ?auto_1356297 ?auto_1356299 ) ) ( not ( = ?auto_1356297 ?auto_1356301 ) ) ( not ( = ?auto_1356297 ?auto_1356300 ) ) ( not ( = ?auto_1356297 ?auto_1356302 ) ) ( not ( = ?auto_1356297 ?auto_1356303 ) ) ( not ( = ?auto_1356297 ?auto_1356304 ) ) ( not ( = ?auto_1356297 ?auto_1356305 ) ) ( not ( = ?auto_1356297 ?auto_1356306 ) ) ( not ( = ?auto_1356298 ?auto_1356299 ) ) ( not ( = ?auto_1356298 ?auto_1356301 ) ) ( not ( = ?auto_1356298 ?auto_1356300 ) ) ( not ( = ?auto_1356298 ?auto_1356302 ) ) ( not ( = ?auto_1356298 ?auto_1356303 ) ) ( not ( = ?auto_1356298 ?auto_1356304 ) ) ( not ( = ?auto_1356298 ?auto_1356305 ) ) ( not ( = ?auto_1356298 ?auto_1356306 ) ) ( not ( = ?auto_1356299 ?auto_1356301 ) ) ( not ( = ?auto_1356299 ?auto_1356300 ) ) ( not ( = ?auto_1356299 ?auto_1356302 ) ) ( not ( = ?auto_1356299 ?auto_1356303 ) ) ( not ( = ?auto_1356299 ?auto_1356304 ) ) ( not ( = ?auto_1356299 ?auto_1356305 ) ) ( not ( = ?auto_1356299 ?auto_1356306 ) ) ( not ( = ?auto_1356301 ?auto_1356300 ) ) ( not ( = ?auto_1356301 ?auto_1356302 ) ) ( not ( = ?auto_1356301 ?auto_1356303 ) ) ( not ( = ?auto_1356301 ?auto_1356304 ) ) ( not ( = ?auto_1356301 ?auto_1356305 ) ) ( not ( = ?auto_1356301 ?auto_1356306 ) ) ( not ( = ?auto_1356300 ?auto_1356302 ) ) ( not ( = ?auto_1356300 ?auto_1356303 ) ) ( not ( = ?auto_1356300 ?auto_1356304 ) ) ( not ( = ?auto_1356300 ?auto_1356305 ) ) ( not ( = ?auto_1356300 ?auto_1356306 ) ) ( not ( = ?auto_1356302 ?auto_1356303 ) ) ( not ( = ?auto_1356302 ?auto_1356304 ) ) ( not ( = ?auto_1356302 ?auto_1356305 ) ) ( not ( = ?auto_1356302 ?auto_1356306 ) ) ( not ( = ?auto_1356303 ?auto_1356304 ) ) ( not ( = ?auto_1356303 ?auto_1356305 ) ) ( not ( = ?auto_1356303 ?auto_1356306 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1356304 ?auto_1356305 ?auto_1356306 )
      ( MAKE-9CRATE-VERIFY ?auto_1356297 ?auto_1356298 ?auto_1356299 ?auto_1356301 ?auto_1356300 ?auto_1356302 ?auto_1356303 ?auto_1356304 ?auto_1356305 ?auto_1356306 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1356387 - SURFACE
      ?auto_1356388 - SURFACE
      ?auto_1356389 - SURFACE
      ?auto_1356391 - SURFACE
      ?auto_1356390 - SURFACE
      ?auto_1356392 - SURFACE
      ?auto_1356393 - SURFACE
      ?auto_1356394 - SURFACE
      ?auto_1356395 - SURFACE
      ?auto_1356396 - SURFACE
    )
    :vars
    (
      ?auto_1356399 - HOIST
      ?auto_1356400 - PLACE
      ?auto_1356397 - TRUCK
      ?auto_1356398 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1356399 ?auto_1356400 ) ( SURFACE-AT ?auto_1356395 ?auto_1356400 ) ( CLEAR ?auto_1356395 ) ( IS-CRATE ?auto_1356396 ) ( not ( = ?auto_1356395 ?auto_1356396 ) ) ( AVAILABLE ?auto_1356399 ) ( IN ?auto_1356396 ?auto_1356397 ) ( ON ?auto_1356395 ?auto_1356394 ) ( not ( = ?auto_1356394 ?auto_1356395 ) ) ( not ( = ?auto_1356394 ?auto_1356396 ) ) ( TRUCK-AT ?auto_1356397 ?auto_1356398 ) ( not ( = ?auto_1356398 ?auto_1356400 ) ) ( ON ?auto_1356388 ?auto_1356387 ) ( ON ?auto_1356389 ?auto_1356388 ) ( ON ?auto_1356391 ?auto_1356389 ) ( ON ?auto_1356390 ?auto_1356391 ) ( ON ?auto_1356392 ?auto_1356390 ) ( ON ?auto_1356393 ?auto_1356392 ) ( ON ?auto_1356394 ?auto_1356393 ) ( not ( = ?auto_1356387 ?auto_1356388 ) ) ( not ( = ?auto_1356387 ?auto_1356389 ) ) ( not ( = ?auto_1356387 ?auto_1356391 ) ) ( not ( = ?auto_1356387 ?auto_1356390 ) ) ( not ( = ?auto_1356387 ?auto_1356392 ) ) ( not ( = ?auto_1356387 ?auto_1356393 ) ) ( not ( = ?auto_1356387 ?auto_1356394 ) ) ( not ( = ?auto_1356387 ?auto_1356395 ) ) ( not ( = ?auto_1356387 ?auto_1356396 ) ) ( not ( = ?auto_1356388 ?auto_1356389 ) ) ( not ( = ?auto_1356388 ?auto_1356391 ) ) ( not ( = ?auto_1356388 ?auto_1356390 ) ) ( not ( = ?auto_1356388 ?auto_1356392 ) ) ( not ( = ?auto_1356388 ?auto_1356393 ) ) ( not ( = ?auto_1356388 ?auto_1356394 ) ) ( not ( = ?auto_1356388 ?auto_1356395 ) ) ( not ( = ?auto_1356388 ?auto_1356396 ) ) ( not ( = ?auto_1356389 ?auto_1356391 ) ) ( not ( = ?auto_1356389 ?auto_1356390 ) ) ( not ( = ?auto_1356389 ?auto_1356392 ) ) ( not ( = ?auto_1356389 ?auto_1356393 ) ) ( not ( = ?auto_1356389 ?auto_1356394 ) ) ( not ( = ?auto_1356389 ?auto_1356395 ) ) ( not ( = ?auto_1356389 ?auto_1356396 ) ) ( not ( = ?auto_1356391 ?auto_1356390 ) ) ( not ( = ?auto_1356391 ?auto_1356392 ) ) ( not ( = ?auto_1356391 ?auto_1356393 ) ) ( not ( = ?auto_1356391 ?auto_1356394 ) ) ( not ( = ?auto_1356391 ?auto_1356395 ) ) ( not ( = ?auto_1356391 ?auto_1356396 ) ) ( not ( = ?auto_1356390 ?auto_1356392 ) ) ( not ( = ?auto_1356390 ?auto_1356393 ) ) ( not ( = ?auto_1356390 ?auto_1356394 ) ) ( not ( = ?auto_1356390 ?auto_1356395 ) ) ( not ( = ?auto_1356390 ?auto_1356396 ) ) ( not ( = ?auto_1356392 ?auto_1356393 ) ) ( not ( = ?auto_1356392 ?auto_1356394 ) ) ( not ( = ?auto_1356392 ?auto_1356395 ) ) ( not ( = ?auto_1356392 ?auto_1356396 ) ) ( not ( = ?auto_1356393 ?auto_1356394 ) ) ( not ( = ?auto_1356393 ?auto_1356395 ) ) ( not ( = ?auto_1356393 ?auto_1356396 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1356394 ?auto_1356395 ?auto_1356396 )
      ( MAKE-9CRATE-VERIFY ?auto_1356387 ?auto_1356388 ?auto_1356389 ?auto_1356391 ?auto_1356390 ?auto_1356392 ?auto_1356393 ?auto_1356394 ?auto_1356395 ?auto_1356396 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1356486 - SURFACE
      ?auto_1356487 - SURFACE
      ?auto_1356488 - SURFACE
      ?auto_1356490 - SURFACE
      ?auto_1356489 - SURFACE
      ?auto_1356491 - SURFACE
      ?auto_1356492 - SURFACE
      ?auto_1356493 - SURFACE
      ?auto_1356494 - SURFACE
      ?auto_1356495 - SURFACE
    )
    :vars
    (
      ?auto_1356498 - HOIST
      ?auto_1356500 - PLACE
      ?auto_1356497 - TRUCK
      ?auto_1356499 - PLACE
      ?auto_1356496 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1356498 ?auto_1356500 ) ( SURFACE-AT ?auto_1356494 ?auto_1356500 ) ( CLEAR ?auto_1356494 ) ( IS-CRATE ?auto_1356495 ) ( not ( = ?auto_1356494 ?auto_1356495 ) ) ( AVAILABLE ?auto_1356498 ) ( ON ?auto_1356494 ?auto_1356493 ) ( not ( = ?auto_1356493 ?auto_1356494 ) ) ( not ( = ?auto_1356493 ?auto_1356495 ) ) ( TRUCK-AT ?auto_1356497 ?auto_1356499 ) ( not ( = ?auto_1356499 ?auto_1356500 ) ) ( HOIST-AT ?auto_1356496 ?auto_1356499 ) ( LIFTING ?auto_1356496 ?auto_1356495 ) ( not ( = ?auto_1356498 ?auto_1356496 ) ) ( ON ?auto_1356487 ?auto_1356486 ) ( ON ?auto_1356488 ?auto_1356487 ) ( ON ?auto_1356490 ?auto_1356488 ) ( ON ?auto_1356489 ?auto_1356490 ) ( ON ?auto_1356491 ?auto_1356489 ) ( ON ?auto_1356492 ?auto_1356491 ) ( ON ?auto_1356493 ?auto_1356492 ) ( not ( = ?auto_1356486 ?auto_1356487 ) ) ( not ( = ?auto_1356486 ?auto_1356488 ) ) ( not ( = ?auto_1356486 ?auto_1356490 ) ) ( not ( = ?auto_1356486 ?auto_1356489 ) ) ( not ( = ?auto_1356486 ?auto_1356491 ) ) ( not ( = ?auto_1356486 ?auto_1356492 ) ) ( not ( = ?auto_1356486 ?auto_1356493 ) ) ( not ( = ?auto_1356486 ?auto_1356494 ) ) ( not ( = ?auto_1356486 ?auto_1356495 ) ) ( not ( = ?auto_1356487 ?auto_1356488 ) ) ( not ( = ?auto_1356487 ?auto_1356490 ) ) ( not ( = ?auto_1356487 ?auto_1356489 ) ) ( not ( = ?auto_1356487 ?auto_1356491 ) ) ( not ( = ?auto_1356487 ?auto_1356492 ) ) ( not ( = ?auto_1356487 ?auto_1356493 ) ) ( not ( = ?auto_1356487 ?auto_1356494 ) ) ( not ( = ?auto_1356487 ?auto_1356495 ) ) ( not ( = ?auto_1356488 ?auto_1356490 ) ) ( not ( = ?auto_1356488 ?auto_1356489 ) ) ( not ( = ?auto_1356488 ?auto_1356491 ) ) ( not ( = ?auto_1356488 ?auto_1356492 ) ) ( not ( = ?auto_1356488 ?auto_1356493 ) ) ( not ( = ?auto_1356488 ?auto_1356494 ) ) ( not ( = ?auto_1356488 ?auto_1356495 ) ) ( not ( = ?auto_1356490 ?auto_1356489 ) ) ( not ( = ?auto_1356490 ?auto_1356491 ) ) ( not ( = ?auto_1356490 ?auto_1356492 ) ) ( not ( = ?auto_1356490 ?auto_1356493 ) ) ( not ( = ?auto_1356490 ?auto_1356494 ) ) ( not ( = ?auto_1356490 ?auto_1356495 ) ) ( not ( = ?auto_1356489 ?auto_1356491 ) ) ( not ( = ?auto_1356489 ?auto_1356492 ) ) ( not ( = ?auto_1356489 ?auto_1356493 ) ) ( not ( = ?auto_1356489 ?auto_1356494 ) ) ( not ( = ?auto_1356489 ?auto_1356495 ) ) ( not ( = ?auto_1356491 ?auto_1356492 ) ) ( not ( = ?auto_1356491 ?auto_1356493 ) ) ( not ( = ?auto_1356491 ?auto_1356494 ) ) ( not ( = ?auto_1356491 ?auto_1356495 ) ) ( not ( = ?auto_1356492 ?auto_1356493 ) ) ( not ( = ?auto_1356492 ?auto_1356494 ) ) ( not ( = ?auto_1356492 ?auto_1356495 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1356493 ?auto_1356494 ?auto_1356495 )
      ( MAKE-9CRATE-VERIFY ?auto_1356486 ?auto_1356487 ?auto_1356488 ?auto_1356490 ?auto_1356489 ?auto_1356491 ?auto_1356492 ?auto_1356493 ?auto_1356494 ?auto_1356495 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1356594 - SURFACE
      ?auto_1356595 - SURFACE
      ?auto_1356596 - SURFACE
      ?auto_1356598 - SURFACE
      ?auto_1356597 - SURFACE
      ?auto_1356599 - SURFACE
      ?auto_1356600 - SURFACE
      ?auto_1356601 - SURFACE
      ?auto_1356602 - SURFACE
      ?auto_1356603 - SURFACE
    )
    :vars
    (
      ?auto_1356605 - HOIST
      ?auto_1356604 - PLACE
      ?auto_1356606 - TRUCK
      ?auto_1356608 - PLACE
      ?auto_1356609 - HOIST
      ?auto_1356607 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1356605 ?auto_1356604 ) ( SURFACE-AT ?auto_1356602 ?auto_1356604 ) ( CLEAR ?auto_1356602 ) ( IS-CRATE ?auto_1356603 ) ( not ( = ?auto_1356602 ?auto_1356603 ) ) ( AVAILABLE ?auto_1356605 ) ( ON ?auto_1356602 ?auto_1356601 ) ( not ( = ?auto_1356601 ?auto_1356602 ) ) ( not ( = ?auto_1356601 ?auto_1356603 ) ) ( TRUCK-AT ?auto_1356606 ?auto_1356608 ) ( not ( = ?auto_1356608 ?auto_1356604 ) ) ( HOIST-AT ?auto_1356609 ?auto_1356608 ) ( not ( = ?auto_1356605 ?auto_1356609 ) ) ( AVAILABLE ?auto_1356609 ) ( SURFACE-AT ?auto_1356603 ?auto_1356608 ) ( ON ?auto_1356603 ?auto_1356607 ) ( CLEAR ?auto_1356603 ) ( not ( = ?auto_1356602 ?auto_1356607 ) ) ( not ( = ?auto_1356603 ?auto_1356607 ) ) ( not ( = ?auto_1356601 ?auto_1356607 ) ) ( ON ?auto_1356595 ?auto_1356594 ) ( ON ?auto_1356596 ?auto_1356595 ) ( ON ?auto_1356598 ?auto_1356596 ) ( ON ?auto_1356597 ?auto_1356598 ) ( ON ?auto_1356599 ?auto_1356597 ) ( ON ?auto_1356600 ?auto_1356599 ) ( ON ?auto_1356601 ?auto_1356600 ) ( not ( = ?auto_1356594 ?auto_1356595 ) ) ( not ( = ?auto_1356594 ?auto_1356596 ) ) ( not ( = ?auto_1356594 ?auto_1356598 ) ) ( not ( = ?auto_1356594 ?auto_1356597 ) ) ( not ( = ?auto_1356594 ?auto_1356599 ) ) ( not ( = ?auto_1356594 ?auto_1356600 ) ) ( not ( = ?auto_1356594 ?auto_1356601 ) ) ( not ( = ?auto_1356594 ?auto_1356602 ) ) ( not ( = ?auto_1356594 ?auto_1356603 ) ) ( not ( = ?auto_1356594 ?auto_1356607 ) ) ( not ( = ?auto_1356595 ?auto_1356596 ) ) ( not ( = ?auto_1356595 ?auto_1356598 ) ) ( not ( = ?auto_1356595 ?auto_1356597 ) ) ( not ( = ?auto_1356595 ?auto_1356599 ) ) ( not ( = ?auto_1356595 ?auto_1356600 ) ) ( not ( = ?auto_1356595 ?auto_1356601 ) ) ( not ( = ?auto_1356595 ?auto_1356602 ) ) ( not ( = ?auto_1356595 ?auto_1356603 ) ) ( not ( = ?auto_1356595 ?auto_1356607 ) ) ( not ( = ?auto_1356596 ?auto_1356598 ) ) ( not ( = ?auto_1356596 ?auto_1356597 ) ) ( not ( = ?auto_1356596 ?auto_1356599 ) ) ( not ( = ?auto_1356596 ?auto_1356600 ) ) ( not ( = ?auto_1356596 ?auto_1356601 ) ) ( not ( = ?auto_1356596 ?auto_1356602 ) ) ( not ( = ?auto_1356596 ?auto_1356603 ) ) ( not ( = ?auto_1356596 ?auto_1356607 ) ) ( not ( = ?auto_1356598 ?auto_1356597 ) ) ( not ( = ?auto_1356598 ?auto_1356599 ) ) ( not ( = ?auto_1356598 ?auto_1356600 ) ) ( not ( = ?auto_1356598 ?auto_1356601 ) ) ( not ( = ?auto_1356598 ?auto_1356602 ) ) ( not ( = ?auto_1356598 ?auto_1356603 ) ) ( not ( = ?auto_1356598 ?auto_1356607 ) ) ( not ( = ?auto_1356597 ?auto_1356599 ) ) ( not ( = ?auto_1356597 ?auto_1356600 ) ) ( not ( = ?auto_1356597 ?auto_1356601 ) ) ( not ( = ?auto_1356597 ?auto_1356602 ) ) ( not ( = ?auto_1356597 ?auto_1356603 ) ) ( not ( = ?auto_1356597 ?auto_1356607 ) ) ( not ( = ?auto_1356599 ?auto_1356600 ) ) ( not ( = ?auto_1356599 ?auto_1356601 ) ) ( not ( = ?auto_1356599 ?auto_1356602 ) ) ( not ( = ?auto_1356599 ?auto_1356603 ) ) ( not ( = ?auto_1356599 ?auto_1356607 ) ) ( not ( = ?auto_1356600 ?auto_1356601 ) ) ( not ( = ?auto_1356600 ?auto_1356602 ) ) ( not ( = ?auto_1356600 ?auto_1356603 ) ) ( not ( = ?auto_1356600 ?auto_1356607 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1356601 ?auto_1356602 ?auto_1356603 )
      ( MAKE-9CRATE-VERIFY ?auto_1356594 ?auto_1356595 ?auto_1356596 ?auto_1356598 ?auto_1356597 ?auto_1356599 ?auto_1356600 ?auto_1356601 ?auto_1356602 ?auto_1356603 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1356703 - SURFACE
      ?auto_1356704 - SURFACE
      ?auto_1356705 - SURFACE
      ?auto_1356707 - SURFACE
      ?auto_1356706 - SURFACE
      ?auto_1356708 - SURFACE
      ?auto_1356709 - SURFACE
      ?auto_1356710 - SURFACE
      ?auto_1356711 - SURFACE
      ?auto_1356712 - SURFACE
    )
    :vars
    (
      ?auto_1356715 - HOIST
      ?auto_1356717 - PLACE
      ?auto_1356714 - PLACE
      ?auto_1356718 - HOIST
      ?auto_1356716 - SURFACE
      ?auto_1356713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1356715 ?auto_1356717 ) ( SURFACE-AT ?auto_1356711 ?auto_1356717 ) ( CLEAR ?auto_1356711 ) ( IS-CRATE ?auto_1356712 ) ( not ( = ?auto_1356711 ?auto_1356712 ) ) ( AVAILABLE ?auto_1356715 ) ( ON ?auto_1356711 ?auto_1356710 ) ( not ( = ?auto_1356710 ?auto_1356711 ) ) ( not ( = ?auto_1356710 ?auto_1356712 ) ) ( not ( = ?auto_1356714 ?auto_1356717 ) ) ( HOIST-AT ?auto_1356718 ?auto_1356714 ) ( not ( = ?auto_1356715 ?auto_1356718 ) ) ( AVAILABLE ?auto_1356718 ) ( SURFACE-AT ?auto_1356712 ?auto_1356714 ) ( ON ?auto_1356712 ?auto_1356716 ) ( CLEAR ?auto_1356712 ) ( not ( = ?auto_1356711 ?auto_1356716 ) ) ( not ( = ?auto_1356712 ?auto_1356716 ) ) ( not ( = ?auto_1356710 ?auto_1356716 ) ) ( TRUCK-AT ?auto_1356713 ?auto_1356717 ) ( ON ?auto_1356704 ?auto_1356703 ) ( ON ?auto_1356705 ?auto_1356704 ) ( ON ?auto_1356707 ?auto_1356705 ) ( ON ?auto_1356706 ?auto_1356707 ) ( ON ?auto_1356708 ?auto_1356706 ) ( ON ?auto_1356709 ?auto_1356708 ) ( ON ?auto_1356710 ?auto_1356709 ) ( not ( = ?auto_1356703 ?auto_1356704 ) ) ( not ( = ?auto_1356703 ?auto_1356705 ) ) ( not ( = ?auto_1356703 ?auto_1356707 ) ) ( not ( = ?auto_1356703 ?auto_1356706 ) ) ( not ( = ?auto_1356703 ?auto_1356708 ) ) ( not ( = ?auto_1356703 ?auto_1356709 ) ) ( not ( = ?auto_1356703 ?auto_1356710 ) ) ( not ( = ?auto_1356703 ?auto_1356711 ) ) ( not ( = ?auto_1356703 ?auto_1356712 ) ) ( not ( = ?auto_1356703 ?auto_1356716 ) ) ( not ( = ?auto_1356704 ?auto_1356705 ) ) ( not ( = ?auto_1356704 ?auto_1356707 ) ) ( not ( = ?auto_1356704 ?auto_1356706 ) ) ( not ( = ?auto_1356704 ?auto_1356708 ) ) ( not ( = ?auto_1356704 ?auto_1356709 ) ) ( not ( = ?auto_1356704 ?auto_1356710 ) ) ( not ( = ?auto_1356704 ?auto_1356711 ) ) ( not ( = ?auto_1356704 ?auto_1356712 ) ) ( not ( = ?auto_1356704 ?auto_1356716 ) ) ( not ( = ?auto_1356705 ?auto_1356707 ) ) ( not ( = ?auto_1356705 ?auto_1356706 ) ) ( not ( = ?auto_1356705 ?auto_1356708 ) ) ( not ( = ?auto_1356705 ?auto_1356709 ) ) ( not ( = ?auto_1356705 ?auto_1356710 ) ) ( not ( = ?auto_1356705 ?auto_1356711 ) ) ( not ( = ?auto_1356705 ?auto_1356712 ) ) ( not ( = ?auto_1356705 ?auto_1356716 ) ) ( not ( = ?auto_1356707 ?auto_1356706 ) ) ( not ( = ?auto_1356707 ?auto_1356708 ) ) ( not ( = ?auto_1356707 ?auto_1356709 ) ) ( not ( = ?auto_1356707 ?auto_1356710 ) ) ( not ( = ?auto_1356707 ?auto_1356711 ) ) ( not ( = ?auto_1356707 ?auto_1356712 ) ) ( not ( = ?auto_1356707 ?auto_1356716 ) ) ( not ( = ?auto_1356706 ?auto_1356708 ) ) ( not ( = ?auto_1356706 ?auto_1356709 ) ) ( not ( = ?auto_1356706 ?auto_1356710 ) ) ( not ( = ?auto_1356706 ?auto_1356711 ) ) ( not ( = ?auto_1356706 ?auto_1356712 ) ) ( not ( = ?auto_1356706 ?auto_1356716 ) ) ( not ( = ?auto_1356708 ?auto_1356709 ) ) ( not ( = ?auto_1356708 ?auto_1356710 ) ) ( not ( = ?auto_1356708 ?auto_1356711 ) ) ( not ( = ?auto_1356708 ?auto_1356712 ) ) ( not ( = ?auto_1356708 ?auto_1356716 ) ) ( not ( = ?auto_1356709 ?auto_1356710 ) ) ( not ( = ?auto_1356709 ?auto_1356711 ) ) ( not ( = ?auto_1356709 ?auto_1356712 ) ) ( not ( = ?auto_1356709 ?auto_1356716 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1356710 ?auto_1356711 ?auto_1356712 )
      ( MAKE-9CRATE-VERIFY ?auto_1356703 ?auto_1356704 ?auto_1356705 ?auto_1356707 ?auto_1356706 ?auto_1356708 ?auto_1356709 ?auto_1356710 ?auto_1356711 ?auto_1356712 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1356812 - SURFACE
      ?auto_1356813 - SURFACE
      ?auto_1356814 - SURFACE
      ?auto_1356816 - SURFACE
      ?auto_1356815 - SURFACE
      ?auto_1356817 - SURFACE
      ?auto_1356818 - SURFACE
      ?auto_1356819 - SURFACE
      ?auto_1356820 - SURFACE
      ?auto_1356821 - SURFACE
    )
    :vars
    (
      ?auto_1356827 - HOIST
      ?auto_1356822 - PLACE
      ?auto_1356823 - PLACE
      ?auto_1356826 - HOIST
      ?auto_1356825 - SURFACE
      ?auto_1356824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1356827 ?auto_1356822 ) ( IS-CRATE ?auto_1356821 ) ( not ( = ?auto_1356820 ?auto_1356821 ) ) ( not ( = ?auto_1356819 ?auto_1356820 ) ) ( not ( = ?auto_1356819 ?auto_1356821 ) ) ( not ( = ?auto_1356823 ?auto_1356822 ) ) ( HOIST-AT ?auto_1356826 ?auto_1356823 ) ( not ( = ?auto_1356827 ?auto_1356826 ) ) ( AVAILABLE ?auto_1356826 ) ( SURFACE-AT ?auto_1356821 ?auto_1356823 ) ( ON ?auto_1356821 ?auto_1356825 ) ( CLEAR ?auto_1356821 ) ( not ( = ?auto_1356820 ?auto_1356825 ) ) ( not ( = ?auto_1356821 ?auto_1356825 ) ) ( not ( = ?auto_1356819 ?auto_1356825 ) ) ( TRUCK-AT ?auto_1356824 ?auto_1356822 ) ( SURFACE-AT ?auto_1356819 ?auto_1356822 ) ( CLEAR ?auto_1356819 ) ( LIFTING ?auto_1356827 ?auto_1356820 ) ( IS-CRATE ?auto_1356820 ) ( ON ?auto_1356813 ?auto_1356812 ) ( ON ?auto_1356814 ?auto_1356813 ) ( ON ?auto_1356816 ?auto_1356814 ) ( ON ?auto_1356815 ?auto_1356816 ) ( ON ?auto_1356817 ?auto_1356815 ) ( ON ?auto_1356818 ?auto_1356817 ) ( ON ?auto_1356819 ?auto_1356818 ) ( not ( = ?auto_1356812 ?auto_1356813 ) ) ( not ( = ?auto_1356812 ?auto_1356814 ) ) ( not ( = ?auto_1356812 ?auto_1356816 ) ) ( not ( = ?auto_1356812 ?auto_1356815 ) ) ( not ( = ?auto_1356812 ?auto_1356817 ) ) ( not ( = ?auto_1356812 ?auto_1356818 ) ) ( not ( = ?auto_1356812 ?auto_1356819 ) ) ( not ( = ?auto_1356812 ?auto_1356820 ) ) ( not ( = ?auto_1356812 ?auto_1356821 ) ) ( not ( = ?auto_1356812 ?auto_1356825 ) ) ( not ( = ?auto_1356813 ?auto_1356814 ) ) ( not ( = ?auto_1356813 ?auto_1356816 ) ) ( not ( = ?auto_1356813 ?auto_1356815 ) ) ( not ( = ?auto_1356813 ?auto_1356817 ) ) ( not ( = ?auto_1356813 ?auto_1356818 ) ) ( not ( = ?auto_1356813 ?auto_1356819 ) ) ( not ( = ?auto_1356813 ?auto_1356820 ) ) ( not ( = ?auto_1356813 ?auto_1356821 ) ) ( not ( = ?auto_1356813 ?auto_1356825 ) ) ( not ( = ?auto_1356814 ?auto_1356816 ) ) ( not ( = ?auto_1356814 ?auto_1356815 ) ) ( not ( = ?auto_1356814 ?auto_1356817 ) ) ( not ( = ?auto_1356814 ?auto_1356818 ) ) ( not ( = ?auto_1356814 ?auto_1356819 ) ) ( not ( = ?auto_1356814 ?auto_1356820 ) ) ( not ( = ?auto_1356814 ?auto_1356821 ) ) ( not ( = ?auto_1356814 ?auto_1356825 ) ) ( not ( = ?auto_1356816 ?auto_1356815 ) ) ( not ( = ?auto_1356816 ?auto_1356817 ) ) ( not ( = ?auto_1356816 ?auto_1356818 ) ) ( not ( = ?auto_1356816 ?auto_1356819 ) ) ( not ( = ?auto_1356816 ?auto_1356820 ) ) ( not ( = ?auto_1356816 ?auto_1356821 ) ) ( not ( = ?auto_1356816 ?auto_1356825 ) ) ( not ( = ?auto_1356815 ?auto_1356817 ) ) ( not ( = ?auto_1356815 ?auto_1356818 ) ) ( not ( = ?auto_1356815 ?auto_1356819 ) ) ( not ( = ?auto_1356815 ?auto_1356820 ) ) ( not ( = ?auto_1356815 ?auto_1356821 ) ) ( not ( = ?auto_1356815 ?auto_1356825 ) ) ( not ( = ?auto_1356817 ?auto_1356818 ) ) ( not ( = ?auto_1356817 ?auto_1356819 ) ) ( not ( = ?auto_1356817 ?auto_1356820 ) ) ( not ( = ?auto_1356817 ?auto_1356821 ) ) ( not ( = ?auto_1356817 ?auto_1356825 ) ) ( not ( = ?auto_1356818 ?auto_1356819 ) ) ( not ( = ?auto_1356818 ?auto_1356820 ) ) ( not ( = ?auto_1356818 ?auto_1356821 ) ) ( not ( = ?auto_1356818 ?auto_1356825 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1356819 ?auto_1356820 ?auto_1356821 )
      ( MAKE-9CRATE-VERIFY ?auto_1356812 ?auto_1356813 ?auto_1356814 ?auto_1356816 ?auto_1356815 ?auto_1356817 ?auto_1356818 ?auto_1356819 ?auto_1356820 ?auto_1356821 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1356921 - SURFACE
      ?auto_1356922 - SURFACE
      ?auto_1356923 - SURFACE
      ?auto_1356925 - SURFACE
      ?auto_1356924 - SURFACE
      ?auto_1356926 - SURFACE
      ?auto_1356927 - SURFACE
      ?auto_1356928 - SURFACE
      ?auto_1356929 - SURFACE
      ?auto_1356930 - SURFACE
    )
    :vars
    (
      ?auto_1356933 - HOIST
      ?auto_1356935 - PLACE
      ?auto_1356936 - PLACE
      ?auto_1356934 - HOIST
      ?auto_1356932 - SURFACE
      ?auto_1356931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1356933 ?auto_1356935 ) ( IS-CRATE ?auto_1356930 ) ( not ( = ?auto_1356929 ?auto_1356930 ) ) ( not ( = ?auto_1356928 ?auto_1356929 ) ) ( not ( = ?auto_1356928 ?auto_1356930 ) ) ( not ( = ?auto_1356936 ?auto_1356935 ) ) ( HOIST-AT ?auto_1356934 ?auto_1356936 ) ( not ( = ?auto_1356933 ?auto_1356934 ) ) ( AVAILABLE ?auto_1356934 ) ( SURFACE-AT ?auto_1356930 ?auto_1356936 ) ( ON ?auto_1356930 ?auto_1356932 ) ( CLEAR ?auto_1356930 ) ( not ( = ?auto_1356929 ?auto_1356932 ) ) ( not ( = ?auto_1356930 ?auto_1356932 ) ) ( not ( = ?auto_1356928 ?auto_1356932 ) ) ( TRUCK-AT ?auto_1356931 ?auto_1356935 ) ( SURFACE-AT ?auto_1356928 ?auto_1356935 ) ( CLEAR ?auto_1356928 ) ( IS-CRATE ?auto_1356929 ) ( AVAILABLE ?auto_1356933 ) ( IN ?auto_1356929 ?auto_1356931 ) ( ON ?auto_1356922 ?auto_1356921 ) ( ON ?auto_1356923 ?auto_1356922 ) ( ON ?auto_1356925 ?auto_1356923 ) ( ON ?auto_1356924 ?auto_1356925 ) ( ON ?auto_1356926 ?auto_1356924 ) ( ON ?auto_1356927 ?auto_1356926 ) ( ON ?auto_1356928 ?auto_1356927 ) ( not ( = ?auto_1356921 ?auto_1356922 ) ) ( not ( = ?auto_1356921 ?auto_1356923 ) ) ( not ( = ?auto_1356921 ?auto_1356925 ) ) ( not ( = ?auto_1356921 ?auto_1356924 ) ) ( not ( = ?auto_1356921 ?auto_1356926 ) ) ( not ( = ?auto_1356921 ?auto_1356927 ) ) ( not ( = ?auto_1356921 ?auto_1356928 ) ) ( not ( = ?auto_1356921 ?auto_1356929 ) ) ( not ( = ?auto_1356921 ?auto_1356930 ) ) ( not ( = ?auto_1356921 ?auto_1356932 ) ) ( not ( = ?auto_1356922 ?auto_1356923 ) ) ( not ( = ?auto_1356922 ?auto_1356925 ) ) ( not ( = ?auto_1356922 ?auto_1356924 ) ) ( not ( = ?auto_1356922 ?auto_1356926 ) ) ( not ( = ?auto_1356922 ?auto_1356927 ) ) ( not ( = ?auto_1356922 ?auto_1356928 ) ) ( not ( = ?auto_1356922 ?auto_1356929 ) ) ( not ( = ?auto_1356922 ?auto_1356930 ) ) ( not ( = ?auto_1356922 ?auto_1356932 ) ) ( not ( = ?auto_1356923 ?auto_1356925 ) ) ( not ( = ?auto_1356923 ?auto_1356924 ) ) ( not ( = ?auto_1356923 ?auto_1356926 ) ) ( not ( = ?auto_1356923 ?auto_1356927 ) ) ( not ( = ?auto_1356923 ?auto_1356928 ) ) ( not ( = ?auto_1356923 ?auto_1356929 ) ) ( not ( = ?auto_1356923 ?auto_1356930 ) ) ( not ( = ?auto_1356923 ?auto_1356932 ) ) ( not ( = ?auto_1356925 ?auto_1356924 ) ) ( not ( = ?auto_1356925 ?auto_1356926 ) ) ( not ( = ?auto_1356925 ?auto_1356927 ) ) ( not ( = ?auto_1356925 ?auto_1356928 ) ) ( not ( = ?auto_1356925 ?auto_1356929 ) ) ( not ( = ?auto_1356925 ?auto_1356930 ) ) ( not ( = ?auto_1356925 ?auto_1356932 ) ) ( not ( = ?auto_1356924 ?auto_1356926 ) ) ( not ( = ?auto_1356924 ?auto_1356927 ) ) ( not ( = ?auto_1356924 ?auto_1356928 ) ) ( not ( = ?auto_1356924 ?auto_1356929 ) ) ( not ( = ?auto_1356924 ?auto_1356930 ) ) ( not ( = ?auto_1356924 ?auto_1356932 ) ) ( not ( = ?auto_1356926 ?auto_1356927 ) ) ( not ( = ?auto_1356926 ?auto_1356928 ) ) ( not ( = ?auto_1356926 ?auto_1356929 ) ) ( not ( = ?auto_1356926 ?auto_1356930 ) ) ( not ( = ?auto_1356926 ?auto_1356932 ) ) ( not ( = ?auto_1356927 ?auto_1356928 ) ) ( not ( = ?auto_1356927 ?auto_1356929 ) ) ( not ( = ?auto_1356927 ?auto_1356930 ) ) ( not ( = ?auto_1356927 ?auto_1356932 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1356928 ?auto_1356929 ?auto_1356930 )
      ( MAKE-9CRATE-VERIFY ?auto_1356921 ?auto_1356922 ?auto_1356923 ?auto_1356925 ?auto_1356924 ?auto_1356926 ?auto_1356927 ?auto_1356928 ?auto_1356929 ?auto_1356930 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1357739 - SURFACE
      ?auto_1357740 - SURFACE
    )
    :vars
    (
      ?auto_1357744 - HOIST
      ?auto_1357742 - PLACE
      ?auto_1357747 - SURFACE
      ?auto_1357745 - PLACE
      ?auto_1357741 - HOIST
      ?auto_1357743 - SURFACE
      ?auto_1357746 - TRUCK
      ?auto_1357748 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1357744 ?auto_1357742 ) ( SURFACE-AT ?auto_1357739 ?auto_1357742 ) ( CLEAR ?auto_1357739 ) ( IS-CRATE ?auto_1357740 ) ( not ( = ?auto_1357739 ?auto_1357740 ) ) ( ON ?auto_1357739 ?auto_1357747 ) ( not ( = ?auto_1357747 ?auto_1357739 ) ) ( not ( = ?auto_1357747 ?auto_1357740 ) ) ( not ( = ?auto_1357745 ?auto_1357742 ) ) ( HOIST-AT ?auto_1357741 ?auto_1357745 ) ( not ( = ?auto_1357744 ?auto_1357741 ) ) ( AVAILABLE ?auto_1357741 ) ( SURFACE-AT ?auto_1357740 ?auto_1357745 ) ( ON ?auto_1357740 ?auto_1357743 ) ( CLEAR ?auto_1357740 ) ( not ( = ?auto_1357739 ?auto_1357743 ) ) ( not ( = ?auto_1357740 ?auto_1357743 ) ) ( not ( = ?auto_1357747 ?auto_1357743 ) ) ( TRUCK-AT ?auto_1357746 ?auto_1357742 ) ( LIFTING ?auto_1357744 ?auto_1357748 ) ( IS-CRATE ?auto_1357748 ) ( not ( = ?auto_1357739 ?auto_1357748 ) ) ( not ( = ?auto_1357740 ?auto_1357748 ) ) ( not ( = ?auto_1357747 ?auto_1357748 ) ) ( not ( = ?auto_1357743 ?auto_1357748 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1357744 ?auto_1357748 ?auto_1357746 ?auto_1357742 )
      ( MAKE-1CRATE ?auto_1357739 ?auto_1357740 )
      ( MAKE-1CRATE-VERIFY ?auto_1357739 ?auto_1357740 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1362470 - SURFACE
      ?auto_1362471 - SURFACE
      ?auto_1362472 - SURFACE
      ?auto_1362474 - SURFACE
      ?auto_1362473 - SURFACE
      ?auto_1362475 - SURFACE
      ?auto_1362476 - SURFACE
      ?auto_1362477 - SURFACE
      ?auto_1362478 - SURFACE
      ?auto_1362479 - SURFACE
      ?auto_1362480 - SURFACE
    )
    :vars
    (
      ?auto_1362481 - HOIST
      ?auto_1362482 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1362481 ?auto_1362482 ) ( SURFACE-AT ?auto_1362479 ?auto_1362482 ) ( CLEAR ?auto_1362479 ) ( LIFTING ?auto_1362481 ?auto_1362480 ) ( IS-CRATE ?auto_1362480 ) ( not ( = ?auto_1362479 ?auto_1362480 ) ) ( ON ?auto_1362471 ?auto_1362470 ) ( ON ?auto_1362472 ?auto_1362471 ) ( ON ?auto_1362474 ?auto_1362472 ) ( ON ?auto_1362473 ?auto_1362474 ) ( ON ?auto_1362475 ?auto_1362473 ) ( ON ?auto_1362476 ?auto_1362475 ) ( ON ?auto_1362477 ?auto_1362476 ) ( ON ?auto_1362478 ?auto_1362477 ) ( ON ?auto_1362479 ?auto_1362478 ) ( not ( = ?auto_1362470 ?auto_1362471 ) ) ( not ( = ?auto_1362470 ?auto_1362472 ) ) ( not ( = ?auto_1362470 ?auto_1362474 ) ) ( not ( = ?auto_1362470 ?auto_1362473 ) ) ( not ( = ?auto_1362470 ?auto_1362475 ) ) ( not ( = ?auto_1362470 ?auto_1362476 ) ) ( not ( = ?auto_1362470 ?auto_1362477 ) ) ( not ( = ?auto_1362470 ?auto_1362478 ) ) ( not ( = ?auto_1362470 ?auto_1362479 ) ) ( not ( = ?auto_1362470 ?auto_1362480 ) ) ( not ( = ?auto_1362471 ?auto_1362472 ) ) ( not ( = ?auto_1362471 ?auto_1362474 ) ) ( not ( = ?auto_1362471 ?auto_1362473 ) ) ( not ( = ?auto_1362471 ?auto_1362475 ) ) ( not ( = ?auto_1362471 ?auto_1362476 ) ) ( not ( = ?auto_1362471 ?auto_1362477 ) ) ( not ( = ?auto_1362471 ?auto_1362478 ) ) ( not ( = ?auto_1362471 ?auto_1362479 ) ) ( not ( = ?auto_1362471 ?auto_1362480 ) ) ( not ( = ?auto_1362472 ?auto_1362474 ) ) ( not ( = ?auto_1362472 ?auto_1362473 ) ) ( not ( = ?auto_1362472 ?auto_1362475 ) ) ( not ( = ?auto_1362472 ?auto_1362476 ) ) ( not ( = ?auto_1362472 ?auto_1362477 ) ) ( not ( = ?auto_1362472 ?auto_1362478 ) ) ( not ( = ?auto_1362472 ?auto_1362479 ) ) ( not ( = ?auto_1362472 ?auto_1362480 ) ) ( not ( = ?auto_1362474 ?auto_1362473 ) ) ( not ( = ?auto_1362474 ?auto_1362475 ) ) ( not ( = ?auto_1362474 ?auto_1362476 ) ) ( not ( = ?auto_1362474 ?auto_1362477 ) ) ( not ( = ?auto_1362474 ?auto_1362478 ) ) ( not ( = ?auto_1362474 ?auto_1362479 ) ) ( not ( = ?auto_1362474 ?auto_1362480 ) ) ( not ( = ?auto_1362473 ?auto_1362475 ) ) ( not ( = ?auto_1362473 ?auto_1362476 ) ) ( not ( = ?auto_1362473 ?auto_1362477 ) ) ( not ( = ?auto_1362473 ?auto_1362478 ) ) ( not ( = ?auto_1362473 ?auto_1362479 ) ) ( not ( = ?auto_1362473 ?auto_1362480 ) ) ( not ( = ?auto_1362475 ?auto_1362476 ) ) ( not ( = ?auto_1362475 ?auto_1362477 ) ) ( not ( = ?auto_1362475 ?auto_1362478 ) ) ( not ( = ?auto_1362475 ?auto_1362479 ) ) ( not ( = ?auto_1362475 ?auto_1362480 ) ) ( not ( = ?auto_1362476 ?auto_1362477 ) ) ( not ( = ?auto_1362476 ?auto_1362478 ) ) ( not ( = ?auto_1362476 ?auto_1362479 ) ) ( not ( = ?auto_1362476 ?auto_1362480 ) ) ( not ( = ?auto_1362477 ?auto_1362478 ) ) ( not ( = ?auto_1362477 ?auto_1362479 ) ) ( not ( = ?auto_1362477 ?auto_1362480 ) ) ( not ( = ?auto_1362478 ?auto_1362479 ) ) ( not ( = ?auto_1362478 ?auto_1362480 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1362479 ?auto_1362480 )
      ( MAKE-10CRATE-VERIFY ?auto_1362470 ?auto_1362471 ?auto_1362472 ?auto_1362474 ?auto_1362473 ?auto_1362475 ?auto_1362476 ?auto_1362477 ?auto_1362478 ?auto_1362479 ?auto_1362480 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1362564 - SURFACE
      ?auto_1362565 - SURFACE
      ?auto_1362566 - SURFACE
      ?auto_1362568 - SURFACE
      ?auto_1362567 - SURFACE
      ?auto_1362569 - SURFACE
      ?auto_1362570 - SURFACE
      ?auto_1362571 - SURFACE
      ?auto_1362572 - SURFACE
      ?auto_1362573 - SURFACE
      ?auto_1362574 - SURFACE
    )
    :vars
    (
      ?auto_1362575 - HOIST
      ?auto_1362577 - PLACE
      ?auto_1362576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1362575 ?auto_1362577 ) ( SURFACE-AT ?auto_1362573 ?auto_1362577 ) ( CLEAR ?auto_1362573 ) ( IS-CRATE ?auto_1362574 ) ( not ( = ?auto_1362573 ?auto_1362574 ) ) ( TRUCK-AT ?auto_1362576 ?auto_1362577 ) ( AVAILABLE ?auto_1362575 ) ( IN ?auto_1362574 ?auto_1362576 ) ( ON ?auto_1362573 ?auto_1362572 ) ( not ( = ?auto_1362572 ?auto_1362573 ) ) ( not ( = ?auto_1362572 ?auto_1362574 ) ) ( ON ?auto_1362565 ?auto_1362564 ) ( ON ?auto_1362566 ?auto_1362565 ) ( ON ?auto_1362568 ?auto_1362566 ) ( ON ?auto_1362567 ?auto_1362568 ) ( ON ?auto_1362569 ?auto_1362567 ) ( ON ?auto_1362570 ?auto_1362569 ) ( ON ?auto_1362571 ?auto_1362570 ) ( ON ?auto_1362572 ?auto_1362571 ) ( not ( = ?auto_1362564 ?auto_1362565 ) ) ( not ( = ?auto_1362564 ?auto_1362566 ) ) ( not ( = ?auto_1362564 ?auto_1362568 ) ) ( not ( = ?auto_1362564 ?auto_1362567 ) ) ( not ( = ?auto_1362564 ?auto_1362569 ) ) ( not ( = ?auto_1362564 ?auto_1362570 ) ) ( not ( = ?auto_1362564 ?auto_1362571 ) ) ( not ( = ?auto_1362564 ?auto_1362572 ) ) ( not ( = ?auto_1362564 ?auto_1362573 ) ) ( not ( = ?auto_1362564 ?auto_1362574 ) ) ( not ( = ?auto_1362565 ?auto_1362566 ) ) ( not ( = ?auto_1362565 ?auto_1362568 ) ) ( not ( = ?auto_1362565 ?auto_1362567 ) ) ( not ( = ?auto_1362565 ?auto_1362569 ) ) ( not ( = ?auto_1362565 ?auto_1362570 ) ) ( not ( = ?auto_1362565 ?auto_1362571 ) ) ( not ( = ?auto_1362565 ?auto_1362572 ) ) ( not ( = ?auto_1362565 ?auto_1362573 ) ) ( not ( = ?auto_1362565 ?auto_1362574 ) ) ( not ( = ?auto_1362566 ?auto_1362568 ) ) ( not ( = ?auto_1362566 ?auto_1362567 ) ) ( not ( = ?auto_1362566 ?auto_1362569 ) ) ( not ( = ?auto_1362566 ?auto_1362570 ) ) ( not ( = ?auto_1362566 ?auto_1362571 ) ) ( not ( = ?auto_1362566 ?auto_1362572 ) ) ( not ( = ?auto_1362566 ?auto_1362573 ) ) ( not ( = ?auto_1362566 ?auto_1362574 ) ) ( not ( = ?auto_1362568 ?auto_1362567 ) ) ( not ( = ?auto_1362568 ?auto_1362569 ) ) ( not ( = ?auto_1362568 ?auto_1362570 ) ) ( not ( = ?auto_1362568 ?auto_1362571 ) ) ( not ( = ?auto_1362568 ?auto_1362572 ) ) ( not ( = ?auto_1362568 ?auto_1362573 ) ) ( not ( = ?auto_1362568 ?auto_1362574 ) ) ( not ( = ?auto_1362567 ?auto_1362569 ) ) ( not ( = ?auto_1362567 ?auto_1362570 ) ) ( not ( = ?auto_1362567 ?auto_1362571 ) ) ( not ( = ?auto_1362567 ?auto_1362572 ) ) ( not ( = ?auto_1362567 ?auto_1362573 ) ) ( not ( = ?auto_1362567 ?auto_1362574 ) ) ( not ( = ?auto_1362569 ?auto_1362570 ) ) ( not ( = ?auto_1362569 ?auto_1362571 ) ) ( not ( = ?auto_1362569 ?auto_1362572 ) ) ( not ( = ?auto_1362569 ?auto_1362573 ) ) ( not ( = ?auto_1362569 ?auto_1362574 ) ) ( not ( = ?auto_1362570 ?auto_1362571 ) ) ( not ( = ?auto_1362570 ?auto_1362572 ) ) ( not ( = ?auto_1362570 ?auto_1362573 ) ) ( not ( = ?auto_1362570 ?auto_1362574 ) ) ( not ( = ?auto_1362571 ?auto_1362572 ) ) ( not ( = ?auto_1362571 ?auto_1362573 ) ) ( not ( = ?auto_1362571 ?auto_1362574 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1362572 ?auto_1362573 ?auto_1362574 )
      ( MAKE-10CRATE-VERIFY ?auto_1362564 ?auto_1362565 ?auto_1362566 ?auto_1362568 ?auto_1362567 ?auto_1362569 ?auto_1362570 ?auto_1362571 ?auto_1362572 ?auto_1362573 ?auto_1362574 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1362669 - SURFACE
      ?auto_1362670 - SURFACE
      ?auto_1362671 - SURFACE
      ?auto_1362673 - SURFACE
      ?auto_1362672 - SURFACE
      ?auto_1362674 - SURFACE
      ?auto_1362675 - SURFACE
      ?auto_1362676 - SURFACE
      ?auto_1362677 - SURFACE
      ?auto_1362678 - SURFACE
      ?auto_1362679 - SURFACE
    )
    :vars
    (
      ?auto_1362683 - HOIST
      ?auto_1362680 - PLACE
      ?auto_1362682 - TRUCK
      ?auto_1362681 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1362683 ?auto_1362680 ) ( SURFACE-AT ?auto_1362678 ?auto_1362680 ) ( CLEAR ?auto_1362678 ) ( IS-CRATE ?auto_1362679 ) ( not ( = ?auto_1362678 ?auto_1362679 ) ) ( AVAILABLE ?auto_1362683 ) ( IN ?auto_1362679 ?auto_1362682 ) ( ON ?auto_1362678 ?auto_1362677 ) ( not ( = ?auto_1362677 ?auto_1362678 ) ) ( not ( = ?auto_1362677 ?auto_1362679 ) ) ( TRUCK-AT ?auto_1362682 ?auto_1362681 ) ( not ( = ?auto_1362681 ?auto_1362680 ) ) ( ON ?auto_1362670 ?auto_1362669 ) ( ON ?auto_1362671 ?auto_1362670 ) ( ON ?auto_1362673 ?auto_1362671 ) ( ON ?auto_1362672 ?auto_1362673 ) ( ON ?auto_1362674 ?auto_1362672 ) ( ON ?auto_1362675 ?auto_1362674 ) ( ON ?auto_1362676 ?auto_1362675 ) ( ON ?auto_1362677 ?auto_1362676 ) ( not ( = ?auto_1362669 ?auto_1362670 ) ) ( not ( = ?auto_1362669 ?auto_1362671 ) ) ( not ( = ?auto_1362669 ?auto_1362673 ) ) ( not ( = ?auto_1362669 ?auto_1362672 ) ) ( not ( = ?auto_1362669 ?auto_1362674 ) ) ( not ( = ?auto_1362669 ?auto_1362675 ) ) ( not ( = ?auto_1362669 ?auto_1362676 ) ) ( not ( = ?auto_1362669 ?auto_1362677 ) ) ( not ( = ?auto_1362669 ?auto_1362678 ) ) ( not ( = ?auto_1362669 ?auto_1362679 ) ) ( not ( = ?auto_1362670 ?auto_1362671 ) ) ( not ( = ?auto_1362670 ?auto_1362673 ) ) ( not ( = ?auto_1362670 ?auto_1362672 ) ) ( not ( = ?auto_1362670 ?auto_1362674 ) ) ( not ( = ?auto_1362670 ?auto_1362675 ) ) ( not ( = ?auto_1362670 ?auto_1362676 ) ) ( not ( = ?auto_1362670 ?auto_1362677 ) ) ( not ( = ?auto_1362670 ?auto_1362678 ) ) ( not ( = ?auto_1362670 ?auto_1362679 ) ) ( not ( = ?auto_1362671 ?auto_1362673 ) ) ( not ( = ?auto_1362671 ?auto_1362672 ) ) ( not ( = ?auto_1362671 ?auto_1362674 ) ) ( not ( = ?auto_1362671 ?auto_1362675 ) ) ( not ( = ?auto_1362671 ?auto_1362676 ) ) ( not ( = ?auto_1362671 ?auto_1362677 ) ) ( not ( = ?auto_1362671 ?auto_1362678 ) ) ( not ( = ?auto_1362671 ?auto_1362679 ) ) ( not ( = ?auto_1362673 ?auto_1362672 ) ) ( not ( = ?auto_1362673 ?auto_1362674 ) ) ( not ( = ?auto_1362673 ?auto_1362675 ) ) ( not ( = ?auto_1362673 ?auto_1362676 ) ) ( not ( = ?auto_1362673 ?auto_1362677 ) ) ( not ( = ?auto_1362673 ?auto_1362678 ) ) ( not ( = ?auto_1362673 ?auto_1362679 ) ) ( not ( = ?auto_1362672 ?auto_1362674 ) ) ( not ( = ?auto_1362672 ?auto_1362675 ) ) ( not ( = ?auto_1362672 ?auto_1362676 ) ) ( not ( = ?auto_1362672 ?auto_1362677 ) ) ( not ( = ?auto_1362672 ?auto_1362678 ) ) ( not ( = ?auto_1362672 ?auto_1362679 ) ) ( not ( = ?auto_1362674 ?auto_1362675 ) ) ( not ( = ?auto_1362674 ?auto_1362676 ) ) ( not ( = ?auto_1362674 ?auto_1362677 ) ) ( not ( = ?auto_1362674 ?auto_1362678 ) ) ( not ( = ?auto_1362674 ?auto_1362679 ) ) ( not ( = ?auto_1362675 ?auto_1362676 ) ) ( not ( = ?auto_1362675 ?auto_1362677 ) ) ( not ( = ?auto_1362675 ?auto_1362678 ) ) ( not ( = ?auto_1362675 ?auto_1362679 ) ) ( not ( = ?auto_1362676 ?auto_1362677 ) ) ( not ( = ?auto_1362676 ?auto_1362678 ) ) ( not ( = ?auto_1362676 ?auto_1362679 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1362677 ?auto_1362678 ?auto_1362679 )
      ( MAKE-10CRATE-VERIFY ?auto_1362669 ?auto_1362670 ?auto_1362671 ?auto_1362673 ?auto_1362672 ?auto_1362674 ?auto_1362675 ?auto_1362676 ?auto_1362677 ?auto_1362678 ?auto_1362679 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1362784 - SURFACE
      ?auto_1362785 - SURFACE
      ?auto_1362786 - SURFACE
      ?auto_1362788 - SURFACE
      ?auto_1362787 - SURFACE
      ?auto_1362789 - SURFACE
      ?auto_1362790 - SURFACE
      ?auto_1362791 - SURFACE
      ?auto_1362792 - SURFACE
      ?auto_1362793 - SURFACE
      ?auto_1362794 - SURFACE
    )
    :vars
    (
      ?auto_1362798 - HOIST
      ?auto_1362796 - PLACE
      ?auto_1362795 - TRUCK
      ?auto_1362799 - PLACE
      ?auto_1362797 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1362798 ?auto_1362796 ) ( SURFACE-AT ?auto_1362793 ?auto_1362796 ) ( CLEAR ?auto_1362793 ) ( IS-CRATE ?auto_1362794 ) ( not ( = ?auto_1362793 ?auto_1362794 ) ) ( AVAILABLE ?auto_1362798 ) ( ON ?auto_1362793 ?auto_1362792 ) ( not ( = ?auto_1362792 ?auto_1362793 ) ) ( not ( = ?auto_1362792 ?auto_1362794 ) ) ( TRUCK-AT ?auto_1362795 ?auto_1362799 ) ( not ( = ?auto_1362799 ?auto_1362796 ) ) ( HOIST-AT ?auto_1362797 ?auto_1362799 ) ( LIFTING ?auto_1362797 ?auto_1362794 ) ( not ( = ?auto_1362798 ?auto_1362797 ) ) ( ON ?auto_1362785 ?auto_1362784 ) ( ON ?auto_1362786 ?auto_1362785 ) ( ON ?auto_1362788 ?auto_1362786 ) ( ON ?auto_1362787 ?auto_1362788 ) ( ON ?auto_1362789 ?auto_1362787 ) ( ON ?auto_1362790 ?auto_1362789 ) ( ON ?auto_1362791 ?auto_1362790 ) ( ON ?auto_1362792 ?auto_1362791 ) ( not ( = ?auto_1362784 ?auto_1362785 ) ) ( not ( = ?auto_1362784 ?auto_1362786 ) ) ( not ( = ?auto_1362784 ?auto_1362788 ) ) ( not ( = ?auto_1362784 ?auto_1362787 ) ) ( not ( = ?auto_1362784 ?auto_1362789 ) ) ( not ( = ?auto_1362784 ?auto_1362790 ) ) ( not ( = ?auto_1362784 ?auto_1362791 ) ) ( not ( = ?auto_1362784 ?auto_1362792 ) ) ( not ( = ?auto_1362784 ?auto_1362793 ) ) ( not ( = ?auto_1362784 ?auto_1362794 ) ) ( not ( = ?auto_1362785 ?auto_1362786 ) ) ( not ( = ?auto_1362785 ?auto_1362788 ) ) ( not ( = ?auto_1362785 ?auto_1362787 ) ) ( not ( = ?auto_1362785 ?auto_1362789 ) ) ( not ( = ?auto_1362785 ?auto_1362790 ) ) ( not ( = ?auto_1362785 ?auto_1362791 ) ) ( not ( = ?auto_1362785 ?auto_1362792 ) ) ( not ( = ?auto_1362785 ?auto_1362793 ) ) ( not ( = ?auto_1362785 ?auto_1362794 ) ) ( not ( = ?auto_1362786 ?auto_1362788 ) ) ( not ( = ?auto_1362786 ?auto_1362787 ) ) ( not ( = ?auto_1362786 ?auto_1362789 ) ) ( not ( = ?auto_1362786 ?auto_1362790 ) ) ( not ( = ?auto_1362786 ?auto_1362791 ) ) ( not ( = ?auto_1362786 ?auto_1362792 ) ) ( not ( = ?auto_1362786 ?auto_1362793 ) ) ( not ( = ?auto_1362786 ?auto_1362794 ) ) ( not ( = ?auto_1362788 ?auto_1362787 ) ) ( not ( = ?auto_1362788 ?auto_1362789 ) ) ( not ( = ?auto_1362788 ?auto_1362790 ) ) ( not ( = ?auto_1362788 ?auto_1362791 ) ) ( not ( = ?auto_1362788 ?auto_1362792 ) ) ( not ( = ?auto_1362788 ?auto_1362793 ) ) ( not ( = ?auto_1362788 ?auto_1362794 ) ) ( not ( = ?auto_1362787 ?auto_1362789 ) ) ( not ( = ?auto_1362787 ?auto_1362790 ) ) ( not ( = ?auto_1362787 ?auto_1362791 ) ) ( not ( = ?auto_1362787 ?auto_1362792 ) ) ( not ( = ?auto_1362787 ?auto_1362793 ) ) ( not ( = ?auto_1362787 ?auto_1362794 ) ) ( not ( = ?auto_1362789 ?auto_1362790 ) ) ( not ( = ?auto_1362789 ?auto_1362791 ) ) ( not ( = ?auto_1362789 ?auto_1362792 ) ) ( not ( = ?auto_1362789 ?auto_1362793 ) ) ( not ( = ?auto_1362789 ?auto_1362794 ) ) ( not ( = ?auto_1362790 ?auto_1362791 ) ) ( not ( = ?auto_1362790 ?auto_1362792 ) ) ( not ( = ?auto_1362790 ?auto_1362793 ) ) ( not ( = ?auto_1362790 ?auto_1362794 ) ) ( not ( = ?auto_1362791 ?auto_1362792 ) ) ( not ( = ?auto_1362791 ?auto_1362793 ) ) ( not ( = ?auto_1362791 ?auto_1362794 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1362792 ?auto_1362793 ?auto_1362794 )
      ( MAKE-10CRATE-VERIFY ?auto_1362784 ?auto_1362785 ?auto_1362786 ?auto_1362788 ?auto_1362787 ?auto_1362789 ?auto_1362790 ?auto_1362791 ?auto_1362792 ?auto_1362793 ?auto_1362794 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1362909 - SURFACE
      ?auto_1362910 - SURFACE
      ?auto_1362911 - SURFACE
      ?auto_1362913 - SURFACE
      ?auto_1362912 - SURFACE
      ?auto_1362914 - SURFACE
      ?auto_1362915 - SURFACE
      ?auto_1362916 - SURFACE
      ?auto_1362917 - SURFACE
      ?auto_1362918 - SURFACE
      ?auto_1362919 - SURFACE
    )
    :vars
    (
      ?auto_1362921 - HOIST
      ?auto_1362922 - PLACE
      ?auto_1362924 - TRUCK
      ?auto_1362925 - PLACE
      ?auto_1362923 - HOIST
      ?auto_1362920 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1362921 ?auto_1362922 ) ( SURFACE-AT ?auto_1362918 ?auto_1362922 ) ( CLEAR ?auto_1362918 ) ( IS-CRATE ?auto_1362919 ) ( not ( = ?auto_1362918 ?auto_1362919 ) ) ( AVAILABLE ?auto_1362921 ) ( ON ?auto_1362918 ?auto_1362917 ) ( not ( = ?auto_1362917 ?auto_1362918 ) ) ( not ( = ?auto_1362917 ?auto_1362919 ) ) ( TRUCK-AT ?auto_1362924 ?auto_1362925 ) ( not ( = ?auto_1362925 ?auto_1362922 ) ) ( HOIST-AT ?auto_1362923 ?auto_1362925 ) ( not ( = ?auto_1362921 ?auto_1362923 ) ) ( AVAILABLE ?auto_1362923 ) ( SURFACE-AT ?auto_1362919 ?auto_1362925 ) ( ON ?auto_1362919 ?auto_1362920 ) ( CLEAR ?auto_1362919 ) ( not ( = ?auto_1362918 ?auto_1362920 ) ) ( not ( = ?auto_1362919 ?auto_1362920 ) ) ( not ( = ?auto_1362917 ?auto_1362920 ) ) ( ON ?auto_1362910 ?auto_1362909 ) ( ON ?auto_1362911 ?auto_1362910 ) ( ON ?auto_1362913 ?auto_1362911 ) ( ON ?auto_1362912 ?auto_1362913 ) ( ON ?auto_1362914 ?auto_1362912 ) ( ON ?auto_1362915 ?auto_1362914 ) ( ON ?auto_1362916 ?auto_1362915 ) ( ON ?auto_1362917 ?auto_1362916 ) ( not ( = ?auto_1362909 ?auto_1362910 ) ) ( not ( = ?auto_1362909 ?auto_1362911 ) ) ( not ( = ?auto_1362909 ?auto_1362913 ) ) ( not ( = ?auto_1362909 ?auto_1362912 ) ) ( not ( = ?auto_1362909 ?auto_1362914 ) ) ( not ( = ?auto_1362909 ?auto_1362915 ) ) ( not ( = ?auto_1362909 ?auto_1362916 ) ) ( not ( = ?auto_1362909 ?auto_1362917 ) ) ( not ( = ?auto_1362909 ?auto_1362918 ) ) ( not ( = ?auto_1362909 ?auto_1362919 ) ) ( not ( = ?auto_1362909 ?auto_1362920 ) ) ( not ( = ?auto_1362910 ?auto_1362911 ) ) ( not ( = ?auto_1362910 ?auto_1362913 ) ) ( not ( = ?auto_1362910 ?auto_1362912 ) ) ( not ( = ?auto_1362910 ?auto_1362914 ) ) ( not ( = ?auto_1362910 ?auto_1362915 ) ) ( not ( = ?auto_1362910 ?auto_1362916 ) ) ( not ( = ?auto_1362910 ?auto_1362917 ) ) ( not ( = ?auto_1362910 ?auto_1362918 ) ) ( not ( = ?auto_1362910 ?auto_1362919 ) ) ( not ( = ?auto_1362910 ?auto_1362920 ) ) ( not ( = ?auto_1362911 ?auto_1362913 ) ) ( not ( = ?auto_1362911 ?auto_1362912 ) ) ( not ( = ?auto_1362911 ?auto_1362914 ) ) ( not ( = ?auto_1362911 ?auto_1362915 ) ) ( not ( = ?auto_1362911 ?auto_1362916 ) ) ( not ( = ?auto_1362911 ?auto_1362917 ) ) ( not ( = ?auto_1362911 ?auto_1362918 ) ) ( not ( = ?auto_1362911 ?auto_1362919 ) ) ( not ( = ?auto_1362911 ?auto_1362920 ) ) ( not ( = ?auto_1362913 ?auto_1362912 ) ) ( not ( = ?auto_1362913 ?auto_1362914 ) ) ( not ( = ?auto_1362913 ?auto_1362915 ) ) ( not ( = ?auto_1362913 ?auto_1362916 ) ) ( not ( = ?auto_1362913 ?auto_1362917 ) ) ( not ( = ?auto_1362913 ?auto_1362918 ) ) ( not ( = ?auto_1362913 ?auto_1362919 ) ) ( not ( = ?auto_1362913 ?auto_1362920 ) ) ( not ( = ?auto_1362912 ?auto_1362914 ) ) ( not ( = ?auto_1362912 ?auto_1362915 ) ) ( not ( = ?auto_1362912 ?auto_1362916 ) ) ( not ( = ?auto_1362912 ?auto_1362917 ) ) ( not ( = ?auto_1362912 ?auto_1362918 ) ) ( not ( = ?auto_1362912 ?auto_1362919 ) ) ( not ( = ?auto_1362912 ?auto_1362920 ) ) ( not ( = ?auto_1362914 ?auto_1362915 ) ) ( not ( = ?auto_1362914 ?auto_1362916 ) ) ( not ( = ?auto_1362914 ?auto_1362917 ) ) ( not ( = ?auto_1362914 ?auto_1362918 ) ) ( not ( = ?auto_1362914 ?auto_1362919 ) ) ( not ( = ?auto_1362914 ?auto_1362920 ) ) ( not ( = ?auto_1362915 ?auto_1362916 ) ) ( not ( = ?auto_1362915 ?auto_1362917 ) ) ( not ( = ?auto_1362915 ?auto_1362918 ) ) ( not ( = ?auto_1362915 ?auto_1362919 ) ) ( not ( = ?auto_1362915 ?auto_1362920 ) ) ( not ( = ?auto_1362916 ?auto_1362917 ) ) ( not ( = ?auto_1362916 ?auto_1362918 ) ) ( not ( = ?auto_1362916 ?auto_1362919 ) ) ( not ( = ?auto_1362916 ?auto_1362920 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1362917 ?auto_1362918 ?auto_1362919 )
      ( MAKE-10CRATE-VERIFY ?auto_1362909 ?auto_1362910 ?auto_1362911 ?auto_1362913 ?auto_1362912 ?auto_1362914 ?auto_1362915 ?auto_1362916 ?auto_1362917 ?auto_1362918 ?auto_1362919 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1363035 - SURFACE
      ?auto_1363036 - SURFACE
      ?auto_1363037 - SURFACE
      ?auto_1363039 - SURFACE
      ?auto_1363038 - SURFACE
      ?auto_1363040 - SURFACE
      ?auto_1363041 - SURFACE
      ?auto_1363042 - SURFACE
      ?auto_1363043 - SURFACE
      ?auto_1363044 - SURFACE
      ?auto_1363045 - SURFACE
    )
    :vars
    (
      ?auto_1363049 - HOIST
      ?auto_1363050 - PLACE
      ?auto_1363048 - PLACE
      ?auto_1363046 - HOIST
      ?auto_1363047 - SURFACE
      ?auto_1363051 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1363049 ?auto_1363050 ) ( SURFACE-AT ?auto_1363044 ?auto_1363050 ) ( CLEAR ?auto_1363044 ) ( IS-CRATE ?auto_1363045 ) ( not ( = ?auto_1363044 ?auto_1363045 ) ) ( AVAILABLE ?auto_1363049 ) ( ON ?auto_1363044 ?auto_1363043 ) ( not ( = ?auto_1363043 ?auto_1363044 ) ) ( not ( = ?auto_1363043 ?auto_1363045 ) ) ( not ( = ?auto_1363048 ?auto_1363050 ) ) ( HOIST-AT ?auto_1363046 ?auto_1363048 ) ( not ( = ?auto_1363049 ?auto_1363046 ) ) ( AVAILABLE ?auto_1363046 ) ( SURFACE-AT ?auto_1363045 ?auto_1363048 ) ( ON ?auto_1363045 ?auto_1363047 ) ( CLEAR ?auto_1363045 ) ( not ( = ?auto_1363044 ?auto_1363047 ) ) ( not ( = ?auto_1363045 ?auto_1363047 ) ) ( not ( = ?auto_1363043 ?auto_1363047 ) ) ( TRUCK-AT ?auto_1363051 ?auto_1363050 ) ( ON ?auto_1363036 ?auto_1363035 ) ( ON ?auto_1363037 ?auto_1363036 ) ( ON ?auto_1363039 ?auto_1363037 ) ( ON ?auto_1363038 ?auto_1363039 ) ( ON ?auto_1363040 ?auto_1363038 ) ( ON ?auto_1363041 ?auto_1363040 ) ( ON ?auto_1363042 ?auto_1363041 ) ( ON ?auto_1363043 ?auto_1363042 ) ( not ( = ?auto_1363035 ?auto_1363036 ) ) ( not ( = ?auto_1363035 ?auto_1363037 ) ) ( not ( = ?auto_1363035 ?auto_1363039 ) ) ( not ( = ?auto_1363035 ?auto_1363038 ) ) ( not ( = ?auto_1363035 ?auto_1363040 ) ) ( not ( = ?auto_1363035 ?auto_1363041 ) ) ( not ( = ?auto_1363035 ?auto_1363042 ) ) ( not ( = ?auto_1363035 ?auto_1363043 ) ) ( not ( = ?auto_1363035 ?auto_1363044 ) ) ( not ( = ?auto_1363035 ?auto_1363045 ) ) ( not ( = ?auto_1363035 ?auto_1363047 ) ) ( not ( = ?auto_1363036 ?auto_1363037 ) ) ( not ( = ?auto_1363036 ?auto_1363039 ) ) ( not ( = ?auto_1363036 ?auto_1363038 ) ) ( not ( = ?auto_1363036 ?auto_1363040 ) ) ( not ( = ?auto_1363036 ?auto_1363041 ) ) ( not ( = ?auto_1363036 ?auto_1363042 ) ) ( not ( = ?auto_1363036 ?auto_1363043 ) ) ( not ( = ?auto_1363036 ?auto_1363044 ) ) ( not ( = ?auto_1363036 ?auto_1363045 ) ) ( not ( = ?auto_1363036 ?auto_1363047 ) ) ( not ( = ?auto_1363037 ?auto_1363039 ) ) ( not ( = ?auto_1363037 ?auto_1363038 ) ) ( not ( = ?auto_1363037 ?auto_1363040 ) ) ( not ( = ?auto_1363037 ?auto_1363041 ) ) ( not ( = ?auto_1363037 ?auto_1363042 ) ) ( not ( = ?auto_1363037 ?auto_1363043 ) ) ( not ( = ?auto_1363037 ?auto_1363044 ) ) ( not ( = ?auto_1363037 ?auto_1363045 ) ) ( not ( = ?auto_1363037 ?auto_1363047 ) ) ( not ( = ?auto_1363039 ?auto_1363038 ) ) ( not ( = ?auto_1363039 ?auto_1363040 ) ) ( not ( = ?auto_1363039 ?auto_1363041 ) ) ( not ( = ?auto_1363039 ?auto_1363042 ) ) ( not ( = ?auto_1363039 ?auto_1363043 ) ) ( not ( = ?auto_1363039 ?auto_1363044 ) ) ( not ( = ?auto_1363039 ?auto_1363045 ) ) ( not ( = ?auto_1363039 ?auto_1363047 ) ) ( not ( = ?auto_1363038 ?auto_1363040 ) ) ( not ( = ?auto_1363038 ?auto_1363041 ) ) ( not ( = ?auto_1363038 ?auto_1363042 ) ) ( not ( = ?auto_1363038 ?auto_1363043 ) ) ( not ( = ?auto_1363038 ?auto_1363044 ) ) ( not ( = ?auto_1363038 ?auto_1363045 ) ) ( not ( = ?auto_1363038 ?auto_1363047 ) ) ( not ( = ?auto_1363040 ?auto_1363041 ) ) ( not ( = ?auto_1363040 ?auto_1363042 ) ) ( not ( = ?auto_1363040 ?auto_1363043 ) ) ( not ( = ?auto_1363040 ?auto_1363044 ) ) ( not ( = ?auto_1363040 ?auto_1363045 ) ) ( not ( = ?auto_1363040 ?auto_1363047 ) ) ( not ( = ?auto_1363041 ?auto_1363042 ) ) ( not ( = ?auto_1363041 ?auto_1363043 ) ) ( not ( = ?auto_1363041 ?auto_1363044 ) ) ( not ( = ?auto_1363041 ?auto_1363045 ) ) ( not ( = ?auto_1363041 ?auto_1363047 ) ) ( not ( = ?auto_1363042 ?auto_1363043 ) ) ( not ( = ?auto_1363042 ?auto_1363044 ) ) ( not ( = ?auto_1363042 ?auto_1363045 ) ) ( not ( = ?auto_1363042 ?auto_1363047 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1363043 ?auto_1363044 ?auto_1363045 )
      ( MAKE-10CRATE-VERIFY ?auto_1363035 ?auto_1363036 ?auto_1363037 ?auto_1363039 ?auto_1363038 ?auto_1363040 ?auto_1363041 ?auto_1363042 ?auto_1363043 ?auto_1363044 ?auto_1363045 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1363161 - SURFACE
      ?auto_1363162 - SURFACE
      ?auto_1363163 - SURFACE
      ?auto_1363165 - SURFACE
      ?auto_1363164 - SURFACE
      ?auto_1363166 - SURFACE
      ?auto_1363167 - SURFACE
      ?auto_1363168 - SURFACE
      ?auto_1363169 - SURFACE
      ?auto_1363170 - SURFACE
      ?auto_1363171 - SURFACE
    )
    :vars
    (
      ?auto_1363172 - HOIST
      ?auto_1363176 - PLACE
      ?auto_1363175 - PLACE
      ?auto_1363177 - HOIST
      ?auto_1363173 - SURFACE
      ?auto_1363174 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1363172 ?auto_1363176 ) ( IS-CRATE ?auto_1363171 ) ( not ( = ?auto_1363170 ?auto_1363171 ) ) ( not ( = ?auto_1363169 ?auto_1363170 ) ) ( not ( = ?auto_1363169 ?auto_1363171 ) ) ( not ( = ?auto_1363175 ?auto_1363176 ) ) ( HOIST-AT ?auto_1363177 ?auto_1363175 ) ( not ( = ?auto_1363172 ?auto_1363177 ) ) ( AVAILABLE ?auto_1363177 ) ( SURFACE-AT ?auto_1363171 ?auto_1363175 ) ( ON ?auto_1363171 ?auto_1363173 ) ( CLEAR ?auto_1363171 ) ( not ( = ?auto_1363170 ?auto_1363173 ) ) ( not ( = ?auto_1363171 ?auto_1363173 ) ) ( not ( = ?auto_1363169 ?auto_1363173 ) ) ( TRUCK-AT ?auto_1363174 ?auto_1363176 ) ( SURFACE-AT ?auto_1363169 ?auto_1363176 ) ( CLEAR ?auto_1363169 ) ( LIFTING ?auto_1363172 ?auto_1363170 ) ( IS-CRATE ?auto_1363170 ) ( ON ?auto_1363162 ?auto_1363161 ) ( ON ?auto_1363163 ?auto_1363162 ) ( ON ?auto_1363165 ?auto_1363163 ) ( ON ?auto_1363164 ?auto_1363165 ) ( ON ?auto_1363166 ?auto_1363164 ) ( ON ?auto_1363167 ?auto_1363166 ) ( ON ?auto_1363168 ?auto_1363167 ) ( ON ?auto_1363169 ?auto_1363168 ) ( not ( = ?auto_1363161 ?auto_1363162 ) ) ( not ( = ?auto_1363161 ?auto_1363163 ) ) ( not ( = ?auto_1363161 ?auto_1363165 ) ) ( not ( = ?auto_1363161 ?auto_1363164 ) ) ( not ( = ?auto_1363161 ?auto_1363166 ) ) ( not ( = ?auto_1363161 ?auto_1363167 ) ) ( not ( = ?auto_1363161 ?auto_1363168 ) ) ( not ( = ?auto_1363161 ?auto_1363169 ) ) ( not ( = ?auto_1363161 ?auto_1363170 ) ) ( not ( = ?auto_1363161 ?auto_1363171 ) ) ( not ( = ?auto_1363161 ?auto_1363173 ) ) ( not ( = ?auto_1363162 ?auto_1363163 ) ) ( not ( = ?auto_1363162 ?auto_1363165 ) ) ( not ( = ?auto_1363162 ?auto_1363164 ) ) ( not ( = ?auto_1363162 ?auto_1363166 ) ) ( not ( = ?auto_1363162 ?auto_1363167 ) ) ( not ( = ?auto_1363162 ?auto_1363168 ) ) ( not ( = ?auto_1363162 ?auto_1363169 ) ) ( not ( = ?auto_1363162 ?auto_1363170 ) ) ( not ( = ?auto_1363162 ?auto_1363171 ) ) ( not ( = ?auto_1363162 ?auto_1363173 ) ) ( not ( = ?auto_1363163 ?auto_1363165 ) ) ( not ( = ?auto_1363163 ?auto_1363164 ) ) ( not ( = ?auto_1363163 ?auto_1363166 ) ) ( not ( = ?auto_1363163 ?auto_1363167 ) ) ( not ( = ?auto_1363163 ?auto_1363168 ) ) ( not ( = ?auto_1363163 ?auto_1363169 ) ) ( not ( = ?auto_1363163 ?auto_1363170 ) ) ( not ( = ?auto_1363163 ?auto_1363171 ) ) ( not ( = ?auto_1363163 ?auto_1363173 ) ) ( not ( = ?auto_1363165 ?auto_1363164 ) ) ( not ( = ?auto_1363165 ?auto_1363166 ) ) ( not ( = ?auto_1363165 ?auto_1363167 ) ) ( not ( = ?auto_1363165 ?auto_1363168 ) ) ( not ( = ?auto_1363165 ?auto_1363169 ) ) ( not ( = ?auto_1363165 ?auto_1363170 ) ) ( not ( = ?auto_1363165 ?auto_1363171 ) ) ( not ( = ?auto_1363165 ?auto_1363173 ) ) ( not ( = ?auto_1363164 ?auto_1363166 ) ) ( not ( = ?auto_1363164 ?auto_1363167 ) ) ( not ( = ?auto_1363164 ?auto_1363168 ) ) ( not ( = ?auto_1363164 ?auto_1363169 ) ) ( not ( = ?auto_1363164 ?auto_1363170 ) ) ( not ( = ?auto_1363164 ?auto_1363171 ) ) ( not ( = ?auto_1363164 ?auto_1363173 ) ) ( not ( = ?auto_1363166 ?auto_1363167 ) ) ( not ( = ?auto_1363166 ?auto_1363168 ) ) ( not ( = ?auto_1363166 ?auto_1363169 ) ) ( not ( = ?auto_1363166 ?auto_1363170 ) ) ( not ( = ?auto_1363166 ?auto_1363171 ) ) ( not ( = ?auto_1363166 ?auto_1363173 ) ) ( not ( = ?auto_1363167 ?auto_1363168 ) ) ( not ( = ?auto_1363167 ?auto_1363169 ) ) ( not ( = ?auto_1363167 ?auto_1363170 ) ) ( not ( = ?auto_1363167 ?auto_1363171 ) ) ( not ( = ?auto_1363167 ?auto_1363173 ) ) ( not ( = ?auto_1363168 ?auto_1363169 ) ) ( not ( = ?auto_1363168 ?auto_1363170 ) ) ( not ( = ?auto_1363168 ?auto_1363171 ) ) ( not ( = ?auto_1363168 ?auto_1363173 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1363169 ?auto_1363170 ?auto_1363171 )
      ( MAKE-10CRATE-VERIFY ?auto_1363161 ?auto_1363162 ?auto_1363163 ?auto_1363165 ?auto_1363164 ?auto_1363166 ?auto_1363167 ?auto_1363168 ?auto_1363169 ?auto_1363170 ?auto_1363171 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1363287 - SURFACE
      ?auto_1363288 - SURFACE
      ?auto_1363289 - SURFACE
      ?auto_1363291 - SURFACE
      ?auto_1363290 - SURFACE
      ?auto_1363292 - SURFACE
      ?auto_1363293 - SURFACE
      ?auto_1363294 - SURFACE
      ?auto_1363295 - SURFACE
      ?auto_1363296 - SURFACE
      ?auto_1363297 - SURFACE
    )
    :vars
    (
      ?auto_1363302 - HOIST
      ?auto_1363303 - PLACE
      ?auto_1363301 - PLACE
      ?auto_1363300 - HOIST
      ?auto_1363298 - SURFACE
      ?auto_1363299 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1363302 ?auto_1363303 ) ( IS-CRATE ?auto_1363297 ) ( not ( = ?auto_1363296 ?auto_1363297 ) ) ( not ( = ?auto_1363295 ?auto_1363296 ) ) ( not ( = ?auto_1363295 ?auto_1363297 ) ) ( not ( = ?auto_1363301 ?auto_1363303 ) ) ( HOIST-AT ?auto_1363300 ?auto_1363301 ) ( not ( = ?auto_1363302 ?auto_1363300 ) ) ( AVAILABLE ?auto_1363300 ) ( SURFACE-AT ?auto_1363297 ?auto_1363301 ) ( ON ?auto_1363297 ?auto_1363298 ) ( CLEAR ?auto_1363297 ) ( not ( = ?auto_1363296 ?auto_1363298 ) ) ( not ( = ?auto_1363297 ?auto_1363298 ) ) ( not ( = ?auto_1363295 ?auto_1363298 ) ) ( TRUCK-AT ?auto_1363299 ?auto_1363303 ) ( SURFACE-AT ?auto_1363295 ?auto_1363303 ) ( CLEAR ?auto_1363295 ) ( IS-CRATE ?auto_1363296 ) ( AVAILABLE ?auto_1363302 ) ( IN ?auto_1363296 ?auto_1363299 ) ( ON ?auto_1363288 ?auto_1363287 ) ( ON ?auto_1363289 ?auto_1363288 ) ( ON ?auto_1363291 ?auto_1363289 ) ( ON ?auto_1363290 ?auto_1363291 ) ( ON ?auto_1363292 ?auto_1363290 ) ( ON ?auto_1363293 ?auto_1363292 ) ( ON ?auto_1363294 ?auto_1363293 ) ( ON ?auto_1363295 ?auto_1363294 ) ( not ( = ?auto_1363287 ?auto_1363288 ) ) ( not ( = ?auto_1363287 ?auto_1363289 ) ) ( not ( = ?auto_1363287 ?auto_1363291 ) ) ( not ( = ?auto_1363287 ?auto_1363290 ) ) ( not ( = ?auto_1363287 ?auto_1363292 ) ) ( not ( = ?auto_1363287 ?auto_1363293 ) ) ( not ( = ?auto_1363287 ?auto_1363294 ) ) ( not ( = ?auto_1363287 ?auto_1363295 ) ) ( not ( = ?auto_1363287 ?auto_1363296 ) ) ( not ( = ?auto_1363287 ?auto_1363297 ) ) ( not ( = ?auto_1363287 ?auto_1363298 ) ) ( not ( = ?auto_1363288 ?auto_1363289 ) ) ( not ( = ?auto_1363288 ?auto_1363291 ) ) ( not ( = ?auto_1363288 ?auto_1363290 ) ) ( not ( = ?auto_1363288 ?auto_1363292 ) ) ( not ( = ?auto_1363288 ?auto_1363293 ) ) ( not ( = ?auto_1363288 ?auto_1363294 ) ) ( not ( = ?auto_1363288 ?auto_1363295 ) ) ( not ( = ?auto_1363288 ?auto_1363296 ) ) ( not ( = ?auto_1363288 ?auto_1363297 ) ) ( not ( = ?auto_1363288 ?auto_1363298 ) ) ( not ( = ?auto_1363289 ?auto_1363291 ) ) ( not ( = ?auto_1363289 ?auto_1363290 ) ) ( not ( = ?auto_1363289 ?auto_1363292 ) ) ( not ( = ?auto_1363289 ?auto_1363293 ) ) ( not ( = ?auto_1363289 ?auto_1363294 ) ) ( not ( = ?auto_1363289 ?auto_1363295 ) ) ( not ( = ?auto_1363289 ?auto_1363296 ) ) ( not ( = ?auto_1363289 ?auto_1363297 ) ) ( not ( = ?auto_1363289 ?auto_1363298 ) ) ( not ( = ?auto_1363291 ?auto_1363290 ) ) ( not ( = ?auto_1363291 ?auto_1363292 ) ) ( not ( = ?auto_1363291 ?auto_1363293 ) ) ( not ( = ?auto_1363291 ?auto_1363294 ) ) ( not ( = ?auto_1363291 ?auto_1363295 ) ) ( not ( = ?auto_1363291 ?auto_1363296 ) ) ( not ( = ?auto_1363291 ?auto_1363297 ) ) ( not ( = ?auto_1363291 ?auto_1363298 ) ) ( not ( = ?auto_1363290 ?auto_1363292 ) ) ( not ( = ?auto_1363290 ?auto_1363293 ) ) ( not ( = ?auto_1363290 ?auto_1363294 ) ) ( not ( = ?auto_1363290 ?auto_1363295 ) ) ( not ( = ?auto_1363290 ?auto_1363296 ) ) ( not ( = ?auto_1363290 ?auto_1363297 ) ) ( not ( = ?auto_1363290 ?auto_1363298 ) ) ( not ( = ?auto_1363292 ?auto_1363293 ) ) ( not ( = ?auto_1363292 ?auto_1363294 ) ) ( not ( = ?auto_1363292 ?auto_1363295 ) ) ( not ( = ?auto_1363292 ?auto_1363296 ) ) ( not ( = ?auto_1363292 ?auto_1363297 ) ) ( not ( = ?auto_1363292 ?auto_1363298 ) ) ( not ( = ?auto_1363293 ?auto_1363294 ) ) ( not ( = ?auto_1363293 ?auto_1363295 ) ) ( not ( = ?auto_1363293 ?auto_1363296 ) ) ( not ( = ?auto_1363293 ?auto_1363297 ) ) ( not ( = ?auto_1363293 ?auto_1363298 ) ) ( not ( = ?auto_1363294 ?auto_1363295 ) ) ( not ( = ?auto_1363294 ?auto_1363296 ) ) ( not ( = ?auto_1363294 ?auto_1363297 ) ) ( not ( = ?auto_1363294 ?auto_1363298 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1363295 ?auto_1363296 ?auto_1363297 )
      ( MAKE-10CRATE-VERIFY ?auto_1363287 ?auto_1363288 ?auto_1363289 ?auto_1363291 ?auto_1363290 ?auto_1363292 ?auto_1363293 ?auto_1363294 ?auto_1363295 ?auto_1363296 ?auto_1363297 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1370571 - SURFACE
      ?auto_1370572 - SURFACE
      ?auto_1370573 - SURFACE
      ?auto_1370575 - SURFACE
      ?auto_1370574 - SURFACE
      ?auto_1370576 - SURFACE
      ?auto_1370577 - SURFACE
      ?auto_1370578 - SURFACE
      ?auto_1370579 - SURFACE
      ?auto_1370580 - SURFACE
      ?auto_1370581 - SURFACE
      ?auto_1370582 - SURFACE
    )
    :vars
    (
      ?auto_1370584 - HOIST
      ?auto_1370583 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1370584 ?auto_1370583 ) ( SURFACE-AT ?auto_1370581 ?auto_1370583 ) ( CLEAR ?auto_1370581 ) ( LIFTING ?auto_1370584 ?auto_1370582 ) ( IS-CRATE ?auto_1370582 ) ( not ( = ?auto_1370581 ?auto_1370582 ) ) ( ON ?auto_1370572 ?auto_1370571 ) ( ON ?auto_1370573 ?auto_1370572 ) ( ON ?auto_1370575 ?auto_1370573 ) ( ON ?auto_1370574 ?auto_1370575 ) ( ON ?auto_1370576 ?auto_1370574 ) ( ON ?auto_1370577 ?auto_1370576 ) ( ON ?auto_1370578 ?auto_1370577 ) ( ON ?auto_1370579 ?auto_1370578 ) ( ON ?auto_1370580 ?auto_1370579 ) ( ON ?auto_1370581 ?auto_1370580 ) ( not ( = ?auto_1370571 ?auto_1370572 ) ) ( not ( = ?auto_1370571 ?auto_1370573 ) ) ( not ( = ?auto_1370571 ?auto_1370575 ) ) ( not ( = ?auto_1370571 ?auto_1370574 ) ) ( not ( = ?auto_1370571 ?auto_1370576 ) ) ( not ( = ?auto_1370571 ?auto_1370577 ) ) ( not ( = ?auto_1370571 ?auto_1370578 ) ) ( not ( = ?auto_1370571 ?auto_1370579 ) ) ( not ( = ?auto_1370571 ?auto_1370580 ) ) ( not ( = ?auto_1370571 ?auto_1370581 ) ) ( not ( = ?auto_1370571 ?auto_1370582 ) ) ( not ( = ?auto_1370572 ?auto_1370573 ) ) ( not ( = ?auto_1370572 ?auto_1370575 ) ) ( not ( = ?auto_1370572 ?auto_1370574 ) ) ( not ( = ?auto_1370572 ?auto_1370576 ) ) ( not ( = ?auto_1370572 ?auto_1370577 ) ) ( not ( = ?auto_1370572 ?auto_1370578 ) ) ( not ( = ?auto_1370572 ?auto_1370579 ) ) ( not ( = ?auto_1370572 ?auto_1370580 ) ) ( not ( = ?auto_1370572 ?auto_1370581 ) ) ( not ( = ?auto_1370572 ?auto_1370582 ) ) ( not ( = ?auto_1370573 ?auto_1370575 ) ) ( not ( = ?auto_1370573 ?auto_1370574 ) ) ( not ( = ?auto_1370573 ?auto_1370576 ) ) ( not ( = ?auto_1370573 ?auto_1370577 ) ) ( not ( = ?auto_1370573 ?auto_1370578 ) ) ( not ( = ?auto_1370573 ?auto_1370579 ) ) ( not ( = ?auto_1370573 ?auto_1370580 ) ) ( not ( = ?auto_1370573 ?auto_1370581 ) ) ( not ( = ?auto_1370573 ?auto_1370582 ) ) ( not ( = ?auto_1370575 ?auto_1370574 ) ) ( not ( = ?auto_1370575 ?auto_1370576 ) ) ( not ( = ?auto_1370575 ?auto_1370577 ) ) ( not ( = ?auto_1370575 ?auto_1370578 ) ) ( not ( = ?auto_1370575 ?auto_1370579 ) ) ( not ( = ?auto_1370575 ?auto_1370580 ) ) ( not ( = ?auto_1370575 ?auto_1370581 ) ) ( not ( = ?auto_1370575 ?auto_1370582 ) ) ( not ( = ?auto_1370574 ?auto_1370576 ) ) ( not ( = ?auto_1370574 ?auto_1370577 ) ) ( not ( = ?auto_1370574 ?auto_1370578 ) ) ( not ( = ?auto_1370574 ?auto_1370579 ) ) ( not ( = ?auto_1370574 ?auto_1370580 ) ) ( not ( = ?auto_1370574 ?auto_1370581 ) ) ( not ( = ?auto_1370574 ?auto_1370582 ) ) ( not ( = ?auto_1370576 ?auto_1370577 ) ) ( not ( = ?auto_1370576 ?auto_1370578 ) ) ( not ( = ?auto_1370576 ?auto_1370579 ) ) ( not ( = ?auto_1370576 ?auto_1370580 ) ) ( not ( = ?auto_1370576 ?auto_1370581 ) ) ( not ( = ?auto_1370576 ?auto_1370582 ) ) ( not ( = ?auto_1370577 ?auto_1370578 ) ) ( not ( = ?auto_1370577 ?auto_1370579 ) ) ( not ( = ?auto_1370577 ?auto_1370580 ) ) ( not ( = ?auto_1370577 ?auto_1370581 ) ) ( not ( = ?auto_1370577 ?auto_1370582 ) ) ( not ( = ?auto_1370578 ?auto_1370579 ) ) ( not ( = ?auto_1370578 ?auto_1370580 ) ) ( not ( = ?auto_1370578 ?auto_1370581 ) ) ( not ( = ?auto_1370578 ?auto_1370582 ) ) ( not ( = ?auto_1370579 ?auto_1370580 ) ) ( not ( = ?auto_1370579 ?auto_1370581 ) ) ( not ( = ?auto_1370579 ?auto_1370582 ) ) ( not ( = ?auto_1370580 ?auto_1370581 ) ) ( not ( = ?auto_1370580 ?auto_1370582 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1370581 ?auto_1370582 )
      ( MAKE-11CRATE-VERIFY ?auto_1370571 ?auto_1370572 ?auto_1370573 ?auto_1370575 ?auto_1370574 ?auto_1370576 ?auto_1370577 ?auto_1370578 ?auto_1370579 ?auto_1370580 ?auto_1370581 ?auto_1370582 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1370680 - SURFACE
      ?auto_1370681 - SURFACE
      ?auto_1370682 - SURFACE
      ?auto_1370684 - SURFACE
      ?auto_1370683 - SURFACE
      ?auto_1370685 - SURFACE
      ?auto_1370686 - SURFACE
      ?auto_1370687 - SURFACE
      ?auto_1370688 - SURFACE
      ?auto_1370689 - SURFACE
      ?auto_1370690 - SURFACE
      ?auto_1370691 - SURFACE
    )
    :vars
    (
      ?auto_1370692 - HOIST
      ?auto_1370694 - PLACE
      ?auto_1370693 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1370692 ?auto_1370694 ) ( SURFACE-AT ?auto_1370690 ?auto_1370694 ) ( CLEAR ?auto_1370690 ) ( IS-CRATE ?auto_1370691 ) ( not ( = ?auto_1370690 ?auto_1370691 ) ) ( TRUCK-AT ?auto_1370693 ?auto_1370694 ) ( AVAILABLE ?auto_1370692 ) ( IN ?auto_1370691 ?auto_1370693 ) ( ON ?auto_1370690 ?auto_1370689 ) ( not ( = ?auto_1370689 ?auto_1370690 ) ) ( not ( = ?auto_1370689 ?auto_1370691 ) ) ( ON ?auto_1370681 ?auto_1370680 ) ( ON ?auto_1370682 ?auto_1370681 ) ( ON ?auto_1370684 ?auto_1370682 ) ( ON ?auto_1370683 ?auto_1370684 ) ( ON ?auto_1370685 ?auto_1370683 ) ( ON ?auto_1370686 ?auto_1370685 ) ( ON ?auto_1370687 ?auto_1370686 ) ( ON ?auto_1370688 ?auto_1370687 ) ( ON ?auto_1370689 ?auto_1370688 ) ( not ( = ?auto_1370680 ?auto_1370681 ) ) ( not ( = ?auto_1370680 ?auto_1370682 ) ) ( not ( = ?auto_1370680 ?auto_1370684 ) ) ( not ( = ?auto_1370680 ?auto_1370683 ) ) ( not ( = ?auto_1370680 ?auto_1370685 ) ) ( not ( = ?auto_1370680 ?auto_1370686 ) ) ( not ( = ?auto_1370680 ?auto_1370687 ) ) ( not ( = ?auto_1370680 ?auto_1370688 ) ) ( not ( = ?auto_1370680 ?auto_1370689 ) ) ( not ( = ?auto_1370680 ?auto_1370690 ) ) ( not ( = ?auto_1370680 ?auto_1370691 ) ) ( not ( = ?auto_1370681 ?auto_1370682 ) ) ( not ( = ?auto_1370681 ?auto_1370684 ) ) ( not ( = ?auto_1370681 ?auto_1370683 ) ) ( not ( = ?auto_1370681 ?auto_1370685 ) ) ( not ( = ?auto_1370681 ?auto_1370686 ) ) ( not ( = ?auto_1370681 ?auto_1370687 ) ) ( not ( = ?auto_1370681 ?auto_1370688 ) ) ( not ( = ?auto_1370681 ?auto_1370689 ) ) ( not ( = ?auto_1370681 ?auto_1370690 ) ) ( not ( = ?auto_1370681 ?auto_1370691 ) ) ( not ( = ?auto_1370682 ?auto_1370684 ) ) ( not ( = ?auto_1370682 ?auto_1370683 ) ) ( not ( = ?auto_1370682 ?auto_1370685 ) ) ( not ( = ?auto_1370682 ?auto_1370686 ) ) ( not ( = ?auto_1370682 ?auto_1370687 ) ) ( not ( = ?auto_1370682 ?auto_1370688 ) ) ( not ( = ?auto_1370682 ?auto_1370689 ) ) ( not ( = ?auto_1370682 ?auto_1370690 ) ) ( not ( = ?auto_1370682 ?auto_1370691 ) ) ( not ( = ?auto_1370684 ?auto_1370683 ) ) ( not ( = ?auto_1370684 ?auto_1370685 ) ) ( not ( = ?auto_1370684 ?auto_1370686 ) ) ( not ( = ?auto_1370684 ?auto_1370687 ) ) ( not ( = ?auto_1370684 ?auto_1370688 ) ) ( not ( = ?auto_1370684 ?auto_1370689 ) ) ( not ( = ?auto_1370684 ?auto_1370690 ) ) ( not ( = ?auto_1370684 ?auto_1370691 ) ) ( not ( = ?auto_1370683 ?auto_1370685 ) ) ( not ( = ?auto_1370683 ?auto_1370686 ) ) ( not ( = ?auto_1370683 ?auto_1370687 ) ) ( not ( = ?auto_1370683 ?auto_1370688 ) ) ( not ( = ?auto_1370683 ?auto_1370689 ) ) ( not ( = ?auto_1370683 ?auto_1370690 ) ) ( not ( = ?auto_1370683 ?auto_1370691 ) ) ( not ( = ?auto_1370685 ?auto_1370686 ) ) ( not ( = ?auto_1370685 ?auto_1370687 ) ) ( not ( = ?auto_1370685 ?auto_1370688 ) ) ( not ( = ?auto_1370685 ?auto_1370689 ) ) ( not ( = ?auto_1370685 ?auto_1370690 ) ) ( not ( = ?auto_1370685 ?auto_1370691 ) ) ( not ( = ?auto_1370686 ?auto_1370687 ) ) ( not ( = ?auto_1370686 ?auto_1370688 ) ) ( not ( = ?auto_1370686 ?auto_1370689 ) ) ( not ( = ?auto_1370686 ?auto_1370690 ) ) ( not ( = ?auto_1370686 ?auto_1370691 ) ) ( not ( = ?auto_1370687 ?auto_1370688 ) ) ( not ( = ?auto_1370687 ?auto_1370689 ) ) ( not ( = ?auto_1370687 ?auto_1370690 ) ) ( not ( = ?auto_1370687 ?auto_1370691 ) ) ( not ( = ?auto_1370688 ?auto_1370689 ) ) ( not ( = ?auto_1370688 ?auto_1370690 ) ) ( not ( = ?auto_1370688 ?auto_1370691 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1370689 ?auto_1370690 ?auto_1370691 )
      ( MAKE-11CRATE-VERIFY ?auto_1370680 ?auto_1370681 ?auto_1370682 ?auto_1370684 ?auto_1370683 ?auto_1370685 ?auto_1370686 ?auto_1370687 ?auto_1370688 ?auto_1370689 ?auto_1370690 ?auto_1370691 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1370801 - SURFACE
      ?auto_1370802 - SURFACE
      ?auto_1370803 - SURFACE
      ?auto_1370805 - SURFACE
      ?auto_1370804 - SURFACE
      ?auto_1370806 - SURFACE
      ?auto_1370807 - SURFACE
      ?auto_1370808 - SURFACE
      ?auto_1370809 - SURFACE
      ?auto_1370810 - SURFACE
      ?auto_1370811 - SURFACE
      ?auto_1370812 - SURFACE
    )
    :vars
    (
      ?auto_1370815 - HOIST
      ?auto_1370813 - PLACE
      ?auto_1370816 - TRUCK
      ?auto_1370814 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1370815 ?auto_1370813 ) ( SURFACE-AT ?auto_1370811 ?auto_1370813 ) ( CLEAR ?auto_1370811 ) ( IS-CRATE ?auto_1370812 ) ( not ( = ?auto_1370811 ?auto_1370812 ) ) ( AVAILABLE ?auto_1370815 ) ( IN ?auto_1370812 ?auto_1370816 ) ( ON ?auto_1370811 ?auto_1370810 ) ( not ( = ?auto_1370810 ?auto_1370811 ) ) ( not ( = ?auto_1370810 ?auto_1370812 ) ) ( TRUCK-AT ?auto_1370816 ?auto_1370814 ) ( not ( = ?auto_1370814 ?auto_1370813 ) ) ( ON ?auto_1370802 ?auto_1370801 ) ( ON ?auto_1370803 ?auto_1370802 ) ( ON ?auto_1370805 ?auto_1370803 ) ( ON ?auto_1370804 ?auto_1370805 ) ( ON ?auto_1370806 ?auto_1370804 ) ( ON ?auto_1370807 ?auto_1370806 ) ( ON ?auto_1370808 ?auto_1370807 ) ( ON ?auto_1370809 ?auto_1370808 ) ( ON ?auto_1370810 ?auto_1370809 ) ( not ( = ?auto_1370801 ?auto_1370802 ) ) ( not ( = ?auto_1370801 ?auto_1370803 ) ) ( not ( = ?auto_1370801 ?auto_1370805 ) ) ( not ( = ?auto_1370801 ?auto_1370804 ) ) ( not ( = ?auto_1370801 ?auto_1370806 ) ) ( not ( = ?auto_1370801 ?auto_1370807 ) ) ( not ( = ?auto_1370801 ?auto_1370808 ) ) ( not ( = ?auto_1370801 ?auto_1370809 ) ) ( not ( = ?auto_1370801 ?auto_1370810 ) ) ( not ( = ?auto_1370801 ?auto_1370811 ) ) ( not ( = ?auto_1370801 ?auto_1370812 ) ) ( not ( = ?auto_1370802 ?auto_1370803 ) ) ( not ( = ?auto_1370802 ?auto_1370805 ) ) ( not ( = ?auto_1370802 ?auto_1370804 ) ) ( not ( = ?auto_1370802 ?auto_1370806 ) ) ( not ( = ?auto_1370802 ?auto_1370807 ) ) ( not ( = ?auto_1370802 ?auto_1370808 ) ) ( not ( = ?auto_1370802 ?auto_1370809 ) ) ( not ( = ?auto_1370802 ?auto_1370810 ) ) ( not ( = ?auto_1370802 ?auto_1370811 ) ) ( not ( = ?auto_1370802 ?auto_1370812 ) ) ( not ( = ?auto_1370803 ?auto_1370805 ) ) ( not ( = ?auto_1370803 ?auto_1370804 ) ) ( not ( = ?auto_1370803 ?auto_1370806 ) ) ( not ( = ?auto_1370803 ?auto_1370807 ) ) ( not ( = ?auto_1370803 ?auto_1370808 ) ) ( not ( = ?auto_1370803 ?auto_1370809 ) ) ( not ( = ?auto_1370803 ?auto_1370810 ) ) ( not ( = ?auto_1370803 ?auto_1370811 ) ) ( not ( = ?auto_1370803 ?auto_1370812 ) ) ( not ( = ?auto_1370805 ?auto_1370804 ) ) ( not ( = ?auto_1370805 ?auto_1370806 ) ) ( not ( = ?auto_1370805 ?auto_1370807 ) ) ( not ( = ?auto_1370805 ?auto_1370808 ) ) ( not ( = ?auto_1370805 ?auto_1370809 ) ) ( not ( = ?auto_1370805 ?auto_1370810 ) ) ( not ( = ?auto_1370805 ?auto_1370811 ) ) ( not ( = ?auto_1370805 ?auto_1370812 ) ) ( not ( = ?auto_1370804 ?auto_1370806 ) ) ( not ( = ?auto_1370804 ?auto_1370807 ) ) ( not ( = ?auto_1370804 ?auto_1370808 ) ) ( not ( = ?auto_1370804 ?auto_1370809 ) ) ( not ( = ?auto_1370804 ?auto_1370810 ) ) ( not ( = ?auto_1370804 ?auto_1370811 ) ) ( not ( = ?auto_1370804 ?auto_1370812 ) ) ( not ( = ?auto_1370806 ?auto_1370807 ) ) ( not ( = ?auto_1370806 ?auto_1370808 ) ) ( not ( = ?auto_1370806 ?auto_1370809 ) ) ( not ( = ?auto_1370806 ?auto_1370810 ) ) ( not ( = ?auto_1370806 ?auto_1370811 ) ) ( not ( = ?auto_1370806 ?auto_1370812 ) ) ( not ( = ?auto_1370807 ?auto_1370808 ) ) ( not ( = ?auto_1370807 ?auto_1370809 ) ) ( not ( = ?auto_1370807 ?auto_1370810 ) ) ( not ( = ?auto_1370807 ?auto_1370811 ) ) ( not ( = ?auto_1370807 ?auto_1370812 ) ) ( not ( = ?auto_1370808 ?auto_1370809 ) ) ( not ( = ?auto_1370808 ?auto_1370810 ) ) ( not ( = ?auto_1370808 ?auto_1370811 ) ) ( not ( = ?auto_1370808 ?auto_1370812 ) ) ( not ( = ?auto_1370809 ?auto_1370810 ) ) ( not ( = ?auto_1370809 ?auto_1370811 ) ) ( not ( = ?auto_1370809 ?auto_1370812 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1370810 ?auto_1370811 ?auto_1370812 )
      ( MAKE-11CRATE-VERIFY ?auto_1370801 ?auto_1370802 ?auto_1370803 ?auto_1370805 ?auto_1370804 ?auto_1370806 ?auto_1370807 ?auto_1370808 ?auto_1370809 ?auto_1370810 ?auto_1370811 ?auto_1370812 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1370933 - SURFACE
      ?auto_1370934 - SURFACE
      ?auto_1370935 - SURFACE
      ?auto_1370937 - SURFACE
      ?auto_1370936 - SURFACE
      ?auto_1370938 - SURFACE
      ?auto_1370939 - SURFACE
      ?auto_1370940 - SURFACE
      ?auto_1370941 - SURFACE
      ?auto_1370942 - SURFACE
      ?auto_1370943 - SURFACE
      ?auto_1370944 - SURFACE
    )
    :vars
    (
      ?auto_1370945 - HOIST
      ?auto_1370947 - PLACE
      ?auto_1370946 - TRUCK
      ?auto_1370949 - PLACE
      ?auto_1370948 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1370945 ?auto_1370947 ) ( SURFACE-AT ?auto_1370943 ?auto_1370947 ) ( CLEAR ?auto_1370943 ) ( IS-CRATE ?auto_1370944 ) ( not ( = ?auto_1370943 ?auto_1370944 ) ) ( AVAILABLE ?auto_1370945 ) ( ON ?auto_1370943 ?auto_1370942 ) ( not ( = ?auto_1370942 ?auto_1370943 ) ) ( not ( = ?auto_1370942 ?auto_1370944 ) ) ( TRUCK-AT ?auto_1370946 ?auto_1370949 ) ( not ( = ?auto_1370949 ?auto_1370947 ) ) ( HOIST-AT ?auto_1370948 ?auto_1370949 ) ( LIFTING ?auto_1370948 ?auto_1370944 ) ( not ( = ?auto_1370945 ?auto_1370948 ) ) ( ON ?auto_1370934 ?auto_1370933 ) ( ON ?auto_1370935 ?auto_1370934 ) ( ON ?auto_1370937 ?auto_1370935 ) ( ON ?auto_1370936 ?auto_1370937 ) ( ON ?auto_1370938 ?auto_1370936 ) ( ON ?auto_1370939 ?auto_1370938 ) ( ON ?auto_1370940 ?auto_1370939 ) ( ON ?auto_1370941 ?auto_1370940 ) ( ON ?auto_1370942 ?auto_1370941 ) ( not ( = ?auto_1370933 ?auto_1370934 ) ) ( not ( = ?auto_1370933 ?auto_1370935 ) ) ( not ( = ?auto_1370933 ?auto_1370937 ) ) ( not ( = ?auto_1370933 ?auto_1370936 ) ) ( not ( = ?auto_1370933 ?auto_1370938 ) ) ( not ( = ?auto_1370933 ?auto_1370939 ) ) ( not ( = ?auto_1370933 ?auto_1370940 ) ) ( not ( = ?auto_1370933 ?auto_1370941 ) ) ( not ( = ?auto_1370933 ?auto_1370942 ) ) ( not ( = ?auto_1370933 ?auto_1370943 ) ) ( not ( = ?auto_1370933 ?auto_1370944 ) ) ( not ( = ?auto_1370934 ?auto_1370935 ) ) ( not ( = ?auto_1370934 ?auto_1370937 ) ) ( not ( = ?auto_1370934 ?auto_1370936 ) ) ( not ( = ?auto_1370934 ?auto_1370938 ) ) ( not ( = ?auto_1370934 ?auto_1370939 ) ) ( not ( = ?auto_1370934 ?auto_1370940 ) ) ( not ( = ?auto_1370934 ?auto_1370941 ) ) ( not ( = ?auto_1370934 ?auto_1370942 ) ) ( not ( = ?auto_1370934 ?auto_1370943 ) ) ( not ( = ?auto_1370934 ?auto_1370944 ) ) ( not ( = ?auto_1370935 ?auto_1370937 ) ) ( not ( = ?auto_1370935 ?auto_1370936 ) ) ( not ( = ?auto_1370935 ?auto_1370938 ) ) ( not ( = ?auto_1370935 ?auto_1370939 ) ) ( not ( = ?auto_1370935 ?auto_1370940 ) ) ( not ( = ?auto_1370935 ?auto_1370941 ) ) ( not ( = ?auto_1370935 ?auto_1370942 ) ) ( not ( = ?auto_1370935 ?auto_1370943 ) ) ( not ( = ?auto_1370935 ?auto_1370944 ) ) ( not ( = ?auto_1370937 ?auto_1370936 ) ) ( not ( = ?auto_1370937 ?auto_1370938 ) ) ( not ( = ?auto_1370937 ?auto_1370939 ) ) ( not ( = ?auto_1370937 ?auto_1370940 ) ) ( not ( = ?auto_1370937 ?auto_1370941 ) ) ( not ( = ?auto_1370937 ?auto_1370942 ) ) ( not ( = ?auto_1370937 ?auto_1370943 ) ) ( not ( = ?auto_1370937 ?auto_1370944 ) ) ( not ( = ?auto_1370936 ?auto_1370938 ) ) ( not ( = ?auto_1370936 ?auto_1370939 ) ) ( not ( = ?auto_1370936 ?auto_1370940 ) ) ( not ( = ?auto_1370936 ?auto_1370941 ) ) ( not ( = ?auto_1370936 ?auto_1370942 ) ) ( not ( = ?auto_1370936 ?auto_1370943 ) ) ( not ( = ?auto_1370936 ?auto_1370944 ) ) ( not ( = ?auto_1370938 ?auto_1370939 ) ) ( not ( = ?auto_1370938 ?auto_1370940 ) ) ( not ( = ?auto_1370938 ?auto_1370941 ) ) ( not ( = ?auto_1370938 ?auto_1370942 ) ) ( not ( = ?auto_1370938 ?auto_1370943 ) ) ( not ( = ?auto_1370938 ?auto_1370944 ) ) ( not ( = ?auto_1370939 ?auto_1370940 ) ) ( not ( = ?auto_1370939 ?auto_1370941 ) ) ( not ( = ?auto_1370939 ?auto_1370942 ) ) ( not ( = ?auto_1370939 ?auto_1370943 ) ) ( not ( = ?auto_1370939 ?auto_1370944 ) ) ( not ( = ?auto_1370940 ?auto_1370941 ) ) ( not ( = ?auto_1370940 ?auto_1370942 ) ) ( not ( = ?auto_1370940 ?auto_1370943 ) ) ( not ( = ?auto_1370940 ?auto_1370944 ) ) ( not ( = ?auto_1370941 ?auto_1370942 ) ) ( not ( = ?auto_1370941 ?auto_1370943 ) ) ( not ( = ?auto_1370941 ?auto_1370944 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1370942 ?auto_1370943 ?auto_1370944 )
      ( MAKE-11CRATE-VERIFY ?auto_1370933 ?auto_1370934 ?auto_1370935 ?auto_1370937 ?auto_1370936 ?auto_1370938 ?auto_1370939 ?auto_1370940 ?auto_1370941 ?auto_1370942 ?auto_1370943 ?auto_1370944 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1371076 - SURFACE
      ?auto_1371077 - SURFACE
      ?auto_1371078 - SURFACE
      ?auto_1371080 - SURFACE
      ?auto_1371079 - SURFACE
      ?auto_1371081 - SURFACE
      ?auto_1371082 - SURFACE
      ?auto_1371083 - SURFACE
      ?auto_1371084 - SURFACE
      ?auto_1371085 - SURFACE
      ?auto_1371086 - SURFACE
      ?auto_1371087 - SURFACE
    )
    :vars
    (
      ?auto_1371092 - HOIST
      ?auto_1371090 - PLACE
      ?auto_1371091 - TRUCK
      ?auto_1371093 - PLACE
      ?auto_1371088 - HOIST
      ?auto_1371089 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1371092 ?auto_1371090 ) ( SURFACE-AT ?auto_1371086 ?auto_1371090 ) ( CLEAR ?auto_1371086 ) ( IS-CRATE ?auto_1371087 ) ( not ( = ?auto_1371086 ?auto_1371087 ) ) ( AVAILABLE ?auto_1371092 ) ( ON ?auto_1371086 ?auto_1371085 ) ( not ( = ?auto_1371085 ?auto_1371086 ) ) ( not ( = ?auto_1371085 ?auto_1371087 ) ) ( TRUCK-AT ?auto_1371091 ?auto_1371093 ) ( not ( = ?auto_1371093 ?auto_1371090 ) ) ( HOIST-AT ?auto_1371088 ?auto_1371093 ) ( not ( = ?auto_1371092 ?auto_1371088 ) ) ( AVAILABLE ?auto_1371088 ) ( SURFACE-AT ?auto_1371087 ?auto_1371093 ) ( ON ?auto_1371087 ?auto_1371089 ) ( CLEAR ?auto_1371087 ) ( not ( = ?auto_1371086 ?auto_1371089 ) ) ( not ( = ?auto_1371087 ?auto_1371089 ) ) ( not ( = ?auto_1371085 ?auto_1371089 ) ) ( ON ?auto_1371077 ?auto_1371076 ) ( ON ?auto_1371078 ?auto_1371077 ) ( ON ?auto_1371080 ?auto_1371078 ) ( ON ?auto_1371079 ?auto_1371080 ) ( ON ?auto_1371081 ?auto_1371079 ) ( ON ?auto_1371082 ?auto_1371081 ) ( ON ?auto_1371083 ?auto_1371082 ) ( ON ?auto_1371084 ?auto_1371083 ) ( ON ?auto_1371085 ?auto_1371084 ) ( not ( = ?auto_1371076 ?auto_1371077 ) ) ( not ( = ?auto_1371076 ?auto_1371078 ) ) ( not ( = ?auto_1371076 ?auto_1371080 ) ) ( not ( = ?auto_1371076 ?auto_1371079 ) ) ( not ( = ?auto_1371076 ?auto_1371081 ) ) ( not ( = ?auto_1371076 ?auto_1371082 ) ) ( not ( = ?auto_1371076 ?auto_1371083 ) ) ( not ( = ?auto_1371076 ?auto_1371084 ) ) ( not ( = ?auto_1371076 ?auto_1371085 ) ) ( not ( = ?auto_1371076 ?auto_1371086 ) ) ( not ( = ?auto_1371076 ?auto_1371087 ) ) ( not ( = ?auto_1371076 ?auto_1371089 ) ) ( not ( = ?auto_1371077 ?auto_1371078 ) ) ( not ( = ?auto_1371077 ?auto_1371080 ) ) ( not ( = ?auto_1371077 ?auto_1371079 ) ) ( not ( = ?auto_1371077 ?auto_1371081 ) ) ( not ( = ?auto_1371077 ?auto_1371082 ) ) ( not ( = ?auto_1371077 ?auto_1371083 ) ) ( not ( = ?auto_1371077 ?auto_1371084 ) ) ( not ( = ?auto_1371077 ?auto_1371085 ) ) ( not ( = ?auto_1371077 ?auto_1371086 ) ) ( not ( = ?auto_1371077 ?auto_1371087 ) ) ( not ( = ?auto_1371077 ?auto_1371089 ) ) ( not ( = ?auto_1371078 ?auto_1371080 ) ) ( not ( = ?auto_1371078 ?auto_1371079 ) ) ( not ( = ?auto_1371078 ?auto_1371081 ) ) ( not ( = ?auto_1371078 ?auto_1371082 ) ) ( not ( = ?auto_1371078 ?auto_1371083 ) ) ( not ( = ?auto_1371078 ?auto_1371084 ) ) ( not ( = ?auto_1371078 ?auto_1371085 ) ) ( not ( = ?auto_1371078 ?auto_1371086 ) ) ( not ( = ?auto_1371078 ?auto_1371087 ) ) ( not ( = ?auto_1371078 ?auto_1371089 ) ) ( not ( = ?auto_1371080 ?auto_1371079 ) ) ( not ( = ?auto_1371080 ?auto_1371081 ) ) ( not ( = ?auto_1371080 ?auto_1371082 ) ) ( not ( = ?auto_1371080 ?auto_1371083 ) ) ( not ( = ?auto_1371080 ?auto_1371084 ) ) ( not ( = ?auto_1371080 ?auto_1371085 ) ) ( not ( = ?auto_1371080 ?auto_1371086 ) ) ( not ( = ?auto_1371080 ?auto_1371087 ) ) ( not ( = ?auto_1371080 ?auto_1371089 ) ) ( not ( = ?auto_1371079 ?auto_1371081 ) ) ( not ( = ?auto_1371079 ?auto_1371082 ) ) ( not ( = ?auto_1371079 ?auto_1371083 ) ) ( not ( = ?auto_1371079 ?auto_1371084 ) ) ( not ( = ?auto_1371079 ?auto_1371085 ) ) ( not ( = ?auto_1371079 ?auto_1371086 ) ) ( not ( = ?auto_1371079 ?auto_1371087 ) ) ( not ( = ?auto_1371079 ?auto_1371089 ) ) ( not ( = ?auto_1371081 ?auto_1371082 ) ) ( not ( = ?auto_1371081 ?auto_1371083 ) ) ( not ( = ?auto_1371081 ?auto_1371084 ) ) ( not ( = ?auto_1371081 ?auto_1371085 ) ) ( not ( = ?auto_1371081 ?auto_1371086 ) ) ( not ( = ?auto_1371081 ?auto_1371087 ) ) ( not ( = ?auto_1371081 ?auto_1371089 ) ) ( not ( = ?auto_1371082 ?auto_1371083 ) ) ( not ( = ?auto_1371082 ?auto_1371084 ) ) ( not ( = ?auto_1371082 ?auto_1371085 ) ) ( not ( = ?auto_1371082 ?auto_1371086 ) ) ( not ( = ?auto_1371082 ?auto_1371087 ) ) ( not ( = ?auto_1371082 ?auto_1371089 ) ) ( not ( = ?auto_1371083 ?auto_1371084 ) ) ( not ( = ?auto_1371083 ?auto_1371085 ) ) ( not ( = ?auto_1371083 ?auto_1371086 ) ) ( not ( = ?auto_1371083 ?auto_1371087 ) ) ( not ( = ?auto_1371083 ?auto_1371089 ) ) ( not ( = ?auto_1371084 ?auto_1371085 ) ) ( not ( = ?auto_1371084 ?auto_1371086 ) ) ( not ( = ?auto_1371084 ?auto_1371087 ) ) ( not ( = ?auto_1371084 ?auto_1371089 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1371085 ?auto_1371086 ?auto_1371087 )
      ( MAKE-11CRATE-VERIFY ?auto_1371076 ?auto_1371077 ?auto_1371078 ?auto_1371080 ?auto_1371079 ?auto_1371081 ?auto_1371082 ?auto_1371083 ?auto_1371084 ?auto_1371085 ?auto_1371086 ?auto_1371087 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1371220 - SURFACE
      ?auto_1371221 - SURFACE
      ?auto_1371222 - SURFACE
      ?auto_1371224 - SURFACE
      ?auto_1371223 - SURFACE
      ?auto_1371225 - SURFACE
      ?auto_1371226 - SURFACE
      ?auto_1371227 - SURFACE
      ?auto_1371228 - SURFACE
      ?auto_1371229 - SURFACE
      ?auto_1371230 - SURFACE
      ?auto_1371231 - SURFACE
    )
    :vars
    (
      ?auto_1371235 - HOIST
      ?auto_1371233 - PLACE
      ?auto_1371236 - PLACE
      ?auto_1371237 - HOIST
      ?auto_1371234 - SURFACE
      ?auto_1371232 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1371235 ?auto_1371233 ) ( SURFACE-AT ?auto_1371230 ?auto_1371233 ) ( CLEAR ?auto_1371230 ) ( IS-CRATE ?auto_1371231 ) ( not ( = ?auto_1371230 ?auto_1371231 ) ) ( AVAILABLE ?auto_1371235 ) ( ON ?auto_1371230 ?auto_1371229 ) ( not ( = ?auto_1371229 ?auto_1371230 ) ) ( not ( = ?auto_1371229 ?auto_1371231 ) ) ( not ( = ?auto_1371236 ?auto_1371233 ) ) ( HOIST-AT ?auto_1371237 ?auto_1371236 ) ( not ( = ?auto_1371235 ?auto_1371237 ) ) ( AVAILABLE ?auto_1371237 ) ( SURFACE-AT ?auto_1371231 ?auto_1371236 ) ( ON ?auto_1371231 ?auto_1371234 ) ( CLEAR ?auto_1371231 ) ( not ( = ?auto_1371230 ?auto_1371234 ) ) ( not ( = ?auto_1371231 ?auto_1371234 ) ) ( not ( = ?auto_1371229 ?auto_1371234 ) ) ( TRUCK-AT ?auto_1371232 ?auto_1371233 ) ( ON ?auto_1371221 ?auto_1371220 ) ( ON ?auto_1371222 ?auto_1371221 ) ( ON ?auto_1371224 ?auto_1371222 ) ( ON ?auto_1371223 ?auto_1371224 ) ( ON ?auto_1371225 ?auto_1371223 ) ( ON ?auto_1371226 ?auto_1371225 ) ( ON ?auto_1371227 ?auto_1371226 ) ( ON ?auto_1371228 ?auto_1371227 ) ( ON ?auto_1371229 ?auto_1371228 ) ( not ( = ?auto_1371220 ?auto_1371221 ) ) ( not ( = ?auto_1371220 ?auto_1371222 ) ) ( not ( = ?auto_1371220 ?auto_1371224 ) ) ( not ( = ?auto_1371220 ?auto_1371223 ) ) ( not ( = ?auto_1371220 ?auto_1371225 ) ) ( not ( = ?auto_1371220 ?auto_1371226 ) ) ( not ( = ?auto_1371220 ?auto_1371227 ) ) ( not ( = ?auto_1371220 ?auto_1371228 ) ) ( not ( = ?auto_1371220 ?auto_1371229 ) ) ( not ( = ?auto_1371220 ?auto_1371230 ) ) ( not ( = ?auto_1371220 ?auto_1371231 ) ) ( not ( = ?auto_1371220 ?auto_1371234 ) ) ( not ( = ?auto_1371221 ?auto_1371222 ) ) ( not ( = ?auto_1371221 ?auto_1371224 ) ) ( not ( = ?auto_1371221 ?auto_1371223 ) ) ( not ( = ?auto_1371221 ?auto_1371225 ) ) ( not ( = ?auto_1371221 ?auto_1371226 ) ) ( not ( = ?auto_1371221 ?auto_1371227 ) ) ( not ( = ?auto_1371221 ?auto_1371228 ) ) ( not ( = ?auto_1371221 ?auto_1371229 ) ) ( not ( = ?auto_1371221 ?auto_1371230 ) ) ( not ( = ?auto_1371221 ?auto_1371231 ) ) ( not ( = ?auto_1371221 ?auto_1371234 ) ) ( not ( = ?auto_1371222 ?auto_1371224 ) ) ( not ( = ?auto_1371222 ?auto_1371223 ) ) ( not ( = ?auto_1371222 ?auto_1371225 ) ) ( not ( = ?auto_1371222 ?auto_1371226 ) ) ( not ( = ?auto_1371222 ?auto_1371227 ) ) ( not ( = ?auto_1371222 ?auto_1371228 ) ) ( not ( = ?auto_1371222 ?auto_1371229 ) ) ( not ( = ?auto_1371222 ?auto_1371230 ) ) ( not ( = ?auto_1371222 ?auto_1371231 ) ) ( not ( = ?auto_1371222 ?auto_1371234 ) ) ( not ( = ?auto_1371224 ?auto_1371223 ) ) ( not ( = ?auto_1371224 ?auto_1371225 ) ) ( not ( = ?auto_1371224 ?auto_1371226 ) ) ( not ( = ?auto_1371224 ?auto_1371227 ) ) ( not ( = ?auto_1371224 ?auto_1371228 ) ) ( not ( = ?auto_1371224 ?auto_1371229 ) ) ( not ( = ?auto_1371224 ?auto_1371230 ) ) ( not ( = ?auto_1371224 ?auto_1371231 ) ) ( not ( = ?auto_1371224 ?auto_1371234 ) ) ( not ( = ?auto_1371223 ?auto_1371225 ) ) ( not ( = ?auto_1371223 ?auto_1371226 ) ) ( not ( = ?auto_1371223 ?auto_1371227 ) ) ( not ( = ?auto_1371223 ?auto_1371228 ) ) ( not ( = ?auto_1371223 ?auto_1371229 ) ) ( not ( = ?auto_1371223 ?auto_1371230 ) ) ( not ( = ?auto_1371223 ?auto_1371231 ) ) ( not ( = ?auto_1371223 ?auto_1371234 ) ) ( not ( = ?auto_1371225 ?auto_1371226 ) ) ( not ( = ?auto_1371225 ?auto_1371227 ) ) ( not ( = ?auto_1371225 ?auto_1371228 ) ) ( not ( = ?auto_1371225 ?auto_1371229 ) ) ( not ( = ?auto_1371225 ?auto_1371230 ) ) ( not ( = ?auto_1371225 ?auto_1371231 ) ) ( not ( = ?auto_1371225 ?auto_1371234 ) ) ( not ( = ?auto_1371226 ?auto_1371227 ) ) ( not ( = ?auto_1371226 ?auto_1371228 ) ) ( not ( = ?auto_1371226 ?auto_1371229 ) ) ( not ( = ?auto_1371226 ?auto_1371230 ) ) ( not ( = ?auto_1371226 ?auto_1371231 ) ) ( not ( = ?auto_1371226 ?auto_1371234 ) ) ( not ( = ?auto_1371227 ?auto_1371228 ) ) ( not ( = ?auto_1371227 ?auto_1371229 ) ) ( not ( = ?auto_1371227 ?auto_1371230 ) ) ( not ( = ?auto_1371227 ?auto_1371231 ) ) ( not ( = ?auto_1371227 ?auto_1371234 ) ) ( not ( = ?auto_1371228 ?auto_1371229 ) ) ( not ( = ?auto_1371228 ?auto_1371230 ) ) ( not ( = ?auto_1371228 ?auto_1371231 ) ) ( not ( = ?auto_1371228 ?auto_1371234 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1371229 ?auto_1371230 ?auto_1371231 )
      ( MAKE-11CRATE-VERIFY ?auto_1371220 ?auto_1371221 ?auto_1371222 ?auto_1371224 ?auto_1371223 ?auto_1371225 ?auto_1371226 ?auto_1371227 ?auto_1371228 ?auto_1371229 ?auto_1371230 ?auto_1371231 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1371364 - SURFACE
      ?auto_1371365 - SURFACE
      ?auto_1371366 - SURFACE
      ?auto_1371368 - SURFACE
      ?auto_1371367 - SURFACE
      ?auto_1371369 - SURFACE
      ?auto_1371370 - SURFACE
      ?auto_1371371 - SURFACE
      ?auto_1371372 - SURFACE
      ?auto_1371373 - SURFACE
      ?auto_1371374 - SURFACE
      ?auto_1371375 - SURFACE
    )
    :vars
    (
      ?auto_1371380 - HOIST
      ?auto_1371376 - PLACE
      ?auto_1371379 - PLACE
      ?auto_1371378 - HOIST
      ?auto_1371381 - SURFACE
      ?auto_1371377 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1371380 ?auto_1371376 ) ( IS-CRATE ?auto_1371375 ) ( not ( = ?auto_1371374 ?auto_1371375 ) ) ( not ( = ?auto_1371373 ?auto_1371374 ) ) ( not ( = ?auto_1371373 ?auto_1371375 ) ) ( not ( = ?auto_1371379 ?auto_1371376 ) ) ( HOIST-AT ?auto_1371378 ?auto_1371379 ) ( not ( = ?auto_1371380 ?auto_1371378 ) ) ( AVAILABLE ?auto_1371378 ) ( SURFACE-AT ?auto_1371375 ?auto_1371379 ) ( ON ?auto_1371375 ?auto_1371381 ) ( CLEAR ?auto_1371375 ) ( not ( = ?auto_1371374 ?auto_1371381 ) ) ( not ( = ?auto_1371375 ?auto_1371381 ) ) ( not ( = ?auto_1371373 ?auto_1371381 ) ) ( TRUCK-AT ?auto_1371377 ?auto_1371376 ) ( SURFACE-AT ?auto_1371373 ?auto_1371376 ) ( CLEAR ?auto_1371373 ) ( LIFTING ?auto_1371380 ?auto_1371374 ) ( IS-CRATE ?auto_1371374 ) ( ON ?auto_1371365 ?auto_1371364 ) ( ON ?auto_1371366 ?auto_1371365 ) ( ON ?auto_1371368 ?auto_1371366 ) ( ON ?auto_1371367 ?auto_1371368 ) ( ON ?auto_1371369 ?auto_1371367 ) ( ON ?auto_1371370 ?auto_1371369 ) ( ON ?auto_1371371 ?auto_1371370 ) ( ON ?auto_1371372 ?auto_1371371 ) ( ON ?auto_1371373 ?auto_1371372 ) ( not ( = ?auto_1371364 ?auto_1371365 ) ) ( not ( = ?auto_1371364 ?auto_1371366 ) ) ( not ( = ?auto_1371364 ?auto_1371368 ) ) ( not ( = ?auto_1371364 ?auto_1371367 ) ) ( not ( = ?auto_1371364 ?auto_1371369 ) ) ( not ( = ?auto_1371364 ?auto_1371370 ) ) ( not ( = ?auto_1371364 ?auto_1371371 ) ) ( not ( = ?auto_1371364 ?auto_1371372 ) ) ( not ( = ?auto_1371364 ?auto_1371373 ) ) ( not ( = ?auto_1371364 ?auto_1371374 ) ) ( not ( = ?auto_1371364 ?auto_1371375 ) ) ( not ( = ?auto_1371364 ?auto_1371381 ) ) ( not ( = ?auto_1371365 ?auto_1371366 ) ) ( not ( = ?auto_1371365 ?auto_1371368 ) ) ( not ( = ?auto_1371365 ?auto_1371367 ) ) ( not ( = ?auto_1371365 ?auto_1371369 ) ) ( not ( = ?auto_1371365 ?auto_1371370 ) ) ( not ( = ?auto_1371365 ?auto_1371371 ) ) ( not ( = ?auto_1371365 ?auto_1371372 ) ) ( not ( = ?auto_1371365 ?auto_1371373 ) ) ( not ( = ?auto_1371365 ?auto_1371374 ) ) ( not ( = ?auto_1371365 ?auto_1371375 ) ) ( not ( = ?auto_1371365 ?auto_1371381 ) ) ( not ( = ?auto_1371366 ?auto_1371368 ) ) ( not ( = ?auto_1371366 ?auto_1371367 ) ) ( not ( = ?auto_1371366 ?auto_1371369 ) ) ( not ( = ?auto_1371366 ?auto_1371370 ) ) ( not ( = ?auto_1371366 ?auto_1371371 ) ) ( not ( = ?auto_1371366 ?auto_1371372 ) ) ( not ( = ?auto_1371366 ?auto_1371373 ) ) ( not ( = ?auto_1371366 ?auto_1371374 ) ) ( not ( = ?auto_1371366 ?auto_1371375 ) ) ( not ( = ?auto_1371366 ?auto_1371381 ) ) ( not ( = ?auto_1371368 ?auto_1371367 ) ) ( not ( = ?auto_1371368 ?auto_1371369 ) ) ( not ( = ?auto_1371368 ?auto_1371370 ) ) ( not ( = ?auto_1371368 ?auto_1371371 ) ) ( not ( = ?auto_1371368 ?auto_1371372 ) ) ( not ( = ?auto_1371368 ?auto_1371373 ) ) ( not ( = ?auto_1371368 ?auto_1371374 ) ) ( not ( = ?auto_1371368 ?auto_1371375 ) ) ( not ( = ?auto_1371368 ?auto_1371381 ) ) ( not ( = ?auto_1371367 ?auto_1371369 ) ) ( not ( = ?auto_1371367 ?auto_1371370 ) ) ( not ( = ?auto_1371367 ?auto_1371371 ) ) ( not ( = ?auto_1371367 ?auto_1371372 ) ) ( not ( = ?auto_1371367 ?auto_1371373 ) ) ( not ( = ?auto_1371367 ?auto_1371374 ) ) ( not ( = ?auto_1371367 ?auto_1371375 ) ) ( not ( = ?auto_1371367 ?auto_1371381 ) ) ( not ( = ?auto_1371369 ?auto_1371370 ) ) ( not ( = ?auto_1371369 ?auto_1371371 ) ) ( not ( = ?auto_1371369 ?auto_1371372 ) ) ( not ( = ?auto_1371369 ?auto_1371373 ) ) ( not ( = ?auto_1371369 ?auto_1371374 ) ) ( not ( = ?auto_1371369 ?auto_1371375 ) ) ( not ( = ?auto_1371369 ?auto_1371381 ) ) ( not ( = ?auto_1371370 ?auto_1371371 ) ) ( not ( = ?auto_1371370 ?auto_1371372 ) ) ( not ( = ?auto_1371370 ?auto_1371373 ) ) ( not ( = ?auto_1371370 ?auto_1371374 ) ) ( not ( = ?auto_1371370 ?auto_1371375 ) ) ( not ( = ?auto_1371370 ?auto_1371381 ) ) ( not ( = ?auto_1371371 ?auto_1371372 ) ) ( not ( = ?auto_1371371 ?auto_1371373 ) ) ( not ( = ?auto_1371371 ?auto_1371374 ) ) ( not ( = ?auto_1371371 ?auto_1371375 ) ) ( not ( = ?auto_1371371 ?auto_1371381 ) ) ( not ( = ?auto_1371372 ?auto_1371373 ) ) ( not ( = ?auto_1371372 ?auto_1371374 ) ) ( not ( = ?auto_1371372 ?auto_1371375 ) ) ( not ( = ?auto_1371372 ?auto_1371381 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1371373 ?auto_1371374 ?auto_1371375 )
      ( MAKE-11CRATE-VERIFY ?auto_1371364 ?auto_1371365 ?auto_1371366 ?auto_1371368 ?auto_1371367 ?auto_1371369 ?auto_1371370 ?auto_1371371 ?auto_1371372 ?auto_1371373 ?auto_1371374 ?auto_1371375 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1371508 - SURFACE
      ?auto_1371509 - SURFACE
      ?auto_1371510 - SURFACE
      ?auto_1371512 - SURFACE
      ?auto_1371511 - SURFACE
      ?auto_1371513 - SURFACE
      ?auto_1371514 - SURFACE
      ?auto_1371515 - SURFACE
      ?auto_1371516 - SURFACE
      ?auto_1371517 - SURFACE
      ?auto_1371518 - SURFACE
      ?auto_1371519 - SURFACE
    )
    :vars
    (
      ?auto_1371521 - HOIST
      ?auto_1371525 - PLACE
      ?auto_1371524 - PLACE
      ?auto_1371523 - HOIST
      ?auto_1371522 - SURFACE
      ?auto_1371520 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1371521 ?auto_1371525 ) ( IS-CRATE ?auto_1371519 ) ( not ( = ?auto_1371518 ?auto_1371519 ) ) ( not ( = ?auto_1371517 ?auto_1371518 ) ) ( not ( = ?auto_1371517 ?auto_1371519 ) ) ( not ( = ?auto_1371524 ?auto_1371525 ) ) ( HOIST-AT ?auto_1371523 ?auto_1371524 ) ( not ( = ?auto_1371521 ?auto_1371523 ) ) ( AVAILABLE ?auto_1371523 ) ( SURFACE-AT ?auto_1371519 ?auto_1371524 ) ( ON ?auto_1371519 ?auto_1371522 ) ( CLEAR ?auto_1371519 ) ( not ( = ?auto_1371518 ?auto_1371522 ) ) ( not ( = ?auto_1371519 ?auto_1371522 ) ) ( not ( = ?auto_1371517 ?auto_1371522 ) ) ( TRUCK-AT ?auto_1371520 ?auto_1371525 ) ( SURFACE-AT ?auto_1371517 ?auto_1371525 ) ( CLEAR ?auto_1371517 ) ( IS-CRATE ?auto_1371518 ) ( AVAILABLE ?auto_1371521 ) ( IN ?auto_1371518 ?auto_1371520 ) ( ON ?auto_1371509 ?auto_1371508 ) ( ON ?auto_1371510 ?auto_1371509 ) ( ON ?auto_1371512 ?auto_1371510 ) ( ON ?auto_1371511 ?auto_1371512 ) ( ON ?auto_1371513 ?auto_1371511 ) ( ON ?auto_1371514 ?auto_1371513 ) ( ON ?auto_1371515 ?auto_1371514 ) ( ON ?auto_1371516 ?auto_1371515 ) ( ON ?auto_1371517 ?auto_1371516 ) ( not ( = ?auto_1371508 ?auto_1371509 ) ) ( not ( = ?auto_1371508 ?auto_1371510 ) ) ( not ( = ?auto_1371508 ?auto_1371512 ) ) ( not ( = ?auto_1371508 ?auto_1371511 ) ) ( not ( = ?auto_1371508 ?auto_1371513 ) ) ( not ( = ?auto_1371508 ?auto_1371514 ) ) ( not ( = ?auto_1371508 ?auto_1371515 ) ) ( not ( = ?auto_1371508 ?auto_1371516 ) ) ( not ( = ?auto_1371508 ?auto_1371517 ) ) ( not ( = ?auto_1371508 ?auto_1371518 ) ) ( not ( = ?auto_1371508 ?auto_1371519 ) ) ( not ( = ?auto_1371508 ?auto_1371522 ) ) ( not ( = ?auto_1371509 ?auto_1371510 ) ) ( not ( = ?auto_1371509 ?auto_1371512 ) ) ( not ( = ?auto_1371509 ?auto_1371511 ) ) ( not ( = ?auto_1371509 ?auto_1371513 ) ) ( not ( = ?auto_1371509 ?auto_1371514 ) ) ( not ( = ?auto_1371509 ?auto_1371515 ) ) ( not ( = ?auto_1371509 ?auto_1371516 ) ) ( not ( = ?auto_1371509 ?auto_1371517 ) ) ( not ( = ?auto_1371509 ?auto_1371518 ) ) ( not ( = ?auto_1371509 ?auto_1371519 ) ) ( not ( = ?auto_1371509 ?auto_1371522 ) ) ( not ( = ?auto_1371510 ?auto_1371512 ) ) ( not ( = ?auto_1371510 ?auto_1371511 ) ) ( not ( = ?auto_1371510 ?auto_1371513 ) ) ( not ( = ?auto_1371510 ?auto_1371514 ) ) ( not ( = ?auto_1371510 ?auto_1371515 ) ) ( not ( = ?auto_1371510 ?auto_1371516 ) ) ( not ( = ?auto_1371510 ?auto_1371517 ) ) ( not ( = ?auto_1371510 ?auto_1371518 ) ) ( not ( = ?auto_1371510 ?auto_1371519 ) ) ( not ( = ?auto_1371510 ?auto_1371522 ) ) ( not ( = ?auto_1371512 ?auto_1371511 ) ) ( not ( = ?auto_1371512 ?auto_1371513 ) ) ( not ( = ?auto_1371512 ?auto_1371514 ) ) ( not ( = ?auto_1371512 ?auto_1371515 ) ) ( not ( = ?auto_1371512 ?auto_1371516 ) ) ( not ( = ?auto_1371512 ?auto_1371517 ) ) ( not ( = ?auto_1371512 ?auto_1371518 ) ) ( not ( = ?auto_1371512 ?auto_1371519 ) ) ( not ( = ?auto_1371512 ?auto_1371522 ) ) ( not ( = ?auto_1371511 ?auto_1371513 ) ) ( not ( = ?auto_1371511 ?auto_1371514 ) ) ( not ( = ?auto_1371511 ?auto_1371515 ) ) ( not ( = ?auto_1371511 ?auto_1371516 ) ) ( not ( = ?auto_1371511 ?auto_1371517 ) ) ( not ( = ?auto_1371511 ?auto_1371518 ) ) ( not ( = ?auto_1371511 ?auto_1371519 ) ) ( not ( = ?auto_1371511 ?auto_1371522 ) ) ( not ( = ?auto_1371513 ?auto_1371514 ) ) ( not ( = ?auto_1371513 ?auto_1371515 ) ) ( not ( = ?auto_1371513 ?auto_1371516 ) ) ( not ( = ?auto_1371513 ?auto_1371517 ) ) ( not ( = ?auto_1371513 ?auto_1371518 ) ) ( not ( = ?auto_1371513 ?auto_1371519 ) ) ( not ( = ?auto_1371513 ?auto_1371522 ) ) ( not ( = ?auto_1371514 ?auto_1371515 ) ) ( not ( = ?auto_1371514 ?auto_1371516 ) ) ( not ( = ?auto_1371514 ?auto_1371517 ) ) ( not ( = ?auto_1371514 ?auto_1371518 ) ) ( not ( = ?auto_1371514 ?auto_1371519 ) ) ( not ( = ?auto_1371514 ?auto_1371522 ) ) ( not ( = ?auto_1371515 ?auto_1371516 ) ) ( not ( = ?auto_1371515 ?auto_1371517 ) ) ( not ( = ?auto_1371515 ?auto_1371518 ) ) ( not ( = ?auto_1371515 ?auto_1371519 ) ) ( not ( = ?auto_1371515 ?auto_1371522 ) ) ( not ( = ?auto_1371516 ?auto_1371517 ) ) ( not ( = ?auto_1371516 ?auto_1371518 ) ) ( not ( = ?auto_1371516 ?auto_1371519 ) ) ( not ( = ?auto_1371516 ?auto_1371522 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1371517 ?auto_1371518 ?auto_1371519 )
      ( MAKE-11CRATE-VERIFY ?auto_1371508 ?auto_1371509 ?auto_1371510 ?auto_1371512 ?auto_1371511 ?auto_1371513 ?auto_1371514 ?auto_1371515 ?auto_1371516 ?auto_1371517 ?auto_1371518 ?auto_1371519 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1378245 - SURFACE
      ?auto_1378246 - SURFACE
    )
    :vars
    (
      ?auto_1378251 - HOIST
      ?auto_1378247 - PLACE
      ?auto_1378252 - SURFACE
      ?auto_1378253 - TRUCK
      ?auto_1378248 - PLACE
      ?auto_1378249 - HOIST
      ?auto_1378250 - SURFACE
      ?auto_1378254 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1378251 ?auto_1378247 ) ( SURFACE-AT ?auto_1378245 ?auto_1378247 ) ( CLEAR ?auto_1378245 ) ( IS-CRATE ?auto_1378246 ) ( not ( = ?auto_1378245 ?auto_1378246 ) ) ( AVAILABLE ?auto_1378251 ) ( ON ?auto_1378245 ?auto_1378252 ) ( not ( = ?auto_1378252 ?auto_1378245 ) ) ( not ( = ?auto_1378252 ?auto_1378246 ) ) ( TRUCK-AT ?auto_1378253 ?auto_1378248 ) ( not ( = ?auto_1378248 ?auto_1378247 ) ) ( HOIST-AT ?auto_1378249 ?auto_1378248 ) ( not ( = ?auto_1378251 ?auto_1378249 ) ) ( SURFACE-AT ?auto_1378246 ?auto_1378248 ) ( ON ?auto_1378246 ?auto_1378250 ) ( CLEAR ?auto_1378246 ) ( not ( = ?auto_1378245 ?auto_1378250 ) ) ( not ( = ?auto_1378246 ?auto_1378250 ) ) ( not ( = ?auto_1378252 ?auto_1378250 ) ) ( LIFTING ?auto_1378249 ?auto_1378254 ) ( IS-CRATE ?auto_1378254 ) ( not ( = ?auto_1378245 ?auto_1378254 ) ) ( not ( = ?auto_1378246 ?auto_1378254 ) ) ( not ( = ?auto_1378252 ?auto_1378254 ) ) ( not ( = ?auto_1378250 ?auto_1378254 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1378249 ?auto_1378254 ?auto_1378253 ?auto_1378248 )
      ( MAKE-1CRATE ?auto_1378245 ?auto_1378246 )
      ( MAKE-1CRATE-VERIFY ?auto_1378245 ?auto_1378246 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1380783 - SURFACE
      ?auto_1380784 - SURFACE
      ?auto_1380785 - SURFACE
      ?auto_1380787 - SURFACE
      ?auto_1380786 - SURFACE
      ?auto_1380788 - SURFACE
      ?auto_1380789 - SURFACE
      ?auto_1380790 - SURFACE
      ?auto_1380791 - SURFACE
      ?auto_1380792 - SURFACE
      ?auto_1380793 - SURFACE
      ?auto_1380794 - SURFACE
      ?auto_1380795 - SURFACE
    )
    :vars
    (
      ?auto_1380796 - HOIST
      ?auto_1380797 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1380796 ?auto_1380797 ) ( SURFACE-AT ?auto_1380794 ?auto_1380797 ) ( CLEAR ?auto_1380794 ) ( LIFTING ?auto_1380796 ?auto_1380795 ) ( IS-CRATE ?auto_1380795 ) ( not ( = ?auto_1380794 ?auto_1380795 ) ) ( ON ?auto_1380784 ?auto_1380783 ) ( ON ?auto_1380785 ?auto_1380784 ) ( ON ?auto_1380787 ?auto_1380785 ) ( ON ?auto_1380786 ?auto_1380787 ) ( ON ?auto_1380788 ?auto_1380786 ) ( ON ?auto_1380789 ?auto_1380788 ) ( ON ?auto_1380790 ?auto_1380789 ) ( ON ?auto_1380791 ?auto_1380790 ) ( ON ?auto_1380792 ?auto_1380791 ) ( ON ?auto_1380793 ?auto_1380792 ) ( ON ?auto_1380794 ?auto_1380793 ) ( not ( = ?auto_1380783 ?auto_1380784 ) ) ( not ( = ?auto_1380783 ?auto_1380785 ) ) ( not ( = ?auto_1380783 ?auto_1380787 ) ) ( not ( = ?auto_1380783 ?auto_1380786 ) ) ( not ( = ?auto_1380783 ?auto_1380788 ) ) ( not ( = ?auto_1380783 ?auto_1380789 ) ) ( not ( = ?auto_1380783 ?auto_1380790 ) ) ( not ( = ?auto_1380783 ?auto_1380791 ) ) ( not ( = ?auto_1380783 ?auto_1380792 ) ) ( not ( = ?auto_1380783 ?auto_1380793 ) ) ( not ( = ?auto_1380783 ?auto_1380794 ) ) ( not ( = ?auto_1380783 ?auto_1380795 ) ) ( not ( = ?auto_1380784 ?auto_1380785 ) ) ( not ( = ?auto_1380784 ?auto_1380787 ) ) ( not ( = ?auto_1380784 ?auto_1380786 ) ) ( not ( = ?auto_1380784 ?auto_1380788 ) ) ( not ( = ?auto_1380784 ?auto_1380789 ) ) ( not ( = ?auto_1380784 ?auto_1380790 ) ) ( not ( = ?auto_1380784 ?auto_1380791 ) ) ( not ( = ?auto_1380784 ?auto_1380792 ) ) ( not ( = ?auto_1380784 ?auto_1380793 ) ) ( not ( = ?auto_1380784 ?auto_1380794 ) ) ( not ( = ?auto_1380784 ?auto_1380795 ) ) ( not ( = ?auto_1380785 ?auto_1380787 ) ) ( not ( = ?auto_1380785 ?auto_1380786 ) ) ( not ( = ?auto_1380785 ?auto_1380788 ) ) ( not ( = ?auto_1380785 ?auto_1380789 ) ) ( not ( = ?auto_1380785 ?auto_1380790 ) ) ( not ( = ?auto_1380785 ?auto_1380791 ) ) ( not ( = ?auto_1380785 ?auto_1380792 ) ) ( not ( = ?auto_1380785 ?auto_1380793 ) ) ( not ( = ?auto_1380785 ?auto_1380794 ) ) ( not ( = ?auto_1380785 ?auto_1380795 ) ) ( not ( = ?auto_1380787 ?auto_1380786 ) ) ( not ( = ?auto_1380787 ?auto_1380788 ) ) ( not ( = ?auto_1380787 ?auto_1380789 ) ) ( not ( = ?auto_1380787 ?auto_1380790 ) ) ( not ( = ?auto_1380787 ?auto_1380791 ) ) ( not ( = ?auto_1380787 ?auto_1380792 ) ) ( not ( = ?auto_1380787 ?auto_1380793 ) ) ( not ( = ?auto_1380787 ?auto_1380794 ) ) ( not ( = ?auto_1380787 ?auto_1380795 ) ) ( not ( = ?auto_1380786 ?auto_1380788 ) ) ( not ( = ?auto_1380786 ?auto_1380789 ) ) ( not ( = ?auto_1380786 ?auto_1380790 ) ) ( not ( = ?auto_1380786 ?auto_1380791 ) ) ( not ( = ?auto_1380786 ?auto_1380792 ) ) ( not ( = ?auto_1380786 ?auto_1380793 ) ) ( not ( = ?auto_1380786 ?auto_1380794 ) ) ( not ( = ?auto_1380786 ?auto_1380795 ) ) ( not ( = ?auto_1380788 ?auto_1380789 ) ) ( not ( = ?auto_1380788 ?auto_1380790 ) ) ( not ( = ?auto_1380788 ?auto_1380791 ) ) ( not ( = ?auto_1380788 ?auto_1380792 ) ) ( not ( = ?auto_1380788 ?auto_1380793 ) ) ( not ( = ?auto_1380788 ?auto_1380794 ) ) ( not ( = ?auto_1380788 ?auto_1380795 ) ) ( not ( = ?auto_1380789 ?auto_1380790 ) ) ( not ( = ?auto_1380789 ?auto_1380791 ) ) ( not ( = ?auto_1380789 ?auto_1380792 ) ) ( not ( = ?auto_1380789 ?auto_1380793 ) ) ( not ( = ?auto_1380789 ?auto_1380794 ) ) ( not ( = ?auto_1380789 ?auto_1380795 ) ) ( not ( = ?auto_1380790 ?auto_1380791 ) ) ( not ( = ?auto_1380790 ?auto_1380792 ) ) ( not ( = ?auto_1380790 ?auto_1380793 ) ) ( not ( = ?auto_1380790 ?auto_1380794 ) ) ( not ( = ?auto_1380790 ?auto_1380795 ) ) ( not ( = ?auto_1380791 ?auto_1380792 ) ) ( not ( = ?auto_1380791 ?auto_1380793 ) ) ( not ( = ?auto_1380791 ?auto_1380794 ) ) ( not ( = ?auto_1380791 ?auto_1380795 ) ) ( not ( = ?auto_1380792 ?auto_1380793 ) ) ( not ( = ?auto_1380792 ?auto_1380794 ) ) ( not ( = ?auto_1380792 ?auto_1380795 ) ) ( not ( = ?auto_1380793 ?auto_1380794 ) ) ( not ( = ?auto_1380793 ?auto_1380795 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1380794 ?auto_1380795 )
      ( MAKE-12CRATE-VERIFY ?auto_1380783 ?auto_1380784 ?auto_1380785 ?auto_1380787 ?auto_1380786 ?auto_1380788 ?auto_1380789 ?auto_1380790 ?auto_1380791 ?auto_1380792 ?auto_1380793 ?auto_1380794 ?auto_1380795 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1380908 - SURFACE
      ?auto_1380909 - SURFACE
      ?auto_1380910 - SURFACE
      ?auto_1380912 - SURFACE
      ?auto_1380911 - SURFACE
      ?auto_1380913 - SURFACE
      ?auto_1380914 - SURFACE
      ?auto_1380915 - SURFACE
      ?auto_1380916 - SURFACE
      ?auto_1380917 - SURFACE
      ?auto_1380918 - SURFACE
      ?auto_1380919 - SURFACE
      ?auto_1380920 - SURFACE
    )
    :vars
    (
      ?auto_1380921 - HOIST
      ?auto_1380923 - PLACE
      ?auto_1380922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1380921 ?auto_1380923 ) ( SURFACE-AT ?auto_1380919 ?auto_1380923 ) ( CLEAR ?auto_1380919 ) ( IS-CRATE ?auto_1380920 ) ( not ( = ?auto_1380919 ?auto_1380920 ) ) ( TRUCK-AT ?auto_1380922 ?auto_1380923 ) ( AVAILABLE ?auto_1380921 ) ( IN ?auto_1380920 ?auto_1380922 ) ( ON ?auto_1380919 ?auto_1380918 ) ( not ( = ?auto_1380918 ?auto_1380919 ) ) ( not ( = ?auto_1380918 ?auto_1380920 ) ) ( ON ?auto_1380909 ?auto_1380908 ) ( ON ?auto_1380910 ?auto_1380909 ) ( ON ?auto_1380912 ?auto_1380910 ) ( ON ?auto_1380911 ?auto_1380912 ) ( ON ?auto_1380913 ?auto_1380911 ) ( ON ?auto_1380914 ?auto_1380913 ) ( ON ?auto_1380915 ?auto_1380914 ) ( ON ?auto_1380916 ?auto_1380915 ) ( ON ?auto_1380917 ?auto_1380916 ) ( ON ?auto_1380918 ?auto_1380917 ) ( not ( = ?auto_1380908 ?auto_1380909 ) ) ( not ( = ?auto_1380908 ?auto_1380910 ) ) ( not ( = ?auto_1380908 ?auto_1380912 ) ) ( not ( = ?auto_1380908 ?auto_1380911 ) ) ( not ( = ?auto_1380908 ?auto_1380913 ) ) ( not ( = ?auto_1380908 ?auto_1380914 ) ) ( not ( = ?auto_1380908 ?auto_1380915 ) ) ( not ( = ?auto_1380908 ?auto_1380916 ) ) ( not ( = ?auto_1380908 ?auto_1380917 ) ) ( not ( = ?auto_1380908 ?auto_1380918 ) ) ( not ( = ?auto_1380908 ?auto_1380919 ) ) ( not ( = ?auto_1380908 ?auto_1380920 ) ) ( not ( = ?auto_1380909 ?auto_1380910 ) ) ( not ( = ?auto_1380909 ?auto_1380912 ) ) ( not ( = ?auto_1380909 ?auto_1380911 ) ) ( not ( = ?auto_1380909 ?auto_1380913 ) ) ( not ( = ?auto_1380909 ?auto_1380914 ) ) ( not ( = ?auto_1380909 ?auto_1380915 ) ) ( not ( = ?auto_1380909 ?auto_1380916 ) ) ( not ( = ?auto_1380909 ?auto_1380917 ) ) ( not ( = ?auto_1380909 ?auto_1380918 ) ) ( not ( = ?auto_1380909 ?auto_1380919 ) ) ( not ( = ?auto_1380909 ?auto_1380920 ) ) ( not ( = ?auto_1380910 ?auto_1380912 ) ) ( not ( = ?auto_1380910 ?auto_1380911 ) ) ( not ( = ?auto_1380910 ?auto_1380913 ) ) ( not ( = ?auto_1380910 ?auto_1380914 ) ) ( not ( = ?auto_1380910 ?auto_1380915 ) ) ( not ( = ?auto_1380910 ?auto_1380916 ) ) ( not ( = ?auto_1380910 ?auto_1380917 ) ) ( not ( = ?auto_1380910 ?auto_1380918 ) ) ( not ( = ?auto_1380910 ?auto_1380919 ) ) ( not ( = ?auto_1380910 ?auto_1380920 ) ) ( not ( = ?auto_1380912 ?auto_1380911 ) ) ( not ( = ?auto_1380912 ?auto_1380913 ) ) ( not ( = ?auto_1380912 ?auto_1380914 ) ) ( not ( = ?auto_1380912 ?auto_1380915 ) ) ( not ( = ?auto_1380912 ?auto_1380916 ) ) ( not ( = ?auto_1380912 ?auto_1380917 ) ) ( not ( = ?auto_1380912 ?auto_1380918 ) ) ( not ( = ?auto_1380912 ?auto_1380919 ) ) ( not ( = ?auto_1380912 ?auto_1380920 ) ) ( not ( = ?auto_1380911 ?auto_1380913 ) ) ( not ( = ?auto_1380911 ?auto_1380914 ) ) ( not ( = ?auto_1380911 ?auto_1380915 ) ) ( not ( = ?auto_1380911 ?auto_1380916 ) ) ( not ( = ?auto_1380911 ?auto_1380917 ) ) ( not ( = ?auto_1380911 ?auto_1380918 ) ) ( not ( = ?auto_1380911 ?auto_1380919 ) ) ( not ( = ?auto_1380911 ?auto_1380920 ) ) ( not ( = ?auto_1380913 ?auto_1380914 ) ) ( not ( = ?auto_1380913 ?auto_1380915 ) ) ( not ( = ?auto_1380913 ?auto_1380916 ) ) ( not ( = ?auto_1380913 ?auto_1380917 ) ) ( not ( = ?auto_1380913 ?auto_1380918 ) ) ( not ( = ?auto_1380913 ?auto_1380919 ) ) ( not ( = ?auto_1380913 ?auto_1380920 ) ) ( not ( = ?auto_1380914 ?auto_1380915 ) ) ( not ( = ?auto_1380914 ?auto_1380916 ) ) ( not ( = ?auto_1380914 ?auto_1380917 ) ) ( not ( = ?auto_1380914 ?auto_1380918 ) ) ( not ( = ?auto_1380914 ?auto_1380919 ) ) ( not ( = ?auto_1380914 ?auto_1380920 ) ) ( not ( = ?auto_1380915 ?auto_1380916 ) ) ( not ( = ?auto_1380915 ?auto_1380917 ) ) ( not ( = ?auto_1380915 ?auto_1380918 ) ) ( not ( = ?auto_1380915 ?auto_1380919 ) ) ( not ( = ?auto_1380915 ?auto_1380920 ) ) ( not ( = ?auto_1380916 ?auto_1380917 ) ) ( not ( = ?auto_1380916 ?auto_1380918 ) ) ( not ( = ?auto_1380916 ?auto_1380919 ) ) ( not ( = ?auto_1380916 ?auto_1380920 ) ) ( not ( = ?auto_1380917 ?auto_1380918 ) ) ( not ( = ?auto_1380917 ?auto_1380919 ) ) ( not ( = ?auto_1380917 ?auto_1380920 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1380918 ?auto_1380919 ?auto_1380920 )
      ( MAKE-12CRATE-VERIFY ?auto_1380908 ?auto_1380909 ?auto_1380910 ?auto_1380912 ?auto_1380911 ?auto_1380913 ?auto_1380914 ?auto_1380915 ?auto_1380916 ?auto_1380917 ?auto_1380918 ?auto_1380919 ?auto_1380920 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1381046 - SURFACE
      ?auto_1381047 - SURFACE
      ?auto_1381048 - SURFACE
      ?auto_1381050 - SURFACE
      ?auto_1381049 - SURFACE
      ?auto_1381051 - SURFACE
      ?auto_1381052 - SURFACE
      ?auto_1381053 - SURFACE
      ?auto_1381054 - SURFACE
      ?auto_1381055 - SURFACE
      ?auto_1381056 - SURFACE
      ?auto_1381057 - SURFACE
      ?auto_1381058 - SURFACE
    )
    :vars
    (
      ?auto_1381061 - HOIST
      ?auto_1381059 - PLACE
      ?auto_1381062 - TRUCK
      ?auto_1381060 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1381061 ?auto_1381059 ) ( SURFACE-AT ?auto_1381057 ?auto_1381059 ) ( CLEAR ?auto_1381057 ) ( IS-CRATE ?auto_1381058 ) ( not ( = ?auto_1381057 ?auto_1381058 ) ) ( AVAILABLE ?auto_1381061 ) ( IN ?auto_1381058 ?auto_1381062 ) ( ON ?auto_1381057 ?auto_1381056 ) ( not ( = ?auto_1381056 ?auto_1381057 ) ) ( not ( = ?auto_1381056 ?auto_1381058 ) ) ( TRUCK-AT ?auto_1381062 ?auto_1381060 ) ( not ( = ?auto_1381060 ?auto_1381059 ) ) ( ON ?auto_1381047 ?auto_1381046 ) ( ON ?auto_1381048 ?auto_1381047 ) ( ON ?auto_1381050 ?auto_1381048 ) ( ON ?auto_1381049 ?auto_1381050 ) ( ON ?auto_1381051 ?auto_1381049 ) ( ON ?auto_1381052 ?auto_1381051 ) ( ON ?auto_1381053 ?auto_1381052 ) ( ON ?auto_1381054 ?auto_1381053 ) ( ON ?auto_1381055 ?auto_1381054 ) ( ON ?auto_1381056 ?auto_1381055 ) ( not ( = ?auto_1381046 ?auto_1381047 ) ) ( not ( = ?auto_1381046 ?auto_1381048 ) ) ( not ( = ?auto_1381046 ?auto_1381050 ) ) ( not ( = ?auto_1381046 ?auto_1381049 ) ) ( not ( = ?auto_1381046 ?auto_1381051 ) ) ( not ( = ?auto_1381046 ?auto_1381052 ) ) ( not ( = ?auto_1381046 ?auto_1381053 ) ) ( not ( = ?auto_1381046 ?auto_1381054 ) ) ( not ( = ?auto_1381046 ?auto_1381055 ) ) ( not ( = ?auto_1381046 ?auto_1381056 ) ) ( not ( = ?auto_1381046 ?auto_1381057 ) ) ( not ( = ?auto_1381046 ?auto_1381058 ) ) ( not ( = ?auto_1381047 ?auto_1381048 ) ) ( not ( = ?auto_1381047 ?auto_1381050 ) ) ( not ( = ?auto_1381047 ?auto_1381049 ) ) ( not ( = ?auto_1381047 ?auto_1381051 ) ) ( not ( = ?auto_1381047 ?auto_1381052 ) ) ( not ( = ?auto_1381047 ?auto_1381053 ) ) ( not ( = ?auto_1381047 ?auto_1381054 ) ) ( not ( = ?auto_1381047 ?auto_1381055 ) ) ( not ( = ?auto_1381047 ?auto_1381056 ) ) ( not ( = ?auto_1381047 ?auto_1381057 ) ) ( not ( = ?auto_1381047 ?auto_1381058 ) ) ( not ( = ?auto_1381048 ?auto_1381050 ) ) ( not ( = ?auto_1381048 ?auto_1381049 ) ) ( not ( = ?auto_1381048 ?auto_1381051 ) ) ( not ( = ?auto_1381048 ?auto_1381052 ) ) ( not ( = ?auto_1381048 ?auto_1381053 ) ) ( not ( = ?auto_1381048 ?auto_1381054 ) ) ( not ( = ?auto_1381048 ?auto_1381055 ) ) ( not ( = ?auto_1381048 ?auto_1381056 ) ) ( not ( = ?auto_1381048 ?auto_1381057 ) ) ( not ( = ?auto_1381048 ?auto_1381058 ) ) ( not ( = ?auto_1381050 ?auto_1381049 ) ) ( not ( = ?auto_1381050 ?auto_1381051 ) ) ( not ( = ?auto_1381050 ?auto_1381052 ) ) ( not ( = ?auto_1381050 ?auto_1381053 ) ) ( not ( = ?auto_1381050 ?auto_1381054 ) ) ( not ( = ?auto_1381050 ?auto_1381055 ) ) ( not ( = ?auto_1381050 ?auto_1381056 ) ) ( not ( = ?auto_1381050 ?auto_1381057 ) ) ( not ( = ?auto_1381050 ?auto_1381058 ) ) ( not ( = ?auto_1381049 ?auto_1381051 ) ) ( not ( = ?auto_1381049 ?auto_1381052 ) ) ( not ( = ?auto_1381049 ?auto_1381053 ) ) ( not ( = ?auto_1381049 ?auto_1381054 ) ) ( not ( = ?auto_1381049 ?auto_1381055 ) ) ( not ( = ?auto_1381049 ?auto_1381056 ) ) ( not ( = ?auto_1381049 ?auto_1381057 ) ) ( not ( = ?auto_1381049 ?auto_1381058 ) ) ( not ( = ?auto_1381051 ?auto_1381052 ) ) ( not ( = ?auto_1381051 ?auto_1381053 ) ) ( not ( = ?auto_1381051 ?auto_1381054 ) ) ( not ( = ?auto_1381051 ?auto_1381055 ) ) ( not ( = ?auto_1381051 ?auto_1381056 ) ) ( not ( = ?auto_1381051 ?auto_1381057 ) ) ( not ( = ?auto_1381051 ?auto_1381058 ) ) ( not ( = ?auto_1381052 ?auto_1381053 ) ) ( not ( = ?auto_1381052 ?auto_1381054 ) ) ( not ( = ?auto_1381052 ?auto_1381055 ) ) ( not ( = ?auto_1381052 ?auto_1381056 ) ) ( not ( = ?auto_1381052 ?auto_1381057 ) ) ( not ( = ?auto_1381052 ?auto_1381058 ) ) ( not ( = ?auto_1381053 ?auto_1381054 ) ) ( not ( = ?auto_1381053 ?auto_1381055 ) ) ( not ( = ?auto_1381053 ?auto_1381056 ) ) ( not ( = ?auto_1381053 ?auto_1381057 ) ) ( not ( = ?auto_1381053 ?auto_1381058 ) ) ( not ( = ?auto_1381054 ?auto_1381055 ) ) ( not ( = ?auto_1381054 ?auto_1381056 ) ) ( not ( = ?auto_1381054 ?auto_1381057 ) ) ( not ( = ?auto_1381054 ?auto_1381058 ) ) ( not ( = ?auto_1381055 ?auto_1381056 ) ) ( not ( = ?auto_1381055 ?auto_1381057 ) ) ( not ( = ?auto_1381055 ?auto_1381058 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1381056 ?auto_1381057 ?auto_1381058 )
      ( MAKE-12CRATE-VERIFY ?auto_1381046 ?auto_1381047 ?auto_1381048 ?auto_1381050 ?auto_1381049 ?auto_1381051 ?auto_1381052 ?auto_1381053 ?auto_1381054 ?auto_1381055 ?auto_1381056 ?auto_1381057 ?auto_1381058 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1381196 - SURFACE
      ?auto_1381197 - SURFACE
      ?auto_1381198 - SURFACE
      ?auto_1381200 - SURFACE
      ?auto_1381199 - SURFACE
      ?auto_1381201 - SURFACE
      ?auto_1381202 - SURFACE
      ?auto_1381203 - SURFACE
      ?auto_1381204 - SURFACE
      ?auto_1381205 - SURFACE
      ?auto_1381206 - SURFACE
      ?auto_1381207 - SURFACE
      ?auto_1381208 - SURFACE
    )
    :vars
    (
      ?auto_1381212 - HOIST
      ?auto_1381213 - PLACE
      ?auto_1381209 - TRUCK
      ?auto_1381211 - PLACE
      ?auto_1381210 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1381212 ?auto_1381213 ) ( SURFACE-AT ?auto_1381207 ?auto_1381213 ) ( CLEAR ?auto_1381207 ) ( IS-CRATE ?auto_1381208 ) ( not ( = ?auto_1381207 ?auto_1381208 ) ) ( AVAILABLE ?auto_1381212 ) ( ON ?auto_1381207 ?auto_1381206 ) ( not ( = ?auto_1381206 ?auto_1381207 ) ) ( not ( = ?auto_1381206 ?auto_1381208 ) ) ( TRUCK-AT ?auto_1381209 ?auto_1381211 ) ( not ( = ?auto_1381211 ?auto_1381213 ) ) ( HOIST-AT ?auto_1381210 ?auto_1381211 ) ( LIFTING ?auto_1381210 ?auto_1381208 ) ( not ( = ?auto_1381212 ?auto_1381210 ) ) ( ON ?auto_1381197 ?auto_1381196 ) ( ON ?auto_1381198 ?auto_1381197 ) ( ON ?auto_1381200 ?auto_1381198 ) ( ON ?auto_1381199 ?auto_1381200 ) ( ON ?auto_1381201 ?auto_1381199 ) ( ON ?auto_1381202 ?auto_1381201 ) ( ON ?auto_1381203 ?auto_1381202 ) ( ON ?auto_1381204 ?auto_1381203 ) ( ON ?auto_1381205 ?auto_1381204 ) ( ON ?auto_1381206 ?auto_1381205 ) ( not ( = ?auto_1381196 ?auto_1381197 ) ) ( not ( = ?auto_1381196 ?auto_1381198 ) ) ( not ( = ?auto_1381196 ?auto_1381200 ) ) ( not ( = ?auto_1381196 ?auto_1381199 ) ) ( not ( = ?auto_1381196 ?auto_1381201 ) ) ( not ( = ?auto_1381196 ?auto_1381202 ) ) ( not ( = ?auto_1381196 ?auto_1381203 ) ) ( not ( = ?auto_1381196 ?auto_1381204 ) ) ( not ( = ?auto_1381196 ?auto_1381205 ) ) ( not ( = ?auto_1381196 ?auto_1381206 ) ) ( not ( = ?auto_1381196 ?auto_1381207 ) ) ( not ( = ?auto_1381196 ?auto_1381208 ) ) ( not ( = ?auto_1381197 ?auto_1381198 ) ) ( not ( = ?auto_1381197 ?auto_1381200 ) ) ( not ( = ?auto_1381197 ?auto_1381199 ) ) ( not ( = ?auto_1381197 ?auto_1381201 ) ) ( not ( = ?auto_1381197 ?auto_1381202 ) ) ( not ( = ?auto_1381197 ?auto_1381203 ) ) ( not ( = ?auto_1381197 ?auto_1381204 ) ) ( not ( = ?auto_1381197 ?auto_1381205 ) ) ( not ( = ?auto_1381197 ?auto_1381206 ) ) ( not ( = ?auto_1381197 ?auto_1381207 ) ) ( not ( = ?auto_1381197 ?auto_1381208 ) ) ( not ( = ?auto_1381198 ?auto_1381200 ) ) ( not ( = ?auto_1381198 ?auto_1381199 ) ) ( not ( = ?auto_1381198 ?auto_1381201 ) ) ( not ( = ?auto_1381198 ?auto_1381202 ) ) ( not ( = ?auto_1381198 ?auto_1381203 ) ) ( not ( = ?auto_1381198 ?auto_1381204 ) ) ( not ( = ?auto_1381198 ?auto_1381205 ) ) ( not ( = ?auto_1381198 ?auto_1381206 ) ) ( not ( = ?auto_1381198 ?auto_1381207 ) ) ( not ( = ?auto_1381198 ?auto_1381208 ) ) ( not ( = ?auto_1381200 ?auto_1381199 ) ) ( not ( = ?auto_1381200 ?auto_1381201 ) ) ( not ( = ?auto_1381200 ?auto_1381202 ) ) ( not ( = ?auto_1381200 ?auto_1381203 ) ) ( not ( = ?auto_1381200 ?auto_1381204 ) ) ( not ( = ?auto_1381200 ?auto_1381205 ) ) ( not ( = ?auto_1381200 ?auto_1381206 ) ) ( not ( = ?auto_1381200 ?auto_1381207 ) ) ( not ( = ?auto_1381200 ?auto_1381208 ) ) ( not ( = ?auto_1381199 ?auto_1381201 ) ) ( not ( = ?auto_1381199 ?auto_1381202 ) ) ( not ( = ?auto_1381199 ?auto_1381203 ) ) ( not ( = ?auto_1381199 ?auto_1381204 ) ) ( not ( = ?auto_1381199 ?auto_1381205 ) ) ( not ( = ?auto_1381199 ?auto_1381206 ) ) ( not ( = ?auto_1381199 ?auto_1381207 ) ) ( not ( = ?auto_1381199 ?auto_1381208 ) ) ( not ( = ?auto_1381201 ?auto_1381202 ) ) ( not ( = ?auto_1381201 ?auto_1381203 ) ) ( not ( = ?auto_1381201 ?auto_1381204 ) ) ( not ( = ?auto_1381201 ?auto_1381205 ) ) ( not ( = ?auto_1381201 ?auto_1381206 ) ) ( not ( = ?auto_1381201 ?auto_1381207 ) ) ( not ( = ?auto_1381201 ?auto_1381208 ) ) ( not ( = ?auto_1381202 ?auto_1381203 ) ) ( not ( = ?auto_1381202 ?auto_1381204 ) ) ( not ( = ?auto_1381202 ?auto_1381205 ) ) ( not ( = ?auto_1381202 ?auto_1381206 ) ) ( not ( = ?auto_1381202 ?auto_1381207 ) ) ( not ( = ?auto_1381202 ?auto_1381208 ) ) ( not ( = ?auto_1381203 ?auto_1381204 ) ) ( not ( = ?auto_1381203 ?auto_1381205 ) ) ( not ( = ?auto_1381203 ?auto_1381206 ) ) ( not ( = ?auto_1381203 ?auto_1381207 ) ) ( not ( = ?auto_1381203 ?auto_1381208 ) ) ( not ( = ?auto_1381204 ?auto_1381205 ) ) ( not ( = ?auto_1381204 ?auto_1381206 ) ) ( not ( = ?auto_1381204 ?auto_1381207 ) ) ( not ( = ?auto_1381204 ?auto_1381208 ) ) ( not ( = ?auto_1381205 ?auto_1381206 ) ) ( not ( = ?auto_1381205 ?auto_1381207 ) ) ( not ( = ?auto_1381205 ?auto_1381208 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1381206 ?auto_1381207 ?auto_1381208 )
      ( MAKE-12CRATE-VERIFY ?auto_1381196 ?auto_1381197 ?auto_1381198 ?auto_1381200 ?auto_1381199 ?auto_1381201 ?auto_1381202 ?auto_1381203 ?auto_1381204 ?auto_1381205 ?auto_1381206 ?auto_1381207 ?auto_1381208 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1381358 - SURFACE
      ?auto_1381359 - SURFACE
      ?auto_1381360 - SURFACE
      ?auto_1381362 - SURFACE
      ?auto_1381361 - SURFACE
      ?auto_1381363 - SURFACE
      ?auto_1381364 - SURFACE
      ?auto_1381365 - SURFACE
      ?auto_1381366 - SURFACE
      ?auto_1381367 - SURFACE
      ?auto_1381368 - SURFACE
      ?auto_1381369 - SURFACE
      ?auto_1381370 - SURFACE
    )
    :vars
    (
      ?auto_1381375 - HOIST
      ?auto_1381376 - PLACE
      ?auto_1381373 - TRUCK
      ?auto_1381372 - PLACE
      ?auto_1381371 - HOIST
      ?auto_1381374 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1381375 ?auto_1381376 ) ( SURFACE-AT ?auto_1381369 ?auto_1381376 ) ( CLEAR ?auto_1381369 ) ( IS-CRATE ?auto_1381370 ) ( not ( = ?auto_1381369 ?auto_1381370 ) ) ( AVAILABLE ?auto_1381375 ) ( ON ?auto_1381369 ?auto_1381368 ) ( not ( = ?auto_1381368 ?auto_1381369 ) ) ( not ( = ?auto_1381368 ?auto_1381370 ) ) ( TRUCK-AT ?auto_1381373 ?auto_1381372 ) ( not ( = ?auto_1381372 ?auto_1381376 ) ) ( HOIST-AT ?auto_1381371 ?auto_1381372 ) ( not ( = ?auto_1381375 ?auto_1381371 ) ) ( AVAILABLE ?auto_1381371 ) ( SURFACE-AT ?auto_1381370 ?auto_1381372 ) ( ON ?auto_1381370 ?auto_1381374 ) ( CLEAR ?auto_1381370 ) ( not ( = ?auto_1381369 ?auto_1381374 ) ) ( not ( = ?auto_1381370 ?auto_1381374 ) ) ( not ( = ?auto_1381368 ?auto_1381374 ) ) ( ON ?auto_1381359 ?auto_1381358 ) ( ON ?auto_1381360 ?auto_1381359 ) ( ON ?auto_1381362 ?auto_1381360 ) ( ON ?auto_1381361 ?auto_1381362 ) ( ON ?auto_1381363 ?auto_1381361 ) ( ON ?auto_1381364 ?auto_1381363 ) ( ON ?auto_1381365 ?auto_1381364 ) ( ON ?auto_1381366 ?auto_1381365 ) ( ON ?auto_1381367 ?auto_1381366 ) ( ON ?auto_1381368 ?auto_1381367 ) ( not ( = ?auto_1381358 ?auto_1381359 ) ) ( not ( = ?auto_1381358 ?auto_1381360 ) ) ( not ( = ?auto_1381358 ?auto_1381362 ) ) ( not ( = ?auto_1381358 ?auto_1381361 ) ) ( not ( = ?auto_1381358 ?auto_1381363 ) ) ( not ( = ?auto_1381358 ?auto_1381364 ) ) ( not ( = ?auto_1381358 ?auto_1381365 ) ) ( not ( = ?auto_1381358 ?auto_1381366 ) ) ( not ( = ?auto_1381358 ?auto_1381367 ) ) ( not ( = ?auto_1381358 ?auto_1381368 ) ) ( not ( = ?auto_1381358 ?auto_1381369 ) ) ( not ( = ?auto_1381358 ?auto_1381370 ) ) ( not ( = ?auto_1381358 ?auto_1381374 ) ) ( not ( = ?auto_1381359 ?auto_1381360 ) ) ( not ( = ?auto_1381359 ?auto_1381362 ) ) ( not ( = ?auto_1381359 ?auto_1381361 ) ) ( not ( = ?auto_1381359 ?auto_1381363 ) ) ( not ( = ?auto_1381359 ?auto_1381364 ) ) ( not ( = ?auto_1381359 ?auto_1381365 ) ) ( not ( = ?auto_1381359 ?auto_1381366 ) ) ( not ( = ?auto_1381359 ?auto_1381367 ) ) ( not ( = ?auto_1381359 ?auto_1381368 ) ) ( not ( = ?auto_1381359 ?auto_1381369 ) ) ( not ( = ?auto_1381359 ?auto_1381370 ) ) ( not ( = ?auto_1381359 ?auto_1381374 ) ) ( not ( = ?auto_1381360 ?auto_1381362 ) ) ( not ( = ?auto_1381360 ?auto_1381361 ) ) ( not ( = ?auto_1381360 ?auto_1381363 ) ) ( not ( = ?auto_1381360 ?auto_1381364 ) ) ( not ( = ?auto_1381360 ?auto_1381365 ) ) ( not ( = ?auto_1381360 ?auto_1381366 ) ) ( not ( = ?auto_1381360 ?auto_1381367 ) ) ( not ( = ?auto_1381360 ?auto_1381368 ) ) ( not ( = ?auto_1381360 ?auto_1381369 ) ) ( not ( = ?auto_1381360 ?auto_1381370 ) ) ( not ( = ?auto_1381360 ?auto_1381374 ) ) ( not ( = ?auto_1381362 ?auto_1381361 ) ) ( not ( = ?auto_1381362 ?auto_1381363 ) ) ( not ( = ?auto_1381362 ?auto_1381364 ) ) ( not ( = ?auto_1381362 ?auto_1381365 ) ) ( not ( = ?auto_1381362 ?auto_1381366 ) ) ( not ( = ?auto_1381362 ?auto_1381367 ) ) ( not ( = ?auto_1381362 ?auto_1381368 ) ) ( not ( = ?auto_1381362 ?auto_1381369 ) ) ( not ( = ?auto_1381362 ?auto_1381370 ) ) ( not ( = ?auto_1381362 ?auto_1381374 ) ) ( not ( = ?auto_1381361 ?auto_1381363 ) ) ( not ( = ?auto_1381361 ?auto_1381364 ) ) ( not ( = ?auto_1381361 ?auto_1381365 ) ) ( not ( = ?auto_1381361 ?auto_1381366 ) ) ( not ( = ?auto_1381361 ?auto_1381367 ) ) ( not ( = ?auto_1381361 ?auto_1381368 ) ) ( not ( = ?auto_1381361 ?auto_1381369 ) ) ( not ( = ?auto_1381361 ?auto_1381370 ) ) ( not ( = ?auto_1381361 ?auto_1381374 ) ) ( not ( = ?auto_1381363 ?auto_1381364 ) ) ( not ( = ?auto_1381363 ?auto_1381365 ) ) ( not ( = ?auto_1381363 ?auto_1381366 ) ) ( not ( = ?auto_1381363 ?auto_1381367 ) ) ( not ( = ?auto_1381363 ?auto_1381368 ) ) ( not ( = ?auto_1381363 ?auto_1381369 ) ) ( not ( = ?auto_1381363 ?auto_1381370 ) ) ( not ( = ?auto_1381363 ?auto_1381374 ) ) ( not ( = ?auto_1381364 ?auto_1381365 ) ) ( not ( = ?auto_1381364 ?auto_1381366 ) ) ( not ( = ?auto_1381364 ?auto_1381367 ) ) ( not ( = ?auto_1381364 ?auto_1381368 ) ) ( not ( = ?auto_1381364 ?auto_1381369 ) ) ( not ( = ?auto_1381364 ?auto_1381370 ) ) ( not ( = ?auto_1381364 ?auto_1381374 ) ) ( not ( = ?auto_1381365 ?auto_1381366 ) ) ( not ( = ?auto_1381365 ?auto_1381367 ) ) ( not ( = ?auto_1381365 ?auto_1381368 ) ) ( not ( = ?auto_1381365 ?auto_1381369 ) ) ( not ( = ?auto_1381365 ?auto_1381370 ) ) ( not ( = ?auto_1381365 ?auto_1381374 ) ) ( not ( = ?auto_1381366 ?auto_1381367 ) ) ( not ( = ?auto_1381366 ?auto_1381368 ) ) ( not ( = ?auto_1381366 ?auto_1381369 ) ) ( not ( = ?auto_1381366 ?auto_1381370 ) ) ( not ( = ?auto_1381366 ?auto_1381374 ) ) ( not ( = ?auto_1381367 ?auto_1381368 ) ) ( not ( = ?auto_1381367 ?auto_1381369 ) ) ( not ( = ?auto_1381367 ?auto_1381370 ) ) ( not ( = ?auto_1381367 ?auto_1381374 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1381368 ?auto_1381369 ?auto_1381370 )
      ( MAKE-12CRATE-VERIFY ?auto_1381358 ?auto_1381359 ?auto_1381360 ?auto_1381362 ?auto_1381361 ?auto_1381363 ?auto_1381364 ?auto_1381365 ?auto_1381366 ?auto_1381367 ?auto_1381368 ?auto_1381369 ?auto_1381370 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1381521 - SURFACE
      ?auto_1381522 - SURFACE
      ?auto_1381523 - SURFACE
      ?auto_1381525 - SURFACE
      ?auto_1381524 - SURFACE
      ?auto_1381526 - SURFACE
      ?auto_1381527 - SURFACE
      ?auto_1381528 - SURFACE
      ?auto_1381529 - SURFACE
      ?auto_1381530 - SURFACE
      ?auto_1381531 - SURFACE
      ?auto_1381532 - SURFACE
      ?auto_1381533 - SURFACE
    )
    :vars
    (
      ?auto_1381539 - HOIST
      ?auto_1381537 - PLACE
      ?auto_1381535 - PLACE
      ?auto_1381538 - HOIST
      ?auto_1381534 - SURFACE
      ?auto_1381536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1381539 ?auto_1381537 ) ( SURFACE-AT ?auto_1381532 ?auto_1381537 ) ( CLEAR ?auto_1381532 ) ( IS-CRATE ?auto_1381533 ) ( not ( = ?auto_1381532 ?auto_1381533 ) ) ( AVAILABLE ?auto_1381539 ) ( ON ?auto_1381532 ?auto_1381531 ) ( not ( = ?auto_1381531 ?auto_1381532 ) ) ( not ( = ?auto_1381531 ?auto_1381533 ) ) ( not ( = ?auto_1381535 ?auto_1381537 ) ) ( HOIST-AT ?auto_1381538 ?auto_1381535 ) ( not ( = ?auto_1381539 ?auto_1381538 ) ) ( AVAILABLE ?auto_1381538 ) ( SURFACE-AT ?auto_1381533 ?auto_1381535 ) ( ON ?auto_1381533 ?auto_1381534 ) ( CLEAR ?auto_1381533 ) ( not ( = ?auto_1381532 ?auto_1381534 ) ) ( not ( = ?auto_1381533 ?auto_1381534 ) ) ( not ( = ?auto_1381531 ?auto_1381534 ) ) ( TRUCK-AT ?auto_1381536 ?auto_1381537 ) ( ON ?auto_1381522 ?auto_1381521 ) ( ON ?auto_1381523 ?auto_1381522 ) ( ON ?auto_1381525 ?auto_1381523 ) ( ON ?auto_1381524 ?auto_1381525 ) ( ON ?auto_1381526 ?auto_1381524 ) ( ON ?auto_1381527 ?auto_1381526 ) ( ON ?auto_1381528 ?auto_1381527 ) ( ON ?auto_1381529 ?auto_1381528 ) ( ON ?auto_1381530 ?auto_1381529 ) ( ON ?auto_1381531 ?auto_1381530 ) ( not ( = ?auto_1381521 ?auto_1381522 ) ) ( not ( = ?auto_1381521 ?auto_1381523 ) ) ( not ( = ?auto_1381521 ?auto_1381525 ) ) ( not ( = ?auto_1381521 ?auto_1381524 ) ) ( not ( = ?auto_1381521 ?auto_1381526 ) ) ( not ( = ?auto_1381521 ?auto_1381527 ) ) ( not ( = ?auto_1381521 ?auto_1381528 ) ) ( not ( = ?auto_1381521 ?auto_1381529 ) ) ( not ( = ?auto_1381521 ?auto_1381530 ) ) ( not ( = ?auto_1381521 ?auto_1381531 ) ) ( not ( = ?auto_1381521 ?auto_1381532 ) ) ( not ( = ?auto_1381521 ?auto_1381533 ) ) ( not ( = ?auto_1381521 ?auto_1381534 ) ) ( not ( = ?auto_1381522 ?auto_1381523 ) ) ( not ( = ?auto_1381522 ?auto_1381525 ) ) ( not ( = ?auto_1381522 ?auto_1381524 ) ) ( not ( = ?auto_1381522 ?auto_1381526 ) ) ( not ( = ?auto_1381522 ?auto_1381527 ) ) ( not ( = ?auto_1381522 ?auto_1381528 ) ) ( not ( = ?auto_1381522 ?auto_1381529 ) ) ( not ( = ?auto_1381522 ?auto_1381530 ) ) ( not ( = ?auto_1381522 ?auto_1381531 ) ) ( not ( = ?auto_1381522 ?auto_1381532 ) ) ( not ( = ?auto_1381522 ?auto_1381533 ) ) ( not ( = ?auto_1381522 ?auto_1381534 ) ) ( not ( = ?auto_1381523 ?auto_1381525 ) ) ( not ( = ?auto_1381523 ?auto_1381524 ) ) ( not ( = ?auto_1381523 ?auto_1381526 ) ) ( not ( = ?auto_1381523 ?auto_1381527 ) ) ( not ( = ?auto_1381523 ?auto_1381528 ) ) ( not ( = ?auto_1381523 ?auto_1381529 ) ) ( not ( = ?auto_1381523 ?auto_1381530 ) ) ( not ( = ?auto_1381523 ?auto_1381531 ) ) ( not ( = ?auto_1381523 ?auto_1381532 ) ) ( not ( = ?auto_1381523 ?auto_1381533 ) ) ( not ( = ?auto_1381523 ?auto_1381534 ) ) ( not ( = ?auto_1381525 ?auto_1381524 ) ) ( not ( = ?auto_1381525 ?auto_1381526 ) ) ( not ( = ?auto_1381525 ?auto_1381527 ) ) ( not ( = ?auto_1381525 ?auto_1381528 ) ) ( not ( = ?auto_1381525 ?auto_1381529 ) ) ( not ( = ?auto_1381525 ?auto_1381530 ) ) ( not ( = ?auto_1381525 ?auto_1381531 ) ) ( not ( = ?auto_1381525 ?auto_1381532 ) ) ( not ( = ?auto_1381525 ?auto_1381533 ) ) ( not ( = ?auto_1381525 ?auto_1381534 ) ) ( not ( = ?auto_1381524 ?auto_1381526 ) ) ( not ( = ?auto_1381524 ?auto_1381527 ) ) ( not ( = ?auto_1381524 ?auto_1381528 ) ) ( not ( = ?auto_1381524 ?auto_1381529 ) ) ( not ( = ?auto_1381524 ?auto_1381530 ) ) ( not ( = ?auto_1381524 ?auto_1381531 ) ) ( not ( = ?auto_1381524 ?auto_1381532 ) ) ( not ( = ?auto_1381524 ?auto_1381533 ) ) ( not ( = ?auto_1381524 ?auto_1381534 ) ) ( not ( = ?auto_1381526 ?auto_1381527 ) ) ( not ( = ?auto_1381526 ?auto_1381528 ) ) ( not ( = ?auto_1381526 ?auto_1381529 ) ) ( not ( = ?auto_1381526 ?auto_1381530 ) ) ( not ( = ?auto_1381526 ?auto_1381531 ) ) ( not ( = ?auto_1381526 ?auto_1381532 ) ) ( not ( = ?auto_1381526 ?auto_1381533 ) ) ( not ( = ?auto_1381526 ?auto_1381534 ) ) ( not ( = ?auto_1381527 ?auto_1381528 ) ) ( not ( = ?auto_1381527 ?auto_1381529 ) ) ( not ( = ?auto_1381527 ?auto_1381530 ) ) ( not ( = ?auto_1381527 ?auto_1381531 ) ) ( not ( = ?auto_1381527 ?auto_1381532 ) ) ( not ( = ?auto_1381527 ?auto_1381533 ) ) ( not ( = ?auto_1381527 ?auto_1381534 ) ) ( not ( = ?auto_1381528 ?auto_1381529 ) ) ( not ( = ?auto_1381528 ?auto_1381530 ) ) ( not ( = ?auto_1381528 ?auto_1381531 ) ) ( not ( = ?auto_1381528 ?auto_1381532 ) ) ( not ( = ?auto_1381528 ?auto_1381533 ) ) ( not ( = ?auto_1381528 ?auto_1381534 ) ) ( not ( = ?auto_1381529 ?auto_1381530 ) ) ( not ( = ?auto_1381529 ?auto_1381531 ) ) ( not ( = ?auto_1381529 ?auto_1381532 ) ) ( not ( = ?auto_1381529 ?auto_1381533 ) ) ( not ( = ?auto_1381529 ?auto_1381534 ) ) ( not ( = ?auto_1381530 ?auto_1381531 ) ) ( not ( = ?auto_1381530 ?auto_1381532 ) ) ( not ( = ?auto_1381530 ?auto_1381533 ) ) ( not ( = ?auto_1381530 ?auto_1381534 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1381531 ?auto_1381532 ?auto_1381533 )
      ( MAKE-12CRATE-VERIFY ?auto_1381521 ?auto_1381522 ?auto_1381523 ?auto_1381525 ?auto_1381524 ?auto_1381526 ?auto_1381527 ?auto_1381528 ?auto_1381529 ?auto_1381530 ?auto_1381531 ?auto_1381532 ?auto_1381533 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1381684 - SURFACE
      ?auto_1381685 - SURFACE
      ?auto_1381686 - SURFACE
      ?auto_1381688 - SURFACE
      ?auto_1381687 - SURFACE
      ?auto_1381689 - SURFACE
      ?auto_1381690 - SURFACE
      ?auto_1381691 - SURFACE
      ?auto_1381692 - SURFACE
      ?auto_1381693 - SURFACE
      ?auto_1381694 - SURFACE
      ?auto_1381695 - SURFACE
      ?auto_1381696 - SURFACE
    )
    :vars
    (
      ?auto_1381702 - HOIST
      ?auto_1381697 - PLACE
      ?auto_1381700 - PLACE
      ?auto_1381698 - HOIST
      ?auto_1381699 - SURFACE
      ?auto_1381701 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1381702 ?auto_1381697 ) ( IS-CRATE ?auto_1381696 ) ( not ( = ?auto_1381695 ?auto_1381696 ) ) ( not ( = ?auto_1381694 ?auto_1381695 ) ) ( not ( = ?auto_1381694 ?auto_1381696 ) ) ( not ( = ?auto_1381700 ?auto_1381697 ) ) ( HOIST-AT ?auto_1381698 ?auto_1381700 ) ( not ( = ?auto_1381702 ?auto_1381698 ) ) ( AVAILABLE ?auto_1381698 ) ( SURFACE-AT ?auto_1381696 ?auto_1381700 ) ( ON ?auto_1381696 ?auto_1381699 ) ( CLEAR ?auto_1381696 ) ( not ( = ?auto_1381695 ?auto_1381699 ) ) ( not ( = ?auto_1381696 ?auto_1381699 ) ) ( not ( = ?auto_1381694 ?auto_1381699 ) ) ( TRUCK-AT ?auto_1381701 ?auto_1381697 ) ( SURFACE-AT ?auto_1381694 ?auto_1381697 ) ( CLEAR ?auto_1381694 ) ( LIFTING ?auto_1381702 ?auto_1381695 ) ( IS-CRATE ?auto_1381695 ) ( ON ?auto_1381685 ?auto_1381684 ) ( ON ?auto_1381686 ?auto_1381685 ) ( ON ?auto_1381688 ?auto_1381686 ) ( ON ?auto_1381687 ?auto_1381688 ) ( ON ?auto_1381689 ?auto_1381687 ) ( ON ?auto_1381690 ?auto_1381689 ) ( ON ?auto_1381691 ?auto_1381690 ) ( ON ?auto_1381692 ?auto_1381691 ) ( ON ?auto_1381693 ?auto_1381692 ) ( ON ?auto_1381694 ?auto_1381693 ) ( not ( = ?auto_1381684 ?auto_1381685 ) ) ( not ( = ?auto_1381684 ?auto_1381686 ) ) ( not ( = ?auto_1381684 ?auto_1381688 ) ) ( not ( = ?auto_1381684 ?auto_1381687 ) ) ( not ( = ?auto_1381684 ?auto_1381689 ) ) ( not ( = ?auto_1381684 ?auto_1381690 ) ) ( not ( = ?auto_1381684 ?auto_1381691 ) ) ( not ( = ?auto_1381684 ?auto_1381692 ) ) ( not ( = ?auto_1381684 ?auto_1381693 ) ) ( not ( = ?auto_1381684 ?auto_1381694 ) ) ( not ( = ?auto_1381684 ?auto_1381695 ) ) ( not ( = ?auto_1381684 ?auto_1381696 ) ) ( not ( = ?auto_1381684 ?auto_1381699 ) ) ( not ( = ?auto_1381685 ?auto_1381686 ) ) ( not ( = ?auto_1381685 ?auto_1381688 ) ) ( not ( = ?auto_1381685 ?auto_1381687 ) ) ( not ( = ?auto_1381685 ?auto_1381689 ) ) ( not ( = ?auto_1381685 ?auto_1381690 ) ) ( not ( = ?auto_1381685 ?auto_1381691 ) ) ( not ( = ?auto_1381685 ?auto_1381692 ) ) ( not ( = ?auto_1381685 ?auto_1381693 ) ) ( not ( = ?auto_1381685 ?auto_1381694 ) ) ( not ( = ?auto_1381685 ?auto_1381695 ) ) ( not ( = ?auto_1381685 ?auto_1381696 ) ) ( not ( = ?auto_1381685 ?auto_1381699 ) ) ( not ( = ?auto_1381686 ?auto_1381688 ) ) ( not ( = ?auto_1381686 ?auto_1381687 ) ) ( not ( = ?auto_1381686 ?auto_1381689 ) ) ( not ( = ?auto_1381686 ?auto_1381690 ) ) ( not ( = ?auto_1381686 ?auto_1381691 ) ) ( not ( = ?auto_1381686 ?auto_1381692 ) ) ( not ( = ?auto_1381686 ?auto_1381693 ) ) ( not ( = ?auto_1381686 ?auto_1381694 ) ) ( not ( = ?auto_1381686 ?auto_1381695 ) ) ( not ( = ?auto_1381686 ?auto_1381696 ) ) ( not ( = ?auto_1381686 ?auto_1381699 ) ) ( not ( = ?auto_1381688 ?auto_1381687 ) ) ( not ( = ?auto_1381688 ?auto_1381689 ) ) ( not ( = ?auto_1381688 ?auto_1381690 ) ) ( not ( = ?auto_1381688 ?auto_1381691 ) ) ( not ( = ?auto_1381688 ?auto_1381692 ) ) ( not ( = ?auto_1381688 ?auto_1381693 ) ) ( not ( = ?auto_1381688 ?auto_1381694 ) ) ( not ( = ?auto_1381688 ?auto_1381695 ) ) ( not ( = ?auto_1381688 ?auto_1381696 ) ) ( not ( = ?auto_1381688 ?auto_1381699 ) ) ( not ( = ?auto_1381687 ?auto_1381689 ) ) ( not ( = ?auto_1381687 ?auto_1381690 ) ) ( not ( = ?auto_1381687 ?auto_1381691 ) ) ( not ( = ?auto_1381687 ?auto_1381692 ) ) ( not ( = ?auto_1381687 ?auto_1381693 ) ) ( not ( = ?auto_1381687 ?auto_1381694 ) ) ( not ( = ?auto_1381687 ?auto_1381695 ) ) ( not ( = ?auto_1381687 ?auto_1381696 ) ) ( not ( = ?auto_1381687 ?auto_1381699 ) ) ( not ( = ?auto_1381689 ?auto_1381690 ) ) ( not ( = ?auto_1381689 ?auto_1381691 ) ) ( not ( = ?auto_1381689 ?auto_1381692 ) ) ( not ( = ?auto_1381689 ?auto_1381693 ) ) ( not ( = ?auto_1381689 ?auto_1381694 ) ) ( not ( = ?auto_1381689 ?auto_1381695 ) ) ( not ( = ?auto_1381689 ?auto_1381696 ) ) ( not ( = ?auto_1381689 ?auto_1381699 ) ) ( not ( = ?auto_1381690 ?auto_1381691 ) ) ( not ( = ?auto_1381690 ?auto_1381692 ) ) ( not ( = ?auto_1381690 ?auto_1381693 ) ) ( not ( = ?auto_1381690 ?auto_1381694 ) ) ( not ( = ?auto_1381690 ?auto_1381695 ) ) ( not ( = ?auto_1381690 ?auto_1381696 ) ) ( not ( = ?auto_1381690 ?auto_1381699 ) ) ( not ( = ?auto_1381691 ?auto_1381692 ) ) ( not ( = ?auto_1381691 ?auto_1381693 ) ) ( not ( = ?auto_1381691 ?auto_1381694 ) ) ( not ( = ?auto_1381691 ?auto_1381695 ) ) ( not ( = ?auto_1381691 ?auto_1381696 ) ) ( not ( = ?auto_1381691 ?auto_1381699 ) ) ( not ( = ?auto_1381692 ?auto_1381693 ) ) ( not ( = ?auto_1381692 ?auto_1381694 ) ) ( not ( = ?auto_1381692 ?auto_1381695 ) ) ( not ( = ?auto_1381692 ?auto_1381696 ) ) ( not ( = ?auto_1381692 ?auto_1381699 ) ) ( not ( = ?auto_1381693 ?auto_1381694 ) ) ( not ( = ?auto_1381693 ?auto_1381695 ) ) ( not ( = ?auto_1381693 ?auto_1381696 ) ) ( not ( = ?auto_1381693 ?auto_1381699 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1381694 ?auto_1381695 ?auto_1381696 )
      ( MAKE-12CRATE-VERIFY ?auto_1381684 ?auto_1381685 ?auto_1381686 ?auto_1381688 ?auto_1381687 ?auto_1381689 ?auto_1381690 ?auto_1381691 ?auto_1381692 ?auto_1381693 ?auto_1381694 ?auto_1381695 ?auto_1381696 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1381847 - SURFACE
      ?auto_1381848 - SURFACE
      ?auto_1381849 - SURFACE
      ?auto_1381851 - SURFACE
      ?auto_1381850 - SURFACE
      ?auto_1381852 - SURFACE
      ?auto_1381853 - SURFACE
      ?auto_1381854 - SURFACE
      ?auto_1381855 - SURFACE
      ?auto_1381856 - SURFACE
      ?auto_1381857 - SURFACE
      ?auto_1381858 - SURFACE
      ?auto_1381859 - SURFACE
    )
    :vars
    (
      ?auto_1381864 - HOIST
      ?auto_1381863 - PLACE
      ?auto_1381861 - PLACE
      ?auto_1381862 - HOIST
      ?auto_1381865 - SURFACE
      ?auto_1381860 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1381864 ?auto_1381863 ) ( IS-CRATE ?auto_1381859 ) ( not ( = ?auto_1381858 ?auto_1381859 ) ) ( not ( = ?auto_1381857 ?auto_1381858 ) ) ( not ( = ?auto_1381857 ?auto_1381859 ) ) ( not ( = ?auto_1381861 ?auto_1381863 ) ) ( HOIST-AT ?auto_1381862 ?auto_1381861 ) ( not ( = ?auto_1381864 ?auto_1381862 ) ) ( AVAILABLE ?auto_1381862 ) ( SURFACE-AT ?auto_1381859 ?auto_1381861 ) ( ON ?auto_1381859 ?auto_1381865 ) ( CLEAR ?auto_1381859 ) ( not ( = ?auto_1381858 ?auto_1381865 ) ) ( not ( = ?auto_1381859 ?auto_1381865 ) ) ( not ( = ?auto_1381857 ?auto_1381865 ) ) ( TRUCK-AT ?auto_1381860 ?auto_1381863 ) ( SURFACE-AT ?auto_1381857 ?auto_1381863 ) ( CLEAR ?auto_1381857 ) ( IS-CRATE ?auto_1381858 ) ( AVAILABLE ?auto_1381864 ) ( IN ?auto_1381858 ?auto_1381860 ) ( ON ?auto_1381848 ?auto_1381847 ) ( ON ?auto_1381849 ?auto_1381848 ) ( ON ?auto_1381851 ?auto_1381849 ) ( ON ?auto_1381850 ?auto_1381851 ) ( ON ?auto_1381852 ?auto_1381850 ) ( ON ?auto_1381853 ?auto_1381852 ) ( ON ?auto_1381854 ?auto_1381853 ) ( ON ?auto_1381855 ?auto_1381854 ) ( ON ?auto_1381856 ?auto_1381855 ) ( ON ?auto_1381857 ?auto_1381856 ) ( not ( = ?auto_1381847 ?auto_1381848 ) ) ( not ( = ?auto_1381847 ?auto_1381849 ) ) ( not ( = ?auto_1381847 ?auto_1381851 ) ) ( not ( = ?auto_1381847 ?auto_1381850 ) ) ( not ( = ?auto_1381847 ?auto_1381852 ) ) ( not ( = ?auto_1381847 ?auto_1381853 ) ) ( not ( = ?auto_1381847 ?auto_1381854 ) ) ( not ( = ?auto_1381847 ?auto_1381855 ) ) ( not ( = ?auto_1381847 ?auto_1381856 ) ) ( not ( = ?auto_1381847 ?auto_1381857 ) ) ( not ( = ?auto_1381847 ?auto_1381858 ) ) ( not ( = ?auto_1381847 ?auto_1381859 ) ) ( not ( = ?auto_1381847 ?auto_1381865 ) ) ( not ( = ?auto_1381848 ?auto_1381849 ) ) ( not ( = ?auto_1381848 ?auto_1381851 ) ) ( not ( = ?auto_1381848 ?auto_1381850 ) ) ( not ( = ?auto_1381848 ?auto_1381852 ) ) ( not ( = ?auto_1381848 ?auto_1381853 ) ) ( not ( = ?auto_1381848 ?auto_1381854 ) ) ( not ( = ?auto_1381848 ?auto_1381855 ) ) ( not ( = ?auto_1381848 ?auto_1381856 ) ) ( not ( = ?auto_1381848 ?auto_1381857 ) ) ( not ( = ?auto_1381848 ?auto_1381858 ) ) ( not ( = ?auto_1381848 ?auto_1381859 ) ) ( not ( = ?auto_1381848 ?auto_1381865 ) ) ( not ( = ?auto_1381849 ?auto_1381851 ) ) ( not ( = ?auto_1381849 ?auto_1381850 ) ) ( not ( = ?auto_1381849 ?auto_1381852 ) ) ( not ( = ?auto_1381849 ?auto_1381853 ) ) ( not ( = ?auto_1381849 ?auto_1381854 ) ) ( not ( = ?auto_1381849 ?auto_1381855 ) ) ( not ( = ?auto_1381849 ?auto_1381856 ) ) ( not ( = ?auto_1381849 ?auto_1381857 ) ) ( not ( = ?auto_1381849 ?auto_1381858 ) ) ( not ( = ?auto_1381849 ?auto_1381859 ) ) ( not ( = ?auto_1381849 ?auto_1381865 ) ) ( not ( = ?auto_1381851 ?auto_1381850 ) ) ( not ( = ?auto_1381851 ?auto_1381852 ) ) ( not ( = ?auto_1381851 ?auto_1381853 ) ) ( not ( = ?auto_1381851 ?auto_1381854 ) ) ( not ( = ?auto_1381851 ?auto_1381855 ) ) ( not ( = ?auto_1381851 ?auto_1381856 ) ) ( not ( = ?auto_1381851 ?auto_1381857 ) ) ( not ( = ?auto_1381851 ?auto_1381858 ) ) ( not ( = ?auto_1381851 ?auto_1381859 ) ) ( not ( = ?auto_1381851 ?auto_1381865 ) ) ( not ( = ?auto_1381850 ?auto_1381852 ) ) ( not ( = ?auto_1381850 ?auto_1381853 ) ) ( not ( = ?auto_1381850 ?auto_1381854 ) ) ( not ( = ?auto_1381850 ?auto_1381855 ) ) ( not ( = ?auto_1381850 ?auto_1381856 ) ) ( not ( = ?auto_1381850 ?auto_1381857 ) ) ( not ( = ?auto_1381850 ?auto_1381858 ) ) ( not ( = ?auto_1381850 ?auto_1381859 ) ) ( not ( = ?auto_1381850 ?auto_1381865 ) ) ( not ( = ?auto_1381852 ?auto_1381853 ) ) ( not ( = ?auto_1381852 ?auto_1381854 ) ) ( not ( = ?auto_1381852 ?auto_1381855 ) ) ( not ( = ?auto_1381852 ?auto_1381856 ) ) ( not ( = ?auto_1381852 ?auto_1381857 ) ) ( not ( = ?auto_1381852 ?auto_1381858 ) ) ( not ( = ?auto_1381852 ?auto_1381859 ) ) ( not ( = ?auto_1381852 ?auto_1381865 ) ) ( not ( = ?auto_1381853 ?auto_1381854 ) ) ( not ( = ?auto_1381853 ?auto_1381855 ) ) ( not ( = ?auto_1381853 ?auto_1381856 ) ) ( not ( = ?auto_1381853 ?auto_1381857 ) ) ( not ( = ?auto_1381853 ?auto_1381858 ) ) ( not ( = ?auto_1381853 ?auto_1381859 ) ) ( not ( = ?auto_1381853 ?auto_1381865 ) ) ( not ( = ?auto_1381854 ?auto_1381855 ) ) ( not ( = ?auto_1381854 ?auto_1381856 ) ) ( not ( = ?auto_1381854 ?auto_1381857 ) ) ( not ( = ?auto_1381854 ?auto_1381858 ) ) ( not ( = ?auto_1381854 ?auto_1381859 ) ) ( not ( = ?auto_1381854 ?auto_1381865 ) ) ( not ( = ?auto_1381855 ?auto_1381856 ) ) ( not ( = ?auto_1381855 ?auto_1381857 ) ) ( not ( = ?auto_1381855 ?auto_1381858 ) ) ( not ( = ?auto_1381855 ?auto_1381859 ) ) ( not ( = ?auto_1381855 ?auto_1381865 ) ) ( not ( = ?auto_1381856 ?auto_1381857 ) ) ( not ( = ?auto_1381856 ?auto_1381858 ) ) ( not ( = ?auto_1381856 ?auto_1381859 ) ) ( not ( = ?auto_1381856 ?auto_1381865 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1381857 ?auto_1381858 ?auto_1381859 )
      ( MAKE-12CRATE-VERIFY ?auto_1381847 ?auto_1381848 ?auto_1381849 ?auto_1381851 ?auto_1381850 ?auto_1381852 ?auto_1381853 ?auto_1381854 ?auto_1381855 ?auto_1381856 ?auto_1381857 ?auto_1381858 ?auto_1381859 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1393425 - SURFACE
      ?auto_1393426 - SURFACE
      ?auto_1393427 - SURFACE
      ?auto_1393429 - SURFACE
      ?auto_1393428 - SURFACE
      ?auto_1393430 - SURFACE
      ?auto_1393431 - SURFACE
      ?auto_1393432 - SURFACE
      ?auto_1393433 - SURFACE
      ?auto_1393434 - SURFACE
      ?auto_1393435 - SURFACE
      ?auto_1393436 - SURFACE
      ?auto_1393437 - SURFACE
      ?auto_1393438 - SURFACE
    )
    :vars
    (
      ?auto_1393439 - HOIST
      ?auto_1393440 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1393439 ?auto_1393440 ) ( SURFACE-AT ?auto_1393437 ?auto_1393440 ) ( CLEAR ?auto_1393437 ) ( LIFTING ?auto_1393439 ?auto_1393438 ) ( IS-CRATE ?auto_1393438 ) ( not ( = ?auto_1393437 ?auto_1393438 ) ) ( ON ?auto_1393426 ?auto_1393425 ) ( ON ?auto_1393427 ?auto_1393426 ) ( ON ?auto_1393429 ?auto_1393427 ) ( ON ?auto_1393428 ?auto_1393429 ) ( ON ?auto_1393430 ?auto_1393428 ) ( ON ?auto_1393431 ?auto_1393430 ) ( ON ?auto_1393432 ?auto_1393431 ) ( ON ?auto_1393433 ?auto_1393432 ) ( ON ?auto_1393434 ?auto_1393433 ) ( ON ?auto_1393435 ?auto_1393434 ) ( ON ?auto_1393436 ?auto_1393435 ) ( ON ?auto_1393437 ?auto_1393436 ) ( not ( = ?auto_1393425 ?auto_1393426 ) ) ( not ( = ?auto_1393425 ?auto_1393427 ) ) ( not ( = ?auto_1393425 ?auto_1393429 ) ) ( not ( = ?auto_1393425 ?auto_1393428 ) ) ( not ( = ?auto_1393425 ?auto_1393430 ) ) ( not ( = ?auto_1393425 ?auto_1393431 ) ) ( not ( = ?auto_1393425 ?auto_1393432 ) ) ( not ( = ?auto_1393425 ?auto_1393433 ) ) ( not ( = ?auto_1393425 ?auto_1393434 ) ) ( not ( = ?auto_1393425 ?auto_1393435 ) ) ( not ( = ?auto_1393425 ?auto_1393436 ) ) ( not ( = ?auto_1393425 ?auto_1393437 ) ) ( not ( = ?auto_1393425 ?auto_1393438 ) ) ( not ( = ?auto_1393426 ?auto_1393427 ) ) ( not ( = ?auto_1393426 ?auto_1393429 ) ) ( not ( = ?auto_1393426 ?auto_1393428 ) ) ( not ( = ?auto_1393426 ?auto_1393430 ) ) ( not ( = ?auto_1393426 ?auto_1393431 ) ) ( not ( = ?auto_1393426 ?auto_1393432 ) ) ( not ( = ?auto_1393426 ?auto_1393433 ) ) ( not ( = ?auto_1393426 ?auto_1393434 ) ) ( not ( = ?auto_1393426 ?auto_1393435 ) ) ( not ( = ?auto_1393426 ?auto_1393436 ) ) ( not ( = ?auto_1393426 ?auto_1393437 ) ) ( not ( = ?auto_1393426 ?auto_1393438 ) ) ( not ( = ?auto_1393427 ?auto_1393429 ) ) ( not ( = ?auto_1393427 ?auto_1393428 ) ) ( not ( = ?auto_1393427 ?auto_1393430 ) ) ( not ( = ?auto_1393427 ?auto_1393431 ) ) ( not ( = ?auto_1393427 ?auto_1393432 ) ) ( not ( = ?auto_1393427 ?auto_1393433 ) ) ( not ( = ?auto_1393427 ?auto_1393434 ) ) ( not ( = ?auto_1393427 ?auto_1393435 ) ) ( not ( = ?auto_1393427 ?auto_1393436 ) ) ( not ( = ?auto_1393427 ?auto_1393437 ) ) ( not ( = ?auto_1393427 ?auto_1393438 ) ) ( not ( = ?auto_1393429 ?auto_1393428 ) ) ( not ( = ?auto_1393429 ?auto_1393430 ) ) ( not ( = ?auto_1393429 ?auto_1393431 ) ) ( not ( = ?auto_1393429 ?auto_1393432 ) ) ( not ( = ?auto_1393429 ?auto_1393433 ) ) ( not ( = ?auto_1393429 ?auto_1393434 ) ) ( not ( = ?auto_1393429 ?auto_1393435 ) ) ( not ( = ?auto_1393429 ?auto_1393436 ) ) ( not ( = ?auto_1393429 ?auto_1393437 ) ) ( not ( = ?auto_1393429 ?auto_1393438 ) ) ( not ( = ?auto_1393428 ?auto_1393430 ) ) ( not ( = ?auto_1393428 ?auto_1393431 ) ) ( not ( = ?auto_1393428 ?auto_1393432 ) ) ( not ( = ?auto_1393428 ?auto_1393433 ) ) ( not ( = ?auto_1393428 ?auto_1393434 ) ) ( not ( = ?auto_1393428 ?auto_1393435 ) ) ( not ( = ?auto_1393428 ?auto_1393436 ) ) ( not ( = ?auto_1393428 ?auto_1393437 ) ) ( not ( = ?auto_1393428 ?auto_1393438 ) ) ( not ( = ?auto_1393430 ?auto_1393431 ) ) ( not ( = ?auto_1393430 ?auto_1393432 ) ) ( not ( = ?auto_1393430 ?auto_1393433 ) ) ( not ( = ?auto_1393430 ?auto_1393434 ) ) ( not ( = ?auto_1393430 ?auto_1393435 ) ) ( not ( = ?auto_1393430 ?auto_1393436 ) ) ( not ( = ?auto_1393430 ?auto_1393437 ) ) ( not ( = ?auto_1393430 ?auto_1393438 ) ) ( not ( = ?auto_1393431 ?auto_1393432 ) ) ( not ( = ?auto_1393431 ?auto_1393433 ) ) ( not ( = ?auto_1393431 ?auto_1393434 ) ) ( not ( = ?auto_1393431 ?auto_1393435 ) ) ( not ( = ?auto_1393431 ?auto_1393436 ) ) ( not ( = ?auto_1393431 ?auto_1393437 ) ) ( not ( = ?auto_1393431 ?auto_1393438 ) ) ( not ( = ?auto_1393432 ?auto_1393433 ) ) ( not ( = ?auto_1393432 ?auto_1393434 ) ) ( not ( = ?auto_1393432 ?auto_1393435 ) ) ( not ( = ?auto_1393432 ?auto_1393436 ) ) ( not ( = ?auto_1393432 ?auto_1393437 ) ) ( not ( = ?auto_1393432 ?auto_1393438 ) ) ( not ( = ?auto_1393433 ?auto_1393434 ) ) ( not ( = ?auto_1393433 ?auto_1393435 ) ) ( not ( = ?auto_1393433 ?auto_1393436 ) ) ( not ( = ?auto_1393433 ?auto_1393437 ) ) ( not ( = ?auto_1393433 ?auto_1393438 ) ) ( not ( = ?auto_1393434 ?auto_1393435 ) ) ( not ( = ?auto_1393434 ?auto_1393436 ) ) ( not ( = ?auto_1393434 ?auto_1393437 ) ) ( not ( = ?auto_1393434 ?auto_1393438 ) ) ( not ( = ?auto_1393435 ?auto_1393436 ) ) ( not ( = ?auto_1393435 ?auto_1393437 ) ) ( not ( = ?auto_1393435 ?auto_1393438 ) ) ( not ( = ?auto_1393436 ?auto_1393437 ) ) ( not ( = ?auto_1393436 ?auto_1393438 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1393437 ?auto_1393438 )
      ( MAKE-13CRATE-VERIFY ?auto_1393425 ?auto_1393426 ?auto_1393427 ?auto_1393429 ?auto_1393428 ?auto_1393430 ?auto_1393431 ?auto_1393432 ?auto_1393433 ?auto_1393434 ?auto_1393435 ?auto_1393436 ?auto_1393437 ?auto_1393438 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1393567 - SURFACE
      ?auto_1393568 - SURFACE
      ?auto_1393569 - SURFACE
      ?auto_1393571 - SURFACE
      ?auto_1393570 - SURFACE
      ?auto_1393572 - SURFACE
      ?auto_1393573 - SURFACE
      ?auto_1393574 - SURFACE
      ?auto_1393575 - SURFACE
      ?auto_1393576 - SURFACE
      ?auto_1393577 - SURFACE
      ?auto_1393578 - SURFACE
      ?auto_1393579 - SURFACE
      ?auto_1393580 - SURFACE
    )
    :vars
    (
      ?auto_1393582 - HOIST
      ?auto_1393581 - PLACE
      ?auto_1393583 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1393582 ?auto_1393581 ) ( SURFACE-AT ?auto_1393579 ?auto_1393581 ) ( CLEAR ?auto_1393579 ) ( IS-CRATE ?auto_1393580 ) ( not ( = ?auto_1393579 ?auto_1393580 ) ) ( TRUCK-AT ?auto_1393583 ?auto_1393581 ) ( AVAILABLE ?auto_1393582 ) ( IN ?auto_1393580 ?auto_1393583 ) ( ON ?auto_1393579 ?auto_1393578 ) ( not ( = ?auto_1393578 ?auto_1393579 ) ) ( not ( = ?auto_1393578 ?auto_1393580 ) ) ( ON ?auto_1393568 ?auto_1393567 ) ( ON ?auto_1393569 ?auto_1393568 ) ( ON ?auto_1393571 ?auto_1393569 ) ( ON ?auto_1393570 ?auto_1393571 ) ( ON ?auto_1393572 ?auto_1393570 ) ( ON ?auto_1393573 ?auto_1393572 ) ( ON ?auto_1393574 ?auto_1393573 ) ( ON ?auto_1393575 ?auto_1393574 ) ( ON ?auto_1393576 ?auto_1393575 ) ( ON ?auto_1393577 ?auto_1393576 ) ( ON ?auto_1393578 ?auto_1393577 ) ( not ( = ?auto_1393567 ?auto_1393568 ) ) ( not ( = ?auto_1393567 ?auto_1393569 ) ) ( not ( = ?auto_1393567 ?auto_1393571 ) ) ( not ( = ?auto_1393567 ?auto_1393570 ) ) ( not ( = ?auto_1393567 ?auto_1393572 ) ) ( not ( = ?auto_1393567 ?auto_1393573 ) ) ( not ( = ?auto_1393567 ?auto_1393574 ) ) ( not ( = ?auto_1393567 ?auto_1393575 ) ) ( not ( = ?auto_1393567 ?auto_1393576 ) ) ( not ( = ?auto_1393567 ?auto_1393577 ) ) ( not ( = ?auto_1393567 ?auto_1393578 ) ) ( not ( = ?auto_1393567 ?auto_1393579 ) ) ( not ( = ?auto_1393567 ?auto_1393580 ) ) ( not ( = ?auto_1393568 ?auto_1393569 ) ) ( not ( = ?auto_1393568 ?auto_1393571 ) ) ( not ( = ?auto_1393568 ?auto_1393570 ) ) ( not ( = ?auto_1393568 ?auto_1393572 ) ) ( not ( = ?auto_1393568 ?auto_1393573 ) ) ( not ( = ?auto_1393568 ?auto_1393574 ) ) ( not ( = ?auto_1393568 ?auto_1393575 ) ) ( not ( = ?auto_1393568 ?auto_1393576 ) ) ( not ( = ?auto_1393568 ?auto_1393577 ) ) ( not ( = ?auto_1393568 ?auto_1393578 ) ) ( not ( = ?auto_1393568 ?auto_1393579 ) ) ( not ( = ?auto_1393568 ?auto_1393580 ) ) ( not ( = ?auto_1393569 ?auto_1393571 ) ) ( not ( = ?auto_1393569 ?auto_1393570 ) ) ( not ( = ?auto_1393569 ?auto_1393572 ) ) ( not ( = ?auto_1393569 ?auto_1393573 ) ) ( not ( = ?auto_1393569 ?auto_1393574 ) ) ( not ( = ?auto_1393569 ?auto_1393575 ) ) ( not ( = ?auto_1393569 ?auto_1393576 ) ) ( not ( = ?auto_1393569 ?auto_1393577 ) ) ( not ( = ?auto_1393569 ?auto_1393578 ) ) ( not ( = ?auto_1393569 ?auto_1393579 ) ) ( not ( = ?auto_1393569 ?auto_1393580 ) ) ( not ( = ?auto_1393571 ?auto_1393570 ) ) ( not ( = ?auto_1393571 ?auto_1393572 ) ) ( not ( = ?auto_1393571 ?auto_1393573 ) ) ( not ( = ?auto_1393571 ?auto_1393574 ) ) ( not ( = ?auto_1393571 ?auto_1393575 ) ) ( not ( = ?auto_1393571 ?auto_1393576 ) ) ( not ( = ?auto_1393571 ?auto_1393577 ) ) ( not ( = ?auto_1393571 ?auto_1393578 ) ) ( not ( = ?auto_1393571 ?auto_1393579 ) ) ( not ( = ?auto_1393571 ?auto_1393580 ) ) ( not ( = ?auto_1393570 ?auto_1393572 ) ) ( not ( = ?auto_1393570 ?auto_1393573 ) ) ( not ( = ?auto_1393570 ?auto_1393574 ) ) ( not ( = ?auto_1393570 ?auto_1393575 ) ) ( not ( = ?auto_1393570 ?auto_1393576 ) ) ( not ( = ?auto_1393570 ?auto_1393577 ) ) ( not ( = ?auto_1393570 ?auto_1393578 ) ) ( not ( = ?auto_1393570 ?auto_1393579 ) ) ( not ( = ?auto_1393570 ?auto_1393580 ) ) ( not ( = ?auto_1393572 ?auto_1393573 ) ) ( not ( = ?auto_1393572 ?auto_1393574 ) ) ( not ( = ?auto_1393572 ?auto_1393575 ) ) ( not ( = ?auto_1393572 ?auto_1393576 ) ) ( not ( = ?auto_1393572 ?auto_1393577 ) ) ( not ( = ?auto_1393572 ?auto_1393578 ) ) ( not ( = ?auto_1393572 ?auto_1393579 ) ) ( not ( = ?auto_1393572 ?auto_1393580 ) ) ( not ( = ?auto_1393573 ?auto_1393574 ) ) ( not ( = ?auto_1393573 ?auto_1393575 ) ) ( not ( = ?auto_1393573 ?auto_1393576 ) ) ( not ( = ?auto_1393573 ?auto_1393577 ) ) ( not ( = ?auto_1393573 ?auto_1393578 ) ) ( not ( = ?auto_1393573 ?auto_1393579 ) ) ( not ( = ?auto_1393573 ?auto_1393580 ) ) ( not ( = ?auto_1393574 ?auto_1393575 ) ) ( not ( = ?auto_1393574 ?auto_1393576 ) ) ( not ( = ?auto_1393574 ?auto_1393577 ) ) ( not ( = ?auto_1393574 ?auto_1393578 ) ) ( not ( = ?auto_1393574 ?auto_1393579 ) ) ( not ( = ?auto_1393574 ?auto_1393580 ) ) ( not ( = ?auto_1393575 ?auto_1393576 ) ) ( not ( = ?auto_1393575 ?auto_1393577 ) ) ( not ( = ?auto_1393575 ?auto_1393578 ) ) ( not ( = ?auto_1393575 ?auto_1393579 ) ) ( not ( = ?auto_1393575 ?auto_1393580 ) ) ( not ( = ?auto_1393576 ?auto_1393577 ) ) ( not ( = ?auto_1393576 ?auto_1393578 ) ) ( not ( = ?auto_1393576 ?auto_1393579 ) ) ( not ( = ?auto_1393576 ?auto_1393580 ) ) ( not ( = ?auto_1393577 ?auto_1393578 ) ) ( not ( = ?auto_1393577 ?auto_1393579 ) ) ( not ( = ?auto_1393577 ?auto_1393580 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1393578 ?auto_1393579 ?auto_1393580 )
      ( MAKE-13CRATE-VERIFY ?auto_1393567 ?auto_1393568 ?auto_1393569 ?auto_1393571 ?auto_1393570 ?auto_1393572 ?auto_1393573 ?auto_1393574 ?auto_1393575 ?auto_1393576 ?auto_1393577 ?auto_1393578 ?auto_1393579 ?auto_1393580 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1393723 - SURFACE
      ?auto_1393724 - SURFACE
      ?auto_1393725 - SURFACE
      ?auto_1393727 - SURFACE
      ?auto_1393726 - SURFACE
      ?auto_1393728 - SURFACE
      ?auto_1393729 - SURFACE
      ?auto_1393730 - SURFACE
      ?auto_1393731 - SURFACE
      ?auto_1393732 - SURFACE
      ?auto_1393733 - SURFACE
      ?auto_1393734 - SURFACE
      ?auto_1393735 - SURFACE
      ?auto_1393736 - SURFACE
    )
    :vars
    (
      ?auto_1393740 - HOIST
      ?auto_1393737 - PLACE
      ?auto_1393738 - TRUCK
      ?auto_1393739 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1393740 ?auto_1393737 ) ( SURFACE-AT ?auto_1393735 ?auto_1393737 ) ( CLEAR ?auto_1393735 ) ( IS-CRATE ?auto_1393736 ) ( not ( = ?auto_1393735 ?auto_1393736 ) ) ( AVAILABLE ?auto_1393740 ) ( IN ?auto_1393736 ?auto_1393738 ) ( ON ?auto_1393735 ?auto_1393734 ) ( not ( = ?auto_1393734 ?auto_1393735 ) ) ( not ( = ?auto_1393734 ?auto_1393736 ) ) ( TRUCK-AT ?auto_1393738 ?auto_1393739 ) ( not ( = ?auto_1393739 ?auto_1393737 ) ) ( ON ?auto_1393724 ?auto_1393723 ) ( ON ?auto_1393725 ?auto_1393724 ) ( ON ?auto_1393727 ?auto_1393725 ) ( ON ?auto_1393726 ?auto_1393727 ) ( ON ?auto_1393728 ?auto_1393726 ) ( ON ?auto_1393729 ?auto_1393728 ) ( ON ?auto_1393730 ?auto_1393729 ) ( ON ?auto_1393731 ?auto_1393730 ) ( ON ?auto_1393732 ?auto_1393731 ) ( ON ?auto_1393733 ?auto_1393732 ) ( ON ?auto_1393734 ?auto_1393733 ) ( not ( = ?auto_1393723 ?auto_1393724 ) ) ( not ( = ?auto_1393723 ?auto_1393725 ) ) ( not ( = ?auto_1393723 ?auto_1393727 ) ) ( not ( = ?auto_1393723 ?auto_1393726 ) ) ( not ( = ?auto_1393723 ?auto_1393728 ) ) ( not ( = ?auto_1393723 ?auto_1393729 ) ) ( not ( = ?auto_1393723 ?auto_1393730 ) ) ( not ( = ?auto_1393723 ?auto_1393731 ) ) ( not ( = ?auto_1393723 ?auto_1393732 ) ) ( not ( = ?auto_1393723 ?auto_1393733 ) ) ( not ( = ?auto_1393723 ?auto_1393734 ) ) ( not ( = ?auto_1393723 ?auto_1393735 ) ) ( not ( = ?auto_1393723 ?auto_1393736 ) ) ( not ( = ?auto_1393724 ?auto_1393725 ) ) ( not ( = ?auto_1393724 ?auto_1393727 ) ) ( not ( = ?auto_1393724 ?auto_1393726 ) ) ( not ( = ?auto_1393724 ?auto_1393728 ) ) ( not ( = ?auto_1393724 ?auto_1393729 ) ) ( not ( = ?auto_1393724 ?auto_1393730 ) ) ( not ( = ?auto_1393724 ?auto_1393731 ) ) ( not ( = ?auto_1393724 ?auto_1393732 ) ) ( not ( = ?auto_1393724 ?auto_1393733 ) ) ( not ( = ?auto_1393724 ?auto_1393734 ) ) ( not ( = ?auto_1393724 ?auto_1393735 ) ) ( not ( = ?auto_1393724 ?auto_1393736 ) ) ( not ( = ?auto_1393725 ?auto_1393727 ) ) ( not ( = ?auto_1393725 ?auto_1393726 ) ) ( not ( = ?auto_1393725 ?auto_1393728 ) ) ( not ( = ?auto_1393725 ?auto_1393729 ) ) ( not ( = ?auto_1393725 ?auto_1393730 ) ) ( not ( = ?auto_1393725 ?auto_1393731 ) ) ( not ( = ?auto_1393725 ?auto_1393732 ) ) ( not ( = ?auto_1393725 ?auto_1393733 ) ) ( not ( = ?auto_1393725 ?auto_1393734 ) ) ( not ( = ?auto_1393725 ?auto_1393735 ) ) ( not ( = ?auto_1393725 ?auto_1393736 ) ) ( not ( = ?auto_1393727 ?auto_1393726 ) ) ( not ( = ?auto_1393727 ?auto_1393728 ) ) ( not ( = ?auto_1393727 ?auto_1393729 ) ) ( not ( = ?auto_1393727 ?auto_1393730 ) ) ( not ( = ?auto_1393727 ?auto_1393731 ) ) ( not ( = ?auto_1393727 ?auto_1393732 ) ) ( not ( = ?auto_1393727 ?auto_1393733 ) ) ( not ( = ?auto_1393727 ?auto_1393734 ) ) ( not ( = ?auto_1393727 ?auto_1393735 ) ) ( not ( = ?auto_1393727 ?auto_1393736 ) ) ( not ( = ?auto_1393726 ?auto_1393728 ) ) ( not ( = ?auto_1393726 ?auto_1393729 ) ) ( not ( = ?auto_1393726 ?auto_1393730 ) ) ( not ( = ?auto_1393726 ?auto_1393731 ) ) ( not ( = ?auto_1393726 ?auto_1393732 ) ) ( not ( = ?auto_1393726 ?auto_1393733 ) ) ( not ( = ?auto_1393726 ?auto_1393734 ) ) ( not ( = ?auto_1393726 ?auto_1393735 ) ) ( not ( = ?auto_1393726 ?auto_1393736 ) ) ( not ( = ?auto_1393728 ?auto_1393729 ) ) ( not ( = ?auto_1393728 ?auto_1393730 ) ) ( not ( = ?auto_1393728 ?auto_1393731 ) ) ( not ( = ?auto_1393728 ?auto_1393732 ) ) ( not ( = ?auto_1393728 ?auto_1393733 ) ) ( not ( = ?auto_1393728 ?auto_1393734 ) ) ( not ( = ?auto_1393728 ?auto_1393735 ) ) ( not ( = ?auto_1393728 ?auto_1393736 ) ) ( not ( = ?auto_1393729 ?auto_1393730 ) ) ( not ( = ?auto_1393729 ?auto_1393731 ) ) ( not ( = ?auto_1393729 ?auto_1393732 ) ) ( not ( = ?auto_1393729 ?auto_1393733 ) ) ( not ( = ?auto_1393729 ?auto_1393734 ) ) ( not ( = ?auto_1393729 ?auto_1393735 ) ) ( not ( = ?auto_1393729 ?auto_1393736 ) ) ( not ( = ?auto_1393730 ?auto_1393731 ) ) ( not ( = ?auto_1393730 ?auto_1393732 ) ) ( not ( = ?auto_1393730 ?auto_1393733 ) ) ( not ( = ?auto_1393730 ?auto_1393734 ) ) ( not ( = ?auto_1393730 ?auto_1393735 ) ) ( not ( = ?auto_1393730 ?auto_1393736 ) ) ( not ( = ?auto_1393731 ?auto_1393732 ) ) ( not ( = ?auto_1393731 ?auto_1393733 ) ) ( not ( = ?auto_1393731 ?auto_1393734 ) ) ( not ( = ?auto_1393731 ?auto_1393735 ) ) ( not ( = ?auto_1393731 ?auto_1393736 ) ) ( not ( = ?auto_1393732 ?auto_1393733 ) ) ( not ( = ?auto_1393732 ?auto_1393734 ) ) ( not ( = ?auto_1393732 ?auto_1393735 ) ) ( not ( = ?auto_1393732 ?auto_1393736 ) ) ( not ( = ?auto_1393733 ?auto_1393734 ) ) ( not ( = ?auto_1393733 ?auto_1393735 ) ) ( not ( = ?auto_1393733 ?auto_1393736 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1393734 ?auto_1393735 ?auto_1393736 )
      ( MAKE-13CRATE-VERIFY ?auto_1393723 ?auto_1393724 ?auto_1393725 ?auto_1393727 ?auto_1393726 ?auto_1393728 ?auto_1393729 ?auto_1393730 ?auto_1393731 ?auto_1393732 ?auto_1393733 ?auto_1393734 ?auto_1393735 ?auto_1393736 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1393892 - SURFACE
      ?auto_1393893 - SURFACE
      ?auto_1393894 - SURFACE
      ?auto_1393896 - SURFACE
      ?auto_1393895 - SURFACE
      ?auto_1393897 - SURFACE
      ?auto_1393898 - SURFACE
      ?auto_1393899 - SURFACE
      ?auto_1393900 - SURFACE
      ?auto_1393901 - SURFACE
      ?auto_1393902 - SURFACE
      ?auto_1393903 - SURFACE
      ?auto_1393904 - SURFACE
      ?auto_1393905 - SURFACE
    )
    :vars
    (
      ?auto_1393909 - HOIST
      ?auto_1393908 - PLACE
      ?auto_1393910 - TRUCK
      ?auto_1393906 - PLACE
      ?auto_1393907 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1393909 ?auto_1393908 ) ( SURFACE-AT ?auto_1393904 ?auto_1393908 ) ( CLEAR ?auto_1393904 ) ( IS-CRATE ?auto_1393905 ) ( not ( = ?auto_1393904 ?auto_1393905 ) ) ( AVAILABLE ?auto_1393909 ) ( ON ?auto_1393904 ?auto_1393903 ) ( not ( = ?auto_1393903 ?auto_1393904 ) ) ( not ( = ?auto_1393903 ?auto_1393905 ) ) ( TRUCK-AT ?auto_1393910 ?auto_1393906 ) ( not ( = ?auto_1393906 ?auto_1393908 ) ) ( HOIST-AT ?auto_1393907 ?auto_1393906 ) ( LIFTING ?auto_1393907 ?auto_1393905 ) ( not ( = ?auto_1393909 ?auto_1393907 ) ) ( ON ?auto_1393893 ?auto_1393892 ) ( ON ?auto_1393894 ?auto_1393893 ) ( ON ?auto_1393896 ?auto_1393894 ) ( ON ?auto_1393895 ?auto_1393896 ) ( ON ?auto_1393897 ?auto_1393895 ) ( ON ?auto_1393898 ?auto_1393897 ) ( ON ?auto_1393899 ?auto_1393898 ) ( ON ?auto_1393900 ?auto_1393899 ) ( ON ?auto_1393901 ?auto_1393900 ) ( ON ?auto_1393902 ?auto_1393901 ) ( ON ?auto_1393903 ?auto_1393902 ) ( not ( = ?auto_1393892 ?auto_1393893 ) ) ( not ( = ?auto_1393892 ?auto_1393894 ) ) ( not ( = ?auto_1393892 ?auto_1393896 ) ) ( not ( = ?auto_1393892 ?auto_1393895 ) ) ( not ( = ?auto_1393892 ?auto_1393897 ) ) ( not ( = ?auto_1393892 ?auto_1393898 ) ) ( not ( = ?auto_1393892 ?auto_1393899 ) ) ( not ( = ?auto_1393892 ?auto_1393900 ) ) ( not ( = ?auto_1393892 ?auto_1393901 ) ) ( not ( = ?auto_1393892 ?auto_1393902 ) ) ( not ( = ?auto_1393892 ?auto_1393903 ) ) ( not ( = ?auto_1393892 ?auto_1393904 ) ) ( not ( = ?auto_1393892 ?auto_1393905 ) ) ( not ( = ?auto_1393893 ?auto_1393894 ) ) ( not ( = ?auto_1393893 ?auto_1393896 ) ) ( not ( = ?auto_1393893 ?auto_1393895 ) ) ( not ( = ?auto_1393893 ?auto_1393897 ) ) ( not ( = ?auto_1393893 ?auto_1393898 ) ) ( not ( = ?auto_1393893 ?auto_1393899 ) ) ( not ( = ?auto_1393893 ?auto_1393900 ) ) ( not ( = ?auto_1393893 ?auto_1393901 ) ) ( not ( = ?auto_1393893 ?auto_1393902 ) ) ( not ( = ?auto_1393893 ?auto_1393903 ) ) ( not ( = ?auto_1393893 ?auto_1393904 ) ) ( not ( = ?auto_1393893 ?auto_1393905 ) ) ( not ( = ?auto_1393894 ?auto_1393896 ) ) ( not ( = ?auto_1393894 ?auto_1393895 ) ) ( not ( = ?auto_1393894 ?auto_1393897 ) ) ( not ( = ?auto_1393894 ?auto_1393898 ) ) ( not ( = ?auto_1393894 ?auto_1393899 ) ) ( not ( = ?auto_1393894 ?auto_1393900 ) ) ( not ( = ?auto_1393894 ?auto_1393901 ) ) ( not ( = ?auto_1393894 ?auto_1393902 ) ) ( not ( = ?auto_1393894 ?auto_1393903 ) ) ( not ( = ?auto_1393894 ?auto_1393904 ) ) ( not ( = ?auto_1393894 ?auto_1393905 ) ) ( not ( = ?auto_1393896 ?auto_1393895 ) ) ( not ( = ?auto_1393896 ?auto_1393897 ) ) ( not ( = ?auto_1393896 ?auto_1393898 ) ) ( not ( = ?auto_1393896 ?auto_1393899 ) ) ( not ( = ?auto_1393896 ?auto_1393900 ) ) ( not ( = ?auto_1393896 ?auto_1393901 ) ) ( not ( = ?auto_1393896 ?auto_1393902 ) ) ( not ( = ?auto_1393896 ?auto_1393903 ) ) ( not ( = ?auto_1393896 ?auto_1393904 ) ) ( not ( = ?auto_1393896 ?auto_1393905 ) ) ( not ( = ?auto_1393895 ?auto_1393897 ) ) ( not ( = ?auto_1393895 ?auto_1393898 ) ) ( not ( = ?auto_1393895 ?auto_1393899 ) ) ( not ( = ?auto_1393895 ?auto_1393900 ) ) ( not ( = ?auto_1393895 ?auto_1393901 ) ) ( not ( = ?auto_1393895 ?auto_1393902 ) ) ( not ( = ?auto_1393895 ?auto_1393903 ) ) ( not ( = ?auto_1393895 ?auto_1393904 ) ) ( not ( = ?auto_1393895 ?auto_1393905 ) ) ( not ( = ?auto_1393897 ?auto_1393898 ) ) ( not ( = ?auto_1393897 ?auto_1393899 ) ) ( not ( = ?auto_1393897 ?auto_1393900 ) ) ( not ( = ?auto_1393897 ?auto_1393901 ) ) ( not ( = ?auto_1393897 ?auto_1393902 ) ) ( not ( = ?auto_1393897 ?auto_1393903 ) ) ( not ( = ?auto_1393897 ?auto_1393904 ) ) ( not ( = ?auto_1393897 ?auto_1393905 ) ) ( not ( = ?auto_1393898 ?auto_1393899 ) ) ( not ( = ?auto_1393898 ?auto_1393900 ) ) ( not ( = ?auto_1393898 ?auto_1393901 ) ) ( not ( = ?auto_1393898 ?auto_1393902 ) ) ( not ( = ?auto_1393898 ?auto_1393903 ) ) ( not ( = ?auto_1393898 ?auto_1393904 ) ) ( not ( = ?auto_1393898 ?auto_1393905 ) ) ( not ( = ?auto_1393899 ?auto_1393900 ) ) ( not ( = ?auto_1393899 ?auto_1393901 ) ) ( not ( = ?auto_1393899 ?auto_1393902 ) ) ( not ( = ?auto_1393899 ?auto_1393903 ) ) ( not ( = ?auto_1393899 ?auto_1393904 ) ) ( not ( = ?auto_1393899 ?auto_1393905 ) ) ( not ( = ?auto_1393900 ?auto_1393901 ) ) ( not ( = ?auto_1393900 ?auto_1393902 ) ) ( not ( = ?auto_1393900 ?auto_1393903 ) ) ( not ( = ?auto_1393900 ?auto_1393904 ) ) ( not ( = ?auto_1393900 ?auto_1393905 ) ) ( not ( = ?auto_1393901 ?auto_1393902 ) ) ( not ( = ?auto_1393901 ?auto_1393903 ) ) ( not ( = ?auto_1393901 ?auto_1393904 ) ) ( not ( = ?auto_1393901 ?auto_1393905 ) ) ( not ( = ?auto_1393902 ?auto_1393903 ) ) ( not ( = ?auto_1393902 ?auto_1393904 ) ) ( not ( = ?auto_1393902 ?auto_1393905 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1393903 ?auto_1393904 ?auto_1393905 )
      ( MAKE-13CRATE-VERIFY ?auto_1393892 ?auto_1393893 ?auto_1393894 ?auto_1393896 ?auto_1393895 ?auto_1393897 ?auto_1393898 ?auto_1393899 ?auto_1393900 ?auto_1393901 ?auto_1393902 ?auto_1393903 ?auto_1393904 ?auto_1393905 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1394074 - SURFACE
      ?auto_1394075 - SURFACE
      ?auto_1394076 - SURFACE
      ?auto_1394078 - SURFACE
      ?auto_1394077 - SURFACE
      ?auto_1394079 - SURFACE
      ?auto_1394080 - SURFACE
      ?auto_1394081 - SURFACE
      ?auto_1394082 - SURFACE
      ?auto_1394083 - SURFACE
      ?auto_1394084 - SURFACE
      ?auto_1394085 - SURFACE
      ?auto_1394086 - SURFACE
      ?auto_1394087 - SURFACE
    )
    :vars
    (
      ?auto_1394088 - HOIST
      ?auto_1394093 - PLACE
      ?auto_1394090 - TRUCK
      ?auto_1394091 - PLACE
      ?auto_1394092 - HOIST
      ?auto_1394089 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1394088 ?auto_1394093 ) ( SURFACE-AT ?auto_1394086 ?auto_1394093 ) ( CLEAR ?auto_1394086 ) ( IS-CRATE ?auto_1394087 ) ( not ( = ?auto_1394086 ?auto_1394087 ) ) ( AVAILABLE ?auto_1394088 ) ( ON ?auto_1394086 ?auto_1394085 ) ( not ( = ?auto_1394085 ?auto_1394086 ) ) ( not ( = ?auto_1394085 ?auto_1394087 ) ) ( TRUCK-AT ?auto_1394090 ?auto_1394091 ) ( not ( = ?auto_1394091 ?auto_1394093 ) ) ( HOIST-AT ?auto_1394092 ?auto_1394091 ) ( not ( = ?auto_1394088 ?auto_1394092 ) ) ( AVAILABLE ?auto_1394092 ) ( SURFACE-AT ?auto_1394087 ?auto_1394091 ) ( ON ?auto_1394087 ?auto_1394089 ) ( CLEAR ?auto_1394087 ) ( not ( = ?auto_1394086 ?auto_1394089 ) ) ( not ( = ?auto_1394087 ?auto_1394089 ) ) ( not ( = ?auto_1394085 ?auto_1394089 ) ) ( ON ?auto_1394075 ?auto_1394074 ) ( ON ?auto_1394076 ?auto_1394075 ) ( ON ?auto_1394078 ?auto_1394076 ) ( ON ?auto_1394077 ?auto_1394078 ) ( ON ?auto_1394079 ?auto_1394077 ) ( ON ?auto_1394080 ?auto_1394079 ) ( ON ?auto_1394081 ?auto_1394080 ) ( ON ?auto_1394082 ?auto_1394081 ) ( ON ?auto_1394083 ?auto_1394082 ) ( ON ?auto_1394084 ?auto_1394083 ) ( ON ?auto_1394085 ?auto_1394084 ) ( not ( = ?auto_1394074 ?auto_1394075 ) ) ( not ( = ?auto_1394074 ?auto_1394076 ) ) ( not ( = ?auto_1394074 ?auto_1394078 ) ) ( not ( = ?auto_1394074 ?auto_1394077 ) ) ( not ( = ?auto_1394074 ?auto_1394079 ) ) ( not ( = ?auto_1394074 ?auto_1394080 ) ) ( not ( = ?auto_1394074 ?auto_1394081 ) ) ( not ( = ?auto_1394074 ?auto_1394082 ) ) ( not ( = ?auto_1394074 ?auto_1394083 ) ) ( not ( = ?auto_1394074 ?auto_1394084 ) ) ( not ( = ?auto_1394074 ?auto_1394085 ) ) ( not ( = ?auto_1394074 ?auto_1394086 ) ) ( not ( = ?auto_1394074 ?auto_1394087 ) ) ( not ( = ?auto_1394074 ?auto_1394089 ) ) ( not ( = ?auto_1394075 ?auto_1394076 ) ) ( not ( = ?auto_1394075 ?auto_1394078 ) ) ( not ( = ?auto_1394075 ?auto_1394077 ) ) ( not ( = ?auto_1394075 ?auto_1394079 ) ) ( not ( = ?auto_1394075 ?auto_1394080 ) ) ( not ( = ?auto_1394075 ?auto_1394081 ) ) ( not ( = ?auto_1394075 ?auto_1394082 ) ) ( not ( = ?auto_1394075 ?auto_1394083 ) ) ( not ( = ?auto_1394075 ?auto_1394084 ) ) ( not ( = ?auto_1394075 ?auto_1394085 ) ) ( not ( = ?auto_1394075 ?auto_1394086 ) ) ( not ( = ?auto_1394075 ?auto_1394087 ) ) ( not ( = ?auto_1394075 ?auto_1394089 ) ) ( not ( = ?auto_1394076 ?auto_1394078 ) ) ( not ( = ?auto_1394076 ?auto_1394077 ) ) ( not ( = ?auto_1394076 ?auto_1394079 ) ) ( not ( = ?auto_1394076 ?auto_1394080 ) ) ( not ( = ?auto_1394076 ?auto_1394081 ) ) ( not ( = ?auto_1394076 ?auto_1394082 ) ) ( not ( = ?auto_1394076 ?auto_1394083 ) ) ( not ( = ?auto_1394076 ?auto_1394084 ) ) ( not ( = ?auto_1394076 ?auto_1394085 ) ) ( not ( = ?auto_1394076 ?auto_1394086 ) ) ( not ( = ?auto_1394076 ?auto_1394087 ) ) ( not ( = ?auto_1394076 ?auto_1394089 ) ) ( not ( = ?auto_1394078 ?auto_1394077 ) ) ( not ( = ?auto_1394078 ?auto_1394079 ) ) ( not ( = ?auto_1394078 ?auto_1394080 ) ) ( not ( = ?auto_1394078 ?auto_1394081 ) ) ( not ( = ?auto_1394078 ?auto_1394082 ) ) ( not ( = ?auto_1394078 ?auto_1394083 ) ) ( not ( = ?auto_1394078 ?auto_1394084 ) ) ( not ( = ?auto_1394078 ?auto_1394085 ) ) ( not ( = ?auto_1394078 ?auto_1394086 ) ) ( not ( = ?auto_1394078 ?auto_1394087 ) ) ( not ( = ?auto_1394078 ?auto_1394089 ) ) ( not ( = ?auto_1394077 ?auto_1394079 ) ) ( not ( = ?auto_1394077 ?auto_1394080 ) ) ( not ( = ?auto_1394077 ?auto_1394081 ) ) ( not ( = ?auto_1394077 ?auto_1394082 ) ) ( not ( = ?auto_1394077 ?auto_1394083 ) ) ( not ( = ?auto_1394077 ?auto_1394084 ) ) ( not ( = ?auto_1394077 ?auto_1394085 ) ) ( not ( = ?auto_1394077 ?auto_1394086 ) ) ( not ( = ?auto_1394077 ?auto_1394087 ) ) ( not ( = ?auto_1394077 ?auto_1394089 ) ) ( not ( = ?auto_1394079 ?auto_1394080 ) ) ( not ( = ?auto_1394079 ?auto_1394081 ) ) ( not ( = ?auto_1394079 ?auto_1394082 ) ) ( not ( = ?auto_1394079 ?auto_1394083 ) ) ( not ( = ?auto_1394079 ?auto_1394084 ) ) ( not ( = ?auto_1394079 ?auto_1394085 ) ) ( not ( = ?auto_1394079 ?auto_1394086 ) ) ( not ( = ?auto_1394079 ?auto_1394087 ) ) ( not ( = ?auto_1394079 ?auto_1394089 ) ) ( not ( = ?auto_1394080 ?auto_1394081 ) ) ( not ( = ?auto_1394080 ?auto_1394082 ) ) ( not ( = ?auto_1394080 ?auto_1394083 ) ) ( not ( = ?auto_1394080 ?auto_1394084 ) ) ( not ( = ?auto_1394080 ?auto_1394085 ) ) ( not ( = ?auto_1394080 ?auto_1394086 ) ) ( not ( = ?auto_1394080 ?auto_1394087 ) ) ( not ( = ?auto_1394080 ?auto_1394089 ) ) ( not ( = ?auto_1394081 ?auto_1394082 ) ) ( not ( = ?auto_1394081 ?auto_1394083 ) ) ( not ( = ?auto_1394081 ?auto_1394084 ) ) ( not ( = ?auto_1394081 ?auto_1394085 ) ) ( not ( = ?auto_1394081 ?auto_1394086 ) ) ( not ( = ?auto_1394081 ?auto_1394087 ) ) ( not ( = ?auto_1394081 ?auto_1394089 ) ) ( not ( = ?auto_1394082 ?auto_1394083 ) ) ( not ( = ?auto_1394082 ?auto_1394084 ) ) ( not ( = ?auto_1394082 ?auto_1394085 ) ) ( not ( = ?auto_1394082 ?auto_1394086 ) ) ( not ( = ?auto_1394082 ?auto_1394087 ) ) ( not ( = ?auto_1394082 ?auto_1394089 ) ) ( not ( = ?auto_1394083 ?auto_1394084 ) ) ( not ( = ?auto_1394083 ?auto_1394085 ) ) ( not ( = ?auto_1394083 ?auto_1394086 ) ) ( not ( = ?auto_1394083 ?auto_1394087 ) ) ( not ( = ?auto_1394083 ?auto_1394089 ) ) ( not ( = ?auto_1394084 ?auto_1394085 ) ) ( not ( = ?auto_1394084 ?auto_1394086 ) ) ( not ( = ?auto_1394084 ?auto_1394087 ) ) ( not ( = ?auto_1394084 ?auto_1394089 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1394085 ?auto_1394086 ?auto_1394087 )
      ( MAKE-13CRATE-VERIFY ?auto_1394074 ?auto_1394075 ?auto_1394076 ?auto_1394078 ?auto_1394077 ?auto_1394079 ?auto_1394080 ?auto_1394081 ?auto_1394082 ?auto_1394083 ?auto_1394084 ?auto_1394085 ?auto_1394086 ?auto_1394087 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1394257 - SURFACE
      ?auto_1394258 - SURFACE
      ?auto_1394259 - SURFACE
      ?auto_1394261 - SURFACE
      ?auto_1394260 - SURFACE
      ?auto_1394262 - SURFACE
      ?auto_1394263 - SURFACE
      ?auto_1394264 - SURFACE
      ?auto_1394265 - SURFACE
      ?auto_1394266 - SURFACE
      ?auto_1394267 - SURFACE
      ?auto_1394268 - SURFACE
      ?auto_1394269 - SURFACE
      ?auto_1394270 - SURFACE
    )
    :vars
    (
      ?auto_1394271 - HOIST
      ?auto_1394272 - PLACE
      ?auto_1394274 - PLACE
      ?auto_1394276 - HOIST
      ?auto_1394273 - SURFACE
      ?auto_1394275 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1394271 ?auto_1394272 ) ( SURFACE-AT ?auto_1394269 ?auto_1394272 ) ( CLEAR ?auto_1394269 ) ( IS-CRATE ?auto_1394270 ) ( not ( = ?auto_1394269 ?auto_1394270 ) ) ( AVAILABLE ?auto_1394271 ) ( ON ?auto_1394269 ?auto_1394268 ) ( not ( = ?auto_1394268 ?auto_1394269 ) ) ( not ( = ?auto_1394268 ?auto_1394270 ) ) ( not ( = ?auto_1394274 ?auto_1394272 ) ) ( HOIST-AT ?auto_1394276 ?auto_1394274 ) ( not ( = ?auto_1394271 ?auto_1394276 ) ) ( AVAILABLE ?auto_1394276 ) ( SURFACE-AT ?auto_1394270 ?auto_1394274 ) ( ON ?auto_1394270 ?auto_1394273 ) ( CLEAR ?auto_1394270 ) ( not ( = ?auto_1394269 ?auto_1394273 ) ) ( not ( = ?auto_1394270 ?auto_1394273 ) ) ( not ( = ?auto_1394268 ?auto_1394273 ) ) ( TRUCK-AT ?auto_1394275 ?auto_1394272 ) ( ON ?auto_1394258 ?auto_1394257 ) ( ON ?auto_1394259 ?auto_1394258 ) ( ON ?auto_1394261 ?auto_1394259 ) ( ON ?auto_1394260 ?auto_1394261 ) ( ON ?auto_1394262 ?auto_1394260 ) ( ON ?auto_1394263 ?auto_1394262 ) ( ON ?auto_1394264 ?auto_1394263 ) ( ON ?auto_1394265 ?auto_1394264 ) ( ON ?auto_1394266 ?auto_1394265 ) ( ON ?auto_1394267 ?auto_1394266 ) ( ON ?auto_1394268 ?auto_1394267 ) ( not ( = ?auto_1394257 ?auto_1394258 ) ) ( not ( = ?auto_1394257 ?auto_1394259 ) ) ( not ( = ?auto_1394257 ?auto_1394261 ) ) ( not ( = ?auto_1394257 ?auto_1394260 ) ) ( not ( = ?auto_1394257 ?auto_1394262 ) ) ( not ( = ?auto_1394257 ?auto_1394263 ) ) ( not ( = ?auto_1394257 ?auto_1394264 ) ) ( not ( = ?auto_1394257 ?auto_1394265 ) ) ( not ( = ?auto_1394257 ?auto_1394266 ) ) ( not ( = ?auto_1394257 ?auto_1394267 ) ) ( not ( = ?auto_1394257 ?auto_1394268 ) ) ( not ( = ?auto_1394257 ?auto_1394269 ) ) ( not ( = ?auto_1394257 ?auto_1394270 ) ) ( not ( = ?auto_1394257 ?auto_1394273 ) ) ( not ( = ?auto_1394258 ?auto_1394259 ) ) ( not ( = ?auto_1394258 ?auto_1394261 ) ) ( not ( = ?auto_1394258 ?auto_1394260 ) ) ( not ( = ?auto_1394258 ?auto_1394262 ) ) ( not ( = ?auto_1394258 ?auto_1394263 ) ) ( not ( = ?auto_1394258 ?auto_1394264 ) ) ( not ( = ?auto_1394258 ?auto_1394265 ) ) ( not ( = ?auto_1394258 ?auto_1394266 ) ) ( not ( = ?auto_1394258 ?auto_1394267 ) ) ( not ( = ?auto_1394258 ?auto_1394268 ) ) ( not ( = ?auto_1394258 ?auto_1394269 ) ) ( not ( = ?auto_1394258 ?auto_1394270 ) ) ( not ( = ?auto_1394258 ?auto_1394273 ) ) ( not ( = ?auto_1394259 ?auto_1394261 ) ) ( not ( = ?auto_1394259 ?auto_1394260 ) ) ( not ( = ?auto_1394259 ?auto_1394262 ) ) ( not ( = ?auto_1394259 ?auto_1394263 ) ) ( not ( = ?auto_1394259 ?auto_1394264 ) ) ( not ( = ?auto_1394259 ?auto_1394265 ) ) ( not ( = ?auto_1394259 ?auto_1394266 ) ) ( not ( = ?auto_1394259 ?auto_1394267 ) ) ( not ( = ?auto_1394259 ?auto_1394268 ) ) ( not ( = ?auto_1394259 ?auto_1394269 ) ) ( not ( = ?auto_1394259 ?auto_1394270 ) ) ( not ( = ?auto_1394259 ?auto_1394273 ) ) ( not ( = ?auto_1394261 ?auto_1394260 ) ) ( not ( = ?auto_1394261 ?auto_1394262 ) ) ( not ( = ?auto_1394261 ?auto_1394263 ) ) ( not ( = ?auto_1394261 ?auto_1394264 ) ) ( not ( = ?auto_1394261 ?auto_1394265 ) ) ( not ( = ?auto_1394261 ?auto_1394266 ) ) ( not ( = ?auto_1394261 ?auto_1394267 ) ) ( not ( = ?auto_1394261 ?auto_1394268 ) ) ( not ( = ?auto_1394261 ?auto_1394269 ) ) ( not ( = ?auto_1394261 ?auto_1394270 ) ) ( not ( = ?auto_1394261 ?auto_1394273 ) ) ( not ( = ?auto_1394260 ?auto_1394262 ) ) ( not ( = ?auto_1394260 ?auto_1394263 ) ) ( not ( = ?auto_1394260 ?auto_1394264 ) ) ( not ( = ?auto_1394260 ?auto_1394265 ) ) ( not ( = ?auto_1394260 ?auto_1394266 ) ) ( not ( = ?auto_1394260 ?auto_1394267 ) ) ( not ( = ?auto_1394260 ?auto_1394268 ) ) ( not ( = ?auto_1394260 ?auto_1394269 ) ) ( not ( = ?auto_1394260 ?auto_1394270 ) ) ( not ( = ?auto_1394260 ?auto_1394273 ) ) ( not ( = ?auto_1394262 ?auto_1394263 ) ) ( not ( = ?auto_1394262 ?auto_1394264 ) ) ( not ( = ?auto_1394262 ?auto_1394265 ) ) ( not ( = ?auto_1394262 ?auto_1394266 ) ) ( not ( = ?auto_1394262 ?auto_1394267 ) ) ( not ( = ?auto_1394262 ?auto_1394268 ) ) ( not ( = ?auto_1394262 ?auto_1394269 ) ) ( not ( = ?auto_1394262 ?auto_1394270 ) ) ( not ( = ?auto_1394262 ?auto_1394273 ) ) ( not ( = ?auto_1394263 ?auto_1394264 ) ) ( not ( = ?auto_1394263 ?auto_1394265 ) ) ( not ( = ?auto_1394263 ?auto_1394266 ) ) ( not ( = ?auto_1394263 ?auto_1394267 ) ) ( not ( = ?auto_1394263 ?auto_1394268 ) ) ( not ( = ?auto_1394263 ?auto_1394269 ) ) ( not ( = ?auto_1394263 ?auto_1394270 ) ) ( not ( = ?auto_1394263 ?auto_1394273 ) ) ( not ( = ?auto_1394264 ?auto_1394265 ) ) ( not ( = ?auto_1394264 ?auto_1394266 ) ) ( not ( = ?auto_1394264 ?auto_1394267 ) ) ( not ( = ?auto_1394264 ?auto_1394268 ) ) ( not ( = ?auto_1394264 ?auto_1394269 ) ) ( not ( = ?auto_1394264 ?auto_1394270 ) ) ( not ( = ?auto_1394264 ?auto_1394273 ) ) ( not ( = ?auto_1394265 ?auto_1394266 ) ) ( not ( = ?auto_1394265 ?auto_1394267 ) ) ( not ( = ?auto_1394265 ?auto_1394268 ) ) ( not ( = ?auto_1394265 ?auto_1394269 ) ) ( not ( = ?auto_1394265 ?auto_1394270 ) ) ( not ( = ?auto_1394265 ?auto_1394273 ) ) ( not ( = ?auto_1394266 ?auto_1394267 ) ) ( not ( = ?auto_1394266 ?auto_1394268 ) ) ( not ( = ?auto_1394266 ?auto_1394269 ) ) ( not ( = ?auto_1394266 ?auto_1394270 ) ) ( not ( = ?auto_1394266 ?auto_1394273 ) ) ( not ( = ?auto_1394267 ?auto_1394268 ) ) ( not ( = ?auto_1394267 ?auto_1394269 ) ) ( not ( = ?auto_1394267 ?auto_1394270 ) ) ( not ( = ?auto_1394267 ?auto_1394273 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1394268 ?auto_1394269 ?auto_1394270 )
      ( MAKE-13CRATE-VERIFY ?auto_1394257 ?auto_1394258 ?auto_1394259 ?auto_1394261 ?auto_1394260 ?auto_1394262 ?auto_1394263 ?auto_1394264 ?auto_1394265 ?auto_1394266 ?auto_1394267 ?auto_1394268 ?auto_1394269 ?auto_1394270 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1394440 - SURFACE
      ?auto_1394441 - SURFACE
      ?auto_1394442 - SURFACE
      ?auto_1394444 - SURFACE
      ?auto_1394443 - SURFACE
      ?auto_1394445 - SURFACE
      ?auto_1394446 - SURFACE
      ?auto_1394447 - SURFACE
      ?auto_1394448 - SURFACE
      ?auto_1394449 - SURFACE
      ?auto_1394450 - SURFACE
      ?auto_1394451 - SURFACE
      ?auto_1394452 - SURFACE
      ?auto_1394453 - SURFACE
    )
    :vars
    (
      ?auto_1394458 - HOIST
      ?auto_1394459 - PLACE
      ?auto_1394456 - PLACE
      ?auto_1394454 - HOIST
      ?auto_1394455 - SURFACE
      ?auto_1394457 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1394458 ?auto_1394459 ) ( IS-CRATE ?auto_1394453 ) ( not ( = ?auto_1394452 ?auto_1394453 ) ) ( not ( = ?auto_1394451 ?auto_1394452 ) ) ( not ( = ?auto_1394451 ?auto_1394453 ) ) ( not ( = ?auto_1394456 ?auto_1394459 ) ) ( HOIST-AT ?auto_1394454 ?auto_1394456 ) ( not ( = ?auto_1394458 ?auto_1394454 ) ) ( AVAILABLE ?auto_1394454 ) ( SURFACE-AT ?auto_1394453 ?auto_1394456 ) ( ON ?auto_1394453 ?auto_1394455 ) ( CLEAR ?auto_1394453 ) ( not ( = ?auto_1394452 ?auto_1394455 ) ) ( not ( = ?auto_1394453 ?auto_1394455 ) ) ( not ( = ?auto_1394451 ?auto_1394455 ) ) ( TRUCK-AT ?auto_1394457 ?auto_1394459 ) ( SURFACE-AT ?auto_1394451 ?auto_1394459 ) ( CLEAR ?auto_1394451 ) ( LIFTING ?auto_1394458 ?auto_1394452 ) ( IS-CRATE ?auto_1394452 ) ( ON ?auto_1394441 ?auto_1394440 ) ( ON ?auto_1394442 ?auto_1394441 ) ( ON ?auto_1394444 ?auto_1394442 ) ( ON ?auto_1394443 ?auto_1394444 ) ( ON ?auto_1394445 ?auto_1394443 ) ( ON ?auto_1394446 ?auto_1394445 ) ( ON ?auto_1394447 ?auto_1394446 ) ( ON ?auto_1394448 ?auto_1394447 ) ( ON ?auto_1394449 ?auto_1394448 ) ( ON ?auto_1394450 ?auto_1394449 ) ( ON ?auto_1394451 ?auto_1394450 ) ( not ( = ?auto_1394440 ?auto_1394441 ) ) ( not ( = ?auto_1394440 ?auto_1394442 ) ) ( not ( = ?auto_1394440 ?auto_1394444 ) ) ( not ( = ?auto_1394440 ?auto_1394443 ) ) ( not ( = ?auto_1394440 ?auto_1394445 ) ) ( not ( = ?auto_1394440 ?auto_1394446 ) ) ( not ( = ?auto_1394440 ?auto_1394447 ) ) ( not ( = ?auto_1394440 ?auto_1394448 ) ) ( not ( = ?auto_1394440 ?auto_1394449 ) ) ( not ( = ?auto_1394440 ?auto_1394450 ) ) ( not ( = ?auto_1394440 ?auto_1394451 ) ) ( not ( = ?auto_1394440 ?auto_1394452 ) ) ( not ( = ?auto_1394440 ?auto_1394453 ) ) ( not ( = ?auto_1394440 ?auto_1394455 ) ) ( not ( = ?auto_1394441 ?auto_1394442 ) ) ( not ( = ?auto_1394441 ?auto_1394444 ) ) ( not ( = ?auto_1394441 ?auto_1394443 ) ) ( not ( = ?auto_1394441 ?auto_1394445 ) ) ( not ( = ?auto_1394441 ?auto_1394446 ) ) ( not ( = ?auto_1394441 ?auto_1394447 ) ) ( not ( = ?auto_1394441 ?auto_1394448 ) ) ( not ( = ?auto_1394441 ?auto_1394449 ) ) ( not ( = ?auto_1394441 ?auto_1394450 ) ) ( not ( = ?auto_1394441 ?auto_1394451 ) ) ( not ( = ?auto_1394441 ?auto_1394452 ) ) ( not ( = ?auto_1394441 ?auto_1394453 ) ) ( not ( = ?auto_1394441 ?auto_1394455 ) ) ( not ( = ?auto_1394442 ?auto_1394444 ) ) ( not ( = ?auto_1394442 ?auto_1394443 ) ) ( not ( = ?auto_1394442 ?auto_1394445 ) ) ( not ( = ?auto_1394442 ?auto_1394446 ) ) ( not ( = ?auto_1394442 ?auto_1394447 ) ) ( not ( = ?auto_1394442 ?auto_1394448 ) ) ( not ( = ?auto_1394442 ?auto_1394449 ) ) ( not ( = ?auto_1394442 ?auto_1394450 ) ) ( not ( = ?auto_1394442 ?auto_1394451 ) ) ( not ( = ?auto_1394442 ?auto_1394452 ) ) ( not ( = ?auto_1394442 ?auto_1394453 ) ) ( not ( = ?auto_1394442 ?auto_1394455 ) ) ( not ( = ?auto_1394444 ?auto_1394443 ) ) ( not ( = ?auto_1394444 ?auto_1394445 ) ) ( not ( = ?auto_1394444 ?auto_1394446 ) ) ( not ( = ?auto_1394444 ?auto_1394447 ) ) ( not ( = ?auto_1394444 ?auto_1394448 ) ) ( not ( = ?auto_1394444 ?auto_1394449 ) ) ( not ( = ?auto_1394444 ?auto_1394450 ) ) ( not ( = ?auto_1394444 ?auto_1394451 ) ) ( not ( = ?auto_1394444 ?auto_1394452 ) ) ( not ( = ?auto_1394444 ?auto_1394453 ) ) ( not ( = ?auto_1394444 ?auto_1394455 ) ) ( not ( = ?auto_1394443 ?auto_1394445 ) ) ( not ( = ?auto_1394443 ?auto_1394446 ) ) ( not ( = ?auto_1394443 ?auto_1394447 ) ) ( not ( = ?auto_1394443 ?auto_1394448 ) ) ( not ( = ?auto_1394443 ?auto_1394449 ) ) ( not ( = ?auto_1394443 ?auto_1394450 ) ) ( not ( = ?auto_1394443 ?auto_1394451 ) ) ( not ( = ?auto_1394443 ?auto_1394452 ) ) ( not ( = ?auto_1394443 ?auto_1394453 ) ) ( not ( = ?auto_1394443 ?auto_1394455 ) ) ( not ( = ?auto_1394445 ?auto_1394446 ) ) ( not ( = ?auto_1394445 ?auto_1394447 ) ) ( not ( = ?auto_1394445 ?auto_1394448 ) ) ( not ( = ?auto_1394445 ?auto_1394449 ) ) ( not ( = ?auto_1394445 ?auto_1394450 ) ) ( not ( = ?auto_1394445 ?auto_1394451 ) ) ( not ( = ?auto_1394445 ?auto_1394452 ) ) ( not ( = ?auto_1394445 ?auto_1394453 ) ) ( not ( = ?auto_1394445 ?auto_1394455 ) ) ( not ( = ?auto_1394446 ?auto_1394447 ) ) ( not ( = ?auto_1394446 ?auto_1394448 ) ) ( not ( = ?auto_1394446 ?auto_1394449 ) ) ( not ( = ?auto_1394446 ?auto_1394450 ) ) ( not ( = ?auto_1394446 ?auto_1394451 ) ) ( not ( = ?auto_1394446 ?auto_1394452 ) ) ( not ( = ?auto_1394446 ?auto_1394453 ) ) ( not ( = ?auto_1394446 ?auto_1394455 ) ) ( not ( = ?auto_1394447 ?auto_1394448 ) ) ( not ( = ?auto_1394447 ?auto_1394449 ) ) ( not ( = ?auto_1394447 ?auto_1394450 ) ) ( not ( = ?auto_1394447 ?auto_1394451 ) ) ( not ( = ?auto_1394447 ?auto_1394452 ) ) ( not ( = ?auto_1394447 ?auto_1394453 ) ) ( not ( = ?auto_1394447 ?auto_1394455 ) ) ( not ( = ?auto_1394448 ?auto_1394449 ) ) ( not ( = ?auto_1394448 ?auto_1394450 ) ) ( not ( = ?auto_1394448 ?auto_1394451 ) ) ( not ( = ?auto_1394448 ?auto_1394452 ) ) ( not ( = ?auto_1394448 ?auto_1394453 ) ) ( not ( = ?auto_1394448 ?auto_1394455 ) ) ( not ( = ?auto_1394449 ?auto_1394450 ) ) ( not ( = ?auto_1394449 ?auto_1394451 ) ) ( not ( = ?auto_1394449 ?auto_1394452 ) ) ( not ( = ?auto_1394449 ?auto_1394453 ) ) ( not ( = ?auto_1394449 ?auto_1394455 ) ) ( not ( = ?auto_1394450 ?auto_1394451 ) ) ( not ( = ?auto_1394450 ?auto_1394452 ) ) ( not ( = ?auto_1394450 ?auto_1394453 ) ) ( not ( = ?auto_1394450 ?auto_1394455 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1394451 ?auto_1394452 ?auto_1394453 )
      ( MAKE-13CRATE-VERIFY ?auto_1394440 ?auto_1394441 ?auto_1394442 ?auto_1394444 ?auto_1394443 ?auto_1394445 ?auto_1394446 ?auto_1394447 ?auto_1394448 ?auto_1394449 ?auto_1394450 ?auto_1394451 ?auto_1394452 ?auto_1394453 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1394623 - SURFACE
      ?auto_1394624 - SURFACE
      ?auto_1394625 - SURFACE
      ?auto_1394627 - SURFACE
      ?auto_1394626 - SURFACE
      ?auto_1394628 - SURFACE
      ?auto_1394629 - SURFACE
      ?auto_1394630 - SURFACE
      ?auto_1394631 - SURFACE
      ?auto_1394632 - SURFACE
      ?auto_1394633 - SURFACE
      ?auto_1394634 - SURFACE
      ?auto_1394635 - SURFACE
      ?auto_1394636 - SURFACE
    )
    :vars
    (
      ?auto_1394642 - HOIST
      ?auto_1394639 - PLACE
      ?auto_1394641 - PLACE
      ?auto_1394640 - HOIST
      ?auto_1394638 - SURFACE
      ?auto_1394637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1394642 ?auto_1394639 ) ( IS-CRATE ?auto_1394636 ) ( not ( = ?auto_1394635 ?auto_1394636 ) ) ( not ( = ?auto_1394634 ?auto_1394635 ) ) ( not ( = ?auto_1394634 ?auto_1394636 ) ) ( not ( = ?auto_1394641 ?auto_1394639 ) ) ( HOIST-AT ?auto_1394640 ?auto_1394641 ) ( not ( = ?auto_1394642 ?auto_1394640 ) ) ( AVAILABLE ?auto_1394640 ) ( SURFACE-AT ?auto_1394636 ?auto_1394641 ) ( ON ?auto_1394636 ?auto_1394638 ) ( CLEAR ?auto_1394636 ) ( not ( = ?auto_1394635 ?auto_1394638 ) ) ( not ( = ?auto_1394636 ?auto_1394638 ) ) ( not ( = ?auto_1394634 ?auto_1394638 ) ) ( TRUCK-AT ?auto_1394637 ?auto_1394639 ) ( SURFACE-AT ?auto_1394634 ?auto_1394639 ) ( CLEAR ?auto_1394634 ) ( IS-CRATE ?auto_1394635 ) ( AVAILABLE ?auto_1394642 ) ( IN ?auto_1394635 ?auto_1394637 ) ( ON ?auto_1394624 ?auto_1394623 ) ( ON ?auto_1394625 ?auto_1394624 ) ( ON ?auto_1394627 ?auto_1394625 ) ( ON ?auto_1394626 ?auto_1394627 ) ( ON ?auto_1394628 ?auto_1394626 ) ( ON ?auto_1394629 ?auto_1394628 ) ( ON ?auto_1394630 ?auto_1394629 ) ( ON ?auto_1394631 ?auto_1394630 ) ( ON ?auto_1394632 ?auto_1394631 ) ( ON ?auto_1394633 ?auto_1394632 ) ( ON ?auto_1394634 ?auto_1394633 ) ( not ( = ?auto_1394623 ?auto_1394624 ) ) ( not ( = ?auto_1394623 ?auto_1394625 ) ) ( not ( = ?auto_1394623 ?auto_1394627 ) ) ( not ( = ?auto_1394623 ?auto_1394626 ) ) ( not ( = ?auto_1394623 ?auto_1394628 ) ) ( not ( = ?auto_1394623 ?auto_1394629 ) ) ( not ( = ?auto_1394623 ?auto_1394630 ) ) ( not ( = ?auto_1394623 ?auto_1394631 ) ) ( not ( = ?auto_1394623 ?auto_1394632 ) ) ( not ( = ?auto_1394623 ?auto_1394633 ) ) ( not ( = ?auto_1394623 ?auto_1394634 ) ) ( not ( = ?auto_1394623 ?auto_1394635 ) ) ( not ( = ?auto_1394623 ?auto_1394636 ) ) ( not ( = ?auto_1394623 ?auto_1394638 ) ) ( not ( = ?auto_1394624 ?auto_1394625 ) ) ( not ( = ?auto_1394624 ?auto_1394627 ) ) ( not ( = ?auto_1394624 ?auto_1394626 ) ) ( not ( = ?auto_1394624 ?auto_1394628 ) ) ( not ( = ?auto_1394624 ?auto_1394629 ) ) ( not ( = ?auto_1394624 ?auto_1394630 ) ) ( not ( = ?auto_1394624 ?auto_1394631 ) ) ( not ( = ?auto_1394624 ?auto_1394632 ) ) ( not ( = ?auto_1394624 ?auto_1394633 ) ) ( not ( = ?auto_1394624 ?auto_1394634 ) ) ( not ( = ?auto_1394624 ?auto_1394635 ) ) ( not ( = ?auto_1394624 ?auto_1394636 ) ) ( not ( = ?auto_1394624 ?auto_1394638 ) ) ( not ( = ?auto_1394625 ?auto_1394627 ) ) ( not ( = ?auto_1394625 ?auto_1394626 ) ) ( not ( = ?auto_1394625 ?auto_1394628 ) ) ( not ( = ?auto_1394625 ?auto_1394629 ) ) ( not ( = ?auto_1394625 ?auto_1394630 ) ) ( not ( = ?auto_1394625 ?auto_1394631 ) ) ( not ( = ?auto_1394625 ?auto_1394632 ) ) ( not ( = ?auto_1394625 ?auto_1394633 ) ) ( not ( = ?auto_1394625 ?auto_1394634 ) ) ( not ( = ?auto_1394625 ?auto_1394635 ) ) ( not ( = ?auto_1394625 ?auto_1394636 ) ) ( not ( = ?auto_1394625 ?auto_1394638 ) ) ( not ( = ?auto_1394627 ?auto_1394626 ) ) ( not ( = ?auto_1394627 ?auto_1394628 ) ) ( not ( = ?auto_1394627 ?auto_1394629 ) ) ( not ( = ?auto_1394627 ?auto_1394630 ) ) ( not ( = ?auto_1394627 ?auto_1394631 ) ) ( not ( = ?auto_1394627 ?auto_1394632 ) ) ( not ( = ?auto_1394627 ?auto_1394633 ) ) ( not ( = ?auto_1394627 ?auto_1394634 ) ) ( not ( = ?auto_1394627 ?auto_1394635 ) ) ( not ( = ?auto_1394627 ?auto_1394636 ) ) ( not ( = ?auto_1394627 ?auto_1394638 ) ) ( not ( = ?auto_1394626 ?auto_1394628 ) ) ( not ( = ?auto_1394626 ?auto_1394629 ) ) ( not ( = ?auto_1394626 ?auto_1394630 ) ) ( not ( = ?auto_1394626 ?auto_1394631 ) ) ( not ( = ?auto_1394626 ?auto_1394632 ) ) ( not ( = ?auto_1394626 ?auto_1394633 ) ) ( not ( = ?auto_1394626 ?auto_1394634 ) ) ( not ( = ?auto_1394626 ?auto_1394635 ) ) ( not ( = ?auto_1394626 ?auto_1394636 ) ) ( not ( = ?auto_1394626 ?auto_1394638 ) ) ( not ( = ?auto_1394628 ?auto_1394629 ) ) ( not ( = ?auto_1394628 ?auto_1394630 ) ) ( not ( = ?auto_1394628 ?auto_1394631 ) ) ( not ( = ?auto_1394628 ?auto_1394632 ) ) ( not ( = ?auto_1394628 ?auto_1394633 ) ) ( not ( = ?auto_1394628 ?auto_1394634 ) ) ( not ( = ?auto_1394628 ?auto_1394635 ) ) ( not ( = ?auto_1394628 ?auto_1394636 ) ) ( not ( = ?auto_1394628 ?auto_1394638 ) ) ( not ( = ?auto_1394629 ?auto_1394630 ) ) ( not ( = ?auto_1394629 ?auto_1394631 ) ) ( not ( = ?auto_1394629 ?auto_1394632 ) ) ( not ( = ?auto_1394629 ?auto_1394633 ) ) ( not ( = ?auto_1394629 ?auto_1394634 ) ) ( not ( = ?auto_1394629 ?auto_1394635 ) ) ( not ( = ?auto_1394629 ?auto_1394636 ) ) ( not ( = ?auto_1394629 ?auto_1394638 ) ) ( not ( = ?auto_1394630 ?auto_1394631 ) ) ( not ( = ?auto_1394630 ?auto_1394632 ) ) ( not ( = ?auto_1394630 ?auto_1394633 ) ) ( not ( = ?auto_1394630 ?auto_1394634 ) ) ( not ( = ?auto_1394630 ?auto_1394635 ) ) ( not ( = ?auto_1394630 ?auto_1394636 ) ) ( not ( = ?auto_1394630 ?auto_1394638 ) ) ( not ( = ?auto_1394631 ?auto_1394632 ) ) ( not ( = ?auto_1394631 ?auto_1394633 ) ) ( not ( = ?auto_1394631 ?auto_1394634 ) ) ( not ( = ?auto_1394631 ?auto_1394635 ) ) ( not ( = ?auto_1394631 ?auto_1394636 ) ) ( not ( = ?auto_1394631 ?auto_1394638 ) ) ( not ( = ?auto_1394632 ?auto_1394633 ) ) ( not ( = ?auto_1394632 ?auto_1394634 ) ) ( not ( = ?auto_1394632 ?auto_1394635 ) ) ( not ( = ?auto_1394632 ?auto_1394636 ) ) ( not ( = ?auto_1394632 ?auto_1394638 ) ) ( not ( = ?auto_1394633 ?auto_1394634 ) ) ( not ( = ?auto_1394633 ?auto_1394635 ) ) ( not ( = ?auto_1394633 ?auto_1394636 ) ) ( not ( = ?auto_1394633 ?auto_1394638 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1394634 ?auto_1394635 ?auto_1394636 )
      ( MAKE-13CRATE-VERIFY ?auto_1394623 ?auto_1394624 ?auto_1394625 ?auto_1394627 ?auto_1394626 ?auto_1394628 ?auto_1394629 ?auto_1394630 ?auto_1394631 ?auto_1394632 ?auto_1394633 ?auto_1394634 ?auto_1394635 ?auto_1394636 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1394736 - SURFACE
      ?auto_1394737 - SURFACE
      ?auto_1394738 - SURFACE
      ?auto_1394740 - SURFACE
      ?auto_1394739 - SURFACE
      ?auto_1394741 - SURFACE
      ?auto_1394742 - SURFACE
      ?auto_1394743 - SURFACE
      ?auto_1394744 - SURFACE
      ?auto_1394745 - SURFACE
    )
    :vars
    (
      ?auto_1394747 - HOIST
      ?auto_1394751 - PLACE
      ?auto_1394749 - PLACE
      ?auto_1394750 - HOIST
      ?auto_1394746 - SURFACE
      ?auto_1394748 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1394747 ?auto_1394751 ) ( IS-CRATE ?auto_1394745 ) ( not ( = ?auto_1394744 ?auto_1394745 ) ) ( not ( = ?auto_1394743 ?auto_1394744 ) ) ( not ( = ?auto_1394743 ?auto_1394745 ) ) ( not ( = ?auto_1394749 ?auto_1394751 ) ) ( HOIST-AT ?auto_1394750 ?auto_1394749 ) ( not ( = ?auto_1394747 ?auto_1394750 ) ) ( AVAILABLE ?auto_1394750 ) ( SURFACE-AT ?auto_1394745 ?auto_1394749 ) ( ON ?auto_1394745 ?auto_1394746 ) ( CLEAR ?auto_1394745 ) ( not ( = ?auto_1394744 ?auto_1394746 ) ) ( not ( = ?auto_1394745 ?auto_1394746 ) ) ( not ( = ?auto_1394743 ?auto_1394746 ) ) ( SURFACE-AT ?auto_1394743 ?auto_1394751 ) ( CLEAR ?auto_1394743 ) ( IS-CRATE ?auto_1394744 ) ( AVAILABLE ?auto_1394747 ) ( IN ?auto_1394744 ?auto_1394748 ) ( TRUCK-AT ?auto_1394748 ?auto_1394749 ) ( ON ?auto_1394737 ?auto_1394736 ) ( ON ?auto_1394738 ?auto_1394737 ) ( ON ?auto_1394740 ?auto_1394738 ) ( ON ?auto_1394739 ?auto_1394740 ) ( ON ?auto_1394741 ?auto_1394739 ) ( ON ?auto_1394742 ?auto_1394741 ) ( ON ?auto_1394743 ?auto_1394742 ) ( not ( = ?auto_1394736 ?auto_1394737 ) ) ( not ( = ?auto_1394736 ?auto_1394738 ) ) ( not ( = ?auto_1394736 ?auto_1394740 ) ) ( not ( = ?auto_1394736 ?auto_1394739 ) ) ( not ( = ?auto_1394736 ?auto_1394741 ) ) ( not ( = ?auto_1394736 ?auto_1394742 ) ) ( not ( = ?auto_1394736 ?auto_1394743 ) ) ( not ( = ?auto_1394736 ?auto_1394744 ) ) ( not ( = ?auto_1394736 ?auto_1394745 ) ) ( not ( = ?auto_1394736 ?auto_1394746 ) ) ( not ( = ?auto_1394737 ?auto_1394738 ) ) ( not ( = ?auto_1394737 ?auto_1394740 ) ) ( not ( = ?auto_1394737 ?auto_1394739 ) ) ( not ( = ?auto_1394737 ?auto_1394741 ) ) ( not ( = ?auto_1394737 ?auto_1394742 ) ) ( not ( = ?auto_1394737 ?auto_1394743 ) ) ( not ( = ?auto_1394737 ?auto_1394744 ) ) ( not ( = ?auto_1394737 ?auto_1394745 ) ) ( not ( = ?auto_1394737 ?auto_1394746 ) ) ( not ( = ?auto_1394738 ?auto_1394740 ) ) ( not ( = ?auto_1394738 ?auto_1394739 ) ) ( not ( = ?auto_1394738 ?auto_1394741 ) ) ( not ( = ?auto_1394738 ?auto_1394742 ) ) ( not ( = ?auto_1394738 ?auto_1394743 ) ) ( not ( = ?auto_1394738 ?auto_1394744 ) ) ( not ( = ?auto_1394738 ?auto_1394745 ) ) ( not ( = ?auto_1394738 ?auto_1394746 ) ) ( not ( = ?auto_1394740 ?auto_1394739 ) ) ( not ( = ?auto_1394740 ?auto_1394741 ) ) ( not ( = ?auto_1394740 ?auto_1394742 ) ) ( not ( = ?auto_1394740 ?auto_1394743 ) ) ( not ( = ?auto_1394740 ?auto_1394744 ) ) ( not ( = ?auto_1394740 ?auto_1394745 ) ) ( not ( = ?auto_1394740 ?auto_1394746 ) ) ( not ( = ?auto_1394739 ?auto_1394741 ) ) ( not ( = ?auto_1394739 ?auto_1394742 ) ) ( not ( = ?auto_1394739 ?auto_1394743 ) ) ( not ( = ?auto_1394739 ?auto_1394744 ) ) ( not ( = ?auto_1394739 ?auto_1394745 ) ) ( not ( = ?auto_1394739 ?auto_1394746 ) ) ( not ( = ?auto_1394741 ?auto_1394742 ) ) ( not ( = ?auto_1394741 ?auto_1394743 ) ) ( not ( = ?auto_1394741 ?auto_1394744 ) ) ( not ( = ?auto_1394741 ?auto_1394745 ) ) ( not ( = ?auto_1394741 ?auto_1394746 ) ) ( not ( = ?auto_1394742 ?auto_1394743 ) ) ( not ( = ?auto_1394742 ?auto_1394744 ) ) ( not ( = ?auto_1394742 ?auto_1394745 ) ) ( not ( = ?auto_1394742 ?auto_1394746 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1394743 ?auto_1394744 ?auto_1394745 )
      ( MAKE-9CRATE-VERIFY ?auto_1394736 ?auto_1394737 ?auto_1394738 ?auto_1394740 ?auto_1394739 ?auto_1394741 ?auto_1394742 ?auto_1394743 ?auto_1394744 ?auto_1394745 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1394752 - SURFACE
      ?auto_1394753 - SURFACE
      ?auto_1394754 - SURFACE
      ?auto_1394756 - SURFACE
      ?auto_1394755 - SURFACE
      ?auto_1394757 - SURFACE
      ?auto_1394758 - SURFACE
      ?auto_1394759 - SURFACE
      ?auto_1394760 - SURFACE
      ?auto_1394761 - SURFACE
      ?auto_1394762 - SURFACE
    )
    :vars
    (
      ?auto_1394764 - HOIST
      ?auto_1394768 - PLACE
      ?auto_1394766 - PLACE
      ?auto_1394767 - HOIST
      ?auto_1394763 - SURFACE
      ?auto_1394765 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1394764 ?auto_1394768 ) ( IS-CRATE ?auto_1394762 ) ( not ( = ?auto_1394761 ?auto_1394762 ) ) ( not ( = ?auto_1394760 ?auto_1394761 ) ) ( not ( = ?auto_1394760 ?auto_1394762 ) ) ( not ( = ?auto_1394766 ?auto_1394768 ) ) ( HOIST-AT ?auto_1394767 ?auto_1394766 ) ( not ( = ?auto_1394764 ?auto_1394767 ) ) ( AVAILABLE ?auto_1394767 ) ( SURFACE-AT ?auto_1394762 ?auto_1394766 ) ( ON ?auto_1394762 ?auto_1394763 ) ( CLEAR ?auto_1394762 ) ( not ( = ?auto_1394761 ?auto_1394763 ) ) ( not ( = ?auto_1394762 ?auto_1394763 ) ) ( not ( = ?auto_1394760 ?auto_1394763 ) ) ( SURFACE-AT ?auto_1394760 ?auto_1394768 ) ( CLEAR ?auto_1394760 ) ( IS-CRATE ?auto_1394761 ) ( AVAILABLE ?auto_1394764 ) ( IN ?auto_1394761 ?auto_1394765 ) ( TRUCK-AT ?auto_1394765 ?auto_1394766 ) ( ON ?auto_1394753 ?auto_1394752 ) ( ON ?auto_1394754 ?auto_1394753 ) ( ON ?auto_1394756 ?auto_1394754 ) ( ON ?auto_1394755 ?auto_1394756 ) ( ON ?auto_1394757 ?auto_1394755 ) ( ON ?auto_1394758 ?auto_1394757 ) ( ON ?auto_1394759 ?auto_1394758 ) ( ON ?auto_1394760 ?auto_1394759 ) ( not ( = ?auto_1394752 ?auto_1394753 ) ) ( not ( = ?auto_1394752 ?auto_1394754 ) ) ( not ( = ?auto_1394752 ?auto_1394756 ) ) ( not ( = ?auto_1394752 ?auto_1394755 ) ) ( not ( = ?auto_1394752 ?auto_1394757 ) ) ( not ( = ?auto_1394752 ?auto_1394758 ) ) ( not ( = ?auto_1394752 ?auto_1394759 ) ) ( not ( = ?auto_1394752 ?auto_1394760 ) ) ( not ( = ?auto_1394752 ?auto_1394761 ) ) ( not ( = ?auto_1394752 ?auto_1394762 ) ) ( not ( = ?auto_1394752 ?auto_1394763 ) ) ( not ( = ?auto_1394753 ?auto_1394754 ) ) ( not ( = ?auto_1394753 ?auto_1394756 ) ) ( not ( = ?auto_1394753 ?auto_1394755 ) ) ( not ( = ?auto_1394753 ?auto_1394757 ) ) ( not ( = ?auto_1394753 ?auto_1394758 ) ) ( not ( = ?auto_1394753 ?auto_1394759 ) ) ( not ( = ?auto_1394753 ?auto_1394760 ) ) ( not ( = ?auto_1394753 ?auto_1394761 ) ) ( not ( = ?auto_1394753 ?auto_1394762 ) ) ( not ( = ?auto_1394753 ?auto_1394763 ) ) ( not ( = ?auto_1394754 ?auto_1394756 ) ) ( not ( = ?auto_1394754 ?auto_1394755 ) ) ( not ( = ?auto_1394754 ?auto_1394757 ) ) ( not ( = ?auto_1394754 ?auto_1394758 ) ) ( not ( = ?auto_1394754 ?auto_1394759 ) ) ( not ( = ?auto_1394754 ?auto_1394760 ) ) ( not ( = ?auto_1394754 ?auto_1394761 ) ) ( not ( = ?auto_1394754 ?auto_1394762 ) ) ( not ( = ?auto_1394754 ?auto_1394763 ) ) ( not ( = ?auto_1394756 ?auto_1394755 ) ) ( not ( = ?auto_1394756 ?auto_1394757 ) ) ( not ( = ?auto_1394756 ?auto_1394758 ) ) ( not ( = ?auto_1394756 ?auto_1394759 ) ) ( not ( = ?auto_1394756 ?auto_1394760 ) ) ( not ( = ?auto_1394756 ?auto_1394761 ) ) ( not ( = ?auto_1394756 ?auto_1394762 ) ) ( not ( = ?auto_1394756 ?auto_1394763 ) ) ( not ( = ?auto_1394755 ?auto_1394757 ) ) ( not ( = ?auto_1394755 ?auto_1394758 ) ) ( not ( = ?auto_1394755 ?auto_1394759 ) ) ( not ( = ?auto_1394755 ?auto_1394760 ) ) ( not ( = ?auto_1394755 ?auto_1394761 ) ) ( not ( = ?auto_1394755 ?auto_1394762 ) ) ( not ( = ?auto_1394755 ?auto_1394763 ) ) ( not ( = ?auto_1394757 ?auto_1394758 ) ) ( not ( = ?auto_1394757 ?auto_1394759 ) ) ( not ( = ?auto_1394757 ?auto_1394760 ) ) ( not ( = ?auto_1394757 ?auto_1394761 ) ) ( not ( = ?auto_1394757 ?auto_1394762 ) ) ( not ( = ?auto_1394757 ?auto_1394763 ) ) ( not ( = ?auto_1394758 ?auto_1394759 ) ) ( not ( = ?auto_1394758 ?auto_1394760 ) ) ( not ( = ?auto_1394758 ?auto_1394761 ) ) ( not ( = ?auto_1394758 ?auto_1394762 ) ) ( not ( = ?auto_1394758 ?auto_1394763 ) ) ( not ( = ?auto_1394759 ?auto_1394760 ) ) ( not ( = ?auto_1394759 ?auto_1394761 ) ) ( not ( = ?auto_1394759 ?auto_1394762 ) ) ( not ( = ?auto_1394759 ?auto_1394763 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1394760 ?auto_1394761 ?auto_1394762 )
      ( MAKE-10CRATE-VERIFY ?auto_1394752 ?auto_1394753 ?auto_1394754 ?auto_1394756 ?auto_1394755 ?auto_1394757 ?auto_1394758 ?auto_1394759 ?auto_1394760 ?auto_1394761 ?auto_1394762 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1394769 - SURFACE
      ?auto_1394770 - SURFACE
      ?auto_1394771 - SURFACE
      ?auto_1394773 - SURFACE
      ?auto_1394772 - SURFACE
      ?auto_1394774 - SURFACE
      ?auto_1394775 - SURFACE
      ?auto_1394776 - SURFACE
      ?auto_1394777 - SURFACE
      ?auto_1394778 - SURFACE
      ?auto_1394779 - SURFACE
      ?auto_1394780 - SURFACE
    )
    :vars
    (
      ?auto_1394782 - HOIST
      ?auto_1394786 - PLACE
      ?auto_1394784 - PLACE
      ?auto_1394785 - HOIST
      ?auto_1394781 - SURFACE
      ?auto_1394783 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1394782 ?auto_1394786 ) ( IS-CRATE ?auto_1394780 ) ( not ( = ?auto_1394779 ?auto_1394780 ) ) ( not ( = ?auto_1394778 ?auto_1394779 ) ) ( not ( = ?auto_1394778 ?auto_1394780 ) ) ( not ( = ?auto_1394784 ?auto_1394786 ) ) ( HOIST-AT ?auto_1394785 ?auto_1394784 ) ( not ( = ?auto_1394782 ?auto_1394785 ) ) ( AVAILABLE ?auto_1394785 ) ( SURFACE-AT ?auto_1394780 ?auto_1394784 ) ( ON ?auto_1394780 ?auto_1394781 ) ( CLEAR ?auto_1394780 ) ( not ( = ?auto_1394779 ?auto_1394781 ) ) ( not ( = ?auto_1394780 ?auto_1394781 ) ) ( not ( = ?auto_1394778 ?auto_1394781 ) ) ( SURFACE-AT ?auto_1394778 ?auto_1394786 ) ( CLEAR ?auto_1394778 ) ( IS-CRATE ?auto_1394779 ) ( AVAILABLE ?auto_1394782 ) ( IN ?auto_1394779 ?auto_1394783 ) ( TRUCK-AT ?auto_1394783 ?auto_1394784 ) ( ON ?auto_1394770 ?auto_1394769 ) ( ON ?auto_1394771 ?auto_1394770 ) ( ON ?auto_1394773 ?auto_1394771 ) ( ON ?auto_1394772 ?auto_1394773 ) ( ON ?auto_1394774 ?auto_1394772 ) ( ON ?auto_1394775 ?auto_1394774 ) ( ON ?auto_1394776 ?auto_1394775 ) ( ON ?auto_1394777 ?auto_1394776 ) ( ON ?auto_1394778 ?auto_1394777 ) ( not ( = ?auto_1394769 ?auto_1394770 ) ) ( not ( = ?auto_1394769 ?auto_1394771 ) ) ( not ( = ?auto_1394769 ?auto_1394773 ) ) ( not ( = ?auto_1394769 ?auto_1394772 ) ) ( not ( = ?auto_1394769 ?auto_1394774 ) ) ( not ( = ?auto_1394769 ?auto_1394775 ) ) ( not ( = ?auto_1394769 ?auto_1394776 ) ) ( not ( = ?auto_1394769 ?auto_1394777 ) ) ( not ( = ?auto_1394769 ?auto_1394778 ) ) ( not ( = ?auto_1394769 ?auto_1394779 ) ) ( not ( = ?auto_1394769 ?auto_1394780 ) ) ( not ( = ?auto_1394769 ?auto_1394781 ) ) ( not ( = ?auto_1394770 ?auto_1394771 ) ) ( not ( = ?auto_1394770 ?auto_1394773 ) ) ( not ( = ?auto_1394770 ?auto_1394772 ) ) ( not ( = ?auto_1394770 ?auto_1394774 ) ) ( not ( = ?auto_1394770 ?auto_1394775 ) ) ( not ( = ?auto_1394770 ?auto_1394776 ) ) ( not ( = ?auto_1394770 ?auto_1394777 ) ) ( not ( = ?auto_1394770 ?auto_1394778 ) ) ( not ( = ?auto_1394770 ?auto_1394779 ) ) ( not ( = ?auto_1394770 ?auto_1394780 ) ) ( not ( = ?auto_1394770 ?auto_1394781 ) ) ( not ( = ?auto_1394771 ?auto_1394773 ) ) ( not ( = ?auto_1394771 ?auto_1394772 ) ) ( not ( = ?auto_1394771 ?auto_1394774 ) ) ( not ( = ?auto_1394771 ?auto_1394775 ) ) ( not ( = ?auto_1394771 ?auto_1394776 ) ) ( not ( = ?auto_1394771 ?auto_1394777 ) ) ( not ( = ?auto_1394771 ?auto_1394778 ) ) ( not ( = ?auto_1394771 ?auto_1394779 ) ) ( not ( = ?auto_1394771 ?auto_1394780 ) ) ( not ( = ?auto_1394771 ?auto_1394781 ) ) ( not ( = ?auto_1394773 ?auto_1394772 ) ) ( not ( = ?auto_1394773 ?auto_1394774 ) ) ( not ( = ?auto_1394773 ?auto_1394775 ) ) ( not ( = ?auto_1394773 ?auto_1394776 ) ) ( not ( = ?auto_1394773 ?auto_1394777 ) ) ( not ( = ?auto_1394773 ?auto_1394778 ) ) ( not ( = ?auto_1394773 ?auto_1394779 ) ) ( not ( = ?auto_1394773 ?auto_1394780 ) ) ( not ( = ?auto_1394773 ?auto_1394781 ) ) ( not ( = ?auto_1394772 ?auto_1394774 ) ) ( not ( = ?auto_1394772 ?auto_1394775 ) ) ( not ( = ?auto_1394772 ?auto_1394776 ) ) ( not ( = ?auto_1394772 ?auto_1394777 ) ) ( not ( = ?auto_1394772 ?auto_1394778 ) ) ( not ( = ?auto_1394772 ?auto_1394779 ) ) ( not ( = ?auto_1394772 ?auto_1394780 ) ) ( not ( = ?auto_1394772 ?auto_1394781 ) ) ( not ( = ?auto_1394774 ?auto_1394775 ) ) ( not ( = ?auto_1394774 ?auto_1394776 ) ) ( not ( = ?auto_1394774 ?auto_1394777 ) ) ( not ( = ?auto_1394774 ?auto_1394778 ) ) ( not ( = ?auto_1394774 ?auto_1394779 ) ) ( not ( = ?auto_1394774 ?auto_1394780 ) ) ( not ( = ?auto_1394774 ?auto_1394781 ) ) ( not ( = ?auto_1394775 ?auto_1394776 ) ) ( not ( = ?auto_1394775 ?auto_1394777 ) ) ( not ( = ?auto_1394775 ?auto_1394778 ) ) ( not ( = ?auto_1394775 ?auto_1394779 ) ) ( not ( = ?auto_1394775 ?auto_1394780 ) ) ( not ( = ?auto_1394775 ?auto_1394781 ) ) ( not ( = ?auto_1394776 ?auto_1394777 ) ) ( not ( = ?auto_1394776 ?auto_1394778 ) ) ( not ( = ?auto_1394776 ?auto_1394779 ) ) ( not ( = ?auto_1394776 ?auto_1394780 ) ) ( not ( = ?auto_1394776 ?auto_1394781 ) ) ( not ( = ?auto_1394777 ?auto_1394778 ) ) ( not ( = ?auto_1394777 ?auto_1394779 ) ) ( not ( = ?auto_1394777 ?auto_1394780 ) ) ( not ( = ?auto_1394777 ?auto_1394781 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1394778 ?auto_1394779 ?auto_1394780 )
      ( MAKE-11CRATE-VERIFY ?auto_1394769 ?auto_1394770 ?auto_1394771 ?auto_1394773 ?auto_1394772 ?auto_1394774 ?auto_1394775 ?auto_1394776 ?auto_1394777 ?auto_1394778 ?auto_1394779 ?auto_1394780 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1394787 - SURFACE
      ?auto_1394788 - SURFACE
      ?auto_1394789 - SURFACE
      ?auto_1394791 - SURFACE
      ?auto_1394790 - SURFACE
      ?auto_1394792 - SURFACE
      ?auto_1394793 - SURFACE
      ?auto_1394794 - SURFACE
      ?auto_1394795 - SURFACE
      ?auto_1394796 - SURFACE
      ?auto_1394797 - SURFACE
      ?auto_1394798 - SURFACE
      ?auto_1394799 - SURFACE
    )
    :vars
    (
      ?auto_1394801 - HOIST
      ?auto_1394805 - PLACE
      ?auto_1394803 - PLACE
      ?auto_1394804 - HOIST
      ?auto_1394800 - SURFACE
      ?auto_1394802 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1394801 ?auto_1394805 ) ( IS-CRATE ?auto_1394799 ) ( not ( = ?auto_1394798 ?auto_1394799 ) ) ( not ( = ?auto_1394797 ?auto_1394798 ) ) ( not ( = ?auto_1394797 ?auto_1394799 ) ) ( not ( = ?auto_1394803 ?auto_1394805 ) ) ( HOIST-AT ?auto_1394804 ?auto_1394803 ) ( not ( = ?auto_1394801 ?auto_1394804 ) ) ( AVAILABLE ?auto_1394804 ) ( SURFACE-AT ?auto_1394799 ?auto_1394803 ) ( ON ?auto_1394799 ?auto_1394800 ) ( CLEAR ?auto_1394799 ) ( not ( = ?auto_1394798 ?auto_1394800 ) ) ( not ( = ?auto_1394799 ?auto_1394800 ) ) ( not ( = ?auto_1394797 ?auto_1394800 ) ) ( SURFACE-AT ?auto_1394797 ?auto_1394805 ) ( CLEAR ?auto_1394797 ) ( IS-CRATE ?auto_1394798 ) ( AVAILABLE ?auto_1394801 ) ( IN ?auto_1394798 ?auto_1394802 ) ( TRUCK-AT ?auto_1394802 ?auto_1394803 ) ( ON ?auto_1394788 ?auto_1394787 ) ( ON ?auto_1394789 ?auto_1394788 ) ( ON ?auto_1394791 ?auto_1394789 ) ( ON ?auto_1394790 ?auto_1394791 ) ( ON ?auto_1394792 ?auto_1394790 ) ( ON ?auto_1394793 ?auto_1394792 ) ( ON ?auto_1394794 ?auto_1394793 ) ( ON ?auto_1394795 ?auto_1394794 ) ( ON ?auto_1394796 ?auto_1394795 ) ( ON ?auto_1394797 ?auto_1394796 ) ( not ( = ?auto_1394787 ?auto_1394788 ) ) ( not ( = ?auto_1394787 ?auto_1394789 ) ) ( not ( = ?auto_1394787 ?auto_1394791 ) ) ( not ( = ?auto_1394787 ?auto_1394790 ) ) ( not ( = ?auto_1394787 ?auto_1394792 ) ) ( not ( = ?auto_1394787 ?auto_1394793 ) ) ( not ( = ?auto_1394787 ?auto_1394794 ) ) ( not ( = ?auto_1394787 ?auto_1394795 ) ) ( not ( = ?auto_1394787 ?auto_1394796 ) ) ( not ( = ?auto_1394787 ?auto_1394797 ) ) ( not ( = ?auto_1394787 ?auto_1394798 ) ) ( not ( = ?auto_1394787 ?auto_1394799 ) ) ( not ( = ?auto_1394787 ?auto_1394800 ) ) ( not ( = ?auto_1394788 ?auto_1394789 ) ) ( not ( = ?auto_1394788 ?auto_1394791 ) ) ( not ( = ?auto_1394788 ?auto_1394790 ) ) ( not ( = ?auto_1394788 ?auto_1394792 ) ) ( not ( = ?auto_1394788 ?auto_1394793 ) ) ( not ( = ?auto_1394788 ?auto_1394794 ) ) ( not ( = ?auto_1394788 ?auto_1394795 ) ) ( not ( = ?auto_1394788 ?auto_1394796 ) ) ( not ( = ?auto_1394788 ?auto_1394797 ) ) ( not ( = ?auto_1394788 ?auto_1394798 ) ) ( not ( = ?auto_1394788 ?auto_1394799 ) ) ( not ( = ?auto_1394788 ?auto_1394800 ) ) ( not ( = ?auto_1394789 ?auto_1394791 ) ) ( not ( = ?auto_1394789 ?auto_1394790 ) ) ( not ( = ?auto_1394789 ?auto_1394792 ) ) ( not ( = ?auto_1394789 ?auto_1394793 ) ) ( not ( = ?auto_1394789 ?auto_1394794 ) ) ( not ( = ?auto_1394789 ?auto_1394795 ) ) ( not ( = ?auto_1394789 ?auto_1394796 ) ) ( not ( = ?auto_1394789 ?auto_1394797 ) ) ( not ( = ?auto_1394789 ?auto_1394798 ) ) ( not ( = ?auto_1394789 ?auto_1394799 ) ) ( not ( = ?auto_1394789 ?auto_1394800 ) ) ( not ( = ?auto_1394791 ?auto_1394790 ) ) ( not ( = ?auto_1394791 ?auto_1394792 ) ) ( not ( = ?auto_1394791 ?auto_1394793 ) ) ( not ( = ?auto_1394791 ?auto_1394794 ) ) ( not ( = ?auto_1394791 ?auto_1394795 ) ) ( not ( = ?auto_1394791 ?auto_1394796 ) ) ( not ( = ?auto_1394791 ?auto_1394797 ) ) ( not ( = ?auto_1394791 ?auto_1394798 ) ) ( not ( = ?auto_1394791 ?auto_1394799 ) ) ( not ( = ?auto_1394791 ?auto_1394800 ) ) ( not ( = ?auto_1394790 ?auto_1394792 ) ) ( not ( = ?auto_1394790 ?auto_1394793 ) ) ( not ( = ?auto_1394790 ?auto_1394794 ) ) ( not ( = ?auto_1394790 ?auto_1394795 ) ) ( not ( = ?auto_1394790 ?auto_1394796 ) ) ( not ( = ?auto_1394790 ?auto_1394797 ) ) ( not ( = ?auto_1394790 ?auto_1394798 ) ) ( not ( = ?auto_1394790 ?auto_1394799 ) ) ( not ( = ?auto_1394790 ?auto_1394800 ) ) ( not ( = ?auto_1394792 ?auto_1394793 ) ) ( not ( = ?auto_1394792 ?auto_1394794 ) ) ( not ( = ?auto_1394792 ?auto_1394795 ) ) ( not ( = ?auto_1394792 ?auto_1394796 ) ) ( not ( = ?auto_1394792 ?auto_1394797 ) ) ( not ( = ?auto_1394792 ?auto_1394798 ) ) ( not ( = ?auto_1394792 ?auto_1394799 ) ) ( not ( = ?auto_1394792 ?auto_1394800 ) ) ( not ( = ?auto_1394793 ?auto_1394794 ) ) ( not ( = ?auto_1394793 ?auto_1394795 ) ) ( not ( = ?auto_1394793 ?auto_1394796 ) ) ( not ( = ?auto_1394793 ?auto_1394797 ) ) ( not ( = ?auto_1394793 ?auto_1394798 ) ) ( not ( = ?auto_1394793 ?auto_1394799 ) ) ( not ( = ?auto_1394793 ?auto_1394800 ) ) ( not ( = ?auto_1394794 ?auto_1394795 ) ) ( not ( = ?auto_1394794 ?auto_1394796 ) ) ( not ( = ?auto_1394794 ?auto_1394797 ) ) ( not ( = ?auto_1394794 ?auto_1394798 ) ) ( not ( = ?auto_1394794 ?auto_1394799 ) ) ( not ( = ?auto_1394794 ?auto_1394800 ) ) ( not ( = ?auto_1394795 ?auto_1394796 ) ) ( not ( = ?auto_1394795 ?auto_1394797 ) ) ( not ( = ?auto_1394795 ?auto_1394798 ) ) ( not ( = ?auto_1394795 ?auto_1394799 ) ) ( not ( = ?auto_1394795 ?auto_1394800 ) ) ( not ( = ?auto_1394796 ?auto_1394797 ) ) ( not ( = ?auto_1394796 ?auto_1394798 ) ) ( not ( = ?auto_1394796 ?auto_1394799 ) ) ( not ( = ?auto_1394796 ?auto_1394800 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1394797 ?auto_1394798 ?auto_1394799 )
      ( MAKE-12CRATE-VERIFY ?auto_1394787 ?auto_1394788 ?auto_1394789 ?auto_1394791 ?auto_1394790 ?auto_1394792 ?auto_1394793 ?auto_1394794 ?auto_1394795 ?auto_1394796 ?auto_1394797 ?auto_1394798 ?auto_1394799 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1394806 - SURFACE
      ?auto_1394807 - SURFACE
      ?auto_1394808 - SURFACE
      ?auto_1394810 - SURFACE
      ?auto_1394809 - SURFACE
      ?auto_1394811 - SURFACE
      ?auto_1394812 - SURFACE
      ?auto_1394813 - SURFACE
      ?auto_1394814 - SURFACE
      ?auto_1394815 - SURFACE
      ?auto_1394816 - SURFACE
      ?auto_1394817 - SURFACE
      ?auto_1394818 - SURFACE
      ?auto_1394819 - SURFACE
    )
    :vars
    (
      ?auto_1394821 - HOIST
      ?auto_1394825 - PLACE
      ?auto_1394823 - PLACE
      ?auto_1394824 - HOIST
      ?auto_1394820 - SURFACE
      ?auto_1394822 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1394821 ?auto_1394825 ) ( IS-CRATE ?auto_1394819 ) ( not ( = ?auto_1394818 ?auto_1394819 ) ) ( not ( = ?auto_1394817 ?auto_1394818 ) ) ( not ( = ?auto_1394817 ?auto_1394819 ) ) ( not ( = ?auto_1394823 ?auto_1394825 ) ) ( HOIST-AT ?auto_1394824 ?auto_1394823 ) ( not ( = ?auto_1394821 ?auto_1394824 ) ) ( AVAILABLE ?auto_1394824 ) ( SURFACE-AT ?auto_1394819 ?auto_1394823 ) ( ON ?auto_1394819 ?auto_1394820 ) ( CLEAR ?auto_1394819 ) ( not ( = ?auto_1394818 ?auto_1394820 ) ) ( not ( = ?auto_1394819 ?auto_1394820 ) ) ( not ( = ?auto_1394817 ?auto_1394820 ) ) ( SURFACE-AT ?auto_1394817 ?auto_1394825 ) ( CLEAR ?auto_1394817 ) ( IS-CRATE ?auto_1394818 ) ( AVAILABLE ?auto_1394821 ) ( IN ?auto_1394818 ?auto_1394822 ) ( TRUCK-AT ?auto_1394822 ?auto_1394823 ) ( ON ?auto_1394807 ?auto_1394806 ) ( ON ?auto_1394808 ?auto_1394807 ) ( ON ?auto_1394810 ?auto_1394808 ) ( ON ?auto_1394809 ?auto_1394810 ) ( ON ?auto_1394811 ?auto_1394809 ) ( ON ?auto_1394812 ?auto_1394811 ) ( ON ?auto_1394813 ?auto_1394812 ) ( ON ?auto_1394814 ?auto_1394813 ) ( ON ?auto_1394815 ?auto_1394814 ) ( ON ?auto_1394816 ?auto_1394815 ) ( ON ?auto_1394817 ?auto_1394816 ) ( not ( = ?auto_1394806 ?auto_1394807 ) ) ( not ( = ?auto_1394806 ?auto_1394808 ) ) ( not ( = ?auto_1394806 ?auto_1394810 ) ) ( not ( = ?auto_1394806 ?auto_1394809 ) ) ( not ( = ?auto_1394806 ?auto_1394811 ) ) ( not ( = ?auto_1394806 ?auto_1394812 ) ) ( not ( = ?auto_1394806 ?auto_1394813 ) ) ( not ( = ?auto_1394806 ?auto_1394814 ) ) ( not ( = ?auto_1394806 ?auto_1394815 ) ) ( not ( = ?auto_1394806 ?auto_1394816 ) ) ( not ( = ?auto_1394806 ?auto_1394817 ) ) ( not ( = ?auto_1394806 ?auto_1394818 ) ) ( not ( = ?auto_1394806 ?auto_1394819 ) ) ( not ( = ?auto_1394806 ?auto_1394820 ) ) ( not ( = ?auto_1394807 ?auto_1394808 ) ) ( not ( = ?auto_1394807 ?auto_1394810 ) ) ( not ( = ?auto_1394807 ?auto_1394809 ) ) ( not ( = ?auto_1394807 ?auto_1394811 ) ) ( not ( = ?auto_1394807 ?auto_1394812 ) ) ( not ( = ?auto_1394807 ?auto_1394813 ) ) ( not ( = ?auto_1394807 ?auto_1394814 ) ) ( not ( = ?auto_1394807 ?auto_1394815 ) ) ( not ( = ?auto_1394807 ?auto_1394816 ) ) ( not ( = ?auto_1394807 ?auto_1394817 ) ) ( not ( = ?auto_1394807 ?auto_1394818 ) ) ( not ( = ?auto_1394807 ?auto_1394819 ) ) ( not ( = ?auto_1394807 ?auto_1394820 ) ) ( not ( = ?auto_1394808 ?auto_1394810 ) ) ( not ( = ?auto_1394808 ?auto_1394809 ) ) ( not ( = ?auto_1394808 ?auto_1394811 ) ) ( not ( = ?auto_1394808 ?auto_1394812 ) ) ( not ( = ?auto_1394808 ?auto_1394813 ) ) ( not ( = ?auto_1394808 ?auto_1394814 ) ) ( not ( = ?auto_1394808 ?auto_1394815 ) ) ( not ( = ?auto_1394808 ?auto_1394816 ) ) ( not ( = ?auto_1394808 ?auto_1394817 ) ) ( not ( = ?auto_1394808 ?auto_1394818 ) ) ( not ( = ?auto_1394808 ?auto_1394819 ) ) ( not ( = ?auto_1394808 ?auto_1394820 ) ) ( not ( = ?auto_1394810 ?auto_1394809 ) ) ( not ( = ?auto_1394810 ?auto_1394811 ) ) ( not ( = ?auto_1394810 ?auto_1394812 ) ) ( not ( = ?auto_1394810 ?auto_1394813 ) ) ( not ( = ?auto_1394810 ?auto_1394814 ) ) ( not ( = ?auto_1394810 ?auto_1394815 ) ) ( not ( = ?auto_1394810 ?auto_1394816 ) ) ( not ( = ?auto_1394810 ?auto_1394817 ) ) ( not ( = ?auto_1394810 ?auto_1394818 ) ) ( not ( = ?auto_1394810 ?auto_1394819 ) ) ( not ( = ?auto_1394810 ?auto_1394820 ) ) ( not ( = ?auto_1394809 ?auto_1394811 ) ) ( not ( = ?auto_1394809 ?auto_1394812 ) ) ( not ( = ?auto_1394809 ?auto_1394813 ) ) ( not ( = ?auto_1394809 ?auto_1394814 ) ) ( not ( = ?auto_1394809 ?auto_1394815 ) ) ( not ( = ?auto_1394809 ?auto_1394816 ) ) ( not ( = ?auto_1394809 ?auto_1394817 ) ) ( not ( = ?auto_1394809 ?auto_1394818 ) ) ( not ( = ?auto_1394809 ?auto_1394819 ) ) ( not ( = ?auto_1394809 ?auto_1394820 ) ) ( not ( = ?auto_1394811 ?auto_1394812 ) ) ( not ( = ?auto_1394811 ?auto_1394813 ) ) ( not ( = ?auto_1394811 ?auto_1394814 ) ) ( not ( = ?auto_1394811 ?auto_1394815 ) ) ( not ( = ?auto_1394811 ?auto_1394816 ) ) ( not ( = ?auto_1394811 ?auto_1394817 ) ) ( not ( = ?auto_1394811 ?auto_1394818 ) ) ( not ( = ?auto_1394811 ?auto_1394819 ) ) ( not ( = ?auto_1394811 ?auto_1394820 ) ) ( not ( = ?auto_1394812 ?auto_1394813 ) ) ( not ( = ?auto_1394812 ?auto_1394814 ) ) ( not ( = ?auto_1394812 ?auto_1394815 ) ) ( not ( = ?auto_1394812 ?auto_1394816 ) ) ( not ( = ?auto_1394812 ?auto_1394817 ) ) ( not ( = ?auto_1394812 ?auto_1394818 ) ) ( not ( = ?auto_1394812 ?auto_1394819 ) ) ( not ( = ?auto_1394812 ?auto_1394820 ) ) ( not ( = ?auto_1394813 ?auto_1394814 ) ) ( not ( = ?auto_1394813 ?auto_1394815 ) ) ( not ( = ?auto_1394813 ?auto_1394816 ) ) ( not ( = ?auto_1394813 ?auto_1394817 ) ) ( not ( = ?auto_1394813 ?auto_1394818 ) ) ( not ( = ?auto_1394813 ?auto_1394819 ) ) ( not ( = ?auto_1394813 ?auto_1394820 ) ) ( not ( = ?auto_1394814 ?auto_1394815 ) ) ( not ( = ?auto_1394814 ?auto_1394816 ) ) ( not ( = ?auto_1394814 ?auto_1394817 ) ) ( not ( = ?auto_1394814 ?auto_1394818 ) ) ( not ( = ?auto_1394814 ?auto_1394819 ) ) ( not ( = ?auto_1394814 ?auto_1394820 ) ) ( not ( = ?auto_1394815 ?auto_1394816 ) ) ( not ( = ?auto_1394815 ?auto_1394817 ) ) ( not ( = ?auto_1394815 ?auto_1394818 ) ) ( not ( = ?auto_1394815 ?auto_1394819 ) ) ( not ( = ?auto_1394815 ?auto_1394820 ) ) ( not ( = ?auto_1394816 ?auto_1394817 ) ) ( not ( = ?auto_1394816 ?auto_1394818 ) ) ( not ( = ?auto_1394816 ?auto_1394819 ) ) ( not ( = ?auto_1394816 ?auto_1394820 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1394817 ?auto_1394818 ?auto_1394819 )
      ( MAKE-13CRATE-VERIFY ?auto_1394806 ?auto_1394807 ?auto_1394808 ?auto_1394810 ?auto_1394809 ?auto_1394811 ?auto_1394812 ?auto_1394813 ?auto_1394814 ?auto_1394815 ?auto_1394816 ?auto_1394817 ?auto_1394818 ?auto_1394819 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1394919 - SURFACE
      ?auto_1394920 - SURFACE
      ?auto_1394921 - SURFACE
      ?auto_1394923 - SURFACE
      ?auto_1394922 - SURFACE
      ?auto_1394924 - SURFACE
      ?auto_1394925 - SURFACE
      ?auto_1394926 - SURFACE
      ?auto_1394927 - SURFACE
      ?auto_1394928 - SURFACE
    )
    :vars
    (
      ?auto_1394929 - HOIST
      ?auto_1394930 - PLACE
      ?auto_1394932 - PLACE
      ?auto_1394933 - HOIST
      ?auto_1394931 - SURFACE
      ?auto_1394934 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1394929 ?auto_1394930 ) ( IS-CRATE ?auto_1394928 ) ( not ( = ?auto_1394927 ?auto_1394928 ) ) ( not ( = ?auto_1394926 ?auto_1394927 ) ) ( not ( = ?auto_1394926 ?auto_1394928 ) ) ( not ( = ?auto_1394932 ?auto_1394930 ) ) ( HOIST-AT ?auto_1394933 ?auto_1394932 ) ( not ( = ?auto_1394929 ?auto_1394933 ) ) ( SURFACE-AT ?auto_1394928 ?auto_1394932 ) ( ON ?auto_1394928 ?auto_1394931 ) ( CLEAR ?auto_1394928 ) ( not ( = ?auto_1394927 ?auto_1394931 ) ) ( not ( = ?auto_1394928 ?auto_1394931 ) ) ( not ( = ?auto_1394926 ?auto_1394931 ) ) ( SURFACE-AT ?auto_1394926 ?auto_1394930 ) ( CLEAR ?auto_1394926 ) ( IS-CRATE ?auto_1394927 ) ( AVAILABLE ?auto_1394929 ) ( TRUCK-AT ?auto_1394934 ?auto_1394932 ) ( LIFTING ?auto_1394933 ?auto_1394927 ) ( ON ?auto_1394920 ?auto_1394919 ) ( ON ?auto_1394921 ?auto_1394920 ) ( ON ?auto_1394923 ?auto_1394921 ) ( ON ?auto_1394922 ?auto_1394923 ) ( ON ?auto_1394924 ?auto_1394922 ) ( ON ?auto_1394925 ?auto_1394924 ) ( ON ?auto_1394926 ?auto_1394925 ) ( not ( = ?auto_1394919 ?auto_1394920 ) ) ( not ( = ?auto_1394919 ?auto_1394921 ) ) ( not ( = ?auto_1394919 ?auto_1394923 ) ) ( not ( = ?auto_1394919 ?auto_1394922 ) ) ( not ( = ?auto_1394919 ?auto_1394924 ) ) ( not ( = ?auto_1394919 ?auto_1394925 ) ) ( not ( = ?auto_1394919 ?auto_1394926 ) ) ( not ( = ?auto_1394919 ?auto_1394927 ) ) ( not ( = ?auto_1394919 ?auto_1394928 ) ) ( not ( = ?auto_1394919 ?auto_1394931 ) ) ( not ( = ?auto_1394920 ?auto_1394921 ) ) ( not ( = ?auto_1394920 ?auto_1394923 ) ) ( not ( = ?auto_1394920 ?auto_1394922 ) ) ( not ( = ?auto_1394920 ?auto_1394924 ) ) ( not ( = ?auto_1394920 ?auto_1394925 ) ) ( not ( = ?auto_1394920 ?auto_1394926 ) ) ( not ( = ?auto_1394920 ?auto_1394927 ) ) ( not ( = ?auto_1394920 ?auto_1394928 ) ) ( not ( = ?auto_1394920 ?auto_1394931 ) ) ( not ( = ?auto_1394921 ?auto_1394923 ) ) ( not ( = ?auto_1394921 ?auto_1394922 ) ) ( not ( = ?auto_1394921 ?auto_1394924 ) ) ( not ( = ?auto_1394921 ?auto_1394925 ) ) ( not ( = ?auto_1394921 ?auto_1394926 ) ) ( not ( = ?auto_1394921 ?auto_1394927 ) ) ( not ( = ?auto_1394921 ?auto_1394928 ) ) ( not ( = ?auto_1394921 ?auto_1394931 ) ) ( not ( = ?auto_1394923 ?auto_1394922 ) ) ( not ( = ?auto_1394923 ?auto_1394924 ) ) ( not ( = ?auto_1394923 ?auto_1394925 ) ) ( not ( = ?auto_1394923 ?auto_1394926 ) ) ( not ( = ?auto_1394923 ?auto_1394927 ) ) ( not ( = ?auto_1394923 ?auto_1394928 ) ) ( not ( = ?auto_1394923 ?auto_1394931 ) ) ( not ( = ?auto_1394922 ?auto_1394924 ) ) ( not ( = ?auto_1394922 ?auto_1394925 ) ) ( not ( = ?auto_1394922 ?auto_1394926 ) ) ( not ( = ?auto_1394922 ?auto_1394927 ) ) ( not ( = ?auto_1394922 ?auto_1394928 ) ) ( not ( = ?auto_1394922 ?auto_1394931 ) ) ( not ( = ?auto_1394924 ?auto_1394925 ) ) ( not ( = ?auto_1394924 ?auto_1394926 ) ) ( not ( = ?auto_1394924 ?auto_1394927 ) ) ( not ( = ?auto_1394924 ?auto_1394928 ) ) ( not ( = ?auto_1394924 ?auto_1394931 ) ) ( not ( = ?auto_1394925 ?auto_1394926 ) ) ( not ( = ?auto_1394925 ?auto_1394927 ) ) ( not ( = ?auto_1394925 ?auto_1394928 ) ) ( not ( = ?auto_1394925 ?auto_1394931 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1394926 ?auto_1394927 ?auto_1394928 )
      ( MAKE-9CRATE-VERIFY ?auto_1394919 ?auto_1394920 ?auto_1394921 ?auto_1394923 ?auto_1394922 ?auto_1394924 ?auto_1394925 ?auto_1394926 ?auto_1394927 ?auto_1394928 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1394935 - SURFACE
      ?auto_1394936 - SURFACE
      ?auto_1394937 - SURFACE
      ?auto_1394939 - SURFACE
      ?auto_1394938 - SURFACE
      ?auto_1394940 - SURFACE
      ?auto_1394941 - SURFACE
      ?auto_1394942 - SURFACE
      ?auto_1394943 - SURFACE
      ?auto_1394944 - SURFACE
      ?auto_1394945 - SURFACE
    )
    :vars
    (
      ?auto_1394946 - HOIST
      ?auto_1394947 - PLACE
      ?auto_1394949 - PLACE
      ?auto_1394950 - HOIST
      ?auto_1394948 - SURFACE
      ?auto_1394951 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1394946 ?auto_1394947 ) ( IS-CRATE ?auto_1394945 ) ( not ( = ?auto_1394944 ?auto_1394945 ) ) ( not ( = ?auto_1394943 ?auto_1394944 ) ) ( not ( = ?auto_1394943 ?auto_1394945 ) ) ( not ( = ?auto_1394949 ?auto_1394947 ) ) ( HOIST-AT ?auto_1394950 ?auto_1394949 ) ( not ( = ?auto_1394946 ?auto_1394950 ) ) ( SURFACE-AT ?auto_1394945 ?auto_1394949 ) ( ON ?auto_1394945 ?auto_1394948 ) ( CLEAR ?auto_1394945 ) ( not ( = ?auto_1394944 ?auto_1394948 ) ) ( not ( = ?auto_1394945 ?auto_1394948 ) ) ( not ( = ?auto_1394943 ?auto_1394948 ) ) ( SURFACE-AT ?auto_1394943 ?auto_1394947 ) ( CLEAR ?auto_1394943 ) ( IS-CRATE ?auto_1394944 ) ( AVAILABLE ?auto_1394946 ) ( TRUCK-AT ?auto_1394951 ?auto_1394949 ) ( LIFTING ?auto_1394950 ?auto_1394944 ) ( ON ?auto_1394936 ?auto_1394935 ) ( ON ?auto_1394937 ?auto_1394936 ) ( ON ?auto_1394939 ?auto_1394937 ) ( ON ?auto_1394938 ?auto_1394939 ) ( ON ?auto_1394940 ?auto_1394938 ) ( ON ?auto_1394941 ?auto_1394940 ) ( ON ?auto_1394942 ?auto_1394941 ) ( ON ?auto_1394943 ?auto_1394942 ) ( not ( = ?auto_1394935 ?auto_1394936 ) ) ( not ( = ?auto_1394935 ?auto_1394937 ) ) ( not ( = ?auto_1394935 ?auto_1394939 ) ) ( not ( = ?auto_1394935 ?auto_1394938 ) ) ( not ( = ?auto_1394935 ?auto_1394940 ) ) ( not ( = ?auto_1394935 ?auto_1394941 ) ) ( not ( = ?auto_1394935 ?auto_1394942 ) ) ( not ( = ?auto_1394935 ?auto_1394943 ) ) ( not ( = ?auto_1394935 ?auto_1394944 ) ) ( not ( = ?auto_1394935 ?auto_1394945 ) ) ( not ( = ?auto_1394935 ?auto_1394948 ) ) ( not ( = ?auto_1394936 ?auto_1394937 ) ) ( not ( = ?auto_1394936 ?auto_1394939 ) ) ( not ( = ?auto_1394936 ?auto_1394938 ) ) ( not ( = ?auto_1394936 ?auto_1394940 ) ) ( not ( = ?auto_1394936 ?auto_1394941 ) ) ( not ( = ?auto_1394936 ?auto_1394942 ) ) ( not ( = ?auto_1394936 ?auto_1394943 ) ) ( not ( = ?auto_1394936 ?auto_1394944 ) ) ( not ( = ?auto_1394936 ?auto_1394945 ) ) ( not ( = ?auto_1394936 ?auto_1394948 ) ) ( not ( = ?auto_1394937 ?auto_1394939 ) ) ( not ( = ?auto_1394937 ?auto_1394938 ) ) ( not ( = ?auto_1394937 ?auto_1394940 ) ) ( not ( = ?auto_1394937 ?auto_1394941 ) ) ( not ( = ?auto_1394937 ?auto_1394942 ) ) ( not ( = ?auto_1394937 ?auto_1394943 ) ) ( not ( = ?auto_1394937 ?auto_1394944 ) ) ( not ( = ?auto_1394937 ?auto_1394945 ) ) ( not ( = ?auto_1394937 ?auto_1394948 ) ) ( not ( = ?auto_1394939 ?auto_1394938 ) ) ( not ( = ?auto_1394939 ?auto_1394940 ) ) ( not ( = ?auto_1394939 ?auto_1394941 ) ) ( not ( = ?auto_1394939 ?auto_1394942 ) ) ( not ( = ?auto_1394939 ?auto_1394943 ) ) ( not ( = ?auto_1394939 ?auto_1394944 ) ) ( not ( = ?auto_1394939 ?auto_1394945 ) ) ( not ( = ?auto_1394939 ?auto_1394948 ) ) ( not ( = ?auto_1394938 ?auto_1394940 ) ) ( not ( = ?auto_1394938 ?auto_1394941 ) ) ( not ( = ?auto_1394938 ?auto_1394942 ) ) ( not ( = ?auto_1394938 ?auto_1394943 ) ) ( not ( = ?auto_1394938 ?auto_1394944 ) ) ( not ( = ?auto_1394938 ?auto_1394945 ) ) ( not ( = ?auto_1394938 ?auto_1394948 ) ) ( not ( = ?auto_1394940 ?auto_1394941 ) ) ( not ( = ?auto_1394940 ?auto_1394942 ) ) ( not ( = ?auto_1394940 ?auto_1394943 ) ) ( not ( = ?auto_1394940 ?auto_1394944 ) ) ( not ( = ?auto_1394940 ?auto_1394945 ) ) ( not ( = ?auto_1394940 ?auto_1394948 ) ) ( not ( = ?auto_1394941 ?auto_1394942 ) ) ( not ( = ?auto_1394941 ?auto_1394943 ) ) ( not ( = ?auto_1394941 ?auto_1394944 ) ) ( not ( = ?auto_1394941 ?auto_1394945 ) ) ( not ( = ?auto_1394941 ?auto_1394948 ) ) ( not ( = ?auto_1394942 ?auto_1394943 ) ) ( not ( = ?auto_1394942 ?auto_1394944 ) ) ( not ( = ?auto_1394942 ?auto_1394945 ) ) ( not ( = ?auto_1394942 ?auto_1394948 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1394943 ?auto_1394944 ?auto_1394945 )
      ( MAKE-10CRATE-VERIFY ?auto_1394935 ?auto_1394936 ?auto_1394937 ?auto_1394939 ?auto_1394938 ?auto_1394940 ?auto_1394941 ?auto_1394942 ?auto_1394943 ?auto_1394944 ?auto_1394945 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1394952 - SURFACE
      ?auto_1394953 - SURFACE
      ?auto_1394954 - SURFACE
      ?auto_1394956 - SURFACE
      ?auto_1394955 - SURFACE
      ?auto_1394957 - SURFACE
      ?auto_1394958 - SURFACE
      ?auto_1394959 - SURFACE
      ?auto_1394960 - SURFACE
      ?auto_1394961 - SURFACE
      ?auto_1394962 - SURFACE
      ?auto_1394963 - SURFACE
    )
    :vars
    (
      ?auto_1394964 - HOIST
      ?auto_1394965 - PLACE
      ?auto_1394967 - PLACE
      ?auto_1394968 - HOIST
      ?auto_1394966 - SURFACE
      ?auto_1394969 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1394964 ?auto_1394965 ) ( IS-CRATE ?auto_1394963 ) ( not ( = ?auto_1394962 ?auto_1394963 ) ) ( not ( = ?auto_1394961 ?auto_1394962 ) ) ( not ( = ?auto_1394961 ?auto_1394963 ) ) ( not ( = ?auto_1394967 ?auto_1394965 ) ) ( HOIST-AT ?auto_1394968 ?auto_1394967 ) ( not ( = ?auto_1394964 ?auto_1394968 ) ) ( SURFACE-AT ?auto_1394963 ?auto_1394967 ) ( ON ?auto_1394963 ?auto_1394966 ) ( CLEAR ?auto_1394963 ) ( not ( = ?auto_1394962 ?auto_1394966 ) ) ( not ( = ?auto_1394963 ?auto_1394966 ) ) ( not ( = ?auto_1394961 ?auto_1394966 ) ) ( SURFACE-AT ?auto_1394961 ?auto_1394965 ) ( CLEAR ?auto_1394961 ) ( IS-CRATE ?auto_1394962 ) ( AVAILABLE ?auto_1394964 ) ( TRUCK-AT ?auto_1394969 ?auto_1394967 ) ( LIFTING ?auto_1394968 ?auto_1394962 ) ( ON ?auto_1394953 ?auto_1394952 ) ( ON ?auto_1394954 ?auto_1394953 ) ( ON ?auto_1394956 ?auto_1394954 ) ( ON ?auto_1394955 ?auto_1394956 ) ( ON ?auto_1394957 ?auto_1394955 ) ( ON ?auto_1394958 ?auto_1394957 ) ( ON ?auto_1394959 ?auto_1394958 ) ( ON ?auto_1394960 ?auto_1394959 ) ( ON ?auto_1394961 ?auto_1394960 ) ( not ( = ?auto_1394952 ?auto_1394953 ) ) ( not ( = ?auto_1394952 ?auto_1394954 ) ) ( not ( = ?auto_1394952 ?auto_1394956 ) ) ( not ( = ?auto_1394952 ?auto_1394955 ) ) ( not ( = ?auto_1394952 ?auto_1394957 ) ) ( not ( = ?auto_1394952 ?auto_1394958 ) ) ( not ( = ?auto_1394952 ?auto_1394959 ) ) ( not ( = ?auto_1394952 ?auto_1394960 ) ) ( not ( = ?auto_1394952 ?auto_1394961 ) ) ( not ( = ?auto_1394952 ?auto_1394962 ) ) ( not ( = ?auto_1394952 ?auto_1394963 ) ) ( not ( = ?auto_1394952 ?auto_1394966 ) ) ( not ( = ?auto_1394953 ?auto_1394954 ) ) ( not ( = ?auto_1394953 ?auto_1394956 ) ) ( not ( = ?auto_1394953 ?auto_1394955 ) ) ( not ( = ?auto_1394953 ?auto_1394957 ) ) ( not ( = ?auto_1394953 ?auto_1394958 ) ) ( not ( = ?auto_1394953 ?auto_1394959 ) ) ( not ( = ?auto_1394953 ?auto_1394960 ) ) ( not ( = ?auto_1394953 ?auto_1394961 ) ) ( not ( = ?auto_1394953 ?auto_1394962 ) ) ( not ( = ?auto_1394953 ?auto_1394963 ) ) ( not ( = ?auto_1394953 ?auto_1394966 ) ) ( not ( = ?auto_1394954 ?auto_1394956 ) ) ( not ( = ?auto_1394954 ?auto_1394955 ) ) ( not ( = ?auto_1394954 ?auto_1394957 ) ) ( not ( = ?auto_1394954 ?auto_1394958 ) ) ( not ( = ?auto_1394954 ?auto_1394959 ) ) ( not ( = ?auto_1394954 ?auto_1394960 ) ) ( not ( = ?auto_1394954 ?auto_1394961 ) ) ( not ( = ?auto_1394954 ?auto_1394962 ) ) ( not ( = ?auto_1394954 ?auto_1394963 ) ) ( not ( = ?auto_1394954 ?auto_1394966 ) ) ( not ( = ?auto_1394956 ?auto_1394955 ) ) ( not ( = ?auto_1394956 ?auto_1394957 ) ) ( not ( = ?auto_1394956 ?auto_1394958 ) ) ( not ( = ?auto_1394956 ?auto_1394959 ) ) ( not ( = ?auto_1394956 ?auto_1394960 ) ) ( not ( = ?auto_1394956 ?auto_1394961 ) ) ( not ( = ?auto_1394956 ?auto_1394962 ) ) ( not ( = ?auto_1394956 ?auto_1394963 ) ) ( not ( = ?auto_1394956 ?auto_1394966 ) ) ( not ( = ?auto_1394955 ?auto_1394957 ) ) ( not ( = ?auto_1394955 ?auto_1394958 ) ) ( not ( = ?auto_1394955 ?auto_1394959 ) ) ( not ( = ?auto_1394955 ?auto_1394960 ) ) ( not ( = ?auto_1394955 ?auto_1394961 ) ) ( not ( = ?auto_1394955 ?auto_1394962 ) ) ( not ( = ?auto_1394955 ?auto_1394963 ) ) ( not ( = ?auto_1394955 ?auto_1394966 ) ) ( not ( = ?auto_1394957 ?auto_1394958 ) ) ( not ( = ?auto_1394957 ?auto_1394959 ) ) ( not ( = ?auto_1394957 ?auto_1394960 ) ) ( not ( = ?auto_1394957 ?auto_1394961 ) ) ( not ( = ?auto_1394957 ?auto_1394962 ) ) ( not ( = ?auto_1394957 ?auto_1394963 ) ) ( not ( = ?auto_1394957 ?auto_1394966 ) ) ( not ( = ?auto_1394958 ?auto_1394959 ) ) ( not ( = ?auto_1394958 ?auto_1394960 ) ) ( not ( = ?auto_1394958 ?auto_1394961 ) ) ( not ( = ?auto_1394958 ?auto_1394962 ) ) ( not ( = ?auto_1394958 ?auto_1394963 ) ) ( not ( = ?auto_1394958 ?auto_1394966 ) ) ( not ( = ?auto_1394959 ?auto_1394960 ) ) ( not ( = ?auto_1394959 ?auto_1394961 ) ) ( not ( = ?auto_1394959 ?auto_1394962 ) ) ( not ( = ?auto_1394959 ?auto_1394963 ) ) ( not ( = ?auto_1394959 ?auto_1394966 ) ) ( not ( = ?auto_1394960 ?auto_1394961 ) ) ( not ( = ?auto_1394960 ?auto_1394962 ) ) ( not ( = ?auto_1394960 ?auto_1394963 ) ) ( not ( = ?auto_1394960 ?auto_1394966 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1394961 ?auto_1394962 ?auto_1394963 )
      ( MAKE-11CRATE-VERIFY ?auto_1394952 ?auto_1394953 ?auto_1394954 ?auto_1394956 ?auto_1394955 ?auto_1394957 ?auto_1394958 ?auto_1394959 ?auto_1394960 ?auto_1394961 ?auto_1394962 ?auto_1394963 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1394970 - SURFACE
      ?auto_1394971 - SURFACE
      ?auto_1394972 - SURFACE
      ?auto_1394974 - SURFACE
      ?auto_1394973 - SURFACE
      ?auto_1394975 - SURFACE
      ?auto_1394976 - SURFACE
      ?auto_1394977 - SURFACE
      ?auto_1394978 - SURFACE
      ?auto_1394979 - SURFACE
      ?auto_1394980 - SURFACE
      ?auto_1394981 - SURFACE
      ?auto_1394982 - SURFACE
    )
    :vars
    (
      ?auto_1394983 - HOIST
      ?auto_1394984 - PLACE
      ?auto_1394986 - PLACE
      ?auto_1394987 - HOIST
      ?auto_1394985 - SURFACE
      ?auto_1394988 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1394983 ?auto_1394984 ) ( IS-CRATE ?auto_1394982 ) ( not ( = ?auto_1394981 ?auto_1394982 ) ) ( not ( = ?auto_1394980 ?auto_1394981 ) ) ( not ( = ?auto_1394980 ?auto_1394982 ) ) ( not ( = ?auto_1394986 ?auto_1394984 ) ) ( HOIST-AT ?auto_1394987 ?auto_1394986 ) ( not ( = ?auto_1394983 ?auto_1394987 ) ) ( SURFACE-AT ?auto_1394982 ?auto_1394986 ) ( ON ?auto_1394982 ?auto_1394985 ) ( CLEAR ?auto_1394982 ) ( not ( = ?auto_1394981 ?auto_1394985 ) ) ( not ( = ?auto_1394982 ?auto_1394985 ) ) ( not ( = ?auto_1394980 ?auto_1394985 ) ) ( SURFACE-AT ?auto_1394980 ?auto_1394984 ) ( CLEAR ?auto_1394980 ) ( IS-CRATE ?auto_1394981 ) ( AVAILABLE ?auto_1394983 ) ( TRUCK-AT ?auto_1394988 ?auto_1394986 ) ( LIFTING ?auto_1394987 ?auto_1394981 ) ( ON ?auto_1394971 ?auto_1394970 ) ( ON ?auto_1394972 ?auto_1394971 ) ( ON ?auto_1394974 ?auto_1394972 ) ( ON ?auto_1394973 ?auto_1394974 ) ( ON ?auto_1394975 ?auto_1394973 ) ( ON ?auto_1394976 ?auto_1394975 ) ( ON ?auto_1394977 ?auto_1394976 ) ( ON ?auto_1394978 ?auto_1394977 ) ( ON ?auto_1394979 ?auto_1394978 ) ( ON ?auto_1394980 ?auto_1394979 ) ( not ( = ?auto_1394970 ?auto_1394971 ) ) ( not ( = ?auto_1394970 ?auto_1394972 ) ) ( not ( = ?auto_1394970 ?auto_1394974 ) ) ( not ( = ?auto_1394970 ?auto_1394973 ) ) ( not ( = ?auto_1394970 ?auto_1394975 ) ) ( not ( = ?auto_1394970 ?auto_1394976 ) ) ( not ( = ?auto_1394970 ?auto_1394977 ) ) ( not ( = ?auto_1394970 ?auto_1394978 ) ) ( not ( = ?auto_1394970 ?auto_1394979 ) ) ( not ( = ?auto_1394970 ?auto_1394980 ) ) ( not ( = ?auto_1394970 ?auto_1394981 ) ) ( not ( = ?auto_1394970 ?auto_1394982 ) ) ( not ( = ?auto_1394970 ?auto_1394985 ) ) ( not ( = ?auto_1394971 ?auto_1394972 ) ) ( not ( = ?auto_1394971 ?auto_1394974 ) ) ( not ( = ?auto_1394971 ?auto_1394973 ) ) ( not ( = ?auto_1394971 ?auto_1394975 ) ) ( not ( = ?auto_1394971 ?auto_1394976 ) ) ( not ( = ?auto_1394971 ?auto_1394977 ) ) ( not ( = ?auto_1394971 ?auto_1394978 ) ) ( not ( = ?auto_1394971 ?auto_1394979 ) ) ( not ( = ?auto_1394971 ?auto_1394980 ) ) ( not ( = ?auto_1394971 ?auto_1394981 ) ) ( not ( = ?auto_1394971 ?auto_1394982 ) ) ( not ( = ?auto_1394971 ?auto_1394985 ) ) ( not ( = ?auto_1394972 ?auto_1394974 ) ) ( not ( = ?auto_1394972 ?auto_1394973 ) ) ( not ( = ?auto_1394972 ?auto_1394975 ) ) ( not ( = ?auto_1394972 ?auto_1394976 ) ) ( not ( = ?auto_1394972 ?auto_1394977 ) ) ( not ( = ?auto_1394972 ?auto_1394978 ) ) ( not ( = ?auto_1394972 ?auto_1394979 ) ) ( not ( = ?auto_1394972 ?auto_1394980 ) ) ( not ( = ?auto_1394972 ?auto_1394981 ) ) ( not ( = ?auto_1394972 ?auto_1394982 ) ) ( not ( = ?auto_1394972 ?auto_1394985 ) ) ( not ( = ?auto_1394974 ?auto_1394973 ) ) ( not ( = ?auto_1394974 ?auto_1394975 ) ) ( not ( = ?auto_1394974 ?auto_1394976 ) ) ( not ( = ?auto_1394974 ?auto_1394977 ) ) ( not ( = ?auto_1394974 ?auto_1394978 ) ) ( not ( = ?auto_1394974 ?auto_1394979 ) ) ( not ( = ?auto_1394974 ?auto_1394980 ) ) ( not ( = ?auto_1394974 ?auto_1394981 ) ) ( not ( = ?auto_1394974 ?auto_1394982 ) ) ( not ( = ?auto_1394974 ?auto_1394985 ) ) ( not ( = ?auto_1394973 ?auto_1394975 ) ) ( not ( = ?auto_1394973 ?auto_1394976 ) ) ( not ( = ?auto_1394973 ?auto_1394977 ) ) ( not ( = ?auto_1394973 ?auto_1394978 ) ) ( not ( = ?auto_1394973 ?auto_1394979 ) ) ( not ( = ?auto_1394973 ?auto_1394980 ) ) ( not ( = ?auto_1394973 ?auto_1394981 ) ) ( not ( = ?auto_1394973 ?auto_1394982 ) ) ( not ( = ?auto_1394973 ?auto_1394985 ) ) ( not ( = ?auto_1394975 ?auto_1394976 ) ) ( not ( = ?auto_1394975 ?auto_1394977 ) ) ( not ( = ?auto_1394975 ?auto_1394978 ) ) ( not ( = ?auto_1394975 ?auto_1394979 ) ) ( not ( = ?auto_1394975 ?auto_1394980 ) ) ( not ( = ?auto_1394975 ?auto_1394981 ) ) ( not ( = ?auto_1394975 ?auto_1394982 ) ) ( not ( = ?auto_1394975 ?auto_1394985 ) ) ( not ( = ?auto_1394976 ?auto_1394977 ) ) ( not ( = ?auto_1394976 ?auto_1394978 ) ) ( not ( = ?auto_1394976 ?auto_1394979 ) ) ( not ( = ?auto_1394976 ?auto_1394980 ) ) ( not ( = ?auto_1394976 ?auto_1394981 ) ) ( not ( = ?auto_1394976 ?auto_1394982 ) ) ( not ( = ?auto_1394976 ?auto_1394985 ) ) ( not ( = ?auto_1394977 ?auto_1394978 ) ) ( not ( = ?auto_1394977 ?auto_1394979 ) ) ( not ( = ?auto_1394977 ?auto_1394980 ) ) ( not ( = ?auto_1394977 ?auto_1394981 ) ) ( not ( = ?auto_1394977 ?auto_1394982 ) ) ( not ( = ?auto_1394977 ?auto_1394985 ) ) ( not ( = ?auto_1394978 ?auto_1394979 ) ) ( not ( = ?auto_1394978 ?auto_1394980 ) ) ( not ( = ?auto_1394978 ?auto_1394981 ) ) ( not ( = ?auto_1394978 ?auto_1394982 ) ) ( not ( = ?auto_1394978 ?auto_1394985 ) ) ( not ( = ?auto_1394979 ?auto_1394980 ) ) ( not ( = ?auto_1394979 ?auto_1394981 ) ) ( not ( = ?auto_1394979 ?auto_1394982 ) ) ( not ( = ?auto_1394979 ?auto_1394985 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1394980 ?auto_1394981 ?auto_1394982 )
      ( MAKE-12CRATE-VERIFY ?auto_1394970 ?auto_1394971 ?auto_1394972 ?auto_1394974 ?auto_1394973 ?auto_1394975 ?auto_1394976 ?auto_1394977 ?auto_1394978 ?auto_1394979 ?auto_1394980 ?auto_1394981 ?auto_1394982 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1394989 - SURFACE
      ?auto_1394990 - SURFACE
      ?auto_1394991 - SURFACE
      ?auto_1394993 - SURFACE
      ?auto_1394992 - SURFACE
      ?auto_1394994 - SURFACE
      ?auto_1394995 - SURFACE
      ?auto_1394996 - SURFACE
      ?auto_1394997 - SURFACE
      ?auto_1394998 - SURFACE
      ?auto_1394999 - SURFACE
      ?auto_1395000 - SURFACE
      ?auto_1395001 - SURFACE
      ?auto_1395002 - SURFACE
    )
    :vars
    (
      ?auto_1395003 - HOIST
      ?auto_1395004 - PLACE
      ?auto_1395006 - PLACE
      ?auto_1395007 - HOIST
      ?auto_1395005 - SURFACE
      ?auto_1395008 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395003 ?auto_1395004 ) ( IS-CRATE ?auto_1395002 ) ( not ( = ?auto_1395001 ?auto_1395002 ) ) ( not ( = ?auto_1395000 ?auto_1395001 ) ) ( not ( = ?auto_1395000 ?auto_1395002 ) ) ( not ( = ?auto_1395006 ?auto_1395004 ) ) ( HOIST-AT ?auto_1395007 ?auto_1395006 ) ( not ( = ?auto_1395003 ?auto_1395007 ) ) ( SURFACE-AT ?auto_1395002 ?auto_1395006 ) ( ON ?auto_1395002 ?auto_1395005 ) ( CLEAR ?auto_1395002 ) ( not ( = ?auto_1395001 ?auto_1395005 ) ) ( not ( = ?auto_1395002 ?auto_1395005 ) ) ( not ( = ?auto_1395000 ?auto_1395005 ) ) ( SURFACE-AT ?auto_1395000 ?auto_1395004 ) ( CLEAR ?auto_1395000 ) ( IS-CRATE ?auto_1395001 ) ( AVAILABLE ?auto_1395003 ) ( TRUCK-AT ?auto_1395008 ?auto_1395006 ) ( LIFTING ?auto_1395007 ?auto_1395001 ) ( ON ?auto_1394990 ?auto_1394989 ) ( ON ?auto_1394991 ?auto_1394990 ) ( ON ?auto_1394993 ?auto_1394991 ) ( ON ?auto_1394992 ?auto_1394993 ) ( ON ?auto_1394994 ?auto_1394992 ) ( ON ?auto_1394995 ?auto_1394994 ) ( ON ?auto_1394996 ?auto_1394995 ) ( ON ?auto_1394997 ?auto_1394996 ) ( ON ?auto_1394998 ?auto_1394997 ) ( ON ?auto_1394999 ?auto_1394998 ) ( ON ?auto_1395000 ?auto_1394999 ) ( not ( = ?auto_1394989 ?auto_1394990 ) ) ( not ( = ?auto_1394989 ?auto_1394991 ) ) ( not ( = ?auto_1394989 ?auto_1394993 ) ) ( not ( = ?auto_1394989 ?auto_1394992 ) ) ( not ( = ?auto_1394989 ?auto_1394994 ) ) ( not ( = ?auto_1394989 ?auto_1394995 ) ) ( not ( = ?auto_1394989 ?auto_1394996 ) ) ( not ( = ?auto_1394989 ?auto_1394997 ) ) ( not ( = ?auto_1394989 ?auto_1394998 ) ) ( not ( = ?auto_1394989 ?auto_1394999 ) ) ( not ( = ?auto_1394989 ?auto_1395000 ) ) ( not ( = ?auto_1394989 ?auto_1395001 ) ) ( not ( = ?auto_1394989 ?auto_1395002 ) ) ( not ( = ?auto_1394989 ?auto_1395005 ) ) ( not ( = ?auto_1394990 ?auto_1394991 ) ) ( not ( = ?auto_1394990 ?auto_1394993 ) ) ( not ( = ?auto_1394990 ?auto_1394992 ) ) ( not ( = ?auto_1394990 ?auto_1394994 ) ) ( not ( = ?auto_1394990 ?auto_1394995 ) ) ( not ( = ?auto_1394990 ?auto_1394996 ) ) ( not ( = ?auto_1394990 ?auto_1394997 ) ) ( not ( = ?auto_1394990 ?auto_1394998 ) ) ( not ( = ?auto_1394990 ?auto_1394999 ) ) ( not ( = ?auto_1394990 ?auto_1395000 ) ) ( not ( = ?auto_1394990 ?auto_1395001 ) ) ( not ( = ?auto_1394990 ?auto_1395002 ) ) ( not ( = ?auto_1394990 ?auto_1395005 ) ) ( not ( = ?auto_1394991 ?auto_1394993 ) ) ( not ( = ?auto_1394991 ?auto_1394992 ) ) ( not ( = ?auto_1394991 ?auto_1394994 ) ) ( not ( = ?auto_1394991 ?auto_1394995 ) ) ( not ( = ?auto_1394991 ?auto_1394996 ) ) ( not ( = ?auto_1394991 ?auto_1394997 ) ) ( not ( = ?auto_1394991 ?auto_1394998 ) ) ( not ( = ?auto_1394991 ?auto_1394999 ) ) ( not ( = ?auto_1394991 ?auto_1395000 ) ) ( not ( = ?auto_1394991 ?auto_1395001 ) ) ( not ( = ?auto_1394991 ?auto_1395002 ) ) ( not ( = ?auto_1394991 ?auto_1395005 ) ) ( not ( = ?auto_1394993 ?auto_1394992 ) ) ( not ( = ?auto_1394993 ?auto_1394994 ) ) ( not ( = ?auto_1394993 ?auto_1394995 ) ) ( not ( = ?auto_1394993 ?auto_1394996 ) ) ( not ( = ?auto_1394993 ?auto_1394997 ) ) ( not ( = ?auto_1394993 ?auto_1394998 ) ) ( not ( = ?auto_1394993 ?auto_1394999 ) ) ( not ( = ?auto_1394993 ?auto_1395000 ) ) ( not ( = ?auto_1394993 ?auto_1395001 ) ) ( not ( = ?auto_1394993 ?auto_1395002 ) ) ( not ( = ?auto_1394993 ?auto_1395005 ) ) ( not ( = ?auto_1394992 ?auto_1394994 ) ) ( not ( = ?auto_1394992 ?auto_1394995 ) ) ( not ( = ?auto_1394992 ?auto_1394996 ) ) ( not ( = ?auto_1394992 ?auto_1394997 ) ) ( not ( = ?auto_1394992 ?auto_1394998 ) ) ( not ( = ?auto_1394992 ?auto_1394999 ) ) ( not ( = ?auto_1394992 ?auto_1395000 ) ) ( not ( = ?auto_1394992 ?auto_1395001 ) ) ( not ( = ?auto_1394992 ?auto_1395002 ) ) ( not ( = ?auto_1394992 ?auto_1395005 ) ) ( not ( = ?auto_1394994 ?auto_1394995 ) ) ( not ( = ?auto_1394994 ?auto_1394996 ) ) ( not ( = ?auto_1394994 ?auto_1394997 ) ) ( not ( = ?auto_1394994 ?auto_1394998 ) ) ( not ( = ?auto_1394994 ?auto_1394999 ) ) ( not ( = ?auto_1394994 ?auto_1395000 ) ) ( not ( = ?auto_1394994 ?auto_1395001 ) ) ( not ( = ?auto_1394994 ?auto_1395002 ) ) ( not ( = ?auto_1394994 ?auto_1395005 ) ) ( not ( = ?auto_1394995 ?auto_1394996 ) ) ( not ( = ?auto_1394995 ?auto_1394997 ) ) ( not ( = ?auto_1394995 ?auto_1394998 ) ) ( not ( = ?auto_1394995 ?auto_1394999 ) ) ( not ( = ?auto_1394995 ?auto_1395000 ) ) ( not ( = ?auto_1394995 ?auto_1395001 ) ) ( not ( = ?auto_1394995 ?auto_1395002 ) ) ( not ( = ?auto_1394995 ?auto_1395005 ) ) ( not ( = ?auto_1394996 ?auto_1394997 ) ) ( not ( = ?auto_1394996 ?auto_1394998 ) ) ( not ( = ?auto_1394996 ?auto_1394999 ) ) ( not ( = ?auto_1394996 ?auto_1395000 ) ) ( not ( = ?auto_1394996 ?auto_1395001 ) ) ( not ( = ?auto_1394996 ?auto_1395002 ) ) ( not ( = ?auto_1394996 ?auto_1395005 ) ) ( not ( = ?auto_1394997 ?auto_1394998 ) ) ( not ( = ?auto_1394997 ?auto_1394999 ) ) ( not ( = ?auto_1394997 ?auto_1395000 ) ) ( not ( = ?auto_1394997 ?auto_1395001 ) ) ( not ( = ?auto_1394997 ?auto_1395002 ) ) ( not ( = ?auto_1394997 ?auto_1395005 ) ) ( not ( = ?auto_1394998 ?auto_1394999 ) ) ( not ( = ?auto_1394998 ?auto_1395000 ) ) ( not ( = ?auto_1394998 ?auto_1395001 ) ) ( not ( = ?auto_1394998 ?auto_1395002 ) ) ( not ( = ?auto_1394998 ?auto_1395005 ) ) ( not ( = ?auto_1394999 ?auto_1395000 ) ) ( not ( = ?auto_1394999 ?auto_1395001 ) ) ( not ( = ?auto_1394999 ?auto_1395002 ) ) ( not ( = ?auto_1394999 ?auto_1395005 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1395000 ?auto_1395001 ?auto_1395002 )
      ( MAKE-13CRATE-VERIFY ?auto_1394989 ?auto_1394990 ?auto_1394991 ?auto_1394993 ?auto_1394992 ?auto_1394994 ?auto_1394995 ?auto_1394996 ?auto_1394997 ?auto_1394998 ?auto_1394999 ?auto_1395000 ?auto_1395001 ?auto_1395002 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1395110 - SURFACE
      ?auto_1395111 - SURFACE
      ?auto_1395112 - SURFACE
      ?auto_1395114 - SURFACE
      ?auto_1395113 - SURFACE
      ?auto_1395115 - SURFACE
      ?auto_1395116 - SURFACE
      ?auto_1395117 - SURFACE
      ?auto_1395118 - SURFACE
      ?auto_1395119 - SURFACE
    )
    :vars
    (
      ?auto_1395123 - HOIST
      ?auto_1395121 - PLACE
      ?auto_1395124 - PLACE
      ?auto_1395126 - HOIST
      ?auto_1395122 - SURFACE
      ?auto_1395125 - TRUCK
      ?auto_1395120 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395123 ?auto_1395121 ) ( IS-CRATE ?auto_1395119 ) ( not ( = ?auto_1395118 ?auto_1395119 ) ) ( not ( = ?auto_1395117 ?auto_1395118 ) ) ( not ( = ?auto_1395117 ?auto_1395119 ) ) ( not ( = ?auto_1395124 ?auto_1395121 ) ) ( HOIST-AT ?auto_1395126 ?auto_1395124 ) ( not ( = ?auto_1395123 ?auto_1395126 ) ) ( SURFACE-AT ?auto_1395119 ?auto_1395124 ) ( ON ?auto_1395119 ?auto_1395122 ) ( CLEAR ?auto_1395119 ) ( not ( = ?auto_1395118 ?auto_1395122 ) ) ( not ( = ?auto_1395119 ?auto_1395122 ) ) ( not ( = ?auto_1395117 ?auto_1395122 ) ) ( SURFACE-AT ?auto_1395117 ?auto_1395121 ) ( CLEAR ?auto_1395117 ) ( IS-CRATE ?auto_1395118 ) ( AVAILABLE ?auto_1395123 ) ( TRUCK-AT ?auto_1395125 ?auto_1395124 ) ( AVAILABLE ?auto_1395126 ) ( SURFACE-AT ?auto_1395118 ?auto_1395124 ) ( ON ?auto_1395118 ?auto_1395120 ) ( CLEAR ?auto_1395118 ) ( not ( = ?auto_1395118 ?auto_1395120 ) ) ( not ( = ?auto_1395119 ?auto_1395120 ) ) ( not ( = ?auto_1395117 ?auto_1395120 ) ) ( not ( = ?auto_1395122 ?auto_1395120 ) ) ( ON ?auto_1395111 ?auto_1395110 ) ( ON ?auto_1395112 ?auto_1395111 ) ( ON ?auto_1395114 ?auto_1395112 ) ( ON ?auto_1395113 ?auto_1395114 ) ( ON ?auto_1395115 ?auto_1395113 ) ( ON ?auto_1395116 ?auto_1395115 ) ( ON ?auto_1395117 ?auto_1395116 ) ( not ( = ?auto_1395110 ?auto_1395111 ) ) ( not ( = ?auto_1395110 ?auto_1395112 ) ) ( not ( = ?auto_1395110 ?auto_1395114 ) ) ( not ( = ?auto_1395110 ?auto_1395113 ) ) ( not ( = ?auto_1395110 ?auto_1395115 ) ) ( not ( = ?auto_1395110 ?auto_1395116 ) ) ( not ( = ?auto_1395110 ?auto_1395117 ) ) ( not ( = ?auto_1395110 ?auto_1395118 ) ) ( not ( = ?auto_1395110 ?auto_1395119 ) ) ( not ( = ?auto_1395110 ?auto_1395122 ) ) ( not ( = ?auto_1395110 ?auto_1395120 ) ) ( not ( = ?auto_1395111 ?auto_1395112 ) ) ( not ( = ?auto_1395111 ?auto_1395114 ) ) ( not ( = ?auto_1395111 ?auto_1395113 ) ) ( not ( = ?auto_1395111 ?auto_1395115 ) ) ( not ( = ?auto_1395111 ?auto_1395116 ) ) ( not ( = ?auto_1395111 ?auto_1395117 ) ) ( not ( = ?auto_1395111 ?auto_1395118 ) ) ( not ( = ?auto_1395111 ?auto_1395119 ) ) ( not ( = ?auto_1395111 ?auto_1395122 ) ) ( not ( = ?auto_1395111 ?auto_1395120 ) ) ( not ( = ?auto_1395112 ?auto_1395114 ) ) ( not ( = ?auto_1395112 ?auto_1395113 ) ) ( not ( = ?auto_1395112 ?auto_1395115 ) ) ( not ( = ?auto_1395112 ?auto_1395116 ) ) ( not ( = ?auto_1395112 ?auto_1395117 ) ) ( not ( = ?auto_1395112 ?auto_1395118 ) ) ( not ( = ?auto_1395112 ?auto_1395119 ) ) ( not ( = ?auto_1395112 ?auto_1395122 ) ) ( not ( = ?auto_1395112 ?auto_1395120 ) ) ( not ( = ?auto_1395114 ?auto_1395113 ) ) ( not ( = ?auto_1395114 ?auto_1395115 ) ) ( not ( = ?auto_1395114 ?auto_1395116 ) ) ( not ( = ?auto_1395114 ?auto_1395117 ) ) ( not ( = ?auto_1395114 ?auto_1395118 ) ) ( not ( = ?auto_1395114 ?auto_1395119 ) ) ( not ( = ?auto_1395114 ?auto_1395122 ) ) ( not ( = ?auto_1395114 ?auto_1395120 ) ) ( not ( = ?auto_1395113 ?auto_1395115 ) ) ( not ( = ?auto_1395113 ?auto_1395116 ) ) ( not ( = ?auto_1395113 ?auto_1395117 ) ) ( not ( = ?auto_1395113 ?auto_1395118 ) ) ( not ( = ?auto_1395113 ?auto_1395119 ) ) ( not ( = ?auto_1395113 ?auto_1395122 ) ) ( not ( = ?auto_1395113 ?auto_1395120 ) ) ( not ( = ?auto_1395115 ?auto_1395116 ) ) ( not ( = ?auto_1395115 ?auto_1395117 ) ) ( not ( = ?auto_1395115 ?auto_1395118 ) ) ( not ( = ?auto_1395115 ?auto_1395119 ) ) ( not ( = ?auto_1395115 ?auto_1395122 ) ) ( not ( = ?auto_1395115 ?auto_1395120 ) ) ( not ( = ?auto_1395116 ?auto_1395117 ) ) ( not ( = ?auto_1395116 ?auto_1395118 ) ) ( not ( = ?auto_1395116 ?auto_1395119 ) ) ( not ( = ?auto_1395116 ?auto_1395122 ) ) ( not ( = ?auto_1395116 ?auto_1395120 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1395117 ?auto_1395118 ?auto_1395119 )
      ( MAKE-9CRATE-VERIFY ?auto_1395110 ?auto_1395111 ?auto_1395112 ?auto_1395114 ?auto_1395113 ?auto_1395115 ?auto_1395116 ?auto_1395117 ?auto_1395118 ?auto_1395119 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1395127 - SURFACE
      ?auto_1395128 - SURFACE
      ?auto_1395129 - SURFACE
      ?auto_1395131 - SURFACE
      ?auto_1395130 - SURFACE
      ?auto_1395132 - SURFACE
      ?auto_1395133 - SURFACE
      ?auto_1395134 - SURFACE
      ?auto_1395135 - SURFACE
      ?auto_1395136 - SURFACE
      ?auto_1395137 - SURFACE
    )
    :vars
    (
      ?auto_1395141 - HOIST
      ?auto_1395139 - PLACE
      ?auto_1395142 - PLACE
      ?auto_1395144 - HOIST
      ?auto_1395140 - SURFACE
      ?auto_1395143 - TRUCK
      ?auto_1395138 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395141 ?auto_1395139 ) ( IS-CRATE ?auto_1395137 ) ( not ( = ?auto_1395136 ?auto_1395137 ) ) ( not ( = ?auto_1395135 ?auto_1395136 ) ) ( not ( = ?auto_1395135 ?auto_1395137 ) ) ( not ( = ?auto_1395142 ?auto_1395139 ) ) ( HOIST-AT ?auto_1395144 ?auto_1395142 ) ( not ( = ?auto_1395141 ?auto_1395144 ) ) ( SURFACE-AT ?auto_1395137 ?auto_1395142 ) ( ON ?auto_1395137 ?auto_1395140 ) ( CLEAR ?auto_1395137 ) ( not ( = ?auto_1395136 ?auto_1395140 ) ) ( not ( = ?auto_1395137 ?auto_1395140 ) ) ( not ( = ?auto_1395135 ?auto_1395140 ) ) ( SURFACE-AT ?auto_1395135 ?auto_1395139 ) ( CLEAR ?auto_1395135 ) ( IS-CRATE ?auto_1395136 ) ( AVAILABLE ?auto_1395141 ) ( TRUCK-AT ?auto_1395143 ?auto_1395142 ) ( AVAILABLE ?auto_1395144 ) ( SURFACE-AT ?auto_1395136 ?auto_1395142 ) ( ON ?auto_1395136 ?auto_1395138 ) ( CLEAR ?auto_1395136 ) ( not ( = ?auto_1395136 ?auto_1395138 ) ) ( not ( = ?auto_1395137 ?auto_1395138 ) ) ( not ( = ?auto_1395135 ?auto_1395138 ) ) ( not ( = ?auto_1395140 ?auto_1395138 ) ) ( ON ?auto_1395128 ?auto_1395127 ) ( ON ?auto_1395129 ?auto_1395128 ) ( ON ?auto_1395131 ?auto_1395129 ) ( ON ?auto_1395130 ?auto_1395131 ) ( ON ?auto_1395132 ?auto_1395130 ) ( ON ?auto_1395133 ?auto_1395132 ) ( ON ?auto_1395134 ?auto_1395133 ) ( ON ?auto_1395135 ?auto_1395134 ) ( not ( = ?auto_1395127 ?auto_1395128 ) ) ( not ( = ?auto_1395127 ?auto_1395129 ) ) ( not ( = ?auto_1395127 ?auto_1395131 ) ) ( not ( = ?auto_1395127 ?auto_1395130 ) ) ( not ( = ?auto_1395127 ?auto_1395132 ) ) ( not ( = ?auto_1395127 ?auto_1395133 ) ) ( not ( = ?auto_1395127 ?auto_1395134 ) ) ( not ( = ?auto_1395127 ?auto_1395135 ) ) ( not ( = ?auto_1395127 ?auto_1395136 ) ) ( not ( = ?auto_1395127 ?auto_1395137 ) ) ( not ( = ?auto_1395127 ?auto_1395140 ) ) ( not ( = ?auto_1395127 ?auto_1395138 ) ) ( not ( = ?auto_1395128 ?auto_1395129 ) ) ( not ( = ?auto_1395128 ?auto_1395131 ) ) ( not ( = ?auto_1395128 ?auto_1395130 ) ) ( not ( = ?auto_1395128 ?auto_1395132 ) ) ( not ( = ?auto_1395128 ?auto_1395133 ) ) ( not ( = ?auto_1395128 ?auto_1395134 ) ) ( not ( = ?auto_1395128 ?auto_1395135 ) ) ( not ( = ?auto_1395128 ?auto_1395136 ) ) ( not ( = ?auto_1395128 ?auto_1395137 ) ) ( not ( = ?auto_1395128 ?auto_1395140 ) ) ( not ( = ?auto_1395128 ?auto_1395138 ) ) ( not ( = ?auto_1395129 ?auto_1395131 ) ) ( not ( = ?auto_1395129 ?auto_1395130 ) ) ( not ( = ?auto_1395129 ?auto_1395132 ) ) ( not ( = ?auto_1395129 ?auto_1395133 ) ) ( not ( = ?auto_1395129 ?auto_1395134 ) ) ( not ( = ?auto_1395129 ?auto_1395135 ) ) ( not ( = ?auto_1395129 ?auto_1395136 ) ) ( not ( = ?auto_1395129 ?auto_1395137 ) ) ( not ( = ?auto_1395129 ?auto_1395140 ) ) ( not ( = ?auto_1395129 ?auto_1395138 ) ) ( not ( = ?auto_1395131 ?auto_1395130 ) ) ( not ( = ?auto_1395131 ?auto_1395132 ) ) ( not ( = ?auto_1395131 ?auto_1395133 ) ) ( not ( = ?auto_1395131 ?auto_1395134 ) ) ( not ( = ?auto_1395131 ?auto_1395135 ) ) ( not ( = ?auto_1395131 ?auto_1395136 ) ) ( not ( = ?auto_1395131 ?auto_1395137 ) ) ( not ( = ?auto_1395131 ?auto_1395140 ) ) ( not ( = ?auto_1395131 ?auto_1395138 ) ) ( not ( = ?auto_1395130 ?auto_1395132 ) ) ( not ( = ?auto_1395130 ?auto_1395133 ) ) ( not ( = ?auto_1395130 ?auto_1395134 ) ) ( not ( = ?auto_1395130 ?auto_1395135 ) ) ( not ( = ?auto_1395130 ?auto_1395136 ) ) ( not ( = ?auto_1395130 ?auto_1395137 ) ) ( not ( = ?auto_1395130 ?auto_1395140 ) ) ( not ( = ?auto_1395130 ?auto_1395138 ) ) ( not ( = ?auto_1395132 ?auto_1395133 ) ) ( not ( = ?auto_1395132 ?auto_1395134 ) ) ( not ( = ?auto_1395132 ?auto_1395135 ) ) ( not ( = ?auto_1395132 ?auto_1395136 ) ) ( not ( = ?auto_1395132 ?auto_1395137 ) ) ( not ( = ?auto_1395132 ?auto_1395140 ) ) ( not ( = ?auto_1395132 ?auto_1395138 ) ) ( not ( = ?auto_1395133 ?auto_1395134 ) ) ( not ( = ?auto_1395133 ?auto_1395135 ) ) ( not ( = ?auto_1395133 ?auto_1395136 ) ) ( not ( = ?auto_1395133 ?auto_1395137 ) ) ( not ( = ?auto_1395133 ?auto_1395140 ) ) ( not ( = ?auto_1395133 ?auto_1395138 ) ) ( not ( = ?auto_1395134 ?auto_1395135 ) ) ( not ( = ?auto_1395134 ?auto_1395136 ) ) ( not ( = ?auto_1395134 ?auto_1395137 ) ) ( not ( = ?auto_1395134 ?auto_1395140 ) ) ( not ( = ?auto_1395134 ?auto_1395138 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1395135 ?auto_1395136 ?auto_1395137 )
      ( MAKE-10CRATE-VERIFY ?auto_1395127 ?auto_1395128 ?auto_1395129 ?auto_1395131 ?auto_1395130 ?auto_1395132 ?auto_1395133 ?auto_1395134 ?auto_1395135 ?auto_1395136 ?auto_1395137 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1395145 - SURFACE
      ?auto_1395146 - SURFACE
      ?auto_1395147 - SURFACE
      ?auto_1395149 - SURFACE
      ?auto_1395148 - SURFACE
      ?auto_1395150 - SURFACE
      ?auto_1395151 - SURFACE
      ?auto_1395152 - SURFACE
      ?auto_1395153 - SURFACE
      ?auto_1395154 - SURFACE
      ?auto_1395155 - SURFACE
      ?auto_1395156 - SURFACE
    )
    :vars
    (
      ?auto_1395160 - HOIST
      ?auto_1395158 - PLACE
      ?auto_1395161 - PLACE
      ?auto_1395163 - HOIST
      ?auto_1395159 - SURFACE
      ?auto_1395162 - TRUCK
      ?auto_1395157 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395160 ?auto_1395158 ) ( IS-CRATE ?auto_1395156 ) ( not ( = ?auto_1395155 ?auto_1395156 ) ) ( not ( = ?auto_1395154 ?auto_1395155 ) ) ( not ( = ?auto_1395154 ?auto_1395156 ) ) ( not ( = ?auto_1395161 ?auto_1395158 ) ) ( HOIST-AT ?auto_1395163 ?auto_1395161 ) ( not ( = ?auto_1395160 ?auto_1395163 ) ) ( SURFACE-AT ?auto_1395156 ?auto_1395161 ) ( ON ?auto_1395156 ?auto_1395159 ) ( CLEAR ?auto_1395156 ) ( not ( = ?auto_1395155 ?auto_1395159 ) ) ( not ( = ?auto_1395156 ?auto_1395159 ) ) ( not ( = ?auto_1395154 ?auto_1395159 ) ) ( SURFACE-AT ?auto_1395154 ?auto_1395158 ) ( CLEAR ?auto_1395154 ) ( IS-CRATE ?auto_1395155 ) ( AVAILABLE ?auto_1395160 ) ( TRUCK-AT ?auto_1395162 ?auto_1395161 ) ( AVAILABLE ?auto_1395163 ) ( SURFACE-AT ?auto_1395155 ?auto_1395161 ) ( ON ?auto_1395155 ?auto_1395157 ) ( CLEAR ?auto_1395155 ) ( not ( = ?auto_1395155 ?auto_1395157 ) ) ( not ( = ?auto_1395156 ?auto_1395157 ) ) ( not ( = ?auto_1395154 ?auto_1395157 ) ) ( not ( = ?auto_1395159 ?auto_1395157 ) ) ( ON ?auto_1395146 ?auto_1395145 ) ( ON ?auto_1395147 ?auto_1395146 ) ( ON ?auto_1395149 ?auto_1395147 ) ( ON ?auto_1395148 ?auto_1395149 ) ( ON ?auto_1395150 ?auto_1395148 ) ( ON ?auto_1395151 ?auto_1395150 ) ( ON ?auto_1395152 ?auto_1395151 ) ( ON ?auto_1395153 ?auto_1395152 ) ( ON ?auto_1395154 ?auto_1395153 ) ( not ( = ?auto_1395145 ?auto_1395146 ) ) ( not ( = ?auto_1395145 ?auto_1395147 ) ) ( not ( = ?auto_1395145 ?auto_1395149 ) ) ( not ( = ?auto_1395145 ?auto_1395148 ) ) ( not ( = ?auto_1395145 ?auto_1395150 ) ) ( not ( = ?auto_1395145 ?auto_1395151 ) ) ( not ( = ?auto_1395145 ?auto_1395152 ) ) ( not ( = ?auto_1395145 ?auto_1395153 ) ) ( not ( = ?auto_1395145 ?auto_1395154 ) ) ( not ( = ?auto_1395145 ?auto_1395155 ) ) ( not ( = ?auto_1395145 ?auto_1395156 ) ) ( not ( = ?auto_1395145 ?auto_1395159 ) ) ( not ( = ?auto_1395145 ?auto_1395157 ) ) ( not ( = ?auto_1395146 ?auto_1395147 ) ) ( not ( = ?auto_1395146 ?auto_1395149 ) ) ( not ( = ?auto_1395146 ?auto_1395148 ) ) ( not ( = ?auto_1395146 ?auto_1395150 ) ) ( not ( = ?auto_1395146 ?auto_1395151 ) ) ( not ( = ?auto_1395146 ?auto_1395152 ) ) ( not ( = ?auto_1395146 ?auto_1395153 ) ) ( not ( = ?auto_1395146 ?auto_1395154 ) ) ( not ( = ?auto_1395146 ?auto_1395155 ) ) ( not ( = ?auto_1395146 ?auto_1395156 ) ) ( not ( = ?auto_1395146 ?auto_1395159 ) ) ( not ( = ?auto_1395146 ?auto_1395157 ) ) ( not ( = ?auto_1395147 ?auto_1395149 ) ) ( not ( = ?auto_1395147 ?auto_1395148 ) ) ( not ( = ?auto_1395147 ?auto_1395150 ) ) ( not ( = ?auto_1395147 ?auto_1395151 ) ) ( not ( = ?auto_1395147 ?auto_1395152 ) ) ( not ( = ?auto_1395147 ?auto_1395153 ) ) ( not ( = ?auto_1395147 ?auto_1395154 ) ) ( not ( = ?auto_1395147 ?auto_1395155 ) ) ( not ( = ?auto_1395147 ?auto_1395156 ) ) ( not ( = ?auto_1395147 ?auto_1395159 ) ) ( not ( = ?auto_1395147 ?auto_1395157 ) ) ( not ( = ?auto_1395149 ?auto_1395148 ) ) ( not ( = ?auto_1395149 ?auto_1395150 ) ) ( not ( = ?auto_1395149 ?auto_1395151 ) ) ( not ( = ?auto_1395149 ?auto_1395152 ) ) ( not ( = ?auto_1395149 ?auto_1395153 ) ) ( not ( = ?auto_1395149 ?auto_1395154 ) ) ( not ( = ?auto_1395149 ?auto_1395155 ) ) ( not ( = ?auto_1395149 ?auto_1395156 ) ) ( not ( = ?auto_1395149 ?auto_1395159 ) ) ( not ( = ?auto_1395149 ?auto_1395157 ) ) ( not ( = ?auto_1395148 ?auto_1395150 ) ) ( not ( = ?auto_1395148 ?auto_1395151 ) ) ( not ( = ?auto_1395148 ?auto_1395152 ) ) ( not ( = ?auto_1395148 ?auto_1395153 ) ) ( not ( = ?auto_1395148 ?auto_1395154 ) ) ( not ( = ?auto_1395148 ?auto_1395155 ) ) ( not ( = ?auto_1395148 ?auto_1395156 ) ) ( not ( = ?auto_1395148 ?auto_1395159 ) ) ( not ( = ?auto_1395148 ?auto_1395157 ) ) ( not ( = ?auto_1395150 ?auto_1395151 ) ) ( not ( = ?auto_1395150 ?auto_1395152 ) ) ( not ( = ?auto_1395150 ?auto_1395153 ) ) ( not ( = ?auto_1395150 ?auto_1395154 ) ) ( not ( = ?auto_1395150 ?auto_1395155 ) ) ( not ( = ?auto_1395150 ?auto_1395156 ) ) ( not ( = ?auto_1395150 ?auto_1395159 ) ) ( not ( = ?auto_1395150 ?auto_1395157 ) ) ( not ( = ?auto_1395151 ?auto_1395152 ) ) ( not ( = ?auto_1395151 ?auto_1395153 ) ) ( not ( = ?auto_1395151 ?auto_1395154 ) ) ( not ( = ?auto_1395151 ?auto_1395155 ) ) ( not ( = ?auto_1395151 ?auto_1395156 ) ) ( not ( = ?auto_1395151 ?auto_1395159 ) ) ( not ( = ?auto_1395151 ?auto_1395157 ) ) ( not ( = ?auto_1395152 ?auto_1395153 ) ) ( not ( = ?auto_1395152 ?auto_1395154 ) ) ( not ( = ?auto_1395152 ?auto_1395155 ) ) ( not ( = ?auto_1395152 ?auto_1395156 ) ) ( not ( = ?auto_1395152 ?auto_1395159 ) ) ( not ( = ?auto_1395152 ?auto_1395157 ) ) ( not ( = ?auto_1395153 ?auto_1395154 ) ) ( not ( = ?auto_1395153 ?auto_1395155 ) ) ( not ( = ?auto_1395153 ?auto_1395156 ) ) ( not ( = ?auto_1395153 ?auto_1395159 ) ) ( not ( = ?auto_1395153 ?auto_1395157 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1395154 ?auto_1395155 ?auto_1395156 )
      ( MAKE-11CRATE-VERIFY ?auto_1395145 ?auto_1395146 ?auto_1395147 ?auto_1395149 ?auto_1395148 ?auto_1395150 ?auto_1395151 ?auto_1395152 ?auto_1395153 ?auto_1395154 ?auto_1395155 ?auto_1395156 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1395164 - SURFACE
      ?auto_1395165 - SURFACE
      ?auto_1395166 - SURFACE
      ?auto_1395168 - SURFACE
      ?auto_1395167 - SURFACE
      ?auto_1395169 - SURFACE
      ?auto_1395170 - SURFACE
      ?auto_1395171 - SURFACE
      ?auto_1395172 - SURFACE
      ?auto_1395173 - SURFACE
      ?auto_1395174 - SURFACE
      ?auto_1395175 - SURFACE
      ?auto_1395176 - SURFACE
    )
    :vars
    (
      ?auto_1395180 - HOIST
      ?auto_1395178 - PLACE
      ?auto_1395181 - PLACE
      ?auto_1395183 - HOIST
      ?auto_1395179 - SURFACE
      ?auto_1395182 - TRUCK
      ?auto_1395177 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395180 ?auto_1395178 ) ( IS-CRATE ?auto_1395176 ) ( not ( = ?auto_1395175 ?auto_1395176 ) ) ( not ( = ?auto_1395174 ?auto_1395175 ) ) ( not ( = ?auto_1395174 ?auto_1395176 ) ) ( not ( = ?auto_1395181 ?auto_1395178 ) ) ( HOIST-AT ?auto_1395183 ?auto_1395181 ) ( not ( = ?auto_1395180 ?auto_1395183 ) ) ( SURFACE-AT ?auto_1395176 ?auto_1395181 ) ( ON ?auto_1395176 ?auto_1395179 ) ( CLEAR ?auto_1395176 ) ( not ( = ?auto_1395175 ?auto_1395179 ) ) ( not ( = ?auto_1395176 ?auto_1395179 ) ) ( not ( = ?auto_1395174 ?auto_1395179 ) ) ( SURFACE-AT ?auto_1395174 ?auto_1395178 ) ( CLEAR ?auto_1395174 ) ( IS-CRATE ?auto_1395175 ) ( AVAILABLE ?auto_1395180 ) ( TRUCK-AT ?auto_1395182 ?auto_1395181 ) ( AVAILABLE ?auto_1395183 ) ( SURFACE-AT ?auto_1395175 ?auto_1395181 ) ( ON ?auto_1395175 ?auto_1395177 ) ( CLEAR ?auto_1395175 ) ( not ( = ?auto_1395175 ?auto_1395177 ) ) ( not ( = ?auto_1395176 ?auto_1395177 ) ) ( not ( = ?auto_1395174 ?auto_1395177 ) ) ( not ( = ?auto_1395179 ?auto_1395177 ) ) ( ON ?auto_1395165 ?auto_1395164 ) ( ON ?auto_1395166 ?auto_1395165 ) ( ON ?auto_1395168 ?auto_1395166 ) ( ON ?auto_1395167 ?auto_1395168 ) ( ON ?auto_1395169 ?auto_1395167 ) ( ON ?auto_1395170 ?auto_1395169 ) ( ON ?auto_1395171 ?auto_1395170 ) ( ON ?auto_1395172 ?auto_1395171 ) ( ON ?auto_1395173 ?auto_1395172 ) ( ON ?auto_1395174 ?auto_1395173 ) ( not ( = ?auto_1395164 ?auto_1395165 ) ) ( not ( = ?auto_1395164 ?auto_1395166 ) ) ( not ( = ?auto_1395164 ?auto_1395168 ) ) ( not ( = ?auto_1395164 ?auto_1395167 ) ) ( not ( = ?auto_1395164 ?auto_1395169 ) ) ( not ( = ?auto_1395164 ?auto_1395170 ) ) ( not ( = ?auto_1395164 ?auto_1395171 ) ) ( not ( = ?auto_1395164 ?auto_1395172 ) ) ( not ( = ?auto_1395164 ?auto_1395173 ) ) ( not ( = ?auto_1395164 ?auto_1395174 ) ) ( not ( = ?auto_1395164 ?auto_1395175 ) ) ( not ( = ?auto_1395164 ?auto_1395176 ) ) ( not ( = ?auto_1395164 ?auto_1395179 ) ) ( not ( = ?auto_1395164 ?auto_1395177 ) ) ( not ( = ?auto_1395165 ?auto_1395166 ) ) ( not ( = ?auto_1395165 ?auto_1395168 ) ) ( not ( = ?auto_1395165 ?auto_1395167 ) ) ( not ( = ?auto_1395165 ?auto_1395169 ) ) ( not ( = ?auto_1395165 ?auto_1395170 ) ) ( not ( = ?auto_1395165 ?auto_1395171 ) ) ( not ( = ?auto_1395165 ?auto_1395172 ) ) ( not ( = ?auto_1395165 ?auto_1395173 ) ) ( not ( = ?auto_1395165 ?auto_1395174 ) ) ( not ( = ?auto_1395165 ?auto_1395175 ) ) ( not ( = ?auto_1395165 ?auto_1395176 ) ) ( not ( = ?auto_1395165 ?auto_1395179 ) ) ( not ( = ?auto_1395165 ?auto_1395177 ) ) ( not ( = ?auto_1395166 ?auto_1395168 ) ) ( not ( = ?auto_1395166 ?auto_1395167 ) ) ( not ( = ?auto_1395166 ?auto_1395169 ) ) ( not ( = ?auto_1395166 ?auto_1395170 ) ) ( not ( = ?auto_1395166 ?auto_1395171 ) ) ( not ( = ?auto_1395166 ?auto_1395172 ) ) ( not ( = ?auto_1395166 ?auto_1395173 ) ) ( not ( = ?auto_1395166 ?auto_1395174 ) ) ( not ( = ?auto_1395166 ?auto_1395175 ) ) ( not ( = ?auto_1395166 ?auto_1395176 ) ) ( not ( = ?auto_1395166 ?auto_1395179 ) ) ( not ( = ?auto_1395166 ?auto_1395177 ) ) ( not ( = ?auto_1395168 ?auto_1395167 ) ) ( not ( = ?auto_1395168 ?auto_1395169 ) ) ( not ( = ?auto_1395168 ?auto_1395170 ) ) ( not ( = ?auto_1395168 ?auto_1395171 ) ) ( not ( = ?auto_1395168 ?auto_1395172 ) ) ( not ( = ?auto_1395168 ?auto_1395173 ) ) ( not ( = ?auto_1395168 ?auto_1395174 ) ) ( not ( = ?auto_1395168 ?auto_1395175 ) ) ( not ( = ?auto_1395168 ?auto_1395176 ) ) ( not ( = ?auto_1395168 ?auto_1395179 ) ) ( not ( = ?auto_1395168 ?auto_1395177 ) ) ( not ( = ?auto_1395167 ?auto_1395169 ) ) ( not ( = ?auto_1395167 ?auto_1395170 ) ) ( not ( = ?auto_1395167 ?auto_1395171 ) ) ( not ( = ?auto_1395167 ?auto_1395172 ) ) ( not ( = ?auto_1395167 ?auto_1395173 ) ) ( not ( = ?auto_1395167 ?auto_1395174 ) ) ( not ( = ?auto_1395167 ?auto_1395175 ) ) ( not ( = ?auto_1395167 ?auto_1395176 ) ) ( not ( = ?auto_1395167 ?auto_1395179 ) ) ( not ( = ?auto_1395167 ?auto_1395177 ) ) ( not ( = ?auto_1395169 ?auto_1395170 ) ) ( not ( = ?auto_1395169 ?auto_1395171 ) ) ( not ( = ?auto_1395169 ?auto_1395172 ) ) ( not ( = ?auto_1395169 ?auto_1395173 ) ) ( not ( = ?auto_1395169 ?auto_1395174 ) ) ( not ( = ?auto_1395169 ?auto_1395175 ) ) ( not ( = ?auto_1395169 ?auto_1395176 ) ) ( not ( = ?auto_1395169 ?auto_1395179 ) ) ( not ( = ?auto_1395169 ?auto_1395177 ) ) ( not ( = ?auto_1395170 ?auto_1395171 ) ) ( not ( = ?auto_1395170 ?auto_1395172 ) ) ( not ( = ?auto_1395170 ?auto_1395173 ) ) ( not ( = ?auto_1395170 ?auto_1395174 ) ) ( not ( = ?auto_1395170 ?auto_1395175 ) ) ( not ( = ?auto_1395170 ?auto_1395176 ) ) ( not ( = ?auto_1395170 ?auto_1395179 ) ) ( not ( = ?auto_1395170 ?auto_1395177 ) ) ( not ( = ?auto_1395171 ?auto_1395172 ) ) ( not ( = ?auto_1395171 ?auto_1395173 ) ) ( not ( = ?auto_1395171 ?auto_1395174 ) ) ( not ( = ?auto_1395171 ?auto_1395175 ) ) ( not ( = ?auto_1395171 ?auto_1395176 ) ) ( not ( = ?auto_1395171 ?auto_1395179 ) ) ( not ( = ?auto_1395171 ?auto_1395177 ) ) ( not ( = ?auto_1395172 ?auto_1395173 ) ) ( not ( = ?auto_1395172 ?auto_1395174 ) ) ( not ( = ?auto_1395172 ?auto_1395175 ) ) ( not ( = ?auto_1395172 ?auto_1395176 ) ) ( not ( = ?auto_1395172 ?auto_1395179 ) ) ( not ( = ?auto_1395172 ?auto_1395177 ) ) ( not ( = ?auto_1395173 ?auto_1395174 ) ) ( not ( = ?auto_1395173 ?auto_1395175 ) ) ( not ( = ?auto_1395173 ?auto_1395176 ) ) ( not ( = ?auto_1395173 ?auto_1395179 ) ) ( not ( = ?auto_1395173 ?auto_1395177 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1395174 ?auto_1395175 ?auto_1395176 )
      ( MAKE-12CRATE-VERIFY ?auto_1395164 ?auto_1395165 ?auto_1395166 ?auto_1395168 ?auto_1395167 ?auto_1395169 ?auto_1395170 ?auto_1395171 ?auto_1395172 ?auto_1395173 ?auto_1395174 ?auto_1395175 ?auto_1395176 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1395184 - SURFACE
      ?auto_1395185 - SURFACE
      ?auto_1395186 - SURFACE
      ?auto_1395188 - SURFACE
      ?auto_1395187 - SURFACE
      ?auto_1395189 - SURFACE
      ?auto_1395190 - SURFACE
      ?auto_1395191 - SURFACE
      ?auto_1395192 - SURFACE
      ?auto_1395193 - SURFACE
      ?auto_1395194 - SURFACE
      ?auto_1395195 - SURFACE
      ?auto_1395196 - SURFACE
      ?auto_1395197 - SURFACE
    )
    :vars
    (
      ?auto_1395201 - HOIST
      ?auto_1395199 - PLACE
      ?auto_1395202 - PLACE
      ?auto_1395204 - HOIST
      ?auto_1395200 - SURFACE
      ?auto_1395203 - TRUCK
      ?auto_1395198 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395201 ?auto_1395199 ) ( IS-CRATE ?auto_1395197 ) ( not ( = ?auto_1395196 ?auto_1395197 ) ) ( not ( = ?auto_1395195 ?auto_1395196 ) ) ( not ( = ?auto_1395195 ?auto_1395197 ) ) ( not ( = ?auto_1395202 ?auto_1395199 ) ) ( HOIST-AT ?auto_1395204 ?auto_1395202 ) ( not ( = ?auto_1395201 ?auto_1395204 ) ) ( SURFACE-AT ?auto_1395197 ?auto_1395202 ) ( ON ?auto_1395197 ?auto_1395200 ) ( CLEAR ?auto_1395197 ) ( not ( = ?auto_1395196 ?auto_1395200 ) ) ( not ( = ?auto_1395197 ?auto_1395200 ) ) ( not ( = ?auto_1395195 ?auto_1395200 ) ) ( SURFACE-AT ?auto_1395195 ?auto_1395199 ) ( CLEAR ?auto_1395195 ) ( IS-CRATE ?auto_1395196 ) ( AVAILABLE ?auto_1395201 ) ( TRUCK-AT ?auto_1395203 ?auto_1395202 ) ( AVAILABLE ?auto_1395204 ) ( SURFACE-AT ?auto_1395196 ?auto_1395202 ) ( ON ?auto_1395196 ?auto_1395198 ) ( CLEAR ?auto_1395196 ) ( not ( = ?auto_1395196 ?auto_1395198 ) ) ( not ( = ?auto_1395197 ?auto_1395198 ) ) ( not ( = ?auto_1395195 ?auto_1395198 ) ) ( not ( = ?auto_1395200 ?auto_1395198 ) ) ( ON ?auto_1395185 ?auto_1395184 ) ( ON ?auto_1395186 ?auto_1395185 ) ( ON ?auto_1395188 ?auto_1395186 ) ( ON ?auto_1395187 ?auto_1395188 ) ( ON ?auto_1395189 ?auto_1395187 ) ( ON ?auto_1395190 ?auto_1395189 ) ( ON ?auto_1395191 ?auto_1395190 ) ( ON ?auto_1395192 ?auto_1395191 ) ( ON ?auto_1395193 ?auto_1395192 ) ( ON ?auto_1395194 ?auto_1395193 ) ( ON ?auto_1395195 ?auto_1395194 ) ( not ( = ?auto_1395184 ?auto_1395185 ) ) ( not ( = ?auto_1395184 ?auto_1395186 ) ) ( not ( = ?auto_1395184 ?auto_1395188 ) ) ( not ( = ?auto_1395184 ?auto_1395187 ) ) ( not ( = ?auto_1395184 ?auto_1395189 ) ) ( not ( = ?auto_1395184 ?auto_1395190 ) ) ( not ( = ?auto_1395184 ?auto_1395191 ) ) ( not ( = ?auto_1395184 ?auto_1395192 ) ) ( not ( = ?auto_1395184 ?auto_1395193 ) ) ( not ( = ?auto_1395184 ?auto_1395194 ) ) ( not ( = ?auto_1395184 ?auto_1395195 ) ) ( not ( = ?auto_1395184 ?auto_1395196 ) ) ( not ( = ?auto_1395184 ?auto_1395197 ) ) ( not ( = ?auto_1395184 ?auto_1395200 ) ) ( not ( = ?auto_1395184 ?auto_1395198 ) ) ( not ( = ?auto_1395185 ?auto_1395186 ) ) ( not ( = ?auto_1395185 ?auto_1395188 ) ) ( not ( = ?auto_1395185 ?auto_1395187 ) ) ( not ( = ?auto_1395185 ?auto_1395189 ) ) ( not ( = ?auto_1395185 ?auto_1395190 ) ) ( not ( = ?auto_1395185 ?auto_1395191 ) ) ( not ( = ?auto_1395185 ?auto_1395192 ) ) ( not ( = ?auto_1395185 ?auto_1395193 ) ) ( not ( = ?auto_1395185 ?auto_1395194 ) ) ( not ( = ?auto_1395185 ?auto_1395195 ) ) ( not ( = ?auto_1395185 ?auto_1395196 ) ) ( not ( = ?auto_1395185 ?auto_1395197 ) ) ( not ( = ?auto_1395185 ?auto_1395200 ) ) ( not ( = ?auto_1395185 ?auto_1395198 ) ) ( not ( = ?auto_1395186 ?auto_1395188 ) ) ( not ( = ?auto_1395186 ?auto_1395187 ) ) ( not ( = ?auto_1395186 ?auto_1395189 ) ) ( not ( = ?auto_1395186 ?auto_1395190 ) ) ( not ( = ?auto_1395186 ?auto_1395191 ) ) ( not ( = ?auto_1395186 ?auto_1395192 ) ) ( not ( = ?auto_1395186 ?auto_1395193 ) ) ( not ( = ?auto_1395186 ?auto_1395194 ) ) ( not ( = ?auto_1395186 ?auto_1395195 ) ) ( not ( = ?auto_1395186 ?auto_1395196 ) ) ( not ( = ?auto_1395186 ?auto_1395197 ) ) ( not ( = ?auto_1395186 ?auto_1395200 ) ) ( not ( = ?auto_1395186 ?auto_1395198 ) ) ( not ( = ?auto_1395188 ?auto_1395187 ) ) ( not ( = ?auto_1395188 ?auto_1395189 ) ) ( not ( = ?auto_1395188 ?auto_1395190 ) ) ( not ( = ?auto_1395188 ?auto_1395191 ) ) ( not ( = ?auto_1395188 ?auto_1395192 ) ) ( not ( = ?auto_1395188 ?auto_1395193 ) ) ( not ( = ?auto_1395188 ?auto_1395194 ) ) ( not ( = ?auto_1395188 ?auto_1395195 ) ) ( not ( = ?auto_1395188 ?auto_1395196 ) ) ( not ( = ?auto_1395188 ?auto_1395197 ) ) ( not ( = ?auto_1395188 ?auto_1395200 ) ) ( not ( = ?auto_1395188 ?auto_1395198 ) ) ( not ( = ?auto_1395187 ?auto_1395189 ) ) ( not ( = ?auto_1395187 ?auto_1395190 ) ) ( not ( = ?auto_1395187 ?auto_1395191 ) ) ( not ( = ?auto_1395187 ?auto_1395192 ) ) ( not ( = ?auto_1395187 ?auto_1395193 ) ) ( not ( = ?auto_1395187 ?auto_1395194 ) ) ( not ( = ?auto_1395187 ?auto_1395195 ) ) ( not ( = ?auto_1395187 ?auto_1395196 ) ) ( not ( = ?auto_1395187 ?auto_1395197 ) ) ( not ( = ?auto_1395187 ?auto_1395200 ) ) ( not ( = ?auto_1395187 ?auto_1395198 ) ) ( not ( = ?auto_1395189 ?auto_1395190 ) ) ( not ( = ?auto_1395189 ?auto_1395191 ) ) ( not ( = ?auto_1395189 ?auto_1395192 ) ) ( not ( = ?auto_1395189 ?auto_1395193 ) ) ( not ( = ?auto_1395189 ?auto_1395194 ) ) ( not ( = ?auto_1395189 ?auto_1395195 ) ) ( not ( = ?auto_1395189 ?auto_1395196 ) ) ( not ( = ?auto_1395189 ?auto_1395197 ) ) ( not ( = ?auto_1395189 ?auto_1395200 ) ) ( not ( = ?auto_1395189 ?auto_1395198 ) ) ( not ( = ?auto_1395190 ?auto_1395191 ) ) ( not ( = ?auto_1395190 ?auto_1395192 ) ) ( not ( = ?auto_1395190 ?auto_1395193 ) ) ( not ( = ?auto_1395190 ?auto_1395194 ) ) ( not ( = ?auto_1395190 ?auto_1395195 ) ) ( not ( = ?auto_1395190 ?auto_1395196 ) ) ( not ( = ?auto_1395190 ?auto_1395197 ) ) ( not ( = ?auto_1395190 ?auto_1395200 ) ) ( not ( = ?auto_1395190 ?auto_1395198 ) ) ( not ( = ?auto_1395191 ?auto_1395192 ) ) ( not ( = ?auto_1395191 ?auto_1395193 ) ) ( not ( = ?auto_1395191 ?auto_1395194 ) ) ( not ( = ?auto_1395191 ?auto_1395195 ) ) ( not ( = ?auto_1395191 ?auto_1395196 ) ) ( not ( = ?auto_1395191 ?auto_1395197 ) ) ( not ( = ?auto_1395191 ?auto_1395200 ) ) ( not ( = ?auto_1395191 ?auto_1395198 ) ) ( not ( = ?auto_1395192 ?auto_1395193 ) ) ( not ( = ?auto_1395192 ?auto_1395194 ) ) ( not ( = ?auto_1395192 ?auto_1395195 ) ) ( not ( = ?auto_1395192 ?auto_1395196 ) ) ( not ( = ?auto_1395192 ?auto_1395197 ) ) ( not ( = ?auto_1395192 ?auto_1395200 ) ) ( not ( = ?auto_1395192 ?auto_1395198 ) ) ( not ( = ?auto_1395193 ?auto_1395194 ) ) ( not ( = ?auto_1395193 ?auto_1395195 ) ) ( not ( = ?auto_1395193 ?auto_1395196 ) ) ( not ( = ?auto_1395193 ?auto_1395197 ) ) ( not ( = ?auto_1395193 ?auto_1395200 ) ) ( not ( = ?auto_1395193 ?auto_1395198 ) ) ( not ( = ?auto_1395194 ?auto_1395195 ) ) ( not ( = ?auto_1395194 ?auto_1395196 ) ) ( not ( = ?auto_1395194 ?auto_1395197 ) ) ( not ( = ?auto_1395194 ?auto_1395200 ) ) ( not ( = ?auto_1395194 ?auto_1395198 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1395195 ?auto_1395196 ?auto_1395197 )
      ( MAKE-13CRATE-VERIFY ?auto_1395184 ?auto_1395185 ?auto_1395186 ?auto_1395188 ?auto_1395187 ?auto_1395189 ?auto_1395190 ?auto_1395191 ?auto_1395192 ?auto_1395193 ?auto_1395194 ?auto_1395195 ?auto_1395196 ?auto_1395197 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1395306 - SURFACE
      ?auto_1395307 - SURFACE
      ?auto_1395308 - SURFACE
      ?auto_1395310 - SURFACE
      ?auto_1395309 - SURFACE
      ?auto_1395311 - SURFACE
      ?auto_1395312 - SURFACE
      ?auto_1395313 - SURFACE
      ?auto_1395314 - SURFACE
      ?auto_1395315 - SURFACE
    )
    :vars
    (
      ?auto_1395320 - HOIST
      ?auto_1395318 - PLACE
      ?auto_1395319 - PLACE
      ?auto_1395317 - HOIST
      ?auto_1395322 - SURFACE
      ?auto_1395316 - SURFACE
      ?auto_1395321 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395320 ?auto_1395318 ) ( IS-CRATE ?auto_1395315 ) ( not ( = ?auto_1395314 ?auto_1395315 ) ) ( not ( = ?auto_1395313 ?auto_1395314 ) ) ( not ( = ?auto_1395313 ?auto_1395315 ) ) ( not ( = ?auto_1395319 ?auto_1395318 ) ) ( HOIST-AT ?auto_1395317 ?auto_1395319 ) ( not ( = ?auto_1395320 ?auto_1395317 ) ) ( SURFACE-AT ?auto_1395315 ?auto_1395319 ) ( ON ?auto_1395315 ?auto_1395322 ) ( CLEAR ?auto_1395315 ) ( not ( = ?auto_1395314 ?auto_1395322 ) ) ( not ( = ?auto_1395315 ?auto_1395322 ) ) ( not ( = ?auto_1395313 ?auto_1395322 ) ) ( SURFACE-AT ?auto_1395313 ?auto_1395318 ) ( CLEAR ?auto_1395313 ) ( IS-CRATE ?auto_1395314 ) ( AVAILABLE ?auto_1395320 ) ( AVAILABLE ?auto_1395317 ) ( SURFACE-AT ?auto_1395314 ?auto_1395319 ) ( ON ?auto_1395314 ?auto_1395316 ) ( CLEAR ?auto_1395314 ) ( not ( = ?auto_1395314 ?auto_1395316 ) ) ( not ( = ?auto_1395315 ?auto_1395316 ) ) ( not ( = ?auto_1395313 ?auto_1395316 ) ) ( not ( = ?auto_1395322 ?auto_1395316 ) ) ( TRUCK-AT ?auto_1395321 ?auto_1395318 ) ( ON ?auto_1395307 ?auto_1395306 ) ( ON ?auto_1395308 ?auto_1395307 ) ( ON ?auto_1395310 ?auto_1395308 ) ( ON ?auto_1395309 ?auto_1395310 ) ( ON ?auto_1395311 ?auto_1395309 ) ( ON ?auto_1395312 ?auto_1395311 ) ( ON ?auto_1395313 ?auto_1395312 ) ( not ( = ?auto_1395306 ?auto_1395307 ) ) ( not ( = ?auto_1395306 ?auto_1395308 ) ) ( not ( = ?auto_1395306 ?auto_1395310 ) ) ( not ( = ?auto_1395306 ?auto_1395309 ) ) ( not ( = ?auto_1395306 ?auto_1395311 ) ) ( not ( = ?auto_1395306 ?auto_1395312 ) ) ( not ( = ?auto_1395306 ?auto_1395313 ) ) ( not ( = ?auto_1395306 ?auto_1395314 ) ) ( not ( = ?auto_1395306 ?auto_1395315 ) ) ( not ( = ?auto_1395306 ?auto_1395322 ) ) ( not ( = ?auto_1395306 ?auto_1395316 ) ) ( not ( = ?auto_1395307 ?auto_1395308 ) ) ( not ( = ?auto_1395307 ?auto_1395310 ) ) ( not ( = ?auto_1395307 ?auto_1395309 ) ) ( not ( = ?auto_1395307 ?auto_1395311 ) ) ( not ( = ?auto_1395307 ?auto_1395312 ) ) ( not ( = ?auto_1395307 ?auto_1395313 ) ) ( not ( = ?auto_1395307 ?auto_1395314 ) ) ( not ( = ?auto_1395307 ?auto_1395315 ) ) ( not ( = ?auto_1395307 ?auto_1395322 ) ) ( not ( = ?auto_1395307 ?auto_1395316 ) ) ( not ( = ?auto_1395308 ?auto_1395310 ) ) ( not ( = ?auto_1395308 ?auto_1395309 ) ) ( not ( = ?auto_1395308 ?auto_1395311 ) ) ( not ( = ?auto_1395308 ?auto_1395312 ) ) ( not ( = ?auto_1395308 ?auto_1395313 ) ) ( not ( = ?auto_1395308 ?auto_1395314 ) ) ( not ( = ?auto_1395308 ?auto_1395315 ) ) ( not ( = ?auto_1395308 ?auto_1395322 ) ) ( not ( = ?auto_1395308 ?auto_1395316 ) ) ( not ( = ?auto_1395310 ?auto_1395309 ) ) ( not ( = ?auto_1395310 ?auto_1395311 ) ) ( not ( = ?auto_1395310 ?auto_1395312 ) ) ( not ( = ?auto_1395310 ?auto_1395313 ) ) ( not ( = ?auto_1395310 ?auto_1395314 ) ) ( not ( = ?auto_1395310 ?auto_1395315 ) ) ( not ( = ?auto_1395310 ?auto_1395322 ) ) ( not ( = ?auto_1395310 ?auto_1395316 ) ) ( not ( = ?auto_1395309 ?auto_1395311 ) ) ( not ( = ?auto_1395309 ?auto_1395312 ) ) ( not ( = ?auto_1395309 ?auto_1395313 ) ) ( not ( = ?auto_1395309 ?auto_1395314 ) ) ( not ( = ?auto_1395309 ?auto_1395315 ) ) ( not ( = ?auto_1395309 ?auto_1395322 ) ) ( not ( = ?auto_1395309 ?auto_1395316 ) ) ( not ( = ?auto_1395311 ?auto_1395312 ) ) ( not ( = ?auto_1395311 ?auto_1395313 ) ) ( not ( = ?auto_1395311 ?auto_1395314 ) ) ( not ( = ?auto_1395311 ?auto_1395315 ) ) ( not ( = ?auto_1395311 ?auto_1395322 ) ) ( not ( = ?auto_1395311 ?auto_1395316 ) ) ( not ( = ?auto_1395312 ?auto_1395313 ) ) ( not ( = ?auto_1395312 ?auto_1395314 ) ) ( not ( = ?auto_1395312 ?auto_1395315 ) ) ( not ( = ?auto_1395312 ?auto_1395322 ) ) ( not ( = ?auto_1395312 ?auto_1395316 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1395313 ?auto_1395314 ?auto_1395315 )
      ( MAKE-9CRATE-VERIFY ?auto_1395306 ?auto_1395307 ?auto_1395308 ?auto_1395310 ?auto_1395309 ?auto_1395311 ?auto_1395312 ?auto_1395313 ?auto_1395314 ?auto_1395315 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1395323 - SURFACE
      ?auto_1395324 - SURFACE
      ?auto_1395325 - SURFACE
      ?auto_1395327 - SURFACE
      ?auto_1395326 - SURFACE
      ?auto_1395328 - SURFACE
      ?auto_1395329 - SURFACE
      ?auto_1395330 - SURFACE
      ?auto_1395331 - SURFACE
      ?auto_1395332 - SURFACE
      ?auto_1395333 - SURFACE
    )
    :vars
    (
      ?auto_1395338 - HOIST
      ?auto_1395336 - PLACE
      ?auto_1395337 - PLACE
      ?auto_1395335 - HOIST
      ?auto_1395340 - SURFACE
      ?auto_1395334 - SURFACE
      ?auto_1395339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395338 ?auto_1395336 ) ( IS-CRATE ?auto_1395333 ) ( not ( = ?auto_1395332 ?auto_1395333 ) ) ( not ( = ?auto_1395331 ?auto_1395332 ) ) ( not ( = ?auto_1395331 ?auto_1395333 ) ) ( not ( = ?auto_1395337 ?auto_1395336 ) ) ( HOIST-AT ?auto_1395335 ?auto_1395337 ) ( not ( = ?auto_1395338 ?auto_1395335 ) ) ( SURFACE-AT ?auto_1395333 ?auto_1395337 ) ( ON ?auto_1395333 ?auto_1395340 ) ( CLEAR ?auto_1395333 ) ( not ( = ?auto_1395332 ?auto_1395340 ) ) ( not ( = ?auto_1395333 ?auto_1395340 ) ) ( not ( = ?auto_1395331 ?auto_1395340 ) ) ( SURFACE-AT ?auto_1395331 ?auto_1395336 ) ( CLEAR ?auto_1395331 ) ( IS-CRATE ?auto_1395332 ) ( AVAILABLE ?auto_1395338 ) ( AVAILABLE ?auto_1395335 ) ( SURFACE-AT ?auto_1395332 ?auto_1395337 ) ( ON ?auto_1395332 ?auto_1395334 ) ( CLEAR ?auto_1395332 ) ( not ( = ?auto_1395332 ?auto_1395334 ) ) ( not ( = ?auto_1395333 ?auto_1395334 ) ) ( not ( = ?auto_1395331 ?auto_1395334 ) ) ( not ( = ?auto_1395340 ?auto_1395334 ) ) ( TRUCK-AT ?auto_1395339 ?auto_1395336 ) ( ON ?auto_1395324 ?auto_1395323 ) ( ON ?auto_1395325 ?auto_1395324 ) ( ON ?auto_1395327 ?auto_1395325 ) ( ON ?auto_1395326 ?auto_1395327 ) ( ON ?auto_1395328 ?auto_1395326 ) ( ON ?auto_1395329 ?auto_1395328 ) ( ON ?auto_1395330 ?auto_1395329 ) ( ON ?auto_1395331 ?auto_1395330 ) ( not ( = ?auto_1395323 ?auto_1395324 ) ) ( not ( = ?auto_1395323 ?auto_1395325 ) ) ( not ( = ?auto_1395323 ?auto_1395327 ) ) ( not ( = ?auto_1395323 ?auto_1395326 ) ) ( not ( = ?auto_1395323 ?auto_1395328 ) ) ( not ( = ?auto_1395323 ?auto_1395329 ) ) ( not ( = ?auto_1395323 ?auto_1395330 ) ) ( not ( = ?auto_1395323 ?auto_1395331 ) ) ( not ( = ?auto_1395323 ?auto_1395332 ) ) ( not ( = ?auto_1395323 ?auto_1395333 ) ) ( not ( = ?auto_1395323 ?auto_1395340 ) ) ( not ( = ?auto_1395323 ?auto_1395334 ) ) ( not ( = ?auto_1395324 ?auto_1395325 ) ) ( not ( = ?auto_1395324 ?auto_1395327 ) ) ( not ( = ?auto_1395324 ?auto_1395326 ) ) ( not ( = ?auto_1395324 ?auto_1395328 ) ) ( not ( = ?auto_1395324 ?auto_1395329 ) ) ( not ( = ?auto_1395324 ?auto_1395330 ) ) ( not ( = ?auto_1395324 ?auto_1395331 ) ) ( not ( = ?auto_1395324 ?auto_1395332 ) ) ( not ( = ?auto_1395324 ?auto_1395333 ) ) ( not ( = ?auto_1395324 ?auto_1395340 ) ) ( not ( = ?auto_1395324 ?auto_1395334 ) ) ( not ( = ?auto_1395325 ?auto_1395327 ) ) ( not ( = ?auto_1395325 ?auto_1395326 ) ) ( not ( = ?auto_1395325 ?auto_1395328 ) ) ( not ( = ?auto_1395325 ?auto_1395329 ) ) ( not ( = ?auto_1395325 ?auto_1395330 ) ) ( not ( = ?auto_1395325 ?auto_1395331 ) ) ( not ( = ?auto_1395325 ?auto_1395332 ) ) ( not ( = ?auto_1395325 ?auto_1395333 ) ) ( not ( = ?auto_1395325 ?auto_1395340 ) ) ( not ( = ?auto_1395325 ?auto_1395334 ) ) ( not ( = ?auto_1395327 ?auto_1395326 ) ) ( not ( = ?auto_1395327 ?auto_1395328 ) ) ( not ( = ?auto_1395327 ?auto_1395329 ) ) ( not ( = ?auto_1395327 ?auto_1395330 ) ) ( not ( = ?auto_1395327 ?auto_1395331 ) ) ( not ( = ?auto_1395327 ?auto_1395332 ) ) ( not ( = ?auto_1395327 ?auto_1395333 ) ) ( not ( = ?auto_1395327 ?auto_1395340 ) ) ( not ( = ?auto_1395327 ?auto_1395334 ) ) ( not ( = ?auto_1395326 ?auto_1395328 ) ) ( not ( = ?auto_1395326 ?auto_1395329 ) ) ( not ( = ?auto_1395326 ?auto_1395330 ) ) ( not ( = ?auto_1395326 ?auto_1395331 ) ) ( not ( = ?auto_1395326 ?auto_1395332 ) ) ( not ( = ?auto_1395326 ?auto_1395333 ) ) ( not ( = ?auto_1395326 ?auto_1395340 ) ) ( not ( = ?auto_1395326 ?auto_1395334 ) ) ( not ( = ?auto_1395328 ?auto_1395329 ) ) ( not ( = ?auto_1395328 ?auto_1395330 ) ) ( not ( = ?auto_1395328 ?auto_1395331 ) ) ( not ( = ?auto_1395328 ?auto_1395332 ) ) ( not ( = ?auto_1395328 ?auto_1395333 ) ) ( not ( = ?auto_1395328 ?auto_1395340 ) ) ( not ( = ?auto_1395328 ?auto_1395334 ) ) ( not ( = ?auto_1395329 ?auto_1395330 ) ) ( not ( = ?auto_1395329 ?auto_1395331 ) ) ( not ( = ?auto_1395329 ?auto_1395332 ) ) ( not ( = ?auto_1395329 ?auto_1395333 ) ) ( not ( = ?auto_1395329 ?auto_1395340 ) ) ( not ( = ?auto_1395329 ?auto_1395334 ) ) ( not ( = ?auto_1395330 ?auto_1395331 ) ) ( not ( = ?auto_1395330 ?auto_1395332 ) ) ( not ( = ?auto_1395330 ?auto_1395333 ) ) ( not ( = ?auto_1395330 ?auto_1395340 ) ) ( not ( = ?auto_1395330 ?auto_1395334 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1395331 ?auto_1395332 ?auto_1395333 )
      ( MAKE-10CRATE-VERIFY ?auto_1395323 ?auto_1395324 ?auto_1395325 ?auto_1395327 ?auto_1395326 ?auto_1395328 ?auto_1395329 ?auto_1395330 ?auto_1395331 ?auto_1395332 ?auto_1395333 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1395341 - SURFACE
      ?auto_1395342 - SURFACE
      ?auto_1395343 - SURFACE
      ?auto_1395345 - SURFACE
      ?auto_1395344 - SURFACE
      ?auto_1395346 - SURFACE
      ?auto_1395347 - SURFACE
      ?auto_1395348 - SURFACE
      ?auto_1395349 - SURFACE
      ?auto_1395350 - SURFACE
      ?auto_1395351 - SURFACE
      ?auto_1395352 - SURFACE
    )
    :vars
    (
      ?auto_1395357 - HOIST
      ?auto_1395355 - PLACE
      ?auto_1395356 - PLACE
      ?auto_1395354 - HOIST
      ?auto_1395359 - SURFACE
      ?auto_1395353 - SURFACE
      ?auto_1395358 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395357 ?auto_1395355 ) ( IS-CRATE ?auto_1395352 ) ( not ( = ?auto_1395351 ?auto_1395352 ) ) ( not ( = ?auto_1395350 ?auto_1395351 ) ) ( not ( = ?auto_1395350 ?auto_1395352 ) ) ( not ( = ?auto_1395356 ?auto_1395355 ) ) ( HOIST-AT ?auto_1395354 ?auto_1395356 ) ( not ( = ?auto_1395357 ?auto_1395354 ) ) ( SURFACE-AT ?auto_1395352 ?auto_1395356 ) ( ON ?auto_1395352 ?auto_1395359 ) ( CLEAR ?auto_1395352 ) ( not ( = ?auto_1395351 ?auto_1395359 ) ) ( not ( = ?auto_1395352 ?auto_1395359 ) ) ( not ( = ?auto_1395350 ?auto_1395359 ) ) ( SURFACE-AT ?auto_1395350 ?auto_1395355 ) ( CLEAR ?auto_1395350 ) ( IS-CRATE ?auto_1395351 ) ( AVAILABLE ?auto_1395357 ) ( AVAILABLE ?auto_1395354 ) ( SURFACE-AT ?auto_1395351 ?auto_1395356 ) ( ON ?auto_1395351 ?auto_1395353 ) ( CLEAR ?auto_1395351 ) ( not ( = ?auto_1395351 ?auto_1395353 ) ) ( not ( = ?auto_1395352 ?auto_1395353 ) ) ( not ( = ?auto_1395350 ?auto_1395353 ) ) ( not ( = ?auto_1395359 ?auto_1395353 ) ) ( TRUCK-AT ?auto_1395358 ?auto_1395355 ) ( ON ?auto_1395342 ?auto_1395341 ) ( ON ?auto_1395343 ?auto_1395342 ) ( ON ?auto_1395345 ?auto_1395343 ) ( ON ?auto_1395344 ?auto_1395345 ) ( ON ?auto_1395346 ?auto_1395344 ) ( ON ?auto_1395347 ?auto_1395346 ) ( ON ?auto_1395348 ?auto_1395347 ) ( ON ?auto_1395349 ?auto_1395348 ) ( ON ?auto_1395350 ?auto_1395349 ) ( not ( = ?auto_1395341 ?auto_1395342 ) ) ( not ( = ?auto_1395341 ?auto_1395343 ) ) ( not ( = ?auto_1395341 ?auto_1395345 ) ) ( not ( = ?auto_1395341 ?auto_1395344 ) ) ( not ( = ?auto_1395341 ?auto_1395346 ) ) ( not ( = ?auto_1395341 ?auto_1395347 ) ) ( not ( = ?auto_1395341 ?auto_1395348 ) ) ( not ( = ?auto_1395341 ?auto_1395349 ) ) ( not ( = ?auto_1395341 ?auto_1395350 ) ) ( not ( = ?auto_1395341 ?auto_1395351 ) ) ( not ( = ?auto_1395341 ?auto_1395352 ) ) ( not ( = ?auto_1395341 ?auto_1395359 ) ) ( not ( = ?auto_1395341 ?auto_1395353 ) ) ( not ( = ?auto_1395342 ?auto_1395343 ) ) ( not ( = ?auto_1395342 ?auto_1395345 ) ) ( not ( = ?auto_1395342 ?auto_1395344 ) ) ( not ( = ?auto_1395342 ?auto_1395346 ) ) ( not ( = ?auto_1395342 ?auto_1395347 ) ) ( not ( = ?auto_1395342 ?auto_1395348 ) ) ( not ( = ?auto_1395342 ?auto_1395349 ) ) ( not ( = ?auto_1395342 ?auto_1395350 ) ) ( not ( = ?auto_1395342 ?auto_1395351 ) ) ( not ( = ?auto_1395342 ?auto_1395352 ) ) ( not ( = ?auto_1395342 ?auto_1395359 ) ) ( not ( = ?auto_1395342 ?auto_1395353 ) ) ( not ( = ?auto_1395343 ?auto_1395345 ) ) ( not ( = ?auto_1395343 ?auto_1395344 ) ) ( not ( = ?auto_1395343 ?auto_1395346 ) ) ( not ( = ?auto_1395343 ?auto_1395347 ) ) ( not ( = ?auto_1395343 ?auto_1395348 ) ) ( not ( = ?auto_1395343 ?auto_1395349 ) ) ( not ( = ?auto_1395343 ?auto_1395350 ) ) ( not ( = ?auto_1395343 ?auto_1395351 ) ) ( not ( = ?auto_1395343 ?auto_1395352 ) ) ( not ( = ?auto_1395343 ?auto_1395359 ) ) ( not ( = ?auto_1395343 ?auto_1395353 ) ) ( not ( = ?auto_1395345 ?auto_1395344 ) ) ( not ( = ?auto_1395345 ?auto_1395346 ) ) ( not ( = ?auto_1395345 ?auto_1395347 ) ) ( not ( = ?auto_1395345 ?auto_1395348 ) ) ( not ( = ?auto_1395345 ?auto_1395349 ) ) ( not ( = ?auto_1395345 ?auto_1395350 ) ) ( not ( = ?auto_1395345 ?auto_1395351 ) ) ( not ( = ?auto_1395345 ?auto_1395352 ) ) ( not ( = ?auto_1395345 ?auto_1395359 ) ) ( not ( = ?auto_1395345 ?auto_1395353 ) ) ( not ( = ?auto_1395344 ?auto_1395346 ) ) ( not ( = ?auto_1395344 ?auto_1395347 ) ) ( not ( = ?auto_1395344 ?auto_1395348 ) ) ( not ( = ?auto_1395344 ?auto_1395349 ) ) ( not ( = ?auto_1395344 ?auto_1395350 ) ) ( not ( = ?auto_1395344 ?auto_1395351 ) ) ( not ( = ?auto_1395344 ?auto_1395352 ) ) ( not ( = ?auto_1395344 ?auto_1395359 ) ) ( not ( = ?auto_1395344 ?auto_1395353 ) ) ( not ( = ?auto_1395346 ?auto_1395347 ) ) ( not ( = ?auto_1395346 ?auto_1395348 ) ) ( not ( = ?auto_1395346 ?auto_1395349 ) ) ( not ( = ?auto_1395346 ?auto_1395350 ) ) ( not ( = ?auto_1395346 ?auto_1395351 ) ) ( not ( = ?auto_1395346 ?auto_1395352 ) ) ( not ( = ?auto_1395346 ?auto_1395359 ) ) ( not ( = ?auto_1395346 ?auto_1395353 ) ) ( not ( = ?auto_1395347 ?auto_1395348 ) ) ( not ( = ?auto_1395347 ?auto_1395349 ) ) ( not ( = ?auto_1395347 ?auto_1395350 ) ) ( not ( = ?auto_1395347 ?auto_1395351 ) ) ( not ( = ?auto_1395347 ?auto_1395352 ) ) ( not ( = ?auto_1395347 ?auto_1395359 ) ) ( not ( = ?auto_1395347 ?auto_1395353 ) ) ( not ( = ?auto_1395348 ?auto_1395349 ) ) ( not ( = ?auto_1395348 ?auto_1395350 ) ) ( not ( = ?auto_1395348 ?auto_1395351 ) ) ( not ( = ?auto_1395348 ?auto_1395352 ) ) ( not ( = ?auto_1395348 ?auto_1395359 ) ) ( not ( = ?auto_1395348 ?auto_1395353 ) ) ( not ( = ?auto_1395349 ?auto_1395350 ) ) ( not ( = ?auto_1395349 ?auto_1395351 ) ) ( not ( = ?auto_1395349 ?auto_1395352 ) ) ( not ( = ?auto_1395349 ?auto_1395359 ) ) ( not ( = ?auto_1395349 ?auto_1395353 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1395350 ?auto_1395351 ?auto_1395352 )
      ( MAKE-11CRATE-VERIFY ?auto_1395341 ?auto_1395342 ?auto_1395343 ?auto_1395345 ?auto_1395344 ?auto_1395346 ?auto_1395347 ?auto_1395348 ?auto_1395349 ?auto_1395350 ?auto_1395351 ?auto_1395352 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1395360 - SURFACE
      ?auto_1395361 - SURFACE
      ?auto_1395362 - SURFACE
      ?auto_1395364 - SURFACE
      ?auto_1395363 - SURFACE
      ?auto_1395365 - SURFACE
      ?auto_1395366 - SURFACE
      ?auto_1395367 - SURFACE
      ?auto_1395368 - SURFACE
      ?auto_1395369 - SURFACE
      ?auto_1395370 - SURFACE
      ?auto_1395371 - SURFACE
      ?auto_1395372 - SURFACE
    )
    :vars
    (
      ?auto_1395377 - HOIST
      ?auto_1395375 - PLACE
      ?auto_1395376 - PLACE
      ?auto_1395374 - HOIST
      ?auto_1395379 - SURFACE
      ?auto_1395373 - SURFACE
      ?auto_1395378 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395377 ?auto_1395375 ) ( IS-CRATE ?auto_1395372 ) ( not ( = ?auto_1395371 ?auto_1395372 ) ) ( not ( = ?auto_1395370 ?auto_1395371 ) ) ( not ( = ?auto_1395370 ?auto_1395372 ) ) ( not ( = ?auto_1395376 ?auto_1395375 ) ) ( HOIST-AT ?auto_1395374 ?auto_1395376 ) ( not ( = ?auto_1395377 ?auto_1395374 ) ) ( SURFACE-AT ?auto_1395372 ?auto_1395376 ) ( ON ?auto_1395372 ?auto_1395379 ) ( CLEAR ?auto_1395372 ) ( not ( = ?auto_1395371 ?auto_1395379 ) ) ( not ( = ?auto_1395372 ?auto_1395379 ) ) ( not ( = ?auto_1395370 ?auto_1395379 ) ) ( SURFACE-AT ?auto_1395370 ?auto_1395375 ) ( CLEAR ?auto_1395370 ) ( IS-CRATE ?auto_1395371 ) ( AVAILABLE ?auto_1395377 ) ( AVAILABLE ?auto_1395374 ) ( SURFACE-AT ?auto_1395371 ?auto_1395376 ) ( ON ?auto_1395371 ?auto_1395373 ) ( CLEAR ?auto_1395371 ) ( not ( = ?auto_1395371 ?auto_1395373 ) ) ( not ( = ?auto_1395372 ?auto_1395373 ) ) ( not ( = ?auto_1395370 ?auto_1395373 ) ) ( not ( = ?auto_1395379 ?auto_1395373 ) ) ( TRUCK-AT ?auto_1395378 ?auto_1395375 ) ( ON ?auto_1395361 ?auto_1395360 ) ( ON ?auto_1395362 ?auto_1395361 ) ( ON ?auto_1395364 ?auto_1395362 ) ( ON ?auto_1395363 ?auto_1395364 ) ( ON ?auto_1395365 ?auto_1395363 ) ( ON ?auto_1395366 ?auto_1395365 ) ( ON ?auto_1395367 ?auto_1395366 ) ( ON ?auto_1395368 ?auto_1395367 ) ( ON ?auto_1395369 ?auto_1395368 ) ( ON ?auto_1395370 ?auto_1395369 ) ( not ( = ?auto_1395360 ?auto_1395361 ) ) ( not ( = ?auto_1395360 ?auto_1395362 ) ) ( not ( = ?auto_1395360 ?auto_1395364 ) ) ( not ( = ?auto_1395360 ?auto_1395363 ) ) ( not ( = ?auto_1395360 ?auto_1395365 ) ) ( not ( = ?auto_1395360 ?auto_1395366 ) ) ( not ( = ?auto_1395360 ?auto_1395367 ) ) ( not ( = ?auto_1395360 ?auto_1395368 ) ) ( not ( = ?auto_1395360 ?auto_1395369 ) ) ( not ( = ?auto_1395360 ?auto_1395370 ) ) ( not ( = ?auto_1395360 ?auto_1395371 ) ) ( not ( = ?auto_1395360 ?auto_1395372 ) ) ( not ( = ?auto_1395360 ?auto_1395379 ) ) ( not ( = ?auto_1395360 ?auto_1395373 ) ) ( not ( = ?auto_1395361 ?auto_1395362 ) ) ( not ( = ?auto_1395361 ?auto_1395364 ) ) ( not ( = ?auto_1395361 ?auto_1395363 ) ) ( not ( = ?auto_1395361 ?auto_1395365 ) ) ( not ( = ?auto_1395361 ?auto_1395366 ) ) ( not ( = ?auto_1395361 ?auto_1395367 ) ) ( not ( = ?auto_1395361 ?auto_1395368 ) ) ( not ( = ?auto_1395361 ?auto_1395369 ) ) ( not ( = ?auto_1395361 ?auto_1395370 ) ) ( not ( = ?auto_1395361 ?auto_1395371 ) ) ( not ( = ?auto_1395361 ?auto_1395372 ) ) ( not ( = ?auto_1395361 ?auto_1395379 ) ) ( not ( = ?auto_1395361 ?auto_1395373 ) ) ( not ( = ?auto_1395362 ?auto_1395364 ) ) ( not ( = ?auto_1395362 ?auto_1395363 ) ) ( not ( = ?auto_1395362 ?auto_1395365 ) ) ( not ( = ?auto_1395362 ?auto_1395366 ) ) ( not ( = ?auto_1395362 ?auto_1395367 ) ) ( not ( = ?auto_1395362 ?auto_1395368 ) ) ( not ( = ?auto_1395362 ?auto_1395369 ) ) ( not ( = ?auto_1395362 ?auto_1395370 ) ) ( not ( = ?auto_1395362 ?auto_1395371 ) ) ( not ( = ?auto_1395362 ?auto_1395372 ) ) ( not ( = ?auto_1395362 ?auto_1395379 ) ) ( not ( = ?auto_1395362 ?auto_1395373 ) ) ( not ( = ?auto_1395364 ?auto_1395363 ) ) ( not ( = ?auto_1395364 ?auto_1395365 ) ) ( not ( = ?auto_1395364 ?auto_1395366 ) ) ( not ( = ?auto_1395364 ?auto_1395367 ) ) ( not ( = ?auto_1395364 ?auto_1395368 ) ) ( not ( = ?auto_1395364 ?auto_1395369 ) ) ( not ( = ?auto_1395364 ?auto_1395370 ) ) ( not ( = ?auto_1395364 ?auto_1395371 ) ) ( not ( = ?auto_1395364 ?auto_1395372 ) ) ( not ( = ?auto_1395364 ?auto_1395379 ) ) ( not ( = ?auto_1395364 ?auto_1395373 ) ) ( not ( = ?auto_1395363 ?auto_1395365 ) ) ( not ( = ?auto_1395363 ?auto_1395366 ) ) ( not ( = ?auto_1395363 ?auto_1395367 ) ) ( not ( = ?auto_1395363 ?auto_1395368 ) ) ( not ( = ?auto_1395363 ?auto_1395369 ) ) ( not ( = ?auto_1395363 ?auto_1395370 ) ) ( not ( = ?auto_1395363 ?auto_1395371 ) ) ( not ( = ?auto_1395363 ?auto_1395372 ) ) ( not ( = ?auto_1395363 ?auto_1395379 ) ) ( not ( = ?auto_1395363 ?auto_1395373 ) ) ( not ( = ?auto_1395365 ?auto_1395366 ) ) ( not ( = ?auto_1395365 ?auto_1395367 ) ) ( not ( = ?auto_1395365 ?auto_1395368 ) ) ( not ( = ?auto_1395365 ?auto_1395369 ) ) ( not ( = ?auto_1395365 ?auto_1395370 ) ) ( not ( = ?auto_1395365 ?auto_1395371 ) ) ( not ( = ?auto_1395365 ?auto_1395372 ) ) ( not ( = ?auto_1395365 ?auto_1395379 ) ) ( not ( = ?auto_1395365 ?auto_1395373 ) ) ( not ( = ?auto_1395366 ?auto_1395367 ) ) ( not ( = ?auto_1395366 ?auto_1395368 ) ) ( not ( = ?auto_1395366 ?auto_1395369 ) ) ( not ( = ?auto_1395366 ?auto_1395370 ) ) ( not ( = ?auto_1395366 ?auto_1395371 ) ) ( not ( = ?auto_1395366 ?auto_1395372 ) ) ( not ( = ?auto_1395366 ?auto_1395379 ) ) ( not ( = ?auto_1395366 ?auto_1395373 ) ) ( not ( = ?auto_1395367 ?auto_1395368 ) ) ( not ( = ?auto_1395367 ?auto_1395369 ) ) ( not ( = ?auto_1395367 ?auto_1395370 ) ) ( not ( = ?auto_1395367 ?auto_1395371 ) ) ( not ( = ?auto_1395367 ?auto_1395372 ) ) ( not ( = ?auto_1395367 ?auto_1395379 ) ) ( not ( = ?auto_1395367 ?auto_1395373 ) ) ( not ( = ?auto_1395368 ?auto_1395369 ) ) ( not ( = ?auto_1395368 ?auto_1395370 ) ) ( not ( = ?auto_1395368 ?auto_1395371 ) ) ( not ( = ?auto_1395368 ?auto_1395372 ) ) ( not ( = ?auto_1395368 ?auto_1395379 ) ) ( not ( = ?auto_1395368 ?auto_1395373 ) ) ( not ( = ?auto_1395369 ?auto_1395370 ) ) ( not ( = ?auto_1395369 ?auto_1395371 ) ) ( not ( = ?auto_1395369 ?auto_1395372 ) ) ( not ( = ?auto_1395369 ?auto_1395379 ) ) ( not ( = ?auto_1395369 ?auto_1395373 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1395370 ?auto_1395371 ?auto_1395372 )
      ( MAKE-12CRATE-VERIFY ?auto_1395360 ?auto_1395361 ?auto_1395362 ?auto_1395364 ?auto_1395363 ?auto_1395365 ?auto_1395366 ?auto_1395367 ?auto_1395368 ?auto_1395369 ?auto_1395370 ?auto_1395371 ?auto_1395372 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1395380 - SURFACE
      ?auto_1395381 - SURFACE
      ?auto_1395382 - SURFACE
      ?auto_1395384 - SURFACE
      ?auto_1395383 - SURFACE
      ?auto_1395385 - SURFACE
      ?auto_1395386 - SURFACE
      ?auto_1395387 - SURFACE
      ?auto_1395388 - SURFACE
      ?auto_1395389 - SURFACE
      ?auto_1395390 - SURFACE
      ?auto_1395391 - SURFACE
      ?auto_1395392 - SURFACE
      ?auto_1395393 - SURFACE
    )
    :vars
    (
      ?auto_1395398 - HOIST
      ?auto_1395396 - PLACE
      ?auto_1395397 - PLACE
      ?auto_1395395 - HOIST
      ?auto_1395400 - SURFACE
      ?auto_1395394 - SURFACE
      ?auto_1395399 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395398 ?auto_1395396 ) ( IS-CRATE ?auto_1395393 ) ( not ( = ?auto_1395392 ?auto_1395393 ) ) ( not ( = ?auto_1395391 ?auto_1395392 ) ) ( not ( = ?auto_1395391 ?auto_1395393 ) ) ( not ( = ?auto_1395397 ?auto_1395396 ) ) ( HOIST-AT ?auto_1395395 ?auto_1395397 ) ( not ( = ?auto_1395398 ?auto_1395395 ) ) ( SURFACE-AT ?auto_1395393 ?auto_1395397 ) ( ON ?auto_1395393 ?auto_1395400 ) ( CLEAR ?auto_1395393 ) ( not ( = ?auto_1395392 ?auto_1395400 ) ) ( not ( = ?auto_1395393 ?auto_1395400 ) ) ( not ( = ?auto_1395391 ?auto_1395400 ) ) ( SURFACE-AT ?auto_1395391 ?auto_1395396 ) ( CLEAR ?auto_1395391 ) ( IS-CRATE ?auto_1395392 ) ( AVAILABLE ?auto_1395398 ) ( AVAILABLE ?auto_1395395 ) ( SURFACE-AT ?auto_1395392 ?auto_1395397 ) ( ON ?auto_1395392 ?auto_1395394 ) ( CLEAR ?auto_1395392 ) ( not ( = ?auto_1395392 ?auto_1395394 ) ) ( not ( = ?auto_1395393 ?auto_1395394 ) ) ( not ( = ?auto_1395391 ?auto_1395394 ) ) ( not ( = ?auto_1395400 ?auto_1395394 ) ) ( TRUCK-AT ?auto_1395399 ?auto_1395396 ) ( ON ?auto_1395381 ?auto_1395380 ) ( ON ?auto_1395382 ?auto_1395381 ) ( ON ?auto_1395384 ?auto_1395382 ) ( ON ?auto_1395383 ?auto_1395384 ) ( ON ?auto_1395385 ?auto_1395383 ) ( ON ?auto_1395386 ?auto_1395385 ) ( ON ?auto_1395387 ?auto_1395386 ) ( ON ?auto_1395388 ?auto_1395387 ) ( ON ?auto_1395389 ?auto_1395388 ) ( ON ?auto_1395390 ?auto_1395389 ) ( ON ?auto_1395391 ?auto_1395390 ) ( not ( = ?auto_1395380 ?auto_1395381 ) ) ( not ( = ?auto_1395380 ?auto_1395382 ) ) ( not ( = ?auto_1395380 ?auto_1395384 ) ) ( not ( = ?auto_1395380 ?auto_1395383 ) ) ( not ( = ?auto_1395380 ?auto_1395385 ) ) ( not ( = ?auto_1395380 ?auto_1395386 ) ) ( not ( = ?auto_1395380 ?auto_1395387 ) ) ( not ( = ?auto_1395380 ?auto_1395388 ) ) ( not ( = ?auto_1395380 ?auto_1395389 ) ) ( not ( = ?auto_1395380 ?auto_1395390 ) ) ( not ( = ?auto_1395380 ?auto_1395391 ) ) ( not ( = ?auto_1395380 ?auto_1395392 ) ) ( not ( = ?auto_1395380 ?auto_1395393 ) ) ( not ( = ?auto_1395380 ?auto_1395400 ) ) ( not ( = ?auto_1395380 ?auto_1395394 ) ) ( not ( = ?auto_1395381 ?auto_1395382 ) ) ( not ( = ?auto_1395381 ?auto_1395384 ) ) ( not ( = ?auto_1395381 ?auto_1395383 ) ) ( not ( = ?auto_1395381 ?auto_1395385 ) ) ( not ( = ?auto_1395381 ?auto_1395386 ) ) ( not ( = ?auto_1395381 ?auto_1395387 ) ) ( not ( = ?auto_1395381 ?auto_1395388 ) ) ( not ( = ?auto_1395381 ?auto_1395389 ) ) ( not ( = ?auto_1395381 ?auto_1395390 ) ) ( not ( = ?auto_1395381 ?auto_1395391 ) ) ( not ( = ?auto_1395381 ?auto_1395392 ) ) ( not ( = ?auto_1395381 ?auto_1395393 ) ) ( not ( = ?auto_1395381 ?auto_1395400 ) ) ( not ( = ?auto_1395381 ?auto_1395394 ) ) ( not ( = ?auto_1395382 ?auto_1395384 ) ) ( not ( = ?auto_1395382 ?auto_1395383 ) ) ( not ( = ?auto_1395382 ?auto_1395385 ) ) ( not ( = ?auto_1395382 ?auto_1395386 ) ) ( not ( = ?auto_1395382 ?auto_1395387 ) ) ( not ( = ?auto_1395382 ?auto_1395388 ) ) ( not ( = ?auto_1395382 ?auto_1395389 ) ) ( not ( = ?auto_1395382 ?auto_1395390 ) ) ( not ( = ?auto_1395382 ?auto_1395391 ) ) ( not ( = ?auto_1395382 ?auto_1395392 ) ) ( not ( = ?auto_1395382 ?auto_1395393 ) ) ( not ( = ?auto_1395382 ?auto_1395400 ) ) ( not ( = ?auto_1395382 ?auto_1395394 ) ) ( not ( = ?auto_1395384 ?auto_1395383 ) ) ( not ( = ?auto_1395384 ?auto_1395385 ) ) ( not ( = ?auto_1395384 ?auto_1395386 ) ) ( not ( = ?auto_1395384 ?auto_1395387 ) ) ( not ( = ?auto_1395384 ?auto_1395388 ) ) ( not ( = ?auto_1395384 ?auto_1395389 ) ) ( not ( = ?auto_1395384 ?auto_1395390 ) ) ( not ( = ?auto_1395384 ?auto_1395391 ) ) ( not ( = ?auto_1395384 ?auto_1395392 ) ) ( not ( = ?auto_1395384 ?auto_1395393 ) ) ( not ( = ?auto_1395384 ?auto_1395400 ) ) ( not ( = ?auto_1395384 ?auto_1395394 ) ) ( not ( = ?auto_1395383 ?auto_1395385 ) ) ( not ( = ?auto_1395383 ?auto_1395386 ) ) ( not ( = ?auto_1395383 ?auto_1395387 ) ) ( not ( = ?auto_1395383 ?auto_1395388 ) ) ( not ( = ?auto_1395383 ?auto_1395389 ) ) ( not ( = ?auto_1395383 ?auto_1395390 ) ) ( not ( = ?auto_1395383 ?auto_1395391 ) ) ( not ( = ?auto_1395383 ?auto_1395392 ) ) ( not ( = ?auto_1395383 ?auto_1395393 ) ) ( not ( = ?auto_1395383 ?auto_1395400 ) ) ( not ( = ?auto_1395383 ?auto_1395394 ) ) ( not ( = ?auto_1395385 ?auto_1395386 ) ) ( not ( = ?auto_1395385 ?auto_1395387 ) ) ( not ( = ?auto_1395385 ?auto_1395388 ) ) ( not ( = ?auto_1395385 ?auto_1395389 ) ) ( not ( = ?auto_1395385 ?auto_1395390 ) ) ( not ( = ?auto_1395385 ?auto_1395391 ) ) ( not ( = ?auto_1395385 ?auto_1395392 ) ) ( not ( = ?auto_1395385 ?auto_1395393 ) ) ( not ( = ?auto_1395385 ?auto_1395400 ) ) ( not ( = ?auto_1395385 ?auto_1395394 ) ) ( not ( = ?auto_1395386 ?auto_1395387 ) ) ( not ( = ?auto_1395386 ?auto_1395388 ) ) ( not ( = ?auto_1395386 ?auto_1395389 ) ) ( not ( = ?auto_1395386 ?auto_1395390 ) ) ( not ( = ?auto_1395386 ?auto_1395391 ) ) ( not ( = ?auto_1395386 ?auto_1395392 ) ) ( not ( = ?auto_1395386 ?auto_1395393 ) ) ( not ( = ?auto_1395386 ?auto_1395400 ) ) ( not ( = ?auto_1395386 ?auto_1395394 ) ) ( not ( = ?auto_1395387 ?auto_1395388 ) ) ( not ( = ?auto_1395387 ?auto_1395389 ) ) ( not ( = ?auto_1395387 ?auto_1395390 ) ) ( not ( = ?auto_1395387 ?auto_1395391 ) ) ( not ( = ?auto_1395387 ?auto_1395392 ) ) ( not ( = ?auto_1395387 ?auto_1395393 ) ) ( not ( = ?auto_1395387 ?auto_1395400 ) ) ( not ( = ?auto_1395387 ?auto_1395394 ) ) ( not ( = ?auto_1395388 ?auto_1395389 ) ) ( not ( = ?auto_1395388 ?auto_1395390 ) ) ( not ( = ?auto_1395388 ?auto_1395391 ) ) ( not ( = ?auto_1395388 ?auto_1395392 ) ) ( not ( = ?auto_1395388 ?auto_1395393 ) ) ( not ( = ?auto_1395388 ?auto_1395400 ) ) ( not ( = ?auto_1395388 ?auto_1395394 ) ) ( not ( = ?auto_1395389 ?auto_1395390 ) ) ( not ( = ?auto_1395389 ?auto_1395391 ) ) ( not ( = ?auto_1395389 ?auto_1395392 ) ) ( not ( = ?auto_1395389 ?auto_1395393 ) ) ( not ( = ?auto_1395389 ?auto_1395400 ) ) ( not ( = ?auto_1395389 ?auto_1395394 ) ) ( not ( = ?auto_1395390 ?auto_1395391 ) ) ( not ( = ?auto_1395390 ?auto_1395392 ) ) ( not ( = ?auto_1395390 ?auto_1395393 ) ) ( not ( = ?auto_1395390 ?auto_1395400 ) ) ( not ( = ?auto_1395390 ?auto_1395394 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1395391 ?auto_1395392 ?auto_1395393 )
      ( MAKE-13CRATE-VERIFY ?auto_1395380 ?auto_1395381 ?auto_1395382 ?auto_1395384 ?auto_1395383 ?auto_1395385 ?auto_1395386 ?auto_1395387 ?auto_1395388 ?auto_1395389 ?auto_1395390 ?auto_1395391 ?auto_1395392 ?auto_1395393 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1395504 - SURFACE
      ?auto_1395505 - SURFACE
      ?auto_1395506 - SURFACE
      ?auto_1395508 - SURFACE
      ?auto_1395507 - SURFACE
      ?auto_1395509 - SURFACE
      ?auto_1395510 - SURFACE
      ?auto_1395511 - SURFACE
      ?auto_1395512 - SURFACE
      ?auto_1395513 - SURFACE
    )
    :vars
    (
      ?auto_1395517 - HOIST
      ?auto_1395519 - PLACE
      ?auto_1395518 - PLACE
      ?auto_1395516 - HOIST
      ?auto_1395515 - SURFACE
      ?auto_1395520 - SURFACE
      ?auto_1395514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395517 ?auto_1395519 ) ( IS-CRATE ?auto_1395513 ) ( not ( = ?auto_1395512 ?auto_1395513 ) ) ( not ( = ?auto_1395511 ?auto_1395512 ) ) ( not ( = ?auto_1395511 ?auto_1395513 ) ) ( not ( = ?auto_1395518 ?auto_1395519 ) ) ( HOIST-AT ?auto_1395516 ?auto_1395518 ) ( not ( = ?auto_1395517 ?auto_1395516 ) ) ( SURFACE-AT ?auto_1395513 ?auto_1395518 ) ( ON ?auto_1395513 ?auto_1395515 ) ( CLEAR ?auto_1395513 ) ( not ( = ?auto_1395512 ?auto_1395515 ) ) ( not ( = ?auto_1395513 ?auto_1395515 ) ) ( not ( = ?auto_1395511 ?auto_1395515 ) ) ( IS-CRATE ?auto_1395512 ) ( AVAILABLE ?auto_1395516 ) ( SURFACE-AT ?auto_1395512 ?auto_1395518 ) ( ON ?auto_1395512 ?auto_1395520 ) ( CLEAR ?auto_1395512 ) ( not ( = ?auto_1395512 ?auto_1395520 ) ) ( not ( = ?auto_1395513 ?auto_1395520 ) ) ( not ( = ?auto_1395511 ?auto_1395520 ) ) ( not ( = ?auto_1395515 ?auto_1395520 ) ) ( TRUCK-AT ?auto_1395514 ?auto_1395519 ) ( SURFACE-AT ?auto_1395510 ?auto_1395519 ) ( CLEAR ?auto_1395510 ) ( LIFTING ?auto_1395517 ?auto_1395511 ) ( IS-CRATE ?auto_1395511 ) ( not ( = ?auto_1395510 ?auto_1395511 ) ) ( not ( = ?auto_1395512 ?auto_1395510 ) ) ( not ( = ?auto_1395513 ?auto_1395510 ) ) ( not ( = ?auto_1395515 ?auto_1395510 ) ) ( not ( = ?auto_1395520 ?auto_1395510 ) ) ( ON ?auto_1395505 ?auto_1395504 ) ( ON ?auto_1395506 ?auto_1395505 ) ( ON ?auto_1395508 ?auto_1395506 ) ( ON ?auto_1395507 ?auto_1395508 ) ( ON ?auto_1395509 ?auto_1395507 ) ( ON ?auto_1395510 ?auto_1395509 ) ( not ( = ?auto_1395504 ?auto_1395505 ) ) ( not ( = ?auto_1395504 ?auto_1395506 ) ) ( not ( = ?auto_1395504 ?auto_1395508 ) ) ( not ( = ?auto_1395504 ?auto_1395507 ) ) ( not ( = ?auto_1395504 ?auto_1395509 ) ) ( not ( = ?auto_1395504 ?auto_1395510 ) ) ( not ( = ?auto_1395504 ?auto_1395511 ) ) ( not ( = ?auto_1395504 ?auto_1395512 ) ) ( not ( = ?auto_1395504 ?auto_1395513 ) ) ( not ( = ?auto_1395504 ?auto_1395515 ) ) ( not ( = ?auto_1395504 ?auto_1395520 ) ) ( not ( = ?auto_1395505 ?auto_1395506 ) ) ( not ( = ?auto_1395505 ?auto_1395508 ) ) ( not ( = ?auto_1395505 ?auto_1395507 ) ) ( not ( = ?auto_1395505 ?auto_1395509 ) ) ( not ( = ?auto_1395505 ?auto_1395510 ) ) ( not ( = ?auto_1395505 ?auto_1395511 ) ) ( not ( = ?auto_1395505 ?auto_1395512 ) ) ( not ( = ?auto_1395505 ?auto_1395513 ) ) ( not ( = ?auto_1395505 ?auto_1395515 ) ) ( not ( = ?auto_1395505 ?auto_1395520 ) ) ( not ( = ?auto_1395506 ?auto_1395508 ) ) ( not ( = ?auto_1395506 ?auto_1395507 ) ) ( not ( = ?auto_1395506 ?auto_1395509 ) ) ( not ( = ?auto_1395506 ?auto_1395510 ) ) ( not ( = ?auto_1395506 ?auto_1395511 ) ) ( not ( = ?auto_1395506 ?auto_1395512 ) ) ( not ( = ?auto_1395506 ?auto_1395513 ) ) ( not ( = ?auto_1395506 ?auto_1395515 ) ) ( not ( = ?auto_1395506 ?auto_1395520 ) ) ( not ( = ?auto_1395508 ?auto_1395507 ) ) ( not ( = ?auto_1395508 ?auto_1395509 ) ) ( not ( = ?auto_1395508 ?auto_1395510 ) ) ( not ( = ?auto_1395508 ?auto_1395511 ) ) ( not ( = ?auto_1395508 ?auto_1395512 ) ) ( not ( = ?auto_1395508 ?auto_1395513 ) ) ( not ( = ?auto_1395508 ?auto_1395515 ) ) ( not ( = ?auto_1395508 ?auto_1395520 ) ) ( not ( = ?auto_1395507 ?auto_1395509 ) ) ( not ( = ?auto_1395507 ?auto_1395510 ) ) ( not ( = ?auto_1395507 ?auto_1395511 ) ) ( not ( = ?auto_1395507 ?auto_1395512 ) ) ( not ( = ?auto_1395507 ?auto_1395513 ) ) ( not ( = ?auto_1395507 ?auto_1395515 ) ) ( not ( = ?auto_1395507 ?auto_1395520 ) ) ( not ( = ?auto_1395509 ?auto_1395510 ) ) ( not ( = ?auto_1395509 ?auto_1395511 ) ) ( not ( = ?auto_1395509 ?auto_1395512 ) ) ( not ( = ?auto_1395509 ?auto_1395513 ) ) ( not ( = ?auto_1395509 ?auto_1395515 ) ) ( not ( = ?auto_1395509 ?auto_1395520 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1395511 ?auto_1395512 ?auto_1395513 )
      ( MAKE-9CRATE-VERIFY ?auto_1395504 ?auto_1395505 ?auto_1395506 ?auto_1395508 ?auto_1395507 ?auto_1395509 ?auto_1395510 ?auto_1395511 ?auto_1395512 ?auto_1395513 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1395521 - SURFACE
      ?auto_1395522 - SURFACE
      ?auto_1395523 - SURFACE
      ?auto_1395525 - SURFACE
      ?auto_1395524 - SURFACE
      ?auto_1395526 - SURFACE
      ?auto_1395527 - SURFACE
      ?auto_1395528 - SURFACE
      ?auto_1395529 - SURFACE
      ?auto_1395530 - SURFACE
      ?auto_1395531 - SURFACE
    )
    :vars
    (
      ?auto_1395535 - HOIST
      ?auto_1395537 - PLACE
      ?auto_1395536 - PLACE
      ?auto_1395534 - HOIST
      ?auto_1395533 - SURFACE
      ?auto_1395538 - SURFACE
      ?auto_1395532 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395535 ?auto_1395537 ) ( IS-CRATE ?auto_1395531 ) ( not ( = ?auto_1395530 ?auto_1395531 ) ) ( not ( = ?auto_1395529 ?auto_1395530 ) ) ( not ( = ?auto_1395529 ?auto_1395531 ) ) ( not ( = ?auto_1395536 ?auto_1395537 ) ) ( HOIST-AT ?auto_1395534 ?auto_1395536 ) ( not ( = ?auto_1395535 ?auto_1395534 ) ) ( SURFACE-AT ?auto_1395531 ?auto_1395536 ) ( ON ?auto_1395531 ?auto_1395533 ) ( CLEAR ?auto_1395531 ) ( not ( = ?auto_1395530 ?auto_1395533 ) ) ( not ( = ?auto_1395531 ?auto_1395533 ) ) ( not ( = ?auto_1395529 ?auto_1395533 ) ) ( IS-CRATE ?auto_1395530 ) ( AVAILABLE ?auto_1395534 ) ( SURFACE-AT ?auto_1395530 ?auto_1395536 ) ( ON ?auto_1395530 ?auto_1395538 ) ( CLEAR ?auto_1395530 ) ( not ( = ?auto_1395530 ?auto_1395538 ) ) ( not ( = ?auto_1395531 ?auto_1395538 ) ) ( not ( = ?auto_1395529 ?auto_1395538 ) ) ( not ( = ?auto_1395533 ?auto_1395538 ) ) ( TRUCK-AT ?auto_1395532 ?auto_1395537 ) ( SURFACE-AT ?auto_1395528 ?auto_1395537 ) ( CLEAR ?auto_1395528 ) ( LIFTING ?auto_1395535 ?auto_1395529 ) ( IS-CRATE ?auto_1395529 ) ( not ( = ?auto_1395528 ?auto_1395529 ) ) ( not ( = ?auto_1395530 ?auto_1395528 ) ) ( not ( = ?auto_1395531 ?auto_1395528 ) ) ( not ( = ?auto_1395533 ?auto_1395528 ) ) ( not ( = ?auto_1395538 ?auto_1395528 ) ) ( ON ?auto_1395522 ?auto_1395521 ) ( ON ?auto_1395523 ?auto_1395522 ) ( ON ?auto_1395525 ?auto_1395523 ) ( ON ?auto_1395524 ?auto_1395525 ) ( ON ?auto_1395526 ?auto_1395524 ) ( ON ?auto_1395527 ?auto_1395526 ) ( ON ?auto_1395528 ?auto_1395527 ) ( not ( = ?auto_1395521 ?auto_1395522 ) ) ( not ( = ?auto_1395521 ?auto_1395523 ) ) ( not ( = ?auto_1395521 ?auto_1395525 ) ) ( not ( = ?auto_1395521 ?auto_1395524 ) ) ( not ( = ?auto_1395521 ?auto_1395526 ) ) ( not ( = ?auto_1395521 ?auto_1395527 ) ) ( not ( = ?auto_1395521 ?auto_1395528 ) ) ( not ( = ?auto_1395521 ?auto_1395529 ) ) ( not ( = ?auto_1395521 ?auto_1395530 ) ) ( not ( = ?auto_1395521 ?auto_1395531 ) ) ( not ( = ?auto_1395521 ?auto_1395533 ) ) ( not ( = ?auto_1395521 ?auto_1395538 ) ) ( not ( = ?auto_1395522 ?auto_1395523 ) ) ( not ( = ?auto_1395522 ?auto_1395525 ) ) ( not ( = ?auto_1395522 ?auto_1395524 ) ) ( not ( = ?auto_1395522 ?auto_1395526 ) ) ( not ( = ?auto_1395522 ?auto_1395527 ) ) ( not ( = ?auto_1395522 ?auto_1395528 ) ) ( not ( = ?auto_1395522 ?auto_1395529 ) ) ( not ( = ?auto_1395522 ?auto_1395530 ) ) ( not ( = ?auto_1395522 ?auto_1395531 ) ) ( not ( = ?auto_1395522 ?auto_1395533 ) ) ( not ( = ?auto_1395522 ?auto_1395538 ) ) ( not ( = ?auto_1395523 ?auto_1395525 ) ) ( not ( = ?auto_1395523 ?auto_1395524 ) ) ( not ( = ?auto_1395523 ?auto_1395526 ) ) ( not ( = ?auto_1395523 ?auto_1395527 ) ) ( not ( = ?auto_1395523 ?auto_1395528 ) ) ( not ( = ?auto_1395523 ?auto_1395529 ) ) ( not ( = ?auto_1395523 ?auto_1395530 ) ) ( not ( = ?auto_1395523 ?auto_1395531 ) ) ( not ( = ?auto_1395523 ?auto_1395533 ) ) ( not ( = ?auto_1395523 ?auto_1395538 ) ) ( not ( = ?auto_1395525 ?auto_1395524 ) ) ( not ( = ?auto_1395525 ?auto_1395526 ) ) ( not ( = ?auto_1395525 ?auto_1395527 ) ) ( not ( = ?auto_1395525 ?auto_1395528 ) ) ( not ( = ?auto_1395525 ?auto_1395529 ) ) ( not ( = ?auto_1395525 ?auto_1395530 ) ) ( not ( = ?auto_1395525 ?auto_1395531 ) ) ( not ( = ?auto_1395525 ?auto_1395533 ) ) ( not ( = ?auto_1395525 ?auto_1395538 ) ) ( not ( = ?auto_1395524 ?auto_1395526 ) ) ( not ( = ?auto_1395524 ?auto_1395527 ) ) ( not ( = ?auto_1395524 ?auto_1395528 ) ) ( not ( = ?auto_1395524 ?auto_1395529 ) ) ( not ( = ?auto_1395524 ?auto_1395530 ) ) ( not ( = ?auto_1395524 ?auto_1395531 ) ) ( not ( = ?auto_1395524 ?auto_1395533 ) ) ( not ( = ?auto_1395524 ?auto_1395538 ) ) ( not ( = ?auto_1395526 ?auto_1395527 ) ) ( not ( = ?auto_1395526 ?auto_1395528 ) ) ( not ( = ?auto_1395526 ?auto_1395529 ) ) ( not ( = ?auto_1395526 ?auto_1395530 ) ) ( not ( = ?auto_1395526 ?auto_1395531 ) ) ( not ( = ?auto_1395526 ?auto_1395533 ) ) ( not ( = ?auto_1395526 ?auto_1395538 ) ) ( not ( = ?auto_1395527 ?auto_1395528 ) ) ( not ( = ?auto_1395527 ?auto_1395529 ) ) ( not ( = ?auto_1395527 ?auto_1395530 ) ) ( not ( = ?auto_1395527 ?auto_1395531 ) ) ( not ( = ?auto_1395527 ?auto_1395533 ) ) ( not ( = ?auto_1395527 ?auto_1395538 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1395529 ?auto_1395530 ?auto_1395531 )
      ( MAKE-10CRATE-VERIFY ?auto_1395521 ?auto_1395522 ?auto_1395523 ?auto_1395525 ?auto_1395524 ?auto_1395526 ?auto_1395527 ?auto_1395528 ?auto_1395529 ?auto_1395530 ?auto_1395531 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1395539 - SURFACE
      ?auto_1395540 - SURFACE
      ?auto_1395541 - SURFACE
      ?auto_1395543 - SURFACE
      ?auto_1395542 - SURFACE
      ?auto_1395544 - SURFACE
      ?auto_1395545 - SURFACE
      ?auto_1395546 - SURFACE
      ?auto_1395547 - SURFACE
      ?auto_1395548 - SURFACE
      ?auto_1395549 - SURFACE
      ?auto_1395550 - SURFACE
    )
    :vars
    (
      ?auto_1395554 - HOIST
      ?auto_1395556 - PLACE
      ?auto_1395555 - PLACE
      ?auto_1395553 - HOIST
      ?auto_1395552 - SURFACE
      ?auto_1395557 - SURFACE
      ?auto_1395551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395554 ?auto_1395556 ) ( IS-CRATE ?auto_1395550 ) ( not ( = ?auto_1395549 ?auto_1395550 ) ) ( not ( = ?auto_1395548 ?auto_1395549 ) ) ( not ( = ?auto_1395548 ?auto_1395550 ) ) ( not ( = ?auto_1395555 ?auto_1395556 ) ) ( HOIST-AT ?auto_1395553 ?auto_1395555 ) ( not ( = ?auto_1395554 ?auto_1395553 ) ) ( SURFACE-AT ?auto_1395550 ?auto_1395555 ) ( ON ?auto_1395550 ?auto_1395552 ) ( CLEAR ?auto_1395550 ) ( not ( = ?auto_1395549 ?auto_1395552 ) ) ( not ( = ?auto_1395550 ?auto_1395552 ) ) ( not ( = ?auto_1395548 ?auto_1395552 ) ) ( IS-CRATE ?auto_1395549 ) ( AVAILABLE ?auto_1395553 ) ( SURFACE-AT ?auto_1395549 ?auto_1395555 ) ( ON ?auto_1395549 ?auto_1395557 ) ( CLEAR ?auto_1395549 ) ( not ( = ?auto_1395549 ?auto_1395557 ) ) ( not ( = ?auto_1395550 ?auto_1395557 ) ) ( not ( = ?auto_1395548 ?auto_1395557 ) ) ( not ( = ?auto_1395552 ?auto_1395557 ) ) ( TRUCK-AT ?auto_1395551 ?auto_1395556 ) ( SURFACE-AT ?auto_1395547 ?auto_1395556 ) ( CLEAR ?auto_1395547 ) ( LIFTING ?auto_1395554 ?auto_1395548 ) ( IS-CRATE ?auto_1395548 ) ( not ( = ?auto_1395547 ?auto_1395548 ) ) ( not ( = ?auto_1395549 ?auto_1395547 ) ) ( not ( = ?auto_1395550 ?auto_1395547 ) ) ( not ( = ?auto_1395552 ?auto_1395547 ) ) ( not ( = ?auto_1395557 ?auto_1395547 ) ) ( ON ?auto_1395540 ?auto_1395539 ) ( ON ?auto_1395541 ?auto_1395540 ) ( ON ?auto_1395543 ?auto_1395541 ) ( ON ?auto_1395542 ?auto_1395543 ) ( ON ?auto_1395544 ?auto_1395542 ) ( ON ?auto_1395545 ?auto_1395544 ) ( ON ?auto_1395546 ?auto_1395545 ) ( ON ?auto_1395547 ?auto_1395546 ) ( not ( = ?auto_1395539 ?auto_1395540 ) ) ( not ( = ?auto_1395539 ?auto_1395541 ) ) ( not ( = ?auto_1395539 ?auto_1395543 ) ) ( not ( = ?auto_1395539 ?auto_1395542 ) ) ( not ( = ?auto_1395539 ?auto_1395544 ) ) ( not ( = ?auto_1395539 ?auto_1395545 ) ) ( not ( = ?auto_1395539 ?auto_1395546 ) ) ( not ( = ?auto_1395539 ?auto_1395547 ) ) ( not ( = ?auto_1395539 ?auto_1395548 ) ) ( not ( = ?auto_1395539 ?auto_1395549 ) ) ( not ( = ?auto_1395539 ?auto_1395550 ) ) ( not ( = ?auto_1395539 ?auto_1395552 ) ) ( not ( = ?auto_1395539 ?auto_1395557 ) ) ( not ( = ?auto_1395540 ?auto_1395541 ) ) ( not ( = ?auto_1395540 ?auto_1395543 ) ) ( not ( = ?auto_1395540 ?auto_1395542 ) ) ( not ( = ?auto_1395540 ?auto_1395544 ) ) ( not ( = ?auto_1395540 ?auto_1395545 ) ) ( not ( = ?auto_1395540 ?auto_1395546 ) ) ( not ( = ?auto_1395540 ?auto_1395547 ) ) ( not ( = ?auto_1395540 ?auto_1395548 ) ) ( not ( = ?auto_1395540 ?auto_1395549 ) ) ( not ( = ?auto_1395540 ?auto_1395550 ) ) ( not ( = ?auto_1395540 ?auto_1395552 ) ) ( not ( = ?auto_1395540 ?auto_1395557 ) ) ( not ( = ?auto_1395541 ?auto_1395543 ) ) ( not ( = ?auto_1395541 ?auto_1395542 ) ) ( not ( = ?auto_1395541 ?auto_1395544 ) ) ( not ( = ?auto_1395541 ?auto_1395545 ) ) ( not ( = ?auto_1395541 ?auto_1395546 ) ) ( not ( = ?auto_1395541 ?auto_1395547 ) ) ( not ( = ?auto_1395541 ?auto_1395548 ) ) ( not ( = ?auto_1395541 ?auto_1395549 ) ) ( not ( = ?auto_1395541 ?auto_1395550 ) ) ( not ( = ?auto_1395541 ?auto_1395552 ) ) ( not ( = ?auto_1395541 ?auto_1395557 ) ) ( not ( = ?auto_1395543 ?auto_1395542 ) ) ( not ( = ?auto_1395543 ?auto_1395544 ) ) ( not ( = ?auto_1395543 ?auto_1395545 ) ) ( not ( = ?auto_1395543 ?auto_1395546 ) ) ( not ( = ?auto_1395543 ?auto_1395547 ) ) ( not ( = ?auto_1395543 ?auto_1395548 ) ) ( not ( = ?auto_1395543 ?auto_1395549 ) ) ( not ( = ?auto_1395543 ?auto_1395550 ) ) ( not ( = ?auto_1395543 ?auto_1395552 ) ) ( not ( = ?auto_1395543 ?auto_1395557 ) ) ( not ( = ?auto_1395542 ?auto_1395544 ) ) ( not ( = ?auto_1395542 ?auto_1395545 ) ) ( not ( = ?auto_1395542 ?auto_1395546 ) ) ( not ( = ?auto_1395542 ?auto_1395547 ) ) ( not ( = ?auto_1395542 ?auto_1395548 ) ) ( not ( = ?auto_1395542 ?auto_1395549 ) ) ( not ( = ?auto_1395542 ?auto_1395550 ) ) ( not ( = ?auto_1395542 ?auto_1395552 ) ) ( not ( = ?auto_1395542 ?auto_1395557 ) ) ( not ( = ?auto_1395544 ?auto_1395545 ) ) ( not ( = ?auto_1395544 ?auto_1395546 ) ) ( not ( = ?auto_1395544 ?auto_1395547 ) ) ( not ( = ?auto_1395544 ?auto_1395548 ) ) ( not ( = ?auto_1395544 ?auto_1395549 ) ) ( not ( = ?auto_1395544 ?auto_1395550 ) ) ( not ( = ?auto_1395544 ?auto_1395552 ) ) ( not ( = ?auto_1395544 ?auto_1395557 ) ) ( not ( = ?auto_1395545 ?auto_1395546 ) ) ( not ( = ?auto_1395545 ?auto_1395547 ) ) ( not ( = ?auto_1395545 ?auto_1395548 ) ) ( not ( = ?auto_1395545 ?auto_1395549 ) ) ( not ( = ?auto_1395545 ?auto_1395550 ) ) ( not ( = ?auto_1395545 ?auto_1395552 ) ) ( not ( = ?auto_1395545 ?auto_1395557 ) ) ( not ( = ?auto_1395546 ?auto_1395547 ) ) ( not ( = ?auto_1395546 ?auto_1395548 ) ) ( not ( = ?auto_1395546 ?auto_1395549 ) ) ( not ( = ?auto_1395546 ?auto_1395550 ) ) ( not ( = ?auto_1395546 ?auto_1395552 ) ) ( not ( = ?auto_1395546 ?auto_1395557 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1395548 ?auto_1395549 ?auto_1395550 )
      ( MAKE-11CRATE-VERIFY ?auto_1395539 ?auto_1395540 ?auto_1395541 ?auto_1395543 ?auto_1395542 ?auto_1395544 ?auto_1395545 ?auto_1395546 ?auto_1395547 ?auto_1395548 ?auto_1395549 ?auto_1395550 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1395558 - SURFACE
      ?auto_1395559 - SURFACE
      ?auto_1395560 - SURFACE
      ?auto_1395562 - SURFACE
      ?auto_1395561 - SURFACE
      ?auto_1395563 - SURFACE
      ?auto_1395564 - SURFACE
      ?auto_1395565 - SURFACE
      ?auto_1395566 - SURFACE
      ?auto_1395567 - SURFACE
      ?auto_1395568 - SURFACE
      ?auto_1395569 - SURFACE
      ?auto_1395570 - SURFACE
    )
    :vars
    (
      ?auto_1395574 - HOIST
      ?auto_1395576 - PLACE
      ?auto_1395575 - PLACE
      ?auto_1395573 - HOIST
      ?auto_1395572 - SURFACE
      ?auto_1395577 - SURFACE
      ?auto_1395571 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395574 ?auto_1395576 ) ( IS-CRATE ?auto_1395570 ) ( not ( = ?auto_1395569 ?auto_1395570 ) ) ( not ( = ?auto_1395568 ?auto_1395569 ) ) ( not ( = ?auto_1395568 ?auto_1395570 ) ) ( not ( = ?auto_1395575 ?auto_1395576 ) ) ( HOIST-AT ?auto_1395573 ?auto_1395575 ) ( not ( = ?auto_1395574 ?auto_1395573 ) ) ( SURFACE-AT ?auto_1395570 ?auto_1395575 ) ( ON ?auto_1395570 ?auto_1395572 ) ( CLEAR ?auto_1395570 ) ( not ( = ?auto_1395569 ?auto_1395572 ) ) ( not ( = ?auto_1395570 ?auto_1395572 ) ) ( not ( = ?auto_1395568 ?auto_1395572 ) ) ( IS-CRATE ?auto_1395569 ) ( AVAILABLE ?auto_1395573 ) ( SURFACE-AT ?auto_1395569 ?auto_1395575 ) ( ON ?auto_1395569 ?auto_1395577 ) ( CLEAR ?auto_1395569 ) ( not ( = ?auto_1395569 ?auto_1395577 ) ) ( not ( = ?auto_1395570 ?auto_1395577 ) ) ( not ( = ?auto_1395568 ?auto_1395577 ) ) ( not ( = ?auto_1395572 ?auto_1395577 ) ) ( TRUCK-AT ?auto_1395571 ?auto_1395576 ) ( SURFACE-AT ?auto_1395567 ?auto_1395576 ) ( CLEAR ?auto_1395567 ) ( LIFTING ?auto_1395574 ?auto_1395568 ) ( IS-CRATE ?auto_1395568 ) ( not ( = ?auto_1395567 ?auto_1395568 ) ) ( not ( = ?auto_1395569 ?auto_1395567 ) ) ( not ( = ?auto_1395570 ?auto_1395567 ) ) ( not ( = ?auto_1395572 ?auto_1395567 ) ) ( not ( = ?auto_1395577 ?auto_1395567 ) ) ( ON ?auto_1395559 ?auto_1395558 ) ( ON ?auto_1395560 ?auto_1395559 ) ( ON ?auto_1395562 ?auto_1395560 ) ( ON ?auto_1395561 ?auto_1395562 ) ( ON ?auto_1395563 ?auto_1395561 ) ( ON ?auto_1395564 ?auto_1395563 ) ( ON ?auto_1395565 ?auto_1395564 ) ( ON ?auto_1395566 ?auto_1395565 ) ( ON ?auto_1395567 ?auto_1395566 ) ( not ( = ?auto_1395558 ?auto_1395559 ) ) ( not ( = ?auto_1395558 ?auto_1395560 ) ) ( not ( = ?auto_1395558 ?auto_1395562 ) ) ( not ( = ?auto_1395558 ?auto_1395561 ) ) ( not ( = ?auto_1395558 ?auto_1395563 ) ) ( not ( = ?auto_1395558 ?auto_1395564 ) ) ( not ( = ?auto_1395558 ?auto_1395565 ) ) ( not ( = ?auto_1395558 ?auto_1395566 ) ) ( not ( = ?auto_1395558 ?auto_1395567 ) ) ( not ( = ?auto_1395558 ?auto_1395568 ) ) ( not ( = ?auto_1395558 ?auto_1395569 ) ) ( not ( = ?auto_1395558 ?auto_1395570 ) ) ( not ( = ?auto_1395558 ?auto_1395572 ) ) ( not ( = ?auto_1395558 ?auto_1395577 ) ) ( not ( = ?auto_1395559 ?auto_1395560 ) ) ( not ( = ?auto_1395559 ?auto_1395562 ) ) ( not ( = ?auto_1395559 ?auto_1395561 ) ) ( not ( = ?auto_1395559 ?auto_1395563 ) ) ( not ( = ?auto_1395559 ?auto_1395564 ) ) ( not ( = ?auto_1395559 ?auto_1395565 ) ) ( not ( = ?auto_1395559 ?auto_1395566 ) ) ( not ( = ?auto_1395559 ?auto_1395567 ) ) ( not ( = ?auto_1395559 ?auto_1395568 ) ) ( not ( = ?auto_1395559 ?auto_1395569 ) ) ( not ( = ?auto_1395559 ?auto_1395570 ) ) ( not ( = ?auto_1395559 ?auto_1395572 ) ) ( not ( = ?auto_1395559 ?auto_1395577 ) ) ( not ( = ?auto_1395560 ?auto_1395562 ) ) ( not ( = ?auto_1395560 ?auto_1395561 ) ) ( not ( = ?auto_1395560 ?auto_1395563 ) ) ( not ( = ?auto_1395560 ?auto_1395564 ) ) ( not ( = ?auto_1395560 ?auto_1395565 ) ) ( not ( = ?auto_1395560 ?auto_1395566 ) ) ( not ( = ?auto_1395560 ?auto_1395567 ) ) ( not ( = ?auto_1395560 ?auto_1395568 ) ) ( not ( = ?auto_1395560 ?auto_1395569 ) ) ( not ( = ?auto_1395560 ?auto_1395570 ) ) ( not ( = ?auto_1395560 ?auto_1395572 ) ) ( not ( = ?auto_1395560 ?auto_1395577 ) ) ( not ( = ?auto_1395562 ?auto_1395561 ) ) ( not ( = ?auto_1395562 ?auto_1395563 ) ) ( not ( = ?auto_1395562 ?auto_1395564 ) ) ( not ( = ?auto_1395562 ?auto_1395565 ) ) ( not ( = ?auto_1395562 ?auto_1395566 ) ) ( not ( = ?auto_1395562 ?auto_1395567 ) ) ( not ( = ?auto_1395562 ?auto_1395568 ) ) ( not ( = ?auto_1395562 ?auto_1395569 ) ) ( not ( = ?auto_1395562 ?auto_1395570 ) ) ( not ( = ?auto_1395562 ?auto_1395572 ) ) ( not ( = ?auto_1395562 ?auto_1395577 ) ) ( not ( = ?auto_1395561 ?auto_1395563 ) ) ( not ( = ?auto_1395561 ?auto_1395564 ) ) ( not ( = ?auto_1395561 ?auto_1395565 ) ) ( not ( = ?auto_1395561 ?auto_1395566 ) ) ( not ( = ?auto_1395561 ?auto_1395567 ) ) ( not ( = ?auto_1395561 ?auto_1395568 ) ) ( not ( = ?auto_1395561 ?auto_1395569 ) ) ( not ( = ?auto_1395561 ?auto_1395570 ) ) ( not ( = ?auto_1395561 ?auto_1395572 ) ) ( not ( = ?auto_1395561 ?auto_1395577 ) ) ( not ( = ?auto_1395563 ?auto_1395564 ) ) ( not ( = ?auto_1395563 ?auto_1395565 ) ) ( not ( = ?auto_1395563 ?auto_1395566 ) ) ( not ( = ?auto_1395563 ?auto_1395567 ) ) ( not ( = ?auto_1395563 ?auto_1395568 ) ) ( not ( = ?auto_1395563 ?auto_1395569 ) ) ( not ( = ?auto_1395563 ?auto_1395570 ) ) ( not ( = ?auto_1395563 ?auto_1395572 ) ) ( not ( = ?auto_1395563 ?auto_1395577 ) ) ( not ( = ?auto_1395564 ?auto_1395565 ) ) ( not ( = ?auto_1395564 ?auto_1395566 ) ) ( not ( = ?auto_1395564 ?auto_1395567 ) ) ( not ( = ?auto_1395564 ?auto_1395568 ) ) ( not ( = ?auto_1395564 ?auto_1395569 ) ) ( not ( = ?auto_1395564 ?auto_1395570 ) ) ( not ( = ?auto_1395564 ?auto_1395572 ) ) ( not ( = ?auto_1395564 ?auto_1395577 ) ) ( not ( = ?auto_1395565 ?auto_1395566 ) ) ( not ( = ?auto_1395565 ?auto_1395567 ) ) ( not ( = ?auto_1395565 ?auto_1395568 ) ) ( not ( = ?auto_1395565 ?auto_1395569 ) ) ( not ( = ?auto_1395565 ?auto_1395570 ) ) ( not ( = ?auto_1395565 ?auto_1395572 ) ) ( not ( = ?auto_1395565 ?auto_1395577 ) ) ( not ( = ?auto_1395566 ?auto_1395567 ) ) ( not ( = ?auto_1395566 ?auto_1395568 ) ) ( not ( = ?auto_1395566 ?auto_1395569 ) ) ( not ( = ?auto_1395566 ?auto_1395570 ) ) ( not ( = ?auto_1395566 ?auto_1395572 ) ) ( not ( = ?auto_1395566 ?auto_1395577 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1395568 ?auto_1395569 ?auto_1395570 )
      ( MAKE-12CRATE-VERIFY ?auto_1395558 ?auto_1395559 ?auto_1395560 ?auto_1395562 ?auto_1395561 ?auto_1395563 ?auto_1395564 ?auto_1395565 ?auto_1395566 ?auto_1395567 ?auto_1395568 ?auto_1395569 ?auto_1395570 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1395578 - SURFACE
      ?auto_1395579 - SURFACE
      ?auto_1395580 - SURFACE
      ?auto_1395582 - SURFACE
      ?auto_1395581 - SURFACE
      ?auto_1395583 - SURFACE
      ?auto_1395584 - SURFACE
      ?auto_1395585 - SURFACE
      ?auto_1395586 - SURFACE
      ?auto_1395587 - SURFACE
      ?auto_1395588 - SURFACE
      ?auto_1395589 - SURFACE
      ?auto_1395590 - SURFACE
      ?auto_1395591 - SURFACE
    )
    :vars
    (
      ?auto_1395595 - HOIST
      ?auto_1395597 - PLACE
      ?auto_1395596 - PLACE
      ?auto_1395594 - HOIST
      ?auto_1395593 - SURFACE
      ?auto_1395598 - SURFACE
      ?auto_1395592 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395595 ?auto_1395597 ) ( IS-CRATE ?auto_1395591 ) ( not ( = ?auto_1395590 ?auto_1395591 ) ) ( not ( = ?auto_1395589 ?auto_1395590 ) ) ( not ( = ?auto_1395589 ?auto_1395591 ) ) ( not ( = ?auto_1395596 ?auto_1395597 ) ) ( HOIST-AT ?auto_1395594 ?auto_1395596 ) ( not ( = ?auto_1395595 ?auto_1395594 ) ) ( SURFACE-AT ?auto_1395591 ?auto_1395596 ) ( ON ?auto_1395591 ?auto_1395593 ) ( CLEAR ?auto_1395591 ) ( not ( = ?auto_1395590 ?auto_1395593 ) ) ( not ( = ?auto_1395591 ?auto_1395593 ) ) ( not ( = ?auto_1395589 ?auto_1395593 ) ) ( IS-CRATE ?auto_1395590 ) ( AVAILABLE ?auto_1395594 ) ( SURFACE-AT ?auto_1395590 ?auto_1395596 ) ( ON ?auto_1395590 ?auto_1395598 ) ( CLEAR ?auto_1395590 ) ( not ( = ?auto_1395590 ?auto_1395598 ) ) ( not ( = ?auto_1395591 ?auto_1395598 ) ) ( not ( = ?auto_1395589 ?auto_1395598 ) ) ( not ( = ?auto_1395593 ?auto_1395598 ) ) ( TRUCK-AT ?auto_1395592 ?auto_1395597 ) ( SURFACE-AT ?auto_1395588 ?auto_1395597 ) ( CLEAR ?auto_1395588 ) ( LIFTING ?auto_1395595 ?auto_1395589 ) ( IS-CRATE ?auto_1395589 ) ( not ( = ?auto_1395588 ?auto_1395589 ) ) ( not ( = ?auto_1395590 ?auto_1395588 ) ) ( not ( = ?auto_1395591 ?auto_1395588 ) ) ( not ( = ?auto_1395593 ?auto_1395588 ) ) ( not ( = ?auto_1395598 ?auto_1395588 ) ) ( ON ?auto_1395579 ?auto_1395578 ) ( ON ?auto_1395580 ?auto_1395579 ) ( ON ?auto_1395582 ?auto_1395580 ) ( ON ?auto_1395581 ?auto_1395582 ) ( ON ?auto_1395583 ?auto_1395581 ) ( ON ?auto_1395584 ?auto_1395583 ) ( ON ?auto_1395585 ?auto_1395584 ) ( ON ?auto_1395586 ?auto_1395585 ) ( ON ?auto_1395587 ?auto_1395586 ) ( ON ?auto_1395588 ?auto_1395587 ) ( not ( = ?auto_1395578 ?auto_1395579 ) ) ( not ( = ?auto_1395578 ?auto_1395580 ) ) ( not ( = ?auto_1395578 ?auto_1395582 ) ) ( not ( = ?auto_1395578 ?auto_1395581 ) ) ( not ( = ?auto_1395578 ?auto_1395583 ) ) ( not ( = ?auto_1395578 ?auto_1395584 ) ) ( not ( = ?auto_1395578 ?auto_1395585 ) ) ( not ( = ?auto_1395578 ?auto_1395586 ) ) ( not ( = ?auto_1395578 ?auto_1395587 ) ) ( not ( = ?auto_1395578 ?auto_1395588 ) ) ( not ( = ?auto_1395578 ?auto_1395589 ) ) ( not ( = ?auto_1395578 ?auto_1395590 ) ) ( not ( = ?auto_1395578 ?auto_1395591 ) ) ( not ( = ?auto_1395578 ?auto_1395593 ) ) ( not ( = ?auto_1395578 ?auto_1395598 ) ) ( not ( = ?auto_1395579 ?auto_1395580 ) ) ( not ( = ?auto_1395579 ?auto_1395582 ) ) ( not ( = ?auto_1395579 ?auto_1395581 ) ) ( not ( = ?auto_1395579 ?auto_1395583 ) ) ( not ( = ?auto_1395579 ?auto_1395584 ) ) ( not ( = ?auto_1395579 ?auto_1395585 ) ) ( not ( = ?auto_1395579 ?auto_1395586 ) ) ( not ( = ?auto_1395579 ?auto_1395587 ) ) ( not ( = ?auto_1395579 ?auto_1395588 ) ) ( not ( = ?auto_1395579 ?auto_1395589 ) ) ( not ( = ?auto_1395579 ?auto_1395590 ) ) ( not ( = ?auto_1395579 ?auto_1395591 ) ) ( not ( = ?auto_1395579 ?auto_1395593 ) ) ( not ( = ?auto_1395579 ?auto_1395598 ) ) ( not ( = ?auto_1395580 ?auto_1395582 ) ) ( not ( = ?auto_1395580 ?auto_1395581 ) ) ( not ( = ?auto_1395580 ?auto_1395583 ) ) ( not ( = ?auto_1395580 ?auto_1395584 ) ) ( not ( = ?auto_1395580 ?auto_1395585 ) ) ( not ( = ?auto_1395580 ?auto_1395586 ) ) ( not ( = ?auto_1395580 ?auto_1395587 ) ) ( not ( = ?auto_1395580 ?auto_1395588 ) ) ( not ( = ?auto_1395580 ?auto_1395589 ) ) ( not ( = ?auto_1395580 ?auto_1395590 ) ) ( not ( = ?auto_1395580 ?auto_1395591 ) ) ( not ( = ?auto_1395580 ?auto_1395593 ) ) ( not ( = ?auto_1395580 ?auto_1395598 ) ) ( not ( = ?auto_1395582 ?auto_1395581 ) ) ( not ( = ?auto_1395582 ?auto_1395583 ) ) ( not ( = ?auto_1395582 ?auto_1395584 ) ) ( not ( = ?auto_1395582 ?auto_1395585 ) ) ( not ( = ?auto_1395582 ?auto_1395586 ) ) ( not ( = ?auto_1395582 ?auto_1395587 ) ) ( not ( = ?auto_1395582 ?auto_1395588 ) ) ( not ( = ?auto_1395582 ?auto_1395589 ) ) ( not ( = ?auto_1395582 ?auto_1395590 ) ) ( not ( = ?auto_1395582 ?auto_1395591 ) ) ( not ( = ?auto_1395582 ?auto_1395593 ) ) ( not ( = ?auto_1395582 ?auto_1395598 ) ) ( not ( = ?auto_1395581 ?auto_1395583 ) ) ( not ( = ?auto_1395581 ?auto_1395584 ) ) ( not ( = ?auto_1395581 ?auto_1395585 ) ) ( not ( = ?auto_1395581 ?auto_1395586 ) ) ( not ( = ?auto_1395581 ?auto_1395587 ) ) ( not ( = ?auto_1395581 ?auto_1395588 ) ) ( not ( = ?auto_1395581 ?auto_1395589 ) ) ( not ( = ?auto_1395581 ?auto_1395590 ) ) ( not ( = ?auto_1395581 ?auto_1395591 ) ) ( not ( = ?auto_1395581 ?auto_1395593 ) ) ( not ( = ?auto_1395581 ?auto_1395598 ) ) ( not ( = ?auto_1395583 ?auto_1395584 ) ) ( not ( = ?auto_1395583 ?auto_1395585 ) ) ( not ( = ?auto_1395583 ?auto_1395586 ) ) ( not ( = ?auto_1395583 ?auto_1395587 ) ) ( not ( = ?auto_1395583 ?auto_1395588 ) ) ( not ( = ?auto_1395583 ?auto_1395589 ) ) ( not ( = ?auto_1395583 ?auto_1395590 ) ) ( not ( = ?auto_1395583 ?auto_1395591 ) ) ( not ( = ?auto_1395583 ?auto_1395593 ) ) ( not ( = ?auto_1395583 ?auto_1395598 ) ) ( not ( = ?auto_1395584 ?auto_1395585 ) ) ( not ( = ?auto_1395584 ?auto_1395586 ) ) ( not ( = ?auto_1395584 ?auto_1395587 ) ) ( not ( = ?auto_1395584 ?auto_1395588 ) ) ( not ( = ?auto_1395584 ?auto_1395589 ) ) ( not ( = ?auto_1395584 ?auto_1395590 ) ) ( not ( = ?auto_1395584 ?auto_1395591 ) ) ( not ( = ?auto_1395584 ?auto_1395593 ) ) ( not ( = ?auto_1395584 ?auto_1395598 ) ) ( not ( = ?auto_1395585 ?auto_1395586 ) ) ( not ( = ?auto_1395585 ?auto_1395587 ) ) ( not ( = ?auto_1395585 ?auto_1395588 ) ) ( not ( = ?auto_1395585 ?auto_1395589 ) ) ( not ( = ?auto_1395585 ?auto_1395590 ) ) ( not ( = ?auto_1395585 ?auto_1395591 ) ) ( not ( = ?auto_1395585 ?auto_1395593 ) ) ( not ( = ?auto_1395585 ?auto_1395598 ) ) ( not ( = ?auto_1395586 ?auto_1395587 ) ) ( not ( = ?auto_1395586 ?auto_1395588 ) ) ( not ( = ?auto_1395586 ?auto_1395589 ) ) ( not ( = ?auto_1395586 ?auto_1395590 ) ) ( not ( = ?auto_1395586 ?auto_1395591 ) ) ( not ( = ?auto_1395586 ?auto_1395593 ) ) ( not ( = ?auto_1395586 ?auto_1395598 ) ) ( not ( = ?auto_1395587 ?auto_1395588 ) ) ( not ( = ?auto_1395587 ?auto_1395589 ) ) ( not ( = ?auto_1395587 ?auto_1395590 ) ) ( not ( = ?auto_1395587 ?auto_1395591 ) ) ( not ( = ?auto_1395587 ?auto_1395593 ) ) ( not ( = ?auto_1395587 ?auto_1395598 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1395589 ?auto_1395590 ?auto_1395591 )
      ( MAKE-13CRATE-VERIFY ?auto_1395578 ?auto_1395579 ?auto_1395580 ?auto_1395582 ?auto_1395581 ?auto_1395583 ?auto_1395584 ?auto_1395585 ?auto_1395586 ?auto_1395587 ?auto_1395588 ?auto_1395589 ?auto_1395590 ?auto_1395591 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1408654 - SURFACE
      ?auto_1408655 - SURFACE
      ?auto_1408656 - SURFACE
      ?auto_1408658 - SURFACE
      ?auto_1408657 - SURFACE
      ?auto_1408659 - SURFACE
      ?auto_1408660 - SURFACE
      ?auto_1408661 - SURFACE
      ?auto_1408662 - SURFACE
      ?auto_1408663 - SURFACE
      ?auto_1408664 - SURFACE
      ?auto_1408665 - SURFACE
      ?auto_1408666 - SURFACE
      ?auto_1408667 - SURFACE
      ?auto_1408668 - SURFACE
    )
    :vars
    (
      ?auto_1408670 - HOIST
      ?auto_1408669 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1408670 ?auto_1408669 ) ( SURFACE-AT ?auto_1408667 ?auto_1408669 ) ( CLEAR ?auto_1408667 ) ( LIFTING ?auto_1408670 ?auto_1408668 ) ( IS-CRATE ?auto_1408668 ) ( not ( = ?auto_1408667 ?auto_1408668 ) ) ( ON ?auto_1408655 ?auto_1408654 ) ( ON ?auto_1408656 ?auto_1408655 ) ( ON ?auto_1408658 ?auto_1408656 ) ( ON ?auto_1408657 ?auto_1408658 ) ( ON ?auto_1408659 ?auto_1408657 ) ( ON ?auto_1408660 ?auto_1408659 ) ( ON ?auto_1408661 ?auto_1408660 ) ( ON ?auto_1408662 ?auto_1408661 ) ( ON ?auto_1408663 ?auto_1408662 ) ( ON ?auto_1408664 ?auto_1408663 ) ( ON ?auto_1408665 ?auto_1408664 ) ( ON ?auto_1408666 ?auto_1408665 ) ( ON ?auto_1408667 ?auto_1408666 ) ( not ( = ?auto_1408654 ?auto_1408655 ) ) ( not ( = ?auto_1408654 ?auto_1408656 ) ) ( not ( = ?auto_1408654 ?auto_1408658 ) ) ( not ( = ?auto_1408654 ?auto_1408657 ) ) ( not ( = ?auto_1408654 ?auto_1408659 ) ) ( not ( = ?auto_1408654 ?auto_1408660 ) ) ( not ( = ?auto_1408654 ?auto_1408661 ) ) ( not ( = ?auto_1408654 ?auto_1408662 ) ) ( not ( = ?auto_1408654 ?auto_1408663 ) ) ( not ( = ?auto_1408654 ?auto_1408664 ) ) ( not ( = ?auto_1408654 ?auto_1408665 ) ) ( not ( = ?auto_1408654 ?auto_1408666 ) ) ( not ( = ?auto_1408654 ?auto_1408667 ) ) ( not ( = ?auto_1408654 ?auto_1408668 ) ) ( not ( = ?auto_1408655 ?auto_1408656 ) ) ( not ( = ?auto_1408655 ?auto_1408658 ) ) ( not ( = ?auto_1408655 ?auto_1408657 ) ) ( not ( = ?auto_1408655 ?auto_1408659 ) ) ( not ( = ?auto_1408655 ?auto_1408660 ) ) ( not ( = ?auto_1408655 ?auto_1408661 ) ) ( not ( = ?auto_1408655 ?auto_1408662 ) ) ( not ( = ?auto_1408655 ?auto_1408663 ) ) ( not ( = ?auto_1408655 ?auto_1408664 ) ) ( not ( = ?auto_1408655 ?auto_1408665 ) ) ( not ( = ?auto_1408655 ?auto_1408666 ) ) ( not ( = ?auto_1408655 ?auto_1408667 ) ) ( not ( = ?auto_1408655 ?auto_1408668 ) ) ( not ( = ?auto_1408656 ?auto_1408658 ) ) ( not ( = ?auto_1408656 ?auto_1408657 ) ) ( not ( = ?auto_1408656 ?auto_1408659 ) ) ( not ( = ?auto_1408656 ?auto_1408660 ) ) ( not ( = ?auto_1408656 ?auto_1408661 ) ) ( not ( = ?auto_1408656 ?auto_1408662 ) ) ( not ( = ?auto_1408656 ?auto_1408663 ) ) ( not ( = ?auto_1408656 ?auto_1408664 ) ) ( not ( = ?auto_1408656 ?auto_1408665 ) ) ( not ( = ?auto_1408656 ?auto_1408666 ) ) ( not ( = ?auto_1408656 ?auto_1408667 ) ) ( not ( = ?auto_1408656 ?auto_1408668 ) ) ( not ( = ?auto_1408658 ?auto_1408657 ) ) ( not ( = ?auto_1408658 ?auto_1408659 ) ) ( not ( = ?auto_1408658 ?auto_1408660 ) ) ( not ( = ?auto_1408658 ?auto_1408661 ) ) ( not ( = ?auto_1408658 ?auto_1408662 ) ) ( not ( = ?auto_1408658 ?auto_1408663 ) ) ( not ( = ?auto_1408658 ?auto_1408664 ) ) ( not ( = ?auto_1408658 ?auto_1408665 ) ) ( not ( = ?auto_1408658 ?auto_1408666 ) ) ( not ( = ?auto_1408658 ?auto_1408667 ) ) ( not ( = ?auto_1408658 ?auto_1408668 ) ) ( not ( = ?auto_1408657 ?auto_1408659 ) ) ( not ( = ?auto_1408657 ?auto_1408660 ) ) ( not ( = ?auto_1408657 ?auto_1408661 ) ) ( not ( = ?auto_1408657 ?auto_1408662 ) ) ( not ( = ?auto_1408657 ?auto_1408663 ) ) ( not ( = ?auto_1408657 ?auto_1408664 ) ) ( not ( = ?auto_1408657 ?auto_1408665 ) ) ( not ( = ?auto_1408657 ?auto_1408666 ) ) ( not ( = ?auto_1408657 ?auto_1408667 ) ) ( not ( = ?auto_1408657 ?auto_1408668 ) ) ( not ( = ?auto_1408659 ?auto_1408660 ) ) ( not ( = ?auto_1408659 ?auto_1408661 ) ) ( not ( = ?auto_1408659 ?auto_1408662 ) ) ( not ( = ?auto_1408659 ?auto_1408663 ) ) ( not ( = ?auto_1408659 ?auto_1408664 ) ) ( not ( = ?auto_1408659 ?auto_1408665 ) ) ( not ( = ?auto_1408659 ?auto_1408666 ) ) ( not ( = ?auto_1408659 ?auto_1408667 ) ) ( not ( = ?auto_1408659 ?auto_1408668 ) ) ( not ( = ?auto_1408660 ?auto_1408661 ) ) ( not ( = ?auto_1408660 ?auto_1408662 ) ) ( not ( = ?auto_1408660 ?auto_1408663 ) ) ( not ( = ?auto_1408660 ?auto_1408664 ) ) ( not ( = ?auto_1408660 ?auto_1408665 ) ) ( not ( = ?auto_1408660 ?auto_1408666 ) ) ( not ( = ?auto_1408660 ?auto_1408667 ) ) ( not ( = ?auto_1408660 ?auto_1408668 ) ) ( not ( = ?auto_1408661 ?auto_1408662 ) ) ( not ( = ?auto_1408661 ?auto_1408663 ) ) ( not ( = ?auto_1408661 ?auto_1408664 ) ) ( not ( = ?auto_1408661 ?auto_1408665 ) ) ( not ( = ?auto_1408661 ?auto_1408666 ) ) ( not ( = ?auto_1408661 ?auto_1408667 ) ) ( not ( = ?auto_1408661 ?auto_1408668 ) ) ( not ( = ?auto_1408662 ?auto_1408663 ) ) ( not ( = ?auto_1408662 ?auto_1408664 ) ) ( not ( = ?auto_1408662 ?auto_1408665 ) ) ( not ( = ?auto_1408662 ?auto_1408666 ) ) ( not ( = ?auto_1408662 ?auto_1408667 ) ) ( not ( = ?auto_1408662 ?auto_1408668 ) ) ( not ( = ?auto_1408663 ?auto_1408664 ) ) ( not ( = ?auto_1408663 ?auto_1408665 ) ) ( not ( = ?auto_1408663 ?auto_1408666 ) ) ( not ( = ?auto_1408663 ?auto_1408667 ) ) ( not ( = ?auto_1408663 ?auto_1408668 ) ) ( not ( = ?auto_1408664 ?auto_1408665 ) ) ( not ( = ?auto_1408664 ?auto_1408666 ) ) ( not ( = ?auto_1408664 ?auto_1408667 ) ) ( not ( = ?auto_1408664 ?auto_1408668 ) ) ( not ( = ?auto_1408665 ?auto_1408666 ) ) ( not ( = ?auto_1408665 ?auto_1408667 ) ) ( not ( = ?auto_1408665 ?auto_1408668 ) ) ( not ( = ?auto_1408666 ?auto_1408667 ) ) ( not ( = ?auto_1408666 ?auto_1408668 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1408667 ?auto_1408668 )
      ( MAKE-14CRATE-VERIFY ?auto_1408654 ?auto_1408655 ?auto_1408656 ?auto_1408658 ?auto_1408657 ?auto_1408659 ?auto_1408660 ?auto_1408661 ?auto_1408662 ?auto_1408663 ?auto_1408664 ?auto_1408665 ?auto_1408666 ?auto_1408667 ?auto_1408668 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1408814 - SURFACE
      ?auto_1408815 - SURFACE
      ?auto_1408816 - SURFACE
      ?auto_1408818 - SURFACE
      ?auto_1408817 - SURFACE
      ?auto_1408819 - SURFACE
      ?auto_1408820 - SURFACE
      ?auto_1408821 - SURFACE
      ?auto_1408822 - SURFACE
      ?auto_1408823 - SURFACE
      ?auto_1408824 - SURFACE
      ?auto_1408825 - SURFACE
      ?auto_1408826 - SURFACE
      ?auto_1408827 - SURFACE
      ?auto_1408828 - SURFACE
    )
    :vars
    (
      ?auto_1408829 - HOIST
      ?auto_1408831 - PLACE
      ?auto_1408830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1408829 ?auto_1408831 ) ( SURFACE-AT ?auto_1408827 ?auto_1408831 ) ( CLEAR ?auto_1408827 ) ( IS-CRATE ?auto_1408828 ) ( not ( = ?auto_1408827 ?auto_1408828 ) ) ( TRUCK-AT ?auto_1408830 ?auto_1408831 ) ( AVAILABLE ?auto_1408829 ) ( IN ?auto_1408828 ?auto_1408830 ) ( ON ?auto_1408827 ?auto_1408826 ) ( not ( = ?auto_1408826 ?auto_1408827 ) ) ( not ( = ?auto_1408826 ?auto_1408828 ) ) ( ON ?auto_1408815 ?auto_1408814 ) ( ON ?auto_1408816 ?auto_1408815 ) ( ON ?auto_1408818 ?auto_1408816 ) ( ON ?auto_1408817 ?auto_1408818 ) ( ON ?auto_1408819 ?auto_1408817 ) ( ON ?auto_1408820 ?auto_1408819 ) ( ON ?auto_1408821 ?auto_1408820 ) ( ON ?auto_1408822 ?auto_1408821 ) ( ON ?auto_1408823 ?auto_1408822 ) ( ON ?auto_1408824 ?auto_1408823 ) ( ON ?auto_1408825 ?auto_1408824 ) ( ON ?auto_1408826 ?auto_1408825 ) ( not ( = ?auto_1408814 ?auto_1408815 ) ) ( not ( = ?auto_1408814 ?auto_1408816 ) ) ( not ( = ?auto_1408814 ?auto_1408818 ) ) ( not ( = ?auto_1408814 ?auto_1408817 ) ) ( not ( = ?auto_1408814 ?auto_1408819 ) ) ( not ( = ?auto_1408814 ?auto_1408820 ) ) ( not ( = ?auto_1408814 ?auto_1408821 ) ) ( not ( = ?auto_1408814 ?auto_1408822 ) ) ( not ( = ?auto_1408814 ?auto_1408823 ) ) ( not ( = ?auto_1408814 ?auto_1408824 ) ) ( not ( = ?auto_1408814 ?auto_1408825 ) ) ( not ( = ?auto_1408814 ?auto_1408826 ) ) ( not ( = ?auto_1408814 ?auto_1408827 ) ) ( not ( = ?auto_1408814 ?auto_1408828 ) ) ( not ( = ?auto_1408815 ?auto_1408816 ) ) ( not ( = ?auto_1408815 ?auto_1408818 ) ) ( not ( = ?auto_1408815 ?auto_1408817 ) ) ( not ( = ?auto_1408815 ?auto_1408819 ) ) ( not ( = ?auto_1408815 ?auto_1408820 ) ) ( not ( = ?auto_1408815 ?auto_1408821 ) ) ( not ( = ?auto_1408815 ?auto_1408822 ) ) ( not ( = ?auto_1408815 ?auto_1408823 ) ) ( not ( = ?auto_1408815 ?auto_1408824 ) ) ( not ( = ?auto_1408815 ?auto_1408825 ) ) ( not ( = ?auto_1408815 ?auto_1408826 ) ) ( not ( = ?auto_1408815 ?auto_1408827 ) ) ( not ( = ?auto_1408815 ?auto_1408828 ) ) ( not ( = ?auto_1408816 ?auto_1408818 ) ) ( not ( = ?auto_1408816 ?auto_1408817 ) ) ( not ( = ?auto_1408816 ?auto_1408819 ) ) ( not ( = ?auto_1408816 ?auto_1408820 ) ) ( not ( = ?auto_1408816 ?auto_1408821 ) ) ( not ( = ?auto_1408816 ?auto_1408822 ) ) ( not ( = ?auto_1408816 ?auto_1408823 ) ) ( not ( = ?auto_1408816 ?auto_1408824 ) ) ( not ( = ?auto_1408816 ?auto_1408825 ) ) ( not ( = ?auto_1408816 ?auto_1408826 ) ) ( not ( = ?auto_1408816 ?auto_1408827 ) ) ( not ( = ?auto_1408816 ?auto_1408828 ) ) ( not ( = ?auto_1408818 ?auto_1408817 ) ) ( not ( = ?auto_1408818 ?auto_1408819 ) ) ( not ( = ?auto_1408818 ?auto_1408820 ) ) ( not ( = ?auto_1408818 ?auto_1408821 ) ) ( not ( = ?auto_1408818 ?auto_1408822 ) ) ( not ( = ?auto_1408818 ?auto_1408823 ) ) ( not ( = ?auto_1408818 ?auto_1408824 ) ) ( not ( = ?auto_1408818 ?auto_1408825 ) ) ( not ( = ?auto_1408818 ?auto_1408826 ) ) ( not ( = ?auto_1408818 ?auto_1408827 ) ) ( not ( = ?auto_1408818 ?auto_1408828 ) ) ( not ( = ?auto_1408817 ?auto_1408819 ) ) ( not ( = ?auto_1408817 ?auto_1408820 ) ) ( not ( = ?auto_1408817 ?auto_1408821 ) ) ( not ( = ?auto_1408817 ?auto_1408822 ) ) ( not ( = ?auto_1408817 ?auto_1408823 ) ) ( not ( = ?auto_1408817 ?auto_1408824 ) ) ( not ( = ?auto_1408817 ?auto_1408825 ) ) ( not ( = ?auto_1408817 ?auto_1408826 ) ) ( not ( = ?auto_1408817 ?auto_1408827 ) ) ( not ( = ?auto_1408817 ?auto_1408828 ) ) ( not ( = ?auto_1408819 ?auto_1408820 ) ) ( not ( = ?auto_1408819 ?auto_1408821 ) ) ( not ( = ?auto_1408819 ?auto_1408822 ) ) ( not ( = ?auto_1408819 ?auto_1408823 ) ) ( not ( = ?auto_1408819 ?auto_1408824 ) ) ( not ( = ?auto_1408819 ?auto_1408825 ) ) ( not ( = ?auto_1408819 ?auto_1408826 ) ) ( not ( = ?auto_1408819 ?auto_1408827 ) ) ( not ( = ?auto_1408819 ?auto_1408828 ) ) ( not ( = ?auto_1408820 ?auto_1408821 ) ) ( not ( = ?auto_1408820 ?auto_1408822 ) ) ( not ( = ?auto_1408820 ?auto_1408823 ) ) ( not ( = ?auto_1408820 ?auto_1408824 ) ) ( not ( = ?auto_1408820 ?auto_1408825 ) ) ( not ( = ?auto_1408820 ?auto_1408826 ) ) ( not ( = ?auto_1408820 ?auto_1408827 ) ) ( not ( = ?auto_1408820 ?auto_1408828 ) ) ( not ( = ?auto_1408821 ?auto_1408822 ) ) ( not ( = ?auto_1408821 ?auto_1408823 ) ) ( not ( = ?auto_1408821 ?auto_1408824 ) ) ( not ( = ?auto_1408821 ?auto_1408825 ) ) ( not ( = ?auto_1408821 ?auto_1408826 ) ) ( not ( = ?auto_1408821 ?auto_1408827 ) ) ( not ( = ?auto_1408821 ?auto_1408828 ) ) ( not ( = ?auto_1408822 ?auto_1408823 ) ) ( not ( = ?auto_1408822 ?auto_1408824 ) ) ( not ( = ?auto_1408822 ?auto_1408825 ) ) ( not ( = ?auto_1408822 ?auto_1408826 ) ) ( not ( = ?auto_1408822 ?auto_1408827 ) ) ( not ( = ?auto_1408822 ?auto_1408828 ) ) ( not ( = ?auto_1408823 ?auto_1408824 ) ) ( not ( = ?auto_1408823 ?auto_1408825 ) ) ( not ( = ?auto_1408823 ?auto_1408826 ) ) ( not ( = ?auto_1408823 ?auto_1408827 ) ) ( not ( = ?auto_1408823 ?auto_1408828 ) ) ( not ( = ?auto_1408824 ?auto_1408825 ) ) ( not ( = ?auto_1408824 ?auto_1408826 ) ) ( not ( = ?auto_1408824 ?auto_1408827 ) ) ( not ( = ?auto_1408824 ?auto_1408828 ) ) ( not ( = ?auto_1408825 ?auto_1408826 ) ) ( not ( = ?auto_1408825 ?auto_1408827 ) ) ( not ( = ?auto_1408825 ?auto_1408828 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1408826 ?auto_1408827 ?auto_1408828 )
      ( MAKE-14CRATE-VERIFY ?auto_1408814 ?auto_1408815 ?auto_1408816 ?auto_1408818 ?auto_1408817 ?auto_1408819 ?auto_1408820 ?auto_1408821 ?auto_1408822 ?auto_1408823 ?auto_1408824 ?auto_1408825 ?auto_1408826 ?auto_1408827 ?auto_1408828 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1408989 - SURFACE
      ?auto_1408990 - SURFACE
      ?auto_1408991 - SURFACE
      ?auto_1408993 - SURFACE
      ?auto_1408992 - SURFACE
      ?auto_1408994 - SURFACE
      ?auto_1408995 - SURFACE
      ?auto_1408996 - SURFACE
      ?auto_1408997 - SURFACE
      ?auto_1408998 - SURFACE
      ?auto_1408999 - SURFACE
      ?auto_1409000 - SURFACE
      ?auto_1409001 - SURFACE
      ?auto_1409002 - SURFACE
      ?auto_1409003 - SURFACE
    )
    :vars
    (
      ?auto_1409006 - HOIST
      ?auto_1409005 - PLACE
      ?auto_1409007 - TRUCK
      ?auto_1409004 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1409006 ?auto_1409005 ) ( SURFACE-AT ?auto_1409002 ?auto_1409005 ) ( CLEAR ?auto_1409002 ) ( IS-CRATE ?auto_1409003 ) ( not ( = ?auto_1409002 ?auto_1409003 ) ) ( AVAILABLE ?auto_1409006 ) ( IN ?auto_1409003 ?auto_1409007 ) ( ON ?auto_1409002 ?auto_1409001 ) ( not ( = ?auto_1409001 ?auto_1409002 ) ) ( not ( = ?auto_1409001 ?auto_1409003 ) ) ( TRUCK-AT ?auto_1409007 ?auto_1409004 ) ( not ( = ?auto_1409004 ?auto_1409005 ) ) ( ON ?auto_1408990 ?auto_1408989 ) ( ON ?auto_1408991 ?auto_1408990 ) ( ON ?auto_1408993 ?auto_1408991 ) ( ON ?auto_1408992 ?auto_1408993 ) ( ON ?auto_1408994 ?auto_1408992 ) ( ON ?auto_1408995 ?auto_1408994 ) ( ON ?auto_1408996 ?auto_1408995 ) ( ON ?auto_1408997 ?auto_1408996 ) ( ON ?auto_1408998 ?auto_1408997 ) ( ON ?auto_1408999 ?auto_1408998 ) ( ON ?auto_1409000 ?auto_1408999 ) ( ON ?auto_1409001 ?auto_1409000 ) ( not ( = ?auto_1408989 ?auto_1408990 ) ) ( not ( = ?auto_1408989 ?auto_1408991 ) ) ( not ( = ?auto_1408989 ?auto_1408993 ) ) ( not ( = ?auto_1408989 ?auto_1408992 ) ) ( not ( = ?auto_1408989 ?auto_1408994 ) ) ( not ( = ?auto_1408989 ?auto_1408995 ) ) ( not ( = ?auto_1408989 ?auto_1408996 ) ) ( not ( = ?auto_1408989 ?auto_1408997 ) ) ( not ( = ?auto_1408989 ?auto_1408998 ) ) ( not ( = ?auto_1408989 ?auto_1408999 ) ) ( not ( = ?auto_1408989 ?auto_1409000 ) ) ( not ( = ?auto_1408989 ?auto_1409001 ) ) ( not ( = ?auto_1408989 ?auto_1409002 ) ) ( not ( = ?auto_1408989 ?auto_1409003 ) ) ( not ( = ?auto_1408990 ?auto_1408991 ) ) ( not ( = ?auto_1408990 ?auto_1408993 ) ) ( not ( = ?auto_1408990 ?auto_1408992 ) ) ( not ( = ?auto_1408990 ?auto_1408994 ) ) ( not ( = ?auto_1408990 ?auto_1408995 ) ) ( not ( = ?auto_1408990 ?auto_1408996 ) ) ( not ( = ?auto_1408990 ?auto_1408997 ) ) ( not ( = ?auto_1408990 ?auto_1408998 ) ) ( not ( = ?auto_1408990 ?auto_1408999 ) ) ( not ( = ?auto_1408990 ?auto_1409000 ) ) ( not ( = ?auto_1408990 ?auto_1409001 ) ) ( not ( = ?auto_1408990 ?auto_1409002 ) ) ( not ( = ?auto_1408990 ?auto_1409003 ) ) ( not ( = ?auto_1408991 ?auto_1408993 ) ) ( not ( = ?auto_1408991 ?auto_1408992 ) ) ( not ( = ?auto_1408991 ?auto_1408994 ) ) ( not ( = ?auto_1408991 ?auto_1408995 ) ) ( not ( = ?auto_1408991 ?auto_1408996 ) ) ( not ( = ?auto_1408991 ?auto_1408997 ) ) ( not ( = ?auto_1408991 ?auto_1408998 ) ) ( not ( = ?auto_1408991 ?auto_1408999 ) ) ( not ( = ?auto_1408991 ?auto_1409000 ) ) ( not ( = ?auto_1408991 ?auto_1409001 ) ) ( not ( = ?auto_1408991 ?auto_1409002 ) ) ( not ( = ?auto_1408991 ?auto_1409003 ) ) ( not ( = ?auto_1408993 ?auto_1408992 ) ) ( not ( = ?auto_1408993 ?auto_1408994 ) ) ( not ( = ?auto_1408993 ?auto_1408995 ) ) ( not ( = ?auto_1408993 ?auto_1408996 ) ) ( not ( = ?auto_1408993 ?auto_1408997 ) ) ( not ( = ?auto_1408993 ?auto_1408998 ) ) ( not ( = ?auto_1408993 ?auto_1408999 ) ) ( not ( = ?auto_1408993 ?auto_1409000 ) ) ( not ( = ?auto_1408993 ?auto_1409001 ) ) ( not ( = ?auto_1408993 ?auto_1409002 ) ) ( not ( = ?auto_1408993 ?auto_1409003 ) ) ( not ( = ?auto_1408992 ?auto_1408994 ) ) ( not ( = ?auto_1408992 ?auto_1408995 ) ) ( not ( = ?auto_1408992 ?auto_1408996 ) ) ( not ( = ?auto_1408992 ?auto_1408997 ) ) ( not ( = ?auto_1408992 ?auto_1408998 ) ) ( not ( = ?auto_1408992 ?auto_1408999 ) ) ( not ( = ?auto_1408992 ?auto_1409000 ) ) ( not ( = ?auto_1408992 ?auto_1409001 ) ) ( not ( = ?auto_1408992 ?auto_1409002 ) ) ( not ( = ?auto_1408992 ?auto_1409003 ) ) ( not ( = ?auto_1408994 ?auto_1408995 ) ) ( not ( = ?auto_1408994 ?auto_1408996 ) ) ( not ( = ?auto_1408994 ?auto_1408997 ) ) ( not ( = ?auto_1408994 ?auto_1408998 ) ) ( not ( = ?auto_1408994 ?auto_1408999 ) ) ( not ( = ?auto_1408994 ?auto_1409000 ) ) ( not ( = ?auto_1408994 ?auto_1409001 ) ) ( not ( = ?auto_1408994 ?auto_1409002 ) ) ( not ( = ?auto_1408994 ?auto_1409003 ) ) ( not ( = ?auto_1408995 ?auto_1408996 ) ) ( not ( = ?auto_1408995 ?auto_1408997 ) ) ( not ( = ?auto_1408995 ?auto_1408998 ) ) ( not ( = ?auto_1408995 ?auto_1408999 ) ) ( not ( = ?auto_1408995 ?auto_1409000 ) ) ( not ( = ?auto_1408995 ?auto_1409001 ) ) ( not ( = ?auto_1408995 ?auto_1409002 ) ) ( not ( = ?auto_1408995 ?auto_1409003 ) ) ( not ( = ?auto_1408996 ?auto_1408997 ) ) ( not ( = ?auto_1408996 ?auto_1408998 ) ) ( not ( = ?auto_1408996 ?auto_1408999 ) ) ( not ( = ?auto_1408996 ?auto_1409000 ) ) ( not ( = ?auto_1408996 ?auto_1409001 ) ) ( not ( = ?auto_1408996 ?auto_1409002 ) ) ( not ( = ?auto_1408996 ?auto_1409003 ) ) ( not ( = ?auto_1408997 ?auto_1408998 ) ) ( not ( = ?auto_1408997 ?auto_1408999 ) ) ( not ( = ?auto_1408997 ?auto_1409000 ) ) ( not ( = ?auto_1408997 ?auto_1409001 ) ) ( not ( = ?auto_1408997 ?auto_1409002 ) ) ( not ( = ?auto_1408997 ?auto_1409003 ) ) ( not ( = ?auto_1408998 ?auto_1408999 ) ) ( not ( = ?auto_1408998 ?auto_1409000 ) ) ( not ( = ?auto_1408998 ?auto_1409001 ) ) ( not ( = ?auto_1408998 ?auto_1409002 ) ) ( not ( = ?auto_1408998 ?auto_1409003 ) ) ( not ( = ?auto_1408999 ?auto_1409000 ) ) ( not ( = ?auto_1408999 ?auto_1409001 ) ) ( not ( = ?auto_1408999 ?auto_1409002 ) ) ( not ( = ?auto_1408999 ?auto_1409003 ) ) ( not ( = ?auto_1409000 ?auto_1409001 ) ) ( not ( = ?auto_1409000 ?auto_1409002 ) ) ( not ( = ?auto_1409000 ?auto_1409003 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1409001 ?auto_1409002 ?auto_1409003 )
      ( MAKE-14CRATE-VERIFY ?auto_1408989 ?auto_1408990 ?auto_1408991 ?auto_1408993 ?auto_1408992 ?auto_1408994 ?auto_1408995 ?auto_1408996 ?auto_1408997 ?auto_1408998 ?auto_1408999 ?auto_1409000 ?auto_1409001 ?auto_1409002 ?auto_1409003 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1409178 - SURFACE
      ?auto_1409179 - SURFACE
      ?auto_1409180 - SURFACE
      ?auto_1409182 - SURFACE
      ?auto_1409181 - SURFACE
      ?auto_1409183 - SURFACE
      ?auto_1409184 - SURFACE
      ?auto_1409185 - SURFACE
      ?auto_1409186 - SURFACE
      ?auto_1409187 - SURFACE
      ?auto_1409188 - SURFACE
      ?auto_1409189 - SURFACE
      ?auto_1409190 - SURFACE
      ?auto_1409191 - SURFACE
      ?auto_1409192 - SURFACE
    )
    :vars
    (
      ?auto_1409195 - HOIST
      ?auto_1409197 - PLACE
      ?auto_1409196 - TRUCK
      ?auto_1409194 - PLACE
      ?auto_1409193 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1409195 ?auto_1409197 ) ( SURFACE-AT ?auto_1409191 ?auto_1409197 ) ( CLEAR ?auto_1409191 ) ( IS-CRATE ?auto_1409192 ) ( not ( = ?auto_1409191 ?auto_1409192 ) ) ( AVAILABLE ?auto_1409195 ) ( ON ?auto_1409191 ?auto_1409190 ) ( not ( = ?auto_1409190 ?auto_1409191 ) ) ( not ( = ?auto_1409190 ?auto_1409192 ) ) ( TRUCK-AT ?auto_1409196 ?auto_1409194 ) ( not ( = ?auto_1409194 ?auto_1409197 ) ) ( HOIST-AT ?auto_1409193 ?auto_1409194 ) ( LIFTING ?auto_1409193 ?auto_1409192 ) ( not ( = ?auto_1409195 ?auto_1409193 ) ) ( ON ?auto_1409179 ?auto_1409178 ) ( ON ?auto_1409180 ?auto_1409179 ) ( ON ?auto_1409182 ?auto_1409180 ) ( ON ?auto_1409181 ?auto_1409182 ) ( ON ?auto_1409183 ?auto_1409181 ) ( ON ?auto_1409184 ?auto_1409183 ) ( ON ?auto_1409185 ?auto_1409184 ) ( ON ?auto_1409186 ?auto_1409185 ) ( ON ?auto_1409187 ?auto_1409186 ) ( ON ?auto_1409188 ?auto_1409187 ) ( ON ?auto_1409189 ?auto_1409188 ) ( ON ?auto_1409190 ?auto_1409189 ) ( not ( = ?auto_1409178 ?auto_1409179 ) ) ( not ( = ?auto_1409178 ?auto_1409180 ) ) ( not ( = ?auto_1409178 ?auto_1409182 ) ) ( not ( = ?auto_1409178 ?auto_1409181 ) ) ( not ( = ?auto_1409178 ?auto_1409183 ) ) ( not ( = ?auto_1409178 ?auto_1409184 ) ) ( not ( = ?auto_1409178 ?auto_1409185 ) ) ( not ( = ?auto_1409178 ?auto_1409186 ) ) ( not ( = ?auto_1409178 ?auto_1409187 ) ) ( not ( = ?auto_1409178 ?auto_1409188 ) ) ( not ( = ?auto_1409178 ?auto_1409189 ) ) ( not ( = ?auto_1409178 ?auto_1409190 ) ) ( not ( = ?auto_1409178 ?auto_1409191 ) ) ( not ( = ?auto_1409178 ?auto_1409192 ) ) ( not ( = ?auto_1409179 ?auto_1409180 ) ) ( not ( = ?auto_1409179 ?auto_1409182 ) ) ( not ( = ?auto_1409179 ?auto_1409181 ) ) ( not ( = ?auto_1409179 ?auto_1409183 ) ) ( not ( = ?auto_1409179 ?auto_1409184 ) ) ( not ( = ?auto_1409179 ?auto_1409185 ) ) ( not ( = ?auto_1409179 ?auto_1409186 ) ) ( not ( = ?auto_1409179 ?auto_1409187 ) ) ( not ( = ?auto_1409179 ?auto_1409188 ) ) ( not ( = ?auto_1409179 ?auto_1409189 ) ) ( not ( = ?auto_1409179 ?auto_1409190 ) ) ( not ( = ?auto_1409179 ?auto_1409191 ) ) ( not ( = ?auto_1409179 ?auto_1409192 ) ) ( not ( = ?auto_1409180 ?auto_1409182 ) ) ( not ( = ?auto_1409180 ?auto_1409181 ) ) ( not ( = ?auto_1409180 ?auto_1409183 ) ) ( not ( = ?auto_1409180 ?auto_1409184 ) ) ( not ( = ?auto_1409180 ?auto_1409185 ) ) ( not ( = ?auto_1409180 ?auto_1409186 ) ) ( not ( = ?auto_1409180 ?auto_1409187 ) ) ( not ( = ?auto_1409180 ?auto_1409188 ) ) ( not ( = ?auto_1409180 ?auto_1409189 ) ) ( not ( = ?auto_1409180 ?auto_1409190 ) ) ( not ( = ?auto_1409180 ?auto_1409191 ) ) ( not ( = ?auto_1409180 ?auto_1409192 ) ) ( not ( = ?auto_1409182 ?auto_1409181 ) ) ( not ( = ?auto_1409182 ?auto_1409183 ) ) ( not ( = ?auto_1409182 ?auto_1409184 ) ) ( not ( = ?auto_1409182 ?auto_1409185 ) ) ( not ( = ?auto_1409182 ?auto_1409186 ) ) ( not ( = ?auto_1409182 ?auto_1409187 ) ) ( not ( = ?auto_1409182 ?auto_1409188 ) ) ( not ( = ?auto_1409182 ?auto_1409189 ) ) ( not ( = ?auto_1409182 ?auto_1409190 ) ) ( not ( = ?auto_1409182 ?auto_1409191 ) ) ( not ( = ?auto_1409182 ?auto_1409192 ) ) ( not ( = ?auto_1409181 ?auto_1409183 ) ) ( not ( = ?auto_1409181 ?auto_1409184 ) ) ( not ( = ?auto_1409181 ?auto_1409185 ) ) ( not ( = ?auto_1409181 ?auto_1409186 ) ) ( not ( = ?auto_1409181 ?auto_1409187 ) ) ( not ( = ?auto_1409181 ?auto_1409188 ) ) ( not ( = ?auto_1409181 ?auto_1409189 ) ) ( not ( = ?auto_1409181 ?auto_1409190 ) ) ( not ( = ?auto_1409181 ?auto_1409191 ) ) ( not ( = ?auto_1409181 ?auto_1409192 ) ) ( not ( = ?auto_1409183 ?auto_1409184 ) ) ( not ( = ?auto_1409183 ?auto_1409185 ) ) ( not ( = ?auto_1409183 ?auto_1409186 ) ) ( not ( = ?auto_1409183 ?auto_1409187 ) ) ( not ( = ?auto_1409183 ?auto_1409188 ) ) ( not ( = ?auto_1409183 ?auto_1409189 ) ) ( not ( = ?auto_1409183 ?auto_1409190 ) ) ( not ( = ?auto_1409183 ?auto_1409191 ) ) ( not ( = ?auto_1409183 ?auto_1409192 ) ) ( not ( = ?auto_1409184 ?auto_1409185 ) ) ( not ( = ?auto_1409184 ?auto_1409186 ) ) ( not ( = ?auto_1409184 ?auto_1409187 ) ) ( not ( = ?auto_1409184 ?auto_1409188 ) ) ( not ( = ?auto_1409184 ?auto_1409189 ) ) ( not ( = ?auto_1409184 ?auto_1409190 ) ) ( not ( = ?auto_1409184 ?auto_1409191 ) ) ( not ( = ?auto_1409184 ?auto_1409192 ) ) ( not ( = ?auto_1409185 ?auto_1409186 ) ) ( not ( = ?auto_1409185 ?auto_1409187 ) ) ( not ( = ?auto_1409185 ?auto_1409188 ) ) ( not ( = ?auto_1409185 ?auto_1409189 ) ) ( not ( = ?auto_1409185 ?auto_1409190 ) ) ( not ( = ?auto_1409185 ?auto_1409191 ) ) ( not ( = ?auto_1409185 ?auto_1409192 ) ) ( not ( = ?auto_1409186 ?auto_1409187 ) ) ( not ( = ?auto_1409186 ?auto_1409188 ) ) ( not ( = ?auto_1409186 ?auto_1409189 ) ) ( not ( = ?auto_1409186 ?auto_1409190 ) ) ( not ( = ?auto_1409186 ?auto_1409191 ) ) ( not ( = ?auto_1409186 ?auto_1409192 ) ) ( not ( = ?auto_1409187 ?auto_1409188 ) ) ( not ( = ?auto_1409187 ?auto_1409189 ) ) ( not ( = ?auto_1409187 ?auto_1409190 ) ) ( not ( = ?auto_1409187 ?auto_1409191 ) ) ( not ( = ?auto_1409187 ?auto_1409192 ) ) ( not ( = ?auto_1409188 ?auto_1409189 ) ) ( not ( = ?auto_1409188 ?auto_1409190 ) ) ( not ( = ?auto_1409188 ?auto_1409191 ) ) ( not ( = ?auto_1409188 ?auto_1409192 ) ) ( not ( = ?auto_1409189 ?auto_1409190 ) ) ( not ( = ?auto_1409189 ?auto_1409191 ) ) ( not ( = ?auto_1409189 ?auto_1409192 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1409190 ?auto_1409191 ?auto_1409192 )
      ( MAKE-14CRATE-VERIFY ?auto_1409178 ?auto_1409179 ?auto_1409180 ?auto_1409182 ?auto_1409181 ?auto_1409183 ?auto_1409184 ?auto_1409185 ?auto_1409186 ?auto_1409187 ?auto_1409188 ?auto_1409189 ?auto_1409190 ?auto_1409191 ?auto_1409192 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1409381 - SURFACE
      ?auto_1409382 - SURFACE
      ?auto_1409383 - SURFACE
      ?auto_1409385 - SURFACE
      ?auto_1409384 - SURFACE
      ?auto_1409386 - SURFACE
      ?auto_1409387 - SURFACE
      ?auto_1409388 - SURFACE
      ?auto_1409389 - SURFACE
      ?auto_1409390 - SURFACE
      ?auto_1409391 - SURFACE
      ?auto_1409392 - SURFACE
      ?auto_1409393 - SURFACE
      ?auto_1409394 - SURFACE
      ?auto_1409395 - SURFACE
    )
    :vars
    (
      ?auto_1409398 - HOIST
      ?auto_1409399 - PLACE
      ?auto_1409401 - TRUCK
      ?auto_1409400 - PLACE
      ?auto_1409397 - HOIST
      ?auto_1409396 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1409398 ?auto_1409399 ) ( SURFACE-AT ?auto_1409394 ?auto_1409399 ) ( CLEAR ?auto_1409394 ) ( IS-CRATE ?auto_1409395 ) ( not ( = ?auto_1409394 ?auto_1409395 ) ) ( AVAILABLE ?auto_1409398 ) ( ON ?auto_1409394 ?auto_1409393 ) ( not ( = ?auto_1409393 ?auto_1409394 ) ) ( not ( = ?auto_1409393 ?auto_1409395 ) ) ( TRUCK-AT ?auto_1409401 ?auto_1409400 ) ( not ( = ?auto_1409400 ?auto_1409399 ) ) ( HOIST-AT ?auto_1409397 ?auto_1409400 ) ( not ( = ?auto_1409398 ?auto_1409397 ) ) ( AVAILABLE ?auto_1409397 ) ( SURFACE-AT ?auto_1409395 ?auto_1409400 ) ( ON ?auto_1409395 ?auto_1409396 ) ( CLEAR ?auto_1409395 ) ( not ( = ?auto_1409394 ?auto_1409396 ) ) ( not ( = ?auto_1409395 ?auto_1409396 ) ) ( not ( = ?auto_1409393 ?auto_1409396 ) ) ( ON ?auto_1409382 ?auto_1409381 ) ( ON ?auto_1409383 ?auto_1409382 ) ( ON ?auto_1409385 ?auto_1409383 ) ( ON ?auto_1409384 ?auto_1409385 ) ( ON ?auto_1409386 ?auto_1409384 ) ( ON ?auto_1409387 ?auto_1409386 ) ( ON ?auto_1409388 ?auto_1409387 ) ( ON ?auto_1409389 ?auto_1409388 ) ( ON ?auto_1409390 ?auto_1409389 ) ( ON ?auto_1409391 ?auto_1409390 ) ( ON ?auto_1409392 ?auto_1409391 ) ( ON ?auto_1409393 ?auto_1409392 ) ( not ( = ?auto_1409381 ?auto_1409382 ) ) ( not ( = ?auto_1409381 ?auto_1409383 ) ) ( not ( = ?auto_1409381 ?auto_1409385 ) ) ( not ( = ?auto_1409381 ?auto_1409384 ) ) ( not ( = ?auto_1409381 ?auto_1409386 ) ) ( not ( = ?auto_1409381 ?auto_1409387 ) ) ( not ( = ?auto_1409381 ?auto_1409388 ) ) ( not ( = ?auto_1409381 ?auto_1409389 ) ) ( not ( = ?auto_1409381 ?auto_1409390 ) ) ( not ( = ?auto_1409381 ?auto_1409391 ) ) ( not ( = ?auto_1409381 ?auto_1409392 ) ) ( not ( = ?auto_1409381 ?auto_1409393 ) ) ( not ( = ?auto_1409381 ?auto_1409394 ) ) ( not ( = ?auto_1409381 ?auto_1409395 ) ) ( not ( = ?auto_1409381 ?auto_1409396 ) ) ( not ( = ?auto_1409382 ?auto_1409383 ) ) ( not ( = ?auto_1409382 ?auto_1409385 ) ) ( not ( = ?auto_1409382 ?auto_1409384 ) ) ( not ( = ?auto_1409382 ?auto_1409386 ) ) ( not ( = ?auto_1409382 ?auto_1409387 ) ) ( not ( = ?auto_1409382 ?auto_1409388 ) ) ( not ( = ?auto_1409382 ?auto_1409389 ) ) ( not ( = ?auto_1409382 ?auto_1409390 ) ) ( not ( = ?auto_1409382 ?auto_1409391 ) ) ( not ( = ?auto_1409382 ?auto_1409392 ) ) ( not ( = ?auto_1409382 ?auto_1409393 ) ) ( not ( = ?auto_1409382 ?auto_1409394 ) ) ( not ( = ?auto_1409382 ?auto_1409395 ) ) ( not ( = ?auto_1409382 ?auto_1409396 ) ) ( not ( = ?auto_1409383 ?auto_1409385 ) ) ( not ( = ?auto_1409383 ?auto_1409384 ) ) ( not ( = ?auto_1409383 ?auto_1409386 ) ) ( not ( = ?auto_1409383 ?auto_1409387 ) ) ( not ( = ?auto_1409383 ?auto_1409388 ) ) ( not ( = ?auto_1409383 ?auto_1409389 ) ) ( not ( = ?auto_1409383 ?auto_1409390 ) ) ( not ( = ?auto_1409383 ?auto_1409391 ) ) ( not ( = ?auto_1409383 ?auto_1409392 ) ) ( not ( = ?auto_1409383 ?auto_1409393 ) ) ( not ( = ?auto_1409383 ?auto_1409394 ) ) ( not ( = ?auto_1409383 ?auto_1409395 ) ) ( not ( = ?auto_1409383 ?auto_1409396 ) ) ( not ( = ?auto_1409385 ?auto_1409384 ) ) ( not ( = ?auto_1409385 ?auto_1409386 ) ) ( not ( = ?auto_1409385 ?auto_1409387 ) ) ( not ( = ?auto_1409385 ?auto_1409388 ) ) ( not ( = ?auto_1409385 ?auto_1409389 ) ) ( not ( = ?auto_1409385 ?auto_1409390 ) ) ( not ( = ?auto_1409385 ?auto_1409391 ) ) ( not ( = ?auto_1409385 ?auto_1409392 ) ) ( not ( = ?auto_1409385 ?auto_1409393 ) ) ( not ( = ?auto_1409385 ?auto_1409394 ) ) ( not ( = ?auto_1409385 ?auto_1409395 ) ) ( not ( = ?auto_1409385 ?auto_1409396 ) ) ( not ( = ?auto_1409384 ?auto_1409386 ) ) ( not ( = ?auto_1409384 ?auto_1409387 ) ) ( not ( = ?auto_1409384 ?auto_1409388 ) ) ( not ( = ?auto_1409384 ?auto_1409389 ) ) ( not ( = ?auto_1409384 ?auto_1409390 ) ) ( not ( = ?auto_1409384 ?auto_1409391 ) ) ( not ( = ?auto_1409384 ?auto_1409392 ) ) ( not ( = ?auto_1409384 ?auto_1409393 ) ) ( not ( = ?auto_1409384 ?auto_1409394 ) ) ( not ( = ?auto_1409384 ?auto_1409395 ) ) ( not ( = ?auto_1409384 ?auto_1409396 ) ) ( not ( = ?auto_1409386 ?auto_1409387 ) ) ( not ( = ?auto_1409386 ?auto_1409388 ) ) ( not ( = ?auto_1409386 ?auto_1409389 ) ) ( not ( = ?auto_1409386 ?auto_1409390 ) ) ( not ( = ?auto_1409386 ?auto_1409391 ) ) ( not ( = ?auto_1409386 ?auto_1409392 ) ) ( not ( = ?auto_1409386 ?auto_1409393 ) ) ( not ( = ?auto_1409386 ?auto_1409394 ) ) ( not ( = ?auto_1409386 ?auto_1409395 ) ) ( not ( = ?auto_1409386 ?auto_1409396 ) ) ( not ( = ?auto_1409387 ?auto_1409388 ) ) ( not ( = ?auto_1409387 ?auto_1409389 ) ) ( not ( = ?auto_1409387 ?auto_1409390 ) ) ( not ( = ?auto_1409387 ?auto_1409391 ) ) ( not ( = ?auto_1409387 ?auto_1409392 ) ) ( not ( = ?auto_1409387 ?auto_1409393 ) ) ( not ( = ?auto_1409387 ?auto_1409394 ) ) ( not ( = ?auto_1409387 ?auto_1409395 ) ) ( not ( = ?auto_1409387 ?auto_1409396 ) ) ( not ( = ?auto_1409388 ?auto_1409389 ) ) ( not ( = ?auto_1409388 ?auto_1409390 ) ) ( not ( = ?auto_1409388 ?auto_1409391 ) ) ( not ( = ?auto_1409388 ?auto_1409392 ) ) ( not ( = ?auto_1409388 ?auto_1409393 ) ) ( not ( = ?auto_1409388 ?auto_1409394 ) ) ( not ( = ?auto_1409388 ?auto_1409395 ) ) ( not ( = ?auto_1409388 ?auto_1409396 ) ) ( not ( = ?auto_1409389 ?auto_1409390 ) ) ( not ( = ?auto_1409389 ?auto_1409391 ) ) ( not ( = ?auto_1409389 ?auto_1409392 ) ) ( not ( = ?auto_1409389 ?auto_1409393 ) ) ( not ( = ?auto_1409389 ?auto_1409394 ) ) ( not ( = ?auto_1409389 ?auto_1409395 ) ) ( not ( = ?auto_1409389 ?auto_1409396 ) ) ( not ( = ?auto_1409390 ?auto_1409391 ) ) ( not ( = ?auto_1409390 ?auto_1409392 ) ) ( not ( = ?auto_1409390 ?auto_1409393 ) ) ( not ( = ?auto_1409390 ?auto_1409394 ) ) ( not ( = ?auto_1409390 ?auto_1409395 ) ) ( not ( = ?auto_1409390 ?auto_1409396 ) ) ( not ( = ?auto_1409391 ?auto_1409392 ) ) ( not ( = ?auto_1409391 ?auto_1409393 ) ) ( not ( = ?auto_1409391 ?auto_1409394 ) ) ( not ( = ?auto_1409391 ?auto_1409395 ) ) ( not ( = ?auto_1409391 ?auto_1409396 ) ) ( not ( = ?auto_1409392 ?auto_1409393 ) ) ( not ( = ?auto_1409392 ?auto_1409394 ) ) ( not ( = ?auto_1409392 ?auto_1409395 ) ) ( not ( = ?auto_1409392 ?auto_1409396 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1409393 ?auto_1409394 ?auto_1409395 )
      ( MAKE-14CRATE-VERIFY ?auto_1409381 ?auto_1409382 ?auto_1409383 ?auto_1409385 ?auto_1409384 ?auto_1409386 ?auto_1409387 ?auto_1409388 ?auto_1409389 ?auto_1409390 ?auto_1409391 ?auto_1409392 ?auto_1409393 ?auto_1409394 ?auto_1409395 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1409585 - SURFACE
      ?auto_1409586 - SURFACE
      ?auto_1409587 - SURFACE
      ?auto_1409589 - SURFACE
      ?auto_1409588 - SURFACE
      ?auto_1409590 - SURFACE
      ?auto_1409591 - SURFACE
      ?auto_1409592 - SURFACE
      ?auto_1409593 - SURFACE
      ?auto_1409594 - SURFACE
      ?auto_1409595 - SURFACE
      ?auto_1409596 - SURFACE
      ?auto_1409597 - SURFACE
      ?auto_1409598 - SURFACE
      ?auto_1409599 - SURFACE
    )
    :vars
    (
      ?auto_1409602 - HOIST
      ?auto_1409600 - PLACE
      ?auto_1409605 - PLACE
      ?auto_1409601 - HOIST
      ?auto_1409604 - SURFACE
      ?auto_1409603 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1409602 ?auto_1409600 ) ( SURFACE-AT ?auto_1409598 ?auto_1409600 ) ( CLEAR ?auto_1409598 ) ( IS-CRATE ?auto_1409599 ) ( not ( = ?auto_1409598 ?auto_1409599 ) ) ( AVAILABLE ?auto_1409602 ) ( ON ?auto_1409598 ?auto_1409597 ) ( not ( = ?auto_1409597 ?auto_1409598 ) ) ( not ( = ?auto_1409597 ?auto_1409599 ) ) ( not ( = ?auto_1409605 ?auto_1409600 ) ) ( HOIST-AT ?auto_1409601 ?auto_1409605 ) ( not ( = ?auto_1409602 ?auto_1409601 ) ) ( AVAILABLE ?auto_1409601 ) ( SURFACE-AT ?auto_1409599 ?auto_1409605 ) ( ON ?auto_1409599 ?auto_1409604 ) ( CLEAR ?auto_1409599 ) ( not ( = ?auto_1409598 ?auto_1409604 ) ) ( not ( = ?auto_1409599 ?auto_1409604 ) ) ( not ( = ?auto_1409597 ?auto_1409604 ) ) ( TRUCK-AT ?auto_1409603 ?auto_1409600 ) ( ON ?auto_1409586 ?auto_1409585 ) ( ON ?auto_1409587 ?auto_1409586 ) ( ON ?auto_1409589 ?auto_1409587 ) ( ON ?auto_1409588 ?auto_1409589 ) ( ON ?auto_1409590 ?auto_1409588 ) ( ON ?auto_1409591 ?auto_1409590 ) ( ON ?auto_1409592 ?auto_1409591 ) ( ON ?auto_1409593 ?auto_1409592 ) ( ON ?auto_1409594 ?auto_1409593 ) ( ON ?auto_1409595 ?auto_1409594 ) ( ON ?auto_1409596 ?auto_1409595 ) ( ON ?auto_1409597 ?auto_1409596 ) ( not ( = ?auto_1409585 ?auto_1409586 ) ) ( not ( = ?auto_1409585 ?auto_1409587 ) ) ( not ( = ?auto_1409585 ?auto_1409589 ) ) ( not ( = ?auto_1409585 ?auto_1409588 ) ) ( not ( = ?auto_1409585 ?auto_1409590 ) ) ( not ( = ?auto_1409585 ?auto_1409591 ) ) ( not ( = ?auto_1409585 ?auto_1409592 ) ) ( not ( = ?auto_1409585 ?auto_1409593 ) ) ( not ( = ?auto_1409585 ?auto_1409594 ) ) ( not ( = ?auto_1409585 ?auto_1409595 ) ) ( not ( = ?auto_1409585 ?auto_1409596 ) ) ( not ( = ?auto_1409585 ?auto_1409597 ) ) ( not ( = ?auto_1409585 ?auto_1409598 ) ) ( not ( = ?auto_1409585 ?auto_1409599 ) ) ( not ( = ?auto_1409585 ?auto_1409604 ) ) ( not ( = ?auto_1409586 ?auto_1409587 ) ) ( not ( = ?auto_1409586 ?auto_1409589 ) ) ( not ( = ?auto_1409586 ?auto_1409588 ) ) ( not ( = ?auto_1409586 ?auto_1409590 ) ) ( not ( = ?auto_1409586 ?auto_1409591 ) ) ( not ( = ?auto_1409586 ?auto_1409592 ) ) ( not ( = ?auto_1409586 ?auto_1409593 ) ) ( not ( = ?auto_1409586 ?auto_1409594 ) ) ( not ( = ?auto_1409586 ?auto_1409595 ) ) ( not ( = ?auto_1409586 ?auto_1409596 ) ) ( not ( = ?auto_1409586 ?auto_1409597 ) ) ( not ( = ?auto_1409586 ?auto_1409598 ) ) ( not ( = ?auto_1409586 ?auto_1409599 ) ) ( not ( = ?auto_1409586 ?auto_1409604 ) ) ( not ( = ?auto_1409587 ?auto_1409589 ) ) ( not ( = ?auto_1409587 ?auto_1409588 ) ) ( not ( = ?auto_1409587 ?auto_1409590 ) ) ( not ( = ?auto_1409587 ?auto_1409591 ) ) ( not ( = ?auto_1409587 ?auto_1409592 ) ) ( not ( = ?auto_1409587 ?auto_1409593 ) ) ( not ( = ?auto_1409587 ?auto_1409594 ) ) ( not ( = ?auto_1409587 ?auto_1409595 ) ) ( not ( = ?auto_1409587 ?auto_1409596 ) ) ( not ( = ?auto_1409587 ?auto_1409597 ) ) ( not ( = ?auto_1409587 ?auto_1409598 ) ) ( not ( = ?auto_1409587 ?auto_1409599 ) ) ( not ( = ?auto_1409587 ?auto_1409604 ) ) ( not ( = ?auto_1409589 ?auto_1409588 ) ) ( not ( = ?auto_1409589 ?auto_1409590 ) ) ( not ( = ?auto_1409589 ?auto_1409591 ) ) ( not ( = ?auto_1409589 ?auto_1409592 ) ) ( not ( = ?auto_1409589 ?auto_1409593 ) ) ( not ( = ?auto_1409589 ?auto_1409594 ) ) ( not ( = ?auto_1409589 ?auto_1409595 ) ) ( not ( = ?auto_1409589 ?auto_1409596 ) ) ( not ( = ?auto_1409589 ?auto_1409597 ) ) ( not ( = ?auto_1409589 ?auto_1409598 ) ) ( not ( = ?auto_1409589 ?auto_1409599 ) ) ( not ( = ?auto_1409589 ?auto_1409604 ) ) ( not ( = ?auto_1409588 ?auto_1409590 ) ) ( not ( = ?auto_1409588 ?auto_1409591 ) ) ( not ( = ?auto_1409588 ?auto_1409592 ) ) ( not ( = ?auto_1409588 ?auto_1409593 ) ) ( not ( = ?auto_1409588 ?auto_1409594 ) ) ( not ( = ?auto_1409588 ?auto_1409595 ) ) ( not ( = ?auto_1409588 ?auto_1409596 ) ) ( not ( = ?auto_1409588 ?auto_1409597 ) ) ( not ( = ?auto_1409588 ?auto_1409598 ) ) ( not ( = ?auto_1409588 ?auto_1409599 ) ) ( not ( = ?auto_1409588 ?auto_1409604 ) ) ( not ( = ?auto_1409590 ?auto_1409591 ) ) ( not ( = ?auto_1409590 ?auto_1409592 ) ) ( not ( = ?auto_1409590 ?auto_1409593 ) ) ( not ( = ?auto_1409590 ?auto_1409594 ) ) ( not ( = ?auto_1409590 ?auto_1409595 ) ) ( not ( = ?auto_1409590 ?auto_1409596 ) ) ( not ( = ?auto_1409590 ?auto_1409597 ) ) ( not ( = ?auto_1409590 ?auto_1409598 ) ) ( not ( = ?auto_1409590 ?auto_1409599 ) ) ( not ( = ?auto_1409590 ?auto_1409604 ) ) ( not ( = ?auto_1409591 ?auto_1409592 ) ) ( not ( = ?auto_1409591 ?auto_1409593 ) ) ( not ( = ?auto_1409591 ?auto_1409594 ) ) ( not ( = ?auto_1409591 ?auto_1409595 ) ) ( not ( = ?auto_1409591 ?auto_1409596 ) ) ( not ( = ?auto_1409591 ?auto_1409597 ) ) ( not ( = ?auto_1409591 ?auto_1409598 ) ) ( not ( = ?auto_1409591 ?auto_1409599 ) ) ( not ( = ?auto_1409591 ?auto_1409604 ) ) ( not ( = ?auto_1409592 ?auto_1409593 ) ) ( not ( = ?auto_1409592 ?auto_1409594 ) ) ( not ( = ?auto_1409592 ?auto_1409595 ) ) ( not ( = ?auto_1409592 ?auto_1409596 ) ) ( not ( = ?auto_1409592 ?auto_1409597 ) ) ( not ( = ?auto_1409592 ?auto_1409598 ) ) ( not ( = ?auto_1409592 ?auto_1409599 ) ) ( not ( = ?auto_1409592 ?auto_1409604 ) ) ( not ( = ?auto_1409593 ?auto_1409594 ) ) ( not ( = ?auto_1409593 ?auto_1409595 ) ) ( not ( = ?auto_1409593 ?auto_1409596 ) ) ( not ( = ?auto_1409593 ?auto_1409597 ) ) ( not ( = ?auto_1409593 ?auto_1409598 ) ) ( not ( = ?auto_1409593 ?auto_1409599 ) ) ( not ( = ?auto_1409593 ?auto_1409604 ) ) ( not ( = ?auto_1409594 ?auto_1409595 ) ) ( not ( = ?auto_1409594 ?auto_1409596 ) ) ( not ( = ?auto_1409594 ?auto_1409597 ) ) ( not ( = ?auto_1409594 ?auto_1409598 ) ) ( not ( = ?auto_1409594 ?auto_1409599 ) ) ( not ( = ?auto_1409594 ?auto_1409604 ) ) ( not ( = ?auto_1409595 ?auto_1409596 ) ) ( not ( = ?auto_1409595 ?auto_1409597 ) ) ( not ( = ?auto_1409595 ?auto_1409598 ) ) ( not ( = ?auto_1409595 ?auto_1409599 ) ) ( not ( = ?auto_1409595 ?auto_1409604 ) ) ( not ( = ?auto_1409596 ?auto_1409597 ) ) ( not ( = ?auto_1409596 ?auto_1409598 ) ) ( not ( = ?auto_1409596 ?auto_1409599 ) ) ( not ( = ?auto_1409596 ?auto_1409604 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1409597 ?auto_1409598 ?auto_1409599 )
      ( MAKE-14CRATE-VERIFY ?auto_1409585 ?auto_1409586 ?auto_1409587 ?auto_1409589 ?auto_1409588 ?auto_1409590 ?auto_1409591 ?auto_1409592 ?auto_1409593 ?auto_1409594 ?auto_1409595 ?auto_1409596 ?auto_1409597 ?auto_1409598 ?auto_1409599 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1409789 - SURFACE
      ?auto_1409790 - SURFACE
      ?auto_1409791 - SURFACE
      ?auto_1409793 - SURFACE
      ?auto_1409792 - SURFACE
      ?auto_1409794 - SURFACE
      ?auto_1409795 - SURFACE
      ?auto_1409796 - SURFACE
      ?auto_1409797 - SURFACE
      ?auto_1409798 - SURFACE
      ?auto_1409799 - SURFACE
      ?auto_1409800 - SURFACE
      ?auto_1409801 - SURFACE
      ?auto_1409802 - SURFACE
      ?auto_1409803 - SURFACE
    )
    :vars
    (
      ?auto_1409807 - HOIST
      ?auto_1409804 - PLACE
      ?auto_1409808 - PLACE
      ?auto_1409809 - HOIST
      ?auto_1409805 - SURFACE
      ?auto_1409806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1409807 ?auto_1409804 ) ( IS-CRATE ?auto_1409803 ) ( not ( = ?auto_1409802 ?auto_1409803 ) ) ( not ( = ?auto_1409801 ?auto_1409802 ) ) ( not ( = ?auto_1409801 ?auto_1409803 ) ) ( not ( = ?auto_1409808 ?auto_1409804 ) ) ( HOIST-AT ?auto_1409809 ?auto_1409808 ) ( not ( = ?auto_1409807 ?auto_1409809 ) ) ( AVAILABLE ?auto_1409809 ) ( SURFACE-AT ?auto_1409803 ?auto_1409808 ) ( ON ?auto_1409803 ?auto_1409805 ) ( CLEAR ?auto_1409803 ) ( not ( = ?auto_1409802 ?auto_1409805 ) ) ( not ( = ?auto_1409803 ?auto_1409805 ) ) ( not ( = ?auto_1409801 ?auto_1409805 ) ) ( TRUCK-AT ?auto_1409806 ?auto_1409804 ) ( SURFACE-AT ?auto_1409801 ?auto_1409804 ) ( CLEAR ?auto_1409801 ) ( LIFTING ?auto_1409807 ?auto_1409802 ) ( IS-CRATE ?auto_1409802 ) ( ON ?auto_1409790 ?auto_1409789 ) ( ON ?auto_1409791 ?auto_1409790 ) ( ON ?auto_1409793 ?auto_1409791 ) ( ON ?auto_1409792 ?auto_1409793 ) ( ON ?auto_1409794 ?auto_1409792 ) ( ON ?auto_1409795 ?auto_1409794 ) ( ON ?auto_1409796 ?auto_1409795 ) ( ON ?auto_1409797 ?auto_1409796 ) ( ON ?auto_1409798 ?auto_1409797 ) ( ON ?auto_1409799 ?auto_1409798 ) ( ON ?auto_1409800 ?auto_1409799 ) ( ON ?auto_1409801 ?auto_1409800 ) ( not ( = ?auto_1409789 ?auto_1409790 ) ) ( not ( = ?auto_1409789 ?auto_1409791 ) ) ( not ( = ?auto_1409789 ?auto_1409793 ) ) ( not ( = ?auto_1409789 ?auto_1409792 ) ) ( not ( = ?auto_1409789 ?auto_1409794 ) ) ( not ( = ?auto_1409789 ?auto_1409795 ) ) ( not ( = ?auto_1409789 ?auto_1409796 ) ) ( not ( = ?auto_1409789 ?auto_1409797 ) ) ( not ( = ?auto_1409789 ?auto_1409798 ) ) ( not ( = ?auto_1409789 ?auto_1409799 ) ) ( not ( = ?auto_1409789 ?auto_1409800 ) ) ( not ( = ?auto_1409789 ?auto_1409801 ) ) ( not ( = ?auto_1409789 ?auto_1409802 ) ) ( not ( = ?auto_1409789 ?auto_1409803 ) ) ( not ( = ?auto_1409789 ?auto_1409805 ) ) ( not ( = ?auto_1409790 ?auto_1409791 ) ) ( not ( = ?auto_1409790 ?auto_1409793 ) ) ( not ( = ?auto_1409790 ?auto_1409792 ) ) ( not ( = ?auto_1409790 ?auto_1409794 ) ) ( not ( = ?auto_1409790 ?auto_1409795 ) ) ( not ( = ?auto_1409790 ?auto_1409796 ) ) ( not ( = ?auto_1409790 ?auto_1409797 ) ) ( not ( = ?auto_1409790 ?auto_1409798 ) ) ( not ( = ?auto_1409790 ?auto_1409799 ) ) ( not ( = ?auto_1409790 ?auto_1409800 ) ) ( not ( = ?auto_1409790 ?auto_1409801 ) ) ( not ( = ?auto_1409790 ?auto_1409802 ) ) ( not ( = ?auto_1409790 ?auto_1409803 ) ) ( not ( = ?auto_1409790 ?auto_1409805 ) ) ( not ( = ?auto_1409791 ?auto_1409793 ) ) ( not ( = ?auto_1409791 ?auto_1409792 ) ) ( not ( = ?auto_1409791 ?auto_1409794 ) ) ( not ( = ?auto_1409791 ?auto_1409795 ) ) ( not ( = ?auto_1409791 ?auto_1409796 ) ) ( not ( = ?auto_1409791 ?auto_1409797 ) ) ( not ( = ?auto_1409791 ?auto_1409798 ) ) ( not ( = ?auto_1409791 ?auto_1409799 ) ) ( not ( = ?auto_1409791 ?auto_1409800 ) ) ( not ( = ?auto_1409791 ?auto_1409801 ) ) ( not ( = ?auto_1409791 ?auto_1409802 ) ) ( not ( = ?auto_1409791 ?auto_1409803 ) ) ( not ( = ?auto_1409791 ?auto_1409805 ) ) ( not ( = ?auto_1409793 ?auto_1409792 ) ) ( not ( = ?auto_1409793 ?auto_1409794 ) ) ( not ( = ?auto_1409793 ?auto_1409795 ) ) ( not ( = ?auto_1409793 ?auto_1409796 ) ) ( not ( = ?auto_1409793 ?auto_1409797 ) ) ( not ( = ?auto_1409793 ?auto_1409798 ) ) ( not ( = ?auto_1409793 ?auto_1409799 ) ) ( not ( = ?auto_1409793 ?auto_1409800 ) ) ( not ( = ?auto_1409793 ?auto_1409801 ) ) ( not ( = ?auto_1409793 ?auto_1409802 ) ) ( not ( = ?auto_1409793 ?auto_1409803 ) ) ( not ( = ?auto_1409793 ?auto_1409805 ) ) ( not ( = ?auto_1409792 ?auto_1409794 ) ) ( not ( = ?auto_1409792 ?auto_1409795 ) ) ( not ( = ?auto_1409792 ?auto_1409796 ) ) ( not ( = ?auto_1409792 ?auto_1409797 ) ) ( not ( = ?auto_1409792 ?auto_1409798 ) ) ( not ( = ?auto_1409792 ?auto_1409799 ) ) ( not ( = ?auto_1409792 ?auto_1409800 ) ) ( not ( = ?auto_1409792 ?auto_1409801 ) ) ( not ( = ?auto_1409792 ?auto_1409802 ) ) ( not ( = ?auto_1409792 ?auto_1409803 ) ) ( not ( = ?auto_1409792 ?auto_1409805 ) ) ( not ( = ?auto_1409794 ?auto_1409795 ) ) ( not ( = ?auto_1409794 ?auto_1409796 ) ) ( not ( = ?auto_1409794 ?auto_1409797 ) ) ( not ( = ?auto_1409794 ?auto_1409798 ) ) ( not ( = ?auto_1409794 ?auto_1409799 ) ) ( not ( = ?auto_1409794 ?auto_1409800 ) ) ( not ( = ?auto_1409794 ?auto_1409801 ) ) ( not ( = ?auto_1409794 ?auto_1409802 ) ) ( not ( = ?auto_1409794 ?auto_1409803 ) ) ( not ( = ?auto_1409794 ?auto_1409805 ) ) ( not ( = ?auto_1409795 ?auto_1409796 ) ) ( not ( = ?auto_1409795 ?auto_1409797 ) ) ( not ( = ?auto_1409795 ?auto_1409798 ) ) ( not ( = ?auto_1409795 ?auto_1409799 ) ) ( not ( = ?auto_1409795 ?auto_1409800 ) ) ( not ( = ?auto_1409795 ?auto_1409801 ) ) ( not ( = ?auto_1409795 ?auto_1409802 ) ) ( not ( = ?auto_1409795 ?auto_1409803 ) ) ( not ( = ?auto_1409795 ?auto_1409805 ) ) ( not ( = ?auto_1409796 ?auto_1409797 ) ) ( not ( = ?auto_1409796 ?auto_1409798 ) ) ( not ( = ?auto_1409796 ?auto_1409799 ) ) ( not ( = ?auto_1409796 ?auto_1409800 ) ) ( not ( = ?auto_1409796 ?auto_1409801 ) ) ( not ( = ?auto_1409796 ?auto_1409802 ) ) ( not ( = ?auto_1409796 ?auto_1409803 ) ) ( not ( = ?auto_1409796 ?auto_1409805 ) ) ( not ( = ?auto_1409797 ?auto_1409798 ) ) ( not ( = ?auto_1409797 ?auto_1409799 ) ) ( not ( = ?auto_1409797 ?auto_1409800 ) ) ( not ( = ?auto_1409797 ?auto_1409801 ) ) ( not ( = ?auto_1409797 ?auto_1409802 ) ) ( not ( = ?auto_1409797 ?auto_1409803 ) ) ( not ( = ?auto_1409797 ?auto_1409805 ) ) ( not ( = ?auto_1409798 ?auto_1409799 ) ) ( not ( = ?auto_1409798 ?auto_1409800 ) ) ( not ( = ?auto_1409798 ?auto_1409801 ) ) ( not ( = ?auto_1409798 ?auto_1409802 ) ) ( not ( = ?auto_1409798 ?auto_1409803 ) ) ( not ( = ?auto_1409798 ?auto_1409805 ) ) ( not ( = ?auto_1409799 ?auto_1409800 ) ) ( not ( = ?auto_1409799 ?auto_1409801 ) ) ( not ( = ?auto_1409799 ?auto_1409802 ) ) ( not ( = ?auto_1409799 ?auto_1409803 ) ) ( not ( = ?auto_1409799 ?auto_1409805 ) ) ( not ( = ?auto_1409800 ?auto_1409801 ) ) ( not ( = ?auto_1409800 ?auto_1409802 ) ) ( not ( = ?auto_1409800 ?auto_1409803 ) ) ( not ( = ?auto_1409800 ?auto_1409805 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1409801 ?auto_1409802 ?auto_1409803 )
      ( MAKE-14CRATE-VERIFY ?auto_1409789 ?auto_1409790 ?auto_1409791 ?auto_1409793 ?auto_1409792 ?auto_1409794 ?auto_1409795 ?auto_1409796 ?auto_1409797 ?auto_1409798 ?auto_1409799 ?auto_1409800 ?auto_1409801 ?auto_1409802 ?auto_1409803 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1409993 - SURFACE
      ?auto_1409994 - SURFACE
      ?auto_1409995 - SURFACE
      ?auto_1409997 - SURFACE
      ?auto_1409996 - SURFACE
      ?auto_1409998 - SURFACE
      ?auto_1409999 - SURFACE
      ?auto_1410000 - SURFACE
      ?auto_1410001 - SURFACE
      ?auto_1410002 - SURFACE
      ?auto_1410003 - SURFACE
      ?auto_1410004 - SURFACE
      ?auto_1410005 - SURFACE
      ?auto_1410006 - SURFACE
      ?auto_1410007 - SURFACE
    )
    :vars
    (
      ?auto_1410010 - HOIST
      ?auto_1410013 - PLACE
      ?auto_1410008 - PLACE
      ?auto_1410009 - HOIST
      ?auto_1410012 - SURFACE
      ?auto_1410011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1410010 ?auto_1410013 ) ( IS-CRATE ?auto_1410007 ) ( not ( = ?auto_1410006 ?auto_1410007 ) ) ( not ( = ?auto_1410005 ?auto_1410006 ) ) ( not ( = ?auto_1410005 ?auto_1410007 ) ) ( not ( = ?auto_1410008 ?auto_1410013 ) ) ( HOIST-AT ?auto_1410009 ?auto_1410008 ) ( not ( = ?auto_1410010 ?auto_1410009 ) ) ( AVAILABLE ?auto_1410009 ) ( SURFACE-AT ?auto_1410007 ?auto_1410008 ) ( ON ?auto_1410007 ?auto_1410012 ) ( CLEAR ?auto_1410007 ) ( not ( = ?auto_1410006 ?auto_1410012 ) ) ( not ( = ?auto_1410007 ?auto_1410012 ) ) ( not ( = ?auto_1410005 ?auto_1410012 ) ) ( TRUCK-AT ?auto_1410011 ?auto_1410013 ) ( SURFACE-AT ?auto_1410005 ?auto_1410013 ) ( CLEAR ?auto_1410005 ) ( IS-CRATE ?auto_1410006 ) ( AVAILABLE ?auto_1410010 ) ( IN ?auto_1410006 ?auto_1410011 ) ( ON ?auto_1409994 ?auto_1409993 ) ( ON ?auto_1409995 ?auto_1409994 ) ( ON ?auto_1409997 ?auto_1409995 ) ( ON ?auto_1409996 ?auto_1409997 ) ( ON ?auto_1409998 ?auto_1409996 ) ( ON ?auto_1409999 ?auto_1409998 ) ( ON ?auto_1410000 ?auto_1409999 ) ( ON ?auto_1410001 ?auto_1410000 ) ( ON ?auto_1410002 ?auto_1410001 ) ( ON ?auto_1410003 ?auto_1410002 ) ( ON ?auto_1410004 ?auto_1410003 ) ( ON ?auto_1410005 ?auto_1410004 ) ( not ( = ?auto_1409993 ?auto_1409994 ) ) ( not ( = ?auto_1409993 ?auto_1409995 ) ) ( not ( = ?auto_1409993 ?auto_1409997 ) ) ( not ( = ?auto_1409993 ?auto_1409996 ) ) ( not ( = ?auto_1409993 ?auto_1409998 ) ) ( not ( = ?auto_1409993 ?auto_1409999 ) ) ( not ( = ?auto_1409993 ?auto_1410000 ) ) ( not ( = ?auto_1409993 ?auto_1410001 ) ) ( not ( = ?auto_1409993 ?auto_1410002 ) ) ( not ( = ?auto_1409993 ?auto_1410003 ) ) ( not ( = ?auto_1409993 ?auto_1410004 ) ) ( not ( = ?auto_1409993 ?auto_1410005 ) ) ( not ( = ?auto_1409993 ?auto_1410006 ) ) ( not ( = ?auto_1409993 ?auto_1410007 ) ) ( not ( = ?auto_1409993 ?auto_1410012 ) ) ( not ( = ?auto_1409994 ?auto_1409995 ) ) ( not ( = ?auto_1409994 ?auto_1409997 ) ) ( not ( = ?auto_1409994 ?auto_1409996 ) ) ( not ( = ?auto_1409994 ?auto_1409998 ) ) ( not ( = ?auto_1409994 ?auto_1409999 ) ) ( not ( = ?auto_1409994 ?auto_1410000 ) ) ( not ( = ?auto_1409994 ?auto_1410001 ) ) ( not ( = ?auto_1409994 ?auto_1410002 ) ) ( not ( = ?auto_1409994 ?auto_1410003 ) ) ( not ( = ?auto_1409994 ?auto_1410004 ) ) ( not ( = ?auto_1409994 ?auto_1410005 ) ) ( not ( = ?auto_1409994 ?auto_1410006 ) ) ( not ( = ?auto_1409994 ?auto_1410007 ) ) ( not ( = ?auto_1409994 ?auto_1410012 ) ) ( not ( = ?auto_1409995 ?auto_1409997 ) ) ( not ( = ?auto_1409995 ?auto_1409996 ) ) ( not ( = ?auto_1409995 ?auto_1409998 ) ) ( not ( = ?auto_1409995 ?auto_1409999 ) ) ( not ( = ?auto_1409995 ?auto_1410000 ) ) ( not ( = ?auto_1409995 ?auto_1410001 ) ) ( not ( = ?auto_1409995 ?auto_1410002 ) ) ( not ( = ?auto_1409995 ?auto_1410003 ) ) ( not ( = ?auto_1409995 ?auto_1410004 ) ) ( not ( = ?auto_1409995 ?auto_1410005 ) ) ( not ( = ?auto_1409995 ?auto_1410006 ) ) ( not ( = ?auto_1409995 ?auto_1410007 ) ) ( not ( = ?auto_1409995 ?auto_1410012 ) ) ( not ( = ?auto_1409997 ?auto_1409996 ) ) ( not ( = ?auto_1409997 ?auto_1409998 ) ) ( not ( = ?auto_1409997 ?auto_1409999 ) ) ( not ( = ?auto_1409997 ?auto_1410000 ) ) ( not ( = ?auto_1409997 ?auto_1410001 ) ) ( not ( = ?auto_1409997 ?auto_1410002 ) ) ( not ( = ?auto_1409997 ?auto_1410003 ) ) ( not ( = ?auto_1409997 ?auto_1410004 ) ) ( not ( = ?auto_1409997 ?auto_1410005 ) ) ( not ( = ?auto_1409997 ?auto_1410006 ) ) ( not ( = ?auto_1409997 ?auto_1410007 ) ) ( not ( = ?auto_1409997 ?auto_1410012 ) ) ( not ( = ?auto_1409996 ?auto_1409998 ) ) ( not ( = ?auto_1409996 ?auto_1409999 ) ) ( not ( = ?auto_1409996 ?auto_1410000 ) ) ( not ( = ?auto_1409996 ?auto_1410001 ) ) ( not ( = ?auto_1409996 ?auto_1410002 ) ) ( not ( = ?auto_1409996 ?auto_1410003 ) ) ( not ( = ?auto_1409996 ?auto_1410004 ) ) ( not ( = ?auto_1409996 ?auto_1410005 ) ) ( not ( = ?auto_1409996 ?auto_1410006 ) ) ( not ( = ?auto_1409996 ?auto_1410007 ) ) ( not ( = ?auto_1409996 ?auto_1410012 ) ) ( not ( = ?auto_1409998 ?auto_1409999 ) ) ( not ( = ?auto_1409998 ?auto_1410000 ) ) ( not ( = ?auto_1409998 ?auto_1410001 ) ) ( not ( = ?auto_1409998 ?auto_1410002 ) ) ( not ( = ?auto_1409998 ?auto_1410003 ) ) ( not ( = ?auto_1409998 ?auto_1410004 ) ) ( not ( = ?auto_1409998 ?auto_1410005 ) ) ( not ( = ?auto_1409998 ?auto_1410006 ) ) ( not ( = ?auto_1409998 ?auto_1410007 ) ) ( not ( = ?auto_1409998 ?auto_1410012 ) ) ( not ( = ?auto_1409999 ?auto_1410000 ) ) ( not ( = ?auto_1409999 ?auto_1410001 ) ) ( not ( = ?auto_1409999 ?auto_1410002 ) ) ( not ( = ?auto_1409999 ?auto_1410003 ) ) ( not ( = ?auto_1409999 ?auto_1410004 ) ) ( not ( = ?auto_1409999 ?auto_1410005 ) ) ( not ( = ?auto_1409999 ?auto_1410006 ) ) ( not ( = ?auto_1409999 ?auto_1410007 ) ) ( not ( = ?auto_1409999 ?auto_1410012 ) ) ( not ( = ?auto_1410000 ?auto_1410001 ) ) ( not ( = ?auto_1410000 ?auto_1410002 ) ) ( not ( = ?auto_1410000 ?auto_1410003 ) ) ( not ( = ?auto_1410000 ?auto_1410004 ) ) ( not ( = ?auto_1410000 ?auto_1410005 ) ) ( not ( = ?auto_1410000 ?auto_1410006 ) ) ( not ( = ?auto_1410000 ?auto_1410007 ) ) ( not ( = ?auto_1410000 ?auto_1410012 ) ) ( not ( = ?auto_1410001 ?auto_1410002 ) ) ( not ( = ?auto_1410001 ?auto_1410003 ) ) ( not ( = ?auto_1410001 ?auto_1410004 ) ) ( not ( = ?auto_1410001 ?auto_1410005 ) ) ( not ( = ?auto_1410001 ?auto_1410006 ) ) ( not ( = ?auto_1410001 ?auto_1410007 ) ) ( not ( = ?auto_1410001 ?auto_1410012 ) ) ( not ( = ?auto_1410002 ?auto_1410003 ) ) ( not ( = ?auto_1410002 ?auto_1410004 ) ) ( not ( = ?auto_1410002 ?auto_1410005 ) ) ( not ( = ?auto_1410002 ?auto_1410006 ) ) ( not ( = ?auto_1410002 ?auto_1410007 ) ) ( not ( = ?auto_1410002 ?auto_1410012 ) ) ( not ( = ?auto_1410003 ?auto_1410004 ) ) ( not ( = ?auto_1410003 ?auto_1410005 ) ) ( not ( = ?auto_1410003 ?auto_1410006 ) ) ( not ( = ?auto_1410003 ?auto_1410007 ) ) ( not ( = ?auto_1410003 ?auto_1410012 ) ) ( not ( = ?auto_1410004 ?auto_1410005 ) ) ( not ( = ?auto_1410004 ?auto_1410006 ) ) ( not ( = ?auto_1410004 ?auto_1410007 ) ) ( not ( = ?auto_1410004 ?auto_1410012 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1410005 ?auto_1410006 ?auto_1410007 )
      ( MAKE-14CRATE-VERIFY ?auto_1409993 ?auto_1409994 ?auto_1409995 ?auto_1409997 ?auto_1409996 ?auto_1409998 ?auto_1409999 ?auto_1410000 ?auto_1410001 ?auto_1410002 ?auto_1410003 ?auto_1410004 ?auto_1410005 ?auto_1410006 ?auto_1410007 ) )
  )

)

