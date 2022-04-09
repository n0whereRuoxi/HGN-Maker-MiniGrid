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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_694 - SURFACE
      ?auto_695 - SURFACE
    )
    :vars
    (
      ?auto_696 - HOIST
      ?auto_697 - PLACE
      ?auto_699 - PLACE
      ?auto_700 - HOIST
      ?auto_701 - SURFACE
      ?auto_698 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_696 ?auto_697 ) ( SURFACE-AT ?auto_694 ?auto_697 ) ( CLEAR ?auto_694 ) ( IS-CRATE ?auto_695 ) ( AVAILABLE ?auto_696 ) ( not ( = ?auto_699 ?auto_697 ) ) ( HOIST-AT ?auto_700 ?auto_699 ) ( AVAILABLE ?auto_700 ) ( SURFACE-AT ?auto_695 ?auto_699 ) ( ON ?auto_695 ?auto_701 ) ( CLEAR ?auto_695 ) ( TRUCK-AT ?auto_698 ?auto_697 ) ( not ( = ?auto_694 ?auto_695 ) ) ( not ( = ?auto_694 ?auto_701 ) ) ( not ( = ?auto_695 ?auto_701 ) ) ( not ( = ?auto_696 ?auto_700 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_698 ?auto_697 ?auto_699 )
      ( !LIFT ?auto_700 ?auto_695 ?auto_701 ?auto_699 )
      ( !LOAD ?auto_700 ?auto_695 ?auto_698 ?auto_699 )
      ( !DRIVE ?auto_698 ?auto_699 ?auto_697 )
      ( !UNLOAD ?auto_696 ?auto_695 ?auto_698 ?auto_697 )
      ( !DROP ?auto_696 ?auto_695 ?auto_694 ?auto_697 )
      ( MAKE-1CRATE-VERIFY ?auto_694 ?auto_695 ) )
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
      ?auto_711 - HOIST
      ?auto_708 - PLACE
      ?auto_709 - PLACE
      ?auto_713 - HOIST
      ?auto_710 - SURFACE
      ?auto_714 - SURFACE
      ?auto_712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_711 ?auto_708 ) ( IS-CRATE ?auto_707 ) ( not ( = ?auto_709 ?auto_708 ) ) ( HOIST-AT ?auto_713 ?auto_709 ) ( SURFACE-AT ?auto_707 ?auto_709 ) ( ON ?auto_707 ?auto_710 ) ( CLEAR ?auto_707 ) ( not ( = ?auto_706 ?auto_707 ) ) ( not ( = ?auto_706 ?auto_710 ) ) ( not ( = ?auto_707 ?auto_710 ) ) ( not ( = ?auto_711 ?auto_713 ) ) ( SURFACE-AT ?auto_705 ?auto_708 ) ( CLEAR ?auto_705 ) ( IS-CRATE ?auto_706 ) ( AVAILABLE ?auto_711 ) ( AVAILABLE ?auto_713 ) ( SURFACE-AT ?auto_706 ?auto_709 ) ( ON ?auto_706 ?auto_714 ) ( CLEAR ?auto_706 ) ( TRUCK-AT ?auto_712 ?auto_708 ) ( not ( = ?auto_705 ?auto_706 ) ) ( not ( = ?auto_705 ?auto_714 ) ) ( not ( = ?auto_706 ?auto_714 ) ) ( not ( = ?auto_705 ?auto_707 ) ) ( not ( = ?auto_705 ?auto_710 ) ) ( not ( = ?auto_707 ?auto_714 ) ) ( not ( = ?auto_710 ?auto_714 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_705 ?auto_706 )
      ( MAKE-1CRATE ?auto_706 ?auto_707 )
      ( MAKE-2CRATE-VERIFY ?auto_705 ?auto_706 ?auto_707 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_717 - SURFACE
      ?auto_718 - SURFACE
    )
    :vars
    (
      ?auto_719 - HOIST
      ?auto_720 - PLACE
      ?auto_722 - PLACE
      ?auto_723 - HOIST
      ?auto_724 - SURFACE
      ?auto_721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_719 ?auto_720 ) ( SURFACE-AT ?auto_717 ?auto_720 ) ( CLEAR ?auto_717 ) ( IS-CRATE ?auto_718 ) ( AVAILABLE ?auto_719 ) ( not ( = ?auto_722 ?auto_720 ) ) ( HOIST-AT ?auto_723 ?auto_722 ) ( AVAILABLE ?auto_723 ) ( SURFACE-AT ?auto_718 ?auto_722 ) ( ON ?auto_718 ?auto_724 ) ( CLEAR ?auto_718 ) ( TRUCK-AT ?auto_721 ?auto_720 ) ( not ( = ?auto_717 ?auto_718 ) ) ( not ( = ?auto_717 ?auto_724 ) ) ( not ( = ?auto_718 ?auto_724 ) ) ( not ( = ?auto_719 ?auto_723 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_721 ?auto_720 ?auto_722 )
      ( !LIFT ?auto_723 ?auto_718 ?auto_724 ?auto_722 )
      ( !LOAD ?auto_723 ?auto_718 ?auto_721 ?auto_722 )
      ( !DRIVE ?auto_721 ?auto_722 ?auto_720 )
      ( !UNLOAD ?auto_719 ?auto_718 ?auto_721 ?auto_720 )
      ( !DROP ?auto_719 ?auto_718 ?auto_717 ?auto_720 )
      ( MAKE-1CRATE-VERIFY ?auto_717 ?auto_718 ) )
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
      ?auto_733 - HOIST
      ?auto_737 - PLACE
      ?auto_738 - PLACE
      ?auto_734 - HOIST
      ?auto_736 - SURFACE
      ?auto_741 - PLACE
      ?auto_739 - HOIST
      ?auto_742 - SURFACE
      ?auto_740 - SURFACE
      ?auto_735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_733 ?auto_737 ) ( IS-CRATE ?auto_732 ) ( not ( = ?auto_738 ?auto_737 ) ) ( HOIST-AT ?auto_734 ?auto_738 ) ( AVAILABLE ?auto_734 ) ( SURFACE-AT ?auto_732 ?auto_738 ) ( ON ?auto_732 ?auto_736 ) ( CLEAR ?auto_732 ) ( not ( = ?auto_731 ?auto_732 ) ) ( not ( = ?auto_731 ?auto_736 ) ) ( not ( = ?auto_732 ?auto_736 ) ) ( not ( = ?auto_733 ?auto_734 ) ) ( IS-CRATE ?auto_731 ) ( not ( = ?auto_741 ?auto_737 ) ) ( HOIST-AT ?auto_739 ?auto_741 ) ( SURFACE-AT ?auto_731 ?auto_741 ) ( ON ?auto_731 ?auto_742 ) ( CLEAR ?auto_731 ) ( not ( = ?auto_730 ?auto_731 ) ) ( not ( = ?auto_730 ?auto_742 ) ) ( not ( = ?auto_731 ?auto_742 ) ) ( not ( = ?auto_733 ?auto_739 ) ) ( SURFACE-AT ?auto_729 ?auto_737 ) ( CLEAR ?auto_729 ) ( IS-CRATE ?auto_730 ) ( AVAILABLE ?auto_733 ) ( AVAILABLE ?auto_739 ) ( SURFACE-AT ?auto_730 ?auto_741 ) ( ON ?auto_730 ?auto_740 ) ( CLEAR ?auto_730 ) ( TRUCK-AT ?auto_735 ?auto_737 ) ( not ( = ?auto_729 ?auto_730 ) ) ( not ( = ?auto_729 ?auto_740 ) ) ( not ( = ?auto_730 ?auto_740 ) ) ( not ( = ?auto_729 ?auto_731 ) ) ( not ( = ?auto_729 ?auto_742 ) ) ( not ( = ?auto_731 ?auto_740 ) ) ( not ( = ?auto_742 ?auto_740 ) ) ( not ( = ?auto_729 ?auto_732 ) ) ( not ( = ?auto_729 ?auto_736 ) ) ( not ( = ?auto_730 ?auto_732 ) ) ( not ( = ?auto_730 ?auto_736 ) ) ( not ( = ?auto_732 ?auto_742 ) ) ( not ( = ?auto_732 ?auto_740 ) ) ( not ( = ?auto_738 ?auto_741 ) ) ( not ( = ?auto_734 ?auto_739 ) ) ( not ( = ?auto_736 ?auto_742 ) ) ( not ( = ?auto_736 ?auto_740 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_729 ?auto_730 ?auto_731 )
      ( MAKE-1CRATE ?auto_731 ?auto_732 )
      ( MAKE-3CRATE-VERIFY ?auto_729 ?auto_730 ?auto_731 ?auto_732 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_745 - SURFACE
      ?auto_746 - SURFACE
    )
    :vars
    (
      ?auto_747 - HOIST
      ?auto_748 - PLACE
      ?auto_750 - PLACE
      ?auto_751 - HOIST
      ?auto_752 - SURFACE
      ?auto_749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_747 ?auto_748 ) ( SURFACE-AT ?auto_745 ?auto_748 ) ( CLEAR ?auto_745 ) ( IS-CRATE ?auto_746 ) ( AVAILABLE ?auto_747 ) ( not ( = ?auto_750 ?auto_748 ) ) ( HOIST-AT ?auto_751 ?auto_750 ) ( AVAILABLE ?auto_751 ) ( SURFACE-AT ?auto_746 ?auto_750 ) ( ON ?auto_746 ?auto_752 ) ( CLEAR ?auto_746 ) ( TRUCK-AT ?auto_749 ?auto_748 ) ( not ( = ?auto_745 ?auto_746 ) ) ( not ( = ?auto_745 ?auto_752 ) ) ( not ( = ?auto_746 ?auto_752 ) ) ( not ( = ?auto_747 ?auto_751 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_749 ?auto_748 ?auto_750 )
      ( !LIFT ?auto_751 ?auto_746 ?auto_752 ?auto_750 )
      ( !LOAD ?auto_751 ?auto_746 ?auto_749 ?auto_750 )
      ( !DRIVE ?auto_749 ?auto_750 ?auto_748 )
      ( !UNLOAD ?auto_747 ?auto_746 ?auto_749 ?auto_748 )
      ( !DROP ?auto_747 ?auto_746 ?auto_745 ?auto_748 )
      ( MAKE-1CRATE-VERIFY ?auto_745 ?auto_746 ) )
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
      ?auto_768 - PLACE
      ?auto_766 - PLACE
      ?auto_765 - HOIST
      ?auto_763 - SURFACE
      ?auto_773 - SURFACE
      ?auto_769 - PLACE
      ?auto_770 - HOIST
      ?auto_771 - SURFACE
      ?auto_772 - SURFACE
      ?auto_764 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_767 ?auto_768 ) ( IS-CRATE ?auto_762 ) ( not ( = ?auto_766 ?auto_768 ) ) ( HOIST-AT ?auto_765 ?auto_766 ) ( SURFACE-AT ?auto_762 ?auto_766 ) ( ON ?auto_762 ?auto_763 ) ( CLEAR ?auto_762 ) ( not ( = ?auto_761 ?auto_762 ) ) ( not ( = ?auto_761 ?auto_763 ) ) ( not ( = ?auto_762 ?auto_763 ) ) ( not ( = ?auto_767 ?auto_765 ) ) ( IS-CRATE ?auto_761 ) ( AVAILABLE ?auto_765 ) ( SURFACE-AT ?auto_761 ?auto_766 ) ( ON ?auto_761 ?auto_773 ) ( CLEAR ?auto_761 ) ( not ( = ?auto_760 ?auto_761 ) ) ( not ( = ?auto_760 ?auto_773 ) ) ( not ( = ?auto_761 ?auto_773 ) ) ( IS-CRATE ?auto_760 ) ( not ( = ?auto_769 ?auto_768 ) ) ( HOIST-AT ?auto_770 ?auto_769 ) ( SURFACE-AT ?auto_760 ?auto_769 ) ( ON ?auto_760 ?auto_771 ) ( CLEAR ?auto_760 ) ( not ( = ?auto_759 ?auto_760 ) ) ( not ( = ?auto_759 ?auto_771 ) ) ( not ( = ?auto_760 ?auto_771 ) ) ( not ( = ?auto_767 ?auto_770 ) ) ( SURFACE-AT ?auto_758 ?auto_768 ) ( CLEAR ?auto_758 ) ( IS-CRATE ?auto_759 ) ( AVAILABLE ?auto_767 ) ( AVAILABLE ?auto_770 ) ( SURFACE-AT ?auto_759 ?auto_769 ) ( ON ?auto_759 ?auto_772 ) ( CLEAR ?auto_759 ) ( TRUCK-AT ?auto_764 ?auto_768 ) ( not ( = ?auto_758 ?auto_759 ) ) ( not ( = ?auto_758 ?auto_772 ) ) ( not ( = ?auto_759 ?auto_772 ) ) ( not ( = ?auto_758 ?auto_760 ) ) ( not ( = ?auto_758 ?auto_771 ) ) ( not ( = ?auto_760 ?auto_772 ) ) ( not ( = ?auto_771 ?auto_772 ) ) ( not ( = ?auto_758 ?auto_761 ) ) ( not ( = ?auto_758 ?auto_773 ) ) ( not ( = ?auto_759 ?auto_761 ) ) ( not ( = ?auto_759 ?auto_773 ) ) ( not ( = ?auto_761 ?auto_771 ) ) ( not ( = ?auto_761 ?auto_772 ) ) ( not ( = ?auto_766 ?auto_769 ) ) ( not ( = ?auto_765 ?auto_770 ) ) ( not ( = ?auto_773 ?auto_771 ) ) ( not ( = ?auto_773 ?auto_772 ) ) ( not ( = ?auto_758 ?auto_762 ) ) ( not ( = ?auto_758 ?auto_763 ) ) ( not ( = ?auto_759 ?auto_762 ) ) ( not ( = ?auto_759 ?auto_763 ) ) ( not ( = ?auto_760 ?auto_762 ) ) ( not ( = ?auto_760 ?auto_763 ) ) ( not ( = ?auto_762 ?auto_773 ) ) ( not ( = ?auto_762 ?auto_771 ) ) ( not ( = ?auto_762 ?auto_772 ) ) ( not ( = ?auto_763 ?auto_773 ) ) ( not ( = ?auto_763 ?auto_771 ) ) ( not ( = ?auto_763 ?auto_772 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_758 ?auto_759 ?auto_760 ?auto_761 )
      ( MAKE-1CRATE ?auto_761 ?auto_762 )
      ( MAKE-4CRATE-VERIFY ?auto_758 ?auto_759 ?auto_760 ?auto_761 ?auto_762 ) )
  )

)
