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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_695 - SURFACE
      ?auto_696 - SURFACE
      ?auto_697 - SURFACE
    )
    :vars
    (
      ?auto_700 - HOIST
      ?auto_701 - PLACE
      ?auto_699 - PLACE
      ?auto_702 - HOIST
      ?auto_698 - SURFACE
      ?auto_705 - PLACE
      ?auto_704 - HOIST
      ?auto_706 - SURFACE
      ?auto_703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_700 ?auto_701 ) ( IS-CRATE ?auto_697 ) ( not ( = ?auto_699 ?auto_701 ) ) ( HOIST-AT ?auto_702 ?auto_699 ) ( AVAILABLE ?auto_702 ) ( SURFACE-AT ?auto_697 ?auto_699 ) ( ON ?auto_697 ?auto_698 ) ( CLEAR ?auto_697 ) ( not ( = ?auto_696 ?auto_697 ) ) ( not ( = ?auto_696 ?auto_698 ) ) ( not ( = ?auto_697 ?auto_698 ) ) ( not ( = ?auto_700 ?auto_702 ) ) ( SURFACE-AT ?auto_695 ?auto_701 ) ( CLEAR ?auto_695 ) ( IS-CRATE ?auto_696 ) ( AVAILABLE ?auto_700 ) ( not ( = ?auto_705 ?auto_701 ) ) ( HOIST-AT ?auto_704 ?auto_705 ) ( AVAILABLE ?auto_704 ) ( SURFACE-AT ?auto_696 ?auto_705 ) ( ON ?auto_696 ?auto_706 ) ( CLEAR ?auto_696 ) ( TRUCK-AT ?auto_703 ?auto_701 ) ( not ( = ?auto_695 ?auto_696 ) ) ( not ( = ?auto_695 ?auto_706 ) ) ( not ( = ?auto_696 ?auto_706 ) ) ( not ( = ?auto_700 ?auto_704 ) ) ( not ( = ?auto_695 ?auto_697 ) ) ( not ( = ?auto_695 ?auto_698 ) ) ( not ( = ?auto_697 ?auto_706 ) ) ( not ( = ?auto_699 ?auto_705 ) ) ( not ( = ?auto_702 ?auto_704 ) ) ( not ( = ?auto_698 ?auto_706 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_695 ?auto_696 )
      ( MAKE-1CRATE ?auto_696 ?auto_697 )
      ( MAKE-2CRATE-VERIFY ?auto_695 ?auto_696 ?auto_697 ) )
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
      ?auto_727 - HOIST
      ?auto_728 - PLACE
      ?auto_730 - PLACE
      ?auto_729 - HOIST
      ?auto_726 - SURFACE
      ?auto_733 - PLACE
      ?auto_736 - HOIST
      ?auto_735 - SURFACE
      ?auto_731 - PLACE
      ?auto_734 - HOIST
      ?auto_732 - SURFACE
      ?auto_725 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_727 ?auto_728 ) ( IS-CRATE ?auto_724 ) ( not ( = ?auto_730 ?auto_728 ) ) ( HOIST-AT ?auto_729 ?auto_730 ) ( AVAILABLE ?auto_729 ) ( SURFACE-AT ?auto_724 ?auto_730 ) ( ON ?auto_724 ?auto_726 ) ( CLEAR ?auto_724 ) ( not ( = ?auto_723 ?auto_724 ) ) ( not ( = ?auto_723 ?auto_726 ) ) ( not ( = ?auto_724 ?auto_726 ) ) ( not ( = ?auto_727 ?auto_729 ) ) ( IS-CRATE ?auto_723 ) ( not ( = ?auto_733 ?auto_728 ) ) ( HOIST-AT ?auto_736 ?auto_733 ) ( AVAILABLE ?auto_736 ) ( SURFACE-AT ?auto_723 ?auto_733 ) ( ON ?auto_723 ?auto_735 ) ( CLEAR ?auto_723 ) ( not ( = ?auto_722 ?auto_723 ) ) ( not ( = ?auto_722 ?auto_735 ) ) ( not ( = ?auto_723 ?auto_735 ) ) ( not ( = ?auto_727 ?auto_736 ) ) ( SURFACE-AT ?auto_721 ?auto_728 ) ( CLEAR ?auto_721 ) ( IS-CRATE ?auto_722 ) ( AVAILABLE ?auto_727 ) ( not ( = ?auto_731 ?auto_728 ) ) ( HOIST-AT ?auto_734 ?auto_731 ) ( AVAILABLE ?auto_734 ) ( SURFACE-AT ?auto_722 ?auto_731 ) ( ON ?auto_722 ?auto_732 ) ( CLEAR ?auto_722 ) ( TRUCK-AT ?auto_725 ?auto_728 ) ( not ( = ?auto_721 ?auto_722 ) ) ( not ( = ?auto_721 ?auto_732 ) ) ( not ( = ?auto_722 ?auto_732 ) ) ( not ( = ?auto_727 ?auto_734 ) ) ( not ( = ?auto_721 ?auto_723 ) ) ( not ( = ?auto_721 ?auto_735 ) ) ( not ( = ?auto_723 ?auto_732 ) ) ( not ( = ?auto_733 ?auto_731 ) ) ( not ( = ?auto_736 ?auto_734 ) ) ( not ( = ?auto_735 ?auto_732 ) ) ( not ( = ?auto_721 ?auto_724 ) ) ( not ( = ?auto_721 ?auto_726 ) ) ( not ( = ?auto_722 ?auto_724 ) ) ( not ( = ?auto_722 ?auto_726 ) ) ( not ( = ?auto_724 ?auto_735 ) ) ( not ( = ?auto_724 ?auto_732 ) ) ( not ( = ?auto_730 ?auto_733 ) ) ( not ( = ?auto_730 ?auto_731 ) ) ( not ( = ?auto_729 ?auto_736 ) ) ( not ( = ?auto_729 ?auto_734 ) ) ( not ( = ?auto_726 ?auto_735 ) ) ( not ( = ?auto_726 ?auto_732 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_721 ?auto_722 ?auto_723 )
      ( MAKE-1CRATE ?auto_723 ?auto_724 )
      ( MAKE-3CRATE-VERIFY ?auto_721 ?auto_722 ?auto_723 ?auto_724 ) )
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
      ?auto_757 - HOIST
      ?auto_760 - PLACE
      ?auto_762 - PLACE
      ?auto_761 - HOIST
      ?auto_759 - SURFACE
      ?auto_763 - PLACE
      ?auto_768 - HOIST
      ?auto_769 - SURFACE
      ?auto_765 - PLACE
      ?auto_766 - HOIST
      ?auto_764 - SURFACE
      ?auto_767 - SURFACE
      ?auto_758 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_757 ?auto_760 ) ( IS-CRATE ?auto_756 ) ( not ( = ?auto_762 ?auto_760 ) ) ( HOIST-AT ?auto_761 ?auto_762 ) ( SURFACE-AT ?auto_756 ?auto_762 ) ( ON ?auto_756 ?auto_759 ) ( CLEAR ?auto_756 ) ( not ( = ?auto_755 ?auto_756 ) ) ( not ( = ?auto_755 ?auto_759 ) ) ( not ( = ?auto_756 ?auto_759 ) ) ( not ( = ?auto_757 ?auto_761 ) ) ( IS-CRATE ?auto_755 ) ( not ( = ?auto_763 ?auto_760 ) ) ( HOIST-AT ?auto_768 ?auto_763 ) ( AVAILABLE ?auto_768 ) ( SURFACE-AT ?auto_755 ?auto_763 ) ( ON ?auto_755 ?auto_769 ) ( CLEAR ?auto_755 ) ( not ( = ?auto_754 ?auto_755 ) ) ( not ( = ?auto_754 ?auto_769 ) ) ( not ( = ?auto_755 ?auto_769 ) ) ( not ( = ?auto_757 ?auto_768 ) ) ( IS-CRATE ?auto_754 ) ( not ( = ?auto_765 ?auto_760 ) ) ( HOIST-AT ?auto_766 ?auto_765 ) ( AVAILABLE ?auto_766 ) ( SURFACE-AT ?auto_754 ?auto_765 ) ( ON ?auto_754 ?auto_764 ) ( CLEAR ?auto_754 ) ( not ( = ?auto_753 ?auto_754 ) ) ( not ( = ?auto_753 ?auto_764 ) ) ( not ( = ?auto_754 ?auto_764 ) ) ( not ( = ?auto_757 ?auto_766 ) ) ( SURFACE-AT ?auto_752 ?auto_760 ) ( CLEAR ?auto_752 ) ( IS-CRATE ?auto_753 ) ( AVAILABLE ?auto_757 ) ( AVAILABLE ?auto_761 ) ( SURFACE-AT ?auto_753 ?auto_762 ) ( ON ?auto_753 ?auto_767 ) ( CLEAR ?auto_753 ) ( TRUCK-AT ?auto_758 ?auto_760 ) ( not ( = ?auto_752 ?auto_753 ) ) ( not ( = ?auto_752 ?auto_767 ) ) ( not ( = ?auto_753 ?auto_767 ) ) ( not ( = ?auto_752 ?auto_754 ) ) ( not ( = ?auto_752 ?auto_764 ) ) ( not ( = ?auto_754 ?auto_767 ) ) ( not ( = ?auto_765 ?auto_762 ) ) ( not ( = ?auto_766 ?auto_761 ) ) ( not ( = ?auto_764 ?auto_767 ) ) ( not ( = ?auto_752 ?auto_755 ) ) ( not ( = ?auto_752 ?auto_769 ) ) ( not ( = ?auto_753 ?auto_755 ) ) ( not ( = ?auto_753 ?auto_769 ) ) ( not ( = ?auto_755 ?auto_764 ) ) ( not ( = ?auto_755 ?auto_767 ) ) ( not ( = ?auto_763 ?auto_765 ) ) ( not ( = ?auto_763 ?auto_762 ) ) ( not ( = ?auto_768 ?auto_766 ) ) ( not ( = ?auto_768 ?auto_761 ) ) ( not ( = ?auto_769 ?auto_764 ) ) ( not ( = ?auto_769 ?auto_767 ) ) ( not ( = ?auto_752 ?auto_756 ) ) ( not ( = ?auto_752 ?auto_759 ) ) ( not ( = ?auto_753 ?auto_756 ) ) ( not ( = ?auto_753 ?auto_759 ) ) ( not ( = ?auto_754 ?auto_756 ) ) ( not ( = ?auto_754 ?auto_759 ) ) ( not ( = ?auto_756 ?auto_769 ) ) ( not ( = ?auto_756 ?auto_764 ) ) ( not ( = ?auto_756 ?auto_767 ) ) ( not ( = ?auto_759 ?auto_769 ) ) ( not ( = ?auto_759 ?auto_764 ) ) ( not ( = ?auto_759 ?auto_767 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_752 ?auto_753 ?auto_754 ?auto_755 )
      ( MAKE-1CRATE ?auto_755 ?auto_756 )
      ( MAKE-4CRATE-VERIFY ?auto_752 ?auto_753 ?auto_754 ?auto_755 ?auto_756 ) )
  )

)

