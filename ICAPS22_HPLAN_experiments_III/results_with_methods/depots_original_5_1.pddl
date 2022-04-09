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
      ?auto_19682 - SURFACE
      ?auto_19683 - SURFACE
    )
    :vars
    (
      ?auto_19684 - HOIST
      ?auto_19685 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19684 ?auto_19685 ) ( SURFACE-AT ?auto_19682 ?auto_19685 ) ( CLEAR ?auto_19682 ) ( LIFTING ?auto_19684 ?auto_19683 ) ( IS-CRATE ?auto_19683 ) ( not ( = ?auto_19682 ?auto_19683 ) ) )
    :subtasks
    ( ( !DROP ?auto_19684 ?auto_19683 ?auto_19682 ?auto_19685 )
      ( MAKE-1CRATE-VERIFY ?auto_19682 ?auto_19683 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19686 - SURFACE
      ?auto_19687 - SURFACE
    )
    :vars
    (
      ?auto_19688 - HOIST
      ?auto_19689 - PLACE
      ?auto_19690 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19688 ?auto_19689 ) ( SURFACE-AT ?auto_19686 ?auto_19689 ) ( CLEAR ?auto_19686 ) ( IS-CRATE ?auto_19687 ) ( not ( = ?auto_19686 ?auto_19687 ) ) ( TRUCK-AT ?auto_19690 ?auto_19689 ) ( AVAILABLE ?auto_19688 ) ( IN ?auto_19687 ?auto_19690 ) )
    :subtasks
    ( ( !UNLOAD ?auto_19688 ?auto_19687 ?auto_19690 ?auto_19689 )
      ( MAKE-1CRATE ?auto_19686 ?auto_19687 )
      ( MAKE-1CRATE-VERIFY ?auto_19686 ?auto_19687 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19691 - SURFACE
      ?auto_19692 - SURFACE
    )
    :vars
    (
      ?auto_19693 - HOIST
      ?auto_19695 - PLACE
      ?auto_19694 - TRUCK
      ?auto_19696 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19693 ?auto_19695 ) ( SURFACE-AT ?auto_19691 ?auto_19695 ) ( CLEAR ?auto_19691 ) ( IS-CRATE ?auto_19692 ) ( not ( = ?auto_19691 ?auto_19692 ) ) ( AVAILABLE ?auto_19693 ) ( IN ?auto_19692 ?auto_19694 ) ( TRUCK-AT ?auto_19694 ?auto_19696 ) ( not ( = ?auto_19696 ?auto_19695 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19694 ?auto_19696 ?auto_19695 )
      ( MAKE-1CRATE ?auto_19691 ?auto_19692 )
      ( MAKE-1CRATE-VERIFY ?auto_19691 ?auto_19692 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19697 - SURFACE
      ?auto_19698 - SURFACE
    )
    :vars
    (
      ?auto_19699 - HOIST
      ?auto_19700 - PLACE
      ?auto_19701 - TRUCK
      ?auto_19702 - PLACE
      ?auto_19703 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19699 ?auto_19700 ) ( SURFACE-AT ?auto_19697 ?auto_19700 ) ( CLEAR ?auto_19697 ) ( IS-CRATE ?auto_19698 ) ( not ( = ?auto_19697 ?auto_19698 ) ) ( AVAILABLE ?auto_19699 ) ( TRUCK-AT ?auto_19701 ?auto_19702 ) ( not ( = ?auto_19702 ?auto_19700 ) ) ( HOIST-AT ?auto_19703 ?auto_19702 ) ( LIFTING ?auto_19703 ?auto_19698 ) ( not ( = ?auto_19699 ?auto_19703 ) ) )
    :subtasks
    ( ( !LOAD ?auto_19703 ?auto_19698 ?auto_19701 ?auto_19702 )
      ( MAKE-1CRATE ?auto_19697 ?auto_19698 )
      ( MAKE-1CRATE-VERIFY ?auto_19697 ?auto_19698 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19704 - SURFACE
      ?auto_19705 - SURFACE
    )
    :vars
    (
      ?auto_19706 - HOIST
      ?auto_19707 - PLACE
      ?auto_19708 - TRUCK
      ?auto_19710 - PLACE
      ?auto_19709 - HOIST
      ?auto_19711 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19706 ?auto_19707 ) ( SURFACE-AT ?auto_19704 ?auto_19707 ) ( CLEAR ?auto_19704 ) ( IS-CRATE ?auto_19705 ) ( not ( = ?auto_19704 ?auto_19705 ) ) ( AVAILABLE ?auto_19706 ) ( TRUCK-AT ?auto_19708 ?auto_19710 ) ( not ( = ?auto_19710 ?auto_19707 ) ) ( HOIST-AT ?auto_19709 ?auto_19710 ) ( not ( = ?auto_19706 ?auto_19709 ) ) ( AVAILABLE ?auto_19709 ) ( SURFACE-AT ?auto_19705 ?auto_19710 ) ( ON ?auto_19705 ?auto_19711 ) ( CLEAR ?auto_19705 ) ( not ( = ?auto_19704 ?auto_19711 ) ) ( not ( = ?auto_19705 ?auto_19711 ) ) )
    :subtasks
    ( ( !LIFT ?auto_19709 ?auto_19705 ?auto_19711 ?auto_19710 )
      ( MAKE-1CRATE ?auto_19704 ?auto_19705 )
      ( MAKE-1CRATE-VERIFY ?auto_19704 ?auto_19705 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19712 - SURFACE
      ?auto_19713 - SURFACE
    )
    :vars
    (
      ?auto_19715 - HOIST
      ?auto_19719 - PLACE
      ?auto_19717 - PLACE
      ?auto_19714 - HOIST
      ?auto_19716 - SURFACE
      ?auto_19718 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19715 ?auto_19719 ) ( SURFACE-AT ?auto_19712 ?auto_19719 ) ( CLEAR ?auto_19712 ) ( IS-CRATE ?auto_19713 ) ( not ( = ?auto_19712 ?auto_19713 ) ) ( AVAILABLE ?auto_19715 ) ( not ( = ?auto_19717 ?auto_19719 ) ) ( HOIST-AT ?auto_19714 ?auto_19717 ) ( not ( = ?auto_19715 ?auto_19714 ) ) ( AVAILABLE ?auto_19714 ) ( SURFACE-AT ?auto_19713 ?auto_19717 ) ( ON ?auto_19713 ?auto_19716 ) ( CLEAR ?auto_19713 ) ( not ( = ?auto_19712 ?auto_19716 ) ) ( not ( = ?auto_19713 ?auto_19716 ) ) ( TRUCK-AT ?auto_19718 ?auto_19719 ) )
    :subtasks
    ( ( !DRIVE ?auto_19718 ?auto_19719 ?auto_19717 )
      ( MAKE-1CRATE ?auto_19712 ?auto_19713 )
      ( MAKE-1CRATE-VERIFY ?auto_19712 ?auto_19713 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19725 - SURFACE
      ?auto_19726 - SURFACE
    )
    :vars
    (
      ?auto_19727 - HOIST
      ?auto_19728 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19727 ?auto_19728 ) ( SURFACE-AT ?auto_19725 ?auto_19728 ) ( CLEAR ?auto_19725 ) ( LIFTING ?auto_19727 ?auto_19726 ) ( IS-CRATE ?auto_19726 ) ( not ( = ?auto_19725 ?auto_19726 ) ) )
    :subtasks
    ( ( !DROP ?auto_19727 ?auto_19726 ?auto_19725 ?auto_19728 )
      ( MAKE-1CRATE-VERIFY ?auto_19725 ?auto_19726 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19729 - SURFACE
      ?auto_19730 - SURFACE
      ?auto_19731 - SURFACE
    )
    :vars
    (
      ?auto_19733 - HOIST
      ?auto_19732 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19733 ?auto_19732 ) ( SURFACE-AT ?auto_19730 ?auto_19732 ) ( CLEAR ?auto_19730 ) ( LIFTING ?auto_19733 ?auto_19731 ) ( IS-CRATE ?auto_19731 ) ( not ( = ?auto_19730 ?auto_19731 ) ) ( ON ?auto_19730 ?auto_19729 ) ( not ( = ?auto_19729 ?auto_19730 ) ) ( not ( = ?auto_19729 ?auto_19731 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19730 ?auto_19731 )
      ( MAKE-2CRATE-VERIFY ?auto_19729 ?auto_19730 ?auto_19731 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19734 - SURFACE
      ?auto_19735 - SURFACE
    )
    :vars
    (
      ?auto_19737 - HOIST
      ?auto_19736 - PLACE
      ?auto_19738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19737 ?auto_19736 ) ( SURFACE-AT ?auto_19734 ?auto_19736 ) ( CLEAR ?auto_19734 ) ( IS-CRATE ?auto_19735 ) ( not ( = ?auto_19734 ?auto_19735 ) ) ( TRUCK-AT ?auto_19738 ?auto_19736 ) ( AVAILABLE ?auto_19737 ) ( IN ?auto_19735 ?auto_19738 ) )
    :subtasks
    ( ( !UNLOAD ?auto_19737 ?auto_19735 ?auto_19738 ?auto_19736 )
      ( MAKE-1CRATE ?auto_19734 ?auto_19735 )
      ( MAKE-1CRATE-VERIFY ?auto_19734 ?auto_19735 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19739 - SURFACE
      ?auto_19740 - SURFACE
      ?auto_19741 - SURFACE
    )
    :vars
    (
      ?auto_19744 - HOIST
      ?auto_19743 - PLACE
      ?auto_19742 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19744 ?auto_19743 ) ( SURFACE-AT ?auto_19740 ?auto_19743 ) ( CLEAR ?auto_19740 ) ( IS-CRATE ?auto_19741 ) ( not ( = ?auto_19740 ?auto_19741 ) ) ( TRUCK-AT ?auto_19742 ?auto_19743 ) ( AVAILABLE ?auto_19744 ) ( IN ?auto_19741 ?auto_19742 ) ( ON ?auto_19740 ?auto_19739 ) ( not ( = ?auto_19739 ?auto_19740 ) ) ( not ( = ?auto_19739 ?auto_19741 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19740 ?auto_19741 )
      ( MAKE-2CRATE-VERIFY ?auto_19739 ?auto_19740 ?auto_19741 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19745 - SURFACE
      ?auto_19746 - SURFACE
    )
    :vars
    (
      ?auto_19750 - HOIST
      ?auto_19749 - PLACE
      ?auto_19748 - TRUCK
      ?auto_19747 - SURFACE
      ?auto_19751 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19750 ?auto_19749 ) ( SURFACE-AT ?auto_19745 ?auto_19749 ) ( CLEAR ?auto_19745 ) ( IS-CRATE ?auto_19746 ) ( not ( = ?auto_19745 ?auto_19746 ) ) ( AVAILABLE ?auto_19750 ) ( IN ?auto_19746 ?auto_19748 ) ( ON ?auto_19745 ?auto_19747 ) ( not ( = ?auto_19747 ?auto_19745 ) ) ( not ( = ?auto_19747 ?auto_19746 ) ) ( TRUCK-AT ?auto_19748 ?auto_19751 ) ( not ( = ?auto_19751 ?auto_19749 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19748 ?auto_19751 ?auto_19749 )
      ( MAKE-2CRATE ?auto_19747 ?auto_19745 ?auto_19746 )
      ( MAKE-1CRATE-VERIFY ?auto_19745 ?auto_19746 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19752 - SURFACE
      ?auto_19753 - SURFACE
      ?auto_19754 - SURFACE
    )
    :vars
    (
      ?auto_19757 - HOIST
      ?auto_19758 - PLACE
      ?auto_19756 - TRUCK
      ?auto_19755 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19757 ?auto_19758 ) ( SURFACE-AT ?auto_19753 ?auto_19758 ) ( CLEAR ?auto_19753 ) ( IS-CRATE ?auto_19754 ) ( not ( = ?auto_19753 ?auto_19754 ) ) ( AVAILABLE ?auto_19757 ) ( IN ?auto_19754 ?auto_19756 ) ( ON ?auto_19753 ?auto_19752 ) ( not ( = ?auto_19752 ?auto_19753 ) ) ( not ( = ?auto_19752 ?auto_19754 ) ) ( TRUCK-AT ?auto_19756 ?auto_19755 ) ( not ( = ?auto_19755 ?auto_19758 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19753 ?auto_19754 )
      ( MAKE-2CRATE-VERIFY ?auto_19752 ?auto_19753 ?auto_19754 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19759 - SURFACE
      ?auto_19760 - SURFACE
    )
    :vars
    (
      ?auto_19763 - HOIST
      ?auto_19764 - PLACE
      ?auto_19765 - SURFACE
      ?auto_19761 - TRUCK
      ?auto_19762 - PLACE
      ?auto_19766 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19763 ?auto_19764 ) ( SURFACE-AT ?auto_19759 ?auto_19764 ) ( CLEAR ?auto_19759 ) ( IS-CRATE ?auto_19760 ) ( not ( = ?auto_19759 ?auto_19760 ) ) ( AVAILABLE ?auto_19763 ) ( ON ?auto_19759 ?auto_19765 ) ( not ( = ?auto_19765 ?auto_19759 ) ) ( not ( = ?auto_19765 ?auto_19760 ) ) ( TRUCK-AT ?auto_19761 ?auto_19762 ) ( not ( = ?auto_19762 ?auto_19764 ) ) ( HOIST-AT ?auto_19766 ?auto_19762 ) ( LIFTING ?auto_19766 ?auto_19760 ) ( not ( = ?auto_19763 ?auto_19766 ) ) )
    :subtasks
    ( ( !LOAD ?auto_19766 ?auto_19760 ?auto_19761 ?auto_19762 )
      ( MAKE-2CRATE ?auto_19765 ?auto_19759 ?auto_19760 )
      ( MAKE-1CRATE-VERIFY ?auto_19759 ?auto_19760 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19767 - SURFACE
      ?auto_19768 - SURFACE
      ?auto_19769 - SURFACE
    )
    :vars
    (
      ?auto_19771 - HOIST
      ?auto_19774 - PLACE
      ?auto_19772 - TRUCK
      ?auto_19770 - PLACE
      ?auto_19773 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19771 ?auto_19774 ) ( SURFACE-AT ?auto_19768 ?auto_19774 ) ( CLEAR ?auto_19768 ) ( IS-CRATE ?auto_19769 ) ( not ( = ?auto_19768 ?auto_19769 ) ) ( AVAILABLE ?auto_19771 ) ( ON ?auto_19768 ?auto_19767 ) ( not ( = ?auto_19767 ?auto_19768 ) ) ( not ( = ?auto_19767 ?auto_19769 ) ) ( TRUCK-AT ?auto_19772 ?auto_19770 ) ( not ( = ?auto_19770 ?auto_19774 ) ) ( HOIST-AT ?auto_19773 ?auto_19770 ) ( LIFTING ?auto_19773 ?auto_19769 ) ( not ( = ?auto_19771 ?auto_19773 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19768 ?auto_19769 )
      ( MAKE-2CRATE-VERIFY ?auto_19767 ?auto_19768 ?auto_19769 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19775 - SURFACE
      ?auto_19776 - SURFACE
    )
    :vars
    (
      ?auto_19780 - HOIST
      ?auto_19777 - PLACE
      ?auto_19778 - SURFACE
      ?auto_19781 - TRUCK
      ?auto_19779 - PLACE
      ?auto_19782 - HOIST
      ?auto_19783 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19780 ?auto_19777 ) ( SURFACE-AT ?auto_19775 ?auto_19777 ) ( CLEAR ?auto_19775 ) ( IS-CRATE ?auto_19776 ) ( not ( = ?auto_19775 ?auto_19776 ) ) ( AVAILABLE ?auto_19780 ) ( ON ?auto_19775 ?auto_19778 ) ( not ( = ?auto_19778 ?auto_19775 ) ) ( not ( = ?auto_19778 ?auto_19776 ) ) ( TRUCK-AT ?auto_19781 ?auto_19779 ) ( not ( = ?auto_19779 ?auto_19777 ) ) ( HOIST-AT ?auto_19782 ?auto_19779 ) ( not ( = ?auto_19780 ?auto_19782 ) ) ( AVAILABLE ?auto_19782 ) ( SURFACE-AT ?auto_19776 ?auto_19779 ) ( ON ?auto_19776 ?auto_19783 ) ( CLEAR ?auto_19776 ) ( not ( = ?auto_19775 ?auto_19783 ) ) ( not ( = ?auto_19776 ?auto_19783 ) ) ( not ( = ?auto_19778 ?auto_19783 ) ) )
    :subtasks
    ( ( !LIFT ?auto_19782 ?auto_19776 ?auto_19783 ?auto_19779 )
      ( MAKE-2CRATE ?auto_19778 ?auto_19775 ?auto_19776 )
      ( MAKE-1CRATE-VERIFY ?auto_19775 ?auto_19776 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19784 - SURFACE
      ?auto_19785 - SURFACE
      ?auto_19786 - SURFACE
    )
    :vars
    (
      ?auto_19792 - HOIST
      ?auto_19787 - PLACE
      ?auto_19788 - TRUCK
      ?auto_19791 - PLACE
      ?auto_19789 - HOIST
      ?auto_19790 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19792 ?auto_19787 ) ( SURFACE-AT ?auto_19785 ?auto_19787 ) ( CLEAR ?auto_19785 ) ( IS-CRATE ?auto_19786 ) ( not ( = ?auto_19785 ?auto_19786 ) ) ( AVAILABLE ?auto_19792 ) ( ON ?auto_19785 ?auto_19784 ) ( not ( = ?auto_19784 ?auto_19785 ) ) ( not ( = ?auto_19784 ?auto_19786 ) ) ( TRUCK-AT ?auto_19788 ?auto_19791 ) ( not ( = ?auto_19791 ?auto_19787 ) ) ( HOIST-AT ?auto_19789 ?auto_19791 ) ( not ( = ?auto_19792 ?auto_19789 ) ) ( AVAILABLE ?auto_19789 ) ( SURFACE-AT ?auto_19786 ?auto_19791 ) ( ON ?auto_19786 ?auto_19790 ) ( CLEAR ?auto_19786 ) ( not ( = ?auto_19785 ?auto_19790 ) ) ( not ( = ?auto_19786 ?auto_19790 ) ) ( not ( = ?auto_19784 ?auto_19790 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19785 ?auto_19786 )
      ( MAKE-2CRATE-VERIFY ?auto_19784 ?auto_19785 ?auto_19786 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19793 - SURFACE
      ?auto_19794 - SURFACE
    )
    :vars
    (
      ?auto_19797 - HOIST
      ?auto_19798 - PLACE
      ?auto_19800 - SURFACE
      ?auto_19799 - PLACE
      ?auto_19795 - HOIST
      ?auto_19796 - SURFACE
      ?auto_19801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19797 ?auto_19798 ) ( SURFACE-AT ?auto_19793 ?auto_19798 ) ( CLEAR ?auto_19793 ) ( IS-CRATE ?auto_19794 ) ( not ( = ?auto_19793 ?auto_19794 ) ) ( AVAILABLE ?auto_19797 ) ( ON ?auto_19793 ?auto_19800 ) ( not ( = ?auto_19800 ?auto_19793 ) ) ( not ( = ?auto_19800 ?auto_19794 ) ) ( not ( = ?auto_19799 ?auto_19798 ) ) ( HOIST-AT ?auto_19795 ?auto_19799 ) ( not ( = ?auto_19797 ?auto_19795 ) ) ( AVAILABLE ?auto_19795 ) ( SURFACE-AT ?auto_19794 ?auto_19799 ) ( ON ?auto_19794 ?auto_19796 ) ( CLEAR ?auto_19794 ) ( not ( = ?auto_19793 ?auto_19796 ) ) ( not ( = ?auto_19794 ?auto_19796 ) ) ( not ( = ?auto_19800 ?auto_19796 ) ) ( TRUCK-AT ?auto_19801 ?auto_19798 ) )
    :subtasks
    ( ( !DRIVE ?auto_19801 ?auto_19798 ?auto_19799 )
      ( MAKE-2CRATE ?auto_19800 ?auto_19793 ?auto_19794 )
      ( MAKE-1CRATE-VERIFY ?auto_19793 ?auto_19794 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19802 - SURFACE
      ?auto_19803 - SURFACE
      ?auto_19804 - SURFACE
    )
    :vars
    (
      ?auto_19808 - HOIST
      ?auto_19806 - PLACE
      ?auto_19807 - PLACE
      ?auto_19809 - HOIST
      ?auto_19805 - SURFACE
      ?auto_19810 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19808 ?auto_19806 ) ( SURFACE-AT ?auto_19803 ?auto_19806 ) ( CLEAR ?auto_19803 ) ( IS-CRATE ?auto_19804 ) ( not ( = ?auto_19803 ?auto_19804 ) ) ( AVAILABLE ?auto_19808 ) ( ON ?auto_19803 ?auto_19802 ) ( not ( = ?auto_19802 ?auto_19803 ) ) ( not ( = ?auto_19802 ?auto_19804 ) ) ( not ( = ?auto_19807 ?auto_19806 ) ) ( HOIST-AT ?auto_19809 ?auto_19807 ) ( not ( = ?auto_19808 ?auto_19809 ) ) ( AVAILABLE ?auto_19809 ) ( SURFACE-AT ?auto_19804 ?auto_19807 ) ( ON ?auto_19804 ?auto_19805 ) ( CLEAR ?auto_19804 ) ( not ( = ?auto_19803 ?auto_19805 ) ) ( not ( = ?auto_19804 ?auto_19805 ) ) ( not ( = ?auto_19802 ?auto_19805 ) ) ( TRUCK-AT ?auto_19810 ?auto_19806 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19803 ?auto_19804 )
      ( MAKE-2CRATE-VERIFY ?auto_19802 ?auto_19803 ?auto_19804 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19811 - SURFACE
      ?auto_19812 - SURFACE
    )
    :vars
    (
      ?auto_19814 - HOIST
      ?auto_19819 - PLACE
      ?auto_19813 - SURFACE
      ?auto_19816 - PLACE
      ?auto_19817 - HOIST
      ?auto_19815 - SURFACE
      ?auto_19818 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19814 ?auto_19819 ) ( IS-CRATE ?auto_19812 ) ( not ( = ?auto_19811 ?auto_19812 ) ) ( not ( = ?auto_19813 ?auto_19811 ) ) ( not ( = ?auto_19813 ?auto_19812 ) ) ( not ( = ?auto_19816 ?auto_19819 ) ) ( HOIST-AT ?auto_19817 ?auto_19816 ) ( not ( = ?auto_19814 ?auto_19817 ) ) ( AVAILABLE ?auto_19817 ) ( SURFACE-AT ?auto_19812 ?auto_19816 ) ( ON ?auto_19812 ?auto_19815 ) ( CLEAR ?auto_19812 ) ( not ( = ?auto_19811 ?auto_19815 ) ) ( not ( = ?auto_19812 ?auto_19815 ) ) ( not ( = ?auto_19813 ?auto_19815 ) ) ( TRUCK-AT ?auto_19818 ?auto_19819 ) ( SURFACE-AT ?auto_19813 ?auto_19819 ) ( CLEAR ?auto_19813 ) ( LIFTING ?auto_19814 ?auto_19811 ) ( IS-CRATE ?auto_19811 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19813 ?auto_19811 )
      ( MAKE-2CRATE ?auto_19813 ?auto_19811 ?auto_19812 )
      ( MAKE-1CRATE-VERIFY ?auto_19811 ?auto_19812 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19820 - SURFACE
      ?auto_19821 - SURFACE
      ?auto_19822 - SURFACE
    )
    :vars
    (
      ?auto_19826 - HOIST
      ?auto_19823 - PLACE
      ?auto_19827 - PLACE
      ?auto_19825 - HOIST
      ?auto_19828 - SURFACE
      ?auto_19824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19826 ?auto_19823 ) ( IS-CRATE ?auto_19822 ) ( not ( = ?auto_19821 ?auto_19822 ) ) ( not ( = ?auto_19820 ?auto_19821 ) ) ( not ( = ?auto_19820 ?auto_19822 ) ) ( not ( = ?auto_19827 ?auto_19823 ) ) ( HOIST-AT ?auto_19825 ?auto_19827 ) ( not ( = ?auto_19826 ?auto_19825 ) ) ( AVAILABLE ?auto_19825 ) ( SURFACE-AT ?auto_19822 ?auto_19827 ) ( ON ?auto_19822 ?auto_19828 ) ( CLEAR ?auto_19822 ) ( not ( = ?auto_19821 ?auto_19828 ) ) ( not ( = ?auto_19822 ?auto_19828 ) ) ( not ( = ?auto_19820 ?auto_19828 ) ) ( TRUCK-AT ?auto_19824 ?auto_19823 ) ( SURFACE-AT ?auto_19820 ?auto_19823 ) ( CLEAR ?auto_19820 ) ( LIFTING ?auto_19826 ?auto_19821 ) ( IS-CRATE ?auto_19821 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19821 ?auto_19822 )
      ( MAKE-2CRATE-VERIFY ?auto_19820 ?auto_19821 ?auto_19822 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19829 - SURFACE
      ?auto_19830 - SURFACE
    )
    :vars
    (
      ?auto_19835 - HOIST
      ?auto_19832 - PLACE
      ?auto_19834 - SURFACE
      ?auto_19836 - PLACE
      ?auto_19833 - HOIST
      ?auto_19837 - SURFACE
      ?auto_19831 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19835 ?auto_19832 ) ( IS-CRATE ?auto_19830 ) ( not ( = ?auto_19829 ?auto_19830 ) ) ( not ( = ?auto_19834 ?auto_19829 ) ) ( not ( = ?auto_19834 ?auto_19830 ) ) ( not ( = ?auto_19836 ?auto_19832 ) ) ( HOIST-AT ?auto_19833 ?auto_19836 ) ( not ( = ?auto_19835 ?auto_19833 ) ) ( AVAILABLE ?auto_19833 ) ( SURFACE-AT ?auto_19830 ?auto_19836 ) ( ON ?auto_19830 ?auto_19837 ) ( CLEAR ?auto_19830 ) ( not ( = ?auto_19829 ?auto_19837 ) ) ( not ( = ?auto_19830 ?auto_19837 ) ) ( not ( = ?auto_19834 ?auto_19837 ) ) ( TRUCK-AT ?auto_19831 ?auto_19832 ) ( SURFACE-AT ?auto_19834 ?auto_19832 ) ( CLEAR ?auto_19834 ) ( IS-CRATE ?auto_19829 ) ( AVAILABLE ?auto_19835 ) ( IN ?auto_19829 ?auto_19831 ) )
    :subtasks
    ( ( !UNLOAD ?auto_19835 ?auto_19829 ?auto_19831 ?auto_19832 )
      ( MAKE-2CRATE ?auto_19834 ?auto_19829 ?auto_19830 )
      ( MAKE-1CRATE-VERIFY ?auto_19829 ?auto_19830 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19838 - SURFACE
      ?auto_19839 - SURFACE
      ?auto_19840 - SURFACE
    )
    :vars
    (
      ?auto_19842 - HOIST
      ?auto_19841 - PLACE
      ?auto_19843 - PLACE
      ?auto_19844 - HOIST
      ?auto_19845 - SURFACE
      ?auto_19846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19842 ?auto_19841 ) ( IS-CRATE ?auto_19840 ) ( not ( = ?auto_19839 ?auto_19840 ) ) ( not ( = ?auto_19838 ?auto_19839 ) ) ( not ( = ?auto_19838 ?auto_19840 ) ) ( not ( = ?auto_19843 ?auto_19841 ) ) ( HOIST-AT ?auto_19844 ?auto_19843 ) ( not ( = ?auto_19842 ?auto_19844 ) ) ( AVAILABLE ?auto_19844 ) ( SURFACE-AT ?auto_19840 ?auto_19843 ) ( ON ?auto_19840 ?auto_19845 ) ( CLEAR ?auto_19840 ) ( not ( = ?auto_19839 ?auto_19845 ) ) ( not ( = ?auto_19840 ?auto_19845 ) ) ( not ( = ?auto_19838 ?auto_19845 ) ) ( TRUCK-AT ?auto_19846 ?auto_19841 ) ( SURFACE-AT ?auto_19838 ?auto_19841 ) ( CLEAR ?auto_19838 ) ( IS-CRATE ?auto_19839 ) ( AVAILABLE ?auto_19842 ) ( IN ?auto_19839 ?auto_19846 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19839 ?auto_19840 )
      ( MAKE-2CRATE-VERIFY ?auto_19838 ?auto_19839 ?auto_19840 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19847 - SURFACE
      ?auto_19848 - SURFACE
    )
    :vars
    (
      ?auto_19852 - HOIST
      ?auto_19851 - PLACE
      ?auto_19849 - SURFACE
      ?auto_19855 - PLACE
      ?auto_19854 - HOIST
      ?auto_19850 - SURFACE
      ?auto_19853 - TRUCK
      ?auto_19856 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19852 ?auto_19851 ) ( IS-CRATE ?auto_19848 ) ( not ( = ?auto_19847 ?auto_19848 ) ) ( not ( = ?auto_19849 ?auto_19847 ) ) ( not ( = ?auto_19849 ?auto_19848 ) ) ( not ( = ?auto_19855 ?auto_19851 ) ) ( HOIST-AT ?auto_19854 ?auto_19855 ) ( not ( = ?auto_19852 ?auto_19854 ) ) ( AVAILABLE ?auto_19854 ) ( SURFACE-AT ?auto_19848 ?auto_19855 ) ( ON ?auto_19848 ?auto_19850 ) ( CLEAR ?auto_19848 ) ( not ( = ?auto_19847 ?auto_19850 ) ) ( not ( = ?auto_19848 ?auto_19850 ) ) ( not ( = ?auto_19849 ?auto_19850 ) ) ( SURFACE-AT ?auto_19849 ?auto_19851 ) ( CLEAR ?auto_19849 ) ( IS-CRATE ?auto_19847 ) ( AVAILABLE ?auto_19852 ) ( IN ?auto_19847 ?auto_19853 ) ( TRUCK-AT ?auto_19853 ?auto_19856 ) ( not ( = ?auto_19856 ?auto_19851 ) ) ( not ( = ?auto_19855 ?auto_19856 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19853 ?auto_19856 ?auto_19851 )
      ( MAKE-2CRATE ?auto_19849 ?auto_19847 ?auto_19848 )
      ( MAKE-1CRATE-VERIFY ?auto_19847 ?auto_19848 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19857 - SURFACE
      ?auto_19858 - SURFACE
      ?auto_19859 - SURFACE
    )
    :vars
    (
      ?auto_19866 - HOIST
      ?auto_19863 - PLACE
      ?auto_19865 - PLACE
      ?auto_19861 - HOIST
      ?auto_19864 - SURFACE
      ?auto_19862 - TRUCK
      ?auto_19860 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19866 ?auto_19863 ) ( IS-CRATE ?auto_19859 ) ( not ( = ?auto_19858 ?auto_19859 ) ) ( not ( = ?auto_19857 ?auto_19858 ) ) ( not ( = ?auto_19857 ?auto_19859 ) ) ( not ( = ?auto_19865 ?auto_19863 ) ) ( HOIST-AT ?auto_19861 ?auto_19865 ) ( not ( = ?auto_19866 ?auto_19861 ) ) ( AVAILABLE ?auto_19861 ) ( SURFACE-AT ?auto_19859 ?auto_19865 ) ( ON ?auto_19859 ?auto_19864 ) ( CLEAR ?auto_19859 ) ( not ( = ?auto_19858 ?auto_19864 ) ) ( not ( = ?auto_19859 ?auto_19864 ) ) ( not ( = ?auto_19857 ?auto_19864 ) ) ( SURFACE-AT ?auto_19857 ?auto_19863 ) ( CLEAR ?auto_19857 ) ( IS-CRATE ?auto_19858 ) ( AVAILABLE ?auto_19866 ) ( IN ?auto_19858 ?auto_19862 ) ( TRUCK-AT ?auto_19862 ?auto_19860 ) ( not ( = ?auto_19860 ?auto_19863 ) ) ( not ( = ?auto_19865 ?auto_19860 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19858 ?auto_19859 )
      ( MAKE-2CRATE-VERIFY ?auto_19857 ?auto_19858 ?auto_19859 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19867 - SURFACE
      ?auto_19868 - SURFACE
    )
    :vars
    (
      ?auto_19872 - HOIST
      ?auto_19871 - PLACE
      ?auto_19875 - SURFACE
      ?auto_19869 - PLACE
      ?auto_19876 - HOIST
      ?auto_19874 - SURFACE
      ?auto_19870 - TRUCK
      ?auto_19873 - PLACE
      ?auto_19877 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19872 ?auto_19871 ) ( IS-CRATE ?auto_19868 ) ( not ( = ?auto_19867 ?auto_19868 ) ) ( not ( = ?auto_19875 ?auto_19867 ) ) ( not ( = ?auto_19875 ?auto_19868 ) ) ( not ( = ?auto_19869 ?auto_19871 ) ) ( HOIST-AT ?auto_19876 ?auto_19869 ) ( not ( = ?auto_19872 ?auto_19876 ) ) ( AVAILABLE ?auto_19876 ) ( SURFACE-AT ?auto_19868 ?auto_19869 ) ( ON ?auto_19868 ?auto_19874 ) ( CLEAR ?auto_19868 ) ( not ( = ?auto_19867 ?auto_19874 ) ) ( not ( = ?auto_19868 ?auto_19874 ) ) ( not ( = ?auto_19875 ?auto_19874 ) ) ( SURFACE-AT ?auto_19875 ?auto_19871 ) ( CLEAR ?auto_19875 ) ( IS-CRATE ?auto_19867 ) ( AVAILABLE ?auto_19872 ) ( TRUCK-AT ?auto_19870 ?auto_19873 ) ( not ( = ?auto_19873 ?auto_19871 ) ) ( not ( = ?auto_19869 ?auto_19873 ) ) ( HOIST-AT ?auto_19877 ?auto_19873 ) ( LIFTING ?auto_19877 ?auto_19867 ) ( not ( = ?auto_19872 ?auto_19877 ) ) ( not ( = ?auto_19876 ?auto_19877 ) ) )
    :subtasks
    ( ( !LOAD ?auto_19877 ?auto_19867 ?auto_19870 ?auto_19873 )
      ( MAKE-2CRATE ?auto_19875 ?auto_19867 ?auto_19868 )
      ( MAKE-1CRATE-VERIFY ?auto_19867 ?auto_19868 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19878 - SURFACE
      ?auto_19879 - SURFACE
      ?auto_19880 - SURFACE
    )
    :vars
    (
      ?auto_19888 - HOIST
      ?auto_19884 - PLACE
      ?auto_19882 - PLACE
      ?auto_19885 - HOIST
      ?auto_19887 - SURFACE
      ?auto_19886 - TRUCK
      ?auto_19881 - PLACE
      ?auto_19883 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19888 ?auto_19884 ) ( IS-CRATE ?auto_19880 ) ( not ( = ?auto_19879 ?auto_19880 ) ) ( not ( = ?auto_19878 ?auto_19879 ) ) ( not ( = ?auto_19878 ?auto_19880 ) ) ( not ( = ?auto_19882 ?auto_19884 ) ) ( HOIST-AT ?auto_19885 ?auto_19882 ) ( not ( = ?auto_19888 ?auto_19885 ) ) ( AVAILABLE ?auto_19885 ) ( SURFACE-AT ?auto_19880 ?auto_19882 ) ( ON ?auto_19880 ?auto_19887 ) ( CLEAR ?auto_19880 ) ( not ( = ?auto_19879 ?auto_19887 ) ) ( not ( = ?auto_19880 ?auto_19887 ) ) ( not ( = ?auto_19878 ?auto_19887 ) ) ( SURFACE-AT ?auto_19878 ?auto_19884 ) ( CLEAR ?auto_19878 ) ( IS-CRATE ?auto_19879 ) ( AVAILABLE ?auto_19888 ) ( TRUCK-AT ?auto_19886 ?auto_19881 ) ( not ( = ?auto_19881 ?auto_19884 ) ) ( not ( = ?auto_19882 ?auto_19881 ) ) ( HOIST-AT ?auto_19883 ?auto_19881 ) ( LIFTING ?auto_19883 ?auto_19879 ) ( not ( = ?auto_19888 ?auto_19883 ) ) ( not ( = ?auto_19885 ?auto_19883 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19879 ?auto_19880 )
      ( MAKE-2CRATE-VERIFY ?auto_19878 ?auto_19879 ?auto_19880 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19889 - SURFACE
      ?auto_19890 - SURFACE
    )
    :vars
    (
      ?auto_19892 - HOIST
      ?auto_19896 - PLACE
      ?auto_19891 - SURFACE
      ?auto_19899 - PLACE
      ?auto_19893 - HOIST
      ?auto_19898 - SURFACE
      ?auto_19897 - TRUCK
      ?auto_19895 - PLACE
      ?auto_19894 - HOIST
      ?auto_19900 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19892 ?auto_19896 ) ( IS-CRATE ?auto_19890 ) ( not ( = ?auto_19889 ?auto_19890 ) ) ( not ( = ?auto_19891 ?auto_19889 ) ) ( not ( = ?auto_19891 ?auto_19890 ) ) ( not ( = ?auto_19899 ?auto_19896 ) ) ( HOIST-AT ?auto_19893 ?auto_19899 ) ( not ( = ?auto_19892 ?auto_19893 ) ) ( AVAILABLE ?auto_19893 ) ( SURFACE-AT ?auto_19890 ?auto_19899 ) ( ON ?auto_19890 ?auto_19898 ) ( CLEAR ?auto_19890 ) ( not ( = ?auto_19889 ?auto_19898 ) ) ( not ( = ?auto_19890 ?auto_19898 ) ) ( not ( = ?auto_19891 ?auto_19898 ) ) ( SURFACE-AT ?auto_19891 ?auto_19896 ) ( CLEAR ?auto_19891 ) ( IS-CRATE ?auto_19889 ) ( AVAILABLE ?auto_19892 ) ( TRUCK-AT ?auto_19897 ?auto_19895 ) ( not ( = ?auto_19895 ?auto_19896 ) ) ( not ( = ?auto_19899 ?auto_19895 ) ) ( HOIST-AT ?auto_19894 ?auto_19895 ) ( not ( = ?auto_19892 ?auto_19894 ) ) ( not ( = ?auto_19893 ?auto_19894 ) ) ( AVAILABLE ?auto_19894 ) ( SURFACE-AT ?auto_19889 ?auto_19895 ) ( ON ?auto_19889 ?auto_19900 ) ( CLEAR ?auto_19889 ) ( not ( = ?auto_19889 ?auto_19900 ) ) ( not ( = ?auto_19890 ?auto_19900 ) ) ( not ( = ?auto_19891 ?auto_19900 ) ) ( not ( = ?auto_19898 ?auto_19900 ) ) )
    :subtasks
    ( ( !LIFT ?auto_19894 ?auto_19889 ?auto_19900 ?auto_19895 )
      ( MAKE-2CRATE ?auto_19891 ?auto_19889 ?auto_19890 )
      ( MAKE-1CRATE-VERIFY ?auto_19889 ?auto_19890 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19901 - SURFACE
      ?auto_19902 - SURFACE
      ?auto_19903 - SURFACE
    )
    :vars
    (
      ?auto_19912 - HOIST
      ?auto_19909 - PLACE
      ?auto_19907 - PLACE
      ?auto_19906 - HOIST
      ?auto_19910 - SURFACE
      ?auto_19904 - TRUCK
      ?auto_19911 - PLACE
      ?auto_19908 - HOIST
      ?auto_19905 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19912 ?auto_19909 ) ( IS-CRATE ?auto_19903 ) ( not ( = ?auto_19902 ?auto_19903 ) ) ( not ( = ?auto_19901 ?auto_19902 ) ) ( not ( = ?auto_19901 ?auto_19903 ) ) ( not ( = ?auto_19907 ?auto_19909 ) ) ( HOIST-AT ?auto_19906 ?auto_19907 ) ( not ( = ?auto_19912 ?auto_19906 ) ) ( AVAILABLE ?auto_19906 ) ( SURFACE-AT ?auto_19903 ?auto_19907 ) ( ON ?auto_19903 ?auto_19910 ) ( CLEAR ?auto_19903 ) ( not ( = ?auto_19902 ?auto_19910 ) ) ( not ( = ?auto_19903 ?auto_19910 ) ) ( not ( = ?auto_19901 ?auto_19910 ) ) ( SURFACE-AT ?auto_19901 ?auto_19909 ) ( CLEAR ?auto_19901 ) ( IS-CRATE ?auto_19902 ) ( AVAILABLE ?auto_19912 ) ( TRUCK-AT ?auto_19904 ?auto_19911 ) ( not ( = ?auto_19911 ?auto_19909 ) ) ( not ( = ?auto_19907 ?auto_19911 ) ) ( HOIST-AT ?auto_19908 ?auto_19911 ) ( not ( = ?auto_19912 ?auto_19908 ) ) ( not ( = ?auto_19906 ?auto_19908 ) ) ( AVAILABLE ?auto_19908 ) ( SURFACE-AT ?auto_19902 ?auto_19911 ) ( ON ?auto_19902 ?auto_19905 ) ( CLEAR ?auto_19902 ) ( not ( = ?auto_19902 ?auto_19905 ) ) ( not ( = ?auto_19903 ?auto_19905 ) ) ( not ( = ?auto_19901 ?auto_19905 ) ) ( not ( = ?auto_19910 ?auto_19905 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19902 ?auto_19903 )
      ( MAKE-2CRATE-VERIFY ?auto_19901 ?auto_19902 ?auto_19903 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19913 - SURFACE
      ?auto_19914 - SURFACE
    )
    :vars
    (
      ?auto_19924 - HOIST
      ?auto_19917 - PLACE
      ?auto_19916 - SURFACE
      ?auto_19922 - PLACE
      ?auto_19915 - HOIST
      ?auto_19919 - SURFACE
      ?auto_19918 - PLACE
      ?auto_19921 - HOIST
      ?auto_19923 - SURFACE
      ?auto_19920 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19924 ?auto_19917 ) ( IS-CRATE ?auto_19914 ) ( not ( = ?auto_19913 ?auto_19914 ) ) ( not ( = ?auto_19916 ?auto_19913 ) ) ( not ( = ?auto_19916 ?auto_19914 ) ) ( not ( = ?auto_19922 ?auto_19917 ) ) ( HOIST-AT ?auto_19915 ?auto_19922 ) ( not ( = ?auto_19924 ?auto_19915 ) ) ( AVAILABLE ?auto_19915 ) ( SURFACE-AT ?auto_19914 ?auto_19922 ) ( ON ?auto_19914 ?auto_19919 ) ( CLEAR ?auto_19914 ) ( not ( = ?auto_19913 ?auto_19919 ) ) ( not ( = ?auto_19914 ?auto_19919 ) ) ( not ( = ?auto_19916 ?auto_19919 ) ) ( SURFACE-AT ?auto_19916 ?auto_19917 ) ( CLEAR ?auto_19916 ) ( IS-CRATE ?auto_19913 ) ( AVAILABLE ?auto_19924 ) ( not ( = ?auto_19918 ?auto_19917 ) ) ( not ( = ?auto_19922 ?auto_19918 ) ) ( HOIST-AT ?auto_19921 ?auto_19918 ) ( not ( = ?auto_19924 ?auto_19921 ) ) ( not ( = ?auto_19915 ?auto_19921 ) ) ( AVAILABLE ?auto_19921 ) ( SURFACE-AT ?auto_19913 ?auto_19918 ) ( ON ?auto_19913 ?auto_19923 ) ( CLEAR ?auto_19913 ) ( not ( = ?auto_19913 ?auto_19923 ) ) ( not ( = ?auto_19914 ?auto_19923 ) ) ( not ( = ?auto_19916 ?auto_19923 ) ) ( not ( = ?auto_19919 ?auto_19923 ) ) ( TRUCK-AT ?auto_19920 ?auto_19917 ) )
    :subtasks
    ( ( !DRIVE ?auto_19920 ?auto_19917 ?auto_19918 )
      ( MAKE-2CRATE ?auto_19916 ?auto_19913 ?auto_19914 )
      ( MAKE-1CRATE-VERIFY ?auto_19913 ?auto_19914 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19925 - SURFACE
      ?auto_19926 - SURFACE
      ?auto_19927 - SURFACE
    )
    :vars
    (
      ?auto_19934 - HOIST
      ?auto_19928 - PLACE
      ?auto_19932 - PLACE
      ?auto_19930 - HOIST
      ?auto_19933 - SURFACE
      ?auto_19931 - PLACE
      ?auto_19935 - HOIST
      ?auto_19936 - SURFACE
      ?auto_19929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19934 ?auto_19928 ) ( IS-CRATE ?auto_19927 ) ( not ( = ?auto_19926 ?auto_19927 ) ) ( not ( = ?auto_19925 ?auto_19926 ) ) ( not ( = ?auto_19925 ?auto_19927 ) ) ( not ( = ?auto_19932 ?auto_19928 ) ) ( HOIST-AT ?auto_19930 ?auto_19932 ) ( not ( = ?auto_19934 ?auto_19930 ) ) ( AVAILABLE ?auto_19930 ) ( SURFACE-AT ?auto_19927 ?auto_19932 ) ( ON ?auto_19927 ?auto_19933 ) ( CLEAR ?auto_19927 ) ( not ( = ?auto_19926 ?auto_19933 ) ) ( not ( = ?auto_19927 ?auto_19933 ) ) ( not ( = ?auto_19925 ?auto_19933 ) ) ( SURFACE-AT ?auto_19925 ?auto_19928 ) ( CLEAR ?auto_19925 ) ( IS-CRATE ?auto_19926 ) ( AVAILABLE ?auto_19934 ) ( not ( = ?auto_19931 ?auto_19928 ) ) ( not ( = ?auto_19932 ?auto_19931 ) ) ( HOIST-AT ?auto_19935 ?auto_19931 ) ( not ( = ?auto_19934 ?auto_19935 ) ) ( not ( = ?auto_19930 ?auto_19935 ) ) ( AVAILABLE ?auto_19935 ) ( SURFACE-AT ?auto_19926 ?auto_19931 ) ( ON ?auto_19926 ?auto_19936 ) ( CLEAR ?auto_19926 ) ( not ( = ?auto_19926 ?auto_19936 ) ) ( not ( = ?auto_19927 ?auto_19936 ) ) ( not ( = ?auto_19925 ?auto_19936 ) ) ( not ( = ?auto_19933 ?auto_19936 ) ) ( TRUCK-AT ?auto_19929 ?auto_19928 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19926 ?auto_19927 )
      ( MAKE-2CRATE-VERIFY ?auto_19925 ?auto_19926 ?auto_19927 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19946 - SURFACE
      ?auto_19947 - SURFACE
    )
    :vars
    (
      ?auto_19948 - HOIST
      ?auto_19949 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19948 ?auto_19949 ) ( SURFACE-AT ?auto_19946 ?auto_19949 ) ( CLEAR ?auto_19946 ) ( LIFTING ?auto_19948 ?auto_19947 ) ( IS-CRATE ?auto_19947 ) ( not ( = ?auto_19946 ?auto_19947 ) ) )
    :subtasks
    ( ( !DROP ?auto_19948 ?auto_19947 ?auto_19946 ?auto_19949 )
      ( MAKE-1CRATE-VERIFY ?auto_19946 ?auto_19947 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19950 - SURFACE
      ?auto_19951 - SURFACE
      ?auto_19952 - SURFACE
    )
    :vars
    (
      ?auto_19954 - HOIST
      ?auto_19953 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19954 ?auto_19953 ) ( SURFACE-AT ?auto_19951 ?auto_19953 ) ( CLEAR ?auto_19951 ) ( LIFTING ?auto_19954 ?auto_19952 ) ( IS-CRATE ?auto_19952 ) ( not ( = ?auto_19951 ?auto_19952 ) ) ( ON ?auto_19951 ?auto_19950 ) ( not ( = ?auto_19950 ?auto_19951 ) ) ( not ( = ?auto_19950 ?auto_19952 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19951 ?auto_19952 )
      ( MAKE-2CRATE-VERIFY ?auto_19950 ?auto_19951 ?auto_19952 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19955 - SURFACE
      ?auto_19956 - SURFACE
      ?auto_19957 - SURFACE
      ?auto_19958 - SURFACE
    )
    :vars
    (
      ?auto_19960 - HOIST
      ?auto_19959 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19960 ?auto_19959 ) ( SURFACE-AT ?auto_19957 ?auto_19959 ) ( CLEAR ?auto_19957 ) ( LIFTING ?auto_19960 ?auto_19958 ) ( IS-CRATE ?auto_19958 ) ( not ( = ?auto_19957 ?auto_19958 ) ) ( ON ?auto_19956 ?auto_19955 ) ( ON ?auto_19957 ?auto_19956 ) ( not ( = ?auto_19955 ?auto_19956 ) ) ( not ( = ?auto_19955 ?auto_19957 ) ) ( not ( = ?auto_19955 ?auto_19958 ) ) ( not ( = ?auto_19956 ?auto_19957 ) ) ( not ( = ?auto_19956 ?auto_19958 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19957 ?auto_19958 )
      ( MAKE-3CRATE-VERIFY ?auto_19955 ?auto_19956 ?auto_19957 ?auto_19958 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19961 - SURFACE
      ?auto_19962 - SURFACE
    )
    :vars
    (
      ?auto_19964 - HOIST
      ?auto_19963 - PLACE
      ?auto_19965 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19964 ?auto_19963 ) ( SURFACE-AT ?auto_19961 ?auto_19963 ) ( CLEAR ?auto_19961 ) ( IS-CRATE ?auto_19962 ) ( not ( = ?auto_19961 ?auto_19962 ) ) ( TRUCK-AT ?auto_19965 ?auto_19963 ) ( AVAILABLE ?auto_19964 ) ( IN ?auto_19962 ?auto_19965 ) )
    :subtasks
    ( ( !UNLOAD ?auto_19964 ?auto_19962 ?auto_19965 ?auto_19963 )
      ( MAKE-1CRATE ?auto_19961 ?auto_19962 )
      ( MAKE-1CRATE-VERIFY ?auto_19961 ?auto_19962 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19966 - SURFACE
      ?auto_19967 - SURFACE
      ?auto_19968 - SURFACE
    )
    :vars
    (
      ?auto_19969 - HOIST
      ?auto_19971 - PLACE
      ?auto_19970 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19969 ?auto_19971 ) ( SURFACE-AT ?auto_19967 ?auto_19971 ) ( CLEAR ?auto_19967 ) ( IS-CRATE ?auto_19968 ) ( not ( = ?auto_19967 ?auto_19968 ) ) ( TRUCK-AT ?auto_19970 ?auto_19971 ) ( AVAILABLE ?auto_19969 ) ( IN ?auto_19968 ?auto_19970 ) ( ON ?auto_19967 ?auto_19966 ) ( not ( = ?auto_19966 ?auto_19967 ) ) ( not ( = ?auto_19966 ?auto_19968 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19967 ?auto_19968 )
      ( MAKE-2CRATE-VERIFY ?auto_19966 ?auto_19967 ?auto_19968 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19972 - SURFACE
      ?auto_19973 - SURFACE
      ?auto_19974 - SURFACE
      ?auto_19975 - SURFACE
    )
    :vars
    (
      ?auto_19977 - HOIST
      ?auto_19978 - PLACE
      ?auto_19976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19977 ?auto_19978 ) ( SURFACE-AT ?auto_19974 ?auto_19978 ) ( CLEAR ?auto_19974 ) ( IS-CRATE ?auto_19975 ) ( not ( = ?auto_19974 ?auto_19975 ) ) ( TRUCK-AT ?auto_19976 ?auto_19978 ) ( AVAILABLE ?auto_19977 ) ( IN ?auto_19975 ?auto_19976 ) ( ON ?auto_19974 ?auto_19973 ) ( not ( = ?auto_19973 ?auto_19974 ) ) ( not ( = ?auto_19973 ?auto_19975 ) ) ( ON ?auto_19973 ?auto_19972 ) ( not ( = ?auto_19972 ?auto_19973 ) ) ( not ( = ?auto_19972 ?auto_19974 ) ) ( not ( = ?auto_19972 ?auto_19975 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19973 ?auto_19974 ?auto_19975 )
      ( MAKE-3CRATE-VERIFY ?auto_19972 ?auto_19973 ?auto_19974 ?auto_19975 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19979 - SURFACE
      ?auto_19980 - SURFACE
    )
    :vars
    (
      ?auto_19983 - HOIST
      ?auto_19984 - PLACE
      ?auto_19981 - TRUCK
      ?auto_19982 - SURFACE
      ?auto_19985 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19983 ?auto_19984 ) ( SURFACE-AT ?auto_19979 ?auto_19984 ) ( CLEAR ?auto_19979 ) ( IS-CRATE ?auto_19980 ) ( not ( = ?auto_19979 ?auto_19980 ) ) ( AVAILABLE ?auto_19983 ) ( IN ?auto_19980 ?auto_19981 ) ( ON ?auto_19979 ?auto_19982 ) ( not ( = ?auto_19982 ?auto_19979 ) ) ( not ( = ?auto_19982 ?auto_19980 ) ) ( TRUCK-AT ?auto_19981 ?auto_19985 ) ( not ( = ?auto_19985 ?auto_19984 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19981 ?auto_19985 ?auto_19984 )
      ( MAKE-2CRATE ?auto_19982 ?auto_19979 ?auto_19980 )
      ( MAKE-1CRATE-VERIFY ?auto_19979 ?auto_19980 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19986 - SURFACE
      ?auto_19987 - SURFACE
      ?auto_19988 - SURFACE
    )
    :vars
    (
      ?auto_19992 - HOIST
      ?auto_19989 - PLACE
      ?auto_19990 - TRUCK
      ?auto_19991 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19992 ?auto_19989 ) ( SURFACE-AT ?auto_19987 ?auto_19989 ) ( CLEAR ?auto_19987 ) ( IS-CRATE ?auto_19988 ) ( not ( = ?auto_19987 ?auto_19988 ) ) ( AVAILABLE ?auto_19992 ) ( IN ?auto_19988 ?auto_19990 ) ( ON ?auto_19987 ?auto_19986 ) ( not ( = ?auto_19986 ?auto_19987 ) ) ( not ( = ?auto_19986 ?auto_19988 ) ) ( TRUCK-AT ?auto_19990 ?auto_19991 ) ( not ( = ?auto_19991 ?auto_19989 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19987 ?auto_19988 )
      ( MAKE-2CRATE-VERIFY ?auto_19986 ?auto_19987 ?auto_19988 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19993 - SURFACE
      ?auto_19994 - SURFACE
      ?auto_19995 - SURFACE
      ?auto_19996 - SURFACE
    )
    :vars
    (
      ?auto_20000 - HOIST
      ?auto_19998 - PLACE
      ?auto_19999 - TRUCK
      ?auto_19997 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20000 ?auto_19998 ) ( SURFACE-AT ?auto_19995 ?auto_19998 ) ( CLEAR ?auto_19995 ) ( IS-CRATE ?auto_19996 ) ( not ( = ?auto_19995 ?auto_19996 ) ) ( AVAILABLE ?auto_20000 ) ( IN ?auto_19996 ?auto_19999 ) ( ON ?auto_19995 ?auto_19994 ) ( not ( = ?auto_19994 ?auto_19995 ) ) ( not ( = ?auto_19994 ?auto_19996 ) ) ( TRUCK-AT ?auto_19999 ?auto_19997 ) ( not ( = ?auto_19997 ?auto_19998 ) ) ( ON ?auto_19994 ?auto_19993 ) ( not ( = ?auto_19993 ?auto_19994 ) ) ( not ( = ?auto_19993 ?auto_19995 ) ) ( not ( = ?auto_19993 ?auto_19996 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19994 ?auto_19995 ?auto_19996 )
      ( MAKE-3CRATE-VERIFY ?auto_19993 ?auto_19994 ?auto_19995 ?auto_19996 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20001 - SURFACE
      ?auto_20002 - SURFACE
    )
    :vars
    (
      ?auto_20007 - HOIST
      ?auto_20005 - PLACE
      ?auto_20003 - SURFACE
      ?auto_20006 - TRUCK
      ?auto_20004 - PLACE
      ?auto_20008 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20007 ?auto_20005 ) ( SURFACE-AT ?auto_20001 ?auto_20005 ) ( CLEAR ?auto_20001 ) ( IS-CRATE ?auto_20002 ) ( not ( = ?auto_20001 ?auto_20002 ) ) ( AVAILABLE ?auto_20007 ) ( ON ?auto_20001 ?auto_20003 ) ( not ( = ?auto_20003 ?auto_20001 ) ) ( not ( = ?auto_20003 ?auto_20002 ) ) ( TRUCK-AT ?auto_20006 ?auto_20004 ) ( not ( = ?auto_20004 ?auto_20005 ) ) ( HOIST-AT ?auto_20008 ?auto_20004 ) ( LIFTING ?auto_20008 ?auto_20002 ) ( not ( = ?auto_20007 ?auto_20008 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20008 ?auto_20002 ?auto_20006 ?auto_20004 )
      ( MAKE-2CRATE ?auto_20003 ?auto_20001 ?auto_20002 )
      ( MAKE-1CRATE-VERIFY ?auto_20001 ?auto_20002 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20009 - SURFACE
      ?auto_20010 - SURFACE
      ?auto_20011 - SURFACE
    )
    :vars
    (
      ?auto_20012 - HOIST
      ?auto_20016 - PLACE
      ?auto_20014 - TRUCK
      ?auto_20013 - PLACE
      ?auto_20015 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20012 ?auto_20016 ) ( SURFACE-AT ?auto_20010 ?auto_20016 ) ( CLEAR ?auto_20010 ) ( IS-CRATE ?auto_20011 ) ( not ( = ?auto_20010 ?auto_20011 ) ) ( AVAILABLE ?auto_20012 ) ( ON ?auto_20010 ?auto_20009 ) ( not ( = ?auto_20009 ?auto_20010 ) ) ( not ( = ?auto_20009 ?auto_20011 ) ) ( TRUCK-AT ?auto_20014 ?auto_20013 ) ( not ( = ?auto_20013 ?auto_20016 ) ) ( HOIST-AT ?auto_20015 ?auto_20013 ) ( LIFTING ?auto_20015 ?auto_20011 ) ( not ( = ?auto_20012 ?auto_20015 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20010 ?auto_20011 )
      ( MAKE-2CRATE-VERIFY ?auto_20009 ?auto_20010 ?auto_20011 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20017 - SURFACE
      ?auto_20018 - SURFACE
      ?auto_20019 - SURFACE
      ?auto_20020 - SURFACE
    )
    :vars
    (
      ?auto_20025 - HOIST
      ?auto_20023 - PLACE
      ?auto_20022 - TRUCK
      ?auto_20021 - PLACE
      ?auto_20024 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20025 ?auto_20023 ) ( SURFACE-AT ?auto_20019 ?auto_20023 ) ( CLEAR ?auto_20019 ) ( IS-CRATE ?auto_20020 ) ( not ( = ?auto_20019 ?auto_20020 ) ) ( AVAILABLE ?auto_20025 ) ( ON ?auto_20019 ?auto_20018 ) ( not ( = ?auto_20018 ?auto_20019 ) ) ( not ( = ?auto_20018 ?auto_20020 ) ) ( TRUCK-AT ?auto_20022 ?auto_20021 ) ( not ( = ?auto_20021 ?auto_20023 ) ) ( HOIST-AT ?auto_20024 ?auto_20021 ) ( LIFTING ?auto_20024 ?auto_20020 ) ( not ( = ?auto_20025 ?auto_20024 ) ) ( ON ?auto_20018 ?auto_20017 ) ( not ( = ?auto_20017 ?auto_20018 ) ) ( not ( = ?auto_20017 ?auto_20019 ) ) ( not ( = ?auto_20017 ?auto_20020 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20018 ?auto_20019 ?auto_20020 )
      ( MAKE-3CRATE-VERIFY ?auto_20017 ?auto_20018 ?auto_20019 ?auto_20020 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20026 - SURFACE
      ?auto_20027 - SURFACE
    )
    :vars
    (
      ?auto_20033 - HOIST
      ?auto_20030 - PLACE
      ?auto_20032 - SURFACE
      ?auto_20029 - TRUCK
      ?auto_20028 - PLACE
      ?auto_20031 - HOIST
      ?auto_20034 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20033 ?auto_20030 ) ( SURFACE-AT ?auto_20026 ?auto_20030 ) ( CLEAR ?auto_20026 ) ( IS-CRATE ?auto_20027 ) ( not ( = ?auto_20026 ?auto_20027 ) ) ( AVAILABLE ?auto_20033 ) ( ON ?auto_20026 ?auto_20032 ) ( not ( = ?auto_20032 ?auto_20026 ) ) ( not ( = ?auto_20032 ?auto_20027 ) ) ( TRUCK-AT ?auto_20029 ?auto_20028 ) ( not ( = ?auto_20028 ?auto_20030 ) ) ( HOIST-AT ?auto_20031 ?auto_20028 ) ( not ( = ?auto_20033 ?auto_20031 ) ) ( AVAILABLE ?auto_20031 ) ( SURFACE-AT ?auto_20027 ?auto_20028 ) ( ON ?auto_20027 ?auto_20034 ) ( CLEAR ?auto_20027 ) ( not ( = ?auto_20026 ?auto_20034 ) ) ( not ( = ?auto_20027 ?auto_20034 ) ) ( not ( = ?auto_20032 ?auto_20034 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20031 ?auto_20027 ?auto_20034 ?auto_20028 )
      ( MAKE-2CRATE ?auto_20032 ?auto_20026 ?auto_20027 )
      ( MAKE-1CRATE-VERIFY ?auto_20026 ?auto_20027 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20035 - SURFACE
      ?auto_20036 - SURFACE
      ?auto_20037 - SURFACE
    )
    :vars
    (
      ?auto_20041 - HOIST
      ?auto_20039 - PLACE
      ?auto_20038 - TRUCK
      ?auto_20042 - PLACE
      ?auto_20040 - HOIST
      ?auto_20043 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20041 ?auto_20039 ) ( SURFACE-AT ?auto_20036 ?auto_20039 ) ( CLEAR ?auto_20036 ) ( IS-CRATE ?auto_20037 ) ( not ( = ?auto_20036 ?auto_20037 ) ) ( AVAILABLE ?auto_20041 ) ( ON ?auto_20036 ?auto_20035 ) ( not ( = ?auto_20035 ?auto_20036 ) ) ( not ( = ?auto_20035 ?auto_20037 ) ) ( TRUCK-AT ?auto_20038 ?auto_20042 ) ( not ( = ?auto_20042 ?auto_20039 ) ) ( HOIST-AT ?auto_20040 ?auto_20042 ) ( not ( = ?auto_20041 ?auto_20040 ) ) ( AVAILABLE ?auto_20040 ) ( SURFACE-AT ?auto_20037 ?auto_20042 ) ( ON ?auto_20037 ?auto_20043 ) ( CLEAR ?auto_20037 ) ( not ( = ?auto_20036 ?auto_20043 ) ) ( not ( = ?auto_20037 ?auto_20043 ) ) ( not ( = ?auto_20035 ?auto_20043 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20036 ?auto_20037 )
      ( MAKE-2CRATE-VERIFY ?auto_20035 ?auto_20036 ?auto_20037 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20044 - SURFACE
      ?auto_20045 - SURFACE
      ?auto_20046 - SURFACE
      ?auto_20047 - SURFACE
    )
    :vars
    (
      ?auto_20048 - HOIST
      ?auto_20049 - PLACE
      ?auto_20050 - TRUCK
      ?auto_20053 - PLACE
      ?auto_20051 - HOIST
      ?auto_20052 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20048 ?auto_20049 ) ( SURFACE-AT ?auto_20046 ?auto_20049 ) ( CLEAR ?auto_20046 ) ( IS-CRATE ?auto_20047 ) ( not ( = ?auto_20046 ?auto_20047 ) ) ( AVAILABLE ?auto_20048 ) ( ON ?auto_20046 ?auto_20045 ) ( not ( = ?auto_20045 ?auto_20046 ) ) ( not ( = ?auto_20045 ?auto_20047 ) ) ( TRUCK-AT ?auto_20050 ?auto_20053 ) ( not ( = ?auto_20053 ?auto_20049 ) ) ( HOIST-AT ?auto_20051 ?auto_20053 ) ( not ( = ?auto_20048 ?auto_20051 ) ) ( AVAILABLE ?auto_20051 ) ( SURFACE-AT ?auto_20047 ?auto_20053 ) ( ON ?auto_20047 ?auto_20052 ) ( CLEAR ?auto_20047 ) ( not ( = ?auto_20046 ?auto_20052 ) ) ( not ( = ?auto_20047 ?auto_20052 ) ) ( not ( = ?auto_20045 ?auto_20052 ) ) ( ON ?auto_20045 ?auto_20044 ) ( not ( = ?auto_20044 ?auto_20045 ) ) ( not ( = ?auto_20044 ?auto_20046 ) ) ( not ( = ?auto_20044 ?auto_20047 ) ) ( not ( = ?auto_20044 ?auto_20052 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20045 ?auto_20046 ?auto_20047 )
      ( MAKE-3CRATE-VERIFY ?auto_20044 ?auto_20045 ?auto_20046 ?auto_20047 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20054 - SURFACE
      ?auto_20055 - SURFACE
    )
    :vars
    (
      ?auto_20057 - HOIST
      ?auto_20058 - PLACE
      ?auto_20056 - SURFACE
      ?auto_20062 - PLACE
      ?auto_20060 - HOIST
      ?auto_20061 - SURFACE
      ?auto_20059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20057 ?auto_20058 ) ( SURFACE-AT ?auto_20054 ?auto_20058 ) ( CLEAR ?auto_20054 ) ( IS-CRATE ?auto_20055 ) ( not ( = ?auto_20054 ?auto_20055 ) ) ( AVAILABLE ?auto_20057 ) ( ON ?auto_20054 ?auto_20056 ) ( not ( = ?auto_20056 ?auto_20054 ) ) ( not ( = ?auto_20056 ?auto_20055 ) ) ( not ( = ?auto_20062 ?auto_20058 ) ) ( HOIST-AT ?auto_20060 ?auto_20062 ) ( not ( = ?auto_20057 ?auto_20060 ) ) ( AVAILABLE ?auto_20060 ) ( SURFACE-AT ?auto_20055 ?auto_20062 ) ( ON ?auto_20055 ?auto_20061 ) ( CLEAR ?auto_20055 ) ( not ( = ?auto_20054 ?auto_20061 ) ) ( not ( = ?auto_20055 ?auto_20061 ) ) ( not ( = ?auto_20056 ?auto_20061 ) ) ( TRUCK-AT ?auto_20059 ?auto_20058 ) )
    :subtasks
    ( ( !DRIVE ?auto_20059 ?auto_20058 ?auto_20062 )
      ( MAKE-2CRATE ?auto_20056 ?auto_20054 ?auto_20055 )
      ( MAKE-1CRATE-VERIFY ?auto_20054 ?auto_20055 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20063 - SURFACE
      ?auto_20064 - SURFACE
      ?auto_20065 - SURFACE
    )
    :vars
    (
      ?auto_20071 - HOIST
      ?auto_20069 - PLACE
      ?auto_20068 - PLACE
      ?auto_20070 - HOIST
      ?auto_20067 - SURFACE
      ?auto_20066 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20071 ?auto_20069 ) ( SURFACE-AT ?auto_20064 ?auto_20069 ) ( CLEAR ?auto_20064 ) ( IS-CRATE ?auto_20065 ) ( not ( = ?auto_20064 ?auto_20065 ) ) ( AVAILABLE ?auto_20071 ) ( ON ?auto_20064 ?auto_20063 ) ( not ( = ?auto_20063 ?auto_20064 ) ) ( not ( = ?auto_20063 ?auto_20065 ) ) ( not ( = ?auto_20068 ?auto_20069 ) ) ( HOIST-AT ?auto_20070 ?auto_20068 ) ( not ( = ?auto_20071 ?auto_20070 ) ) ( AVAILABLE ?auto_20070 ) ( SURFACE-AT ?auto_20065 ?auto_20068 ) ( ON ?auto_20065 ?auto_20067 ) ( CLEAR ?auto_20065 ) ( not ( = ?auto_20064 ?auto_20067 ) ) ( not ( = ?auto_20065 ?auto_20067 ) ) ( not ( = ?auto_20063 ?auto_20067 ) ) ( TRUCK-AT ?auto_20066 ?auto_20069 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20064 ?auto_20065 )
      ( MAKE-2CRATE-VERIFY ?auto_20063 ?auto_20064 ?auto_20065 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20072 - SURFACE
      ?auto_20073 - SURFACE
      ?auto_20074 - SURFACE
      ?auto_20075 - SURFACE
    )
    :vars
    (
      ?auto_20081 - HOIST
      ?auto_20080 - PLACE
      ?auto_20079 - PLACE
      ?auto_20076 - HOIST
      ?auto_20077 - SURFACE
      ?auto_20078 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20081 ?auto_20080 ) ( SURFACE-AT ?auto_20074 ?auto_20080 ) ( CLEAR ?auto_20074 ) ( IS-CRATE ?auto_20075 ) ( not ( = ?auto_20074 ?auto_20075 ) ) ( AVAILABLE ?auto_20081 ) ( ON ?auto_20074 ?auto_20073 ) ( not ( = ?auto_20073 ?auto_20074 ) ) ( not ( = ?auto_20073 ?auto_20075 ) ) ( not ( = ?auto_20079 ?auto_20080 ) ) ( HOIST-AT ?auto_20076 ?auto_20079 ) ( not ( = ?auto_20081 ?auto_20076 ) ) ( AVAILABLE ?auto_20076 ) ( SURFACE-AT ?auto_20075 ?auto_20079 ) ( ON ?auto_20075 ?auto_20077 ) ( CLEAR ?auto_20075 ) ( not ( = ?auto_20074 ?auto_20077 ) ) ( not ( = ?auto_20075 ?auto_20077 ) ) ( not ( = ?auto_20073 ?auto_20077 ) ) ( TRUCK-AT ?auto_20078 ?auto_20080 ) ( ON ?auto_20073 ?auto_20072 ) ( not ( = ?auto_20072 ?auto_20073 ) ) ( not ( = ?auto_20072 ?auto_20074 ) ) ( not ( = ?auto_20072 ?auto_20075 ) ) ( not ( = ?auto_20072 ?auto_20077 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20073 ?auto_20074 ?auto_20075 )
      ( MAKE-3CRATE-VERIFY ?auto_20072 ?auto_20073 ?auto_20074 ?auto_20075 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20082 - SURFACE
      ?auto_20083 - SURFACE
    )
    :vars
    (
      ?auto_20090 - HOIST
      ?auto_20089 - PLACE
      ?auto_20087 - SURFACE
      ?auto_20088 - PLACE
      ?auto_20084 - HOIST
      ?auto_20085 - SURFACE
      ?auto_20086 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20090 ?auto_20089 ) ( IS-CRATE ?auto_20083 ) ( not ( = ?auto_20082 ?auto_20083 ) ) ( not ( = ?auto_20087 ?auto_20082 ) ) ( not ( = ?auto_20087 ?auto_20083 ) ) ( not ( = ?auto_20088 ?auto_20089 ) ) ( HOIST-AT ?auto_20084 ?auto_20088 ) ( not ( = ?auto_20090 ?auto_20084 ) ) ( AVAILABLE ?auto_20084 ) ( SURFACE-AT ?auto_20083 ?auto_20088 ) ( ON ?auto_20083 ?auto_20085 ) ( CLEAR ?auto_20083 ) ( not ( = ?auto_20082 ?auto_20085 ) ) ( not ( = ?auto_20083 ?auto_20085 ) ) ( not ( = ?auto_20087 ?auto_20085 ) ) ( TRUCK-AT ?auto_20086 ?auto_20089 ) ( SURFACE-AT ?auto_20087 ?auto_20089 ) ( CLEAR ?auto_20087 ) ( LIFTING ?auto_20090 ?auto_20082 ) ( IS-CRATE ?auto_20082 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20087 ?auto_20082 )
      ( MAKE-2CRATE ?auto_20087 ?auto_20082 ?auto_20083 )
      ( MAKE-1CRATE-VERIFY ?auto_20082 ?auto_20083 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20091 - SURFACE
      ?auto_20092 - SURFACE
      ?auto_20093 - SURFACE
    )
    :vars
    (
      ?auto_20095 - HOIST
      ?auto_20099 - PLACE
      ?auto_20094 - PLACE
      ?auto_20097 - HOIST
      ?auto_20098 - SURFACE
      ?auto_20096 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20095 ?auto_20099 ) ( IS-CRATE ?auto_20093 ) ( not ( = ?auto_20092 ?auto_20093 ) ) ( not ( = ?auto_20091 ?auto_20092 ) ) ( not ( = ?auto_20091 ?auto_20093 ) ) ( not ( = ?auto_20094 ?auto_20099 ) ) ( HOIST-AT ?auto_20097 ?auto_20094 ) ( not ( = ?auto_20095 ?auto_20097 ) ) ( AVAILABLE ?auto_20097 ) ( SURFACE-AT ?auto_20093 ?auto_20094 ) ( ON ?auto_20093 ?auto_20098 ) ( CLEAR ?auto_20093 ) ( not ( = ?auto_20092 ?auto_20098 ) ) ( not ( = ?auto_20093 ?auto_20098 ) ) ( not ( = ?auto_20091 ?auto_20098 ) ) ( TRUCK-AT ?auto_20096 ?auto_20099 ) ( SURFACE-AT ?auto_20091 ?auto_20099 ) ( CLEAR ?auto_20091 ) ( LIFTING ?auto_20095 ?auto_20092 ) ( IS-CRATE ?auto_20092 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20092 ?auto_20093 )
      ( MAKE-2CRATE-VERIFY ?auto_20091 ?auto_20092 ?auto_20093 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20100 - SURFACE
      ?auto_20101 - SURFACE
      ?auto_20102 - SURFACE
      ?auto_20103 - SURFACE
    )
    :vars
    (
      ?auto_20109 - HOIST
      ?auto_20104 - PLACE
      ?auto_20105 - PLACE
      ?auto_20108 - HOIST
      ?auto_20107 - SURFACE
      ?auto_20106 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20109 ?auto_20104 ) ( IS-CRATE ?auto_20103 ) ( not ( = ?auto_20102 ?auto_20103 ) ) ( not ( = ?auto_20101 ?auto_20102 ) ) ( not ( = ?auto_20101 ?auto_20103 ) ) ( not ( = ?auto_20105 ?auto_20104 ) ) ( HOIST-AT ?auto_20108 ?auto_20105 ) ( not ( = ?auto_20109 ?auto_20108 ) ) ( AVAILABLE ?auto_20108 ) ( SURFACE-AT ?auto_20103 ?auto_20105 ) ( ON ?auto_20103 ?auto_20107 ) ( CLEAR ?auto_20103 ) ( not ( = ?auto_20102 ?auto_20107 ) ) ( not ( = ?auto_20103 ?auto_20107 ) ) ( not ( = ?auto_20101 ?auto_20107 ) ) ( TRUCK-AT ?auto_20106 ?auto_20104 ) ( SURFACE-AT ?auto_20101 ?auto_20104 ) ( CLEAR ?auto_20101 ) ( LIFTING ?auto_20109 ?auto_20102 ) ( IS-CRATE ?auto_20102 ) ( ON ?auto_20101 ?auto_20100 ) ( not ( = ?auto_20100 ?auto_20101 ) ) ( not ( = ?auto_20100 ?auto_20102 ) ) ( not ( = ?auto_20100 ?auto_20103 ) ) ( not ( = ?auto_20100 ?auto_20107 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20101 ?auto_20102 ?auto_20103 )
      ( MAKE-3CRATE-VERIFY ?auto_20100 ?auto_20101 ?auto_20102 ?auto_20103 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20110 - SURFACE
      ?auto_20111 - SURFACE
    )
    :vars
    (
      ?auto_20118 - HOIST
      ?auto_20112 - PLACE
      ?auto_20113 - SURFACE
      ?auto_20114 - PLACE
      ?auto_20117 - HOIST
      ?auto_20116 - SURFACE
      ?auto_20115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20118 ?auto_20112 ) ( IS-CRATE ?auto_20111 ) ( not ( = ?auto_20110 ?auto_20111 ) ) ( not ( = ?auto_20113 ?auto_20110 ) ) ( not ( = ?auto_20113 ?auto_20111 ) ) ( not ( = ?auto_20114 ?auto_20112 ) ) ( HOIST-AT ?auto_20117 ?auto_20114 ) ( not ( = ?auto_20118 ?auto_20117 ) ) ( AVAILABLE ?auto_20117 ) ( SURFACE-AT ?auto_20111 ?auto_20114 ) ( ON ?auto_20111 ?auto_20116 ) ( CLEAR ?auto_20111 ) ( not ( = ?auto_20110 ?auto_20116 ) ) ( not ( = ?auto_20111 ?auto_20116 ) ) ( not ( = ?auto_20113 ?auto_20116 ) ) ( TRUCK-AT ?auto_20115 ?auto_20112 ) ( SURFACE-AT ?auto_20113 ?auto_20112 ) ( CLEAR ?auto_20113 ) ( IS-CRATE ?auto_20110 ) ( AVAILABLE ?auto_20118 ) ( IN ?auto_20110 ?auto_20115 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20118 ?auto_20110 ?auto_20115 ?auto_20112 )
      ( MAKE-2CRATE ?auto_20113 ?auto_20110 ?auto_20111 )
      ( MAKE-1CRATE-VERIFY ?auto_20110 ?auto_20111 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20119 - SURFACE
      ?auto_20120 - SURFACE
      ?auto_20121 - SURFACE
    )
    :vars
    (
      ?auto_20126 - HOIST
      ?auto_20127 - PLACE
      ?auto_20125 - PLACE
      ?auto_20124 - HOIST
      ?auto_20122 - SURFACE
      ?auto_20123 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20126 ?auto_20127 ) ( IS-CRATE ?auto_20121 ) ( not ( = ?auto_20120 ?auto_20121 ) ) ( not ( = ?auto_20119 ?auto_20120 ) ) ( not ( = ?auto_20119 ?auto_20121 ) ) ( not ( = ?auto_20125 ?auto_20127 ) ) ( HOIST-AT ?auto_20124 ?auto_20125 ) ( not ( = ?auto_20126 ?auto_20124 ) ) ( AVAILABLE ?auto_20124 ) ( SURFACE-AT ?auto_20121 ?auto_20125 ) ( ON ?auto_20121 ?auto_20122 ) ( CLEAR ?auto_20121 ) ( not ( = ?auto_20120 ?auto_20122 ) ) ( not ( = ?auto_20121 ?auto_20122 ) ) ( not ( = ?auto_20119 ?auto_20122 ) ) ( TRUCK-AT ?auto_20123 ?auto_20127 ) ( SURFACE-AT ?auto_20119 ?auto_20127 ) ( CLEAR ?auto_20119 ) ( IS-CRATE ?auto_20120 ) ( AVAILABLE ?auto_20126 ) ( IN ?auto_20120 ?auto_20123 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20120 ?auto_20121 )
      ( MAKE-2CRATE-VERIFY ?auto_20119 ?auto_20120 ?auto_20121 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20128 - SURFACE
      ?auto_20129 - SURFACE
      ?auto_20130 - SURFACE
      ?auto_20131 - SURFACE
    )
    :vars
    (
      ?auto_20137 - HOIST
      ?auto_20133 - PLACE
      ?auto_20134 - PLACE
      ?auto_20132 - HOIST
      ?auto_20135 - SURFACE
      ?auto_20136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20137 ?auto_20133 ) ( IS-CRATE ?auto_20131 ) ( not ( = ?auto_20130 ?auto_20131 ) ) ( not ( = ?auto_20129 ?auto_20130 ) ) ( not ( = ?auto_20129 ?auto_20131 ) ) ( not ( = ?auto_20134 ?auto_20133 ) ) ( HOIST-AT ?auto_20132 ?auto_20134 ) ( not ( = ?auto_20137 ?auto_20132 ) ) ( AVAILABLE ?auto_20132 ) ( SURFACE-AT ?auto_20131 ?auto_20134 ) ( ON ?auto_20131 ?auto_20135 ) ( CLEAR ?auto_20131 ) ( not ( = ?auto_20130 ?auto_20135 ) ) ( not ( = ?auto_20131 ?auto_20135 ) ) ( not ( = ?auto_20129 ?auto_20135 ) ) ( TRUCK-AT ?auto_20136 ?auto_20133 ) ( SURFACE-AT ?auto_20129 ?auto_20133 ) ( CLEAR ?auto_20129 ) ( IS-CRATE ?auto_20130 ) ( AVAILABLE ?auto_20137 ) ( IN ?auto_20130 ?auto_20136 ) ( ON ?auto_20129 ?auto_20128 ) ( not ( = ?auto_20128 ?auto_20129 ) ) ( not ( = ?auto_20128 ?auto_20130 ) ) ( not ( = ?auto_20128 ?auto_20131 ) ) ( not ( = ?auto_20128 ?auto_20135 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20129 ?auto_20130 ?auto_20131 )
      ( MAKE-3CRATE-VERIFY ?auto_20128 ?auto_20129 ?auto_20130 ?auto_20131 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20138 - SURFACE
      ?auto_20139 - SURFACE
    )
    :vars
    (
      ?auto_20146 - HOIST
      ?auto_20141 - PLACE
      ?auto_20144 - SURFACE
      ?auto_20142 - PLACE
      ?auto_20140 - HOIST
      ?auto_20143 - SURFACE
      ?auto_20145 - TRUCK
      ?auto_20147 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20146 ?auto_20141 ) ( IS-CRATE ?auto_20139 ) ( not ( = ?auto_20138 ?auto_20139 ) ) ( not ( = ?auto_20144 ?auto_20138 ) ) ( not ( = ?auto_20144 ?auto_20139 ) ) ( not ( = ?auto_20142 ?auto_20141 ) ) ( HOIST-AT ?auto_20140 ?auto_20142 ) ( not ( = ?auto_20146 ?auto_20140 ) ) ( AVAILABLE ?auto_20140 ) ( SURFACE-AT ?auto_20139 ?auto_20142 ) ( ON ?auto_20139 ?auto_20143 ) ( CLEAR ?auto_20139 ) ( not ( = ?auto_20138 ?auto_20143 ) ) ( not ( = ?auto_20139 ?auto_20143 ) ) ( not ( = ?auto_20144 ?auto_20143 ) ) ( SURFACE-AT ?auto_20144 ?auto_20141 ) ( CLEAR ?auto_20144 ) ( IS-CRATE ?auto_20138 ) ( AVAILABLE ?auto_20146 ) ( IN ?auto_20138 ?auto_20145 ) ( TRUCK-AT ?auto_20145 ?auto_20147 ) ( not ( = ?auto_20147 ?auto_20141 ) ) ( not ( = ?auto_20142 ?auto_20147 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20145 ?auto_20147 ?auto_20141 )
      ( MAKE-2CRATE ?auto_20144 ?auto_20138 ?auto_20139 )
      ( MAKE-1CRATE-VERIFY ?auto_20138 ?auto_20139 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20148 - SURFACE
      ?auto_20149 - SURFACE
      ?auto_20150 - SURFACE
    )
    :vars
    (
      ?auto_20151 - HOIST
      ?auto_20155 - PLACE
      ?auto_20157 - PLACE
      ?auto_20153 - HOIST
      ?auto_20156 - SURFACE
      ?auto_20152 - TRUCK
      ?auto_20154 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20151 ?auto_20155 ) ( IS-CRATE ?auto_20150 ) ( not ( = ?auto_20149 ?auto_20150 ) ) ( not ( = ?auto_20148 ?auto_20149 ) ) ( not ( = ?auto_20148 ?auto_20150 ) ) ( not ( = ?auto_20157 ?auto_20155 ) ) ( HOIST-AT ?auto_20153 ?auto_20157 ) ( not ( = ?auto_20151 ?auto_20153 ) ) ( AVAILABLE ?auto_20153 ) ( SURFACE-AT ?auto_20150 ?auto_20157 ) ( ON ?auto_20150 ?auto_20156 ) ( CLEAR ?auto_20150 ) ( not ( = ?auto_20149 ?auto_20156 ) ) ( not ( = ?auto_20150 ?auto_20156 ) ) ( not ( = ?auto_20148 ?auto_20156 ) ) ( SURFACE-AT ?auto_20148 ?auto_20155 ) ( CLEAR ?auto_20148 ) ( IS-CRATE ?auto_20149 ) ( AVAILABLE ?auto_20151 ) ( IN ?auto_20149 ?auto_20152 ) ( TRUCK-AT ?auto_20152 ?auto_20154 ) ( not ( = ?auto_20154 ?auto_20155 ) ) ( not ( = ?auto_20157 ?auto_20154 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20149 ?auto_20150 )
      ( MAKE-2CRATE-VERIFY ?auto_20148 ?auto_20149 ?auto_20150 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20158 - SURFACE
      ?auto_20159 - SURFACE
      ?auto_20160 - SURFACE
      ?auto_20161 - SURFACE
    )
    :vars
    (
      ?auto_20168 - HOIST
      ?auto_20163 - PLACE
      ?auto_20166 - PLACE
      ?auto_20162 - HOIST
      ?auto_20167 - SURFACE
      ?auto_20165 - TRUCK
      ?auto_20164 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20168 ?auto_20163 ) ( IS-CRATE ?auto_20161 ) ( not ( = ?auto_20160 ?auto_20161 ) ) ( not ( = ?auto_20159 ?auto_20160 ) ) ( not ( = ?auto_20159 ?auto_20161 ) ) ( not ( = ?auto_20166 ?auto_20163 ) ) ( HOIST-AT ?auto_20162 ?auto_20166 ) ( not ( = ?auto_20168 ?auto_20162 ) ) ( AVAILABLE ?auto_20162 ) ( SURFACE-AT ?auto_20161 ?auto_20166 ) ( ON ?auto_20161 ?auto_20167 ) ( CLEAR ?auto_20161 ) ( not ( = ?auto_20160 ?auto_20167 ) ) ( not ( = ?auto_20161 ?auto_20167 ) ) ( not ( = ?auto_20159 ?auto_20167 ) ) ( SURFACE-AT ?auto_20159 ?auto_20163 ) ( CLEAR ?auto_20159 ) ( IS-CRATE ?auto_20160 ) ( AVAILABLE ?auto_20168 ) ( IN ?auto_20160 ?auto_20165 ) ( TRUCK-AT ?auto_20165 ?auto_20164 ) ( not ( = ?auto_20164 ?auto_20163 ) ) ( not ( = ?auto_20166 ?auto_20164 ) ) ( ON ?auto_20159 ?auto_20158 ) ( not ( = ?auto_20158 ?auto_20159 ) ) ( not ( = ?auto_20158 ?auto_20160 ) ) ( not ( = ?auto_20158 ?auto_20161 ) ) ( not ( = ?auto_20158 ?auto_20167 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20159 ?auto_20160 ?auto_20161 )
      ( MAKE-3CRATE-VERIFY ?auto_20158 ?auto_20159 ?auto_20160 ?auto_20161 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20169 - SURFACE
      ?auto_20170 - SURFACE
    )
    :vars
    (
      ?auto_20178 - HOIST
      ?auto_20173 - PLACE
      ?auto_20171 - SURFACE
      ?auto_20176 - PLACE
      ?auto_20172 - HOIST
      ?auto_20177 - SURFACE
      ?auto_20175 - TRUCK
      ?auto_20174 - PLACE
      ?auto_20179 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20178 ?auto_20173 ) ( IS-CRATE ?auto_20170 ) ( not ( = ?auto_20169 ?auto_20170 ) ) ( not ( = ?auto_20171 ?auto_20169 ) ) ( not ( = ?auto_20171 ?auto_20170 ) ) ( not ( = ?auto_20176 ?auto_20173 ) ) ( HOIST-AT ?auto_20172 ?auto_20176 ) ( not ( = ?auto_20178 ?auto_20172 ) ) ( AVAILABLE ?auto_20172 ) ( SURFACE-AT ?auto_20170 ?auto_20176 ) ( ON ?auto_20170 ?auto_20177 ) ( CLEAR ?auto_20170 ) ( not ( = ?auto_20169 ?auto_20177 ) ) ( not ( = ?auto_20170 ?auto_20177 ) ) ( not ( = ?auto_20171 ?auto_20177 ) ) ( SURFACE-AT ?auto_20171 ?auto_20173 ) ( CLEAR ?auto_20171 ) ( IS-CRATE ?auto_20169 ) ( AVAILABLE ?auto_20178 ) ( TRUCK-AT ?auto_20175 ?auto_20174 ) ( not ( = ?auto_20174 ?auto_20173 ) ) ( not ( = ?auto_20176 ?auto_20174 ) ) ( HOIST-AT ?auto_20179 ?auto_20174 ) ( LIFTING ?auto_20179 ?auto_20169 ) ( not ( = ?auto_20178 ?auto_20179 ) ) ( not ( = ?auto_20172 ?auto_20179 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20179 ?auto_20169 ?auto_20175 ?auto_20174 )
      ( MAKE-2CRATE ?auto_20171 ?auto_20169 ?auto_20170 )
      ( MAKE-1CRATE-VERIFY ?auto_20169 ?auto_20170 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20180 - SURFACE
      ?auto_20181 - SURFACE
      ?auto_20182 - SURFACE
    )
    :vars
    (
      ?auto_20187 - HOIST
      ?auto_20185 - PLACE
      ?auto_20189 - PLACE
      ?auto_20188 - HOIST
      ?auto_20184 - SURFACE
      ?auto_20186 - TRUCK
      ?auto_20183 - PLACE
      ?auto_20190 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20187 ?auto_20185 ) ( IS-CRATE ?auto_20182 ) ( not ( = ?auto_20181 ?auto_20182 ) ) ( not ( = ?auto_20180 ?auto_20181 ) ) ( not ( = ?auto_20180 ?auto_20182 ) ) ( not ( = ?auto_20189 ?auto_20185 ) ) ( HOIST-AT ?auto_20188 ?auto_20189 ) ( not ( = ?auto_20187 ?auto_20188 ) ) ( AVAILABLE ?auto_20188 ) ( SURFACE-AT ?auto_20182 ?auto_20189 ) ( ON ?auto_20182 ?auto_20184 ) ( CLEAR ?auto_20182 ) ( not ( = ?auto_20181 ?auto_20184 ) ) ( not ( = ?auto_20182 ?auto_20184 ) ) ( not ( = ?auto_20180 ?auto_20184 ) ) ( SURFACE-AT ?auto_20180 ?auto_20185 ) ( CLEAR ?auto_20180 ) ( IS-CRATE ?auto_20181 ) ( AVAILABLE ?auto_20187 ) ( TRUCK-AT ?auto_20186 ?auto_20183 ) ( not ( = ?auto_20183 ?auto_20185 ) ) ( not ( = ?auto_20189 ?auto_20183 ) ) ( HOIST-AT ?auto_20190 ?auto_20183 ) ( LIFTING ?auto_20190 ?auto_20181 ) ( not ( = ?auto_20187 ?auto_20190 ) ) ( not ( = ?auto_20188 ?auto_20190 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20181 ?auto_20182 )
      ( MAKE-2CRATE-VERIFY ?auto_20180 ?auto_20181 ?auto_20182 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20191 - SURFACE
      ?auto_20192 - SURFACE
      ?auto_20193 - SURFACE
      ?auto_20194 - SURFACE
    )
    :vars
    (
      ?auto_20195 - HOIST
      ?auto_20202 - PLACE
      ?auto_20201 - PLACE
      ?auto_20196 - HOIST
      ?auto_20197 - SURFACE
      ?auto_20200 - TRUCK
      ?auto_20199 - PLACE
      ?auto_20198 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20195 ?auto_20202 ) ( IS-CRATE ?auto_20194 ) ( not ( = ?auto_20193 ?auto_20194 ) ) ( not ( = ?auto_20192 ?auto_20193 ) ) ( not ( = ?auto_20192 ?auto_20194 ) ) ( not ( = ?auto_20201 ?auto_20202 ) ) ( HOIST-AT ?auto_20196 ?auto_20201 ) ( not ( = ?auto_20195 ?auto_20196 ) ) ( AVAILABLE ?auto_20196 ) ( SURFACE-AT ?auto_20194 ?auto_20201 ) ( ON ?auto_20194 ?auto_20197 ) ( CLEAR ?auto_20194 ) ( not ( = ?auto_20193 ?auto_20197 ) ) ( not ( = ?auto_20194 ?auto_20197 ) ) ( not ( = ?auto_20192 ?auto_20197 ) ) ( SURFACE-AT ?auto_20192 ?auto_20202 ) ( CLEAR ?auto_20192 ) ( IS-CRATE ?auto_20193 ) ( AVAILABLE ?auto_20195 ) ( TRUCK-AT ?auto_20200 ?auto_20199 ) ( not ( = ?auto_20199 ?auto_20202 ) ) ( not ( = ?auto_20201 ?auto_20199 ) ) ( HOIST-AT ?auto_20198 ?auto_20199 ) ( LIFTING ?auto_20198 ?auto_20193 ) ( not ( = ?auto_20195 ?auto_20198 ) ) ( not ( = ?auto_20196 ?auto_20198 ) ) ( ON ?auto_20192 ?auto_20191 ) ( not ( = ?auto_20191 ?auto_20192 ) ) ( not ( = ?auto_20191 ?auto_20193 ) ) ( not ( = ?auto_20191 ?auto_20194 ) ) ( not ( = ?auto_20191 ?auto_20197 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20192 ?auto_20193 ?auto_20194 )
      ( MAKE-3CRATE-VERIFY ?auto_20191 ?auto_20192 ?auto_20193 ?auto_20194 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20203 - SURFACE
      ?auto_20204 - SURFACE
    )
    :vars
    (
      ?auto_20205 - HOIST
      ?auto_20212 - PLACE
      ?auto_20213 - SURFACE
      ?auto_20211 - PLACE
      ?auto_20206 - HOIST
      ?auto_20207 - SURFACE
      ?auto_20210 - TRUCK
      ?auto_20209 - PLACE
      ?auto_20208 - HOIST
      ?auto_20214 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20205 ?auto_20212 ) ( IS-CRATE ?auto_20204 ) ( not ( = ?auto_20203 ?auto_20204 ) ) ( not ( = ?auto_20213 ?auto_20203 ) ) ( not ( = ?auto_20213 ?auto_20204 ) ) ( not ( = ?auto_20211 ?auto_20212 ) ) ( HOIST-AT ?auto_20206 ?auto_20211 ) ( not ( = ?auto_20205 ?auto_20206 ) ) ( AVAILABLE ?auto_20206 ) ( SURFACE-AT ?auto_20204 ?auto_20211 ) ( ON ?auto_20204 ?auto_20207 ) ( CLEAR ?auto_20204 ) ( not ( = ?auto_20203 ?auto_20207 ) ) ( not ( = ?auto_20204 ?auto_20207 ) ) ( not ( = ?auto_20213 ?auto_20207 ) ) ( SURFACE-AT ?auto_20213 ?auto_20212 ) ( CLEAR ?auto_20213 ) ( IS-CRATE ?auto_20203 ) ( AVAILABLE ?auto_20205 ) ( TRUCK-AT ?auto_20210 ?auto_20209 ) ( not ( = ?auto_20209 ?auto_20212 ) ) ( not ( = ?auto_20211 ?auto_20209 ) ) ( HOIST-AT ?auto_20208 ?auto_20209 ) ( not ( = ?auto_20205 ?auto_20208 ) ) ( not ( = ?auto_20206 ?auto_20208 ) ) ( AVAILABLE ?auto_20208 ) ( SURFACE-AT ?auto_20203 ?auto_20209 ) ( ON ?auto_20203 ?auto_20214 ) ( CLEAR ?auto_20203 ) ( not ( = ?auto_20203 ?auto_20214 ) ) ( not ( = ?auto_20204 ?auto_20214 ) ) ( not ( = ?auto_20213 ?auto_20214 ) ) ( not ( = ?auto_20207 ?auto_20214 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20208 ?auto_20203 ?auto_20214 ?auto_20209 )
      ( MAKE-2CRATE ?auto_20213 ?auto_20203 ?auto_20204 )
      ( MAKE-1CRATE-VERIFY ?auto_20203 ?auto_20204 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20215 - SURFACE
      ?auto_20216 - SURFACE
      ?auto_20217 - SURFACE
    )
    :vars
    (
      ?auto_20221 - HOIST
      ?auto_20222 - PLACE
      ?auto_20218 - PLACE
      ?auto_20224 - HOIST
      ?auto_20225 - SURFACE
      ?auto_20226 - TRUCK
      ?auto_20223 - PLACE
      ?auto_20219 - HOIST
      ?auto_20220 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20221 ?auto_20222 ) ( IS-CRATE ?auto_20217 ) ( not ( = ?auto_20216 ?auto_20217 ) ) ( not ( = ?auto_20215 ?auto_20216 ) ) ( not ( = ?auto_20215 ?auto_20217 ) ) ( not ( = ?auto_20218 ?auto_20222 ) ) ( HOIST-AT ?auto_20224 ?auto_20218 ) ( not ( = ?auto_20221 ?auto_20224 ) ) ( AVAILABLE ?auto_20224 ) ( SURFACE-AT ?auto_20217 ?auto_20218 ) ( ON ?auto_20217 ?auto_20225 ) ( CLEAR ?auto_20217 ) ( not ( = ?auto_20216 ?auto_20225 ) ) ( not ( = ?auto_20217 ?auto_20225 ) ) ( not ( = ?auto_20215 ?auto_20225 ) ) ( SURFACE-AT ?auto_20215 ?auto_20222 ) ( CLEAR ?auto_20215 ) ( IS-CRATE ?auto_20216 ) ( AVAILABLE ?auto_20221 ) ( TRUCK-AT ?auto_20226 ?auto_20223 ) ( not ( = ?auto_20223 ?auto_20222 ) ) ( not ( = ?auto_20218 ?auto_20223 ) ) ( HOIST-AT ?auto_20219 ?auto_20223 ) ( not ( = ?auto_20221 ?auto_20219 ) ) ( not ( = ?auto_20224 ?auto_20219 ) ) ( AVAILABLE ?auto_20219 ) ( SURFACE-AT ?auto_20216 ?auto_20223 ) ( ON ?auto_20216 ?auto_20220 ) ( CLEAR ?auto_20216 ) ( not ( = ?auto_20216 ?auto_20220 ) ) ( not ( = ?auto_20217 ?auto_20220 ) ) ( not ( = ?auto_20215 ?auto_20220 ) ) ( not ( = ?auto_20225 ?auto_20220 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20216 ?auto_20217 )
      ( MAKE-2CRATE-VERIFY ?auto_20215 ?auto_20216 ?auto_20217 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20227 - SURFACE
      ?auto_20228 - SURFACE
      ?auto_20229 - SURFACE
      ?auto_20230 - SURFACE
    )
    :vars
    (
      ?auto_20234 - HOIST
      ?auto_20237 - PLACE
      ?auto_20235 - PLACE
      ?auto_20236 - HOIST
      ?auto_20231 - SURFACE
      ?auto_20239 - TRUCK
      ?auto_20233 - PLACE
      ?auto_20238 - HOIST
      ?auto_20232 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20234 ?auto_20237 ) ( IS-CRATE ?auto_20230 ) ( not ( = ?auto_20229 ?auto_20230 ) ) ( not ( = ?auto_20228 ?auto_20229 ) ) ( not ( = ?auto_20228 ?auto_20230 ) ) ( not ( = ?auto_20235 ?auto_20237 ) ) ( HOIST-AT ?auto_20236 ?auto_20235 ) ( not ( = ?auto_20234 ?auto_20236 ) ) ( AVAILABLE ?auto_20236 ) ( SURFACE-AT ?auto_20230 ?auto_20235 ) ( ON ?auto_20230 ?auto_20231 ) ( CLEAR ?auto_20230 ) ( not ( = ?auto_20229 ?auto_20231 ) ) ( not ( = ?auto_20230 ?auto_20231 ) ) ( not ( = ?auto_20228 ?auto_20231 ) ) ( SURFACE-AT ?auto_20228 ?auto_20237 ) ( CLEAR ?auto_20228 ) ( IS-CRATE ?auto_20229 ) ( AVAILABLE ?auto_20234 ) ( TRUCK-AT ?auto_20239 ?auto_20233 ) ( not ( = ?auto_20233 ?auto_20237 ) ) ( not ( = ?auto_20235 ?auto_20233 ) ) ( HOIST-AT ?auto_20238 ?auto_20233 ) ( not ( = ?auto_20234 ?auto_20238 ) ) ( not ( = ?auto_20236 ?auto_20238 ) ) ( AVAILABLE ?auto_20238 ) ( SURFACE-AT ?auto_20229 ?auto_20233 ) ( ON ?auto_20229 ?auto_20232 ) ( CLEAR ?auto_20229 ) ( not ( = ?auto_20229 ?auto_20232 ) ) ( not ( = ?auto_20230 ?auto_20232 ) ) ( not ( = ?auto_20228 ?auto_20232 ) ) ( not ( = ?auto_20231 ?auto_20232 ) ) ( ON ?auto_20228 ?auto_20227 ) ( not ( = ?auto_20227 ?auto_20228 ) ) ( not ( = ?auto_20227 ?auto_20229 ) ) ( not ( = ?auto_20227 ?auto_20230 ) ) ( not ( = ?auto_20227 ?auto_20231 ) ) ( not ( = ?auto_20227 ?auto_20232 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20228 ?auto_20229 ?auto_20230 )
      ( MAKE-3CRATE-VERIFY ?auto_20227 ?auto_20228 ?auto_20229 ?auto_20230 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20240 - SURFACE
      ?auto_20241 - SURFACE
    )
    :vars
    (
      ?auto_20245 - HOIST
      ?auto_20248 - PLACE
      ?auto_20251 - SURFACE
      ?auto_20246 - PLACE
      ?auto_20247 - HOIST
      ?auto_20242 - SURFACE
      ?auto_20244 - PLACE
      ?auto_20249 - HOIST
      ?auto_20243 - SURFACE
      ?auto_20250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20245 ?auto_20248 ) ( IS-CRATE ?auto_20241 ) ( not ( = ?auto_20240 ?auto_20241 ) ) ( not ( = ?auto_20251 ?auto_20240 ) ) ( not ( = ?auto_20251 ?auto_20241 ) ) ( not ( = ?auto_20246 ?auto_20248 ) ) ( HOIST-AT ?auto_20247 ?auto_20246 ) ( not ( = ?auto_20245 ?auto_20247 ) ) ( AVAILABLE ?auto_20247 ) ( SURFACE-AT ?auto_20241 ?auto_20246 ) ( ON ?auto_20241 ?auto_20242 ) ( CLEAR ?auto_20241 ) ( not ( = ?auto_20240 ?auto_20242 ) ) ( not ( = ?auto_20241 ?auto_20242 ) ) ( not ( = ?auto_20251 ?auto_20242 ) ) ( SURFACE-AT ?auto_20251 ?auto_20248 ) ( CLEAR ?auto_20251 ) ( IS-CRATE ?auto_20240 ) ( AVAILABLE ?auto_20245 ) ( not ( = ?auto_20244 ?auto_20248 ) ) ( not ( = ?auto_20246 ?auto_20244 ) ) ( HOIST-AT ?auto_20249 ?auto_20244 ) ( not ( = ?auto_20245 ?auto_20249 ) ) ( not ( = ?auto_20247 ?auto_20249 ) ) ( AVAILABLE ?auto_20249 ) ( SURFACE-AT ?auto_20240 ?auto_20244 ) ( ON ?auto_20240 ?auto_20243 ) ( CLEAR ?auto_20240 ) ( not ( = ?auto_20240 ?auto_20243 ) ) ( not ( = ?auto_20241 ?auto_20243 ) ) ( not ( = ?auto_20251 ?auto_20243 ) ) ( not ( = ?auto_20242 ?auto_20243 ) ) ( TRUCK-AT ?auto_20250 ?auto_20248 ) )
    :subtasks
    ( ( !DRIVE ?auto_20250 ?auto_20248 ?auto_20244 )
      ( MAKE-2CRATE ?auto_20251 ?auto_20240 ?auto_20241 )
      ( MAKE-1CRATE-VERIFY ?auto_20240 ?auto_20241 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20252 - SURFACE
      ?auto_20253 - SURFACE
      ?auto_20254 - SURFACE
    )
    :vars
    (
      ?auto_20256 - HOIST
      ?auto_20261 - PLACE
      ?auto_20259 - PLACE
      ?auto_20262 - HOIST
      ?auto_20257 - SURFACE
      ?auto_20255 - PLACE
      ?auto_20263 - HOIST
      ?auto_20258 - SURFACE
      ?auto_20260 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20256 ?auto_20261 ) ( IS-CRATE ?auto_20254 ) ( not ( = ?auto_20253 ?auto_20254 ) ) ( not ( = ?auto_20252 ?auto_20253 ) ) ( not ( = ?auto_20252 ?auto_20254 ) ) ( not ( = ?auto_20259 ?auto_20261 ) ) ( HOIST-AT ?auto_20262 ?auto_20259 ) ( not ( = ?auto_20256 ?auto_20262 ) ) ( AVAILABLE ?auto_20262 ) ( SURFACE-AT ?auto_20254 ?auto_20259 ) ( ON ?auto_20254 ?auto_20257 ) ( CLEAR ?auto_20254 ) ( not ( = ?auto_20253 ?auto_20257 ) ) ( not ( = ?auto_20254 ?auto_20257 ) ) ( not ( = ?auto_20252 ?auto_20257 ) ) ( SURFACE-AT ?auto_20252 ?auto_20261 ) ( CLEAR ?auto_20252 ) ( IS-CRATE ?auto_20253 ) ( AVAILABLE ?auto_20256 ) ( not ( = ?auto_20255 ?auto_20261 ) ) ( not ( = ?auto_20259 ?auto_20255 ) ) ( HOIST-AT ?auto_20263 ?auto_20255 ) ( not ( = ?auto_20256 ?auto_20263 ) ) ( not ( = ?auto_20262 ?auto_20263 ) ) ( AVAILABLE ?auto_20263 ) ( SURFACE-AT ?auto_20253 ?auto_20255 ) ( ON ?auto_20253 ?auto_20258 ) ( CLEAR ?auto_20253 ) ( not ( = ?auto_20253 ?auto_20258 ) ) ( not ( = ?auto_20254 ?auto_20258 ) ) ( not ( = ?auto_20252 ?auto_20258 ) ) ( not ( = ?auto_20257 ?auto_20258 ) ) ( TRUCK-AT ?auto_20260 ?auto_20261 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20253 ?auto_20254 )
      ( MAKE-2CRATE-VERIFY ?auto_20252 ?auto_20253 ?auto_20254 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20264 - SURFACE
      ?auto_20265 - SURFACE
      ?auto_20266 - SURFACE
      ?auto_20267 - SURFACE
    )
    :vars
    (
      ?auto_20270 - HOIST
      ?auto_20272 - PLACE
      ?auto_20274 - PLACE
      ?auto_20273 - HOIST
      ?auto_20275 - SURFACE
      ?auto_20268 - PLACE
      ?auto_20271 - HOIST
      ?auto_20276 - SURFACE
      ?auto_20269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20270 ?auto_20272 ) ( IS-CRATE ?auto_20267 ) ( not ( = ?auto_20266 ?auto_20267 ) ) ( not ( = ?auto_20265 ?auto_20266 ) ) ( not ( = ?auto_20265 ?auto_20267 ) ) ( not ( = ?auto_20274 ?auto_20272 ) ) ( HOIST-AT ?auto_20273 ?auto_20274 ) ( not ( = ?auto_20270 ?auto_20273 ) ) ( AVAILABLE ?auto_20273 ) ( SURFACE-AT ?auto_20267 ?auto_20274 ) ( ON ?auto_20267 ?auto_20275 ) ( CLEAR ?auto_20267 ) ( not ( = ?auto_20266 ?auto_20275 ) ) ( not ( = ?auto_20267 ?auto_20275 ) ) ( not ( = ?auto_20265 ?auto_20275 ) ) ( SURFACE-AT ?auto_20265 ?auto_20272 ) ( CLEAR ?auto_20265 ) ( IS-CRATE ?auto_20266 ) ( AVAILABLE ?auto_20270 ) ( not ( = ?auto_20268 ?auto_20272 ) ) ( not ( = ?auto_20274 ?auto_20268 ) ) ( HOIST-AT ?auto_20271 ?auto_20268 ) ( not ( = ?auto_20270 ?auto_20271 ) ) ( not ( = ?auto_20273 ?auto_20271 ) ) ( AVAILABLE ?auto_20271 ) ( SURFACE-AT ?auto_20266 ?auto_20268 ) ( ON ?auto_20266 ?auto_20276 ) ( CLEAR ?auto_20266 ) ( not ( = ?auto_20266 ?auto_20276 ) ) ( not ( = ?auto_20267 ?auto_20276 ) ) ( not ( = ?auto_20265 ?auto_20276 ) ) ( not ( = ?auto_20275 ?auto_20276 ) ) ( TRUCK-AT ?auto_20269 ?auto_20272 ) ( ON ?auto_20265 ?auto_20264 ) ( not ( = ?auto_20264 ?auto_20265 ) ) ( not ( = ?auto_20264 ?auto_20266 ) ) ( not ( = ?auto_20264 ?auto_20267 ) ) ( not ( = ?auto_20264 ?auto_20275 ) ) ( not ( = ?auto_20264 ?auto_20276 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20265 ?auto_20266 ?auto_20267 )
      ( MAKE-3CRATE-VERIFY ?auto_20264 ?auto_20265 ?auto_20266 ?auto_20267 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20277 - SURFACE
      ?auto_20278 - SURFACE
    )
    :vars
    (
      ?auto_20282 - HOIST
      ?auto_20284 - PLACE
      ?auto_20281 - SURFACE
      ?auto_20286 - PLACE
      ?auto_20285 - HOIST
      ?auto_20287 - SURFACE
      ?auto_20279 - PLACE
      ?auto_20283 - HOIST
      ?auto_20288 - SURFACE
      ?auto_20280 - TRUCK
      ?auto_20289 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20282 ?auto_20284 ) ( IS-CRATE ?auto_20278 ) ( not ( = ?auto_20277 ?auto_20278 ) ) ( not ( = ?auto_20281 ?auto_20277 ) ) ( not ( = ?auto_20281 ?auto_20278 ) ) ( not ( = ?auto_20286 ?auto_20284 ) ) ( HOIST-AT ?auto_20285 ?auto_20286 ) ( not ( = ?auto_20282 ?auto_20285 ) ) ( AVAILABLE ?auto_20285 ) ( SURFACE-AT ?auto_20278 ?auto_20286 ) ( ON ?auto_20278 ?auto_20287 ) ( CLEAR ?auto_20278 ) ( not ( = ?auto_20277 ?auto_20287 ) ) ( not ( = ?auto_20278 ?auto_20287 ) ) ( not ( = ?auto_20281 ?auto_20287 ) ) ( IS-CRATE ?auto_20277 ) ( not ( = ?auto_20279 ?auto_20284 ) ) ( not ( = ?auto_20286 ?auto_20279 ) ) ( HOIST-AT ?auto_20283 ?auto_20279 ) ( not ( = ?auto_20282 ?auto_20283 ) ) ( not ( = ?auto_20285 ?auto_20283 ) ) ( AVAILABLE ?auto_20283 ) ( SURFACE-AT ?auto_20277 ?auto_20279 ) ( ON ?auto_20277 ?auto_20288 ) ( CLEAR ?auto_20277 ) ( not ( = ?auto_20277 ?auto_20288 ) ) ( not ( = ?auto_20278 ?auto_20288 ) ) ( not ( = ?auto_20281 ?auto_20288 ) ) ( not ( = ?auto_20287 ?auto_20288 ) ) ( TRUCK-AT ?auto_20280 ?auto_20284 ) ( SURFACE-AT ?auto_20289 ?auto_20284 ) ( CLEAR ?auto_20289 ) ( LIFTING ?auto_20282 ?auto_20281 ) ( IS-CRATE ?auto_20281 ) ( not ( = ?auto_20289 ?auto_20281 ) ) ( not ( = ?auto_20277 ?auto_20289 ) ) ( not ( = ?auto_20278 ?auto_20289 ) ) ( not ( = ?auto_20287 ?auto_20289 ) ) ( not ( = ?auto_20288 ?auto_20289 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20289 ?auto_20281 )
      ( MAKE-2CRATE ?auto_20281 ?auto_20277 ?auto_20278 )
      ( MAKE-1CRATE-VERIFY ?auto_20277 ?auto_20278 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20290 - SURFACE
      ?auto_20291 - SURFACE
      ?auto_20292 - SURFACE
    )
    :vars
    (
      ?auto_20296 - HOIST
      ?auto_20297 - PLACE
      ?auto_20302 - PLACE
      ?auto_20293 - HOIST
      ?auto_20300 - SURFACE
      ?auto_20294 - PLACE
      ?auto_20295 - HOIST
      ?auto_20301 - SURFACE
      ?auto_20299 - TRUCK
      ?auto_20298 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20296 ?auto_20297 ) ( IS-CRATE ?auto_20292 ) ( not ( = ?auto_20291 ?auto_20292 ) ) ( not ( = ?auto_20290 ?auto_20291 ) ) ( not ( = ?auto_20290 ?auto_20292 ) ) ( not ( = ?auto_20302 ?auto_20297 ) ) ( HOIST-AT ?auto_20293 ?auto_20302 ) ( not ( = ?auto_20296 ?auto_20293 ) ) ( AVAILABLE ?auto_20293 ) ( SURFACE-AT ?auto_20292 ?auto_20302 ) ( ON ?auto_20292 ?auto_20300 ) ( CLEAR ?auto_20292 ) ( not ( = ?auto_20291 ?auto_20300 ) ) ( not ( = ?auto_20292 ?auto_20300 ) ) ( not ( = ?auto_20290 ?auto_20300 ) ) ( IS-CRATE ?auto_20291 ) ( not ( = ?auto_20294 ?auto_20297 ) ) ( not ( = ?auto_20302 ?auto_20294 ) ) ( HOIST-AT ?auto_20295 ?auto_20294 ) ( not ( = ?auto_20296 ?auto_20295 ) ) ( not ( = ?auto_20293 ?auto_20295 ) ) ( AVAILABLE ?auto_20295 ) ( SURFACE-AT ?auto_20291 ?auto_20294 ) ( ON ?auto_20291 ?auto_20301 ) ( CLEAR ?auto_20291 ) ( not ( = ?auto_20291 ?auto_20301 ) ) ( not ( = ?auto_20292 ?auto_20301 ) ) ( not ( = ?auto_20290 ?auto_20301 ) ) ( not ( = ?auto_20300 ?auto_20301 ) ) ( TRUCK-AT ?auto_20299 ?auto_20297 ) ( SURFACE-AT ?auto_20298 ?auto_20297 ) ( CLEAR ?auto_20298 ) ( LIFTING ?auto_20296 ?auto_20290 ) ( IS-CRATE ?auto_20290 ) ( not ( = ?auto_20298 ?auto_20290 ) ) ( not ( = ?auto_20291 ?auto_20298 ) ) ( not ( = ?auto_20292 ?auto_20298 ) ) ( not ( = ?auto_20300 ?auto_20298 ) ) ( not ( = ?auto_20301 ?auto_20298 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20291 ?auto_20292 )
      ( MAKE-2CRATE-VERIFY ?auto_20290 ?auto_20291 ?auto_20292 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20303 - SURFACE
      ?auto_20304 - SURFACE
      ?auto_20305 - SURFACE
      ?auto_20306 - SURFACE
    )
    :vars
    (
      ?auto_20314 - HOIST
      ?auto_20308 - PLACE
      ?auto_20309 - PLACE
      ?auto_20313 - HOIST
      ?auto_20310 - SURFACE
      ?auto_20311 - PLACE
      ?auto_20312 - HOIST
      ?auto_20315 - SURFACE
      ?auto_20307 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20314 ?auto_20308 ) ( IS-CRATE ?auto_20306 ) ( not ( = ?auto_20305 ?auto_20306 ) ) ( not ( = ?auto_20304 ?auto_20305 ) ) ( not ( = ?auto_20304 ?auto_20306 ) ) ( not ( = ?auto_20309 ?auto_20308 ) ) ( HOIST-AT ?auto_20313 ?auto_20309 ) ( not ( = ?auto_20314 ?auto_20313 ) ) ( AVAILABLE ?auto_20313 ) ( SURFACE-AT ?auto_20306 ?auto_20309 ) ( ON ?auto_20306 ?auto_20310 ) ( CLEAR ?auto_20306 ) ( not ( = ?auto_20305 ?auto_20310 ) ) ( not ( = ?auto_20306 ?auto_20310 ) ) ( not ( = ?auto_20304 ?auto_20310 ) ) ( IS-CRATE ?auto_20305 ) ( not ( = ?auto_20311 ?auto_20308 ) ) ( not ( = ?auto_20309 ?auto_20311 ) ) ( HOIST-AT ?auto_20312 ?auto_20311 ) ( not ( = ?auto_20314 ?auto_20312 ) ) ( not ( = ?auto_20313 ?auto_20312 ) ) ( AVAILABLE ?auto_20312 ) ( SURFACE-AT ?auto_20305 ?auto_20311 ) ( ON ?auto_20305 ?auto_20315 ) ( CLEAR ?auto_20305 ) ( not ( = ?auto_20305 ?auto_20315 ) ) ( not ( = ?auto_20306 ?auto_20315 ) ) ( not ( = ?auto_20304 ?auto_20315 ) ) ( not ( = ?auto_20310 ?auto_20315 ) ) ( TRUCK-AT ?auto_20307 ?auto_20308 ) ( SURFACE-AT ?auto_20303 ?auto_20308 ) ( CLEAR ?auto_20303 ) ( LIFTING ?auto_20314 ?auto_20304 ) ( IS-CRATE ?auto_20304 ) ( not ( = ?auto_20303 ?auto_20304 ) ) ( not ( = ?auto_20305 ?auto_20303 ) ) ( not ( = ?auto_20306 ?auto_20303 ) ) ( not ( = ?auto_20310 ?auto_20303 ) ) ( not ( = ?auto_20315 ?auto_20303 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20304 ?auto_20305 ?auto_20306 )
      ( MAKE-3CRATE-VERIFY ?auto_20303 ?auto_20304 ?auto_20305 ?auto_20306 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20316 - SURFACE
      ?auto_20317 - SURFACE
    )
    :vars
    (
      ?auto_20325 - HOIST
      ?auto_20319 - PLACE
      ?auto_20328 - SURFACE
      ?auto_20320 - PLACE
      ?auto_20324 - HOIST
      ?auto_20321 - SURFACE
      ?auto_20322 - PLACE
      ?auto_20323 - HOIST
      ?auto_20327 - SURFACE
      ?auto_20318 - TRUCK
      ?auto_20326 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20325 ?auto_20319 ) ( IS-CRATE ?auto_20317 ) ( not ( = ?auto_20316 ?auto_20317 ) ) ( not ( = ?auto_20328 ?auto_20316 ) ) ( not ( = ?auto_20328 ?auto_20317 ) ) ( not ( = ?auto_20320 ?auto_20319 ) ) ( HOIST-AT ?auto_20324 ?auto_20320 ) ( not ( = ?auto_20325 ?auto_20324 ) ) ( AVAILABLE ?auto_20324 ) ( SURFACE-AT ?auto_20317 ?auto_20320 ) ( ON ?auto_20317 ?auto_20321 ) ( CLEAR ?auto_20317 ) ( not ( = ?auto_20316 ?auto_20321 ) ) ( not ( = ?auto_20317 ?auto_20321 ) ) ( not ( = ?auto_20328 ?auto_20321 ) ) ( IS-CRATE ?auto_20316 ) ( not ( = ?auto_20322 ?auto_20319 ) ) ( not ( = ?auto_20320 ?auto_20322 ) ) ( HOIST-AT ?auto_20323 ?auto_20322 ) ( not ( = ?auto_20325 ?auto_20323 ) ) ( not ( = ?auto_20324 ?auto_20323 ) ) ( AVAILABLE ?auto_20323 ) ( SURFACE-AT ?auto_20316 ?auto_20322 ) ( ON ?auto_20316 ?auto_20327 ) ( CLEAR ?auto_20316 ) ( not ( = ?auto_20316 ?auto_20327 ) ) ( not ( = ?auto_20317 ?auto_20327 ) ) ( not ( = ?auto_20328 ?auto_20327 ) ) ( not ( = ?auto_20321 ?auto_20327 ) ) ( TRUCK-AT ?auto_20318 ?auto_20319 ) ( SURFACE-AT ?auto_20326 ?auto_20319 ) ( CLEAR ?auto_20326 ) ( IS-CRATE ?auto_20328 ) ( not ( = ?auto_20326 ?auto_20328 ) ) ( not ( = ?auto_20316 ?auto_20326 ) ) ( not ( = ?auto_20317 ?auto_20326 ) ) ( not ( = ?auto_20321 ?auto_20326 ) ) ( not ( = ?auto_20327 ?auto_20326 ) ) ( AVAILABLE ?auto_20325 ) ( IN ?auto_20328 ?auto_20318 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20325 ?auto_20328 ?auto_20318 ?auto_20319 )
      ( MAKE-2CRATE ?auto_20328 ?auto_20316 ?auto_20317 )
      ( MAKE-1CRATE-VERIFY ?auto_20316 ?auto_20317 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20329 - SURFACE
      ?auto_20330 - SURFACE
      ?auto_20331 - SURFACE
    )
    :vars
    (
      ?auto_20335 - HOIST
      ?auto_20336 - PLACE
      ?auto_20334 - PLACE
      ?auto_20341 - HOIST
      ?auto_20339 - SURFACE
      ?auto_20340 - PLACE
      ?auto_20332 - HOIST
      ?auto_20337 - SURFACE
      ?auto_20338 - TRUCK
      ?auto_20333 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20335 ?auto_20336 ) ( IS-CRATE ?auto_20331 ) ( not ( = ?auto_20330 ?auto_20331 ) ) ( not ( = ?auto_20329 ?auto_20330 ) ) ( not ( = ?auto_20329 ?auto_20331 ) ) ( not ( = ?auto_20334 ?auto_20336 ) ) ( HOIST-AT ?auto_20341 ?auto_20334 ) ( not ( = ?auto_20335 ?auto_20341 ) ) ( AVAILABLE ?auto_20341 ) ( SURFACE-AT ?auto_20331 ?auto_20334 ) ( ON ?auto_20331 ?auto_20339 ) ( CLEAR ?auto_20331 ) ( not ( = ?auto_20330 ?auto_20339 ) ) ( not ( = ?auto_20331 ?auto_20339 ) ) ( not ( = ?auto_20329 ?auto_20339 ) ) ( IS-CRATE ?auto_20330 ) ( not ( = ?auto_20340 ?auto_20336 ) ) ( not ( = ?auto_20334 ?auto_20340 ) ) ( HOIST-AT ?auto_20332 ?auto_20340 ) ( not ( = ?auto_20335 ?auto_20332 ) ) ( not ( = ?auto_20341 ?auto_20332 ) ) ( AVAILABLE ?auto_20332 ) ( SURFACE-AT ?auto_20330 ?auto_20340 ) ( ON ?auto_20330 ?auto_20337 ) ( CLEAR ?auto_20330 ) ( not ( = ?auto_20330 ?auto_20337 ) ) ( not ( = ?auto_20331 ?auto_20337 ) ) ( not ( = ?auto_20329 ?auto_20337 ) ) ( not ( = ?auto_20339 ?auto_20337 ) ) ( TRUCK-AT ?auto_20338 ?auto_20336 ) ( SURFACE-AT ?auto_20333 ?auto_20336 ) ( CLEAR ?auto_20333 ) ( IS-CRATE ?auto_20329 ) ( not ( = ?auto_20333 ?auto_20329 ) ) ( not ( = ?auto_20330 ?auto_20333 ) ) ( not ( = ?auto_20331 ?auto_20333 ) ) ( not ( = ?auto_20339 ?auto_20333 ) ) ( not ( = ?auto_20337 ?auto_20333 ) ) ( AVAILABLE ?auto_20335 ) ( IN ?auto_20329 ?auto_20338 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20330 ?auto_20331 )
      ( MAKE-2CRATE-VERIFY ?auto_20329 ?auto_20330 ?auto_20331 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20342 - SURFACE
      ?auto_20343 - SURFACE
      ?auto_20344 - SURFACE
      ?auto_20345 - SURFACE
    )
    :vars
    (
      ?auto_20346 - HOIST
      ?auto_20349 - PLACE
      ?auto_20347 - PLACE
      ?auto_20350 - HOIST
      ?auto_20352 - SURFACE
      ?auto_20348 - PLACE
      ?auto_20353 - HOIST
      ?auto_20354 - SURFACE
      ?auto_20351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20346 ?auto_20349 ) ( IS-CRATE ?auto_20345 ) ( not ( = ?auto_20344 ?auto_20345 ) ) ( not ( = ?auto_20343 ?auto_20344 ) ) ( not ( = ?auto_20343 ?auto_20345 ) ) ( not ( = ?auto_20347 ?auto_20349 ) ) ( HOIST-AT ?auto_20350 ?auto_20347 ) ( not ( = ?auto_20346 ?auto_20350 ) ) ( AVAILABLE ?auto_20350 ) ( SURFACE-AT ?auto_20345 ?auto_20347 ) ( ON ?auto_20345 ?auto_20352 ) ( CLEAR ?auto_20345 ) ( not ( = ?auto_20344 ?auto_20352 ) ) ( not ( = ?auto_20345 ?auto_20352 ) ) ( not ( = ?auto_20343 ?auto_20352 ) ) ( IS-CRATE ?auto_20344 ) ( not ( = ?auto_20348 ?auto_20349 ) ) ( not ( = ?auto_20347 ?auto_20348 ) ) ( HOIST-AT ?auto_20353 ?auto_20348 ) ( not ( = ?auto_20346 ?auto_20353 ) ) ( not ( = ?auto_20350 ?auto_20353 ) ) ( AVAILABLE ?auto_20353 ) ( SURFACE-AT ?auto_20344 ?auto_20348 ) ( ON ?auto_20344 ?auto_20354 ) ( CLEAR ?auto_20344 ) ( not ( = ?auto_20344 ?auto_20354 ) ) ( not ( = ?auto_20345 ?auto_20354 ) ) ( not ( = ?auto_20343 ?auto_20354 ) ) ( not ( = ?auto_20352 ?auto_20354 ) ) ( TRUCK-AT ?auto_20351 ?auto_20349 ) ( SURFACE-AT ?auto_20342 ?auto_20349 ) ( CLEAR ?auto_20342 ) ( IS-CRATE ?auto_20343 ) ( not ( = ?auto_20342 ?auto_20343 ) ) ( not ( = ?auto_20344 ?auto_20342 ) ) ( not ( = ?auto_20345 ?auto_20342 ) ) ( not ( = ?auto_20352 ?auto_20342 ) ) ( not ( = ?auto_20354 ?auto_20342 ) ) ( AVAILABLE ?auto_20346 ) ( IN ?auto_20343 ?auto_20351 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20343 ?auto_20344 ?auto_20345 )
      ( MAKE-3CRATE-VERIFY ?auto_20342 ?auto_20343 ?auto_20344 ?auto_20345 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20355 - SURFACE
      ?auto_20356 - SURFACE
    )
    :vars
    (
      ?auto_20357 - HOIST
      ?auto_20360 - PLACE
      ?auto_20361 - SURFACE
      ?auto_20358 - PLACE
      ?auto_20362 - HOIST
      ?auto_20364 - SURFACE
      ?auto_20359 - PLACE
      ?auto_20365 - HOIST
      ?auto_20366 - SURFACE
      ?auto_20367 - SURFACE
      ?auto_20363 - TRUCK
      ?auto_20368 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20357 ?auto_20360 ) ( IS-CRATE ?auto_20356 ) ( not ( = ?auto_20355 ?auto_20356 ) ) ( not ( = ?auto_20361 ?auto_20355 ) ) ( not ( = ?auto_20361 ?auto_20356 ) ) ( not ( = ?auto_20358 ?auto_20360 ) ) ( HOIST-AT ?auto_20362 ?auto_20358 ) ( not ( = ?auto_20357 ?auto_20362 ) ) ( AVAILABLE ?auto_20362 ) ( SURFACE-AT ?auto_20356 ?auto_20358 ) ( ON ?auto_20356 ?auto_20364 ) ( CLEAR ?auto_20356 ) ( not ( = ?auto_20355 ?auto_20364 ) ) ( not ( = ?auto_20356 ?auto_20364 ) ) ( not ( = ?auto_20361 ?auto_20364 ) ) ( IS-CRATE ?auto_20355 ) ( not ( = ?auto_20359 ?auto_20360 ) ) ( not ( = ?auto_20358 ?auto_20359 ) ) ( HOIST-AT ?auto_20365 ?auto_20359 ) ( not ( = ?auto_20357 ?auto_20365 ) ) ( not ( = ?auto_20362 ?auto_20365 ) ) ( AVAILABLE ?auto_20365 ) ( SURFACE-AT ?auto_20355 ?auto_20359 ) ( ON ?auto_20355 ?auto_20366 ) ( CLEAR ?auto_20355 ) ( not ( = ?auto_20355 ?auto_20366 ) ) ( not ( = ?auto_20356 ?auto_20366 ) ) ( not ( = ?auto_20361 ?auto_20366 ) ) ( not ( = ?auto_20364 ?auto_20366 ) ) ( SURFACE-AT ?auto_20367 ?auto_20360 ) ( CLEAR ?auto_20367 ) ( IS-CRATE ?auto_20361 ) ( not ( = ?auto_20367 ?auto_20361 ) ) ( not ( = ?auto_20355 ?auto_20367 ) ) ( not ( = ?auto_20356 ?auto_20367 ) ) ( not ( = ?auto_20364 ?auto_20367 ) ) ( not ( = ?auto_20366 ?auto_20367 ) ) ( AVAILABLE ?auto_20357 ) ( IN ?auto_20361 ?auto_20363 ) ( TRUCK-AT ?auto_20363 ?auto_20368 ) ( not ( = ?auto_20368 ?auto_20360 ) ) ( not ( = ?auto_20358 ?auto_20368 ) ) ( not ( = ?auto_20359 ?auto_20368 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20363 ?auto_20368 ?auto_20360 )
      ( MAKE-2CRATE ?auto_20361 ?auto_20355 ?auto_20356 )
      ( MAKE-1CRATE-VERIFY ?auto_20355 ?auto_20356 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20369 - SURFACE
      ?auto_20370 - SURFACE
      ?auto_20371 - SURFACE
    )
    :vars
    (
      ?auto_20375 - HOIST
      ?auto_20379 - PLACE
      ?auto_20374 - PLACE
      ?auto_20382 - HOIST
      ?auto_20372 - SURFACE
      ?auto_20376 - PLACE
      ?auto_20380 - HOIST
      ?auto_20377 - SURFACE
      ?auto_20381 - SURFACE
      ?auto_20378 - TRUCK
      ?auto_20373 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20375 ?auto_20379 ) ( IS-CRATE ?auto_20371 ) ( not ( = ?auto_20370 ?auto_20371 ) ) ( not ( = ?auto_20369 ?auto_20370 ) ) ( not ( = ?auto_20369 ?auto_20371 ) ) ( not ( = ?auto_20374 ?auto_20379 ) ) ( HOIST-AT ?auto_20382 ?auto_20374 ) ( not ( = ?auto_20375 ?auto_20382 ) ) ( AVAILABLE ?auto_20382 ) ( SURFACE-AT ?auto_20371 ?auto_20374 ) ( ON ?auto_20371 ?auto_20372 ) ( CLEAR ?auto_20371 ) ( not ( = ?auto_20370 ?auto_20372 ) ) ( not ( = ?auto_20371 ?auto_20372 ) ) ( not ( = ?auto_20369 ?auto_20372 ) ) ( IS-CRATE ?auto_20370 ) ( not ( = ?auto_20376 ?auto_20379 ) ) ( not ( = ?auto_20374 ?auto_20376 ) ) ( HOIST-AT ?auto_20380 ?auto_20376 ) ( not ( = ?auto_20375 ?auto_20380 ) ) ( not ( = ?auto_20382 ?auto_20380 ) ) ( AVAILABLE ?auto_20380 ) ( SURFACE-AT ?auto_20370 ?auto_20376 ) ( ON ?auto_20370 ?auto_20377 ) ( CLEAR ?auto_20370 ) ( not ( = ?auto_20370 ?auto_20377 ) ) ( not ( = ?auto_20371 ?auto_20377 ) ) ( not ( = ?auto_20369 ?auto_20377 ) ) ( not ( = ?auto_20372 ?auto_20377 ) ) ( SURFACE-AT ?auto_20381 ?auto_20379 ) ( CLEAR ?auto_20381 ) ( IS-CRATE ?auto_20369 ) ( not ( = ?auto_20381 ?auto_20369 ) ) ( not ( = ?auto_20370 ?auto_20381 ) ) ( not ( = ?auto_20371 ?auto_20381 ) ) ( not ( = ?auto_20372 ?auto_20381 ) ) ( not ( = ?auto_20377 ?auto_20381 ) ) ( AVAILABLE ?auto_20375 ) ( IN ?auto_20369 ?auto_20378 ) ( TRUCK-AT ?auto_20378 ?auto_20373 ) ( not ( = ?auto_20373 ?auto_20379 ) ) ( not ( = ?auto_20374 ?auto_20373 ) ) ( not ( = ?auto_20376 ?auto_20373 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20370 ?auto_20371 )
      ( MAKE-2CRATE-VERIFY ?auto_20369 ?auto_20370 ?auto_20371 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20383 - SURFACE
      ?auto_20384 - SURFACE
      ?auto_20385 - SURFACE
      ?auto_20386 - SURFACE
    )
    :vars
    (
      ?auto_20393 - HOIST
      ?auto_20388 - PLACE
      ?auto_20396 - PLACE
      ?auto_20391 - HOIST
      ?auto_20389 - SURFACE
      ?auto_20394 - PLACE
      ?auto_20390 - HOIST
      ?auto_20392 - SURFACE
      ?auto_20387 - TRUCK
      ?auto_20395 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20393 ?auto_20388 ) ( IS-CRATE ?auto_20386 ) ( not ( = ?auto_20385 ?auto_20386 ) ) ( not ( = ?auto_20384 ?auto_20385 ) ) ( not ( = ?auto_20384 ?auto_20386 ) ) ( not ( = ?auto_20396 ?auto_20388 ) ) ( HOIST-AT ?auto_20391 ?auto_20396 ) ( not ( = ?auto_20393 ?auto_20391 ) ) ( AVAILABLE ?auto_20391 ) ( SURFACE-AT ?auto_20386 ?auto_20396 ) ( ON ?auto_20386 ?auto_20389 ) ( CLEAR ?auto_20386 ) ( not ( = ?auto_20385 ?auto_20389 ) ) ( not ( = ?auto_20386 ?auto_20389 ) ) ( not ( = ?auto_20384 ?auto_20389 ) ) ( IS-CRATE ?auto_20385 ) ( not ( = ?auto_20394 ?auto_20388 ) ) ( not ( = ?auto_20396 ?auto_20394 ) ) ( HOIST-AT ?auto_20390 ?auto_20394 ) ( not ( = ?auto_20393 ?auto_20390 ) ) ( not ( = ?auto_20391 ?auto_20390 ) ) ( AVAILABLE ?auto_20390 ) ( SURFACE-AT ?auto_20385 ?auto_20394 ) ( ON ?auto_20385 ?auto_20392 ) ( CLEAR ?auto_20385 ) ( not ( = ?auto_20385 ?auto_20392 ) ) ( not ( = ?auto_20386 ?auto_20392 ) ) ( not ( = ?auto_20384 ?auto_20392 ) ) ( not ( = ?auto_20389 ?auto_20392 ) ) ( SURFACE-AT ?auto_20383 ?auto_20388 ) ( CLEAR ?auto_20383 ) ( IS-CRATE ?auto_20384 ) ( not ( = ?auto_20383 ?auto_20384 ) ) ( not ( = ?auto_20385 ?auto_20383 ) ) ( not ( = ?auto_20386 ?auto_20383 ) ) ( not ( = ?auto_20389 ?auto_20383 ) ) ( not ( = ?auto_20392 ?auto_20383 ) ) ( AVAILABLE ?auto_20393 ) ( IN ?auto_20384 ?auto_20387 ) ( TRUCK-AT ?auto_20387 ?auto_20395 ) ( not ( = ?auto_20395 ?auto_20388 ) ) ( not ( = ?auto_20396 ?auto_20395 ) ) ( not ( = ?auto_20394 ?auto_20395 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20384 ?auto_20385 ?auto_20386 )
      ( MAKE-3CRATE-VERIFY ?auto_20383 ?auto_20384 ?auto_20385 ?auto_20386 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20397 - SURFACE
      ?auto_20398 - SURFACE
    )
    :vars
    (
      ?auto_20407 - HOIST
      ?auto_20400 - PLACE
      ?auto_20405 - SURFACE
      ?auto_20410 - PLACE
      ?auto_20404 - HOIST
      ?auto_20401 - SURFACE
      ?auto_20408 - PLACE
      ?auto_20402 - HOIST
      ?auto_20406 - SURFACE
      ?auto_20403 - SURFACE
      ?auto_20399 - TRUCK
      ?auto_20409 - PLACE
      ?auto_20411 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20407 ?auto_20400 ) ( IS-CRATE ?auto_20398 ) ( not ( = ?auto_20397 ?auto_20398 ) ) ( not ( = ?auto_20405 ?auto_20397 ) ) ( not ( = ?auto_20405 ?auto_20398 ) ) ( not ( = ?auto_20410 ?auto_20400 ) ) ( HOIST-AT ?auto_20404 ?auto_20410 ) ( not ( = ?auto_20407 ?auto_20404 ) ) ( AVAILABLE ?auto_20404 ) ( SURFACE-AT ?auto_20398 ?auto_20410 ) ( ON ?auto_20398 ?auto_20401 ) ( CLEAR ?auto_20398 ) ( not ( = ?auto_20397 ?auto_20401 ) ) ( not ( = ?auto_20398 ?auto_20401 ) ) ( not ( = ?auto_20405 ?auto_20401 ) ) ( IS-CRATE ?auto_20397 ) ( not ( = ?auto_20408 ?auto_20400 ) ) ( not ( = ?auto_20410 ?auto_20408 ) ) ( HOIST-AT ?auto_20402 ?auto_20408 ) ( not ( = ?auto_20407 ?auto_20402 ) ) ( not ( = ?auto_20404 ?auto_20402 ) ) ( AVAILABLE ?auto_20402 ) ( SURFACE-AT ?auto_20397 ?auto_20408 ) ( ON ?auto_20397 ?auto_20406 ) ( CLEAR ?auto_20397 ) ( not ( = ?auto_20397 ?auto_20406 ) ) ( not ( = ?auto_20398 ?auto_20406 ) ) ( not ( = ?auto_20405 ?auto_20406 ) ) ( not ( = ?auto_20401 ?auto_20406 ) ) ( SURFACE-AT ?auto_20403 ?auto_20400 ) ( CLEAR ?auto_20403 ) ( IS-CRATE ?auto_20405 ) ( not ( = ?auto_20403 ?auto_20405 ) ) ( not ( = ?auto_20397 ?auto_20403 ) ) ( not ( = ?auto_20398 ?auto_20403 ) ) ( not ( = ?auto_20401 ?auto_20403 ) ) ( not ( = ?auto_20406 ?auto_20403 ) ) ( AVAILABLE ?auto_20407 ) ( TRUCK-AT ?auto_20399 ?auto_20409 ) ( not ( = ?auto_20409 ?auto_20400 ) ) ( not ( = ?auto_20410 ?auto_20409 ) ) ( not ( = ?auto_20408 ?auto_20409 ) ) ( HOIST-AT ?auto_20411 ?auto_20409 ) ( LIFTING ?auto_20411 ?auto_20405 ) ( not ( = ?auto_20407 ?auto_20411 ) ) ( not ( = ?auto_20404 ?auto_20411 ) ) ( not ( = ?auto_20402 ?auto_20411 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20411 ?auto_20405 ?auto_20399 ?auto_20409 )
      ( MAKE-2CRATE ?auto_20405 ?auto_20397 ?auto_20398 )
      ( MAKE-1CRATE-VERIFY ?auto_20397 ?auto_20398 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20412 - SURFACE
      ?auto_20413 - SURFACE
      ?auto_20414 - SURFACE
    )
    :vars
    (
      ?auto_20418 - HOIST
      ?auto_20424 - PLACE
      ?auto_20426 - PLACE
      ?auto_20417 - HOIST
      ?auto_20421 - SURFACE
      ?auto_20416 - PLACE
      ?auto_20423 - HOIST
      ?auto_20425 - SURFACE
      ?auto_20422 - SURFACE
      ?auto_20415 - TRUCK
      ?auto_20419 - PLACE
      ?auto_20420 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20418 ?auto_20424 ) ( IS-CRATE ?auto_20414 ) ( not ( = ?auto_20413 ?auto_20414 ) ) ( not ( = ?auto_20412 ?auto_20413 ) ) ( not ( = ?auto_20412 ?auto_20414 ) ) ( not ( = ?auto_20426 ?auto_20424 ) ) ( HOIST-AT ?auto_20417 ?auto_20426 ) ( not ( = ?auto_20418 ?auto_20417 ) ) ( AVAILABLE ?auto_20417 ) ( SURFACE-AT ?auto_20414 ?auto_20426 ) ( ON ?auto_20414 ?auto_20421 ) ( CLEAR ?auto_20414 ) ( not ( = ?auto_20413 ?auto_20421 ) ) ( not ( = ?auto_20414 ?auto_20421 ) ) ( not ( = ?auto_20412 ?auto_20421 ) ) ( IS-CRATE ?auto_20413 ) ( not ( = ?auto_20416 ?auto_20424 ) ) ( not ( = ?auto_20426 ?auto_20416 ) ) ( HOIST-AT ?auto_20423 ?auto_20416 ) ( not ( = ?auto_20418 ?auto_20423 ) ) ( not ( = ?auto_20417 ?auto_20423 ) ) ( AVAILABLE ?auto_20423 ) ( SURFACE-AT ?auto_20413 ?auto_20416 ) ( ON ?auto_20413 ?auto_20425 ) ( CLEAR ?auto_20413 ) ( not ( = ?auto_20413 ?auto_20425 ) ) ( not ( = ?auto_20414 ?auto_20425 ) ) ( not ( = ?auto_20412 ?auto_20425 ) ) ( not ( = ?auto_20421 ?auto_20425 ) ) ( SURFACE-AT ?auto_20422 ?auto_20424 ) ( CLEAR ?auto_20422 ) ( IS-CRATE ?auto_20412 ) ( not ( = ?auto_20422 ?auto_20412 ) ) ( not ( = ?auto_20413 ?auto_20422 ) ) ( not ( = ?auto_20414 ?auto_20422 ) ) ( not ( = ?auto_20421 ?auto_20422 ) ) ( not ( = ?auto_20425 ?auto_20422 ) ) ( AVAILABLE ?auto_20418 ) ( TRUCK-AT ?auto_20415 ?auto_20419 ) ( not ( = ?auto_20419 ?auto_20424 ) ) ( not ( = ?auto_20426 ?auto_20419 ) ) ( not ( = ?auto_20416 ?auto_20419 ) ) ( HOIST-AT ?auto_20420 ?auto_20419 ) ( LIFTING ?auto_20420 ?auto_20412 ) ( not ( = ?auto_20418 ?auto_20420 ) ) ( not ( = ?auto_20417 ?auto_20420 ) ) ( not ( = ?auto_20423 ?auto_20420 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20413 ?auto_20414 )
      ( MAKE-2CRATE-VERIFY ?auto_20412 ?auto_20413 ?auto_20414 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20427 - SURFACE
      ?auto_20428 - SURFACE
      ?auto_20429 - SURFACE
      ?auto_20430 - SURFACE
    )
    :vars
    (
      ?auto_20434 - HOIST
      ?auto_20439 - PLACE
      ?auto_20432 - PLACE
      ?auto_20441 - HOIST
      ?auto_20431 - SURFACE
      ?auto_20440 - PLACE
      ?auto_20436 - HOIST
      ?auto_20437 - SURFACE
      ?auto_20435 - TRUCK
      ?auto_20433 - PLACE
      ?auto_20438 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20434 ?auto_20439 ) ( IS-CRATE ?auto_20430 ) ( not ( = ?auto_20429 ?auto_20430 ) ) ( not ( = ?auto_20428 ?auto_20429 ) ) ( not ( = ?auto_20428 ?auto_20430 ) ) ( not ( = ?auto_20432 ?auto_20439 ) ) ( HOIST-AT ?auto_20441 ?auto_20432 ) ( not ( = ?auto_20434 ?auto_20441 ) ) ( AVAILABLE ?auto_20441 ) ( SURFACE-AT ?auto_20430 ?auto_20432 ) ( ON ?auto_20430 ?auto_20431 ) ( CLEAR ?auto_20430 ) ( not ( = ?auto_20429 ?auto_20431 ) ) ( not ( = ?auto_20430 ?auto_20431 ) ) ( not ( = ?auto_20428 ?auto_20431 ) ) ( IS-CRATE ?auto_20429 ) ( not ( = ?auto_20440 ?auto_20439 ) ) ( not ( = ?auto_20432 ?auto_20440 ) ) ( HOIST-AT ?auto_20436 ?auto_20440 ) ( not ( = ?auto_20434 ?auto_20436 ) ) ( not ( = ?auto_20441 ?auto_20436 ) ) ( AVAILABLE ?auto_20436 ) ( SURFACE-AT ?auto_20429 ?auto_20440 ) ( ON ?auto_20429 ?auto_20437 ) ( CLEAR ?auto_20429 ) ( not ( = ?auto_20429 ?auto_20437 ) ) ( not ( = ?auto_20430 ?auto_20437 ) ) ( not ( = ?auto_20428 ?auto_20437 ) ) ( not ( = ?auto_20431 ?auto_20437 ) ) ( SURFACE-AT ?auto_20427 ?auto_20439 ) ( CLEAR ?auto_20427 ) ( IS-CRATE ?auto_20428 ) ( not ( = ?auto_20427 ?auto_20428 ) ) ( not ( = ?auto_20429 ?auto_20427 ) ) ( not ( = ?auto_20430 ?auto_20427 ) ) ( not ( = ?auto_20431 ?auto_20427 ) ) ( not ( = ?auto_20437 ?auto_20427 ) ) ( AVAILABLE ?auto_20434 ) ( TRUCK-AT ?auto_20435 ?auto_20433 ) ( not ( = ?auto_20433 ?auto_20439 ) ) ( not ( = ?auto_20432 ?auto_20433 ) ) ( not ( = ?auto_20440 ?auto_20433 ) ) ( HOIST-AT ?auto_20438 ?auto_20433 ) ( LIFTING ?auto_20438 ?auto_20428 ) ( not ( = ?auto_20434 ?auto_20438 ) ) ( not ( = ?auto_20441 ?auto_20438 ) ) ( not ( = ?auto_20436 ?auto_20438 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20428 ?auto_20429 ?auto_20430 )
      ( MAKE-3CRATE-VERIFY ?auto_20427 ?auto_20428 ?auto_20429 ?auto_20430 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20442 - SURFACE
      ?auto_20443 - SURFACE
    )
    :vars
    (
      ?auto_20447 - HOIST
      ?auto_20452 - PLACE
      ?auto_20453 - SURFACE
      ?auto_20445 - PLACE
      ?auto_20456 - HOIST
      ?auto_20444 - SURFACE
      ?auto_20455 - PLACE
      ?auto_20449 - HOIST
      ?auto_20450 - SURFACE
      ?auto_20454 - SURFACE
      ?auto_20448 - TRUCK
      ?auto_20446 - PLACE
      ?auto_20451 - HOIST
      ?auto_20457 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20447 ?auto_20452 ) ( IS-CRATE ?auto_20443 ) ( not ( = ?auto_20442 ?auto_20443 ) ) ( not ( = ?auto_20453 ?auto_20442 ) ) ( not ( = ?auto_20453 ?auto_20443 ) ) ( not ( = ?auto_20445 ?auto_20452 ) ) ( HOIST-AT ?auto_20456 ?auto_20445 ) ( not ( = ?auto_20447 ?auto_20456 ) ) ( AVAILABLE ?auto_20456 ) ( SURFACE-AT ?auto_20443 ?auto_20445 ) ( ON ?auto_20443 ?auto_20444 ) ( CLEAR ?auto_20443 ) ( not ( = ?auto_20442 ?auto_20444 ) ) ( not ( = ?auto_20443 ?auto_20444 ) ) ( not ( = ?auto_20453 ?auto_20444 ) ) ( IS-CRATE ?auto_20442 ) ( not ( = ?auto_20455 ?auto_20452 ) ) ( not ( = ?auto_20445 ?auto_20455 ) ) ( HOIST-AT ?auto_20449 ?auto_20455 ) ( not ( = ?auto_20447 ?auto_20449 ) ) ( not ( = ?auto_20456 ?auto_20449 ) ) ( AVAILABLE ?auto_20449 ) ( SURFACE-AT ?auto_20442 ?auto_20455 ) ( ON ?auto_20442 ?auto_20450 ) ( CLEAR ?auto_20442 ) ( not ( = ?auto_20442 ?auto_20450 ) ) ( not ( = ?auto_20443 ?auto_20450 ) ) ( not ( = ?auto_20453 ?auto_20450 ) ) ( not ( = ?auto_20444 ?auto_20450 ) ) ( SURFACE-AT ?auto_20454 ?auto_20452 ) ( CLEAR ?auto_20454 ) ( IS-CRATE ?auto_20453 ) ( not ( = ?auto_20454 ?auto_20453 ) ) ( not ( = ?auto_20442 ?auto_20454 ) ) ( not ( = ?auto_20443 ?auto_20454 ) ) ( not ( = ?auto_20444 ?auto_20454 ) ) ( not ( = ?auto_20450 ?auto_20454 ) ) ( AVAILABLE ?auto_20447 ) ( TRUCK-AT ?auto_20448 ?auto_20446 ) ( not ( = ?auto_20446 ?auto_20452 ) ) ( not ( = ?auto_20445 ?auto_20446 ) ) ( not ( = ?auto_20455 ?auto_20446 ) ) ( HOIST-AT ?auto_20451 ?auto_20446 ) ( not ( = ?auto_20447 ?auto_20451 ) ) ( not ( = ?auto_20456 ?auto_20451 ) ) ( not ( = ?auto_20449 ?auto_20451 ) ) ( AVAILABLE ?auto_20451 ) ( SURFACE-AT ?auto_20453 ?auto_20446 ) ( ON ?auto_20453 ?auto_20457 ) ( CLEAR ?auto_20453 ) ( not ( = ?auto_20442 ?auto_20457 ) ) ( not ( = ?auto_20443 ?auto_20457 ) ) ( not ( = ?auto_20453 ?auto_20457 ) ) ( not ( = ?auto_20444 ?auto_20457 ) ) ( not ( = ?auto_20450 ?auto_20457 ) ) ( not ( = ?auto_20454 ?auto_20457 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20451 ?auto_20453 ?auto_20457 ?auto_20446 )
      ( MAKE-2CRATE ?auto_20453 ?auto_20442 ?auto_20443 )
      ( MAKE-1CRATE-VERIFY ?auto_20442 ?auto_20443 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20458 - SURFACE
      ?auto_20459 - SURFACE
      ?auto_20460 - SURFACE
    )
    :vars
    (
      ?auto_20466 - HOIST
      ?auto_20461 - PLACE
      ?auto_20471 - PLACE
      ?auto_20464 - HOIST
      ?auto_20473 - SURFACE
      ?auto_20469 - PLACE
      ?auto_20462 - HOIST
      ?auto_20470 - SURFACE
      ?auto_20468 - SURFACE
      ?auto_20463 - TRUCK
      ?auto_20467 - PLACE
      ?auto_20465 - HOIST
      ?auto_20472 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20466 ?auto_20461 ) ( IS-CRATE ?auto_20460 ) ( not ( = ?auto_20459 ?auto_20460 ) ) ( not ( = ?auto_20458 ?auto_20459 ) ) ( not ( = ?auto_20458 ?auto_20460 ) ) ( not ( = ?auto_20471 ?auto_20461 ) ) ( HOIST-AT ?auto_20464 ?auto_20471 ) ( not ( = ?auto_20466 ?auto_20464 ) ) ( AVAILABLE ?auto_20464 ) ( SURFACE-AT ?auto_20460 ?auto_20471 ) ( ON ?auto_20460 ?auto_20473 ) ( CLEAR ?auto_20460 ) ( not ( = ?auto_20459 ?auto_20473 ) ) ( not ( = ?auto_20460 ?auto_20473 ) ) ( not ( = ?auto_20458 ?auto_20473 ) ) ( IS-CRATE ?auto_20459 ) ( not ( = ?auto_20469 ?auto_20461 ) ) ( not ( = ?auto_20471 ?auto_20469 ) ) ( HOIST-AT ?auto_20462 ?auto_20469 ) ( not ( = ?auto_20466 ?auto_20462 ) ) ( not ( = ?auto_20464 ?auto_20462 ) ) ( AVAILABLE ?auto_20462 ) ( SURFACE-AT ?auto_20459 ?auto_20469 ) ( ON ?auto_20459 ?auto_20470 ) ( CLEAR ?auto_20459 ) ( not ( = ?auto_20459 ?auto_20470 ) ) ( not ( = ?auto_20460 ?auto_20470 ) ) ( not ( = ?auto_20458 ?auto_20470 ) ) ( not ( = ?auto_20473 ?auto_20470 ) ) ( SURFACE-AT ?auto_20468 ?auto_20461 ) ( CLEAR ?auto_20468 ) ( IS-CRATE ?auto_20458 ) ( not ( = ?auto_20468 ?auto_20458 ) ) ( not ( = ?auto_20459 ?auto_20468 ) ) ( not ( = ?auto_20460 ?auto_20468 ) ) ( not ( = ?auto_20473 ?auto_20468 ) ) ( not ( = ?auto_20470 ?auto_20468 ) ) ( AVAILABLE ?auto_20466 ) ( TRUCK-AT ?auto_20463 ?auto_20467 ) ( not ( = ?auto_20467 ?auto_20461 ) ) ( not ( = ?auto_20471 ?auto_20467 ) ) ( not ( = ?auto_20469 ?auto_20467 ) ) ( HOIST-AT ?auto_20465 ?auto_20467 ) ( not ( = ?auto_20466 ?auto_20465 ) ) ( not ( = ?auto_20464 ?auto_20465 ) ) ( not ( = ?auto_20462 ?auto_20465 ) ) ( AVAILABLE ?auto_20465 ) ( SURFACE-AT ?auto_20458 ?auto_20467 ) ( ON ?auto_20458 ?auto_20472 ) ( CLEAR ?auto_20458 ) ( not ( = ?auto_20459 ?auto_20472 ) ) ( not ( = ?auto_20460 ?auto_20472 ) ) ( not ( = ?auto_20458 ?auto_20472 ) ) ( not ( = ?auto_20473 ?auto_20472 ) ) ( not ( = ?auto_20470 ?auto_20472 ) ) ( not ( = ?auto_20468 ?auto_20472 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20459 ?auto_20460 )
      ( MAKE-2CRATE-VERIFY ?auto_20458 ?auto_20459 ?auto_20460 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20474 - SURFACE
      ?auto_20475 - SURFACE
      ?auto_20476 - SURFACE
      ?auto_20477 - SURFACE
    )
    :vars
    (
      ?auto_20488 - HOIST
      ?auto_20478 - PLACE
      ?auto_20480 - PLACE
      ?auto_20486 - HOIST
      ?auto_20482 - SURFACE
      ?auto_20487 - PLACE
      ?auto_20479 - HOIST
      ?auto_20485 - SURFACE
      ?auto_20481 - TRUCK
      ?auto_20483 - PLACE
      ?auto_20489 - HOIST
      ?auto_20484 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20488 ?auto_20478 ) ( IS-CRATE ?auto_20477 ) ( not ( = ?auto_20476 ?auto_20477 ) ) ( not ( = ?auto_20475 ?auto_20476 ) ) ( not ( = ?auto_20475 ?auto_20477 ) ) ( not ( = ?auto_20480 ?auto_20478 ) ) ( HOIST-AT ?auto_20486 ?auto_20480 ) ( not ( = ?auto_20488 ?auto_20486 ) ) ( AVAILABLE ?auto_20486 ) ( SURFACE-AT ?auto_20477 ?auto_20480 ) ( ON ?auto_20477 ?auto_20482 ) ( CLEAR ?auto_20477 ) ( not ( = ?auto_20476 ?auto_20482 ) ) ( not ( = ?auto_20477 ?auto_20482 ) ) ( not ( = ?auto_20475 ?auto_20482 ) ) ( IS-CRATE ?auto_20476 ) ( not ( = ?auto_20487 ?auto_20478 ) ) ( not ( = ?auto_20480 ?auto_20487 ) ) ( HOIST-AT ?auto_20479 ?auto_20487 ) ( not ( = ?auto_20488 ?auto_20479 ) ) ( not ( = ?auto_20486 ?auto_20479 ) ) ( AVAILABLE ?auto_20479 ) ( SURFACE-AT ?auto_20476 ?auto_20487 ) ( ON ?auto_20476 ?auto_20485 ) ( CLEAR ?auto_20476 ) ( not ( = ?auto_20476 ?auto_20485 ) ) ( not ( = ?auto_20477 ?auto_20485 ) ) ( not ( = ?auto_20475 ?auto_20485 ) ) ( not ( = ?auto_20482 ?auto_20485 ) ) ( SURFACE-AT ?auto_20474 ?auto_20478 ) ( CLEAR ?auto_20474 ) ( IS-CRATE ?auto_20475 ) ( not ( = ?auto_20474 ?auto_20475 ) ) ( not ( = ?auto_20476 ?auto_20474 ) ) ( not ( = ?auto_20477 ?auto_20474 ) ) ( not ( = ?auto_20482 ?auto_20474 ) ) ( not ( = ?auto_20485 ?auto_20474 ) ) ( AVAILABLE ?auto_20488 ) ( TRUCK-AT ?auto_20481 ?auto_20483 ) ( not ( = ?auto_20483 ?auto_20478 ) ) ( not ( = ?auto_20480 ?auto_20483 ) ) ( not ( = ?auto_20487 ?auto_20483 ) ) ( HOIST-AT ?auto_20489 ?auto_20483 ) ( not ( = ?auto_20488 ?auto_20489 ) ) ( not ( = ?auto_20486 ?auto_20489 ) ) ( not ( = ?auto_20479 ?auto_20489 ) ) ( AVAILABLE ?auto_20489 ) ( SURFACE-AT ?auto_20475 ?auto_20483 ) ( ON ?auto_20475 ?auto_20484 ) ( CLEAR ?auto_20475 ) ( not ( = ?auto_20476 ?auto_20484 ) ) ( not ( = ?auto_20477 ?auto_20484 ) ) ( not ( = ?auto_20475 ?auto_20484 ) ) ( not ( = ?auto_20482 ?auto_20484 ) ) ( not ( = ?auto_20485 ?auto_20484 ) ) ( not ( = ?auto_20474 ?auto_20484 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20475 ?auto_20476 ?auto_20477 )
      ( MAKE-3CRATE-VERIFY ?auto_20474 ?auto_20475 ?auto_20476 ?auto_20477 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20490 - SURFACE
      ?auto_20491 - SURFACE
    )
    :vars
    (
      ?auto_20504 - HOIST
      ?auto_20492 - PLACE
      ?auto_20499 - SURFACE
      ?auto_20494 - PLACE
      ?auto_20502 - HOIST
      ?auto_20496 - SURFACE
      ?auto_20503 - PLACE
      ?auto_20493 - HOIST
      ?auto_20500 - SURFACE
      ?auto_20501 - SURFACE
      ?auto_20497 - PLACE
      ?auto_20505 - HOIST
      ?auto_20498 - SURFACE
      ?auto_20495 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20504 ?auto_20492 ) ( IS-CRATE ?auto_20491 ) ( not ( = ?auto_20490 ?auto_20491 ) ) ( not ( = ?auto_20499 ?auto_20490 ) ) ( not ( = ?auto_20499 ?auto_20491 ) ) ( not ( = ?auto_20494 ?auto_20492 ) ) ( HOIST-AT ?auto_20502 ?auto_20494 ) ( not ( = ?auto_20504 ?auto_20502 ) ) ( AVAILABLE ?auto_20502 ) ( SURFACE-AT ?auto_20491 ?auto_20494 ) ( ON ?auto_20491 ?auto_20496 ) ( CLEAR ?auto_20491 ) ( not ( = ?auto_20490 ?auto_20496 ) ) ( not ( = ?auto_20491 ?auto_20496 ) ) ( not ( = ?auto_20499 ?auto_20496 ) ) ( IS-CRATE ?auto_20490 ) ( not ( = ?auto_20503 ?auto_20492 ) ) ( not ( = ?auto_20494 ?auto_20503 ) ) ( HOIST-AT ?auto_20493 ?auto_20503 ) ( not ( = ?auto_20504 ?auto_20493 ) ) ( not ( = ?auto_20502 ?auto_20493 ) ) ( AVAILABLE ?auto_20493 ) ( SURFACE-AT ?auto_20490 ?auto_20503 ) ( ON ?auto_20490 ?auto_20500 ) ( CLEAR ?auto_20490 ) ( not ( = ?auto_20490 ?auto_20500 ) ) ( not ( = ?auto_20491 ?auto_20500 ) ) ( not ( = ?auto_20499 ?auto_20500 ) ) ( not ( = ?auto_20496 ?auto_20500 ) ) ( SURFACE-AT ?auto_20501 ?auto_20492 ) ( CLEAR ?auto_20501 ) ( IS-CRATE ?auto_20499 ) ( not ( = ?auto_20501 ?auto_20499 ) ) ( not ( = ?auto_20490 ?auto_20501 ) ) ( not ( = ?auto_20491 ?auto_20501 ) ) ( not ( = ?auto_20496 ?auto_20501 ) ) ( not ( = ?auto_20500 ?auto_20501 ) ) ( AVAILABLE ?auto_20504 ) ( not ( = ?auto_20497 ?auto_20492 ) ) ( not ( = ?auto_20494 ?auto_20497 ) ) ( not ( = ?auto_20503 ?auto_20497 ) ) ( HOIST-AT ?auto_20505 ?auto_20497 ) ( not ( = ?auto_20504 ?auto_20505 ) ) ( not ( = ?auto_20502 ?auto_20505 ) ) ( not ( = ?auto_20493 ?auto_20505 ) ) ( AVAILABLE ?auto_20505 ) ( SURFACE-AT ?auto_20499 ?auto_20497 ) ( ON ?auto_20499 ?auto_20498 ) ( CLEAR ?auto_20499 ) ( not ( = ?auto_20490 ?auto_20498 ) ) ( not ( = ?auto_20491 ?auto_20498 ) ) ( not ( = ?auto_20499 ?auto_20498 ) ) ( not ( = ?auto_20496 ?auto_20498 ) ) ( not ( = ?auto_20500 ?auto_20498 ) ) ( not ( = ?auto_20501 ?auto_20498 ) ) ( TRUCK-AT ?auto_20495 ?auto_20492 ) )
    :subtasks
    ( ( !DRIVE ?auto_20495 ?auto_20492 ?auto_20497 )
      ( MAKE-2CRATE ?auto_20499 ?auto_20490 ?auto_20491 )
      ( MAKE-1CRATE-VERIFY ?auto_20490 ?auto_20491 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20506 - SURFACE
      ?auto_20507 - SURFACE
      ?auto_20508 - SURFACE
    )
    :vars
    (
      ?auto_20509 - HOIST
      ?auto_20518 - PLACE
      ?auto_20512 - PLACE
      ?auto_20519 - HOIST
      ?auto_20516 - SURFACE
      ?auto_20520 - PLACE
      ?auto_20517 - HOIST
      ?auto_20511 - SURFACE
      ?auto_20513 - SURFACE
      ?auto_20514 - PLACE
      ?auto_20510 - HOIST
      ?auto_20521 - SURFACE
      ?auto_20515 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20509 ?auto_20518 ) ( IS-CRATE ?auto_20508 ) ( not ( = ?auto_20507 ?auto_20508 ) ) ( not ( = ?auto_20506 ?auto_20507 ) ) ( not ( = ?auto_20506 ?auto_20508 ) ) ( not ( = ?auto_20512 ?auto_20518 ) ) ( HOIST-AT ?auto_20519 ?auto_20512 ) ( not ( = ?auto_20509 ?auto_20519 ) ) ( AVAILABLE ?auto_20519 ) ( SURFACE-AT ?auto_20508 ?auto_20512 ) ( ON ?auto_20508 ?auto_20516 ) ( CLEAR ?auto_20508 ) ( not ( = ?auto_20507 ?auto_20516 ) ) ( not ( = ?auto_20508 ?auto_20516 ) ) ( not ( = ?auto_20506 ?auto_20516 ) ) ( IS-CRATE ?auto_20507 ) ( not ( = ?auto_20520 ?auto_20518 ) ) ( not ( = ?auto_20512 ?auto_20520 ) ) ( HOIST-AT ?auto_20517 ?auto_20520 ) ( not ( = ?auto_20509 ?auto_20517 ) ) ( not ( = ?auto_20519 ?auto_20517 ) ) ( AVAILABLE ?auto_20517 ) ( SURFACE-AT ?auto_20507 ?auto_20520 ) ( ON ?auto_20507 ?auto_20511 ) ( CLEAR ?auto_20507 ) ( not ( = ?auto_20507 ?auto_20511 ) ) ( not ( = ?auto_20508 ?auto_20511 ) ) ( not ( = ?auto_20506 ?auto_20511 ) ) ( not ( = ?auto_20516 ?auto_20511 ) ) ( SURFACE-AT ?auto_20513 ?auto_20518 ) ( CLEAR ?auto_20513 ) ( IS-CRATE ?auto_20506 ) ( not ( = ?auto_20513 ?auto_20506 ) ) ( not ( = ?auto_20507 ?auto_20513 ) ) ( not ( = ?auto_20508 ?auto_20513 ) ) ( not ( = ?auto_20516 ?auto_20513 ) ) ( not ( = ?auto_20511 ?auto_20513 ) ) ( AVAILABLE ?auto_20509 ) ( not ( = ?auto_20514 ?auto_20518 ) ) ( not ( = ?auto_20512 ?auto_20514 ) ) ( not ( = ?auto_20520 ?auto_20514 ) ) ( HOIST-AT ?auto_20510 ?auto_20514 ) ( not ( = ?auto_20509 ?auto_20510 ) ) ( not ( = ?auto_20519 ?auto_20510 ) ) ( not ( = ?auto_20517 ?auto_20510 ) ) ( AVAILABLE ?auto_20510 ) ( SURFACE-AT ?auto_20506 ?auto_20514 ) ( ON ?auto_20506 ?auto_20521 ) ( CLEAR ?auto_20506 ) ( not ( = ?auto_20507 ?auto_20521 ) ) ( not ( = ?auto_20508 ?auto_20521 ) ) ( not ( = ?auto_20506 ?auto_20521 ) ) ( not ( = ?auto_20516 ?auto_20521 ) ) ( not ( = ?auto_20511 ?auto_20521 ) ) ( not ( = ?auto_20513 ?auto_20521 ) ) ( TRUCK-AT ?auto_20515 ?auto_20518 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20507 ?auto_20508 )
      ( MAKE-2CRATE-VERIFY ?auto_20506 ?auto_20507 ?auto_20508 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20522 - SURFACE
      ?auto_20523 - SURFACE
      ?auto_20524 - SURFACE
      ?auto_20525 - SURFACE
    )
    :vars
    (
      ?auto_20533 - HOIST
      ?auto_20527 - PLACE
      ?auto_20530 - PLACE
      ?auto_20529 - HOIST
      ?auto_20531 - SURFACE
      ?auto_20532 - PLACE
      ?auto_20537 - HOIST
      ?auto_20536 - SURFACE
      ?auto_20535 - PLACE
      ?auto_20526 - HOIST
      ?auto_20528 - SURFACE
      ?auto_20534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20533 ?auto_20527 ) ( IS-CRATE ?auto_20525 ) ( not ( = ?auto_20524 ?auto_20525 ) ) ( not ( = ?auto_20523 ?auto_20524 ) ) ( not ( = ?auto_20523 ?auto_20525 ) ) ( not ( = ?auto_20530 ?auto_20527 ) ) ( HOIST-AT ?auto_20529 ?auto_20530 ) ( not ( = ?auto_20533 ?auto_20529 ) ) ( AVAILABLE ?auto_20529 ) ( SURFACE-AT ?auto_20525 ?auto_20530 ) ( ON ?auto_20525 ?auto_20531 ) ( CLEAR ?auto_20525 ) ( not ( = ?auto_20524 ?auto_20531 ) ) ( not ( = ?auto_20525 ?auto_20531 ) ) ( not ( = ?auto_20523 ?auto_20531 ) ) ( IS-CRATE ?auto_20524 ) ( not ( = ?auto_20532 ?auto_20527 ) ) ( not ( = ?auto_20530 ?auto_20532 ) ) ( HOIST-AT ?auto_20537 ?auto_20532 ) ( not ( = ?auto_20533 ?auto_20537 ) ) ( not ( = ?auto_20529 ?auto_20537 ) ) ( AVAILABLE ?auto_20537 ) ( SURFACE-AT ?auto_20524 ?auto_20532 ) ( ON ?auto_20524 ?auto_20536 ) ( CLEAR ?auto_20524 ) ( not ( = ?auto_20524 ?auto_20536 ) ) ( not ( = ?auto_20525 ?auto_20536 ) ) ( not ( = ?auto_20523 ?auto_20536 ) ) ( not ( = ?auto_20531 ?auto_20536 ) ) ( SURFACE-AT ?auto_20522 ?auto_20527 ) ( CLEAR ?auto_20522 ) ( IS-CRATE ?auto_20523 ) ( not ( = ?auto_20522 ?auto_20523 ) ) ( not ( = ?auto_20524 ?auto_20522 ) ) ( not ( = ?auto_20525 ?auto_20522 ) ) ( not ( = ?auto_20531 ?auto_20522 ) ) ( not ( = ?auto_20536 ?auto_20522 ) ) ( AVAILABLE ?auto_20533 ) ( not ( = ?auto_20535 ?auto_20527 ) ) ( not ( = ?auto_20530 ?auto_20535 ) ) ( not ( = ?auto_20532 ?auto_20535 ) ) ( HOIST-AT ?auto_20526 ?auto_20535 ) ( not ( = ?auto_20533 ?auto_20526 ) ) ( not ( = ?auto_20529 ?auto_20526 ) ) ( not ( = ?auto_20537 ?auto_20526 ) ) ( AVAILABLE ?auto_20526 ) ( SURFACE-AT ?auto_20523 ?auto_20535 ) ( ON ?auto_20523 ?auto_20528 ) ( CLEAR ?auto_20523 ) ( not ( = ?auto_20524 ?auto_20528 ) ) ( not ( = ?auto_20525 ?auto_20528 ) ) ( not ( = ?auto_20523 ?auto_20528 ) ) ( not ( = ?auto_20531 ?auto_20528 ) ) ( not ( = ?auto_20536 ?auto_20528 ) ) ( not ( = ?auto_20522 ?auto_20528 ) ) ( TRUCK-AT ?auto_20534 ?auto_20527 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20523 ?auto_20524 ?auto_20525 )
      ( MAKE-3CRATE-VERIFY ?auto_20522 ?auto_20523 ?auto_20524 ?auto_20525 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20552 - SURFACE
      ?auto_20553 - SURFACE
    )
    :vars
    (
      ?auto_20554 - HOIST
      ?auto_20555 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20554 ?auto_20555 ) ( SURFACE-AT ?auto_20552 ?auto_20555 ) ( CLEAR ?auto_20552 ) ( LIFTING ?auto_20554 ?auto_20553 ) ( IS-CRATE ?auto_20553 ) ( not ( = ?auto_20552 ?auto_20553 ) ) )
    :subtasks
    ( ( !DROP ?auto_20554 ?auto_20553 ?auto_20552 ?auto_20555 )
      ( MAKE-1CRATE-VERIFY ?auto_20552 ?auto_20553 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20556 - SURFACE
      ?auto_20557 - SURFACE
      ?auto_20558 - SURFACE
    )
    :vars
    (
      ?auto_20559 - HOIST
      ?auto_20560 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20559 ?auto_20560 ) ( SURFACE-AT ?auto_20557 ?auto_20560 ) ( CLEAR ?auto_20557 ) ( LIFTING ?auto_20559 ?auto_20558 ) ( IS-CRATE ?auto_20558 ) ( not ( = ?auto_20557 ?auto_20558 ) ) ( ON ?auto_20557 ?auto_20556 ) ( not ( = ?auto_20556 ?auto_20557 ) ) ( not ( = ?auto_20556 ?auto_20558 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20557 ?auto_20558 )
      ( MAKE-2CRATE-VERIFY ?auto_20556 ?auto_20557 ?auto_20558 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20561 - SURFACE
      ?auto_20562 - SURFACE
      ?auto_20563 - SURFACE
      ?auto_20564 - SURFACE
    )
    :vars
    (
      ?auto_20565 - HOIST
      ?auto_20566 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20565 ?auto_20566 ) ( SURFACE-AT ?auto_20563 ?auto_20566 ) ( CLEAR ?auto_20563 ) ( LIFTING ?auto_20565 ?auto_20564 ) ( IS-CRATE ?auto_20564 ) ( not ( = ?auto_20563 ?auto_20564 ) ) ( ON ?auto_20562 ?auto_20561 ) ( ON ?auto_20563 ?auto_20562 ) ( not ( = ?auto_20561 ?auto_20562 ) ) ( not ( = ?auto_20561 ?auto_20563 ) ) ( not ( = ?auto_20561 ?auto_20564 ) ) ( not ( = ?auto_20562 ?auto_20563 ) ) ( not ( = ?auto_20562 ?auto_20564 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20563 ?auto_20564 )
      ( MAKE-3CRATE-VERIFY ?auto_20561 ?auto_20562 ?auto_20563 ?auto_20564 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20567 - SURFACE
      ?auto_20568 - SURFACE
      ?auto_20569 - SURFACE
      ?auto_20570 - SURFACE
      ?auto_20571 - SURFACE
    )
    :vars
    (
      ?auto_20572 - HOIST
      ?auto_20573 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20572 ?auto_20573 ) ( SURFACE-AT ?auto_20570 ?auto_20573 ) ( CLEAR ?auto_20570 ) ( LIFTING ?auto_20572 ?auto_20571 ) ( IS-CRATE ?auto_20571 ) ( not ( = ?auto_20570 ?auto_20571 ) ) ( ON ?auto_20568 ?auto_20567 ) ( ON ?auto_20569 ?auto_20568 ) ( ON ?auto_20570 ?auto_20569 ) ( not ( = ?auto_20567 ?auto_20568 ) ) ( not ( = ?auto_20567 ?auto_20569 ) ) ( not ( = ?auto_20567 ?auto_20570 ) ) ( not ( = ?auto_20567 ?auto_20571 ) ) ( not ( = ?auto_20568 ?auto_20569 ) ) ( not ( = ?auto_20568 ?auto_20570 ) ) ( not ( = ?auto_20568 ?auto_20571 ) ) ( not ( = ?auto_20569 ?auto_20570 ) ) ( not ( = ?auto_20569 ?auto_20571 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20570 ?auto_20571 )
      ( MAKE-4CRATE-VERIFY ?auto_20567 ?auto_20568 ?auto_20569 ?auto_20570 ?auto_20571 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20574 - SURFACE
      ?auto_20575 - SURFACE
    )
    :vars
    (
      ?auto_20576 - HOIST
      ?auto_20577 - PLACE
      ?auto_20578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20576 ?auto_20577 ) ( SURFACE-AT ?auto_20574 ?auto_20577 ) ( CLEAR ?auto_20574 ) ( IS-CRATE ?auto_20575 ) ( not ( = ?auto_20574 ?auto_20575 ) ) ( TRUCK-AT ?auto_20578 ?auto_20577 ) ( AVAILABLE ?auto_20576 ) ( IN ?auto_20575 ?auto_20578 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20576 ?auto_20575 ?auto_20578 ?auto_20577 )
      ( MAKE-1CRATE ?auto_20574 ?auto_20575 )
      ( MAKE-1CRATE-VERIFY ?auto_20574 ?auto_20575 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20579 - SURFACE
      ?auto_20580 - SURFACE
      ?auto_20581 - SURFACE
    )
    :vars
    (
      ?auto_20583 - HOIST
      ?auto_20582 - PLACE
      ?auto_20584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20583 ?auto_20582 ) ( SURFACE-AT ?auto_20580 ?auto_20582 ) ( CLEAR ?auto_20580 ) ( IS-CRATE ?auto_20581 ) ( not ( = ?auto_20580 ?auto_20581 ) ) ( TRUCK-AT ?auto_20584 ?auto_20582 ) ( AVAILABLE ?auto_20583 ) ( IN ?auto_20581 ?auto_20584 ) ( ON ?auto_20580 ?auto_20579 ) ( not ( = ?auto_20579 ?auto_20580 ) ) ( not ( = ?auto_20579 ?auto_20581 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20580 ?auto_20581 )
      ( MAKE-2CRATE-VERIFY ?auto_20579 ?auto_20580 ?auto_20581 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20585 - SURFACE
      ?auto_20586 - SURFACE
      ?auto_20587 - SURFACE
      ?auto_20588 - SURFACE
    )
    :vars
    (
      ?auto_20590 - HOIST
      ?auto_20589 - PLACE
      ?auto_20591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20590 ?auto_20589 ) ( SURFACE-AT ?auto_20587 ?auto_20589 ) ( CLEAR ?auto_20587 ) ( IS-CRATE ?auto_20588 ) ( not ( = ?auto_20587 ?auto_20588 ) ) ( TRUCK-AT ?auto_20591 ?auto_20589 ) ( AVAILABLE ?auto_20590 ) ( IN ?auto_20588 ?auto_20591 ) ( ON ?auto_20587 ?auto_20586 ) ( not ( = ?auto_20586 ?auto_20587 ) ) ( not ( = ?auto_20586 ?auto_20588 ) ) ( ON ?auto_20586 ?auto_20585 ) ( not ( = ?auto_20585 ?auto_20586 ) ) ( not ( = ?auto_20585 ?auto_20587 ) ) ( not ( = ?auto_20585 ?auto_20588 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20586 ?auto_20587 ?auto_20588 )
      ( MAKE-3CRATE-VERIFY ?auto_20585 ?auto_20586 ?auto_20587 ?auto_20588 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20592 - SURFACE
      ?auto_20593 - SURFACE
      ?auto_20594 - SURFACE
      ?auto_20595 - SURFACE
      ?auto_20596 - SURFACE
    )
    :vars
    (
      ?auto_20598 - HOIST
      ?auto_20597 - PLACE
      ?auto_20599 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20598 ?auto_20597 ) ( SURFACE-AT ?auto_20595 ?auto_20597 ) ( CLEAR ?auto_20595 ) ( IS-CRATE ?auto_20596 ) ( not ( = ?auto_20595 ?auto_20596 ) ) ( TRUCK-AT ?auto_20599 ?auto_20597 ) ( AVAILABLE ?auto_20598 ) ( IN ?auto_20596 ?auto_20599 ) ( ON ?auto_20595 ?auto_20594 ) ( not ( = ?auto_20594 ?auto_20595 ) ) ( not ( = ?auto_20594 ?auto_20596 ) ) ( ON ?auto_20593 ?auto_20592 ) ( ON ?auto_20594 ?auto_20593 ) ( not ( = ?auto_20592 ?auto_20593 ) ) ( not ( = ?auto_20592 ?auto_20594 ) ) ( not ( = ?auto_20592 ?auto_20595 ) ) ( not ( = ?auto_20592 ?auto_20596 ) ) ( not ( = ?auto_20593 ?auto_20594 ) ) ( not ( = ?auto_20593 ?auto_20595 ) ) ( not ( = ?auto_20593 ?auto_20596 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20594 ?auto_20595 ?auto_20596 )
      ( MAKE-4CRATE-VERIFY ?auto_20592 ?auto_20593 ?auto_20594 ?auto_20595 ?auto_20596 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20600 - SURFACE
      ?auto_20601 - SURFACE
    )
    :vars
    (
      ?auto_20603 - HOIST
      ?auto_20602 - PLACE
      ?auto_20605 - TRUCK
      ?auto_20604 - SURFACE
      ?auto_20606 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20603 ?auto_20602 ) ( SURFACE-AT ?auto_20600 ?auto_20602 ) ( CLEAR ?auto_20600 ) ( IS-CRATE ?auto_20601 ) ( not ( = ?auto_20600 ?auto_20601 ) ) ( AVAILABLE ?auto_20603 ) ( IN ?auto_20601 ?auto_20605 ) ( ON ?auto_20600 ?auto_20604 ) ( not ( = ?auto_20604 ?auto_20600 ) ) ( not ( = ?auto_20604 ?auto_20601 ) ) ( TRUCK-AT ?auto_20605 ?auto_20606 ) ( not ( = ?auto_20606 ?auto_20602 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20605 ?auto_20606 ?auto_20602 )
      ( MAKE-2CRATE ?auto_20604 ?auto_20600 ?auto_20601 )
      ( MAKE-1CRATE-VERIFY ?auto_20600 ?auto_20601 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20607 - SURFACE
      ?auto_20608 - SURFACE
      ?auto_20609 - SURFACE
    )
    :vars
    (
      ?auto_20611 - HOIST
      ?auto_20610 - PLACE
      ?auto_20612 - TRUCK
      ?auto_20613 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20611 ?auto_20610 ) ( SURFACE-AT ?auto_20608 ?auto_20610 ) ( CLEAR ?auto_20608 ) ( IS-CRATE ?auto_20609 ) ( not ( = ?auto_20608 ?auto_20609 ) ) ( AVAILABLE ?auto_20611 ) ( IN ?auto_20609 ?auto_20612 ) ( ON ?auto_20608 ?auto_20607 ) ( not ( = ?auto_20607 ?auto_20608 ) ) ( not ( = ?auto_20607 ?auto_20609 ) ) ( TRUCK-AT ?auto_20612 ?auto_20613 ) ( not ( = ?auto_20613 ?auto_20610 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20608 ?auto_20609 )
      ( MAKE-2CRATE-VERIFY ?auto_20607 ?auto_20608 ?auto_20609 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20614 - SURFACE
      ?auto_20615 - SURFACE
      ?auto_20616 - SURFACE
      ?auto_20617 - SURFACE
    )
    :vars
    (
      ?auto_20619 - HOIST
      ?auto_20620 - PLACE
      ?auto_20621 - TRUCK
      ?auto_20618 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20619 ?auto_20620 ) ( SURFACE-AT ?auto_20616 ?auto_20620 ) ( CLEAR ?auto_20616 ) ( IS-CRATE ?auto_20617 ) ( not ( = ?auto_20616 ?auto_20617 ) ) ( AVAILABLE ?auto_20619 ) ( IN ?auto_20617 ?auto_20621 ) ( ON ?auto_20616 ?auto_20615 ) ( not ( = ?auto_20615 ?auto_20616 ) ) ( not ( = ?auto_20615 ?auto_20617 ) ) ( TRUCK-AT ?auto_20621 ?auto_20618 ) ( not ( = ?auto_20618 ?auto_20620 ) ) ( ON ?auto_20615 ?auto_20614 ) ( not ( = ?auto_20614 ?auto_20615 ) ) ( not ( = ?auto_20614 ?auto_20616 ) ) ( not ( = ?auto_20614 ?auto_20617 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20615 ?auto_20616 ?auto_20617 )
      ( MAKE-3CRATE-VERIFY ?auto_20614 ?auto_20615 ?auto_20616 ?auto_20617 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20622 - SURFACE
      ?auto_20623 - SURFACE
      ?auto_20624 - SURFACE
      ?auto_20625 - SURFACE
      ?auto_20626 - SURFACE
    )
    :vars
    (
      ?auto_20628 - HOIST
      ?auto_20629 - PLACE
      ?auto_20630 - TRUCK
      ?auto_20627 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20628 ?auto_20629 ) ( SURFACE-AT ?auto_20625 ?auto_20629 ) ( CLEAR ?auto_20625 ) ( IS-CRATE ?auto_20626 ) ( not ( = ?auto_20625 ?auto_20626 ) ) ( AVAILABLE ?auto_20628 ) ( IN ?auto_20626 ?auto_20630 ) ( ON ?auto_20625 ?auto_20624 ) ( not ( = ?auto_20624 ?auto_20625 ) ) ( not ( = ?auto_20624 ?auto_20626 ) ) ( TRUCK-AT ?auto_20630 ?auto_20627 ) ( not ( = ?auto_20627 ?auto_20629 ) ) ( ON ?auto_20623 ?auto_20622 ) ( ON ?auto_20624 ?auto_20623 ) ( not ( = ?auto_20622 ?auto_20623 ) ) ( not ( = ?auto_20622 ?auto_20624 ) ) ( not ( = ?auto_20622 ?auto_20625 ) ) ( not ( = ?auto_20622 ?auto_20626 ) ) ( not ( = ?auto_20623 ?auto_20624 ) ) ( not ( = ?auto_20623 ?auto_20625 ) ) ( not ( = ?auto_20623 ?auto_20626 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20624 ?auto_20625 ?auto_20626 )
      ( MAKE-4CRATE-VERIFY ?auto_20622 ?auto_20623 ?auto_20624 ?auto_20625 ?auto_20626 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20631 - SURFACE
      ?auto_20632 - SURFACE
    )
    :vars
    (
      ?auto_20634 - HOIST
      ?auto_20636 - PLACE
      ?auto_20635 - SURFACE
      ?auto_20637 - TRUCK
      ?auto_20633 - PLACE
      ?auto_20638 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20634 ?auto_20636 ) ( SURFACE-AT ?auto_20631 ?auto_20636 ) ( CLEAR ?auto_20631 ) ( IS-CRATE ?auto_20632 ) ( not ( = ?auto_20631 ?auto_20632 ) ) ( AVAILABLE ?auto_20634 ) ( ON ?auto_20631 ?auto_20635 ) ( not ( = ?auto_20635 ?auto_20631 ) ) ( not ( = ?auto_20635 ?auto_20632 ) ) ( TRUCK-AT ?auto_20637 ?auto_20633 ) ( not ( = ?auto_20633 ?auto_20636 ) ) ( HOIST-AT ?auto_20638 ?auto_20633 ) ( LIFTING ?auto_20638 ?auto_20632 ) ( not ( = ?auto_20634 ?auto_20638 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20638 ?auto_20632 ?auto_20637 ?auto_20633 )
      ( MAKE-2CRATE ?auto_20635 ?auto_20631 ?auto_20632 )
      ( MAKE-1CRATE-VERIFY ?auto_20631 ?auto_20632 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20639 - SURFACE
      ?auto_20640 - SURFACE
      ?auto_20641 - SURFACE
    )
    :vars
    (
      ?auto_20643 - HOIST
      ?auto_20642 - PLACE
      ?auto_20645 - TRUCK
      ?auto_20646 - PLACE
      ?auto_20644 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20643 ?auto_20642 ) ( SURFACE-AT ?auto_20640 ?auto_20642 ) ( CLEAR ?auto_20640 ) ( IS-CRATE ?auto_20641 ) ( not ( = ?auto_20640 ?auto_20641 ) ) ( AVAILABLE ?auto_20643 ) ( ON ?auto_20640 ?auto_20639 ) ( not ( = ?auto_20639 ?auto_20640 ) ) ( not ( = ?auto_20639 ?auto_20641 ) ) ( TRUCK-AT ?auto_20645 ?auto_20646 ) ( not ( = ?auto_20646 ?auto_20642 ) ) ( HOIST-AT ?auto_20644 ?auto_20646 ) ( LIFTING ?auto_20644 ?auto_20641 ) ( not ( = ?auto_20643 ?auto_20644 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20640 ?auto_20641 )
      ( MAKE-2CRATE-VERIFY ?auto_20639 ?auto_20640 ?auto_20641 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20647 - SURFACE
      ?auto_20648 - SURFACE
      ?auto_20649 - SURFACE
      ?auto_20650 - SURFACE
    )
    :vars
    (
      ?auto_20653 - HOIST
      ?auto_20654 - PLACE
      ?auto_20655 - TRUCK
      ?auto_20652 - PLACE
      ?auto_20651 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20653 ?auto_20654 ) ( SURFACE-AT ?auto_20649 ?auto_20654 ) ( CLEAR ?auto_20649 ) ( IS-CRATE ?auto_20650 ) ( not ( = ?auto_20649 ?auto_20650 ) ) ( AVAILABLE ?auto_20653 ) ( ON ?auto_20649 ?auto_20648 ) ( not ( = ?auto_20648 ?auto_20649 ) ) ( not ( = ?auto_20648 ?auto_20650 ) ) ( TRUCK-AT ?auto_20655 ?auto_20652 ) ( not ( = ?auto_20652 ?auto_20654 ) ) ( HOIST-AT ?auto_20651 ?auto_20652 ) ( LIFTING ?auto_20651 ?auto_20650 ) ( not ( = ?auto_20653 ?auto_20651 ) ) ( ON ?auto_20648 ?auto_20647 ) ( not ( = ?auto_20647 ?auto_20648 ) ) ( not ( = ?auto_20647 ?auto_20649 ) ) ( not ( = ?auto_20647 ?auto_20650 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20648 ?auto_20649 ?auto_20650 )
      ( MAKE-3CRATE-VERIFY ?auto_20647 ?auto_20648 ?auto_20649 ?auto_20650 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20656 - SURFACE
      ?auto_20657 - SURFACE
      ?auto_20658 - SURFACE
      ?auto_20659 - SURFACE
      ?auto_20660 - SURFACE
    )
    :vars
    (
      ?auto_20663 - HOIST
      ?auto_20664 - PLACE
      ?auto_20665 - TRUCK
      ?auto_20662 - PLACE
      ?auto_20661 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20663 ?auto_20664 ) ( SURFACE-AT ?auto_20659 ?auto_20664 ) ( CLEAR ?auto_20659 ) ( IS-CRATE ?auto_20660 ) ( not ( = ?auto_20659 ?auto_20660 ) ) ( AVAILABLE ?auto_20663 ) ( ON ?auto_20659 ?auto_20658 ) ( not ( = ?auto_20658 ?auto_20659 ) ) ( not ( = ?auto_20658 ?auto_20660 ) ) ( TRUCK-AT ?auto_20665 ?auto_20662 ) ( not ( = ?auto_20662 ?auto_20664 ) ) ( HOIST-AT ?auto_20661 ?auto_20662 ) ( LIFTING ?auto_20661 ?auto_20660 ) ( not ( = ?auto_20663 ?auto_20661 ) ) ( ON ?auto_20657 ?auto_20656 ) ( ON ?auto_20658 ?auto_20657 ) ( not ( = ?auto_20656 ?auto_20657 ) ) ( not ( = ?auto_20656 ?auto_20658 ) ) ( not ( = ?auto_20656 ?auto_20659 ) ) ( not ( = ?auto_20656 ?auto_20660 ) ) ( not ( = ?auto_20657 ?auto_20658 ) ) ( not ( = ?auto_20657 ?auto_20659 ) ) ( not ( = ?auto_20657 ?auto_20660 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20658 ?auto_20659 ?auto_20660 )
      ( MAKE-4CRATE-VERIFY ?auto_20656 ?auto_20657 ?auto_20658 ?auto_20659 ?auto_20660 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20666 - SURFACE
      ?auto_20667 - SURFACE
    )
    :vars
    (
      ?auto_20671 - HOIST
      ?auto_20672 - PLACE
      ?auto_20668 - SURFACE
      ?auto_20673 - TRUCK
      ?auto_20670 - PLACE
      ?auto_20669 - HOIST
      ?auto_20674 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20671 ?auto_20672 ) ( SURFACE-AT ?auto_20666 ?auto_20672 ) ( CLEAR ?auto_20666 ) ( IS-CRATE ?auto_20667 ) ( not ( = ?auto_20666 ?auto_20667 ) ) ( AVAILABLE ?auto_20671 ) ( ON ?auto_20666 ?auto_20668 ) ( not ( = ?auto_20668 ?auto_20666 ) ) ( not ( = ?auto_20668 ?auto_20667 ) ) ( TRUCK-AT ?auto_20673 ?auto_20670 ) ( not ( = ?auto_20670 ?auto_20672 ) ) ( HOIST-AT ?auto_20669 ?auto_20670 ) ( not ( = ?auto_20671 ?auto_20669 ) ) ( AVAILABLE ?auto_20669 ) ( SURFACE-AT ?auto_20667 ?auto_20670 ) ( ON ?auto_20667 ?auto_20674 ) ( CLEAR ?auto_20667 ) ( not ( = ?auto_20666 ?auto_20674 ) ) ( not ( = ?auto_20667 ?auto_20674 ) ) ( not ( = ?auto_20668 ?auto_20674 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20669 ?auto_20667 ?auto_20674 ?auto_20670 )
      ( MAKE-2CRATE ?auto_20668 ?auto_20666 ?auto_20667 )
      ( MAKE-1CRATE-VERIFY ?auto_20666 ?auto_20667 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20675 - SURFACE
      ?auto_20676 - SURFACE
      ?auto_20677 - SURFACE
    )
    :vars
    (
      ?auto_20682 - HOIST
      ?auto_20681 - PLACE
      ?auto_20678 - TRUCK
      ?auto_20683 - PLACE
      ?auto_20680 - HOIST
      ?auto_20679 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20682 ?auto_20681 ) ( SURFACE-AT ?auto_20676 ?auto_20681 ) ( CLEAR ?auto_20676 ) ( IS-CRATE ?auto_20677 ) ( not ( = ?auto_20676 ?auto_20677 ) ) ( AVAILABLE ?auto_20682 ) ( ON ?auto_20676 ?auto_20675 ) ( not ( = ?auto_20675 ?auto_20676 ) ) ( not ( = ?auto_20675 ?auto_20677 ) ) ( TRUCK-AT ?auto_20678 ?auto_20683 ) ( not ( = ?auto_20683 ?auto_20681 ) ) ( HOIST-AT ?auto_20680 ?auto_20683 ) ( not ( = ?auto_20682 ?auto_20680 ) ) ( AVAILABLE ?auto_20680 ) ( SURFACE-AT ?auto_20677 ?auto_20683 ) ( ON ?auto_20677 ?auto_20679 ) ( CLEAR ?auto_20677 ) ( not ( = ?auto_20676 ?auto_20679 ) ) ( not ( = ?auto_20677 ?auto_20679 ) ) ( not ( = ?auto_20675 ?auto_20679 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20676 ?auto_20677 )
      ( MAKE-2CRATE-VERIFY ?auto_20675 ?auto_20676 ?auto_20677 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20684 - SURFACE
      ?auto_20685 - SURFACE
      ?auto_20686 - SURFACE
      ?auto_20687 - SURFACE
    )
    :vars
    (
      ?auto_20693 - HOIST
      ?auto_20690 - PLACE
      ?auto_20689 - TRUCK
      ?auto_20692 - PLACE
      ?auto_20691 - HOIST
      ?auto_20688 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20693 ?auto_20690 ) ( SURFACE-AT ?auto_20686 ?auto_20690 ) ( CLEAR ?auto_20686 ) ( IS-CRATE ?auto_20687 ) ( not ( = ?auto_20686 ?auto_20687 ) ) ( AVAILABLE ?auto_20693 ) ( ON ?auto_20686 ?auto_20685 ) ( not ( = ?auto_20685 ?auto_20686 ) ) ( not ( = ?auto_20685 ?auto_20687 ) ) ( TRUCK-AT ?auto_20689 ?auto_20692 ) ( not ( = ?auto_20692 ?auto_20690 ) ) ( HOIST-AT ?auto_20691 ?auto_20692 ) ( not ( = ?auto_20693 ?auto_20691 ) ) ( AVAILABLE ?auto_20691 ) ( SURFACE-AT ?auto_20687 ?auto_20692 ) ( ON ?auto_20687 ?auto_20688 ) ( CLEAR ?auto_20687 ) ( not ( = ?auto_20686 ?auto_20688 ) ) ( not ( = ?auto_20687 ?auto_20688 ) ) ( not ( = ?auto_20685 ?auto_20688 ) ) ( ON ?auto_20685 ?auto_20684 ) ( not ( = ?auto_20684 ?auto_20685 ) ) ( not ( = ?auto_20684 ?auto_20686 ) ) ( not ( = ?auto_20684 ?auto_20687 ) ) ( not ( = ?auto_20684 ?auto_20688 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20685 ?auto_20686 ?auto_20687 )
      ( MAKE-3CRATE-VERIFY ?auto_20684 ?auto_20685 ?auto_20686 ?auto_20687 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20694 - SURFACE
      ?auto_20695 - SURFACE
      ?auto_20696 - SURFACE
      ?auto_20697 - SURFACE
      ?auto_20698 - SURFACE
    )
    :vars
    (
      ?auto_20704 - HOIST
      ?auto_20701 - PLACE
      ?auto_20700 - TRUCK
      ?auto_20703 - PLACE
      ?auto_20702 - HOIST
      ?auto_20699 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20704 ?auto_20701 ) ( SURFACE-AT ?auto_20697 ?auto_20701 ) ( CLEAR ?auto_20697 ) ( IS-CRATE ?auto_20698 ) ( not ( = ?auto_20697 ?auto_20698 ) ) ( AVAILABLE ?auto_20704 ) ( ON ?auto_20697 ?auto_20696 ) ( not ( = ?auto_20696 ?auto_20697 ) ) ( not ( = ?auto_20696 ?auto_20698 ) ) ( TRUCK-AT ?auto_20700 ?auto_20703 ) ( not ( = ?auto_20703 ?auto_20701 ) ) ( HOIST-AT ?auto_20702 ?auto_20703 ) ( not ( = ?auto_20704 ?auto_20702 ) ) ( AVAILABLE ?auto_20702 ) ( SURFACE-AT ?auto_20698 ?auto_20703 ) ( ON ?auto_20698 ?auto_20699 ) ( CLEAR ?auto_20698 ) ( not ( = ?auto_20697 ?auto_20699 ) ) ( not ( = ?auto_20698 ?auto_20699 ) ) ( not ( = ?auto_20696 ?auto_20699 ) ) ( ON ?auto_20695 ?auto_20694 ) ( ON ?auto_20696 ?auto_20695 ) ( not ( = ?auto_20694 ?auto_20695 ) ) ( not ( = ?auto_20694 ?auto_20696 ) ) ( not ( = ?auto_20694 ?auto_20697 ) ) ( not ( = ?auto_20694 ?auto_20698 ) ) ( not ( = ?auto_20694 ?auto_20699 ) ) ( not ( = ?auto_20695 ?auto_20696 ) ) ( not ( = ?auto_20695 ?auto_20697 ) ) ( not ( = ?auto_20695 ?auto_20698 ) ) ( not ( = ?auto_20695 ?auto_20699 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20696 ?auto_20697 ?auto_20698 )
      ( MAKE-4CRATE-VERIFY ?auto_20694 ?auto_20695 ?auto_20696 ?auto_20697 ?auto_20698 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20705 - SURFACE
      ?auto_20706 - SURFACE
    )
    :vars
    (
      ?auto_20713 - HOIST
      ?auto_20710 - PLACE
      ?auto_20709 - SURFACE
      ?auto_20712 - PLACE
      ?auto_20711 - HOIST
      ?auto_20707 - SURFACE
      ?auto_20708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20713 ?auto_20710 ) ( SURFACE-AT ?auto_20705 ?auto_20710 ) ( CLEAR ?auto_20705 ) ( IS-CRATE ?auto_20706 ) ( not ( = ?auto_20705 ?auto_20706 ) ) ( AVAILABLE ?auto_20713 ) ( ON ?auto_20705 ?auto_20709 ) ( not ( = ?auto_20709 ?auto_20705 ) ) ( not ( = ?auto_20709 ?auto_20706 ) ) ( not ( = ?auto_20712 ?auto_20710 ) ) ( HOIST-AT ?auto_20711 ?auto_20712 ) ( not ( = ?auto_20713 ?auto_20711 ) ) ( AVAILABLE ?auto_20711 ) ( SURFACE-AT ?auto_20706 ?auto_20712 ) ( ON ?auto_20706 ?auto_20707 ) ( CLEAR ?auto_20706 ) ( not ( = ?auto_20705 ?auto_20707 ) ) ( not ( = ?auto_20706 ?auto_20707 ) ) ( not ( = ?auto_20709 ?auto_20707 ) ) ( TRUCK-AT ?auto_20708 ?auto_20710 ) )
    :subtasks
    ( ( !DRIVE ?auto_20708 ?auto_20710 ?auto_20712 )
      ( MAKE-2CRATE ?auto_20709 ?auto_20705 ?auto_20706 )
      ( MAKE-1CRATE-VERIFY ?auto_20705 ?auto_20706 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20714 - SURFACE
      ?auto_20715 - SURFACE
      ?auto_20716 - SURFACE
    )
    :vars
    (
      ?auto_20718 - HOIST
      ?auto_20719 - PLACE
      ?auto_20720 - PLACE
      ?auto_20717 - HOIST
      ?auto_20722 - SURFACE
      ?auto_20721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20718 ?auto_20719 ) ( SURFACE-AT ?auto_20715 ?auto_20719 ) ( CLEAR ?auto_20715 ) ( IS-CRATE ?auto_20716 ) ( not ( = ?auto_20715 ?auto_20716 ) ) ( AVAILABLE ?auto_20718 ) ( ON ?auto_20715 ?auto_20714 ) ( not ( = ?auto_20714 ?auto_20715 ) ) ( not ( = ?auto_20714 ?auto_20716 ) ) ( not ( = ?auto_20720 ?auto_20719 ) ) ( HOIST-AT ?auto_20717 ?auto_20720 ) ( not ( = ?auto_20718 ?auto_20717 ) ) ( AVAILABLE ?auto_20717 ) ( SURFACE-AT ?auto_20716 ?auto_20720 ) ( ON ?auto_20716 ?auto_20722 ) ( CLEAR ?auto_20716 ) ( not ( = ?auto_20715 ?auto_20722 ) ) ( not ( = ?auto_20716 ?auto_20722 ) ) ( not ( = ?auto_20714 ?auto_20722 ) ) ( TRUCK-AT ?auto_20721 ?auto_20719 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20715 ?auto_20716 )
      ( MAKE-2CRATE-VERIFY ?auto_20714 ?auto_20715 ?auto_20716 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20723 - SURFACE
      ?auto_20724 - SURFACE
      ?auto_20725 - SURFACE
      ?auto_20726 - SURFACE
    )
    :vars
    (
      ?auto_20728 - HOIST
      ?auto_20727 - PLACE
      ?auto_20731 - PLACE
      ?auto_20732 - HOIST
      ?auto_20729 - SURFACE
      ?auto_20730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20728 ?auto_20727 ) ( SURFACE-AT ?auto_20725 ?auto_20727 ) ( CLEAR ?auto_20725 ) ( IS-CRATE ?auto_20726 ) ( not ( = ?auto_20725 ?auto_20726 ) ) ( AVAILABLE ?auto_20728 ) ( ON ?auto_20725 ?auto_20724 ) ( not ( = ?auto_20724 ?auto_20725 ) ) ( not ( = ?auto_20724 ?auto_20726 ) ) ( not ( = ?auto_20731 ?auto_20727 ) ) ( HOIST-AT ?auto_20732 ?auto_20731 ) ( not ( = ?auto_20728 ?auto_20732 ) ) ( AVAILABLE ?auto_20732 ) ( SURFACE-AT ?auto_20726 ?auto_20731 ) ( ON ?auto_20726 ?auto_20729 ) ( CLEAR ?auto_20726 ) ( not ( = ?auto_20725 ?auto_20729 ) ) ( not ( = ?auto_20726 ?auto_20729 ) ) ( not ( = ?auto_20724 ?auto_20729 ) ) ( TRUCK-AT ?auto_20730 ?auto_20727 ) ( ON ?auto_20724 ?auto_20723 ) ( not ( = ?auto_20723 ?auto_20724 ) ) ( not ( = ?auto_20723 ?auto_20725 ) ) ( not ( = ?auto_20723 ?auto_20726 ) ) ( not ( = ?auto_20723 ?auto_20729 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20724 ?auto_20725 ?auto_20726 )
      ( MAKE-3CRATE-VERIFY ?auto_20723 ?auto_20724 ?auto_20725 ?auto_20726 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20733 - SURFACE
      ?auto_20734 - SURFACE
      ?auto_20735 - SURFACE
      ?auto_20736 - SURFACE
      ?auto_20737 - SURFACE
    )
    :vars
    (
      ?auto_20739 - HOIST
      ?auto_20738 - PLACE
      ?auto_20742 - PLACE
      ?auto_20743 - HOIST
      ?auto_20740 - SURFACE
      ?auto_20741 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20739 ?auto_20738 ) ( SURFACE-AT ?auto_20736 ?auto_20738 ) ( CLEAR ?auto_20736 ) ( IS-CRATE ?auto_20737 ) ( not ( = ?auto_20736 ?auto_20737 ) ) ( AVAILABLE ?auto_20739 ) ( ON ?auto_20736 ?auto_20735 ) ( not ( = ?auto_20735 ?auto_20736 ) ) ( not ( = ?auto_20735 ?auto_20737 ) ) ( not ( = ?auto_20742 ?auto_20738 ) ) ( HOIST-AT ?auto_20743 ?auto_20742 ) ( not ( = ?auto_20739 ?auto_20743 ) ) ( AVAILABLE ?auto_20743 ) ( SURFACE-AT ?auto_20737 ?auto_20742 ) ( ON ?auto_20737 ?auto_20740 ) ( CLEAR ?auto_20737 ) ( not ( = ?auto_20736 ?auto_20740 ) ) ( not ( = ?auto_20737 ?auto_20740 ) ) ( not ( = ?auto_20735 ?auto_20740 ) ) ( TRUCK-AT ?auto_20741 ?auto_20738 ) ( ON ?auto_20734 ?auto_20733 ) ( ON ?auto_20735 ?auto_20734 ) ( not ( = ?auto_20733 ?auto_20734 ) ) ( not ( = ?auto_20733 ?auto_20735 ) ) ( not ( = ?auto_20733 ?auto_20736 ) ) ( not ( = ?auto_20733 ?auto_20737 ) ) ( not ( = ?auto_20733 ?auto_20740 ) ) ( not ( = ?auto_20734 ?auto_20735 ) ) ( not ( = ?auto_20734 ?auto_20736 ) ) ( not ( = ?auto_20734 ?auto_20737 ) ) ( not ( = ?auto_20734 ?auto_20740 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20735 ?auto_20736 ?auto_20737 )
      ( MAKE-4CRATE-VERIFY ?auto_20733 ?auto_20734 ?auto_20735 ?auto_20736 ?auto_20737 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20744 - SURFACE
      ?auto_20745 - SURFACE
    )
    :vars
    (
      ?auto_20747 - HOIST
      ?auto_20746 - PLACE
      ?auto_20749 - SURFACE
      ?auto_20751 - PLACE
      ?auto_20752 - HOIST
      ?auto_20748 - SURFACE
      ?auto_20750 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20747 ?auto_20746 ) ( IS-CRATE ?auto_20745 ) ( not ( = ?auto_20744 ?auto_20745 ) ) ( not ( = ?auto_20749 ?auto_20744 ) ) ( not ( = ?auto_20749 ?auto_20745 ) ) ( not ( = ?auto_20751 ?auto_20746 ) ) ( HOIST-AT ?auto_20752 ?auto_20751 ) ( not ( = ?auto_20747 ?auto_20752 ) ) ( AVAILABLE ?auto_20752 ) ( SURFACE-AT ?auto_20745 ?auto_20751 ) ( ON ?auto_20745 ?auto_20748 ) ( CLEAR ?auto_20745 ) ( not ( = ?auto_20744 ?auto_20748 ) ) ( not ( = ?auto_20745 ?auto_20748 ) ) ( not ( = ?auto_20749 ?auto_20748 ) ) ( TRUCK-AT ?auto_20750 ?auto_20746 ) ( SURFACE-AT ?auto_20749 ?auto_20746 ) ( CLEAR ?auto_20749 ) ( LIFTING ?auto_20747 ?auto_20744 ) ( IS-CRATE ?auto_20744 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20749 ?auto_20744 )
      ( MAKE-2CRATE ?auto_20749 ?auto_20744 ?auto_20745 )
      ( MAKE-1CRATE-VERIFY ?auto_20744 ?auto_20745 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20753 - SURFACE
      ?auto_20754 - SURFACE
      ?auto_20755 - SURFACE
    )
    :vars
    (
      ?auto_20761 - HOIST
      ?auto_20758 - PLACE
      ?auto_20760 - PLACE
      ?auto_20756 - HOIST
      ?auto_20759 - SURFACE
      ?auto_20757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20761 ?auto_20758 ) ( IS-CRATE ?auto_20755 ) ( not ( = ?auto_20754 ?auto_20755 ) ) ( not ( = ?auto_20753 ?auto_20754 ) ) ( not ( = ?auto_20753 ?auto_20755 ) ) ( not ( = ?auto_20760 ?auto_20758 ) ) ( HOIST-AT ?auto_20756 ?auto_20760 ) ( not ( = ?auto_20761 ?auto_20756 ) ) ( AVAILABLE ?auto_20756 ) ( SURFACE-AT ?auto_20755 ?auto_20760 ) ( ON ?auto_20755 ?auto_20759 ) ( CLEAR ?auto_20755 ) ( not ( = ?auto_20754 ?auto_20759 ) ) ( not ( = ?auto_20755 ?auto_20759 ) ) ( not ( = ?auto_20753 ?auto_20759 ) ) ( TRUCK-AT ?auto_20757 ?auto_20758 ) ( SURFACE-AT ?auto_20753 ?auto_20758 ) ( CLEAR ?auto_20753 ) ( LIFTING ?auto_20761 ?auto_20754 ) ( IS-CRATE ?auto_20754 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20754 ?auto_20755 )
      ( MAKE-2CRATE-VERIFY ?auto_20753 ?auto_20754 ?auto_20755 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20762 - SURFACE
      ?auto_20763 - SURFACE
      ?auto_20764 - SURFACE
      ?auto_20765 - SURFACE
    )
    :vars
    (
      ?auto_20767 - HOIST
      ?auto_20766 - PLACE
      ?auto_20771 - PLACE
      ?auto_20770 - HOIST
      ?auto_20769 - SURFACE
      ?auto_20768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20767 ?auto_20766 ) ( IS-CRATE ?auto_20765 ) ( not ( = ?auto_20764 ?auto_20765 ) ) ( not ( = ?auto_20763 ?auto_20764 ) ) ( not ( = ?auto_20763 ?auto_20765 ) ) ( not ( = ?auto_20771 ?auto_20766 ) ) ( HOIST-AT ?auto_20770 ?auto_20771 ) ( not ( = ?auto_20767 ?auto_20770 ) ) ( AVAILABLE ?auto_20770 ) ( SURFACE-AT ?auto_20765 ?auto_20771 ) ( ON ?auto_20765 ?auto_20769 ) ( CLEAR ?auto_20765 ) ( not ( = ?auto_20764 ?auto_20769 ) ) ( not ( = ?auto_20765 ?auto_20769 ) ) ( not ( = ?auto_20763 ?auto_20769 ) ) ( TRUCK-AT ?auto_20768 ?auto_20766 ) ( SURFACE-AT ?auto_20763 ?auto_20766 ) ( CLEAR ?auto_20763 ) ( LIFTING ?auto_20767 ?auto_20764 ) ( IS-CRATE ?auto_20764 ) ( ON ?auto_20763 ?auto_20762 ) ( not ( = ?auto_20762 ?auto_20763 ) ) ( not ( = ?auto_20762 ?auto_20764 ) ) ( not ( = ?auto_20762 ?auto_20765 ) ) ( not ( = ?auto_20762 ?auto_20769 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20763 ?auto_20764 ?auto_20765 )
      ( MAKE-3CRATE-VERIFY ?auto_20762 ?auto_20763 ?auto_20764 ?auto_20765 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20772 - SURFACE
      ?auto_20773 - SURFACE
      ?auto_20774 - SURFACE
      ?auto_20775 - SURFACE
      ?auto_20776 - SURFACE
    )
    :vars
    (
      ?auto_20778 - HOIST
      ?auto_20777 - PLACE
      ?auto_20782 - PLACE
      ?auto_20781 - HOIST
      ?auto_20780 - SURFACE
      ?auto_20779 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20778 ?auto_20777 ) ( IS-CRATE ?auto_20776 ) ( not ( = ?auto_20775 ?auto_20776 ) ) ( not ( = ?auto_20774 ?auto_20775 ) ) ( not ( = ?auto_20774 ?auto_20776 ) ) ( not ( = ?auto_20782 ?auto_20777 ) ) ( HOIST-AT ?auto_20781 ?auto_20782 ) ( not ( = ?auto_20778 ?auto_20781 ) ) ( AVAILABLE ?auto_20781 ) ( SURFACE-AT ?auto_20776 ?auto_20782 ) ( ON ?auto_20776 ?auto_20780 ) ( CLEAR ?auto_20776 ) ( not ( = ?auto_20775 ?auto_20780 ) ) ( not ( = ?auto_20776 ?auto_20780 ) ) ( not ( = ?auto_20774 ?auto_20780 ) ) ( TRUCK-AT ?auto_20779 ?auto_20777 ) ( SURFACE-AT ?auto_20774 ?auto_20777 ) ( CLEAR ?auto_20774 ) ( LIFTING ?auto_20778 ?auto_20775 ) ( IS-CRATE ?auto_20775 ) ( ON ?auto_20773 ?auto_20772 ) ( ON ?auto_20774 ?auto_20773 ) ( not ( = ?auto_20772 ?auto_20773 ) ) ( not ( = ?auto_20772 ?auto_20774 ) ) ( not ( = ?auto_20772 ?auto_20775 ) ) ( not ( = ?auto_20772 ?auto_20776 ) ) ( not ( = ?auto_20772 ?auto_20780 ) ) ( not ( = ?auto_20773 ?auto_20774 ) ) ( not ( = ?auto_20773 ?auto_20775 ) ) ( not ( = ?auto_20773 ?auto_20776 ) ) ( not ( = ?auto_20773 ?auto_20780 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20774 ?auto_20775 ?auto_20776 )
      ( MAKE-4CRATE-VERIFY ?auto_20772 ?auto_20773 ?auto_20774 ?auto_20775 ?auto_20776 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20783 - SURFACE
      ?auto_20784 - SURFACE
    )
    :vars
    (
      ?auto_20786 - HOIST
      ?auto_20785 - PLACE
      ?auto_20787 - SURFACE
      ?auto_20791 - PLACE
      ?auto_20790 - HOIST
      ?auto_20789 - SURFACE
      ?auto_20788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20786 ?auto_20785 ) ( IS-CRATE ?auto_20784 ) ( not ( = ?auto_20783 ?auto_20784 ) ) ( not ( = ?auto_20787 ?auto_20783 ) ) ( not ( = ?auto_20787 ?auto_20784 ) ) ( not ( = ?auto_20791 ?auto_20785 ) ) ( HOIST-AT ?auto_20790 ?auto_20791 ) ( not ( = ?auto_20786 ?auto_20790 ) ) ( AVAILABLE ?auto_20790 ) ( SURFACE-AT ?auto_20784 ?auto_20791 ) ( ON ?auto_20784 ?auto_20789 ) ( CLEAR ?auto_20784 ) ( not ( = ?auto_20783 ?auto_20789 ) ) ( not ( = ?auto_20784 ?auto_20789 ) ) ( not ( = ?auto_20787 ?auto_20789 ) ) ( TRUCK-AT ?auto_20788 ?auto_20785 ) ( SURFACE-AT ?auto_20787 ?auto_20785 ) ( CLEAR ?auto_20787 ) ( IS-CRATE ?auto_20783 ) ( AVAILABLE ?auto_20786 ) ( IN ?auto_20783 ?auto_20788 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20786 ?auto_20783 ?auto_20788 ?auto_20785 )
      ( MAKE-2CRATE ?auto_20787 ?auto_20783 ?auto_20784 )
      ( MAKE-1CRATE-VERIFY ?auto_20783 ?auto_20784 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20792 - SURFACE
      ?auto_20793 - SURFACE
      ?auto_20794 - SURFACE
    )
    :vars
    (
      ?auto_20798 - HOIST
      ?auto_20799 - PLACE
      ?auto_20797 - PLACE
      ?auto_20795 - HOIST
      ?auto_20800 - SURFACE
      ?auto_20796 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20798 ?auto_20799 ) ( IS-CRATE ?auto_20794 ) ( not ( = ?auto_20793 ?auto_20794 ) ) ( not ( = ?auto_20792 ?auto_20793 ) ) ( not ( = ?auto_20792 ?auto_20794 ) ) ( not ( = ?auto_20797 ?auto_20799 ) ) ( HOIST-AT ?auto_20795 ?auto_20797 ) ( not ( = ?auto_20798 ?auto_20795 ) ) ( AVAILABLE ?auto_20795 ) ( SURFACE-AT ?auto_20794 ?auto_20797 ) ( ON ?auto_20794 ?auto_20800 ) ( CLEAR ?auto_20794 ) ( not ( = ?auto_20793 ?auto_20800 ) ) ( not ( = ?auto_20794 ?auto_20800 ) ) ( not ( = ?auto_20792 ?auto_20800 ) ) ( TRUCK-AT ?auto_20796 ?auto_20799 ) ( SURFACE-AT ?auto_20792 ?auto_20799 ) ( CLEAR ?auto_20792 ) ( IS-CRATE ?auto_20793 ) ( AVAILABLE ?auto_20798 ) ( IN ?auto_20793 ?auto_20796 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20793 ?auto_20794 )
      ( MAKE-2CRATE-VERIFY ?auto_20792 ?auto_20793 ?auto_20794 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20801 - SURFACE
      ?auto_20802 - SURFACE
      ?auto_20803 - SURFACE
      ?auto_20804 - SURFACE
    )
    :vars
    (
      ?auto_20810 - HOIST
      ?auto_20806 - PLACE
      ?auto_20807 - PLACE
      ?auto_20805 - HOIST
      ?auto_20808 - SURFACE
      ?auto_20809 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20810 ?auto_20806 ) ( IS-CRATE ?auto_20804 ) ( not ( = ?auto_20803 ?auto_20804 ) ) ( not ( = ?auto_20802 ?auto_20803 ) ) ( not ( = ?auto_20802 ?auto_20804 ) ) ( not ( = ?auto_20807 ?auto_20806 ) ) ( HOIST-AT ?auto_20805 ?auto_20807 ) ( not ( = ?auto_20810 ?auto_20805 ) ) ( AVAILABLE ?auto_20805 ) ( SURFACE-AT ?auto_20804 ?auto_20807 ) ( ON ?auto_20804 ?auto_20808 ) ( CLEAR ?auto_20804 ) ( not ( = ?auto_20803 ?auto_20808 ) ) ( not ( = ?auto_20804 ?auto_20808 ) ) ( not ( = ?auto_20802 ?auto_20808 ) ) ( TRUCK-AT ?auto_20809 ?auto_20806 ) ( SURFACE-AT ?auto_20802 ?auto_20806 ) ( CLEAR ?auto_20802 ) ( IS-CRATE ?auto_20803 ) ( AVAILABLE ?auto_20810 ) ( IN ?auto_20803 ?auto_20809 ) ( ON ?auto_20802 ?auto_20801 ) ( not ( = ?auto_20801 ?auto_20802 ) ) ( not ( = ?auto_20801 ?auto_20803 ) ) ( not ( = ?auto_20801 ?auto_20804 ) ) ( not ( = ?auto_20801 ?auto_20808 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20802 ?auto_20803 ?auto_20804 )
      ( MAKE-3CRATE-VERIFY ?auto_20801 ?auto_20802 ?auto_20803 ?auto_20804 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20811 - SURFACE
      ?auto_20812 - SURFACE
      ?auto_20813 - SURFACE
      ?auto_20814 - SURFACE
      ?auto_20815 - SURFACE
    )
    :vars
    (
      ?auto_20821 - HOIST
      ?auto_20817 - PLACE
      ?auto_20818 - PLACE
      ?auto_20816 - HOIST
      ?auto_20819 - SURFACE
      ?auto_20820 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20821 ?auto_20817 ) ( IS-CRATE ?auto_20815 ) ( not ( = ?auto_20814 ?auto_20815 ) ) ( not ( = ?auto_20813 ?auto_20814 ) ) ( not ( = ?auto_20813 ?auto_20815 ) ) ( not ( = ?auto_20818 ?auto_20817 ) ) ( HOIST-AT ?auto_20816 ?auto_20818 ) ( not ( = ?auto_20821 ?auto_20816 ) ) ( AVAILABLE ?auto_20816 ) ( SURFACE-AT ?auto_20815 ?auto_20818 ) ( ON ?auto_20815 ?auto_20819 ) ( CLEAR ?auto_20815 ) ( not ( = ?auto_20814 ?auto_20819 ) ) ( not ( = ?auto_20815 ?auto_20819 ) ) ( not ( = ?auto_20813 ?auto_20819 ) ) ( TRUCK-AT ?auto_20820 ?auto_20817 ) ( SURFACE-AT ?auto_20813 ?auto_20817 ) ( CLEAR ?auto_20813 ) ( IS-CRATE ?auto_20814 ) ( AVAILABLE ?auto_20821 ) ( IN ?auto_20814 ?auto_20820 ) ( ON ?auto_20812 ?auto_20811 ) ( ON ?auto_20813 ?auto_20812 ) ( not ( = ?auto_20811 ?auto_20812 ) ) ( not ( = ?auto_20811 ?auto_20813 ) ) ( not ( = ?auto_20811 ?auto_20814 ) ) ( not ( = ?auto_20811 ?auto_20815 ) ) ( not ( = ?auto_20811 ?auto_20819 ) ) ( not ( = ?auto_20812 ?auto_20813 ) ) ( not ( = ?auto_20812 ?auto_20814 ) ) ( not ( = ?auto_20812 ?auto_20815 ) ) ( not ( = ?auto_20812 ?auto_20819 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20813 ?auto_20814 ?auto_20815 )
      ( MAKE-4CRATE-VERIFY ?auto_20811 ?auto_20812 ?auto_20813 ?auto_20814 ?auto_20815 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20822 - SURFACE
      ?auto_20823 - SURFACE
    )
    :vars
    (
      ?auto_20830 - HOIST
      ?auto_20825 - PLACE
      ?auto_20826 - SURFACE
      ?auto_20827 - PLACE
      ?auto_20824 - HOIST
      ?auto_20828 - SURFACE
      ?auto_20829 - TRUCK
      ?auto_20831 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20830 ?auto_20825 ) ( IS-CRATE ?auto_20823 ) ( not ( = ?auto_20822 ?auto_20823 ) ) ( not ( = ?auto_20826 ?auto_20822 ) ) ( not ( = ?auto_20826 ?auto_20823 ) ) ( not ( = ?auto_20827 ?auto_20825 ) ) ( HOIST-AT ?auto_20824 ?auto_20827 ) ( not ( = ?auto_20830 ?auto_20824 ) ) ( AVAILABLE ?auto_20824 ) ( SURFACE-AT ?auto_20823 ?auto_20827 ) ( ON ?auto_20823 ?auto_20828 ) ( CLEAR ?auto_20823 ) ( not ( = ?auto_20822 ?auto_20828 ) ) ( not ( = ?auto_20823 ?auto_20828 ) ) ( not ( = ?auto_20826 ?auto_20828 ) ) ( SURFACE-AT ?auto_20826 ?auto_20825 ) ( CLEAR ?auto_20826 ) ( IS-CRATE ?auto_20822 ) ( AVAILABLE ?auto_20830 ) ( IN ?auto_20822 ?auto_20829 ) ( TRUCK-AT ?auto_20829 ?auto_20831 ) ( not ( = ?auto_20831 ?auto_20825 ) ) ( not ( = ?auto_20827 ?auto_20831 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20829 ?auto_20831 ?auto_20825 )
      ( MAKE-2CRATE ?auto_20826 ?auto_20822 ?auto_20823 )
      ( MAKE-1CRATE-VERIFY ?auto_20822 ?auto_20823 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20832 - SURFACE
      ?auto_20833 - SURFACE
      ?auto_20834 - SURFACE
    )
    :vars
    (
      ?auto_20835 - HOIST
      ?auto_20836 - PLACE
      ?auto_20837 - PLACE
      ?auto_20838 - HOIST
      ?auto_20841 - SURFACE
      ?auto_20840 - TRUCK
      ?auto_20839 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20835 ?auto_20836 ) ( IS-CRATE ?auto_20834 ) ( not ( = ?auto_20833 ?auto_20834 ) ) ( not ( = ?auto_20832 ?auto_20833 ) ) ( not ( = ?auto_20832 ?auto_20834 ) ) ( not ( = ?auto_20837 ?auto_20836 ) ) ( HOIST-AT ?auto_20838 ?auto_20837 ) ( not ( = ?auto_20835 ?auto_20838 ) ) ( AVAILABLE ?auto_20838 ) ( SURFACE-AT ?auto_20834 ?auto_20837 ) ( ON ?auto_20834 ?auto_20841 ) ( CLEAR ?auto_20834 ) ( not ( = ?auto_20833 ?auto_20841 ) ) ( not ( = ?auto_20834 ?auto_20841 ) ) ( not ( = ?auto_20832 ?auto_20841 ) ) ( SURFACE-AT ?auto_20832 ?auto_20836 ) ( CLEAR ?auto_20832 ) ( IS-CRATE ?auto_20833 ) ( AVAILABLE ?auto_20835 ) ( IN ?auto_20833 ?auto_20840 ) ( TRUCK-AT ?auto_20840 ?auto_20839 ) ( not ( = ?auto_20839 ?auto_20836 ) ) ( not ( = ?auto_20837 ?auto_20839 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20833 ?auto_20834 )
      ( MAKE-2CRATE-VERIFY ?auto_20832 ?auto_20833 ?auto_20834 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20842 - SURFACE
      ?auto_20843 - SURFACE
      ?auto_20844 - SURFACE
      ?auto_20845 - SURFACE
    )
    :vars
    (
      ?auto_20851 - HOIST
      ?auto_20847 - PLACE
      ?auto_20848 - PLACE
      ?auto_20852 - HOIST
      ?auto_20850 - SURFACE
      ?auto_20846 - TRUCK
      ?auto_20849 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20851 ?auto_20847 ) ( IS-CRATE ?auto_20845 ) ( not ( = ?auto_20844 ?auto_20845 ) ) ( not ( = ?auto_20843 ?auto_20844 ) ) ( not ( = ?auto_20843 ?auto_20845 ) ) ( not ( = ?auto_20848 ?auto_20847 ) ) ( HOIST-AT ?auto_20852 ?auto_20848 ) ( not ( = ?auto_20851 ?auto_20852 ) ) ( AVAILABLE ?auto_20852 ) ( SURFACE-AT ?auto_20845 ?auto_20848 ) ( ON ?auto_20845 ?auto_20850 ) ( CLEAR ?auto_20845 ) ( not ( = ?auto_20844 ?auto_20850 ) ) ( not ( = ?auto_20845 ?auto_20850 ) ) ( not ( = ?auto_20843 ?auto_20850 ) ) ( SURFACE-AT ?auto_20843 ?auto_20847 ) ( CLEAR ?auto_20843 ) ( IS-CRATE ?auto_20844 ) ( AVAILABLE ?auto_20851 ) ( IN ?auto_20844 ?auto_20846 ) ( TRUCK-AT ?auto_20846 ?auto_20849 ) ( not ( = ?auto_20849 ?auto_20847 ) ) ( not ( = ?auto_20848 ?auto_20849 ) ) ( ON ?auto_20843 ?auto_20842 ) ( not ( = ?auto_20842 ?auto_20843 ) ) ( not ( = ?auto_20842 ?auto_20844 ) ) ( not ( = ?auto_20842 ?auto_20845 ) ) ( not ( = ?auto_20842 ?auto_20850 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20843 ?auto_20844 ?auto_20845 )
      ( MAKE-3CRATE-VERIFY ?auto_20842 ?auto_20843 ?auto_20844 ?auto_20845 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20853 - SURFACE
      ?auto_20854 - SURFACE
      ?auto_20855 - SURFACE
      ?auto_20856 - SURFACE
      ?auto_20857 - SURFACE
    )
    :vars
    (
      ?auto_20863 - HOIST
      ?auto_20859 - PLACE
      ?auto_20860 - PLACE
      ?auto_20864 - HOIST
      ?auto_20862 - SURFACE
      ?auto_20858 - TRUCK
      ?auto_20861 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20863 ?auto_20859 ) ( IS-CRATE ?auto_20857 ) ( not ( = ?auto_20856 ?auto_20857 ) ) ( not ( = ?auto_20855 ?auto_20856 ) ) ( not ( = ?auto_20855 ?auto_20857 ) ) ( not ( = ?auto_20860 ?auto_20859 ) ) ( HOIST-AT ?auto_20864 ?auto_20860 ) ( not ( = ?auto_20863 ?auto_20864 ) ) ( AVAILABLE ?auto_20864 ) ( SURFACE-AT ?auto_20857 ?auto_20860 ) ( ON ?auto_20857 ?auto_20862 ) ( CLEAR ?auto_20857 ) ( not ( = ?auto_20856 ?auto_20862 ) ) ( not ( = ?auto_20857 ?auto_20862 ) ) ( not ( = ?auto_20855 ?auto_20862 ) ) ( SURFACE-AT ?auto_20855 ?auto_20859 ) ( CLEAR ?auto_20855 ) ( IS-CRATE ?auto_20856 ) ( AVAILABLE ?auto_20863 ) ( IN ?auto_20856 ?auto_20858 ) ( TRUCK-AT ?auto_20858 ?auto_20861 ) ( not ( = ?auto_20861 ?auto_20859 ) ) ( not ( = ?auto_20860 ?auto_20861 ) ) ( ON ?auto_20854 ?auto_20853 ) ( ON ?auto_20855 ?auto_20854 ) ( not ( = ?auto_20853 ?auto_20854 ) ) ( not ( = ?auto_20853 ?auto_20855 ) ) ( not ( = ?auto_20853 ?auto_20856 ) ) ( not ( = ?auto_20853 ?auto_20857 ) ) ( not ( = ?auto_20853 ?auto_20862 ) ) ( not ( = ?auto_20854 ?auto_20855 ) ) ( not ( = ?auto_20854 ?auto_20856 ) ) ( not ( = ?auto_20854 ?auto_20857 ) ) ( not ( = ?auto_20854 ?auto_20862 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20855 ?auto_20856 ?auto_20857 )
      ( MAKE-4CRATE-VERIFY ?auto_20853 ?auto_20854 ?auto_20855 ?auto_20856 ?auto_20857 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20865 - SURFACE
      ?auto_20866 - SURFACE
    )
    :vars
    (
      ?auto_20872 - HOIST
      ?auto_20868 - PLACE
      ?auto_20874 - SURFACE
      ?auto_20869 - PLACE
      ?auto_20873 - HOIST
      ?auto_20871 - SURFACE
      ?auto_20867 - TRUCK
      ?auto_20870 - PLACE
      ?auto_20875 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20872 ?auto_20868 ) ( IS-CRATE ?auto_20866 ) ( not ( = ?auto_20865 ?auto_20866 ) ) ( not ( = ?auto_20874 ?auto_20865 ) ) ( not ( = ?auto_20874 ?auto_20866 ) ) ( not ( = ?auto_20869 ?auto_20868 ) ) ( HOIST-AT ?auto_20873 ?auto_20869 ) ( not ( = ?auto_20872 ?auto_20873 ) ) ( AVAILABLE ?auto_20873 ) ( SURFACE-AT ?auto_20866 ?auto_20869 ) ( ON ?auto_20866 ?auto_20871 ) ( CLEAR ?auto_20866 ) ( not ( = ?auto_20865 ?auto_20871 ) ) ( not ( = ?auto_20866 ?auto_20871 ) ) ( not ( = ?auto_20874 ?auto_20871 ) ) ( SURFACE-AT ?auto_20874 ?auto_20868 ) ( CLEAR ?auto_20874 ) ( IS-CRATE ?auto_20865 ) ( AVAILABLE ?auto_20872 ) ( TRUCK-AT ?auto_20867 ?auto_20870 ) ( not ( = ?auto_20870 ?auto_20868 ) ) ( not ( = ?auto_20869 ?auto_20870 ) ) ( HOIST-AT ?auto_20875 ?auto_20870 ) ( LIFTING ?auto_20875 ?auto_20865 ) ( not ( = ?auto_20872 ?auto_20875 ) ) ( not ( = ?auto_20873 ?auto_20875 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20875 ?auto_20865 ?auto_20867 ?auto_20870 )
      ( MAKE-2CRATE ?auto_20874 ?auto_20865 ?auto_20866 )
      ( MAKE-1CRATE-VERIFY ?auto_20865 ?auto_20866 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20876 - SURFACE
      ?auto_20877 - SURFACE
      ?auto_20878 - SURFACE
    )
    :vars
    (
      ?auto_20882 - HOIST
      ?auto_20884 - PLACE
      ?auto_20886 - PLACE
      ?auto_20881 - HOIST
      ?auto_20879 - SURFACE
      ?auto_20880 - TRUCK
      ?auto_20883 - PLACE
      ?auto_20885 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20882 ?auto_20884 ) ( IS-CRATE ?auto_20878 ) ( not ( = ?auto_20877 ?auto_20878 ) ) ( not ( = ?auto_20876 ?auto_20877 ) ) ( not ( = ?auto_20876 ?auto_20878 ) ) ( not ( = ?auto_20886 ?auto_20884 ) ) ( HOIST-AT ?auto_20881 ?auto_20886 ) ( not ( = ?auto_20882 ?auto_20881 ) ) ( AVAILABLE ?auto_20881 ) ( SURFACE-AT ?auto_20878 ?auto_20886 ) ( ON ?auto_20878 ?auto_20879 ) ( CLEAR ?auto_20878 ) ( not ( = ?auto_20877 ?auto_20879 ) ) ( not ( = ?auto_20878 ?auto_20879 ) ) ( not ( = ?auto_20876 ?auto_20879 ) ) ( SURFACE-AT ?auto_20876 ?auto_20884 ) ( CLEAR ?auto_20876 ) ( IS-CRATE ?auto_20877 ) ( AVAILABLE ?auto_20882 ) ( TRUCK-AT ?auto_20880 ?auto_20883 ) ( not ( = ?auto_20883 ?auto_20884 ) ) ( not ( = ?auto_20886 ?auto_20883 ) ) ( HOIST-AT ?auto_20885 ?auto_20883 ) ( LIFTING ?auto_20885 ?auto_20877 ) ( not ( = ?auto_20882 ?auto_20885 ) ) ( not ( = ?auto_20881 ?auto_20885 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20877 ?auto_20878 )
      ( MAKE-2CRATE-VERIFY ?auto_20876 ?auto_20877 ?auto_20878 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20887 - SURFACE
      ?auto_20888 - SURFACE
      ?auto_20889 - SURFACE
      ?auto_20890 - SURFACE
    )
    :vars
    (
      ?auto_20896 - HOIST
      ?auto_20897 - PLACE
      ?auto_20892 - PLACE
      ?auto_20895 - HOIST
      ?auto_20893 - SURFACE
      ?auto_20898 - TRUCK
      ?auto_20894 - PLACE
      ?auto_20891 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20896 ?auto_20897 ) ( IS-CRATE ?auto_20890 ) ( not ( = ?auto_20889 ?auto_20890 ) ) ( not ( = ?auto_20888 ?auto_20889 ) ) ( not ( = ?auto_20888 ?auto_20890 ) ) ( not ( = ?auto_20892 ?auto_20897 ) ) ( HOIST-AT ?auto_20895 ?auto_20892 ) ( not ( = ?auto_20896 ?auto_20895 ) ) ( AVAILABLE ?auto_20895 ) ( SURFACE-AT ?auto_20890 ?auto_20892 ) ( ON ?auto_20890 ?auto_20893 ) ( CLEAR ?auto_20890 ) ( not ( = ?auto_20889 ?auto_20893 ) ) ( not ( = ?auto_20890 ?auto_20893 ) ) ( not ( = ?auto_20888 ?auto_20893 ) ) ( SURFACE-AT ?auto_20888 ?auto_20897 ) ( CLEAR ?auto_20888 ) ( IS-CRATE ?auto_20889 ) ( AVAILABLE ?auto_20896 ) ( TRUCK-AT ?auto_20898 ?auto_20894 ) ( not ( = ?auto_20894 ?auto_20897 ) ) ( not ( = ?auto_20892 ?auto_20894 ) ) ( HOIST-AT ?auto_20891 ?auto_20894 ) ( LIFTING ?auto_20891 ?auto_20889 ) ( not ( = ?auto_20896 ?auto_20891 ) ) ( not ( = ?auto_20895 ?auto_20891 ) ) ( ON ?auto_20888 ?auto_20887 ) ( not ( = ?auto_20887 ?auto_20888 ) ) ( not ( = ?auto_20887 ?auto_20889 ) ) ( not ( = ?auto_20887 ?auto_20890 ) ) ( not ( = ?auto_20887 ?auto_20893 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20888 ?auto_20889 ?auto_20890 )
      ( MAKE-3CRATE-VERIFY ?auto_20887 ?auto_20888 ?auto_20889 ?auto_20890 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20899 - SURFACE
      ?auto_20900 - SURFACE
      ?auto_20901 - SURFACE
      ?auto_20902 - SURFACE
      ?auto_20903 - SURFACE
    )
    :vars
    (
      ?auto_20909 - HOIST
      ?auto_20910 - PLACE
      ?auto_20905 - PLACE
      ?auto_20908 - HOIST
      ?auto_20906 - SURFACE
      ?auto_20911 - TRUCK
      ?auto_20907 - PLACE
      ?auto_20904 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20909 ?auto_20910 ) ( IS-CRATE ?auto_20903 ) ( not ( = ?auto_20902 ?auto_20903 ) ) ( not ( = ?auto_20901 ?auto_20902 ) ) ( not ( = ?auto_20901 ?auto_20903 ) ) ( not ( = ?auto_20905 ?auto_20910 ) ) ( HOIST-AT ?auto_20908 ?auto_20905 ) ( not ( = ?auto_20909 ?auto_20908 ) ) ( AVAILABLE ?auto_20908 ) ( SURFACE-AT ?auto_20903 ?auto_20905 ) ( ON ?auto_20903 ?auto_20906 ) ( CLEAR ?auto_20903 ) ( not ( = ?auto_20902 ?auto_20906 ) ) ( not ( = ?auto_20903 ?auto_20906 ) ) ( not ( = ?auto_20901 ?auto_20906 ) ) ( SURFACE-AT ?auto_20901 ?auto_20910 ) ( CLEAR ?auto_20901 ) ( IS-CRATE ?auto_20902 ) ( AVAILABLE ?auto_20909 ) ( TRUCK-AT ?auto_20911 ?auto_20907 ) ( not ( = ?auto_20907 ?auto_20910 ) ) ( not ( = ?auto_20905 ?auto_20907 ) ) ( HOIST-AT ?auto_20904 ?auto_20907 ) ( LIFTING ?auto_20904 ?auto_20902 ) ( not ( = ?auto_20909 ?auto_20904 ) ) ( not ( = ?auto_20908 ?auto_20904 ) ) ( ON ?auto_20900 ?auto_20899 ) ( ON ?auto_20901 ?auto_20900 ) ( not ( = ?auto_20899 ?auto_20900 ) ) ( not ( = ?auto_20899 ?auto_20901 ) ) ( not ( = ?auto_20899 ?auto_20902 ) ) ( not ( = ?auto_20899 ?auto_20903 ) ) ( not ( = ?auto_20899 ?auto_20906 ) ) ( not ( = ?auto_20900 ?auto_20901 ) ) ( not ( = ?auto_20900 ?auto_20902 ) ) ( not ( = ?auto_20900 ?auto_20903 ) ) ( not ( = ?auto_20900 ?auto_20906 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20901 ?auto_20902 ?auto_20903 )
      ( MAKE-4CRATE-VERIFY ?auto_20899 ?auto_20900 ?auto_20901 ?auto_20902 ?auto_20903 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20912 - SURFACE
      ?auto_20913 - SURFACE
    )
    :vars
    (
      ?auto_20920 - HOIST
      ?auto_20921 - PLACE
      ?auto_20919 - SURFACE
      ?auto_20915 - PLACE
      ?auto_20918 - HOIST
      ?auto_20916 - SURFACE
      ?auto_20922 - TRUCK
      ?auto_20917 - PLACE
      ?auto_20914 - HOIST
      ?auto_20923 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20920 ?auto_20921 ) ( IS-CRATE ?auto_20913 ) ( not ( = ?auto_20912 ?auto_20913 ) ) ( not ( = ?auto_20919 ?auto_20912 ) ) ( not ( = ?auto_20919 ?auto_20913 ) ) ( not ( = ?auto_20915 ?auto_20921 ) ) ( HOIST-AT ?auto_20918 ?auto_20915 ) ( not ( = ?auto_20920 ?auto_20918 ) ) ( AVAILABLE ?auto_20918 ) ( SURFACE-AT ?auto_20913 ?auto_20915 ) ( ON ?auto_20913 ?auto_20916 ) ( CLEAR ?auto_20913 ) ( not ( = ?auto_20912 ?auto_20916 ) ) ( not ( = ?auto_20913 ?auto_20916 ) ) ( not ( = ?auto_20919 ?auto_20916 ) ) ( SURFACE-AT ?auto_20919 ?auto_20921 ) ( CLEAR ?auto_20919 ) ( IS-CRATE ?auto_20912 ) ( AVAILABLE ?auto_20920 ) ( TRUCK-AT ?auto_20922 ?auto_20917 ) ( not ( = ?auto_20917 ?auto_20921 ) ) ( not ( = ?auto_20915 ?auto_20917 ) ) ( HOIST-AT ?auto_20914 ?auto_20917 ) ( not ( = ?auto_20920 ?auto_20914 ) ) ( not ( = ?auto_20918 ?auto_20914 ) ) ( AVAILABLE ?auto_20914 ) ( SURFACE-AT ?auto_20912 ?auto_20917 ) ( ON ?auto_20912 ?auto_20923 ) ( CLEAR ?auto_20912 ) ( not ( = ?auto_20912 ?auto_20923 ) ) ( not ( = ?auto_20913 ?auto_20923 ) ) ( not ( = ?auto_20919 ?auto_20923 ) ) ( not ( = ?auto_20916 ?auto_20923 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20914 ?auto_20912 ?auto_20923 ?auto_20917 )
      ( MAKE-2CRATE ?auto_20919 ?auto_20912 ?auto_20913 )
      ( MAKE-1CRATE-VERIFY ?auto_20912 ?auto_20913 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20924 - SURFACE
      ?auto_20925 - SURFACE
      ?auto_20926 - SURFACE
    )
    :vars
    (
      ?auto_20934 - HOIST
      ?auto_20931 - PLACE
      ?auto_20928 - PLACE
      ?auto_20932 - HOIST
      ?auto_20935 - SURFACE
      ?auto_20927 - TRUCK
      ?auto_20930 - PLACE
      ?auto_20933 - HOIST
      ?auto_20929 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20934 ?auto_20931 ) ( IS-CRATE ?auto_20926 ) ( not ( = ?auto_20925 ?auto_20926 ) ) ( not ( = ?auto_20924 ?auto_20925 ) ) ( not ( = ?auto_20924 ?auto_20926 ) ) ( not ( = ?auto_20928 ?auto_20931 ) ) ( HOIST-AT ?auto_20932 ?auto_20928 ) ( not ( = ?auto_20934 ?auto_20932 ) ) ( AVAILABLE ?auto_20932 ) ( SURFACE-AT ?auto_20926 ?auto_20928 ) ( ON ?auto_20926 ?auto_20935 ) ( CLEAR ?auto_20926 ) ( not ( = ?auto_20925 ?auto_20935 ) ) ( not ( = ?auto_20926 ?auto_20935 ) ) ( not ( = ?auto_20924 ?auto_20935 ) ) ( SURFACE-AT ?auto_20924 ?auto_20931 ) ( CLEAR ?auto_20924 ) ( IS-CRATE ?auto_20925 ) ( AVAILABLE ?auto_20934 ) ( TRUCK-AT ?auto_20927 ?auto_20930 ) ( not ( = ?auto_20930 ?auto_20931 ) ) ( not ( = ?auto_20928 ?auto_20930 ) ) ( HOIST-AT ?auto_20933 ?auto_20930 ) ( not ( = ?auto_20934 ?auto_20933 ) ) ( not ( = ?auto_20932 ?auto_20933 ) ) ( AVAILABLE ?auto_20933 ) ( SURFACE-AT ?auto_20925 ?auto_20930 ) ( ON ?auto_20925 ?auto_20929 ) ( CLEAR ?auto_20925 ) ( not ( = ?auto_20925 ?auto_20929 ) ) ( not ( = ?auto_20926 ?auto_20929 ) ) ( not ( = ?auto_20924 ?auto_20929 ) ) ( not ( = ?auto_20935 ?auto_20929 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20925 ?auto_20926 )
      ( MAKE-2CRATE-VERIFY ?auto_20924 ?auto_20925 ?auto_20926 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20936 - SURFACE
      ?auto_20937 - SURFACE
      ?auto_20938 - SURFACE
      ?auto_20939 - SURFACE
    )
    :vars
    (
      ?auto_20943 - HOIST
      ?auto_20947 - PLACE
      ?auto_20948 - PLACE
      ?auto_20945 - HOIST
      ?auto_20944 - SURFACE
      ?auto_20940 - TRUCK
      ?auto_20946 - PLACE
      ?auto_20942 - HOIST
      ?auto_20941 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20943 ?auto_20947 ) ( IS-CRATE ?auto_20939 ) ( not ( = ?auto_20938 ?auto_20939 ) ) ( not ( = ?auto_20937 ?auto_20938 ) ) ( not ( = ?auto_20937 ?auto_20939 ) ) ( not ( = ?auto_20948 ?auto_20947 ) ) ( HOIST-AT ?auto_20945 ?auto_20948 ) ( not ( = ?auto_20943 ?auto_20945 ) ) ( AVAILABLE ?auto_20945 ) ( SURFACE-AT ?auto_20939 ?auto_20948 ) ( ON ?auto_20939 ?auto_20944 ) ( CLEAR ?auto_20939 ) ( not ( = ?auto_20938 ?auto_20944 ) ) ( not ( = ?auto_20939 ?auto_20944 ) ) ( not ( = ?auto_20937 ?auto_20944 ) ) ( SURFACE-AT ?auto_20937 ?auto_20947 ) ( CLEAR ?auto_20937 ) ( IS-CRATE ?auto_20938 ) ( AVAILABLE ?auto_20943 ) ( TRUCK-AT ?auto_20940 ?auto_20946 ) ( not ( = ?auto_20946 ?auto_20947 ) ) ( not ( = ?auto_20948 ?auto_20946 ) ) ( HOIST-AT ?auto_20942 ?auto_20946 ) ( not ( = ?auto_20943 ?auto_20942 ) ) ( not ( = ?auto_20945 ?auto_20942 ) ) ( AVAILABLE ?auto_20942 ) ( SURFACE-AT ?auto_20938 ?auto_20946 ) ( ON ?auto_20938 ?auto_20941 ) ( CLEAR ?auto_20938 ) ( not ( = ?auto_20938 ?auto_20941 ) ) ( not ( = ?auto_20939 ?auto_20941 ) ) ( not ( = ?auto_20937 ?auto_20941 ) ) ( not ( = ?auto_20944 ?auto_20941 ) ) ( ON ?auto_20937 ?auto_20936 ) ( not ( = ?auto_20936 ?auto_20937 ) ) ( not ( = ?auto_20936 ?auto_20938 ) ) ( not ( = ?auto_20936 ?auto_20939 ) ) ( not ( = ?auto_20936 ?auto_20944 ) ) ( not ( = ?auto_20936 ?auto_20941 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20937 ?auto_20938 ?auto_20939 )
      ( MAKE-3CRATE-VERIFY ?auto_20936 ?auto_20937 ?auto_20938 ?auto_20939 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20949 - SURFACE
      ?auto_20950 - SURFACE
      ?auto_20951 - SURFACE
      ?auto_20952 - SURFACE
      ?auto_20953 - SURFACE
    )
    :vars
    (
      ?auto_20957 - HOIST
      ?auto_20961 - PLACE
      ?auto_20962 - PLACE
      ?auto_20959 - HOIST
      ?auto_20958 - SURFACE
      ?auto_20954 - TRUCK
      ?auto_20960 - PLACE
      ?auto_20956 - HOIST
      ?auto_20955 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20957 ?auto_20961 ) ( IS-CRATE ?auto_20953 ) ( not ( = ?auto_20952 ?auto_20953 ) ) ( not ( = ?auto_20951 ?auto_20952 ) ) ( not ( = ?auto_20951 ?auto_20953 ) ) ( not ( = ?auto_20962 ?auto_20961 ) ) ( HOIST-AT ?auto_20959 ?auto_20962 ) ( not ( = ?auto_20957 ?auto_20959 ) ) ( AVAILABLE ?auto_20959 ) ( SURFACE-AT ?auto_20953 ?auto_20962 ) ( ON ?auto_20953 ?auto_20958 ) ( CLEAR ?auto_20953 ) ( not ( = ?auto_20952 ?auto_20958 ) ) ( not ( = ?auto_20953 ?auto_20958 ) ) ( not ( = ?auto_20951 ?auto_20958 ) ) ( SURFACE-AT ?auto_20951 ?auto_20961 ) ( CLEAR ?auto_20951 ) ( IS-CRATE ?auto_20952 ) ( AVAILABLE ?auto_20957 ) ( TRUCK-AT ?auto_20954 ?auto_20960 ) ( not ( = ?auto_20960 ?auto_20961 ) ) ( not ( = ?auto_20962 ?auto_20960 ) ) ( HOIST-AT ?auto_20956 ?auto_20960 ) ( not ( = ?auto_20957 ?auto_20956 ) ) ( not ( = ?auto_20959 ?auto_20956 ) ) ( AVAILABLE ?auto_20956 ) ( SURFACE-AT ?auto_20952 ?auto_20960 ) ( ON ?auto_20952 ?auto_20955 ) ( CLEAR ?auto_20952 ) ( not ( = ?auto_20952 ?auto_20955 ) ) ( not ( = ?auto_20953 ?auto_20955 ) ) ( not ( = ?auto_20951 ?auto_20955 ) ) ( not ( = ?auto_20958 ?auto_20955 ) ) ( ON ?auto_20950 ?auto_20949 ) ( ON ?auto_20951 ?auto_20950 ) ( not ( = ?auto_20949 ?auto_20950 ) ) ( not ( = ?auto_20949 ?auto_20951 ) ) ( not ( = ?auto_20949 ?auto_20952 ) ) ( not ( = ?auto_20949 ?auto_20953 ) ) ( not ( = ?auto_20949 ?auto_20958 ) ) ( not ( = ?auto_20949 ?auto_20955 ) ) ( not ( = ?auto_20950 ?auto_20951 ) ) ( not ( = ?auto_20950 ?auto_20952 ) ) ( not ( = ?auto_20950 ?auto_20953 ) ) ( not ( = ?auto_20950 ?auto_20958 ) ) ( not ( = ?auto_20950 ?auto_20955 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20951 ?auto_20952 ?auto_20953 )
      ( MAKE-4CRATE-VERIFY ?auto_20949 ?auto_20950 ?auto_20951 ?auto_20952 ?auto_20953 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20963 - SURFACE
      ?auto_20964 - SURFACE
    )
    :vars
    (
      ?auto_20969 - HOIST
      ?auto_20973 - PLACE
      ?auto_20965 - SURFACE
      ?auto_20974 - PLACE
      ?auto_20971 - HOIST
      ?auto_20970 - SURFACE
      ?auto_20972 - PLACE
      ?auto_20968 - HOIST
      ?auto_20967 - SURFACE
      ?auto_20966 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20969 ?auto_20973 ) ( IS-CRATE ?auto_20964 ) ( not ( = ?auto_20963 ?auto_20964 ) ) ( not ( = ?auto_20965 ?auto_20963 ) ) ( not ( = ?auto_20965 ?auto_20964 ) ) ( not ( = ?auto_20974 ?auto_20973 ) ) ( HOIST-AT ?auto_20971 ?auto_20974 ) ( not ( = ?auto_20969 ?auto_20971 ) ) ( AVAILABLE ?auto_20971 ) ( SURFACE-AT ?auto_20964 ?auto_20974 ) ( ON ?auto_20964 ?auto_20970 ) ( CLEAR ?auto_20964 ) ( not ( = ?auto_20963 ?auto_20970 ) ) ( not ( = ?auto_20964 ?auto_20970 ) ) ( not ( = ?auto_20965 ?auto_20970 ) ) ( SURFACE-AT ?auto_20965 ?auto_20973 ) ( CLEAR ?auto_20965 ) ( IS-CRATE ?auto_20963 ) ( AVAILABLE ?auto_20969 ) ( not ( = ?auto_20972 ?auto_20973 ) ) ( not ( = ?auto_20974 ?auto_20972 ) ) ( HOIST-AT ?auto_20968 ?auto_20972 ) ( not ( = ?auto_20969 ?auto_20968 ) ) ( not ( = ?auto_20971 ?auto_20968 ) ) ( AVAILABLE ?auto_20968 ) ( SURFACE-AT ?auto_20963 ?auto_20972 ) ( ON ?auto_20963 ?auto_20967 ) ( CLEAR ?auto_20963 ) ( not ( = ?auto_20963 ?auto_20967 ) ) ( not ( = ?auto_20964 ?auto_20967 ) ) ( not ( = ?auto_20965 ?auto_20967 ) ) ( not ( = ?auto_20970 ?auto_20967 ) ) ( TRUCK-AT ?auto_20966 ?auto_20973 ) )
    :subtasks
    ( ( !DRIVE ?auto_20966 ?auto_20973 ?auto_20972 )
      ( MAKE-2CRATE ?auto_20965 ?auto_20963 ?auto_20964 )
      ( MAKE-1CRATE-VERIFY ?auto_20963 ?auto_20964 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20975 - SURFACE
      ?auto_20976 - SURFACE
      ?auto_20977 - SURFACE
    )
    :vars
    (
      ?auto_20981 - HOIST
      ?auto_20983 - PLACE
      ?auto_20984 - PLACE
      ?auto_20982 - HOIST
      ?auto_20985 - SURFACE
      ?auto_20978 - PLACE
      ?auto_20980 - HOIST
      ?auto_20979 - SURFACE
      ?auto_20986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20981 ?auto_20983 ) ( IS-CRATE ?auto_20977 ) ( not ( = ?auto_20976 ?auto_20977 ) ) ( not ( = ?auto_20975 ?auto_20976 ) ) ( not ( = ?auto_20975 ?auto_20977 ) ) ( not ( = ?auto_20984 ?auto_20983 ) ) ( HOIST-AT ?auto_20982 ?auto_20984 ) ( not ( = ?auto_20981 ?auto_20982 ) ) ( AVAILABLE ?auto_20982 ) ( SURFACE-AT ?auto_20977 ?auto_20984 ) ( ON ?auto_20977 ?auto_20985 ) ( CLEAR ?auto_20977 ) ( not ( = ?auto_20976 ?auto_20985 ) ) ( not ( = ?auto_20977 ?auto_20985 ) ) ( not ( = ?auto_20975 ?auto_20985 ) ) ( SURFACE-AT ?auto_20975 ?auto_20983 ) ( CLEAR ?auto_20975 ) ( IS-CRATE ?auto_20976 ) ( AVAILABLE ?auto_20981 ) ( not ( = ?auto_20978 ?auto_20983 ) ) ( not ( = ?auto_20984 ?auto_20978 ) ) ( HOIST-AT ?auto_20980 ?auto_20978 ) ( not ( = ?auto_20981 ?auto_20980 ) ) ( not ( = ?auto_20982 ?auto_20980 ) ) ( AVAILABLE ?auto_20980 ) ( SURFACE-AT ?auto_20976 ?auto_20978 ) ( ON ?auto_20976 ?auto_20979 ) ( CLEAR ?auto_20976 ) ( not ( = ?auto_20976 ?auto_20979 ) ) ( not ( = ?auto_20977 ?auto_20979 ) ) ( not ( = ?auto_20975 ?auto_20979 ) ) ( not ( = ?auto_20985 ?auto_20979 ) ) ( TRUCK-AT ?auto_20986 ?auto_20983 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20976 ?auto_20977 )
      ( MAKE-2CRATE-VERIFY ?auto_20975 ?auto_20976 ?auto_20977 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20987 - SURFACE
      ?auto_20988 - SURFACE
      ?auto_20989 - SURFACE
      ?auto_20990 - SURFACE
    )
    :vars
    (
      ?auto_20998 - HOIST
      ?auto_20992 - PLACE
      ?auto_20991 - PLACE
      ?auto_20999 - HOIST
      ?auto_20994 - SURFACE
      ?auto_20997 - PLACE
      ?auto_20995 - HOIST
      ?auto_20996 - SURFACE
      ?auto_20993 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20998 ?auto_20992 ) ( IS-CRATE ?auto_20990 ) ( not ( = ?auto_20989 ?auto_20990 ) ) ( not ( = ?auto_20988 ?auto_20989 ) ) ( not ( = ?auto_20988 ?auto_20990 ) ) ( not ( = ?auto_20991 ?auto_20992 ) ) ( HOIST-AT ?auto_20999 ?auto_20991 ) ( not ( = ?auto_20998 ?auto_20999 ) ) ( AVAILABLE ?auto_20999 ) ( SURFACE-AT ?auto_20990 ?auto_20991 ) ( ON ?auto_20990 ?auto_20994 ) ( CLEAR ?auto_20990 ) ( not ( = ?auto_20989 ?auto_20994 ) ) ( not ( = ?auto_20990 ?auto_20994 ) ) ( not ( = ?auto_20988 ?auto_20994 ) ) ( SURFACE-AT ?auto_20988 ?auto_20992 ) ( CLEAR ?auto_20988 ) ( IS-CRATE ?auto_20989 ) ( AVAILABLE ?auto_20998 ) ( not ( = ?auto_20997 ?auto_20992 ) ) ( not ( = ?auto_20991 ?auto_20997 ) ) ( HOIST-AT ?auto_20995 ?auto_20997 ) ( not ( = ?auto_20998 ?auto_20995 ) ) ( not ( = ?auto_20999 ?auto_20995 ) ) ( AVAILABLE ?auto_20995 ) ( SURFACE-AT ?auto_20989 ?auto_20997 ) ( ON ?auto_20989 ?auto_20996 ) ( CLEAR ?auto_20989 ) ( not ( = ?auto_20989 ?auto_20996 ) ) ( not ( = ?auto_20990 ?auto_20996 ) ) ( not ( = ?auto_20988 ?auto_20996 ) ) ( not ( = ?auto_20994 ?auto_20996 ) ) ( TRUCK-AT ?auto_20993 ?auto_20992 ) ( ON ?auto_20988 ?auto_20987 ) ( not ( = ?auto_20987 ?auto_20988 ) ) ( not ( = ?auto_20987 ?auto_20989 ) ) ( not ( = ?auto_20987 ?auto_20990 ) ) ( not ( = ?auto_20987 ?auto_20994 ) ) ( not ( = ?auto_20987 ?auto_20996 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20988 ?auto_20989 ?auto_20990 )
      ( MAKE-3CRATE-VERIFY ?auto_20987 ?auto_20988 ?auto_20989 ?auto_20990 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21000 - SURFACE
      ?auto_21001 - SURFACE
      ?auto_21002 - SURFACE
      ?auto_21003 - SURFACE
      ?auto_21004 - SURFACE
    )
    :vars
    (
      ?auto_21012 - HOIST
      ?auto_21006 - PLACE
      ?auto_21005 - PLACE
      ?auto_21013 - HOIST
      ?auto_21008 - SURFACE
      ?auto_21011 - PLACE
      ?auto_21009 - HOIST
      ?auto_21010 - SURFACE
      ?auto_21007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21012 ?auto_21006 ) ( IS-CRATE ?auto_21004 ) ( not ( = ?auto_21003 ?auto_21004 ) ) ( not ( = ?auto_21002 ?auto_21003 ) ) ( not ( = ?auto_21002 ?auto_21004 ) ) ( not ( = ?auto_21005 ?auto_21006 ) ) ( HOIST-AT ?auto_21013 ?auto_21005 ) ( not ( = ?auto_21012 ?auto_21013 ) ) ( AVAILABLE ?auto_21013 ) ( SURFACE-AT ?auto_21004 ?auto_21005 ) ( ON ?auto_21004 ?auto_21008 ) ( CLEAR ?auto_21004 ) ( not ( = ?auto_21003 ?auto_21008 ) ) ( not ( = ?auto_21004 ?auto_21008 ) ) ( not ( = ?auto_21002 ?auto_21008 ) ) ( SURFACE-AT ?auto_21002 ?auto_21006 ) ( CLEAR ?auto_21002 ) ( IS-CRATE ?auto_21003 ) ( AVAILABLE ?auto_21012 ) ( not ( = ?auto_21011 ?auto_21006 ) ) ( not ( = ?auto_21005 ?auto_21011 ) ) ( HOIST-AT ?auto_21009 ?auto_21011 ) ( not ( = ?auto_21012 ?auto_21009 ) ) ( not ( = ?auto_21013 ?auto_21009 ) ) ( AVAILABLE ?auto_21009 ) ( SURFACE-AT ?auto_21003 ?auto_21011 ) ( ON ?auto_21003 ?auto_21010 ) ( CLEAR ?auto_21003 ) ( not ( = ?auto_21003 ?auto_21010 ) ) ( not ( = ?auto_21004 ?auto_21010 ) ) ( not ( = ?auto_21002 ?auto_21010 ) ) ( not ( = ?auto_21008 ?auto_21010 ) ) ( TRUCK-AT ?auto_21007 ?auto_21006 ) ( ON ?auto_21001 ?auto_21000 ) ( ON ?auto_21002 ?auto_21001 ) ( not ( = ?auto_21000 ?auto_21001 ) ) ( not ( = ?auto_21000 ?auto_21002 ) ) ( not ( = ?auto_21000 ?auto_21003 ) ) ( not ( = ?auto_21000 ?auto_21004 ) ) ( not ( = ?auto_21000 ?auto_21008 ) ) ( not ( = ?auto_21000 ?auto_21010 ) ) ( not ( = ?auto_21001 ?auto_21002 ) ) ( not ( = ?auto_21001 ?auto_21003 ) ) ( not ( = ?auto_21001 ?auto_21004 ) ) ( not ( = ?auto_21001 ?auto_21008 ) ) ( not ( = ?auto_21001 ?auto_21010 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21002 ?auto_21003 ?auto_21004 )
      ( MAKE-4CRATE-VERIFY ?auto_21000 ?auto_21001 ?auto_21002 ?auto_21003 ?auto_21004 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21014 - SURFACE
      ?auto_21015 - SURFACE
    )
    :vars
    (
      ?auto_21024 - HOIST
      ?auto_21018 - PLACE
      ?auto_21016 - SURFACE
      ?auto_21017 - PLACE
      ?auto_21025 - HOIST
      ?auto_21020 - SURFACE
      ?auto_21023 - PLACE
      ?auto_21021 - HOIST
      ?auto_21022 - SURFACE
      ?auto_21019 - TRUCK
      ?auto_21026 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21024 ?auto_21018 ) ( IS-CRATE ?auto_21015 ) ( not ( = ?auto_21014 ?auto_21015 ) ) ( not ( = ?auto_21016 ?auto_21014 ) ) ( not ( = ?auto_21016 ?auto_21015 ) ) ( not ( = ?auto_21017 ?auto_21018 ) ) ( HOIST-AT ?auto_21025 ?auto_21017 ) ( not ( = ?auto_21024 ?auto_21025 ) ) ( AVAILABLE ?auto_21025 ) ( SURFACE-AT ?auto_21015 ?auto_21017 ) ( ON ?auto_21015 ?auto_21020 ) ( CLEAR ?auto_21015 ) ( not ( = ?auto_21014 ?auto_21020 ) ) ( not ( = ?auto_21015 ?auto_21020 ) ) ( not ( = ?auto_21016 ?auto_21020 ) ) ( IS-CRATE ?auto_21014 ) ( not ( = ?auto_21023 ?auto_21018 ) ) ( not ( = ?auto_21017 ?auto_21023 ) ) ( HOIST-AT ?auto_21021 ?auto_21023 ) ( not ( = ?auto_21024 ?auto_21021 ) ) ( not ( = ?auto_21025 ?auto_21021 ) ) ( AVAILABLE ?auto_21021 ) ( SURFACE-AT ?auto_21014 ?auto_21023 ) ( ON ?auto_21014 ?auto_21022 ) ( CLEAR ?auto_21014 ) ( not ( = ?auto_21014 ?auto_21022 ) ) ( not ( = ?auto_21015 ?auto_21022 ) ) ( not ( = ?auto_21016 ?auto_21022 ) ) ( not ( = ?auto_21020 ?auto_21022 ) ) ( TRUCK-AT ?auto_21019 ?auto_21018 ) ( SURFACE-AT ?auto_21026 ?auto_21018 ) ( CLEAR ?auto_21026 ) ( LIFTING ?auto_21024 ?auto_21016 ) ( IS-CRATE ?auto_21016 ) ( not ( = ?auto_21026 ?auto_21016 ) ) ( not ( = ?auto_21014 ?auto_21026 ) ) ( not ( = ?auto_21015 ?auto_21026 ) ) ( not ( = ?auto_21020 ?auto_21026 ) ) ( not ( = ?auto_21022 ?auto_21026 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21026 ?auto_21016 )
      ( MAKE-2CRATE ?auto_21016 ?auto_21014 ?auto_21015 )
      ( MAKE-1CRATE-VERIFY ?auto_21014 ?auto_21015 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21027 - SURFACE
      ?auto_21028 - SURFACE
      ?auto_21029 - SURFACE
    )
    :vars
    (
      ?auto_21039 - HOIST
      ?auto_21034 - PLACE
      ?auto_21030 - PLACE
      ?auto_21032 - HOIST
      ?auto_21033 - SURFACE
      ?auto_21037 - PLACE
      ?auto_21036 - HOIST
      ?auto_21038 - SURFACE
      ?auto_21031 - TRUCK
      ?auto_21035 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21039 ?auto_21034 ) ( IS-CRATE ?auto_21029 ) ( not ( = ?auto_21028 ?auto_21029 ) ) ( not ( = ?auto_21027 ?auto_21028 ) ) ( not ( = ?auto_21027 ?auto_21029 ) ) ( not ( = ?auto_21030 ?auto_21034 ) ) ( HOIST-AT ?auto_21032 ?auto_21030 ) ( not ( = ?auto_21039 ?auto_21032 ) ) ( AVAILABLE ?auto_21032 ) ( SURFACE-AT ?auto_21029 ?auto_21030 ) ( ON ?auto_21029 ?auto_21033 ) ( CLEAR ?auto_21029 ) ( not ( = ?auto_21028 ?auto_21033 ) ) ( not ( = ?auto_21029 ?auto_21033 ) ) ( not ( = ?auto_21027 ?auto_21033 ) ) ( IS-CRATE ?auto_21028 ) ( not ( = ?auto_21037 ?auto_21034 ) ) ( not ( = ?auto_21030 ?auto_21037 ) ) ( HOIST-AT ?auto_21036 ?auto_21037 ) ( not ( = ?auto_21039 ?auto_21036 ) ) ( not ( = ?auto_21032 ?auto_21036 ) ) ( AVAILABLE ?auto_21036 ) ( SURFACE-AT ?auto_21028 ?auto_21037 ) ( ON ?auto_21028 ?auto_21038 ) ( CLEAR ?auto_21028 ) ( not ( = ?auto_21028 ?auto_21038 ) ) ( not ( = ?auto_21029 ?auto_21038 ) ) ( not ( = ?auto_21027 ?auto_21038 ) ) ( not ( = ?auto_21033 ?auto_21038 ) ) ( TRUCK-AT ?auto_21031 ?auto_21034 ) ( SURFACE-AT ?auto_21035 ?auto_21034 ) ( CLEAR ?auto_21035 ) ( LIFTING ?auto_21039 ?auto_21027 ) ( IS-CRATE ?auto_21027 ) ( not ( = ?auto_21035 ?auto_21027 ) ) ( not ( = ?auto_21028 ?auto_21035 ) ) ( not ( = ?auto_21029 ?auto_21035 ) ) ( not ( = ?auto_21033 ?auto_21035 ) ) ( not ( = ?auto_21038 ?auto_21035 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21028 ?auto_21029 )
      ( MAKE-2CRATE-VERIFY ?auto_21027 ?auto_21028 ?auto_21029 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21040 - SURFACE
      ?auto_21041 - SURFACE
      ?auto_21042 - SURFACE
      ?auto_21043 - SURFACE
    )
    :vars
    (
      ?auto_21044 - HOIST
      ?auto_21049 - PLACE
      ?auto_21052 - PLACE
      ?auto_21047 - HOIST
      ?auto_21051 - SURFACE
      ?auto_21045 - PLACE
      ?auto_21050 - HOIST
      ?auto_21048 - SURFACE
      ?auto_21046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21044 ?auto_21049 ) ( IS-CRATE ?auto_21043 ) ( not ( = ?auto_21042 ?auto_21043 ) ) ( not ( = ?auto_21041 ?auto_21042 ) ) ( not ( = ?auto_21041 ?auto_21043 ) ) ( not ( = ?auto_21052 ?auto_21049 ) ) ( HOIST-AT ?auto_21047 ?auto_21052 ) ( not ( = ?auto_21044 ?auto_21047 ) ) ( AVAILABLE ?auto_21047 ) ( SURFACE-AT ?auto_21043 ?auto_21052 ) ( ON ?auto_21043 ?auto_21051 ) ( CLEAR ?auto_21043 ) ( not ( = ?auto_21042 ?auto_21051 ) ) ( not ( = ?auto_21043 ?auto_21051 ) ) ( not ( = ?auto_21041 ?auto_21051 ) ) ( IS-CRATE ?auto_21042 ) ( not ( = ?auto_21045 ?auto_21049 ) ) ( not ( = ?auto_21052 ?auto_21045 ) ) ( HOIST-AT ?auto_21050 ?auto_21045 ) ( not ( = ?auto_21044 ?auto_21050 ) ) ( not ( = ?auto_21047 ?auto_21050 ) ) ( AVAILABLE ?auto_21050 ) ( SURFACE-AT ?auto_21042 ?auto_21045 ) ( ON ?auto_21042 ?auto_21048 ) ( CLEAR ?auto_21042 ) ( not ( = ?auto_21042 ?auto_21048 ) ) ( not ( = ?auto_21043 ?auto_21048 ) ) ( not ( = ?auto_21041 ?auto_21048 ) ) ( not ( = ?auto_21051 ?auto_21048 ) ) ( TRUCK-AT ?auto_21046 ?auto_21049 ) ( SURFACE-AT ?auto_21040 ?auto_21049 ) ( CLEAR ?auto_21040 ) ( LIFTING ?auto_21044 ?auto_21041 ) ( IS-CRATE ?auto_21041 ) ( not ( = ?auto_21040 ?auto_21041 ) ) ( not ( = ?auto_21042 ?auto_21040 ) ) ( not ( = ?auto_21043 ?auto_21040 ) ) ( not ( = ?auto_21051 ?auto_21040 ) ) ( not ( = ?auto_21048 ?auto_21040 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21041 ?auto_21042 ?auto_21043 )
      ( MAKE-3CRATE-VERIFY ?auto_21040 ?auto_21041 ?auto_21042 ?auto_21043 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21053 - SURFACE
      ?auto_21054 - SURFACE
      ?auto_21055 - SURFACE
      ?auto_21056 - SURFACE
      ?auto_21057 - SURFACE
    )
    :vars
    (
      ?auto_21058 - HOIST
      ?auto_21063 - PLACE
      ?auto_21066 - PLACE
      ?auto_21061 - HOIST
      ?auto_21065 - SURFACE
      ?auto_21059 - PLACE
      ?auto_21064 - HOIST
      ?auto_21062 - SURFACE
      ?auto_21060 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21058 ?auto_21063 ) ( IS-CRATE ?auto_21057 ) ( not ( = ?auto_21056 ?auto_21057 ) ) ( not ( = ?auto_21055 ?auto_21056 ) ) ( not ( = ?auto_21055 ?auto_21057 ) ) ( not ( = ?auto_21066 ?auto_21063 ) ) ( HOIST-AT ?auto_21061 ?auto_21066 ) ( not ( = ?auto_21058 ?auto_21061 ) ) ( AVAILABLE ?auto_21061 ) ( SURFACE-AT ?auto_21057 ?auto_21066 ) ( ON ?auto_21057 ?auto_21065 ) ( CLEAR ?auto_21057 ) ( not ( = ?auto_21056 ?auto_21065 ) ) ( not ( = ?auto_21057 ?auto_21065 ) ) ( not ( = ?auto_21055 ?auto_21065 ) ) ( IS-CRATE ?auto_21056 ) ( not ( = ?auto_21059 ?auto_21063 ) ) ( not ( = ?auto_21066 ?auto_21059 ) ) ( HOIST-AT ?auto_21064 ?auto_21059 ) ( not ( = ?auto_21058 ?auto_21064 ) ) ( not ( = ?auto_21061 ?auto_21064 ) ) ( AVAILABLE ?auto_21064 ) ( SURFACE-AT ?auto_21056 ?auto_21059 ) ( ON ?auto_21056 ?auto_21062 ) ( CLEAR ?auto_21056 ) ( not ( = ?auto_21056 ?auto_21062 ) ) ( not ( = ?auto_21057 ?auto_21062 ) ) ( not ( = ?auto_21055 ?auto_21062 ) ) ( not ( = ?auto_21065 ?auto_21062 ) ) ( TRUCK-AT ?auto_21060 ?auto_21063 ) ( SURFACE-AT ?auto_21054 ?auto_21063 ) ( CLEAR ?auto_21054 ) ( LIFTING ?auto_21058 ?auto_21055 ) ( IS-CRATE ?auto_21055 ) ( not ( = ?auto_21054 ?auto_21055 ) ) ( not ( = ?auto_21056 ?auto_21054 ) ) ( not ( = ?auto_21057 ?auto_21054 ) ) ( not ( = ?auto_21065 ?auto_21054 ) ) ( not ( = ?auto_21062 ?auto_21054 ) ) ( ON ?auto_21054 ?auto_21053 ) ( not ( = ?auto_21053 ?auto_21054 ) ) ( not ( = ?auto_21053 ?auto_21055 ) ) ( not ( = ?auto_21053 ?auto_21056 ) ) ( not ( = ?auto_21053 ?auto_21057 ) ) ( not ( = ?auto_21053 ?auto_21065 ) ) ( not ( = ?auto_21053 ?auto_21062 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21055 ?auto_21056 ?auto_21057 )
      ( MAKE-4CRATE-VERIFY ?auto_21053 ?auto_21054 ?auto_21055 ?auto_21056 ?auto_21057 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21067 - SURFACE
      ?auto_21068 - SURFACE
    )
    :vars
    (
      ?auto_21069 - HOIST
      ?auto_21076 - PLACE
      ?auto_21073 - SURFACE
      ?auto_21079 - PLACE
      ?auto_21074 - HOIST
      ?auto_21078 - SURFACE
      ?auto_21070 - PLACE
      ?auto_21077 - HOIST
      ?auto_21075 - SURFACE
      ?auto_21071 - TRUCK
      ?auto_21072 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21069 ?auto_21076 ) ( IS-CRATE ?auto_21068 ) ( not ( = ?auto_21067 ?auto_21068 ) ) ( not ( = ?auto_21073 ?auto_21067 ) ) ( not ( = ?auto_21073 ?auto_21068 ) ) ( not ( = ?auto_21079 ?auto_21076 ) ) ( HOIST-AT ?auto_21074 ?auto_21079 ) ( not ( = ?auto_21069 ?auto_21074 ) ) ( AVAILABLE ?auto_21074 ) ( SURFACE-AT ?auto_21068 ?auto_21079 ) ( ON ?auto_21068 ?auto_21078 ) ( CLEAR ?auto_21068 ) ( not ( = ?auto_21067 ?auto_21078 ) ) ( not ( = ?auto_21068 ?auto_21078 ) ) ( not ( = ?auto_21073 ?auto_21078 ) ) ( IS-CRATE ?auto_21067 ) ( not ( = ?auto_21070 ?auto_21076 ) ) ( not ( = ?auto_21079 ?auto_21070 ) ) ( HOIST-AT ?auto_21077 ?auto_21070 ) ( not ( = ?auto_21069 ?auto_21077 ) ) ( not ( = ?auto_21074 ?auto_21077 ) ) ( AVAILABLE ?auto_21077 ) ( SURFACE-AT ?auto_21067 ?auto_21070 ) ( ON ?auto_21067 ?auto_21075 ) ( CLEAR ?auto_21067 ) ( not ( = ?auto_21067 ?auto_21075 ) ) ( not ( = ?auto_21068 ?auto_21075 ) ) ( not ( = ?auto_21073 ?auto_21075 ) ) ( not ( = ?auto_21078 ?auto_21075 ) ) ( TRUCK-AT ?auto_21071 ?auto_21076 ) ( SURFACE-AT ?auto_21072 ?auto_21076 ) ( CLEAR ?auto_21072 ) ( IS-CRATE ?auto_21073 ) ( not ( = ?auto_21072 ?auto_21073 ) ) ( not ( = ?auto_21067 ?auto_21072 ) ) ( not ( = ?auto_21068 ?auto_21072 ) ) ( not ( = ?auto_21078 ?auto_21072 ) ) ( not ( = ?auto_21075 ?auto_21072 ) ) ( AVAILABLE ?auto_21069 ) ( IN ?auto_21073 ?auto_21071 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21069 ?auto_21073 ?auto_21071 ?auto_21076 )
      ( MAKE-2CRATE ?auto_21073 ?auto_21067 ?auto_21068 )
      ( MAKE-1CRATE-VERIFY ?auto_21067 ?auto_21068 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21080 - SURFACE
      ?auto_21081 - SURFACE
      ?auto_21082 - SURFACE
    )
    :vars
    (
      ?auto_21088 - HOIST
      ?auto_21084 - PLACE
      ?auto_21086 - PLACE
      ?auto_21083 - HOIST
      ?auto_21087 - SURFACE
      ?auto_21085 - PLACE
      ?auto_21089 - HOIST
      ?auto_21091 - SURFACE
      ?auto_21092 - TRUCK
      ?auto_21090 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21088 ?auto_21084 ) ( IS-CRATE ?auto_21082 ) ( not ( = ?auto_21081 ?auto_21082 ) ) ( not ( = ?auto_21080 ?auto_21081 ) ) ( not ( = ?auto_21080 ?auto_21082 ) ) ( not ( = ?auto_21086 ?auto_21084 ) ) ( HOIST-AT ?auto_21083 ?auto_21086 ) ( not ( = ?auto_21088 ?auto_21083 ) ) ( AVAILABLE ?auto_21083 ) ( SURFACE-AT ?auto_21082 ?auto_21086 ) ( ON ?auto_21082 ?auto_21087 ) ( CLEAR ?auto_21082 ) ( not ( = ?auto_21081 ?auto_21087 ) ) ( not ( = ?auto_21082 ?auto_21087 ) ) ( not ( = ?auto_21080 ?auto_21087 ) ) ( IS-CRATE ?auto_21081 ) ( not ( = ?auto_21085 ?auto_21084 ) ) ( not ( = ?auto_21086 ?auto_21085 ) ) ( HOIST-AT ?auto_21089 ?auto_21085 ) ( not ( = ?auto_21088 ?auto_21089 ) ) ( not ( = ?auto_21083 ?auto_21089 ) ) ( AVAILABLE ?auto_21089 ) ( SURFACE-AT ?auto_21081 ?auto_21085 ) ( ON ?auto_21081 ?auto_21091 ) ( CLEAR ?auto_21081 ) ( not ( = ?auto_21081 ?auto_21091 ) ) ( not ( = ?auto_21082 ?auto_21091 ) ) ( not ( = ?auto_21080 ?auto_21091 ) ) ( not ( = ?auto_21087 ?auto_21091 ) ) ( TRUCK-AT ?auto_21092 ?auto_21084 ) ( SURFACE-AT ?auto_21090 ?auto_21084 ) ( CLEAR ?auto_21090 ) ( IS-CRATE ?auto_21080 ) ( not ( = ?auto_21090 ?auto_21080 ) ) ( not ( = ?auto_21081 ?auto_21090 ) ) ( not ( = ?auto_21082 ?auto_21090 ) ) ( not ( = ?auto_21087 ?auto_21090 ) ) ( not ( = ?auto_21091 ?auto_21090 ) ) ( AVAILABLE ?auto_21088 ) ( IN ?auto_21080 ?auto_21092 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21081 ?auto_21082 )
      ( MAKE-2CRATE-VERIFY ?auto_21080 ?auto_21081 ?auto_21082 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21093 - SURFACE
      ?auto_21094 - SURFACE
      ?auto_21095 - SURFACE
      ?auto_21096 - SURFACE
    )
    :vars
    (
      ?auto_21097 - HOIST
      ?auto_21105 - PLACE
      ?auto_21101 - PLACE
      ?auto_21099 - HOIST
      ?auto_21098 - SURFACE
      ?auto_21103 - PLACE
      ?auto_21102 - HOIST
      ?auto_21104 - SURFACE
      ?auto_21100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21097 ?auto_21105 ) ( IS-CRATE ?auto_21096 ) ( not ( = ?auto_21095 ?auto_21096 ) ) ( not ( = ?auto_21094 ?auto_21095 ) ) ( not ( = ?auto_21094 ?auto_21096 ) ) ( not ( = ?auto_21101 ?auto_21105 ) ) ( HOIST-AT ?auto_21099 ?auto_21101 ) ( not ( = ?auto_21097 ?auto_21099 ) ) ( AVAILABLE ?auto_21099 ) ( SURFACE-AT ?auto_21096 ?auto_21101 ) ( ON ?auto_21096 ?auto_21098 ) ( CLEAR ?auto_21096 ) ( not ( = ?auto_21095 ?auto_21098 ) ) ( not ( = ?auto_21096 ?auto_21098 ) ) ( not ( = ?auto_21094 ?auto_21098 ) ) ( IS-CRATE ?auto_21095 ) ( not ( = ?auto_21103 ?auto_21105 ) ) ( not ( = ?auto_21101 ?auto_21103 ) ) ( HOIST-AT ?auto_21102 ?auto_21103 ) ( not ( = ?auto_21097 ?auto_21102 ) ) ( not ( = ?auto_21099 ?auto_21102 ) ) ( AVAILABLE ?auto_21102 ) ( SURFACE-AT ?auto_21095 ?auto_21103 ) ( ON ?auto_21095 ?auto_21104 ) ( CLEAR ?auto_21095 ) ( not ( = ?auto_21095 ?auto_21104 ) ) ( not ( = ?auto_21096 ?auto_21104 ) ) ( not ( = ?auto_21094 ?auto_21104 ) ) ( not ( = ?auto_21098 ?auto_21104 ) ) ( TRUCK-AT ?auto_21100 ?auto_21105 ) ( SURFACE-AT ?auto_21093 ?auto_21105 ) ( CLEAR ?auto_21093 ) ( IS-CRATE ?auto_21094 ) ( not ( = ?auto_21093 ?auto_21094 ) ) ( not ( = ?auto_21095 ?auto_21093 ) ) ( not ( = ?auto_21096 ?auto_21093 ) ) ( not ( = ?auto_21098 ?auto_21093 ) ) ( not ( = ?auto_21104 ?auto_21093 ) ) ( AVAILABLE ?auto_21097 ) ( IN ?auto_21094 ?auto_21100 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21094 ?auto_21095 ?auto_21096 )
      ( MAKE-3CRATE-VERIFY ?auto_21093 ?auto_21094 ?auto_21095 ?auto_21096 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21106 - SURFACE
      ?auto_21107 - SURFACE
      ?auto_21108 - SURFACE
      ?auto_21109 - SURFACE
      ?auto_21110 - SURFACE
    )
    :vars
    (
      ?auto_21111 - HOIST
      ?auto_21119 - PLACE
      ?auto_21115 - PLACE
      ?auto_21113 - HOIST
      ?auto_21112 - SURFACE
      ?auto_21117 - PLACE
      ?auto_21116 - HOIST
      ?auto_21118 - SURFACE
      ?auto_21114 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21111 ?auto_21119 ) ( IS-CRATE ?auto_21110 ) ( not ( = ?auto_21109 ?auto_21110 ) ) ( not ( = ?auto_21108 ?auto_21109 ) ) ( not ( = ?auto_21108 ?auto_21110 ) ) ( not ( = ?auto_21115 ?auto_21119 ) ) ( HOIST-AT ?auto_21113 ?auto_21115 ) ( not ( = ?auto_21111 ?auto_21113 ) ) ( AVAILABLE ?auto_21113 ) ( SURFACE-AT ?auto_21110 ?auto_21115 ) ( ON ?auto_21110 ?auto_21112 ) ( CLEAR ?auto_21110 ) ( not ( = ?auto_21109 ?auto_21112 ) ) ( not ( = ?auto_21110 ?auto_21112 ) ) ( not ( = ?auto_21108 ?auto_21112 ) ) ( IS-CRATE ?auto_21109 ) ( not ( = ?auto_21117 ?auto_21119 ) ) ( not ( = ?auto_21115 ?auto_21117 ) ) ( HOIST-AT ?auto_21116 ?auto_21117 ) ( not ( = ?auto_21111 ?auto_21116 ) ) ( not ( = ?auto_21113 ?auto_21116 ) ) ( AVAILABLE ?auto_21116 ) ( SURFACE-AT ?auto_21109 ?auto_21117 ) ( ON ?auto_21109 ?auto_21118 ) ( CLEAR ?auto_21109 ) ( not ( = ?auto_21109 ?auto_21118 ) ) ( not ( = ?auto_21110 ?auto_21118 ) ) ( not ( = ?auto_21108 ?auto_21118 ) ) ( not ( = ?auto_21112 ?auto_21118 ) ) ( TRUCK-AT ?auto_21114 ?auto_21119 ) ( SURFACE-AT ?auto_21107 ?auto_21119 ) ( CLEAR ?auto_21107 ) ( IS-CRATE ?auto_21108 ) ( not ( = ?auto_21107 ?auto_21108 ) ) ( not ( = ?auto_21109 ?auto_21107 ) ) ( not ( = ?auto_21110 ?auto_21107 ) ) ( not ( = ?auto_21112 ?auto_21107 ) ) ( not ( = ?auto_21118 ?auto_21107 ) ) ( AVAILABLE ?auto_21111 ) ( IN ?auto_21108 ?auto_21114 ) ( ON ?auto_21107 ?auto_21106 ) ( not ( = ?auto_21106 ?auto_21107 ) ) ( not ( = ?auto_21106 ?auto_21108 ) ) ( not ( = ?auto_21106 ?auto_21109 ) ) ( not ( = ?auto_21106 ?auto_21110 ) ) ( not ( = ?auto_21106 ?auto_21112 ) ) ( not ( = ?auto_21106 ?auto_21118 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21108 ?auto_21109 ?auto_21110 )
      ( MAKE-4CRATE-VERIFY ?auto_21106 ?auto_21107 ?auto_21108 ?auto_21109 ?auto_21110 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21120 - SURFACE
      ?auto_21121 - SURFACE
    )
    :vars
    (
      ?auto_21122 - HOIST
      ?auto_21132 - PLACE
      ?auto_21127 - SURFACE
      ?auto_21128 - PLACE
      ?auto_21124 - HOIST
      ?auto_21123 - SURFACE
      ?auto_21130 - PLACE
      ?auto_21129 - HOIST
      ?auto_21131 - SURFACE
      ?auto_21125 - SURFACE
      ?auto_21126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21122 ?auto_21132 ) ( IS-CRATE ?auto_21121 ) ( not ( = ?auto_21120 ?auto_21121 ) ) ( not ( = ?auto_21127 ?auto_21120 ) ) ( not ( = ?auto_21127 ?auto_21121 ) ) ( not ( = ?auto_21128 ?auto_21132 ) ) ( HOIST-AT ?auto_21124 ?auto_21128 ) ( not ( = ?auto_21122 ?auto_21124 ) ) ( AVAILABLE ?auto_21124 ) ( SURFACE-AT ?auto_21121 ?auto_21128 ) ( ON ?auto_21121 ?auto_21123 ) ( CLEAR ?auto_21121 ) ( not ( = ?auto_21120 ?auto_21123 ) ) ( not ( = ?auto_21121 ?auto_21123 ) ) ( not ( = ?auto_21127 ?auto_21123 ) ) ( IS-CRATE ?auto_21120 ) ( not ( = ?auto_21130 ?auto_21132 ) ) ( not ( = ?auto_21128 ?auto_21130 ) ) ( HOIST-AT ?auto_21129 ?auto_21130 ) ( not ( = ?auto_21122 ?auto_21129 ) ) ( not ( = ?auto_21124 ?auto_21129 ) ) ( AVAILABLE ?auto_21129 ) ( SURFACE-AT ?auto_21120 ?auto_21130 ) ( ON ?auto_21120 ?auto_21131 ) ( CLEAR ?auto_21120 ) ( not ( = ?auto_21120 ?auto_21131 ) ) ( not ( = ?auto_21121 ?auto_21131 ) ) ( not ( = ?auto_21127 ?auto_21131 ) ) ( not ( = ?auto_21123 ?auto_21131 ) ) ( SURFACE-AT ?auto_21125 ?auto_21132 ) ( CLEAR ?auto_21125 ) ( IS-CRATE ?auto_21127 ) ( not ( = ?auto_21125 ?auto_21127 ) ) ( not ( = ?auto_21120 ?auto_21125 ) ) ( not ( = ?auto_21121 ?auto_21125 ) ) ( not ( = ?auto_21123 ?auto_21125 ) ) ( not ( = ?auto_21131 ?auto_21125 ) ) ( AVAILABLE ?auto_21122 ) ( IN ?auto_21127 ?auto_21126 ) ( TRUCK-AT ?auto_21126 ?auto_21128 ) )
    :subtasks
    ( ( !DRIVE ?auto_21126 ?auto_21128 ?auto_21132 )
      ( MAKE-2CRATE ?auto_21127 ?auto_21120 ?auto_21121 )
      ( MAKE-1CRATE-VERIFY ?auto_21120 ?auto_21121 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21133 - SURFACE
      ?auto_21134 - SURFACE
      ?auto_21135 - SURFACE
    )
    :vars
    (
      ?auto_21136 - HOIST
      ?auto_21139 - PLACE
      ?auto_21145 - PLACE
      ?auto_21142 - HOIST
      ?auto_21141 - SURFACE
      ?auto_21144 - PLACE
      ?auto_21138 - HOIST
      ?auto_21137 - SURFACE
      ?auto_21140 - SURFACE
      ?auto_21143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21136 ?auto_21139 ) ( IS-CRATE ?auto_21135 ) ( not ( = ?auto_21134 ?auto_21135 ) ) ( not ( = ?auto_21133 ?auto_21134 ) ) ( not ( = ?auto_21133 ?auto_21135 ) ) ( not ( = ?auto_21145 ?auto_21139 ) ) ( HOIST-AT ?auto_21142 ?auto_21145 ) ( not ( = ?auto_21136 ?auto_21142 ) ) ( AVAILABLE ?auto_21142 ) ( SURFACE-AT ?auto_21135 ?auto_21145 ) ( ON ?auto_21135 ?auto_21141 ) ( CLEAR ?auto_21135 ) ( not ( = ?auto_21134 ?auto_21141 ) ) ( not ( = ?auto_21135 ?auto_21141 ) ) ( not ( = ?auto_21133 ?auto_21141 ) ) ( IS-CRATE ?auto_21134 ) ( not ( = ?auto_21144 ?auto_21139 ) ) ( not ( = ?auto_21145 ?auto_21144 ) ) ( HOIST-AT ?auto_21138 ?auto_21144 ) ( not ( = ?auto_21136 ?auto_21138 ) ) ( not ( = ?auto_21142 ?auto_21138 ) ) ( AVAILABLE ?auto_21138 ) ( SURFACE-AT ?auto_21134 ?auto_21144 ) ( ON ?auto_21134 ?auto_21137 ) ( CLEAR ?auto_21134 ) ( not ( = ?auto_21134 ?auto_21137 ) ) ( not ( = ?auto_21135 ?auto_21137 ) ) ( not ( = ?auto_21133 ?auto_21137 ) ) ( not ( = ?auto_21141 ?auto_21137 ) ) ( SURFACE-AT ?auto_21140 ?auto_21139 ) ( CLEAR ?auto_21140 ) ( IS-CRATE ?auto_21133 ) ( not ( = ?auto_21140 ?auto_21133 ) ) ( not ( = ?auto_21134 ?auto_21140 ) ) ( not ( = ?auto_21135 ?auto_21140 ) ) ( not ( = ?auto_21141 ?auto_21140 ) ) ( not ( = ?auto_21137 ?auto_21140 ) ) ( AVAILABLE ?auto_21136 ) ( IN ?auto_21133 ?auto_21143 ) ( TRUCK-AT ?auto_21143 ?auto_21145 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21134 ?auto_21135 )
      ( MAKE-2CRATE-VERIFY ?auto_21133 ?auto_21134 ?auto_21135 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21146 - SURFACE
      ?auto_21147 - SURFACE
      ?auto_21148 - SURFACE
      ?auto_21149 - SURFACE
    )
    :vars
    (
      ?auto_21153 - HOIST
      ?auto_21152 - PLACE
      ?auto_21155 - PLACE
      ?auto_21156 - HOIST
      ?auto_21157 - SURFACE
      ?auto_21158 - PLACE
      ?auto_21150 - HOIST
      ?auto_21151 - SURFACE
      ?auto_21154 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21153 ?auto_21152 ) ( IS-CRATE ?auto_21149 ) ( not ( = ?auto_21148 ?auto_21149 ) ) ( not ( = ?auto_21147 ?auto_21148 ) ) ( not ( = ?auto_21147 ?auto_21149 ) ) ( not ( = ?auto_21155 ?auto_21152 ) ) ( HOIST-AT ?auto_21156 ?auto_21155 ) ( not ( = ?auto_21153 ?auto_21156 ) ) ( AVAILABLE ?auto_21156 ) ( SURFACE-AT ?auto_21149 ?auto_21155 ) ( ON ?auto_21149 ?auto_21157 ) ( CLEAR ?auto_21149 ) ( not ( = ?auto_21148 ?auto_21157 ) ) ( not ( = ?auto_21149 ?auto_21157 ) ) ( not ( = ?auto_21147 ?auto_21157 ) ) ( IS-CRATE ?auto_21148 ) ( not ( = ?auto_21158 ?auto_21152 ) ) ( not ( = ?auto_21155 ?auto_21158 ) ) ( HOIST-AT ?auto_21150 ?auto_21158 ) ( not ( = ?auto_21153 ?auto_21150 ) ) ( not ( = ?auto_21156 ?auto_21150 ) ) ( AVAILABLE ?auto_21150 ) ( SURFACE-AT ?auto_21148 ?auto_21158 ) ( ON ?auto_21148 ?auto_21151 ) ( CLEAR ?auto_21148 ) ( not ( = ?auto_21148 ?auto_21151 ) ) ( not ( = ?auto_21149 ?auto_21151 ) ) ( not ( = ?auto_21147 ?auto_21151 ) ) ( not ( = ?auto_21157 ?auto_21151 ) ) ( SURFACE-AT ?auto_21146 ?auto_21152 ) ( CLEAR ?auto_21146 ) ( IS-CRATE ?auto_21147 ) ( not ( = ?auto_21146 ?auto_21147 ) ) ( not ( = ?auto_21148 ?auto_21146 ) ) ( not ( = ?auto_21149 ?auto_21146 ) ) ( not ( = ?auto_21157 ?auto_21146 ) ) ( not ( = ?auto_21151 ?auto_21146 ) ) ( AVAILABLE ?auto_21153 ) ( IN ?auto_21147 ?auto_21154 ) ( TRUCK-AT ?auto_21154 ?auto_21155 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21147 ?auto_21148 ?auto_21149 )
      ( MAKE-3CRATE-VERIFY ?auto_21146 ?auto_21147 ?auto_21148 ?auto_21149 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21159 - SURFACE
      ?auto_21160 - SURFACE
      ?auto_21161 - SURFACE
      ?auto_21162 - SURFACE
      ?auto_21163 - SURFACE
    )
    :vars
    (
      ?auto_21167 - HOIST
      ?auto_21166 - PLACE
      ?auto_21169 - PLACE
      ?auto_21170 - HOIST
      ?auto_21171 - SURFACE
      ?auto_21172 - PLACE
      ?auto_21164 - HOIST
      ?auto_21165 - SURFACE
      ?auto_21168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21167 ?auto_21166 ) ( IS-CRATE ?auto_21163 ) ( not ( = ?auto_21162 ?auto_21163 ) ) ( not ( = ?auto_21161 ?auto_21162 ) ) ( not ( = ?auto_21161 ?auto_21163 ) ) ( not ( = ?auto_21169 ?auto_21166 ) ) ( HOIST-AT ?auto_21170 ?auto_21169 ) ( not ( = ?auto_21167 ?auto_21170 ) ) ( AVAILABLE ?auto_21170 ) ( SURFACE-AT ?auto_21163 ?auto_21169 ) ( ON ?auto_21163 ?auto_21171 ) ( CLEAR ?auto_21163 ) ( not ( = ?auto_21162 ?auto_21171 ) ) ( not ( = ?auto_21163 ?auto_21171 ) ) ( not ( = ?auto_21161 ?auto_21171 ) ) ( IS-CRATE ?auto_21162 ) ( not ( = ?auto_21172 ?auto_21166 ) ) ( not ( = ?auto_21169 ?auto_21172 ) ) ( HOIST-AT ?auto_21164 ?auto_21172 ) ( not ( = ?auto_21167 ?auto_21164 ) ) ( not ( = ?auto_21170 ?auto_21164 ) ) ( AVAILABLE ?auto_21164 ) ( SURFACE-AT ?auto_21162 ?auto_21172 ) ( ON ?auto_21162 ?auto_21165 ) ( CLEAR ?auto_21162 ) ( not ( = ?auto_21162 ?auto_21165 ) ) ( not ( = ?auto_21163 ?auto_21165 ) ) ( not ( = ?auto_21161 ?auto_21165 ) ) ( not ( = ?auto_21171 ?auto_21165 ) ) ( SURFACE-AT ?auto_21160 ?auto_21166 ) ( CLEAR ?auto_21160 ) ( IS-CRATE ?auto_21161 ) ( not ( = ?auto_21160 ?auto_21161 ) ) ( not ( = ?auto_21162 ?auto_21160 ) ) ( not ( = ?auto_21163 ?auto_21160 ) ) ( not ( = ?auto_21171 ?auto_21160 ) ) ( not ( = ?auto_21165 ?auto_21160 ) ) ( AVAILABLE ?auto_21167 ) ( IN ?auto_21161 ?auto_21168 ) ( TRUCK-AT ?auto_21168 ?auto_21169 ) ( ON ?auto_21160 ?auto_21159 ) ( not ( = ?auto_21159 ?auto_21160 ) ) ( not ( = ?auto_21159 ?auto_21161 ) ) ( not ( = ?auto_21159 ?auto_21162 ) ) ( not ( = ?auto_21159 ?auto_21163 ) ) ( not ( = ?auto_21159 ?auto_21171 ) ) ( not ( = ?auto_21159 ?auto_21165 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21161 ?auto_21162 ?auto_21163 )
      ( MAKE-4CRATE-VERIFY ?auto_21159 ?auto_21160 ?auto_21161 ?auto_21162 ?auto_21163 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21173 - SURFACE
      ?auto_21174 - SURFACE
    )
    :vars
    (
      ?auto_21178 - HOIST
      ?auto_21177 - PLACE
      ?auto_21185 - SURFACE
      ?auto_21180 - PLACE
      ?auto_21182 - HOIST
      ?auto_21183 - SURFACE
      ?auto_21184 - PLACE
      ?auto_21175 - HOIST
      ?auto_21176 - SURFACE
      ?auto_21181 - SURFACE
      ?auto_21179 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21178 ?auto_21177 ) ( IS-CRATE ?auto_21174 ) ( not ( = ?auto_21173 ?auto_21174 ) ) ( not ( = ?auto_21185 ?auto_21173 ) ) ( not ( = ?auto_21185 ?auto_21174 ) ) ( not ( = ?auto_21180 ?auto_21177 ) ) ( HOIST-AT ?auto_21182 ?auto_21180 ) ( not ( = ?auto_21178 ?auto_21182 ) ) ( SURFACE-AT ?auto_21174 ?auto_21180 ) ( ON ?auto_21174 ?auto_21183 ) ( CLEAR ?auto_21174 ) ( not ( = ?auto_21173 ?auto_21183 ) ) ( not ( = ?auto_21174 ?auto_21183 ) ) ( not ( = ?auto_21185 ?auto_21183 ) ) ( IS-CRATE ?auto_21173 ) ( not ( = ?auto_21184 ?auto_21177 ) ) ( not ( = ?auto_21180 ?auto_21184 ) ) ( HOIST-AT ?auto_21175 ?auto_21184 ) ( not ( = ?auto_21178 ?auto_21175 ) ) ( not ( = ?auto_21182 ?auto_21175 ) ) ( AVAILABLE ?auto_21175 ) ( SURFACE-AT ?auto_21173 ?auto_21184 ) ( ON ?auto_21173 ?auto_21176 ) ( CLEAR ?auto_21173 ) ( not ( = ?auto_21173 ?auto_21176 ) ) ( not ( = ?auto_21174 ?auto_21176 ) ) ( not ( = ?auto_21185 ?auto_21176 ) ) ( not ( = ?auto_21183 ?auto_21176 ) ) ( SURFACE-AT ?auto_21181 ?auto_21177 ) ( CLEAR ?auto_21181 ) ( IS-CRATE ?auto_21185 ) ( not ( = ?auto_21181 ?auto_21185 ) ) ( not ( = ?auto_21173 ?auto_21181 ) ) ( not ( = ?auto_21174 ?auto_21181 ) ) ( not ( = ?auto_21183 ?auto_21181 ) ) ( not ( = ?auto_21176 ?auto_21181 ) ) ( AVAILABLE ?auto_21178 ) ( TRUCK-AT ?auto_21179 ?auto_21180 ) ( LIFTING ?auto_21182 ?auto_21185 ) )
    :subtasks
    ( ( !LOAD ?auto_21182 ?auto_21185 ?auto_21179 ?auto_21180 )
      ( MAKE-2CRATE ?auto_21185 ?auto_21173 ?auto_21174 )
      ( MAKE-1CRATE-VERIFY ?auto_21173 ?auto_21174 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21186 - SURFACE
      ?auto_21187 - SURFACE
      ?auto_21188 - SURFACE
    )
    :vars
    (
      ?auto_21197 - HOIST
      ?auto_21192 - PLACE
      ?auto_21196 - PLACE
      ?auto_21191 - HOIST
      ?auto_21194 - SURFACE
      ?auto_21193 - PLACE
      ?auto_21190 - HOIST
      ?auto_21195 - SURFACE
      ?auto_21198 - SURFACE
      ?auto_21189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21197 ?auto_21192 ) ( IS-CRATE ?auto_21188 ) ( not ( = ?auto_21187 ?auto_21188 ) ) ( not ( = ?auto_21186 ?auto_21187 ) ) ( not ( = ?auto_21186 ?auto_21188 ) ) ( not ( = ?auto_21196 ?auto_21192 ) ) ( HOIST-AT ?auto_21191 ?auto_21196 ) ( not ( = ?auto_21197 ?auto_21191 ) ) ( SURFACE-AT ?auto_21188 ?auto_21196 ) ( ON ?auto_21188 ?auto_21194 ) ( CLEAR ?auto_21188 ) ( not ( = ?auto_21187 ?auto_21194 ) ) ( not ( = ?auto_21188 ?auto_21194 ) ) ( not ( = ?auto_21186 ?auto_21194 ) ) ( IS-CRATE ?auto_21187 ) ( not ( = ?auto_21193 ?auto_21192 ) ) ( not ( = ?auto_21196 ?auto_21193 ) ) ( HOIST-AT ?auto_21190 ?auto_21193 ) ( not ( = ?auto_21197 ?auto_21190 ) ) ( not ( = ?auto_21191 ?auto_21190 ) ) ( AVAILABLE ?auto_21190 ) ( SURFACE-AT ?auto_21187 ?auto_21193 ) ( ON ?auto_21187 ?auto_21195 ) ( CLEAR ?auto_21187 ) ( not ( = ?auto_21187 ?auto_21195 ) ) ( not ( = ?auto_21188 ?auto_21195 ) ) ( not ( = ?auto_21186 ?auto_21195 ) ) ( not ( = ?auto_21194 ?auto_21195 ) ) ( SURFACE-AT ?auto_21198 ?auto_21192 ) ( CLEAR ?auto_21198 ) ( IS-CRATE ?auto_21186 ) ( not ( = ?auto_21198 ?auto_21186 ) ) ( not ( = ?auto_21187 ?auto_21198 ) ) ( not ( = ?auto_21188 ?auto_21198 ) ) ( not ( = ?auto_21194 ?auto_21198 ) ) ( not ( = ?auto_21195 ?auto_21198 ) ) ( AVAILABLE ?auto_21197 ) ( TRUCK-AT ?auto_21189 ?auto_21196 ) ( LIFTING ?auto_21191 ?auto_21186 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21187 ?auto_21188 )
      ( MAKE-2CRATE-VERIFY ?auto_21186 ?auto_21187 ?auto_21188 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21199 - SURFACE
      ?auto_21200 - SURFACE
      ?auto_21201 - SURFACE
      ?auto_21202 - SURFACE
    )
    :vars
    (
      ?auto_21206 - HOIST
      ?auto_21204 - PLACE
      ?auto_21208 - PLACE
      ?auto_21210 - HOIST
      ?auto_21205 - SURFACE
      ?auto_21207 - PLACE
      ?auto_21209 - HOIST
      ?auto_21211 - SURFACE
      ?auto_21203 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21206 ?auto_21204 ) ( IS-CRATE ?auto_21202 ) ( not ( = ?auto_21201 ?auto_21202 ) ) ( not ( = ?auto_21200 ?auto_21201 ) ) ( not ( = ?auto_21200 ?auto_21202 ) ) ( not ( = ?auto_21208 ?auto_21204 ) ) ( HOIST-AT ?auto_21210 ?auto_21208 ) ( not ( = ?auto_21206 ?auto_21210 ) ) ( SURFACE-AT ?auto_21202 ?auto_21208 ) ( ON ?auto_21202 ?auto_21205 ) ( CLEAR ?auto_21202 ) ( not ( = ?auto_21201 ?auto_21205 ) ) ( not ( = ?auto_21202 ?auto_21205 ) ) ( not ( = ?auto_21200 ?auto_21205 ) ) ( IS-CRATE ?auto_21201 ) ( not ( = ?auto_21207 ?auto_21204 ) ) ( not ( = ?auto_21208 ?auto_21207 ) ) ( HOIST-AT ?auto_21209 ?auto_21207 ) ( not ( = ?auto_21206 ?auto_21209 ) ) ( not ( = ?auto_21210 ?auto_21209 ) ) ( AVAILABLE ?auto_21209 ) ( SURFACE-AT ?auto_21201 ?auto_21207 ) ( ON ?auto_21201 ?auto_21211 ) ( CLEAR ?auto_21201 ) ( not ( = ?auto_21201 ?auto_21211 ) ) ( not ( = ?auto_21202 ?auto_21211 ) ) ( not ( = ?auto_21200 ?auto_21211 ) ) ( not ( = ?auto_21205 ?auto_21211 ) ) ( SURFACE-AT ?auto_21199 ?auto_21204 ) ( CLEAR ?auto_21199 ) ( IS-CRATE ?auto_21200 ) ( not ( = ?auto_21199 ?auto_21200 ) ) ( not ( = ?auto_21201 ?auto_21199 ) ) ( not ( = ?auto_21202 ?auto_21199 ) ) ( not ( = ?auto_21205 ?auto_21199 ) ) ( not ( = ?auto_21211 ?auto_21199 ) ) ( AVAILABLE ?auto_21206 ) ( TRUCK-AT ?auto_21203 ?auto_21208 ) ( LIFTING ?auto_21210 ?auto_21200 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21200 ?auto_21201 ?auto_21202 )
      ( MAKE-3CRATE-VERIFY ?auto_21199 ?auto_21200 ?auto_21201 ?auto_21202 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21212 - SURFACE
      ?auto_21213 - SURFACE
      ?auto_21214 - SURFACE
      ?auto_21215 - SURFACE
      ?auto_21216 - SURFACE
    )
    :vars
    (
      ?auto_21220 - HOIST
      ?auto_21218 - PLACE
      ?auto_21222 - PLACE
      ?auto_21224 - HOIST
      ?auto_21219 - SURFACE
      ?auto_21221 - PLACE
      ?auto_21223 - HOIST
      ?auto_21225 - SURFACE
      ?auto_21217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21220 ?auto_21218 ) ( IS-CRATE ?auto_21216 ) ( not ( = ?auto_21215 ?auto_21216 ) ) ( not ( = ?auto_21214 ?auto_21215 ) ) ( not ( = ?auto_21214 ?auto_21216 ) ) ( not ( = ?auto_21222 ?auto_21218 ) ) ( HOIST-AT ?auto_21224 ?auto_21222 ) ( not ( = ?auto_21220 ?auto_21224 ) ) ( SURFACE-AT ?auto_21216 ?auto_21222 ) ( ON ?auto_21216 ?auto_21219 ) ( CLEAR ?auto_21216 ) ( not ( = ?auto_21215 ?auto_21219 ) ) ( not ( = ?auto_21216 ?auto_21219 ) ) ( not ( = ?auto_21214 ?auto_21219 ) ) ( IS-CRATE ?auto_21215 ) ( not ( = ?auto_21221 ?auto_21218 ) ) ( not ( = ?auto_21222 ?auto_21221 ) ) ( HOIST-AT ?auto_21223 ?auto_21221 ) ( not ( = ?auto_21220 ?auto_21223 ) ) ( not ( = ?auto_21224 ?auto_21223 ) ) ( AVAILABLE ?auto_21223 ) ( SURFACE-AT ?auto_21215 ?auto_21221 ) ( ON ?auto_21215 ?auto_21225 ) ( CLEAR ?auto_21215 ) ( not ( = ?auto_21215 ?auto_21225 ) ) ( not ( = ?auto_21216 ?auto_21225 ) ) ( not ( = ?auto_21214 ?auto_21225 ) ) ( not ( = ?auto_21219 ?auto_21225 ) ) ( SURFACE-AT ?auto_21213 ?auto_21218 ) ( CLEAR ?auto_21213 ) ( IS-CRATE ?auto_21214 ) ( not ( = ?auto_21213 ?auto_21214 ) ) ( not ( = ?auto_21215 ?auto_21213 ) ) ( not ( = ?auto_21216 ?auto_21213 ) ) ( not ( = ?auto_21219 ?auto_21213 ) ) ( not ( = ?auto_21225 ?auto_21213 ) ) ( AVAILABLE ?auto_21220 ) ( TRUCK-AT ?auto_21217 ?auto_21222 ) ( LIFTING ?auto_21224 ?auto_21214 ) ( ON ?auto_21213 ?auto_21212 ) ( not ( = ?auto_21212 ?auto_21213 ) ) ( not ( = ?auto_21212 ?auto_21214 ) ) ( not ( = ?auto_21212 ?auto_21215 ) ) ( not ( = ?auto_21212 ?auto_21216 ) ) ( not ( = ?auto_21212 ?auto_21219 ) ) ( not ( = ?auto_21212 ?auto_21225 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21214 ?auto_21215 ?auto_21216 )
      ( MAKE-4CRATE-VERIFY ?auto_21212 ?auto_21213 ?auto_21214 ?auto_21215 ?auto_21216 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21226 - SURFACE
      ?auto_21227 - SURFACE
    )
    :vars
    (
      ?auto_21231 - HOIST
      ?auto_21229 - PLACE
      ?auto_21238 - SURFACE
      ?auto_21234 - PLACE
      ?auto_21236 - HOIST
      ?auto_21230 - SURFACE
      ?auto_21232 - PLACE
      ?auto_21235 - HOIST
      ?auto_21237 - SURFACE
      ?auto_21233 - SURFACE
      ?auto_21228 - TRUCK
      ?auto_21239 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21231 ?auto_21229 ) ( IS-CRATE ?auto_21227 ) ( not ( = ?auto_21226 ?auto_21227 ) ) ( not ( = ?auto_21238 ?auto_21226 ) ) ( not ( = ?auto_21238 ?auto_21227 ) ) ( not ( = ?auto_21234 ?auto_21229 ) ) ( HOIST-AT ?auto_21236 ?auto_21234 ) ( not ( = ?auto_21231 ?auto_21236 ) ) ( SURFACE-AT ?auto_21227 ?auto_21234 ) ( ON ?auto_21227 ?auto_21230 ) ( CLEAR ?auto_21227 ) ( not ( = ?auto_21226 ?auto_21230 ) ) ( not ( = ?auto_21227 ?auto_21230 ) ) ( not ( = ?auto_21238 ?auto_21230 ) ) ( IS-CRATE ?auto_21226 ) ( not ( = ?auto_21232 ?auto_21229 ) ) ( not ( = ?auto_21234 ?auto_21232 ) ) ( HOIST-AT ?auto_21235 ?auto_21232 ) ( not ( = ?auto_21231 ?auto_21235 ) ) ( not ( = ?auto_21236 ?auto_21235 ) ) ( AVAILABLE ?auto_21235 ) ( SURFACE-AT ?auto_21226 ?auto_21232 ) ( ON ?auto_21226 ?auto_21237 ) ( CLEAR ?auto_21226 ) ( not ( = ?auto_21226 ?auto_21237 ) ) ( not ( = ?auto_21227 ?auto_21237 ) ) ( not ( = ?auto_21238 ?auto_21237 ) ) ( not ( = ?auto_21230 ?auto_21237 ) ) ( SURFACE-AT ?auto_21233 ?auto_21229 ) ( CLEAR ?auto_21233 ) ( IS-CRATE ?auto_21238 ) ( not ( = ?auto_21233 ?auto_21238 ) ) ( not ( = ?auto_21226 ?auto_21233 ) ) ( not ( = ?auto_21227 ?auto_21233 ) ) ( not ( = ?auto_21230 ?auto_21233 ) ) ( not ( = ?auto_21237 ?auto_21233 ) ) ( AVAILABLE ?auto_21231 ) ( TRUCK-AT ?auto_21228 ?auto_21234 ) ( AVAILABLE ?auto_21236 ) ( SURFACE-AT ?auto_21238 ?auto_21234 ) ( ON ?auto_21238 ?auto_21239 ) ( CLEAR ?auto_21238 ) ( not ( = ?auto_21226 ?auto_21239 ) ) ( not ( = ?auto_21227 ?auto_21239 ) ) ( not ( = ?auto_21238 ?auto_21239 ) ) ( not ( = ?auto_21230 ?auto_21239 ) ) ( not ( = ?auto_21237 ?auto_21239 ) ) ( not ( = ?auto_21233 ?auto_21239 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21236 ?auto_21238 ?auto_21239 ?auto_21234 )
      ( MAKE-2CRATE ?auto_21238 ?auto_21226 ?auto_21227 )
      ( MAKE-1CRATE-VERIFY ?auto_21226 ?auto_21227 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21240 - SURFACE
      ?auto_21241 - SURFACE
      ?auto_21242 - SURFACE
    )
    :vars
    (
      ?auto_21250 - HOIST
      ?auto_21248 - PLACE
      ?auto_21252 - PLACE
      ?auto_21251 - HOIST
      ?auto_21253 - SURFACE
      ?auto_21247 - PLACE
      ?auto_21246 - HOIST
      ?auto_21245 - SURFACE
      ?auto_21244 - SURFACE
      ?auto_21243 - TRUCK
      ?auto_21249 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21250 ?auto_21248 ) ( IS-CRATE ?auto_21242 ) ( not ( = ?auto_21241 ?auto_21242 ) ) ( not ( = ?auto_21240 ?auto_21241 ) ) ( not ( = ?auto_21240 ?auto_21242 ) ) ( not ( = ?auto_21252 ?auto_21248 ) ) ( HOIST-AT ?auto_21251 ?auto_21252 ) ( not ( = ?auto_21250 ?auto_21251 ) ) ( SURFACE-AT ?auto_21242 ?auto_21252 ) ( ON ?auto_21242 ?auto_21253 ) ( CLEAR ?auto_21242 ) ( not ( = ?auto_21241 ?auto_21253 ) ) ( not ( = ?auto_21242 ?auto_21253 ) ) ( not ( = ?auto_21240 ?auto_21253 ) ) ( IS-CRATE ?auto_21241 ) ( not ( = ?auto_21247 ?auto_21248 ) ) ( not ( = ?auto_21252 ?auto_21247 ) ) ( HOIST-AT ?auto_21246 ?auto_21247 ) ( not ( = ?auto_21250 ?auto_21246 ) ) ( not ( = ?auto_21251 ?auto_21246 ) ) ( AVAILABLE ?auto_21246 ) ( SURFACE-AT ?auto_21241 ?auto_21247 ) ( ON ?auto_21241 ?auto_21245 ) ( CLEAR ?auto_21241 ) ( not ( = ?auto_21241 ?auto_21245 ) ) ( not ( = ?auto_21242 ?auto_21245 ) ) ( not ( = ?auto_21240 ?auto_21245 ) ) ( not ( = ?auto_21253 ?auto_21245 ) ) ( SURFACE-AT ?auto_21244 ?auto_21248 ) ( CLEAR ?auto_21244 ) ( IS-CRATE ?auto_21240 ) ( not ( = ?auto_21244 ?auto_21240 ) ) ( not ( = ?auto_21241 ?auto_21244 ) ) ( not ( = ?auto_21242 ?auto_21244 ) ) ( not ( = ?auto_21253 ?auto_21244 ) ) ( not ( = ?auto_21245 ?auto_21244 ) ) ( AVAILABLE ?auto_21250 ) ( TRUCK-AT ?auto_21243 ?auto_21252 ) ( AVAILABLE ?auto_21251 ) ( SURFACE-AT ?auto_21240 ?auto_21252 ) ( ON ?auto_21240 ?auto_21249 ) ( CLEAR ?auto_21240 ) ( not ( = ?auto_21241 ?auto_21249 ) ) ( not ( = ?auto_21242 ?auto_21249 ) ) ( not ( = ?auto_21240 ?auto_21249 ) ) ( not ( = ?auto_21253 ?auto_21249 ) ) ( not ( = ?auto_21245 ?auto_21249 ) ) ( not ( = ?auto_21244 ?auto_21249 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21241 ?auto_21242 )
      ( MAKE-2CRATE-VERIFY ?auto_21240 ?auto_21241 ?auto_21242 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21254 - SURFACE
      ?auto_21255 - SURFACE
      ?auto_21256 - SURFACE
      ?auto_21257 - SURFACE
    )
    :vars
    (
      ?auto_21258 - HOIST
      ?auto_21261 - PLACE
      ?auto_21264 - PLACE
      ?auto_21259 - HOIST
      ?auto_21265 - SURFACE
      ?auto_21266 - PLACE
      ?auto_21267 - HOIST
      ?auto_21260 - SURFACE
      ?auto_21263 - TRUCK
      ?auto_21262 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21258 ?auto_21261 ) ( IS-CRATE ?auto_21257 ) ( not ( = ?auto_21256 ?auto_21257 ) ) ( not ( = ?auto_21255 ?auto_21256 ) ) ( not ( = ?auto_21255 ?auto_21257 ) ) ( not ( = ?auto_21264 ?auto_21261 ) ) ( HOIST-AT ?auto_21259 ?auto_21264 ) ( not ( = ?auto_21258 ?auto_21259 ) ) ( SURFACE-AT ?auto_21257 ?auto_21264 ) ( ON ?auto_21257 ?auto_21265 ) ( CLEAR ?auto_21257 ) ( not ( = ?auto_21256 ?auto_21265 ) ) ( not ( = ?auto_21257 ?auto_21265 ) ) ( not ( = ?auto_21255 ?auto_21265 ) ) ( IS-CRATE ?auto_21256 ) ( not ( = ?auto_21266 ?auto_21261 ) ) ( not ( = ?auto_21264 ?auto_21266 ) ) ( HOIST-AT ?auto_21267 ?auto_21266 ) ( not ( = ?auto_21258 ?auto_21267 ) ) ( not ( = ?auto_21259 ?auto_21267 ) ) ( AVAILABLE ?auto_21267 ) ( SURFACE-AT ?auto_21256 ?auto_21266 ) ( ON ?auto_21256 ?auto_21260 ) ( CLEAR ?auto_21256 ) ( not ( = ?auto_21256 ?auto_21260 ) ) ( not ( = ?auto_21257 ?auto_21260 ) ) ( not ( = ?auto_21255 ?auto_21260 ) ) ( not ( = ?auto_21265 ?auto_21260 ) ) ( SURFACE-AT ?auto_21254 ?auto_21261 ) ( CLEAR ?auto_21254 ) ( IS-CRATE ?auto_21255 ) ( not ( = ?auto_21254 ?auto_21255 ) ) ( not ( = ?auto_21256 ?auto_21254 ) ) ( not ( = ?auto_21257 ?auto_21254 ) ) ( not ( = ?auto_21265 ?auto_21254 ) ) ( not ( = ?auto_21260 ?auto_21254 ) ) ( AVAILABLE ?auto_21258 ) ( TRUCK-AT ?auto_21263 ?auto_21264 ) ( AVAILABLE ?auto_21259 ) ( SURFACE-AT ?auto_21255 ?auto_21264 ) ( ON ?auto_21255 ?auto_21262 ) ( CLEAR ?auto_21255 ) ( not ( = ?auto_21256 ?auto_21262 ) ) ( not ( = ?auto_21257 ?auto_21262 ) ) ( not ( = ?auto_21255 ?auto_21262 ) ) ( not ( = ?auto_21265 ?auto_21262 ) ) ( not ( = ?auto_21260 ?auto_21262 ) ) ( not ( = ?auto_21254 ?auto_21262 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21255 ?auto_21256 ?auto_21257 )
      ( MAKE-3CRATE-VERIFY ?auto_21254 ?auto_21255 ?auto_21256 ?auto_21257 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21268 - SURFACE
      ?auto_21269 - SURFACE
      ?auto_21270 - SURFACE
      ?auto_21271 - SURFACE
      ?auto_21272 - SURFACE
    )
    :vars
    (
      ?auto_21273 - HOIST
      ?auto_21276 - PLACE
      ?auto_21279 - PLACE
      ?auto_21274 - HOIST
      ?auto_21280 - SURFACE
      ?auto_21281 - PLACE
      ?auto_21282 - HOIST
      ?auto_21275 - SURFACE
      ?auto_21278 - TRUCK
      ?auto_21277 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21273 ?auto_21276 ) ( IS-CRATE ?auto_21272 ) ( not ( = ?auto_21271 ?auto_21272 ) ) ( not ( = ?auto_21270 ?auto_21271 ) ) ( not ( = ?auto_21270 ?auto_21272 ) ) ( not ( = ?auto_21279 ?auto_21276 ) ) ( HOIST-AT ?auto_21274 ?auto_21279 ) ( not ( = ?auto_21273 ?auto_21274 ) ) ( SURFACE-AT ?auto_21272 ?auto_21279 ) ( ON ?auto_21272 ?auto_21280 ) ( CLEAR ?auto_21272 ) ( not ( = ?auto_21271 ?auto_21280 ) ) ( not ( = ?auto_21272 ?auto_21280 ) ) ( not ( = ?auto_21270 ?auto_21280 ) ) ( IS-CRATE ?auto_21271 ) ( not ( = ?auto_21281 ?auto_21276 ) ) ( not ( = ?auto_21279 ?auto_21281 ) ) ( HOIST-AT ?auto_21282 ?auto_21281 ) ( not ( = ?auto_21273 ?auto_21282 ) ) ( not ( = ?auto_21274 ?auto_21282 ) ) ( AVAILABLE ?auto_21282 ) ( SURFACE-AT ?auto_21271 ?auto_21281 ) ( ON ?auto_21271 ?auto_21275 ) ( CLEAR ?auto_21271 ) ( not ( = ?auto_21271 ?auto_21275 ) ) ( not ( = ?auto_21272 ?auto_21275 ) ) ( not ( = ?auto_21270 ?auto_21275 ) ) ( not ( = ?auto_21280 ?auto_21275 ) ) ( SURFACE-AT ?auto_21269 ?auto_21276 ) ( CLEAR ?auto_21269 ) ( IS-CRATE ?auto_21270 ) ( not ( = ?auto_21269 ?auto_21270 ) ) ( not ( = ?auto_21271 ?auto_21269 ) ) ( not ( = ?auto_21272 ?auto_21269 ) ) ( not ( = ?auto_21280 ?auto_21269 ) ) ( not ( = ?auto_21275 ?auto_21269 ) ) ( AVAILABLE ?auto_21273 ) ( TRUCK-AT ?auto_21278 ?auto_21279 ) ( AVAILABLE ?auto_21274 ) ( SURFACE-AT ?auto_21270 ?auto_21279 ) ( ON ?auto_21270 ?auto_21277 ) ( CLEAR ?auto_21270 ) ( not ( = ?auto_21271 ?auto_21277 ) ) ( not ( = ?auto_21272 ?auto_21277 ) ) ( not ( = ?auto_21270 ?auto_21277 ) ) ( not ( = ?auto_21280 ?auto_21277 ) ) ( not ( = ?auto_21275 ?auto_21277 ) ) ( not ( = ?auto_21269 ?auto_21277 ) ) ( ON ?auto_21269 ?auto_21268 ) ( not ( = ?auto_21268 ?auto_21269 ) ) ( not ( = ?auto_21268 ?auto_21270 ) ) ( not ( = ?auto_21268 ?auto_21271 ) ) ( not ( = ?auto_21268 ?auto_21272 ) ) ( not ( = ?auto_21268 ?auto_21280 ) ) ( not ( = ?auto_21268 ?auto_21275 ) ) ( not ( = ?auto_21268 ?auto_21277 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21270 ?auto_21271 ?auto_21272 )
      ( MAKE-4CRATE-VERIFY ?auto_21268 ?auto_21269 ?auto_21270 ?auto_21271 ?auto_21272 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21283 - SURFACE
      ?auto_21284 - SURFACE
    )
    :vars
    (
      ?auto_21285 - HOIST
      ?auto_21288 - PLACE
      ?auto_21294 - SURFACE
      ?auto_21291 - PLACE
      ?auto_21286 - HOIST
      ?auto_21292 - SURFACE
      ?auto_21293 - PLACE
      ?auto_21295 - HOIST
      ?auto_21287 - SURFACE
      ?auto_21296 - SURFACE
      ?auto_21289 - SURFACE
      ?auto_21290 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21285 ?auto_21288 ) ( IS-CRATE ?auto_21284 ) ( not ( = ?auto_21283 ?auto_21284 ) ) ( not ( = ?auto_21294 ?auto_21283 ) ) ( not ( = ?auto_21294 ?auto_21284 ) ) ( not ( = ?auto_21291 ?auto_21288 ) ) ( HOIST-AT ?auto_21286 ?auto_21291 ) ( not ( = ?auto_21285 ?auto_21286 ) ) ( SURFACE-AT ?auto_21284 ?auto_21291 ) ( ON ?auto_21284 ?auto_21292 ) ( CLEAR ?auto_21284 ) ( not ( = ?auto_21283 ?auto_21292 ) ) ( not ( = ?auto_21284 ?auto_21292 ) ) ( not ( = ?auto_21294 ?auto_21292 ) ) ( IS-CRATE ?auto_21283 ) ( not ( = ?auto_21293 ?auto_21288 ) ) ( not ( = ?auto_21291 ?auto_21293 ) ) ( HOIST-AT ?auto_21295 ?auto_21293 ) ( not ( = ?auto_21285 ?auto_21295 ) ) ( not ( = ?auto_21286 ?auto_21295 ) ) ( AVAILABLE ?auto_21295 ) ( SURFACE-AT ?auto_21283 ?auto_21293 ) ( ON ?auto_21283 ?auto_21287 ) ( CLEAR ?auto_21283 ) ( not ( = ?auto_21283 ?auto_21287 ) ) ( not ( = ?auto_21284 ?auto_21287 ) ) ( not ( = ?auto_21294 ?auto_21287 ) ) ( not ( = ?auto_21292 ?auto_21287 ) ) ( SURFACE-AT ?auto_21296 ?auto_21288 ) ( CLEAR ?auto_21296 ) ( IS-CRATE ?auto_21294 ) ( not ( = ?auto_21296 ?auto_21294 ) ) ( not ( = ?auto_21283 ?auto_21296 ) ) ( not ( = ?auto_21284 ?auto_21296 ) ) ( not ( = ?auto_21292 ?auto_21296 ) ) ( not ( = ?auto_21287 ?auto_21296 ) ) ( AVAILABLE ?auto_21285 ) ( AVAILABLE ?auto_21286 ) ( SURFACE-AT ?auto_21294 ?auto_21291 ) ( ON ?auto_21294 ?auto_21289 ) ( CLEAR ?auto_21294 ) ( not ( = ?auto_21283 ?auto_21289 ) ) ( not ( = ?auto_21284 ?auto_21289 ) ) ( not ( = ?auto_21294 ?auto_21289 ) ) ( not ( = ?auto_21292 ?auto_21289 ) ) ( not ( = ?auto_21287 ?auto_21289 ) ) ( not ( = ?auto_21296 ?auto_21289 ) ) ( TRUCK-AT ?auto_21290 ?auto_21288 ) )
    :subtasks
    ( ( !DRIVE ?auto_21290 ?auto_21288 ?auto_21291 )
      ( MAKE-2CRATE ?auto_21294 ?auto_21283 ?auto_21284 )
      ( MAKE-1CRATE-VERIFY ?auto_21283 ?auto_21284 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21297 - SURFACE
      ?auto_21298 - SURFACE
      ?auto_21299 - SURFACE
    )
    :vars
    (
      ?auto_21308 - HOIST
      ?auto_21309 - PLACE
      ?auto_21310 - PLACE
      ?auto_21306 - HOIST
      ?auto_21303 - SURFACE
      ?auto_21304 - PLACE
      ?auto_21301 - HOIST
      ?auto_21302 - SURFACE
      ?auto_21300 - SURFACE
      ?auto_21305 - SURFACE
      ?auto_21307 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21308 ?auto_21309 ) ( IS-CRATE ?auto_21299 ) ( not ( = ?auto_21298 ?auto_21299 ) ) ( not ( = ?auto_21297 ?auto_21298 ) ) ( not ( = ?auto_21297 ?auto_21299 ) ) ( not ( = ?auto_21310 ?auto_21309 ) ) ( HOIST-AT ?auto_21306 ?auto_21310 ) ( not ( = ?auto_21308 ?auto_21306 ) ) ( SURFACE-AT ?auto_21299 ?auto_21310 ) ( ON ?auto_21299 ?auto_21303 ) ( CLEAR ?auto_21299 ) ( not ( = ?auto_21298 ?auto_21303 ) ) ( not ( = ?auto_21299 ?auto_21303 ) ) ( not ( = ?auto_21297 ?auto_21303 ) ) ( IS-CRATE ?auto_21298 ) ( not ( = ?auto_21304 ?auto_21309 ) ) ( not ( = ?auto_21310 ?auto_21304 ) ) ( HOIST-AT ?auto_21301 ?auto_21304 ) ( not ( = ?auto_21308 ?auto_21301 ) ) ( not ( = ?auto_21306 ?auto_21301 ) ) ( AVAILABLE ?auto_21301 ) ( SURFACE-AT ?auto_21298 ?auto_21304 ) ( ON ?auto_21298 ?auto_21302 ) ( CLEAR ?auto_21298 ) ( not ( = ?auto_21298 ?auto_21302 ) ) ( not ( = ?auto_21299 ?auto_21302 ) ) ( not ( = ?auto_21297 ?auto_21302 ) ) ( not ( = ?auto_21303 ?auto_21302 ) ) ( SURFACE-AT ?auto_21300 ?auto_21309 ) ( CLEAR ?auto_21300 ) ( IS-CRATE ?auto_21297 ) ( not ( = ?auto_21300 ?auto_21297 ) ) ( not ( = ?auto_21298 ?auto_21300 ) ) ( not ( = ?auto_21299 ?auto_21300 ) ) ( not ( = ?auto_21303 ?auto_21300 ) ) ( not ( = ?auto_21302 ?auto_21300 ) ) ( AVAILABLE ?auto_21308 ) ( AVAILABLE ?auto_21306 ) ( SURFACE-AT ?auto_21297 ?auto_21310 ) ( ON ?auto_21297 ?auto_21305 ) ( CLEAR ?auto_21297 ) ( not ( = ?auto_21298 ?auto_21305 ) ) ( not ( = ?auto_21299 ?auto_21305 ) ) ( not ( = ?auto_21297 ?auto_21305 ) ) ( not ( = ?auto_21303 ?auto_21305 ) ) ( not ( = ?auto_21302 ?auto_21305 ) ) ( not ( = ?auto_21300 ?auto_21305 ) ) ( TRUCK-AT ?auto_21307 ?auto_21309 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21298 ?auto_21299 )
      ( MAKE-2CRATE-VERIFY ?auto_21297 ?auto_21298 ?auto_21299 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21311 - SURFACE
      ?auto_21312 - SURFACE
      ?auto_21313 - SURFACE
      ?auto_21314 - SURFACE
    )
    :vars
    (
      ?auto_21319 - HOIST
      ?auto_21316 - PLACE
      ?auto_21318 - PLACE
      ?auto_21320 - HOIST
      ?auto_21324 - SURFACE
      ?auto_21315 - PLACE
      ?auto_21322 - HOIST
      ?auto_21323 - SURFACE
      ?auto_21317 - SURFACE
      ?auto_21321 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21319 ?auto_21316 ) ( IS-CRATE ?auto_21314 ) ( not ( = ?auto_21313 ?auto_21314 ) ) ( not ( = ?auto_21312 ?auto_21313 ) ) ( not ( = ?auto_21312 ?auto_21314 ) ) ( not ( = ?auto_21318 ?auto_21316 ) ) ( HOIST-AT ?auto_21320 ?auto_21318 ) ( not ( = ?auto_21319 ?auto_21320 ) ) ( SURFACE-AT ?auto_21314 ?auto_21318 ) ( ON ?auto_21314 ?auto_21324 ) ( CLEAR ?auto_21314 ) ( not ( = ?auto_21313 ?auto_21324 ) ) ( not ( = ?auto_21314 ?auto_21324 ) ) ( not ( = ?auto_21312 ?auto_21324 ) ) ( IS-CRATE ?auto_21313 ) ( not ( = ?auto_21315 ?auto_21316 ) ) ( not ( = ?auto_21318 ?auto_21315 ) ) ( HOIST-AT ?auto_21322 ?auto_21315 ) ( not ( = ?auto_21319 ?auto_21322 ) ) ( not ( = ?auto_21320 ?auto_21322 ) ) ( AVAILABLE ?auto_21322 ) ( SURFACE-AT ?auto_21313 ?auto_21315 ) ( ON ?auto_21313 ?auto_21323 ) ( CLEAR ?auto_21313 ) ( not ( = ?auto_21313 ?auto_21323 ) ) ( not ( = ?auto_21314 ?auto_21323 ) ) ( not ( = ?auto_21312 ?auto_21323 ) ) ( not ( = ?auto_21324 ?auto_21323 ) ) ( SURFACE-AT ?auto_21311 ?auto_21316 ) ( CLEAR ?auto_21311 ) ( IS-CRATE ?auto_21312 ) ( not ( = ?auto_21311 ?auto_21312 ) ) ( not ( = ?auto_21313 ?auto_21311 ) ) ( not ( = ?auto_21314 ?auto_21311 ) ) ( not ( = ?auto_21324 ?auto_21311 ) ) ( not ( = ?auto_21323 ?auto_21311 ) ) ( AVAILABLE ?auto_21319 ) ( AVAILABLE ?auto_21320 ) ( SURFACE-AT ?auto_21312 ?auto_21318 ) ( ON ?auto_21312 ?auto_21317 ) ( CLEAR ?auto_21312 ) ( not ( = ?auto_21313 ?auto_21317 ) ) ( not ( = ?auto_21314 ?auto_21317 ) ) ( not ( = ?auto_21312 ?auto_21317 ) ) ( not ( = ?auto_21324 ?auto_21317 ) ) ( not ( = ?auto_21323 ?auto_21317 ) ) ( not ( = ?auto_21311 ?auto_21317 ) ) ( TRUCK-AT ?auto_21321 ?auto_21316 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21312 ?auto_21313 ?auto_21314 )
      ( MAKE-3CRATE-VERIFY ?auto_21311 ?auto_21312 ?auto_21313 ?auto_21314 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21325 - SURFACE
      ?auto_21326 - SURFACE
      ?auto_21327 - SURFACE
      ?auto_21328 - SURFACE
      ?auto_21329 - SURFACE
    )
    :vars
    (
      ?auto_21334 - HOIST
      ?auto_21331 - PLACE
      ?auto_21333 - PLACE
      ?auto_21335 - HOIST
      ?auto_21339 - SURFACE
      ?auto_21330 - PLACE
      ?auto_21337 - HOIST
      ?auto_21338 - SURFACE
      ?auto_21332 - SURFACE
      ?auto_21336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21334 ?auto_21331 ) ( IS-CRATE ?auto_21329 ) ( not ( = ?auto_21328 ?auto_21329 ) ) ( not ( = ?auto_21327 ?auto_21328 ) ) ( not ( = ?auto_21327 ?auto_21329 ) ) ( not ( = ?auto_21333 ?auto_21331 ) ) ( HOIST-AT ?auto_21335 ?auto_21333 ) ( not ( = ?auto_21334 ?auto_21335 ) ) ( SURFACE-AT ?auto_21329 ?auto_21333 ) ( ON ?auto_21329 ?auto_21339 ) ( CLEAR ?auto_21329 ) ( not ( = ?auto_21328 ?auto_21339 ) ) ( not ( = ?auto_21329 ?auto_21339 ) ) ( not ( = ?auto_21327 ?auto_21339 ) ) ( IS-CRATE ?auto_21328 ) ( not ( = ?auto_21330 ?auto_21331 ) ) ( not ( = ?auto_21333 ?auto_21330 ) ) ( HOIST-AT ?auto_21337 ?auto_21330 ) ( not ( = ?auto_21334 ?auto_21337 ) ) ( not ( = ?auto_21335 ?auto_21337 ) ) ( AVAILABLE ?auto_21337 ) ( SURFACE-AT ?auto_21328 ?auto_21330 ) ( ON ?auto_21328 ?auto_21338 ) ( CLEAR ?auto_21328 ) ( not ( = ?auto_21328 ?auto_21338 ) ) ( not ( = ?auto_21329 ?auto_21338 ) ) ( not ( = ?auto_21327 ?auto_21338 ) ) ( not ( = ?auto_21339 ?auto_21338 ) ) ( SURFACE-AT ?auto_21326 ?auto_21331 ) ( CLEAR ?auto_21326 ) ( IS-CRATE ?auto_21327 ) ( not ( = ?auto_21326 ?auto_21327 ) ) ( not ( = ?auto_21328 ?auto_21326 ) ) ( not ( = ?auto_21329 ?auto_21326 ) ) ( not ( = ?auto_21339 ?auto_21326 ) ) ( not ( = ?auto_21338 ?auto_21326 ) ) ( AVAILABLE ?auto_21334 ) ( AVAILABLE ?auto_21335 ) ( SURFACE-AT ?auto_21327 ?auto_21333 ) ( ON ?auto_21327 ?auto_21332 ) ( CLEAR ?auto_21327 ) ( not ( = ?auto_21328 ?auto_21332 ) ) ( not ( = ?auto_21329 ?auto_21332 ) ) ( not ( = ?auto_21327 ?auto_21332 ) ) ( not ( = ?auto_21339 ?auto_21332 ) ) ( not ( = ?auto_21338 ?auto_21332 ) ) ( not ( = ?auto_21326 ?auto_21332 ) ) ( TRUCK-AT ?auto_21336 ?auto_21331 ) ( ON ?auto_21326 ?auto_21325 ) ( not ( = ?auto_21325 ?auto_21326 ) ) ( not ( = ?auto_21325 ?auto_21327 ) ) ( not ( = ?auto_21325 ?auto_21328 ) ) ( not ( = ?auto_21325 ?auto_21329 ) ) ( not ( = ?auto_21325 ?auto_21339 ) ) ( not ( = ?auto_21325 ?auto_21338 ) ) ( not ( = ?auto_21325 ?auto_21332 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21327 ?auto_21328 ?auto_21329 )
      ( MAKE-4CRATE-VERIFY ?auto_21325 ?auto_21326 ?auto_21327 ?auto_21328 ?auto_21329 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21340 - SURFACE
      ?auto_21341 - SURFACE
    )
    :vars
    (
      ?auto_21347 - HOIST
      ?auto_21344 - PLACE
      ?auto_21343 - SURFACE
      ?auto_21346 - PLACE
      ?auto_21349 - HOIST
      ?auto_21353 - SURFACE
      ?auto_21342 - PLACE
      ?auto_21351 - HOIST
      ?auto_21352 - SURFACE
      ?auto_21348 - SURFACE
      ?auto_21345 - SURFACE
      ?auto_21350 - TRUCK
      ?auto_21354 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21347 ?auto_21344 ) ( IS-CRATE ?auto_21341 ) ( not ( = ?auto_21340 ?auto_21341 ) ) ( not ( = ?auto_21343 ?auto_21340 ) ) ( not ( = ?auto_21343 ?auto_21341 ) ) ( not ( = ?auto_21346 ?auto_21344 ) ) ( HOIST-AT ?auto_21349 ?auto_21346 ) ( not ( = ?auto_21347 ?auto_21349 ) ) ( SURFACE-AT ?auto_21341 ?auto_21346 ) ( ON ?auto_21341 ?auto_21353 ) ( CLEAR ?auto_21341 ) ( not ( = ?auto_21340 ?auto_21353 ) ) ( not ( = ?auto_21341 ?auto_21353 ) ) ( not ( = ?auto_21343 ?auto_21353 ) ) ( IS-CRATE ?auto_21340 ) ( not ( = ?auto_21342 ?auto_21344 ) ) ( not ( = ?auto_21346 ?auto_21342 ) ) ( HOIST-AT ?auto_21351 ?auto_21342 ) ( not ( = ?auto_21347 ?auto_21351 ) ) ( not ( = ?auto_21349 ?auto_21351 ) ) ( AVAILABLE ?auto_21351 ) ( SURFACE-AT ?auto_21340 ?auto_21342 ) ( ON ?auto_21340 ?auto_21352 ) ( CLEAR ?auto_21340 ) ( not ( = ?auto_21340 ?auto_21352 ) ) ( not ( = ?auto_21341 ?auto_21352 ) ) ( not ( = ?auto_21343 ?auto_21352 ) ) ( not ( = ?auto_21353 ?auto_21352 ) ) ( IS-CRATE ?auto_21343 ) ( not ( = ?auto_21348 ?auto_21343 ) ) ( not ( = ?auto_21340 ?auto_21348 ) ) ( not ( = ?auto_21341 ?auto_21348 ) ) ( not ( = ?auto_21353 ?auto_21348 ) ) ( not ( = ?auto_21352 ?auto_21348 ) ) ( AVAILABLE ?auto_21349 ) ( SURFACE-AT ?auto_21343 ?auto_21346 ) ( ON ?auto_21343 ?auto_21345 ) ( CLEAR ?auto_21343 ) ( not ( = ?auto_21340 ?auto_21345 ) ) ( not ( = ?auto_21341 ?auto_21345 ) ) ( not ( = ?auto_21343 ?auto_21345 ) ) ( not ( = ?auto_21353 ?auto_21345 ) ) ( not ( = ?auto_21352 ?auto_21345 ) ) ( not ( = ?auto_21348 ?auto_21345 ) ) ( TRUCK-AT ?auto_21350 ?auto_21344 ) ( SURFACE-AT ?auto_21354 ?auto_21344 ) ( CLEAR ?auto_21354 ) ( LIFTING ?auto_21347 ?auto_21348 ) ( IS-CRATE ?auto_21348 ) ( not ( = ?auto_21354 ?auto_21348 ) ) ( not ( = ?auto_21340 ?auto_21354 ) ) ( not ( = ?auto_21341 ?auto_21354 ) ) ( not ( = ?auto_21343 ?auto_21354 ) ) ( not ( = ?auto_21353 ?auto_21354 ) ) ( not ( = ?auto_21352 ?auto_21354 ) ) ( not ( = ?auto_21345 ?auto_21354 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21354 ?auto_21348 )
      ( MAKE-2CRATE ?auto_21343 ?auto_21340 ?auto_21341 )
      ( MAKE-1CRATE-VERIFY ?auto_21340 ?auto_21341 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21355 - SURFACE
      ?auto_21356 - SURFACE
      ?auto_21357 - SURFACE
    )
    :vars
    (
      ?auto_21361 - HOIST
      ?auto_21360 - PLACE
      ?auto_21368 - PLACE
      ?auto_21366 - HOIST
      ?auto_21363 - SURFACE
      ?auto_21358 - PLACE
      ?auto_21369 - HOIST
      ?auto_21367 - SURFACE
      ?auto_21362 - SURFACE
      ?auto_21359 - SURFACE
      ?auto_21364 - TRUCK
      ?auto_21365 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21361 ?auto_21360 ) ( IS-CRATE ?auto_21357 ) ( not ( = ?auto_21356 ?auto_21357 ) ) ( not ( = ?auto_21355 ?auto_21356 ) ) ( not ( = ?auto_21355 ?auto_21357 ) ) ( not ( = ?auto_21368 ?auto_21360 ) ) ( HOIST-AT ?auto_21366 ?auto_21368 ) ( not ( = ?auto_21361 ?auto_21366 ) ) ( SURFACE-AT ?auto_21357 ?auto_21368 ) ( ON ?auto_21357 ?auto_21363 ) ( CLEAR ?auto_21357 ) ( not ( = ?auto_21356 ?auto_21363 ) ) ( not ( = ?auto_21357 ?auto_21363 ) ) ( not ( = ?auto_21355 ?auto_21363 ) ) ( IS-CRATE ?auto_21356 ) ( not ( = ?auto_21358 ?auto_21360 ) ) ( not ( = ?auto_21368 ?auto_21358 ) ) ( HOIST-AT ?auto_21369 ?auto_21358 ) ( not ( = ?auto_21361 ?auto_21369 ) ) ( not ( = ?auto_21366 ?auto_21369 ) ) ( AVAILABLE ?auto_21369 ) ( SURFACE-AT ?auto_21356 ?auto_21358 ) ( ON ?auto_21356 ?auto_21367 ) ( CLEAR ?auto_21356 ) ( not ( = ?auto_21356 ?auto_21367 ) ) ( not ( = ?auto_21357 ?auto_21367 ) ) ( not ( = ?auto_21355 ?auto_21367 ) ) ( not ( = ?auto_21363 ?auto_21367 ) ) ( IS-CRATE ?auto_21355 ) ( not ( = ?auto_21362 ?auto_21355 ) ) ( not ( = ?auto_21356 ?auto_21362 ) ) ( not ( = ?auto_21357 ?auto_21362 ) ) ( not ( = ?auto_21363 ?auto_21362 ) ) ( not ( = ?auto_21367 ?auto_21362 ) ) ( AVAILABLE ?auto_21366 ) ( SURFACE-AT ?auto_21355 ?auto_21368 ) ( ON ?auto_21355 ?auto_21359 ) ( CLEAR ?auto_21355 ) ( not ( = ?auto_21356 ?auto_21359 ) ) ( not ( = ?auto_21357 ?auto_21359 ) ) ( not ( = ?auto_21355 ?auto_21359 ) ) ( not ( = ?auto_21363 ?auto_21359 ) ) ( not ( = ?auto_21367 ?auto_21359 ) ) ( not ( = ?auto_21362 ?auto_21359 ) ) ( TRUCK-AT ?auto_21364 ?auto_21360 ) ( SURFACE-AT ?auto_21365 ?auto_21360 ) ( CLEAR ?auto_21365 ) ( LIFTING ?auto_21361 ?auto_21362 ) ( IS-CRATE ?auto_21362 ) ( not ( = ?auto_21365 ?auto_21362 ) ) ( not ( = ?auto_21356 ?auto_21365 ) ) ( not ( = ?auto_21357 ?auto_21365 ) ) ( not ( = ?auto_21355 ?auto_21365 ) ) ( not ( = ?auto_21363 ?auto_21365 ) ) ( not ( = ?auto_21367 ?auto_21365 ) ) ( not ( = ?auto_21359 ?auto_21365 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21356 ?auto_21357 )
      ( MAKE-2CRATE-VERIFY ?auto_21355 ?auto_21356 ?auto_21357 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21370 - SURFACE
      ?auto_21371 - SURFACE
      ?auto_21372 - SURFACE
      ?auto_21373 - SURFACE
    )
    :vars
    (
      ?auto_21377 - HOIST
      ?auto_21379 - PLACE
      ?auto_21380 - PLACE
      ?auto_21375 - HOIST
      ?auto_21381 - SURFACE
      ?auto_21378 - PLACE
      ?auto_21374 - HOIST
      ?auto_21384 - SURFACE
      ?auto_21376 - SURFACE
      ?auto_21382 - TRUCK
      ?auto_21383 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21377 ?auto_21379 ) ( IS-CRATE ?auto_21373 ) ( not ( = ?auto_21372 ?auto_21373 ) ) ( not ( = ?auto_21371 ?auto_21372 ) ) ( not ( = ?auto_21371 ?auto_21373 ) ) ( not ( = ?auto_21380 ?auto_21379 ) ) ( HOIST-AT ?auto_21375 ?auto_21380 ) ( not ( = ?auto_21377 ?auto_21375 ) ) ( SURFACE-AT ?auto_21373 ?auto_21380 ) ( ON ?auto_21373 ?auto_21381 ) ( CLEAR ?auto_21373 ) ( not ( = ?auto_21372 ?auto_21381 ) ) ( not ( = ?auto_21373 ?auto_21381 ) ) ( not ( = ?auto_21371 ?auto_21381 ) ) ( IS-CRATE ?auto_21372 ) ( not ( = ?auto_21378 ?auto_21379 ) ) ( not ( = ?auto_21380 ?auto_21378 ) ) ( HOIST-AT ?auto_21374 ?auto_21378 ) ( not ( = ?auto_21377 ?auto_21374 ) ) ( not ( = ?auto_21375 ?auto_21374 ) ) ( AVAILABLE ?auto_21374 ) ( SURFACE-AT ?auto_21372 ?auto_21378 ) ( ON ?auto_21372 ?auto_21384 ) ( CLEAR ?auto_21372 ) ( not ( = ?auto_21372 ?auto_21384 ) ) ( not ( = ?auto_21373 ?auto_21384 ) ) ( not ( = ?auto_21371 ?auto_21384 ) ) ( not ( = ?auto_21381 ?auto_21384 ) ) ( IS-CRATE ?auto_21371 ) ( not ( = ?auto_21370 ?auto_21371 ) ) ( not ( = ?auto_21372 ?auto_21370 ) ) ( not ( = ?auto_21373 ?auto_21370 ) ) ( not ( = ?auto_21381 ?auto_21370 ) ) ( not ( = ?auto_21384 ?auto_21370 ) ) ( AVAILABLE ?auto_21375 ) ( SURFACE-AT ?auto_21371 ?auto_21380 ) ( ON ?auto_21371 ?auto_21376 ) ( CLEAR ?auto_21371 ) ( not ( = ?auto_21372 ?auto_21376 ) ) ( not ( = ?auto_21373 ?auto_21376 ) ) ( not ( = ?auto_21371 ?auto_21376 ) ) ( not ( = ?auto_21381 ?auto_21376 ) ) ( not ( = ?auto_21384 ?auto_21376 ) ) ( not ( = ?auto_21370 ?auto_21376 ) ) ( TRUCK-AT ?auto_21382 ?auto_21379 ) ( SURFACE-AT ?auto_21383 ?auto_21379 ) ( CLEAR ?auto_21383 ) ( LIFTING ?auto_21377 ?auto_21370 ) ( IS-CRATE ?auto_21370 ) ( not ( = ?auto_21383 ?auto_21370 ) ) ( not ( = ?auto_21372 ?auto_21383 ) ) ( not ( = ?auto_21373 ?auto_21383 ) ) ( not ( = ?auto_21371 ?auto_21383 ) ) ( not ( = ?auto_21381 ?auto_21383 ) ) ( not ( = ?auto_21384 ?auto_21383 ) ) ( not ( = ?auto_21376 ?auto_21383 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21371 ?auto_21372 ?auto_21373 )
      ( MAKE-3CRATE-VERIFY ?auto_21370 ?auto_21371 ?auto_21372 ?auto_21373 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21385 - SURFACE
      ?auto_21386 - SURFACE
      ?auto_21387 - SURFACE
      ?auto_21388 - SURFACE
      ?auto_21389 - SURFACE
    )
    :vars
    (
      ?auto_21393 - HOIST
      ?auto_21395 - PLACE
      ?auto_21396 - PLACE
      ?auto_21391 - HOIST
      ?auto_21397 - SURFACE
      ?auto_21394 - PLACE
      ?auto_21390 - HOIST
      ?auto_21399 - SURFACE
      ?auto_21392 - SURFACE
      ?auto_21398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21393 ?auto_21395 ) ( IS-CRATE ?auto_21389 ) ( not ( = ?auto_21388 ?auto_21389 ) ) ( not ( = ?auto_21387 ?auto_21388 ) ) ( not ( = ?auto_21387 ?auto_21389 ) ) ( not ( = ?auto_21396 ?auto_21395 ) ) ( HOIST-AT ?auto_21391 ?auto_21396 ) ( not ( = ?auto_21393 ?auto_21391 ) ) ( SURFACE-AT ?auto_21389 ?auto_21396 ) ( ON ?auto_21389 ?auto_21397 ) ( CLEAR ?auto_21389 ) ( not ( = ?auto_21388 ?auto_21397 ) ) ( not ( = ?auto_21389 ?auto_21397 ) ) ( not ( = ?auto_21387 ?auto_21397 ) ) ( IS-CRATE ?auto_21388 ) ( not ( = ?auto_21394 ?auto_21395 ) ) ( not ( = ?auto_21396 ?auto_21394 ) ) ( HOIST-AT ?auto_21390 ?auto_21394 ) ( not ( = ?auto_21393 ?auto_21390 ) ) ( not ( = ?auto_21391 ?auto_21390 ) ) ( AVAILABLE ?auto_21390 ) ( SURFACE-AT ?auto_21388 ?auto_21394 ) ( ON ?auto_21388 ?auto_21399 ) ( CLEAR ?auto_21388 ) ( not ( = ?auto_21388 ?auto_21399 ) ) ( not ( = ?auto_21389 ?auto_21399 ) ) ( not ( = ?auto_21387 ?auto_21399 ) ) ( not ( = ?auto_21397 ?auto_21399 ) ) ( IS-CRATE ?auto_21387 ) ( not ( = ?auto_21386 ?auto_21387 ) ) ( not ( = ?auto_21388 ?auto_21386 ) ) ( not ( = ?auto_21389 ?auto_21386 ) ) ( not ( = ?auto_21397 ?auto_21386 ) ) ( not ( = ?auto_21399 ?auto_21386 ) ) ( AVAILABLE ?auto_21391 ) ( SURFACE-AT ?auto_21387 ?auto_21396 ) ( ON ?auto_21387 ?auto_21392 ) ( CLEAR ?auto_21387 ) ( not ( = ?auto_21388 ?auto_21392 ) ) ( not ( = ?auto_21389 ?auto_21392 ) ) ( not ( = ?auto_21387 ?auto_21392 ) ) ( not ( = ?auto_21397 ?auto_21392 ) ) ( not ( = ?auto_21399 ?auto_21392 ) ) ( not ( = ?auto_21386 ?auto_21392 ) ) ( TRUCK-AT ?auto_21398 ?auto_21395 ) ( SURFACE-AT ?auto_21385 ?auto_21395 ) ( CLEAR ?auto_21385 ) ( LIFTING ?auto_21393 ?auto_21386 ) ( IS-CRATE ?auto_21386 ) ( not ( = ?auto_21385 ?auto_21386 ) ) ( not ( = ?auto_21388 ?auto_21385 ) ) ( not ( = ?auto_21389 ?auto_21385 ) ) ( not ( = ?auto_21387 ?auto_21385 ) ) ( not ( = ?auto_21397 ?auto_21385 ) ) ( not ( = ?auto_21399 ?auto_21385 ) ) ( not ( = ?auto_21392 ?auto_21385 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21387 ?auto_21388 ?auto_21389 )
      ( MAKE-4CRATE-VERIFY ?auto_21385 ?auto_21386 ?auto_21387 ?auto_21388 ?auto_21389 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21400 - SURFACE
      ?auto_21401 - SURFACE
    )
    :vars
    (
      ?auto_21406 - HOIST
      ?auto_21408 - PLACE
      ?auto_21409 - SURFACE
      ?auto_21410 - PLACE
      ?auto_21404 - HOIST
      ?auto_21411 - SURFACE
      ?auto_21407 - PLACE
      ?auto_21402 - HOIST
      ?auto_21414 - SURFACE
      ?auto_21403 - SURFACE
      ?auto_21405 - SURFACE
      ?auto_21412 - TRUCK
      ?auto_21413 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21406 ?auto_21408 ) ( IS-CRATE ?auto_21401 ) ( not ( = ?auto_21400 ?auto_21401 ) ) ( not ( = ?auto_21409 ?auto_21400 ) ) ( not ( = ?auto_21409 ?auto_21401 ) ) ( not ( = ?auto_21410 ?auto_21408 ) ) ( HOIST-AT ?auto_21404 ?auto_21410 ) ( not ( = ?auto_21406 ?auto_21404 ) ) ( SURFACE-AT ?auto_21401 ?auto_21410 ) ( ON ?auto_21401 ?auto_21411 ) ( CLEAR ?auto_21401 ) ( not ( = ?auto_21400 ?auto_21411 ) ) ( not ( = ?auto_21401 ?auto_21411 ) ) ( not ( = ?auto_21409 ?auto_21411 ) ) ( IS-CRATE ?auto_21400 ) ( not ( = ?auto_21407 ?auto_21408 ) ) ( not ( = ?auto_21410 ?auto_21407 ) ) ( HOIST-AT ?auto_21402 ?auto_21407 ) ( not ( = ?auto_21406 ?auto_21402 ) ) ( not ( = ?auto_21404 ?auto_21402 ) ) ( AVAILABLE ?auto_21402 ) ( SURFACE-AT ?auto_21400 ?auto_21407 ) ( ON ?auto_21400 ?auto_21414 ) ( CLEAR ?auto_21400 ) ( not ( = ?auto_21400 ?auto_21414 ) ) ( not ( = ?auto_21401 ?auto_21414 ) ) ( not ( = ?auto_21409 ?auto_21414 ) ) ( not ( = ?auto_21411 ?auto_21414 ) ) ( IS-CRATE ?auto_21409 ) ( not ( = ?auto_21403 ?auto_21409 ) ) ( not ( = ?auto_21400 ?auto_21403 ) ) ( not ( = ?auto_21401 ?auto_21403 ) ) ( not ( = ?auto_21411 ?auto_21403 ) ) ( not ( = ?auto_21414 ?auto_21403 ) ) ( AVAILABLE ?auto_21404 ) ( SURFACE-AT ?auto_21409 ?auto_21410 ) ( ON ?auto_21409 ?auto_21405 ) ( CLEAR ?auto_21409 ) ( not ( = ?auto_21400 ?auto_21405 ) ) ( not ( = ?auto_21401 ?auto_21405 ) ) ( not ( = ?auto_21409 ?auto_21405 ) ) ( not ( = ?auto_21411 ?auto_21405 ) ) ( not ( = ?auto_21414 ?auto_21405 ) ) ( not ( = ?auto_21403 ?auto_21405 ) ) ( TRUCK-AT ?auto_21412 ?auto_21408 ) ( SURFACE-AT ?auto_21413 ?auto_21408 ) ( CLEAR ?auto_21413 ) ( IS-CRATE ?auto_21403 ) ( not ( = ?auto_21413 ?auto_21403 ) ) ( not ( = ?auto_21400 ?auto_21413 ) ) ( not ( = ?auto_21401 ?auto_21413 ) ) ( not ( = ?auto_21409 ?auto_21413 ) ) ( not ( = ?auto_21411 ?auto_21413 ) ) ( not ( = ?auto_21414 ?auto_21413 ) ) ( not ( = ?auto_21405 ?auto_21413 ) ) ( AVAILABLE ?auto_21406 ) ( IN ?auto_21403 ?auto_21412 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21406 ?auto_21403 ?auto_21412 ?auto_21408 )
      ( MAKE-2CRATE ?auto_21409 ?auto_21400 ?auto_21401 )
      ( MAKE-1CRATE-VERIFY ?auto_21400 ?auto_21401 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21415 - SURFACE
      ?auto_21416 - SURFACE
      ?auto_21417 - SURFACE
    )
    :vars
    (
      ?auto_21420 - HOIST
      ?auto_21429 - PLACE
      ?auto_21422 - PLACE
      ?auto_21427 - HOIST
      ?auto_21421 - SURFACE
      ?auto_21425 - PLACE
      ?auto_21419 - HOIST
      ?auto_21423 - SURFACE
      ?auto_21428 - SURFACE
      ?auto_21426 - SURFACE
      ?auto_21424 - TRUCK
      ?auto_21418 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21420 ?auto_21429 ) ( IS-CRATE ?auto_21417 ) ( not ( = ?auto_21416 ?auto_21417 ) ) ( not ( = ?auto_21415 ?auto_21416 ) ) ( not ( = ?auto_21415 ?auto_21417 ) ) ( not ( = ?auto_21422 ?auto_21429 ) ) ( HOIST-AT ?auto_21427 ?auto_21422 ) ( not ( = ?auto_21420 ?auto_21427 ) ) ( SURFACE-AT ?auto_21417 ?auto_21422 ) ( ON ?auto_21417 ?auto_21421 ) ( CLEAR ?auto_21417 ) ( not ( = ?auto_21416 ?auto_21421 ) ) ( not ( = ?auto_21417 ?auto_21421 ) ) ( not ( = ?auto_21415 ?auto_21421 ) ) ( IS-CRATE ?auto_21416 ) ( not ( = ?auto_21425 ?auto_21429 ) ) ( not ( = ?auto_21422 ?auto_21425 ) ) ( HOIST-AT ?auto_21419 ?auto_21425 ) ( not ( = ?auto_21420 ?auto_21419 ) ) ( not ( = ?auto_21427 ?auto_21419 ) ) ( AVAILABLE ?auto_21419 ) ( SURFACE-AT ?auto_21416 ?auto_21425 ) ( ON ?auto_21416 ?auto_21423 ) ( CLEAR ?auto_21416 ) ( not ( = ?auto_21416 ?auto_21423 ) ) ( not ( = ?auto_21417 ?auto_21423 ) ) ( not ( = ?auto_21415 ?auto_21423 ) ) ( not ( = ?auto_21421 ?auto_21423 ) ) ( IS-CRATE ?auto_21415 ) ( not ( = ?auto_21428 ?auto_21415 ) ) ( not ( = ?auto_21416 ?auto_21428 ) ) ( not ( = ?auto_21417 ?auto_21428 ) ) ( not ( = ?auto_21421 ?auto_21428 ) ) ( not ( = ?auto_21423 ?auto_21428 ) ) ( AVAILABLE ?auto_21427 ) ( SURFACE-AT ?auto_21415 ?auto_21422 ) ( ON ?auto_21415 ?auto_21426 ) ( CLEAR ?auto_21415 ) ( not ( = ?auto_21416 ?auto_21426 ) ) ( not ( = ?auto_21417 ?auto_21426 ) ) ( not ( = ?auto_21415 ?auto_21426 ) ) ( not ( = ?auto_21421 ?auto_21426 ) ) ( not ( = ?auto_21423 ?auto_21426 ) ) ( not ( = ?auto_21428 ?auto_21426 ) ) ( TRUCK-AT ?auto_21424 ?auto_21429 ) ( SURFACE-AT ?auto_21418 ?auto_21429 ) ( CLEAR ?auto_21418 ) ( IS-CRATE ?auto_21428 ) ( not ( = ?auto_21418 ?auto_21428 ) ) ( not ( = ?auto_21416 ?auto_21418 ) ) ( not ( = ?auto_21417 ?auto_21418 ) ) ( not ( = ?auto_21415 ?auto_21418 ) ) ( not ( = ?auto_21421 ?auto_21418 ) ) ( not ( = ?auto_21423 ?auto_21418 ) ) ( not ( = ?auto_21426 ?auto_21418 ) ) ( AVAILABLE ?auto_21420 ) ( IN ?auto_21428 ?auto_21424 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21416 ?auto_21417 )
      ( MAKE-2CRATE-VERIFY ?auto_21415 ?auto_21416 ?auto_21417 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21430 - SURFACE
      ?auto_21431 - SURFACE
      ?auto_21432 - SURFACE
      ?auto_21433 - SURFACE
    )
    :vars
    (
      ?auto_21442 - HOIST
      ?auto_21444 - PLACE
      ?auto_21440 - PLACE
      ?auto_21434 - HOIST
      ?auto_21443 - SURFACE
      ?auto_21441 - PLACE
      ?auto_21437 - HOIST
      ?auto_21436 - SURFACE
      ?auto_21435 - SURFACE
      ?auto_21438 - TRUCK
      ?auto_21439 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21442 ?auto_21444 ) ( IS-CRATE ?auto_21433 ) ( not ( = ?auto_21432 ?auto_21433 ) ) ( not ( = ?auto_21431 ?auto_21432 ) ) ( not ( = ?auto_21431 ?auto_21433 ) ) ( not ( = ?auto_21440 ?auto_21444 ) ) ( HOIST-AT ?auto_21434 ?auto_21440 ) ( not ( = ?auto_21442 ?auto_21434 ) ) ( SURFACE-AT ?auto_21433 ?auto_21440 ) ( ON ?auto_21433 ?auto_21443 ) ( CLEAR ?auto_21433 ) ( not ( = ?auto_21432 ?auto_21443 ) ) ( not ( = ?auto_21433 ?auto_21443 ) ) ( not ( = ?auto_21431 ?auto_21443 ) ) ( IS-CRATE ?auto_21432 ) ( not ( = ?auto_21441 ?auto_21444 ) ) ( not ( = ?auto_21440 ?auto_21441 ) ) ( HOIST-AT ?auto_21437 ?auto_21441 ) ( not ( = ?auto_21442 ?auto_21437 ) ) ( not ( = ?auto_21434 ?auto_21437 ) ) ( AVAILABLE ?auto_21437 ) ( SURFACE-AT ?auto_21432 ?auto_21441 ) ( ON ?auto_21432 ?auto_21436 ) ( CLEAR ?auto_21432 ) ( not ( = ?auto_21432 ?auto_21436 ) ) ( not ( = ?auto_21433 ?auto_21436 ) ) ( not ( = ?auto_21431 ?auto_21436 ) ) ( not ( = ?auto_21443 ?auto_21436 ) ) ( IS-CRATE ?auto_21431 ) ( not ( = ?auto_21430 ?auto_21431 ) ) ( not ( = ?auto_21432 ?auto_21430 ) ) ( not ( = ?auto_21433 ?auto_21430 ) ) ( not ( = ?auto_21443 ?auto_21430 ) ) ( not ( = ?auto_21436 ?auto_21430 ) ) ( AVAILABLE ?auto_21434 ) ( SURFACE-AT ?auto_21431 ?auto_21440 ) ( ON ?auto_21431 ?auto_21435 ) ( CLEAR ?auto_21431 ) ( not ( = ?auto_21432 ?auto_21435 ) ) ( not ( = ?auto_21433 ?auto_21435 ) ) ( not ( = ?auto_21431 ?auto_21435 ) ) ( not ( = ?auto_21443 ?auto_21435 ) ) ( not ( = ?auto_21436 ?auto_21435 ) ) ( not ( = ?auto_21430 ?auto_21435 ) ) ( TRUCK-AT ?auto_21438 ?auto_21444 ) ( SURFACE-AT ?auto_21439 ?auto_21444 ) ( CLEAR ?auto_21439 ) ( IS-CRATE ?auto_21430 ) ( not ( = ?auto_21439 ?auto_21430 ) ) ( not ( = ?auto_21432 ?auto_21439 ) ) ( not ( = ?auto_21433 ?auto_21439 ) ) ( not ( = ?auto_21431 ?auto_21439 ) ) ( not ( = ?auto_21443 ?auto_21439 ) ) ( not ( = ?auto_21436 ?auto_21439 ) ) ( not ( = ?auto_21435 ?auto_21439 ) ) ( AVAILABLE ?auto_21442 ) ( IN ?auto_21430 ?auto_21438 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21431 ?auto_21432 ?auto_21433 )
      ( MAKE-3CRATE-VERIFY ?auto_21430 ?auto_21431 ?auto_21432 ?auto_21433 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21445 - SURFACE
      ?auto_21446 - SURFACE
      ?auto_21447 - SURFACE
      ?auto_21448 - SURFACE
      ?auto_21449 - SURFACE
    )
    :vars
    (
      ?auto_21457 - HOIST
      ?auto_21459 - PLACE
      ?auto_21455 - PLACE
      ?auto_21450 - HOIST
      ?auto_21458 - SURFACE
      ?auto_21456 - PLACE
      ?auto_21453 - HOIST
      ?auto_21452 - SURFACE
      ?auto_21451 - SURFACE
      ?auto_21454 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21457 ?auto_21459 ) ( IS-CRATE ?auto_21449 ) ( not ( = ?auto_21448 ?auto_21449 ) ) ( not ( = ?auto_21447 ?auto_21448 ) ) ( not ( = ?auto_21447 ?auto_21449 ) ) ( not ( = ?auto_21455 ?auto_21459 ) ) ( HOIST-AT ?auto_21450 ?auto_21455 ) ( not ( = ?auto_21457 ?auto_21450 ) ) ( SURFACE-AT ?auto_21449 ?auto_21455 ) ( ON ?auto_21449 ?auto_21458 ) ( CLEAR ?auto_21449 ) ( not ( = ?auto_21448 ?auto_21458 ) ) ( not ( = ?auto_21449 ?auto_21458 ) ) ( not ( = ?auto_21447 ?auto_21458 ) ) ( IS-CRATE ?auto_21448 ) ( not ( = ?auto_21456 ?auto_21459 ) ) ( not ( = ?auto_21455 ?auto_21456 ) ) ( HOIST-AT ?auto_21453 ?auto_21456 ) ( not ( = ?auto_21457 ?auto_21453 ) ) ( not ( = ?auto_21450 ?auto_21453 ) ) ( AVAILABLE ?auto_21453 ) ( SURFACE-AT ?auto_21448 ?auto_21456 ) ( ON ?auto_21448 ?auto_21452 ) ( CLEAR ?auto_21448 ) ( not ( = ?auto_21448 ?auto_21452 ) ) ( not ( = ?auto_21449 ?auto_21452 ) ) ( not ( = ?auto_21447 ?auto_21452 ) ) ( not ( = ?auto_21458 ?auto_21452 ) ) ( IS-CRATE ?auto_21447 ) ( not ( = ?auto_21446 ?auto_21447 ) ) ( not ( = ?auto_21448 ?auto_21446 ) ) ( not ( = ?auto_21449 ?auto_21446 ) ) ( not ( = ?auto_21458 ?auto_21446 ) ) ( not ( = ?auto_21452 ?auto_21446 ) ) ( AVAILABLE ?auto_21450 ) ( SURFACE-AT ?auto_21447 ?auto_21455 ) ( ON ?auto_21447 ?auto_21451 ) ( CLEAR ?auto_21447 ) ( not ( = ?auto_21448 ?auto_21451 ) ) ( not ( = ?auto_21449 ?auto_21451 ) ) ( not ( = ?auto_21447 ?auto_21451 ) ) ( not ( = ?auto_21458 ?auto_21451 ) ) ( not ( = ?auto_21452 ?auto_21451 ) ) ( not ( = ?auto_21446 ?auto_21451 ) ) ( TRUCK-AT ?auto_21454 ?auto_21459 ) ( SURFACE-AT ?auto_21445 ?auto_21459 ) ( CLEAR ?auto_21445 ) ( IS-CRATE ?auto_21446 ) ( not ( = ?auto_21445 ?auto_21446 ) ) ( not ( = ?auto_21448 ?auto_21445 ) ) ( not ( = ?auto_21449 ?auto_21445 ) ) ( not ( = ?auto_21447 ?auto_21445 ) ) ( not ( = ?auto_21458 ?auto_21445 ) ) ( not ( = ?auto_21452 ?auto_21445 ) ) ( not ( = ?auto_21451 ?auto_21445 ) ) ( AVAILABLE ?auto_21457 ) ( IN ?auto_21446 ?auto_21454 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21447 ?auto_21448 ?auto_21449 )
      ( MAKE-4CRATE-VERIFY ?auto_21445 ?auto_21446 ?auto_21447 ?auto_21448 ?auto_21449 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21460 - SURFACE
      ?auto_21461 - SURFACE
    )
    :vars
    (
      ?auto_21472 - HOIST
      ?auto_21474 - PLACE
      ?auto_21467 - SURFACE
      ?auto_21469 - PLACE
      ?auto_21462 - HOIST
      ?auto_21473 - SURFACE
      ?auto_21471 - PLACE
      ?auto_21465 - HOIST
      ?auto_21464 - SURFACE
      ?auto_21470 - SURFACE
      ?auto_21463 - SURFACE
      ?auto_21468 - SURFACE
      ?auto_21466 - TRUCK
      ?auto_21475 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21472 ?auto_21474 ) ( IS-CRATE ?auto_21461 ) ( not ( = ?auto_21460 ?auto_21461 ) ) ( not ( = ?auto_21467 ?auto_21460 ) ) ( not ( = ?auto_21467 ?auto_21461 ) ) ( not ( = ?auto_21469 ?auto_21474 ) ) ( HOIST-AT ?auto_21462 ?auto_21469 ) ( not ( = ?auto_21472 ?auto_21462 ) ) ( SURFACE-AT ?auto_21461 ?auto_21469 ) ( ON ?auto_21461 ?auto_21473 ) ( CLEAR ?auto_21461 ) ( not ( = ?auto_21460 ?auto_21473 ) ) ( not ( = ?auto_21461 ?auto_21473 ) ) ( not ( = ?auto_21467 ?auto_21473 ) ) ( IS-CRATE ?auto_21460 ) ( not ( = ?auto_21471 ?auto_21474 ) ) ( not ( = ?auto_21469 ?auto_21471 ) ) ( HOIST-AT ?auto_21465 ?auto_21471 ) ( not ( = ?auto_21472 ?auto_21465 ) ) ( not ( = ?auto_21462 ?auto_21465 ) ) ( AVAILABLE ?auto_21465 ) ( SURFACE-AT ?auto_21460 ?auto_21471 ) ( ON ?auto_21460 ?auto_21464 ) ( CLEAR ?auto_21460 ) ( not ( = ?auto_21460 ?auto_21464 ) ) ( not ( = ?auto_21461 ?auto_21464 ) ) ( not ( = ?auto_21467 ?auto_21464 ) ) ( not ( = ?auto_21473 ?auto_21464 ) ) ( IS-CRATE ?auto_21467 ) ( not ( = ?auto_21470 ?auto_21467 ) ) ( not ( = ?auto_21460 ?auto_21470 ) ) ( not ( = ?auto_21461 ?auto_21470 ) ) ( not ( = ?auto_21473 ?auto_21470 ) ) ( not ( = ?auto_21464 ?auto_21470 ) ) ( AVAILABLE ?auto_21462 ) ( SURFACE-AT ?auto_21467 ?auto_21469 ) ( ON ?auto_21467 ?auto_21463 ) ( CLEAR ?auto_21467 ) ( not ( = ?auto_21460 ?auto_21463 ) ) ( not ( = ?auto_21461 ?auto_21463 ) ) ( not ( = ?auto_21467 ?auto_21463 ) ) ( not ( = ?auto_21473 ?auto_21463 ) ) ( not ( = ?auto_21464 ?auto_21463 ) ) ( not ( = ?auto_21470 ?auto_21463 ) ) ( SURFACE-AT ?auto_21468 ?auto_21474 ) ( CLEAR ?auto_21468 ) ( IS-CRATE ?auto_21470 ) ( not ( = ?auto_21468 ?auto_21470 ) ) ( not ( = ?auto_21460 ?auto_21468 ) ) ( not ( = ?auto_21461 ?auto_21468 ) ) ( not ( = ?auto_21467 ?auto_21468 ) ) ( not ( = ?auto_21473 ?auto_21468 ) ) ( not ( = ?auto_21464 ?auto_21468 ) ) ( not ( = ?auto_21463 ?auto_21468 ) ) ( AVAILABLE ?auto_21472 ) ( IN ?auto_21470 ?auto_21466 ) ( TRUCK-AT ?auto_21466 ?auto_21475 ) ( not ( = ?auto_21475 ?auto_21474 ) ) ( not ( = ?auto_21469 ?auto_21475 ) ) ( not ( = ?auto_21471 ?auto_21475 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21466 ?auto_21475 ?auto_21474 )
      ( MAKE-2CRATE ?auto_21467 ?auto_21460 ?auto_21461 )
      ( MAKE-1CRATE-VERIFY ?auto_21460 ?auto_21461 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21476 - SURFACE
      ?auto_21477 - SURFACE
      ?auto_21478 - SURFACE
    )
    :vars
    (
      ?auto_21484 - HOIST
      ?auto_21487 - PLACE
      ?auto_21491 - PLACE
      ?auto_21485 - HOIST
      ?auto_21482 - SURFACE
      ?auto_21490 - PLACE
      ?auto_21480 - HOIST
      ?auto_21481 - SURFACE
      ?auto_21479 - SURFACE
      ?auto_21489 - SURFACE
      ?auto_21486 - SURFACE
      ?auto_21488 - TRUCK
      ?auto_21483 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21484 ?auto_21487 ) ( IS-CRATE ?auto_21478 ) ( not ( = ?auto_21477 ?auto_21478 ) ) ( not ( = ?auto_21476 ?auto_21477 ) ) ( not ( = ?auto_21476 ?auto_21478 ) ) ( not ( = ?auto_21491 ?auto_21487 ) ) ( HOIST-AT ?auto_21485 ?auto_21491 ) ( not ( = ?auto_21484 ?auto_21485 ) ) ( SURFACE-AT ?auto_21478 ?auto_21491 ) ( ON ?auto_21478 ?auto_21482 ) ( CLEAR ?auto_21478 ) ( not ( = ?auto_21477 ?auto_21482 ) ) ( not ( = ?auto_21478 ?auto_21482 ) ) ( not ( = ?auto_21476 ?auto_21482 ) ) ( IS-CRATE ?auto_21477 ) ( not ( = ?auto_21490 ?auto_21487 ) ) ( not ( = ?auto_21491 ?auto_21490 ) ) ( HOIST-AT ?auto_21480 ?auto_21490 ) ( not ( = ?auto_21484 ?auto_21480 ) ) ( not ( = ?auto_21485 ?auto_21480 ) ) ( AVAILABLE ?auto_21480 ) ( SURFACE-AT ?auto_21477 ?auto_21490 ) ( ON ?auto_21477 ?auto_21481 ) ( CLEAR ?auto_21477 ) ( not ( = ?auto_21477 ?auto_21481 ) ) ( not ( = ?auto_21478 ?auto_21481 ) ) ( not ( = ?auto_21476 ?auto_21481 ) ) ( not ( = ?auto_21482 ?auto_21481 ) ) ( IS-CRATE ?auto_21476 ) ( not ( = ?auto_21479 ?auto_21476 ) ) ( not ( = ?auto_21477 ?auto_21479 ) ) ( not ( = ?auto_21478 ?auto_21479 ) ) ( not ( = ?auto_21482 ?auto_21479 ) ) ( not ( = ?auto_21481 ?auto_21479 ) ) ( AVAILABLE ?auto_21485 ) ( SURFACE-AT ?auto_21476 ?auto_21491 ) ( ON ?auto_21476 ?auto_21489 ) ( CLEAR ?auto_21476 ) ( not ( = ?auto_21477 ?auto_21489 ) ) ( not ( = ?auto_21478 ?auto_21489 ) ) ( not ( = ?auto_21476 ?auto_21489 ) ) ( not ( = ?auto_21482 ?auto_21489 ) ) ( not ( = ?auto_21481 ?auto_21489 ) ) ( not ( = ?auto_21479 ?auto_21489 ) ) ( SURFACE-AT ?auto_21486 ?auto_21487 ) ( CLEAR ?auto_21486 ) ( IS-CRATE ?auto_21479 ) ( not ( = ?auto_21486 ?auto_21479 ) ) ( not ( = ?auto_21477 ?auto_21486 ) ) ( not ( = ?auto_21478 ?auto_21486 ) ) ( not ( = ?auto_21476 ?auto_21486 ) ) ( not ( = ?auto_21482 ?auto_21486 ) ) ( not ( = ?auto_21481 ?auto_21486 ) ) ( not ( = ?auto_21489 ?auto_21486 ) ) ( AVAILABLE ?auto_21484 ) ( IN ?auto_21479 ?auto_21488 ) ( TRUCK-AT ?auto_21488 ?auto_21483 ) ( not ( = ?auto_21483 ?auto_21487 ) ) ( not ( = ?auto_21491 ?auto_21483 ) ) ( not ( = ?auto_21490 ?auto_21483 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21477 ?auto_21478 )
      ( MAKE-2CRATE-VERIFY ?auto_21476 ?auto_21477 ?auto_21478 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21492 - SURFACE
      ?auto_21493 - SURFACE
      ?auto_21494 - SURFACE
      ?auto_21495 - SURFACE
    )
    :vars
    (
      ?auto_21501 - HOIST
      ?auto_21500 - PLACE
      ?auto_21503 - PLACE
      ?auto_21496 - HOIST
      ?auto_21498 - SURFACE
      ?auto_21497 - PLACE
      ?auto_21504 - HOIST
      ?auto_21507 - SURFACE
      ?auto_21502 - SURFACE
      ?auto_21499 - SURFACE
      ?auto_21506 - TRUCK
      ?auto_21505 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21501 ?auto_21500 ) ( IS-CRATE ?auto_21495 ) ( not ( = ?auto_21494 ?auto_21495 ) ) ( not ( = ?auto_21493 ?auto_21494 ) ) ( not ( = ?auto_21493 ?auto_21495 ) ) ( not ( = ?auto_21503 ?auto_21500 ) ) ( HOIST-AT ?auto_21496 ?auto_21503 ) ( not ( = ?auto_21501 ?auto_21496 ) ) ( SURFACE-AT ?auto_21495 ?auto_21503 ) ( ON ?auto_21495 ?auto_21498 ) ( CLEAR ?auto_21495 ) ( not ( = ?auto_21494 ?auto_21498 ) ) ( not ( = ?auto_21495 ?auto_21498 ) ) ( not ( = ?auto_21493 ?auto_21498 ) ) ( IS-CRATE ?auto_21494 ) ( not ( = ?auto_21497 ?auto_21500 ) ) ( not ( = ?auto_21503 ?auto_21497 ) ) ( HOIST-AT ?auto_21504 ?auto_21497 ) ( not ( = ?auto_21501 ?auto_21504 ) ) ( not ( = ?auto_21496 ?auto_21504 ) ) ( AVAILABLE ?auto_21504 ) ( SURFACE-AT ?auto_21494 ?auto_21497 ) ( ON ?auto_21494 ?auto_21507 ) ( CLEAR ?auto_21494 ) ( not ( = ?auto_21494 ?auto_21507 ) ) ( not ( = ?auto_21495 ?auto_21507 ) ) ( not ( = ?auto_21493 ?auto_21507 ) ) ( not ( = ?auto_21498 ?auto_21507 ) ) ( IS-CRATE ?auto_21493 ) ( not ( = ?auto_21492 ?auto_21493 ) ) ( not ( = ?auto_21494 ?auto_21492 ) ) ( not ( = ?auto_21495 ?auto_21492 ) ) ( not ( = ?auto_21498 ?auto_21492 ) ) ( not ( = ?auto_21507 ?auto_21492 ) ) ( AVAILABLE ?auto_21496 ) ( SURFACE-AT ?auto_21493 ?auto_21503 ) ( ON ?auto_21493 ?auto_21502 ) ( CLEAR ?auto_21493 ) ( not ( = ?auto_21494 ?auto_21502 ) ) ( not ( = ?auto_21495 ?auto_21502 ) ) ( not ( = ?auto_21493 ?auto_21502 ) ) ( not ( = ?auto_21498 ?auto_21502 ) ) ( not ( = ?auto_21507 ?auto_21502 ) ) ( not ( = ?auto_21492 ?auto_21502 ) ) ( SURFACE-AT ?auto_21499 ?auto_21500 ) ( CLEAR ?auto_21499 ) ( IS-CRATE ?auto_21492 ) ( not ( = ?auto_21499 ?auto_21492 ) ) ( not ( = ?auto_21494 ?auto_21499 ) ) ( not ( = ?auto_21495 ?auto_21499 ) ) ( not ( = ?auto_21493 ?auto_21499 ) ) ( not ( = ?auto_21498 ?auto_21499 ) ) ( not ( = ?auto_21507 ?auto_21499 ) ) ( not ( = ?auto_21502 ?auto_21499 ) ) ( AVAILABLE ?auto_21501 ) ( IN ?auto_21492 ?auto_21506 ) ( TRUCK-AT ?auto_21506 ?auto_21505 ) ( not ( = ?auto_21505 ?auto_21500 ) ) ( not ( = ?auto_21503 ?auto_21505 ) ) ( not ( = ?auto_21497 ?auto_21505 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21493 ?auto_21494 ?auto_21495 )
      ( MAKE-3CRATE-VERIFY ?auto_21492 ?auto_21493 ?auto_21494 ?auto_21495 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21508 - SURFACE
      ?auto_21509 - SURFACE
      ?auto_21510 - SURFACE
      ?auto_21511 - SURFACE
      ?auto_21512 - SURFACE
    )
    :vars
    (
      ?auto_21517 - HOIST
      ?auto_21516 - PLACE
      ?auto_21519 - PLACE
      ?auto_21513 - HOIST
      ?auto_21515 - SURFACE
      ?auto_21514 - PLACE
      ?auto_21520 - HOIST
      ?auto_21523 - SURFACE
      ?auto_21518 - SURFACE
      ?auto_21522 - TRUCK
      ?auto_21521 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21517 ?auto_21516 ) ( IS-CRATE ?auto_21512 ) ( not ( = ?auto_21511 ?auto_21512 ) ) ( not ( = ?auto_21510 ?auto_21511 ) ) ( not ( = ?auto_21510 ?auto_21512 ) ) ( not ( = ?auto_21519 ?auto_21516 ) ) ( HOIST-AT ?auto_21513 ?auto_21519 ) ( not ( = ?auto_21517 ?auto_21513 ) ) ( SURFACE-AT ?auto_21512 ?auto_21519 ) ( ON ?auto_21512 ?auto_21515 ) ( CLEAR ?auto_21512 ) ( not ( = ?auto_21511 ?auto_21515 ) ) ( not ( = ?auto_21512 ?auto_21515 ) ) ( not ( = ?auto_21510 ?auto_21515 ) ) ( IS-CRATE ?auto_21511 ) ( not ( = ?auto_21514 ?auto_21516 ) ) ( not ( = ?auto_21519 ?auto_21514 ) ) ( HOIST-AT ?auto_21520 ?auto_21514 ) ( not ( = ?auto_21517 ?auto_21520 ) ) ( not ( = ?auto_21513 ?auto_21520 ) ) ( AVAILABLE ?auto_21520 ) ( SURFACE-AT ?auto_21511 ?auto_21514 ) ( ON ?auto_21511 ?auto_21523 ) ( CLEAR ?auto_21511 ) ( not ( = ?auto_21511 ?auto_21523 ) ) ( not ( = ?auto_21512 ?auto_21523 ) ) ( not ( = ?auto_21510 ?auto_21523 ) ) ( not ( = ?auto_21515 ?auto_21523 ) ) ( IS-CRATE ?auto_21510 ) ( not ( = ?auto_21509 ?auto_21510 ) ) ( not ( = ?auto_21511 ?auto_21509 ) ) ( not ( = ?auto_21512 ?auto_21509 ) ) ( not ( = ?auto_21515 ?auto_21509 ) ) ( not ( = ?auto_21523 ?auto_21509 ) ) ( AVAILABLE ?auto_21513 ) ( SURFACE-AT ?auto_21510 ?auto_21519 ) ( ON ?auto_21510 ?auto_21518 ) ( CLEAR ?auto_21510 ) ( not ( = ?auto_21511 ?auto_21518 ) ) ( not ( = ?auto_21512 ?auto_21518 ) ) ( not ( = ?auto_21510 ?auto_21518 ) ) ( not ( = ?auto_21515 ?auto_21518 ) ) ( not ( = ?auto_21523 ?auto_21518 ) ) ( not ( = ?auto_21509 ?auto_21518 ) ) ( SURFACE-AT ?auto_21508 ?auto_21516 ) ( CLEAR ?auto_21508 ) ( IS-CRATE ?auto_21509 ) ( not ( = ?auto_21508 ?auto_21509 ) ) ( not ( = ?auto_21511 ?auto_21508 ) ) ( not ( = ?auto_21512 ?auto_21508 ) ) ( not ( = ?auto_21510 ?auto_21508 ) ) ( not ( = ?auto_21515 ?auto_21508 ) ) ( not ( = ?auto_21523 ?auto_21508 ) ) ( not ( = ?auto_21518 ?auto_21508 ) ) ( AVAILABLE ?auto_21517 ) ( IN ?auto_21509 ?auto_21522 ) ( TRUCK-AT ?auto_21522 ?auto_21521 ) ( not ( = ?auto_21521 ?auto_21516 ) ) ( not ( = ?auto_21519 ?auto_21521 ) ) ( not ( = ?auto_21514 ?auto_21521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21510 ?auto_21511 ?auto_21512 )
      ( MAKE-4CRATE-VERIFY ?auto_21508 ?auto_21509 ?auto_21510 ?auto_21511 ?auto_21512 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21524 - SURFACE
      ?auto_21525 - SURFACE
    )
    :vars
    (
      ?auto_21532 - HOIST
      ?auto_21531 - PLACE
      ?auto_21537 - SURFACE
      ?auto_21534 - PLACE
      ?auto_21526 - HOIST
      ?auto_21528 - SURFACE
      ?auto_21527 - PLACE
      ?auto_21535 - HOIST
      ?auto_21539 - SURFACE
      ?auto_21530 - SURFACE
      ?auto_21533 - SURFACE
      ?auto_21529 - SURFACE
      ?auto_21538 - TRUCK
      ?auto_21536 - PLACE
      ?auto_21540 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21532 ?auto_21531 ) ( IS-CRATE ?auto_21525 ) ( not ( = ?auto_21524 ?auto_21525 ) ) ( not ( = ?auto_21537 ?auto_21524 ) ) ( not ( = ?auto_21537 ?auto_21525 ) ) ( not ( = ?auto_21534 ?auto_21531 ) ) ( HOIST-AT ?auto_21526 ?auto_21534 ) ( not ( = ?auto_21532 ?auto_21526 ) ) ( SURFACE-AT ?auto_21525 ?auto_21534 ) ( ON ?auto_21525 ?auto_21528 ) ( CLEAR ?auto_21525 ) ( not ( = ?auto_21524 ?auto_21528 ) ) ( not ( = ?auto_21525 ?auto_21528 ) ) ( not ( = ?auto_21537 ?auto_21528 ) ) ( IS-CRATE ?auto_21524 ) ( not ( = ?auto_21527 ?auto_21531 ) ) ( not ( = ?auto_21534 ?auto_21527 ) ) ( HOIST-AT ?auto_21535 ?auto_21527 ) ( not ( = ?auto_21532 ?auto_21535 ) ) ( not ( = ?auto_21526 ?auto_21535 ) ) ( AVAILABLE ?auto_21535 ) ( SURFACE-AT ?auto_21524 ?auto_21527 ) ( ON ?auto_21524 ?auto_21539 ) ( CLEAR ?auto_21524 ) ( not ( = ?auto_21524 ?auto_21539 ) ) ( not ( = ?auto_21525 ?auto_21539 ) ) ( not ( = ?auto_21537 ?auto_21539 ) ) ( not ( = ?auto_21528 ?auto_21539 ) ) ( IS-CRATE ?auto_21537 ) ( not ( = ?auto_21530 ?auto_21537 ) ) ( not ( = ?auto_21524 ?auto_21530 ) ) ( not ( = ?auto_21525 ?auto_21530 ) ) ( not ( = ?auto_21528 ?auto_21530 ) ) ( not ( = ?auto_21539 ?auto_21530 ) ) ( AVAILABLE ?auto_21526 ) ( SURFACE-AT ?auto_21537 ?auto_21534 ) ( ON ?auto_21537 ?auto_21533 ) ( CLEAR ?auto_21537 ) ( not ( = ?auto_21524 ?auto_21533 ) ) ( not ( = ?auto_21525 ?auto_21533 ) ) ( not ( = ?auto_21537 ?auto_21533 ) ) ( not ( = ?auto_21528 ?auto_21533 ) ) ( not ( = ?auto_21539 ?auto_21533 ) ) ( not ( = ?auto_21530 ?auto_21533 ) ) ( SURFACE-AT ?auto_21529 ?auto_21531 ) ( CLEAR ?auto_21529 ) ( IS-CRATE ?auto_21530 ) ( not ( = ?auto_21529 ?auto_21530 ) ) ( not ( = ?auto_21524 ?auto_21529 ) ) ( not ( = ?auto_21525 ?auto_21529 ) ) ( not ( = ?auto_21537 ?auto_21529 ) ) ( not ( = ?auto_21528 ?auto_21529 ) ) ( not ( = ?auto_21539 ?auto_21529 ) ) ( not ( = ?auto_21533 ?auto_21529 ) ) ( AVAILABLE ?auto_21532 ) ( TRUCK-AT ?auto_21538 ?auto_21536 ) ( not ( = ?auto_21536 ?auto_21531 ) ) ( not ( = ?auto_21534 ?auto_21536 ) ) ( not ( = ?auto_21527 ?auto_21536 ) ) ( HOIST-AT ?auto_21540 ?auto_21536 ) ( LIFTING ?auto_21540 ?auto_21530 ) ( not ( = ?auto_21532 ?auto_21540 ) ) ( not ( = ?auto_21526 ?auto_21540 ) ) ( not ( = ?auto_21535 ?auto_21540 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21540 ?auto_21530 ?auto_21538 ?auto_21536 )
      ( MAKE-2CRATE ?auto_21537 ?auto_21524 ?auto_21525 )
      ( MAKE-1CRATE-VERIFY ?auto_21524 ?auto_21525 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21541 - SURFACE
      ?auto_21542 - SURFACE
      ?auto_21543 - SURFACE
    )
    :vars
    (
      ?auto_21549 - HOIST
      ?auto_21546 - PLACE
      ?auto_21554 - PLACE
      ?auto_21547 - HOIST
      ?auto_21550 - SURFACE
      ?auto_21544 - PLACE
      ?auto_21557 - HOIST
      ?auto_21553 - SURFACE
      ?auto_21556 - SURFACE
      ?auto_21551 - SURFACE
      ?auto_21545 - SURFACE
      ?auto_21548 - TRUCK
      ?auto_21552 - PLACE
      ?auto_21555 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21549 ?auto_21546 ) ( IS-CRATE ?auto_21543 ) ( not ( = ?auto_21542 ?auto_21543 ) ) ( not ( = ?auto_21541 ?auto_21542 ) ) ( not ( = ?auto_21541 ?auto_21543 ) ) ( not ( = ?auto_21554 ?auto_21546 ) ) ( HOIST-AT ?auto_21547 ?auto_21554 ) ( not ( = ?auto_21549 ?auto_21547 ) ) ( SURFACE-AT ?auto_21543 ?auto_21554 ) ( ON ?auto_21543 ?auto_21550 ) ( CLEAR ?auto_21543 ) ( not ( = ?auto_21542 ?auto_21550 ) ) ( not ( = ?auto_21543 ?auto_21550 ) ) ( not ( = ?auto_21541 ?auto_21550 ) ) ( IS-CRATE ?auto_21542 ) ( not ( = ?auto_21544 ?auto_21546 ) ) ( not ( = ?auto_21554 ?auto_21544 ) ) ( HOIST-AT ?auto_21557 ?auto_21544 ) ( not ( = ?auto_21549 ?auto_21557 ) ) ( not ( = ?auto_21547 ?auto_21557 ) ) ( AVAILABLE ?auto_21557 ) ( SURFACE-AT ?auto_21542 ?auto_21544 ) ( ON ?auto_21542 ?auto_21553 ) ( CLEAR ?auto_21542 ) ( not ( = ?auto_21542 ?auto_21553 ) ) ( not ( = ?auto_21543 ?auto_21553 ) ) ( not ( = ?auto_21541 ?auto_21553 ) ) ( not ( = ?auto_21550 ?auto_21553 ) ) ( IS-CRATE ?auto_21541 ) ( not ( = ?auto_21556 ?auto_21541 ) ) ( not ( = ?auto_21542 ?auto_21556 ) ) ( not ( = ?auto_21543 ?auto_21556 ) ) ( not ( = ?auto_21550 ?auto_21556 ) ) ( not ( = ?auto_21553 ?auto_21556 ) ) ( AVAILABLE ?auto_21547 ) ( SURFACE-AT ?auto_21541 ?auto_21554 ) ( ON ?auto_21541 ?auto_21551 ) ( CLEAR ?auto_21541 ) ( not ( = ?auto_21542 ?auto_21551 ) ) ( not ( = ?auto_21543 ?auto_21551 ) ) ( not ( = ?auto_21541 ?auto_21551 ) ) ( not ( = ?auto_21550 ?auto_21551 ) ) ( not ( = ?auto_21553 ?auto_21551 ) ) ( not ( = ?auto_21556 ?auto_21551 ) ) ( SURFACE-AT ?auto_21545 ?auto_21546 ) ( CLEAR ?auto_21545 ) ( IS-CRATE ?auto_21556 ) ( not ( = ?auto_21545 ?auto_21556 ) ) ( not ( = ?auto_21542 ?auto_21545 ) ) ( not ( = ?auto_21543 ?auto_21545 ) ) ( not ( = ?auto_21541 ?auto_21545 ) ) ( not ( = ?auto_21550 ?auto_21545 ) ) ( not ( = ?auto_21553 ?auto_21545 ) ) ( not ( = ?auto_21551 ?auto_21545 ) ) ( AVAILABLE ?auto_21549 ) ( TRUCK-AT ?auto_21548 ?auto_21552 ) ( not ( = ?auto_21552 ?auto_21546 ) ) ( not ( = ?auto_21554 ?auto_21552 ) ) ( not ( = ?auto_21544 ?auto_21552 ) ) ( HOIST-AT ?auto_21555 ?auto_21552 ) ( LIFTING ?auto_21555 ?auto_21556 ) ( not ( = ?auto_21549 ?auto_21555 ) ) ( not ( = ?auto_21547 ?auto_21555 ) ) ( not ( = ?auto_21557 ?auto_21555 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21542 ?auto_21543 )
      ( MAKE-2CRATE-VERIFY ?auto_21541 ?auto_21542 ?auto_21543 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21558 - SURFACE
      ?auto_21559 - SURFACE
      ?auto_21560 - SURFACE
      ?auto_21561 - SURFACE
    )
    :vars
    (
      ?auto_21572 - HOIST
      ?auto_21569 - PLACE
      ?auto_21566 - PLACE
      ?auto_21568 - HOIST
      ?auto_21564 - SURFACE
      ?auto_21571 - PLACE
      ?auto_21567 - HOIST
      ?auto_21573 - SURFACE
      ?auto_21565 - SURFACE
      ?auto_21563 - SURFACE
      ?auto_21562 - TRUCK
      ?auto_21574 - PLACE
      ?auto_21570 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21572 ?auto_21569 ) ( IS-CRATE ?auto_21561 ) ( not ( = ?auto_21560 ?auto_21561 ) ) ( not ( = ?auto_21559 ?auto_21560 ) ) ( not ( = ?auto_21559 ?auto_21561 ) ) ( not ( = ?auto_21566 ?auto_21569 ) ) ( HOIST-AT ?auto_21568 ?auto_21566 ) ( not ( = ?auto_21572 ?auto_21568 ) ) ( SURFACE-AT ?auto_21561 ?auto_21566 ) ( ON ?auto_21561 ?auto_21564 ) ( CLEAR ?auto_21561 ) ( not ( = ?auto_21560 ?auto_21564 ) ) ( not ( = ?auto_21561 ?auto_21564 ) ) ( not ( = ?auto_21559 ?auto_21564 ) ) ( IS-CRATE ?auto_21560 ) ( not ( = ?auto_21571 ?auto_21569 ) ) ( not ( = ?auto_21566 ?auto_21571 ) ) ( HOIST-AT ?auto_21567 ?auto_21571 ) ( not ( = ?auto_21572 ?auto_21567 ) ) ( not ( = ?auto_21568 ?auto_21567 ) ) ( AVAILABLE ?auto_21567 ) ( SURFACE-AT ?auto_21560 ?auto_21571 ) ( ON ?auto_21560 ?auto_21573 ) ( CLEAR ?auto_21560 ) ( not ( = ?auto_21560 ?auto_21573 ) ) ( not ( = ?auto_21561 ?auto_21573 ) ) ( not ( = ?auto_21559 ?auto_21573 ) ) ( not ( = ?auto_21564 ?auto_21573 ) ) ( IS-CRATE ?auto_21559 ) ( not ( = ?auto_21558 ?auto_21559 ) ) ( not ( = ?auto_21560 ?auto_21558 ) ) ( not ( = ?auto_21561 ?auto_21558 ) ) ( not ( = ?auto_21564 ?auto_21558 ) ) ( not ( = ?auto_21573 ?auto_21558 ) ) ( AVAILABLE ?auto_21568 ) ( SURFACE-AT ?auto_21559 ?auto_21566 ) ( ON ?auto_21559 ?auto_21565 ) ( CLEAR ?auto_21559 ) ( not ( = ?auto_21560 ?auto_21565 ) ) ( not ( = ?auto_21561 ?auto_21565 ) ) ( not ( = ?auto_21559 ?auto_21565 ) ) ( not ( = ?auto_21564 ?auto_21565 ) ) ( not ( = ?auto_21573 ?auto_21565 ) ) ( not ( = ?auto_21558 ?auto_21565 ) ) ( SURFACE-AT ?auto_21563 ?auto_21569 ) ( CLEAR ?auto_21563 ) ( IS-CRATE ?auto_21558 ) ( not ( = ?auto_21563 ?auto_21558 ) ) ( not ( = ?auto_21560 ?auto_21563 ) ) ( not ( = ?auto_21561 ?auto_21563 ) ) ( not ( = ?auto_21559 ?auto_21563 ) ) ( not ( = ?auto_21564 ?auto_21563 ) ) ( not ( = ?auto_21573 ?auto_21563 ) ) ( not ( = ?auto_21565 ?auto_21563 ) ) ( AVAILABLE ?auto_21572 ) ( TRUCK-AT ?auto_21562 ?auto_21574 ) ( not ( = ?auto_21574 ?auto_21569 ) ) ( not ( = ?auto_21566 ?auto_21574 ) ) ( not ( = ?auto_21571 ?auto_21574 ) ) ( HOIST-AT ?auto_21570 ?auto_21574 ) ( LIFTING ?auto_21570 ?auto_21558 ) ( not ( = ?auto_21572 ?auto_21570 ) ) ( not ( = ?auto_21568 ?auto_21570 ) ) ( not ( = ?auto_21567 ?auto_21570 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21559 ?auto_21560 ?auto_21561 )
      ( MAKE-3CRATE-VERIFY ?auto_21558 ?auto_21559 ?auto_21560 ?auto_21561 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21575 - SURFACE
      ?auto_21576 - SURFACE
      ?auto_21577 - SURFACE
      ?auto_21578 - SURFACE
      ?auto_21579 - SURFACE
    )
    :vars
    (
      ?auto_21589 - HOIST
      ?auto_21586 - PLACE
      ?auto_21583 - PLACE
      ?auto_21585 - HOIST
      ?auto_21581 - SURFACE
      ?auto_21588 - PLACE
      ?auto_21584 - HOIST
      ?auto_21590 - SURFACE
      ?auto_21582 - SURFACE
      ?auto_21580 - TRUCK
      ?auto_21591 - PLACE
      ?auto_21587 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21589 ?auto_21586 ) ( IS-CRATE ?auto_21579 ) ( not ( = ?auto_21578 ?auto_21579 ) ) ( not ( = ?auto_21577 ?auto_21578 ) ) ( not ( = ?auto_21577 ?auto_21579 ) ) ( not ( = ?auto_21583 ?auto_21586 ) ) ( HOIST-AT ?auto_21585 ?auto_21583 ) ( not ( = ?auto_21589 ?auto_21585 ) ) ( SURFACE-AT ?auto_21579 ?auto_21583 ) ( ON ?auto_21579 ?auto_21581 ) ( CLEAR ?auto_21579 ) ( not ( = ?auto_21578 ?auto_21581 ) ) ( not ( = ?auto_21579 ?auto_21581 ) ) ( not ( = ?auto_21577 ?auto_21581 ) ) ( IS-CRATE ?auto_21578 ) ( not ( = ?auto_21588 ?auto_21586 ) ) ( not ( = ?auto_21583 ?auto_21588 ) ) ( HOIST-AT ?auto_21584 ?auto_21588 ) ( not ( = ?auto_21589 ?auto_21584 ) ) ( not ( = ?auto_21585 ?auto_21584 ) ) ( AVAILABLE ?auto_21584 ) ( SURFACE-AT ?auto_21578 ?auto_21588 ) ( ON ?auto_21578 ?auto_21590 ) ( CLEAR ?auto_21578 ) ( not ( = ?auto_21578 ?auto_21590 ) ) ( not ( = ?auto_21579 ?auto_21590 ) ) ( not ( = ?auto_21577 ?auto_21590 ) ) ( not ( = ?auto_21581 ?auto_21590 ) ) ( IS-CRATE ?auto_21577 ) ( not ( = ?auto_21576 ?auto_21577 ) ) ( not ( = ?auto_21578 ?auto_21576 ) ) ( not ( = ?auto_21579 ?auto_21576 ) ) ( not ( = ?auto_21581 ?auto_21576 ) ) ( not ( = ?auto_21590 ?auto_21576 ) ) ( AVAILABLE ?auto_21585 ) ( SURFACE-AT ?auto_21577 ?auto_21583 ) ( ON ?auto_21577 ?auto_21582 ) ( CLEAR ?auto_21577 ) ( not ( = ?auto_21578 ?auto_21582 ) ) ( not ( = ?auto_21579 ?auto_21582 ) ) ( not ( = ?auto_21577 ?auto_21582 ) ) ( not ( = ?auto_21581 ?auto_21582 ) ) ( not ( = ?auto_21590 ?auto_21582 ) ) ( not ( = ?auto_21576 ?auto_21582 ) ) ( SURFACE-AT ?auto_21575 ?auto_21586 ) ( CLEAR ?auto_21575 ) ( IS-CRATE ?auto_21576 ) ( not ( = ?auto_21575 ?auto_21576 ) ) ( not ( = ?auto_21578 ?auto_21575 ) ) ( not ( = ?auto_21579 ?auto_21575 ) ) ( not ( = ?auto_21577 ?auto_21575 ) ) ( not ( = ?auto_21581 ?auto_21575 ) ) ( not ( = ?auto_21590 ?auto_21575 ) ) ( not ( = ?auto_21582 ?auto_21575 ) ) ( AVAILABLE ?auto_21589 ) ( TRUCK-AT ?auto_21580 ?auto_21591 ) ( not ( = ?auto_21591 ?auto_21586 ) ) ( not ( = ?auto_21583 ?auto_21591 ) ) ( not ( = ?auto_21588 ?auto_21591 ) ) ( HOIST-AT ?auto_21587 ?auto_21591 ) ( LIFTING ?auto_21587 ?auto_21576 ) ( not ( = ?auto_21589 ?auto_21587 ) ) ( not ( = ?auto_21585 ?auto_21587 ) ) ( not ( = ?auto_21584 ?auto_21587 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21577 ?auto_21578 ?auto_21579 )
      ( MAKE-4CRATE-VERIFY ?auto_21575 ?auto_21576 ?auto_21577 ?auto_21578 ?auto_21579 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21592 - SURFACE
      ?auto_21593 - SURFACE
    )
    :vars
    (
      ?auto_21605 - HOIST
      ?auto_21602 - PLACE
      ?auto_21594 - SURFACE
      ?auto_21599 - PLACE
      ?auto_21601 - HOIST
      ?auto_21597 - SURFACE
      ?auto_21604 - PLACE
      ?auto_21600 - HOIST
      ?auto_21607 - SURFACE
      ?auto_21606 - SURFACE
      ?auto_21598 - SURFACE
      ?auto_21596 - SURFACE
      ?auto_21595 - TRUCK
      ?auto_21608 - PLACE
      ?auto_21603 - HOIST
      ?auto_21609 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21605 ?auto_21602 ) ( IS-CRATE ?auto_21593 ) ( not ( = ?auto_21592 ?auto_21593 ) ) ( not ( = ?auto_21594 ?auto_21592 ) ) ( not ( = ?auto_21594 ?auto_21593 ) ) ( not ( = ?auto_21599 ?auto_21602 ) ) ( HOIST-AT ?auto_21601 ?auto_21599 ) ( not ( = ?auto_21605 ?auto_21601 ) ) ( SURFACE-AT ?auto_21593 ?auto_21599 ) ( ON ?auto_21593 ?auto_21597 ) ( CLEAR ?auto_21593 ) ( not ( = ?auto_21592 ?auto_21597 ) ) ( not ( = ?auto_21593 ?auto_21597 ) ) ( not ( = ?auto_21594 ?auto_21597 ) ) ( IS-CRATE ?auto_21592 ) ( not ( = ?auto_21604 ?auto_21602 ) ) ( not ( = ?auto_21599 ?auto_21604 ) ) ( HOIST-AT ?auto_21600 ?auto_21604 ) ( not ( = ?auto_21605 ?auto_21600 ) ) ( not ( = ?auto_21601 ?auto_21600 ) ) ( AVAILABLE ?auto_21600 ) ( SURFACE-AT ?auto_21592 ?auto_21604 ) ( ON ?auto_21592 ?auto_21607 ) ( CLEAR ?auto_21592 ) ( not ( = ?auto_21592 ?auto_21607 ) ) ( not ( = ?auto_21593 ?auto_21607 ) ) ( not ( = ?auto_21594 ?auto_21607 ) ) ( not ( = ?auto_21597 ?auto_21607 ) ) ( IS-CRATE ?auto_21594 ) ( not ( = ?auto_21606 ?auto_21594 ) ) ( not ( = ?auto_21592 ?auto_21606 ) ) ( not ( = ?auto_21593 ?auto_21606 ) ) ( not ( = ?auto_21597 ?auto_21606 ) ) ( not ( = ?auto_21607 ?auto_21606 ) ) ( AVAILABLE ?auto_21601 ) ( SURFACE-AT ?auto_21594 ?auto_21599 ) ( ON ?auto_21594 ?auto_21598 ) ( CLEAR ?auto_21594 ) ( not ( = ?auto_21592 ?auto_21598 ) ) ( not ( = ?auto_21593 ?auto_21598 ) ) ( not ( = ?auto_21594 ?auto_21598 ) ) ( not ( = ?auto_21597 ?auto_21598 ) ) ( not ( = ?auto_21607 ?auto_21598 ) ) ( not ( = ?auto_21606 ?auto_21598 ) ) ( SURFACE-AT ?auto_21596 ?auto_21602 ) ( CLEAR ?auto_21596 ) ( IS-CRATE ?auto_21606 ) ( not ( = ?auto_21596 ?auto_21606 ) ) ( not ( = ?auto_21592 ?auto_21596 ) ) ( not ( = ?auto_21593 ?auto_21596 ) ) ( not ( = ?auto_21594 ?auto_21596 ) ) ( not ( = ?auto_21597 ?auto_21596 ) ) ( not ( = ?auto_21607 ?auto_21596 ) ) ( not ( = ?auto_21598 ?auto_21596 ) ) ( AVAILABLE ?auto_21605 ) ( TRUCK-AT ?auto_21595 ?auto_21608 ) ( not ( = ?auto_21608 ?auto_21602 ) ) ( not ( = ?auto_21599 ?auto_21608 ) ) ( not ( = ?auto_21604 ?auto_21608 ) ) ( HOIST-AT ?auto_21603 ?auto_21608 ) ( not ( = ?auto_21605 ?auto_21603 ) ) ( not ( = ?auto_21601 ?auto_21603 ) ) ( not ( = ?auto_21600 ?auto_21603 ) ) ( AVAILABLE ?auto_21603 ) ( SURFACE-AT ?auto_21606 ?auto_21608 ) ( ON ?auto_21606 ?auto_21609 ) ( CLEAR ?auto_21606 ) ( not ( = ?auto_21592 ?auto_21609 ) ) ( not ( = ?auto_21593 ?auto_21609 ) ) ( not ( = ?auto_21594 ?auto_21609 ) ) ( not ( = ?auto_21597 ?auto_21609 ) ) ( not ( = ?auto_21607 ?auto_21609 ) ) ( not ( = ?auto_21606 ?auto_21609 ) ) ( not ( = ?auto_21598 ?auto_21609 ) ) ( not ( = ?auto_21596 ?auto_21609 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21603 ?auto_21606 ?auto_21609 ?auto_21608 )
      ( MAKE-2CRATE ?auto_21594 ?auto_21592 ?auto_21593 )
      ( MAKE-1CRATE-VERIFY ?auto_21592 ?auto_21593 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21610 - SURFACE
      ?auto_21611 - SURFACE
      ?auto_21612 - SURFACE
    )
    :vars
    (
      ?auto_21622 - HOIST
      ?auto_21613 - PLACE
      ?auto_21627 - PLACE
      ?auto_21623 - HOIST
      ?auto_21625 - SURFACE
      ?auto_21614 - PLACE
      ?auto_21626 - HOIST
      ?auto_21624 - SURFACE
      ?auto_21621 - SURFACE
      ?auto_21618 - SURFACE
      ?auto_21616 - SURFACE
      ?auto_21617 - TRUCK
      ?auto_21620 - PLACE
      ?auto_21619 - HOIST
      ?auto_21615 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21622 ?auto_21613 ) ( IS-CRATE ?auto_21612 ) ( not ( = ?auto_21611 ?auto_21612 ) ) ( not ( = ?auto_21610 ?auto_21611 ) ) ( not ( = ?auto_21610 ?auto_21612 ) ) ( not ( = ?auto_21627 ?auto_21613 ) ) ( HOIST-AT ?auto_21623 ?auto_21627 ) ( not ( = ?auto_21622 ?auto_21623 ) ) ( SURFACE-AT ?auto_21612 ?auto_21627 ) ( ON ?auto_21612 ?auto_21625 ) ( CLEAR ?auto_21612 ) ( not ( = ?auto_21611 ?auto_21625 ) ) ( not ( = ?auto_21612 ?auto_21625 ) ) ( not ( = ?auto_21610 ?auto_21625 ) ) ( IS-CRATE ?auto_21611 ) ( not ( = ?auto_21614 ?auto_21613 ) ) ( not ( = ?auto_21627 ?auto_21614 ) ) ( HOIST-AT ?auto_21626 ?auto_21614 ) ( not ( = ?auto_21622 ?auto_21626 ) ) ( not ( = ?auto_21623 ?auto_21626 ) ) ( AVAILABLE ?auto_21626 ) ( SURFACE-AT ?auto_21611 ?auto_21614 ) ( ON ?auto_21611 ?auto_21624 ) ( CLEAR ?auto_21611 ) ( not ( = ?auto_21611 ?auto_21624 ) ) ( not ( = ?auto_21612 ?auto_21624 ) ) ( not ( = ?auto_21610 ?auto_21624 ) ) ( not ( = ?auto_21625 ?auto_21624 ) ) ( IS-CRATE ?auto_21610 ) ( not ( = ?auto_21621 ?auto_21610 ) ) ( not ( = ?auto_21611 ?auto_21621 ) ) ( not ( = ?auto_21612 ?auto_21621 ) ) ( not ( = ?auto_21625 ?auto_21621 ) ) ( not ( = ?auto_21624 ?auto_21621 ) ) ( AVAILABLE ?auto_21623 ) ( SURFACE-AT ?auto_21610 ?auto_21627 ) ( ON ?auto_21610 ?auto_21618 ) ( CLEAR ?auto_21610 ) ( not ( = ?auto_21611 ?auto_21618 ) ) ( not ( = ?auto_21612 ?auto_21618 ) ) ( not ( = ?auto_21610 ?auto_21618 ) ) ( not ( = ?auto_21625 ?auto_21618 ) ) ( not ( = ?auto_21624 ?auto_21618 ) ) ( not ( = ?auto_21621 ?auto_21618 ) ) ( SURFACE-AT ?auto_21616 ?auto_21613 ) ( CLEAR ?auto_21616 ) ( IS-CRATE ?auto_21621 ) ( not ( = ?auto_21616 ?auto_21621 ) ) ( not ( = ?auto_21611 ?auto_21616 ) ) ( not ( = ?auto_21612 ?auto_21616 ) ) ( not ( = ?auto_21610 ?auto_21616 ) ) ( not ( = ?auto_21625 ?auto_21616 ) ) ( not ( = ?auto_21624 ?auto_21616 ) ) ( not ( = ?auto_21618 ?auto_21616 ) ) ( AVAILABLE ?auto_21622 ) ( TRUCK-AT ?auto_21617 ?auto_21620 ) ( not ( = ?auto_21620 ?auto_21613 ) ) ( not ( = ?auto_21627 ?auto_21620 ) ) ( not ( = ?auto_21614 ?auto_21620 ) ) ( HOIST-AT ?auto_21619 ?auto_21620 ) ( not ( = ?auto_21622 ?auto_21619 ) ) ( not ( = ?auto_21623 ?auto_21619 ) ) ( not ( = ?auto_21626 ?auto_21619 ) ) ( AVAILABLE ?auto_21619 ) ( SURFACE-AT ?auto_21621 ?auto_21620 ) ( ON ?auto_21621 ?auto_21615 ) ( CLEAR ?auto_21621 ) ( not ( = ?auto_21611 ?auto_21615 ) ) ( not ( = ?auto_21612 ?auto_21615 ) ) ( not ( = ?auto_21610 ?auto_21615 ) ) ( not ( = ?auto_21625 ?auto_21615 ) ) ( not ( = ?auto_21624 ?auto_21615 ) ) ( not ( = ?auto_21621 ?auto_21615 ) ) ( not ( = ?auto_21618 ?auto_21615 ) ) ( not ( = ?auto_21616 ?auto_21615 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21611 ?auto_21612 )
      ( MAKE-2CRATE-VERIFY ?auto_21610 ?auto_21611 ?auto_21612 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21628 - SURFACE
      ?auto_21629 - SURFACE
      ?auto_21630 - SURFACE
      ?auto_21631 - SURFACE
    )
    :vars
    (
      ?auto_21645 - HOIST
      ?auto_21641 - PLACE
      ?auto_21633 - PLACE
      ?auto_21639 - HOIST
      ?auto_21637 - SURFACE
      ?auto_21642 - PLACE
      ?auto_21636 - HOIST
      ?auto_21635 - SURFACE
      ?auto_21634 - SURFACE
      ?auto_21632 - SURFACE
      ?auto_21643 - TRUCK
      ?auto_21640 - PLACE
      ?auto_21644 - HOIST
      ?auto_21638 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21645 ?auto_21641 ) ( IS-CRATE ?auto_21631 ) ( not ( = ?auto_21630 ?auto_21631 ) ) ( not ( = ?auto_21629 ?auto_21630 ) ) ( not ( = ?auto_21629 ?auto_21631 ) ) ( not ( = ?auto_21633 ?auto_21641 ) ) ( HOIST-AT ?auto_21639 ?auto_21633 ) ( not ( = ?auto_21645 ?auto_21639 ) ) ( SURFACE-AT ?auto_21631 ?auto_21633 ) ( ON ?auto_21631 ?auto_21637 ) ( CLEAR ?auto_21631 ) ( not ( = ?auto_21630 ?auto_21637 ) ) ( not ( = ?auto_21631 ?auto_21637 ) ) ( not ( = ?auto_21629 ?auto_21637 ) ) ( IS-CRATE ?auto_21630 ) ( not ( = ?auto_21642 ?auto_21641 ) ) ( not ( = ?auto_21633 ?auto_21642 ) ) ( HOIST-AT ?auto_21636 ?auto_21642 ) ( not ( = ?auto_21645 ?auto_21636 ) ) ( not ( = ?auto_21639 ?auto_21636 ) ) ( AVAILABLE ?auto_21636 ) ( SURFACE-AT ?auto_21630 ?auto_21642 ) ( ON ?auto_21630 ?auto_21635 ) ( CLEAR ?auto_21630 ) ( not ( = ?auto_21630 ?auto_21635 ) ) ( not ( = ?auto_21631 ?auto_21635 ) ) ( not ( = ?auto_21629 ?auto_21635 ) ) ( not ( = ?auto_21637 ?auto_21635 ) ) ( IS-CRATE ?auto_21629 ) ( not ( = ?auto_21628 ?auto_21629 ) ) ( not ( = ?auto_21630 ?auto_21628 ) ) ( not ( = ?auto_21631 ?auto_21628 ) ) ( not ( = ?auto_21637 ?auto_21628 ) ) ( not ( = ?auto_21635 ?auto_21628 ) ) ( AVAILABLE ?auto_21639 ) ( SURFACE-AT ?auto_21629 ?auto_21633 ) ( ON ?auto_21629 ?auto_21634 ) ( CLEAR ?auto_21629 ) ( not ( = ?auto_21630 ?auto_21634 ) ) ( not ( = ?auto_21631 ?auto_21634 ) ) ( not ( = ?auto_21629 ?auto_21634 ) ) ( not ( = ?auto_21637 ?auto_21634 ) ) ( not ( = ?auto_21635 ?auto_21634 ) ) ( not ( = ?auto_21628 ?auto_21634 ) ) ( SURFACE-AT ?auto_21632 ?auto_21641 ) ( CLEAR ?auto_21632 ) ( IS-CRATE ?auto_21628 ) ( not ( = ?auto_21632 ?auto_21628 ) ) ( not ( = ?auto_21630 ?auto_21632 ) ) ( not ( = ?auto_21631 ?auto_21632 ) ) ( not ( = ?auto_21629 ?auto_21632 ) ) ( not ( = ?auto_21637 ?auto_21632 ) ) ( not ( = ?auto_21635 ?auto_21632 ) ) ( not ( = ?auto_21634 ?auto_21632 ) ) ( AVAILABLE ?auto_21645 ) ( TRUCK-AT ?auto_21643 ?auto_21640 ) ( not ( = ?auto_21640 ?auto_21641 ) ) ( not ( = ?auto_21633 ?auto_21640 ) ) ( not ( = ?auto_21642 ?auto_21640 ) ) ( HOIST-AT ?auto_21644 ?auto_21640 ) ( not ( = ?auto_21645 ?auto_21644 ) ) ( not ( = ?auto_21639 ?auto_21644 ) ) ( not ( = ?auto_21636 ?auto_21644 ) ) ( AVAILABLE ?auto_21644 ) ( SURFACE-AT ?auto_21628 ?auto_21640 ) ( ON ?auto_21628 ?auto_21638 ) ( CLEAR ?auto_21628 ) ( not ( = ?auto_21630 ?auto_21638 ) ) ( not ( = ?auto_21631 ?auto_21638 ) ) ( not ( = ?auto_21629 ?auto_21638 ) ) ( not ( = ?auto_21637 ?auto_21638 ) ) ( not ( = ?auto_21635 ?auto_21638 ) ) ( not ( = ?auto_21628 ?auto_21638 ) ) ( not ( = ?auto_21634 ?auto_21638 ) ) ( not ( = ?auto_21632 ?auto_21638 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21629 ?auto_21630 ?auto_21631 )
      ( MAKE-3CRATE-VERIFY ?auto_21628 ?auto_21629 ?auto_21630 ?auto_21631 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21646 - SURFACE
      ?auto_21647 - SURFACE
      ?auto_21648 - SURFACE
      ?auto_21649 - SURFACE
      ?auto_21650 - SURFACE
    )
    :vars
    (
      ?auto_21663 - HOIST
      ?auto_21659 - PLACE
      ?auto_21651 - PLACE
      ?auto_21657 - HOIST
      ?auto_21655 - SURFACE
      ?auto_21660 - PLACE
      ?auto_21654 - HOIST
      ?auto_21653 - SURFACE
      ?auto_21652 - SURFACE
      ?auto_21661 - TRUCK
      ?auto_21658 - PLACE
      ?auto_21662 - HOIST
      ?auto_21656 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21663 ?auto_21659 ) ( IS-CRATE ?auto_21650 ) ( not ( = ?auto_21649 ?auto_21650 ) ) ( not ( = ?auto_21648 ?auto_21649 ) ) ( not ( = ?auto_21648 ?auto_21650 ) ) ( not ( = ?auto_21651 ?auto_21659 ) ) ( HOIST-AT ?auto_21657 ?auto_21651 ) ( not ( = ?auto_21663 ?auto_21657 ) ) ( SURFACE-AT ?auto_21650 ?auto_21651 ) ( ON ?auto_21650 ?auto_21655 ) ( CLEAR ?auto_21650 ) ( not ( = ?auto_21649 ?auto_21655 ) ) ( not ( = ?auto_21650 ?auto_21655 ) ) ( not ( = ?auto_21648 ?auto_21655 ) ) ( IS-CRATE ?auto_21649 ) ( not ( = ?auto_21660 ?auto_21659 ) ) ( not ( = ?auto_21651 ?auto_21660 ) ) ( HOIST-AT ?auto_21654 ?auto_21660 ) ( not ( = ?auto_21663 ?auto_21654 ) ) ( not ( = ?auto_21657 ?auto_21654 ) ) ( AVAILABLE ?auto_21654 ) ( SURFACE-AT ?auto_21649 ?auto_21660 ) ( ON ?auto_21649 ?auto_21653 ) ( CLEAR ?auto_21649 ) ( not ( = ?auto_21649 ?auto_21653 ) ) ( not ( = ?auto_21650 ?auto_21653 ) ) ( not ( = ?auto_21648 ?auto_21653 ) ) ( not ( = ?auto_21655 ?auto_21653 ) ) ( IS-CRATE ?auto_21648 ) ( not ( = ?auto_21647 ?auto_21648 ) ) ( not ( = ?auto_21649 ?auto_21647 ) ) ( not ( = ?auto_21650 ?auto_21647 ) ) ( not ( = ?auto_21655 ?auto_21647 ) ) ( not ( = ?auto_21653 ?auto_21647 ) ) ( AVAILABLE ?auto_21657 ) ( SURFACE-AT ?auto_21648 ?auto_21651 ) ( ON ?auto_21648 ?auto_21652 ) ( CLEAR ?auto_21648 ) ( not ( = ?auto_21649 ?auto_21652 ) ) ( not ( = ?auto_21650 ?auto_21652 ) ) ( not ( = ?auto_21648 ?auto_21652 ) ) ( not ( = ?auto_21655 ?auto_21652 ) ) ( not ( = ?auto_21653 ?auto_21652 ) ) ( not ( = ?auto_21647 ?auto_21652 ) ) ( SURFACE-AT ?auto_21646 ?auto_21659 ) ( CLEAR ?auto_21646 ) ( IS-CRATE ?auto_21647 ) ( not ( = ?auto_21646 ?auto_21647 ) ) ( not ( = ?auto_21649 ?auto_21646 ) ) ( not ( = ?auto_21650 ?auto_21646 ) ) ( not ( = ?auto_21648 ?auto_21646 ) ) ( not ( = ?auto_21655 ?auto_21646 ) ) ( not ( = ?auto_21653 ?auto_21646 ) ) ( not ( = ?auto_21652 ?auto_21646 ) ) ( AVAILABLE ?auto_21663 ) ( TRUCK-AT ?auto_21661 ?auto_21658 ) ( not ( = ?auto_21658 ?auto_21659 ) ) ( not ( = ?auto_21651 ?auto_21658 ) ) ( not ( = ?auto_21660 ?auto_21658 ) ) ( HOIST-AT ?auto_21662 ?auto_21658 ) ( not ( = ?auto_21663 ?auto_21662 ) ) ( not ( = ?auto_21657 ?auto_21662 ) ) ( not ( = ?auto_21654 ?auto_21662 ) ) ( AVAILABLE ?auto_21662 ) ( SURFACE-AT ?auto_21647 ?auto_21658 ) ( ON ?auto_21647 ?auto_21656 ) ( CLEAR ?auto_21647 ) ( not ( = ?auto_21649 ?auto_21656 ) ) ( not ( = ?auto_21650 ?auto_21656 ) ) ( not ( = ?auto_21648 ?auto_21656 ) ) ( not ( = ?auto_21655 ?auto_21656 ) ) ( not ( = ?auto_21653 ?auto_21656 ) ) ( not ( = ?auto_21647 ?auto_21656 ) ) ( not ( = ?auto_21652 ?auto_21656 ) ) ( not ( = ?auto_21646 ?auto_21656 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21648 ?auto_21649 ?auto_21650 )
      ( MAKE-4CRATE-VERIFY ?auto_21646 ?auto_21647 ?auto_21648 ?auto_21649 ?auto_21650 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21664 - SURFACE
      ?auto_21665 - SURFACE
    )
    :vars
    (
      ?auto_21681 - HOIST
      ?auto_21677 - PLACE
      ?auto_21669 - SURFACE
      ?auto_21667 - PLACE
      ?auto_21675 - HOIST
      ?auto_21672 - SURFACE
      ?auto_21678 - PLACE
      ?auto_21671 - HOIST
      ?auto_21670 - SURFACE
      ?auto_21674 - SURFACE
      ?auto_21668 - SURFACE
      ?auto_21666 - SURFACE
      ?auto_21676 - PLACE
      ?auto_21680 - HOIST
      ?auto_21673 - SURFACE
      ?auto_21679 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21681 ?auto_21677 ) ( IS-CRATE ?auto_21665 ) ( not ( = ?auto_21664 ?auto_21665 ) ) ( not ( = ?auto_21669 ?auto_21664 ) ) ( not ( = ?auto_21669 ?auto_21665 ) ) ( not ( = ?auto_21667 ?auto_21677 ) ) ( HOIST-AT ?auto_21675 ?auto_21667 ) ( not ( = ?auto_21681 ?auto_21675 ) ) ( SURFACE-AT ?auto_21665 ?auto_21667 ) ( ON ?auto_21665 ?auto_21672 ) ( CLEAR ?auto_21665 ) ( not ( = ?auto_21664 ?auto_21672 ) ) ( not ( = ?auto_21665 ?auto_21672 ) ) ( not ( = ?auto_21669 ?auto_21672 ) ) ( IS-CRATE ?auto_21664 ) ( not ( = ?auto_21678 ?auto_21677 ) ) ( not ( = ?auto_21667 ?auto_21678 ) ) ( HOIST-AT ?auto_21671 ?auto_21678 ) ( not ( = ?auto_21681 ?auto_21671 ) ) ( not ( = ?auto_21675 ?auto_21671 ) ) ( AVAILABLE ?auto_21671 ) ( SURFACE-AT ?auto_21664 ?auto_21678 ) ( ON ?auto_21664 ?auto_21670 ) ( CLEAR ?auto_21664 ) ( not ( = ?auto_21664 ?auto_21670 ) ) ( not ( = ?auto_21665 ?auto_21670 ) ) ( not ( = ?auto_21669 ?auto_21670 ) ) ( not ( = ?auto_21672 ?auto_21670 ) ) ( IS-CRATE ?auto_21669 ) ( not ( = ?auto_21674 ?auto_21669 ) ) ( not ( = ?auto_21664 ?auto_21674 ) ) ( not ( = ?auto_21665 ?auto_21674 ) ) ( not ( = ?auto_21672 ?auto_21674 ) ) ( not ( = ?auto_21670 ?auto_21674 ) ) ( AVAILABLE ?auto_21675 ) ( SURFACE-AT ?auto_21669 ?auto_21667 ) ( ON ?auto_21669 ?auto_21668 ) ( CLEAR ?auto_21669 ) ( not ( = ?auto_21664 ?auto_21668 ) ) ( not ( = ?auto_21665 ?auto_21668 ) ) ( not ( = ?auto_21669 ?auto_21668 ) ) ( not ( = ?auto_21672 ?auto_21668 ) ) ( not ( = ?auto_21670 ?auto_21668 ) ) ( not ( = ?auto_21674 ?auto_21668 ) ) ( SURFACE-AT ?auto_21666 ?auto_21677 ) ( CLEAR ?auto_21666 ) ( IS-CRATE ?auto_21674 ) ( not ( = ?auto_21666 ?auto_21674 ) ) ( not ( = ?auto_21664 ?auto_21666 ) ) ( not ( = ?auto_21665 ?auto_21666 ) ) ( not ( = ?auto_21669 ?auto_21666 ) ) ( not ( = ?auto_21672 ?auto_21666 ) ) ( not ( = ?auto_21670 ?auto_21666 ) ) ( not ( = ?auto_21668 ?auto_21666 ) ) ( AVAILABLE ?auto_21681 ) ( not ( = ?auto_21676 ?auto_21677 ) ) ( not ( = ?auto_21667 ?auto_21676 ) ) ( not ( = ?auto_21678 ?auto_21676 ) ) ( HOIST-AT ?auto_21680 ?auto_21676 ) ( not ( = ?auto_21681 ?auto_21680 ) ) ( not ( = ?auto_21675 ?auto_21680 ) ) ( not ( = ?auto_21671 ?auto_21680 ) ) ( AVAILABLE ?auto_21680 ) ( SURFACE-AT ?auto_21674 ?auto_21676 ) ( ON ?auto_21674 ?auto_21673 ) ( CLEAR ?auto_21674 ) ( not ( = ?auto_21664 ?auto_21673 ) ) ( not ( = ?auto_21665 ?auto_21673 ) ) ( not ( = ?auto_21669 ?auto_21673 ) ) ( not ( = ?auto_21672 ?auto_21673 ) ) ( not ( = ?auto_21670 ?auto_21673 ) ) ( not ( = ?auto_21674 ?auto_21673 ) ) ( not ( = ?auto_21668 ?auto_21673 ) ) ( not ( = ?auto_21666 ?auto_21673 ) ) ( TRUCK-AT ?auto_21679 ?auto_21677 ) )
    :subtasks
    ( ( !DRIVE ?auto_21679 ?auto_21677 ?auto_21676 )
      ( MAKE-2CRATE ?auto_21669 ?auto_21664 ?auto_21665 )
      ( MAKE-1CRATE-VERIFY ?auto_21664 ?auto_21665 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21682 - SURFACE
      ?auto_21683 - SURFACE
      ?auto_21684 - SURFACE
    )
    :vars
    (
      ?auto_21694 - HOIST
      ?auto_21687 - PLACE
      ?auto_21696 - PLACE
      ?auto_21691 - HOIST
      ?auto_21695 - SURFACE
      ?auto_21693 - PLACE
      ?auto_21699 - HOIST
      ?auto_21689 - SURFACE
      ?auto_21686 - SURFACE
      ?auto_21690 - SURFACE
      ?auto_21688 - SURFACE
      ?auto_21697 - PLACE
      ?auto_21685 - HOIST
      ?auto_21692 - SURFACE
      ?auto_21698 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21694 ?auto_21687 ) ( IS-CRATE ?auto_21684 ) ( not ( = ?auto_21683 ?auto_21684 ) ) ( not ( = ?auto_21682 ?auto_21683 ) ) ( not ( = ?auto_21682 ?auto_21684 ) ) ( not ( = ?auto_21696 ?auto_21687 ) ) ( HOIST-AT ?auto_21691 ?auto_21696 ) ( not ( = ?auto_21694 ?auto_21691 ) ) ( SURFACE-AT ?auto_21684 ?auto_21696 ) ( ON ?auto_21684 ?auto_21695 ) ( CLEAR ?auto_21684 ) ( not ( = ?auto_21683 ?auto_21695 ) ) ( not ( = ?auto_21684 ?auto_21695 ) ) ( not ( = ?auto_21682 ?auto_21695 ) ) ( IS-CRATE ?auto_21683 ) ( not ( = ?auto_21693 ?auto_21687 ) ) ( not ( = ?auto_21696 ?auto_21693 ) ) ( HOIST-AT ?auto_21699 ?auto_21693 ) ( not ( = ?auto_21694 ?auto_21699 ) ) ( not ( = ?auto_21691 ?auto_21699 ) ) ( AVAILABLE ?auto_21699 ) ( SURFACE-AT ?auto_21683 ?auto_21693 ) ( ON ?auto_21683 ?auto_21689 ) ( CLEAR ?auto_21683 ) ( not ( = ?auto_21683 ?auto_21689 ) ) ( not ( = ?auto_21684 ?auto_21689 ) ) ( not ( = ?auto_21682 ?auto_21689 ) ) ( not ( = ?auto_21695 ?auto_21689 ) ) ( IS-CRATE ?auto_21682 ) ( not ( = ?auto_21686 ?auto_21682 ) ) ( not ( = ?auto_21683 ?auto_21686 ) ) ( not ( = ?auto_21684 ?auto_21686 ) ) ( not ( = ?auto_21695 ?auto_21686 ) ) ( not ( = ?auto_21689 ?auto_21686 ) ) ( AVAILABLE ?auto_21691 ) ( SURFACE-AT ?auto_21682 ?auto_21696 ) ( ON ?auto_21682 ?auto_21690 ) ( CLEAR ?auto_21682 ) ( not ( = ?auto_21683 ?auto_21690 ) ) ( not ( = ?auto_21684 ?auto_21690 ) ) ( not ( = ?auto_21682 ?auto_21690 ) ) ( not ( = ?auto_21695 ?auto_21690 ) ) ( not ( = ?auto_21689 ?auto_21690 ) ) ( not ( = ?auto_21686 ?auto_21690 ) ) ( SURFACE-AT ?auto_21688 ?auto_21687 ) ( CLEAR ?auto_21688 ) ( IS-CRATE ?auto_21686 ) ( not ( = ?auto_21688 ?auto_21686 ) ) ( not ( = ?auto_21683 ?auto_21688 ) ) ( not ( = ?auto_21684 ?auto_21688 ) ) ( not ( = ?auto_21682 ?auto_21688 ) ) ( not ( = ?auto_21695 ?auto_21688 ) ) ( not ( = ?auto_21689 ?auto_21688 ) ) ( not ( = ?auto_21690 ?auto_21688 ) ) ( AVAILABLE ?auto_21694 ) ( not ( = ?auto_21697 ?auto_21687 ) ) ( not ( = ?auto_21696 ?auto_21697 ) ) ( not ( = ?auto_21693 ?auto_21697 ) ) ( HOIST-AT ?auto_21685 ?auto_21697 ) ( not ( = ?auto_21694 ?auto_21685 ) ) ( not ( = ?auto_21691 ?auto_21685 ) ) ( not ( = ?auto_21699 ?auto_21685 ) ) ( AVAILABLE ?auto_21685 ) ( SURFACE-AT ?auto_21686 ?auto_21697 ) ( ON ?auto_21686 ?auto_21692 ) ( CLEAR ?auto_21686 ) ( not ( = ?auto_21683 ?auto_21692 ) ) ( not ( = ?auto_21684 ?auto_21692 ) ) ( not ( = ?auto_21682 ?auto_21692 ) ) ( not ( = ?auto_21695 ?auto_21692 ) ) ( not ( = ?auto_21689 ?auto_21692 ) ) ( not ( = ?auto_21686 ?auto_21692 ) ) ( not ( = ?auto_21690 ?auto_21692 ) ) ( not ( = ?auto_21688 ?auto_21692 ) ) ( TRUCK-AT ?auto_21698 ?auto_21687 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21683 ?auto_21684 )
      ( MAKE-2CRATE-VERIFY ?auto_21682 ?auto_21683 ?auto_21684 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21700 - SURFACE
      ?auto_21701 - SURFACE
      ?auto_21702 - SURFACE
      ?auto_21703 - SURFACE
    )
    :vars
    (
      ?auto_21710 - HOIST
      ?auto_21704 - PLACE
      ?auto_21715 - PLACE
      ?auto_21717 - HOIST
      ?auto_21713 - SURFACE
      ?auto_21707 - PLACE
      ?auto_21709 - HOIST
      ?auto_21706 - SURFACE
      ?auto_21708 - SURFACE
      ?auto_21705 - SURFACE
      ?auto_21712 - PLACE
      ?auto_21711 - HOIST
      ?auto_21716 - SURFACE
      ?auto_21714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21710 ?auto_21704 ) ( IS-CRATE ?auto_21703 ) ( not ( = ?auto_21702 ?auto_21703 ) ) ( not ( = ?auto_21701 ?auto_21702 ) ) ( not ( = ?auto_21701 ?auto_21703 ) ) ( not ( = ?auto_21715 ?auto_21704 ) ) ( HOIST-AT ?auto_21717 ?auto_21715 ) ( not ( = ?auto_21710 ?auto_21717 ) ) ( SURFACE-AT ?auto_21703 ?auto_21715 ) ( ON ?auto_21703 ?auto_21713 ) ( CLEAR ?auto_21703 ) ( not ( = ?auto_21702 ?auto_21713 ) ) ( not ( = ?auto_21703 ?auto_21713 ) ) ( not ( = ?auto_21701 ?auto_21713 ) ) ( IS-CRATE ?auto_21702 ) ( not ( = ?auto_21707 ?auto_21704 ) ) ( not ( = ?auto_21715 ?auto_21707 ) ) ( HOIST-AT ?auto_21709 ?auto_21707 ) ( not ( = ?auto_21710 ?auto_21709 ) ) ( not ( = ?auto_21717 ?auto_21709 ) ) ( AVAILABLE ?auto_21709 ) ( SURFACE-AT ?auto_21702 ?auto_21707 ) ( ON ?auto_21702 ?auto_21706 ) ( CLEAR ?auto_21702 ) ( not ( = ?auto_21702 ?auto_21706 ) ) ( not ( = ?auto_21703 ?auto_21706 ) ) ( not ( = ?auto_21701 ?auto_21706 ) ) ( not ( = ?auto_21713 ?auto_21706 ) ) ( IS-CRATE ?auto_21701 ) ( not ( = ?auto_21700 ?auto_21701 ) ) ( not ( = ?auto_21702 ?auto_21700 ) ) ( not ( = ?auto_21703 ?auto_21700 ) ) ( not ( = ?auto_21713 ?auto_21700 ) ) ( not ( = ?auto_21706 ?auto_21700 ) ) ( AVAILABLE ?auto_21717 ) ( SURFACE-AT ?auto_21701 ?auto_21715 ) ( ON ?auto_21701 ?auto_21708 ) ( CLEAR ?auto_21701 ) ( not ( = ?auto_21702 ?auto_21708 ) ) ( not ( = ?auto_21703 ?auto_21708 ) ) ( not ( = ?auto_21701 ?auto_21708 ) ) ( not ( = ?auto_21713 ?auto_21708 ) ) ( not ( = ?auto_21706 ?auto_21708 ) ) ( not ( = ?auto_21700 ?auto_21708 ) ) ( SURFACE-AT ?auto_21705 ?auto_21704 ) ( CLEAR ?auto_21705 ) ( IS-CRATE ?auto_21700 ) ( not ( = ?auto_21705 ?auto_21700 ) ) ( not ( = ?auto_21702 ?auto_21705 ) ) ( not ( = ?auto_21703 ?auto_21705 ) ) ( not ( = ?auto_21701 ?auto_21705 ) ) ( not ( = ?auto_21713 ?auto_21705 ) ) ( not ( = ?auto_21706 ?auto_21705 ) ) ( not ( = ?auto_21708 ?auto_21705 ) ) ( AVAILABLE ?auto_21710 ) ( not ( = ?auto_21712 ?auto_21704 ) ) ( not ( = ?auto_21715 ?auto_21712 ) ) ( not ( = ?auto_21707 ?auto_21712 ) ) ( HOIST-AT ?auto_21711 ?auto_21712 ) ( not ( = ?auto_21710 ?auto_21711 ) ) ( not ( = ?auto_21717 ?auto_21711 ) ) ( not ( = ?auto_21709 ?auto_21711 ) ) ( AVAILABLE ?auto_21711 ) ( SURFACE-AT ?auto_21700 ?auto_21712 ) ( ON ?auto_21700 ?auto_21716 ) ( CLEAR ?auto_21700 ) ( not ( = ?auto_21702 ?auto_21716 ) ) ( not ( = ?auto_21703 ?auto_21716 ) ) ( not ( = ?auto_21701 ?auto_21716 ) ) ( not ( = ?auto_21713 ?auto_21716 ) ) ( not ( = ?auto_21706 ?auto_21716 ) ) ( not ( = ?auto_21700 ?auto_21716 ) ) ( not ( = ?auto_21708 ?auto_21716 ) ) ( not ( = ?auto_21705 ?auto_21716 ) ) ( TRUCK-AT ?auto_21714 ?auto_21704 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21701 ?auto_21702 ?auto_21703 )
      ( MAKE-3CRATE-VERIFY ?auto_21700 ?auto_21701 ?auto_21702 ?auto_21703 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21718 - SURFACE
      ?auto_21719 - SURFACE
      ?auto_21720 - SURFACE
      ?auto_21721 - SURFACE
      ?auto_21722 - SURFACE
    )
    :vars
    (
      ?auto_21728 - HOIST
      ?auto_21723 - PLACE
      ?auto_21733 - PLACE
      ?auto_21735 - HOIST
      ?auto_21731 - SURFACE
      ?auto_21725 - PLACE
      ?auto_21727 - HOIST
      ?auto_21724 - SURFACE
      ?auto_21726 - SURFACE
      ?auto_21730 - PLACE
      ?auto_21729 - HOIST
      ?auto_21734 - SURFACE
      ?auto_21732 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21728 ?auto_21723 ) ( IS-CRATE ?auto_21722 ) ( not ( = ?auto_21721 ?auto_21722 ) ) ( not ( = ?auto_21720 ?auto_21721 ) ) ( not ( = ?auto_21720 ?auto_21722 ) ) ( not ( = ?auto_21733 ?auto_21723 ) ) ( HOIST-AT ?auto_21735 ?auto_21733 ) ( not ( = ?auto_21728 ?auto_21735 ) ) ( SURFACE-AT ?auto_21722 ?auto_21733 ) ( ON ?auto_21722 ?auto_21731 ) ( CLEAR ?auto_21722 ) ( not ( = ?auto_21721 ?auto_21731 ) ) ( not ( = ?auto_21722 ?auto_21731 ) ) ( not ( = ?auto_21720 ?auto_21731 ) ) ( IS-CRATE ?auto_21721 ) ( not ( = ?auto_21725 ?auto_21723 ) ) ( not ( = ?auto_21733 ?auto_21725 ) ) ( HOIST-AT ?auto_21727 ?auto_21725 ) ( not ( = ?auto_21728 ?auto_21727 ) ) ( not ( = ?auto_21735 ?auto_21727 ) ) ( AVAILABLE ?auto_21727 ) ( SURFACE-AT ?auto_21721 ?auto_21725 ) ( ON ?auto_21721 ?auto_21724 ) ( CLEAR ?auto_21721 ) ( not ( = ?auto_21721 ?auto_21724 ) ) ( not ( = ?auto_21722 ?auto_21724 ) ) ( not ( = ?auto_21720 ?auto_21724 ) ) ( not ( = ?auto_21731 ?auto_21724 ) ) ( IS-CRATE ?auto_21720 ) ( not ( = ?auto_21719 ?auto_21720 ) ) ( not ( = ?auto_21721 ?auto_21719 ) ) ( not ( = ?auto_21722 ?auto_21719 ) ) ( not ( = ?auto_21731 ?auto_21719 ) ) ( not ( = ?auto_21724 ?auto_21719 ) ) ( AVAILABLE ?auto_21735 ) ( SURFACE-AT ?auto_21720 ?auto_21733 ) ( ON ?auto_21720 ?auto_21726 ) ( CLEAR ?auto_21720 ) ( not ( = ?auto_21721 ?auto_21726 ) ) ( not ( = ?auto_21722 ?auto_21726 ) ) ( not ( = ?auto_21720 ?auto_21726 ) ) ( not ( = ?auto_21731 ?auto_21726 ) ) ( not ( = ?auto_21724 ?auto_21726 ) ) ( not ( = ?auto_21719 ?auto_21726 ) ) ( SURFACE-AT ?auto_21718 ?auto_21723 ) ( CLEAR ?auto_21718 ) ( IS-CRATE ?auto_21719 ) ( not ( = ?auto_21718 ?auto_21719 ) ) ( not ( = ?auto_21721 ?auto_21718 ) ) ( not ( = ?auto_21722 ?auto_21718 ) ) ( not ( = ?auto_21720 ?auto_21718 ) ) ( not ( = ?auto_21731 ?auto_21718 ) ) ( not ( = ?auto_21724 ?auto_21718 ) ) ( not ( = ?auto_21726 ?auto_21718 ) ) ( AVAILABLE ?auto_21728 ) ( not ( = ?auto_21730 ?auto_21723 ) ) ( not ( = ?auto_21733 ?auto_21730 ) ) ( not ( = ?auto_21725 ?auto_21730 ) ) ( HOIST-AT ?auto_21729 ?auto_21730 ) ( not ( = ?auto_21728 ?auto_21729 ) ) ( not ( = ?auto_21735 ?auto_21729 ) ) ( not ( = ?auto_21727 ?auto_21729 ) ) ( AVAILABLE ?auto_21729 ) ( SURFACE-AT ?auto_21719 ?auto_21730 ) ( ON ?auto_21719 ?auto_21734 ) ( CLEAR ?auto_21719 ) ( not ( = ?auto_21721 ?auto_21734 ) ) ( not ( = ?auto_21722 ?auto_21734 ) ) ( not ( = ?auto_21720 ?auto_21734 ) ) ( not ( = ?auto_21731 ?auto_21734 ) ) ( not ( = ?auto_21724 ?auto_21734 ) ) ( not ( = ?auto_21719 ?auto_21734 ) ) ( not ( = ?auto_21726 ?auto_21734 ) ) ( not ( = ?auto_21718 ?auto_21734 ) ) ( TRUCK-AT ?auto_21732 ?auto_21723 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21720 ?auto_21721 ?auto_21722 )
      ( MAKE-4CRATE-VERIFY ?auto_21718 ?auto_21719 ?auto_21720 ?auto_21721 ?auto_21722 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21756 - SURFACE
      ?auto_21757 - SURFACE
    )
    :vars
    (
      ?auto_21758 - HOIST
      ?auto_21759 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21758 ?auto_21759 ) ( SURFACE-AT ?auto_21756 ?auto_21759 ) ( CLEAR ?auto_21756 ) ( LIFTING ?auto_21758 ?auto_21757 ) ( IS-CRATE ?auto_21757 ) ( not ( = ?auto_21756 ?auto_21757 ) ) )
    :subtasks
    ( ( !DROP ?auto_21758 ?auto_21757 ?auto_21756 ?auto_21759 )
      ( MAKE-1CRATE-VERIFY ?auto_21756 ?auto_21757 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21760 - SURFACE
      ?auto_21761 - SURFACE
      ?auto_21762 - SURFACE
    )
    :vars
    (
      ?auto_21764 - HOIST
      ?auto_21763 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21764 ?auto_21763 ) ( SURFACE-AT ?auto_21761 ?auto_21763 ) ( CLEAR ?auto_21761 ) ( LIFTING ?auto_21764 ?auto_21762 ) ( IS-CRATE ?auto_21762 ) ( not ( = ?auto_21761 ?auto_21762 ) ) ( ON ?auto_21761 ?auto_21760 ) ( not ( = ?auto_21760 ?auto_21761 ) ) ( not ( = ?auto_21760 ?auto_21762 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21761 ?auto_21762 )
      ( MAKE-2CRATE-VERIFY ?auto_21760 ?auto_21761 ?auto_21762 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21765 - SURFACE
      ?auto_21766 - SURFACE
      ?auto_21767 - SURFACE
      ?auto_21768 - SURFACE
    )
    :vars
    (
      ?auto_21770 - HOIST
      ?auto_21769 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21770 ?auto_21769 ) ( SURFACE-AT ?auto_21767 ?auto_21769 ) ( CLEAR ?auto_21767 ) ( LIFTING ?auto_21770 ?auto_21768 ) ( IS-CRATE ?auto_21768 ) ( not ( = ?auto_21767 ?auto_21768 ) ) ( ON ?auto_21766 ?auto_21765 ) ( ON ?auto_21767 ?auto_21766 ) ( not ( = ?auto_21765 ?auto_21766 ) ) ( not ( = ?auto_21765 ?auto_21767 ) ) ( not ( = ?auto_21765 ?auto_21768 ) ) ( not ( = ?auto_21766 ?auto_21767 ) ) ( not ( = ?auto_21766 ?auto_21768 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21767 ?auto_21768 )
      ( MAKE-3CRATE-VERIFY ?auto_21765 ?auto_21766 ?auto_21767 ?auto_21768 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21771 - SURFACE
      ?auto_21772 - SURFACE
      ?auto_21773 - SURFACE
      ?auto_21774 - SURFACE
      ?auto_21775 - SURFACE
    )
    :vars
    (
      ?auto_21777 - HOIST
      ?auto_21776 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21777 ?auto_21776 ) ( SURFACE-AT ?auto_21774 ?auto_21776 ) ( CLEAR ?auto_21774 ) ( LIFTING ?auto_21777 ?auto_21775 ) ( IS-CRATE ?auto_21775 ) ( not ( = ?auto_21774 ?auto_21775 ) ) ( ON ?auto_21772 ?auto_21771 ) ( ON ?auto_21773 ?auto_21772 ) ( ON ?auto_21774 ?auto_21773 ) ( not ( = ?auto_21771 ?auto_21772 ) ) ( not ( = ?auto_21771 ?auto_21773 ) ) ( not ( = ?auto_21771 ?auto_21774 ) ) ( not ( = ?auto_21771 ?auto_21775 ) ) ( not ( = ?auto_21772 ?auto_21773 ) ) ( not ( = ?auto_21772 ?auto_21774 ) ) ( not ( = ?auto_21772 ?auto_21775 ) ) ( not ( = ?auto_21773 ?auto_21774 ) ) ( not ( = ?auto_21773 ?auto_21775 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21774 ?auto_21775 )
      ( MAKE-4CRATE-VERIFY ?auto_21771 ?auto_21772 ?auto_21773 ?auto_21774 ?auto_21775 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_21778 - SURFACE
      ?auto_21779 - SURFACE
      ?auto_21780 - SURFACE
      ?auto_21781 - SURFACE
      ?auto_21782 - SURFACE
      ?auto_21783 - SURFACE
    )
    :vars
    (
      ?auto_21785 - HOIST
      ?auto_21784 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21785 ?auto_21784 ) ( SURFACE-AT ?auto_21782 ?auto_21784 ) ( CLEAR ?auto_21782 ) ( LIFTING ?auto_21785 ?auto_21783 ) ( IS-CRATE ?auto_21783 ) ( not ( = ?auto_21782 ?auto_21783 ) ) ( ON ?auto_21779 ?auto_21778 ) ( ON ?auto_21780 ?auto_21779 ) ( ON ?auto_21781 ?auto_21780 ) ( ON ?auto_21782 ?auto_21781 ) ( not ( = ?auto_21778 ?auto_21779 ) ) ( not ( = ?auto_21778 ?auto_21780 ) ) ( not ( = ?auto_21778 ?auto_21781 ) ) ( not ( = ?auto_21778 ?auto_21782 ) ) ( not ( = ?auto_21778 ?auto_21783 ) ) ( not ( = ?auto_21779 ?auto_21780 ) ) ( not ( = ?auto_21779 ?auto_21781 ) ) ( not ( = ?auto_21779 ?auto_21782 ) ) ( not ( = ?auto_21779 ?auto_21783 ) ) ( not ( = ?auto_21780 ?auto_21781 ) ) ( not ( = ?auto_21780 ?auto_21782 ) ) ( not ( = ?auto_21780 ?auto_21783 ) ) ( not ( = ?auto_21781 ?auto_21782 ) ) ( not ( = ?auto_21781 ?auto_21783 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21782 ?auto_21783 )
      ( MAKE-5CRATE-VERIFY ?auto_21778 ?auto_21779 ?auto_21780 ?auto_21781 ?auto_21782 ?auto_21783 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21786 - SURFACE
      ?auto_21787 - SURFACE
    )
    :vars
    (
      ?auto_21789 - HOIST
      ?auto_21788 - PLACE
      ?auto_21790 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21789 ?auto_21788 ) ( SURFACE-AT ?auto_21786 ?auto_21788 ) ( CLEAR ?auto_21786 ) ( IS-CRATE ?auto_21787 ) ( not ( = ?auto_21786 ?auto_21787 ) ) ( TRUCK-AT ?auto_21790 ?auto_21788 ) ( AVAILABLE ?auto_21789 ) ( IN ?auto_21787 ?auto_21790 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21789 ?auto_21787 ?auto_21790 ?auto_21788 )
      ( MAKE-1CRATE ?auto_21786 ?auto_21787 )
      ( MAKE-1CRATE-VERIFY ?auto_21786 ?auto_21787 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21791 - SURFACE
      ?auto_21792 - SURFACE
      ?auto_21793 - SURFACE
    )
    :vars
    (
      ?auto_21794 - HOIST
      ?auto_21795 - PLACE
      ?auto_21796 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21794 ?auto_21795 ) ( SURFACE-AT ?auto_21792 ?auto_21795 ) ( CLEAR ?auto_21792 ) ( IS-CRATE ?auto_21793 ) ( not ( = ?auto_21792 ?auto_21793 ) ) ( TRUCK-AT ?auto_21796 ?auto_21795 ) ( AVAILABLE ?auto_21794 ) ( IN ?auto_21793 ?auto_21796 ) ( ON ?auto_21792 ?auto_21791 ) ( not ( = ?auto_21791 ?auto_21792 ) ) ( not ( = ?auto_21791 ?auto_21793 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21792 ?auto_21793 )
      ( MAKE-2CRATE-VERIFY ?auto_21791 ?auto_21792 ?auto_21793 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21797 - SURFACE
      ?auto_21798 - SURFACE
      ?auto_21799 - SURFACE
      ?auto_21800 - SURFACE
    )
    :vars
    (
      ?auto_21801 - HOIST
      ?auto_21802 - PLACE
      ?auto_21803 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21801 ?auto_21802 ) ( SURFACE-AT ?auto_21799 ?auto_21802 ) ( CLEAR ?auto_21799 ) ( IS-CRATE ?auto_21800 ) ( not ( = ?auto_21799 ?auto_21800 ) ) ( TRUCK-AT ?auto_21803 ?auto_21802 ) ( AVAILABLE ?auto_21801 ) ( IN ?auto_21800 ?auto_21803 ) ( ON ?auto_21799 ?auto_21798 ) ( not ( = ?auto_21798 ?auto_21799 ) ) ( not ( = ?auto_21798 ?auto_21800 ) ) ( ON ?auto_21798 ?auto_21797 ) ( not ( = ?auto_21797 ?auto_21798 ) ) ( not ( = ?auto_21797 ?auto_21799 ) ) ( not ( = ?auto_21797 ?auto_21800 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21798 ?auto_21799 ?auto_21800 )
      ( MAKE-3CRATE-VERIFY ?auto_21797 ?auto_21798 ?auto_21799 ?auto_21800 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21804 - SURFACE
      ?auto_21805 - SURFACE
      ?auto_21806 - SURFACE
      ?auto_21807 - SURFACE
      ?auto_21808 - SURFACE
    )
    :vars
    (
      ?auto_21809 - HOIST
      ?auto_21810 - PLACE
      ?auto_21811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21809 ?auto_21810 ) ( SURFACE-AT ?auto_21807 ?auto_21810 ) ( CLEAR ?auto_21807 ) ( IS-CRATE ?auto_21808 ) ( not ( = ?auto_21807 ?auto_21808 ) ) ( TRUCK-AT ?auto_21811 ?auto_21810 ) ( AVAILABLE ?auto_21809 ) ( IN ?auto_21808 ?auto_21811 ) ( ON ?auto_21807 ?auto_21806 ) ( not ( = ?auto_21806 ?auto_21807 ) ) ( not ( = ?auto_21806 ?auto_21808 ) ) ( ON ?auto_21805 ?auto_21804 ) ( ON ?auto_21806 ?auto_21805 ) ( not ( = ?auto_21804 ?auto_21805 ) ) ( not ( = ?auto_21804 ?auto_21806 ) ) ( not ( = ?auto_21804 ?auto_21807 ) ) ( not ( = ?auto_21804 ?auto_21808 ) ) ( not ( = ?auto_21805 ?auto_21806 ) ) ( not ( = ?auto_21805 ?auto_21807 ) ) ( not ( = ?auto_21805 ?auto_21808 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21806 ?auto_21807 ?auto_21808 )
      ( MAKE-4CRATE-VERIFY ?auto_21804 ?auto_21805 ?auto_21806 ?auto_21807 ?auto_21808 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_21812 - SURFACE
      ?auto_21813 - SURFACE
      ?auto_21814 - SURFACE
      ?auto_21815 - SURFACE
      ?auto_21816 - SURFACE
      ?auto_21817 - SURFACE
    )
    :vars
    (
      ?auto_21818 - HOIST
      ?auto_21819 - PLACE
      ?auto_21820 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21818 ?auto_21819 ) ( SURFACE-AT ?auto_21816 ?auto_21819 ) ( CLEAR ?auto_21816 ) ( IS-CRATE ?auto_21817 ) ( not ( = ?auto_21816 ?auto_21817 ) ) ( TRUCK-AT ?auto_21820 ?auto_21819 ) ( AVAILABLE ?auto_21818 ) ( IN ?auto_21817 ?auto_21820 ) ( ON ?auto_21816 ?auto_21815 ) ( not ( = ?auto_21815 ?auto_21816 ) ) ( not ( = ?auto_21815 ?auto_21817 ) ) ( ON ?auto_21813 ?auto_21812 ) ( ON ?auto_21814 ?auto_21813 ) ( ON ?auto_21815 ?auto_21814 ) ( not ( = ?auto_21812 ?auto_21813 ) ) ( not ( = ?auto_21812 ?auto_21814 ) ) ( not ( = ?auto_21812 ?auto_21815 ) ) ( not ( = ?auto_21812 ?auto_21816 ) ) ( not ( = ?auto_21812 ?auto_21817 ) ) ( not ( = ?auto_21813 ?auto_21814 ) ) ( not ( = ?auto_21813 ?auto_21815 ) ) ( not ( = ?auto_21813 ?auto_21816 ) ) ( not ( = ?auto_21813 ?auto_21817 ) ) ( not ( = ?auto_21814 ?auto_21815 ) ) ( not ( = ?auto_21814 ?auto_21816 ) ) ( not ( = ?auto_21814 ?auto_21817 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21815 ?auto_21816 ?auto_21817 )
      ( MAKE-5CRATE-VERIFY ?auto_21812 ?auto_21813 ?auto_21814 ?auto_21815 ?auto_21816 ?auto_21817 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21821 - SURFACE
      ?auto_21822 - SURFACE
    )
    :vars
    (
      ?auto_21823 - HOIST
      ?auto_21824 - PLACE
      ?auto_21826 - TRUCK
      ?auto_21825 - SURFACE
      ?auto_21827 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21823 ?auto_21824 ) ( SURFACE-AT ?auto_21821 ?auto_21824 ) ( CLEAR ?auto_21821 ) ( IS-CRATE ?auto_21822 ) ( not ( = ?auto_21821 ?auto_21822 ) ) ( AVAILABLE ?auto_21823 ) ( IN ?auto_21822 ?auto_21826 ) ( ON ?auto_21821 ?auto_21825 ) ( not ( = ?auto_21825 ?auto_21821 ) ) ( not ( = ?auto_21825 ?auto_21822 ) ) ( TRUCK-AT ?auto_21826 ?auto_21827 ) ( not ( = ?auto_21827 ?auto_21824 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21826 ?auto_21827 ?auto_21824 )
      ( MAKE-2CRATE ?auto_21825 ?auto_21821 ?auto_21822 )
      ( MAKE-1CRATE-VERIFY ?auto_21821 ?auto_21822 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21828 - SURFACE
      ?auto_21829 - SURFACE
      ?auto_21830 - SURFACE
    )
    :vars
    (
      ?auto_21831 - HOIST
      ?auto_21834 - PLACE
      ?auto_21832 - TRUCK
      ?auto_21833 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21831 ?auto_21834 ) ( SURFACE-AT ?auto_21829 ?auto_21834 ) ( CLEAR ?auto_21829 ) ( IS-CRATE ?auto_21830 ) ( not ( = ?auto_21829 ?auto_21830 ) ) ( AVAILABLE ?auto_21831 ) ( IN ?auto_21830 ?auto_21832 ) ( ON ?auto_21829 ?auto_21828 ) ( not ( = ?auto_21828 ?auto_21829 ) ) ( not ( = ?auto_21828 ?auto_21830 ) ) ( TRUCK-AT ?auto_21832 ?auto_21833 ) ( not ( = ?auto_21833 ?auto_21834 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21829 ?auto_21830 )
      ( MAKE-2CRATE-VERIFY ?auto_21828 ?auto_21829 ?auto_21830 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21835 - SURFACE
      ?auto_21836 - SURFACE
      ?auto_21837 - SURFACE
      ?auto_21838 - SURFACE
    )
    :vars
    (
      ?auto_21842 - HOIST
      ?auto_21839 - PLACE
      ?auto_21840 - TRUCK
      ?auto_21841 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21842 ?auto_21839 ) ( SURFACE-AT ?auto_21837 ?auto_21839 ) ( CLEAR ?auto_21837 ) ( IS-CRATE ?auto_21838 ) ( not ( = ?auto_21837 ?auto_21838 ) ) ( AVAILABLE ?auto_21842 ) ( IN ?auto_21838 ?auto_21840 ) ( ON ?auto_21837 ?auto_21836 ) ( not ( = ?auto_21836 ?auto_21837 ) ) ( not ( = ?auto_21836 ?auto_21838 ) ) ( TRUCK-AT ?auto_21840 ?auto_21841 ) ( not ( = ?auto_21841 ?auto_21839 ) ) ( ON ?auto_21836 ?auto_21835 ) ( not ( = ?auto_21835 ?auto_21836 ) ) ( not ( = ?auto_21835 ?auto_21837 ) ) ( not ( = ?auto_21835 ?auto_21838 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21836 ?auto_21837 ?auto_21838 )
      ( MAKE-3CRATE-VERIFY ?auto_21835 ?auto_21836 ?auto_21837 ?auto_21838 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21843 - SURFACE
      ?auto_21844 - SURFACE
      ?auto_21845 - SURFACE
      ?auto_21846 - SURFACE
      ?auto_21847 - SURFACE
    )
    :vars
    (
      ?auto_21851 - HOIST
      ?auto_21848 - PLACE
      ?auto_21849 - TRUCK
      ?auto_21850 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21851 ?auto_21848 ) ( SURFACE-AT ?auto_21846 ?auto_21848 ) ( CLEAR ?auto_21846 ) ( IS-CRATE ?auto_21847 ) ( not ( = ?auto_21846 ?auto_21847 ) ) ( AVAILABLE ?auto_21851 ) ( IN ?auto_21847 ?auto_21849 ) ( ON ?auto_21846 ?auto_21845 ) ( not ( = ?auto_21845 ?auto_21846 ) ) ( not ( = ?auto_21845 ?auto_21847 ) ) ( TRUCK-AT ?auto_21849 ?auto_21850 ) ( not ( = ?auto_21850 ?auto_21848 ) ) ( ON ?auto_21844 ?auto_21843 ) ( ON ?auto_21845 ?auto_21844 ) ( not ( = ?auto_21843 ?auto_21844 ) ) ( not ( = ?auto_21843 ?auto_21845 ) ) ( not ( = ?auto_21843 ?auto_21846 ) ) ( not ( = ?auto_21843 ?auto_21847 ) ) ( not ( = ?auto_21844 ?auto_21845 ) ) ( not ( = ?auto_21844 ?auto_21846 ) ) ( not ( = ?auto_21844 ?auto_21847 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21845 ?auto_21846 ?auto_21847 )
      ( MAKE-4CRATE-VERIFY ?auto_21843 ?auto_21844 ?auto_21845 ?auto_21846 ?auto_21847 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_21852 - SURFACE
      ?auto_21853 - SURFACE
      ?auto_21854 - SURFACE
      ?auto_21855 - SURFACE
      ?auto_21856 - SURFACE
      ?auto_21857 - SURFACE
    )
    :vars
    (
      ?auto_21861 - HOIST
      ?auto_21858 - PLACE
      ?auto_21859 - TRUCK
      ?auto_21860 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21861 ?auto_21858 ) ( SURFACE-AT ?auto_21856 ?auto_21858 ) ( CLEAR ?auto_21856 ) ( IS-CRATE ?auto_21857 ) ( not ( = ?auto_21856 ?auto_21857 ) ) ( AVAILABLE ?auto_21861 ) ( IN ?auto_21857 ?auto_21859 ) ( ON ?auto_21856 ?auto_21855 ) ( not ( = ?auto_21855 ?auto_21856 ) ) ( not ( = ?auto_21855 ?auto_21857 ) ) ( TRUCK-AT ?auto_21859 ?auto_21860 ) ( not ( = ?auto_21860 ?auto_21858 ) ) ( ON ?auto_21853 ?auto_21852 ) ( ON ?auto_21854 ?auto_21853 ) ( ON ?auto_21855 ?auto_21854 ) ( not ( = ?auto_21852 ?auto_21853 ) ) ( not ( = ?auto_21852 ?auto_21854 ) ) ( not ( = ?auto_21852 ?auto_21855 ) ) ( not ( = ?auto_21852 ?auto_21856 ) ) ( not ( = ?auto_21852 ?auto_21857 ) ) ( not ( = ?auto_21853 ?auto_21854 ) ) ( not ( = ?auto_21853 ?auto_21855 ) ) ( not ( = ?auto_21853 ?auto_21856 ) ) ( not ( = ?auto_21853 ?auto_21857 ) ) ( not ( = ?auto_21854 ?auto_21855 ) ) ( not ( = ?auto_21854 ?auto_21856 ) ) ( not ( = ?auto_21854 ?auto_21857 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21855 ?auto_21856 ?auto_21857 )
      ( MAKE-5CRATE-VERIFY ?auto_21852 ?auto_21853 ?auto_21854 ?auto_21855 ?auto_21856 ?auto_21857 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21862 - SURFACE
      ?auto_21863 - SURFACE
    )
    :vars
    (
      ?auto_21868 - HOIST
      ?auto_21864 - PLACE
      ?auto_21867 - SURFACE
      ?auto_21865 - TRUCK
      ?auto_21866 - PLACE
      ?auto_21869 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21868 ?auto_21864 ) ( SURFACE-AT ?auto_21862 ?auto_21864 ) ( CLEAR ?auto_21862 ) ( IS-CRATE ?auto_21863 ) ( not ( = ?auto_21862 ?auto_21863 ) ) ( AVAILABLE ?auto_21868 ) ( ON ?auto_21862 ?auto_21867 ) ( not ( = ?auto_21867 ?auto_21862 ) ) ( not ( = ?auto_21867 ?auto_21863 ) ) ( TRUCK-AT ?auto_21865 ?auto_21866 ) ( not ( = ?auto_21866 ?auto_21864 ) ) ( HOIST-AT ?auto_21869 ?auto_21866 ) ( LIFTING ?auto_21869 ?auto_21863 ) ( not ( = ?auto_21868 ?auto_21869 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21869 ?auto_21863 ?auto_21865 ?auto_21866 )
      ( MAKE-2CRATE ?auto_21867 ?auto_21862 ?auto_21863 )
      ( MAKE-1CRATE-VERIFY ?auto_21862 ?auto_21863 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21870 - SURFACE
      ?auto_21871 - SURFACE
      ?auto_21872 - SURFACE
    )
    :vars
    (
      ?auto_21874 - HOIST
      ?auto_21873 - PLACE
      ?auto_21877 - TRUCK
      ?auto_21876 - PLACE
      ?auto_21875 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21874 ?auto_21873 ) ( SURFACE-AT ?auto_21871 ?auto_21873 ) ( CLEAR ?auto_21871 ) ( IS-CRATE ?auto_21872 ) ( not ( = ?auto_21871 ?auto_21872 ) ) ( AVAILABLE ?auto_21874 ) ( ON ?auto_21871 ?auto_21870 ) ( not ( = ?auto_21870 ?auto_21871 ) ) ( not ( = ?auto_21870 ?auto_21872 ) ) ( TRUCK-AT ?auto_21877 ?auto_21876 ) ( not ( = ?auto_21876 ?auto_21873 ) ) ( HOIST-AT ?auto_21875 ?auto_21876 ) ( LIFTING ?auto_21875 ?auto_21872 ) ( not ( = ?auto_21874 ?auto_21875 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21871 ?auto_21872 )
      ( MAKE-2CRATE-VERIFY ?auto_21870 ?auto_21871 ?auto_21872 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21878 - SURFACE
      ?auto_21879 - SURFACE
      ?auto_21880 - SURFACE
      ?auto_21881 - SURFACE
    )
    :vars
    (
      ?auto_21882 - HOIST
      ?auto_21885 - PLACE
      ?auto_21886 - TRUCK
      ?auto_21883 - PLACE
      ?auto_21884 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21882 ?auto_21885 ) ( SURFACE-AT ?auto_21880 ?auto_21885 ) ( CLEAR ?auto_21880 ) ( IS-CRATE ?auto_21881 ) ( not ( = ?auto_21880 ?auto_21881 ) ) ( AVAILABLE ?auto_21882 ) ( ON ?auto_21880 ?auto_21879 ) ( not ( = ?auto_21879 ?auto_21880 ) ) ( not ( = ?auto_21879 ?auto_21881 ) ) ( TRUCK-AT ?auto_21886 ?auto_21883 ) ( not ( = ?auto_21883 ?auto_21885 ) ) ( HOIST-AT ?auto_21884 ?auto_21883 ) ( LIFTING ?auto_21884 ?auto_21881 ) ( not ( = ?auto_21882 ?auto_21884 ) ) ( ON ?auto_21879 ?auto_21878 ) ( not ( = ?auto_21878 ?auto_21879 ) ) ( not ( = ?auto_21878 ?auto_21880 ) ) ( not ( = ?auto_21878 ?auto_21881 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21879 ?auto_21880 ?auto_21881 )
      ( MAKE-3CRATE-VERIFY ?auto_21878 ?auto_21879 ?auto_21880 ?auto_21881 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21887 - SURFACE
      ?auto_21888 - SURFACE
      ?auto_21889 - SURFACE
      ?auto_21890 - SURFACE
      ?auto_21891 - SURFACE
    )
    :vars
    (
      ?auto_21892 - HOIST
      ?auto_21895 - PLACE
      ?auto_21896 - TRUCK
      ?auto_21893 - PLACE
      ?auto_21894 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21892 ?auto_21895 ) ( SURFACE-AT ?auto_21890 ?auto_21895 ) ( CLEAR ?auto_21890 ) ( IS-CRATE ?auto_21891 ) ( not ( = ?auto_21890 ?auto_21891 ) ) ( AVAILABLE ?auto_21892 ) ( ON ?auto_21890 ?auto_21889 ) ( not ( = ?auto_21889 ?auto_21890 ) ) ( not ( = ?auto_21889 ?auto_21891 ) ) ( TRUCK-AT ?auto_21896 ?auto_21893 ) ( not ( = ?auto_21893 ?auto_21895 ) ) ( HOIST-AT ?auto_21894 ?auto_21893 ) ( LIFTING ?auto_21894 ?auto_21891 ) ( not ( = ?auto_21892 ?auto_21894 ) ) ( ON ?auto_21888 ?auto_21887 ) ( ON ?auto_21889 ?auto_21888 ) ( not ( = ?auto_21887 ?auto_21888 ) ) ( not ( = ?auto_21887 ?auto_21889 ) ) ( not ( = ?auto_21887 ?auto_21890 ) ) ( not ( = ?auto_21887 ?auto_21891 ) ) ( not ( = ?auto_21888 ?auto_21889 ) ) ( not ( = ?auto_21888 ?auto_21890 ) ) ( not ( = ?auto_21888 ?auto_21891 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21889 ?auto_21890 ?auto_21891 )
      ( MAKE-4CRATE-VERIFY ?auto_21887 ?auto_21888 ?auto_21889 ?auto_21890 ?auto_21891 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_21897 - SURFACE
      ?auto_21898 - SURFACE
      ?auto_21899 - SURFACE
      ?auto_21900 - SURFACE
      ?auto_21901 - SURFACE
      ?auto_21902 - SURFACE
    )
    :vars
    (
      ?auto_21903 - HOIST
      ?auto_21906 - PLACE
      ?auto_21907 - TRUCK
      ?auto_21904 - PLACE
      ?auto_21905 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21903 ?auto_21906 ) ( SURFACE-AT ?auto_21901 ?auto_21906 ) ( CLEAR ?auto_21901 ) ( IS-CRATE ?auto_21902 ) ( not ( = ?auto_21901 ?auto_21902 ) ) ( AVAILABLE ?auto_21903 ) ( ON ?auto_21901 ?auto_21900 ) ( not ( = ?auto_21900 ?auto_21901 ) ) ( not ( = ?auto_21900 ?auto_21902 ) ) ( TRUCK-AT ?auto_21907 ?auto_21904 ) ( not ( = ?auto_21904 ?auto_21906 ) ) ( HOIST-AT ?auto_21905 ?auto_21904 ) ( LIFTING ?auto_21905 ?auto_21902 ) ( not ( = ?auto_21903 ?auto_21905 ) ) ( ON ?auto_21898 ?auto_21897 ) ( ON ?auto_21899 ?auto_21898 ) ( ON ?auto_21900 ?auto_21899 ) ( not ( = ?auto_21897 ?auto_21898 ) ) ( not ( = ?auto_21897 ?auto_21899 ) ) ( not ( = ?auto_21897 ?auto_21900 ) ) ( not ( = ?auto_21897 ?auto_21901 ) ) ( not ( = ?auto_21897 ?auto_21902 ) ) ( not ( = ?auto_21898 ?auto_21899 ) ) ( not ( = ?auto_21898 ?auto_21900 ) ) ( not ( = ?auto_21898 ?auto_21901 ) ) ( not ( = ?auto_21898 ?auto_21902 ) ) ( not ( = ?auto_21899 ?auto_21900 ) ) ( not ( = ?auto_21899 ?auto_21901 ) ) ( not ( = ?auto_21899 ?auto_21902 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21900 ?auto_21901 ?auto_21902 )
      ( MAKE-5CRATE-VERIFY ?auto_21897 ?auto_21898 ?auto_21899 ?auto_21900 ?auto_21901 ?auto_21902 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21908 - SURFACE
      ?auto_21909 - SURFACE
    )
    :vars
    (
      ?auto_21910 - HOIST
      ?auto_21913 - PLACE
      ?auto_21914 - SURFACE
      ?auto_21915 - TRUCK
      ?auto_21911 - PLACE
      ?auto_21912 - HOIST
      ?auto_21916 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21910 ?auto_21913 ) ( SURFACE-AT ?auto_21908 ?auto_21913 ) ( CLEAR ?auto_21908 ) ( IS-CRATE ?auto_21909 ) ( not ( = ?auto_21908 ?auto_21909 ) ) ( AVAILABLE ?auto_21910 ) ( ON ?auto_21908 ?auto_21914 ) ( not ( = ?auto_21914 ?auto_21908 ) ) ( not ( = ?auto_21914 ?auto_21909 ) ) ( TRUCK-AT ?auto_21915 ?auto_21911 ) ( not ( = ?auto_21911 ?auto_21913 ) ) ( HOIST-AT ?auto_21912 ?auto_21911 ) ( not ( = ?auto_21910 ?auto_21912 ) ) ( AVAILABLE ?auto_21912 ) ( SURFACE-AT ?auto_21909 ?auto_21911 ) ( ON ?auto_21909 ?auto_21916 ) ( CLEAR ?auto_21909 ) ( not ( = ?auto_21908 ?auto_21916 ) ) ( not ( = ?auto_21909 ?auto_21916 ) ) ( not ( = ?auto_21914 ?auto_21916 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21912 ?auto_21909 ?auto_21916 ?auto_21911 )
      ( MAKE-2CRATE ?auto_21914 ?auto_21908 ?auto_21909 )
      ( MAKE-1CRATE-VERIFY ?auto_21908 ?auto_21909 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21917 - SURFACE
      ?auto_21918 - SURFACE
      ?auto_21919 - SURFACE
    )
    :vars
    (
      ?auto_21925 - HOIST
      ?auto_21924 - PLACE
      ?auto_21923 - TRUCK
      ?auto_21921 - PLACE
      ?auto_21922 - HOIST
      ?auto_21920 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21925 ?auto_21924 ) ( SURFACE-AT ?auto_21918 ?auto_21924 ) ( CLEAR ?auto_21918 ) ( IS-CRATE ?auto_21919 ) ( not ( = ?auto_21918 ?auto_21919 ) ) ( AVAILABLE ?auto_21925 ) ( ON ?auto_21918 ?auto_21917 ) ( not ( = ?auto_21917 ?auto_21918 ) ) ( not ( = ?auto_21917 ?auto_21919 ) ) ( TRUCK-AT ?auto_21923 ?auto_21921 ) ( not ( = ?auto_21921 ?auto_21924 ) ) ( HOIST-AT ?auto_21922 ?auto_21921 ) ( not ( = ?auto_21925 ?auto_21922 ) ) ( AVAILABLE ?auto_21922 ) ( SURFACE-AT ?auto_21919 ?auto_21921 ) ( ON ?auto_21919 ?auto_21920 ) ( CLEAR ?auto_21919 ) ( not ( = ?auto_21918 ?auto_21920 ) ) ( not ( = ?auto_21919 ?auto_21920 ) ) ( not ( = ?auto_21917 ?auto_21920 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21918 ?auto_21919 )
      ( MAKE-2CRATE-VERIFY ?auto_21917 ?auto_21918 ?auto_21919 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21926 - SURFACE
      ?auto_21927 - SURFACE
      ?auto_21928 - SURFACE
      ?auto_21929 - SURFACE
    )
    :vars
    (
      ?auto_21931 - HOIST
      ?auto_21932 - PLACE
      ?auto_21933 - TRUCK
      ?auto_21935 - PLACE
      ?auto_21930 - HOIST
      ?auto_21934 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21931 ?auto_21932 ) ( SURFACE-AT ?auto_21928 ?auto_21932 ) ( CLEAR ?auto_21928 ) ( IS-CRATE ?auto_21929 ) ( not ( = ?auto_21928 ?auto_21929 ) ) ( AVAILABLE ?auto_21931 ) ( ON ?auto_21928 ?auto_21927 ) ( not ( = ?auto_21927 ?auto_21928 ) ) ( not ( = ?auto_21927 ?auto_21929 ) ) ( TRUCK-AT ?auto_21933 ?auto_21935 ) ( not ( = ?auto_21935 ?auto_21932 ) ) ( HOIST-AT ?auto_21930 ?auto_21935 ) ( not ( = ?auto_21931 ?auto_21930 ) ) ( AVAILABLE ?auto_21930 ) ( SURFACE-AT ?auto_21929 ?auto_21935 ) ( ON ?auto_21929 ?auto_21934 ) ( CLEAR ?auto_21929 ) ( not ( = ?auto_21928 ?auto_21934 ) ) ( not ( = ?auto_21929 ?auto_21934 ) ) ( not ( = ?auto_21927 ?auto_21934 ) ) ( ON ?auto_21927 ?auto_21926 ) ( not ( = ?auto_21926 ?auto_21927 ) ) ( not ( = ?auto_21926 ?auto_21928 ) ) ( not ( = ?auto_21926 ?auto_21929 ) ) ( not ( = ?auto_21926 ?auto_21934 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21927 ?auto_21928 ?auto_21929 )
      ( MAKE-3CRATE-VERIFY ?auto_21926 ?auto_21927 ?auto_21928 ?auto_21929 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21936 - SURFACE
      ?auto_21937 - SURFACE
      ?auto_21938 - SURFACE
      ?auto_21939 - SURFACE
      ?auto_21940 - SURFACE
    )
    :vars
    (
      ?auto_21942 - HOIST
      ?auto_21943 - PLACE
      ?auto_21944 - TRUCK
      ?auto_21946 - PLACE
      ?auto_21941 - HOIST
      ?auto_21945 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21942 ?auto_21943 ) ( SURFACE-AT ?auto_21939 ?auto_21943 ) ( CLEAR ?auto_21939 ) ( IS-CRATE ?auto_21940 ) ( not ( = ?auto_21939 ?auto_21940 ) ) ( AVAILABLE ?auto_21942 ) ( ON ?auto_21939 ?auto_21938 ) ( not ( = ?auto_21938 ?auto_21939 ) ) ( not ( = ?auto_21938 ?auto_21940 ) ) ( TRUCK-AT ?auto_21944 ?auto_21946 ) ( not ( = ?auto_21946 ?auto_21943 ) ) ( HOIST-AT ?auto_21941 ?auto_21946 ) ( not ( = ?auto_21942 ?auto_21941 ) ) ( AVAILABLE ?auto_21941 ) ( SURFACE-AT ?auto_21940 ?auto_21946 ) ( ON ?auto_21940 ?auto_21945 ) ( CLEAR ?auto_21940 ) ( not ( = ?auto_21939 ?auto_21945 ) ) ( not ( = ?auto_21940 ?auto_21945 ) ) ( not ( = ?auto_21938 ?auto_21945 ) ) ( ON ?auto_21937 ?auto_21936 ) ( ON ?auto_21938 ?auto_21937 ) ( not ( = ?auto_21936 ?auto_21937 ) ) ( not ( = ?auto_21936 ?auto_21938 ) ) ( not ( = ?auto_21936 ?auto_21939 ) ) ( not ( = ?auto_21936 ?auto_21940 ) ) ( not ( = ?auto_21936 ?auto_21945 ) ) ( not ( = ?auto_21937 ?auto_21938 ) ) ( not ( = ?auto_21937 ?auto_21939 ) ) ( not ( = ?auto_21937 ?auto_21940 ) ) ( not ( = ?auto_21937 ?auto_21945 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21938 ?auto_21939 ?auto_21940 )
      ( MAKE-4CRATE-VERIFY ?auto_21936 ?auto_21937 ?auto_21938 ?auto_21939 ?auto_21940 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_21947 - SURFACE
      ?auto_21948 - SURFACE
      ?auto_21949 - SURFACE
      ?auto_21950 - SURFACE
      ?auto_21951 - SURFACE
      ?auto_21952 - SURFACE
    )
    :vars
    (
      ?auto_21954 - HOIST
      ?auto_21955 - PLACE
      ?auto_21956 - TRUCK
      ?auto_21958 - PLACE
      ?auto_21953 - HOIST
      ?auto_21957 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21954 ?auto_21955 ) ( SURFACE-AT ?auto_21951 ?auto_21955 ) ( CLEAR ?auto_21951 ) ( IS-CRATE ?auto_21952 ) ( not ( = ?auto_21951 ?auto_21952 ) ) ( AVAILABLE ?auto_21954 ) ( ON ?auto_21951 ?auto_21950 ) ( not ( = ?auto_21950 ?auto_21951 ) ) ( not ( = ?auto_21950 ?auto_21952 ) ) ( TRUCK-AT ?auto_21956 ?auto_21958 ) ( not ( = ?auto_21958 ?auto_21955 ) ) ( HOIST-AT ?auto_21953 ?auto_21958 ) ( not ( = ?auto_21954 ?auto_21953 ) ) ( AVAILABLE ?auto_21953 ) ( SURFACE-AT ?auto_21952 ?auto_21958 ) ( ON ?auto_21952 ?auto_21957 ) ( CLEAR ?auto_21952 ) ( not ( = ?auto_21951 ?auto_21957 ) ) ( not ( = ?auto_21952 ?auto_21957 ) ) ( not ( = ?auto_21950 ?auto_21957 ) ) ( ON ?auto_21948 ?auto_21947 ) ( ON ?auto_21949 ?auto_21948 ) ( ON ?auto_21950 ?auto_21949 ) ( not ( = ?auto_21947 ?auto_21948 ) ) ( not ( = ?auto_21947 ?auto_21949 ) ) ( not ( = ?auto_21947 ?auto_21950 ) ) ( not ( = ?auto_21947 ?auto_21951 ) ) ( not ( = ?auto_21947 ?auto_21952 ) ) ( not ( = ?auto_21947 ?auto_21957 ) ) ( not ( = ?auto_21948 ?auto_21949 ) ) ( not ( = ?auto_21948 ?auto_21950 ) ) ( not ( = ?auto_21948 ?auto_21951 ) ) ( not ( = ?auto_21948 ?auto_21952 ) ) ( not ( = ?auto_21948 ?auto_21957 ) ) ( not ( = ?auto_21949 ?auto_21950 ) ) ( not ( = ?auto_21949 ?auto_21951 ) ) ( not ( = ?auto_21949 ?auto_21952 ) ) ( not ( = ?auto_21949 ?auto_21957 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21950 ?auto_21951 ?auto_21952 )
      ( MAKE-5CRATE-VERIFY ?auto_21947 ?auto_21948 ?auto_21949 ?auto_21950 ?auto_21951 ?auto_21952 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21959 - SURFACE
      ?auto_21960 - SURFACE
    )
    :vars
    (
      ?auto_21963 - HOIST
      ?auto_21964 - PLACE
      ?auto_21961 - SURFACE
      ?auto_21967 - PLACE
      ?auto_21962 - HOIST
      ?auto_21966 - SURFACE
      ?auto_21965 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21963 ?auto_21964 ) ( SURFACE-AT ?auto_21959 ?auto_21964 ) ( CLEAR ?auto_21959 ) ( IS-CRATE ?auto_21960 ) ( not ( = ?auto_21959 ?auto_21960 ) ) ( AVAILABLE ?auto_21963 ) ( ON ?auto_21959 ?auto_21961 ) ( not ( = ?auto_21961 ?auto_21959 ) ) ( not ( = ?auto_21961 ?auto_21960 ) ) ( not ( = ?auto_21967 ?auto_21964 ) ) ( HOIST-AT ?auto_21962 ?auto_21967 ) ( not ( = ?auto_21963 ?auto_21962 ) ) ( AVAILABLE ?auto_21962 ) ( SURFACE-AT ?auto_21960 ?auto_21967 ) ( ON ?auto_21960 ?auto_21966 ) ( CLEAR ?auto_21960 ) ( not ( = ?auto_21959 ?auto_21966 ) ) ( not ( = ?auto_21960 ?auto_21966 ) ) ( not ( = ?auto_21961 ?auto_21966 ) ) ( TRUCK-AT ?auto_21965 ?auto_21964 ) )
    :subtasks
    ( ( !DRIVE ?auto_21965 ?auto_21964 ?auto_21967 )
      ( MAKE-2CRATE ?auto_21961 ?auto_21959 ?auto_21960 )
      ( MAKE-1CRATE-VERIFY ?auto_21959 ?auto_21960 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21968 - SURFACE
      ?auto_21969 - SURFACE
      ?auto_21970 - SURFACE
    )
    :vars
    (
      ?auto_21973 - HOIST
      ?auto_21975 - PLACE
      ?auto_21972 - PLACE
      ?auto_21971 - HOIST
      ?auto_21976 - SURFACE
      ?auto_21974 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21973 ?auto_21975 ) ( SURFACE-AT ?auto_21969 ?auto_21975 ) ( CLEAR ?auto_21969 ) ( IS-CRATE ?auto_21970 ) ( not ( = ?auto_21969 ?auto_21970 ) ) ( AVAILABLE ?auto_21973 ) ( ON ?auto_21969 ?auto_21968 ) ( not ( = ?auto_21968 ?auto_21969 ) ) ( not ( = ?auto_21968 ?auto_21970 ) ) ( not ( = ?auto_21972 ?auto_21975 ) ) ( HOIST-AT ?auto_21971 ?auto_21972 ) ( not ( = ?auto_21973 ?auto_21971 ) ) ( AVAILABLE ?auto_21971 ) ( SURFACE-AT ?auto_21970 ?auto_21972 ) ( ON ?auto_21970 ?auto_21976 ) ( CLEAR ?auto_21970 ) ( not ( = ?auto_21969 ?auto_21976 ) ) ( not ( = ?auto_21970 ?auto_21976 ) ) ( not ( = ?auto_21968 ?auto_21976 ) ) ( TRUCK-AT ?auto_21974 ?auto_21975 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21969 ?auto_21970 )
      ( MAKE-2CRATE-VERIFY ?auto_21968 ?auto_21969 ?auto_21970 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21977 - SURFACE
      ?auto_21978 - SURFACE
      ?auto_21979 - SURFACE
      ?auto_21980 - SURFACE
    )
    :vars
    (
      ?auto_21985 - HOIST
      ?auto_21981 - PLACE
      ?auto_21986 - PLACE
      ?auto_21982 - HOIST
      ?auto_21983 - SURFACE
      ?auto_21984 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21985 ?auto_21981 ) ( SURFACE-AT ?auto_21979 ?auto_21981 ) ( CLEAR ?auto_21979 ) ( IS-CRATE ?auto_21980 ) ( not ( = ?auto_21979 ?auto_21980 ) ) ( AVAILABLE ?auto_21985 ) ( ON ?auto_21979 ?auto_21978 ) ( not ( = ?auto_21978 ?auto_21979 ) ) ( not ( = ?auto_21978 ?auto_21980 ) ) ( not ( = ?auto_21986 ?auto_21981 ) ) ( HOIST-AT ?auto_21982 ?auto_21986 ) ( not ( = ?auto_21985 ?auto_21982 ) ) ( AVAILABLE ?auto_21982 ) ( SURFACE-AT ?auto_21980 ?auto_21986 ) ( ON ?auto_21980 ?auto_21983 ) ( CLEAR ?auto_21980 ) ( not ( = ?auto_21979 ?auto_21983 ) ) ( not ( = ?auto_21980 ?auto_21983 ) ) ( not ( = ?auto_21978 ?auto_21983 ) ) ( TRUCK-AT ?auto_21984 ?auto_21981 ) ( ON ?auto_21978 ?auto_21977 ) ( not ( = ?auto_21977 ?auto_21978 ) ) ( not ( = ?auto_21977 ?auto_21979 ) ) ( not ( = ?auto_21977 ?auto_21980 ) ) ( not ( = ?auto_21977 ?auto_21983 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21978 ?auto_21979 ?auto_21980 )
      ( MAKE-3CRATE-VERIFY ?auto_21977 ?auto_21978 ?auto_21979 ?auto_21980 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21987 - SURFACE
      ?auto_21988 - SURFACE
      ?auto_21989 - SURFACE
      ?auto_21990 - SURFACE
      ?auto_21991 - SURFACE
    )
    :vars
    (
      ?auto_21996 - HOIST
      ?auto_21992 - PLACE
      ?auto_21997 - PLACE
      ?auto_21993 - HOIST
      ?auto_21994 - SURFACE
      ?auto_21995 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21996 ?auto_21992 ) ( SURFACE-AT ?auto_21990 ?auto_21992 ) ( CLEAR ?auto_21990 ) ( IS-CRATE ?auto_21991 ) ( not ( = ?auto_21990 ?auto_21991 ) ) ( AVAILABLE ?auto_21996 ) ( ON ?auto_21990 ?auto_21989 ) ( not ( = ?auto_21989 ?auto_21990 ) ) ( not ( = ?auto_21989 ?auto_21991 ) ) ( not ( = ?auto_21997 ?auto_21992 ) ) ( HOIST-AT ?auto_21993 ?auto_21997 ) ( not ( = ?auto_21996 ?auto_21993 ) ) ( AVAILABLE ?auto_21993 ) ( SURFACE-AT ?auto_21991 ?auto_21997 ) ( ON ?auto_21991 ?auto_21994 ) ( CLEAR ?auto_21991 ) ( not ( = ?auto_21990 ?auto_21994 ) ) ( not ( = ?auto_21991 ?auto_21994 ) ) ( not ( = ?auto_21989 ?auto_21994 ) ) ( TRUCK-AT ?auto_21995 ?auto_21992 ) ( ON ?auto_21988 ?auto_21987 ) ( ON ?auto_21989 ?auto_21988 ) ( not ( = ?auto_21987 ?auto_21988 ) ) ( not ( = ?auto_21987 ?auto_21989 ) ) ( not ( = ?auto_21987 ?auto_21990 ) ) ( not ( = ?auto_21987 ?auto_21991 ) ) ( not ( = ?auto_21987 ?auto_21994 ) ) ( not ( = ?auto_21988 ?auto_21989 ) ) ( not ( = ?auto_21988 ?auto_21990 ) ) ( not ( = ?auto_21988 ?auto_21991 ) ) ( not ( = ?auto_21988 ?auto_21994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21989 ?auto_21990 ?auto_21991 )
      ( MAKE-4CRATE-VERIFY ?auto_21987 ?auto_21988 ?auto_21989 ?auto_21990 ?auto_21991 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_21998 - SURFACE
      ?auto_21999 - SURFACE
      ?auto_22000 - SURFACE
      ?auto_22001 - SURFACE
      ?auto_22002 - SURFACE
      ?auto_22003 - SURFACE
    )
    :vars
    (
      ?auto_22008 - HOIST
      ?auto_22004 - PLACE
      ?auto_22009 - PLACE
      ?auto_22005 - HOIST
      ?auto_22006 - SURFACE
      ?auto_22007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22008 ?auto_22004 ) ( SURFACE-AT ?auto_22002 ?auto_22004 ) ( CLEAR ?auto_22002 ) ( IS-CRATE ?auto_22003 ) ( not ( = ?auto_22002 ?auto_22003 ) ) ( AVAILABLE ?auto_22008 ) ( ON ?auto_22002 ?auto_22001 ) ( not ( = ?auto_22001 ?auto_22002 ) ) ( not ( = ?auto_22001 ?auto_22003 ) ) ( not ( = ?auto_22009 ?auto_22004 ) ) ( HOIST-AT ?auto_22005 ?auto_22009 ) ( not ( = ?auto_22008 ?auto_22005 ) ) ( AVAILABLE ?auto_22005 ) ( SURFACE-AT ?auto_22003 ?auto_22009 ) ( ON ?auto_22003 ?auto_22006 ) ( CLEAR ?auto_22003 ) ( not ( = ?auto_22002 ?auto_22006 ) ) ( not ( = ?auto_22003 ?auto_22006 ) ) ( not ( = ?auto_22001 ?auto_22006 ) ) ( TRUCK-AT ?auto_22007 ?auto_22004 ) ( ON ?auto_21999 ?auto_21998 ) ( ON ?auto_22000 ?auto_21999 ) ( ON ?auto_22001 ?auto_22000 ) ( not ( = ?auto_21998 ?auto_21999 ) ) ( not ( = ?auto_21998 ?auto_22000 ) ) ( not ( = ?auto_21998 ?auto_22001 ) ) ( not ( = ?auto_21998 ?auto_22002 ) ) ( not ( = ?auto_21998 ?auto_22003 ) ) ( not ( = ?auto_21998 ?auto_22006 ) ) ( not ( = ?auto_21999 ?auto_22000 ) ) ( not ( = ?auto_21999 ?auto_22001 ) ) ( not ( = ?auto_21999 ?auto_22002 ) ) ( not ( = ?auto_21999 ?auto_22003 ) ) ( not ( = ?auto_21999 ?auto_22006 ) ) ( not ( = ?auto_22000 ?auto_22001 ) ) ( not ( = ?auto_22000 ?auto_22002 ) ) ( not ( = ?auto_22000 ?auto_22003 ) ) ( not ( = ?auto_22000 ?auto_22006 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22001 ?auto_22002 ?auto_22003 )
      ( MAKE-5CRATE-VERIFY ?auto_21998 ?auto_21999 ?auto_22000 ?auto_22001 ?auto_22002 ?auto_22003 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22010 - SURFACE
      ?auto_22011 - SURFACE
    )
    :vars
    (
      ?auto_22016 - HOIST
      ?auto_22012 - PLACE
      ?auto_22017 - SURFACE
      ?auto_22018 - PLACE
      ?auto_22013 - HOIST
      ?auto_22014 - SURFACE
      ?auto_22015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22016 ?auto_22012 ) ( IS-CRATE ?auto_22011 ) ( not ( = ?auto_22010 ?auto_22011 ) ) ( not ( = ?auto_22017 ?auto_22010 ) ) ( not ( = ?auto_22017 ?auto_22011 ) ) ( not ( = ?auto_22018 ?auto_22012 ) ) ( HOIST-AT ?auto_22013 ?auto_22018 ) ( not ( = ?auto_22016 ?auto_22013 ) ) ( AVAILABLE ?auto_22013 ) ( SURFACE-AT ?auto_22011 ?auto_22018 ) ( ON ?auto_22011 ?auto_22014 ) ( CLEAR ?auto_22011 ) ( not ( = ?auto_22010 ?auto_22014 ) ) ( not ( = ?auto_22011 ?auto_22014 ) ) ( not ( = ?auto_22017 ?auto_22014 ) ) ( TRUCK-AT ?auto_22015 ?auto_22012 ) ( SURFACE-AT ?auto_22017 ?auto_22012 ) ( CLEAR ?auto_22017 ) ( LIFTING ?auto_22016 ?auto_22010 ) ( IS-CRATE ?auto_22010 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22017 ?auto_22010 )
      ( MAKE-2CRATE ?auto_22017 ?auto_22010 ?auto_22011 )
      ( MAKE-1CRATE-VERIFY ?auto_22010 ?auto_22011 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22019 - SURFACE
      ?auto_22020 - SURFACE
      ?auto_22021 - SURFACE
    )
    :vars
    (
      ?auto_22027 - HOIST
      ?auto_22025 - PLACE
      ?auto_22026 - PLACE
      ?auto_22023 - HOIST
      ?auto_22022 - SURFACE
      ?auto_22024 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22027 ?auto_22025 ) ( IS-CRATE ?auto_22021 ) ( not ( = ?auto_22020 ?auto_22021 ) ) ( not ( = ?auto_22019 ?auto_22020 ) ) ( not ( = ?auto_22019 ?auto_22021 ) ) ( not ( = ?auto_22026 ?auto_22025 ) ) ( HOIST-AT ?auto_22023 ?auto_22026 ) ( not ( = ?auto_22027 ?auto_22023 ) ) ( AVAILABLE ?auto_22023 ) ( SURFACE-AT ?auto_22021 ?auto_22026 ) ( ON ?auto_22021 ?auto_22022 ) ( CLEAR ?auto_22021 ) ( not ( = ?auto_22020 ?auto_22022 ) ) ( not ( = ?auto_22021 ?auto_22022 ) ) ( not ( = ?auto_22019 ?auto_22022 ) ) ( TRUCK-AT ?auto_22024 ?auto_22025 ) ( SURFACE-AT ?auto_22019 ?auto_22025 ) ( CLEAR ?auto_22019 ) ( LIFTING ?auto_22027 ?auto_22020 ) ( IS-CRATE ?auto_22020 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22020 ?auto_22021 )
      ( MAKE-2CRATE-VERIFY ?auto_22019 ?auto_22020 ?auto_22021 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22028 - SURFACE
      ?auto_22029 - SURFACE
      ?auto_22030 - SURFACE
      ?auto_22031 - SURFACE
    )
    :vars
    (
      ?auto_22034 - HOIST
      ?auto_22036 - PLACE
      ?auto_22032 - PLACE
      ?auto_22035 - HOIST
      ?auto_22033 - SURFACE
      ?auto_22037 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22034 ?auto_22036 ) ( IS-CRATE ?auto_22031 ) ( not ( = ?auto_22030 ?auto_22031 ) ) ( not ( = ?auto_22029 ?auto_22030 ) ) ( not ( = ?auto_22029 ?auto_22031 ) ) ( not ( = ?auto_22032 ?auto_22036 ) ) ( HOIST-AT ?auto_22035 ?auto_22032 ) ( not ( = ?auto_22034 ?auto_22035 ) ) ( AVAILABLE ?auto_22035 ) ( SURFACE-AT ?auto_22031 ?auto_22032 ) ( ON ?auto_22031 ?auto_22033 ) ( CLEAR ?auto_22031 ) ( not ( = ?auto_22030 ?auto_22033 ) ) ( not ( = ?auto_22031 ?auto_22033 ) ) ( not ( = ?auto_22029 ?auto_22033 ) ) ( TRUCK-AT ?auto_22037 ?auto_22036 ) ( SURFACE-AT ?auto_22029 ?auto_22036 ) ( CLEAR ?auto_22029 ) ( LIFTING ?auto_22034 ?auto_22030 ) ( IS-CRATE ?auto_22030 ) ( ON ?auto_22029 ?auto_22028 ) ( not ( = ?auto_22028 ?auto_22029 ) ) ( not ( = ?auto_22028 ?auto_22030 ) ) ( not ( = ?auto_22028 ?auto_22031 ) ) ( not ( = ?auto_22028 ?auto_22033 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22029 ?auto_22030 ?auto_22031 )
      ( MAKE-3CRATE-VERIFY ?auto_22028 ?auto_22029 ?auto_22030 ?auto_22031 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22038 - SURFACE
      ?auto_22039 - SURFACE
      ?auto_22040 - SURFACE
      ?auto_22041 - SURFACE
      ?auto_22042 - SURFACE
    )
    :vars
    (
      ?auto_22045 - HOIST
      ?auto_22047 - PLACE
      ?auto_22043 - PLACE
      ?auto_22046 - HOIST
      ?auto_22044 - SURFACE
      ?auto_22048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22045 ?auto_22047 ) ( IS-CRATE ?auto_22042 ) ( not ( = ?auto_22041 ?auto_22042 ) ) ( not ( = ?auto_22040 ?auto_22041 ) ) ( not ( = ?auto_22040 ?auto_22042 ) ) ( not ( = ?auto_22043 ?auto_22047 ) ) ( HOIST-AT ?auto_22046 ?auto_22043 ) ( not ( = ?auto_22045 ?auto_22046 ) ) ( AVAILABLE ?auto_22046 ) ( SURFACE-AT ?auto_22042 ?auto_22043 ) ( ON ?auto_22042 ?auto_22044 ) ( CLEAR ?auto_22042 ) ( not ( = ?auto_22041 ?auto_22044 ) ) ( not ( = ?auto_22042 ?auto_22044 ) ) ( not ( = ?auto_22040 ?auto_22044 ) ) ( TRUCK-AT ?auto_22048 ?auto_22047 ) ( SURFACE-AT ?auto_22040 ?auto_22047 ) ( CLEAR ?auto_22040 ) ( LIFTING ?auto_22045 ?auto_22041 ) ( IS-CRATE ?auto_22041 ) ( ON ?auto_22039 ?auto_22038 ) ( ON ?auto_22040 ?auto_22039 ) ( not ( = ?auto_22038 ?auto_22039 ) ) ( not ( = ?auto_22038 ?auto_22040 ) ) ( not ( = ?auto_22038 ?auto_22041 ) ) ( not ( = ?auto_22038 ?auto_22042 ) ) ( not ( = ?auto_22038 ?auto_22044 ) ) ( not ( = ?auto_22039 ?auto_22040 ) ) ( not ( = ?auto_22039 ?auto_22041 ) ) ( not ( = ?auto_22039 ?auto_22042 ) ) ( not ( = ?auto_22039 ?auto_22044 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22040 ?auto_22041 ?auto_22042 )
      ( MAKE-4CRATE-VERIFY ?auto_22038 ?auto_22039 ?auto_22040 ?auto_22041 ?auto_22042 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22049 - SURFACE
      ?auto_22050 - SURFACE
      ?auto_22051 - SURFACE
      ?auto_22052 - SURFACE
      ?auto_22053 - SURFACE
      ?auto_22054 - SURFACE
    )
    :vars
    (
      ?auto_22057 - HOIST
      ?auto_22059 - PLACE
      ?auto_22055 - PLACE
      ?auto_22058 - HOIST
      ?auto_22056 - SURFACE
      ?auto_22060 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22057 ?auto_22059 ) ( IS-CRATE ?auto_22054 ) ( not ( = ?auto_22053 ?auto_22054 ) ) ( not ( = ?auto_22052 ?auto_22053 ) ) ( not ( = ?auto_22052 ?auto_22054 ) ) ( not ( = ?auto_22055 ?auto_22059 ) ) ( HOIST-AT ?auto_22058 ?auto_22055 ) ( not ( = ?auto_22057 ?auto_22058 ) ) ( AVAILABLE ?auto_22058 ) ( SURFACE-AT ?auto_22054 ?auto_22055 ) ( ON ?auto_22054 ?auto_22056 ) ( CLEAR ?auto_22054 ) ( not ( = ?auto_22053 ?auto_22056 ) ) ( not ( = ?auto_22054 ?auto_22056 ) ) ( not ( = ?auto_22052 ?auto_22056 ) ) ( TRUCK-AT ?auto_22060 ?auto_22059 ) ( SURFACE-AT ?auto_22052 ?auto_22059 ) ( CLEAR ?auto_22052 ) ( LIFTING ?auto_22057 ?auto_22053 ) ( IS-CRATE ?auto_22053 ) ( ON ?auto_22050 ?auto_22049 ) ( ON ?auto_22051 ?auto_22050 ) ( ON ?auto_22052 ?auto_22051 ) ( not ( = ?auto_22049 ?auto_22050 ) ) ( not ( = ?auto_22049 ?auto_22051 ) ) ( not ( = ?auto_22049 ?auto_22052 ) ) ( not ( = ?auto_22049 ?auto_22053 ) ) ( not ( = ?auto_22049 ?auto_22054 ) ) ( not ( = ?auto_22049 ?auto_22056 ) ) ( not ( = ?auto_22050 ?auto_22051 ) ) ( not ( = ?auto_22050 ?auto_22052 ) ) ( not ( = ?auto_22050 ?auto_22053 ) ) ( not ( = ?auto_22050 ?auto_22054 ) ) ( not ( = ?auto_22050 ?auto_22056 ) ) ( not ( = ?auto_22051 ?auto_22052 ) ) ( not ( = ?auto_22051 ?auto_22053 ) ) ( not ( = ?auto_22051 ?auto_22054 ) ) ( not ( = ?auto_22051 ?auto_22056 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22052 ?auto_22053 ?auto_22054 )
      ( MAKE-5CRATE-VERIFY ?auto_22049 ?auto_22050 ?auto_22051 ?auto_22052 ?auto_22053 ?auto_22054 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22061 - SURFACE
      ?auto_22062 - SURFACE
    )
    :vars
    (
      ?auto_22065 - HOIST
      ?auto_22068 - PLACE
      ?auto_22066 - SURFACE
      ?auto_22063 - PLACE
      ?auto_22067 - HOIST
      ?auto_22064 - SURFACE
      ?auto_22069 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22065 ?auto_22068 ) ( IS-CRATE ?auto_22062 ) ( not ( = ?auto_22061 ?auto_22062 ) ) ( not ( = ?auto_22066 ?auto_22061 ) ) ( not ( = ?auto_22066 ?auto_22062 ) ) ( not ( = ?auto_22063 ?auto_22068 ) ) ( HOIST-AT ?auto_22067 ?auto_22063 ) ( not ( = ?auto_22065 ?auto_22067 ) ) ( AVAILABLE ?auto_22067 ) ( SURFACE-AT ?auto_22062 ?auto_22063 ) ( ON ?auto_22062 ?auto_22064 ) ( CLEAR ?auto_22062 ) ( not ( = ?auto_22061 ?auto_22064 ) ) ( not ( = ?auto_22062 ?auto_22064 ) ) ( not ( = ?auto_22066 ?auto_22064 ) ) ( TRUCK-AT ?auto_22069 ?auto_22068 ) ( SURFACE-AT ?auto_22066 ?auto_22068 ) ( CLEAR ?auto_22066 ) ( IS-CRATE ?auto_22061 ) ( AVAILABLE ?auto_22065 ) ( IN ?auto_22061 ?auto_22069 ) )
    :subtasks
    ( ( !UNLOAD ?auto_22065 ?auto_22061 ?auto_22069 ?auto_22068 )
      ( MAKE-2CRATE ?auto_22066 ?auto_22061 ?auto_22062 )
      ( MAKE-1CRATE-VERIFY ?auto_22061 ?auto_22062 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22070 - SURFACE
      ?auto_22071 - SURFACE
      ?auto_22072 - SURFACE
    )
    :vars
    (
      ?auto_22077 - HOIST
      ?auto_22075 - PLACE
      ?auto_22074 - PLACE
      ?auto_22073 - HOIST
      ?auto_22076 - SURFACE
      ?auto_22078 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22077 ?auto_22075 ) ( IS-CRATE ?auto_22072 ) ( not ( = ?auto_22071 ?auto_22072 ) ) ( not ( = ?auto_22070 ?auto_22071 ) ) ( not ( = ?auto_22070 ?auto_22072 ) ) ( not ( = ?auto_22074 ?auto_22075 ) ) ( HOIST-AT ?auto_22073 ?auto_22074 ) ( not ( = ?auto_22077 ?auto_22073 ) ) ( AVAILABLE ?auto_22073 ) ( SURFACE-AT ?auto_22072 ?auto_22074 ) ( ON ?auto_22072 ?auto_22076 ) ( CLEAR ?auto_22072 ) ( not ( = ?auto_22071 ?auto_22076 ) ) ( not ( = ?auto_22072 ?auto_22076 ) ) ( not ( = ?auto_22070 ?auto_22076 ) ) ( TRUCK-AT ?auto_22078 ?auto_22075 ) ( SURFACE-AT ?auto_22070 ?auto_22075 ) ( CLEAR ?auto_22070 ) ( IS-CRATE ?auto_22071 ) ( AVAILABLE ?auto_22077 ) ( IN ?auto_22071 ?auto_22078 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22071 ?auto_22072 )
      ( MAKE-2CRATE-VERIFY ?auto_22070 ?auto_22071 ?auto_22072 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22079 - SURFACE
      ?auto_22080 - SURFACE
      ?auto_22081 - SURFACE
      ?auto_22082 - SURFACE
    )
    :vars
    (
      ?auto_22086 - HOIST
      ?auto_22088 - PLACE
      ?auto_22085 - PLACE
      ?auto_22083 - HOIST
      ?auto_22087 - SURFACE
      ?auto_22084 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22086 ?auto_22088 ) ( IS-CRATE ?auto_22082 ) ( not ( = ?auto_22081 ?auto_22082 ) ) ( not ( = ?auto_22080 ?auto_22081 ) ) ( not ( = ?auto_22080 ?auto_22082 ) ) ( not ( = ?auto_22085 ?auto_22088 ) ) ( HOIST-AT ?auto_22083 ?auto_22085 ) ( not ( = ?auto_22086 ?auto_22083 ) ) ( AVAILABLE ?auto_22083 ) ( SURFACE-AT ?auto_22082 ?auto_22085 ) ( ON ?auto_22082 ?auto_22087 ) ( CLEAR ?auto_22082 ) ( not ( = ?auto_22081 ?auto_22087 ) ) ( not ( = ?auto_22082 ?auto_22087 ) ) ( not ( = ?auto_22080 ?auto_22087 ) ) ( TRUCK-AT ?auto_22084 ?auto_22088 ) ( SURFACE-AT ?auto_22080 ?auto_22088 ) ( CLEAR ?auto_22080 ) ( IS-CRATE ?auto_22081 ) ( AVAILABLE ?auto_22086 ) ( IN ?auto_22081 ?auto_22084 ) ( ON ?auto_22080 ?auto_22079 ) ( not ( = ?auto_22079 ?auto_22080 ) ) ( not ( = ?auto_22079 ?auto_22081 ) ) ( not ( = ?auto_22079 ?auto_22082 ) ) ( not ( = ?auto_22079 ?auto_22087 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22080 ?auto_22081 ?auto_22082 )
      ( MAKE-3CRATE-VERIFY ?auto_22079 ?auto_22080 ?auto_22081 ?auto_22082 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22089 - SURFACE
      ?auto_22090 - SURFACE
      ?auto_22091 - SURFACE
      ?auto_22092 - SURFACE
      ?auto_22093 - SURFACE
    )
    :vars
    (
      ?auto_22097 - HOIST
      ?auto_22099 - PLACE
      ?auto_22096 - PLACE
      ?auto_22094 - HOIST
      ?auto_22098 - SURFACE
      ?auto_22095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22097 ?auto_22099 ) ( IS-CRATE ?auto_22093 ) ( not ( = ?auto_22092 ?auto_22093 ) ) ( not ( = ?auto_22091 ?auto_22092 ) ) ( not ( = ?auto_22091 ?auto_22093 ) ) ( not ( = ?auto_22096 ?auto_22099 ) ) ( HOIST-AT ?auto_22094 ?auto_22096 ) ( not ( = ?auto_22097 ?auto_22094 ) ) ( AVAILABLE ?auto_22094 ) ( SURFACE-AT ?auto_22093 ?auto_22096 ) ( ON ?auto_22093 ?auto_22098 ) ( CLEAR ?auto_22093 ) ( not ( = ?auto_22092 ?auto_22098 ) ) ( not ( = ?auto_22093 ?auto_22098 ) ) ( not ( = ?auto_22091 ?auto_22098 ) ) ( TRUCK-AT ?auto_22095 ?auto_22099 ) ( SURFACE-AT ?auto_22091 ?auto_22099 ) ( CLEAR ?auto_22091 ) ( IS-CRATE ?auto_22092 ) ( AVAILABLE ?auto_22097 ) ( IN ?auto_22092 ?auto_22095 ) ( ON ?auto_22090 ?auto_22089 ) ( ON ?auto_22091 ?auto_22090 ) ( not ( = ?auto_22089 ?auto_22090 ) ) ( not ( = ?auto_22089 ?auto_22091 ) ) ( not ( = ?auto_22089 ?auto_22092 ) ) ( not ( = ?auto_22089 ?auto_22093 ) ) ( not ( = ?auto_22089 ?auto_22098 ) ) ( not ( = ?auto_22090 ?auto_22091 ) ) ( not ( = ?auto_22090 ?auto_22092 ) ) ( not ( = ?auto_22090 ?auto_22093 ) ) ( not ( = ?auto_22090 ?auto_22098 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22091 ?auto_22092 ?auto_22093 )
      ( MAKE-4CRATE-VERIFY ?auto_22089 ?auto_22090 ?auto_22091 ?auto_22092 ?auto_22093 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22100 - SURFACE
      ?auto_22101 - SURFACE
      ?auto_22102 - SURFACE
      ?auto_22103 - SURFACE
      ?auto_22104 - SURFACE
      ?auto_22105 - SURFACE
    )
    :vars
    (
      ?auto_22109 - HOIST
      ?auto_22111 - PLACE
      ?auto_22108 - PLACE
      ?auto_22106 - HOIST
      ?auto_22110 - SURFACE
      ?auto_22107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22109 ?auto_22111 ) ( IS-CRATE ?auto_22105 ) ( not ( = ?auto_22104 ?auto_22105 ) ) ( not ( = ?auto_22103 ?auto_22104 ) ) ( not ( = ?auto_22103 ?auto_22105 ) ) ( not ( = ?auto_22108 ?auto_22111 ) ) ( HOIST-AT ?auto_22106 ?auto_22108 ) ( not ( = ?auto_22109 ?auto_22106 ) ) ( AVAILABLE ?auto_22106 ) ( SURFACE-AT ?auto_22105 ?auto_22108 ) ( ON ?auto_22105 ?auto_22110 ) ( CLEAR ?auto_22105 ) ( not ( = ?auto_22104 ?auto_22110 ) ) ( not ( = ?auto_22105 ?auto_22110 ) ) ( not ( = ?auto_22103 ?auto_22110 ) ) ( TRUCK-AT ?auto_22107 ?auto_22111 ) ( SURFACE-AT ?auto_22103 ?auto_22111 ) ( CLEAR ?auto_22103 ) ( IS-CRATE ?auto_22104 ) ( AVAILABLE ?auto_22109 ) ( IN ?auto_22104 ?auto_22107 ) ( ON ?auto_22101 ?auto_22100 ) ( ON ?auto_22102 ?auto_22101 ) ( ON ?auto_22103 ?auto_22102 ) ( not ( = ?auto_22100 ?auto_22101 ) ) ( not ( = ?auto_22100 ?auto_22102 ) ) ( not ( = ?auto_22100 ?auto_22103 ) ) ( not ( = ?auto_22100 ?auto_22104 ) ) ( not ( = ?auto_22100 ?auto_22105 ) ) ( not ( = ?auto_22100 ?auto_22110 ) ) ( not ( = ?auto_22101 ?auto_22102 ) ) ( not ( = ?auto_22101 ?auto_22103 ) ) ( not ( = ?auto_22101 ?auto_22104 ) ) ( not ( = ?auto_22101 ?auto_22105 ) ) ( not ( = ?auto_22101 ?auto_22110 ) ) ( not ( = ?auto_22102 ?auto_22103 ) ) ( not ( = ?auto_22102 ?auto_22104 ) ) ( not ( = ?auto_22102 ?auto_22105 ) ) ( not ( = ?auto_22102 ?auto_22110 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22103 ?auto_22104 ?auto_22105 )
      ( MAKE-5CRATE-VERIFY ?auto_22100 ?auto_22101 ?auto_22102 ?auto_22103 ?auto_22104 ?auto_22105 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22112 - SURFACE
      ?auto_22113 - SURFACE
    )
    :vars
    (
      ?auto_22118 - HOIST
      ?auto_22120 - PLACE
      ?auto_22116 - SURFACE
      ?auto_22117 - PLACE
      ?auto_22114 - HOIST
      ?auto_22119 - SURFACE
      ?auto_22115 - TRUCK
      ?auto_22121 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22118 ?auto_22120 ) ( IS-CRATE ?auto_22113 ) ( not ( = ?auto_22112 ?auto_22113 ) ) ( not ( = ?auto_22116 ?auto_22112 ) ) ( not ( = ?auto_22116 ?auto_22113 ) ) ( not ( = ?auto_22117 ?auto_22120 ) ) ( HOIST-AT ?auto_22114 ?auto_22117 ) ( not ( = ?auto_22118 ?auto_22114 ) ) ( AVAILABLE ?auto_22114 ) ( SURFACE-AT ?auto_22113 ?auto_22117 ) ( ON ?auto_22113 ?auto_22119 ) ( CLEAR ?auto_22113 ) ( not ( = ?auto_22112 ?auto_22119 ) ) ( not ( = ?auto_22113 ?auto_22119 ) ) ( not ( = ?auto_22116 ?auto_22119 ) ) ( SURFACE-AT ?auto_22116 ?auto_22120 ) ( CLEAR ?auto_22116 ) ( IS-CRATE ?auto_22112 ) ( AVAILABLE ?auto_22118 ) ( IN ?auto_22112 ?auto_22115 ) ( TRUCK-AT ?auto_22115 ?auto_22121 ) ( not ( = ?auto_22121 ?auto_22120 ) ) ( not ( = ?auto_22117 ?auto_22121 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22115 ?auto_22121 ?auto_22120 )
      ( MAKE-2CRATE ?auto_22116 ?auto_22112 ?auto_22113 )
      ( MAKE-1CRATE-VERIFY ?auto_22112 ?auto_22113 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22122 - SURFACE
      ?auto_22123 - SURFACE
      ?auto_22124 - SURFACE
    )
    :vars
    (
      ?auto_22130 - HOIST
      ?auto_22128 - PLACE
      ?auto_22127 - PLACE
      ?auto_22125 - HOIST
      ?auto_22129 - SURFACE
      ?auto_22126 - TRUCK
      ?auto_22131 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22130 ?auto_22128 ) ( IS-CRATE ?auto_22124 ) ( not ( = ?auto_22123 ?auto_22124 ) ) ( not ( = ?auto_22122 ?auto_22123 ) ) ( not ( = ?auto_22122 ?auto_22124 ) ) ( not ( = ?auto_22127 ?auto_22128 ) ) ( HOIST-AT ?auto_22125 ?auto_22127 ) ( not ( = ?auto_22130 ?auto_22125 ) ) ( AVAILABLE ?auto_22125 ) ( SURFACE-AT ?auto_22124 ?auto_22127 ) ( ON ?auto_22124 ?auto_22129 ) ( CLEAR ?auto_22124 ) ( not ( = ?auto_22123 ?auto_22129 ) ) ( not ( = ?auto_22124 ?auto_22129 ) ) ( not ( = ?auto_22122 ?auto_22129 ) ) ( SURFACE-AT ?auto_22122 ?auto_22128 ) ( CLEAR ?auto_22122 ) ( IS-CRATE ?auto_22123 ) ( AVAILABLE ?auto_22130 ) ( IN ?auto_22123 ?auto_22126 ) ( TRUCK-AT ?auto_22126 ?auto_22131 ) ( not ( = ?auto_22131 ?auto_22128 ) ) ( not ( = ?auto_22127 ?auto_22131 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22123 ?auto_22124 )
      ( MAKE-2CRATE-VERIFY ?auto_22122 ?auto_22123 ?auto_22124 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22132 - SURFACE
      ?auto_22133 - SURFACE
      ?auto_22134 - SURFACE
      ?auto_22135 - SURFACE
    )
    :vars
    (
      ?auto_22138 - HOIST
      ?auto_22142 - PLACE
      ?auto_22139 - PLACE
      ?auto_22141 - HOIST
      ?auto_22140 - SURFACE
      ?auto_22137 - TRUCK
      ?auto_22136 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22138 ?auto_22142 ) ( IS-CRATE ?auto_22135 ) ( not ( = ?auto_22134 ?auto_22135 ) ) ( not ( = ?auto_22133 ?auto_22134 ) ) ( not ( = ?auto_22133 ?auto_22135 ) ) ( not ( = ?auto_22139 ?auto_22142 ) ) ( HOIST-AT ?auto_22141 ?auto_22139 ) ( not ( = ?auto_22138 ?auto_22141 ) ) ( AVAILABLE ?auto_22141 ) ( SURFACE-AT ?auto_22135 ?auto_22139 ) ( ON ?auto_22135 ?auto_22140 ) ( CLEAR ?auto_22135 ) ( not ( = ?auto_22134 ?auto_22140 ) ) ( not ( = ?auto_22135 ?auto_22140 ) ) ( not ( = ?auto_22133 ?auto_22140 ) ) ( SURFACE-AT ?auto_22133 ?auto_22142 ) ( CLEAR ?auto_22133 ) ( IS-CRATE ?auto_22134 ) ( AVAILABLE ?auto_22138 ) ( IN ?auto_22134 ?auto_22137 ) ( TRUCK-AT ?auto_22137 ?auto_22136 ) ( not ( = ?auto_22136 ?auto_22142 ) ) ( not ( = ?auto_22139 ?auto_22136 ) ) ( ON ?auto_22133 ?auto_22132 ) ( not ( = ?auto_22132 ?auto_22133 ) ) ( not ( = ?auto_22132 ?auto_22134 ) ) ( not ( = ?auto_22132 ?auto_22135 ) ) ( not ( = ?auto_22132 ?auto_22140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22133 ?auto_22134 ?auto_22135 )
      ( MAKE-3CRATE-VERIFY ?auto_22132 ?auto_22133 ?auto_22134 ?auto_22135 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22143 - SURFACE
      ?auto_22144 - SURFACE
      ?auto_22145 - SURFACE
      ?auto_22146 - SURFACE
      ?auto_22147 - SURFACE
    )
    :vars
    (
      ?auto_22150 - HOIST
      ?auto_22154 - PLACE
      ?auto_22151 - PLACE
      ?auto_22153 - HOIST
      ?auto_22152 - SURFACE
      ?auto_22149 - TRUCK
      ?auto_22148 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22150 ?auto_22154 ) ( IS-CRATE ?auto_22147 ) ( not ( = ?auto_22146 ?auto_22147 ) ) ( not ( = ?auto_22145 ?auto_22146 ) ) ( not ( = ?auto_22145 ?auto_22147 ) ) ( not ( = ?auto_22151 ?auto_22154 ) ) ( HOIST-AT ?auto_22153 ?auto_22151 ) ( not ( = ?auto_22150 ?auto_22153 ) ) ( AVAILABLE ?auto_22153 ) ( SURFACE-AT ?auto_22147 ?auto_22151 ) ( ON ?auto_22147 ?auto_22152 ) ( CLEAR ?auto_22147 ) ( not ( = ?auto_22146 ?auto_22152 ) ) ( not ( = ?auto_22147 ?auto_22152 ) ) ( not ( = ?auto_22145 ?auto_22152 ) ) ( SURFACE-AT ?auto_22145 ?auto_22154 ) ( CLEAR ?auto_22145 ) ( IS-CRATE ?auto_22146 ) ( AVAILABLE ?auto_22150 ) ( IN ?auto_22146 ?auto_22149 ) ( TRUCK-AT ?auto_22149 ?auto_22148 ) ( not ( = ?auto_22148 ?auto_22154 ) ) ( not ( = ?auto_22151 ?auto_22148 ) ) ( ON ?auto_22144 ?auto_22143 ) ( ON ?auto_22145 ?auto_22144 ) ( not ( = ?auto_22143 ?auto_22144 ) ) ( not ( = ?auto_22143 ?auto_22145 ) ) ( not ( = ?auto_22143 ?auto_22146 ) ) ( not ( = ?auto_22143 ?auto_22147 ) ) ( not ( = ?auto_22143 ?auto_22152 ) ) ( not ( = ?auto_22144 ?auto_22145 ) ) ( not ( = ?auto_22144 ?auto_22146 ) ) ( not ( = ?auto_22144 ?auto_22147 ) ) ( not ( = ?auto_22144 ?auto_22152 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22145 ?auto_22146 ?auto_22147 )
      ( MAKE-4CRATE-VERIFY ?auto_22143 ?auto_22144 ?auto_22145 ?auto_22146 ?auto_22147 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22155 - SURFACE
      ?auto_22156 - SURFACE
      ?auto_22157 - SURFACE
      ?auto_22158 - SURFACE
      ?auto_22159 - SURFACE
      ?auto_22160 - SURFACE
    )
    :vars
    (
      ?auto_22163 - HOIST
      ?auto_22167 - PLACE
      ?auto_22164 - PLACE
      ?auto_22166 - HOIST
      ?auto_22165 - SURFACE
      ?auto_22162 - TRUCK
      ?auto_22161 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22163 ?auto_22167 ) ( IS-CRATE ?auto_22160 ) ( not ( = ?auto_22159 ?auto_22160 ) ) ( not ( = ?auto_22158 ?auto_22159 ) ) ( not ( = ?auto_22158 ?auto_22160 ) ) ( not ( = ?auto_22164 ?auto_22167 ) ) ( HOIST-AT ?auto_22166 ?auto_22164 ) ( not ( = ?auto_22163 ?auto_22166 ) ) ( AVAILABLE ?auto_22166 ) ( SURFACE-AT ?auto_22160 ?auto_22164 ) ( ON ?auto_22160 ?auto_22165 ) ( CLEAR ?auto_22160 ) ( not ( = ?auto_22159 ?auto_22165 ) ) ( not ( = ?auto_22160 ?auto_22165 ) ) ( not ( = ?auto_22158 ?auto_22165 ) ) ( SURFACE-AT ?auto_22158 ?auto_22167 ) ( CLEAR ?auto_22158 ) ( IS-CRATE ?auto_22159 ) ( AVAILABLE ?auto_22163 ) ( IN ?auto_22159 ?auto_22162 ) ( TRUCK-AT ?auto_22162 ?auto_22161 ) ( not ( = ?auto_22161 ?auto_22167 ) ) ( not ( = ?auto_22164 ?auto_22161 ) ) ( ON ?auto_22156 ?auto_22155 ) ( ON ?auto_22157 ?auto_22156 ) ( ON ?auto_22158 ?auto_22157 ) ( not ( = ?auto_22155 ?auto_22156 ) ) ( not ( = ?auto_22155 ?auto_22157 ) ) ( not ( = ?auto_22155 ?auto_22158 ) ) ( not ( = ?auto_22155 ?auto_22159 ) ) ( not ( = ?auto_22155 ?auto_22160 ) ) ( not ( = ?auto_22155 ?auto_22165 ) ) ( not ( = ?auto_22156 ?auto_22157 ) ) ( not ( = ?auto_22156 ?auto_22158 ) ) ( not ( = ?auto_22156 ?auto_22159 ) ) ( not ( = ?auto_22156 ?auto_22160 ) ) ( not ( = ?auto_22156 ?auto_22165 ) ) ( not ( = ?auto_22157 ?auto_22158 ) ) ( not ( = ?auto_22157 ?auto_22159 ) ) ( not ( = ?auto_22157 ?auto_22160 ) ) ( not ( = ?auto_22157 ?auto_22165 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22158 ?auto_22159 ?auto_22160 )
      ( MAKE-5CRATE-VERIFY ?auto_22155 ?auto_22156 ?auto_22157 ?auto_22158 ?auto_22159 ?auto_22160 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22168 - SURFACE
      ?auto_22169 - SURFACE
    )
    :vars
    (
      ?auto_22173 - HOIST
      ?auto_22177 - PLACE
      ?auto_22171 - SURFACE
      ?auto_22174 - PLACE
      ?auto_22176 - HOIST
      ?auto_22175 - SURFACE
      ?auto_22172 - TRUCK
      ?auto_22170 - PLACE
      ?auto_22178 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22173 ?auto_22177 ) ( IS-CRATE ?auto_22169 ) ( not ( = ?auto_22168 ?auto_22169 ) ) ( not ( = ?auto_22171 ?auto_22168 ) ) ( not ( = ?auto_22171 ?auto_22169 ) ) ( not ( = ?auto_22174 ?auto_22177 ) ) ( HOIST-AT ?auto_22176 ?auto_22174 ) ( not ( = ?auto_22173 ?auto_22176 ) ) ( AVAILABLE ?auto_22176 ) ( SURFACE-AT ?auto_22169 ?auto_22174 ) ( ON ?auto_22169 ?auto_22175 ) ( CLEAR ?auto_22169 ) ( not ( = ?auto_22168 ?auto_22175 ) ) ( not ( = ?auto_22169 ?auto_22175 ) ) ( not ( = ?auto_22171 ?auto_22175 ) ) ( SURFACE-AT ?auto_22171 ?auto_22177 ) ( CLEAR ?auto_22171 ) ( IS-CRATE ?auto_22168 ) ( AVAILABLE ?auto_22173 ) ( TRUCK-AT ?auto_22172 ?auto_22170 ) ( not ( = ?auto_22170 ?auto_22177 ) ) ( not ( = ?auto_22174 ?auto_22170 ) ) ( HOIST-AT ?auto_22178 ?auto_22170 ) ( LIFTING ?auto_22178 ?auto_22168 ) ( not ( = ?auto_22173 ?auto_22178 ) ) ( not ( = ?auto_22176 ?auto_22178 ) ) )
    :subtasks
    ( ( !LOAD ?auto_22178 ?auto_22168 ?auto_22172 ?auto_22170 )
      ( MAKE-2CRATE ?auto_22171 ?auto_22168 ?auto_22169 )
      ( MAKE-1CRATE-VERIFY ?auto_22168 ?auto_22169 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22179 - SURFACE
      ?auto_22180 - SURFACE
      ?auto_22181 - SURFACE
    )
    :vars
    (
      ?auto_22187 - HOIST
      ?auto_22189 - PLACE
      ?auto_22184 - PLACE
      ?auto_22188 - HOIST
      ?auto_22182 - SURFACE
      ?auto_22183 - TRUCK
      ?auto_22186 - PLACE
      ?auto_22185 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22187 ?auto_22189 ) ( IS-CRATE ?auto_22181 ) ( not ( = ?auto_22180 ?auto_22181 ) ) ( not ( = ?auto_22179 ?auto_22180 ) ) ( not ( = ?auto_22179 ?auto_22181 ) ) ( not ( = ?auto_22184 ?auto_22189 ) ) ( HOIST-AT ?auto_22188 ?auto_22184 ) ( not ( = ?auto_22187 ?auto_22188 ) ) ( AVAILABLE ?auto_22188 ) ( SURFACE-AT ?auto_22181 ?auto_22184 ) ( ON ?auto_22181 ?auto_22182 ) ( CLEAR ?auto_22181 ) ( not ( = ?auto_22180 ?auto_22182 ) ) ( not ( = ?auto_22181 ?auto_22182 ) ) ( not ( = ?auto_22179 ?auto_22182 ) ) ( SURFACE-AT ?auto_22179 ?auto_22189 ) ( CLEAR ?auto_22179 ) ( IS-CRATE ?auto_22180 ) ( AVAILABLE ?auto_22187 ) ( TRUCK-AT ?auto_22183 ?auto_22186 ) ( not ( = ?auto_22186 ?auto_22189 ) ) ( not ( = ?auto_22184 ?auto_22186 ) ) ( HOIST-AT ?auto_22185 ?auto_22186 ) ( LIFTING ?auto_22185 ?auto_22180 ) ( not ( = ?auto_22187 ?auto_22185 ) ) ( not ( = ?auto_22188 ?auto_22185 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22180 ?auto_22181 )
      ( MAKE-2CRATE-VERIFY ?auto_22179 ?auto_22180 ?auto_22181 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22190 - SURFACE
      ?auto_22191 - SURFACE
      ?auto_22192 - SURFACE
      ?auto_22193 - SURFACE
    )
    :vars
    (
      ?auto_22195 - HOIST
      ?auto_22194 - PLACE
      ?auto_22200 - PLACE
      ?auto_22198 - HOIST
      ?auto_22201 - SURFACE
      ?auto_22199 - TRUCK
      ?auto_22197 - PLACE
      ?auto_22196 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22195 ?auto_22194 ) ( IS-CRATE ?auto_22193 ) ( not ( = ?auto_22192 ?auto_22193 ) ) ( not ( = ?auto_22191 ?auto_22192 ) ) ( not ( = ?auto_22191 ?auto_22193 ) ) ( not ( = ?auto_22200 ?auto_22194 ) ) ( HOIST-AT ?auto_22198 ?auto_22200 ) ( not ( = ?auto_22195 ?auto_22198 ) ) ( AVAILABLE ?auto_22198 ) ( SURFACE-AT ?auto_22193 ?auto_22200 ) ( ON ?auto_22193 ?auto_22201 ) ( CLEAR ?auto_22193 ) ( not ( = ?auto_22192 ?auto_22201 ) ) ( not ( = ?auto_22193 ?auto_22201 ) ) ( not ( = ?auto_22191 ?auto_22201 ) ) ( SURFACE-AT ?auto_22191 ?auto_22194 ) ( CLEAR ?auto_22191 ) ( IS-CRATE ?auto_22192 ) ( AVAILABLE ?auto_22195 ) ( TRUCK-AT ?auto_22199 ?auto_22197 ) ( not ( = ?auto_22197 ?auto_22194 ) ) ( not ( = ?auto_22200 ?auto_22197 ) ) ( HOIST-AT ?auto_22196 ?auto_22197 ) ( LIFTING ?auto_22196 ?auto_22192 ) ( not ( = ?auto_22195 ?auto_22196 ) ) ( not ( = ?auto_22198 ?auto_22196 ) ) ( ON ?auto_22191 ?auto_22190 ) ( not ( = ?auto_22190 ?auto_22191 ) ) ( not ( = ?auto_22190 ?auto_22192 ) ) ( not ( = ?auto_22190 ?auto_22193 ) ) ( not ( = ?auto_22190 ?auto_22201 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22191 ?auto_22192 ?auto_22193 )
      ( MAKE-3CRATE-VERIFY ?auto_22190 ?auto_22191 ?auto_22192 ?auto_22193 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22202 - SURFACE
      ?auto_22203 - SURFACE
      ?auto_22204 - SURFACE
      ?auto_22205 - SURFACE
      ?auto_22206 - SURFACE
    )
    :vars
    (
      ?auto_22208 - HOIST
      ?auto_22207 - PLACE
      ?auto_22213 - PLACE
      ?auto_22211 - HOIST
      ?auto_22214 - SURFACE
      ?auto_22212 - TRUCK
      ?auto_22210 - PLACE
      ?auto_22209 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22208 ?auto_22207 ) ( IS-CRATE ?auto_22206 ) ( not ( = ?auto_22205 ?auto_22206 ) ) ( not ( = ?auto_22204 ?auto_22205 ) ) ( not ( = ?auto_22204 ?auto_22206 ) ) ( not ( = ?auto_22213 ?auto_22207 ) ) ( HOIST-AT ?auto_22211 ?auto_22213 ) ( not ( = ?auto_22208 ?auto_22211 ) ) ( AVAILABLE ?auto_22211 ) ( SURFACE-AT ?auto_22206 ?auto_22213 ) ( ON ?auto_22206 ?auto_22214 ) ( CLEAR ?auto_22206 ) ( not ( = ?auto_22205 ?auto_22214 ) ) ( not ( = ?auto_22206 ?auto_22214 ) ) ( not ( = ?auto_22204 ?auto_22214 ) ) ( SURFACE-AT ?auto_22204 ?auto_22207 ) ( CLEAR ?auto_22204 ) ( IS-CRATE ?auto_22205 ) ( AVAILABLE ?auto_22208 ) ( TRUCK-AT ?auto_22212 ?auto_22210 ) ( not ( = ?auto_22210 ?auto_22207 ) ) ( not ( = ?auto_22213 ?auto_22210 ) ) ( HOIST-AT ?auto_22209 ?auto_22210 ) ( LIFTING ?auto_22209 ?auto_22205 ) ( not ( = ?auto_22208 ?auto_22209 ) ) ( not ( = ?auto_22211 ?auto_22209 ) ) ( ON ?auto_22203 ?auto_22202 ) ( ON ?auto_22204 ?auto_22203 ) ( not ( = ?auto_22202 ?auto_22203 ) ) ( not ( = ?auto_22202 ?auto_22204 ) ) ( not ( = ?auto_22202 ?auto_22205 ) ) ( not ( = ?auto_22202 ?auto_22206 ) ) ( not ( = ?auto_22202 ?auto_22214 ) ) ( not ( = ?auto_22203 ?auto_22204 ) ) ( not ( = ?auto_22203 ?auto_22205 ) ) ( not ( = ?auto_22203 ?auto_22206 ) ) ( not ( = ?auto_22203 ?auto_22214 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22204 ?auto_22205 ?auto_22206 )
      ( MAKE-4CRATE-VERIFY ?auto_22202 ?auto_22203 ?auto_22204 ?auto_22205 ?auto_22206 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22215 - SURFACE
      ?auto_22216 - SURFACE
      ?auto_22217 - SURFACE
      ?auto_22218 - SURFACE
      ?auto_22219 - SURFACE
      ?auto_22220 - SURFACE
    )
    :vars
    (
      ?auto_22222 - HOIST
      ?auto_22221 - PLACE
      ?auto_22227 - PLACE
      ?auto_22225 - HOIST
      ?auto_22228 - SURFACE
      ?auto_22226 - TRUCK
      ?auto_22224 - PLACE
      ?auto_22223 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22222 ?auto_22221 ) ( IS-CRATE ?auto_22220 ) ( not ( = ?auto_22219 ?auto_22220 ) ) ( not ( = ?auto_22218 ?auto_22219 ) ) ( not ( = ?auto_22218 ?auto_22220 ) ) ( not ( = ?auto_22227 ?auto_22221 ) ) ( HOIST-AT ?auto_22225 ?auto_22227 ) ( not ( = ?auto_22222 ?auto_22225 ) ) ( AVAILABLE ?auto_22225 ) ( SURFACE-AT ?auto_22220 ?auto_22227 ) ( ON ?auto_22220 ?auto_22228 ) ( CLEAR ?auto_22220 ) ( not ( = ?auto_22219 ?auto_22228 ) ) ( not ( = ?auto_22220 ?auto_22228 ) ) ( not ( = ?auto_22218 ?auto_22228 ) ) ( SURFACE-AT ?auto_22218 ?auto_22221 ) ( CLEAR ?auto_22218 ) ( IS-CRATE ?auto_22219 ) ( AVAILABLE ?auto_22222 ) ( TRUCK-AT ?auto_22226 ?auto_22224 ) ( not ( = ?auto_22224 ?auto_22221 ) ) ( not ( = ?auto_22227 ?auto_22224 ) ) ( HOIST-AT ?auto_22223 ?auto_22224 ) ( LIFTING ?auto_22223 ?auto_22219 ) ( not ( = ?auto_22222 ?auto_22223 ) ) ( not ( = ?auto_22225 ?auto_22223 ) ) ( ON ?auto_22216 ?auto_22215 ) ( ON ?auto_22217 ?auto_22216 ) ( ON ?auto_22218 ?auto_22217 ) ( not ( = ?auto_22215 ?auto_22216 ) ) ( not ( = ?auto_22215 ?auto_22217 ) ) ( not ( = ?auto_22215 ?auto_22218 ) ) ( not ( = ?auto_22215 ?auto_22219 ) ) ( not ( = ?auto_22215 ?auto_22220 ) ) ( not ( = ?auto_22215 ?auto_22228 ) ) ( not ( = ?auto_22216 ?auto_22217 ) ) ( not ( = ?auto_22216 ?auto_22218 ) ) ( not ( = ?auto_22216 ?auto_22219 ) ) ( not ( = ?auto_22216 ?auto_22220 ) ) ( not ( = ?auto_22216 ?auto_22228 ) ) ( not ( = ?auto_22217 ?auto_22218 ) ) ( not ( = ?auto_22217 ?auto_22219 ) ) ( not ( = ?auto_22217 ?auto_22220 ) ) ( not ( = ?auto_22217 ?auto_22228 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22218 ?auto_22219 ?auto_22220 )
      ( MAKE-5CRATE-VERIFY ?auto_22215 ?auto_22216 ?auto_22217 ?auto_22218 ?auto_22219 ?auto_22220 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22229 - SURFACE
      ?auto_22230 - SURFACE
    )
    :vars
    (
      ?auto_22233 - HOIST
      ?auto_22232 - PLACE
      ?auto_22231 - SURFACE
      ?auto_22238 - PLACE
      ?auto_22236 - HOIST
      ?auto_22239 - SURFACE
      ?auto_22237 - TRUCK
      ?auto_22235 - PLACE
      ?auto_22234 - HOIST
      ?auto_22240 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22233 ?auto_22232 ) ( IS-CRATE ?auto_22230 ) ( not ( = ?auto_22229 ?auto_22230 ) ) ( not ( = ?auto_22231 ?auto_22229 ) ) ( not ( = ?auto_22231 ?auto_22230 ) ) ( not ( = ?auto_22238 ?auto_22232 ) ) ( HOIST-AT ?auto_22236 ?auto_22238 ) ( not ( = ?auto_22233 ?auto_22236 ) ) ( AVAILABLE ?auto_22236 ) ( SURFACE-AT ?auto_22230 ?auto_22238 ) ( ON ?auto_22230 ?auto_22239 ) ( CLEAR ?auto_22230 ) ( not ( = ?auto_22229 ?auto_22239 ) ) ( not ( = ?auto_22230 ?auto_22239 ) ) ( not ( = ?auto_22231 ?auto_22239 ) ) ( SURFACE-AT ?auto_22231 ?auto_22232 ) ( CLEAR ?auto_22231 ) ( IS-CRATE ?auto_22229 ) ( AVAILABLE ?auto_22233 ) ( TRUCK-AT ?auto_22237 ?auto_22235 ) ( not ( = ?auto_22235 ?auto_22232 ) ) ( not ( = ?auto_22238 ?auto_22235 ) ) ( HOIST-AT ?auto_22234 ?auto_22235 ) ( not ( = ?auto_22233 ?auto_22234 ) ) ( not ( = ?auto_22236 ?auto_22234 ) ) ( AVAILABLE ?auto_22234 ) ( SURFACE-AT ?auto_22229 ?auto_22235 ) ( ON ?auto_22229 ?auto_22240 ) ( CLEAR ?auto_22229 ) ( not ( = ?auto_22229 ?auto_22240 ) ) ( not ( = ?auto_22230 ?auto_22240 ) ) ( not ( = ?auto_22231 ?auto_22240 ) ) ( not ( = ?auto_22239 ?auto_22240 ) ) )
    :subtasks
    ( ( !LIFT ?auto_22234 ?auto_22229 ?auto_22240 ?auto_22235 )
      ( MAKE-2CRATE ?auto_22231 ?auto_22229 ?auto_22230 )
      ( MAKE-1CRATE-VERIFY ?auto_22229 ?auto_22230 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22241 - SURFACE
      ?auto_22242 - SURFACE
      ?auto_22243 - SURFACE
    )
    :vars
    (
      ?auto_22246 - HOIST
      ?auto_22250 - PLACE
      ?auto_22249 - PLACE
      ?auto_22244 - HOIST
      ?auto_22252 - SURFACE
      ?auto_22247 - TRUCK
      ?auto_22245 - PLACE
      ?auto_22251 - HOIST
      ?auto_22248 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22246 ?auto_22250 ) ( IS-CRATE ?auto_22243 ) ( not ( = ?auto_22242 ?auto_22243 ) ) ( not ( = ?auto_22241 ?auto_22242 ) ) ( not ( = ?auto_22241 ?auto_22243 ) ) ( not ( = ?auto_22249 ?auto_22250 ) ) ( HOIST-AT ?auto_22244 ?auto_22249 ) ( not ( = ?auto_22246 ?auto_22244 ) ) ( AVAILABLE ?auto_22244 ) ( SURFACE-AT ?auto_22243 ?auto_22249 ) ( ON ?auto_22243 ?auto_22252 ) ( CLEAR ?auto_22243 ) ( not ( = ?auto_22242 ?auto_22252 ) ) ( not ( = ?auto_22243 ?auto_22252 ) ) ( not ( = ?auto_22241 ?auto_22252 ) ) ( SURFACE-AT ?auto_22241 ?auto_22250 ) ( CLEAR ?auto_22241 ) ( IS-CRATE ?auto_22242 ) ( AVAILABLE ?auto_22246 ) ( TRUCK-AT ?auto_22247 ?auto_22245 ) ( not ( = ?auto_22245 ?auto_22250 ) ) ( not ( = ?auto_22249 ?auto_22245 ) ) ( HOIST-AT ?auto_22251 ?auto_22245 ) ( not ( = ?auto_22246 ?auto_22251 ) ) ( not ( = ?auto_22244 ?auto_22251 ) ) ( AVAILABLE ?auto_22251 ) ( SURFACE-AT ?auto_22242 ?auto_22245 ) ( ON ?auto_22242 ?auto_22248 ) ( CLEAR ?auto_22242 ) ( not ( = ?auto_22242 ?auto_22248 ) ) ( not ( = ?auto_22243 ?auto_22248 ) ) ( not ( = ?auto_22241 ?auto_22248 ) ) ( not ( = ?auto_22252 ?auto_22248 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22242 ?auto_22243 )
      ( MAKE-2CRATE-VERIFY ?auto_22241 ?auto_22242 ?auto_22243 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22253 - SURFACE
      ?auto_22254 - SURFACE
      ?auto_22255 - SURFACE
      ?auto_22256 - SURFACE
    )
    :vars
    (
      ?auto_22265 - HOIST
      ?auto_22261 - PLACE
      ?auto_22264 - PLACE
      ?auto_22259 - HOIST
      ?auto_22262 - SURFACE
      ?auto_22260 - TRUCK
      ?auto_22258 - PLACE
      ?auto_22263 - HOIST
      ?auto_22257 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22265 ?auto_22261 ) ( IS-CRATE ?auto_22256 ) ( not ( = ?auto_22255 ?auto_22256 ) ) ( not ( = ?auto_22254 ?auto_22255 ) ) ( not ( = ?auto_22254 ?auto_22256 ) ) ( not ( = ?auto_22264 ?auto_22261 ) ) ( HOIST-AT ?auto_22259 ?auto_22264 ) ( not ( = ?auto_22265 ?auto_22259 ) ) ( AVAILABLE ?auto_22259 ) ( SURFACE-AT ?auto_22256 ?auto_22264 ) ( ON ?auto_22256 ?auto_22262 ) ( CLEAR ?auto_22256 ) ( not ( = ?auto_22255 ?auto_22262 ) ) ( not ( = ?auto_22256 ?auto_22262 ) ) ( not ( = ?auto_22254 ?auto_22262 ) ) ( SURFACE-AT ?auto_22254 ?auto_22261 ) ( CLEAR ?auto_22254 ) ( IS-CRATE ?auto_22255 ) ( AVAILABLE ?auto_22265 ) ( TRUCK-AT ?auto_22260 ?auto_22258 ) ( not ( = ?auto_22258 ?auto_22261 ) ) ( not ( = ?auto_22264 ?auto_22258 ) ) ( HOIST-AT ?auto_22263 ?auto_22258 ) ( not ( = ?auto_22265 ?auto_22263 ) ) ( not ( = ?auto_22259 ?auto_22263 ) ) ( AVAILABLE ?auto_22263 ) ( SURFACE-AT ?auto_22255 ?auto_22258 ) ( ON ?auto_22255 ?auto_22257 ) ( CLEAR ?auto_22255 ) ( not ( = ?auto_22255 ?auto_22257 ) ) ( not ( = ?auto_22256 ?auto_22257 ) ) ( not ( = ?auto_22254 ?auto_22257 ) ) ( not ( = ?auto_22262 ?auto_22257 ) ) ( ON ?auto_22254 ?auto_22253 ) ( not ( = ?auto_22253 ?auto_22254 ) ) ( not ( = ?auto_22253 ?auto_22255 ) ) ( not ( = ?auto_22253 ?auto_22256 ) ) ( not ( = ?auto_22253 ?auto_22262 ) ) ( not ( = ?auto_22253 ?auto_22257 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22254 ?auto_22255 ?auto_22256 )
      ( MAKE-3CRATE-VERIFY ?auto_22253 ?auto_22254 ?auto_22255 ?auto_22256 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22266 - SURFACE
      ?auto_22267 - SURFACE
      ?auto_22268 - SURFACE
      ?auto_22269 - SURFACE
      ?auto_22270 - SURFACE
    )
    :vars
    (
      ?auto_22279 - HOIST
      ?auto_22275 - PLACE
      ?auto_22278 - PLACE
      ?auto_22273 - HOIST
      ?auto_22276 - SURFACE
      ?auto_22274 - TRUCK
      ?auto_22272 - PLACE
      ?auto_22277 - HOIST
      ?auto_22271 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22279 ?auto_22275 ) ( IS-CRATE ?auto_22270 ) ( not ( = ?auto_22269 ?auto_22270 ) ) ( not ( = ?auto_22268 ?auto_22269 ) ) ( not ( = ?auto_22268 ?auto_22270 ) ) ( not ( = ?auto_22278 ?auto_22275 ) ) ( HOIST-AT ?auto_22273 ?auto_22278 ) ( not ( = ?auto_22279 ?auto_22273 ) ) ( AVAILABLE ?auto_22273 ) ( SURFACE-AT ?auto_22270 ?auto_22278 ) ( ON ?auto_22270 ?auto_22276 ) ( CLEAR ?auto_22270 ) ( not ( = ?auto_22269 ?auto_22276 ) ) ( not ( = ?auto_22270 ?auto_22276 ) ) ( not ( = ?auto_22268 ?auto_22276 ) ) ( SURFACE-AT ?auto_22268 ?auto_22275 ) ( CLEAR ?auto_22268 ) ( IS-CRATE ?auto_22269 ) ( AVAILABLE ?auto_22279 ) ( TRUCK-AT ?auto_22274 ?auto_22272 ) ( not ( = ?auto_22272 ?auto_22275 ) ) ( not ( = ?auto_22278 ?auto_22272 ) ) ( HOIST-AT ?auto_22277 ?auto_22272 ) ( not ( = ?auto_22279 ?auto_22277 ) ) ( not ( = ?auto_22273 ?auto_22277 ) ) ( AVAILABLE ?auto_22277 ) ( SURFACE-AT ?auto_22269 ?auto_22272 ) ( ON ?auto_22269 ?auto_22271 ) ( CLEAR ?auto_22269 ) ( not ( = ?auto_22269 ?auto_22271 ) ) ( not ( = ?auto_22270 ?auto_22271 ) ) ( not ( = ?auto_22268 ?auto_22271 ) ) ( not ( = ?auto_22276 ?auto_22271 ) ) ( ON ?auto_22267 ?auto_22266 ) ( ON ?auto_22268 ?auto_22267 ) ( not ( = ?auto_22266 ?auto_22267 ) ) ( not ( = ?auto_22266 ?auto_22268 ) ) ( not ( = ?auto_22266 ?auto_22269 ) ) ( not ( = ?auto_22266 ?auto_22270 ) ) ( not ( = ?auto_22266 ?auto_22276 ) ) ( not ( = ?auto_22266 ?auto_22271 ) ) ( not ( = ?auto_22267 ?auto_22268 ) ) ( not ( = ?auto_22267 ?auto_22269 ) ) ( not ( = ?auto_22267 ?auto_22270 ) ) ( not ( = ?auto_22267 ?auto_22276 ) ) ( not ( = ?auto_22267 ?auto_22271 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22268 ?auto_22269 ?auto_22270 )
      ( MAKE-4CRATE-VERIFY ?auto_22266 ?auto_22267 ?auto_22268 ?auto_22269 ?auto_22270 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22280 - SURFACE
      ?auto_22281 - SURFACE
      ?auto_22282 - SURFACE
      ?auto_22283 - SURFACE
      ?auto_22284 - SURFACE
      ?auto_22285 - SURFACE
    )
    :vars
    (
      ?auto_22294 - HOIST
      ?auto_22290 - PLACE
      ?auto_22293 - PLACE
      ?auto_22288 - HOIST
      ?auto_22291 - SURFACE
      ?auto_22289 - TRUCK
      ?auto_22287 - PLACE
      ?auto_22292 - HOIST
      ?auto_22286 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22294 ?auto_22290 ) ( IS-CRATE ?auto_22285 ) ( not ( = ?auto_22284 ?auto_22285 ) ) ( not ( = ?auto_22283 ?auto_22284 ) ) ( not ( = ?auto_22283 ?auto_22285 ) ) ( not ( = ?auto_22293 ?auto_22290 ) ) ( HOIST-AT ?auto_22288 ?auto_22293 ) ( not ( = ?auto_22294 ?auto_22288 ) ) ( AVAILABLE ?auto_22288 ) ( SURFACE-AT ?auto_22285 ?auto_22293 ) ( ON ?auto_22285 ?auto_22291 ) ( CLEAR ?auto_22285 ) ( not ( = ?auto_22284 ?auto_22291 ) ) ( not ( = ?auto_22285 ?auto_22291 ) ) ( not ( = ?auto_22283 ?auto_22291 ) ) ( SURFACE-AT ?auto_22283 ?auto_22290 ) ( CLEAR ?auto_22283 ) ( IS-CRATE ?auto_22284 ) ( AVAILABLE ?auto_22294 ) ( TRUCK-AT ?auto_22289 ?auto_22287 ) ( not ( = ?auto_22287 ?auto_22290 ) ) ( not ( = ?auto_22293 ?auto_22287 ) ) ( HOIST-AT ?auto_22292 ?auto_22287 ) ( not ( = ?auto_22294 ?auto_22292 ) ) ( not ( = ?auto_22288 ?auto_22292 ) ) ( AVAILABLE ?auto_22292 ) ( SURFACE-AT ?auto_22284 ?auto_22287 ) ( ON ?auto_22284 ?auto_22286 ) ( CLEAR ?auto_22284 ) ( not ( = ?auto_22284 ?auto_22286 ) ) ( not ( = ?auto_22285 ?auto_22286 ) ) ( not ( = ?auto_22283 ?auto_22286 ) ) ( not ( = ?auto_22291 ?auto_22286 ) ) ( ON ?auto_22281 ?auto_22280 ) ( ON ?auto_22282 ?auto_22281 ) ( ON ?auto_22283 ?auto_22282 ) ( not ( = ?auto_22280 ?auto_22281 ) ) ( not ( = ?auto_22280 ?auto_22282 ) ) ( not ( = ?auto_22280 ?auto_22283 ) ) ( not ( = ?auto_22280 ?auto_22284 ) ) ( not ( = ?auto_22280 ?auto_22285 ) ) ( not ( = ?auto_22280 ?auto_22291 ) ) ( not ( = ?auto_22280 ?auto_22286 ) ) ( not ( = ?auto_22281 ?auto_22282 ) ) ( not ( = ?auto_22281 ?auto_22283 ) ) ( not ( = ?auto_22281 ?auto_22284 ) ) ( not ( = ?auto_22281 ?auto_22285 ) ) ( not ( = ?auto_22281 ?auto_22291 ) ) ( not ( = ?auto_22281 ?auto_22286 ) ) ( not ( = ?auto_22282 ?auto_22283 ) ) ( not ( = ?auto_22282 ?auto_22284 ) ) ( not ( = ?auto_22282 ?auto_22285 ) ) ( not ( = ?auto_22282 ?auto_22291 ) ) ( not ( = ?auto_22282 ?auto_22286 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22283 ?auto_22284 ?auto_22285 )
      ( MAKE-5CRATE-VERIFY ?auto_22280 ?auto_22281 ?auto_22282 ?auto_22283 ?auto_22284 ?auto_22285 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22295 - SURFACE
      ?auto_22296 - SURFACE
    )
    :vars
    (
      ?auto_22306 - HOIST
      ?auto_22301 - PLACE
      ?auto_22302 - SURFACE
      ?auto_22305 - PLACE
      ?auto_22299 - HOIST
      ?auto_22303 - SURFACE
      ?auto_22298 - PLACE
      ?auto_22304 - HOIST
      ?auto_22297 - SURFACE
      ?auto_22300 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22306 ?auto_22301 ) ( IS-CRATE ?auto_22296 ) ( not ( = ?auto_22295 ?auto_22296 ) ) ( not ( = ?auto_22302 ?auto_22295 ) ) ( not ( = ?auto_22302 ?auto_22296 ) ) ( not ( = ?auto_22305 ?auto_22301 ) ) ( HOIST-AT ?auto_22299 ?auto_22305 ) ( not ( = ?auto_22306 ?auto_22299 ) ) ( AVAILABLE ?auto_22299 ) ( SURFACE-AT ?auto_22296 ?auto_22305 ) ( ON ?auto_22296 ?auto_22303 ) ( CLEAR ?auto_22296 ) ( not ( = ?auto_22295 ?auto_22303 ) ) ( not ( = ?auto_22296 ?auto_22303 ) ) ( not ( = ?auto_22302 ?auto_22303 ) ) ( SURFACE-AT ?auto_22302 ?auto_22301 ) ( CLEAR ?auto_22302 ) ( IS-CRATE ?auto_22295 ) ( AVAILABLE ?auto_22306 ) ( not ( = ?auto_22298 ?auto_22301 ) ) ( not ( = ?auto_22305 ?auto_22298 ) ) ( HOIST-AT ?auto_22304 ?auto_22298 ) ( not ( = ?auto_22306 ?auto_22304 ) ) ( not ( = ?auto_22299 ?auto_22304 ) ) ( AVAILABLE ?auto_22304 ) ( SURFACE-AT ?auto_22295 ?auto_22298 ) ( ON ?auto_22295 ?auto_22297 ) ( CLEAR ?auto_22295 ) ( not ( = ?auto_22295 ?auto_22297 ) ) ( not ( = ?auto_22296 ?auto_22297 ) ) ( not ( = ?auto_22302 ?auto_22297 ) ) ( not ( = ?auto_22303 ?auto_22297 ) ) ( TRUCK-AT ?auto_22300 ?auto_22301 ) )
    :subtasks
    ( ( !DRIVE ?auto_22300 ?auto_22301 ?auto_22298 )
      ( MAKE-2CRATE ?auto_22302 ?auto_22295 ?auto_22296 )
      ( MAKE-1CRATE-VERIFY ?auto_22295 ?auto_22296 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22307 - SURFACE
      ?auto_22308 - SURFACE
      ?auto_22309 - SURFACE
    )
    :vars
    (
      ?auto_22312 - HOIST
      ?auto_22314 - PLACE
      ?auto_22310 - PLACE
      ?auto_22311 - HOIST
      ?auto_22318 - SURFACE
      ?auto_22315 - PLACE
      ?auto_22317 - HOIST
      ?auto_22316 - SURFACE
      ?auto_22313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22312 ?auto_22314 ) ( IS-CRATE ?auto_22309 ) ( not ( = ?auto_22308 ?auto_22309 ) ) ( not ( = ?auto_22307 ?auto_22308 ) ) ( not ( = ?auto_22307 ?auto_22309 ) ) ( not ( = ?auto_22310 ?auto_22314 ) ) ( HOIST-AT ?auto_22311 ?auto_22310 ) ( not ( = ?auto_22312 ?auto_22311 ) ) ( AVAILABLE ?auto_22311 ) ( SURFACE-AT ?auto_22309 ?auto_22310 ) ( ON ?auto_22309 ?auto_22318 ) ( CLEAR ?auto_22309 ) ( not ( = ?auto_22308 ?auto_22318 ) ) ( not ( = ?auto_22309 ?auto_22318 ) ) ( not ( = ?auto_22307 ?auto_22318 ) ) ( SURFACE-AT ?auto_22307 ?auto_22314 ) ( CLEAR ?auto_22307 ) ( IS-CRATE ?auto_22308 ) ( AVAILABLE ?auto_22312 ) ( not ( = ?auto_22315 ?auto_22314 ) ) ( not ( = ?auto_22310 ?auto_22315 ) ) ( HOIST-AT ?auto_22317 ?auto_22315 ) ( not ( = ?auto_22312 ?auto_22317 ) ) ( not ( = ?auto_22311 ?auto_22317 ) ) ( AVAILABLE ?auto_22317 ) ( SURFACE-AT ?auto_22308 ?auto_22315 ) ( ON ?auto_22308 ?auto_22316 ) ( CLEAR ?auto_22308 ) ( not ( = ?auto_22308 ?auto_22316 ) ) ( not ( = ?auto_22309 ?auto_22316 ) ) ( not ( = ?auto_22307 ?auto_22316 ) ) ( not ( = ?auto_22318 ?auto_22316 ) ) ( TRUCK-AT ?auto_22313 ?auto_22314 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22308 ?auto_22309 )
      ( MAKE-2CRATE-VERIFY ?auto_22307 ?auto_22308 ?auto_22309 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22319 - SURFACE
      ?auto_22320 - SURFACE
      ?auto_22321 - SURFACE
      ?auto_22322 - SURFACE
    )
    :vars
    (
      ?auto_22331 - HOIST
      ?auto_22323 - PLACE
      ?auto_22327 - PLACE
      ?auto_22330 - HOIST
      ?auto_22328 - SURFACE
      ?auto_22324 - PLACE
      ?auto_22325 - HOIST
      ?auto_22326 - SURFACE
      ?auto_22329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22331 ?auto_22323 ) ( IS-CRATE ?auto_22322 ) ( not ( = ?auto_22321 ?auto_22322 ) ) ( not ( = ?auto_22320 ?auto_22321 ) ) ( not ( = ?auto_22320 ?auto_22322 ) ) ( not ( = ?auto_22327 ?auto_22323 ) ) ( HOIST-AT ?auto_22330 ?auto_22327 ) ( not ( = ?auto_22331 ?auto_22330 ) ) ( AVAILABLE ?auto_22330 ) ( SURFACE-AT ?auto_22322 ?auto_22327 ) ( ON ?auto_22322 ?auto_22328 ) ( CLEAR ?auto_22322 ) ( not ( = ?auto_22321 ?auto_22328 ) ) ( not ( = ?auto_22322 ?auto_22328 ) ) ( not ( = ?auto_22320 ?auto_22328 ) ) ( SURFACE-AT ?auto_22320 ?auto_22323 ) ( CLEAR ?auto_22320 ) ( IS-CRATE ?auto_22321 ) ( AVAILABLE ?auto_22331 ) ( not ( = ?auto_22324 ?auto_22323 ) ) ( not ( = ?auto_22327 ?auto_22324 ) ) ( HOIST-AT ?auto_22325 ?auto_22324 ) ( not ( = ?auto_22331 ?auto_22325 ) ) ( not ( = ?auto_22330 ?auto_22325 ) ) ( AVAILABLE ?auto_22325 ) ( SURFACE-AT ?auto_22321 ?auto_22324 ) ( ON ?auto_22321 ?auto_22326 ) ( CLEAR ?auto_22321 ) ( not ( = ?auto_22321 ?auto_22326 ) ) ( not ( = ?auto_22322 ?auto_22326 ) ) ( not ( = ?auto_22320 ?auto_22326 ) ) ( not ( = ?auto_22328 ?auto_22326 ) ) ( TRUCK-AT ?auto_22329 ?auto_22323 ) ( ON ?auto_22320 ?auto_22319 ) ( not ( = ?auto_22319 ?auto_22320 ) ) ( not ( = ?auto_22319 ?auto_22321 ) ) ( not ( = ?auto_22319 ?auto_22322 ) ) ( not ( = ?auto_22319 ?auto_22328 ) ) ( not ( = ?auto_22319 ?auto_22326 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22320 ?auto_22321 ?auto_22322 )
      ( MAKE-3CRATE-VERIFY ?auto_22319 ?auto_22320 ?auto_22321 ?auto_22322 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22332 - SURFACE
      ?auto_22333 - SURFACE
      ?auto_22334 - SURFACE
      ?auto_22335 - SURFACE
      ?auto_22336 - SURFACE
    )
    :vars
    (
      ?auto_22345 - HOIST
      ?auto_22337 - PLACE
      ?auto_22341 - PLACE
      ?auto_22344 - HOIST
      ?auto_22342 - SURFACE
      ?auto_22338 - PLACE
      ?auto_22339 - HOIST
      ?auto_22340 - SURFACE
      ?auto_22343 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22345 ?auto_22337 ) ( IS-CRATE ?auto_22336 ) ( not ( = ?auto_22335 ?auto_22336 ) ) ( not ( = ?auto_22334 ?auto_22335 ) ) ( not ( = ?auto_22334 ?auto_22336 ) ) ( not ( = ?auto_22341 ?auto_22337 ) ) ( HOIST-AT ?auto_22344 ?auto_22341 ) ( not ( = ?auto_22345 ?auto_22344 ) ) ( AVAILABLE ?auto_22344 ) ( SURFACE-AT ?auto_22336 ?auto_22341 ) ( ON ?auto_22336 ?auto_22342 ) ( CLEAR ?auto_22336 ) ( not ( = ?auto_22335 ?auto_22342 ) ) ( not ( = ?auto_22336 ?auto_22342 ) ) ( not ( = ?auto_22334 ?auto_22342 ) ) ( SURFACE-AT ?auto_22334 ?auto_22337 ) ( CLEAR ?auto_22334 ) ( IS-CRATE ?auto_22335 ) ( AVAILABLE ?auto_22345 ) ( not ( = ?auto_22338 ?auto_22337 ) ) ( not ( = ?auto_22341 ?auto_22338 ) ) ( HOIST-AT ?auto_22339 ?auto_22338 ) ( not ( = ?auto_22345 ?auto_22339 ) ) ( not ( = ?auto_22344 ?auto_22339 ) ) ( AVAILABLE ?auto_22339 ) ( SURFACE-AT ?auto_22335 ?auto_22338 ) ( ON ?auto_22335 ?auto_22340 ) ( CLEAR ?auto_22335 ) ( not ( = ?auto_22335 ?auto_22340 ) ) ( not ( = ?auto_22336 ?auto_22340 ) ) ( not ( = ?auto_22334 ?auto_22340 ) ) ( not ( = ?auto_22342 ?auto_22340 ) ) ( TRUCK-AT ?auto_22343 ?auto_22337 ) ( ON ?auto_22333 ?auto_22332 ) ( ON ?auto_22334 ?auto_22333 ) ( not ( = ?auto_22332 ?auto_22333 ) ) ( not ( = ?auto_22332 ?auto_22334 ) ) ( not ( = ?auto_22332 ?auto_22335 ) ) ( not ( = ?auto_22332 ?auto_22336 ) ) ( not ( = ?auto_22332 ?auto_22342 ) ) ( not ( = ?auto_22332 ?auto_22340 ) ) ( not ( = ?auto_22333 ?auto_22334 ) ) ( not ( = ?auto_22333 ?auto_22335 ) ) ( not ( = ?auto_22333 ?auto_22336 ) ) ( not ( = ?auto_22333 ?auto_22342 ) ) ( not ( = ?auto_22333 ?auto_22340 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22334 ?auto_22335 ?auto_22336 )
      ( MAKE-4CRATE-VERIFY ?auto_22332 ?auto_22333 ?auto_22334 ?auto_22335 ?auto_22336 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22346 - SURFACE
      ?auto_22347 - SURFACE
      ?auto_22348 - SURFACE
      ?auto_22349 - SURFACE
      ?auto_22350 - SURFACE
      ?auto_22351 - SURFACE
    )
    :vars
    (
      ?auto_22360 - HOIST
      ?auto_22352 - PLACE
      ?auto_22356 - PLACE
      ?auto_22359 - HOIST
      ?auto_22357 - SURFACE
      ?auto_22353 - PLACE
      ?auto_22354 - HOIST
      ?auto_22355 - SURFACE
      ?auto_22358 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22360 ?auto_22352 ) ( IS-CRATE ?auto_22351 ) ( not ( = ?auto_22350 ?auto_22351 ) ) ( not ( = ?auto_22349 ?auto_22350 ) ) ( not ( = ?auto_22349 ?auto_22351 ) ) ( not ( = ?auto_22356 ?auto_22352 ) ) ( HOIST-AT ?auto_22359 ?auto_22356 ) ( not ( = ?auto_22360 ?auto_22359 ) ) ( AVAILABLE ?auto_22359 ) ( SURFACE-AT ?auto_22351 ?auto_22356 ) ( ON ?auto_22351 ?auto_22357 ) ( CLEAR ?auto_22351 ) ( not ( = ?auto_22350 ?auto_22357 ) ) ( not ( = ?auto_22351 ?auto_22357 ) ) ( not ( = ?auto_22349 ?auto_22357 ) ) ( SURFACE-AT ?auto_22349 ?auto_22352 ) ( CLEAR ?auto_22349 ) ( IS-CRATE ?auto_22350 ) ( AVAILABLE ?auto_22360 ) ( not ( = ?auto_22353 ?auto_22352 ) ) ( not ( = ?auto_22356 ?auto_22353 ) ) ( HOIST-AT ?auto_22354 ?auto_22353 ) ( not ( = ?auto_22360 ?auto_22354 ) ) ( not ( = ?auto_22359 ?auto_22354 ) ) ( AVAILABLE ?auto_22354 ) ( SURFACE-AT ?auto_22350 ?auto_22353 ) ( ON ?auto_22350 ?auto_22355 ) ( CLEAR ?auto_22350 ) ( not ( = ?auto_22350 ?auto_22355 ) ) ( not ( = ?auto_22351 ?auto_22355 ) ) ( not ( = ?auto_22349 ?auto_22355 ) ) ( not ( = ?auto_22357 ?auto_22355 ) ) ( TRUCK-AT ?auto_22358 ?auto_22352 ) ( ON ?auto_22347 ?auto_22346 ) ( ON ?auto_22348 ?auto_22347 ) ( ON ?auto_22349 ?auto_22348 ) ( not ( = ?auto_22346 ?auto_22347 ) ) ( not ( = ?auto_22346 ?auto_22348 ) ) ( not ( = ?auto_22346 ?auto_22349 ) ) ( not ( = ?auto_22346 ?auto_22350 ) ) ( not ( = ?auto_22346 ?auto_22351 ) ) ( not ( = ?auto_22346 ?auto_22357 ) ) ( not ( = ?auto_22346 ?auto_22355 ) ) ( not ( = ?auto_22347 ?auto_22348 ) ) ( not ( = ?auto_22347 ?auto_22349 ) ) ( not ( = ?auto_22347 ?auto_22350 ) ) ( not ( = ?auto_22347 ?auto_22351 ) ) ( not ( = ?auto_22347 ?auto_22357 ) ) ( not ( = ?auto_22347 ?auto_22355 ) ) ( not ( = ?auto_22348 ?auto_22349 ) ) ( not ( = ?auto_22348 ?auto_22350 ) ) ( not ( = ?auto_22348 ?auto_22351 ) ) ( not ( = ?auto_22348 ?auto_22357 ) ) ( not ( = ?auto_22348 ?auto_22355 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22349 ?auto_22350 ?auto_22351 )
      ( MAKE-5CRATE-VERIFY ?auto_22346 ?auto_22347 ?auto_22348 ?auto_22349 ?auto_22350 ?auto_22351 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22361 - SURFACE
      ?auto_22362 - SURFACE
    )
    :vars
    (
      ?auto_22372 - HOIST
      ?auto_22363 - PLACE
      ?auto_22371 - SURFACE
      ?auto_22367 - PLACE
      ?auto_22370 - HOIST
      ?auto_22368 - SURFACE
      ?auto_22364 - PLACE
      ?auto_22365 - HOIST
      ?auto_22366 - SURFACE
      ?auto_22369 - TRUCK
      ?auto_22373 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22372 ?auto_22363 ) ( IS-CRATE ?auto_22362 ) ( not ( = ?auto_22361 ?auto_22362 ) ) ( not ( = ?auto_22371 ?auto_22361 ) ) ( not ( = ?auto_22371 ?auto_22362 ) ) ( not ( = ?auto_22367 ?auto_22363 ) ) ( HOIST-AT ?auto_22370 ?auto_22367 ) ( not ( = ?auto_22372 ?auto_22370 ) ) ( AVAILABLE ?auto_22370 ) ( SURFACE-AT ?auto_22362 ?auto_22367 ) ( ON ?auto_22362 ?auto_22368 ) ( CLEAR ?auto_22362 ) ( not ( = ?auto_22361 ?auto_22368 ) ) ( not ( = ?auto_22362 ?auto_22368 ) ) ( not ( = ?auto_22371 ?auto_22368 ) ) ( IS-CRATE ?auto_22361 ) ( not ( = ?auto_22364 ?auto_22363 ) ) ( not ( = ?auto_22367 ?auto_22364 ) ) ( HOIST-AT ?auto_22365 ?auto_22364 ) ( not ( = ?auto_22372 ?auto_22365 ) ) ( not ( = ?auto_22370 ?auto_22365 ) ) ( AVAILABLE ?auto_22365 ) ( SURFACE-AT ?auto_22361 ?auto_22364 ) ( ON ?auto_22361 ?auto_22366 ) ( CLEAR ?auto_22361 ) ( not ( = ?auto_22361 ?auto_22366 ) ) ( not ( = ?auto_22362 ?auto_22366 ) ) ( not ( = ?auto_22371 ?auto_22366 ) ) ( not ( = ?auto_22368 ?auto_22366 ) ) ( TRUCK-AT ?auto_22369 ?auto_22363 ) ( SURFACE-AT ?auto_22373 ?auto_22363 ) ( CLEAR ?auto_22373 ) ( LIFTING ?auto_22372 ?auto_22371 ) ( IS-CRATE ?auto_22371 ) ( not ( = ?auto_22373 ?auto_22371 ) ) ( not ( = ?auto_22361 ?auto_22373 ) ) ( not ( = ?auto_22362 ?auto_22373 ) ) ( not ( = ?auto_22368 ?auto_22373 ) ) ( not ( = ?auto_22366 ?auto_22373 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22373 ?auto_22371 )
      ( MAKE-2CRATE ?auto_22371 ?auto_22361 ?auto_22362 )
      ( MAKE-1CRATE-VERIFY ?auto_22361 ?auto_22362 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22374 - SURFACE
      ?auto_22375 - SURFACE
      ?auto_22376 - SURFACE
    )
    :vars
    (
      ?auto_22385 - HOIST
      ?auto_22386 - PLACE
      ?auto_22379 - PLACE
      ?auto_22384 - HOIST
      ?auto_22378 - SURFACE
      ?auto_22382 - PLACE
      ?auto_22381 - HOIST
      ?auto_22377 - SURFACE
      ?auto_22380 - TRUCK
      ?auto_22383 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22385 ?auto_22386 ) ( IS-CRATE ?auto_22376 ) ( not ( = ?auto_22375 ?auto_22376 ) ) ( not ( = ?auto_22374 ?auto_22375 ) ) ( not ( = ?auto_22374 ?auto_22376 ) ) ( not ( = ?auto_22379 ?auto_22386 ) ) ( HOIST-AT ?auto_22384 ?auto_22379 ) ( not ( = ?auto_22385 ?auto_22384 ) ) ( AVAILABLE ?auto_22384 ) ( SURFACE-AT ?auto_22376 ?auto_22379 ) ( ON ?auto_22376 ?auto_22378 ) ( CLEAR ?auto_22376 ) ( not ( = ?auto_22375 ?auto_22378 ) ) ( not ( = ?auto_22376 ?auto_22378 ) ) ( not ( = ?auto_22374 ?auto_22378 ) ) ( IS-CRATE ?auto_22375 ) ( not ( = ?auto_22382 ?auto_22386 ) ) ( not ( = ?auto_22379 ?auto_22382 ) ) ( HOIST-AT ?auto_22381 ?auto_22382 ) ( not ( = ?auto_22385 ?auto_22381 ) ) ( not ( = ?auto_22384 ?auto_22381 ) ) ( AVAILABLE ?auto_22381 ) ( SURFACE-AT ?auto_22375 ?auto_22382 ) ( ON ?auto_22375 ?auto_22377 ) ( CLEAR ?auto_22375 ) ( not ( = ?auto_22375 ?auto_22377 ) ) ( not ( = ?auto_22376 ?auto_22377 ) ) ( not ( = ?auto_22374 ?auto_22377 ) ) ( not ( = ?auto_22378 ?auto_22377 ) ) ( TRUCK-AT ?auto_22380 ?auto_22386 ) ( SURFACE-AT ?auto_22383 ?auto_22386 ) ( CLEAR ?auto_22383 ) ( LIFTING ?auto_22385 ?auto_22374 ) ( IS-CRATE ?auto_22374 ) ( not ( = ?auto_22383 ?auto_22374 ) ) ( not ( = ?auto_22375 ?auto_22383 ) ) ( not ( = ?auto_22376 ?auto_22383 ) ) ( not ( = ?auto_22378 ?auto_22383 ) ) ( not ( = ?auto_22377 ?auto_22383 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22375 ?auto_22376 )
      ( MAKE-2CRATE-VERIFY ?auto_22374 ?auto_22375 ?auto_22376 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22387 - SURFACE
      ?auto_22388 - SURFACE
      ?auto_22389 - SURFACE
      ?auto_22390 - SURFACE
    )
    :vars
    (
      ?auto_22392 - HOIST
      ?auto_22393 - PLACE
      ?auto_22394 - PLACE
      ?auto_22391 - HOIST
      ?auto_22397 - SURFACE
      ?auto_22396 - PLACE
      ?auto_22398 - HOIST
      ?auto_22399 - SURFACE
      ?auto_22395 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22392 ?auto_22393 ) ( IS-CRATE ?auto_22390 ) ( not ( = ?auto_22389 ?auto_22390 ) ) ( not ( = ?auto_22388 ?auto_22389 ) ) ( not ( = ?auto_22388 ?auto_22390 ) ) ( not ( = ?auto_22394 ?auto_22393 ) ) ( HOIST-AT ?auto_22391 ?auto_22394 ) ( not ( = ?auto_22392 ?auto_22391 ) ) ( AVAILABLE ?auto_22391 ) ( SURFACE-AT ?auto_22390 ?auto_22394 ) ( ON ?auto_22390 ?auto_22397 ) ( CLEAR ?auto_22390 ) ( not ( = ?auto_22389 ?auto_22397 ) ) ( not ( = ?auto_22390 ?auto_22397 ) ) ( not ( = ?auto_22388 ?auto_22397 ) ) ( IS-CRATE ?auto_22389 ) ( not ( = ?auto_22396 ?auto_22393 ) ) ( not ( = ?auto_22394 ?auto_22396 ) ) ( HOIST-AT ?auto_22398 ?auto_22396 ) ( not ( = ?auto_22392 ?auto_22398 ) ) ( not ( = ?auto_22391 ?auto_22398 ) ) ( AVAILABLE ?auto_22398 ) ( SURFACE-AT ?auto_22389 ?auto_22396 ) ( ON ?auto_22389 ?auto_22399 ) ( CLEAR ?auto_22389 ) ( not ( = ?auto_22389 ?auto_22399 ) ) ( not ( = ?auto_22390 ?auto_22399 ) ) ( not ( = ?auto_22388 ?auto_22399 ) ) ( not ( = ?auto_22397 ?auto_22399 ) ) ( TRUCK-AT ?auto_22395 ?auto_22393 ) ( SURFACE-AT ?auto_22387 ?auto_22393 ) ( CLEAR ?auto_22387 ) ( LIFTING ?auto_22392 ?auto_22388 ) ( IS-CRATE ?auto_22388 ) ( not ( = ?auto_22387 ?auto_22388 ) ) ( not ( = ?auto_22389 ?auto_22387 ) ) ( not ( = ?auto_22390 ?auto_22387 ) ) ( not ( = ?auto_22397 ?auto_22387 ) ) ( not ( = ?auto_22399 ?auto_22387 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22388 ?auto_22389 ?auto_22390 )
      ( MAKE-3CRATE-VERIFY ?auto_22387 ?auto_22388 ?auto_22389 ?auto_22390 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22400 - SURFACE
      ?auto_22401 - SURFACE
      ?auto_22402 - SURFACE
      ?auto_22403 - SURFACE
      ?auto_22404 - SURFACE
    )
    :vars
    (
      ?auto_22406 - HOIST
      ?auto_22407 - PLACE
      ?auto_22408 - PLACE
      ?auto_22405 - HOIST
      ?auto_22411 - SURFACE
      ?auto_22410 - PLACE
      ?auto_22412 - HOIST
      ?auto_22413 - SURFACE
      ?auto_22409 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22406 ?auto_22407 ) ( IS-CRATE ?auto_22404 ) ( not ( = ?auto_22403 ?auto_22404 ) ) ( not ( = ?auto_22402 ?auto_22403 ) ) ( not ( = ?auto_22402 ?auto_22404 ) ) ( not ( = ?auto_22408 ?auto_22407 ) ) ( HOIST-AT ?auto_22405 ?auto_22408 ) ( not ( = ?auto_22406 ?auto_22405 ) ) ( AVAILABLE ?auto_22405 ) ( SURFACE-AT ?auto_22404 ?auto_22408 ) ( ON ?auto_22404 ?auto_22411 ) ( CLEAR ?auto_22404 ) ( not ( = ?auto_22403 ?auto_22411 ) ) ( not ( = ?auto_22404 ?auto_22411 ) ) ( not ( = ?auto_22402 ?auto_22411 ) ) ( IS-CRATE ?auto_22403 ) ( not ( = ?auto_22410 ?auto_22407 ) ) ( not ( = ?auto_22408 ?auto_22410 ) ) ( HOIST-AT ?auto_22412 ?auto_22410 ) ( not ( = ?auto_22406 ?auto_22412 ) ) ( not ( = ?auto_22405 ?auto_22412 ) ) ( AVAILABLE ?auto_22412 ) ( SURFACE-AT ?auto_22403 ?auto_22410 ) ( ON ?auto_22403 ?auto_22413 ) ( CLEAR ?auto_22403 ) ( not ( = ?auto_22403 ?auto_22413 ) ) ( not ( = ?auto_22404 ?auto_22413 ) ) ( not ( = ?auto_22402 ?auto_22413 ) ) ( not ( = ?auto_22411 ?auto_22413 ) ) ( TRUCK-AT ?auto_22409 ?auto_22407 ) ( SURFACE-AT ?auto_22401 ?auto_22407 ) ( CLEAR ?auto_22401 ) ( LIFTING ?auto_22406 ?auto_22402 ) ( IS-CRATE ?auto_22402 ) ( not ( = ?auto_22401 ?auto_22402 ) ) ( not ( = ?auto_22403 ?auto_22401 ) ) ( not ( = ?auto_22404 ?auto_22401 ) ) ( not ( = ?auto_22411 ?auto_22401 ) ) ( not ( = ?auto_22413 ?auto_22401 ) ) ( ON ?auto_22401 ?auto_22400 ) ( not ( = ?auto_22400 ?auto_22401 ) ) ( not ( = ?auto_22400 ?auto_22402 ) ) ( not ( = ?auto_22400 ?auto_22403 ) ) ( not ( = ?auto_22400 ?auto_22404 ) ) ( not ( = ?auto_22400 ?auto_22411 ) ) ( not ( = ?auto_22400 ?auto_22413 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22402 ?auto_22403 ?auto_22404 )
      ( MAKE-4CRATE-VERIFY ?auto_22400 ?auto_22401 ?auto_22402 ?auto_22403 ?auto_22404 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22414 - SURFACE
      ?auto_22415 - SURFACE
      ?auto_22416 - SURFACE
      ?auto_22417 - SURFACE
      ?auto_22418 - SURFACE
      ?auto_22419 - SURFACE
    )
    :vars
    (
      ?auto_22421 - HOIST
      ?auto_22422 - PLACE
      ?auto_22423 - PLACE
      ?auto_22420 - HOIST
      ?auto_22426 - SURFACE
      ?auto_22425 - PLACE
      ?auto_22427 - HOIST
      ?auto_22428 - SURFACE
      ?auto_22424 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22421 ?auto_22422 ) ( IS-CRATE ?auto_22419 ) ( not ( = ?auto_22418 ?auto_22419 ) ) ( not ( = ?auto_22417 ?auto_22418 ) ) ( not ( = ?auto_22417 ?auto_22419 ) ) ( not ( = ?auto_22423 ?auto_22422 ) ) ( HOIST-AT ?auto_22420 ?auto_22423 ) ( not ( = ?auto_22421 ?auto_22420 ) ) ( AVAILABLE ?auto_22420 ) ( SURFACE-AT ?auto_22419 ?auto_22423 ) ( ON ?auto_22419 ?auto_22426 ) ( CLEAR ?auto_22419 ) ( not ( = ?auto_22418 ?auto_22426 ) ) ( not ( = ?auto_22419 ?auto_22426 ) ) ( not ( = ?auto_22417 ?auto_22426 ) ) ( IS-CRATE ?auto_22418 ) ( not ( = ?auto_22425 ?auto_22422 ) ) ( not ( = ?auto_22423 ?auto_22425 ) ) ( HOIST-AT ?auto_22427 ?auto_22425 ) ( not ( = ?auto_22421 ?auto_22427 ) ) ( not ( = ?auto_22420 ?auto_22427 ) ) ( AVAILABLE ?auto_22427 ) ( SURFACE-AT ?auto_22418 ?auto_22425 ) ( ON ?auto_22418 ?auto_22428 ) ( CLEAR ?auto_22418 ) ( not ( = ?auto_22418 ?auto_22428 ) ) ( not ( = ?auto_22419 ?auto_22428 ) ) ( not ( = ?auto_22417 ?auto_22428 ) ) ( not ( = ?auto_22426 ?auto_22428 ) ) ( TRUCK-AT ?auto_22424 ?auto_22422 ) ( SURFACE-AT ?auto_22416 ?auto_22422 ) ( CLEAR ?auto_22416 ) ( LIFTING ?auto_22421 ?auto_22417 ) ( IS-CRATE ?auto_22417 ) ( not ( = ?auto_22416 ?auto_22417 ) ) ( not ( = ?auto_22418 ?auto_22416 ) ) ( not ( = ?auto_22419 ?auto_22416 ) ) ( not ( = ?auto_22426 ?auto_22416 ) ) ( not ( = ?auto_22428 ?auto_22416 ) ) ( ON ?auto_22415 ?auto_22414 ) ( ON ?auto_22416 ?auto_22415 ) ( not ( = ?auto_22414 ?auto_22415 ) ) ( not ( = ?auto_22414 ?auto_22416 ) ) ( not ( = ?auto_22414 ?auto_22417 ) ) ( not ( = ?auto_22414 ?auto_22418 ) ) ( not ( = ?auto_22414 ?auto_22419 ) ) ( not ( = ?auto_22414 ?auto_22426 ) ) ( not ( = ?auto_22414 ?auto_22428 ) ) ( not ( = ?auto_22415 ?auto_22416 ) ) ( not ( = ?auto_22415 ?auto_22417 ) ) ( not ( = ?auto_22415 ?auto_22418 ) ) ( not ( = ?auto_22415 ?auto_22419 ) ) ( not ( = ?auto_22415 ?auto_22426 ) ) ( not ( = ?auto_22415 ?auto_22428 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22417 ?auto_22418 ?auto_22419 )
      ( MAKE-5CRATE-VERIFY ?auto_22414 ?auto_22415 ?auto_22416 ?auto_22417 ?auto_22418 ?auto_22419 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22429 - SURFACE
      ?auto_22430 - SURFACE
    )
    :vars
    (
      ?auto_22432 - HOIST
      ?auto_22433 - PLACE
      ?auto_22441 - SURFACE
      ?auto_22434 - PLACE
      ?auto_22431 - HOIST
      ?auto_22437 - SURFACE
      ?auto_22436 - PLACE
      ?auto_22439 - HOIST
      ?auto_22440 - SURFACE
      ?auto_22435 - TRUCK
      ?auto_22438 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22432 ?auto_22433 ) ( IS-CRATE ?auto_22430 ) ( not ( = ?auto_22429 ?auto_22430 ) ) ( not ( = ?auto_22441 ?auto_22429 ) ) ( not ( = ?auto_22441 ?auto_22430 ) ) ( not ( = ?auto_22434 ?auto_22433 ) ) ( HOIST-AT ?auto_22431 ?auto_22434 ) ( not ( = ?auto_22432 ?auto_22431 ) ) ( AVAILABLE ?auto_22431 ) ( SURFACE-AT ?auto_22430 ?auto_22434 ) ( ON ?auto_22430 ?auto_22437 ) ( CLEAR ?auto_22430 ) ( not ( = ?auto_22429 ?auto_22437 ) ) ( not ( = ?auto_22430 ?auto_22437 ) ) ( not ( = ?auto_22441 ?auto_22437 ) ) ( IS-CRATE ?auto_22429 ) ( not ( = ?auto_22436 ?auto_22433 ) ) ( not ( = ?auto_22434 ?auto_22436 ) ) ( HOIST-AT ?auto_22439 ?auto_22436 ) ( not ( = ?auto_22432 ?auto_22439 ) ) ( not ( = ?auto_22431 ?auto_22439 ) ) ( AVAILABLE ?auto_22439 ) ( SURFACE-AT ?auto_22429 ?auto_22436 ) ( ON ?auto_22429 ?auto_22440 ) ( CLEAR ?auto_22429 ) ( not ( = ?auto_22429 ?auto_22440 ) ) ( not ( = ?auto_22430 ?auto_22440 ) ) ( not ( = ?auto_22441 ?auto_22440 ) ) ( not ( = ?auto_22437 ?auto_22440 ) ) ( TRUCK-AT ?auto_22435 ?auto_22433 ) ( SURFACE-AT ?auto_22438 ?auto_22433 ) ( CLEAR ?auto_22438 ) ( IS-CRATE ?auto_22441 ) ( not ( = ?auto_22438 ?auto_22441 ) ) ( not ( = ?auto_22429 ?auto_22438 ) ) ( not ( = ?auto_22430 ?auto_22438 ) ) ( not ( = ?auto_22437 ?auto_22438 ) ) ( not ( = ?auto_22440 ?auto_22438 ) ) ( AVAILABLE ?auto_22432 ) ( IN ?auto_22441 ?auto_22435 ) )
    :subtasks
    ( ( !UNLOAD ?auto_22432 ?auto_22441 ?auto_22435 ?auto_22433 )
      ( MAKE-2CRATE ?auto_22441 ?auto_22429 ?auto_22430 )
      ( MAKE-1CRATE-VERIFY ?auto_22429 ?auto_22430 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22442 - SURFACE
      ?auto_22443 - SURFACE
      ?auto_22444 - SURFACE
    )
    :vars
    (
      ?auto_22448 - HOIST
      ?auto_22445 - PLACE
      ?auto_22447 - PLACE
      ?auto_22446 - HOIST
      ?auto_22454 - SURFACE
      ?auto_22452 - PLACE
      ?auto_22453 - HOIST
      ?auto_22451 - SURFACE
      ?auto_22449 - TRUCK
      ?auto_22450 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22448 ?auto_22445 ) ( IS-CRATE ?auto_22444 ) ( not ( = ?auto_22443 ?auto_22444 ) ) ( not ( = ?auto_22442 ?auto_22443 ) ) ( not ( = ?auto_22442 ?auto_22444 ) ) ( not ( = ?auto_22447 ?auto_22445 ) ) ( HOIST-AT ?auto_22446 ?auto_22447 ) ( not ( = ?auto_22448 ?auto_22446 ) ) ( AVAILABLE ?auto_22446 ) ( SURFACE-AT ?auto_22444 ?auto_22447 ) ( ON ?auto_22444 ?auto_22454 ) ( CLEAR ?auto_22444 ) ( not ( = ?auto_22443 ?auto_22454 ) ) ( not ( = ?auto_22444 ?auto_22454 ) ) ( not ( = ?auto_22442 ?auto_22454 ) ) ( IS-CRATE ?auto_22443 ) ( not ( = ?auto_22452 ?auto_22445 ) ) ( not ( = ?auto_22447 ?auto_22452 ) ) ( HOIST-AT ?auto_22453 ?auto_22452 ) ( not ( = ?auto_22448 ?auto_22453 ) ) ( not ( = ?auto_22446 ?auto_22453 ) ) ( AVAILABLE ?auto_22453 ) ( SURFACE-AT ?auto_22443 ?auto_22452 ) ( ON ?auto_22443 ?auto_22451 ) ( CLEAR ?auto_22443 ) ( not ( = ?auto_22443 ?auto_22451 ) ) ( not ( = ?auto_22444 ?auto_22451 ) ) ( not ( = ?auto_22442 ?auto_22451 ) ) ( not ( = ?auto_22454 ?auto_22451 ) ) ( TRUCK-AT ?auto_22449 ?auto_22445 ) ( SURFACE-AT ?auto_22450 ?auto_22445 ) ( CLEAR ?auto_22450 ) ( IS-CRATE ?auto_22442 ) ( not ( = ?auto_22450 ?auto_22442 ) ) ( not ( = ?auto_22443 ?auto_22450 ) ) ( not ( = ?auto_22444 ?auto_22450 ) ) ( not ( = ?auto_22454 ?auto_22450 ) ) ( not ( = ?auto_22451 ?auto_22450 ) ) ( AVAILABLE ?auto_22448 ) ( IN ?auto_22442 ?auto_22449 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22443 ?auto_22444 )
      ( MAKE-2CRATE-VERIFY ?auto_22442 ?auto_22443 ?auto_22444 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22455 - SURFACE
      ?auto_22456 - SURFACE
      ?auto_22457 - SURFACE
      ?auto_22458 - SURFACE
    )
    :vars
    (
      ?auto_22467 - HOIST
      ?auto_22465 - PLACE
      ?auto_22461 - PLACE
      ?auto_22460 - HOIST
      ?auto_22462 - SURFACE
      ?auto_22464 - PLACE
      ?auto_22466 - HOIST
      ?auto_22463 - SURFACE
      ?auto_22459 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22467 ?auto_22465 ) ( IS-CRATE ?auto_22458 ) ( not ( = ?auto_22457 ?auto_22458 ) ) ( not ( = ?auto_22456 ?auto_22457 ) ) ( not ( = ?auto_22456 ?auto_22458 ) ) ( not ( = ?auto_22461 ?auto_22465 ) ) ( HOIST-AT ?auto_22460 ?auto_22461 ) ( not ( = ?auto_22467 ?auto_22460 ) ) ( AVAILABLE ?auto_22460 ) ( SURFACE-AT ?auto_22458 ?auto_22461 ) ( ON ?auto_22458 ?auto_22462 ) ( CLEAR ?auto_22458 ) ( not ( = ?auto_22457 ?auto_22462 ) ) ( not ( = ?auto_22458 ?auto_22462 ) ) ( not ( = ?auto_22456 ?auto_22462 ) ) ( IS-CRATE ?auto_22457 ) ( not ( = ?auto_22464 ?auto_22465 ) ) ( not ( = ?auto_22461 ?auto_22464 ) ) ( HOIST-AT ?auto_22466 ?auto_22464 ) ( not ( = ?auto_22467 ?auto_22466 ) ) ( not ( = ?auto_22460 ?auto_22466 ) ) ( AVAILABLE ?auto_22466 ) ( SURFACE-AT ?auto_22457 ?auto_22464 ) ( ON ?auto_22457 ?auto_22463 ) ( CLEAR ?auto_22457 ) ( not ( = ?auto_22457 ?auto_22463 ) ) ( not ( = ?auto_22458 ?auto_22463 ) ) ( not ( = ?auto_22456 ?auto_22463 ) ) ( not ( = ?auto_22462 ?auto_22463 ) ) ( TRUCK-AT ?auto_22459 ?auto_22465 ) ( SURFACE-AT ?auto_22455 ?auto_22465 ) ( CLEAR ?auto_22455 ) ( IS-CRATE ?auto_22456 ) ( not ( = ?auto_22455 ?auto_22456 ) ) ( not ( = ?auto_22457 ?auto_22455 ) ) ( not ( = ?auto_22458 ?auto_22455 ) ) ( not ( = ?auto_22462 ?auto_22455 ) ) ( not ( = ?auto_22463 ?auto_22455 ) ) ( AVAILABLE ?auto_22467 ) ( IN ?auto_22456 ?auto_22459 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22456 ?auto_22457 ?auto_22458 )
      ( MAKE-3CRATE-VERIFY ?auto_22455 ?auto_22456 ?auto_22457 ?auto_22458 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22468 - SURFACE
      ?auto_22469 - SURFACE
      ?auto_22470 - SURFACE
      ?auto_22471 - SURFACE
      ?auto_22472 - SURFACE
    )
    :vars
    (
      ?auto_22481 - HOIST
      ?auto_22479 - PLACE
      ?auto_22475 - PLACE
      ?auto_22474 - HOIST
      ?auto_22476 - SURFACE
      ?auto_22478 - PLACE
      ?auto_22480 - HOIST
      ?auto_22477 - SURFACE
      ?auto_22473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22481 ?auto_22479 ) ( IS-CRATE ?auto_22472 ) ( not ( = ?auto_22471 ?auto_22472 ) ) ( not ( = ?auto_22470 ?auto_22471 ) ) ( not ( = ?auto_22470 ?auto_22472 ) ) ( not ( = ?auto_22475 ?auto_22479 ) ) ( HOIST-AT ?auto_22474 ?auto_22475 ) ( not ( = ?auto_22481 ?auto_22474 ) ) ( AVAILABLE ?auto_22474 ) ( SURFACE-AT ?auto_22472 ?auto_22475 ) ( ON ?auto_22472 ?auto_22476 ) ( CLEAR ?auto_22472 ) ( not ( = ?auto_22471 ?auto_22476 ) ) ( not ( = ?auto_22472 ?auto_22476 ) ) ( not ( = ?auto_22470 ?auto_22476 ) ) ( IS-CRATE ?auto_22471 ) ( not ( = ?auto_22478 ?auto_22479 ) ) ( not ( = ?auto_22475 ?auto_22478 ) ) ( HOIST-AT ?auto_22480 ?auto_22478 ) ( not ( = ?auto_22481 ?auto_22480 ) ) ( not ( = ?auto_22474 ?auto_22480 ) ) ( AVAILABLE ?auto_22480 ) ( SURFACE-AT ?auto_22471 ?auto_22478 ) ( ON ?auto_22471 ?auto_22477 ) ( CLEAR ?auto_22471 ) ( not ( = ?auto_22471 ?auto_22477 ) ) ( not ( = ?auto_22472 ?auto_22477 ) ) ( not ( = ?auto_22470 ?auto_22477 ) ) ( not ( = ?auto_22476 ?auto_22477 ) ) ( TRUCK-AT ?auto_22473 ?auto_22479 ) ( SURFACE-AT ?auto_22469 ?auto_22479 ) ( CLEAR ?auto_22469 ) ( IS-CRATE ?auto_22470 ) ( not ( = ?auto_22469 ?auto_22470 ) ) ( not ( = ?auto_22471 ?auto_22469 ) ) ( not ( = ?auto_22472 ?auto_22469 ) ) ( not ( = ?auto_22476 ?auto_22469 ) ) ( not ( = ?auto_22477 ?auto_22469 ) ) ( AVAILABLE ?auto_22481 ) ( IN ?auto_22470 ?auto_22473 ) ( ON ?auto_22469 ?auto_22468 ) ( not ( = ?auto_22468 ?auto_22469 ) ) ( not ( = ?auto_22468 ?auto_22470 ) ) ( not ( = ?auto_22468 ?auto_22471 ) ) ( not ( = ?auto_22468 ?auto_22472 ) ) ( not ( = ?auto_22468 ?auto_22476 ) ) ( not ( = ?auto_22468 ?auto_22477 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22470 ?auto_22471 ?auto_22472 )
      ( MAKE-4CRATE-VERIFY ?auto_22468 ?auto_22469 ?auto_22470 ?auto_22471 ?auto_22472 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22482 - SURFACE
      ?auto_22483 - SURFACE
      ?auto_22484 - SURFACE
      ?auto_22485 - SURFACE
      ?auto_22486 - SURFACE
      ?auto_22487 - SURFACE
    )
    :vars
    (
      ?auto_22496 - HOIST
      ?auto_22494 - PLACE
      ?auto_22490 - PLACE
      ?auto_22489 - HOIST
      ?auto_22491 - SURFACE
      ?auto_22493 - PLACE
      ?auto_22495 - HOIST
      ?auto_22492 - SURFACE
      ?auto_22488 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22496 ?auto_22494 ) ( IS-CRATE ?auto_22487 ) ( not ( = ?auto_22486 ?auto_22487 ) ) ( not ( = ?auto_22485 ?auto_22486 ) ) ( not ( = ?auto_22485 ?auto_22487 ) ) ( not ( = ?auto_22490 ?auto_22494 ) ) ( HOIST-AT ?auto_22489 ?auto_22490 ) ( not ( = ?auto_22496 ?auto_22489 ) ) ( AVAILABLE ?auto_22489 ) ( SURFACE-AT ?auto_22487 ?auto_22490 ) ( ON ?auto_22487 ?auto_22491 ) ( CLEAR ?auto_22487 ) ( not ( = ?auto_22486 ?auto_22491 ) ) ( not ( = ?auto_22487 ?auto_22491 ) ) ( not ( = ?auto_22485 ?auto_22491 ) ) ( IS-CRATE ?auto_22486 ) ( not ( = ?auto_22493 ?auto_22494 ) ) ( not ( = ?auto_22490 ?auto_22493 ) ) ( HOIST-AT ?auto_22495 ?auto_22493 ) ( not ( = ?auto_22496 ?auto_22495 ) ) ( not ( = ?auto_22489 ?auto_22495 ) ) ( AVAILABLE ?auto_22495 ) ( SURFACE-AT ?auto_22486 ?auto_22493 ) ( ON ?auto_22486 ?auto_22492 ) ( CLEAR ?auto_22486 ) ( not ( = ?auto_22486 ?auto_22492 ) ) ( not ( = ?auto_22487 ?auto_22492 ) ) ( not ( = ?auto_22485 ?auto_22492 ) ) ( not ( = ?auto_22491 ?auto_22492 ) ) ( TRUCK-AT ?auto_22488 ?auto_22494 ) ( SURFACE-AT ?auto_22484 ?auto_22494 ) ( CLEAR ?auto_22484 ) ( IS-CRATE ?auto_22485 ) ( not ( = ?auto_22484 ?auto_22485 ) ) ( not ( = ?auto_22486 ?auto_22484 ) ) ( not ( = ?auto_22487 ?auto_22484 ) ) ( not ( = ?auto_22491 ?auto_22484 ) ) ( not ( = ?auto_22492 ?auto_22484 ) ) ( AVAILABLE ?auto_22496 ) ( IN ?auto_22485 ?auto_22488 ) ( ON ?auto_22483 ?auto_22482 ) ( ON ?auto_22484 ?auto_22483 ) ( not ( = ?auto_22482 ?auto_22483 ) ) ( not ( = ?auto_22482 ?auto_22484 ) ) ( not ( = ?auto_22482 ?auto_22485 ) ) ( not ( = ?auto_22482 ?auto_22486 ) ) ( not ( = ?auto_22482 ?auto_22487 ) ) ( not ( = ?auto_22482 ?auto_22491 ) ) ( not ( = ?auto_22482 ?auto_22492 ) ) ( not ( = ?auto_22483 ?auto_22484 ) ) ( not ( = ?auto_22483 ?auto_22485 ) ) ( not ( = ?auto_22483 ?auto_22486 ) ) ( not ( = ?auto_22483 ?auto_22487 ) ) ( not ( = ?auto_22483 ?auto_22491 ) ) ( not ( = ?auto_22483 ?auto_22492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22485 ?auto_22486 ?auto_22487 )
      ( MAKE-5CRATE-VERIFY ?auto_22482 ?auto_22483 ?auto_22484 ?auto_22485 ?auto_22486 ?auto_22487 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22497 - SURFACE
      ?auto_22498 - SURFACE
    )
    :vars
    (
      ?auto_22509 - HOIST
      ?auto_22506 - PLACE
      ?auto_22508 - SURFACE
      ?auto_22501 - PLACE
      ?auto_22500 - HOIST
      ?auto_22502 - SURFACE
      ?auto_22505 - PLACE
      ?auto_22507 - HOIST
      ?auto_22503 - SURFACE
      ?auto_22504 - SURFACE
      ?auto_22499 - TRUCK
      ?auto_22510 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22509 ?auto_22506 ) ( IS-CRATE ?auto_22498 ) ( not ( = ?auto_22497 ?auto_22498 ) ) ( not ( = ?auto_22508 ?auto_22497 ) ) ( not ( = ?auto_22508 ?auto_22498 ) ) ( not ( = ?auto_22501 ?auto_22506 ) ) ( HOIST-AT ?auto_22500 ?auto_22501 ) ( not ( = ?auto_22509 ?auto_22500 ) ) ( AVAILABLE ?auto_22500 ) ( SURFACE-AT ?auto_22498 ?auto_22501 ) ( ON ?auto_22498 ?auto_22502 ) ( CLEAR ?auto_22498 ) ( not ( = ?auto_22497 ?auto_22502 ) ) ( not ( = ?auto_22498 ?auto_22502 ) ) ( not ( = ?auto_22508 ?auto_22502 ) ) ( IS-CRATE ?auto_22497 ) ( not ( = ?auto_22505 ?auto_22506 ) ) ( not ( = ?auto_22501 ?auto_22505 ) ) ( HOIST-AT ?auto_22507 ?auto_22505 ) ( not ( = ?auto_22509 ?auto_22507 ) ) ( not ( = ?auto_22500 ?auto_22507 ) ) ( AVAILABLE ?auto_22507 ) ( SURFACE-AT ?auto_22497 ?auto_22505 ) ( ON ?auto_22497 ?auto_22503 ) ( CLEAR ?auto_22497 ) ( not ( = ?auto_22497 ?auto_22503 ) ) ( not ( = ?auto_22498 ?auto_22503 ) ) ( not ( = ?auto_22508 ?auto_22503 ) ) ( not ( = ?auto_22502 ?auto_22503 ) ) ( SURFACE-AT ?auto_22504 ?auto_22506 ) ( CLEAR ?auto_22504 ) ( IS-CRATE ?auto_22508 ) ( not ( = ?auto_22504 ?auto_22508 ) ) ( not ( = ?auto_22497 ?auto_22504 ) ) ( not ( = ?auto_22498 ?auto_22504 ) ) ( not ( = ?auto_22502 ?auto_22504 ) ) ( not ( = ?auto_22503 ?auto_22504 ) ) ( AVAILABLE ?auto_22509 ) ( IN ?auto_22508 ?auto_22499 ) ( TRUCK-AT ?auto_22499 ?auto_22510 ) ( not ( = ?auto_22510 ?auto_22506 ) ) ( not ( = ?auto_22501 ?auto_22510 ) ) ( not ( = ?auto_22505 ?auto_22510 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22499 ?auto_22510 ?auto_22506 )
      ( MAKE-2CRATE ?auto_22508 ?auto_22497 ?auto_22498 )
      ( MAKE-1CRATE-VERIFY ?auto_22497 ?auto_22498 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22511 - SURFACE
      ?auto_22512 - SURFACE
      ?auto_22513 - SURFACE
    )
    :vars
    (
      ?auto_22524 - HOIST
      ?auto_22522 - PLACE
      ?auto_22516 - PLACE
      ?auto_22517 - HOIST
      ?auto_22514 - SURFACE
      ?auto_22523 - PLACE
      ?auto_22519 - HOIST
      ?auto_22520 - SURFACE
      ?auto_22521 - SURFACE
      ?auto_22515 - TRUCK
      ?auto_22518 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22524 ?auto_22522 ) ( IS-CRATE ?auto_22513 ) ( not ( = ?auto_22512 ?auto_22513 ) ) ( not ( = ?auto_22511 ?auto_22512 ) ) ( not ( = ?auto_22511 ?auto_22513 ) ) ( not ( = ?auto_22516 ?auto_22522 ) ) ( HOIST-AT ?auto_22517 ?auto_22516 ) ( not ( = ?auto_22524 ?auto_22517 ) ) ( AVAILABLE ?auto_22517 ) ( SURFACE-AT ?auto_22513 ?auto_22516 ) ( ON ?auto_22513 ?auto_22514 ) ( CLEAR ?auto_22513 ) ( not ( = ?auto_22512 ?auto_22514 ) ) ( not ( = ?auto_22513 ?auto_22514 ) ) ( not ( = ?auto_22511 ?auto_22514 ) ) ( IS-CRATE ?auto_22512 ) ( not ( = ?auto_22523 ?auto_22522 ) ) ( not ( = ?auto_22516 ?auto_22523 ) ) ( HOIST-AT ?auto_22519 ?auto_22523 ) ( not ( = ?auto_22524 ?auto_22519 ) ) ( not ( = ?auto_22517 ?auto_22519 ) ) ( AVAILABLE ?auto_22519 ) ( SURFACE-AT ?auto_22512 ?auto_22523 ) ( ON ?auto_22512 ?auto_22520 ) ( CLEAR ?auto_22512 ) ( not ( = ?auto_22512 ?auto_22520 ) ) ( not ( = ?auto_22513 ?auto_22520 ) ) ( not ( = ?auto_22511 ?auto_22520 ) ) ( not ( = ?auto_22514 ?auto_22520 ) ) ( SURFACE-AT ?auto_22521 ?auto_22522 ) ( CLEAR ?auto_22521 ) ( IS-CRATE ?auto_22511 ) ( not ( = ?auto_22521 ?auto_22511 ) ) ( not ( = ?auto_22512 ?auto_22521 ) ) ( not ( = ?auto_22513 ?auto_22521 ) ) ( not ( = ?auto_22514 ?auto_22521 ) ) ( not ( = ?auto_22520 ?auto_22521 ) ) ( AVAILABLE ?auto_22524 ) ( IN ?auto_22511 ?auto_22515 ) ( TRUCK-AT ?auto_22515 ?auto_22518 ) ( not ( = ?auto_22518 ?auto_22522 ) ) ( not ( = ?auto_22516 ?auto_22518 ) ) ( not ( = ?auto_22523 ?auto_22518 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22512 ?auto_22513 )
      ( MAKE-2CRATE-VERIFY ?auto_22511 ?auto_22512 ?auto_22513 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22525 - SURFACE
      ?auto_22526 - SURFACE
      ?auto_22527 - SURFACE
      ?auto_22528 - SURFACE
    )
    :vars
    (
      ?auto_22529 - HOIST
      ?auto_22531 - PLACE
      ?auto_22530 - PLACE
      ?auto_22533 - HOIST
      ?auto_22536 - SURFACE
      ?auto_22532 - PLACE
      ?auto_22538 - HOIST
      ?auto_22534 - SURFACE
      ?auto_22537 - TRUCK
      ?auto_22535 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22529 ?auto_22531 ) ( IS-CRATE ?auto_22528 ) ( not ( = ?auto_22527 ?auto_22528 ) ) ( not ( = ?auto_22526 ?auto_22527 ) ) ( not ( = ?auto_22526 ?auto_22528 ) ) ( not ( = ?auto_22530 ?auto_22531 ) ) ( HOIST-AT ?auto_22533 ?auto_22530 ) ( not ( = ?auto_22529 ?auto_22533 ) ) ( AVAILABLE ?auto_22533 ) ( SURFACE-AT ?auto_22528 ?auto_22530 ) ( ON ?auto_22528 ?auto_22536 ) ( CLEAR ?auto_22528 ) ( not ( = ?auto_22527 ?auto_22536 ) ) ( not ( = ?auto_22528 ?auto_22536 ) ) ( not ( = ?auto_22526 ?auto_22536 ) ) ( IS-CRATE ?auto_22527 ) ( not ( = ?auto_22532 ?auto_22531 ) ) ( not ( = ?auto_22530 ?auto_22532 ) ) ( HOIST-AT ?auto_22538 ?auto_22532 ) ( not ( = ?auto_22529 ?auto_22538 ) ) ( not ( = ?auto_22533 ?auto_22538 ) ) ( AVAILABLE ?auto_22538 ) ( SURFACE-AT ?auto_22527 ?auto_22532 ) ( ON ?auto_22527 ?auto_22534 ) ( CLEAR ?auto_22527 ) ( not ( = ?auto_22527 ?auto_22534 ) ) ( not ( = ?auto_22528 ?auto_22534 ) ) ( not ( = ?auto_22526 ?auto_22534 ) ) ( not ( = ?auto_22536 ?auto_22534 ) ) ( SURFACE-AT ?auto_22525 ?auto_22531 ) ( CLEAR ?auto_22525 ) ( IS-CRATE ?auto_22526 ) ( not ( = ?auto_22525 ?auto_22526 ) ) ( not ( = ?auto_22527 ?auto_22525 ) ) ( not ( = ?auto_22528 ?auto_22525 ) ) ( not ( = ?auto_22536 ?auto_22525 ) ) ( not ( = ?auto_22534 ?auto_22525 ) ) ( AVAILABLE ?auto_22529 ) ( IN ?auto_22526 ?auto_22537 ) ( TRUCK-AT ?auto_22537 ?auto_22535 ) ( not ( = ?auto_22535 ?auto_22531 ) ) ( not ( = ?auto_22530 ?auto_22535 ) ) ( not ( = ?auto_22532 ?auto_22535 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22526 ?auto_22527 ?auto_22528 )
      ( MAKE-3CRATE-VERIFY ?auto_22525 ?auto_22526 ?auto_22527 ?auto_22528 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22539 - SURFACE
      ?auto_22540 - SURFACE
      ?auto_22541 - SURFACE
      ?auto_22542 - SURFACE
      ?auto_22543 - SURFACE
    )
    :vars
    (
      ?auto_22544 - HOIST
      ?auto_22546 - PLACE
      ?auto_22545 - PLACE
      ?auto_22548 - HOIST
      ?auto_22551 - SURFACE
      ?auto_22547 - PLACE
      ?auto_22553 - HOIST
      ?auto_22549 - SURFACE
      ?auto_22552 - TRUCK
      ?auto_22550 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22544 ?auto_22546 ) ( IS-CRATE ?auto_22543 ) ( not ( = ?auto_22542 ?auto_22543 ) ) ( not ( = ?auto_22541 ?auto_22542 ) ) ( not ( = ?auto_22541 ?auto_22543 ) ) ( not ( = ?auto_22545 ?auto_22546 ) ) ( HOIST-AT ?auto_22548 ?auto_22545 ) ( not ( = ?auto_22544 ?auto_22548 ) ) ( AVAILABLE ?auto_22548 ) ( SURFACE-AT ?auto_22543 ?auto_22545 ) ( ON ?auto_22543 ?auto_22551 ) ( CLEAR ?auto_22543 ) ( not ( = ?auto_22542 ?auto_22551 ) ) ( not ( = ?auto_22543 ?auto_22551 ) ) ( not ( = ?auto_22541 ?auto_22551 ) ) ( IS-CRATE ?auto_22542 ) ( not ( = ?auto_22547 ?auto_22546 ) ) ( not ( = ?auto_22545 ?auto_22547 ) ) ( HOIST-AT ?auto_22553 ?auto_22547 ) ( not ( = ?auto_22544 ?auto_22553 ) ) ( not ( = ?auto_22548 ?auto_22553 ) ) ( AVAILABLE ?auto_22553 ) ( SURFACE-AT ?auto_22542 ?auto_22547 ) ( ON ?auto_22542 ?auto_22549 ) ( CLEAR ?auto_22542 ) ( not ( = ?auto_22542 ?auto_22549 ) ) ( not ( = ?auto_22543 ?auto_22549 ) ) ( not ( = ?auto_22541 ?auto_22549 ) ) ( not ( = ?auto_22551 ?auto_22549 ) ) ( SURFACE-AT ?auto_22540 ?auto_22546 ) ( CLEAR ?auto_22540 ) ( IS-CRATE ?auto_22541 ) ( not ( = ?auto_22540 ?auto_22541 ) ) ( not ( = ?auto_22542 ?auto_22540 ) ) ( not ( = ?auto_22543 ?auto_22540 ) ) ( not ( = ?auto_22551 ?auto_22540 ) ) ( not ( = ?auto_22549 ?auto_22540 ) ) ( AVAILABLE ?auto_22544 ) ( IN ?auto_22541 ?auto_22552 ) ( TRUCK-AT ?auto_22552 ?auto_22550 ) ( not ( = ?auto_22550 ?auto_22546 ) ) ( not ( = ?auto_22545 ?auto_22550 ) ) ( not ( = ?auto_22547 ?auto_22550 ) ) ( ON ?auto_22540 ?auto_22539 ) ( not ( = ?auto_22539 ?auto_22540 ) ) ( not ( = ?auto_22539 ?auto_22541 ) ) ( not ( = ?auto_22539 ?auto_22542 ) ) ( not ( = ?auto_22539 ?auto_22543 ) ) ( not ( = ?auto_22539 ?auto_22551 ) ) ( not ( = ?auto_22539 ?auto_22549 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22541 ?auto_22542 ?auto_22543 )
      ( MAKE-4CRATE-VERIFY ?auto_22539 ?auto_22540 ?auto_22541 ?auto_22542 ?auto_22543 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22554 - SURFACE
      ?auto_22555 - SURFACE
      ?auto_22556 - SURFACE
      ?auto_22557 - SURFACE
      ?auto_22558 - SURFACE
      ?auto_22559 - SURFACE
    )
    :vars
    (
      ?auto_22560 - HOIST
      ?auto_22562 - PLACE
      ?auto_22561 - PLACE
      ?auto_22564 - HOIST
      ?auto_22567 - SURFACE
      ?auto_22563 - PLACE
      ?auto_22569 - HOIST
      ?auto_22565 - SURFACE
      ?auto_22568 - TRUCK
      ?auto_22566 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22560 ?auto_22562 ) ( IS-CRATE ?auto_22559 ) ( not ( = ?auto_22558 ?auto_22559 ) ) ( not ( = ?auto_22557 ?auto_22558 ) ) ( not ( = ?auto_22557 ?auto_22559 ) ) ( not ( = ?auto_22561 ?auto_22562 ) ) ( HOIST-AT ?auto_22564 ?auto_22561 ) ( not ( = ?auto_22560 ?auto_22564 ) ) ( AVAILABLE ?auto_22564 ) ( SURFACE-AT ?auto_22559 ?auto_22561 ) ( ON ?auto_22559 ?auto_22567 ) ( CLEAR ?auto_22559 ) ( not ( = ?auto_22558 ?auto_22567 ) ) ( not ( = ?auto_22559 ?auto_22567 ) ) ( not ( = ?auto_22557 ?auto_22567 ) ) ( IS-CRATE ?auto_22558 ) ( not ( = ?auto_22563 ?auto_22562 ) ) ( not ( = ?auto_22561 ?auto_22563 ) ) ( HOIST-AT ?auto_22569 ?auto_22563 ) ( not ( = ?auto_22560 ?auto_22569 ) ) ( not ( = ?auto_22564 ?auto_22569 ) ) ( AVAILABLE ?auto_22569 ) ( SURFACE-AT ?auto_22558 ?auto_22563 ) ( ON ?auto_22558 ?auto_22565 ) ( CLEAR ?auto_22558 ) ( not ( = ?auto_22558 ?auto_22565 ) ) ( not ( = ?auto_22559 ?auto_22565 ) ) ( not ( = ?auto_22557 ?auto_22565 ) ) ( not ( = ?auto_22567 ?auto_22565 ) ) ( SURFACE-AT ?auto_22556 ?auto_22562 ) ( CLEAR ?auto_22556 ) ( IS-CRATE ?auto_22557 ) ( not ( = ?auto_22556 ?auto_22557 ) ) ( not ( = ?auto_22558 ?auto_22556 ) ) ( not ( = ?auto_22559 ?auto_22556 ) ) ( not ( = ?auto_22567 ?auto_22556 ) ) ( not ( = ?auto_22565 ?auto_22556 ) ) ( AVAILABLE ?auto_22560 ) ( IN ?auto_22557 ?auto_22568 ) ( TRUCK-AT ?auto_22568 ?auto_22566 ) ( not ( = ?auto_22566 ?auto_22562 ) ) ( not ( = ?auto_22561 ?auto_22566 ) ) ( not ( = ?auto_22563 ?auto_22566 ) ) ( ON ?auto_22555 ?auto_22554 ) ( ON ?auto_22556 ?auto_22555 ) ( not ( = ?auto_22554 ?auto_22555 ) ) ( not ( = ?auto_22554 ?auto_22556 ) ) ( not ( = ?auto_22554 ?auto_22557 ) ) ( not ( = ?auto_22554 ?auto_22558 ) ) ( not ( = ?auto_22554 ?auto_22559 ) ) ( not ( = ?auto_22554 ?auto_22567 ) ) ( not ( = ?auto_22554 ?auto_22565 ) ) ( not ( = ?auto_22555 ?auto_22556 ) ) ( not ( = ?auto_22555 ?auto_22557 ) ) ( not ( = ?auto_22555 ?auto_22558 ) ) ( not ( = ?auto_22555 ?auto_22559 ) ) ( not ( = ?auto_22555 ?auto_22567 ) ) ( not ( = ?auto_22555 ?auto_22565 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22557 ?auto_22558 ?auto_22559 )
      ( MAKE-5CRATE-VERIFY ?auto_22554 ?auto_22555 ?auto_22556 ?auto_22557 ?auto_22558 ?auto_22559 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22570 - SURFACE
      ?auto_22571 - SURFACE
    )
    :vars
    (
      ?auto_22572 - HOIST
      ?auto_22574 - PLACE
      ?auto_22577 - SURFACE
      ?auto_22573 - PLACE
      ?auto_22576 - HOIST
      ?auto_22580 - SURFACE
      ?auto_22575 - PLACE
      ?auto_22583 - HOIST
      ?auto_22578 - SURFACE
      ?auto_22581 - SURFACE
      ?auto_22582 - TRUCK
      ?auto_22579 - PLACE
      ?auto_22584 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22572 ?auto_22574 ) ( IS-CRATE ?auto_22571 ) ( not ( = ?auto_22570 ?auto_22571 ) ) ( not ( = ?auto_22577 ?auto_22570 ) ) ( not ( = ?auto_22577 ?auto_22571 ) ) ( not ( = ?auto_22573 ?auto_22574 ) ) ( HOIST-AT ?auto_22576 ?auto_22573 ) ( not ( = ?auto_22572 ?auto_22576 ) ) ( AVAILABLE ?auto_22576 ) ( SURFACE-AT ?auto_22571 ?auto_22573 ) ( ON ?auto_22571 ?auto_22580 ) ( CLEAR ?auto_22571 ) ( not ( = ?auto_22570 ?auto_22580 ) ) ( not ( = ?auto_22571 ?auto_22580 ) ) ( not ( = ?auto_22577 ?auto_22580 ) ) ( IS-CRATE ?auto_22570 ) ( not ( = ?auto_22575 ?auto_22574 ) ) ( not ( = ?auto_22573 ?auto_22575 ) ) ( HOIST-AT ?auto_22583 ?auto_22575 ) ( not ( = ?auto_22572 ?auto_22583 ) ) ( not ( = ?auto_22576 ?auto_22583 ) ) ( AVAILABLE ?auto_22583 ) ( SURFACE-AT ?auto_22570 ?auto_22575 ) ( ON ?auto_22570 ?auto_22578 ) ( CLEAR ?auto_22570 ) ( not ( = ?auto_22570 ?auto_22578 ) ) ( not ( = ?auto_22571 ?auto_22578 ) ) ( not ( = ?auto_22577 ?auto_22578 ) ) ( not ( = ?auto_22580 ?auto_22578 ) ) ( SURFACE-AT ?auto_22581 ?auto_22574 ) ( CLEAR ?auto_22581 ) ( IS-CRATE ?auto_22577 ) ( not ( = ?auto_22581 ?auto_22577 ) ) ( not ( = ?auto_22570 ?auto_22581 ) ) ( not ( = ?auto_22571 ?auto_22581 ) ) ( not ( = ?auto_22580 ?auto_22581 ) ) ( not ( = ?auto_22578 ?auto_22581 ) ) ( AVAILABLE ?auto_22572 ) ( TRUCK-AT ?auto_22582 ?auto_22579 ) ( not ( = ?auto_22579 ?auto_22574 ) ) ( not ( = ?auto_22573 ?auto_22579 ) ) ( not ( = ?auto_22575 ?auto_22579 ) ) ( HOIST-AT ?auto_22584 ?auto_22579 ) ( LIFTING ?auto_22584 ?auto_22577 ) ( not ( = ?auto_22572 ?auto_22584 ) ) ( not ( = ?auto_22576 ?auto_22584 ) ) ( not ( = ?auto_22583 ?auto_22584 ) ) )
    :subtasks
    ( ( !LOAD ?auto_22584 ?auto_22577 ?auto_22582 ?auto_22579 )
      ( MAKE-2CRATE ?auto_22577 ?auto_22570 ?auto_22571 )
      ( MAKE-1CRATE-VERIFY ?auto_22570 ?auto_22571 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22585 - SURFACE
      ?auto_22586 - SURFACE
      ?auto_22587 - SURFACE
    )
    :vars
    (
      ?auto_22594 - HOIST
      ?auto_22588 - PLACE
      ?auto_22590 - PLACE
      ?auto_22589 - HOIST
      ?auto_22593 - SURFACE
      ?auto_22592 - PLACE
      ?auto_22598 - HOIST
      ?auto_22591 - SURFACE
      ?auto_22595 - SURFACE
      ?auto_22596 - TRUCK
      ?auto_22599 - PLACE
      ?auto_22597 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22594 ?auto_22588 ) ( IS-CRATE ?auto_22587 ) ( not ( = ?auto_22586 ?auto_22587 ) ) ( not ( = ?auto_22585 ?auto_22586 ) ) ( not ( = ?auto_22585 ?auto_22587 ) ) ( not ( = ?auto_22590 ?auto_22588 ) ) ( HOIST-AT ?auto_22589 ?auto_22590 ) ( not ( = ?auto_22594 ?auto_22589 ) ) ( AVAILABLE ?auto_22589 ) ( SURFACE-AT ?auto_22587 ?auto_22590 ) ( ON ?auto_22587 ?auto_22593 ) ( CLEAR ?auto_22587 ) ( not ( = ?auto_22586 ?auto_22593 ) ) ( not ( = ?auto_22587 ?auto_22593 ) ) ( not ( = ?auto_22585 ?auto_22593 ) ) ( IS-CRATE ?auto_22586 ) ( not ( = ?auto_22592 ?auto_22588 ) ) ( not ( = ?auto_22590 ?auto_22592 ) ) ( HOIST-AT ?auto_22598 ?auto_22592 ) ( not ( = ?auto_22594 ?auto_22598 ) ) ( not ( = ?auto_22589 ?auto_22598 ) ) ( AVAILABLE ?auto_22598 ) ( SURFACE-AT ?auto_22586 ?auto_22592 ) ( ON ?auto_22586 ?auto_22591 ) ( CLEAR ?auto_22586 ) ( not ( = ?auto_22586 ?auto_22591 ) ) ( not ( = ?auto_22587 ?auto_22591 ) ) ( not ( = ?auto_22585 ?auto_22591 ) ) ( not ( = ?auto_22593 ?auto_22591 ) ) ( SURFACE-AT ?auto_22595 ?auto_22588 ) ( CLEAR ?auto_22595 ) ( IS-CRATE ?auto_22585 ) ( not ( = ?auto_22595 ?auto_22585 ) ) ( not ( = ?auto_22586 ?auto_22595 ) ) ( not ( = ?auto_22587 ?auto_22595 ) ) ( not ( = ?auto_22593 ?auto_22595 ) ) ( not ( = ?auto_22591 ?auto_22595 ) ) ( AVAILABLE ?auto_22594 ) ( TRUCK-AT ?auto_22596 ?auto_22599 ) ( not ( = ?auto_22599 ?auto_22588 ) ) ( not ( = ?auto_22590 ?auto_22599 ) ) ( not ( = ?auto_22592 ?auto_22599 ) ) ( HOIST-AT ?auto_22597 ?auto_22599 ) ( LIFTING ?auto_22597 ?auto_22585 ) ( not ( = ?auto_22594 ?auto_22597 ) ) ( not ( = ?auto_22589 ?auto_22597 ) ) ( not ( = ?auto_22598 ?auto_22597 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22586 ?auto_22587 )
      ( MAKE-2CRATE-VERIFY ?auto_22585 ?auto_22586 ?auto_22587 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22600 - SURFACE
      ?auto_22601 - SURFACE
      ?auto_22602 - SURFACE
      ?auto_22603 - SURFACE
    )
    :vars
    (
      ?auto_22614 - HOIST
      ?auto_22608 - PLACE
      ?auto_22610 - PLACE
      ?auto_22611 - HOIST
      ?auto_22613 - SURFACE
      ?auto_22604 - PLACE
      ?auto_22605 - HOIST
      ?auto_22607 - SURFACE
      ?auto_22609 - TRUCK
      ?auto_22612 - PLACE
      ?auto_22606 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22614 ?auto_22608 ) ( IS-CRATE ?auto_22603 ) ( not ( = ?auto_22602 ?auto_22603 ) ) ( not ( = ?auto_22601 ?auto_22602 ) ) ( not ( = ?auto_22601 ?auto_22603 ) ) ( not ( = ?auto_22610 ?auto_22608 ) ) ( HOIST-AT ?auto_22611 ?auto_22610 ) ( not ( = ?auto_22614 ?auto_22611 ) ) ( AVAILABLE ?auto_22611 ) ( SURFACE-AT ?auto_22603 ?auto_22610 ) ( ON ?auto_22603 ?auto_22613 ) ( CLEAR ?auto_22603 ) ( not ( = ?auto_22602 ?auto_22613 ) ) ( not ( = ?auto_22603 ?auto_22613 ) ) ( not ( = ?auto_22601 ?auto_22613 ) ) ( IS-CRATE ?auto_22602 ) ( not ( = ?auto_22604 ?auto_22608 ) ) ( not ( = ?auto_22610 ?auto_22604 ) ) ( HOIST-AT ?auto_22605 ?auto_22604 ) ( not ( = ?auto_22614 ?auto_22605 ) ) ( not ( = ?auto_22611 ?auto_22605 ) ) ( AVAILABLE ?auto_22605 ) ( SURFACE-AT ?auto_22602 ?auto_22604 ) ( ON ?auto_22602 ?auto_22607 ) ( CLEAR ?auto_22602 ) ( not ( = ?auto_22602 ?auto_22607 ) ) ( not ( = ?auto_22603 ?auto_22607 ) ) ( not ( = ?auto_22601 ?auto_22607 ) ) ( not ( = ?auto_22613 ?auto_22607 ) ) ( SURFACE-AT ?auto_22600 ?auto_22608 ) ( CLEAR ?auto_22600 ) ( IS-CRATE ?auto_22601 ) ( not ( = ?auto_22600 ?auto_22601 ) ) ( not ( = ?auto_22602 ?auto_22600 ) ) ( not ( = ?auto_22603 ?auto_22600 ) ) ( not ( = ?auto_22613 ?auto_22600 ) ) ( not ( = ?auto_22607 ?auto_22600 ) ) ( AVAILABLE ?auto_22614 ) ( TRUCK-AT ?auto_22609 ?auto_22612 ) ( not ( = ?auto_22612 ?auto_22608 ) ) ( not ( = ?auto_22610 ?auto_22612 ) ) ( not ( = ?auto_22604 ?auto_22612 ) ) ( HOIST-AT ?auto_22606 ?auto_22612 ) ( LIFTING ?auto_22606 ?auto_22601 ) ( not ( = ?auto_22614 ?auto_22606 ) ) ( not ( = ?auto_22611 ?auto_22606 ) ) ( not ( = ?auto_22605 ?auto_22606 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22601 ?auto_22602 ?auto_22603 )
      ( MAKE-3CRATE-VERIFY ?auto_22600 ?auto_22601 ?auto_22602 ?auto_22603 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22615 - SURFACE
      ?auto_22616 - SURFACE
      ?auto_22617 - SURFACE
      ?auto_22618 - SURFACE
      ?auto_22619 - SURFACE
    )
    :vars
    (
      ?auto_22630 - HOIST
      ?auto_22624 - PLACE
      ?auto_22626 - PLACE
      ?auto_22627 - HOIST
      ?auto_22629 - SURFACE
      ?auto_22620 - PLACE
      ?auto_22621 - HOIST
      ?auto_22623 - SURFACE
      ?auto_22625 - TRUCK
      ?auto_22628 - PLACE
      ?auto_22622 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22630 ?auto_22624 ) ( IS-CRATE ?auto_22619 ) ( not ( = ?auto_22618 ?auto_22619 ) ) ( not ( = ?auto_22617 ?auto_22618 ) ) ( not ( = ?auto_22617 ?auto_22619 ) ) ( not ( = ?auto_22626 ?auto_22624 ) ) ( HOIST-AT ?auto_22627 ?auto_22626 ) ( not ( = ?auto_22630 ?auto_22627 ) ) ( AVAILABLE ?auto_22627 ) ( SURFACE-AT ?auto_22619 ?auto_22626 ) ( ON ?auto_22619 ?auto_22629 ) ( CLEAR ?auto_22619 ) ( not ( = ?auto_22618 ?auto_22629 ) ) ( not ( = ?auto_22619 ?auto_22629 ) ) ( not ( = ?auto_22617 ?auto_22629 ) ) ( IS-CRATE ?auto_22618 ) ( not ( = ?auto_22620 ?auto_22624 ) ) ( not ( = ?auto_22626 ?auto_22620 ) ) ( HOIST-AT ?auto_22621 ?auto_22620 ) ( not ( = ?auto_22630 ?auto_22621 ) ) ( not ( = ?auto_22627 ?auto_22621 ) ) ( AVAILABLE ?auto_22621 ) ( SURFACE-AT ?auto_22618 ?auto_22620 ) ( ON ?auto_22618 ?auto_22623 ) ( CLEAR ?auto_22618 ) ( not ( = ?auto_22618 ?auto_22623 ) ) ( not ( = ?auto_22619 ?auto_22623 ) ) ( not ( = ?auto_22617 ?auto_22623 ) ) ( not ( = ?auto_22629 ?auto_22623 ) ) ( SURFACE-AT ?auto_22616 ?auto_22624 ) ( CLEAR ?auto_22616 ) ( IS-CRATE ?auto_22617 ) ( not ( = ?auto_22616 ?auto_22617 ) ) ( not ( = ?auto_22618 ?auto_22616 ) ) ( not ( = ?auto_22619 ?auto_22616 ) ) ( not ( = ?auto_22629 ?auto_22616 ) ) ( not ( = ?auto_22623 ?auto_22616 ) ) ( AVAILABLE ?auto_22630 ) ( TRUCK-AT ?auto_22625 ?auto_22628 ) ( not ( = ?auto_22628 ?auto_22624 ) ) ( not ( = ?auto_22626 ?auto_22628 ) ) ( not ( = ?auto_22620 ?auto_22628 ) ) ( HOIST-AT ?auto_22622 ?auto_22628 ) ( LIFTING ?auto_22622 ?auto_22617 ) ( not ( = ?auto_22630 ?auto_22622 ) ) ( not ( = ?auto_22627 ?auto_22622 ) ) ( not ( = ?auto_22621 ?auto_22622 ) ) ( ON ?auto_22616 ?auto_22615 ) ( not ( = ?auto_22615 ?auto_22616 ) ) ( not ( = ?auto_22615 ?auto_22617 ) ) ( not ( = ?auto_22615 ?auto_22618 ) ) ( not ( = ?auto_22615 ?auto_22619 ) ) ( not ( = ?auto_22615 ?auto_22629 ) ) ( not ( = ?auto_22615 ?auto_22623 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22617 ?auto_22618 ?auto_22619 )
      ( MAKE-4CRATE-VERIFY ?auto_22615 ?auto_22616 ?auto_22617 ?auto_22618 ?auto_22619 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22631 - SURFACE
      ?auto_22632 - SURFACE
      ?auto_22633 - SURFACE
      ?auto_22634 - SURFACE
      ?auto_22635 - SURFACE
      ?auto_22636 - SURFACE
    )
    :vars
    (
      ?auto_22647 - HOIST
      ?auto_22641 - PLACE
      ?auto_22643 - PLACE
      ?auto_22644 - HOIST
      ?auto_22646 - SURFACE
      ?auto_22637 - PLACE
      ?auto_22638 - HOIST
      ?auto_22640 - SURFACE
      ?auto_22642 - TRUCK
      ?auto_22645 - PLACE
      ?auto_22639 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22647 ?auto_22641 ) ( IS-CRATE ?auto_22636 ) ( not ( = ?auto_22635 ?auto_22636 ) ) ( not ( = ?auto_22634 ?auto_22635 ) ) ( not ( = ?auto_22634 ?auto_22636 ) ) ( not ( = ?auto_22643 ?auto_22641 ) ) ( HOIST-AT ?auto_22644 ?auto_22643 ) ( not ( = ?auto_22647 ?auto_22644 ) ) ( AVAILABLE ?auto_22644 ) ( SURFACE-AT ?auto_22636 ?auto_22643 ) ( ON ?auto_22636 ?auto_22646 ) ( CLEAR ?auto_22636 ) ( not ( = ?auto_22635 ?auto_22646 ) ) ( not ( = ?auto_22636 ?auto_22646 ) ) ( not ( = ?auto_22634 ?auto_22646 ) ) ( IS-CRATE ?auto_22635 ) ( not ( = ?auto_22637 ?auto_22641 ) ) ( not ( = ?auto_22643 ?auto_22637 ) ) ( HOIST-AT ?auto_22638 ?auto_22637 ) ( not ( = ?auto_22647 ?auto_22638 ) ) ( not ( = ?auto_22644 ?auto_22638 ) ) ( AVAILABLE ?auto_22638 ) ( SURFACE-AT ?auto_22635 ?auto_22637 ) ( ON ?auto_22635 ?auto_22640 ) ( CLEAR ?auto_22635 ) ( not ( = ?auto_22635 ?auto_22640 ) ) ( not ( = ?auto_22636 ?auto_22640 ) ) ( not ( = ?auto_22634 ?auto_22640 ) ) ( not ( = ?auto_22646 ?auto_22640 ) ) ( SURFACE-AT ?auto_22633 ?auto_22641 ) ( CLEAR ?auto_22633 ) ( IS-CRATE ?auto_22634 ) ( not ( = ?auto_22633 ?auto_22634 ) ) ( not ( = ?auto_22635 ?auto_22633 ) ) ( not ( = ?auto_22636 ?auto_22633 ) ) ( not ( = ?auto_22646 ?auto_22633 ) ) ( not ( = ?auto_22640 ?auto_22633 ) ) ( AVAILABLE ?auto_22647 ) ( TRUCK-AT ?auto_22642 ?auto_22645 ) ( not ( = ?auto_22645 ?auto_22641 ) ) ( not ( = ?auto_22643 ?auto_22645 ) ) ( not ( = ?auto_22637 ?auto_22645 ) ) ( HOIST-AT ?auto_22639 ?auto_22645 ) ( LIFTING ?auto_22639 ?auto_22634 ) ( not ( = ?auto_22647 ?auto_22639 ) ) ( not ( = ?auto_22644 ?auto_22639 ) ) ( not ( = ?auto_22638 ?auto_22639 ) ) ( ON ?auto_22632 ?auto_22631 ) ( ON ?auto_22633 ?auto_22632 ) ( not ( = ?auto_22631 ?auto_22632 ) ) ( not ( = ?auto_22631 ?auto_22633 ) ) ( not ( = ?auto_22631 ?auto_22634 ) ) ( not ( = ?auto_22631 ?auto_22635 ) ) ( not ( = ?auto_22631 ?auto_22636 ) ) ( not ( = ?auto_22631 ?auto_22646 ) ) ( not ( = ?auto_22631 ?auto_22640 ) ) ( not ( = ?auto_22632 ?auto_22633 ) ) ( not ( = ?auto_22632 ?auto_22634 ) ) ( not ( = ?auto_22632 ?auto_22635 ) ) ( not ( = ?auto_22632 ?auto_22636 ) ) ( not ( = ?auto_22632 ?auto_22646 ) ) ( not ( = ?auto_22632 ?auto_22640 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22634 ?auto_22635 ?auto_22636 )
      ( MAKE-5CRATE-VERIFY ?auto_22631 ?auto_22632 ?auto_22633 ?auto_22634 ?auto_22635 ?auto_22636 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22648 - SURFACE
      ?auto_22649 - SURFACE
    )
    :vars
    (
      ?auto_22662 - HOIST
      ?auto_22654 - PLACE
      ?auto_22657 - SURFACE
      ?auto_22658 - PLACE
      ?auto_22659 - HOIST
      ?auto_22661 - SURFACE
      ?auto_22650 - PLACE
      ?auto_22651 - HOIST
      ?auto_22653 - SURFACE
      ?auto_22655 - SURFACE
      ?auto_22656 - TRUCK
      ?auto_22660 - PLACE
      ?auto_22652 - HOIST
      ?auto_22663 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22662 ?auto_22654 ) ( IS-CRATE ?auto_22649 ) ( not ( = ?auto_22648 ?auto_22649 ) ) ( not ( = ?auto_22657 ?auto_22648 ) ) ( not ( = ?auto_22657 ?auto_22649 ) ) ( not ( = ?auto_22658 ?auto_22654 ) ) ( HOIST-AT ?auto_22659 ?auto_22658 ) ( not ( = ?auto_22662 ?auto_22659 ) ) ( AVAILABLE ?auto_22659 ) ( SURFACE-AT ?auto_22649 ?auto_22658 ) ( ON ?auto_22649 ?auto_22661 ) ( CLEAR ?auto_22649 ) ( not ( = ?auto_22648 ?auto_22661 ) ) ( not ( = ?auto_22649 ?auto_22661 ) ) ( not ( = ?auto_22657 ?auto_22661 ) ) ( IS-CRATE ?auto_22648 ) ( not ( = ?auto_22650 ?auto_22654 ) ) ( not ( = ?auto_22658 ?auto_22650 ) ) ( HOIST-AT ?auto_22651 ?auto_22650 ) ( not ( = ?auto_22662 ?auto_22651 ) ) ( not ( = ?auto_22659 ?auto_22651 ) ) ( AVAILABLE ?auto_22651 ) ( SURFACE-AT ?auto_22648 ?auto_22650 ) ( ON ?auto_22648 ?auto_22653 ) ( CLEAR ?auto_22648 ) ( not ( = ?auto_22648 ?auto_22653 ) ) ( not ( = ?auto_22649 ?auto_22653 ) ) ( not ( = ?auto_22657 ?auto_22653 ) ) ( not ( = ?auto_22661 ?auto_22653 ) ) ( SURFACE-AT ?auto_22655 ?auto_22654 ) ( CLEAR ?auto_22655 ) ( IS-CRATE ?auto_22657 ) ( not ( = ?auto_22655 ?auto_22657 ) ) ( not ( = ?auto_22648 ?auto_22655 ) ) ( not ( = ?auto_22649 ?auto_22655 ) ) ( not ( = ?auto_22661 ?auto_22655 ) ) ( not ( = ?auto_22653 ?auto_22655 ) ) ( AVAILABLE ?auto_22662 ) ( TRUCK-AT ?auto_22656 ?auto_22660 ) ( not ( = ?auto_22660 ?auto_22654 ) ) ( not ( = ?auto_22658 ?auto_22660 ) ) ( not ( = ?auto_22650 ?auto_22660 ) ) ( HOIST-AT ?auto_22652 ?auto_22660 ) ( not ( = ?auto_22662 ?auto_22652 ) ) ( not ( = ?auto_22659 ?auto_22652 ) ) ( not ( = ?auto_22651 ?auto_22652 ) ) ( AVAILABLE ?auto_22652 ) ( SURFACE-AT ?auto_22657 ?auto_22660 ) ( ON ?auto_22657 ?auto_22663 ) ( CLEAR ?auto_22657 ) ( not ( = ?auto_22648 ?auto_22663 ) ) ( not ( = ?auto_22649 ?auto_22663 ) ) ( not ( = ?auto_22657 ?auto_22663 ) ) ( not ( = ?auto_22661 ?auto_22663 ) ) ( not ( = ?auto_22653 ?auto_22663 ) ) ( not ( = ?auto_22655 ?auto_22663 ) ) )
    :subtasks
    ( ( !LIFT ?auto_22652 ?auto_22657 ?auto_22663 ?auto_22660 )
      ( MAKE-2CRATE ?auto_22657 ?auto_22648 ?auto_22649 )
      ( MAKE-1CRATE-VERIFY ?auto_22648 ?auto_22649 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22664 - SURFACE
      ?auto_22665 - SURFACE
      ?auto_22666 - SURFACE
    )
    :vars
    (
      ?auto_22675 - HOIST
      ?auto_22674 - PLACE
      ?auto_22677 - PLACE
      ?auto_22673 - HOIST
      ?auto_22667 - SURFACE
      ?auto_22669 - PLACE
      ?auto_22670 - HOIST
      ?auto_22676 - SURFACE
      ?auto_22672 - SURFACE
      ?auto_22679 - TRUCK
      ?auto_22678 - PLACE
      ?auto_22671 - HOIST
      ?auto_22668 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22675 ?auto_22674 ) ( IS-CRATE ?auto_22666 ) ( not ( = ?auto_22665 ?auto_22666 ) ) ( not ( = ?auto_22664 ?auto_22665 ) ) ( not ( = ?auto_22664 ?auto_22666 ) ) ( not ( = ?auto_22677 ?auto_22674 ) ) ( HOIST-AT ?auto_22673 ?auto_22677 ) ( not ( = ?auto_22675 ?auto_22673 ) ) ( AVAILABLE ?auto_22673 ) ( SURFACE-AT ?auto_22666 ?auto_22677 ) ( ON ?auto_22666 ?auto_22667 ) ( CLEAR ?auto_22666 ) ( not ( = ?auto_22665 ?auto_22667 ) ) ( not ( = ?auto_22666 ?auto_22667 ) ) ( not ( = ?auto_22664 ?auto_22667 ) ) ( IS-CRATE ?auto_22665 ) ( not ( = ?auto_22669 ?auto_22674 ) ) ( not ( = ?auto_22677 ?auto_22669 ) ) ( HOIST-AT ?auto_22670 ?auto_22669 ) ( not ( = ?auto_22675 ?auto_22670 ) ) ( not ( = ?auto_22673 ?auto_22670 ) ) ( AVAILABLE ?auto_22670 ) ( SURFACE-AT ?auto_22665 ?auto_22669 ) ( ON ?auto_22665 ?auto_22676 ) ( CLEAR ?auto_22665 ) ( not ( = ?auto_22665 ?auto_22676 ) ) ( not ( = ?auto_22666 ?auto_22676 ) ) ( not ( = ?auto_22664 ?auto_22676 ) ) ( not ( = ?auto_22667 ?auto_22676 ) ) ( SURFACE-AT ?auto_22672 ?auto_22674 ) ( CLEAR ?auto_22672 ) ( IS-CRATE ?auto_22664 ) ( not ( = ?auto_22672 ?auto_22664 ) ) ( not ( = ?auto_22665 ?auto_22672 ) ) ( not ( = ?auto_22666 ?auto_22672 ) ) ( not ( = ?auto_22667 ?auto_22672 ) ) ( not ( = ?auto_22676 ?auto_22672 ) ) ( AVAILABLE ?auto_22675 ) ( TRUCK-AT ?auto_22679 ?auto_22678 ) ( not ( = ?auto_22678 ?auto_22674 ) ) ( not ( = ?auto_22677 ?auto_22678 ) ) ( not ( = ?auto_22669 ?auto_22678 ) ) ( HOIST-AT ?auto_22671 ?auto_22678 ) ( not ( = ?auto_22675 ?auto_22671 ) ) ( not ( = ?auto_22673 ?auto_22671 ) ) ( not ( = ?auto_22670 ?auto_22671 ) ) ( AVAILABLE ?auto_22671 ) ( SURFACE-AT ?auto_22664 ?auto_22678 ) ( ON ?auto_22664 ?auto_22668 ) ( CLEAR ?auto_22664 ) ( not ( = ?auto_22665 ?auto_22668 ) ) ( not ( = ?auto_22666 ?auto_22668 ) ) ( not ( = ?auto_22664 ?auto_22668 ) ) ( not ( = ?auto_22667 ?auto_22668 ) ) ( not ( = ?auto_22676 ?auto_22668 ) ) ( not ( = ?auto_22672 ?auto_22668 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22665 ?auto_22666 )
      ( MAKE-2CRATE-VERIFY ?auto_22664 ?auto_22665 ?auto_22666 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22680 - SURFACE
      ?auto_22681 - SURFACE
      ?auto_22682 - SURFACE
      ?auto_22683 - SURFACE
    )
    :vars
    (
      ?auto_22689 - HOIST
      ?auto_22690 - PLACE
      ?auto_22686 - PLACE
      ?auto_22691 - HOIST
      ?auto_22688 - SURFACE
      ?auto_22684 - PLACE
      ?auto_22695 - HOIST
      ?auto_22692 - SURFACE
      ?auto_22693 - TRUCK
      ?auto_22685 - PLACE
      ?auto_22694 - HOIST
      ?auto_22687 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22689 ?auto_22690 ) ( IS-CRATE ?auto_22683 ) ( not ( = ?auto_22682 ?auto_22683 ) ) ( not ( = ?auto_22681 ?auto_22682 ) ) ( not ( = ?auto_22681 ?auto_22683 ) ) ( not ( = ?auto_22686 ?auto_22690 ) ) ( HOIST-AT ?auto_22691 ?auto_22686 ) ( not ( = ?auto_22689 ?auto_22691 ) ) ( AVAILABLE ?auto_22691 ) ( SURFACE-AT ?auto_22683 ?auto_22686 ) ( ON ?auto_22683 ?auto_22688 ) ( CLEAR ?auto_22683 ) ( not ( = ?auto_22682 ?auto_22688 ) ) ( not ( = ?auto_22683 ?auto_22688 ) ) ( not ( = ?auto_22681 ?auto_22688 ) ) ( IS-CRATE ?auto_22682 ) ( not ( = ?auto_22684 ?auto_22690 ) ) ( not ( = ?auto_22686 ?auto_22684 ) ) ( HOIST-AT ?auto_22695 ?auto_22684 ) ( not ( = ?auto_22689 ?auto_22695 ) ) ( not ( = ?auto_22691 ?auto_22695 ) ) ( AVAILABLE ?auto_22695 ) ( SURFACE-AT ?auto_22682 ?auto_22684 ) ( ON ?auto_22682 ?auto_22692 ) ( CLEAR ?auto_22682 ) ( not ( = ?auto_22682 ?auto_22692 ) ) ( not ( = ?auto_22683 ?auto_22692 ) ) ( not ( = ?auto_22681 ?auto_22692 ) ) ( not ( = ?auto_22688 ?auto_22692 ) ) ( SURFACE-AT ?auto_22680 ?auto_22690 ) ( CLEAR ?auto_22680 ) ( IS-CRATE ?auto_22681 ) ( not ( = ?auto_22680 ?auto_22681 ) ) ( not ( = ?auto_22682 ?auto_22680 ) ) ( not ( = ?auto_22683 ?auto_22680 ) ) ( not ( = ?auto_22688 ?auto_22680 ) ) ( not ( = ?auto_22692 ?auto_22680 ) ) ( AVAILABLE ?auto_22689 ) ( TRUCK-AT ?auto_22693 ?auto_22685 ) ( not ( = ?auto_22685 ?auto_22690 ) ) ( not ( = ?auto_22686 ?auto_22685 ) ) ( not ( = ?auto_22684 ?auto_22685 ) ) ( HOIST-AT ?auto_22694 ?auto_22685 ) ( not ( = ?auto_22689 ?auto_22694 ) ) ( not ( = ?auto_22691 ?auto_22694 ) ) ( not ( = ?auto_22695 ?auto_22694 ) ) ( AVAILABLE ?auto_22694 ) ( SURFACE-AT ?auto_22681 ?auto_22685 ) ( ON ?auto_22681 ?auto_22687 ) ( CLEAR ?auto_22681 ) ( not ( = ?auto_22682 ?auto_22687 ) ) ( not ( = ?auto_22683 ?auto_22687 ) ) ( not ( = ?auto_22681 ?auto_22687 ) ) ( not ( = ?auto_22688 ?auto_22687 ) ) ( not ( = ?auto_22692 ?auto_22687 ) ) ( not ( = ?auto_22680 ?auto_22687 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22681 ?auto_22682 ?auto_22683 )
      ( MAKE-3CRATE-VERIFY ?auto_22680 ?auto_22681 ?auto_22682 ?auto_22683 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22696 - SURFACE
      ?auto_22697 - SURFACE
      ?auto_22698 - SURFACE
      ?auto_22699 - SURFACE
      ?auto_22700 - SURFACE
    )
    :vars
    (
      ?auto_22706 - HOIST
      ?auto_22707 - PLACE
      ?auto_22703 - PLACE
      ?auto_22708 - HOIST
      ?auto_22705 - SURFACE
      ?auto_22701 - PLACE
      ?auto_22712 - HOIST
      ?auto_22709 - SURFACE
      ?auto_22710 - TRUCK
      ?auto_22702 - PLACE
      ?auto_22711 - HOIST
      ?auto_22704 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22706 ?auto_22707 ) ( IS-CRATE ?auto_22700 ) ( not ( = ?auto_22699 ?auto_22700 ) ) ( not ( = ?auto_22698 ?auto_22699 ) ) ( not ( = ?auto_22698 ?auto_22700 ) ) ( not ( = ?auto_22703 ?auto_22707 ) ) ( HOIST-AT ?auto_22708 ?auto_22703 ) ( not ( = ?auto_22706 ?auto_22708 ) ) ( AVAILABLE ?auto_22708 ) ( SURFACE-AT ?auto_22700 ?auto_22703 ) ( ON ?auto_22700 ?auto_22705 ) ( CLEAR ?auto_22700 ) ( not ( = ?auto_22699 ?auto_22705 ) ) ( not ( = ?auto_22700 ?auto_22705 ) ) ( not ( = ?auto_22698 ?auto_22705 ) ) ( IS-CRATE ?auto_22699 ) ( not ( = ?auto_22701 ?auto_22707 ) ) ( not ( = ?auto_22703 ?auto_22701 ) ) ( HOIST-AT ?auto_22712 ?auto_22701 ) ( not ( = ?auto_22706 ?auto_22712 ) ) ( not ( = ?auto_22708 ?auto_22712 ) ) ( AVAILABLE ?auto_22712 ) ( SURFACE-AT ?auto_22699 ?auto_22701 ) ( ON ?auto_22699 ?auto_22709 ) ( CLEAR ?auto_22699 ) ( not ( = ?auto_22699 ?auto_22709 ) ) ( not ( = ?auto_22700 ?auto_22709 ) ) ( not ( = ?auto_22698 ?auto_22709 ) ) ( not ( = ?auto_22705 ?auto_22709 ) ) ( SURFACE-AT ?auto_22697 ?auto_22707 ) ( CLEAR ?auto_22697 ) ( IS-CRATE ?auto_22698 ) ( not ( = ?auto_22697 ?auto_22698 ) ) ( not ( = ?auto_22699 ?auto_22697 ) ) ( not ( = ?auto_22700 ?auto_22697 ) ) ( not ( = ?auto_22705 ?auto_22697 ) ) ( not ( = ?auto_22709 ?auto_22697 ) ) ( AVAILABLE ?auto_22706 ) ( TRUCK-AT ?auto_22710 ?auto_22702 ) ( not ( = ?auto_22702 ?auto_22707 ) ) ( not ( = ?auto_22703 ?auto_22702 ) ) ( not ( = ?auto_22701 ?auto_22702 ) ) ( HOIST-AT ?auto_22711 ?auto_22702 ) ( not ( = ?auto_22706 ?auto_22711 ) ) ( not ( = ?auto_22708 ?auto_22711 ) ) ( not ( = ?auto_22712 ?auto_22711 ) ) ( AVAILABLE ?auto_22711 ) ( SURFACE-AT ?auto_22698 ?auto_22702 ) ( ON ?auto_22698 ?auto_22704 ) ( CLEAR ?auto_22698 ) ( not ( = ?auto_22699 ?auto_22704 ) ) ( not ( = ?auto_22700 ?auto_22704 ) ) ( not ( = ?auto_22698 ?auto_22704 ) ) ( not ( = ?auto_22705 ?auto_22704 ) ) ( not ( = ?auto_22709 ?auto_22704 ) ) ( not ( = ?auto_22697 ?auto_22704 ) ) ( ON ?auto_22697 ?auto_22696 ) ( not ( = ?auto_22696 ?auto_22697 ) ) ( not ( = ?auto_22696 ?auto_22698 ) ) ( not ( = ?auto_22696 ?auto_22699 ) ) ( not ( = ?auto_22696 ?auto_22700 ) ) ( not ( = ?auto_22696 ?auto_22705 ) ) ( not ( = ?auto_22696 ?auto_22709 ) ) ( not ( = ?auto_22696 ?auto_22704 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22698 ?auto_22699 ?auto_22700 )
      ( MAKE-4CRATE-VERIFY ?auto_22696 ?auto_22697 ?auto_22698 ?auto_22699 ?auto_22700 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22713 - SURFACE
      ?auto_22714 - SURFACE
      ?auto_22715 - SURFACE
      ?auto_22716 - SURFACE
      ?auto_22717 - SURFACE
      ?auto_22718 - SURFACE
    )
    :vars
    (
      ?auto_22724 - HOIST
      ?auto_22725 - PLACE
      ?auto_22721 - PLACE
      ?auto_22726 - HOIST
      ?auto_22723 - SURFACE
      ?auto_22719 - PLACE
      ?auto_22730 - HOIST
      ?auto_22727 - SURFACE
      ?auto_22728 - TRUCK
      ?auto_22720 - PLACE
      ?auto_22729 - HOIST
      ?auto_22722 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22724 ?auto_22725 ) ( IS-CRATE ?auto_22718 ) ( not ( = ?auto_22717 ?auto_22718 ) ) ( not ( = ?auto_22716 ?auto_22717 ) ) ( not ( = ?auto_22716 ?auto_22718 ) ) ( not ( = ?auto_22721 ?auto_22725 ) ) ( HOIST-AT ?auto_22726 ?auto_22721 ) ( not ( = ?auto_22724 ?auto_22726 ) ) ( AVAILABLE ?auto_22726 ) ( SURFACE-AT ?auto_22718 ?auto_22721 ) ( ON ?auto_22718 ?auto_22723 ) ( CLEAR ?auto_22718 ) ( not ( = ?auto_22717 ?auto_22723 ) ) ( not ( = ?auto_22718 ?auto_22723 ) ) ( not ( = ?auto_22716 ?auto_22723 ) ) ( IS-CRATE ?auto_22717 ) ( not ( = ?auto_22719 ?auto_22725 ) ) ( not ( = ?auto_22721 ?auto_22719 ) ) ( HOIST-AT ?auto_22730 ?auto_22719 ) ( not ( = ?auto_22724 ?auto_22730 ) ) ( not ( = ?auto_22726 ?auto_22730 ) ) ( AVAILABLE ?auto_22730 ) ( SURFACE-AT ?auto_22717 ?auto_22719 ) ( ON ?auto_22717 ?auto_22727 ) ( CLEAR ?auto_22717 ) ( not ( = ?auto_22717 ?auto_22727 ) ) ( not ( = ?auto_22718 ?auto_22727 ) ) ( not ( = ?auto_22716 ?auto_22727 ) ) ( not ( = ?auto_22723 ?auto_22727 ) ) ( SURFACE-AT ?auto_22715 ?auto_22725 ) ( CLEAR ?auto_22715 ) ( IS-CRATE ?auto_22716 ) ( not ( = ?auto_22715 ?auto_22716 ) ) ( not ( = ?auto_22717 ?auto_22715 ) ) ( not ( = ?auto_22718 ?auto_22715 ) ) ( not ( = ?auto_22723 ?auto_22715 ) ) ( not ( = ?auto_22727 ?auto_22715 ) ) ( AVAILABLE ?auto_22724 ) ( TRUCK-AT ?auto_22728 ?auto_22720 ) ( not ( = ?auto_22720 ?auto_22725 ) ) ( not ( = ?auto_22721 ?auto_22720 ) ) ( not ( = ?auto_22719 ?auto_22720 ) ) ( HOIST-AT ?auto_22729 ?auto_22720 ) ( not ( = ?auto_22724 ?auto_22729 ) ) ( not ( = ?auto_22726 ?auto_22729 ) ) ( not ( = ?auto_22730 ?auto_22729 ) ) ( AVAILABLE ?auto_22729 ) ( SURFACE-AT ?auto_22716 ?auto_22720 ) ( ON ?auto_22716 ?auto_22722 ) ( CLEAR ?auto_22716 ) ( not ( = ?auto_22717 ?auto_22722 ) ) ( not ( = ?auto_22718 ?auto_22722 ) ) ( not ( = ?auto_22716 ?auto_22722 ) ) ( not ( = ?auto_22723 ?auto_22722 ) ) ( not ( = ?auto_22727 ?auto_22722 ) ) ( not ( = ?auto_22715 ?auto_22722 ) ) ( ON ?auto_22714 ?auto_22713 ) ( ON ?auto_22715 ?auto_22714 ) ( not ( = ?auto_22713 ?auto_22714 ) ) ( not ( = ?auto_22713 ?auto_22715 ) ) ( not ( = ?auto_22713 ?auto_22716 ) ) ( not ( = ?auto_22713 ?auto_22717 ) ) ( not ( = ?auto_22713 ?auto_22718 ) ) ( not ( = ?auto_22713 ?auto_22723 ) ) ( not ( = ?auto_22713 ?auto_22727 ) ) ( not ( = ?auto_22713 ?auto_22722 ) ) ( not ( = ?auto_22714 ?auto_22715 ) ) ( not ( = ?auto_22714 ?auto_22716 ) ) ( not ( = ?auto_22714 ?auto_22717 ) ) ( not ( = ?auto_22714 ?auto_22718 ) ) ( not ( = ?auto_22714 ?auto_22723 ) ) ( not ( = ?auto_22714 ?auto_22727 ) ) ( not ( = ?auto_22714 ?auto_22722 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22716 ?auto_22717 ?auto_22718 )
      ( MAKE-5CRATE-VERIFY ?auto_22713 ?auto_22714 ?auto_22715 ?auto_22716 ?auto_22717 ?auto_22718 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22731 - SURFACE
      ?auto_22732 - SURFACE
    )
    :vars
    (
      ?auto_22739 - HOIST
      ?auto_22740 - PLACE
      ?auto_22733 - SURFACE
      ?auto_22736 - PLACE
      ?auto_22741 - HOIST
      ?auto_22738 - SURFACE
      ?auto_22734 - PLACE
      ?auto_22746 - HOIST
      ?auto_22742 - SURFACE
      ?auto_22744 - SURFACE
      ?auto_22735 - PLACE
      ?auto_22745 - HOIST
      ?auto_22737 - SURFACE
      ?auto_22743 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22739 ?auto_22740 ) ( IS-CRATE ?auto_22732 ) ( not ( = ?auto_22731 ?auto_22732 ) ) ( not ( = ?auto_22733 ?auto_22731 ) ) ( not ( = ?auto_22733 ?auto_22732 ) ) ( not ( = ?auto_22736 ?auto_22740 ) ) ( HOIST-AT ?auto_22741 ?auto_22736 ) ( not ( = ?auto_22739 ?auto_22741 ) ) ( AVAILABLE ?auto_22741 ) ( SURFACE-AT ?auto_22732 ?auto_22736 ) ( ON ?auto_22732 ?auto_22738 ) ( CLEAR ?auto_22732 ) ( not ( = ?auto_22731 ?auto_22738 ) ) ( not ( = ?auto_22732 ?auto_22738 ) ) ( not ( = ?auto_22733 ?auto_22738 ) ) ( IS-CRATE ?auto_22731 ) ( not ( = ?auto_22734 ?auto_22740 ) ) ( not ( = ?auto_22736 ?auto_22734 ) ) ( HOIST-AT ?auto_22746 ?auto_22734 ) ( not ( = ?auto_22739 ?auto_22746 ) ) ( not ( = ?auto_22741 ?auto_22746 ) ) ( AVAILABLE ?auto_22746 ) ( SURFACE-AT ?auto_22731 ?auto_22734 ) ( ON ?auto_22731 ?auto_22742 ) ( CLEAR ?auto_22731 ) ( not ( = ?auto_22731 ?auto_22742 ) ) ( not ( = ?auto_22732 ?auto_22742 ) ) ( not ( = ?auto_22733 ?auto_22742 ) ) ( not ( = ?auto_22738 ?auto_22742 ) ) ( SURFACE-AT ?auto_22744 ?auto_22740 ) ( CLEAR ?auto_22744 ) ( IS-CRATE ?auto_22733 ) ( not ( = ?auto_22744 ?auto_22733 ) ) ( not ( = ?auto_22731 ?auto_22744 ) ) ( not ( = ?auto_22732 ?auto_22744 ) ) ( not ( = ?auto_22738 ?auto_22744 ) ) ( not ( = ?auto_22742 ?auto_22744 ) ) ( AVAILABLE ?auto_22739 ) ( not ( = ?auto_22735 ?auto_22740 ) ) ( not ( = ?auto_22736 ?auto_22735 ) ) ( not ( = ?auto_22734 ?auto_22735 ) ) ( HOIST-AT ?auto_22745 ?auto_22735 ) ( not ( = ?auto_22739 ?auto_22745 ) ) ( not ( = ?auto_22741 ?auto_22745 ) ) ( not ( = ?auto_22746 ?auto_22745 ) ) ( AVAILABLE ?auto_22745 ) ( SURFACE-AT ?auto_22733 ?auto_22735 ) ( ON ?auto_22733 ?auto_22737 ) ( CLEAR ?auto_22733 ) ( not ( = ?auto_22731 ?auto_22737 ) ) ( not ( = ?auto_22732 ?auto_22737 ) ) ( not ( = ?auto_22733 ?auto_22737 ) ) ( not ( = ?auto_22738 ?auto_22737 ) ) ( not ( = ?auto_22742 ?auto_22737 ) ) ( not ( = ?auto_22744 ?auto_22737 ) ) ( TRUCK-AT ?auto_22743 ?auto_22740 ) )
    :subtasks
    ( ( !DRIVE ?auto_22743 ?auto_22740 ?auto_22735 )
      ( MAKE-2CRATE ?auto_22733 ?auto_22731 ?auto_22732 )
      ( MAKE-1CRATE-VERIFY ?auto_22731 ?auto_22732 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22747 - SURFACE
      ?auto_22748 - SURFACE
      ?auto_22749 - SURFACE
    )
    :vars
    (
      ?auto_22762 - HOIST
      ?auto_22752 - PLACE
      ?auto_22753 - PLACE
      ?auto_22758 - HOIST
      ?auto_22756 - SURFACE
      ?auto_22755 - PLACE
      ?auto_22759 - HOIST
      ?auto_22760 - SURFACE
      ?auto_22750 - SURFACE
      ?auto_22751 - PLACE
      ?auto_22754 - HOIST
      ?auto_22761 - SURFACE
      ?auto_22757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22762 ?auto_22752 ) ( IS-CRATE ?auto_22749 ) ( not ( = ?auto_22748 ?auto_22749 ) ) ( not ( = ?auto_22747 ?auto_22748 ) ) ( not ( = ?auto_22747 ?auto_22749 ) ) ( not ( = ?auto_22753 ?auto_22752 ) ) ( HOIST-AT ?auto_22758 ?auto_22753 ) ( not ( = ?auto_22762 ?auto_22758 ) ) ( AVAILABLE ?auto_22758 ) ( SURFACE-AT ?auto_22749 ?auto_22753 ) ( ON ?auto_22749 ?auto_22756 ) ( CLEAR ?auto_22749 ) ( not ( = ?auto_22748 ?auto_22756 ) ) ( not ( = ?auto_22749 ?auto_22756 ) ) ( not ( = ?auto_22747 ?auto_22756 ) ) ( IS-CRATE ?auto_22748 ) ( not ( = ?auto_22755 ?auto_22752 ) ) ( not ( = ?auto_22753 ?auto_22755 ) ) ( HOIST-AT ?auto_22759 ?auto_22755 ) ( not ( = ?auto_22762 ?auto_22759 ) ) ( not ( = ?auto_22758 ?auto_22759 ) ) ( AVAILABLE ?auto_22759 ) ( SURFACE-AT ?auto_22748 ?auto_22755 ) ( ON ?auto_22748 ?auto_22760 ) ( CLEAR ?auto_22748 ) ( not ( = ?auto_22748 ?auto_22760 ) ) ( not ( = ?auto_22749 ?auto_22760 ) ) ( not ( = ?auto_22747 ?auto_22760 ) ) ( not ( = ?auto_22756 ?auto_22760 ) ) ( SURFACE-AT ?auto_22750 ?auto_22752 ) ( CLEAR ?auto_22750 ) ( IS-CRATE ?auto_22747 ) ( not ( = ?auto_22750 ?auto_22747 ) ) ( not ( = ?auto_22748 ?auto_22750 ) ) ( not ( = ?auto_22749 ?auto_22750 ) ) ( not ( = ?auto_22756 ?auto_22750 ) ) ( not ( = ?auto_22760 ?auto_22750 ) ) ( AVAILABLE ?auto_22762 ) ( not ( = ?auto_22751 ?auto_22752 ) ) ( not ( = ?auto_22753 ?auto_22751 ) ) ( not ( = ?auto_22755 ?auto_22751 ) ) ( HOIST-AT ?auto_22754 ?auto_22751 ) ( not ( = ?auto_22762 ?auto_22754 ) ) ( not ( = ?auto_22758 ?auto_22754 ) ) ( not ( = ?auto_22759 ?auto_22754 ) ) ( AVAILABLE ?auto_22754 ) ( SURFACE-AT ?auto_22747 ?auto_22751 ) ( ON ?auto_22747 ?auto_22761 ) ( CLEAR ?auto_22747 ) ( not ( = ?auto_22748 ?auto_22761 ) ) ( not ( = ?auto_22749 ?auto_22761 ) ) ( not ( = ?auto_22747 ?auto_22761 ) ) ( not ( = ?auto_22756 ?auto_22761 ) ) ( not ( = ?auto_22760 ?auto_22761 ) ) ( not ( = ?auto_22750 ?auto_22761 ) ) ( TRUCK-AT ?auto_22757 ?auto_22752 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22748 ?auto_22749 )
      ( MAKE-2CRATE-VERIFY ?auto_22747 ?auto_22748 ?auto_22749 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22763 - SURFACE
      ?auto_22764 - SURFACE
      ?auto_22765 - SURFACE
      ?auto_22766 - SURFACE
    )
    :vars
    (
      ?auto_22769 - HOIST
      ?auto_22776 - PLACE
      ?auto_22778 - PLACE
      ?auto_22774 - HOIST
      ?auto_22771 - SURFACE
      ?auto_22775 - PLACE
      ?auto_22777 - HOIST
      ?auto_22768 - SURFACE
      ?auto_22770 - PLACE
      ?auto_22772 - HOIST
      ?auto_22767 - SURFACE
      ?auto_22773 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22769 ?auto_22776 ) ( IS-CRATE ?auto_22766 ) ( not ( = ?auto_22765 ?auto_22766 ) ) ( not ( = ?auto_22764 ?auto_22765 ) ) ( not ( = ?auto_22764 ?auto_22766 ) ) ( not ( = ?auto_22778 ?auto_22776 ) ) ( HOIST-AT ?auto_22774 ?auto_22778 ) ( not ( = ?auto_22769 ?auto_22774 ) ) ( AVAILABLE ?auto_22774 ) ( SURFACE-AT ?auto_22766 ?auto_22778 ) ( ON ?auto_22766 ?auto_22771 ) ( CLEAR ?auto_22766 ) ( not ( = ?auto_22765 ?auto_22771 ) ) ( not ( = ?auto_22766 ?auto_22771 ) ) ( not ( = ?auto_22764 ?auto_22771 ) ) ( IS-CRATE ?auto_22765 ) ( not ( = ?auto_22775 ?auto_22776 ) ) ( not ( = ?auto_22778 ?auto_22775 ) ) ( HOIST-AT ?auto_22777 ?auto_22775 ) ( not ( = ?auto_22769 ?auto_22777 ) ) ( not ( = ?auto_22774 ?auto_22777 ) ) ( AVAILABLE ?auto_22777 ) ( SURFACE-AT ?auto_22765 ?auto_22775 ) ( ON ?auto_22765 ?auto_22768 ) ( CLEAR ?auto_22765 ) ( not ( = ?auto_22765 ?auto_22768 ) ) ( not ( = ?auto_22766 ?auto_22768 ) ) ( not ( = ?auto_22764 ?auto_22768 ) ) ( not ( = ?auto_22771 ?auto_22768 ) ) ( SURFACE-AT ?auto_22763 ?auto_22776 ) ( CLEAR ?auto_22763 ) ( IS-CRATE ?auto_22764 ) ( not ( = ?auto_22763 ?auto_22764 ) ) ( not ( = ?auto_22765 ?auto_22763 ) ) ( not ( = ?auto_22766 ?auto_22763 ) ) ( not ( = ?auto_22771 ?auto_22763 ) ) ( not ( = ?auto_22768 ?auto_22763 ) ) ( AVAILABLE ?auto_22769 ) ( not ( = ?auto_22770 ?auto_22776 ) ) ( not ( = ?auto_22778 ?auto_22770 ) ) ( not ( = ?auto_22775 ?auto_22770 ) ) ( HOIST-AT ?auto_22772 ?auto_22770 ) ( not ( = ?auto_22769 ?auto_22772 ) ) ( not ( = ?auto_22774 ?auto_22772 ) ) ( not ( = ?auto_22777 ?auto_22772 ) ) ( AVAILABLE ?auto_22772 ) ( SURFACE-AT ?auto_22764 ?auto_22770 ) ( ON ?auto_22764 ?auto_22767 ) ( CLEAR ?auto_22764 ) ( not ( = ?auto_22765 ?auto_22767 ) ) ( not ( = ?auto_22766 ?auto_22767 ) ) ( not ( = ?auto_22764 ?auto_22767 ) ) ( not ( = ?auto_22771 ?auto_22767 ) ) ( not ( = ?auto_22768 ?auto_22767 ) ) ( not ( = ?auto_22763 ?auto_22767 ) ) ( TRUCK-AT ?auto_22773 ?auto_22776 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22764 ?auto_22765 ?auto_22766 )
      ( MAKE-3CRATE-VERIFY ?auto_22763 ?auto_22764 ?auto_22765 ?auto_22766 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22779 - SURFACE
      ?auto_22780 - SURFACE
      ?auto_22781 - SURFACE
      ?auto_22782 - SURFACE
      ?auto_22783 - SURFACE
    )
    :vars
    (
      ?auto_22786 - HOIST
      ?auto_22793 - PLACE
      ?auto_22795 - PLACE
      ?auto_22791 - HOIST
      ?auto_22788 - SURFACE
      ?auto_22792 - PLACE
      ?auto_22794 - HOIST
      ?auto_22785 - SURFACE
      ?auto_22787 - PLACE
      ?auto_22789 - HOIST
      ?auto_22784 - SURFACE
      ?auto_22790 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22786 ?auto_22793 ) ( IS-CRATE ?auto_22783 ) ( not ( = ?auto_22782 ?auto_22783 ) ) ( not ( = ?auto_22781 ?auto_22782 ) ) ( not ( = ?auto_22781 ?auto_22783 ) ) ( not ( = ?auto_22795 ?auto_22793 ) ) ( HOIST-AT ?auto_22791 ?auto_22795 ) ( not ( = ?auto_22786 ?auto_22791 ) ) ( AVAILABLE ?auto_22791 ) ( SURFACE-AT ?auto_22783 ?auto_22795 ) ( ON ?auto_22783 ?auto_22788 ) ( CLEAR ?auto_22783 ) ( not ( = ?auto_22782 ?auto_22788 ) ) ( not ( = ?auto_22783 ?auto_22788 ) ) ( not ( = ?auto_22781 ?auto_22788 ) ) ( IS-CRATE ?auto_22782 ) ( not ( = ?auto_22792 ?auto_22793 ) ) ( not ( = ?auto_22795 ?auto_22792 ) ) ( HOIST-AT ?auto_22794 ?auto_22792 ) ( not ( = ?auto_22786 ?auto_22794 ) ) ( not ( = ?auto_22791 ?auto_22794 ) ) ( AVAILABLE ?auto_22794 ) ( SURFACE-AT ?auto_22782 ?auto_22792 ) ( ON ?auto_22782 ?auto_22785 ) ( CLEAR ?auto_22782 ) ( not ( = ?auto_22782 ?auto_22785 ) ) ( not ( = ?auto_22783 ?auto_22785 ) ) ( not ( = ?auto_22781 ?auto_22785 ) ) ( not ( = ?auto_22788 ?auto_22785 ) ) ( SURFACE-AT ?auto_22780 ?auto_22793 ) ( CLEAR ?auto_22780 ) ( IS-CRATE ?auto_22781 ) ( not ( = ?auto_22780 ?auto_22781 ) ) ( not ( = ?auto_22782 ?auto_22780 ) ) ( not ( = ?auto_22783 ?auto_22780 ) ) ( not ( = ?auto_22788 ?auto_22780 ) ) ( not ( = ?auto_22785 ?auto_22780 ) ) ( AVAILABLE ?auto_22786 ) ( not ( = ?auto_22787 ?auto_22793 ) ) ( not ( = ?auto_22795 ?auto_22787 ) ) ( not ( = ?auto_22792 ?auto_22787 ) ) ( HOIST-AT ?auto_22789 ?auto_22787 ) ( not ( = ?auto_22786 ?auto_22789 ) ) ( not ( = ?auto_22791 ?auto_22789 ) ) ( not ( = ?auto_22794 ?auto_22789 ) ) ( AVAILABLE ?auto_22789 ) ( SURFACE-AT ?auto_22781 ?auto_22787 ) ( ON ?auto_22781 ?auto_22784 ) ( CLEAR ?auto_22781 ) ( not ( = ?auto_22782 ?auto_22784 ) ) ( not ( = ?auto_22783 ?auto_22784 ) ) ( not ( = ?auto_22781 ?auto_22784 ) ) ( not ( = ?auto_22788 ?auto_22784 ) ) ( not ( = ?auto_22785 ?auto_22784 ) ) ( not ( = ?auto_22780 ?auto_22784 ) ) ( TRUCK-AT ?auto_22790 ?auto_22793 ) ( ON ?auto_22780 ?auto_22779 ) ( not ( = ?auto_22779 ?auto_22780 ) ) ( not ( = ?auto_22779 ?auto_22781 ) ) ( not ( = ?auto_22779 ?auto_22782 ) ) ( not ( = ?auto_22779 ?auto_22783 ) ) ( not ( = ?auto_22779 ?auto_22788 ) ) ( not ( = ?auto_22779 ?auto_22785 ) ) ( not ( = ?auto_22779 ?auto_22784 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22781 ?auto_22782 ?auto_22783 )
      ( MAKE-4CRATE-VERIFY ?auto_22779 ?auto_22780 ?auto_22781 ?auto_22782 ?auto_22783 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22796 - SURFACE
      ?auto_22797 - SURFACE
      ?auto_22798 - SURFACE
      ?auto_22799 - SURFACE
      ?auto_22800 - SURFACE
      ?auto_22801 - SURFACE
    )
    :vars
    (
      ?auto_22804 - HOIST
      ?auto_22811 - PLACE
      ?auto_22813 - PLACE
      ?auto_22809 - HOIST
      ?auto_22806 - SURFACE
      ?auto_22810 - PLACE
      ?auto_22812 - HOIST
      ?auto_22803 - SURFACE
      ?auto_22805 - PLACE
      ?auto_22807 - HOIST
      ?auto_22802 - SURFACE
      ?auto_22808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22804 ?auto_22811 ) ( IS-CRATE ?auto_22801 ) ( not ( = ?auto_22800 ?auto_22801 ) ) ( not ( = ?auto_22799 ?auto_22800 ) ) ( not ( = ?auto_22799 ?auto_22801 ) ) ( not ( = ?auto_22813 ?auto_22811 ) ) ( HOIST-AT ?auto_22809 ?auto_22813 ) ( not ( = ?auto_22804 ?auto_22809 ) ) ( AVAILABLE ?auto_22809 ) ( SURFACE-AT ?auto_22801 ?auto_22813 ) ( ON ?auto_22801 ?auto_22806 ) ( CLEAR ?auto_22801 ) ( not ( = ?auto_22800 ?auto_22806 ) ) ( not ( = ?auto_22801 ?auto_22806 ) ) ( not ( = ?auto_22799 ?auto_22806 ) ) ( IS-CRATE ?auto_22800 ) ( not ( = ?auto_22810 ?auto_22811 ) ) ( not ( = ?auto_22813 ?auto_22810 ) ) ( HOIST-AT ?auto_22812 ?auto_22810 ) ( not ( = ?auto_22804 ?auto_22812 ) ) ( not ( = ?auto_22809 ?auto_22812 ) ) ( AVAILABLE ?auto_22812 ) ( SURFACE-AT ?auto_22800 ?auto_22810 ) ( ON ?auto_22800 ?auto_22803 ) ( CLEAR ?auto_22800 ) ( not ( = ?auto_22800 ?auto_22803 ) ) ( not ( = ?auto_22801 ?auto_22803 ) ) ( not ( = ?auto_22799 ?auto_22803 ) ) ( not ( = ?auto_22806 ?auto_22803 ) ) ( SURFACE-AT ?auto_22798 ?auto_22811 ) ( CLEAR ?auto_22798 ) ( IS-CRATE ?auto_22799 ) ( not ( = ?auto_22798 ?auto_22799 ) ) ( not ( = ?auto_22800 ?auto_22798 ) ) ( not ( = ?auto_22801 ?auto_22798 ) ) ( not ( = ?auto_22806 ?auto_22798 ) ) ( not ( = ?auto_22803 ?auto_22798 ) ) ( AVAILABLE ?auto_22804 ) ( not ( = ?auto_22805 ?auto_22811 ) ) ( not ( = ?auto_22813 ?auto_22805 ) ) ( not ( = ?auto_22810 ?auto_22805 ) ) ( HOIST-AT ?auto_22807 ?auto_22805 ) ( not ( = ?auto_22804 ?auto_22807 ) ) ( not ( = ?auto_22809 ?auto_22807 ) ) ( not ( = ?auto_22812 ?auto_22807 ) ) ( AVAILABLE ?auto_22807 ) ( SURFACE-AT ?auto_22799 ?auto_22805 ) ( ON ?auto_22799 ?auto_22802 ) ( CLEAR ?auto_22799 ) ( not ( = ?auto_22800 ?auto_22802 ) ) ( not ( = ?auto_22801 ?auto_22802 ) ) ( not ( = ?auto_22799 ?auto_22802 ) ) ( not ( = ?auto_22806 ?auto_22802 ) ) ( not ( = ?auto_22803 ?auto_22802 ) ) ( not ( = ?auto_22798 ?auto_22802 ) ) ( TRUCK-AT ?auto_22808 ?auto_22811 ) ( ON ?auto_22797 ?auto_22796 ) ( ON ?auto_22798 ?auto_22797 ) ( not ( = ?auto_22796 ?auto_22797 ) ) ( not ( = ?auto_22796 ?auto_22798 ) ) ( not ( = ?auto_22796 ?auto_22799 ) ) ( not ( = ?auto_22796 ?auto_22800 ) ) ( not ( = ?auto_22796 ?auto_22801 ) ) ( not ( = ?auto_22796 ?auto_22806 ) ) ( not ( = ?auto_22796 ?auto_22803 ) ) ( not ( = ?auto_22796 ?auto_22802 ) ) ( not ( = ?auto_22797 ?auto_22798 ) ) ( not ( = ?auto_22797 ?auto_22799 ) ) ( not ( = ?auto_22797 ?auto_22800 ) ) ( not ( = ?auto_22797 ?auto_22801 ) ) ( not ( = ?auto_22797 ?auto_22806 ) ) ( not ( = ?auto_22797 ?auto_22803 ) ) ( not ( = ?auto_22797 ?auto_22802 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22799 ?auto_22800 ?auto_22801 )
      ( MAKE-5CRATE-VERIFY ?auto_22796 ?auto_22797 ?auto_22798 ?auto_22799 ?auto_22800 ?auto_22801 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22814 - SURFACE
      ?auto_22815 - SURFACE
    )
    :vars
    (
      ?auto_22818 - HOIST
      ?auto_22827 - PLACE
      ?auto_22819 - SURFACE
      ?auto_22829 - PLACE
      ?auto_22825 - HOIST
      ?auto_22821 - SURFACE
      ?auto_22826 - PLACE
      ?auto_22828 - HOIST
      ?auto_22817 - SURFACE
      ?auto_22822 - SURFACE
      ?auto_22820 - PLACE
      ?auto_22823 - HOIST
      ?auto_22816 - SURFACE
      ?auto_22824 - TRUCK
      ?auto_22830 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22818 ?auto_22827 ) ( IS-CRATE ?auto_22815 ) ( not ( = ?auto_22814 ?auto_22815 ) ) ( not ( = ?auto_22819 ?auto_22814 ) ) ( not ( = ?auto_22819 ?auto_22815 ) ) ( not ( = ?auto_22829 ?auto_22827 ) ) ( HOIST-AT ?auto_22825 ?auto_22829 ) ( not ( = ?auto_22818 ?auto_22825 ) ) ( AVAILABLE ?auto_22825 ) ( SURFACE-AT ?auto_22815 ?auto_22829 ) ( ON ?auto_22815 ?auto_22821 ) ( CLEAR ?auto_22815 ) ( not ( = ?auto_22814 ?auto_22821 ) ) ( not ( = ?auto_22815 ?auto_22821 ) ) ( not ( = ?auto_22819 ?auto_22821 ) ) ( IS-CRATE ?auto_22814 ) ( not ( = ?auto_22826 ?auto_22827 ) ) ( not ( = ?auto_22829 ?auto_22826 ) ) ( HOIST-AT ?auto_22828 ?auto_22826 ) ( not ( = ?auto_22818 ?auto_22828 ) ) ( not ( = ?auto_22825 ?auto_22828 ) ) ( AVAILABLE ?auto_22828 ) ( SURFACE-AT ?auto_22814 ?auto_22826 ) ( ON ?auto_22814 ?auto_22817 ) ( CLEAR ?auto_22814 ) ( not ( = ?auto_22814 ?auto_22817 ) ) ( not ( = ?auto_22815 ?auto_22817 ) ) ( not ( = ?auto_22819 ?auto_22817 ) ) ( not ( = ?auto_22821 ?auto_22817 ) ) ( IS-CRATE ?auto_22819 ) ( not ( = ?auto_22822 ?auto_22819 ) ) ( not ( = ?auto_22814 ?auto_22822 ) ) ( not ( = ?auto_22815 ?auto_22822 ) ) ( not ( = ?auto_22821 ?auto_22822 ) ) ( not ( = ?auto_22817 ?auto_22822 ) ) ( not ( = ?auto_22820 ?auto_22827 ) ) ( not ( = ?auto_22829 ?auto_22820 ) ) ( not ( = ?auto_22826 ?auto_22820 ) ) ( HOIST-AT ?auto_22823 ?auto_22820 ) ( not ( = ?auto_22818 ?auto_22823 ) ) ( not ( = ?auto_22825 ?auto_22823 ) ) ( not ( = ?auto_22828 ?auto_22823 ) ) ( AVAILABLE ?auto_22823 ) ( SURFACE-AT ?auto_22819 ?auto_22820 ) ( ON ?auto_22819 ?auto_22816 ) ( CLEAR ?auto_22819 ) ( not ( = ?auto_22814 ?auto_22816 ) ) ( not ( = ?auto_22815 ?auto_22816 ) ) ( not ( = ?auto_22819 ?auto_22816 ) ) ( not ( = ?auto_22821 ?auto_22816 ) ) ( not ( = ?auto_22817 ?auto_22816 ) ) ( not ( = ?auto_22822 ?auto_22816 ) ) ( TRUCK-AT ?auto_22824 ?auto_22827 ) ( SURFACE-AT ?auto_22830 ?auto_22827 ) ( CLEAR ?auto_22830 ) ( LIFTING ?auto_22818 ?auto_22822 ) ( IS-CRATE ?auto_22822 ) ( not ( = ?auto_22830 ?auto_22822 ) ) ( not ( = ?auto_22814 ?auto_22830 ) ) ( not ( = ?auto_22815 ?auto_22830 ) ) ( not ( = ?auto_22819 ?auto_22830 ) ) ( not ( = ?auto_22821 ?auto_22830 ) ) ( not ( = ?auto_22817 ?auto_22830 ) ) ( not ( = ?auto_22816 ?auto_22830 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22830 ?auto_22822 )
      ( MAKE-2CRATE ?auto_22819 ?auto_22814 ?auto_22815 )
      ( MAKE-1CRATE-VERIFY ?auto_22814 ?auto_22815 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22831 - SURFACE
      ?auto_22832 - SURFACE
      ?auto_22833 - SURFACE
    )
    :vars
    (
      ?auto_22837 - HOIST
      ?auto_22847 - PLACE
      ?auto_22836 - PLACE
      ?auto_22846 - HOIST
      ?auto_22834 - SURFACE
      ?auto_22841 - PLACE
      ?auto_22845 - HOIST
      ?auto_22839 - SURFACE
      ?auto_22842 - SURFACE
      ?auto_22835 - PLACE
      ?auto_22844 - HOIST
      ?auto_22838 - SURFACE
      ?auto_22843 - TRUCK
      ?auto_22840 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22837 ?auto_22847 ) ( IS-CRATE ?auto_22833 ) ( not ( = ?auto_22832 ?auto_22833 ) ) ( not ( = ?auto_22831 ?auto_22832 ) ) ( not ( = ?auto_22831 ?auto_22833 ) ) ( not ( = ?auto_22836 ?auto_22847 ) ) ( HOIST-AT ?auto_22846 ?auto_22836 ) ( not ( = ?auto_22837 ?auto_22846 ) ) ( AVAILABLE ?auto_22846 ) ( SURFACE-AT ?auto_22833 ?auto_22836 ) ( ON ?auto_22833 ?auto_22834 ) ( CLEAR ?auto_22833 ) ( not ( = ?auto_22832 ?auto_22834 ) ) ( not ( = ?auto_22833 ?auto_22834 ) ) ( not ( = ?auto_22831 ?auto_22834 ) ) ( IS-CRATE ?auto_22832 ) ( not ( = ?auto_22841 ?auto_22847 ) ) ( not ( = ?auto_22836 ?auto_22841 ) ) ( HOIST-AT ?auto_22845 ?auto_22841 ) ( not ( = ?auto_22837 ?auto_22845 ) ) ( not ( = ?auto_22846 ?auto_22845 ) ) ( AVAILABLE ?auto_22845 ) ( SURFACE-AT ?auto_22832 ?auto_22841 ) ( ON ?auto_22832 ?auto_22839 ) ( CLEAR ?auto_22832 ) ( not ( = ?auto_22832 ?auto_22839 ) ) ( not ( = ?auto_22833 ?auto_22839 ) ) ( not ( = ?auto_22831 ?auto_22839 ) ) ( not ( = ?auto_22834 ?auto_22839 ) ) ( IS-CRATE ?auto_22831 ) ( not ( = ?auto_22842 ?auto_22831 ) ) ( not ( = ?auto_22832 ?auto_22842 ) ) ( not ( = ?auto_22833 ?auto_22842 ) ) ( not ( = ?auto_22834 ?auto_22842 ) ) ( not ( = ?auto_22839 ?auto_22842 ) ) ( not ( = ?auto_22835 ?auto_22847 ) ) ( not ( = ?auto_22836 ?auto_22835 ) ) ( not ( = ?auto_22841 ?auto_22835 ) ) ( HOIST-AT ?auto_22844 ?auto_22835 ) ( not ( = ?auto_22837 ?auto_22844 ) ) ( not ( = ?auto_22846 ?auto_22844 ) ) ( not ( = ?auto_22845 ?auto_22844 ) ) ( AVAILABLE ?auto_22844 ) ( SURFACE-AT ?auto_22831 ?auto_22835 ) ( ON ?auto_22831 ?auto_22838 ) ( CLEAR ?auto_22831 ) ( not ( = ?auto_22832 ?auto_22838 ) ) ( not ( = ?auto_22833 ?auto_22838 ) ) ( not ( = ?auto_22831 ?auto_22838 ) ) ( not ( = ?auto_22834 ?auto_22838 ) ) ( not ( = ?auto_22839 ?auto_22838 ) ) ( not ( = ?auto_22842 ?auto_22838 ) ) ( TRUCK-AT ?auto_22843 ?auto_22847 ) ( SURFACE-AT ?auto_22840 ?auto_22847 ) ( CLEAR ?auto_22840 ) ( LIFTING ?auto_22837 ?auto_22842 ) ( IS-CRATE ?auto_22842 ) ( not ( = ?auto_22840 ?auto_22842 ) ) ( not ( = ?auto_22832 ?auto_22840 ) ) ( not ( = ?auto_22833 ?auto_22840 ) ) ( not ( = ?auto_22831 ?auto_22840 ) ) ( not ( = ?auto_22834 ?auto_22840 ) ) ( not ( = ?auto_22839 ?auto_22840 ) ) ( not ( = ?auto_22838 ?auto_22840 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22832 ?auto_22833 )
      ( MAKE-2CRATE-VERIFY ?auto_22831 ?auto_22832 ?auto_22833 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22848 - SURFACE
      ?auto_22849 - SURFACE
      ?auto_22850 - SURFACE
      ?auto_22851 - SURFACE
    )
    :vars
    (
      ?auto_22858 - HOIST
      ?auto_22861 - PLACE
      ?auto_22860 - PLACE
      ?auto_22864 - HOIST
      ?auto_22854 - SURFACE
      ?auto_22852 - PLACE
      ?auto_22853 - HOIST
      ?auto_22859 - SURFACE
      ?auto_22856 - PLACE
      ?auto_22862 - HOIST
      ?auto_22857 - SURFACE
      ?auto_22863 - TRUCK
      ?auto_22855 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22858 ?auto_22861 ) ( IS-CRATE ?auto_22851 ) ( not ( = ?auto_22850 ?auto_22851 ) ) ( not ( = ?auto_22849 ?auto_22850 ) ) ( not ( = ?auto_22849 ?auto_22851 ) ) ( not ( = ?auto_22860 ?auto_22861 ) ) ( HOIST-AT ?auto_22864 ?auto_22860 ) ( not ( = ?auto_22858 ?auto_22864 ) ) ( AVAILABLE ?auto_22864 ) ( SURFACE-AT ?auto_22851 ?auto_22860 ) ( ON ?auto_22851 ?auto_22854 ) ( CLEAR ?auto_22851 ) ( not ( = ?auto_22850 ?auto_22854 ) ) ( not ( = ?auto_22851 ?auto_22854 ) ) ( not ( = ?auto_22849 ?auto_22854 ) ) ( IS-CRATE ?auto_22850 ) ( not ( = ?auto_22852 ?auto_22861 ) ) ( not ( = ?auto_22860 ?auto_22852 ) ) ( HOIST-AT ?auto_22853 ?auto_22852 ) ( not ( = ?auto_22858 ?auto_22853 ) ) ( not ( = ?auto_22864 ?auto_22853 ) ) ( AVAILABLE ?auto_22853 ) ( SURFACE-AT ?auto_22850 ?auto_22852 ) ( ON ?auto_22850 ?auto_22859 ) ( CLEAR ?auto_22850 ) ( not ( = ?auto_22850 ?auto_22859 ) ) ( not ( = ?auto_22851 ?auto_22859 ) ) ( not ( = ?auto_22849 ?auto_22859 ) ) ( not ( = ?auto_22854 ?auto_22859 ) ) ( IS-CRATE ?auto_22849 ) ( not ( = ?auto_22848 ?auto_22849 ) ) ( not ( = ?auto_22850 ?auto_22848 ) ) ( not ( = ?auto_22851 ?auto_22848 ) ) ( not ( = ?auto_22854 ?auto_22848 ) ) ( not ( = ?auto_22859 ?auto_22848 ) ) ( not ( = ?auto_22856 ?auto_22861 ) ) ( not ( = ?auto_22860 ?auto_22856 ) ) ( not ( = ?auto_22852 ?auto_22856 ) ) ( HOIST-AT ?auto_22862 ?auto_22856 ) ( not ( = ?auto_22858 ?auto_22862 ) ) ( not ( = ?auto_22864 ?auto_22862 ) ) ( not ( = ?auto_22853 ?auto_22862 ) ) ( AVAILABLE ?auto_22862 ) ( SURFACE-AT ?auto_22849 ?auto_22856 ) ( ON ?auto_22849 ?auto_22857 ) ( CLEAR ?auto_22849 ) ( not ( = ?auto_22850 ?auto_22857 ) ) ( not ( = ?auto_22851 ?auto_22857 ) ) ( not ( = ?auto_22849 ?auto_22857 ) ) ( not ( = ?auto_22854 ?auto_22857 ) ) ( not ( = ?auto_22859 ?auto_22857 ) ) ( not ( = ?auto_22848 ?auto_22857 ) ) ( TRUCK-AT ?auto_22863 ?auto_22861 ) ( SURFACE-AT ?auto_22855 ?auto_22861 ) ( CLEAR ?auto_22855 ) ( LIFTING ?auto_22858 ?auto_22848 ) ( IS-CRATE ?auto_22848 ) ( not ( = ?auto_22855 ?auto_22848 ) ) ( not ( = ?auto_22850 ?auto_22855 ) ) ( not ( = ?auto_22851 ?auto_22855 ) ) ( not ( = ?auto_22849 ?auto_22855 ) ) ( not ( = ?auto_22854 ?auto_22855 ) ) ( not ( = ?auto_22859 ?auto_22855 ) ) ( not ( = ?auto_22857 ?auto_22855 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22849 ?auto_22850 ?auto_22851 )
      ( MAKE-3CRATE-VERIFY ?auto_22848 ?auto_22849 ?auto_22850 ?auto_22851 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22865 - SURFACE
      ?auto_22866 - SURFACE
      ?auto_22867 - SURFACE
      ?auto_22868 - SURFACE
      ?auto_22869 - SURFACE
    )
    :vars
    (
      ?auto_22875 - HOIST
      ?auto_22878 - PLACE
      ?auto_22877 - PLACE
      ?auto_22881 - HOIST
      ?auto_22872 - SURFACE
      ?auto_22870 - PLACE
      ?auto_22871 - HOIST
      ?auto_22876 - SURFACE
      ?auto_22873 - PLACE
      ?auto_22879 - HOIST
      ?auto_22874 - SURFACE
      ?auto_22880 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22875 ?auto_22878 ) ( IS-CRATE ?auto_22869 ) ( not ( = ?auto_22868 ?auto_22869 ) ) ( not ( = ?auto_22867 ?auto_22868 ) ) ( not ( = ?auto_22867 ?auto_22869 ) ) ( not ( = ?auto_22877 ?auto_22878 ) ) ( HOIST-AT ?auto_22881 ?auto_22877 ) ( not ( = ?auto_22875 ?auto_22881 ) ) ( AVAILABLE ?auto_22881 ) ( SURFACE-AT ?auto_22869 ?auto_22877 ) ( ON ?auto_22869 ?auto_22872 ) ( CLEAR ?auto_22869 ) ( not ( = ?auto_22868 ?auto_22872 ) ) ( not ( = ?auto_22869 ?auto_22872 ) ) ( not ( = ?auto_22867 ?auto_22872 ) ) ( IS-CRATE ?auto_22868 ) ( not ( = ?auto_22870 ?auto_22878 ) ) ( not ( = ?auto_22877 ?auto_22870 ) ) ( HOIST-AT ?auto_22871 ?auto_22870 ) ( not ( = ?auto_22875 ?auto_22871 ) ) ( not ( = ?auto_22881 ?auto_22871 ) ) ( AVAILABLE ?auto_22871 ) ( SURFACE-AT ?auto_22868 ?auto_22870 ) ( ON ?auto_22868 ?auto_22876 ) ( CLEAR ?auto_22868 ) ( not ( = ?auto_22868 ?auto_22876 ) ) ( not ( = ?auto_22869 ?auto_22876 ) ) ( not ( = ?auto_22867 ?auto_22876 ) ) ( not ( = ?auto_22872 ?auto_22876 ) ) ( IS-CRATE ?auto_22867 ) ( not ( = ?auto_22866 ?auto_22867 ) ) ( not ( = ?auto_22868 ?auto_22866 ) ) ( not ( = ?auto_22869 ?auto_22866 ) ) ( not ( = ?auto_22872 ?auto_22866 ) ) ( not ( = ?auto_22876 ?auto_22866 ) ) ( not ( = ?auto_22873 ?auto_22878 ) ) ( not ( = ?auto_22877 ?auto_22873 ) ) ( not ( = ?auto_22870 ?auto_22873 ) ) ( HOIST-AT ?auto_22879 ?auto_22873 ) ( not ( = ?auto_22875 ?auto_22879 ) ) ( not ( = ?auto_22881 ?auto_22879 ) ) ( not ( = ?auto_22871 ?auto_22879 ) ) ( AVAILABLE ?auto_22879 ) ( SURFACE-AT ?auto_22867 ?auto_22873 ) ( ON ?auto_22867 ?auto_22874 ) ( CLEAR ?auto_22867 ) ( not ( = ?auto_22868 ?auto_22874 ) ) ( not ( = ?auto_22869 ?auto_22874 ) ) ( not ( = ?auto_22867 ?auto_22874 ) ) ( not ( = ?auto_22872 ?auto_22874 ) ) ( not ( = ?auto_22876 ?auto_22874 ) ) ( not ( = ?auto_22866 ?auto_22874 ) ) ( TRUCK-AT ?auto_22880 ?auto_22878 ) ( SURFACE-AT ?auto_22865 ?auto_22878 ) ( CLEAR ?auto_22865 ) ( LIFTING ?auto_22875 ?auto_22866 ) ( IS-CRATE ?auto_22866 ) ( not ( = ?auto_22865 ?auto_22866 ) ) ( not ( = ?auto_22868 ?auto_22865 ) ) ( not ( = ?auto_22869 ?auto_22865 ) ) ( not ( = ?auto_22867 ?auto_22865 ) ) ( not ( = ?auto_22872 ?auto_22865 ) ) ( not ( = ?auto_22876 ?auto_22865 ) ) ( not ( = ?auto_22874 ?auto_22865 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22867 ?auto_22868 ?auto_22869 )
      ( MAKE-4CRATE-VERIFY ?auto_22865 ?auto_22866 ?auto_22867 ?auto_22868 ?auto_22869 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22882 - SURFACE
      ?auto_22883 - SURFACE
      ?auto_22884 - SURFACE
      ?auto_22885 - SURFACE
      ?auto_22886 - SURFACE
      ?auto_22887 - SURFACE
    )
    :vars
    (
      ?auto_22893 - HOIST
      ?auto_22896 - PLACE
      ?auto_22895 - PLACE
      ?auto_22899 - HOIST
      ?auto_22890 - SURFACE
      ?auto_22888 - PLACE
      ?auto_22889 - HOIST
      ?auto_22894 - SURFACE
      ?auto_22891 - PLACE
      ?auto_22897 - HOIST
      ?auto_22892 - SURFACE
      ?auto_22898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22893 ?auto_22896 ) ( IS-CRATE ?auto_22887 ) ( not ( = ?auto_22886 ?auto_22887 ) ) ( not ( = ?auto_22885 ?auto_22886 ) ) ( not ( = ?auto_22885 ?auto_22887 ) ) ( not ( = ?auto_22895 ?auto_22896 ) ) ( HOIST-AT ?auto_22899 ?auto_22895 ) ( not ( = ?auto_22893 ?auto_22899 ) ) ( AVAILABLE ?auto_22899 ) ( SURFACE-AT ?auto_22887 ?auto_22895 ) ( ON ?auto_22887 ?auto_22890 ) ( CLEAR ?auto_22887 ) ( not ( = ?auto_22886 ?auto_22890 ) ) ( not ( = ?auto_22887 ?auto_22890 ) ) ( not ( = ?auto_22885 ?auto_22890 ) ) ( IS-CRATE ?auto_22886 ) ( not ( = ?auto_22888 ?auto_22896 ) ) ( not ( = ?auto_22895 ?auto_22888 ) ) ( HOIST-AT ?auto_22889 ?auto_22888 ) ( not ( = ?auto_22893 ?auto_22889 ) ) ( not ( = ?auto_22899 ?auto_22889 ) ) ( AVAILABLE ?auto_22889 ) ( SURFACE-AT ?auto_22886 ?auto_22888 ) ( ON ?auto_22886 ?auto_22894 ) ( CLEAR ?auto_22886 ) ( not ( = ?auto_22886 ?auto_22894 ) ) ( not ( = ?auto_22887 ?auto_22894 ) ) ( not ( = ?auto_22885 ?auto_22894 ) ) ( not ( = ?auto_22890 ?auto_22894 ) ) ( IS-CRATE ?auto_22885 ) ( not ( = ?auto_22884 ?auto_22885 ) ) ( not ( = ?auto_22886 ?auto_22884 ) ) ( not ( = ?auto_22887 ?auto_22884 ) ) ( not ( = ?auto_22890 ?auto_22884 ) ) ( not ( = ?auto_22894 ?auto_22884 ) ) ( not ( = ?auto_22891 ?auto_22896 ) ) ( not ( = ?auto_22895 ?auto_22891 ) ) ( not ( = ?auto_22888 ?auto_22891 ) ) ( HOIST-AT ?auto_22897 ?auto_22891 ) ( not ( = ?auto_22893 ?auto_22897 ) ) ( not ( = ?auto_22899 ?auto_22897 ) ) ( not ( = ?auto_22889 ?auto_22897 ) ) ( AVAILABLE ?auto_22897 ) ( SURFACE-AT ?auto_22885 ?auto_22891 ) ( ON ?auto_22885 ?auto_22892 ) ( CLEAR ?auto_22885 ) ( not ( = ?auto_22886 ?auto_22892 ) ) ( not ( = ?auto_22887 ?auto_22892 ) ) ( not ( = ?auto_22885 ?auto_22892 ) ) ( not ( = ?auto_22890 ?auto_22892 ) ) ( not ( = ?auto_22894 ?auto_22892 ) ) ( not ( = ?auto_22884 ?auto_22892 ) ) ( TRUCK-AT ?auto_22898 ?auto_22896 ) ( SURFACE-AT ?auto_22883 ?auto_22896 ) ( CLEAR ?auto_22883 ) ( LIFTING ?auto_22893 ?auto_22884 ) ( IS-CRATE ?auto_22884 ) ( not ( = ?auto_22883 ?auto_22884 ) ) ( not ( = ?auto_22886 ?auto_22883 ) ) ( not ( = ?auto_22887 ?auto_22883 ) ) ( not ( = ?auto_22885 ?auto_22883 ) ) ( not ( = ?auto_22890 ?auto_22883 ) ) ( not ( = ?auto_22894 ?auto_22883 ) ) ( not ( = ?auto_22892 ?auto_22883 ) ) ( ON ?auto_22883 ?auto_22882 ) ( not ( = ?auto_22882 ?auto_22883 ) ) ( not ( = ?auto_22882 ?auto_22884 ) ) ( not ( = ?auto_22882 ?auto_22885 ) ) ( not ( = ?auto_22882 ?auto_22886 ) ) ( not ( = ?auto_22882 ?auto_22887 ) ) ( not ( = ?auto_22882 ?auto_22890 ) ) ( not ( = ?auto_22882 ?auto_22894 ) ) ( not ( = ?auto_22882 ?auto_22892 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22885 ?auto_22886 ?auto_22887 )
      ( MAKE-5CRATE-VERIFY ?auto_22882 ?auto_22883 ?auto_22884 ?auto_22885 ?auto_22886 ?auto_22887 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22900 - SURFACE
      ?auto_22901 - SURFACE
    )
    :vars
    (
      ?auto_22909 - HOIST
      ?auto_22912 - PLACE
      ?auto_22915 - SURFACE
      ?auto_22911 - PLACE
      ?auto_22916 - HOIST
      ?auto_22904 - SURFACE
      ?auto_22902 - PLACE
      ?auto_22903 - HOIST
      ?auto_22910 - SURFACE
      ?auto_22908 - SURFACE
      ?auto_22906 - PLACE
      ?auto_22913 - HOIST
      ?auto_22907 - SURFACE
      ?auto_22914 - TRUCK
      ?auto_22905 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22909 ?auto_22912 ) ( IS-CRATE ?auto_22901 ) ( not ( = ?auto_22900 ?auto_22901 ) ) ( not ( = ?auto_22915 ?auto_22900 ) ) ( not ( = ?auto_22915 ?auto_22901 ) ) ( not ( = ?auto_22911 ?auto_22912 ) ) ( HOIST-AT ?auto_22916 ?auto_22911 ) ( not ( = ?auto_22909 ?auto_22916 ) ) ( AVAILABLE ?auto_22916 ) ( SURFACE-AT ?auto_22901 ?auto_22911 ) ( ON ?auto_22901 ?auto_22904 ) ( CLEAR ?auto_22901 ) ( not ( = ?auto_22900 ?auto_22904 ) ) ( not ( = ?auto_22901 ?auto_22904 ) ) ( not ( = ?auto_22915 ?auto_22904 ) ) ( IS-CRATE ?auto_22900 ) ( not ( = ?auto_22902 ?auto_22912 ) ) ( not ( = ?auto_22911 ?auto_22902 ) ) ( HOIST-AT ?auto_22903 ?auto_22902 ) ( not ( = ?auto_22909 ?auto_22903 ) ) ( not ( = ?auto_22916 ?auto_22903 ) ) ( AVAILABLE ?auto_22903 ) ( SURFACE-AT ?auto_22900 ?auto_22902 ) ( ON ?auto_22900 ?auto_22910 ) ( CLEAR ?auto_22900 ) ( not ( = ?auto_22900 ?auto_22910 ) ) ( not ( = ?auto_22901 ?auto_22910 ) ) ( not ( = ?auto_22915 ?auto_22910 ) ) ( not ( = ?auto_22904 ?auto_22910 ) ) ( IS-CRATE ?auto_22915 ) ( not ( = ?auto_22908 ?auto_22915 ) ) ( not ( = ?auto_22900 ?auto_22908 ) ) ( not ( = ?auto_22901 ?auto_22908 ) ) ( not ( = ?auto_22904 ?auto_22908 ) ) ( not ( = ?auto_22910 ?auto_22908 ) ) ( not ( = ?auto_22906 ?auto_22912 ) ) ( not ( = ?auto_22911 ?auto_22906 ) ) ( not ( = ?auto_22902 ?auto_22906 ) ) ( HOIST-AT ?auto_22913 ?auto_22906 ) ( not ( = ?auto_22909 ?auto_22913 ) ) ( not ( = ?auto_22916 ?auto_22913 ) ) ( not ( = ?auto_22903 ?auto_22913 ) ) ( AVAILABLE ?auto_22913 ) ( SURFACE-AT ?auto_22915 ?auto_22906 ) ( ON ?auto_22915 ?auto_22907 ) ( CLEAR ?auto_22915 ) ( not ( = ?auto_22900 ?auto_22907 ) ) ( not ( = ?auto_22901 ?auto_22907 ) ) ( not ( = ?auto_22915 ?auto_22907 ) ) ( not ( = ?auto_22904 ?auto_22907 ) ) ( not ( = ?auto_22910 ?auto_22907 ) ) ( not ( = ?auto_22908 ?auto_22907 ) ) ( TRUCK-AT ?auto_22914 ?auto_22912 ) ( SURFACE-AT ?auto_22905 ?auto_22912 ) ( CLEAR ?auto_22905 ) ( IS-CRATE ?auto_22908 ) ( not ( = ?auto_22905 ?auto_22908 ) ) ( not ( = ?auto_22900 ?auto_22905 ) ) ( not ( = ?auto_22901 ?auto_22905 ) ) ( not ( = ?auto_22915 ?auto_22905 ) ) ( not ( = ?auto_22904 ?auto_22905 ) ) ( not ( = ?auto_22910 ?auto_22905 ) ) ( not ( = ?auto_22907 ?auto_22905 ) ) ( AVAILABLE ?auto_22909 ) ( IN ?auto_22908 ?auto_22914 ) )
    :subtasks
    ( ( !UNLOAD ?auto_22909 ?auto_22908 ?auto_22914 ?auto_22912 )
      ( MAKE-2CRATE ?auto_22915 ?auto_22900 ?auto_22901 )
      ( MAKE-1CRATE-VERIFY ?auto_22900 ?auto_22901 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22917 - SURFACE
      ?auto_22918 - SURFACE
      ?auto_22919 - SURFACE
    )
    :vars
    (
      ?auto_22927 - HOIST
      ?auto_22925 - PLACE
      ?auto_22920 - PLACE
      ?auto_22923 - HOIST
      ?auto_22921 - SURFACE
      ?auto_22926 - PLACE
      ?auto_22922 - HOIST
      ?auto_22924 - SURFACE
      ?auto_22929 - SURFACE
      ?auto_22930 - PLACE
      ?auto_22932 - HOIST
      ?auto_22931 - SURFACE
      ?auto_22933 - TRUCK
      ?auto_22928 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22927 ?auto_22925 ) ( IS-CRATE ?auto_22919 ) ( not ( = ?auto_22918 ?auto_22919 ) ) ( not ( = ?auto_22917 ?auto_22918 ) ) ( not ( = ?auto_22917 ?auto_22919 ) ) ( not ( = ?auto_22920 ?auto_22925 ) ) ( HOIST-AT ?auto_22923 ?auto_22920 ) ( not ( = ?auto_22927 ?auto_22923 ) ) ( AVAILABLE ?auto_22923 ) ( SURFACE-AT ?auto_22919 ?auto_22920 ) ( ON ?auto_22919 ?auto_22921 ) ( CLEAR ?auto_22919 ) ( not ( = ?auto_22918 ?auto_22921 ) ) ( not ( = ?auto_22919 ?auto_22921 ) ) ( not ( = ?auto_22917 ?auto_22921 ) ) ( IS-CRATE ?auto_22918 ) ( not ( = ?auto_22926 ?auto_22925 ) ) ( not ( = ?auto_22920 ?auto_22926 ) ) ( HOIST-AT ?auto_22922 ?auto_22926 ) ( not ( = ?auto_22927 ?auto_22922 ) ) ( not ( = ?auto_22923 ?auto_22922 ) ) ( AVAILABLE ?auto_22922 ) ( SURFACE-AT ?auto_22918 ?auto_22926 ) ( ON ?auto_22918 ?auto_22924 ) ( CLEAR ?auto_22918 ) ( not ( = ?auto_22918 ?auto_22924 ) ) ( not ( = ?auto_22919 ?auto_22924 ) ) ( not ( = ?auto_22917 ?auto_22924 ) ) ( not ( = ?auto_22921 ?auto_22924 ) ) ( IS-CRATE ?auto_22917 ) ( not ( = ?auto_22929 ?auto_22917 ) ) ( not ( = ?auto_22918 ?auto_22929 ) ) ( not ( = ?auto_22919 ?auto_22929 ) ) ( not ( = ?auto_22921 ?auto_22929 ) ) ( not ( = ?auto_22924 ?auto_22929 ) ) ( not ( = ?auto_22930 ?auto_22925 ) ) ( not ( = ?auto_22920 ?auto_22930 ) ) ( not ( = ?auto_22926 ?auto_22930 ) ) ( HOIST-AT ?auto_22932 ?auto_22930 ) ( not ( = ?auto_22927 ?auto_22932 ) ) ( not ( = ?auto_22923 ?auto_22932 ) ) ( not ( = ?auto_22922 ?auto_22932 ) ) ( AVAILABLE ?auto_22932 ) ( SURFACE-AT ?auto_22917 ?auto_22930 ) ( ON ?auto_22917 ?auto_22931 ) ( CLEAR ?auto_22917 ) ( not ( = ?auto_22918 ?auto_22931 ) ) ( not ( = ?auto_22919 ?auto_22931 ) ) ( not ( = ?auto_22917 ?auto_22931 ) ) ( not ( = ?auto_22921 ?auto_22931 ) ) ( not ( = ?auto_22924 ?auto_22931 ) ) ( not ( = ?auto_22929 ?auto_22931 ) ) ( TRUCK-AT ?auto_22933 ?auto_22925 ) ( SURFACE-AT ?auto_22928 ?auto_22925 ) ( CLEAR ?auto_22928 ) ( IS-CRATE ?auto_22929 ) ( not ( = ?auto_22928 ?auto_22929 ) ) ( not ( = ?auto_22918 ?auto_22928 ) ) ( not ( = ?auto_22919 ?auto_22928 ) ) ( not ( = ?auto_22917 ?auto_22928 ) ) ( not ( = ?auto_22921 ?auto_22928 ) ) ( not ( = ?auto_22924 ?auto_22928 ) ) ( not ( = ?auto_22931 ?auto_22928 ) ) ( AVAILABLE ?auto_22927 ) ( IN ?auto_22929 ?auto_22933 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22918 ?auto_22919 )
      ( MAKE-2CRATE-VERIFY ?auto_22917 ?auto_22918 ?auto_22919 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22934 - SURFACE
      ?auto_22935 - SURFACE
      ?auto_22936 - SURFACE
      ?auto_22937 - SURFACE
    )
    :vars
    (
      ?auto_22948 - HOIST
      ?auto_22941 - PLACE
      ?auto_22944 - PLACE
      ?auto_22942 - HOIST
      ?auto_22949 - SURFACE
      ?auto_22940 - PLACE
      ?auto_22939 - HOIST
      ?auto_22946 - SURFACE
      ?auto_22947 - PLACE
      ?auto_22943 - HOIST
      ?auto_22950 - SURFACE
      ?auto_22945 - TRUCK
      ?auto_22938 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22948 ?auto_22941 ) ( IS-CRATE ?auto_22937 ) ( not ( = ?auto_22936 ?auto_22937 ) ) ( not ( = ?auto_22935 ?auto_22936 ) ) ( not ( = ?auto_22935 ?auto_22937 ) ) ( not ( = ?auto_22944 ?auto_22941 ) ) ( HOIST-AT ?auto_22942 ?auto_22944 ) ( not ( = ?auto_22948 ?auto_22942 ) ) ( AVAILABLE ?auto_22942 ) ( SURFACE-AT ?auto_22937 ?auto_22944 ) ( ON ?auto_22937 ?auto_22949 ) ( CLEAR ?auto_22937 ) ( not ( = ?auto_22936 ?auto_22949 ) ) ( not ( = ?auto_22937 ?auto_22949 ) ) ( not ( = ?auto_22935 ?auto_22949 ) ) ( IS-CRATE ?auto_22936 ) ( not ( = ?auto_22940 ?auto_22941 ) ) ( not ( = ?auto_22944 ?auto_22940 ) ) ( HOIST-AT ?auto_22939 ?auto_22940 ) ( not ( = ?auto_22948 ?auto_22939 ) ) ( not ( = ?auto_22942 ?auto_22939 ) ) ( AVAILABLE ?auto_22939 ) ( SURFACE-AT ?auto_22936 ?auto_22940 ) ( ON ?auto_22936 ?auto_22946 ) ( CLEAR ?auto_22936 ) ( not ( = ?auto_22936 ?auto_22946 ) ) ( not ( = ?auto_22937 ?auto_22946 ) ) ( not ( = ?auto_22935 ?auto_22946 ) ) ( not ( = ?auto_22949 ?auto_22946 ) ) ( IS-CRATE ?auto_22935 ) ( not ( = ?auto_22934 ?auto_22935 ) ) ( not ( = ?auto_22936 ?auto_22934 ) ) ( not ( = ?auto_22937 ?auto_22934 ) ) ( not ( = ?auto_22949 ?auto_22934 ) ) ( not ( = ?auto_22946 ?auto_22934 ) ) ( not ( = ?auto_22947 ?auto_22941 ) ) ( not ( = ?auto_22944 ?auto_22947 ) ) ( not ( = ?auto_22940 ?auto_22947 ) ) ( HOIST-AT ?auto_22943 ?auto_22947 ) ( not ( = ?auto_22948 ?auto_22943 ) ) ( not ( = ?auto_22942 ?auto_22943 ) ) ( not ( = ?auto_22939 ?auto_22943 ) ) ( AVAILABLE ?auto_22943 ) ( SURFACE-AT ?auto_22935 ?auto_22947 ) ( ON ?auto_22935 ?auto_22950 ) ( CLEAR ?auto_22935 ) ( not ( = ?auto_22936 ?auto_22950 ) ) ( not ( = ?auto_22937 ?auto_22950 ) ) ( not ( = ?auto_22935 ?auto_22950 ) ) ( not ( = ?auto_22949 ?auto_22950 ) ) ( not ( = ?auto_22946 ?auto_22950 ) ) ( not ( = ?auto_22934 ?auto_22950 ) ) ( TRUCK-AT ?auto_22945 ?auto_22941 ) ( SURFACE-AT ?auto_22938 ?auto_22941 ) ( CLEAR ?auto_22938 ) ( IS-CRATE ?auto_22934 ) ( not ( = ?auto_22938 ?auto_22934 ) ) ( not ( = ?auto_22936 ?auto_22938 ) ) ( not ( = ?auto_22937 ?auto_22938 ) ) ( not ( = ?auto_22935 ?auto_22938 ) ) ( not ( = ?auto_22949 ?auto_22938 ) ) ( not ( = ?auto_22946 ?auto_22938 ) ) ( not ( = ?auto_22950 ?auto_22938 ) ) ( AVAILABLE ?auto_22948 ) ( IN ?auto_22934 ?auto_22945 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22935 ?auto_22936 ?auto_22937 )
      ( MAKE-3CRATE-VERIFY ?auto_22934 ?auto_22935 ?auto_22936 ?auto_22937 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22951 - SURFACE
      ?auto_22952 - SURFACE
      ?auto_22953 - SURFACE
      ?auto_22954 - SURFACE
      ?auto_22955 - SURFACE
    )
    :vars
    (
      ?auto_22965 - HOIST
      ?auto_22958 - PLACE
      ?auto_22961 - PLACE
      ?auto_22959 - HOIST
      ?auto_22966 - SURFACE
      ?auto_22957 - PLACE
      ?auto_22956 - HOIST
      ?auto_22963 - SURFACE
      ?auto_22964 - PLACE
      ?auto_22960 - HOIST
      ?auto_22967 - SURFACE
      ?auto_22962 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22965 ?auto_22958 ) ( IS-CRATE ?auto_22955 ) ( not ( = ?auto_22954 ?auto_22955 ) ) ( not ( = ?auto_22953 ?auto_22954 ) ) ( not ( = ?auto_22953 ?auto_22955 ) ) ( not ( = ?auto_22961 ?auto_22958 ) ) ( HOIST-AT ?auto_22959 ?auto_22961 ) ( not ( = ?auto_22965 ?auto_22959 ) ) ( AVAILABLE ?auto_22959 ) ( SURFACE-AT ?auto_22955 ?auto_22961 ) ( ON ?auto_22955 ?auto_22966 ) ( CLEAR ?auto_22955 ) ( not ( = ?auto_22954 ?auto_22966 ) ) ( not ( = ?auto_22955 ?auto_22966 ) ) ( not ( = ?auto_22953 ?auto_22966 ) ) ( IS-CRATE ?auto_22954 ) ( not ( = ?auto_22957 ?auto_22958 ) ) ( not ( = ?auto_22961 ?auto_22957 ) ) ( HOIST-AT ?auto_22956 ?auto_22957 ) ( not ( = ?auto_22965 ?auto_22956 ) ) ( not ( = ?auto_22959 ?auto_22956 ) ) ( AVAILABLE ?auto_22956 ) ( SURFACE-AT ?auto_22954 ?auto_22957 ) ( ON ?auto_22954 ?auto_22963 ) ( CLEAR ?auto_22954 ) ( not ( = ?auto_22954 ?auto_22963 ) ) ( not ( = ?auto_22955 ?auto_22963 ) ) ( not ( = ?auto_22953 ?auto_22963 ) ) ( not ( = ?auto_22966 ?auto_22963 ) ) ( IS-CRATE ?auto_22953 ) ( not ( = ?auto_22952 ?auto_22953 ) ) ( not ( = ?auto_22954 ?auto_22952 ) ) ( not ( = ?auto_22955 ?auto_22952 ) ) ( not ( = ?auto_22966 ?auto_22952 ) ) ( not ( = ?auto_22963 ?auto_22952 ) ) ( not ( = ?auto_22964 ?auto_22958 ) ) ( not ( = ?auto_22961 ?auto_22964 ) ) ( not ( = ?auto_22957 ?auto_22964 ) ) ( HOIST-AT ?auto_22960 ?auto_22964 ) ( not ( = ?auto_22965 ?auto_22960 ) ) ( not ( = ?auto_22959 ?auto_22960 ) ) ( not ( = ?auto_22956 ?auto_22960 ) ) ( AVAILABLE ?auto_22960 ) ( SURFACE-AT ?auto_22953 ?auto_22964 ) ( ON ?auto_22953 ?auto_22967 ) ( CLEAR ?auto_22953 ) ( not ( = ?auto_22954 ?auto_22967 ) ) ( not ( = ?auto_22955 ?auto_22967 ) ) ( not ( = ?auto_22953 ?auto_22967 ) ) ( not ( = ?auto_22966 ?auto_22967 ) ) ( not ( = ?auto_22963 ?auto_22967 ) ) ( not ( = ?auto_22952 ?auto_22967 ) ) ( TRUCK-AT ?auto_22962 ?auto_22958 ) ( SURFACE-AT ?auto_22951 ?auto_22958 ) ( CLEAR ?auto_22951 ) ( IS-CRATE ?auto_22952 ) ( not ( = ?auto_22951 ?auto_22952 ) ) ( not ( = ?auto_22954 ?auto_22951 ) ) ( not ( = ?auto_22955 ?auto_22951 ) ) ( not ( = ?auto_22953 ?auto_22951 ) ) ( not ( = ?auto_22966 ?auto_22951 ) ) ( not ( = ?auto_22963 ?auto_22951 ) ) ( not ( = ?auto_22967 ?auto_22951 ) ) ( AVAILABLE ?auto_22965 ) ( IN ?auto_22952 ?auto_22962 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22953 ?auto_22954 ?auto_22955 )
      ( MAKE-4CRATE-VERIFY ?auto_22951 ?auto_22952 ?auto_22953 ?auto_22954 ?auto_22955 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22968 - SURFACE
      ?auto_22969 - SURFACE
      ?auto_22970 - SURFACE
      ?auto_22971 - SURFACE
      ?auto_22972 - SURFACE
      ?auto_22973 - SURFACE
    )
    :vars
    (
      ?auto_22983 - HOIST
      ?auto_22976 - PLACE
      ?auto_22979 - PLACE
      ?auto_22977 - HOIST
      ?auto_22984 - SURFACE
      ?auto_22975 - PLACE
      ?auto_22974 - HOIST
      ?auto_22981 - SURFACE
      ?auto_22982 - PLACE
      ?auto_22978 - HOIST
      ?auto_22985 - SURFACE
      ?auto_22980 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22983 ?auto_22976 ) ( IS-CRATE ?auto_22973 ) ( not ( = ?auto_22972 ?auto_22973 ) ) ( not ( = ?auto_22971 ?auto_22972 ) ) ( not ( = ?auto_22971 ?auto_22973 ) ) ( not ( = ?auto_22979 ?auto_22976 ) ) ( HOIST-AT ?auto_22977 ?auto_22979 ) ( not ( = ?auto_22983 ?auto_22977 ) ) ( AVAILABLE ?auto_22977 ) ( SURFACE-AT ?auto_22973 ?auto_22979 ) ( ON ?auto_22973 ?auto_22984 ) ( CLEAR ?auto_22973 ) ( not ( = ?auto_22972 ?auto_22984 ) ) ( not ( = ?auto_22973 ?auto_22984 ) ) ( not ( = ?auto_22971 ?auto_22984 ) ) ( IS-CRATE ?auto_22972 ) ( not ( = ?auto_22975 ?auto_22976 ) ) ( not ( = ?auto_22979 ?auto_22975 ) ) ( HOIST-AT ?auto_22974 ?auto_22975 ) ( not ( = ?auto_22983 ?auto_22974 ) ) ( not ( = ?auto_22977 ?auto_22974 ) ) ( AVAILABLE ?auto_22974 ) ( SURFACE-AT ?auto_22972 ?auto_22975 ) ( ON ?auto_22972 ?auto_22981 ) ( CLEAR ?auto_22972 ) ( not ( = ?auto_22972 ?auto_22981 ) ) ( not ( = ?auto_22973 ?auto_22981 ) ) ( not ( = ?auto_22971 ?auto_22981 ) ) ( not ( = ?auto_22984 ?auto_22981 ) ) ( IS-CRATE ?auto_22971 ) ( not ( = ?auto_22970 ?auto_22971 ) ) ( not ( = ?auto_22972 ?auto_22970 ) ) ( not ( = ?auto_22973 ?auto_22970 ) ) ( not ( = ?auto_22984 ?auto_22970 ) ) ( not ( = ?auto_22981 ?auto_22970 ) ) ( not ( = ?auto_22982 ?auto_22976 ) ) ( not ( = ?auto_22979 ?auto_22982 ) ) ( not ( = ?auto_22975 ?auto_22982 ) ) ( HOIST-AT ?auto_22978 ?auto_22982 ) ( not ( = ?auto_22983 ?auto_22978 ) ) ( not ( = ?auto_22977 ?auto_22978 ) ) ( not ( = ?auto_22974 ?auto_22978 ) ) ( AVAILABLE ?auto_22978 ) ( SURFACE-AT ?auto_22971 ?auto_22982 ) ( ON ?auto_22971 ?auto_22985 ) ( CLEAR ?auto_22971 ) ( not ( = ?auto_22972 ?auto_22985 ) ) ( not ( = ?auto_22973 ?auto_22985 ) ) ( not ( = ?auto_22971 ?auto_22985 ) ) ( not ( = ?auto_22984 ?auto_22985 ) ) ( not ( = ?auto_22981 ?auto_22985 ) ) ( not ( = ?auto_22970 ?auto_22985 ) ) ( TRUCK-AT ?auto_22980 ?auto_22976 ) ( SURFACE-AT ?auto_22969 ?auto_22976 ) ( CLEAR ?auto_22969 ) ( IS-CRATE ?auto_22970 ) ( not ( = ?auto_22969 ?auto_22970 ) ) ( not ( = ?auto_22972 ?auto_22969 ) ) ( not ( = ?auto_22973 ?auto_22969 ) ) ( not ( = ?auto_22971 ?auto_22969 ) ) ( not ( = ?auto_22984 ?auto_22969 ) ) ( not ( = ?auto_22981 ?auto_22969 ) ) ( not ( = ?auto_22985 ?auto_22969 ) ) ( AVAILABLE ?auto_22983 ) ( IN ?auto_22970 ?auto_22980 ) ( ON ?auto_22969 ?auto_22968 ) ( not ( = ?auto_22968 ?auto_22969 ) ) ( not ( = ?auto_22968 ?auto_22970 ) ) ( not ( = ?auto_22968 ?auto_22971 ) ) ( not ( = ?auto_22968 ?auto_22972 ) ) ( not ( = ?auto_22968 ?auto_22973 ) ) ( not ( = ?auto_22968 ?auto_22984 ) ) ( not ( = ?auto_22968 ?auto_22981 ) ) ( not ( = ?auto_22968 ?auto_22985 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22971 ?auto_22972 ?auto_22973 )
      ( MAKE-5CRATE-VERIFY ?auto_22968 ?auto_22969 ?auto_22970 ?auto_22971 ?auto_22972 ?auto_22973 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22986 - SURFACE
      ?auto_22987 - SURFACE
    )
    :vars
    (
      ?auto_23000 - HOIST
      ?auto_22992 - PLACE
      ?auto_22999 - SURFACE
      ?auto_22995 - PLACE
      ?auto_22993 - HOIST
      ?auto_23001 - SURFACE
      ?auto_22991 - PLACE
      ?auto_22990 - HOIST
      ?auto_22997 - SURFACE
      ?auto_22988 - SURFACE
      ?auto_22998 - PLACE
      ?auto_22994 - HOIST
      ?auto_23002 - SURFACE
      ?auto_22989 - SURFACE
      ?auto_22996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23000 ?auto_22992 ) ( IS-CRATE ?auto_22987 ) ( not ( = ?auto_22986 ?auto_22987 ) ) ( not ( = ?auto_22999 ?auto_22986 ) ) ( not ( = ?auto_22999 ?auto_22987 ) ) ( not ( = ?auto_22995 ?auto_22992 ) ) ( HOIST-AT ?auto_22993 ?auto_22995 ) ( not ( = ?auto_23000 ?auto_22993 ) ) ( AVAILABLE ?auto_22993 ) ( SURFACE-AT ?auto_22987 ?auto_22995 ) ( ON ?auto_22987 ?auto_23001 ) ( CLEAR ?auto_22987 ) ( not ( = ?auto_22986 ?auto_23001 ) ) ( not ( = ?auto_22987 ?auto_23001 ) ) ( not ( = ?auto_22999 ?auto_23001 ) ) ( IS-CRATE ?auto_22986 ) ( not ( = ?auto_22991 ?auto_22992 ) ) ( not ( = ?auto_22995 ?auto_22991 ) ) ( HOIST-AT ?auto_22990 ?auto_22991 ) ( not ( = ?auto_23000 ?auto_22990 ) ) ( not ( = ?auto_22993 ?auto_22990 ) ) ( AVAILABLE ?auto_22990 ) ( SURFACE-AT ?auto_22986 ?auto_22991 ) ( ON ?auto_22986 ?auto_22997 ) ( CLEAR ?auto_22986 ) ( not ( = ?auto_22986 ?auto_22997 ) ) ( not ( = ?auto_22987 ?auto_22997 ) ) ( not ( = ?auto_22999 ?auto_22997 ) ) ( not ( = ?auto_23001 ?auto_22997 ) ) ( IS-CRATE ?auto_22999 ) ( not ( = ?auto_22988 ?auto_22999 ) ) ( not ( = ?auto_22986 ?auto_22988 ) ) ( not ( = ?auto_22987 ?auto_22988 ) ) ( not ( = ?auto_23001 ?auto_22988 ) ) ( not ( = ?auto_22997 ?auto_22988 ) ) ( not ( = ?auto_22998 ?auto_22992 ) ) ( not ( = ?auto_22995 ?auto_22998 ) ) ( not ( = ?auto_22991 ?auto_22998 ) ) ( HOIST-AT ?auto_22994 ?auto_22998 ) ( not ( = ?auto_23000 ?auto_22994 ) ) ( not ( = ?auto_22993 ?auto_22994 ) ) ( not ( = ?auto_22990 ?auto_22994 ) ) ( AVAILABLE ?auto_22994 ) ( SURFACE-AT ?auto_22999 ?auto_22998 ) ( ON ?auto_22999 ?auto_23002 ) ( CLEAR ?auto_22999 ) ( not ( = ?auto_22986 ?auto_23002 ) ) ( not ( = ?auto_22987 ?auto_23002 ) ) ( not ( = ?auto_22999 ?auto_23002 ) ) ( not ( = ?auto_23001 ?auto_23002 ) ) ( not ( = ?auto_22997 ?auto_23002 ) ) ( not ( = ?auto_22988 ?auto_23002 ) ) ( SURFACE-AT ?auto_22989 ?auto_22992 ) ( CLEAR ?auto_22989 ) ( IS-CRATE ?auto_22988 ) ( not ( = ?auto_22989 ?auto_22988 ) ) ( not ( = ?auto_22986 ?auto_22989 ) ) ( not ( = ?auto_22987 ?auto_22989 ) ) ( not ( = ?auto_22999 ?auto_22989 ) ) ( not ( = ?auto_23001 ?auto_22989 ) ) ( not ( = ?auto_22997 ?auto_22989 ) ) ( not ( = ?auto_23002 ?auto_22989 ) ) ( AVAILABLE ?auto_23000 ) ( IN ?auto_22988 ?auto_22996 ) ( TRUCK-AT ?auto_22996 ?auto_22991 ) )
    :subtasks
    ( ( !DRIVE ?auto_22996 ?auto_22991 ?auto_22992 )
      ( MAKE-2CRATE ?auto_22999 ?auto_22986 ?auto_22987 )
      ( MAKE-1CRATE-VERIFY ?auto_22986 ?auto_22987 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23003 - SURFACE
      ?auto_23004 - SURFACE
      ?auto_23005 - SURFACE
    )
    :vars
    (
      ?auto_23013 - HOIST
      ?auto_23009 - PLACE
      ?auto_23006 - PLACE
      ?auto_23015 - HOIST
      ?auto_23019 - SURFACE
      ?auto_23010 - PLACE
      ?auto_23018 - HOIST
      ?auto_23017 - SURFACE
      ?auto_23014 - SURFACE
      ?auto_23007 - PLACE
      ?auto_23016 - HOIST
      ?auto_23012 - SURFACE
      ?auto_23011 - SURFACE
      ?auto_23008 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23013 ?auto_23009 ) ( IS-CRATE ?auto_23005 ) ( not ( = ?auto_23004 ?auto_23005 ) ) ( not ( = ?auto_23003 ?auto_23004 ) ) ( not ( = ?auto_23003 ?auto_23005 ) ) ( not ( = ?auto_23006 ?auto_23009 ) ) ( HOIST-AT ?auto_23015 ?auto_23006 ) ( not ( = ?auto_23013 ?auto_23015 ) ) ( AVAILABLE ?auto_23015 ) ( SURFACE-AT ?auto_23005 ?auto_23006 ) ( ON ?auto_23005 ?auto_23019 ) ( CLEAR ?auto_23005 ) ( not ( = ?auto_23004 ?auto_23019 ) ) ( not ( = ?auto_23005 ?auto_23019 ) ) ( not ( = ?auto_23003 ?auto_23019 ) ) ( IS-CRATE ?auto_23004 ) ( not ( = ?auto_23010 ?auto_23009 ) ) ( not ( = ?auto_23006 ?auto_23010 ) ) ( HOIST-AT ?auto_23018 ?auto_23010 ) ( not ( = ?auto_23013 ?auto_23018 ) ) ( not ( = ?auto_23015 ?auto_23018 ) ) ( AVAILABLE ?auto_23018 ) ( SURFACE-AT ?auto_23004 ?auto_23010 ) ( ON ?auto_23004 ?auto_23017 ) ( CLEAR ?auto_23004 ) ( not ( = ?auto_23004 ?auto_23017 ) ) ( not ( = ?auto_23005 ?auto_23017 ) ) ( not ( = ?auto_23003 ?auto_23017 ) ) ( not ( = ?auto_23019 ?auto_23017 ) ) ( IS-CRATE ?auto_23003 ) ( not ( = ?auto_23014 ?auto_23003 ) ) ( not ( = ?auto_23004 ?auto_23014 ) ) ( not ( = ?auto_23005 ?auto_23014 ) ) ( not ( = ?auto_23019 ?auto_23014 ) ) ( not ( = ?auto_23017 ?auto_23014 ) ) ( not ( = ?auto_23007 ?auto_23009 ) ) ( not ( = ?auto_23006 ?auto_23007 ) ) ( not ( = ?auto_23010 ?auto_23007 ) ) ( HOIST-AT ?auto_23016 ?auto_23007 ) ( not ( = ?auto_23013 ?auto_23016 ) ) ( not ( = ?auto_23015 ?auto_23016 ) ) ( not ( = ?auto_23018 ?auto_23016 ) ) ( AVAILABLE ?auto_23016 ) ( SURFACE-AT ?auto_23003 ?auto_23007 ) ( ON ?auto_23003 ?auto_23012 ) ( CLEAR ?auto_23003 ) ( not ( = ?auto_23004 ?auto_23012 ) ) ( not ( = ?auto_23005 ?auto_23012 ) ) ( not ( = ?auto_23003 ?auto_23012 ) ) ( not ( = ?auto_23019 ?auto_23012 ) ) ( not ( = ?auto_23017 ?auto_23012 ) ) ( not ( = ?auto_23014 ?auto_23012 ) ) ( SURFACE-AT ?auto_23011 ?auto_23009 ) ( CLEAR ?auto_23011 ) ( IS-CRATE ?auto_23014 ) ( not ( = ?auto_23011 ?auto_23014 ) ) ( not ( = ?auto_23004 ?auto_23011 ) ) ( not ( = ?auto_23005 ?auto_23011 ) ) ( not ( = ?auto_23003 ?auto_23011 ) ) ( not ( = ?auto_23019 ?auto_23011 ) ) ( not ( = ?auto_23017 ?auto_23011 ) ) ( not ( = ?auto_23012 ?auto_23011 ) ) ( AVAILABLE ?auto_23013 ) ( IN ?auto_23014 ?auto_23008 ) ( TRUCK-AT ?auto_23008 ?auto_23010 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23004 ?auto_23005 )
      ( MAKE-2CRATE-VERIFY ?auto_23003 ?auto_23004 ?auto_23005 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23020 - SURFACE
      ?auto_23021 - SURFACE
      ?auto_23022 - SURFACE
      ?auto_23023 - SURFACE
    )
    :vars
    (
      ?auto_23036 - HOIST
      ?auto_23028 - PLACE
      ?auto_23030 - PLACE
      ?auto_23035 - HOIST
      ?auto_23033 - SURFACE
      ?auto_23031 - PLACE
      ?auto_23032 - HOIST
      ?auto_23025 - SURFACE
      ?auto_23027 - PLACE
      ?auto_23034 - HOIST
      ?auto_23024 - SURFACE
      ?auto_23026 - SURFACE
      ?auto_23029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23036 ?auto_23028 ) ( IS-CRATE ?auto_23023 ) ( not ( = ?auto_23022 ?auto_23023 ) ) ( not ( = ?auto_23021 ?auto_23022 ) ) ( not ( = ?auto_23021 ?auto_23023 ) ) ( not ( = ?auto_23030 ?auto_23028 ) ) ( HOIST-AT ?auto_23035 ?auto_23030 ) ( not ( = ?auto_23036 ?auto_23035 ) ) ( AVAILABLE ?auto_23035 ) ( SURFACE-AT ?auto_23023 ?auto_23030 ) ( ON ?auto_23023 ?auto_23033 ) ( CLEAR ?auto_23023 ) ( not ( = ?auto_23022 ?auto_23033 ) ) ( not ( = ?auto_23023 ?auto_23033 ) ) ( not ( = ?auto_23021 ?auto_23033 ) ) ( IS-CRATE ?auto_23022 ) ( not ( = ?auto_23031 ?auto_23028 ) ) ( not ( = ?auto_23030 ?auto_23031 ) ) ( HOIST-AT ?auto_23032 ?auto_23031 ) ( not ( = ?auto_23036 ?auto_23032 ) ) ( not ( = ?auto_23035 ?auto_23032 ) ) ( AVAILABLE ?auto_23032 ) ( SURFACE-AT ?auto_23022 ?auto_23031 ) ( ON ?auto_23022 ?auto_23025 ) ( CLEAR ?auto_23022 ) ( not ( = ?auto_23022 ?auto_23025 ) ) ( not ( = ?auto_23023 ?auto_23025 ) ) ( not ( = ?auto_23021 ?auto_23025 ) ) ( not ( = ?auto_23033 ?auto_23025 ) ) ( IS-CRATE ?auto_23021 ) ( not ( = ?auto_23020 ?auto_23021 ) ) ( not ( = ?auto_23022 ?auto_23020 ) ) ( not ( = ?auto_23023 ?auto_23020 ) ) ( not ( = ?auto_23033 ?auto_23020 ) ) ( not ( = ?auto_23025 ?auto_23020 ) ) ( not ( = ?auto_23027 ?auto_23028 ) ) ( not ( = ?auto_23030 ?auto_23027 ) ) ( not ( = ?auto_23031 ?auto_23027 ) ) ( HOIST-AT ?auto_23034 ?auto_23027 ) ( not ( = ?auto_23036 ?auto_23034 ) ) ( not ( = ?auto_23035 ?auto_23034 ) ) ( not ( = ?auto_23032 ?auto_23034 ) ) ( AVAILABLE ?auto_23034 ) ( SURFACE-AT ?auto_23021 ?auto_23027 ) ( ON ?auto_23021 ?auto_23024 ) ( CLEAR ?auto_23021 ) ( not ( = ?auto_23022 ?auto_23024 ) ) ( not ( = ?auto_23023 ?auto_23024 ) ) ( not ( = ?auto_23021 ?auto_23024 ) ) ( not ( = ?auto_23033 ?auto_23024 ) ) ( not ( = ?auto_23025 ?auto_23024 ) ) ( not ( = ?auto_23020 ?auto_23024 ) ) ( SURFACE-AT ?auto_23026 ?auto_23028 ) ( CLEAR ?auto_23026 ) ( IS-CRATE ?auto_23020 ) ( not ( = ?auto_23026 ?auto_23020 ) ) ( not ( = ?auto_23022 ?auto_23026 ) ) ( not ( = ?auto_23023 ?auto_23026 ) ) ( not ( = ?auto_23021 ?auto_23026 ) ) ( not ( = ?auto_23033 ?auto_23026 ) ) ( not ( = ?auto_23025 ?auto_23026 ) ) ( not ( = ?auto_23024 ?auto_23026 ) ) ( AVAILABLE ?auto_23036 ) ( IN ?auto_23020 ?auto_23029 ) ( TRUCK-AT ?auto_23029 ?auto_23031 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23021 ?auto_23022 ?auto_23023 )
      ( MAKE-3CRATE-VERIFY ?auto_23020 ?auto_23021 ?auto_23022 ?auto_23023 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23037 - SURFACE
      ?auto_23038 - SURFACE
      ?auto_23039 - SURFACE
      ?auto_23040 - SURFACE
      ?auto_23041 - SURFACE
    )
    :vars
    (
      ?auto_23053 - HOIST
      ?auto_23045 - PLACE
      ?auto_23047 - PLACE
      ?auto_23052 - HOIST
      ?auto_23050 - SURFACE
      ?auto_23048 - PLACE
      ?auto_23049 - HOIST
      ?auto_23043 - SURFACE
      ?auto_23044 - PLACE
      ?auto_23051 - HOIST
      ?auto_23042 - SURFACE
      ?auto_23046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23053 ?auto_23045 ) ( IS-CRATE ?auto_23041 ) ( not ( = ?auto_23040 ?auto_23041 ) ) ( not ( = ?auto_23039 ?auto_23040 ) ) ( not ( = ?auto_23039 ?auto_23041 ) ) ( not ( = ?auto_23047 ?auto_23045 ) ) ( HOIST-AT ?auto_23052 ?auto_23047 ) ( not ( = ?auto_23053 ?auto_23052 ) ) ( AVAILABLE ?auto_23052 ) ( SURFACE-AT ?auto_23041 ?auto_23047 ) ( ON ?auto_23041 ?auto_23050 ) ( CLEAR ?auto_23041 ) ( not ( = ?auto_23040 ?auto_23050 ) ) ( not ( = ?auto_23041 ?auto_23050 ) ) ( not ( = ?auto_23039 ?auto_23050 ) ) ( IS-CRATE ?auto_23040 ) ( not ( = ?auto_23048 ?auto_23045 ) ) ( not ( = ?auto_23047 ?auto_23048 ) ) ( HOIST-AT ?auto_23049 ?auto_23048 ) ( not ( = ?auto_23053 ?auto_23049 ) ) ( not ( = ?auto_23052 ?auto_23049 ) ) ( AVAILABLE ?auto_23049 ) ( SURFACE-AT ?auto_23040 ?auto_23048 ) ( ON ?auto_23040 ?auto_23043 ) ( CLEAR ?auto_23040 ) ( not ( = ?auto_23040 ?auto_23043 ) ) ( not ( = ?auto_23041 ?auto_23043 ) ) ( not ( = ?auto_23039 ?auto_23043 ) ) ( not ( = ?auto_23050 ?auto_23043 ) ) ( IS-CRATE ?auto_23039 ) ( not ( = ?auto_23038 ?auto_23039 ) ) ( not ( = ?auto_23040 ?auto_23038 ) ) ( not ( = ?auto_23041 ?auto_23038 ) ) ( not ( = ?auto_23050 ?auto_23038 ) ) ( not ( = ?auto_23043 ?auto_23038 ) ) ( not ( = ?auto_23044 ?auto_23045 ) ) ( not ( = ?auto_23047 ?auto_23044 ) ) ( not ( = ?auto_23048 ?auto_23044 ) ) ( HOIST-AT ?auto_23051 ?auto_23044 ) ( not ( = ?auto_23053 ?auto_23051 ) ) ( not ( = ?auto_23052 ?auto_23051 ) ) ( not ( = ?auto_23049 ?auto_23051 ) ) ( AVAILABLE ?auto_23051 ) ( SURFACE-AT ?auto_23039 ?auto_23044 ) ( ON ?auto_23039 ?auto_23042 ) ( CLEAR ?auto_23039 ) ( not ( = ?auto_23040 ?auto_23042 ) ) ( not ( = ?auto_23041 ?auto_23042 ) ) ( not ( = ?auto_23039 ?auto_23042 ) ) ( not ( = ?auto_23050 ?auto_23042 ) ) ( not ( = ?auto_23043 ?auto_23042 ) ) ( not ( = ?auto_23038 ?auto_23042 ) ) ( SURFACE-AT ?auto_23037 ?auto_23045 ) ( CLEAR ?auto_23037 ) ( IS-CRATE ?auto_23038 ) ( not ( = ?auto_23037 ?auto_23038 ) ) ( not ( = ?auto_23040 ?auto_23037 ) ) ( not ( = ?auto_23041 ?auto_23037 ) ) ( not ( = ?auto_23039 ?auto_23037 ) ) ( not ( = ?auto_23050 ?auto_23037 ) ) ( not ( = ?auto_23043 ?auto_23037 ) ) ( not ( = ?auto_23042 ?auto_23037 ) ) ( AVAILABLE ?auto_23053 ) ( IN ?auto_23038 ?auto_23046 ) ( TRUCK-AT ?auto_23046 ?auto_23048 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23039 ?auto_23040 ?auto_23041 )
      ( MAKE-4CRATE-VERIFY ?auto_23037 ?auto_23038 ?auto_23039 ?auto_23040 ?auto_23041 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23054 - SURFACE
      ?auto_23055 - SURFACE
      ?auto_23056 - SURFACE
      ?auto_23057 - SURFACE
      ?auto_23058 - SURFACE
      ?auto_23059 - SURFACE
    )
    :vars
    (
      ?auto_23071 - HOIST
      ?auto_23063 - PLACE
      ?auto_23065 - PLACE
      ?auto_23070 - HOIST
      ?auto_23068 - SURFACE
      ?auto_23066 - PLACE
      ?auto_23067 - HOIST
      ?auto_23061 - SURFACE
      ?auto_23062 - PLACE
      ?auto_23069 - HOIST
      ?auto_23060 - SURFACE
      ?auto_23064 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23071 ?auto_23063 ) ( IS-CRATE ?auto_23059 ) ( not ( = ?auto_23058 ?auto_23059 ) ) ( not ( = ?auto_23057 ?auto_23058 ) ) ( not ( = ?auto_23057 ?auto_23059 ) ) ( not ( = ?auto_23065 ?auto_23063 ) ) ( HOIST-AT ?auto_23070 ?auto_23065 ) ( not ( = ?auto_23071 ?auto_23070 ) ) ( AVAILABLE ?auto_23070 ) ( SURFACE-AT ?auto_23059 ?auto_23065 ) ( ON ?auto_23059 ?auto_23068 ) ( CLEAR ?auto_23059 ) ( not ( = ?auto_23058 ?auto_23068 ) ) ( not ( = ?auto_23059 ?auto_23068 ) ) ( not ( = ?auto_23057 ?auto_23068 ) ) ( IS-CRATE ?auto_23058 ) ( not ( = ?auto_23066 ?auto_23063 ) ) ( not ( = ?auto_23065 ?auto_23066 ) ) ( HOIST-AT ?auto_23067 ?auto_23066 ) ( not ( = ?auto_23071 ?auto_23067 ) ) ( not ( = ?auto_23070 ?auto_23067 ) ) ( AVAILABLE ?auto_23067 ) ( SURFACE-AT ?auto_23058 ?auto_23066 ) ( ON ?auto_23058 ?auto_23061 ) ( CLEAR ?auto_23058 ) ( not ( = ?auto_23058 ?auto_23061 ) ) ( not ( = ?auto_23059 ?auto_23061 ) ) ( not ( = ?auto_23057 ?auto_23061 ) ) ( not ( = ?auto_23068 ?auto_23061 ) ) ( IS-CRATE ?auto_23057 ) ( not ( = ?auto_23056 ?auto_23057 ) ) ( not ( = ?auto_23058 ?auto_23056 ) ) ( not ( = ?auto_23059 ?auto_23056 ) ) ( not ( = ?auto_23068 ?auto_23056 ) ) ( not ( = ?auto_23061 ?auto_23056 ) ) ( not ( = ?auto_23062 ?auto_23063 ) ) ( not ( = ?auto_23065 ?auto_23062 ) ) ( not ( = ?auto_23066 ?auto_23062 ) ) ( HOIST-AT ?auto_23069 ?auto_23062 ) ( not ( = ?auto_23071 ?auto_23069 ) ) ( not ( = ?auto_23070 ?auto_23069 ) ) ( not ( = ?auto_23067 ?auto_23069 ) ) ( AVAILABLE ?auto_23069 ) ( SURFACE-AT ?auto_23057 ?auto_23062 ) ( ON ?auto_23057 ?auto_23060 ) ( CLEAR ?auto_23057 ) ( not ( = ?auto_23058 ?auto_23060 ) ) ( not ( = ?auto_23059 ?auto_23060 ) ) ( not ( = ?auto_23057 ?auto_23060 ) ) ( not ( = ?auto_23068 ?auto_23060 ) ) ( not ( = ?auto_23061 ?auto_23060 ) ) ( not ( = ?auto_23056 ?auto_23060 ) ) ( SURFACE-AT ?auto_23055 ?auto_23063 ) ( CLEAR ?auto_23055 ) ( IS-CRATE ?auto_23056 ) ( not ( = ?auto_23055 ?auto_23056 ) ) ( not ( = ?auto_23058 ?auto_23055 ) ) ( not ( = ?auto_23059 ?auto_23055 ) ) ( not ( = ?auto_23057 ?auto_23055 ) ) ( not ( = ?auto_23068 ?auto_23055 ) ) ( not ( = ?auto_23061 ?auto_23055 ) ) ( not ( = ?auto_23060 ?auto_23055 ) ) ( AVAILABLE ?auto_23071 ) ( IN ?auto_23056 ?auto_23064 ) ( TRUCK-AT ?auto_23064 ?auto_23066 ) ( ON ?auto_23055 ?auto_23054 ) ( not ( = ?auto_23054 ?auto_23055 ) ) ( not ( = ?auto_23054 ?auto_23056 ) ) ( not ( = ?auto_23054 ?auto_23057 ) ) ( not ( = ?auto_23054 ?auto_23058 ) ) ( not ( = ?auto_23054 ?auto_23059 ) ) ( not ( = ?auto_23054 ?auto_23068 ) ) ( not ( = ?auto_23054 ?auto_23061 ) ) ( not ( = ?auto_23054 ?auto_23060 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23057 ?auto_23058 ?auto_23059 )
      ( MAKE-5CRATE-VERIFY ?auto_23054 ?auto_23055 ?auto_23056 ?auto_23057 ?auto_23058 ?auto_23059 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23072 - SURFACE
      ?auto_23073 - SURFACE
    )
    :vars
    (
      ?auto_23088 - HOIST
      ?auto_23080 - PLACE
      ?auto_23079 - SURFACE
      ?auto_23082 - PLACE
      ?auto_23087 - HOIST
      ?auto_23085 - SURFACE
      ?auto_23083 - PLACE
      ?auto_23084 - HOIST
      ?auto_23075 - SURFACE
      ?auto_23078 - SURFACE
      ?auto_23077 - PLACE
      ?auto_23086 - HOIST
      ?auto_23074 - SURFACE
      ?auto_23076 - SURFACE
      ?auto_23081 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23088 ?auto_23080 ) ( IS-CRATE ?auto_23073 ) ( not ( = ?auto_23072 ?auto_23073 ) ) ( not ( = ?auto_23079 ?auto_23072 ) ) ( not ( = ?auto_23079 ?auto_23073 ) ) ( not ( = ?auto_23082 ?auto_23080 ) ) ( HOIST-AT ?auto_23087 ?auto_23082 ) ( not ( = ?auto_23088 ?auto_23087 ) ) ( AVAILABLE ?auto_23087 ) ( SURFACE-AT ?auto_23073 ?auto_23082 ) ( ON ?auto_23073 ?auto_23085 ) ( CLEAR ?auto_23073 ) ( not ( = ?auto_23072 ?auto_23085 ) ) ( not ( = ?auto_23073 ?auto_23085 ) ) ( not ( = ?auto_23079 ?auto_23085 ) ) ( IS-CRATE ?auto_23072 ) ( not ( = ?auto_23083 ?auto_23080 ) ) ( not ( = ?auto_23082 ?auto_23083 ) ) ( HOIST-AT ?auto_23084 ?auto_23083 ) ( not ( = ?auto_23088 ?auto_23084 ) ) ( not ( = ?auto_23087 ?auto_23084 ) ) ( SURFACE-AT ?auto_23072 ?auto_23083 ) ( ON ?auto_23072 ?auto_23075 ) ( CLEAR ?auto_23072 ) ( not ( = ?auto_23072 ?auto_23075 ) ) ( not ( = ?auto_23073 ?auto_23075 ) ) ( not ( = ?auto_23079 ?auto_23075 ) ) ( not ( = ?auto_23085 ?auto_23075 ) ) ( IS-CRATE ?auto_23079 ) ( not ( = ?auto_23078 ?auto_23079 ) ) ( not ( = ?auto_23072 ?auto_23078 ) ) ( not ( = ?auto_23073 ?auto_23078 ) ) ( not ( = ?auto_23085 ?auto_23078 ) ) ( not ( = ?auto_23075 ?auto_23078 ) ) ( not ( = ?auto_23077 ?auto_23080 ) ) ( not ( = ?auto_23082 ?auto_23077 ) ) ( not ( = ?auto_23083 ?auto_23077 ) ) ( HOIST-AT ?auto_23086 ?auto_23077 ) ( not ( = ?auto_23088 ?auto_23086 ) ) ( not ( = ?auto_23087 ?auto_23086 ) ) ( not ( = ?auto_23084 ?auto_23086 ) ) ( AVAILABLE ?auto_23086 ) ( SURFACE-AT ?auto_23079 ?auto_23077 ) ( ON ?auto_23079 ?auto_23074 ) ( CLEAR ?auto_23079 ) ( not ( = ?auto_23072 ?auto_23074 ) ) ( not ( = ?auto_23073 ?auto_23074 ) ) ( not ( = ?auto_23079 ?auto_23074 ) ) ( not ( = ?auto_23085 ?auto_23074 ) ) ( not ( = ?auto_23075 ?auto_23074 ) ) ( not ( = ?auto_23078 ?auto_23074 ) ) ( SURFACE-AT ?auto_23076 ?auto_23080 ) ( CLEAR ?auto_23076 ) ( IS-CRATE ?auto_23078 ) ( not ( = ?auto_23076 ?auto_23078 ) ) ( not ( = ?auto_23072 ?auto_23076 ) ) ( not ( = ?auto_23073 ?auto_23076 ) ) ( not ( = ?auto_23079 ?auto_23076 ) ) ( not ( = ?auto_23085 ?auto_23076 ) ) ( not ( = ?auto_23075 ?auto_23076 ) ) ( not ( = ?auto_23074 ?auto_23076 ) ) ( AVAILABLE ?auto_23088 ) ( TRUCK-AT ?auto_23081 ?auto_23083 ) ( LIFTING ?auto_23084 ?auto_23078 ) )
    :subtasks
    ( ( !LOAD ?auto_23084 ?auto_23078 ?auto_23081 ?auto_23083 )
      ( MAKE-2CRATE ?auto_23079 ?auto_23072 ?auto_23073 )
      ( MAKE-1CRATE-VERIFY ?auto_23072 ?auto_23073 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23089 - SURFACE
      ?auto_23090 - SURFACE
      ?auto_23091 - SURFACE
    )
    :vars
    (
      ?auto_23104 - HOIST
      ?auto_23094 - PLACE
      ?auto_23095 - PLACE
      ?auto_23101 - HOIST
      ?auto_23105 - SURFACE
      ?auto_23098 - PLACE
      ?auto_23092 - HOIST
      ?auto_23096 - SURFACE
      ?auto_23103 - SURFACE
      ?auto_23099 - PLACE
      ?auto_23097 - HOIST
      ?auto_23100 - SURFACE
      ?auto_23102 - SURFACE
      ?auto_23093 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23104 ?auto_23094 ) ( IS-CRATE ?auto_23091 ) ( not ( = ?auto_23090 ?auto_23091 ) ) ( not ( = ?auto_23089 ?auto_23090 ) ) ( not ( = ?auto_23089 ?auto_23091 ) ) ( not ( = ?auto_23095 ?auto_23094 ) ) ( HOIST-AT ?auto_23101 ?auto_23095 ) ( not ( = ?auto_23104 ?auto_23101 ) ) ( AVAILABLE ?auto_23101 ) ( SURFACE-AT ?auto_23091 ?auto_23095 ) ( ON ?auto_23091 ?auto_23105 ) ( CLEAR ?auto_23091 ) ( not ( = ?auto_23090 ?auto_23105 ) ) ( not ( = ?auto_23091 ?auto_23105 ) ) ( not ( = ?auto_23089 ?auto_23105 ) ) ( IS-CRATE ?auto_23090 ) ( not ( = ?auto_23098 ?auto_23094 ) ) ( not ( = ?auto_23095 ?auto_23098 ) ) ( HOIST-AT ?auto_23092 ?auto_23098 ) ( not ( = ?auto_23104 ?auto_23092 ) ) ( not ( = ?auto_23101 ?auto_23092 ) ) ( SURFACE-AT ?auto_23090 ?auto_23098 ) ( ON ?auto_23090 ?auto_23096 ) ( CLEAR ?auto_23090 ) ( not ( = ?auto_23090 ?auto_23096 ) ) ( not ( = ?auto_23091 ?auto_23096 ) ) ( not ( = ?auto_23089 ?auto_23096 ) ) ( not ( = ?auto_23105 ?auto_23096 ) ) ( IS-CRATE ?auto_23089 ) ( not ( = ?auto_23103 ?auto_23089 ) ) ( not ( = ?auto_23090 ?auto_23103 ) ) ( not ( = ?auto_23091 ?auto_23103 ) ) ( not ( = ?auto_23105 ?auto_23103 ) ) ( not ( = ?auto_23096 ?auto_23103 ) ) ( not ( = ?auto_23099 ?auto_23094 ) ) ( not ( = ?auto_23095 ?auto_23099 ) ) ( not ( = ?auto_23098 ?auto_23099 ) ) ( HOIST-AT ?auto_23097 ?auto_23099 ) ( not ( = ?auto_23104 ?auto_23097 ) ) ( not ( = ?auto_23101 ?auto_23097 ) ) ( not ( = ?auto_23092 ?auto_23097 ) ) ( AVAILABLE ?auto_23097 ) ( SURFACE-AT ?auto_23089 ?auto_23099 ) ( ON ?auto_23089 ?auto_23100 ) ( CLEAR ?auto_23089 ) ( not ( = ?auto_23090 ?auto_23100 ) ) ( not ( = ?auto_23091 ?auto_23100 ) ) ( not ( = ?auto_23089 ?auto_23100 ) ) ( not ( = ?auto_23105 ?auto_23100 ) ) ( not ( = ?auto_23096 ?auto_23100 ) ) ( not ( = ?auto_23103 ?auto_23100 ) ) ( SURFACE-AT ?auto_23102 ?auto_23094 ) ( CLEAR ?auto_23102 ) ( IS-CRATE ?auto_23103 ) ( not ( = ?auto_23102 ?auto_23103 ) ) ( not ( = ?auto_23090 ?auto_23102 ) ) ( not ( = ?auto_23091 ?auto_23102 ) ) ( not ( = ?auto_23089 ?auto_23102 ) ) ( not ( = ?auto_23105 ?auto_23102 ) ) ( not ( = ?auto_23096 ?auto_23102 ) ) ( not ( = ?auto_23100 ?auto_23102 ) ) ( AVAILABLE ?auto_23104 ) ( TRUCK-AT ?auto_23093 ?auto_23098 ) ( LIFTING ?auto_23092 ?auto_23103 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23090 ?auto_23091 )
      ( MAKE-2CRATE-VERIFY ?auto_23089 ?auto_23090 ?auto_23091 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23106 - SURFACE
      ?auto_23107 - SURFACE
      ?auto_23108 - SURFACE
      ?auto_23109 - SURFACE
    )
    :vars
    (
      ?auto_23121 - HOIST
      ?auto_23114 - PLACE
      ?auto_23115 - PLACE
      ?auto_23119 - HOIST
      ?auto_23110 - SURFACE
      ?auto_23116 - PLACE
      ?auto_23117 - HOIST
      ?auto_23118 - SURFACE
      ?auto_23120 - PLACE
      ?auto_23113 - HOIST
      ?auto_23122 - SURFACE
      ?auto_23111 - SURFACE
      ?auto_23112 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23121 ?auto_23114 ) ( IS-CRATE ?auto_23109 ) ( not ( = ?auto_23108 ?auto_23109 ) ) ( not ( = ?auto_23107 ?auto_23108 ) ) ( not ( = ?auto_23107 ?auto_23109 ) ) ( not ( = ?auto_23115 ?auto_23114 ) ) ( HOIST-AT ?auto_23119 ?auto_23115 ) ( not ( = ?auto_23121 ?auto_23119 ) ) ( AVAILABLE ?auto_23119 ) ( SURFACE-AT ?auto_23109 ?auto_23115 ) ( ON ?auto_23109 ?auto_23110 ) ( CLEAR ?auto_23109 ) ( not ( = ?auto_23108 ?auto_23110 ) ) ( not ( = ?auto_23109 ?auto_23110 ) ) ( not ( = ?auto_23107 ?auto_23110 ) ) ( IS-CRATE ?auto_23108 ) ( not ( = ?auto_23116 ?auto_23114 ) ) ( not ( = ?auto_23115 ?auto_23116 ) ) ( HOIST-AT ?auto_23117 ?auto_23116 ) ( not ( = ?auto_23121 ?auto_23117 ) ) ( not ( = ?auto_23119 ?auto_23117 ) ) ( SURFACE-AT ?auto_23108 ?auto_23116 ) ( ON ?auto_23108 ?auto_23118 ) ( CLEAR ?auto_23108 ) ( not ( = ?auto_23108 ?auto_23118 ) ) ( not ( = ?auto_23109 ?auto_23118 ) ) ( not ( = ?auto_23107 ?auto_23118 ) ) ( not ( = ?auto_23110 ?auto_23118 ) ) ( IS-CRATE ?auto_23107 ) ( not ( = ?auto_23106 ?auto_23107 ) ) ( not ( = ?auto_23108 ?auto_23106 ) ) ( not ( = ?auto_23109 ?auto_23106 ) ) ( not ( = ?auto_23110 ?auto_23106 ) ) ( not ( = ?auto_23118 ?auto_23106 ) ) ( not ( = ?auto_23120 ?auto_23114 ) ) ( not ( = ?auto_23115 ?auto_23120 ) ) ( not ( = ?auto_23116 ?auto_23120 ) ) ( HOIST-AT ?auto_23113 ?auto_23120 ) ( not ( = ?auto_23121 ?auto_23113 ) ) ( not ( = ?auto_23119 ?auto_23113 ) ) ( not ( = ?auto_23117 ?auto_23113 ) ) ( AVAILABLE ?auto_23113 ) ( SURFACE-AT ?auto_23107 ?auto_23120 ) ( ON ?auto_23107 ?auto_23122 ) ( CLEAR ?auto_23107 ) ( not ( = ?auto_23108 ?auto_23122 ) ) ( not ( = ?auto_23109 ?auto_23122 ) ) ( not ( = ?auto_23107 ?auto_23122 ) ) ( not ( = ?auto_23110 ?auto_23122 ) ) ( not ( = ?auto_23118 ?auto_23122 ) ) ( not ( = ?auto_23106 ?auto_23122 ) ) ( SURFACE-AT ?auto_23111 ?auto_23114 ) ( CLEAR ?auto_23111 ) ( IS-CRATE ?auto_23106 ) ( not ( = ?auto_23111 ?auto_23106 ) ) ( not ( = ?auto_23108 ?auto_23111 ) ) ( not ( = ?auto_23109 ?auto_23111 ) ) ( not ( = ?auto_23107 ?auto_23111 ) ) ( not ( = ?auto_23110 ?auto_23111 ) ) ( not ( = ?auto_23118 ?auto_23111 ) ) ( not ( = ?auto_23122 ?auto_23111 ) ) ( AVAILABLE ?auto_23121 ) ( TRUCK-AT ?auto_23112 ?auto_23116 ) ( LIFTING ?auto_23117 ?auto_23106 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23107 ?auto_23108 ?auto_23109 )
      ( MAKE-3CRATE-VERIFY ?auto_23106 ?auto_23107 ?auto_23108 ?auto_23109 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23123 - SURFACE
      ?auto_23124 - SURFACE
      ?auto_23125 - SURFACE
      ?auto_23126 - SURFACE
      ?auto_23127 - SURFACE
    )
    :vars
    (
      ?auto_23138 - HOIST
      ?auto_23131 - PLACE
      ?auto_23132 - PLACE
      ?auto_23136 - HOIST
      ?auto_23128 - SURFACE
      ?auto_23133 - PLACE
      ?auto_23134 - HOIST
      ?auto_23135 - SURFACE
      ?auto_23137 - PLACE
      ?auto_23130 - HOIST
      ?auto_23139 - SURFACE
      ?auto_23129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23138 ?auto_23131 ) ( IS-CRATE ?auto_23127 ) ( not ( = ?auto_23126 ?auto_23127 ) ) ( not ( = ?auto_23125 ?auto_23126 ) ) ( not ( = ?auto_23125 ?auto_23127 ) ) ( not ( = ?auto_23132 ?auto_23131 ) ) ( HOIST-AT ?auto_23136 ?auto_23132 ) ( not ( = ?auto_23138 ?auto_23136 ) ) ( AVAILABLE ?auto_23136 ) ( SURFACE-AT ?auto_23127 ?auto_23132 ) ( ON ?auto_23127 ?auto_23128 ) ( CLEAR ?auto_23127 ) ( not ( = ?auto_23126 ?auto_23128 ) ) ( not ( = ?auto_23127 ?auto_23128 ) ) ( not ( = ?auto_23125 ?auto_23128 ) ) ( IS-CRATE ?auto_23126 ) ( not ( = ?auto_23133 ?auto_23131 ) ) ( not ( = ?auto_23132 ?auto_23133 ) ) ( HOIST-AT ?auto_23134 ?auto_23133 ) ( not ( = ?auto_23138 ?auto_23134 ) ) ( not ( = ?auto_23136 ?auto_23134 ) ) ( SURFACE-AT ?auto_23126 ?auto_23133 ) ( ON ?auto_23126 ?auto_23135 ) ( CLEAR ?auto_23126 ) ( not ( = ?auto_23126 ?auto_23135 ) ) ( not ( = ?auto_23127 ?auto_23135 ) ) ( not ( = ?auto_23125 ?auto_23135 ) ) ( not ( = ?auto_23128 ?auto_23135 ) ) ( IS-CRATE ?auto_23125 ) ( not ( = ?auto_23124 ?auto_23125 ) ) ( not ( = ?auto_23126 ?auto_23124 ) ) ( not ( = ?auto_23127 ?auto_23124 ) ) ( not ( = ?auto_23128 ?auto_23124 ) ) ( not ( = ?auto_23135 ?auto_23124 ) ) ( not ( = ?auto_23137 ?auto_23131 ) ) ( not ( = ?auto_23132 ?auto_23137 ) ) ( not ( = ?auto_23133 ?auto_23137 ) ) ( HOIST-AT ?auto_23130 ?auto_23137 ) ( not ( = ?auto_23138 ?auto_23130 ) ) ( not ( = ?auto_23136 ?auto_23130 ) ) ( not ( = ?auto_23134 ?auto_23130 ) ) ( AVAILABLE ?auto_23130 ) ( SURFACE-AT ?auto_23125 ?auto_23137 ) ( ON ?auto_23125 ?auto_23139 ) ( CLEAR ?auto_23125 ) ( not ( = ?auto_23126 ?auto_23139 ) ) ( not ( = ?auto_23127 ?auto_23139 ) ) ( not ( = ?auto_23125 ?auto_23139 ) ) ( not ( = ?auto_23128 ?auto_23139 ) ) ( not ( = ?auto_23135 ?auto_23139 ) ) ( not ( = ?auto_23124 ?auto_23139 ) ) ( SURFACE-AT ?auto_23123 ?auto_23131 ) ( CLEAR ?auto_23123 ) ( IS-CRATE ?auto_23124 ) ( not ( = ?auto_23123 ?auto_23124 ) ) ( not ( = ?auto_23126 ?auto_23123 ) ) ( not ( = ?auto_23127 ?auto_23123 ) ) ( not ( = ?auto_23125 ?auto_23123 ) ) ( not ( = ?auto_23128 ?auto_23123 ) ) ( not ( = ?auto_23135 ?auto_23123 ) ) ( not ( = ?auto_23139 ?auto_23123 ) ) ( AVAILABLE ?auto_23138 ) ( TRUCK-AT ?auto_23129 ?auto_23133 ) ( LIFTING ?auto_23134 ?auto_23124 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23125 ?auto_23126 ?auto_23127 )
      ( MAKE-4CRATE-VERIFY ?auto_23123 ?auto_23124 ?auto_23125 ?auto_23126 ?auto_23127 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23140 - SURFACE
      ?auto_23141 - SURFACE
      ?auto_23142 - SURFACE
      ?auto_23143 - SURFACE
      ?auto_23144 - SURFACE
      ?auto_23145 - SURFACE
    )
    :vars
    (
      ?auto_23156 - HOIST
      ?auto_23149 - PLACE
      ?auto_23150 - PLACE
      ?auto_23154 - HOIST
      ?auto_23146 - SURFACE
      ?auto_23151 - PLACE
      ?auto_23152 - HOIST
      ?auto_23153 - SURFACE
      ?auto_23155 - PLACE
      ?auto_23148 - HOIST
      ?auto_23157 - SURFACE
      ?auto_23147 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23156 ?auto_23149 ) ( IS-CRATE ?auto_23145 ) ( not ( = ?auto_23144 ?auto_23145 ) ) ( not ( = ?auto_23143 ?auto_23144 ) ) ( not ( = ?auto_23143 ?auto_23145 ) ) ( not ( = ?auto_23150 ?auto_23149 ) ) ( HOIST-AT ?auto_23154 ?auto_23150 ) ( not ( = ?auto_23156 ?auto_23154 ) ) ( AVAILABLE ?auto_23154 ) ( SURFACE-AT ?auto_23145 ?auto_23150 ) ( ON ?auto_23145 ?auto_23146 ) ( CLEAR ?auto_23145 ) ( not ( = ?auto_23144 ?auto_23146 ) ) ( not ( = ?auto_23145 ?auto_23146 ) ) ( not ( = ?auto_23143 ?auto_23146 ) ) ( IS-CRATE ?auto_23144 ) ( not ( = ?auto_23151 ?auto_23149 ) ) ( not ( = ?auto_23150 ?auto_23151 ) ) ( HOIST-AT ?auto_23152 ?auto_23151 ) ( not ( = ?auto_23156 ?auto_23152 ) ) ( not ( = ?auto_23154 ?auto_23152 ) ) ( SURFACE-AT ?auto_23144 ?auto_23151 ) ( ON ?auto_23144 ?auto_23153 ) ( CLEAR ?auto_23144 ) ( not ( = ?auto_23144 ?auto_23153 ) ) ( not ( = ?auto_23145 ?auto_23153 ) ) ( not ( = ?auto_23143 ?auto_23153 ) ) ( not ( = ?auto_23146 ?auto_23153 ) ) ( IS-CRATE ?auto_23143 ) ( not ( = ?auto_23142 ?auto_23143 ) ) ( not ( = ?auto_23144 ?auto_23142 ) ) ( not ( = ?auto_23145 ?auto_23142 ) ) ( not ( = ?auto_23146 ?auto_23142 ) ) ( not ( = ?auto_23153 ?auto_23142 ) ) ( not ( = ?auto_23155 ?auto_23149 ) ) ( not ( = ?auto_23150 ?auto_23155 ) ) ( not ( = ?auto_23151 ?auto_23155 ) ) ( HOIST-AT ?auto_23148 ?auto_23155 ) ( not ( = ?auto_23156 ?auto_23148 ) ) ( not ( = ?auto_23154 ?auto_23148 ) ) ( not ( = ?auto_23152 ?auto_23148 ) ) ( AVAILABLE ?auto_23148 ) ( SURFACE-AT ?auto_23143 ?auto_23155 ) ( ON ?auto_23143 ?auto_23157 ) ( CLEAR ?auto_23143 ) ( not ( = ?auto_23144 ?auto_23157 ) ) ( not ( = ?auto_23145 ?auto_23157 ) ) ( not ( = ?auto_23143 ?auto_23157 ) ) ( not ( = ?auto_23146 ?auto_23157 ) ) ( not ( = ?auto_23153 ?auto_23157 ) ) ( not ( = ?auto_23142 ?auto_23157 ) ) ( SURFACE-AT ?auto_23141 ?auto_23149 ) ( CLEAR ?auto_23141 ) ( IS-CRATE ?auto_23142 ) ( not ( = ?auto_23141 ?auto_23142 ) ) ( not ( = ?auto_23144 ?auto_23141 ) ) ( not ( = ?auto_23145 ?auto_23141 ) ) ( not ( = ?auto_23143 ?auto_23141 ) ) ( not ( = ?auto_23146 ?auto_23141 ) ) ( not ( = ?auto_23153 ?auto_23141 ) ) ( not ( = ?auto_23157 ?auto_23141 ) ) ( AVAILABLE ?auto_23156 ) ( TRUCK-AT ?auto_23147 ?auto_23151 ) ( LIFTING ?auto_23152 ?auto_23142 ) ( ON ?auto_23141 ?auto_23140 ) ( not ( = ?auto_23140 ?auto_23141 ) ) ( not ( = ?auto_23140 ?auto_23142 ) ) ( not ( = ?auto_23140 ?auto_23143 ) ) ( not ( = ?auto_23140 ?auto_23144 ) ) ( not ( = ?auto_23140 ?auto_23145 ) ) ( not ( = ?auto_23140 ?auto_23146 ) ) ( not ( = ?auto_23140 ?auto_23153 ) ) ( not ( = ?auto_23140 ?auto_23157 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23143 ?auto_23144 ?auto_23145 )
      ( MAKE-5CRATE-VERIFY ?auto_23140 ?auto_23141 ?auto_23142 ?auto_23143 ?auto_23144 ?auto_23145 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23158 - SURFACE
      ?auto_23159 - SURFACE
    )
    :vars
    (
      ?auto_23172 - HOIST
      ?auto_23164 - PLACE
      ?auto_23174 - SURFACE
      ?auto_23165 - PLACE
      ?auto_23169 - HOIST
      ?auto_23160 - SURFACE
      ?auto_23166 - PLACE
      ?auto_23167 - HOIST
      ?auto_23168 - SURFACE
      ?auto_23170 - SURFACE
      ?auto_23171 - PLACE
      ?auto_23163 - HOIST
      ?auto_23173 - SURFACE
      ?auto_23161 - SURFACE
      ?auto_23162 - TRUCK
      ?auto_23175 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23172 ?auto_23164 ) ( IS-CRATE ?auto_23159 ) ( not ( = ?auto_23158 ?auto_23159 ) ) ( not ( = ?auto_23174 ?auto_23158 ) ) ( not ( = ?auto_23174 ?auto_23159 ) ) ( not ( = ?auto_23165 ?auto_23164 ) ) ( HOIST-AT ?auto_23169 ?auto_23165 ) ( not ( = ?auto_23172 ?auto_23169 ) ) ( AVAILABLE ?auto_23169 ) ( SURFACE-AT ?auto_23159 ?auto_23165 ) ( ON ?auto_23159 ?auto_23160 ) ( CLEAR ?auto_23159 ) ( not ( = ?auto_23158 ?auto_23160 ) ) ( not ( = ?auto_23159 ?auto_23160 ) ) ( not ( = ?auto_23174 ?auto_23160 ) ) ( IS-CRATE ?auto_23158 ) ( not ( = ?auto_23166 ?auto_23164 ) ) ( not ( = ?auto_23165 ?auto_23166 ) ) ( HOIST-AT ?auto_23167 ?auto_23166 ) ( not ( = ?auto_23172 ?auto_23167 ) ) ( not ( = ?auto_23169 ?auto_23167 ) ) ( SURFACE-AT ?auto_23158 ?auto_23166 ) ( ON ?auto_23158 ?auto_23168 ) ( CLEAR ?auto_23158 ) ( not ( = ?auto_23158 ?auto_23168 ) ) ( not ( = ?auto_23159 ?auto_23168 ) ) ( not ( = ?auto_23174 ?auto_23168 ) ) ( not ( = ?auto_23160 ?auto_23168 ) ) ( IS-CRATE ?auto_23174 ) ( not ( = ?auto_23170 ?auto_23174 ) ) ( not ( = ?auto_23158 ?auto_23170 ) ) ( not ( = ?auto_23159 ?auto_23170 ) ) ( not ( = ?auto_23160 ?auto_23170 ) ) ( not ( = ?auto_23168 ?auto_23170 ) ) ( not ( = ?auto_23171 ?auto_23164 ) ) ( not ( = ?auto_23165 ?auto_23171 ) ) ( not ( = ?auto_23166 ?auto_23171 ) ) ( HOIST-AT ?auto_23163 ?auto_23171 ) ( not ( = ?auto_23172 ?auto_23163 ) ) ( not ( = ?auto_23169 ?auto_23163 ) ) ( not ( = ?auto_23167 ?auto_23163 ) ) ( AVAILABLE ?auto_23163 ) ( SURFACE-AT ?auto_23174 ?auto_23171 ) ( ON ?auto_23174 ?auto_23173 ) ( CLEAR ?auto_23174 ) ( not ( = ?auto_23158 ?auto_23173 ) ) ( not ( = ?auto_23159 ?auto_23173 ) ) ( not ( = ?auto_23174 ?auto_23173 ) ) ( not ( = ?auto_23160 ?auto_23173 ) ) ( not ( = ?auto_23168 ?auto_23173 ) ) ( not ( = ?auto_23170 ?auto_23173 ) ) ( SURFACE-AT ?auto_23161 ?auto_23164 ) ( CLEAR ?auto_23161 ) ( IS-CRATE ?auto_23170 ) ( not ( = ?auto_23161 ?auto_23170 ) ) ( not ( = ?auto_23158 ?auto_23161 ) ) ( not ( = ?auto_23159 ?auto_23161 ) ) ( not ( = ?auto_23174 ?auto_23161 ) ) ( not ( = ?auto_23160 ?auto_23161 ) ) ( not ( = ?auto_23168 ?auto_23161 ) ) ( not ( = ?auto_23173 ?auto_23161 ) ) ( AVAILABLE ?auto_23172 ) ( TRUCK-AT ?auto_23162 ?auto_23166 ) ( AVAILABLE ?auto_23167 ) ( SURFACE-AT ?auto_23170 ?auto_23166 ) ( ON ?auto_23170 ?auto_23175 ) ( CLEAR ?auto_23170 ) ( not ( = ?auto_23158 ?auto_23175 ) ) ( not ( = ?auto_23159 ?auto_23175 ) ) ( not ( = ?auto_23174 ?auto_23175 ) ) ( not ( = ?auto_23160 ?auto_23175 ) ) ( not ( = ?auto_23168 ?auto_23175 ) ) ( not ( = ?auto_23170 ?auto_23175 ) ) ( not ( = ?auto_23173 ?auto_23175 ) ) ( not ( = ?auto_23161 ?auto_23175 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23167 ?auto_23170 ?auto_23175 ?auto_23166 )
      ( MAKE-2CRATE ?auto_23174 ?auto_23158 ?auto_23159 )
      ( MAKE-1CRATE-VERIFY ?auto_23158 ?auto_23159 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23176 - SURFACE
      ?auto_23177 - SURFACE
      ?auto_23178 - SURFACE
    )
    :vars
    (
      ?auto_23187 - HOIST
      ?auto_23189 - PLACE
      ?auto_23192 - PLACE
      ?auto_23186 - HOIST
      ?auto_23180 - SURFACE
      ?auto_23188 - PLACE
      ?auto_23185 - HOIST
      ?auto_23182 - SURFACE
      ?auto_23179 - SURFACE
      ?auto_23190 - PLACE
      ?auto_23183 - HOIST
      ?auto_23191 - SURFACE
      ?auto_23181 - SURFACE
      ?auto_23184 - TRUCK
      ?auto_23193 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23187 ?auto_23189 ) ( IS-CRATE ?auto_23178 ) ( not ( = ?auto_23177 ?auto_23178 ) ) ( not ( = ?auto_23176 ?auto_23177 ) ) ( not ( = ?auto_23176 ?auto_23178 ) ) ( not ( = ?auto_23192 ?auto_23189 ) ) ( HOIST-AT ?auto_23186 ?auto_23192 ) ( not ( = ?auto_23187 ?auto_23186 ) ) ( AVAILABLE ?auto_23186 ) ( SURFACE-AT ?auto_23178 ?auto_23192 ) ( ON ?auto_23178 ?auto_23180 ) ( CLEAR ?auto_23178 ) ( not ( = ?auto_23177 ?auto_23180 ) ) ( not ( = ?auto_23178 ?auto_23180 ) ) ( not ( = ?auto_23176 ?auto_23180 ) ) ( IS-CRATE ?auto_23177 ) ( not ( = ?auto_23188 ?auto_23189 ) ) ( not ( = ?auto_23192 ?auto_23188 ) ) ( HOIST-AT ?auto_23185 ?auto_23188 ) ( not ( = ?auto_23187 ?auto_23185 ) ) ( not ( = ?auto_23186 ?auto_23185 ) ) ( SURFACE-AT ?auto_23177 ?auto_23188 ) ( ON ?auto_23177 ?auto_23182 ) ( CLEAR ?auto_23177 ) ( not ( = ?auto_23177 ?auto_23182 ) ) ( not ( = ?auto_23178 ?auto_23182 ) ) ( not ( = ?auto_23176 ?auto_23182 ) ) ( not ( = ?auto_23180 ?auto_23182 ) ) ( IS-CRATE ?auto_23176 ) ( not ( = ?auto_23179 ?auto_23176 ) ) ( not ( = ?auto_23177 ?auto_23179 ) ) ( not ( = ?auto_23178 ?auto_23179 ) ) ( not ( = ?auto_23180 ?auto_23179 ) ) ( not ( = ?auto_23182 ?auto_23179 ) ) ( not ( = ?auto_23190 ?auto_23189 ) ) ( not ( = ?auto_23192 ?auto_23190 ) ) ( not ( = ?auto_23188 ?auto_23190 ) ) ( HOIST-AT ?auto_23183 ?auto_23190 ) ( not ( = ?auto_23187 ?auto_23183 ) ) ( not ( = ?auto_23186 ?auto_23183 ) ) ( not ( = ?auto_23185 ?auto_23183 ) ) ( AVAILABLE ?auto_23183 ) ( SURFACE-AT ?auto_23176 ?auto_23190 ) ( ON ?auto_23176 ?auto_23191 ) ( CLEAR ?auto_23176 ) ( not ( = ?auto_23177 ?auto_23191 ) ) ( not ( = ?auto_23178 ?auto_23191 ) ) ( not ( = ?auto_23176 ?auto_23191 ) ) ( not ( = ?auto_23180 ?auto_23191 ) ) ( not ( = ?auto_23182 ?auto_23191 ) ) ( not ( = ?auto_23179 ?auto_23191 ) ) ( SURFACE-AT ?auto_23181 ?auto_23189 ) ( CLEAR ?auto_23181 ) ( IS-CRATE ?auto_23179 ) ( not ( = ?auto_23181 ?auto_23179 ) ) ( not ( = ?auto_23177 ?auto_23181 ) ) ( not ( = ?auto_23178 ?auto_23181 ) ) ( not ( = ?auto_23176 ?auto_23181 ) ) ( not ( = ?auto_23180 ?auto_23181 ) ) ( not ( = ?auto_23182 ?auto_23181 ) ) ( not ( = ?auto_23191 ?auto_23181 ) ) ( AVAILABLE ?auto_23187 ) ( TRUCK-AT ?auto_23184 ?auto_23188 ) ( AVAILABLE ?auto_23185 ) ( SURFACE-AT ?auto_23179 ?auto_23188 ) ( ON ?auto_23179 ?auto_23193 ) ( CLEAR ?auto_23179 ) ( not ( = ?auto_23177 ?auto_23193 ) ) ( not ( = ?auto_23178 ?auto_23193 ) ) ( not ( = ?auto_23176 ?auto_23193 ) ) ( not ( = ?auto_23180 ?auto_23193 ) ) ( not ( = ?auto_23182 ?auto_23193 ) ) ( not ( = ?auto_23179 ?auto_23193 ) ) ( not ( = ?auto_23191 ?auto_23193 ) ) ( not ( = ?auto_23181 ?auto_23193 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23177 ?auto_23178 )
      ( MAKE-2CRATE-VERIFY ?auto_23176 ?auto_23177 ?auto_23178 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23194 - SURFACE
      ?auto_23195 - SURFACE
      ?auto_23196 - SURFACE
      ?auto_23197 - SURFACE
    )
    :vars
    (
      ?auto_23208 - HOIST
      ?auto_23211 - PLACE
      ?auto_23201 - PLACE
      ?auto_23209 - HOIST
      ?auto_23202 - SURFACE
      ?auto_23206 - PLACE
      ?auto_23204 - HOIST
      ?auto_23203 - SURFACE
      ?auto_23200 - PLACE
      ?auto_23199 - HOIST
      ?auto_23210 - SURFACE
      ?auto_23198 - SURFACE
      ?auto_23207 - TRUCK
      ?auto_23205 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23208 ?auto_23211 ) ( IS-CRATE ?auto_23197 ) ( not ( = ?auto_23196 ?auto_23197 ) ) ( not ( = ?auto_23195 ?auto_23196 ) ) ( not ( = ?auto_23195 ?auto_23197 ) ) ( not ( = ?auto_23201 ?auto_23211 ) ) ( HOIST-AT ?auto_23209 ?auto_23201 ) ( not ( = ?auto_23208 ?auto_23209 ) ) ( AVAILABLE ?auto_23209 ) ( SURFACE-AT ?auto_23197 ?auto_23201 ) ( ON ?auto_23197 ?auto_23202 ) ( CLEAR ?auto_23197 ) ( not ( = ?auto_23196 ?auto_23202 ) ) ( not ( = ?auto_23197 ?auto_23202 ) ) ( not ( = ?auto_23195 ?auto_23202 ) ) ( IS-CRATE ?auto_23196 ) ( not ( = ?auto_23206 ?auto_23211 ) ) ( not ( = ?auto_23201 ?auto_23206 ) ) ( HOIST-AT ?auto_23204 ?auto_23206 ) ( not ( = ?auto_23208 ?auto_23204 ) ) ( not ( = ?auto_23209 ?auto_23204 ) ) ( SURFACE-AT ?auto_23196 ?auto_23206 ) ( ON ?auto_23196 ?auto_23203 ) ( CLEAR ?auto_23196 ) ( not ( = ?auto_23196 ?auto_23203 ) ) ( not ( = ?auto_23197 ?auto_23203 ) ) ( not ( = ?auto_23195 ?auto_23203 ) ) ( not ( = ?auto_23202 ?auto_23203 ) ) ( IS-CRATE ?auto_23195 ) ( not ( = ?auto_23194 ?auto_23195 ) ) ( not ( = ?auto_23196 ?auto_23194 ) ) ( not ( = ?auto_23197 ?auto_23194 ) ) ( not ( = ?auto_23202 ?auto_23194 ) ) ( not ( = ?auto_23203 ?auto_23194 ) ) ( not ( = ?auto_23200 ?auto_23211 ) ) ( not ( = ?auto_23201 ?auto_23200 ) ) ( not ( = ?auto_23206 ?auto_23200 ) ) ( HOIST-AT ?auto_23199 ?auto_23200 ) ( not ( = ?auto_23208 ?auto_23199 ) ) ( not ( = ?auto_23209 ?auto_23199 ) ) ( not ( = ?auto_23204 ?auto_23199 ) ) ( AVAILABLE ?auto_23199 ) ( SURFACE-AT ?auto_23195 ?auto_23200 ) ( ON ?auto_23195 ?auto_23210 ) ( CLEAR ?auto_23195 ) ( not ( = ?auto_23196 ?auto_23210 ) ) ( not ( = ?auto_23197 ?auto_23210 ) ) ( not ( = ?auto_23195 ?auto_23210 ) ) ( not ( = ?auto_23202 ?auto_23210 ) ) ( not ( = ?auto_23203 ?auto_23210 ) ) ( not ( = ?auto_23194 ?auto_23210 ) ) ( SURFACE-AT ?auto_23198 ?auto_23211 ) ( CLEAR ?auto_23198 ) ( IS-CRATE ?auto_23194 ) ( not ( = ?auto_23198 ?auto_23194 ) ) ( not ( = ?auto_23196 ?auto_23198 ) ) ( not ( = ?auto_23197 ?auto_23198 ) ) ( not ( = ?auto_23195 ?auto_23198 ) ) ( not ( = ?auto_23202 ?auto_23198 ) ) ( not ( = ?auto_23203 ?auto_23198 ) ) ( not ( = ?auto_23210 ?auto_23198 ) ) ( AVAILABLE ?auto_23208 ) ( TRUCK-AT ?auto_23207 ?auto_23206 ) ( AVAILABLE ?auto_23204 ) ( SURFACE-AT ?auto_23194 ?auto_23206 ) ( ON ?auto_23194 ?auto_23205 ) ( CLEAR ?auto_23194 ) ( not ( = ?auto_23196 ?auto_23205 ) ) ( not ( = ?auto_23197 ?auto_23205 ) ) ( not ( = ?auto_23195 ?auto_23205 ) ) ( not ( = ?auto_23202 ?auto_23205 ) ) ( not ( = ?auto_23203 ?auto_23205 ) ) ( not ( = ?auto_23194 ?auto_23205 ) ) ( not ( = ?auto_23210 ?auto_23205 ) ) ( not ( = ?auto_23198 ?auto_23205 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23195 ?auto_23196 ?auto_23197 )
      ( MAKE-3CRATE-VERIFY ?auto_23194 ?auto_23195 ?auto_23196 ?auto_23197 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23212 - SURFACE
      ?auto_23213 - SURFACE
      ?auto_23214 - SURFACE
      ?auto_23215 - SURFACE
      ?auto_23216 - SURFACE
    )
    :vars
    (
      ?auto_23226 - HOIST
      ?auto_23229 - PLACE
      ?auto_23219 - PLACE
      ?auto_23227 - HOIST
      ?auto_23220 - SURFACE
      ?auto_23224 - PLACE
      ?auto_23222 - HOIST
      ?auto_23221 - SURFACE
      ?auto_23218 - PLACE
      ?auto_23217 - HOIST
      ?auto_23228 - SURFACE
      ?auto_23225 - TRUCK
      ?auto_23223 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23226 ?auto_23229 ) ( IS-CRATE ?auto_23216 ) ( not ( = ?auto_23215 ?auto_23216 ) ) ( not ( = ?auto_23214 ?auto_23215 ) ) ( not ( = ?auto_23214 ?auto_23216 ) ) ( not ( = ?auto_23219 ?auto_23229 ) ) ( HOIST-AT ?auto_23227 ?auto_23219 ) ( not ( = ?auto_23226 ?auto_23227 ) ) ( AVAILABLE ?auto_23227 ) ( SURFACE-AT ?auto_23216 ?auto_23219 ) ( ON ?auto_23216 ?auto_23220 ) ( CLEAR ?auto_23216 ) ( not ( = ?auto_23215 ?auto_23220 ) ) ( not ( = ?auto_23216 ?auto_23220 ) ) ( not ( = ?auto_23214 ?auto_23220 ) ) ( IS-CRATE ?auto_23215 ) ( not ( = ?auto_23224 ?auto_23229 ) ) ( not ( = ?auto_23219 ?auto_23224 ) ) ( HOIST-AT ?auto_23222 ?auto_23224 ) ( not ( = ?auto_23226 ?auto_23222 ) ) ( not ( = ?auto_23227 ?auto_23222 ) ) ( SURFACE-AT ?auto_23215 ?auto_23224 ) ( ON ?auto_23215 ?auto_23221 ) ( CLEAR ?auto_23215 ) ( not ( = ?auto_23215 ?auto_23221 ) ) ( not ( = ?auto_23216 ?auto_23221 ) ) ( not ( = ?auto_23214 ?auto_23221 ) ) ( not ( = ?auto_23220 ?auto_23221 ) ) ( IS-CRATE ?auto_23214 ) ( not ( = ?auto_23213 ?auto_23214 ) ) ( not ( = ?auto_23215 ?auto_23213 ) ) ( not ( = ?auto_23216 ?auto_23213 ) ) ( not ( = ?auto_23220 ?auto_23213 ) ) ( not ( = ?auto_23221 ?auto_23213 ) ) ( not ( = ?auto_23218 ?auto_23229 ) ) ( not ( = ?auto_23219 ?auto_23218 ) ) ( not ( = ?auto_23224 ?auto_23218 ) ) ( HOIST-AT ?auto_23217 ?auto_23218 ) ( not ( = ?auto_23226 ?auto_23217 ) ) ( not ( = ?auto_23227 ?auto_23217 ) ) ( not ( = ?auto_23222 ?auto_23217 ) ) ( AVAILABLE ?auto_23217 ) ( SURFACE-AT ?auto_23214 ?auto_23218 ) ( ON ?auto_23214 ?auto_23228 ) ( CLEAR ?auto_23214 ) ( not ( = ?auto_23215 ?auto_23228 ) ) ( not ( = ?auto_23216 ?auto_23228 ) ) ( not ( = ?auto_23214 ?auto_23228 ) ) ( not ( = ?auto_23220 ?auto_23228 ) ) ( not ( = ?auto_23221 ?auto_23228 ) ) ( not ( = ?auto_23213 ?auto_23228 ) ) ( SURFACE-AT ?auto_23212 ?auto_23229 ) ( CLEAR ?auto_23212 ) ( IS-CRATE ?auto_23213 ) ( not ( = ?auto_23212 ?auto_23213 ) ) ( not ( = ?auto_23215 ?auto_23212 ) ) ( not ( = ?auto_23216 ?auto_23212 ) ) ( not ( = ?auto_23214 ?auto_23212 ) ) ( not ( = ?auto_23220 ?auto_23212 ) ) ( not ( = ?auto_23221 ?auto_23212 ) ) ( not ( = ?auto_23228 ?auto_23212 ) ) ( AVAILABLE ?auto_23226 ) ( TRUCK-AT ?auto_23225 ?auto_23224 ) ( AVAILABLE ?auto_23222 ) ( SURFACE-AT ?auto_23213 ?auto_23224 ) ( ON ?auto_23213 ?auto_23223 ) ( CLEAR ?auto_23213 ) ( not ( = ?auto_23215 ?auto_23223 ) ) ( not ( = ?auto_23216 ?auto_23223 ) ) ( not ( = ?auto_23214 ?auto_23223 ) ) ( not ( = ?auto_23220 ?auto_23223 ) ) ( not ( = ?auto_23221 ?auto_23223 ) ) ( not ( = ?auto_23213 ?auto_23223 ) ) ( not ( = ?auto_23228 ?auto_23223 ) ) ( not ( = ?auto_23212 ?auto_23223 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23214 ?auto_23215 ?auto_23216 )
      ( MAKE-4CRATE-VERIFY ?auto_23212 ?auto_23213 ?auto_23214 ?auto_23215 ?auto_23216 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23230 - SURFACE
      ?auto_23231 - SURFACE
      ?auto_23232 - SURFACE
      ?auto_23233 - SURFACE
      ?auto_23234 - SURFACE
      ?auto_23235 - SURFACE
    )
    :vars
    (
      ?auto_23245 - HOIST
      ?auto_23248 - PLACE
      ?auto_23238 - PLACE
      ?auto_23246 - HOIST
      ?auto_23239 - SURFACE
      ?auto_23243 - PLACE
      ?auto_23241 - HOIST
      ?auto_23240 - SURFACE
      ?auto_23237 - PLACE
      ?auto_23236 - HOIST
      ?auto_23247 - SURFACE
      ?auto_23244 - TRUCK
      ?auto_23242 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23245 ?auto_23248 ) ( IS-CRATE ?auto_23235 ) ( not ( = ?auto_23234 ?auto_23235 ) ) ( not ( = ?auto_23233 ?auto_23234 ) ) ( not ( = ?auto_23233 ?auto_23235 ) ) ( not ( = ?auto_23238 ?auto_23248 ) ) ( HOIST-AT ?auto_23246 ?auto_23238 ) ( not ( = ?auto_23245 ?auto_23246 ) ) ( AVAILABLE ?auto_23246 ) ( SURFACE-AT ?auto_23235 ?auto_23238 ) ( ON ?auto_23235 ?auto_23239 ) ( CLEAR ?auto_23235 ) ( not ( = ?auto_23234 ?auto_23239 ) ) ( not ( = ?auto_23235 ?auto_23239 ) ) ( not ( = ?auto_23233 ?auto_23239 ) ) ( IS-CRATE ?auto_23234 ) ( not ( = ?auto_23243 ?auto_23248 ) ) ( not ( = ?auto_23238 ?auto_23243 ) ) ( HOIST-AT ?auto_23241 ?auto_23243 ) ( not ( = ?auto_23245 ?auto_23241 ) ) ( not ( = ?auto_23246 ?auto_23241 ) ) ( SURFACE-AT ?auto_23234 ?auto_23243 ) ( ON ?auto_23234 ?auto_23240 ) ( CLEAR ?auto_23234 ) ( not ( = ?auto_23234 ?auto_23240 ) ) ( not ( = ?auto_23235 ?auto_23240 ) ) ( not ( = ?auto_23233 ?auto_23240 ) ) ( not ( = ?auto_23239 ?auto_23240 ) ) ( IS-CRATE ?auto_23233 ) ( not ( = ?auto_23232 ?auto_23233 ) ) ( not ( = ?auto_23234 ?auto_23232 ) ) ( not ( = ?auto_23235 ?auto_23232 ) ) ( not ( = ?auto_23239 ?auto_23232 ) ) ( not ( = ?auto_23240 ?auto_23232 ) ) ( not ( = ?auto_23237 ?auto_23248 ) ) ( not ( = ?auto_23238 ?auto_23237 ) ) ( not ( = ?auto_23243 ?auto_23237 ) ) ( HOIST-AT ?auto_23236 ?auto_23237 ) ( not ( = ?auto_23245 ?auto_23236 ) ) ( not ( = ?auto_23246 ?auto_23236 ) ) ( not ( = ?auto_23241 ?auto_23236 ) ) ( AVAILABLE ?auto_23236 ) ( SURFACE-AT ?auto_23233 ?auto_23237 ) ( ON ?auto_23233 ?auto_23247 ) ( CLEAR ?auto_23233 ) ( not ( = ?auto_23234 ?auto_23247 ) ) ( not ( = ?auto_23235 ?auto_23247 ) ) ( not ( = ?auto_23233 ?auto_23247 ) ) ( not ( = ?auto_23239 ?auto_23247 ) ) ( not ( = ?auto_23240 ?auto_23247 ) ) ( not ( = ?auto_23232 ?auto_23247 ) ) ( SURFACE-AT ?auto_23231 ?auto_23248 ) ( CLEAR ?auto_23231 ) ( IS-CRATE ?auto_23232 ) ( not ( = ?auto_23231 ?auto_23232 ) ) ( not ( = ?auto_23234 ?auto_23231 ) ) ( not ( = ?auto_23235 ?auto_23231 ) ) ( not ( = ?auto_23233 ?auto_23231 ) ) ( not ( = ?auto_23239 ?auto_23231 ) ) ( not ( = ?auto_23240 ?auto_23231 ) ) ( not ( = ?auto_23247 ?auto_23231 ) ) ( AVAILABLE ?auto_23245 ) ( TRUCK-AT ?auto_23244 ?auto_23243 ) ( AVAILABLE ?auto_23241 ) ( SURFACE-AT ?auto_23232 ?auto_23243 ) ( ON ?auto_23232 ?auto_23242 ) ( CLEAR ?auto_23232 ) ( not ( = ?auto_23234 ?auto_23242 ) ) ( not ( = ?auto_23235 ?auto_23242 ) ) ( not ( = ?auto_23233 ?auto_23242 ) ) ( not ( = ?auto_23239 ?auto_23242 ) ) ( not ( = ?auto_23240 ?auto_23242 ) ) ( not ( = ?auto_23232 ?auto_23242 ) ) ( not ( = ?auto_23247 ?auto_23242 ) ) ( not ( = ?auto_23231 ?auto_23242 ) ) ( ON ?auto_23231 ?auto_23230 ) ( not ( = ?auto_23230 ?auto_23231 ) ) ( not ( = ?auto_23230 ?auto_23232 ) ) ( not ( = ?auto_23230 ?auto_23233 ) ) ( not ( = ?auto_23230 ?auto_23234 ) ) ( not ( = ?auto_23230 ?auto_23235 ) ) ( not ( = ?auto_23230 ?auto_23239 ) ) ( not ( = ?auto_23230 ?auto_23240 ) ) ( not ( = ?auto_23230 ?auto_23247 ) ) ( not ( = ?auto_23230 ?auto_23242 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23233 ?auto_23234 ?auto_23235 )
      ( MAKE-5CRATE-VERIFY ?auto_23230 ?auto_23231 ?auto_23232 ?auto_23233 ?auto_23234 ?auto_23235 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23249 - SURFACE
      ?auto_23250 - SURFACE
    )
    :vars
    (
      ?auto_23262 - HOIST
      ?auto_23266 - PLACE
      ?auto_23256 - SURFACE
      ?auto_23254 - PLACE
      ?auto_23263 - HOIST
      ?auto_23255 - SURFACE
      ?auto_23260 - PLACE
      ?auto_23258 - HOIST
      ?auto_23257 - SURFACE
      ?auto_23265 - SURFACE
      ?auto_23253 - PLACE
      ?auto_23252 - HOIST
      ?auto_23264 - SURFACE
      ?auto_23251 - SURFACE
      ?auto_23259 - SURFACE
      ?auto_23261 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23262 ?auto_23266 ) ( IS-CRATE ?auto_23250 ) ( not ( = ?auto_23249 ?auto_23250 ) ) ( not ( = ?auto_23256 ?auto_23249 ) ) ( not ( = ?auto_23256 ?auto_23250 ) ) ( not ( = ?auto_23254 ?auto_23266 ) ) ( HOIST-AT ?auto_23263 ?auto_23254 ) ( not ( = ?auto_23262 ?auto_23263 ) ) ( AVAILABLE ?auto_23263 ) ( SURFACE-AT ?auto_23250 ?auto_23254 ) ( ON ?auto_23250 ?auto_23255 ) ( CLEAR ?auto_23250 ) ( not ( = ?auto_23249 ?auto_23255 ) ) ( not ( = ?auto_23250 ?auto_23255 ) ) ( not ( = ?auto_23256 ?auto_23255 ) ) ( IS-CRATE ?auto_23249 ) ( not ( = ?auto_23260 ?auto_23266 ) ) ( not ( = ?auto_23254 ?auto_23260 ) ) ( HOIST-AT ?auto_23258 ?auto_23260 ) ( not ( = ?auto_23262 ?auto_23258 ) ) ( not ( = ?auto_23263 ?auto_23258 ) ) ( SURFACE-AT ?auto_23249 ?auto_23260 ) ( ON ?auto_23249 ?auto_23257 ) ( CLEAR ?auto_23249 ) ( not ( = ?auto_23249 ?auto_23257 ) ) ( not ( = ?auto_23250 ?auto_23257 ) ) ( not ( = ?auto_23256 ?auto_23257 ) ) ( not ( = ?auto_23255 ?auto_23257 ) ) ( IS-CRATE ?auto_23256 ) ( not ( = ?auto_23265 ?auto_23256 ) ) ( not ( = ?auto_23249 ?auto_23265 ) ) ( not ( = ?auto_23250 ?auto_23265 ) ) ( not ( = ?auto_23255 ?auto_23265 ) ) ( not ( = ?auto_23257 ?auto_23265 ) ) ( not ( = ?auto_23253 ?auto_23266 ) ) ( not ( = ?auto_23254 ?auto_23253 ) ) ( not ( = ?auto_23260 ?auto_23253 ) ) ( HOIST-AT ?auto_23252 ?auto_23253 ) ( not ( = ?auto_23262 ?auto_23252 ) ) ( not ( = ?auto_23263 ?auto_23252 ) ) ( not ( = ?auto_23258 ?auto_23252 ) ) ( AVAILABLE ?auto_23252 ) ( SURFACE-AT ?auto_23256 ?auto_23253 ) ( ON ?auto_23256 ?auto_23264 ) ( CLEAR ?auto_23256 ) ( not ( = ?auto_23249 ?auto_23264 ) ) ( not ( = ?auto_23250 ?auto_23264 ) ) ( not ( = ?auto_23256 ?auto_23264 ) ) ( not ( = ?auto_23255 ?auto_23264 ) ) ( not ( = ?auto_23257 ?auto_23264 ) ) ( not ( = ?auto_23265 ?auto_23264 ) ) ( SURFACE-AT ?auto_23251 ?auto_23266 ) ( CLEAR ?auto_23251 ) ( IS-CRATE ?auto_23265 ) ( not ( = ?auto_23251 ?auto_23265 ) ) ( not ( = ?auto_23249 ?auto_23251 ) ) ( not ( = ?auto_23250 ?auto_23251 ) ) ( not ( = ?auto_23256 ?auto_23251 ) ) ( not ( = ?auto_23255 ?auto_23251 ) ) ( not ( = ?auto_23257 ?auto_23251 ) ) ( not ( = ?auto_23264 ?auto_23251 ) ) ( AVAILABLE ?auto_23262 ) ( AVAILABLE ?auto_23258 ) ( SURFACE-AT ?auto_23265 ?auto_23260 ) ( ON ?auto_23265 ?auto_23259 ) ( CLEAR ?auto_23265 ) ( not ( = ?auto_23249 ?auto_23259 ) ) ( not ( = ?auto_23250 ?auto_23259 ) ) ( not ( = ?auto_23256 ?auto_23259 ) ) ( not ( = ?auto_23255 ?auto_23259 ) ) ( not ( = ?auto_23257 ?auto_23259 ) ) ( not ( = ?auto_23265 ?auto_23259 ) ) ( not ( = ?auto_23264 ?auto_23259 ) ) ( not ( = ?auto_23251 ?auto_23259 ) ) ( TRUCK-AT ?auto_23261 ?auto_23266 ) )
    :subtasks
    ( ( !DRIVE ?auto_23261 ?auto_23266 ?auto_23260 )
      ( MAKE-2CRATE ?auto_23256 ?auto_23249 ?auto_23250 )
      ( MAKE-1CRATE-VERIFY ?auto_23249 ?auto_23250 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23267 - SURFACE
      ?auto_23268 - SURFACE
      ?auto_23269 - SURFACE
    )
    :vars
    (
      ?auto_23270 - HOIST
      ?auto_23281 - PLACE
      ?auto_23272 - PLACE
      ?auto_23274 - HOIST
      ?auto_23282 - SURFACE
      ?auto_23276 - PLACE
      ?auto_23277 - HOIST
      ?auto_23280 - SURFACE
      ?auto_23271 - SURFACE
      ?auto_23275 - PLACE
      ?auto_23283 - HOIST
      ?auto_23273 - SURFACE
      ?auto_23279 - SURFACE
      ?auto_23278 - SURFACE
      ?auto_23284 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23270 ?auto_23281 ) ( IS-CRATE ?auto_23269 ) ( not ( = ?auto_23268 ?auto_23269 ) ) ( not ( = ?auto_23267 ?auto_23268 ) ) ( not ( = ?auto_23267 ?auto_23269 ) ) ( not ( = ?auto_23272 ?auto_23281 ) ) ( HOIST-AT ?auto_23274 ?auto_23272 ) ( not ( = ?auto_23270 ?auto_23274 ) ) ( AVAILABLE ?auto_23274 ) ( SURFACE-AT ?auto_23269 ?auto_23272 ) ( ON ?auto_23269 ?auto_23282 ) ( CLEAR ?auto_23269 ) ( not ( = ?auto_23268 ?auto_23282 ) ) ( not ( = ?auto_23269 ?auto_23282 ) ) ( not ( = ?auto_23267 ?auto_23282 ) ) ( IS-CRATE ?auto_23268 ) ( not ( = ?auto_23276 ?auto_23281 ) ) ( not ( = ?auto_23272 ?auto_23276 ) ) ( HOIST-AT ?auto_23277 ?auto_23276 ) ( not ( = ?auto_23270 ?auto_23277 ) ) ( not ( = ?auto_23274 ?auto_23277 ) ) ( SURFACE-AT ?auto_23268 ?auto_23276 ) ( ON ?auto_23268 ?auto_23280 ) ( CLEAR ?auto_23268 ) ( not ( = ?auto_23268 ?auto_23280 ) ) ( not ( = ?auto_23269 ?auto_23280 ) ) ( not ( = ?auto_23267 ?auto_23280 ) ) ( not ( = ?auto_23282 ?auto_23280 ) ) ( IS-CRATE ?auto_23267 ) ( not ( = ?auto_23271 ?auto_23267 ) ) ( not ( = ?auto_23268 ?auto_23271 ) ) ( not ( = ?auto_23269 ?auto_23271 ) ) ( not ( = ?auto_23282 ?auto_23271 ) ) ( not ( = ?auto_23280 ?auto_23271 ) ) ( not ( = ?auto_23275 ?auto_23281 ) ) ( not ( = ?auto_23272 ?auto_23275 ) ) ( not ( = ?auto_23276 ?auto_23275 ) ) ( HOIST-AT ?auto_23283 ?auto_23275 ) ( not ( = ?auto_23270 ?auto_23283 ) ) ( not ( = ?auto_23274 ?auto_23283 ) ) ( not ( = ?auto_23277 ?auto_23283 ) ) ( AVAILABLE ?auto_23283 ) ( SURFACE-AT ?auto_23267 ?auto_23275 ) ( ON ?auto_23267 ?auto_23273 ) ( CLEAR ?auto_23267 ) ( not ( = ?auto_23268 ?auto_23273 ) ) ( not ( = ?auto_23269 ?auto_23273 ) ) ( not ( = ?auto_23267 ?auto_23273 ) ) ( not ( = ?auto_23282 ?auto_23273 ) ) ( not ( = ?auto_23280 ?auto_23273 ) ) ( not ( = ?auto_23271 ?auto_23273 ) ) ( SURFACE-AT ?auto_23279 ?auto_23281 ) ( CLEAR ?auto_23279 ) ( IS-CRATE ?auto_23271 ) ( not ( = ?auto_23279 ?auto_23271 ) ) ( not ( = ?auto_23268 ?auto_23279 ) ) ( not ( = ?auto_23269 ?auto_23279 ) ) ( not ( = ?auto_23267 ?auto_23279 ) ) ( not ( = ?auto_23282 ?auto_23279 ) ) ( not ( = ?auto_23280 ?auto_23279 ) ) ( not ( = ?auto_23273 ?auto_23279 ) ) ( AVAILABLE ?auto_23270 ) ( AVAILABLE ?auto_23277 ) ( SURFACE-AT ?auto_23271 ?auto_23276 ) ( ON ?auto_23271 ?auto_23278 ) ( CLEAR ?auto_23271 ) ( not ( = ?auto_23268 ?auto_23278 ) ) ( not ( = ?auto_23269 ?auto_23278 ) ) ( not ( = ?auto_23267 ?auto_23278 ) ) ( not ( = ?auto_23282 ?auto_23278 ) ) ( not ( = ?auto_23280 ?auto_23278 ) ) ( not ( = ?auto_23271 ?auto_23278 ) ) ( not ( = ?auto_23273 ?auto_23278 ) ) ( not ( = ?auto_23279 ?auto_23278 ) ) ( TRUCK-AT ?auto_23284 ?auto_23281 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23268 ?auto_23269 )
      ( MAKE-2CRATE-VERIFY ?auto_23267 ?auto_23268 ?auto_23269 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23285 - SURFACE
      ?auto_23286 - SURFACE
      ?auto_23287 - SURFACE
      ?auto_23288 - SURFACE
    )
    :vars
    (
      ?auto_23299 - HOIST
      ?auto_23293 - PLACE
      ?auto_23292 - PLACE
      ?auto_23301 - HOIST
      ?auto_23302 - SURFACE
      ?auto_23289 - PLACE
      ?auto_23295 - HOIST
      ?auto_23298 - SURFACE
      ?auto_23297 - PLACE
      ?auto_23290 - HOIST
      ?auto_23300 - SURFACE
      ?auto_23294 - SURFACE
      ?auto_23291 - SURFACE
      ?auto_23296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23299 ?auto_23293 ) ( IS-CRATE ?auto_23288 ) ( not ( = ?auto_23287 ?auto_23288 ) ) ( not ( = ?auto_23286 ?auto_23287 ) ) ( not ( = ?auto_23286 ?auto_23288 ) ) ( not ( = ?auto_23292 ?auto_23293 ) ) ( HOIST-AT ?auto_23301 ?auto_23292 ) ( not ( = ?auto_23299 ?auto_23301 ) ) ( AVAILABLE ?auto_23301 ) ( SURFACE-AT ?auto_23288 ?auto_23292 ) ( ON ?auto_23288 ?auto_23302 ) ( CLEAR ?auto_23288 ) ( not ( = ?auto_23287 ?auto_23302 ) ) ( not ( = ?auto_23288 ?auto_23302 ) ) ( not ( = ?auto_23286 ?auto_23302 ) ) ( IS-CRATE ?auto_23287 ) ( not ( = ?auto_23289 ?auto_23293 ) ) ( not ( = ?auto_23292 ?auto_23289 ) ) ( HOIST-AT ?auto_23295 ?auto_23289 ) ( not ( = ?auto_23299 ?auto_23295 ) ) ( not ( = ?auto_23301 ?auto_23295 ) ) ( SURFACE-AT ?auto_23287 ?auto_23289 ) ( ON ?auto_23287 ?auto_23298 ) ( CLEAR ?auto_23287 ) ( not ( = ?auto_23287 ?auto_23298 ) ) ( not ( = ?auto_23288 ?auto_23298 ) ) ( not ( = ?auto_23286 ?auto_23298 ) ) ( not ( = ?auto_23302 ?auto_23298 ) ) ( IS-CRATE ?auto_23286 ) ( not ( = ?auto_23285 ?auto_23286 ) ) ( not ( = ?auto_23287 ?auto_23285 ) ) ( not ( = ?auto_23288 ?auto_23285 ) ) ( not ( = ?auto_23302 ?auto_23285 ) ) ( not ( = ?auto_23298 ?auto_23285 ) ) ( not ( = ?auto_23297 ?auto_23293 ) ) ( not ( = ?auto_23292 ?auto_23297 ) ) ( not ( = ?auto_23289 ?auto_23297 ) ) ( HOIST-AT ?auto_23290 ?auto_23297 ) ( not ( = ?auto_23299 ?auto_23290 ) ) ( not ( = ?auto_23301 ?auto_23290 ) ) ( not ( = ?auto_23295 ?auto_23290 ) ) ( AVAILABLE ?auto_23290 ) ( SURFACE-AT ?auto_23286 ?auto_23297 ) ( ON ?auto_23286 ?auto_23300 ) ( CLEAR ?auto_23286 ) ( not ( = ?auto_23287 ?auto_23300 ) ) ( not ( = ?auto_23288 ?auto_23300 ) ) ( not ( = ?auto_23286 ?auto_23300 ) ) ( not ( = ?auto_23302 ?auto_23300 ) ) ( not ( = ?auto_23298 ?auto_23300 ) ) ( not ( = ?auto_23285 ?auto_23300 ) ) ( SURFACE-AT ?auto_23294 ?auto_23293 ) ( CLEAR ?auto_23294 ) ( IS-CRATE ?auto_23285 ) ( not ( = ?auto_23294 ?auto_23285 ) ) ( not ( = ?auto_23287 ?auto_23294 ) ) ( not ( = ?auto_23288 ?auto_23294 ) ) ( not ( = ?auto_23286 ?auto_23294 ) ) ( not ( = ?auto_23302 ?auto_23294 ) ) ( not ( = ?auto_23298 ?auto_23294 ) ) ( not ( = ?auto_23300 ?auto_23294 ) ) ( AVAILABLE ?auto_23299 ) ( AVAILABLE ?auto_23295 ) ( SURFACE-AT ?auto_23285 ?auto_23289 ) ( ON ?auto_23285 ?auto_23291 ) ( CLEAR ?auto_23285 ) ( not ( = ?auto_23287 ?auto_23291 ) ) ( not ( = ?auto_23288 ?auto_23291 ) ) ( not ( = ?auto_23286 ?auto_23291 ) ) ( not ( = ?auto_23302 ?auto_23291 ) ) ( not ( = ?auto_23298 ?auto_23291 ) ) ( not ( = ?auto_23285 ?auto_23291 ) ) ( not ( = ?auto_23300 ?auto_23291 ) ) ( not ( = ?auto_23294 ?auto_23291 ) ) ( TRUCK-AT ?auto_23296 ?auto_23293 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23286 ?auto_23287 ?auto_23288 )
      ( MAKE-3CRATE-VERIFY ?auto_23285 ?auto_23286 ?auto_23287 ?auto_23288 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23303 - SURFACE
      ?auto_23304 - SURFACE
      ?auto_23305 - SURFACE
      ?auto_23306 - SURFACE
      ?auto_23307 - SURFACE
    )
    :vars
    (
      ?auto_23317 - HOIST
      ?auto_23312 - PLACE
      ?auto_23311 - PLACE
      ?auto_23319 - HOIST
      ?auto_23320 - SURFACE
      ?auto_23308 - PLACE
      ?auto_23313 - HOIST
      ?auto_23316 - SURFACE
      ?auto_23315 - PLACE
      ?auto_23309 - HOIST
      ?auto_23318 - SURFACE
      ?auto_23310 - SURFACE
      ?auto_23314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23317 ?auto_23312 ) ( IS-CRATE ?auto_23307 ) ( not ( = ?auto_23306 ?auto_23307 ) ) ( not ( = ?auto_23305 ?auto_23306 ) ) ( not ( = ?auto_23305 ?auto_23307 ) ) ( not ( = ?auto_23311 ?auto_23312 ) ) ( HOIST-AT ?auto_23319 ?auto_23311 ) ( not ( = ?auto_23317 ?auto_23319 ) ) ( AVAILABLE ?auto_23319 ) ( SURFACE-AT ?auto_23307 ?auto_23311 ) ( ON ?auto_23307 ?auto_23320 ) ( CLEAR ?auto_23307 ) ( not ( = ?auto_23306 ?auto_23320 ) ) ( not ( = ?auto_23307 ?auto_23320 ) ) ( not ( = ?auto_23305 ?auto_23320 ) ) ( IS-CRATE ?auto_23306 ) ( not ( = ?auto_23308 ?auto_23312 ) ) ( not ( = ?auto_23311 ?auto_23308 ) ) ( HOIST-AT ?auto_23313 ?auto_23308 ) ( not ( = ?auto_23317 ?auto_23313 ) ) ( not ( = ?auto_23319 ?auto_23313 ) ) ( SURFACE-AT ?auto_23306 ?auto_23308 ) ( ON ?auto_23306 ?auto_23316 ) ( CLEAR ?auto_23306 ) ( not ( = ?auto_23306 ?auto_23316 ) ) ( not ( = ?auto_23307 ?auto_23316 ) ) ( not ( = ?auto_23305 ?auto_23316 ) ) ( not ( = ?auto_23320 ?auto_23316 ) ) ( IS-CRATE ?auto_23305 ) ( not ( = ?auto_23304 ?auto_23305 ) ) ( not ( = ?auto_23306 ?auto_23304 ) ) ( not ( = ?auto_23307 ?auto_23304 ) ) ( not ( = ?auto_23320 ?auto_23304 ) ) ( not ( = ?auto_23316 ?auto_23304 ) ) ( not ( = ?auto_23315 ?auto_23312 ) ) ( not ( = ?auto_23311 ?auto_23315 ) ) ( not ( = ?auto_23308 ?auto_23315 ) ) ( HOIST-AT ?auto_23309 ?auto_23315 ) ( not ( = ?auto_23317 ?auto_23309 ) ) ( not ( = ?auto_23319 ?auto_23309 ) ) ( not ( = ?auto_23313 ?auto_23309 ) ) ( AVAILABLE ?auto_23309 ) ( SURFACE-AT ?auto_23305 ?auto_23315 ) ( ON ?auto_23305 ?auto_23318 ) ( CLEAR ?auto_23305 ) ( not ( = ?auto_23306 ?auto_23318 ) ) ( not ( = ?auto_23307 ?auto_23318 ) ) ( not ( = ?auto_23305 ?auto_23318 ) ) ( not ( = ?auto_23320 ?auto_23318 ) ) ( not ( = ?auto_23316 ?auto_23318 ) ) ( not ( = ?auto_23304 ?auto_23318 ) ) ( SURFACE-AT ?auto_23303 ?auto_23312 ) ( CLEAR ?auto_23303 ) ( IS-CRATE ?auto_23304 ) ( not ( = ?auto_23303 ?auto_23304 ) ) ( not ( = ?auto_23306 ?auto_23303 ) ) ( not ( = ?auto_23307 ?auto_23303 ) ) ( not ( = ?auto_23305 ?auto_23303 ) ) ( not ( = ?auto_23320 ?auto_23303 ) ) ( not ( = ?auto_23316 ?auto_23303 ) ) ( not ( = ?auto_23318 ?auto_23303 ) ) ( AVAILABLE ?auto_23317 ) ( AVAILABLE ?auto_23313 ) ( SURFACE-AT ?auto_23304 ?auto_23308 ) ( ON ?auto_23304 ?auto_23310 ) ( CLEAR ?auto_23304 ) ( not ( = ?auto_23306 ?auto_23310 ) ) ( not ( = ?auto_23307 ?auto_23310 ) ) ( not ( = ?auto_23305 ?auto_23310 ) ) ( not ( = ?auto_23320 ?auto_23310 ) ) ( not ( = ?auto_23316 ?auto_23310 ) ) ( not ( = ?auto_23304 ?auto_23310 ) ) ( not ( = ?auto_23318 ?auto_23310 ) ) ( not ( = ?auto_23303 ?auto_23310 ) ) ( TRUCK-AT ?auto_23314 ?auto_23312 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23305 ?auto_23306 ?auto_23307 )
      ( MAKE-4CRATE-VERIFY ?auto_23303 ?auto_23304 ?auto_23305 ?auto_23306 ?auto_23307 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23321 - SURFACE
      ?auto_23322 - SURFACE
      ?auto_23323 - SURFACE
      ?auto_23324 - SURFACE
      ?auto_23325 - SURFACE
      ?auto_23326 - SURFACE
    )
    :vars
    (
      ?auto_23336 - HOIST
      ?auto_23331 - PLACE
      ?auto_23330 - PLACE
      ?auto_23338 - HOIST
      ?auto_23339 - SURFACE
      ?auto_23327 - PLACE
      ?auto_23332 - HOIST
      ?auto_23335 - SURFACE
      ?auto_23334 - PLACE
      ?auto_23328 - HOIST
      ?auto_23337 - SURFACE
      ?auto_23329 - SURFACE
      ?auto_23333 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23336 ?auto_23331 ) ( IS-CRATE ?auto_23326 ) ( not ( = ?auto_23325 ?auto_23326 ) ) ( not ( = ?auto_23324 ?auto_23325 ) ) ( not ( = ?auto_23324 ?auto_23326 ) ) ( not ( = ?auto_23330 ?auto_23331 ) ) ( HOIST-AT ?auto_23338 ?auto_23330 ) ( not ( = ?auto_23336 ?auto_23338 ) ) ( AVAILABLE ?auto_23338 ) ( SURFACE-AT ?auto_23326 ?auto_23330 ) ( ON ?auto_23326 ?auto_23339 ) ( CLEAR ?auto_23326 ) ( not ( = ?auto_23325 ?auto_23339 ) ) ( not ( = ?auto_23326 ?auto_23339 ) ) ( not ( = ?auto_23324 ?auto_23339 ) ) ( IS-CRATE ?auto_23325 ) ( not ( = ?auto_23327 ?auto_23331 ) ) ( not ( = ?auto_23330 ?auto_23327 ) ) ( HOIST-AT ?auto_23332 ?auto_23327 ) ( not ( = ?auto_23336 ?auto_23332 ) ) ( not ( = ?auto_23338 ?auto_23332 ) ) ( SURFACE-AT ?auto_23325 ?auto_23327 ) ( ON ?auto_23325 ?auto_23335 ) ( CLEAR ?auto_23325 ) ( not ( = ?auto_23325 ?auto_23335 ) ) ( not ( = ?auto_23326 ?auto_23335 ) ) ( not ( = ?auto_23324 ?auto_23335 ) ) ( not ( = ?auto_23339 ?auto_23335 ) ) ( IS-CRATE ?auto_23324 ) ( not ( = ?auto_23323 ?auto_23324 ) ) ( not ( = ?auto_23325 ?auto_23323 ) ) ( not ( = ?auto_23326 ?auto_23323 ) ) ( not ( = ?auto_23339 ?auto_23323 ) ) ( not ( = ?auto_23335 ?auto_23323 ) ) ( not ( = ?auto_23334 ?auto_23331 ) ) ( not ( = ?auto_23330 ?auto_23334 ) ) ( not ( = ?auto_23327 ?auto_23334 ) ) ( HOIST-AT ?auto_23328 ?auto_23334 ) ( not ( = ?auto_23336 ?auto_23328 ) ) ( not ( = ?auto_23338 ?auto_23328 ) ) ( not ( = ?auto_23332 ?auto_23328 ) ) ( AVAILABLE ?auto_23328 ) ( SURFACE-AT ?auto_23324 ?auto_23334 ) ( ON ?auto_23324 ?auto_23337 ) ( CLEAR ?auto_23324 ) ( not ( = ?auto_23325 ?auto_23337 ) ) ( not ( = ?auto_23326 ?auto_23337 ) ) ( not ( = ?auto_23324 ?auto_23337 ) ) ( not ( = ?auto_23339 ?auto_23337 ) ) ( not ( = ?auto_23335 ?auto_23337 ) ) ( not ( = ?auto_23323 ?auto_23337 ) ) ( SURFACE-AT ?auto_23322 ?auto_23331 ) ( CLEAR ?auto_23322 ) ( IS-CRATE ?auto_23323 ) ( not ( = ?auto_23322 ?auto_23323 ) ) ( not ( = ?auto_23325 ?auto_23322 ) ) ( not ( = ?auto_23326 ?auto_23322 ) ) ( not ( = ?auto_23324 ?auto_23322 ) ) ( not ( = ?auto_23339 ?auto_23322 ) ) ( not ( = ?auto_23335 ?auto_23322 ) ) ( not ( = ?auto_23337 ?auto_23322 ) ) ( AVAILABLE ?auto_23336 ) ( AVAILABLE ?auto_23332 ) ( SURFACE-AT ?auto_23323 ?auto_23327 ) ( ON ?auto_23323 ?auto_23329 ) ( CLEAR ?auto_23323 ) ( not ( = ?auto_23325 ?auto_23329 ) ) ( not ( = ?auto_23326 ?auto_23329 ) ) ( not ( = ?auto_23324 ?auto_23329 ) ) ( not ( = ?auto_23339 ?auto_23329 ) ) ( not ( = ?auto_23335 ?auto_23329 ) ) ( not ( = ?auto_23323 ?auto_23329 ) ) ( not ( = ?auto_23337 ?auto_23329 ) ) ( not ( = ?auto_23322 ?auto_23329 ) ) ( TRUCK-AT ?auto_23333 ?auto_23331 ) ( ON ?auto_23322 ?auto_23321 ) ( not ( = ?auto_23321 ?auto_23322 ) ) ( not ( = ?auto_23321 ?auto_23323 ) ) ( not ( = ?auto_23321 ?auto_23324 ) ) ( not ( = ?auto_23321 ?auto_23325 ) ) ( not ( = ?auto_23321 ?auto_23326 ) ) ( not ( = ?auto_23321 ?auto_23339 ) ) ( not ( = ?auto_23321 ?auto_23335 ) ) ( not ( = ?auto_23321 ?auto_23337 ) ) ( not ( = ?auto_23321 ?auto_23329 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23324 ?auto_23325 ?auto_23326 )
      ( MAKE-5CRATE-VERIFY ?auto_23321 ?auto_23322 ?auto_23323 ?auto_23324 ?auto_23325 ?auto_23326 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23340 - SURFACE
      ?auto_23341 - SURFACE
    )
    :vars
    (
      ?auto_23352 - HOIST
      ?auto_23346 - PLACE
      ?auto_23355 - SURFACE
      ?auto_23345 - PLACE
      ?auto_23354 - HOIST
      ?auto_23357 - SURFACE
      ?auto_23342 - PLACE
      ?auto_23348 - HOIST
      ?auto_23351 - SURFACE
      ?auto_23356 - SURFACE
      ?auto_23350 - PLACE
      ?auto_23343 - HOIST
      ?auto_23353 - SURFACE
      ?auto_23347 - SURFACE
      ?auto_23344 - SURFACE
      ?auto_23349 - TRUCK
      ?auto_23358 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23352 ?auto_23346 ) ( IS-CRATE ?auto_23341 ) ( not ( = ?auto_23340 ?auto_23341 ) ) ( not ( = ?auto_23355 ?auto_23340 ) ) ( not ( = ?auto_23355 ?auto_23341 ) ) ( not ( = ?auto_23345 ?auto_23346 ) ) ( HOIST-AT ?auto_23354 ?auto_23345 ) ( not ( = ?auto_23352 ?auto_23354 ) ) ( AVAILABLE ?auto_23354 ) ( SURFACE-AT ?auto_23341 ?auto_23345 ) ( ON ?auto_23341 ?auto_23357 ) ( CLEAR ?auto_23341 ) ( not ( = ?auto_23340 ?auto_23357 ) ) ( not ( = ?auto_23341 ?auto_23357 ) ) ( not ( = ?auto_23355 ?auto_23357 ) ) ( IS-CRATE ?auto_23340 ) ( not ( = ?auto_23342 ?auto_23346 ) ) ( not ( = ?auto_23345 ?auto_23342 ) ) ( HOIST-AT ?auto_23348 ?auto_23342 ) ( not ( = ?auto_23352 ?auto_23348 ) ) ( not ( = ?auto_23354 ?auto_23348 ) ) ( SURFACE-AT ?auto_23340 ?auto_23342 ) ( ON ?auto_23340 ?auto_23351 ) ( CLEAR ?auto_23340 ) ( not ( = ?auto_23340 ?auto_23351 ) ) ( not ( = ?auto_23341 ?auto_23351 ) ) ( not ( = ?auto_23355 ?auto_23351 ) ) ( not ( = ?auto_23357 ?auto_23351 ) ) ( IS-CRATE ?auto_23355 ) ( not ( = ?auto_23356 ?auto_23355 ) ) ( not ( = ?auto_23340 ?auto_23356 ) ) ( not ( = ?auto_23341 ?auto_23356 ) ) ( not ( = ?auto_23357 ?auto_23356 ) ) ( not ( = ?auto_23351 ?auto_23356 ) ) ( not ( = ?auto_23350 ?auto_23346 ) ) ( not ( = ?auto_23345 ?auto_23350 ) ) ( not ( = ?auto_23342 ?auto_23350 ) ) ( HOIST-AT ?auto_23343 ?auto_23350 ) ( not ( = ?auto_23352 ?auto_23343 ) ) ( not ( = ?auto_23354 ?auto_23343 ) ) ( not ( = ?auto_23348 ?auto_23343 ) ) ( AVAILABLE ?auto_23343 ) ( SURFACE-AT ?auto_23355 ?auto_23350 ) ( ON ?auto_23355 ?auto_23353 ) ( CLEAR ?auto_23355 ) ( not ( = ?auto_23340 ?auto_23353 ) ) ( not ( = ?auto_23341 ?auto_23353 ) ) ( not ( = ?auto_23355 ?auto_23353 ) ) ( not ( = ?auto_23357 ?auto_23353 ) ) ( not ( = ?auto_23351 ?auto_23353 ) ) ( not ( = ?auto_23356 ?auto_23353 ) ) ( IS-CRATE ?auto_23356 ) ( not ( = ?auto_23347 ?auto_23356 ) ) ( not ( = ?auto_23340 ?auto_23347 ) ) ( not ( = ?auto_23341 ?auto_23347 ) ) ( not ( = ?auto_23355 ?auto_23347 ) ) ( not ( = ?auto_23357 ?auto_23347 ) ) ( not ( = ?auto_23351 ?auto_23347 ) ) ( not ( = ?auto_23353 ?auto_23347 ) ) ( AVAILABLE ?auto_23348 ) ( SURFACE-AT ?auto_23356 ?auto_23342 ) ( ON ?auto_23356 ?auto_23344 ) ( CLEAR ?auto_23356 ) ( not ( = ?auto_23340 ?auto_23344 ) ) ( not ( = ?auto_23341 ?auto_23344 ) ) ( not ( = ?auto_23355 ?auto_23344 ) ) ( not ( = ?auto_23357 ?auto_23344 ) ) ( not ( = ?auto_23351 ?auto_23344 ) ) ( not ( = ?auto_23356 ?auto_23344 ) ) ( not ( = ?auto_23353 ?auto_23344 ) ) ( not ( = ?auto_23347 ?auto_23344 ) ) ( TRUCK-AT ?auto_23349 ?auto_23346 ) ( SURFACE-AT ?auto_23358 ?auto_23346 ) ( CLEAR ?auto_23358 ) ( LIFTING ?auto_23352 ?auto_23347 ) ( IS-CRATE ?auto_23347 ) ( not ( = ?auto_23358 ?auto_23347 ) ) ( not ( = ?auto_23340 ?auto_23358 ) ) ( not ( = ?auto_23341 ?auto_23358 ) ) ( not ( = ?auto_23355 ?auto_23358 ) ) ( not ( = ?auto_23357 ?auto_23358 ) ) ( not ( = ?auto_23351 ?auto_23358 ) ) ( not ( = ?auto_23356 ?auto_23358 ) ) ( not ( = ?auto_23353 ?auto_23358 ) ) ( not ( = ?auto_23344 ?auto_23358 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23358 ?auto_23347 )
      ( MAKE-2CRATE ?auto_23355 ?auto_23340 ?auto_23341 )
      ( MAKE-1CRATE-VERIFY ?auto_23340 ?auto_23341 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23359 - SURFACE
      ?auto_23360 - SURFACE
      ?auto_23361 - SURFACE
    )
    :vars
    (
      ?auto_23372 - HOIST
      ?auto_23364 - PLACE
      ?auto_23366 - PLACE
      ?auto_23367 - HOIST
      ?auto_23362 - SURFACE
      ?auto_23377 - PLACE
      ?auto_23369 - HOIST
      ?auto_23370 - SURFACE
      ?auto_23375 - SURFACE
      ?auto_23371 - PLACE
      ?auto_23376 - HOIST
      ?auto_23373 - SURFACE
      ?auto_23368 - SURFACE
      ?auto_23365 - SURFACE
      ?auto_23374 - TRUCK
      ?auto_23363 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23372 ?auto_23364 ) ( IS-CRATE ?auto_23361 ) ( not ( = ?auto_23360 ?auto_23361 ) ) ( not ( = ?auto_23359 ?auto_23360 ) ) ( not ( = ?auto_23359 ?auto_23361 ) ) ( not ( = ?auto_23366 ?auto_23364 ) ) ( HOIST-AT ?auto_23367 ?auto_23366 ) ( not ( = ?auto_23372 ?auto_23367 ) ) ( AVAILABLE ?auto_23367 ) ( SURFACE-AT ?auto_23361 ?auto_23366 ) ( ON ?auto_23361 ?auto_23362 ) ( CLEAR ?auto_23361 ) ( not ( = ?auto_23360 ?auto_23362 ) ) ( not ( = ?auto_23361 ?auto_23362 ) ) ( not ( = ?auto_23359 ?auto_23362 ) ) ( IS-CRATE ?auto_23360 ) ( not ( = ?auto_23377 ?auto_23364 ) ) ( not ( = ?auto_23366 ?auto_23377 ) ) ( HOIST-AT ?auto_23369 ?auto_23377 ) ( not ( = ?auto_23372 ?auto_23369 ) ) ( not ( = ?auto_23367 ?auto_23369 ) ) ( SURFACE-AT ?auto_23360 ?auto_23377 ) ( ON ?auto_23360 ?auto_23370 ) ( CLEAR ?auto_23360 ) ( not ( = ?auto_23360 ?auto_23370 ) ) ( not ( = ?auto_23361 ?auto_23370 ) ) ( not ( = ?auto_23359 ?auto_23370 ) ) ( not ( = ?auto_23362 ?auto_23370 ) ) ( IS-CRATE ?auto_23359 ) ( not ( = ?auto_23375 ?auto_23359 ) ) ( not ( = ?auto_23360 ?auto_23375 ) ) ( not ( = ?auto_23361 ?auto_23375 ) ) ( not ( = ?auto_23362 ?auto_23375 ) ) ( not ( = ?auto_23370 ?auto_23375 ) ) ( not ( = ?auto_23371 ?auto_23364 ) ) ( not ( = ?auto_23366 ?auto_23371 ) ) ( not ( = ?auto_23377 ?auto_23371 ) ) ( HOIST-AT ?auto_23376 ?auto_23371 ) ( not ( = ?auto_23372 ?auto_23376 ) ) ( not ( = ?auto_23367 ?auto_23376 ) ) ( not ( = ?auto_23369 ?auto_23376 ) ) ( AVAILABLE ?auto_23376 ) ( SURFACE-AT ?auto_23359 ?auto_23371 ) ( ON ?auto_23359 ?auto_23373 ) ( CLEAR ?auto_23359 ) ( not ( = ?auto_23360 ?auto_23373 ) ) ( not ( = ?auto_23361 ?auto_23373 ) ) ( not ( = ?auto_23359 ?auto_23373 ) ) ( not ( = ?auto_23362 ?auto_23373 ) ) ( not ( = ?auto_23370 ?auto_23373 ) ) ( not ( = ?auto_23375 ?auto_23373 ) ) ( IS-CRATE ?auto_23375 ) ( not ( = ?auto_23368 ?auto_23375 ) ) ( not ( = ?auto_23360 ?auto_23368 ) ) ( not ( = ?auto_23361 ?auto_23368 ) ) ( not ( = ?auto_23359 ?auto_23368 ) ) ( not ( = ?auto_23362 ?auto_23368 ) ) ( not ( = ?auto_23370 ?auto_23368 ) ) ( not ( = ?auto_23373 ?auto_23368 ) ) ( AVAILABLE ?auto_23369 ) ( SURFACE-AT ?auto_23375 ?auto_23377 ) ( ON ?auto_23375 ?auto_23365 ) ( CLEAR ?auto_23375 ) ( not ( = ?auto_23360 ?auto_23365 ) ) ( not ( = ?auto_23361 ?auto_23365 ) ) ( not ( = ?auto_23359 ?auto_23365 ) ) ( not ( = ?auto_23362 ?auto_23365 ) ) ( not ( = ?auto_23370 ?auto_23365 ) ) ( not ( = ?auto_23375 ?auto_23365 ) ) ( not ( = ?auto_23373 ?auto_23365 ) ) ( not ( = ?auto_23368 ?auto_23365 ) ) ( TRUCK-AT ?auto_23374 ?auto_23364 ) ( SURFACE-AT ?auto_23363 ?auto_23364 ) ( CLEAR ?auto_23363 ) ( LIFTING ?auto_23372 ?auto_23368 ) ( IS-CRATE ?auto_23368 ) ( not ( = ?auto_23363 ?auto_23368 ) ) ( not ( = ?auto_23360 ?auto_23363 ) ) ( not ( = ?auto_23361 ?auto_23363 ) ) ( not ( = ?auto_23359 ?auto_23363 ) ) ( not ( = ?auto_23362 ?auto_23363 ) ) ( not ( = ?auto_23370 ?auto_23363 ) ) ( not ( = ?auto_23375 ?auto_23363 ) ) ( not ( = ?auto_23373 ?auto_23363 ) ) ( not ( = ?auto_23365 ?auto_23363 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23360 ?auto_23361 )
      ( MAKE-2CRATE-VERIFY ?auto_23359 ?auto_23360 ?auto_23361 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23378 - SURFACE
      ?auto_23379 - SURFACE
      ?auto_23380 - SURFACE
      ?auto_23381 - SURFACE
    )
    :vars
    (
      ?auto_23396 - HOIST
      ?auto_23391 - PLACE
      ?auto_23395 - PLACE
      ?auto_23393 - HOIST
      ?auto_23382 - SURFACE
      ?auto_23389 - PLACE
      ?auto_23388 - HOIST
      ?auto_23385 - SURFACE
      ?auto_23394 - PLACE
      ?auto_23390 - HOIST
      ?auto_23392 - SURFACE
      ?auto_23383 - SURFACE
      ?auto_23384 - SURFACE
      ?auto_23387 - TRUCK
      ?auto_23386 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23396 ?auto_23391 ) ( IS-CRATE ?auto_23381 ) ( not ( = ?auto_23380 ?auto_23381 ) ) ( not ( = ?auto_23379 ?auto_23380 ) ) ( not ( = ?auto_23379 ?auto_23381 ) ) ( not ( = ?auto_23395 ?auto_23391 ) ) ( HOIST-AT ?auto_23393 ?auto_23395 ) ( not ( = ?auto_23396 ?auto_23393 ) ) ( AVAILABLE ?auto_23393 ) ( SURFACE-AT ?auto_23381 ?auto_23395 ) ( ON ?auto_23381 ?auto_23382 ) ( CLEAR ?auto_23381 ) ( not ( = ?auto_23380 ?auto_23382 ) ) ( not ( = ?auto_23381 ?auto_23382 ) ) ( not ( = ?auto_23379 ?auto_23382 ) ) ( IS-CRATE ?auto_23380 ) ( not ( = ?auto_23389 ?auto_23391 ) ) ( not ( = ?auto_23395 ?auto_23389 ) ) ( HOIST-AT ?auto_23388 ?auto_23389 ) ( not ( = ?auto_23396 ?auto_23388 ) ) ( not ( = ?auto_23393 ?auto_23388 ) ) ( SURFACE-AT ?auto_23380 ?auto_23389 ) ( ON ?auto_23380 ?auto_23385 ) ( CLEAR ?auto_23380 ) ( not ( = ?auto_23380 ?auto_23385 ) ) ( not ( = ?auto_23381 ?auto_23385 ) ) ( not ( = ?auto_23379 ?auto_23385 ) ) ( not ( = ?auto_23382 ?auto_23385 ) ) ( IS-CRATE ?auto_23379 ) ( not ( = ?auto_23378 ?auto_23379 ) ) ( not ( = ?auto_23380 ?auto_23378 ) ) ( not ( = ?auto_23381 ?auto_23378 ) ) ( not ( = ?auto_23382 ?auto_23378 ) ) ( not ( = ?auto_23385 ?auto_23378 ) ) ( not ( = ?auto_23394 ?auto_23391 ) ) ( not ( = ?auto_23395 ?auto_23394 ) ) ( not ( = ?auto_23389 ?auto_23394 ) ) ( HOIST-AT ?auto_23390 ?auto_23394 ) ( not ( = ?auto_23396 ?auto_23390 ) ) ( not ( = ?auto_23393 ?auto_23390 ) ) ( not ( = ?auto_23388 ?auto_23390 ) ) ( AVAILABLE ?auto_23390 ) ( SURFACE-AT ?auto_23379 ?auto_23394 ) ( ON ?auto_23379 ?auto_23392 ) ( CLEAR ?auto_23379 ) ( not ( = ?auto_23380 ?auto_23392 ) ) ( not ( = ?auto_23381 ?auto_23392 ) ) ( not ( = ?auto_23379 ?auto_23392 ) ) ( not ( = ?auto_23382 ?auto_23392 ) ) ( not ( = ?auto_23385 ?auto_23392 ) ) ( not ( = ?auto_23378 ?auto_23392 ) ) ( IS-CRATE ?auto_23378 ) ( not ( = ?auto_23383 ?auto_23378 ) ) ( not ( = ?auto_23380 ?auto_23383 ) ) ( not ( = ?auto_23381 ?auto_23383 ) ) ( not ( = ?auto_23379 ?auto_23383 ) ) ( not ( = ?auto_23382 ?auto_23383 ) ) ( not ( = ?auto_23385 ?auto_23383 ) ) ( not ( = ?auto_23392 ?auto_23383 ) ) ( AVAILABLE ?auto_23388 ) ( SURFACE-AT ?auto_23378 ?auto_23389 ) ( ON ?auto_23378 ?auto_23384 ) ( CLEAR ?auto_23378 ) ( not ( = ?auto_23380 ?auto_23384 ) ) ( not ( = ?auto_23381 ?auto_23384 ) ) ( not ( = ?auto_23379 ?auto_23384 ) ) ( not ( = ?auto_23382 ?auto_23384 ) ) ( not ( = ?auto_23385 ?auto_23384 ) ) ( not ( = ?auto_23378 ?auto_23384 ) ) ( not ( = ?auto_23392 ?auto_23384 ) ) ( not ( = ?auto_23383 ?auto_23384 ) ) ( TRUCK-AT ?auto_23387 ?auto_23391 ) ( SURFACE-AT ?auto_23386 ?auto_23391 ) ( CLEAR ?auto_23386 ) ( LIFTING ?auto_23396 ?auto_23383 ) ( IS-CRATE ?auto_23383 ) ( not ( = ?auto_23386 ?auto_23383 ) ) ( not ( = ?auto_23380 ?auto_23386 ) ) ( not ( = ?auto_23381 ?auto_23386 ) ) ( not ( = ?auto_23379 ?auto_23386 ) ) ( not ( = ?auto_23382 ?auto_23386 ) ) ( not ( = ?auto_23385 ?auto_23386 ) ) ( not ( = ?auto_23378 ?auto_23386 ) ) ( not ( = ?auto_23392 ?auto_23386 ) ) ( not ( = ?auto_23384 ?auto_23386 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23379 ?auto_23380 ?auto_23381 )
      ( MAKE-3CRATE-VERIFY ?auto_23378 ?auto_23379 ?auto_23380 ?auto_23381 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23397 - SURFACE
      ?auto_23398 - SURFACE
      ?auto_23399 - SURFACE
      ?auto_23400 - SURFACE
      ?auto_23401 - SURFACE
    )
    :vars
    (
      ?auto_23415 - HOIST
      ?auto_23410 - PLACE
      ?auto_23414 - PLACE
      ?auto_23412 - HOIST
      ?auto_23402 - SURFACE
      ?auto_23408 - PLACE
      ?auto_23407 - HOIST
      ?auto_23404 - SURFACE
      ?auto_23413 - PLACE
      ?auto_23409 - HOIST
      ?auto_23411 - SURFACE
      ?auto_23403 - SURFACE
      ?auto_23406 - TRUCK
      ?auto_23405 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23415 ?auto_23410 ) ( IS-CRATE ?auto_23401 ) ( not ( = ?auto_23400 ?auto_23401 ) ) ( not ( = ?auto_23399 ?auto_23400 ) ) ( not ( = ?auto_23399 ?auto_23401 ) ) ( not ( = ?auto_23414 ?auto_23410 ) ) ( HOIST-AT ?auto_23412 ?auto_23414 ) ( not ( = ?auto_23415 ?auto_23412 ) ) ( AVAILABLE ?auto_23412 ) ( SURFACE-AT ?auto_23401 ?auto_23414 ) ( ON ?auto_23401 ?auto_23402 ) ( CLEAR ?auto_23401 ) ( not ( = ?auto_23400 ?auto_23402 ) ) ( not ( = ?auto_23401 ?auto_23402 ) ) ( not ( = ?auto_23399 ?auto_23402 ) ) ( IS-CRATE ?auto_23400 ) ( not ( = ?auto_23408 ?auto_23410 ) ) ( not ( = ?auto_23414 ?auto_23408 ) ) ( HOIST-AT ?auto_23407 ?auto_23408 ) ( not ( = ?auto_23415 ?auto_23407 ) ) ( not ( = ?auto_23412 ?auto_23407 ) ) ( SURFACE-AT ?auto_23400 ?auto_23408 ) ( ON ?auto_23400 ?auto_23404 ) ( CLEAR ?auto_23400 ) ( not ( = ?auto_23400 ?auto_23404 ) ) ( not ( = ?auto_23401 ?auto_23404 ) ) ( not ( = ?auto_23399 ?auto_23404 ) ) ( not ( = ?auto_23402 ?auto_23404 ) ) ( IS-CRATE ?auto_23399 ) ( not ( = ?auto_23398 ?auto_23399 ) ) ( not ( = ?auto_23400 ?auto_23398 ) ) ( not ( = ?auto_23401 ?auto_23398 ) ) ( not ( = ?auto_23402 ?auto_23398 ) ) ( not ( = ?auto_23404 ?auto_23398 ) ) ( not ( = ?auto_23413 ?auto_23410 ) ) ( not ( = ?auto_23414 ?auto_23413 ) ) ( not ( = ?auto_23408 ?auto_23413 ) ) ( HOIST-AT ?auto_23409 ?auto_23413 ) ( not ( = ?auto_23415 ?auto_23409 ) ) ( not ( = ?auto_23412 ?auto_23409 ) ) ( not ( = ?auto_23407 ?auto_23409 ) ) ( AVAILABLE ?auto_23409 ) ( SURFACE-AT ?auto_23399 ?auto_23413 ) ( ON ?auto_23399 ?auto_23411 ) ( CLEAR ?auto_23399 ) ( not ( = ?auto_23400 ?auto_23411 ) ) ( not ( = ?auto_23401 ?auto_23411 ) ) ( not ( = ?auto_23399 ?auto_23411 ) ) ( not ( = ?auto_23402 ?auto_23411 ) ) ( not ( = ?auto_23404 ?auto_23411 ) ) ( not ( = ?auto_23398 ?auto_23411 ) ) ( IS-CRATE ?auto_23398 ) ( not ( = ?auto_23397 ?auto_23398 ) ) ( not ( = ?auto_23400 ?auto_23397 ) ) ( not ( = ?auto_23401 ?auto_23397 ) ) ( not ( = ?auto_23399 ?auto_23397 ) ) ( not ( = ?auto_23402 ?auto_23397 ) ) ( not ( = ?auto_23404 ?auto_23397 ) ) ( not ( = ?auto_23411 ?auto_23397 ) ) ( AVAILABLE ?auto_23407 ) ( SURFACE-AT ?auto_23398 ?auto_23408 ) ( ON ?auto_23398 ?auto_23403 ) ( CLEAR ?auto_23398 ) ( not ( = ?auto_23400 ?auto_23403 ) ) ( not ( = ?auto_23401 ?auto_23403 ) ) ( not ( = ?auto_23399 ?auto_23403 ) ) ( not ( = ?auto_23402 ?auto_23403 ) ) ( not ( = ?auto_23404 ?auto_23403 ) ) ( not ( = ?auto_23398 ?auto_23403 ) ) ( not ( = ?auto_23411 ?auto_23403 ) ) ( not ( = ?auto_23397 ?auto_23403 ) ) ( TRUCK-AT ?auto_23406 ?auto_23410 ) ( SURFACE-AT ?auto_23405 ?auto_23410 ) ( CLEAR ?auto_23405 ) ( LIFTING ?auto_23415 ?auto_23397 ) ( IS-CRATE ?auto_23397 ) ( not ( = ?auto_23405 ?auto_23397 ) ) ( not ( = ?auto_23400 ?auto_23405 ) ) ( not ( = ?auto_23401 ?auto_23405 ) ) ( not ( = ?auto_23399 ?auto_23405 ) ) ( not ( = ?auto_23402 ?auto_23405 ) ) ( not ( = ?auto_23404 ?auto_23405 ) ) ( not ( = ?auto_23398 ?auto_23405 ) ) ( not ( = ?auto_23411 ?auto_23405 ) ) ( not ( = ?auto_23403 ?auto_23405 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23399 ?auto_23400 ?auto_23401 )
      ( MAKE-4CRATE-VERIFY ?auto_23397 ?auto_23398 ?auto_23399 ?auto_23400 ?auto_23401 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23416 - SURFACE
      ?auto_23417 - SURFACE
      ?auto_23418 - SURFACE
      ?auto_23419 - SURFACE
      ?auto_23420 - SURFACE
      ?auto_23421 - SURFACE
    )
    :vars
    (
      ?auto_23434 - HOIST
      ?auto_23429 - PLACE
      ?auto_23433 - PLACE
      ?auto_23431 - HOIST
      ?auto_23422 - SURFACE
      ?auto_23427 - PLACE
      ?auto_23426 - HOIST
      ?auto_23424 - SURFACE
      ?auto_23432 - PLACE
      ?auto_23428 - HOIST
      ?auto_23430 - SURFACE
      ?auto_23423 - SURFACE
      ?auto_23425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23434 ?auto_23429 ) ( IS-CRATE ?auto_23421 ) ( not ( = ?auto_23420 ?auto_23421 ) ) ( not ( = ?auto_23419 ?auto_23420 ) ) ( not ( = ?auto_23419 ?auto_23421 ) ) ( not ( = ?auto_23433 ?auto_23429 ) ) ( HOIST-AT ?auto_23431 ?auto_23433 ) ( not ( = ?auto_23434 ?auto_23431 ) ) ( AVAILABLE ?auto_23431 ) ( SURFACE-AT ?auto_23421 ?auto_23433 ) ( ON ?auto_23421 ?auto_23422 ) ( CLEAR ?auto_23421 ) ( not ( = ?auto_23420 ?auto_23422 ) ) ( not ( = ?auto_23421 ?auto_23422 ) ) ( not ( = ?auto_23419 ?auto_23422 ) ) ( IS-CRATE ?auto_23420 ) ( not ( = ?auto_23427 ?auto_23429 ) ) ( not ( = ?auto_23433 ?auto_23427 ) ) ( HOIST-AT ?auto_23426 ?auto_23427 ) ( not ( = ?auto_23434 ?auto_23426 ) ) ( not ( = ?auto_23431 ?auto_23426 ) ) ( SURFACE-AT ?auto_23420 ?auto_23427 ) ( ON ?auto_23420 ?auto_23424 ) ( CLEAR ?auto_23420 ) ( not ( = ?auto_23420 ?auto_23424 ) ) ( not ( = ?auto_23421 ?auto_23424 ) ) ( not ( = ?auto_23419 ?auto_23424 ) ) ( not ( = ?auto_23422 ?auto_23424 ) ) ( IS-CRATE ?auto_23419 ) ( not ( = ?auto_23418 ?auto_23419 ) ) ( not ( = ?auto_23420 ?auto_23418 ) ) ( not ( = ?auto_23421 ?auto_23418 ) ) ( not ( = ?auto_23422 ?auto_23418 ) ) ( not ( = ?auto_23424 ?auto_23418 ) ) ( not ( = ?auto_23432 ?auto_23429 ) ) ( not ( = ?auto_23433 ?auto_23432 ) ) ( not ( = ?auto_23427 ?auto_23432 ) ) ( HOIST-AT ?auto_23428 ?auto_23432 ) ( not ( = ?auto_23434 ?auto_23428 ) ) ( not ( = ?auto_23431 ?auto_23428 ) ) ( not ( = ?auto_23426 ?auto_23428 ) ) ( AVAILABLE ?auto_23428 ) ( SURFACE-AT ?auto_23419 ?auto_23432 ) ( ON ?auto_23419 ?auto_23430 ) ( CLEAR ?auto_23419 ) ( not ( = ?auto_23420 ?auto_23430 ) ) ( not ( = ?auto_23421 ?auto_23430 ) ) ( not ( = ?auto_23419 ?auto_23430 ) ) ( not ( = ?auto_23422 ?auto_23430 ) ) ( not ( = ?auto_23424 ?auto_23430 ) ) ( not ( = ?auto_23418 ?auto_23430 ) ) ( IS-CRATE ?auto_23418 ) ( not ( = ?auto_23417 ?auto_23418 ) ) ( not ( = ?auto_23420 ?auto_23417 ) ) ( not ( = ?auto_23421 ?auto_23417 ) ) ( not ( = ?auto_23419 ?auto_23417 ) ) ( not ( = ?auto_23422 ?auto_23417 ) ) ( not ( = ?auto_23424 ?auto_23417 ) ) ( not ( = ?auto_23430 ?auto_23417 ) ) ( AVAILABLE ?auto_23426 ) ( SURFACE-AT ?auto_23418 ?auto_23427 ) ( ON ?auto_23418 ?auto_23423 ) ( CLEAR ?auto_23418 ) ( not ( = ?auto_23420 ?auto_23423 ) ) ( not ( = ?auto_23421 ?auto_23423 ) ) ( not ( = ?auto_23419 ?auto_23423 ) ) ( not ( = ?auto_23422 ?auto_23423 ) ) ( not ( = ?auto_23424 ?auto_23423 ) ) ( not ( = ?auto_23418 ?auto_23423 ) ) ( not ( = ?auto_23430 ?auto_23423 ) ) ( not ( = ?auto_23417 ?auto_23423 ) ) ( TRUCK-AT ?auto_23425 ?auto_23429 ) ( SURFACE-AT ?auto_23416 ?auto_23429 ) ( CLEAR ?auto_23416 ) ( LIFTING ?auto_23434 ?auto_23417 ) ( IS-CRATE ?auto_23417 ) ( not ( = ?auto_23416 ?auto_23417 ) ) ( not ( = ?auto_23420 ?auto_23416 ) ) ( not ( = ?auto_23421 ?auto_23416 ) ) ( not ( = ?auto_23419 ?auto_23416 ) ) ( not ( = ?auto_23422 ?auto_23416 ) ) ( not ( = ?auto_23424 ?auto_23416 ) ) ( not ( = ?auto_23418 ?auto_23416 ) ) ( not ( = ?auto_23430 ?auto_23416 ) ) ( not ( = ?auto_23423 ?auto_23416 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23419 ?auto_23420 ?auto_23421 )
      ( MAKE-5CRATE-VERIFY ?auto_23416 ?auto_23417 ?auto_23418 ?auto_23419 ?auto_23420 ?auto_23421 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23435 - SURFACE
      ?auto_23436 - SURFACE
    )
    :vars
    (
      ?auto_23453 - HOIST
      ?auto_23446 - PLACE
      ?auto_23452 - SURFACE
      ?auto_23451 - PLACE
      ?auto_23448 - HOIST
      ?auto_23437 - SURFACE
      ?auto_23444 - PLACE
      ?auto_23443 - HOIST
      ?auto_23440 - SURFACE
      ?auto_23450 - SURFACE
      ?auto_23449 - PLACE
      ?auto_23445 - HOIST
      ?auto_23447 - SURFACE
      ?auto_23438 - SURFACE
      ?auto_23439 - SURFACE
      ?auto_23442 - TRUCK
      ?auto_23441 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23453 ?auto_23446 ) ( IS-CRATE ?auto_23436 ) ( not ( = ?auto_23435 ?auto_23436 ) ) ( not ( = ?auto_23452 ?auto_23435 ) ) ( not ( = ?auto_23452 ?auto_23436 ) ) ( not ( = ?auto_23451 ?auto_23446 ) ) ( HOIST-AT ?auto_23448 ?auto_23451 ) ( not ( = ?auto_23453 ?auto_23448 ) ) ( AVAILABLE ?auto_23448 ) ( SURFACE-AT ?auto_23436 ?auto_23451 ) ( ON ?auto_23436 ?auto_23437 ) ( CLEAR ?auto_23436 ) ( not ( = ?auto_23435 ?auto_23437 ) ) ( not ( = ?auto_23436 ?auto_23437 ) ) ( not ( = ?auto_23452 ?auto_23437 ) ) ( IS-CRATE ?auto_23435 ) ( not ( = ?auto_23444 ?auto_23446 ) ) ( not ( = ?auto_23451 ?auto_23444 ) ) ( HOIST-AT ?auto_23443 ?auto_23444 ) ( not ( = ?auto_23453 ?auto_23443 ) ) ( not ( = ?auto_23448 ?auto_23443 ) ) ( SURFACE-AT ?auto_23435 ?auto_23444 ) ( ON ?auto_23435 ?auto_23440 ) ( CLEAR ?auto_23435 ) ( not ( = ?auto_23435 ?auto_23440 ) ) ( not ( = ?auto_23436 ?auto_23440 ) ) ( not ( = ?auto_23452 ?auto_23440 ) ) ( not ( = ?auto_23437 ?auto_23440 ) ) ( IS-CRATE ?auto_23452 ) ( not ( = ?auto_23450 ?auto_23452 ) ) ( not ( = ?auto_23435 ?auto_23450 ) ) ( not ( = ?auto_23436 ?auto_23450 ) ) ( not ( = ?auto_23437 ?auto_23450 ) ) ( not ( = ?auto_23440 ?auto_23450 ) ) ( not ( = ?auto_23449 ?auto_23446 ) ) ( not ( = ?auto_23451 ?auto_23449 ) ) ( not ( = ?auto_23444 ?auto_23449 ) ) ( HOIST-AT ?auto_23445 ?auto_23449 ) ( not ( = ?auto_23453 ?auto_23445 ) ) ( not ( = ?auto_23448 ?auto_23445 ) ) ( not ( = ?auto_23443 ?auto_23445 ) ) ( AVAILABLE ?auto_23445 ) ( SURFACE-AT ?auto_23452 ?auto_23449 ) ( ON ?auto_23452 ?auto_23447 ) ( CLEAR ?auto_23452 ) ( not ( = ?auto_23435 ?auto_23447 ) ) ( not ( = ?auto_23436 ?auto_23447 ) ) ( not ( = ?auto_23452 ?auto_23447 ) ) ( not ( = ?auto_23437 ?auto_23447 ) ) ( not ( = ?auto_23440 ?auto_23447 ) ) ( not ( = ?auto_23450 ?auto_23447 ) ) ( IS-CRATE ?auto_23450 ) ( not ( = ?auto_23438 ?auto_23450 ) ) ( not ( = ?auto_23435 ?auto_23438 ) ) ( not ( = ?auto_23436 ?auto_23438 ) ) ( not ( = ?auto_23452 ?auto_23438 ) ) ( not ( = ?auto_23437 ?auto_23438 ) ) ( not ( = ?auto_23440 ?auto_23438 ) ) ( not ( = ?auto_23447 ?auto_23438 ) ) ( AVAILABLE ?auto_23443 ) ( SURFACE-AT ?auto_23450 ?auto_23444 ) ( ON ?auto_23450 ?auto_23439 ) ( CLEAR ?auto_23450 ) ( not ( = ?auto_23435 ?auto_23439 ) ) ( not ( = ?auto_23436 ?auto_23439 ) ) ( not ( = ?auto_23452 ?auto_23439 ) ) ( not ( = ?auto_23437 ?auto_23439 ) ) ( not ( = ?auto_23440 ?auto_23439 ) ) ( not ( = ?auto_23450 ?auto_23439 ) ) ( not ( = ?auto_23447 ?auto_23439 ) ) ( not ( = ?auto_23438 ?auto_23439 ) ) ( TRUCK-AT ?auto_23442 ?auto_23446 ) ( SURFACE-AT ?auto_23441 ?auto_23446 ) ( CLEAR ?auto_23441 ) ( IS-CRATE ?auto_23438 ) ( not ( = ?auto_23441 ?auto_23438 ) ) ( not ( = ?auto_23435 ?auto_23441 ) ) ( not ( = ?auto_23436 ?auto_23441 ) ) ( not ( = ?auto_23452 ?auto_23441 ) ) ( not ( = ?auto_23437 ?auto_23441 ) ) ( not ( = ?auto_23440 ?auto_23441 ) ) ( not ( = ?auto_23450 ?auto_23441 ) ) ( not ( = ?auto_23447 ?auto_23441 ) ) ( not ( = ?auto_23439 ?auto_23441 ) ) ( AVAILABLE ?auto_23453 ) ( IN ?auto_23438 ?auto_23442 ) )
    :subtasks
    ( ( !UNLOAD ?auto_23453 ?auto_23438 ?auto_23442 ?auto_23446 )
      ( MAKE-2CRATE ?auto_23452 ?auto_23435 ?auto_23436 )
      ( MAKE-1CRATE-VERIFY ?auto_23435 ?auto_23436 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23454 - SURFACE
      ?auto_23455 - SURFACE
      ?auto_23456 - SURFACE
    )
    :vars
    (
      ?auto_23468 - HOIST
      ?auto_23467 - PLACE
      ?auto_23466 - PLACE
      ?auto_23472 - HOIST
      ?auto_23469 - SURFACE
      ?auto_23464 - PLACE
      ?auto_23461 - HOIST
      ?auto_23463 - SURFACE
      ?auto_23459 - SURFACE
      ?auto_23458 - PLACE
      ?auto_23470 - HOIST
      ?auto_23465 - SURFACE
      ?auto_23462 - SURFACE
      ?auto_23471 - SURFACE
      ?auto_23460 - TRUCK
      ?auto_23457 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23468 ?auto_23467 ) ( IS-CRATE ?auto_23456 ) ( not ( = ?auto_23455 ?auto_23456 ) ) ( not ( = ?auto_23454 ?auto_23455 ) ) ( not ( = ?auto_23454 ?auto_23456 ) ) ( not ( = ?auto_23466 ?auto_23467 ) ) ( HOIST-AT ?auto_23472 ?auto_23466 ) ( not ( = ?auto_23468 ?auto_23472 ) ) ( AVAILABLE ?auto_23472 ) ( SURFACE-AT ?auto_23456 ?auto_23466 ) ( ON ?auto_23456 ?auto_23469 ) ( CLEAR ?auto_23456 ) ( not ( = ?auto_23455 ?auto_23469 ) ) ( not ( = ?auto_23456 ?auto_23469 ) ) ( not ( = ?auto_23454 ?auto_23469 ) ) ( IS-CRATE ?auto_23455 ) ( not ( = ?auto_23464 ?auto_23467 ) ) ( not ( = ?auto_23466 ?auto_23464 ) ) ( HOIST-AT ?auto_23461 ?auto_23464 ) ( not ( = ?auto_23468 ?auto_23461 ) ) ( not ( = ?auto_23472 ?auto_23461 ) ) ( SURFACE-AT ?auto_23455 ?auto_23464 ) ( ON ?auto_23455 ?auto_23463 ) ( CLEAR ?auto_23455 ) ( not ( = ?auto_23455 ?auto_23463 ) ) ( not ( = ?auto_23456 ?auto_23463 ) ) ( not ( = ?auto_23454 ?auto_23463 ) ) ( not ( = ?auto_23469 ?auto_23463 ) ) ( IS-CRATE ?auto_23454 ) ( not ( = ?auto_23459 ?auto_23454 ) ) ( not ( = ?auto_23455 ?auto_23459 ) ) ( not ( = ?auto_23456 ?auto_23459 ) ) ( not ( = ?auto_23469 ?auto_23459 ) ) ( not ( = ?auto_23463 ?auto_23459 ) ) ( not ( = ?auto_23458 ?auto_23467 ) ) ( not ( = ?auto_23466 ?auto_23458 ) ) ( not ( = ?auto_23464 ?auto_23458 ) ) ( HOIST-AT ?auto_23470 ?auto_23458 ) ( not ( = ?auto_23468 ?auto_23470 ) ) ( not ( = ?auto_23472 ?auto_23470 ) ) ( not ( = ?auto_23461 ?auto_23470 ) ) ( AVAILABLE ?auto_23470 ) ( SURFACE-AT ?auto_23454 ?auto_23458 ) ( ON ?auto_23454 ?auto_23465 ) ( CLEAR ?auto_23454 ) ( not ( = ?auto_23455 ?auto_23465 ) ) ( not ( = ?auto_23456 ?auto_23465 ) ) ( not ( = ?auto_23454 ?auto_23465 ) ) ( not ( = ?auto_23469 ?auto_23465 ) ) ( not ( = ?auto_23463 ?auto_23465 ) ) ( not ( = ?auto_23459 ?auto_23465 ) ) ( IS-CRATE ?auto_23459 ) ( not ( = ?auto_23462 ?auto_23459 ) ) ( not ( = ?auto_23455 ?auto_23462 ) ) ( not ( = ?auto_23456 ?auto_23462 ) ) ( not ( = ?auto_23454 ?auto_23462 ) ) ( not ( = ?auto_23469 ?auto_23462 ) ) ( not ( = ?auto_23463 ?auto_23462 ) ) ( not ( = ?auto_23465 ?auto_23462 ) ) ( AVAILABLE ?auto_23461 ) ( SURFACE-AT ?auto_23459 ?auto_23464 ) ( ON ?auto_23459 ?auto_23471 ) ( CLEAR ?auto_23459 ) ( not ( = ?auto_23455 ?auto_23471 ) ) ( not ( = ?auto_23456 ?auto_23471 ) ) ( not ( = ?auto_23454 ?auto_23471 ) ) ( not ( = ?auto_23469 ?auto_23471 ) ) ( not ( = ?auto_23463 ?auto_23471 ) ) ( not ( = ?auto_23459 ?auto_23471 ) ) ( not ( = ?auto_23465 ?auto_23471 ) ) ( not ( = ?auto_23462 ?auto_23471 ) ) ( TRUCK-AT ?auto_23460 ?auto_23467 ) ( SURFACE-AT ?auto_23457 ?auto_23467 ) ( CLEAR ?auto_23457 ) ( IS-CRATE ?auto_23462 ) ( not ( = ?auto_23457 ?auto_23462 ) ) ( not ( = ?auto_23455 ?auto_23457 ) ) ( not ( = ?auto_23456 ?auto_23457 ) ) ( not ( = ?auto_23454 ?auto_23457 ) ) ( not ( = ?auto_23469 ?auto_23457 ) ) ( not ( = ?auto_23463 ?auto_23457 ) ) ( not ( = ?auto_23459 ?auto_23457 ) ) ( not ( = ?auto_23465 ?auto_23457 ) ) ( not ( = ?auto_23471 ?auto_23457 ) ) ( AVAILABLE ?auto_23468 ) ( IN ?auto_23462 ?auto_23460 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23455 ?auto_23456 )
      ( MAKE-2CRATE-VERIFY ?auto_23454 ?auto_23455 ?auto_23456 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23473 - SURFACE
      ?auto_23474 - SURFACE
      ?auto_23475 - SURFACE
      ?auto_23476 - SURFACE
    )
    :vars
    (
      ?auto_23478 - HOIST
      ?auto_23489 - PLACE
      ?auto_23490 - PLACE
      ?auto_23491 - HOIST
      ?auto_23485 - SURFACE
      ?auto_23486 - PLACE
      ?auto_23479 - HOIST
      ?auto_23480 - SURFACE
      ?auto_23483 - PLACE
      ?auto_23482 - HOIST
      ?auto_23484 - SURFACE
      ?auto_23481 - SURFACE
      ?auto_23488 - SURFACE
      ?auto_23487 - TRUCK
      ?auto_23477 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23478 ?auto_23489 ) ( IS-CRATE ?auto_23476 ) ( not ( = ?auto_23475 ?auto_23476 ) ) ( not ( = ?auto_23474 ?auto_23475 ) ) ( not ( = ?auto_23474 ?auto_23476 ) ) ( not ( = ?auto_23490 ?auto_23489 ) ) ( HOIST-AT ?auto_23491 ?auto_23490 ) ( not ( = ?auto_23478 ?auto_23491 ) ) ( AVAILABLE ?auto_23491 ) ( SURFACE-AT ?auto_23476 ?auto_23490 ) ( ON ?auto_23476 ?auto_23485 ) ( CLEAR ?auto_23476 ) ( not ( = ?auto_23475 ?auto_23485 ) ) ( not ( = ?auto_23476 ?auto_23485 ) ) ( not ( = ?auto_23474 ?auto_23485 ) ) ( IS-CRATE ?auto_23475 ) ( not ( = ?auto_23486 ?auto_23489 ) ) ( not ( = ?auto_23490 ?auto_23486 ) ) ( HOIST-AT ?auto_23479 ?auto_23486 ) ( not ( = ?auto_23478 ?auto_23479 ) ) ( not ( = ?auto_23491 ?auto_23479 ) ) ( SURFACE-AT ?auto_23475 ?auto_23486 ) ( ON ?auto_23475 ?auto_23480 ) ( CLEAR ?auto_23475 ) ( not ( = ?auto_23475 ?auto_23480 ) ) ( not ( = ?auto_23476 ?auto_23480 ) ) ( not ( = ?auto_23474 ?auto_23480 ) ) ( not ( = ?auto_23485 ?auto_23480 ) ) ( IS-CRATE ?auto_23474 ) ( not ( = ?auto_23473 ?auto_23474 ) ) ( not ( = ?auto_23475 ?auto_23473 ) ) ( not ( = ?auto_23476 ?auto_23473 ) ) ( not ( = ?auto_23485 ?auto_23473 ) ) ( not ( = ?auto_23480 ?auto_23473 ) ) ( not ( = ?auto_23483 ?auto_23489 ) ) ( not ( = ?auto_23490 ?auto_23483 ) ) ( not ( = ?auto_23486 ?auto_23483 ) ) ( HOIST-AT ?auto_23482 ?auto_23483 ) ( not ( = ?auto_23478 ?auto_23482 ) ) ( not ( = ?auto_23491 ?auto_23482 ) ) ( not ( = ?auto_23479 ?auto_23482 ) ) ( AVAILABLE ?auto_23482 ) ( SURFACE-AT ?auto_23474 ?auto_23483 ) ( ON ?auto_23474 ?auto_23484 ) ( CLEAR ?auto_23474 ) ( not ( = ?auto_23475 ?auto_23484 ) ) ( not ( = ?auto_23476 ?auto_23484 ) ) ( not ( = ?auto_23474 ?auto_23484 ) ) ( not ( = ?auto_23485 ?auto_23484 ) ) ( not ( = ?auto_23480 ?auto_23484 ) ) ( not ( = ?auto_23473 ?auto_23484 ) ) ( IS-CRATE ?auto_23473 ) ( not ( = ?auto_23481 ?auto_23473 ) ) ( not ( = ?auto_23475 ?auto_23481 ) ) ( not ( = ?auto_23476 ?auto_23481 ) ) ( not ( = ?auto_23474 ?auto_23481 ) ) ( not ( = ?auto_23485 ?auto_23481 ) ) ( not ( = ?auto_23480 ?auto_23481 ) ) ( not ( = ?auto_23484 ?auto_23481 ) ) ( AVAILABLE ?auto_23479 ) ( SURFACE-AT ?auto_23473 ?auto_23486 ) ( ON ?auto_23473 ?auto_23488 ) ( CLEAR ?auto_23473 ) ( not ( = ?auto_23475 ?auto_23488 ) ) ( not ( = ?auto_23476 ?auto_23488 ) ) ( not ( = ?auto_23474 ?auto_23488 ) ) ( not ( = ?auto_23485 ?auto_23488 ) ) ( not ( = ?auto_23480 ?auto_23488 ) ) ( not ( = ?auto_23473 ?auto_23488 ) ) ( not ( = ?auto_23484 ?auto_23488 ) ) ( not ( = ?auto_23481 ?auto_23488 ) ) ( TRUCK-AT ?auto_23487 ?auto_23489 ) ( SURFACE-AT ?auto_23477 ?auto_23489 ) ( CLEAR ?auto_23477 ) ( IS-CRATE ?auto_23481 ) ( not ( = ?auto_23477 ?auto_23481 ) ) ( not ( = ?auto_23475 ?auto_23477 ) ) ( not ( = ?auto_23476 ?auto_23477 ) ) ( not ( = ?auto_23474 ?auto_23477 ) ) ( not ( = ?auto_23485 ?auto_23477 ) ) ( not ( = ?auto_23480 ?auto_23477 ) ) ( not ( = ?auto_23473 ?auto_23477 ) ) ( not ( = ?auto_23484 ?auto_23477 ) ) ( not ( = ?auto_23488 ?auto_23477 ) ) ( AVAILABLE ?auto_23478 ) ( IN ?auto_23481 ?auto_23487 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23474 ?auto_23475 ?auto_23476 )
      ( MAKE-3CRATE-VERIFY ?auto_23473 ?auto_23474 ?auto_23475 ?auto_23476 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23492 - SURFACE
      ?auto_23493 - SURFACE
      ?auto_23494 - SURFACE
      ?auto_23495 - SURFACE
      ?auto_23496 - SURFACE
    )
    :vars
    (
      ?auto_23498 - HOIST
      ?auto_23508 - PLACE
      ?auto_23509 - PLACE
      ?auto_23510 - HOIST
      ?auto_23504 - SURFACE
      ?auto_23505 - PLACE
      ?auto_23499 - HOIST
      ?auto_23500 - SURFACE
      ?auto_23502 - PLACE
      ?auto_23501 - HOIST
      ?auto_23503 - SURFACE
      ?auto_23507 - SURFACE
      ?auto_23506 - TRUCK
      ?auto_23497 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23498 ?auto_23508 ) ( IS-CRATE ?auto_23496 ) ( not ( = ?auto_23495 ?auto_23496 ) ) ( not ( = ?auto_23494 ?auto_23495 ) ) ( not ( = ?auto_23494 ?auto_23496 ) ) ( not ( = ?auto_23509 ?auto_23508 ) ) ( HOIST-AT ?auto_23510 ?auto_23509 ) ( not ( = ?auto_23498 ?auto_23510 ) ) ( AVAILABLE ?auto_23510 ) ( SURFACE-AT ?auto_23496 ?auto_23509 ) ( ON ?auto_23496 ?auto_23504 ) ( CLEAR ?auto_23496 ) ( not ( = ?auto_23495 ?auto_23504 ) ) ( not ( = ?auto_23496 ?auto_23504 ) ) ( not ( = ?auto_23494 ?auto_23504 ) ) ( IS-CRATE ?auto_23495 ) ( not ( = ?auto_23505 ?auto_23508 ) ) ( not ( = ?auto_23509 ?auto_23505 ) ) ( HOIST-AT ?auto_23499 ?auto_23505 ) ( not ( = ?auto_23498 ?auto_23499 ) ) ( not ( = ?auto_23510 ?auto_23499 ) ) ( SURFACE-AT ?auto_23495 ?auto_23505 ) ( ON ?auto_23495 ?auto_23500 ) ( CLEAR ?auto_23495 ) ( not ( = ?auto_23495 ?auto_23500 ) ) ( not ( = ?auto_23496 ?auto_23500 ) ) ( not ( = ?auto_23494 ?auto_23500 ) ) ( not ( = ?auto_23504 ?auto_23500 ) ) ( IS-CRATE ?auto_23494 ) ( not ( = ?auto_23493 ?auto_23494 ) ) ( not ( = ?auto_23495 ?auto_23493 ) ) ( not ( = ?auto_23496 ?auto_23493 ) ) ( not ( = ?auto_23504 ?auto_23493 ) ) ( not ( = ?auto_23500 ?auto_23493 ) ) ( not ( = ?auto_23502 ?auto_23508 ) ) ( not ( = ?auto_23509 ?auto_23502 ) ) ( not ( = ?auto_23505 ?auto_23502 ) ) ( HOIST-AT ?auto_23501 ?auto_23502 ) ( not ( = ?auto_23498 ?auto_23501 ) ) ( not ( = ?auto_23510 ?auto_23501 ) ) ( not ( = ?auto_23499 ?auto_23501 ) ) ( AVAILABLE ?auto_23501 ) ( SURFACE-AT ?auto_23494 ?auto_23502 ) ( ON ?auto_23494 ?auto_23503 ) ( CLEAR ?auto_23494 ) ( not ( = ?auto_23495 ?auto_23503 ) ) ( not ( = ?auto_23496 ?auto_23503 ) ) ( not ( = ?auto_23494 ?auto_23503 ) ) ( not ( = ?auto_23504 ?auto_23503 ) ) ( not ( = ?auto_23500 ?auto_23503 ) ) ( not ( = ?auto_23493 ?auto_23503 ) ) ( IS-CRATE ?auto_23493 ) ( not ( = ?auto_23492 ?auto_23493 ) ) ( not ( = ?auto_23495 ?auto_23492 ) ) ( not ( = ?auto_23496 ?auto_23492 ) ) ( not ( = ?auto_23494 ?auto_23492 ) ) ( not ( = ?auto_23504 ?auto_23492 ) ) ( not ( = ?auto_23500 ?auto_23492 ) ) ( not ( = ?auto_23503 ?auto_23492 ) ) ( AVAILABLE ?auto_23499 ) ( SURFACE-AT ?auto_23493 ?auto_23505 ) ( ON ?auto_23493 ?auto_23507 ) ( CLEAR ?auto_23493 ) ( not ( = ?auto_23495 ?auto_23507 ) ) ( not ( = ?auto_23496 ?auto_23507 ) ) ( not ( = ?auto_23494 ?auto_23507 ) ) ( not ( = ?auto_23504 ?auto_23507 ) ) ( not ( = ?auto_23500 ?auto_23507 ) ) ( not ( = ?auto_23493 ?auto_23507 ) ) ( not ( = ?auto_23503 ?auto_23507 ) ) ( not ( = ?auto_23492 ?auto_23507 ) ) ( TRUCK-AT ?auto_23506 ?auto_23508 ) ( SURFACE-AT ?auto_23497 ?auto_23508 ) ( CLEAR ?auto_23497 ) ( IS-CRATE ?auto_23492 ) ( not ( = ?auto_23497 ?auto_23492 ) ) ( not ( = ?auto_23495 ?auto_23497 ) ) ( not ( = ?auto_23496 ?auto_23497 ) ) ( not ( = ?auto_23494 ?auto_23497 ) ) ( not ( = ?auto_23504 ?auto_23497 ) ) ( not ( = ?auto_23500 ?auto_23497 ) ) ( not ( = ?auto_23493 ?auto_23497 ) ) ( not ( = ?auto_23503 ?auto_23497 ) ) ( not ( = ?auto_23507 ?auto_23497 ) ) ( AVAILABLE ?auto_23498 ) ( IN ?auto_23492 ?auto_23506 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23494 ?auto_23495 ?auto_23496 )
      ( MAKE-4CRATE-VERIFY ?auto_23492 ?auto_23493 ?auto_23494 ?auto_23495 ?auto_23496 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23511 - SURFACE
      ?auto_23512 - SURFACE
      ?auto_23513 - SURFACE
      ?auto_23514 - SURFACE
      ?auto_23515 - SURFACE
      ?auto_23516 - SURFACE
    )
    :vars
    (
      ?auto_23517 - HOIST
      ?auto_23527 - PLACE
      ?auto_23528 - PLACE
      ?auto_23529 - HOIST
      ?auto_23523 - SURFACE
      ?auto_23524 - PLACE
      ?auto_23518 - HOIST
      ?auto_23519 - SURFACE
      ?auto_23521 - PLACE
      ?auto_23520 - HOIST
      ?auto_23522 - SURFACE
      ?auto_23526 - SURFACE
      ?auto_23525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23517 ?auto_23527 ) ( IS-CRATE ?auto_23516 ) ( not ( = ?auto_23515 ?auto_23516 ) ) ( not ( = ?auto_23514 ?auto_23515 ) ) ( not ( = ?auto_23514 ?auto_23516 ) ) ( not ( = ?auto_23528 ?auto_23527 ) ) ( HOIST-AT ?auto_23529 ?auto_23528 ) ( not ( = ?auto_23517 ?auto_23529 ) ) ( AVAILABLE ?auto_23529 ) ( SURFACE-AT ?auto_23516 ?auto_23528 ) ( ON ?auto_23516 ?auto_23523 ) ( CLEAR ?auto_23516 ) ( not ( = ?auto_23515 ?auto_23523 ) ) ( not ( = ?auto_23516 ?auto_23523 ) ) ( not ( = ?auto_23514 ?auto_23523 ) ) ( IS-CRATE ?auto_23515 ) ( not ( = ?auto_23524 ?auto_23527 ) ) ( not ( = ?auto_23528 ?auto_23524 ) ) ( HOIST-AT ?auto_23518 ?auto_23524 ) ( not ( = ?auto_23517 ?auto_23518 ) ) ( not ( = ?auto_23529 ?auto_23518 ) ) ( SURFACE-AT ?auto_23515 ?auto_23524 ) ( ON ?auto_23515 ?auto_23519 ) ( CLEAR ?auto_23515 ) ( not ( = ?auto_23515 ?auto_23519 ) ) ( not ( = ?auto_23516 ?auto_23519 ) ) ( not ( = ?auto_23514 ?auto_23519 ) ) ( not ( = ?auto_23523 ?auto_23519 ) ) ( IS-CRATE ?auto_23514 ) ( not ( = ?auto_23513 ?auto_23514 ) ) ( not ( = ?auto_23515 ?auto_23513 ) ) ( not ( = ?auto_23516 ?auto_23513 ) ) ( not ( = ?auto_23523 ?auto_23513 ) ) ( not ( = ?auto_23519 ?auto_23513 ) ) ( not ( = ?auto_23521 ?auto_23527 ) ) ( not ( = ?auto_23528 ?auto_23521 ) ) ( not ( = ?auto_23524 ?auto_23521 ) ) ( HOIST-AT ?auto_23520 ?auto_23521 ) ( not ( = ?auto_23517 ?auto_23520 ) ) ( not ( = ?auto_23529 ?auto_23520 ) ) ( not ( = ?auto_23518 ?auto_23520 ) ) ( AVAILABLE ?auto_23520 ) ( SURFACE-AT ?auto_23514 ?auto_23521 ) ( ON ?auto_23514 ?auto_23522 ) ( CLEAR ?auto_23514 ) ( not ( = ?auto_23515 ?auto_23522 ) ) ( not ( = ?auto_23516 ?auto_23522 ) ) ( not ( = ?auto_23514 ?auto_23522 ) ) ( not ( = ?auto_23523 ?auto_23522 ) ) ( not ( = ?auto_23519 ?auto_23522 ) ) ( not ( = ?auto_23513 ?auto_23522 ) ) ( IS-CRATE ?auto_23513 ) ( not ( = ?auto_23512 ?auto_23513 ) ) ( not ( = ?auto_23515 ?auto_23512 ) ) ( not ( = ?auto_23516 ?auto_23512 ) ) ( not ( = ?auto_23514 ?auto_23512 ) ) ( not ( = ?auto_23523 ?auto_23512 ) ) ( not ( = ?auto_23519 ?auto_23512 ) ) ( not ( = ?auto_23522 ?auto_23512 ) ) ( AVAILABLE ?auto_23518 ) ( SURFACE-AT ?auto_23513 ?auto_23524 ) ( ON ?auto_23513 ?auto_23526 ) ( CLEAR ?auto_23513 ) ( not ( = ?auto_23515 ?auto_23526 ) ) ( not ( = ?auto_23516 ?auto_23526 ) ) ( not ( = ?auto_23514 ?auto_23526 ) ) ( not ( = ?auto_23523 ?auto_23526 ) ) ( not ( = ?auto_23519 ?auto_23526 ) ) ( not ( = ?auto_23513 ?auto_23526 ) ) ( not ( = ?auto_23522 ?auto_23526 ) ) ( not ( = ?auto_23512 ?auto_23526 ) ) ( TRUCK-AT ?auto_23525 ?auto_23527 ) ( SURFACE-AT ?auto_23511 ?auto_23527 ) ( CLEAR ?auto_23511 ) ( IS-CRATE ?auto_23512 ) ( not ( = ?auto_23511 ?auto_23512 ) ) ( not ( = ?auto_23515 ?auto_23511 ) ) ( not ( = ?auto_23516 ?auto_23511 ) ) ( not ( = ?auto_23514 ?auto_23511 ) ) ( not ( = ?auto_23523 ?auto_23511 ) ) ( not ( = ?auto_23519 ?auto_23511 ) ) ( not ( = ?auto_23513 ?auto_23511 ) ) ( not ( = ?auto_23522 ?auto_23511 ) ) ( not ( = ?auto_23526 ?auto_23511 ) ) ( AVAILABLE ?auto_23517 ) ( IN ?auto_23512 ?auto_23525 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23514 ?auto_23515 ?auto_23516 )
      ( MAKE-5CRATE-VERIFY ?auto_23511 ?auto_23512 ?auto_23513 ?auto_23514 ?auto_23515 ?auto_23516 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23530 - SURFACE
      ?auto_23531 - SURFACE
    )
    :vars
    (
      ?auto_23534 - HOIST
      ?auto_23546 - PLACE
      ?auto_23544 - SURFACE
      ?auto_23547 - PLACE
      ?auto_23548 - HOIST
      ?auto_23541 - SURFACE
      ?auto_23542 - PLACE
      ?auto_23535 - HOIST
      ?auto_23536 - SURFACE
      ?auto_23533 - SURFACE
      ?auto_23539 - PLACE
      ?auto_23538 - HOIST
      ?auto_23540 - SURFACE
      ?auto_23537 - SURFACE
      ?auto_23545 - SURFACE
      ?auto_23532 - SURFACE
      ?auto_23543 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23534 ?auto_23546 ) ( IS-CRATE ?auto_23531 ) ( not ( = ?auto_23530 ?auto_23531 ) ) ( not ( = ?auto_23544 ?auto_23530 ) ) ( not ( = ?auto_23544 ?auto_23531 ) ) ( not ( = ?auto_23547 ?auto_23546 ) ) ( HOIST-AT ?auto_23548 ?auto_23547 ) ( not ( = ?auto_23534 ?auto_23548 ) ) ( AVAILABLE ?auto_23548 ) ( SURFACE-AT ?auto_23531 ?auto_23547 ) ( ON ?auto_23531 ?auto_23541 ) ( CLEAR ?auto_23531 ) ( not ( = ?auto_23530 ?auto_23541 ) ) ( not ( = ?auto_23531 ?auto_23541 ) ) ( not ( = ?auto_23544 ?auto_23541 ) ) ( IS-CRATE ?auto_23530 ) ( not ( = ?auto_23542 ?auto_23546 ) ) ( not ( = ?auto_23547 ?auto_23542 ) ) ( HOIST-AT ?auto_23535 ?auto_23542 ) ( not ( = ?auto_23534 ?auto_23535 ) ) ( not ( = ?auto_23548 ?auto_23535 ) ) ( SURFACE-AT ?auto_23530 ?auto_23542 ) ( ON ?auto_23530 ?auto_23536 ) ( CLEAR ?auto_23530 ) ( not ( = ?auto_23530 ?auto_23536 ) ) ( not ( = ?auto_23531 ?auto_23536 ) ) ( not ( = ?auto_23544 ?auto_23536 ) ) ( not ( = ?auto_23541 ?auto_23536 ) ) ( IS-CRATE ?auto_23544 ) ( not ( = ?auto_23533 ?auto_23544 ) ) ( not ( = ?auto_23530 ?auto_23533 ) ) ( not ( = ?auto_23531 ?auto_23533 ) ) ( not ( = ?auto_23541 ?auto_23533 ) ) ( not ( = ?auto_23536 ?auto_23533 ) ) ( not ( = ?auto_23539 ?auto_23546 ) ) ( not ( = ?auto_23547 ?auto_23539 ) ) ( not ( = ?auto_23542 ?auto_23539 ) ) ( HOIST-AT ?auto_23538 ?auto_23539 ) ( not ( = ?auto_23534 ?auto_23538 ) ) ( not ( = ?auto_23548 ?auto_23538 ) ) ( not ( = ?auto_23535 ?auto_23538 ) ) ( AVAILABLE ?auto_23538 ) ( SURFACE-AT ?auto_23544 ?auto_23539 ) ( ON ?auto_23544 ?auto_23540 ) ( CLEAR ?auto_23544 ) ( not ( = ?auto_23530 ?auto_23540 ) ) ( not ( = ?auto_23531 ?auto_23540 ) ) ( not ( = ?auto_23544 ?auto_23540 ) ) ( not ( = ?auto_23541 ?auto_23540 ) ) ( not ( = ?auto_23536 ?auto_23540 ) ) ( not ( = ?auto_23533 ?auto_23540 ) ) ( IS-CRATE ?auto_23533 ) ( not ( = ?auto_23537 ?auto_23533 ) ) ( not ( = ?auto_23530 ?auto_23537 ) ) ( not ( = ?auto_23531 ?auto_23537 ) ) ( not ( = ?auto_23544 ?auto_23537 ) ) ( not ( = ?auto_23541 ?auto_23537 ) ) ( not ( = ?auto_23536 ?auto_23537 ) ) ( not ( = ?auto_23540 ?auto_23537 ) ) ( AVAILABLE ?auto_23535 ) ( SURFACE-AT ?auto_23533 ?auto_23542 ) ( ON ?auto_23533 ?auto_23545 ) ( CLEAR ?auto_23533 ) ( not ( = ?auto_23530 ?auto_23545 ) ) ( not ( = ?auto_23531 ?auto_23545 ) ) ( not ( = ?auto_23544 ?auto_23545 ) ) ( not ( = ?auto_23541 ?auto_23545 ) ) ( not ( = ?auto_23536 ?auto_23545 ) ) ( not ( = ?auto_23533 ?auto_23545 ) ) ( not ( = ?auto_23540 ?auto_23545 ) ) ( not ( = ?auto_23537 ?auto_23545 ) ) ( SURFACE-AT ?auto_23532 ?auto_23546 ) ( CLEAR ?auto_23532 ) ( IS-CRATE ?auto_23537 ) ( not ( = ?auto_23532 ?auto_23537 ) ) ( not ( = ?auto_23530 ?auto_23532 ) ) ( not ( = ?auto_23531 ?auto_23532 ) ) ( not ( = ?auto_23544 ?auto_23532 ) ) ( not ( = ?auto_23541 ?auto_23532 ) ) ( not ( = ?auto_23536 ?auto_23532 ) ) ( not ( = ?auto_23533 ?auto_23532 ) ) ( not ( = ?auto_23540 ?auto_23532 ) ) ( not ( = ?auto_23545 ?auto_23532 ) ) ( AVAILABLE ?auto_23534 ) ( IN ?auto_23537 ?auto_23543 ) ( TRUCK-AT ?auto_23543 ?auto_23547 ) )
    :subtasks
    ( ( !DRIVE ?auto_23543 ?auto_23547 ?auto_23546 )
      ( MAKE-2CRATE ?auto_23544 ?auto_23530 ?auto_23531 )
      ( MAKE-1CRATE-VERIFY ?auto_23530 ?auto_23531 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23549 - SURFACE
      ?auto_23550 - SURFACE
      ?auto_23551 - SURFACE
    )
    :vars
    (
      ?auto_23561 - HOIST
      ?auto_23552 - PLACE
      ?auto_23559 - PLACE
      ?auto_23556 - HOIST
      ?auto_23565 - SURFACE
      ?auto_23564 - PLACE
      ?auto_23563 - HOIST
      ?auto_23566 - SURFACE
      ?auto_23555 - SURFACE
      ?auto_23554 - PLACE
      ?auto_23553 - HOIST
      ?auto_23558 - SURFACE
      ?auto_23562 - SURFACE
      ?auto_23567 - SURFACE
      ?auto_23560 - SURFACE
      ?auto_23557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23561 ?auto_23552 ) ( IS-CRATE ?auto_23551 ) ( not ( = ?auto_23550 ?auto_23551 ) ) ( not ( = ?auto_23549 ?auto_23550 ) ) ( not ( = ?auto_23549 ?auto_23551 ) ) ( not ( = ?auto_23559 ?auto_23552 ) ) ( HOIST-AT ?auto_23556 ?auto_23559 ) ( not ( = ?auto_23561 ?auto_23556 ) ) ( AVAILABLE ?auto_23556 ) ( SURFACE-AT ?auto_23551 ?auto_23559 ) ( ON ?auto_23551 ?auto_23565 ) ( CLEAR ?auto_23551 ) ( not ( = ?auto_23550 ?auto_23565 ) ) ( not ( = ?auto_23551 ?auto_23565 ) ) ( not ( = ?auto_23549 ?auto_23565 ) ) ( IS-CRATE ?auto_23550 ) ( not ( = ?auto_23564 ?auto_23552 ) ) ( not ( = ?auto_23559 ?auto_23564 ) ) ( HOIST-AT ?auto_23563 ?auto_23564 ) ( not ( = ?auto_23561 ?auto_23563 ) ) ( not ( = ?auto_23556 ?auto_23563 ) ) ( SURFACE-AT ?auto_23550 ?auto_23564 ) ( ON ?auto_23550 ?auto_23566 ) ( CLEAR ?auto_23550 ) ( not ( = ?auto_23550 ?auto_23566 ) ) ( not ( = ?auto_23551 ?auto_23566 ) ) ( not ( = ?auto_23549 ?auto_23566 ) ) ( not ( = ?auto_23565 ?auto_23566 ) ) ( IS-CRATE ?auto_23549 ) ( not ( = ?auto_23555 ?auto_23549 ) ) ( not ( = ?auto_23550 ?auto_23555 ) ) ( not ( = ?auto_23551 ?auto_23555 ) ) ( not ( = ?auto_23565 ?auto_23555 ) ) ( not ( = ?auto_23566 ?auto_23555 ) ) ( not ( = ?auto_23554 ?auto_23552 ) ) ( not ( = ?auto_23559 ?auto_23554 ) ) ( not ( = ?auto_23564 ?auto_23554 ) ) ( HOIST-AT ?auto_23553 ?auto_23554 ) ( not ( = ?auto_23561 ?auto_23553 ) ) ( not ( = ?auto_23556 ?auto_23553 ) ) ( not ( = ?auto_23563 ?auto_23553 ) ) ( AVAILABLE ?auto_23553 ) ( SURFACE-AT ?auto_23549 ?auto_23554 ) ( ON ?auto_23549 ?auto_23558 ) ( CLEAR ?auto_23549 ) ( not ( = ?auto_23550 ?auto_23558 ) ) ( not ( = ?auto_23551 ?auto_23558 ) ) ( not ( = ?auto_23549 ?auto_23558 ) ) ( not ( = ?auto_23565 ?auto_23558 ) ) ( not ( = ?auto_23566 ?auto_23558 ) ) ( not ( = ?auto_23555 ?auto_23558 ) ) ( IS-CRATE ?auto_23555 ) ( not ( = ?auto_23562 ?auto_23555 ) ) ( not ( = ?auto_23550 ?auto_23562 ) ) ( not ( = ?auto_23551 ?auto_23562 ) ) ( not ( = ?auto_23549 ?auto_23562 ) ) ( not ( = ?auto_23565 ?auto_23562 ) ) ( not ( = ?auto_23566 ?auto_23562 ) ) ( not ( = ?auto_23558 ?auto_23562 ) ) ( AVAILABLE ?auto_23563 ) ( SURFACE-AT ?auto_23555 ?auto_23564 ) ( ON ?auto_23555 ?auto_23567 ) ( CLEAR ?auto_23555 ) ( not ( = ?auto_23550 ?auto_23567 ) ) ( not ( = ?auto_23551 ?auto_23567 ) ) ( not ( = ?auto_23549 ?auto_23567 ) ) ( not ( = ?auto_23565 ?auto_23567 ) ) ( not ( = ?auto_23566 ?auto_23567 ) ) ( not ( = ?auto_23555 ?auto_23567 ) ) ( not ( = ?auto_23558 ?auto_23567 ) ) ( not ( = ?auto_23562 ?auto_23567 ) ) ( SURFACE-AT ?auto_23560 ?auto_23552 ) ( CLEAR ?auto_23560 ) ( IS-CRATE ?auto_23562 ) ( not ( = ?auto_23560 ?auto_23562 ) ) ( not ( = ?auto_23550 ?auto_23560 ) ) ( not ( = ?auto_23551 ?auto_23560 ) ) ( not ( = ?auto_23549 ?auto_23560 ) ) ( not ( = ?auto_23565 ?auto_23560 ) ) ( not ( = ?auto_23566 ?auto_23560 ) ) ( not ( = ?auto_23555 ?auto_23560 ) ) ( not ( = ?auto_23558 ?auto_23560 ) ) ( not ( = ?auto_23567 ?auto_23560 ) ) ( AVAILABLE ?auto_23561 ) ( IN ?auto_23562 ?auto_23557 ) ( TRUCK-AT ?auto_23557 ?auto_23559 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23550 ?auto_23551 )
      ( MAKE-2CRATE-VERIFY ?auto_23549 ?auto_23550 ?auto_23551 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23568 - SURFACE
      ?auto_23569 - SURFACE
      ?auto_23570 - SURFACE
      ?auto_23571 - SURFACE
    )
    :vars
    (
      ?auto_23577 - HOIST
      ?auto_23581 - PLACE
      ?auto_23584 - PLACE
      ?auto_23585 - HOIST
      ?auto_23573 - SURFACE
      ?auto_23586 - PLACE
      ?auto_23574 - HOIST
      ?auto_23575 - SURFACE
      ?auto_23579 - PLACE
      ?auto_23582 - HOIST
      ?auto_23578 - SURFACE
      ?auto_23576 - SURFACE
      ?auto_23580 - SURFACE
      ?auto_23583 - SURFACE
      ?auto_23572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23577 ?auto_23581 ) ( IS-CRATE ?auto_23571 ) ( not ( = ?auto_23570 ?auto_23571 ) ) ( not ( = ?auto_23569 ?auto_23570 ) ) ( not ( = ?auto_23569 ?auto_23571 ) ) ( not ( = ?auto_23584 ?auto_23581 ) ) ( HOIST-AT ?auto_23585 ?auto_23584 ) ( not ( = ?auto_23577 ?auto_23585 ) ) ( AVAILABLE ?auto_23585 ) ( SURFACE-AT ?auto_23571 ?auto_23584 ) ( ON ?auto_23571 ?auto_23573 ) ( CLEAR ?auto_23571 ) ( not ( = ?auto_23570 ?auto_23573 ) ) ( not ( = ?auto_23571 ?auto_23573 ) ) ( not ( = ?auto_23569 ?auto_23573 ) ) ( IS-CRATE ?auto_23570 ) ( not ( = ?auto_23586 ?auto_23581 ) ) ( not ( = ?auto_23584 ?auto_23586 ) ) ( HOIST-AT ?auto_23574 ?auto_23586 ) ( not ( = ?auto_23577 ?auto_23574 ) ) ( not ( = ?auto_23585 ?auto_23574 ) ) ( SURFACE-AT ?auto_23570 ?auto_23586 ) ( ON ?auto_23570 ?auto_23575 ) ( CLEAR ?auto_23570 ) ( not ( = ?auto_23570 ?auto_23575 ) ) ( not ( = ?auto_23571 ?auto_23575 ) ) ( not ( = ?auto_23569 ?auto_23575 ) ) ( not ( = ?auto_23573 ?auto_23575 ) ) ( IS-CRATE ?auto_23569 ) ( not ( = ?auto_23568 ?auto_23569 ) ) ( not ( = ?auto_23570 ?auto_23568 ) ) ( not ( = ?auto_23571 ?auto_23568 ) ) ( not ( = ?auto_23573 ?auto_23568 ) ) ( not ( = ?auto_23575 ?auto_23568 ) ) ( not ( = ?auto_23579 ?auto_23581 ) ) ( not ( = ?auto_23584 ?auto_23579 ) ) ( not ( = ?auto_23586 ?auto_23579 ) ) ( HOIST-AT ?auto_23582 ?auto_23579 ) ( not ( = ?auto_23577 ?auto_23582 ) ) ( not ( = ?auto_23585 ?auto_23582 ) ) ( not ( = ?auto_23574 ?auto_23582 ) ) ( AVAILABLE ?auto_23582 ) ( SURFACE-AT ?auto_23569 ?auto_23579 ) ( ON ?auto_23569 ?auto_23578 ) ( CLEAR ?auto_23569 ) ( not ( = ?auto_23570 ?auto_23578 ) ) ( not ( = ?auto_23571 ?auto_23578 ) ) ( not ( = ?auto_23569 ?auto_23578 ) ) ( not ( = ?auto_23573 ?auto_23578 ) ) ( not ( = ?auto_23575 ?auto_23578 ) ) ( not ( = ?auto_23568 ?auto_23578 ) ) ( IS-CRATE ?auto_23568 ) ( not ( = ?auto_23576 ?auto_23568 ) ) ( not ( = ?auto_23570 ?auto_23576 ) ) ( not ( = ?auto_23571 ?auto_23576 ) ) ( not ( = ?auto_23569 ?auto_23576 ) ) ( not ( = ?auto_23573 ?auto_23576 ) ) ( not ( = ?auto_23575 ?auto_23576 ) ) ( not ( = ?auto_23578 ?auto_23576 ) ) ( AVAILABLE ?auto_23574 ) ( SURFACE-AT ?auto_23568 ?auto_23586 ) ( ON ?auto_23568 ?auto_23580 ) ( CLEAR ?auto_23568 ) ( not ( = ?auto_23570 ?auto_23580 ) ) ( not ( = ?auto_23571 ?auto_23580 ) ) ( not ( = ?auto_23569 ?auto_23580 ) ) ( not ( = ?auto_23573 ?auto_23580 ) ) ( not ( = ?auto_23575 ?auto_23580 ) ) ( not ( = ?auto_23568 ?auto_23580 ) ) ( not ( = ?auto_23578 ?auto_23580 ) ) ( not ( = ?auto_23576 ?auto_23580 ) ) ( SURFACE-AT ?auto_23583 ?auto_23581 ) ( CLEAR ?auto_23583 ) ( IS-CRATE ?auto_23576 ) ( not ( = ?auto_23583 ?auto_23576 ) ) ( not ( = ?auto_23570 ?auto_23583 ) ) ( not ( = ?auto_23571 ?auto_23583 ) ) ( not ( = ?auto_23569 ?auto_23583 ) ) ( not ( = ?auto_23573 ?auto_23583 ) ) ( not ( = ?auto_23575 ?auto_23583 ) ) ( not ( = ?auto_23568 ?auto_23583 ) ) ( not ( = ?auto_23578 ?auto_23583 ) ) ( not ( = ?auto_23580 ?auto_23583 ) ) ( AVAILABLE ?auto_23577 ) ( IN ?auto_23576 ?auto_23572 ) ( TRUCK-AT ?auto_23572 ?auto_23584 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23569 ?auto_23570 ?auto_23571 )
      ( MAKE-3CRATE-VERIFY ?auto_23568 ?auto_23569 ?auto_23570 ?auto_23571 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23587 - SURFACE
      ?auto_23588 - SURFACE
      ?auto_23589 - SURFACE
      ?auto_23590 - SURFACE
      ?auto_23591 - SURFACE
    )
    :vars
    (
      ?auto_23596 - HOIST
      ?auto_23600 - PLACE
      ?auto_23603 - PLACE
      ?auto_23604 - HOIST
      ?auto_23593 - SURFACE
      ?auto_23605 - PLACE
      ?auto_23594 - HOIST
      ?auto_23595 - SURFACE
      ?auto_23598 - PLACE
      ?auto_23601 - HOIST
      ?auto_23597 - SURFACE
      ?auto_23599 - SURFACE
      ?auto_23602 - SURFACE
      ?auto_23592 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23596 ?auto_23600 ) ( IS-CRATE ?auto_23591 ) ( not ( = ?auto_23590 ?auto_23591 ) ) ( not ( = ?auto_23589 ?auto_23590 ) ) ( not ( = ?auto_23589 ?auto_23591 ) ) ( not ( = ?auto_23603 ?auto_23600 ) ) ( HOIST-AT ?auto_23604 ?auto_23603 ) ( not ( = ?auto_23596 ?auto_23604 ) ) ( AVAILABLE ?auto_23604 ) ( SURFACE-AT ?auto_23591 ?auto_23603 ) ( ON ?auto_23591 ?auto_23593 ) ( CLEAR ?auto_23591 ) ( not ( = ?auto_23590 ?auto_23593 ) ) ( not ( = ?auto_23591 ?auto_23593 ) ) ( not ( = ?auto_23589 ?auto_23593 ) ) ( IS-CRATE ?auto_23590 ) ( not ( = ?auto_23605 ?auto_23600 ) ) ( not ( = ?auto_23603 ?auto_23605 ) ) ( HOIST-AT ?auto_23594 ?auto_23605 ) ( not ( = ?auto_23596 ?auto_23594 ) ) ( not ( = ?auto_23604 ?auto_23594 ) ) ( SURFACE-AT ?auto_23590 ?auto_23605 ) ( ON ?auto_23590 ?auto_23595 ) ( CLEAR ?auto_23590 ) ( not ( = ?auto_23590 ?auto_23595 ) ) ( not ( = ?auto_23591 ?auto_23595 ) ) ( not ( = ?auto_23589 ?auto_23595 ) ) ( not ( = ?auto_23593 ?auto_23595 ) ) ( IS-CRATE ?auto_23589 ) ( not ( = ?auto_23588 ?auto_23589 ) ) ( not ( = ?auto_23590 ?auto_23588 ) ) ( not ( = ?auto_23591 ?auto_23588 ) ) ( not ( = ?auto_23593 ?auto_23588 ) ) ( not ( = ?auto_23595 ?auto_23588 ) ) ( not ( = ?auto_23598 ?auto_23600 ) ) ( not ( = ?auto_23603 ?auto_23598 ) ) ( not ( = ?auto_23605 ?auto_23598 ) ) ( HOIST-AT ?auto_23601 ?auto_23598 ) ( not ( = ?auto_23596 ?auto_23601 ) ) ( not ( = ?auto_23604 ?auto_23601 ) ) ( not ( = ?auto_23594 ?auto_23601 ) ) ( AVAILABLE ?auto_23601 ) ( SURFACE-AT ?auto_23589 ?auto_23598 ) ( ON ?auto_23589 ?auto_23597 ) ( CLEAR ?auto_23589 ) ( not ( = ?auto_23590 ?auto_23597 ) ) ( not ( = ?auto_23591 ?auto_23597 ) ) ( not ( = ?auto_23589 ?auto_23597 ) ) ( not ( = ?auto_23593 ?auto_23597 ) ) ( not ( = ?auto_23595 ?auto_23597 ) ) ( not ( = ?auto_23588 ?auto_23597 ) ) ( IS-CRATE ?auto_23588 ) ( not ( = ?auto_23587 ?auto_23588 ) ) ( not ( = ?auto_23590 ?auto_23587 ) ) ( not ( = ?auto_23591 ?auto_23587 ) ) ( not ( = ?auto_23589 ?auto_23587 ) ) ( not ( = ?auto_23593 ?auto_23587 ) ) ( not ( = ?auto_23595 ?auto_23587 ) ) ( not ( = ?auto_23597 ?auto_23587 ) ) ( AVAILABLE ?auto_23594 ) ( SURFACE-AT ?auto_23588 ?auto_23605 ) ( ON ?auto_23588 ?auto_23599 ) ( CLEAR ?auto_23588 ) ( not ( = ?auto_23590 ?auto_23599 ) ) ( not ( = ?auto_23591 ?auto_23599 ) ) ( not ( = ?auto_23589 ?auto_23599 ) ) ( not ( = ?auto_23593 ?auto_23599 ) ) ( not ( = ?auto_23595 ?auto_23599 ) ) ( not ( = ?auto_23588 ?auto_23599 ) ) ( not ( = ?auto_23597 ?auto_23599 ) ) ( not ( = ?auto_23587 ?auto_23599 ) ) ( SURFACE-AT ?auto_23602 ?auto_23600 ) ( CLEAR ?auto_23602 ) ( IS-CRATE ?auto_23587 ) ( not ( = ?auto_23602 ?auto_23587 ) ) ( not ( = ?auto_23590 ?auto_23602 ) ) ( not ( = ?auto_23591 ?auto_23602 ) ) ( not ( = ?auto_23589 ?auto_23602 ) ) ( not ( = ?auto_23593 ?auto_23602 ) ) ( not ( = ?auto_23595 ?auto_23602 ) ) ( not ( = ?auto_23588 ?auto_23602 ) ) ( not ( = ?auto_23597 ?auto_23602 ) ) ( not ( = ?auto_23599 ?auto_23602 ) ) ( AVAILABLE ?auto_23596 ) ( IN ?auto_23587 ?auto_23592 ) ( TRUCK-AT ?auto_23592 ?auto_23603 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23589 ?auto_23590 ?auto_23591 )
      ( MAKE-4CRATE-VERIFY ?auto_23587 ?auto_23588 ?auto_23589 ?auto_23590 ?auto_23591 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23606 - SURFACE
      ?auto_23607 - SURFACE
      ?auto_23608 - SURFACE
      ?auto_23609 - SURFACE
      ?auto_23610 - SURFACE
      ?auto_23611 - SURFACE
    )
    :vars
    (
      ?auto_23616 - HOIST
      ?auto_23620 - PLACE
      ?auto_23622 - PLACE
      ?auto_23623 - HOIST
      ?auto_23613 - SURFACE
      ?auto_23624 - PLACE
      ?auto_23614 - HOIST
      ?auto_23615 - SURFACE
      ?auto_23618 - PLACE
      ?auto_23621 - HOIST
      ?auto_23617 - SURFACE
      ?auto_23619 - SURFACE
      ?auto_23612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23616 ?auto_23620 ) ( IS-CRATE ?auto_23611 ) ( not ( = ?auto_23610 ?auto_23611 ) ) ( not ( = ?auto_23609 ?auto_23610 ) ) ( not ( = ?auto_23609 ?auto_23611 ) ) ( not ( = ?auto_23622 ?auto_23620 ) ) ( HOIST-AT ?auto_23623 ?auto_23622 ) ( not ( = ?auto_23616 ?auto_23623 ) ) ( AVAILABLE ?auto_23623 ) ( SURFACE-AT ?auto_23611 ?auto_23622 ) ( ON ?auto_23611 ?auto_23613 ) ( CLEAR ?auto_23611 ) ( not ( = ?auto_23610 ?auto_23613 ) ) ( not ( = ?auto_23611 ?auto_23613 ) ) ( not ( = ?auto_23609 ?auto_23613 ) ) ( IS-CRATE ?auto_23610 ) ( not ( = ?auto_23624 ?auto_23620 ) ) ( not ( = ?auto_23622 ?auto_23624 ) ) ( HOIST-AT ?auto_23614 ?auto_23624 ) ( not ( = ?auto_23616 ?auto_23614 ) ) ( not ( = ?auto_23623 ?auto_23614 ) ) ( SURFACE-AT ?auto_23610 ?auto_23624 ) ( ON ?auto_23610 ?auto_23615 ) ( CLEAR ?auto_23610 ) ( not ( = ?auto_23610 ?auto_23615 ) ) ( not ( = ?auto_23611 ?auto_23615 ) ) ( not ( = ?auto_23609 ?auto_23615 ) ) ( not ( = ?auto_23613 ?auto_23615 ) ) ( IS-CRATE ?auto_23609 ) ( not ( = ?auto_23608 ?auto_23609 ) ) ( not ( = ?auto_23610 ?auto_23608 ) ) ( not ( = ?auto_23611 ?auto_23608 ) ) ( not ( = ?auto_23613 ?auto_23608 ) ) ( not ( = ?auto_23615 ?auto_23608 ) ) ( not ( = ?auto_23618 ?auto_23620 ) ) ( not ( = ?auto_23622 ?auto_23618 ) ) ( not ( = ?auto_23624 ?auto_23618 ) ) ( HOIST-AT ?auto_23621 ?auto_23618 ) ( not ( = ?auto_23616 ?auto_23621 ) ) ( not ( = ?auto_23623 ?auto_23621 ) ) ( not ( = ?auto_23614 ?auto_23621 ) ) ( AVAILABLE ?auto_23621 ) ( SURFACE-AT ?auto_23609 ?auto_23618 ) ( ON ?auto_23609 ?auto_23617 ) ( CLEAR ?auto_23609 ) ( not ( = ?auto_23610 ?auto_23617 ) ) ( not ( = ?auto_23611 ?auto_23617 ) ) ( not ( = ?auto_23609 ?auto_23617 ) ) ( not ( = ?auto_23613 ?auto_23617 ) ) ( not ( = ?auto_23615 ?auto_23617 ) ) ( not ( = ?auto_23608 ?auto_23617 ) ) ( IS-CRATE ?auto_23608 ) ( not ( = ?auto_23607 ?auto_23608 ) ) ( not ( = ?auto_23610 ?auto_23607 ) ) ( not ( = ?auto_23611 ?auto_23607 ) ) ( not ( = ?auto_23609 ?auto_23607 ) ) ( not ( = ?auto_23613 ?auto_23607 ) ) ( not ( = ?auto_23615 ?auto_23607 ) ) ( not ( = ?auto_23617 ?auto_23607 ) ) ( AVAILABLE ?auto_23614 ) ( SURFACE-AT ?auto_23608 ?auto_23624 ) ( ON ?auto_23608 ?auto_23619 ) ( CLEAR ?auto_23608 ) ( not ( = ?auto_23610 ?auto_23619 ) ) ( not ( = ?auto_23611 ?auto_23619 ) ) ( not ( = ?auto_23609 ?auto_23619 ) ) ( not ( = ?auto_23613 ?auto_23619 ) ) ( not ( = ?auto_23615 ?auto_23619 ) ) ( not ( = ?auto_23608 ?auto_23619 ) ) ( not ( = ?auto_23617 ?auto_23619 ) ) ( not ( = ?auto_23607 ?auto_23619 ) ) ( SURFACE-AT ?auto_23606 ?auto_23620 ) ( CLEAR ?auto_23606 ) ( IS-CRATE ?auto_23607 ) ( not ( = ?auto_23606 ?auto_23607 ) ) ( not ( = ?auto_23610 ?auto_23606 ) ) ( not ( = ?auto_23611 ?auto_23606 ) ) ( not ( = ?auto_23609 ?auto_23606 ) ) ( not ( = ?auto_23613 ?auto_23606 ) ) ( not ( = ?auto_23615 ?auto_23606 ) ) ( not ( = ?auto_23608 ?auto_23606 ) ) ( not ( = ?auto_23617 ?auto_23606 ) ) ( not ( = ?auto_23619 ?auto_23606 ) ) ( AVAILABLE ?auto_23616 ) ( IN ?auto_23607 ?auto_23612 ) ( TRUCK-AT ?auto_23612 ?auto_23622 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23609 ?auto_23610 ?auto_23611 )
      ( MAKE-5CRATE-VERIFY ?auto_23606 ?auto_23607 ?auto_23608 ?auto_23609 ?auto_23610 ?auto_23611 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23625 - SURFACE
      ?auto_23626 - SURFACE
    )
    :vars
    (
      ?auto_23632 - HOIST
      ?auto_23637 - PLACE
      ?auto_23639 - SURFACE
      ?auto_23641 - PLACE
      ?auto_23642 - HOIST
      ?auto_23628 - SURFACE
      ?auto_23643 - PLACE
      ?auto_23629 - HOIST
      ?auto_23630 - SURFACE
      ?auto_23636 - SURFACE
      ?auto_23634 - PLACE
      ?auto_23638 - HOIST
      ?auto_23633 - SURFACE
      ?auto_23631 - SURFACE
      ?auto_23635 - SURFACE
      ?auto_23640 - SURFACE
      ?auto_23627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23632 ?auto_23637 ) ( IS-CRATE ?auto_23626 ) ( not ( = ?auto_23625 ?auto_23626 ) ) ( not ( = ?auto_23639 ?auto_23625 ) ) ( not ( = ?auto_23639 ?auto_23626 ) ) ( not ( = ?auto_23641 ?auto_23637 ) ) ( HOIST-AT ?auto_23642 ?auto_23641 ) ( not ( = ?auto_23632 ?auto_23642 ) ) ( SURFACE-AT ?auto_23626 ?auto_23641 ) ( ON ?auto_23626 ?auto_23628 ) ( CLEAR ?auto_23626 ) ( not ( = ?auto_23625 ?auto_23628 ) ) ( not ( = ?auto_23626 ?auto_23628 ) ) ( not ( = ?auto_23639 ?auto_23628 ) ) ( IS-CRATE ?auto_23625 ) ( not ( = ?auto_23643 ?auto_23637 ) ) ( not ( = ?auto_23641 ?auto_23643 ) ) ( HOIST-AT ?auto_23629 ?auto_23643 ) ( not ( = ?auto_23632 ?auto_23629 ) ) ( not ( = ?auto_23642 ?auto_23629 ) ) ( SURFACE-AT ?auto_23625 ?auto_23643 ) ( ON ?auto_23625 ?auto_23630 ) ( CLEAR ?auto_23625 ) ( not ( = ?auto_23625 ?auto_23630 ) ) ( not ( = ?auto_23626 ?auto_23630 ) ) ( not ( = ?auto_23639 ?auto_23630 ) ) ( not ( = ?auto_23628 ?auto_23630 ) ) ( IS-CRATE ?auto_23639 ) ( not ( = ?auto_23636 ?auto_23639 ) ) ( not ( = ?auto_23625 ?auto_23636 ) ) ( not ( = ?auto_23626 ?auto_23636 ) ) ( not ( = ?auto_23628 ?auto_23636 ) ) ( not ( = ?auto_23630 ?auto_23636 ) ) ( not ( = ?auto_23634 ?auto_23637 ) ) ( not ( = ?auto_23641 ?auto_23634 ) ) ( not ( = ?auto_23643 ?auto_23634 ) ) ( HOIST-AT ?auto_23638 ?auto_23634 ) ( not ( = ?auto_23632 ?auto_23638 ) ) ( not ( = ?auto_23642 ?auto_23638 ) ) ( not ( = ?auto_23629 ?auto_23638 ) ) ( AVAILABLE ?auto_23638 ) ( SURFACE-AT ?auto_23639 ?auto_23634 ) ( ON ?auto_23639 ?auto_23633 ) ( CLEAR ?auto_23639 ) ( not ( = ?auto_23625 ?auto_23633 ) ) ( not ( = ?auto_23626 ?auto_23633 ) ) ( not ( = ?auto_23639 ?auto_23633 ) ) ( not ( = ?auto_23628 ?auto_23633 ) ) ( not ( = ?auto_23630 ?auto_23633 ) ) ( not ( = ?auto_23636 ?auto_23633 ) ) ( IS-CRATE ?auto_23636 ) ( not ( = ?auto_23631 ?auto_23636 ) ) ( not ( = ?auto_23625 ?auto_23631 ) ) ( not ( = ?auto_23626 ?auto_23631 ) ) ( not ( = ?auto_23639 ?auto_23631 ) ) ( not ( = ?auto_23628 ?auto_23631 ) ) ( not ( = ?auto_23630 ?auto_23631 ) ) ( not ( = ?auto_23633 ?auto_23631 ) ) ( AVAILABLE ?auto_23629 ) ( SURFACE-AT ?auto_23636 ?auto_23643 ) ( ON ?auto_23636 ?auto_23635 ) ( CLEAR ?auto_23636 ) ( not ( = ?auto_23625 ?auto_23635 ) ) ( not ( = ?auto_23626 ?auto_23635 ) ) ( not ( = ?auto_23639 ?auto_23635 ) ) ( not ( = ?auto_23628 ?auto_23635 ) ) ( not ( = ?auto_23630 ?auto_23635 ) ) ( not ( = ?auto_23636 ?auto_23635 ) ) ( not ( = ?auto_23633 ?auto_23635 ) ) ( not ( = ?auto_23631 ?auto_23635 ) ) ( SURFACE-AT ?auto_23640 ?auto_23637 ) ( CLEAR ?auto_23640 ) ( IS-CRATE ?auto_23631 ) ( not ( = ?auto_23640 ?auto_23631 ) ) ( not ( = ?auto_23625 ?auto_23640 ) ) ( not ( = ?auto_23626 ?auto_23640 ) ) ( not ( = ?auto_23639 ?auto_23640 ) ) ( not ( = ?auto_23628 ?auto_23640 ) ) ( not ( = ?auto_23630 ?auto_23640 ) ) ( not ( = ?auto_23636 ?auto_23640 ) ) ( not ( = ?auto_23633 ?auto_23640 ) ) ( not ( = ?auto_23635 ?auto_23640 ) ) ( AVAILABLE ?auto_23632 ) ( TRUCK-AT ?auto_23627 ?auto_23641 ) ( LIFTING ?auto_23642 ?auto_23631 ) )
    :subtasks
    ( ( !LOAD ?auto_23642 ?auto_23631 ?auto_23627 ?auto_23641 )
      ( MAKE-2CRATE ?auto_23639 ?auto_23625 ?auto_23626 )
      ( MAKE-1CRATE-VERIFY ?auto_23625 ?auto_23626 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23644 - SURFACE
      ?auto_23645 - SURFACE
      ?auto_23646 - SURFACE
    )
    :vars
    (
      ?auto_23662 - HOIST
      ?auto_23650 - PLACE
      ?auto_23653 - PLACE
      ?auto_23660 - HOIST
      ?auto_23658 - SURFACE
      ?auto_23656 - PLACE
      ?auto_23648 - HOIST
      ?auto_23652 - SURFACE
      ?auto_23651 - SURFACE
      ?auto_23657 - PLACE
      ?auto_23654 - HOIST
      ?auto_23659 - SURFACE
      ?auto_23661 - SURFACE
      ?auto_23649 - SURFACE
      ?auto_23647 - SURFACE
      ?auto_23655 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23662 ?auto_23650 ) ( IS-CRATE ?auto_23646 ) ( not ( = ?auto_23645 ?auto_23646 ) ) ( not ( = ?auto_23644 ?auto_23645 ) ) ( not ( = ?auto_23644 ?auto_23646 ) ) ( not ( = ?auto_23653 ?auto_23650 ) ) ( HOIST-AT ?auto_23660 ?auto_23653 ) ( not ( = ?auto_23662 ?auto_23660 ) ) ( SURFACE-AT ?auto_23646 ?auto_23653 ) ( ON ?auto_23646 ?auto_23658 ) ( CLEAR ?auto_23646 ) ( not ( = ?auto_23645 ?auto_23658 ) ) ( not ( = ?auto_23646 ?auto_23658 ) ) ( not ( = ?auto_23644 ?auto_23658 ) ) ( IS-CRATE ?auto_23645 ) ( not ( = ?auto_23656 ?auto_23650 ) ) ( not ( = ?auto_23653 ?auto_23656 ) ) ( HOIST-AT ?auto_23648 ?auto_23656 ) ( not ( = ?auto_23662 ?auto_23648 ) ) ( not ( = ?auto_23660 ?auto_23648 ) ) ( SURFACE-AT ?auto_23645 ?auto_23656 ) ( ON ?auto_23645 ?auto_23652 ) ( CLEAR ?auto_23645 ) ( not ( = ?auto_23645 ?auto_23652 ) ) ( not ( = ?auto_23646 ?auto_23652 ) ) ( not ( = ?auto_23644 ?auto_23652 ) ) ( not ( = ?auto_23658 ?auto_23652 ) ) ( IS-CRATE ?auto_23644 ) ( not ( = ?auto_23651 ?auto_23644 ) ) ( not ( = ?auto_23645 ?auto_23651 ) ) ( not ( = ?auto_23646 ?auto_23651 ) ) ( not ( = ?auto_23658 ?auto_23651 ) ) ( not ( = ?auto_23652 ?auto_23651 ) ) ( not ( = ?auto_23657 ?auto_23650 ) ) ( not ( = ?auto_23653 ?auto_23657 ) ) ( not ( = ?auto_23656 ?auto_23657 ) ) ( HOIST-AT ?auto_23654 ?auto_23657 ) ( not ( = ?auto_23662 ?auto_23654 ) ) ( not ( = ?auto_23660 ?auto_23654 ) ) ( not ( = ?auto_23648 ?auto_23654 ) ) ( AVAILABLE ?auto_23654 ) ( SURFACE-AT ?auto_23644 ?auto_23657 ) ( ON ?auto_23644 ?auto_23659 ) ( CLEAR ?auto_23644 ) ( not ( = ?auto_23645 ?auto_23659 ) ) ( not ( = ?auto_23646 ?auto_23659 ) ) ( not ( = ?auto_23644 ?auto_23659 ) ) ( not ( = ?auto_23658 ?auto_23659 ) ) ( not ( = ?auto_23652 ?auto_23659 ) ) ( not ( = ?auto_23651 ?auto_23659 ) ) ( IS-CRATE ?auto_23651 ) ( not ( = ?auto_23661 ?auto_23651 ) ) ( not ( = ?auto_23645 ?auto_23661 ) ) ( not ( = ?auto_23646 ?auto_23661 ) ) ( not ( = ?auto_23644 ?auto_23661 ) ) ( not ( = ?auto_23658 ?auto_23661 ) ) ( not ( = ?auto_23652 ?auto_23661 ) ) ( not ( = ?auto_23659 ?auto_23661 ) ) ( AVAILABLE ?auto_23648 ) ( SURFACE-AT ?auto_23651 ?auto_23656 ) ( ON ?auto_23651 ?auto_23649 ) ( CLEAR ?auto_23651 ) ( not ( = ?auto_23645 ?auto_23649 ) ) ( not ( = ?auto_23646 ?auto_23649 ) ) ( not ( = ?auto_23644 ?auto_23649 ) ) ( not ( = ?auto_23658 ?auto_23649 ) ) ( not ( = ?auto_23652 ?auto_23649 ) ) ( not ( = ?auto_23651 ?auto_23649 ) ) ( not ( = ?auto_23659 ?auto_23649 ) ) ( not ( = ?auto_23661 ?auto_23649 ) ) ( SURFACE-AT ?auto_23647 ?auto_23650 ) ( CLEAR ?auto_23647 ) ( IS-CRATE ?auto_23661 ) ( not ( = ?auto_23647 ?auto_23661 ) ) ( not ( = ?auto_23645 ?auto_23647 ) ) ( not ( = ?auto_23646 ?auto_23647 ) ) ( not ( = ?auto_23644 ?auto_23647 ) ) ( not ( = ?auto_23658 ?auto_23647 ) ) ( not ( = ?auto_23652 ?auto_23647 ) ) ( not ( = ?auto_23651 ?auto_23647 ) ) ( not ( = ?auto_23659 ?auto_23647 ) ) ( not ( = ?auto_23649 ?auto_23647 ) ) ( AVAILABLE ?auto_23662 ) ( TRUCK-AT ?auto_23655 ?auto_23653 ) ( LIFTING ?auto_23660 ?auto_23661 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23645 ?auto_23646 )
      ( MAKE-2CRATE-VERIFY ?auto_23644 ?auto_23645 ?auto_23646 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23663 - SURFACE
      ?auto_23664 - SURFACE
      ?auto_23665 - SURFACE
      ?auto_23666 - SURFACE
    )
    :vars
    (
      ?auto_23671 - HOIST
      ?auto_23676 - PLACE
      ?auto_23667 - PLACE
      ?auto_23673 - HOIST
      ?auto_23674 - SURFACE
      ?auto_23672 - PLACE
      ?auto_23669 - HOIST
      ?auto_23678 - SURFACE
      ?auto_23670 - PLACE
      ?auto_23677 - HOIST
      ?auto_23681 - SURFACE
      ?auto_23679 - SURFACE
      ?auto_23675 - SURFACE
      ?auto_23680 - SURFACE
      ?auto_23668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23671 ?auto_23676 ) ( IS-CRATE ?auto_23666 ) ( not ( = ?auto_23665 ?auto_23666 ) ) ( not ( = ?auto_23664 ?auto_23665 ) ) ( not ( = ?auto_23664 ?auto_23666 ) ) ( not ( = ?auto_23667 ?auto_23676 ) ) ( HOIST-AT ?auto_23673 ?auto_23667 ) ( not ( = ?auto_23671 ?auto_23673 ) ) ( SURFACE-AT ?auto_23666 ?auto_23667 ) ( ON ?auto_23666 ?auto_23674 ) ( CLEAR ?auto_23666 ) ( not ( = ?auto_23665 ?auto_23674 ) ) ( not ( = ?auto_23666 ?auto_23674 ) ) ( not ( = ?auto_23664 ?auto_23674 ) ) ( IS-CRATE ?auto_23665 ) ( not ( = ?auto_23672 ?auto_23676 ) ) ( not ( = ?auto_23667 ?auto_23672 ) ) ( HOIST-AT ?auto_23669 ?auto_23672 ) ( not ( = ?auto_23671 ?auto_23669 ) ) ( not ( = ?auto_23673 ?auto_23669 ) ) ( SURFACE-AT ?auto_23665 ?auto_23672 ) ( ON ?auto_23665 ?auto_23678 ) ( CLEAR ?auto_23665 ) ( not ( = ?auto_23665 ?auto_23678 ) ) ( not ( = ?auto_23666 ?auto_23678 ) ) ( not ( = ?auto_23664 ?auto_23678 ) ) ( not ( = ?auto_23674 ?auto_23678 ) ) ( IS-CRATE ?auto_23664 ) ( not ( = ?auto_23663 ?auto_23664 ) ) ( not ( = ?auto_23665 ?auto_23663 ) ) ( not ( = ?auto_23666 ?auto_23663 ) ) ( not ( = ?auto_23674 ?auto_23663 ) ) ( not ( = ?auto_23678 ?auto_23663 ) ) ( not ( = ?auto_23670 ?auto_23676 ) ) ( not ( = ?auto_23667 ?auto_23670 ) ) ( not ( = ?auto_23672 ?auto_23670 ) ) ( HOIST-AT ?auto_23677 ?auto_23670 ) ( not ( = ?auto_23671 ?auto_23677 ) ) ( not ( = ?auto_23673 ?auto_23677 ) ) ( not ( = ?auto_23669 ?auto_23677 ) ) ( AVAILABLE ?auto_23677 ) ( SURFACE-AT ?auto_23664 ?auto_23670 ) ( ON ?auto_23664 ?auto_23681 ) ( CLEAR ?auto_23664 ) ( not ( = ?auto_23665 ?auto_23681 ) ) ( not ( = ?auto_23666 ?auto_23681 ) ) ( not ( = ?auto_23664 ?auto_23681 ) ) ( not ( = ?auto_23674 ?auto_23681 ) ) ( not ( = ?auto_23678 ?auto_23681 ) ) ( not ( = ?auto_23663 ?auto_23681 ) ) ( IS-CRATE ?auto_23663 ) ( not ( = ?auto_23679 ?auto_23663 ) ) ( not ( = ?auto_23665 ?auto_23679 ) ) ( not ( = ?auto_23666 ?auto_23679 ) ) ( not ( = ?auto_23664 ?auto_23679 ) ) ( not ( = ?auto_23674 ?auto_23679 ) ) ( not ( = ?auto_23678 ?auto_23679 ) ) ( not ( = ?auto_23681 ?auto_23679 ) ) ( AVAILABLE ?auto_23669 ) ( SURFACE-AT ?auto_23663 ?auto_23672 ) ( ON ?auto_23663 ?auto_23675 ) ( CLEAR ?auto_23663 ) ( not ( = ?auto_23665 ?auto_23675 ) ) ( not ( = ?auto_23666 ?auto_23675 ) ) ( not ( = ?auto_23664 ?auto_23675 ) ) ( not ( = ?auto_23674 ?auto_23675 ) ) ( not ( = ?auto_23678 ?auto_23675 ) ) ( not ( = ?auto_23663 ?auto_23675 ) ) ( not ( = ?auto_23681 ?auto_23675 ) ) ( not ( = ?auto_23679 ?auto_23675 ) ) ( SURFACE-AT ?auto_23680 ?auto_23676 ) ( CLEAR ?auto_23680 ) ( IS-CRATE ?auto_23679 ) ( not ( = ?auto_23680 ?auto_23679 ) ) ( not ( = ?auto_23665 ?auto_23680 ) ) ( not ( = ?auto_23666 ?auto_23680 ) ) ( not ( = ?auto_23664 ?auto_23680 ) ) ( not ( = ?auto_23674 ?auto_23680 ) ) ( not ( = ?auto_23678 ?auto_23680 ) ) ( not ( = ?auto_23663 ?auto_23680 ) ) ( not ( = ?auto_23681 ?auto_23680 ) ) ( not ( = ?auto_23675 ?auto_23680 ) ) ( AVAILABLE ?auto_23671 ) ( TRUCK-AT ?auto_23668 ?auto_23667 ) ( LIFTING ?auto_23673 ?auto_23679 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23664 ?auto_23665 ?auto_23666 )
      ( MAKE-3CRATE-VERIFY ?auto_23663 ?auto_23664 ?auto_23665 ?auto_23666 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23682 - SURFACE
      ?auto_23683 - SURFACE
      ?auto_23684 - SURFACE
      ?auto_23685 - SURFACE
      ?auto_23686 - SURFACE
    )
    :vars
    (
      ?auto_23691 - HOIST
      ?auto_23696 - PLACE
      ?auto_23687 - PLACE
      ?auto_23693 - HOIST
      ?auto_23694 - SURFACE
      ?auto_23692 - PLACE
      ?auto_23689 - HOIST
      ?auto_23698 - SURFACE
      ?auto_23690 - PLACE
      ?auto_23697 - HOIST
      ?auto_23700 - SURFACE
      ?auto_23695 - SURFACE
      ?auto_23699 - SURFACE
      ?auto_23688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23691 ?auto_23696 ) ( IS-CRATE ?auto_23686 ) ( not ( = ?auto_23685 ?auto_23686 ) ) ( not ( = ?auto_23684 ?auto_23685 ) ) ( not ( = ?auto_23684 ?auto_23686 ) ) ( not ( = ?auto_23687 ?auto_23696 ) ) ( HOIST-AT ?auto_23693 ?auto_23687 ) ( not ( = ?auto_23691 ?auto_23693 ) ) ( SURFACE-AT ?auto_23686 ?auto_23687 ) ( ON ?auto_23686 ?auto_23694 ) ( CLEAR ?auto_23686 ) ( not ( = ?auto_23685 ?auto_23694 ) ) ( not ( = ?auto_23686 ?auto_23694 ) ) ( not ( = ?auto_23684 ?auto_23694 ) ) ( IS-CRATE ?auto_23685 ) ( not ( = ?auto_23692 ?auto_23696 ) ) ( not ( = ?auto_23687 ?auto_23692 ) ) ( HOIST-AT ?auto_23689 ?auto_23692 ) ( not ( = ?auto_23691 ?auto_23689 ) ) ( not ( = ?auto_23693 ?auto_23689 ) ) ( SURFACE-AT ?auto_23685 ?auto_23692 ) ( ON ?auto_23685 ?auto_23698 ) ( CLEAR ?auto_23685 ) ( not ( = ?auto_23685 ?auto_23698 ) ) ( not ( = ?auto_23686 ?auto_23698 ) ) ( not ( = ?auto_23684 ?auto_23698 ) ) ( not ( = ?auto_23694 ?auto_23698 ) ) ( IS-CRATE ?auto_23684 ) ( not ( = ?auto_23683 ?auto_23684 ) ) ( not ( = ?auto_23685 ?auto_23683 ) ) ( not ( = ?auto_23686 ?auto_23683 ) ) ( not ( = ?auto_23694 ?auto_23683 ) ) ( not ( = ?auto_23698 ?auto_23683 ) ) ( not ( = ?auto_23690 ?auto_23696 ) ) ( not ( = ?auto_23687 ?auto_23690 ) ) ( not ( = ?auto_23692 ?auto_23690 ) ) ( HOIST-AT ?auto_23697 ?auto_23690 ) ( not ( = ?auto_23691 ?auto_23697 ) ) ( not ( = ?auto_23693 ?auto_23697 ) ) ( not ( = ?auto_23689 ?auto_23697 ) ) ( AVAILABLE ?auto_23697 ) ( SURFACE-AT ?auto_23684 ?auto_23690 ) ( ON ?auto_23684 ?auto_23700 ) ( CLEAR ?auto_23684 ) ( not ( = ?auto_23685 ?auto_23700 ) ) ( not ( = ?auto_23686 ?auto_23700 ) ) ( not ( = ?auto_23684 ?auto_23700 ) ) ( not ( = ?auto_23694 ?auto_23700 ) ) ( not ( = ?auto_23698 ?auto_23700 ) ) ( not ( = ?auto_23683 ?auto_23700 ) ) ( IS-CRATE ?auto_23683 ) ( not ( = ?auto_23682 ?auto_23683 ) ) ( not ( = ?auto_23685 ?auto_23682 ) ) ( not ( = ?auto_23686 ?auto_23682 ) ) ( not ( = ?auto_23684 ?auto_23682 ) ) ( not ( = ?auto_23694 ?auto_23682 ) ) ( not ( = ?auto_23698 ?auto_23682 ) ) ( not ( = ?auto_23700 ?auto_23682 ) ) ( AVAILABLE ?auto_23689 ) ( SURFACE-AT ?auto_23683 ?auto_23692 ) ( ON ?auto_23683 ?auto_23695 ) ( CLEAR ?auto_23683 ) ( not ( = ?auto_23685 ?auto_23695 ) ) ( not ( = ?auto_23686 ?auto_23695 ) ) ( not ( = ?auto_23684 ?auto_23695 ) ) ( not ( = ?auto_23694 ?auto_23695 ) ) ( not ( = ?auto_23698 ?auto_23695 ) ) ( not ( = ?auto_23683 ?auto_23695 ) ) ( not ( = ?auto_23700 ?auto_23695 ) ) ( not ( = ?auto_23682 ?auto_23695 ) ) ( SURFACE-AT ?auto_23699 ?auto_23696 ) ( CLEAR ?auto_23699 ) ( IS-CRATE ?auto_23682 ) ( not ( = ?auto_23699 ?auto_23682 ) ) ( not ( = ?auto_23685 ?auto_23699 ) ) ( not ( = ?auto_23686 ?auto_23699 ) ) ( not ( = ?auto_23684 ?auto_23699 ) ) ( not ( = ?auto_23694 ?auto_23699 ) ) ( not ( = ?auto_23698 ?auto_23699 ) ) ( not ( = ?auto_23683 ?auto_23699 ) ) ( not ( = ?auto_23700 ?auto_23699 ) ) ( not ( = ?auto_23695 ?auto_23699 ) ) ( AVAILABLE ?auto_23691 ) ( TRUCK-AT ?auto_23688 ?auto_23687 ) ( LIFTING ?auto_23693 ?auto_23682 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23684 ?auto_23685 ?auto_23686 )
      ( MAKE-4CRATE-VERIFY ?auto_23682 ?auto_23683 ?auto_23684 ?auto_23685 ?auto_23686 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23701 - SURFACE
      ?auto_23702 - SURFACE
      ?auto_23703 - SURFACE
      ?auto_23704 - SURFACE
      ?auto_23705 - SURFACE
      ?auto_23706 - SURFACE
    )
    :vars
    (
      ?auto_23711 - HOIST
      ?auto_23716 - PLACE
      ?auto_23707 - PLACE
      ?auto_23713 - HOIST
      ?auto_23714 - SURFACE
      ?auto_23712 - PLACE
      ?auto_23709 - HOIST
      ?auto_23718 - SURFACE
      ?auto_23710 - PLACE
      ?auto_23717 - HOIST
      ?auto_23719 - SURFACE
      ?auto_23715 - SURFACE
      ?auto_23708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23711 ?auto_23716 ) ( IS-CRATE ?auto_23706 ) ( not ( = ?auto_23705 ?auto_23706 ) ) ( not ( = ?auto_23704 ?auto_23705 ) ) ( not ( = ?auto_23704 ?auto_23706 ) ) ( not ( = ?auto_23707 ?auto_23716 ) ) ( HOIST-AT ?auto_23713 ?auto_23707 ) ( not ( = ?auto_23711 ?auto_23713 ) ) ( SURFACE-AT ?auto_23706 ?auto_23707 ) ( ON ?auto_23706 ?auto_23714 ) ( CLEAR ?auto_23706 ) ( not ( = ?auto_23705 ?auto_23714 ) ) ( not ( = ?auto_23706 ?auto_23714 ) ) ( not ( = ?auto_23704 ?auto_23714 ) ) ( IS-CRATE ?auto_23705 ) ( not ( = ?auto_23712 ?auto_23716 ) ) ( not ( = ?auto_23707 ?auto_23712 ) ) ( HOIST-AT ?auto_23709 ?auto_23712 ) ( not ( = ?auto_23711 ?auto_23709 ) ) ( not ( = ?auto_23713 ?auto_23709 ) ) ( SURFACE-AT ?auto_23705 ?auto_23712 ) ( ON ?auto_23705 ?auto_23718 ) ( CLEAR ?auto_23705 ) ( not ( = ?auto_23705 ?auto_23718 ) ) ( not ( = ?auto_23706 ?auto_23718 ) ) ( not ( = ?auto_23704 ?auto_23718 ) ) ( not ( = ?auto_23714 ?auto_23718 ) ) ( IS-CRATE ?auto_23704 ) ( not ( = ?auto_23703 ?auto_23704 ) ) ( not ( = ?auto_23705 ?auto_23703 ) ) ( not ( = ?auto_23706 ?auto_23703 ) ) ( not ( = ?auto_23714 ?auto_23703 ) ) ( not ( = ?auto_23718 ?auto_23703 ) ) ( not ( = ?auto_23710 ?auto_23716 ) ) ( not ( = ?auto_23707 ?auto_23710 ) ) ( not ( = ?auto_23712 ?auto_23710 ) ) ( HOIST-AT ?auto_23717 ?auto_23710 ) ( not ( = ?auto_23711 ?auto_23717 ) ) ( not ( = ?auto_23713 ?auto_23717 ) ) ( not ( = ?auto_23709 ?auto_23717 ) ) ( AVAILABLE ?auto_23717 ) ( SURFACE-AT ?auto_23704 ?auto_23710 ) ( ON ?auto_23704 ?auto_23719 ) ( CLEAR ?auto_23704 ) ( not ( = ?auto_23705 ?auto_23719 ) ) ( not ( = ?auto_23706 ?auto_23719 ) ) ( not ( = ?auto_23704 ?auto_23719 ) ) ( not ( = ?auto_23714 ?auto_23719 ) ) ( not ( = ?auto_23718 ?auto_23719 ) ) ( not ( = ?auto_23703 ?auto_23719 ) ) ( IS-CRATE ?auto_23703 ) ( not ( = ?auto_23702 ?auto_23703 ) ) ( not ( = ?auto_23705 ?auto_23702 ) ) ( not ( = ?auto_23706 ?auto_23702 ) ) ( not ( = ?auto_23704 ?auto_23702 ) ) ( not ( = ?auto_23714 ?auto_23702 ) ) ( not ( = ?auto_23718 ?auto_23702 ) ) ( not ( = ?auto_23719 ?auto_23702 ) ) ( AVAILABLE ?auto_23709 ) ( SURFACE-AT ?auto_23703 ?auto_23712 ) ( ON ?auto_23703 ?auto_23715 ) ( CLEAR ?auto_23703 ) ( not ( = ?auto_23705 ?auto_23715 ) ) ( not ( = ?auto_23706 ?auto_23715 ) ) ( not ( = ?auto_23704 ?auto_23715 ) ) ( not ( = ?auto_23714 ?auto_23715 ) ) ( not ( = ?auto_23718 ?auto_23715 ) ) ( not ( = ?auto_23703 ?auto_23715 ) ) ( not ( = ?auto_23719 ?auto_23715 ) ) ( not ( = ?auto_23702 ?auto_23715 ) ) ( SURFACE-AT ?auto_23701 ?auto_23716 ) ( CLEAR ?auto_23701 ) ( IS-CRATE ?auto_23702 ) ( not ( = ?auto_23701 ?auto_23702 ) ) ( not ( = ?auto_23705 ?auto_23701 ) ) ( not ( = ?auto_23706 ?auto_23701 ) ) ( not ( = ?auto_23704 ?auto_23701 ) ) ( not ( = ?auto_23714 ?auto_23701 ) ) ( not ( = ?auto_23718 ?auto_23701 ) ) ( not ( = ?auto_23703 ?auto_23701 ) ) ( not ( = ?auto_23719 ?auto_23701 ) ) ( not ( = ?auto_23715 ?auto_23701 ) ) ( AVAILABLE ?auto_23711 ) ( TRUCK-AT ?auto_23708 ?auto_23707 ) ( LIFTING ?auto_23713 ?auto_23702 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23704 ?auto_23705 ?auto_23706 )
      ( MAKE-5CRATE-VERIFY ?auto_23701 ?auto_23702 ?auto_23703 ?auto_23704 ?auto_23705 ?auto_23706 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23720 - SURFACE
      ?auto_23721 - SURFACE
    )
    :vars
    (
      ?auto_23726 - HOIST
      ?auto_23731 - PLACE
      ?auto_23735 - SURFACE
      ?auto_23722 - PLACE
      ?auto_23728 - HOIST
      ?auto_23729 - SURFACE
      ?auto_23727 - PLACE
      ?auto_23724 - HOIST
      ?auto_23734 - SURFACE
      ?auto_23732 - SURFACE
      ?auto_23725 - PLACE
      ?auto_23733 - HOIST
      ?auto_23738 - SURFACE
      ?auto_23736 - SURFACE
      ?auto_23730 - SURFACE
      ?auto_23737 - SURFACE
      ?auto_23723 - TRUCK
      ?auto_23739 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23726 ?auto_23731 ) ( IS-CRATE ?auto_23721 ) ( not ( = ?auto_23720 ?auto_23721 ) ) ( not ( = ?auto_23735 ?auto_23720 ) ) ( not ( = ?auto_23735 ?auto_23721 ) ) ( not ( = ?auto_23722 ?auto_23731 ) ) ( HOIST-AT ?auto_23728 ?auto_23722 ) ( not ( = ?auto_23726 ?auto_23728 ) ) ( SURFACE-AT ?auto_23721 ?auto_23722 ) ( ON ?auto_23721 ?auto_23729 ) ( CLEAR ?auto_23721 ) ( not ( = ?auto_23720 ?auto_23729 ) ) ( not ( = ?auto_23721 ?auto_23729 ) ) ( not ( = ?auto_23735 ?auto_23729 ) ) ( IS-CRATE ?auto_23720 ) ( not ( = ?auto_23727 ?auto_23731 ) ) ( not ( = ?auto_23722 ?auto_23727 ) ) ( HOIST-AT ?auto_23724 ?auto_23727 ) ( not ( = ?auto_23726 ?auto_23724 ) ) ( not ( = ?auto_23728 ?auto_23724 ) ) ( SURFACE-AT ?auto_23720 ?auto_23727 ) ( ON ?auto_23720 ?auto_23734 ) ( CLEAR ?auto_23720 ) ( not ( = ?auto_23720 ?auto_23734 ) ) ( not ( = ?auto_23721 ?auto_23734 ) ) ( not ( = ?auto_23735 ?auto_23734 ) ) ( not ( = ?auto_23729 ?auto_23734 ) ) ( IS-CRATE ?auto_23735 ) ( not ( = ?auto_23732 ?auto_23735 ) ) ( not ( = ?auto_23720 ?auto_23732 ) ) ( not ( = ?auto_23721 ?auto_23732 ) ) ( not ( = ?auto_23729 ?auto_23732 ) ) ( not ( = ?auto_23734 ?auto_23732 ) ) ( not ( = ?auto_23725 ?auto_23731 ) ) ( not ( = ?auto_23722 ?auto_23725 ) ) ( not ( = ?auto_23727 ?auto_23725 ) ) ( HOIST-AT ?auto_23733 ?auto_23725 ) ( not ( = ?auto_23726 ?auto_23733 ) ) ( not ( = ?auto_23728 ?auto_23733 ) ) ( not ( = ?auto_23724 ?auto_23733 ) ) ( AVAILABLE ?auto_23733 ) ( SURFACE-AT ?auto_23735 ?auto_23725 ) ( ON ?auto_23735 ?auto_23738 ) ( CLEAR ?auto_23735 ) ( not ( = ?auto_23720 ?auto_23738 ) ) ( not ( = ?auto_23721 ?auto_23738 ) ) ( not ( = ?auto_23735 ?auto_23738 ) ) ( not ( = ?auto_23729 ?auto_23738 ) ) ( not ( = ?auto_23734 ?auto_23738 ) ) ( not ( = ?auto_23732 ?auto_23738 ) ) ( IS-CRATE ?auto_23732 ) ( not ( = ?auto_23736 ?auto_23732 ) ) ( not ( = ?auto_23720 ?auto_23736 ) ) ( not ( = ?auto_23721 ?auto_23736 ) ) ( not ( = ?auto_23735 ?auto_23736 ) ) ( not ( = ?auto_23729 ?auto_23736 ) ) ( not ( = ?auto_23734 ?auto_23736 ) ) ( not ( = ?auto_23738 ?auto_23736 ) ) ( AVAILABLE ?auto_23724 ) ( SURFACE-AT ?auto_23732 ?auto_23727 ) ( ON ?auto_23732 ?auto_23730 ) ( CLEAR ?auto_23732 ) ( not ( = ?auto_23720 ?auto_23730 ) ) ( not ( = ?auto_23721 ?auto_23730 ) ) ( not ( = ?auto_23735 ?auto_23730 ) ) ( not ( = ?auto_23729 ?auto_23730 ) ) ( not ( = ?auto_23734 ?auto_23730 ) ) ( not ( = ?auto_23732 ?auto_23730 ) ) ( not ( = ?auto_23738 ?auto_23730 ) ) ( not ( = ?auto_23736 ?auto_23730 ) ) ( SURFACE-AT ?auto_23737 ?auto_23731 ) ( CLEAR ?auto_23737 ) ( IS-CRATE ?auto_23736 ) ( not ( = ?auto_23737 ?auto_23736 ) ) ( not ( = ?auto_23720 ?auto_23737 ) ) ( not ( = ?auto_23721 ?auto_23737 ) ) ( not ( = ?auto_23735 ?auto_23737 ) ) ( not ( = ?auto_23729 ?auto_23737 ) ) ( not ( = ?auto_23734 ?auto_23737 ) ) ( not ( = ?auto_23732 ?auto_23737 ) ) ( not ( = ?auto_23738 ?auto_23737 ) ) ( not ( = ?auto_23730 ?auto_23737 ) ) ( AVAILABLE ?auto_23726 ) ( TRUCK-AT ?auto_23723 ?auto_23722 ) ( AVAILABLE ?auto_23728 ) ( SURFACE-AT ?auto_23736 ?auto_23722 ) ( ON ?auto_23736 ?auto_23739 ) ( CLEAR ?auto_23736 ) ( not ( = ?auto_23720 ?auto_23739 ) ) ( not ( = ?auto_23721 ?auto_23739 ) ) ( not ( = ?auto_23735 ?auto_23739 ) ) ( not ( = ?auto_23729 ?auto_23739 ) ) ( not ( = ?auto_23734 ?auto_23739 ) ) ( not ( = ?auto_23732 ?auto_23739 ) ) ( not ( = ?auto_23738 ?auto_23739 ) ) ( not ( = ?auto_23736 ?auto_23739 ) ) ( not ( = ?auto_23730 ?auto_23739 ) ) ( not ( = ?auto_23737 ?auto_23739 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23728 ?auto_23736 ?auto_23739 ?auto_23722 )
      ( MAKE-2CRATE ?auto_23735 ?auto_23720 ?auto_23721 )
      ( MAKE-1CRATE-VERIFY ?auto_23720 ?auto_23721 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23740 - SURFACE
      ?auto_23741 - SURFACE
      ?auto_23742 - SURFACE
    )
    :vars
    (
      ?auto_23753 - HOIST
      ?auto_23755 - PLACE
      ?auto_23759 - PLACE
      ?auto_23751 - HOIST
      ?auto_23745 - SURFACE
      ?auto_23748 - PLACE
      ?auto_23756 - HOIST
      ?auto_23744 - SURFACE
      ?auto_23747 - SURFACE
      ?auto_23746 - PLACE
      ?auto_23754 - HOIST
      ?auto_23743 - SURFACE
      ?auto_23757 - SURFACE
      ?auto_23749 - SURFACE
      ?auto_23758 - SURFACE
      ?auto_23750 - TRUCK
      ?auto_23752 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23753 ?auto_23755 ) ( IS-CRATE ?auto_23742 ) ( not ( = ?auto_23741 ?auto_23742 ) ) ( not ( = ?auto_23740 ?auto_23741 ) ) ( not ( = ?auto_23740 ?auto_23742 ) ) ( not ( = ?auto_23759 ?auto_23755 ) ) ( HOIST-AT ?auto_23751 ?auto_23759 ) ( not ( = ?auto_23753 ?auto_23751 ) ) ( SURFACE-AT ?auto_23742 ?auto_23759 ) ( ON ?auto_23742 ?auto_23745 ) ( CLEAR ?auto_23742 ) ( not ( = ?auto_23741 ?auto_23745 ) ) ( not ( = ?auto_23742 ?auto_23745 ) ) ( not ( = ?auto_23740 ?auto_23745 ) ) ( IS-CRATE ?auto_23741 ) ( not ( = ?auto_23748 ?auto_23755 ) ) ( not ( = ?auto_23759 ?auto_23748 ) ) ( HOIST-AT ?auto_23756 ?auto_23748 ) ( not ( = ?auto_23753 ?auto_23756 ) ) ( not ( = ?auto_23751 ?auto_23756 ) ) ( SURFACE-AT ?auto_23741 ?auto_23748 ) ( ON ?auto_23741 ?auto_23744 ) ( CLEAR ?auto_23741 ) ( not ( = ?auto_23741 ?auto_23744 ) ) ( not ( = ?auto_23742 ?auto_23744 ) ) ( not ( = ?auto_23740 ?auto_23744 ) ) ( not ( = ?auto_23745 ?auto_23744 ) ) ( IS-CRATE ?auto_23740 ) ( not ( = ?auto_23747 ?auto_23740 ) ) ( not ( = ?auto_23741 ?auto_23747 ) ) ( not ( = ?auto_23742 ?auto_23747 ) ) ( not ( = ?auto_23745 ?auto_23747 ) ) ( not ( = ?auto_23744 ?auto_23747 ) ) ( not ( = ?auto_23746 ?auto_23755 ) ) ( not ( = ?auto_23759 ?auto_23746 ) ) ( not ( = ?auto_23748 ?auto_23746 ) ) ( HOIST-AT ?auto_23754 ?auto_23746 ) ( not ( = ?auto_23753 ?auto_23754 ) ) ( not ( = ?auto_23751 ?auto_23754 ) ) ( not ( = ?auto_23756 ?auto_23754 ) ) ( AVAILABLE ?auto_23754 ) ( SURFACE-AT ?auto_23740 ?auto_23746 ) ( ON ?auto_23740 ?auto_23743 ) ( CLEAR ?auto_23740 ) ( not ( = ?auto_23741 ?auto_23743 ) ) ( not ( = ?auto_23742 ?auto_23743 ) ) ( not ( = ?auto_23740 ?auto_23743 ) ) ( not ( = ?auto_23745 ?auto_23743 ) ) ( not ( = ?auto_23744 ?auto_23743 ) ) ( not ( = ?auto_23747 ?auto_23743 ) ) ( IS-CRATE ?auto_23747 ) ( not ( = ?auto_23757 ?auto_23747 ) ) ( not ( = ?auto_23741 ?auto_23757 ) ) ( not ( = ?auto_23742 ?auto_23757 ) ) ( not ( = ?auto_23740 ?auto_23757 ) ) ( not ( = ?auto_23745 ?auto_23757 ) ) ( not ( = ?auto_23744 ?auto_23757 ) ) ( not ( = ?auto_23743 ?auto_23757 ) ) ( AVAILABLE ?auto_23756 ) ( SURFACE-AT ?auto_23747 ?auto_23748 ) ( ON ?auto_23747 ?auto_23749 ) ( CLEAR ?auto_23747 ) ( not ( = ?auto_23741 ?auto_23749 ) ) ( not ( = ?auto_23742 ?auto_23749 ) ) ( not ( = ?auto_23740 ?auto_23749 ) ) ( not ( = ?auto_23745 ?auto_23749 ) ) ( not ( = ?auto_23744 ?auto_23749 ) ) ( not ( = ?auto_23747 ?auto_23749 ) ) ( not ( = ?auto_23743 ?auto_23749 ) ) ( not ( = ?auto_23757 ?auto_23749 ) ) ( SURFACE-AT ?auto_23758 ?auto_23755 ) ( CLEAR ?auto_23758 ) ( IS-CRATE ?auto_23757 ) ( not ( = ?auto_23758 ?auto_23757 ) ) ( not ( = ?auto_23741 ?auto_23758 ) ) ( not ( = ?auto_23742 ?auto_23758 ) ) ( not ( = ?auto_23740 ?auto_23758 ) ) ( not ( = ?auto_23745 ?auto_23758 ) ) ( not ( = ?auto_23744 ?auto_23758 ) ) ( not ( = ?auto_23747 ?auto_23758 ) ) ( not ( = ?auto_23743 ?auto_23758 ) ) ( not ( = ?auto_23749 ?auto_23758 ) ) ( AVAILABLE ?auto_23753 ) ( TRUCK-AT ?auto_23750 ?auto_23759 ) ( AVAILABLE ?auto_23751 ) ( SURFACE-AT ?auto_23757 ?auto_23759 ) ( ON ?auto_23757 ?auto_23752 ) ( CLEAR ?auto_23757 ) ( not ( = ?auto_23741 ?auto_23752 ) ) ( not ( = ?auto_23742 ?auto_23752 ) ) ( not ( = ?auto_23740 ?auto_23752 ) ) ( not ( = ?auto_23745 ?auto_23752 ) ) ( not ( = ?auto_23744 ?auto_23752 ) ) ( not ( = ?auto_23747 ?auto_23752 ) ) ( not ( = ?auto_23743 ?auto_23752 ) ) ( not ( = ?auto_23757 ?auto_23752 ) ) ( not ( = ?auto_23749 ?auto_23752 ) ) ( not ( = ?auto_23758 ?auto_23752 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23741 ?auto_23742 )
      ( MAKE-2CRATE-VERIFY ?auto_23740 ?auto_23741 ?auto_23742 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23760 - SURFACE
      ?auto_23761 - SURFACE
      ?auto_23762 - SURFACE
      ?auto_23763 - SURFACE
    )
    :vars
    (
      ?auto_23769 - HOIST
      ?auto_23773 - PLACE
      ?auto_23771 - PLACE
      ?auto_23774 - HOIST
      ?auto_23765 - SURFACE
      ?auto_23766 - PLACE
      ?auto_23772 - HOIST
      ?auto_23770 - SURFACE
      ?auto_23777 - PLACE
      ?auto_23768 - HOIST
      ?auto_23764 - SURFACE
      ?auto_23778 - SURFACE
      ?auto_23776 - SURFACE
      ?auto_23767 - SURFACE
      ?auto_23779 - TRUCK
      ?auto_23775 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23769 ?auto_23773 ) ( IS-CRATE ?auto_23763 ) ( not ( = ?auto_23762 ?auto_23763 ) ) ( not ( = ?auto_23761 ?auto_23762 ) ) ( not ( = ?auto_23761 ?auto_23763 ) ) ( not ( = ?auto_23771 ?auto_23773 ) ) ( HOIST-AT ?auto_23774 ?auto_23771 ) ( not ( = ?auto_23769 ?auto_23774 ) ) ( SURFACE-AT ?auto_23763 ?auto_23771 ) ( ON ?auto_23763 ?auto_23765 ) ( CLEAR ?auto_23763 ) ( not ( = ?auto_23762 ?auto_23765 ) ) ( not ( = ?auto_23763 ?auto_23765 ) ) ( not ( = ?auto_23761 ?auto_23765 ) ) ( IS-CRATE ?auto_23762 ) ( not ( = ?auto_23766 ?auto_23773 ) ) ( not ( = ?auto_23771 ?auto_23766 ) ) ( HOIST-AT ?auto_23772 ?auto_23766 ) ( not ( = ?auto_23769 ?auto_23772 ) ) ( not ( = ?auto_23774 ?auto_23772 ) ) ( SURFACE-AT ?auto_23762 ?auto_23766 ) ( ON ?auto_23762 ?auto_23770 ) ( CLEAR ?auto_23762 ) ( not ( = ?auto_23762 ?auto_23770 ) ) ( not ( = ?auto_23763 ?auto_23770 ) ) ( not ( = ?auto_23761 ?auto_23770 ) ) ( not ( = ?auto_23765 ?auto_23770 ) ) ( IS-CRATE ?auto_23761 ) ( not ( = ?auto_23760 ?auto_23761 ) ) ( not ( = ?auto_23762 ?auto_23760 ) ) ( not ( = ?auto_23763 ?auto_23760 ) ) ( not ( = ?auto_23765 ?auto_23760 ) ) ( not ( = ?auto_23770 ?auto_23760 ) ) ( not ( = ?auto_23777 ?auto_23773 ) ) ( not ( = ?auto_23771 ?auto_23777 ) ) ( not ( = ?auto_23766 ?auto_23777 ) ) ( HOIST-AT ?auto_23768 ?auto_23777 ) ( not ( = ?auto_23769 ?auto_23768 ) ) ( not ( = ?auto_23774 ?auto_23768 ) ) ( not ( = ?auto_23772 ?auto_23768 ) ) ( AVAILABLE ?auto_23768 ) ( SURFACE-AT ?auto_23761 ?auto_23777 ) ( ON ?auto_23761 ?auto_23764 ) ( CLEAR ?auto_23761 ) ( not ( = ?auto_23762 ?auto_23764 ) ) ( not ( = ?auto_23763 ?auto_23764 ) ) ( not ( = ?auto_23761 ?auto_23764 ) ) ( not ( = ?auto_23765 ?auto_23764 ) ) ( not ( = ?auto_23770 ?auto_23764 ) ) ( not ( = ?auto_23760 ?auto_23764 ) ) ( IS-CRATE ?auto_23760 ) ( not ( = ?auto_23778 ?auto_23760 ) ) ( not ( = ?auto_23762 ?auto_23778 ) ) ( not ( = ?auto_23763 ?auto_23778 ) ) ( not ( = ?auto_23761 ?auto_23778 ) ) ( not ( = ?auto_23765 ?auto_23778 ) ) ( not ( = ?auto_23770 ?auto_23778 ) ) ( not ( = ?auto_23764 ?auto_23778 ) ) ( AVAILABLE ?auto_23772 ) ( SURFACE-AT ?auto_23760 ?auto_23766 ) ( ON ?auto_23760 ?auto_23776 ) ( CLEAR ?auto_23760 ) ( not ( = ?auto_23762 ?auto_23776 ) ) ( not ( = ?auto_23763 ?auto_23776 ) ) ( not ( = ?auto_23761 ?auto_23776 ) ) ( not ( = ?auto_23765 ?auto_23776 ) ) ( not ( = ?auto_23770 ?auto_23776 ) ) ( not ( = ?auto_23760 ?auto_23776 ) ) ( not ( = ?auto_23764 ?auto_23776 ) ) ( not ( = ?auto_23778 ?auto_23776 ) ) ( SURFACE-AT ?auto_23767 ?auto_23773 ) ( CLEAR ?auto_23767 ) ( IS-CRATE ?auto_23778 ) ( not ( = ?auto_23767 ?auto_23778 ) ) ( not ( = ?auto_23762 ?auto_23767 ) ) ( not ( = ?auto_23763 ?auto_23767 ) ) ( not ( = ?auto_23761 ?auto_23767 ) ) ( not ( = ?auto_23765 ?auto_23767 ) ) ( not ( = ?auto_23770 ?auto_23767 ) ) ( not ( = ?auto_23760 ?auto_23767 ) ) ( not ( = ?auto_23764 ?auto_23767 ) ) ( not ( = ?auto_23776 ?auto_23767 ) ) ( AVAILABLE ?auto_23769 ) ( TRUCK-AT ?auto_23779 ?auto_23771 ) ( AVAILABLE ?auto_23774 ) ( SURFACE-AT ?auto_23778 ?auto_23771 ) ( ON ?auto_23778 ?auto_23775 ) ( CLEAR ?auto_23778 ) ( not ( = ?auto_23762 ?auto_23775 ) ) ( not ( = ?auto_23763 ?auto_23775 ) ) ( not ( = ?auto_23761 ?auto_23775 ) ) ( not ( = ?auto_23765 ?auto_23775 ) ) ( not ( = ?auto_23770 ?auto_23775 ) ) ( not ( = ?auto_23760 ?auto_23775 ) ) ( not ( = ?auto_23764 ?auto_23775 ) ) ( not ( = ?auto_23778 ?auto_23775 ) ) ( not ( = ?auto_23776 ?auto_23775 ) ) ( not ( = ?auto_23767 ?auto_23775 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23761 ?auto_23762 ?auto_23763 )
      ( MAKE-3CRATE-VERIFY ?auto_23760 ?auto_23761 ?auto_23762 ?auto_23763 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23780 - SURFACE
      ?auto_23781 - SURFACE
      ?auto_23782 - SURFACE
      ?auto_23783 - SURFACE
      ?auto_23784 - SURFACE
    )
    :vars
    (
      ?auto_23790 - HOIST
      ?auto_23794 - PLACE
      ?auto_23792 - PLACE
      ?auto_23795 - HOIST
      ?auto_23786 - SURFACE
      ?auto_23787 - PLACE
      ?auto_23793 - HOIST
      ?auto_23791 - SURFACE
      ?auto_23798 - PLACE
      ?auto_23789 - HOIST
      ?auto_23785 - SURFACE
      ?auto_23797 - SURFACE
      ?auto_23788 - SURFACE
      ?auto_23799 - TRUCK
      ?auto_23796 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23790 ?auto_23794 ) ( IS-CRATE ?auto_23784 ) ( not ( = ?auto_23783 ?auto_23784 ) ) ( not ( = ?auto_23782 ?auto_23783 ) ) ( not ( = ?auto_23782 ?auto_23784 ) ) ( not ( = ?auto_23792 ?auto_23794 ) ) ( HOIST-AT ?auto_23795 ?auto_23792 ) ( not ( = ?auto_23790 ?auto_23795 ) ) ( SURFACE-AT ?auto_23784 ?auto_23792 ) ( ON ?auto_23784 ?auto_23786 ) ( CLEAR ?auto_23784 ) ( not ( = ?auto_23783 ?auto_23786 ) ) ( not ( = ?auto_23784 ?auto_23786 ) ) ( not ( = ?auto_23782 ?auto_23786 ) ) ( IS-CRATE ?auto_23783 ) ( not ( = ?auto_23787 ?auto_23794 ) ) ( not ( = ?auto_23792 ?auto_23787 ) ) ( HOIST-AT ?auto_23793 ?auto_23787 ) ( not ( = ?auto_23790 ?auto_23793 ) ) ( not ( = ?auto_23795 ?auto_23793 ) ) ( SURFACE-AT ?auto_23783 ?auto_23787 ) ( ON ?auto_23783 ?auto_23791 ) ( CLEAR ?auto_23783 ) ( not ( = ?auto_23783 ?auto_23791 ) ) ( not ( = ?auto_23784 ?auto_23791 ) ) ( not ( = ?auto_23782 ?auto_23791 ) ) ( not ( = ?auto_23786 ?auto_23791 ) ) ( IS-CRATE ?auto_23782 ) ( not ( = ?auto_23781 ?auto_23782 ) ) ( not ( = ?auto_23783 ?auto_23781 ) ) ( not ( = ?auto_23784 ?auto_23781 ) ) ( not ( = ?auto_23786 ?auto_23781 ) ) ( not ( = ?auto_23791 ?auto_23781 ) ) ( not ( = ?auto_23798 ?auto_23794 ) ) ( not ( = ?auto_23792 ?auto_23798 ) ) ( not ( = ?auto_23787 ?auto_23798 ) ) ( HOIST-AT ?auto_23789 ?auto_23798 ) ( not ( = ?auto_23790 ?auto_23789 ) ) ( not ( = ?auto_23795 ?auto_23789 ) ) ( not ( = ?auto_23793 ?auto_23789 ) ) ( AVAILABLE ?auto_23789 ) ( SURFACE-AT ?auto_23782 ?auto_23798 ) ( ON ?auto_23782 ?auto_23785 ) ( CLEAR ?auto_23782 ) ( not ( = ?auto_23783 ?auto_23785 ) ) ( not ( = ?auto_23784 ?auto_23785 ) ) ( not ( = ?auto_23782 ?auto_23785 ) ) ( not ( = ?auto_23786 ?auto_23785 ) ) ( not ( = ?auto_23791 ?auto_23785 ) ) ( not ( = ?auto_23781 ?auto_23785 ) ) ( IS-CRATE ?auto_23781 ) ( not ( = ?auto_23780 ?auto_23781 ) ) ( not ( = ?auto_23783 ?auto_23780 ) ) ( not ( = ?auto_23784 ?auto_23780 ) ) ( not ( = ?auto_23782 ?auto_23780 ) ) ( not ( = ?auto_23786 ?auto_23780 ) ) ( not ( = ?auto_23791 ?auto_23780 ) ) ( not ( = ?auto_23785 ?auto_23780 ) ) ( AVAILABLE ?auto_23793 ) ( SURFACE-AT ?auto_23781 ?auto_23787 ) ( ON ?auto_23781 ?auto_23797 ) ( CLEAR ?auto_23781 ) ( not ( = ?auto_23783 ?auto_23797 ) ) ( not ( = ?auto_23784 ?auto_23797 ) ) ( not ( = ?auto_23782 ?auto_23797 ) ) ( not ( = ?auto_23786 ?auto_23797 ) ) ( not ( = ?auto_23791 ?auto_23797 ) ) ( not ( = ?auto_23781 ?auto_23797 ) ) ( not ( = ?auto_23785 ?auto_23797 ) ) ( not ( = ?auto_23780 ?auto_23797 ) ) ( SURFACE-AT ?auto_23788 ?auto_23794 ) ( CLEAR ?auto_23788 ) ( IS-CRATE ?auto_23780 ) ( not ( = ?auto_23788 ?auto_23780 ) ) ( not ( = ?auto_23783 ?auto_23788 ) ) ( not ( = ?auto_23784 ?auto_23788 ) ) ( not ( = ?auto_23782 ?auto_23788 ) ) ( not ( = ?auto_23786 ?auto_23788 ) ) ( not ( = ?auto_23791 ?auto_23788 ) ) ( not ( = ?auto_23781 ?auto_23788 ) ) ( not ( = ?auto_23785 ?auto_23788 ) ) ( not ( = ?auto_23797 ?auto_23788 ) ) ( AVAILABLE ?auto_23790 ) ( TRUCK-AT ?auto_23799 ?auto_23792 ) ( AVAILABLE ?auto_23795 ) ( SURFACE-AT ?auto_23780 ?auto_23792 ) ( ON ?auto_23780 ?auto_23796 ) ( CLEAR ?auto_23780 ) ( not ( = ?auto_23783 ?auto_23796 ) ) ( not ( = ?auto_23784 ?auto_23796 ) ) ( not ( = ?auto_23782 ?auto_23796 ) ) ( not ( = ?auto_23786 ?auto_23796 ) ) ( not ( = ?auto_23791 ?auto_23796 ) ) ( not ( = ?auto_23781 ?auto_23796 ) ) ( not ( = ?auto_23785 ?auto_23796 ) ) ( not ( = ?auto_23780 ?auto_23796 ) ) ( not ( = ?auto_23797 ?auto_23796 ) ) ( not ( = ?auto_23788 ?auto_23796 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23782 ?auto_23783 ?auto_23784 )
      ( MAKE-4CRATE-VERIFY ?auto_23780 ?auto_23781 ?auto_23782 ?auto_23783 ?auto_23784 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23800 - SURFACE
      ?auto_23801 - SURFACE
      ?auto_23802 - SURFACE
      ?auto_23803 - SURFACE
      ?auto_23804 - SURFACE
      ?auto_23805 - SURFACE
    )
    :vars
    (
      ?auto_23810 - HOIST
      ?auto_23814 - PLACE
      ?auto_23812 - PLACE
      ?auto_23815 - HOIST
      ?auto_23807 - SURFACE
      ?auto_23808 - PLACE
      ?auto_23813 - HOIST
      ?auto_23811 - SURFACE
      ?auto_23818 - PLACE
      ?auto_23809 - HOIST
      ?auto_23806 - SURFACE
      ?auto_23817 - SURFACE
      ?auto_23819 - TRUCK
      ?auto_23816 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23810 ?auto_23814 ) ( IS-CRATE ?auto_23805 ) ( not ( = ?auto_23804 ?auto_23805 ) ) ( not ( = ?auto_23803 ?auto_23804 ) ) ( not ( = ?auto_23803 ?auto_23805 ) ) ( not ( = ?auto_23812 ?auto_23814 ) ) ( HOIST-AT ?auto_23815 ?auto_23812 ) ( not ( = ?auto_23810 ?auto_23815 ) ) ( SURFACE-AT ?auto_23805 ?auto_23812 ) ( ON ?auto_23805 ?auto_23807 ) ( CLEAR ?auto_23805 ) ( not ( = ?auto_23804 ?auto_23807 ) ) ( not ( = ?auto_23805 ?auto_23807 ) ) ( not ( = ?auto_23803 ?auto_23807 ) ) ( IS-CRATE ?auto_23804 ) ( not ( = ?auto_23808 ?auto_23814 ) ) ( not ( = ?auto_23812 ?auto_23808 ) ) ( HOIST-AT ?auto_23813 ?auto_23808 ) ( not ( = ?auto_23810 ?auto_23813 ) ) ( not ( = ?auto_23815 ?auto_23813 ) ) ( SURFACE-AT ?auto_23804 ?auto_23808 ) ( ON ?auto_23804 ?auto_23811 ) ( CLEAR ?auto_23804 ) ( not ( = ?auto_23804 ?auto_23811 ) ) ( not ( = ?auto_23805 ?auto_23811 ) ) ( not ( = ?auto_23803 ?auto_23811 ) ) ( not ( = ?auto_23807 ?auto_23811 ) ) ( IS-CRATE ?auto_23803 ) ( not ( = ?auto_23802 ?auto_23803 ) ) ( not ( = ?auto_23804 ?auto_23802 ) ) ( not ( = ?auto_23805 ?auto_23802 ) ) ( not ( = ?auto_23807 ?auto_23802 ) ) ( not ( = ?auto_23811 ?auto_23802 ) ) ( not ( = ?auto_23818 ?auto_23814 ) ) ( not ( = ?auto_23812 ?auto_23818 ) ) ( not ( = ?auto_23808 ?auto_23818 ) ) ( HOIST-AT ?auto_23809 ?auto_23818 ) ( not ( = ?auto_23810 ?auto_23809 ) ) ( not ( = ?auto_23815 ?auto_23809 ) ) ( not ( = ?auto_23813 ?auto_23809 ) ) ( AVAILABLE ?auto_23809 ) ( SURFACE-AT ?auto_23803 ?auto_23818 ) ( ON ?auto_23803 ?auto_23806 ) ( CLEAR ?auto_23803 ) ( not ( = ?auto_23804 ?auto_23806 ) ) ( not ( = ?auto_23805 ?auto_23806 ) ) ( not ( = ?auto_23803 ?auto_23806 ) ) ( not ( = ?auto_23807 ?auto_23806 ) ) ( not ( = ?auto_23811 ?auto_23806 ) ) ( not ( = ?auto_23802 ?auto_23806 ) ) ( IS-CRATE ?auto_23802 ) ( not ( = ?auto_23801 ?auto_23802 ) ) ( not ( = ?auto_23804 ?auto_23801 ) ) ( not ( = ?auto_23805 ?auto_23801 ) ) ( not ( = ?auto_23803 ?auto_23801 ) ) ( not ( = ?auto_23807 ?auto_23801 ) ) ( not ( = ?auto_23811 ?auto_23801 ) ) ( not ( = ?auto_23806 ?auto_23801 ) ) ( AVAILABLE ?auto_23813 ) ( SURFACE-AT ?auto_23802 ?auto_23808 ) ( ON ?auto_23802 ?auto_23817 ) ( CLEAR ?auto_23802 ) ( not ( = ?auto_23804 ?auto_23817 ) ) ( not ( = ?auto_23805 ?auto_23817 ) ) ( not ( = ?auto_23803 ?auto_23817 ) ) ( not ( = ?auto_23807 ?auto_23817 ) ) ( not ( = ?auto_23811 ?auto_23817 ) ) ( not ( = ?auto_23802 ?auto_23817 ) ) ( not ( = ?auto_23806 ?auto_23817 ) ) ( not ( = ?auto_23801 ?auto_23817 ) ) ( SURFACE-AT ?auto_23800 ?auto_23814 ) ( CLEAR ?auto_23800 ) ( IS-CRATE ?auto_23801 ) ( not ( = ?auto_23800 ?auto_23801 ) ) ( not ( = ?auto_23804 ?auto_23800 ) ) ( not ( = ?auto_23805 ?auto_23800 ) ) ( not ( = ?auto_23803 ?auto_23800 ) ) ( not ( = ?auto_23807 ?auto_23800 ) ) ( not ( = ?auto_23811 ?auto_23800 ) ) ( not ( = ?auto_23802 ?auto_23800 ) ) ( not ( = ?auto_23806 ?auto_23800 ) ) ( not ( = ?auto_23817 ?auto_23800 ) ) ( AVAILABLE ?auto_23810 ) ( TRUCK-AT ?auto_23819 ?auto_23812 ) ( AVAILABLE ?auto_23815 ) ( SURFACE-AT ?auto_23801 ?auto_23812 ) ( ON ?auto_23801 ?auto_23816 ) ( CLEAR ?auto_23801 ) ( not ( = ?auto_23804 ?auto_23816 ) ) ( not ( = ?auto_23805 ?auto_23816 ) ) ( not ( = ?auto_23803 ?auto_23816 ) ) ( not ( = ?auto_23807 ?auto_23816 ) ) ( not ( = ?auto_23811 ?auto_23816 ) ) ( not ( = ?auto_23802 ?auto_23816 ) ) ( not ( = ?auto_23806 ?auto_23816 ) ) ( not ( = ?auto_23801 ?auto_23816 ) ) ( not ( = ?auto_23817 ?auto_23816 ) ) ( not ( = ?auto_23800 ?auto_23816 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23803 ?auto_23804 ?auto_23805 )
      ( MAKE-5CRATE-VERIFY ?auto_23800 ?auto_23801 ?auto_23802 ?auto_23803 ?auto_23804 ?auto_23805 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23820 - SURFACE
      ?auto_23821 - SURFACE
    )
    :vars
    (
      ?auto_23828 - HOIST
      ?auto_23833 - PLACE
      ?auto_23832 - SURFACE
      ?auto_23830 - PLACE
      ?auto_23834 - HOIST
      ?auto_23823 - SURFACE
      ?auto_23825 - PLACE
      ?auto_23831 - HOIST
      ?auto_23829 - SURFACE
      ?auto_23824 - SURFACE
      ?auto_23837 - PLACE
      ?auto_23827 - HOIST
      ?auto_23822 - SURFACE
      ?auto_23838 - SURFACE
      ?auto_23836 - SURFACE
      ?auto_23826 - SURFACE
      ?auto_23835 - SURFACE
      ?auto_23839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23828 ?auto_23833 ) ( IS-CRATE ?auto_23821 ) ( not ( = ?auto_23820 ?auto_23821 ) ) ( not ( = ?auto_23832 ?auto_23820 ) ) ( not ( = ?auto_23832 ?auto_23821 ) ) ( not ( = ?auto_23830 ?auto_23833 ) ) ( HOIST-AT ?auto_23834 ?auto_23830 ) ( not ( = ?auto_23828 ?auto_23834 ) ) ( SURFACE-AT ?auto_23821 ?auto_23830 ) ( ON ?auto_23821 ?auto_23823 ) ( CLEAR ?auto_23821 ) ( not ( = ?auto_23820 ?auto_23823 ) ) ( not ( = ?auto_23821 ?auto_23823 ) ) ( not ( = ?auto_23832 ?auto_23823 ) ) ( IS-CRATE ?auto_23820 ) ( not ( = ?auto_23825 ?auto_23833 ) ) ( not ( = ?auto_23830 ?auto_23825 ) ) ( HOIST-AT ?auto_23831 ?auto_23825 ) ( not ( = ?auto_23828 ?auto_23831 ) ) ( not ( = ?auto_23834 ?auto_23831 ) ) ( SURFACE-AT ?auto_23820 ?auto_23825 ) ( ON ?auto_23820 ?auto_23829 ) ( CLEAR ?auto_23820 ) ( not ( = ?auto_23820 ?auto_23829 ) ) ( not ( = ?auto_23821 ?auto_23829 ) ) ( not ( = ?auto_23832 ?auto_23829 ) ) ( not ( = ?auto_23823 ?auto_23829 ) ) ( IS-CRATE ?auto_23832 ) ( not ( = ?auto_23824 ?auto_23832 ) ) ( not ( = ?auto_23820 ?auto_23824 ) ) ( not ( = ?auto_23821 ?auto_23824 ) ) ( not ( = ?auto_23823 ?auto_23824 ) ) ( not ( = ?auto_23829 ?auto_23824 ) ) ( not ( = ?auto_23837 ?auto_23833 ) ) ( not ( = ?auto_23830 ?auto_23837 ) ) ( not ( = ?auto_23825 ?auto_23837 ) ) ( HOIST-AT ?auto_23827 ?auto_23837 ) ( not ( = ?auto_23828 ?auto_23827 ) ) ( not ( = ?auto_23834 ?auto_23827 ) ) ( not ( = ?auto_23831 ?auto_23827 ) ) ( AVAILABLE ?auto_23827 ) ( SURFACE-AT ?auto_23832 ?auto_23837 ) ( ON ?auto_23832 ?auto_23822 ) ( CLEAR ?auto_23832 ) ( not ( = ?auto_23820 ?auto_23822 ) ) ( not ( = ?auto_23821 ?auto_23822 ) ) ( not ( = ?auto_23832 ?auto_23822 ) ) ( not ( = ?auto_23823 ?auto_23822 ) ) ( not ( = ?auto_23829 ?auto_23822 ) ) ( not ( = ?auto_23824 ?auto_23822 ) ) ( IS-CRATE ?auto_23824 ) ( not ( = ?auto_23838 ?auto_23824 ) ) ( not ( = ?auto_23820 ?auto_23838 ) ) ( not ( = ?auto_23821 ?auto_23838 ) ) ( not ( = ?auto_23832 ?auto_23838 ) ) ( not ( = ?auto_23823 ?auto_23838 ) ) ( not ( = ?auto_23829 ?auto_23838 ) ) ( not ( = ?auto_23822 ?auto_23838 ) ) ( AVAILABLE ?auto_23831 ) ( SURFACE-AT ?auto_23824 ?auto_23825 ) ( ON ?auto_23824 ?auto_23836 ) ( CLEAR ?auto_23824 ) ( not ( = ?auto_23820 ?auto_23836 ) ) ( not ( = ?auto_23821 ?auto_23836 ) ) ( not ( = ?auto_23832 ?auto_23836 ) ) ( not ( = ?auto_23823 ?auto_23836 ) ) ( not ( = ?auto_23829 ?auto_23836 ) ) ( not ( = ?auto_23824 ?auto_23836 ) ) ( not ( = ?auto_23822 ?auto_23836 ) ) ( not ( = ?auto_23838 ?auto_23836 ) ) ( SURFACE-AT ?auto_23826 ?auto_23833 ) ( CLEAR ?auto_23826 ) ( IS-CRATE ?auto_23838 ) ( not ( = ?auto_23826 ?auto_23838 ) ) ( not ( = ?auto_23820 ?auto_23826 ) ) ( not ( = ?auto_23821 ?auto_23826 ) ) ( not ( = ?auto_23832 ?auto_23826 ) ) ( not ( = ?auto_23823 ?auto_23826 ) ) ( not ( = ?auto_23829 ?auto_23826 ) ) ( not ( = ?auto_23824 ?auto_23826 ) ) ( not ( = ?auto_23822 ?auto_23826 ) ) ( not ( = ?auto_23836 ?auto_23826 ) ) ( AVAILABLE ?auto_23828 ) ( AVAILABLE ?auto_23834 ) ( SURFACE-AT ?auto_23838 ?auto_23830 ) ( ON ?auto_23838 ?auto_23835 ) ( CLEAR ?auto_23838 ) ( not ( = ?auto_23820 ?auto_23835 ) ) ( not ( = ?auto_23821 ?auto_23835 ) ) ( not ( = ?auto_23832 ?auto_23835 ) ) ( not ( = ?auto_23823 ?auto_23835 ) ) ( not ( = ?auto_23829 ?auto_23835 ) ) ( not ( = ?auto_23824 ?auto_23835 ) ) ( not ( = ?auto_23822 ?auto_23835 ) ) ( not ( = ?auto_23838 ?auto_23835 ) ) ( not ( = ?auto_23836 ?auto_23835 ) ) ( not ( = ?auto_23826 ?auto_23835 ) ) ( TRUCK-AT ?auto_23839 ?auto_23833 ) )
    :subtasks
    ( ( !DRIVE ?auto_23839 ?auto_23833 ?auto_23830 )
      ( MAKE-2CRATE ?auto_23832 ?auto_23820 ?auto_23821 )
      ( MAKE-1CRATE-VERIFY ?auto_23820 ?auto_23821 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23840 - SURFACE
      ?auto_23841 - SURFACE
      ?auto_23842 - SURFACE
    )
    :vars
    (
      ?auto_23852 - HOIST
      ?auto_23859 - PLACE
      ?auto_23853 - PLACE
      ?auto_23854 - HOIST
      ?auto_23855 - SURFACE
      ?auto_23843 - PLACE
      ?auto_23847 - HOIST
      ?auto_23851 - SURFACE
      ?auto_23844 - SURFACE
      ?auto_23849 - PLACE
      ?auto_23848 - HOIST
      ?auto_23856 - SURFACE
      ?auto_23857 - SURFACE
      ?auto_23858 - SURFACE
      ?auto_23850 - SURFACE
      ?auto_23845 - SURFACE
      ?auto_23846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23852 ?auto_23859 ) ( IS-CRATE ?auto_23842 ) ( not ( = ?auto_23841 ?auto_23842 ) ) ( not ( = ?auto_23840 ?auto_23841 ) ) ( not ( = ?auto_23840 ?auto_23842 ) ) ( not ( = ?auto_23853 ?auto_23859 ) ) ( HOIST-AT ?auto_23854 ?auto_23853 ) ( not ( = ?auto_23852 ?auto_23854 ) ) ( SURFACE-AT ?auto_23842 ?auto_23853 ) ( ON ?auto_23842 ?auto_23855 ) ( CLEAR ?auto_23842 ) ( not ( = ?auto_23841 ?auto_23855 ) ) ( not ( = ?auto_23842 ?auto_23855 ) ) ( not ( = ?auto_23840 ?auto_23855 ) ) ( IS-CRATE ?auto_23841 ) ( not ( = ?auto_23843 ?auto_23859 ) ) ( not ( = ?auto_23853 ?auto_23843 ) ) ( HOIST-AT ?auto_23847 ?auto_23843 ) ( not ( = ?auto_23852 ?auto_23847 ) ) ( not ( = ?auto_23854 ?auto_23847 ) ) ( SURFACE-AT ?auto_23841 ?auto_23843 ) ( ON ?auto_23841 ?auto_23851 ) ( CLEAR ?auto_23841 ) ( not ( = ?auto_23841 ?auto_23851 ) ) ( not ( = ?auto_23842 ?auto_23851 ) ) ( not ( = ?auto_23840 ?auto_23851 ) ) ( not ( = ?auto_23855 ?auto_23851 ) ) ( IS-CRATE ?auto_23840 ) ( not ( = ?auto_23844 ?auto_23840 ) ) ( not ( = ?auto_23841 ?auto_23844 ) ) ( not ( = ?auto_23842 ?auto_23844 ) ) ( not ( = ?auto_23855 ?auto_23844 ) ) ( not ( = ?auto_23851 ?auto_23844 ) ) ( not ( = ?auto_23849 ?auto_23859 ) ) ( not ( = ?auto_23853 ?auto_23849 ) ) ( not ( = ?auto_23843 ?auto_23849 ) ) ( HOIST-AT ?auto_23848 ?auto_23849 ) ( not ( = ?auto_23852 ?auto_23848 ) ) ( not ( = ?auto_23854 ?auto_23848 ) ) ( not ( = ?auto_23847 ?auto_23848 ) ) ( AVAILABLE ?auto_23848 ) ( SURFACE-AT ?auto_23840 ?auto_23849 ) ( ON ?auto_23840 ?auto_23856 ) ( CLEAR ?auto_23840 ) ( not ( = ?auto_23841 ?auto_23856 ) ) ( not ( = ?auto_23842 ?auto_23856 ) ) ( not ( = ?auto_23840 ?auto_23856 ) ) ( not ( = ?auto_23855 ?auto_23856 ) ) ( not ( = ?auto_23851 ?auto_23856 ) ) ( not ( = ?auto_23844 ?auto_23856 ) ) ( IS-CRATE ?auto_23844 ) ( not ( = ?auto_23857 ?auto_23844 ) ) ( not ( = ?auto_23841 ?auto_23857 ) ) ( not ( = ?auto_23842 ?auto_23857 ) ) ( not ( = ?auto_23840 ?auto_23857 ) ) ( not ( = ?auto_23855 ?auto_23857 ) ) ( not ( = ?auto_23851 ?auto_23857 ) ) ( not ( = ?auto_23856 ?auto_23857 ) ) ( AVAILABLE ?auto_23847 ) ( SURFACE-AT ?auto_23844 ?auto_23843 ) ( ON ?auto_23844 ?auto_23858 ) ( CLEAR ?auto_23844 ) ( not ( = ?auto_23841 ?auto_23858 ) ) ( not ( = ?auto_23842 ?auto_23858 ) ) ( not ( = ?auto_23840 ?auto_23858 ) ) ( not ( = ?auto_23855 ?auto_23858 ) ) ( not ( = ?auto_23851 ?auto_23858 ) ) ( not ( = ?auto_23844 ?auto_23858 ) ) ( not ( = ?auto_23856 ?auto_23858 ) ) ( not ( = ?auto_23857 ?auto_23858 ) ) ( SURFACE-AT ?auto_23850 ?auto_23859 ) ( CLEAR ?auto_23850 ) ( IS-CRATE ?auto_23857 ) ( not ( = ?auto_23850 ?auto_23857 ) ) ( not ( = ?auto_23841 ?auto_23850 ) ) ( not ( = ?auto_23842 ?auto_23850 ) ) ( not ( = ?auto_23840 ?auto_23850 ) ) ( not ( = ?auto_23855 ?auto_23850 ) ) ( not ( = ?auto_23851 ?auto_23850 ) ) ( not ( = ?auto_23844 ?auto_23850 ) ) ( not ( = ?auto_23856 ?auto_23850 ) ) ( not ( = ?auto_23858 ?auto_23850 ) ) ( AVAILABLE ?auto_23852 ) ( AVAILABLE ?auto_23854 ) ( SURFACE-AT ?auto_23857 ?auto_23853 ) ( ON ?auto_23857 ?auto_23845 ) ( CLEAR ?auto_23857 ) ( not ( = ?auto_23841 ?auto_23845 ) ) ( not ( = ?auto_23842 ?auto_23845 ) ) ( not ( = ?auto_23840 ?auto_23845 ) ) ( not ( = ?auto_23855 ?auto_23845 ) ) ( not ( = ?auto_23851 ?auto_23845 ) ) ( not ( = ?auto_23844 ?auto_23845 ) ) ( not ( = ?auto_23856 ?auto_23845 ) ) ( not ( = ?auto_23857 ?auto_23845 ) ) ( not ( = ?auto_23858 ?auto_23845 ) ) ( not ( = ?auto_23850 ?auto_23845 ) ) ( TRUCK-AT ?auto_23846 ?auto_23859 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23841 ?auto_23842 )
      ( MAKE-2CRATE-VERIFY ?auto_23840 ?auto_23841 ?auto_23842 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23860 - SURFACE
      ?auto_23861 - SURFACE
      ?auto_23862 - SURFACE
      ?auto_23863 - SURFACE
    )
    :vars
    (
      ?auto_23873 - HOIST
      ?auto_23878 - PLACE
      ?auto_23871 - PLACE
      ?auto_23870 - HOIST
      ?auto_23864 - SURFACE
      ?auto_23872 - PLACE
      ?auto_23874 - HOIST
      ?auto_23875 - SURFACE
      ?auto_23868 - PLACE
      ?auto_23867 - HOIST
      ?auto_23869 - SURFACE
      ?auto_23865 - SURFACE
      ?auto_23877 - SURFACE
      ?auto_23866 - SURFACE
      ?auto_23876 - SURFACE
      ?auto_23879 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23873 ?auto_23878 ) ( IS-CRATE ?auto_23863 ) ( not ( = ?auto_23862 ?auto_23863 ) ) ( not ( = ?auto_23861 ?auto_23862 ) ) ( not ( = ?auto_23861 ?auto_23863 ) ) ( not ( = ?auto_23871 ?auto_23878 ) ) ( HOIST-AT ?auto_23870 ?auto_23871 ) ( not ( = ?auto_23873 ?auto_23870 ) ) ( SURFACE-AT ?auto_23863 ?auto_23871 ) ( ON ?auto_23863 ?auto_23864 ) ( CLEAR ?auto_23863 ) ( not ( = ?auto_23862 ?auto_23864 ) ) ( not ( = ?auto_23863 ?auto_23864 ) ) ( not ( = ?auto_23861 ?auto_23864 ) ) ( IS-CRATE ?auto_23862 ) ( not ( = ?auto_23872 ?auto_23878 ) ) ( not ( = ?auto_23871 ?auto_23872 ) ) ( HOIST-AT ?auto_23874 ?auto_23872 ) ( not ( = ?auto_23873 ?auto_23874 ) ) ( not ( = ?auto_23870 ?auto_23874 ) ) ( SURFACE-AT ?auto_23862 ?auto_23872 ) ( ON ?auto_23862 ?auto_23875 ) ( CLEAR ?auto_23862 ) ( not ( = ?auto_23862 ?auto_23875 ) ) ( not ( = ?auto_23863 ?auto_23875 ) ) ( not ( = ?auto_23861 ?auto_23875 ) ) ( not ( = ?auto_23864 ?auto_23875 ) ) ( IS-CRATE ?auto_23861 ) ( not ( = ?auto_23860 ?auto_23861 ) ) ( not ( = ?auto_23862 ?auto_23860 ) ) ( not ( = ?auto_23863 ?auto_23860 ) ) ( not ( = ?auto_23864 ?auto_23860 ) ) ( not ( = ?auto_23875 ?auto_23860 ) ) ( not ( = ?auto_23868 ?auto_23878 ) ) ( not ( = ?auto_23871 ?auto_23868 ) ) ( not ( = ?auto_23872 ?auto_23868 ) ) ( HOIST-AT ?auto_23867 ?auto_23868 ) ( not ( = ?auto_23873 ?auto_23867 ) ) ( not ( = ?auto_23870 ?auto_23867 ) ) ( not ( = ?auto_23874 ?auto_23867 ) ) ( AVAILABLE ?auto_23867 ) ( SURFACE-AT ?auto_23861 ?auto_23868 ) ( ON ?auto_23861 ?auto_23869 ) ( CLEAR ?auto_23861 ) ( not ( = ?auto_23862 ?auto_23869 ) ) ( not ( = ?auto_23863 ?auto_23869 ) ) ( not ( = ?auto_23861 ?auto_23869 ) ) ( not ( = ?auto_23864 ?auto_23869 ) ) ( not ( = ?auto_23875 ?auto_23869 ) ) ( not ( = ?auto_23860 ?auto_23869 ) ) ( IS-CRATE ?auto_23860 ) ( not ( = ?auto_23865 ?auto_23860 ) ) ( not ( = ?auto_23862 ?auto_23865 ) ) ( not ( = ?auto_23863 ?auto_23865 ) ) ( not ( = ?auto_23861 ?auto_23865 ) ) ( not ( = ?auto_23864 ?auto_23865 ) ) ( not ( = ?auto_23875 ?auto_23865 ) ) ( not ( = ?auto_23869 ?auto_23865 ) ) ( AVAILABLE ?auto_23874 ) ( SURFACE-AT ?auto_23860 ?auto_23872 ) ( ON ?auto_23860 ?auto_23877 ) ( CLEAR ?auto_23860 ) ( not ( = ?auto_23862 ?auto_23877 ) ) ( not ( = ?auto_23863 ?auto_23877 ) ) ( not ( = ?auto_23861 ?auto_23877 ) ) ( not ( = ?auto_23864 ?auto_23877 ) ) ( not ( = ?auto_23875 ?auto_23877 ) ) ( not ( = ?auto_23860 ?auto_23877 ) ) ( not ( = ?auto_23869 ?auto_23877 ) ) ( not ( = ?auto_23865 ?auto_23877 ) ) ( SURFACE-AT ?auto_23866 ?auto_23878 ) ( CLEAR ?auto_23866 ) ( IS-CRATE ?auto_23865 ) ( not ( = ?auto_23866 ?auto_23865 ) ) ( not ( = ?auto_23862 ?auto_23866 ) ) ( not ( = ?auto_23863 ?auto_23866 ) ) ( not ( = ?auto_23861 ?auto_23866 ) ) ( not ( = ?auto_23864 ?auto_23866 ) ) ( not ( = ?auto_23875 ?auto_23866 ) ) ( not ( = ?auto_23860 ?auto_23866 ) ) ( not ( = ?auto_23869 ?auto_23866 ) ) ( not ( = ?auto_23877 ?auto_23866 ) ) ( AVAILABLE ?auto_23873 ) ( AVAILABLE ?auto_23870 ) ( SURFACE-AT ?auto_23865 ?auto_23871 ) ( ON ?auto_23865 ?auto_23876 ) ( CLEAR ?auto_23865 ) ( not ( = ?auto_23862 ?auto_23876 ) ) ( not ( = ?auto_23863 ?auto_23876 ) ) ( not ( = ?auto_23861 ?auto_23876 ) ) ( not ( = ?auto_23864 ?auto_23876 ) ) ( not ( = ?auto_23875 ?auto_23876 ) ) ( not ( = ?auto_23860 ?auto_23876 ) ) ( not ( = ?auto_23869 ?auto_23876 ) ) ( not ( = ?auto_23865 ?auto_23876 ) ) ( not ( = ?auto_23877 ?auto_23876 ) ) ( not ( = ?auto_23866 ?auto_23876 ) ) ( TRUCK-AT ?auto_23879 ?auto_23878 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23861 ?auto_23862 ?auto_23863 )
      ( MAKE-3CRATE-VERIFY ?auto_23860 ?auto_23861 ?auto_23862 ?auto_23863 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23880 - SURFACE
      ?auto_23881 - SURFACE
      ?auto_23882 - SURFACE
      ?auto_23883 - SURFACE
      ?auto_23884 - SURFACE
    )
    :vars
    (
      ?auto_23893 - HOIST
      ?auto_23898 - PLACE
      ?auto_23891 - PLACE
      ?auto_23890 - HOIST
      ?auto_23885 - SURFACE
      ?auto_23892 - PLACE
      ?auto_23894 - HOIST
      ?auto_23895 - SURFACE
      ?auto_23888 - PLACE
      ?auto_23887 - HOIST
      ?auto_23889 - SURFACE
      ?auto_23897 - SURFACE
      ?auto_23886 - SURFACE
      ?auto_23896 - SURFACE
      ?auto_23899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23893 ?auto_23898 ) ( IS-CRATE ?auto_23884 ) ( not ( = ?auto_23883 ?auto_23884 ) ) ( not ( = ?auto_23882 ?auto_23883 ) ) ( not ( = ?auto_23882 ?auto_23884 ) ) ( not ( = ?auto_23891 ?auto_23898 ) ) ( HOIST-AT ?auto_23890 ?auto_23891 ) ( not ( = ?auto_23893 ?auto_23890 ) ) ( SURFACE-AT ?auto_23884 ?auto_23891 ) ( ON ?auto_23884 ?auto_23885 ) ( CLEAR ?auto_23884 ) ( not ( = ?auto_23883 ?auto_23885 ) ) ( not ( = ?auto_23884 ?auto_23885 ) ) ( not ( = ?auto_23882 ?auto_23885 ) ) ( IS-CRATE ?auto_23883 ) ( not ( = ?auto_23892 ?auto_23898 ) ) ( not ( = ?auto_23891 ?auto_23892 ) ) ( HOIST-AT ?auto_23894 ?auto_23892 ) ( not ( = ?auto_23893 ?auto_23894 ) ) ( not ( = ?auto_23890 ?auto_23894 ) ) ( SURFACE-AT ?auto_23883 ?auto_23892 ) ( ON ?auto_23883 ?auto_23895 ) ( CLEAR ?auto_23883 ) ( not ( = ?auto_23883 ?auto_23895 ) ) ( not ( = ?auto_23884 ?auto_23895 ) ) ( not ( = ?auto_23882 ?auto_23895 ) ) ( not ( = ?auto_23885 ?auto_23895 ) ) ( IS-CRATE ?auto_23882 ) ( not ( = ?auto_23881 ?auto_23882 ) ) ( not ( = ?auto_23883 ?auto_23881 ) ) ( not ( = ?auto_23884 ?auto_23881 ) ) ( not ( = ?auto_23885 ?auto_23881 ) ) ( not ( = ?auto_23895 ?auto_23881 ) ) ( not ( = ?auto_23888 ?auto_23898 ) ) ( not ( = ?auto_23891 ?auto_23888 ) ) ( not ( = ?auto_23892 ?auto_23888 ) ) ( HOIST-AT ?auto_23887 ?auto_23888 ) ( not ( = ?auto_23893 ?auto_23887 ) ) ( not ( = ?auto_23890 ?auto_23887 ) ) ( not ( = ?auto_23894 ?auto_23887 ) ) ( AVAILABLE ?auto_23887 ) ( SURFACE-AT ?auto_23882 ?auto_23888 ) ( ON ?auto_23882 ?auto_23889 ) ( CLEAR ?auto_23882 ) ( not ( = ?auto_23883 ?auto_23889 ) ) ( not ( = ?auto_23884 ?auto_23889 ) ) ( not ( = ?auto_23882 ?auto_23889 ) ) ( not ( = ?auto_23885 ?auto_23889 ) ) ( not ( = ?auto_23895 ?auto_23889 ) ) ( not ( = ?auto_23881 ?auto_23889 ) ) ( IS-CRATE ?auto_23881 ) ( not ( = ?auto_23880 ?auto_23881 ) ) ( not ( = ?auto_23883 ?auto_23880 ) ) ( not ( = ?auto_23884 ?auto_23880 ) ) ( not ( = ?auto_23882 ?auto_23880 ) ) ( not ( = ?auto_23885 ?auto_23880 ) ) ( not ( = ?auto_23895 ?auto_23880 ) ) ( not ( = ?auto_23889 ?auto_23880 ) ) ( AVAILABLE ?auto_23894 ) ( SURFACE-AT ?auto_23881 ?auto_23892 ) ( ON ?auto_23881 ?auto_23897 ) ( CLEAR ?auto_23881 ) ( not ( = ?auto_23883 ?auto_23897 ) ) ( not ( = ?auto_23884 ?auto_23897 ) ) ( not ( = ?auto_23882 ?auto_23897 ) ) ( not ( = ?auto_23885 ?auto_23897 ) ) ( not ( = ?auto_23895 ?auto_23897 ) ) ( not ( = ?auto_23881 ?auto_23897 ) ) ( not ( = ?auto_23889 ?auto_23897 ) ) ( not ( = ?auto_23880 ?auto_23897 ) ) ( SURFACE-AT ?auto_23886 ?auto_23898 ) ( CLEAR ?auto_23886 ) ( IS-CRATE ?auto_23880 ) ( not ( = ?auto_23886 ?auto_23880 ) ) ( not ( = ?auto_23883 ?auto_23886 ) ) ( not ( = ?auto_23884 ?auto_23886 ) ) ( not ( = ?auto_23882 ?auto_23886 ) ) ( not ( = ?auto_23885 ?auto_23886 ) ) ( not ( = ?auto_23895 ?auto_23886 ) ) ( not ( = ?auto_23881 ?auto_23886 ) ) ( not ( = ?auto_23889 ?auto_23886 ) ) ( not ( = ?auto_23897 ?auto_23886 ) ) ( AVAILABLE ?auto_23893 ) ( AVAILABLE ?auto_23890 ) ( SURFACE-AT ?auto_23880 ?auto_23891 ) ( ON ?auto_23880 ?auto_23896 ) ( CLEAR ?auto_23880 ) ( not ( = ?auto_23883 ?auto_23896 ) ) ( not ( = ?auto_23884 ?auto_23896 ) ) ( not ( = ?auto_23882 ?auto_23896 ) ) ( not ( = ?auto_23885 ?auto_23896 ) ) ( not ( = ?auto_23895 ?auto_23896 ) ) ( not ( = ?auto_23881 ?auto_23896 ) ) ( not ( = ?auto_23889 ?auto_23896 ) ) ( not ( = ?auto_23880 ?auto_23896 ) ) ( not ( = ?auto_23897 ?auto_23896 ) ) ( not ( = ?auto_23886 ?auto_23896 ) ) ( TRUCK-AT ?auto_23899 ?auto_23898 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23882 ?auto_23883 ?auto_23884 )
      ( MAKE-4CRATE-VERIFY ?auto_23880 ?auto_23881 ?auto_23882 ?auto_23883 ?auto_23884 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23900 - SURFACE
      ?auto_23901 - SURFACE
      ?auto_23902 - SURFACE
      ?auto_23903 - SURFACE
      ?auto_23904 - SURFACE
      ?auto_23905 - SURFACE
    )
    :vars
    (
      ?auto_23913 - HOIST
      ?auto_23918 - PLACE
      ?auto_23911 - PLACE
      ?auto_23910 - HOIST
      ?auto_23906 - SURFACE
      ?auto_23912 - PLACE
      ?auto_23914 - HOIST
      ?auto_23915 - SURFACE
      ?auto_23908 - PLACE
      ?auto_23907 - HOIST
      ?auto_23909 - SURFACE
      ?auto_23917 - SURFACE
      ?auto_23916 - SURFACE
      ?auto_23919 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23913 ?auto_23918 ) ( IS-CRATE ?auto_23905 ) ( not ( = ?auto_23904 ?auto_23905 ) ) ( not ( = ?auto_23903 ?auto_23904 ) ) ( not ( = ?auto_23903 ?auto_23905 ) ) ( not ( = ?auto_23911 ?auto_23918 ) ) ( HOIST-AT ?auto_23910 ?auto_23911 ) ( not ( = ?auto_23913 ?auto_23910 ) ) ( SURFACE-AT ?auto_23905 ?auto_23911 ) ( ON ?auto_23905 ?auto_23906 ) ( CLEAR ?auto_23905 ) ( not ( = ?auto_23904 ?auto_23906 ) ) ( not ( = ?auto_23905 ?auto_23906 ) ) ( not ( = ?auto_23903 ?auto_23906 ) ) ( IS-CRATE ?auto_23904 ) ( not ( = ?auto_23912 ?auto_23918 ) ) ( not ( = ?auto_23911 ?auto_23912 ) ) ( HOIST-AT ?auto_23914 ?auto_23912 ) ( not ( = ?auto_23913 ?auto_23914 ) ) ( not ( = ?auto_23910 ?auto_23914 ) ) ( SURFACE-AT ?auto_23904 ?auto_23912 ) ( ON ?auto_23904 ?auto_23915 ) ( CLEAR ?auto_23904 ) ( not ( = ?auto_23904 ?auto_23915 ) ) ( not ( = ?auto_23905 ?auto_23915 ) ) ( not ( = ?auto_23903 ?auto_23915 ) ) ( not ( = ?auto_23906 ?auto_23915 ) ) ( IS-CRATE ?auto_23903 ) ( not ( = ?auto_23902 ?auto_23903 ) ) ( not ( = ?auto_23904 ?auto_23902 ) ) ( not ( = ?auto_23905 ?auto_23902 ) ) ( not ( = ?auto_23906 ?auto_23902 ) ) ( not ( = ?auto_23915 ?auto_23902 ) ) ( not ( = ?auto_23908 ?auto_23918 ) ) ( not ( = ?auto_23911 ?auto_23908 ) ) ( not ( = ?auto_23912 ?auto_23908 ) ) ( HOIST-AT ?auto_23907 ?auto_23908 ) ( not ( = ?auto_23913 ?auto_23907 ) ) ( not ( = ?auto_23910 ?auto_23907 ) ) ( not ( = ?auto_23914 ?auto_23907 ) ) ( AVAILABLE ?auto_23907 ) ( SURFACE-AT ?auto_23903 ?auto_23908 ) ( ON ?auto_23903 ?auto_23909 ) ( CLEAR ?auto_23903 ) ( not ( = ?auto_23904 ?auto_23909 ) ) ( not ( = ?auto_23905 ?auto_23909 ) ) ( not ( = ?auto_23903 ?auto_23909 ) ) ( not ( = ?auto_23906 ?auto_23909 ) ) ( not ( = ?auto_23915 ?auto_23909 ) ) ( not ( = ?auto_23902 ?auto_23909 ) ) ( IS-CRATE ?auto_23902 ) ( not ( = ?auto_23901 ?auto_23902 ) ) ( not ( = ?auto_23904 ?auto_23901 ) ) ( not ( = ?auto_23905 ?auto_23901 ) ) ( not ( = ?auto_23903 ?auto_23901 ) ) ( not ( = ?auto_23906 ?auto_23901 ) ) ( not ( = ?auto_23915 ?auto_23901 ) ) ( not ( = ?auto_23909 ?auto_23901 ) ) ( AVAILABLE ?auto_23914 ) ( SURFACE-AT ?auto_23902 ?auto_23912 ) ( ON ?auto_23902 ?auto_23917 ) ( CLEAR ?auto_23902 ) ( not ( = ?auto_23904 ?auto_23917 ) ) ( not ( = ?auto_23905 ?auto_23917 ) ) ( not ( = ?auto_23903 ?auto_23917 ) ) ( not ( = ?auto_23906 ?auto_23917 ) ) ( not ( = ?auto_23915 ?auto_23917 ) ) ( not ( = ?auto_23902 ?auto_23917 ) ) ( not ( = ?auto_23909 ?auto_23917 ) ) ( not ( = ?auto_23901 ?auto_23917 ) ) ( SURFACE-AT ?auto_23900 ?auto_23918 ) ( CLEAR ?auto_23900 ) ( IS-CRATE ?auto_23901 ) ( not ( = ?auto_23900 ?auto_23901 ) ) ( not ( = ?auto_23904 ?auto_23900 ) ) ( not ( = ?auto_23905 ?auto_23900 ) ) ( not ( = ?auto_23903 ?auto_23900 ) ) ( not ( = ?auto_23906 ?auto_23900 ) ) ( not ( = ?auto_23915 ?auto_23900 ) ) ( not ( = ?auto_23902 ?auto_23900 ) ) ( not ( = ?auto_23909 ?auto_23900 ) ) ( not ( = ?auto_23917 ?auto_23900 ) ) ( AVAILABLE ?auto_23913 ) ( AVAILABLE ?auto_23910 ) ( SURFACE-AT ?auto_23901 ?auto_23911 ) ( ON ?auto_23901 ?auto_23916 ) ( CLEAR ?auto_23901 ) ( not ( = ?auto_23904 ?auto_23916 ) ) ( not ( = ?auto_23905 ?auto_23916 ) ) ( not ( = ?auto_23903 ?auto_23916 ) ) ( not ( = ?auto_23906 ?auto_23916 ) ) ( not ( = ?auto_23915 ?auto_23916 ) ) ( not ( = ?auto_23902 ?auto_23916 ) ) ( not ( = ?auto_23909 ?auto_23916 ) ) ( not ( = ?auto_23901 ?auto_23916 ) ) ( not ( = ?auto_23917 ?auto_23916 ) ) ( not ( = ?auto_23900 ?auto_23916 ) ) ( TRUCK-AT ?auto_23919 ?auto_23918 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23903 ?auto_23904 ?auto_23905 )
      ( MAKE-5CRATE-VERIFY ?auto_23900 ?auto_23901 ?auto_23902 ?auto_23903 ?auto_23904 ?auto_23905 ) )
  )

)

