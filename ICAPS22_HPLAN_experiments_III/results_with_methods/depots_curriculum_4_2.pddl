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
      ?auto_674 - SURFACE
      ?auto_675 - SURFACE
    )
    :vars
    (
      ?auto_676 - HOIST
      ?auto_677 - PLACE
      ?auto_679 - PLACE
      ?auto_680 - HOIST
      ?auto_681 - SURFACE
      ?auto_678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_676 ?auto_677 ) ( SURFACE-AT ?auto_674 ?auto_677 ) ( CLEAR ?auto_674 ) ( IS-CRATE ?auto_675 ) ( AVAILABLE ?auto_676 ) ( not ( = ?auto_679 ?auto_677 ) ) ( HOIST-AT ?auto_680 ?auto_679 ) ( AVAILABLE ?auto_680 ) ( SURFACE-AT ?auto_675 ?auto_679 ) ( ON ?auto_675 ?auto_681 ) ( CLEAR ?auto_675 ) ( TRUCK-AT ?auto_678 ?auto_677 ) ( not ( = ?auto_674 ?auto_675 ) ) ( not ( = ?auto_674 ?auto_681 ) ) ( not ( = ?auto_675 ?auto_681 ) ) ( not ( = ?auto_676 ?auto_680 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_678 ?auto_677 ?auto_679 )
      ( !LIFT ?auto_680 ?auto_675 ?auto_681 ?auto_679 )
      ( !LOAD ?auto_680 ?auto_675 ?auto_678 ?auto_679 )
      ( !DRIVE ?auto_678 ?auto_679 ?auto_677 )
      ( !UNLOAD ?auto_676 ?auto_675 ?auto_678 ?auto_677 )
      ( !DROP ?auto_676 ?auto_675 ?auto_674 ?auto_677 )
      ( MAKE-1CRATE-VERIFY ?auto_674 ?auto_675 ) )
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
      ?auto_695 - SURFACE
      ?auto_696 - SURFACE
      ?auto_697 - SURFACE
    )
    :vars
    (
      ?auto_701 - HOIST
      ?auto_700 - PLACE
      ?auto_702 - PLACE
      ?auto_698 - HOIST
      ?auto_699 - SURFACE
      ?auto_706 - PLACE
      ?auto_705 - HOIST
      ?auto_704 - SURFACE
      ?auto_703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_701 ?auto_700 ) ( IS-CRATE ?auto_697 ) ( not ( = ?auto_702 ?auto_700 ) ) ( HOIST-AT ?auto_698 ?auto_702 ) ( AVAILABLE ?auto_698 ) ( SURFACE-AT ?auto_697 ?auto_702 ) ( ON ?auto_697 ?auto_699 ) ( CLEAR ?auto_697 ) ( not ( = ?auto_696 ?auto_697 ) ) ( not ( = ?auto_696 ?auto_699 ) ) ( not ( = ?auto_697 ?auto_699 ) ) ( not ( = ?auto_701 ?auto_698 ) ) ( SURFACE-AT ?auto_695 ?auto_700 ) ( CLEAR ?auto_695 ) ( IS-CRATE ?auto_696 ) ( AVAILABLE ?auto_701 ) ( not ( = ?auto_706 ?auto_700 ) ) ( HOIST-AT ?auto_705 ?auto_706 ) ( AVAILABLE ?auto_705 ) ( SURFACE-AT ?auto_696 ?auto_706 ) ( ON ?auto_696 ?auto_704 ) ( CLEAR ?auto_696 ) ( TRUCK-AT ?auto_703 ?auto_700 ) ( not ( = ?auto_695 ?auto_696 ) ) ( not ( = ?auto_695 ?auto_704 ) ) ( not ( = ?auto_696 ?auto_704 ) ) ( not ( = ?auto_701 ?auto_705 ) ) ( not ( = ?auto_695 ?auto_697 ) ) ( not ( = ?auto_695 ?auto_699 ) ) ( not ( = ?auto_697 ?auto_704 ) ) ( not ( = ?auto_702 ?auto_706 ) ) ( not ( = ?auto_698 ?auto_705 ) ) ( not ( = ?auto_699 ?auto_704 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_695 ?auto_696 )
      ( MAKE-1CRATE ?auto_696 ?auto_697 )
      ( MAKE-2CRATE-VERIFY ?auto_695 ?auto_696 ?auto_697 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_709 - SURFACE
      ?auto_710 - SURFACE
    )
    :vars
    (
      ?auto_711 - HOIST
      ?auto_712 - PLACE
      ?auto_714 - PLACE
      ?auto_715 - HOIST
      ?auto_716 - SURFACE
      ?auto_713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_711 ?auto_712 ) ( SURFACE-AT ?auto_709 ?auto_712 ) ( CLEAR ?auto_709 ) ( IS-CRATE ?auto_710 ) ( AVAILABLE ?auto_711 ) ( not ( = ?auto_714 ?auto_712 ) ) ( HOIST-AT ?auto_715 ?auto_714 ) ( AVAILABLE ?auto_715 ) ( SURFACE-AT ?auto_710 ?auto_714 ) ( ON ?auto_710 ?auto_716 ) ( CLEAR ?auto_710 ) ( TRUCK-AT ?auto_713 ?auto_712 ) ( not ( = ?auto_709 ?auto_710 ) ) ( not ( = ?auto_709 ?auto_716 ) ) ( not ( = ?auto_710 ?auto_716 ) ) ( not ( = ?auto_711 ?auto_715 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_713 ?auto_712 ?auto_714 )
      ( !LIFT ?auto_715 ?auto_710 ?auto_716 ?auto_714 )
      ( !LOAD ?auto_715 ?auto_710 ?auto_713 ?auto_714 )
      ( !DRIVE ?auto_713 ?auto_714 ?auto_712 )
      ( !UNLOAD ?auto_711 ?auto_710 ?auto_713 ?auto_712 )
      ( !DROP ?auto_711 ?auto_710 ?auto_709 ?auto_712 )
      ( MAKE-1CRATE-VERIFY ?auto_709 ?auto_710 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_721 - SURFACE
      ?auto_722 - SURFACE
      ?auto_723 - SURFACE
      ?auto_724 - SURFACE
    )
    :vars
    (
      ?auto_730 - HOIST
      ?auto_726 - PLACE
      ?auto_729 - PLACE
      ?auto_727 - HOIST
      ?auto_728 - SURFACE
      ?auto_731 - PLACE
      ?auto_733 - HOIST
      ?auto_736 - SURFACE
      ?auto_735 - PLACE
      ?auto_734 - HOIST
      ?auto_732 - SURFACE
      ?auto_725 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_730 ?auto_726 ) ( IS-CRATE ?auto_724 ) ( not ( = ?auto_729 ?auto_726 ) ) ( HOIST-AT ?auto_727 ?auto_729 ) ( AVAILABLE ?auto_727 ) ( SURFACE-AT ?auto_724 ?auto_729 ) ( ON ?auto_724 ?auto_728 ) ( CLEAR ?auto_724 ) ( not ( = ?auto_723 ?auto_724 ) ) ( not ( = ?auto_723 ?auto_728 ) ) ( not ( = ?auto_724 ?auto_728 ) ) ( not ( = ?auto_730 ?auto_727 ) ) ( IS-CRATE ?auto_723 ) ( not ( = ?auto_731 ?auto_726 ) ) ( HOIST-AT ?auto_733 ?auto_731 ) ( AVAILABLE ?auto_733 ) ( SURFACE-AT ?auto_723 ?auto_731 ) ( ON ?auto_723 ?auto_736 ) ( CLEAR ?auto_723 ) ( not ( = ?auto_722 ?auto_723 ) ) ( not ( = ?auto_722 ?auto_736 ) ) ( not ( = ?auto_723 ?auto_736 ) ) ( not ( = ?auto_730 ?auto_733 ) ) ( SURFACE-AT ?auto_721 ?auto_726 ) ( CLEAR ?auto_721 ) ( IS-CRATE ?auto_722 ) ( AVAILABLE ?auto_730 ) ( not ( = ?auto_735 ?auto_726 ) ) ( HOIST-AT ?auto_734 ?auto_735 ) ( AVAILABLE ?auto_734 ) ( SURFACE-AT ?auto_722 ?auto_735 ) ( ON ?auto_722 ?auto_732 ) ( CLEAR ?auto_722 ) ( TRUCK-AT ?auto_725 ?auto_726 ) ( not ( = ?auto_721 ?auto_722 ) ) ( not ( = ?auto_721 ?auto_732 ) ) ( not ( = ?auto_722 ?auto_732 ) ) ( not ( = ?auto_730 ?auto_734 ) ) ( not ( = ?auto_721 ?auto_723 ) ) ( not ( = ?auto_721 ?auto_736 ) ) ( not ( = ?auto_723 ?auto_732 ) ) ( not ( = ?auto_731 ?auto_735 ) ) ( not ( = ?auto_733 ?auto_734 ) ) ( not ( = ?auto_736 ?auto_732 ) ) ( not ( = ?auto_721 ?auto_724 ) ) ( not ( = ?auto_721 ?auto_728 ) ) ( not ( = ?auto_722 ?auto_724 ) ) ( not ( = ?auto_722 ?auto_728 ) ) ( not ( = ?auto_724 ?auto_736 ) ) ( not ( = ?auto_724 ?auto_732 ) ) ( not ( = ?auto_729 ?auto_731 ) ) ( not ( = ?auto_729 ?auto_735 ) ) ( not ( = ?auto_727 ?auto_733 ) ) ( not ( = ?auto_727 ?auto_734 ) ) ( not ( = ?auto_728 ?auto_736 ) ) ( not ( = ?auto_728 ?auto_732 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_721 ?auto_722 ?auto_723 )
      ( MAKE-1CRATE ?auto_723 ?auto_724 )
      ( MAKE-3CRATE-VERIFY ?auto_721 ?auto_722 ?auto_723 ?auto_724 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_739 - SURFACE
      ?auto_740 - SURFACE
    )
    :vars
    (
      ?auto_741 - HOIST
      ?auto_742 - PLACE
      ?auto_744 - PLACE
      ?auto_745 - HOIST
      ?auto_746 - SURFACE
      ?auto_743 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_741 ?auto_742 ) ( SURFACE-AT ?auto_739 ?auto_742 ) ( CLEAR ?auto_739 ) ( IS-CRATE ?auto_740 ) ( AVAILABLE ?auto_741 ) ( not ( = ?auto_744 ?auto_742 ) ) ( HOIST-AT ?auto_745 ?auto_744 ) ( AVAILABLE ?auto_745 ) ( SURFACE-AT ?auto_740 ?auto_744 ) ( ON ?auto_740 ?auto_746 ) ( CLEAR ?auto_740 ) ( TRUCK-AT ?auto_743 ?auto_742 ) ( not ( = ?auto_739 ?auto_740 ) ) ( not ( = ?auto_739 ?auto_746 ) ) ( not ( = ?auto_740 ?auto_746 ) ) ( not ( = ?auto_741 ?auto_745 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_743 ?auto_742 ?auto_744 )
      ( !LIFT ?auto_745 ?auto_740 ?auto_746 ?auto_744 )
      ( !LOAD ?auto_745 ?auto_740 ?auto_743 ?auto_744 )
      ( !DRIVE ?auto_743 ?auto_744 ?auto_742 )
      ( !UNLOAD ?auto_741 ?auto_740 ?auto_743 ?auto_742 )
      ( !DROP ?auto_741 ?auto_740 ?auto_739 ?auto_742 )
      ( MAKE-1CRATE-VERIFY ?auto_739 ?auto_740 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_752 - SURFACE
      ?auto_753 - SURFACE
      ?auto_754 - SURFACE
      ?auto_755 - SURFACE
      ?auto_756 - SURFACE
    )
    :vars
    (
      ?auto_760 - HOIST
      ?auto_761 - PLACE
      ?auto_759 - PLACE
      ?auto_758 - HOIST
      ?auto_762 - SURFACE
      ?auto_768 - PLACE
      ?auto_766 - HOIST
      ?auto_765 - SURFACE
      ?auto_769 - PLACE
      ?auto_764 - HOIST
      ?auto_763 - SURFACE
      ?auto_767 - SURFACE
      ?auto_757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_760 ?auto_761 ) ( IS-CRATE ?auto_756 ) ( not ( = ?auto_759 ?auto_761 ) ) ( HOIST-AT ?auto_758 ?auto_759 ) ( SURFACE-AT ?auto_756 ?auto_759 ) ( ON ?auto_756 ?auto_762 ) ( CLEAR ?auto_756 ) ( not ( = ?auto_755 ?auto_756 ) ) ( not ( = ?auto_755 ?auto_762 ) ) ( not ( = ?auto_756 ?auto_762 ) ) ( not ( = ?auto_760 ?auto_758 ) ) ( IS-CRATE ?auto_755 ) ( not ( = ?auto_768 ?auto_761 ) ) ( HOIST-AT ?auto_766 ?auto_768 ) ( AVAILABLE ?auto_766 ) ( SURFACE-AT ?auto_755 ?auto_768 ) ( ON ?auto_755 ?auto_765 ) ( CLEAR ?auto_755 ) ( not ( = ?auto_754 ?auto_755 ) ) ( not ( = ?auto_754 ?auto_765 ) ) ( not ( = ?auto_755 ?auto_765 ) ) ( not ( = ?auto_760 ?auto_766 ) ) ( IS-CRATE ?auto_754 ) ( not ( = ?auto_769 ?auto_761 ) ) ( HOIST-AT ?auto_764 ?auto_769 ) ( AVAILABLE ?auto_764 ) ( SURFACE-AT ?auto_754 ?auto_769 ) ( ON ?auto_754 ?auto_763 ) ( CLEAR ?auto_754 ) ( not ( = ?auto_753 ?auto_754 ) ) ( not ( = ?auto_753 ?auto_763 ) ) ( not ( = ?auto_754 ?auto_763 ) ) ( not ( = ?auto_760 ?auto_764 ) ) ( SURFACE-AT ?auto_752 ?auto_761 ) ( CLEAR ?auto_752 ) ( IS-CRATE ?auto_753 ) ( AVAILABLE ?auto_760 ) ( AVAILABLE ?auto_758 ) ( SURFACE-AT ?auto_753 ?auto_759 ) ( ON ?auto_753 ?auto_767 ) ( CLEAR ?auto_753 ) ( TRUCK-AT ?auto_757 ?auto_761 ) ( not ( = ?auto_752 ?auto_753 ) ) ( not ( = ?auto_752 ?auto_767 ) ) ( not ( = ?auto_753 ?auto_767 ) ) ( not ( = ?auto_752 ?auto_754 ) ) ( not ( = ?auto_752 ?auto_763 ) ) ( not ( = ?auto_754 ?auto_767 ) ) ( not ( = ?auto_769 ?auto_759 ) ) ( not ( = ?auto_764 ?auto_758 ) ) ( not ( = ?auto_763 ?auto_767 ) ) ( not ( = ?auto_752 ?auto_755 ) ) ( not ( = ?auto_752 ?auto_765 ) ) ( not ( = ?auto_753 ?auto_755 ) ) ( not ( = ?auto_753 ?auto_765 ) ) ( not ( = ?auto_755 ?auto_763 ) ) ( not ( = ?auto_755 ?auto_767 ) ) ( not ( = ?auto_768 ?auto_769 ) ) ( not ( = ?auto_768 ?auto_759 ) ) ( not ( = ?auto_766 ?auto_764 ) ) ( not ( = ?auto_766 ?auto_758 ) ) ( not ( = ?auto_765 ?auto_763 ) ) ( not ( = ?auto_765 ?auto_767 ) ) ( not ( = ?auto_752 ?auto_756 ) ) ( not ( = ?auto_752 ?auto_762 ) ) ( not ( = ?auto_753 ?auto_756 ) ) ( not ( = ?auto_753 ?auto_762 ) ) ( not ( = ?auto_754 ?auto_756 ) ) ( not ( = ?auto_754 ?auto_762 ) ) ( not ( = ?auto_756 ?auto_765 ) ) ( not ( = ?auto_756 ?auto_763 ) ) ( not ( = ?auto_756 ?auto_767 ) ) ( not ( = ?auto_762 ?auto_765 ) ) ( not ( = ?auto_762 ?auto_763 ) ) ( not ( = ?auto_762 ?auto_767 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_752 ?auto_753 ?auto_754 ?auto_755 )
      ( MAKE-1CRATE ?auto_755 ?auto_756 )
      ( MAKE-4CRATE-VERIFY ?auto_752 ?auto_753 ?auto_754 ?auto_755 ?auto_756 ) )
  )

)

