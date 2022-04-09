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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18648 - SURFACE
      ?auto_18649 - SURFACE
    )
    :vars
    (
      ?auto_18650 - HOIST
      ?auto_18651 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18650 ?auto_18651 ) ( SURFACE-AT ?auto_18648 ?auto_18651 ) ( CLEAR ?auto_18648 ) ( LIFTING ?auto_18650 ?auto_18649 ) ( IS-CRATE ?auto_18649 ) ( not ( = ?auto_18648 ?auto_18649 ) ) )
    :subtasks
    ( ( !DROP ?auto_18650 ?auto_18649 ?auto_18648 ?auto_18651 )
      ( MAKE-1CRATE-VERIFY ?auto_18648 ?auto_18649 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18652 - SURFACE
      ?auto_18653 - SURFACE
    )
    :vars
    (
      ?auto_18655 - HOIST
      ?auto_18654 - PLACE
      ?auto_18656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18655 ?auto_18654 ) ( SURFACE-AT ?auto_18652 ?auto_18654 ) ( CLEAR ?auto_18652 ) ( IS-CRATE ?auto_18653 ) ( not ( = ?auto_18652 ?auto_18653 ) ) ( TRUCK-AT ?auto_18656 ?auto_18654 ) ( AVAILABLE ?auto_18655 ) ( IN ?auto_18653 ?auto_18656 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18655 ?auto_18653 ?auto_18656 ?auto_18654 )
      ( MAKE-1CRATE ?auto_18652 ?auto_18653 )
      ( MAKE-1CRATE-VERIFY ?auto_18652 ?auto_18653 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18657 - SURFACE
      ?auto_18658 - SURFACE
    )
    :vars
    (
      ?auto_18659 - HOIST
      ?auto_18660 - PLACE
      ?auto_18661 - TRUCK
      ?auto_18662 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18659 ?auto_18660 ) ( SURFACE-AT ?auto_18657 ?auto_18660 ) ( CLEAR ?auto_18657 ) ( IS-CRATE ?auto_18658 ) ( not ( = ?auto_18657 ?auto_18658 ) ) ( AVAILABLE ?auto_18659 ) ( IN ?auto_18658 ?auto_18661 ) ( TRUCK-AT ?auto_18661 ?auto_18662 ) ( not ( = ?auto_18662 ?auto_18660 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18661 ?auto_18662 ?auto_18660 )
      ( MAKE-1CRATE ?auto_18657 ?auto_18658 )
      ( MAKE-1CRATE-VERIFY ?auto_18657 ?auto_18658 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18663 - SURFACE
      ?auto_18664 - SURFACE
    )
    :vars
    (
      ?auto_18668 - HOIST
      ?auto_18665 - PLACE
      ?auto_18666 - TRUCK
      ?auto_18667 - PLACE
      ?auto_18669 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18668 ?auto_18665 ) ( SURFACE-AT ?auto_18663 ?auto_18665 ) ( CLEAR ?auto_18663 ) ( IS-CRATE ?auto_18664 ) ( not ( = ?auto_18663 ?auto_18664 ) ) ( AVAILABLE ?auto_18668 ) ( TRUCK-AT ?auto_18666 ?auto_18667 ) ( not ( = ?auto_18667 ?auto_18665 ) ) ( HOIST-AT ?auto_18669 ?auto_18667 ) ( LIFTING ?auto_18669 ?auto_18664 ) ( not ( = ?auto_18668 ?auto_18669 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18669 ?auto_18664 ?auto_18666 ?auto_18667 )
      ( MAKE-1CRATE ?auto_18663 ?auto_18664 )
      ( MAKE-1CRATE-VERIFY ?auto_18663 ?auto_18664 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18670 - SURFACE
      ?auto_18671 - SURFACE
    )
    :vars
    (
      ?auto_18673 - HOIST
      ?auto_18676 - PLACE
      ?auto_18675 - TRUCK
      ?auto_18674 - PLACE
      ?auto_18672 - HOIST
      ?auto_18677 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18673 ?auto_18676 ) ( SURFACE-AT ?auto_18670 ?auto_18676 ) ( CLEAR ?auto_18670 ) ( IS-CRATE ?auto_18671 ) ( not ( = ?auto_18670 ?auto_18671 ) ) ( AVAILABLE ?auto_18673 ) ( TRUCK-AT ?auto_18675 ?auto_18674 ) ( not ( = ?auto_18674 ?auto_18676 ) ) ( HOIST-AT ?auto_18672 ?auto_18674 ) ( not ( = ?auto_18673 ?auto_18672 ) ) ( AVAILABLE ?auto_18672 ) ( SURFACE-AT ?auto_18671 ?auto_18674 ) ( ON ?auto_18671 ?auto_18677 ) ( CLEAR ?auto_18671 ) ( not ( = ?auto_18670 ?auto_18677 ) ) ( not ( = ?auto_18671 ?auto_18677 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18672 ?auto_18671 ?auto_18677 ?auto_18674 )
      ( MAKE-1CRATE ?auto_18670 ?auto_18671 )
      ( MAKE-1CRATE-VERIFY ?auto_18670 ?auto_18671 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18678 - SURFACE
      ?auto_18679 - SURFACE
    )
    :vars
    (
      ?auto_18684 - HOIST
      ?auto_18683 - PLACE
      ?auto_18685 - PLACE
      ?auto_18680 - HOIST
      ?auto_18681 - SURFACE
      ?auto_18682 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18684 ?auto_18683 ) ( SURFACE-AT ?auto_18678 ?auto_18683 ) ( CLEAR ?auto_18678 ) ( IS-CRATE ?auto_18679 ) ( not ( = ?auto_18678 ?auto_18679 ) ) ( AVAILABLE ?auto_18684 ) ( not ( = ?auto_18685 ?auto_18683 ) ) ( HOIST-AT ?auto_18680 ?auto_18685 ) ( not ( = ?auto_18684 ?auto_18680 ) ) ( AVAILABLE ?auto_18680 ) ( SURFACE-AT ?auto_18679 ?auto_18685 ) ( ON ?auto_18679 ?auto_18681 ) ( CLEAR ?auto_18679 ) ( not ( = ?auto_18678 ?auto_18681 ) ) ( not ( = ?auto_18679 ?auto_18681 ) ) ( TRUCK-AT ?auto_18682 ?auto_18683 ) )
    :subtasks
    ( ( !DRIVE ?auto_18682 ?auto_18683 ?auto_18685 )
      ( MAKE-1CRATE ?auto_18678 ?auto_18679 )
      ( MAKE-1CRATE-VERIFY ?auto_18678 ?auto_18679 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18695 - SURFACE
      ?auto_18696 - SURFACE
      ?auto_18697 - SURFACE
    )
    :vars
    (
      ?auto_18699 - HOIST
      ?auto_18698 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18699 ?auto_18698 ) ( SURFACE-AT ?auto_18696 ?auto_18698 ) ( CLEAR ?auto_18696 ) ( LIFTING ?auto_18699 ?auto_18697 ) ( IS-CRATE ?auto_18697 ) ( not ( = ?auto_18696 ?auto_18697 ) ) ( ON ?auto_18696 ?auto_18695 ) ( not ( = ?auto_18695 ?auto_18696 ) ) ( not ( = ?auto_18695 ?auto_18697 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18696 ?auto_18697 )
      ( MAKE-2CRATE-VERIFY ?auto_18695 ?auto_18696 ?auto_18697 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18705 - SURFACE
      ?auto_18706 - SURFACE
      ?auto_18707 - SURFACE
    )
    :vars
    (
      ?auto_18709 - HOIST
      ?auto_18708 - PLACE
      ?auto_18710 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18709 ?auto_18708 ) ( SURFACE-AT ?auto_18706 ?auto_18708 ) ( CLEAR ?auto_18706 ) ( IS-CRATE ?auto_18707 ) ( not ( = ?auto_18706 ?auto_18707 ) ) ( TRUCK-AT ?auto_18710 ?auto_18708 ) ( AVAILABLE ?auto_18709 ) ( IN ?auto_18707 ?auto_18710 ) ( ON ?auto_18706 ?auto_18705 ) ( not ( = ?auto_18705 ?auto_18706 ) ) ( not ( = ?auto_18705 ?auto_18707 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18706 ?auto_18707 )
      ( MAKE-2CRATE-VERIFY ?auto_18705 ?auto_18706 ?auto_18707 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18711 - SURFACE
      ?auto_18712 - SURFACE
    )
    :vars
    (
      ?auto_18716 - HOIST
      ?auto_18713 - PLACE
      ?auto_18715 - TRUCK
      ?auto_18714 - SURFACE
      ?auto_18717 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18716 ?auto_18713 ) ( SURFACE-AT ?auto_18711 ?auto_18713 ) ( CLEAR ?auto_18711 ) ( IS-CRATE ?auto_18712 ) ( not ( = ?auto_18711 ?auto_18712 ) ) ( AVAILABLE ?auto_18716 ) ( IN ?auto_18712 ?auto_18715 ) ( ON ?auto_18711 ?auto_18714 ) ( not ( = ?auto_18714 ?auto_18711 ) ) ( not ( = ?auto_18714 ?auto_18712 ) ) ( TRUCK-AT ?auto_18715 ?auto_18717 ) ( not ( = ?auto_18717 ?auto_18713 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18715 ?auto_18717 ?auto_18713 )
      ( MAKE-2CRATE ?auto_18714 ?auto_18711 ?auto_18712 )
      ( MAKE-1CRATE-VERIFY ?auto_18711 ?auto_18712 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18718 - SURFACE
      ?auto_18719 - SURFACE
      ?auto_18720 - SURFACE
    )
    :vars
    (
      ?auto_18724 - HOIST
      ?auto_18721 - PLACE
      ?auto_18722 - TRUCK
      ?auto_18723 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18724 ?auto_18721 ) ( SURFACE-AT ?auto_18719 ?auto_18721 ) ( CLEAR ?auto_18719 ) ( IS-CRATE ?auto_18720 ) ( not ( = ?auto_18719 ?auto_18720 ) ) ( AVAILABLE ?auto_18724 ) ( IN ?auto_18720 ?auto_18722 ) ( ON ?auto_18719 ?auto_18718 ) ( not ( = ?auto_18718 ?auto_18719 ) ) ( not ( = ?auto_18718 ?auto_18720 ) ) ( TRUCK-AT ?auto_18722 ?auto_18723 ) ( not ( = ?auto_18723 ?auto_18721 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18719 ?auto_18720 )
      ( MAKE-2CRATE-VERIFY ?auto_18718 ?auto_18719 ?auto_18720 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18725 - SURFACE
      ?auto_18726 - SURFACE
    )
    :vars
    (
      ?auto_18731 - HOIST
      ?auto_18729 - PLACE
      ?auto_18727 - SURFACE
      ?auto_18728 - TRUCK
      ?auto_18730 - PLACE
      ?auto_18732 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18731 ?auto_18729 ) ( SURFACE-AT ?auto_18725 ?auto_18729 ) ( CLEAR ?auto_18725 ) ( IS-CRATE ?auto_18726 ) ( not ( = ?auto_18725 ?auto_18726 ) ) ( AVAILABLE ?auto_18731 ) ( ON ?auto_18725 ?auto_18727 ) ( not ( = ?auto_18727 ?auto_18725 ) ) ( not ( = ?auto_18727 ?auto_18726 ) ) ( TRUCK-AT ?auto_18728 ?auto_18730 ) ( not ( = ?auto_18730 ?auto_18729 ) ) ( HOIST-AT ?auto_18732 ?auto_18730 ) ( LIFTING ?auto_18732 ?auto_18726 ) ( not ( = ?auto_18731 ?auto_18732 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18732 ?auto_18726 ?auto_18728 ?auto_18730 )
      ( MAKE-2CRATE ?auto_18727 ?auto_18725 ?auto_18726 )
      ( MAKE-1CRATE-VERIFY ?auto_18725 ?auto_18726 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18733 - SURFACE
      ?auto_18734 - SURFACE
      ?auto_18735 - SURFACE
    )
    :vars
    (
      ?auto_18736 - HOIST
      ?auto_18740 - PLACE
      ?auto_18738 - TRUCK
      ?auto_18739 - PLACE
      ?auto_18737 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18736 ?auto_18740 ) ( SURFACE-AT ?auto_18734 ?auto_18740 ) ( CLEAR ?auto_18734 ) ( IS-CRATE ?auto_18735 ) ( not ( = ?auto_18734 ?auto_18735 ) ) ( AVAILABLE ?auto_18736 ) ( ON ?auto_18734 ?auto_18733 ) ( not ( = ?auto_18733 ?auto_18734 ) ) ( not ( = ?auto_18733 ?auto_18735 ) ) ( TRUCK-AT ?auto_18738 ?auto_18739 ) ( not ( = ?auto_18739 ?auto_18740 ) ) ( HOIST-AT ?auto_18737 ?auto_18739 ) ( LIFTING ?auto_18737 ?auto_18735 ) ( not ( = ?auto_18736 ?auto_18737 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18734 ?auto_18735 )
      ( MAKE-2CRATE-VERIFY ?auto_18733 ?auto_18734 ?auto_18735 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18741 - SURFACE
      ?auto_18742 - SURFACE
    )
    :vars
    (
      ?auto_18748 - HOIST
      ?auto_18746 - PLACE
      ?auto_18743 - SURFACE
      ?auto_18744 - TRUCK
      ?auto_18747 - PLACE
      ?auto_18745 - HOIST
      ?auto_18749 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18748 ?auto_18746 ) ( SURFACE-AT ?auto_18741 ?auto_18746 ) ( CLEAR ?auto_18741 ) ( IS-CRATE ?auto_18742 ) ( not ( = ?auto_18741 ?auto_18742 ) ) ( AVAILABLE ?auto_18748 ) ( ON ?auto_18741 ?auto_18743 ) ( not ( = ?auto_18743 ?auto_18741 ) ) ( not ( = ?auto_18743 ?auto_18742 ) ) ( TRUCK-AT ?auto_18744 ?auto_18747 ) ( not ( = ?auto_18747 ?auto_18746 ) ) ( HOIST-AT ?auto_18745 ?auto_18747 ) ( not ( = ?auto_18748 ?auto_18745 ) ) ( AVAILABLE ?auto_18745 ) ( SURFACE-AT ?auto_18742 ?auto_18747 ) ( ON ?auto_18742 ?auto_18749 ) ( CLEAR ?auto_18742 ) ( not ( = ?auto_18741 ?auto_18749 ) ) ( not ( = ?auto_18742 ?auto_18749 ) ) ( not ( = ?auto_18743 ?auto_18749 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18745 ?auto_18742 ?auto_18749 ?auto_18747 )
      ( MAKE-2CRATE ?auto_18743 ?auto_18741 ?auto_18742 )
      ( MAKE-1CRATE-VERIFY ?auto_18741 ?auto_18742 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18750 - SURFACE
      ?auto_18751 - SURFACE
      ?auto_18752 - SURFACE
    )
    :vars
    (
      ?auto_18755 - HOIST
      ?auto_18754 - PLACE
      ?auto_18758 - TRUCK
      ?auto_18756 - PLACE
      ?auto_18753 - HOIST
      ?auto_18757 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18755 ?auto_18754 ) ( SURFACE-AT ?auto_18751 ?auto_18754 ) ( CLEAR ?auto_18751 ) ( IS-CRATE ?auto_18752 ) ( not ( = ?auto_18751 ?auto_18752 ) ) ( AVAILABLE ?auto_18755 ) ( ON ?auto_18751 ?auto_18750 ) ( not ( = ?auto_18750 ?auto_18751 ) ) ( not ( = ?auto_18750 ?auto_18752 ) ) ( TRUCK-AT ?auto_18758 ?auto_18756 ) ( not ( = ?auto_18756 ?auto_18754 ) ) ( HOIST-AT ?auto_18753 ?auto_18756 ) ( not ( = ?auto_18755 ?auto_18753 ) ) ( AVAILABLE ?auto_18753 ) ( SURFACE-AT ?auto_18752 ?auto_18756 ) ( ON ?auto_18752 ?auto_18757 ) ( CLEAR ?auto_18752 ) ( not ( = ?auto_18751 ?auto_18757 ) ) ( not ( = ?auto_18752 ?auto_18757 ) ) ( not ( = ?auto_18750 ?auto_18757 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18751 ?auto_18752 )
      ( MAKE-2CRATE-VERIFY ?auto_18750 ?auto_18751 ?auto_18752 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18759 - SURFACE
      ?auto_18760 - SURFACE
    )
    :vars
    (
      ?auto_18765 - HOIST
      ?auto_18764 - PLACE
      ?auto_18762 - SURFACE
      ?auto_18767 - PLACE
      ?auto_18761 - HOIST
      ?auto_18766 - SURFACE
      ?auto_18763 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18765 ?auto_18764 ) ( SURFACE-AT ?auto_18759 ?auto_18764 ) ( CLEAR ?auto_18759 ) ( IS-CRATE ?auto_18760 ) ( not ( = ?auto_18759 ?auto_18760 ) ) ( AVAILABLE ?auto_18765 ) ( ON ?auto_18759 ?auto_18762 ) ( not ( = ?auto_18762 ?auto_18759 ) ) ( not ( = ?auto_18762 ?auto_18760 ) ) ( not ( = ?auto_18767 ?auto_18764 ) ) ( HOIST-AT ?auto_18761 ?auto_18767 ) ( not ( = ?auto_18765 ?auto_18761 ) ) ( AVAILABLE ?auto_18761 ) ( SURFACE-AT ?auto_18760 ?auto_18767 ) ( ON ?auto_18760 ?auto_18766 ) ( CLEAR ?auto_18760 ) ( not ( = ?auto_18759 ?auto_18766 ) ) ( not ( = ?auto_18760 ?auto_18766 ) ) ( not ( = ?auto_18762 ?auto_18766 ) ) ( TRUCK-AT ?auto_18763 ?auto_18764 ) )
    :subtasks
    ( ( !DRIVE ?auto_18763 ?auto_18764 ?auto_18767 )
      ( MAKE-2CRATE ?auto_18762 ?auto_18759 ?auto_18760 )
      ( MAKE-1CRATE-VERIFY ?auto_18759 ?auto_18760 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18768 - SURFACE
      ?auto_18769 - SURFACE
      ?auto_18770 - SURFACE
    )
    :vars
    (
      ?auto_18772 - HOIST
      ?auto_18774 - PLACE
      ?auto_18776 - PLACE
      ?auto_18775 - HOIST
      ?auto_18771 - SURFACE
      ?auto_18773 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18772 ?auto_18774 ) ( SURFACE-AT ?auto_18769 ?auto_18774 ) ( CLEAR ?auto_18769 ) ( IS-CRATE ?auto_18770 ) ( not ( = ?auto_18769 ?auto_18770 ) ) ( AVAILABLE ?auto_18772 ) ( ON ?auto_18769 ?auto_18768 ) ( not ( = ?auto_18768 ?auto_18769 ) ) ( not ( = ?auto_18768 ?auto_18770 ) ) ( not ( = ?auto_18776 ?auto_18774 ) ) ( HOIST-AT ?auto_18775 ?auto_18776 ) ( not ( = ?auto_18772 ?auto_18775 ) ) ( AVAILABLE ?auto_18775 ) ( SURFACE-AT ?auto_18770 ?auto_18776 ) ( ON ?auto_18770 ?auto_18771 ) ( CLEAR ?auto_18770 ) ( not ( = ?auto_18769 ?auto_18771 ) ) ( not ( = ?auto_18770 ?auto_18771 ) ) ( not ( = ?auto_18768 ?auto_18771 ) ) ( TRUCK-AT ?auto_18773 ?auto_18774 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18769 ?auto_18770 )
      ( MAKE-2CRATE-VERIFY ?auto_18768 ?auto_18769 ?auto_18770 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18777 - SURFACE
      ?auto_18778 - SURFACE
    )
    :vars
    (
      ?auto_18783 - HOIST
      ?auto_18779 - PLACE
      ?auto_18785 - SURFACE
      ?auto_18780 - PLACE
      ?auto_18784 - HOIST
      ?auto_18781 - SURFACE
      ?auto_18782 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18783 ?auto_18779 ) ( IS-CRATE ?auto_18778 ) ( not ( = ?auto_18777 ?auto_18778 ) ) ( not ( = ?auto_18785 ?auto_18777 ) ) ( not ( = ?auto_18785 ?auto_18778 ) ) ( not ( = ?auto_18780 ?auto_18779 ) ) ( HOIST-AT ?auto_18784 ?auto_18780 ) ( not ( = ?auto_18783 ?auto_18784 ) ) ( AVAILABLE ?auto_18784 ) ( SURFACE-AT ?auto_18778 ?auto_18780 ) ( ON ?auto_18778 ?auto_18781 ) ( CLEAR ?auto_18778 ) ( not ( = ?auto_18777 ?auto_18781 ) ) ( not ( = ?auto_18778 ?auto_18781 ) ) ( not ( = ?auto_18785 ?auto_18781 ) ) ( TRUCK-AT ?auto_18782 ?auto_18779 ) ( SURFACE-AT ?auto_18785 ?auto_18779 ) ( CLEAR ?auto_18785 ) ( LIFTING ?auto_18783 ?auto_18777 ) ( IS-CRATE ?auto_18777 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18785 ?auto_18777 )
      ( MAKE-2CRATE ?auto_18785 ?auto_18777 ?auto_18778 )
      ( MAKE-1CRATE-VERIFY ?auto_18777 ?auto_18778 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18786 - SURFACE
      ?auto_18787 - SURFACE
      ?auto_18788 - SURFACE
    )
    :vars
    (
      ?auto_18794 - HOIST
      ?auto_18792 - PLACE
      ?auto_18791 - PLACE
      ?auto_18789 - HOIST
      ?auto_18790 - SURFACE
      ?auto_18793 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18794 ?auto_18792 ) ( IS-CRATE ?auto_18788 ) ( not ( = ?auto_18787 ?auto_18788 ) ) ( not ( = ?auto_18786 ?auto_18787 ) ) ( not ( = ?auto_18786 ?auto_18788 ) ) ( not ( = ?auto_18791 ?auto_18792 ) ) ( HOIST-AT ?auto_18789 ?auto_18791 ) ( not ( = ?auto_18794 ?auto_18789 ) ) ( AVAILABLE ?auto_18789 ) ( SURFACE-AT ?auto_18788 ?auto_18791 ) ( ON ?auto_18788 ?auto_18790 ) ( CLEAR ?auto_18788 ) ( not ( = ?auto_18787 ?auto_18790 ) ) ( not ( = ?auto_18788 ?auto_18790 ) ) ( not ( = ?auto_18786 ?auto_18790 ) ) ( TRUCK-AT ?auto_18793 ?auto_18792 ) ( SURFACE-AT ?auto_18786 ?auto_18792 ) ( CLEAR ?auto_18786 ) ( LIFTING ?auto_18794 ?auto_18787 ) ( IS-CRATE ?auto_18787 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18787 ?auto_18788 )
      ( MAKE-2CRATE-VERIFY ?auto_18786 ?auto_18787 ?auto_18788 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18795 - SURFACE
      ?auto_18796 - SURFACE
    )
    :vars
    (
      ?auto_18801 - HOIST
      ?auto_18799 - PLACE
      ?auto_18802 - SURFACE
      ?auto_18797 - PLACE
      ?auto_18798 - HOIST
      ?auto_18800 - SURFACE
      ?auto_18803 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18801 ?auto_18799 ) ( IS-CRATE ?auto_18796 ) ( not ( = ?auto_18795 ?auto_18796 ) ) ( not ( = ?auto_18802 ?auto_18795 ) ) ( not ( = ?auto_18802 ?auto_18796 ) ) ( not ( = ?auto_18797 ?auto_18799 ) ) ( HOIST-AT ?auto_18798 ?auto_18797 ) ( not ( = ?auto_18801 ?auto_18798 ) ) ( AVAILABLE ?auto_18798 ) ( SURFACE-AT ?auto_18796 ?auto_18797 ) ( ON ?auto_18796 ?auto_18800 ) ( CLEAR ?auto_18796 ) ( not ( = ?auto_18795 ?auto_18800 ) ) ( not ( = ?auto_18796 ?auto_18800 ) ) ( not ( = ?auto_18802 ?auto_18800 ) ) ( TRUCK-AT ?auto_18803 ?auto_18799 ) ( SURFACE-AT ?auto_18802 ?auto_18799 ) ( CLEAR ?auto_18802 ) ( IS-CRATE ?auto_18795 ) ( AVAILABLE ?auto_18801 ) ( IN ?auto_18795 ?auto_18803 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18801 ?auto_18795 ?auto_18803 ?auto_18799 )
      ( MAKE-2CRATE ?auto_18802 ?auto_18795 ?auto_18796 )
      ( MAKE-1CRATE-VERIFY ?auto_18795 ?auto_18796 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18804 - SURFACE
      ?auto_18805 - SURFACE
      ?auto_18806 - SURFACE
    )
    :vars
    (
      ?auto_18810 - HOIST
      ?auto_18808 - PLACE
      ?auto_18809 - PLACE
      ?auto_18812 - HOIST
      ?auto_18807 - SURFACE
      ?auto_18811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18810 ?auto_18808 ) ( IS-CRATE ?auto_18806 ) ( not ( = ?auto_18805 ?auto_18806 ) ) ( not ( = ?auto_18804 ?auto_18805 ) ) ( not ( = ?auto_18804 ?auto_18806 ) ) ( not ( = ?auto_18809 ?auto_18808 ) ) ( HOIST-AT ?auto_18812 ?auto_18809 ) ( not ( = ?auto_18810 ?auto_18812 ) ) ( AVAILABLE ?auto_18812 ) ( SURFACE-AT ?auto_18806 ?auto_18809 ) ( ON ?auto_18806 ?auto_18807 ) ( CLEAR ?auto_18806 ) ( not ( = ?auto_18805 ?auto_18807 ) ) ( not ( = ?auto_18806 ?auto_18807 ) ) ( not ( = ?auto_18804 ?auto_18807 ) ) ( TRUCK-AT ?auto_18811 ?auto_18808 ) ( SURFACE-AT ?auto_18804 ?auto_18808 ) ( CLEAR ?auto_18804 ) ( IS-CRATE ?auto_18805 ) ( AVAILABLE ?auto_18810 ) ( IN ?auto_18805 ?auto_18811 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18805 ?auto_18806 )
      ( MAKE-2CRATE-VERIFY ?auto_18804 ?auto_18805 ?auto_18806 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18849 - SURFACE
      ?auto_18850 - SURFACE
    )
    :vars
    (
      ?auto_18853 - HOIST
      ?auto_18855 - PLACE
      ?auto_18856 - SURFACE
      ?auto_18854 - PLACE
      ?auto_18857 - HOIST
      ?auto_18851 - SURFACE
      ?auto_18852 - TRUCK
      ?auto_18858 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18853 ?auto_18855 ) ( SURFACE-AT ?auto_18849 ?auto_18855 ) ( CLEAR ?auto_18849 ) ( IS-CRATE ?auto_18850 ) ( not ( = ?auto_18849 ?auto_18850 ) ) ( AVAILABLE ?auto_18853 ) ( ON ?auto_18849 ?auto_18856 ) ( not ( = ?auto_18856 ?auto_18849 ) ) ( not ( = ?auto_18856 ?auto_18850 ) ) ( not ( = ?auto_18854 ?auto_18855 ) ) ( HOIST-AT ?auto_18857 ?auto_18854 ) ( not ( = ?auto_18853 ?auto_18857 ) ) ( AVAILABLE ?auto_18857 ) ( SURFACE-AT ?auto_18850 ?auto_18854 ) ( ON ?auto_18850 ?auto_18851 ) ( CLEAR ?auto_18850 ) ( not ( = ?auto_18849 ?auto_18851 ) ) ( not ( = ?auto_18850 ?auto_18851 ) ) ( not ( = ?auto_18856 ?auto_18851 ) ) ( TRUCK-AT ?auto_18852 ?auto_18858 ) ( not ( = ?auto_18858 ?auto_18855 ) ) ( not ( = ?auto_18854 ?auto_18858 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18852 ?auto_18858 ?auto_18855 )
      ( MAKE-1CRATE ?auto_18849 ?auto_18850 )
      ( MAKE-1CRATE-VERIFY ?auto_18849 ?auto_18850 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18888 - SURFACE
      ?auto_18889 - SURFACE
      ?auto_18890 - SURFACE
      ?auto_18891 - SURFACE
    )
    :vars
    (
      ?auto_18892 - HOIST
      ?auto_18893 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18892 ?auto_18893 ) ( SURFACE-AT ?auto_18890 ?auto_18893 ) ( CLEAR ?auto_18890 ) ( LIFTING ?auto_18892 ?auto_18891 ) ( IS-CRATE ?auto_18891 ) ( not ( = ?auto_18890 ?auto_18891 ) ) ( ON ?auto_18889 ?auto_18888 ) ( ON ?auto_18890 ?auto_18889 ) ( not ( = ?auto_18888 ?auto_18889 ) ) ( not ( = ?auto_18888 ?auto_18890 ) ) ( not ( = ?auto_18888 ?auto_18891 ) ) ( not ( = ?auto_18889 ?auto_18890 ) ) ( not ( = ?auto_18889 ?auto_18891 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18890 ?auto_18891 )
      ( MAKE-3CRATE-VERIFY ?auto_18888 ?auto_18889 ?auto_18890 ?auto_18891 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18905 - SURFACE
      ?auto_18906 - SURFACE
      ?auto_18907 - SURFACE
      ?auto_18908 - SURFACE
    )
    :vars
    (
      ?auto_18910 - HOIST
      ?auto_18909 - PLACE
      ?auto_18911 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18910 ?auto_18909 ) ( SURFACE-AT ?auto_18907 ?auto_18909 ) ( CLEAR ?auto_18907 ) ( IS-CRATE ?auto_18908 ) ( not ( = ?auto_18907 ?auto_18908 ) ) ( TRUCK-AT ?auto_18911 ?auto_18909 ) ( AVAILABLE ?auto_18910 ) ( IN ?auto_18908 ?auto_18911 ) ( ON ?auto_18907 ?auto_18906 ) ( not ( = ?auto_18906 ?auto_18907 ) ) ( not ( = ?auto_18906 ?auto_18908 ) ) ( ON ?auto_18906 ?auto_18905 ) ( not ( = ?auto_18905 ?auto_18906 ) ) ( not ( = ?auto_18905 ?auto_18907 ) ) ( not ( = ?auto_18905 ?auto_18908 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18906 ?auto_18907 ?auto_18908 )
      ( MAKE-3CRATE-VERIFY ?auto_18905 ?auto_18906 ?auto_18907 ?auto_18908 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18926 - SURFACE
      ?auto_18927 - SURFACE
      ?auto_18928 - SURFACE
      ?auto_18929 - SURFACE
    )
    :vars
    (
      ?auto_18933 - HOIST
      ?auto_18930 - PLACE
      ?auto_18932 - TRUCK
      ?auto_18931 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18933 ?auto_18930 ) ( SURFACE-AT ?auto_18928 ?auto_18930 ) ( CLEAR ?auto_18928 ) ( IS-CRATE ?auto_18929 ) ( not ( = ?auto_18928 ?auto_18929 ) ) ( AVAILABLE ?auto_18933 ) ( IN ?auto_18929 ?auto_18932 ) ( ON ?auto_18928 ?auto_18927 ) ( not ( = ?auto_18927 ?auto_18928 ) ) ( not ( = ?auto_18927 ?auto_18929 ) ) ( TRUCK-AT ?auto_18932 ?auto_18931 ) ( not ( = ?auto_18931 ?auto_18930 ) ) ( ON ?auto_18927 ?auto_18926 ) ( not ( = ?auto_18926 ?auto_18927 ) ) ( not ( = ?auto_18926 ?auto_18928 ) ) ( not ( = ?auto_18926 ?auto_18929 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18927 ?auto_18928 ?auto_18929 )
      ( MAKE-3CRATE-VERIFY ?auto_18926 ?auto_18927 ?auto_18928 ?auto_18929 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18950 - SURFACE
      ?auto_18951 - SURFACE
      ?auto_18952 - SURFACE
      ?auto_18953 - SURFACE
    )
    :vars
    (
      ?auto_18957 - HOIST
      ?auto_18956 - PLACE
      ?auto_18954 - TRUCK
      ?auto_18958 - PLACE
      ?auto_18955 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18957 ?auto_18956 ) ( SURFACE-AT ?auto_18952 ?auto_18956 ) ( CLEAR ?auto_18952 ) ( IS-CRATE ?auto_18953 ) ( not ( = ?auto_18952 ?auto_18953 ) ) ( AVAILABLE ?auto_18957 ) ( ON ?auto_18952 ?auto_18951 ) ( not ( = ?auto_18951 ?auto_18952 ) ) ( not ( = ?auto_18951 ?auto_18953 ) ) ( TRUCK-AT ?auto_18954 ?auto_18958 ) ( not ( = ?auto_18958 ?auto_18956 ) ) ( HOIST-AT ?auto_18955 ?auto_18958 ) ( LIFTING ?auto_18955 ?auto_18953 ) ( not ( = ?auto_18957 ?auto_18955 ) ) ( ON ?auto_18951 ?auto_18950 ) ( not ( = ?auto_18950 ?auto_18951 ) ) ( not ( = ?auto_18950 ?auto_18952 ) ) ( not ( = ?auto_18950 ?auto_18953 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18951 ?auto_18952 ?auto_18953 )
      ( MAKE-3CRATE-VERIFY ?auto_18950 ?auto_18951 ?auto_18952 ?auto_18953 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18977 - SURFACE
      ?auto_18978 - SURFACE
      ?auto_18979 - SURFACE
      ?auto_18980 - SURFACE
    )
    :vars
    (
      ?auto_18981 - HOIST
      ?auto_18982 - PLACE
      ?auto_18986 - TRUCK
      ?auto_18984 - PLACE
      ?auto_18983 - HOIST
      ?auto_18985 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18981 ?auto_18982 ) ( SURFACE-AT ?auto_18979 ?auto_18982 ) ( CLEAR ?auto_18979 ) ( IS-CRATE ?auto_18980 ) ( not ( = ?auto_18979 ?auto_18980 ) ) ( AVAILABLE ?auto_18981 ) ( ON ?auto_18979 ?auto_18978 ) ( not ( = ?auto_18978 ?auto_18979 ) ) ( not ( = ?auto_18978 ?auto_18980 ) ) ( TRUCK-AT ?auto_18986 ?auto_18984 ) ( not ( = ?auto_18984 ?auto_18982 ) ) ( HOIST-AT ?auto_18983 ?auto_18984 ) ( not ( = ?auto_18981 ?auto_18983 ) ) ( AVAILABLE ?auto_18983 ) ( SURFACE-AT ?auto_18980 ?auto_18984 ) ( ON ?auto_18980 ?auto_18985 ) ( CLEAR ?auto_18980 ) ( not ( = ?auto_18979 ?auto_18985 ) ) ( not ( = ?auto_18980 ?auto_18985 ) ) ( not ( = ?auto_18978 ?auto_18985 ) ) ( ON ?auto_18978 ?auto_18977 ) ( not ( = ?auto_18977 ?auto_18978 ) ) ( not ( = ?auto_18977 ?auto_18979 ) ) ( not ( = ?auto_18977 ?auto_18980 ) ) ( not ( = ?auto_18977 ?auto_18985 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18978 ?auto_18979 ?auto_18980 )
      ( MAKE-3CRATE-VERIFY ?auto_18977 ?auto_18978 ?auto_18979 ?auto_18980 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19005 - SURFACE
      ?auto_19006 - SURFACE
      ?auto_19007 - SURFACE
      ?auto_19008 - SURFACE
    )
    :vars
    (
      ?auto_19012 - HOIST
      ?auto_19014 - PLACE
      ?auto_19010 - PLACE
      ?auto_19009 - HOIST
      ?auto_19011 - SURFACE
      ?auto_19013 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19012 ?auto_19014 ) ( SURFACE-AT ?auto_19007 ?auto_19014 ) ( CLEAR ?auto_19007 ) ( IS-CRATE ?auto_19008 ) ( not ( = ?auto_19007 ?auto_19008 ) ) ( AVAILABLE ?auto_19012 ) ( ON ?auto_19007 ?auto_19006 ) ( not ( = ?auto_19006 ?auto_19007 ) ) ( not ( = ?auto_19006 ?auto_19008 ) ) ( not ( = ?auto_19010 ?auto_19014 ) ) ( HOIST-AT ?auto_19009 ?auto_19010 ) ( not ( = ?auto_19012 ?auto_19009 ) ) ( AVAILABLE ?auto_19009 ) ( SURFACE-AT ?auto_19008 ?auto_19010 ) ( ON ?auto_19008 ?auto_19011 ) ( CLEAR ?auto_19008 ) ( not ( = ?auto_19007 ?auto_19011 ) ) ( not ( = ?auto_19008 ?auto_19011 ) ) ( not ( = ?auto_19006 ?auto_19011 ) ) ( TRUCK-AT ?auto_19013 ?auto_19014 ) ( ON ?auto_19006 ?auto_19005 ) ( not ( = ?auto_19005 ?auto_19006 ) ) ( not ( = ?auto_19005 ?auto_19007 ) ) ( not ( = ?auto_19005 ?auto_19008 ) ) ( not ( = ?auto_19005 ?auto_19011 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19006 ?auto_19007 ?auto_19008 )
      ( MAKE-3CRATE-VERIFY ?auto_19005 ?auto_19006 ?auto_19007 ?auto_19008 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19033 - SURFACE
      ?auto_19034 - SURFACE
      ?auto_19035 - SURFACE
      ?auto_19036 - SURFACE
    )
    :vars
    (
      ?auto_19042 - HOIST
      ?auto_19039 - PLACE
      ?auto_19040 - PLACE
      ?auto_19037 - HOIST
      ?auto_19038 - SURFACE
      ?auto_19041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19042 ?auto_19039 ) ( IS-CRATE ?auto_19036 ) ( not ( = ?auto_19035 ?auto_19036 ) ) ( not ( = ?auto_19034 ?auto_19035 ) ) ( not ( = ?auto_19034 ?auto_19036 ) ) ( not ( = ?auto_19040 ?auto_19039 ) ) ( HOIST-AT ?auto_19037 ?auto_19040 ) ( not ( = ?auto_19042 ?auto_19037 ) ) ( AVAILABLE ?auto_19037 ) ( SURFACE-AT ?auto_19036 ?auto_19040 ) ( ON ?auto_19036 ?auto_19038 ) ( CLEAR ?auto_19036 ) ( not ( = ?auto_19035 ?auto_19038 ) ) ( not ( = ?auto_19036 ?auto_19038 ) ) ( not ( = ?auto_19034 ?auto_19038 ) ) ( TRUCK-AT ?auto_19041 ?auto_19039 ) ( SURFACE-AT ?auto_19034 ?auto_19039 ) ( CLEAR ?auto_19034 ) ( LIFTING ?auto_19042 ?auto_19035 ) ( IS-CRATE ?auto_19035 ) ( ON ?auto_19034 ?auto_19033 ) ( not ( = ?auto_19033 ?auto_19034 ) ) ( not ( = ?auto_19033 ?auto_19035 ) ) ( not ( = ?auto_19033 ?auto_19036 ) ) ( not ( = ?auto_19033 ?auto_19038 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19034 ?auto_19035 ?auto_19036 )
      ( MAKE-3CRATE-VERIFY ?auto_19033 ?auto_19034 ?auto_19035 ?auto_19036 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19061 - SURFACE
      ?auto_19062 - SURFACE
      ?auto_19063 - SURFACE
      ?auto_19064 - SURFACE
    )
    :vars
    (
      ?auto_19067 - HOIST
      ?auto_19070 - PLACE
      ?auto_19065 - PLACE
      ?auto_19066 - HOIST
      ?auto_19069 - SURFACE
      ?auto_19068 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19067 ?auto_19070 ) ( IS-CRATE ?auto_19064 ) ( not ( = ?auto_19063 ?auto_19064 ) ) ( not ( = ?auto_19062 ?auto_19063 ) ) ( not ( = ?auto_19062 ?auto_19064 ) ) ( not ( = ?auto_19065 ?auto_19070 ) ) ( HOIST-AT ?auto_19066 ?auto_19065 ) ( not ( = ?auto_19067 ?auto_19066 ) ) ( AVAILABLE ?auto_19066 ) ( SURFACE-AT ?auto_19064 ?auto_19065 ) ( ON ?auto_19064 ?auto_19069 ) ( CLEAR ?auto_19064 ) ( not ( = ?auto_19063 ?auto_19069 ) ) ( not ( = ?auto_19064 ?auto_19069 ) ) ( not ( = ?auto_19062 ?auto_19069 ) ) ( TRUCK-AT ?auto_19068 ?auto_19070 ) ( SURFACE-AT ?auto_19062 ?auto_19070 ) ( CLEAR ?auto_19062 ) ( IS-CRATE ?auto_19063 ) ( AVAILABLE ?auto_19067 ) ( IN ?auto_19063 ?auto_19068 ) ( ON ?auto_19062 ?auto_19061 ) ( not ( = ?auto_19061 ?auto_19062 ) ) ( not ( = ?auto_19061 ?auto_19063 ) ) ( not ( = ?auto_19061 ?auto_19064 ) ) ( not ( = ?auto_19061 ?auto_19069 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19062 ?auto_19063 ?auto_19064 )
      ( MAKE-3CRATE-VERIFY ?auto_19061 ?auto_19062 ?auto_19063 ?auto_19064 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19352 - SURFACE
      ?auto_19353 - SURFACE
      ?auto_19354 - SURFACE
      ?auto_19355 - SURFACE
      ?auto_19356 - SURFACE
    )
    :vars
    (
      ?auto_19358 - HOIST
      ?auto_19357 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19358 ?auto_19357 ) ( SURFACE-AT ?auto_19355 ?auto_19357 ) ( CLEAR ?auto_19355 ) ( LIFTING ?auto_19358 ?auto_19356 ) ( IS-CRATE ?auto_19356 ) ( not ( = ?auto_19355 ?auto_19356 ) ) ( ON ?auto_19353 ?auto_19352 ) ( ON ?auto_19354 ?auto_19353 ) ( ON ?auto_19355 ?auto_19354 ) ( not ( = ?auto_19352 ?auto_19353 ) ) ( not ( = ?auto_19352 ?auto_19354 ) ) ( not ( = ?auto_19352 ?auto_19355 ) ) ( not ( = ?auto_19352 ?auto_19356 ) ) ( not ( = ?auto_19353 ?auto_19354 ) ) ( not ( = ?auto_19353 ?auto_19355 ) ) ( not ( = ?auto_19353 ?auto_19356 ) ) ( not ( = ?auto_19354 ?auto_19355 ) ) ( not ( = ?auto_19354 ?auto_19356 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19355 ?auto_19356 )
      ( MAKE-4CRATE-VERIFY ?auto_19352 ?auto_19353 ?auto_19354 ?auto_19355 ?auto_19356 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19377 - SURFACE
      ?auto_19378 - SURFACE
      ?auto_19379 - SURFACE
      ?auto_19380 - SURFACE
      ?auto_19381 - SURFACE
    )
    :vars
    (
      ?auto_19382 - HOIST
      ?auto_19383 - PLACE
      ?auto_19384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19382 ?auto_19383 ) ( SURFACE-AT ?auto_19380 ?auto_19383 ) ( CLEAR ?auto_19380 ) ( IS-CRATE ?auto_19381 ) ( not ( = ?auto_19380 ?auto_19381 ) ) ( TRUCK-AT ?auto_19384 ?auto_19383 ) ( AVAILABLE ?auto_19382 ) ( IN ?auto_19381 ?auto_19384 ) ( ON ?auto_19380 ?auto_19379 ) ( not ( = ?auto_19379 ?auto_19380 ) ) ( not ( = ?auto_19379 ?auto_19381 ) ) ( ON ?auto_19378 ?auto_19377 ) ( ON ?auto_19379 ?auto_19378 ) ( not ( = ?auto_19377 ?auto_19378 ) ) ( not ( = ?auto_19377 ?auto_19379 ) ) ( not ( = ?auto_19377 ?auto_19380 ) ) ( not ( = ?auto_19377 ?auto_19381 ) ) ( not ( = ?auto_19378 ?auto_19379 ) ) ( not ( = ?auto_19378 ?auto_19380 ) ) ( not ( = ?auto_19378 ?auto_19381 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19379 ?auto_19380 ?auto_19381 )
      ( MAKE-4CRATE-VERIFY ?auto_19377 ?auto_19378 ?auto_19379 ?auto_19380 ?auto_19381 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19407 - SURFACE
      ?auto_19408 - SURFACE
      ?auto_19409 - SURFACE
      ?auto_19410 - SURFACE
      ?auto_19411 - SURFACE
    )
    :vars
    (
      ?auto_19414 - HOIST
      ?auto_19415 - PLACE
      ?auto_19413 - TRUCK
      ?auto_19412 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19414 ?auto_19415 ) ( SURFACE-AT ?auto_19410 ?auto_19415 ) ( CLEAR ?auto_19410 ) ( IS-CRATE ?auto_19411 ) ( not ( = ?auto_19410 ?auto_19411 ) ) ( AVAILABLE ?auto_19414 ) ( IN ?auto_19411 ?auto_19413 ) ( ON ?auto_19410 ?auto_19409 ) ( not ( = ?auto_19409 ?auto_19410 ) ) ( not ( = ?auto_19409 ?auto_19411 ) ) ( TRUCK-AT ?auto_19413 ?auto_19412 ) ( not ( = ?auto_19412 ?auto_19415 ) ) ( ON ?auto_19408 ?auto_19407 ) ( ON ?auto_19409 ?auto_19408 ) ( not ( = ?auto_19407 ?auto_19408 ) ) ( not ( = ?auto_19407 ?auto_19409 ) ) ( not ( = ?auto_19407 ?auto_19410 ) ) ( not ( = ?auto_19407 ?auto_19411 ) ) ( not ( = ?auto_19408 ?auto_19409 ) ) ( not ( = ?auto_19408 ?auto_19410 ) ) ( not ( = ?auto_19408 ?auto_19411 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19409 ?auto_19410 ?auto_19411 )
      ( MAKE-4CRATE-VERIFY ?auto_19407 ?auto_19408 ?auto_19409 ?auto_19410 ?auto_19411 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19441 - SURFACE
      ?auto_19442 - SURFACE
      ?auto_19443 - SURFACE
      ?auto_19444 - SURFACE
      ?auto_19445 - SURFACE
    )
    :vars
    (
      ?auto_19448 - HOIST
      ?auto_19450 - PLACE
      ?auto_19447 - TRUCK
      ?auto_19449 - PLACE
      ?auto_19446 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19448 ?auto_19450 ) ( SURFACE-AT ?auto_19444 ?auto_19450 ) ( CLEAR ?auto_19444 ) ( IS-CRATE ?auto_19445 ) ( not ( = ?auto_19444 ?auto_19445 ) ) ( AVAILABLE ?auto_19448 ) ( ON ?auto_19444 ?auto_19443 ) ( not ( = ?auto_19443 ?auto_19444 ) ) ( not ( = ?auto_19443 ?auto_19445 ) ) ( TRUCK-AT ?auto_19447 ?auto_19449 ) ( not ( = ?auto_19449 ?auto_19450 ) ) ( HOIST-AT ?auto_19446 ?auto_19449 ) ( LIFTING ?auto_19446 ?auto_19445 ) ( not ( = ?auto_19448 ?auto_19446 ) ) ( ON ?auto_19442 ?auto_19441 ) ( ON ?auto_19443 ?auto_19442 ) ( not ( = ?auto_19441 ?auto_19442 ) ) ( not ( = ?auto_19441 ?auto_19443 ) ) ( not ( = ?auto_19441 ?auto_19444 ) ) ( not ( = ?auto_19441 ?auto_19445 ) ) ( not ( = ?auto_19442 ?auto_19443 ) ) ( not ( = ?auto_19442 ?auto_19444 ) ) ( not ( = ?auto_19442 ?auto_19445 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19443 ?auto_19444 ?auto_19445 )
      ( MAKE-4CRATE-VERIFY ?auto_19441 ?auto_19442 ?auto_19443 ?auto_19444 ?auto_19445 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19479 - SURFACE
      ?auto_19480 - SURFACE
      ?auto_19481 - SURFACE
      ?auto_19482 - SURFACE
      ?auto_19483 - SURFACE
    )
    :vars
    (
      ?auto_19486 - HOIST
      ?auto_19489 - PLACE
      ?auto_19487 - TRUCK
      ?auto_19488 - PLACE
      ?auto_19485 - HOIST
      ?auto_19484 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19486 ?auto_19489 ) ( SURFACE-AT ?auto_19482 ?auto_19489 ) ( CLEAR ?auto_19482 ) ( IS-CRATE ?auto_19483 ) ( not ( = ?auto_19482 ?auto_19483 ) ) ( AVAILABLE ?auto_19486 ) ( ON ?auto_19482 ?auto_19481 ) ( not ( = ?auto_19481 ?auto_19482 ) ) ( not ( = ?auto_19481 ?auto_19483 ) ) ( TRUCK-AT ?auto_19487 ?auto_19488 ) ( not ( = ?auto_19488 ?auto_19489 ) ) ( HOIST-AT ?auto_19485 ?auto_19488 ) ( not ( = ?auto_19486 ?auto_19485 ) ) ( AVAILABLE ?auto_19485 ) ( SURFACE-AT ?auto_19483 ?auto_19488 ) ( ON ?auto_19483 ?auto_19484 ) ( CLEAR ?auto_19483 ) ( not ( = ?auto_19482 ?auto_19484 ) ) ( not ( = ?auto_19483 ?auto_19484 ) ) ( not ( = ?auto_19481 ?auto_19484 ) ) ( ON ?auto_19480 ?auto_19479 ) ( ON ?auto_19481 ?auto_19480 ) ( not ( = ?auto_19479 ?auto_19480 ) ) ( not ( = ?auto_19479 ?auto_19481 ) ) ( not ( = ?auto_19479 ?auto_19482 ) ) ( not ( = ?auto_19479 ?auto_19483 ) ) ( not ( = ?auto_19479 ?auto_19484 ) ) ( not ( = ?auto_19480 ?auto_19481 ) ) ( not ( = ?auto_19480 ?auto_19482 ) ) ( not ( = ?auto_19480 ?auto_19483 ) ) ( not ( = ?auto_19480 ?auto_19484 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19481 ?auto_19482 ?auto_19483 )
      ( MAKE-4CRATE-VERIFY ?auto_19479 ?auto_19480 ?auto_19481 ?auto_19482 ?auto_19483 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19518 - SURFACE
      ?auto_19519 - SURFACE
      ?auto_19520 - SURFACE
      ?auto_19521 - SURFACE
      ?auto_19522 - SURFACE
    )
    :vars
    (
      ?auto_19524 - HOIST
      ?auto_19527 - PLACE
      ?auto_19528 - PLACE
      ?auto_19526 - HOIST
      ?auto_19523 - SURFACE
      ?auto_19525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19524 ?auto_19527 ) ( SURFACE-AT ?auto_19521 ?auto_19527 ) ( CLEAR ?auto_19521 ) ( IS-CRATE ?auto_19522 ) ( not ( = ?auto_19521 ?auto_19522 ) ) ( AVAILABLE ?auto_19524 ) ( ON ?auto_19521 ?auto_19520 ) ( not ( = ?auto_19520 ?auto_19521 ) ) ( not ( = ?auto_19520 ?auto_19522 ) ) ( not ( = ?auto_19528 ?auto_19527 ) ) ( HOIST-AT ?auto_19526 ?auto_19528 ) ( not ( = ?auto_19524 ?auto_19526 ) ) ( AVAILABLE ?auto_19526 ) ( SURFACE-AT ?auto_19522 ?auto_19528 ) ( ON ?auto_19522 ?auto_19523 ) ( CLEAR ?auto_19522 ) ( not ( = ?auto_19521 ?auto_19523 ) ) ( not ( = ?auto_19522 ?auto_19523 ) ) ( not ( = ?auto_19520 ?auto_19523 ) ) ( TRUCK-AT ?auto_19525 ?auto_19527 ) ( ON ?auto_19519 ?auto_19518 ) ( ON ?auto_19520 ?auto_19519 ) ( not ( = ?auto_19518 ?auto_19519 ) ) ( not ( = ?auto_19518 ?auto_19520 ) ) ( not ( = ?auto_19518 ?auto_19521 ) ) ( not ( = ?auto_19518 ?auto_19522 ) ) ( not ( = ?auto_19518 ?auto_19523 ) ) ( not ( = ?auto_19519 ?auto_19520 ) ) ( not ( = ?auto_19519 ?auto_19521 ) ) ( not ( = ?auto_19519 ?auto_19522 ) ) ( not ( = ?auto_19519 ?auto_19523 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19520 ?auto_19521 ?auto_19522 )
      ( MAKE-4CRATE-VERIFY ?auto_19518 ?auto_19519 ?auto_19520 ?auto_19521 ?auto_19522 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19557 - SURFACE
      ?auto_19558 - SURFACE
      ?auto_19559 - SURFACE
      ?auto_19560 - SURFACE
      ?auto_19561 - SURFACE
    )
    :vars
    (
      ?auto_19564 - HOIST
      ?auto_19562 - PLACE
      ?auto_19565 - PLACE
      ?auto_19566 - HOIST
      ?auto_19563 - SURFACE
      ?auto_19567 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19564 ?auto_19562 ) ( IS-CRATE ?auto_19561 ) ( not ( = ?auto_19560 ?auto_19561 ) ) ( not ( = ?auto_19559 ?auto_19560 ) ) ( not ( = ?auto_19559 ?auto_19561 ) ) ( not ( = ?auto_19565 ?auto_19562 ) ) ( HOIST-AT ?auto_19566 ?auto_19565 ) ( not ( = ?auto_19564 ?auto_19566 ) ) ( AVAILABLE ?auto_19566 ) ( SURFACE-AT ?auto_19561 ?auto_19565 ) ( ON ?auto_19561 ?auto_19563 ) ( CLEAR ?auto_19561 ) ( not ( = ?auto_19560 ?auto_19563 ) ) ( not ( = ?auto_19561 ?auto_19563 ) ) ( not ( = ?auto_19559 ?auto_19563 ) ) ( TRUCK-AT ?auto_19567 ?auto_19562 ) ( SURFACE-AT ?auto_19559 ?auto_19562 ) ( CLEAR ?auto_19559 ) ( LIFTING ?auto_19564 ?auto_19560 ) ( IS-CRATE ?auto_19560 ) ( ON ?auto_19558 ?auto_19557 ) ( ON ?auto_19559 ?auto_19558 ) ( not ( = ?auto_19557 ?auto_19558 ) ) ( not ( = ?auto_19557 ?auto_19559 ) ) ( not ( = ?auto_19557 ?auto_19560 ) ) ( not ( = ?auto_19557 ?auto_19561 ) ) ( not ( = ?auto_19557 ?auto_19563 ) ) ( not ( = ?auto_19558 ?auto_19559 ) ) ( not ( = ?auto_19558 ?auto_19560 ) ) ( not ( = ?auto_19558 ?auto_19561 ) ) ( not ( = ?auto_19558 ?auto_19563 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19559 ?auto_19560 ?auto_19561 )
      ( MAKE-4CRATE-VERIFY ?auto_19557 ?auto_19558 ?auto_19559 ?auto_19560 ?auto_19561 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19596 - SURFACE
      ?auto_19597 - SURFACE
      ?auto_19598 - SURFACE
      ?auto_19599 - SURFACE
      ?auto_19600 - SURFACE
    )
    :vars
    (
      ?auto_19602 - HOIST
      ?auto_19604 - PLACE
      ?auto_19603 - PLACE
      ?auto_19605 - HOIST
      ?auto_19601 - SURFACE
      ?auto_19606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19602 ?auto_19604 ) ( IS-CRATE ?auto_19600 ) ( not ( = ?auto_19599 ?auto_19600 ) ) ( not ( = ?auto_19598 ?auto_19599 ) ) ( not ( = ?auto_19598 ?auto_19600 ) ) ( not ( = ?auto_19603 ?auto_19604 ) ) ( HOIST-AT ?auto_19605 ?auto_19603 ) ( not ( = ?auto_19602 ?auto_19605 ) ) ( AVAILABLE ?auto_19605 ) ( SURFACE-AT ?auto_19600 ?auto_19603 ) ( ON ?auto_19600 ?auto_19601 ) ( CLEAR ?auto_19600 ) ( not ( = ?auto_19599 ?auto_19601 ) ) ( not ( = ?auto_19600 ?auto_19601 ) ) ( not ( = ?auto_19598 ?auto_19601 ) ) ( TRUCK-AT ?auto_19606 ?auto_19604 ) ( SURFACE-AT ?auto_19598 ?auto_19604 ) ( CLEAR ?auto_19598 ) ( IS-CRATE ?auto_19599 ) ( AVAILABLE ?auto_19602 ) ( IN ?auto_19599 ?auto_19606 ) ( ON ?auto_19597 ?auto_19596 ) ( ON ?auto_19598 ?auto_19597 ) ( not ( = ?auto_19596 ?auto_19597 ) ) ( not ( = ?auto_19596 ?auto_19598 ) ) ( not ( = ?auto_19596 ?auto_19599 ) ) ( not ( = ?auto_19596 ?auto_19600 ) ) ( not ( = ?auto_19596 ?auto_19601 ) ) ( not ( = ?auto_19597 ?auto_19598 ) ) ( not ( = ?auto_19597 ?auto_19599 ) ) ( not ( = ?auto_19597 ?auto_19600 ) ) ( not ( = ?auto_19597 ?auto_19601 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19598 ?auto_19599 ?auto_19600 )
      ( MAKE-4CRATE-VERIFY ?auto_19596 ?auto_19597 ?auto_19598 ?auto_19599 ?auto_19600 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19607 - SURFACE
      ?auto_19608 - SURFACE
    )
    :vars
    (
      ?auto_19610 - HOIST
      ?auto_19612 - PLACE
      ?auto_19615 - SURFACE
      ?auto_19611 - PLACE
      ?auto_19613 - HOIST
      ?auto_19609 - SURFACE
      ?auto_19614 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19610 ?auto_19612 ) ( IS-CRATE ?auto_19608 ) ( not ( = ?auto_19607 ?auto_19608 ) ) ( not ( = ?auto_19615 ?auto_19607 ) ) ( not ( = ?auto_19615 ?auto_19608 ) ) ( not ( = ?auto_19611 ?auto_19612 ) ) ( HOIST-AT ?auto_19613 ?auto_19611 ) ( not ( = ?auto_19610 ?auto_19613 ) ) ( AVAILABLE ?auto_19613 ) ( SURFACE-AT ?auto_19608 ?auto_19611 ) ( ON ?auto_19608 ?auto_19609 ) ( CLEAR ?auto_19608 ) ( not ( = ?auto_19607 ?auto_19609 ) ) ( not ( = ?auto_19608 ?auto_19609 ) ) ( not ( = ?auto_19615 ?auto_19609 ) ) ( SURFACE-AT ?auto_19615 ?auto_19612 ) ( CLEAR ?auto_19615 ) ( IS-CRATE ?auto_19607 ) ( AVAILABLE ?auto_19610 ) ( IN ?auto_19607 ?auto_19614 ) ( TRUCK-AT ?auto_19614 ?auto_19611 ) )
    :subtasks
    ( ( !DRIVE ?auto_19614 ?auto_19611 ?auto_19612 )
      ( MAKE-2CRATE ?auto_19615 ?auto_19607 ?auto_19608 )
      ( MAKE-1CRATE-VERIFY ?auto_19607 ?auto_19608 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19616 - SURFACE
      ?auto_19617 - SURFACE
      ?auto_19618 - SURFACE
    )
    :vars
    (
      ?auto_19622 - HOIST
      ?auto_19621 - PLACE
      ?auto_19619 - PLACE
      ?auto_19623 - HOIST
      ?auto_19624 - SURFACE
      ?auto_19620 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19622 ?auto_19621 ) ( IS-CRATE ?auto_19618 ) ( not ( = ?auto_19617 ?auto_19618 ) ) ( not ( = ?auto_19616 ?auto_19617 ) ) ( not ( = ?auto_19616 ?auto_19618 ) ) ( not ( = ?auto_19619 ?auto_19621 ) ) ( HOIST-AT ?auto_19623 ?auto_19619 ) ( not ( = ?auto_19622 ?auto_19623 ) ) ( AVAILABLE ?auto_19623 ) ( SURFACE-AT ?auto_19618 ?auto_19619 ) ( ON ?auto_19618 ?auto_19624 ) ( CLEAR ?auto_19618 ) ( not ( = ?auto_19617 ?auto_19624 ) ) ( not ( = ?auto_19618 ?auto_19624 ) ) ( not ( = ?auto_19616 ?auto_19624 ) ) ( SURFACE-AT ?auto_19616 ?auto_19621 ) ( CLEAR ?auto_19616 ) ( IS-CRATE ?auto_19617 ) ( AVAILABLE ?auto_19622 ) ( IN ?auto_19617 ?auto_19620 ) ( TRUCK-AT ?auto_19620 ?auto_19619 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19617 ?auto_19618 )
      ( MAKE-2CRATE-VERIFY ?auto_19616 ?auto_19617 ?auto_19618 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19625 - SURFACE
      ?auto_19626 - SURFACE
      ?auto_19627 - SURFACE
      ?auto_19628 - SURFACE
    )
    :vars
    (
      ?auto_19634 - HOIST
      ?auto_19631 - PLACE
      ?auto_19633 - PLACE
      ?auto_19632 - HOIST
      ?auto_19629 - SURFACE
      ?auto_19630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19634 ?auto_19631 ) ( IS-CRATE ?auto_19628 ) ( not ( = ?auto_19627 ?auto_19628 ) ) ( not ( = ?auto_19626 ?auto_19627 ) ) ( not ( = ?auto_19626 ?auto_19628 ) ) ( not ( = ?auto_19633 ?auto_19631 ) ) ( HOIST-AT ?auto_19632 ?auto_19633 ) ( not ( = ?auto_19634 ?auto_19632 ) ) ( AVAILABLE ?auto_19632 ) ( SURFACE-AT ?auto_19628 ?auto_19633 ) ( ON ?auto_19628 ?auto_19629 ) ( CLEAR ?auto_19628 ) ( not ( = ?auto_19627 ?auto_19629 ) ) ( not ( = ?auto_19628 ?auto_19629 ) ) ( not ( = ?auto_19626 ?auto_19629 ) ) ( SURFACE-AT ?auto_19626 ?auto_19631 ) ( CLEAR ?auto_19626 ) ( IS-CRATE ?auto_19627 ) ( AVAILABLE ?auto_19634 ) ( IN ?auto_19627 ?auto_19630 ) ( TRUCK-AT ?auto_19630 ?auto_19633 ) ( ON ?auto_19626 ?auto_19625 ) ( not ( = ?auto_19625 ?auto_19626 ) ) ( not ( = ?auto_19625 ?auto_19627 ) ) ( not ( = ?auto_19625 ?auto_19628 ) ) ( not ( = ?auto_19625 ?auto_19629 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19626 ?auto_19627 ?auto_19628 )
      ( MAKE-3CRATE-VERIFY ?auto_19625 ?auto_19626 ?auto_19627 ?auto_19628 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19635 - SURFACE
      ?auto_19636 - SURFACE
      ?auto_19637 - SURFACE
      ?auto_19638 - SURFACE
      ?auto_19639 - SURFACE
    )
    :vars
    (
      ?auto_19645 - HOIST
      ?auto_19642 - PLACE
      ?auto_19644 - PLACE
      ?auto_19643 - HOIST
      ?auto_19640 - SURFACE
      ?auto_19641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19645 ?auto_19642 ) ( IS-CRATE ?auto_19639 ) ( not ( = ?auto_19638 ?auto_19639 ) ) ( not ( = ?auto_19637 ?auto_19638 ) ) ( not ( = ?auto_19637 ?auto_19639 ) ) ( not ( = ?auto_19644 ?auto_19642 ) ) ( HOIST-AT ?auto_19643 ?auto_19644 ) ( not ( = ?auto_19645 ?auto_19643 ) ) ( AVAILABLE ?auto_19643 ) ( SURFACE-AT ?auto_19639 ?auto_19644 ) ( ON ?auto_19639 ?auto_19640 ) ( CLEAR ?auto_19639 ) ( not ( = ?auto_19638 ?auto_19640 ) ) ( not ( = ?auto_19639 ?auto_19640 ) ) ( not ( = ?auto_19637 ?auto_19640 ) ) ( SURFACE-AT ?auto_19637 ?auto_19642 ) ( CLEAR ?auto_19637 ) ( IS-CRATE ?auto_19638 ) ( AVAILABLE ?auto_19645 ) ( IN ?auto_19638 ?auto_19641 ) ( TRUCK-AT ?auto_19641 ?auto_19644 ) ( ON ?auto_19636 ?auto_19635 ) ( ON ?auto_19637 ?auto_19636 ) ( not ( = ?auto_19635 ?auto_19636 ) ) ( not ( = ?auto_19635 ?auto_19637 ) ) ( not ( = ?auto_19635 ?auto_19638 ) ) ( not ( = ?auto_19635 ?auto_19639 ) ) ( not ( = ?auto_19635 ?auto_19640 ) ) ( not ( = ?auto_19636 ?auto_19637 ) ) ( not ( = ?auto_19636 ?auto_19638 ) ) ( not ( = ?auto_19636 ?auto_19639 ) ) ( not ( = ?auto_19636 ?auto_19640 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19637 ?auto_19638 ?auto_19639 )
      ( MAKE-4CRATE-VERIFY ?auto_19635 ?auto_19636 ?auto_19637 ?auto_19638 ?auto_19639 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19646 - SURFACE
      ?auto_19647 - SURFACE
    )
    :vars
    (
      ?auto_19653 - HOIST
      ?auto_19650 - PLACE
      ?auto_19654 - SURFACE
      ?auto_19652 - PLACE
      ?auto_19651 - HOIST
      ?auto_19648 - SURFACE
      ?auto_19649 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19653 ?auto_19650 ) ( IS-CRATE ?auto_19647 ) ( not ( = ?auto_19646 ?auto_19647 ) ) ( not ( = ?auto_19654 ?auto_19646 ) ) ( not ( = ?auto_19654 ?auto_19647 ) ) ( not ( = ?auto_19652 ?auto_19650 ) ) ( HOIST-AT ?auto_19651 ?auto_19652 ) ( not ( = ?auto_19653 ?auto_19651 ) ) ( SURFACE-AT ?auto_19647 ?auto_19652 ) ( ON ?auto_19647 ?auto_19648 ) ( CLEAR ?auto_19647 ) ( not ( = ?auto_19646 ?auto_19648 ) ) ( not ( = ?auto_19647 ?auto_19648 ) ) ( not ( = ?auto_19654 ?auto_19648 ) ) ( SURFACE-AT ?auto_19654 ?auto_19650 ) ( CLEAR ?auto_19654 ) ( IS-CRATE ?auto_19646 ) ( AVAILABLE ?auto_19653 ) ( TRUCK-AT ?auto_19649 ?auto_19652 ) ( LIFTING ?auto_19651 ?auto_19646 ) )
    :subtasks
    ( ( !LOAD ?auto_19651 ?auto_19646 ?auto_19649 ?auto_19652 )
      ( MAKE-2CRATE ?auto_19654 ?auto_19646 ?auto_19647 )
      ( MAKE-1CRATE-VERIFY ?auto_19646 ?auto_19647 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19655 - SURFACE
      ?auto_19656 - SURFACE
      ?auto_19657 - SURFACE
    )
    :vars
    (
      ?auto_19659 - HOIST
      ?auto_19658 - PLACE
      ?auto_19662 - PLACE
      ?auto_19663 - HOIST
      ?auto_19661 - SURFACE
      ?auto_19660 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19659 ?auto_19658 ) ( IS-CRATE ?auto_19657 ) ( not ( = ?auto_19656 ?auto_19657 ) ) ( not ( = ?auto_19655 ?auto_19656 ) ) ( not ( = ?auto_19655 ?auto_19657 ) ) ( not ( = ?auto_19662 ?auto_19658 ) ) ( HOIST-AT ?auto_19663 ?auto_19662 ) ( not ( = ?auto_19659 ?auto_19663 ) ) ( SURFACE-AT ?auto_19657 ?auto_19662 ) ( ON ?auto_19657 ?auto_19661 ) ( CLEAR ?auto_19657 ) ( not ( = ?auto_19656 ?auto_19661 ) ) ( not ( = ?auto_19657 ?auto_19661 ) ) ( not ( = ?auto_19655 ?auto_19661 ) ) ( SURFACE-AT ?auto_19655 ?auto_19658 ) ( CLEAR ?auto_19655 ) ( IS-CRATE ?auto_19656 ) ( AVAILABLE ?auto_19659 ) ( TRUCK-AT ?auto_19660 ?auto_19662 ) ( LIFTING ?auto_19663 ?auto_19656 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19656 ?auto_19657 )
      ( MAKE-2CRATE-VERIFY ?auto_19655 ?auto_19656 ?auto_19657 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19664 - SURFACE
      ?auto_19665 - SURFACE
      ?auto_19666 - SURFACE
      ?auto_19667 - SURFACE
    )
    :vars
    (
      ?auto_19669 - HOIST
      ?auto_19673 - PLACE
      ?auto_19672 - PLACE
      ?auto_19668 - HOIST
      ?auto_19670 - SURFACE
      ?auto_19671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19669 ?auto_19673 ) ( IS-CRATE ?auto_19667 ) ( not ( = ?auto_19666 ?auto_19667 ) ) ( not ( = ?auto_19665 ?auto_19666 ) ) ( not ( = ?auto_19665 ?auto_19667 ) ) ( not ( = ?auto_19672 ?auto_19673 ) ) ( HOIST-AT ?auto_19668 ?auto_19672 ) ( not ( = ?auto_19669 ?auto_19668 ) ) ( SURFACE-AT ?auto_19667 ?auto_19672 ) ( ON ?auto_19667 ?auto_19670 ) ( CLEAR ?auto_19667 ) ( not ( = ?auto_19666 ?auto_19670 ) ) ( not ( = ?auto_19667 ?auto_19670 ) ) ( not ( = ?auto_19665 ?auto_19670 ) ) ( SURFACE-AT ?auto_19665 ?auto_19673 ) ( CLEAR ?auto_19665 ) ( IS-CRATE ?auto_19666 ) ( AVAILABLE ?auto_19669 ) ( TRUCK-AT ?auto_19671 ?auto_19672 ) ( LIFTING ?auto_19668 ?auto_19666 ) ( ON ?auto_19665 ?auto_19664 ) ( not ( = ?auto_19664 ?auto_19665 ) ) ( not ( = ?auto_19664 ?auto_19666 ) ) ( not ( = ?auto_19664 ?auto_19667 ) ) ( not ( = ?auto_19664 ?auto_19670 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19665 ?auto_19666 ?auto_19667 )
      ( MAKE-3CRATE-VERIFY ?auto_19664 ?auto_19665 ?auto_19666 ?auto_19667 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19674 - SURFACE
      ?auto_19675 - SURFACE
      ?auto_19676 - SURFACE
      ?auto_19677 - SURFACE
      ?auto_19678 - SURFACE
    )
    :vars
    (
      ?auto_19680 - HOIST
      ?auto_19684 - PLACE
      ?auto_19683 - PLACE
      ?auto_19679 - HOIST
      ?auto_19681 - SURFACE
      ?auto_19682 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19680 ?auto_19684 ) ( IS-CRATE ?auto_19678 ) ( not ( = ?auto_19677 ?auto_19678 ) ) ( not ( = ?auto_19676 ?auto_19677 ) ) ( not ( = ?auto_19676 ?auto_19678 ) ) ( not ( = ?auto_19683 ?auto_19684 ) ) ( HOIST-AT ?auto_19679 ?auto_19683 ) ( not ( = ?auto_19680 ?auto_19679 ) ) ( SURFACE-AT ?auto_19678 ?auto_19683 ) ( ON ?auto_19678 ?auto_19681 ) ( CLEAR ?auto_19678 ) ( not ( = ?auto_19677 ?auto_19681 ) ) ( not ( = ?auto_19678 ?auto_19681 ) ) ( not ( = ?auto_19676 ?auto_19681 ) ) ( SURFACE-AT ?auto_19676 ?auto_19684 ) ( CLEAR ?auto_19676 ) ( IS-CRATE ?auto_19677 ) ( AVAILABLE ?auto_19680 ) ( TRUCK-AT ?auto_19682 ?auto_19683 ) ( LIFTING ?auto_19679 ?auto_19677 ) ( ON ?auto_19675 ?auto_19674 ) ( ON ?auto_19676 ?auto_19675 ) ( not ( = ?auto_19674 ?auto_19675 ) ) ( not ( = ?auto_19674 ?auto_19676 ) ) ( not ( = ?auto_19674 ?auto_19677 ) ) ( not ( = ?auto_19674 ?auto_19678 ) ) ( not ( = ?auto_19674 ?auto_19681 ) ) ( not ( = ?auto_19675 ?auto_19676 ) ) ( not ( = ?auto_19675 ?auto_19677 ) ) ( not ( = ?auto_19675 ?auto_19678 ) ) ( not ( = ?auto_19675 ?auto_19681 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19676 ?auto_19677 ?auto_19678 )
      ( MAKE-4CRATE-VERIFY ?auto_19674 ?auto_19675 ?auto_19676 ?auto_19677 ?auto_19678 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19685 - SURFACE
      ?auto_19686 - SURFACE
    )
    :vars
    (
      ?auto_19688 - HOIST
      ?auto_19693 - PLACE
      ?auto_19692 - SURFACE
      ?auto_19691 - PLACE
      ?auto_19687 - HOIST
      ?auto_19689 - SURFACE
      ?auto_19690 - TRUCK
      ?auto_19694 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19688 ?auto_19693 ) ( IS-CRATE ?auto_19686 ) ( not ( = ?auto_19685 ?auto_19686 ) ) ( not ( = ?auto_19692 ?auto_19685 ) ) ( not ( = ?auto_19692 ?auto_19686 ) ) ( not ( = ?auto_19691 ?auto_19693 ) ) ( HOIST-AT ?auto_19687 ?auto_19691 ) ( not ( = ?auto_19688 ?auto_19687 ) ) ( SURFACE-AT ?auto_19686 ?auto_19691 ) ( ON ?auto_19686 ?auto_19689 ) ( CLEAR ?auto_19686 ) ( not ( = ?auto_19685 ?auto_19689 ) ) ( not ( = ?auto_19686 ?auto_19689 ) ) ( not ( = ?auto_19692 ?auto_19689 ) ) ( SURFACE-AT ?auto_19692 ?auto_19693 ) ( CLEAR ?auto_19692 ) ( IS-CRATE ?auto_19685 ) ( AVAILABLE ?auto_19688 ) ( TRUCK-AT ?auto_19690 ?auto_19691 ) ( AVAILABLE ?auto_19687 ) ( SURFACE-AT ?auto_19685 ?auto_19691 ) ( ON ?auto_19685 ?auto_19694 ) ( CLEAR ?auto_19685 ) ( not ( = ?auto_19685 ?auto_19694 ) ) ( not ( = ?auto_19686 ?auto_19694 ) ) ( not ( = ?auto_19692 ?auto_19694 ) ) ( not ( = ?auto_19689 ?auto_19694 ) ) )
    :subtasks
    ( ( !LIFT ?auto_19687 ?auto_19685 ?auto_19694 ?auto_19691 )
      ( MAKE-2CRATE ?auto_19692 ?auto_19685 ?auto_19686 )
      ( MAKE-1CRATE-VERIFY ?auto_19685 ?auto_19686 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19695 - SURFACE
      ?auto_19696 - SURFACE
      ?auto_19697 - SURFACE
    )
    :vars
    (
      ?auto_19703 - HOIST
      ?auto_19701 - PLACE
      ?auto_19702 - PLACE
      ?auto_19700 - HOIST
      ?auto_19699 - SURFACE
      ?auto_19704 - TRUCK
      ?auto_19698 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19703 ?auto_19701 ) ( IS-CRATE ?auto_19697 ) ( not ( = ?auto_19696 ?auto_19697 ) ) ( not ( = ?auto_19695 ?auto_19696 ) ) ( not ( = ?auto_19695 ?auto_19697 ) ) ( not ( = ?auto_19702 ?auto_19701 ) ) ( HOIST-AT ?auto_19700 ?auto_19702 ) ( not ( = ?auto_19703 ?auto_19700 ) ) ( SURFACE-AT ?auto_19697 ?auto_19702 ) ( ON ?auto_19697 ?auto_19699 ) ( CLEAR ?auto_19697 ) ( not ( = ?auto_19696 ?auto_19699 ) ) ( not ( = ?auto_19697 ?auto_19699 ) ) ( not ( = ?auto_19695 ?auto_19699 ) ) ( SURFACE-AT ?auto_19695 ?auto_19701 ) ( CLEAR ?auto_19695 ) ( IS-CRATE ?auto_19696 ) ( AVAILABLE ?auto_19703 ) ( TRUCK-AT ?auto_19704 ?auto_19702 ) ( AVAILABLE ?auto_19700 ) ( SURFACE-AT ?auto_19696 ?auto_19702 ) ( ON ?auto_19696 ?auto_19698 ) ( CLEAR ?auto_19696 ) ( not ( = ?auto_19696 ?auto_19698 ) ) ( not ( = ?auto_19697 ?auto_19698 ) ) ( not ( = ?auto_19695 ?auto_19698 ) ) ( not ( = ?auto_19699 ?auto_19698 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19696 ?auto_19697 )
      ( MAKE-2CRATE-VERIFY ?auto_19695 ?auto_19696 ?auto_19697 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19705 - SURFACE
      ?auto_19706 - SURFACE
      ?auto_19707 - SURFACE
      ?auto_19708 - SURFACE
    )
    :vars
    (
      ?auto_19715 - HOIST
      ?auto_19713 - PLACE
      ?auto_19712 - PLACE
      ?auto_19710 - HOIST
      ?auto_19711 - SURFACE
      ?auto_19714 - TRUCK
      ?auto_19709 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19715 ?auto_19713 ) ( IS-CRATE ?auto_19708 ) ( not ( = ?auto_19707 ?auto_19708 ) ) ( not ( = ?auto_19706 ?auto_19707 ) ) ( not ( = ?auto_19706 ?auto_19708 ) ) ( not ( = ?auto_19712 ?auto_19713 ) ) ( HOIST-AT ?auto_19710 ?auto_19712 ) ( not ( = ?auto_19715 ?auto_19710 ) ) ( SURFACE-AT ?auto_19708 ?auto_19712 ) ( ON ?auto_19708 ?auto_19711 ) ( CLEAR ?auto_19708 ) ( not ( = ?auto_19707 ?auto_19711 ) ) ( not ( = ?auto_19708 ?auto_19711 ) ) ( not ( = ?auto_19706 ?auto_19711 ) ) ( SURFACE-AT ?auto_19706 ?auto_19713 ) ( CLEAR ?auto_19706 ) ( IS-CRATE ?auto_19707 ) ( AVAILABLE ?auto_19715 ) ( TRUCK-AT ?auto_19714 ?auto_19712 ) ( AVAILABLE ?auto_19710 ) ( SURFACE-AT ?auto_19707 ?auto_19712 ) ( ON ?auto_19707 ?auto_19709 ) ( CLEAR ?auto_19707 ) ( not ( = ?auto_19707 ?auto_19709 ) ) ( not ( = ?auto_19708 ?auto_19709 ) ) ( not ( = ?auto_19706 ?auto_19709 ) ) ( not ( = ?auto_19711 ?auto_19709 ) ) ( ON ?auto_19706 ?auto_19705 ) ( not ( = ?auto_19705 ?auto_19706 ) ) ( not ( = ?auto_19705 ?auto_19707 ) ) ( not ( = ?auto_19705 ?auto_19708 ) ) ( not ( = ?auto_19705 ?auto_19711 ) ) ( not ( = ?auto_19705 ?auto_19709 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19706 ?auto_19707 ?auto_19708 )
      ( MAKE-3CRATE-VERIFY ?auto_19705 ?auto_19706 ?auto_19707 ?auto_19708 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19716 - SURFACE
      ?auto_19717 - SURFACE
      ?auto_19718 - SURFACE
      ?auto_19719 - SURFACE
      ?auto_19720 - SURFACE
    )
    :vars
    (
      ?auto_19727 - HOIST
      ?auto_19725 - PLACE
      ?auto_19724 - PLACE
      ?auto_19722 - HOIST
      ?auto_19723 - SURFACE
      ?auto_19726 - TRUCK
      ?auto_19721 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19727 ?auto_19725 ) ( IS-CRATE ?auto_19720 ) ( not ( = ?auto_19719 ?auto_19720 ) ) ( not ( = ?auto_19718 ?auto_19719 ) ) ( not ( = ?auto_19718 ?auto_19720 ) ) ( not ( = ?auto_19724 ?auto_19725 ) ) ( HOIST-AT ?auto_19722 ?auto_19724 ) ( not ( = ?auto_19727 ?auto_19722 ) ) ( SURFACE-AT ?auto_19720 ?auto_19724 ) ( ON ?auto_19720 ?auto_19723 ) ( CLEAR ?auto_19720 ) ( not ( = ?auto_19719 ?auto_19723 ) ) ( not ( = ?auto_19720 ?auto_19723 ) ) ( not ( = ?auto_19718 ?auto_19723 ) ) ( SURFACE-AT ?auto_19718 ?auto_19725 ) ( CLEAR ?auto_19718 ) ( IS-CRATE ?auto_19719 ) ( AVAILABLE ?auto_19727 ) ( TRUCK-AT ?auto_19726 ?auto_19724 ) ( AVAILABLE ?auto_19722 ) ( SURFACE-AT ?auto_19719 ?auto_19724 ) ( ON ?auto_19719 ?auto_19721 ) ( CLEAR ?auto_19719 ) ( not ( = ?auto_19719 ?auto_19721 ) ) ( not ( = ?auto_19720 ?auto_19721 ) ) ( not ( = ?auto_19718 ?auto_19721 ) ) ( not ( = ?auto_19723 ?auto_19721 ) ) ( ON ?auto_19717 ?auto_19716 ) ( ON ?auto_19718 ?auto_19717 ) ( not ( = ?auto_19716 ?auto_19717 ) ) ( not ( = ?auto_19716 ?auto_19718 ) ) ( not ( = ?auto_19716 ?auto_19719 ) ) ( not ( = ?auto_19716 ?auto_19720 ) ) ( not ( = ?auto_19716 ?auto_19723 ) ) ( not ( = ?auto_19716 ?auto_19721 ) ) ( not ( = ?auto_19717 ?auto_19718 ) ) ( not ( = ?auto_19717 ?auto_19719 ) ) ( not ( = ?auto_19717 ?auto_19720 ) ) ( not ( = ?auto_19717 ?auto_19723 ) ) ( not ( = ?auto_19717 ?auto_19721 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19718 ?auto_19719 ?auto_19720 )
      ( MAKE-4CRATE-VERIFY ?auto_19716 ?auto_19717 ?auto_19718 ?auto_19719 ?auto_19720 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19728 - SURFACE
      ?auto_19729 - SURFACE
    )
    :vars
    (
      ?auto_19736 - HOIST
      ?auto_19734 - PLACE
      ?auto_19737 - SURFACE
      ?auto_19733 - PLACE
      ?auto_19731 - HOIST
      ?auto_19732 - SURFACE
      ?auto_19730 - SURFACE
      ?auto_19735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19736 ?auto_19734 ) ( IS-CRATE ?auto_19729 ) ( not ( = ?auto_19728 ?auto_19729 ) ) ( not ( = ?auto_19737 ?auto_19728 ) ) ( not ( = ?auto_19737 ?auto_19729 ) ) ( not ( = ?auto_19733 ?auto_19734 ) ) ( HOIST-AT ?auto_19731 ?auto_19733 ) ( not ( = ?auto_19736 ?auto_19731 ) ) ( SURFACE-AT ?auto_19729 ?auto_19733 ) ( ON ?auto_19729 ?auto_19732 ) ( CLEAR ?auto_19729 ) ( not ( = ?auto_19728 ?auto_19732 ) ) ( not ( = ?auto_19729 ?auto_19732 ) ) ( not ( = ?auto_19737 ?auto_19732 ) ) ( SURFACE-AT ?auto_19737 ?auto_19734 ) ( CLEAR ?auto_19737 ) ( IS-CRATE ?auto_19728 ) ( AVAILABLE ?auto_19736 ) ( AVAILABLE ?auto_19731 ) ( SURFACE-AT ?auto_19728 ?auto_19733 ) ( ON ?auto_19728 ?auto_19730 ) ( CLEAR ?auto_19728 ) ( not ( = ?auto_19728 ?auto_19730 ) ) ( not ( = ?auto_19729 ?auto_19730 ) ) ( not ( = ?auto_19737 ?auto_19730 ) ) ( not ( = ?auto_19732 ?auto_19730 ) ) ( TRUCK-AT ?auto_19735 ?auto_19734 ) )
    :subtasks
    ( ( !DRIVE ?auto_19735 ?auto_19734 ?auto_19733 )
      ( MAKE-2CRATE ?auto_19737 ?auto_19728 ?auto_19729 )
      ( MAKE-1CRATE-VERIFY ?auto_19728 ?auto_19729 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19738 - SURFACE
      ?auto_19739 - SURFACE
      ?auto_19740 - SURFACE
    )
    :vars
    (
      ?auto_19742 - HOIST
      ?auto_19746 - PLACE
      ?auto_19747 - PLACE
      ?auto_19743 - HOIST
      ?auto_19741 - SURFACE
      ?auto_19745 - SURFACE
      ?auto_19744 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19742 ?auto_19746 ) ( IS-CRATE ?auto_19740 ) ( not ( = ?auto_19739 ?auto_19740 ) ) ( not ( = ?auto_19738 ?auto_19739 ) ) ( not ( = ?auto_19738 ?auto_19740 ) ) ( not ( = ?auto_19747 ?auto_19746 ) ) ( HOIST-AT ?auto_19743 ?auto_19747 ) ( not ( = ?auto_19742 ?auto_19743 ) ) ( SURFACE-AT ?auto_19740 ?auto_19747 ) ( ON ?auto_19740 ?auto_19741 ) ( CLEAR ?auto_19740 ) ( not ( = ?auto_19739 ?auto_19741 ) ) ( not ( = ?auto_19740 ?auto_19741 ) ) ( not ( = ?auto_19738 ?auto_19741 ) ) ( SURFACE-AT ?auto_19738 ?auto_19746 ) ( CLEAR ?auto_19738 ) ( IS-CRATE ?auto_19739 ) ( AVAILABLE ?auto_19742 ) ( AVAILABLE ?auto_19743 ) ( SURFACE-AT ?auto_19739 ?auto_19747 ) ( ON ?auto_19739 ?auto_19745 ) ( CLEAR ?auto_19739 ) ( not ( = ?auto_19739 ?auto_19745 ) ) ( not ( = ?auto_19740 ?auto_19745 ) ) ( not ( = ?auto_19738 ?auto_19745 ) ) ( not ( = ?auto_19741 ?auto_19745 ) ) ( TRUCK-AT ?auto_19744 ?auto_19746 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19739 ?auto_19740 )
      ( MAKE-2CRATE-VERIFY ?auto_19738 ?auto_19739 ?auto_19740 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19748 - SURFACE
      ?auto_19749 - SURFACE
      ?auto_19750 - SURFACE
      ?auto_19751 - SURFACE
    )
    :vars
    (
      ?auto_19758 - HOIST
      ?auto_19755 - PLACE
      ?auto_19752 - PLACE
      ?auto_19753 - HOIST
      ?auto_19756 - SURFACE
      ?auto_19757 - SURFACE
      ?auto_19754 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19758 ?auto_19755 ) ( IS-CRATE ?auto_19751 ) ( not ( = ?auto_19750 ?auto_19751 ) ) ( not ( = ?auto_19749 ?auto_19750 ) ) ( not ( = ?auto_19749 ?auto_19751 ) ) ( not ( = ?auto_19752 ?auto_19755 ) ) ( HOIST-AT ?auto_19753 ?auto_19752 ) ( not ( = ?auto_19758 ?auto_19753 ) ) ( SURFACE-AT ?auto_19751 ?auto_19752 ) ( ON ?auto_19751 ?auto_19756 ) ( CLEAR ?auto_19751 ) ( not ( = ?auto_19750 ?auto_19756 ) ) ( not ( = ?auto_19751 ?auto_19756 ) ) ( not ( = ?auto_19749 ?auto_19756 ) ) ( SURFACE-AT ?auto_19749 ?auto_19755 ) ( CLEAR ?auto_19749 ) ( IS-CRATE ?auto_19750 ) ( AVAILABLE ?auto_19758 ) ( AVAILABLE ?auto_19753 ) ( SURFACE-AT ?auto_19750 ?auto_19752 ) ( ON ?auto_19750 ?auto_19757 ) ( CLEAR ?auto_19750 ) ( not ( = ?auto_19750 ?auto_19757 ) ) ( not ( = ?auto_19751 ?auto_19757 ) ) ( not ( = ?auto_19749 ?auto_19757 ) ) ( not ( = ?auto_19756 ?auto_19757 ) ) ( TRUCK-AT ?auto_19754 ?auto_19755 ) ( ON ?auto_19749 ?auto_19748 ) ( not ( = ?auto_19748 ?auto_19749 ) ) ( not ( = ?auto_19748 ?auto_19750 ) ) ( not ( = ?auto_19748 ?auto_19751 ) ) ( not ( = ?auto_19748 ?auto_19756 ) ) ( not ( = ?auto_19748 ?auto_19757 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19749 ?auto_19750 ?auto_19751 )
      ( MAKE-3CRATE-VERIFY ?auto_19748 ?auto_19749 ?auto_19750 ?auto_19751 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19759 - SURFACE
      ?auto_19760 - SURFACE
      ?auto_19761 - SURFACE
      ?auto_19762 - SURFACE
      ?auto_19763 - SURFACE
    )
    :vars
    (
      ?auto_19770 - HOIST
      ?auto_19767 - PLACE
      ?auto_19764 - PLACE
      ?auto_19765 - HOIST
      ?auto_19768 - SURFACE
      ?auto_19769 - SURFACE
      ?auto_19766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19770 ?auto_19767 ) ( IS-CRATE ?auto_19763 ) ( not ( = ?auto_19762 ?auto_19763 ) ) ( not ( = ?auto_19761 ?auto_19762 ) ) ( not ( = ?auto_19761 ?auto_19763 ) ) ( not ( = ?auto_19764 ?auto_19767 ) ) ( HOIST-AT ?auto_19765 ?auto_19764 ) ( not ( = ?auto_19770 ?auto_19765 ) ) ( SURFACE-AT ?auto_19763 ?auto_19764 ) ( ON ?auto_19763 ?auto_19768 ) ( CLEAR ?auto_19763 ) ( not ( = ?auto_19762 ?auto_19768 ) ) ( not ( = ?auto_19763 ?auto_19768 ) ) ( not ( = ?auto_19761 ?auto_19768 ) ) ( SURFACE-AT ?auto_19761 ?auto_19767 ) ( CLEAR ?auto_19761 ) ( IS-CRATE ?auto_19762 ) ( AVAILABLE ?auto_19770 ) ( AVAILABLE ?auto_19765 ) ( SURFACE-AT ?auto_19762 ?auto_19764 ) ( ON ?auto_19762 ?auto_19769 ) ( CLEAR ?auto_19762 ) ( not ( = ?auto_19762 ?auto_19769 ) ) ( not ( = ?auto_19763 ?auto_19769 ) ) ( not ( = ?auto_19761 ?auto_19769 ) ) ( not ( = ?auto_19768 ?auto_19769 ) ) ( TRUCK-AT ?auto_19766 ?auto_19767 ) ( ON ?auto_19760 ?auto_19759 ) ( ON ?auto_19761 ?auto_19760 ) ( not ( = ?auto_19759 ?auto_19760 ) ) ( not ( = ?auto_19759 ?auto_19761 ) ) ( not ( = ?auto_19759 ?auto_19762 ) ) ( not ( = ?auto_19759 ?auto_19763 ) ) ( not ( = ?auto_19759 ?auto_19768 ) ) ( not ( = ?auto_19759 ?auto_19769 ) ) ( not ( = ?auto_19760 ?auto_19761 ) ) ( not ( = ?auto_19760 ?auto_19762 ) ) ( not ( = ?auto_19760 ?auto_19763 ) ) ( not ( = ?auto_19760 ?auto_19768 ) ) ( not ( = ?auto_19760 ?auto_19769 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19761 ?auto_19762 ?auto_19763 )
      ( MAKE-4CRATE-VERIFY ?auto_19759 ?auto_19760 ?auto_19761 ?auto_19762 ?auto_19763 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19771 - SURFACE
      ?auto_19772 - SURFACE
    )
    :vars
    (
      ?auto_19779 - HOIST
      ?auto_19776 - PLACE
      ?auto_19780 - SURFACE
      ?auto_19773 - PLACE
      ?auto_19774 - HOIST
      ?auto_19777 - SURFACE
      ?auto_19778 - SURFACE
      ?auto_19775 - TRUCK
      ?auto_19781 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19779 ?auto_19776 ) ( IS-CRATE ?auto_19772 ) ( not ( = ?auto_19771 ?auto_19772 ) ) ( not ( = ?auto_19780 ?auto_19771 ) ) ( not ( = ?auto_19780 ?auto_19772 ) ) ( not ( = ?auto_19773 ?auto_19776 ) ) ( HOIST-AT ?auto_19774 ?auto_19773 ) ( not ( = ?auto_19779 ?auto_19774 ) ) ( SURFACE-AT ?auto_19772 ?auto_19773 ) ( ON ?auto_19772 ?auto_19777 ) ( CLEAR ?auto_19772 ) ( not ( = ?auto_19771 ?auto_19777 ) ) ( not ( = ?auto_19772 ?auto_19777 ) ) ( not ( = ?auto_19780 ?auto_19777 ) ) ( IS-CRATE ?auto_19771 ) ( AVAILABLE ?auto_19774 ) ( SURFACE-AT ?auto_19771 ?auto_19773 ) ( ON ?auto_19771 ?auto_19778 ) ( CLEAR ?auto_19771 ) ( not ( = ?auto_19771 ?auto_19778 ) ) ( not ( = ?auto_19772 ?auto_19778 ) ) ( not ( = ?auto_19780 ?auto_19778 ) ) ( not ( = ?auto_19777 ?auto_19778 ) ) ( TRUCK-AT ?auto_19775 ?auto_19776 ) ( SURFACE-AT ?auto_19781 ?auto_19776 ) ( CLEAR ?auto_19781 ) ( LIFTING ?auto_19779 ?auto_19780 ) ( IS-CRATE ?auto_19780 ) ( not ( = ?auto_19781 ?auto_19780 ) ) ( not ( = ?auto_19771 ?auto_19781 ) ) ( not ( = ?auto_19772 ?auto_19781 ) ) ( not ( = ?auto_19777 ?auto_19781 ) ) ( not ( = ?auto_19778 ?auto_19781 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19781 ?auto_19780 )
      ( MAKE-2CRATE ?auto_19780 ?auto_19771 ?auto_19772 )
      ( MAKE-1CRATE-VERIFY ?auto_19771 ?auto_19772 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19782 - SURFACE
      ?auto_19783 - SURFACE
      ?auto_19784 - SURFACE
    )
    :vars
    (
      ?auto_19785 - HOIST
      ?auto_19788 - PLACE
      ?auto_19786 - PLACE
      ?auto_19790 - HOIST
      ?auto_19787 - SURFACE
      ?auto_19791 - SURFACE
      ?auto_19792 - TRUCK
      ?auto_19789 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19785 ?auto_19788 ) ( IS-CRATE ?auto_19784 ) ( not ( = ?auto_19783 ?auto_19784 ) ) ( not ( = ?auto_19782 ?auto_19783 ) ) ( not ( = ?auto_19782 ?auto_19784 ) ) ( not ( = ?auto_19786 ?auto_19788 ) ) ( HOIST-AT ?auto_19790 ?auto_19786 ) ( not ( = ?auto_19785 ?auto_19790 ) ) ( SURFACE-AT ?auto_19784 ?auto_19786 ) ( ON ?auto_19784 ?auto_19787 ) ( CLEAR ?auto_19784 ) ( not ( = ?auto_19783 ?auto_19787 ) ) ( not ( = ?auto_19784 ?auto_19787 ) ) ( not ( = ?auto_19782 ?auto_19787 ) ) ( IS-CRATE ?auto_19783 ) ( AVAILABLE ?auto_19790 ) ( SURFACE-AT ?auto_19783 ?auto_19786 ) ( ON ?auto_19783 ?auto_19791 ) ( CLEAR ?auto_19783 ) ( not ( = ?auto_19783 ?auto_19791 ) ) ( not ( = ?auto_19784 ?auto_19791 ) ) ( not ( = ?auto_19782 ?auto_19791 ) ) ( not ( = ?auto_19787 ?auto_19791 ) ) ( TRUCK-AT ?auto_19792 ?auto_19788 ) ( SURFACE-AT ?auto_19789 ?auto_19788 ) ( CLEAR ?auto_19789 ) ( LIFTING ?auto_19785 ?auto_19782 ) ( IS-CRATE ?auto_19782 ) ( not ( = ?auto_19789 ?auto_19782 ) ) ( not ( = ?auto_19783 ?auto_19789 ) ) ( not ( = ?auto_19784 ?auto_19789 ) ) ( not ( = ?auto_19787 ?auto_19789 ) ) ( not ( = ?auto_19791 ?auto_19789 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19783 ?auto_19784 )
      ( MAKE-2CRATE-VERIFY ?auto_19782 ?auto_19783 ?auto_19784 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19793 - SURFACE
      ?auto_19794 - SURFACE
      ?auto_19795 - SURFACE
      ?auto_19796 - SURFACE
    )
    :vars
    (
      ?auto_19800 - HOIST
      ?auto_19801 - PLACE
      ?auto_19797 - PLACE
      ?auto_19799 - HOIST
      ?auto_19798 - SURFACE
      ?auto_19803 - SURFACE
      ?auto_19802 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19800 ?auto_19801 ) ( IS-CRATE ?auto_19796 ) ( not ( = ?auto_19795 ?auto_19796 ) ) ( not ( = ?auto_19794 ?auto_19795 ) ) ( not ( = ?auto_19794 ?auto_19796 ) ) ( not ( = ?auto_19797 ?auto_19801 ) ) ( HOIST-AT ?auto_19799 ?auto_19797 ) ( not ( = ?auto_19800 ?auto_19799 ) ) ( SURFACE-AT ?auto_19796 ?auto_19797 ) ( ON ?auto_19796 ?auto_19798 ) ( CLEAR ?auto_19796 ) ( not ( = ?auto_19795 ?auto_19798 ) ) ( not ( = ?auto_19796 ?auto_19798 ) ) ( not ( = ?auto_19794 ?auto_19798 ) ) ( IS-CRATE ?auto_19795 ) ( AVAILABLE ?auto_19799 ) ( SURFACE-AT ?auto_19795 ?auto_19797 ) ( ON ?auto_19795 ?auto_19803 ) ( CLEAR ?auto_19795 ) ( not ( = ?auto_19795 ?auto_19803 ) ) ( not ( = ?auto_19796 ?auto_19803 ) ) ( not ( = ?auto_19794 ?auto_19803 ) ) ( not ( = ?auto_19798 ?auto_19803 ) ) ( TRUCK-AT ?auto_19802 ?auto_19801 ) ( SURFACE-AT ?auto_19793 ?auto_19801 ) ( CLEAR ?auto_19793 ) ( LIFTING ?auto_19800 ?auto_19794 ) ( IS-CRATE ?auto_19794 ) ( not ( = ?auto_19793 ?auto_19794 ) ) ( not ( = ?auto_19795 ?auto_19793 ) ) ( not ( = ?auto_19796 ?auto_19793 ) ) ( not ( = ?auto_19798 ?auto_19793 ) ) ( not ( = ?auto_19803 ?auto_19793 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19794 ?auto_19795 ?auto_19796 )
      ( MAKE-3CRATE-VERIFY ?auto_19793 ?auto_19794 ?auto_19795 ?auto_19796 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19804 - SURFACE
      ?auto_19805 - SURFACE
      ?auto_19806 - SURFACE
      ?auto_19807 - SURFACE
      ?auto_19808 - SURFACE
    )
    :vars
    (
      ?auto_19812 - HOIST
      ?auto_19813 - PLACE
      ?auto_19809 - PLACE
      ?auto_19811 - HOIST
      ?auto_19810 - SURFACE
      ?auto_19815 - SURFACE
      ?auto_19814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19812 ?auto_19813 ) ( IS-CRATE ?auto_19808 ) ( not ( = ?auto_19807 ?auto_19808 ) ) ( not ( = ?auto_19806 ?auto_19807 ) ) ( not ( = ?auto_19806 ?auto_19808 ) ) ( not ( = ?auto_19809 ?auto_19813 ) ) ( HOIST-AT ?auto_19811 ?auto_19809 ) ( not ( = ?auto_19812 ?auto_19811 ) ) ( SURFACE-AT ?auto_19808 ?auto_19809 ) ( ON ?auto_19808 ?auto_19810 ) ( CLEAR ?auto_19808 ) ( not ( = ?auto_19807 ?auto_19810 ) ) ( not ( = ?auto_19808 ?auto_19810 ) ) ( not ( = ?auto_19806 ?auto_19810 ) ) ( IS-CRATE ?auto_19807 ) ( AVAILABLE ?auto_19811 ) ( SURFACE-AT ?auto_19807 ?auto_19809 ) ( ON ?auto_19807 ?auto_19815 ) ( CLEAR ?auto_19807 ) ( not ( = ?auto_19807 ?auto_19815 ) ) ( not ( = ?auto_19808 ?auto_19815 ) ) ( not ( = ?auto_19806 ?auto_19815 ) ) ( not ( = ?auto_19810 ?auto_19815 ) ) ( TRUCK-AT ?auto_19814 ?auto_19813 ) ( SURFACE-AT ?auto_19805 ?auto_19813 ) ( CLEAR ?auto_19805 ) ( LIFTING ?auto_19812 ?auto_19806 ) ( IS-CRATE ?auto_19806 ) ( not ( = ?auto_19805 ?auto_19806 ) ) ( not ( = ?auto_19807 ?auto_19805 ) ) ( not ( = ?auto_19808 ?auto_19805 ) ) ( not ( = ?auto_19810 ?auto_19805 ) ) ( not ( = ?auto_19815 ?auto_19805 ) ) ( ON ?auto_19805 ?auto_19804 ) ( not ( = ?auto_19804 ?auto_19805 ) ) ( not ( = ?auto_19804 ?auto_19806 ) ) ( not ( = ?auto_19804 ?auto_19807 ) ) ( not ( = ?auto_19804 ?auto_19808 ) ) ( not ( = ?auto_19804 ?auto_19810 ) ) ( not ( = ?auto_19804 ?auto_19815 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19806 ?auto_19807 ?auto_19808 )
      ( MAKE-4CRATE-VERIFY ?auto_19804 ?auto_19805 ?auto_19806 ?auto_19807 ?auto_19808 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20251 - SURFACE
      ?auto_20252 - SURFACE
      ?auto_20253 - SURFACE
      ?auto_20254 - SURFACE
      ?auto_20255 - SURFACE
      ?auto_20256 - SURFACE
    )
    :vars
    (
      ?auto_20258 - HOIST
      ?auto_20257 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20258 ?auto_20257 ) ( SURFACE-AT ?auto_20255 ?auto_20257 ) ( CLEAR ?auto_20255 ) ( LIFTING ?auto_20258 ?auto_20256 ) ( IS-CRATE ?auto_20256 ) ( not ( = ?auto_20255 ?auto_20256 ) ) ( ON ?auto_20252 ?auto_20251 ) ( ON ?auto_20253 ?auto_20252 ) ( ON ?auto_20254 ?auto_20253 ) ( ON ?auto_20255 ?auto_20254 ) ( not ( = ?auto_20251 ?auto_20252 ) ) ( not ( = ?auto_20251 ?auto_20253 ) ) ( not ( = ?auto_20251 ?auto_20254 ) ) ( not ( = ?auto_20251 ?auto_20255 ) ) ( not ( = ?auto_20251 ?auto_20256 ) ) ( not ( = ?auto_20252 ?auto_20253 ) ) ( not ( = ?auto_20252 ?auto_20254 ) ) ( not ( = ?auto_20252 ?auto_20255 ) ) ( not ( = ?auto_20252 ?auto_20256 ) ) ( not ( = ?auto_20253 ?auto_20254 ) ) ( not ( = ?auto_20253 ?auto_20255 ) ) ( not ( = ?auto_20253 ?auto_20256 ) ) ( not ( = ?auto_20254 ?auto_20255 ) ) ( not ( = ?auto_20254 ?auto_20256 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20255 ?auto_20256 )
      ( MAKE-5CRATE-VERIFY ?auto_20251 ?auto_20252 ?auto_20253 ?auto_20254 ?auto_20255 ?auto_20256 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20285 - SURFACE
      ?auto_20286 - SURFACE
      ?auto_20287 - SURFACE
      ?auto_20288 - SURFACE
      ?auto_20289 - SURFACE
      ?auto_20290 - SURFACE
    )
    :vars
    (
      ?auto_20292 - HOIST
      ?auto_20293 - PLACE
      ?auto_20291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20292 ?auto_20293 ) ( SURFACE-AT ?auto_20289 ?auto_20293 ) ( CLEAR ?auto_20289 ) ( IS-CRATE ?auto_20290 ) ( not ( = ?auto_20289 ?auto_20290 ) ) ( TRUCK-AT ?auto_20291 ?auto_20293 ) ( AVAILABLE ?auto_20292 ) ( IN ?auto_20290 ?auto_20291 ) ( ON ?auto_20289 ?auto_20288 ) ( not ( = ?auto_20288 ?auto_20289 ) ) ( not ( = ?auto_20288 ?auto_20290 ) ) ( ON ?auto_20286 ?auto_20285 ) ( ON ?auto_20287 ?auto_20286 ) ( ON ?auto_20288 ?auto_20287 ) ( not ( = ?auto_20285 ?auto_20286 ) ) ( not ( = ?auto_20285 ?auto_20287 ) ) ( not ( = ?auto_20285 ?auto_20288 ) ) ( not ( = ?auto_20285 ?auto_20289 ) ) ( not ( = ?auto_20285 ?auto_20290 ) ) ( not ( = ?auto_20286 ?auto_20287 ) ) ( not ( = ?auto_20286 ?auto_20288 ) ) ( not ( = ?auto_20286 ?auto_20289 ) ) ( not ( = ?auto_20286 ?auto_20290 ) ) ( not ( = ?auto_20287 ?auto_20288 ) ) ( not ( = ?auto_20287 ?auto_20289 ) ) ( not ( = ?auto_20287 ?auto_20290 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20288 ?auto_20289 ?auto_20290 )
      ( MAKE-5CRATE-VERIFY ?auto_20285 ?auto_20286 ?auto_20287 ?auto_20288 ?auto_20289 ?auto_20290 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20325 - SURFACE
      ?auto_20326 - SURFACE
      ?auto_20327 - SURFACE
      ?auto_20328 - SURFACE
      ?auto_20329 - SURFACE
      ?auto_20330 - SURFACE
    )
    :vars
    (
      ?auto_20333 - HOIST
      ?auto_20332 - PLACE
      ?auto_20331 - TRUCK
      ?auto_20334 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20333 ?auto_20332 ) ( SURFACE-AT ?auto_20329 ?auto_20332 ) ( CLEAR ?auto_20329 ) ( IS-CRATE ?auto_20330 ) ( not ( = ?auto_20329 ?auto_20330 ) ) ( AVAILABLE ?auto_20333 ) ( IN ?auto_20330 ?auto_20331 ) ( ON ?auto_20329 ?auto_20328 ) ( not ( = ?auto_20328 ?auto_20329 ) ) ( not ( = ?auto_20328 ?auto_20330 ) ) ( TRUCK-AT ?auto_20331 ?auto_20334 ) ( not ( = ?auto_20334 ?auto_20332 ) ) ( ON ?auto_20326 ?auto_20325 ) ( ON ?auto_20327 ?auto_20326 ) ( ON ?auto_20328 ?auto_20327 ) ( not ( = ?auto_20325 ?auto_20326 ) ) ( not ( = ?auto_20325 ?auto_20327 ) ) ( not ( = ?auto_20325 ?auto_20328 ) ) ( not ( = ?auto_20325 ?auto_20329 ) ) ( not ( = ?auto_20325 ?auto_20330 ) ) ( not ( = ?auto_20326 ?auto_20327 ) ) ( not ( = ?auto_20326 ?auto_20328 ) ) ( not ( = ?auto_20326 ?auto_20329 ) ) ( not ( = ?auto_20326 ?auto_20330 ) ) ( not ( = ?auto_20327 ?auto_20328 ) ) ( not ( = ?auto_20327 ?auto_20329 ) ) ( not ( = ?auto_20327 ?auto_20330 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20328 ?auto_20329 ?auto_20330 )
      ( MAKE-5CRATE-VERIFY ?auto_20325 ?auto_20326 ?auto_20327 ?auto_20328 ?auto_20329 ?auto_20330 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20370 - SURFACE
      ?auto_20371 - SURFACE
      ?auto_20372 - SURFACE
      ?auto_20373 - SURFACE
      ?auto_20374 - SURFACE
      ?auto_20375 - SURFACE
    )
    :vars
    (
      ?auto_20377 - HOIST
      ?auto_20378 - PLACE
      ?auto_20379 - TRUCK
      ?auto_20380 - PLACE
      ?auto_20376 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20377 ?auto_20378 ) ( SURFACE-AT ?auto_20374 ?auto_20378 ) ( CLEAR ?auto_20374 ) ( IS-CRATE ?auto_20375 ) ( not ( = ?auto_20374 ?auto_20375 ) ) ( AVAILABLE ?auto_20377 ) ( ON ?auto_20374 ?auto_20373 ) ( not ( = ?auto_20373 ?auto_20374 ) ) ( not ( = ?auto_20373 ?auto_20375 ) ) ( TRUCK-AT ?auto_20379 ?auto_20380 ) ( not ( = ?auto_20380 ?auto_20378 ) ) ( HOIST-AT ?auto_20376 ?auto_20380 ) ( LIFTING ?auto_20376 ?auto_20375 ) ( not ( = ?auto_20377 ?auto_20376 ) ) ( ON ?auto_20371 ?auto_20370 ) ( ON ?auto_20372 ?auto_20371 ) ( ON ?auto_20373 ?auto_20372 ) ( not ( = ?auto_20370 ?auto_20371 ) ) ( not ( = ?auto_20370 ?auto_20372 ) ) ( not ( = ?auto_20370 ?auto_20373 ) ) ( not ( = ?auto_20370 ?auto_20374 ) ) ( not ( = ?auto_20370 ?auto_20375 ) ) ( not ( = ?auto_20371 ?auto_20372 ) ) ( not ( = ?auto_20371 ?auto_20373 ) ) ( not ( = ?auto_20371 ?auto_20374 ) ) ( not ( = ?auto_20371 ?auto_20375 ) ) ( not ( = ?auto_20372 ?auto_20373 ) ) ( not ( = ?auto_20372 ?auto_20374 ) ) ( not ( = ?auto_20372 ?auto_20375 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20373 ?auto_20374 ?auto_20375 )
      ( MAKE-5CRATE-VERIFY ?auto_20370 ?auto_20371 ?auto_20372 ?auto_20373 ?auto_20374 ?auto_20375 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20420 - SURFACE
      ?auto_20421 - SURFACE
      ?auto_20422 - SURFACE
      ?auto_20423 - SURFACE
      ?auto_20424 - SURFACE
      ?auto_20425 - SURFACE
    )
    :vars
    (
      ?auto_20428 - HOIST
      ?auto_20431 - PLACE
      ?auto_20429 - TRUCK
      ?auto_20426 - PLACE
      ?auto_20427 - HOIST
      ?auto_20430 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20428 ?auto_20431 ) ( SURFACE-AT ?auto_20424 ?auto_20431 ) ( CLEAR ?auto_20424 ) ( IS-CRATE ?auto_20425 ) ( not ( = ?auto_20424 ?auto_20425 ) ) ( AVAILABLE ?auto_20428 ) ( ON ?auto_20424 ?auto_20423 ) ( not ( = ?auto_20423 ?auto_20424 ) ) ( not ( = ?auto_20423 ?auto_20425 ) ) ( TRUCK-AT ?auto_20429 ?auto_20426 ) ( not ( = ?auto_20426 ?auto_20431 ) ) ( HOIST-AT ?auto_20427 ?auto_20426 ) ( not ( = ?auto_20428 ?auto_20427 ) ) ( AVAILABLE ?auto_20427 ) ( SURFACE-AT ?auto_20425 ?auto_20426 ) ( ON ?auto_20425 ?auto_20430 ) ( CLEAR ?auto_20425 ) ( not ( = ?auto_20424 ?auto_20430 ) ) ( not ( = ?auto_20425 ?auto_20430 ) ) ( not ( = ?auto_20423 ?auto_20430 ) ) ( ON ?auto_20421 ?auto_20420 ) ( ON ?auto_20422 ?auto_20421 ) ( ON ?auto_20423 ?auto_20422 ) ( not ( = ?auto_20420 ?auto_20421 ) ) ( not ( = ?auto_20420 ?auto_20422 ) ) ( not ( = ?auto_20420 ?auto_20423 ) ) ( not ( = ?auto_20420 ?auto_20424 ) ) ( not ( = ?auto_20420 ?auto_20425 ) ) ( not ( = ?auto_20420 ?auto_20430 ) ) ( not ( = ?auto_20421 ?auto_20422 ) ) ( not ( = ?auto_20421 ?auto_20423 ) ) ( not ( = ?auto_20421 ?auto_20424 ) ) ( not ( = ?auto_20421 ?auto_20425 ) ) ( not ( = ?auto_20421 ?auto_20430 ) ) ( not ( = ?auto_20422 ?auto_20423 ) ) ( not ( = ?auto_20422 ?auto_20424 ) ) ( not ( = ?auto_20422 ?auto_20425 ) ) ( not ( = ?auto_20422 ?auto_20430 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20423 ?auto_20424 ?auto_20425 )
      ( MAKE-5CRATE-VERIFY ?auto_20420 ?auto_20421 ?auto_20422 ?auto_20423 ?auto_20424 ?auto_20425 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20471 - SURFACE
      ?auto_20472 - SURFACE
      ?auto_20473 - SURFACE
      ?auto_20474 - SURFACE
      ?auto_20475 - SURFACE
      ?auto_20476 - SURFACE
    )
    :vars
    (
      ?auto_20479 - HOIST
      ?auto_20481 - PLACE
      ?auto_20478 - PLACE
      ?auto_20477 - HOIST
      ?auto_20480 - SURFACE
      ?auto_20482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20479 ?auto_20481 ) ( SURFACE-AT ?auto_20475 ?auto_20481 ) ( CLEAR ?auto_20475 ) ( IS-CRATE ?auto_20476 ) ( not ( = ?auto_20475 ?auto_20476 ) ) ( AVAILABLE ?auto_20479 ) ( ON ?auto_20475 ?auto_20474 ) ( not ( = ?auto_20474 ?auto_20475 ) ) ( not ( = ?auto_20474 ?auto_20476 ) ) ( not ( = ?auto_20478 ?auto_20481 ) ) ( HOIST-AT ?auto_20477 ?auto_20478 ) ( not ( = ?auto_20479 ?auto_20477 ) ) ( AVAILABLE ?auto_20477 ) ( SURFACE-AT ?auto_20476 ?auto_20478 ) ( ON ?auto_20476 ?auto_20480 ) ( CLEAR ?auto_20476 ) ( not ( = ?auto_20475 ?auto_20480 ) ) ( not ( = ?auto_20476 ?auto_20480 ) ) ( not ( = ?auto_20474 ?auto_20480 ) ) ( TRUCK-AT ?auto_20482 ?auto_20481 ) ( ON ?auto_20472 ?auto_20471 ) ( ON ?auto_20473 ?auto_20472 ) ( ON ?auto_20474 ?auto_20473 ) ( not ( = ?auto_20471 ?auto_20472 ) ) ( not ( = ?auto_20471 ?auto_20473 ) ) ( not ( = ?auto_20471 ?auto_20474 ) ) ( not ( = ?auto_20471 ?auto_20475 ) ) ( not ( = ?auto_20471 ?auto_20476 ) ) ( not ( = ?auto_20471 ?auto_20480 ) ) ( not ( = ?auto_20472 ?auto_20473 ) ) ( not ( = ?auto_20472 ?auto_20474 ) ) ( not ( = ?auto_20472 ?auto_20475 ) ) ( not ( = ?auto_20472 ?auto_20476 ) ) ( not ( = ?auto_20472 ?auto_20480 ) ) ( not ( = ?auto_20473 ?auto_20474 ) ) ( not ( = ?auto_20473 ?auto_20475 ) ) ( not ( = ?auto_20473 ?auto_20476 ) ) ( not ( = ?auto_20473 ?auto_20480 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20474 ?auto_20475 ?auto_20476 )
      ( MAKE-5CRATE-VERIFY ?auto_20471 ?auto_20472 ?auto_20473 ?auto_20474 ?auto_20475 ?auto_20476 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20522 - SURFACE
      ?auto_20523 - SURFACE
      ?auto_20524 - SURFACE
      ?auto_20525 - SURFACE
      ?auto_20526 - SURFACE
      ?auto_20527 - SURFACE
    )
    :vars
    (
      ?auto_20528 - HOIST
      ?auto_20529 - PLACE
      ?auto_20533 - PLACE
      ?auto_20531 - HOIST
      ?auto_20532 - SURFACE
      ?auto_20530 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20528 ?auto_20529 ) ( IS-CRATE ?auto_20527 ) ( not ( = ?auto_20526 ?auto_20527 ) ) ( not ( = ?auto_20525 ?auto_20526 ) ) ( not ( = ?auto_20525 ?auto_20527 ) ) ( not ( = ?auto_20533 ?auto_20529 ) ) ( HOIST-AT ?auto_20531 ?auto_20533 ) ( not ( = ?auto_20528 ?auto_20531 ) ) ( AVAILABLE ?auto_20531 ) ( SURFACE-AT ?auto_20527 ?auto_20533 ) ( ON ?auto_20527 ?auto_20532 ) ( CLEAR ?auto_20527 ) ( not ( = ?auto_20526 ?auto_20532 ) ) ( not ( = ?auto_20527 ?auto_20532 ) ) ( not ( = ?auto_20525 ?auto_20532 ) ) ( TRUCK-AT ?auto_20530 ?auto_20529 ) ( SURFACE-AT ?auto_20525 ?auto_20529 ) ( CLEAR ?auto_20525 ) ( LIFTING ?auto_20528 ?auto_20526 ) ( IS-CRATE ?auto_20526 ) ( ON ?auto_20523 ?auto_20522 ) ( ON ?auto_20524 ?auto_20523 ) ( ON ?auto_20525 ?auto_20524 ) ( not ( = ?auto_20522 ?auto_20523 ) ) ( not ( = ?auto_20522 ?auto_20524 ) ) ( not ( = ?auto_20522 ?auto_20525 ) ) ( not ( = ?auto_20522 ?auto_20526 ) ) ( not ( = ?auto_20522 ?auto_20527 ) ) ( not ( = ?auto_20522 ?auto_20532 ) ) ( not ( = ?auto_20523 ?auto_20524 ) ) ( not ( = ?auto_20523 ?auto_20525 ) ) ( not ( = ?auto_20523 ?auto_20526 ) ) ( not ( = ?auto_20523 ?auto_20527 ) ) ( not ( = ?auto_20523 ?auto_20532 ) ) ( not ( = ?auto_20524 ?auto_20525 ) ) ( not ( = ?auto_20524 ?auto_20526 ) ) ( not ( = ?auto_20524 ?auto_20527 ) ) ( not ( = ?auto_20524 ?auto_20532 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20525 ?auto_20526 ?auto_20527 )
      ( MAKE-5CRATE-VERIFY ?auto_20522 ?auto_20523 ?auto_20524 ?auto_20525 ?auto_20526 ?auto_20527 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20573 - SURFACE
      ?auto_20574 - SURFACE
      ?auto_20575 - SURFACE
      ?auto_20576 - SURFACE
      ?auto_20577 - SURFACE
      ?auto_20578 - SURFACE
    )
    :vars
    (
      ?auto_20583 - HOIST
      ?auto_20582 - PLACE
      ?auto_20580 - PLACE
      ?auto_20581 - HOIST
      ?auto_20579 - SURFACE
      ?auto_20584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20583 ?auto_20582 ) ( IS-CRATE ?auto_20578 ) ( not ( = ?auto_20577 ?auto_20578 ) ) ( not ( = ?auto_20576 ?auto_20577 ) ) ( not ( = ?auto_20576 ?auto_20578 ) ) ( not ( = ?auto_20580 ?auto_20582 ) ) ( HOIST-AT ?auto_20581 ?auto_20580 ) ( not ( = ?auto_20583 ?auto_20581 ) ) ( AVAILABLE ?auto_20581 ) ( SURFACE-AT ?auto_20578 ?auto_20580 ) ( ON ?auto_20578 ?auto_20579 ) ( CLEAR ?auto_20578 ) ( not ( = ?auto_20577 ?auto_20579 ) ) ( not ( = ?auto_20578 ?auto_20579 ) ) ( not ( = ?auto_20576 ?auto_20579 ) ) ( TRUCK-AT ?auto_20584 ?auto_20582 ) ( SURFACE-AT ?auto_20576 ?auto_20582 ) ( CLEAR ?auto_20576 ) ( IS-CRATE ?auto_20577 ) ( AVAILABLE ?auto_20583 ) ( IN ?auto_20577 ?auto_20584 ) ( ON ?auto_20574 ?auto_20573 ) ( ON ?auto_20575 ?auto_20574 ) ( ON ?auto_20576 ?auto_20575 ) ( not ( = ?auto_20573 ?auto_20574 ) ) ( not ( = ?auto_20573 ?auto_20575 ) ) ( not ( = ?auto_20573 ?auto_20576 ) ) ( not ( = ?auto_20573 ?auto_20577 ) ) ( not ( = ?auto_20573 ?auto_20578 ) ) ( not ( = ?auto_20573 ?auto_20579 ) ) ( not ( = ?auto_20574 ?auto_20575 ) ) ( not ( = ?auto_20574 ?auto_20576 ) ) ( not ( = ?auto_20574 ?auto_20577 ) ) ( not ( = ?auto_20574 ?auto_20578 ) ) ( not ( = ?auto_20574 ?auto_20579 ) ) ( not ( = ?auto_20575 ?auto_20576 ) ) ( not ( = ?auto_20575 ?auto_20577 ) ) ( not ( = ?auto_20575 ?auto_20578 ) ) ( not ( = ?auto_20575 ?auto_20579 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20576 ?auto_20577 ?auto_20578 )
      ( MAKE-5CRATE-VERIFY ?auto_20573 ?auto_20574 ?auto_20575 ?auto_20576 ?auto_20577 ?auto_20578 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20941 - SURFACE
      ?auto_20942 - SURFACE
    )
    :vars
    (
      ?auto_20946 - HOIST
      ?auto_20945 - PLACE
      ?auto_20949 - SURFACE
      ?auto_20943 - PLACE
      ?auto_20947 - HOIST
      ?auto_20944 - SURFACE
      ?auto_20948 - TRUCK
      ?auto_20950 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20946 ?auto_20945 ) ( SURFACE-AT ?auto_20941 ?auto_20945 ) ( CLEAR ?auto_20941 ) ( IS-CRATE ?auto_20942 ) ( not ( = ?auto_20941 ?auto_20942 ) ) ( ON ?auto_20941 ?auto_20949 ) ( not ( = ?auto_20949 ?auto_20941 ) ) ( not ( = ?auto_20949 ?auto_20942 ) ) ( not ( = ?auto_20943 ?auto_20945 ) ) ( HOIST-AT ?auto_20947 ?auto_20943 ) ( not ( = ?auto_20946 ?auto_20947 ) ) ( AVAILABLE ?auto_20947 ) ( SURFACE-AT ?auto_20942 ?auto_20943 ) ( ON ?auto_20942 ?auto_20944 ) ( CLEAR ?auto_20942 ) ( not ( = ?auto_20941 ?auto_20944 ) ) ( not ( = ?auto_20942 ?auto_20944 ) ) ( not ( = ?auto_20949 ?auto_20944 ) ) ( TRUCK-AT ?auto_20948 ?auto_20945 ) ( LIFTING ?auto_20946 ?auto_20950 ) ( IS-CRATE ?auto_20950 ) ( not ( = ?auto_20941 ?auto_20950 ) ) ( not ( = ?auto_20942 ?auto_20950 ) ) ( not ( = ?auto_20949 ?auto_20950 ) ) ( not ( = ?auto_20944 ?auto_20950 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20946 ?auto_20950 ?auto_20948 ?auto_20945 )
      ( MAKE-1CRATE ?auto_20941 ?auto_20942 )
      ( MAKE-1CRATE-VERIFY ?auto_20941 ?auto_20942 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21561 - SURFACE
      ?auto_21562 - SURFACE
    )
    :vars
    (
      ?auto_21567 - HOIST
      ?auto_21568 - PLACE
      ?auto_21565 - SURFACE
      ?auto_21564 - TRUCK
      ?auto_21566 - PLACE
      ?auto_21563 - HOIST
      ?auto_21569 - SURFACE
      ?auto_21570 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21567 ?auto_21568 ) ( SURFACE-AT ?auto_21561 ?auto_21568 ) ( CLEAR ?auto_21561 ) ( IS-CRATE ?auto_21562 ) ( not ( = ?auto_21561 ?auto_21562 ) ) ( AVAILABLE ?auto_21567 ) ( ON ?auto_21561 ?auto_21565 ) ( not ( = ?auto_21565 ?auto_21561 ) ) ( not ( = ?auto_21565 ?auto_21562 ) ) ( TRUCK-AT ?auto_21564 ?auto_21566 ) ( not ( = ?auto_21566 ?auto_21568 ) ) ( HOIST-AT ?auto_21563 ?auto_21566 ) ( not ( = ?auto_21567 ?auto_21563 ) ) ( SURFACE-AT ?auto_21562 ?auto_21566 ) ( ON ?auto_21562 ?auto_21569 ) ( CLEAR ?auto_21562 ) ( not ( = ?auto_21561 ?auto_21569 ) ) ( not ( = ?auto_21562 ?auto_21569 ) ) ( not ( = ?auto_21565 ?auto_21569 ) ) ( LIFTING ?auto_21563 ?auto_21570 ) ( IS-CRATE ?auto_21570 ) ( not ( = ?auto_21561 ?auto_21570 ) ) ( not ( = ?auto_21562 ?auto_21570 ) ) ( not ( = ?auto_21565 ?auto_21570 ) ) ( not ( = ?auto_21569 ?auto_21570 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21563 ?auto_21570 ?auto_21564 ?auto_21566 )
      ( MAKE-1CRATE ?auto_21561 ?auto_21562 )
      ( MAKE-1CRATE-VERIFY ?auto_21561 ?auto_21562 ) )
  )

)

