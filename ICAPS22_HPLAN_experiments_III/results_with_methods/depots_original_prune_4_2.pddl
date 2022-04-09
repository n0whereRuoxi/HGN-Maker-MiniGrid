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
      ?auto_7734 - SURFACE
      ?auto_7735 - SURFACE
    )
    :vars
    (
      ?auto_7736 - HOIST
      ?auto_7737 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7736 ?auto_7737 ) ( SURFACE-AT ?auto_7734 ?auto_7737 ) ( CLEAR ?auto_7734 ) ( LIFTING ?auto_7736 ?auto_7735 ) ( IS-CRATE ?auto_7735 ) ( not ( = ?auto_7734 ?auto_7735 ) ) )
    :subtasks
    ( ( !DROP ?auto_7736 ?auto_7735 ?auto_7734 ?auto_7737 )
      ( MAKE-1CRATE-VERIFY ?auto_7734 ?auto_7735 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7738 - SURFACE
      ?auto_7739 - SURFACE
    )
    :vars
    (
      ?auto_7740 - HOIST
      ?auto_7741 - PLACE
      ?auto_7742 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7740 ?auto_7741 ) ( SURFACE-AT ?auto_7738 ?auto_7741 ) ( CLEAR ?auto_7738 ) ( IS-CRATE ?auto_7739 ) ( not ( = ?auto_7738 ?auto_7739 ) ) ( TRUCK-AT ?auto_7742 ?auto_7741 ) ( AVAILABLE ?auto_7740 ) ( IN ?auto_7739 ?auto_7742 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7740 ?auto_7739 ?auto_7742 ?auto_7741 )
      ( MAKE-1CRATE ?auto_7738 ?auto_7739 )
      ( MAKE-1CRATE-VERIFY ?auto_7738 ?auto_7739 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7743 - SURFACE
      ?auto_7744 - SURFACE
    )
    :vars
    (
      ?auto_7746 - HOIST
      ?auto_7745 - PLACE
      ?auto_7747 - TRUCK
      ?auto_7748 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7746 ?auto_7745 ) ( SURFACE-AT ?auto_7743 ?auto_7745 ) ( CLEAR ?auto_7743 ) ( IS-CRATE ?auto_7744 ) ( not ( = ?auto_7743 ?auto_7744 ) ) ( AVAILABLE ?auto_7746 ) ( IN ?auto_7744 ?auto_7747 ) ( TRUCK-AT ?auto_7747 ?auto_7748 ) ( not ( = ?auto_7748 ?auto_7745 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7747 ?auto_7748 ?auto_7745 )
      ( MAKE-1CRATE ?auto_7743 ?auto_7744 )
      ( MAKE-1CRATE-VERIFY ?auto_7743 ?auto_7744 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7749 - SURFACE
      ?auto_7750 - SURFACE
    )
    :vars
    (
      ?auto_7754 - HOIST
      ?auto_7751 - PLACE
      ?auto_7753 - TRUCK
      ?auto_7752 - PLACE
      ?auto_7755 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7754 ?auto_7751 ) ( SURFACE-AT ?auto_7749 ?auto_7751 ) ( CLEAR ?auto_7749 ) ( IS-CRATE ?auto_7750 ) ( not ( = ?auto_7749 ?auto_7750 ) ) ( AVAILABLE ?auto_7754 ) ( TRUCK-AT ?auto_7753 ?auto_7752 ) ( not ( = ?auto_7752 ?auto_7751 ) ) ( HOIST-AT ?auto_7755 ?auto_7752 ) ( LIFTING ?auto_7755 ?auto_7750 ) ( not ( = ?auto_7754 ?auto_7755 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7755 ?auto_7750 ?auto_7753 ?auto_7752 )
      ( MAKE-1CRATE ?auto_7749 ?auto_7750 )
      ( MAKE-1CRATE-VERIFY ?auto_7749 ?auto_7750 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7756 - SURFACE
      ?auto_7757 - SURFACE
    )
    :vars
    (
      ?auto_7759 - HOIST
      ?auto_7758 - PLACE
      ?auto_7761 - TRUCK
      ?auto_7760 - PLACE
      ?auto_7762 - HOIST
      ?auto_7763 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7759 ?auto_7758 ) ( SURFACE-AT ?auto_7756 ?auto_7758 ) ( CLEAR ?auto_7756 ) ( IS-CRATE ?auto_7757 ) ( not ( = ?auto_7756 ?auto_7757 ) ) ( AVAILABLE ?auto_7759 ) ( TRUCK-AT ?auto_7761 ?auto_7760 ) ( not ( = ?auto_7760 ?auto_7758 ) ) ( HOIST-AT ?auto_7762 ?auto_7760 ) ( not ( = ?auto_7759 ?auto_7762 ) ) ( AVAILABLE ?auto_7762 ) ( SURFACE-AT ?auto_7757 ?auto_7760 ) ( ON ?auto_7757 ?auto_7763 ) ( CLEAR ?auto_7757 ) ( not ( = ?auto_7756 ?auto_7763 ) ) ( not ( = ?auto_7757 ?auto_7763 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7762 ?auto_7757 ?auto_7763 ?auto_7760 )
      ( MAKE-1CRATE ?auto_7756 ?auto_7757 )
      ( MAKE-1CRATE-VERIFY ?auto_7756 ?auto_7757 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7764 - SURFACE
      ?auto_7765 - SURFACE
    )
    :vars
    (
      ?auto_7766 - HOIST
      ?auto_7769 - PLACE
      ?auto_7771 - PLACE
      ?auto_7767 - HOIST
      ?auto_7770 - SURFACE
      ?auto_7768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7766 ?auto_7769 ) ( SURFACE-AT ?auto_7764 ?auto_7769 ) ( CLEAR ?auto_7764 ) ( IS-CRATE ?auto_7765 ) ( not ( = ?auto_7764 ?auto_7765 ) ) ( AVAILABLE ?auto_7766 ) ( not ( = ?auto_7771 ?auto_7769 ) ) ( HOIST-AT ?auto_7767 ?auto_7771 ) ( not ( = ?auto_7766 ?auto_7767 ) ) ( AVAILABLE ?auto_7767 ) ( SURFACE-AT ?auto_7765 ?auto_7771 ) ( ON ?auto_7765 ?auto_7770 ) ( CLEAR ?auto_7765 ) ( not ( = ?auto_7764 ?auto_7770 ) ) ( not ( = ?auto_7765 ?auto_7770 ) ) ( TRUCK-AT ?auto_7768 ?auto_7769 ) )
    :subtasks
    ( ( !DRIVE ?auto_7768 ?auto_7769 ?auto_7771 )
      ( MAKE-1CRATE ?auto_7764 ?auto_7765 )
      ( MAKE-1CRATE-VERIFY ?auto_7764 ?auto_7765 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7781 - SURFACE
      ?auto_7782 - SURFACE
      ?auto_7783 - SURFACE
    )
    :vars
    (
      ?auto_7785 - HOIST
      ?auto_7784 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7785 ?auto_7784 ) ( SURFACE-AT ?auto_7782 ?auto_7784 ) ( CLEAR ?auto_7782 ) ( LIFTING ?auto_7785 ?auto_7783 ) ( IS-CRATE ?auto_7783 ) ( not ( = ?auto_7782 ?auto_7783 ) ) ( ON ?auto_7782 ?auto_7781 ) ( not ( = ?auto_7781 ?auto_7782 ) ) ( not ( = ?auto_7781 ?auto_7783 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7782 ?auto_7783 )
      ( MAKE-2CRATE-VERIFY ?auto_7781 ?auto_7782 ?auto_7783 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7791 - SURFACE
      ?auto_7792 - SURFACE
      ?auto_7793 - SURFACE
    )
    :vars
    (
      ?auto_7795 - HOIST
      ?auto_7796 - PLACE
      ?auto_7794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7795 ?auto_7796 ) ( SURFACE-AT ?auto_7792 ?auto_7796 ) ( CLEAR ?auto_7792 ) ( IS-CRATE ?auto_7793 ) ( not ( = ?auto_7792 ?auto_7793 ) ) ( TRUCK-AT ?auto_7794 ?auto_7796 ) ( AVAILABLE ?auto_7795 ) ( IN ?auto_7793 ?auto_7794 ) ( ON ?auto_7792 ?auto_7791 ) ( not ( = ?auto_7791 ?auto_7792 ) ) ( not ( = ?auto_7791 ?auto_7793 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7792 ?auto_7793 )
      ( MAKE-2CRATE-VERIFY ?auto_7791 ?auto_7792 ?auto_7793 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7797 - SURFACE
      ?auto_7798 - SURFACE
    )
    :vars
    (
      ?auto_7801 - HOIST
      ?auto_7799 - PLACE
      ?auto_7800 - TRUCK
      ?auto_7802 - SURFACE
      ?auto_7803 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7801 ?auto_7799 ) ( SURFACE-AT ?auto_7797 ?auto_7799 ) ( CLEAR ?auto_7797 ) ( IS-CRATE ?auto_7798 ) ( not ( = ?auto_7797 ?auto_7798 ) ) ( AVAILABLE ?auto_7801 ) ( IN ?auto_7798 ?auto_7800 ) ( ON ?auto_7797 ?auto_7802 ) ( not ( = ?auto_7802 ?auto_7797 ) ) ( not ( = ?auto_7802 ?auto_7798 ) ) ( TRUCK-AT ?auto_7800 ?auto_7803 ) ( not ( = ?auto_7803 ?auto_7799 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7800 ?auto_7803 ?auto_7799 )
      ( MAKE-2CRATE ?auto_7802 ?auto_7797 ?auto_7798 )
      ( MAKE-1CRATE-VERIFY ?auto_7797 ?auto_7798 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7804 - SURFACE
      ?auto_7805 - SURFACE
      ?auto_7806 - SURFACE
    )
    :vars
    (
      ?auto_7810 - HOIST
      ?auto_7808 - PLACE
      ?auto_7807 - TRUCK
      ?auto_7809 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7810 ?auto_7808 ) ( SURFACE-AT ?auto_7805 ?auto_7808 ) ( CLEAR ?auto_7805 ) ( IS-CRATE ?auto_7806 ) ( not ( = ?auto_7805 ?auto_7806 ) ) ( AVAILABLE ?auto_7810 ) ( IN ?auto_7806 ?auto_7807 ) ( ON ?auto_7805 ?auto_7804 ) ( not ( = ?auto_7804 ?auto_7805 ) ) ( not ( = ?auto_7804 ?auto_7806 ) ) ( TRUCK-AT ?auto_7807 ?auto_7809 ) ( not ( = ?auto_7809 ?auto_7808 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7805 ?auto_7806 )
      ( MAKE-2CRATE-VERIFY ?auto_7804 ?auto_7805 ?auto_7806 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7811 - SURFACE
      ?auto_7812 - SURFACE
    )
    :vars
    (
      ?auto_7814 - HOIST
      ?auto_7813 - PLACE
      ?auto_7816 - SURFACE
      ?auto_7817 - TRUCK
      ?auto_7815 - PLACE
      ?auto_7818 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7814 ?auto_7813 ) ( SURFACE-AT ?auto_7811 ?auto_7813 ) ( CLEAR ?auto_7811 ) ( IS-CRATE ?auto_7812 ) ( not ( = ?auto_7811 ?auto_7812 ) ) ( AVAILABLE ?auto_7814 ) ( ON ?auto_7811 ?auto_7816 ) ( not ( = ?auto_7816 ?auto_7811 ) ) ( not ( = ?auto_7816 ?auto_7812 ) ) ( TRUCK-AT ?auto_7817 ?auto_7815 ) ( not ( = ?auto_7815 ?auto_7813 ) ) ( HOIST-AT ?auto_7818 ?auto_7815 ) ( LIFTING ?auto_7818 ?auto_7812 ) ( not ( = ?auto_7814 ?auto_7818 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7818 ?auto_7812 ?auto_7817 ?auto_7815 )
      ( MAKE-2CRATE ?auto_7816 ?auto_7811 ?auto_7812 )
      ( MAKE-1CRATE-VERIFY ?auto_7811 ?auto_7812 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7819 - SURFACE
      ?auto_7820 - SURFACE
      ?auto_7821 - SURFACE
    )
    :vars
    (
      ?auto_7824 - HOIST
      ?auto_7825 - PLACE
      ?auto_7822 - TRUCK
      ?auto_7823 - PLACE
      ?auto_7826 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7824 ?auto_7825 ) ( SURFACE-AT ?auto_7820 ?auto_7825 ) ( CLEAR ?auto_7820 ) ( IS-CRATE ?auto_7821 ) ( not ( = ?auto_7820 ?auto_7821 ) ) ( AVAILABLE ?auto_7824 ) ( ON ?auto_7820 ?auto_7819 ) ( not ( = ?auto_7819 ?auto_7820 ) ) ( not ( = ?auto_7819 ?auto_7821 ) ) ( TRUCK-AT ?auto_7822 ?auto_7823 ) ( not ( = ?auto_7823 ?auto_7825 ) ) ( HOIST-AT ?auto_7826 ?auto_7823 ) ( LIFTING ?auto_7826 ?auto_7821 ) ( not ( = ?auto_7824 ?auto_7826 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7820 ?auto_7821 )
      ( MAKE-2CRATE-VERIFY ?auto_7819 ?auto_7820 ?auto_7821 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7827 - SURFACE
      ?auto_7828 - SURFACE
    )
    :vars
    (
      ?auto_7831 - HOIST
      ?auto_7832 - PLACE
      ?auto_7830 - SURFACE
      ?auto_7829 - TRUCK
      ?auto_7834 - PLACE
      ?auto_7833 - HOIST
      ?auto_7835 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7831 ?auto_7832 ) ( SURFACE-AT ?auto_7827 ?auto_7832 ) ( CLEAR ?auto_7827 ) ( IS-CRATE ?auto_7828 ) ( not ( = ?auto_7827 ?auto_7828 ) ) ( AVAILABLE ?auto_7831 ) ( ON ?auto_7827 ?auto_7830 ) ( not ( = ?auto_7830 ?auto_7827 ) ) ( not ( = ?auto_7830 ?auto_7828 ) ) ( TRUCK-AT ?auto_7829 ?auto_7834 ) ( not ( = ?auto_7834 ?auto_7832 ) ) ( HOIST-AT ?auto_7833 ?auto_7834 ) ( not ( = ?auto_7831 ?auto_7833 ) ) ( AVAILABLE ?auto_7833 ) ( SURFACE-AT ?auto_7828 ?auto_7834 ) ( ON ?auto_7828 ?auto_7835 ) ( CLEAR ?auto_7828 ) ( not ( = ?auto_7827 ?auto_7835 ) ) ( not ( = ?auto_7828 ?auto_7835 ) ) ( not ( = ?auto_7830 ?auto_7835 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7833 ?auto_7828 ?auto_7835 ?auto_7834 )
      ( MAKE-2CRATE ?auto_7830 ?auto_7827 ?auto_7828 )
      ( MAKE-1CRATE-VERIFY ?auto_7827 ?auto_7828 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7836 - SURFACE
      ?auto_7837 - SURFACE
      ?auto_7838 - SURFACE
    )
    :vars
    (
      ?auto_7843 - HOIST
      ?auto_7839 - PLACE
      ?auto_7841 - TRUCK
      ?auto_7842 - PLACE
      ?auto_7840 - HOIST
      ?auto_7844 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7843 ?auto_7839 ) ( SURFACE-AT ?auto_7837 ?auto_7839 ) ( CLEAR ?auto_7837 ) ( IS-CRATE ?auto_7838 ) ( not ( = ?auto_7837 ?auto_7838 ) ) ( AVAILABLE ?auto_7843 ) ( ON ?auto_7837 ?auto_7836 ) ( not ( = ?auto_7836 ?auto_7837 ) ) ( not ( = ?auto_7836 ?auto_7838 ) ) ( TRUCK-AT ?auto_7841 ?auto_7842 ) ( not ( = ?auto_7842 ?auto_7839 ) ) ( HOIST-AT ?auto_7840 ?auto_7842 ) ( not ( = ?auto_7843 ?auto_7840 ) ) ( AVAILABLE ?auto_7840 ) ( SURFACE-AT ?auto_7838 ?auto_7842 ) ( ON ?auto_7838 ?auto_7844 ) ( CLEAR ?auto_7838 ) ( not ( = ?auto_7837 ?auto_7844 ) ) ( not ( = ?auto_7838 ?auto_7844 ) ) ( not ( = ?auto_7836 ?auto_7844 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7837 ?auto_7838 )
      ( MAKE-2CRATE-VERIFY ?auto_7836 ?auto_7837 ?auto_7838 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7845 - SURFACE
      ?auto_7846 - SURFACE
    )
    :vars
    (
      ?auto_7852 - HOIST
      ?auto_7849 - PLACE
      ?auto_7847 - SURFACE
      ?auto_7853 - PLACE
      ?auto_7850 - HOIST
      ?auto_7848 - SURFACE
      ?auto_7851 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7852 ?auto_7849 ) ( SURFACE-AT ?auto_7845 ?auto_7849 ) ( CLEAR ?auto_7845 ) ( IS-CRATE ?auto_7846 ) ( not ( = ?auto_7845 ?auto_7846 ) ) ( AVAILABLE ?auto_7852 ) ( ON ?auto_7845 ?auto_7847 ) ( not ( = ?auto_7847 ?auto_7845 ) ) ( not ( = ?auto_7847 ?auto_7846 ) ) ( not ( = ?auto_7853 ?auto_7849 ) ) ( HOIST-AT ?auto_7850 ?auto_7853 ) ( not ( = ?auto_7852 ?auto_7850 ) ) ( AVAILABLE ?auto_7850 ) ( SURFACE-AT ?auto_7846 ?auto_7853 ) ( ON ?auto_7846 ?auto_7848 ) ( CLEAR ?auto_7846 ) ( not ( = ?auto_7845 ?auto_7848 ) ) ( not ( = ?auto_7846 ?auto_7848 ) ) ( not ( = ?auto_7847 ?auto_7848 ) ) ( TRUCK-AT ?auto_7851 ?auto_7849 ) )
    :subtasks
    ( ( !DRIVE ?auto_7851 ?auto_7849 ?auto_7853 )
      ( MAKE-2CRATE ?auto_7847 ?auto_7845 ?auto_7846 )
      ( MAKE-1CRATE-VERIFY ?auto_7845 ?auto_7846 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7854 - SURFACE
      ?auto_7855 - SURFACE
      ?auto_7856 - SURFACE
    )
    :vars
    (
      ?auto_7862 - HOIST
      ?auto_7857 - PLACE
      ?auto_7859 - PLACE
      ?auto_7858 - HOIST
      ?auto_7861 - SURFACE
      ?auto_7860 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7862 ?auto_7857 ) ( SURFACE-AT ?auto_7855 ?auto_7857 ) ( CLEAR ?auto_7855 ) ( IS-CRATE ?auto_7856 ) ( not ( = ?auto_7855 ?auto_7856 ) ) ( AVAILABLE ?auto_7862 ) ( ON ?auto_7855 ?auto_7854 ) ( not ( = ?auto_7854 ?auto_7855 ) ) ( not ( = ?auto_7854 ?auto_7856 ) ) ( not ( = ?auto_7859 ?auto_7857 ) ) ( HOIST-AT ?auto_7858 ?auto_7859 ) ( not ( = ?auto_7862 ?auto_7858 ) ) ( AVAILABLE ?auto_7858 ) ( SURFACE-AT ?auto_7856 ?auto_7859 ) ( ON ?auto_7856 ?auto_7861 ) ( CLEAR ?auto_7856 ) ( not ( = ?auto_7855 ?auto_7861 ) ) ( not ( = ?auto_7856 ?auto_7861 ) ) ( not ( = ?auto_7854 ?auto_7861 ) ) ( TRUCK-AT ?auto_7860 ?auto_7857 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7855 ?auto_7856 )
      ( MAKE-2CRATE-VERIFY ?auto_7854 ?auto_7855 ?auto_7856 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7863 - SURFACE
      ?auto_7864 - SURFACE
    )
    :vars
    (
      ?auto_7867 - HOIST
      ?auto_7870 - PLACE
      ?auto_7871 - SURFACE
      ?auto_7866 - PLACE
      ?auto_7865 - HOIST
      ?auto_7868 - SURFACE
      ?auto_7869 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7867 ?auto_7870 ) ( IS-CRATE ?auto_7864 ) ( not ( = ?auto_7863 ?auto_7864 ) ) ( not ( = ?auto_7871 ?auto_7863 ) ) ( not ( = ?auto_7871 ?auto_7864 ) ) ( not ( = ?auto_7866 ?auto_7870 ) ) ( HOIST-AT ?auto_7865 ?auto_7866 ) ( not ( = ?auto_7867 ?auto_7865 ) ) ( AVAILABLE ?auto_7865 ) ( SURFACE-AT ?auto_7864 ?auto_7866 ) ( ON ?auto_7864 ?auto_7868 ) ( CLEAR ?auto_7864 ) ( not ( = ?auto_7863 ?auto_7868 ) ) ( not ( = ?auto_7864 ?auto_7868 ) ) ( not ( = ?auto_7871 ?auto_7868 ) ) ( TRUCK-AT ?auto_7869 ?auto_7870 ) ( SURFACE-AT ?auto_7871 ?auto_7870 ) ( CLEAR ?auto_7871 ) ( LIFTING ?auto_7867 ?auto_7863 ) ( IS-CRATE ?auto_7863 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7871 ?auto_7863 )
      ( MAKE-2CRATE ?auto_7871 ?auto_7863 ?auto_7864 )
      ( MAKE-1CRATE-VERIFY ?auto_7863 ?auto_7864 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7872 - SURFACE
      ?auto_7873 - SURFACE
      ?auto_7874 - SURFACE
    )
    :vars
    (
      ?auto_7875 - HOIST
      ?auto_7880 - PLACE
      ?auto_7877 - PLACE
      ?auto_7879 - HOIST
      ?auto_7876 - SURFACE
      ?auto_7878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7875 ?auto_7880 ) ( IS-CRATE ?auto_7874 ) ( not ( = ?auto_7873 ?auto_7874 ) ) ( not ( = ?auto_7872 ?auto_7873 ) ) ( not ( = ?auto_7872 ?auto_7874 ) ) ( not ( = ?auto_7877 ?auto_7880 ) ) ( HOIST-AT ?auto_7879 ?auto_7877 ) ( not ( = ?auto_7875 ?auto_7879 ) ) ( AVAILABLE ?auto_7879 ) ( SURFACE-AT ?auto_7874 ?auto_7877 ) ( ON ?auto_7874 ?auto_7876 ) ( CLEAR ?auto_7874 ) ( not ( = ?auto_7873 ?auto_7876 ) ) ( not ( = ?auto_7874 ?auto_7876 ) ) ( not ( = ?auto_7872 ?auto_7876 ) ) ( TRUCK-AT ?auto_7878 ?auto_7880 ) ( SURFACE-AT ?auto_7872 ?auto_7880 ) ( CLEAR ?auto_7872 ) ( LIFTING ?auto_7875 ?auto_7873 ) ( IS-CRATE ?auto_7873 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7873 ?auto_7874 )
      ( MAKE-2CRATE-VERIFY ?auto_7872 ?auto_7873 ?auto_7874 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7881 - SURFACE
      ?auto_7882 - SURFACE
    )
    :vars
    (
      ?auto_7883 - HOIST
      ?auto_7886 - PLACE
      ?auto_7884 - SURFACE
      ?auto_7885 - PLACE
      ?auto_7888 - HOIST
      ?auto_7887 - SURFACE
      ?auto_7889 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7883 ?auto_7886 ) ( IS-CRATE ?auto_7882 ) ( not ( = ?auto_7881 ?auto_7882 ) ) ( not ( = ?auto_7884 ?auto_7881 ) ) ( not ( = ?auto_7884 ?auto_7882 ) ) ( not ( = ?auto_7885 ?auto_7886 ) ) ( HOIST-AT ?auto_7888 ?auto_7885 ) ( not ( = ?auto_7883 ?auto_7888 ) ) ( AVAILABLE ?auto_7888 ) ( SURFACE-AT ?auto_7882 ?auto_7885 ) ( ON ?auto_7882 ?auto_7887 ) ( CLEAR ?auto_7882 ) ( not ( = ?auto_7881 ?auto_7887 ) ) ( not ( = ?auto_7882 ?auto_7887 ) ) ( not ( = ?auto_7884 ?auto_7887 ) ) ( TRUCK-AT ?auto_7889 ?auto_7886 ) ( SURFACE-AT ?auto_7884 ?auto_7886 ) ( CLEAR ?auto_7884 ) ( IS-CRATE ?auto_7881 ) ( AVAILABLE ?auto_7883 ) ( IN ?auto_7881 ?auto_7889 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7883 ?auto_7881 ?auto_7889 ?auto_7886 )
      ( MAKE-2CRATE ?auto_7884 ?auto_7881 ?auto_7882 )
      ( MAKE-1CRATE-VERIFY ?auto_7881 ?auto_7882 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7890 - SURFACE
      ?auto_7891 - SURFACE
      ?auto_7892 - SURFACE
    )
    :vars
    (
      ?auto_7893 - HOIST
      ?auto_7895 - PLACE
      ?auto_7898 - PLACE
      ?auto_7894 - HOIST
      ?auto_7896 - SURFACE
      ?auto_7897 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7893 ?auto_7895 ) ( IS-CRATE ?auto_7892 ) ( not ( = ?auto_7891 ?auto_7892 ) ) ( not ( = ?auto_7890 ?auto_7891 ) ) ( not ( = ?auto_7890 ?auto_7892 ) ) ( not ( = ?auto_7898 ?auto_7895 ) ) ( HOIST-AT ?auto_7894 ?auto_7898 ) ( not ( = ?auto_7893 ?auto_7894 ) ) ( AVAILABLE ?auto_7894 ) ( SURFACE-AT ?auto_7892 ?auto_7898 ) ( ON ?auto_7892 ?auto_7896 ) ( CLEAR ?auto_7892 ) ( not ( = ?auto_7891 ?auto_7896 ) ) ( not ( = ?auto_7892 ?auto_7896 ) ) ( not ( = ?auto_7890 ?auto_7896 ) ) ( TRUCK-AT ?auto_7897 ?auto_7895 ) ( SURFACE-AT ?auto_7890 ?auto_7895 ) ( CLEAR ?auto_7890 ) ( IS-CRATE ?auto_7891 ) ( AVAILABLE ?auto_7893 ) ( IN ?auto_7891 ?auto_7897 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7891 ?auto_7892 )
      ( MAKE-2CRATE-VERIFY ?auto_7890 ?auto_7891 ?auto_7892 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7899 - SURFACE
      ?auto_7900 - SURFACE
    )
    :vars
    (
      ?auto_7907 - HOIST
      ?auto_7901 - PLACE
      ?auto_7902 - SURFACE
      ?auto_7905 - PLACE
      ?auto_7903 - HOIST
      ?auto_7904 - SURFACE
      ?auto_7906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7907 ?auto_7901 ) ( IS-CRATE ?auto_7900 ) ( not ( = ?auto_7899 ?auto_7900 ) ) ( not ( = ?auto_7902 ?auto_7899 ) ) ( not ( = ?auto_7902 ?auto_7900 ) ) ( not ( = ?auto_7905 ?auto_7901 ) ) ( HOIST-AT ?auto_7903 ?auto_7905 ) ( not ( = ?auto_7907 ?auto_7903 ) ) ( AVAILABLE ?auto_7903 ) ( SURFACE-AT ?auto_7900 ?auto_7905 ) ( ON ?auto_7900 ?auto_7904 ) ( CLEAR ?auto_7900 ) ( not ( = ?auto_7899 ?auto_7904 ) ) ( not ( = ?auto_7900 ?auto_7904 ) ) ( not ( = ?auto_7902 ?auto_7904 ) ) ( SURFACE-AT ?auto_7902 ?auto_7901 ) ( CLEAR ?auto_7902 ) ( IS-CRATE ?auto_7899 ) ( AVAILABLE ?auto_7907 ) ( IN ?auto_7899 ?auto_7906 ) ( TRUCK-AT ?auto_7906 ?auto_7905 ) )
    :subtasks
    ( ( !DRIVE ?auto_7906 ?auto_7905 ?auto_7901 )
      ( MAKE-2CRATE ?auto_7902 ?auto_7899 ?auto_7900 )
      ( MAKE-1CRATE-VERIFY ?auto_7899 ?auto_7900 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7908 - SURFACE
      ?auto_7909 - SURFACE
      ?auto_7910 - SURFACE
    )
    :vars
    (
      ?auto_7911 - HOIST
      ?auto_7916 - PLACE
      ?auto_7914 - PLACE
      ?auto_7915 - HOIST
      ?auto_7913 - SURFACE
      ?auto_7912 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7911 ?auto_7916 ) ( IS-CRATE ?auto_7910 ) ( not ( = ?auto_7909 ?auto_7910 ) ) ( not ( = ?auto_7908 ?auto_7909 ) ) ( not ( = ?auto_7908 ?auto_7910 ) ) ( not ( = ?auto_7914 ?auto_7916 ) ) ( HOIST-AT ?auto_7915 ?auto_7914 ) ( not ( = ?auto_7911 ?auto_7915 ) ) ( AVAILABLE ?auto_7915 ) ( SURFACE-AT ?auto_7910 ?auto_7914 ) ( ON ?auto_7910 ?auto_7913 ) ( CLEAR ?auto_7910 ) ( not ( = ?auto_7909 ?auto_7913 ) ) ( not ( = ?auto_7910 ?auto_7913 ) ) ( not ( = ?auto_7908 ?auto_7913 ) ) ( SURFACE-AT ?auto_7908 ?auto_7916 ) ( CLEAR ?auto_7908 ) ( IS-CRATE ?auto_7909 ) ( AVAILABLE ?auto_7911 ) ( IN ?auto_7909 ?auto_7912 ) ( TRUCK-AT ?auto_7912 ?auto_7914 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7909 ?auto_7910 )
      ( MAKE-2CRATE-VERIFY ?auto_7908 ?auto_7909 ?auto_7910 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7917 - SURFACE
      ?auto_7918 - SURFACE
    )
    :vars
    (
      ?auto_7924 - HOIST
      ?auto_7925 - PLACE
      ?auto_7920 - SURFACE
      ?auto_7922 - PLACE
      ?auto_7921 - HOIST
      ?auto_7923 - SURFACE
      ?auto_7919 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7924 ?auto_7925 ) ( IS-CRATE ?auto_7918 ) ( not ( = ?auto_7917 ?auto_7918 ) ) ( not ( = ?auto_7920 ?auto_7917 ) ) ( not ( = ?auto_7920 ?auto_7918 ) ) ( not ( = ?auto_7922 ?auto_7925 ) ) ( HOIST-AT ?auto_7921 ?auto_7922 ) ( not ( = ?auto_7924 ?auto_7921 ) ) ( SURFACE-AT ?auto_7918 ?auto_7922 ) ( ON ?auto_7918 ?auto_7923 ) ( CLEAR ?auto_7918 ) ( not ( = ?auto_7917 ?auto_7923 ) ) ( not ( = ?auto_7918 ?auto_7923 ) ) ( not ( = ?auto_7920 ?auto_7923 ) ) ( SURFACE-AT ?auto_7920 ?auto_7925 ) ( CLEAR ?auto_7920 ) ( IS-CRATE ?auto_7917 ) ( AVAILABLE ?auto_7924 ) ( TRUCK-AT ?auto_7919 ?auto_7922 ) ( LIFTING ?auto_7921 ?auto_7917 ) )
    :subtasks
    ( ( !LOAD ?auto_7921 ?auto_7917 ?auto_7919 ?auto_7922 )
      ( MAKE-2CRATE ?auto_7920 ?auto_7917 ?auto_7918 )
      ( MAKE-1CRATE-VERIFY ?auto_7917 ?auto_7918 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7926 - SURFACE
      ?auto_7927 - SURFACE
      ?auto_7928 - SURFACE
    )
    :vars
    (
      ?auto_7931 - HOIST
      ?auto_7930 - PLACE
      ?auto_7933 - PLACE
      ?auto_7929 - HOIST
      ?auto_7934 - SURFACE
      ?auto_7932 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7931 ?auto_7930 ) ( IS-CRATE ?auto_7928 ) ( not ( = ?auto_7927 ?auto_7928 ) ) ( not ( = ?auto_7926 ?auto_7927 ) ) ( not ( = ?auto_7926 ?auto_7928 ) ) ( not ( = ?auto_7933 ?auto_7930 ) ) ( HOIST-AT ?auto_7929 ?auto_7933 ) ( not ( = ?auto_7931 ?auto_7929 ) ) ( SURFACE-AT ?auto_7928 ?auto_7933 ) ( ON ?auto_7928 ?auto_7934 ) ( CLEAR ?auto_7928 ) ( not ( = ?auto_7927 ?auto_7934 ) ) ( not ( = ?auto_7928 ?auto_7934 ) ) ( not ( = ?auto_7926 ?auto_7934 ) ) ( SURFACE-AT ?auto_7926 ?auto_7930 ) ( CLEAR ?auto_7926 ) ( IS-CRATE ?auto_7927 ) ( AVAILABLE ?auto_7931 ) ( TRUCK-AT ?auto_7932 ?auto_7933 ) ( LIFTING ?auto_7929 ?auto_7927 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7927 ?auto_7928 )
      ( MAKE-2CRATE-VERIFY ?auto_7926 ?auto_7927 ?auto_7928 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7935 - SURFACE
      ?auto_7936 - SURFACE
    )
    :vars
    (
      ?auto_7943 - HOIST
      ?auto_7938 - PLACE
      ?auto_7940 - SURFACE
      ?auto_7942 - PLACE
      ?auto_7937 - HOIST
      ?auto_7941 - SURFACE
      ?auto_7939 - TRUCK
      ?auto_7944 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7943 ?auto_7938 ) ( IS-CRATE ?auto_7936 ) ( not ( = ?auto_7935 ?auto_7936 ) ) ( not ( = ?auto_7940 ?auto_7935 ) ) ( not ( = ?auto_7940 ?auto_7936 ) ) ( not ( = ?auto_7942 ?auto_7938 ) ) ( HOIST-AT ?auto_7937 ?auto_7942 ) ( not ( = ?auto_7943 ?auto_7937 ) ) ( SURFACE-AT ?auto_7936 ?auto_7942 ) ( ON ?auto_7936 ?auto_7941 ) ( CLEAR ?auto_7936 ) ( not ( = ?auto_7935 ?auto_7941 ) ) ( not ( = ?auto_7936 ?auto_7941 ) ) ( not ( = ?auto_7940 ?auto_7941 ) ) ( SURFACE-AT ?auto_7940 ?auto_7938 ) ( CLEAR ?auto_7940 ) ( IS-CRATE ?auto_7935 ) ( AVAILABLE ?auto_7943 ) ( TRUCK-AT ?auto_7939 ?auto_7942 ) ( AVAILABLE ?auto_7937 ) ( SURFACE-AT ?auto_7935 ?auto_7942 ) ( ON ?auto_7935 ?auto_7944 ) ( CLEAR ?auto_7935 ) ( not ( = ?auto_7935 ?auto_7944 ) ) ( not ( = ?auto_7936 ?auto_7944 ) ) ( not ( = ?auto_7940 ?auto_7944 ) ) ( not ( = ?auto_7941 ?auto_7944 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7937 ?auto_7935 ?auto_7944 ?auto_7942 )
      ( MAKE-2CRATE ?auto_7940 ?auto_7935 ?auto_7936 )
      ( MAKE-1CRATE-VERIFY ?auto_7935 ?auto_7936 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7945 - SURFACE
      ?auto_7946 - SURFACE
      ?auto_7947 - SURFACE
    )
    :vars
    (
      ?auto_7952 - HOIST
      ?auto_7948 - PLACE
      ?auto_7951 - PLACE
      ?auto_7949 - HOIST
      ?auto_7950 - SURFACE
      ?auto_7953 - TRUCK
      ?auto_7954 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7952 ?auto_7948 ) ( IS-CRATE ?auto_7947 ) ( not ( = ?auto_7946 ?auto_7947 ) ) ( not ( = ?auto_7945 ?auto_7946 ) ) ( not ( = ?auto_7945 ?auto_7947 ) ) ( not ( = ?auto_7951 ?auto_7948 ) ) ( HOIST-AT ?auto_7949 ?auto_7951 ) ( not ( = ?auto_7952 ?auto_7949 ) ) ( SURFACE-AT ?auto_7947 ?auto_7951 ) ( ON ?auto_7947 ?auto_7950 ) ( CLEAR ?auto_7947 ) ( not ( = ?auto_7946 ?auto_7950 ) ) ( not ( = ?auto_7947 ?auto_7950 ) ) ( not ( = ?auto_7945 ?auto_7950 ) ) ( SURFACE-AT ?auto_7945 ?auto_7948 ) ( CLEAR ?auto_7945 ) ( IS-CRATE ?auto_7946 ) ( AVAILABLE ?auto_7952 ) ( TRUCK-AT ?auto_7953 ?auto_7951 ) ( AVAILABLE ?auto_7949 ) ( SURFACE-AT ?auto_7946 ?auto_7951 ) ( ON ?auto_7946 ?auto_7954 ) ( CLEAR ?auto_7946 ) ( not ( = ?auto_7946 ?auto_7954 ) ) ( not ( = ?auto_7947 ?auto_7954 ) ) ( not ( = ?auto_7945 ?auto_7954 ) ) ( not ( = ?auto_7950 ?auto_7954 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7946 ?auto_7947 )
      ( MAKE-2CRATE-VERIFY ?auto_7945 ?auto_7946 ?auto_7947 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7955 - SURFACE
      ?auto_7956 - SURFACE
    )
    :vars
    (
      ?auto_7964 - HOIST
      ?auto_7962 - PLACE
      ?auto_7958 - SURFACE
      ?auto_7957 - PLACE
      ?auto_7960 - HOIST
      ?auto_7961 - SURFACE
      ?auto_7959 - SURFACE
      ?auto_7963 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7964 ?auto_7962 ) ( IS-CRATE ?auto_7956 ) ( not ( = ?auto_7955 ?auto_7956 ) ) ( not ( = ?auto_7958 ?auto_7955 ) ) ( not ( = ?auto_7958 ?auto_7956 ) ) ( not ( = ?auto_7957 ?auto_7962 ) ) ( HOIST-AT ?auto_7960 ?auto_7957 ) ( not ( = ?auto_7964 ?auto_7960 ) ) ( SURFACE-AT ?auto_7956 ?auto_7957 ) ( ON ?auto_7956 ?auto_7961 ) ( CLEAR ?auto_7956 ) ( not ( = ?auto_7955 ?auto_7961 ) ) ( not ( = ?auto_7956 ?auto_7961 ) ) ( not ( = ?auto_7958 ?auto_7961 ) ) ( SURFACE-AT ?auto_7958 ?auto_7962 ) ( CLEAR ?auto_7958 ) ( IS-CRATE ?auto_7955 ) ( AVAILABLE ?auto_7964 ) ( AVAILABLE ?auto_7960 ) ( SURFACE-AT ?auto_7955 ?auto_7957 ) ( ON ?auto_7955 ?auto_7959 ) ( CLEAR ?auto_7955 ) ( not ( = ?auto_7955 ?auto_7959 ) ) ( not ( = ?auto_7956 ?auto_7959 ) ) ( not ( = ?auto_7958 ?auto_7959 ) ) ( not ( = ?auto_7961 ?auto_7959 ) ) ( TRUCK-AT ?auto_7963 ?auto_7962 ) )
    :subtasks
    ( ( !DRIVE ?auto_7963 ?auto_7962 ?auto_7957 )
      ( MAKE-2CRATE ?auto_7958 ?auto_7955 ?auto_7956 )
      ( MAKE-1CRATE-VERIFY ?auto_7955 ?auto_7956 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7965 - SURFACE
      ?auto_7966 - SURFACE
      ?auto_7967 - SURFACE
    )
    :vars
    (
      ?auto_7969 - HOIST
      ?auto_7970 - PLACE
      ?auto_7974 - PLACE
      ?auto_7972 - HOIST
      ?auto_7973 - SURFACE
      ?auto_7968 - SURFACE
      ?auto_7971 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7969 ?auto_7970 ) ( IS-CRATE ?auto_7967 ) ( not ( = ?auto_7966 ?auto_7967 ) ) ( not ( = ?auto_7965 ?auto_7966 ) ) ( not ( = ?auto_7965 ?auto_7967 ) ) ( not ( = ?auto_7974 ?auto_7970 ) ) ( HOIST-AT ?auto_7972 ?auto_7974 ) ( not ( = ?auto_7969 ?auto_7972 ) ) ( SURFACE-AT ?auto_7967 ?auto_7974 ) ( ON ?auto_7967 ?auto_7973 ) ( CLEAR ?auto_7967 ) ( not ( = ?auto_7966 ?auto_7973 ) ) ( not ( = ?auto_7967 ?auto_7973 ) ) ( not ( = ?auto_7965 ?auto_7973 ) ) ( SURFACE-AT ?auto_7965 ?auto_7970 ) ( CLEAR ?auto_7965 ) ( IS-CRATE ?auto_7966 ) ( AVAILABLE ?auto_7969 ) ( AVAILABLE ?auto_7972 ) ( SURFACE-AT ?auto_7966 ?auto_7974 ) ( ON ?auto_7966 ?auto_7968 ) ( CLEAR ?auto_7966 ) ( not ( = ?auto_7966 ?auto_7968 ) ) ( not ( = ?auto_7967 ?auto_7968 ) ) ( not ( = ?auto_7965 ?auto_7968 ) ) ( not ( = ?auto_7973 ?auto_7968 ) ) ( TRUCK-AT ?auto_7971 ?auto_7970 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7966 ?auto_7967 )
      ( MAKE-2CRATE-VERIFY ?auto_7965 ?auto_7966 ?auto_7967 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7993 - SURFACE
      ?auto_7994 - SURFACE
      ?auto_7995 - SURFACE
      ?auto_7996 - SURFACE
    )
    :vars
    (
      ?auto_7998 - HOIST
      ?auto_7997 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7998 ?auto_7997 ) ( SURFACE-AT ?auto_7995 ?auto_7997 ) ( CLEAR ?auto_7995 ) ( LIFTING ?auto_7998 ?auto_7996 ) ( IS-CRATE ?auto_7996 ) ( not ( = ?auto_7995 ?auto_7996 ) ) ( ON ?auto_7994 ?auto_7993 ) ( ON ?auto_7995 ?auto_7994 ) ( not ( = ?auto_7993 ?auto_7994 ) ) ( not ( = ?auto_7993 ?auto_7995 ) ) ( not ( = ?auto_7993 ?auto_7996 ) ) ( not ( = ?auto_7994 ?auto_7995 ) ) ( not ( = ?auto_7994 ?auto_7996 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7995 ?auto_7996 )
      ( MAKE-3CRATE-VERIFY ?auto_7993 ?auto_7994 ?auto_7995 ?auto_7996 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8010 - SURFACE
      ?auto_8011 - SURFACE
      ?auto_8012 - SURFACE
      ?auto_8013 - SURFACE
    )
    :vars
    (
      ?auto_8015 - HOIST
      ?auto_8016 - PLACE
      ?auto_8014 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8015 ?auto_8016 ) ( SURFACE-AT ?auto_8012 ?auto_8016 ) ( CLEAR ?auto_8012 ) ( IS-CRATE ?auto_8013 ) ( not ( = ?auto_8012 ?auto_8013 ) ) ( TRUCK-AT ?auto_8014 ?auto_8016 ) ( AVAILABLE ?auto_8015 ) ( IN ?auto_8013 ?auto_8014 ) ( ON ?auto_8012 ?auto_8011 ) ( not ( = ?auto_8011 ?auto_8012 ) ) ( not ( = ?auto_8011 ?auto_8013 ) ) ( ON ?auto_8011 ?auto_8010 ) ( not ( = ?auto_8010 ?auto_8011 ) ) ( not ( = ?auto_8010 ?auto_8012 ) ) ( not ( = ?auto_8010 ?auto_8013 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8011 ?auto_8012 ?auto_8013 )
      ( MAKE-3CRATE-VERIFY ?auto_8010 ?auto_8011 ?auto_8012 ?auto_8013 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8031 - SURFACE
      ?auto_8032 - SURFACE
      ?auto_8033 - SURFACE
      ?auto_8034 - SURFACE
    )
    :vars
    (
      ?auto_8038 - HOIST
      ?auto_8036 - PLACE
      ?auto_8035 - TRUCK
      ?auto_8037 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8038 ?auto_8036 ) ( SURFACE-AT ?auto_8033 ?auto_8036 ) ( CLEAR ?auto_8033 ) ( IS-CRATE ?auto_8034 ) ( not ( = ?auto_8033 ?auto_8034 ) ) ( AVAILABLE ?auto_8038 ) ( IN ?auto_8034 ?auto_8035 ) ( ON ?auto_8033 ?auto_8032 ) ( not ( = ?auto_8032 ?auto_8033 ) ) ( not ( = ?auto_8032 ?auto_8034 ) ) ( TRUCK-AT ?auto_8035 ?auto_8037 ) ( not ( = ?auto_8037 ?auto_8036 ) ) ( ON ?auto_8032 ?auto_8031 ) ( not ( = ?auto_8031 ?auto_8032 ) ) ( not ( = ?auto_8031 ?auto_8033 ) ) ( not ( = ?auto_8031 ?auto_8034 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8032 ?auto_8033 ?auto_8034 )
      ( MAKE-3CRATE-VERIFY ?auto_8031 ?auto_8032 ?auto_8033 ?auto_8034 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8055 - SURFACE
      ?auto_8056 - SURFACE
      ?auto_8057 - SURFACE
      ?auto_8058 - SURFACE
    )
    :vars
    (
      ?auto_8062 - HOIST
      ?auto_8059 - PLACE
      ?auto_8061 - TRUCK
      ?auto_8063 - PLACE
      ?auto_8060 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8062 ?auto_8059 ) ( SURFACE-AT ?auto_8057 ?auto_8059 ) ( CLEAR ?auto_8057 ) ( IS-CRATE ?auto_8058 ) ( not ( = ?auto_8057 ?auto_8058 ) ) ( AVAILABLE ?auto_8062 ) ( ON ?auto_8057 ?auto_8056 ) ( not ( = ?auto_8056 ?auto_8057 ) ) ( not ( = ?auto_8056 ?auto_8058 ) ) ( TRUCK-AT ?auto_8061 ?auto_8063 ) ( not ( = ?auto_8063 ?auto_8059 ) ) ( HOIST-AT ?auto_8060 ?auto_8063 ) ( LIFTING ?auto_8060 ?auto_8058 ) ( not ( = ?auto_8062 ?auto_8060 ) ) ( ON ?auto_8056 ?auto_8055 ) ( not ( = ?auto_8055 ?auto_8056 ) ) ( not ( = ?auto_8055 ?auto_8057 ) ) ( not ( = ?auto_8055 ?auto_8058 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8056 ?auto_8057 ?auto_8058 )
      ( MAKE-3CRATE-VERIFY ?auto_8055 ?auto_8056 ?auto_8057 ?auto_8058 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8082 - SURFACE
      ?auto_8083 - SURFACE
      ?auto_8084 - SURFACE
      ?auto_8085 - SURFACE
    )
    :vars
    (
      ?auto_8089 - HOIST
      ?auto_8086 - PLACE
      ?auto_8087 - TRUCK
      ?auto_8090 - PLACE
      ?auto_8088 - HOIST
      ?auto_8091 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8089 ?auto_8086 ) ( SURFACE-AT ?auto_8084 ?auto_8086 ) ( CLEAR ?auto_8084 ) ( IS-CRATE ?auto_8085 ) ( not ( = ?auto_8084 ?auto_8085 ) ) ( AVAILABLE ?auto_8089 ) ( ON ?auto_8084 ?auto_8083 ) ( not ( = ?auto_8083 ?auto_8084 ) ) ( not ( = ?auto_8083 ?auto_8085 ) ) ( TRUCK-AT ?auto_8087 ?auto_8090 ) ( not ( = ?auto_8090 ?auto_8086 ) ) ( HOIST-AT ?auto_8088 ?auto_8090 ) ( not ( = ?auto_8089 ?auto_8088 ) ) ( AVAILABLE ?auto_8088 ) ( SURFACE-AT ?auto_8085 ?auto_8090 ) ( ON ?auto_8085 ?auto_8091 ) ( CLEAR ?auto_8085 ) ( not ( = ?auto_8084 ?auto_8091 ) ) ( not ( = ?auto_8085 ?auto_8091 ) ) ( not ( = ?auto_8083 ?auto_8091 ) ) ( ON ?auto_8083 ?auto_8082 ) ( not ( = ?auto_8082 ?auto_8083 ) ) ( not ( = ?auto_8082 ?auto_8084 ) ) ( not ( = ?auto_8082 ?auto_8085 ) ) ( not ( = ?auto_8082 ?auto_8091 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8083 ?auto_8084 ?auto_8085 )
      ( MAKE-3CRATE-VERIFY ?auto_8082 ?auto_8083 ?auto_8084 ?auto_8085 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8110 - SURFACE
      ?auto_8111 - SURFACE
      ?auto_8112 - SURFACE
      ?auto_8113 - SURFACE
    )
    :vars
    (
      ?auto_8115 - HOIST
      ?auto_8117 - PLACE
      ?auto_8118 - PLACE
      ?auto_8114 - HOIST
      ?auto_8116 - SURFACE
      ?auto_8119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8115 ?auto_8117 ) ( SURFACE-AT ?auto_8112 ?auto_8117 ) ( CLEAR ?auto_8112 ) ( IS-CRATE ?auto_8113 ) ( not ( = ?auto_8112 ?auto_8113 ) ) ( AVAILABLE ?auto_8115 ) ( ON ?auto_8112 ?auto_8111 ) ( not ( = ?auto_8111 ?auto_8112 ) ) ( not ( = ?auto_8111 ?auto_8113 ) ) ( not ( = ?auto_8118 ?auto_8117 ) ) ( HOIST-AT ?auto_8114 ?auto_8118 ) ( not ( = ?auto_8115 ?auto_8114 ) ) ( AVAILABLE ?auto_8114 ) ( SURFACE-AT ?auto_8113 ?auto_8118 ) ( ON ?auto_8113 ?auto_8116 ) ( CLEAR ?auto_8113 ) ( not ( = ?auto_8112 ?auto_8116 ) ) ( not ( = ?auto_8113 ?auto_8116 ) ) ( not ( = ?auto_8111 ?auto_8116 ) ) ( TRUCK-AT ?auto_8119 ?auto_8117 ) ( ON ?auto_8111 ?auto_8110 ) ( not ( = ?auto_8110 ?auto_8111 ) ) ( not ( = ?auto_8110 ?auto_8112 ) ) ( not ( = ?auto_8110 ?auto_8113 ) ) ( not ( = ?auto_8110 ?auto_8116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8111 ?auto_8112 ?auto_8113 )
      ( MAKE-3CRATE-VERIFY ?auto_8110 ?auto_8111 ?auto_8112 ?auto_8113 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8138 - SURFACE
      ?auto_8139 - SURFACE
      ?auto_8140 - SURFACE
      ?auto_8141 - SURFACE
    )
    :vars
    (
      ?auto_8147 - HOIST
      ?auto_8146 - PLACE
      ?auto_8144 - PLACE
      ?auto_8142 - HOIST
      ?auto_8143 - SURFACE
      ?auto_8145 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8147 ?auto_8146 ) ( IS-CRATE ?auto_8141 ) ( not ( = ?auto_8140 ?auto_8141 ) ) ( not ( = ?auto_8139 ?auto_8140 ) ) ( not ( = ?auto_8139 ?auto_8141 ) ) ( not ( = ?auto_8144 ?auto_8146 ) ) ( HOIST-AT ?auto_8142 ?auto_8144 ) ( not ( = ?auto_8147 ?auto_8142 ) ) ( AVAILABLE ?auto_8142 ) ( SURFACE-AT ?auto_8141 ?auto_8144 ) ( ON ?auto_8141 ?auto_8143 ) ( CLEAR ?auto_8141 ) ( not ( = ?auto_8140 ?auto_8143 ) ) ( not ( = ?auto_8141 ?auto_8143 ) ) ( not ( = ?auto_8139 ?auto_8143 ) ) ( TRUCK-AT ?auto_8145 ?auto_8146 ) ( SURFACE-AT ?auto_8139 ?auto_8146 ) ( CLEAR ?auto_8139 ) ( LIFTING ?auto_8147 ?auto_8140 ) ( IS-CRATE ?auto_8140 ) ( ON ?auto_8139 ?auto_8138 ) ( not ( = ?auto_8138 ?auto_8139 ) ) ( not ( = ?auto_8138 ?auto_8140 ) ) ( not ( = ?auto_8138 ?auto_8141 ) ) ( not ( = ?auto_8138 ?auto_8143 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8139 ?auto_8140 ?auto_8141 )
      ( MAKE-3CRATE-VERIFY ?auto_8138 ?auto_8139 ?auto_8140 ?auto_8141 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8166 - SURFACE
      ?auto_8167 - SURFACE
      ?auto_8168 - SURFACE
      ?auto_8169 - SURFACE
    )
    :vars
    (
      ?auto_8173 - HOIST
      ?auto_8171 - PLACE
      ?auto_8175 - PLACE
      ?auto_8172 - HOIST
      ?auto_8174 - SURFACE
      ?auto_8170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8173 ?auto_8171 ) ( IS-CRATE ?auto_8169 ) ( not ( = ?auto_8168 ?auto_8169 ) ) ( not ( = ?auto_8167 ?auto_8168 ) ) ( not ( = ?auto_8167 ?auto_8169 ) ) ( not ( = ?auto_8175 ?auto_8171 ) ) ( HOIST-AT ?auto_8172 ?auto_8175 ) ( not ( = ?auto_8173 ?auto_8172 ) ) ( AVAILABLE ?auto_8172 ) ( SURFACE-AT ?auto_8169 ?auto_8175 ) ( ON ?auto_8169 ?auto_8174 ) ( CLEAR ?auto_8169 ) ( not ( = ?auto_8168 ?auto_8174 ) ) ( not ( = ?auto_8169 ?auto_8174 ) ) ( not ( = ?auto_8167 ?auto_8174 ) ) ( TRUCK-AT ?auto_8170 ?auto_8171 ) ( SURFACE-AT ?auto_8167 ?auto_8171 ) ( CLEAR ?auto_8167 ) ( IS-CRATE ?auto_8168 ) ( AVAILABLE ?auto_8173 ) ( IN ?auto_8168 ?auto_8170 ) ( ON ?auto_8167 ?auto_8166 ) ( not ( = ?auto_8166 ?auto_8167 ) ) ( not ( = ?auto_8166 ?auto_8168 ) ) ( not ( = ?auto_8166 ?auto_8169 ) ) ( not ( = ?auto_8166 ?auto_8174 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8167 ?auto_8168 ?auto_8169 )
      ( MAKE-3CRATE-VERIFY ?auto_8166 ?auto_8167 ?auto_8168 ?auto_8169 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8245 - SURFACE
      ?auto_8246 - SURFACE
    )
    :vars
    (
      ?auto_8247 - HOIST
      ?auto_8248 - PLACE
      ?auto_8251 - SURFACE
      ?auto_8249 - PLACE
      ?auto_8253 - HOIST
      ?auto_8252 - SURFACE
      ?auto_8250 - TRUCK
      ?auto_8254 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8247 ?auto_8248 ) ( SURFACE-AT ?auto_8245 ?auto_8248 ) ( CLEAR ?auto_8245 ) ( IS-CRATE ?auto_8246 ) ( not ( = ?auto_8245 ?auto_8246 ) ) ( AVAILABLE ?auto_8247 ) ( ON ?auto_8245 ?auto_8251 ) ( not ( = ?auto_8251 ?auto_8245 ) ) ( not ( = ?auto_8251 ?auto_8246 ) ) ( not ( = ?auto_8249 ?auto_8248 ) ) ( HOIST-AT ?auto_8253 ?auto_8249 ) ( not ( = ?auto_8247 ?auto_8253 ) ) ( AVAILABLE ?auto_8253 ) ( SURFACE-AT ?auto_8246 ?auto_8249 ) ( ON ?auto_8246 ?auto_8252 ) ( CLEAR ?auto_8246 ) ( not ( = ?auto_8245 ?auto_8252 ) ) ( not ( = ?auto_8246 ?auto_8252 ) ) ( not ( = ?auto_8251 ?auto_8252 ) ) ( TRUCK-AT ?auto_8250 ?auto_8254 ) ( not ( = ?auto_8254 ?auto_8248 ) ) ( not ( = ?auto_8249 ?auto_8254 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8250 ?auto_8254 ?auto_8248 )
      ( MAKE-1CRATE ?auto_8245 ?auto_8246 )
      ( MAKE-1CRATE-VERIFY ?auto_8245 ?auto_8246 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8351 - SURFACE
      ?auto_8352 - SURFACE
    )
    :vars
    (
      ?auto_8354 - HOIST
      ?auto_8359 - PLACE
      ?auto_8357 - SURFACE
      ?auto_8358 - PLACE
      ?auto_8353 - HOIST
      ?auto_8356 - SURFACE
      ?auto_8355 - TRUCK
      ?auto_8360 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8354 ?auto_8359 ) ( SURFACE-AT ?auto_8351 ?auto_8359 ) ( CLEAR ?auto_8351 ) ( IS-CRATE ?auto_8352 ) ( not ( = ?auto_8351 ?auto_8352 ) ) ( ON ?auto_8351 ?auto_8357 ) ( not ( = ?auto_8357 ?auto_8351 ) ) ( not ( = ?auto_8357 ?auto_8352 ) ) ( not ( = ?auto_8358 ?auto_8359 ) ) ( HOIST-AT ?auto_8353 ?auto_8358 ) ( not ( = ?auto_8354 ?auto_8353 ) ) ( AVAILABLE ?auto_8353 ) ( SURFACE-AT ?auto_8352 ?auto_8358 ) ( ON ?auto_8352 ?auto_8356 ) ( CLEAR ?auto_8352 ) ( not ( = ?auto_8351 ?auto_8356 ) ) ( not ( = ?auto_8352 ?auto_8356 ) ) ( not ( = ?auto_8357 ?auto_8356 ) ) ( TRUCK-AT ?auto_8355 ?auto_8359 ) ( LIFTING ?auto_8354 ?auto_8360 ) ( IS-CRATE ?auto_8360 ) ( not ( = ?auto_8351 ?auto_8360 ) ) ( not ( = ?auto_8352 ?auto_8360 ) ) ( not ( = ?auto_8357 ?auto_8360 ) ) ( not ( = ?auto_8356 ?auto_8360 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8354 ?auto_8360 ?auto_8355 ?auto_8359 )
      ( MAKE-1CRATE ?auto_8351 ?auto_8352 )
      ( MAKE-1CRATE-VERIFY ?auto_8351 ?auto_8352 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8459 - SURFACE
      ?auto_8460 - SURFACE
      ?auto_8461 - SURFACE
      ?auto_8463 - SURFACE
      ?auto_8462 - SURFACE
    )
    :vars
    (
      ?auto_8465 - HOIST
      ?auto_8464 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8465 ?auto_8464 ) ( SURFACE-AT ?auto_8463 ?auto_8464 ) ( CLEAR ?auto_8463 ) ( LIFTING ?auto_8465 ?auto_8462 ) ( IS-CRATE ?auto_8462 ) ( not ( = ?auto_8463 ?auto_8462 ) ) ( ON ?auto_8460 ?auto_8459 ) ( ON ?auto_8461 ?auto_8460 ) ( ON ?auto_8463 ?auto_8461 ) ( not ( = ?auto_8459 ?auto_8460 ) ) ( not ( = ?auto_8459 ?auto_8461 ) ) ( not ( = ?auto_8459 ?auto_8463 ) ) ( not ( = ?auto_8459 ?auto_8462 ) ) ( not ( = ?auto_8460 ?auto_8461 ) ) ( not ( = ?auto_8460 ?auto_8463 ) ) ( not ( = ?auto_8460 ?auto_8462 ) ) ( not ( = ?auto_8461 ?auto_8463 ) ) ( not ( = ?auto_8461 ?auto_8462 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8463 ?auto_8462 )
      ( MAKE-4CRATE-VERIFY ?auto_8459 ?auto_8460 ?auto_8461 ?auto_8463 ?auto_8462 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8484 - SURFACE
      ?auto_8485 - SURFACE
      ?auto_8486 - SURFACE
      ?auto_8488 - SURFACE
      ?auto_8487 - SURFACE
    )
    :vars
    (
      ?auto_8490 - HOIST
      ?auto_8491 - PLACE
      ?auto_8489 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8490 ?auto_8491 ) ( SURFACE-AT ?auto_8488 ?auto_8491 ) ( CLEAR ?auto_8488 ) ( IS-CRATE ?auto_8487 ) ( not ( = ?auto_8488 ?auto_8487 ) ) ( TRUCK-AT ?auto_8489 ?auto_8491 ) ( AVAILABLE ?auto_8490 ) ( IN ?auto_8487 ?auto_8489 ) ( ON ?auto_8488 ?auto_8486 ) ( not ( = ?auto_8486 ?auto_8488 ) ) ( not ( = ?auto_8486 ?auto_8487 ) ) ( ON ?auto_8485 ?auto_8484 ) ( ON ?auto_8486 ?auto_8485 ) ( not ( = ?auto_8484 ?auto_8485 ) ) ( not ( = ?auto_8484 ?auto_8486 ) ) ( not ( = ?auto_8484 ?auto_8488 ) ) ( not ( = ?auto_8484 ?auto_8487 ) ) ( not ( = ?auto_8485 ?auto_8486 ) ) ( not ( = ?auto_8485 ?auto_8488 ) ) ( not ( = ?auto_8485 ?auto_8487 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8486 ?auto_8488 ?auto_8487 )
      ( MAKE-4CRATE-VERIFY ?auto_8484 ?auto_8485 ?auto_8486 ?auto_8488 ?auto_8487 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8514 - SURFACE
      ?auto_8515 - SURFACE
      ?auto_8516 - SURFACE
      ?auto_8518 - SURFACE
      ?auto_8517 - SURFACE
    )
    :vars
    (
      ?auto_8522 - HOIST
      ?auto_8521 - PLACE
      ?auto_8520 - TRUCK
      ?auto_8519 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8522 ?auto_8521 ) ( SURFACE-AT ?auto_8518 ?auto_8521 ) ( CLEAR ?auto_8518 ) ( IS-CRATE ?auto_8517 ) ( not ( = ?auto_8518 ?auto_8517 ) ) ( AVAILABLE ?auto_8522 ) ( IN ?auto_8517 ?auto_8520 ) ( ON ?auto_8518 ?auto_8516 ) ( not ( = ?auto_8516 ?auto_8518 ) ) ( not ( = ?auto_8516 ?auto_8517 ) ) ( TRUCK-AT ?auto_8520 ?auto_8519 ) ( not ( = ?auto_8519 ?auto_8521 ) ) ( ON ?auto_8515 ?auto_8514 ) ( ON ?auto_8516 ?auto_8515 ) ( not ( = ?auto_8514 ?auto_8515 ) ) ( not ( = ?auto_8514 ?auto_8516 ) ) ( not ( = ?auto_8514 ?auto_8518 ) ) ( not ( = ?auto_8514 ?auto_8517 ) ) ( not ( = ?auto_8515 ?auto_8516 ) ) ( not ( = ?auto_8515 ?auto_8518 ) ) ( not ( = ?auto_8515 ?auto_8517 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8516 ?auto_8518 ?auto_8517 )
      ( MAKE-4CRATE-VERIFY ?auto_8514 ?auto_8515 ?auto_8516 ?auto_8518 ?auto_8517 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8548 - SURFACE
      ?auto_8549 - SURFACE
      ?auto_8550 - SURFACE
      ?auto_8552 - SURFACE
      ?auto_8551 - SURFACE
    )
    :vars
    (
      ?auto_8557 - HOIST
      ?auto_8553 - PLACE
      ?auto_8556 - TRUCK
      ?auto_8554 - PLACE
      ?auto_8555 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8557 ?auto_8553 ) ( SURFACE-AT ?auto_8552 ?auto_8553 ) ( CLEAR ?auto_8552 ) ( IS-CRATE ?auto_8551 ) ( not ( = ?auto_8552 ?auto_8551 ) ) ( AVAILABLE ?auto_8557 ) ( ON ?auto_8552 ?auto_8550 ) ( not ( = ?auto_8550 ?auto_8552 ) ) ( not ( = ?auto_8550 ?auto_8551 ) ) ( TRUCK-AT ?auto_8556 ?auto_8554 ) ( not ( = ?auto_8554 ?auto_8553 ) ) ( HOIST-AT ?auto_8555 ?auto_8554 ) ( LIFTING ?auto_8555 ?auto_8551 ) ( not ( = ?auto_8557 ?auto_8555 ) ) ( ON ?auto_8549 ?auto_8548 ) ( ON ?auto_8550 ?auto_8549 ) ( not ( = ?auto_8548 ?auto_8549 ) ) ( not ( = ?auto_8548 ?auto_8550 ) ) ( not ( = ?auto_8548 ?auto_8552 ) ) ( not ( = ?auto_8548 ?auto_8551 ) ) ( not ( = ?auto_8549 ?auto_8550 ) ) ( not ( = ?auto_8549 ?auto_8552 ) ) ( not ( = ?auto_8549 ?auto_8551 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8550 ?auto_8552 ?auto_8551 )
      ( MAKE-4CRATE-VERIFY ?auto_8548 ?auto_8549 ?auto_8550 ?auto_8552 ?auto_8551 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8586 - SURFACE
      ?auto_8587 - SURFACE
      ?auto_8588 - SURFACE
      ?auto_8590 - SURFACE
      ?auto_8589 - SURFACE
    )
    :vars
    (
      ?auto_8594 - HOIST
      ?auto_8595 - PLACE
      ?auto_8592 - TRUCK
      ?auto_8591 - PLACE
      ?auto_8596 - HOIST
      ?auto_8593 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8594 ?auto_8595 ) ( SURFACE-AT ?auto_8590 ?auto_8595 ) ( CLEAR ?auto_8590 ) ( IS-CRATE ?auto_8589 ) ( not ( = ?auto_8590 ?auto_8589 ) ) ( AVAILABLE ?auto_8594 ) ( ON ?auto_8590 ?auto_8588 ) ( not ( = ?auto_8588 ?auto_8590 ) ) ( not ( = ?auto_8588 ?auto_8589 ) ) ( TRUCK-AT ?auto_8592 ?auto_8591 ) ( not ( = ?auto_8591 ?auto_8595 ) ) ( HOIST-AT ?auto_8596 ?auto_8591 ) ( not ( = ?auto_8594 ?auto_8596 ) ) ( AVAILABLE ?auto_8596 ) ( SURFACE-AT ?auto_8589 ?auto_8591 ) ( ON ?auto_8589 ?auto_8593 ) ( CLEAR ?auto_8589 ) ( not ( = ?auto_8590 ?auto_8593 ) ) ( not ( = ?auto_8589 ?auto_8593 ) ) ( not ( = ?auto_8588 ?auto_8593 ) ) ( ON ?auto_8587 ?auto_8586 ) ( ON ?auto_8588 ?auto_8587 ) ( not ( = ?auto_8586 ?auto_8587 ) ) ( not ( = ?auto_8586 ?auto_8588 ) ) ( not ( = ?auto_8586 ?auto_8590 ) ) ( not ( = ?auto_8586 ?auto_8589 ) ) ( not ( = ?auto_8586 ?auto_8593 ) ) ( not ( = ?auto_8587 ?auto_8588 ) ) ( not ( = ?auto_8587 ?auto_8590 ) ) ( not ( = ?auto_8587 ?auto_8589 ) ) ( not ( = ?auto_8587 ?auto_8593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8588 ?auto_8590 ?auto_8589 )
      ( MAKE-4CRATE-VERIFY ?auto_8586 ?auto_8587 ?auto_8588 ?auto_8590 ?auto_8589 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8625 - SURFACE
      ?auto_8626 - SURFACE
      ?auto_8627 - SURFACE
      ?auto_8629 - SURFACE
      ?auto_8628 - SURFACE
    )
    :vars
    (
      ?auto_8632 - HOIST
      ?auto_8633 - PLACE
      ?auto_8630 - PLACE
      ?auto_8631 - HOIST
      ?auto_8635 - SURFACE
      ?auto_8634 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8632 ?auto_8633 ) ( SURFACE-AT ?auto_8629 ?auto_8633 ) ( CLEAR ?auto_8629 ) ( IS-CRATE ?auto_8628 ) ( not ( = ?auto_8629 ?auto_8628 ) ) ( AVAILABLE ?auto_8632 ) ( ON ?auto_8629 ?auto_8627 ) ( not ( = ?auto_8627 ?auto_8629 ) ) ( not ( = ?auto_8627 ?auto_8628 ) ) ( not ( = ?auto_8630 ?auto_8633 ) ) ( HOIST-AT ?auto_8631 ?auto_8630 ) ( not ( = ?auto_8632 ?auto_8631 ) ) ( AVAILABLE ?auto_8631 ) ( SURFACE-AT ?auto_8628 ?auto_8630 ) ( ON ?auto_8628 ?auto_8635 ) ( CLEAR ?auto_8628 ) ( not ( = ?auto_8629 ?auto_8635 ) ) ( not ( = ?auto_8628 ?auto_8635 ) ) ( not ( = ?auto_8627 ?auto_8635 ) ) ( TRUCK-AT ?auto_8634 ?auto_8633 ) ( ON ?auto_8626 ?auto_8625 ) ( ON ?auto_8627 ?auto_8626 ) ( not ( = ?auto_8625 ?auto_8626 ) ) ( not ( = ?auto_8625 ?auto_8627 ) ) ( not ( = ?auto_8625 ?auto_8629 ) ) ( not ( = ?auto_8625 ?auto_8628 ) ) ( not ( = ?auto_8625 ?auto_8635 ) ) ( not ( = ?auto_8626 ?auto_8627 ) ) ( not ( = ?auto_8626 ?auto_8629 ) ) ( not ( = ?auto_8626 ?auto_8628 ) ) ( not ( = ?auto_8626 ?auto_8635 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8627 ?auto_8629 ?auto_8628 )
      ( MAKE-4CRATE-VERIFY ?auto_8625 ?auto_8626 ?auto_8627 ?auto_8629 ?auto_8628 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8664 - SURFACE
      ?auto_8665 - SURFACE
      ?auto_8666 - SURFACE
      ?auto_8668 - SURFACE
      ?auto_8667 - SURFACE
    )
    :vars
    (
      ?auto_8669 - HOIST
      ?auto_8673 - PLACE
      ?auto_8674 - PLACE
      ?auto_8670 - HOIST
      ?auto_8672 - SURFACE
      ?auto_8671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8669 ?auto_8673 ) ( IS-CRATE ?auto_8667 ) ( not ( = ?auto_8668 ?auto_8667 ) ) ( not ( = ?auto_8666 ?auto_8668 ) ) ( not ( = ?auto_8666 ?auto_8667 ) ) ( not ( = ?auto_8674 ?auto_8673 ) ) ( HOIST-AT ?auto_8670 ?auto_8674 ) ( not ( = ?auto_8669 ?auto_8670 ) ) ( AVAILABLE ?auto_8670 ) ( SURFACE-AT ?auto_8667 ?auto_8674 ) ( ON ?auto_8667 ?auto_8672 ) ( CLEAR ?auto_8667 ) ( not ( = ?auto_8668 ?auto_8672 ) ) ( not ( = ?auto_8667 ?auto_8672 ) ) ( not ( = ?auto_8666 ?auto_8672 ) ) ( TRUCK-AT ?auto_8671 ?auto_8673 ) ( SURFACE-AT ?auto_8666 ?auto_8673 ) ( CLEAR ?auto_8666 ) ( LIFTING ?auto_8669 ?auto_8668 ) ( IS-CRATE ?auto_8668 ) ( ON ?auto_8665 ?auto_8664 ) ( ON ?auto_8666 ?auto_8665 ) ( not ( = ?auto_8664 ?auto_8665 ) ) ( not ( = ?auto_8664 ?auto_8666 ) ) ( not ( = ?auto_8664 ?auto_8668 ) ) ( not ( = ?auto_8664 ?auto_8667 ) ) ( not ( = ?auto_8664 ?auto_8672 ) ) ( not ( = ?auto_8665 ?auto_8666 ) ) ( not ( = ?auto_8665 ?auto_8668 ) ) ( not ( = ?auto_8665 ?auto_8667 ) ) ( not ( = ?auto_8665 ?auto_8672 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8666 ?auto_8668 ?auto_8667 )
      ( MAKE-4CRATE-VERIFY ?auto_8664 ?auto_8665 ?auto_8666 ?auto_8668 ?auto_8667 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8703 - SURFACE
      ?auto_8704 - SURFACE
      ?auto_8705 - SURFACE
      ?auto_8707 - SURFACE
      ?auto_8706 - SURFACE
    )
    :vars
    (
      ?auto_8709 - HOIST
      ?auto_8712 - PLACE
      ?auto_8711 - PLACE
      ?auto_8710 - HOIST
      ?auto_8713 - SURFACE
      ?auto_8708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8709 ?auto_8712 ) ( IS-CRATE ?auto_8706 ) ( not ( = ?auto_8707 ?auto_8706 ) ) ( not ( = ?auto_8705 ?auto_8707 ) ) ( not ( = ?auto_8705 ?auto_8706 ) ) ( not ( = ?auto_8711 ?auto_8712 ) ) ( HOIST-AT ?auto_8710 ?auto_8711 ) ( not ( = ?auto_8709 ?auto_8710 ) ) ( AVAILABLE ?auto_8710 ) ( SURFACE-AT ?auto_8706 ?auto_8711 ) ( ON ?auto_8706 ?auto_8713 ) ( CLEAR ?auto_8706 ) ( not ( = ?auto_8707 ?auto_8713 ) ) ( not ( = ?auto_8706 ?auto_8713 ) ) ( not ( = ?auto_8705 ?auto_8713 ) ) ( TRUCK-AT ?auto_8708 ?auto_8712 ) ( SURFACE-AT ?auto_8705 ?auto_8712 ) ( CLEAR ?auto_8705 ) ( IS-CRATE ?auto_8707 ) ( AVAILABLE ?auto_8709 ) ( IN ?auto_8707 ?auto_8708 ) ( ON ?auto_8704 ?auto_8703 ) ( ON ?auto_8705 ?auto_8704 ) ( not ( = ?auto_8703 ?auto_8704 ) ) ( not ( = ?auto_8703 ?auto_8705 ) ) ( not ( = ?auto_8703 ?auto_8707 ) ) ( not ( = ?auto_8703 ?auto_8706 ) ) ( not ( = ?auto_8703 ?auto_8713 ) ) ( not ( = ?auto_8704 ?auto_8705 ) ) ( not ( = ?auto_8704 ?auto_8707 ) ) ( not ( = ?auto_8704 ?auto_8706 ) ) ( not ( = ?auto_8704 ?auto_8713 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8705 ?auto_8707 ?auto_8706 )
      ( MAKE-4CRATE-VERIFY ?auto_8703 ?auto_8704 ?auto_8705 ?auto_8707 ?auto_8706 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8732 - SURFACE
      ?auto_8733 - SURFACE
      ?auto_8734 - SURFACE
      ?auto_8735 - SURFACE
    )
    :vars
    (
      ?auto_8738 - HOIST
      ?auto_8737 - PLACE
      ?auto_8740 - PLACE
      ?auto_8741 - HOIST
      ?auto_8739 - SURFACE
      ?auto_8736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8738 ?auto_8737 ) ( IS-CRATE ?auto_8735 ) ( not ( = ?auto_8734 ?auto_8735 ) ) ( not ( = ?auto_8733 ?auto_8734 ) ) ( not ( = ?auto_8733 ?auto_8735 ) ) ( not ( = ?auto_8740 ?auto_8737 ) ) ( HOIST-AT ?auto_8741 ?auto_8740 ) ( not ( = ?auto_8738 ?auto_8741 ) ) ( AVAILABLE ?auto_8741 ) ( SURFACE-AT ?auto_8735 ?auto_8740 ) ( ON ?auto_8735 ?auto_8739 ) ( CLEAR ?auto_8735 ) ( not ( = ?auto_8734 ?auto_8739 ) ) ( not ( = ?auto_8735 ?auto_8739 ) ) ( not ( = ?auto_8733 ?auto_8739 ) ) ( SURFACE-AT ?auto_8733 ?auto_8737 ) ( CLEAR ?auto_8733 ) ( IS-CRATE ?auto_8734 ) ( AVAILABLE ?auto_8738 ) ( IN ?auto_8734 ?auto_8736 ) ( TRUCK-AT ?auto_8736 ?auto_8740 ) ( ON ?auto_8733 ?auto_8732 ) ( not ( = ?auto_8732 ?auto_8733 ) ) ( not ( = ?auto_8732 ?auto_8734 ) ) ( not ( = ?auto_8732 ?auto_8735 ) ) ( not ( = ?auto_8732 ?auto_8739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8733 ?auto_8734 ?auto_8735 )
      ( MAKE-3CRATE-VERIFY ?auto_8732 ?auto_8733 ?auto_8734 ?auto_8735 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8742 - SURFACE
      ?auto_8743 - SURFACE
      ?auto_8744 - SURFACE
      ?auto_8746 - SURFACE
      ?auto_8745 - SURFACE
    )
    :vars
    (
      ?auto_8749 - HOIST
      ?auto_8748 - PLACE
      ?auto_8751 - PLACE
      ?auto_8752 - HOIST
      ?auto_8750 - SURFACE
      ?auto_8747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8749 ?auto_8748 ) ( IS-CRATE ?auto_8745 ) ( not ( = ?auto_8746 ?auto_8745 ) ) ( not ( = ?auto_8744 ?auto_8746 ) ) ( not ( = ?auto_8744 ?auto_8745 ) ) ( not ( = ?auto_8751 ?auto_8748 ) ) ( HOIST-AT ?auto_8752 ?auto_8751 ) ( not ( = ?auto_8749 ?auto_8752 ) ) ( AVAILABLE ?auto_8752 ) ( SURFACE-AT ?auto_8745 ?auto_8751 ) ( ON ?auto_8745 ?auto_8750 ) ( CLEAR ?auto_8745 ) ( not ( = ?auto_8746 ?auto_8750 ) ) ( not ( = ?auto_8745 ?auto_8750 ) ) ( not ( = ?auto_8744 ?auto_8750 ) ) ( SURFACE-AT ?auto_8744 ?auto_8748 ) ( CLEAR ?auto_8744 ) ( IS-CRATE ?auto_8746 ) ( AVAILABLE ?auto_8749 ) ( IN ?auto_8746 ?auto_8747 ) ( TRUCK-AT ?auto_8747 ?auto_8751 ) ( ON ?auto_8743 ?auto_8742 ) ( ON ?auto_8744 ?auto_8743 ) ( not ( = ?auto_8742 ?auto_8743 ) ) ( not ( = ?auto_8742 ?auto_8744 ) ) ( not ( = ?auto_8742 ?auto_8746 ) ) ( not ( = ?auto_8742 ?auto_8745 ) ) ( not ( = ?auto_8742 ?auto_8750 ) ) ( not ( = ?auto_8743 ?auto_8744 ) ) ( not ( = ?auto_8743 ?auto_8746 ) ) ( not ( = ?auto_8743 ?auto_8745 ) ) ( not ( = ?auto_8743 ?auto_8750 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8744 ?auto_8746 ?auto_8745 )
      ( MAKE-4CRATE-VERIFY ?auto_8742 ?auto_8743 ?auto_8744 ?auto_8746 ?auto_8745 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8771 - SURFACE
      ?auto_8772 - SURFACE
      ?auto_8773 - SURFACE
      ?auto_8774 - SURFACE
    )
    :vars
    (
      ?auto_8775 - HOIST
      ?auto_8780 - PLACE
      ?auto_8776 - PLACE
      ?auto_8779 - HOIST
      ?auto_8778 - SURFACE
      ?auto_8777 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8775 ?auto_8780 ) ( IS-CRATE ?auto_8774 ) ( not ( = ?auto_8773 ?auto_8774 ) ) ( not ( = ?auto_8772 ?auto_8773 ) ) ( not ( = ?auto_8772 ?auto_8774 ) ) ( not ( = ?auto_8776 ?auto_8780 ) ) ( HOIST-AT ?auto_8779 ?auto_8776 ) ( not ( = ?auto_8775 ?auto_8779 ) ) ( SURFACE-AT ?auto_8774 ?auto_8776 ) ( ON ?auto_8774 ?auto_8778 ) ( CLEAR ?auto_8774 ) ( not ( = ?auto_8773 ?auto_8778 ) ) ( not ( = ?auto_8774 ?auto_8778 ) ) ( not ( = ?auto_8772 ?auto_8778 ) ) ( SURFACE-AT ?auto_8772 ?auto_8780 ) ( CLEAR ?auto_8772 ) ( IS-CRATE ?auto_8773 ) ( AVAILABLE ?auto_8775 ) ( TRUCK-AT ?auto_8777 ?auto_8776 ) ( LIFTING ?auto_8779 ?auto_8773 ) ( ON ?auto_8772 ?auto_8771 ) ( not ( = ?auto_8771 ?auto_8772 ) ) ( not ( = ?auto_8771 ?auto_8773 ) ) ( not ( = ?auto_8771 ?auto_8774 ) ) ( not ( = ?auto_8771 ?auto_8778 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8772 ?auto_8773 ?auto_8774 )
      ( MAKE-3CRATE-VERIFY ?auto_8771 ?auto_8772 ?auto_8773 ?auto_8774 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8781 - SURFACE
      ?auto_8782 - SURFACE
      ?auto_8783 - SURFACE
      ?auto_8785 - SURFACE
      ?auto_8784 - SURFACE
    )
    :vars
    (
      ?auto_8786 - HOIST
      ?auto_8791 - PLACE
      ?auto_8787 - PLACE
      ?auto_8790 - HOIST
      ?auto_8789 - SURFACE
      ?auto_8788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8786 ?auto_8791 ) ( IS-CRATE ?auto_8784 ) ( not ( = ?auto_8785 ?auto_8784 ) ) ( not ( = ?auto_8783 ?auto_8785 ) ) ( not ( = ?auto_8783 ?auto_8784 ) ) ( not ( = ?auto_8787 ?auto_8791 ) ) ( HOIST-AT ?auto_8790 ?auto_8787 ) ( not ( = ?auto_8786 ?auto_8790 ) ) ( SURFACE-AT ?auto_8784 ?auto_8787 ) ( ON ?auto_8784 ?auto_8789 ) ( CLEAR ?auto_8784 ) ( not ( = ?auto_8785 ?auto_8789 ) ) ( not ( = ?auto_8784 ?auto_8789 ) ) ( not ( = ?auto_8783 ?auto_8789 ) ) ( SURFACE-AT ?auto_8783 ?auto_8791 ) ( CLEAR ?auto_8783 ) ( IS-CRATE ?auto_8785 ) ( AVAILABLE ?auto_8786 ) ( TRUCK-AT ?auto_8788 ?auto_8787 ) ( LIFTING ?auto_8790 ?auto_8785 ) ( ON ?auto_8782 ?auto_8781 ) ( ON ?auto_8783 ?auto_8782 ) ( not ( = ?auto_8781 ?auto_8782 ) ) ( not ( = ?auto_8781 ?auto_8783 ) ) ( not ( = ?auto_8781 ?auto_8785 ) ) ( not ( = ?auto_8781 ?auto_8784 ) ) ( not ( = ?auto_8781 ?auto_8789 ) ) ( not ( = ?auto_8782 ?auto_8783 ) ) ( not ( = ?auto_8782 ?auto_8785 ) ) ( not ( = ?auto_8782 ?auto_8784 ) ) ( not ( = ?auto_8782 ?auto_8789 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8783 ?auto_8785 ?auto_8784 )
      ( MAKE-4CRATE-VERIFY ?auto_8781 ?auto_8782 ?auto_8783 ?auto_8785 ?auto_8784 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8812 - SURFACE
      ?auto_8813 - SURFACE
      ?auto_8814 - SURFACE
      ?auto_8815 - SURFACE
    )
    :vars
    (
      ?auto_8816 - HOIST
      ?auto_8818 - PLACE
      ?auto_8820 - PLACE
      ?auto_8821 - HOIST
      ?auto_8819 - SURFACE
      ?auto_8817 - TRUCK
      ?auto_8822 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8816 ?auto_8818 ) ( IS-CRATE ?auto_8815 ) ( not ( = ?auto_8814 ?auto_8815 ) ) ( not ( = ?auto_8813 ?auto_8814 ) ) ( not ( = ?auto_8813 ?auto_8815 ) ) ( not ( = ?auto_8820 ?auto_8818 ) ) ( HOIST-AT ?auto_8821 ?auto_8820 ) ( not ( = ?auto_8816 ?auto_8821 ) ) ( SURFACE-AT ?auto_8815 ?auto_8820 ) ( ON ?auto_8815 ?auto_8819 ) ( CLEAR ?auto_8815 ) ( not ( = ?auto_8814 ?auto_8819 ) ) ( not ( = ?auto_8815 ?auto_8819 ) ) ( not ( = ?auto_8813 ?auto_8819 ) ) ( SURFACE-AT ?auto_8813 ?auto_8818 ) ( CLEAR ?auto_8813 ) ( IS-CRATE ?auto_8814 ) ( AVAILABLE ?auto_8816 ) ( TRUCK-AT ?auto_8817 ?auto_8820 ) ( AVAILABLE ?auto_8821 ) ( SURFACE-AT ?auto_8814 ?auto_8820 ) ( ON ?auto_8814 ?auto_8822 ) ( CLEAR ?auto_8814 ) ( not ( = ?auto_8814 ?auto_8822 ) ) ( not ( = ?auto_8815 ?auto_8822 ) ) ( not ( = ?auto_8813 ?auto_8822 ) ) ( not ( = ?auto_8819 ?auto_8822 ) ) ( ON ?auto_8813 ?auto_8812 ) ( not ( = ?auto_8812 ?auto_8813 ) ) ( not ( = ?auto_8812 ?auto_8814 ) ) ( not ( = ?auto_8812 ?auto_8815 ) ) ( not ( = ?auto_8812 ?auto_8819 ) ) ( not ( = ?auto_8812 ?auto_8822 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8813 ?auto_8814 ?auto_8815 )
      ( MAKE-3CRATE-VERIFY ?auto_8812 ?auto_8813 ?auto_8814 ?auto_8815 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8823 - SURFACE
      ?auto_8824 - SURFACE
      ?auto_8825 - SURFACE
      ?auto_8827 - SURFACE
      ?auto_8826 - SURFACE
    )
    :vars
    (
      ?auto_8828 - HOIST
      ?auto_8830 - PLACE
      ?auto_8832 - PLACE
      ?auto_8833 - HOIST
      ?auto_8831 - SURFACE
      ?auto_8829 - TRUCK
      ?auto_8834 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8828 ?auto_8830 ) ( IS-CRATE ?auto_8826 ) ( not ( = ?auto_8827 ?auto_8826 ) ) ( not ( = ?auto_8825 ?auto_8827 ) ) ( not ( = ?auto_8825 ?auto_8826 ) ) ( not ( = ?auto_8832 ?auto_8830 ) ) ( HOIST-AT ?auto_8833 ?auto_8832 ) ( not ( = ?auto_8828 ?auto_8833 ) ) ( SURFACE-AT ?auto_8826 ?auto_8832 ) ( ON ?auto_8826 ?auto_8831 ) ( CLEAR ?auto_8826 ) ( not ( = ?auto_8827 ?auto_8831 ) ) ( not ( = ?auto_8826 ?auto_8831 ) ) ( not ( = ?auto_8825 ?auto_8831 ) ) ( SURFACE-AT ?auto_8825 ?auto_8830 ) ( CLEAR ?auto_8825 ) ( IS-CRATE ?auto_8827 ) ( AVAILABLE ?auto_8828 ) ( TRUCK-AT ?auto_8829 ?auto_8832 ) ( AVAILABLE ?auto_8833 ) ( SURFACE-AT ?auto_8827 ?auto_8832 ) ( ON ?auto_8827 ?auto_8834 ) ( CLEAR ?auto_8827 ) ( not ( = ?auto_8827 ?auto_8834 ) ) ( not ( = ?auto_8826 ?auto_8834 ) ) ( not ( = ?auto_8825 ?auto_8834 ) ) ( not ( = ?auto_8831 ?auto_8834 ) ) ( ON ?auto_8824 ?auto_8823 ) ( ON ?auto_8825 ?auto_8824 ) ( not ( = ?auto_8823 ?auto_8824 ) ) ( not ( = ?auto_8823 ?auto_8825 ) ) ( not ( = ?auto_8823 ?auto_8827 ) ) ( not ( = ?auto_8823 ?auto_8826 ) ) ( not ( = ?auto_8823 ?auto_8831 ) ) ( not ( = ?auto_8823 ?auto_8834 ) ) ( not ( = ?auto_8824 ?auto_8825 ) ) ( not ( = ?auto_8824 ?auto_8827 ) ) ( not ( = ?auto_8824 ?auto_8826 ) ) ( not ( = ?auto_8824 ?auto_8831 ) ) ( not ( = ?auto_8824 ?auto_8834 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8825 ?auto_8827 ?auto_8826 )
      ( MAKE-4CRATE-VERIFY ?auto_8823 ?auto_8824 ?auto_8825 ?auto_8827 ?auto_8826 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8855 - SURFACE
      ?auto_8856 - SURFACE
      ?auto_8857 - SURFACE
      ?auto_8858 - SURFACE
    )
    :vars
    (
      ?auto_8864 - HOIST
      ?auto_8863 - PLACE
      ?auto_8859 - PLACE
      ?auto_8865 - HOIST
      ?auto_8860 - SURFACE
      ?auto_8861 - SURFACE
      ?auto_8862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8864 ?auto_8863 ) ( IS-CRATE ?auto_8858 ) ( not ( = ?auto_8857 ?auto_8858 ) ) ( not ( = ?auto_8856 ?auto_8857 ) ) ( not ( = ?auto_8856 ?auto_8858 ) ) ( not ( = ?auto_8859 ?auto_8863 ) ) ( HOIST-AT ?auto_8865 ?auto_8859 ) ( not ( = ?auto_8864 ?auto_8865 ) ) ( SURFACE-AT ?auto_8858 ?auto_8859 ) ( ON ?auto_8858 ?auto_8860 ) ( CLEAR ?auto_8858 ) ( not ( = ?auto_8857 ?auto_8860 ) ) ( not ( = ?auto_8858 ?auto_8860 ) ) ( not ( = ?auto_8856 ?auto_8860 ) ) ( SURFACE-AT ?auto_8856 ?auto_8863 ) ( CLEAR ?auto_8856 ) ( IS-CRATE ?auto_8857 ) ( AVAILABLE ?auto_8864 ) ( AVAILABLE ?auto_8865 ) ( SURFACE-AT ?auto_8857 ?auto_8859 ) ( ON ?auto_8857 ?auto_8861 ) ( CLEAR ?auto_8857 ) ( not ( = ?auto_8857 ?auto_8861 ) ) ( not ( = ?auto_8858 ?auto_8861 ) ) ( not ( = ?auto_8856 ?auto_8861 ) ) ( not ( = ?auto_8860 ?auto_8861 ) ) ( TRUCK-AT ?auto_8862 ?auto_8863 ) ( ON ?auto_8856 ?auto_8855 ) ( not ( = ?auto_8855 ?auto_8856 ) ) ( not ( = ?auto_8855 ?auto_8857 ) ) ( not ( = ?auto_8855 ?auto_8858 ) ) ( not ( = ?auto_8855 ?auto_8860 ) ) ( not ( = ?auto_8855 ?auto_8861 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8856 ?auto_8857 ?auto_8858 )
      ( MAKE-3CRATE-VERIFY ?auto_8855 ?auto_8856 ?auto_8857 ?auto_8858 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8866 - SURFACE
      ?auto_8867 - SURFACE
      ?auto_8868 - SURFACE
      ?auto_8870 - SURFACE
      ?auto_8869 - SURFACE
    )
    :vars
    (
      ?auto_8876 - HOIST
      ?auto_8875 - PLACE
      ?auto_8871 - PLACE
      ?auto_8877 - HOIST
      ?auto_8872 - SURFACE
      ?auto_8873 - SURFACE
      ?auto_8874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8876 ?auto_8875 ) ( IS-CRATE ?auto_8869 ) ( not ( = ?auto_8870 ?auto_8869 ) ) ( not ( = ?auto_8868 ?auto_8870 ) ) ( not ( = ?auto_8868 ?auto_8869 ) ) ( not ( = ?auto_8871 ?auto_8875 ) ) ( HOIST-AT ?auto_8877 ?auto_8871 ) ( not ( = ?auto_8876 ?auto_8877 ) ) ( SURFACE-AT ?auto_8869 ?auto_8871 ) ( ON ?auto_8869 ?auto_8872 ) ( CLEAR ?auto_8869 ) ( not ( = ?auto_8870 ?auto_8872 ) ) ( not ( = ?auto_8869 ?auto_8872 ) ) ( not ( = ?auto_8868 ?auto_8872 ) ) ( SURFACE-AT ?auto_8868 ?auto_8875 ) ( CLEAR ?auto_8868 ) ( IS-CRATE ?auto_8870 ) ( AVAILABLE ?auto_8876 ) ( AVAILABLE ?auto_8877 ) ( SURFACE-AT ?auto_8870 ?auto_8871 ) ( ON ?auto_8870 ?auto_8873 ) ( CLEAR ?auto_8870 ) ( not ( = ?auto_8870 ?auto_8873 ) ) ( not ( = ?auto_8869 ?auto_8873 ) ) ( not ( = ?auto_8868 ?auto_8873 ) ) ( not ( = ?auto_8872 ?auto_8873 ) ) ( TRUCK-AT ?auto_8874 ?auto_8875 ) ( ON ?auto_8867 ?auto_8866 ) ( ON ?auto_8868 ?auto_8867 ) ( not ( = ?auto_8866 ?auto_8867 ) ) ( not ( = ?auto_8866 ?auto_8868 ) ) ( not ( = ?auto_8866 ?auto_8870 ) ) ( not ( = ?auto_8866 ?auto_8869 ) ) ( not ( = ?auto_8866 ?auto_8872 ) ) ( not ( = ?auto_8866 ?auto_8873 ) ) ( not ( = ?auto_8867 ?auto_8868 ) ) ( not ( = ?auto_8867 ?auto_8870 ) ) ( not ( = ?auto_8867 ?auto_8869 ) ) ( not ( = ?auto_8867 ?auto_8872 ) ) ( not ( = ?auto_8867 ?auto_8873 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8868 ?auto_8870 ?auto_8869 )
      ( MAKE-4CRATE-VERIFY ?auto_8866 ?auto_8867 ?auto_8868 ?auto_8870 ?auto_8869 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8878 - SURFACE
      ?auto_8879 - SURFACE
    )
    :vars
    (
      ?auto_8886 - HOIST
      ?auto_8885 - PLACE
      ?auto_8884 - SURFACE
      ?auto_8880 - PLACE
      ?auto_8887 - HOIST
      ?auto_8881 - SURFACE
      ?auto_8882 - SURFACE
      ?auto_8883 - TRUCK
      ?auto_8888 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8886 ?auto_8885 ) ( IS-CRATE ?auto_8879 ) ( not ( = ?auto_8878 ?auto_8879 ) ) ( not ( = ?auto_8884 ?auto_8878 ) ) ( not ( = ?auto_8884 ?auto_8879 ) ) ( not ( = ?auto_8880 ?auto_8885 ) ) ( HOIST-AT ?auto_8887 ?auto_8880 ) ( not ( = ?auto_8886 ?auto_8887 ) ) ( SURFACE-AT ?auto_8879 ?auto_8880 ) ( ON ?auto_8879 ?auto_8881 ) ( CLEAR ?auto_8879 ) ( not ( = ?auto_8878 ?auto_8881 ) ) ( not ( = ?auto_8879 ?auto_8881 ) ) ( not ( = ?auto_8884 ?auto_8881 ) ) ( IS-CRATE ?auto_8878 ) ( AVAILABLE ?auto_8887 ) ( SURFACE-AT ?auto_8878 ?auto_8880 ) ( ON ?auto_8878 ?auto_8882 ) ( CLEAR ?auto_8878 ) ( not ( = ?auto_8878 ?auto_8882 ) ) ( not ( = ?auto_8879 ?auto_8882 ) ) ( not ( = ?auto_8884 ?auto_8882 ) ) ( not ( = ?auto_8881 ?auto_8882 ) ) ( TRUCK-AT ?auto_8883 ?auto_8885 ) ( SURFACE-AT ?auto_8888 ?auto_8885 ) ( CLEAR ?auto_8888 ) ( LIFTING ?auto_8886 ?auto_8884 ) ( IS-CRATE ?auto_8884 ) ( not ( = ?auto_8888 ?auto_8884 ) ) ( not ( = ?auto_8878 ?auto_8888 ) ) ( not ( = ?auto_8879 ?auto_8888 ) ) ( not ( = ?auto_8881 ?auto_8888 ) ) ( not ( = ?auto_8882 ?auto_8888 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8888 ?auto_8884 )
      ( MAKE-2CRATE ?auto_8884 ?auto_8878 ?auto_8879 )
      ( MAKE-1CRATE-VERIFY ?auto_8878 ?auto_8879 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8889 - SURFACE
      ?auto_8890 - SURFACE
      ?auto_8891 - SURFACE
    )
    :vars
    (
      ?auto_8892 - HOIST
      ?auto_8897 - PLACE
      ?auto_8895 - PLACE
      ?auto_8896 - HOIST
      ?auto_8899 - SURFACE
      ?auto_8898 - SURFACE
      ?auto_8894 - TRUCK
      ?auto_8893 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8892 ?auto_8897 ) ( IS-CRATE ?auto_8891 ) ( not ( = ?auto_8890 ?auto_8891 ) ) ( not ( = ?auto_8889 ?auto_8890 ) ) ( not ( = ?auto_8889 ?auto_8891 ) ) ( not ( = ?auto_8895 ?auto_8897 ) ) ( HOIST-AT ?auto_8896 ?auto_8895 ) ( not ( = ?auto_8892 ?auto_8896 ) ) ( SURFACE-AT ?auto_8891 ?auto_8895 ) ( ON ?auto_8891 ?auto_8899 ) ( CLEAR ?auto_8891 ) ( not ( = ?auto_8890 ?auto_8899 ) ) ( not ( = ?auto_8891 ?auto_8899 ) ) ( not ( = ?auto_8889 ?auto_8899 ) ) ( IS-CRATE ?auto_8890 ) ( AVAILABLE ?auto_8896 ) ( SURFACE-AT ?auto_8890 ?auto_8895 ) ( ON ?auto_8890 ?auto_8898 ) ( CLEAR ?auto_8890 ) ( not ( = ?auto_8890 ?auto_8898 ) ) ( not ( = ?auto_8891 ?auto_8898 ) ) ( not ( = ?auto_8889 ?auto_8898 ) ) ( not ( = ?auto_8899 ?auto_8898 ) ) ( TRUCK-AT ?auto_8894 ?auto_8897 ) ( SURFACE-AT ?auto_8893 ?auto_8897 ) ( CLEAR ?auto_8893 ) ( LIFTING ?auto_8892 ?auto_8889 ) ( IS-CRATE ?auto_8889 ) ( not ( = ?auto_8893 ?auto_8889 ) ) ( not ( = ?auto_8890 ?auto_8893 ) ) ( not ( = ?auto_8891 ?auto_8893 ) ) ( not ( = ?auto_8899 ?auto_8893 ) ) ( not ( = ?auto_8898 ?auto_8893 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8890 ?auto_8891 )
      ( MAKE-2CRATE-VERIFY ?auto_8889 ?auto_8890 ?auto_8891 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8900 - SURFACE
      ?auto_8901 - SURFACE
      ?auto_8902 - SURFACE
      ?auto_8903 - SURFACE
    )
    :vars
    (
      ?auto_8910 - HOIST
      ?auto_8905 - PLACE
      ?auto_8907 - PLACE
      ?auto_8906 - HOIST
      ?auto_8909 - SURFACE
      ?auto_8908 - SURFACE
      ?auto_8904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8910 ?auto_8905 ) ( IS-CRATE ?auto_8903 ) ( not ( = ?auto_8902 ?auto_8903 ) ) ( not ( = ?auto_8901 ?auto_8902 ) ) ( not ( = ?auto_8901 ?auto_8903 ) ) ( not ( = ?auto_8907 ?auto_8905 ) ) ( HOIST-AT ?auto_8906 ?auto_8907 ) ( not ( = ?auto_8910 ?auto_8906 ) ) ( SURFACE-AT ?auto_8903 ?auto_8907 ) ( ON ?auto_8903 ?auto_8909 ) ( CLEAR ?auto_8903 ) ( not ( = ?auto_8902 ?auto_8909 ) ) ( not ( = ?auto_8903 ?auto_8909 ) ) ( not ( = ?auto_8901 ?auto_8909 ) ) ( IS-CRATE ?auto_8902 ) ( AVAILABLE ?auto_8906 ) ( SURFACE-AT ?auto_8902 ?auto_8907 ) ( ON ?auto_8902 ?auto_8908 ) ( CLEAR ?auto_8902 ) ( not ( = ?auto_8902 ?auto_8908 ) ) ( not ( = ?auto_8903 ?auto_8908 ) ) ( not ( = ?auto_8901 ?auto_8908 ) ) ( not ( = ?auto_8909 ?auto_8908 ) ) ( TRUCK-AT ?auto_8904 ?auto_8905 ) ( SURFACE-AT ?auto_8900 ?auto_8905 ) ( CLEAR ?auto_8900 ) ( LIFTING ?auto_8910 ?auto_8901 ) ( IS-CRATE ?auto_8901 ) ( not ( = ?auto_8900 ?auto_8901 ) ) ( not ( = ?auto_8902 ?auto_8900 ) ) ( not ( = ?auto_8903 ?auto_8900 ) ) ( not ( = ?auto_8909 ?auto_8900 ) ) ( not ( = ?auto_8908 ?auto_8900 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8901 ?auto_8902 ?auto_8903 )
      ( MAKE-3CRATE-VERIFY ?auto_8900 ?auto_8901 ?auto_8902 ?auto_8903 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8911 - SURFACE
      ?auto_8912 - SURFACE
      ?auto_8913 - SURFACE
      ?auto_8915 - SURFACE
      ?auto_8914 - SURFACE
    )
    :vars
    (
      ?auto_8922 - HOIST
      ?auto_8917 - PLACE
      ?auto_8919 - PLACE
      ?auto_8918 - HOIST
      ?auto_8921 - SURFACE
      ?auto_8920 - SURFACE
      ?auto_8916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8922 ?auto_8917 ) ( IS-CRATE ?auto_8914 ) ( not ( = ?auto_8915 ?auto_8914 ) ) ( not ( = ?auto_8913 ?auto_8915 ) ) ( not ( = ?auto_8913 ?auto_8914 ) ) ( not ( = ?auto_8919 ?auto_8917 ) ) ( HOIST-AT ?auto_8918 ?auto_8919 ) ( not ( = ?auto_8922 ?auto_8918 ) ) ( SURFACE-AT ?auto_8914 ?auto_8919 ) ( ON ?auto_8914 ?auto_8921 ) ( CLEAR ?auto_8914 ) ( not ( = ?auto_8915 ?auto_8921 ) ) ( not ( = ?auto_8914 ?auto_8921 ) ) ( not ( = ?auto_8913 ?auto_8921 ) ) ( IS-CRATE ?auto_8915 ) ( AVAILABLE ?auto_8918 ) ( SURFACE-AT ?auto_8915 ?auto_8919 ) ( ON ?auto_8915 ?auto_8920 ) ( CLEAR ?auto_8915 ) ( not ( = ?auto_8915 ?auto_8920 ) ) ( not ( = ?auto_8914 ?auto_8920 ) ) ( not ( = ?auto_8913 ?auto_8920 ) ) ( not ( = ?auto_8921 ?auto_8920 ) ) ( TRUCK-AT ?auto_8916 ?auto_8917 ) ( SURFACE-AT ?auto_8912 ?auto_8917 ) ( CLEAR ?auto_8912 ) ( LIFTING ?auto_8922 ?auto_8913 ) ( IS-CRATE ?auto_8913 ) ( not ( = ?auto_8912 ?auto_8913 ) ) ( not ( = ?auto_8915 ?auto_8912 ) ) ( not ( = ?auto_8914 ?auto_8912 ) ) ( not ( = ?auto_8921 ?auto_8912 ) ) ( not ( = ?auto_8920 ?auto_8912 ) ) ( ON ?auto_8912 ?auto_8911 ) ( not ( = ?auto_8911 ?auto_8912 ) ) ( not ( = ?auto_8911 ?auto_8913 ) ) ( not ( = ?auto_8911 ?auto_8915 ) ) ( not ( = ?auto_8911 ?auto_8914 ) ) ( not ( = ?auto_8911 ?auto_8921 ) ) ( not ( = ?auto_8911 ?auto_8920 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8913 ?auto_8915 ?auto_8914 )
      ( MAKE-4CRATE-VERIFY ?auto_8911 ?auto_8912 ?auto_8913 ?auto_8915 ?auto_8914 ) )
  )

)

