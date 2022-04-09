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
      ?auto_19748 - SURFACE
      ?auto_19749 - SURFACE
    )
    :vars
    (
      ?auto_19750 - HOIST
      ?auto_19751 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19750 ?auto_19751 ) ( SURFACE-AT ?auto_19748 ?auto_19751 ) ( CLEAR ?auto_19748 ) ( LIFTING ?auto_19750 ?auto_19749 ) ( IS-CRATE ?auto_19749 ) ( not ( = ?auto_19748 ?auto_19749 ) ) )
    :subtasks
    ( ( !DROP ?auto_19750 ?auto_19749 ?auto_19748 ?auto_19751 )
      ( MAKE-1CRATE-VERIFY ?auto_19748 ?auto_19749 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19752 - SURFACE
      ?auto_19753 - SURFACE
    )
    :vars
    (
      ?auto_19755 - HOIST
      ?auto_19754 - PLACE
      ?auto_19756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19755 ?auto_19754 ) ( SURFACE-AT ?auto_19752 ?auto_19754 ) ( CLEAR ?auto_19752 ) ( IS-CRATE ?auto_19753 ) ( not ( = ?auto_19752 ?auto_19753 ) ) ( TRUCK-AT ?auto_19756 ?auto_19754 ) ( AVAILABLE ?auto_19755 ) ( IN ?auto_19753 ?auto_19756 ) )
    :subtasks
    ( ( !UNLOAD ?auto_19755 ?auto_19753 ?auto_19756 ?auto_19754 )
      ( MAKE-1CRATE ?auto_19752 ?auto_19753 )
      ( MAKE-1CRATE-VERIFY ?auto_19752 ?auto_19753 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19757 - SURFACE
      ?auto_19758 - SURFACE
    )
    :vars
    (
      ?auto_19759 - HOIST
      ?auto_19761 - PLACE
      ?auto_19760 - TRUCK
      ?auto_19762 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19759 ?auto_19761 ) ( SURFACE-AT ?auto_19757 ?auto_19761 ) ( CLEAR ?auto_19757 ) ( IS-CRATE ?auto_19758 ) ( not ( = ?auto_19757 ?auto_19758 ) ) ( AVAILABLE ?auto_19759 ) ( IN ?auto_19758 ?auto_19760 ) ( TRUCK-AT ?auto_19760 ?auto_19762 ) ( not ( = ?auto_19762 ?auto_19761 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19760 ?auto_19762 ?auto_19761 )
      ( MAKE-1CRATE ?auto_19757 ?auto_19758 )
      ( MAKE-1CRATE-VERIFY ?auto_19757 ?auto_19758 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19763 - SURFACE
      ?auto_19764 - SURFACE
    )
    :vars
    (
      ?auto_19765 - HOIST
      ?auto_19766 - PLACE
      ?auto_19767 - TRUCK
      ?auto_19768 - PLACE
      ?auto_19769 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19765 ?auto_19766 ) ( SURFACE-AT ?auto_19763 ?auto_19766 ) ( CLEAR ?auto_19763 ) ( IS-CRATE ?auto_19764 ) ( not ( = ?auto_19763 ?auto_19764 ) ) ( AVAILABLE ?auto_19765 ) ( TRUCK-AT ?auto_19767 ?auto_19768 ) ( not ( = ?auto_19768 ?auto_19766 ) ) ( HOIST-AT ?auto_19769 ?auto_19768 ) ( LIFTING ?auto_19769 ?auto_19764 ) ( not ( = ?auto_19765 ?auto_19769 ) ) )
    :subtasks
    ( ( !LOAD ?auto_19769 ?auto_19764 ?auto_19767 ?auto_19768 )
      ( MAKE-1CRATE ?auto_19763 ?auto_19764 )
      ( MAKE-1CRATE-VERIFY ?auto_19763 ?auto_19764 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19770 - SURFACE
      ?auto_19771 - SURFACE
    )
    :vars
    (
      ?auto_19773 - HOIST
      ?auto_19775 - PLACE
      ?auto_19774 - TRUCK
      ?auto_19776 - PLACE
      ?auto_19772 - HOIST
      ?auto_19777 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19773 ?auto_19775 ) ( SURFACE-AT ?auto_19770 ?auto_19775 ) ( CLEAR ?auto_19770 ) ( IS-CRATE ?auto_19771 ) ( not ( = ?auto_19770 ?auto_19771 ) ) ( AVAILABLE ?auto_19773 ) ( TRUCK-AT ?auto_19774 ?auto_19776 ) ( not ( = ?auto_19776 ?auto_19775 ) ) ( HOIST-AT ?auto_19772 ?auto_19776 ) ( not ( = ?auto_19773 ?auto_19772 ) ) ( AVAILABLE ?auto_19772 ) ( SURFACE-AT ?auto_19771 ?auto_19776 ) ( ON ?auto_19771 ?auto_19777 ) ( CLEAR ?auto_19771 ) ( not ( = ?auto_19770 ?auto_19777 ) ) ( not ( = ?auto_19771 ?auto_19777 ) ) )
    :subtasks
    ( ( !LIFT ?auto_19772 ?auto_19771 ?auto_19777 ?auto_19776 )
      ( MAKE-1CRATE ?auto_19770 ?auto_19771 )
      ( MAKE-1CRATE-VERIFY ?auto_19770 ?auto_19771 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19778 - SURFACE
      ?auto_19779 - SURFACE
    )
    :vars
    (
      ?auto_19780 - HOIST
      ?auto_19781 - PLACE
      ?auto_19782 - PLACE
      ?auto_19785 - HOIST
      ?auto_19784 - SURFACE
      ?auto_19783 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19780 ?auto_19781 ) ( SURFACE-AT ?auto_19778 ?auto_19781 ) ( CLEAR ?auto_19778 ) ( IS-CRATE ?auto_19779 ) ( not ( = ?auto_19778 ?auto_19779 ) ) ( AVAILABLE ?auto_19780 ) ( not ( = ?auto_19782 ?auto_19781 ) ) ( HOIST-AT ?auto_19785 ?auto_19782 ) ( not ( = ?auto_19780 ?auto_19785 ) ) ( AVAILABLE ?auto_19785 ) ( SURFACE-AT ?auto_19779 ?auto_19782 ) ( ON ?auto_19779 ?auto_19784 ) ( CLEAR ?auto_19779 ) ( not ( = ?auto_19778 ?auto_19784 ) ) ( not ( = ?auto_19779 ?auto_19784 ) ) ( TRUCK-AT ?auto_19783 ?auto_19781 ) )
    :subtasks
    ( ( !DRIVE ?auto_19783 ?auto_19781 ?auto_19782 )
      ( MAKE-1CRATE ?auto_19778 ?auto_19779 )
      ( MAKE-1CRATE-VERIFY ?auto_19778 ?auto_19779 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19791 - SURFACE
      ?auto_19792 - SURFACE
    )
    :vars
    (
      ?auto_19793 - HOIST
      ?auto_19794 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19793 ?auto_19794 ) ( SURFACE-AT ?auto_19791 ?auto_19794 ) ( CLEAR ?auto_19791 ) ( LIFTING ?auto_19793 ?auto_19792 ) ( IS-CRATE ?auto_19792 ) ( not ( = ?auto_19791 ?auto_19792 ) ) )
    :subtasks
    ( ( !DROP ?auto_19793 ?auto_19792 ?auto_19791 ?auto_19794 )
      ( MAKE-1CRATE-VERIFY ?auto_19791 ?auto_19792 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19795 - SURFACE
      ?auto_19796 - SURFACE
      ?auto_19797 - SURFACE
    )
    :vars
    (
      ?auto_19799 - HOIST
      ?auto_19798 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19799 ?auto_19798 ) ( SURFACE-AT ?auto_19796 ?auto_19798 ) ( CLEAR ?auto_19796 ) ( LIFTING ?auto_19799 ?auto_19797 ) ( IS-CRATE ?auto_19797 ) ( not ( = ?auto_19796 ?auto_19797 ) ) ( ON ?auto_19796 ?auto_19795 ) ( not ( = ?auto_19795 ?auto_19796 ) ) ( not ( = ?auto_19795 ?auto_19797 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19796 ?auto_19797 )
      ( MAKE-2CRATE-VERIFY ?auto_19795 ?auto_19796 ?auto_19797 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19800 - SURFACE
      ?auto_19801 - SURFACE
    )
    :vars
    (
      ?auto_19803 - HOIST
      ?auto_19802 - PLACE
      ?auto_19804 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19803 ?auto_19802 ) ( SURFACE-AT ?auto_19800 ?auto_19802 ) ( CLEAR ?auto_19800 ) ( IS-CRATE ?auto_19801 ) ( not ( = ?auto_19800 ?auto_19801 ) ) ( TRUCK-AT ?auto_19804 ?auto_19802 ) ( AVAILABLE ?auto_19803 ) ( IN ?auto_19801 ?auto_19804 ) )
    :subtasks
    ( ( !UNLOAD ?auto_19803 ?auto_19801 ?auto_19804 ?auto_19802 )
      ( MAKE-1CRATE ?auto_19800 ?auto_19801 )
      ( MAKE-1CRATE-VERIFY ?auto_19800 ?auto_19801 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19805 - SURFACE
      ?auto_19806 - SURFACE
      ?auto_19807 - SURFACE
    )
    :vars
    (
      ?auto_19810 - HOIST
      ?auto_19809 - PLACE
      ?auto_19808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19810 ?auto_19809 ) ( SURFACE-AT ?auto_19806 ?auto_19809 ) ( CLEAR ?auto_19806 ) ( IS-CRATE ?auto_19807 ) ( not ( = ?auto_19806 ?auto_19807 ) ) ( TRUCK-AT ?auto_19808 ?auto_19809 ) ( AVAILABLE ?auto_19810 ) ( IN ?auto_19807 ?auto_19808 ) ( ON ?auto_19806 ?auto_19805 ) ( not ( = ?auto_19805 ?auto_19806 ) ) ( not ( = ?auto_19805 ?auto_19807 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19806 ?auto_19807 )
      ( MAKE-2CRATE-VERIFY ?auto_19805 ?auto_19806 ?auto_19807 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19811 - SURFACE
      ?auto_19812 - SURFACE
    )
    :vars
    (
      ?auto_19815 - HOIST
      ?auto_19814 - PLACE
      ?auto_19813 - TRUCK
      ?auto_19816 - SURFACE
      ?auto_19817 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19815 ?auto_19814 ) ( SURFACE-AT ?auto_19811 ?auto_19814 ) ( CLEAR ?auto_19811 ) ( IS-CRATE ?auto_19812 ) ( not ( = ?auto_19811 ?auto_19812 ) ) ( AVAILABLE ?auto_19815 ) ( IN ?auto_19812 ?auto_19813 ) ( ON ?auto_19811 ?auto_19816 ) ( not ( = ?auto_19816 ?auto_19811 ) ) ( not ( = ?auto_19816 ?auto_19812 ) ) ( TRUCK-AT ?auto_19813 ?auto_19817 ) ( not ( = ?auto_19817 ?auto_19814 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19813 ?auto_19817 ?auto_19814 )
      ( MAKE-2CRATE ?auto_19816 ?auto_19811 ?auto_19812 )
      ( MAKE-1CRATE-VERIFY ?auto_19811 ?auto_19812 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19818 - SURFACE
      ?auto_19819 - SURFACE
      ?auto_19820 - SURFACE
    )
    :vars
    (
      ?auto_19823 - HOIST
      ?auto_19822 - PLACE
      ?auto_19821 - TRUCK
      ?auto_19824 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19823 ?auto_19822 ) ( SURFACE-AT ?auto_19819 ?auto_19822 ) ( CLEAR ?auto_19819 ) ( IS-CRATE ?auto_19820 ) ( not ( = ?auto_19819 ?auto_19820 ) ) ( AVAILABLE ?auto_19823 ) ( IN ?auto_19820 ?auto_19821 ) ( ON ?auto_19819 ?auto_19818 ) ( not ( = ?auto_19818 ?auto_19819 ) ) ( not ( = ?auto_19818 ?auto_19820 ) ) ( TRUCK-AT ?auto_19821 ?auto_19824 ) ( not ( = ?auto_19824 ?auto_19822 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19819 ?auto_19820 )
      ( MAKE-2CRATE-VERIFY ?auto_19818 ?auto_19819 ?auto_19820 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19825 - SURFACE
      ?auto_19826 - SURFACE
    )
    :vars
    (
      ?auto_19827 - HOIST
      ?auto_19829 - PLACE
      ?auto_19828 - SURFACE
      ?auto_19831 - TRUCK
      ?auto_19830 - PLACE
      ?auto_19832 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19827 ?auto_19829 ) ( SURFACE-AT ?auto_19825 ?auto_19829 ) ( CLEAR ?auto_19825 ) ( IS-CRATE ?auto_19826 ) ( not ( = ?auto_19825 ?auto_19826 ) ) ( AVAILABLE ?auto_19827 ) ( ON ?auto_19825 ?auto_19828 ) ( not ( = ?auto_19828 ?auto_19825 ) ) ( not ( = ?auto_19828 ?auto_19826 ) ) ( TRUCK-AT ?auto_19831 ?auto_19830 ) ( not ( = ?auto_19830 ?auto_19829 ) ) ( HOIST-AT ?auto_19832 ?auto_19830 ) ( LIFTING ?auto_19832 ?auto_19826 ) ( not ( = ?auto_19827 ?auto_19832 ) ) )
    :subtasks
    ( ( !LOAD ?auto_19832 ?auto_19826 ?auto_19831 ?auto_19830 )
      ( MAKE-2CRATE ?auto_19828 ?auto_19825 ?auto_19826 )
      ( MAKE-1CRATE-VERIFY ?auto_19825 ?auto_19826 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19833 - SURFACE
      ?auto_19834 - SURFACE
      ?auto_19835 - SURFACE
    )
    :vars
    (
      ?auto_19837 - HOIST
      ?auto_19836 - PLACE
      ?auto_19840 - TRUCK
      ?auto_19838 - PLACE
      ?auto_19839 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19837 ?auto_19836 ) ( SURFACE-AT ?auto_19834 ?auto_19836 ) ( CLEAR ?auto_19834 ) ( IS-CRATE ?auto_19835 ) ( not ( = ?auto_19834 ?auto_19835 ) ) ( AVAILABLE ?auto_19837 ) ( ON ?auto_19834 ?auto_19833 ) ( not ( = ?auto_19833 ?auto_19834 ) ) ( not ( = ?auto_19833 ?auto_19835 ) ) ( TRUCK-AT ?auto_19840 ?auto_19838 ) ( not ( = ?auto_19838 ?auto_19836 ) ) ( HOIST-AT ?auto_19839 ?auto_19838 ) ( LIFTING ?auto_19839 ?auto_19835 ) ( not ( = ?auto_19837 ?auto_19839 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19834 ?auto_19835 )
      ( MAKE-2CRATE-VERIFY ?auto_19833 ?auto_19834 ?auto_19835 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19841 - SURFACE
      ?auto_19842 - SURFACE
    )
    :vars
    (
      ?auto_19846 - HOIST
      ?auto_19844 - PLACE
      ?auto_19843 - SURFACE
      ?auto_19847 - TRUCK
      ?auto_19845 - PLACE
      ?auto_19848 - HOIST
      ?auto_19849 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19846 ?auto_19844 ) ( SURFACE-AT ?auto_19841 ?auto_19844 ) ( CLEAR ?auto_19841 ) ( IS-CRATE ?auto_19842 ) ( not ( = ?auto_19841 ?auto_19842 ) ) ( AVAILABLE ?auto_19846 ) ( ON ?auto_19841 ?auto_19843 ) ( not ( = ?auto_19843 ?auto_19841 ) ) ( not ( = ?auto_19843 ?auto_19842 ) ) ( TRUCK-AT ?auto_19847 ?auto_19845 ) ( not ( = ?auto_19845 ?auto_19844 ) ) ( HOIST-AT ?auto_19848 ?auto_19845 ) ( not ( = ?auto_19846 ?auto_19848 ) ) ( AVAILABLE ?auto_19848 ) ( SURFACE-AT ?auto_19842 ?auto_19845 ) ( ON ?auto_19842 ?auto_19849 ) ( CLEAR ?auto_19842 ) ( not ( = ?auto_19841 ?auto_19849 ) ) ( not ( = ?auto_19842 ?auto_19849 ) ) ( not ( = ?auto_19843 ?auto_19849 ) ) )
    :subtasks
    ( ( !LIFT ?auto_19848 ?auto_19842 ?auto_19849 ?auto_19845 )
      ( MAKE-2CRATE ?auto_19843 ?auto_19841 ?auto_19842 )
      ( MAKE-1CRATE-VERIFY ?auto_19841 ?auto_19842 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19850 - SURFACE
      ?auto_19851 - SURFACE
      ?auto_19852 - SURFACE
    )
    :vars
    (
      ?auto_19858 - HOIST
      ?auto_19854 - PLACE
      ?auto_19856 - TRUCK
      ?auto_19855 - PLACE
      ?auto_19853 - HOIST
      ?auto_19857 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19858 ?auto_19854 ) ( SURFACE-AT ?auto_19851 ?auto_19854 ) ( CLEAR ?auto_19851 ) ( IS-CRATE ?auto_19852 ) ( not ( = ?auto_19851 ?auto_19852 ) ) ( AVAILABLE ?auto_19858 ) ( ON ?auto_19851 ?auto_19850 ) ( not ( = ?auto_19850 ?auto_19851 ) ) ( not ( = ?auto_19850 ?auto_19852 ) ) ( TRUCK-AT ?auto_19856 ?auto_19855 ) ( not ( = ?auto_19855 ?auto_19854 ) ) ( HOIST-AT ?auto_19853 ?auto_19855 ) ( not ( = ?auto_19858 ?auto_19853 ) ) ( AVAILABLE ?auto_19853 ) ( SURFACE-AT ?auto_19852 ?auto_19855 ) ( ON ?auto_19852 ?auto_19857 ) ( CLEAR ?auto_19852 ) ( not ( = ?auto_19851 ?auto_19857 ) ) ( not ( = ?auto_19852 ?auto_19857 ) ) ( not ( = ?auto_19850 ?auto_19857 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19851 ?auto_19852 )
      ( MAKE-2CRATE-VERIFY ?auto_19850 ?auto_19851 ?auto_19852 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19859 - SURFACE
      ?auto_19860 - SURFACE
    )
    :vars
    (
      ?auto_19867 - HOIST
      ?auto_19864 - PLACE
      ?auto_19861 - SURFACE
      ?auto_19866 - PLACE
      ?auto_19863 - HOIST
      ?auto_19865 - SURFACE
      ?auto_19862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19867 ?auto_19864 ) ( SURFACE-AT ?auto_19859 ?auto_19864 ) ( CLEAR ?auto_19859 ) ( IS-CRATE ?auto_19860 ) ( not ( = ?auto_19859 ?auto_19860 ) ) ( AVAILABLE ?auto_19867 ) ( ON ?auto_19859 ?auto_19861 ) ( not ( = ?auto_19861 ?auto_19859 ) ) ( not ( = ?auto_19861 ?auto_19860 ) ) ( not ( = ?auto_19866 ?auto_19864 ) ) ( HOIST-AT ?auto_19863 ?auto_19866 ) ( not ( = ?auto_19867 ?auto_19863 ) ) ( AVAILABLE ?auto_19863 ) ( SURFACE-AT ?auto_19860 ?auto_19866 ) ( ON ?auto_19860 ?auto_19865 ) ( CLEAR ?auto_19860 ) ( not ( = ?auto_19859 ?auto_19865 ) ) ( not ( = ?auto_19860 ?auto_19865 ) ) ( not ( = ?auto_19861 ?auto_19865 ) ) ( TRUCK-AT ?auto_19862 ?auto_19864 ) )
    :subtasks
    ( ( !DRIVE ?auto_19862 ?auto_19864 ?auto_19866 )
      ( MAKE-2CRATE ?auto_19861 ?auto_19859 ?auto_19860 )
      ( MAKE-1CRATE-VERIFY ?auto_19859 ?auto_19860 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19868 - SURFACE
      ?auto_19869 - SURFACE
      ?auto_19870 - SURFACE
    )
    :vars
    (
      ?auto_19872 - HOIST
      ?auto_19875 - PLACE
      ?auto_19874 - PLACE
      ?auto_19871 - HOIST
      ?auto_19876 - SURFACE
      ?auto_19873 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19872 ?auto_19875 ) ( SURFACE-AT ?auto_19869 ?auto_19875 ) ( CLEAR ?auto_19869 ) ( IS-CRATE ?auto_19870 ) ( not ( = ?auto_19869 ?auto_19870 ) ) ( AVAILABLE ?auto_19872 ) ( ON ?auto_19869 ?auto_19868 ) ( not ( = ?auto_19868 ?auto_19869 ) ) ( not ( = ?auto_19868 ?auto_19870 ) ) ( not ( = ?auto_19874 ?auto_19875 ) ) ( HOIST-AT ?auto_19871 ?auto_19874 ) ( not ( = ?auto_19872 ?auto_19871 ) ) ( AVAILABLE ?auto_19871 ) ( SURFACE-AT ?auto_19870 ?auto_19874 ) ( ON ?auto_19870 ?auto_19876 ) ( CLEAR ?auto_19870 ) ( not ( = ?auto_19869 ?auto_19876 ) ) ( not ( = ?auto_19870 ?auto_19876 ) ) ( not ( = ?auto_19868 ?auto_19876 ) ) ( TRUCK-AT ?auto_19873 ?auto_19875 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19869 ?auto_19870 )
      ( MAKE-2CRATE-VERIFY ?auto_19868 ?auto_19869 ?auto_19870 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19877 - SURFACE
      ?auto_19878 - SURFACE
    )
    :vars
    (
      ?auto_19884 - HOIST
      ?auto_19882 - PLACE
      ?auto_19883 - SURFACE
      ?auto_19880 - PLACE
      ?auto_19881 - HOIST
      ?auto_19879 - SURFACE
      ?auto_19885 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19884 ?auto_19882 ) ( IS-CRATE ?auto_19878 ) ( not ( = ?auto_19877 ?auto_19878 ) ) ( not ( = ?auto_19883 ?auto_19877 ) ) ( not ( = ?auto_19883 ?auto_19878 ) ) ( not ( = ?auto_19880 ?auto_19882 ) ) ( HOIST-AT ?auto_19881 ?auto_19880 ) ( not ( = ?auto_19884 ?auto_19881 ) ) ( AVAILABLE ?auto_19881 ) ( SURFACE-AT ?auto_19878 ?auto_19880 ) ( ON ?auto_19878 ?auto_19879 ) ( CLEAR ?auto_19878 ) ( not ( = ?auto_19877 ?auto_19879 ) ) ( not ( = ?auto_19878 ?auto_19879 ) ) ( not ( = ?auto_19883 ?auto_19879 ) ) ( TRUCK-AT ?auto_19885 ?auto_19882 ) ( SURFACE-AT ?auto_19883 ?auto_19882 ) ( CLEAR ?auto_19883 ) ( LIFTING ?auto_19884 ?auto_19877 ) ( IS-CRATE ?auto_19877 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19883 ?auto_19877 )
      ( MAKE-2CRATE ?auto_19883 ?auto_19877 ?auto_19878 )
      ( MAKE-1CRATE-VERIFY ?auto_19877 ?auto_19878 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19886 - SURFACE
      ?auto_19887 - SURFACE
      ?auto_19888 - SURFACE
    )
    :vars
    (
      ?auto_19894 - HOIST
      ?auto_19891 - PLACE
      ?auto_19893 - PLACE
      ?auto_19890 - HOIST
      ?auto_19889 - SURFACE
      ?auto_19892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19894 ?auto_19891 ) ( IS-CRATE ?auto_19888 ) ( not ( = ?auto_19887 ?auto_19888 ) ) ( not ( = ?auto_19886 ?auto_19887 ) ) ( not ( = ?auto_19886 ?auto_19888 ) ) ( not ( = ?auto_19893 ?auto_19891 ) ) ( HOIST-AT ?auto_19890 ?auto_19893 ) ( not ( = ?auto_19894 ?auto_19890 ) ) ( AVAILABLE ?auto_19890 ) ( SURFACE-AT ?auto_19888 ?auto_19893 ) ( ON ?auto_19888 ?auto_19889 ) ( CLEAR ?auto_19888 ) ( not ( = ?auto_19887 ?auto_19889 ) ) ( not ( = ?auto_19888 ?auto_19889 ) ) ( not ( = ?auto_19886 ?auto_19889 ) ) ( TRUCK-AT ?auto_19892 ?auto_19891 ) ( SURFACE-AT ?auto_19886 ?auto_19891 ) ( CLEAR ?auto_19886 ) ( LIFTING ?auto_19894 ?auto_19887 ) ( IS-CRATE ?auto_19887 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19887 ?auto_19888 )
      ( MAKE-2CRATE-VERIFY ?auto_19886 ?auto_19887 ?auto_19888 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19895 - SURFACE
      ?auto_19896 - SURFACE
    )
    :vars
    (
      ?auto_19900 - HOIST
      ?auto_19898 - PLACE
      ?auto_19902 - SURFACE
      ?auto_19897 - PLACE
      ?auto_19901 - HOIST
      ?auto_19899 - SURFACE
      ?auto_19903 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19900 ?auto_19898 ) ( IS-CRATE ?auto_19896 ) ( not ( = ?auto_19895 ?auto_19896 ) ) ( not ( = ?auto_19902 ?auto_19895 ) ) ( not ( = ?auto_19902 ?auto_19896 ) ) ( not ( = ?auto_19897 ?auto_19898 ) ) ( HOIST-AT ?auto_19901 ?auto_19897 ) ( not ( = ?auto_19900 ?auto_19901 ) ) ( AVAILABLE ?auto_19901 ) ( SURFACE-AT ?auto_19896 ?auto_19897 ) ( ON ?auto_19896 ?auto_19899 ) ( CLEAR ?auto_19896 ) ( not ( = ?auto_19895 ?auto_19899 ) ) ( not ( = ?auto_19896 ?auto_19899 ) ) ( not ( = ?auto_19902 ?auto_19899 ) ) ( TRUCK-AT ?auto_19903 ?auto_19898 ) ( SURFACE-AT ?auto_19902 ?auto_19898 ) ( CLEAR ?auto_19902 ) ( IS-CRATE ?auto_19895 ) ( AVAILABLE ?auto_19900 ) ( IN ?auto_19895 ?auto_19903 ) )
    :subtasks
    ( ( !UNLOAD ?auto_19900 ?auto_19895 ?auto_19903 ?auto_19898 )
      ( MAKE-2CRATE ?auto_19902 ?auto_19895 ?auto_19896 )
      ( MAKE-1CRATE-VERIFY ?auto_19895 ?auto_19896 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19904 - SURFACE
      ?auto_19905 - SURFACE
      ?auto_19906 - SURFACE
    )
    :vars
    (
      ?auto_19912 - HOIST
      ?auto_19908 - PLACE
      ?auto_19907 - PLACE
      ?auto_19910 - HOIST
      ?auto_19911 - SURFACE
      ?auto_19909 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19912 ?auto_19908 ) ( IS-CRATE ?auto_19906 ) ( not ( = ?auto_19905 ?auto_19906 ) ) ( not ( = ?auto_19904 ?auto_19905 ) ) ( not ( = ?auto_19904 ?auto_19906 ) ) ( not ( = ?auto_19907 ?auto_19908 ) ) ( HOIST-AT ?auto_19910 ?auto_19907 ) ( not ( = ?auto_19912 ?auto_19910 ) ) ( AVAILABLE ?auto_19910 ) ( SURFACE-AT ?auto_19906 ?auto_19907 ) ( ON ?auto_19906 ?auto_19911 ) ( CLEAR ?auto_19906 ) ( not ( = ?auto_19905 ?auto_19911 ) ) ( not ( = ?auto_19906 ?auto_19911 ) ) ( not ( = ?auto_19904 ?auto_19911 ) ) ( TRUCK-AT ?auto_19909 ?auto_19908 ) ( SURFACE-AT ?auto_19904 ?auto_19908 ) ( CLEAR ?auto_19904 ) ( IS-CRATE ?auto_19905 ) ( AVAILABLE ?auto_19912 ) ( IN ?auto_19905 ?auto_19909 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19905 ?auto_19906 )
      ( MAKE-2CRATE-VERIFY ?auto_19904 ?auto_19905 ?auto_19906 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19913 - SURFACE
      ?auto_19914 - SURFACE
    )
    :vars
    (
      ?auto_19921 - HOIST
      ?auto_19917 - PLACE
      ?auto_19915 - SURFACE
      ?auto_19919 - PLACE
      ?auto_19916 - HOIST
      ?auto_19918 - SURFACE
      ?auto_19920 - TRUCK
      ?auto_19922 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19921 ?auto_19917 ) ( IS-CRATE ?auto_19914 ) ( not ( = ?auto_19913 ?auto_19914 ) ) ( not ( = ?auto_19915 ?auto_19913 ) ) ( not ( = ?auto_19915 ?auto_19914 ) ) ( not ( = ?auto_19919 ?auto_19917 ) ) ( HOIST-AT ?auto_19916 ?auto_19919 ) ( not ( = ?auto_19921 ?auto_19916 ) ) ( AVAILABLE ?auto_19916 ) ( SURFACE-AT ?auto_19914 ?auto_19919 ) ( ON ?auto_19914 ?auto_19918 ) ( CLEAR ?auto_19914 ) ( not ( = ?auto_19913 ?auto_19918 ) ) ( not ( = ?auto_19914 ?auto_19918 ) ) ( not ( = ?auto_19915 ?auto_19918 ) ) ( SURFACE-AT ?auto_19915 ?auto_19917 ) ( CLEAR ?auto_19915 ) ( IS-CRATE ?auto_19913 ) ( AVAILABLE ?auto_19921 ) ( IN ?auto_19913 ?auto_19920 ) ( TRUCK-AT ?auto_19920 ?auto_19922 ) ( not ( = ?auto_19922 ?auto_19917 ) ) ( not ( = ?auto_19919 ?auto_19922 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19920 ?auto_19922 ?auto_19917 )
      ( MAKE-2CRATE ?auto_19915 ?auto_19913 ?auto_19914 )
      ( MAKE-1CRATE-VERIFY ?auto_19913 ?auto_19914 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19923 - SURFACE
      ?auto_19924 - SURFACE
      ?auto_19925 - SURFACE
    )
    :vars
    (
      ?auto_19926 - HOIST
      ?auto_19928 - PLACE
      ?auto_19932 - PLACE
      ?auto_19931 - HOIST
      ?auto_19930 - SURFACE
      ?auto_19927 - TRUCK
      ?auto_19929 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19926 ?auto_19928 ) ( IS-CRATE ?auto_19925 ) ( not ( = ?auto_19924 ?auto_19925 ) ) ( not ( = ?auto_19923 ?auto_19924 ) ) ( not ( = ?auto_19923 ?auto_19925 ) ) ( not ( = ?auto_19932 ?auto_19928 ) ) ( HOIST-AT ?auto_19931 ?auto_19932 ) ( not ( = ?auto_19926 ?auto_19931 ) ) ( AVAILABLE ?auto_19931 ) ( SURFACE-AT ?auto_19925 ?auto_19932 ) ( ON ?auto_19925 ?auto_19930 ) ( CLEAR ?auto_19925 ) ( not ( = ?auto_19924 ?auto_19930 ) ) ( not ( = ?auto_19925 ?auto_19930 ) ) ( not ( = ?auto_19923 ?auto_19930 ) ) ( SURFACE-AT ?auto_19923 ?auto_19928 ) ( CLEAR ?auto_19923 ) ( IS-CRATE ?auto_19924 ) ( AVAILABLE ?auto_19926 ) ( IN ?auto_19924 ?auto_19927 ) ( TRUCK-AT ?auto_19927 ?auto_19929 ) ( not ( = ?auto_19929 ?auto_19928 ) ) ( not ( = ?auto_19932 ?auto_19929 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19924 ?auto_19925 )
      ( MAKE-2CRATE-VERIFY ?auto_19923 ?auto_19924 ?auto_19925 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19933 - SURFACE
      ?auto_19934 - SURFACE
    )
    :vars
    (
      ?auto_19940 - HOIST
      ?auto_19939 - PLACE
      ?auto_19935 - SURFACE
      ?auto_19938 - PLACE
      ?auto_19936 - HOIST
      ?auto_19942 - SURFACE
      ?auto_19941 - TRUCK
      ?auto_19937 - PLACE
      ?auto_19943 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19940 ?auto_19939 ) ( IS-CRATE ?auto_19934 ) ( not ( = ?auto_19933 ?auto_19934 ) ) ( not ( = ?auto_19935 ?auto_19933 ) ) ( not ( = ?auto_19935 ?auto_19934 ) ) ( not ( = ?auto_19938 ?auto_19939 ) ) ( HOIST-AT ?auto_19936 ?auto_19938 ) ( not ( = ?auto_19940 ?auto_19936 ) ) ( AVAILABLE ?auto_19936 ) ( SURFACE-AT ?auto_19934 ?auto_19938 ) ( ON ?auto_19934 ?auto_19942 ) ( CLEAR ?auto_19934 ) ( not ( = ?auto_19933 ?auto_19942 ) ) ( not ( = ?auto_19934 ?auto_19942 ) ) ( not ( = ?auto_19935 ?auto_19942 ) ) ( SURFACE-AT ?auto_19935 ?auto_19939 ) ( CLEAR ?auto_19935 ) ( IS-CRATE ?auto_19933 ) ( AVAILABLE ?auto_19940 ) ( TRUCK-AT ?auto_19941 ?auto_19937 ) ( not ( = ?auto_19937 ?auto_19939 ) ) ( not ( = ?auto_19938 ?auto_19937 ) ) ( HOIST-AT ?auto_19943 ?auto_19937 ) ( LIFTING ?auto_19943 ?auto_19933 ) ( not ( = ?auto_19940 ?auto_19943 ) ) ( not ( = ?auto_19936 ?auto_19943 ) ) )
    :subtasks
    ( ( !LOAD ?auto_19943 ?auto_19933 ?auto_19941 ?auto_19937 )
      ( MAKE-2CRATE ?auto_19935 ?auto_19933 ?auto_19934 )
      ( MAKE-1CRATE-VERIFY ?auto_19933 ?auto_19934 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19944 - SURFACE
      ?auto_19945 - SURFACE
      ?auto_19946 - SURFACE
    )
    :vars
    (
      ?auto_19952 - HOIST
      ?auto_19950 - PLACE
      ?auto_19948 - PLACE
      ?auto_19949 - HOIST
      ?auto_19954 - SURFACE
      ?auto_19951 - TRUCK
      ?auto_19953 - PLACE
      ?auto_19947 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19952 ?auto_19950 ) ( IS-CRATE ?auto_19946 ) ( not ( = ?auto_19945 ?auto_19946 ) ) ( not ( = ?auto_19944 ?auto_19945 ) ) ( not ( = ?auto_19944 ?auto_19946 ) ) ( not ( = ?auto_19948 ?auto_19950 ) ) ( HOIST-AT ?auto_19949 ?auto_19948 ) ( not ( = ?auto_19952 ?auto_19949 ) ) ( AVAILABLE ?auto_19949 ) ( SURFACE-AT ?auto_19946 ?auto_19948 ) ( ON ?auto_19946 ?auto_19954 ) ( CLEAR ?auto_19946 ) ( not ( = ?auto_19945 ?auto_19954 ) ) ( not ( = ?auto_19946 ?auto_19954 ) ) ( not ( = ?auto_19944 ?auto_19954 ) ) ( SURFACE-AT ?auto_19944 ?auto_19950 ) ( CLEAR ?auto_19944 ) ( IS-CRATE ?auto_19945 ) ( AVAILABLE ?auto_19952 ) ( TRUCK-AT ?auto_19951 ?auto_19953 ) ( not ( = ?auto_19953 ?auto_19950 ) ) ( not ( = ?auto_19948 ?auto_19953 ) ) ( HOIST-AT ?auto_19947 ?auto_19953 ) ( LIFTING ?auto_19947 ?auto_19945 ) ( not ( = ?auto_19952 ?auto_19947 ) ) ( not ( = ?auto_19949 ?auto_19947 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19945 ?auto_19946 )
      ( MAKE-2CRATE-VERIFY ?auto_19944 ?auto_19945 ?auto_19946 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19955 - SURFACE
      ?auto_19956 - SURFACE
    )
    :vars
    (
      ?auto_19957 - HOIST
      ?auto_19963 - PLACE
      ?auto_19960 - SURFACE
      ?auto_19961 - PLACE
      ?auto_19962 - HOIST
      ?auto_19958 - SURFACE
      ?auto_19965 - TRUCK
      ?auto_19959 - PLACE
      ?auto_19964 - HOIST
      ?auto_19966 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19957 ?auto_19963 ) ( IS-CRATE ?auto_19956 ) ( not ( = ?auto_19955 ?auto_19956 ) ) ( not ( = ?auto_19960 ?auto_19955 ) ) ( not ( = ?auto_19960 ?auto_19956 ) ) ( not ( = ?auto_19961 ?auto_19963 ) ) ( HOIST-AT ?auto_19962 ?auto_19961 ) ( not ( = ?auto_19957 ?auto_19962 ) ) ( AVAILABLE ?auto_19962 ) ( SURFACE-AT ?auto_19956 ?auto_19961 ) ( ON ?auto_19956 ?auto_19958 ) ( CLEAR ?auto_19956 ) ( not ( = ?auto_19955 ?auto_19958 ) ) ( not ( = ?auto_19956 ?auto_19958 ) ) ( not ( = ?auto_19960 ?auto_19958 ) ) ( SURFACE-AT ?auto_19960 ?auto_19963 ) ( CLEAR ?auto_19960 ) ( IS-CRATE ?auto_19955 ) ( AVAILABLE ?auto_19957 ) ( TRUCK-AT ?auto_19965 ?auto_19959 ) ( not ( = ?auto_19959 ?auto_19963 ) ) ( not ( = ?auto_19961 ?auto_19959 ) ) ( HOIST-AT ?auto_19964 ?auto_19959 ) ( not ( = ?auto_19957 ?auto_19964 ) ) ( not ( = ?auto_19962 ?auto_19964 ) ) ( AVAILABLE ?auto_19964 ) ( SURFACE-AT ?auto_19955 ?auto_19959 ) ( ON ?auto_19955 ?auto_19966 ) ( CLEAR ?auto_19955 ) ( not ( = ?auto_19955 ?auto_19966 ) ) ( not ( = ?auto_19956 ?auto_19966 ) ) ( not ( = ?auto_19960 ?auto_19966 ) ) ( not ( = ?auto_19958 ?auto_19966 ) ) )
    :subtasks
    ( ( !LIFT ?auto_19964 ?auto_19955 ?auto_19966 ?auto_19959 )
      ( MAKE-2CRATE ?auto_19960 ?auto_19955 ?auto_19956 )
      ( MAKE-1CRATE-VERIFY ?auto_19955 ?auto_19956 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19967 - SURFACE
      ?auto_19968 - SURFACE
      ?auto_19969 - SURFACE
    )
    :vars
    (
      ?auto_19973 - HOIST
      ?auto_19971 - PLACE
      ?auto_19977 - PLACE
      ?auto_19978 - HOIST
      ?auto_19972 - SURFACE
      ?auto_19974 - TRUCK
      ?auto_19975 - PLACE
      ?auto_19970 - HOIST
      ?auto_19976 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19973 ?auto_19971 ) ( IS-CRATE ?auto_19969 ) ( not ( = ?auto_19968 ?auto_19969 ) ) ( not ( = ?auto_19967 ?auto_19968 ) ) ( not ( = ?auto_19967 ?auto_19969 ) ) ( not ( = ?auto_19977 ?auto_19971 ) ) ( HOIST-AT ?auto_19978 ?auto_19977 ) ( not ( = ?auto_19973 ?auto_19978 ) ) ( AVAILABLE ?auto_19978 ) ( SURFACE-AT ?auto_19969 ?auto_19977 ) ( ON ?auto_19969 ?auto_19972 ) ( CLEAR ?auto_19969 ) ( not ( = ?auto_19968 ?auto_19972 ) ) ( not ( = ?auto_19969 ?auto_19972 ) ) ( not ( = ?auto_19967 ?auto_19972 ) ) ( SURFACE-AT ?auto_19967 ?auto_19971 ) ( CLEAR ?auto_19967 ) ( IS-CRATE ?auto_19968 ) ( AVAILABLE ?auto_19973 ) ( TRUCK-AT ?auto_19974 ?auto_19975 ) ( not ( = ?auto_19975 ?auto_19971 ) ) ( not ( = ?auto_19977 ?auto_19975 ) ) ( HOIST-AT ?auto_19970 ?auto_19975 ) ( not ( = ?auto_19973 ?auto_19970 ) ) ( not ( = ?auto_19978 ?auto_19970 ) ) ( AVAILABLE ?auto_19970 ) ( SURFACE-AT ?auto_19968 ?auto_19975 ) ( ON ?auto_19968 ?auto_19976 ) ( CLEAR ?auto_19968 ) ( not ( = ?auto_19968 ?auto_19976 ) ) ( not ( = ?auto_19969 ?auto_19976 ) ) ( not ( = ?auto_19967 ?auto_19976 ) ) ( not ( = ?auto_19972 ?auto_19976 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19968 ?auto_19969 )
      ( MAKE-2CRATE-VERIFY ?auto_19967 ?auto_19968 ?auto_19969 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19979 - SURFACE
      ?auto_19980 - SURFACE
    )
    :vars
    (
      ?auto_19987 - HOIST
      ?auto_19981 - PLACE
      ?auto_19986 - SURFACE
      ?auto_19984 - PLACE
      ?auto_19985 - HOIST
      ?auto_19982 - SURFACE
      ?auto_19983 - PLACE
      ?auto_19990 - HOIST
      ?auto_19989 - SURFACE
      ?auto_19988 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19987 ?auto_19981 ) ( IS-CRATE ?auto_19980 ) ( not ( = ?auto_19979 ?auto_19980 ) ) ( not ( = ?auto_19986 ?auto_19979 ) ) ( not ( = ?auto_19986 ?auto_19980 ) ) ( not ( = ?auto_19984 ?auto_19981 ) ) ( HOIST-AT ?auto_19985 ?auto_19984 ) ( not ( = ?auto_19987 ?auto_19985 ) ) ( AVAILABLE ?auto_19985 ) ( SURFACE-AT ?auto_19980 ?auto_19984 ) ( ON ?auto_19980 ?auto_19982 ) ( CLEAR ?auto_19980 ) ( not ( = ?auto_19979 ?auto_19982 ) ) ( not ( = ?auto_19980 ?auto_19982 ) ) ( not ( = ?auto_19986 ?auto_19982 ) ) ( SURFACE-AT ?auto_19986 ?auto_19981 ) ( CLEAR ?auto_19986 ) ( IS-CRATE ?auto_19979 ) ( AVAILABLE ?auto_19987 ) ( not ( = ?auto_19983 ?auto_19981 ) ) ( not ( = ?auto_19984 ?auto_19983 ) ) ( HOIST-AT ?auto_19990 ?auto_19983 ) ( not ( = ?auto_19987 ?auto_19990 ) ) ( not ( = ?auto_19985 ?auto_19990 ) ) ( AVAILABLE ?auto_19990 ) ( SURFACE-AT ?auto_19979 ?auto_19983 ) ( ON ?auto_19979 ?auto_19989 ) ( CLEAR ?auto_19979 ) ( not ( = ?auto_19979 ?auto_19989 ) ) ( not ( = ?auto_19980 ?auto_19989 ) ) ( not ( = ?auto_19986 ?auto_19989 ) ) ( not ( = ?auto_19982 ?auto_19989 ) ) ( TRUCK-AT ?auto_19988 ?auto_19981 ) )
    :subtasks
    ( ( !DRIVE ?auto_19988 ?auto_19981 ?auto_19983 )
      ( MAKE-2CRATE ?auto_19986 ?auto_19979 ?auto_19980 )
      ( MAKE-1CRATE-VERIFY ?auto_19979 ?auto_19980 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19991 - SURFACE
      ?auto_19992 - SURFACE
      ?auto_19993 - SURFACE
    )
    :vars
    (
      ?auto_20000 - HOIST
      ?auto_19996 - PLACE
      ?auto_19999 - PLACE
      ?auto_19997 - HOIST
      ?auto_20001 - SURFACE
      ?auto_19995 - PLACE
      ?auto_19994 - HOIST
      ?auto_20002 - SURFACE
      ?auto_19998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20000 ?auto_19996 ) ( IS-CRATE ?auto_19993 ) ( not ( = ?auto_19992 ?auto_19993 ) ) ( not ( = ?auto_19991 ?auto_19992 ) ) ( not ( = ?auto_19991 ?auto_19993 ) ) ( not ( = ?auto_19999 ?auto_19996 ) ) ( HOIST-AT ?auto_19997 ?auto_19999 ) ( not ( = ?auto_20000 ?auto_19997 ) ) ( AVAILABLE ?auto_19997 ) ( SURFACE-AT ?auto_19993 ?auto_19999 ) ( ON ?auto_19993 ?auto_20001 ) ( CLEAR ?auto_19993 ) ( not ( = ?auto_19992 ?auto_20001 ) ) ( not ( = ?auto_19993 ?auto_20001 ) ) ( not ( = ?auto_19991 ?auto_20001 ) ) ( SURFACE-AT ?auto_19991 ?auto_19996 ) ( CLEAR ?auto_19991 ) ( IS-CRATE ?auto_19992 ) ( AVAILABLE ?auto_20000 ) ( not ( = ?auto_19995 ?auto_19996 ) ) ( not ( = ?auto_19999 ?auto_19995 ) ) ( HOIST-AT ?auto_19994 ?auto_19995 ) ( not ( = ?auto_20000 ?auto_19994 ) ) ( not ( = ?auto_19997 ?auto_19994 ) ) ( AVAILABLE ?auto_19994 ) ( SURFACE-AT ?auto_19992 ?auto_19995 ) ( ON ?auto_19992 ?auto_20002 ) ( CLEAR ?auto_19992 ) ( not ( = ?auto_19992 ?auto_20002 ) ) ( not ( = ?auto_19993 ?auto_20002 ) ) ( not ( = ?auto_19991 ?auto_20002 ) ) ( not ( = ?auto_20001 ?auto_20002 ) ) ( TRUCK-AT ?auto_19998 ?auto_19996 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19992 ?auto_19993 )
      ( MAKE-2CRATE-VERIFY ?auto_19991 ?auto_19992 ?auto_19993 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20012 - SURFACE
      ?auto_20013 - SURFACE
    )
    :vars
    (
      ?auto_20014 - HOIST
      ?auto_20015 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20014 ?auto_20015 ) ( SURFACE-AT ?auto_20012 ?auto_20015 ) ( CLEAR ?auto_20012 ) ( LIFTING ?auto_20014 ?auto_20013 ) ( IS-CRATE ?auto_20013 ) ( not ( = ?auto_20012 ?auto_20013 ) ) )
    :subtasks
    ( ( !DROP ?auto_20014 ?auto_20013 ?auto_20012 ?auto_20015 )
      ( MAKE-1CRATE-VERIFY ?auto_20012 ?auto_20013 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20016 - SURFACE
      ?auto_20017 - SURFACE
      ?auto_20018 - SURFACE
    )
    :vars
    (
      ?auto_20019 - HOIST
      ?auto_20020 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20019 ?auto_20020 ) ( SURFACE-AT ?auto_20017 ?auto_20020 ) ( CLEAR ?auto_20017 ) ( LIFTING ?auto_20019 ?auto_20018 ) ( IS-CRATE ?auto_20018 ) ( not ( = ?auto_20017 ?auto_20018 ) ) ( ON ?auto_20017 ?auto_20016 ) ( not ( = ?auto_20016 ?auto_20017 ) ) ( not ( = ?auto_20016 ?auto_20018 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20017 ?auto_20018 )
      ( MAKE-2CRATE-VERIFY ?auto_20016 ?auto_20017 ?auto_20018 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20021 - SURFACE
      ?auto_20022 - SURFACE
      ?auto_20023 - SURFACE
      ?auto_20024 - SURFACE
    )
    :vars
    (
      ?auto_20025 - HOIST
      ?auto_20026 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20025 ?auto_20026 ) ( SURFACE-AT ?auto_20023 ?auto_20026 ) ( CLEAR ?auto_20023 ) ( LIFTING ?auto_20025 ?auto_20024 ) ( IS-CRATE ?auto_20024 ) ( not ( = ?auto_20023 ?auto_20024 ) ) ( ON ?auto_20022 ?auto_20021 ) ( ON ?auto_20023 ?auto_20022 ) ( not ( = ?auto_20021 ?auto_20022 ) ) ( not ( = ?auto_20021 ?auto_20023 ) ) ( not ( = ?auto_20021 ?auto_20024 ) ) ( not ( = ?auto_20022 ?auto_20023 ) ) ( not ( = ?auto_20022 ?auto_20024 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20023 ?auto_20024 )
      ( MAKE-3CRATE-VERIFY ?auto_20021 ?auto_20022 ?auto_20023 ?auto_20024 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20027 - SURFACE
      ?auto_20028 - SURFACE
    )
    :vars
    (
      ?auto_20029 - HOIST
      ?auto_20030 - PLACE
      ?auto_20031 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20029 ?auto_20030 ) ( SURFACE-AT ?auto_20027 ?auto_20030 ) ( CLEAR ?auto_20027 ) ( IS-CRATE ?auto_20028 ) ( not ( = ?auto_20027 ?auto_20028 ) ) ( TRUCK-AT ?auto_20031 ?auto_20030 ) ( AVAILABLE ?auto_20029 ) ( IN ?auto_20028 ?auto_20031 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20029 ?auto_20028 ?auto_20031 ?auto_20030 )
      ( MAKE-1CRATE ?auto_20027 ?auto_20028 )
      ( MAKE-1CRATE-VERIFY ?auto_20027 ?auto_20028 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20032 - SURFACE
      ?auto_20033 - SURFACE
      ?auto_20034 - SURFACE
    )
    :vars
    (
      ?auto_20036 - HOIST
      ?auto_20035 - PLACE
      ?auto_20037 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20036 ?auto_20035 ) ( SURFACE-AT ?auto_20033 ?auto_20035 ) ( CLEAR ?auto_20033 ) ( IS-CRATE ?auto_20034 ) ( not ( = ?auto_20033 ?auto_20034 ) ) ( TRUCK-AT ?auto_20037 ?auto_20035 ) ( AVAILABLE ?auto_20036 ) ( IN ?auto_20034 ?auto_20037 ) ( ON ?auto_20033 ?auto_20032 ) ( not ( = ?auto_20032 ?auto_20033 ) ) ( not ( = ?auto_20032 ?auto_20034 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20033 ?auto_20034 )
      ( MAKE-2CRATE-VERIFY ?auto_20032 ?auto_20033 ?auto_20034 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20038 - SURFACE
      ?auto_20039 - SURFACE
      ?auto_20040 - SURFACE
      ?auto_20041 - SURFACE
    )
    :vars
    (
      ?auto_20043 - HOIST
      ?auto_20042 - PLACE
      ?auto_20044 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20043 ?auto_20042 ) ( SURFACE-AT ?auto_20040 ?auto_20042 ) ( CLEAR ?auto_20040 ) ( IS-CRATE ?auto_20041 ) ( not ( = ?auto_20040 ?auto_20041 ) ) ( TRUCK-AT ?auto_20044 ?auto_20042 ) ( AVAILABLE ?auto_20043 ) ( IN ?auto_20041 ?auto_20044 ) ( ON ?auto_20040 ?auto_20039 ) ( not ( = ?auto_20039 ?auto_20040 ) ) ( not ( = ?auto_20039 ?auto_20041 ) ) ( ON ?auto_20039 ?auto_20038 ) ( not ( = ?auto_20038 ?auto_20039 ) ) ( not ( = ?auto_20038 ?auto_20040 ) ) ( not ( = ?auto_20038 ?auto_20041 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20039 ?auto_20040 ?auto_20041 )
      ( MAKE-3CRATE-VERIFY ?auto_20038 ?auto_20039 ?auto_20040 ?auto_20041 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20045 - SURFACE
      ?auto_20046 - SURFACE
    )
    :vars
    (
      ?auto_20048 - HOIST
      ?auto_20047 - PLACE
      ?auto_20049 - TRUCK
      ?auto_20050 - SURFACE
      ?auto_20051 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20048 ?auto_20047 ) ( SURFACE-AT ?auto_20045 ?auto_20047 ) ( CLEAR ?auto_20045 ) ( IS-CRATE ?auto_20046 ) ( not ( = ?auto_20045 ?auto_20046 ) ) ( AVAILABLE ?auto_20048 ) ( IN ?auto_20046 ?auto_20049 ) ( ON ?auto_20045 ?auto_20050 ) ( not ( = ?auto_20050 ?auto_20045 ) ) ( not ( = ?auto_20050 ?auto_20046 ) ) ( TRUCK-AT ?auto_20049 ?auto_20051 ) ( not ( = ?auto_20051 ?auto_20047 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20049 ?auto_20051 ?auto_20047 )
      ( MAKE-2CRATE ?auto_20050 ?auto_20045 ?auto_20046 )
      ( MAKE-1CRATE-VERIFY ?auto_20045 ?auto_20046 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20052 - SURFACE
      ?auto_20053 - SURFACE
      ?auto_20054 - SURFACE
    )
    :vars
    (
      ?auto_20058 - HOIST
      ?auto_20056 - PLACE
      ?auto_20055 - TRUCK
      ?auto_20057 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20058 ?auto_20056 ) ( SURFACE-AT ?auto_20053 ?auto_20056 ) ( CLEAR ?auto_20053 ) ( IS-CRATE ?auto_20054 ) ( not ( = ?auto_20053 ?auto_20054 ) ) ( AVAILABLE ?auto_20058 ) ( IN ?auto_20054 ?auto_20055 ) ( ON ?auto_20053 ?auto_20052 ) ( not ( = ?auto_20052 ?auto_20053 ) ) ( not ( = ?auto_20052 ?auto_20054 ) ) ( TRUCK-AT ?auto_20055 ?auto_20057 ) ( not ( = ?auto_20057 ?auto_20056 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20053 ?auto_20054 )
      ( MAKE-2CRATE-VERIFY ?auto_20052 ?auto_20053 ?auto_20054 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20059 - SURFACE
      ?auto_20060 - SURFACE
      ?auto_20061 - SURFACE
      ?auto_20062 - SURFACE
    )
    :vars
    (
      ?auto_20064 - HOIST
      ?auto_20063 - PLACE
      ?auto_20066 - TRUCK
      ?auto_20065 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20064 ?auto_20063 ) ( SURFACE-AT ?auto_20061 ?auto_20063 ) ( CLEAR ?auto_20061 ) ( IS-CRATE ?auto_20062 ) ( not ( = ?auto_20061 ?auto_20062 ) ) ( AVAILABLE ?auto_20064 ) ( IN ?auto_20062 ?auto_20066 ) ( ON ?auto_20061 ?auto_20060 ) ( not ( = ?auto_20060 ?auto_20061 ) ) ( not ( = ?auto_20060 ?auto_20062 ) ) ( TRUCK-AT ?auto_20066 ?auto_20065 ) ( not ( = ?auto_20065 ?auto_20063 ) ) ( ON ?auto_20060 ?auto_20059 ) ( not ( = ?auto_20059 ?auto_20060 ) ) ( not ( = ?auto_20059 ?auto_20061 ) ) ( not ( = ?auto_20059 ?auto_20062 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20060 ?auto_20061 ?auto_20062 )
      ( MAKE-3CRATE-VERIFY ?auto_20059 ?auto_20060 ?auto_20061 ?auto_20062 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20067 - SURFACE
      ?auto_20068 - SURFACE
    )
    :vars
    (
      ?auto_20070 - HOIST
      ?auto_20069 - PLACE
      ?auto_20072 - SURFACE
      ?auto_20073 - TRUCK
      ?auto_20071 - PLACE
      ?auto_20074 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20070 ?auto_20069 ) ( SURFACE-AT ?auto_20067 ?auto_20069 ) ( CLEAR ?auto_20067 ) ( IS-CRATE ?auto_20068 ) ( not ( = ?auto_20067 ?auto_20068 ) ) ( AVAILABLE ?auto_20070 ) ( ON ?auto_20067 ?auto_20072 ) ( not ( = ?auto_20072 ?auto_20067 ) ) ( not ( = ?auto_20072 ?auto_20068 ) ) ( TRUCK-AT ?auto_20073 ?auto_20071 ) ( not ( = ?auto_20071 ?auto_20069 ) ) ( HOIST-AT ?auto_20074 ?auto_20071 ) ( LIFTING ?auto_20074 ?auto_20068 ) ( not ( = ?auto_20070 ?auto_20074 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20074 ?auto_20068 ?auto_20073 ?auto_20071 )
      ( MAKE-2CRATE ?auto_20072 ?auto_20067 ?auto_20068 )
      ( MAKE-1CRATE-VERIFY ?auto_20067 ?auto_20068 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20075 - SURFACE
      ?auto_20076 - SURFACE
      ?auto_20077 - SURFACE
    )
    :vars
    (
      ?auto_20082 - HOIST
      ?auto_20078 - PLACE
      ?auto_20080 - TRUCK
      ?auto_20081 - PLACE
      ?auto_20079 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20082 ?auto_20078 ) ( SURFACE-AT ?auto_20076 ?auto_20078 ) ( CLEAR ?auto_20076 ) ( IS-CRATE ?auto_20077 ) ( not ( = ?auto_20076 ?auto_20077 ) ) ( AVAILABLE ?auto_20082 ) ( ON ?auto_20076 ?auto_20075 ) ( not ( = ?auto_20075 ?auto_20076 ) ) ( not ( = ?auto_20075 ?auto_20077 ) ) ( TRUCK-AT ?auto_20080 ?auto_20081 ) ( not ( = ?auto_20081 ?auto_20078 ) ) ( HOIST-AT ?auto_20079 ?auto_20081 ) ( LIFTING ?auto_20079 ?auto_20077 ) ( not ( = ?auto_20082 ?auto_20079 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20076 ?auto_20077 )
      ( MAKE-2CRATE-VERIFY ?auto_20075 ?auto_20076 ?auto_20077 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20083 - SURFACE
      ?auto_20084 - SURFACE
      ?auto_20085 - SURFACE
      ?auto_20086 - SURFACE
    )
    :vars
    (
      ?auto_20091 - HOIST
      ?auto_20088 - PLACE
      ?auto_20089 - TRUCK
      ?auto_20090 - PLACE
      ?auto_20087 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20091 ?auto_20088 ) ( SURFACE-AT ?auto_20085 ?auto_20088 ) ( CLEAR ?auto_20085 ) ( IS-CRATE ?auto_20086 ) ( not ( = ?auto_20085 ?auto_20086 ) ) ( AVAILABLE ?auto_20091 ) ( ON ?auto_20085 ?auto_20084 ) ( not ( = ?auto_20084 ?auto_20085 ) ) ( not ( = ?auto_20084 ?auto_20086 ) ) ( TRUCK-AT ?auto_20089 ?auto_20090 ) ( not ( = ?auto_20090 ?auto_20088 ) ) ( HOIST-AT ?auto_20087 ?auto_20090 ) ( LIFTING ?auto_20087 ?auto_20086 ) ( not ( = ?auto_20091 ?auto_20087 ) ) ( ON ?auto_20084 ?auto_20083 ) ( not ( = ?auto_20083 ?auto_20084 ) ) ( not ( = ?auto_20083 ?auto_20085 ) ) ( not ( = ?auto_20083 ?auto_20086 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20084 ?auto_20085 ?auto_20086 )
      ( MAKE-3CRATE-VERIFY ?auto_20083 ?auto_20084 ?auto_20085 ?auto_20086 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20092 - SURFACE
      ?auto_20093 - SURFACE
    )
    :vars
    (
      ?auto_20099 - HOIST
      ?auto_20095 - PLACE
      ?auto_20096 - SURFACE
      ?auto_20097 - TRUCK
      ?auto_20098 - PLACE
      ?auto_20094 - HOIST
      ?auto_20100 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20099 ?auto_20095 ) ( SURFACE-AT ?auto_20092 ?auto_20095 ) ( CLEAR ?auto_20092 ) ( IS-CRATE ?auto_20093 ) ( not ( = ?auto_20092 ?auto_20093 ) ) ( AVAILABLE ?auto_20099 ) ( ON ?auto_20092 ?auto_20096 ) ( not ( = ?auto_20096 ?auto_20092 ) ) ( not ( = ?auto_20096 ?auto_20093 ) ) ( TRUCK-AT ?auto_20097 ?auto_20098 ) ( not ( = ?auto_20098 ?auto_20095 ) ) ( HOIST-AT ?auto_20094 ?auto_20098 ) ( not ( = ?auto_20099 ?auto_20094 ) ) ( AVAILABLE ?auto_20094 ) ( SURFACE-AT ?auto_20093 ?auto_20098 ) ( ON ?auto_20093 ?auto_20100 ) ( CLEAR ?auto_20093 ) ( not ( = ?auto_20092 ?auto_20100 ) ) ( not ( = ?auto_20093 ?auto_20100 ) ) ( not ( = ?auto_20096 ?auto_20100 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20094 ?auto_20093 ?auto_20100 ?auto_20098 )
      ( MAKE-2CRATE ?auto_20096 ?auto_20092 ?auto_20093 )
      ( MAKE-1CRATE-VERIFY ?auto_20092 ?auto_20093 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20101 - SURFACE
      ?auto_20102 - SURFACE
      ?auto_20103 - SURFACE
    )
    :vars
    (
      ?auto_20106 - HOIST
      ?auto_20107 - PLACE
      ?auto_20108 - TRUCK
      ?auto_20104 - PLACE
      ?auto_20109 - HOIST
      ?auto_20105 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20106 ?auto_20107 ) ( SURFACE-AT ?auto_20102 ?auto_20107 ) ( CLEAR ?auto_20102 ) ( IS-CRATE ?auto_20103 ) ( not ( = ?auto_20102 ?auto_20103 ) ) ( AVAILABLE ?auto_20106 ) ( ON ?auto_20102 ?auto_20101 ) ( not ( = ?auto_20101 ?auto_20102 ) ) ( not ( = ?auto_20101 ?auto_20103 ) ) ( TRUCK-AT ?auto_20108 ?auto_20104 ) ( not ( = ?auto_20104 ?auto_20107 ) ) ( HOIST-AT ?auto_20109 ?auto_20104 ) ( not ( = ?auto_20106 ?auto_20109 ) ) ( AVAILABLE ?auto_20109 ) ( SURFACE-AT ?auto_20103 ?auto_20104 ) ( ON ?auto_20103 ?auto_20105 ) ( CLEAR ?auto_20103 ) ( not ( = ?auto_20102 ?auto_20105 ) ) ( not ( = ?auto_20103 ?auto_20105 ) ) ( not ( = ?auto_20101 ?auto_20105 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20102 ?auto_20103 )
      ( MAKE-2CRATE-VERIFY ?auto_20101 ?auto_20102 ?auto_20103 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20110 - SURFACE
      ?auto_20111 - SURFACE
      ?auto_20112 - SURFACE
      ?auto_20113 - SURFACE
    )
    :vars
    (
      ?auto_20118 - HOIST
      ?auto_20117 - PLACE
      ?auto_20119 - TRUCK
      ?auto_20115 - PLACE
      ?auto_20114 - HOIST
      ?auto_20116 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20118 ?auto_20117 ) ( SURFACE-AT ?auto_20112 ?auto_20117 ) ( CLEAR ?auto_20112 ) ( IS-CRATE ?auto_20113 ) ( not ( = ?auto_20112 ?auto_20113 ) ) ( AVAILABLE ?auto_20118 ) ( ON ?auto_20112 ?auto_20111 ) ( not ( = ?auto_20111 ?auto_20112 ) ) ( not ( = ?auto_20111 ?auto_20113 ) ) ( TRUCK-AT ?auto_20119 ?auto_20115 ) ( not ( = ?auto_20115 ?auto_20117 ) ) ( HOIST-AT ?auto_20114 ?auto_20115 ) ( not ( = ?auto_20118 ?auto_20114 ) ) ( AVAILABLE ?auto_20114 ) ( SURFACE-AT ?auto_20113 ?auto_20115 ) ( ON ?auto_20113 ?auto_20116 ) ( CLEAR ?auto_20113 ) ( not ( = ?auto_20112 ?auto_20116 ) ) ( not ( = ?auto_20113 ?auto_20116 ) ) ( not ( = ?auto_20111 ?auto_20116 ) ) ( ON ?auto_20111 ?auto_20110 ) ( not ( = ?auto_20110 ?auto_20111 ) ) ( not ( = ?auto_20110 ?auto_20112 ) ) ( not ( = ?auto_20110 ?auto_20113 ) ) ( not ( = ?auto_20110 ?auto_20116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20111 ?auto_20112 ?auto_20113 )
      ( MAKE-3CRATE-VERIFY ?auto_20110 ?auto_20111 ?auto_20112 ?auto_20113 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20120 - SURFACE
      ?auto_20121 - SURFACE
    )
    :vars
    (
      ?auto_20127 - HOIST
      ?auto_20125 - PLACE
      ?auto_20126 - SURFACE
      ?auto_20123 - PLACE
      ?auto_20122 - HOIST
      ?auto_20124 - SURFACE
      ?auto_20128 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20127 ?auto_20125 ) ( SURFACE-AT ?auto_20120 ?auto_20125 ) ( CLEAR ?auto_20120 ) ( IS-CRATE ?auto_20121 ) ( not ( = ?auto_20120 ?auto_20121 ) ) ( AVAILABLE ?auto_20127 ) ( ON ?auto_20120 ?auto_20126 ) ( not ( = ?auto_20126 ?auto_20120 ) ) ( not ( = ?auto_20126 ?auto_20121 ) ) ( not ( = ?auto_20123 ?auto_20125 ) ) ( HOIST-AT ?auto_20122 ?auto_20123 ) ( not ( = ?auto_20127 ?auto_20122 ) ) ( AVAILABLE ?auto_20122 ) ( SURFACE-AT ?auto_20121 ?auto_20123 ) ( ON ?auto_20121 ?auto_20124 ) ( CLEAR ?auto_20121 ) ( not ( = ?auto_20120 ?auto_20124 ) ) ( not ( = ?auto_20121 ?auto_20124 ) ) ( not ( = ?auto_20126 ?auto_20124 ) ) ( TRUCK-AT ?auto_20128 ?auto_20125 ) )
    :subtasks
    ( ( !DRIVE ?auto_20128 ?auto_20125 ?auto_20123 )
      ( MAKE-2CRATE ?auto_20126 ?auto_20120 ?auto_20121 )
      ( MAKE-1CRATE-VERIFY ?auto_20120 ?auto_20121 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20129 - SURFACE
      ?auto_20130 - SURFACE
      ?auto_20131 - SURFACE
    )
    :vars
    (
      ?auto_20133 - HOIST
      ?auto_20132 - PLACE
      ?auto_20136 - PLACE
      ?auto_20134 - HOIST
      ?auto_20137 - SURFACE
      ?auto_20135 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20133 ?auto_20132 ) ( SURFACE-AT ?auto_20130 ?auto_20132 ) ( CLEAR ?auto_20130 ) ( IS-CRATE ?auto_20131 ) ( not ( = ?auto_20130 ?auto_20131 ) ) ( AVAILABLE ?auto_20133 ) ( ON ?auto_20130 ?auto_20129 ) ( not ( = ?auto_20129 ?auto_20130 ) ) ( not ( = ?auto_20129 ?auto_20131 ) ) ( not ( = ?auto_20136 ?auto_20132 ) ) ( HOIST-AT ?auto_20134 ?auto_20136 ) ( not ( = ?auto_20133 ?auto_20134 ) ) ( AVAILABLE ?auto_20134 ) ( SURFACE-AT ?auto_20131 ?auto_20136 ) ( ON ?auto_20131 ?auto_20137 ) ( CLEAR ?auto_20131 ) ( not ( = ?auto_20130 ?auto_20137 ) ) ( not ( = ?auto_20131 ?auto_20137 ) ) ( not ( = ?auto_20129 ?auto_20137 ) ) ( TRUCK-AT ?auto_20135 ?auto_20132 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20130 ?auto_20131 )
      ( MAKE-2CRATE-VERIFY ?auto_20129 ?auto_20130 ?auto_20131 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20138 - SURFACE
      ?auto_20139 - SURFACE
      ?auto_20140 - SURFACE
      ?auto_20141 - SURFACE
    )
    :vars
    (
      ?auto_20147 - HOIST
      ?auto_20145 - PLACE
      ?auto_20142 - PLACE
      ?auto_20146 - HOIST
      ?auto_20143 - SURFACE
      ?auto_20144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20147 ?auto_20145 ) ( SURFACE-AT ?auto_20140 ?auto_20145 ) ( CLEAR ?auto_20140 ) ( IS-CRATE ?auto_20141 ) ( not ( = ?auto_20140 ?auto_20141 ) ) ( AVAILABLE ?auto_20147 ) ( ON ?auto_20140 ?auto_20139 ) ( not ( = ?auto_20139 ?auto_20140 ) ) ( not ( = ?auto_20139 ?auto_20141 ) ) ( not ( = ?auto_20142 ?auto_20145 ) ) ( HOIST-AT ?auto_20146 ?auto_20142 ) ( not ( = ?auto_20147 ?auto_20146 ) ) ( AVAILABLE ?auto_20146 ) ( SURFACE-AT ?auto_20141 ?auto_20142 ) ( ON ?auto_20141 ?auto_20143 ) ( CLEAR ?auto_20141 ) ( not ( = ?auto_20140 ?auto_20143 ) ) ( not ( = ?auto_20141 ?auto_20143 ) ) ( not ( = ?auto_20139 ?auto_20143 ) ) ( TRUCK-AT ?auto_20144 ?auto_20145 ) ( ON ?auto_20139 ?auto_20138 ) ( not ( = ?auto_20138 ?auto_20139 ) ) ( not ( = ?auto_20138 ?auto_20140 ) ) ( not ( = ?auto_20138 ?auto_20141 ) ) ( not ( = ?auto_20138 ?auto_20143 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20139 ?auto_20140 ?auto_20141 )
      ( MAKE-3CRATE-VERIFY ?auto_20138 ?auto_20139 ?auto_20140 ?auto_20141 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20148 - SURFACE
      ?auto_20149 - SURFACE
    )
    :vars
    (
      ?auto_20155 - HOIST
      ?auto_20153 - PLACE
      ?auto_20156 - SURFACE
      ?auto_20150 - PLACE
      ?auto_20154 - HOIST
      ?auto_20151 - SURFACE
      ?auto_20152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20155 ?auto_20153 ) ( IS-CRATE ?auto_20149 ) ( not ( = ?auto_20148 ?auto_20149 ) ) ( not ( = ?auto_20156 ?auto_20148 ) ) ( not ( = ?auto_20156 ?auto_20149 ) ) ( not ( = ?auto_20150 ?auto_20153 ) ) ( HOIST-AT ?auto_20154 ?auto_20150 ) ( not ( = ?auto_20155 ?auto_20154 ) ) ( AVAILABLE ?auto_20154 ) ( SURFACE-AT ?auto_20149 ?auto_20150 ) ( ON ?auto_20149 ?auto_20151 ) ( CLEAR ?auto_20149 ) ( not ( = ?auto_20148 ?auto_20151 ) ) ( not ( = ?auto_20149 ?auto_20151 ) ) ( not ( = ?auto_20156 ?auto_20151 ) ) ( TRUCK-AT ?auto_20152 ?auto_20153 ) ( SURFACE-AT ?auto_20156 ?auto_20153 ) ( CLEAR ?auto_20156 ) ( LIFTING ?auto_20155 ?auto_20148 ) ( IS-CRATE ?auto_20148 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20156 ?auto_20148 )
      ( MAKE-2CRATE ?auto_20156 ?auto_20148 ?auto_20149 )
      ( MAKE-1CRATE-VERIFY ?auto_20148 ?auto_20149 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20157 - SURFACE
      ?auto_20158 - SURFACE
      ?auto_20159 - SURFACE
    )
    :vars
    (
      ?auto_20163 - HOIST
      ?auto_20165 - PLACE
      ?auto_20160 - PLACE
      ?auto_20161 - HOIST
      ?auto_20162 - SURFACE
      ?auto_20164 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20163 ?auto_20165 ) ( IS-CRATE ?auto_20159 ) ( not ( = ?auto_20158 ?auto_20159 ) ) ( not ( = ?auto_20157 ?auto_20158 ) ) ( not ( = ?auto_20157 ?auto_20159 ) ) ( not ( = ?auto_20160 ?auto_20165 ) ) ( HOIST-AT ?auto_20161 ?auto_20160 ) ( not ( = ?auto_20163 ?auto_20161 ) ) ( AVAILABLE ?auto_20161 ) ( SURFACE-AT ?auto_20159 ?auto_20160 ) ( ON ?auto_20159 ?auto_20162 ) ( CLEAR ?auto_20159 ) ( not ( = ?auto_20158 ?auto_20162 ) ) ( not ( = ?auto_20159 ?auto_20162 ) ) ( not ( = ?auto_20157 ?auto_20162 ) ) ( TRUCK-AT ?auto_20164 ?auto_20165 ) ( SURFACE-AT ?auto_20157 ?auto_20165 ) ( CLEAR ?auto_20157 ) ( LIFTING ?auto_20163 ?auto_20158 ) ( IS-CRATE ?auto_20158 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20158 ?auto_20159 )
      ( MAKE-2CRATE-VERIFY ?auto_20157 ?auto_20158 ?auto_20159 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20166 - SURFACE
      ?auto_20167 - SURFACE
      ?auto_20168 - SURFACE
      ?auto_20169 - SURFACE
    )
    :vars
    (
      ?auto_20175 - HOIST
      ?auto_20170 - PLACE
      ?auto_20173 - PLACE
      ?auto_20172 - HOIST
      ?auto_20171 - SURFACE
      ?auto_20174 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20175 ?auto_20170 ) ( IS-CRATE ?auto_20169 ) ( not ( = ?auto_20168 ?auto_20169 ) ) ( not ( = ?auto_20167 ?auto_20168 ) ) ( not ( = ?auto_20167 ?auto_20169 ) ) ( not ( = ?auto_20173 ?auto_20170 ) ) ( HOIST-AT ?auto_20172 ?auto_20173 ) ( not ( = ?auto_20175 ?auto_20172 ) ) ( AVAILABLE ?auto_20172 ) ( SURFACE-AT ?auto_20169 ?auto_20173 ) ( ON ?auto_20169 ?auto_20171 ) ( CLEAR ?auto_20169 ) ( not ( = ?auto_20168 ?auto_20171 ) ) ( not ( = ?auto_20169 ?auto_20171 ) ) ( not ( = ?auto_20167 ?auto_20171 ) ) ( TRUCK-AT ?auto_20174 ?auto_20170 ) ( SURFACE-AT ?auto_20167 ?auto_20170 ) ( CLEAR ?auto_20167 ) ( LIFTING ?auto_20175 ?auto_20168 ) ( IS-CRATE ?auto_20168 ) ( ON ?auto_20167 ?auto_20166 ) ( not ( = ?auto_20166 ?auto_20167 ) ) ( not ( = ?auto_20166 ?auto_20168 ) ) ( not ( = ?auto_20166 ?auto_20169 ) ) ( not ( = ?auto_20166 ?auto_20171 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20167 ?auto_20168 ?auto_20169 )
      ( MAKE-3CRATE-VERIFY ?auto_20166 ?auto_20167 ?auto_20168 ?auto_20169 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20176 - SURFACE
      ?auto_20177 - SURFACE
    )
    :vars
    (
      ?auto_20184 - HOIST
      ?auto_20178 - PLACE
      ?auto_20180 - SURFACE
      ?auto_20182 - PLACE
      ?auto_20181 - HOIST
      ?auto_20179 - SURFACE
      ?auto_20183 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20184 ?auto_20178 ) ( IS-CRATE ?auto_20177 ) ( not ( = ?auto_20176 ?auto_20177 ) ) ( not ( = ?auto_20180 ?auto_20176 ) ) ( not ( = ?auto_20180 ?auto_20177 ) ) ( not ( = ?auto_20182 ?auto_20178 ) ) ( HOIST-AT ?auto_20181 ?auto_20182 ) ( not ( = ?auto_20184 ?auto_20181 ) ) ( AVAILABLE ?auto_20181 ) ( SURFACE-AT ?auto_20177 ?auto_20182 ) ( ON ?auto_20177 ?auto_20179 ) ( CLEAR ?auto_20177 ) ( not ( = ?auto_20176 ?auto_20179 ) ) ( not ( = ?auto_20177 ?auto_20179 ) ) ( not ( = ?auto_20180 ?auto_20179 ) ) ( TRUCK-AT ?auto_20183 ?auto_20178 ) ( SURFACE-AT ?auto_20180 ?auto_20178 ) ( CLEAR ?auto_20180 ) ( IS-CRATE ?auto_20176 ) ( AVAILABLE ?auto_20184 ) ( IN ?auto_20176 ?auto_20183 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20184 ?auto_20176 ?auto_20183 ?auto_20178 )
      ( MAKE-2CRATE ?auto_20180 ?auto_20176 ?auto_20177 )
      ( MAKE-1CRATE-VERIFY ?auto_20176 ?auto_20177 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20185 - SURFACE
      ?auto_20186 - SURFACE
      ?auto_20187 - SURFACE
    )
    :vars
    (
      ?auto_20191 - HOIST
      ?auto_20192 - PLACE
      ?auto_20193 - PLACE
      ?auto_20190 - HOIST
      ?auto_20188 - SURFACE
      ?auto_20189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20191 ?auto_20192 ) ( IS-CRATE ?auto_20187 ) ( not ( = ?auto_20186 ?auto_20187 ) ) ( not ( = ?auto_20185 ?auto_20186 ) ) ( not ( = ?auto_20185 ?auto_20187 ) ) ( not ( = ?auto_20193 ?auto_20192 ) ) ( HOIST-AT ?auto_20190 ?auto_20193 ) ( not ( = ?auto_20191 ?auto_20190 ) ) ( AVAILABLE ?auto_20190 ) ( SURFACE-AT ?auto_20187 ?auto_20193 ) ( ON ?auto_20187 ?auto_20188 ) ( CLEAR ?auto_20187 ) ( not ( = ?auto_20186 ?auto_20188 ) ) ( not ( = ?auto_20187 ?auto_20188 ) ) ( not ( = ?auto_20185 ?auto_20188 ) ) ( TRUCK-AT ?auto_20189 ?auto_20192 ) ( SURFACE-AT ?auto_20185 ?auto_20192 ) ( CLEAR ?auto_20185 ) ( IS-CRATE ?auto_20186 ) ( AVAILABLE ?auto_20191 ) ( IN ?auto_20186 ?auto_20189 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20186 ?auto_20187 )
      ( MAKE-2CRATE-VERIFY ?auto_20185 ?auto_20186 ?auto_20187 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20194 - SURFACE
      ?auto_20195 - SURFACE
      ?auto_20196 - SURFACE
      ?auto_20197 - SURFACE
    )
    :vars
    (
      ?auto_20203 - HOIST
      ?auto_20202 - PLACE
      ?auto_20198 - PLACE
      ?auto_20200 - HOIST
      ?auto_20199 - SURFACE
      ?auto_20201 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20203 ?auto_20202 ) ( IS-CRATE ?auto_20197 ) ( not ( = ?auto_20196 ?auto_20197 ) ) ( not ( = ?auto_20195 ?auto_20196 ) ) ( not ( = ?auto_20195 ?auto_20197 ) ) ( not ( = ?auto_20198 ?auto_20202 ) ) ( HOIST-AT ?auto_20200 ?auto_20198 ) ( not ( = ?auto_20203 ?auto_20200 ) ) ( AVAILABLE ?auto_20200 ) ( SURFACE-AT ?auto_20197 ?auto_20198 ) ( ON ?auto_20197 ?auto_20199 ) ( CLEAR ?auto_20197 ) ( not ( = ?auto_20196 ?auto_20199 ) ) ( not ( = ?auto_20197 ?auto_20199 ) ) ( not ( = ?auto_20195 ?auto_20199 ) ) ( TRUCK-AT ?auto_20201 ?auto_20202 ) ( SURFACE-AT ?auto_20195 ?auto_20202 ) ( CLEAR ?auto_20195 ) ( IS-CRATE ?auto_20196 ) ( AVAILABLE ?auto_20203 ) ( IN ?auto_20196 ?auto_20201 ) ( ON ?auto_20195 ?auto_20194 ) ( not ( = ?auto_20194 ?auto_20195 ) ) ( not ( = ?auto_20194 ?auto_20196 ) ) ( not ( = ?auto_20194 ?auto_20197 ) ) ( not ( = ?auto_20194 ?auto_20199 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20195 ?auto_20196 ?auto_20197 )
      ( MAKE-3CRATE-VERIFY ?auto_20194 ?auto_20195 ?auto_20196 ?auto_20197 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20204 - SURFACE
      ?auto_20205 - SURFACE
    )
    :vars
    (
      ?auto_20212 - HOIST
      ?auto_20211 - PLACE
      ?auto_20208 - SURFACE
      ?auto_20206 - PLACE
      ?auto_20209 - HOIST
      ?auto_20207 - SURFACE
      ?auto_20210 - TRUCK
      ?auto_20213 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20212 ?auto_20211 ) ( IS-CRATE ?auto_20205 ) ( not ( = ?auto_20204 ?auto_20205 ) ) ( not ( = ?auto_20208 ?auto_20204 ) ) ( not ( = ?auto_20208 ?auto_20205 ) ) ( not ( = ?auto_20206 ?auto_20211 ) ) ( HOIST-AT ?auto_20209 ?auto_20206 ) ( not ( = ?auto_20212 ?auto_20209 ) ) ( AVAILABLE ?auto_20209 ) ( SURFACE-AT ?auto_20205 ?auto_20206 ) ( ON ?auto_20205 ?auto_20207 ) ( CLEAR ?auto_20205 ) ( not ( = ?auto_20204 ?auto_20207 ) ) ( not ( = ?auto_20205 ?auto_20207 ) ) ( not ( = ?auto_20208 ?auto_20207 ) ) ( SURFACE-AT ?auto_20208 ?auto_20211 ) ( CLEAR ?auto_20208 ) ( IS-CRATE ?auto_20204 ) ( AVAILABLE ?auto_20212 ) ( IN ?auto_20204 ?auto_20210 ) ( TRUCK-AT ?auto_20210 ?auto_20213 ) ( not ( = ?auto_20213 ?auto_20211 ) ) ( not ( = ?auto_20206 ?auto_20213 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20210 ?auto_20213 ?auto_20211 )
      ( MAKE-2CRATE ?auto_20208 ?auto_20204 ?auto_20205 )
      ( MAKE-1CRATE-VERIFY ?auto_20204 ?auto_20205 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20214 - SURFACE
      ?auto_20215 - SURFACE
      ?auto_20216 - SURFACE
    )
    :vars
    (
      ?auto_20219 - HOIST
      ?auto_20221 - PLACE
      ?auto_20217 - PLACE
      ?auto_20223 - HOIST
      ?auto_20218 - SURFACE
      ?auto_20222 - TRUCK
      ?auto_20220 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20219 ?auto_20221 ) ( IS-CRATE ?auto_20216 ) ( not ( = ?auto_20215 ?auto_20216 ) ) ( not ( = ?auto_20214 ?auto_20215 ) ) ( not ( = ?auto_20214 ?auto_20216 ) ) ( not ( = ?auto_20217 ?auto_20221 ) ) ( HOIST-AT ?auto_20223 ?auto_20217 ) ( not ( = ?auto_20219 ?auto_20223 ) ) ( AVAILABLE ?auto_20223 ) ( SURFACE-AT ?auto_20216 ?auto_20217 ) ( ON ?auto_20216 ?auto_20218 ) ( CLEAR ?auto_20216 ) ( not ( = ?auto_20215 ?auto_20218 ) ) ( not ( = ?auto_20216 ?auto_20218 ) ) ( not ( = ?auto_20214 ?auto_20218 ) ) ( SURFACE-AT ?auto_20214 ?auto_20221 ) ( CLEAR ?auto_20214 ) ( IS-CRATE ?auto_20215 ) ( AVAILABLE ?auto_20219 ) ( IN ?auto_20215 ?auto_20222 ) ( TRUCK-AT ?auto_20222 ?auto_20220 ) ( not ( = ?auto_20220 ?auto_20221 ) ) ( not ( = ?auto_20217 ?auto_20220 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20215 ?auto_20216 )
      ( MAKE-2CRATE-VERIFY ?auto_20214 ?auto_20215 ?auto_20216 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20224 - SURFACE
      ?auto_20225 - SURFACE
      ?auto_20226 - SURFACE
      ?auto_20227 - SURFACE
    )
    :vars
    (
      ?auto_20232 - HOIST
      ?auto_20228 - PLACE
      ?auto_20233 - PLACE
      ?auto_20234 - HOIST
      ?auto_20230 - SURFACE
      ?auto_20231 - TRUCK
      ?auto_20229 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20232 ?auto_20228 ) ( IS-CRATE ?auto_20227 ) ( not ( = ?auto_20226 ?auto_20227 ) ) ( not ( = ?auto_20225 ?auto_20226 ) ) ( not ( = ?auto_20225 ?auto_20227 ) ) ( not ( = ?auto_20233 ?auto_20228 ) ) ( HOIST-AT ?auto_20234 ?auto_20233 ) ( not ( = ?auto_20232 ?auto_20234 ) ) ( AVAILABLE ?auto_20234 ) ( SURFACE-AT ?auto_20227 ?auto_20233 ) ( ON ?auto_20227 ?auto_20230 ) ( CLEAR ?auto_20227 ) ( not ( = ?auto_20226 ?auto_20230 ) ) ( not ( = ?auto_20227 ?auto_20230 ) ) ( not ( = ?auto_20225 ?auto_20230 ) ) ( SURFACE-AT ?auto_20225 ?auto_20228 ) ( CLEAR ?auto_20225 ) ( IS-CRATE ?auto_20226 ) ( AVAILABLE ?auto_20232 ) ( IN ?auto_20226 ?auto_20231 ) ( TRUCK-AT ?auto_20231 ?auto_20229 ) ( not ( = ?auto_20229 ?auto_20228 ) ) ( not ( = ?auto_20233 ?auto_20229 ) ) ( ON ?auto_20225 ?auto_20224 ) ( not ( = ?auto_20224 ?auto_20225 ) ) ( not ( = ?auto_20224 ?auto_20226 ) ) ( not ( = ?auto_20224 ?auto_20227 ) ) ( not ( = ?auto_20224 ?auto_20230 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20225 ?auto_20226 ?auto_20227 )
      ( MAKE-3CRATE-VERIFY ?auto_20224 ?auto_20225 ?auto_20226 ?auto_20227 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20235 - SURFACE
      ?auto_20236 - SURFACE
    )
    :vars
    (
      ?auto_20242 - HOIST
      ?auto_20237 - PLACE
      ?auto_20239 - SURFACE
      ?auto_20243 - PLACE
      ?auto_20244 - HOIST
      ?auto_20240 - SURFACE
      ?auto_20241 - TRUCK
      ?auto_20238 - PLACE
      ?auto_20245 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20242 ?auto_20237 ) ( IS-CRATE ?auto_20236 ) ( not ( = ?auto_20235 ?auto_20236 ) ) ( not ( = ?auto_20239 ?auto_20235 ) ) ( not ( = ?auto_20239 ?auto_20236 ) ) ( not ( = ?auto_20243 ?auto_20237 ) ) ( HOIST-AT ?auto_20244 ?auto_20243 ) ( not ( = ?auto_20242 ?auto_20244 ) ) ( AVAILABLE ?auto_20244 ) ( SURFACE-AT ?auto_20236 ?auto_20243 ) ( ON ?auto_20236 ?auto_20240 ) ( CLEAR ?auto_20236 ) ( not ( = ?auto_20235 ?auto_20240 ) ) ( not ( = ?auto_20236 ?auto_20240 ) ) ( not ( = ?auto_20239 ?auto_20240 ) ) ( SURFACE-AT ?auto_20239 ?auto_20237 ) ( CLEAR ?auto_20239 ) ( IS-CRATE ?auto_20235 ) ( AVAILABLE ?auto_20242 ) ( TRUCK-AT ?auto_20241 ?auto_20238 ) ( not ( = ?auto_20238 ?auto_20237 ) ) ( not ( = ?auto_20243 ?auto_20238 ) ) ( HOIST-AT ?auto_20245 ?auto_20238 ) ( LIFTING ?auto_20245 ?auto_20235 ) ( not ( = ?auto_20242 ?auto_20245 ) ) ( not ( = ?auto_20244 ?auto_20245 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20245 ?auto_20235 ?auto_20241 ?auto_20238 )
      ( MAKE-2CRATE ?auto_20239 ?auto_20235 ?auto_20236 )
      ( MAKE-1CRATE-VERIFY ?auto_20235 ?auto_20236 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20246 - SURFACE
      ?auto_20247 - SURFACE
      ?auto_20248 - SURFACE
    )
    :vars
    (
      ?auto_20251 - HOIST
      ?auto_20254 - PLACE
      ?auto_20256 - PLACE
      ?auto_20253 - HOIST
      ?auto_20255 - SURFACE
      ?auto_20249 - TRUCK
      ?auto_20252 - PLACE
      ?auto_20250 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20251 ?auto_20254 ) ( IS-CRATE ?auto_20248 ) ( not ( = ?auto_20247 ?auto_20248 ) ) ( not ( = ?auto_20246 ?auto_20247 ) ) ( not ( = ?auto_20246 ?auto_20248 ) ) ( not ( = ?auto_20256 ?auto_20254 ) ) ( HOIST-AT ?auto_20253 ?auto_20256 ) ( not ( = ?auto_20251 ?auto_20253 ) ) ( AVAILABLE ?auto_20253 ) ( SURFACE-AT ?auto_20248 ?auto_20256 ) ( ON ?auto_20248 ?auto_20255 ) ( CLEAR ?auto_20248 ) ( not ( = ?auto_20247 ?auto_20255 ) ) ( not ( = ?auto_20248 ?auto_20255 ) ) ( not ( = ?auto_20246 ?auto_20255 ) ) ( SURFACE-AT ?auto_20246 ?auto_20254 ) ( CLEAR ?auto_20246 ) ( IS-CRATE ?auto_20247 ) ( AVAILABLE ?auto_20251 ) ( TRUCK-AT ?auto_20249 ?auto_20252 ) ( not ( = ?auto_20252 ?auto_20254 ) ) ( not ( = ?auto_20256 ?auto_20252 ) ) ( HOIST-AT ?auto_20250 ?auto_20252 ) ( LIFTING ?auto_20250 ?auto_20247 ) ( not ( = ?auto_20251 ?auto_20250 ) ) ( not ( = ?auto_20253 ?auto_20250 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20247 ?auto_20248 )
      ( MAKE-2CRATE-VERIFY ?auto_20246 ?auto_20247 ?auto_20248 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20257 - SURFACE
      ?auto_20258 - SURFACE
      ?auto_20259 - SURFACE
      ?auto_20260 - SURFACE
    )
    :vars
    (
      ?auto_20268 - HOIST
      ?auto_20267 - PLACE
      ?auto_20264 - PLACE
      ?auto_20263 - HOIST
      ?auto_20262 - SURFACE
      ?auto_20265 - TRUCK
      ?auto_20261 - PLACE
      ?auto_20266 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20268 ?auto_20267 ) ( IS-CRATE ?auto_20260 ) ( not ( = ?auto_20259 ?auto_20260 ) ) ( not ( = ?auto_20258 ?auto_20259 ) ) ( not ( = ?auto_20258 ?auto_20260 ) ) ( not ( = ?auto_20264 ?auto_20267 ) ) ( HOIST-AT ?auto_20263 ?auto_20264 ) ( not ( = ?auto_20268 ?auto_20263 ) ) ( AVAILABLE ?auto_20263 ) ( SURFACE-AT ?auto_20260 ?auto_20264 ) ( ON ?auto_20260 ?auto_20262 ) ( CLEAR ?auto_20260 ) ( not ( = ?auto_20259 ?auto_20262 ) ) ( not ( = ?auto_20260 ?auto_20262 ) ) ( not ( = ?auto_20258 ?auto_20262 ) ) ( SURFACE-AT ?auto_20258 ?auto_20267 ) ( CLEAR ?auto_20258 ) ( IS-CRATE ?auto_20259 ) ( AVAILABLE ?auto_20268 ) ( TRUCK-AT ?auto_20265 ?auto_20261 ) ( not ( = ?auto_20261 ?auto_20267 ) ) ( not ( = ?auto_20264 ?auto_20261 ) ) ( HOIST-AT ?auto_20266 ?auto_20261 ) ( LIFTING ?auto_20266 ?auto_20259 ) ( not ( = ?auto_20268 ?auto_20266 ) ) ( not ( = ?auto_20263 ?auto_20266 ) ) ( ON ?auto_20258 ?auto_20257 ) ( not ( = ?auto_20257 ?auto_20258 ) ) ( not ( = ?auto_20257 ?auto_20259 ) ) ( not ( = ?auto_20257 ?auto_20260 ) ) ( not ( = ?auto_20257 ?auto_20262 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20258 ?auto_20259 ?auto_20260 )
      ( MAKE-3CRATE-VERIFY ?auto_20257 ?auto_20258 ?auto_20259 ?auto_20260 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20269 - SURFACE
      ?auto_20270 - SURFACE
    )
    :vars
    (
      ?auto_20279 - HOIST
      ?auto_20278 - PLACE
      ?auto_20275 - SURFACE
      ?auto_20274 - PLACE
      ?auto_20273 - HOIST
      ?auto_20272 - SURFACE
      ?auto_20276 - TRUCK
      ?auto_20271 - PLACE
      ?auto_20277 - HOIST
      ?auto_20280 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20279 ?auto_20278 ) ( IS-CRATE ?auto_20270 ) ( not ( = ?auto_20269 ?auto_20270 ) ) ( not ( = ?auto_20275 ?auto_20269 ) ) ( not ( = ?auto_20275 ?auto_20270 ) ) ( not ( = ?auto_20274 ?auto_20278 ) ) ( HOIST-AT ?auto_20273 ?auto_20274 ) ( not ( = ?auto_20279 ?auto_20273 ) ) ( AVAILABLE ?auto_20273 ) ( SURFACE-AT ?auto_20270 ?auto_20274 ) ( ON ?auto_20270 ?auto_20272 ) ( CLEAR ?auto_20270 ) ( not ( = ?auto_20269 ?auto_20272 ) ) ( not ( = ?auto_20270 ?auto_20272 ) ) ( not ( = ?auto_20275 ?auto_20272 ) ) ( SURFACE-AT ?auto_20275 ?auto_20278 ) ( CLEAR ?auto_20275 ) ( IS-CRATE ?auto_20269 ) ( AVAILABLE ?auto_20279 ) ( TRUCK-AT ?auto_20276 ?auto_20271 ) ( not ( = ?auto_20271 ?auto_20278 ) ) ( not ( = ?auto_20274 ?auto_20271 ) ) ( HOIST-AT ?auto_20277 ?auto_20271 ) ( not ( = ?auto_20279 ?auto_20277 ) ) ( not ( = ?auto_20273 ?auto_20277 ) ) ( AVAILABLE ?auto_20277 ) ( SURFACE-AT ?auto_20269 ?auto_20271 ) ( ON ?auto_20269 ?auto_20280 ) ( CLEAR ?auto_20269 ) ( not ( = ?auto_20269 ?auto_20280 ) ) ( not ( = ?auto_20270 ?auto_20280 ) ) ( not ( = ?auto_20275 ?auto_20280 ) ) ( not ( = ?auto_20272 ?auto_20280 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20277 ?auto_20269 ?auto_20280 ?auto_20271 )
      ( MAKE-2CRATE ?auto_20275 ?auto_20269 ?auto_20270 )
      ( MAKE-1CRATE-VERIFY ?auto_20269 ?auto_20270 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20281 - SURFACE
      ?auto_20282 - SURFACE
      ?auto_20283 - SURFACE
    )
    :vars
    (
      ?auto_20288 - HOIST
      ?auto_20292 - PLACE
      ?auto_20289 - PLACE
      ?auto_20285 - HOIST
      ?auto_20290 - SURFACE
      ?auto_20284 - TRUCK
      ?auto_20287 - PLACE
      ?auto_20286 - HOIST
      ?auto_20291 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20288 ?auto_20292 ) ( IS-CRATE ?auto_20283 ) ( not ( = ?auto_20282 ?auto_20283 ) ) ( not ( = ?auto_20281 ?auto_20282 ) ) ( not ( = ?auto_20281 ?auto_20283 ) ) ( not ( = ?auto_20289 ?auto_20292 ) ) ( HOIST-AT ?auto_20285 ?auto_20289 ) ( not ( = ?auto_20288 ?auto_20285 ) ) ( AVAILABLE ?auto_20285 ) ( SURFACE-AT ?auto_20283 ?auto_20289 ) ( ON ?auto_20283 ?auto_20290 ) ( CLEAR ?auto_20283 ) ( not ( = ?auto_20282 ?auto_20290 ) ) ( not ( = ?auto_20283 ?auto_20290 ) ) ( not ( = ?auto_20281 ?auto_20290 ) ) ( SURFACE-AT ?auto_20281 ?auto_20292 ) ( CLEAR ?auto_20281 ) ( IS-CRATE ?auto_20282 ) ( AVAILABLE ?auto_20288 ) ( TRUCK-AT ?auto_20284 ?auto_20287 ) ( not ( = ?auto_20287 ?auto_20292 ) ) ( not ( = ?auto_20289 ?auto_20287 ) ) ( HOIST-AT ?auto_20286 ?auto_20287 ) ( not ( = ?auto_20288 ?auto_20286 ) ) ( not ( = ?auto_20285 ?auto_20286 ) ) ( AVAILABLE ?auto_20286 ) ( SURFACE-AT ?auto_20282 ?auto_20287 ) ( ON ?auto_20282 ?auto_20291 ) ( CLEAR ?auto_20282 ) ( not ( = ?auto_20282 ?auto_20291 ) ) ( not ( = ?auto_20283 ?auto_20291 ) ) ( not ( = ?auto_20281 ?auto_20291 ) ) ( not ( = ?auto_20290 ?auto_20291 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20282 ?auto_20283 )
      ( MAKE-2CRATE-VERIFY ?auto_20281 ?auto_20282 ?auto_20283 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20293 - SURFACE
      ?auto_20294 - SURFACE
      ?auto_20295 - SURFACE
      ?auto_20296 - SURFACE
    )
    :vars
    (
      ?auto_20303 - HOIST
      ?auto_20299 - PLACE
      ?auto_20298 - PLACE
      ?auto_20297 - HOIST
      ?auto_20300 - SURFACE
      ?auto_20305 - TRUCK
      ?auto_20301 - PLACE
      ?auto_20302 - HOIST
      ?auto_20304 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20303 ?auto_20299 ) ( IS-CRATE ?auto_20296 ) ( not ( = ?auto_20295 ?auto_20296 ) ) ( not ( = ?auto_20294 ?auto_20295 ) ) ( not ( = ?auto_20294 ?auto_20296 ) ) ( not ( = ?auto_20298 ?auto_20299 ) ) ( HOIST-AT ?auto_20297 ?auto_20298 ) ( not ( = ?auto_20303 ?auto_20297 ) ) ( AVAILABLE ?auto_20297 ) ( SURFACE-AT ?auto_20296 ?auto_20298 ) ( ON ?auto_20296 ?auto_20300 ) ( CLEAR ?auto_20296 ) ( not ( = ?auto_20295 ?auto_20300 ) ) ( not ( = ?auto_20296 ?auto_20300 ) ) ( not ( = ?auto_20294 ?auto_20300 ) ) ( SURFACE-AT ?auto_20294 ?auto_20299 ) ( CLEAR ?auto_20294 ) ( IS-CRATE ?auto_20295 ) ( AVAILABLE ?auto_20303 ) ( TRUCK-AT ?auto_20305 ?auto_20301 ) ( not ( = ?auto_20301 ?auto_20299 ) ) ( not ( = ?auto_20298 ?auto_20301 ) ) ( HOIST-AT ?auto_20302 ?auto_20301 ) ( not ( = ?auto_20303 ?auto_20302 ) ) ( not ( = ?auto_20297 ?auto_20302 ) ) ( AVAILABLE ?auto_20302 ) ( SURFACE-AT ?auto_20295 ?auto_20301 ) ( ON ?auto_20295 ?auto_20304 ) ( CLEAR ?auto_20295 ) ( not ( = ?auto_20295 ?auto_20304 ) ) ( not ( = ?auto_20296 ?auto_20304 ) ) ( not ( = ?auto_20294 ?auto_20304 ) ) ( not ( = ?auto_20300 ?auto_20304 ) ) ( ON ?auto_20294 ?auto_20293 ) ( not ( = ?auto_20293 ?auto_20294 ) ) ( not ( = ?auto_20293 ?auto_20295 ) ) ( not ( = ?auto_20293 ?auto_20296 ) ) ( not ( = ?auto_20293 ?auto_20300 ) ) ( not ( = ?auto_20293 ?auto_20304 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20294 ?auto_20295 ?auto_20296 )
      ( MAKE-3CRATE-VERIFY ?auto_20293 ?auto_20294 ?auto_20295 ?auto_20296 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20306 - SURFACE
      ?auto_20307 - SURFACE
    )
    :vars
    (
      ?auto_20314 - HOIST
      ?auto_20310 - PLACE
      ?auto_20316 - SURFACE
      ?auto_20309 - PLACE
      ?auto_20308 - HOIST
      ?auto_20311 - SURFACE
      ?auto_20312 - PLACE
      ?auto_20313 - HOIST
      ?auto_20315 - SURFACE
      ?auto_20317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20314 ?auto_20310 ) ( IS-CRATE ?auto_20307 ) ( not ( = ?auto_20306 ?auto_20307 ) ) ( not ( = ?auto_20316 ?auto_20306 ) ) ( not ( = ?auto_20316 ?auto_20307 ) ) ( not ( = ?auto_20309 ?auto_20310 ) ) ( HOIST-AT ?auto_20308 ?auto_20309 ) ( not ( = ?auto_20314 ?auto_20308 ) ) ( AVAILABLE ?auto_20308 ) ( SURFACE-AT ?auto_20307 ?auto_20309 ) ( ON ?auto_20307 ?auto_20311 ) ( CLEAR ?auto_20307 ) ( not ( = ?auto_20306 ?auto_20311 ) ) ( not ( = ?auto_20307 ?auto_20311 ) ) ( not ( = ?auto_20316 ?auto_20311 ) ) ( SURFACE-AT ?auto_20316 ?auto_20310 ) ( CLEAR ?auto_20316 ) ( IS-CRATE ?auto_20306 ) ( AVAILABLE ?auto_20314 ) ( not ( = ?auto_20312 ?auto_20310 ) ) ( not ( = ?auto_20309 ?auto_20312 ) ) ( HOIST-AT ?auto_20313 ?auto_20312 ) ( not ( = ?auto_20314 ?auto_20313 ) ) ( not ( = ?auto_20308 ?auto_20313 ) ) ( AVAILABLE ?auto_20313 ) ( SURFACE-AT ?auto_20306 ?auto_20312 ) ( ON ?auto_20306 ?auto_20315 ) ( CLEAR ?auto_20306 ) ( not ( = ?auto_20306 ?auto_20315 ) ) ( not ( = ?auto_20307 ?auto_20315 ) ) ( not ( = ?auto_20316 ?auto_20315 ) ) ( not ( = ?auto_20311 ?auto_20315 ) ) ( TRUCK-AT ?auto_20317 ?auto_20310 ) )
    :subtasks
    ( ( !DRIVE ?auto_20317 ?auto_20310 ?auto_20312 )
      ( MAKE-2CRATE ?auto_20316 ?auto_20306 ?auto_20307 )
      ( MAKE-1CRATE-VERIFY ?auto_20306 ?auto_20307 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20318 - SURFACE
      ?auto_20319 - SURFACE
      ?auto_20320 - SURFACE
    )
    :vars
    (
      ?auto_20327 - HOIST
      ?auto_20328 - PLACE
      ?auto_20324 - PLACE
      ?auto_20322 - HOIST
      ?auto_20326 - SURFACE
      ?auto_20325 - PLACE
      ?auto_20329 - HOIST
      ?auto_20321 - SURFACE
      ?auto_20323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20327 ?auto_20328 ) ( IS-CRATE ?auto_20320 ) ( not ( = ?auto_20319 ?auto_20320 ) ) ( not ( = ?auto_20318 ?auto_20319 ) ) ( not ( = ?auto_20318 ?auto_20320 ) ) ( not ( = ?auto_20324 ?auto_20328 ) ) ( HOIST-AT ?auto_20322 ?auto_20324 ) ( not ( = ?auto_20327 ?auto_20322 ) ) ( AVAILABLE ?auto_20322 ) ( SURFACE-AT ?auto_20320 ?auto_20324 ) ( ON ?auto_20320 ?auto_20326 ) ( CLEAR ?auto_20320 ) ( not ( = ?auto_20319 ?auto_20326 ) ) ( not ( = ?auto_20320 ?auto_20326 ) ) ( not ( = ?auto_20318 ?auto_20326 ) ) ( SURFACE-AT ?auto_20318 ?auto_20328 ) ( CLEAR ?auto_20318 ) ( IS-CRATE ?auto_20319 ) ( AVAILABLE ?auto_20327 ) ( not ( = ?auto_20325 ?auto_20328 ) ) ( not ( = ?auto_20324 ?auto_20325 ) ) ( HOIST-AT ?auto_20329 ?auto_20325 ) ( not ( = ?auto_20327 ?auto_20329 ) ) ( not ( = ?auto_20322 ?auto_20329 ) ) ( AVAILABLE ?auto_20329 ) ( SURFACE-AT ?auto_20319 ?auto_20325 ) ( ON ?auto_20319 ?auto_20321 ) ( CLEAR ?auto_20319 ) ( not ( = ?auto_20319 ?auto_20321 ) ) ( not ( = ?auto_20320 ?auto_20321 ) ) ( not ( = ?auto_20318 ?auto_20321 ) ) ( not ( = ?auto_20326 ?auto_20321 ) ) ( TRUCK-AT ?auto_20323 ?auto_20328 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20319 ?auto_20320 )
      ( MAKE-2CRATE-VERIFY ?auto_20318 ?auto_20319 ?auto_20320 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20330 - SURFACE
      ?auto_20331 - SURFACE
      ?auto_20332 - SURFACE
      ?auto_20333 - SURFACE
    )
    :vars
    (
      ?auto_20339 - HOIST
      ?auto_20334 - PLACE
      ?auto_20342 - PLACE
      ?auto_20338 - HOIST
      ?auto_20336 - SURFACE
      ?auto_20341 - PLACE
      ?auto_20335 - HOIST
      ?auto_20337 - SURFACE
      ?auto_20340 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20339 ?auto_20334 ) ( IS-CRATE ?auto_20333 ) ( not ( = ?auto_20332 ?auto_20333 ) ) ( not ( = ?auto_20331 ?auto_20332 ) ) ( not ( = ?auto_20331 ?auto_20333 ) ) ( not ( = ?auto_20342 ?auto_20334 ) ) ( HOIST-AT ?auto_20338 ?auto_20342 ) ( not ( = ?auto_20339 ?auto_20338 ) ) ( AVAILABLE ?auto_20338 ) ( SURFACE-AT ?auto_20333 ?auto_20342 ) ( ON ?auto_20333 ?auto_20336 ) ( CLEAR ?auto_20333 ) ( not ( = ?auto_20332 ?auto_20336 ) ) ( not ( = ?auto_20333 ?auto_20336 ) ) ( not ( = ?auto_20331 ?auto_20336 ) ) ( SURFACE-AT ?auto_20331 ?auto_20334 ) ( CLEAR ?auto_20331 ) ( IS-CRATE ?auto_20332 ) ( AVAILABLE ?auto_20339 ) ( not ( = ?auto_20341 ?auto_20334 ) ) ( not ( = ?auto_20342 ?auto_20341 ) ) ( HOIST-AT ?auto_20335 ?auto_20341 ) ( not ( = ?auto_20339 ?auto_20335 ) ) ( not ( = ?auto_20338 ?auto_20335 ) ) ( AVAILABLE ?auto_20335 ) ( SURFACE-AT ?auto_20332 ?auto_20341 ) ( ON ?auto_20332 ?auto_20337 ) ( CLEAR ?auto_20332 ) ( not ( = ?auto_20332 ?auto_20337 ) ) ( not ( = ?auto_20333 ?auto_20337 ) ) ( not ( = ?auto_20331 ?auto_20337 ) ) ( not ( = ?auto_20336 ?auto_20337 ) ) ( TRUCK-AT ?auto_20340 ?auto_20334 ) ( ON ?auto_20331 ?auto_20330 ) ( not ( = ?auto_20330 ?auto_20331 ) ) ( not ( = ?auto_20330 ?auto_20332 ) ) ( not ( = ?auto_20330 ?auto_20333 ) ) ( not ( = ?auto_20330 ?auto_20336 ) ) ( not ( = ?auto_20330 ?auto_20337 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20331 ?auto_20332 ?auto_20333 )
      ( MAKE-3CRATE-VERIFY ?auto_20330 ?auto_20331 ?auto_20332 ?auto_20333 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20343 - SURFACE
      ?auto_20344 - SURFACE
    )
    :vars
    (
      ?auto_20351 - HOIST
      ?auto_20345 - PLACE
      ?auto_20349 - SURFACE
      ?auto_20354 - PLACE
      ?auto_20350 - HOIST
      ?auto_20347 - SURFACE
      ?auto_20353 - PLACE
      ?auto_20346 - HOIST
      ?auto_20348 - SURFACE
      ?auto_20352 - TRUCK
      ?auto_20355 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20351 ?auto_20345 ) ( IS-CRATE ?auto_20344 ) ( not ( = ?auto_20343 ?auto_20344 ) ) ( not ( = ?auto_20349 ?auto_20343 ) ) ( not ( = ?auto_20349 ?auto_20344 ) ) ( not ( = ?auto_20354 ?auto_20345 ) ) ( HOIST-AT ?auto_20350 ?auto_20354 ) ( not ( = ?auto_20351 ?auto_20350 ) ) ( AVAILABLE ?auto_20350 ) ( SURFACE-AT ?auto_20344 ?auto_20354 ) ( ON ?auto_20344 ?auto_20347 ) ( CLEAR ?auto_20344 ) ( not ( = ?auto_20343 ?auto_20347 ) ) ( not ( = ?auto_20344 ?auto_20347 ) ) ( not ( = ?auto_20349 ?auto_20347 ) ) ( IS-CRATE ?auto_20343 ) ( not ( = ?auto_20353 ?auto_20345 ) ) ( not ( = ?auto_20354 ?auto_20353 ) ) ( HOIST-AT ?auto_20346 ?auto_20353 ) ( not ( = ?auto_20351 ?auto_20346 ) ) ( not ( = ?auto_20350 ?auto_20346 ) ) ( AVAILABLE ?auto_20346 ) ( SURFACE-AT ?auto_20343 ?auto_20353 ) ( ON ?auto_20343 ?auto_20348 ) ( CLEAR ?auto_20343 ) ( not ( = ?auto_20343 ?auto_20348 ) ) ( not ( = ?auto_20344 ?auto_20348 ) ) ( not ( = ?auto_20349 ?auto_20348 ) ) ( not ( = ?auto_20347 ?auto_20348 ) ) ( TRUCK-AT ?auto_20352 ?auto_20345 ) ( SURFACE-AT ?auto_20355 ?auto_20345 ) ( CLEAR ?auto_20355 ) ( LIFTING ?auto_20351 ?auto_20349 ) ( IS-CRATE ?auto_20349 ) ( not ( = ?auto_20355 ?auto_20349 ) ) ( not ( = ?auto_20343 ?auto_20355 ) ) ( not ( = ?auto_20344 ?auto_20355 ) ) ( not ( = ?auto_20347 ?auto_20355 ) ) ( not ( = ?auto_20348 ?auto_20355 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20355 ?auto_20349 )
      ( MAKE-2CRATE ?auto_20349 ?auto_20343 ?auto_20344 )
      ( MAKE-1CRATE-VERIFY ?auto_20343 ?auto_20344 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20356 - SURFACE
      ?auto_20357 - SURFACE
      ?auto_20358 - SURFACE
    )
    :vars
    (
      ?auto_20363 - HOIST
      ?auto_20366 - PLACE
      ?auto_20368 - PLACE
      ?auto_20359 - HOIST
      ?auto_20365 - SURFACE
      ?auto_20367 - PLACE
      ?auto_20361 - HOIST
      ?auto_20362 - SURFACE
      ?auto_20364 - TRUCK
      ?auto_20360 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20363 ?auto_20366 ) ( IS-CRATE ?auto_20358 ) ( not ( = ?auto_20357 ?auto_20358 ) ) ( not ( = ?auto_20356 ?auto_20357 ) ) ( not ( = ?auto_20356 ?auto_20358 ) ) ( not ( = ?auto_20368 ?auto_20366 ) ) ( HOIST-AT ?auto_20359 ?auto_20368 ) ( not ( = ?auto_20363 ?auto_20359 ) ) ( AVAILABLE ?auto_20359 ) ( SURFACE-AT ?auto_20358 ?auto_20368 ) ( ON ?auto_20358 ?auto_20365 ) ( CLEAR ?auto_20358 ) ( not ( = ?auto_20357 ?auto_20365 ) ) ( not ( = ?auto_20358 ?auto_20365 ) ) ( not ( = ?auto_20356 ?auto_20365 ) ) ( IS-CRATE ?auto_20357 ) ( not ( = ?auto_20367 ?auto_20366 ) ) ( not ( = ?auto_20368 ?auto_20367 ) ) ( HOIST-AT ?auto_20361 ?auto_20367 ) ( not ( = ?auto_20363 ?auto_20361 ) ) ( not ( = ?auto_20359 ?auto_20361 ) ) ( AVAILABLE ?auto_20361 ) ( SURFACE-AT ?auto_20357 ?auto_20367 ) ( ON ?auto_20357 ?auto_20362 ) ( CLEAR ?auto_20357 ) ( not ( = ?auto_20357 ?auto_20362 ) ) ( not ( = ?auto_20358 ?auto_20362 ) ) ( not ( = ?auto_20356 ?auto_20362 ) ) ( not ( = ?auto_20365 ?auto_20362 ) ) ( TRUCK-AT ?auto_20364 ?auto_20366 ) ( SURFACE-AT ?auto_20360 ?auto_20366 ) ( CLEAR ?auto_20360 ) ( LIFTING ?auto_20363 ?auto_20356 ) ( IS-CRATE ?auto_20356 ) ( not ( = ?auto_20360 ?auto_20356 ) ) ( not ( = ?auto_20357 ?auto_20360 ) ) ( not ( = ?auto_20358 ?auto_20360 ) ) ( not ( = ?auto_20365 ?auto_20360 ) ) ( not ( = ?auto_20362 ?auto_20360 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20357 ?auto_20358 )
      ( MAKE-2CRATE-VERIFY ?auto_20356 ?auto_20357 ?auto_20358 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20369 - SURFACE
      ?auto_20370 - SURFACE
      ?auto_20371 - SURFACE
      ?auto_20372 - SURFACE
    )
    :vars
    (
      ?auto_20376 - HOIST
      ?auto_20374 - PLACE
      ?auto_20379 - PLACE
      ?auto_20380 - HOIST
      ?auto_20377 - SURFACE
      ?auto_20378 - PLACE
      ?auto_20375 - HOIST
      ?auto_20381 - SURFACE
      ?auto_20373 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20376 ?auto_20374 ) ( IS-CRATE ?auto_20372 ) ( not ( = ?auto_20371 ?auto_20372 ) ) ( not ( = ?auto_20370 ?auto_20371 ) ) ( not ( = ?auto_20370 ?auto_20372 ) ) ( not ( = ?auto_20379 ?auto_20374 ) ) ( HOIST-AT ?auto_20380 ?auto_20379 ) ( not ( = ?auto_20376 ?auto_20380 ) ) ( AVAILABLE ?auto_20380 ) ( SURFACE-AT ?auto_20372 ?auto_20379 ) ( ON ?auto_20372 ?auto_20377 ) ( CLEAR ?auto_20372 ) ( not ( = ?auto_20371 ?auto_20377 ) ) ( not ( = ?auto_20372 ?auto_20377 ) ) ( not ( = ?auto_20370 ?auto_20377 ) ) ( IS-CRATE ?auto_20371 ) ( not ( = ?auto_20378 ?auto_20374 ) ) ( not ( = ?auto_20379 ?auto_20378 ) ) ( HOIST-AT ?auto_20375 ?auto_20378 ) ( not ( = ?auto_20376 ?auto_20375 ) ) ( not ( = ?auto_20380 ?auto_20375 ) ) ( AVAILABLE ?auto_20375 ) ( SURFACE-AT ?auto_20371 ?auto_20378 ) ( ON ?auto_20371 ?auto_20381 ) ( CLEAR ?auto_20371 ) ( not ( = ?auto_20371 ?auto_20381 ) ) ( not ( = ?auto_20372 ?auto_20381 ) ) ( not ( = ?auto_20370 ?auto_20381 ) ) ( not ( = ?auto_20377 ?auto_20381 ) ) ( TRUCK-AT ?auto_20373 ?auto_20374 ) ( SURFACE-AT ?auto_20369 ?auto_20374 ) ( CLEAR ?auto_20369 ) ( LIFTING ?auto_20376 ?auto_20370 ) ( IS-CRATE ?auto_20370 ) ( not ( = ?auto_20369 ?auto_20370 ) ) ( not ( = ?auto_20371 ?auto_20369 ) ) ( not ( = ?auto_20372 ?auto_20369 ) ) ( not ( = ?auto_20377 ?auto_20369 ) ) ( not ( = ?auto_20381 ?auto_20369 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20370 ?auto_20371 ?auto_20372 )
      ( MAKE-3CRATE-VERIFY ?auto_20369 ?auto_20370 ?auto_20371 ?auto_20372 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20382 - SURFACE
      ?auto_20383 - SURFACE
    )
    :vars
    (
      ?auto_20388 - HOIST
      ?auto_20386 - PLACE
      ?auto_20384 - SURFACE
      ?auto_20391 - PLACE
      ?auto_20392 - HOIST
      ?auto_20389 - SURFACE
      ?auto_20390 - PLACE
      ?auto_20387 - HOIST
      ?auto_20394 - SURFACE
      ?auto_20385 - TRUCK
      ?auto_20393 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20388 ?auto_20386 ) ( IS-CRATE ?auto_20383 ) ( not ( = ?auto_20382 ?auto_20383 ) ) ( not ( = ?auto_20384 ?auto_20382 ) ) ( not ( = ?auto_20384 ?auto_20383 ) ) ( not ( = ?auto_20391 ?auto_20386 ) ) ( HOIST-AT ?auto_20392 ?auto_20391 ) ( not ( = ?auto_20388 ?auto_20392 ) ) ( AVAILABLE ?auto_20392 ) ( SURFACE-AT ?auto_20383 ?auto_20391 ) ( ON ?auto_20383 ?auto_20389 ) ( CLEAR ?auto_20383 ) ( not ( = ?auto_20382 ?auto_20389 ) ) ( not ( = ?auto_20383 ?auto_20389 ) ) ( not ( = ?auto_20384 ?auto_20389 ) ) ( IS-CRATE ?auto_20382 ) ( not ( = ?auto_20390 ?auto_20386 ) ) ( not ( = ?auto_20391 ?auto_20390 ) ) ( HOIST-AT ?auto_20387 ?auto_20390 ) ( not ( = ?auto_20388 ?auto_20387 ) ) ( not ( = ?auto_20392 ?auto_20387 ) ) ( AVAILABLE ?auto_20387 ) ( SURFACE-AT ?auto_20382 ?auto_20390 ) ( ON ?auto_20382 ?auto_20394 ) ( CLEAR ?auto_20382 ) ( not ( = ?auto_20382 ?auto_20394 ) ) ( not ( = ?auto_20383 ?auto_20394 ) ) ( not ( = ?auto_20384 ?auto_20394 ) ) ( not ( = ?auto_20389 ?auto_20394 ) ) ( TRUCK-AT ?auto_20385 ?auto_20386 ) ( SURFACE-AT ?auto_20393 ?auto_20386 ) ( CLEAR ?auto_20393 ) ( IS-CRATE ?auto_20384 ) ( not ( = ?auto_20393 ?auto_20384 ) ) ( not ( = ?auto_20382 ?auto_20393 ) ) ( not ( = ?auto_20383 ?auto_20393 ) ) ( not ( = ?auto_20389 ?auto_20393 ) ) ( not ( = ?auto_20394 ?auto_20393 ) ) ( AVAILABLE ?auto_20388 ) ( IN ?auto_20384 ?auto_20385 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20388 ?auto_20384 ?auto_20385 ?auto_20386 )
      ( MAKE-2CRATE ?auto_20384 ?auto_20382 ?auto_20383 )
      ( MAKE-1CRATE-VERIFY ?auto_20382 ?auto_20383 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20395 - SURFACE
      ?auto_20396 - SURFACE
      ?auto_20397 - SURFACE
    )
    :vars
    (
      ?auto_20400 - HOIST
      ?auto_20406 - PLACE
      ?auto_20403 - PLACE
      ?auto_20404 - HOIST
      ?auto_20407 - SURFACE
      ?auto_20398 - PLACE
      ?auto_20401 - HOIST
      ?auto_20405 - SURFACE
      ?auto_20399 - TRUCK
      ?auto_20402 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20400 ?auto_20406 ) ( IS-CRATE ?auto_20397 ) ( not ( = ?auto_20396 ?auto_20397 ) ) ( not ( = ?auto_20395 ?auto_20396 ) ) ( not ( = ?auto_20395 ?auto_20397 ) ) ( not ( = ?auto_20403 ?auto_20406 ) ) ( HOIST-AT ?auto_20404 ?auto_20403 ) ( not ( = ?auto_20400 ?auto_20404 ) ) ( AVAILABLE ?auto_20404 ) ( SURFACE-AT ?auto_20397 ?auto_20403 ) ( ON ?auto_20397 ?auto_20407 ) ( CLEAR ?auto_20397 ) ( not ( = ?auto_20396 ?auto_20407 ) ) ( not ( = ?auto_20397 ?auto_20407 ) ) ( not ( = ?auto_20395 ?auto_20407 ) ) ( IS-CRATE ?auto_20396 ) ( not ( = ?auto_20398 ?auto_20406 ) ) ( not ( = ?auto_20403 ?auto_20398 ) ) ( HOIST-AT ?auto_20401 ?auto_20398 ) ( not ( = ?auto_20400 ?auto_20401 ) ) ( not ( = ?auto_20404 ?auto_20401 ) ) ( AVAILABLE ?auto_20401 ) ( SURFACE-AT ?auto_20396 ?auto_20398 ) ( ON ?auto_20396 ?auto_20405 ) ( CLEAR ?auto_20396 ) ( not ( = ?auto_20396 ?auto_20405 ) ) ( not ( = ?auto_20397 ?auto_20405 ) ) ( not ( = ?auto_20395 ?auto_20405 ) ) ( not ( = ?auto_20407 ?auto_20405 ) ) ( TRUCK-AT ?auto_20399 ?auto_20406 ) ( SURFACE-AT ?auto_20402 ?auto_20406 ) ( CLEAR ?auto_20402 ) ( IS-CRATE ?auto_20395 ) ( not ( = ?auto_20402 ?auto_20395 ) ) ( not ( = ?auto_20396 ?auto_20402 ) ) ( not ( = ?auto_20397 ?auto_20402 ) ) ( not ( = ?auto_20407 ?auto_20402 ) ) ( not ( = ?auto_20405 ?auto_20402 ) ) ( AVAILABLE ?auto_20400 ) ( IN ?auto_20395 ?auto_20399 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20396 ?auto_20397 )
      ( MAKE-2CRATE-VERIFY ?auto_20395 ?auto_20396 ?auto_20397 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20408 - SURFACE
      ?auto_20409 - SURFACE
      ?auto_20410 - SURFACE
      ?auto_20411 - SURFACE
    )
    :vars
    (
      ?auto_20412 - HOIST
      ?auto_20414 - PLACE
      ?auto_20417 - PLACE
      ?auto_20416 - HOIST
      ?auto_20418 - SURFACE
      ?auto_20415 - PLACE
      ?auto_20420 - HOIST
      ?auto_20413 - SURFACE
      ?auto_20419 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20412 ?auto_20414 ) ( IS-CRATE ?auto_20411 ) ( not ( = ?auto_20410 ?auto_20411 ) ) ( not ( = ?auto_20409 ?auto_20410 ) ) ( not ( = ?auto_20409 ?auto_20411 ) ) ( not ( = ?auto_20417 ?auto_20414 ) ) ( HOIST-AT ?auto_20416 ?auto_20417 ) ( not ( = ?auto_20412 ?auto_20416 ) ) ( AVAILABLE ?auto_20416 ) ( SURFACE-AT ?auto_20411 ?auto_20417 ) ( ON ?auto_20411 ?auto_20418 ) ( CLEAR ?auto_20411 ) ( not ( = ?auto_20410 ?auto_20418 ) ) ( not ( = ?auto_20411 ?auto_20418 ) ) ( not ( = ?auto_20409 ?auto_20418 ) ) ( IS-CRATE ?auto_20410 ) ( not ( = ?auto_20415 ?auto_20414 ) ) ( not ( = ?auto_20417 ?auto_20415 ) ) ( HOIST-AT ?auto_20420 ?auto_20415 ) ( not ( = ?auto_20412 ?auto_20420 ) ) ( not ( = ?auto_20416 ?auto_20420 ) ) ( AVAILABLE ?auto_20420 ) ( SURFACE-AT ?auto_20410 ?auto_20415 ) ( ON ?auto_20410 ?auto_20413 ) ( CLEAR ?auto_20410 ) ( not ( = ?auto_20410 ?auto_20413 ) ) ( not ( = ?auto_20411 ?auto_20413 ) ) ( not ( = ?auto_20409 ?auto_20413 ) ) ( not ( = ?auto_20418 ?auto_20413 ) ) ( TRUCK-AT ?auto_20419 ?auto_20414 ) ( SURFACE-AT ?auto_20408 ?auto_20414 ) ( CLEAR ?auto_20408 ) ( IS-CRATE ?auto_20409 ) ( not ( = ?auto_20408 ?auto_20409 ) ) ( not ( = ?auto_20410 ?auto_20408 ) ) ( not ( = ?auto_20411 ?auto_20408 ) ) ( not ( = ?auto_20418 ?auto_20408 ) ) ( not ( = ?auto_20413 ?auto_20408 ) ) ( AVAILABLE ?auto_20412 ) ( IN ?auto_20409 ?auto_20419 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20409 ?auto_20410 ?auto_20411 )
      ( MAKE-3CRATE-VERIFY ?auto_20408 ?auto_20409 ?auto_20410 ?auto_20411 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20421 - SURFACE
      ?auto_20422 - SURFACE
    )
    :vars
    (
      ?auto_20423 - HOIST
      ?auto_20425 - PLACE
      ?auto_20432 - SURFACE
      ?auto_20429 - PLACE
      ?auto_20427 - HOIST
      ?auto_20430 - SURFACE
      ?auto_20426 - PLACE
      ?auto_20433 - HOIST
      ?auto_20424 - SURFACE
      ?auto_20428 - SURFACE
      ?auto_20431 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20423 ?auto_20425 ) ( IS-CRATE ?auto_20422 ) ( not ( = ?auto_20421 ?auto_20422 ) ) ( not ( = ?auto_20432 ?auto_20421 ) ) ( not ( = ?auto_20432 ?auto_20422 ) ) ( not ( = ?auto_20429 ?auto_20425 ) ) ( HOIST-AT ?auto_20427 ?auto_20429 ) ( not ( = ?auto_20423 ?auto_20427 ) ) ( AVAILABLE ?auto_20427 ) ( SURFACE-AT ?auto_20422 ?auto_20429 ) ( ON ?auto_20422 ?auto_20430 ) ( CLEAR ?auto_20422 ) ( not ( = ?auto_20421 ?auto_20430 ) ) ( not ( = ?auto_20422 ?auto_20430 ) ) ( not ( = ?auto_20432 ?auto_20430 ) ) ( IS-CRATE ?auto_20421 ) ( not ( = ?auto_20426 ?auto_20425 ) ) ( not ( = ?auto_20429 ?auto_20426 ) ) ( HOIST-AT ?auto_20433 ?auto_20426 ) ( not ( = ?auto_20423 ?auto_20433 ) ) ( not ( = ?auto_20427 ?auto_20433 ) ) ( AVAILABLE ?auto_20433 ) ( SURFACE-AT ?auto_20421 ?auto_20426 ) ( ON ?auto_20421 ?auto_20424 ) ( CLEAR ?auto_20421 ) ( not ( = ?auto_20421 ?auto_20424 ) ) ( not ( = ?auto_20422 ?auto_20424 ) ) ( not ( = ?auto_20432 ?auto_20424 ) ) ( not ( = ?auto_20430 ?auto_20424 ) ) ( SURFACE-AT ?auto_20428 ?auto_20425 ) ( CLEAR ?auto_20428 ) ( IS-CRATE ?auto_20432 ) ( not ( = ?auto_20428 ?auto_20432 ) ) ( not ( = ?auto_20421 ?auto_20428 ) ) ( not ( = ?auto_20422 ?auto_20428 ) ) ( not ( = ?auto_20430 ?auto_20428 ) ) ( not ( = ?auto_20424 ?auto_20428 ) ) ( AVAILABLE ?auto_20423 ) ( IN ?auto_20432 ?auto_20431 ) ( TRUCK-AT ?auto_20431 ?auto_20429 ) )
    :subtasks
    ( ( !DRIVE ?auto_20431 ?auto_20429 ?auto_20425 )
      ( MAKE-2CRATE ?auto_20432 ?auto_20421 ?auto_20422 )
      ( MAKE-1CRATE-VERIFY ?auto_20421 ?auto_20422 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20434 - SURFACE
      ?auto_20435 - SURFACE
      ?auto_20436 - SURFACE
    )
    :vars
    (
      ?auto_20441 - HOIST
      ?auto_20442 - PLACE
      ?auto_20437 - PLACE
      ?auto_20438 - HOIST
      ?auto_20443 - SURFACE
      ?auto_20440 - PLACE
      ?auto_20446 - HOIST
      ?auto_20444 - SURFACE
      ?auto_20439 - SURFACE
      ?auto_20445 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20441 ?auto_20442 ) ( IS-CRATE ?auto_20436 ) ( not ( = ?auto_20435 ?auto_20436 ) ) ( not ( = ?auto_20434 ?auto_20435 ) ) ( not ( = ?auto_20434 ?auto_20436 ) ) ( not ( = ?auto_20437 ?auto_20442 ) ) ( HOIST-AT ?auto_20438 ?auto_20437 ) ( not ( = ?auto_20441 ?auto_20438 ) ) ( AVAILABLE ?auto_20438 ) ( SURFACE-AT ?auto_20436 ?auto_20437 ) ( ON ?auto_20436 ?auto_20443 ) ( CLEAR ?auto_20436 ) ( not ( = ?auto_20435 ?auto_20443 ) ) ( not ( = ?auto_20436 ?auto_20443 ) ) ( not ( = ?auto_20434 ?auto_20443 ) ) ( IS-CRATE ?auto_20435 ) ( not ( = ?auto_20440 ?auto_20442 ) ) ( not ( = ?auto_20437 ?auto_20440 ) ) ( HOIST-AT ?auto_20446 ?auto_20440 ) ( not ( = ?auto_20441 ?auto_20446 ) ) ( not ( = ?auto_20438 ?auto_20446 ) ) ( AVAILABLE ?auto_20446 ) ( SURFACE-AT ?auto_20435 ?auto_20440 ) ( ON ?auto_20435 ?auto_20444 ) ( CLEAR ?auto_20435 ) ( not ( = ?auto_20435 ?auto_20444 ) ) ( not ( = ?auto_20436 ?auto_20444 ) ) ( not ( = ?auto_20434 ?auto_20444 ) ) ( not ( = ?auto_20443 ?auto_20444 ) ) ( SURFACE-AT ?auto_20439 ?auto_20442 ) ( CLEAR ?auto_20439 ) ( IS-CRATE ?auto_20434 ) ( not ( = ?auto_20439 ?auto_20434 ) ) ( not ( = ?auto_20435 ?auto_20439 ) ) ( not ( = ?auto_20436 ?auto_20439 ) ) ( not ( = ?auto_20443 ?auto_20439 ) ) ( not ( = ?auto_20444 ?auto_20439 ) ) ( AVAILABLE ?auto_20441 ) ( IN ?auto_20434 ?auto_20445 ) ( TRUCK-AT ?auto_20445 ?auto_20437 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20435 ?auto_20436 )
      ( MAKE-2CRATE-VERIFY ?auto_20434 ?auto_20435 ?auto_20436 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20447 - SURFACE
      ?auto_20448 - SURFACE
      ?auto_20449 - SURFACE
      ?auto_20450 - SURFACE
    )
    :vars
    (
      ?auto_20456 - HOIST
      ?auto_20451 - PLACE
      ?auto_20458 - PLACE
      ?auto_20454 - HOIST
      ?auto_20459 - SURFACE
      ?auto_20457 - PLACE
      ?auto_20452 - HOIST
      ?auto_20453 - SURFACE
      ?auto_20455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20456 ?auto_20451 ) ( IS-CRATE ?auto_20450 ) ( not ( = ?auto_20449 ?auto_20450 ) ) ( not ( = ?auto_20448 ?auto_20449 ) ) ( not ( = ?auto_20448 ?auto_20450 ) ) ( not ( = ?auto_20458 ?auto_20451 ) ) ( HOIST-AT ?auto_20454 ?auto_20458 ) ( not ( = ?auto_20456 ?auto_20454 ) ) ( AVAILABLE ?auto_20454 ) ( SURFACE-AT ?auto_20450 ?auto_20458 ) ( ON ?auto_20450 ?auto_20459 ) ( CLEAR ?auto_20450 ) ( not ( = ?auto_20449 ?auto_20459 ) ) ( not ( = ?auto_20450 ?auto_20459 ) ) ( not ( = ?auto_20448 ?auto_20459 ) ) ( IS-CRATE ?auto_20449 ) ( not ( = ?auto_20457 ?auto_20451 ) ) ( not ( = ?auto_20458 ?auto_20457 ) ) ( HOIST-AT ?auto_20452 ?auto_20457 ) ( not ( = ?auto_20456 ?auto_20452 ) ) ( not ( = ?auto_20454 ?auto_20452 ) ) ( AVAILABLE ?auto_20452 ) ( SURFACE-AT ?auto_20449 ?auto_20457 ) ( ON ?auto_20449 ?auto_20453 ) ( CLEAR ?auto_20449 ) ( not ( = ?auto_20449 ?auto_20453 ) ) ( not ( = ?auto_20450 ?auto_20453 ) ) ( not ( = ?auto_20448 ?auto_20453 ) ) ( not ( = ?auto_20459 ?auto_20453 ) ) ( SURFACE-AT ?auto_20447 ?auto_20451 ) ( CLEAR ?auto_20447 ) ( IS-CRATE ?auto_20448 ) ( not ( = ?auto_20447 ?auto_20448 ) ) ( not ( = ?auto_20449 ?auto_20447 ) ) ( not ( = ?auto_20450 ?auto_20447 ) ) ( not ( = ?auto_20459 ?auto_20447 ) ) ( not ( = ?auto_20453 ?auto_20447 ) ) ( AVAILABLE ?auto_20456 ) ( IN ?auto_20448 ?auto_20455 ) ( TRUCK-AT ?auto_20455 ?auto_20458 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20448 ?auto_20449 ?auto_20450 )
      ( MAKE-3CRATE-VERIFY ?auto_20447 ?auto_20448 ?auto_20449 ?auto_20450 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20460 - SURFACE
      ?auto_20461 - SURFACE
    )
    :vars
    (
      ?auto_20469 - HOIST
      ?auto_20462 - PLACE
      ?auto_20466 - SURFACE
      ?auto_20471 - PLACE
      ?auto_20465 - HOIST
      ?auto_20472 - SURFACE
      ?auto_20470 - PLACE
      ?auto_20463 - HOIST
      ?auto_20464 - SURFACE
      ?auto_20467 - SURFACE
      ?auto_20468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20469 ?auto_20462 ) ( IS-CRATE ?auto_20461 ) ( not ( = ?auto_20460 ?auto_20461 ) ) ( not ( = ?auto_20466 ?auto_20460 ) ) ( not ( = ?auto_20466 ?auto_20461 ) ) ( not ( = ?auto_20471 ?auto_20462 ) ) ( HOIST-AT ?auto_20465 ?auto_20471 ) ( not ( = ?auto_20469 ?auto_20465 ) ) ( SURFACE-AT ?auto_20461 ?auto_20471 ) ( ON ?auto_20461 ?auto_20472 ) ( CLEAR ?auto_20461 ) ( not ( = ?auto_20460 ?auto_20472 ) ) ( not ( = ?auto_20461 ?auto_20472 ) ) ( not ( = ?auto_20466 ?auto_20472 ) ) ( IS-CRATE ?auto_20460 ) ( not ( = ?auto_20470 ?auto_20462 ) ) ( not ( = ?auto_20471 ?auto_20470 ) ) ( HOIST-AT ?auto_20463 ?auto_20470 ) ( not ( = ?auto_20469 ?auto_20463 ) ) ( not ( = ?auto_20465 ?auto_20463 ) ) ( AVAILABLE ?auto_20463 ) ( SURFACE-AT ?auto_20460 ?auto_20470 ) ( ON ?auto_20460 ?auto_20464 ) ( CLEAR ?auto_20460 ) ( not ( = ?auto_20460 ?auto_20464 ) ) ( not ( = ?auto_20461 ?auto_20464 ) ) ( not ( = ?auto_20466 ?auto_20464 ) ) ( not ( = ?auto_20472 ?auto_20464 ) ) ( SURFACE-AT ?auto_20467 ?auto_20462 ) ( CLEAR ?auto_20467 ) ( IS-CRATE ?auto_20466 ) ( not ( = ?auto_20467 ?auto_20466 ) ) ( not ( = ?auto_20460 ?auto_20467 ) ) ( not ( = ?auto_20461 ?auto_20467 ) ) ( not ( = ?auto_20472 ?auto_20467 ) ) ( not ( = ?auto_20464 ?auto_20467 ) ) ( AVAILABLE ?auto_20469 ) ( TRUCK-AT ?auto_20468 ?auto_20471 ) ( LIFTING ?auto_20465 ?auto_20466 ) )
    :subtasks
    ( ( !LOAD ?auto_20465 ?auto_20466 ?auto_20468 ?auto_20471 )
      ( MAKE-2CRATE ?auto_20466 ?auto_20460 ?auto_20461 )
      ( MAKE-1CRATE-VERIFY ?auto_20460 ?auto_20461 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20473 - SURFACE
      ?auto_20474 - SURFACE
      ?auto_20475 - SURFACE
    )
    :vars
    (
      ?auto_20483 - HOIST
      ?auto_20479 - PLACE
      ?auto_20477 - PLACE
      ?auto_20476 - HOIST
      ?auto_20485 - SURFACE
      ?auto_20481 - PLACE
      ?auto_20478 - HOIST
      ?auto_20484 - SURFACE
      ?auto_20480 - SURFACE
      ?auto_20482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20483 ?auto_20479 ) ( IS-CRATE ?auto_20475 ) ( not ( = ?auto_20474 ?auto_20475 ) ) ( not ( = ?auto_20473 ?auto_20474 ) ) ( not ( = ?auto_20473 ?auto_20475 ) ) ( not ( = ?auto_20477 ?auto_20479 ) ) ( HOIST-AT ?auto_20476 ?auto_20477 ) ( not ( = ?auto_20483 ?auto_20476 ) ) ( SURFACE-AT ?auto_20475 ?auto_20477 ) ( ON ?auto_20475 ?auto_20485 ) ( CLEAR ?auto_20475 ) ( not ( = ?auto_20474 ?auto_20485 ) ) ( not ( = ?auto_20475 ?auto_20485 ) ) ( not ( = ?auto_20473 ?auto_20485 ) ) ( IS-CRATE ?auto_20474 ) ( not ( = ?auto_20481 ?auto_20479 ) ) ( not ( = ?auto_20477 ?auto_20481 ) ) ( HOIST-AT ?auto_20478 ?auto_20481 ) ( not ( = ?auto_20483 ?auto_20478 ) ) ( not ( = ?auto_20476 ?auto_20478 ) ) ( AVAILABLE ?auto_20478 ) ( SURFACE-AT ?auto_20474 ?auto_20481 ) ( ON ?auto_20474 ?auto_20484 ) ( CLEAR ?auto_20474 ) ( not ( = ?auto_20474 ?auto_20484 ) ) ( not ( = ?auto_20475 ?auto_20484 ) ) ( not ( = ?auto_20473 ?auto_20484 ) ) ( not ( = ?auto_20485 ?auto_20484 ) ) ( SURFACE-AT ?auto_20480 ?auto_20479 ) ( CLEAR ?auto_20480 ) ( IS-CRATE ?auto_20473 ) ( not ( = ?auto_20480 ?auto_20473 ) ) ( not ( = ?auto_20474 ?auto_20480 ) ) ( not ( = ?auto_20475 ?auto_20480 ) ) ( not ( = ?auto_20485 ?auto_20480 ) ) ( not ( = ?auto_20484 ?auto_20480 ) ) ( AVAILABLE ?auto_20483 ) ( TRUCK-AT ?auto_20482 ?auto_20477 ) ( LIFTING ?auto_20476 ?auto_20473 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20474 ?auto_20475 )
      ( MAKE-2CRATE-VERIFY ?auto_20473 ?auto_20474 ?auto_20475 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20486 - SURFACE
      ?auto_20487 - SURFACE
      ?auto_20488 - SURFACE
      ?auto_20489 - SURFACE
    )
    :vars
    (
      ?auto_20496 - HOIST
      ?auto_20491 - PLACE
      ?auto_20492 - PLACE
      ?auto_20490 - HOIST
      ?auto_20497 - SURFACE
      ?auto_20498 - PLACE
      ?auto_20493 - HOIST
      ?auto_20494 - SURFACE
      ?auto_20495 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20496 ?auto_20491 ) ( IS-CRATE ?auto_20489 ) ( not ( = ?auto_20488 ?auto_20489 ) ) ( not ( = ?auto_20487 ?auto_20488 ) ) ( not ( = ?auto_20487 ?auto_20489 ) ) ( not ( = ?auto_20492 ?auto_20491 ) ) ( HOIST-AT ?auto_20490 ?auto_20492 ) ( not ( = ?auto_20496 ?auto_20490 ) ) ( SURFACE-AT ?auto_20489 ?auto_20492 ) ( ON ?auto_20489 ?auto_20497 ) ( CLEAR ?auto_20489 ) ( not ( = ?auto_20488 ?auto_20497 ) ) ( not ( = ?auto_20489 ?auto_20497 ) ) ( not ( = ?auto_20487 ?auto_20497 ) ) ( IS-CRATE ?auto_20488 ) ( not ( = ?auto_20498 ?auto_20491 ) ) ( not ( = ?auto_20492 ?auto_20498 ) ) ( HOIST-AT ?auto_20493 ?auto_20498 ) ( not ( = ?auto_20496 ?auto_20493 ) ) ( not ( = ?auto_20490 ?auto_20493 ) ) ( AVAILABLE ?auto_20493 ) ( SURFACE-AT ?auto_20488 ?auto_20498 ) ( ON ?auto_20488 ?auto_20494 ) ( CLEAR ?auto_20488 ) ( not ( = ?auto_20488 ?auto_20494 ) ) ( not ( = ?auto_20489 ?auto_20494 ) ) ( not ( = ?auto_20487 ?auto_20494 ) ) ( not ( = ?auto_20497 ?auto_20494 ) ) ( SURFACE-AT ?auto_20486 ?auto_20491 ) ( CLEAR ?auto_20486 ) ( IS-CRATE ?auto_20487 ) ( not ( = ?auto_20486 ?auto_20487 ) ) ( not ( = ?auto_20488 ?auto_20486 ) ) ( not ( = ?auto_20489 ?auto_20486 ) ) ( not ( = ?auto_20497 ?auto_20486 ) ) ( not ( = ?auto_20494 ?auto_20486 ) ) ( AVAILABLE ?auto_20496 ) ( TRUCK-AT ?auto_20495 ?auto_20492 ) ( LIFTING ?auto_20490 ?auto_20487 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20487 ?auto_20488 ?auto_20489 )
      ( MAKE-3CRATE-VERIFY ?auto_20486 ?auto_20487 ?auto_20488 ?auto_20489 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20499 - SURFACE
      ?auto_20500 - SURFACE
    )
    :vars
    (
      ?auto_20508 - HOIST
      ?auto_20502 - PLACE
      ?auto_20509 - SURFACE
      ?auto_20503 - PLACE
      ?auto_20501 - HOIST
      ?auto_20510 - SURFACE
      ?auto_20511 - PLACE
      ?auto_20504 - HOIST
      ?auto_20506 - SURFACE
      ?auto_20505 - SURFACE
      ?auto_20507 - TRUCK
      ?auto_20512 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20508 ?auto_20502 ) ( IS-CRATE ?auto_20500 ) ( not ( = ?auto_20499 ?auto_20500 ) ) ( not ( = ?auto_20509 ?auto_20499 ) ) ( not ( = ?auto_20509 ?auto_20500 ) ) ( not ( = ?auto_20503 ?auto_20502 ) ) ( HOIST-AT ?auto_20501 ?auto_20503 ) ( not ( = ?auto_20508 ?auto_20501 ) ) ( SURFACE-AT ?auto_20500 ?auto_20503 ) ( ON ?auto_20500 ?auto_20510 ) ( CLEAR ?auto_20500 ) ( not ( = ?auto_20499 ?auto_20510 ) ) ( not ( = ?auto_20500 ?auto_20510 ) ) ( not ( = ?auto_20509 ?auto_20510 ) ) ( IS-CRATE ?auto_20499 ) ( not ( = ?auto_20511 ?auto_20502 ) ) ( not ( = ?auto_20503 ?auto_20511 ) ) ( HOIST-AT ?auto_20504 ?auto_20511 ) ( not ( = ?auto_20508 ?auto_20504 ) ) ( not ( = ?auto_20501 ?auto_20504 ) ) ( AVAILABLE ?auto_20504 ) ( SURFACE-AT ?auto_20499 ?auto_20511 ) ( ON ?auto_20499 ?auto_20506 ) ( CLEAR ?auto_20499 ) ( not ( = ?auto_20499 ?auto_20506 ) ) ( not ( = ?auto_20500 ?auto_20506 ) ) ( not ( = ?auto_20509 ?auto_20506 ) ) ( not ( = ?auto_20510 ?auto_20506 ) ) ( SURFACE-AT ?auto_20505 ?auto_20502 ) ( CLEAR ?auto_20505 ) ( IS-CRATE ?auto_20509 ) ( not ( = ?auto_20505 ?auto_20509 ) ) ( not ( = ?auto_20499 ?auto_20505 ) ) ( not ( = ?auto_20500 ?auto_20505 ) ) ( not ( = ?auto_20510 ?auto_20505 ) ) ( not ( = ?auto_20506 ?auto_20505 ) ) ( AVAILABLE ?auto_20508 ) ( TRUCK-AT ?auto_20507 ?auto_20503 ) ( AVAILABLE ?auto_20501 ) ( SURFACE-AT ?auto_20509 ?auto_20503 ) ( ON ?auto_20509 ?auto_20512 ) ( CLEAR ?auto_20509 ) ( not ( = ?auto_20499 ?auto_20512 ) ) ( not ( = ?auto_20500 ?auto_20512 ) ) ( not ( = ?auto_20509 ?auto_20512 ) ) ( not ( = ?auto_20510 ?auto_20512 ) ) ( not ( = ?auto_20506 ?auto_20512 ) ) ( not ( = ?auto_20505 ?auto_20512 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20501 ?auto_20509 ?auto_20512 ?auto_20503 )
      ( MAKE-2CRATE ?auto_20509 ?auto_20499 ?auto_20500 )
      ( MAKE-1CRATE-VERIFY ?auto_20499 ?auto_20500 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20513 - SURFACE
      ?auto_20514 - SURFACE
      ?auto_20515 - SURFACE
    )
    :vars
    (
      ?auto_20519 - HOIST
      ?auto_20524 - PLACE
      ?auto_20517 - PLACE
      ?auto_20518 - HOIST
      ?auto_20520 - SURFACE
      ?auto_20523 - PLACE
      ?auto_20525 - HOIST
      ?auto_20521 - SURFACE
      ?auto_20516 - SURFACE
      ?auto_20522 - TRUCK
      ?auto_20526 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20519 ?auto_20524 ) ( IS-CRATE ?auto_20515 ) ( not ( = ?auto_20514 ?auto_20515 ) ) ( not ( = ?auto_20513 ?auto_20514 ) ) ( not ( = ?auto_20513 ?auto_20515 ) ) ( not ( = ?auto_20517 ?auto_20524 ) ) ( HOIST-AT ?auto_20518 ?auto_20517 ) ( not ( = ?auto_20519 ?auto_20518 ) ) ( SURFACE-AT ?auto_20515 ?auto_20517 ) ( ON ?auto_20515 ?auto_20520 ) ( CLEAR ?auto_20515 ) ( not ( = ?auto_20514 ?auto_20520 ) ) ( not ( = ?auto_20515 ?auto_20520 ) ) ( not ( = ?auto_20513 ?auto_20520 ) ) ( IS-CRATE ?auto_20514 ) ( not ( = ?auto_20523 ?auto_20524 ) ) ( not ( = ?auto_20517 ?auto_20523 ) ) ( HOIST-AT ?auto_20525 ?auto_20523 ) ( not ( = ?auto_20519 ?auto_20525 ) ) ( not ( = ?auto_20518 ?auto_20525 ) ) ( AVAILABLE ?auto_20525 ) ( SURFACE-AT ?auto_20514 ?auto_20523 ) ( ON ?auto_20514 ?auto_20521 ) ( CLEAR ?auto_20514 ) ( not ( = ?auto_20514 ?auto_20521 ) ) ( not ( = ?auto_20515 ?auto_20521 ) ) ( not ( = ?auto_20513 ?auto_20521 ) ) ( not ( = ?auto_20520 ?auto_20521 ) ) ( SURFACE-AT ?auto_20516 ?auto_20524 ) ( CLEAR ?auto_20516 ) ( IS-CRATE ?auto_20513 ) ( not ( = ?auto_20516 ?auto_20513 ) ) ( not ( = ?auto_20514 ?auto_20516 ) ) ( not ( = ?auto_20515 ?auto_20516 ) ) ( not ( = ?auto_20520 ?auto_20516 ) ) ( not ( = ?auto_20521 ?auto_20516 ) ) ( AVAILABLE ?auto_20519 ) ( TRUCK-AT ?auto_20522 ?auto_20517 ) ( AVAILABLE ?auto_20518 ) ( SURFACE-AT ?auto_20513 ?auto_20517 ) ( ON ?auto_20513 ?auto_20526 ) ( CLEAR ?auto_20513 ) ( not ( = ?auto_20514 ?auto_20526 ) ) ( not ( = ?auto_20515 ?auto_20526 ) ) ( not ( = ?auto_20513 ?auto_20526 ) ) ( not ( = ?auto_20520 ?auto_20526 ) ) ( not ( = ?auto_20521 ?auto_20526 ) ) ( not ( = ?auto_20516 ?auto_20526 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20514 ?auto_20515 )
      ( MAKE-2CRATE-VERIFY ?auto_20513 ?auto_20514 ?auto_20515 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20527 - SURFACE
      ?auto_20528 - SURFACE
      ?auto_20529 - SURFACE
      ?auto_20530 - SURFACE
    )
    :vars
    (
      ?auto_20533 - HOIST
      ?auto_20536 - PLACE
      ?auto_20531 - PLACE
      ?auto_20532 - HOIST
      ?auto_20540 - SURFACE
      ?auto_20537 - PLACE
      ?auto_20538 - HOIST
      ?auto_20535 - SURFACE
      ?auto_20534 - TRUCK
      ?auto_20539 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20533 ?auto_20536 ) ( IS-CRATE ?auto_20530 ) ( not ( = ?auto_20529 ?auto_20530 ) ) ( not ( = ?auto_20528 ?auto_20529 ) ) ( not ( = ?auto_20528 ?auto_20530 ) ) ( not ( = ?auto_20531 ?auto_20536 ) ) ( HOIST-AT ?auto_20532 ?auto_20531 ) ( not ( = ?auto_20533 ?auto_20532 ) ) ( SURFACE-AT ?auto_20530 ?auto_20531 ) ( ON ?auto_20530 ?auto_20540 ) ( CLEAR ?auto_20530 ) ( not ( = ?auto_20529 ?auto_20540 ) ) ( not ( = ?auto_20530 ?auto_20540 ) ) ( not ( = ?auto_20528 ?auto_20540 ) ) ( IS-CRATE ?auto_20529 ) ( not ( = ?auto_20537 ?auto_20536 ) ) ( not ( = ?auto_20531 ?auto_20537 ) ) ( HOIST-AT ?auto_20538 ?auto_20537 ) ( not ( = ?auto_20533 ?auto_20538 ) ) ( not ( = ?auto_20532 ?auto_20538 ) ) ( AVAILABLE ?auto_20538 ) ( SURFACE-AT ?auto_20529 ?auto_20537 ) ( ON ?auto_20529 ?auto_20535 ) ( CLEAR ?auto_20529 ) ( not ( = ?auto_20529 ?auto_20535 ) ) ( not ( = ?auto_20530 ?auto_20535 ) ) ( not ( = ?auto_20528 ?auto_20535 ) ) ( not ( = ?auto_20540 ?auto_20535 ) ) ( SURFACE-AT ?auto_20527 ?auto_20536 ) ( CLEAR ?auto_20527 ) ( IS-CRATE ?auto_20528 ) ( not ( = ?auto_20527 ?auto_20528 ) ) ( not ( = ?auto_20529 ?auto_20527 ) ) ( not ( = ?auto_20530 ?auto_20527 ) ) ( not ( = ?auto_20540 ?auto_20527 ) ) ( not ( = ?auto_20535 ?auto_20527 ) ) ( AVAILABLE ?auto_20533 ) ( TRUCK-AT ?auto_20534 ?auto_20531 ) ( AVAILABLE ?auto_20532 ) ( SURFACE-AT ?auto_20528 ?auto_20531 ) ( ON ?auto_20528 ?auto_20539 ) ( CLEAR ?auto_20528 ) ( not ( = ?auto_20529 ?auto_20539 ) ) ( not ( = ?auto_20530 ?auto_20539 ) ) ( not ( = ?auto_20528 ?auto_20539 ) ) ( not ( = ?auto_20540 ?auto_20539 ) ) ( not ( = ?auto_20535 ?auto_20539 ) ) ( not ( = ?auto_20527 ?auto_20539 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20528 ?auto_20529 ?auto_20530 )
      ( MAKE-3CRATE-VERIFY ?auto_20527 ?auto_20528 ?auto_20529 ?auto_20530 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20541 - SURFACE
      ?auto_20542 - SURFACE
    )
    :vars
    (
      ?auto_20545 - HOIST
      ?auto_20549 - PLACE
      ?auto_20552 - SURFACE
      ?auto_20543 - PLACE
      ?auto_20544 - HOIST
      ?auto_20554 - SURFACE
      ?auto_20550 - PLACE
      ?auto_20551 - HOIST
      ?auto_20547 - SURFACE
      ?auto_20548 - SURFACE
      ?auto_20553 - SURFACE
      ?auto_20546 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20545 ?auto_20549 ) ( IS-CRATE ?auto_20542 ) ( not ( = ?auto_20541 ?auto_20542 ) ) ( not ( = ?auto_20552 ?auto_20541 ) ) ( not ( = ?auto_20552 ?auto_20542 ) ) ( not ( = ?auto_20543 ?auto_20549 ) ) ( HOIST-AT ?auto_20544 ?auto_20543 ) ( not ( = ?auto_20545 ?auto_20544 ) ) ( SURFACE-AT ?auto_20542 ?auto_20543 ) ( ON ?auto_20542 ?auto_20554 ) ( CLEAR ?auto_20542 ) ( not ( = ?auto_20541 ?auto_20554 ) ) ( not ( = ?auto_20542 ?auto_20554 ) ) ( not ( = ?auto_20552 ?auto_20554 ) ) ( IS-CRATE ?auto_20541 ) ( not ( = ?auto_20550 ?auto_20549 ) ) ( not ( = ?auto_20543 ?auto_20550 ) ) ( HOIST-AT ?auto_20551 ?auto_20550 ) ( not ( = ?auto_20545 ?auto_20551 ) ) ( not ( = ?auto_20544 ?auto_20551 ) ) ( AVAILABLE ?auto_20551 ) ( SURFACE-AT ?auto_20541 ?auto_20550 ) ( ON ?auto_20541 ?auto_20547 ) ( CLEAR ?auto_20541 ) ( not ( = ?auto_20541 ?auto_20547 ) ) ( not ( = ?auto_20542 ?auto_20547 ) ) ( not ( = ?auto_20552 ?auto_20547 ) ) ( not ( = ?auto_20554 ?auto_20547 ) ) ( SURFACE-AT ?auto_20548 ?auto_20549 ) ( CLEAR ?auto_20548 ) ( IS-CRATE ?auto_20552 ) ( not ( = ?auto_20548 ?auto_20552 ) ) ( not ( = ?auto_20541 ?auto_20548 ) ) ( not ( = ?auto_20542 ?auto_20548 ) ) ( not ( = ?auto_20554 ?auto_20548 ) ) ( not ( = ?auto_20547 ?auto_20548 ) ) ( AVAILABLE ?auto_20545 ) ( AVAILABLE ?auto_20544 ) ( SURFACE-AT ?auto_20552 ?auto_20543 ) ( ON ?auto_20552 ?auto_20553 ) ( CLEAR ?auto_20552 ) ( not ( = ?auto_20541 ?auto_20553 ) ) ( not ( = ?auto_20542 ?auto_20553 ) ) ( not ( = ?auto_20552 ?auto_20553 ) ) ( not ( = ?auto_20554 ?auto_20553 ) ) ( not ( = ?auto_20547 ?auto_20553 ) ) ( not ( = ?auto_20548 ?auto_20553 ) ) ( TRUCK-AT ?auto_20546 ?auto_20549 ) )
    :subtasks
    ( ( !DRIVE ?auto_20546 ?auto_20549 ?auto_20543 )
      ( MAKE-2CRATE ?auto_20552 ?auto_20541 ?auto_20542 )
      ( MAKE-1CRATE-VERIFY ?auto_20541 ?auto_20542 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20555 - SURFACE
      ?auto_20556 - SURFACE
      ?auto_20557 - SURFACE
    )
    :vars
    (
      ?auto_20560 - HOIST
      ?auto_20562 - PLACE
      ?auto_20558 - PLACE
      ?auto_20563 - HOIST
      ?auto_20568 - SURFACE
      ?auto_20564 - PLACE
      ?auto_20566 - HOIST
      ?auto_20559 - SURFACE
      ?auto_20567 - SURFACE
      ?auto_20561 - SURFACE
      ?auto_20565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20560 ?auto_20562 ) ( IS-CRATE ?auto_20557 ) ( not ( = ?auto_20556 ?auto_20557 ) ) ( not ( = ?auto_20555 ?auto_20556 ) ) ( not ( = ?auto_20555 ?auto_20557 ) ) ( not ( = ?auto_20558 ?auto_20562 ) ) ( HOIST-AT ?auto_20563 ?auto_20558 ) ( not ( = ?auto_20560 ?auto_20563 ) ) ( SURFACE-AT ?auto_20557 ?auto_20558 ) ( ON ?auto_20557 ?auto_20568 ) ( CLEAR ?auto_20557 ) ( not ( = ?auto_20556 ?auto_20568 ) ) ( not ( = ?auto_20557 ?auto_20568 ) ) ( not ( = ?auto_20555 ?auto_20568 ) ) ( IS-CRATE ?auto_20556 ) ( not ( = ?auto_20564 ?auto_20562 ) ) ( not ( = ?auto_20558 ?auto_20564 ) ) ( HOIST-AT ?auto_20566 ?auto_20564 ) ( not ( = ?auto_20560 ?auto_20566 ) ) ( not ( = ?auto_20563 ?auto_20566 ) ) ( AVAILABLE ?auto_20566 ) ( SURFACE-AT ?auto_20556 ?auto_20564 ) ( ON ?auto_20556 ?auto_20559 ) ( CLEAR ?auto_20556 ) ( not ( = ?auto_20556 ?auto_20559 ) ) ( not ( = ?auto_20557 ?auto_20559 ) ) ( not ( = ?auto_20555 ?auto_20559 ) ) ( not ( = ?auto_20568 ?auto_20559 ) ) ( SURFACE-AT ?auto_20567 ?auto_20562 ) ( CLEAR ?auto_20567 ) ( IS-CRATE ?auto_20555 ) ( not ( = ?auto_20567 ?auto_20555 ) ) ( not ( = ?auto_20556 ?auto_20567 ) ) ( not ( = ?auto_20557 ?auto_20567 ) ) ( not ( = ?auto_20568 ?auto_20567 ) ) ( not ( = ?auto_20559 ?auto_20567 ) ) ( AVAILABLE ?auto_20560 ) ( AVAILABLE ?auto_20563 ) ( SURFACE-AT ?auto_20555 ?auto_20558 ) ( ON ?auto_20555 ?auto_20561 ) ( CLEAR ?auto_20555 ) ( not ( = ?auto_20556 ?auto_20561 ) ) ( not ( = ?auto_20557 ?auto_20561 ) ) ( not ( = ?auto_20555 ?auto_20561 ) ) ( not ( = ?auto_20568 ?auto_20561 ) ) ( not ( = ?auto_20559 ?auto_20561 ) ) ( not ( = ?auto_20567 ?auto_20561 ) ) ( TRUCK-AT ?auto_20565 ?auto_20562 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20556 ?auto_20557 )
      ( MAKE-2CRATE-VERIFY ?auto_20555 ?auto_20556 ?auto_20557 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20569 - SURFACE
      ?auto_20570 - SURFACE
      ?auto_20571 - SURFACE
      ?auto_20572 - SURFACE
    )
    :vars
    (
      ?auto_20581 - HOIST
      ?auto_20577 - PLACE
      ?auto_20573 - PLACE
      ?auto_20574 - HOIST
      ?auto_20580 - SURFACE
      ?auto_20576 - PLACE
      ?auto_20582 - HOIST
      ?auto_20575 - SURFACE
      ?auto_20579 - SURFACE
      ?auto_20578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20581 ?auto_20577 ) ( IS-CRATE ?auto_20572 ) ( not ( = ?auto_20571 ?auto_20572 ) ) ( not ( = ?auto_20570 ?auto_20571 ) ) ( not ( = ?auto_20570 ?auto_20572 ) ) ( not ( = ?auto_20573 ?auto_20577 ) ) ( HOIST-AT ?auto_20574 ?auto_20573 ) ( not ( = ?auto_20581 ?auto_20574 ) ) ( SURFACE-AT ?auto_20572 ?auto_20573 ) ( ON ?auto_20572 ?auto_20580 ) ( CLEAR ?auto_20572 ) ( not ( = ?auto_20571 ?auto_20580 ) ) ( not ( = ?auto_20572 ?auto_20580 ) ) ( not ( = ?auto_20570 ?auto_20580 ) ) ( IS-CRATE ?auto_20571 ) ( not ( = ?auto_20576 ?auto_20577 ) ) ( not ( = ?auto_20573 ?auto_20576 ) ) ( HOIST-AT ?auto_20582 ?auto_20576 ) ( not ( = ?auto_20581 ?auto_20582 ) ) ( not ( = ?auto_20574 ?auto_20582 ) ) ( AVAILABLE ?auto_20582 ) ( SURFACE-AT ?auto_20571 ?auto_20576 ) ( ON ?auto_20571 ?auto_20575 ) ( CLEAR ?auto_20571 ) ( not ( = ?auto_20571 ?auto_20575 ) ) ( not ( = ?auto_20572 ?auto_20575 ) ) ( not ( = ?auto_20570 ?auto_20575 ) ) ( not ( = ?auto_20580 ?auto_20575 ) ) ( SURFACE-AT ?auto_20569 ?auto_20577 ) ( CLEAR ?auto_20569 ) ( IS-CRATE ?auto_20570 ) ( not ( = ?auto_20569 ?auto_20570 ) ) ( not ( = ?auto_20571 ?auto_20569 ) ) ( not ( = ?auto_20572 ?auto_20569 ) ) ( not ( = ?auto_20580 ?auto_20569 ) ) ( not ( = ?auto_20575 ?auto_20569 ) ) ( AVAILABLE ?auto_20581 ) ( AVAILABLE ?auto_20574 ) ( SURFACE-AT ?auto_20570 ?auto_20573 ) ( ON ?auto_20570 ?auto_20579 ) ( CLEAR ?auto_20570 ) ( not ( = ?auto_20571 ?auto_20579 ) ) ( not ( = ?auto_20572 ?auto_20579 ) ) ( not ( = ?auto_20570 ?auto_20579 ) ) ( not ( = ?auto_20580 ?auto_20579 ) ) ( not ( = ?auto_20575 ?auto_20579 ) ) ( not ( = ?auto_20569 ?auto_20579 ) ) ( TRUCK-AT ?auto_20578 ?auto_20577 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20570 ?auto_20571 ?auto_20572 )
      ( MAKE-3CRATE-VERIFY ?auto_20569 ?auto_20570 ?auto_20571 ?auto_20572 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20597 - SURFACE
      ?auto_20598 - SURFACE
    )
    :vars
    (
      ?auto_20599 - HOIST
      ?auto_20600 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20599 ?auto_20600 ) ( SURFACE-AT ?auto_20597 ?auto_20600 ) ( CLEAR ?auto_20597 ) ( LIFTING ?auto_20599 ?auto_20598 ) ( IS-CRATE ?auto_20598 ) ( not ( = ?auto_20597 ?auto_20598 ) ) )
    :subtasks
    ( ( !DROP ?auto_20599 ?auto_20598 ?auto_20597 ?auto_20600 )
      ( MAKE-1CRATE-VERIFY ?auto_20597 ?auto_20598 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20601 - SURFACE
      ?auto_20602 - SURFACE
      ?auto_20603 - SURFACE
    )
    :vars
    (
      ?auto_20604 - HOIST
      ?auto_20605 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20604 ?auto_20605 ) ( SURFACE-AT ?auto_20602 ?auto_20605 ) ( CLEAR ?auto_20602 ) ( LIFTING ?auto_20604 ?auto_20603 ) ( IS-CRATE ?auto_20603 ) ( not ( = ?auto_20602 ?auto_20603 ) ) ( ON ?auto_20602 ?auto_20601 ) ( not ( = ?auto_20601 ?auto_20602 ) ) ( not ( = ?auto_20601 ?auto_20603 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20602 ?auto_20603 )
      ( MAKE-2CRATE-VERIFY ?auto_20601 ?auto_20602 ?auto_20603 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20606 - SURFACE
      ?auto_20607 - SURFACE
      ?auto_20608 - SURFACE
      ?auto_20609 - SURFACE
    )
    :vars
    (
      ?auto_20610 - HOIST
      ?auto_20611 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20610 ?auto_20611 ) ( SURFACE-AT ?auto_20608 ?auto_20611 ) ( CLEAR ?auto_20608 ) ( LIFTING ?auto_20610 ?auto_20609 ) ( IS-CRATE ?auto_20609 ) ( not ( = ?auto_20608 ?auto_20609 ) ) ( ON ?auto_20607 ?auto_20606 ) ( ON ?auto_20608 ?auto_20607 ) ( not ( = ?auto_20606 ?auto_20607 ) ) ( not ( = ?auto_20606 ?auto_20608 ) ) ( not ( = ?auto_20606 ?auto_20609 ) ) ( not ( = ?auto_20607 ?auto_20608 ) ) ( not ( = ?auto_20607 ?auto_20609 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20608 ?auto_20609 )
      ( MAKE-3CRATE-VERIFY ?auto_20606 ?auto_20607 ?auto_20608 ?auto_20609 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20612 - SURFACE
      ?auto_20613 - SURFACE
      ?auto_20614 - SURFACE
      ?auto_20615 - SURFACE
      ?auto_20616 - SURFACE
    )
    :vars
    (
      ?auto_20617 - HOIST
      ?auto_20618 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20617 ?auto_20618 ) ( SURFACE-AT ?auto_20615 ?auto_20618 ) ( CLEAR ?auto_20615 ) ( LIFTING ?auto_20617 ?auto_20616 ) ( IS-CRATE ?auto_20616 ) ( not ( = ?auto_20615 ?auto_20616 ) ) ( ON ?auto_20613 ?auto_20612 ) ( ON ?auto_20614 ?auto_20613 ) ( ON ?auto_20615 ?auto_20614 ) ( not ( = ?auto_20612 ?auto_20613 ) ) ( not ( = ?auto_20612 ?auto_20614 ) ) ( not ( = ?auto_20612 ?auto_20615 ) ) ( not ( = ?auto_20612 ?auto_20616 ) ) ( not ( = ?auto_20613 ?auto_20614 ) ) ( not ( = ?auto_20613 ?auto_20615 ) ) ( not ( = ?auto_20613 ?auto_20616 ) ) ( not ( = ?auto_20614 ?auto_20615 ) ) ( not ( = ?auto_20614 ?auto_20616 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20615 ?auto_20616 )
      ( MAKE-4CRATE-VERIFY ?auto_20612 ?auto_20613 ?auto_20614 ?auto_20615 ?auto_20616 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20619 - SURFACE
      ?auto_20620 - SURFACE
    )
    :vars
    (
      ?auto_20621 - HOIST
      ?auto_20622 - PLACE
      ?auto_20623 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20621 ?auto_20622 ) ( SURFACE-AT ?auto_20619 ?auto_20622 ) ( CLEAR ?auto_20619 ) ( IS-CRATE ?auto_20620 ) ( not ( = ?auto_20619 ?auto_20620 ) ) ( TRUCK-AT ?auto_20623 ?auto_20622 ) ( AVAILABLE ?auto_20621 ) ( IN ?auto_20620 ?auto_20623 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20621 ?auto_20620 ?auto_20623 ?auto_20622 )
      ( MAKE-1CRATE ?auto_20619 ?auto_20620 )
      ( MAKE-1CRATE-VERIFY ?auto_20619 ?auto_20620 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20624 - SURFACE
      ?auto_20625 - SURFACE
      ?auto_20626 - SURFACE
    )
    :vars
    (
      ?auto_20627 - HOIST
      ?auto_20629 - PLACE
      ?auto_20628 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20627 ?auto_20629 ) ( SURFACE-AT ?auto_20625 ?auto_20629 ) ( CLEAR ?auto_20625 ) ( IS-CRATE ?auto_20626 ) ( not ( = ?auto_20625 ?auto_20626 ) ) ( TRUCK-AT ?auto_20628 ?auto_20629 ) ( AVAILABLE ?auto_20627 ) ( IN ?auto_20626 ?auto_20628 ) ( ON ?auto_20625 ?auto_20624 ) ( not ( = ?auto_20624 ?auto_20625 ) ) ( not ( = ?auto_20624 ?auto_20626 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20625 ?auto_20626 )
      ( MAKE-2CRATE-VERIFY ?auto_20624 ?auto_20625 ?auto_20626 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20630 - SURFACE
      ?auto_20631 - SURFACE
      ?auto_20632 - SURFACE
      ?auto_20633 - SURFACE
    )
    :vars
    (
      ?auto_20636 - HOIST
      ?auto_20635 - PLACE
      ?auto_20634 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20636 ?auto_20635 ) ( SURFACE-AT ?auto_20632 ?auto_20635 ) ( CLEAR ?auto_20632 ) ( IS-CRATE ?auto_20633 ) ( not ( = ?auto_20632 ?auto_20633 ) ) ( TRUCK-AT ?auto_20634 ?auto_20635 ) ( AVAILABLE ?auto_20636 ) ( IN ?auto_20633 ?auto_20634 ) ( ON ?auto_20632 ?auto_20631 ) ( not ( = ?auto_20631 ?auto_20632 ) ) ( not ( = ?auto_20631 ?auto_20633 ) ) ( ON ?auto_20631 ?auto_20630 ) ( not ( = ?auto_20630 ?auto_20631 ) ) ( not ( = ?auto_20630 ?auto_20632 ) ) ( not ( = ?auto_20630 ?auto_20633 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20631 ?auto_20632 ?auto_20633 )
      ( MAKE-3CRATE-VERIFY ?auto_20630 ?auto_20631 ?auto_20632 ?auto_20633 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20637 - SURFACE
      ?auto_20638 - SURFACE
      ?auto_20639 - SURFACE
      ?auto_20640 - SURFACE
      ?auto_20641 - SURFACE
    )
    :vars
    (
      ?auto_20644 - HOIST
      ?auto_20643 - PLACE
      ?auto_20642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20644 ?auto_20643 ) ( SURFACE-AT ?auto_20640 ?auto_20643 ) ( CLEAR ?auto_20640 ) ( IS-CRATE ?auto_20641 ) ( not ( = ?auto_20640 ?auto_20641 ) ) ( TRUCK-AT ?auto_20642 ?auto_20643 ) ( AVAILABLE ?auto_20644 ) ( IN ?auto_20641 ?auto_20642 ) ( ON ?auto_20640 ?auto_20639 ) ( not ( = ?auto_20639 ?auto_20640 ) ) ( not ( = ?auto_20639 ?auto_20641 ) ) ( ON ?auto_20638 ?auto_20637 ) ( ON ?auto_20639 ?auto_20638 ) ( not ( = ?auto_20637 ?auto_20638 ) ) ( not ( = ?auto_20637 ?auto_20639 ) ) ( not ( = ?auto_20637 ?auto_20640 ) ) ( not ( = ?auto_20637 ?auto_20641 ) ) ( not ( = ?auto_20638 ?auto_20639 ) ) ( not ( = ?auto_20638 ?auto_20640 ) ) ( not ( = ?auto_20638 ?auto_20641 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20639 ?auto_20640 ?auto_20641 )
      ( MAKE-4CRATE-VERIFY ?auto_20637 ?auto_20638 ?auto_20639 ?auto_20640 ?auto_20641 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20645 - SURFACE
      ?auto_20646 - SURFACE
    )
    :vars
    (
      ?auto_20650 - HOIST
      ?auto_20649 - PLACE
      ?auto_20648 - TRUCK
      ?auto_20647 - SURFACE
      ?auto_20651 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20650 ?auto_20649 ) ( SURFACE-AT ?auto_20645 ?auto_20649 ) ( CLEAR ?auto_20645 ) ( IS-CRATE ?auto_20646 ) ( not ( = ?auto_20645 ?auto_20646 ) ) ( AVAILABLE ?auto_20650 ) ( IN ?auto_20646 ?auto_20648 ) ( ON ?auto_20645 ?auto_20647 ) ( not ( = ?auto_20647 ?auto_20645 ) ) ( not ( = ?auto_20647 ?auto_20646 ) ) ( TRUCK-AT ?auto_20648 ?auto_20651 ) ( not ( = ?auto_20651 ?auto_20649 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20648 ?auto_20651 ?auto_20649 )
      ( MAKE-2CRATE ?auto_20647 ?auto_20645 ?auto_20646 )
      ( MAKE-1CRATE-VERIFY ?auto_20645 ?auto_20646 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20652 - SURFACE
      ?auto_20653 - SURFACE
      ?auto_20654 - SURFACE
    )
    :vars
    (
      ?auto_20658 - HOIST
      ?auto_20656 - PLACE
      ?auto_20657 - TRUCK
      ?auto_20655 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20658 ?auto_20656 ) ( SURFACE-AT ?auto_20653 ?auto_20656 ) ( CLEAR ?auto_20653 ) ( IS-CRATE ?auto_20654 ) ( not ( = ?auto_20653 ?auto_20654 ) ) ( AVAILABLE ?auto_20658 ) ( IN ?auto_20654 ?auto_20657 ) ( ON ?auto_20653 ?auto_20652 ) ( not ( = ?auto_20652 ?auto_20653 ) ) ( not ( = ?auto_20652 ?auto_20654 ) ) ( TRUCK-AT ?auto_20657 ?auto_20655 ) ( not ( = ?auto_20655 ?auto_20656 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20653 ?auto_20654 )
      ( MAKE-2CRATE-VERIFY ?auto_20652 ?auto_20653 ?auto_20654 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20659 - SURFACE
      ?auto_20660 - SURFACE
      ?auto_20661 - SURFACE
      ?auto_20662 - SURFACE
    )
    :vars
    (
      ?auto_20665 - HOIST
      ?auto_20666 - PLACE
      ?auto_20664 - TRUCK
      ?auto_20663 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20665 ?auto_20666 ) ( SURFACE-AT ?auto_20661 ?auto_20666 ) ( CLEAR ?auto_20661 ) ( IS-CRATE ?auto_20662 ) ( not ( = ?auto_20661 ?auto_20662 ) ) ( AVAILABLE ?auto_20665 ) ( IN ?auto_20662 ?auto_20664 ) ( ON ?auto_20661 ?auto_20660 ) ( not ( = ?auto_20660 ?auto_20661 ) ) ( not ( = ?auto_20660 ?auto_20662 ) ) ( TRUCK-AT ?auto_20664 ?auto_20663 ) ( not ( = ?auto_20663 ?auto_20666 ) ) ( ON ?auto_20660 ?auto_20659 ) ( not ( = ?auto_20659 ?auto_20660 ) ) ( not ( = ?auto_20659 ?auto_20661 ) ) ( not ( = ?auto_20659 ?auto_20662 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20660 ?auto_20661 ?auto_20662 )
      ( MAKE-3CRATE-VERIFY ?auto_20659 ?auto_20660 ?auto_20661 ?auto_20662 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20667 - SURFACE
      ?auto_20668 - SURFACE
      ?auto_20669 - SURFACE
      ?auto_20670 - SURFACE
      ?auto_20671 - SURFACE
    )
    :vars
    (
      ?auto_20674 - HOIST
      ?auto_20675 - PLACE
      ?auto_20673 - TRUCK
      ?auto_20672 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20674 ?auto_20675 ) ( SURFACE-AT ?auto_20670 ?auto_20675 ) ( CLEAR ?auto_20670 ) ( IS-CRATE ?auto_20671 ) ( not ( = ?auto_20670 ?auto_20671 ) ) ( AVAILABLE ?auto_20674 ) ( IN ?auto_20671 ?auto_20673 ) ( ON ?auto_20670 ?auto_20669 ) ( not ( = ?auto_20669 ?auto_20670 ) ) ( not ( = ?auto_20669 ?auto_20671 ) ) ( TRUCK-AT ?auto_20673 ?auto_20672 ) ( not ( = ?auto_20672 ?auto_20675 ) ) ( ON ?auto_20668 ?auto_20667 ) ( ON ?auto_20669 ?auto_20668 ) ( not ( = ?auto_20667 ?auto_20668 ) ) ( not ( = ?auto_20667 ?auto_20669 ) ) ( not ( = ?auto_20667 ?auto_20670 ) ) ( not ( = ?auto_20667 ?auto_20671 ) ) ( not ( = ?auto_20668 ?auto_20669 ) ) ( not ( = ?auto_20668 ?auto_20670 ) ) ( not ( = ?auto_20668 ?auto_20671 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20669 ?auto_20670 ?auto_20671 )
      ( MAKE-4CRATE-VERIFY ?auto_20667 ?auto_20668 ?auto_20669 ?auto_20670 ?auto_20671 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20676 - SURFACE
      ?auto_20677 - SURFACE
    )
    :vars
    (
      ?auto_20680 - HOIST
      ?auto_20681 - PLACE
      ?auto_20682 - SURFACE
      ?auto_20679 - TRUCK
      ?auto_20678 - PLACE
      ?auto_20683 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20680 ?auto_20681 ) ( SURFACE-AT ?auto_20676 ?auto_20681 ) ( CLEAR ?auto_20676 ) ( IS-CRATE ?auto_20677 ) ( not ( = ?auto_20676 ?auto_20677 ) ) ( AVAILABLE ?auto_20680 ) ( ON ?auto_20676 ?auto_20682 ) ( not ( = ?auto_20682 ?auto_20676 ) ) ( not ( = ?auto_20682 ?auto_20677 ) ) ( TRUCK-AT ?auto_20679 ?auto_20678 ) ( not ( = ?auto_20678 ?auto_20681 ) ) ( HOIST-AT ?auto_20683 ?auto_20678 ) ( LIFTING ?auto_20683 ?auto_20677 ) ( not ( = ?auto_20680 ?auto_20683 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20683 ?auto_20677 ?auto_20679 ?auto_20678 )
      ( MAKE-2CRATE ?auto_20682 ?auto_20676 ?auto_20677 )
      ( MAKE-1CRATE-VERIFY ?auto_20676 ?auto_20677 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20684 - SURFACE
      ?auto_20685 - SURFACE
      ?auto_20686 - SURFACE
    )
    :vars
    (
      ?auto_20689 - HOIST
      ?auto_20687 - PLACE
      ?auto_20688 - TRUCK
      ?auto_20690 - PLACE
      ?auto_20691 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20689 ?auto_20687 ) ( SURFACE-AT ?auto_20685 ?auto_20687 ) ( CLEAR ?auto_20685 ) ( IS-CRATE ?auto_20686 ) ( not ( = ?auto_20685 ?auto_20686 ) ) ( AVAILABLE ?auto_20689 ) ( ON ?auto_20685 ?auto_20684 ) ( not ( = ?auto_20684 ?auto_20685 ) ) ( not ( = ?auto_20684 ?auto_20686 ) ) ( TRUCK-AT ?auto_20688 ?auto_20690 ) ( not ( = ?auto_20690 ?auto_20687 ) ) ( HOIST-AT ?auto_20691 ?auto_20690 ) ( LIFTING ?auto_20691 ?auto_20686 ) ( not ( = ?auto_20689 ?auto_20691 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20685 ?auto_20686 )
      ( MAKE-2CRATE-VERIFY ?auto_20684 ?auto_20685 ?auto_20686 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20692 - SURFACE
      ?auto_20693 - SURFACE
      ?auto_20694 - SURFACE
      ?auto_20695 - SURFACE
    )
    :vars
    (
      ?auto_20696 - HOIST
      ?auto_20700 - PLACE
      ?auto_20698 - TRUCK
      ?auto_20699 - PLACE
      ?auto_20697 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20696 ?auto_20700 ) ( SURFACE-AT ?auto_20694 ?auto_20700 ) ( CLEAR ?auto_20694 ) ( IS-CRATE ?auto_20695 ) ( not ( = ?auto_20694 ?auto_20695 ) ) ( AVAILABLE ?auto_20696 ) ( ON ?auto_20694 ?auto_20693 ) ( not ( = ?auto_20693 ?auto_20694 ) ) ( not ( = ?auto_20693 ?auto_20695 ) ) ( TRUCK-AT ?auto_20698 ?auto_20699 ) ( not ( = ?auto_20699 ?auto_20700 ) ) ( HOIST-AT ?auto_20697 ?auto_20699 ) ( LIFTING ?auto_20697 ?auto_20695 ) ( not ( = ?auto_20696 ?auto_20697 ) ) ( ON ?auto_20693 ?auto_20692 ) ( not ( = ?auto_20692 ?auto_20693 ) ) ( not ( = ?auto_20692 ?auto_20694 ) ) ( not ( = ?auto_20692 ?auto_20695 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20693 ?auto_20694 ?auto_20695 )
      ( MAKE-3CRATE-VERIFY ?auto_20692 ?auto_20693 ?auto_20694 ?auto_20695 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20701 - SURFACE
      ?auto_20702 - SURFACE
      ?auto_20703 - SURFACE
      ?auto_20704 - SURFACE
      ?auto_20705 - SURFACE
    )
    :vars
    (
      ?auto_20706 - HOIST
      ?auto_20710 - PLACE
      ?auto_20708 - TRUCK
      ?auto_20709 - PLACE
      ?auto_20707 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20706 ?auto_20710 ) ( SURFACE-AT ?auto_20704 ?auto_20710 ) ( CLEAR ?auto_20704 ) ( IS-CRATE ?auto_20705 ) ( not ( = ?auto_20704 ?auto_20705 ) ) ( AVAILABLE ?auto_20706 ) ( ON ?auto_20704 ?auto_20703 ) ( not ( = ?auto_20703 ?auto_20704 ) ) ( not ( = ?auto_20703 ?auto_20705 ) ) ( TRUCK-AT ?auto_20708 ?auto_20709 ) ( not ( = ?auto_20709 ?auto_20710 ) ) ( HOIST-AT ?auto_20707 ?auto_20709 ) ( LIFTING ?auto_20707 ?auto_20705 ) ( not ( = ?auto_20706 ?auto_20707 ) ) ( ON ?auto_20702 ?auto_20701 ) ( ON ?auto_20703 ?auto_20702 ) ( not ( = ?auto_20701 ?auto_20702 ) ) ( not ( = ?auto_20701 ?auto_20703 ) ) ( not ( = ?auto_20701 ?auto_20704 ) ) ( not ( = ?auto_20701 ?auto_20705 ) ) ( not ( = ?auto_20702 ?auto_20703 ) ) ( not ( = ?auto_20702 ?auto_20704 ) ) ( not ( = ?auto_20702 ?auto_20705 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20703 ?auto_20704 ?auto_20705 )
      ( MAKE-4CRATE-VERIFY ?auto_20701 ?auto_20702 ?auto_20703 ?auto_20704 ?auto_20705 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20711 - SURFACE
      ?auto_20712 - SURFACE
    )
    :vars
    (
      ?auto_20713 - HOIST
      ?auto_20718 - PLACE
      ?auto_20715 - SURFACE
      ?auto_20716 - TRUCK
      ?auto_20717 - PLACE
      ?auto_20714 - HOIST
      ?auto_20719 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20713 ?auto_20718 ) ( SURFACE-AT ?auto_20711 ?auto_20718 ) ( CLEAR ?auto_20711 ) ( IS-CRATE ?auto_20712 ) ( not ( = ?auto_20711 ?auto_20712 ) ) ( AVAILABLE ?auto_20713 ) ( ON ?auto_20711 ?auto_20715 ) ( not ( = ?auto_20715 ?auto_20711 ) ) ( not ( = ?auto_20715 ?auto_20712 ) ) ( TRUCK-AT ?auto_20716 ?auto_20717 ) ( not ( = ?auto_20717 ?auto_20718 ) ) ( HOIST-AT ?auto_20714 ?auto_20717 ) ( not ( = ?auto_20713 ?auto_20714 ) ) ( AVAILABLE ?auto_20714 ) ( SURFACE-AT ?auto_20712 ?auto_20717 ) ( ON ?auto_20712 ?auto_20719 ) ( CLEAR ?auto_20712 ) ( not ( = ?auto_20711 ?auto_20719 ) ) ( not ( = ?auto_20712 ?auto_20719 ) ) ( not ( = ?auto_20715 ?auto_20719 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20714 ?auto_20712 ?auto_20719 ?auto_20717 )
      ( MAKE-2CRATE ?auto_20715 ?auto_20711 ?auto_20712 )
      ( MAKE-1CRATE-VERIFY ?auto_20711 ?auto_20712 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20720 - SURFACE
      ?auto_20721 - SURFACE
      ?auto_20722 - SURFACE
    )
    :vars
    (
      ?auto_20725 - HOIST
      ?auto_20728 - PLACE
      ?auto_20723 - TRUCK
      ?auto_20727 - PLACE
      ?auto_20726 - HOIST
      ?auto_20724 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20725 ?auto_20728 ) ( SURFACE-AT ?auto_20721 ?auto_20728 ) ( CLEAR ?auto_20721 ) ( IS-CRATE ?auto_20722 ) ( not ( = ?auto_20721 ?auto_20722 ) ) ( AVAILABLE ?auto_20725 ) ( ON ?auto_20721 ?auto_20720 ) ( not ( = ?auto_20720 ?auto_20721 ) ) ( not ( = ?auto_20720 ?auto_20722 ) ) ( TRUCK-AT ?auto_20723 ?auto_20727 ) ( not ( = ?auto_20727 ?auto_20728 ) ) ( HOIST-AT ?auto_20726 ?auto_20727 ) ( not ( = ?auto_20725 ?auto_20726 ) ) ( AVAILABLE ?auto_20726 ) ( SURFACE-AT ?auto_20722 ?auto_20727 ) ( ON ?auto_20722 ?auto_20724 ) ( CLEAR ?auto_20722 ) ( not ( = ?auto_20721 ?auto_20724 ) ) ( not ( = ?auto_20722 ?auto_20724 ) ) ( not ( = ?auto_20720 ?auto_20724 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20721 ?auto_20722 )
      ( MAKE-2CRATE-VERIFY ?auto_20720 ?auto_20721 ?auto_20722 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20729 - SURFACE
      ?auto_20730 - SURFACE
      ?auto_20731 - SURFACE
      ?auto_20732 - SURFACE
    )
    :vars
    (
      ?auto_20733 - HOIST
      ?auto_20734 - PLACE
      ?auto_20735 - TRUCK
      ?auto_20737 - PLACE
      ?auto_20738 - HOIST
      ?auto_20736 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20733 ?auto_20734 ) ( SURFACE-AT ?auto_20731 ?auto_20734 ) ( CLEAR ?auto_20731 ) ( IS-CRATE ?auto_20732 ) ( not ( = ?auto_20731 ?auto_20732 ) ) ( AVAILABLE ?auto_20733 ) ( ON ?auto_20731 ?auto_20730 ) ( not ( = ?auto_20730 ?auto_20731 ) ) ( not ( = ?auto_20730 ?auto_20732 ) ) ( TRUCK-AT ?auto_20735 ?auto_20737 ) ( not ( = ?auto_20737 ?auto_20734 ) ) ( HOIST-AT ?auto_20738 ?auto_20737 ) ( not ( = ?auto_20733 ?auto_20738 ) ) ( AVAILABLE ?auto_20738 ) ( SURFACE-AT ?auto_20732 ?auto_20737 ) ( ON ?auto_20732 ?auto_20736 ) ( CLEAR ?auto_20732 ) ( not ( = ?auto_20731 ?auto_20736 ) ) ( not ( = ?auto_20732 ?auto_20736 ) ) ( not ( = ?auto_20730 ?auto_20736 ) ) ( ON ?auto_20730 ?auto_20729 ) ( not ( = ?auto_20729 ?auto_20730 ) ) ( not ( = ?auto_20729 ?auto_20731 ) ) ( not ( = ?auto_20729 ?auto_20732 ) ) ( not ( = ?auto_20729 ?auto_20736 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20730 ?auto_20731 ?auto_20732 )
      ( MAKE-3CRATE-VERIFY ?auto_20729 ?auto_20730 ?auto_20731 ?auto_20732 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20739 - SURFACE
      ?auto_20740 - SURFACE
      ?auto_20741 - SURFACE
      ?auto_20742 - SURFACE
      ?auto_20743 - SURFACE
    )
    :vars
    (
      ?auto_20744 - HOIST
      ?auto_20745 - PLACE
      ?auto_20746 - TRUCK
      ?auto_20748 - PLACE
      ?auto_20749 - HOIST
      ?auto_20747 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20744 ?auto_20745 ) ( SURFACE-AT ?auto_20742 ?auto_20745 ) ( CLEAR ?auto_20742 ) ( IS-CRATE ?auto_20743 ) ( not ( = ?auto_20742 ?auto_20743 ) ) ( AVAILABLE ?auto_20744 ) ( ON ?auto_20742 ?auto_20741 ) ( not ( = ?auto_20741 ?auto_20742 ) ) ( not ( = ?auto_20741 ?auto_20743 ) ) ( TRUCK-AT ?auto_20746 ?auto_20748 ) ( not ( = ?auto_20748 ?auto_20745 ) ) ( HOIST-AT ?auto_20749 ?auto_20748 ) ( not ( = ?auto_20744 ?auto_20749 ) ) ( AVAILABLE ?auto_20749 ) ( SURFACE-AT ?auto_20743 ?auto_20748 ) ( ON ?auto_20743 ?auto_20747 ) ( CLEAR ?auto_20743 ) ( not ( = ?auto_20742 ?auto_20747 ) ) ( not ( = ?auto_20743 ?auto_20747 ) ) ( not ( = ?auto_20741 ?auto_20747 ) ) ( ON ?auto_20740 ?auto_20739 ) ( ON ?auto_20741 ?auto_20740 ) ( not ( = ?auto_20739 ?auto_20740 ) ) ( not ( = ?auto_20739 ?auto_20741 ) ) ( not ( = ?auto_20739 ?auto_20742 ) ) ( not ( = ?auto_20739 ?auto_20743 ) ) ( not ( = ?auto_20739 ?auto_20747 ) ) ( not ( = ?auto_20740 ?auto_20741 ) ) ( not ( = ?auto_20740 ?auto_20742 ) ) ( not ( = ?auto_20740 ?auto_20743 ) ) ( not ( = ?auto_20740 ?auto_20747 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20741 ?auto_20742 ?auto_20743 )
      ( MAKE-4CRATE-VERIFY ?auto_20739 ?auto_20740 ?auto_20741 ?auto_20742 ?auto_20743 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20750 - SURFACE
      ?auto_20751 - SURFACE
    )
    :vars
    (
      ?auto_20752 - HOIST
      ?auto_20753 - PLACE
      ?auto_20755 - SURFACE
      ?auto_20757 - PLACE
      ?auto_20758 - HOIST
      ?auto_20756 - SURFACE
      ?auto_20754 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20752 ?auto_20753 ) ( SURFACE-AT ?auto_20750 ?auto_20753 ) ( CLEAR ?auto_20750 ) ( IS-CRATE ?auto_20751 ) ( not ( = ?auto_20750 ?auto_20751 ) ) ( AVAILABLE ?auto_20752 ) ( ON ?auto_20750 ?auto_20755 ) ( not ( = ?auto_20755 ?auto_20750 ) ) ( not ( = ?auto_20755 ?auto_20751 ) ) ( not ( = ?auto_20757 ?auto_20753 ) ) ( HOIST-AT ?auto_20758 ?auto_20757 ) ( not ( = ?auto_20752 ?auto_20758 ) ) ( AVAILABLE ?auto_20758 ) ( SURFACE-AT ?auto_20751 ?auto_20757 ) ( ON ?auto_20751 ?auto_20756 ) ( CLEAR ?auto_20751 ) ( not ( = ?auto_20750 ?auto_20756 ) ) ( not ( = ?auto_20751 ?auto_20756 ) ) ( not ( = ?auto_20755 ?auto_20756 ) ) ( TRUCK-AT ?auto_20754 ?auto_20753 ) )
    :subtasks
    ( ( !DRIVE ?auto_20754 ?auto_20753 ?auto_20757 )
      ( MAKE-2CRATE ?auto_20755 ?auto_20750 ?auto_20751 )
      ( MAKE-1CRATE-VERIFY ?auto_20750 ?auto_20751 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20759 - SURFACE
      ?auto_20760 - SURFACE
      ?auto_20761 - SURFACE
    )
    :vars
    (
      ?auto_20765 - HOIST
      ?auto_20763 - PLACE
      ?auto_20764 - PLACE
      ?auto_20762 - HOIST
      ?auto_20766 - SURFACE
      ?auto_20767 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20765 ?auto_20763 ) ( SURFACE-AT ?auto_20760 ?auto_20763 ) ( CLEAR ?auto_20760 ) ( IS-CRATE ?auto_20761 ) ( not ( = ?auto_20760 ?auto_20761 ) ) ( AVAILABLE ?auto_20765 ) ( ON ?auto_20760 ?auto_20759 ) ( not ( = ?auto_20759 ?auto_20760 ) ) ( not ( = ?auto_20759 ?auto_20761 ) ) ( not ( = ?auto_20764 ?auto_20763 ) ) ( HOIST-AT ?auto_20762 ?auto_20764 ) ( not ( = ?auto_20765 ?auto_20762 ) ) ( AVAILABLE ?auto_20762 ) ( SURFACE-AT ?auto_20761 ?auto_20764 ) ( ON ?auto_20761 ?auto_20766 ) ( CLEAR ?auto_20761 ) ( not ( = ?auto_20760 ?auto_20766 ) ) ( not ( = ?auto_20761 ?auto_20766 ) ) ( not ( = ?auto_20759 ?auto_20766 ) ) ( TRUCK-AT ?auto_20767 ?auto_20763 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20760 ?auto_20761 )
      ( MAKE-2CRATE-VERIFY ?auto_20759 ?auto_20760 ?auto_20761 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20768 - SURFACE
      ?auto_20769 - SURFACE
      ?auto_20770 - SURFACE
      ?auto_20771 - SURFACE
    )
    :vars
    (
      ?auto_20776 - HOIST
      ?auto_20774 - PLACE
      ?auto_20777 - PLACE
      ?auto_20772 - HOIST
      ?auto_20773 - SURFACE
      ?auto_20775 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20776 ?auto_20774 ) ( SURFACE-AT ?auto_20770 ?auto_20774 ) ( CLEAR ?auto_20770 ) ( IS-CRATE ?auto_20771 ) ( not ( = ?auto_20770 ?auto_20771 ) ) ( AVAILABLE ?auto_20776 ) ( ON ?auto_20770 ?auto_20769 ) ( not ( = ?auto_20769 ?auto_20770 ) ) ( not ( = ?auto_20769 ?auto_20771 ) ) ( not ( = ?auto_20777 ?auto_20774 ) ) ( HOIST-AT ?auto_20772 ?auto_20777 ) ( not ( = ?auto_20776 ?auto_20772 ) ) ( AVAILABLE ?auto_20772 ) ( SURFACE-AT ?auto_20771 ?auto_20777 ) ( ON ?auto_20771 ?auto_20773 ) ( CLEAR ?auto_20771 ) ( not ( = ?auto_20770 ?auto_20773 ) ) ( not ( = ?auto_20771 ?auto_20773 ) ) ( not ( = ?auto_20769 ?auto_20773 ) ) ( TRUCK-AT ?auto_20775 ?auto_20774 ) ( ON ?auto_20769 ?auto_20768 ) ( not ( = ?auto_20768 ?auto_20769 ) ) ( not ( = ?auto_20768 ?auto_20770 ) ) ( not ( = ?auto_20768 ?auto_20771 ) ) ( not ( = ?auto_20768 ?auto_20773 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20769 ?auto_20770 ?auto_20771 )
      ( MAKE-3CRATE-VERIFY ?auto_20768 ?auto_20769 ?auto_20770 ?auto_20771 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20778 - SURFACE
      ?auto_20779 - SURFACE
      ?auto_20780 - SURFACE
      ?auto_20781 - SURFACE
      ?auto_20782 - SURFACE
    )
    :vars
    (
      ?auto_20787 - HOIST
      ?auto_20785 - PLACE
      ?auto_20788 - PLACE
      ?auto_20783 - HOIST
      ?auto_20784 - SURFACE
      ?auto_20786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20787 ?auto_20785 ) ( SURFACE-AT ?auto_20781 ?auto_20785 ) ( CLEAR ?auto_20781 ) ( IS-CRATE ?auto_20782 ) ( not ( = ?auto_20781 ?auto_20782 ) ) ( AVAILABLE ?auto_20787 ) ( ON ?auto_20781 ?auto_20780 ) ( not ( = ?auto_20780 ?auto_20781 ) ) ( not ( = ?auto_20780 ?auto_20782 ) ) ( not ( = ?auto_20788 ?auto_20785 ) ) ( HOIST-AT ?auto_20783 ?auto_20788 ) ( not ( = ?auto_20787 ?auto_20783 ) ) ( AVAILABLE ?auto_20783 ) ( SURFACE-AT ?auto_20782 ?auto_20788 ) ( ON ?auto_20782 ?auto_20784 ) ( CLEAR ?auto_20782 ) ( not ( = ?auto_20781 ?auto_20784 ) ) ( not ( = ?auto_20782 ?auto_20784 ) ) ( not ( = ?auto_20780 ?auto_20784 ) ) ( TRUCK-AT ?auto_20786 ?auto_20785 ) ( ON ?auto_20779 ?auto_20778 ) ( ON ?auto_20780 ?auto_20779 ) ( not ( = ?auto_20778 ?auto_20779 ) ) ( not ( = ?auto_20778 ?auto_20780 ) ) ( not ( = ?auto_20778 ?auto_20781 ) ) ( not ( = ?auto_20778 ?auto_20782 ) ) ( not ( = ?auto_20778 ?auto_20784 ) ) ( not ( = ?auto_20779 ?auto_20780 ) ) ( not ( = ?auto_20779 ?auto_20781 ) ) ( not ( = ?auto_20779 ?auto_20782 ) ) ( not ( = ?auto_20779 ?auto_20784 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20780 ?auto_20781 ?auto_20782 )
      ( MAKE-4CRATE-VERIFY ?auto_20778 ?auto_20779 ?auto_20780 ?auto_20781 ?auto_20782 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20789 - SURFACE
      ?auto_20790 - SURFACE
    )
    :vars
    (
      ?auto_20795 - HOIST
      ?auto_20793 - PLACE
      ?auto_20796 - SURFACE
      ?auto_20797 - PLACE
      ?auto_20791 - HOIST
      ?auto_20792 - SURFACE
      ?auto_20794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20795 ?auto_20793 ) ( IS-CRATE ?auto_20790 ) ( not ( = ?auto_20789 ?auto_20790 ) ) ( not ( = ?auto_20796 ?auto_20789 ) ) ( not ( = ?auto_20796 ?auto_20790 ) ) ( not ( = ?auto_20797 ?auto_20793 ) ) ( HOIST-AT ?auto_20791 ?auto_20797 ) ( not ( = ?auto_20795 ?auto_20791 ) ) ( AVAILABLE ?auto_20791 ) ( SURFACE-AT ?auto_20790 ?auto_20797 ) ( ON ?auto_20790 ?auto_20792 ) ( CLEAR ?auto_20790 ) ( not ( = ?auto_20789 ?auto_20792 ) ) ( not ( = ?auto_20790 ?auto_20792 ) ) ( not ( = ?auto_20796 ?auto_20792 ) ) ( TRUCK-AT ?auto_20794 ?auto_20793 ) ( SURFACE-AT ?auto_20796 ?auto_20793 ) ( CLEAR ?auto_20796 ) ( LIFTING ?auto_20795 ?auto_20789 ) ( IS-CRATE ?auto_20789 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20796 ?auto_20789 )
      ( MAKE-2CRATE ?auto_20796 ?auto_20789 ?auto_20790 )
      ( MAKE-1CRATE-VERIFY ?auto_20789 ?auto_20790 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20798 - SURFACE
      ?auto_20799 - SURFACE
      ?auto_20800 - SURFACE
    )
    :vars
    (
      ?auto_20803 - HOIST
      ?auto_20804 - PLACE
      ?auto_20802 - PLACE
      ?auto_20805 - HOIST
      ?auto_20806 - SURFACE
      ?auto_20801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20803 ?auto_20804 ) ( IS-CRATE ?auto_20800 ) ( not ( = ?auto_20799 ?auto_20800 ) ) ( not ( = ?auto_20798 ?auto_20799 ) ) ( not ( = ?auto_20798 ?auto_20800 ) ) ( not ( = ?auto_20802 ?auto_20804 ) ) ( HOIST-AT ?auto_20805 ?auto_20802 ) ( not ( = ?auto_20803 ?auto_20805 ) ) ( AVAILABLE ?auto_20805 ) ( SURFACE-AT ?auto_20800 ?auto_20802 ) ( ON ?auto_20800 ?auto_20806 ) ( CLEAR ?auto_20800 ) ( not ( = ?auto_20799 ?auto_20806 ) ) ( not ( = ?auto_20800 ?auto_20806 ) ) ( not ( = ?auto_20798 ?auto_20806 ) ) ( TRUCK-AT ?auto_20801 ?auto_20804 ) ( SURFACE-AT ?auto_20798 ?auto_20804 ) ( CLEAR ?auto_20798 ) ( LIFTING ?auto_20803 ?auto_20799 ) ( IS-CRATE ?auto_20799 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20799 ?auto_20800 )
      ( MAKE-2CRATE-VERIFY ?auto_20798 ?auto_20799 ?auto_20800 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20807 - SURFACE
      ?auto_20808 - SURFACE
      ?auto_20809 - SURFACE
      ?auto_20810 - SURFACE
    )
    :vars
    (
      ?auto_20813 - HOIST
      ?auto_20816 - PLACE
      ?auto_20812 - PLACE
      ?auto_20814 - HOIST
      ?auto_20815 - SURFACE
      ?auto_20811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20813 ?auto_20816 ) ( IS-CRATE ?auto_20810 ) ( not ( = ?auto_20809 ?auto_20810 ) ) ( not ( = ?auto_20808 ?auto_20809 ) ) ( not ( = ?auto_20808 ?auto_20810 ) ) ( not ( = ?auto_20812 ?auto_20816 ) ) ( HOIST-AT ?auto_20814 ?auto_20812 ) ( not ( = ?auto_20813 ?auto_20814 ) ) ( AVAILABLE ?auto_20814 ) ( SURFACE-AT ?auto_20810 ?auto_20812 ) ( ON ?auto_20810 ?auto_20815 ) ( CLEAR ?auto_20810 ) ( not ( = ?auto_20809 ?auto_20815 ) ) ( not ( = ?auto_20810 ?auto_20815 ) ) ( not ( = ?auto_20808 ?auto_20815 ) ) ( TRUCK-AT ?auto_20811 ?auto_20816 ) ( SURFACE-AT ?auto_20808 ?auto_20816 ) ( CLEAR ?auto_20808 ) ( LIFTING ?auto_20813 ?auto_20809 ) ( IS-CRATE ?auto_20809 ) ( ON ?auto_20808 ?auto_20807 ) ( not ( = ?auto_20807 ?auto_20808 ) ) ( not ( = ?auto_20807 ?auto_20809 ) ) ( not ( = ?auto_20807 ?auto_20810 ) ) ( not ( = ?auto_20807 ?auto_20815 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20808 ?auto_20809 ?auto_20810 )
      ( MAKE-3CRATE-VERIFY ?auto_20807 ?auto_20808 ?auto_20809 ?auto_20810 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20817 - SURFACE
      ?auto_20818 - SURFACE
      ?auto_20819 - SURFACE
      ?auto_20820 - SURFACE
      ?auto_20821 - SURFACE
    )
    :vars
    (
      ?auto_20824 - HOIST
      ?auto_20827 - PLACE
      ?auto_20823 - PLACE
      ?auto_20825 - HOIST
      ?auto_20826 - SURFACE
      ?auto_20822 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20824 ?auto_20827 ) ( IS-CRATE ?auto_20821 ) ( not ( = ?auto_20820 ?auto_20821 ) ) ( not ( = ?auto_20819 ?auto_20820 ) ) ( not ( = ?auto_20819 ?auto_20821 ) ) ( not ( = ?auto_20823 ?auto_20827 ) ) ( HOIST-AT ?auto_20825 ?auto_20823 ) ( not ( = ?auto_20824 ?auto_20825 ) ) ( AVAILABLE ?auto_20825 ) ( SURFACE-AT ?auto_20821 ?auto_20823 ) ( ON ?auto_20821 ?auto_20826 ) ( CLEAR ?auto_20821 ) ( not ( = ?auto_20820 ?auto_20826 ) ) ( not ( = ?auto_20821 ?auto_20826 ) ) ( not ( = ?auto_20819 ?auto_20826 ) ) ( TRUCK-AT ?auto_20822 ?auto_20827 ) ( SURFACE-AT ?auto_20819 ?auto_20827 ) ( CLEAR ?auto_20819 ) ( LIFTING ?auto_20824 ?auto_20820 ) ( IS-CRATE ?auto_20820 ) ( ON ?auto_20818 ?auto_20817 ) ( ON ?auto_20819 ?auto_20818 ) ( not ( = ?auto_20817 ?auto_20818 ) ) ( not ( = ?auto_20817 ?auto_20819 ) ) ( not ( = ?auto_20817 ?auto_20820 ) ) ( not ( = ?auto_20817 ?auto_20821 ) ) ( not ( = ?auto_20817 ?auto_20826 ) ) ( not ( = ?auto_20818 ?auto_20819 ) ) ( not ( = ?auto_20818 ?auto_20820 ) ) ( not ( = ?auto_20818 ?auto_20821 ) ) ( not ( = ?auto_20818 ?auto_20826 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20819 ?auto_20820 ?auto_20821 )
      ( MAKE-4CRATE-VERIFY ?auto_20817 ?auto_20818 ?auto_20819 ?auto_20820 ?auto_20821 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20828 - SURFACE
      ?auto_20829 - SURFACE
    )
    :vars
    (
      ?auto_20832 - HOIST
      ?auto_20836 - PLACE
      ?auto_20833 - SURFACE
      ?auto_20831 - PLACE
      ?auto_20834 - HOIST
      ?auto_20835 - SURFACE
      ?auto_20830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20832 ?auto_20836 ) ( IS-CRATE ?auto_20829 ) ( not ( = ?auto_20828 ?auto_20829 ) ) ( not ( = ?auto_20833 ?auto_20828 ) ) ( not ( = ?auto_20833 ?auto_20829 ) ) ( not ( = ?auto_20831 ?auto_20836 ) ) ( HOIST-AT ?auto_20834 ?auto_20831 ) ( not ( = ?auto_20832 ?auto_20834 ) ) ( AVAILABLE ?auto_20834 ) ( SURFACE-AT ?auto_20829 ?auto_20831 ) ( ON ?auto_20829 ?auto_20835 ) ( CLEAR ?auto_20829 ) ( not ( = ?auto_20828 ?auto_20835 ) ) ( not ( = ?auto_20829 ?auto_20835 ) ) ( not ( = ?auto_20833 ?auto_20835 ) ) ( TRUCK-AT ?auto_20830 ?auto_20836 ) ( SURFACE-AT ?auto_20833 ?auto_20836 ) ( CLEAR ?auto_20833 ) ( IS-CRATE ?auto_20828 ) ( AVAILABLE ?auto_20832 ) ( IN ?auto_20828 ?auto_20830 ) )
    :subtasks
    ( ( !UNLOAD ?auto_20832 ?auto_20828 ?auto_20830 ?auto_20836 )
      ( MAKE-2CRATE ?auto_20833 ?auto_20828 ?auto_20829 )
      ( MAKE-1CRATE-VERIFY ?auto_20828 ?auto_20829 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20837 - SURFACE
      ?auto_20838 - SURFACE
      ?auto_20839 - SURFACE
    )
    :vars
    (
      ?auto_20840 - HOIST
      ?auto_20844 - PLACE
      ?auto_20842 - PLACE
      ?auto_20843 - HOIST
      ?auto_20845 - SURFACE
      ?auto_20841 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20840 ?auto_20844 ) ( IS-CRATE ?auto_20839 ) ( not ( = ?auto_20838 ?auto_20839 ) ) ( not ( = ?auto_20837 ?auto_20838 ) ) ( not ( = ?auto_20837 ?auto_20839 ) ) ( not ( = ?auto_20842 ?auto_20844 ) ) ( HOIST-AT ?auto_20843 ?auto_20842 ) ( not ( = ?auto_20840 ?auto_20843 ) ) ( AVAILABLE ?auto_20843 ) ( SURFACE-AT ?auto_20839 ?auto_20842 ) ( ON ?auto_20839 ?auto_20845 ) ( CLEAR ?auto_20839 ) ( not ( = ?auto_20838 ?auto_20845 ) ) ( not ( = ?auto_20839 ?auto_20845 ) ) ( not ( = ?auto_20837 ?auto_20845 ) ) ( TRUCK-AT ?auto_20841 ?auto_20844 ) ( SURFACE-AT ?auto_20837 ?auto_20844 ) ( CLEAR ?auto_20837 ) ( IS-CRATE ?auto_20838 ) ( AVAILABLE ?auto_20840 ) ( IN ?auto_20838 ?auto_20841 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20838 ?auto_20839 )
      ( MAKE-2CRATE-VERIFY ?auto_20837 ?auto_20838 ?auto_20839 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20846 - SURFACE
      ?auto_20847 - SURFACE
      ?auto_20848 - SURFACE
      ?auto_20849 - SURFACE
    )
    :vars
    (
      ?auto_20852 - HOIST
      ?auto_20853 - PLACE
      ?auto_20854 - PLACE
      ?auto_20851 - HOIST
      ?auto_20855 - SURFACE
      ?auto_20850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20852 ?auto_20853 ) ( IS-CRATE ?auto_20849 ) ( not ( = ?auto_20848 ?auto_20849 ) ) ( not ( = ?auto_20847 ?auto_20848 ) ) ( not ( = ?auto_20847 ?auto_20849 ) ) ( not ( = ?auto_20854 ?auto_20853 ) ) ( HOIST-AT ?auto_20851 ?auto_20854 ) ( not ( = ?auto_20852 ?auto_20851 ) ) ( AVAILABLE ?auto_20851 ) ( SURFACE-AT ?auto_20849 ?auto_20854 ) ( ON ?auto_20849 ?auto_20855 ) ( CLEAR ?auto_20849 ) ( not ( = ?auto_20848 ?auto_20855 ) ) ( not ( = ?auto_20849 ?auto_20855 ) ) ( not ( = ?auto_20847 ?auto_20855 ) ) ( TRUCK-AT ?auto_20850 ?auto_20853 ) ( SURFACE-AT ?auto_20847 ?auto_20853 ) ( CLEAR ?auto_20847 ) ( IS-CRATE ?auto_20848 ) ( AVAILABLE ?auto_20852 ) ( IN ?auto_20848 ?auto_20850 ) ( ON ?auto_20847 ?auto_20846 ) ( not ( = ?auto_20846 ?auto_20847 ) ) ( not ( = ?auto_20846 ?auto_20848 ) ) ( not ( = ?auto_20846 ?auto_20849 ) ) ( not ( = ?auto_20846 ?auto_20855 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20847 ?auto_20848 ?auto_20849 )
      ( MAKE-3CRATE-VERIFY ?auto_20846 ?auto_20847 ?auto_20848 ?auto_20849 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20856 - SURFACE
      ?auto_20857 - SURFACE
      ?auto_20858 - SURFACE
      ?auto_20859 - SURFACE
      ?auto_20860 - SURFACE
    )
    :vars
    (
      ?auto_20863 - HOIST
      ?auto_20864 - PLACE
      ?auto_20865 - PLACE
      ?auto_20862 - HOIST
      ?auto_20866 - SURFACE
      ?auto_20861 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20863 ?auto_20864 ) ( IS-CRATE ?auto_20860 ) ( not ( = ?auto_20859 ?auto_20860 ) ) ( not ( = ?auto_20858 ?auto_20859 ) ) ( not ( = ?auto_20858 ?auto_20860 ) ) ( not ( = ?auto_20865 ?auto_20864 ) ) ( HOIST-AT ?auto_20862 ?auto_20865 ) ( not ( = ?auto_20863 ?auto_20862 ) ) ( AVAILABLE ?auto_20862 ) ( SURFACE-AT ?auto_20860 ?auto_20865 ) ( ON ?auto_20860 ?auto_20866 ) ( CLEAR ?auto_20860 ) ( not ( = ?auto_20859 ?auto_20866 ) ) ( not ( = ?auto_20860 ?auto_20866 ) ) ( not ( = ?auto_20858 ?auto_20866 ) ) ( TRUCK-AT ?auto_20861 ?auto_20864 ) ( SURFACE-AT ?auto_20858 ?auto_20864 ) ( CLEAR ?auto_20858 ) ( IS-CRATE ?auto_20859 ) ( AVAILABLE ?auto_20863 ) ( IN ?auto_20859 ?auto_20861 ) ( ON ?auto_20857 ?auto_20856 ) ( ON ?auto_20858 ?auto_20857 ) ( not ( = ?auto_20856 ?auto_20857 ) ) ( not ( = ?auto_20856 ?auto_20858 ) ) ( not ( = ?auto_20856 ?auto_20859 ) ) ( not ( = ?auto_20856 ?auto_20860 ) ) ( not ( = ?auto_20856 ?auto_20866 ) ) ( not ( = ?auto_20857 ?auto_20858 ) ) ( not ( = ?auto_20857 ?auto_20859 ) ) ( not ( = ?auto_20857 ?auto_20860 ) ) ( not ( = ?auto_20857 ?auto_20866 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20858 ?auto_20859 ?auto_20860 )
      ( MAKE-4CRATE-VERIFY ?auto_20856 ?auto_20857 ?auto_20858 ?auto_20859 ?auto_20860 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20867 - SURFACE
      ?auto_20868 - SURFACE
    )
    :vars
    (
      ?auto_20871 - HOIST
      ?auto_20872 - PLACE
      ?auto_20874 - SURFACE
      ?auto_20873 - PLACE
      ?auto_20870 - HOIST
      ?auto_20875 - SURFACE
      ?auto_20869 - TRUCK
      ?auto_20876 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20871 ?auto_20872 ) ( IS-CRATE ?auto_20868 ) ( not ( = ?auto_20867 ?auto_20868 ) ) ( not ( = ?auto_20874 ?auto_20867 ) ) ( not ( = ?auto_20874 ?auto_20868 ) ) ( not ( = ?auto_20873 ?auto_20872 ) ) ( HOIST-AT ?auto_20870 ?auto_20873 ) ( not ( = ?auto_20871 ?auto_20870 ) ) ( AVAILABLE ?auto_20870 ) ( SURFACE-AT ?auto_20868 ?auto_20873 ) ( ON ?auto_20868 ?auto_20875 ) ( CLEAR ?auto_20868 ) ( not ( = ?auto_20867 ?auto_20875 ) ) ( not ( = ?auto_20868 ?auto_20875 ) ) ( not ( = ?auto_20874 ?auto_20875 ) ) ( SURFACE-AT ?auto_20874 ?auto_20872 ) ( CLEAR ?auto_20874 ) ( IS-CRATE ?auto_20867 ) ( AVAILABLE ?auto_20871 ) ( IN ?auto_20867 ?auto_20869 ) ( TRUCK-AT ?auto_20869 ?auto_20876 ) ( not ( = ?auto_20876 ?auto_20872 ) ) ( not ( = ?auto_20873 ?auto_20876 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20869 ?auto_20876 ?auto_20872 )
      ( MAKE-2CRATE ?auto_20874 ?auto_20867 ?auto_20868 )
      ( MAKE-1CRATE-VERIFY ?auto_20867 ?auto_20868 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20877 - SURFACE
      ?auto_20878 - SURFACE
      ?auto_20879 - SURFACE
    )
    :vars
    (
      ?auto_20883 - HOIST
      ?auto_20882 - PLACE
      ?auto_20884 - PLACE
      ?auto_20881 - HOIST
      ?auto_20886 - SURFACE
      ?auto_20880 - TRUCK
      ?auto_20885 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20883 ?auto_20882 ) ( IS-CRATE ?auto_20879 ) ( not ( = ?auto_20878 ?auto_20879 ) ) ( not ( = ?auto_20877 ?auto_20878 ) ) ( not ( = ?auto_20877 ?auto_20879 ) ) ( not ( = ?auto_20884 ?auto_20882 ) ) ( HOIST-AT ?auto_20881 ?auto_20884 ) ( not ( = ?auto_20883 ?auto_20881 ) ) ( AVAILABLE ?auto_20881 ) ( SURFACE-AT ?auto_20879 ?auto_20884 ) ( ON ?auto_20879 ?auto_20886 ) ( CLEAR ?auto_20879 ) ( not ( = ?auto_20878 ?auto_20886 ) ) ( not ( = ?auto_20879 ?auto_20886 ) ) ( not ( = ?auto_20877 ?auto_20886 ) ) ( SURFACE-AT ?auto_20877 ?auto_20882 ) ( CLEAR ?auto_20877 ) ( IS-CRATE ?auto_20878 ) ( AVAILABLE ?auto_20883 ) ( IN ?auto_20878 ?auto_20880 ) ( TRUCK-AT ?auto_20880 ?auto_20885 ) ( not ( = ?auto_20885 ?auto_20882 ) ) ( not ( = ?auto_20884 ?auto_20885 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20878 ?auto_20879 )
      ( MAKE-2CRATE-VERIFY ?auto_20877 ?auto_20878 ?auto_20879 ) )
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
      ?auto_20891 - HOIST
      ?auto_20896 - PLACE
      ?auto_20897 - PLACE
      ?auto_20895 - HOIST
      ?auto_20893 - SURFACE
      ?auto_20892 - TRUCK
      ?auto_20894 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20891 ?auto_20896 ) ( IS-CRATE ?auto_20890 ) ( not ( = ?auto_20889 ?auto_20890 ) ) ( not ( = ?auto_20888 ?auto_20889 ) ) ( not ( = ?auto_20888 ?auto_20890 ) ) ( not ( = ?auto_20897 ?auto_20896 ) ) ( HOIST-AT ?auto_20895 ?auto_20897 ) ( not ( = ?auto_20891 ?auto_20895 ) ) ( AVAILABLE ?auto_20895 ) ( SURFACE-AT ?auto_20890 ?auto_20897 ) ( ON ?auto_20890 ?auto_20893 ) ( CLEAR ?auto_20890 ) ( not ( = ?auto_20889 ?auto_20893 ) ) ( not ( = ?auto_20890 ?auto_20893 ) ) ( not ( = ?auto_20888 ?auto_20893 ) ) ( SURFACE-AT ?auto_20888 ?auto_20896 ) ( CLEAR ?auto_20888 ) ( IS-CRATE ?auto_20889 ) ( AVAILABLE ?auto_20891 ) ( IN ?auto_20889 ?auto_20892 ) ( TRUCK-AT ?auto_20892 ?auto_20894 ) ( not ( = ?auto_20894 ?auto_20896 ) ) ( not ( = ?auto_20897 ?auto_20894 ) ) ( ON ?auto_20888 ?auto_20887 ) ( not ( = ?auto_20887 ?auto_20888 ) ) ( not ( = ?auto_20887 ?auto_20889 ) ) ( not ( = ?auto_20887 ?auto_20890 ) ) ( not ( = ?auto_20887 ?auto_20893 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20888 ?auto_20889 ?auto_20890 )
      ( MAKE-3CRATE-VERIFY ?auto_20887 ?auto_20888 ?auto_20889 ?auto_20890 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20898 - SURFACE
      ?auto_20899 - SURFACE
      ?auto_20900 - SURFACE
      ?auto_20901 - SURFACE
      ?auto_20902 - SURFACE
    )
    :vars
    (
      ?auto_20903 - HOIST
      ?auto_20908 - PLACE
      ?auto_20909 - PLACE
      ?auto_20907 - HOIST
      ?auto_20905 - SURFACE
      ?auto_20904 - TRUCK
      ?auto_20906 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20903 ?auto_20908 ) ( IS-CRATE ?auto_20902 ) ( not ( = ?auto_20901 ?auto_20902 ) ) ( not ( = ?auto_20900 ?auto_20901 ) ) ( not ( = ?auto_20900 ?auto_20902 ) ) ( not ( = ?auto_20909 ?auto_20908 ) ) ( HOIST-AT ?auto_20907 ?auto_20909 ) ( not ( = ?auto_20903 ?auto_20907 ) ) ( AVAILABLE ?auto_20907 ) ( SURFACE-AT ?auto_20902 ?auto_20909 ) ( ON ?auto_20902 ?auto_20905 ) ( CLEAR ?auto_20902 ) ( not ( = ?auto_20901 ?auto_20905 ) ) ( not ( = ?auto_20902 ?auto_20905 ) ) ( not ( = ?auto_20900 ?auto_20905 ) ) ( SURFACE-AT ?auto_20900 ?auto_20908 ) ( CLEAR ?auto_20900 ) ( IS-CRATE ?auto_20901 ) ( AVAILABLE ?auto_20903 ) ( IN ?auto_20901 ?auto_20904 ) ( TRUCK-AT ?auto_20904 ?auto_20906 ) ( not ( = ?auto_20906 ?auto_20908 ) ) ( not ( = ?auto_20909 ?auto_20906 ) ) ( ON ?auto_20899 ?auto_20898 ) ( ON ?auto_20900 ?auto_20899 ) ( not ( = ?auto_20898 ?auto_20899 ) ) ( not ( = ?auto_20898 ?auto_20900 ) ) ( not ( = ?auto_20898 ?auto_20901 ) ) ( not ( = ?auto_20898 ?auto_20902 ) ) ( not ( = ?auto_20898 ?auto_20905 ) ) ( not ( = ?auto_20899 ?auto_20900 ) ) ( not ( = ?auto_20899 ?auto_20901 ) ) ( not ( = ?auto_20899 ?auto_20902 ) ) ( not ( = ?auto_20899 ?auto_20905 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20900 ?auto_20901 ?auto_20902 )
      ( MAKE-4CRATE-VERIFY ?auto_20898 ?auto_20899 ?auto_20900 ?auto_20901 ?auto_20902 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20910 - SURFACE
      ?auto_20911 - SURFACE
    )
    :vars
    (
      ?auto_20912 - HOIST
      ?auto_20918 - PLACE
      ?auto_20916 - SURFACE
      ?auto_20919 - PLACE
      ?auto_20917 - HOIST
      ?auto_20914 - SURFACE
      ?auto_20913 - TRUCK
      ?auto_20915 - PLACE
      ?auto_20920 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20912 ?auto_20918 ) ( IS-CRATE ?auto_20911 ) ( not ( = ?auto_20910 ?auto_20911 ) ) ( not ( = ?auto_20916 ?auto_20910 ) ) ( not ( = ?auto_20916 ?auto_20911 ) ) ( not ( = ?auto_20919 ?auto_20918 ) ) ( HOIST-AT ?auto_20917 ?auto_20919 ) ( not ( = ?auto_20912 ?auto_20917 ) ) ( AVAILABLE ?auto_20917 ) ( SURFACE-AT ?auto_20911 ?auto_20919 ) ( ON ?auto_20911 ?auto_20914 ) ( CLEAR ?auto_20911 ) ( not ( = ?auto_20910 ?auto_20914 ) ) ( not ( = ?auto_20911 ?auto_20914 ) ) ( not ( = ?auto_20916 ?auto_20914 ) ) ( SURFACE-AT ?auto_20916 ?auto_20918 ) ( CLEAR ?auto_20916 ) ( IS-CRATE ?auto_20910 ) ( AVAILABLE ?auto_20912 ) ( TRUCK-AT ?auto_20913 ?auto_20915 ) ( not ( = ?auto_20915 ?auto_20918 ) ) ( not ( = ?auto_20919 ?auto_20915 ) ) ( HOIST-AT ?auto_20920 ?auto_20915 ) ( LIFTING ?auto_20920 ?auto_20910 ) ( not ( = ?auto_20912 ?auto_20920 ) ) ( not ( = ?auto_20917 ?auto_20920 ) ) )
    :subtasks
    ( ( !LOAD ?auto_20920 ?auto_20910 ?auto_20913 ?auto_20915 )
      ( MAKE-2CRATE ?auto_20916 ?auto_20910 ?auto_20911 )
      ( MAKE-1CRATE-VERIFY ?auto_20910 ?auto_20911 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20921 - SURFACE
      ?auto_20922 - SURFACE
      ?auto_20923 - SURFACE
    )
    :vars
    (
      ?auto_20927 - HOIST
      ?auto_20929 - PLACE
      ?auto_20931 - PLACE
      ?auto_20930 - HOIST
      ?auto_20925 - SURFACE
      ?auto_20924 - TRUCK
      ?auto_20926 - PLACE
      ?auto_20928 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20927 ?auto_20929 ) ( IS-CRATE ?auto_20923 ) ( not ( = ?auto_20922 ?auto_20923 ) ) ( not ( = ?auto_20921 ?auto_20922 ) ) ( not ( = ?auto_20921 ?auto_20923 ) ) ( not ( = ?auto_20931 ?auto_20929 ) ) ( HOIST-AT ?auto_20930 ?auto_20931 ) ( not ( = ?auto_20927 ?auto_20930 ) ) ( AVAILABLE ?auto_20930 ) ( SURFACE-AT ?auto_20923 ?auto_20931 ) ( ON ?auto_20923 ?auto_20925 ) ( CLEAR ?auto_20923 ) ( not ( = ?auto_20922 ?auto_20925 ) ) ( not ( = ?auto_20923 ?auto_20925 ) ) ( not ( = ?auto_20921 ?auto_20925 ) ) ( SURFACE-AT ?auto_20921 ?auto_20929 ) ( CLEAR ?auto_20921 ) ( IS-CRATE ?auto_20922 ) ( AVAILABLE ?auto_20927 ) ( TRUCK-AT ?auto_20924 ?auto_20926 ) ( not ( = ?auto_20926 ?auto_20929 ) ) ( not ( = ?auto_20931 ?auto_20926 ) ) ( HOIST-AT ?auto_20928 ?auto_20926 ) ( LIFTING ?auto_20928 ?auto_20922 ) ( not ( = ?auto_20927 ?auto_20928 ) ) ( not ( = ?auto_20930 ?auto_20928 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20922 ?auto_20923 )
      ( MAKE-2CRATE-VERIFY ?auto_20921 ?auto_20922 ?auto_20923 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20932 - SURFACE
      ?auto_20933 - SURFACE
      ?auto_20934 - SURFACE
      ?auto_20935 - SURFACE
    )
    :vars
    (
      ?auto_20941 - HOIST
      ?auto_20943 - PLACE
      ?auto_20936 - PLACE
      ?auto_20937 - HOIST
      ?auto_20942 - SURFACE
      ?auto_20938 - TRUCK
      ?auto_20940 - PLACE
      ?auto_20939 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20941 ?auto_20943 ) ( IS-CRATE ?auto_20935 ) ( not ( = ?auto_20934 ?auto_20935 ) ) ( not ( = ?auto_20933 ?auto_20934 ) ) ( not ( = ?auto_20933 ?auto_20935 ) ) ( not ( = ?auto_20936 ?auto_20943 ) ) ( HOIST-AT ?auto_20937 ?auto_20936 ) ( not ( = ?auto_20941 ?auto_20937 ) ) ( AVAILABLE ?auto_20937 ) ( SURFACE-AT ?auto_20935 ?auto_20936 ) ( ON ?auto_20935 ?auto_20942 ) ( CLEAR ?auto_20935 ) ( not ( = ?auto_20934 ?auto_20942 ) ) ( not ( = ?auto_20935 ?auto_20942 ) ) ( not ( = ?auto_20933 ?auto_20942 ) ) ( SURFACE-AT ?auto_20933 ?auto_20943 ) ( CLEAR ?auto_20933 ) ( IS-CRATE ?auto_20934 ) ( AVAILABLE ?auto_20941 ) ( TRUCK-AT ?auto_20938 ?auto_20940 ) ( not ( = ?auto_20940 ?auto_20943 ) ) ( not ( = ?auto_20936 ?auto_20940 ) ) ( HOIST-AT ?auto_20939 ?auto_20940 ) ( LIFTING ?auto_20939 ?auto_20934 ) ( not ( = ?auto_20941 ?auto_20939 ) ) ( not ( = ?auto_20937 ?auto_20939 ) ) ( ON ?auto_20933 ?auto_20932 ) ( not ( = ?auto_20932 ?auto_20933 ) ) ( not ( = ?auto_20932 ?auto_20934 ) ) ( not ( = ?auto_20932 ?auto_20935 ) ) ( not ( = ?auto_20932 ?auto_20942 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20933 ?auto_20934 ?auto_20935 )
      ( MAKE-3CRATE-VERIFY ?auto_20932 ?auto_20933 ?auto_20934 ?auto_20935 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20944 - SURFACE
      ?auto_20945 - SURFACE
      ?auto_20946 - SURFACE
      ?auto_20947 - SURFACE
      ?auto_20948 - SURFACE
    )
    :vars
    (
      ?auto_20954 - HOIST
      ?auto_20956 - PLACE
      ?auto_20949 - PLACE
      ?auto_20950 - HOIST
      ?auto_20955 - SURFACE
      ?auto_20951 - TRUCK
      ?auto_20953 - PLACE
      ?auto_20952 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20954 ?auto_20956 ) ( IS-CRATE ?auto_20948 ) ( not ( = ?auto_20947 ?auto_20948 ) ) ( not ( = ?auto_20946 ?auto_20947 ) ) ( not ( = ?auto_20946 ?auto_20948 ) ) ( not ( = ?auto_20949 ?auto_20956 ) ) ( HOIST-AT ?auto_20950 ?auto_20949 ) ( not ( = ?auto_20954 ?auto_20950 ) ) ( AVAILABLE ?auto_20950 ) ( SURFACE-AT ?auto_20948 ?auto_20949 ) ( ON ?auto_20948 ?auto_20955 ) ( CLEAR ?auto_20948 ) ( not ( = ?auto_20947 ?auto_20955 ) ) ( not ( = ?auto_20948 ?auto_20955 ) ) ( not ( = ?auto_20946 ?auto_20955 ) ) ( SURFACE-AT ?auto_20946 ?auto_20956 ) ( CLEAR ?auto_20946 ) ( IS-CRATE ?auto_20947 ) ( AVAILABLE ?auto_20954 ) ( TRUCK-AT ?auto_20951 ?auto_20953 ) ( not ( = ?auto_20953 ?auto_20956 ) ) ( not ( = ?auto_20949 ?auto_20953 ) ) ( HOIST-AT ?auto_20952 ?auto_20953 ) ( LIFTING ?auto_20952 ?auto_20947 ) ( not ( = ?auto_20954 ?auto_20952 ) ) ( not ( = ?auto_20950 ?auto_20952 ) ) ( ON ?auto_20945 ?auto_20944 ) ( ON ?auto_20946 ?auto_20945 ) ( not ( = ?auto_20944 ?auto_20945 ) ) ( not ( = ?auto_20944 ?auto_20946 ) ) ( not ( = ?auto_20944 ?auto_20947 ) ) ( not ( = ?auto_20944 ?auto_20948 ) ) ( not ( = ?auto_20944 ?auto_20955 ) ) ( not ( = ?auto_20945 ?auto_20946 ) ) ( not ( = ?auto_20945 ?auto_20947 ) ) ( not ( = ?auto_20945 ?auto_20948 ) ) ( not ( = ?auto_20945 ?auto_20955 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20946 ?auto_20947 ?auto_20948 )
      ( MAKE-4CRATE-VERIFY ?auto_20944 ?auto_20945 ?auto_20946 ?auto_20947 ?auto_20948 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20957 - SURFACE
      ?auto_20958 - SURFACE
    )
    :vars
    (
      ?auto_20965 - HOIST
      ?auto_20967 - PLACE
      ?auto_20962 - SURFACE
      ?auto_20959 - PLACE
      ?auto_20960 - HOIST
      ?auto_20966 - SURFACE
      ?auto_20961 - TRUCK
      ?auto_20964 - PLACE
      ?auto_20963 - HOIST
      ?auto_20968 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20965 ?auto_20967 ) ( IS-CRATE ?auto_20958 ) ( not ( = ?auto_20957 ?auto_20958 ) ) ( not ( = ?auto_20962 ?auto_20957 ) ) ( not ( = ?auto_20962 ?auto_20958 ) ) ( not ( = ?auto_20959 ?auto_20967 ) ) ( HOIST-AT ?auto_20960 ?auto_20959 ) ( not ( = ?auto_20965 ?auto_20960 ) ) ( AVAILABLE ?auto_20960 ) ( SURFACE-AT ?auto_20958 ?auto_20959 ) ( ON ?auto_20958 ?auto_20966 ) ( CLEAR ?auto_20958 ) ( not ( = ?auto_20957 ?auto_20966 ) ) ( not ( = ?auto_20958 ?auto_20966 ) ) ( not ( = ?auto_20962 ?auto_20966 ) ) ( SURFACE-AT ?auto_20962 ?auto_20967 ) ( CLEAR ?auto_20962 ) ( IS-CRATE ?auto_20957 ) ( AVAILABLE ?auto_20965 ) ( TRUCK-AT ?auto_20961 ?auto_20964 ) ( not ( = ?auto_20964 ?auto_20967 ) ) ( not ( = ?auto_20959 ?auto_20964 ) ) ( HOIST-AT ?auto_20963 ?auto_20964 ) ( not ( = ?auto_20965 ?auto_20963 ) ) ( not ( = ?auto_20960 ?auto_20963 ) ) ( AVAILABLE ?auto_20963 ) ( SURFACE-AT ?auto_20957 ?auto_20964 ) ( ON ?auto_20957 ?auto_20968 ) ( CLEAR ?auto_20957 ) ( not ( = ?auto_20957 ?auto_20968 ) ) ( not ( = ?auto_20958 ?auto_20968 ) ) ( not ( = ?auto_20962 ?auto_20968 ) ) ( not ( = ?auto_20966 ?auto_20968 ) ) )
    :subtasks
    ( ( !LIFT ?auto_20963 ?auto_20957 ?auto_20968 ?auto_20964 )
      ( MAKE-2CRATE ?auto_20962 ?auto_20957 ?auto_20958 )
      ( MAKE-1CRATE-VERIFY ?auto_20957 ?auto_20958 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20969 - SURFACE
      ?auto_20970 - SURFACE
      ?auto_20971 - SURFACE
    )
    :vars
    (
      ?auto_20974 - HOIST
      ?auto_20978 - PLACE
      ?auto_20972 - PLACE
      ?auto_20976 - HOIST
      ?auto_20980 - SURFACE
      ?auto_20979 - TRUCK
      ?auto_20977 - PLACE
      ?auto_20975 - HOIST
      ?auto_20973 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20974 ?auto_20978 ) ( IS-CRATE ?auto_20971 ) ( not ( = ?auto_20970 ?auto_20971 ) ) ( not ( = ?auto_20969 ?auto_20970 ) ) ( not ( = ?auto_20969 ?auto_20971 ) ) ( not ( = ?auto_20972 ?auto_20978 ) ) ( HOIST-AT ?auto_20976 ?auto_20972 ) ( not ( = ?auto_20974 ?auto_20976 ) ) ( AVAILABLE ?auto_20976 ) ( SURFACE-AT ?auto_20971 ?auto_20972 ) ( ON ?auto_20971 ?auto_20980 ) ( CLEAR ?auto_20971 ) ( not ( = ?auto_20970 ?auto_20980 ) ) ( not ( = ?auto_20971 ?auto_20980 ) ) ( not ( = ?auto_20969 ?auto_20980 ) ) ( SURFACE-AT ?auto_20969 ?auto_20978 ) ( CLEAR ?auto_20969 ) ( IS-CRATE ?auto_20970 ) ( AVAILABLE ?auto_20974 ) ( TRUCK-AT ?auto_20979 ?auto_20977 ) ( not ( = ?auto_20977 ?auto_20978 ) ) ( not ( = ?auto_20972 ?auto_20977 ) ) ( HOIST-AT ?auto_20975 ?auto_20977 ) ( not ( = ?auto_20974 ?auto_20975 ) ) ( not ( = ?auto_20976 ?auto_20975 ) ) ( AVAILABLE ?auto_20975 ) ( SURFACE-AT ?auto_20970 ?auto_20977 ) ( ON ?auto_20970 ?auto_20973 ) ( CLEAR ?auto_20970 ) ( not ( = ?auto_20970 ?auto_20973 ) ) ( not ( = ?auto_20971 ?auto_20973 ) ) ( not ( = ?auto_20969 ?auto_20973 ) ) ( not ( = ?auto_20980 ?auto_20973 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20970 ?auto_20971 )
      ( MAKE-2CRATE-VERIFY ?auto_20969 ?auto_20970 ?auto_20971 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20981 - SURFACE
      ?auto_20982 - SURFACE
      ?auto_20983 - SURFACE
      ?auto_20984 - SURFACE
    )
    :vars
    (
      ?auto_20988 - HOIST
      ?auto_20985 - PLACE
      ?auto_20989 - PLACE
      ?auto_20992 - HOIST
      ?auto_20987 - SURFACE
      ?auto_20986 - TRUCK
      ?auto_20990 - PLACE
      ?auto_20991 - HOIST
      ?auto_20993 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20988 ?auto_20985 ) ( IS-CRATE ?auto_20984 ) ( not ( = ?auto_20983 ?auto_20984 ) ) ( not ( = ?auto_20982 ?auto_20983 ) ) ( not ( = ?auto_20982 ?auto_20984 ) ) ( not ( = ?auto_20989 ?auto_20985 ) ) ( HOIST-AT ?auto_20992 ?auto_20989 ) ( not ( = ?auto_20988 ?auto_20992 ) ) ( AVAILABLE ?auto_20992 ) ( SURFACE-AT ?auto_20984 ?auto_20989 ) ( ON ?auto_20984 ?auto_20987 ) ( CLEAR ?auto_20984 ) ( not ( = ?auto_20983 ?auto_20987 ) ) ( not ( = ?auto_20984 ?auto_20987 ) ) ( not ( = ?auto_20982 ?auto_20987 ) ) ( SURFACE-AT ?auto_20982 ?auto_20985 ) ( CLEAR ?auto_20982 ) ( IS-CRATE ?auto_20983 ) ( AVAILABLE ?auto_20988 ) ( TRUCK-AT ?auto_20986 ?auto_20990 ) ( not ( = ?auto_20990 ?auto_20985 ) ) ( not ( = ?auto_20989 ?auto_20990 ) ) ( HOIST-AT ?auto_20991 ?auto_20990 ) ( not ( = ?auto_20988 ?auto_20991 ) ) ( not ( = ?auto_20992 ?auto_20991 ) ) ( AVAILABLE ?auto_20991 ) ( SURFACE-AT ?auto_20983 ?auto_20990 ) ( ON ?auto_20983 ?auto_20993 ) ( CLEAR ?auto_20983 ) ( not ( = ?auto_20983 ?auto_20993 ) ) ( not ( = ?auto_20984 ?auto_20993 ) ) ( not ( = ?auto_20982 ?auto_20993 ) ) ( not ( = ?auto_20987 ?auto_20993 ) ) ( ON ?auto_20982 ?auto_20981 ) ( not ( = ?auto_20981 ?auto_20982 ) ) ( not ( = ?auto_20981 ?auto_20983 ) ) ( not ( = ?auto_20981 ?auto_20984 ) ) ( not ( = ?auto_20981 ?auto_20987 ) ) ( not ( = ?auto_20981 ?auto_20993 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20982 ?auto_20983 ?auto_20984 )
      ( MAKE-3CRATE-VERIFY ?auto_20981 ?auto_20982 ?auto_20983 ?auto_20984 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20994 - SURFACE
      ?auto_20995 - SURFACE
      ?auto_20996 - SURFACE
      ?auto_20997 - SURFACE
      ?auto_20998 - SURFACE
    )
    :vars
    (
      ?auto_21002 - HOIST
      ?auto_20999 - PLACE
      ?auto_21003 - PLACE
      ?auto_21006 - HOIST
      ?auto_21001 - SURFACE
      ?auto_21000 - TRUCK
      ?auto_21004 - PLACE
      ?auto_21005 - HOIST
      ?auto_21007 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21002 ?auto_20999 ) ( IS-CRATE ?auto_20998 ) ( not ( = ?auto_20997 ?auto_20998 ) ) ( not ( = ?auto_20996 ?auto_20997 ) ) ( not ( = ?auto_20996 ?auto_20998 ) ) ( not ( = ?auto_21003 ?auto_20999 ) ) ( HOIST-AT ?auto_21006 ?auto_21003 ) ( not ( = ?auto_21002 ?auto_21006 ) ) ( AVAILABLE ?auto_21006 ) ( SURFACE-AT ?auto_20998 ?auto_21003 ) ( ON ?auto_20998 ?auto_21001 ) ( CLEAR ?auto_20998 ) ( not ( = ?auto_20997 ?auto_21001 ) ) ( not ( = ?auto_20998 ?auto_21001 ) ) ( not ( = ?auto_20996 ?auto_21001 ) ) ( SURFACE-AT ?auto_20996 ?auto_20999 ) ( CLEAR ?auto_20996 ) ( IS-CRATE ?auto_20997 ) ( AVAILABLE ?auto_21002 ) ( TRUCK-AT ?auto_21000 ?auto_21004 ) ( not ( = ?auto_21004 ?auto_20999 ) ) ( not ( = ?auto_21003 ?auto_21004 ) ) ( HOIST-AT ?auto_21005 ?auto_21004 ) ( not ( = ?auto_21002 ?auto_21005 ) ) ( not ( = ?auto_21006 ?auto_21005 ) ) ( AVAILABLE ?auto_21005 ) ( SURFACE-AT ?auto_20997 ?auto_21004 ) ( ON ?auto_20997 ?auto_21007 ) ( CLEAR ?auto_20997 ) ( not ( = ?auto_20997 ?auto_21007 ) ) ( not ( = ?auto_20998 ?auto_21007 ) ) ( not ( = ?auto_20996 ?auto_21007 ) ) ( not ( = ?auto_21001 ?auto_21007 ) ) ( ON ?auto_20995 ?auto_20994 ) ( ON ?auto_20996 ?auto_20995 ) ( not ( = ?auto_20994 ?auto_20995 ) ) ( not ( = ?auto_20994 ?auto_20996 ) ) ( not ( = ?auto_20994 ?auto_20997 ) ) ( not ( = ?auto_20994 ?auto_20998 ) ) ( not ( = ?auto_20994 ?auto_21001 ) ) ( not ( = ?auto_20994 ?auto_21007 ) ) ( not ( = ?auto_20995 ?auto_20996 ) ) ( not ( = ?auto_20995 ?auto_20997 ) ) ( not ( = ?auto_20995 ?auto_20998 ) ) ( not ( = ?auto_20995 ?auto_21001 ) ) ( not ( = ?auto_20995 ?auto_21007 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20996 ?auto_20997 ?auto_20998 )
      ( MAKE-4CRATE-VERIFY ?auto_20994 ?auto_20995 ?auto_20996 ?auto_20997 ?auto_20998 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21008 - SURFACE
      ?auto_21009 - SURFACE
    )
    :vars
    (
      ?auto_21014 - HOIST
      ?auto_21011 - PLACE
      ?auto_21010 - SURFACE
      ?auto_21015 - PLACE
      ?auto_21018 - HOIST
      ?auto_21013 - SURFACE
      ?auto_21016 - PLACE
      ?auto_21017 - HOIST
      ?auto_21019 - SURFACE
      ?auto_21012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21014 ?auto_21011 ) ( IS-CRATE ?auto_21009 ) ( not ( = ?auto_21008 ?auto_21009 ) ) ( not ( = ?auto_21010 ?auto_21008 ) ) ( not ( = ?auto_21010 ?auto_21009 ) ) ( not ( = ?auto_21015 ?auto_21011 ) ) ( HOIST-AT ?auto_21018 ?auto_21015 ) ( not ( = ?auto_21014 ?auto_21018 ) ) ( AVAILABLE ?auto_21018 ) ( SURFACE-AT ?auto_21009 ?auto_21015 ) ( ON ?auto_21009 ?auto_21013 ) ( CLEAR ?auto_21009 ) ( not ( = ?auto_21008 ?auto_21013 ) ) ( not ( = ?auto_21009 ?auto_21013 ) ) ( not ( = ?auto_21010 ?auto_21013 ) ) ( SURFACE-AT ?auto_21010 ?auto_21011 ) ( CLEAR ?auto_21010 ) ( IS-CRATE ?auto_21008 ) ( AVAILABLE ?auto_21014 ) ( not ( = ?auto_21016 ?auto_21011 ) ) ( not ( = ?auto_21015 ?auto_21016 ) ) ( HOIST-AT ?auto_21017 ?auto_21016 ) ( not ( = ?auto_21014 ?auto_21017 ) ) ( not ( = ?auto_21018 ?auto_21017 ) ) ( AVAILABLE ?auto_21017 ) ( SURFACE-AT ?auto_21008 ?auto_21016 ) ( ON ?auto_21008 ?auto_21019 ) ( CLEAR ?auto_21008 ) ( not ( = ?auto_21008 ?auto_21019 ) ) ( not ( = ?auto_21009 ?auto_21019 ) ) ( not ( = ?auto_21010 ?auto_21019 ) ) ( not ( = ?auto_21013 ?auto_21019 ) ) ( TRUCK-AT ?auto_21012 ?auto_21011 ) )
    :subtasks
    ( ( !DRIVE ?auto_21012 ?auto_21011 ?auto_21016 )
      ( MAKE-2CRATE ?auto_21010 ?auto_21008 ?auto_21009 )
      ( MAKE-1CRATE-VERIFY ?auto_21008 ?auto_21009 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21020 - SURFACE
      ?auto_21021 - SURFACE
      ?auto_21022 - SURFACE
    )
    :vars
    (
      ?auto_21031 - HOIST
      ?auto_21026 - PLACE
      ?auto_21023 - PLACE
      ?auto_21027 - HOIST
      ?auto_21030 - SURFACE
      ?auto_21024 - PLACE
      ?auto_21025 - HOIST
      ?auto_21029 - SURFACE
      ?auto_21028 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21031 ?auto_21026 ) ( IS-CRATE ?auto_21022 ) ( not ( = ?auto_21021 ?auto_21022 ) ) ( not ( = ?auto_21020 ?auto_21021 ) ) ( not ( = ?auto_21020 ?auto_21022 ) ) ( not ( = ?auto_21023 ?auto_21026 ) ) ( HOIST-AT ?auto_21027 ?auto_21023 ) ( not ( = ?auto_21031 ?auto_21027 ) ) ( AVAILABLE ?auto_21027 ) ( SURFACE-AT ?auto_21022 ?auto_21023 ) ( ON ?auto_21022 ?auto_21030 ) ( CLEAR ?auto_21022 ) ( not ( = ?auto_21021 ?auto_21030 ) ) ( not ( = ?auto_21022 ?auto_21030 ) ) ( not ( = ?auto_21020 ?auto_21030 ) ) ( SURFACE-AT ?auto_21020 ?auto_21026 ) ( CLEAR ?auto_21020 ) ( IS-CRATE ?auto_21021 ) ( AVAILABLE ?auto_21031 ) ( not ( = ?auto_21024 ?auto_21026 ) ) ( not ( = ?auto_21023 ?auto_21024 ) ) ( HOIST-AT ?auto_21025 ?auto_21024 ) ( not ( = ?auto_21031 ?auto_21025 ) ) ( not ( = ?auto_21027 ?auto_21025 ) ) ( AVAILABLE ?auto_21025 ) ( SURFACE-AT ?auto_21021 ?auto_21024 ) ( ON ?auto_21021 ?auto_21029 ) ( CLEAR ?auto_21021 ) ( not ( = ?auto_21021 ?auto_21029 ) ) ( not ( = ?auto_21022 ?auto_21029 ) ) ( not ( = ?auto_21020 ?auto_21029 ) ) ( not ( = ?auto_21030 ?auto_21029 ) ) ( TRUCK-AT ?auto_21028 ?auto_21026 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21021 ?auto_21022 )
      ( MAKE-2CRATE-VERIFY ?auto_21020 ?auto_21021 ?auto_21022 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21032 - SURFACE
      ?auto_21033 - SURFACE
      ?auto_21034 - SURFACE
      ?auto_21035 - SURFACE
    )
    :vars
    (
      ?auto_21040 - HOIST
      ?auto_21039 - PLACE
      ?auto_21043 - PLACE
      ?auto_21044 - HOIST
      ?auto_21042 - SURFACE
      ?auto_21036 - PLACE
      ?auto_21038 - HOIST
      ?auto_21037 - SURFACE
      ?auto_21041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21040 ?auto_21039 ) ( IS-CRATE ?auto_21035 ) ( not ( = ?auto_21034 ?auto_21035 ) ) ( not ( = ?auto_21033 ?auto_21034 ) ) ( not ( = ?auto_21033 ?auto_21035 ) ) ( not ( = ?auto_21043 ?auto_21039 ) ) ( HOIST-AT ?auto_21044 ?auto_21043 ) ( not ( = ?auto_21040 ?auto_21044 ) ) ( AVAILABLE ?auto_21044 ) ( SURFACE-AT ?auto_21035 ?auto_21043 ) ( ON ?auto_21035 ?auto_21042 ) ( CLEAR ?auto_21035 ) ( not ( = ?auto_21034 ?auto_21042 ) ) ( not ( = ?auto_21035 ?auto_21042 ) ) ( not ( = ?auto_21033 ?auto_21042 ) ) ( SURFACE-AT ?auto_21033 ?auto_21039 ) ( CLEAR ?auto_21033 ) ( IS-CRATE ?auto_21034 ) ( AVAILABLE ?auto_21040 ) ( not ( = ?auto_21036 ?auto_21039 ) ) ( not ( = ?auto_21043 ?auto_21036 ) ) ( HOIST-AT ?auto_21038 ?auto_21036 ) ( not ( = ?auto_21040 ?auto_21038 ) ) ( not ( = ?auto_21044 ?auto_21038 ) ) ( AVAILABLE ?auto_21038 ) ( SURFACE-AT ?auto_21034 ?auto_21036 ) ( ON ?auto_21034 ?auto_21037 ) ( CLEAR ?auto_21034 ) ( not ( = ?auto_21034 ?auto_21037 ) ) ( not ( = ?auto_21035 ?auto_21037 ) ) ( not ( = ?auto_21033 ?auto_21037 ) ) ( not ( = ?auto_21042 ?auto_21037 ) ) ( TRUCK-AT ?auto_21041 ?auto_21039 ) ( ON ?auto_21033 ?auto_21032 ) ( not ( = ?auto_21032 ?auto_21033 ) ) ( not ( = ?auto_21032 ?auto_21034 ) ) ( not ( = ?auto_21032 ?auto_21035 ) ) ( not ( = ?auto_21032 ?auto_21042 ) ) ( not ( = ?auto_21032 ?auto_21037 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21033 ?auto_21034 ?auto_21035 )
      ( MAKE-3CRATE-VERIFY ?auto_21032 ?auto_21033 ?auto_21034 ?auto_21035 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21045 - SURFACE
      ?auto_21046 - SURFACE
      ?auto_21047 - SURFACE
      ?auto_21048 - SURFACE
      ?auto_21049 - SURFACE
    )
    :vars
    (
      ?auto_21054 - HOIST
      ?auto_21053 - PLACE
      ?auto_21057 - PLACE
      ?auto_21058 - HOIST
      ?auto_21056 - SURFACE
      ?auto_21050 - PLACE
      ?auto_21052 - HOIST
      ?auto_21051 - SURFACE
      ?auto_21055 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21054 ?auto_21053 ) ( IS-CRATE ?auto_21049 ) ( not ( = ?auto_21048 ?auto_21049 ) ) ( not ( = ?auto_21047 ?auto_21048 ) ) ( not ( = ?auto_21047 ?auto_21049 ) ) ( not ( = ?auto_21057 ?auto_21053 ) ) ( HOIST-AT ?auto_21058 ?auto_21057 ) ( not ( = ?auto_21054 ?auto_21058 ) ) ( AVAILABLE ?auto_21058 ) ( SURFACE-AT ?auto_21049 ?auto_21057 ) ( ON ?auto_21049 ?auto_21056 ) ( CLEAR ?auto_21049 ) ( not ( = ?auto_21048 ?auto_21056 ) ) ( not ( = ?auto_21049 ?auto_21056 ) ) ( not ( = ?auto_21047 ?auto_21056 ) ) ( SURFACE-AT ?auto_21047 ?auto_21053 ) ( CLEAR ?auto_21047 ) ( IS-CRATE ?auto_21048 ) ( AVAILABLE ?auto_21054 ) ( not ( = ?auto_21050 ?auto_21053 ) ) ( not ( = ?auto_21057 ?auto_21050 ) ) ( HOIST-AT ?auto_21052 ?auto_21050 ) ( not ( = ?auto_21054 ?auto_21052 ) ) ( not ( = ?auto_21058 ?auto_21052 ) ) ( AVAILABLE ?auto_21052 ) ( SURFACE-AT ?auto_21048 ?auto_21050 ) ( ON ?auto_21048 ?auto_21051 ) ( CLEAR ?auto_21048 ) ( not ( = ?auto_21048 ?auto_21051 ) ) ( not ( = ?auto_21049 ?auto_21051 ) ) ( not ( = ?auto_21047 ?auto_21051 ) ) ( not ( = ?auto_21056 ?auto_21051 ) ) ( TRUCK-AT ?auto_21055 ?auto_21053 ) ( ON ?auto_21046 ?auto_21045 ) ( ON ?auto_21047 ?auto_21046 ) ( not ( = ?auto_21045 ?auto_21046 ) ) ( not ( = ?auto_21045 ?auto_21047 ) ) ( not ( = ?auto_21045 ?auto_21048 ) ) ( not ( = ?auto_21045 ?auto_21049 ) ) ( not ( = ?auto_21045 ?auto_21056 ) ) ( not ( = ?auto_21045 ?auto_21051 ) ) ( not ( = ?auto_21046 ?auto_21047 ) ) ( not ( = ?auto_21046 ?auto_21048 ) ) ( not ( = ?auto_21046 ?auto_21049 ) ) ( not ( = ?auto_21046 ?auto_21056 ) ) ( not ( = ?auto_21046 ?auto_21051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21047 ?auto_21048 ?auto_21049 )
      ( MAKE-4CRATE-VERIFY ?auto_21045 ?auto_21046 ?auto_21047 ?auto_21048 ?auto_21049 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21059 - SURFACE
      ?auto_21060 - SURFACE
    )
    :vars
    (
      ?auto_21066 - HOIST
      ?auto_21065 - PLACE
      ?auto_21062 - SURFACE
      ?auto_21069 - PLACE
      ?auto_21070 - HOIST
      ?auto_21068 - SURFACE
      ?auto_21061 - PLACE
      ?auto_21064 - HOIST
      ?auto_21063 - SURFACE
      ?auto_21067 - TRUCK
      ?auto_21071 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21066 ?auto_21065 ) ( IS-CRATE ?auto_21060 ) ( not ( = ?auto_21059 ?auto_21060 ) ) ( not ( = ?auto_21062 ?auto_21059 ) ) ( not ( = ?auto_21062 ?auto_21060 ) ) ( not ( = ?auto_21069 ?auto_21065 ) ) ( HOIST-AT ?auto_21070 ?auto_21069 ) ( not ( = ?auto_21066 ?auto_21070 ) ) ( AVAILABLE ?auto_21070 ) ( SURFACE-AT ?auto_21060 ?auto_21069 ) ( ON ?auto_21060 ?auto_21068 ) ( CLEAR ?auto_21060 ) ( not ( = ?auto_21059 ?auto_21068 ) ) ( not ( = ?auto_21060 ?auto_21068 ) ) ( not ( = ?auto_21062 ?auto_21068 ) ) ( IS-CRATE ?auto_21059 ) ( not ( = ?auto_21061 ?auto_21065 ) ) ( not ( = ?auto_21069 ?auto_21061 ) ) ( HOIST-AT ?auto_21064 ?auto_21061 ) ( not ( = ?auto_21066 ?auto_21064 ) ) ( not ( = ?auto_21070 ?auto_21064 ) ) ( AVAILABLE ?auto_21064 ) ( SURFACE-AT ?auto_21059 ?auto_21061 ) ( ON ?auto_21059 ?auto_21063 ) ( CLEAR ?auto_21059 ) ( not ( = ?auto_21059 ?auto_21063 ) ) ( not ( = ?auto_21060 ?auto_21063 ) ) ( not ( = ?auto_21062 ?auto_21063 ) ) ( not ( = ?auto_21068 ?auto_21063 ) ) ( TRUCK-AT ?auto_21067 ?auto_21065 ) ( SURFACE-AT ?auto_21071 ?auto_21065 ) ( CLEAR ?auto_21071 ) ( LIFTING ?auto_21066 ?auto_21062 ) ( IS-CRATE ?auto_21062 ) ( not ( = ?auto_21071 ?auto_21062 ) ) ( not ( = ?auto_21059 ?auto_21071 ) ) ( not ( = ?auto_21060 ?auto_21071 ) ) ( not ( = ?auto_21068 ?auto_21071 ) ) ( not ( = ?auto_21063 ?auto_21071 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21071 ?auto_21062 )
      ( MAKE-2CRATE ?auto_21062 ?auto_21059 ?auto_21060 )
      ( MAKE-1CRATE-VERIFY ?auto_21059 ?auto_21060 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21072 - SURFACE
      ?auto_21073 - SURFACE
      ?auto_21074 - SURFACE
    )
    :vars
    (
      ?auto_21076 - HOIST
      ?auto_21075 - PLACE
      ?auto_21082 - PLACE
      ?auto_21077 - HOIST
      ?auto_21078 - SURFACE
      ?auto_21083 - PLACE
      ?auto_21080 - HOIST
      ?auto_21079 - SURFACE
      ?auto_21081 - TRUCK
      ?auto_21084 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21076 ?auto_21075 ) ( IS-CRATE ?auto_21074 ) ( not ( = ?auto_21073 ?auto_21074 ) ) ( not ( = ?auto_21072 ?auto_21073 ) ) ( not ( = ?auto_21072 ?auto_21074 ) ) ( not ( = ?auto_21082 ?auto_21075 ) ) ( HOIST-AT ?auto_21077 ?auto_21082 ) ( not ( = ?auto_21076 ?auto_21077 ) ) ( AVAILABLE ?auto_21077 ) ( SURFACE-AT ?auto_21074 ?auto_21082 ) ( ON ?auto_21074 ?auto_21078 ) ( CLEAR ?auto_21074 ) ( not ( = ?auto_21073 ?auto_21078 ) ) ( not ( = ?auto_21074 ?auto_21078 ) ) ( not ( = ?auto_21072 ?auto_21078 ) ) ( IS-CRATE ?auto_21073 ) ( not ( = ?auto_21083 ?auto_21075 ) ) ( not ( = ?auto_21082 ?auto_21083 ) ) ( HOIST-AT ?auto_21080 ?auto_21083 ) ( not ( = ?auto_21076 ?auto_21080 ) ) ( not ( = ?auto_21077 ?auto_21080 ) ) ( AVAILABLE ?auto_21080 ) ( SURFACE-AT ?auto_21073 ?auto_21083 ) ( ON ?auto_21073 ?auto_21079 ) ( CLEAR ?auto_21073 ) ( not ( = ?auto_21073 ?auto_21079 ) ) ( not ( = ?auto_21074 ?auto_21079 ) ) ( not ( = ?auto_21072 ?auto_21079 ) ) ( not ( = ?auto_21078 ?auto_21079 ) ) ( TRUCK-AT ?auto_21081 ?auto_21075 ) ( SURFACE-AT ?auto_21084 ?auto_21075 ) ( CLEAR ?auto_21084 ) ( LIFTING ?auto_21076 ?auto_21072 ) ( IS-CRATE ?auto_21072 ) ( not ( = ?auto_21084 ?auto_21072 ) ) ( not ( = ?auto_21073 ?auto_21084 ) ) ( not ( = ?auto_21074 ?auto_21084 ) ) ( not ( = ?auto_21078 ?auto_21084 ) ) ( not ( = ?auto_21079 ?auto_21084 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21073 ?auto_21074 )
      ( MAKE-2CRATE-VERIFY ?auto_21072 ?auto_21073 ?auto_21074 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21085 - SURFACE
      ?auto_21086 - SURFACE
      ?auto_21087 - SURFACE
      ?auto_21088 - SURFACE
    )
    :vars
    (
      ?auto_21097 - HOIST
      ?auto_21094 - PLACE
      ?auto_21096 - PLACE
      ?auto_21092 - HOIST
      ?auto_21095 - SURFACE
      ?auto_21093 - PLACE
      ?auto_21091 - HOIST
      ?auto_21089 - SURFACE
      ?auto_21090 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21097 ?auto_21094 ) ( IS-CRATE ?auto_21088 ) ( not ( = ?auto_21087 ?auto_21088 ) ) ( not ( = ?auto_21086 ?auto_21087 ) ) ( not ( = ?auto_21086 ?auto_21088 ) ) ( not ( = ?auto_21096 ?auto_21094 ) ) ( HOIST-AT ?auto_21092 ?auto_21096 ) ( not ( = ?auto_21097 ?auto_21092 ) ) ( AVAILABLE ?auto_21092 ) ( SURFACE-AT ?auto_21088 ?auto_21096 ) ( ON ?auto_21088 ?auto_21095 ) ( CLEAR ?auto_21088 ) ( not ( = ?auto_21087 ?auto_21095 ) ) ( not ( = ?auto_21088 ?auto_21095 ) ) ( not ( = ?auto_21086 ?auto_21095 ) ) ( IS-CRATE ?auto_21087 ) ( not ( = ?auto_21093 ?auto_21094 ) ) ( not ( = ?auto_21096 ?auto_21093 ) ) ( HOIST-AT ?auto_21091 ?auto_21093 ) ( not ( = ?auto_21097 ?auto_21091 ) ) ( not ( = ?auto_21092 ?auto_21091 ) ) ( AVAILABLE ?auto_21091 ) ( SURFACE-AT ?auto_21087 ?auto_21093 ) ( ON ?auto_21087 ?auto_21089 ) ( CLEAR ?auto_21087 ) ( not ( = ?auto_21087 ?auto_21089 ) ) ( not ( = ?auto_21088 ?auto_21089 ) ) ( not ( = ?auto_21086 ?auto_21089 ) ) ( not ( = ?auto_21095 ?auto_21089 ) ) ( TRUCK-AT ?auto_21090 ?auto_21094 ) ( SURFACE-AT ?auto_21085 ?auto_21094 ) ( CLEAR ?auto_21085 ) ( LIFTING ?auto_21097 ?auto_21086 ) ( IS-CRATE ?auto_21086 ) ( not ( = ?auto_21085 ?auto_21086 ) ) ( not ( = ?auto_21087 ?auto_21085 ) ) ( not ( = ?auto_21088 ?auto_21085 ) ) ( not ( = ?auto_21095 ?auto_21085 ) ) ( not ( = ?auto_21089 ?auto_21085 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21086 ?auto_21087 ?auto_21088 )
      ( MAKE-3CRATE-VERIFY ?auto_21085 ?auto_21086 ?auto_21087 ?auto_21088 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21098 - SURFACE
      ?auto_21099 - SURFACE
      ?auto_21100 - SURFACE
      ?auto_21101 - SURFACE
      ?auto_21102 - SURFACE
    )
    :vars
    (
      ?auto_21111 - HOIST
      ?auto_21108 - PLACE
      ?auto_21110 - PLACE
      ?auto_21106 - HOIST
      ?auto_21109 - SURFACE
      ?auto_21107 - PLACE
      ?auto_21105 - HOIST
      ?auto_21103 - SURFACE
      ?auto_21104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21111 ?auto_21108 ) ( IS-CRATE ?auto_21102 ) ( not ( = ?auto_21101 ?auto_21102 ) ) ( not ( = ?auto_21100 ?auto_21101 ) ) ( not ( = ?auto_21100 ?auto_21102 ) ) ( not ( = ?auto_21110 ?auto_21108 ) ) ( HOIST-AT ?auto_21106 ?auto_21110 ) ( not ( = ?auto_21111 ?auto_21106 ) ) ( AVAILABLE ?auto_21106 ) ( SURFACE-AT ?auto_21102 ?auto_21110 ) ( ON ?auto_21102 ?auto_21109 ) ( CLEAR ?auto_21102 ) ( not ( = ?auto_21101 ?auto_21109 ) ) ( not ( = ?auto_21102 ?auto_21109 ) ) ( not ( = ?auto_21100 ?auto_21109 ) ) ( IS-CRATE ?auto_21101 ) ( not ( = ?auto_21107 ?auto_21108 ) ) ( not ( = ?auto_21110 ?auto_21107 ) ) ( HOIST-AT ?auto_21105 ?auto_21107 ) ( not ( = ?auto_21111 ?auto_21105 ) ) ( not ( = ?auto_21106 ?auto_21105 ) ) ( AVAILABLE ?auto_21105 ) ( SURFACE-AT ?auto_21101 ?auto_21107 ) ( ON ?auto_21101 ?auto_21103 ) ( CLEAR ?auto_21101 ) ( not ( = ?auto_21101 ?auto_21103 ) ) ( not ( = ?auto_21102 ?auto_21103 ) ) ( not ( = ?auto_21100 ?auto_21103 ) ) ( not ( = ?auto_21109 ?auto_21103 ) ) ( TRUCK-AT ?auto_21104 ?auto_21108 ) ( SURFACE-AT ?auto_21099 ?auto_21108 ) ( CLEAR ?auto_21099 ) ( LIFTING ?auto_21111 ?auto_21100 ) ( IS-CRATE ?auto_21100 ) ( not ( = ?auto_21099 ?auto_21100 ) ) ( not ( = ?auto_21101 ?auto_21099 ) ) ( not ( = ?auto_21102 ?auto_21099 ) ) ( not ( = ?auto_21109 ?auto_21099 ) ) ( not ( = ?auto_21103 ?auto_21099 ) ) ( ON ?auto_21099 ?auto_21098 ) ( not ( = ?auto_21098 ?auto_21099 ) ) ( not ( = ?auto_21098 ?auto_21100 ) ) ( not ( = ?auto_21098 ?auto_21101 ) ) ( not ( = ?auto_21098 ?auto_21102 ) ) ( not ( = ?auto_21098 ?auto_21109 ) ) ( not ( = ?auto_21098 ?auto_21103 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21100 ?auto_21101 ?auto_21102 )
      ( MAKE-4CRATE-VERIFY ?auto_21098 ?auto_21099 ?auto_21100 ?auto_21101 ?auto_21102 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21112 - SURFACE
      ?auto_21113 - SURFACE
    )
    :vars
    (
      ?auto_21124 - HOIST
      ?auto_21119 - PLACE
      ?auto_21121 - SURFACE
      ?auto_21122 - PLACE
      ?auto_21117 - HOIST
      ?auto_21120 - SURFACE
      ?auto_21118 - PLACE
      ?auto_21116 - HOIST
      ?auto_21114 - SURFACE
      ?auto_21115 - TRUCK
      ?auto_21123 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21124 ?auto_21119 ) ( IS-CRATE ?auto_21113 ) ( not ( = ?auto_21112 ?auto_21113 ) ) ( not ( = ?auto_21121 ?auto_21112 ) ) ( not ( = ?auto_21121 ?auto_21113 ) ) ( not ( = ?auto_21122 ?auto_21119 ) ) ( HOIST-AT ?auto_21117 ?auto_21122 ) ( not ( = ?auto_21124 ?auto_21117 ) ) ( AVAILABLE ?auto_21117 ) ( SURFACE-AT ?auto_21113 ?auto_21122 ) ( ON ?auto_21113 ?auto_21120 ) ( CLEAR ?auto_21113 ) ( not ( = ?auto_21112 ?auto_21120 ) ) ( not ( = ?auto_21113 ?auto_21120 ) ) ( not ( = ?auto_21121 ?auto_21120 ) ) ( IS-CRATE ?auto_21112 ) ( not ( = ?auto_21118 ?auto_21119 ) ) ( not ( = ?auto_21122 ?auto_21118 ) ) ( HOIST-AT ?auto_21116 ?auto_21118 ) ( not ( = ?auto_21124 ?auto_21116 ) ) ( not ( = ?auto_21117 ?auto_21116 ) ) ( AVAILABLE ?auto_21116 ) ( SURFACE-AT ?auto_21112 ?auto_21118 ) ( ON ?auto_21112 ?auto_21114 ) ( CLEAR ?auto_21112 ) ( not ( = ?auto_21112 ?auto_21114 ) ) ( not ( = ?auto_21113 ?auto_21114 ) ) ( not ( = ?auto_21121 ?auto_21114 ) ) ( not ( = ?auto_21120 ?auto_21114 ) ) ( TRUCK-AT ?auto_21115 ?auto_21119 ) ( SURFACE-AT ?auto_21123 ?auto_21119 ) ( CLEAR ?auto_21123 ) ( IS-CRATE ?auto_21121 ) ( not ( = ?auto_21123 ?auto_21121 ) ) ( not ( = ?auto_21112 ?auto_21123 ) ) ( not ( = ?auto_21113 ?auto_21123 ) ) ( not ( = ?auto_21120 ?auto_21123 ) ) ( not ( = ?auto_21114 ?auto_21123 ) ) ( AVAILABLE ?auto_21124 ) ( IN ?auto_21121 ?auto_21115 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21124 ?auto_21121 ?auto_21115 ?auto_21119 )
      ( MAKE-2CRATE ?auto_21121 ?auto_21112 ?auto_21113 )
      ( MAKE-1CRATE-VERIFY ?auto_21112 ?auto_21113 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21125 - SURFACE
      ?auto_21126 - SURFACE
      ?auto_21127 - SURFACE
    )
    :vars
    (
      ?auto_21129 - HOIST
      ?auto_21128 - PLACE
      ?auto_21134 - PLACE
      ?auto_21136 - HOIST
      ?auto_21137 - SURFACE
      ?auto_21133 - PLACE
      ?auto_21130 - HOIST
      ?auto_21131 - SURFACE
      ?auto_21132 - TRUCK
      ?auto_21135 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21129 ?auto_21128 ) ( IS-CRATE ?auto_21127 ) ( not ( = ?auto_21126 ?auto_21127 ) ) ( not ( = ?auto_21125 ?auto_21126 ) ) ( not ( = ?auto_21125 ?auto_21127 ) ) ( not ( = ?auto_21134 ?auto_21128 ) ) ( HOIST-AT ?auto_21136 ?auto_21134 ) ( not ( = ?auto_21129 ?auto_21136 ) ) ( AVAILABLE ?auto_21136 ) ( SURFACE-AT ?auto_21127 ?auto_21134 ) ( ON ?auto_21127 ?auto_21137 ) ( CLEAR ?auto_21127 ) ( not ( = ?auto_21126 ?auto_21137 ) ) ( not ( = ?auto_21127 ?auto_21137 ) ) ( not ( = ?auto_21125 ?auto_21137 ) ) ( IS-CRATE ?auto_21126 ) ( not ( = ?auto_21133 ?auto_21128 ) ) ( not ( = ?auto_21134 ?auto_21133 ) ) ( HOIST-AT ?auto_21130 ?auto_21133 ) ( not ( = ?auto_21129 ?auto_21130 ) ) ( not ( = ?auto_21136 ?auto_21130 ) ) ( AVAILABLE ?auto_21130 ) ( SURFACE-AT ?auto_21126 ?auto_21133 ) ( ON ?auto_21126 ?auto_21131 ) ( CLEAR ?auto_21126 ) ( not ( = ?auto_21126 ?auto_21131 ) ) ( not ( = ?auto_21127 ?auto_21131 ) ) ( not ( = ?auto_21125 ?auto_21131 ) ) ( not ( = ?auto_21137 ?auto_21131 ) ) ( TRUCK-AT ?auto_21132 ?auto_21128 ) ( SURFACE-AT ?auto_21135 ?auto_21128 ) ( CLEAR ?auto_21135 ) ( IS-CRATE ?auto_21125 ) ( not ( = ?auto_21135 ?auto_21125 ) ) ( not ( = ?auto_21126 ?auto_21135 ) ) ( not ( = ?auto_21127 ?auto_21135 ) ) ( not ( = ?auto_21137 ?auto_21135 ) ) ( not ( = ?auto_21131 ?auto_21135 ) ) ( AVAILABLE ?auto_21129 ) ( IN ?auto_21125 ?auto_21132 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21126 ?auto_21127 )
      ( MAKE-2CRATE-VERIFY ?auto_21125 ?auto_21126 ?auto_21127 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21138 - SURFACE
      ?auto_21139 - SURFACE
      ?auto_21140 - SURFACE
      ?auto_21141 - SURFACE
    )
    :vars
    (
      ?auto_21146 - HOIST
      ?auto_21145 - PLACE
      ?auto_21143 - PLACE
      ?auto_21149 - HOIST
      ?auto_21148 - SURFACE
      ?auto_21147 - PLACE
      ?auto_21144 - HOIST
      ?auto_21142 - SURFACE
      ?auto_21150 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21146 ?auto_21145 ) ( IS-CRATE ?auto_21141 ) ( not ( = ?auto_21140 ?auto_21141 ) ) ( not ( = ?auto_21139 ?auto_21140 ) ) ( not ( = ?auto_21139 ?auto_21141 ) ) ( not ( = ?auto_21143 ?auto_21145 ) ) ( HOIST-AT ?auto_21149 ?auto_21143 ) ( not ( = ?auto_21146 ?auto_21149 ) ) ( AVAILABLE ?auto_21149 ) ( SURFACE-AT ?auto_21141 ?auto_21143 ) ( ON ?auto_21141 ?auto_21148 ) ( CLEAR ?auto_21141 ) ( not ( = ?auto_21140 ?auto_21148 ) ) ( not ( = ?auto_21141 ?auto_21148 ) ) ( not ( = ?auto_21139 ?auto_21148 ) ) ( IS-CRATE ?auto_21140 ) ( not ( = ?auto_21147 ?auto_21145 ) ) ( not ( = ?auto_21143 ?auto_21147 ) ) ( HOIST-AT ?auto_21144 ?auto_21147 ) ( not ( = ?auto_21146 ?auto_21144 ) ) ( not ( = ?auto_21149 ?auto_21144 ) ) ( AVAILABLE ?auto_21144 ) ( SURFACE-AT ?auto_21140 ?auto_21147 ) ( ON ?auto_21140 ?auto_21142 ) ( CLEAR ?auto_21140 ) ( not ( = ?auto_21140 ?auto_21142 ) ) ( not ( = ?auto_21141 ?auto_21142 ) ) ( not ( = ?auto_21139 ?auto_21142 ) ) ( not ( = ?auto_21148 ?auto_21142 ) ) ( TRUCK-AT ?auto_21150 ?auto_21145 ) ( SURFACE-AT ?auto_21138 ?auto_21145 ) ( CLEAR ?auto_21138 ) ( IS-CRATE ?auto_21139 ) ( not ( = ?auto_21138 ?auto_21139 ) ) ( not ( = ?auto_21140 ?auto_21138 ) ) ( not ( = ?auto_21141 ?auto_21138 ) ) ( not ( = ?auto_21148 ?auto_21138 ) ) ( not ( = ?auto_21142 ?auto_21138 ) ) ( AVAILABLE ?auto_21146 ) ( IN ?auto_21139 ?auto_21150 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21139 ?auto_21140 ?auto_21141 )
      ( MAKE-3CRATE-VERIFY ?auto_21138 ?auto_21139 ?auto_21140 ?auto_21141 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21151 - SURFACE
      ?auto_21152 - SURFACE
      ?auto_21153 - SURFACE
      ?auto_21154 - SURFACE
      ?auto_21155 - SURFACE
    )
    :vars
    (
      ?auto_21160 - HOIST
      ?auto_21159 - PLACE
      ?auto_21157 - PLACE
      ?auto_21163 - HOIST
      ?auto_21162 - SURFACE
      ?auto_21161 - PLACE
      ?auto_21158 - HOIST
      ?auto_21156 - SURFACE
      ?auto_21164 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21160 ?auto_21159 ) ( IS-CRATE ?auto_21155 ) ( not ( = ?auto_21154 ?auto_21155 ) ) ( not ( = ?auto_21153 ?auto_21154 ) ) ( not ( = ?auto_21153 ?auto_21155 ) ) ( not ( = ?auto_21157 ?auto_21159 ) ) ( HOIST-AT ?auto_21163 ?auto_21157 ) ( not ( = ?auto_21160 ?auto_21163 ) ) ( AVAILABLE ?auto_21163 ) ( SURFACE-AT ?auto_21155 ?auto_21157 ) ( ON ?auto_21155 ?auto_21162 ) ( CLEAR ?auto_21155 ) ( not ( = ?auto_21154 ?auto_21162 ) ) ( not ( = ?auto_21155 ?auto_21162 ) ) ( not ( = ?auto_21153 ?auto_21162 ) ) ( IS-CRATE ?auto_21154 ) ( not ( = ?auto_21161 ?auto_21159 ) ) ( not ( = ?auto_21157 ?auto_21161 ) ) ( HOIST-AT ?auto_21158 ?auto_21161 ) ( not ( = ?auto_21160 ?auto_21158 ) ) ( not ( = ?auto_21163 ?auto_21158 ) ) ( AVAILABLE ?auto_21158 ) ( SURFACE-AT ?auto_21154 ?auto_21161 ) ( ON ?auto_21154 ?auto_21156 ) ( CLEAR ?auto_21154 ) ( not ( = ?auto_21154 ?auto_21156 ) ) ( not ( = ?auto_21155 ?auto_21156 ) ) ( not ( = ?auto_21153 ?auto_21156 ) ) ( not ( = ?auto_21162 ?auto_21156 ) ) ( TRUCK-AT ?auto_21164 ?auto_21159 ) ( SURFACE-AT ?auto_21152 ?auto_21159 ) ( CLEAR ?auto_21152 ) ( IS-CRATE ?auto_21153 ) ( not ( = ?auto_21152 ?auto_21153 ) ) ( not ( = ?auto_21154 ?auto_21152 ) ) ( not ( = ?auto_21155 ?auto_21152 ) ) ( not ( = ?auto_21162 ?auto_21152 ) ) ( not ( = ?auto_21156 ?auto_21152 ) ) ( AVAILABLE ?auto_21160 ) ( IN ?auto_21153 ?auto_21164 ) ( ON ?auto_21152 ?auto_21151 ) ( not ( = ?auto_21151 ?auto_21152 ) ) ( not ( = ?auto_21151 ?auto_21153 ) ) ( not ( = ?auto_21151 ?auto_21154 ) ) ( not ( = ?auto_21151 ?auto_21155 ) ) ( not ( = ?auto_21151 ?auto_21162 ) ) ( not ( = ?auto_21151 ?auto_21156 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21153 ?auto_21154 ?auto_21155 )
      ( MAKE-4CRATE-VERIFY ?auto_21151 ?auto_21152 ?auto_21153 ?auto_21154 ?auto_21155 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21165 - SURFACE
      ?auto_21166 - SURFACE
    )
    :vars
    (
      ?auto_21172 - HOIST
      ?auto_21170 - PLACE
      ?auto_21177 - SURFACE
      ?auto_21168 - PLACE
      ?auto_21175 - HOIST
      ?auto_21174 - SURFACE
      ?auto_21173 - PLACE
      ?auto_21169 - HOIST
      ?auto_21167 - SURFACE
      ?auto_21171 - SURFACE
      ?auto_21176 - TRUCK
      ?auto_21178 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21172 ?auto_21170 ) ( IS-CRATE ?auto_21166 ) ( not ( = ?auto_21165 ?auto_21166 ) ) ( not ( = ?auto_21177 ?auto_21165 ) ) ( not ( = ?auto_21177 ?auto_21166 ) ) ( not ( = ?auto_21168 ?auto_21170 ) ) ( HOIST-AT ?auto_21175 ?auto_21168 ) ( not ( = ?auto_21172 ?auto_21175 ) ) ( AVAILABLE ?auto_21175 ) ( SURFACE-AT ?auto_21166 ?auto_21168 ) ( ON ?auto_21166 ?auto_21174 ) ( CLEAR ?auto_21166 ) ( not ( = ?auto_21165 ?auto_21174 ) ) ( not ( = ?auto_21166 ?auto_21174 ) ) ( not ( = ?auto_21177 ?auto_21174 ) ) ( IS-CRATE ?auto_21165 ) ( not ( = ?auto_21173 ?auto_21170 ) ) ( not ( = ?auto_21168 ?auto_21173 ) ) ( HOIST-AT ?auto_21169 ?auto_21173 ) ( not ( = ?auto_21172 ?auto_21169 ) ) ( not ( = ?auto_21175 ?auto_21169 ) ) ( AVAILABLE ?auto_21169 ) ( SURFACE-AT ?auto_21165 ?auto_21173 ) ( ON ?auto_21165 ?auto_21167 ) ( CLEAR ?auto_21165 ) ( not ( = ?auto_21165 ?auto_21167 ) ) ( not ( = ?auto_21166 ?auto_21167 ) ) ( not ( = ?auto_21177 ?auto_21167 ) ) ( not ( = ?auto_21174 ?auto_21167 ) ) ( SURFACE-AT ?auto_21171 ?auto_21170 ) ( CLEAR ?auto_21171 ) ( IS-CRATE ?auto_21177 ) ( not ( = ?auto_21171 ?auto_21177 ) ) ( not ( = ?auto_21165 ?auto_21171 ) ) ( not ( = ?auto_21166 ?auto_21171 ) ) ( not ( = ?auto_21174 ?auto_21171 ) ) ( not ( = ?auto_21167 ?auto_21171 ) ) ( AVAILABLE ?auto_21172 ) ( IN ?auto_21177 ?auto_21176 ) ( TRUCK-AT ?auto_21176 ?auto_21178 ) ( not ( = ?auto_21178 ?auto_21170 ) ) ( not ( = ?auto_21168 ?auto_21178 ) ) ( not ( = ?auto_21173 ?auto_21178 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21176 ?auto_21178 ?auto_21170 )
      ( MAKE-2CRATE ?auto_21177 ?auto_21165 ?auto_21166 )
      ( MAKE-1CRATE-VERIFY ?auto_21165 ?auto_21166 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21179 - SURFACE
      ?auto_21180 - SURFACE
      ?auto_21181 - SURFACE
    )
    :vars
    (
      ?auto_21188 - HOIST
      ?auto_21186 - PLACE
      ?auto_21190 - PLACE
      ?auto_21191 - HOIST
      ?auto_21187 - SURFACE
      ?auto_21189 - PLACE
      ?auto_21183 - HOIST
      ?auto_21185 - SURFACE
      ?auto_21182 - SURFACE
      ?auto_21192 - TRUCK
      ?auto_21184 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21188 ?auto_21186 ) ( IS-CRATE ?auto_21181 ) ( not ( = ?auto_21180 ?auto_21181 ) ) ( not ( = ?auto_21179 ?auto_21180 ) ) ( not ( = ?auto_21179 ?auto_21181 ) ) ( not ( = ?auto_21190 ?auto_21186 ) ) ( HOIST-AT ?auto_21191 ?auto_21190 ) ( not ( = ?auto_21188 ?auto_21191 ) ) ( AVAILABLE ?auto_21191 ) ( SURFACE-AT ?auto_21181 ?auto_21190 ) ( ON ?auto_21181 ?auto_21187 ) ( CLEAR ?auto_21181 ) ( not ( = ?auto_21180 ?auto_21187 ) ) ( not ( = ?auto_21181 ?auto_21187 ) ) ( not ( = ?auto_21179 ?auto_21187 ) ) ( IS-CRATE ?auto_21180 ) ( not ( = ?auto_21189 ?auto_21186 ) ) ( not ( = ?auto_21190 ?auto_21189 ) ) ( HOIST-AT ?auto_21183 ?auto_21189 ) ( not ( = ?auto_21188 ?auto_21183 ) ) ( not ( = ?auto_21191 ?auto_21183 ) ) ( AVAILABLE ?auto_21183 ) ( SURFACE-AT ?auto_21180 ?auto_21189 ) ( ON ?auto_21180 ?auto_21185 ) ( CLEAR ?auto_21180 ) ( not ( = ?auto_21180 ?auto_21185 ) ) ( not ( = ?auto_21181 ?auto_21185 ) ) ( not ( = ?auto_21179 ?auto_21185 ) ) ( not ( = ?auto_21187 ?auto_21185 ) ) ( SURFACE-AT ?auto_21182 ?auto_21186 ) ( CLEAR ?auto_21182 ) ( IS-CRATE ?auto_21179 ) ( not ( = ?auto_21182 ?auto_21179 ) ) ( not ( = ?auto_21180 ?auto_21182 ) ) ( not ( = ?auto_21181 ?auto_21182 ) ) ( not ( = ?auto_21187 ?auto_21182 ) ) ( not ( = ?auto_21185 ?auto_21182 ) ) ( AVAILABLE ?auto_21188 ) ( IN ?auto_21179 ?auto_21192 ) ( TRUCK-AT ?auto_21192 ?auto_21184 ) ( not ( = ?auto_21184 ?auto_21186 ) ) ( not ( = ?auto_21190 ?auto_21184 ) ) ( not ( = ?auto_21189 ?auto_21184 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21180 ?auto_21181 )
      ( MAKE-2CRATE-VERIFY ?auto_21179 ?auto_21180 ?auto_21181 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21193 - SURFACE
      ?auto_21194 - SURFACE
      ?auto_21195 - SURFACE
      ?auto_21196 - SURFACE
    )
    :vars
    (
      ?auto_21204 - HOIST
      ?auto_21203 - PLACE
      ?auto_21198 - PLACE
      ?auto_21206 - HOIST
      ?auto_21197 - SURFACE
      ?auto_21201 - PLACE
      ?auto_21202 - HOIST
      ?auto_21200 - SURFACE
      ?auto_21199 - TRUCK
      ?auto_21205 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21204 ?auto_21203 ) ( IS-CRATE ?auto_21196 ) ( not ( = ?auto_21195 ?auto_21196 ) ) ( not ( = ?auto_21194 ?auto_21195 ) ) ( not ( = ?auto_21194 ?auto_21196 ) ) ( not ( = ?auto_21198 ?auto_21203 ) ) ( HOIST-AT ?auto_21206 ?auto_21198 ) ( not ( = ?auto_21204 ?auto_21206 ) ) ( AVAILABLE ?auto_21206 ) ( SURFACE-AT ?auto_21196 ?auto_21198 ) ( ON ?auto_21196 ?auto_21197 ) ( CLEAR ?auto_21196 ) ( not ( = ?auto_21195 ?auto_21197 ) ) ( not ( = ?auto_21196 ?auto_21197 ) ) ( not ( = ?auto_21194 ?auto_21197 ) ) ( IS-CRATE ?auto_21195 ) ( not ( = ?auto_21201 ?auto_21203 ) ) ( not ( = ?auto_21198 ?auto_21201 ) ) ( HOIST-AT ?auto_21202 ?auto_21201 ) ( not ( = ?auto_21204 ?auto_21202 ) ) ( not ( = ?auto_21206 ?auto_21202 ) ) ( AVAILABLE ?auto_21202 ) ( SURFACE-AT ?auto_21195 ?auto_21201 ) ( ON ?auto_21195 ?auto_21200 ) ( CLEAR ?auto_21195 ) ( not ( = ?auto_21195 ?auto_21200 ) ) ( not ( = ?auto_21196 ?auto_21200 ) ) ( not ( = ?auto_21194 ?auto_21200 ) ) ( not ( = ?auto_21197 ?auto_21200 ) ) ( SURFACE-AT ?auto_21193 ?auto_21203 ) ( CLEAR ?auto_21193 ) ( IS-CRATE ?auto_21194 ) ( not ( = ?auto_21193 ?auto_21194 ) ) ( not ( = ?auto_21195 ?auto_21193 ) ) ( not ( = ?auto_21196 ?auto_21193 ) ) ( not ( = ?auto_21197 ?auto_21193 ) ) ( not ( = ?auto_21200 ?auto_21193 ) ) ( AVAILABLE ?auto_21204 ) ( IN ?auto_21194 ?auto_21199 ) ( TRUCK-AT ?auto_21199 ?auto_21205 ) ( not ( = ?auto_21205 ?auto_21203 ) ) ( not ( = ?auto_21198 ?auto_21205 ) ) ( not ( = ?auto_21201 ?auto_21205 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21194 ?auto_21195 ?auto_21196 )
      ( MAKE-3CRATE-VERIFY ?auto_21193 ?auto_21194 ?auto_21195 ?auto_21196 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21207 - SURFACE
      ?auto_21208 - SURFACE
      ?auto_21209 - SURFACE
      ?auto_21210 - SURFACE
      ?auto_21211 - SURFACE
    )
    :vars
    (
      ?auto_21219 - HOIST
      ?auto_21218 - PLACE
      ?auto_21213 - PLACE
      ?auto_21221 - HOIST
      ?auto_21212 - SURFACE
      ?auto_21216 - PLACE
      ?auto_21217 - HOIST
      ?auto_21215 - SURFACE
      ?auto_21214 - TRUCK
      ?auto_21220 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21219 ?auto_21218 ) ( IS-CRATE ?auto_21211 ) ( not ( = ?auto_21210 ?auto_21211 ) ) ( not ( = ?auto_21209 ?auto_21210 ) ) ( not ( = ?auto_21209 ?auto_21211 ) ) ( not ( = ?auto_21213 ?auto_21218 ) ) ( HOIST-AT ?auto_21221 ?auto_21213 ) ( not ( = ?auto_21219 ?auto_21221 ) ) ( AVAILABLE ?auto_21221 ) ( SURFACE-AT ?auto_21211 ?auto_21213 ) ( ON ?auto_21211 ?auto_21212 ) ( CLEAR ?auto_21211 ) ( not ( = ?auto_21210 ?auto_21212 ) ) ( not ( = ?auto_21211 ?auto_21212 ) ) ( not ( = ?auto_21209 ?auto_21212 ) ) ( IS-CRATE ?auto_21210 ) ( not ( = ?auto_21216 ?auto_21218 ) ) ( not ( = ?auto_21213 ?auto_21216 ) ) ( HOIST-AT ?auto_21217 ?auto_21216 ) ( not ( = ?auto_21219 ?auto_21217 ) ) ( not ( = ?auto_21221 ?auto_21217 ) ) ( AVAILABLE ?auto_21217 ) ( SURFACE-AT ?auto_21210 ?auto_21216 ) ( ON ?auto_21210 ?auto_21215 ) ( CLEAR ?auto_21210 ) ( not ( = ?auto_21210 ?auto_21215 ) ) ( not ( = ?auto_21211 ?auto_21215 ) ) ( not ( = ?auto_21209 ?auto_21215 ) ) ( not ( = ?auto_21212 ?auto_21215 ) ) ( SURFACE-AT ?auto_21208 ?auto_21218 ) ( CLEAR ?auto_21208 ) ( IS-CRATE ?auto_21209 ) ( not ( = ?auto_21208 ?auto_21209 ) ) ( not ( = ?auto_21210 ?auto_21208 ) ) ( not ( = ?auto_21211 ?auto_21208 ) ) ( not ( = ?auto_21212 ?auto_21208 ) ) ( not ( = ?auto_21215 ?auto_21208 ) ) ( AVAILABLE ?auto_21219 ) ( IN ?auto_21209 ?auto_21214 ) ( TRUCK-AT ?auto_21214 ?auto_21220 ) ( not ( = ?auto_21220 ?auto_21218 ) ) ( not ( = ?auto_21213 ?auto_21220 ) ) ( not ( = ?auto_21216 ?auto_21220 ) ) ( ON ?auto_21208 ?auto_21207 ) ( not ( = ?auto_21207 ?auto_21208 ) ) ( not ( = ?auto_21207 ?auto_21209 ) ) ( not ( = ?auto_21207 ?auto_21210 ) ) ( not ( = ?auto_21207 ?auto_21211 ) ) ( not ( = ?auto_21207 ?auto_21212 ) ) ( not ( = ?auto_21207 ?auto_21215 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21209 ?auto_21210 ?auto_21211 )
      ( MAKE-4CRATE-VERIFY ?auto_21207 ?auto_21208 ?auto_21209 ?auto_21210 ?auto_21211 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21222 - SURFACE
      ?auto_21223 - SURFACE
    )
    :vars
    (
      ?auto_21233 - HOIST
      ?auto_21232 - PLACE
      ?auto_21224 - SURFACE
      ?auto_21226 - PLACE
      ?auto_21235 - HOIST
      ?auto_21225 - SURFACE
      ?auto_21229 - PLACE
      ?auto_21230 - HOIST
      ?auto_21228 - SURFACE
      ?auto_21231 - SURFACE
      ?auto_21227 - TRUCK
      ?auto_21234 - PLACE
      ?auto_21236 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21233 ?auto_21232 ) ( IS-CRATE ?auto_21223 ) ( not ( = ?auto_21222 ?auto_21223 ) ) ( not ( = ?auto_21224 ?auto_21222 ) ) ( not ( = ?auto_21224 ?auto_21223 ) ) ( not ( = ?auto_21226 ?auto_21232 ) ) ( HOIST-AT ?auto_21235 ?auto_21226 ) ( not ( = ?auto_21233 ?auto_21235 ) ) ( AVAILABLE ?auto_21235 ) ( SURFACE-AT ?auto_21223 ?auto_21226 ) ( ON ?auto_21223 ?auto_21225 ) ( CLEAR ?auto_21223 ) ( not ( = ?auto_21222 ?auto_21225 ) ) ( not ( = ?auto_21223 ?auto_21225 ) ) ( not ( = ?auto_21224 ?auto_21225 ) ) ( IS-CRATE ?auto_21222 ) ( not ( = ?auto_21229 ?auto_21232 ) ) ( not ( = ?auto_21226 ?auto_21229 ) ) ( HOIST-AT ?auto_21230 ?auto_21229 ) ( not ( = ?auto_21233 ?auto_21230 ) ) ( not ( = ?auto_21235 ?auto_21230 ) ) ( AVAILABLE ?auto_21230 ) ( SURFACE-AT ?auto_21222 ?auto_21229 ) ( ON ?auto_21222 ?auto_21228 ) ( CLEAR ?auto_21222 ) ( not ( = ?auto_21222 ?auto_21228 ) ) ( not ( = ?auto_21223 ?auto_21228 ) ) ( not ( = ?auto_21224 ?auto_21228 ) ) ( not ( = ?auto_21225 ?auto_21228 ) ) ( SURFACE-AT ?auto_21231 ?auto_21232 ) ( CLEAR ?auto_21231 ) ( IS-CRATE ?auto_21224 ) ( not ( = ?auto_21231 ?auto_21224 ) ) ( not ( = ?auto_21222 ?auto_21231 ) ) ( not ( = ?auto_21223 ?auto_21231 ) ) ( not ( = ?auto_21225 ?auto_21231 ) ) ( not ( = ?auto_21228 ?auto_21231 ) ) ( AVAILABLE ?auto_21233 ) ( TRUCK-AT ?auto_21227 ?auto_21234 ) ( not ( = ?auto_21234 ?auto_21232 ) ) ( not ( = ?auto_21226 ?auto_21234 ) ) ( not ( = ?auto_21229 ?auto_21234 ) ) ( HOIST-AT ?auto_21236 ?auto_21234 ) ( LIFTING ?auto_21236 ?auto_21224 ) ( not ( = ?auto_21233 ?auto_21236 ) ) ( not ( = ?auto_21235 ?auto_21236 ) ) ( not ( = ?auto_21230 ?auto_21236 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21236 ?auto_21224 ?auto_21227 ?auto_21234 )
      ( MAKE-2CRATE ?auto_21224 ?auto_21222 ?auto_21223 )
      ( MAKE-1CRATE-VERIFY ?auto_21222 ?auto_21223 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21237 - SURFACE
      ?auto_21238 - SURFACE
      ?auto_21239 - SURFACE
    )
    :vars
    (
      ?auto_21245 - HOIST
      ?auto_21246 - PLACE
      ?auto_21241 - PLACE
      ?auto_21244 - HOIST
      ?auto_21247 - SURFACE
      ?auto_21240 - PLACE
      ?auto_21250 - HOIST
      ?auto_21242 - SURFACE
      ?auto_21251 - SURFACE
      ?auto_21249 - TRUCK
      ?auto_21243 - PLACE
      ?auto_21248 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21245 ?auto_21246 ) ( IS-CRATE ?auto_21239 ) ( not ( = ?auto_21238 ?auto_21239 ) ) ( not ( = ?auto_21237 ?auto_21238 ) ) ( not ( = ?auto_21237 ?auto_21239 ) ) ( not ( = ?auto_21241 ?auto_21246 ) ) ( HOIST-AT ?auto_21244 ?auto_21241 ) ( not ( = ?auto_21245 ?auto_21244 ) ) ( AVAILABLE ?auto_21244 ) ( SURFACE-AT ?auto_21239 ?auto_21241 ) ( ON ?auto_21239 ?auto_21247 ) ( CLEAR ?auto_21239 ) ( not ( = ?auto_21238 ?auto_21247 ) ) ( not ( = ?auto_21239 ?auto_21247 ) ) ( not ( = ?auto_21237 ?auto_21247 ) ) ( IS-CRATE ?auto_21238 ) ( not ( = ?auto_21240 ?auto_21246 ) ) ( not ( = ?auto_21241 ?auto_21240 ) ) ( HOIST-AT ?auto_21250 ?auto_21240 ) ( not ( = ?auto_21245 ?auto_21250 ) ) ( not ( = ?auto_21244 ?auto_21250 ) ) ( AVAILABLE ?auto_21250 ) ( SURFACE-AT ?auto_21238 ?auto_21240 ) ( ON ?auto_21238 ?auto_21242 ) ( CLEAR ?auto_21238 ) ( not ( = ?auto_21238 ?auto_21242 ) ) ( not ( = ?auto_21239 ?auto_21242 ) ) ( not ( = ?auto_21237 ?auto_21242 ) ) ( not ( = ?auto_21247 ?auto_21242 ) ) ( SURFACE-AT ?auto_21251 ?auto_21246 ) ( CLEAR ?auto_21251 ) ( IS-CRATE ?auto_21237 ) ( not ( = ?auto_21251 ?auto_21237 ) ) ( not ( = ?auto_21238 ?auto_21251 ) ) ( not ( = ?auto_21239 ?auto_21251 ) ) ( not ( = ?auto_21247 ?auto_21251 ) ) ( not ( = ?auto_21242 ?auto_21251 ) ) ( AVAILABLE ?auto_21245 ) ( TRUCK-AT ?auto_21249 ?auto_21243 ) ( not ( = ?auto_21243 ?auto_21246 ) ) ( not ( = ?auto_21241 ?auto_21243 ) ) ( not ( = ?auto_21240 ?auto_21243 ) ) ( HOIST-AT ?auto_21248 ?auto_21243 ) ( LIFTING ?auto_21248 ?auto_21237 ) ( not ( = ?auto_21245 ?auto_21248 ) ) ( not ( = ?auto_21244 ?auto_21248 ) ) ( not ( = ?auto_21250 ?auto_21248 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21238 ?auto_21239 )
      ( MAKE-2CRATE-VERIFY ?auto_21237 ?auto_21238 ?auto_21239 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21252 - SURFACE
      ?auto_21253 - SURFACE
      ?auto_21254 - SURFACE
      ?auto_21255 - SURFACE
    )
    :vars
    (
      ?auto_21260 - HOIST
      ?auto_21262 - PLACE
      ?auto_21259 - PLACE
      ?auto_21257 - HOIST
      ?auto_21256 - SURFACE
      ?auto_21264 - PLACE
      ?auto_21261 - HOIST
      ?auto_21266 - SURFACE
      ?auto_21263 - TRUCK
      ?auto_21258 - PLACE
      ?auto_21265 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21260 ?auto_21262 ) ( IS-CRATE ?auto_21255 ) ( not ( = ?auto_21254 ?auto_21255 ) ) ( not ( = ?auto_21253 ?auto_21254 ) ) ( not ( = ?auto_21253 ?auto_21255 ) ) ( not ( = ?auto_21259 ?auto_21262 ) ) ( HOIST-AT ?auto_21257 ?auto_21259 ) ( not ( = ?auto_21260 ?auto_21257 ) ) ( AVAILABLE ?auto_21257 ) ( SURFACE-AT ?auto_21255 ?auto_21259 ) ( ON ?auto_21255 ?auto_21256 ) ( CLEAR ?auto_21255 ) ( not ( = ?auto_21254 ?auto_21256 ) ) ( not ( = ?auto_21255 ?auto_21256 ) ) ( not ( = ?auto_21253 ?auto_21256 ) ) ( IS-CRATE ?auto_21254 ) ( not ( = ?auto_21264 ?auto_21262 ) ) ( not ( = ?auto_21259 ?auto_21264 ) ) ( HOIST-AT ?auto_21261 ?auto_21264 ) ( not ( = ?auto_21260 ?auto_21261 ) ) ( not ( = ?auto_21257 ?auto_21261 ) ) ( AVAILABLE ?auto_21261 ) ( SURFACE-AT ?auto_21254 ?auto_21264 ) ( ON ?auto_21254 ?auto_21266 ) ( CLEAR ?auto_21254 ) ( not ( = ?auto_21254 ?auto_21266 ) ) ( not ( = ?auto_21255 ?auto_21266 ) ) ( not ( = ?auto_21253 ?auto_21266 ) ) ( not ( = ?auto_21256 ?auto_21266 ) ) ( SURFACE-AT ?auto_21252 ?auto_21262 ) ( CLEAR ?auto_21252 ) ( IS-CRATE ?auto_21253 ) ( not ( = ?auto_21252 ?auto_21253 ) ) ( not ( = ?auto_21254 ?auto_21252 ) ) ( not ( = ?auto_21255 ?auto_21252 ) ) ( not ( = ?auto_21256 ?auto_21252 ) ) ( not ( = ?auto_21266 ?auto_21252 ) ) ( AVAILABLE ?auto_21260 ) ( TRUCK-AT ?auto_21263 ?auto_21258 ) ( not ( = ?auto_21258 ?auto_21262 ) ) ( not ( = ?auto_21259 ?auto_21258 ) ) ( not ( = ?auto_21264 ?auto_21258 ) ) ( HOIST-AT ?auto_21265 ?auto_21258 ) ( LIFTING ?auto_21265 ?auto_21253 ) ( not ( = ?auto_21260 ?auto_21265 ) ) ( not ( = ?auto_21257 ?auto_21265 ) ) ( not ( = ?auto_21261 ?auto_21265 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21253 ?auto_21254 ?auto_21255 )
      ( MAKE-3CRATE-VERIFY ?auto_21252 ?auto_21253 ?auto_21254 ?auto_21255 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21267 - SURFACE
      ?auto_21268 - SURFACE
      ?auto_21269 - SURFACE
      ?auto_21270 - SURFACE
      ?auto_21271 - SURFACE
    )
    :vars
    (
      ?auto_21276 - HOIST
      ?auto_21278 - PLACE
      ?auto_21275 - PLACE
      ?auto_21273 - HOIST
      ?auto_21272 - SURFACE
      ?auto_21280 - PLACE
      ?auto_21277 - HOIST
      ?auto_21282 - SURFACE
      ?auto_21279 - TRUCK
      ?auto_21274 - PLACE
      ?auto_21281 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21276 ?auto_21278 ) ( IS-CRATE ?auto_21271 ) ( not ( = ?auto_21270 ?auto_21271 ) ) ( not ( = ?auto_21269 ?auto_21270 ) ) ( not ( = ?auto_21269 ?auto_21271 ) ) ( not ( = ?auto_21275 ?auto_21278 ) ) ( HOIST-AT ?auto_21273 ?auto_21275 ) ( not ( = ?auto_21276 ?auto_21273 ) ) ( AVAILABLE ?auto_21273 ) ( SURFACE-AT ?auto_21271 ?auto_21275 ) ( ON ?auto_21271 ?auto_21272 ) ( CLEAR ?auto_21271 ) ( not ( = ?auto_21270 ?auto_21272 ) ) ( not ( = ?auto_21271 ?auto_21272 ) ) ( not ( = ?auto_21269 ?auto_21272 ) ) ( IS-CRATE ?auto_21270 ) ( not ( = ?auto_21280 ?auto_21278 ) ) ( not ( = ?auto_21275 ?auto_21280 ) ) ( HOIST-AT ?auto_21277 ?auto_21280 ) ( not ( = ?auto_21276 ?auto_21277 ) ) ( not ( = ?auto_21273 ?auto_21277 ) ) ( AVAILABLE ?auto_21277 ) ( SURFACE-AT ?auto_21270 ?auto_21280 ) ( ON ?auto_21270 ?auto_21282 ) ( CLEAR ?auto_21270 ) ( not ( = ?auto_21270 ?auto_21282 ) ) ( not ( = ?auto_21271 ?auto_21282 ) ) ( not ( = ?auto_21269 ?auto_21282 ) ) ( not ( = ?auto_21272 ?auto_21282 ) ) ( SURFACE-AT ?auto_21268 ?auto_21278 ) ( CLEAR ?auto_21268 ) ( IS-CRATE ?auto_21269 ) ( not ( = ?auto_21268 ?auto_21269 ) ) ( not ( = ?auto_21270 ?auto_21268 ) ) ( not ( = ?auto_21271 ?auto_21268 ) ) ( not ( = ?auto_21272 ?auto_21268 ) ) ( not ( = ?auto_21282 ?auto_21268 ) ) ( AVAILABLE ?auto_21276 ) ( TRUCK-AT ?auto_21279 ?auto_21274 ) ( not ( = ?auto_21274 ?auto_21278 ) ) ( not ( = ?auto_21275 ?auto_21274 ) ) ( not ( = ?auto_21280 ?auto_21274 ) ) ( HOIST-AT ?auto_21281 ?auto_21274 ) ( LIFTING ?auto_21281 ?auto_21269 ) ( not ( = ?auto_21276 ?auto_21281 ) ) ( not ( = ?auto_21273 ?auto_21281 ) ) ( not ( = ?auto_21277 ?auto_21281 ) ) ( ON ?auto_21268 ?auto_21267 ) ( not ( = ?auto_21267 ?auto_21268 ) ) ( not ( = ?auto_21267 ?auto_21269 ) ) ( not ( = ?auto_21267 ?auto_21270 ) ) ( not ( = ?auto_21267 ?auto_21271 ) ) ( not ( = ?auto_21267 ?auto_21272 ) ) ( not ( = ?auto_21267 ?auto_21282 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21269 ?auto_21270 ?auto_21271 )
      ( MAKE-4CRATE-VERIFY ?auto_21267 ?auto_21268 ?auto_21269 ?auto_21270 ?auto_21271 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21283 - SURFACE
      ?auto_21284 - SURFACE
    )
    :vars
    (
      ?auto_21289 - HOIST
      ?auto_21291 - PLACE
      ?auto_21295 - SURFACE
      ?auto_21288 - PLACE
      ?auto_21286 - HOIST
      ?auto_21285 - SURFACE
      ?auto_21294 - PLACE
      ?auto_21290 - HOIST
      ?auto_21297 - SURFACE
      ?auto_21292 - SURFACE
      ?auto_21293 - TRUCK
      ?auto_21287 - PLACE
      ?auto_21296 - HOIST
      ?auto_21298 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21289 ?auto_21291 ) ( IS-CRATE ?auto_21284 ) ( not ( = ?auto_21283 ?auto_21284 ) ) ( not ( = ?auto_21295 ?auto_21283 ) ) ( not ( = ?auto_21295 ?auto_21284 ) ) ( not ( = ?auto_21288 ?auto_21291 ) ) ( HOIST-AT ?auto_21286 ?auto_21288 ) ( not ( = ?auto_21289 ?auto_21286 ) ) ( AVAILABLE ?auto_21286 ) ( SURFACE-AT ?auto_21284 ?auto_21288 ) ( ON ?auto_21284 ?auto_21285 ) ( CLEAR ?auto_21284 ) ( not ( = ?auto_21283 ?auto_21285 ) ) ( not ( = ?auto_21284 ?auto_21285 ) ) ( not ( = ?auto_21295 ?auto_21285 ) ) ( IS-CRATE ?auto_21283 ) ( not ( = ?auto_21294 ?auto_21291 ) ) ( not ( = ?auto_21288 ?auto_21294 ) ) ( HOIST-AT ?auto_21290 ?auto_21294 ) ( not ( = ?auto_21289 ?auto_21290 ) ) ( not ( = ?auto_21286 ?auto_21290 ) ) ( AVAILABLE ?auto_21290 ) ( SURFACE-AT ?auto_21283 ?auto_21294 ) ( ON ?auto_21283 ?auto_21297 ) ( CLEAR ?auto_21283 ) ( not ( = ?auto_21283 ?auto_21297 ) ) ( not ( = ?auto_21284 ?auto_21297 ) ) ( not ( = ?auto_21295 ?auto_21297 ) ) ( not ( = ?auto_21285 ?auto_21297 ) ) ( SURFACE-AT ?auto_21292 ?auto_21291 ) ( CLEAR ?auto_21292 ) ( IS-CRATE ?auto_21295 ) ( not ( = ?auto_21292 ?auto_21295 ) ) ( not ( = ?auto_21283 ?auto_21292 ) ) ( not ( = ?auto_21284 ?auto_21292 ) ) ( not ( = ?auto_21285 ?auto_21292 ) ) ( not ( = ?auto_21297 ?auto_21292 ) ) ( AVAILABLE ?auto_21289 ) ( TRUCK-AT ?auto_21293 ?auto_21287 ) ( not ( = ?auto_21287 ?auto_21291 ) ) ( not ( = ?auto_21288 ?auto_21287 ) ) ( not ( = ?auto_21294 ?auto_21287 ) ) ( HOIST-AT ?auto_21296 ?auto_21287 ) ( not ( = ?auto_21289 ?auto_21296 ) ) ( not ( = ?auto_21286 ?auto_21296 ) ) ( not ( = ?auto_21290 ?auto_21296 ) ) ( AVAILABLE ?auto_21296 ) ( SURFACE-AT ?auto_21295 ?auto_21287 ) ( ON ?auto_21295 ?auto_21298 ) ( CLEAR ?auto_21295 ) ( not ( = ?auto_21283 ?auto_21298 ) ) ( not ( = ?auto_21284 ?auto_21298 ) ) ( not ( = ?auto_21295 ?auto_21298 ) ) ( not ( = ?auto_21285 ?auto_21298 ) ) ( not ( = ?auto_21297 ?auto_21298 ) ) ( not ( = ?auto_21292 ?auto_21298 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21296 ?auto_21295 ?auto_21298 ?auto_21287 )
      ( MAKE-2CRATE ?auto_21295 ?auto_21283 ?auto_21284 )
      ( MAKE-1CRATE-VERIFY ?auto_21283 ?auto_21284 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21299 - SURFACE
      ?auto_21300 - SURFACE
      ?auto_21301 - SURFACE
    )
    :vars
    (
      ?auto_21314 - HOIST
      ?auto_21310 - PLACE
      ?auto_21302 - PLACE
      ?auto_21311 - HOIST
      ?auto_21303 - SURFACE
      ?auto_21307 - PLACE
      ?auto_21309 - HOIST
      ?auto_21308 - SURFACE
      ?auto_21313 - SURFACE
      ?auto_21306 - TRUCK
      ?auto_21304 - PLACE
      ?auto_21312 - HOIST
      ?auto_21305 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21314 ?auto_21310 ) ( IS-CRATE ?auto_21301 ) ( not ( = ?auto_21300 ?auto_21301 ) ) ( not ( = ?auto_21299 ?auto_21300 ) ) ( not ( = ?auto_21299 ?auto_21301 ) ) ( not ( = ?auto_21302 ?auto_21310 ) ) ( HOIST-AT ?auto_21311 ?auto_21302 ) ( not ( = ?auto_21314 ?auto_21311 ) ) ( AVAILABLE ?auto_21311 ) ( SURFACE-AT ?auto_21301 ?auto_21302 ) ( ON ?auto_21301 ?auto_21303 ) ( CLEAR ?auto_21301 ) ( not ( = ?auto_21300 ?auto_21303 ) ) ( not ( = ?auto_21301 ?auto_21303 ) ) ( not ( = ?auto_21299 ?auto_21303 ) ) ( IS-CRATE ?auto_21300 ) ( not ( = ?auto_21307 ?auto_21310 ) ) ( not ( = ?auto_21302 ?auto_21307 ) ) ( HOIST-AT ?auto_21309 ?auto_21307 ) ( not ( = ?auto_21314 ?auto_21309 ) ) ( not ( = ?auto_21311 ?auto_21309 ) ) ( AVAILABLE ?auto_21309 ) ( SURFACE-AT ?auto_21300 ?auto_21307 ) ( ON ?auto_21300 ?auto_21308 ) ( CLEAR ?auto_21300 ) ( not ( = ?auto_21300 ?auto_21308 ) ) ( not ( = ?auto_21301 ?auto_21308 ) ) ( not ( = ?auto_21299 ?auto_21308 ) ) ( not ( = ?auto_21303 ?auto_21308 ) ) ( SURFACE-AT ?auto_21313 ?auto_21310 ) ( CLEAR ?auto_21313 ) ( IS-CRATE ?auto_21299 ) ( not ( = ?auto_21313 ?auto_21299 ) ) ( not ( = ?auto_21300 ?auto_21313 ) ) ( not ( = ?auto_21301 ?auto_21313 ) ) ( not ( = ?auto_21303 ?auto_21313 ) ) ( not ( = ?auto_21308 ?auto_21313 ) ) ( AVAILABLE ?auto_21314 ) ( TRUCK-AT ?auto_21306 ?auto_21304 ) ( not ( = ?auto_21304 ?auto_21310 ) ) ( not ( = ?auto_21302 ?auto_21304 ) ) ( not ( = ?auto_21307 ?auto_21304 ) ) ( HOIST-AT ?auto_21312 ?auto_21304 ) ( not ( = ?auto_21314 ?auto_21312 ) ) ( not ( = ?auto_21311 ?auto_21312 ) ) ( not ( = ?auto_21309 ?auto_21312 ) ) ( AVAILABLE ?auto_21312 ) ( SURFACE-AT ?auto_21299 ?auto_21304 ) ( ON ?auto_21299 ?auto_21305 ) ( CLEAR ?auto_21299 ) ( not ( = ?auto_21300 ?auto_21305 ) ) ( not ( = ?auto_21301 ?auto_21305 ) ) ( not ( = ?auto_21299 ?auto_21305 ) ) ( not ( = ?auto_21303 ?auto_21305 ) ) ( not ( = ?auto_21308 ?auto_21305 ) ) ( not ( = ?auto_21313 ?auto_21305 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21300 ?auto_21301 )
      ( MAKE-2CRATE-VERIFY ?auto_21299 ?auto_21300 ?auto_21301 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21315 - SURFACE
      ?auto_21316 - SURFACE
      ?auto_21317 - SURFACE
      ?auto_21318 - SURFACE
    )
    :vars
    (
      ?auto_21320 - HOIST
      ?auto_21325 - PLACE
      ?auto_21321 - PLACE
      ?auto_21322 - HOIST
      ?auto_21324 - SURFACE
      ?auto_21323 - PLACE
      ?auto_21330 - HOIST
      ?auto_21328 - SURFACE
      ?auto_21327 - TRUCK
      ?auto_21326 - PLACE
      ?auto_21329 - HOIST
      ?auto_21319 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21320 ?auto_21325 ) ( IS-CRATE ?auto_21318 ) ( not ( = ?auto_21317 ?auto_21318 ) ) ( not ( = ?auto_21316 ?auto_21317 ) ) ( not ( = ?auto_21316 ?auto_21318 ) ) ( not ( = ?auto_21321 ?auto_21325 ) ) ( HOIST-AT ?auto_21322 ?auto_21321 ) ( not ( = ?auto_21320 ?auto_21322 ) ) ( AVAILABLE ?auto_21322 ) ( SURFACE-AT ?auto_21318 ?auto_21321 ) ( ON ?auto_21318 ?auto_21324 ) ( CLEAR ?auto_21318 ) ( not ( = ?auto_21317 ?auto_21324 ) ) ( not ( = ?auto_21318 ?auto_21324 ) ) ( not ( = ?auto_21316 ?auto_21324 ) ) ( IS-CRATE ?auto_21317 ) ( not ( = ?auto_21323 ?auto_21325 ) ) ( not ( = ?auto_21321 ?auto_21323 ) ) ( HOIST-AT ?auto_21330 ?auto_21323 ) ( not ( = ?auto_21320 ?auto_21330 ) ) ( not ( = ?auto_21322 ?auto_21330 ) ) ( AVAILABLE ?auto_21330 ) ( SURFACE-AT ?auto_21317 ?auto_21323 ) ( ON ?auto_21317 ?auto_21328 ) ( CLEAR ?auto_21317 ) ( not ( = ?auto_21317 ?auto_21328 ) ) ( not ( = ?auto_21318 ?auto_21328 ) ) ( not ( = ?auto_21316 ?auto_21328 ) ) ( not ( = ?auto_21324 ?auto_21328 ) ) ( SURFACE-AT ?auto_21315 ?auto_21325 ) ( CLEAR ?auto_21315 ) ( IS-CRATE ?auto_21316 ) ( not ( = ?auto_21315 ?auto_21316 ) ) ( not ( = ?auto_21317 ?auto_21315 ) ) ( not ( = ?auto_21318 ?auto_21315 ) ) ( not ( = ?auto_21324 ?auto_21315 ) ) ( not ( = ?auto_21328 ?auto_21315 ) ) ( AVAILABLE ?auto_21320 ) ( TRUCK-AT ?auto_21327 ?auto_21326 ) ( not ( = ?auto_21326 ?auto_21325 ) ) ( not ( = ?auto_21321 ?auto_21326 ) ) ( not ( = ?auto_21323 ?auto_21326 ) ) ( HOIST-AT ?auto_21329 ?auto_21326 ) ( not ( = ?auto_21320 ?auto_21329 ) ) ( not ( = ?auto_21322 ?auto_21329 ) ) ( not ( = ?auto_21330 ?auto_21329 ) ) ( AVAILABLE ?auto_21329 ) ( SURFACE-AT ?auto_21316 ?auto_21326 ) ( ON ?auto_21316 ?auto_21319 ) ( CLEAR ?auto_21316 ) ( not ( = ?auto_21317 ?auto_21319 ) ) ( not ( = ?auto_21318 ?auto_21319 ) ) ( not ( = ?auto_21316 ?auto_21319 ) ) ( not ( = ?auto_21324 ?auto_21319 ) ) ( not ( = ?auto_21328 ?auto_21319 ) ) ( not ( = ?auto_21315 ?auto_21319 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21316 ?auto_21317 ?auto_21318 )
      ( MAKE-3CRATE-VERIFY ?auto_21315 ?auto_21316 ?auto_21317 ?auto_21318 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21331 - SURFACE
      ?auto_21332 - SURFACE
      ?auto_21333 - SURFACE
      ?auto_21334 - SURFACE
      ?auto_21335 - SURFACE
    )
    :vars
    (
      ?auto_21337 - HOIST
      ?auto_21342 - PLACE
      ?auto_21338 - PLACE
      ?auto_21339 - HOIST
      ?auto_21341 - SURFACE
      ?auto_21340 - PLACE
      ?auto_21347 - HOIST
      ?auto_21345 - SURFACE
      ?auto_21344 - TRUCK
      ?auto_21343 - PLACE
      ?auto_21346 - HOIST
      ?auto_21336 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21337 ?auto_21342 ) ( IS-CRATE ?auto_21335 ) ( not ( = ?auto_21334 ?auto_21335 ) ) ( not ( = ?auto_21333 ?auto_21334 ) ) ( not ( = ?auto_21333 ?auto_21335 ) ) ( not ( = ?auto_21338 ?auto_21342 ) ) ( HOIST-AT ?auto_21339 ?auto_21338 ) ( not ( = ?auto_21337 ?auto_21339 ) ) ( AVAILABLE ?auto_21339 ) ( SURFACE-AT ?auto_21335 ?auto_21338 ) ( ON ?auto_21335 ?auto_21341 ) ( CLEAR ?auto_21335 ) ( not ( = ?auto_21334 ?auto_21341 ) ) ( not ( = ?auto_21335 ?auto_21341 ) ) ( not ( = ?auto_21333 ?auto_21341 ) ) ( IS-CRATE ?auto_21334 ) ( not ( = ?auto_21340 ?auto_21342 ) ) ( not ( = ?auto_21338 ?auto_21340 ) ) ( HOIST-AT ?auto_21347 ?auto_21340 ) ( not ( = ?auto_21337 ?auto_21347 ) ) ( not ( = ?auto_21339 ?auto_21347 ) ) ( AVAILABLE ?auto_21347 ) ( SURFACE-AT ?auto_21334 ?auto_21340 ) ( ON ?auto_21334 ?auto_21345 ) ( CLEAR ?auto_21334 ) ( not ( = ?auto_21334 ?auto_21345 ) ) ( not ( = ?auto_21335 ?auto_21345 ) ) ( not ( = ?auto_21333 ?auto_21345 ) ) ( not ( = ?auto_21341 ?auto_21345 ) ) ( SURFACE-AT ?auto_21332 ?auto_21342 ) ( CLEAR ?auto_21332 ) ( IS-CRATE ?auto_21333 ) ( not ( = ?auto_21332 ?auto_21333 ) ) ( not ( = ?auto_21334 ?auto_21332 ) ) ( not ( = ?auto_21335 ?auto_21332 ) ) ( not ( = ?auto_21341 ?auto_21332 ) ) ( not ( = ?auto_21345 ?auto_21332 ) ) ( AVAILABLE ?auto_21337 ) ( TRUCK-AT ?auto_21344 ?auto_21343 ) ( not ( = ?auto_21343 ?auto_21342 ) ) ( not ( = ?auto_21338 ?auto_21343 ) ) ( not ( = ?auto_21340 ?auto_21343 ) ) ( HOIST-AT ?auto_21346 ?auto_21343 ) ( not ( = ?auto_21337 ?auto_21346 ) ) ( not ( = ?auto_21339 ?auto_21346 ) ) ( not ( = ?auto_21347 ?auto_21346 ) ) ( AVAILABLE ?auto_21346 ) ( SURFACE-AT ?auto_21333 ?auto_21343 ) ( ON ?auto_21333 ?auto_21336 ) ( CLEAR ?auto_21333 ) ( not ( = ?auto_21334 ?auto_21336 ) ) ( not ( = ?auto_21335 ?auto_21336 ) ) ( not ( = ?auto_21333 ?auto_21336 ) ) ( not ( = ?auto_21341 ?auto_21336 ) ) ( not ( = ?auto_21345 ?auto_21336 ) ) ( not ( = ?auto_21332 ?auto_21336 ) ) ( ON ?auto_21332 ?auto_21331 ) ( not ( = ?auto_21331 ?auto_21332 ) ) ( not ( = ?auto_21331 ?auto_21333 ) ) ( not ( = ?auto_21331 ?auto_21334 ) ) ( not ( = ?auto_21331 ?auto_21335 ) ) ( not ( = ?auto_21331 ?auto_21341 ) ) ( not ( = ?auto_21331 ?auto_21345 ) ) ( not ( = ?auto_21331 ?auto_21336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21333 ?auto_21334 ?auto_21335 )
      ( MAKE-4CRATE-VERIFY ?auto_21331 ?auto_21332 ?auto_21333 ?auto_21334 ?auto_21335 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21348 - SURFACE
      ?auto_21349 - SURFACE
    )
    :vars
    (
      ?auto_21352 - HOIST
      ?auto_21357 - PLACE
      ?auto_21363 - SURFACE
      ?auto_21353 - PLACE
      ?auto_21354 - HOIST
      ?auto_21356 - SURFACE
      ?auto_21355 - PLACE
      ?auto_21362 - HOIST
      ?auto_21360 - SURFACE
      ?auto_21351 - SURFACE
      ?auto_21358 - PLACE
      ?auto_21361 - HOIST
      ?auto_21350 - SURFACE
      ?auto_21359 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21352 ?auto_21357 ) ( IS-CRATE ?auto_21349 ) ( not ( = ?auto_21348 ?auto_21349 ) ) ( not ( = ?auto_21363 ?auto_21348 ) ) ( not ( = ?auto_21363 ?auto_21349 ) ) ( not ( = ?auto_21353 ?auto_21357 ) ) ( HOIST-AT ?auto_21354 ?auto_21353 ) ( not ( = ?auto_21352 ?auto_21354 ) ) ( AVAILABLE ?auto_21354 ) ( SURFACE-AT ?auto_21349 ?auto_21353 ) ( ON ?auto_21349 ?auto_21356 ) ( CLEAR ?auto_21349 ) ( not ( = ?auto_21348 ?auto_21356 ) ) ( not ( = ?auto_21349 ?auto_21356 ) ) ( not ( = ?auto_21363 ?auto_21356 ) ) ( IS-CRATE ?auto_21348 ) ( not ( = ?auto_21355 ?auto_21357 ) ) ( not ( = ?auto_21353 ?auto_21355 ) ) ( HOIST-AT ?auto_21362 ?auto_21355 ) ( not ( = ?auto_21352 ?auto_21362 ) ) ( not ( = ?auto_21354 ?auto_21362 ) ) ( AVAILABLE ?auto_21362 ) ( SURFACE-AT ?auto_21348 ?auto_21355 ) ( ON ?auto_21348 ?auto_21360 ) ( CLEAR ?auto_21348 ) ( not ( = ?auto_21348 ?auto_21360 ) ) ( not ( = ?auto_21349 ?auto_21360 ) ) ( not ( = ?auto_21363 ?auto_21360 ) ) ( not ( = ?auto_21356 ?auto_21360 ) ) ( SURFACE-AT ?auto_21351 ?auto_21357 ) ( CLEAR ?auto_21351 ) ( IS-CRATE ?auto_21363 ) ( not ( = ?auto_21351 ?auto_21363 ) ) ( not ( = ?auto_21348 ?auto_21351 ) ) ( not ( = ?auto_21349 ?auto_21351 ) ) ( not ( = ?auto_21356 ?auto_21351 ) ) ( not ( = ?auto_21360 ?auto_21351 ) ) ( AVAILABLE ?auto_21352 ) ( not ( = ?auto_21358 ?auto_21357 ) ) ( not ( = ?auto_21353 ?auto_21358 ) ) ( not ( = ?auto_21355 ?auto_21358 ) ) ( HOIST-AT ?auto_21361 ?auto_21358 ) ( not ( = ?auto_21352 ?auto_21361 ) ) ( not ( = ?auto_21354 ?auto_21361 ) ) ( not ( = ?auto_21362 ?auto_21361 ) ) ( AVAILABLE ?auto_21361 ) ( SURFACE-AT ?auto_21363 ?auto_21358 ) ( ON ?auto_21363 ?auto_21350 ) ( CLEAR ?auto_21363 ) ( not ( = ?auto_21348 ?auto_21350 ) ) ( not ( = ?auto_21349 ?auto_21350 ) ) ( not ( = ?auto_21363 ?auto_21350 ) ) ( not ( = ?auto_21356 ?auto_21350 ) ) ( not ( = ?auto_21360 ?auto_21350 ) ) ( not ( = ?auto_21351 ?auto_21350 ) ) ( TRUCK-AT ?auto_21359 ?auto_21357 ) )
    :subtasks
    ( ( !DRIVE ?auto_21359 ?auto_21357 ?auto_21358 )
      ( MAKE-2CRATE ?auto_21363 ?auto_21348 ?auto_21349 )
      ( MAKE-1CRATE-VERIFY ?auto_21348 ?auto_21349 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21364 - SURFACE
      ?auto_21365 - SURFACE
      ?auto_21366 - SURFACE
    )
    :vars
    (
      ?auto_21377 - HOIST
      ?auto_21375 - PLACE
      ?auto_21372 - PLACE
      ?auto_21378 - HOIST
      ?auto_21373 - SURFACE
      ?auto_21369 - PLACE
      ?auto_21374 - HOIST
      ?auto_21370 - SURFACE
      ?auto_21371 - SURFACE
      ?auto_21368 - PLACE
      ?auto_21376 - HOIST
      ?auto_21379 - SURFACE
      ?auto_21367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21377 ?auto_21375 ) ( IS-CRATE ?auto_21366 ) ( not ( = ?auto_21365 ?auto_21366 ) ) ( not ( = ?auto_21364 ?auto_21365 ) ) ( not ( = ?auto_21364 ?auto_21366 ) ) ( not ( = ?auto_21372 ?auto_21375 ) ) ( HOIST-AT ?auto_21378 ?auto_21372 ) ( not ( = ?auto_21377 ?auto_21378 ) ) ( AVAILABLE ?auto_21378 ) ( SURFACE-AT ?auto_21366 ?auto_21372 ) ( ON ?auto_21366 ?auto_21373 ) ( CLEAR ?auto_21366 ) ( not ( = ?auto_21365 ?auto_21373 ) ) ( not ( = ?auto_21366 ?auto_21373 ) ) ( not ( = ?auto_21364 ?auto_21373 ) ) ( IS-CRATE ?auto_21365 ) ( not ( = ?auto_21369 ?auto_21375 ) ) ( not ( = ?auto_21372 ?auto_21369 ) ) ( HOIST-AT ?auto_21374 ?auto_21369 ) ( not ( = ?auto_21377 ?auto_21374 ) ) ( not ( = ?auto_21378 ?auto_21374 ) ) ( AVAILABLE ?auto_21374 ) ( SURFACE-AT ?auto_21365 ?auto_21369 ) ( ON ?auto_21365 ?auto_21370 ) ( CLEAR ?auto_21365 ) ( not ( = ?auto_21365 ?auto_21370 ) ) ( not ( = ?auto_21366 ?auto_21370 ) ) ( not ( = ?auto_21364 ?auto_21370 ) ) ( not ( = ?auto_21373 ?auto_21370 ) ) ( SURFACE-AT ?auto_21371 ?auto_21375 ) ( CLEAR ?auto_21371 ) ( IS-CRATE ?auto_21364 ) ( not ( = ?auto_21371 ?auto_21364 ) ) ( not ( = ?auto_21365 ?auto_21371 ) ) ( not ( = ?auto_21366 ?auto_21371 ) ) ( not ( = ?auto_21373 ?auto_21371 ) ) ( not ( = ?auto_21370 ?auto_21371 ) ) ( AVAILABLE ?auto_21377 ) ( not ( = ?auto_21368 ?auto_21375 ) ) ( not ( = ?auto_21372 ?auto_21368 ) ) ( not ( = ?auto_21369 ?auto_21368 ) ) ( HOIST-AT ?auto_21376 ?auto_21368 ) ( not ( = ?auto_21377 ?auto_21376 ) ) ( not ( = ?auto_21378 ?auto_21376 ) ) ( not ( = ?auto_21374 ?auto_21376 ) ) ( AVAILABLE ?auto_21376 ) ( SURFACE-AT ?auto_21364 ?auto_21368 ) ( ON ?auto_21364 ?auto_21379 ) ( CLEAR ?auto_21364 ) ( not ( = ?auto_21365 ?auto_21379 ) ) ( not ( = ?auto_21366 ?auto_21379 ) ) ( not ( = ?auto_21364 ?auto_21379 ) ) ( not ( = ?auto_21373 ?auto_21379 ) ) ( not ( = ?auto_21370 ?auto_21379 ) ) ( not ( = ?auto_21371 ?auto_21379 ) ) ( TRUCK-AT ?auto_21367 ?auto_21375 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21365 ?auto_21366 )
      ( MAKE-2CRATE-VERIFY ?auto_21364 ?auto_21365 ?auto_21366 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21380 - SURFACE
      ?auto_21381 - SURFACE
      ?auto_21382 - SURFACE
      ?auto_21383 - SURFACE
    )
    :vars
    (
      ?auto_21389 - HOIST
      ?auto_21384 - PLACE
      ?auto_21388 - PLACE
      ?auto_21385 - HOIST
      ?auto_21391 - SURFACE
      ?auto_21390 - PLACE
      ?auto_21395 - HOIST
      ?auto_21386 - SURFACE
      ?auto_21392 - PLACE
      ?auto_21394 - HOIST
      ?auto_21393 - SURFACE
      ?auto_21387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21389 ?auto_21384 ) ( IS-CRATE ?auto_21383 ) ( not ( = ?auto_21382 ?auto_21383 ) ) ( not ( = ?auto_21381 ?auto_21382 ) ) ( not ( = ?auto_21381 ?auto_21383 ) ) ( not ( = ?auto_21388 ?auto_21384 ) ) ( HOIST-AT ?auto_21385 ?auto_21388 ) ( not ( = ?auto_21389 ?auto_21385 ) ) ( AVAILABLE ?auto_21385 ) ( SURFACE-AT ?auto_21383 ?auto_21388 ) ( ON ?auto_21383 ?auto_21391 ) ( CLEAR ?auto_21383 ) ( not ( = ?auto_21382 ?auto_21391 ) ) ( not ( = ?auto_21383 ?auto_21391 ) ) ( not ( = ?auto_21381 ?auto_21391 ) ) ( IS-CRATE ?auto_21382 ) ( not ( = ?auto_21390 ?auto_21384 ) ) ( not ( = ?auto_21388 ?auto_21390 ) ) ( HOIST-AT ?auto_21395 ?auto_21390 ) ( not ( = ?auto_21389 ?auto_21395 ) ) ( not ( = ?auto_21385 ?auto_21395 ) ) ( AVAILABLE ?auto_21395 ) ( SURFACE-AT ?auto_21382 ?auto_21390 ) ( ON ?auto_21382 ?auto_21386 ) ( CLEAR ?auto_21382 ) ( not ( = ?auto_21382 ?auto_21386 ) ) ( not ( = ?auto_21383 ?auto_21386 ) ) ( not ( = ?auto_21381 ?auto_21386 ) ) ( not ( = ?auto_21391 ?auto_21386 ) ) ( SURFACE-AT ?auto_21380 ?auto_21384 ) ( CLEAR ?auto_21380 ) ( IS-CRATE ?auto_21381 ) ( not ( = ?auto_21380 ?auto_21381 ) ) ( not ( = ?auto_21382 ?auto_21380 ) ) ( not ( = ?auto_21383 ?auto_21380 ) ) ( not ( = ?auto_21391 ?auto_21380 ) ) ( not ( = ?auto_21386 ?auto_21380 ) ) ( AVAILABLE ?auto_21389 ) ( not ( = ?auto_21392 ?auto_21384 ) ) ( not ( = ?auto_21388 ?auto_21392 ) ) ( not ( = ?auto_21390 ?auto_21392 ) ) ( HOIST-AT ?auto_21394 ?auto_21392 ) ( not ( = ?auto_21389 ?auto_21394 ) ) ( not ( = ?auto_21385 ?auto_21394 ) ) ( not ( = ?auto_21395 ?auto_21394 ) ) ( AVAILABLE ?auto_21394 ) ( SURFACE-AT ?auto_21381 ?auto_21392 ) ( ON ?auto_21381 ?auto_21393 ) ( CLEAR ?auto_21381 ) ( not ( = ?auto_21382 ?auto_21393 ) ) ( not ( = ?auto_21383 ?auto_21393 ) ) ( not ( = ?auto_21381 ?auto_21393 ) ) ( not ( = ?auto_21391 ?auto_21393 ) ) ( not ( = ?auto_21386 ?auto_21393 ) ) ( not ( = ?auto_21380 ?auto_21393 ) ) ( TRUCK-AT ?auto_21387 ?auto_21384 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21381 ?auto_21382 ?auto_21383 )
      ( MAKE-3CRATE-VERIFY ?auto_21380 ?auto_21381 ?auto_21382 ?auto_21383 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21396 - SURFACE
      ?auto_21397 - SURFACE
      ?auto_21398 - SURFACE
      ?auto_21399 - SURFACE
      ?auto_21400 - SURFACE
    )
    :vars
    (
      ?auto_21406 - HOIST
      ?auto_21401 - PLACE
      ?auto_21405 - PLACE
      ?auto_21402 - HOIST
      ?auto_21408 - SURFACE
      ?auto_21407 - PLACE
      ?auto_21412 - HOIST
      ?auto_21403 - SURFACE
      ?auto_21409 - PLACE
      ?auto_21411 - HOIST
      ?auto_21410 - SURFACE
      ?auto_21404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21406 ?auto_21401 ) ( IS-CRATE ?auto_21400 ) ( not ( = ?auto_21399 ?auto_21400 ) ) ( not ( = ?auto_21398 ?auto_21399 ) ) ( not ( = ?auto_21398 ?auto_21400 ) ) ( not ( = ?auto_21405 ?auto_21401 ) ) ( HOIST-AT ?auto_21402 ?auto_21405 ) ( not ( = ?auto_21406 ?auto_21402 ) ) ( AVAILABLE ?auto_21402 ) ( SURFACE-AT ?auto_21400 ?auto_21405 ) ( ON ?auto_21400 ?auto_21408 ) ( CLEAR ?auto_21400 ) ( not ( = ?auto_21399 ?auto_21408 ) ) ( not ( = ?auto_21400 ?auto_21408 ) ) ( not ( = ?auto_21398 ?auto_21408 ) ) ( IS-CRATE ?auto_21399 ) ( not ( = ?auto_21407 ?auto_21401 ) ) ( not ( = ?auto_21405 ?auto_21407 ) ) ( HOIST-AT ?auto_21412 ?auto_21407 ) ( not ( = ?auto_21406 ?auto_21412 ) ) ( not ( = ?auto_21402 ?auto_21412 ) ) ( AVAILABLE ?auto_21412 ) ( SURFACE-AT ?auto_21399 ?auto_21407 ) ( ON ?auto_21399 ?auto_21403 ) ( CLEAR ?auto_21399 ) ( not ( = ?auto_21399 ?auto_21403 ) ) ( not ( = ?auto_21400 ?auto_21403 ) ) ( not ( = ?auto_21398 ?auto_21403 ) ) ( not ( = ?auto_21408 ?auto_21403 ) ) ( SURFACE-AT ?auto_21397 ?auto_21401 ) ( CLEAR ?auto_21397 ) ( IS-CRATE ?auto_21398 ) ( not ( = ?auto_21397 ?auto_21398 ) ) ( not ( = ?auto_21399 ?auto_21397 ) ) ( not ( = ?auto_21400 ?auto_21397 ) ) ( not ( = ?auto_21408 ?auto_21397 ) ) ( not ( = ?auto_21403 ?auto_21397 ) ) ( AVAILABLE ?auto_21406 ) ( not ( = ?auto_21409 ?auto_21401 ) ) ( not ( = ?auto_21405 ?auto_21409 ) ) ( not ( = ?auto_21407 ?auto_21409 ) ) ( HOIST-AT ?auto_21411 ?auto_21409 ) ( not ( = ?auto_21406 ?auto_21411 ) ) ( not ( = ?auto_21402 ?auto_21411 ) ) ( not ( = ?auto_21412 ?auto_21411 ) ) ( AVAILABLE ?auto_21411 ) ( SURFACE-AT ?auto_21398 ?auto_21409 ) ( ON ?auto_21398 ?auto_21410 ) ( CLEAR ?auto_21398 ) ( not ( = ?auto_21399 ?auto_21410 ) ) ( not ( = ?auto_21400 ?auto_21410 ) ) ( not ( = ?auto_21398 ?auto_21410 ) ) ( not ( = ?auto_21408 ?auto_21410 ) ) ( not ( = ?auto_21403 ?auto_21410 ) ) ( not ( = ?auto_21397 ?auto_21410 ) ) ( TRUCK-AT ?auto_21404 ?auto_21401 ) ( ON ?auto_21397 ?auto_21396 ) ( not ( = ?auto_21396 ?auto_21397 ) ) ( not ( = ?auto_21396 ?auto_21398 ) ) ( not ( = ?auto_21396 ?auto_21399 ) ) ( not ( = ?auto_21396 ?auto_21400 ) ) ( not ( = ?auto_21396 ?auto_21408 ) ) ( not ( = ?auto_21396 ?auto_21403 ) ) ( not ( = ?auto_21396 ?auto_21410 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21398 ?auto_21399 ?auto_21400 )
      ( MAKE-4CRATE-VERIFY ?auto_21396 ?auto_21397 ?auto_21398 ?auto_21399 ?auto_21400 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21413 - SURFACE
      ?auto_21414 - SURFACE
    )
    :vars
    (
      ?auto_21421 - HOIST
      ?auto_21415 - PLACE
      ?auto_21426 - SURFACE
      ?auto_21420 - PLACE
      ?auto_21417 - HOIST
      ?auto_21423 - SURFACE
      ?auto_21422 - PLACE
      ?auto_21428 - HOIST
      ?auto_21418 - SURFACE
      ?auto_21416 - SURFACE
      ?auto_21424 - PLACE
      ?auto_21427 - HOIST
      ?auto_21425 - SURFACE
      ?auto_21419 - TRUCK
      ?auto_21429 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21421 ?auto_21415 ) ( IS-CRATE ?auto_21414 ) ( not ( = ?auto_21413 ?auto_21414 ) ) ( not ( = ?auto_21426 ?auto_21413 ) ) ( not ( = ?auto_21426 ?auto_21414 ) ) ( not ( = ?auto_21420 ?auto_21415 ) ) ( HOIST-AT ?auto_21417 ?auto_21420 ) ( not ( = ?auto_21421 ?auto_21417 ) ) ( AVAILABLE ?auto_21417 ) ( SURFACE-AT ?auto_21414 ?auto_21420 ) ( ON ?auto_21414 ?auto_21423 ) ( CLEAR ?auto_21414 ) ( not ( = ?auto_21413 ?auto_21423 ) ) ( not ( = ?auto_21414 ?auto_21423 ) ) ( not ( = ?auto_21426 ?auto_21423 ) ) ( IS-CRATE ?auto_21413 ) ( not ( = ?auto_21422 ?auto_21415 ) ) ( not ( = ?auto_21420 ?auto_21422 ) ) ( HOIST-AT ?auto_21428 ?auto_21422 ) ( not ( = ?auto_21421 ?auto_21428 ) ) ( not ( = ?auto_21417 ?auto_21428 ) ) ( AVAILABLE ?auto_21428 ) ( SURFACE-AT ?auto_21413 ?auto_21422 ) ( ON ?auto_21413 ?auto_21418 ) ( CLEAR ?auto_21413 ) ( not ( = ?auto_21413 ?auto_21418 ) ) ( not ( = ?auto_21414 ?auto_21418 ) ) ( not ( = ?auto_21426 ?auto_21418 ) ) ( not ( = ?auto_21423 ?auto_21418 ) ) ( IS-CRATE ?auto_21426 ) ( not ( = ?auto_21416 ?auto_21426 ) ) ( not ( = ?auto_21413 ?auto_21416 ) ) ( not ( = ?auto_21414 ?auto_21416 ) ) ( not ( = ?auto_21423 ?auto_21416 ) ) ( not ( = ?auto_21418 ?auto_21416 ) ) ( not ( = ?auto_21424 ?auto_21415 ) ) ( not ( = ?auto_21420 ?auto_21424 ) ) ( not ( = ?auto_21422 ?auto_21424 ) ) ( HOIST-AT ?auto_21427 ?auto_21424 ) ( not ( = ?auto_21421 ?auto_21427 ) ) ( not ( = ?auto_21417 ?auto_21427 ) ) ( not ( = ?auto_21428 ?auto_21427 ) ) ( AVAILABLE ?auto_21427 ) ( SURFACE-AT ?auto_21426 ?auto_21424 ) ( ON ?auto_21426 ?auto_21425 ) ( CLEAR ?auto_21426 ) ( not ( = ?auto_21413 ?auto_21425 ) ) ( not ( = ?auto_21414 ?auto_21425 ) ) ( not ( = ?auto_21426 ?auto_21425 ) ) ( not ( = ?auto_21423 ?auto_21425 ) ) ( not ( = ?auto_21418 ?auto_21425 ) ) ( not ( = ?auto_21416 ?auto_21425 ) ) ( TRUCK-AT ?auto_21419 ?auto_21415 ) ( SURFACE-AT ?auto_21429 ?auto_21415 ) ( CLEAR ?auto_21429 ) ( LIFTING ?auto_21421 ?auto_21416 ) ( IS-CRATE ?auto_21416 ) ( not ( = ?auto_21429 ?auto_21416 ) ) ( not ( = ?auto_21413 ?auto_21429 ) ) ( not ( = ?auto_21414 ?auto_21429 ) ) ( not ( = ?auto_21426 ?auto_21429 ) ) ( not ( = ?auto_21423 ?auto_21429 ) ) ( not ( = ?auto_21418 ?auto_21429 ) ) ( not ( = ?auto_21425 ?auto_21429 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21429 ?auto_21416 )
      ( MAKE-2CRATE ?auto_21426 ?auto_21413 ?auto_21414 )
      ( MAKE-1CRATE-VERIFY ?auto_21413 ?auto_21414 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21430 - SURFACE
      ?auto_21431 - SURFACE
      ?auto_21432 - SURFACE
    )
    :vars
    (
      ?auto_21439 - HOIST
      ?auto_21433 - PLACE
      ?auto_21438 - PLACE
      ?auto_21435 - HOIST
      ?auto_21440 - SURFACE
      ?auto_21434 - PLACE
      ?auto_21437 - HOIST
      ?auto_21436 - SURFACE
      ?auto_21446 - SURFACE
      ?auto_21443 - PLACE
      ?auto_21445 - HOIST
      ?auto_21441 - SURFACE
      ?auto_21444 - TRUCK
      ?auto_21442 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21439 ?auto_21433 ) ( IS-CRATE ?auto_21432 ) ( not ( = ?auto_21431 ?auto_21432 ) ) ( not ( = ?auto_21430 ?auto_21431 ) ) ( not ( = ?auto_21430 ?auto_21432 ) ) ( not ( = ?auto_21438 ?auto_21433 ) ) ( HOIST-AT ?auto_21435 ?auto_21438 ) ( not ( = ?auto_21439 ?auto_21435 ) ) ( AVAILABLE ?auto_21435 ) ( SURFACE-AT ?auto_21432 ?auto_21438 ) ( ON ?auto_21432 ?auto_21440 ) ( CLEAR ?auto_21432 ) ( not ( = ?auto_21431 ?auto_21440 ) ) ( not ( = ?auto_21432 ?auto_21440 ) ) ( not ( = ?auto_21430 ?auto_21440 ) ) ( IS-CRATE ?auto_21431 ) ( not ( = ?auto_21434 ?auto_21433 ) ) ( not ( = ?auto_21438 ?auto_21434 ) ) ( HOIST-AT ?auto_21437 ?auto_21434 ) ( not ( = ?auto_21439 ?auto_21437 ) ) ( not ( = ?auto_21435 ?auto_21437 ) ) ( AVAILABLE ?auto_21437 ) ( SURFACE-AT ?auto_21431 ?auto_21434 ) ( ON ?auto_21431 ?auto_21436 ) ( CLEAR ?auto_21431 ) ( not ( = ?auto_21431 ?auto_21436 ) ) ( not ( = ?auto_21432 ?auto_21436 ) ) ( not ( = ?auto_21430 ?auto_21436 ) ) ( not ( = ?auto_21440 ?auto_21436 ) ) ( IS-CRATE ?auto_21430 ) ( not ( = ?auto_21446 ?auto_21430 ) ) ( not ( = ?auto_21431 ?auto_21446 ) ) ( not ( = ?auto_21432 ?auto_21446 ) ) ( not ( = ?auto_21440 ?auto_21446 ) ) ( not ( = ?auto_21436 ?auto_21446 ) ) ( not ( = ?auto_21443 ?auto_21433 ) ) ( not ( = ?auto_21438 ?auto_21443 ) ) ( not ( = ?auto_21434 ?auto_21443 ) ) ( HOIST-AT ?auto_21445 ?auto_21443 ) ( not ( = ?auto_21439 ?auto_21445 ) ) ( not ( = ?auto_21435 ?auto_21445 ) ) ( not ( = ?auto_21437 ?auto_21445 ) ) ( AVAILABLE ?auto_21445 ) ( SURFACE-AT ?auto_21430 ?auto_21443 ) ( ON ?auto_21430 ?auto_21441 ) ( CLEAR ?auto_21430 ) ( not ( = ?auto_21431 ?auto_21441 ) ) ( not ( = ?auto_21432 ?auto_21441 ) ) ( not ( = ?auto_21430 ?auto_21441 ) ) ( not ( = ?auto_21440 ?auto_21441 ) ) ( not ( = ?auto_21436 ?auto_21441 ) ) ( not ( = ?auto_21446 ?auto_21441 ) ) ( TRUCK-AT ?auto_21444 ?auto_21433 ) ( SURFACE-AT ?auto_21442 ?auto_21433 ) ( CLEAR ?auto_21442 ) ( LIFTING ?auto_21439 ?auto_21446 ) ( IS-CRATE ?auto_21446 ) ( not ( = ?auto_21442 ?auto_21446 ) ) ( not ( = ?auto_21431 ?auto_21442 ) ) ( not ( = ?auto_21432 ?auto_21442 ) ) ( not ( = ?auto_21430 ?auto_21442 ) ) ( not ( = ?auto_21440 ?auto_21442 ) ) ( not ( = ?auto_21436 ?auto_21442 ) ) ( not ( = ?auto_21441 ?auto_21442 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21431 ?auto_21432 )
      ( MAKE-2CRATE-VERIFY ?auto_21430 ?auto_21431 ?auto_21432 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21447 - SURFACE
      ?auto_21448 - SURFACE
      ?auto_21449 - SURFACE
      ?auto_21450 - SURFACE
    )
    :vars
    (
      ?auto_21458 - HOIST
      ?auto_21461 - PLACE
      ?auto_21456 - PLACE
      ?auto_21463 - HOIST
      ?auto_21452 - SURFACE
      ?auto_21459 - PLACE
      ?auto_21462 - HOIST
      ?auto_21453 - SURFACE
      ?auto_21455 - PLACE
      ?auto_21454 - HOIST
      ?auto_21460 - SURFACE
      ?auto_21451 - TRUCK
      ?auto_21457 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21458 ?auto_21461 ) ( IS-CRATE ?auto_21450 ) ( not ( = ?auto_21449 ?auto_21450 ) ) ( not ( = ?auto_21448 ?auto_21449 ) ) ( not ( = ?auto_21448 ?auto_21450 ) ) ( not ( = ?auto_21456 ?auto_21461 ) ) ( HOIST-AT ?auto_21463 ?auto_21456 ) ( not ( = ?auto_21458 ?auto_21463 ) ) ( AVAILABLE ?auto_21463 ) ( SURFACE-AT ?auto_21450 ?auto_21456 ) ( ON ?auto_21450 ?auto_21452 ) ( CLEAR ?auto_21450 ) ( not ( = ?auto_21449 ?auto_21452 ) ) ( not ( = ?auto_21450 ?auto_21452 ) ) ( not ( = ?auto_21448 ?auto_21452 ) ) ( IS-CRATE ?auto_21449 ) ( not ( = ?auto_21459 ?auto_21461 ) ) ( not ( = ?auto_21456 ?auto_21459 ) ) ( HOIST-AT ?auto_21462 ?auto_21459 ) ( not ( = ?auto_21458 ?auto_21462 ) ) ( not ( = ?auto_21463 ?auto_21462 ) ) ( AVAILABLE ?auto_21462 ) ( SURFACE-AT ?auto_21449 ?auto_21459 ) ( ON ?auto_21449 ?auto_21453 ) ( CLEAR ?auto_21449 ) ( not ( = ?auto_21449 ?auto_21453 ) ) ( not ( = ?auto_21450 ?auto_21453 ) ) ( not ( = ?auto_21448 ?auto_21453 ) ) ( not ( = ?auto_21452 ?auto_21453 ) ) ( IS-CRATE ?auto_21448 ) ( not ( = ?auto_21447 ?auto_21448 ) ) ( not ( = ?auto_21449 ?auto_21447 ) ) ( not ( = ?auto_21450 ?auto_21447 ) ) ( not ( = ?auto_21452 ?auto_21447 ) ) ( not ( = ?auto_21453 ?auto_21447 ) ) ( not ( = ?auto_21455 ?auto_21461 ) ) ( not ( = ?auto_21456 ?auto_21455 ) ) ( not ( = ?auto_21459 ?auto_21455 ) ) ( HOIST-AT ?auto_21454 ?auto_21455 ) ( not ( = ?auto_21458 ?auto_21454 ) ) ( not ( = ?auto_21463 ?auto_21454 ) ) ( not ( = ?auto_21462 ?auto_21454 ) ) ( AVAILABLE ?auto_21454 ) ( SURFACE-AT ?auto_21448 ?auto_21455 ) ( ON ?auto_21448 ?auto_21460 ) ( CLEAR ?auto_21448 ) ( not ( = ?auto_21449 ?auto_21460 ) ) ( not ( = ?auto_21450 ?auto_21460 ) ) ( not ( = ?auto_21448 ?auto_21460 ) ) ( not ( = ?auto_21452 ?auto_21460 ) ) ( not ( = ?auto_21453 ?auto_21460 ) ) ( not ( = ?auto_21447 ?auto_21460 ) ) ( TRUCK-AT ?auto_21451 ?auto_21461 ) ( SURFACE-AT ?auto_21457 ?auto_21461 ) ( CLEAR ?auto_21457 ) ( LIFTING ?auto_21458 ?auto_21447 ) ( IS-CRATE ?auto_21447 ) ( not ( = ?auto_21457 ?auto_21447 ) ) ( not ( = ?auto_21449 ?auto_21457 ) ) ( not ( = ?auto_21450 ?auto_21457 ) ) ( not ( = ?auto_21448 ?auto_21457 ) ) ( not ( = ?auto_21452 ?auto_21457 ) ) ( not ( = ?auto_21453 ?auto_21457 ) ) ( not ( = ?auto_21460 ?auto_21457 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21448 ?auto_21449 ?auto_21450 )
      ( MAKE-3CRATE-VERIFY ?auto_21447 ?auto_21448 ?auto_21449 ?auto_21450 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21464 - SURFACE
      ?auto_21465 - SURFACE
      ?auto_21466 - SURFACE
      ?auto_21467 - SURFACE
      ?auto_21468 - SURFACE
    )
    :vars
    (
      ?auto_21475 - HOIST
      ?auto_21478 - PLACE
      ?auto_21474 - PLACE
      ?auto_21480 - HOIST
      ?auto_21470 - SURFACE
      ?auto_21476 - PLACE
      ?auto_21479 - HOIST
      ?auto_21471 - SURFACE
      ?auto_21473 - PLACE
      ?auto_21472 - HOIST
      ?auto_21477 - SURFACE
      ?auto_21469 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21475 ?auto_21478 ) ( IS-CRATE ?auto_21468 ) ( not ( = ?auto_21467 ?auto_21468 ) ) ( not ( = ?auto_21466 ?auto_21467 ) ) ( not ( = ?auto_21466 ?auto_21468 ) ) ( not ( = ?auto_21474 ?auto_21478 ) ) ( HOIST-AT ?auto_21480 ?auto_21474 ) ( not ( = ?auto_21475 ?auto_21480 ) ) ( AVAILABLE ?auto_21480 ) ( SURFACE-AT ?auto_21468 ?auto_21474 ) ( ON ?auto_21468 ?auto_21470 ) ( CLEAR ?auto_21468 ) ( not ( = ?auto_21467 ?auto_21470 ) ) ( not ( = ?auto_21468 ?auto_21470 ) ) ( not ( = ?auto_21466 ?auto_21470 ) ) ( IS-CRATE ?auto_21467 ) ( not ( = ?auto_21476 ?auto_21478 ) ) ( not ( = ?auto_21474 ?auto_21476 ) ) ( HOIST-AT ?auto_21479 ?auto_21476 ) ( not ( = ?auto_21475 ?auto_21479 ) ) ( not ( = ?auto_21480 ?auto_21479 ) ) ( AVAILABLE ?auto_21479 ) ( SURFACE-AT ?auto_21467 ?auto_21476 ) ( ON ?auto_21467 ?auto_21471 ) ( CLEAR ?auto_21467 ) ( not ( = ?auto_21467 ?auto_21471 ) ) ( not ( = ?auto_21468 ?auto_21471 ) ) ( not ( = ?auto_21466 ?auto_21471 ) ) ( not ( = ?auto_21470 ?auto_21471 ) ) ( IS-CRATE ?auto_21466 ) ( not ( = ?auto_21465 ?auto_21466 ) ) ( not ( = ?auto_21467 ?auto_21465 ) ) ( not ( = ?auto_21468 ?auto_21465 ) ) ( not ( = ?auto_21470 ?auto_21465 ) ) ( not ( = ?auto_21471 ?auto_21465 ) ) ( not ( = ?auto_21473 ?auto_21478 ) ) ( not ( = ?auto_21474 ?auto_21473 ) ) ( not ( = ?auto_21476 ?auto_21473 ) ) ( HOIST-AT ?auto_21472 ?auto_21473 ) ( not ( = ?auto_21475 ?auto_21472 ) ) ( not ( = ?auto_21480 ?auto_21472 ) ) ( not ( = ?auto_21479 ?auto_21472 ) ) ( AVAILABLE ?auto_21472 ) ( SURFACE-AT ?auto_21466 ?auto_21473 ) ( ON ?auto_21466 ?auto_21477 ) ( CLEAR ?auto_21466 ) ( not ( = ?auto_21467 ?auto_21477 ) ) ( not ( = ?auto_21468 ?auto_21477 ) ) ( not ( = ?auto_21466 ?auto_21477 ) ) ( not ( = ?auto_21470 ?auto_21477 ) ) ( not ( = ?auto_21471 ?auto_21477 ) ) ( not ( = ?auto_21465 ?auto_21477 ) ) ( TRUCK-AT ?auto_21469 ?auto_21478 ) ( SURFACE-AT ?auto_21464 ?auto_21478 ) ( CLEAR ?auto_21464 ) ( LIFTING ?auto_21475 ?auto_21465 ) ( IS-CRATE ?auto_21465 ) ( not ( = ?auto_21464 ?auto_21465 ) ) ( not ( = ?auto_21467 ?auto_21464 ) ) ( not ( = ?auto_21468 ?auto_21464 ) ) ( not ( = ?auto_21466 ?auto_21464 ) ) ( not ( = ?auto_21470 ?auto_21464 ) ) ( not ( = ?auto_21471 ?auto_21464 ) ) ( not ( = ?auto_21477 ?auto_21464 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21466 ?auto_21467 ?auto_21468 )
      ( MAKE-4CRATE-VERIFY ?auto_21464 ?auto_21465 ?auto_21466 ?auto_21467 ?auto_21468 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21481 - SURFACE
      ?auto_21482 - SURFACE
    )
    :vars
    (
      ?auto_21490 - HOIST
      ?auto_21495 - PLACE
      ?auto_21491 - SURFACE
      ?auto_21488 - PLACE
      ?auto_21497 - HOIST
      ?auto_21484 - SURFACE
      ?auto_21492 - PLACE
      ?auto_21496 - HOIST
      ?auto_21485 - SURFACE
      ?auto_21493 - SURFACE
      ?auto_21487 - PLACE
      ?auto_21486 - HOIST
      ?auto_21494 - SURFACE
      ?auto_21483 - TRUCK
      ?auto_21489 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21490 ?auto_21495 ) ( IS-CRATE ?auto_21482 ) ( not ( = ?auto_21481 ?auto_21482 ) ) ( not ( = ?auto_21491 ?auto_21481 ) ) ( not ( = ?auto_21491 ?auto_21482 ) ) ( not ( = ?auto_21488 ?auto_21495 ) ) ( HOIST-AT ?auto_21497 ?auto_21488 ) ( not ( = ?auto_21490 ?auto_21497 ) ) ( AVAILABLE ?auto_21497 ) ( SURFACE-AT ?auto_21482 ?auto_21488 ) ( ON ?auto_21482 ?auto_21484 ) ( CLEAR ?auto_21482 ) ( not ( = ?auto_21481 ?auto_21484 ) ) ( not ( = ?auto_21482 ?auto_21484 ) ) ( not ( = ?auto_21491 ?auto_21484 ) ) ( IS-CRATE ?auto_21481 ) ( not ( = ?auto_21492 ?auto_21495 ) ) ( not ( = ?auto_21488 ?auto_21492 ) ) ( HOIST-AT ?auto_21496 ?auto_21492 ) ( not ( = ?auto_21490 ?auto_21496 ) ) ( not ( = ?auto_21497 ?auto_21496 ) ) ( AVAILABLE ?auto_21496 ) ( SURFACE-AT ?auto_21481 ?auto_21492 ) ( ON ?auto_21481 ?auto_21485 ) ( CLEAR ?auto_21481 ) ( not ( = ?auto_21481 ?auto_21485 ) ) ( not ( = ?auto_21482 ?auto_21485 ) ) ( not ( = ?auto_21491 ?auto_21485 ) ) ( not ( = ?auto_21484 ?auto_21485 ) ) ( IS-CRATE ?auto_21491 ) ( not ( = ?auto_21493 ?auto_21491 ) ) ( not ( = ?auto_21481 ?auto_21493 ) ) ( not ( = ?auto_21482 ?auto_21493 ) ) ( not ( = ?auto_21484 ?auto_21493 ) ) ( not ( = ?auto_21485 ?auto_21493 ) ) ( not ( = ?auto_21487 ?auto_21495 ) ) ( not ( = ?auto_21488 ?auto_21487 ) ) ( not ( = ?auto_21492 ?auto_21487 ) ) ( HOIST-AT ?auto_21486 ?auto_21487 ) ( not ( = ?auto_21490 ?auto_21486 ) ) ( not ( = ?auto_21497 ?auto_21486 ) ) ( not ( = ?auto_21496 ?auto_21486 ) ) ( AVAILABLE ?auto_21486 ) ( SURFACE-AT ?auto_21491 ?auto_21487 ) ( ON ?auto_21491 ?auto_21494 ) ( CLEAR ?auto_21491 ) ( not ( = ?auto_21481 ?auto_21494 ) ) ( not ( = ?auto_21482 ?auto_21494 ) ) ( not ( = ?auto_21491 ?auto_21494 ) ) ( not ( = ?auto_21484 ?auto_21494 ) ) ( not ( = ?auto_21485 ?auto_21494 ) ) ( not ( = ?auto_21493 ?auto_21494 ) ) ( TRUCK-AT ?auto_21483 ?auto_21495 ) ( SURFACE-AT ?auto_21489 ?auto_21495 ) ( CLEAR ?auto_21489 ) ( IS-CRATE ?auto_21493 ) ( not ( = ?auto_21489 ?auto_21493 ) ) ( not ( = ?auto_21481 ?auto_21489 ) ) ( not ( = ?auto_21482 ?auto_21489 ) ) ( not ( = ?auto_21491 ?auto_21489 ) ) ( not ( = ?auto_21484 ?auto_21489 ) ) ( not ( = ?auto_21485 ?auto_21489 ) ) ( not ( = ?auto_21494 ?auto_21489 ) ) ( AVAILABLE ?auto_21490 ) ( IN ?auto_21493 ?auto_21483 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21490 ?auto_21493 ?auto_21483 ?auto_21495 )
      ( MAKE-2CRATE ?auto_21491 ?auto_21481 ?auto_21482 )
      ( MAKE-1CRATE-VERIFY ?auto_21481 ?auto_21482 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21498 - SURFACE
      ?auto_21499 - SURFACE
      ?auto_21500 - SURFACE
    )
    :vars
    (
      ?auto_21501 - HOIST
      ?auto_21513 - PLACE
      ?auto_21506 - PLACE
      ?auto_21505 - HOIST
      ?auto_21511 - SURFACE
      ?auto_21514 - PLACE
      ?auto_21503 - HOIST
      ?auto_21502 - SURFACE
      ?auto_21504 - SURFACE
      ?auto_21508 - PLACE
      ?auto_21512 - HOIST
      ?auto_21510 - SURFACE
      ?auto_21507 - TRUCK
      ?auto_21509 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21501 ?auto_21513 ) ( IS-CRATE ?auto_21500 ) ( not ( = ?auto_21499 ?auto_21500 ) ) ( not ( = ?auto_21498 ?auto_21499 ) ) ( not ( = ?auto_21498 ?auto_21500 ) ) ( not ( = ?auto_21506 ?auto_21513 ) ) ( HOIST-AT ?auto_21505 ?auto_21506 ) ( not ( = ?auto_21501 ?auto_21505 ) ) ( AVAILABLE ?auto_21505 ) ( SURFACE-AT ?auto_21500 ?auto_21506 ) ( ON ?auto_21500 ?auto_21511 ) ( CLEAR ?auto_21500 ) ( not ( = ?auto_21499 ?auto_21511 ) ) ( not ( = ?auto_21500 ?auto_21511 ) ) ( not ( = ?auto_21498 ?auto_21511 ) ) ( IS-CRATE ?auto_21499 ) ( not ( = ?auto_21514 ?auto_21513 ) ) ( not ( = ?auto_21506 ?auto_21514 ) ) ( HOIST-AT ?auto_21503 ?auto_21514 ) ( not ( = ?auto_21501 ?auto_21503 ) ) ( not ( = ?auto_21505 ?auto_21503 ) ) ( AVAILABLE ?auto_21503 ) ( SURFACE-AT ?auto_21499 ?auto_21514 ) ( ON ?auto_21499 ?auto_21502 ) ( CLEAR ?auto_21499 ) ( not ( = ?auto_21499 ?auto_21502 ) ) ( not ( = ?auto_21500 ?auto_21502 ) ) ( not ( = ?auto_21498 ?auto_21502 ) ) ( not ( = ?auto_21511 ?auto_21502 ) ) ( IS-CRATE ?auto_21498 ) ( not ( = ?auto_21504 ?auto_21498 ) ) ( not ( = ?auto_21499 ?auto_21504 ) ) ( not ( = ?auto_21500 ?auto_21504 ) ) ( not ( = ?auto_21511 ?auto_21504 ) ) ( not ( = ?auto_21502 ?auto_21504 ) ) ( not ( = ?auto_21508 ?auto_21513 ) ) ( not ( = ?auto_21506 ?auto_21508 ) ) ( not ( = ?auto_21514 ?auto_21508 ) ) ( HOIST-AT ?auto_21512 ?auto_21508 ) ( not ( = ?auto_21501 ?auto_21512 ) ) ( not ( = ?auto_21505 ?auto_21512 ) ) ( not ( = ?auto_21503 ?auto_21512 ) ) ( AVAILABLE ?auto_21512 ) ( SURFACE-AT ?auto_21498 ?auto_21508 ) ( ON ?auto_21498 ?auto_21510 ) ( CLEAR ?auto_21498 ) ( not ( = ?auto_21499 ?auto_21510 ) ) ( not ( = ?auto_21500 ?auto_21510 ) ) ( not ( = ?auto_21498 ?auto_21510 ) ) ( not ( = ?auto_21511 ?auto_21510 ) ) ( not ( = ?auto_21502 ?auto_21510 ) ) ( not ( = ?auto_21504 ?auto_21510 ) ) ( TRUCK-AT ?auto_21507 ?auto_21513 ) ( SURFACE-AT ?auto_21509 ?auto_21513 ) ( CLEAR ?auto_21509 ) ( IS-CRATE ?auto_21504 ) ( not ( = ?auto_21509 ?auto_21504 ) ) ( not ( = ?auto_21499 ?auto_21509 ) ) ( not ( = ?auto_21500 ?auto_21509 ) ) ( not ( = ?auto_21498 ?auto_21509 ) ) ( not ( = ?auto_21511 ?auto_21509 ) ) ( not ( = ?auto_21502 ?auto_21509 ) ) ( not ( = ?auto_21510 ?auto_21509 ) ) ( AVAILABLE ?auto_21501 ) ( IN ?auto_21504 ?auto_21507 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21499 ?auto_21500 )
      ( MAKE-2CRATE-VERIFY ?auto_21498 ?auto_21499 ?auto_21500 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21515 - SURFACE
      ?auto_21516 - SURFACE
      ?auto_21517 - SURFACE
      ?auto_21518 - SURFACE
    )
    :vars
    (
      ?auto_21521 - HOIST
      ?auto_21524 - PLACE
      ?auto_21531 - PLACE
      ?auto_21530 - HOIST
      ?auto_21522 - SURFACE
      ?auto_21523 - PLACE
      ?auto_21528 - HOIST
      ?auto_21520 - SURFACE
      ?auto_21529 - PLACE
      ?auto_21525 - HOIST
      ?auto_21519 - SURFACE
      ?auto_21526 - TRUCK
      ?auto_21527 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21521 ?auto_21524 ) ( IS-CRATE ?auto_21518 ) ( not ( = ?auto_21517 ?auto_21518 ) ) ( not ( = ?auto_21516 ?auto_21517 ) ) ( not ( = ?auto_21516 ?auto_21518 ) ) ( not ( = ?auto_21531 ?auto_21524 ) ) ( HOIST-AT ?auto_21530 ?auto_21531 ) ( not ( = ?auto_21521 ?auto_21530 ) ) ( AVAILABLE ?auto_21530 ) ( SURFACE-AT ?auto_21518 ?auto_21531 ) ( ON ?auto_21518 ?auto_21522 ) ( CLEAR ?auto_21518 ) ( not ( = ?auto_21517 ?auto_21522 ) ) ( not ( = ?auto_21518 ?auto_21522 ) ) ( not ( = ?auto_21516 ?auto_21522 ) ) ( IS-CRATE ?auto_21517 ) ( not ( = ?auto_21523 ?auto_21524 ) ) ( not ( = ?auto_21531 ?auto_21523 ) ) ( HOIST-AT ?auto_21528 ?auto_21523 ) ( not ( = ?auto_21521 ?auto_21528 ) ) ( not ( = ?auto_21530 ?auto_21528 ) ) ( AVAILABLE ?auto_21528 ) ( SURFACE-AT ?auto_21517 ?auto_21523 ) ( ON ?auto_21517 ?auto_21520 ) ( CLEAR ?auto_21517 ) ( not ( = ?auto_21517 ?auto_21520 ) ) ( not ( = ?auto_21518 ?auto_21520 ) ) ( not ( = ?auto_21516 ?auto_21520 ) ) ( not ( = ?auto_21522 ?auto_21520 ) ) ( IS-CRATE ?auto_21516 ) ( not ( = ?auto_21515 ?auto_21516 ) ) ( not ( = ?auto_21517 ?auto_21515 ) ) ( not ( = ?auto_21518 ?auto_21515 ) ) ( not ( = ?auto_21522 ?auto_21515 ) ) ( not ( = ?auto_21520 ?auto_21515 ) ) ( not ( = ?auto_21529 ?auto_21524 ) ) ( not ( = ?auto_21531 ?auto_21529 ) ) ( not ( = ?auto_21523 ?auto_21529 ) ) ( HOIST-AT ?auto_21525 ?auto_21529 ) ( not ( = ?auto_21521 ?auto_21525 ) ) ( not ( = ?auto_21530 ?auto_21525 ) ) ( not ( = ?auto_21528 ?auto_21525 ) ) ( AVAILABLE ?auto_21525 ) ( SURFACE-AT ?auto_21516 ?auto_21529 ) ( ON ?auto_21516 ?auto_21519 ) ( CLEAR ?auto_21516 ) ( not ( = ?auto_21517 ?auto_21519 ) ) ( not ( = ?auto_21518 ?auto_21519 ) ) ( not ( = ?auto_21516 ?auto_21519 ) ) ( not ( = ?auto_21522 ?auto_21519 ) ) ( not ( = ?auto_21520 ?auto_21519 ) ) ( not ( = ?auto_21515 ?auto_21519 ) ) ( TRUCK-AT ?auto_21526 ?auto_21524 ) ( SURFACE-AT ?auto_21527 ?auto_21524 ) ( CLEAR ?auto_21527 ) ( IS-CRATE ?auto_21515 ) ( not ( = ?auto_21527 ?auto_21515 ) ) ( not ( = ?auto_21517 ?auto_21527 ) ) ( not ( = ?auto_21518 ?auto_21527 ) ) ( not ( = ?auto_21516 ?auto_21527 ) ) ( not ( = ?auto_21522 ?auto_21527 ) ) ( not ( = ?auto_21520 ?auto_21527 ) ) ( not ( = ?auto_21519 ?auto_21527 ) ) ( AVAILABLE ?auto_21521 ) ( IN ?auto_21515 ?auto_21526 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21516 ?auto_21517 ?auto_21518 )
      ( MAKE-3CRATE-VERIFY ?auto_21515 ?auto_21516 ?auto_21517 ?auto_21518 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21532 - SURFACE
      ?auto_21533 - SURFACE
      ?auto_21534 - SURFACE
      ?auto_21535 - SURFACE
      ?auto_21536 - SURFACE
    )
    :vars
    (
      ?auto_21539 - HOIST
      ?auto_21542 - PLACE
      ?auto_21548 - PLACE
      ?auto_21547 - HOIST
      ?auto_21540 - SURFACE
      ?auto_21541 - PLACE
      ?auto_21545 - HOIST
      ?auto_21538 - SURFACE
      ?auto_21546 - PLACE
      ?auto_21543 - HOIST
      ?auto_21537 - SURFACE
      ?auto_21544 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21539 ?auto_21542 ) ( IS-CRATE ?auto_21536 ) ( not ( = ?auto_21535 ?auto_21536 ) ) ( not ( = ?auto_21534 ?auto_21535 ) ) ( not ( = ?auto_21534 ?auto_21536 ) ) ( not ( = ?auto_21548 ?auto_21542 ) ) ( HOIST-AT ?auto_21547 ?auto_21548 ) ( not ( = ?auto_21539 ?auto_21547 ) ) ( AVAILABLE ?auto_21547 ) ( SURFACE-AT ?auto_21536 ?auto_21548 ) ( ON ?auto_21536 ?auto_21540 ) ( CLEAR ?auto_21536 ) ( not ( = ?auto_21535 ?auto_21540 ) ) ( not ( = ?auto_21536 ?auto_21540 ) ) ( not ( = ?auto_21534 ?auto_21540 ) ) ( IS-CRATE ?auto_21535 ) ( not ( = ?auto_21541 ?auto_21542 ) ) ( not ( = ?auto_21548 ?auto_21541 ) ) ( HOIST-AT ?auto_21545 ?auto_21541 ) ( not ( = ?auto_21539 ?auto_21545 ) ) ( not ( = ?auto_21547 ?auto_21545 ) ) ( AVAILABLE ?auto_21545 ) ( SURFACE-AT ?auto_21535 ?auto_21541 ) ( ON ?auto_21535 ?auto_21538 ) ( CLEAR ?auto_21535 ) ( not ( = ?auto_21535 ?auto_21538 ) ) ( not ( = ?auto_21536 ?auto_21538 ) ) ( not ( = ?auto_21534 ?auto_21538 ) ) ( not ( = ?auto_21540 ?auto_21538 ) ) ( IS-CRATE ?auto_21534 ) ( not ( = ?auto_21533 ?auto_21534 ) ) ( not ( = ?auto_21535 ?auto_21533 ) ) ( not ( = ?auto_21536 ?auto_21533 ) ) ( not ( = ?auto_21540 ?auto_21533 ) ) ( not ( = ?auto_21538 ?auto_21533 ) ) ( not ( = ?auto_21546 ?auto_21542 ) ) ( not ( = ?auto_21548 ?auto_21546 ) ) ( not ( = ?auto_21541 ?auto_21546 ) ) ( HOIST-AT ?auto_21543 ?auto_21546 ) ( not ( = ?auto_21539 ?auto_21543 ) ) ( not ( = ?auto_21547 ?auto_21543 ) ) ( not ( = ?auto_21545 ?auto_21543 ) ) ( AVAILABLE ?auto_21543 ) ( SURFACE-AT ?auto_21534 ?auto_21546 ) ( ON ?auto_21534 ?auto_21537 ) ( CLEAR ?auto_21534 ) ( not ( = ?auto_21535 ?auto_21537 ) ) ( not ( = ?auto_21536 ?auto_21537 ) ) ( not ( = ?auto_21534 ?auto_21537 ) ) ( not ( = ?auto_21540 ?auto_21537 ) ) ( not ( = ?auto_21538 ?auto_21537 ) ) ( not ( = ?auto_21533 ?auto_21537 ) ) ( TRUCK-AT ?auto_21544 ?auto_21542 ) ( SURFACE-AT ?auto_21532 ?auto_21542 ) ( CLEAR ?auto_21532 ) ( IS-CRATE ?auto_21533 ) ( not ( = ?auto_21532 ?auto_21533 ) ) ( not ( = ?auto_21535 ?auto_21532 ) ) ( not ( = ?auto_21536 ?auto_21532 ) ) ( not ( = ?auto_21534 ?auto_21532 ) ) ( not ( = ?auto_21540 ?auto_21532 ) ) ( not ( = ?auto_21538 ?auto_21532 ) ) ( not ( = ?auto_21537 ?auto_21532 ) ) ( AVAILABLE ?auto_21539 ) ( IN ?auto_21533 ?auto_21544 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21534 ?auto_21535 ?auto_21536 )
      ( MAKE-4CRATE-VERIFY ?auto_21532 ?auto_21533 ?auto_21534 ?auto_21535 ?auto_21536 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21549 - SURFACE
      ?auto_21550 - SURFACE
    )
    :vars
    (
      ?auto_21553 - HOIST
      ?auto_21556 - PLACE
      ?auto_21560 - SURFACE
      ?auto_21565 - PLACE
      ?auto_21564 - HOIST
      ?auto_21554 - SURFACE
      ?auto_21555 - PLACE
      ?auto_21561 - HOIST
      ?auto_21552 - SURFACE
      ?auto_21563 - SURFACE
      ?auto_21562 - PLACE
      ?auto_21557 - HOIST
      ?auto_21551 - SURFACE
      ?auto_21559 - SURFACE
      ?auto_21558 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21553 ?auto_21556 ) ( IS-CRATE ?auto_21550 ) ( not ( = ?auto_21549 ?auto_21550 ) ) ( not ( = ?auto_21560 ?auto_21549 ) ) ( not ( = ?auto_21560 ?auto_21550 ) ) ( not ( = ?auto_21565 ?auto_21556 ) ) ( HOIST-AT ?auto_21564 ?auto_21565 ) ( not ( = ?auto_21553 ?auto_21564 ) ) ( AVAILABLE ?auto_21564 ) ( SURFACE-AT ?auto_21550 ?auto_21565 ) ( ON ?auto_21550 ?auto_21554 ) ( CLEAR ?auto_21550 ) ( not ( = ?auto_21549 ?auto_21554 ) ) ( not ( = ?auto_21550 ?auto_21554 ) ) ( not ( = ?auto_21560 ?auto_21554 ) ) ( IS-CRATE ?auto_21549 ) ( not ( = ?auto_21555 ?auto_21556 ) ) ( not ( = ?auto_21565 ?auto_21555 ) ) ( HOIST-AT ?auto_21561 ?auto_21555 ) ( not ( = ?auto_21553 ?auto_21561 ) ) ( not ( = ?auto_21564 ?auto_21561 ) ) ( AVAILABLE ?auto_21561 ) ( SURFACE-AT ?auto_21549 ?auto_21555 ) ( ON ?auto_21549 ?auto_21552 ) ( CLEAR ?auto_21549 ) ( not ( = ?auto_21549 ?auto_21552 ) ) ( not ( = ?auto_21550 ?auto_21552 ) ) ( not ( = ?auto_21560 ?auto_21552 ) ) ( not ( = ?auto_21554 ?auto_21552 ) ) ( IS-CRATE ?auto_21560 ) ( not ( = ?auto_21563 ?auto_21560 ) ) ( not ( = ?auto_21549 ?auto_21563 ) ) ( not ( = ?auto_21550 ?auto_21563 ) ) ( not ( = ?auto_21554 ?auto_21563 ) ) ( not ( = ?auto_21552 ?auto_21563 ) ) ( not ( = ?auto_21562 ?auto_21556 ) ) ( not ( = ?auto_21565 ?auto_21562 ) ) ( not ( = ?auto_21555 ?auto_21562 ) ) ( HOIST-AT ?auto_21557 ?auto_21562 ) ( not ( = ?auto_21553 ?auto_21557 ) ) ( not ( = ?auto_21564 ?auto_21557 ) ) ( not ( = ?auto_21561 ?auto_21557 ) ) ( AVAILABLE ?auto_21557 ) ( SURFACE-AT ?auto_21560 ?auto_21562 ) ( ON ?auto_21560 ?auto_21551 ) ( CLEAR ?auto_21560 ) ( not ( = ?auto_21549 ?auto_21551 ) ) ( not ( = ?auto_21550 ?auto_21551 ) ) ( not ( = ?auto_21560 ?auto_21551 ) ) ( not ( = ?auto_21554 ?auto_21551 ) ) ( not ( = ?auto_21552 ?auto_21551 ) ) ( not ( = ?auto_21563 ?auto_21551 ) ) ( SURFACE-AT ?auto_21559 ?auto_21556 ) ( CLEAR ?auto_21559 ) ( IS-CRATE ?auto_21563 ) ( not ( = ?auto_21559 ?auto_21563 ) ) ( not ( = ?auto_21549 ?auto_21559 ) ) ( not ( = ?auto_21550 ?auto_21559 ) ) ( not ( = ?auto_21560 ?auto_21559 ) ) ( not ( = ?auto_21554 ?auto_21559 ) ) ( not ( = ?auto_21552 ?auto_21559 ) ) ( not ( = ?auto_21551 ?auto_21559 ) ) ( AVAILABLE ?auto_21553 ) ( IN ?auto_21563 ?auto_21558 ) ( TRUCK-AT ?auto_21558 ?auto_21555 ) )
    :subtasks
    ( ( !DRIVE ?auto_21558 ?auto_21555 ?auto_21556 )
      ( MAKE-2CRATE ?auto_21560 ?auto_21549 ?auto_21550 )
      ( MAKE-1CRATE-VERIFY ?auto_21549 ?auto_21550 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21566 - SURFACE
      ?auto_21567 - SURFACE
      ?auto_21568 - SURFACE
    )
    :vars
    (
      ?auto_21569 - HOIST
      ?auto_21574 - PLACE
      ?auto_21577 - PLACE
      ?auto_21579 - HOIST
      ?auto_21581 - SURFACE
      ?auto_21578 - PLACE
      ?auto_21571 - HOIST
      ?auto_21575 - SURFACE
      ?auto_21580 - SURFACE
      ?auto_21582 - PLACE
      ?auto_21573 - HOIST
      ?auto_21572 - SURFACE
      ?auto_21570 - SURFACE
      ?auto_21576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21569 ?auto_21574 ) ( IS-CRATE ?auto_21568 ) ( not ( = ?auto_21567 ?auto_21568 ) ) ( not ( = ?auto_21566 ?auto_21567 ) ) ( not ( = ?auto_21566 ?auto_21568 ) ) ( not ( = ?auto_21577 ?auto_21574 ) ) ( HOIST-AT ?auto_21579 ?auto_21577 ) ( not ( = ?auto_21569 ?auto_21579 ) ) ( AVAILABLE ?auto_21579 ) ( SURFACE-AT ?auto_21568 ?auto_21577 ) ( ON ?auto_21568 ?auto_21581 ) ( CLEAR ?auto_21568 ) ( not ( = ?auto_21567 ?auto_21581 ) ) ( not ( = ?auto_21568 ?auto_21581 ) ) ( not ( = ?auto_21566 ?auto_21581 ) ) ( IS-CRATE ?auto_21567 ) ( not ( = ?auto_21578 ?auto_21574 ) ) ( not ( = ?auto_21577 ?auto_21578 ) ) ( HOIST-AT ?auto_21571 ?auto_21578 ) ( not ( = ?auto_21569 ?auto_21571 ) ) ( not ( = ?auto_21579 ?auto_21571 ) ) ( AVAILABLE ?auto_21571 ) ( SURFACE-AT ?auto_21567 ?auto_21578 ) ( ON ?auto_21567 ?auto_21575 ) ( CLEAR ?auto_21567 ) ( not ( = ?auto_21567 ?auto_21575 ) ) ( not ( = ?auto_21568 ?auto_21575 ) ) ( not ( = ?auto_21566 ?auto_21575 ) ) ( not ( = ?auto_21581 ?auto_21575 ) ) ( IS-CRATE ?auto_21566 ) ( not ( = ?auto_21580 ?auto_21566 ) ) ( not ( = ?auto_21567 ?auto_21580 ) ) ( not ( = ?auto_21568 ?auto_21580 ) ) ( not ( = ?auto_21581 ?auto_21580 ) ) ( not ( = ?auto_21575 ?auto_21580 ) ) ( not ( = ?auto_21582 ?auto_21574 ) ) ( not ( = ?auto_21577 ?auto_21582 ) ) ( not ( = ?auto_21578 ?auto_21582 ) ) ( HOIST-AT ?auto_21573 ?auto_21582 ) ( not ( = ?auto_21569 ?auto_21573 ) ) ( not ( = ?auto_21579 ?auto_21573 ) ) ( not ( = ?auto_21571 ?auto_21573 ) ) ( AVAILABLE ?auto_21573 ) ( SURFACE-AT ?auto_21566 ?auto_21582 ) ( ON ?auto_21566 ?auto_21572 ) ( CLEAR ?auto_21566 ) ( not ( = ?auto_21567 ?auto_21572 ) ) ( not ( = ?auto_21568 ?auto_21572 ) ) ( not ( = ?auto_21566 ?auto_21572 ) ) ( not ( = ?auto_21581 ?auto_21572 ) ) ( not ( = ?auto_21575 ?auto_21572 ) ) ( not ( = ?auto_21580 ?auto_21572 ) ) ( SURFACE-AT ?auto_21570 ?auto_21574 ) ( CLEAR ?auto_21570 ) ( IS-CRATE ?auto_21580 ) ( not ( = ?auto_21570 ?auto_21580 ) ) ( not ( = ?auto_21567 ?auto_21570 ) ) ( not ( = ?auto_21568 ?auto_21570 ) ) ( not ( = ?auto_21566 ?auto_21570 ) ) ( not ( = ?auto_21581 ?auto_21570 ) ) ( not ( = ?auto_21575 ?auto_21570 ) ) ( not ( = ?auto_21572 ?auto_21570 ) ) ( AVAILABLE ?auto_21569 ) ( IN ?auto_21580 ?auto_21576 ) ( TRUCK-AT ?auto_21576 ?auto_21578 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21567 ?auto_21568 )
      ( MAKE-2CRATE-VERIFY ?auto_21566 ?auto_21567 ?auto_21568 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21583 - SURFACE
      ?auto_21584 - SURFACE
      ?auto_21585 - SURFACE
      ?auto_21586 - SURFACE
    )
    :vars
    (
      ?auto_21590 - HOIST
      ?auto_21588 - PLACE
      ?auto_21589 - PLACE
      ?auto_21594 - HOIST
      ?auto_21595 - SURFACE
      ?auto_21592 - PLACE
      ?auto_21598 - HOIST
      ?auto_21593 - SURFACE
      ?auto_21596 - PLACE
      ?auto_21599 - HOIST
      ?auto_21591 - SURFACE
      ?auto_21587 - SURFACE
      ?auto_21597 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21590 ?auto_21588 ) ( IS-CRATE ?auto_21586 ) ( not ( = ?auto_21585 ?auto_21586 ) ) ( not ( = ?auto_21584 ?auto_21585 ) ) ( not ( = ?auto_21584 ?auto_21586 ) ) ( not ( = ?auto_21589 ?auto_21588 ) ) ( HOIST-AT ?auto_21594 ?auto_21589 ) ( not ( = ?auto_21590 ?auto_21594 ) ) ( AVAILABLE ?auto_21594 ) ( SURFACE-AT ?auto_21586 ?auto_21589 ) ( ON ?auto_21586 ?auto_21595 ) ( CLEAR ?auto_21586 ) ( not ( = ?auto_21585 ?auto_21595 ) ) ( not ( = ?auto_21586 ?auto_21595 ) ) ( not ( = ?auto_21584 ?auto_21595 ) ) ( IS-CRATE ?auto_21585 ) ( not ( = ?auto_21592 ?auto_21588 ) ) ( not ( = ?auto_21589 ?auto_21592 ) ) ( HOIST-AT ?auto_21598 ?auto_21592 ) ( not ( = ?auto_21590 ?auto_21598 ) ) ( not ( = ?auto_21594 ?auto_21598 ) ) ( AVAILABLE ?auto_21598 ) ( SURFACE-AT ?auto_21585 ?auto_21592 ) ( ON ?auto_21585 ?auto_21593 ) ( CLEAR ?auto_21585 ) ( not ( = ?auto_21585 ?auto_21593 ) ) ( not ( = ?auto_21586 ?auto_21593 ) ) ( not ( = ?auto_21584 ?auto_21593 ) ) ( not ( = ?auto_21595 ?auto_21593 ) ) ( IS-CRATE ?auto_21584 ) ( not ( = ?auto_21583 ?auto_21584 ) ) ( not ( = ?auto_21585 ?auto_21583 ) ) ( not ( = ?auto_21586 ?auto_21583 ) ) ( not ( = ?auto_21595 ?auto_21583 ) ) ( not ( = ?auto_21593 ?auto_21583 ) ) ( not ( = ?auto_21596 ?auto_21588 ) ) ( not ( = ?auto_21589 ?auto_21596 ) ) ( not ( = ?auto_21592 ?auto_21596 ) ) ( HOIST-AT ?auto_21599 ?auto_21596 ) ( not ( = ?auto_21590 ?auto_21599 ) ) ( not ( = ?auto_21594 ?auto_21599 ) ) ( not ( = ?auto_21598 ?auto_21599 ) ) ( AVAILABLE ?auto_21599 ) ( SURFACE-AT ?auto_21584 ?auto_21596 ) ( ON ?auto_21584 ?auto_21591 ) ( CLEAR ?auto_21584 ) ( not ( = ?auto_21585 ?auto_21591 ) ) ( not ( = ?auto_21586 ?auto_21591 ) ) ( not ( = ?auto_21584 ?auto_21591 ) ) ( not ( = ?auto_21595 ?auto_21591 ) ) ( not ( = ?auto_21593 ?auto_21591 ) ) ( not ( = ?auto_21583 ?auto_21591 ) ) ( SURFACE-AT ?auto_21587 ?auto_21588 ) ( CLEAR ?auto_21587 ) ( IS-CRATE ?auto_21583 ) ( not ( = ?auto_21587 ?auto_21583 ) ) ( not ( = ?auto_21585 ?auto_21587 ) ) ( not ( = ?auto_21586 ?auto_21587 ) ) ( not ( = ?auto_21584 ?auto_21587 ) ) ( not ( = ?auto_21595 ?auto_21587 ) ) ( not ( = ?auto_21593 ?auto_21587 ) ) ( not ( = ?auto_21591 ?auto_21587 ) ) ( AVAILABLE ?auto_21590 ) ( IN ?auto_21583 ?auto_21597 ) ( TRUCK-AT ?auto_21597 ?auto_21592 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21584 ?auto_21585 ?auto_21586 )
      ( MAKE-3CRATE-VERIFY ?auto_21583 ?auto_21584 ?auto_21585 ?auto_21586 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21600 - SURFACE
      ?auto_21601 - SURFACE
      ?auto_21602 - SURFACE
      ?auto_21603 - SURFACE
      ?auto_21604 - SURFACE
    )
    :vars
    (
      ?auto_21607 - HOIST
      ?auto_21605 - PLACE
      ?auto_21606 - PLACE
      ?auto_21611 - HOIST
      ?auto_21612 - SURFACE
      ?auto_21609 - PLACE
      ?auto_21615 - HOIST
      ?auto_21610 - SURFACE
      ?auto_21613 - PLACE
      ?auto_21616 - HOIST
      ?auto_21608 - SURFACE
      ?auto_21614 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21607 ?auto_21605 ) ( IS-CRATE ?auto_21604 ) ( not ( = ?auto_21603 ?auto_21604 ) ) ( not ( = ?auto_21602 ?auto_21603 ) ) ( not ( = ?auto_21602 ?auto_21604 ) ) ( not ( = ?auto_21606 ?auto_21605 ) ) ( HOIST-AT ?auto_21611 ?auto_21606 ) ( not ( = ?auto_21607 ?auto_21611 ) ) ( AVAILABLE ?auto_21611 ) ( SURFACE-AT ?auto_21604 ?auto_21606 ) ( ON ?auto_21604 ?auto_21612 ) ( CLEAR ?auto_21604 ) ( not ( = ?auto_21603 ?auto_21612 ) ) ( not ( = ?auto_21604 ?auto_21612 ) ) ( not ( = ?auto_21602 ?auto_21612 ) ) ( IS-CRATE ?auto_21603 ) ( not ( = ?auto_21609 ?auto_21605 ) ) ( not ( = ?auto_21606 ?auto_21609 ) ) ( HOIST-AT ?auto_21615 ?auto_21609 ) ( not ( = ?auto_21607 ?auto_21615 ) ) ( not ( = ?auto_21611 ?auto_21615 ) ) ( AVAILABLE ?auto_21615 ) ( SURFACE-AT ?auto_21603 ?auto_21609 ) ( ON ?auto_21603 ?auto_21610 ) ( CLEAR ?auto_21603 ) ( not ( = ?auto_21603 ?auto_21610 ) ) ( not ( = ?auto_21604 ?auto_21610 ) ) ( not ( = ?auto_21602 ?auto_21610 ) ) ( not ( = ?auto_21612 ?auto_21610 ) ) ( IS-CRATE ?auto_21602 ) ( not ( = ?auto_21601 ?auto_21602 ) ) ( not ( = ?auto_21603 ?auto_21601 ) ) ( not ( = ?auto_21604 ?auto_21601 ) ) ( not ( = ?auto_21612 ?auto_21601 ) ) ( not ( = ?auto_21610 ?auto_21601 ) ) ( not ( = ?auto_21613 ?auto_21605 ) ) ( not ( = ?auto_21606 ?auto_21613 ) ) ( not ( = ?auto_21609 ?auto_21613 ) ) ( HOIST-AT ?auto_21616 ?auto_21613 ) ( not ( = ?auto_21607 ?auto_21616 ) ) ( not ( = ?auto_21611 ?auto_21616 ) ) ( not ( = ?auto_21615 ?auto_21616 ) ) ( AVAILABLE ?auto_21616 ) ( SURFACE-AT ?auto_21602 ?auto_21613 ) ( ON ?auto_21602 ?auto_21608 ) ( CLEAR ?auto_21602 ) ( not ( = ?auto_21603 ?auto_21608 ) ) ( not ( = ?auto_21604 ?auto_21608 ) ) ( not ( = ?auto_21602 ?auto_21608 ) ) ( not ( = ?auto_21612 ?auto_21608 ) ) ( not ( = ?auto_21610 ?auto_21608 ) ) ( not ( = ?auto_21601 ?auto_21608 ) ) ( SURFACE-AT ?auto_21600 ?auto_21605 ) ( CLEAR ?auto_21600 ) ( IS-CRATE ?auto_21601 ) ( not ( = ?auto_21600 ?auto_21601 ) ) ( not ( = ?auto_21603 ?auto_21600 ) ) ( not ( = ?auto_21604 ?auto_21600 ) ) ( not ( = ?auto_21602 ?auto_21600 ) ) ( not ( = ?auto_21612 ?auto_21600 ) ) ( not ( = ?auto_21610 ?auto_21600 ) ) ( not ( = ?auto_21608 ?auto_21600 ) ) ( AVAILABLE ?auto_21607 ) ( IN ?auto_21601 ?auto_21614 ) ( TRUCK-AT ?auto_21614 ?auto_21609 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21602 ?auto_21603 ?auto_21604 )
      ( MAKE-4CRATE-VERIFY ?auto_21600 ?auto_21601 ?auto_21602 ?auto_21603 ?auto_21604 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21617 - SURFACE
      ?auto_21618 - SURFACE
    )
    :vars
    (
      ?auto_21623 - HOIST
      ?auto_21620 - PLACE
      ?auto_21631 - SURFACE
      ?auto_21621 - PLACE
      ?auto_21627 - HOIST
      ?auto_21628 - SURFACE
      ?auto_21625 - PLACE
      ?auto_21632 - HOIST
      ?auto_21626 - SURFACE
      ?auto_21622 - SURFACE
      ?auto_21629 - PLACE
      ?auto_21633 - HOIST
      ?auto_21624 - SURFACE
      ?auto_21619 - SURFACE
      ?auto_21630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21623 ?auto_21620 ) ( IS-CRATE ?auto_21618 ) ( not ( = ?auto_21617 ?auto_21618 ) ) ( not ( = ?auto_21631 ?auto_21617 ) ) ( not ( = ?auto_21631 ?auto_21618 ) ) ( not ( = ?auto_21621 ?auto_21620 ) ) ( HOIST-AT ?auto_21627 ?auto_21621 ) ( not ( = ?auto_21623 ?auto_21627 ) ) ( AVAILABLE ?auto_21627 ) ( SURFACE-AT ?auto_21618 ?auto_21621 ) ( ON ?auto_21618 ?auto_21628 ) ( CLEAR ?auto_21618 ) ( not ( = ?auto_21617 ?auto_21628 ) ) ( not ( = ?auto_21618 ?auto_21628 ) ) ( not ( = ?auto_21631 ?auto_21628 ) ) ( IS-CRATE ?auto_21617 ) ( not ( = ?auto_21625 ?auto_21620 ) ) ( not ( = ?auto_21621 ?auto_21625 ) ) ( HOIST-AT ?auto_21632 ?auto_21625 ) ( not ( = ?auto_21623 ?auto_21632 ) ) ( not ( = ?auto_21627 ?auto_21632 ) ) ( SURFACE-AT ?auto_21617 ?auto_21625 ) ( ON ?auto_21617 ?auto_21626 ) ( CLEAR ?auto_21617 ) ( not ( = ?auto_21617 ?auto_21626 ) ) ( not ( = ?auto_21618 ?auto_21626 ) ) ( not ( = ?auto_21631 ?auto_21626 ) ) ( not ( = ?auto_21628 ?auto_21626 ) ) ( IS-CRATE ?auto_21631 ) ( not ( = ?auto_21622 ?auto_21631 ) ) ( not ( = ?auto_21617 ?auto_21622 ) ) ( not ( = ?auto_21618 ?auto_21622 ) ) ( not ( = ?auto_21628 ?auto_21622 ) ) ( not ( = ?auto_21626 ?auto_21622 ) ) ( not ( = ?auto_21629 ?auto_21620 ) ) ( not ( = ?auto_21621 ?auto_21629 ) ) ( not ( = ?auto_21625 ?auto_21629 ) ) ( HOIST-AT ?auto_21633 ?auto_21629 ) ( not ( = ?auto_21623 ?auto_21633 ) ) ( not ( = ?auto_21627 ?auto_21633 ) ) ( not ( = ?auto_21632 ?auto_21633 ) ) ( AVAILABLE ?auto_21633 ) ( SURFACE-AT ?auto_21631 ?auto_21629 ) ( ON ?auto_21631 ?auto_21624 ) ( CLEAR ?auto_21631 ) ( not ( = ?auto_21617 ?auto_21624 ) ) ( not ( = ?auto_21618 ?auto_21624 ) ) ( not ( = ?auto_21631 ?auto_21624 ) ) ( not ( = ?auto_21628 ?auto_21624 ) ) ( not ( = ?auto_21626 ?auto_21624 ) ) ( not ( = ?auto_21622 ?auto_21624 ) ) ( SURFACE-AT ?auto_21619 ?auto_21620 ) ( CLEAR ?auto_21619 ) ( IS-CRATE ?auto_21622 ) ( not ( = ?auto_21619 ?auto_21622 ) ) ( not ( = ?auto_21617 ?auto_21619 ) ) ( not ( = ?auto_21618 ?auto_21619 ) ) ( not ( = ?auto_21631 ?auto_21619 ) ) ( not ( = ?auto_21628 ?auto_21619 ) ) ( not ( = ?auto_21626 ?auto_21619 ) ) ( not ( = ?auto_21624 ?auto_21619 ) ) ( AVAILABLE ?auto_21623 ) ( TRUCK-AT ?auto_21630 ?auto_21625 ) ( LIFTING ?auto_21632 ?auto_21622 ) )
    :subtasks
    ( ( !LOAD ?auto_21632 ?auto_21622 ?auto_21630 ?auto_21625 )
      ( MAKE-2CRATE ?auto_21631 ?auto_21617 ?auto_21618 )
      ( MAKE-1CRATE-VERIFY ?auto_21617 ?auto_21618 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21634 - SURFACE
      ?auto_21635 - SURFACE
      ?auto_21636 - SURFACE
    )
    :vars
    (
      ?auto_21649 - HOIST
      ?auto_21645 - PLACE
      ?auto_21640 - PLACE
      ?auto_21643 - HOIST
      ?auto_21650 - SURFACE
      ?auto_21641 - PLACE
      ?auto_21647 - HOIST
      ?auto_21646 - SURFACE
      ?auto_21644 - SURFACE
      ?auto_21648 - PLACE
      ?auto_21638 - HOIST
      ?auto_21639 - SURFACE
      ?auto_21637 - SURFACE
      ?auto_21642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21649 ?auto_21645 ) ( IS-CRATE ?auto_21636 ) ( not ( = ?auto_21635 ?auto_21636 ) ) ( not ( = ?auto_21634 ?auto_21635 ) ) ( not ( = ?auto_21634 ?auto_21636 ) ) ( not ( = ?auto_21640 ?auto_21645 ) ) ( HOIST-AT ?auto_21643 ?auto_21640 ) ( not ( = ?auto_21649 ?auto_21643 ) ) ( AVAILABLE ?auto_21643 ) ( SURFACE-AT ?auto_21636 ?auto_21640 ) ( ON ?auto_21636 ?auto_21650 ) ( CLEAR ?auto_21636 ) ( not ( = ?auto_21635 ?auto_21650 ) ) ( not ( = ?auto_21636 ?auto_21650 ) ) ( not ( = ?auto_21634 ?auto_21650 ) ) ( IS-CRATE ?auto_21635 ) ( not ( = ?auto_21641 ?auto_21645 ) ) ( not ( = ?auto_21640 ?auto_21641 ) ) ( HOIST-AT ?auto_21647 ?auto_21641 ) ( not ( = ?auto_21649 ?auto_21647 ) ) ( not ( = ?auto_21643 ?auto_21647 ) ) ( SURFACE-AT ?auto_21635 ?auto_21641 ) ( ON ?auto_21635 ?auto_21646 ) ( CLEAR ?auto_21635 ) ( not ( = ?auto_21635 ?auto_21646 ) ) ( not ( = ?auto_21636 ?auto_21646 ) ) ( not ( = ?auto_21634 ?auto_21646 ) ) ( not ( = ?auto_21650 ?auto_21646 ) ) ( IS-CRATE ?auto_21634 ) ( not ( = ?auto_21644 ?auto_21634 ) ) ( not ( = ?auto_21635 ?auto_21644 ) ) ( not ( = ?auto_21636 ?auto_21644 ) ) ( not ( = ?auto_21650 ?auto_21644 ) ) ( not ( = ?auto_21646 ?auto_21644 ) ) ( not ( = ?auto_21648 ?auto_21645 ) ) ( not ( = ?auto_21640 ?auto_21648 ) ) ( not ( = ?auto_21641 ?auto_21648 ) ) ( HOIST-AT ?auto_21638 ?auto_21648 ) ( not ( = ?auto_21649 ?auto_21638 ) ) ( not ( = ?auto_21643 ?auto_21638 ) ) ( not ( = ?auto_21647 ?auto_21638 ) ) ( AVAILABLE ?auto_21638 ) ( SURFACE-AT ?auto_21634 ?auto_21648 ) ( ON ?auto_21634 ?auto_21639 ) ( CLEAR ?auto_21634 ) ( not ( = ?auto_21635 ?auto_21639 ) ) ( not ( = ?auto_21636 ?auto_21639 ) ) ( not ( = ?auto_21634 ?auto_21639 ) ) ( not ( = ?auto_21650 ?auto_21639 ) ) ( not ( = ?auto_21646 ?auto_21639 ) ) ( not ( = ?auto_21644 ?auto_21639 ) ) ( SURFACE-AT ?auto_21637 ?auto_21645 ) ( CLEAR ?auto_21637 ) ( IS-CRATE ?auto_21644 ) ( not ( = ?auto_21637 ?auto_21644 ) ) ( not ( = ?auto_21635 ?auto_21637 ) ) ( not ( = ?auto_21636 ?auto_21637 ) ) ( not ( = ?auto_21634 ?auto_21637 ) ) ( not ( = ?auto_21650 ?auto_21637 ) ) ( not ( = ?auto_21646 ?auto_21637 ) ) ( not ( = ?auto_21639 ?auto_21637 ) ) ( AVAILABLE ?auto_21649 ) ( TRUCK-AT ?auto_21642 ?auto_21641 ) ( LIFTING ?auto_21647 ?auto_21644 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21635 ?auto_21636 )
      ( MAKE-2CRATE-VERIFY ?auto_21634 ?auto_21635 ?auto_21636 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21651 - SURFACE
      ?auto_21652 - SURFACE
      ?auto_21653 - SURFACE
      ?auto_21654 - SURFACE
    )
    :vars
    (
      ?auto_21656 - HOIST
      ?auto_21661 - PLACE
      ?auto_21663 - PLACE
      ?auto_21657 - HOIST
      ?auto_21662 - SURFACE
      ?auto_21667 - PLACE
      ?auto_21660 - HOIST
      ?auto_21664 - SURFACE
      ?auto_21655 - PLACE
      ?auto_21659 - HOIST
      ?auto_21665 - SURFACE
      ?auto_21666 - SURFACE
      ?auto_21658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21656 ?auto_21661 ) ( IS-CRATE ?auto_21654 ) ( not ( = ?auto_21653 ?auto_21654 ) ) ( not ( = ?auto_21652 ?auto_21653 ) ) ( not ( = ?auto_21652 ?auto_21654 ) ) ( not ( = ?auto_21663 ?auto_21661 ) ) ( HOIST-AT ?auto_21657 ?auto_21663 ) ( not ( = ?auto_21656 ?auto_21657 ) ) ( AVAILABLE ?auto_21657 ) ( SURFACE-AT ?auto_21654 ?auto_21663 ) ( ON ?auto_21654 ?auto_21662 ) ( CLEAR ?auto_21654 ) ( not ( = ?auto_21653 ?auto_21662 ) ) ( not ( = ?auto_21654 ?auto_21662 ) ) ( not ( = ?auto_21652 ?auto_21662 ) ) ( IS-CRATE ?auto_21653 ) ( not ( = ?auto_21667 ?auto_21661 ) ) ( not ( = ?auto_21663 ?auto_21667 ) ) ( HOIST-AT ?auto_21660 ?auto_21667 ) ( not ( = ?auto_21656 ?auto_21660 ) ) ( not ( = ?auto_21657 ?auto_21660 ) ) ( SURFACE-AT ?auto_21653 ?auto_21667 ) ( ON ?auto_21653 ?auto_21664 ) ( CLEAR ?auto_21653 ) ( not ( = ?auto_21653 ?auto_21664 ) ) ( not ( = ?auto_21654 ?auto_21664 ) ) ( not ( = ?auto_21652 ?auto_21664 ) ) ( not ( = ?auto_21662 ?auto_21664 ) ) ( IS-CRATE ?auto_21652 ) ( not ( = ?auto_21651 ?auto_21652 ) ) ( not ( = ?auto_21653 ?auto_21651 ) ) ( not ( = ?auto_21654 ?auto_21651 ) ) ( not ( = ?auto_21662 ?auto_21651 ) ) ( not ( = ?auto_21664 ?auto_21651 ) ) ( not ( = ?auto_21655 ?auto_21661 ) ) ( not ( = ?auto_21663 ?auto_21655 ) ) ( not ( = ?auto_21667 ?auto_21655 ) ) ( HOIST-AT ?auto_21659 ?auto_21655 ) ( not ( = ?auto_21656 ?auto_21659 ) ) ( not ( = ?auto_21657 ?auto_21659 ) ) ( not ( = ?auto_21660 ?auto_21659 ) ) ( AVAILABLE ?auto_21659 ) ( SURFACE-AT ?auto_21652 ?auto_21655 ) ( ON ?auto_21652 ?auto_21665 ) ( CLEAR ?auto_21652 ) ( not ( = ?auto_21653 ?auto_21665 ) ) ( not ( = ?auto_21654 ?auto_21665 ) ) ( not ( = ?auto_21652 ?auto_21665 ) ) ( not ( = ?auto_21662 ?auto_21665 ) ) ( not ( = ?auto_21664 ?auto_21665 ) ) ( not ( = ?auto_21651 ?auto_21665 ) ) ( SURFACE-AT ?auto_21666 ?auto_21661 ) ( CLEAR ?auto_21666 ) ( IS-CRATE ?auto_21651 ) ( not ( = ?auto_21666 ?auto_21651 ) ) ( not ( = ?auto_21653 ?auto_21666 ) ) ( not ( = ?auto_21654 ?auto_21666 ) ) ( not ( = ?auto_21652 ?auto_21666 ) ) ( not ( = ?auto_21662 ?auto_21666 ) ) ( not ( = ?auto_21664 ?auto_21666 ) ) ( not ( = ?auto_21665 ?auto_21666 ) ) ( AVAILABLE ?auto_21656 ) ( TRUCK-AT ?auto_21658 ?auto_21667 ) ( LIFTING ?auto_21660 ?auto_21651 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21652 ?auto_21653 ?auto_21654 )
      ( MAKE-3CRATE-VERIFY ?auto_21651 ?auto_21652 ?auto_21653 ?auto_21654 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21668 - SURFACE
      ?auto_21669 - SURFACE
      ?auto_21670 - SURFACE
      ?auto_21671 - SURFACE
      ?auto_21672 - SURFACE
    )
    :vars
    (
      ?auto_21674 - HOIST
      ?auto_21679 - PLACE
      ?auto_21681 - PLACE
      ?auto_21675 - HOIST
      ?auto_21680 - SURFACE
      ?auto_21684 - PLACE
      ?auto_21678 - HOIST
      ?auto_21682 - SURFACE
      ?auto_21673 - PLACE
      ?auto_21677 - HOIST
      ?auto_21683 - SURFACE
      ?auto_21676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21674 ?auto_21679 ) ( IS-CRATE ?auto_21672 ) ( not ( = ?auto_21671 ?auto_21672 ) ) ( not ( = ?auto_21670 ?auto_21671 ) ) ( not ( = ?auto_21670 ?auto_21672 ) ) ( not ( = ?auto_21681 ?auto_21679 ) ) ( HOIST-AT ?auto_21675 ?auto_21681 ) ( not ( = ?auto_21674 ?auto_21675 ) ) ( AVAILABLE ?auto_21675 ) ( SURFACE-AT ?auto_21672 ?auto_21681 ) ( ON ?auto_21672 ?auto_21680 ) ( CLEAR ?auto_21672 ) ( not ( = ?auto_21671 ?auto_21680 ) ) ( not ( = ?auto_21672 ?auto_21680 ) ) ( not ( = ?auto_21670 ?auto_21680 ) ) ( IS-CRATE ?auto_21671 ) ( not ( = ?auto_21684 ?auto_21679 ) ) ( not ( = ?auto_21681 ?auto_21684 ) ) ( HOIST-AT ?auto_21678 ?auto_21684 ) ( not ( = ?auto_21674 ?auto_21678 ) ) ( not ( = ?auto_21675 ?auto_21678 ) ) ( SURFACE-AT ?auto_21671 ?auto_21684 ) ( ON ?auto_21671 ?auto_21682 ) ( CLEAR ?auto_21671 ) ( not ( = ?auto_21671 ?auto_21682 ) ) ( not ( = ?auto_21672 ?auto_21682 ) ) ( not ( = ?auto_21670 ?auto_21682 ) ) ( not ( = ?auto_21680 ?auto_21682 ) ) ( IS-CRATE ?auto_21670 ) ( not ( = ?auto_21669 ?auto_21670 ) ) ( not ( = ?auto_21671 ?auto_21669 ) ) ( not ( = ?auto_21672 ?auto_21669 ) ) ( not ( = ?auto_21680 ?auto_21669 ) ) ( not ( = ?auto_21682 ?auto_21669 ) ) ( not ( = ?auto_21673 ?auto_21679 ) ) ( not ( = ?auto_21681 ?auto_21673 ) ) ( not ( = ?auto_21684 ?auto_21673 ) ) ( HOIST-AT ?auto_21677 ?auto_21673 ) ( not ( = ?auto_21674 ?auto_21677 ) ) ( not ( = ?auto_21675 ?auto_21677 ) ) ( not ( = ?auto_21678 ?auto_21677 ) ) ( AVAILABLE ?auto_21677 ) ( SURFACE-AT ?auto_21670 ?auto_21673 ) ( ON ?auto_21670 ?auto_21683 ) ( CLEAR ?auto_21670 ) ( not ( = ?auto_21671 ?auto_21683 ) ) ( not ( = ?auto_21672 ?auto_21683 ) ) ( not ( = ?auto_21670 ?auto_21683 ) ) ( not ( = ?auto_21680 ?auto_21683 ) ) ( not ( = ?auto_21682 ?auto_21683 ) ) ( not ( = ?auto_21669 ?auto_21683 ) ) ( SURFACE-AT ?auto_21668 ?auto_21679 ) ( CLEAR ?auto_21668 ) ( IS-CRATE ?auto_21669 ) ( not ( = ?auto_21668 ?auto_21669 ) ) ( not ( = ?auto_21671 ?auto_21668 ) ) ( not ( = ?auto_21672 ?auto_21668 ) ) ( not ( = ?auto_21670 ?auto_21668 ) ) ( not ( = ?auto_21680 ?auto_21668 ) ) ( not ( = ?auto_21682 ?auto_21668 ) ) ( not ( = ?auto_21683 ?auto_21668 ) ) ( AVAILABLE ?auto_21674 ) ( TRUCK-AT ?auto_21676 ?auto_21684 ) ( LIFTING ?auto_21678 ?auto_21669 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21670 ?auto_21671 ?auto_21672 )
      ( MAKE-4CRATE-VERIFY ?auto_21668 ?auto_21669 ?auto_21670 ?auto_21671 ?auto_21672 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21685 - SURFACE
      ?auto_21686 - SURFACE
    )
    :vars
    (
      ?auto_21689 - HOIST
      ?auto_21694 - PLACE
      ?auto_21695 - SURFACE
      ?auto_21697 - PLACE
      ?auto_21690 - HOIST
      ?auto_21696 - SURFACE
      ?auto_21701 - PLACE
      ?auto_21693 - HOIST
      ?auto_21698 - SURFACE
      ?auto_21687 - SURFACE
      ?auto_21688 - PLACE
      ?auto_21692 - HOIST
      ?auto_21699 - SURFACE
      ?auto_21700 - SURFACE
      ?auto_21691 - TRUCK
      ?auto_21702 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21689 ?auto_21694 ) ( IS-CRATE ?auto_21686 ) ( not ( = ?auto_21685 ?auto_21686 ) ) ( not ( = ?auto_21695 ?auto_21685 ) ) ( not ( = ?auto_21695 ?auto_21686 ) ) ( not ( = ?auto_21697 ?auto_21694 ) ) ( HOIST-AT ?auto_21690 ?auto_21697 ) ( not ( = ?auto_21689 ?auto_21690 ) ) ( AVAILABLE ?auto_21690 ) ( SURFACE-AT ?auto_21686 ?auto_21697 ) ( ON ?auto_21686 ?auto_21696 ) ( CLEAR ?auto_21686 ) ( not ( = ?auto_21685 ?auto_21696 ) ) ( not ( = ?auto_21686 ?auto_21696 ) ) ( not ( = ?auto_21695 ?auto_21696 ) ) ( IS-CRATE ?auto_21685 ) ( not ( = ?auto_21701 ?auto_21694 ) ) ( not ( = ?auto_21697 ?auto_21701 ) ) ( HOIST-AT ?auto_21693 ?auto_21701 ) ( not ( = ?auto_21689 ?auto_21693 ) ) ( not ( = ?auto_21690 ?auto_21693 ) ) ( SURFACE-AT ?auto_21685 ?auto_21701 ) ( ON ?auto_21685 ?auto_21698 ) ( CLEAR ?auto_21685 ) ( not ( = ?auto_21685 ?auto_21698 ) ) ( not ( = ?auto_21686 ?auto_21698 ) ) ( not ( = ?auto_21695 ?auto_21698 ) ) ( not ( = ?auto_21696 ?auto_21698 ) ) ( IS-CRATE ?auto_21695 ) ( not ( = ?auto_21687 ?auto_21695 ) ) ( not ( = ?auto_21685 ?auto_21687 ) ) ( not ( = ?auto_21686 ?auto_21687 ) ) ( not ( = ?auto_21696 ?auto_21687 ) ) ( not ( = ?auto_21698 ?auto_21687 ) ) ( not ( = ?auto_21688 ?auto_21694 ) ) ( not ( = ?auto_21697 ?auto_21688 ) ) ( not ( = ?auto_21701 ?auto_21688 ) ) ( HOIST-AT ?auto_21692 ?auto_21688 ) ( not ( = ?auto_21689 ?auto_21692 ) ) ( not ( = ?auto_21690 ?auto_21692 ) ) ( not ( = ?auto_21693 ?auto_21692 ) ) ( AVAILABLE ?auto_21692 ) ( SURFACE-AT ?auto_21695 ?auto_21688 ) ( ON ?auto_21695 ?auto_21699 ) ( CLEAR ?auto_21695 ) ( not ( = ?auto_21685 ?auto_21699 ) ) ( not ( = ?auto_21686 ?auto_21699 ) ) ( not ( = ?auto_21695 ?auto_21699 ) ) ( not ( = ?auto_21696 ?auto_21699 ) ) ( not ( = ?auto_21698 ?auto_21699 ) ) ( not ( = ?auto_21687 ?auto_21699 ) ) ( SURFACE-AT ?auto_21700 ?auto_21694 ) ( CLEAR ?auto_21700 ) ( IS-CRATE ?auto_21687 ) ( not ( = ?auto_21700 ?auto_21687 ) ) ( not ( = ?auto_21685 ?auto_21700 ) ) ( not ( = ?auto_21686 ?auto_21700 ) ) ( not ( = ?auto_21695 ?auto_21700 ) ) ( not ( = ?auto_21696 ?auto_21700 ) ) ( not ( = ?auto_21698 ?auto_21700 ) ) ( not ( = ?auto_21699 ?auto_21700 ) ) ( AVAILABLE ?auto_21689 ) ( TRUCK-AT ?auto_21691 ?auto_21701 ) ( AVAILABLE ?auto_21693 ) ( SURFACE-AT ?auto_21687 ?auto_21701 ) ( ON ?auto_21687 ?auto_21702 ) ( CLEAR ?auto_21687 ) ( not ( = ?auto_21685 ?auto_21702 ) ) ( not ( = ?auto_21686 ?auto_21702 ) ) ( not ( = ?auto_21695 ?auto_21702 ) ) ( not ( = ?auto_21696 ?auto_21702 ) ) ( not ( = ?auto_21698 ?auto_21702 ) ) ( not ( = ?auto_21687 ?auto_21702 ) ) ( not ( = ?auto_21699 ?auto_21702 ) ) ( not ( = ?auto_21700 ?auto_21702 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21693 ?auto_21687 ?auto_21702 ?auto_21701 )
      ( MAKE-2CRATE ?auto_21695 ?auto_21685 ?auto_21686 )
      ( MAKE-1CRATE-VERIFY ?auto_21685 ?auto_21686 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21703 - SURFACE
      ?auto_21704 - SURFACE
      ?auto_21705 - SURFACE
    )
    :vars
    (
      ?auto_21716 - HOIST
      ?auto_21708 - PLACE
      ?auto_21714 - PLACE
      ?auto_21719 - HOIST
      ?auto_21715 - SURFACE
      ?auto_21706 - PLACE
      ?auto_21712 - HOIST
      ?auto_21709 - SURFACE
      ?auto_21718 - SURFACE
      ?auto_21710 - PLACE
      ?auto_21713 - HOIST
      ?auto_21711 - SURFACE
      ?auto_21707 - SURFACE
      ?auto_21720 - TRUCK
      ?auto_21717 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21716 ?auto_21708 ) ( IS-CRATE ?auto_21705 ) ( not ( = ?auto_21704 ?auto_21705 ) ) ( not ( = ?auto_21703 ?auto_21704 ) ) ( not ( = ?auto_21703 ?auto_21705 ) ) ( not ( = ?auto_21714 ?auto_21708 ) ) ( HOIST-AT ?auto_21719 ?auto_21714 ) ( not ( = ?auto_21716 ?auto_21719 ) ) ( AVAILABLE ?auto_21719 ) ( SURFACE-AT ?auto_21705 ?auto_21714 ) ( ON ?auto_21705 ?auto_21715 ) ( CLEAR ?auto_21705 ) ( not ( = ?auto_21704 ?auto_21715 ) ) ( not ( = ?auto_21705 ?auto_21715 ) ) ( not ( = ?auto_21703 ?auto_21715 ) ) ( IS-CRATE ?auto_21704 ) ( not ( = ?auto_21706 ?auto_21708 ) ) ( not ( = ?auto_21714 ?auto_21706 ) ) ( HOIST-AT ?auto_21712 ?auto_21706 ) ( not ( = ?auto_21716 ?auto_21712 ) ) ( not ( = ?auto_21719 ?auto_21712 ) ) ( SURFACE-AT ?auto_21704 ?auto_21706 ) ( ON ?auto_21704 ?auto_21709 ) ( CLEAR ?auto_21704 ) ( not ( = ?auto_21704 ?auto_21709 ) ) ( not ( = ?auto_21705 ?auto_21709 ) ) ( not ( = ?auto_21703 ?auto_21709 ) ) ( not ( = ?auto_21715 ?auto_21709 ) ) ( IS-CRATE ?auto_21703 ) ( not ( = ?auto_21718 ?auto_21703 ) ) ( not ( = ?auto_21704 ?auto_21718 ) ) ( not ( = ?auto_21705 ?auto_21718 ) ) ( not ( = ?auto_21715 ?auto_21718 ) ) ( not ( = ?auto_21709 ?auto_21718 ) ) ( not ( = ?auto_21710 ?auto_21708 ) ) ( not ( = ?auto_21714 ?auto_21710 ) ) ( not ( = ?auto_21706 ?auto_21710 ) ) ( HOIST-AT ?auto_21713 ?auto_21710 ) ( not ( = ?auto_21716 ?auto_21713 ) ) ( not ( = ?auto_21719 ?auto_21713 ) ) ( not ( = ?auto_21712 ?auto_21713 ) ) ( AVAILABLE ?auto_21713 ) ( SURFACE-AT ?auto_21703 ?auto_21710 ) ( ON ?auto_21703 ?auto_21711 ) ( CLEAR ?auto_21703 ) ( not ( = ?auto_21704 ?auto_21711 ) ) ( not ( = ?auto_21705 ?auto_21711 ) ) ( not ( = ?auto_21703 ?auto_21711 ) ) ( not ( = ?auto_21715 ?auto_21711 ) ) ( not ( = ?auto_21709 ?auto_21711 ) ) ( not ( = ?auto_21718 ?auto_21711 ) ) ( SURFACE-AT ?auto_21707 ?auto_21708 ) ( CLEAR ?auto_21707 ) ( IS-CRATE ?auto_21718 ) ( not ( = ?auto_21707 ?auto_21718 ) ) ( not ( = ?auto_21704 ?auto_21707 ) ) ( not ( = ?auto_21705 ?auto_21707 ) ) ( not ( = ?auto_21703 ?auto_21707 ) ) ( not ( = ?auto_21715 ?auto_21707 ) ) ( not ( = ?auto_21709 ?auto_21707 ) ) ( not ( = ?auto_21711 ?auto_21707 ) ) ( AVAILABLE ?auto_21716 ) ( TRUCK-AT ?auto_21720 ?auto_21706 ) ( AVAILABLE ?auto_21712 ) ( SURFACE-AT ?auto_21718 ?auto_21706 ) ( ON ?auto_21718 ?auto_21717 ) ( CLEAR ?auto_21718 ) ( not ( = ?auto_21704 ?auto_21717 ) ) ( not ( = ?auto_21705 ?auto_21717 ) ) ( not ( = ?auto_21703 ?auto_21717 ) ) ( not ( = ?auto_21715 ?auto_21717 ) ) ( not ( = ?auto_21709 ?auto_21717 ) ) ( not ( = ?auto_21718 ?auto_21717 ) ) ( not ( = ?auto_21711 ?auto_21717 ) ) ( not ( = ?auto_21707 ?auto_21717 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21704 ?auto_21705 )
      ( MAKE-2CRATE-VERIFY ?auto_21703 ?auto_21704 ?auto_21705 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21721 - SURFACE
      ?auto_21722 - SURFACE
      ?auto_21723 - SURFACE
      ?auto_21724 - SURFACE
    )
    :vars
    (
      ?auto_21727 - HOIST
      ?auto_21733 - PLACE
      ?auto_21735 - PLACE
      ?auto_21737 - HOIST
      ?auto_21736 - SURFACE
      ?auto_21728 - PLACE
      ?auto_21738 - HOIST
      ?auto_21731 - SURFACE
      ?auto_21726 - PLACE
      ?auto_21725 - HOIST
      ?auto_21730 - SURFACE
      ?auto_21729 - SURFACE
      ?auto_21734 - TRUCK
      ?auto_21732 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21727 ?auto_21733 ) ( IS-CRATE ?auto_21724 ) ( not ( = ?auto_21723 ?auto_21724 ) ) ( not ( = ?auto_21722 ?auto_21723 ) ) ( not ( = ?auto_21722 ?auto_21724 ) ) ( not ( = ?auto_21735 ?auto_21733 ) ) ( HOIST-AT ?auto_21737 ?auto_21735 ) ( not ( = ?auto_21727 ?auto_21737 ) ) ( AVAILABLE ?auto_21737 ) ( SURFACE-AT ?auto_21724 ?auto_21735 ) ( ON ?auto_21724 ?auto_21736 ) ( CLEAR ?auto_21724 ) ( not ( = ?auto_21723 ?auto_21736 ) ) ( not ( = ?auto_21724 ?auto_21736 ) ) ( not ( = ?auto_21722 ?auto_21736 ) ) ( IS-CRATE ?auto_21723 ) ( not ( = ?auto_21728 ?auto_21733 ) ) ( not ( = ?auto_21735 ?auto_21728 ) ) ( HOIST-AT ?auto_21738 ?auto_21728 ) ( not ( = ?auto_21727 ?auto_21738 ) ) ( not ( = ?auto_21737 ?auto_21738 ) ) ( SURFACE-AT ?auto_21723 ?auto_21728 ) ( ON ?auto_21723 ?auto_21731 ) ( CLEAR ?auto_21723 ) ( not ( = ?auto_21723 ?auto_21731 ) ) ( not ( = ?auto_21724 ?auto_21731 ) ) ( not ( = ?auto_21722 ?auto_21731 ) ) ( not ( = ?auto_21736 ?auto_21731 ) ) ( IS-CRATE ?auto_21722 ) ( not ( = ?auto_21721 ?auto_21722 ) ) ( not ( = ?auto_21723 ?auto_21721 ) ) ( not ( = ?auto_21724 ?auto_21721 ) ) ( not ( = ?auto_21736 ?auto_21721 ) ) ( not ( = ?auto_21731 ?auto_21721 ) ) ( not ( = ?auto_21726 ?auto_21733 ) ) ( not ( = ?auto_21735 ?auto_21726 ) ) ( not ( = ?auto_21728 ?auto_21726 ) ) ( HOIST-AT ?auto_21725 ?auto_21726 ) ( not ( = ?auto_21727 ?auto_21725 ) ) ( not ( = ?auto_21737 ?auto_21725 ) ) ( not ( = ?auto_21738 ?auto_21725 ) ) ( AVAILABLE ?auto_21725 ) ( SURFACE-AT ?auto_21722 ?auto_21726 ) ( ON ?auto_21722 ?auto_21730 ) ( CLEAR ?auto_21722 ) ( not ( = ?auto_21723 ?auto_21730 ) ) ( not ( = ?auto_21724 ?auto_21730 ) ) ( not ( = ?auto_21722 ?auto_21730 ) ) ( not ( = ?auto_21736 ?auto_21730 ) ) ( not ( = ?auto_21731 ?auto_21730 ) ) ( not ( = ?auto_21721 ?auto_21730 ) ) ( SURFACE-AT ?auto_21729 ?auto_21733 ) ( CLEAR ?auto_21729 ) ( IS-CRATE ?auto_21721 ) ( not ( = ?auto_21729 ?auto_21721 ) ) ( not ( = ?auto_21723 ?auto_21729 ) ) ( not ( = ?auto_21724 ?auto_21729 ) ) ( not ( = ?auto_21722 ?auto_21729 ) ) ( not ( = ?auto_21736 ?auto_21729 ) ) ( not ( = ?auto_21731 ?auto_21729 ) ) ( not ( = ?auto_21730 ?auto_21729 ) ) ( AVAILABLE ?auto_21727 ) ( TRUCK-AT ?auto_21734 ?auto_21728 ) ( AVAILABLE ?auto_21738 ) ( SURFACE-AT ?auto_21721 ?auto_21728 ) ( ON ?auto_21721 ?auto_21732 ) ( CLEAR ?auto_21721 ) ( not ( = ?auto_21723 ?auto_21732 ) ) ( not ( = ?auto_21724 ?auto_21732 ) ) ( not ( = ?auto_21722 ?auto_21732 ) ) ( not ( = ?auto_21736 ?auto_21732 ) ) ( not ( = ?auto_21731 ?auto_21732 ) ) ( not ( = ?auto_21721 ?auto_21732 ) ) ( not ( = ?auto_21730 ?auto_21732 ) ) ( not ( = ?auto_21729 ?auto_21732 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21722 ?auto_21723 ?auto_21724 )
      ( MAKE-3CRATE-VERIFY ?auto_21721 ?auto_21722 ?auto_21723 ?auto_21724 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21739 - SURFACE
      ?auto_21740 - SURFACE
      ?auto_21741 - SURFACE
      ?auto_21742 - SURFACE
      ?auto_21743 - SURFACE
    )
    :vars
    (
      ?auto_21746 - HOIST
      ?auto_21751 - PLACE
      ?auto_21753 - PLACE
      ?auto_21755 - HOIST
      ?auto_21754 - SURFACE
      ?auto_21747 - PLACE
      ?auto_21756 - HOIST
      ?auto_21749 - SURFACE
      ?auto_21745 - PLACE
      ?auto_21744 - HOIST
      ?auto_21748 - SURFACE
      ?auto_21752 - TRUCK
      ?auto_21750 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21746 ?auto_21751 ) ( IS-CRATE ?auto_21743 ) ( not ( = ?auto_21742 ?auto_21743 ) ) ( not ( = ?auto_21741 ?auto_21742 ) ) ( not ( = ?auto_21741 ?auto_21743 ) ) ( not ( = ?auto_21753 ?auto_21751 ) ) ( HOIST-AT ?auto_21755 ?auto_21753 ) ( not ( = ?auto_21746 ?auto_21755 ) ) ( AVAILABLE ?auto_21755 ) ( SURFACE-AT ?auto_21743 ?auto_21753 ) ( ON ?auto_21743 ?auto_21754 ) ( CLEAR ?auto_21743 ) ( not ( = ?auto_21742 ?auto_21754 ) ) ( not ( = ?auto_21743 ?auto_21754 ) ) ( not ( = ?auto_21741 ?auto_21754 ) ) ( IS-CRATE ?auto_21742 ) ( not ( = ?auto_21747 ?auto_21751 ) ) ( not ( = ?auto_21753 ?auto_21747 ) ) ( HOIST-AT ?auto_21756 ?auto_21747 ) ( not ( = ?auto_21746 ?auto_21756 ) ) ( not ( = ?auto_21755 ?auto_21756 ) ) ( SURFACE-AT ?auto_21742 ?auto_21747 ) ( ON ?auto_21742 ?auto_21749 ) ( CLEAR ?auto_21742 ) ( not ( = ?auto_21742 ?auto_21749 ) ) ( not ( = ?auto_21743 ?auto_21749 ) ) ( not ( = ?auto_21741 ?auto_21749 ) ) ( not ( = ?auto_21754 ?auto_21749 ) ) ( IS-CRATE ?auto_21741 ) ( not ( = ?auto_21740 ?auto_21741 ) ) ( not ( = ?auto_21742 ?auto_21740 ) ) ( not ( = ?auto_21743 ?auto_21740 ) ) ( not ( = ?auto_21754 ?auto_21740 ) ) ( not ( = ?auto_21749 ?auto_21740 ) ) ( not ( = ?auto_21745 ?auto_21751 ) ) ( not ( = ?auto_21753 ?auto_21745 ) ) ( not ( = ?auto_21747 ?auto_21745 ) ) ( HOIST-AT ?auto_21744 ?auto_21745 ) ( not ( = ?auto_21746 ?auto_21744 ) ) ( not ( = ?auto_21755 ?auto_21744 ) ) ( not ( = ?auto_21756 ?auto_21744 ) ) ( AVAILABLE ?auto_21744 ) ( SURFACE-AT ?auto_21741 ?auto_21745 ) ( ON ?auto_21741 ?auto_21748 ) ( CLEAR ?auto_21741 ) ( not ( = ?auto_21742 ?auto_21748 ) ) ( not ( = ?auto_21743 ?auto_21748 ) ) ( not ( = ?auto_21741 ?auto_21748 ) ) ( not ( = ?auto_21754 ?auto_21748 ) ) ( not ( = ?auto_21749 ?auto_21748 ) ) ( not ( = ?auto_21740 ?auto_21748 ) ) ( SURFACE-AT ?auto_21739 ?auto_21751 ) ( CLEAR ?auto_21739 ) ( IS-CRATE ?auto_21740 ) ( not ( = ?auto_21739 ?auto_21740 ) ) ( not ( = ?auto_21742 ?auto_21739 ) ) ( not ( = ?auto_21743 ?auto_21739 ) ) ( not ( = ?auto_21741 ?auto_21739 ) ) ( not ( = ?auto_21754 ?auto_21739 ) ) ( not ( = ?auto_21749 ?auto_21739 ) ) ( not ( = ?auto_21748 ?auto_21739 ) ) ( AVAILABLE ?auto_21746 ) ( TRUCK-AT ?auto_21752 ?auto_21747 ) ( AVAILABLE ?auto_21756 ) ( SURFACE-AT ?auto_21740 ?auto_21747 ) ( ON ?auto_21740 ?auto_21750 ) ( CLEAR ?auto_21740 ) ( not ( = ?auto_21742 ?auto_21750 ) ) ( not ( = ?auto_21743 ?auto_21750 ) ) ( not ( = ?auto_21741 ?auto_21750 ) ) ( not ( = ?auto_21754 ?auto_21750 ) ) ( not ( = ?auto_21749 ?auto_21750 ) ) ( not ( = ?auto_21740 ?auto_21750 ) ) ( not ( = ?auto_21748 ?auto_21750 ) ) ( not ( = ?auto_21739 ?auto_21750 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21741 ?auto_21742 ?auto_21743 )
      ( MAKE-4CRATE-VERIFY ?auto_21739 ?auto_21740 ?auto_21741 ?auto_21742 ?auto_21743 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21757 - SURFACE
      ?auto_21758 - SURFACE
    )
    :vars
    (
      ?auto_21762 - HOIST
      ?auto_21769 - PLACE
      ?auto_21760 - SURFACE
      ?auto_21771 - PLACE
      ?auto_21773 - HOIST
      ?auto_21772 - SURFACE
      ?auto_21763 - PLACE
      ?auto_21774 - HOIST
      ?auto_21767 - SURFACE
      ?auto_21766 - SURFACE
      ?auto_21761 - PLACE
      ?auto_21759 - HOIST
      ?auto_21765 - SURFACE
      ?auto_21764 - SURFACE
      ?auto_21768 - SURFACE
      ?auto_21770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21762 ?auto_21769 ) ( IS-CRATE ?auto_21758 ) ( not ( = ?auto_21757 ?auto_21758 ) ) ( not ( = ?auto_21760 ?auto_21757 ) ) ( not ( = ?auto_21760 ?auto_21758 ) ) ( not ( = ?auto_21771 ?auto_21769 ) ) ( HOIST-AT ?auto_21773 ?auto_21771 ) ( not ( = ?auto_21762 ?auto_21773 ) ) ( AVAILABLE ?auto_21773 ) ( SURFACE-AT ?auto_21758 ?auto_21771 ) ( ON ?auto_21758 ?auto_21772 ) ( CLEAR ?auto_21758 ) ( not ( = ?auto_21757 ?auto_21772 ) ) ( not ( = ?auto_21758 ?auto_21772 ) ) ( not ( = ?auto_21760 ?auto_21772 ) ) ( IS-CRATE ?auto_21757 ) ( not ( = ?auto_21763 ?auto_21769 ) ) ( not ( = ?auto_21771 ?auto_21763 ) ) ( HOIST-AT ?auto_21774 ?auto_21763 ) ( not ( = ?auto_21762 ?auto_21774 ) ) ( not ( = ?auto_21773 ?auto_21774 ) ) ( SURFACE-AT ?auto_21757 ?auto_21763 ) ( ON ?auto_21757 ?auto_21767 ) ( CLEAR ?auto_21757 ) ( not ( = ?auto_21757 ?auto_21767 ) ) ( not ( = ?auto_21758 ?auto_21767 ) ) ( not ( = ?auto_21760 ?auto_21767 ) ) ( not ( = ?auto_21772 ?auto_21767 ) ) ( IS-CRATE ?auto_21760 ) ( not ( = ?auto_21766 ?auto_21760 ) ) ( not ( = ?auto_21757 ?auto_21766 ) ) ( not ( = ?auto_21758 ?auto_21766 ) ) ( not ( = ?auto_21772 ?auto_21766 ) ) ( not ( = ?auto_21767 ?auto_21766 ) ) ( not ( = ?auto_21761 ?auto_21769 ) ) ( not ( = ?auto_21771 ?auto_21761 ) ) ( not ( = ?auto_21763 ?auto_21761 ) ) ( HOIST-AT ?auto_21759 ?auto_21761 ) ( not ( = ?auto_21762 ?auto_21759 ) ) ( not ( = ?auto_21773 ?auto_21759 ) ) ( not ( = ?auto_21774 ?auto_21759 ) ) ( AVAILABLE ?auto_21759 ) ( SURFACE-AT ?auto_21760 ?auto_21761 ) ( ON ?auto_21760 ?auto_21765 ) ( CLEAR ?auto_21760 ) ( not ( = ?auto_21757 ?auto_21765 ) ) ( not ( = ?auto_21758 ?auto_21765 ) ) ( not ( = ?auto_21760 ?auto_21765 ) ) ( not ( = ?auto_21772 ?auto_21765 ) ) ( not ( = ?auto_21767 ?auto_21765 ) ) ( not ( = ?auto_21766 ?auto_21765 ) ) ( SURFACE-AT ?auto_21764 ?auto_21769 ) ( CLEAR ?auto_21764 ) ( IS-CRATE ?auto_21766 ) ( not ( = ?auto_21764 ?auto_21766 ) ) ( not ( = ?auto_21757 ?auto_21764 ) ) ( not ( = ?auto_21758 ?auto_21764 ) ) ( not ( = ?auto_21760 ?auto_21764 ) ) ( not ( = ?auto_21772 ?auto_21764 ) ) ( not ( = ?auto_21767 ?auto_21764 ) ) ( not ( = ?auto_21765 ?auto_21764 ) ) ( AVAILABLE ?auto_21762 ) ( AVAILABLE ?auto_21774 ) ( SURFACE-AT ?auto_21766 ?auto_21763 ) ( ON ?auto_21766 ?auto_21768 ) ( CLEAR ?auto_21766 ) ( not ( = ?auto_21757 ?auto_21768 ) ) ( not ( = ?auto_21758 ?auto_21768 ) ) ( not ( = ?auto_21760 ?auto_21768 ) ) ( not ( = ?auto_21772 ?auto_21768 ) ) ( not ( = ?auto_21767 ?auto_21768 ) ) ( not ( = ?auto_21766 ?auto_21768 ) ) ( not ( = ?auto_21765 ?auto_21768 ) ) ( not ( = ?auto_21764 ?auto_21768 ) ) ( TRUCK-AT ?auto_21770 ?auto_21769 ) )
    :subtasks
    ( ( !DRIVE ?auto_21770 ?auto_21769 ?auto_21763 )
      ( MAKE-2CRATE ?auto_21760 ?auto_21757 ?auto_21758 )
      ( MAKE-1CRATE-VERIFY ?auto_21757 ?auto_21758 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21775 - SURFACE
      ?auto_21776 - SURFACE
      ?auto_21777 - SURFACE
    )
    :vars
    (
      ?auto_21785 - HOIST
      ?auto_21778 - PLACE
      ?auto_21790 - PLACE
      ?auto_21784 - HOIST
      ?auto_21788 - SURFACE
      ?auto_21782 - PLACE
      ?auto_21783 - HOIST
      ?auto_21792 - SURFACE
      ?auto_21789 - SURFACE
      ?auto_21787 - PLACE
      ?auto_21780 - HOIST
      ?auto_21786 - SURFACE
      ?auto_21791 - SURFACE
      ?auto_21779 - SURFACE
      ?auto_21781 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21785 ?auto_21778 ) ( IS-CRATE ?auto_21777 ) ( not ( = ?auto_21776 ?auto_21777 ) ) ( not ( = ?auto_21775 ?auto_21776 ) ) ( not ( = ?auto_21775 ?auto_21777 ) ) ( not ( = ?auto_21790 ?auto_21778 ) ) ( HOIST-AT ?auto_21784 ?auto_21790 ) ( not ( = ?auto_21785 ?auto_21784 ) ) ( AVAILABLE ?auto_21784 ) ( SURFACE-AT ?auto_21777 ?auto_21790 ) ( ON ?auto_21777 ?auto_21788 ) ( CLEAR ?auto_21777 ) ( not ( = ?auto_21776 ?auto_21788 ) ) ( not ( = ?auto_21777 ?auto_21788 ) ) ( not ( = ?auto_21775 ?auto_21788 ) ) ( IS-CRATE ?auto_21776 ) ( not ( = ?auto_21782 ?auto_21778 ) ) ( not ( = ?auto_21790 ?auto_21782 ) ) ( HOIST-AT ?auto_21783 ?auto_21782 ) ( not ( = ?auto_21785 ?auto_21783 ) ) ( not ( = ?auto_21784 ?auto_21783 ) ) ( SURFACE-AT ?auto_21776 ?auto_21782 ) ( ON ?auto_21776 ?auto_21792 ) ( CLEAR ?auto_21776 ) ( not ( = ?auto_21776 ?auto_21792 ) ) ( not ( = ?auto_21777 ?auto_21792 ) ) ( not ( = ?auto_21775 ?auto_21792 ) ) ( not ( = ?auto_21788 ?auto_21792 ) ) ( IS-CRATE ?auto_21775 ) ( not ( = ?auto_21789 ?auto_21775 ) ) ( not ( = ?auto_21776 ?auto_21789 ) ) ( not ( = ?auto_21777 ?auto_21789 ) ) ( not ( = ?auto_21788 ?auto_21789 ) ) ( not ( = ?auto_21792 ?auto_21789 ) ) ( not ( = ?auto_21787 ?auto_21778 ) ) ( not ( = ?auto_21790 ?auto_21787 ) ) ( not ( = ?auto_21782 ?auto_21787 ) ) ( HOIST-AT ?auto_21780 ?auto_21787 ) ( not ( = ?auto_21785 ?auto_21780 ) ) ( not ( = ?auto_21784 ?auto_21780 ) ) ( not ( = ?auto_21783 ?auto_21780 ) ) ( AVAILABLE ?auto_21780 ) ( SURFACE-AT ?auto_21775 ?auto_21787 ) ( ON ?auto_21775 ?auto_21786 ) ( CLEAR ?auto_21775 ) ( not ( = ?auto_21776 ?auto_21786 ) ) ( not ( = ?auto_21777 ?auto_21786 ) ) ( not ( = ?auto_21775 ?auto_21786 ) ) ( not ( = ?auto_21788 ?auto_21786 ) ) ( not ( = ?auto_21792 ?auto_21786 ) ) ( not ( = ?auto_21789 ?auto_21786 ) ) ( SURFACE-AT ?auto_21791 ?auto_21778 ) ( CLEAR ?auto_21791 ) ( IS-CRATE ?auto_21789 ) ( not ( = ?auto_21791 ?auto_21789 ) ) ( not ( = ?auto_21776 ?auto_21791 ) ) ( not ( = ?auto_21777 ?auto_21791 ) ) ( not ( = ?auto_21775 ?auto_21791 ) ) ( not ( = ?auto_21788 ?auto_21791 ) ) ( not ( = ?auto_21792 ?auto_21791 ) ) ( not ( = ?auto_21786 ?auto_21791 ) ) ( AVAILABLE ?auto_21785 ) ( AVAILABLE ?auto_21783 ) ( SURFACE-AT ?auto_21789 ?auto_21782 ) ( ON ?auto_21789 ?auto_21779 ) ( CLEAR ?auto_21789 ) ( not ( = ?auto_21776 ?auto_21779 ) ) ( not ( = ?auto_21777 ?auto_21779 ) ) ( not ( = ?auto_21775 ?auto_21779 ) ) ( not ( = ?auto_21788 ?auto_21779 ) ) ( not ( = ?auto_21792 ?auto_21779 ) ) ( not ( = ?auto_21789 ?auto_21779 ) ) ( not ( = ?auto_21786 ?auto_21779 ) ) ( not ( = ?auto_21791 ?auto_21779 ) ) ( TRUCK-AT ?auto_21781 ?auto_21778 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21776 ?auto_21777 )
      ( MAKE-2CRATE-VERIFY ?auto_21775 ?auto_21776 ?auto_21777 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21793 - SURFACE
      ?auto_21794 - SURFACE
      ?auto_21795 - SURFACE
      ?auto_21796 - SURFACE
    )
    :vars
    (
      ?auto_21808 - HOIST
      ?auto_21799 - PLACE
      ?auto_21804 - PLACE
      ?auto_21809 - HOIST
      ?auto_21805 - SURFACE
      ?auto_21802 - PLACE
      ?auto_21810 - HOIST
      ?auto_21797 - SURFACE
      ?auto_21798 - PLACE
      ?auto_21800 - HOIST
      ?auto_21803 - SURFACE
      ?auto_21806 - SURFACE
      ?auto_21807 - SURFACE
      ?auto_21801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21808 ?auto_21799 ) ( IS-CRATE ?auto_21796 ) ( not ( = ?auto_21795 ?auto_21796 ) ) ( not ( = ?auto_21794 ?auto_21795 ) ) ( not ( = ?auto_21794 ?auto_21796 ) ) ( not ( = ?auto_21804 ?auto_21799 ) ) ( HOIST-AT ?auto_21809 ?auto_21804 ) ( not ( = ?auto_21808 ?auto_21809 ) ) ( AVAILABLE ?auto_21809 ) ( SURFACE-AT ?auto_21796 ?auto_21804 ) ( ON ?auto_21796 ?auto_21805 ) ( CLEAR ?auto_21796 ) ( not ( = ?auto_21795 ?auto_21805 ) ) ( not ( = ?auto_21796 ?auto_21805 ) ) ( not ( = ?auto_21794 ?auto_21805 ) ) ( IS-CRATE ?auto_21795 ) ( not ( = ?auto_21802 ?auto_21799 ) ) ( not ( = ?auto_21804 ?auto_21802 ) ) ( HOIST-AT ?auto_21810 ?auto_21802 ) ( not ( = ?auto_21808 ?auto_21810 ) ) ( not ( = ?auto_21809 ?auto_21810 ) ) ( SURFACE-AT ?auto_21795 ?auto_21802 ) ( ON ?auto_21795 ?auto_21797 ) ( CLEAR ?auto_21795 ) ( not ( = ?auto_21795 ?auto_21797 ) ) ( not ( = ?auto_21796 ?auto_21797 ) ) ( not ( = ?auto_21794 ?auto_21797 ) ) ( not ( = ?auto_21805 ?auto_21797 ) ) ( IS-CRATE ?auto_21794 ) ( not ( = ?auto_21793 ?auto_21794 ) ) ( not ( = ?auto_21795 ?auto_21793 ) ) ( not ( = ?auto_21796 ?auto_21793 ) ) ( not ( = ?auto_21805 ?auto_21793 ) ) ( not ( = ?auto_21797 ?auto_21793 ) ) ( not ( = ?auto_21798 ?auto_21799 ) ) ( not ( = ?auto_21804 ?auto_21798 ) ) ( not ( = ?auto_21802 ?auto_21798 ) ) ( HOIST-AT ?auto_21800 ?auto_21798 ) ( not ( = ?auto_21808 ?auto_21800 ) ) ( not ( = ?auto_21809 ?auto_21800 ) ) ( not ( = ?auto_21810 ?auto_21800 ) ) ( AVAILABLE ?auto_21800 ) ( SURFACE-AT ?auto_21794 ?auto_21798 ) ( ON ?auto_21794 ?auto_21803 ) ( CLEAR ?auto_21794 ) ( not ( = ?auto_21795 ?auto_21803 ) ) ( not ( = ?auto_21796 ?auto_21803 ) ) ( not ( = ?auto_21794 ?auto_21803 ) ) ( not ( = ?auto_21805 ?auto_21803 ) ) ( not ( = ?auto_21797 ?auto_21803 ) ) ( not ( = ?auto_21793 ?auto_21803 ) ) ( SURFACE-AT ?auto_21806 ?auto_21799 ) ( CLEAR ?auto_21806 ) ( IS-CRATE ?auto_21793 ) ( not ( = ?auto_21806 ?auto_21793 ) ) ( not ( = ?auto_21795 ?auto_21806 ) ) ( not ( = ?auto_21796 ?auto_21806 ) ) ( not ( = ?auto_21794 ?auto_21806 ) ) ( not ( = ?auto_21805 ?auto_21806 ) ) ( not ( = ?auto_21797 ?auto_21806 ) ) ( not ( = ?auto_21803 ?auto_21806 ) ) ( AVAILABLE ?auto_21808 ) ( AVAILABLE ?auto_21810 ) ( SURFACE-AT ?auto_21793 ?auto_21802 ) ( ON ?auto_21793 ?auto_21807 ) ( CLEAR ?auto_21793 ) ( not ( = ?auto_21795 ?auto_21807 ) ) ( not ( = ?auto_21796 ?auto_21807 ) ) ( not ( = ?auto_21794 ?auto_21807 ) ) ( not ( = ?auto_21805 ?auto_21807 ) ) ( not ( = ?auto_21797 ?auto_21807 ) ) ( not ( = ?auto_21793 ?auto_21807 ) ) ( not ( = ?auto_21803 ?auto_21807 ) ) ( not ( = ?auto_21806 ?auto_21807 ) ) ( TRUCK-AT ?auto_21801 ?auto_21799 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21794 ?auto_21795 ?auto_21796 )
      ( MAKE-3CRATE-VERIFY ?auto_21793 ?auto_21794 ?auto_21795 ?auto_21796 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21811 - SURFACE
      ?auto_21812 - SURFACE
      ?auto_21813 - SURFACE
      ?auto_21814 - SURFACE
      ?auto_21815 - SURFACE
    )
    :vars
    (
      ?auto_21826 - HOIST
      ?auto_21818 - PLACE
      ?auto_21823 - PLACE
      ?auto_21827 - HOIST
      ?auto_21824 - SURFACE
      ?auto_21821 - PLACE
      ?auto_21828 - HOIST
      ?auto_21816 - SURFACE
      ?auto_21817 - PLACE
      ?auto_21819 - HOIST
      ?auto_21822 - SURFACE
      ?auto_21825 - SURFACE
      ?auto_21820 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21826 ?auto_21818 ) ( IS-CRATE ?auto_21815 ) ( not ( = ?auto_21814 ?auto_21815 ) ) ( not ( = ?auto_21813 ?auto_21814 ) ) ( not ( = ?auto_21813 ?auto_21815 ) ) ( not ( = ?auto_21823 ?auto_21818 ) ) ( HOIST-AT ?auto_21827 ?auto_21823 ) ( not ( = ?auto_21826 ?auto_21827 ) ) ( AVAILABLE ?auto_21827 ) ( SURFACE-AT ?auto_21815 ?auto_21823 ) ( ON ?auto_21815 ?auto_21824 ) ( CLEAR ?auto_21815 ) ( not ( = ?auto_21814 ?auto_21824 ) ) ( not ( = ?auto_21815 ?auto_21824 ) ) ( not ( = ?auto_21813 ?auto_21824 ) ) ( IS-CRATE ?auto_21814 ) ( not ( = ?auto_21821 ?auto_21818 ) ) ( not ( = ?auto_21823 ?auto_21821 ) ) ( HOIST-AT ?auto_21828 ?auto_21821 ) ( not ( = ?auto_21826 ?auto_21828 ) ) ( not ( = ?auto_21827 ?auto_21828 ) ) ( SURFACE-AT ?auto_21814 ?auto_21821 ) ( ON ?auto_21814 ?auto_21816 ) ( CLEAR ?auto_21814 ) ( not ( = ?auto_21814 ?auto_21816 ) ) ( not ( = ?auto_21815 ?auto_21816 ) ) ( not ( = ?auto_21813 ?auto_21816 ) ) ( not ( = ?auto_21824 ?auto_21816 ) ) ( IS-CRATE ?auto_21813 ) ( not ( = ?auto_21812 ?auto_21813 ) ) ( not ( = ?auto_21814 ?auto_21812 ) ) ( not ( = ?auto_21815 ?auto_21812 ) ) ( not ( = ?auto_21824 ?auto_21812 ) ) ( not ( = ?auto_21816 ?auto_21812 ) ) ( not ( = ?auto_21817 ?auto_21818 ) ) ( not ( = ?auto_21823 ?auto_21817 ) ) ( not ( = ?auto_21821 ?auto_21817 ) ) ( HOIST-AT ?auto_21819 ?auto_21817 ) ( not ( = ?auto_21826 ?auto_21819 ) ) ( not ( = ?auto_21827 ?auto_21819 ) ) ( not ( = ?auto_21828 ?auto_21819 ) ) ( AVAILABLE ?auto_21819 ) ( SURFACE-AT ?auto_21813 ?auto_21817 ) ( ON ?auto_21813 ?auto_21822 ) ( CLEAR ?auto_21813 ) ( not ( = ?auto_21814 ?auto_21822 ) ) ( not ( = ?auto_21815 ?auto_21822 ) ) ( not ( = ?auto_21813 ?auto_21822 ) ) ( not ( = ?auto_21824 ?auto_21822 ) ) ( not ( = ?auto_21816 ?auto_21822 ) ) ( not ( = ?auto_21812 ?auto_21822 ) ) ( SURFACE-AT ?auto_21811 ?auto_21818 ) ( CLEAR ?auto_21811 ) ( IS-CRATE ?auto_21812 ) ( not ( = ?auto_21811 ?auto_21812 ) ) ( not ( = ?auto_21814 ?auto_21811 ) ) ( not ( = ?auto_21815 ?auto_21811 ) ) ( not ( = ?auto_21813 ?auto_21811 ) ) ( not ( = ?auto_21824 ?auto_21811 ) ) ( not ( = ?auto_21816 ?auto_21811 ) ) ( not ( = ?auto_21822 ?auto_21811 ) ) ( AVAILABLE ?auto_21826 ) ( AVAILABLE ?auto_21828 ) ( SURFACE-AT ?auto_21812 ?auto_21821 ) ( ON ?auto_21812 ?auto_21825 ) ( CLEAR ?auto_21812 ) ( not ( = ?auto_21814 ?auto_21825 ) ) ( not ( = ?auto_21815 ?auto_21825 ) ) ( not ( = ?auto_21813 ?auto_21825 ) ) ( not ( = ?auto_21824 ?auto_21825 ) ) ( not ( = ?auto_21816 ?auto_21825 ) ) ( not ( = ?auto_21812 ?auto_21825 ) ) ( not ( = ?auto_21822 ?auto_21825 ) ) ( not ( = ?auto_21811 ?auto_21825 ) ) ( TRUCK-AT ?auto_21820 ?auto_21818 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21813 ?auto_21814 ?auto_21815 )
      ( MAKE-4CRATE-VERIFY ?auto_21811 ?auto_21812 ?auto_21813 ?auto_21814 ?auto_21815 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21849 - SURFACE
      ?auto_21850 - SURFACE
    )
    :vars
    (
      ?auto_21851 - HOIST
      ?auto_21852 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21851 ?auto_21852 ) ( SURFACE-AT ?auto_21849 ?auto_21852 ) ( CLEAR ?auto_21849 ) ( LIFTING ?auto_21851 ?auto_21850 ) ( IS-CRATE ?auto_21850 ) ( not ( = ?auto_21849 ?auto_21850 ) ) )
    :subtasks
    ( ( !DROP ?auto_21851 ?auto_21850 ?auto_21849 ?auto_21852 )
      ( MAKE-1CRATE-VERIFY ?auto_21849 ?auto_21850 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21853 - SURFACE
      ?auto_21854 - SURFACE
      ?auto_21855 - SURFACE
    )
    :vars
    (
      ?auto_21857 - HOIST
      ?auto_21856 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21857 ?auto_21856 ) ( SURFACE-AT ?auto_21854 ?auto_21856 ) ( CLEAR ?auto_21854 ) ( LIFTING ?auto_21857 ?auto_21855 ) ( IS-CRATE ?auto_21855 ) ( not ( = ?auto_21854 ?auto_21855 ) ) ( ON ?auto_21854 ?auto_21853 ) ( not ( = ?auto_21853 ?auto_21854 ) ) ( not ( = ?auto_21853 ?auto_21855 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21854 ?auto_21855 )
      ( MAKE-2CRATE-VERIFY ?auto_21853 ?auto_21854 ?auto_21855 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21858 - SURFACE
      ?auto_21859 - SURFACE
      ?auto_21860 - SURFACE
      ?auto_21861 - SURFACE
    )
    :vars
    (
      ?auto_21863 - HOIST
      ?auto_21862 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21863 ?auto_21862 ) ( SURFACE-AT ?auto_21860 ?auto_21862 ) ( CLEAR ?auto_21860 ) ( LIFTING ?auto_21863 ?auto_21861 ) ( IS-CRATE ?auto_21861 ) ( not ( = ?auto_21860 ?auto_21861 ) ) ( ON ?auto_21859 ?auto_21858 ) ( ON ?auto_21860 ?auto_21859 ) ( not ( = ?auto_21858 ?auto_21859 ) ) ( not ( = ?auto_21858 ?auto_21860 ) ) ( not ( = ?auto_21858 ?auto_21861 ) ) ( not ( = ?auto_21859 ?auto_21860 ) ) ( not ( = ?auto_21859 ?auto_21861 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21860 ?auto_21861 )
      ( MAKE-3CRATE-VERIFY ?auto_21858 ?auto_21859 ?auto_21860 ?auto_21861 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21864 - SURFACE
      ?auto_21865 - SURFACE
      ?auto_21866 - SURFACE
      ?auto_21867 - SURFACE
      ?auto_21868 - SURFACE
    )
    :vars
    (
      ?auto_21870 - HOIST
      ?auto_21869 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21870 ?auto_21869 ) ( SURFACE-AT ?auto_21867 ?auto_21869 ) ( CLEAR ?auto_21867 ) ( LIFTING ?auto_21870 ?auto_21868 ) ( IS-CRATE ?auto_21868 ) ( not ( = ?auto_21867 ?auto_21868 ) ) ( ON ?auto_21865 ?auto_21864 ) ( ON ?auto_21866 ?auto_21865 ) ( ON ?auto_21867 ?auto_21866 ) ( not ( = ?auto_21864 ?auto_21865 ) ) ( not ( = ?auto_21864 ?auto_21866 ) ) ( not ( = ?auto_21864 ?auto_21867 ) ) ( not ( = ?auto_21864 ?auto_21868 ) ) ( not ( = ?auto_21865 ?auto_21866 ) ) ( not ( = ?auto_21865 ?auto_21867 ) ) ( not ( = ?auto_21865 ?auto_21868 ) ) ( not ( = ?auto_21866 ?auto_21867 ) ) ( not ( = ?auto_21866 ?auto_21868 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21867 ?auto_21868 )
      ( MAKE-4CRATE-VERIFY ?auto_21864 ?auto_21865 ?auto_21866 ?auto_21867 ?auto_21868 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_21871 - SURFACE
      ?auto_21872 - SURFACE
      ?auto_21873 - SURFACE
      ?auto_21874 - SURFACE
      ?auto_21875 - SURFACE
      ?auto_21876 - SURFACE
    )
    :vars
    (
      ?auto_21878 - HOIST
      ?auto_21877 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21878 ?auto_21877 ) ( SURFACE-AT ?auto_21875 ?auto_21877 ) ( CLEAR ?auto_21875 ) ( LIFTING ?auto_21878 ?auto_21876 ) ( IS-CRATE ?auto_21876 ) ( not ( = ?auto_21875 ?auto_21876 ) ) ( ON ?auto_21872 ?auto_21871 ) ( ON ?auto_21873 ?auto_21872 ) ( ON ?auto_21874 ?auto_21873 ) ( ON ?auto_21875 ?auto_21874 ) ( not ( = ?auto_21871 ?auto_21872 ) ) ( not ( = ?auto_21871 ?auto_21873 ) ) ( not ( = ?auto_21871 ?auto_21874 ) ) ( not ( = ?auto_21871 ?auto_21875 ) ) ( not ( = ?auto_21871 ?auto_21876 ) ) ( not ( = ?auto_21872 ?auto_21873 ) ) ( not ( = ?auto_21872 ?auto_21874 ) ) ( not ( = ?auto_21872 ?auto_21875 ) ) ( not ( = ?auto_21872 ?auto_21876 ) ) ( not ( = ?auto_21873 ?auto_21874 ) ) ( not ( = ?auto_21873 ?auto_21875 ) ) ( not ( = ?auto_21873 ?auto_21876 ) ) ( not ( = ?auto_21874 ?auto_21875 ) ) ( not ( = ?auto_21874 ?auto_21876 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21875 ?auto_21876 )
      ( MAKE-5CRATE-VERIFY ?auto_21871 ?auto_21872 ?auto_21873 ?auto_21874 ?auto_21875 ?auto_21876 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21879 - SURFACE
      ?auto_21880 - SURFACE
    )
    :vars
    (
      ?auto_21882 - HOIST
      ?auto_21881 - PLACE
      ?auto_21883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21882 ?auto_21881 ) ( SURFACE-AT ?auto_21879 ?auto_21881 ) ( CLEAR ?auto_21879 ) ( IS-CRATE ?auto_21880 ) ( not ( = ?auto_21879 ?auto_21880 ) ) ( TRUCK-AT ?auto_21883 ?auto_21881 ) ( AVAILABLE ?auto_21882 ) ( IN ?auto_21880 ?auto_21883 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21882 ?auto_21880 ?auto_21883 ?auto_21881 )
      ( MAKE-1CRATE ?auto_21879 ?auto_21880 )
      ( MAKE-1CRATE-VERIFY ?auto_21879 ?auto_21880 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21884 - SURFACE
      ?auto_21885 - SURFACE
      ?auto_21886 - SURFACE
    )
    :vars
    (
      ?auto_21888 - HOIST
      ?auto_21889 - PLACE
      ?auto_21887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21888 ?auto_21889 ) ( SURFACE-AT ?auto_21885 ?auto_21889 ) ( CLEAR ?auto_21885 ) ( IS-CRATE ?auto_21886 ) ( not ( = ?auto_21885 ?auto_21886 ) ) ( TRUCK-AT ?auto_21887 ?auto_21889 ) ( AVAILABLE ?auto_21888 ) ( IN ?auto_21886 ?auto_21887 ) ( ON ?auto_21885 ?auto_21884 ) ( not ( = ?auto_21884 ?auto_21885 ) ) ( not ( = ?auto_21884 ?auto_21886 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21885 ?auto_21886 )
      ( MAKE-2CRATE-VERIFY ?auto_21884 ?auto_21885 ?auto_21886 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21890 - SURFACE
      ?auto_21891 - SURFACE
      ?auto_21892 - SURFACE
      ?auto_21893 - SURFACE
    )
    :vars
    (
      ?auto_21895 - HOIST
      ?auto_21896 - PLACE
      ?auto_21894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21895 ?auto_21896 ) ( SURFACE-AT ?auto_21892 ?auto_21896 ) ( CLEAR ?auto_21892 ) ( IS-CRATE ?auto_21893 ) ( not ( = ?auto_21892 ?auto_21893 ) ) ( TRUCK-AT ?auto_21894 ?auto_21896 ) ( AVAILABLE ?auto_21895 ) ( IN ?auto_21893 ?auto_21894 ) ( ON ?auto_21892 ?auto_21891 ) ( not ( = ?auto_21891 ?auto_21892 ) ) ( not ( = ?auto_21891 ?auto_21893 ) ) ( ON ?auto_21891 ?auto_21890 ) ( not ( = ?auto_21890 ?auto_21891 ) ) ( not ( = ?auto_21890 ?auto_21892 ) ) ( not ( = ?auto_21890 ?auto_21893 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21891 ?auto_21892 ?auto_21893 )
      ( MAKE-3CRATE-VERIFY ?auto_21890 ?auto_21891 ?auto_21892 ?auto_21893 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21897 - SURFACE
      ?auto_21898 - SURFACE
      ?auto_21899 - SURFACE
      ?auto_21900 - SURFACE
      ?auto_21901 - SURFACE
    )
    :vars
    (
      ?auto_21903 - HOIST
      ?auto_21904 - PLACE
      ?auto_21902 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21903 ?auto_21904 ) ( SURFACE-AT ?auto_21900 ?auto_21904 ) ( CLEAR ?auto_21900 ) ( IS-CRATE ?auto_21901 ) ( not ( = ?auto_21900 ?auto_21901 ) ) ( TRUCK-AT ?auto_21902 ?auto_21904 ) ( AVAILABLE ?auto_21903 ) ( IN ?auto_21901 ?auto_21902 ) ( ON ?auto_21900 ?auto_21899 ) ( not ( = ?auto_21899 ?auto_21900 ) ) ( not ( = ?auto_21899 ?auto_21901 ) ) ( ON ?auto_21898 ?auto_21897 ) ( ON ?auto_21899 ?auto_21898 ) ( not ( = ?auto_21897 ?auto_21898 ) ) ( not ( = ?auto_21897 ?auto_21899 ) ) ( not ( = ?auto_21897 ?auto_21900 ) ) ( not ( = ?auto_21897 ?auto_21901 ) ) ( not ( = ?auto_21898 ?auto_21899 ) ) ( not ( = ?auto_21898 ?auto_21900 ) ) ( not ( = ?auto_21898 ?auto_21901 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21899 ?auto_21900 ?auto_21901 )
      ( MAKE-4CRATE-VERIFY ?auto_21897 ?auto_21898 ?auto_21899 ?auto_21900 ?auto_21901 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_21905 - SURFACE
      ?auto_21906 - SURFACE
      ?auto_21907 - SURFACE
      ?auto_21908 - SURFACE
      ?auto_21909 - SURFACE
      ?auto_21910 - SURFACE
    )
    :vars
    (
      ?auto_21912 - HOIST
      ?auto_21913 - PLACE
      ?auto_21911 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21912 ?auto_21913 ) ( SURFACE-AT ?auto_21909 ?auto_21913 ) ( CLEAR ?auto_21909 ) ( IS-CRATE ?auto_21910 ) ( not ( = ?auto_21909 ?auto_21910 ) ) ( TRUCK-AT ?auto_21911 ?auto_21913 ) ( AVAILABLE ?auto_21912 ) ( IN ?auto_21910 ?auto_21911 ) ( ON ?auto_21909 ?auto_21908 ) ( not ( = ?auto_21908 ?auto_21909 ) ) ( not ( = ?auto_21908 ?auto_21910 ) ) ( ON ?auto_21906 ?auto_21905 ) ( ON ?auto_21907 ?auto_21906 ) ( ON ?auto_21908 ?auto_21907 ) ( not ( = ?auto_21905 ?auto_21906 ) ) ( not ( = ?auto_21905 ?auto_21907 ) ) ( not ( = ?auto_21905 ?auto_21908 ) ) ( not ( = ?auto_21905 ?auto_21909 ) ) ( not ( = ?auto_21905 ?auto_21910 ) ) ( not ( = ?auto_21906 ?auto_21907 ) ) ( not ( = ?auto_21906 ?auto_21908 ) ) ( not ( = ?auto_21906 ?auto_21909 ) ) ( not ( = ?auto_21906 ?auto_21910 ) ) ( not ( = ?auto_21907 ?auto_21908 ) ) ( not ( = ?auto_21907 ?auto_21909 ) ) ( not ( = ?auto_21907 ?auto_21910 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21908 ?auto_21909 ?auto_21910 )
      ( MAKE-5CRATE-VERIFY ?auto_21905 ?auto_21906 ?auto_21907 ?auto_21908 ?auto_21909 ?auto_21910 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21914 - SURFACE
      ?auto_21915 - SURFACE
    )
    :vars
    (
      ?auto_21917 - HOIST
      ?auto_21919 - PLACE
      ?auto_21916 - TRUCK
      ?auto_21918 - SURFACE
      ?auto_21920 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21917 ?auto_21919 ) ( SURFACE-AT ?auto_21914 ?auto_21919 ) ( CLEAR ?auto_21914 ) ( IS-CRATE ?auto_21915 ) ( not ( = ?auto_21914 ?auto_21915 ) ) ( AVAILABLE ?auto_21917 ) ( IN ?auto_21915 ?auto_21916 ) ( ON ?auto_21914 ?auto_21918 ) ( not ( = ?auto_21918 ?auto_21914 ) ) ( not ( = ?auto_21918 ?auto_21915 ) ) ( TRUCK-AT ?auto_21916 ?auto_21920 ) ( not ( = ?auto_21920 ?auto_21919 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21916 ?auto_21920 ?auto_21919 )
      ( MAKE-2CRATE ?auto_21918 ?auto_21914 ?auto_21915 )
      ( MAKE-1CRATE-VERIFY ?auto_21914 ?auto_21915 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21921 - SURFACE
      ?auto_21922 - SURFACE
      ?auto_21923 - SURFACE
    )
    :vars
    (
      ?auto_21927 - HOIST
      ?auto_21925 - PLACE
      ?auto_21924 - TRUCK
      ?auto_21926 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21927 ?auto_21925 ) ( SURFACE-AT ?auto_21922 ?auto_21925 ) ( CLEAR ?auto_21922 ) ( IS-CRATE ?auto_21923 ) ( not ( = ?auto_21922 ?auto_21923 ) ) ( AVAILABLE ?auto_21927 ) ( IN ?auto_21923 ?auto_21924 ) ( ON ?auto_21922 ?auto_21921 ) ( not ( = ?auto_21921 ?auto_21922 ) ) ( not ( = ?auto_21921 ?auto_21923 ) ) ( TRUCK-AT ?auto_21924 ?auto_21926 ) ( not ( = ?auto_21926 ?auto_21925 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21922 ?auto_21923 )
      ( MAKE-2CRATE-VERIFY ?auto_21921 ?auto_21922 ?auto_21923 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21928 - SURFACE
      ?auto_21929 - SURFACE
      ?auto_21930 - SURFACE
      ?auto_21931 - SURFACE
    )
    :vars
    (
      ?auto_21933 - HOIST
      ?auto_21934 - PLACE
      ?auto_21932 - TRUCK
      ?auto_21935 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21933 ?auto_21934 ) ( SURFACE-AT ?auto_21930 ?auto_21934 ) ( CLEAR ?auto_21930 ) ( IS-CRATE ?auto_21931 ) ( not ( = ?auto_21930 ?auto_21931 ) ) ( AVAILABLE ?auto_21933 ) ( IN ?auto_21931 ?auto_21932 ) ( ON ?auto_21930 ?auto_21929 ) ( not ( = ?auto_21929 ?auto_21930 ) ) ( not ( = ?auto_21929 ?auto_21931 ) ) ( TRUCK-AT ?auto_21932 ?auto_21935 ) ( not ( = ?auto_21935 ?auto_21934 ) ) ( ON ?auto_21929 ?auto_21928 ) ( not ( = ?auto_21928 ?auto_21929 ) ) ( not ( = ?auto_21928 ?auto_21930 ) ) ( not ( = ?auto_21928 ?auto_21931 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21929 ?auto_21930 ?auto_21931 )
      ( MAKE-3CRATE-VERIFY ?auto_21928 ?auto_21929 ?auto_21930 ?auto_21931 ) )
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
      ?auto_21941 - TRUCK
      ?auto_21944 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21942 ?auto_21943 ) ( SURFACE-AT ?auto_21939 ?auto_21943 ) ( CLEAR ?auto_21939 ) ( IS-CRATE ?auto_21940 ) ( not ( = ?auto_21939 ?auto_21940 ) ) ( AVAILABLE ?auto_21942 ) ( IN ?auto_21940 ?auto_21941 ) ( ON ?auto_21939 ?auto_21938 ) ( not ( = ?auto_21938 ?auto_21939 ) ) ( not ( = ?auto_21938 ?auto_21940 ) ) ( TRUCK-AT ?auto_21941 ?auto_21944 ) ( not ( = ?auto_21944 ?auto_21943 ) ) ( ON ?auto_21937 ?auto_21936 ) ( ON ?auto_21938 ?auto_21937 ) ( not ( = ?auto_21936 ?auto_21937 ) ) ( not ( = ?auto_21936 ?auto_21938 ) ) ( not ( = ?auto_21936 ?auto_21939 ) ) ( not ( = ?auto_21936 ?auto_21940 ) ) ( not ( = ?auto_21937 ?auto_21938 ) ) ( not ( = ?auto_21937 ?auto_21939 ) ) ( not ( = ?auto_21937 ?auto_21940 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21938 ?auto_21939 ?auto_21940 )
      ( MAKE-4CRATE-VERIFY ?auto_21936 ?auto_21937 ?auto_21938 ?auto_21939 ?auto_21940 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_21945 - SURFACE
      ?auto_21946 - SURFACE
      ?auto_21947 - SURFACE
      ?auto_21948 - SURFACE
      ?auto_21949 - SURFACE
      ?auto_21950 - SURFACE
    )
    :vars
    (
      ?auto_21952 - HOIST
      ?auto_21953 - PLACE
      ?auto_21951 - TRUCK
      ?auto_21954 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21952 ?auto_21953 ) ( SURFACE-AT ?auto_21949 ?auto_21953 ) ( CLEAR ?auto_21949 ) ( IS-CRATE ?auto_21950 ) ( not ( = ?auto_21949 ?auto_21950 ) ) ( AVAILABLE ?auto_21952 ) ( IN ?auto_21950 ?auto_21951 ) ( ON ?auto_21949 ?auto_21948 ) ( not ( = ?auto_21948 ?auto_21949 ) ) ( not ( = ?auto_21948 ?auto_21950 ) ) ( TRUCK-AT ?auto_21951 ?auto_21954 ) ( not ( = ?auto_21954 ?auto_21953 ) ) ( ON ?auto_21946 ?auto_21945 ) ( ON ?auto_21947 ?auto_21946 ) ( ON ?auto_21948 ?auto_21947 ) ( not ( = ?auto_21945 ?auto_21946 ) ) ( not ( = ?auto_21945 ?auto_21947 ) ) ( not ( = ?auto_21945 ?auto_21948 ) ) ( not ( = ?auto_21945 ?auto_21949 ) ) ( not ( = ?auto_21945 ?auto_21950 ) ) ( not ( = ?auto_21946 ?auto_21947 ) ) ( not ( = ?auto_21946 ?auto_21948 ) ) ( not ( = ?auto_21946 ?auto_21949 ) ) ( not ( = ?auto_21946 ?auto_21950 ) ) ( not ( = ?auto_21947 ?auto_21948 ) ) ( not ( = ?auto_21947 ?auto_21949 ) ) ( not ( = ?auto_21947 ?auto_21950 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21948 ?auto_21949 ?auto_21950 )
      ( MAKE-5CRATE-VERIFY ?auto_21945 ?auto_21946 ?auto_21947 ?auto_21948 ?auto_21949 ?auto_21950 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21955 - SURFACE
      ?auto_21956 - SURFACE
    )
    :vars
    (
      ?auto_21958 - HOIST
      ?auto_21959 - PLACE
      ?auto_21961 - SURFACE
      ?auto_21957 - TRUCK
      ?auto_21960 - PLACE
      ?auto_21962 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21958 ?auto_21959 ) ( SURFACE-AT ?auto_21955 ?auto_21959 ) ( CLEAR ?auto_21955 ) ( IS-CRATE ?auto_21956 ) ( not ( = ?auto_21955 ?auto_21956 ) ) ( AVAILABLE ?auto_21958 ) ( ON ?auto_21955 ?auto_21961 ) ( not ( = ?auto_21961 ?auto_21955 ) ) ( not ( = ?auto_21961 ?auto_21956 ) ) ( TRUCK-AT ?auto_21957 ?auto_21960 ) ( not ( = ?auto_21960 ?auto_21959 ) ) ( HOIST-AT ?auto_21962 ?auto_21960 ) ( LIFTING ?auto_21962 ?auto_21956 ) ( not ( = ?auto_21958 ?auto_21962 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21962 ?auto_21956 ?auto_21957 ?auto_21960 )
      ( MAKE-2CRATE ?auto_21961 ?auto_21955 ?auto_21956 )
      ( MAKE-1CRATE-VERIFY ?auto_21955 ?auto_21956 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21963 - SURFACE
      ?auto_21964 - SURFACE
      ?auto_21965 - SURFACE
    )
    :vars
    (
      ?auto_21969 - HOIST
      ?auto_21968 - PLACE
      ?auto_21966 - TRUCK
      ?auto_21967 - PLACE
      ?auto_21970 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21969 ?auto_21968 ) ( SURFACE-AT ?auto_21964 ?auto_21968 ) ( CLEAR ?auto_21964 ) ( IS-CRATE ?auto_21965 ) ( not ( = ?auto_21964 ?auto_21965 ) ) ( AVAILABLE ?auto_21969 ) ( ON ?auto_21964 ?auto_21963 ) ( not ( = ?auto_21963 ?auto_21964 ) ) ( not ( = ?auto_21963 ?auto_21965 ) ) ( TRUCK-AT ?auto_21966 ?auto_21967 ) ( not ( = ?auto_21967 ?auto_21968 ) ) ( HOIST-AT ?auto_21970 ?auto_21967 ) ( LIFTING ?auto_21970 ?auto_21965 ) ( not ( = ?auto_21969 ?auto_21970 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21964 ?auto_21965 )
      ( MAKE-2CRATE-VERIFY ?auto_21963 ?auto_21964 ?auto_21965 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21971 - SURFACE
      ?auto_21972 - SURFACE
      ?auto_21973 - SURFACE
      ?auto_21974 - SURFACE
    )
    :vars
    (
      ?auto_21979 - HOIST
      ?auto_21975 - PLACE
      ?auto_21976 - TRUCK
      ?auto_21978 - PLACE
      ?auto_21977 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21979 ?auto_21975 ) ( SURFACE-AT ?auto_21973 ?auto_21975 ) ( CLEAR ?auto_21973 ) ( IS-CRATE ?auto_21974 ) ( not ( = ?auto_21973 ?auto_21974 ) ) ( AVAILABLE ?auto_21979 ) ( ON ?auto_21973 ?auto_21972 ) ( not ( = ?auto_21972 ?auto_21973 ) ) ( not ( = ?auto_21972 ?auto_21974 ) ) ( TRUCK-AT ?auto_21976 ?auto_21978 ) ( not ( = ?auto_21978 ?auto_21975 ) ) ( HOIST-AT ?auto_21977 ?auto_21978 ) ( LIFTING ?auto_21977 ?auto_21974 ) ( not ( = ?auto_21979 ?auto_21977 ) ) ( ON ?auto_21972 ?auto_21971 ) ( not ( = ?auto_21971 ?auto_21972 ) ) ( not ( = ?auto_21971 ?auto_21973 ) ) ( not ( = ?auto_21971 ?auto_21974 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21972 ?auto_21973 ?auto_21974 )
      ( MAKE-3CRATE-VERIFY ?auto_21971 ?auto_21972 ?auto_21973 ?auto_21974 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_21980 - SURFACE
      ?auto_21981 - SURFACE
      ?auto_21982 - SURFACE
      ?auto_21983 - SURFACE
      ?auto_21984 - SURFACE
    )
    :vars
    (
      ?auto_21989 - HOIST
      ?auto_21985 - PLACE
      ?auto_21986 - TRUCK
      ?auto_21988 - PLACE
      ?auto_21987 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21989 ?auto_21985 ) ( SURFACE-AT ?auto_21983 ?auto_21985 ) ( CLEAR ?auto_21983 ) ( IS-CRATE ?auto_21984 ) ( not ( = ?auto_21983 ?auto_21984 ) ) ( AVAILABLE ?auto_21989 ) ( ON ?auto_21983 ?auto_21982 ) ( not ( = ?auto_21982 ?auto_21983 ) ) ( not ( = ?auto_21982 ?auto_21984 ) ) ( TRUCK-AT ?auto_21986 ?auto_21988 ) ( not ( = ?auto_21988 ?auto_21985 ) ) ( HOIST-AT ?auto_21987 ?auto_21988 ) ( LIFTING ?auto_21987 ?auto_21984 ) ( not ( = ?auto_21989 ?auto_21987 ) ) ( ON ?auto_21981 ?auto_21980 ) ( ON ?auto_21982 ?auto_21981 ) ( not ( = ?auto_21980 ?auto_21981 ) ) ( not ( = ?auto_21980 ?auto_21982 ) ) ( not ( = ?auto_21980 ?auto_21983 ) ) ( not ( = ?auto_21980 ?auto_21984 ) ) ( not ( = ?auto_21981 ?auto_21982 ) ) ( not ( = ?auto_21981 ?auto_21983 ) ) ( not ( = ?auto_21981 ?auto_21984 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21982 ?auto_21983 ?auto_21984 )
      ( MAKE-4CRATE-VERIFY ?auto_21980 ?auto_21981 ?auto_21982 ?auto_21983 ?auto_21984 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_21990 - SURFACE
      ?auto_21991 - SURFACE
      ?auto_21992 - SURFACE
      ?auto_21993 - SURFACE
      ?auto_21994 - SURFACE
      ?auto_21995 - SURFACE
    )
    :vars
    (
      ?auto_22000 - HOIST
      ?auto_21996 - PLACE
      ?auto_21997 - TRUCK
      ?auto_21999 - PLACE
      ?auto_21998 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22000 ?auto_21996 ) ( SURFACE-AT ?auto_21994 ?auto_21996 ) ( CLEAR ?auto_21994 ) ( IS-CRATE ?auto_21995 ) ( not ( = ?auto_21994 ?auto_21995 ) ) ( AVAILABLE ?auto_22000 ) ( ON ?auto_21994 ?auto_21993 ) ( not ( = ?auto_21993 ?auto_21994 ) ) ( not ( = ?auto_21993 ?auto_21995 ) ) ( TRUCK-AT ?auto_21997 ?auto_21999 ) ( not ( = ?auto_21999 ?auto_21996 ) ) ( HOIST-AT ?auto_21998 ?auto_21999 ) ( LIFTING ?auto_21998 ?auto_21995 ) ( not ( = ?auto_22000 ?auto_21998 ) ) ( ON ?auto_21991 ?auto_21990 ) ( ON ?auto_21992 ?auto_21991 ) ( ON ?auto_21993 ?auto_21992 ) ( not ( = ?auto_21990 ?auto_21991 ) ) ( not ( = ?auto_21990 ?auto_21992 ) ) ( not ( = ?auto_21990 ?auto_21993 ) ) ( not ( = ?auto_21990 ?auto_21994 ) ) ( not ( = ?auto_21990 ?auto_21995 ) ) ( not ( = ?auto_21991 ?auto_21992 ) ) ( not ( = ?auto_21991 ?auto_21993 ) ) ( not ( = ?auto_21991 ?auto_21994 ) ) ( not ( = ?auto_21991 ?auto_21995 ) ) ( not ( = ?auto_21992 ?auto_21993 ) ) ( not ( = ?auto_21992 ?auto_21994 ) ) ( not ( = ?auto_21992 ?auto_21995 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21993 ?auto_21994 ?auto_21995 )
      ( MAKE-5CRATE-VERIFY ?auto_21990 ?auto_21991 ?auto_21992 ?auto_21993 ?auto_21994 ?auto_21995 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22001 - SURFACE
      ?auto_22002 - SURFACE
    )
    :vars
    (
      ?auto_22007 - HOIST
      ?auto_22003 - PLACE
      ?auto_22008 - SURFACE
      ?auto_22004 - TRUCK
      ?auto_22006 - PLACE
      ?auto_22005 - HOIST
      ?auto_22009 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22007 ?auto_22003 ) ( SURFACE-AT ?auto_22001 ?auto_22003 ) ( CLEAR ?auto_22001 ) ( IS-CRATE ?auto_22002 ) ( not ( = ?auto_22001 ?auto_22002 ) ) ( AVAILABLE ?auto_22007 ) ( ON ?auto_22001 ?auto_22008 ) ( not ( = ?auto_22008 ?auto_22001 ) ) ( not ( = ?auto_22008 ?auto_22002 ) ) ( TRUCK-AT ?auto_22004 ?auto_22006 ) ( not ( = ?auto_22006 ?auto_22003 ) ) ( HOIST-AT ?auto_22005 ?auto_22006 ) ( not ( = ?auto_22007 ?auto_22005 ) ) ( AVAILABLE ?auto_22005 ) ( SURFACE-AT ?auto_22002 ?auto_22006 ) ( ON ?auto_22002 ?auto_22009 ) ( CLEAR ?auto_22002 ) ( not ( = ?auto_22001 ?auto_22009 ) ) ( not ( = ?auto_22002 ?auto_22009 ) ) ( not ( = ?auto_22008 ?auto_22009 ) ) )
    :subtasks
    ( ( !LIFT ?auto_22005 ?auto_22002 ?auto_22009 ?auto_22006 )
      ( MAKE-2CRATE ?auto_22008 ?auto_22001 ?auto_22002 )
      ( MAKE-1CRATE-VERIFY ?auto_22001 ?auto_22002 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22010 - SURFACE
      ?auto_22011 - SURFACE
      ?auto_22012 - SURFACE
    )
    :vars
    (
      ?auto_22016 - HOIST
      ?auto_22017 - PLACE
      ?auto_22018 - TRUCK
      ?auto_22013 - PLACE
      ?auto_22015 - HOIST
      ?auto_22014 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22016 ?auto_22017 ) ( SURFACE-AT ?auto_22011 ?auto_22017 ) ( CLEAR ?auto_22011 ) ( IS-CRATE ?auto_22012 ) ( not ( = ?auto_22011 ?auto_22012 ) ) ( AVAILABLE ?auto_22016 ) ( ON ?auto_22011 ?auto_22010 ) ( not ( = ?auto_22010 ?auto_22011 ) ) ( not ( = ?auto_22010 ?auto_22012 ) ) ( TRUCK-AT ?auto_22018 ?auto_22013 ) ( not ( = ?auto_22013 ?auto_22017 ) ) ( HOIST-AT ?auto_22015 ?auto_22013 ) ( not ( = ?auto_22016 ?auto_22015 ) ) ( AVAILABLE ?auto_22015 ) ( SURFACE-AT ?auto_22012 ?auto_22013 ) ( ON ?auto_22012 ?auto_22014 ) ( CLEAR ?auto_22012 ) ( not ( = ?auto_22011 ?auto_22014 ) ) ( not ( = ?auto_22012 ?auto_22014 ) ) ( not ( = ?auto_22010 ?auto_22014 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22011 ?auto_22012 )
      ( MAKE-2CRATE-VERIFY ?auto_22010 ?auto_22011 ?auto_22012 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22019 - SURFACE
      ?auto_22020 - SURFACE
      ?auto_22021 - SURFACE
      ?auto_22022 - SURFACE
    )
    :vars
    (
      ?auto_22023 - HOIST
      ?auto_22024 - PLACE
      ?auto_22026 - TRUCK
      ?auto_22028 - PLACE
      ?auto_22025 - HOIST
      ?auto_22027 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22023 ?auto_22024 ) ( SURFACE-AT ?auto_22021 ?auto_22024 ) ( CLEAR ?auto_22021 ) ( IS-CRATE ?auto_22022 ) ( not ( = ?auto_22021 ?auto_22022 ) ) ( AVAILABLE ?auto_22023 ) ( ON ?auto_22021 ?auto_22020 ) ( not ( = ?auto_22020 ?auto_22021 ) ) ( not ( = ?auto_22020 ?auto_22022 ) ) ( TRUCK-AT ?auto_22026 ?auto_22028 ) ( not ( = ?auto_22028 ?auto_22024 ) ) ( HOIST-AT ?auto_22025 ?auto_22028 ) ( not ( = ?auto_22023 ?auto_22025 ) ) ( AVAILABLE ?auto_22025 ) ( SURFACE-AT ?auto_22022 ?auto_22028 ) ( ON ?auto_22022 ?auto_22027 ) ( CLEAR ?auto_22022 ) ( not ( = ?auto_22021 ?auto_22027 ) ) ( not ( = ?auto_22022 ?auto_22027 ) ) ( not ( = ?auto_22020 ?auto_22027 ) ) ( ON ?auto_22020 ?auto_22019 ) ( not ( = ?auto_22019 ?auto_22020 ) ) ( not ( = ?auto_22019 ?auto_22021 ) ) ( not ( = ?auto_22019 ?auto_22022 ) ) ( not ( = ?auto_22019 ?auto_22027 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22020 ?auto_22021 ?auto_22022 )
      ( MAKE-3CRATE-VERIFY ?auto_22019 ?auto_22020 ?auto_22021 ?auto_22022 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22029 - SURFACE
      ?auto_22030 - SURFACE
      ?auto_22031 - SURFACE
      ?auto_22032 - SURFACE
      ?auto_22033 - SURFACE
    )
    :vars
    (
      ?auto_22034 - HOIST
      ?auto_22035 - PLACE
      ?auto_22037 - TRUCK
      ?auto_22039 - PLACE
      ?auto_22036 - HOIST
      ?auto_22038 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22034 ?auto_22035 ) ( SURFACE-AT ?auto_22032 ?auto_22035 ) ( CLEAR ?auto_22032 ) ( IS-CRATE ?auto_22033 ) ( not ( = ?auto_22032 ?auto_22033 ) ) ( AVAILABLE ?auto_22034 ) ( ON ?auto_22032 ?auto_22031 ) ( not ( = ?auto_22031 ?auto_22032 ) ) ( not ( = ?auto_22031 ?auto_22033 ) ) ( TRUCK-AT ?auto_22037 ?auto_22039 ) ( not ( = ?auto_22039 ?auto_22035 ) ) ( HOIST-AT ?auto_22036 ?auto_22039 ) ( not ( = ?auto_22034 ?auto_22036 ) ) ( AVAILABLE ?auto_22036 ) ( SURFACE-AT ?auto_22033 ?auto_22039 ) ( ON ?auto_22033 ?auto_22038 ) ( CLEAR ?auto_22033 ) ( not ( = ?auto_22032 ?auto_22038 ) ) ( not ( = ?auto_22033 ?auto_22038 ) ) ( not ( = ?auto_22031 ?auto_22038 ) ) ( ON ?auto_22030 ?auto_22029 ) ( ON ?auto_22031 ?auto_22030 ) ( not ( = ?auto_22029 ?auto_22030 ) ) ( not ( = ?auto_22029 ?auto_22031 ) ) ( not ( = ?auto_22029 ?auto_22032 ) ) ( not ( = ?auto_22029 ?auto_22033 ) ) ( not ( = ?auto_22029 ?auto_22038 ) ) ( not ( = ?auto_22030 ?auto_22031 ) ) ( not ( = ?auto_22030 ?auto_22032 ) ) ( not ( = ?auto_22030 ?auto_22033 ) ) ( not ( = ?auto_22030 ?auto_22038 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22031 ?auto_22032 ?auto_22033 )
      ( MAKE-4CRATE-VERIFY ?auto_22029 ?auto_22030 ?auto_22031 ?auto_22032 ?auto_22033 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22040 - SURFACE
      ?auto_22041 - SURFACE
      ?auto_22042 - SURFACE
      ?auto_22043 - SURFACE
      ?auto_22044 - SURFACE
      ?auto_22045 - SURFACE
    )
    :vars
    (
      ?auto_22046 - HOIST
      ?auto_22047 - PLACE
      ?auto_22049 - TRUCK
      ?auto_22051 - PLACE
      ?auto_22048 - HOIST
      ?auto_22050 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22046 ?auto_22047 ) ( SURFACE-AT ?auto_22044 ?auto_22047 ) ( CLEAR ?auto_22044 ) ( IS-CRATE ?auto_22045 ) ( not ( = ?auto_22044 ?auto_22045 ) ) ( AVAILABLE ?auto_22046 ) ( ON ?auto_22044 ?auto_22043 ) ( not ( = ?auto_22043 ?auto_22044 ) ) ( not ( = ?auto_22043 ?auto_22045 ) ) ( TRUCK-AT ?auto_22049 ?auto_22051 ) ( not ( = ?auto_22051 ?auto_22047 ) ) ( HOIST-AT ?auto_22048 ?auto_22051 ) ( not ( = ?auto_22046 ?auto_22048 ) ) ( AVAILABLE ?auto_22048 ) ( SURFACE-AT ?auto_22045 ?auto_22051 ) ( ON ?auto_22045 ?auto_22050 ) ( CLEAR ?auto_22045 ) ( not ( = ?auto_22044 ?auto_22050 ) ) ( not ( = ?auto_22045 ?auto_22050 ) ) ( not ( = ?auto_22043 ?auto_22050 ) ) ( ON ?auto_22041 ?auto_22040 ) ( ON ?auto_22042 ?auto_22041 ) ( ON ?auto_22043 ?auto_22042 ) ( not ( = ?auto_22040 ?auto_22041 ) ) ( not ( = ?auto_22040 ?auto_22042 ) ) ( not ( = ?auto_22040 ?auto_22043 ) ) ( not ( = ?auto_22040 ?auto_22044 ) ) ( not ( = ?auto_22040 ?auto_22045 ) ) ( not ( = ?auto_22040 ?auto_22050 ) ) ( not ( = ?auto_22041 ?auto_22042 ) ) ( not ( = ?auto_22041 ?auto_22043 ) ) ( not ( = ?auto_22041 ?auto_22044 ) ) ( not ( = ?auto_22041 ?auto_22045 ) ) ( not ( = ?auto_22041 ?auto_22050 ) ) ( not ( = ?auto_22042 ?auto_22043 ) ) ( not ( = ?auto_22042 ?auto_22044 ) ) ( not ( = ?auto_22042 ?auto_22045 ) ) ( not ( = ?auto_22042 ?auto_22050 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22043 ?auto_22044 ?auto_22045 )
      ( MAKE-5CRATE-VERIFY ?auto_22040 ?auto_22041 ?auto_22042 ?auto_22043 ?auto_22044 ?auto_22045 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22052 - SURFACE
      ?auto_22053 - SURFACE
    )
    :vars
    (
      ?auto_22054 - HOIST
      ?auto_22056 - PLACE
      ?auto_22055 - SURFACE
      ?auto_22060 - PLACE
      ?auto_22057 - HOIST
      ?auto_22059 - SURFACE
      ?auto_22058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22054 ?auto_22056 ) ( SURFACE-AT ?auto_22052 ?auto_22056 ) ( CLEAR ?auto_22052 ) ( IS-CRATE ?auto_22053 ) ( not ( = ?auto_22052 ?auto_22053 ) ) ( AVAILABLE ?auto_22054 ) ( ON ?auto_22052 ?auto_22055 ) ( not ( = ?auto_22055 ?auto_22052 ) ) ( not ( = ?auto_22055 ?auto_22053 ) ) ( not ( = ?auto_22060 ?auto_22056 ) ) ( HOIST-AT ?auto_22057 ?auto_22060 ) ( not ( = ?auto_22054 ?auto_22057 ) ) ( AVAILABLE ?auto_22057 ) ( SURFACE-AT ?auto_22053 ?auto_22060 ) ( ON ?auto_22053 ?auto_22059 ) ( CLEAR ?auto_22053 ) ( not ( = ?auto_22052 ?auto_22059 ) ) ( not ( = ?auto_22053 ?auto_22059 ) ) ( not ( = ?auto_22055 ?auto_22059 ) ) ( TRUCK-AT ?auto_22058 ?auto_22056 ) )
    :subtasks
    ( ( !DRIVE ?auto_22058 ?auto_22056 ?auto_22060 )
      ( MAKE-2CRATE ?auto_22055 ?auto_22052 ?auto_22053 )
      ( MAKE-1CRATE-VERIFY ?auto_22052 ?auto_22053 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22061 - SURFACE
      ?auto_22062 - SURFACE
      ?auto_22063 - SURFACE
    )
    :vars
    (
      ?auto_22064 - HOIST
      ?auto_22068 - PLACE
      ?auto_22065 - PLACE
      ?auto_22069 - HOIST
      ?auto_22066 - SURFACE
      ?auto_22067 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22064 ?auto_22068 ) ( SURFACE-AT ?auto_22062 ?auto_22068 ) ( CLEAR ?auto_22062 ) ( IS-CRATE ?auto_22063 ) ( not ( = ?auto_22062 ?auto_22063 ) ) ( AVAILABLE ?auto_22064 ) ( ON ?auto_22062 ?auto_22061 ) ( not ( = ?auto_22061 ?auto_22062 ) ) ( not ( = ?auto_22061 ?auto_22063 ) ) ( not ( = ?auto_22065 ?auto_22068 ) ) ( HOIST-AT ?auto_22069 ?auto_22065 ) ( not ( = ?auto_22064 ?auto_22069 ) ) ( AVAILABLE ?auto_22069 ) ( SURFACE-AT ?auto_22063 ?auto_22065 ) ( ON ?auto_22063 ?auto_22066 ) ( CLEAR ?auto_22063 ) ( not ( = ?auto_22062 ?auto_22066 ) ) ( not ( = ?auto_22063 ?auto_22066 ) ) ( not ( = ?auto_22061 ?auto_22066 ) ) ( TRUCK-AT ?auto_22067 ?auto_22068 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22062 ?auto_22063 )
      ( MAKE-2CRATE-VERIFY ?auto_22061 ?auto_22062 ?auto_22063 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22070 - SURFACE
      ?auto_22071 - SURFACE
      ?auto_22072 - SURFACE
      ?auto_22073 - SURFACE
    )
    :vars
    (
      ?auto_22078 - HOIST
      ?auto_22075 - PLACE
      ?auto_22079 - PLACE
      ?auto_22076 - HOIST
      ?auto_22074 - SURFACE
      ?auto_22077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22078 ?auto_22075 ) ( SURFACE-AT ?auto_22072 ?auto_22075 ) ( CLEAR ?auto_22072 ) ( IS-CRATE ?auto_22073 ) ( not ( = ?auto_22072 ?auto_22073 ) ) ( AVAILABLE ?auto_22078 ) ( ON ?auto_22072 ?auto_22071 ) ( not ( = ?auto_22071 ?auto_22072 ) ) ( not ( = ?auto_22071 ?auto_22073 ) ) ( not ( = ?auto_22079 ?auto_22075 ) ) ( HOIST-AT ?auto_22076 ?auto_22079 ) ( not ( = ?auto_22078 ?auto_22076 ) ) ( AVAILABLE ?auto_22076 ) ( SURFACE-AT ?auto_22073 ?auto_22079 ) ( ON ?auto_22073 ?auto_22074 ) ( CLEAR ?auto_22073 ) ( not ( = ?auto_22072 ?auto_22074 ) ) ( not ( = ?auto_22073 ?auto_22074 ) ) ( not ( = ?auto_22071 ?auto_22074 ) ) ( TRUCK-AT ?auto_22077 ?auto_22075 ) ( ON ?auto_22071 ?auto_22070 ) ( not ( = ?auto_22070 ?auto_22071 ) ) ( not ( = ?auto_22070 ?auto_22072 ) ) ( not ( = ?auto_22070 ?auto_22073 ) ) ( not ( = ?auto_22070 ?auto_22074 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22071 ?auto_22072 ?auto_22073 )
      ( MAKE-3CRATE-VERIFY ?auto_22070 ?auto_22071 ?auto_22072 ?auto_22073 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22080 - SURFACE
      ?auto_22081 - SURFACE
      ?auto_22082 - SURFACE
      ?auto_22083 - SURFACE
      ?auto_22084 - SURFACE
    )
    :vars
    (
      ?auto_22089 - HOIST
      ?auto_22086 - PLACE
      ?auto_22090 - PLACE
      ?auto_22087 - HOIST
      ?auto_22085 - SURFACE
      ?auto_22088 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22089 ?auto_22086 ) ( SURFACE-AT ?auto_22083 ?auto_22086 ) ( CLEAR ?auto_22083 ) ( IS-CRATE ?auto_22084 ) ( not ( = ?auto_22083 ?auto_22084 ) ) ( AVAILABLE ?auto_22089 ) ( ON ?auto_22083 ?auto_22082 ) ( not ( = ?auto_22082 ?auto_22083 ) ) ( not ( = ?auto_22082 ?auto_22084 ) ) ( not ( = ?auto_22090 ?auto_22086 ) ) ( HOIST-AT ?auto_22087 ?auto_22090 ) ( not ( = ?auto_22089 ?auto_22087 ) ) ( AVAILABLE ?auto_22087 ) ( SURFACE-AT ?auto_22084 ?auto_22090 ) ( ON ?auto_22084 ?auto_22085 ) ( CLEAR ?auto_22084 ) ( not ( = ?auto_22083 ?auto_22085 ) ) ( not ( = ?auto_22084 ?auto_22085 ) ) ( not ( = ?auto_22082 ?auto_22085 ) ) ( TRUCK-AT ?auto_22088 ?auto_22086 ) ( ON ?auto_22081 ?auto_22080 ) ( ON ?auto_22082 ?auto_22081 ) ( not ( = ?auto_22080 ?auto_22081 ) ) ( not ( = ?auto_22080 ?auto_22082 ) ) ( not ( = ?auto_22080 ?auto_22083 ) ) ( not ( = ?auto_22080 ?auto_22084 ) ) ( not ( = ?auto_22080 ?auto_22085 ) ) ( not ( = ?auto_22081 ?auto_22082 ) ) ( not ( = ?auto_22081 ?auto_22083 ) ) ( not ( = ?auto_22081 ?auto_22084 ) ) ( not ( = ?auto_22081 ?auto_22085 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22082 ?auto_22083 ?auto_22084 )
      ( MAKE-4CRATE-VERIFY ?auto_22080 ?auto_22081 ?auto_22082 ?auto_22083 ?auto_22084 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22091 - SURFACE
      ?auto_22092 - SURFACE
      ?auto_22093 - SURFACE
      ?auto_22094 - SURFACE
      ?auto_22095 - SURFACE
      ?auto_22096 - SURFACE
    )
    :vars
    (
      ?auto_22101 - HOIST
      ?auto_22098 - PLACE
      ?auto_22102 - PLACE
      ?auto_22099 - HOIST
      ?auto_22097 - SURFACE
      ?auto_22100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22101 ?auto_22098 ) ( SURFACE-AT ?auto_22095 ?auto_22098 ) ( CLEAR ?auto_22095 ) ( IS-CRATE ?auto_22096 ) ( not ( = ?auto_22095 ?auto_22096 ) ) ( AVAILABLE ?auto_22101 ) ( ON ?auto_22095 ?auto_22094 ) ( not ( = ?auto_22094 ?auto_22095 ) ) ( not ( = ?auto_22094 ?auto_22096 ) ) ( not ( = ?auto_22102 ?auto_22098 ) ) ( HOIST-AT ?auto_22099 ?auto_22102 ) ( not ( = ?auto_22101 ?auto_22099 ) ) ( AVAILABLE ?auto_22099 ) ( SURFACE-AT ?auto_22096 ?auto_22102 ) ( ON ?auto_22096 ?auto_22097 ) ( CLEAR ?auto_22096 ) ( not ( = ?auto_22095 ?auto_22097 ) ) ( not ( = ?auto_22096 ?auto_22097 ) ) ( not ( = ?auto_22094 ?auto_22097 ) ) ( TRUCK-AT ?auto_22100 ?auto_22098 ) ( ON ?auto_22092 ?auto_22091 ) ( ON ?auto_22093 ?auto_22092 ) ( ON ?auto_22094 ?auto_22093 ) ( not ( = ?auto_22091 ?auto_22092 ) ) ( not ( = ?auto_22091 ?auto_22093 ) ) ( not ( = ?auto_22091 ?auto_22094 ) ) ( not ( = ?auto_22091 ?auto_22095 ) ) ( not ( = ?auto_22091 ?auto_22096 ) ) ( not ( = ?auto_22091 ?auto_22097 ) ) ( not ( = ?auto_22092 ?auto_22093 ) ) ( not ( = ?auto_22092 ?auto_22094 ) ) ( not ( = ?auto_22092 ?auto_22095 ) ) ( not ( = ?auto_22092 ?auto_22096 ) ) ( not ( = ?auto_22092 ?auto_22097 ) ) ( not ( = ?auto_22093 ?auto_22094 ) ) ( not ( = ?auto_22093 ?auto_22095 ) ) ( not ( = ?auto_22093 ?auto_22096 ) ) ( not ( = ?auto_22093 ?auto_22097 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22094 ?auto_22095 ?auto_22096 )
      ( MAKE-5CRATE-VERIFY ?auto_22091 ?auto_22092 ?auto_22093 ?auto_22094 ?auto_22095 ?auto_22096 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22103 - SURFACE
      ?auto_22104 - SURFACE
    )
    :vars
    (
      ?auto_22110 - HOIST
      ?auto_22107 - PLACE
      ?auto_22106 - SURFACE
      ?auto_22111 - PLACE
      ?auto_22108 - HOIST
      ?auto_22105 - SURFACE
      ?auto_22109 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22110 ?auto_22107 ) ( IS-CRATE ?auto_22104 ) ( not ( = ?auto_22103 ?auto_22104 ) ) ( not ( = ?auto_22106 ?auto_22103 ) ) ( not ( = ?auto_22106 ?auto_22104 ) ) ( not ( = ?auto_22111 ?auto_22107 ) ) ( HOIST-AT ?auto_22108 ?auto_22111 ) ( not ( = ?auto_22110 ?auto_22108 ) ) ( AVAILABLE ?auto_22108 ) ( SURFACE-AT ?auto_22104 ?auto_22111 ) ( ON ?auto_22104 ?auto_22105 ) ( CLEAR ?auto_22104 ) ( not ( = ?auto_22103 ?auto_22105 ) ) ( not ( = ?auto_22104 ?auto_22105 ) ) ( not ( = ?auto_22106 ?auto_22105 ) ) ( TRUCK-AT ?auto_22109 ?auto_22107 ) ( SURFACE-AT ?auto_22106 ?auto_22107 ) ( CLEAR ?auto_22106 ) ( LIFTING ?auto_22110 ?auto_22103 ) ( IS-CRATE ?auto_22103 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22106 ?auto_22103 )
      ( MAKE-2CRATE ?auto_22106 ?auto_22103 ?auto_22104 )
      ( MAKE-1CRATE-VERIFY ?auto_22103 ?auto_22104 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22112 - SURFACE
      ?auto_22113 - SURFACE
      ?auto_22114 - SURFACE
    )
    :vars
    (
      ?auto_22118 - HOIST
      ?auto_22119 - PLACE
      ?auto_22120 - PLACE
      ?auto_22116 - HOIST
      ?auto_22117 - SURFACE
      ?auto_22115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22118 ?auto_22119 ) ( IS-CRATE ?auto_22114 ) ( not ( = ?auto_22113 ?auto_22114 ) ) ( not ( = ?auto_22112 ?auto_22113 ) ) ( not ( = ?auto_22112 ?auto_22114 ) ) ( not ( = ?auto_22120 ?auto_22119 ) ) ( HOIST-AT ?auto_22116 ?auto_22120 ) ( not ( = ?auto_22118 ?auto_22116 ) ) ( AVAILABLE ?auto_22116 ) ( SURFACE-AT ?auto_22114 ?auto_22120 ) ( ON ?auto_22114 ?auto_22117 ) ( CLEAR ?auto_22114 ) ( not ( = ?auto_22113 ?auto_22117 ) ) ( not ( = ?auto_22114 ?auto_22117 ) ) ( not ( = ?auto_22112 ?auto_22117 ) ) ( TRUCK-AT ?auto_22115 ?auto_22119 ) ( SURFACE-AT ?auto_22112 ?auto_22119 ) ( CLEAR ?auto_22112 ) ( LIFTING ?auto_22118 ?auto_22113 ) ( IS-CRATE ?auto_22113 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22113 ?auto_22114 )
      ( MAKE-2CRATE-VERIFY ?auto_22112 ?auto_22113 ?auto_22114 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22121 - SURFACE
      ?auto_22122 - SURFACE
      ?auto_22123 - SURFACE
      ?auto_22124 - SURFACE
    )
    :vars
    (
      ?auto_22127 - HOIST
      ?auto_22125 - PLACE
      ?auto_22130 - PLACE
      ?auto_22126 - HOIST
      ?auto_22128 - SURFACE
      ?auto_22129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22127 ?auto_22125 ) ( IS-CRATE ?auto_22124 ) ( not ( = ?auto_22123 ?auto_22124 ) ) ( not ( = ?auto_22122 ?auto_22123 ) ) ( not ( = ?auto_22122 ?auto_22124 ) ) ( not ( = ?auto_22130 ?auto_22125 ) ) ( HOIST-AT ?auto_22126 ?auto_22130 ) ( not ( = ?auto_22127 ?auto_22126 ) ) ( AVAILABLE ?auto_22126 ) ( SURFACE-AT ?auto_22124 ?auto_22130 ) ( ON ?auto_22124 ?auto_22128 ) ( CLEAR ?auto_22124 ) ( not ( = ?auto_22123 ?auto_22128 ) ) ( not ( = ?auto_22124 ?auto_22128 ) ) ( not ( = ?auto_22122 ?auto_22128 ) ) ( TRUCK-AT ?auto_22129 ?auto_22125 ) ( SURFACE-AT ?auto_22122 ?auto_22125 ) ( CLEAR ?auto_22122 ) ( LIFTING ?auto_22127 ?auto_22123 ) ( IS-CRATE ?auto_22123 ) ( ON ?auto_22122 ?auto_22121 ) ( not ( = ?auto_22121 ?auto_22122 ) ) ( not ( = ?auto_22121 ?auto_22123 ) ) ( not ( = ?auto_22121 ?auto_22124 ) ) ( not ( = ?auto_22121 ?auto_22128 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22122 ?auto_22123 ?auto_22124 )
      ( MAKE-3CRATE-VERIFY ?auto_22121 ?auto_22122 ?auto_22123 ?auto_22124 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22131 - SURFACE
      ?auto_22132 - SURFACE
      ?auto_22133 - SURFACE
      ?auto_22134 - SURFACE
      ?auto_22135 - SURFACE
    )
    :vars
    (
      ?auto_22138 - HOIST
      ?auto_22136 - PLACE
      ?auto_22141 - PLACE
      ?auto_22137 - HOIST
      ?auto_22139 - SURFACE
      ?auto_22140 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22138 ?auto_22136 ) ( IS-CRATE ?auto_22135 ) ( not ( = ?auto_22134 ?auto_22135 ) ) ( not ( = ?auto_22133 ?auto_22134 ) ) ( not ( = ?auto_22133 ?auto_22135 ) ) ( not ( = ?auto_22141 ?auto_22136 ) ) ( HOIST-AT ?auto_22137 ?auto_22141 ) ( not ( = ?auto_22138 ?auto_22137 ) ) ( AVAILABLE ?auto_22137 ) ( SURFACE-AT ?auto_22135 ?auto_22141 ) ( ON ?auto_22135 ?auto_22139 ) ( CLEAR ?auto_22135 ) ( not ( = ?auto_22134 ?auto_22139 ) ) ( not ( = ?auto_22135 ?auto_22139 ) ) ( not ( = ?auto_22133 ?auto_22139 ) ) ( TRUCK-AT ?auto_22140 ?auto_22136 ) ( SURFACE-AT ?auto_22133 ?auto_22136 ) ( CLEAR ?auto_22133 ) ( LIFTING ?auto_22138 ?auto_22134 ) ( IS-CRATE ?auto_22134 ) ( ON ?auto_22132 ?auto_22131 ) ( ON ?auto_22133 ?auto_22132 ) ( not ( = ?auto_22131 ?auto_22132 ) ) ( not ( = ?auto_22131 ?auto_22133 ) ) ( not ( = ?auto_22131 ?auto_22134 ) ) ( not ( = ?auto_22131 ?auto_22135 ) ) ( not ( = ?auto_22131 ?auto_22139 ) ) ( not ( = ?auto_22132 ?auto_22133 ) ) ( not ( = ?auto_22132 ?auto_22134 ) ) ( not ( = ?auto_22132 ?auto_22135 ) ) ( not ( = ?auto_22132 ?auto_22139 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22133 ?auto_22134 ?auto_22135 )
      ( MAKE-4CRATE-VERIFY ?auto_22131 ?auto_22132 ?auto_22133 ?auto_22134 ?auto_22135 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22142 - SURFACE
      ?auto_22143 - SURFACE
      ?auto_22144 - SURFACE
      ?auto_22145 - SURFACE
      ?auto_22146 - SURFACE
      ?auto_22147 - SURFACE
    )
    :vars
    (
      ?auto_22150 - HOIST
      ?auto_22148 - PLACE
      ?auto_22153 - PLACE
      ?auto_22149 - HOIST
      ?auto_22151 - SURFACE
      ?auto_22152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22150 ?auto_22148 ) ( IS-CRATE ?auto_22147 ) ( not ( = ?auto_22146 ?auto_22147 ) ) ( not ( = ?auto_22145 ?auto_22146 ) ) ( not ( = ?auto_22145 ?auto_22147 ) ) ( not ( = ?auto_22153 ?auto_22148 ) ) ( HOIST-AT ?auto_22149 ?auto_22153 ) ( not ( = ?auto_22150 ?auto_22149 ) ) ( AVAILABLE ?auto_22149 ) ( SURFACE-AT ?auto_22147 ?auto_22153 ) ( ON ?auto_22147 ?auto_22151 ) ( CLEAR ?auto_22147 ) ( not ( = ?auto_22146 ?auto_22151 ) ) ( not ( = ?auto_22147 ?auto_22151 ) ) ( not ( = ?auto_22145 ?auto_22151 ) ) ( TRUCK-AT ?auto_22152 ?auto_22148 ) ( SURFACE-AT ?auto_22145 ?auto_22148 ) ( CLEAR ?auto_22145 ) ( LIFTING ?auto_22150 ?auto_22146 ) ( IS-CRATE ?auto_22146 ) ( ON ?auto_22143 ?auto_22142 ) ( ON ?auto_22144 ?auto_22143 ) ( ON ?auto_22145 ?auto_22144 ) ( not ( = ?auto_22142 ?auto_22143 ) ) ( not ( = ?auto_22142 ?auto_22144 ) ) ( not ( = ?auto_22142 ?auto_22145 ) ) ( not ( = ?auto_22142 ?auto_22146 ) ) ( not ( = ?auto_22142 ?auto_22147 ) ) ( not ( = ?auto_22142 ?auto_22151 ) ) ( not ( = ?auto_22143 ?auto_22144 ) ) ( not ( = ?auto_22143 ?auto_22145 ) ) ( not ( = ?auto_22143 ?auto_22146 ) ) ( not ( = ?auto_22143 ?auto_22147 ) ) ( not ( = ?auto_22143 ?auto_22151 ) ) ( not ( = ?auto_22144 ?auto_22145 ) ) ( not ( = ?auto_22144 ?auto_22146 ) ) ( not ( = ?auto_22144 ?auto_22147 ) ) ( not ( = ?auto_22144 ?auto_22151 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22145 ?auto_22146 ?auto_22147 )
      ( MAKE-5CRATE-VERIFY ?auto_22142 ?auto_22143 ?auto_22144 ?auto_22145 ?auto_22146 ?auto_22147 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22154 - SURFACE
      ?auto_22155 - SURFACE
    )
    :vars
    (
      ?auto_22158 - HOIST
      ?auto_22156 - PLACE
      ?auto_22160 - SURFACE
      ?auto_22162 - PLACE
      ?auto_22157 - HOIST
      ?auto_22159 - SURFACE
      ?auto_22161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22158 ?auto_22156 ) ( IS-CRATE ?auto_22155 ) ( not ( = ?auto_22154 ?auto_22155 ) ) ( not ( = ?auto_22160 ?auto_22154 ) ) ( not ( = ?auto_22160 ?auto_22155 ) ) ( not ( = ?auto_22162 ?auto_22156 ) ) ( HOIST-AT ?auto_22157 ?auto_22162 ) ( not ( = ?auto_22158 ?auto_22157 ) ) ( AVAILABLE ?auto_22157 ) ( SURFACE-AT ?auto_22155 ?auto_22162 ) ( ON ?auto_22155 ?auto_22159 ) ( CLEAR ?auto_22155 ) ( not ( = ?auto_22154 ?auto_22159 ) ) ( not ( = ?auto_22155 ?auto_22159 ) ) ( not ( = ?auto_22160 ?auto_22159 ) ) ( TRUCK-AT ?auto_22161 ?auto_22156 ) ( SURFACE-AT ?auto_22160 ?auto_22156 ) ( CLEAR ?auto_22160 ) ( IS-CRATE ?auto_22154 ) ( AVAILABLE ?auto_22158 ) ( IN ?auto_22154 ?auto_22161 ) )
    :subtasks
    ( ( !UNLOAD ?auto_22158 ?auto_22154 ?auto_22161 ?auto_22156 )
      ( MAKE-2CRATE ?auto_22160 ?auto_22154 ?auto_22155 )
      ( MAKE-1CRATE-VERIFY ?auto_22154 ?auto_22155 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22163 - SURFACE
      ?auto_22164 - SURFACE
      ?auto_22165 - SURFACE
    )
    :vars
    (
      ?auto_22168 - HOIST
      ?auto_22170 - PLACE
      ?auto_22166 - PLACE
      ?auto_22171 - HOIST
      ?auto_22169 - SURFACE
      ?auto_22167 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22168 ?auto_22170 ) ( IS-CRATE ?auto_22165 ) ( not ( = ?auto_22164 ?auto_22165 ) ) ( not ( = ?auto_22163 ?auto_22164 ) ) ( not ( = ?auto_22163 ?auto_22165 ) ) ( not ( = ?auto_22166 ?auto_22170 ) ) ( HOIST-AT ?auto_22171 ?auto_22166 ) ( not ( = ?auto_22168 ?auto_22171 ) ) ( AVAILABLE ?auto_22171 ) ( SURFACE-AT ?auto_22165 ?auto_22166 ) ( ON ?auto_22165 ?auto_22169 ) ( CLEAR ?auto_22165 ) ( not ( = ?auto_22164 ?auto_22169 ) ) ( not ( = ?auto_22165 ?auto_22169 ) ) ( not ( = ?auto_22163 ?auto_22169 ) ) ( TRUCK-AT ?auto_22167 ?auto_22170 ) ( SURFACE-AT ?auto_22163 ?auto_22170 ) ( CLEAR ?auto_22163 ) ( IS-CRATE ?auto_22164 ) ( AVAILABLE ?auto_22168 ) ( IN ?auto_22164 ?auto_22167 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22164 ?auto_22165 )
      ( MAKE-2CRATE-VERIFY ?auto_22163 ?auto_22164 ?auto_22165 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22172 - SURFACE
      ?auto_22173 - SURFACE
      ?auto_22174 - SURFACE
      ?auto_22175 - SURFACE
    )
    :vars
    (
      ?auto_22176 - HOIST
      ?auto_22178 - PLACE
      ?auto_22180 - PLACE
      ?auto_22181 - HOIST
      ?auto_22179 - SURFACE
      ?auto_22177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22176 ?auto_22178 ) ( IS-CRATE ?auto_22175 ) ( not ( = ?auto_22174 ?auto_22175 ) ) ( not ( = ?auto_22173 ?auto_22174 ) ) ( not ( = ?auto_22173 ?auto_22175 ) ) ( not ( = ?auto_22180 ?auto_22178 ) ) ( HOIST-AT ?auto_22181 ?auto_22180 ) ( not ( = ?auto_22176 ?auto_22181 ) ) ( AVAILABLE ?auto_22181 ) ( SURFACE-AT ?auto_22175 ?auto_22180 ) ( ON ?auto_22175 ?auto_22179 ) ( CLEAR ?auto_22175 ) ( not ( = ?auto_22174 ?auto_22179 ) ) ( not ( = ?auto_22175 ?auto_22179 ) ) ( not ( = ?auto_22173 ?auto_22179 ) ) ( TRUCK-AT ?auto_22177 ?auto_22178 ) ( SURFACE-AT ?auto_22173 ?auto_22178 ) ( CLEAR ?auto_22173 ) ( IS-CRATE ?auto_22174 ) ( AVAILABLE ?auto_22176 ) ( IN ?auto_22174 ?auto_22177 ) ( ON ?auto_22173 ?auto_22172 ) ( not ( = ?auto_22172 ?auto_22173 ) ) ( not ( = ?auto_22172 ?auto_22174 ) ) ( not ( = ?auto_22172 ?auto_22175 ) ) ( not ( = ?auto_22172 ?auto_22179 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22173 ?auto_22174 ?auto_22175 )
      ( MAKE-3CRATE-VERIFY ?auto_22172 ?auto_22173 ?auto_22174 ?auto_22175 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22182 - SURFACE
      ?auto_22183 - SURFACE
      ?auto_22184 - SURFACE
      ?auto_22185 - SURFACE
      ?auto_22186 - SURFACE
    )
    :vars
    (
      ?auto_22187 - HOIST
      ?auto_22189 - PLACE
      ?auto_22191 - PLACE
      ?auto_22192 - HOIST
      ?auto_22190 - SURFACE
      ?auto_22188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22187 ?auto_22189 ) ( IS-CRATE ?auto_22186 ) ( not ( = ?auto_22185 ?auto_22186 ) ) ( not ( = ?auto_22184 ?auto_22185 ) ) ( not ( = ?auto_22184 ?auto_22186 ) ) ( not ( = ?auto_22191 ?auto_22189 ) ) ( HOIST-AT ?auto_22192 ?auto_22191 ) ( not ( = ?auto_22187 ?auto_22192 ) ) ( AVAILABLE ?auto_22192 ) ( SURFACE-AT ?auto_22186 ?auto_22191 ) ( ON ?auto_22186 ?auto_22190 ) ( CLEAR ?auto_22186 ) ( not ( = ?auto_22185 ?auto_22190 ) ) ( not ( = ?auto_22186 ?auto_22190 ) ) ( not ( = ?auto_22184 ?auto_22190 ) ) ( TRUCK-AT ?auto_22188 ?auto_22189 ) ( SURFACE-AT ?auto_22184 ?auto_22189 ) ( CLEAR ?auto_22184 ) ( IS-CRATE ?auto_22185 ) ( AVAILABLE ?auto_22187 ) ( IN ?auto_22185 ?auto_22188 ) ( ON ?auto_22183 ?auto_22182 ) ( ON ?auto_22184 ?auto_22183 ) ( not ( = ?auto_22182 ?auto_22183 ) ) ( not ( = ?auto_22182 ?auto_22184 ) ) ( not ( = ?auto_22182 ?auto_22185 ) ) ( not ( = ?auto_22182 ?auto_22186 ) ) ( not ( = ?auto_22182 ?auto_22190 ) ) ( not ( = ?auto_22183 ?auto_22184 ) ) ( not ( = ?auto_22183 ?auto_22185 ) ) ( not ( = ?auto_22183 ?auto_22186 ) ) ( not ( = ?auto_22183 ?auto_22190 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22184 ?auto_22185 ?auto_22186 )
      ( MAKE-4CRATE-VERIFY ?auto_22182 ?auto_22183 ?auto_22184 ?auto_22185 ?auto_22186 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22193 - SURFACE
      ?auto_22194 - SURFACE
      ?auto_22195 - SURFACE
      ?auto_22196 - SURFACE
      ?auto_22197 - SURFACE
      ?auto_22198 - SURFACE
    )
    :vars
    (
      ?auto_22199 - HOIST
      ?auto_22201 - PLACE
      ?auto_22203 - PLACE
      ?auto_22204 - HOIST
      ?auto_22202 - SURFACE
      ?auto_22200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22199 ?auto_22201 ) ( IS-CRATE ?auto_22198 ) ( not ( = ?auto_22197 ?auto_22198 ) ) ( not ( = ?auto_22196 ?auto_22197 ) ) ( not ( = ?auto_22196 ?auto_22198 ) ) ( not ( = ?auto_22203 ?auto_22201 ) ) ( HOIST-AT ?auto_22204 ?auto_22203 ) ( not ( = ?auto_22199 ?auto_22204 ) ) ( AVAILABLE ?auto_22204 ) ( SURFACE-AT ?auto_22198 ?auto_22203 ) ( ON ?auto_22198 ?auto_22202 ) ( CLEAR ?auto_22198 ) ( not ( = ?auto_22197 ?auto_22202 ) ) ( not ( = ?auto_22198 ?auto_22202 ) ) ( not ( = ?auto_22196 ?auto_22202 ) ) ( TRUCK-AT ?auto_22200 ?auto_22201 ) ( SURFACE-AT ?auto_22196 ?auto_22201 ) ( CLEAR ?auto_22196 ) ( IS-CRATE ?auto_22197 ) ( AVAILABLE ?auto_22199 ) ( IN ?auto_22197 ?auto_22200 ) ( ON ?auto_22194 ?auto_22193 ) ( ON ?auto_22195 ?auto_22194 ) ( ON ?auto_22196 ?auto_22195 ) ( not ( = ?auto_22193 ?auto_22194 ) ) ( not ( = ?auto_22193 ?auto_22195 ) ) ( not ( = ?auto_22193 ?auto_22196 ) ) ( not ( = ?auto_22193 ?auto_22197 ) ) ( not ( = ?auto_22193 ?auto_22198 ) ) ( not ( = ?auto_22193 ?auto_22202 ) ) ( not ( = ?auto_22194 ?auto_22195 ) ) ( not ( = ?auto_22194 ?auto_22196 ) ) ( not ( = ?auto_22194 ?auto_22197 ) ) ( not ( = ?auto_22194 ?auto_22198 ) ) ( not ( = ?auto_22194 ?auto_22202 ) ) ( not ( = ?auto_22195 ?auto_22196 ) ) ( not ( = ?auto_22195 ?auto_22197 ) ) ( not ( = ?auto_22195 ?auto_22198 ) ) ( not ( = ?auto_22195 ?auto_22202 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22196 ?auto_22197 ?auto_22198 )
      ( MAKE-5CRATE-VERIFY ?auto_22193 ?auto_22194 ?auto_22195 ?auto_22196 ?auto_22197 ?auto_22198 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22205 - SURFACE
      ?auto_22206 - SURFACE
    )
    :vars
    (
      ?auto_22208 - HOIST
      ?auto_22210 - PLACE
      ?auto_22207 - SURFACE
      ?auto_22212 - PLACE
      ?auto_22213 - HOIST
      ?auto_22211 - SURFACE
      ?auto_22209 - TRUCK
      ?auto_22214 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22208 ?auto_22210 ) ( IS-CRATE ?auto_22206 ) ( not ( = ?auto_22205 ?auto_22206 ) ) ( not ( = ?auto_22207 ?auto_22205 ) ) ( not ( = ?auto_22207 ?auto_22206 ) ) ( not ( = ?auto_22212 ?auto_22210 ) ) ( HOIST-AT ?auto_22213 ?auto_22212 ) ( not ( = ?auto_22208 ?auto_22213 ) ) ( AVAILABLE ?auto_22213 ) ( SURFACE-AT ?auto_22206 ?auto_22212 ) ( ON ?auto_22206 ?auto_22211 ) ( CLEAR ?auto_22206 ) ( not ( = ?auto_22205 ?auto_22211 ) ) ( not ( = ?auto_22206 ?auto_22211 ) ) ( not ( = ?auto_22207 ?auto_22211 ) ) ( SURFACE-AT ?auto_22207 ?auto_22210 ) ( CLEAR ?auto_22207 ) ( IS-CRATE ?auto_22205 ) ( AVAILABLE ?auto_22208 ) ( IN ?auto_22205 ?auto_22209 ) ( TRUCK-AT ?auto_22209 ?auto_22214 ) ( not ( = ?auto_22214 ?auto_22210 ) ) ( not ( = ?auto_22212 ?auto_22214 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22209 ?auto_22214 ?auto_22210 )
      ( MAKE-2CRATE ?auto_22207 ?auto_22205 ?auto_22206 )
      ( MAKE-1CRATE-VERIFY ?auto_22205 ?auto_22206 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22215 - SURFACE
      ?auto_22216 - SURFACE
      ?auto_22217 - SURFACE
    )
    :vars
    (
      ?auto_22220 - HOIST
      ?auto_22219 - PLACE
      ?auto_22218 - PLACE
      ?auto_22221 - HOIST
      ?auto_22223 - SURFACE
      ?auto_22224 - TRUCK
      ?auto_22222 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22220 ?auto_22219 ) ( IS-CRATE ?auto_22217 ) ( not ( = ?auto_22216 ?auto_22217 ) ) ( not ( = ?auto_22215 ?auto_22216 ) ) ( not ( = ?auto_22215 ?auto_22217 ) ) ( not ( = ?auto_22218 ?auto_22219 ) ) ( HOIST-AT ?auto_22221 ?auto_22218 ) ( not ( = ?auto_22220 ?auto_22221 ) ) ( AVAILABLE ?auto_22221 ) ( SURFACE-AT ?auto_22217 ?auto_22218 ) ( ON ?auto_22217 ?auto_22223 ) ( CLEAR ?auto_22217 ) ( not ( = ?auto_22216 ?auto_22223 ) ) ( not ( = ?auto_22217 ?auto_22223 ) ) ( not ( = ?auto_22215 ?auto_22223 ) ) ( SURFACE-AT ?auto_22215 ?auto_22219 ) ( CLEAR ?auto_22215 ) ( IS-CRATE ?auto_22216 ) ( AVAILABLE ?auto_22220 ) ( IN ?auto_22216 ?auto_22224 ) ( TRUCK-AT ?auto_22224 ?auto_22222 ) ( not ( = ?auto_22222 ?auto_22219 ) ) ( not ( = ?auto_22218 ?auto_22222 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22216 ?auto_22217 )
      ( MAKE-2CRATE-VERIFY ?auto_22215 ?auto_22216 ?auto_22217 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22225 - SURFACE
      ?auto_22226 - SURFACE
      ?auto_22227 - SURFACE
      ?auto_22228 - SURFACE
    )
    :vars
    (
      ?auto_22235 - HOIST
      ?auto_22231 - PLACE
      ?auto_22233 - PLACE
      ?auto_22230 - HOIST
      ?auto_22229 - SURFACE
      ?auto_22234 - TRUCK
      ?auto_22232 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22235 ?auto_22231 ) ( IS-CRATE ?auto_22228 ) ( not ( = ?auto_22227 ?auto_22228 ) ) ( not ( = ?auto_22226 ?auto_22227 ) ) ( not ( = ?auto_22226 ?auto_22228 ) ) ( not ( = ?auto_22233 ?auto_22231 ) ) ( HOIST-AT ?auto_22230 ?auto_22233 ) ( not ( = ?auto_22235 ?auto_22230 ) ) ( AVAILABLE ?auto_22230 ) ( SURFACE-AT ?auto_22228 ?auto_22233 ) ( ON ?auto_22228 ?auto_22229 ) ( CLEAR ?auto_22228 ) ( not ( = ?auto_22227 ?auto_22229 ) ) ( not ( = ?auto_22228 ?auto_22229 ) ) ( not ( = ?auto_22226 ?auto_22229 ) ) ( SURFACE-AT ?auto_22226 ?auto_22231 ) ( CLEAR ?auto_22226 ) ( IS-CRATE ?auto_22227 ) ( AVAILABLE ?auto_22235 ) ( IN ?auto_22227 ?auto_22234 ) ( TRUCK-AT ?auto_22234 ?auto_22232 ) ( not ( = ?auto_22232 ?auto_22231 ) ) ( not ( = ?auto_22233 ?auto_22232 ) ) ( ON ?auto_22226 ?auto_22225 ) ( not ( = ?auto_22225 ?auto_22226 ) ) ( not ( = ?auto_22225 ?auto_22227 ) ) ( not ( = ?auto_22225 ?auto_22228 ) ) ( not ( = ?auto_22225 ?auto_22229 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22226 ?auto_22227 ?auto_22228 )
      ( MAKE-3CRATE-VERIFY ?auto_22225 ?auto_22226 ?auto_22227 ?auto_22228 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22236 - SURFACE
      ?auto_22237 - SURFACE
      ?auto_22238 - SURFACE
      ?auto_22239 - SURFACE
      ?auto_22240 - SURFACE
    )
    :vars
    (
      ?auto_22247 - HOIST
      ?auto_22243 - PLACE
      ?auto_22245 - PLACE
      ?auto_22242 - HOIST
      ?auto_22241 - SURFACE
      ?auto_22246 - TRUCK
      ?auto_22244 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22247 ?auto_22243 ) ( IS-CRATE ?auto_22240 ) ( not ( = ?auto_22239 ?auto_22240 ) ) ( not ( = ?auto_22238 ?auto_22239 ) ) ( not ( = ?auto_22238 ?auto_22240 ) ) ( not ( = ?auto_22245 ?auto_22243 ) ) ( HOIST-AT ?auto_22242 ?auto_22245 ) ( not ( = ?auto_22247 ?auto_22242 ) ) ( AVAILABLE ?auto_22242 ) ( SURFACE-AT ?auto_22240 ?auto_22245 ) ( ON ?auto_22240 ?auto_22241 ) ( CLEAR ?auto_22240 ) ( not ( = ?auto_22239 ?auto_22241 ) ) ( not ( = ?auto_22240 ?auto_22241 ) ) ( not ( = ?auto_22238 ?auto_22241 ) ) ( SURFACE-AT ?auto_22238 ?auto_22243 ) ( CLEAR ?auto_22238 ) ( IS-CRATE ?auto_22239 ) ( AVAILABLE ?auto_22247 ) ( IN ?auto_22239 ?auto_22246 ) ( TRUCK-AT ?auto_22246 ?auto_22244 ) ( not ( = ?auto_22244 ?auto_22243 ) ) ( not ( = ?auto_22245 ?auto_22244 ) ) ( ON ?auto_22237 ?auto_22236 ) ( ON ?auto_22238 ?auto_22237 ) ( not ( = ?auto_22236 ?auto_22237 ) ) ( not ( = ?auto_22236 ?auto_22238 ) ) ( not ( = ?auto_22236 ?auto_22239 ) ) ( not ( = ?auto_22236 ?auto_22240 ) ) ( not ( = ?auto_22236 ?auto_22241 ) ) ( not ( = ?auto_22237 ?auto_22238 ) ) ( not ( = ?auto_22237 ?auto_22239 ) ) ( not ( = ?auto_22237 ?auto_22240 ) ) ( not ( = ?auto_22237 ?auto_22241 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22238 ?auto_22239 ?auto_22240 )
      ( MAKE-4CRATE-VERIFY ?auto_22236 ?auto_22237 ?auto_22238 ?auto_22239 ?auto_22240 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22248 - SURFACE
      ?auto_22249 - SURFACE
      ?auto_22250 - SURFACE
      ?auto_22251 - SURFACE
      ?auto_22252 - SURFACE
      ?auto_22253 - SURFACE
    )
    :vars
    (
      ?auto_22260 - HOIST
      ?auto_22256 - PLACE
      ?auto_22258 - PLACE
      ?auto_22255 - HOIST
      ?auto_22254 - SURFACE
      ?auto_22259 - TRUCK
      ?auto_22257 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22260 ?auto_22256 ) ( IS-CRATE ?auto_22253 ) ( not ( = ?auto_22252 ?auto_22253 ) ) ( not ( = ?auto_22251 ?auto_22252 ) ) ( not ( = ?auto_22251 ?auto_22253 ) ) ( not ( = ?auto_22258 ?auto_22256 ) ) ( HOIST-AT ?auto_22255 ?auto_22258 ) ( not ( = ?auto_22260 ?auto_22255 ) ) ( AVAILABLE ?auto_22255 ) ( SURFACE-AT ?auto_22253 ?auto_22258 ) ( ON ?auto_22253 ?auto_22254 ) ( CLEAR ?auto_22253 ) ( not ( = ?auto_22252 ?auto_22254 ) ) ( not ( = ?auto_22253 ?auto_22254 ) ) ( not ( = ?auto_22251 ?auto_22254 ) ) ( SURFACE-AT ?auto_22251 ?auto_22256 ) ( CLEAR ?auto_22251 ) ( IS-CRATE ?auto_22252 ) ( AVAILABLE ?auto_22260 ) ( IN ?auto_22252 ?auto_22259 ) ( TRUCK-AT ?auto_22259 ?auto_22257 ) ( not ( = ?auto_22257 ?auto_22256 ) ) ( not ( = ?auto_22258 ?auto_22257 ) ) ( ON ?auto_22249 ?auto_22248 ) ( ON ?auto_22250 ?auto_22249 ) ( ON ?auto_22251 ?auto_22250 ) ( not ( = ?auto_22248 ?auto_22249 ) ) ( not ( = ?auto_22248 ?auto_22250 ) ) ( not ( = ?auto_22248 ?auto_22251 ) ) ( not ( = ?auto_22248 ?auto_22252 ) ) ( not ( = ?auto_22248 ?auto_22253 ) ) ( not ( = ?auto_22248 ?auto_22254 ) ) ( not ( = ?auto_22249 ?auto_22250 ) ) ( not ( = ?auto_22249 ?auto_22251 ) ) ( not ( = ?auto_22249 ?auto_22252 ) ) ( not ( = ?auto_22249 ?auto_22253 ) ) ( not ( = ?auto_22249 ?auto_22254 ) ) ( not ( = ?auto_22250 ?auto_22251 ) ) ( not ( = ?auto_22250 ?auto_22252 ) ) ( not ( = ?auto_22250 ?auto_22253 ) ) ( not ( = ?auto_22250 ?auto_22254 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22251 ?auto_22252 ?auto_22253 )
      ( MAKE-5CRATE-VERIFY ?auto_22248 ?auto_22249 ?auto_22250 ?auto_22251 ?auto_22252 ?auto_22253 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22261 - SURFACE
      ?auto_22262 - SURFACE
    )
    :vars
    (
      ?auto_22270 - HOIST
      ?auto_22266 - PLACE
      ?auto_22264 - SURFACE
      ?auto_22268 - PLACE
      ?auto_22265 - HOIST
      ?auto_22263 - SURFACE
      ?auto_22269 - TRUCK
      ?auto_22267 - PLACE
      ?auto_22271 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22270 ?auto_22266 ) ( IS-CRATE ?auto_22262 ) ( not ( = ?auto_22261 ?auto_22262 ) ) ( not ( = ?auto_22264 ?auto_22261 ) ) ( not ( = ?auto_22264 ?auto_22262 ) ) ( not ( = ?auto_22268 ?auto_22266 ) ) ( HOIST-AT ?auto_22265 ?auto_22268 ) ( not ( = ?auto_22270 ?auto_22265 ) ) ( AVAILABLE ?auto_22265 ) ( SURFACE-AT ?auto_22262 ?auto_22268 ) ( ON ?auto_22262 ?auto_22263 ) ( CLEAR ?auto_22262 ) ( not ( = ?auto_22261 ?auto_22263 ) ) ( not ( = ?auto_22262 ?auto_22263 ) ) ( not ( = ?auto_22264 ?auto_22263 ) ) ( SURFACE-AT ?auto_22264 ?auto_22266 ) ( CLEAR ?auto_22264 ) ( IS-CRATE ?auto_22261 ) ( AVAILABLE ?auto_22270 ) ( TRUCK-AT ?auto_22269 ?auto_22267 ) ( not ( = ?auto_22267 ?auto_22266 ) ) ( not ( = ?auto_22268 ?auto_22267 ) ) ( HOIST-AT ?auto_22271 ?auto_22267 ) ( LIFTING ?auto_22271 ?auto_22261 ) ( not ( = ?auto_22270 ?auto_22271 ) ) ( not ( = ?auto_22265 ?auto_22271 ) ) )
    :subtasks
    ( ( !LOAD ?auto_22271 ?auto_22261 ?auto_22269 ?auto_22267 )
      ( MAKE-2CRATE ?auto_22264 ?auto_22261 ?auto_22262 )
      ( MAKE-1CRATE-VERIFY ?auto_22261 ?auto_22262 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22272 - SURFACE
      ?auto_22273 - SURFACE
      ?auto_22274 - SURFACE
    )
    :vars
    (
      ?auto_22281 - HOIST
      ?auto_22279 - PLACE
      ?auto_22282 - PLACE
      ?auto_22275 - HOIST
      ?auto_22278 - SURFACE
      ?auto_22280 - TRUCK
      ?auto_22277 - PLACE
      ?auto_22276 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22281 ?auto_22279 ) ( IS-CRATE ?auto_22274 ) ( not ( = ?auto_22273 ?auto_22274 ) ) ( not ( = ?auto_22272 ?auto_22273 ) ) ( not ( = ?auto_22272 ?auto_22274 ) ) ( not ( = ?auto_22282 ?auto_22279 ) ) ( HOIST-AT ?auto_22275 ?auto_22282 ) ( not ( = ?auto_22281 ?auto_22275 ) ) ( AVAILABLE ?auto_22275 ) ( SURFACE-AT ?auto_22274 ?auto_22282 ) ( ON ?auto_22274 ?auto_22278 ) ( CLEAR ?auto_22274 ) ( not ( = ?auto_22273 ?auto_22278 ) ) ( not ( = ?auto_22274 ?auto_22278 ) ) ( not ( = ?auto_22272 ?auto_22278 ) ) ( SURFACE-AT ?auto_22272 ?auto_22279 ) ( CLEAR ?auto_22272 ) ( IS-CRATE ?auto_22273 ) ( AVAILABLE ?auto_22281 ) ( TRUCK-AT ?auto_22280 ?auto_22277 ) ( not ( = ?auto_22277 ?auto_22279 ) ) ( not ( = ?auto_22282 ?auto_22277 ) ) ( HOIST-AT ?auto_22276 ?auto_22277 ) ( LIFTING ?auto_22276 ?auto_22273 ) ( not ( = ?auto_22281 ?auto_22276 ) ) ( not ( = ?auto_22275 ?auto_22276 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22273 ?auto_22274 )
      ( MAKE-2CRATE-VERIFY ?auto_22272 ?auto_22273 ?auto_22274 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22283 - SURFACE
      ?auto_22284 - SURFACE
      ?auto_22285 - SURFACE
      ?auto_22286 - SURFACE
    )
    :vars
    (
      ?auto_22291 - HOIST
      ?auto_22287 - PLACE
      ?auto_22292 - PLACE
      ?auto_22293 - HOIST
      ?auto_22290 - SURFACE
      ?auto_22294 - TRUCK
      ?auto_22289 - PLACE
      ?auto_22288 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22291 ?auto_22287 ) ( IS-CRATE ?auto_22286 ) ( not ( = ?auto_22285 ?auto_22286 ) ) ( not ( = ?auto_22284 ?auto_22285 ) ) ( not ( = ?auto_22284 ?auto_22286 ) ) ( not ( = ?auto_22292 ?auto_22287 ) ) ( HOIST-AT ?auto_22293 ?auto_22292 ) ( not ( = ?auto_22291 ?auto_22293 ) ) ( AVAILABLE ?auto_22293 ) ( SURFACE-AT ?auto_22286 ?auto_22292 ) ( ON ?auto_22286 ?auto_22290 ) ( CLEAR ?auto_22286 ) ( not ( = ?auto_22285 ?auto_22290 ) ) ( not ( = ?auto_22286 ?auto_22290 ) ) ( not ( = ?auto_22284 ?auto_22290 ) ) ( SURFACE-AT ?auto_22284 ?auto_22287 ) ( CLEAR ?auto_22284 ) ( IS-CRATE ?auto_22285 ) ( AVAILABLE ?auto_22291 ) ( TRUCK-AT ?auto_22294 ?auto_22289 ) ( not ( = ?auto_22289 ?auto_22287 ) ) ( not ( = ?auto_22292 ?auto_22289 ) ) ( HOIST-AT ?auto_22288 ?auto_22289 ) ( LIFTING ?auto_22288 ?auto_22285 ) ( not ( = ?auto_22291 ?auto_22288 ) ) ( not ( = ?auto_22293 ?auto_22288 ) ) ( ON ?auto_22284 ?auto_22283 ) ( not ( = ?auto_22283 ?auto_22284 ) ) ( not ( = ?auto_22283 ?auto_22285 ) ) ( not ( = ?auto_22283 ?auto_22286 ) ) ( not ( = ?auto_22283 ?auto_22290 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22284 ?auto_22285 ?auto_22286 )
      ( MAKE-3CRATE-VERIFY ?auto_22283 ?auto_22284 ?auto_22285 ?auto_22286 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22295 - SURFACE
      ?auto_22296 - SURFACE
      ?auto_22297 - SURFACE
      ?auto_22298 - SURFACE
      ?auto_22299 - SURFACE
    )
    :vars
    (
      ?auto_22304 - HOIST
      ?auto_22300 - PLACE
      ?auto_22305 - PLACE
      ?auto_22306 - HOIST
      ?auto_22303 - SURFACE
      ?auto_22307 - TRUCK
      ?auto_22302 - PLACE
      ?auto_22301 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22304 ?auto_22300 ) ( IS-CRATE ?auto_22299 ) ( not ( = ?auto_22298 ?auto_22299 ) ) ( not ( = ?auto_22297 ?auto_22298 ) ) ( not ( = ?auto_22297 ?auto_22299 ) ) ( not ( = ?auto_22305 ?auto_22300 ) ) ( HOIST-AT ?auto_22306 ?auto_22305 ) ( not ( = ?auto_22304 ?auto_22306 ) ) ( AVAILABLE ?auto_22306 ) ( SURFACE-AT ?auto_22299 ?auto_22305 ) ( ON ?auto_22299 ?auto_22303 ) ( CLEAR ?auto_22299 ) ( not ( = ?auto_22298 ?auto_22303 ) ) ( not ( = ?auto_22299 ?auto_22303 ) ) ( not ( = ?auto_22297 ?auto_22303 ) ) ( SURFACE-AT ?auto_22297 ?auto_22300 ) ( CLEAR ?auto_22297 ) ( IS-CRATE ?auto_22298 ) ( AVAILABLE ?auto_22304 ) ( TRUCK-AT ?auto_22307 ?auto_22302 ) ( not ( = ?auto_22302 ?auto_22300 ) ) ( not ( = ?auto_22305 ?auto_22302 ) ) ( HOIST-AT ?auto_22301 ?auto_22302 ) ( LIFTING ?auto_22301 ?auto_22298 ) ( not ( = ?auto_22304 ?auto_22301 ) ) ( not ( = ?auto_22306 ?auto_22301 ) ) ( ON ?auto_22296 ?auto_22295 ) ( ON ?auto_22297 ?auto_22296 ) ( not ( = ?auto_22295 ?auto_22296 ) ) ( not ( = ?auto_22295 ?auto_22297 ) ) ( not ( = ?auto_22295 ?auto_22298 ) ) ( not ( = ?auto_22295 ?auto_22299 ) ) ( not ( = ?auto_22295 ?auto_22303 ) ) ( not ( = ?auto_22296 ?auto_22297 ) ) ( not ( = ?auto_22296 ?auto_22298 ) ) ( not ( = ?auto_22296 ?auto_22299 ) ) ( not ( = ?auto_22296 ?auto_22303 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22297 ?auto_22298 ?auto_22299 )
      ( MAKE-4CRATE-VERIFY ?auto_22295 ?auto_22296 ?auto_22297 ?auto_22298 ?auto_22299 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22308 - SURFACE
      ?auto_22309 - SURFACE
      ?auto_22310 - SURFACE
      ?auto_22311 - SURFACE
      ?auto_22312 - SURFACE
      ?auto_22313 - SURFACE
    )
    :vars
    (
      ?auto_22318 - HOIST
      ?auto_22314 - PLACE
      ?auto_22319 - PLACE
      ?auto_22320 - HOIST
      ?auto_22317 - SURFACE
      ?auto_22321 - TRUCK
      ?auto_22316 - PLACE
      ?auto_22315 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22318 ?auto_22314 ) ( IS-CRATE ?auto_22313 ) ( not ( = ?auto_22312 ?auto_22313 ) ) ( not ( = ?auto_22311 ?auto_22312 ) ) ( not ( = ?auto_22311 ?auto_22313 ) ) ( not ( = ?auto_22319 ?auto_22314 ) ) ( HOIST-AT ?auto_22320 ?auto_22319 ) ( not ( = ?auto_22318 ?auto_22320 ) ) ( AVAILABLE ?auto_22320 ) ( SURFACE-AT ?auto_22313 ?auto_22319 ) ( ON ?auto_22313 ?auto_22317 ) ( CLEAR ?auto_22313 ) ( not ( = ?auto_22312 ?auto_22317 ) ) ( not ( = ?auto_22313 ?auto_22317 ) ) ( not ( = ?auto_22311 ?auto_22317 ) ) ( SURFACE-AT ?auto_22311 ?auto_22314 ) ( CLEAR ?auto_22311 ) ( IS-CRATE ?auto_22312 ) ( AVAILABLE ?auto_22318 ) ( TRUCK-AT ?auto_22321 ?auto_22316 ) ( not ( = ?auto_22316 ?auto_22314 ) ) ( not ( = ?auto_22319 ?auto_22316 ) ) ( HOIST-AT ?auto_22315 ?auto_22316 ) ( LIFTING ?auto_22315 ?auto_22312 ) ( not ( = ?auto_22318 ?auto_22315 ) ) ( not ( = ?auto_22320 ?auto_22315 ) ) ( ON ?auto_22309 ?auto_22308 ) ( ON ?auto_22310 ?auto_22309 ) ( ON ?auto_22311 ?auto_22310 ) ( not ( = ?auto_22308 ?auto_22309 ) ) ( not ( = ?auto_22308 ?auto_22310 ) ) ( not ( = ?auto_22308 ?auto_22311 ) ) ( not ( = ?auto_22308 ?auto_22312 ) ) ( not ( = ?auto_22308 ?auto_22313 ) ) ( not ( = ?auto_22308 ?auto_22317 ) ) ( not ( = ?auto_22309 ?auto_22310 ) ) ( not ( = ?auto_22309 ?auto_22311 ) ) ( not ( = ?auto_22309 ?auto_22312 ) ) ( not ( = ?auto_22309 ?auto_22313 ) ) ( not ( = ?auto_22309 ?auto_22317 ) ) ( not ( = ?auto_22310 ?auto_22311 ) ) ( not ( = ?auto_22310 ?auto_22312 ) ) ( not ( = ?auto_22310 ?auto_22313 ) ) ( not ( = ?auto_22310 ?auto_22317 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22311 ?auto_22312 ?auto_22313 )
      ( MAKE-5CRATE-VERIFY ?auto_22308 ?auto_22309 ?auto_22310 ?auto_22311 ?auto_22312 ?auto_22313 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22322 - SURFACE
      ?auto_22323 - SURFACE
    )
    :vars
    (
      ?auto_22328 - HOIST
      ?auto_22324 - PLACE
      ?auto_22329 - SURFACE
      ?auto_22330 - PLACE
      ?auto_22331 - HOIST
      ?auto_22327 - SURFACE
      ?auto_22332 - TRUCK
      ?auto_22326 - PLACE
      ?auto_22325 - HOIST
      ?auto_22333 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22328 ?auto_22324 ) ( IS-CRATE ?auto_22323 ) ( not ( = ?auto_22322 ?auto_22323 ) ) ( not ( = ?auto_22329 ?auto_22322 ) ) ( not ( = ?auto_22329 ?auto_22323 ) ) ( not ( = ?auto_22330 ?auto_22324 ) ) ( HOIST-AT ?auto_22331 ?auto_22330 ) ( not ( = ?auto_22328 ?auto_22331 ) ) ( AVAILABLE ?auto_22331 ) ( SURFACE-AT ?auto_22323 ?auto_22330 ) ( ON ?auto_22323 ?auto_22327 ) ( CLEAR ?auto_22323 ) ( not ( = ?auto_22322 ?auto_22327 ) ) ( not ( = ?auto_22323 ?auto_22327 ) ) ( not ( = ?auto_22329 ?auto_22327 ) ) ( SURFACE-AT ?auto_22329 ?auto_22324 ) ( CLEAR ?auto_22329 ) ( IS-CRATE ?auto_22322 ) ( AVAILABLE ?auto_22328 ) ( TRUCK-AT ?auto_22332 ?auto_22326 ) ( not ( = ?auto_22326 ?auto_22324 ) ) ( not ( = ?auto_22330 ?auto_22326 ) ) ( HOIST-AT ?auto_22325 ?auto_22326 ) ( not ( = ?auto_22328 ?auto_22325 ) ) ( not ( = ?auto_22331 ?auto_22325 ) ) ( AVAILABLE ?auto_22325 ) ( SURFACE-AT ?auto_22322 ?auto_22326 ) ( ON ?auto_22322 ?auto_22333 ) ( CLEAR ?auto_22322 ) ( not ( = ?auto_22322 ?auto_22333 ) ) ( not ( = ?auto_22323 ?auto_22333 ) ) ( not ( = ?auto_22329 ?auto_22333 ) ) ( not ( = ?auto_22327 ?auto_22333 ) ) )
    :subtasks
    ( ( !LIFT ?auto_22325 ?auto_22322 ?auto_22333 ?auto_22326 )
      ( MAKE-2CRATE ?auto_22329 ?auto_22322 ?auto_22323 )
      ( MAKE-1CRATE-VERIFY ?auto_22322 ?auto_22323 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22334 - SURFACE
      ?auto_22335 - SURFACE
      ?auto_22336 - SURFACE
    )
    :vars
    (
      ?auto_22341 - HOIST
      ?auto_22342 - PLACE
      ?auto_22345 - PLACE
      ?auto_22339 - HOIST
      ?auto_22344 - SURFACE
      ?auto_22340 - TRUCK
      ?auto_22338 - PLACE
      ?auto_22337 - HOIST
      ?auto_22343 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22341 ?auto_22342 ) ( IS-CRATE ?auto_22336 ) ( not ( = ?auto_22335 ?auto_22336 ) ) ( not ( = ?auto_22334 ?auto_22335 ) ) ( not ( = ?auto_22334 ?auto_22336 ) ) ( not ( = ?auto_22345 ?auto_22342 ) ) ( HOIST-AT ?auto_22339 ?auto_22345 ) ( not ( = ?auto_22341 ?auto_22339 ) ) ( AVAILABLE ?auto_22339 ) ( SURFACE-AT ?auto_22336 ?auto_22345 ) ( ON ?auto_22336 ?auto_22344 ) ( CLEAR ?auto_22336 ) ( not ( = ?auto_22335 ?auto_22344 ) ) ( not ( = ?auto_22336 ?auto_22344 ) ) ( not ( = ?auto_22334 ?auto_22344 ) ) ( SURFACE-AT ?auto_22334 ?auto_22342 ) ( CLEAR ?auto_22334 ) ( IS-CRATE ?auto_22335 ) ( AVAILABLE ?auto_22341 ) ( TRUCK-AT ?auto_22340 ?auto_22338 ) ( not ( = ?auto_22338 ?auto_22342 ) ) ( not ( = ?auto_22345 ?auto_22338 ) ) ( HOIST-AT ?auto_22337 ?auto_22338 ) ( not ( = ?auto_22341 ?auto_22337 ) ) ( not ( = ?auto_22339 ?auto_22337 ) ) ( AVAILABLE ?auto_22337 ) ( SURFACE-AT ?auto_22335 ?auto_22338 ) ( ON ?auto_22335 ?auto_22343 ) ( CLEAR ?auto_22335 ) ( not ( = ?auto_22335 ?auto_22343 ) ) ( not ( = ?auto_22336 ?auto_22343 ) ) ( not ( = ?auto_22334 ?auto_22343 ) ) ( not ( = ?auto_22344 ?auto_22343 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22335 ?auto_22336 )
      ( MAKE-2CRATE-VERIFY ?auto_22334 ?auto_22335 ?auto_22336 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22346 - SURFACE
      ?auto_22347 - SURFACE
      ?auto_22348 - SURFACE
      ?auto_22349 - SURFACE
    )
    :vars
    (
      ?auto_22353 - HOIST
      ?auto_22357 - PLACE
      ?auto_22355 - PLACE
      ?auto_22354 - HOIST
      ?auto_22356 - SURFACE
      ?auto_22350 - TRUCK
      ?auto_22352 - PLACE
      ?auto_22358 - HOIST
      ?auto_22351 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22353 ?auto_22357 ) ( IS-CRATE ?auto_22349 ) ( not ( = ?auto_22348 ?auto_22349 ) ) ( not ( = ?auto_22347 ?auto_22348 ) ) ( not ( = ?auto_22347 ?auto_22349 ) ) ( not ( = ?auto_22355 ?auto_22357 ) ) ( HOIST-AT ?auto_22354 ?auto_22355 ) ( not ( = ?auto_22353 ?auto_22354 ) ) ( AVAILABLE ?auto_22354 ) ( SURFACE-AT ?auto_22349 ?auto_22355 ) ( ON ?auto_22349 ?auto_22356 ) ( CLEAR ?auto_22349 ) ( not ( = ?auto_22348 ?auto_22356 ) ) ( not ( = ?auto_22349 ?auto_22356 ) ) ( not ( = ?auto_22347 ?auto_22356 ) ) ( SURFACE-AT ?auto_22347 ?auto_22357 ) ( CLEAR ?auto_22347 ) ( IS-CRATE ?auto_22348 ) ( AVAILABLE ?auto_22353 ) ( TRUCK-AT ?auto_22350 ?auto_22352 ) ( not ( = ?auto_22352 ?auto_22357 ) ) ( not ( = ?auto_22355 ?auto_22352 ) ) ( HOIST-AT ?auto_22358 ?auto_22352 ) ( not ( = ?auto_22353 ?auto_22358 ) ) ( not ( = ?auto_22354 ?auto_22358 ) ) ( AVAILABLE ?auto_22358 ) ( SURFACE-AT ?auto_22348 ?auto_22352 ) ( ON ?auto_22348 ?auto_22351 ) ( CLEAR ?auto_22348 ) ( not ( = ?auto_22348 ?auto_22351 ) ) ( not ( = ?auto_22349 ?auto_22351 ) ) ( not ( = ?auto_22347 ?auto_22351 ) ) ( not ( = ?auto_22356 ?auto_22351 ) ) ( ON ?auto_22347 ?auto_22346 ) ( not ( = ?auto_22346 ?auto_22347 ) ) ( not ( = ?auto_22346 ?auto_22348 ) ) ( not ( = ?auto_22346 ?auto_22349 ) ) ( not ( = ?auto_22346 ?auto_22356 ) ) ( not ( = ?auto_22346 ?auto_22351 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22347 ?auto_22348 ?auto_22349 )
      ( MAKE-3CRATE-VERIFY ?auto_22346 ?auto_22347 ?auto_22348 ?auto_22349 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22359 - SURFACE
      ?auto_22360 - SURFACE
      ?auto_22361 - SURFACE
      ?auto_22362 - SURFACE
      ?auto_22363 - SURFACE
    )
    :vars
    (
      ?auto_22367 - HOIST
      ?auto_22371 - PLACE
      ?auto_22369 - PLACE
      ?auto_22368 - HOIST
      ?auto_22370 - SURFACE
      ?auto_22364 - TRUCK
      ?auto_22366 - PLACE
      ?auto_22372 - HOIST
      ?auto_22365 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22367 ?auto_22371 ) ( IS-CRATE ?auto_22363 ) ( not ( = ?auto_22362 ?auto_22363 ) ) ( not ( = ?auto_22361 ?auto_22362 ) ) ( not ( = ?auto_22361 ?auto_22363 ) ) ( not ( = ?auto_22369 ?auto_22371 ) ) ( HOIST-AT ?auto_22368 ?auto_22369 ) ( not ( = ?auto_22367 ?auto_22368 ) ) ( AVAILABLE ?auto_22368 ) ( SURFACE-AT ?auto_22363 ?auto_22369 ) ( ON ?auto_22363 ?auto_22370 ) ( CLEAR ?auto_22363 ) ( not ( = ?auto_22362 ?auto_22370 ) ) ( not ( = ?auto_22363 ?auto_22370 ) ) ( not ( = ?auto_22361 ?auto_22370 ) ) ( SURFACE-AT ?auto_22361 ?auto_22371 ) ( CLEAR ?auto_22361 ) ( IS-CRATE ?auto_22362 ) ( AVAILABLE ?auto_22367 ) ( TRUCK-AT ?auto_22364 ?auto_22366 ) ( not ( = ?auto_22366 ?auto_22371 ) ) ( not ( = ?auto_22369 ?auto_22366 ) ) ( HOIST-AT ?auto_22372 ?auto_22366 ) ( not ( = ?auto_22367 ?auto_22372 ) ) ( not ( = ?auto_22368 ?auto_22372 ) ) ( AVAILABLE ?auto_22372 ) ( SURFACE-AT ?auto_22362 ?auto_22366 ) ( ON ?auto_22362 ?auto_22365 ) ( CLEAR ?auto_22362 ) ( not ( = ?auto_22362 ?auto_22365 ) ) ( not ( = ?auto_22363 ?auto_22365 ) ) ( not ( = ?auto_22361 ?auto_22365 ) ) ( not ( = ?auto_22370 ?auto_22365 ) ) ( ON ?auto_22360 ?auto_22359 ) ( ON ?auto_22361 ?auto_22360 ) ( not ( = ?auto_22359 ?auto_22360 ) ) ( not ( = ?auto_22359 ?auto_22361 ) ) ( not ( = ?auto_22359 ?auto_22362 ) ) ( not ( = ?auto_22359 ?auto_22363 ) ) ( not ( = ?auto_22359 ?auto_22370 ) ) ( not ( = ?auto_22359 ?auto_22365 ) ) ( not ( = ?auto_22360 ?auto_22361 ) ) ( not ( = ?auto_22360 ?auto_22362 ) ) ( not ( = ?auto_22360 ?auto_22363 ) ) ( not ( = ?auto_22360 ?auto_22370 ) ) ( not ( = ?auto_22360 ?auto_22365 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22361 ?auto_22362 ?auto_22363 )
      ( MAKE-4CRATE-VERIFY ?auto_22359 ?auto_22360 ?auto_22361 ?auto_22362 ?auto_22363 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22373 - SURFACE
      ?auto_22374 - SURFACE
      ?auto_22375 - SURFACE
      ?auto_22376 - SURFACE
      ?auto_22377 - SURFACE
      ?auto_22378 - SURFACE
    )
    :vars
    (
      ?auto_22382 - HOIST
      ?auto_22386 - PLACE
      ?auto_22384 - PLACE
      ?auto_22383 - HOIST
      ?auto_22385 - SURFACE
      ?auto_22379 - TRUCK
      ?auto_22381 - PLACE
      ?auto_22387 - HOIST
      ?auto_22380 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22382 ?auto_22386 ) ( IS-CRATE ?auto_22378 ) ( not ( = ?auto_22377 ?auto_22378 ) ) ( not ( = ?auto_22376 ?auto_22377 ) ) ( not ( = ?auto_22376 ?auto_22378 ) ) ( not ( = ?auto_22384 ?auto_22386 ) ) ( HOIST-AT ?auto_22383 ?auto_22384 ) ( not ( = ?auto_22382 ?auto_22383 ) ) ( AVAILABLE ?auto_22383 ) ( SURFACE-AT ?auto_22378 ?auto_22384 ) ( ON ?auto_22378 ?auto_22385 ) ( CLEAR ?auto_22378 ) ( not ( = ?auto_22377 ?auto_22385 ) ) ( not ( = ?auto_22378 ?auto_22385 ) ) ( not ( = ?auto_22376 ?auto_22385 ) ) ( SURFACE-AT ?auto_22376 ?auto_22386 ) ( CLEAR ?auto_22376 ) ( IS-CRATE ?auto_22377 ) ( AVAILABLE ?auto_22382 ) ( TRUCK-AT ?auto_22379 ?auto_22381 ) ( not ( = ?auto_22381 ?auto_22386 ) ) ( not ( = ?auto_22384 ?auto_22381 ) ) ( HOIST-AT ?auto_22387 ?auto_22381 ) ( not ( = ?auto_22382 ?auto_22387 ) ) ( not ( = ?auto_22383 ?auto_22387 ) ) ( AVAILABLE ?auto_22387 ) ( SURFACE-AT ?auto_22377 ?auto_22381 ) ( ON ?auto_22377 ?auto_22380 ) ( CLEAR ?auto_22377 ) ( not ( = ?auto_22377 ?auto_22380 ) ) ( not ( = ?auto_22378 ?auto_22380 ) ) ( not ( = ?auto_22376 ?auto_22380 ) ) ( not ( = ?auto_22385 ?auto_22380 ) ) ( ON ?auto_22374 ?auto_22373 ) ( ON ?auto_22375 ?auto_22374 ) ( ON ?auto_22376 ?auto_22375 ) ( not ( = ?auto_22373 ?auto_22374 ) ) ( not ( = ?auto_22373 ?auto_22375 ) ) ( not ( = ?auto_22373 ?auto_22376 ) ) ( not ( = ?auto_22373 ?auto_22377 ) ) ( not ( = ?auto_22373 ?auto_22378 ) ) ( not ( = ?auto_22373 ?auto_22385 ) ) ( not ( = ?auto_22373 ?auto_22380 ) ) ( not ( = ?auto_22374 ?auto_22375 ) ) ( not ( = ?auto_22374 ?auto_22376 ) ) ( not ( = ?auto_22374 ?auto_22377 ) ) ( not ( = ?auto_22374 ?auto_22378 ) ) ( not ( = ?auto_22374 ?auto_22385 ) ) ( not ( = ?auto_22374 ?auto_22380 ) ) ( not ( = ?auto_22375 ?auto_22376 ) ) ( not ( = ?auto_22375 ?auto_22377 ) ) ( not ( = ?auto_22375 ?auto_22378 ) ) ( not ( = ?auto_22375 ?auto_22385 ) ) ( not ( = ?auto_22375 ?auto_22380 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22376 ?auto_22377 ?auto_22378 )
      ( MAKE-5CRATE-VERIFY ?auto_22373 ?auto_22374 ?auto_22375 ?auto_22376 ?auto_22377 ?auto_22378 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22388 - SURFACE
      ?auto_22389 - SURFACE
    )
    :vars
    (
      ?auto_22393 - HOIST
      ?auto_22398 - PLACE
      ?auto_22394 - SURFACE
      ?auto_22396 - PLACE
      ?auto_22395 - HOIST
      ?auto_22397 - SURFACE
      ?auto_22392 - PLACE
      ?auto_22399 - HOIST
      ?auto_22391 - SURFACE
      ?auto_22390 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22393 ?auto_22398 ) ( IS-CRATE ?auto_22389 ) ( not ( = ?auto_22388 ?auto_22389 ) ) ( not ( = ?auto_22394 ?auto_22388 ) ) ( not ( = ?auto_22394 ?auto_22389 ) ) ( not ( = ?auto_22396 ?auto_22398 ) ) ( HOIST-AT ?auto_22395 ?auto_22396 ) ( not ( = ?auto_22393 ?auto_22395 ) ) ( AVAILABLE ?auto_22395 ) ( SURFACE-AT ?auto_22389 ?auto_22396 ) ( ON ?auto_22389 ?auto_22397 ) ( CLEAR ?auto_22389 ) ( not ( = ?auto_22388 ?auto_22397 ) ) ( not ( = ?auto_22389 ?auto_22397 ) ) ( not ( = ?auto_22394 ?auto_22397 ) ) ( SURFACE-AT ?auto_22394 ?auto_22398 ) ( CLEAR ?auto_22394 ) ( IS-CRATE ?auto_22388 ) ( AVAILABLE ?auto_22393 ) ( not ( = ?auto_22392 ?auto_22398 ) ) ( not ( = ?auto_22396 ?auto_22392 ) ) ( HOIST-AT ?auto_22399 ?auto_22392 ) ( not ( = ?auto_22393 ?auto_22399 ) ) ( not ( = ?auto_22395 ?auto_22399 ) ) ( AVAILABLE ?auto_22399 ) ( SURFACE-AT ?auto_22388 ?auto_22392 ) ( ON ?auto_22388 ?auto_22391 ) ( CLEAR ?auto_22388 ) ( not ( = ?auto_22388 ?auto_22391 ) ) ( not ( = ?auto_22389 ?auto_22391 ) ) ( not ( = ?auto_22394 ?auto_22391 ) ) ( not ( = ?auto_22397 ?auto_22391 ) ) ( TRUCK-AT ?auto_22390 ?auto_22398 ) )
    :subtasks
    ( ( !DRIVE ?auto_22390 ?auto_22398 ?auto_22392 )
      ( MAKE-2CRATE ?auto_22394 ?auto_22388 ?auto_22389 )
      ( MAKE-1CRATE-VERIFY ?auto_22388 ?auto_22389 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22400 - SURFACE
      ?auto_22401 - SURFACE
      ?auto_22402 - SURFACE
    )
    :vars
    (
      ?auto_22409 - HOIST
      ?auto_22408 - PLACE
      ?auto_22404 - PLACE
      ?auto_22403 - HOIST
      ?auto_22406 - SURFACE
      ?auto_22411 - PLACE
      ?auto_22410 - HOIST
      ?auto_22405 - SURFACE
      ?auto_22407 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22409 ?auto_22408 ) ( IS-CRATE ?auto_22402 ) ( not ( = ?auto_22401 ?auto_22402 ) ) ( not ( = ?auto_22400 ?auto_22401 ) ) ( not ( = ?auto_22400 ?auto_22402 ) ) ( not ( = ?auto_22404 ?auto_22408 ) ) ( HOIST-AT ?auto_22403 ?auto_22404 ) ( not ( = ?auto_22409 ?auto_22403 ) ) ( AVAILABLE ?auto_22403 ) ( SURFACE-AT ?auto_22402 ?auto_22404 ) ( ON ?auto_22402 ?auto_22406 ) ( CLEAR ?auto_22402 ) ( not ( = ?auto_22401 ?auto_22406 ) ) ( not ( = ?auto_22402 ?auto_22406 ) ) ( not ( = ?auto_22400 ?auto_22406 ) ) ( SURFACE-AT ?auto_22400 ?auto_22408 ) ( CLEAR ?auto_22400 ) ( IS-CRATE ?auto_22401 ) ( AVAILABLE ?auto_22409 ) ( not ( = ?auto_22411 ?auto_22408 ) ) ( not ( = ?auto_22404 ?auto_22411 ) ) ( HOIST-AT ?auto_22410 ?auto_22411 ) ( not ( = ?auto_22409 ?auto_22410 ) ) ( not ( = ?auto_22403 ?auto_22410 ) ) ( AVAILABLE ?auto_22410 ) ( SURFACE-AT ?auto_22401 ?auto_22411 ) ( ON ?auto_22401 ?auto_22405 ) ( CLEAR ?auto_22401 ) ( not ( = ?auto_22401 ?auto_22405 ) ) ( not ( = ?auto_22402 ?auto_22405 ) ) ( not ( = ?auto_22400 ?auto_22405 ) ) ( not ( = ?auto_22406 ?auto_22405 ) ) ( TRUCK-AT ?auto_22407 ?auto_22408 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22401 ?auto_22402 )
      ( MAKE-2CRATE-VERIFY ?auto_22400 ?auto_22401 ?auto_22402 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22412 - SURFACE
      ?auto_22413 - SURFACE
      ?auto_22414 - SURFACE
      ?auto_22415 - SURFACE
    )
    :vars
    (
      ?auto_22418 - HOIST
      ?auto_22423 - PLACE
      ?auto_22424 - PLACE
      ?auto_22416 - HOIST
      ?auto_22417 - SURFACE
      ?auto_22422 - PLACE
      ?auto_22419 - HOIST
      ?auto_22421 - SURFACE
      ?auto_22420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22418 ?auto_22423 ) ( IS-CRATE ?auto_22415 ) ( not ( = ?auto_22414 ?auto_22415 ) ) ( not ( = ?auto_22413 ?auto_22414 ) ) ( not ( = ?auto_22413 ?auto_22415 ) ) ( not ( = ?auto_22424 ?auto_22423 ) ) ( HOIST-AT ?auto_22416 ?auto_22424 ) ( not ( = ?auto_22418 ?auto_22416 ) ) ( AVAILABLE ?auto_22416 ) ( SURFACE-AT ?auto_22415 ?auto_22424 ) ( ON ?auto_22415 ?auto_22417 ) ( CLEAR ?auto_22415 ) ( not ( = ?auto_22414 ?auto_22417 ) ) ( not ( = ?auto_22415 ?auto_22417 ) ) ( not ( = ?auto_22413 ?auto_22417 ) ) ( SURFACE-AT ?auto_22413 ?auto_22423 ) ( CLEAR ?auto_22413 ) ( IS-CRATE ?auto_22414 ) ( AVAILABLE ?auto_22418 ) ( not ( = ?auto_22422 ?auto_22423 ) ) ( not ( = ?auto_22424 ?auto_22422 ) ) ( HOIST-AT ?auto_22419 ?auto_22422 ) ( not ( = ?auto_22418 ?auto_22419 ) ) ( not ( = ?auto_22416 ?auto_22419 ) ) ( AVAILABLE ?auto_22419 ) ( SURFACE-AT ?auto_22414 ?auto_22422 ) ( ON ?auto_22414 ?auto_22421 ) ( CLEAR ?auto_22414 ) ( not ( = ?auto_22414 ?auto_22421 ) ) ( not ( = ?auto_22415 ?auto_22421 ) ) ( not ( = ?auto_22413 ?auto_22421 ) ) ( not ( = ?auto_22417 ?auto_22421 ) ) ( TRUCK-AT ?auto_22420 ?auto_22423 ) ( ON ?auto_22413 ?auto_22412 ) ( not ( = ?auto_22412 ?auto_22413 ) ) ( not ( = ?auto_22412 ?auto_22414 ) ) ( not ( = ?auto_22412 ?auto_22415 ) ) ( not ( = ?auto_22412 ?auto_22417 ) ) ( not ( = ?auto_22412 ?auto_22421 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22413 ?auto_22414 ?auto_22415 )
      ( MAKE-3CRATE-VERIFY ?auto_22412 ?auto_22413 ?auto_22414 ?auto_22415 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22425 - SURFACE
      ?auto_22426 - SURFACE
      ?auto_22427 - SURFACE
      ?auto_22428 - SURFACE
      ?auto_22429 - SURFACE
    )
    :vars
    (
      ?auto_22432 - HOIST
      ?auto_22437 - PLACE
      ?auto_22438 - PLACE
      ?auto_22430 - HOIST
      ?auto_22431 - SURFACE
      ?auto_22436 - PLACE
      ?auto_22433 - HOIST
      ?auto_22435 - SURFACE
      ?auto_22434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22432 ?auto_22437 ) ( IS-CRATE ?auto_22429 ) ( not ( = ?auto_22428 ?auto_22429 ) ) ( not ( = ?auto_22427 ?auto_22428 ) ) ( not ( = ?auto_22427 ?auto_22429 ) ) ( not ( = ?auto_22438 ?auto_22437 ) ) ( HOIST-AT ?auto_22430 ?auto_22438 ) ( not ( = ?auto_22432 ?auto_22430 ) ) ( AVAILABLE ?auto_22430 ) ( SURFACE-AT ?auto_22429 ?auto_22438 ) ( ON ?auto_22429 ?auto_22431 ) ( CLEAR ?auto_22429 ) ( not ( = ?auto_22428 ?auto_22431 ) ) ( not ( = ?auto_22429 ?auto_22431 ) ) ( not ( = ?auto_22427 ?auto_22431 ) ) ( SURFACE-AT ?auto_22427 ?auto_22437 ) ( CLEAR ?auto_22427 ) ( IS-CRATE ?auto_22428 ) ( AVAILABLE ?auto_22432 ) ( not ( = ?auto_22436 ?auto_22437 ) ) ( not ( = ?auto_22438 ?auto_22436 ) ) ( HOIST-AT ?auto_22433 ?auto_22436 ) ( not ( = ?auto_22432 ?auto_22433 ) ) ( not ( = ?auto_22430 ?auto_22433 ) ) ( AVAILABLE ?auto_22433 ) ( SURFACE-AT ?auto_22428 ?auto_22436 ) ( ON ?auto_22428 ?auto_22435 ) ( CLEAR ?auto_22428 ) ( not ( = ?auto_22428 ?auto_22435 ) ) ( not ( = ?auto_22429 ?auto_22435 ) ) ( not ( = ?auto_22427 ?auto_22435 ) ) ( not ( = ?auto_22431 ?auto_22435 ) ) ( TRUCK-AT ?auto_22434 ?auto_22437 ) ( ON ?auto_22426 ?auto_22425 ) ( ON ?auto_22427 ?auto_22426 ) ( not ( = ?auto_22425 ?auto_22426 ) ) ( not ( = ?auto_22425 ?auto_22427 ) ) ( not ( = ?auto_22425 ?auto_22428 ) ) ( not ( = ?auto_22425 ?auto_22429 ) ) ( not ( = ?auto_22425 ?auto_22431 ) ) ( not ( = ?auto_22425 ?auto_22435 ) ) ( not ( = ?auto_22426 ?auto_22427 ) ) ( not ( = ?auto_22426 ?auto_22428 ) ) ( not ( = ?auto_22426 ?auto_22429 ) ) ( not ( = ?auto_22426 ?auto_22431 ) ) ( not ( = ?auto_22426 ?auto_22435 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22427 ?auto_22428 ?auto_22429 )
      ( MAKE-4CRATE-VERIFY ?auto_22425 ?auto_22426 ?auto_22427 ?auto_22428 ?auto_22429 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22439 - SURFACE
      ?auto_22440 - SURFACE
      ?auto_22441 - SURFACE
      ?auto_22442 - SURFACE
      ?auto_22443 - SURFACE
      ?auto_22444 - SURFACE
    )
    :vars
    (
      ?auto_22447 - HOIST
      ?auto_22452 - PLACE
      ?auto_22453 - PLACE
      ?auto_22445 - HOIST
      ?auto_22446 - SURFACE
      ?auto_22451 - PLACE
      ?auto_22448 - HOIST
      ?auto_22450 - SURFACE
      ?auto_22449 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22447 ?auto_22452 ) ( IS-CRATE ?auto_22444 ) ( not ( = ?auto_22443 ?auto_22444 ) ) ( not ( = ?auto_22442 ?auto_22443 ) ) ( not ( = ?auto_22442 ?auto_22444 ) ) ( not ( = ?auto_22453 ?auto_22452 ) ) ( HOIST-AT ?auto_22445 ?auto_22453 ) ( not ( = ?auto_22447 ?auto_22445 ) ) ( AVAILABLE ?auto_22445 ) ( SURFACE-AT ?auto_22444 ?auto_22453 ) ( ON ?auto_22444 ?auto_22446 ) ( CLEAR ?auto_22444 ) ( not ( = ?auto_22443 ?auto_22446 ) ) ( not ( = ?auto_22444 ?auto_22446 ) ) ( not ( = ?auto_22442 ?auto_22446 ) ) ( SURFACE-AT ?auto_22442 ?auto_22452 ) ( CLEAR ?auto_22442 ) ( IS-CRATE ?auto_22443 ) ( AVAILABLE ?auto_22447 ) ( not ( = ?auto_22451 ?auto_22452 ) ) ( not ( = ?auto_22453 ?auto_22451 ) ) ( HOIST-AT ?auto_22448 ?auto_22451 ) ( not ( = ?auto_22447 ?auto_22448 ) ) ( not ( = ?auto_22445 ?auto_22448 ) ) ( AVAILABLE ?auto_22448 ) ( SURFACE-AT ?auto_22443 ?auto_22451 ) ( ON ?auto_22443 ?auto_22450 ) ( CLEAR ?auto_22443 ) ( not ( = ?auto_22443 ?auto_22450 ) ) ( not ( = ?auto_22444 ?auto_22450 ) ) ( not ( = ?auto_22442 ?auto_22450 ) ) ( not ( = ?auto_22446 ?auto_22450 ) ) ( TRUCK-AT ?auto_22449 ?auto_22452 ) ( ON ?auto_22440 ?auto_22439 ) ( ON ?auto_22441 ?auto_22440 ) ( ON ?auto_22442 ?auto_22441 ) ( not ( = ?auto_22439 ?auto_22440 ) ) ( not ( = ?auto_22439 ?auto_22441 ) ) ( not ( = ?auto_22439 ?auto_22442 ) ) ( not ( = ?auto_22439 ?auto_22443 ) ) ( not ( = ?auto_22439 ?auto_22444 ) ) ( not ( = ?auto_22439 ?auto_22446 ) ) ( not ( = ?auto_22439 ?auto_22450 ) ) ( not ( = ?auto_22440 ?auto_22441 ) ) ( not ( = ?auto_22440 ?auto_22442 ) ) ( not ( = ?auto_22440 ?auto_22443 ) ) ( not ( = ?auto_22440 ?auto_22444 ) ) ( not ( = ?auto_22440 ?auto_22446 ) ) ( not ( = ?auto_22440 ?auto_22450 ) ) ( not ( = ?auto_22441 ?auto_22442 ) ) ( not ( = ?auto_22441 ?auto_22443 ) ) ( not ( = ?auto_22441 ?auto_22444 ) ) ( not ( = ?auto_22441 ?auto_22446 ) ) ( not ( = ?auto_22441 ?auto_22450 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22442 ?auto_22443 ?auto_22444 )
      ( MAKE-5CRATE-VERIFY ?auto_22439 ?auto_22440 ?auto_22441 ?auto_22442 ?auto_22443 ?auto_22444 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22454 - SURFACE
      ?auto_22455 - SURFACE
    )
    :vars
    (
      ?auto_22458 - HOIST
      ?auto_22464 - PLACE
      ?auto_22459 - SURFACE
      ?auto_22465 - PLACE
      ?auto_22456 - HOIST
      ?auto_22457 - SURFACE
      ?auto_22463 - PLACE
      ?auto_22460 - HOIST
      ?auto_22462 - SURFACE
      ?auto_22461 - TRUCK
      ?auto_22466 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22458 ?auto_22464 ) ( IS-CRATE ?auto_22455 ) ( not ( = ?auto_22454 ?auto_22455 ) ) ( not ( = ?auto_22459 ?auto_22454 ) ) ( not ( = ?auto_22459 ?auto_22455 ) ) ( not ( = ?auto_22465 ?auto_22464 ) ) ( HOIST-AT ?auto_22456 ?auto_22465 ) ( not ( = ?auto_22458 ?auto_22456 ) ) ( AVAILABLE ?auto_22456 ) ( SURFACE-AT ?auto_22455 ?auto_22465 ) ( ON ?auto_22455 ?auto_22457 ) ( CLEAR ?auto_22455 ) ( not ( = ?auto_22454 ?auto_22457 ) ) ( not ( = ?auto_22455 ?auto_22457 ) ) ( not ( = ?auto_22459 ?auto_22457 ) ) ( IS-CRATE ?auto_22454 ) ( not ( = ?auto_22463 ?auto_22464 ) ) ( not ( = ?auto_22465 ?auto_22463 ) ) ( HOIST-AT ?auto_22460 ?auto_22463 ) ( not ( = ?auto_22458 ?auto_22460 ) ) ( not ( = ?auto_22456 ?auto_22460 ) ) ( AVAILABLE ?auto_22460 ) ( SURFACE-AT ?auto_22454 ?auto_22463 ) ( ON ?auto_22454 ?auto_22462 ) ( CLEAR ?auto_22454 ) ( not ( = ?auto_22454 ?auto_22462 ) ) ( not ( = ?auto_22455 ?auto_22462 ) ) ( not ( = ?auto_22459 ?auto_22462 ) ) ( not ( = ?auto_22457 ?auto_22462 ) ) ( TRUCK-AT ?auto_22461 ?auto_22464 ) ( SURFACE-AT ?auto_22466 ?auto_22464 ) ( CLEAR ?auto_22466 ) ( LIFTING ?auto_22458 ?auto_22459 ) ( IS-CRATE ?auto_22459 ) ( not ( = ?auto_22466 ?auto_22459 ) ) ( not ( = ?auto_22454 ?auto_22466 ) ) ( not ( = ?auto_22455 ?auto_22466 ) ) ( not ( = ?auto_22457 ?auto_22466 ) ) ( not ( = ?auto_22462 ?auto_22466 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22466 ?auto_22459 )
      ( MAKE-2CRATE ?auto_22459 ?auto_22454 ?auto_22455 )
      ( MAKE-1CRATE-VERIFY ?auto_22454 ?auto_22455 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22467 - SURFACE
      ?auto_22468 - SURFACE
      ?auto_22469 - SURFACE
    )
    :vars
    (
      ?auto_22474 - HOIST
      ?auto_22475 - PLACE
      ?auto_22479 - PLACE
      ?auto_22477 - HOIST
      ?auto_22476 - SURFACE
      ?auto_22471 - PLACE
      ?auto_22470 - HOIST
      ?auto_22473 - SURFACE
      ?auto_22472 - TRUCK
      ?auto_22478 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22474 ?auto_22475 ) ( IS-CRATE ?auto_22469 ) ( not ( = ?auto_22468 ?auto_22469 ) ) ( not ( = ?auto_22467 ?auto_22468 ) ) ( not ( = ?auto_22467 ?auto_22469 ) ) ( not ( = ?auto_22479 ?auto_22475 ) ) ( HOIST-AT ?auto_22477 ?auto_22479 ) ( not ( = ?auto_22474 ?auto_22477 ) ) ( AVAILABLE ?auto_22477 ) ( SURFACE-AT ?auto_22469 ?auto_22479 ) ( ON ?auto_22469 ?auto_22476 ) ( CLEAR ?auto_22469 ) ( not ( = ?auto_22468 ?auto_22476 ) ) ( not ( = ?auto_22469 ?auto_22476 ) ) ( not ( = ?auto_22467 ?auto_22476 ) ) ( IS-CRATE ?auto_22468 ) ( not ( = ?auto_22471 ?auto_22475 ) ) ( not ( = ?auto_22479 ?auto_22471 ) ) ( HOIST-AT ?auto_22470 ?auto_22471 ) ( not ( = ?auto_22474 ?auto_22470 ) ) ( not ( = ?auto_22477 ?auto_22470 ) ) ( AVAILABLE ?auto_22470 ) ( SURFACE-AT ?auto_22468 ?auto_22471 ) ( ON ?auto_22468 ?auto_22473 ) ( CLEAR ?auto_22468 ) ( not ( = ?auto_22468 ?auto_22473 ) ) ( not ( = ?auto_22469 ?auto_22473 ) ) ( not ( = ?auto_22467 ?auto_22473 ) ) ( not ( = ?auto_22476 ?auto_22473 ) ) ( TRUCK-AT ?auto_22472 ?auto_22475 ) ( SURFACE-AT ?auto_22478 ?auto_22475 ) ( CLEAR ?auto_22478 ) ( LIFTING ?auto_22474 ?auto_22467 ) ( IS-CRATE ?auto_22467 ) ( not ( = ?auto_22478 ?auto_22467 ) ) ( not ( = ?auto_22468 ?auto_22478 ) ) ( not ( = ?auto_22469 ?auto_22478 ) ) ( not ( = ?auto_22476 ?auto_22478 ) ) ( not ( = ?auto_22473 ?auto_22478 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22468 ?auto_22469 )
      ( MAKE-2CRATE-VERIFY ?auto_22467 ?auto_22468 ?auto_22469 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22480 - SURFACE
      ?auto_22481 - SURFACE
      ?auto_22482 - SURFACE
      ?auto_22483 - SURFACE
    )
    :vars
    (
      ?auto_22490 - HOIST
      ?auto_22488 - PLACE
      ?auto_22492 - PLACE
      ?auto_22485 - HOIST
      ?auto_22489 - SURFACE
      ?auto_22487 - PLACE
      ?auto_22491 - HOIST
      ?auto_22484 - SURFACE
      ?auto_22486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22490 ?auto_22488 ) ( IS-CRATE ?auto_22483 ) ( not ( = ?auto_22482 ?auto_22483 ) ) ( not ( = ?auto_22481 ?auto_22482 ) ) ( not ( = ?auto_22481 ?auto_22483 ) ) ( not ( = ?auto_22492 ?auto_22488 ) ) ( HOIST-AT ?auto_22485 ?auto_22492 ) ( not ( = ?auto_22490 ?auto_22485 ) ) ( AVAILABLE ?auto_22485 ) ( SURFACE-AT ?auto_22483 ?auto_22492 ) ( ON ?auto_22483 ?auto_22489 ) ( CLEAR ?auto_22483 ) ( not ( = ?auto_22482 ?auto_22489 ) ) ( not ( = ?auto_22483 ?auto_22489 ) ) ( not ( = ?auto_22481 ?auto_22489 ) ) ( IS-CRATE ?auto_22482 ) ( not ( = ?auto_22487 ?auto_22488 ) ) ( not ( = ?auto_22492 ?auto_22487 ) ) ( HOIST-AT ?auto_22491 ?auto_22487 ) ( not ( = ?auto_22490 ?auto_22491 ) ) ( not ( = ?auto_22485 ?auto_22491 ) ) ( AVAILABLE ?auto_22491 ) ( SURFACE-AT ?auto_22482 ?auto_22487 ) ( ON ?auto_22482 ?auto_22484 ) ( CLEAR ?auto_22482 ) ( not ( = ?auto_22482 ?auto_22484 ) ) ( not ( = ?auto_22483 ?auto_22484 ) ) ( not ( = ?auto_22481 ?auto_22484 ) ) ( not ( = ?auto_22489 ?auto_22484 ) ) ( TRUCK-AT ?auto_22486 ?auto_22488 ) ( SURFACE-AT ?auto_22480 ?auto_22488 ) ( CLEAR ?auto_22480 ) ( LIFTING ?auto_22490 ?auto_22481 ) ( IS-CRATE ?auto_22481 ) ( not ( = ?auto_22480 ?auto_22481 ) ) ( not ( = ?auto_22482 ?auto_22480 ) ) ( not ( = ?auto_22483 ?auto_22480 ) ) ( not ( = ?auto_22489 ?auto_22480 ) ) ( not ( = ?auto_22484 ?auto_22480 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22481 ?auto_22482 ?auto_22483 )
      ( MAKE-3CRATE-VERIFY ?auto_22480 ?auto_22481 ?auto_22482 ?auto_22483 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22493 - SURFACE
      ?auto_22494 - SURFACE
      ?auto_22495 - SURFACE
      ?auto_22496 - SURFACE
      ?auto_22497 - SURFACE
    )
    :vars
    (
      ?auto_22504 - HOIST
      ?auto_22502 - PLACE
      ?auto_22506 - PLACE
      ?auto_22499 - HOIST
      ?auto_22503 - SURFACE
      ?auto_22501 - PLACE
      ?auto_22505 - HOIST
      ?auto_22498 - SURFACE
      ?auto_22500 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22504 ?auto_22502 ) ( IS-CRATE ?auto_22497 ) ( not ( = ?auto_22496 ?auto_22497 ) ) ( not ( = ?auto_22495 ?auto_22496 ) ) ( not ( = ?auto_22495 ?auto_22497 ) ) ( not ( = ?auto_22506 ?auto_22502 ) ) ( HOIST-AT ?auto_22499 ?auto_22506 ) ( not ( = ?auto_22504 ?auto_22499 ) ) ( AVAILABLE ?auto_22499 ) ( SURFACE-AT ?auto_22497 ?auto_22506 ) ( ON ?auto_22497 ?auto_22503 ) ( CLEAR ?auto_22497 ) ( not ( = ?auto_22496 ?auto_22503 ) ) ( not ( = ?auto_22497 ?auto_22503 ) ) ( not ( = ?auto_22495 ?auto_22503 ) ) ( IS-CRATE ?auto_22496 ) ( not ( = ?auto_22501 ?auto_22502 ) ) ( not ( = ?auto_22506 ?auto_22501 ) ) ( HOIST-AT ?auto_22505 ?auto_22501 ) ( not ( = ?auto_22504 ?auto_22505 ) ) ( not ( = ?auto_22499 ?auto_22505 ) ) ( AVAILABLE ?auto_22505 ) ( SURFACE-AT ?auto_22496 ?auto_22501 ) ( ON ?auto_22496 ?auto_22498 ) ( CLEAR ?auto_22496 ) ( not ( = ?auto_22496 ?auto_22498 ) ) ( not ( = ?auto_22497 ?auto_22498 ) ) ( not ( = ?auto_22495 ?auto_22498 ) ) ( not ( = ?auto_22503 ?auto_22498 ) ) ( TRUCK-AT ?auto_22500 ?auto_22502 ) ( SURFACE-AT ?auto_22494 ?auto_22502 ) ( CLEAR ?auto_22494 ) ( LIFTING ?auto_22504 ?auto_22495 ) ( IS-CRATE ?auto_22495 ) ( not ( = ?auto_22494 ?auto_22495 ) ) ( not ( = ?auto_22496 ?auto_22494 ) ) ( not ( = ?auto_22497 ?auto_22494 ) ) ( not ( = ?auto_22503 ?auto_22494 ) ) ( not ( = ?auto_22498 ?auto_22494 ) ) ( ON ?auto_22494 ?auto_22493 ) ( not ( = ?auto_22493 ?auto_22494 ) ) ( not ( = ?auto_22493 ?auto_22495 ) ) ( not ( = ?auto_22493 ?auto_22496 ) ) ( not ( = ?auto_22493 ?auto_22497 ) ) ( not ( = ?auto_22493 ?auto_22503 ) ) ( not ( = ?auto_22493 ?auto_22498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22495 ?auto_22496 ?auto_22497 )
      ( MAKE-4CRATE-VERIFY ?auto_22493 ?auto_22494 ?auto_22495 ?auto_22496 ?auto_22497 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22507 - SURFACE
      ?auto_22508 - SURFACE
      ?auto_22509 - SURFACE
      ?auto_22510 - SURFACE
      ?auto_22511 - SURFACE
      ?auto_22512 - SURFACE
    )
    :vars
    (
      ?auto_22519 - HOIST
      ?auto_22517 - PLACE
      ?auto_22521 - PLACE
      ?auto_22514 - HOIST
      ?auto_22518 - SURFACE
      ?auto_22516 - PLACE
      ?auto_22520 - HOIST
      ?auto_22513 - SURFACE
      ?auto_22515 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22519 ?auto_22517 ) ( IS-CRATE ?auto_22512 ) ( not ( = ?auto_22511 ?auto_22512 ) ) ( not ( = ?auto_22510 ?auto_22511 ) ) ( not ( = ?auto_22510 ?auto_22512 ) ) ( not ( = ?auto_22521 ?auto_22517 ) ) ( HOIST-AT ?auto_22514 ?auto_22521 ) ( not ( = ?auto_22519 ?auto_22514 ) ) ( AVAILABLE ?auto_22514 ) ( SURFACE-AT ?auto_22512 ?auto_22521 ) ( ON ?auto_22512 ?auto_22518 ) ( CLEAR ?auto_22512 ) ( not ( = ?auto_22511 ?auto_22518 ) ) ( not ( = ?auto_22512 ?auto_22518 ) ) ( not ( = ?auto_22510 ?auto_22518 ) ) ( IS-CRATE ?auto_22511 ) ( not ( = ?auto_22516 ?auto_22517 ) ) ( not ( = ?auto_22521 ?auto_22516 ) ) ( HOIST-AT ?auto_22520 ?auto_22516 ) ( not ( = ?auto_22519 ?auto_22520 ) ) ( not ( = ?auto_22514 ?auto_22520 ) ) ( AVAILABLE ?auto_22520 ) ( SURFACE-AT ?auto_22511 ?auto_22516 ) ( ON ?auto_22511 ?auto_22513 ) ( CLEAR ?auto_22511 ) ( not ( = ?auto_22511 ?auto_22513 ) ) ( not ( = ?auto_22512 ?auto_22513 ) ) ( not ( = ?auto_22510 ?auto_22513 ) ) ( not ( = ?auto_22518 ?auto_22513 ) ) ( TRUCK-AT ?auto_22515 ?auto_22517 ) ( SURFACE-AT ?auto_22509 ?auto_22517 ) ( CLEAR ?auto_22509 ) ( LIFTING ?auto_22519 ?auto_22510 ) ( IS-CRATE ?auto_22510 ) ( not ( = ?auto_22509 ?auto_22510 ) ) ( not ( = ?auto_22511 ?auto_22509 ) ) ( not ( = ?auto_22512 ?auto_22509 ) ) ( not ( = ?auto_22518 ?auto_22509 ) ) ( not ( = ?auto_22513 ?auto_22509 ) ) ( ON ?auto_22508 ?auto_22507 ) ( ON ?auto_22509 ?auto_22508 ) ( not ( = ?auto_22507 ?auto_22508 ) ) ( not ( = ?auto_22507 ?auto_22509 ) ) ( not ( = ?auto_22507 ?auto_22510 ) ) ( not ( = ?auto_22507 ?auto_22511 ) ) ( not ( = ?auto_22507 ?auto_22512 ) ) ( not ( = ?auto_22507 ?auto_22518 ) ) ( not ( = ?auto_22507 ?auto_22513 ) ) ( not ( = ?auto_22508 ?auto_22509 ) ) ( not ( = ?auto_22508 ?auto_22510 ) ) ( not ( = ?auto_22508 ?auto_22511 ) ) ( not ( = ?auto_22508 ?auto_22512 ) ) ( not ( = ?auto_22508 ?auto_22518 ) ) ( not ( = ?auto_22508 ?auto_22513 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22510 ?auto_22511 ?auto_22512 )
      ( MAKE-5CRATE-VERIFY ?auto_22507 ?auto_22508 ?auto_22509 ?auto_22510 ?auto_22511 ?auto_22512 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22522 - SURFACE
      ?auto_22523 - SURFACE
    )
    :vars
    (
      ?auto_22532 - HOIST
      ?auto_22529 - PLACE
      ?auto_22530 - SURFACE
      ?auto_22534 - PLACE
      ?auto_22525 - HOIST
      ?auto_22531 - SURFACE
      ?auto_22528 - PLACE
      ?auto_22533 - HOIST
      ?auto_22524 - SURFACE
      ?auto_22527 - TRUCK
      ?auto_22526 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22532 ?auto_22529 ) ( IS-CRATE ?auto_22523 ) ( not ( = ?auto_22522 ?auto_22523 ) ) ( not ( = ?auto_22530 ?auto_22522 ) ) ( not ( = ?auto_22530 ?auto_22523 ) ) ( not ( = ?auto_22534 ?auto_22529 ) ) ( HOIST-AT ?auto_22525 ?auto_22534 ) ( not ( = ?auto_22532 ?auto_22525 ) ) ( AVAILABLE ?auto_22525 ) ( SURFACE-AT ?auto_22523 ?auto_22534 ) ( ON ?auto_22523 ?auto_22531 ) ( CLEAR ?auto_22523 ) ( not ( = ?auto_22522 ?auto_22531 ) ) ( not ( = ?auto_22523 ?auto_22531 ) ) ( not ( = ?auto_22530 ?auto_22531 ) ) ( IS-CRATE ?auto_22522 ) ( not ( = ?auto_22528 ?auto_22529 ) ) ( not ( = ?auto_22534 ?auto_22528 ) ) ( HOIST-AT ?auto_22533 ?auto_22528 ) ( not ( = ?auto_22532 ?auto_22533 ) ) ( not ( = ?auto_22525 ?auto_22533 ) ) ( AVAILABLE ?auto_22533 ) ( SURFACE-AT ?auto_22522 ?auto_22528 ) ( ON ?auto_22522 ?auto_22524 ) ( CLEAR ?auto_22522 ) ( not ( = ?auto_22522 ?auto_22524 ) ) ( not ( = ?auto_22523 ?auto_22524 ) ) ( not ( = ?auto_22530 ?auto_22524 ) ) ( not ( = ?auto_22531 ?auto_22524 ) ) ( TRUCK-AT ?auto_22527 ?auto_22529 ) ( SURFACE-AT ?auto_22526 ?auto_22529 ) ( CLEAR ?auto_22526 ) ( IS-CRATE ?auto_22530 ) ( not ( = ?auto_22526 ?auto_22530 ) ) ( not ( = ?auto_22522 ?auto_22526 ) ) ( not ( = ?auto_22523 ?auto_22526 ) ) ( not ( = ?auto_22531 ?auto_22526 ) ) ( not ( = ?auto_22524 ?auto_22526 ) ) ( AVAILABLE ?auto_22532 ) ( IN ?auto_22530 ?auto_22527 ) )
    :subtasks
    ( ( !UNLOAD ?auto_22532 ?auto_22530 ?auto_22527 ?auto_22529 )
      ( MAKE-2CRATE ?auto_22530 ?auto_22522 ?auto_22523 )
      ( MAKE-1CRATE-VERIFY ?auto_22522 ?auto_22523 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22535 - SURFACE
      ?auto_22536 - SURFACE
      ?auto_22537 - SURFACE
    )
    :vars
    (
      ?auto_22538 - HOIST
      ?auto_22547 - PLACE
      ?auto_22546 - PLACE
      ?auto_22540 - HOIST
      ?auto_22542 - SURFACE
      ?auto_22543 - PLACE
      ?auto_22539 - HOIST
      ?auto_22544 - SURFACE
      ?auto_22541 - TRUCK
      ?auto_22545 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22538 ?auto_22547 ) ( IS-CRATE ?auto_22537 ) ( not ( = ?auto_22536 ?auto_22537 ) ) ( not ( = ?auto_22535 ?auto_22536 ) ) ( not ( = ?auto_22535 ?auto_22537 ) ) ( not ( = ?auto_22546 ?auto_22547 ) ) ( HOIST-AT ?auto_22540 ?auto_22546 ) ( not ( = ?auto_22538 ?auto_22540 ) ) ( AVAILABLE ?auto_22540 ) ( SURFACE-AT ?auto_22537 ?auto_22546 ) ( ON ?auto_22537 ?auto_22542 ) ( CLEAR ?auto_22537 ) ( not ( = ?auto_22536 ?auto_22542 ) ) ( not ( = ?auto_22537 ?auto_22542 ) ) ( not ( = ?auto_22535 ?auto_22542 ) ) ( IS-CRATE ?auto_22536 ) ( not ( = ?auto_22543 ?auto_22547 ) ) ( not ( = ?auto_22546 ?auto_22543 ) ) ( HOIST-AT ?auto_22539 ?auto_22543 ) ( not ( = ?auto_22538 ?auto_22539 ) ) ( not ( = ?auto_22540 ?auto_22539 ) ) ( AVAILABLE ?auto_22539 ) ( SURFACE-AT ?auto_22536 ?auto_22543 ) ( ON ?auto_22536 ?auto_22544 ) ( CLEAR ?auto_22536 ) ( not ( = ?auto_22536 ?auto_22544 ) ) ( not ( = ?auto_22537 ?auto_22544 ) ) ( not ( = ?auto_22535 ?auto_22544 ) ) ( not ( = ?auto_22542 ?auto_22544 ) ) ( TRUCK-AT ?auto_22541 ?auto_22547 ) ( SURFACE-AT ?auto_22545 ?auto_22547 ) ( CLEAR ?auto_22545 ) ( IS-CRATE ?auto_22535 ) ( not ( = ?auto_22545 ?auto_22535 ) ) ( not ( = ?auto_22536 ?auto_22545 ) ) ( not ( = ?auto_22537 ?auto_22545 ) ) ( not ( = ?auto_22542 ?auto_22545 ) ) ( not ( = ?auto_22544 ?auto_22545 ) ) ( AVAILABLE ?auto_22538 ) ( IN ?auto_22535 ?auto_22541 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22536 ?auto_22537 )
      ( MAKE-2CRATE-VERIFY ?auto_22535 ?auto_22536 ?auto_22537 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22548 - SURFACE
      ?auto_22549 - SURFACE
      ?auto_22550 - SURFACE
      ?auto_22551 - SURFACE
    )
    :vars
    (
      ?auto_22556 - HOIST
      ?auto_22554 - PLACE
      ?auto_22560 - PLACE
      ?auto_22555 - HOIST
      ?auto_22553 - SURFACE
      ?auto_22558 - PLACE
      ?auto_22557 - HOIST
      ?auto_22559 - SURFACE
      ?auto_22552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22556 ?auto_22554 ) ( IS-CRATE ?auto_22551 ) ( not ( = ?auto_22550 ?auto_22551 ) ) ( not ( = ?auto_22549 ?auto_22550 ) ) ( not ( = ?auto_22549 ?auto_22551 ) ) ( not ( = ?auto_22560 ?auto_22554 ) ) ( HOIST-AT ?auto_22555 ?auto_22560 ) ( not ( = ?auto_22556 ?auto_22555 ) ) ( AVAILABLE ?auto_22555 ) ( SURFACE-AT ?auto_22551 ?auto_22560 ) ( ON ?auto_22551 ?auto_22553 ) ( CLEAR ?auto_22551 ) ( not ( = ?auto_22550 ?auto_22553 ) ) ( not ( = ?auto_22551 ?auto_22553 ) ) ( not ( = ?auto_22549 ?auto_22553 ) ) ( IS-CRATE ?auto_22550 ) ( not ( = ?auto_22558 ?auto_22554 ) ) ( not ( = ?auto_22560 ?auto_22558 ) ) ( HOIST-AT ?auto_22557 ?auto_22558 ) ( not ( = ?auto_22556 ?auto_22557 ) ) ( not ( = ?auto_22555 ?auto_22557 ) ) ( AVAILABLE ?auto_22557 ) ( SURFACE-AT ?auto_22550 ?auto_22558 ) ( ON ?auto_22550 ?auto_22559 ) ( CLEAR ?auto_22550 ) ( not ( = ?auto_22550 ?auto_22559 ) ) ( not ( = ?auto_22551 ?auto_22559 ) ) ( not ( = ?auto_22549 ?auto_22559 ) ) ( not ( = ?auto_22553 ?auto_22559 ) ) ( TRUCK-AT ?auto_22552 ?auto_22554 ) ( SURFACE-AT ?auto_22548 ?auto_22554 ) ( CLEAR ?auto_22548 ) ( IS-CRATE ?auto_22549 ) ( not ( = ?auto_22548 ?auto_22549 ) ) ( not ( = ?auto_22550 ?auto_22548 ) ) ( not ( = ?auto_22551 ?auto_22548 ) ) ( not ( = ?auto_22553 ?auto_22548 ) ) ( not ( = ?auto_22559 ?auto_22548 ) ) ( AVAILABLE ?auto_22556 ) ( IN ?auto_22549 ?auto_22552 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22549 ?auto_22550 ?auto_22551 )
      ( MAKE-3CRATE-VERIFY ?auto_22548 ?auto_22549 ?auto_22550 ?auto_22551 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22561 - SURFACE
      ?auto_22562 - SURFACE
      ?auto_22563 - SURFACE
      ?auto_22564 - SURFACE
      ?auto_22565 - SURFACE
    )
    :vars
    (
      ?auto_22570 - HOIST
      ?auto_22568 - PLACE
      ?auto_22574 - PLACE
      ?auto_22569 - HOIST
      ?auto_22567 - SURFACE
      ?auto_22572 - PLACE
      ?auto_22571 - HOIST
      ?auto_22573 - SURFACE
      ?auto_22566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22570 ?auto_22568 ) ( IS-CRATE ?auto_22565 ) ( not ( = ?auto_22564 ?auto_22565 ) ) ( not ( = ?auto_22563 ?auto_22564 ) ) ( not ( = ?auto_22563 ?auto_22565 ) ) ( not ( = ?auto_22574 ?auto_22568 ) ) ( HOIST-AT ?auto_22569 ?auto_22574 ) ( not ( = ?auto_22570 ?auto_22569 ) ) ( AVAILABLE ?auto_22569 ) ( SURFACE-AT ?auto_22565 ?auto_22574 ) ( ON ?auto_22565 ?auto_22567 ) ( CLEAR ?auto_22565 ) ( not ( = ?auto_22564 ?auto_22567 ) ) ( not ( = ?auto_22565 ?auto_22567 ) ) ( not ( = ?auto_22563 ?auto_22567 ) ) ( IS-CRATE ?auto_22564 ) ( not ( = ?auto_22572 ?auto_22568 ) ) ( not ( = ?auto_22574 ?auto_22572 ) ) ( HOIST-AT ?auto_22571 ?auto_22572 ) ( not ( = ?auto_22570 ?auto_22571 ) ) ( not ( = ?auto_22569 ?auto_22571 ) ) ( AVAILABLE ?auto_22571 ) ( SURFACE-AT ?auto_22564 ?auto_22572 ) ( ON ?auto_22564 ?auto_22573 ) ( CLEAR ?auto_22564 ) ( not ( = ?auto_22564 ?auto_22573 ) ) ( not ( = ?auto_22565 ?auto_22573 ) ) ( not ( = ?auto_22563 ?auto_22573 ) ) ( not ( = ?auto_22567 ?auto_22573 ) ) ( TRUCK-AT ?auto_22566 ?auto_22568 ) ( SURFACE-AT ?auto_22562 ?auto_22568 ) ( CLEAR ?auto_22562 ) ( IS-CRATE ?auto_22563 ) ( not ( = ?auto_22562 ?auto_22563 ) ) ( not ( = ?auto_22564 ?auto_22562 ) ) ( not ( = ?auto_22565 ?auto_22562 ) ) ( not ( = ?auto_22567 ?auto_22562 ) ) ( not ( = ?auto_22573 ?auto_22562 ) ) ( AVAILABLE ?auto_22570 ) ( IN ?auto_22563 ?auto_22566 ) ( ON ?auto_22562 ?auto_22561 ) ( not ( = ?auto_22561 ?auto_22562 ) ) ( not ( = ?auto_22561 ?auto_22563 ) ) ( not ( = ?auto_22561 ?auto_22564 ) ) ( not ( = ?auto_22561 ?auto_22565 ) ) ( not ( = ?auto_22561 ?auto_22567 ) ) ( not ( = ?auto_22561 ?auto_22573 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22563 ?auto_22564 ?auto_22565 )
      ( MAKE-4CRATE-VERIFY ?auto_22561 ?auto_22562 ?auto_22563 ?auto_22564 ?auto_22565 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22575 - SURFACE
      ?auto_22576 - SURFACE
      ?auto_22577 - SURFACE
      ?auto_22578 - SURFACE
      ?auto_22579 - SURFACE
      ?auto_22580 - SURFACE
    )
    :vars
    (
      ?auto_22585 - HOIST
      ?auto_22583 - PLACE
      ?auto_22589 - PLACE
      ?auto_22584 - HOIST
      ?auto_22582 - SURFACE
      ?auto_22587 - PLACE
      ?auto_22586 - HOIST
      ?auto_22588 - SURFACE
      ?auto_22581 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22585 ?auto_22583 ) ( IS-CRATE ?auto_22580 ) ( not ( = ?auto_22579 ?auto_22580 ) ) ( not ( = ?auto_22578 ?auto_22579 ) ) ( not ( = ?auto_22578 ?auto_22580 ) ) ( not ( = ?auto_22589 ?auto_22583 ) ) ( HOIST-AT ?auto_22584 ?auto_22589 ) ( not ( = ?auto_22585 ?auto_22584 ) ) ( AVAILABLE ?auto_22584 ) ( SURFACE-AT ?auto_22580 ?auto_22589 ) ( ON ?auto_22580 ?auto_22582 ) ( CLEAR ?auto_22580 ) ( not ( = ?auto_22579 ?auto_22582 ) ) ( not ( = ?auto_22580 ?auto_22582 ) ) ( not ( = ?auto_22578 ?auto_22582 ) ) ( IS-CRATE ?auto_22579 ) ( not ( = ?auto_22587 ?auto_22583 ) ) ( not ( = ?auto_22589 ?auto_22587 ) ) ( HOIST-AT ?auto_22586 ?auto_22587 ) ( not ( = ?auto_22585 ?auto_22586 ) ) ( not ( = ?auto_22584 ?auto_22586 ) ) ( AVAILABLE ?auto_22586 ) ( SURFACE-AT ?auto_22579 ?auto_22587 ) ( ON ?auto_22579 ?auto_22588 ) ( CLEAR ?auto_22579 ) ( not ( = ?auto_22579 ?auto_22588 ) ) ( not ( = ?auto_22580 ?auto_22588 ) ) ( not ( = ?auto_22578 ?auto_22588 ) ) ( not ( = ?auto_22582 ?auto_22588 ) ) ( TRUCK-AT ?auto_22581 ?auto_22583 ) ( SURFACE-AT ?auto_22577 ?auto_22583 ) ( CLEAR ?auto_22577 ) ( IS-CRATE ?auto_22578 ) ( not ( = ?auto_22577 ?auto_22578 ) ) ( not ( = ?auto_22579 ?auto_22577 ) ) ( not ( = ?auto_22580 ?auto_22577 ) ) ( not ( = ?auto_22582 ?auto_22577 ) ) ( not ( = ?auto_22588 ?auto_22577 ) ) ( AVAILABLE ?auto_22585 ) ( IN ?auto_22578 ?auto_22581 ) ( ON ?auto_22576 ?auto_22575 ) ( ON ?auto_22577 ?auto_22576 ) ( not ( = ?auto_22575 ?auto_22576 ) ) ( not ( = ?auto_22575 ?auto_22577 ) ) ( not ( = ?auto_22575 ?auto_22578 ) ) ( not ( = ?auto_22575 ?auto_22579 ) ) ( not ( = ?auto_22575 ?auto_22580 ) ) ( not ( = ?auto_22575 ?auto_22582 ) ) ( not ( = ?auto_22575 ?auto_22588 ) ) ( not ( = ?auto_22576 ?auto_22577 ) ) ( not ( = ?auto_22576 ?auto_22578 ) ) ( not ( = ?auto_22576 ?auto_22579 ) ) ( not ( = ?auto_22576 ?auto_22580 ) ) ( not ( = ?auto_22576 ?auto_22582 ) ) ( not ( = ?auto_22576 ?auto_22588 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22578 ?auto_22579 ?auto_22580 )
      ( MAKE-5CRATE-VERIFY ?auto_22575 ?auto_22576 ?auto_22577 ?auto_22578 ?auto_22579 ?auto_22580 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22590 - SURFACE
      ?auto_22591 - SURFACE
    )
    :vars
    (
      ?auto_22597 - HOIST
      ?auto_22594 - PLACE
      ?auto_22596 - SURFACE
      ?auto_22602 - PLACE
      ?auto_22595 - HOIST
      ?auto_22593 - SURFACE
      ?auto_22599 - PLACE
      ?auto_22598 - HOIST
      ?auto_22601 - SURFACE
      ?auto_22600 - SURFACE
      ?auto_22592 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22597 ?auto_22594 ) ( IS-CRATE ?auto_22591 ) ( not ( = ?auto_22590 ?auto_22591 ) ) ( not ( = ?auto_22596 ?auto_22590 ) ) ( not ( = ?auto_22596 ?auto_22591 ) ) ( not ( = ?auto_22602 ?auto_22594 ) ) ( HOIST-AT ?auto_22595 ?auto_22602 ) ( not ( = ?auto_22597 ?auto_22595 ) ) ( AVAILABLE ?auto_22595 ) ( SURFACE-AT ?auto_22591 ?auto_22602 ) ( ON ?auto_22591 ?auto_22593 ) ( CLEAR ?auto_22591 ) ( not ( = ?auto_22590 ?auto_22593 ) ) ( not ( = ?auto_22591 ?auto_22593 ) ) ( not ( = ?auto_22596 ?auto_22593 ) ) ( IS-CRATE ?auto_22590 ) ( not ( = ?auto_22599 ?auto_22594 ) ) ( not ( = ?auto_22602 ?auto_22599 ) ) ( HOIST-AT ?auto_22598 ?auto_22599 ) ( not ( = ?auto_22597 ?auto_22598 ) ) ( not ( = ?auto_22595 ?auto_22598 ) ) ( AVAILABLE ?auto_22598 ) ( SURFACE-AT ?auto_22590 ?auto_22599 ) ( ON ?auto_22590 ?auto_22601 ) ( CLEAR ?auto_22590 ) ( not ( = ?auto_22590 ?auto_22601 ) ) ( not ( = ?auto_22591 ?auto_22601 ) ) ( not ( = ?auto_22596 ?auto_22601 ) ) ( not ( = ?auto_22593 ?auto_22601 ) ) ( SURFACE-AT ?auto_22600 ?auto_22594 ) ( CLEAR ?auto_22600 ) ( IS-CRATE ?auto_22596 ) ( not ( = ?auto_22600 ?auto_22596 ) ) ( not ( = ?auto_22590 ?auto_22600 ) ) ( not ( = ?auto_22591 ?auto_22600 ) ) ( not ( = ?auto_22593 ?auto_22600 ) ) ( not ( = ?auto_22601 ?auto_22600 ) ) ( AVAILABLE ?auto_22597 ) ( IN ?auto_22596 ?auto_22592 ) ( TRUCK-AT ?auto_22592 ?auto_22602 ) )
    :subtasks
    ( ( !DRIVE ?auto_22592 ?auto_22602 ?auto_22594 )
      ( MAKE-2CRATE ?auto_22596 ?auto_22590 ?auto_22591 )
      ( MAKE-1CRATE-VERIFY ?auto_22590 ?auto_22591 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22603 - SURFACE
      ?auto_22604 - SURFACE
      ?auto_22605 - SURFACE
    )
    :vars
    (
      ?auto_22610 - HOIST
      ?auto_22613 - PLACE
      ?auto_22607 - PLACE
      ?auto_22614 - HOIST
      ?auto_22612 - SURFACE
      ?auto_22611 - PLACE
      ?auto_22609 - HOIST
      ?auto_22608 - SURFACE
      ?auto_22606 - SURFACE
      ?auto_22615 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22610 ?auto_22613 ) ( IS-CRATE ?auto_22605 ) ( not ( = ?auto_22604 ?auto_22605 ) ) ( not ( = ?auto_22603 ?auto_22604 ) ) ( not ( = ?auto_22603 ?auto_22605 ) ) ( not ( = ?auto_22607 ?auto_22613 ) ) ( HOIST-AT ?auto_22614 ?auto_22607 ) ( not ( = ?auto_22610 ?auto_22614 ) ) ( AVAILABLE ?auto_22614 ) ( SURFACE-AT ?auto_22605 ?auto_22607 ) ( ON ?auto_22605 ?auto_22612 ) ( CLEAR ?auto_22605 ) ( not ( = ?auto_22604 ?auto_22612 ) ) ( not ( = ?auto_22605 ?auto_22612 ) ) ( not ( = ?auto_22603 ?auto_22612 ) ) ( IS-CRATE ?auto_22604 ) ( not ( = ?auto_22611 ?auto_22613 ) ) ( not ( = ?auto_22607 ?auto_22611 ) ) ( HOIST-AT ?auto_22609 ?auto_22611 ) ( not ( = ?auto_22610 ?auto_22609 ) ) ( not ( = ?auto_22614 ?auto_22609 ) ) ( AVAILABLE ?auto_22609 ) ( SURFACE-AT ?auto_22604 ?auto_22611 ) ( ON ?auto_22604 ?auto_22608 ) ( CLEAR ?auto_22604 ) ( not ( = ?auto_22604 ?auto_22608 ) ) ( not ( = ?auto_22605 ?auto_22608 ) ) ( not ( = ?auto_22603 ?auto_22608 ) ) ( not ( = ?auto_22612 ?auto_22608 ) ) ( SURFACE-AT ?auto_22606 ?auto_22613 ) ( CLEAR ?auto_22606 ) ( IS-CRATE ?auto_22603 ) ( not ( = ?auto_22606 ?auto_22603 ) ) ( not ( = ?auto_22604 ?auto_22606 ) ) ( not ( = ?auto_22605 ?auto_22606 ) ) ( not ( = ?auto_22612 ?auto_22606 ) ) ( not ( = ?auto_22608 ?auto_22606 ) ) ( AVAILABLE ?auto_22610 ) ( IN ?auto_22603 ?auto_22615 ) ( TRUCK-AT ?auto_22615 ?auto_22607 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22604 ?auto_22605 )
      ( MAKE-2CRATE-VERIFY ?auto_22603 ?auto_22604 ?auto_22605 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22616 - SURFACE
      ?auto_22617 - SURFACE
      ?auto_22618 - SURFACE
      ?auto_22619 - SURFACE
    )
    :vars
    (
      ?auto_22620 - HOIST
      ?auto_22624 - PLACE
      ?auto_22623 - PLACE
      ?auto_22628 - HOIST
      ?auto_22621 - SURFACE
      ?auto_22625 - PLACE
      ?auto_22626 - HOIST
      ?auto_22627 - SURFACE
      ?auto_22622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22620 ?auto_22624 ) ( IS-CRATE ?auto_22619 ) ( not ( = ?auto_22618 ?auto_22619 ) ) ( not ( = ?auto_22617 ?auto_22618 ) ) ( not ( = ?auto_22617 ?auto_22619 ) ) ( not ( = ?auto_22623 ?auto_22624 ) ) ( HOIST-AT ?auto_22628 ?auto_22623 ) ( not ( = ?auto_22620 ?auto_22628 ) ) ( AVAILABLE ?auto_22628 ) ( SURFACE-AT ?auto_22619 ?auto_22623 ) ( ON ?auto_22619 ?auto_22621 ) ( CLEAR ?auto_22619 ) ( not ( = ?auto_22618 ?auto_22621 ) ) ( not ( = ?auto_22619 ?auto_22621 ) ) ( not ( = ?auto_22617 ?auto_22621 ) ) ( IS-CRATE ?auto_22618 ) ( not ( = ?auto_22625 ?auto_22624 ) ) ( not ( = ?auto_22623 ?auto_22625 ) ) ( HOIST-AT ?auto_22626 ?auto_22625 ) ( not ( = ?auto_22620 ?auto_22626 ) ) ( not ( = ?auto_22628 ?auto_22626 ) ) ( AVAILABLE ?auto_22626 ) ( SURFACE-AT ?auto_22618 ?auto_22625 ) ( ON ?auto_22618 ?auto_22627 ) ( CLEAR ?auto_22618 ) ( not ( = ?auto_22618 ?auto_22627 ) ) ( not ( = ?auto_22619 ?auto_22627 ) ) ( not ( = ?auto_22617 ?auto_22627 ) ) ( not ( = ?auto_22621 ?auto_22627 ) ) ( SURFACE-AT ?auto_22616 ?auto_22624 ) ( CLEAR ?auto_22616 ) ( IS-CRATE ?auto_22617 ) ( not ( = ?auto_22616 ?auto_22617 ) ) ( not ( = ?auto_22618 ?auto_22616 ) ) ( not ( = ?auto_22619 ?auto_22616 ) ) ( not ( = ?auto_22621 ?auto_22616 ) ) ( not ( = ?auto_22627 ?auto_22616 ) ) ( AVAILABLE ?auto_22620 ) ( IN ?auto_22617 ?auto_22622 ) ( TRUCK-AT ?auto_22622 ?auto_22623 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22617 ?auto_22618 ?auto_22619 )
      ( MAKE-3CRATE-VERIFY ?auto_22616 ?auto_22617 ?auto_22618 ?auto_22619 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22629 - SURFACE
      ?auto_22630 - SURFACE
      ?auto_22631 - SURFACE
      ?auto_22632 - SURFACE
      ?auto_22633 - SURFACE
    )
    :vars
    (
      ?auto_22634 - HOIST
      ?auto_22638 - PLACE
      ?auto_22637 - PLACE
      ?auto_22642 - HOIST
      ?auto_22635 - SURFACE
      ?auto_22639 - PLACE
      ?auto_22640 - HOIST
      ?auto_22641 - SURFACE
      ?auto_22636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22634 ?auto_22638 ) ( IS-CRATE ?auto_22633 ) ( not ( = ?auto_22632 ?auto_22633 ) ) ( not ( = ?auto_22631 ?auto_22632 ) ) ( not ( = ?auto_22631 ?auto_22633 ) ) ( not ( = ?auto_22637 ?auto_22638 ) ) ( HOIST-AT ?auto_22642 ?auto_22637 ) ( not ( = ?auto_22634 ?auto_22642 ) ) ( AVAILABLE ?auto_22642 ) ( SURFACE-AT ?auto_22633 ?auto_22637 ) ( ON ?auto_22633 ?auto_22635 ) ( CLEAR ?auto_22633 ) ( not ( = ?auto_22632 ?auto_22635 ) ) ( not ( = ?auto_22633 ?auto_22635 ) ) ( not ( = ?auto_22631 ?auto_22635 ) ) ( IS-CRATE ?auto_22632 ) ( not ( = ?auto_22639 ?auto_22638 ) ) ( not ( = ?auto_22637 ?auto_22639 ) ) ( HOIST-AT ?auto_22640 ?auto_22639 ) ( not ( = ?auto_22634 ?auto_22640 ) ) ( not ( = ?auto_22642 ?auto_22640 ) ) ( AVAILABLE ?auto_22640 ) ( SURFACE-AT ?auto_22632 ?auto_22639 ) ( ON ?auto_22632 ?auto_22641 ) ( CLEAR ?auto_22632 ) ( not ( = ?auto_22632 ?auto_22641 ) ) ( not ( = ?auto_22633 ?auto_22641 ) ) ( not ( = ?auto_22631 ?auto_22641 ) ) ( not ( = ?auto_22635 ?auto_22641 ) ) ( SURFACE-AT ?auto_22630 ?auto_22638 ) ( CLEAR ?auto_22630 ) ( IS-CRATE ?auto_22631 ) ( not ( = ?auto_22630 ?auto_22631 ) ) ( not ( = ?auto_22632 ?auto_22630 ) ) ( not ( = ?auto_22633 ?auto_22630 ) ) ( not ( = ?auto_22635 ?auto_22630 ) ) ( not ( = ?auto_22641 ?auto_22630 ) ) ( AVAILABLE ?auto_22634 ) ( IN ?auto_22631 ?auto_22636 ) ( TRUCK-AT ?auto_22636 ?auto_22637 ) ( ON ?auto_22630 ?auto_22629 ) ( not ( = ?auto_22629 ?auto_22630 ) ) ( not ( = ?auto_22629 ?auto_22631 ) ) ( not ( = ?auto_22629 ?auto_22632 ) ) ( not ( = ?auto_22629 ?auto_22633 ) ) ( not ( = ?auto_22629 ?auto_22635 ) ) ( not ( = ?auto_22629 ?auto_22641 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22631 ?auto_22632 ?auto_22633 )
      ( MAKE-4CRATE-VERIFY ?auto_22629 ?auto_22630 ?auto_22631 ?auto_22632 ?auto_22633 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22643 - SURFACE
      ?auto_22644 - SURFACE
      ?auto_22645 - SURFACE
      ?auto_22646 - SURFACE
      ?auto_22647 - SURFACE
      ?auto_22648 - SURFACE
    )
    :vars
    (
      ?auto_22649 - HOIST
      ?auto_22653 - PLACE
      ?auto_22652 - PLACE
      ?auto_22657 - HOIST
      ?auto_22650 - SURFACE
      ?auto_22654 - PLACE
      ?auto_22655 - HOIST
      ?auto_22656 - SURFACE
      ?auto_22651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22649 ?auto_22653 ) ( IS-CRATE ?auto_22648 ) ( not ( = ?auto_22647 ?auto_22648 ) ) ( not ( = ?auto_22646 ?auto_22647 ) ) ( not ( = ?auto_22646 ?auto_22648 ) ) ( not ( = ?auto_22652 ?auto_22653 ) ) ( HOIST-AT ?auto_22657 ?auto_22652 ) ( not ( = ?auto_22649 ?auto_22657 ) ) ( AVAILABLE ?auto_22657 ) ( SURFACE-AT ?auto_22648 ?auto_22652 ) ( ON ?auto_22648 ?auto_22650 ) ( CLEAR ?auto_22648 ) ( not ( = ?auto_22647 ?auto_22650 ) ) ( not ( = ?auto_22648 ?auto_22650 ) ) ( not ( = ?auto_22646 ?auto_22650 ) ) ( IS-CRATE ?auto_22647 ) ( not ( = ?auto_22654 ?auto_22653 ) ) ( not ( = ?auto_22652 ?auto_22654 ) ) ( HOIST-AT ?auto_22655 ?auto_22654 ) ( not ( = ?auto_22649 ?auto_22655 ) ) ( not ( = ?auto_22657 ?auto_22655 ) ) ( AVAILABLE ?auto_22655 ) ( SURFACE-AT ?auto_22647 ?auto_22654 ) ( ON ?auto_22647 ?auto_22656 ) ( CLEAR ?auto_22647 ) ( not ( = ?auto_22647 ?auto_22656 ) ) ( not ( = ?auto_22648 ?auto_22656 ) ) ( not ( = ?auto_22646 ?auto_22656 ) ) ( not ( = ?auto_22650 ?auto_22656 ) ) ( SURFACE-AT ?auto_22645 ?auto_22653 ) ( CLEAR ?auto_22645 ) ( IS-CRATE ?auto_22646 ) ( not ( = ?auto_22645 ?auto_22646 ) ) ( not ( = ?auto_22647 ?auto_22645 ) ) ( not ( = ?auto_22648 ?auto_22645 ) ) ( not ( = ?auto_22650 ?auto_22645 ) ) ( not ( = ?auto_22656 ?auto_22645 ) ) ( AVAILABLE ?auto_22649 ) ( IN ?auto_22646 ?auto_22651 ) ( TRUCK-AT ?auto_22651 ?auto_22652 ) ( ON ?auto_22644 ?auto_22643 ) ( ON ?auto_22645 ?auto_22644 ) ( not ( = ?auto_22643 ?auto_22644 ) ) ( not ( = ?auto_22643 ?auto_22645 ) ) ( not ( = ?auto_22643 ?auto_22646 ) ) ( not ( = ?auto_22643 ?auto_22647 ) ) ( not ( = ?auto_22643 ?auto_22648 ) ) ( not ( = ?auto_22643 ?auto_22650 ) ) ( not ( = ?auto_22643 ?auto_22656 ) ) ( not ( = ?auto_22644 ?auto_22645 ) ) ( not ( = ?auto_22644 ?auto_22646 ) ) ( not ( = ?auto_22644 ?auto_22647 ) ) ( not ( = ?auto_22644 ?auto_22648 ) ) ( not ( = ?auto_22644 ?auto_22650 ) ) ( not ( = ?auto_22644 ?auto_22656 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22646 ?auto_22647 ?auto_22648 )
      ( MAKE-5CRATE-VERIFY ?auto_22643 ?auto_22644 ?auto_22645 ?auto_22646 ?auto_22647 ?auto_22648 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22658 - SURFACE
      ?auto_22659 - SURFACE
    )
    :vars
    (
      ?auto_22660 - HOIST
      ?auto_22664 - PLACE
      ?auto_22665 - SURFACE
      ?auto_22663 - PLACE
      ?auto_22669 - HOIST
      ?auto_22661 - SURFACE
      ?auto_22666 - PLACE
      ?auto_22667 - HOIST
      ?auto_22668 - SURFACE
      ?auto_22670 - SURFACE
      ?auto_22662 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22660 ?auto_22664 ) ( IS-CRATE ?auto_22659 ) ( not ( = ?auto_22658 ?auto_22659 ) ) ( not ( = ?auto_22665 ?auto_22658 ) ) ( not ( = ?auto_22665 ?auto_22659 ) ) ( not ( = ?auto_22663 ?auto_22664 ) ) ( HOIST-AT ?auto_22669 ?auto_22663 ) ( not ( = ?auto_22660 ?auto_22669 ) ) ( SURFACE-AT ?auto_22659 ?auto_22663 ) ( ON ?auto_22659 ?auto_22661 ) ( CLEAR ?auto_22659 ) ( not ( = ?auto_22658 ?auto_22661 ) ) ( not ( = ?auto_22659 ?auto_22661 ) ) ( not ( = ?auto_22665 ?auto_22661 ) ) ( IS-CRATE ?auto_22658 ) ( not ( = ?auto_22666 ?auto_22664 ) ) ( not ( = ?auto_22663 ?auto_22666 ) ) ( HOIST-AT ?auto_22667 ?auto_22666 ) ( not ( = ?auto_22660 ?auto_22667 ) ) ( not ( = ?auto_22669 ?auto_22667 ) ) ( AVAILABLE ?auto_22667 ) ( SURFACE-AT ?auto_22658 ?auto_22666 ) ( ON ?auto_22658 ?auto_22668 ) ( CLEAR ?auto_22658 ) ( not ( = ?auto_22658 ?auto_22668 ) ) ( not ( = ?auto_22659 ?auto_22668 ) ) ( not ( = ?auto_22665 ?auto_22668 ) ) ( not ( = ?auto_22661 ?auto_22668 ) ) ( SURFACE-AT ?auto_22670 ?auto_22664 ) ( CLEAR ?auto_22670 ) ( IS-CRATE ?auto_22665 ) ( not ( = ?auto_22670 ?auto_22665 ) ) ( not ( = ?auto_22658 ?auto_22670 ) ) ( not ( = ?auto_22659 ?auto_22670 ) ) ( not ( = ?auto_22661 ?auto_22670 ) ) ( not ( = ?auto_22668 ?auto_22670 ) ) ( AVAILABLE ?auto_22660 ) ( TRUCK-AT ?auto_22662 ?auto_22663 ) ( LIFTING ?auto_22669 ?auto_22665 ) )
    :subtasks
    ( ( !LOAD ?auto_22669 ?auto_22665 ?auto_22662 ?auto_22663 )
      ( MAKE-2CRATE ?auto_22665 ?auto_22658 ?auto_22659 )
      ( MAKE-1CRATE-VERIFY ?auto_22658 ?auto_22659 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22671 - SURFACE
      ?auto_22672 - SURFACE
      ?auto_22673 - SURFACE
    )
    :vars
    (
      ?auto_22677 - HOIST
      ?auto_22683 - PLACE
      ?auto_22676 - PLACE
      ?auto_22678 - HOIST
      ?auto_22682 - SURFACE
      ?auto_22675 - PLACE
      ?auto_22681 - HOIST
      ?auto_22679 - SURFACE
      ?auto_22674 - SURFACE
      ?auto_22680 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22677 ?auto_22683 ) ( IS-CRATE ?auto_22673 ) ( not ( = ?auto_22672 ?auto_22673 ) ) ( not ( = ?auto_22671 ?auto_22672 ) ) ( not ( = ?auto_22671 ?auto_22673 ) ) ( not ( = ?auto_22676 ?auto_22683 ) ) ( HOIST-AT ?auto_22678 ?auto_22676 ) ( not ( = ?auto_22677 ?auto_22678 ) ) ( SURFACE-AT ?auto_22673 ?auto_22676 ) ( ON ?auto_22673 ?auto_22682 ) ( CLEAR ?auto_22673 ) ( not ( = ?auto_22672 ?auto_22682 ) ) ( not ( = ?auto_22673 ?auto_22682 ) ) ( not ( = ?auto_22671 ?auto_22682 ) ) ( IS-CRATE ?auto_22672 ) ( not ( = ?auto_22675 ?auto_22683 ) ) ( not ( = ?auto_22676 ?auto_22675 ) ) ( HOIST-AT ?auto_22681 ?auto_22675 ) ( not ( = ?auto_22677 ?auto_22681 ) ) ( not ( = ?auto_22678 ?auto_22681 ) ) ( AVAILABLE ?auto_22681 ) ( SURFACE-AT ?auto_22672 ?auto_22675 ) ( ON ?auto_22672 ?auto_22679 ) ( CLEAR ?auto_22672 ) ( not ( = ?auto_22672 ?auto_22679 ) ) ( not ( = ?auto_22673 ?auto_22679 ) ) ( not ( = ?auto_22671 ?auto_22679 ) ) ( not ( = ?auto_22682 ?auto_22679 ) ) ( SURFACE-AT ?auto_22674 ?auto_22683 ) ( CLEAR ?auto_22674 ) ( IS-CRATE ?auto_22671 ) ( not ( = ?auto_22674 ?auto_22671 ) ) ( not ( = ?auto_22672 ?auto_22674 ) ) ( not ( = ?auto_22673 ?auto_22674 ) ) ( not ( = ?auto_22682 ?auto_22674 ) ) ( not ( = ?auto_22679 ?auto_22674 ) ) ( AVAILABLE ?auto_22677 ) ( TRUCK-AT ?auto_22680 ?auto_22676 ) ( LIFTING ?auto_22678 ?auto_22671 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22672 ?auto_22673 )
      ( MAKE-2CRATE-VERIFY ?auto_22671 ?auto_22672 ?auto_22673 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22684 - SURFACE
      ?auto_22685 - SURFACE
      ?auto_22686 - SURFACE
      ?auto_22687 - SURFACE
    )
    :vars
    (
      ?auto_22690 - HOIST
      ?auto_22692 - PLACE
      ?auto_22695 - PLACE
      ?auto_22696 - HOIST
      ?auto_22691 - SURFACE
      ?auto_22689 - PLACE
      ?auto_22688 - HOIST
      ?auto_22694 - SURFACE
      ?auto_22693 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22690 ?auto_22692 ) ( IS-CRATE ?auto_22687 ) ( not ( = ?auto_22686 ?auto_22687 ) ) ( not ( = ?auto_22685 ?auto_22686 ) ) ( not ( = ?auto_22685 ?auto_22687 ) ) ( not ( = ?auto_22695 ?auto_22692 ) ) ( HOIST-AT ?auto_22696 ?auto_22695 ) ( not ( = ?auto_22690 ?auto_22696 ) ) ( SURFACE-AT ?auto_22687 ?auto_22695 ) ( ON ?auto_22687 ?auto_22691 ) ( CLEAR ?auto_22687 ) ( not ( = ?auto_22686 ?auto_22691 ) ) ( not ( = ?auto_22687 ?auto_22691 ) ) ( not ( = ?auto_22685 ?auto_22691 ) ) ( IS-CRATE ?auto_22686 ) ( not ( = ?auto_22689 ?auto_22692 ) ) ( not ( = ?auto_22695 ?auto_22689 ) ) ( HOIST-AT ?auto_22688 ?auto_22689 ) ( not ( = ?auto_22690 ?auto_22688 ) ) ( not ( = ?auto_22696 ?auto_22688 ) ) ( AVAILABLE ?auto_22688 ) ( SURFACE-AT ?auto_22686 ?auto_22689 ) ( ON ?auto_22686 ?auto_22694 ) ( CLEAR ?auto_22686 ) ( not ( = ?auto_22686 ?auto_22694 ) ) ( not ( = ?auto_22687 ?auto_22694 ) ) ( not ( = ?auto_22685 ?auto_22694 ) ) ( not ( = ?auto_22691 ?auto_22694 ) ) ( SURFACE-AT ?auto_22684 ?auto_22692 ) ( CLEAR ?auto_22684 ) ( IS-CRATE ?auto_22685 ) ( not ( = ?auto_22684 ?auto_22685 ) ) ( not ( = ?auto_22686 ?auto_22684 ) ) ( not ( = ?auto_22687 ?auto_22684 ) ) ( not ( = ?auto_22691 ?auto_22684 ) ) ( not ( = ?auto_22694 ?auto_22684 ) ) ( AVAILABLE ?auto_22690 ) ( TRUCK-AT ?auto_22693 ?auto_22695 ) ( LIFTING ?auto_22696 ?auto_22685 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22685 ?auto_22686 ?auto_22687 )
      ( MAKE-3CRATE-VERIFY ?auto_22684 ?auto_22685 ?auto_22686 ?auto_22687 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22697 - SURFACE
      ?auto_22698 - SURFACE
      ?auto_22699 - SURFACE
      ?auto_22700 - SURFACE
      ?auto_22701 - SURFACE
    )
    :vars
    (
      ?auto_22704 - HOIST
      ?auto_22706 - PLACE
      ?auto_22709 - PLACE
      ?auto_22710 - HOIST
      ?auto_22705 - SURFACE
      ?auto_22703 - PLACE
      ?auto_22702 - HOIST
      ?auto_22708 - SURFACE
      ?auto_22707 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22704 ?auto_22706 ) ( IS-CRATE ?auto_22701 ) ( not ( = ?auto_22700 ?auto_22701 ) ) ( not ( = ?auto_22699 ?auto_22700 ) ) ( not ( = ?auto_22699 ?auto_22701 ) ) ( not ( = ?auto_22709 ?auto_22706 ) ) ( HOIST-AT ?auto_22710 ?auto_22709 ) ( not ( = ?auto_22704 ?auto_22710 ) ) ( SURFACE-AT ?auto_22701 ?auto_22709 ) ( ON ?auto_22701 ?auto_22705 ) ( CLEAR ?auto_22701 ) ( not ( = ?auto_22700 ?auto_22705 ) ) ( not ( = ?auto_22701 ?auto_22705 ) ) ( not ( = ?auto_22699 ?auto_22705 ) ) ( IS-CRATE ?auto_22700 ) ( not ( = ?auto_22703 ?auto_22706 ) ) ( not ( = ?auto_22709 ?auto_22703 ) ) ( HOIST-AT ?auto_22702 ?auto_22703 ) ( not ( = ?auto_22704 ?auto_22702 ) ) ( not ( = ?auto_22710 ?auto_22702 ) ) ( AVAILABLE ?auto_22702 ) ( SURFACE-AT ?auto_22700 ?auto_22703 ) ( ON ?auto_22700 ?auto_22708 ) ( CLEAR ?auto_22700 ) ( not ( = ?auto_22700 ?auto_22708 ) ) ( not ( = ?auto_22701 ?auto_22708 ) ) ( not ( = ?auto_22699 ?auto_22708 ) ) ( not ( = ?auto_22705 ?auto_22708 ) ) ( SURFACE-AT ?auto_22698 ?auto_22706 ) ( CLEAR ?auto_22698 ) ( IS-CRATE ?auto_22699 ) ( not ( = ?auto_22698 ?auto_22699 ) ) ( not ( = ?auto_22700 ?auto_22698 ) ) ( not ( = ?auto_22701 ?auto_22698 ) ) ( not ( = ?auto_22705 ?auto_22698 ) ) ( not ( = ?auto_22708 ?auto_22698 ) ) ( AVAILABLE ?auto_22704 ) ( TRUCK-AT ?auto_22707 ?auto_22709 ) ( LIFTING ?auto_22710 ?auto_22699 ) ( ON ?auto_22698 ?auto_22697 ) ( not ( = ?auto_22697 ?auto_22698 ) ) ( not ( = ?auto_22697 ?auto_22699 ) ) ( not ( = ?auto_22697 ?auto_22700 ) ) ( not ( = ?auto_22697 ?auto_22701 ) ) ( not ( = ?auto_22697 ?auto_22705 ) ) ( not ( = ?auto_22697 ?auto_22708 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22699 ?auto_22700 ?auto_22701 )
      ( MAKE-4CRATE-VERIFY ?auto_22697 ?auto_22698 ?auto_22699 ?auto_22700 ?auto_22701 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22711 - SURFACE
      ?auto_22712 - SURFACE
      ?auto_22713 - SURFACE
      ?auto_22714 - SURFACE
      ?auto_22715 - SURFACE
      ?auto_22716 - SURFACE
    )
    :vars
    (
      ?auto_22719 - HOIST
      ?auto_22721 - PLACE
      ?auto_22724 - PLACE
      ?auto_22725 - HOIST
      ?auto_22720 - SURFACE
      ?auto_22718 - PLACE
      ?auto_22717 - HOIST
      ?auto_22723 - SURFACE
      ?auto_22722 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22719 ?auto_22721 ) ( IS-CRATE ?auto_22716 ) ( not ( = ?auto_22715 ?auto_22716 ) ) ( not ( = ?auto_22714 ?auto_22715 ) ) ( not ( = ?auto_22714 ?auto_22716 ) ) ( not ( = ?auto_22724 ?auto_22721 ) ) ( HOIST-AT ?auto_22725 ?auto_22724 ) ( not ( = ?auto_22719 ?auto_22725 ) ) ( SURFACE-AT ?auto_22716 ?auto_22724 ) ( ON ?auto_22716 ?auto_22720 ) ( CLEAR ?auto_22716 ) ( not ( = ?auto_22715 ?auto_22720 ) ) ( not ( = ?auto_22716 ?auto_22720 ) ) ( not ( = ?auto_22714 ?auto_22720 ) ) ( IS-CRATE ?auto_22715 ) ( not ( = ?auto_22718 ?auto_22721 ) ) ( not ( = ?auto_22724 ?auto_22718 ) ) ( HOIST-AT ?auto_22717 ?auto_22718 ) ( not ( = ?auto_22719 ?auto_22717 ) ) ( not ( = ?auto_22725 ?auto_22717 ) ) ( AVAILABLE ?auto_22717 ) ( SURFACE-AT ?auto_22715 ?auto_22718 ) ( ON ?auto_22715 ?auto_22723 ) ( CLEAR ?auto_22715 ) ( not ( = ?auto_22715 ?auto_22723 ) ) ( not ( = ?auto_22716 ?auto_22723 ) ) ( not ( = ?auto_22714 ?auto_22723 ) ) ( not ( = ?auto_22720 ?auto_22723 ) ) ( SURFACE-AT ?auto_22713 ?auto_22721 ) ( CLEAR ?auto_22713 ) ( IS-CRATE ?auto_22714 ) ( not ( = ?auto_22713 ?auto_22714 ) ) ( not ( = ?auto_22715 ?auto_22713 ) ) ( not ( = ?auto_22716 ?auto_22713 ) ) ( not ( = ?auto_22720 ?auto_22713 ) ) ( not ( = ?auto_22723 ?auto_22713 ) ) ( AVAILABLE ?auto_22719 ) ( TRUCK-AT ?auto_22722 ?auto_22724 ) ( LIFTING ?auto_22725 ?auto_22714 ) ( ON ?auto_22712 ?auto_22711 ) ( ON ?auto_22713 ?auto_22712 ) ( not ( = ?auto_22711 ?auto_22712 ) ) ( not ( = ?auto_22711 ?auto_22713 ) ) ( not ( = ?auto_22711 ?auto_22714 ) ) ( not ( = ?auto_22711 ?auto_22715 ) ) ( not ( = ?auto_22711 ?auto_22716 ) ) ( not ( = ?auto_22711 ?auto_22720 ) ) ( not ( = ?auto_22711 ?auto_22723 ) ) ( not ( = ?auto_22712 ?auto_22713 ) ) ( not ( = ?auto_22712 ?auto_22714 ) ) ( not ( = ?auto_22712 ?auto_22715 ) ) ( not ( = ?auto_22712 ?auto_22716 ) ) ( not ( = ?auto_22712 ?auto_22720 ) ) ( not ( = ?auto_22712 ?auto_22723 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22714 ?auto_22715 ?auto_22716 )
      ( MAKE-5CRATE-VERIFY ?auto_22711 ?auto_22712 ?auto_22713 ?auto_22714 ?auto_22715 ?auto_22716 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22726 - SURFACE
      ?auto_22727 - SURFACE
    )
    :vars
    (
      ?auto_22731 - HOIST
      ?auto_22733 - PLACE
      ?auto_22730 - SURFACE
      ?auto_22737 - PLACE
      ?auto_22738 - HOIST
      ?auto_22732 - SURFACE
      ?auto_22729 - PLACE
      ?auto_22728 - HOIST
      ?auto_22736 - SURFACE
      ?auto_22735 - SURFACE
      ?auto_22734 - TRUCK
      ?auto_22739 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22731 ?auto_22733 ) ( IS-CRATE ?auto_22727 ) ( not ( = ?auto_22726 ?auto_22727 ) ) ( not ( = ?auto_22730 ?auto_22726 ) ) ( not ( = ?auto_22730 ?auto_22727 ) ) ( not ( = ?auto_22737 ?auto_22733 ) ) ( HOIST-AT ?auto_22738 ?auto_22737 ) ( not ( = ?auto_22731 ?auto_22738 ) ) ( SURFACE-AT ?auto_22727 ?auto_22737 ) ( ON ?auto_22727 ?auto_22732 ) ( CLEAR ?auto_22727 ) ( not ( = ?auto_22726 ?auto_22732 ) ) ( not ( = ?auto_22727 ?auto_22732 ) ) ( not ( = ?auto_22730 ?auto_22732 ) ) ( IS-CRATE ?auto_22726 ) ( not ( = ?auto_22729 ?auto_22733 ) ) ( not ( = ?auto_22737 ?auto_22729 ) ) ( HOIST-AT ?auto_22728 ?auto_22729 ) ( not ( = ?auto_22731 ?auto_22728 ) ) ( not ( = ?auto_22738 ?auto_22728 ) ) ( AVAILABLE ?auto_22728 ) ( SURFACE-AT ?auto_22726 ?auto_22729 ) ( ON ?auto_22726 ?auto_22736 ) ( CLEAR ?auto_22726 ) ( not ( = ?auto_22726 ?auto_22736 ) ) ( not ( = ?auto_22727 ?auto_22736 ) ) ( not ( = ?auto_22730 ?auto_22736 ) ) ( not ( = ?auto_22732 ?auto_22736 ) ) ( SURFACE-AT ?auto_22735 ?auto_22733 ) ( CLEAR ?auto_22735 ) ( IS-CRATE ?auto_22730 ) ( not ( = ?auto_22735 ?auto_22730 ) ) ( not ( = ?auto_22726 ?auto_22735 ) ) ( not ( = ?auto_22727 ?auto_22735 ) ) ( not ( = ?auto_22732 ?auto_22735 ) ) ( not ( = ?auto_22736 ?auto_22735 ) ) ( AVAILABLE ?auto_22731 ) ( TRUCK-AT ?auto_22734 ?auto_22737 ) ( AVAILABLE ?auto_22738 ) ( SURFACE-AT ?auto_22730 ?auto_22737 ) ( ON ?auto_22730 ?auto_22739 ) ( CLEAR ?auto_22730 ) ( not ( = ?auto_22726 ?auto_22739 ) ) ( not ( = ?auto_22727 ?auto_22739 ) ) ( not ( = ?auto_22730 ?auto_22739 ) ) ( not ( = ?auto_22732 ?auto_22739 ) ) ( not ( = ?auto_22736 ?auto_22739 ) ) ( not ( = ?auto_22735 ?auto_22739 ) ) )
    :subtasks
    ( ( !LIFT ?auto_22738 ?auto_22730 ?auto_22739 ?auto_22737 )
      ( MAKE-2CRATE ?auto_22730 ?auto_22726 ?auto_22727 )
      ( MAKE-1CRATE-VERIFY ?auto_22726 ?auto_22727 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22740 - SURFACE
      ?auto_22741 - SURFACE
      ?auto_22742 - SURFACE
    )
    :vars
    (
      ?auto_22746 - HOIST
      ?auto_22753 - PLACE
      ?auto_22747 - PLACE
      ?auto_22750 - HOIST
      ?auto_22751 - SURFACE
      ?auto_22748 - PLACE
      ?auto_22743 - HOIST
      ?auto_22752 - SURFACE
      ?auto_22749 - SURFACE
      ?auto_22745 - TRUCK
      ?auto_22744 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22746 ?auto_22753 ) ( IS-CRATE ?auto_22742 ) ( not ( = ?auto_22741 ?auto_22742 ) ) ( not ( = ?auto_22740 ?auto_22741 ) ) ( not ( = ?auto_22740 ?auto_22742 ) ) ( not ( = ?auto_22747 ?auto_22753 ) ) ( HOIST-AT ?auto_22750 ?auto_22747 ) ( not ( = ?auto_22746 ?auto_22750 ) ) ( SURFACE-AT ?auto_22742 ?auto_22747 ) ( ON ?auto_22742 ?auto_22751 ) ( CLEAR ?auto_22742 ) ( not ( = ?auto_22741 ?auto_22751 ) ) ( not ( = ?auto_22742 ?auto_22751 ) ) ( not ( = ?auto_22740 ?auto_22751 ) ) ( IS-CRATE ?auto_22741 ) ( not ( = ?auto_22748 ?auto_22753 ) ) ( not ( = ?auto_22747 ?auto_22748 ) ) ( HOIST-AT ?auto_22743 ?auto_22748 ) ( not ( = ?auto_22746 ?auto_22743 ) ) ( not ( = ?auto_22750 ?auto_22743 ) ) ( AVAILABLE ?auto_22743 ) ( SURFACE-AT ?auto_22741 ?auto_22748 ) ( ON ?auto_22741 ?auto_22752 ) ( CLEAR ?auto_22741 ) ( not ( = ?auto_22741 ?auto_22752 ) ) ( not ( = ?auto_22742 ?auto_22752 ) ) ( not ( = ?auto_22740 ?auto_22752 ) ) ( not ( = ?auto_22751 ?auto_22752 ) ) ( SURFACE-AT ?auto_22749 ?auto_22753 ) ( CLEAR ?auto_22749 ) ( IS-CRATE ?auto_22740 ) ( not ( = ?auto_22749 ?auto_22740 ) ) ( not ( = ?auto_22741 ?auto_22749 ) ) ( not ( = ?auto_22742 ?auto_22749 ) ) ( not ( = ?auto_22751 ?auto_22749 ) ) ( not ( = ?auto_22752 ?auto_22749 ) ) ( AVAILABLE ?auto_22746 ) ( TRUCK-AT ?auto_22745 ?auto_22747 ) ( AVAILABLE ?auto_22750 ) ( SURFACE-AT ?auto_22740 ?auto_22747 ) ( ON ?auto_22740 ?auto_22744 ) ( CLEAR ?auto_22740 ) ( not ( = ?auto_22741 ?auto_22744 ) ) ( not ( = ?auto_22742 ?auto_22744 ) ) ( not ( = ?auto_22740 ?auto_22744 ) ) ( not ( = ?auto_22751 ?auto_22744 ) ) ( not ( = ?auto_22752 ?auto_22744 ) ) ( not ( = ?auto_22749 ?auto_22744 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22741 ?auto_22742 )
      ( MAKE-2CRATE-VERIFY ?auto_22740 ?auto_22741 ?auto_22742 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22754 - SURFACE
      ?auto_22755 - SURFACE
      ?auto_22756 - SURFACE
      ?auto_22757 - SURFACE
    )
    :vars
    (
      ?auto_22763 - HOIST
      ?auto_22762 - PLACE
      ?auto_22764 - PLACE
      ?auto_22766 - HOIST
      ?auto_22759 - SURFACE
      ?auto_22765 - PLACE
      ?auto_22758 - HOIST
      ?auto_22767 - SURFACE
      ?auto_22760 - TRUCK
      ?auto_22761 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22763 ?auto_22762 ) ( IS-CRATE ?auto_22757 ) ( not ( = ?auto_22756 ?auto_22757 ) ) ( not ( = ?auto_22755 ?auto_22756 ) ) ( not ( = ?auto_22755 ?auto_22757 ) ) ( not ( = ?auto_22764 ?auto_22762 ) ) ( HOIST-AT ?auto_22766 ?auto_22764 ) ( not ( = ?auto_22763 ?auto_22766 ) ) ( SURFACE-AT ?auto_22757 ?auto_22764 ) ( ON ?auto_22757 ?auto_22759 ) ( CLEAR ?auto_22757 ) ( not ( = ?auto_22756 ?auto_22759 ) ) ( not ( = ?auto_22757 ?auto_22759 ) ) ( not ( = ?auto_22755 ?auto_22759 ) ) ( IS-CRATE ?auto_22756 ) ( not ( = ?auto_22765 ?auto_22762 ) ) ( not ( = ?auto_22764 ?auto_22765 ) ) ( HOIST-AT ?auto_22758 ?auto_22765 ) ( not ( = ?auto_22763 ?auto_22758 ) ) ( not ( = ?auto_22766 ?auto_22758 ) ) ( AVAILABLE ?auto_22758 ) ( SURFACE-AT ?auto_22756 ?auto_22765 ) ( ON ?auto_22756 ?auto_22767 ) ( CLEAR ?auto_22756 ) ( not ( = ?auto_22756 ?auto_22767 ) ) ( not ( = ?auto_22757 ?auto_22767 ) ) ( not ( = ?auto_22755 ?auto_22767 ) ) ( not ( = ?auto_22759 ?auto_22767 ) ) ( SURFACE-AT ?auto_22754 ?auto_22762 ) ( CLEAR ?auto_22754 ) ( IS-CRATE ?auto_22755 ) ( not ( = ?auto_22754 ?auto_22755 ) ) ( not ( = ?auto_22756 ?auto_22754 ) ) ( not ( = ?auto_22757 ?auto_22754 ) ) ( not ( = ?auto_22759 ?auto_22754 ) ) ( not ( = ?auto_22767 ?auto_22754 ) ) ( AVAILABLE ?auto_22763 ) ( TRUCK-AT ?auto_22760 ?auto_22764 ) ( AVAILABLE ?auto_22766 ) ( SURFACE-AT ?auto_22755 ?auto_22764 ) ( ON ?auto_22755 ?auto_22761 ) ( CLEAR ?auto_22755 ) ( not ( = ?auto_22756 ?auto_22761 ) ) ( not ( = ?auto_22757 ?auto_22761 ) ) ( not ( = ?auto_22755 ?auto_22761 ) ) ( not ( = ?auto_22759 ?auto_22761 ) ) ( not ( = ?auto_22767 ?auto_22761 ) ) ( not ( = ?auto_22754 ?auto_22761 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22755 ?auto_22756 ?auto_22757 )
      ( MAKE-3CRATE-VERIFY ?auto_22754 ?auto_22755 ?auto_22756 ?auto_22757 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22768 - SURFACE
      ?auto_22769 - SURFACE
      ?auto_22770 - SURFACE
      ?auto_22771 - SURFACE
      ?auto_22772 - SURFACE
    )
    :vars
    (
      ?auto_22778 - HOIST
      ?auto_22777 - PLACE
      ?auto_22779 - PLACE
      ?auto_22781 - HOIST
      ?auto_22774 - SURFACE
      ?auto_22780 - PLACE
      ?auto_22773 - HOIST
      ?auto_22782 - SURFACE
      ?auto_22775 - TRUCK
      ?auto_22776 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22778 ?auto_22777 ) ( IS-CRATE ?auto_22772 ) ( not ( = ?auto_22771 ?auto_22772 ) ) ( not ( = ?auto_22770 ?auto_22771 ) ) ( not ( = ?auto_22770 ?auto_22772 ) ) ( not ( = ?auto_22779 ?auto_22777 ) ) ( HOIST-AT ?auto_22781 ?auto_22779 ) ( not ( = ?auto_22778 ?auto_22781 ) ) ( SURFACE-AT ?auto_22772 ?auto_22779 ) ( ON ?auto_22772 ?auto_22774 ) ( CLEAR ?auto_22772 ) ( not ( = ?auto_22771 ?auto_22774 ) ) ( not ( = ?auto_22772 ?auto_22774 ) ) ( not ( = ?auto_22770 ?auto_22774 ) ) ( IS-CRATE ?auto_22771 ) ( not ( = ?auto_22780 ?auto_22777 ) ) ( not ( = ?auto_22779 ?auto_22780 ) ) ( HOIST-AT ?auto_22773 ?auto_22780 ) ( not ( = ?auto_22778 ?auto_22773 ) ) ( not ( = ?auto_22781 ?auto_22773 ) ) ( AVAILABLE ?auto_22773 ) ( SURFACE-AT ?auto_22771 ?auto_22780 ) ( ON ?auto_22771 ?auto_22782 ) ( CLEAR ?auto_22771 ) ( not ( = ?auto_22771 ?auto_22782 ) ) ( not ( = ?auto_22772 ?auto_22782 ) ) ( not ( = ?auto_22770 ?auto_22782 ) ) ( not ( = ?auto_22774 ?auto_22782 ) ) ( SURFACE-AT ?auto_22769 ?auto_22777 ) ( CLEAR ?auto_22769 ) ( IS-CRATE ?auto_22770 ) ( not ( = ?auto_22769 ?auto_22770 ) ) ( not ( = ?auto_22771 ?auto_22769 ) ) ( not ( = ?auto_22772 ?auto_22769 ) ) ( not ( = ?auto_22774 ?auto_22769 ) ) ( not ( = ?auto_22782 ?auto_22769 ) ) ( AVAILABLE ?auto_22778 ) ( TRUCK-AT ?auto_22775 ?auto_22779 ) ( AVAILABLE ?auto_22781 ) ( SURFACE-AT ?auto_22770 ?auto_22779 ) ( ON ?auto_22770 ?auto_22776 ) ( CLEAR ?auto_22770 ) ( not ( = ?auto_22771 ?auto_22776 ) ) ( not ( = ?auto_22772 ?auto_22776 ) ) ( not ( = ?auto_22770 ?auto_22776 ) ) ( not ( = ?auto_22774 ?auto_22776 ) ) ( not ( = ?auto_22782 ?auto_22776 ) ) ( not ( = ?auto_22769 ?auto_22776 ) ) ( ON ?auto_22769 ?auto_22768 ) ( not ( = ?auto_22768 ?auto_22769 ) ) ( not ( = ?auto_22768 ?auto_22770 ) ) ( not ( = ?auto_22768 ?auto_22771 ) ) ( not ( = ?auto_22768 ?auto_22772 ) ) ( not ( = ?auto_22768 ?auto_22774 ) ) ( not ( = ?auto_22768 ?auto_22782 ) ) ( not ( = ?auto_22768 ?auto_22776 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22770 ?auto_22771 ?auto_22772 )
      ( MAKE-4CRATE-VERIFY ?auto_22768 ?auto_22769 ?auto_22770 ?auto_22771 ?auto_22772 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22783 - SURFACE
      ?auto_22784 - SURFACE
      ?auto_22785 - SURFACE
      ?auto_22786 - SURFACE
      ?auto_22787 - SURFACE
      ?auto_22788 - SURFACE
    )
    :vars
    (
      ?auto_22794 - HOIST
      ?auto_22793 - PLACE
      ?auto_22795 - PLACE
      ?auto_22797 - HOIST
      ?auto_22790 - SURFACE
      ?auto_22796 - PLACE
      ?auto_22789 - HOIST
      ?auto_22798 - SURFACE
      ?auto_22791 - TRUCK
      ?auto_22792 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22794 ?auto_22793 ) ( IS-CRATE ?auto_22788 ) ( not ( = ?auto_22787 ?auto_22788 ) ) ( not ( = ?auto_22786 ?auto_22787 ) ) ( not ( = ?auto_22786 ?auto_22788 ) ) ( not ( = ?auto_22795 ?auto_22793 ) ) ( HOIST-AT ?auto_22797 ?auto_22795 ) ( not ( = ?auto_22794 ?auto_22797 ) ) ( SURFACE-AT ?auto_22788 ?auto_22795 ) ( ON ?auto_22788 ?auto_22790 ) ( CLEAR ?auto_22788 ) ( not ( = ?auto_22787 ?auto_22790 ) ) ( not ( = ?auto_22788 ?auto_22790 ) ) ( not ( = ?auto_22786 ?auto_22790 ) ) ( IS-CRATE ?auto_22787 ) ( not ( = ?auto_22796 ?auto_22793 ) ) ( not ( = ?auto_22795 ?auto_22796 ) ) ( HOIST-AT ?auto_22789 ?auto_22796 ) ( not ( = ?auto_22794 ?auto_22789 ) ) ( not ( = ?auto_22797 ?auto_22789 ) ) ( AVAILABLE ?auto_22789 ) ( SURFACE-AT ?auto_22787 ?auto_22796 ) ( ON ?auto_22787 ?auto_22798 ) ( CLEAR ?auto_22787 ) ( not ( = ?auto_22787 ?auto_22798 ) ) ( not ( = ?auto_22788 ?auto_22798 ) ) ( not ( = ?auto_22786 ?auto_22798 ) ) ( not ( = ?auto_22790 ?auto_22798 ) ) ( SURFACE-AT ?auto_22785 ?auto_22793 ) ( CLEAR ?auto_22785 ) ( IS-CRATE ?auto_22786 ) ( not ( = ?auto_22785 ?auto_22786 ) ) ( not ( = ?auto_22787 ?auto_22785 ) ) ( not ( = ?auto_22788 ?auto_22785 ) ) ( not ( = ?auto_22790 ?auto_22785 ) ) ( not ( = ?auto_22798 ?auto_22785 ) ) ( AVAILABLE ?auto_22794 ) ( TRUCK-AT ?auto_22791 ?auto_22795 ) ( AVAILABLE ?auto_22797 ) ( SURFACE-AT ?auto_22786 ?auto_22795 ) ( ON ?auto_22786 ?auto_22792 ) ( CLEAR ?auto_22786 ) ( not ( = ?auto_22787 ?auto_22792 ) ) ( not ( = ?auto_22788 ?auto_22792 ) ) ( not ( = ?auto_22786 ?auto_22792 ) ) ( not ( = ?auto_22790 ?auto_22792 ) ) ( not ( = ?auto_22798 ?auto_22792 ) ) ( not ( = ?auto_22785 ?auto_22792 ) ) ( ON ?auto_22784 ?auto_22783 ) ( ON ?auto_22785 ?auto_22784 ) ( not ( = ?auto_22783 ?auto_22784 ) ) ( not ( = ?auto_22783 ?auto_22785 ) ) ( not ( = ?auto_22783 ?auto_22786 ) ) ( not ( = ?auto_22783 ?auto_22787 ) ) ( not ( = ?auto_22783 ?auto_22788 ) ) ( not ( = ?auto_22783 ?auto_22790 ) ) ( not ( = ?auto_22783 ?auto_22798 ) ) ( not ( = ?auto_22783 ?auto_22792 ) ) ( not ( = ?auto_22784 ?auto_22785 ) ) ( not ( = ?auto_22784 ?auto_22786 ) ) ( not ( = ?auto_22784 ?auto_22787 ) ) ( not ( = ?auto_22784 ?auto_22788 ) ) ( not ( = ?auto_22784 ?auto_22790 ) ) ( not ( = ?auto_22784 ?auto_22798 ) ) ( not ( = ?auto_22784 ?auto_22792 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22786 ?auto_22787 ?auto_22788 )
      ( MAKE-5CRATE-VERIFY ?auto_22783 ?auto_22784 ?auto_22785 ?auto_22786 ?auto_22787 ?auto_22788 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22799 - SURFACE
      ?auto_22800 - SURFACE
    )
    :vars
    (
      ?auto_22807 - HOIST
      ?auto_22806 - PLACE
      ?auto_22810 - SURFACE
      ?auto_22808 - PLACE
      ?auto_22811 - HOIST
      ?auto_22803 - SURFACE
      ?auto_22809 - PLACE
      ?auto_22802 - HOIST
      ?auto_22812 - SURFACE
      ?auto_22801 - SURFACE
      ?auto_22805 - SURFACE
      ?auto_22804 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22807 ?auto_22806 ) ( IS-CRATE ?auto_22800 ) ( not ( = ?auto_22799 ?auto_22800 ) ) ( not ( = ?auto_22810 ?auto_22799 ) ) ( not ( = ?auto_22810 ?auto_22800 ) ) ( not ( = ?auto_22808 ?auto_22806 ) ) ( HOIST-AT ?auto_22811 ?auto_22808 ) ( not ( = ?auto_22807 ?auto_22811 ) ) ( SURFACE-AT ?auto_22800 ?auto_22808 ) ( ON ?auto_22800 ?auto_22803 ) ( CLEAR ?auto_22800 ) ( not ( = ?auto_22799 ?auto_22803 ) ) ( not ( = ?auto_22800 ?auto_22803 ) ) ( not ( = ?auto_22810 ?auto_22803 ) ) ( IS-CRATE ?auto_22799 ) ( not ( = ?auto_22809 ?auto_22806 ) ) ( not ( = ?auto_22808 ?auto_22809 ) ) ( HOIST-AT ?auto_22802 ?auto_22809 ) ( not ( = ?auto_22807 ?auto_22802 ) ) ( not ( = ?auto_22811 ?auto_22802 ) ) ( AVAILABLE ?auto_22802 ) ( SURFACE-AT ?auto_22799 ?auto_22809 ) ( ON ?auto_22799 ?auto_22812 ) ( CLEAR ?auto_22799 ) ( not ( = ?auto_22799 ?auto_22812 ) ) ( not ( = ?auto_22800 ?auto_22812 ) ) ( not ( = ?auto_22810 ?auto_22812 ) ) ( not ( = ?auto_22803 ?auto_22812 ) ) ( SURFACE-AT ?auto_22801 ?auto_22806 ) ( CLEAR ?auto_22801 ) ( IS-CRATE ?auto_22810 ) ( not ( = ?auto_22801 ?auto_22810 ) ) ( not ( = ?auto_22799 ?auto_22801 ) ) ( not ( = ?auto_22800 ?auto_22801 ) ) ( not ( = ?auto_22803 ?auto_22801 ) ) ( not ( = ?auto_22812 ?auto_22801 ) ) ( AVAILABLE ?auto_22807 ) ( AVAILABLE ?auto_22811 ) ( SURFACE-AT ?auto_22810 ?auto_22808 ) ( ON ?auto_22810 ?auto_22805 ) ( CLEAR ?auto_22810 ) ( not ( = ?auto_22799 ?auto_22805 ) ) ( not ( = ?auto_22800 ?auto_22805 ) ) ( not ( = ?auto_22810 ?auto_22805 ) ) ( not ( = ?auto_22803 ?auto_22805 ) ) ( not ( = ?auto_22812 ?auto_22805 ) ) ( not ( = ?auto_22801 ?auto_22805 ) ) ( TRUCK-AT ?auto_22804 ?auto_22806 ) )
    :subtasks
    ( ( !DRIVE ?auto_22804 ?auto_22806 ?auto_22808 )
      ( MAKE-2CRATE ?auto_22810 ?auto_22799 ?auto_22800 )
      ( MAKE-1CRATE-VERIFY ?auto_22799 ?auto_22800 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22813 - SURFACE
      ?auto_22814 - SURFACE
      ?auto_22815 - SURFACE
    )
    :vars
    (
      ?auto_22820 - HOIST
      ?auto_22822 - PLACE
      ?auto_22824 - PLACE
      ?auto_22818 - HOIST
      ?auto_22825 - SURFACE
      ?auto_22817 - PLACE
      ?auto_22821 - HOIST
      ?auto_22826 - SURFACE
      ?auto_22819 - SURFACE
      ?auto_22823 - SURFACE
      ?auto_22816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22820 ?auto_22822 ) ( IS-CRATE ?auto_22815 ) ( not ( = ?auto_22814 ?auto_22815 ) ) ( not ( = ?auto_22813 ?auto_22814 ) ) ( not ( = ?auto_22813 ?auto_22815 ) ) ( not ( = ?auto_22824 ?auto_22822 ) ) ( HOIST-AT ?auto_22818 ?auto_22824 ) ( not ( = ?auto_22820 ?auto_22818 ) ) ( SURFACE-AT ?auto_22815 ?auto_22824 ) ( ON ?auto_22815 ?auto_22825 ) ( CLEAR ?auto_22815 ) ( not ( = ?auto_22814 ?auto_22825 ) ) ( not ( = ?auto_22815 ?auto_22825 ) ) ( not ( = ?auto_22813 ?auto_22825 ) ) ( IS-CRATE ?auto_22814 ) ( not ( = ?auto_22817 ?auto_22822 ) ) ( not ( = ?auto_22824 ?auto_22817 ) ) ( HOIST-AT ?auto_22821 ?auto_22817 ) ( not ( = ?auto_22820 ?auto_22821 ) ) ( not ( = ?auto_22818 ?auto_22821 ) ) ( AVAILABLE ?auto_22821 ) ( SURFACE-AT ?auto_22814 ?auto_22817 ) ( ON ?auto_22814 ?auto_22826 ) ( CLEAR ?auto_22814 ) ( not ( = ?auto_22814 ?auto_22826 ) ) ( not ( = ?auto_22815 ?auto_22826 ) ) ( not ( = ?auto_22813 ?auto_22826 ) ) ( not ( = ?auto_22825 ?auto_22826 ) ) ( SURFACE-AT ?auto_22819 ?auto_22822 ) ( CLEAR ?auto_22819 ) ( IS-CRATE ?auto_22813 ) ( not ( = ?auto_22819 ?auto_22813 ) ) ( not ( = ?auto_22814 ?auto_22819 ) ) ( not ( = ?auto_22815 ?auto_22819 ) ) ( not ( = ?auto_22825 ?auto_22819 ) ) ( not ( = ?auto_22826 ?auto_22819 ) ) ( AVAILABLE ?auto_22820 ) ( AVAILABLE ?auto_22818 ) ( SURFACE-AT ?auto_22813 ?auto_22824 ) ( ON ?auto_22813 ?auto_22823 ) ( CLEAR ?auto_22813 ) ( not ( = ?auto_22814 ?auto_22823 ) ) ( not ( = ?auto_22815 ?auto_22823 ) ) ( not ( = ?auto_22813 ?auto_22823 ) ) ( not ( = ?auto_22825 ?auto_22823 ) ) ( not ( = ?auto_22826 ?auto_22823 ) ) ( not ( = ?auto_22819 ?auto_22823 ) ) ( TRUCK-AT ?auto_22816 ?auto_22822 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22814 ?auto_22815 )
      ( MAKE-2CRATE-VERIFY ?auto_22813 ?auto_22814 ?auto_22815 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22827 - SURFACE
      ?auto_22828 - SURFACE
      ?auto_22829 - SURFACE
      ?auto_22830 - SURFACE
    )
    :vars
    (
      ?auto_22833 - HOIST
      ?auto_22840 - PLACE
      ?auto_22834 - PLACE
      ?auto_22838 - HOIST
      ?auto_22832 - SURFACE
      ?auto_22839 - PLACE
      ?auto_22836 - HOIST
      ?auto_22831 - SURFACE
      ?auto_22835 - SURFACE
      ?auto_22837 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22833 ?auto_22840 ) ( IS-CRATE ?auto_22830 ) ( not ( = ?auto_22829 ?auto_22830 ) ) ( not ( = ?auto_22828 ?auto_22829 ) ) ( not ( = ?auto_22828 ?auto_22830 ) ) ( not ( = ?auto_22834 ?auto_22840 ) ) ( HOIST-AT ?auto_22838 ?auto_22834 ) ( not ( = ?auto_22833 ?auto_22838 ) ) ( SURFACE-AT ?auto_22830 ?auto_22834 ) ( ON ?auto_22830 ?auto_22832 ) ( CLEAR ?auto_22830 ) ( not ( = ?auto_22829 ?auto_22832 ) ) ( not ( = ?auto_22830 ?auto_22832 ) ) ( not ( = ?auto_22828 ?auto_22832 ) ) ( IS-CRATE ?auto_22829 ) ( not ( = ?auto_22839 ?auto_22840 ) ) ( not ( = ?auto_22834 ?auto_22839 ) ) ( HOIST-AT ?auto_22836 ?auto_22839 ) ( not ( = ?auto_22833 ?auto_22836 ) ) ( not ( = ?auto_22838 ?auto_22836 ) ) ( AVAILABLE ?auto_22836 ) ( SURFACE-AT ?auto_22829 ?auto_22839 ) ( ON ?auto_22829 ?auto_22831 ) ( CLEAR ?auto_22829 ) ( not ( = ?auto_22829 ?auto_22831 ) ) ( not ( = ?auto_22830 ?auto_22831 ) ) ( not ( = ?auto_22828 ?auto_22831 ) ) ( not ( = ?auto_22832 ?auto_22831 ) ) ( SURFACE-AT ?auto_22827 ?auto_22840 ) ( CLEAR ?auto_22827 ) ( IS-CRATE ?auto_22828 ) ( not ( = ?auto_22827 ?auto_22828 ) ) ( not ( = ?auto_22829 ?auto_22827 ) ) ( not ( = ?auto_22830 ?auto_22827 ) ) ( not ( = ?auto_22832 ?auto_22827 ) ) ( not ( = ?auto_22831 ?auto_22827 ) ) ( AVAILABLE ?auto_22833 ) ( AVAILABLE ?auto_22838 ) ( SURFACE-AT ?auto_22828 ?auto_22834 ) ( ON ?auto_22828 ?auto_22835 ) ( CLEAR ?auto_22828 ) ( not ( = ?auto_22829 ?auto_22835 ) ) ( not ( = ?auto_22830 ?auto_22835 ) ) ( not ( = ?auto_22828 ?auto_22835 ) ) ( not ( = ?auto_22832 ?auto_22835 ) ) ( not ( = ?auto_22831 ?auto_22835 ) ) ( not ( = ?auto_22827 ?auto_22835 ) ) ( TRUCK-AT ?auto_22837 ?auto_22840 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22828 ?auto_22829 ?auto_22830 )
      ( MAKE-3CRATE-VERIFY ?auto_22827 ?auto_22828 ?auto_22829 ?auto_22830 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22841 - SURFACE
      ?auto_22842 - SURFACE
      ?auto_22843 - SURFACE
      ?auto_22844 - SURFACE
      ?auto_22845 - SURFACE
    )
    :vars
    (
      ?auto_22848 - HOIST
      ?auto_22855 - PLACE
      ?auto_22849 - PLACE
      ?auto_22853 - HOIST
      ?auto_22847 - SURFACE
      ?auto_22854 - PLACE
      ?auto_22851 - HOIST
      ?auto_22846 - SURFACE
      ?auto_22850 - SURFACE
      ?auto_22852 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22848 ?auto_22855 ) ( IS-CRATE ?auto_22845 ) ( not ( = ?auto_22844 ?auto_22845 ) ) ( not ( = ?auto_22843 ?auto_22844 ) ) ( not ( = ?auto_22843 ?auto_22845 ) ) ( not ( = ?auto_22849 ?auto_22855 ) ) ( HOIST-AT ?auto_22853 ?auto_22849 ) ( not ( = ?auto_22848 ?auto_22853 ) ) ( SURFACE-AT ?auto_22845 ?auto_22849 ) ( ON ?auto_22845 ?auto_22847 ) ( CLEAR ?auto_22845 ) ( not ( = ?auto_22844 ?auto_22847 ) ) ( not ( = ?auto_22845 ?auto_22847 ) ) ( not ( = ?auto_22843 ?auto_22847 ) ) ( IS-CRATE ?auto_22844 ) ( not ( = ?auto_22854 ?auto_22855 ) ) ( not ( = ?auto_22849 ?auto_22854 ) ) ( HOIST-AT ?auto_22851 ?auto_22854 ) ( not ( = ?auto_22848 ?auto_22851 ) ) ( not ( = ?auto_22853 ?auto_22851 ) ) ( AVAILABLE ?auto_22851 ) ( SURFACE-AT ?auto_22844 ?auto_22854 ) ( ON ?auto_22844 ?auto_22846 ) ( CLEAR ?auto_22844 ) ( not ( = ?auto_22844 ?auto_22846 ) ) ( not ( = ?auto_22845 ?auto_22846 ) ) ( not ( = ?auto_22843 ?auto_22846 ) ) ( not ( = ?auto_22847 ?auto_22846 ) ) ( SURFACE-AT ?auto_22842 ?auto_22855 ) ( CLEAR ?auto_22842 ) ( IS-CRATE ?auto_22843 ) ( not ( = ?auto_22842 ?auto_22843 ) ) ( not ( = ?auto_22844 ?auto_22842 ) ) ( not ( = ?auto_22845 ?auto_22842 ) ) ( not ( = ?auto_22847 ?auto_22842 ) ) ( not ( = ?auto_22846 ?auto_22842 ) ) ( AVAILABLE ?auto_22848 ) ( AVAILABLE ?auto_22853 ) ( SURFACE-AT ?auto_22843 ?auto_22849 ) ( ON ?auto_22843 ?auto_22850 ) ( CLEAR ?auto_22843 ) ( not ( = ?auto_22844 ?auto_22850 ) ) ( not ( = ?auto_22845 ?auto_22850 ) ) ( not ( = ?auto_22843 ?auto_22850 ) ) ( not ( = ?auto_22847 ?auto_22850 ) ) ( not ( = ?auto_22846 ?auto_22850 ) ) ( not ( = ?auto_22842 ?auto_22850 ) ) ( TRUCK-AT ?auto_22852 ?auto_22855 ) ( ON ?auto_22842 ?auto_22841 ) ( not ( = ?auto_22841 ?auto_22842 ) ) ( not ( = ?auto_22841 ?auto_22843 ) ) ( not ( = ?auto_22841 ?auto_22844 ) ) ( not ( = ?auto_22841 ?auto_22845 ) ) ( not ( = ?auto_22841 ?auto_22847 ) ) ( not ( = ?auto_22841 ?auto_22846 ) ) ( not ( = ?auto_22841 ?auto_22850 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22843 ?auto_22844 ?auto_22845 )
      ( MAKE-4CRATE-VERIFY ?auto_22841 ?auto_22842 ?auto_22843 ?auto_22844 ?auto_22845 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22856 - SURFACE
      ?auto_22857 - SURFACE
      ?auto_22858 - SURFACE
      ?auto_22859 - SURFACE
      ?auto_22860 - SURFACE
      ?auto_22861 - SURFACE
    )
    :vars
    (
      ?auto_22864 - HOIST
      ?auto_22871 - PLACE
      ?auto_22865 - PLACE
      ?auto_22869 - HOIST
      ?auto_22863 - SURFACE
      ?auto_22870 - PLACE
      ?auto_22867 - HOIST
      ?auto_22862 - SURFACE
      ?auto_22866 - SURFACE
      ?auto_22868 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22864 ?auto_22871 ) ( IS-CRATE ?auto_22861 ) ( not ( = ?auto_22860 ?auto_22861 ) ) ( not ( = ?auto_22859 ?auto_22860 ) ) ( not ( = ?auto_22859 ?auto_22861 ) ) ( not ( = ?auto_22865 ?auto_22871 ) ) ( HOIST-AT ?auto_22869 ?auto_22865 ) ( not ( = ?auto_22864 ?auto_22869 ) ) ( SURFACE-AT ?auto_22861 ?auto_22865 ) ( ON ?auto_22861 ?auto_22863 ) ( CLEAR ?auto_22861 ) ( not ( = ?auto_22860 ?auto_22863 ) ) ( not ( = ?auto_22861 ?auto_22863 ) ) ( not ( = ?auto_22859 ?auto_22863 ) ) ( IS-CRATE ?auto_22860 ) ( not ( = ?auto_22870 ?auto_22871 ) ) ( not ( = ?auto_22865 ?auto_22870 ) ) ( HOIST-AT ?auto_22867 ?auto_22870 ) ( not ( = ?auto_22864 ?auto_22867 ) ) ( not ( = ?auto_22869 ?auto_22867 ) ) ( AVAILABLE ?auto_22867 ) ( SURFACE-AT ?auto_22860 ?auto_22870 ) ( ON ?auto_22860 ?auto_22862 ) ( CLEAR ?auto_22860 ) ( not ( = ?auto_22860 ?auto_22862 ) ) ( not ( = ?auto_22861 ?auto_22862 ) ) ( not ( = ?auto_22859 ?auto_22862 ) ) ( not ( = ?auto_22863 ?auto_22862 ) ) ( SURFACE-AT ?auto_22858 ?auto_22871 ) ( CLEAR ?auto_22858 ) ( IS-CRATE ?auto_22859 ) ( not ( = ?auto_22858 ?auto_22859 ) ) ( not ( = ?auto_22860 ?auto_22858 ) ) ( not ( = ?auto_22861 ?auto_22858 ) ) ( not ( = ?auto_22863 ?auto_22858 ) ) ( not ( = ?auto_22862 ?auto_22858 ) ) ( AVAILABLE ?auto_22864 ) ( AVAILABLE ?auto_22869 ) ( SURFACE-AT ?auto_22859 ?auto_22865 ) ( ON ?auto_22859 ?auto_22866 ) ( CLEAR ?auto_22859 ) ( not ( = ?auto_22860 ?auto_22866 ) ) ( not ( = ?auto_22861 ?auto_22866 ) ) ( not ( = ?auto_22859 ?auto_22866 ) ) ( not ( = ?auto_22863 ?auto_22866 ) ) ( not ( = ?auto_22862 ?auto_22866 ) ) ( not ( = ?auto_22858 ?auto_22866 ) ) ( TRUCK-AT ?auto_22868 ?auto_22871 ) ( ON ?auto_22857 ?auto_22856 ) ( ON ?auto_22858 ?auto_22857 ) ( not ( = ?auto_22856 ?auto_22857 ) ) ( not ( = ?auto_22856 ?auto_22858 ) ) ( not ( = ?auto_22856 ?auto_22859 ) ) ( not ( = ?auto_22856 ?auto_22860 ) ) ( not ( = ?auto_22856 ?auto_22861 ) ) ( not ( = ?auto_22856 ?auto_22863 ) ) ( not ( = ?auto_22856 ?auto_22862 ) ) ( not ( = ?auto_22856 ?auto_22866 ) ) ( not ( = ?auto_22857 ?auto_22858 ) ) ( not ( = ?auto_22857 ?auto_22859 ) ) ( not ( = ?auto_22857 ?auto_22860 ) ) ( not ( = ?auto_22857 ?auto_22861 ) ) ( not ( = ?auto_22857 ?auto_22863 ) ) ( not ( = ?auto_22857 ?auto_22862 ) ) ( not ( = ?auto_22857 ?auto_22866 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22859 ?auto_22860 ?auto_22861 )
      ( MAKE-5CRATE-VERIFY ?auto_22856 ?auto_22857 ?auto_22858 ?auto_22859 ?auto_22860 ?auto_22861 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22872 - SURFACE
      ?auto_22873 - SURFACE
    )
    :vars
    (
      ?auto_22876 - HOIST
      ?auto_22885 - PLACE
      ?auto_22878 - SURFACE
      ?auto_22877 - PLACE
      ?auto_22882 - HOIST
      ?auto_22875 - SURFACE
      ?auto_22883 - PLACE
      ?auto_22880 - HOIST
      ?auto_22874 - SURFACE
      ?auto_22884 - SURFACE
      ?auto_22879 - SURFACE
      ?auto_22881 - TRUCK
      ?auto_22886 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22876 ?auto_22885 ) ( IS-CRATE ?auto_22873 ) ( not ( = ?auto_22872 ?auto_22873 ) ) ( not ( = ?auto_22878 ?auto_22872 ) ) ( not ( = ?auto_22878 ?auto_22873 ) ) ( not ( = ?auto_22877 ?auto_22885 ) ) ( HOIST-AT ?auto_22882 ?auto_22877 ) ( not ( = ?auto_22876 ?auto_22882 ) ) ( SURFACE-AT ?auto_22873 ?auto_22877 ) ( ON ?auto_22873 ?auto_22875 ) ( CLEAR ?auto_22873 ) ( not ( = ?auto_22872 ?auto_22875 ) ) ( not ( = ?auto_22873 ?auto_22875 ) ) ( not ( = ?auto_22878 ?auto_22875 ) ) ( IS-CRATE ?auto_22872 ) ( not ( = ?auto_22883 ?auto_22885 ) ) ( not ( = ?auto_22877 ?auto_22883 ) ) ( HOIST-AT ?auto_22880 ?auto_22883 ) ( not ( = ?auto_22876 ?auto_22880 ) ) ( not ( = ?auto_22882 ?auto_22880 ) ) ( AVAILABLE ?auto_22880 ) ( SURFACE-AT ?auto_22872 ?auto_22883 ) ( ON ?auto_22872 ?auto_22874 ) ( CLEAR ?auto_22872 ) ( not ( = ?auto_22872 ?auto_22874 ) ) ( not ( = ?auto_22873 ?auto_22874 ) ) ( not ( = ?auto_22878 ?auto_22874 ) ) ( not ( = ?auto_22875 ?auto_22874 ) ) ( IS-CRATE ?auto_22878 ) ( not ( = ?auto_22884 ?auto_22878 ) ) ( not ( = ?auto_22872 ?auto_22884 ) ) ( not ( = ?auto_22873 ?auto_22884 ) ) ( not ( = ?auto_22875 ?auto_22884 ) ) ( not ( = ?auto_22874 ?auto_22884 ) ) ( AVAILABLE ?auto_22882 ) ( SURFACE-AT ?auto_22878 ?auto_22877 ) ( ON ?auto_22878 ?auto_22879 ) ( CLEAR ?auto_22878 ) ( not ( = ?auto_22872 ?auto_22879 ) ) ( not ( = ?auto_22873 ?auto_22879 ) ) ( not ( = ?auto_22878 ?auto_22879 ) ) ( not ( = ?auto_22875 ?auto_22879 ) ) ( not ( = ?auto_22874 ?auto_22879 ) ) ( not ( = ?auto_22884 ?auto_22879 ) ) ( TRUCK-AT ?auto_22881 ?auto_22885 ) ( SURFACE-AT ?auto_22886 ?auto_22885 ) ( CLEAR ?auto_22886 ) ( LIFTING ?auto_22876 ?auto_22884 ) ( IS-CRATE ?auto_22884 ) ( not ( = ?auto_22886 ?auto_22884 ) ) ( not ( = ?auto_22872 ?auto_22886 ) ) ( not ( = ?auto_22873 ?auto_22886 ) ) ( not ( = ?auto_22878 ?auto_22886 ) ) ( not ( = ?auto_22875 ?auto_22886 ) ) ( not ( = ?auto_22874 ?auto_22886 ) ) ( not ( = ?auto_22879 ?auto_22886 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22886 ?auto_22884 )
      ( MAKE-2CRATE ?auto_22878 ?auto_22872 ?auto_22873 )
      ( MAKE-1CRATE-VERIFY ?auto_22872 ?auto_22873 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22887 - SURFACE
      ?auto_22888 - SURFACE
      ?auto_22889 - SURFACE
    )
    :vars
    (
      ?auto_22892 - HOIST
      ?auto_22896 - PLACE
      ?auto_22901 - PLACE
      ?auto_22898 - HOIST
      ?auto_22897 - SURFACE
      ?auto_22891 - PLACE
      ?auto_22890 - HOIST
      ?auto_22899 - SURFACE
      ?auto_22893 - SURFACE
      ?auto_22894 - SURFACE
      ?auto_22895 - TRUCK
      ?auto_22900 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22892 ?auto_22896 ) ( IS-CRATE ?auto_22889 ) ( not ( = ?auto_22888 ?auto_22889 ) ) ( not ( = ?auto_22887 ?auto_22888 ) ) ( not ( = ?auto_22887 ?auto_22889 ) ) ( not ( = ?auto_22901 ?auto_22896 ) ) ( HOIST-AT ?auto_22898 ?auto_22901 ) ( not ( = ?auto_22892 ?auto_22898 ) ) ( SURFACE-AT ?auto_22889 ?auto_22901 ) ( ON ?auto_22889 ?auto_22897 ) ( CLEAR ?auto_22889 ) ( not ( = ?auto_22888 ?auto_22897 ) ) ( not ( = ?auto_22889 ?auto_22897 ) ) ( not ( = ?auto_22887 ?auto_22897 ) ) ( IS-CRATE ?auto_22888 ) ( not ( = ?auto_22891 ?auto_22896 ) ) ( not ( = ?auto_22901 ?auto_22891 ) ) ( HOIST-AT ?auto_22890 ?auto_22891 ) ( not ( = ?auto_22892 ?auto_22890 ) ) ( not ( = ?auto_22898 ?auto_22890 ) ) ( AVAILABLE ?auto_22890 ) ( SURFACE-AT ?auto_22888 ?auto_22891 ) ( ON ?auto_22888 ?auto_22899 ) ( CLEAR ?auto_22888 ) ( not ( = ?auto_22888 ?auto_22899 ) ) ( not ( = ?auto_22889 ?auto_22899 ) ) ( not ( = ?auto_22887 ?auto_22899 ) ) ( not ( = ?auto_22897 ?auto_22899 ) ) ( IS-CRATE ?auto_22887 ) ( not ( = ?auto_22893 ?auto_22887 ) ) ( not ( = ?auto_22888 ?auto_22893 ) ) ( not ( = ?auto_22889 ?auto_22893 ) ) ( not ( = ?auto_22897 ?auto_22893 ) ) ( not ( = ?auto_22899 ?auto_22893 ) ) ( AVAILABLE ?auto_22898 ) ( SURFACE-AT ?auto_22887 ?auto_22901 ) ( ON ?auto_22887 ?auto_22894 ) ( CLEAR ?auto_22887 ) ( not ( = ?auto_22888 ?auto_22894 ) ) ( not ( = ?auto_22889 ?auto_22894 ) ) ( not ( = ?auto_22887 ?auto_22894 ) ) ( not ( = ?auto_22897 ?auto_22894 ) ) ( not ( = ?auto_22899 ?auto_22894 ) ) ( not ( = ?auto_22893 ?auto_22894 ) ) ( TRUCK-AT ?auto_22895 ?auto_22896 ) ( SURFACE-AT ?auto_22900 ?auto_22896 ) ( CLEAR ?auto_22900 ) ( LIFTING ?auto_22892 ?auto_22893 ) ( IS-CRATE ?auto_22893 ) ( not ( = ?auto_22900 ?auto_22893 ) ) ( not ( = ?auto_22888 ?auto_22900 ) ) ( not ( = ?auto_22889 ?auto_22900 ) ) ( not ( = ?auto_22887 ?auto_22900 ) ) ( not ( = ?auto_22897 ?auto_22900 ) ) ( not ( = ?auto_22899 ?auto_22900 ) ) ( not ( = ?auto_22894 ?auto_22900 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22888 ?auto_22889 )
      ( MAKE-2CRATE-VERIFY ?auto_22887 ?auto_22888 ?auto_22889 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22902 - SURFACE
      ?auto_22903 - SURFACE
      ?auto_22904 - SURFACE
      ?auto_22905 - SURFACE
    )
    :vars
    (
      ?auto_22908 - HOIST
      ?auto_22913 - PLACE
      ?auto_22915 - PLACE
      ?auto_22907 - HOIST
      ?auto_22910 - SURFACE
      ?auto_22914 - PLACE
      ?auto_22911 - HOIST
      ?auto_22906 - SURFACE
      ?auto_22912 - SURFACE
      ?auto_22916 - TRUCK
      ?auto_22909 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22908 ?auto_22913 ) ( IS-CRATE ?auto_22905 ) ( not ( = ?auto_22904 ?auto_22905 ) ) ( not ( = ?auto_22903 ?auto_22904 ) ) ( not ( = ?auto_22903 ?auto_22905 ) ) ( not ( = ?auto_22915 ?auto_22913 ) ) ( HOIST-AT ?auto_22907 ?auto_22915 ) ( not ( = ?auto_22908 ?auto_22907 ) ) ( SURFACE-AT ?auto_22905 ?auto_22915 ) ( ON ?auto_22905 ?auto_22910 ) ( CLEAR ?auto_22905 ) ( not ( = ?auto_22904 ?auto_22910 ) ) ( not ( = ?auto_22905 ?auto_22910 ) ) ( not ( = ?auto_22903 ?auto_22910 ) ) ( IS-CRATE ?auto_22904 ) ( not ( = ?auto_22914 ?auto_22913 ) ) ( not ( = ?auto_22915 ?auto_22914 ) ) ( HOIST-AT ?auto_22911 ?auto_22914 ) ( not ( = ?auto_22908 ?auto_22911 ) ) ( not ( = ?auto_22907 ?auto_22911 ) ) ( AVAILABLE ?auto_22911 ) ( SURFACE-AT ?auto_22904 ?auto_22914 ) ( ON ?auto_22904 ?auto_22906 ) ( CLEAR ?auto_22904 ) ( not ( = ?auto_22904 ?auto_22906 ) ) ( not ( = ?auto_22905 ?auto_22906 ) ) ( not ( = ?auto_22903 ?auto_22906 ) ) ( not ( = ?auto_22910 ?auto_22906 ) ) ( IS-CRATE ?auto_22903 ) ( not ( = ?auto_22902 ?auto_22903 ) ) ( not ( = ?auto_22904 ?auto_22902 ) ) ( not ( = ?auto_22905 ?auto_22902 ) ) ( not ( = ?auto_22910 ?auto_22902 ) ) ( not ( = ?auto_22906 ?auto_22902 ) ) ( AVAILABLE ?auto_22907 ) ( SURFACE-AT ?auto_22903 ?auto_22915 ) ( ON ?auto_22903 ?auto_22912 ) ( CLEAR ?auto_22903 ) ( not ( = ?auto_22904 ?auto_22912 ) ) ( not ( = ?auto_22905 ?auto_22912 ) ) ( not ( = ?auto_22903 ?auto_22912 ) ) ( not ( = ?auto_22910 ?auto_22912 ) ) ( not ( = ?auto_22906 ?auto_22912 ) ) ( not ( = ?auto_22902 ?auto_22912 ) ) ( TRUCK-AT ?auto_22916 ?auto_22913 ) ( SURFACE-AT ?auto_22909 ?auto_22913 ) ( CLEAR ?auto_22909 ) ( LIFTING ?auto_22908 ?auto_22902 ) ( IS-CRATE ?auto_22902 ) ( not ( = ?auto_22909 ?auto_22902 ) ) ( not ( = ?auto_22904 ?auto_22909 ) ) ( not ( = ?auto_22905 ?auto_22909 ) ) ( not ( = ?auto_22903 ?auto_22909 ) ) ( not ( = ?auto_22910 ?auto_22909 ) ) ( not ( = ?auto_22906 ?auto_22909 ) ) ( not ( = ?auto_22912 ?auto_22909 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22903 ?auto_22904 ?auto_22905 )
      ( MAKE-3CRATE-VERIFY ?auto_22902 ?auto_22903 ?auto_22904 ?auto_22905 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22917 - SURFACE
      ?auto_22918 - SURFACE
      ?auto_22919 - SURFACE
      ?auto_22920 - SURFACE
      ?auto_22921 - SURFACE
    )
    :vars
    (
      ?auto_22924 - HOIST
      ?auto_22928 - PLACE
      ?auto_22930 - PLACE
      ?auto_22923 - HOIST
      ?auto_22925 - SURFACE
      ?auto_22929 - PLACE
      ?auto_22926 - HOIST
      ?auto_22922 - SURFACE
      ?auto_22927 - SURFACE
      ?auto_22931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22924 ?auto_22928 ) ( IS-CRATE ?auto_22921 ) ( not ( = ?auto_22920 ?auto_22921 ) ) ( not ( = ?auto_22919 ?auto_22920 ) ) ( not ( = ?auto_22919 ?auto_22921 ) ) ( not ( = ?auto_22930 ?auto_22928 ) ) ( HOIST-AT ?auto_22923 ?auto_22930 ) ( not ( = ?auto_22924 ?auto_22923 ) ) ( SURFACE-AT ?auto_22921 ?auto_22930 ) ( ON ?auto_22921 ?auto_22925 ) ( CLEAR ?auto_22921 ) ( not ( = ?auto_22920 ?auto_22925 ) ) ( not ( = ?auto_22921 ?auto_22925 ) ) ( not ( = ?auto_22919 ?auto_22925 ) ) ( IS-CRATE ?auto_22920 ) ( not ( = ?auto_22929 ?auto_22928 ) ) ( not ( = ?auto_22930 ?auto_22929 ) ) ( HOIST-AT ?auto_22926 ?auto_22929 ) ( not ( = ?auto_22924 ?auto_22926 ) ) ( not ( = ?auto_22923 ?auto_22926 ) ) ( AVAILABLE ?auto_22926 ) ( SURFACE-AT ?auto_22920 ?auto_22929 ) ( ON ?auto_22920 ?auto_22922 ) ( CLEAR ?auto_22920 ) ( not ( = ?auto_22920 ?auto_22922 ) ) ( not ( = ?auto_22921 ?auto_22922 ) ) ( not ( = ?auto_22919 ?auto_22922 ) ) ( not ( = ?auto_22925 ?auto_22922 ) ) ( IS-CRATE ?auto_22919 ) ( not ( = ?auto_22918 ?auto_22919 ) ) ( not ( = ?auto_22920 ?auto_22918 ) ) ( not ( = ?auto_22921 ?auto_22918 ) ) ( not ( = ?auto_22925 ?auto_22918 ) ) ( not ( = ?auto_22922 ?auto_22918 ) ) ( AVAILABLE ?auto_22923 ) ( SURFACE-AT ?auto_22919 ?auto_22930 ) ( ON ?auto_22919 ?auto_22927 ) ( CLEAR ?auto_22919 ) ( not ( = ?auto_22920 ?auto_22927 ) ) ( not ( = ?auto_22921 ?auto_22927 ) ) ( not ( = ?auto_22919 ?auto_22927 ) ) ( not ( = ?auto_22925 ?auto_22927 ) ) ( not ( = ?auto_22922 ?auto_22927 ) ) ( not ( = ?auto_22918 ?auto_22927 ) ) ( TRUCK-AT ?auto_22931 ?auto_22928 ) ( SURFACE-AT ?auto_22917 ?auto_22928 ) ( CLEAR ?auto_22917 ) ( LIFTING ?auto_22924 ?auto_22918 ) ( IS-CRATE ?auto_22918 ) ( not ( = ?auto_22917 ?auto_22918 ) ) ( not ( = ?auto_22920 ?auto_22917 ) ) ( not ( = ?auto_22921 ?auto_22917 ) ) ( not ( = ?auto_22919 ?auto_22917 ) ) ( not ( = ?auto_22925 ?auto_22917 ) ) ( not ( = ?auto_22922 ?auto_22917 ) ) ( not ( = ?auto_22927 ?auto_22917 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22919 ?auto_22920 ?auto_22921 )
      ( MAKE-4CRATE-VERIFY ?auto_22917 ?auto_22918 ?auto_22919 ?auto_22920 ?auto_22921 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22932 - SURFACE
      ?auto_22933 - SURFACE
      ?auto_22934 - SURFACE
      ?auto_22935 - SURFACE
      ?auto_22936 - SURFACE
      ?auto_22937 - SURFACE
    )
    :vars
    (
      ?auto_22940 - HOIST
      ?auto_22944 - PLACE
      ?auto_22946 - PLACE
      ?auto_22939 - HOIST
      ?auto_22941 - SURFACE
      ?auto_22945 - PLACE
      ?auto_22942 - HOIST
      ?auto_22938 - SURFACE
      ?auto_22943 - SURFACE
      ?auto_22947 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22940 ?auto_22944 ) ( IS-CRATE ?auto_22937 ) ( not ( = ?auto_22936 ?auto_22937 ) ) ( not ( = ?auto_22935 ?auto_22936 ) ) ( not ( = ?auto_22935 ?auto_22937 ) ) ( not ( = ?auto_22946 ?auto_22944 ) ) ( HOIST-AT ?auto_22939 ?auto_22946 ) ( not ( = ?auto_22940 ?auto_22939 ) ) ( SURFACE-AT ?auto_22937 ?auto_22946 ) ( ON ?auto_22937 ?auto_22941 ) ( CLEAR ?auto_22937 ) ( not ( = ?auto_22936 ?auto_22941 ) ) ( not ( = ?auto_22937 ?auto_22941 ) ) ( not ( = ?auto_22935 ?auto_22941 ) ) ( IS-CRATE ?auto_22936 ) ( not ( = ?auto_22945 ?auto_22944 ) ) ( not ( = ?auto_22946 ?auto_22945 ) ) ( HOIST-AT ?auto_22942 ?auto_22945 ) ( not ( = ?auto_22940 ?auto_22942 ) ) ( not ( = ?auto_22939 ?auto_22942 ) ) ( AVAILABLE ?auto_22942 ) ( SURFACE-AT ?auto_22936 ?auto_22945 ) ( ON ?auto_22936 ?auto_22938 ) ( CLEAR ?auto_22936 ) ( not ( = ?auto_22936 ?auto_22938 ) ) ( not ( = ?auto_22937 ?auto_22938 ) ) ( not ( = ?auto_22935 ?auto_22938 ) ) ( not ( = ?auto_22941 ?auto_22938 ) ) ( IS-CRATE ?auto_22935 ) ( not ( = ?auto_22934 ?auto_22935 ) ) ( not ( = ?auto_22936 ?auto_22934 ) ) ( not ( = ?auto_22937 ?auto_22934 ) ) ( not ( = ?auto_22941 ?auto_22934 ) ) ( not ( = ?auto_22938 ?auto_22934 ) ) ( AVAILABLE ?auto_22939 ) ( SURFACE-AT ?auto_22935 ?auto_22946 ) ( ON ?auto_22935 ?auto_22943 ) ( CLEAR ?auto_22935 ) ( not ( = ?auto_22936 ?auto_22943 ) ) ( not ( = ?auto_22937 ?auto_22943 ) ) ( not ( = ?auto_22935 ?auto_22943 ) ) ( not ( = ?auto_22941 ?auto_22943 ) ) ( not ( = ?auto_22938 ?auto_22943 ) ) ( not ( = ?auto_22934 ?auto_22943 ) ) ( TRUCK-AT ?auto_22947 ?auto_22944 ) ( SURFACE-AT ?auto_22933 ?auto_22944 ) ( CLEAR ?auto_22933 ) ( LIFTING ?auto_22940 ?auto_22934 ) ( IS-CRATE ?auto_22934 ) ( not ( = ?auto_22933 ?auto_22934 ) ) ( not ( = ?auto_22936 ?auto_22933 ) ) ( not ( = ?auto_22937 ?auto_22933 ) ) ( not ( = ?auto_22935 ?auto_22933 ) ) ( not ( = ?auto_22941 ?auto_22933 ) ) ( not ( = ?auto_22938 ?auto_22933 ) ) ( not ( = ?auto_22943 ?auto_22933 ) ) ( ON ?auto_22933 ?auto_22932 ) ( not ( = ?auto_22932 ?auto_22933 ) ) ( not ( = ?auto_22932 ?auto_22934 ) ) ( not ( = ?auto_22932 ?auto_22935 ) ) ( not ( = ?auto_22932 ?auto_22936 ) ) ( not ( = ?auto_22932 ?auto_22937 ) ) ( not ( = ?auto_22932 ?auto_22941 ) ) ( not ( = ?auto_22932 ?auto_22938 ) ) ( not ( = ?auto_22932 ?auto_22943 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22935 ?auto_22936 ?auto_22937 )
      ( MAKE-5CRATE-VERIFY ?auto_22932 ?auto_22933 ?auto_22934 ?auto_22935 ?auto_22936 ?auto_22937 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22948 - SURFACE
      ?auto_22949 - SURFACE
    )
    :vars
    (
      ?auto_22952 - HOIST
      ?auto_22959 - PLACE
      ?auto_22953 - SURFACE
      ?auto_22961 - PLACE
      ?auto_22951 - HOIST
      ?auto_22956 - SURFACE
      ?auto_22960 - PLACE
      ?auto_22957 - HOIST
      ?auto_22950 - SURFACE
      ?auto_22955 - SURFACE
      ?auto_22958 - SURFACE
      ?auto_22962 - TRUCK
      ?auto_22954 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22952 ?auto_22959 ) ( IS-CRATE ?auto_22949 ) ( not ( = ?auto_22948 ?auto_22949 ) ) ( not ( = ?auto_22953 ?auto_22948 ) ) ( not ( = ?auto_22953 ?auto_22949 ) ) ( not ( = ?auto_22961 ?auto_22959 ) ) ( HOIST-AT ?auto_22951 ?auto_22961 ) ( not ( = ?auto_22952 ?auto_22951 ) ) ( SURFACE-AT ?auto_22949 ?auto_22961 ) ( ON ?auto_22949 ?auto_22956 ) ( CLEAR ?auto_22949 ) ( not ( = ?auto_22948 ?auto_22956 ) ) ( not ( = ?auto_22949 ?auto_22956 ) ) ( not ( = ?auto_22953 ?auto_22956 ) ) ( IS-CRATE ?auto_22948 ) ( not ( = ?auto_22960 ?auto_22959 ) ) ( not ( = ?auto_22961 ?auto_22960 ) ) ( HOIST-AT ?auto_22957 ?auto_22960 ) ( not ( = ?auto_22952 ?auto_22957 ) ) ( not ( = ?auto_22951 ?auto_22957 ) ) ( AVAILABLE ?auto_22957 ) ( SURFACE-AT ?auto_22948 ?auto_22960 ) ( ON ?auto_22948 ?auto_22950 ) ( CLEAR ?auto_22948 ) ( not ( = ?auto_22948 ?auto_22950 ) ) ( not ( = ?auto_22949 ?auto_22950 ) ) ( not ( = ?auto_22953 ?auto_22950 ) ) ( not ( = ?auto_22956 ?auto_22950 ) ) ( IS-CRATE ?auto_22953 ) ( not ( = ?auto_22955 ?auto_22953 ) ) ( not ( = ?auto_22948 ?auto_22955 ) ) ( not ( = ?auto_22949 ?auto_22955 ) ) ( not ( = ?auto_22956 ?auto_22955 ) ) ( not ( = ?auto_22950 ?auto_22955 ) ) ( AVAILABLE ?auto_22951 ) ( SURFACE-AT ?auto_22953 ?auto_22961 ) ( ON ?auto_22953 ?auto_22958 ) ( CLEAR ?auto_22953 ) ( not ( = ?auto_22948 ?auto_22958 ) ) ( not ( = ?auto_22949 ?auto_22958 ) ) ( not ( = ?auto_22953 ?auto_22958 ) ) ( not ( = ?auto_22956 ?auto_22958 ) ) ( not ( = ?auto_22950 ?auto_22958 ) ) ( not ( = ?auto_22955 ?auto_22958 ) ) ( TRUCK-AT ?auto_22962 ?auto_22959 ) ( SURFACE-AT ?auto_22954 ?auto_22959 ) ( CLEAR ?auto_22954 ) ( IS-CRATE ?auto_22955 ) ( not ( = ?auto_22954 ?auto_22955 ) ) ( not ( = ?auto_22948 ?auto_22954 ) ) ( not ( = ?auto_22949 ?auto_22954 ) ) ( not ( = ?auto_22953 ?auto_22954 ) ) ( not ( = ?auto_22956 ?auto_22954 ) ) ( not ( = ?auto_22950 ?auto_22954 ) ) ( not ( = ?auto_22958 ?auto_22954 ) ) ( AVAILABLE ?auto_22952 ) ( IN ?auto_22955 ?auto_22962 ) )
    :subtasks
    ( ( !UNLOAD ?auto_22952 ?auto_22955 ?auto_22962 ?auto_22959 )
      ( MAKE-2CRATE ?auto_22953 ?auto_22948 ?auto_22949 )
      ( MAKE-1CRATE-VERIFY ?auto_22948 ?auto_22949 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22963 - SURFACE
      ?auto_22964 - SURFACE
      ?auto_22965 - SURFACE
    )
    :vars
    (
      ?auto_22969 - HOIST
      ?auto_22968 - PLACE
      ?auto_22975 - PLACE
      ?auto_22972 - HOIST
      ?auto_22970 - SURFACE
      ?auto_22973 - PLACE
      ?auto_22976 - HOIST
      ?auto_22967 - SURFACE
      ?auto_22966 - SURFACE
      ?auto_22971 - SURFACE
      ?auto_22974 - TRUCK
      ?auto_22977 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22969 ?auto_22968 ) ( IS-CRATE ?auto_22965 ) ( not ( = ?auto_22964 ?auto_22965 ) ) ( not ( = ?auto_22963 ?auto_22964 ) ) ( not ( = ?auto_22963 ?auto_22965 ) ) ( not ( = ?auto_22975 ?auto_22968 ) ) ( HOIST-AT ?auto_22972 ?auto_22975 ) ( not ( = ?auto_22969 ?auto_22972 ) ) ( SURFACE-AT ?auto_22965 ?auto_22975 ) ( ON ?auto_22965 ?auto_22970 ) ( CLEAR ?auto_22965 ) ( not ( = ?auto_22964 ?auto_22970 ) ) ( not ( = ?auto_22965 ?auto_22970 ) ) ( not ( = ?auto_22963 ?auto_22970 ) ) ( IS-CRATE ?auto_22964 ) ( not ( = ?auto_22973 ?auto_22968 ) ) ( not ( = ?auto_22975 ?auto_22973 ) ) ( HOIST-AT ?auto_22976 ?auto_22973 ) ( not ( = ?auto_22969 ?auto_22976 ) ) ( not ( = ?auto_22972 ?auto_22976 ) ) ( AVAILABLE ?auto_22976 ) ( SURFACE-AT ?auto_22964 ?auto_22973 ) ( ON ?auto_22964 ?auto_22967 ) ( CLEAR ?auto_22964 ) ( not ( = ?auto_22964 ?auto_22967 ) ) ( not ( = ?auto_22965 ?auto_22967 ) ) ( not ( = ?auto_22963 ?auto_22967 ) ) ( not ( = ?auto_22970 ?auto_22967 ) ) ( IS-CRATE ?auto_22963 ) ( not ( = ?auto_22966 ?auto_22963 ) ) ( not ( = ?auto_22964 ?auto_22966 ) ) ( not ( = ?auto_22965 ?auto_22966 ) ) ( not ( = ?auto_22970 ?auto_22966 ) ) ( not ( = ?auto_22967 ?auto_22966 ) ) ( AVAILABLE ?auto_22972 ) ( SURFACE-AT ?auto_22963 ?auto_22975 ) ( ON ?auto_22963 ?auto_22971 ) ( CLEAR ?auto_22963 ) ( not ( = ?auto_22964 ?auto_22971 ) ) ( not ( = ?auto_22965 ?auto_22971 ) ) ( not ( = ?auto_22963 ?auto_22971 ) ) ( not ( = ?auto_22970 ?auto_22971 ) ) ( not ( = ?auto_22967 ?auto_22971 ) ) ( not ( = ?auto_22966 ?auto_22971 ) ) ( TRUCK-AT ?auto_22974 ?auto_22968 ) ( SURFACE-AT ?auto_22977 ?auto_22968 ) ( CLEAR ?auto_22977 ) ( IS-CRATE ?auto_22966 ) ( not ( = ?auto_22977 ?auto_22966 ) ) ( not ( = ?auto_22964 ?auto_22977 ) ) ( not ( = ?auto_22965 ?auto_22977 ) ) ( not ( = ?auto_22963 ?auto_22977 ) ) ( not ( = ?auto_22970 ?auto_22977 ) ) ( not ( = ?auto_22967 ?auto_22977 ) ) ( not ( = ?auto_22971 ?auto_22977 ) ) ( AVAILABLE ?auto_22969 ) ( IN ?auto_22966 ?auto_22974 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22964 ?auto_22965 )
      ( MAKE-2CRATE-VERIFY ?auto_22963 ?auto_22964 ?auto_22965 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22978 - SURFACE
      ?auto_22979 - SURFACE
      ?auto_22980 - SURFACE
      ?auto_22981 - SURFACE
    )
    :vars
    (
      ?auto_22987 - HOIST
      ?auto_22982 - PLACE
      ?auto_22990 - PLACE
      ?auto_22986 - HOIST
      ?auto_22991 - SURFACE
      ?auto_22985 - PLACE
      ?auto_22988 - HOIST
      ?auto_22992 - SURFACE
      ?auto_22989 - SURFACE
      ?auto_22984 - TRUCK
      ?auto_22983 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22987 ?auto_22982 ) ( IS-CRATE ?auto_22981 ) ( not ( = ?auto_22980 ?auto_22981 ) ) ( not ( = ?auto_22979 ?auto_22980 ) ) ( not ( = ?auto_22979 ?auto_22981 ) ) ( not ( = ?auto_22990 ?auto_22982 ) ) ( HOIST-AT ?auto_22986 ?auto_22990 ) ( not ( = ?auto_22987 ?auto_22986 ) ) ( SURFACE-AT ?auto_22981 ?auto_22990 ) ( ON ?auto_22981 ?auto_22991 ) ( CLEAR ?auto_22981 ) ( not ( = ?auto_22980 ?auto_22991 ) ) ( not ( = ?auto_22981 ?auto_22991 ) ) ( not ( = ?auto_22979 ?auto_22991 ) ) ( IS-CRATE ?auto_22980 ) ( not ( = ?auto_22985 ?auto_22982 ) ) ( not ( = ?auto_22990 ?auto_22985 ) ) ( HOIST-AT ?auto_22988 ?auto_22985 ) ( not ( = ?auto_22987 ?auto_22988 ) ) ( not ( = ?auto_22986 ?auto_22988 ) ) ( AVAILABLE ?auto_22988 ) ( SURFACE-AT ?auto_22980 ?auto_22985 ) ( ON ?auto_22980 ?auto_22992 ) ( CLEAR ?auto_22980 ) ( not ( = ?auto_22980 ?auto_22992 ) ) ( not ( = ?auto_22981 ?auto_22992 ) ) ( not ( = ?auto_22979 ?auto_22992 ) ) ( not ( = ?auto_22991 ?auto_22992 ) ) ( IS-CRATE ?auto_22979 ) ( not ( = ?auto_22978 ?auto_22979 ) ) ( not ( = ?auto_22980 ?auto_22978 ) ) ( not ( = ?auto_22981 ?auto_22978 ) ) ( not ( = ?auto_22991 ?auto_22978 ) ) ( not ( = ?auto_22992 ?auto_22978 ) ) ( AVAILABLE ?auto_22986 ) ( SURFACE-AT ?auto_22979 ?auto_22990 ) ( ON ?auto_22979 ?auto_22989 ) ( CLEAR ?auto_22979 ) ( not ( = ?auto_22980 ?auto_22989 ) ) ( not ( = ?auto_22981 ?auto_22989 ) ) ( not ( = ?auto_22979 ?auto_22989 ) ) ( not ( = ?auto_22991 ?auto_22989 ) ) ( not ( = ?auto_22992 ?auto_22989 ) ) ( not ( = ?auto_22978 ?auto_22989 ) ) ( TRUCK-AT ?auto_22984 ?auto_22982 ) ( SURFACE-AT ?auto_22983 ?auto_22982 ) ( CLEAR ?auto_22983 ) ( IS-CRATE ?auto_22978 ) ( not ( = ?auto_22983 ?auto_22978 ) ) ( not ( = ?auto_22980 ?auto_22983 ) ) ( not ( = ?auto_22981 ?auto_22983 ) ) ( not ( = ?auto_22979 ?auto_22983 ) ) ( not ( = ?auto_22991 ?auto_22983 ) ) ( not ( = ?auto_22992 ?auto_22983 ) ) ( not ( = ?auto_22989 ?auto_22983 ) ) ( AVAILABLE ?auto_22987 ) ( IN ?auto_22978 ?auto_22984 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22979 ?auto_22980 ?auto_22981 )
      ( MAKE-3CRATE-VERIFY ?auto_22978 ?auto_22979 ?auto_22980 ?auto_22981 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22993 - SURFACE
      ?auto_22994 - SURFACE
      ?auto_22995 - SURFACE
      ?auto_22996 - SURFACE
      ?auto_22997 - SURFACE
    )
    :vars
    (
      ?auto_23002 - HOIST
      ?auto_22998 - PLACE
      ?auto_23005 - PLACE
      ?auto_23001 - HOIST
      ?auto_23006 - SURFACE
      ?auto_23000 - PLACE
      ?auto_23003 - HOIST
      ?auto_23007 - SURFACE
      ?auto_23004 - SURFACE
      ?auto_22999 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23002 ?auto_22998 ) ( IS-CRATE ?auto_22997 ) ( not ( = ?auto_22996 ?auto_22997 ) ) ( not ( = ?auto_22995 ?auto_22996 ) ) ( not ( = ?auto_22995 ?auto_22997 ) ) ( not ( = ?auto_23005 ?auto_22998 ) ) ( HOIST-AT ?auto_23001 ?auto_23005 ) ( not ( = ?auto_23002 ?auto_23001 ) ) ( SURFACE-AT ?auto_22997 ?auto_23005 ) ( ON ?auto_22997 ?auto_23006 ) ( CLEAR ?auto_22997 ) ( not ( = ?auto_22996 ?auto_23006 ) ) ( not ( = ?auto_22997 ?auto_23006 ) ) ( not ( = ?auto_22995 ?auto_23006 ) ) ( IS-CRATE ?auto_22996 ) ( not ( = ?auto_23000 ?auto_22998 ) ) ( not ( = ?auto_23005 ?auto_23000 ) ) ( HOIST-AT ?auto_23003 ?auto_23000 ) ( not ( = ?auto_23002 ?auto_23003 ) ) ( not ( = ?auto_23001 ?auto_23003 ) ) ( AVAILABLE ?auto_23003 ) ( SURFACE-AT ?auto_22996 ?auto_23000 ) ( ON ?auto_22996 ?auto_23007 ) ( CLEAR ?auto_22996 ) ( not ( = ?auto_22996 ?auto_23007 ) ) ( not ( = ?auto_22997 ?auto_23007 ) ) ( not ( = ?auto_22995 ?auto_23007 ) ) ( not ( = ?auto_23006 ?auto_23007 ) ) ( IS-CRATE ?auto_22995 ) ( not ( = ?auto_22994 ?auto_22995 ) ) ( not ( = ?auto_22996 ?auto_22994 ) ) ( not ( = ?auto_22997 ?auto_22994 ) ) ( not ( = ?auto_23006 ?auto_22994 ) ) ( not ( = ?auto_23007 ?auto_22994 ) ) ( AVAILABLE ?auto_23001 ) ( SURFACE-AT ?auto_22995 ?auto_23005 ) ( ON ?auto_22995 ?auto_23004 ) ( CLEAR ?auto_22995 ) ( not ( = ?auto_22996 ?auto_23004 ) ) ( not ( = ?auto_22997 ?auto_23004 ) ) ( not ( = ?auto_22995 ?auto_23004 ) ) ( not ( = ?auto_23006 ?auto_23004 ) ) ( not ( = ?auto_23007 ?auto_23004 ) ) ( not ( = ?auto_22994 ?auto_23004 ) ) ( TRUCK-AT ?auto_22999 ?auto_22998 ) ( SURFACE-AT ?auto_22993 ?auto_22998 ) ( CLEAR ?auto_22993 ) ( IS-CRATE ?auto_22994 ) ( not ( = ?auto_22993 ?auto_22994 ) ) ( not ( = ?auto_22996 ?auto_22993 ) ) ( not ( = ?auto_22997 ?auto_22993 ) ) ( not ( = ?auto_22995 ?auto_22993 ) ) ( not ( = ?auto_23006 ?auto_22993 ) ) ( not ( = ?auto_23007 ?auto_22993 ) ) ( not ( = ?auto_23004 ?auto_22993 ) ) ( AVAILABLE ?auto_23002 ) ( IN ?auto_22994 ?auto_22999 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22995 ?auto_22996 ?auto_22997 )
      ( MAKE-4CRATE-VERIFY ?auto_22993 ?auto_22994 ?auto_22995 ?auto_22996 ?auto_22997 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23008 - SURFACE
      ?auto_23009 - SURFACE
      ?auto_23010 - SURFACE
      ?auto_23011 - SURFACE
      ?auto_23012 - SURFACE
      ?auto_23013 - SURFACE
    )
    :vars
    (
      ?auto_23018 - HOIST
      ?auto_23014 - PLACE
      ?auto_23021 - PLACE
      ?auto_23017 - HOIST
      ?auto_23022 - SURFACE
      ?auto_23016 - PLACE
      ?auto_23019 - HOIST
      ?auto_23023 - SURFACE
      ?auto_23020 - SURFACE
      ?auto_23015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23018 ?auto_23014 ) ( IS-CRATE ?auto_23013 ) ( not ( = ?auto_23012 ?auto_23013 ) ) ( not ( = ?auto_23011 ?auto_23012 ) ) ( not ( = ?auto_23011 ?auto_23013 ) ) ( not ( = ?auto_23021 ?auto_23014 ) ) ( HOIST-AT ?auto_23017 ?auto_23021 ) ( not ( = ?auto_23018 ?auto_23017 ) ) ( SURFACE-AT ?auto_23013 ?auto_23021 ) ( ON ?auto_23013 ?auto_23022 ) ( CLEAR ?auto_23013 ) ( not ( = ?auto_23012 ?auto_23022 ) ) ( not ( = ?auto_23013 ?auto_23022 ) ) ( not ( = ?auto_23011 ?auto_23022 ) ) ( IS-CRATE ?auto_23012 ) ( not ( = ?auto_23016 ?auto_23014 ) ) ( not ( = ?auto_23021 ?auto_23016 ) ) ( HOIST-AT ?auto_23019 ?auto_23016 ) ( not ( = ?auto_23018 ?auto_23019 ) ) ( not ( = ?auto_23017 ?auto_23019 ) ) ( AVAILABLE ?auto_23019 ) ( SURFACE-AT ?auto_23012 ?auto_23016 ) ( ON ?auto_23012 ?auto_23023 ) ( CLEAR ?auto_23012 ) ( not ( = ?auto_23012 ?auto_23023 ) ) ( not ( = ?auto_23013 ?auto_23023 ) ) ( not ( = ?auto_23011 ?auto_23023 ) ) ( not ( = ?auto_23022 ?auto_23023 ) ) ( IS-CRATE ?auto_23011 ) ( not ( = ?auto_23010 ?auto_23011 ) ) ( not ( = ?auto_23012 ?auto_23010 ) ) ( not ( = ?auto_23013 ?auto_23010 ) ) ( not ( = ?auto_23022 ?auto_23010 ) ) ( not ( = ?auto_23023 ?auto_23010 ) ) ( AVAILABLE ?auto_23017 ) ( SURFACE-AT ?auto_23011 ?auto_23021 ) ( ON ?auto_23011 ?auto_23020 ) ( CLEAR ?auto_23011 ) ( not ( = ?auto_23012 ?auto_23020 ) ) ( not ( = ?auto_23013 ?auto_23020 ) ) ( not ( = ?auto_23011 ?auto_23020 ) ) ( not ( = ?auto_23022 ?auto_23020 ) ) ( not ( = ?auto_23023 ?auto_23020 ) ) ( not ( = ?auto_23010 ?auto_23020 ) ) ( TRUCK-AT ?auto_23015 ?auto_23014 ) ( SURFACE-AT ?auto_23009 ?auto_23014 ) ( CLEAR ?auto_23009 ) ( IS-CRATE ?auto_23010 ) ( not ( = ?auto_23009 ?auto_23010 ) ) ( not ( = ?auto_23012 ?auto_23009 ) ) ( not ( = ?auto_23013 ?auto_23009 ) ) ( not ( = ?auto_23011 ?auto_23009 ) ) ( not ( = ?auto_23022 ?auto_23009 ) ) ( not ( = ?auto_23023 ?auto_23009 ) ) ( not ( = ?auto_23020 ?auto_23009 ) ) ( AVAILABLE ?auto_23018 ) ( IN ?auto_23010 ?auto_23015 ) ( ON ?auto_23009 ?auto_23008 ) ( not ( = ?auto_23008 ?auto_23009 ) ) ( not ( = ?auto_23008 ?auto_23010 ) ) ( not ( = ?auto_23008 ?auto_23011 ) ) ( not ( = ?auto_23008 ?auto_23012 ) ) ( not ( = ?auto_23008 ?auto_23013 ) ) ( not ( = ?auto_23008 ?auto_23022 ) ) ( not ( = ?auto_23008 ?auto_23023 ) ) ( not ( = ?auto_23008 ?auto_23020 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23011 ?auto_23012 ?auto_23013 )
      ( MAKE-5CRATE-VERIFY ?auto_23008 ?auto_23009 ?auto_23010 ?auto_23011 ?auto_23012 ?auto_23013 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23024 - SURFACE
      ?auto_23025 - SURFACE
    )
    :vars
    (
      ?auto_23031 - HOIST
      ?auto_23026 - PLACE
      ?auto_23038 - SURFACE
      ?auto_23035 - PLACE
      ?auto_23030 - HOIST
      ?auto_23036 - SURFACE
      ?auto_23029 - PLACE
      ?auto_23032 - HOIST
      ?auto_23037 - SURFACE
      ?auto_23033 - SURFACE
      ?auto_23034 - SURFACE
      ?auto_23027 - SURFACE
      ?auto_23028 - TRUCK
      ?auto_23039 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23031 ?auto_23026 ) ( IS-CRATE ?auto_23025 ) ( not ( = ?auto_23024 ?auto_23025 ) ) ( not ( = ?auto_23038 ?auto_23024 ) ) ( not ( = ?auto_23038 ?auto_23025 ) ) ( not ( = ?auto_23035 ?auto_23026 ) ) ( HOIST-AT ?auto_23030 ?auto_23035 ) ( not ( = ?auto_23031 ?auto_23030 ) ) ( SURFACE-AT ?auto_23025 ?auto_23035 ) ( ON ?auto_23025 ?auto_23036 ) ( CLEAR ?auto_23025 ) ( not ( = ?auto_23024 ?auto_23036 ) ) ( not ( = ?auto_23025 ?auto_23036 ) ) ( not ( = ?auto_23038 ?auto_23036 ) ) ( IS-CRATE ?auto_23024 ) ( not ( = ?auto_23029 ?auto_23026 ) ) ( not ( = ?auto_23035 ?auto_23029 ) ) ( HOIST-AT ?auto_23032 ?auto_23029 ) ( not ( = ?auto_23031 ?auto_23032 ) ) ( not ( = ?auto_23030 ?auto_23032 ) ) ( AVAILABLE ?auto_23032 ) ( SURFACE-AT ?auto_23024 ?auto_23029 ) ( ON ?auto_23024 ?auto_23037 ) ( CLEAR ?auto_23024 ) ( not ( = ?auto_23024 ?auto_23037 ) ) ( not ( = ?auto_23025 ?auto_23037 ) ) ( not ( = ?auto_23038 ?auto_23037 ) ) ( not ( = ?auto_23036 ?auto_23037 ) ) ( IS-CRATE ?auto_23038 ) ( not ( = ?auto_23033 ?auto_23038 ) ) ( not ( = ?auto_23024 ?auto_23033 ) ) ( not ( = ?auto_23025 ?auto_23033 ) ) ( not ( = ?auto_23036 ?auto_23033 ) ) ( not ( = ?auto_23037 ?auto_23033 ) ) ( AVAILABLE ?auto_23030 ) ( SURFACE-AT ?auto_23038 ?auto_23035 ) ( ON ?auto_23038 ?auto_23034 ) ( CLEAR ?auto_23038 ) ( not ( = ?auto_23024 ?auto_23034 ) ) ( not ( = ?auto_23025 ?auto_23034 ) ) ( not ( = ?auto_23038 ?auto_23034 ) ) ( not ( = ?auto_23036 ?auto_23034 ) ) ( not ( = ?auto_23037 ?auto_23034 ) ) ( not ( = ?auto_23033 ?auto_23034 ) ) ( SURFACE-AT ?auto_23027 ?auto_23026 ) ( CLEAR ?auto_23027 ) ( IS-CRATE ?auto_23033 ) ( not ( = ?auto_23027 ?auto_23033 ) ) ( not ( = ?auto_23024 ?auto_23027 ) ) ( not ( = ?auto_23025 ?auto_23027 ) ) ( not ( = ?auto_23038 ?auto_23027 ) ) ( not ( = ?auto_23036 ?auto_23027 ) ) ( not ( = ?auto_23037 ?auto_23027 ) ) ( not ( = ?auto_23034 ?auto_23027 ) ) ( AVAILABLE ?auto_23031 ) ( IN ?auto_23033 ?auto_23028 ) ( TRUCK-AT ?auto_23028 ?auto_23039 ) ( not ( = ?auto_23039 ?auto_23026 ) ) ( not ( = ?auto_23035 ?auto_23039 ) ) ( not ( = ?auto_23029 ?auto_23039 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23028 ?auto_23039 ?auto_23026 )
      ( MAKE-2CRATE ?auto_23038 ?auto_23024 ?auto_23025 )
      ( MAKE-1CRATE-VERIFY ?auto_23024 ?auto_23025 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23040 - SURFACE
      ?auto_23041 - SURFACE
      ?auto_23042 - SURFACE
    )
    :vars
    (
      ?auto_23045 - HOIST
      ?auto_23053 - PLACE
      ?auto_23048 - PLACE
      ?auto_23043 - HOIST
      ?auto_23047 - SURFACE
      ?auto_23054 - PLACE
      ?auto_23051 - HOIST
      ?auto_23055 - SURFACE
      ?auto_23050 - SURFACE
      ?auto_23046 - SURFACE
      ?auto_23044 - SURFACE
      ?auto_23049 - TRUCK
      ?auto_23052 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23045 ?auto_23053 ) ( IS-CRATE ?auto_23042 ) ( not ( = ?auto_23041 ?auto_23042 ) ) ( not ( = ?auto_23040 ?auto_23041 ) ) ( not ( = ?auto_23040 ?auto_23042 ) ) ( not ( = ?auto_23048 ?auto_23053 ) ) ( HOIST-AT ?auto_23043 ?auto_23048 ) ( not ( = ?auto_23045 ?auto_23043 ) ) ( SURFACE-AT ?auto_23042 ?auto_23048 ) ( ON ?auto_23042 ?auto_23047 ) ( CLEAR ?auto_23042 ) ( not ( = ?auto_23041 ?auto_23047 ) ) ( not ( = ?auto_23042 ?auto_23047 ) ) ( not ( = ?auto_23040 ?auto_23047 ) ) ( IS-CRATE ?auto_23041 ) ( not ( = ?auto_23054 ?auto_23053 ) ) ( not ( = ?auto_23048 ?auto_23054 ) ) ( HOIST-AT ?auto_23051 ?auto_23054 ) ( not ( = ?auto_23045 ?auto_23051 ) ) ( not ( = ?auto_23043 ?auto_23051 ) ) ( AVAILABLE ?auto_23051 ) ( SURFACE-AT ?auto_23041 ?auto_23054 ) ( ON ?auto_23041 ?auto_23055 ) ( CLEAR ?auto_23041 ) ( not ( = ?auto_23041 ?auto_23055 ) ) ( not ( = ?auto_23042 ?auto_23055 ) ) ( not ( = ?auto_23040 ?auto_23055 ) ) ( not ( = ?auto_23047 ?auto_23055 ) ) ( IS-CRATE ?auto_23040 ) ( not ( = ?auto_23050 ?auto_23040 ) ) ( not ( = ?auto_23041 ?auto_23050 ) ) ( not ( = ?auto_23042 ?auto_23050 ) ) ( not ( = ?auto_23047 ?auto_23050 ) ) ( not ( = ?auto_23055 ?auto_23050 ) ) ( AVAILABLE ?auto_23043 ) ( SURFACE-AT ?auto_23040 ?auto_23048 ) ( ON ?auto_23040 ?auto_23046 ) ( CLEAR ?auto_23040 ) ( not ( = ?auto_23041 ?auto_23046 ) ) ( not ( = ?auto_23042 ?auto_23046 ) ) ( not ( = ?auto_23040 ?auto_23046 ) ) ( not ( = ?auto_23047 ?auto_23046 ) ) ( not ( = ?auto_23055 ?auto_23046 ) ) ( not ( = ?auto_23050 ?auto_23046 ) ) ( SURFACE-AT ?auto_23044 ?auto_23053 ) ( CLEAR ?auto_23044 ) ( IS-CRATE ?auto_23050 ) ( not ( = ?auto_23044 ?auto_23050 ) ) ( not ( = ?auto_23041 ?auto_23044 ) ) ( not ( = ?auto_23042 ?auto_23044 ) ) ( not ( = ?auto_23040 ?auto_23044 ) ) ( not ( = ?auto_23047 ?auto_23044 ) ) ( not ( = ?auto_23055 ?auto_23044 ) ) ( not ( = ?auto_23046 ?auto_23044 ) ) ( AVAILABLE ?auto_23045 ) ( IN ?auto_23050 ?auto_23049 ) ( TRUCK-AT ?auto_23049 ?auto_23052 ) ( not ( = ?auto_23052 ?auto_23053 ) ) ( not ( = ?auto_23048 ?auto_23052 ) ) ( not ( = ?auto_23054 ?auto_23052 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23041 ?auto_23042 )
      ( MAKE-2CRATE-VERIFY ?auto_23040 ?auto_23041 ?auto_23042 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23056 - SURFACE
      ?auto_23057 - SURFACE
      ?auto_23058 - SURFACE
      ?auto_23059 - SURFACE
    )
    :vars
    (
      ?auto_23068 - HOIST
      ?auto_23067 - PLACE
      ?auto_23062 - PLACE
      ?auto_23060 - HOIST
      ?auto_23066 - SURFACE
      ?auto_23071 - PLACE
      ?auto_23061 - HOIST
      ?auto_23070 - SURFACE
      ?auto_23065 - SURFACE
      ?auto_23063 - SURFACE
      ?auto_23064 - TRUCK
      ?auto_23069 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23068 ?auto_23067 ) ( IS-CRATE ?auto_23059 ) ( not ( = ?auto_23058 ?auto_23059 ) ) ( not ( = ?auto_23057 ?auto_23058 ) ) ( not ( = ?auto_23057 ?auto_23059 ) ) ( not ( = ?auto_23062 ?auto_23067 ) ) ( HOIST-AT ?auto_23060 ?auto_23062 ) ( not ( = ?auto_23068 ?auto_23060 ) ) ( SURFACE-AT ?auto_23059 ?auto_23062 ) ( ON ?auto_23059 ?auto_23066 ) ( CLEAR ?auto_23059 ) ( not ( = ?auto_23058 ?auto_23066 ) ) ( not ( = ?auto_23059 ?auto_23066 ) ) ( not ( = ?auto_23057 ?auto_23066 ) ) ( IS-CRATE ?auto_23058 ) ( not ( = ?auto_23071 ?auto_23067 ) ) ( not ( = ?auto_23062 ?auto_23071 ) ) ( HOIST-AT ?auto_23061 ?auto_23071 ) ( not ( = ?auto_23068 ?auto_23061 ) ) ( not ( = ?auto_23060 ?auto_23061 ) ) ( AVAILABLE ?auto_23061 ) ( SURFACE-AT ?auto_23058 ?auto_23071 ) ( ON ?auto_23058 ?auto_23070 ) ( CLEAR ?auto_23058 ) ( not ( = ?auto_23058 ?auto_23070 ) ) ( not ( = ?auto_23059 ?auto_23070 ) ) ( not ( = ?auto_23057 ?auto_23070 ) ) ( not ( = ?auto_23066 ?auto_23070 ) ) ( IS-CRATE ?auto_23057 ) ( not ( = ?auto_23056 ?auto_23057 ) ) ( not ( = ?auto_23058 ?auto_23056 ) ) ( not ( = ?auto_23059 ?auto_23056 ) ) ( not ( = ?auto_23066 ?auto_23056 ) ) ( not ( = ?auto_23070 ?auto_23056 ) ) ( AVAILABLE ?auto_23060 ) ( SURFACE-AT ?auto_23057 ?auto_23062 ) ( ON ?auto_23057 ?auto_23065 ) ( CLEAR ?auto_23057 ) ( not ( = ?auto_23058 ?auto_23065 ) ) ( not ( = ?auto_23059 ?auto_23065 ) ) ( not ( = ?auto_23057 ?auto_23065 ) ) ( not ( = ?auto_23066 ?auto_23065 ) ) ( not ( = ?auto_23070 ?auto_23065 ) ) ( not ( = ?auto_23056 ?auto_23065 ) ) ( SURFACE-AT ?auto_23063 ?auto_23067 ) ( CLEAR ?auto_23063 ) ( IS-CRATE ?auto_23056 ) ( not ( = ?auto_23063 ?auto_23056 ) ) ( not ( = ?auto_23058 ?auto_23063 ) ) ( not ( = ?auto_23059 ?auto_23063 ) ) ( not ( = ?auto_23057 ?auto_23063 ) ) ( not ( = ?auto_23066 ?auto_23063 ) ) ( not ( = ?auto_23070 ?auto_23063 ) ) ( not ( = ?auto_23065 ?auto_23063 ) ) ( AVAILABLE ?auto_23068 ) ( IN ?auto_23056 ?auto_23064 ) ( TRUCK-AT ?auto_23064 ?auto_23069 ) ( not ( = ?auto_23069 ?auto_23067 ) ) ( not ( = ?auto_23062 ?auto_23069 ) ) ( not ( = ?auto_23071 ?auto_23069 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23057 ?auto_23058 ?auto_23059 )
      ( MAKE-3CRATE-VERIFY ?auto_23056 ?auto_23057 ?auto_23058 ?auto_23059 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23072 - SURFACE
      ?auto_23073 - SURFACE
      ?auto_23074 - SURFACE
      ?auto_23075 - SURFACE
      ?auto_23076 - SURFACE
    )
    :vars
    (
      ?auto_23084 - HOIST
      ?auto_23083 - PLACE
      ?auto_23079 - PLACE
      ?auto_23077 - HOIST
      ?auto_23082 - SURFACE
      ?auto_23087 - PLACE
      ?auto_23078 - HOIST
      ?auto_23086 - SURFACE
      ?auto_23081 - SURFACE
      ?auto_23080 - TRUCK
      ?auto_23085 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23084 ?auto_23083 ) ( IS-CRATE ?auto_23076 ) ( not ( = ?auto_23075 ?auto_23076 ) ) ( not ( = ?auto_23074 ?auto_23075 ) ) ( not ( = ?auto_23074 ?auto_23076 ) ) ( not ( = ?auto_23079 ?auto_23083 ) ) ( HOIST-AT ?auto_23077 ?auto_23079 ) ( not ( = ?auto_23084 ?auto_23077 ) ) ( SURFACE-AT ?auto_23076 ?auto_23079 ) ( ON ?auto_23076 ?auto_23082 ) ( CLEAR ?auto_23076 ) ( not ( = ?auto_23075 ?auto_23082 ) ) ( not ( = ?auto_23076 ?auto_23082 ) ) ( not ( = ?auto_23074 ?auto_23082 ) ) ( IS-CRATE ?auto_23075 ) ( not ( = ?auto_23087 ?auto_23083 ) ) ( not ( = ?auto_23079 ?auto_23087 ) ) ( HOIST-AT ?auto_23078 ?auto_23087 ) ( not ( = ?auto_23084 ?auto_23078 ) ) ( not ( = ?auto_23077 ?auto_23078 ) ) ( AVAILABLE ?auto_23078 ) ( SURFACE-AT ?auto_23075 ?auto_23087 ) ( ON ?auto_23075 ?auto_23086 ) ( CLEAR ?auto_23075 ) ( not ( = ?auto_23075 ?auto_23086 ) ) ( not ( = ?auto_23076 ?auto_23086 ) ) ( not ( = ?auto_23074 ?auto_23086 ) ) ( not ( = ?auto_23082 ?auto_23086 ) ) ( IS-CRATE ?auto_23074 ) ( not ( = ?auto_23073 ?auto_23074 ) ) ( not ( = ?auto_23075 ?auto_23073 ) ) ( not ( = ?auto_23076 ?auto_23073 ) ) ( not ( = ?auto_23082 ?auto_23073 ) ) ( not ( = ?auto_23086 ?auto_23073 ) ) ( AVAILABLE ?auto_23077 ) ( SURFACE-AT ?auto_23074 ?auto_23079 ) ( ON ?auto_23074 ?auto_23081 ) ( CLEAR ?auto_23074 ) ( not ( = ?auto_23075 ?auto_23081 ) ) ( not ( = ?auto_23076 ?auto_23081 ) ) ( not ( = ?auto_23074 ?auto_23081 ) ) ( not ( = ?auto_23082 ?auto_23081 ) ) ( not ( = ?auto_23086 ?auto_23081 ) ) ( not ( = ?auto_23073 ?auto_23081 ) ) ( SURFACE-AT ?auto_23072 ?auto_23083 ) ( CLEAR ?auto_23072 ) ( IS-CRATE ?auto_23073 ) ( not ( = ?auto_23072 ?auto_23073 ) ) ( not ( = ?auto_23075 ?auto_23072 ) ) ( not ( = ?auto_23076 ?auto_23072 ) ) ( not ( = ?auto_23074 ?auto_23072 ) ) ( not ( = ?auto_23082 ?auto_23072 ) ) ( not ( = ?auto_23086 ?auto_23072 ) ) ( not ( = ?auto_23081 ?auto_23072 ) ) ( AVAILABLE ?auto_23084 ) ( IN ?auto_23073 ?auto_23080 ) ( TRUCK-AT ?auto_23080 ?auto_23085 ) ( not ( = ?auto_23085 ?auto_23083 ) ) ( not ( = ?auto_23079 ?auto_23085 ) ) ( not ( = ?auto_23087 ?auto_23085 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23074 ?auto_23075 ?auto_23076 )
      ( MAKE-4CRATE-VERIFY ?auto_23072 ?auto_23073 ?auto_23074 ?auto_23075 ?auto_23076 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23088 - SURFACE
      ?auto_23089 - SURFACE
      ?auto_23090 - SURFACE
      ?auto_23091 - SURFACE
      ?auto_23092 - SURFACE
      ?auto_23093 - SURFACE
    )
    :vars
    (
      ?auto_23101 - HOIST
      ?auto_23100 - PLACE
      ?auto_23096 - PLACE
      ?auto_23094 - HOIST
      ?auto_23099 - SURFACE
      ?auto_23104 - PLACE
      ?auto_23095 - HOIST
      ?auto_23103 - SURFACE
      ?auto_23098 - SURFACE
      ?auto_23097 - TRUCK
      ?auto_23102 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23101 ?auto_23100 ) ( IS-CRATE ?auto_23093 ) ( not ( = ?auto_23092 ?auto_23093 ) ) ( not ( = ?auto_23091 ?auto_23092 ) ) ( not ( = ?auto_23091 ?auto_23093 ) ) ( not ( = ?auto_23096 ?auto_23100 ) ) ( HOIST-AT ?auto_23094 ?auto_23096 ) ( not ( = ?auto_23101 ?auto_23094 ) ) ( SURFACE-AT ?auto_23093 ?auto_23096 ) ( ON ?auto_23093 ?auto_23099 ) ( CLEAR ?auto_23093 ) ( not ( = ?auto_23092 ?auto_23099 ) ) ( not ( = ?auto_23093 ?auto_23099 ) ) ( not ( = ?auto_23091 ?auto_23099 ) ) ( IS-CRATE ?auto_23092 ) ( not ( = ?auto_23104 ?auto_23100 ) ) ( not ( = ?auto_23096 ?auto_23104 ) ) ( HOIST-AT ?auto_23095 ?auto_23104 ) ( not ( = ?auto_23101 ?auto_23095 ) ) ( not ( = ?auto_23094 ?auto_23095 ) ) ( AVAILABLE ?auto_23095 ) ( SURFACE-AT ?auto_23092 ?auto_23104 ) ( ON ?auto_23092 ?auto_23103 ) ( CLEAR ?auto_23092 ) ( not ( = ?auto_23092 ?auto_23103 ) ) ( not ( = ?auto_23093 ?auto_23103 ) ) ( not ( = ?auto_23091 ?auto_23103 ) ) ( not ( = ?auto_23099 ?auto_23103 ) ) ( IS-CRATE ?auto_23091 ) ( not ( = ?auto_23090 ?auto_23091 ) ) ( not ( = ?auto_23092 ?auto_23090 ) ) ( not ( = ?auto_23093 ?auto_23090 ) ) ( not ( = ?auto_23099 ?auto_23090 ) ) ( not ( = ?auto_23103 ?auto_23090 ) ) ( AVAILABLE ?auto_23094 ) ( SURFACE-AT ?auto_23091 ?auto_23096 ) ( ON ?auto_23091 ?auto_23098 ) ( CLEAR ?auto_23091 ) ( not ( = ?auto_23092 ?auto_23098 ) ) ( not ( = ?auto_23093 ?auto_23098 ) ) ( not ( = ?auto_23091 ?auto_23098 ) ) ( not ( = ?auto_23099 ?auto_23098 ) ) ( not ( = ?auto_23103 ?auto_23098 ) ) ( not ( = ?auto_23090 ?auto_23098 ) ) ( SURFACE-AT ?auto_23089 ?auto_23100 ) ( CLEAR ?auto_23089 ) ( IS-CRATE ?auto_23090 ) ( not ( = ?auto_23089 ?auto_23090 ) ) ( not ( = ?auto_23092 ?auto_23089 ) ) ( not ( = ?auto_23093 ?auto_23089 ) ) ( not ( = ?auto_23091 ?auto_23089 ) ) ( not ( = ?auto_23099 ?auto_23089 ) ) ( not ( = ?auto_23103 ?auto_23089 ) ) ( not ( = ?auto_23098 ?auto_23089 ) ) ( AVAILABLE ?auto_23101 ) ( IN ?auto_23090 ?auto_23097 ) ( TRUCK-AT ?auto_23097 ?auto_23102 ) ( not ( = ?auto_23102 ?auto_23100 ) ) ( not ( = ?auto_23096 ?auto_23102 ) ) ( not ( = ?auto_23104 ?auto_23102 ) ) ( ON ?auto_23089 ?auto_23088 ) ( not ( = ?auto_23088 ?auto_23089 ) ) ( not ( = ?auto_23088 ?auto_23090 ) ) ( not ( = ?auto_23088 ?auto_23091 ) ) ( not ( = ?auto_23088 ?auto_23092 ) ) ( not ( = ?auto_23088 ?auto_23093 ) ) ( not ( = ?auto_23088 ?auto_23099 ) ) ( not ( = ?auto_23088 ?auto_23103 ) ) ( not ( = ?auto_23088 ?auto_23098 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23091 ?auto_23092 ?auto_23093 )
      ( MAKE-5CRATE-VERIFY ?auto_23088 ?auto_23089 ?auto_23090 ?auto_23091 ?auto_23092 ?auto_23093 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23105 - SURFACE
      ?auto_23106 - SURFACE
    )
    :vars
    (
      ?auto_23117 - HOIST
      ?auto_23116 - PLACE
      ?auto_23108 - SURFACE
      ?auto_23110 - PLACE
      ?auto_23107 - HOIST
      ?auto_23115 - SURFACE
      ?auto_23120 - PLACE
      ?auto_23109 - HOIST
      ?auto_23119 - SURFACE
      ?auto_23113 - SURFACE
      ?auto_23114 - SURFACE
      ?auto_23111 - SURFACE
      ?auto_23112 - TRUCK
      ?auto_23118 - PLACE
      ?auto_23121 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23117 ?auto_23116 ) ( IS-CRATE ?auto_23106 ) ( not ( = ?auto_23105 ?auto_23106 ) ) ( not ( = ?auto_23108 ?auto_23105 ) ) ( not ( = ?auto_23108 ?auto_23106 ) ) ( not ( = ?auto_23110 ?auto_23116 ) ) ( HOIST-AT ?auto_23107 ?auto_23110 ) ( not ( = ?auto_23117 ?auto_23107 ) ) ( SURFACE-AT ?auto_23106 ?auto_23110 ) ( ON ?auto_23106 ?auto_23115 ) ( CLEAR ?auto_23106 ) ( not ( = ?auto_23105 ?auto_23115 ) ) ( not ( = ?auto_23106 ?auto_23115 ) ) ( not ( = ?auto_23108 ?auto_23115 ) ) ( IS-CRATE ?auto_23105 ) ( not ( = ?auto_23120 ?auto_23116 ) ) ( not ( = ?auto_23110 ?auto_23120 ) ) ( HOIST-AT ?auto_23109 ?auto_23120 ) ( not ( = ?auto_23117 ?auto_23109 ) ) ( not ( = ?auto_23107 ?auto_23109 ) ) ( AVAILABLE ?auto_23109 ) ( SURFACE-AT ?auto_23105 ?auto_23120 ) ( ON ?auto_23105 ?auto_23119 ) ( CLEAR ?auto_23105 ) ( not ( = ?auto_23105 ?auto_23119 ) ) ( not ( = ?auto_23106 ?auto_23119 ) ) ( not ( = ?auto_23108 ?auto_23119 ) ) ( not ( = ?auto_23115 ?auto_23119 ) ) ( IS-CRATE ?auto_23108 ) ( not ( = ?auto_23113 ?auto_23108 ) ) ( not ( = ?auto_23105 ?auto_23113 ) ) ( not ( = ?auto_23106 ?auto_23113 ) ) ( not ( = ?auto_23115 ?auto_23113 ) ) ( not ( = ?auto_23119 ?auto_23113 ) ) ( AVAILABLE ?auto_23107 ) ( SURFACE-AT ?auto_23108 ?auto_23110 ) ( ON ?auto_23108 ?auto_23114 ) ( CLEAR ?auto_23108 ) ( not ( = ?auto_23105 ?auto_23114 ) ) ( not ( = ?auto_23106 ?auto_23114 ) ) ( not ( = ?auto_23108 ?auto_23114 ) ) ( not ( = ?auto_23115 ?auto_23114 ) ) ( not ( = ?auto_23119 ?auto_23114 ) ) ( not ( = ?auto_23113 ?auto_23114 ) ) ( SURFACE-AT ?auto_23111 ?auto_23116 ) ( CLEAR ?auto_23111 ) ( IS-CRATE ?auto_23113 ) ( not ( = ?auto_23111 ?auto_23113 ) ) ( not ( = ?auto_23105 ?auto_23111 ) ) ( not ( = ?auto_23106 ?auto_23111 ) ) ( not ( = ?auto_23108 ?auto_23111 ) ) ( not ( = ?auto_23115 ?auto_23111 ) ) ( not ( = ?auto_23119 ?auto_23111 ) ) ( not ( = ?auto_23114 ?auto_23111 ) ) ( AVAILABLE ?auto_23117 ) ( TRUCK-AT ?auto_23112 ?auto_23118 ) ( not ( = ?auto_23118 ?auto_23116 ) ) ( not ( = ?auto_23110 ?auto_23118 ) ) ( not ( = ?auto_23120 ?auto_23118 ) ) ( HOIST-AT ?auto_23121 ?auto_23118 ) ( LIFTING ?auto_23121 ?auto_23113 ) ( not ( = ?auto_23117 ?auto_23121 ) ) ( not ( = ?auto_23107 ?auto_23121 ) ) ( not ( = ?auto_23109 ?auto_23121 ) ) )
    :subtasks
    ( ( !LOAD ?auto_23121 ?auto_23113 ?auto_23112 ?auto_23118 )
      ( MAKE-2CRATE ?auto_23108 ?auto_23105 ?auto_23106 )
      ( MAKE-1CRATE-VERIFY ?auto_23105 ?auto_23106 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23122 - SURFACE
      ?auto_23123 - SURFACE
      ?auto_23124 - SURFACE
    )
    :vars
    (
      ?auto_23132 - HOIST
      ?auto_23128 - PLACE
      ?auto_23127 - PLACE
      ?auto_23126 - HOIST
      ?auto_23134 - SURFACE
      ?auto_23130 - PLACE
      ?auto_23131 - HOIST
      ?auto_23138 - SURFACE
      ?auto_23125 - SURFACE
      ?auto_23135 - SURFACE
      ?auto_23129 - SURFACE
      ?auto_23133 - TRUCK
      ?auto_23137 - PLACE
      ?auto_23136 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23132 ?auto_23128 ) ( IS-CRATE ?auto_23124 ) ( not ( = ?auto_23123 ?auto_23124 ) ) ( not ( = ?auto_23122 ?auto_23123 ) ) ( not ( = ?auto_23122 ?auto_23124 ) ) ( not ( = ?auto_23127 ?auto_23128 ) ) ( HOIST-AT ?auto_23126 ?auto_23127 ) ( not ( = ?auto_23132 ?auto_23126 ) ) ( SURFACE-AT ?auto_23124 ?auto_23127 ) ( ON ?auto_23124 ?auto_23134 ) ( CLEAR ?auto_23124 ) ( not ( = ?auto_23123 ?auto_23134 ) ) ( not ( = ?auto_23124 ?auto_23134 ) ) ( not ( = ?auto_23122 ?auto_23134 ) ) ( IS-CRATE ?auto_23123 ) ( not ( = ?auto_23130 ?auto_23128 ) ) ( not ( = ?auto_23127 ?auto_23130 ) ) ( HOIST-AT ?auto_23131 ?auto_23130 ) ( not ( = ?auto_23132 ?auto_23131 ) ) ( not ( = ?auto_23126 ?auto_23131 ) ) ( AVAILABLE ?auto_23131 ) ( SURFACE-AT ?auto_23123 ?auto_23130 ) ( ON ?auto_23123 ?auto_23138 ) ( CLEAR ?auto_23123 ) ( not ( = ?auto_23123 ?auto_23138 ) ) ( not ( = ?auto_23124 ?auto_23138 ) ) ( not ( = ?auto_23122 ?auto_23138 ) ) ( not ( = ?auto_23134 ?auto_23138 ) ) ( IS-CRATE ?auto_23122 ) ( not ( = ?auto_23125 ?auto_23122 ) ) ( not ( = ?auto_23123 ?auto_23125 ) ) ( not ( = ?auto_23124 ?auto_23125 ) ) ( not ( = ?auto_23134 ?auto_23125 ) ) ( not ( = ?auto_23138 ?auto_23125 ) ) ( AVAILABLE ?auto_23126 ) ( SURFACE-AT ?auto_23122 ?auto_23127 ) ( ON ?auto_23122 ?auto_23135 ) ( CLEAR ?auto_23122 ) ( not ( = ?auto_23123 ?auto_23135 ) ) ( not ( = ?auto_23124 ?auto_23135 ) ) ( not ( = ?auto_23122 ?auto_23135 ) ) ( not ( = ?auto_23134 ?auto_23135 ) ) ( not ( = ?auto_23138 ?auto_23135 ) ) ( not ( = ?auto_23125 ?auto_23135 ) ) ( SURFACE-AT ?auto_23129 ?auto_23128 ) ( CLEAR ?auto_23129 ) ( IS-CRATE ?auto_23125 ) ( not ( = ?auto_23129 ?auto_23125 ) ) ( not ( = ?auto_23123 ?auto_23129 ) ) ( not ( = ?auto_23124 ?auto_23129 ) ) ( not ( = ?auto_23122 ?auto_23129 ) ) ( not ( = ?auto_23134 ?auto_23129 ) ) ( not ( = ?auto_23138 ?auto_23129 ) ) ( not ( = ?auto_23135 ?auto_23129 ) ) ( AVAILABLE ?auto_23132 ) ( TRUCK-AT ?auto_23133 ?auto_23137 ) ( not ( = ?auto_23137 ?auto_23128 ) ) ( not ( = ?auto_23127 ?auto_23137 ) ) ( not ( = ?auto_23130 ?auto_23137 ) ) ( HOIST-AT ?auto_23136 ?auto_23137 ) ( LIFTING ?auto_23136 ?auto_23125 ) ( not ( = ?auto_23132 ?auto_23136 ) ) ( not ( = ?auto_23126 ?auto_23136 ) ) ( not ( = ?auto_23131 ?auto_23136 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23123 ?auto_23124 )
      ( MAKE-2CRATE-VERIFY ?auto_23122 ?auto_23123 ?auto_23124 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23139 - SURFACE
      ?auto_23140 - SURFACE
      ?auto_23141 - SURFACE
      ?auto_23142 - SURFACE
    )
    :vars
    (
      ?auto_23145 - HOIST
      ?auto_23150 - PLACE
      ?auto_23154 - PLACE
      ?auto_23152 - HOIST
      ?auto_23153 - SURFACE
      ?auto_23146 - PLACE
      ?auto_23143 - HOIST
      ?auto_23155 - SURFACE
      ?auto_23151 - SURFACE
      ?auto_23147 - SURFACE
      ?auto_23144 - TRUCK
      ?auto_23148 - PLACE
      ?auto_23149 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23145 ?auto_23150 ) ( IS-CRATE ?auto_23142 ) ( not ( = ?auto_23141 ?auto_23142 ) ) ( not ( = ?auto_23140 ?auto_23141 ) ) ( not ( = ?auto_23140 ?auto_23142 ) ) ( not ( = ?auto_23154 ?auto_23150 ) ) ( HOIST-AT ?auto_23152 ?auto_23154 ) ( not ( = ?auto_23145 ?auto_23152 ) ) ( SURFACE-AT ?auto_23142 ?auto_23154 ) ( ON ?auto_23142 ?auto_23153 ) ( CLEAR ?auto_23142 ) ( not ( = ?auto_23141 ?auto_23153 ) ) ( not ( = ?auto_23142 ?auto_23153 ) ) ( not ( = ?auto_23140 ?auto_23153 ) ) ( IS-CRATE ?auto_23141 ) ( not ( = ?auto_23146 ?auto_23150 ) ) ( not ( = ?auto_23154 ?auto_23146 ) ) ( HOIST-AT ?auto_23143 ?auto_23146 ) ( not ( = ?auto_23145 ?auto_23143 ) ) ( not ( = ?auto_23152 ?auto_23143 ) ) ( AVAILABLE ?auto_23143 ) ( SURFACE-AT ?auto_23141 ?auto_23146 ) ( ON ?auto_23141 ?auto_23155 ) ( CLEAR ?auto_23141 ) ( not ( = ?auto_23141 ?auto_23155 ) ) ( not ( = ?auto_23142 ?auto_23155 ) ) ( not ( = ?auto_23140 ?auto_23155 ) ) ( not ( = ?auto_23153 ?auto_23155 ) ) ( IS-CRATE ?auto_23140 ) ( not ( = ?auto_23139 ?auto_23140 ) ) ( not ( = ?auto_23141 ?auto_23139 ) ) ( not ( = ?auto_23142 ?auto_23139 ) ) ( not ( = ?auto_23153 ?auto_23139 ) ) ( not ( = ?auto_23155 ?auto_23139 ) ) ( AVAILABLE ?auto_23152 ) ( SURFACE-AT ?auto_23140 ?auto_23154 ) ( ON ?auto_23140 ?auto_23151 ) ( CLEAR ?auto_23140 ) ( not ( = ?auto_23141 ?auto_23151 ) ) ( not ( = ?auto_23142 ?auto_23151 ) ) ( not ( = ?auto_23140 ?auto_23151 ) ) ( not ( = ?auto_23153 ?auto_23151 ) ) ( not ( = ?auto_23155 ?auto_23151 ) ) ( not ( = ?auto_23139 ?auto_23151 ) ) ( SURFACE-AT ?auto_23147 ?auto_23150 ) ( CLEAR ?auto_23147 ) ( IS-CRATE ?auto_23139 ) ( not ( = ?auto_23147 ?auto_23139 ) ) ( not ( = ?auto_23141 ?auto_23147 ) ) ( not ( = ?auto_23142 ?auto_23147 ) ) ( not ( = ?auto_23140 ?auto_23147 ) ) ( not ( = ?auto_23153 ?auto_23147 ) ) ( not ( = ?auto_23155 ?auto_23147 ) ) ( not ( = ?auto_23151 ?auto_23147 ) ) ( AVAILABLE ?auto_23145 ) ( TRUCK-AT ?auto_23144 ?auto_23148 ) ( not ( = ?auto_23148 ?auto_23150 ) ) ( not ( = ?auto_23154 ?auto_23148 ) ) ( not ( = ?auto_23146 ?auto_23148 ) ) ( HOIST-AT ?auto_23149 ?auto_23148 ) ( LIFTING ?auto_23149 ?auto_23139 ) ( not ( = ?auto_23145 ?auto_23149 ) ) ( not ( = ?auto_23152 ?auto_23149 ) ) ( not ( = ?auto_23143 ?auto_23149 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23140 ?auto_23141 ?auto_23142 )
      ( MAKE-3CRATE-VERIFY ?auto_23139 ?auto_23140 ?auto_23141 ?auto_23142 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23156 - SURFACE
      ?auto_23157 - SURFACE
      ?auto_23158 - SURFACE
      ?auto_23159 - SURFACE
      ?auto_23160 - SURFACE
    )
    :vars
    (
      ?auto_23163 - HOIST
      ?auto_23167 - PLACE
      ?auto_23171 - PLACE
      ?auto_23169 - HOIST
      ?auto_23170 - SURFACE
      ?auto_23164 - PLACE
      ?auto_23161 - HOIST
      ?auto_23172 - SURFACE
      ?auto_23168 - SURFACE
      ?auto_23162 - TRUCK
      ?auto_23165 - PLACE
      ?auto_23166 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23163 ?auto_23167 ) ( IS-CRATE ?auto_23160 ) ( not ( = ?auto_23159 ?auto_23160 ) ) ( not ( = ?auto_23158 ?auto_23159 ) ) ( not ( = ?auto_23158 ?auto_23160 ) ) ( not ( = ?auto_23171 ?auto_23167 ) ) ( HOIST-AT ?auto_23169 ?auto_23171 ) ( not ( = ?auto_23163 ?auto_23169 ) ) ( SURFACE-AT ?auto_23160 ?auto_23171 ) ( ON ?auto_23160 ?auto_23170 ) ( CLEAR ?auto_23160 ) ( not ( = ?auto_23159 ?auto_23170 ) ) ( not ( = ?auto_23160 ?auto_23170 ) ) ( not ( = ?auto_23158 ?auto_23170 ) ) ( IS-CRATE ?auto_23159 ) ( not ( = ?auto_23164 ?auto_23167 ) ) ( not ( = ?auto_23171 ?auto_23164 ) ) ( HOIST-AT ?auto_23161 ?auto_23164 ) ( not ( = ?auto_23163 ?auto_23161 ) ) ( not ( = ?auto_23169 ?auto_23161 ) ) ( AVAILABLE ?auto_23161 ) ( SURFACE-AT ?auto_23159 ?auto_23164 ) ( ON ?auto_23159 ?auto_23172 ) ( CLEAR ?auto_23159 ) ( not ( = ?auto_23159 ?auto_23172 ) ) ( not ( = ?auto_23160 ?auto_23172 ) ) ( not ( = ?auto_23158 ?auto_23172 ) ) ( not ( = ?auto_23170 ?auto_23172 ) ) ( IS-CRATE ?auto_23158 ) ( not ( = ?auto_23157 ?auto_23158 ) ) ( not ( = ?auto_23159 ?auto_23157 ) ) ( not ( = ?auto_23160 ?auto_23157 ) ) ( not ( = ?auto_23170 ?auto_23157 ) ) ( not ( = ?auto_23172 ?auto_23157 ) ) ( AVAILABLE ?auto_23169 ) ( SURFACE-AT ?auto_23158 ?auto_23171 ) ( ON ?auto_23158 ?auto_23168 ) ( CLEAR ?auto_23158 ) ( not ( = ?auto_23159 ?auto_23168 ) ) ( not ( = ?auto_23160 ?auto_23168 ) ) ( not ( = ?auto_23158 ?auto_23168 ) ) ( not ( = ?auto_23170 ?auto_23168 ) ) ( not ( = ?auto_23172 ?auto_23168 ) ) ( not ( = ?auto_23157 ?auto_23168 ) ) ( SURFACE-AT ?auto_23156 ?auto_23167 ) ( CLEAR ?auto_23156 ) ( IS-CRATE ?auto_23157 ) ( not ( = ?auto_23156 ?auto_23157 ) ) ( not ( = ?auto_23159 ?auto_23156 ) ) ( not ( = ?auto_23160 ?auto_23156 ) ) ( not ( = ?auto_23158 ?auto_23156 ) ) ( not ( = ?auto_23170 ?auto_23156 ) ) ( not ( = ?auto_23172 ?auto_23156 ) ) ( not ( = ?auto_23168 ?auto_23156 ) ) ( AVAILABLE ?auto_23163 ) ( TRUCK-AT ?auto_23162 ?auto_23165 ) ( not ( = ?auto_23165 ?auto_23167 ) ) ( not ( = ?auto_23171 ?auto_23165 ) ) ( not ( = ?auto_23164 ?auto_23165 ) ) ( HOIST-AT ?auto_23166 ?auto_23165 ) ( LIFTING ?auto_23166 ?auto_23157 ) ( not ( = ?auto_23163 ?auto_23166 ) ) ( not ( = ?auto_23169 ?auto_23166 ) ) ( not ( = ?auto_23161 ?auto_23166 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23158 ?auto_23159 ?auto_23160 )
      ( MAKE-4CRATE-VERIFY ?auto_23156 ?auto_23157 ?auto_23158 ?auto_23159 ?auto_23160 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23173 - SURFACE
      ?auto_23174 - SURFACE
      ?auto_23175 - SURFACE
      ?auto_23176 - SURFACE
      ?auto_23177 - SURFACE
      ?auto_23178 - SURFACE
    )
    :vars
    (
      ?auto_23181 - HOIST
      ?auto_23185 - PLACE
      ?auto_23189 - PLACE
      ?auto_23187 - HOIST
      ?auto_23188 - SURFACE
      ?auto_23182 - PLACE
      ?auto_23179 - HOIST
      ?auto_23190 - SURFACE
      ?auto_23186 - SURFACE
      ?auto_23180 - TRUCK
      ?auto_23183 - PLACE
      ?auto_23184 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23181 ?auto_23185 ) ( IS-CRATE ?auto_23178 ) ( not ( = ?auto_23177 ?auto_23178 ) ) ( not ( = ?auto_23176 ?auto_23177 ) ) ( not ( = ?auto_23176 ?auto_23178 ) ) ( not ( = ?auto_23189 ?auto_23185 ) ) ( HOIST-AT ?auto_23187 ?auto_23189 ) ( not ( = ?auto_23181 ?auto_23187 ) ) ( SURFACE-AT ?auto_23178 ?auto_23189 ) ( ON ?auto_23178 ?auto_23188 ) ( CLEAR ?auto_23178 ) ( not ( = ?auto_23177 ?auto_23188 ) ) ( not ( = ?auto_23178 ?auto_23188 ) ) ( not ( = ?auto_23176 ?auto_23188 ) ) ( IS-CRATE ?auto_23177 ) ( not ( = ?auto_23182 ?auto_23185 ) ) ( not ( = ?auto_23189 ?auto_23182 ) ) ( HOIST-AT ?auto_23179 ?auto_23182 ) ( not ( = ?auto_23181 ?auto_23179 ) ) ( not ( = ?auto_23187 ?auto_23179 ) ) ( AVAILABLE ?auto_23179 ) ( SURFACE-AT ?auto_23177 ?auto_23182 ) ( ON ?auto_23177 ?auto_23190 ) ( CLEAR ?auto_23177 ) ( not ( = ?auto_23177 ?auto_23190 ) ) ( not ( = ?auto_23178 ?auto_23190 ) ) ( not ( = ?auto_23176 ?auto_23190 ) ) ( not ( = ?auto_23188 ?auto_23190 ) ) ( IS-CRATE ?auto_23176 ) ( not ( = ?auto_23175 ?auto_23176 ) ) ( not ( = ?auto_23177 ?auto_23175 ) ) ( not ( = ?auto_23178 ?auto_23175 ) ) ( not ( = ?auto_23188 ?auto_23175 ) ) ( not ( = ?auto_23190 ?auto_23175 ) ) ( AVAILABLE ?auto_23187 ) ( SURFACE-AT ?auto_23176 ?auto_23189 ) ( ON ?auto_23176 ?auto_23186 ) ( CLEAR ?auto_23176 ) ( not ( = ?auto_23177 ?auto_23186 ) ) ( not ( = ?auto_23178 ?auto_23186 ) ) ( not ( = ?auto_23176 ?auto_23186 ) ) ( not ( = ?auto_23188 ?auto_23186 ) ) ( not ( = ?auto_23190 ?auto_23186 ) ) ( not ( = ?auto_23175 ?auto_23186 ) ) ( SURFACE-AT ?auto_23174 ?auto_23185 ) ( CLEAR ?auto_23174 ) ( IS-CRATE ?auto_23175 ) ( not ( = ?auto_23174 ?auto_23175 ) ) ( not ( = ?auto_23177 ?auto_23174 ) ) ( not ( = ?auto_23178 ?auto_23174 ) ) ( not ( = ?auto_23176 ?auto_23174 ) ) ( not ( = ?auto_23188 ?auto_23174 ) ) ( not ( = ?auto_23190 ?auto_23174 ) ) ( not ( = ?auto_23186 ?auto_23174 ) ) ( AVAILABLE ?auto_23181 ) ( TRUCK-AT ?auto_23180 ?auto_23183 ) ( not ( = ?auto_23183 ?auto_23185 ) ) ( not ( = ?auto_23189 ?auto_23183 ) ) ( not ( = ?auto_23182 ?auto_23183 ) ) ( HOIST-AT ?auto_23184 ?auto_23183 ) ( LIFTING ?auto_23184 ?auto_23175 ) ( not ( = ?auto_23181 ?auto_23184 ) ) ( not ( = ?auto_23187 ?auto_23184 ) ) ( not ( = ?auto_23179 ?auto_23184 ) ) ( ON ?auto_23174 ?auto_23173 ) ( not ( = ?auto_23173 ?auto_23174 ) ) ( not ( = ?auto_23173 ?auto_23175 ) ) ( not ( = ?auto_23173 ?auto_23176 ) ) ( not ( = ?auto_23173 ?auto_23177 ) ) ( not ( = ?auto_23173 ?auto_23178 ) ) ( not ( = ?auto_23173 ?auto_23188 ) ) ( not ( = ?auto_23173 ?auto_23190 ) ) ( not ( = ?auto_23173 ?auto_23186 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23176 ?auto_23177 ?auto_23178 )
      ( MAKE-5CRATE-VERIFY ?auto_23173 ?auto_23174 ?auto_23175 ?auto_23176 ?auto_23177 ?auto_23178 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23191 - SURFACE
      ?auto_23192 - SURFACE
    )
    :vars
    (
      ?auto_23196 - HOIST
      ?auto_23201 - PLACE
      ?auto_23207 - SURFACE
      ?auto_23205 - PLACE
      ?auto_23203 - HOIST
      ?auto_23204 - SURFACE
      ?auto_23197 - PLACE
      ?auto_23193 - HOIST
      ?auto_23206 - SURFACE
      ?auto_23195 - SURFACE
      ?auto_23202 - SURFACE
      ?auto_23198 - SURFACE
      ?auto_23194 - TRUCK
      ?auto_23199 - PLACE
      ?auto_23200 - HOIST
      ?auto_23208 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23196 ?auto_23201 ) ( IS-CRATE ?auto_23192 ) ( not ( = ?auto_23191 ?auto_23192 ) ) ( not ( = ?auto_23207 ?auto_23191 ) ) ( not ( = ?auto_23207 ?auto_23192 ) ) ( not ( = ?auto_23205 ?auto_23201 ) ) ( HOIST-AT ?auto_23203 ?auto_23205 ) ( not ( = ?auto_23196 ?auto_23203 ) ) ( SURFACE-AT ?auto_23192 ?auto_23205 ) ( ON ?auto_23192 ?auto_23204 ) ( CLEAR ?auto_23192 ) ( not ( = ?auto_23191 ?auto_23204 ) ) ( not ( = ?auto_23192 ?auto_23204 ) ) ( not ( = ?auto_23207 ?auto_23204 ) ) ( IS-CRATE ?auto_23191 ) ( not ( = ?auto_23197 ?auto_23201 ) ) ( not ( = ?auto_23205 ?auto_23197 ) ) ( HOIST-AT ?auto_23193 ?auto_23197 ) ( not ( = ?auto_23196 ?auto_23193 ) ) ( not ( = ?auto_23203 ?auto_23193 ) ) ( AVAILABLE ?auto_23193 ) ( SURFACE-AT ?auto_23191 ?auto_23197 ) ( ON ?auto_23191 ?auto_23206 ) ( CLEAR ?auto_23191 ) ( not ( = ?auto_23191 ?auto_23206 ) ) ( not ( = ?auto_23192 ?auto_23206 ) ) ( not ( = ?auto_23207 ?auto_23206 ) ) ( not ( = ?auto_23204 ?auto_23206 ) ) ( IS-CRATE ?auto_23207 ) ( not ( = ?auto_23195 ?auto_23207 ) ) ( not ( = ?auto_23191 ?auto_23195 ) ) ( not ( = ?auto_23192 ?auto_23195 ) ) ( not ( = ?auto_23204 ?auto_23195 ) ) ( not ( = ?auto_23206 ?auto_23195 ) ) ( AVAILABLE ?auto_23203 ) ( SURFACE-AT ?auto_23207 ?auto_23205 ) ( ON ?auto_23207 ?auto_23202 ) ( CLEAR ?auto_23207 ) ( not ( = ?auto_23191 ?auto_23202 ) ) ( not ( = ?auto_23192 ?auto_23202 ) ) ( not ( = ?auto_23207 ?auto_23202 ) ) ( not ( = ?auto_23204 ?auto_23202 ) ) ( not ( = ?auto_23206 ?auto_23202 ) ) ( not ( = ?auto_23195 ?auto_23202 ) ) ( SURFACE-AT ?auto_23198 ?auto_23201 ) ( CLEAR ?auto_23198 ) ( IS-CRATE ?auto_23195 ) ( not ( = ?auto_23198 ?auto_23195 ) ) ( not ( = ?auto_23191 ?auto_23198 ) ) ( not ( = ?auto_23192 ?auto_23198 ) ) ( not ( = ?auto_23207 ?auto_23198 ) ) ( not ( = ?auto_23204 ?auto_23198 ) ) ( not ( = ?auto_23206 ?auto_23198 ) ) ( not ( = ?auto_23202 ?auto_23198 ) ) ( AVAILABLE ?auto_23196 ) ( TRUCK-AT ?auto_23194 ?auto_23199 ) ( not ( = ?auto_23199 ?auto_23201 ) ) ( not ( = ?auto_23205 ?auto_23199 ) ) ( not ( = ?auto_23197 ?auto_23199 ) ) ( HOIST-AT ?auto_23200 ?auto_23199 ) ( not ( = ?auto_23196 ?auto_23200 ) ) ( not ( = ?auto_23203 ?auto_23200 ) ) ( not ( = ?auto_23193 ?auto_23200 ) ) ( AVAILABLE ?auto_23200 ) ( SURFACE-AT ?auto_23195 ?auto_23199 ) ( ON ?auto_23195 ?auto_23208 ) ( CLEAR ?auto_23195 ) ( not ( = ?auto_23191 ?auto_23208 ) ) ( not ( = ?auto_23192 ?auto_23208 ) ) ( not ( = ?auto_23207 ?auto_23208 ) ) ( not ( = ?auto_23204 ?auto_23208 ) ) ( not ( = ?auto_23206 ?auto_23208 ) ) ( not ( = ?auto_23195 ?auto_23208 ) ) ( not ( = ?auto_23202 ?auto_23208 ) ) ( not ( = ?auto_23198 ?auto_23208 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23200 ?auto_23195 ?auto_23208 ?auto_23199 )
      ( MAKE-2CRATE ?auto_23207 ?auto_23191 ?auto_23192 )
      ( MAKE-1CRATE-VERIFY ?auto_23191 ?auto_23192 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23209 - SURFACE
      ?auto_23210 - SURFACE
      ?auto_23211 - SURFACE
    )
    :vars
    (
      ?auto_23218 - HOIST
      ?auto_23217 - PLACE
      ?auto_23213 - PLACE
      ?auto_23226 - HOIST
      ?auto_23221 - SURFACE
      ?auto_23222 - PLACE
      ?auto_23223 - HOIST
      ?auto_23220 - SURFACE
      ?auto_23225 - SURFACE
      ?auto_23212 - SURFACE
      ?auto_23219 - SURFACE
      ?auto_23216 - TRUCK
      ?auto_23214 - PLACE
      ?auto_23224 - HOIST
      ?auto_23215 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23218 ?auto_23217 ) ( IS-CRATE ?auto_23211 ) ( not ( = ?auto_23210 ?auto_23211 ) ) ( not ( = ?auto_23209 ?auto_23210 ) ) ( not ( = ?auto_23209 ?auto_23211 ) ) ( not ( = ?auto_23213 ?auto_23217 ) ) ( HOIST-AT ?auto_23226 ?auto_23213 ) ( not ( = ?auto_23218 ?auto_23226 ) ) ( SURFACE-AT ?auto_23211 ?auto_23213 ) ( ON ?auto_23211 ?auto_23221 ) ( CLEAR ?auto_23211 ) ( not ( = ?auto_23210 ?auto_23221 ) ) ( not ( = ?auto_23211 ?auto_23221 ) ) ( not ( = ?auto_23209 ?auto_23221 ) ) ( IS-CRATE ?auto_23210 ) ( not ( = ?auto_23222 ?auto_23217 ) ) ( not ( = ?auto_23213 ?auto_23222 ) ) ( HOIST-AT ?auto_23223 ?auto_23222 ) ( not ( = ?auto_23218 ?auto_23223 ) ) ( not ( = ?auto_23226 ?auto_23223 ) ) ( AVAILABLE ?auto_23223 ) ( SURFACE-AT ?auto_23210 ?auto_23222 ) ( ON ?auto_23210 ?auto_23220 ) ( CLEAR ?auto_23210 ) ( not ( = ?auto_23210 ?auto_23220 ) ) ( not ( = ?auto_23211 ?auto_23220 ) ) ( not ( = ?auto_23209 ?auto_23220 ) ) ( not ( = ?auto_23221 ?auto_23220 ) ) ( IS-CRATE ?auto_23209 ) ( not ( = ?auto_23225 ?auto_23209 ) ) ( not ( = ?auto_23210 ?auto_23225 ) ) ( not ( = ?auto_23211 ?auto_23225 ) ) ( not ( = ?auto_23221 ?auto_23225 ) ) ( not ( = ?auto_23220 ?auto_23225 ) ) ( AVAILABLE ?auto_23226 ) ( SURFACE-AT ?auto_23209 ?auto_23213 ) ( ON ?auto_23209 ?auto_23212 ) ( CLEAR ?auto_23209 ) ( not ( = ?auto_23210 ?auto_23212 ) ) ( not ( = ?auto_23211 ?auto_23212 ) ) ( not ( = ?auto_23209 ?auto_23212 ) ) ( not ( = ?auto_23221 ?auto_23212 ) ) ( not ( = ?auto_23220 ?auto_23212 ) ) ( not ( = ?auto_23225 ?auto_23212 ) ) ( SURFACE-AT ?auto_23219 ?auto_23217 ) ( CLEAR ?auto_23219 ) ( IS-CRATE ?auto_23225 ) ( not ( = ?auto_23219 ?auto_23225 ) ) ( not ( = ?auto_23210 ?auto_23219 ) ) ( not ( = ?auto_23211 ?auto_23219 ) ) ( not ( = ?auto_23209 ?auto_23219 ) ) ( not ( = ?auto_23221 ?auto_23219 ) ) ( not ( = ?auto_23220 ?auto_23219 ) ) ( not ( = ?auto_23212 ?auto_23219 ) ) ( AVAILABLE ?auto_23218 ) ( TRUCK-AT ?auto_23216 ?auto_23214 ) ( not ( = ?auto_23214 ?auto_23217 ) ) ( not ( = ?auto_23213 ?auto_23214 ) ) ( not ( = ?auto_23222 ?auto_23214 ) ) ( HOIST-AT ?auto_23224 ?auto_23214 ) ( not ( = ?auto_23218 ?auto_23224 ) ) ( not ( = ?auto_23226 ?auto_23224 ) ) ( not ( = ?auto_23223 ?auto_23224 ) ) ( AVAILABLE ?auto_23224 ) ( SURFACE-AT ?auto_23225 ?auto_23214 ) ( ON ?auto_23225 ?auto_23215 ) ( CLEAR ?auto_23225 ) ( not ( = ?auto_23210 ?auto_23215 ) ) ( not ( = ?auto_23211 ?auto_23215 ) ) ( not ( = ?auto_23209 ?auto_23215 ) ) ( not ( = ?auto_23221 ?auto_23215 ) ) ( not ( = ?auto_23220 ?auto_23215 ) ) ( not ( = ?auto_23225 ?auto_23215 ) ) ( not ( = ?auto_23212 ?auto_23215 ) ) ( not ( = ?auto_23219 ?auto_23215 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23210 ?auto_23211 )
      ( MAKE-2CRATE-VERIFY ?auto_23209 ?auto_23210 ?auto_23211 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23227 - SURFACE
      ?auto_23228 - SURFACE
      ?auto_23229 - SURFACE
      ?auto_23230 - SURFACE
    )
    :vars
    (
      ?auto_23232 - HOIST
      ?auto_23233 - PLACE
      ?auto_23243 - PLACE
      ?auto_23231 - HOIST
      ?auto_23236 - SURFACE
      ?auto_23242 - PLACE
      ?auto_23244 - HOIST
      ?auto_23237 - SURFACE
      ?auto_23240 - SURFACE
      ?auto_23238 - SURFACE
      ?auto_23234 - TRUCK
      ?auto_23235 - PLACE
      ?auto_23241 - HOIST
      ?auto_23239 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23232 ?auto_23233 ) ( IS-CRATE ?auto_23230 ) ( not ( = ?auto_23229 ?auto_23230 ) ) ( not ( = ?auto_23228 ?auto_23229 ) ) ( not ( = ?auto_23228 ?auto_23230 ) ) ( not ( = ?auto_23243 ?auto_23233 ) ) ( HOIST-AT ?auto_23231 ?auto_23243 ) ( not ( = ?auto_23232 ?auto_23231 ) ) ( SURFACE-AT ?auto_23230 ?auto_23243 ) ( ON ?auto_23230 ?auto_23236 ) ( CLEAR ?auto_23230 ) ( not ( = ?auto_23229 ?auto_23236 ) ) ( not ( = ?auto_23230 ?auto_23236 ) ) ( not ( = ?auto_23228 ?auto_23236 ) ) ( IS-CRATE ?auto_23229 ) ( not ( = ?auto_23242 ?auto_23233 ) ) ( not ( = ?auto_23243 ?auto_23242 ) ) ( HOIST-AT ?auto_23244 ?auto_23242 ) ( not ( = ?auto_23232 ?auto_23244 ) ) ( not ( = ?auto_23231 ?auto_23244 ) ) ( AVAILABLE ?auto_23244 ) ( SURFACE-AT ?auto_23229 ?auto_23242 ) ( ON ?auto_23229 ?auto_23237 ) ( CLEAR ?auto_23229 ) ( not ( = ?auto_23229 ?auto_23237 ) ) ( not ( = ?auto_23230 ?auto_23237 ) ) ( not ( = ?auto_23228 ?auto_23237 ) ) ( not ( = ?auto_23236 ?auto_23237 ) ) ( IS-CRATE ?auto_23228 ) ( not ( = ?auto_23227 ?auto_23228 ) ) ( not ( = ?auto_23229 ?auto_23227 ) ) ( not ( = ?auto_23230 ?auto_23227 ) ) ( not ( = ?auto_23236 ?auto_23227 ) ) ( not ( = ?auto_23237 ?auto_23227 ) ) ( AVAILABLE ?auto_23231 ) ( SURFACE-AT ?auto_23228 ?auto_23243 ) ( ON ?auto_23228 ?auto_23240 ) ( CLEAR ?auto_23228 ) ( not ( = ?auto_23229 ?auto_23240 ) ) ( not ( = ?auto_23230 ?auto_23240 ) ) ( not ( = ?auto_23228 ?auto_23240 ) ) ( not ( = ?auto_23236 ?auto_23240 ) ) ( not ( = ?auto_23237 ?auto_23240 ) ) ( not ( = ?auto_23227 ?auto_23240 ) ) ( SURFACE-AT ?auto_23238 ?auto_23233 ) ( CLEAR ?auto_23238 ) ( IS-CRATE ?auto_23227 ) ( not ( = ?auto_23238 ?auto_23227 ) ) ( not ( = ?auto_23229 ?auto_23238 ) ) ( not ( = ?auto_23230 ?auto_23238 ) ) ( not ( = ?auto_23228 ?auto_23238 ) ) ( not ( = ?auto_23236 ?auto_23238 ) ) ( not ( = ?auto_23237 ?auto_23238 ) ) ( not ( = ?auto_23240 ?auto_23238 ) ) ( AVAILABLE ?auto_23232 ) ( TRUCK-AT ?auto_23234 ?auto_23235 ) ( not ( = ?auto_23235 ?auto_23233 ) ) ( not ( = ?auto_23243 ?auto_23235 ) ) ( not ( = ?auto_23242 ?auto_23235 ) ) ( HOIST-AT ?auto_23241 ?auto_23235 ) ( not ( = ?auto_23232 ?auto_23241 ) ) ( not ( = ?auto_23231 ?auto_23241 ) ) ( not ( = ?auto_23244 ?auto_23241 ) ) ( AVAILABLE ?auto_23241 ) ( SURFACE-AT ?auto_23227 ?auto_23235 ) ( ON ?auto_23227 ?auto_23239 ) ( CLEAR ?auto_23227 ) ( not ( = ?auto_23229 ?auto_23239 ) ) ( not ( = ?auto_23230 ?auto_23239 ) ) ( not ( = ?auto_23228 ?auto_23239 ) ) ( not ( = ?auto_23236 ?auto_23239 ) ) ( not ( = ?auto_23237 ?auto_23239 ) ) ( not ( = ?auto_23227 ?auto_23239 ) ) ( not ( = ?auto_23240 ?auto_23239 ) ) ( not ( = ?auto_23238 ?auto_23239 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23228 ?auto_23229 ?auto_23230 )
      ( MAKE-3CRATE-VERIFY ?auto_23227 ?auto_23228 ?auto_23229 ?auto_23230 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23245 - SURFACE
      ?auto_23246 - SURFACE
      ?auto_23247 - SURFACE
      ?auto_23248 - SURFACE
      ?auto_23249 - SURFACE
    )
    :vars
    (
      ?auto_23251 - HOIST
      ?auto_23252 - PLACE
      ?auto_23261 - PLACE
      ?auto_23250 - HOIST
      ?auto_23255 - SURFACE
      ?auto_23260 - PLACE
      ?auto_23262 - HOIST
      ?auto_23256 - SURFACE
      ?auto_23258 - SURFACE
      ?auto_23253 - TRUCK
      ?auto_23254 - PLACE
      ?auto_23259 - HOIST
      ?auto_23257 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23251 ?auto_23252 ) ( IS-CRATE ?auto_23249 ) ( not ( = ?auto_23248 ?auto_23249 ) ) ( not ( = ?auto_23247 ?auto_23248 ) ) ( not ( = ?auto_23247 ?auto_23249 ) ) ( not ( = ?auto_23261 ?auto_23252 ) ) ( HOIST-AT ?auto_23250 ?auto_23261 ) ( not ( = ?auto_23251 ?auto_23250 ) ) ( SURFACE-AT ?auto_23249 ?auto_23261 ) ( ON ?auto_23249 ?auto_23255 ) ( CLEAR ?auto_23249 ) ( not ( = ?auto_23248 ?auto_23255 ) ) ( not ( = ?auto_23249 ?auto_23255 ) ) ( not ( = ?auto_23247 ?auto_23255 ) ) ( IS-CRATE ?auto_23248 ) ( not ( = ?auto_23260 ?auto_23252 ) ) ( not ( = ?auto_23261 ?auto_23260 ) ) ( HOIST-AT ?auto_23262 ?auto_23260 ) ( not ( = ?auto_23251 ?auto_23262 ) ) ( not ( = ?auto_23250 ?auto_23262 ) ) ( AVAILABLE ?auto_23262 ) ( SURFACE-AT ?auto_23248 ?auto_23260 ) ( ON ?auto_23248 ?auto_23256 ) ( CLEAR ?auto_23248 ) ( not ( = ?auto_23248 ?auto_23256 ) ) ( not ( = ?auto_23249 ?auto_23256 ) ) ( not ( = ?auto_23247 ?auto_23256 ) ) ( not ( = ?auto_23255 ?auto_23256 ) ) ( IS-CRATE ?auto_23247 ) ( not ( = ?auto_23246 ?auto_23247 ) ) ( not ( = ?auto_23248 ?auto_23246 ) ) ( not ( = ?auto_23249 ?auto_23246 ) ) ( not ( = ?auto_23255 ?auto_23246 ) ) ( not ( = ?auto_23256 ?auto_23246 ) ) ( AVAILABLE ?auto_23250 ) ( SURFACE-AT ?auto_23247 ?auto_23261 ) ( ON ?auto_23247 ?auto_23258 ) ( CLEAR ?auto_23247 ) ( not ( = ?auto_23248 ?auto_23258 ) ) ( not ( = ?auto_23249 ?auto_23258 ) ) ( not ( = ?auto_23247 ?auto_23258 ) ) ( not ( = ?auto_23255 ?auto_23258 ) ) ( not ( = ?auto_23256 ?auto_23258 ) ) ( not ( = ?auto_23246 ?auto_23258 ) ) ( SURFACE-AT ?auto_23245 ?auto_23252 ) ( CLEAR ?auto_23245 ) ( IS-CRATE ?auto_23246 ) ( not ( = ?auto_23245 ?auto_23246 ) ) ( not ( = ?auto_23248 ?auto_23245 ) ) ( not ( = ?auto_23249 ?auto_23245 ) ) ( not ( = ?auto_23247 ?auto_23245 ) ) ( not ( = ?auto_23255 ?auto_23245 ) ) ( not ( = ?auto_23256 ?auto_23245 ) ) ( not ( = ?auto_23258 ?auto_23245 ) ) ( AVAILABLE ?auto_23251 ) ( TRUCK-AT ?auto_23253 ?auto_23254 ) ( not ( = ?auto_23254 ?auto_23252 ) ) ( not ( = ?auto_23261 ?auto_23254 ) ) ( not ( = ?auto_23260 ?auto_23254 ) ) ( HOIST-AT ?auto_23259 ?auto_23254 ) ( not ( = ?auto_23251 ?auto_23259 ) ) ( not ( = ?auto_23250 ?auto_23259 ) ) ( not ( = ?auto_23262 ?auto_23259 ) ) ( AVAILABLE ?auto_23259 ) ( SURFACE-AT ?auto_23246 ?auto_23254 ) ( ON ?auto_23246 ?auto_23257 ) ( CLEAR ?auto_23246 ) ( not ( = ?auto_23248 ?auto_23257 ) ) ( not ( = ?auto_23249 ?auto_23257 ) ) ( not ( = ?auto_23247 ?auto_23257 ) ) ( not ( = ?auto_23255 ?auto_23257 ) ) ( not ( = ?auto_23256 ?auto_23257 ) ) ( not ( = ?auto_23246 ?auto_23257 ) ) ( not ( = ?auto_23258 ?auto_23257 ) ) ( not ( = ?auto_23245 ?auto_23257 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23247 ?auto_23248 ?auto_23249 )
      ( MAKE-4CRATE-VERIFY ?auto_23245 ?auto_23246 ?auto_23247 ?auto_23248 ?auto_23249 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23263 - SURFACE
      ?auto_23264 - SURFACE
      ?auto_23265 - SURFACE
      ?auto_23266 - SURFACE
      ?auto_23267 - SURFACE
      ?auto_23268 - SURFACE
    )
    :vars
    (
      ?auto_23270 - HOIST
      ?auto_23271 - PLACE
      ?auto_23280 - PLACE
      ?auto_23269 - HOIST
      ?auto_23274 - SURFACE
      ?auto_23279 - PLACE
      ?auto_23281 - HOIST
      ?auto_23275 - SURFACE
      ?auto_23277 - SURFACE
      ?auto_23272 - TRUCK
      ?auto_23273 - PLACE
      ?auto_23278 - HOIST
      ?auto_23276 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23270 ?auto_23271 ) ( IS-CRATE ?auto_23268 ) ( not ( = ?auto_23267 ?auto_23268 ) ) ( not ( = ?auto_23266 ?auto_23267 ) ) ( not ( = ?auto_23266 ?auto_23268 ) ) ( not ( = ?auto_23280 ?auto_23271 ) ) ( HOIST-AT ?auto_23269 ?auto_23280 ) ( not ( = ?auto_23270 ?auto_23269 ) ) ( SURFACE-AT ?auto_23268 ?auto_23280 ) ( ON ?auto_23268 ?auto_23274 ) ( CLEAR ?auto_23268 ) ( not ( = ?auto_23267 ?auto_23274 ) ) ( not ( = ?auto_23268 ?auto_23274 ) ) ( not ( = ?auto_23266 ?auto_23274 ) ) ( IS-CRATE ?auto_23267 ) ( not ( = ?auto_23279 ?auto_23271 ) ) ( not ( = ?auto_23280 ?auto_23279 ) ) ( HOIST-AT ?auto_23281 ?auto_23279 ) ( not ( = ?auto_23270 ?auto_23281 ) ) ( not ( = ?auto_23269 ?auto_23281 ) ) ( AVAILABLE ?auto_23281 ) ( SURFACE-AT ?auto_23267 ?auto_23279 ) ( ON ?auto_23267 ?auto_23275 ) ( CLEAR ?auto_23267 ) ( not ( = ?auto_23267 ?auto_23275 ) ) ( not ( = ?auto_23268 ?auto_23275 ) ) ( not ( = ?auto_23266 ?auto_23275 ) ) ( not ( = ?auto_23274 ?auto_23275 ) ) ( IS-CRATE ?auto_23266 ) ( not ( = ?auto_23265 ?auto_23266 ) ) ( not ( = ?auto_23267 ?auto_23265 ) ) ( not ( = ?auto_23268 ?auto_23265 ) ) ( not ( = ?auto_23274 ?auto_23265 ) ) ( not ( = ?auto_23275 ?auto_23265 ) ) ( AVAILABLE ?auto_23269 ) ( SURFACE-AT ?auto_23266 ?auto_23280 ) ( ON ?auto_23266 ?auto_23277 ) ( CLEAR ?auto_23266 ) ( not ( = ?auto_23267 ?auto_23277 ) ) ( not ( = ?auto_23268 ?auto_23277 ) ) ( not ( = ?auto_23266 ?auto_23277 ) ) ( not ( = ?auto_23274 ?auto_23277 ) ) ( not ( = ?auto_23275 ?auto_23277 ) ) ( not ( = ?auto_23265 ?auto_23277 ) ) ( SURFACE-AT ?auto_23264 ?auto_23271 ) ( CLEAR ?auto_23264 ) ( IS-CRATE ?auto_23265 ) ( not ( = ?auto_23264 ?auto_23265 ) ) ( not ( = ?auto_23267 ?auto_23264 ) ) ( not ( = ?auto_23268 ?auto_23264 ) ) ( not ( = ?auto_23266 ?auto_23264 ) ) ( not ( = ?auto_23274 ?auto_23264 ) ) ( not ( = ?auto_23275 ?auto_23264 ) ) ( not ( = ?auto_23277 ?auto_23264 ) ) ( AVAILABLE ?auto_23270 ) ( TRUCK-AT ?auto_23272 ?auto_23273 ) ( not ( = ?auto_23273 ?auto_23271 ) ) ( not ( = ?auto_23280 ?auto_23273 ) ) ( not ( = ?auto_23279 ?auto_23273 ) ) ( HOIST-AT ?auto_23278 ?auto_23273 ) ( not ( = ?auto_23270 ?auto_23278 ) ) ( not ( = ?auto_23269 ?auto_23278 ) ) ( not ( = ?auto_23281 ?auto_23278 ) ) ( AVAILABLE ?auto_23278 ) ( SURFACE-AT ?auto_23265 ?auto_23273 ) ( ON ?auto_23265 ?auto_23276 ) ( CLEAR ?auto_23265 ) ( not ( = ?auto_23267 ?auto_23276 ) ) ( not ( = ?auto_23268 ?auto_23276 ) ) ( not ( = ?auto_23266 ?auto_23276 ) ) ( not ( = ?auto_23274 ?auto_23276 ) ) ( not ( = ?auto_23275 ?auto_23276 ) ) ( not ( = ?auto_23265 ?auto_23276 ) ) ( not ( = ?auto_23277 ?auto_23276 ) ) ( not ( = ?auto_23264 ?auto_23276 ) ) ( ON ?auto_23264 ?auto_23263 ) ( not ( = ?auto_23263 ?auto_23264 ) ) ( not ( = ?auto_23263 ?auto_23265 ) ) ( not ( = ?auto_23263 ?auto_23266 ) ) ( not ( = ?auto_23263 ?auto_23267 ) ) ( not ( = ?auto_23263 ?auto_23268 ) ) ( not ( = ?auto_23263 ?auto_23274 ) ) ( not ( = ?auto_23263 ?auto_23275 ) ) ( not ( = ?auto_23263 ?auto_23277 ) ) ( not ( = ?auto_23263 ?auto_23276 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23266 ?auto_23267 ?auto_23268 )
      ( MAKE-5CRATE-VERIFY ?auto_23263 ?auto_23264 ?auto_23265 ?auto_23266 ?auto_23267 ?auto_23268 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23282 - SURFACE
      ?auto_23283 - SURFACE
    )
    :vars
    (
      ?auto_23285 - HOIST
      ?auto_23286 - PLACE
      ?auto_23298 - SURFACE
      ?auto_23297 - PLACE
      ?auto_23284 - HOIST
      ?auto_23289 - SURFACE
      ?auto_23295 - PLACE
      ?auto_23299 - HOIST
      ?auto_23290 - SURFACE
      ?auto_23296 - SURFACE
      ?auto_23293 - SURFACE
      ?auto_23291 - SURFACE
      ?auto_23288 - PLACE
      ?auto_23294 - HOIST
      ?auto_23292 - SURFACE
      ?auto_23287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23285 ?auto_23286 ) ( IS-CRATE ?auto_23283 ) ( not ( = ?auto_23282 ?auto_23283 ) ) ( not ( = ?auto_23298 ?auto_23282 ) ) ( not ( = ?auto_23298 ?auto_23283 ) ) ( not ( = ?auto_23297 ?auto_23286 ) ) ( HOIST-AT ?auto_23284 ?auto_23297 ) ( not ( = ?auto_23285 ?auto_23284 ) ) ( SURFACE-AT ?auto_23283 ?auto_23297 ) ( ON ?auto_23283 ?auto_23289 ) ( CLEAR ?auto_23283 ) ( not ( = ?auto_23282 ?auto_23289 ) ) ( not ( = ?auto_23283 ?auto_23289 ) ) ( not ( = ?auto_23298 ?auto_23289 ) ) ( IS-CRATE ?auto_23282 ) ( not ( = ?auto_23295 ?auto_23286 ) ) ( not ( = ?auto_23297 ?auto_23295 ) ) ( HOIST-AT ?auto_23299 ?auto_23295 ) ( not ( = ?auto_23285 ?auto_23299 ) ) ( not ( = ?auto_23284 ?auto_23299 ) ) ( AVAILABLE ?auto_23299 ) ( SURFACE-AT ?auto_23282 ?auto_23295 ) ( ON ?auto_23282 ?auto_23290 ) ( CLEAR ?auto_23282 ) ( not ( = ?auto_23282 ?auto_23290 ) ) ( not ( = ?auto_23283 ?auto_23290 ) ) ( not ( = ?auto_23298 ?auto_23290 ) ) ( not ( = ?auto_23289 ?auto_23290 ) ) ( IS-CRATE ?auto_23298 ) ( not ( = ?auto_23296 ?auto_23298 ) ) ( not ( = ?auto_23282 ?auto_23296 ) ) ( not ( = ?auto_23283 ?auto_23296 ) ) ( not ( = ?auto_23289 ?auto_23296 ) ) ( not ( = ?auto_23290 ?auto_23296 ) ) ( AVAILABLE ?auto_23284 ) ( SURFACE-AT ?auto_23298 ?auto_23297 ) ( ON ?auto_23298 ?auto_23293 ) ( CLEAR ?auto_23298 ) ( not ( = ?auto_23282 ?auto_23293 ) ) ( not ( = ?auto_23283 ?auto_23293 ) ) ( not ( = ?auto_23298 ?auto_23293 ) ) ( not ( = ?auto_23289 ?auto_23293 ) ) ( not ( = ?auto_23290 ?auto_23293 ) ) ( not ( = ?auto_23296 ?auto_23293 ) ) ( SURFACE-AT ?auto_23291 ?auto_23286 ) ( CLEAR ?auto_23291 ) ( IS-CRATE ?auto_23296 ) ( not ( = ?auto_23291 ?auto_23296 ) ) ( not ( = ?auto_23282 ?auto_23291 ) ) ( not ( = ?auto_23283 ?auto_23291 ) ) ( not ( = ?auto_23298 ?auto_23291 ) ) ( not ( = ?auto_23289 ?auto_23291 ) ) ( not ( = ?auto_23290 ?auto_23291 ) ) ( not ( = ?auto_23293 ?auto_23291 ) ) ( AVAILABLE ?auto_23285 ) ( not ( = ?auto_23288 ?auto_23286 ) ) ( not ( = ?auto_23297 ?auto_23288 ) ) ( not ( = ?auto_23295 ?auto_23288 ) ) ( HOIST-AT ?auto_23294 ?auto_23288 ) ( not ( = ?auto_23285 ?auto_23294 ) ) ( not ( = ?auto_23284 ?auto_23294 ) ) ( not ( = ?auto_23299 ?auto_23294 ) ) ( AVAILABLE ?auto_23294 ) ( SURFACE-AT ?auto_23296 ?auto_23288 ) ( ON ?auto_23296 ?auto_23292 ) ( CLEAR ?auto_23296 ) ( not ( = ?auto_23282 ?auto_23292 ) ) ( not ( = ?auto_23283 ?auto_23292 ) ) ( not ( = ?auto_23298 ?auto_23292 ) ) ( not ( = ?auto_23289 ?auto_23292 ) ) ( not ( = ?auto_23290 ?auto_23292 ) ) ( not ( = ?auto_23296 ?auto_23292 ) ) ( not ( = ?auto_23293 ?auto_23292 ) ) ( not ( = ?auto_23291 ?auto_23292 ) ) ( TRUCK-AT ?auto_23287 ?auto_23286 ) )
    :subtasks
    ( ( !DRIVE ?auto_23287 ?auto_23286 ?auto_23288 )
      ( MAKE-2CRATE ?auto_23298 ?auto_23282 ?auto_23283 )
      ( MAKE-1CRATE-VERIFY ?auto_23282 ?auto_23283 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23300 - SURFACE
      ?auto_23301 - SURFACE
      ?auto_23302 - SURFACE
    )
    :vars
    (
      ?auto_23306 - HOIST
      ?auto_23312 - PLACE
      ?auto_23308 - PLACE
      ?auto_23315 - HOIST
      ?auto_23316 - SURFACE
      ?auto_23311 - PLACE
      ?auto_23305 - HOIST
      ?auto_23313 - SURFACE
      ?auto_23309 - SURFACE
      ?auto_23303 - SURFACE
      ?auto_23310 - SURFACE
      ?auto_23317 - PLACE
      ?auto_23307 - HOIST
      ?auto_23314 - SURFACE
      ?auto_23304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23306 ?auto_23312 ) ( IS-CRATE ?auto_23302 ) ( not ( = ?auto_23301 ?auto_23302 ) ) ( not ( = ?auto_23300 ?auto_23301 ) ) ( not ( = ?auto_23300 ?auto_23302 ) ) ( not ( = ?auto_23308 ?auto_23312 ) ) ( HOIST-AT ?auto_23315 ?auto_23308 ) ( not ( = ?auto_23306 ?auto_23315 ) ) ( SURFACE-AT ?auto_23302 ?auto_23308 ) ( ON ?auto_23302 ?auto_23316 ) ( CLEAR ?auto_23302 ) ( not ( = ?auto_23301 ?auto_23316 ) ) ( not ( = ?auto_23302 ?auto_23316 ) ) ( not ( = ?auto_23300 ?auto_23316 ) ) ( IS-CRATE ?auto_23301 ) ( not ( = ?auto_23311 ?auto_23312 ) ) ( not ( = ?auto_23308 ?auto_23311 ) ) ( HOIST-AT ?auto_23305 ?auto_23311 ) ( not ( = ?auto_23306 ?auto_23305 ) ) ( not ( = ?auto_23315 ?auto_23305 ) ) ( AVAILABLE ?auto_23305 ) ( SURFACE-AT ?auto_23301 ?auto_23311 ) ( ON ?auto_23301 ?auto_23313 ) ( CLEAR ?auto_23301 ) ( not ( = ?auto_23301 ?auto_23313 ) ) ( not ( = ?auto_23302 ?auto_23313 ) ) ( not ( = ?auto_23300 ?auto_23313 ) ) ( not ( = ?auto_23316 ?auto_23313 ) ) ( IS-CRATE ?auto_23300 ) ( not ( = ?auto_23309 ?auto_23300 ) ) ( not ( = ?auto_23301 ?auto_23309 ) ) ( not ( = ?auto_23302 ?auto_23309 ) ) ( not ( = ?auto_23316 ?auto_23309 ) ) ( not ( = ?auto_23313 ?auto_23309 ) ) ( AVAILABLE ?auto_23315 ) ( SURFACE-AT ?auto_23300 ?auto_23308 ) ( ON ?auto_23300 ?auto_23303 ) ( CLEAR ?auto_23300 ) ( not ( = ?auto_23301 ?auto_23303 ) ) ( not ( = ?auto_23302 ?auto_23303 ) ) ( not ( = ?auto_23300 ?auto_23303 ) ) ( not ( = ?auto_23316 ?auto_23303 ) ) ( not ( = ?auto_23313 ?auto_23303 ) ) ( not ( = ?auto_23309 ?auto_23303 ) ) ( SURFACE-AT ?auto_23310 ?auto_23312 ) ( CLEAR ?auto_23310 ) ( IS-CRATE ?auto_23309 ) ( not ( = ?auto_23310 ?auto_23309 ) ) ( not ( = ?auto_23301 ?auto_23310 ) ) ( not ( = ?auto_23302 ?auto_23310 ) ) ( not ( = ?auto_23300 ?auto_23310 ) ) ( not ( = ?auto_23316 ?auto_23310 ) ) ( not ( = ?auto_23313 ?auto_23310 ) ) ( not ( = ?auto_23303 ?auto_23310 ) ) ( AVAILABLE ?auto_23306 ) ( not ( = ?auto_23317 ?auto_23312 ) ) ( not ( = ?auto_23308 ?auto_23317 ) ) ( not ( = ?auto_23311 ?auto_23317 ) ) ( HOIST-AT ?auto_23307 ?auto_23317 ) ( not ( = ?auto_23306 ?auto_23307 ) ) ( not ( = ?auto_23315 ?auto_23307 ) ) ( not ( = ?auto_23305 ?auto_23307 ) ) ( AVAILABLE ?auto_23307 ) ( SURFACE-AT ?auto_23309 ?auto_23317 ) ( ON ?auto_23309 ?auto_23314 ) ( CLEAR ?auto_23309 ) ( not ( = ?auto_23301 ?auto_23314 ) ) ( not ( = ?auto_23302 ?auto_23314 ) ) ( not ( = ?auto_23300 ?auto_23314 ) ) ( not ( = ?auto_23316 ?auto_23314 ) ) ( not ( = ?auto_23313 ?auto_23314 ) ) ( not ( = ?auto_23309 ?auto_23314 ) ) ( not ( = ?auto_23303 ?auto_23314 ) ) ( not ( = ?auto_23310 ?auto_23314 ) ) ( TRUCK-AT ?auto_23304 ?auto_23312 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23301 ?auto_23302 )
      ( MAKE-2CRATE-VERIFY ?auto_23300 ?auto_23301 ?auto_23302 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23318 - SURFACE
      ?auto_23319 - SURFACE
      ?auto_23320 - SURFACE
      ?auto_23321 - SURFACE
    )
    :vars
    (
      ?auto_23331 - HOIST
      ?auto_23326 - PLACE
      ?auto_23333 - PLACE
      ?auto_23334 - HOIST
      ?auto_23325 - SURFACE
      ?auto_23327 - PLACE
      ?auto_23324 - HOIST
      ?auto_23329 - SURFACE
      ?auto_23328 - SURFACE
      ?auto_23323 - SURFACE
      ?auto_23335 - PLACE
      ?auto_23332 - HOIST
      ?auto_23330 - SURFACE
      ?auto_23322 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23331 ?auto_23326 ) ( IS-CRATE ?auto_23321 ) ( not ( = ?auto_23320 ?auto_23321 ) ) ( not ( = ?auto_23319 ?auto_23320 ) ) ( not ( = ?auto_23319 ?auto_23321 ) ) ( not ( = ?auto_23333 ?auto_23326 ) ) ( HOIST-AT ?auto_23334 ?auto_23333 ) ( not ( = ?auto_23331 ?auto_23334 ) ) ( SURFACE-AT ?auto_23321 ?auto_23333 ) ( ON ?auto_23321 ?auto_23325 ) ( CLEAR ?auto_23321 ) ( not ( = ?auto_23320 ?auto_23325 ) ) ( not ( = ?auto_23321 ?auto_23325 ) ) ( not ( = ?auto_23319 ?auto_23325 ) ) ( IS-CRATE ?auto_23320 ) ( not ( = ?auto_23327 ?auto_23326 ) ) ( not ( = ?auto_23333 ?auto_23327 ) ) ( HOIST-AT ?auto_23324 ?auto_23327 ) ( not ( = ?auto_23331 ?auto_23324 ) ) ( not ( = ?auto_23334 ?auto_23324 ) ) ( AVAILABLE ?auto_23324 ) ( SURFACE-AT ?auto_23320 ?auto_23327 ) ( ON ?auto_23320 ?auto_23329 ) ( CLEAR ?auto_23320 ) ( not ( = ?auto_23320 ?auto_23329 ) ) ( not ( = ?auto_23321 ?auto_23329 ) ) ( not ( = ?auto_23319 ?auto_23329 ) ) ( not ( = ?auto_23325 ?auto_23329 ) ) ( IS-CRATE ?auto_23319 ) ( not ( = ?auto_23318 ?auto_23319 ) ) ( not ( = ?auto_23320 ?auto_23318 ) ) ( not ( = ?auto_23321 ?auto_23318 ) ) ( not ( = ?auto_23325 ?auto_23318 ) ) ( not ( = ?auto_23329 ?auto_23318 ) ) ( AVAILABLE ?auto_23334 ) ( SURFACE-AT ?auto_23319 ?auto_23333 ) ( ON ?auto_23319 ?auto_23328 ) ( CLEAR ?auto_23319 ) ( not ( = ?auto_23320 ?auto_23328 ) ) ( not ( = ?auto_23321 ?auto_23328 ) ) ( not ( = ?auto_23319 ?auto_23328 ) ) ( not ( = ?auto_23325 ?auto_23328 ) ) ( not ( = ?auto_23329 ?auto_23328 ) ) ( not ( = ?auto_23318 ?auto_23328 ) ) ( SURFACE-AT ?auto_23323 ?auto_23326 ) ( CLEAR ?auto_23323 ) ( IS-CRATE ?auto_23318 ) ( not ( = ?auto_23323 ?auto_23318 ) ) ( not ( = ?auto_23320 ?auto_23323 ) ) ( not ( = ?auto_23321 ?auto_23323 ) ) ( not ( = ?auto_23319 ?auto_23323 ) ) ( not ( = ?auto_23325 ?auto_23323 ) ) ( not ( = ?auto_23329 ?auto_23323 ) ) ( not ( = ?auto_23328 ?auto_23323 ) ) ( AVAILABLE ?auto_23331 ) ( not ( = ?auto_23335 ?auto_23326 ) ) ( not ( = ?auto_23333 ?auto_23335 ) ) ( not ( = ?auto_23327 ?auto_23335 ) ) ( HOIST-AT ?auto_23332 ?auto_23335 ) ( not ( = ?auto_23331 ?auto_23332 ) ) ( not ( = ?auto_23334 ?auto_23332 ) ) ( not ( = ?auto_23324 ?auto_23332 ) ) ( AVAILABLE ?auto_23332 ) ( SURFACE-AT ?auto_23318 ?auto_23335 ) ( ON ?auto_23318 ?auto_23330 ) ( CLEAR ?auto_23318 ) ( not ( = ?auto_23320 ?auto_23330 ) ) ( not ( = ?auto_23321 ?auto_23330 ) ) ( not ( = ?auto_23319 ?auto_23330 ) ) ( not ( = ?auto_23325 ?auto_23330 ) ) ( not ( = ?auto_23329 ?auto_23330 ) ) ( not ( = ?auto_23318 ?auto_23330 ) ) ( not ( = ?auto_23328 ?auto_23330 ) ) ( not ( = ?auto_23323 ?auto_23330 ) ) ( TRUCK-AT ?auto_23322 ?auto_23326 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23319 ?auto_23320 ?auto_23321 )
      ( MAKE-3CRATE-VERIFY ?auto_23318 ?auto_23319 ?auto_23320 ?auto_23321 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23336 - SURFACE
      ?auto_23337 - SURFACE
      ?auto_23338 - SURFACE
      ?auto_23339 - SURFACE
      ?auto_23340 - SURFACE
    )
    :vars
    (
      ?auto_23349 - HOIST
      ?auto_23344 - PLACE
      ?auto_23351 - PLACE
      ?auto_23352 - HOIST
      ?auto_23343 - SURFACE
      ?auto_23345 - PLACE
      ?auto_23342 - HOIST
      ?auto_23347 - SURFACE
      ?auto_23346 - SURFACE
      ?auto_23353 - PLACE
      ?auto_23350 - HOIST
      ?auto_23348 - SURFACE
      ?auto_23341 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23349 ?auto_23344 ) ( IS-CRATE ?auto_23340 ) ( not ( = ?auto_23339 ?auto_23340 ) ) ( not ( = ?auto_23338 ?auto_23339 ) ) ( not ( = ?auto_23338 ?auto_23340 ) ) ( not ( = ?auto_23351 ?auto_23344 ) ) ( HOIST-AT ?auto_23352 ?auto_23351 ) ( not ( = ?auto_23349 ?auto_23352 ) ) ( SURFACE-AT ?auto_23340 ?auto_23351 ) ( ON ?auto_23340 ?auto_23343 ) ( CLEAR ?auto_23340 ) ( not ( = ?auto_23339 ?auto_23343 ) ) ( not ( = ?auto_23340 ?auto_23343 ) ) ( not ( = ?auto_23338 ?auto_23343 ) ) ( IS-CRATE ?auto_23339 ) ( not ( = ?auto_23345 ?auto_23344 ) ) ( not ( = ?auto_23351 ?auto_23345 ) ) ( HOIST-AT ?auto_23342 ?auto_23345 ) ( not ( = ?auto_23349 ?auto_23342 ) ) ( not ( = ?auto_23352 ?auto_23342 ) ) ( AVAILABLE ?auto_23342 ) ( SURFACE-AT ?auto_23339 ?auto_23345 ) ( ON ?auto_23339 ?auto_23347 ) ( CLEAR ?auto_23339 ) ( not ( = ?auto_23339 ?auto_23347 ) ) ( not ( = ?auto_23340 ?auto_23347 ) ) ( not ( = ?auto_23338 ?auto_23347 ) ) ( not ( = ?auto_23343 ?auto_23347 ) ) ( IS-CRATE ?auto_23338 ) ( not ( = ?auto_23337 ?auto_23338 ) ) ( not ( = ?auto_23339 ?auto_23337 ) ) ( not ( = ?auto_23340 ?auto_23337 ) ) ( not ( = ?auto_23343 ?auto_23337 ) ) ( not ( = ?auto_23347 ?auto_23337 ) ) ( AVAILABLE ?auto_23352 ) ( SURFACE-AT ?auto_23338 ?auto_23351 ) ( ON ?auto_23338 ?auto_23346 ) ( CLEAR ?auto_23338 ) ( not ( = ?auto_23339 ?auto_23346 ) ) ( not ( = ?auto_23340 ?auto_23346 ) ) ( not ( = ?auto_23338 ?auto_23346 ) ) ( not ( = ?auto_23343 ?auto_23346 ) ) ( not ( = ?auto_23347 ?auto_23346 ) ) ( not ( = ?auto_23337 ?auto_23346 ) ) ( SURFACE-AT ?auto_23336 ?auto_23344 ) ( CLEAR ?auto_23336 ) ( IS-CRATE ?auto_23337 ) ( not ( = ?auto_23336 ?auto_23337 ) ) ( not ( = ?auto_23339 ?auto_23336 ) ) ( not ( = ?auto_23340 ?auto_23336 ) ) ( not ( = ?auto_23338 ?auto_23336 ) ) ( not ( = ?auto_23343 ?auto_23336 ) ) ( not ( = ?auto_23347 ?auto_23336 ) ) ( not ( = ?auto_23346 ?auto_23336 ) ) ( AVAILABLE ?auto_23349 ) ( not ( = ?auto_23353 ?auto_23344 ) ) ( not ( = ?auto_23351 ?auto_23353 ) ) ( not ( = ?auto_23345 ?auto_23353 ) ) ( HOIST-AT ?auto_23350 ?auto_23353 ) ( not ( = ?auto_23349 ?auto_23350 ) ) ( not ( = ?auto_23352 ?auto_23350 ) ) ( not ( = ?auto_23342 ?auto_23350 ) ) ( AVAILABLE ?auto_23350 ) ( SURFACE-AT ?auto_23337 ?auto_23353 ) ( ON ?auto_23337 ?auto_23348 ) ( CLEAR ?auto_23337 ) ( not ( = ?auto_23339 ?auto_23348 ) ) ( not ( = ?auto_23340 ?auto_23348 ) ) ( not ( = ?auto_23338 ?auto_23348 ) ) ( not ( = ?auto_23343 ?auto_23348 ) ) ( not ( = ?auto_23347 ?auto_23348 ) ) ( not ( = ?auto_23337 ?auto_23348 ) ) ( not ( = ?auto_23346 ?auto_23348 ) ) ( not ( = ?auto_23336 ?auto_23348 ) ) ( TRUCK-AT ?auto_23341 ?auto_23344 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23338 ?auto_23339 ?auto_23340 )
      ( MAKE-4CRATE-VERIFY ?auto_23336 ?auto_23337 ?auto_23338 ?auto_23339 ?auto_23340 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23354 - SURFACE
      ?auto_23355 - SURFACE
      ?auto_23356 - SURFACE
      ?auto_23357 - SURFACE
      ?auto_23358 - SURFACE
      ?auto_23359 - SURFACE
    )
    :vars
    (
      ?auto_23368 - HOIST
      ?auto_23363 - PLACE
      ?auto_23370 - PLACE
      ?auto_23371 - HOIST
      ?auto_23362 - SURFACE
      ?auto_23364 - PLACE
      ?auto_23361 - HOIST
      ?auto_23366 - SURFACE
      ?auto_23365 - SURFACE
      ?auto_23372 - PLACE
      ?auto_23369 - HOIST
      ?auto_23367 - SURFACE
      ?auto_23360 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23368 ?auto_23363 ) ( IS-CRATE ?auto_23359 ) ( not ( = ?auto_23358 ?auto_23359 ) ) ( not ( = ?auto_23357 ?auto_23358 ) ) ( not ( = ?auto_23357 ?auto_23359 ) ) ( not ( = ?auto_23370 ?auto_23363 ) ) ( HOIST-AT ?auto_23371 ?auto_23370 ) ( not ( = ?auto_23368 ?auto_23371 ) ) ( SURFACE-AT ?auto_23359 ?auto_23370 ) ( ON ?auto_23359 ?auto_23362 ) ( CLEAR ?auto_23359 ) ( not ( = ?auto_23358 ?auto_23362 ) ) ( not ( = ?auto_23359 ?auto_23362 ) ) ( not ( = ?auto_23357 ?auto_23362 ) ) ( IS-CRATE ?auto_23358 ) ( not ( = ?auto_23364 ?auto_23363 ) ) ( not ( = ?auto_23370 ?auto_23364 ) ) ( HOIST-AT ?auto_23361 ?auto_23364 ) ( not ( = ?auto_23368 ?auto_23361 ) ) ( not ( = ?auto_23371 ?auto_23361 ) ) ( AVAILABLE ?auto_23361 ) ( SURFACE-AT ?auto_23358 ?auto_23364 ) ( ON ?auto_23358 ?auto_23366 ) ( CLEAR ?auto_23358 ) ( not ( = ?auto_23358 ?auto_23366 ) ) ( not ( = ?auto_23359 ?auto_23366 ) ) ( not ( = ?auto_23357 ?auto_23366 ) ) ( not ( = ?auto_23362 ?auto_23366 ) ) ( IS-CRATE ?auto_23357 ) ( not ( = ?auto_23356 ?auto_23357 ) ) ( not ( = ?auto_23358 ?auto_23356 ) ) ( not ( = ?auto_23359 ?auto_23356 ) ) ( not ( = ?auto_23362 ?auto_23356 ) ) ( not ( = ?auto_23366 ?auto_23356 ) ) ( AVAILABLE ?auto_23371 ) ( SURFACE-AT ?auto_23357 ?auto_23370 ) ( ON ?auto_23357 ?auto_23365 ) ( CLEAR ?auto_23357 ) ( not ( = ?auto_23358 ?auto_23365 ) ) ( not ( = ?auto_23359 ?auto_23365 ) ) ( not ( = ?auto_23357 ?auto_23365 ) ) ( not ( = ?auto_23362 ?auto_23365 ) ) ( not ( = ?auto_23366 ?auto_23365 ) ) ( not ( = ?auto_23356 ?auto_23365 ) ) ( SURFACE-AT ?auto_23355 ?auto_23363 ) ( CLEAR ?auto_23355 ) ( IS-CRATE ?auto_23356 ) ( not ( = ?auto_23355 ?auto_23356 ) ) ( not ( = ?auto_23358 ?auto_23355 ) ) ( not ( = ?auto_23359 ?auto_23355 ) ) ( not ( = ?auto_23357 ?auto_23355 ) ) ( not ( = ?auto_23362 ?auto_23355 ) ) ( not ( = ?auto_23366 ?auto_23355 ) ) ( not ( = ?auto_23365 ?auto_23355 ) ) ( AVAILABLE ?auto_23368 ) ( not ( = ?auto_23372 ?auto_23363 ) ) ( not ( = ?auto_23370 ?auto_23372 ) ) ( not ( = ?auto_23364 ?auto_23372 ) ) ( HOIST-AT ?auto_23369 ?auto_23372 ) ( not ( = ?auto_23368 ?auto_23369 ) ) ( not ( = ?auto_23371 ?auto_23369 ) ) ( not ( = ?auto_23361 ?auto_23369 ) ) ( AVAILABLE ?auto_23369 ) ( SURFACE-AT ?auto_23356 ?auto_23372 ) ( ON ?auto_23356 ?auto_23367 ) ( CLEAR ?auto_23356 ) ( not ( = ?auto_23358 ?auto_23367 ) ) ( not ( = ?auto_23359 ?auto_23367 ) ) ( not ( = ?auto_23357 ?auto_23367 ) ) ( not ( = ?auto_23362 ?auto_23367 ) ) ( not ( = ?auto_23366 ?auto_23367 ) ) ( not ( = ?auto_23356 ?auto_23367 ) ) ( not ( = ?auto_23365 ?auto_23367 ) ) ( not ( = ?auto_23355 ?auto_23367 ) ) ( TRUCK-AT ?auto_23360 ?auto_23363 ) ( ON ?auto_23355 ?auto_23354 ) ( not ( = ?auto_23354 ?auto_23355 ) ) ( not ( = ?auto_23354 ?auto_23356 ) ) ( not ( = ?auto_23354 ?auto_23357 ) ) ( not ( = ?auto_23354 ?auto_23358 ) ) ( not ( = ?auto_23354 ?auto_23359 ) ) ( not ( = ?auto_23354 ?auto_23362 ) ) ( not ( = ?auto_23354 ?auto_23366 ) ) ( not ( = ?auto_23354 ?auto_23365 ) ) ( not ( = ?auto_23354 ?auto_23367 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23357 ?auto_23358 ?auto_23359 )
      ( MAKE-5CRATE-VERIFY ?auto_23354 ?auto_23355 ?auto_23356 ?auto_23357 ?auto_23358 ?auto_23359 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23373 - SURFACE
      ?auto_23374 - SURFACE
    )
    :vars
    (
      ?auto_23385 - HOIST
      ?auto_23379 - PLACE
      ?auto_23390 - SURFACE
      ?auto_23387 - PLACE
      ?auto_23388 - HOIST
      ?auto_23378 - SURFACE
      ?auto_23380 - PLACE
      ?auto_23377 - HOIST
      ?auto_23382 - SURFACE
      ?auto_23384 - SURFACE
      ?auto_23381 - SURFACE
      ?auto_23376 - SURFACE
      ?auto_23389 - PLACE
      ?auto_23386 - HOIST
      ?auto_23383 - SURFACE
      ?auto_23375 - TRUCK
      ?auto_23391 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23385 ?auto_23379 ) ( IS-CRATE ?auto_23374 ) ( not ( = ?auto_23373 ?auto_23374 ) ) ( not ( = ?auto_23390 ?auto_23373 ) ) ( not ( = ?auto_23390 ?auto_23374 ) ) ( not ( = ?auto_23387 ?auto_23379 ) ) ( HOIST-AT ?auto_23388 ?auto_23387 ) ( not ( = ?auto_23385 ?auto_23388 ) ) ( SURFACE-AT ?auto_23374 ?auto_23387 ) ( ON ?auto_23374 ?auto_23378 ) ( CLEAR ?auto_23374 ) ( not ( = ?auto_23373 ?auto_23378 ) ) ( not ( = ?auto_23374 ?auto_23378 ) ) ( not ( = ?auto_23390 ?auto_23378 ) ) ( IS-CRATE ?auto_23373 ) ( not ( = ?auto_23380 ?auto_23379 ) ) ( not ( = ?auto_23387 ?auto_23380 ) ) ( HOIST-AT ?auto_23377 ?auto_23380 ) ( not ( = ?auto_23385 ?auto_23377 ) ) ( not ( = ?auto_23388 ?auto_23377 ) ) ( AVAILABLE ?auto_23377 ) ( SURFACE-AT ?auto_23373 ?auto_23380 ) ( ON ?auto_23373 ?auto_23382 ) ( CLEAR ?auto_23373 ) ( not ( = ?auto_23373 ?auto_23382 ) ) ( not ( = ?auto_23374 ?auto_23382 ) ) ( not ( = ?auto_23390 ?auto_23382 ) ) ( not ( = ?auto_23378 ?auto_23382 ) ) ( IS-CRATE ?auto_23390 ) ( not ( = ?auto_23384 ?auto_23390 ) ) ( not ( = ?auto_23373 ?auto_23384 ) ) ( not ( = ?auto_23374 ?auto_23384 ) ) ( not ( = ?auto_23378 ?auto_23384 ) ) ( not ( = ?auto_23382 ?auto_23384 ) ) ( AVAILABLE ?auto_23388 ) ( SURFACE-AT ?auto_23390 ?auto_23387 ) ( ON ?auto_23390 ?auto_23381 ) ( CLEAR ?auto_23390 ) ( not ( = ?auto_23373 ?auto_23381 ) ) ( not ( = ?auto_23374 ?auto_23381 ) ) ( not ( = ?auto_23390 ?auto_23381 ) ) ( not ( = ?auto_23378 ?auto_23381 ) ) ( not ( = ?auto_23382 ?auto_23381 ) ) ( not ( = ?auto_23384 ?auto_23381 ) ) ( IS-CRATE ?auto_23384 ) ( not ( = ?auto_23376 ?auto_23384 ) ) ( not ( = ?auto_23373 ?auto_23376 ) ) ( not ( = ?auto_23374 ?auto_23376 ) ) ( not ( = ?auto_23390 ?auto_23376 ) ) ( not ( = ?auto_23378 ?auto_23376 ) ) ( not ( = ?auto_23382 ?auto_23376 ) ) ( not ( = ?auto_23381 ?auto_23376 ) ) ( not ( = ?auto_23389 ?auto_23379 ) ) ( not ( = ?auto_23387 ?auto_23389 ) ) ( not ( = ?auto_23380 ?auto_23389 ) ) ( HOIST-AT ?auto_23386 ?auto_23389 ) ( not ( = ?auto_23385 ?auto_23386 ) ) ( not ( = ?auto_23388 ?auto_23386 ) ) ( not ( = ?auto_23377 ?auto_23386 ) ) ( AVAILABLE ?auto_23386 ) ( SURFACE-AT ?auto_23384 ?auto_23389 ) ( ON ?auto_23384 ?auto_23383 ) ( CLEAR ?auto_23384 ) ( not ( = ?auto_23373 ?auto_23383 ) ) ( not ( = ?auto_23374 ?auto_23383 ) ) ( not ( = ?auto_23390 ?auto_23383 ) ) ( not ( = ?auto_23378 ?auto_23383 ) ) ( not ( = ?auto_23382 ?auto_23383 ) ) ( not ( = ?auto_23384 ?auto_23383 ) ) ( not ( = ?auto_23381 ?auto_23383 ) ) ( not ( = ?auto_23376 ?auto_23383 ) ) ( TRUCK-AT ?auto_23375 ?auto_23379 ) ( SURFACE-AT ?auto_23391 ?auto_23379 ) ( CLEAR ?auto_23391 ) ( LIFTING ?auto_23385 ?auto_23376 ) ( IS-CRATE ?auto_23376 ) ( not ( = ?auto_23391 ?auto_23376 ) ) ( not ( = ?auto_23373 ?auto_23391 ) ) ( not ( = ?auto_23374 ?auto_23391 ) ) ( not ( = ?auto_23390 ?auto_23391 ) ) ( not ( = ?auto_23378 ?auto_23391 ) ) ( not ( = ?auto_23382 ?auto_23391 ) ) ( not ( = ?auto_23384 ?auto_23391 ) ) ( not ( = ?auto_23381 ?auto_23391 ) ) ( not ( = ?auto_23383 ?auto_23391 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23391 ?auto_23376 )
      ( MAKE-2CRATE ?auto_23390 ?auto_23373 ?auto_23374 )
      ( MAKE-1CRATE-VERIFY ?auto_23373 ?auto_23374 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23392 - SURFACE
      ?auto_23393 - SURFACE
      ?auto_23394 - SURFACE
    )
    :vars
    (
      ?auto_23399 - HOIST
      ?auto_23407 - PLACE
      ?auto_23409 - PLACE
      ?auto_23398 - HOIST
      ?auto_23396 - SURFACE
      ?auto_23410 - PLACE
      ?auto_23406 - HOIST
      ?auto_23401 - SURFACE
      ?auto_23403 - SURFACE
      ?auto_23402 - SURFACE
      ?auto_23404 - SURFACE
      ?auto_23397 - PLACE
      ?auto_23400 - HOIST
      ?auto_23395 - SURFACE
      ?auto_23405 - TRUCK
      ?auto_23408 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23399 ?auto_23407 ) ( IS-CRATE ?auto_23394 ) ( not ( = ?auto_23393 ?auto_23394 ) ) ( not ( = ?auto_23392 ?auto_23393 ) ) ( not ( = ?auto_23392 ?auto_23394 ) ) ( not ( = ?auto_23409 ?auto_23407 ) ) ( HOIST-AT ?auto_23398 ?auto_23409 ) ( not ( = ?auto_23399 ?auto_23398 ) ) ( SURFACE-AT ?auto_23394 ?auto_23409 ) ( ON ?auto_23394 ?auto_23396 ) ( CLEAR ?auto_23394 ) ( not ( = ?auto_23393 ?auto_23396 ) ) ( not ( = ?auto_23394 ?auto_23396 ) ) ( not ( = ?auto_23392 ?auto_23396 ) ) ( IS-CRATE ?auto_23393 ) ( not ( = ?auto_23410 ?auto_23407 ) ) ( not ( = ?auto_23409 ?auto_23410 ) ) ( HOIST-AT ?auto_23406 ?auto_23410 ) ( not ( = ?auto_23399 ?auto_23406 ) ) ( not ( = ?auto_23398 ?auto_23406 ) ) ( AVAILABLE ?auto_23406 ) ( SURFACE-AT ?auto_23393 ?auto_23410 ) ( ON ?auto_23393 ?auto_23401 ) ( CLEAR ?auto_23393 ) ( not ( = ?auto_23393 ?auto_23401 ) ) ( not ( = ?auto_23394 ?auto_23401 ) ) ( not ( = ?auto_23392 ?auto_23401 ) ) ( not ( = ?auto_23396 ?auto_23401 ) ) ( IS-CRATE ?auto_23392 ) ( not ( = ?auto_23403 ?auto_23392 ) ) ( not ( = ?auto_23393 ?auto_23403 ) ) ( not ( = ?auto_23394 ?auto_23403 ) ) ( not ( = ?auto_23396 ?auto_23403 ) ) ( not ( = ?auto_23401 ?auto_23403 ) ) ( AVAILABLE ?auto_23398 ) ( SURFACE-AT ?auto_23392 ?auto_23409 ) ( ON ?auto_23392 ?auto_23402 ) ( CLEAR ?auto_23392 ) ( not ( = ?auto_23393 ?auto_23402 ) ) ( not ( = ?auto_23394 ?auto_23402 ) ) ( not ( = ?auto_23392 ?auto_23402 ) ) ( not ( = ?auto_23396 ?auto_23402 ) ) ( not ( = ?auto_23401 ?auto_23402 ) ) ( not ( = ?auto_23403 ?auto_23402 ) ) ( IS-CRATE ?auto_23403 ) ( not ( = ?auto_23404 ?auto_23403 ) ) ( not ( = ?auto_23393 ?auto_23404 ) ) ( not ( = ?auto_23394 ?auto_23404 ) ) ( not ( = ?auto_23392 ?auto_23404 ) ) ( not ( = ?auto_23396 ?auto_23404 ) ) ( not ( = ?auto_23401 ?auto_23404 ) ) ( not ( = ?auto_23402 ?auto_23404 ) ) ( not ( = ?auto_23397 ?auto_23407 ) ) ( not ( = ?auto_23409 ?auto_23397 ) ) ( not ( = ?auto_23410 ?auto_23397 ) ) ( HOIST-AT ?auto_23400 ?auto_23397 ) ( not ( = ?auto_23399 ?auto_23400 ) ) ( not ( = ?auto_23398 ?auto_23400 ) ) ( not ( = ?auto_23406 ?auto_23400 ) ) ( AVAILABLE ?auto_23400 ) ( SURFACE-AT ?auto_23403 ?auto_23397 ) ( ON ?auto_23403 ?auto_23395 ) ( CLEAR ?auto_23403 ) ( not ( = ?auto_23393 ?auto_23395 ) ) ( not ( = ?auto_23394 ?auto_23395 ) ) ( not ( = ?auto_23392 ?auto_23395 ) ) ( not ( = ?auto_23396 ?auto_23395 ) ) ( not ( = ?auto_23401 ?auto_23395 ) ) ( not ( = ?auto_23403 ?auto_23395 ) ) ( not ( = ?auto_23402 ?auto_23395 ) ) ( not ( = ?auto_23404 ?auto_23395 ) ) ( TRUCK-AT ?auto_23405 ?auto_23407 ) ( SURFACE-AT ?auto_23408 ?auto_23407 ) ( CLEAR ?auto_23408 ) ( LIFTING ?auto_23399 ?auto_23404 ) ( IS-CRATE ?auto_23404 ) ( not ( = ?auto_23408 ?auto_23404 ) ) ( not ( = ?auto_23393 ?auto_23408 ) ) ( not ( = ?auto_23394 ?auto_23408 ) ) ( not ( = ?auto_23392 ?auto_23408 ) ) ( not ( = ?auto_23396 ?auto_23408 ) ) ( not ( = ?auto_23401 ?auto_23408 ) ) ( not ( = ?auto_23403 ?auto_23408 ) ) ( not ( = ?auto_23402 ?auto_23408 ) ) ( not ( = ?auto_23395 ?auto_23408 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23393 ?auto_23394 )
      ( MAKE-2CRATE-VERIFY ?auto_23392 ?auto_23393 ?auto_23394 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23411 - SURFACE
      ?auto_23412 - SURFACE
      ?auto_23413 - SURFACE
      ?auto_23414 - SURFACE
    )
    :vars
    (
      ?auto_23427 - HOIST
      ?auto_23416 - PLACE
      ?auto_23421 - PLACE
      ?auto_23423 - HOIST
      ?auto_23422 - SURFACE
      ?auto_23428 - PLACE
      ?auto_23415 - HOIST
      ?auto_23420 - SURFACE
      ?auto_23425 - SURFACE
      ?auto_23418 - SURFACE
      ?auto_23429 - PLACE
      ?auto_23417 - HOIST
      ?auto_23419 - SURFACE
      ?auto_23424 - TRUCK
      ?auto_23426 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23427 ?auto_23416 ) ( IS-CRATE ?auto_23414 ) ( not ( = ?auto_23413 ?auto_23414 ) ) ( not ( = ?auto_23412 ?auto_23413 ) ) ( not ( = ?auto_23412 ?auto_23414 ) ) ( not ( = ?auto_23421 ?auto_23416 ) ) ( HOIST-AT ?auto_23423 ?auto_23421 ) ( not ( = ?auto_23427 ?auto_23423 ) ) ( SURFACE-AT ?auto_23414 ?auto_23421 ) ( ON ?auto_23414 ?auto_23422 ) ( CLEAR ?auto_23414 ) ( not ( = ?auto_23413 ?auto_23422 ) ) ( not ( = ?auto_23414 ?auto_23422 ) ) ( not ( = ?auto_23412 ?auto_23422 ) ) ( IS-CRATE ?auto_23413 ) ( not ( = ?auto_23428 ?auto_23416 ) ) ( not ( = ?auto_23421 ?auto_23428 ) ) ( HOIST-AT ?auto_23415 ?auto_23428 ) ( not ( = ?auto_23427 ?auto_23415 ) ) ( not ( = ?auto_23423 ?auto_23415 ) ) ( AVAILABLE ?auto_23415 ) ( SURFACE-AT ?auto_23413 ?auto_23428 ) ( ON ?auto_23413 ?auto_23420 ) ( CLEAR ?auto_23413 ) ( not ( = ?auto_23413 ?auto_23420 ) ) ( not ( = ?auto_23414 ?auto_23420 ) ) ( not ( = ?auto_23412 ?auto_23420 ) ) ( not ( = ?auto_23422 ?auto_23420 ) ) ( IS-CRATE ?auto_23412 ) ( not ( = ?auto_23411 ?auto_23412 ) ) ( not ( = ?auto_23413 ?auto_23411 ) ) ( not ( = ?auto_23414 ?auto_23411 ) ) ( not ( = ?auto_23422 ?auto_23411 ) ) ( not ( = ?auto_23420 ?auto_23411 ) ) ( AVAILABLE ?auto_23423 ) ( SURFACE-AT ?auto_23412 ?auto_23421 ) ( ON ?auto_23412 ?auto_23425 ) ( CLEAR ?auto_23412 ) ( not ( = ?auto_23413 ?auto_23425 ) ) ( not ( = ?auto_23414 ?auto_23425 ) ) ( not ( = ?auto_23412 ?auto_23425 ) ) ( not ( = ?auto_23422 ?auto_23425 ) ) ( not ( = ?auto_23420 ?auto_23425 ) ) ( not ( = ?auto_23411 ?auto_23425 ) ) ( IS-CRATE ?auto_23411 ) ( not ( = ?auto_23418 ?auto_23411 ) ) ( not ( = ?auto_23413 ?auto_23418 ) ) ( not ( = ?auto_23414 ?auto_23418 ) ) ( not ( = ?auto_23412 ?auto_23418 ) ) ( not ( = ?auto_23422 ?auto_23418 ) ) ( not ( = ?auto_23420 ?auto_23418 ) ) ( not ( = ?auto_23425 ?auto_23418 ) ) ( not ( = ?auto_23429 ?auto_23416 ) ) ( not ( = ?auto_23421 ?auto_23429 ) ) ( not ( = ?auto_23428 ?auto_23429 ) ) ( HOIST-AT ?auto_23417 ?auto_23429 ) ( not ( = ?auto_23427 ?auto_23417 ) ) ( not ( = ?auto_23423 ?auto_23417 ) ) ( not ( = ?auto_23415 ?auto_23417 ) ) ( AVAILABLE ?auto_23417 ) ( SURFACE-AT ?auto_23411 ?auto_23429 ) ( ON ?auto_23411 ?auto_23419 ) ( CLEAR ?auto_23411 ) ( not ( = ?auto_23413 ?auto_23419 ) ) ( not ( = ?auto_23414 ?auto_23419 ) ) ( not ( = ?auto_23412 ?auto_23419 ) ) ( not ( = ?auto_23422 ?auto_23419 ) ) ( not ( = ?auto_23420 ?auto_23419 ) ) ( not ( = ?auto_23411 ?auto_23419 ) ) ( not ( = ?auto_23425 ?auto_23419 ) ) ( not ( = ?auto_23418 ?auto_23419 ) ) ( TRUCK-AT ?auto_23424 ?auto_23416 ) ( SURFACE-AT ?auto_23426 ?auto_23416 ) ( CLEAR ?auto_23426 ) ( LIFTING ?auto_23427 ?auto_23418 ) ( IS-CRATE ?auto_23418 ) ( not ( = ?auto_23426 ?auto_23418 ) ) ( not ( = ?auto_23413 ?auto_23426 ) ) ( not ( = ?auto_23414 ?auto_23426 ) ) ( not ( = ?auto_23412 ?auto_23426 ) ) ( not ( = ?auto_23422 ?auto_23426 ) ) ( not ( = ?auto_23420 ?auto_23426 ) ) ( not ( = ?auto_23411 ?auto_23426 ) ) ( not ( = ?auto_23425 ?auto_23426 ) ) ( not ( = ?auto_23419 ?auto_23426 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23412 ?auto_23413 ?auto_23414 )
      ( MAKE-3CRATE-VERIFY ?auto_23411 ?auto_23412 ?auto_23413 ?auto_23414 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23430 - SURFACE
      ?auto_23431 - SURFACE
      ?auto_23432 - SURFACE
      ?auto_23433 - SURFACE
      ?auto_23434 - SURFACE
    )
    :vars
    (
      ?auto_23446 - HOIST
      ?auto_23436 - PLACE
      ?auto_23440 - PLACE
      ?auto_23442 - HOIST
      ?auto_23441 - SURFACE
      ?auto_23447 - PLACE
      ?auto_23435 - HOIST
      ?auto_23439 - SURFACE
      ?auto_23444 - SURFACE
      ?auto_23448 - PLACE
      ?auto_23437 - HOIST
      ?auto_23438 - SURFACE
      ?auto_23443 - TRUCK
      ?auto_23445 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23446 ?auto_23436 ) ( IS-CRATE ?auto_23434 ) ( not ( = ?auto_23433 ?auto_23434 ) ) ( not ( = ?auto_23432 ?auto_23433 ) ) ( not ( = ?auto_23432 ?auto_23434 ) ) ( not ( = ?auto_23440 ?auto_23436 ) ) ( HOIST-AT ?auto_23442 ?auto_23440 ) ( not ( = ?auto_23446 ?auto_23442 ) ) ( SURFACE-AT ?auto_23434 ?auto_23440 ) ( ON ?auto_23434 ?auto_23441 ) ( CLEAR ?auto_23434 ) ( not ( = ?auto_23433 ?auto_23441 ) ) ( not ( = ?auto_23434 ?auto_23441 ) ) ( not ( = ?auto_23432 ?auto_23441 ) ) ( IS-CRATE ?auto_23433 ) ( not ( = ?auto_23447 ?auto_23436 ) ) ( not ( = ?auto_23440 ?auto_23447 ) ) ( HOIST-AT ?auto_23435 ?auto_23447 ) ( not ( = ?auto_23446 ?auto_23435 ) ) ( not ( = ?auto_23442 ?auto_23435 ) ) ( AVAILABLE ?auto_23435 ) ( SURFACE-AT ?auto_23433 ?auto_23447 ) ( ON ?auto_23433 ?auto_23439 ) ( CLEAR ?auto_23433 ) ( not ( = ?auto_23433 ?auto_23439 ) ) ( not ( = ?auto_23434 ?auto_23439 ) ) ( not ( = ?auto_23432 ?auto_23439 ) ) ( not ( = ?auto_23441 ?auto_23439 ) ) ( IS-CRATE ?auto_23432 ) ( not ( = ?auto_23431 ?auto_23432 ) ) ( not ( = ?auto_23433 ?auto_23431 ) ) ( not ( = ?auto_23434 ?auto_23431 ) ) ( not ( = ?auto_23441 ?auto_23431 ) ) ( not ( = ?auto_23439 ?auto_23431 ) ) ( AVAILABLE ?auto_23442 ) ( SURFACE-AT ?auto_23432 ?auto_23440 ) ( ON ?auto_23432 ?auto_23444 ) ( CLEAR ?auto_23432 ) ( not ( = ?auto_23433 ?auto_23444 ) ) ( not ( = ?auto_23434 ?auto_23444 ) ) ( not ( = ?auto_23432 ?auto_23444 ) ) ( not ( = ?auto_23441 ?auto_23444 ) ) ( not ( = ?auto_23439 ?auto_23444 ) ) ( not ( = ?auto_23431 ?auto_23444 ) ) ( IS-CRATE ?auto_23431 ) ( not ( = ?auto_23430 ?auto_23431 ) ) ( not ( = ?auto_23433 ?auto_23430 ) ) ( not ( = ?auto_23434 ?auto_23430 ) ) ( not ( = ?auto_23432 ?auto_23430 ) ) ( not ( = ?auto_23441 ?auto_23430 ) ) ( not ( = ?auto_23439 ?auto_23430 ) ) ( not ( = ?auto_23444 ?auto_23430 ) ) ( not ( = ?auto_23448 ?auto_23436 ) ) ( not ( = ?auto_23440 ?auto_23448 ) ) ( not ( = ?auto_23447 ?auto_23448 ) ) ( HOIST-AT ?auto_23437 ?auto_23448 ) ( not ( = ?auto_23446 ?auto_23437 ) ) ( not ( = ?auto_23442 ?auto_23437 ) ) ( not ( = ?auto_23435 ?auto_23437 ) ) ( AVAILABLE ?auto_23437 ) ( SURFACE-AT ?auto_23431 ?auto_23448 ) ( ON ?auto_23431 ?auto_23438 ) ( CLEAR ?auto_23431 ) ( not ( = ?auto_23433 ?auto_23438 ) ) ( not ( = ?auto_23434 ?auto_23438 ) ) ( not ( = ?auto_23432 ?auto_23438 ) ) ( not ( = ?auto_23441 ?auto_23438 ) ) ( not ( = ?auto_23439 ?auto_23438 ) ) ( not ( = ?auto_23431 ?auto_23438 ) ) ( not ( = ?auto_23444 ?auto_23438 ) ) ( not ( = ?auto_23430 ?auto_23438 ) ) ( TRUCK-AT ?auto_23443 ?auto_23436 ) ( SURFACE-AT ?auto_23445 ?auto_23436 ) ( CLEAR ?auto_23445 ) ( LIFTING ?auto_23446 ?auto_23430 ) ( IS-CRATE ?auto_23430 ) ( not ( = ?auto_23445 ?auto_23430 ) ) ( not ( = ?auto_23433 ?auto_23445 ) ) ( not ( = ?auto_23434 ?auto_23445 ) ) ( not ( = ?auto_23432 ?auto_23445 ) ) ( not ( = ?auto_23441 ?auto_23445 ) ) ( not ( = ?auto_23439 ?auto_23445 ) ) ( not ( = ?auto_23431 ?auto_23445 ) ) ( not ( = ?auto_23444 ?auto_23445 ) ) ( not ( = ?auto_23438 ?auto_23445 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23432 ?auto_23433 ?auto_23434 )
      ( MAKE-4CRATE-VERIFY ?auto_23430 ?auto_23431 ?auto_23432 ?auto_23433 ?auto_23434 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23449 - SURFACE
      ?auto_23450 - SURFACE
      ?auto_23451 - SURFACE
      ?auto_23452 - SURFACE
      ?auto_23453 - SURFACE
      ?auto_23454 - SURFACE
    )
    :vars
    (
      ?auto_23465 - HOIST
      ?auto_23456 - PLACE
      ?auto_23460 - PLACE
      ?auto_23462 - HOIST
      ?auto_23461 - SURFACE
      ?auto_23466 - PLACE
      ?auto_23455 - HOIST
      ?auto_23459 - SURFACE
      ?auto_23464 - SURFACE
      ?auto_23467 - PLACE
      ?auto_23457 - HOIST
      ?auto_23458 - SURFACE
      ?auto_23463 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23465 ?auto_23456 ) ( IS-CRATE ?auto_23454 ) ( not ( = ?auto_23453 ?auto_23454 ) ) ( not ( = ?auto_23452 ?auto_23453 ) ) ( not ( = ?auto_23452 ?auto_23454 ) ) ( not ( = ?auto_23460 ?auto_23456 ) ) ( HOIST-AT ?auto_23462 ?auto_23460 ) ( not ( = ?auto_23465 ?auto_23462 ) ) ( SURFACE-AT ?auto_23454 ?auto_23460 ) ( ON ?auto_23454 ?auto_23461 ) ( CLEAR ?auto_23454 ) ( not ( = ?auto_23453 ?auto_23461 ) ) ( not ( = ?auto_23454 ?auto_23461 ) ) ( not ( = ?auto_23452 ?auto_23461 ) ) ( IS-CRATE ?auto_23453 ) ( not ( = ?auto_23466 ?auto_23456 ) ) ( not ( = ?auto_23460 ?auto_23466 ) ) ( HOIST-AT ?auto_23455 ?auto_23466 ) ( not ( = ?auto_23465 ?auto_23455 ) ) ( not ( = ?auto_23462 ?auto_23455 ) ) ( AVAILABLE ?auto_23455 ) ( SURFACE-AT ?auto_23453 ?auto_23466 ) ( ON ?auto_23453 ?auto_23459 ) ( CLEAR ?auto_23453 ) ( not ( = ?auto_23453 ?auto_23459 ) ) ( not ( = ?auto_23454 ?auto_23459 ) ) ( not ( = ?auto_23452 ?auto_23459 ) ) ( not ( = ?auto_23461 ?auto_23459 ) ) ( IS-CRATE ?auto_23452 ) ( not ( = ?auto_23451 ?auto_23452 ) ) ( not ( = ?auto_23453 ?auto_23451 ) ) ( not ( = ?auto_23454 ?auto_23451 ) ) ( not ( = ?auto_23461 ?auto_23451 ) ) ( not ( = ?auto_23459 ?auto_23451 ) ) ( AVAILABLE ?auto_23462 ) ( SURFACE-AT ?auto_23452 ?auto_23460 ) ( ON ?auto_23452 ?auto_23464 ) ( CLEAR ?auto_23452 ) ( not ( = ?auto_23453 ?auto_23464 ) ) ( not ( = ?auto_23454 ?auto_23464 ) ) ( not ( = ?auto_23452 ?auto_23464 ) ) ( not ( = ?auto_23461 ?auto_23464 ) ) ( not ( = ?auto_23459 ?auto_23464 ) ) ( not ( = ?auto_23451 ?auto_23464 ) ) ( IS-CRATE ?auto_23451 ) ( not ( = ?auto_23450 ?auto_23451 ) ) ( not ( = ?auto_23453 ?auto_23450 ) ) ( not ( = ?auto_23454 ?auto_23450 ) ) ( not ( = ?auto_23452 ?auto_23450 ) ) ( not ( = ?auto_23461 ?auto_23450 ) ) ( not ( = ?auto_23459 ?auto_23450 ) ) ( not ( = ?auto_23464 ?auto_23450 ) ) ( not ( = ?auto_23467 ?auto_23456 ) ) ( not ( = ?auto_23460 ?auto_23467 ) ) ( not ( = ?auto_23466 ?auto_23467 ) ) ( HOIST-AT ?auto_23457 ?auto_23467 ) ( not ( = ?auto_23465 ?auto_23457 ) ) ( not ( = ?auto_23462 ?auto_23457 ) ) ( not ( = ?auto_23455 ?auto_23457 ) ) ( AVAILABLE ?auto_23457 ) ( SURFACE-AT ?auto_23451 ?auto_23467 ) ( ON ?auto_23451 ?auto_23458 ) ( CLEAR ?auto_23451 ) ( not ( = ?auto_23453 ?auto_23458 ) ) ( not ( = ?auto_23454 ?auto_23458 ) ) ( not ( = ?auto_23452 ?auto_23458 ) ) ( not ( = ?auto_23461 ?auto_23458 ) ) ( not ( = ?auto_23459 ?auto_23458 ) ) ( not ( = ?auto_23451 ?auto_23458 ) ) ( not ( = ?auto_23464 ?auto_23458 ) ) ( not ( = ?auto_23450 ?auto_23458 ) ) ( TRUCK-AT ?auto_23463 ?auto_23456 ) ( SURFACE-AT ?auto_23449 ?auto_23456 ) ( CLEAR ?auto_23449 ) ( LIFTING ?auto_23465 ?auto_23450 ) ( IS-CRATE ?auto_23450 ) ( not ( = ?auto_23449 ?auto_23450 ) ) ( not ( = ?auto_23453 ?auto_23449 ) ) ( not ( = ?auto_23454 ?auto_23449 ) ) ( not ( = ?auto_23452 ?auto_23449 ) ) ( not ( = ?auto_23461 ?auto_23449 ) ) ( not ( = ?auto_23459 ?auto_23449 ) ) ( not ( = ?auto_23451 ?auto_23449 ) ) ( not ( = ?auto_23464 ?auto_23449 ) ) ( not ( = ?auto_23458 ?auto_23449 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23452 ?auto_23453 ?auto_23454 )
      ( MAKE-5CRATE-VERIFY ?auto_23449 ?auto_23450 ?auto_23451 ?auto_23452 ?auto_23453 ?auto_23454 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23468 - SURFACE
      ?auto_23469 - SURFACE
    )
    :vars
    (
      ?auto_23484 - HOIST
      ?auto_23471 - PLACE
      ?auto_23476 - SURFACE
      ?auto_23478 - PLACE
      ?auto_23480 - HOIST
      ?auto_23479 - SURFACE
      ?auto_23485 - PLACE
      ?auto_23470 - HOIST
      ?auto_23475 - SURFACE
      ?auto_23477 - SURFACE
      ?auto_23482 - SURFACE
      ?auto_23473 - SURFACE
      ?auto_23486 - PLACE
      ?auto_23472 - HOIST
      ?auto_23474 - SURFACE
      ?auto_23481 - TRUCK
      ?auto_23483 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23484 ?auto_23471 ) ( IS-CRATE ?auto_23469 ) ( not ( = ?auto_23468 ?auto_23469 ) ) ( not ( = ?auto_23476 ?auto_23468 ) ) ( not ( = ?auto_23476 ?auto_23469 ) ) ( not ( = ?auto_23478 ?auto_23471 ) ) ( HOIST-AT ?auto_23480 ?auto_23478 ) ( not ( = ?auto_23484 ?auto_23480 ) ) ( SURFACE-AT ?auto_23469 ?auto_23478 ) ( ON ?auto_23469 ?auto_23479 ) ( CLEAR ?auto_23469 ) ( not ( = ?auto_23468 ?auto_23479 ) ) ( not ( = ?auto_23469 ?auto_23479 ) ) ( not ( = ?auto_23476 ?auto_23479 ) ) ( IS-CRATE ?auto_23468 ) ( not ( = ?auto_23485 ?auto_23471 ) ) ( not ( = ?auto_23478 ?auto_23485 ) ) ( HOIST-AT ?auto_23470 ?auto_23485 ) ( not ( = ?auto_23484 ?auto_23470 ) ) ( not ( = ?auto_23480 ?auto_23470 ) ) ( AVAILABLE ?auto_23470 ) ( SURFACE-AT ?auto_23468 ?auto_23485 ) ( ON ?auto_23468 ?auto_23475 ) ( CLEAR ?auto_23468 ) ( not ( = ?auto_23468 ?auto_23475 ) ) ( not ( = ?auto_23469 ?auto_23475 ) ) ( not ( = ?auto_23476 ?auto_23475 ) ) ( not ( = ?auto_23479 ?auto_23475 ) ) ( IS-CRATE ?auto_23476 ) ( not ( = ?auto_23477 ?auto_23476 ) ) ( not ( = ?auto_23468 ?auto_23477 ) ) ( not ( = ?auto_23469 ?auto_23477 ) ) ( not ( = ?auto_23479 ?auto_23477 ) ) ( not ( = ?auto_23475 ?auto_23477 ) ) ( AVAILABLE ?auto_23480 ) ( SURFACE-AT ?auto_23476 ?auto_23478 ) ( ON ?auto_23476 ?auto_23482 ) ( CLEAR ?auto_23476 ) ( not ( = ?auto_23468 ?auto_23482 ) ) ( not ( = ?auto_23469 ?auto_23482 ) ) ( not ( = ?auto_23476 ?auto_23482 ) ) ( not ( = ?auto_23479 ?auto_23482 ) ) ( not ( = ?auto_23475 ?auto_23482 ) ) ( not ( = ?auto_23477 ?auto_23482 ) ) ( IS-CRATE ?auto_23477 ) ( not ( = ?auto_23473 ?auto_23477 ) ) ( not ( = ?auto_23468 ?auto_23473 ) ) ( not ( = ?auto_23469 ?auto_23473 ) ) ( not ( = ?auto_23476 ?auto_23473 ) ) ( not ( = ?auto_23479 ?auto_23473 ) ) ( not ( = ?auto_23475 ?auto_23473 ) ) ( not ( = ?auto_23482 ?auto_23473 ) ) ( not ( = ?auto_23486 ?auto_23471 ) ) ( not ( = ?auto_23478 ?auto_23486 ) ) ( not ( = ?auto_23485 ?auto_23486 ) ) ( HOIST-AT ?auto_23472 ?auto_23486 ) ( not ( = ?auto_23484 ?auto_23472 ) ) ( not ( = ?auto_23480 ?auto_23472 ) ) ( not ( = ?auto_23470 ?auto_23472 ) ) ( AVAILABLE ?auto_23472 ) ( SURFACE-AT ?auto_23477 ?auto_23486 ) ( ON ?auto_23477 ?auto_23474 ) ( CLEAR ?auto_23477 ) ( not ( = ?auto_23468 ?auto_23474 ) ) ( not ( = ?auto_23469 ?auto_23474 ) ) ( not ( = ?auto_23476 ?auto_23474 ) ) ( not ( = ?auto_23479 ?auto_23474 ) ) ( not ( = ?auto_23475 ?auto_23474 ) ) ( not ( = ?auto_23477 ?auto_23474 ) ) ( not ( = ?auto_23482 ?auto_23474 ) ) ( not ( = ?auto_23473 ?auto_23474 ) ) ( TRUCK-AT ?auto_23481 ?auto_23471 ) ( SURFACE-AT ?auto_23483 ?auto_23471 ) ( CLEAR ?auto_23483 ) ( IS-CRATE ?auto_23473 ) ( not ( = ?auto_23483 ?auto_23473 ) ) ( not ( = ?auto_23468 ?auto_23483 ) ) ( not ( = ?auto_23469 ?auto_23483 ) ) ( not ( = ?auto_23476 ?auto_23483 ) ) ( not ( = ?auto_23479 ?auto_23483 ) ) ( not ( = ?auto_23475 ?auto_23483 ) ) ( not ( = ?auto_23477 ?auto_23483 ) ) ( not ( = ?auto_23482 ?auto_23483 ) ) ( not ( = ?auto_23474 ?auto_23483 ) ) ( AVAILABLE ?auto_23484 ) ( IN ?auto_23473 ?auto_23481 ) )
    :subtasks
    ( ( !UNLOAD ?auto_23484 ?auto_23473 ?auto_23481 ?auto_23471 )
      ( MAKE-2CRATE ?auto_23476 ?auto_23468 ?auto_23469 )
      ( MAKE-1CRATE-VERIFY ?auto_23468 ?auto_23469 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23487 - SURFACE
      ?auto_23488 - SURFACE
      ?auto_23489 - SURFACE
    )
    :vars
    (
      ?auto_23500 - HOIST
      ?auto_23495 - PLACE
      ?auto_23492 - PLACE
      ?auto_23494 - HOIST
      ?auto_23501 - SURFACE
      ?auto_23502 - PLACE
      ?auto_23503 - HOIST
      ?auto_23496 - SURFACE
      ?auto_23499 - SURFACE
      ?auto_23491 - SURFACE
      ?auto_23498 - SURFACE
      ?auto_23493 - PLACE
      ?auto_23504 - HOIST
      ?auto_23497 - SURFACE
      ?auto_23505 - TRUCK
      ?auto_23490 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23500 ?auto_23495 ) ( IS-CRATE ?auto_23489 ) ( not ( = ?auto_23488 ?auto_23489 ) ) ( not ( = ?auto_23487 ?auto_23488 ) ) ( not ( = ?auto_23487 ?auto_23489 ) ) ( not ( = ?auto_23492 ?auto_23495 ) ) ( HOIST-AT ?auto_23494 ?auto_23492 ) ( not ( = ?auto_23500 ?auto_23494 ) ) ( SURFACE-AT ?auto_23489 ?auto_23492 ) ( ON ?auto_23489 ?auto_23501 ) ( CLEAR ?auto_23489 ) ( not ( = ?auto_23488 ?auto_23501 ) ) ( not ( = ?auto_23489 ?auto_23501 ) ) ( not ( = ?auto_23487 ?auto_23501 ) ) ( IS-CRATE ?auto_23488 ) ( not ( = ?auto_23502 ?auto_23495 ) ) ( not ( = ?auto_23492 ?auto_23502 ) ) ( HOIST-AT ?auto_23503 ?auto_23502 ) ( not ( = ?auto_23500 ?auto_23503 ) ) ( not ( = ?auto_23494 ?auto_23503 ) ) ( AVAILABLE ?auto_23503 ) ( SURFACE-AT ?auto_23488 ?auto_23502 ) ( ON ?auto_23488 ?auto_23496 ) ( CLEAR ?auto_23488 ) ( not ( = ?auto_23488 ?auto_23496 ) ) ( not ( = ?auto_23489 ?auto_23496 ) ) ( not ( = ?auto_23487 ?auto_23496 ) ) ( not ( = ?auto_23501 ?auto_23496 ) ) ( IS-CRATE ?auto_23487 ) ( not ( = ?auto_23499 ?auto_23487 ) ) ( not ( = ?auto_23488 ?auto_23499 ) ) ( not ( = ?auto_23489 ?auto_23499 ) ) ( not ( = ?auto_23501 ?auto_23499 ) ) ( not ( = ?auto_23496 ?auto_23499 ) ) ( AVAILABLE ?auto_23494 ) ( SURFACE-AT ?auto_23487 ?auto_23492 ) ( ON ?auto_23487 ?auto_23491 ) ( CLEAR ?auto_23487 ) ( not ( = ?auto_23488 ?auto_23491 ) ) ( not ( = ?auto_23489 ?auto_23491 ) ) ( not ( = ?auto_23487 ?auto_23491 ) ) ( not ( = ?auto_23501 ?auto_23491 ) ) ( not ( = ?auto_23496 ?auto_23491 ) ) ( not ( = ?auto_23499 ?auto_23491 ) ) ( IS-CRATE ?auto_23499 ) ( not ( = ?auto_23498 ?auto_23499 ) ) ( not ( = ?auto_23488 ?auto_23498 ) ) ( not ( = ?auto_23489 ?auto_23498 ) ) ( not ( = ?auto_23487 ?auto_23498 ) ) ( not ( = ?auto_23501 ?auto_23498 ) ) ( not ( = ?auto_23496 ?auto_23498 ) ) ( not ( = ?auto_23491 ?auto_23498 ) ) ( not ( = ?auto_23493 ?auto_23495 ) ) ( not ( = ?auto_23492 ?auto_23493 ) ) ( not ( = ?auto_23502 ?auto_23493 ) ) ( HOIST-AT ?auto_23504 ?auto_23493 ) ( not ( = ?auto_23500 ?auto_23504 ) ) ( not ( = ?auto_23494 ?auto_23504 ) ) ( not ( = ?auto_23503 ?auto_23504 ) ) ( AVAILABLE ?auto_23504 ) ( SURFACE-AT ?auto_23499 ?auto_23493 ) ( ON ?auto_23499 ?auto_23497 ) ( CLEAR ?auto_23499 ) ( not ( = ?auto_23488 ?auto_23497 ) ) ( not ( = ?auto_23489 ?auto_23497 ) ) ( not ( = ?auto_23487 ?auto_23497 ) ) ( not ( = ?auto_23501 ?auto_23497 ) ) ( not ( = ?auto_23496 ?auto_23497 ) ) ( not ( = ?auto_23499 ?auto_23497 ) ) ( not ( = ?auto_23491 ?auto_23497 ) ) ( not ( = ?auto_23498 ?auto_23497 ) ) ( TRUCK-AT ?auto_23505 ?auto_23495 ) ( SURFACE-AT ?auto_23490 ?auto_23495 ) ( CLEAR ?auto_23490 ) ( IS-CRATE ?auto_23498 ) ( not ( = ?auto_23490 ?auto_23498 ) ) ( not ( = ?auto_23488 ?auto_23490 ) ) ( not ( = ?auto_23489 ?auto_23490 ) ) ( not ( = ?auto_23487 ?auto_23490 ) ) ( not ( = ?auto_23501 ?auto_23490 ) ) ( not ( = ?auto_23496 ?auto_23490 ) ) ( not ( = ?auto_23499 ?auto_23490 ) ) ( not ( = ?auto_23491 ?auto_23490 ) ) ( not ( = ?auto_23497 ?auto_23490 ) ) ( AVAILABLE ?auto_23500 ) ( IN ?auto_23498 ?auto_23505 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23488 ?auto_23489 )
      ( MAKE-2CRATE-VERIFY ?auto_23487 ?auto_23488 ?auto_23489 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23506 - SURFACE
      ?auto_23507 - SURFACE
      ?auto_23508 - SURFACE
      ?auto_23509 - SURFACE
    )
    :vars
    (
      ?auto_23524 - HOIST
      ?auto_23514 - PLACE
      ?auto_23510 - PLACE
      ?auto_23516 - HOIST
      ?auto_23521 - SURFACE
      ?auto_23522 - PLACE
      ?auto_23515 - HOIST
      ?auto_23519 - SURFACE
      ?auto_23517 - SURFACE
      ?auto_23518 - SURFACE
      ?auto_23520 - PLACE
      ?auto_23512 - HOIST
      ?auto_23523 - SURFACE
      ?auto_23511 - TRUCK
      ?auto_23513 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23524 ?auto_23514 ) ( IS-CRATE ?auto_23509 ) ( not ( = ?auto_23508 ?auto_23509 ) ) ( not ( = ?auto_23507 ?auto_23508 ) ) ( not ( = ?auto_23507 ?auto_23509 ) ) ( not ( = ?auto_23510 ?auto_23514 ) ) ( HOIST-AT ?auto_23516 ?auto_23510 ) ( not ( = ?auto_23524 ?auto_23516 ) ) ( SURFACE-AT ?auto_23509 ?auto_23510 ) ( ON ?auto_23509 ?auto_23521 ) ( CLEAR ?auto_23509 ) ( not ( = ?auto_23508 ?auto_23521 ) ) ( not ( = ?auto_23509 ?auto_23521 ) ) ( not ( = ?auto_23507 ?auto_23521 ) ) ( IS-CRATE ?auto_23508 ) ( not ( = ?auto_23522 ?auto_23514 ) ) ( not ( = ?auto_23510 ?auto_23522 ) ) ( HOIST-AT ?auto_23515 ?auto_23522 ) ( not ( = ?auto_23524 ?auto_23515 ) ) ( not ( = ?auto_23516 ?auto_23515 ) ) ( AVAILABLE ?auto_23515 ) ( SURFACE-AT ?auto_23508 ?auto_23522 ) ( ON ?auto_23508 ?auto_23519 ) ( CLEAR ?auto_23508 ) ( not ( = ?auto_23508 ?auto_23519 ) ) ( not ( = ?auto_23509 ?auto_23519 ) ) ( not ( = ?auto_23507 ?auto_23519 ) ) ( not ( = ?auto_23521 ?auto_23519 ) ) ( IS-CRATE ?auto_23507 ) ( not ( = ?auto_23506 ?auto_23507 ) ) ( not ( = ?auto_23508 ?auto_23506 ) ) ( not ( = ?auto_23509 ?auto_23506 ) ) ( not ( = ?auto_23521 ?auto_23506 ) ) ( not ( = ?auto_23519 ?auto_23506 ) ) ( AVAILABLE ?auto_23516 ) ( SURFACE-AT ?auto_23507 ?auto_23510 ) ( ON ?auto_23507 ?auto_23517 ) ( CLEAR ?auto_23507 ) ( not ( = ?auto_23508 ?auto_23517 ) ) ( not ( = ?auto_23509 ?auto_23517 ) ) ( not ( = ?auto_23507 ?auto_23517 ) ) ( not ( = ?auto_23521 ?auto_23517 ) ) ( not ( = ?auto_23519 ?auto_23517 ) ) ( not ( = ?auto_23506 ?auto_23517 ) ) ( IS-CRATE ?auto_23506 ) ( not ( = ?auto_23518 ?auto_23506 ) ) ( not ( = ?auto_23508 ?auto_23518 ) ) ( not ( = ?auto_23509 ?auto_23518 ) ) ( not ( = ?auto_23507 ?auto_23518 ) ) ( not ( = ?auto_23521 ?auto_23518 ) ) ( not ( = ?auto_23519 ?auto_23518 ) ) ( not ( = ?auto_23517 ?auto_23518 ) ) ( not ( = ?auto_23520 ?auto_23514 ) ) ( not ( = ?auto_23510 ?auto_23520 ) ) ( not ( = ?auto_23522 ?auto_23520 ) ) ( HOIST-AT ?auto_23512 ?auto_23520 ) ( not ( = ?auto_23524 ?auto_23512 ) ) ( not ( = ?auto_23516 ?auto_23512 ) ) ( not ( = ?auto_23515 ?auto_23512 ) ) ( AVAILABLE ?auto_23512 ) ( SURFACE-AT ?auto_23506 ?auto_23520 ) ( ON ?auto_23506 ?auto_23523 ) ( CLEAR ?auto_23506 ) ( not ( = ?auto_23508 ?auto_23523 ) ) ( not ( = ?auto_23509 ?auto_23523 ) ) ( not ( = ?auto_23507 ?auto_23523 ) ) ( not ( = ?auto_23521 ?auto_23523 ) ) ( not ( = ?auto_23519 ?auto_23523 ) ) ( not ( = ?auto_23506 ?auto_23523 ) ) ( not ( = ?auto_23517 ?auto_23523 ) ) ( not ( = ?auto_23518 ?auto_23523 ) ) ( TRUCK-AT ?auto_23511 ?auto_23514 ) ( SURFACE-AT ?auto_23513 ?auto_23514 ) ( CLEAR ?auto_23513 ) ( IS-CRATE ?auto_23518 ) ( not ( = ?auto_23513 ?auto_23518 ) ) ( not ( = ?auto_23508 ?auto_23513 ) ) ( not ( = ?auto_23509 ?auto_23513 ) ) ( not ( = ?auto_23507 ?auto_23513 ) ) ( not ( = ?auto_23521 ?auto_23513 ) ) ( not ( = ?auto_23519 ?auto_23513 ) ) ( not ( = ?auto_23506 ?auto_23513 ) ) ( not ( = ?auto_23517 ?auto_23513 ) ) ( not ( = ?auto_23523 ?auto_23513 ) ) ( AVAILABLE ?auto_23524 ) ( IN ?auto_23518 ?auto_23511 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23507 ?auto_23508 ?auto_23509 )
      ( MAKE-3CRATE-VERIFY ?auto_23506 ?auto_23507 ?auto_23508 ?auto_23509 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23525 - SURFACE
      ?auto_23526 - SURFACE
      ?auto_23527 - SURFACE
      ?auto_23528 - SURFACE
      ?auto_23529 - SURFACE
    )
    :vars
    (
      ?auto_23543 - HOIST
      ?auto_23534 - PLACE
      ?auto_23530 - PLACE
      ?auto_23536 - HOIST
      ?auto_23540 - SURFACE
      ?auto_23541 - PLACE
      ?auto_23535 - HOIST
      ?auto_23538 - SURFACE
      ?auto_23537 - SURFACE
      ?auto_23539 - PLACE
      ?auto_23532 - HOIST
      ?auto_23542 - SURFACE
      ?auto_23531 - TRUCK
      ?auto_23533 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23543 ?auto_23534 ) ( IS-CRATE ?auto_23529 ) ( not ( = ?auto_23528 ?auto_23529 ) ) ( not ( = ?auto_23527 ?auto_23528 ) ) ( not ( = ?auto_23527 ?auto_23529 ) ) ( not ( = ?auto_23530 ?auto_23534 ) ) ( HOIST-AT ?auto_23536 ?auto_23530 ) ( not ( = ?auto_23543 ?auto_23536 ) ) ( SURFACE-AT ?auto_23529 ?auto_23530 ) ( ON ?auto_23529 ?auto_23540 ) ( CLEAR ?auto_23529 ) ( not ( = ?auto_23528 ?auto_23540 ) ) ( not ( = ?auto_23529 ?auto_23540 ) ) ( not ( = ?auto_23527 ?auto_23540 ) ) ( IS-CRATE ?auto_23528 ) ( not ( = ?auto_23541 ?auto_23534 ) ) ( not ( = ?auto_23530 ?auto_23541 ) ) ( HOIST-AT ?auto_23535 ?auto_23541 ) ( not ( = ?auto_23543 ?auto_23535 ) ) ( not ( = ?auto_23536 ?auto_23535 ) ) ( AVAILABLE ?auto_23535 ) ( SURFACE-AT ?auto_23528 ?auto_23541 ) ( ON ?auto_23528 ?auto_23538 ) ( CLEAR ?auto_23528 ) ( not ( = ?auto_23528 ?auto_23538 ) ) ( not ( = ?auto_23529 ?auto_23538 ) ) ( not ( = ?auto_23527 ?auto_23538 ) ) ( not ( = ?auto_23540 ?auto_23538 ) ) ( IS-CRATE ?auto_23527 ) ( not ( = ?auto_23526 ?auto_23527 ) ) ( not ( = ?auto_23528 ?auto_23526 ) ) ( not ( = ?auto_23529 ?auto_23526 ) ) ( not ( = ?auto_23540 ?auto_23526 ) ) ( not ( = ?auto_23538 ?auto_23526 ) ) ( AVAILABLE ?auto_23536 ) ( SURFACE-AT ?auto_23527 ?auto_23530 ) ( ON ?auto_23527 ?auto_23537 ) ( CLEAR ?auto_23527 ) ( not ( = ?auto_23528 ?auto_23537 ) ) ( not ( = ?auto_23529 ?auto_23537 ) ) ( not ( = ?auto_23527 ?auto_23537 ) ) ( not ( = ?auto_23540 ?auto_23537 ) ) ( not ( = ?auto_23538 ?auto_23537 ) ) ( not ( = ?auto_23526 ?auto_23537 ) ) ( IS-CRATE ?auto_23526 ) ( not ( = ?auto_23525 ?auto_23526 ) ) ( not ( = ?auto_23528 ?auto_23525 ) ) ( not ( = ?auto_23529 ?auto_23525 ) ) ( not ( = ?auto_23527 ?auto_23525 ) ) ( not ( = ?auto_23540 ?auto_23525 ) ) ( not ( = ?auto_23538 ?auto_23525 ) ) ( not ( = ?auto_23537 ?auto_23525 ) ) ( not ( = ?auto_23539 ?auto_23534 ) ) ( not ( = ?auto_23530 ?auto_23539 ) ) ( not ( = ?auto_23541 ?auto_23539 ) ) ( HOIST-AT ?auto_23532 ?auto_23539 ) ( not ( = ?auto_23543 ?auto_23532 ) ) ( not ( = ?auto_23536 ?auto_23532 ) ) ( not ( = ?auto_23535 ?auto_23532 ) ) ( AVAILABLE ?auto_23532 ) ( SURFACE-AT ?auto_23526 ?auto_23539 ) ( ON ?auto_23526 ?auto_23542 ) ( CLEAR ?auto_23526 ) ( not ( = ?auto_23528 ?auto_23542 ) ) ( not ( = ?auto_23529 ?auto_23542 ) ) ( not ( = ?auto_23527 ?auto_23542 ) ) ( not ( = ?auto_23540 ?auto_23542 ) ) ( not ( = ?auto_23538 ?auto_23542 ) ) ( not ( = ?auto_23526 ?auto_23542 ) ) ( not ( = ?auto_23537 ?auto_23542 ) ) ( not ( = ?auto_23525 ?auto_23542 ) ) ( TRUCK-AT ?auto_23531 ?auto_23534 ) ( SURFACE-AT ?auto_23533 ?auto_23534 ) ( CLEAR ?auto_23533 ) ( IS-CRATE ?auto_23525 ) ( not ( = ?auto_23533 ?auto_23525 ) ) ( not ( = ?auto_23528 ?auto_23533 ) ) ( not ( = ?auto_23529 ?auto_23533 ) ) ( not ( = ?auto_23527 ?auto_23533 ) ) ( not ( = ?auto_23540 ?auto_23533 ) ) ( not ( = ?auto_23538 ?auto_23533 ) ) ( not ( = ?auto_23526 ?auto_23533 ) ) ( not ( = ?auto_23537 ?auto_23533 ) ) ( not ( = ?auto_23542 ?auto_23533 ) ) ( AVAILABLE ?auto_23543 ) ( IN ?auto_23525 ?auto_23531 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23527 ?auto_23528 ?auto_23529 )
      ( MAKE-4CRATE-VERIFY ?auto_23525 ?auto_23526 ?auto_23527 ?auto_23528 ?auto_23529 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23544 - SURFACE
      ?auto_23545 - SURFACE
      ?auto_23546 - SURFACE
      ?auto_23547 - SURFACE
      ?auto_23548 - SURFACE
      ?auto_23549 - SURFACE
    )
    :vars
    (
      ?auto_23562 - HOIST
      ?auto_23553 - PLACE
      ?auto_23550 - PLACE
      ?auto_23555 - HOIST
      ?auto_23559 - SURFACE
      ?auto_23560 - PLACE
      ?auto_23554 - HOIST
      ?auto_23557 - SURFACE
      ?auto_23556 - SURFACE
      ?auto_23558 - PLACE
      ?auto_23552 - HOIST
      ?auto_23561 - SURFACE
      ?auto_23551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23562 ?auto_23553 ) ( IS-CRATE ?auto_23549 ) ( not ( = ?auto_23548 ?auto_23549 ) ) ( not ( = ?auto_23547 ?auto_23548 ) ) ( not ( = ?auto_23547 ?auto_23549 ) ) ( not ( = ?auto_23550 ?auto_23553 ) ) ( HOIST-AT ?auto_23555 ?auto_23550 ) ( not ( = ?auto_23562 ?auto_23555 ) ) ( SURFACE-AT ?auto_23549 ?auto_23550 ) ( ON ?auto_23549 ?auto_23559 ) ( CLEAR ?auto_23549 ) ( not ( = ?auto_23548 ?auto_23559 ) ) ( not ( = ?auto_23549 ?auto_23559 ) ) ( not ( = ?auto_23547 ?auto_23559 ) ) ( IS-CRATE ?auto_23548 ) ( not ( = ?auto_23560 ?auto_23553 ) ) ( not ( = ?auto_23550 ?auto_23560 ) ) ( HOIST-AT ?auto_23554 ?auto_23560 ) ( not ( = ?auto_23562 ?auto_23554 ) ) ( not ( = ?auto_23555 ?auto_23554 ) ) ( AVAILABLE ?auto_23554 ) ( SURFACE-AT ?auto_23548 ?auto_23560 ) ( ON ?auto_23548 ?auto_23557 ) ( CLEAR ?auto_23548 ) ( not ( = ?auto_23548 ?auto_23557 ) ) ( not ( = ?auto_23549 ?auto_23557 ) ) ( not ( = ?auto_23547 ?auto_23557 ) ) ( not ( = ?auto_23559 ?auto_23557 ) ) ( IS-CRATE ?auto_23547 ) ( not ( = ?auto_23546 ?auto_23547 ) ) ( not ( = ?auto_23548 ?auto_23546 ) ) ( not ( = ?auto_23549 ?auto_23546 ) ) ( not ( = ?auto_23559 ?auto_23546 ) ) ( not ( = ?auto_23557 ?auto_23546 ) ) ( AVAILABLE ?auto_23555 ) ( SURFACE-AT ?auto_23547 ?auto_23550 ) ( ON ?auto_23547 ?auto_23556 ) ( CLEAR ?auto_23547 ) ( not ( = ?auto_23548 ?auto_23556 ) ) ( not ( = ?auto_23549 ?auto_23556 ) ) ( not ( = ?auto_23547 ?auto_23556 ) ) ( not ( = ?auto_23559 ?auto_23556 ) ) ( not ( = ?auto_23557 ?auto_23556 ) ) ( not ( = ?auto_23546 ?auto_23556 ) ) ( IS-CRATE ?auto_23546 ) ( not ( = ?auto_23545 ?auto_23546 ) ) ( not ( = ?auto_23548 ?auto_23545 ) ) ( not ( = ?auto_23549 ?auto_23545 ) ) ( not ( = ?auto_23547 ?auto_23545 ) ) ( not ( = ?auto_23559 ?auto_23545 ) ) ( not ( = ?auto_23557 ?auto_23545 ) ) ( not ( = ?auto_23556 ?auto_23545 ) ) ( not ( = ?auto_23558 ?auto_23553 ) ) ( not ( = ?auto_23550 ?auto_23558 ) ) ( not ( = ?auto_23560 ?auto_23558 ) ) ( HOIST-AT ?auto_23552 ?auto_23558 ) ( not ( = ?auto_23562 ?auto_23552 ) ) ( not ( = ?auto_23555 ?auto_23552 ) ) ( not ( = ?auto_23554 ?auto_23552 ) ) ( AVAILABLE ?auto_23552 ) ( SURFACE-AT ?auto_23546 ?auto_23558 ) ( ON ?auto_23546 ?auto_23561 ) ( CLEAR ?auto_23546 ) ( not ( = ?auto_23548 ?auto_23561 ) ) ( not ( = ?auto_23549 ?auto_23561 ) ) ( not ( = ?auto_23547 ?auto_23561 ) ) ( not ( = ?auto_23559 ?auto_23561 ) ) ( not ( = ?auto_23557 ?auto_23561 ) ) ( not ( = ?auto_23546 ?auto_23561 ) ) ( not ( = ?auto_23556 ?auto_23561 ) ) ( not ( = ?auto_23545 ?auto_23561 ) ) ( TRUCK-AT ?auto_23551 ?auto_23553 ) ( SURFACE-AT ?auto_23544 ?auto_23553 ) ( CLEAR ?auto_23544 ) ( IS-CRATE ?auto_23545 ) ( not ( = ?auto_23544 ?auto_23545 ) ) ( not ( = ?auto_23548 ?auto_23544 ) ) ( not ( = ?auto_23549 ?auto_23544 ) ) ( not ( = ?auto_23547 ?auto_23544 ) ) ( not ( = ?auto_23559 ?auto_23544 ) ) ( not ( = ?auto_23557 ?auto_23544 ) ) ( not ( = ?auto_23546 ?auto_23544 ) ) ( not ( = ?auto_23556 ?auto_23544 ) ) ( not ( = ?auto_23561 ?auto_23544 ) ) ( AVAILABLE ?auto_23562 ) ( IN ?auto_23545 ?auto_23551 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23547 ?auto_23548 ?auto_23549 )
      ( MAKE-5CRATE-VERIFY ?auto_23544 ?auto_23545 ?auto_23546 ?auto_23547 ?auto_23548 ?auto_23549 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23563 - SURFACE
      ?auto_23564 - SURFACE
    )
    :vars
    (
      ?auto_23581 - HOIST
      ?auto_23569 - PLACE
      ?auto_23579 - SURFACE
      ?auto_23565 - PLACE
      ?auto_23571 - HOIST
      ?auto_23576 - SURFACE
      ?auto_23577 - PLACE
      ?auto_23570 - HOIST
      ?auto_23574 - SURFACE
      ?auto_23580 - SURFACE
      ?auto_23572 - SURFACE
      ?auto_23573 - SURFACE
      ?auto_23575 - PLACE
      ?auto_23567 - HOIST
      ?auto_23578 - SURFACE
      ?auto_23568 - SURFACE
      ?auto_23566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23581 ?auto_23569 ) ( IS-CRATE ?auto_23564 ) ( not ( = ?auto_23563 ?auto_23564 ) ) ( not ( = ?auto_23579 ?auto_23563 ) ) ( not ( = ?auto_23579 ?auto_23564 ) ) ( not ( = ?auto_23565 ?auto_23569 ) ) ( HOIST-AT ?auto_23571 ?auto_23565 ) ( not ( = ?auto_23581 ?auto_23571 ) ) ( SURFACE-AT ?auto_23564 ?auto_23565 ) ( ON ?auto_23564 ?auto_23576 ) ( CLEAR ?auto_23564 ) ( not ( = ?auto_23563 ?auto_23576 ) ) ( not ( = ?auto_23564 ?auto_23576 ) ) ( not ( = ?auto_23579 ?auto_23576 ) ) ( IS-CRATE ?auto_23563 ) ( not ( = ?auto_23577 ?auto_23569 ) ) ( not ( = ?auto_23565 ?auto_23577 ) ) ( HOIST-AT ?auto_23570 ?auto_23577 ) ( not ( = ?auto_23581 ?auto_23570 ) ) ( not ( = ?auto_23571 ?auto_23570 ) ) ( AVAILABLE ?auto_23570 ) ( SURFACE-AT ?auto_23563 ?auto_23577 ) ( ON ?auto_23563 ?auto_23574 ) ( CLEAR ?auto_23563 ) ( not ( = ?auto_23563 ?auto_23574 ) ) ( not ( = ?auto_23564 ?auto_23574 ) ) ( not ( = ?auto_23579 ?auto_23574 ) ) ( not ( = ?auto_23576 ?auto_23574 ) ) ( IS-CRATE ?auto_23579 ) ( not ( = ?auto_23580 ?auto_23579 ) ) ( not ( = ?auto_23563 ?auto_23580 ) ) ( not ( = ?auto_23564 ?auto_23580 ) ) ( not ( = ?auto_23576 ?auto_23580 ) ) ( not ( = ?auto_23574 ?auto_23580 ) ) ( AVAILABLE ?auto_23571 ) ( SURFACE-AT ?auto_23579 ?auto_23565 ) ( ON ?auto_23579 ?auto_23572 ) ( CLEAR ?auto_23579 ) ( not ( = ?auto_23563 ?auto_23572 ) ) ( not ( = ?auto_23564 ?auto_23572 ) ) ( not ( = ?auto_23579 ?auto_23572 ) ) ( not ( = ?auto_23576 ?auto_23572 ) ) ( not ( = ?auto_23574 ?auto_23572 ) ) ( not ( = ?auto_23580 ?auto_23572 ) ) ( IS-CRATE ?auto_23580 ) ( not ( = ?auto_23573 ?auto_23580 ) ) ( not ( = ?auto_23563 ?auto_23573 ) ) ( not ( = ?auto_23564 ?auto_23573 ) ) ( not ( = ?auto_23579 ?auto_23573 ) ) ( not ( = ?auto_23576 ?auto_23573 ) ) ( not ( = ?auto_23574 ?auto_23573 ) ) ( not ( = ?auto_23572 ?auto_23573 ) ) ( not ( = ?auto_23575 ?auto_23569 ) ) ( not ( = ?auto_23565 ?auto_23575 ) ) ( not ( = ?auto_23577 ?auto_23575 ) ) ( HOIST-AT ?auto_23567 ?auto_23575 ) ( not ( = ?auto_23581 ?auto_23567 ) ) ( not ( = ?auto_23571 ?auto_23567 ) ) ( not ( = ?auto_23570 ?auto_23567 ) ) ( AVAILABLE ?auto_23567 ) ( SURFACE-AT ?auto_23580 ?auto_23575 ) ( ON ?auto_23580 ?auto_23578 ) ( CLEAR ?auto_23580 ) ( not ( = ?auto_23563 ?auto_23578 ) ) ( not ( = ?auto_23564 ?auto_23578 ) ) ( not ( = ?auto_23579 ?auto_23578 ) ) ( not ( = ?auto_23576 ?auto_23578 ) ) ( not ( = ?auto_23574 ?auto_23578 ) ) ( not ( = ?auto_23580 ?auto_23578 ) ) ( not ( = ?auto_23572 ?auto_23578 ) ) ( not ( = ?auto_23573 ?auto_23578 ) ) ( SURFACE-AT ?auto_23568 ?auto_23569 ) ( CLEAR ?auto_23568 ) ( IS-CRATE ?auto_23573 ) ( not ( = ?auto_23568 ?auto_23573 ) ) ( not ( = ?auto_23563 ?auto_23568 ) ) ( not ( = ?auto_23564 ?auto_23568 ) ) ( not ( = ?auto_23579 ?auto_23568 ) ) ( not ( = ?auto_23576 ?auto_23568 ) ) ( not ( = ?auto_23574 ?auto_23568 ) ) ( not ( = ?auto_23580 ?auto_23568 ) ) ( not ( = ?auto_23572 ?auto_23568 ) ) ( not ( = ?auto_23578 ?auto_23568 ) ) ( AVAILABLE ?auto_23581 ) ( IN ?auto_23573 ?auto_23566 ) ( TRUCK-AT ?auto_23566 ?auto_23565 ) )
    :subtasks
    ( ( !DRIVE ?auto_23566 ?auto_23565 ?auto_23569 )
      ( MAKE-2CRATE ?auto_23579 ?auto_23563 ?auto_23564 )
      ( MAKE-1CRATE-VERIFY ?auto_23563 ?auto_23564 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23582 - SURFACE
      ?auto_23583 - SURFACE
      ?auto_23584 - SURFACE
    )
    :vars
    (
      ?auto_23588 - HOIST
      ?auto_23597 - PLACE
      ?auto_23594 - PLACE
      ?auto_23587 - HOIST
      ?auto_23600 - SURFACE
      ?auto_23592 - PLACE
      ?auto_23593 - HOIST
      ?auto_23596 - SURFACE
      ?auto_23586 - SURFACE
      ?auto_23599 - SURFACE
      ?auto_23589 - SURFACE
      ?auto_23585 - PLACE
      ?auto_23591 - HOIST
      ?auto_23598 - SURFACE
      ?auto_23595 - SURFACE
      ?auto_23590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23588 ?auto_23597 ) ( IS-CRATE ?auto_23584 ) ( not ( = ?auto_23583 ?auto_23584 ) ) ( not ( = ?auto_23582 ?auto_23583 ) ) ( not ( = ?auto_23582 ?auto_23584 ) ) ( not ( = ?auto_23594 ?auto_23597 ) ) ( HOIST-AT ?auto_23587 ?auto_23594 ) ( not ( = ?auto_23588 ?auto_23587 ) ) ( SURFACE-AT ?auto_23584 ?auto_23594 ) ( ON ?auto_23584 ?auto_23600 ) ( CLEAR ?auto_23584 ) ( not ( = ?auto_23583 ?auto_23600 ) ) ( not ( = ?auto_23584 ?auto_23600 ) ) ( not ( = ?auto_23582 ?auto_23600 ) ) ( IS-CRATE ?auto_23583 ) ( not ( = ?auto_23592 ?auto_23597 ) ) ( not ( = ?auto_23594 ?auto_23592 ) ) ( HOIST-AT ?auto_23593 ?auto_23592 ) ( not ( = ?auto_23588 ?auto_23593 ) ) ( not ( = ?auto_23587 ?auto_23593 ) ) ( AVAILABLE ?auto_23593 ) ( SURFACE-AT ?auto_23583 ?auto_23592 ) ( ON ?auto_23583 ?auto_23596 ) ( CLEAR ?auto_23583 ) ( not ( = ?auto_23583 ?auto_23596 ) ) ( not ( = ?auto_23584 ?auto_23596 ) ) ( not ( = ?auto_23582 ?auto_23596 ) ) ( not ( = ?auto_23600 ?auto_23596 ) ) ( IS-CRATE ?auto_23582 ) ( not ( = ?auto_23586 ?auto_23582 ) ) ( not ( = ?auto_23583 ?auto_23586 ) ) ( not ( = ?auto_23584 ?auto_23586 ) ) ( not ( = ?auto_23600 ?auto_23586 ) ) ( not ( = ?auto_23596 ?auto_23586 ) ) ( AVAILABLE ?auto_23587 ) ( SURFACE-AT ?auto_23582 ?auto_23594 ) ( ON ?auto_23582 ?auto_23599 ) ( CLEAR ?auto_23582 ) ( not ( = ?auto_23583 ?auto_23599 ) ) ( not ( = ?auto_23584 ?auto_23599 ) ) ( not ( = ?auto_23582 ?auto_23599 ) ) ( not ( = ?auto_23600 ?auto_23599 ) ) ( not ( = ?auto_23596 ?auto_23599 ) ) ( not ( = ?auto_23586 ?auto_23599 ) ) ( IS-CRATE ?auto_23586 ) ( not ( = ?auto_23589 ?auto_23586 ) ) ( not ( = ?auto_23583 ?auto_23589 ) ) ( not ( = ?auto_23584 ?auto_23589 ) ) ( not ( = ?auto_23582 ?auto_23589 ) ) ( not ( = ?auto_23600 ?auto_23589 ) ) ( not ( = ?auto_23596 ?auto_23589 ) ) ( not ( = ?auto_23599 ?auto_23589 ) ) ( not ( = ?auto_23585 ?auto_23597 ) ) ( not ( = ?auto_23594 ?auto_23585 ) ) ( not ( = ?auto_23592 ?auto_23585 ) ) ( HOIST-AT ?auto_23591 ?auto_23585 ) ( not ( = ?auto_23588 ?auto_23591 ) ) ( not ( = ?auto_23587 ?auto_23591 ) ) ( not ( = ?auto_23593 ?auto_23591 ) ) ( AVAILABLE ?auto_23591 ) ( SURFACE-AT ?auto_23586 ?auto_23585 ) ( ON ?auto_23586 ?auto_23598 ) ( CLEAR ?auto_23586 ) ( not ( = ?auto_23583 ?auto_23598 ) ) ( not ( = ?auto_23584 ?auto_23598 ) ) ( not ( = ?auto_23582 ?auto_23598 ) ) ( not ( = ?auto_23600 ?auto_23598 ) ) ( not ( = ?auto_23596 ?auto_23598 ) ) ( not ( = ?auto_23586 ?auto_23598 ) ) ( not ( = ?auto_23599 ?auto_23598 ) ) ( not ( = ?auto_23589 ?auto_23598 ) ) ( SURFACE-AT ?auto_23595 ?auto_23597 ) ( CLEAR ?auto_23595 ) ( IS-CRATE ?auto_23589 ) ( not ( = ?auto_23595 ?auto_23589 ) ) ( not ( = ?auto_23583 ?auto_23595 ) ) ( not ( = ?auto_23584 ?auto_23595 ) ) ( not ( = ?auto_23582 ?auto_23595 ) ) ( not ( = ?auto_23600 ?auto_23595 ) ) ( not ( = ?auto_23596 ?auto_23595 ) ) ( not ( = ?auto_23586 ?auto_23595 ) ) ( not ( = ?auto_23599 ?auto_23595 ) ) ( not ( = ?auto_23598 ?auto_23595 ) ) ( AVAILABLE ?auto_23588 ) ( IN ?auto_23589 ?auto_23590 ) ( TRUCK-AT ?auto_23590 ?auto_23594 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23583 ?auto_23584 )
      ( MAKE-2CRATE-VERIFY ?auto_23582 ?auto_23583 ?auto_23584 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23601 - SURFACE
      ?auto_23602 - SURFACE
      ?auto_23603 - SURFACE
      ?auto_23604 - SURFACE
    )
    :vars
    (
      ?auto_23615 - HOIST
      ?auto_23607 - PLACE
      ?auto_23610 - PLACE
      ?auto_23612 - HOIST
      ?auto_23613 - SURFACE
      ?auto_23617 - PLACE
      ?auto_23619 - HOIST
      ?auto_23614 - SURFACE
      ?auto_23608 - SURFACE
      ?auto_23618 - SURFACE
      ?auto_23616 - PLACE
      ?auto_23609 - HOIST
      ?auto_23605 - SURFACE
      ?auto_23611 - SURFACE
      ?auto_23606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23615 ?auto_23607 ) ( IS-CRATE ?auto_23604 ) ( not ( = ?auto_23603 ?auto_23604 ) ) ( not ( = ?auto_23602 ?auto_23603 ) ) ( not ( = ?auto_23602 ?auto_23604 ) ) ( not ( = ?auto_23610 ?auto_23607 ) ) ( HOIST-AT ?auto_23612 ?auto_23610 ) ( not ( = ?auto_23615 ?auto_23612 ) ) ( SURFACE-AT ?auto_23604 ?auto_23610 ) ( ON ?auto_23604 ?auto_23613 ) ( CLEAR ?auto_23604 ) ( not ( = ?auto_23603 ?auto_23613 ) ) ( not ( = ?auto_23604 ?auto_23613 ) ) ( not ( = ?auto_23602 ?auto_23613 ) ) ( IS-CRATE ?auto_23603 ) ( not ( = ?auto_23617 ?auto_23607 ) ) ( not ( = ?auto_23610 ?auto_23617 ) ) ( HOIST-AT ?auto_23619 ?auto_23617 ) ( not ( = ?auto_23615 ?auto_23619 ) ) ( not ( = ?auto_23612 ?auto_23619 ) ) ( AVAILABLE ?auto_23619 ) ( SURFACE-AT ?auto_23603 ?auto_23617 ) ( ON ?auto_23603 ?auto_23614 ) ( CLEAR ?auto_23603 ) ( not ( = ?auto_23603 ?auto_23614 ) ) ( not ( = ?auto_23604 ?auto_23614 ) ) ( not ( = ?auto_23602 ?auto_23614 ) ) ( not ( = ?auto_23613 ?auto_23614 ) ) ( IS-CRATE ?auto_23602 ) ( not ( = ?auto_23601 ?auto_23602 ) ) ( not ( = ?auto_23603 ?auto_23601 ) ) ( not ( = ?auto_23604 ?auto_23601 ) ) ( not ( = ?auto_23613 ?auto_23601 ) ) ( not ( = ?auto_23614 ?auto_23601 ) ) ( AVAILABLE ?auto_23612 ) ( SURFACE-AT ?auto_23602 ?auto_23610 ) ( ON ?auto_23602 ?auto_23608 ) ( CLEAR ?auto_23602 ) ( not ( = ?auto_23603 ?auto_23608 ) ) ( not ( = ?auto_23604 ?auto_23608 ) ) ( not ( = ?auto_23602 ?auto_23608 ) ) ( not ( = ?auto_23613 ?auto_23608 ) ) ( not ( = ?auto_23614 ?auto_23608 ) ) ( not ( = ?auto_23601 ?auto_23608 ) ) ( IS-CRATE ?auto_23601 ) ( not ( = ?auto_23618 ?auto_23601 ) ) ( not ( = ?auto_23603 ?auto_23618 ) ) ( not ( = ?auto_23604 ?auto_23618 ) ) ( not ( = ?auto_23602 ?auto_23618 ) ) ( not ( = ?auto_23613 ?auto_23618 ) ) ( not ( = ?auto_23614 ?auto_23618 ) ) ( not ( = ?auto_23608 ?auto_23618 ) ) ( not ( = ?auto_23616 ?auto_23607 ) ) ( not ( = ?auto_23610 ?auto_23616 ) ) ( not ( = ?auto_23617 ?auto_23616 ) ) ( HOIST-AT ?auto_23609 ?auto_23616 ) ( not ( = ?auto_23615 ?auto_23609 ) ) ( not ( = ?auto_23612 ?auto_23609 ) ) ( not ( = ?auto_23619 ?auto_23609 ) ) ( AVAILABLE ?auto_23609 ) ( SURFACE-AT ?auto_23601 ?auto_23616 ) ( ON ?auto_23601 ?auto_23605 ) ( CLEAR ?auto_23601 ) ( not ( = ?auto_23603 ?auto_23605 ) ) ( not ( = ?auto_23604 ?auto_23605 ) ) ( not ( = ?auto_23602 ?auto_23605 ) ) ( not ( = ?auto_23613 ?auto_23605 ) ) ( not ( = ?auto_23614 ?auto_23605 ) ) ( not ( = ?auto_23601 ?auto_23605 ) ) ( not ( = ?auto_23608 ?auto_23605 ) ) ( not ( = ?auto_23618 ?auto_23605 ) ) ( SURFACE-AT ?auto_23611 ?auto_23607 ) ( CLEAR ?auto_23611 ) ( IS-CRATE ?auto_23618 ) ( not ( = ?auto_23611 ?auto_23618 ) ) ( not ( = ?auto_23603 ?auto_23611 ) ) ( not ( = ?auto_23604 ?auto_23611 ) ) ( not ( = ?auto_23602 ?auto_23611 ) ) ( not ( = ?auto_23613 ?auto_23611 ) ) ( not ( = ?auto_23614 ?auto_23611 ) ) ( not ( = ?auto_23601 ?auto_23611 ) ) ( not ( = ?auto_23608 ?auto_23611 ) ) ( not ( = ?auto_23605 ?auto_23611 ) ) ( AVAILABLE ?auto_23615 ) ( IN ?auto_23618 ?auto_23606 ) ( TRUCK-AT ?auto_23606 ?auto_23610 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23602 ?auto_23603 ?auto_23604 )
      ( MAKE-3CRATE-VERIFY ?auto_23601 ?auto_23602 ?auto_23603 ?auto_23604 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23620 - SURFACE
      ?auto_23621 - SURFACE
      ?auto_23622 - SURFACE
      ?auto_23623 - SURFACE
      ?auto_23624 - SURFACE
    )
    :vars
    (
      ?auto_23635 - HOIST
      ?auto_23627 - PLACE
      ?auto_23630 - PLACE
      ?auto_23632 - HOIST
      ?auto_23633 - SURFACE
      ?auto_23637 - PLACE
      ?auto_23638 - HOIST
      ?auto_23634 - SURFACE
      ?auto_23628 - SURFACE
      ?auto_23636 - PLACE
      ?auto_23629 - HOIST
      ?auto_23625 - SURFACE
      ?auto_23631 - SURFACE
      ?auto_23626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23635 ?auto_23627 ) ( IS-CRATE ?auto_23624 ) ( not ( = ?auto_23623 ?auto_23624 ) ) ( not ( = ?auto_23622 ?auto_23623 ) ) ( not ( = ?auto_23622 ?auto_23624 ) ) ( not ( = ?auto_23630 ?auto_23627 ) ) ( HOIST-AT ?auto_23632 ?auto_23630 ) ( not ( = ?auto_23635 ?auto_23632 ) ) ( SURFACE-AT ?auto_23624 ?auto_23630 ) ( ON ?auto_23624 ?auto_23633 ) ( CLEAR ?auto_23624 ) ( not ( = ?auto_23623 ?auto_23633 ) ) ( not ( = ?auto_23624 ?auto_23633 ) ) ( not ( = ?auto_23622 ?auto_23633 ) ) ( IS-CRATE ?auto_23623 ) ( not ( = ?auto_23637 ?auto_23627 ) ) ( not ( = ?auto_23630 ?auto_23637 ) ) ( HOIST-AT ?auto_23638 ?auto_23637 ) ( not ( = ?auto_23635 ?auto_23638 ) ) ( not ( = ?auto_23632 ?auto_23638 ) ) ( AVAILABLE ?auto_23638 ) ( SURFACE-AT ?auto_23623 ?auto_23637 ) ( ON ?auto_23623 ?auto_23634 ) ( CLEAR ?auto_23623 ) ( not ( = ?auto_23623 ?auto_23634 ) ) ( not ( = ?auto_23624 ?auto_23634 ) ) ( not ( = ?auto_23622 ?auto_23634 ) ) ( not ( = ?auto_23633 ?auto_23634 ) ) ( IS-CRATE ?auto_23622 ) ( not ( = ?auto_23621 ?auto_23622 ) ) ( not ( = ?auto_23623 ?auto_23621 ) ) ( not ( = ?auto_23624 ?auto_23621 ) ) ( not ( = ?auto_23633 ?auto_23621 ) ) ( not ( = ?auto_23634 ?auto_23621 ) ) ( AVAILABLE ?auto_23632 ) ( SURFACE-AT ?auto_23622 ?auto_23630 ) ( ON ?auto_23622 ?auto_23628 ) ( CLEAR ?auto_23622 ) ( not ( = ?auto_23623 ?auto_23628 ) ) ( not ( = ?auto_23624 ?auto_23628 ) ) ( not ( = ?auto_23622 ?auto_23628 ) ) ( not ( = ?auto_23633 ?auto_23628 ) ) ( not ( = ?auto_23634 ?auto_23628 ) ) ( not ( = ?auto_23621 ?auto_23628 ) ) ( IS-CRATE ?auto_23621 ) ( not ( = ?auto_23620 ?auto_23621 ) ) ( not ( = ?auto_23623 ?auto_23620 ) ) ( not ( = ?auto_23624 ?auto_23620 ) ) ( not ( = ?auto_23622 ?auto_23620 ) ) ( not ( = ?auto_23633 ?auto_23620 ) ) ( not ( = ?auto_23634 ?auto_23620 ) ) ( not ( = ?auto_23628 ?auto_23620 ) ) ( not ( = ?auto_23636 ?auto_23627 ) ) ( not ( = ?auto_23630 ?auto_23636 ) ) ( not ( = ?auto_23637 ?auto_23636 ) ) ( HOIST-AT ?auto_23629 ?auto_23636 ) ( not ( = ?auto_23635 ?auto_23629 ) ) ( not ( = ?auto_23632 ?auto_23629 ) ) ( not ( = ?auto_23638 ?auto_23629 ) ) ( AVAILABLE ?auto_23629 ) ( SURFACE-AT ?auto_23621 ?auto_23636 ) ( ON ?auto_23621 ?auto_23625 ) ( CLEAR ?auto_23621 ) ( not ( = ?auto_23623 ?auto_23625 ) ) ( not ( = ?auto_23624 ?auto_23625 ) ) ( not ( = ?auto_23622 ?auto_23625 ) ) ( not ( = ?auto_23633 ?auto_23625 ) ) ( not ( = ?auto_23634 ?auto_23625 ) ) ( not ( = ?auto_23621 ?auto_23625 ) ) ( not ( = ?auto_23628 ?auto_23625 ) ) ( not ( = ?auto_23620 ?auto_23625 ) ) ( SURFACE-AT ?auto_23631 ?auto_23627 ) ( CLEAR ?auto_23631 ) ( IS-CRATE ?auto_23620 ) ( not ( = ?auto_23631 ?auto_23620 ) ) ( not ( = ?auto_23623 ?auto_23631 ) ) ( not ( = ?auto_23624 ?auto_23631 ) ) ( not ( = ?auto_23622 ?auto_23631 ) ) ( not ( = ?auto_23633 ?auto_23631 ) ) ( not ( = ?auto_23634 ?auto_23631 ) ) ( not ( = ?auto_23621 ?auto_23631 ) ) ( not ( = ?auto_23628 ?auto_23631 ) ) ( not ( = ?auto_23625 ?auto_23631 ) ) ( AVAILABLE ?auto_23635 ) ( IN ?auto_23620 ?auto_23626 ) ( TRUCK-AT ?auto_23626 ?auto_23630 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23622 ?auto_23623 ?auto_23624 )
      ( MAKE-4CRATE-VERIFY ?auto_23620 ?auto_23621 ?auto_23622 ?auto_23623 ?auto_23624 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23639 - SURFACE
      ?auto_23640 - SURFACE
      ?auto_23641 - SURFACE
      ?auto_23642 - SURFACE
      ?auto_23643 - SURFACE
      ?auto_23644 - SURFACE
    )
    :vars
    (
      ?auto_23654 - HOIST
      ?auto_23647 - PLACE
      ?auto_23650 - PLACE
      ?auto_23651 - HOIST
      ?auto_23652 - SURFACE
      ?auto_23656 - PLACE
      ?auto_23657 - HOIST
      ?auto_23653 - SURFACE
      ?auto_23648 - SURFACE
      ?auto_23655 - PLACE
      ?auto_23649 - HOIST
      ?auto_23645 - SURFACE
      ?auto_23646 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23654 ?auto_23647 ) ( IS-CRATE ?auto_23644 ) ( not ( = ?auto_23643 ?auto_23644 ) ) ( not ( = ?auto_23642 ?auto_23643 ) ) ( not ( = ?auto_23642 ?auto_23644 ) ) ( not ( = ?auto_23650 ?auto_23647 ) ) ( HOIST-AT ?auto_23651 ?auto_23650 ) ( not ( = ?auto_23654 ?auto_23651 ) ) ( SURFACE-AT ?auto_23644 ?auto_23650 ) ( ON ?auto_23644 ?auto_23652 ) ( CLEAR ?auto_23644 ) ( not ( = ?auto_23643 ?auto_23652 ) ) ( not ( = ?auto_23644 ?auto_23652 ) ) ( not ( = ?auto_23642 ?auto_23652 ) ) ( IS-CRATE ?auto_23643 ) ( not ( = ?auto_23656 ?auto_23647 ) ) ( not ( = ?auto_23650 ?auto_23656 ) ) ( HOIST-AT ?auto_23657 ?auto_23656 ) ( not ( = ?auto_23654 ?auto_23657 ) ) ( not ( = ?auto_23651 ?auto_23657 ) ) ( AVAILABLE ?auto_23657 ) ( SURFACE-AT ?auto_23643 ?auto_23656 ) ( ON ?auto_23643 ?auto_23653 ) ( CLEAR ?auto_23643 ) ( not ( = ?auto_23643 ?auto_23653 ) ) ( not ( = ?auto_23644 ?auto_23653 ) ) ( not ( = ?auto_23642 ?auto_23653 ) ) ( not ( = ?auto_23652 ?auto_23653 ) ) ( IS-CRATE ?auto_23642 ) ( not ( = ?auto_23641 ?auto_23642 ) ) ( not ( = ?auto_23643 ?auto_23641 ) ) ( not ( = ?auto_23644 ?auto_23641 ) ) ( not ( = ?auto_23652 ?auto_23641 ) ) ( not ( = ?auto_23653 ?auto_23641 ) ) ( AVAILABLE ?auto_23651 ) ( SURFACE-AT ?auto_23642 ?auto_23650 ) ( ON ?auto_23642 ?auto_23648 ) ( CLEAR ?auto_23642 ) ( not ( = ?auto_23643 ?auto_23648 ) ) ( not ( = ?auto_23644 ?auto_23648 ) ) ( not ( = ?auto_23642 ?auto_23648 ) ) ( not ( = ?auto_23652 ?auto_23648 ) ) ( not ( = ?auto_23653 ?auto_23648 ) ) ( not ( = ?auto_23641 ?auto_23648 ) ) ( IS-CRATE ?auto_23641 ) ( not ( = ?auto_23640 ?auto_23641 ) ) ( not ( = ?auto_23643 ?auto_23640 ) ) ( not ( = ?auto_23644 ?auto_23640 ) ) ( not ( = ?auto_23642 ?auto_23640 ) ) ( not ( = ?auto_23652 ?auto_23640 ) ) ( not ( = ?auto_23653 ?auto_23640 ) ) ( not ( = ?auto_23648 ?auto_23640 ) ) ( not ( = ?auto_23655 ?auto_23647 ) ) ( not ( = ?auto_23650 ?auto_23655 ) ) ( not ( = ?auto_23656 ?auto_23655 ) ) ( HOIST-AT ?auto_23649 ?auto_23655 ) ( not ( = ?auto_23654 ?auto_23649 ) ) ( not ( = ?auto_23651 ?auto_23649 ) ) ( not ( = ?auto_23657 ?auto_23649 ) ) ( AVAILABLE ?auto_23649 ) ( SURFACE-AT ?auto_23641 ?auto_23655 ) ( ON ?auto_23641 ?auto_23645 ) ( CLEAR ?auto_23641 ) ( not ( = ?auto_23643 ?auto_23645 ) ) ( not ( = ?auto_23644 ?auto_23645 ) ) ( not ( = ?auto_23642 ?auto_23645 ) ) ( not ( = ?auto_23652 ?auto_23645 ) ) ( not ( = ?auto_23653 ?auto_23645 ) ) ( not ( = ?auto_23641 ?auto_23645 ) ) ( not ( = ?auto_23648 ?auto_23645 ) ) ( not ( = ?auto_23640 ?auto_23645 ) ) ( SURFACE-AT ?auto_23639 ?auto_23647 ) ( CLEAR ?auto_23639 ) ( IS-CRATE ?auto_23640 ) ( not ( = ?auto_23639 ?auto_23640 ) ) ( not ( = ?auto_23643 ?auto_23639 ) ) ( not ( = ?auto_23644 ?auto_23639 ) ) ( not ( = ?auto_23642 ?auto_23639 ) ) ( not ( = ?auto_23652 ?auto_23639 ) ) ( not ( = ?auto_23653 ?auto_23639 ) ) ( not ( = ?auto_23641 ?auto_23639 ) ) ( not ( = ?auto_23648 ?auto_23639 ) ) ( not ( = ?auto_23645 ?auto_23639 ) ) ( AVAILABLE ?auto_23654 ) ( IN ?auto_23640 ?auto_23646 ) ( TRUCK-AT ?auto_23646 ?auto_23650 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23642 ?auto_23643 ?auto_23644 )
      ( MAKE-5CRATE-VERIFY ?auto_23639 ?auto_23640 ?auto_23641 ?auto_23642 ?auto_23643 ?auto_23644 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23658 - SURFACE
      ?auto_23659 - SURFACE
    )
    :vars
    (
      ?auto_23671 - HOIST
      ?auto_23662 - PLACE
      ?auto_23673 - SURFACE
      ?auto_23665 - PLACE
      ?auto_23667 - HOIST
      ?auto_23668 - SURFACE
      ?auto_23674 - PLACE
      ?auto_23676 - HOIST
      ?auto_23669 - SURFACE
      ?auto_23670 - SURFACE
      ?auto_23663 - SURFACE
      ?auto_23675 - SURFACE
      ?auto_23672 - PLACE
      ?auto_23664 - HOIST
      ?auto_23660 - SURFACE
      ?auto_23666 - SURFACE
      ?auto_23661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23671 ?auto_23662 ) ( IS-CRATE ?auto_23659 ) ( not ( = ?auto_23658 ?auto_23659 ) ) ( not ( = ?auto_23673 ?auto_23658 ) ) ( not ( = ?auto_23673 ?auto_23659 ) ) ( not ( = ?auto_23665 ?auto_23662 ) ) ( HOIST-AT ?auto_23667 ?auto_23665 ) ( not ( = ?auto_23671 ?auto_23667 ) ) ( SURFACE-AT ?auto_23659 ?auto_23665 ) ( ON ?auto_23659 ?auto_23668 ) ( CLEAR ?auto_23659 ) ( not ( = ?auto_23658 ?auto_23668 ) ) ( not ( = ?auto_23659 ?auto_23668 ) ) ( not ( = ?auto_23673 ?auto_23668 ) ) ( IS-CRATE ?auto_23658 ) ( not ( = ?auto_23674 ?auto_23662 ) ) ( not ( = ?auto_23665 ?auto_23674 ) ) ( HOIST-AT ?auto_23676 ?auto_23674 ) ( not ( = ?auto_23671 ?auto_23676 ) ) ( not ( = ?auto_23667 ?auto_23676 ) ) ( AVAILABLE ?auto_23676 ) ( SURFACE-AT ?auto_23658 ?auto_23674 ) ( ON ?auto_23658 ?auto_23669 ) ( CLEAR ?auto_23658 ) ( not ( = ?auto_23658 ?auto_23669 ) ) ( not ( = ?auto_23659 ?auto_23669 ) ) ( not ( = ?auto_23673 ?auto_23669 ) ) ( not ( = ?auto_23668 ?auto_23669 ) ) ( IS-CRATE ?auto_23673 ) ( not ( = ?auto_23670 ?auto_23673 ) ) ( not ( = ?auto_23658 ?auto_23670 ) ) ( not ( = ?auto_23659 ?auto_23670 ) ) ( not ( = ?auto_23668 ?auto_23670 ) ) ( not ( = ?auto_23669 ?auto_23670 ) ) ( SURFACE-AT ?auto_23673 ?auto_23665 ) ( ON ?auto_23673 ?auto_23663 ) ( CLEAR ?auto_23673 ) ( not ( = ?auto_23658 ?auto_23663 ) ) ( not ( = ?auto_23659 ?auto_23663 ) ) ( not ( = ?auto_23673 ?auto_23663 ) ) ( not ( = ?auto_23668 ?auto_23663 ) ) ( not ( = ?auto_23669 ?auto_23663 ) ) ( not ( = ?auto_23670 ?auto_23663 ) ) ( IS-CRATE ?auto_23670 ) ( not ( = ?auto_23675 ?auto_23670 ) ) ( not ( = ?auto_23658 ?auto_23675 ) ) ( not ( = ?auto_23659 ?auto_23675 ) ) ( not ( = ?auto_23673 ?auto_23675 ) ) ( not ( = ?auto_23668 ?auto_23675 ) ) ( not ( = ?auto_23669 ?auto_23675 ) ) ( not ( = ?auto_23663 ?auto_23675 ) ) ( not ( = ?auto_23672 ?auto_23662 ) ) ( not ( = ?auto_23665 ?auto_23672 ) ) ( not ( = ?auto_23674 ?auto_23672 ) ) ( HOIST-AT ?auto_23664 ?auto_23672 ) ( not ( = ?auto_23671 ?auto_23664 ) ) ( not ( = ?auto_23667 ?auto_23664 ) ) ( not ( = ?auto_23676 ?auto_23664 ) ) ( AVAILABLE ?auto_23664 ) ( SURFACE-AT ?auto_23670 ?auto_23672 ) ( ON ?auto_23670 ?auto_23660 ) ( CLEAR ?auto_23670 ) ( not ( = ?auto_23658 ?auto_23660 ) ) ( not ( = ?auto_23659 ?auto_23660 ) ) ( not ( = ?auto_23673 ?auto_23660 ) ) ( not ( = ?auto_23668 ?auto_23660 ) ) ( not ( = ?auto_23669 ?auto_23660 ) ) ( not ( = ?auto_23670 ?auto_23660 ) ) ( not ( = ?auto_23663 ?auto_23660 ) ) ( not ( = ?auto_23675 ?auto_23660 ) ) ( SURFACE-AT ?auto_23666 ?auto_23662 ) ( CLEAR ?auto_23666 ) ( IS-CRATE ?auto_23675 ) ( not ( = ?auto_23666 ?auto_23675 ) ) ( not ( = ?auto_23658 ?auto_23666 ) ) ( not ( = ?auto_23659 ?auto_23666 ) ) ( not ( = ?auto_23673 ?auto_23666 ) ) ( not ( = ?auto_23668 ?auto_23666 ) ) ( not ( = ?auto_23669 ?auto_23666 ) ) ( not ( = ?auto_23670 ?auto_23666 ) ) ( not ( = ?auto_23663 ?auto_23666 ) ) ( not ( = ?auto_23660 ?auto_23666 ) ) ( AVAILABLE ?auto_23671 ) ( TRUCK-AT ?auto_23661 ?auto_23665 ) ( LIFTING ?auto_23667 ?auto_23675 ) )
    :subtasks
    ( ( !LOAD ?auto_23667 ?auto_23675 ?auto_23661 ?auto_23665 )
      ( MAKE-2CRATE ?auto_23673 ?auto_23658 ?auto_23659 )
      ( MAKE-1CRATE-VERIFY ?auto_23658 ?auto_23659 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23677 - SURFACE
      ?auto_23678 - SURFACE
      ?auto_23679 - SURFACE
    )
    :vars
    (
      ?auto_23687 - HOIST
      ?auto_23683 - PLACE
      ?auto_23695 - PLACE
      ?auto_23689 - HOIST
      ?auto_23693 - SURFACE
      ?auto_23685 - PLACE
      ?auto_23688 - HOIST
      ?auto_23680 - SURFACE
      ?auto_23686 - SURFACE
      ?auto_23684 - SURFACE
      ?auto_23692 - SURFACE
      ?auto_23682 - PLACE
      ?auto_23694 - HOIST
      ?auto_23681 - SURFACE
      ?auto_23691 - SURFACE
      ?auto_23690 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23687 ?auto_23683 ) ( IS-CRATE ?auto_23679 ) ( not ( = ?auto_23678 ?auto_23679 ) ) ( not ( = ?auto_23677 ?auto_23678 ) ) ( not ( = ?auto_23677 ?auto_23679 ) ) ( not ( = ?auto_23695 ?auto_23683 ) ) ( HOIST-AT ?auto_23689 ?auto_23695 ) ( not ( = ?auto_23687 ?auto_23689 ) ) ( SURFACE-AT ?auto_23679 ?auto_23695 ) ( ON ?auto_23679 ?auto_23693 ) ( CLEAR ?auto_23679 ) ( not ( = ?auto_23678 ?auto_23693 ) ) ( not ( = ?auto_23679 ?auto_23693 ) ) ( not ( = ?auto_23677 ?auto_23693 ) ) ( IS-CRATE ?auto_23678 ) ( not ( = ?auto_23685 ?auto_23683 ) ) ( not ( = ?auto_23695 ?auto_23685 ) ) ( HOIST-AT ?auto_23688 ?auto_23685 ) ( not ( = ?auto_23687 ?auto_23688 ) ) ( not ( = ?auto_23689 ?auto_23688 ) ) ( AVAILABLE ?auto_23688 ) ( SURFACE-AT ?auto_23678 ?auto_23685 ) ( ON ?auto_23678 ?auto_23680 ) ( CLEAR ?auto_23678 ) ( not ( = ?auto_23678 ?auto_23680 ) ) ( not ( = ?auto_23679 ?auto_23680 ) ) ( not ( = ?auto_23677 ?auto_23680 ) ) ( not ( = ?auto_23693 ?auto_23680 ) ) ( IS-CRATE ?auto_23677 ) ( not ( = ?auto_23686 ?auto_23677 ) ) ( not ( = ?auto_23678 ?auto_23686 ) ) ( not ( = ?auto_23679 ?auto_23686 ) ) ( not ( = ?auto_23693 ?auto_23686 ) ) ( not ( = ?auto_23680 ?auto_23686 ) ) ( SURFACE-AT ?auto_23677 ?auto_23695 ) ( ON ?auto_23677 ?auto_23684 ) ( CLEAR ?auto_23677 ) ( not ( = ?auto_23678 ?auto_23684 ) ) ( not ( = ?auto_23679 ?auto_23684 ) ) ( not ( = ?auto_23677 ?auto_23684 ) ) ( not ( = ?auto_23693 ?auto_23684 ) ) ( not ( = ?auto_23680 ?auto_23684 ) ) ( not ( = ?auto_23686 ?auto_23684 ) ) ( IS-CRATE ?auto_23686 ) ( not ( = ?auto_23692 ?auto_23686 ) ) ( not ( = ?auto_23678 ?auto_23692 ) ) ( not ( = ?auto_23679 ?auto_23692 ) ) ( not ( = ?auto_23677 ?auto_23692 ) ) ( not ( = ?auto_23693 ?auto_23692 ) ) ( not ( = ?auto_23680 ?auto_23692 ) ) ( not ( = ?auto_23684 ?auto_23692 ) ) ( not ( = ?auto_23682 ?auto_23683 ) ) ( not ( = ?auto_23695 ?auto_23682 ) ) ( not ( = ?auto_23685 ?auto_23682 ) ) ( HOIST-AT ?auto_23694 ?auto_23682 ) ( not ( = ?auto_23687 ?auto_23694 ) ) ( not ( = ?auto_23689 ?auto_23694 ) ) ( not ( = ?auto_23688 ?auto_23694 ) ) ( AVAILABLE ?auto_23694 ) ( SURFACE-AT ?auto_23686 ?auto_23682 ) ( ON ?auto_23686 ?auto_23681 ) ( CLEAR ?auto_23686 ) ( not ( = ?auto_23678 ?auto_23681 ) ) ( not ( = ?auto_23679 ?auto_23681 ) ) ( not ( = ?auto_23677 ?auto_23681 ) ) ( not ( = ?auto_23693 ?auto_23681 ) ) ( not ( = ?auto_23680 ?auto_23681 ) ) ( not ( = ?auto_23686 ?auto_23681 ) ) ( not ( = ?auto_23684 ?auto_23681 ) ) ( not ( = ?auto_23692 ?auto_23681 ) ) ( SURFACE-AT ?auto_23691 ?auto_23683 ) ( CLEAR ?auto_23691 ) ( IS-CRATE ?auto_23692 ) ( not ( = ?auto_23691 ?auto_23692 ) ) ( not ( = ?auto_23678 ?auto_23691 ) ) ( not ( = ?auto_23679 ?auto_23691 ) ) ( not ( = ?auto_23677 ?auto_23691 ) ) ( not ( = ?auto_23693 ?auto_23691 ) ) ( not ( = ?auto_23680 ?auto_23691 ) ) ( not ( = ?auto_23686 ?auto_23691 ) ) ( not ( = ?auto_23684 ?auto_23691 ) ) ( not ( = ?auto_23681 ?auto_23691 ) ) ( AVAILABLE ?auto_23687 ) ( TRUCK-AT ?auto_23690 ?auto_23695 ) ( LIFTING ?auto_23689 ?auto_23692 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23678 ?auto_23679 )
      ( MAKE-2CRATE-VERIFY ?auto_23677 ?auto_23678 ?auto_23679 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23696 - SURFACE
      ?auto_23697 - SURFACE
      ?auto_23698 - SURFACE
      ?auto_23699 - SURFACE
    )
    :vars
    (
      ?auto_23705 - HOIST
      ?auto_23707 - PLACE
      ?auto_23706 - PLACE
      ?auto_23700 - HOIST
      ?auto_23711 - SURFACE
      ?auto_23713 - PLACE
      ?auto_23710 - HOIST
      ?auto_23703 - SURFACE
      ?auto_23708 - SURFACE
      ?auto_23714 - SURFACE
      ?auto_23704 - PLACE
      ?auto_23712 - HOIST
      ?auto_23701 - SURFACE
      ?auto_23709 - SURFACE
      ?auto_23702 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23705 ?auto_23707 ) ( IS-CRATE ?auto_23699 ) ( not ( = ?auto_23698 ?auto_23699 ) ) ( not ( = ?auto_23697 ?auto_23698 ) ) ( not ( = ?auto_23697 ?auto_23699 ) ) ( not ( = ?auto_23706 ?auto_23707 ) ) ( HOIST-AT ?auto_23700 ?auto_23706 ) ( not ( = ?auto_23705 ?auto_23700 ) ) ( SURFACE-AT ?auto_23699 ?auto_23706 ) ( ON ?auto_23699 ?auto_23711 ) ( CLEAR ?auto_23699 ) ( not ( = ?auto_23698 ?auto_23711 ) ) ( not ( = ?auto_23699 ?auto_23711 ) ) ( not ( = ?auto_23697 ?auto_23711 ) ) ( IS-CRATE ?auto_23698 ) ( not ( = ?auto_23713 ?auto_23707 ) ) ( not ( = ?auto_23706 ?auto_23713 ) ) ( HOIST-AT ?auto_23710 ?auto_23713 ) ( not ( = ?auto_23705 ?auto_23710 ) ) ( not ( = ?auto_23700 ?auto_23710 ) ) ( AVAILABLE ?auto_23710 ) ( SURFACE-AT ?auto_23698 ?auto_23713 ) ( ON ?auto_23698 ?auto_23703 ) ( CLEAR ?auto_23698 ) ( not ( = ?auto_23698 ?auto_23703 ) ) ( not ( = ?auto_23699 ?auto_23703 ) ) ( not ( = ?auto_23697 ?auto_23703 ) ) ( not ( = ?auto_23711 ?auto_23703 ) ) ( IS-CRATE ?auto_23697 ) ( not ( = ?auto_23696 ?auto_23697 ) ) ( not ( = ?auto_23698 ?auto_23696 ) ) ( not ( = ?auto_23699 ?auto_23696 ) ) ( not ( = ?auto_23711 ?auto_23696 ) ) ( not ( = ?auto_23703 ?auto_23696 ) ) ( SURFACE-AT ?auto_23697 ?auto_23706 ) ( ON ?auto_23697 ?auto_23708 ) ( CLEAR ?auto_23697 ) ( not ( = ?auto_23698 ?auto_23708 ) ) ( not ( = ?auto_23699 ?auto_23708 ) ) ( not ( = ?auto_23697 ?auto_23708 ) ) ( not ( = ?auto_23711 ?auto_23708 ) ) ( not ( = ?auto_23703 ?auto_23708 ) ) ( not ( = ?auto_23696 ?auto_23708 ) ) ( IS-CRATE ?auto_23696 ) ( not ( = ?auto_23714 ?auto_23696 ) ) ( not ( = ?auto_23698 ?auto_23714 ) ) ( not ( = ?auto_23699 ?auto_23714 ) ) ( not ( = ?auto_23697 ?auto_23714 ) ) ( not ( = ?auto_23711 ?auto_23714 ) ) ( not ( = ?auto_23703 ?auto_23714 ) ) ( not ( = ?auto_23708 ?auto_23714 ) ) ( not ( = ?auto_23704 ?auto_23707 ) ) ( not ( = ?auto_23706 ?auto_23704 ) ) ( not ( = ?auto_23713 ?auto_23704 ) ) ( HOIST-AT ?auto_23712 ?auto_23704 ) ( not ( = ?auto_23705 ?auto_23712 ) ) ( not ( = ?auto_23700 ?auto_23712 ) ) ( not ( = ?auto_23710 ?auto_23712 ) ) ( AVAILABLE ?auto_23712 ) ( SURFACE-AT ?auto_23696 ?auto_23704 ) ( ON ?auto_23696 ?auto_23701 ) ( CLEAR ?auto_23696 ) ( not ( = ?auto_23698 ?auto_23701 ) ) ( not ( = ?auto_23699 ?auto_23701 ) ) ( not ( = ?auto_23697 ?auto_23701 ) ) ( not ( = ?auto_23711 ?auto_23701 ) ) ( not ( = ?auto_23703 ?auto_23701 ) ) ( not ( = ?auto_23696 ?auto_23701 ) ) ( not ( = ?auto_23708 ?auto_23701 ) ) ( not ( = ?auto_23714 ?auto_23701 ) ) ( SURFACE-AT ?auto_23709 ?auto_23707 ) ( CLEAR ?auto_23709 ) ( IS-CRATE ?auto_23714 ) ( not ( = ?auto_23709 ?auto_23714 ) ) ( not ( = ?auto_23698 ?auto_23709 ) ) ( not ( = ?auto_23699 ?auto_23709 ) ) ( not ( = ?auto_23697 ?auto_23709 ) ) ( not ( = ?auto_23711 ?auto_23709 ) ) ( not ( = ?auto_23703 ?auto_23709 ) ) ( not ( = ?auto_23696 ?auto_23709 ) ) ( not ( = ?auto_23708 ?auto_23709 ) ) ( not ( = ?auto_23701 ?auto_23709 ) ) ( AVAILABLE ?auto_23705 ) ( TRUCK-AT ?auto_23702 ?auto_23706 ) ( LIFTING ?auto_23700 ?auto_23714 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23697 ?auto_23698 ?auto_23699 )
      ( MAKE-3CRATE-VERIFY ?auto_23696 ?auto_23697 ?auto_23698 ?auto_23699 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23715 - SURFACE
      ?auto_23716 - SURFACE
      ?auto_23717 - SURFACE
      ?auto_23718 - SURFACE
      ?auto_23719 - SURFACE
    )
    :vars
    (
      ?auto_23725 - HOIST
      ?auto_23727 - PLACE
      ?auto_23726 - PLACE
      ?auto_23720 - HOIST
      ?auto_23731 - SURFACE
      ?auto_23733 - PLACE
      ?auto_23730 - HOIST
      ?auto_23723 - SURFACE
      ?auto_23728 - SURFACE
      ?auto_23724 - PLACE
      ?auto_23732 - HOIST
      ?auto_23721 - SURFACE
      ?auto_23729 - SURFACE
      ?auto_23722 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23725 ?auto_23727 ) ( IS-CRATE ?auto_23719 ) ( not ( = ?auto_23718 ?auto_23719 ) ) ( not ( = ?auto_23717 ?auto_23718 ) ) ( not ( = ?auto_23717 ?auto_23719 ) ) ( not ( = ?auto_23726 ?auto_23727 ) ) ( HOIST-AT ?auto_23720 ?auto_23726 ) ( not ( = ?auto_23725 ?auto_23720 ) ) ( SURFACE-AT ?auto_23719 ?auto_23726 ) ( ON ?auto_23719 ?auto_23731 ) ( CLEAR ?auto_23719 ) ( not ( = ?auto_23718 ?auto_23731 ) ) ( not ( = ?auto_23719 ?auto_23731 ) ) ( not ( = ?auto_23717 ?auto_23731 ) ) ( IS-CRATE ?auto_23718 ) ( not ( = ?auto_23733 ?auto_23727 ) ) ( not ( = ?auto_23726 ?auto_23733 ) ) ( HOIST-AT ?auto_23730 ?auto_23733 ) ( not ( = ?auto_23725 ?auto_23730 ) ) ( not ( = ?auto_23720 ?auto_23730 ) ) ( AVAILABLE ?auto_23730 ) ( SURFACE-AT ?auto_23718 ?auto_23733 ) ( ON ?auto_23718 ?auto_23723 ) ( CLEAR ?auto_23718 ) ( not ( = ?auto_23718 ?auto_23723 ) ) ( not ( = ?auto_23719 ?auto_23723 ) ) ( not ( = ?auto_23717 ?auto_23723 ) ) ( not ( = ?auto_23731 ?auto_23723 ) ) ( IS-CRATE ?auto_23717 ) ( not ( = ?auto_23716 ?auto_23717 ) ) ( not ( = ?auto_23718 ?auto_23716 ) ) ( not ( = ?auto_23719 ?auto_23716 ) ) ( not ( = ?auto_23731 ?auto_23716 ) ) ( not ( = ?auto_23723 ?auto_23716 ) ) ( SURFACE-AT ?auto_23717 ?auto_23726 ) ( ON ?auto_23717 ?auto_23728 ) ( CLEAR ?auto_23717 ) ( not ( = ?auto_23718 ?auto_23728 ) ) ( not ( = ?auto_23719 ?auto_23728 ) ) ( not ( = ?auto_23717 ?auto_23728 ) ) ( not ( = ?auto_23731 ?auto_23728 ) ) ( not ( = ?auto_23723 ?auto_23728 ) ) ( not ( = ?auto_23716 ?auto_23728 ) ) ( IS-CRATE ?auto_23716 ) ( not ( = ?auto_23715 ?auto_23716 ) ) ( not ( = ?auto_23718 ?auto_23715 ) ) ( not ( = ?auto_23719 ?auto_23715 ) ) ( not ( = ?auto_23717 ?auto_23715 ) ) ( not ( = ?auto_23731 ?auto_23715 ) ) ( not ( = ?auto_23723 ?auto_23715 ) ) ( not ( = ?auto_23728 ?auto_23715 ) ) ( not ( = ?auto_23724 ?auto_23727 ) ) ( not ( = ?auto_23726 ?auto_23724 ) ) ( not ( = ?auto_23733 ?auto_23724 ) ) ( HOIST-AT ?auto_23732 ?auto_23724 ) ( not ( = ?auto_23725 ?auto_23732 ) ) ( not ( = ?auto_23720 ?auto_23732 ) ) ( not ( = ?auto_23730 ?auto_23732 ) ) ( AVAILABLE ?auto_23732 ) ( SURFACE-AT ?auto_23716 ?auto_23724 ) ( ON ?auto_23716 ?auto_23721 ) ( CLEAR ?auto_23716 ) ( not ( = ?auto_23718 ?auto_23721 ) ) ( not ( = ?auto_23719 ?auto_23721 ) ) ( not ( = ?auto_23717 ?auto_23721 ) ) ( not ( = ?auto_23731 ?auto_23721 ) ) ( not ( = ?auto_23723 ?auto_23721 ) ) ( not ( = ?auto_23716 ?auto_23721 ) ) ( not ( = ?auto_23728 ?auto_23721 ) ) ( not ( = ?auto_23715 ?auto_23721 ) ) ( SURFACE-AT ?auto_23729 ?auto_23727 ) ( CLEAR ?auto_23729 ) ( IS-CRATE ?auto_23715 ) ( not ( = ?auto_23729 ?auto_23715 ) ) ( not ( = ?auto_23718 ?auto_23729 ) ) ( not ( = ?auto_23719 ?auto_23729 ) ) ( not ( = ?auto_23717 ?auto_23729 ) ) ( not ( = ?auto_23731 ?auto_23729 ) ) ( not ( = ?auto_23723 ?auto_23729 ) ) ( not ( = ?auto_23716 ?auto_23729 ) ) ( not ( = ?auto_23728 ?auto_23729 ) ) ( not ( = ?auto_23721 ?auto_23729 ) ) ( AVAILABLE ?auto_23725 ) ( TRUCK-AT ?auto_23722 ?auto_23726 ) ( LIFTING ?auto_23720 ?auto_23715 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23717 ?auto_23718 ?auto_23719 )
      ( MAKE-4CRATE-VERIFY ?auto_23715 ?auto_23716 ?auto_23717 ?auto_23718 ?auto_23719 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23734 - SURFACE
      ?auto_23735 - SURFACE
      ?auto_23736 - SURFACE
      ?auto_23737 - SURFACE
      ?auto_23738 - SURFACE
      ?auto_23739 - SURFACE
    )
    :vars
    (
      ?auto_23745 - HOIST
      ?auto_23747 - PLACE
      ?auto_23746 - PLACE
      ?auto_23740 - HOIST
      ?auto_23750 - SURFACE
      ?auto_23752 - PLACE
      ?auto_23749 - HOIST
      ?auto_23743 - SURFACE
      ?auto_23748 - SURFACE
      ?auto_23744 - PLACE
      ?auto_23751 - HOIST
      ?auto_23741 - SURFACE
      ?auto_23742 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23745 ?auto_23747 ) ( IS-CRATE ?auto_23739 ) ( not ( = ?auto_23738 ?auto_23739 ) ) ( not ( = ?auto_23737 ?auto_23738 ) ) ( not ( = ?auto_23737 ?auto_23739 ) ) ( not ( = ?auto_23746 ?auto_23747 ) ) ( HOIST-AT ?auto_23740 ?auto_23746 ) ( not ( = ?auto_23745 ?auto_23740 ) ) ( SURFACE-AT ?auto_23739 ?auto_23746 ) ( ON ?auto_23739 ?auto_23750 ) ( CLEAR ?auto_23739 ) ( not ( = ?auto_23738 ?auto_23750 ) ) ( not ( = ?auto_23739 ?auto_23750 ) ) ( not ( = ?auto_23737 ?auto_23750 ) ) ( IS-CRATE ?auto_23738 ) ( not ( = ?auto_23752 ?auto_23747 ) ) ( not ( = ?auto_23746 ?auto_23752 ) ) ( HOIST-AT ?auto_23749 ?auto_23752 ) ( not ( = ?auto_23745 ?auto_23749 ) ) ( not ( = ?auto_23740 ?auto_23749 ) ) ( AVAILABLE ?auto_23749 ) ( SURFACE-AT ?auto_23738 ?auto_23752 ) ( ON ?auto_23738 ?auto_23743 ) ( CLEAR ?auto_23738 ) ( not ( = ?auto_23738 ?auto_23743 ) ) ( not ( = ?auto_23739 ?auto_23743 ) ) ( not ( = ?auto_23737 ?auto_23743 ) ) ( not ( = ?auto_23750 ?auto_23743 ) ) ( IS-CRATE ?auto_23737 ) ( not ( = ?auto_23736 ?auto_23737 ) ) ( not ( = ?auto_23738 ?auto_23736 ) ) ( not ( = ?auto_23739 ?auto_23736 ) ) ( not ( = ?auto_23750 ?auto_23736 ) ) ( not ( = ?auto_23743 ?auto_23736 ) ) ( SURFACE-AT ?auto_23737 ?auto_23746 ) ( ON ?auto_23737 ?auto_23748 ) ( CLEAR ?auto_23737 ) ( not ( = ?auto_23738 ?auto_23748 ) ) ( not ( = ?auto_23739 ?auto_23748 ) ) ( not ( = ?auto_23737 ?auto_23748 ) ) ( not ( = ?auto_23750 ?auto_23748 ) ) ( not ( = ?auto_23743 ?auto_23748 ) ) ( not ( = ?auto_23736 ?auto_23748 ) ) ( IS-CRATE ?auto_23736 ) ( not ( = ?auto_23735 ?auto_23736 ) ) ( not ( = ?auto_23738 ?auto_23735 ) ) ( not ( = ?auto_23739 ?auto_23735 ) ) ( not ( = ?auto_23737 ?auto_23735 ) ) ( not ( = ?auto_23750 ?auto_23735 ) ) ( not ( = ?auto_23743 ?auto_23735 ) ) ( not ( = ?auto_23748 ?auto_23735 ) ) ( not ( = ?auto_23744 ?auto_23747 ) ) ( not ( = ?auto_23746 ?auto_23744 ) ) ( not ( = ?auto_23752 ?auto_23744 ) ) ( HOIST-AT ?auto_23751 ?auto_23744 ) ( not ( = ?auto_23745 ?auto_23751 ) ) ( not ( = ?auto_23740 ?auto_23751 ) ) ( not ( = ?auto_23749 ?auto_23751 ) ) ( AVAILABLE ?auto_23751 ) ( SURFACE-AT ?auto_23736 ?auto_23744 ) ( ON ?auto_23736 ?auto_23741 ) ( CLEAR ?auto_23736 ) ( not ( = ?auto_23738 ?auto_23741 ) ) ( not ( = ?auto_23739 ?auto_23741 ) ) ( not ( = ?auto_23737 ?auto_23741 ) ) ( not ( = ?auto_23750 ?auto_23741 ) ) ( not ( = ?auto_23743 ?auto_23741 ) ) ( not ( = ?auto_23736 ?auto_23741 ) ) ( not ( = ?auto_23748 ?auto_23741 ) ) ( not ( = ?auto_23735 ?auto_23741 ) ) ( SURFACE-AT ?auto_23734 ?auto_23747 ) ( CLEAR ?auto_23734 ) ( IS-CRATE ?auto_23735 ) ( not ( = ?auto_23734 ?auto_23735 ) ) ( not ( = ?auto_23738 ?auto_23734 ) ) ( not ( = ?auto_23739 ?auto_23734 ) ) ( not ( = ?auto_23737 ?auto_23734 ) ) ( not ( = ?auto_23750 ?auto_23734 ) ) ( not ( = ?auto_23743 ?auto_23734 ) ) ( not ( = ?auto_23736 ?auto_23734 ) ) ( not ( = ?auto_23748 ?auto_23734 ) ) ( not ( = ?auto_23741 ?auto_23734 ) ) ( AVAILABLE ?auto_23745 ) ( TRUCK-AT ?auto_23742 ?auto_23746 ) ( LIFTING ?auto_23740 ?auto_23735 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23737 ?auto_23738 ?auto_23739 )
      ( MAKE-5CRATE-VERIFY ?auto_23734 ?auto_23735 ?auto_23736 ?auto_23737 ?auto_23738 ?auto_23739 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23753 - SURFACE
      ?auto_23754 - SURFACE
    )
    :vars
    (
      ?auto_23761 - HOIST
      ?auto_23763 - PLACE
      ?auto_23770 - SURFACE
      ?auto_23762 - PLACE
      ?auto_23755 - HOIST
      ?auto_23767 - SURFACE
      ?auto_23769 - PLACE
      ?auto_23766 - HOIST
      ?auto_23758 - SURFACE
      ?auto_23760 - SURFACE
      ?auto_23764 - SURFACE
      ?auto_23771 - SURFACE
      ?auto_23759 - PLACE
      ?auto_23768 - HOIST
      ?auto_23756 - SURFACE
      ?auto_23765 - SURFACE
      ?auto_23757 - TRUCK
      ?auto_23772 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23761 ?auto_23763 ) ( IS-CRATE ?auto_23754 ) ( not ( = ?auto_23753 ?auto_23754 ) ) ( not ( = ?auto_23770 ?auto_23753 ) ) ( not ( = ?auto_23770 ?auto_23754 ) ) ( not ( = ?auto_23762 ?auto_23763 ) ) ( HOIST-AT ?auto_23755 ?auto_23762 ) ( not ( = ?auto_23761 ?auto_23755 ) ) ( SURFACE-AT ?auto_23754 ?auto_23762 ) ( ON ?auto_23754 ?auto_23767 ) ( CLEAR ?auto_23754 ) ( not ( = ?auto_23753 ?auto_23767 ) ) ( not ( = ?auto_23754 ?auto_23767 ) ) ( not ( = ?auto_23770 ?auto_23767 ) ) ( IS-CRATE ?auto_23753 ) ( not ( = ?auto_23769 ?auto_23763 ) ) ( not ( = ?auto_23762 ?auto_23769 ) ) ( HOIST-AT ?auto_23766 ?auto_23769 ) ( not ( = ?auto_23761 ?auto_23766 ) ) ( not ( = ?auto_23755 ?auto_23766 ) ) ( AVAILABLE ?auto_23766 ) ( SURFACE-AT ?auto_23753 ?auto_23769 ) ( ON ?auto_23753 ?auto_23758 ) ( CLEAR ?auto_23753 ) ( not ( = ?auto_23753 ?auto_23758 ) ) ( not ( = ?auto_23754 ?auto_23758 ) ) ( not ( = ?auto_23770 ?auto_23758 ) ) ( not ( = ?auto_23767 ?auto_23758 ) ) ( IS-CRATE ?auto_23770 ) ( not ( = ?auto_23760 ?auto_23770 ) ) ( not ( = ?auto_23753 ?auto_23760 ) ) ( not ( = ?auto_23754 ?auto_23760 ) ) ( not ( = ?auto_23767 ?auto_23760 ) ) ( not ( = ?auto_23758 ?auto_23760 ) ) ( SURFACE-AT ?auto_23770 ?auto_23762 ) ( ON ?auto_23770 ?auto_23764 ) ( CLEAR ?auto_23770 ) ( not ( = ?auto_23753 ?auto_23764 ) ) ( not ( = ?auto_23754 ?auto_23764 ) ) ( not ( = ?auto_23770 ?auto_23764 ) ) ( not ( = ?auto_23767 ?auto_23764 ) ) ( not ( = ?auto_23758 ?auto_23764 ) ) ( not ( = ?auto_23760 ?auto_23764 ) ) ( IS-CRATE ?auto_23760 ) ( not ( = ?auto_23771 ?auto_23760 ) ) ( not ( = ?auto_23753 ?auto_23771 ) ) ( not ( = ?auto_23754 ?auto_23771 ) ) ( not ( = ?auto_23770 ?auto_23771 ) ) ( not ( = ?auto_23767 ?auto_23771 ) ) ( not ( = ?auto_23758 ?auto_23771 ) ) ( not ( = ?auto_23764 ?auto_23771 ) ) ( not ( = ?auto_23759 ?auto_23763 ) ) ( not ( = ?auto_23762 ?auto_23759 ) ) ( not ( = ?auto_23769 ?auto_23759 ) ) ( HOIST-AT ?auto_23768 ?auto_23759 ) ( not ( = ?auto_23761 ?auto_23768 ) ) ( not ( = ?auto_23755 ?auto_23768 ) ) ( not ( = ?auto_23766 ?auto_23768 ) ) ( AVAILABLE ?auto_23768 ) ( SURFACE-AT ?auto_23760 ?auto_23759 ) ( ON ?auto_23760 ?auto_23756 ) ( CLEAR ?auto_23760 ) ( not ( = ?auto_23753 ?auto_23756 ) ) ( not ( = ?auto_23754 ?auto_23756 ) ) ( not ( = ?auto_23770 ?auto_23756 ) ) ( not ( = ?auto_23767 ?auto_23756 ) ) ( not ( = ?auto_23758 ?auto_23756 ) ) ( not ( = ?auto_23760 ?auto_23756 ) ) ( not ( = ?auto_23764 ?auto_23756 ) ) ( not ( = ?auto_23771 ?auto_23756 ) ) ( SURFACE-AT ?auto_23765 ?auto_23763 ) ( CLEAR ?auto_23765 ) ( IS-CRATE ?auto_23771 ) ( not ( = ?auto_23765 ?auto_23771 ) ) ( not ( = ?auto_23753 ?auto_23765 ) ) ( not ( = ?auto_23754 ?auto_23765 ) ) ( not ( = ?auto_23770 ?auto_23765 ) ) ( not ( = ?auto_23767 ?auto_23765 ) ) ( not ( = ?auto_23758 ?auto_23765 ) ) ( not ( = ?auto_23760 ?auto_23765 ) ) ( not ( = ?auto_23764 ?auto_23765 ) ) ( not ( = ?auto_23756 ?auto_23765 ) ) ( AVAILABLE ?auto_23761 ) ( TRUCK-AT ?auto_23757 ?auto_23762 ) ( AVAILABLE ?auto_23755 ) ( SURFACE-AT ?auto_23771 ?auto_23762 ) ( ON ?auto_23771 ?auto_23772 ) ( CLEAR ?auto_23771 ) ( not ( = ?auto_23753 ?auto_23772 ) ) ( not ( = ?auto_23754 ?auto_23772 ) ) ( not ( = ?auto_23770 ?auto_23772 ) ) ( not ( = ?auto_23767 ?auto_23772 ) ) ( not ( = ?auto_23758 ?auto_23772 ) ) ( not ( = ?auto_23760 ?auto_23772 ) ) ( not ( = ?auto_23764 ?auto_23772 ) ) ( not ( = ?auto_23771 ?auto_23772 ) ) ( not ( = ?auto_23756 ?auto_23772 ) ) ( not ( = ?auto_23765 ?auto_23772 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23755 ?auto_23771 ?auto_23772 ?auto_23762 )
      ( MAKE-2CRATE ?auto_23770 ?auto_23753 ?auto_23754 )
      ( MAKE-1CRATE-VERIFY ?auto_23753 ?auto_23754 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23773 - SURFACE
      ?auto_23774 - SURFACE
      ?auto_23775 - SURFACE
    )
    :vars
    (
      ?auto_23783 - HOIST
      ?auto_23781 - PLACE
      ?auto_23779 - PLACE
      ?auto_23791 - HOIST
      ?auto_23777 - SURFACE
      ?auto_23787 - PLACE
      ?auto_23780 - HOIST
      ?auto_23789 - SURFACE
      ?auto_23790 - SURFACE
      ?auto_23784 - SURFACE
      ?auto_23776 - SURFACE
      ?auto_23778 - PLACE
      ?auto_23786 - HOIST
      ?auto_23782 - SURFACE
      ?auto_23788 - SURFACE
      ?auto_23785 - TRUCK
      ?auto_23792 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23783 ?auto_23781 ) ( IS-CRATE ?auto_23775 ) ( not ( = ?auto_23774 ?auto_23775 ) ) ( not ( = ?auto_23773 ?auto_23774 ) ) ( not ( = ?auto_23773 ?auto_23775 ) ) ( not ( = ?auto_23779 ?auto_23781 ) ) ( HOIST-AT ?auto_23791 ?auto_23779 ) ( not ( = ?auto_23783 ?auto_23791 ) ) ( SURFACE-AT ?auto_23775 ?auto_23779 ) ( ON ?auto_23775 ?auto_23777 ) ( CLEAR ?auto_23775 ) ( not ( = ?auto_23774 ?auto_23777 ) ) ( not ( = ?auto_23775 ?auto_23777 ) ) ( not ( = ?auto_23773 ?auto_23777 ) ) ( IS-CRATE ?auto_23774 ) ( not ( = ?auto_23787 ?auto_23781 ) ) ( not ( = ?auto_23779 ?auto_23787 ) ) ( HOIST-AT ?auto_23780 ?auto_23787 ) ( not ( = ?auto_23783 ?auto_23780 ) ) ( not ( = ?auto_23791 ?auto_23780 ) ) ( AVAILABLE ?auto_23780 ) ( SURFACE-AT ?auto_23774 ?auto_23787 ) ( ON ?auto_23774 ?auto_23789 ) ( CLEAR ?auto_23774 ) ( not ( = ?auto_23774 ?auto_23789 ) ) ( not ( = ?auto_23775 ?auto_23789 ) ) ( not ( = ?auto_23773 ?auto_23789 ) ) ( not ( = ?auto_23777 ?auto_23789 ) ) ( IS-CRATE ?auto_23773 ) ( not ( = ?auto_23790 ?auto_23773 ) ) ( not ( = ?auto_23774 ?auto_23790 ) ) ( not ( = ?auto_23775 ?auto_23790 ) ) ( not ( = ?auto_23777 ?auto_23790 ) ) ( not ( = ?auto_23789 ?auto_23790 ) ) ( SURFACE-AT ?auto_23773 ?auto_23779 ) ( ON ?auto_23773 ?auto_23784 ) ( CLEAR ?auto_23773 ) ( not ( = ?auto_23774 ?auto_23784 ) ) ( not ( = ?auto_23775 ?auto_23784 ) ) ( not ( = ?auto_23773 ?auto_23784 ) ) ( not ( = ?auto_23777 ?auto_23784 ) ) ( not ( = ?auto_23789 ?auto_23784 ) ) ( not ( = ?auto_23790 ?auto_23784 ) ) ( IS-CRATE ?auto_23790 ) ( not ( = ?auto_23776 ?auto_23790 ) ) ( not ( = ?auto_23774 ?auto_23776 ) ) ( not ( = ?auto_23775 ?auto_23776 ) ) ( not ( = ?auto_23773 ?auto_23776 ) ) ( not ( = ?auto_23777 ?auto_23776 ) ) ( not ( = ?auto_23789 ?auto_23776 ) ) ( not ( = ?auto_23784 ?auto_23776 ) ) ( not ( = ?auto_23778 ?auto_23781 ) ) ( not ( = ?auto_23779 ?auto_23778 ) ) ( not ( = ?auto_23787 ?auto_23778 ) ) ( HOIST-AT ?auto_23786 ?auto_23778 ) ( not ( = ?auto_23783 ?auto_23786 ) ) ( not ( = ?auto_23791 ?auto_23786 ) ) ( not ( = ?auto_23780 ?auto_23786 ) ) ( AVAILABLE ?auto_23786 ) ( SURFACE-AT ?auto_23790 ?auto_23778 ) ( ON ?auto_23790 ?auto_23782 ) ( CLEAR ?auto_23790 ) ( not ( = ?auto_23774 ?auto_23782 ) ) ( not ( = ?auto_23775 ?auto_23782 ) ) ( not ( = ?auto_23773 ?auto_23782 ) ) ( not ( = ?auto_23777 ?auto_23782 ) ) ( not ( = ?auto_23789 ?auto_23782 ) ) ( not ( = ?auto_23790 ?auto_23782 ) ) ( not ( = ?auto_23784 ?auto_23782 ) ) ( not ( = ?auto_23776 ?auto_23782 ) ) ( SURFACE-AT ?auto_23788 ?auto_23781 ) ( CLEAR ?auto_23788 ) ( IS-CRATE ?auto_23776 ) ( not ( = ?auto_23788 ?auto_23776 ) ) ( not ( = ?auto_23774 ?auto_23788 ) ) ( not ( = ?auto_23775 ?auto_23788 ) ) ( not ( = ?auto_23773 ?auto_23788 ) ) ( not ( = ?auto_23777 ?auto_23788 ) ) ( not ( = ?auto_23789 ?auto_23788 ) ) ( not ( = ?auto_23790 ?auto_23788 ) ) ( not ( = ?auto_23784 ?auto_23788 ) ) ( not ( = ?auto_23782 ?auto_23788 ) ) ( AVAILABLE ?auto_23783 ) ( TRUCK-AT ?auto_23785 ?auto_23779 ) ( AVAILABLE ?auto_23791 ) ( SURFACE-AT ?auto_23776 ?auto_23779 ) ( ON ?auto_23776 ?auto_23792 ) ( CLEAR ?auto_23776 ) ( not ( = ?auto_23774 ?auto_23792 ) ) ( not ( = ?auto_23775 ?auto_23792 ) ) ( not ( = ?auto_23773 ?auto_23792 ) ) ( not ( = ?auto_23777 ?auto_23792 ) ) ( not ( = ?auto_23789 ?auto_23792 ) ) ( not ( = ?auto_23790 ?auto_23792 ) ) ( not ( = ?auto_23784 ?auto_23792 ) ) ( not ( = ?auto_23776 ?auto_23792 ) ) ( not ( = ?auto_23782 ?auto_23792 ) ) ( not ( = ?auto_23788 ?auto_23792 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23774 ?auto_23775 )
      ( MAKE-2CRATE-VERIFY ?auto_23773 ?auto_23774 ?auto_23775 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23793 - SURFACE
      ?auto_23794 - SURFACE
      ?auto_23795 - SURFACE
      ?auto_23796 - SURFACE
    )
    :vars
    (
      ?auto_23812 - HOIST
      ?auto_23801 - PLACE
      ?auto_23810 - PLACE
      ?auto_23797 - HOIST
      ?auto_23804 - SURFACE
      ?auto_23807 - PLACE
      ?auto_23799 - HOIST
      ?auto_23806 - SURFACE
      ?auto_23811 - SURFACE
      ?auto_23798 - SURFACE
      ?auto_23802 - PLACE
      ?auto_23803 - HOIST
      ?auto_23809 - SURFACE
      ?auto_23800 - SURFACE
      ?auto_23808 - TRUCK
      ?auto_23805 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23812 ?auto_23801 ) ( IS-CRATE ?auto_23796 ) ( not ( = ?auto_23795 ?auto_23796 ) ) ( not ( = ?auto_23794 ?auto_23795 ) ) ( not ( = ?auto_23794 ?auto_23796 ) ) ( not ( = ?auto_23810 ?auto_23801 ) ) ( HOIST-AT ?auto_23797 ?auto_23810 ) ( not ( = ?auto_23812 ?auto_23797 ) ) ( SURFACE-AT ?auto_23796 ?auto_23810 ) ( ON ?auto_23796 ?auto_23804 ) ( CLEAR ?auto_23796 ) ( not ( = ?auto_23795 ?auto_23804 ) ) ( not ( = ?auto_23796 ?auto_23804 ) ) ( not ( = ?auto_23794 ?auto_23804 ) ) ( IS-CRATE ?auto_23795 ) ( not ( = ?auto_23807 ?auto_23801 ) ) ( not ( = ?auto_23810 ?auto_23807 ) ) ( HOIST-AT ?auto_23799 ?auto_23807 ) ( not ( = ?auto_23812 ?auto_23799 ) ) ( not ( = ?auto_23797 ?auto_23799 ) ) ( AVAILABLE ?auto_23799 ) ( SURFACE-AT ?auto_23795 ?auto_23807 ) ( ON ?auto_23795 ?auto_23806 ) ( CLEAR ?auto_23795 ) ( not ( = ?auto_23795 ?auto_23806 ) ) ( not ( = ?auto_23796 ?auto_23806 ) ) ( not ( = ?auto_23794 ?auto_23806 ) ) ( not ( = ?auto_23804 ?auto_23806 ) ) ( IS-CRATE ?auto_23794 ) ( not ( = ?auto_23793 ?auto_23794 ) ) ( not ( = ?auto_23795 ?auto_23793 ) ) ( not ( = ?auto_23796 ?auto_23793 ) ) ( not ( = ?auto_23804 ?auto_23793 ) ) ( not ( = ?auto_23806 ?auto_23793 ) ) ( SURFACE-AT ?auto_23794 ?auto_23810 ) ( ON ?auto_23794 ?auto_23811 ) ( CLEAR ?auto_23794 ) ( not ( = ?auto_23795 ?auto_23811 ) ) ( not ( = ?auto_23796 ?auto_23811 ) ) ( not ( = ?auto_23794 ?auto_23811 ) ) ( not ( = ?auto_23804 ?auto_23811 ) ) ( not ( = ?auto_23806 ?auto_23811 ) ) ( not ( = ?auto_23793 ?auto_23811 ) ) ( IS-CRATE ?auto_23793 ) ( not ( = ?auto_23798 ?auto_23793 ) ) ( not ( = ?auto_23795 ?auto_23798 ) ) ( not ( = ?auto_23796 ?auto_23798 ) ) ( not ( = ?auto_23794 ?auto_23798 ) ) ( not ( = ?auto_23804 ?auto_23798 ) ) ( not ( = ?auto_23806 ?auto_23798 ) ) ( not ( = ?auto_23811 ?auto_23798 ) ) ( not ( = ?auto_23802 ?auto_23801 ) ) ( not ( = ?auto_23810 ?auto_23802 ) ) ( not ( = ?auto_23807 ?auto_23802 ) ) ( HOIST-AT ?auto_23803 ?auto_23802 ) ( not ( = ?auto_23812 ?auto_23803 ) ) ( not ( = ?auto_23797 ?auto_23803 ) ) ( not ( = ?auto_23799 ?auto_23803 ) ) ( AVAILABLE ?auto_23803 ) ( SURFACE-AT ?auto_23793 ?auto_23802 ) ( ON ?auto_23793 ?auto_23809 ) ( CLEAR ?auto_23793 ) ( not ( = ?auto_23795 ?auto_23809 ) ) ( not ( = ?auto_23796 ?auto_23809 ) ) ( not ( = ?auto_23794 ?auto_23809 ) ) ( not ( = ?auto_23804 ?auto_23809 ) ) ( not ( = ?auto_23806 ?auto_23809 ) ) ( not ( = ?auto_23793 ?auto_23809 ) ) ( not ( = ?auto_23811 ?auto_23809 ) ) ( not ( = ?auto_23798 ?auto_23809 ) ) ( SURFACE-AT ?auto_23800 ?auto_23801 ) ( CLEAR ?auto_23800 ) ( IS-CRATE ?auto_23798 ) ( not ( = ?auto_23800 ?auto_23798 ) ) ( not ( = ?auto_23795 ?auto_23800 ) ) ( not ( = ?auto_23796 ?auto_23800 ) ) ( not ( = ?auto_23794 ?auto_23800 ) ) ( not ( = ?auto_23804 ?auto_23800 ) ) ( not ( = ?auto_23806 ?auto_23800 ) ) ( not ( = ?auto_23793 ?auto_23800 ) ) ( not ( = ?auto_23811 ?auto_23800 ) ) ( not ( = ?auto_23809 ?auto_23800 ) ) ( AVAILABLE ?auto_23812 ) ( TRUCK-AT ?auto_23808 ?auto_23810 ) ( AVAILABLE ?auto_23797 ) ( SURFACE-AT ?auto_23798 ?auto_23810 ) ( ON ?auto_23798 ?auto_23805 ) ( CLEAR ?auto_23798 ) ( not ( = ?auto_23795 ?auto_23805 ) ) ( not ( = ?auto_23796 ?auto_23805 ) ) ( not ( = ?auto_23794 ?auto_23805 ) ) ( not ( = ?auto_23804 ?auto_23805 ) ) ( not ( = ?auto_23806 ?auto_23805 ) ) ( not ( = ?auto_23793 ?auto_23805 ) ) ( not ( = ?auto_23811 ?auto_23805 ) ) ( not ( = ?auto_23798 ?auto_23805 ) ) ( not ( = ?auto_23809 ?auto_23805 ) ) ( not ( = ?auto_23800 ?auto_23805 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23794 ?auto_23795 ?auto_23796 )
      ( MAKE-3CRATE-VERIFY ?auto_23793 ?auto_23794 ?auto_23795 ?auto_23796 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23813 - SURFACE
      ?auto_23814 - SURFACE
      ?auto_23815 - SURFACE
      ?auto_23816 - SURFACE
      ?auto_23817 - SURFACE
    )
    :vars
    (
      ?auto_23832 - HOIST
      ?auto_23821 - PLACE
      ?auto_23830 - PLACE
      ?auto_23818 - HOIST
      ?auto_23824 - SURFACE
      ?auto_23827 - PLACE
      ?auto_23819 - HOIST
      ?auto_23826 - SURFACE
      ?auto_23831 - SURFACE
      ?auto_23822 - PLACE
      ?auto_23823 - HOIST
      ?auto_23829 - SURFACE
      ?auto_23820 - SURFACE
      ?auto_23828 - TRUCK
      ?auto_23825 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23832 ?auto_23821 ) ( IS-CRATE ?auto_23817 ) ( not ( = ?auto_23816 ?auto_23817 ) ) ( not ( = ?auto_23815 ?auto_23816 ) ) ( not ( = ?auto_23815 ?auto_23817 ) ) ( not ( = ?auto_23830 ?auto_23821 ) ) ( HOIST-AT ?auto_23818 ?auto_23830 ) ( not ( = ?auto_23832 ?auto_23818 ) ) ( SURFACE-AT ?auto_23817 ?auto_23830 ) ( ON ?auto_23817 ?auto_23824 ) ( CLEAR ?auto_23817 ) ( not ( = ?auto_23816 ?auto_23824 ) ) ( not ( = ?auto_23817 ?auto_23824 ) ) ( not ( = ?auto_23815 ?auto_23824 ) ) ( IS-CRATE ?auto_23816 ) ( not ( = ?auto_23827 ?auto_23821 ) ) ( not ( = ?auto_23830 ?auto_23827 ) ) ( HOIST-AT ?auto_23819 ?auto_23827 ) ( not ( = ?auto_23832 ?auto_23819 ) ) ( not ( = ?auto_23818 ?auto_23819 ) ) ( AVAILABLE ?auto_23819 ) ( SURFACE-AT ?auto_23816 ?auto_23827 ) ( ON ?auto_23816 ?auto_23826 ) ( CLEAR ?auto_23816 ) ( not ( = ?auto_23816 ?auto_23826 ) ) ( not ( = ?auto_23817 ?auto_23826 ) ) ( not ( = ?auto_23815 ?auto_23826 ) ) ( not ( = ?auto_23824 ?auto_23826 ) ) ( IS-CRATE ?auto_23815 ) ( not ( = ?auto_23814 ?auto_23815 ) ) ( not ( = ?auto_23816 ?auto_23814 ) ) ( not ( = ?auto_23817 ?auto_23814 ) ) ( not ( = ?auto_23824 ?auto_23814 ) ) ( not ( = ?auto_23826 ?auto_23814 ) ) ( SURFACE-AT ?auto_23815 ?auto_23830 ) ( ON ?auto_23815 ?auto_23831 ) ( CLEAR ?auto_23815 ) ( not ( = ?auto_23816 ?auto_23831 ) ) ( not ( = ?auto_23817 ?auto_23831 ) ) ( not ( = ?auto_23815 ?auto_23831 ) ) ( not ( = ?auto_23824 ?auto_23831 ) ) ( not ( = ?auto_23826 ?auto_23831 ) ) ( not ( = ?auto_23814 ?auto_23831 ) ) ( IS-CRATE ?auto_23814 ) ( not ( = ?auto_23813 ?auto_23814 ) ) ( not ( = ?auto_23816 ?auto_23813 ) ) ( not ( = ?auto_23817 ?auto_23813 ) ) ( not ( = ?auto_23815 ?auto_23813 ) ) ( not ( = ?auto_23824 ?auto_23813 ) ) ( not ( = ?auto_23826 ?auto_23813 ) ) ( not ( = ?auto_23831 ?auto_23813 ) ) ( not ( = ?auto_23822 ?auto_23821 ) ) ( not ( = ?auto_23830 ?auto_23822 ) ) ( not ( = ?auto_23827 ?auto_23822 ) ) ( HOIST-AT ?auto_23823 ?auto_23822 ) ( not ( = ?auto_23832 ?auto_23823 ) ) ( not ( = ?auto_23818 ?auto_23823 ) ) ( not ( = ?auto_23819 ?auto_23823 ) ) ( AVAILABLE ?auto_23823 ) ( SURFACE-AT ?auto_23814 ?auto_23822 ) ( ON ?auto_23814 ?auto_23829 ) ( CLEAR ?auto_23814 ) ( not ( = ?auto_23816 ?auto_23829 ) ) ( not ( = ?auto_23817 ?auto_23829 ) ) ( not ( = ?auto_23815 ?auto_23829 ) ) ( not ( = ?auto_23824 ?auto_23829 ) ) ( not ( = ?auto_23826 ?auto_23829 ) ) ( not ( = ?auto_23814 ?auto_23829 ) ) ( not ( = ?auto_23831 ?auto_23829 ) ) ( not ( = ?auto_23813 ?auto_23829 ) ) ( SURFACE-AT ?auto_23820 ?auto_23821 ) ( CLEAR ?auto_23820 ) ( IS-CRATE ?auto_23813 ) ( not ( = ?auto_23820 ?auto_23813 ) ) ( not ( = ?auto_23816 ?auto_23820 ) ) ( not ( = ?auto_23817 ?auto_23820 ) ) ( not ( = ?auto_23815 ?auto_23820 ) ) ( not ( = ?auto_23824 ?auto_23820 ) ) ( not ( = ?auto_23826 ?auto_23820 ) ) ( not ( = ?auto_23814 ?auto_23820 ) ) ( not ( = ?auto_23831 ?auto_23820 ) ) ( not ( = ?auto_23829 ?auto_23820 ) ) ( AVAILABLE ?auto_23832 ) ( TRUCK-AT ?auto_23828 ?auto_23830 ) ( AVAILABLE ?auto_23818 ) ( SURFACE-AT ?auto_23813 ?auto_23830 ) ( ON ?auto_23813 ?auto_23825 ) ( CLEAR ?auto_23813 ) ( not ( = ?auto_23816 ?auto_23825 ) ) ( not ( = ?auto_23817 ?auto_23825 ) ) ( not ( = ?auto_23815 ?auto_23825 ) ) ( not ( = ?auto_23824 ?auto_23825 ) ) ( not ( = ?auto_23826 ?auto_23825 ) ) ( not ( = ?auto_23814 ?auto_23825 ) ) ( not ( = ?auto_23831 ?auto_23825 ) ) ( not ( = ?auto_23813 ?auto_23825 ) ) ( not ( = ?auto_23829 ?auto_23825 ) ) ( not ( = ?auto_23820 ?auto_23825 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23815 ?auto_23816 ?auto_23817 )
      ( MAKE-4CRATE-VERIFY ?auto_23813 ?auto_23814 ?auto_23815 ?auto_23816 ?auto_23817 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23833 - SURFACE
      ?auto_23834 - SURFACE
      ?auto_23835 - SURFACE
      ?auto_23836 - SURFACE
      ?auto_23837 - SURFACE
      ?auto_23838 - SURFACE
    )
    :vars
    (
      ?auto_23852 - HOIST
      ?auto_23841 - PLACE
      ?auto_23850 - PLACE
      ?auto_23839 - HOIST
      ?auto_23844 - SURFACE
      ?auto_23847 - PLACE
      ?auto_23840 - HOIST
      ?auto_23846 - SURFACE
      ?auto_23851 - SURFACE
      ?auto_23842 - PLACE
      ?auto_23843 - HOIST
      ?auto_23849 - SURFACE
      ?auto_23848 - TRUCK
      ?auto_23845 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23852 ?auto_23841 ) ( IS-CRATE ?auto_23838 ) ( not ( = ?auto_23837 ?auto_23838 ) ) ( not ( = ?auto_23836 ?auto_23837 ) ) ( not ( = ?auto_23836 ?auto_23838 ) ) ( not ( = ?auto_23850 ?auto_23841 ) ) ( HOIST-AT ?auto_23839 ?auto_23850 ) ( not ( = ?auto_23852 ?auto_23839 ) ) ( SURFACE-AT ?auto_23838 ?auto_23850 ) ( ON ?auto_23838 ?auto_23844 ) ( CLEAR ?auto_23838 ) ( not ( = ?auto_23837 ?auto_23844 ) ) ( not ( = ?auto_23838 ?auto_23844 ) ) ( not ( = ?auto_23836 ?auto_23844 ) ) ( IS-CRATE ?auto_23837 ) ( not ( = ?auto_23847 ?auto_23841 ) ) ( not ( = ?auto_23850 ?auto_23847 ) ) ( HOIST-AT ?auto_23840 ?auto_23847 ) ( not ( = ?auto_23852 ?auto_23840 ) ) ( not ( = ?auto_23839 ?auto_23840 ) ) ( AVAILABLE ?auto_23840 ) ( SURFACE-AT ?auto_23837 ?auto_23847 ) ( ON ?auto_23837 ?auto_23846 ) ( CLEAR ?auto_23837 ) ( not ( = ?auto_23837 ?auto_23846 ) ) ( not ( = ?auto_23838 ?auto_23846 ) ) ( not ( = ?auto_23836 ?auto_23846 ) ) ( not ( = ?auto_23844 ?auto_23846 ) ) ( IS-CRATE ?auto_23836 ) ( not ( = ?auto_23835 ?auto_23836 ) ) ( not ( = ?auto_23837 ?auto_23835 ) ) ( not ( = ?auto_23838 ?auto_23835 ) ) ( not ( = ?auto_23844 ?auto_23835 ) ) ( not ( = ?auto_23846 ?auto_23835 ) ) ( SURFACE-AT ?auto_23836 ?auto_23850 ) ( ON ?auto_23836 ?auto_23851 ) ( CLEAR ?auto_23836 ) ( not ( = ?auto_23837 ?auto_23851 ) ) ( not ( = ?auto_23838 ?auto_23851 ) ) ( not ( = ?auto_23836 ?auto_23851 ) ) ( not ( = ?auto_23844 ?auto_23851 ) ) ( not ( = ?auto_23846 ?auto_23851 ) ) ( not ( = ?auto_23835 ?auto_23851 ) ) ( IS-CRATE ?auto_23835 ) ( not ( = ?auto_23834 ?auto_23835 ) ) ( not ( = ?auto_23837 ?auto_23834 ) ) ( not ( = ?auto_23838 ?auto_23834 ) ) ( not ( = ?auto_23836 ?auto_23834 ) ) ( not ( = ?auto_23844 ?auto_23834 ) ) ( not ( = ?auto_23846 ?auto_23834 ) ) ( not ( = ?auto_23851 ?auto_23834 ) ) ( not ( = ?auto_23842 ?auto_23841 ) ) ( not ( = ?auto_23850 ?auto_23842 ) ) ( not ( = ?auto_23847 ?auto_23842 ) ) ( HOIST-AT ?auto_23843 ?auto_23842 ) ( not ( = ?auto_23852 ?auto_23843 ) ) ( not ( = ?auto_23839 ?auto_23843 ) ) ( not ( = ?auto_23840 ?auto_23843 ) ) ( AVAILABLE ?auto_23843 ) ( SURFACE-AT ?auto_23835 ?auto_23842 ) ( ON ?auto_23835 ?auto_23849 ) ( CLEAR ?auto_23835 ) ( not ( = ?auto_23837 ?auto_23849 ) ) ( not ( = ?auto_23838 ?auto_23849 ) ) ( not ( = ?auto_23836 ?auto_23849 ) ) ( not ( = ?auto_23844 ?auto_23849 ) ) ( not ( = ?auto_23846 ?auto_23849 ) ) ( not ( = ?auto_23835 ?auto_23849 ) ) ( not ( = ?auto_23851 ?auto_23849 ) ) ( not ( = ?auto_23834 ?auto_23849 ) ) ( SURFACE-AT ?auto_23833 ?auto_23841 ) ( CLEAR ?auto_23833 ) ( IS-CRATE ?auto_23834 ) ( not ( = ?auto_23833 ?auto_23834 ) ) ( not ( = ?auto_23837 ?auto_23833 ) ) ( not ( = ?auto_23838 ?auto_23833 ) ) ( not ( = ?auto_23836 ?auto_23833 ) ) ( not ( = ?auto_23844 ?auto_23833 ) ) ( not ( = ?auto_23846 ?auto_23833 ) ) ( not ( = ?auto_23835 ?auto_23833 ) ) ( not ( = ?auto_23851 ?auto_23833 ) ) ( not ( = ?auto_23849 ?auto_23833 ) ) ( AVAILABLE ?auto_23852 ) ( TRUCK-AT ?auto_23848 ?auto_23850 ) ( AVAILABLE ?auto_23839 ) ( SURFACE-AT ?auto_23834 ?auto_23850 ) ( ON ?auto_23834 ?auto_23845 ) ( CLEAR ?auto_23834 ) ( not ( = ?auto_23837 ?auto_23845 ) ) ( not ( = ?auto_23838 ?auto_23845 ) ) ( not ( = ?auto_23836 ?auto_23845 ) ) ( not ( = ?auto_23844 ?auto_23845 ) ) ( not ( = ?auto_23846 ?auto_23845 ) ) ( not ( = ?auto_23835 ?auto_23845 ) ) ( not ( = ?auto_23851 ?auto_23845 ) ) ( not ( = ?auto_23834 ?auto_23845 ) ) ( not ( = ?auto_23849 ?auto_23845 ) ) ( not ( = ?auto_23833 ?auto_23845 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23836 ?auto_23837 ?auto_23838 )
      ( MAKE-5CRATE-VERIFY ?auto_23833 ?auto_23834 ?auto_23835 ?auto_23836 ?auto_23837 ?auto_23838 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23853 - SURFACE
      ?auto_23854 - SURFACE
    )
    :vars
    (
      ?auto_23872 - HOIST
      ?auto_23859 - PLACE
      ?auto_23866 - SURFACE
      ?auto_23869 - PLACE
      ?auto_23855 - HOIST
      ?auto_23862 - SURFACE
      ?auto_23865 - PLACE
      ?auto_23857 - HOIST
      ?auto_23864 - SURFACE
      ?auto_23870 - SURFACE
      ?auto_23871 - SURFACE
      ?auto_23856 - SURFACE
      ?auto_23860 - PLACE
      ?auto_23861 - HOIST
      ?auto_23868 - SURFACE
      ?auto_23858 - SURFACE
      ?auto_23863 - SURFACE
      ?auto_23867 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23872 ?auto_23859 ) ( IS-CRATE ?auto_23854 ) ( not ( = ?auto_23853 ?auto_23854 ) ) ( not ( = ?auto_23866 ?auto_23853 ) ) ( not ( = ?auto_23866 ?auto_23854 ) ) ( not ( = ?auto_23869 ?auto_23859 ) ) ( HOIST-AT ?auto_23855 ?auto_23869 ) ( not ( = ?auto_23872 ?auto_23855 ) ) ( SURFACE-AT ?auto_23854 ?auto_23869 ) ( ON ?auto_23854 ?auto_23862 ) ( CLEAR ?auto_23854 ) ( not ( = ?auto_23853 ?auto_23862 ) ) ( not ( = ?auto_23854 ?auto_23862 ) ) ( not ( = ?auto_23866 ?auto_23862 ) ) ( IS-CRATE ?auto_23853 ) ( not ( = ?auto_23865 ?auto_23859 ) ) ( not ( = ?auto_23869 ?auto_23865 ) ) ( HOIST-AT ?auto_23857 ?auto_23865 ) ( not ( = ?auto_23872 ?auto_23857 ) ) ( not ( = ?auto_23855 ?auto_23857 ) ) ( AVAILABLE ?auto_23857 ) ( SURFACE-AT ?auto_23853 ?auto_23865 ) ( ON ?auto_23853 ?auto_23864 ) ( CLEAR ?auto_23853 ) ( not ( = ?auto_23853 ?auto_23864 ) ) ( not ( = ?auto_23854 ?auto_23864 ) ) ( not ( = ?auto_23866 ?auto_23864 ) ) ( not ( = ?auto_23862 ?auto_23864 ) ) ( IS-CRATE ?auto_23866 ) ( not ( = ?auto_23870 ?auto_23866 ) ) ( not ( = ?auto_23853 ?auto_23870 ) ) ( not ( = ?auto_23854 ?auto_23870 ) ) ( not ( = ?auto_23862 ?auto_23870 ) ) ( not ( = ?auto_23864 ?auto_23870 ) ) ( SURFACE-AT ?auto_23866 ?auto_23869 ) ( ON ?auto_23866 ?auto_23871 ) ( CLEAR ?auto_23866 ) ( not ( = ?auto_23853 ?auto_23871 ) ) ( not ( = ?auto_23854 ?auto_23871 ) ) ( not ( = ?auto_23866 ?auto_23871 ) ) ( not ( = ?auto_23862 ?auto_23871 ) ) ( not ( = ?auto_23864 ?auto_23871 ) ) ( not ( = ?auto_23870 ?auto_23871 ) ) ( IS-CRATE ?auto_23870 ) ( not ( = ?auto_23856 ?auto_23870 ) ) ( not ( = ?auto_23853 ?auto_23856 ) ) ( not ( = ?auto_23854 ?auto_23856 ) ) ( not ( = ?auto_23866 ?auto_23856 ) ) ( not ( = ?auto_23862 ?auto_23856 ) ) ( not ( = ?auto_23864 ?auto_23856 ) ) ( not ( = ?auto_23871 ?auto_23856 ) ) ( not ( = ?auto_23860 ?auto_23859 ) ) ( not ( = ?auto_23869 ?auto_23860 ) ) ( not ( = ?auto_23865 ?auto_23860 ) ) ( HOIST-AT ?auto_23861 ?auto_23860 ) ( not ( = ?auto_23872 ?auto_23861 ) ) ( not ( = ?auto_23855 ?auto_23861 ) ) ( not ( = ?auto_23857 ?auto_23861 ) ) ( AVAILABLE ?auto_23861 ) ( SURFACE-AT ?auto_23870 ?auto_23860 ) ( ON ?auto_23870 ?auto_23868 ) ( CLEAR ?auto_23870 ) ( not ( = ?auto_23853 ?auto_23868 ) ) ( not ( = ?auto_23854 ?auto_23868 ) ) ( not ( = ?auto_23866 ?auto_23868 ) ) ( not ( = ?auto_23862 ?auto_23868 ) ) ( not ( = ?auto_23864 ?auto_23868 ) ) ( not ( = ?auto_23870 ?auto_23868 ) ) ( not ( = ?auto_23871 ?auto_23868 ) ) ( not ( = ?auto_23856 ?auto_23868 ) ) ( SURFACE-AT ?auto_23858 ?auto_23859 ) ( CLEAR ?auto_23858 ) ( IS-CRATE ?auto_23856 ) ( not ( = ?auto_23858 ?auto_23856 ) ) ( not ( = ?auto_23853 ?auto_23858 ) ) ( not ( = ?auto_23854 ?auto_23858 ) ) ( not ( = ?auto_23866 ?auto_23858 ) ) ( not ( = ?auto_23862 ?auto_23858 ) ) ( not ( = ?auto_23864 ?auto_23858 ) ) ( not ( = ?auto_23870 ?auto_23858 ) ) ( not ( = ?auto_23871 ?auto_23858 ) ) ( not ( = ?auto_23868 ?auto_23858 ) ) ( AVAILABLE ?auto_23872 ) ( AVAILABLE ?auto_23855 ) ( SURFACE-AT ?auto_23856 ?auto_23869 ) ( ON ?auto_23856 ?auto_23863 ) ( CLEAR ?auto_23856 ) ( not ( = ?auto_23853 ?auto_23863 ) ) ( not ( = ?auto_23854 ?auto_23863 ) ) ( not ( = ?auto_23866 ?auto_23863 ) ) ( not ( = ?auto_23862 ?auto_23863 ) ) ( not ( = ?auto_23864 ?auto_23863 ) ) ( not ( = ?auto_23870 ?auto_23863 ) ) ( not ( = ?auto_23871 ?auto_23863 ) ) ( not ( = ?auto_23856 ?auto_23863 ) ) ( not ( = ?auto_23868 ?auto_23863 ) ) ( not ( = ?auto_23858 ?auto_23863 ) ) ( TRUCK-AT ?auto_23867 ?auto_23859 ) )
    :subtasks
    ( ( !DRIVE ?auto_23867 ?auto_23859 ?auto_23869 )
      ( MAKE-2CRATE ?auto_23866 ?auto_23853 ?auto_23854 )
      ( MAKE-1CRATE-VERIFY ?auto_23853 ?auto_23854 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23873 - SURFACE
      ?auto_23874 - SURFACE
      ?auto_23875 - SURFACE
    )
    :vars
    (
      ?auto_23883 - HOIST
      ?auto_23878 - PLACE
      ?auto_23892 - PLACE
      ?auto_23890 - HOIST
      ?auto_23884 - SURFACE
      ?auto_23882 - PLACE
      ?auto_23879 - HOIST
      ?auto_23881 - SURFACE
      ?auto_23877 - SURFACE
      ?auto_23891 - SURFACE
      ?auto_23889 - SURFACE
      ?auto_23876 - PLACE
      ?auto_23886 - HOIST
      ?auto_23880 - SURFACE
      ?auto_23885 - SURFACE
      ?auto_23887 - SURFACE
      ?auto_23888 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23883 ?auto_23878 ) ( IS-CRATE ?auto_23875 ) ( not ( = ?auto_23874 ?auto_23875 ) ) ( not ( = ?auto_23873 ?auto_23874 ) ) ( not ( = ?auto_23873 ?auto_23875 ) ) ( not ( = ?auto_23892 ?auto_23878 ) ) ( HOIST-AT ?auto_23890 ?auto_23892 ) ( not ( = ?auto_23883 ?auto_23890 ) ) ( SURFACE-AT ?auto_23875 ?auto_23892 ) ( ON ?auto_23875 ?auto_23884 ) ( CLEAR ?auto_23875 ) ( not ( = ?auto_23874 ?auto_23884 ) ) ( not ( = ?auto_23875 ?auto_23884 ) ) ( not ( = ?auto_23873 ?auto_23884 ) ) ( IS-CRATE ?auto_23874 ) ( not ( = ?auto_23882 ?auto_23878 ) ) ( not ( = ?auto_23892 ?auto_23882 ) ) ( HOIST-AT ?auto_23879 ?auto_23882 ) ( not ( = ?auto_23883 ?auto_23879 ) ) ( not ( = ?auto_23890 ?auto_23879 ) ) ( AVAILABLE ?auto_23879 ) ( SURFACE-AT ?auto_23874 ?auto_23882 ) ( ON ?auto_23874 ?auto_23881 ) ( CLEAR ?auto_23874 ) ( not ( = ?auto_23874 ?auto_23881 ) ) ( not ( = ?auto_23875 ?auto_23881 ) ) ( not ( = ?auto_23873 ?auto_23881 ) ) ( not ( = ?auto_23884 ?auto_23881 ) ) ( IS-CRATE ?auto_23873 ) ( not ( = ?auto_23877 ?auto_23873 ) ) ( not ( = ?auto_23874 ?auto_23877 ) ) ( not ( = ?auto_23875 ?auto_23877 ) ) ( not ( = ?auto_23884 ?auto_23877 ) ) ( not ( = ?auto_23881 ?auto_23877 ) ) ( SURFACE-AT ?auto_23873 ?auto_23892 ) ( ON ?auto_23873 ?auto_23891 ) ( CLEAR ?auto_23873 ) ( not ( = ?auto_23874 ?auto_23891 ) ) ( not ( = ?auto_23875 ?auto_23891 ) ) ( not ( = ?auto_23873 ?auto_23891 ) ) ( not ( = ?auto_23884 ?auto_23891 ) ) ( not ( = ?auto_23881 ?auto_23891 ) ) ( not ( = ?auto_23877 ?auto_23891 ) ) ( IS-CRATE ?auto_23877 ) ( not ( = ?auto_23889 ?auto_23877 ) ) ( not ( = ?auto_23874 ?auto_23889 ) ) ( not ( = ?auto_23875 ?auto_23889 ) ) ( not ( = ?auto_23873 ?auto_23889 ) ) ( not ( = ?auto_23884 ?auto_23889 ) ) ( not ( = ?auto_23881 ?auto_23889 ) ) ( not ( = ?auto_23891 ?auto_23889 ) ) ( not ( = ?auto_23876 ?auto_23878 ) ) ( not ( = ?auto_23892 ?auto_23876 ) ) ( not ( = ?auto_23882 ?auto_23876 ) ) ( HOIST-AT ?auto_23886 ?auto_23876 ) ( not ( = ?auto_23883 ?auto_23886 ) ) ( not ( = ?auto_23890 ?auto_23886 ) ) ( not ( = ?auto_23879 ?auto_23886 ) ) ( AVAILABLE ?auto_23886 ) ( SURFACE-AT ?auto_23877 ?auto_23876 ) ( ON ?auto_23877 ?auto_23880 ) ( CLEAR ?auto_23877 ) ( not ( = ?auto_23874 ?auto_23880 ) ) ( not ( = ?auto_23875 ?auto_23880 ) ) ( not ( = ?auto_23873 ?auto_23880 ) ) ( not ( = ?auto_23884 ?auto_23880 ) ) ( not ( = ?auto_23881 ?auto_23880 ) ) ( not ( = ?auto_23877 ?auto_23880 ) ) ( not ( = ?auto_23891 ?auto_23880 ) ) ( not ( = ?auto_23889 ?auto_23880 ) ) ( SURFACE-AT ?auto_23885 ?auto_23878 ) ( CLEAR ?auto_23885 ) ( IS-CRATE ?auto_23889 ) ( not ( = ?auto_23885 ?auto_23889 ) ) ( not ( = ?auto_23874 ?auto_23885 ) ) ( not ( = ?auto_23875 ?auto_23885 ) ) ( not ( = ?auto_23873 ?auto_23885 ) ) ( not ( = ?auto_23884 ?auto_23885 ) ) ( not ( = ?auto_23881 ?auto_23885 ) ) ( not ( = ?auto_23877 ?auto_23885 ) ) ( not ( = ?auto_23891 ?auto_23885 ) ) ( not ( = ?auto_23880 ?auto_23885 ) ) ( AVAILABLE ?auto_23883 ) ( AVAILABLE ?auto_23890 ) ( SURFACE-AT ?auto_23889 ?auto_23892 ) ( ON ?auto_23889 ?auto_23887 ) ( CLEAR ?auto_23889 ) ( not ( = ?auto_23874 ?auto_23887 ) ) ( not ( = ?auto_23875 ?auto_23887 ) ) ( not ( = ?auto_23873 ?auto_23887 ) ) ( not ( = ?auto_23884 ?auto_23887 ) ) ( not ( = ?auto_23881 ?auto_23887 ) ) ( not ( = ?auto_23877 ?auto_23887 ) ) ( not ( = ?auto_23891 ?auto_23887 ) ) ( not ( = ?auto_23889 ?auto_23887 ) ) ( not ( = ?auto_23880 ?auto_23887 ) ) ( not ( = ?auto_23885 ?auto_23887 ) ) ( TRUCK-AT ?auto_23888 ?auto_23878 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23874 ?auto_23875 )
      ( MAKE-2CRATE-VERIFY ?auto_23873 ?auto_23874 ?auto_23875 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_23893 - SURFACE
      ?auto_23894 - SURFACE
      ?auto_23895 - SURFACE
      ?auto_23896 - SURFACE
    )
    :vars
    (
      ?auto_23898 - HOIST
      ?auto_23908 - PLACE
      ?auto_23911 - PLACE
      ?auto_23906 - HOIST
      ?auto_23909 - SURFACE
      ?auto_23901 - PLACE
      ?auto_23912 - HOIST
      ?auto_23905 - SURFACE
      ?auto_23910 - SURFACE
      ?auto_23899 - SURFACE
      ?auto_23904 - PLACE
      ?auto_23897 - HOIST
      ?auto_23907 - SURFACE
      ?auto_23903 - SURFACE
      ?auto_23902 - SURFACE
      ?auto_23900 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23898 ?auto_23908 ) ( IS-CRATE ?auto_23896 ) ( not ( = ?auto_23895 ?auto_23896 ) ) ( not ( = ?auto_23894 ?auto_23895 ) ) ( not ( = ?auto_23894 ?auto_23896 ) ) ( not ( = ?auto_23911 ?auto_23908 ) ) ( HOIST-AT ?auto_23906 ?auto_23911 ) ( not ( = ?auto_23898 ?auto_23906 ) ) ( SURFACE-AT ?auto_23896 ?auto_23911 ) ( ON ?auto_23896 ?auto_23909 ) ( CLEAR ?auto_23896 ) ( not ( = ?auto_23895 ?auto_23909 ) ) ( not ( = ?auto_23896 ?auto_23909 ) ) ( not ( = ?auto_23894 ?auto_23909 ) ) ( IS-CRATE ?auto_23895 ) ( not ( = ?auto_23901 ?auto_23908 ) ) ( not ( = ?auto_23911 ?auto_23901 ) ) ( HOIST-AT ?auto_23912 ?auto_23901 ) ( not ( = ?auto_23898 ?auto_23912 ) ) ( not ( = ?auto_23906 ?auto_23912 ) ) ( AVAILABLE ?auto_23912 ) ( SURFACE-AT ?auto_23895 ?auto_23901 ) ( ON ?auto_23895 ?auto_23905 ) ( CLEAR ?auto_23895 ) ( not ( = ?auto_23895 ?auto_23905 ) ) ( not ( = ?auto_23896 ?auto_23905 ) ) ( not ( = ?auto_23894 ?auto_23905 ) ) ( not ( = ?auto_23909 ?auto_23905 ) ) ( IS-CRATE ?auto_23894 ) ( not ( = ?auto_23893 ?auto_23894 ) ) ( not ( = ?auto_23895 ?auto_23893 ) ) ( not ( = ?auto_23896 ?auto_23893 ) ) ( not ( = ?auto_23909 ?auto_23893 ) ) ( not ( = ?auto_23905 ?auto_23893 ) ) ( SURFACE-AT ?auto_23894 ?auto_23911 ) ( ON ?auto_23894 ?auto_23910 ) ( CLEAR ?auto_23894 ) ( not ( = ?auto_23895 ?auto_23910 ) ) ( not ( = ?auto_23896 ?auto_23910 ) ) ( not ( = ?auto_23894 ?auto_23910 ) ) ( not ( = ?auto_23909 ?auto_23910 ) ) ( not ( = ?auto_23905 ?auto_23910 ) ) ( not ( = ?auto_23893 ?auto_23910 ) ) ( IS-CRATE ?auto_23893 ) ( not ( = ?auto_23899 ?auto_23893 ) ) ( not ( = ?auto_23895 ?auto_23899 ) ) ( not ( = ?auto_23896 ?auto_23899 ) ) ( not ( = ?auto_23894 ?auto_23899 ) ) ( not ( = ?auto_23909 ?auto_23899 ) ) ( not ( = ?auto_23905 ?auto_23899 ) ) ( not ( = ?auto_23910 ?auto_23899 ) ) ( not ( = ?auto_23904 ?auto_23908 ) ) ( not ( = ?auto_23911 ?auto_23904 ) ) ( not ( = ?auto_23901 ?auto_23904 ) ) ( HOIST-AT ?auto_23897 ?auto_23904 ) ( not ( = ?auto_23898 ?auto_23897 ) ) ( not ( = ?auto_23906 ?auto_23897 ) ) ( not ( = ?auto_23912 ?auto_23897 ) ) ( AVAILABLE ?auto_23897 ) ( SURFACE-AT ?auto_23893 ?auto_23904 ) ( ON ?auto_23893 ?auto_23907 ) ( CLEAR ?auto_23893 ) ( not ( = ?auto_23895 ?auto_23907 ) ) ( not ( = ?auto_23896 ?auto_23907 ) ) ( not ( = ?auto_23894 ?auto_23907 ) ) ( not ( = ?auto_23909 ?auto_23907 ) ) ( not ( = ?auto_23905 ?auto_23907 ) ) ( not ( = ?auto_23893 ?auto_23907 ) ) ( not ( = ?auto_23910 ?auto_23907 ) ) ( not ( = ?auto_23899 ?auto_23907 ) ) ( SURFACE-AT ?auto_23903 ?auto_23908 ) ( CLEAR ?auto_23903 ) ( IS-CRATE ?auto_23899 ) ( not ( = ?auto_23903 ?auto_23899 ) ) ( not ( = ?auto_23895 ?auto_23903 ) ) ( not ( = ?auto_23896 ?auto_23903 ) ) ( not ( = ?auto_23894 ?auto_23903 ) ) ( not ( = ?auto_23909 ?auto_23903 ) ) ( not ( = ?auto_23905 ?auto_23903 ) ) ( not ( = ?auto_23893 ?auto_23903 ) ) ( not ( = ?auto_23910 ?auto_23903 ) ) ( not ( = ?auto_23907 ?auto_23903 ) ) ( AVAILABLE ?auto_23898 ) ( AVAILABLE ?auto_23906 ) ( SURFACE-AT ?auto_23899 ?auto_23911 ) ( ON ?auto_23899 ?auto_23902 ) ( CLEAR ?auto_23899 ) ( not ( = ?auto_23895 ?auto_23902 ) ) ( not ( = ?auto_23896 ?auto_23902 ) ) ( not ( = ?auto_23894 ?auto_23902 ) ) ( not ( = ?auto_23909 ?auto_23902 ) ) ( not ( = ?auto_23905 ?auto_23902 ) ) ( not ( = ?auto_23893 ?auto_23902 ) ) ( not ( = ?auto_23910 ?auto_23902 ) ) ( not ( = ?auto_23899 ?auto_23902 ) ) ( not ( = ?auto_23907 ?auto_23902 ) ) ( not ( = ?auto_23903 ?auto_23902 ) ) ( TRUCK-AT ?auto_23900 ?auto_23908 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23894 ?auto_23895 ?auto_23896 )
      ( MAKE-3CRATE-VERIFY ?auto_23893 ?auto_23894 ?auto_23895 ?auto_23896 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_23913 - SURFACE
      ?auto_23914 - SURFACE
      ?auto_23915 - SURFACE
      ?auto_23916 - SURFACE
      ?auto_23917 - SURFACE
    )
    :vars
    (
      ?auto_23919 - HOIST
      ?auto_23928 - PLACE
      ?auto_23931 - PLACE
      ?auto_23926 - HOIST
      ?auto_23929 - SURFACE
      ?auto_23921 - PLACE
      ?auto_23932 - HOIST
      ?auto_23925 - SURFACE
      ?auto_23930 - SURFACE
      ?auto_23924 - PLACE
      ?auto_23918 - HOIST
      ?auto_23927 - SURFACE
      ?auto_23923 - SURFACE
      ?auto_23922 - SURFACE
      ?auto_23920 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23919 ?auto_23928 ) ( IS-CRATE ?auto_23917 ) ( not ( = ?auto_23916 ?auto_23917 ) ) ( not ( = ?auto_23915 ?auto_23916 ) ) ( not ( = ?auto_23915 ?auto_23917 ) ) ( not ( = ?auto_23931 ?auto_23928 ) ) ( HOIST-AT ?auto_23926 ?auto_23931 ) ( not ( = ?auto_23919 ?auto_23926 ) ) ( SURFACE-AT ?auto_23917 ?auto_23931 ) ( ON ?auto_23917 ?auto_23929 ) ( CLEAR ?auto_23917 ) ( not ( = ?auto_23916 ?auto_23929 ) ) ( not ( = ?auto_23917 ?auto_23929 ) ) ( not ( = ?auto_23915 ?auto_23929 ) ) ( IS-CRATE ?auto_23916 ) ( not ( = ?auto_23921 ?auto_23928 ) ) ( not ( = ?auto_23931 ?auto_23921 ) ) ( HOIST-AT ?auto_23932 ?auto_23921 ) ( not ( = ?auto_23919 ?auto_23932 ) ) ( not ( = ?auto_23926 ?auto_23932 ) ) ( AVAILABLE ?auto_23932 ) ( SURFACE-AT ?auto_23916 ?auto_23921 ) ( ON ?auto_23916 ?auto_23925 ) ( CLEAR ?auto_23916 ) ( not ( = ?auto_23916 ?auto_23925 ) ) ( not ( = ?auto_23917 ?auto_23925 ) ) ( not ( = ?auto_23915 ?auto_23925 ) ) ( not ( = ?auto_23929 ?auto_23925 ) ) ( IS-CRATE ?auto_23915 ) ( not ( = ?auto_23914 ?auto_23915 ) ) ( not ( = ?auto_23916 ?auto_23914 ) ) ( not ( = ?auto_23917 ?auto_23914 ) ) ( not ( = ?auto_23929 ?auto_23914 ) ) ( not ( = ?auto_23925 ?auto_23914 ) ) ( SURFACE-AT ?auto_23915 ?auto_23931 ) ( ON ?auto_23915 ?auto_23930 ) ( CLEAR ?auto_23915 ) ( not ( = ?auto_23916 ?auto_23930 ) ) ( not ( = ?auto_23917 ?auto_23930 ) ) ( not ( = ?auto_23915 ?auto_23930 ) ) ( not ( = ?auto_23929 ?auto_23930 ) ) ( not ( = ?auto_23925 ?auto_23930 ) ) ( not ( = ?auto_23914 ?auto_23930 ) ) ( IS-CRATE ?auto_23914 ) ( not ( = ?auto_23913 ?auto_23914 ) ) ( not ( = ?auto_23916 ?auto_23913 ) ) ( not ( = ?auto_23917 ?auto_23913 ) ) ( not ( = ?auto_23915 ?auto_23913 ) ) ( not ( = ?auto_23929 ?auto_23913 ) ) ( not ( = ?auto_23925 ?auto_23913 ) ) ( not ( = ?auto_23930 ?auto_23913 ) ) ( not ( = ?auto_23924 ?auto_23928 ) ) ( not ( = ?auto_23931 ?auto_23924 ) ) ( not ( = ?auto_23921 ?auto_23924 ) ) ( HOIST-AT ?auto_23918 ?auto_23924 ) ( not ( = ?auto_23919 ?auto_23918 ) ) ( not ( = ?auto_23926 ?auto_23918 ) ) ( not ( = ?auto_23932 ?auto_23918 ) ) ( AVAILABLE ?auto_23918 ) ( SURFACE-AT ?auto_23914 ?auto_23924 ) ( ON ?auto_23914 ?auto_23927 ) ( CLEAR ?auto_23914 ) ( not ( = ?auto_23916 ?auto_23927 ) ) ( not ( = ?auto_23917 ?auto_23927 ) ) ( not ( = ?auto_23915 ?auto_23927 ) ) ( not ( = ?auto_23929 ?auto_23927 ) ) ( not ( = ?auto_23925 ?auto_23927 ) ) ( not ( = ?auto_23914 ?auto_23927 ) ) ( not ( = ?auto_23930 ?auto_23927 ) ) ( not ( = ?auto_23913 ?auto_23927 ) ) ( SURFACE-AT ?auto_23923 ?auto_23928 ) ( CLEAR ?auto_23923 ) ( IS-CRATE ?auto_23913 ) ( not ( = ?auto_23923 ?auto_23913 ) ) ( not ( = ?auto_23916 ?auto_23923 ) ) ( not ( = ?auto_23917 ?auto_23923 ) ) ( not ( = ?auto_23915 ?auto_23923 ) ) ( not ( = ?auto_23929 ?auto_23923 ) ) ( not ( = ?auto_23925 ?auto_23923 ) ) ( not ( = ?auto_23914 ?auto_23923 ) ) ( not ( = ?auto_23930 ?auto_23923 ) ) ( not ( = ?auto_23927 ?auto_23923 ) ) ( AVAILABLE ?auto_23919 ) ( AVAILABLE ?auto_23926 ) ( SURFACE-AT ?auto_23913 ?auto_23931 ) ( ON ?auto_23913 ?auto_23922 ) ( CLEAR ?auto_23913 ) ( not ( = ?auto_23916 ?auto_23922 ) ) ( not ( = ?auto_23917 ?auto_23922 ) ) ( not ( = ?auto_23915 ?auto_23922 ) ) ( not ( = ?auto_23929 ?auto_23922 ) ) ( not ( = ?auto_23925 ?auto_23922 ) ) ( not ( = ?auto_23914 ?auto_23922 ) ) ( not ( = ?auto_23930 ?auto_23922 ) ) ( not ( = ?auto_23913 ?auto_23922 ) ) ( not ( = ?auto_23927 ?auto_23922 ) ) ( not ( = ?auto_23923 ?auto_23922 ) ) ( TRUCK-AT ?auto_23920 ?auto_23928 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23915 ?auto_23916 ?auto_23917 )
      ( MAKE-4CRATE-VERIFY ?auto_23913 ?auto_23914 ?auto_23915 ?auto_23916 ?auto_23917 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23933 - SURFACE
      ?auto_23934 - SURFACE
      ?auto_23935 - SURFACE
      ?auto_23936 - SURFACE
      ?auto_23937 - SURFACE
      ?auto_23938 - SURFACE
    )
    :vars
    (
      ?auto_23940 - HOIST
      ?auto_23948 - PLACE
      ?auto_23951 - PLACE
      ?auto_23946 - HOIST
      ?auto_23949 - SURFACE
      ?auto_23942 - PLACE
      ?auto_23952 - HOIST
      ?auto_23945 - SURFACE
      ?auto_23950 - SURFACE
      ?auto_23944 - PLACE
      ?auto_23939 - HOIST
      ?auto_23947 - SURFACE
      ?auto_23943 - SURFACE
      ?auto_23941 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23940 ?auto_23948 ) ( IS-CRATE ?auto_23938 ) ( not ( = ?auto_23937 ?auto_23938 ) ) ( not ( = ?auto_23936 ?auto_23937 ) ) ( not ( = ?auto_23936 ?auto_23938 ) ) ( not ( = ?auto_23951 ?auto_23948 ) ) ( HOIST-AT ?auto_23946 ?auto_23951 ) ( not ( = ?auto_23940 ?auto_23946 ) ) ( SURFACE-AT ?auto_23938 ?auto_23951 ) ( ON ?auto_23938 ?auto_23949 ) ( CLEAR ?auto_23938 ) ( not ( = ?auto_23937 ?auto_23949 ) ) ( not ( = ?auto_23938 ?auto_23949 ) ) ( not ( = ?auto_23936 ?auto_23949 ) ) ( IS-CRATE ?auto_23937 ) ( not ( = ?auto_23942 ?auto_23948 ) ) ( not ( = ?auto_23951 ?auto_23942 ) ) ( HOIST-AT ?auto_23952 ?auto_23942 ) ( not ( = ?auto_23940 ?auto_23952 ) ) ( not ( = ?auto_23946 ?auto_23952 ) ) ( AVAILABLE ?auto_23952 ) ( SURFACE-AT ?auto_23937 ?auto_23942 ) ( ON ?auto_23937 ?auto_23945 ) ( CLEAR ?auto_23937 ) ( not ( = ?auto_23937 ?auto_23945 ) ) ( not ( = ?auto_23938 ?auto_23945 ) ) ( not ( = ?auto_23936 ?auto_23945 ) ) ( not ( = ?auto_23949 ?auto_23945 ) ) ( IS-CRATE ?auto_23936 ) ( not ( = ?auto_23935 ?auto_23936 ) ) ( not ( = ?auto_23937 ?auto_23935 ) ) ( not ( = ?auto_23938 ?auto_23935 ) ) ( not ( = ?auto_23949 ?auto_23935 ) ) ( not ( = ?auto_23945 ?auto_23935 ) ) ( SURFACE-AT ?auto_23936 ?auto_23951 ) ( ON ?auto_23936 ?auto_23950 ) ( CLEAR ?auto_23936 ) ( not ( = ?auto_23937 ?auto_23950 ) ) ( not ( = ?auto_23938 ?auto_23950 ) ) ( not ( = ?auto_23936 ?auto_23950 ) ) ( not ( = ?auto_23949 ?auto_23950 ) ) ( not ( = ?auto_23945 ?auto_23950 ) ) ( not ( = ?auto_23935 ?auto_23950 ) ) ( IS-CRATE ?auto_23935 ) ( not ( = ?auto_23934 ?auto_23935 ) ) ( not ( = ?auto_23937 ?auto_23934 ) ) ( not ( = ?auto_23938 ?auto_23934 ) ) ( not ( = ?auto_23936 ?auto_23934 ) ) ( not ( = ?auto_23949 ?auto_23934 ) ) ( not ( = ?auto_23945 ?auto_23934 ) ) ( not ( = ?auto_23950 ?auto_23934 ) ) ( not ( = ?auto_23944 ?auto_23948 ) ) ( not ( = ?auto_23951 ?auto_23944 ) ) ( not ( = ?auto_23942 ?auto_23944 ) ) ( HOIST-AT ?auto_23939 ?auto_23944 ) ( not ( = ?auto_23940 ?auto_23939 ) ) ( not ( = ?auto_23946 ?auto_23939 ) ) ( not ( = ?auto_23952 ?auto_23939 ) ) ( AVAILABLE ?auto_23939 ) ( SURFACE-AT ?auto_23935 ?auto_23944 ) ( ON ?auto_23935 ?auto_23947 ) ( CLEAR ?auto_23935 ) ( not ( = ?auto_23937 ?auto_23947 ) ) ( not ( = ?auto_23938 ?auto_23947 ) ) ( not ( = ?auto_23936 ?auto_23947 ) ) ( not ( = ?auto_23949 ?auto_23947 ) ) ( not ( = ?auto_23945 ?auto_23947 ) ) ( not ( = ?auto_23935 ?auto_23947 ) ) ( not ( = ?auto_23950 ?auto_23947 ) ) ( not ( = ?auto_23934 ?auto_23947 ) ) ( SURFACE-AT ?auto_23933 ?auto_23948 ) ( CLEAR ?auto_23933 ) ( IS-CRATE ?auto_23934 ) ( not ( = ?auto_23933 ?auto_23934 ) ) ( not ( = ?auto_23937 ?auto_23933 ) ) ( not ( = ?auto_23938 ?auto_23933 ) ) ( not ( = ?auto_23936 ?auto_23933 ) ) ( not ( = ?auto_23949 ?auto_23933 ) ) ( not ( = ?auto_23945 ?auto_23933 ) ) ( not ( = ?auto_23935 ?auto_23933 ) ) ( not ( = ?auto_23950 ?auto_23933 ) ) ( not ( = ?auto_23947 ?auto_23933 ) ) ( AVAILABLE ?auto_23940 ) ( AVAILABLE ?auto_23946 ) ( SURFACE-AT ?auto_23934 ?auto_23951 ) ( ON ?auto_23934 ?auto_23943 ) ( CLEAR ?auto_23934 ) ( not ( = ?auto_23937 ?auto_23943 ) ) ( not ( = ?auto_23938 ?auto_23943 ) ) ( not ( = ?auto_23936 ?auto_23943 ) ) ( not ( = ?auto_23949 ?auto_23943 ) ) ( not ( = ?auto_23945 ?auto_23943 ) ) ( not ( = ?auto_23935 ?auto_23943 ) ) ( not ( = ?auto_23950 ?auto_23943 ) ) ( not ( = ?auto_23934 ?auto_23943 ) ) ( not ( = ?auto_23947 ?auto_23943 ) ) ( not ( = ?auto_23933 ?auto_23943 ) ) ( TRUCK-AT ?auto_23941 ?auto_23948 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23936 ?auto_23937 ?auto_23938 )
      ( MAKE-5CRATE-VERIFY ?auto_23933 ?auto_23934 ?auto_23935 ?auto_23936 ?auto_23937 ?auto_23938 ) )
  )

)

