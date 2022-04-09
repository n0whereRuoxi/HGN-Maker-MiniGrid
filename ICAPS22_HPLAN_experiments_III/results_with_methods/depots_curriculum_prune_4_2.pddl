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
      ?auto_684 - SURFACE
      ?auto_685 - SURFACE
    )
    :vars
    (
      ?auto_686 - HOIST
      ?auto_687 - PLACE
      ?auto_689 - PLACE
      ?auto_690 - HOIST
      ?auto_691 - SURFACE
      ?auto_688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_686 ?auto_687 ) ( SURFACE-AT ?auto_684 ?auto_687 ) ( CLEAR ?auto_684 ) ( IS-CRATE ?auto_685 ) ( AVAILABLE ?auto_686 ) ( not ( = ?auto_689 ?auto_687 ) ) ( HOIST-AT ?auto_690 ?auto_689 ) ( AVAILABLE ?auto_690 ) ( SURFACE-AT ?auto_685 ?auto_689 ) ( ON ?auto_685 ?auto_691 ) ( CLEAR ?auto_685 ) ( TRUCK-AT ?auto_688 ?auto_687 ) ( not ( = ?auto_684 ?auto_685 ) ) ( not ( = ?auto_684 ?auto_691 ) ) ( not ( = ?auto_685 ?auto_691 ) ) ( not ( = ?auto_686 ?auto_690 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_688 ?auto_687 ?auto_689 )
      ( !LIFT ?auto_690 ?auto_685 ?auto_691 ?auto_689 )
      ( !LOAD ?auto_690 ?auto_685 ?auto_688 ?auto_689 )
      ( !DRIVE ?auto_688 ?auto_689 ?auto_687 )
      ( !UNLOAD ?auto_686 ?auto_685 ?auto_688 ?auto_687 )
      ( !DROP ?auto_686 ?auto_685 ?auto_684 ?auto_687 )
      ( MAKE-1CRATE-VERIFY ?auto_684 ?auto_685 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_705 - SURFACE
      ?auto_706 - SURFACE
      ?auto_707 - SURFACE
    )
    :vars
    (
      ?auto_710 - HOIST
      ?auto_711 - PLACE
      ?auto_709 - PLACE
      ?auto_712 - HOIST
      ?auto_708 - SURFACE
      ?auto_714 - SURFACE
      ?auto_713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_710 ?auto_711 ) ( IS-CRATE ?auto_707 ) ( not ( = ?auto_709 ?auto_711 ) ) ( HOIST-AT ?auto_712 ?auto_709 ) ( SURFACE-AT ?auto_707 ?auto_709 ) ( ON ?auto_707 ?auto_708 ) ( CLEAR ?auto_707 ) ( not ( = ?auto_706 ?auto_707 ) ) ( not ( = ?auto_706 ?auto_708 ) ) ( not ( = ?auto_707 ?auto_708 ) ) ( not ( = ?auto_710 ?auto_712 ) ) ( SURFACE-AT ?auto_705 ?auto_711 ) ( CLEAR ?auto_705 ) ( IS-CRATE ?auto_706 ) ( AVAILABLE ?auto_710 ) ( AVAILABLE ?auto_712 ) ( SURFACE-AT ?auto_706 ?auto_709 ) ( ON ?auto_706 ?auto_714 ) ( CLEAR ?auto_706 ) ( TRUCK-AT ?auto_713 ?auto_711 ) ( not ( = ?auto_705 ?auto_706 ) ) ( not ( = ?auto_705 ?auto_714 ) ) ( not ( = ?auto_706 ?auto_714 ) ) ( not ( = ?auto_705 ?auto_707 ) ) ( not ( = ?auto_705 ?auto_708 ) ) ( not ( = ?auto_707 ?auto_714 ) ) ( not ( = ?auto_708 ?auto_714 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_705 ?auto_706 )
      ( MAKE-1CRATE ?auto_706 ?auto_707 )
      ( MAKE-2CRATE-VERIFY ?auto_705 ?auto_706 ?auto_707 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_729 - SURFACE
      ?auto_730 - SURFACE
      ?auto_731 - SURFACE
      ?auto_732 - SURFACE
    )
    :vars
    (
      ?auto_734 - HOIST
      ?auto_736 - PLACE
      ?auto_737 - PLACE
      ?auto_733 - HOIST
      ?auto_738 - SURFACE
      ?auto_739 - PLACE
      ?auto_740 - HOIST
      ?auto_741 - SURFACE
      ?auto_742 - SURFACE
      ?auto_735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_734 ?auto_736 ) ( IS-CRATE ?auto_732 ) ( not ( = ?auto_737 ?auto_736 ) ) ( HOIST-AT ?auto_733 ?auto_737 ) ( AVAILABLE ?auto_733 ) ( SURFACE-AT ?auto_732 ?auto_737 ) ( ON ?auto_732 ?auto_738 ) ( CLEAR ?auto_732 ) ( not ( = ?auto_731 ?auto_732 ) ) ( not ( = ?auto_731 ?auto_738 ) ) ( not ( = ?auto_732 ?auto_738 ) ) ( not ( = ?auto_734 ?auto_733 ) ) ( IS-CRATE ?auto_731 ) ( not ( = ?auto_739 ?auto_736 ) ) ( HOIST-AT ?auto_740 ?auto_739 ) ( SURFACE-AT ?auto_731 ?auto_739 ) ( ON ?auto_731 ?auto_741 ) ( CLEAR ?auto_731 ) ( not ( = ?auto_730 ?auto_731 ) ) ( not ( = ?auto_730 ?auto_741 ) ) ( not ( = ?auto_731 ?auto_741 ) ) ( not ( = ?auto_734 ?auto_740 ) ) ( SURFACE-AT ?auto_729 ?auto_736 ) ( CLEAR ?auto_729 ) ( IS-CRATE ?auto_730 ) ( AVAILABLE ?auto_734 ) ( AVAILABLE ?auto_740 ) ( SURFACE-AT ?auto_730 ?auto_739 ) ( ON ?auto_730 ?auto_742 ) ( CLEAR ?auto_730 ) ( TRUCK-AT ?auto_735 ?auto_736 ) ( not ( = ?auto_729 ?auto_730 ) ) ( not ( = ?auto_729 ?auto_742 ) ) ( not ( = ?auto_730 ?auto_742 ) ) ( not ( = ?auto_729 ?auto_731 ) ) ( not ( = ?auto_729 ?auto_741 ) ) ( not ( = ?auto_731 ?auto_742 ) ) ( not ( = ?auto_741 ?auto_742 ) ) ( not ( = ?auto_729 ?auto_732 ) ) ( not ( = ?auto_729 ?auto_738 ) ) ( not ( = ?auto_730 ?auto_732 ) ) ( not ( = ?auto_730 ?auto_738 ) ) ( not ( = ?auto_732 ?auto_741 ) ) ( not ( = ?auto_732 ?auto_742 ) ) ( not ( = ?auto_737 ?auto_739 ) ) ( not ( = ?auto_733 ?auto_740 ) ) ( not ( = ?auto_738 ?auto_741 ) ) ( not ( = ?auto_738 ?auto_742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_729 ?auto_730 ?auto_731 )
      ( MAKE-1CRATE ?auto_731 ?auto_732 )
      ( MAKE-3CRATE-VERIFY ?auto_729 ?auto_730 ?auto_731 ?auto_732 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_758 - SURFACE
      ?auto_759 - SURFACE
      ?auto_760 - SURFACE
      ?auto_761 - SURFACE
      ?auto_762 - SURFACE
    )
    :vars
    (
      ?auto_767 - HOIST
      ?auto_766 - PLACE
      ?auto_764 - PLACE
      ?auto_765 - HOIST
      ?auto_768 - SURFACE
      ?auto_773 - SURFACE
      ?auto_769 - PLACE
      ?auto_770 - HOIST
      ?auto_771 - SURFACE
      ?auto_772 - SURFACE
      ?auto_763 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_767 ?auto_766 ) ( IS-CRATE ?auto_762 ) ( not ( = ?auto_764 ?auto_766 ) ) ( HOIST-AT ?auto_765 ?auto_764 ) ( SURFACE-AT ?auto_762 ?auto_764 ) ( ON ?auto_762 ?auto_768 ) ( CLEAR ?auto_762 ) ( not ( = ?auto_761 ?auto_762 ) ) ( not ( = ?auto_761 ?auto_768 ) ) ( not ( = ?auto_762 ?auto_768 ) ) ( not ( = ?auto_767 ?auto_765 ) ) ( IS-CRATE ?auto_761 ) ( AVAILABLE ?auto_765 ) ( SURFACE-AT ?auto_761 ?auto_764 ) ( ON ?auto_761 ?auto_773 ) ( CLEAR ?auto_761 ) ( not ( = ?auto_760 ?auto_761 ) ) ( not ( = ?auto_760 ?auto_773 ) ) ( not ( = ?auto_761 ?auto_773 ) ) ( IS-CRATE ?auto_760 ) ( not ( = ?auto_769 ?auto_766 ) ) ( HOIST-AT ?auto_770 ?auto_769 ) ( SURFACE-AT ?auto_760 ?auto_769 ) ( ON ?auto_760 ?auto_771 ) ( CLEAR ?auto_760 ) ( not ( = ?auto_759 ?auto_760 ) ) ( not ( = ?auto_759 ?auto_771 ) ) ( not ( = ?auto_760 ?auto_771 ) ) ( not ( = ?auto_767 ?auto_770 ) ) ( SURFACE-AT ?auto_758 ?auto_766 ) ( CLEAR ?auto_758 ) ( IS-CRATE ?auto_759 ) ( AVAILABLE ?auto_767 ) ( AVAILABLE ?auto_770 ) ( SURFACE-AT ?auto_759 ?auto_769 ) ( ON ?auto_759 ?auto_772 ) ( CLEAR ?auto_759 ) ( TRUCK-AT ?auto_763 ?auto_766 ) ( not ( = ?auto_758 ?auto_759 ) ) ( not ( = ?auto_758 ?auto_772 ) ) ( not ( = ?auto_759 ?auto_772 ) ) ( not ( = ?auto_758 ?auto_760 ) ) ( not ( = ?auto_758 ?auto_771 ) ) ( not ( = ?auto_760 ?auto_772 ) ) ( not ( = ?auto_771 ?auto_772 ) ) ( not ( = ?auto_758 ?auto_761 ) ) ( not ( = ?auto_758 ?auto_773 ) ) ( not ( = ?auto_759 ?auto_761 ) ) ( not ( = ?auto_759 ?auto_773 ) ) ( not ( = ?auto_761 ?auto_771 ) ) ( not ( = ?auto_761 ?auto_772 ) ) ( not ( = ?auto_764 ?auto_769 ) ) ( not ( = ?auto_765 ?auto_770 ) ) ( not ( = ?auto_773 ?auto_771 ) ) ( not ( = ?auto_773 ?auto_772 ) ) ( not ( = ?auto_758 ?auto_762 ) ) ( not ( = ?auto_758 ?auto_768 ) ) ( not ( = ?auto_759 ?auto_762 ) ) ( not ( = ?auto_759 ?auto_768 ) ) ( not ( = ?auto_760 ?auto_762 ) ) ( not ( = ?auto_760 ?auto_768 ) ) ( not ( = ?auto_762 ?auto_773 ) ) ( not ( = ?auto_762 ?auto_771 ) ) ( not ( = ?auto_762 ?auto_772 ) ) ( not ( = ?auto_768 ?auto_773 ) ) ( not ( = ?auto_768 ?auto_771 ) ) ( not ( = ?auto_768 ?auto_772 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_758 ?auto_759 ?auto_760 ?auto_761 )
      ( MAKE-1CRATE ?auto_761 ?auto_762 )
      ( MAKE-4CRATE-VERIFY ?auto_758 ?auto_759 ?auto_760 ?auto_761 ?auto_762 ) )
  )

)

