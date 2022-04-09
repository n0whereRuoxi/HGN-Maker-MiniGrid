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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347779 - SURFACE
      ?auto_347780 - SURFACE
    )
    :vars
    (
      ?auto_347781 - HOIST
      ?auto_347782 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_347781 ?auto_347782 ) ( SURFACE-AT ?auto_347779 ?auto_347782 ) ( CLEAR ?auto_347779 ) ( LIFTING ?auto_347781 ?auto_347780 ) ( IS-CRATE ?auto_347780 ) ( not ( = ?auto_347779 ?auto_347780 ) ) )
    :subtasks
    ( ( !DROP ?auto_347781 ?auto_347780 ?auto_347779 ?auto_347782 )
      ( MAKE-1CRATE-VERIFY ?auto_347779 ?auto_347780 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347783 - SURFACE
      ?auto_347784 - SURFACE
    )
    :vars
    (
      ?auto_347786 - HOIST
      ?auto_347785 - PLACE
      ?auto_347787 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_347786 ?auto_347785 ) ( SURFACE-AT ?auto_347783 ?auto_347785 ) ( CLEAR ?auto_347783 ) ( IS-CRATE ?auto_347784 ) ( not ( = ?auto_347783 ?auto_347784 ) ) ( TRUCK-AT ?auto_347787 ?auto_347785 ) ( AVAILABLE ?auto_347786 ) ( IN ?auto_347784 ?auto_347787 ) )
    :subtasks
    ( ( !UNLOAD ?auto_347786 ?auto_347784 ?auto_347787 ?auto_347785 )
      ( MAKE-1CRATE ?auto_347783 ?auto_347784 )
      ( MAKE-1CRATE-VERIFY ?auto_347783 ?auto_347784 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347788 - SURFACE
      ?auto_347789 - SURFACE
    )
    :vars
    (
      ?auto_347791 - HOIST
      ?auto_347790 - PLACE
      ?auto_347792 - TRUCK
      ?auto_347793 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_347791 ?auto_347790 ) ( SURFACE-AT ?auto_347788 ?auto_347790 ) ( CLEAR ?auto_347788 ) ( IS-CRATE ?auto_347789 ) ( not ( = ?auto_347788 ?auto_347789 ) ) ( AVAILABLE ?auto_347791 ) ( IN ?auto_347789 ?auto_347792 ) ( TRUCK-AT ?auto_347792 ?auto_347793 ) ( not ( = ?auto_347793 ?auto_347790 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_347792 ?auto_347793 ?auto_347790 )
      ( MAKE-1CRATE ?auto_347788 ?auto_347789 )
      ( MAKE-1CRATE-VERIFY ?auto_347788 ?auto_347789 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347794 - SURFACE
      ?auto_347795 - SURFACE
    )
    :vars
    (
      ?auto_347799 - HOIST
      ?auto_347798 - PLACE
      ?auto_347797 - TRUCK
      ?auto_347796 - PLACE
      ?auto_347800 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_347799 ?auto_347798 ) ( SURFACE-AT ?auto_347794 ?auto_347798 ) ( CLEAR ?auto_347794 ) ( IS-CRATE ?auto_347795 ) ( not ( = ?auto_347794 ?auto_347795 ) ) ( AVAILABLE ?auto_347799 ) ( TRUCK-AT ?auto_347797 ?auto_347796 ) ( not ( = ?auto_347796 ?auto_347798 ) ) ( HOIST-AT ?auto_347800 ?auto_347796 ) ( LIFTING ?auto_347800 ?auto_347795 ) ( not ( = ?auto_347799 ?auto_347800 ) ) )
    :subtasks
    ( ( !LOAD ?auto_347800 ?auto_347795 ?auto_347797 ?auto_347796 )
      ( MAKE-1CRATE ?auto_347794 ?auto_347795 )
      ( MAKE-1CRATE-VERIFY ?auto_347794 ?auto_347795 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347801 - SURFACE
      ?auto_347802 - SURFACE
    )
    :vars
    (
      ?auto_347806 - HOIST
      ?auto_347804 - PLACE
      ?auto_347805 - TRUCK
      ?auto_347803 - PLACE
      ?auto_347807 - HOIST
      ?auto_347808 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_347806 ?auto_347804 ) ( SURFACE-AT ?auto_347801 ?auto_347804 ) ( CLEAR ?auto_347801 ) ( IS-CRATE ?auto_347802 ) ( not ( = ?auto_347801 ?auto_347802 ) ) ( AVAILABLE ?auto_347806 ) ( TRUCK-AT ?auto_347805 ?auto_347803 ) ( not ( = ?auto_347803 ?auto_347804 ) ) ( HOIST-AT ?auto_347807 ?auto_347803 ) ( not ( = ?auto_347806 ?auto_347807 ) ) ( AVAILABLE ?auto_347807 ) ( SURFACE-AT ?auto_347802 ?auto_347803 ) ( ON ?auto_347802 ?auto_347808 ) ( CLEAR ?auto_347802 ) ( not ( = ?auto_347801 ?auto_347808 ) ) ( not ( = ?auto_347802 ?auto_347808 ) ) )
    :subtasks
    ( ( !LIFT ?auto_347807 ?auto_347802 ?auto_347808 ?auto_347803 )
      ( MAKE-1CRATE ?auto_347801 ?auto_347802 )
      ( MAKE-1CRATE-VERIFY ?auto_347801 ?auto_347802 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347809 - SURFACE
      ?auto_347810 - SURFACE
    )
    :vars
    (
      ?auto_347814 - HOIST
      ?auto_347813 - PLACE
      ?auto_347811 - PLACE
      ?auto_347816 - HOIST
      ?auto_347812 - SURFACE
      ?auto_347815 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_347814 ?auto_347813 ) ( SURFACE-AT ?auto_347809 ?auto_347813 ) ( CLEAR ?auto_347809 ) ( IS-CRATE ?auto_347810 ) ( not ( = ?auto_347809 ?auto_347810 ) ) ( AVAILABLE ?auto_347814 ) ( not ( = ?auto_347811 ?auto_347813 ) ) ( HOIST-AT ?auto_347816 ?auto_347811 ) ( not ( = ?auto_347814 ?auto_347816 ) ) ( AVAILABLE ?auto_347816 ) ( SURFACE-AT ?auto_347810 ?auto_347811 ) ( ON ?auto_347810 ?auto_347812 ) ( CLEAR ?auto_347810 ) ( not ( = ?auto_347809 ?auto_347812 ) ) ( not ( = ?auto_347810 ?auto_347812 ) ) ( TRUCK-AT ?auto_347815 ?auto_347813 ) )
    :subtasks
    ( ( !DRIVE ?auto_347815 ?auto_347813 ?auto_347811 )
      ( MAKE-1CRATE ?auto_347809 ?auto_347810 )
      ( MAKE-1CRATE-VERIFY ?auto_347809 ?auto_347810 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_347826 - SURFACE
      ?auto_347827 - SURFACE
      ?auto_347828 - SURFACE
    )
    :vars
    (
      ?auto_347830 - HOIST
      ?auto_347829 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_347830 ?auto_347829 ) ( SURFACE-AT ?auto_347827 ?auto_347829 ) ( CLEAR ?auto_347827 ) ( LIFTING ?auto_347830 ?auto_347828 ) ( IS-CRATE ?auto_347828 ) ( not ( = ?auto_347827 ?auto_347828 ) ) ( ON ?auto_347827 ?auto_347826 ) ( not ( = ?auto_347826 ?auto_347827 ) ) ( not ( = ?auto_347826 ?auto_347828 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_347827 ?auto_347828 )
      ( MAKE-2CRATE-VERIFY ?auto_347826 ?auto_347827 ?auto_347828 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_347836 - SURFACE
      ?auto_347837 - SURFACE
      ?auto_347838 - SURFACE
    )
    :vars
    (
      ?auto_347841 - HOIST
      ?auto_347839 - PLACE
      ?auto_347840 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_347841 ?auto_347839 ) ( SURFACE-AT ?auto_347837 ?auto_347839 ) ( CLEAR ?auto_347837 ) ( IS-CRATE ?auto_347838 ) ( not ( = ?auto_347837 ?auto_347838 ) ) ( TRUCK-AT ?auto_347840 ?auto_347839 ) ( AVAILABLE ?auto_347841 ) ( IN ?auto_347838 ?auto_347840 ) ( ON ?auto_347837 ?auto_347836 ) ( not ( = ?auto_347836 ?auto_347837 ) ) ( not ( = ?auto_347836 ?auto_347838 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_347837 ?auto_347838 )
      ( MAKE-2CRATE-VERIFY ?auto_347836 ?auto_347837 ?auto_347838 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347842 - SURFACE
      ?auto_347843 - SURFACE
    )
    :vars
    (
      ?auto_347844 - HOIST
      ?auto_347847 - PLACE
      ?auto_347845 - TRUCK
      ?auto_347846 - SURFACE
      ?auto_347848 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_347844 ?auto_347847 ) ( SURFACE-AT ?auto_347842 ?auto_347847 ) ( CLEAR ?auto_347842 ) ( IS-CRATE ?auto_347843 ) ( not ( = ?auto_347842 ?auto_347843 ) ) ( AVAILABLE ?auto_347844 ) ( IN ?auto_347843 ?auto_347845 ) ( ON ?auto_347842 ?auto_347846 ) ( not ( = ?auto_347846 ?auto_347842 ) ) ( not ( = ?auto_347846 ?auto_347843 ) ) ( TRUCK-AT ?auto_347845 ?auto_347848 ) ( not ( = ?auto_347848 ?auto_347847 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_347845 ?auto_347848 ?auto_347847 )
      ( MAKE-2CRATE ?auto_347846 ?auto_347842 ?auto_347843 )
      ( MAKE-1CRATE-VERIFY ?auto_347842 ?auto_347843 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_347849 - SURFACE
      ?auto_347850 - SURFACE
      ?auto_347851 - SURFACE
    )
    :vars
    (
      ?auto_347854 - HOIST
      ?auto_347852 - PLACE
      ?auto_347853 - TRUCK
      ?auto_347855 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_347854 ?auto_347852 ) ( SURFACE-AT ?auto_347850 ?auto_347852 ) ( CLEAR ?auto_347850 ) ( IS-CRATE ?auto_347851 ) ( not ( = ?auto_347850 ?auto_347851 ) ) ( AVAILABLE ?auto_347854 ) ( IN ?auto_347851 ?auto_347853 ) ( ON ?auto_347850 ?auto_347849 ) ( not ( = ?auto_347849 ?auto_347850 ) ) ( not ( = ?auto_347849 ?auto_347851 ) ) ( TRUCK-AT ?auto_347853 ?auto_347855 ) ( not ( = ?auto_347855 ?auto_347852 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_347850 ?auto_347851 )
      ( MAKE-2CRATE-VERIFY ?auto_347849 ?auto_347850 ?auto_347851 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347856 - SURFACE
      ?auto_347857 - SURFACE
    )
    :vars
    (
      ?auto_347861 - HOIST
      ?auto_347858 - PLACE
      ?auto_347859 - SURFACE
      ?auto_347860 - TRUCK
      ?auto_347862 - PLACE
      ?auto_347863 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_347861 ?auto_347858 ) ( SURFACE-AT ?auto_347856 ?auto_347858 ) ( CLEAR ?auto_347856 ) ( IS-CRATE ?auto_347857 ) ( not ( = ?auto_347856 ?auto_347857 ) ) ( AVAILABLE ?auto_347861 ) ( ON ?auto_347856 ?auto_347859 ) ( not ( = ?auto_347859 ?auto_347856 ) ) ( not ( = ?auto_347859 ?auto_347857 ) ) ( TRUCK-AT ?auto_347860 ?auto_347862 ) ( not ( = ?auto_347862 ?auto_347858 ) ) ( HOIST-AT ?auto_347863 ?auto_347862 ) ( LIFTING ?auto_347863 ?auto_347857 ) ( not ( = ?auto_347861 ?auto_347863 ) ) )
    :subtasks
    ( ( !LOAD ?auto_347863 ?auto_347857 ?auto_347860 ?auto_347862 )
      ( MAKE-2CRATE ?auto_347859 ?auto_347856 ?auto_347857 )
      ( MAKE-1CRATE-VERIFY ?auto_347856 ?auto_347857 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_347864 - SURFACE
      ?auto_347865 - SURFACE
      ?auto_347866 - SURFACE
    )
    :vars
    (
      ?auto_347868 - HOIST
      ?auto_347871 - PLACE
      ?auto_347870 - TRUCK
      ?auto_347869 - PLACE
      ?auto_347867 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_347868 ?auto_347871 ) ( SURFACE-AT ?auto_347865 ?auto_347871 ) ( CLEAR ?auto_347865 ) ( IS-CRATE ?auto_347866 ) ( not ( = ?auto_347865 ?auto_347866 ) ) ( AVAILABLE ?auto_347868 ) ( ON ?auto_347865 ?auto_347864 ) ( not ( = ?auto_347864 ?auto_347865 ) ) ( not ( = ?auto_347864 ?auto_347866 ) ) ( TRUCK-AT ?auto_347870 ?auto_347869 ) ( not ( = ?auto_347869 ?auto_347871 ) ) ( HOIST-AT ?auto_347867 ?auto_347869 ) ( LIFTING ?auto_347867 ?auto_347866 ) ( not ( = ?auto_347868 ?auto_347867 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_347865 ?auto_347866 )
      ( MAKE-2CRATE-VERIFY ?auto_347864 ?auto_347865 ?auto_347866 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347872 - SURFACE
      ?auto_347873 - SURFACE
    )
    :vars
    (
      ?auto_347878 - HOIST
      ?auto_347877 - PLACE
      ?auto_347875 - SURFACE
      ?auto_347874 - TRUCK
      ?auto_347879 - PLACE
      ?auto_347876 - HOIST
      ?auto_347880 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_347878 ?auto_347877 ) ( SURFACE-AT ?auto_347872 ?auto_347877 ) ( CLEAR ?auto_347872 ) ( IS-CRATE ?auto_347873 ) ( not ( = ?auto_347872 ?auto_347873 ) ) ( AVAILABLE ?auto_347878 ) ( ON ?auto_347872 ?auto_347875 ) ( not ( = ?auto_347875 ?auto_347872 ) ) ( not ( = ?auto_347875 ?auto_347873 ) ) ( TRUCK-AT ?auto_347874 ?auto_347879 ) ( not ( = ?auto_347879 ?auto_347877 ) ) ( HOIST-AT ?auto_347876 ?auto_347879 ) ( not ( = ?auto_347878 ?auto_347876 ) ) ( AVAILABLE ?auto_347876 ) ( SURFACE-AT ?auto_347873 ?auto_347879 ) ( ON ?auto_347873 ?auto_347880 ) ( CLEAR ?auto_347873 ) ( not ( = ?auto_347872 ?auto_347880 ) ) ( not ( = ?auto_347873 ?auto_347880 ) ) ( not ( = ?auto_347875 ?auto_347880 ) ) )
    :subtasks
    ( ( !LIFT ?auto_347876 ?auto_347873 ?auto_347880 ?auto_347879 )
      ( MAKE-2CRATE ?auto_347875 ?auto_347872 ?auto_347873 )
      ( MAKE-1CRATE-VERIFY ?auto_347872 ?auto_347873 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_347881 - SURFACE
      ?auto_347882 - SURFACE
      ?auto_347883 - SURFACE
    )
    :vars
    (
      ?auto_347884 - HOIST
      ?auto_347888 - PLACE
      ?auto_347887 - TRUCK
      ?auto_347886 - PLACE
      ?auto_347889 - HOIST
      ?auto_347885 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_347884 ?auto_347888 ) ( SURFACE-AT ?auto_347882 ?auto_347888 ) ( CLEAR ?auto_347882 ) ( IS-CRATE ?auto_347883 ) ( not ( = ?auto_347882 ?auto_347883 ) ) ( AVAILABLE ?auto_347884 ) ( ON ?auto_347882 ?auto_347881 ) ( not ( = ?auto_347881 ?auto_347882 ) ) ( not ( = ?auto_347881 ?auto_347883 ) ) ( TRUCK-AT ?auto_347887 ?auto_347886 ) ( not ( = ?auto_347886 ?auto_347888 ) ) ( HOIST-AT ?auto_347889 ?auto_347886 ) ( not ( = ?auto_347884 ?auto_347889 ) ) ( AVAILABLE ?auto_347889 ) ( SURFACE-AT ?auto_347883 ?auto_347886 ) ( ON ?auto_347883 ?auto_347885 ) ( CLEAR ?auto_347883 ) ( not ( = ?auto_347882 ?auto_347885 ) ) ( not ( = ?auto_347883 ?auto_347885 ) ) ( not ( = ?auto_347881 ?auto_347885 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_347882 ?auto_347883 )
      ( MAKE-2CRATE-VERIFY ?auto_347881 ?auto_347882 ?auto_347883 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347890 - SURFACE
      ?auto_347891 - SURFACE
    )
    :vars
    (
      ?auto_347892 - HOIST
      ?auto_347898 - PLACE
      ?auto_347896 - SURFACE
      ?auto_347895 - PLACE
      ?auto_347894 - HOIST
      ?auto_347897 - SURFACE
      ?auto_347893 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_347892 ?auto_347898 ) ( SURFACE-AT ?auto_347890 ?auto_347898 ) ( CLEAR ?auto_347890 ) ( IS-CRATE ?auto_347891 ) ( not ( = ?auto_347890 ?auto_347891 ) ) ( AVAILABLE ?auto_347892 ) ( ON ?auto_347890 ?auto_347896 ) ( not ( = ?auto_347896 ?auto_347890 ) ) ( not ( = ?auto_347896 ?auto_347891 ) ) ( not ( = ?auto_347895 ?auto_347898 ) ) ( HOIST-AT ?auto_347894 ?auto_347895 ) ( not ( = ?auto_347892 ?auto_347894 ) ) ( AVAILABLE ?auto_347894 ) ( SURFACE-AT ?auto_347891 ?auto_347895 ) ( ON ?auto_347891 ?auto_347897 ) ( CLEAR ?auto_347891 ) ( not ( = ?auto_347890 ?auto_347897 ) ) ( not ( = ?auto_347891 ?auto_347897 ) ) ( not ( = ?auto_347896 ?auto_347897 ) ) ( TRUCK-AT ?auto_347893 ?auto_347898 ) )
    :subtasks
    ( ( !DRIVE ?auto_347893 ?auto_347898 ?auto_347895 )
      ( MAKE-2CRATE ?auto_347896 ?auto_347890 ?auto_347891 )
      ( MAKE-1CRATE-VERIFY ?auto_347890 ?auto_347891 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_347899 - SURFACE
      ?auto_347900 - SURFACE
      ?auto_347901 - SURFACE
    )
    :vars
    (
      ?auto_347903 - HOIST
      ?auto_347902 - PLACE
      ?auto_347905 - PLACE
      ?auto_347906 - HOIST
      ?auto_347907 - SURFACE
      ?auto_347904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_347903 ?auto_347902 ) ( SURFACE-AT ?auto_347900 ?auto_347902 ) ( CLEAR ?auto_347900 ) ( IS-CRATE ?auto_347901 ) ( not ( = ?auto_347900 ?auto_347901 ) ) ( AVAILABLE ?auto_347903 ) ( ON ?auto_347900 ?auto_347899 ) ( not ( = ?auto_347899 ?auto_347900 ) ) ( not ( = ?auto_347899 ?auto_347901 ) ) ( not ( = ?auto_347905 ?auto_347902 ) ) ( HOIST-AT ?auto_347906 ?auto_347905 ) ( not ( = ?auto_347903 ?auto_347906 ) ) ( AVAILABLE ?auto_347906 ) ( SURFACE-AT ?auto_347901 ?auto_347905 ) ( ON ?auto_347901 ?auto_347907 ) ( CLEAR ?auto_347901 ) ( not ( = ?auto_347900 ?auto_347907 ) ) ( not ( = ?auto_347901 ?auto_347907 ) ) ( not ( = ?auto_347899 ?auto_347907 ) ) ( TRUCK-AT ?auto_347904 ?auto_347902 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_347900 ?auto_347901 )
      ( MAKE-2CRATE-VERIFY ?auto_347899 ?auto_347900 ?auto_347901 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347908 - SURFACE
      ?auto_347909 - SURFACE
    )
    :vars
    (
      ?auto_347914 - HOIST
      ?auto_347916 - PLACE
      ?auto_347913 - SURFACE
      ?auto_347912 - PLACE
      ?auto_347911 - HOIST
      ?auto_347915 - SURFACE
      ?auto_347910 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_347914 ?auto_347916 ) ( IS-CRATE ?auto_347909 ) ( not ( = ?auto_347908 ?auto_347909 ) ) ( not ( = ?auto_347913 ?auto_347908 ) ) ( not ( = ?auto_347913 ?auto_347909 ) ) ( not ( = ?auto_347912 ?auto_347916 ) ) ( HOIST-AT ?auto_347911 ?auto_347912 ) ( not ( = ?auto_347914 ?auto_347911 ) ) ( AVAILABLE ?auto_347911 ) ( SURFACE-AT ?auto_347909 ?auto_347912 ) ( ON ?auto_347909 ?auto_347915 ) ( CLEAR ?auto_347909 ) ( not ( = ?auto_347908 ?auto_347915 ) ) ( not ( = ?auto_347909 ?auto_347915 ) ) ( not ( = ?auto_347913 ?auto_347915 ) ) ( TRUCK-AT ?auto_347910 ?auto_347916 ) ( SURFACE-AT ?auto_347913 ?auto_347916 ) ( CLEAR ?auto_347913 ) ( LIFTING ?auto_347914 ?auto_347908 ) ( IS-CRATE ?auto_347908 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_347913 ?auto_347908 )
      ( MAKE-2CRATE ?auto_347913 ?auto_347908 ?auto_347909 )
      ( MAKE-1CRATE-VERIFY ?auto_347908 ?auto_347909 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_347917 - SURFACE
      ?auto_347918 - SURFACE
      ?auto_347919 - SURFACE
    )
    :vars
    (
      ?auto_347922 - HOIST
      ?auto_347920 - PLACE
      ?auto_347921 - PLACE
      ?auto_347925 - HOIST
      ?auto_347924 - SURFACE
      ?auto_347923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_347922 ?auto_347920 ) ( IS-CRATE ?auto_347919 ) ( not ( = ?auto_347918 ?auto_347919 ) ) ( not ( = ?auto_347917 ?auto_347918 ) ) ( not ( = ?auto_347917 ?auto_347919 ) ) ( not ( = ?auto_347921 ?auto_347920 ) ) ( HOIST-AT ?auto_347925 ?auto_347921 ) ( not ( = ?auto_347922 ?auto_347925 ) ) ( AVAILABLE ?auto_347925 ) ( SURFACE-AT ?auto_347919 ?auto_347921 ) ( ON ?auto_347919 ?auto_347924 ) ( CLEAR ?auto_347919 ) ( not ( = ?auto_347918 ?auto_347924 ) ) ( not ( = ?auto_347919 ?auto_347924 ) ) ( not ( = ?auto_347917 ?auto_347924 ) ) ( TRUCK-AT ?auto_347923 ?auto_347920 ) ( SURFACE-AT ?auto_347917 ?auto_347920 ) ( CLEAR ?auto_347917 ) ( LIFTING ?auto_347922 ?auto_347918 ) ( IS-CRATE ?auto_347918 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_347918 ?auto_347919 )
      ( MAKE-2CRATE-VERIFY ?auto_347917 ?auto_347918 ?auto_347919 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347926 - SURFACE
      ?auto_347927 - SURFACE
    )
    :vars
    (
      ?auto_347931 - HOIST
      ?auto_347932 - PLACE
      ?auto_347928 - SURFACE
      ?auto_347930 - PLACE
      ?auto_347933 - HOIST
      ?auto_347934 - SURFACE
      ?auto_347929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_347931 ?auto_347932 ) ( IS-CRATE ?auto_347927 ) ( not ( = ?auto_347926 ?auto_347927 ) ) ( not ( = ?auto_347928 ?auto_347926 ) ) ( not ( = ?auto_347928 ?auto_347927 ) ) ( not ( = ?auto_347930 ?auto_347932 ) ) ( HOIST-AT ?auto_347933 ?auto_347930 ) ( not ( = ?auto_347931 ?auto_347933 ) ) ( AVAILABLE ?auto_347933 ) ( SURFACE-AT ?auto_347927 ?auto_347930 ) ( ON ?auto_347927 ?auto_347934 ) ( CLEAR ?auto_347927 ) ( not ( = ?auto_347926 ?auto_347934 ) ) ( not ( = ?auto_347927 ?auto_347934 ) ) ( not ( = ?auto_347928 ?auto_347934 ) ) ( TRUCK-AT ?auto_347929 ?auto_347932 ) ( SURFACE-AT ?auto_347928 ?auto_347932 ) ( CLEAR ?auto_347928 ) ( IS-CRATE ?auto_347926 ) ( AVAILABLE ?auto_347931 ) ( IN ?auto_347926 ?auto_347929 ) )
    :subtasks
    ( ( !UNLOAD ?auto_347931 ?auto_347926 ?auto_347929 ?auto_347932 )
      ( MAKE-2CRATE ?auto_347928 ?auto_347926 ?auto_347927 )
      ( MAKE-1CRATE-VERIFY ?auto_347926 ?auto_347927 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_347935 - SURFACE
      ?auto_347936 - SURFACE
      ?auto_347937 - SURFACE
    )
    :vars
    (
      ?auto_347938 - HOIST
      ?auto_347942 - PLACE
      ?auto_347940 - PLACE
      ?auto_347943 - HOIST
      ?auto_347941 - SURFACE
      ?auto_347939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_347938 ?auto_347942 ) ( IS-CRATE ?auto_347937 ) ( not ( = ?auto_347936 ?auto_347937 ) ) ( not ( = ?auto_347935 ?auto_347936 ) ) ( not ( = ?auto_347935 ?auto_347937 ) ) ( not ( = ?auto_347940 ?auto_347942 ) ) ( HOIST-AT ?auto_347943 ?auto_347940 ) ( not ( = ?auto_347938 ?auto_347943 ) ) ( AVAILABLE ?auto_347943 ) ( SURFACE-AT ?auto_347937 ?auto_347940 ) ( ON ?auto_347937 ?auto_347941 ) ( CLEAR ?auto_347937 ) ( not ( = ?auto_347936 ?auto_347941 ) ) ( not ( = ?auto_347937 ?auto_347941 ) ) ( not ( = ?auto_347935 ?auto_347941 ) ) ( TRUCK-AT ?auto_347939 ?auto_347942 ) ( SURFACE-AT ?auto_347935 ?auto_347942 ) ( CLEAR ?auto_347935 ) ( IS-CRATE ?auto_347936 ) ( AVAILABLE ?auto_347938 ) ( IN ?auto_347936 ?auto_347939 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_347936 ?auto_347937 )
      ( MAKE-2CRATE-VERIFY ?auto_347935 ?auto_347936 ?auto_347937 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347980 - SURFACE
      ?auto_347981 - SURFACE
    )
    :vars
    (
      ?auto_347984 - HOIST
      ?auto_347983 - PLACE
      ?auto_347982 - SURFACE
      ?auto_347986 - PLACE
      ?auto_347987 - HOIST
      ?auto_347988 - SURFACE
      ?auto_347985 - TRUCK
      ?auto_347989 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_347984 ?auto_347983 ) ( SURFACE-AT ?auto_347980 ?auto_347983 ) ( CLEAR ?auto_347980 ) ( IS-CRATE ?auto_347981 ) ( not ( = ?auto_347980 ?auto_347981 ) ) ( AVAILABLE ?auto_347984 ) ( ON ?auto_347980 ?auto_347982 ) ( not ( = ?auto_347982 ?auto_347980 ) ) ( not ( = ?auto_347982 ?auto_347981 ) ) ( not ( = ?auto_347986 ?auto_347983 ) ) ( HOIST-AT ?auto_347987 ?auto_347986 ) ( not ( = ?auto_347984 ?auto_347987 ) ) ( AVAILABLE ?auto_347987 ) ( SURFACE-AT ?auto_347981 ?auto_347986 ) ( ON ?auto_347981 ?auto_347988 ) ( CLEAR ?auto_347981 ) ( not ( = ?auto_347980 ?auto_347988 ) ) ( not ( = ?auto_347981 ?auto_347988 ) ) ( not ( = ?auto_347982 ?auto_347988 ) ) ( TRUCK-AT ?auto_347985 ?auto_347989 ) ( not ( = ?auto_347989 ?auto_347983 ) ) ( not ( = ?auto_347986 ?auto_347989 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_347985 ?auto_347989 ?auto_347983 )
      ( MAKE-1CRATE ?auto_347980 ?auto_347981 )
      ( MAKE-1CRATE-VERIFY ?auto_347980 ?auto_347981 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_348019 - SURFACE
      ?auto_348020 - SURFACE
      ?auto_348021 - SURFACE
      ?auto_348022 - SURFACE
    )
    :vars
    (
      ?auto_348024 - HOIST
      ?auto_348023 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348024 ?auto_348023 ) ( SURFACE-AT ?auto_348021 ?auto_348023 ) ( CLEAR ?auto_348021 ) ( LIFTING ?auto_348024 ?auto_348022 ) ( IS-CRATE ?auto_348022 ) ( not ( = ?auto_348021 ?auto_348022 ) ) ( ON ?auto_348020 ?auto_348019 ) ( ON ?auto_348021 ?auto_348020 ) ( not ( = ?auto_348019 ?auto_348020 ) ) ( not ( = ?auto_348019 ?auto_348021 ) ) ( not ( = ?auto_348019 ?auto_348022 ) ) ( not ( = ?auto_348020 ?auto_348021 ) ) ( not ( = ?auto_348020 ?auto_348022 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_348021 ?auto_348022 )
      ( MAKE-3CRATE-VERIFY ?auto_348019 ?auto_348020 ?auto_348021 ?auto_348022 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_348036 - SURFACE
      ?auto_348037 - SURFACE
      ?auto_348038 - SURFACE
      ?auto_348039 - SURFACE
    )
    :vars
    (
      ?auto_348040 - HOIST
      ?auto_348042 - PLACE
      ?auto_348041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348040 ?auto_348042 ) ( SURFACE-AT ?auto_348038 ?auto_348042 ) ( CLEAR ?auto_348038 ) ( IS-CRATE ?auto_348039 ) ( not ( = ?auto_348038 ?auto_348039 ) ) ( TRUCK-AT ?auto_348041 ?auto_348042 ) ( AVAILABLE ?auto_348040 ) ( IN ?auto_348039 ?auto_348041 ) ( ON ?auto_348038 ?auto_348037 ) ( not ( = ?auto_348037 ?auto_348038 ) ) ( not ( = ?auto_348037 ?auto_348039 ) ) ( ON ?auto_348037 ?auto_348036 ) ( not ( = ?auto_348036 ?auto_348037 ) ) ( not ( = ?auto_348036 ?auto_348038 ) ) ( not ( = ?auto_348036 ?auto_348039 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348037 ?auto_348038 ?auto_348039 )
      ( MAKE-3CRATE-VERIFY ?auto_348036 ?auto_348037 ?auto_348038 ?auto_348039 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_348057 - SURFACE
      ?auto_348058 - SURFACE
      ?auto_348059 - SURFACE
      ?auto_348060 - SURFACE
    )
    :vars
    (
      ?auto_348064 - HOIST
      ?auto_348061 - PLACE
      ?auto_348063 - TRUCK
      ?auto_348062 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348064 ?auto_348061 ) ( SURFACE-AT ?auto_348059 ?auto_348061 ) ( CLEAR ?auto_348059 ) ( IS-CRATE ?auto_348060 ) ( not ( = ?auto_348059 ?auto_348060 ) ) ( AVAILABLE ?auto_348064 ) ( IN ?auto_348060 ?auto_348063 ) ( ON ?auto_348059 ?auto_348058 ) ( not ( = ?auto_348058 ?auto_348059 ) ) ( not ( = ?auto_348058 ?auto_348060 ) ) ( TRUCK-AT ?auto_348063 ?auto_348062 ) ( not ( = ?auto_348062 ?auto_348061 ) ) ( ON ?auto_348058 ?auto_348057 ) ( not ( = ?auto_348057 ?auto_348058 ) ) ( not ( = ?auto_348057 ?auto_348059 ) ) ( not ( = ?auto_348057 ?auto_348060 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348058 ?auto_348059 ?auto_348060 )
      ( MAKE-3CRATE-VERIFY ?auto_348057 ?auto_348058 ?auto_348059 ?auto_348060 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_348081 - SURFACE
      ?auto_348082 - SURFACE
      ?auto_348083 - SURFACE
      ?auto_348084 - SURFACE
    )
    :vars
    (
      ?auto_348089 - HOIST
      ?auto_348087 - PLACE
      ?auto_348085 - TRUCK
      ?auto_348088 - PLACE
      ?auto_348086 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_348089 ?auto_348087 ) ( SURFACE-AT ?auto_348083 ?auto_348087 ) ( CLEAR ?auto_348083 ) ( IS-CRATE ?auto_348084 ) ( not ( = ?auto_348083 ?auto_348084 ) ) ( AVAILABLE ?auto_348089 ) ( ON ?auto_348083 ?auto_348082 ) ( not ( = ?auto_348082 ?auto_348083 ) ) ( not ( = ?auto_348082 ?auto_348084 ) ) ( TRUCK-AT ?auto_348085 ?auto_348088 ) ( not ( = ?auto_348088 ?auto_348087 ) ) ( HOIST-AT ?auto_348086 ?auto_348088 ) ( LIFTING ?auto_348086 ?auto_348084 ) ( not ( = ?auto_348089 ?auto_348086 ) ) ( ON ?auto_348082 ?auto_348081 ) ( not ( = ?auto_348081 ?auto_348082 ) ) ( not ( = ?auto_348081 ?auto_348083 ) ) ( not ( = ?auto_348081 ?auto_348084 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348082 ?auto_348083 ?auto_348084 )
      ( MAKE-3CRATE-VERIFY ?auto_348081 ?auto_348082 ?auto_348083 ?auto_348084 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_348108 - SURFACE
      ?auto_348109 - SURFACE
      ?auto_348110 - SURFACE
      ?auto_348111 - SURFACE
    )
    :vars
    (
      ?auto_348117 - HOIST
      ?auto_348113 - PLACE
      ?auto_348116 - TRUCK
      ?auto_348115 - PLACE
      ?auto_348114 - HOIST
      ?auto_348112 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348117 ?auto_348113 ) ( SURFACE-AT ?auto_348110 ?auto_348113 ) ( CLEAR ?auto_348110 ) ( IS-CRATE ?auto_348111 ) ( not ( = ?auto_348110 ?auto_348111 ) ) ( AVAILABLE ?auto_348117 ) ( ON ?auto_348110 ?auto_348109 ) ( not ( = ?auto_348109 ?auto_348110 ) ) ( not ( = ?auto_348109 ?auto_348111 ) ) ( TRUCK-AT ?auto_348116 ?auto_348115 ) ( not ( = ?auto_348115 ?auto_348113 ) ) ( HOIST-AT ?auto_348114 ?auto_348115 ) ( not ( = ?auto_348117 ?auto_348114 ) ) ( AVAILABLE ?auto_348114 ) ( SURFACE-AT ?auto_348111 ?auto_348115 ) ( ON ?auto_348111 ?auto_348112 ) ( CLEAR ?auto_348111 ) ( not ( = ?auto_348110 ?auto_348112 ) ) ( not ( = ?auto_348111 ?auto_348112 ) ) ( not ( = ?auto_348109 ?auto_348112 ) ) ( ON ?auto_348109 ?auto_348108 ) ( not ( = ?auto_348108 ?auto_348109 ) ) ( not ( = ?auto_348108 ?auto_348110 ) ) ( not ( = ?auto_348108 ?auto_348111 ) ) ( not ( = ?auto_348108 ?auto_348112 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348109 ?auto_348110 ?auto_348111 )
      ( MAKE-3CRATE-VERIFY ?auto_348108 ?auto_348109 ?auto_348110 ?auto_348111 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_348136 - SURFACE
      ?auto_348137 - SURFACE
      ?auto_348138 - SURFACE
      ?auto_348139 - SURFACE
    )
    :vars
    (
      ?auto_348143 - HOIST
      ?auto_348140 - PLACE
      ?auto_348144 - PLACE
      ?auto_348141 - HOIST
      ?auto_348142 - SURFACE
      ?auto_348145 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348143 ?auto_348140 ) ( SURFACE-AT ?auto_348138 ?auto_348140 ) ( CLEAR ?auto_348138 ) ( IS-CRATE ?auto_348139 ) ( not ( = ?auto_348138 ?auto_348139 ) ) ( AVAILABLE ?auto_348143 ) ( ON ?auto_348138 ?auto_348137 ) ( not ( = ?auto_348137 ?auto_348138 ) ) ( not ( = ?auto_348137 ?auto_348139 ) ) ( not ( = ?auto_348144 ?auto_348140 ) ) ( HOIST-AT ?auto_348141 ?auto_348144 ) ( not ( = ?auto_348143 ?auto_348141 ) ) ( AVAILABLE ?auto_348141 ) ( SURFACE-AT ?auto_348139 ?auto_348144 ) ( ON ?auto_348139 ?auto_348142 ) ( CLEAR ?auto_348139 ) ( not ( = ?auto_348138 ?auto_348142 ) ) ( not ( = ?auto_348139 ?auto_348142 ) ) ( not ( = ?auto_348137 ?auto_348142 ) ) ( TRUCK-AT ?auto_348145 ?auto_348140 ) ( ON ?auto_348137 ?auto_348136 ) ( not ( = ?auto_348136 ?auto_348137 ) ) ( not ( = ?auto_348136 ?auto_348138 ) ) ( not ( = ?auto_348136 ?auto_348139 ) ) ( not ( = ?auto_348136 ?auto_348142 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348137 ?auto_348138 ?auto_348139 )
      ( MAKE-3CRATE-VERIFY ?auto_348136 ?auto_348137 ?auto_348138 ?auto_348139 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_348164 - SURFACE
      ?auto_348165 - SURFACE
      ?auto_348166 - SURFACE
      ?auto_348167 - SURFACE
    )
    :vars
    (
      ?auto_348169 - HOIST
      ?auto_348168 - PLACE
      ?auto_348170 - PLACE
      ?auto_348171 - HOIST
      ?auto_348173 - SURFACE
      ?auto_348172 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348169 ?auto_348168 ) ( IS-CRATE ?auto_348167 ) ( not ( = ?auto_348166 ?auto_348167 ) ) ( not ( = ?auto_348165 ?auto_348166 ) ) ( not ( = ?auto_348165 ?auto_348167 ) ) ( not ( = ?auto_348170 ?auto_348168 ) ) ( HOIST-AT ?auto_348171 ?auto_348170 ) ( not ( = ?auto_348169 ?auto_348171 ) ) ( AVAILABLE ?auto_348171 ) ( SURFACE-AT ?auto_348167 ?auto_348170 ) ( ON ?auto_348167 ?auto_348173 ) ( CLEAR ?auto_348167 ) ( not ( = ?auto_348166 ?auto_348173 ) ) ( not ( = ?auto_348167 ?auto_348173 ) ) ( not ( = ?auto_348165 ?auto_348173 ) ) ( TRUCK-AT ?auto_348172 ?auto_348168 ) ( SURFACE-AT ?auto_348165 ?auto_348168 ) ( CLEAR ?auto_348165 ) ( LIFTING ?auto_348169 ?auto_348166 ) ( IS-CRATE ?auto_348166 ) ( ON ?auto_348165 ?auto_348164 ) ( not ( = ?auto_348164 ?auto_348165 ) ) ( not ( = ?auto_348164 ?auto_348166 ) ) ( not ( = ?auto_348164 ?auto_348167 ) ) ( not ( = ?auto_348164 ?auto_348173 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348165 ?auto_348166 ?auto_348167 )
      ( MAKE-3CRATE-VERIFY ?auto_348164 ?auto_348165 ?auto_348166 ?auto_348167 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_348192 - SURFACE
      ?auto_348193 - SURFACE
      ?auto_348194 - SURFACE
      ?auto_348195 - SURFACE
    )
    :vars
    (
      ?auto_348198 - HOIST
      ?auto_348196 - PLACE
      ?auto_348197 - PLACE
      ?auto_348199 - HOIST
      ?auto_348201 - SURFACE
      ?auto_348200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348198 ?auto_348196 ) ( IS-CRATE ?auto_348195 ) ( not ( = ?auto_348194 ?auto_348195 ) ) ( not ( = ?auto_348193 ?auto_348194 ) ) ( not ( = ?auto_348193 ?auto_348195 ) ) ( not ( = ?auto_348197 ?auto_348196 ) ) ( HOIST-AT ?auto_348199 ?auto_348197 ) ( not ( = ?auto_348198 ?auto_348199 ) ) ( AVAILABLE ?auto_348199 ) ( SURFACE-AT ?auto_348195 ?auto_348197 ) ( ON ?auto_348195 ?auto_348201 ) ( CLEAR ?auto_348195 ) ( not ( = ?auto_348194 ?auto_348201 ) ) ( not ( = ?auto_348195 ?auto_348201 ) ) ( not ( = ?auto_348193 ?auto_348201 ) ) ( TRUCK-AT ?auto_348200 ?auto_348196 ) ( SURFACE-AT ?auto_348193 ?auto_348196 ) ( CLEAR ?auto_348193 ) ( IS-CRATE ?auto_348194 ) ( AVAILABLE ?auto_348198 ) ( IN ?auto_348194 ?auto_348200 ) ( ON ?auto_348193 ?auto_348192 ) ( not ( = ?auto_348192 ?auto_348193 ) ) ( not ( = ?auto_348192 ?auto_348194 ) ) ( not ( = ?auto_348192 ?auto_348195 ) ) ( not ( = ?auto_348192 ?auto_348201 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348193 ?auto_348194 ?auto_348195 )
      ( MAKE-3CRATE-VERIFY ?auto_348192 ?auto_348193 ?auto_348194 ?auto_348195 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_348202 - SURFACE
      ?auto_348203 - SURFACE
    )
    :vars
    (
      ?auto_348206 - HOIST
      ?auto_348204 - PLACE
      ?auto_348207 - SURFACE
      ?auto_348205 - PLACE
      ?auto_348208 - HOIST
      ?auto_348210 - SURFACE
      ?auto_348209 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348206 ?auto_348204 ) ( IS-CRATE ?auto_348203 ) ( not ( = ?auto_348202 ?auto_348203 ) ) ( not ( = ?auto_348207 ?auto_348202 ) ) ( not ( = ?auto_348207 ?auto_348203 ) ) ( not ( = ?auto_348205 ?auto_348204 ) ) ( HOIST-AT ?auto_348208 ?auto_348205 ) ( not ( = ?auto_348206 ?auto_348208 ) ) ( AVAILABLE ?auto_348208 ) ( SURFACE-AT ?auto_348203 ?auto_348205 ) ( ON ?auto_348203 ?auto_348210 ) ( CLEAR ?auto_348203 ) ( not ( = ?auto_348202 ?auto_348210 ) ) ( not ( = ?auto_348203 ?auto_348210 ) ) ( not ( = ?auto_348207 ?auto_348210 ) ) ( SURFACE-AT ?auto_348207 ?auto_348204 ) ( CLEAR ?auto_348207 ) ( IS-CRATE ?auto_348202 ) ( AVAILABLE ?auto_348206 ) ( IN ?auto_348202 ?auto_348209 ) ( TRUCK-AT ?auto_348209 ?auto_348205 ) )
    :subtasks
    ( ( !DRIVE ?auto_348209 ?auto_348205 ?auto_348204 )
      ( MAKE-2CRATE ?auto_348207 ?auto_348202 ?auto_348203 )
      ( MAKE-1CRATE-VERIFY ?auto_348202 ?auto_348203 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_348211 - SURFACE
      ?auto_348212 - SURFACE
      ?auto_348213 - SURFACE
    )
    :vars
    (
      ?auto_348214 - HOIST
      ?auto_348215 - PLACE
      ?auto_348219 - PLACE
      ?auto_348218 - HOIST
      ?auto_348216 - SURFACE
      ?auto_348217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348214 ?auto_348215 ) ( IS-CRATE ?auto_348213 ) ( not ( = ?auto_348212 ?auto_348213 ) ) ( not ( = ?auto_348211 ?auto_348212 ) ) ( not ( = ?auto_348211 ?auto_348213 ) ) ( not ( = ?auto_348219 ?auto_348215 ) ) ( HOIST-AT ?auto_348218 ?auto_348219 ) ( not ( = ?auto_348214 ?auto_348218 ) ) ( AVAILABLE ?auto_348218 ) ( SURFACE-AT ?auto_348213 ?auto_348219 ) ( ON ?auto_348213 ?auto_348216 ) ( CLEAR ?auto_348213 ) ( not ( = ?auto_348212 ?auto_348216 ) ) ( not ( = ?auto_348213 ?auto_348216 ) ) ( not ( = ?auto_348211 ?auto_348216 ) ) ( SURFACE-AT ?auto_348211 ?auto_348215 ) ( CLEAR ?auto_348211 ) ( IS-CRATE ?auto_348212 ) ( AVAILABLE ?auto_348214 ) ( IN ?auto_348212 ?auto_348217 ) ( TRUCK-AT ?auto_348217 ?auto_348219 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_348212 ?auto_348213 )
      ( MAKE-2CRATE-VERIFY ?auto_348211 ?auto_348212 ?auto_348213 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_348220 - SURFACE
      ?auto_348221 - SURFACE
      ?auto_348222 - SURFACE
      ?auto_348223 - SURFACE
    )
    :vars
    (
      ?auto_348229 - HOIST
      ?auto_348228 - PLACE
      ?auto_348227 - PLACE
      ?auto_348225 - HOIST
      ?auto_348226 - SURFACE
      ?auto_348224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348229 ?auto_348228 ) ( IS-CRATE ?auto_348223 ) ( not ( = ?auto_348222 ?auto_348223 ) ) ( not ( = ?auto_348221 ?auto_348222 ) ) ( not ( = ?auto_348221 ?auto_348223 ) ) ( not ( = ?auto_348227 ?auto_348228 ) ) ( HOIST-AT ?auto_348225 ?auto_348227 ) ( not ( = ?auto_348229 ?auto_348225 ) ) ( AVAILABLE ?auto_348225 ) ( SURFACE-AT ?auto_348223 ?auto_348227 ) ( ON ?auto_348223 ?auto_348226 ) ( CLEAR ?auto_348223 ) ( not ( = ?auto_348222 ?auto_348226 ) ) ( not ( = ?auto_348223 ?auto_348226 ) ) ( not ( = ?auto_348221 ?auto_348226 ) ) ( SURFACE-AT ?auto_348221 ?auto_348228 ) ( CLEAR ?auto_348221 ) ( IS-CRATE ?auto_348222 ) ( AVAILABLE ?auto_348229 ) ( IN ?auto_348222 ?auto_348224 ) ( TRUCK-AT ?auto_348224 ?auto_348227 ) ( ON ?auto_348221 ?auto_348220 ) ( not ( = ?auto_348220 ?auto_348221 ) ) ( not ( = ?auto_348220 ?auto_348222 ) ) ( not ( = ?auto_348220 ?auto_348223 ) ) ( not ( = ?auto_348220 ?auto_348226 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348221 ?auto_348222 ?auto_348223 )
      ( MAKE-3CRATE-VERIFY ?auto_348220 ?auto_348221 ?auto_348222 ?auto_348223 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_348230 - SURFACE
      ?auto_348231 - SURFACE
    )
    :vars
    (
      ?auto_348238 - HOIST
      ?auto_348237 - PLACE
      ?auto_348233 - SURFACE
      ?auto_348236 - PLACE
      ?auto_348234 - HOIST
      ?auto_348235 - SURFACE
      ?auto_348232 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348238 ?auto_348237 ) ( IS-CRATE ?auto_348231 ) ( not ( = ?auto_348230 ?auto_348231 ) ) ( not ( = ?auto_348233 ?auto_348230 ) ) ( not ( = ?auto_348233 ?auto_348231 ) ) ( not ( = ?auto_348236 ?auto_348237 ) ) ( HOIST-AT ?auto_348234 ?auto_348236 ) ( not ( = ?auto_348238 ?auto_348234 ) ) ( SURFACE-AT ?auto_348231 ?auto_348236 ) ( ON ?auto_348231 ?auto_348235 ) ( CLEAR ?auto_348231 ) ( not ( = ?auto_348230 ?auto_348235 ) ) ( not ( = ?auto_348231 ?auto_348235 ) ) ( not ( = ?auto_348233 ?auto_348235 ) ) ( SURFACE-AT ?auto_348233 ?auto_348237 ) ( CLEAR ?auto_348233 ) ( IS-CRATE ?auto_348230 ) ( AVAILABLE ?auto_348238 ) ( TRUCK-AT ?auto_348232 ?auto_348236 ) ( LIFTING ?auto_348234 ?auto_348230 ) )
    :subtasks
    ( ( !LOAD ?auto_348234 ?auto_348230 ?auto_348232 ?auto_348236 )
      ( MAKE-2CRATE ?auto_348233 ?auto_348230 ?auto_348231 )
      ( MAKE-1CRATE-VERIFY ?auto_348230 ?auto_348231 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_348239 - SURFACE
      ?auto_348240 - SURFACE
      ?auto_348241 - SURFACE
    )
    :vars
    (
      ?auto_348243 - HOIST
      ?auto_348244 - PLACE
      ?auto_348245 - PLACE
      ?auto_348247 - HOIST
      ?auto_348246 - SURFACE
      ?auto_348242 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348243 ?auto_348244 ) ( IS-CRATE ?auto_348241 ) ( not ( = ?auto_348240 ?auto_348241 ) ) ( not ( = ?auto_348239 ?auto_348240 ) ) ( not ( = ?auto_348239 ?auto_348241 ) ) ( not ( = ?auto_348245 ?auto_348244 ) ) ( HOIST-AT ?auto_348247 ?auto_348245 ) ( not ( = ?auto_348243 ?auto_348247 ) ) ( SURFACE-AT ?auto_348241 ?auto_348245 ) ( ON ?auto_348241 ?auto_348246 ) ( CLEAR ?auto_348241 ) ( not ( = ?auto_348240 ?auto_348246 ) ) ( not ( = ?auto_348241 ?auto_348246 ) ) ( not ( = ?auto_348239 ?auto_348246 ) ) ( SURFACE-AT ?auto_348239 ?auto_348244 ) ( CLEAR ?auto_348239 ) ( IS-CRATE ?auto_348240 ) ( AVAILABLE ?auto_348243 ) ( TRUCK-AT ?auto_348242 ?auto_348245 ) ( LIFTING ?auto_348247 ?auto_348240 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_348240 ?auto_348241 )
      ( MAKE-2CRATE-VERIFY ?auto_348239 ?auto_348240 ?auto_348241 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_348248 - SURFACE
      ?auto_348249 - SURFACE
      ?auto_348250 - SURFACE
      ?auto_348251 - SURFACE
    )
    :vars
    (
      ?auto_348253 - HOIST
      ?auto_348254 - PLACE
      ?auto_348256 - PLACE
      ?auto_348255 - HOIST
      ?auto_348257 - SURFACE
      ?auto_348252 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348253 ?auto_348254 ) ( IS-CRATE ?auto_348251 ) ( not ( = ?auto_348250 ?auto_348251 ) ) ( not ( = ?auto_348249 ?auto_348250 ) ) ( not ( = ?auto_348249 ?auto_348251 ) ) ( not ( = ?auto_348256 ?auto_348254 ) ) ( HOIST-AT ?auto_348255 ?auto_348256 ) ( not ( = ?auto_348253 ?auto_348255 ) ) ( SURFACE-AT ?auto_348251 ?auto_348256 ) ( ON ?auto_348251 ?auto_348257 ) ( CLEAR ?auto_348251 ) ( not ( = ?auto_348250 ?auto_348257 ) ) ( not ( = ?auto_348251 ?auto_348257 ) ) ( not ( = ?auto_348249 ?auto_348257 ) ) ( SURFACE-AT ?auto_348249 ?auto_348254 ) ( CLEAR ?auto_348249 ) ( IS-CRATE ?auto_348250 ) ( AVAILABLE ?auto_348253 ) ( TRUCK-AT ?auto_348252 ?auto_348256 ) ( LIFTING ?auto_348255 ?auto_348250 ) ( ON ?auto_348249 ?auto_348248 ) ( not ( = ?auto_348248 ?auto_348249 ) ) ( not ( = ?auto_348248 ?auto_348250 ) ) ( not ( = ?auto_348248 ?auto_348251 ) ) ( not ( = ?auto_348248 ?auto_348257 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348249 ?auto_348250 ?auto_348251 )
      ( MAKE-3CRATE-VERIFY ?auto_348248 ?auto_348249 ?auto_348250 ?auto_348251 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_348258 - SURFACE
      ?auto_348259 - SURFACE
    )
    :vars
    (
      ?auto_348261 - HOIST
      ?auto_348262 - PLACE
      ?auto_348264 - SURFACE
      ?auto_348265 - PLACE
      ?auto_348263 - HOIST
      ?auto_348266 - SURFACE
      ?auto_348260 - TRUCK
      ?auto_348267 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348261 ?auto_348262 ) ( IS-CRATE ?auto_348259 ) ( not ( = ?auto_348258 ?auto_348259 ) ) ( not ( = ?auto_348264 ?auto_348258 ) ) ( not ( = ?auto_348264 ?auto_348259 ) ) ( not ( = ?auto_348265 ?auto_348262 ) ) ( HOIST-AT ?auto_348263 ?auto_348265 ) ( not ( = ?auto_348261 ?auto_348263 ) ) ( SURFACE-AT ?auto_348259 ?auto_348265 ) ( ON ?auto_348259 ?auto_348266 ) ( CLEAR ?auto_348259 ) ( not ( = ?auto_348258 ?auto_348266 ) ) ( not ( = ?auto_348259 ?auto_348266 ) ) ( not ( = ?auto_348264 ?auto_348266 ) ) ( SURFACE-AT ?auto_348264 ?auto_348262 ) ( CLEAR ?auto_348264 ) ( IS-CRATE ?auto_348258 ) ( AVAILABLE ?auto_348261 ) ( TRUCK-AT ?auto_348260 ?auto_348265 ) ( AVAILABLE ?auto_348263 ) ( SURFACE-AT ?auto_348258 ?auto_348265 ) ( ON ?auto_348258 ?auto_348267 ) ( CLEAR ?auto_348258 ) ( not ( = ?auto_348258 ?auto_348267 ) ) ( not ( = ?auto_348259 ?auto_348267 ) ) ( not ( = ?auto_348264 ?auto_348267 ) ) ( not ( = ?auto_348266 ?auto_348267 ) ) )
    :subtasks
    ( ( !LIFT ?auto_348263 ?auto_348258 ?auto_348267 ?auto_348265 )
      ( MAKE-2CRATE ?auto_348264 ?auto_348258 ?auto_348259 )
      ( MAKE-1CRATE-VERIFY ?auto_348258 ?auto_348259 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_348268 - SURFACE
      ?auto_348269 - SURFACE
      ?auto_348270 - SURFACE
    )
    :vars
    (
      ?auto_348271 - HOIST
      ?auto_348275 - PLACE
      ?auto_348273 - PLACE
      ?auto_348274 - HOIST
      ?auto_348272 - SURFACE
      ?auto_348277 - TRUCK
      ?auto_348276 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348271 ?auto_348275 ) ( IS-CRATE ?auto_348270 ) ( not ( = ?auto_348269 ?auto_348270 ) ) ( not ( = ?auto_348268 ?auto_348269 ) ) ( not ( = ?auto_348268 ?auto_348270 ) ) ( not ( = ?auto_348273 ?auto_348275 ) ) ( HOIST-AT ?auto_348274 ?auto_348273 ) ( not ( = ?auto_348271 ?auto_348274 ) ) ( SURFACE-AT ?auto_348270 ?auto_348273 ) ( ON ?auto_348270 ?auto_348272 ) ( CLEAR ?auto_348270 ) ( not ( = ?auto_348269 ?auto_348272 ) ) ( not ( = ?auto_348270 ?auto_348272 ) ) ( not ( = ?auto_348268 ?auto_348272 ) ) ( SURFACE-AT ?auto_348268 ?auto_348275 ) ( CLEAR ?auto_348268 ) ( IS-CRATE ?auto_348269 ) ( AVAILABLE ?auto_348271 ) ( TRUCK-AT ?auto_348277 ?auto_348273 ) ( AVAILABLE ?auto_348274 ) ( SURFACE-AT ?auto_348269 ?auto_348273 ) ( ON ?auto_348269 ?auto_348276 ) ( CLEAR ?auto_348269 ) ( not ( = ?auto_348269 ?auto_348276 ) ) ( not ( = ?auto_348270 ?auto_348276 ) ) ( not ( = ?auto_348268 ?auto_348276 ) ) ( not ( = ?auto_348272 ?auto_348276 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_348269 ?auto_348270 )
      ( MAKE-2CRATE-VERIFY ?auto_348268 ?auto_348269 ?auto_348270 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_348278 - SURFACE
      ?auto_348279 - SURFACE
      ?auto_348280 - SURFACE
      ?auto_348281 - SURFACE
    )
    :vars
    (
      ?auto_348285 - HOIST
      ?auto_348287 - PLACE
      ?auto_348288 - PLACE
      ?auto_348282 - HOIST
      ?auto_348286 - SURFACE
      ?auto_348283 - TRUCK
      ?auto_348284 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348285 ?auto_348287 ) ( IS-CRATE ?auto_348281 ) ( not ( = ?auto_348280 ?auto_348281 ) ) ( not ( = ?auto_348279 ?auto_348280 ) ) ( not ( = ?auto_348279 ?auto_348281 ) ) ( not ( = ?auto_348288 ?auto_348287 ) ) ( HOIST-AT ?auto_348282 ?auto_348288 ) ( not ( = ?auto_348285 ?auto_348282 ) ) ( SURFACE-AT ?auto_348281 ?auto_348288 ) ( ON ?auto_348281 ?auto_348286 ) ( CLEAR ?auto_348281 ) ( not ( = ?auto_348280 ?auto_348286 ) ) ( not ( = ?auto_348281 ?auto_348286 ) ) ( not ( = ?auto_348279 ?auto_348286 ) ) ( SURFACE-AT ?auto_348279 ?auto_348287 ) ( CLEAR ?auto_348279 ) ( IS-CRATE ?auto_348280 ) ( AVAILABLE ?auto_348285 ) ( TRUCK-AT ?auto_348283 ?auto_348288 ) ( AVAILABLE ?auto_348282 ) ( SURFACE-AT ?auto_348280 ?auto_348288 ) ( ON ?auto_348280 ?auto_348284 ) ( CLEAR ?auto_348280 ) ( not ( = ?auto_348280 ?auto_348284 ) ) ( not ( = ?auto_348281 ?auto_348284 ) ) ( not ( = ?auto_348279 ?auto_348284 ) ) ( not ( = ?auto_348286 ?auto_348284 ) ) ( ON ?auto_348279 ?auto_348278 ) ( not ( = ?auto_348278 ?auto_348279 ) ) ( not ( = ?auto_348278 ?auto_348280 ) ) ( not ( = ?auto_348278 ?auto_348281 ) ) ( not ( = ?auto_348278 ?auto_348286 ) ) ( not ( = ?auto_348278 ?auto_348284 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348279 ?auto_348280 ?auto_348281 )
      ( MAKE-3CRATE-VERIFY ?auto_348278 ?auto_348279 ?auto_348280 ?auto_348281 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_348289 - SURFACE
      ?auto_348290 - SURFACE
    )
    :vars
    (
      ?auto_348294 - HOIST
      ?auto_348297 - PLACE
      ?auto_348296 - SURFACE
      ?auto_348298 - PLACE
      ?auto_348291 - HOIST
      ?auto_348295 - SURFACE
      ?auto_348293 - SURFACE
      ?auto_348292 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348294 ?auto_348297 ) ( IS-CRATE ?auto_348290 ) ( not ( = ?auto_348289 ?auto_348290 ) ) ( not ( = ?auto_348296 ?auto_348289 ) ) ( not ( = ?auto_348296 ?auto_348290 ) ) ( not ( = ?auto_348298 ?auto_348297 ) ) ( HOIST-AT ?auto_348291 ?auto_348298 ) ( not ( = ?auto_348294 ?auto_348291 ) ) ( SURFACE-AT ?auto_348290 ?auto_348298 ) ( ON ?auto_348290 ?auto_348295 ) ( CLEAR ?auto_348290 ) ( not ( = ?auto_348289 ?auto_348295 ) ) ( not ( = ?auto_348290 ?auto_348295 ) ) ( not ( = ?auto_348296 ?auto_348295 ) ) ( SURFACE-AT ?auto_348296 ?auto_348297 ) ( CLEAR ?auto_348296 ) ( IS-CRATE ?auto_348289 ) ( AVAILABLE ?auto_348294 ) ( AVAILABLE ?auto_348291 ) ( SURFACE-AT ?auto_348289 ?auto_348298 ) ( ON ?auto_348289 ?auto_348293 ) ( CLEAR ?auto_348289 ) ( not ( = ?auto_348289 ?auto_348293 ) ) ( not ( = ?auto_348290 ?auto_348293 ) ) ( not ( = ?auto_348296 ?auto_348293 ) ) ( not ( = ?auto_348295 ?auto_348293 ) ) ( TRUCK-AT ?auto_348292 ?auto_348297 ) )
    :subtasks
    ( ( !DRIVE ?auto_348292 ?auto_348297 ?auto_348298 )
      ( MAKE-2CRATE ?auto_348296 ?auto_348289 ?auto_348290 )
      ( MAKE-1CRATE-VERIFY ?auto_348289 ?auto_348290 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_348299 - SURFACE
      ?auto_348300 - SURFACE
      ?auto_348301 - SURFACE
    )
    :vars
    (
      ?auto_348304 - HOIST
      ?auto_348303 - PLACE
      ?auto_348305 - PLACE
      ?auto_348307 - HOIST
      ?auto_348306 - SURFACE
      ?auto_348308 - SURFACE
      ?auto_348302 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348304 ?auto_348303 ) ( IS-CRATE ?auto_348301 ) ( not ( = ?auto_348300 ?auto_348301 ) ) ( not ( = ?auto_348299 ?auto_348300 ) ) ( not ( = ?auto_348299 ?auto_348301 ) ) ( not ( = ?auto_348305 ?auto_348303 ) ) ( HOIST-AT ?auto_348307 ?auto_348305 ) ( not ( = ?auto_348304 ?auto_348307 ) ) ( SURFACE-AT ?auto_348301 ?auto_348305 ) ( ON ?auto_348301 ?auto_348306 ) ( CLEAR ?auto_348301 ) ( not ( = ?auto_348300 ?auto_348306 ) ) ( not ( = ?auto_348301 ?auto_348306 ) ) ( not ( = ?auto_348299 ?auto_348306 ) ) ( SURFACE-AT ?auto_348299 ?auto_348303 ) ( CLEAR ?auto_348299 ) ( IS-CRATE ?auto_348300 ) ( AVAILABLE ?auto_348304 ) ( AVAILABLE ?auto_348307 ) ( SURFACE-AT ?auto_348300 ?auto_348305 ) ( ON ?auto_348300 ?auto_348308 ) ( CLEAR ?auto_348300 ) ( not ( = ?auto_348300 ?auto_348308 ) ) ( not ( = ?auto_348301 ?auto_348308 ) ) ( not ( = ?auto_348299 ?auto_348308 ) ) ( not ( = ?auto_348306 ?auto_348308 ) ) ( TRUCK-AT ?auto_348302 ?auto_348303 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_348300 ?auto_348301 )
      ( MAKE-2CRATE-VERIFY ?auto_348299 ?auto_348300 ?auto_348301 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_348309 - SURFACE
      ?auto_348310 - SURFACE
      ?auto_348311 - SURFACE
      ?auto_348312 - SURFACE
    )
    :vars
    (
      ?auto_348317 - HOIST
      ?auto_348316 - PLACE
      ?auto_348315 - PLACE
      ?auto_348318 - HOIST
      ?auto_348313 - SURFACE
      ?auto_348319 - SURFACE
      ?auto_348314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348317 ?auto_348316 ) ( IS-CRATE ?auto_348312 ) ( not ( = ?auto_348311 ?auto_348312 ) ) ( not ( = ?auto_348310 ?auto_348311 ) ) ( not ( = ?auto_348310 ?auto_348312 ) ) ( not ( = ?auto_348315 ?auto_348316 ) ) ( HOIST-AT ?auto_348318 ?auto_348315 ) ( not ( = ?auto_348317 ?auto_348318 ) ) ( SURFACE-AT ?auto_348312 ?auto_348315 ) ( ON ?auto_348312 ?auto_348313 ) ( CLEAR ?auto_348312 ) ( not ( = ?auto_348311 ?auto_348313 ) ) ( not ( = ?auto_348312 ?auto_348313 ) ) ( not ( = ?auto_348310 ?auto_348313 ) ) ( SURFACE-AT ?auto_348310 ?auto_348316 ) ( CLEAR ?auto_348310 ) ( IS-CRATE ?auto_348311 ) ( AVAILABLE ?auto_348317 ) ( AVAILABLE ?auto_348318 ) ( SURFACE-AT ?auto_348311 ?auto_348315 ) ( ON ?auto_348311 ?auto_348319 ) ( CLEAR ?auto_348311 ) ( not ( = ?auto_348311 ?auto_348319 ) ) ( not ( = ?auto_348312 ?auto_348319 ) ) ( not ( = ?auto_348310 ?auto_348319 ) ) ( not ( = ?auto_348313 ?auto_348319 ) ) ( TRUCK-AT ?auto_348314 ?auto_348316 ) ( ON ?auto_348310 ?auto_348309 ) ( not ( = ?auto_348309 ?auto_348310 ) ) ( not ( = ?auto_348309 ?auto_348311 ) ) ( not ( = ?auto_348309 ?auto_348312 ) ) ( not ( = ?auto_348309 ?auto_348313 ) ) ( not ( = ?auto_348309 ?auto_348319 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348310 ?auto_348311 ?auto_348312 )
      ( MAKE-3CRATE-VERIFY ?auto_348309 ?auto_348310 ?auto_348311 ?auto_348312 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_348320 - SURFACE
      ?auto_348321 - SURFACE
    )
    :vars
    (
      ?auto_348326 - HOIST
      ?auto_348325 - PLACE
      ?auto_348327 - SURFACE
      ?auto_348324 - PLACE
      ?auto_348328 - HOIST
      ?auto_348322 - SURFACE
      ?auto_348329 - SURFACE
      ?auto_348323 - TRUCK
      ?auto_348330 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348326 ?auto_348325 ) ( IS-CRATE ?auto_348321 ) ( not ( = ?auto_348320 ?auto_348321 ) ) ( not ( = ?auto_348327 ?auto_348320 ) ) ( not ( = ?auto_348327 ?auto_348321 ) ) ( not ( = ?auto_348324 ?auto_348325 ) ) ( HOIST-AT ?auto_348328 ?auto_348324 ) ( not ( = ?auto_348326 ?auto_348328 ) ) ( SURFACE-AT ?auto_348321 ?auto_348324 ) ( ON ?auto_348321 ?auto_348322 ) ( CLEAR ?auto_348321 ) ( not ( = ?auto_348320 ?auto_348322 ) ) ( not ( = ?auto_348321 ?auto_348322 ) ) ( not ( = ?auto_348327 ?auto_348322 ) ) ( IS-CRATE ?auto_348320 ) ( AVAILABLE ?auto_348328 ) ( SURFACE-AT ?auto_348320 ?auto_348324 ) ( ON ?auto_348320 ?auto_348329 ) ( CLEAR ?auto_348320 ) ( not ( = ?auto_348320 ?auto_348329 ) ) ( not ( = ?auto_348321 ?auto_348329 ) ) ( not ( = ?auto_348327 ?auto_348329 ) ) ( not ( = ?auto_348322 ?auto_348329 ) ) ( TRUCK-AT ?auto_348323 ?auto_348325 ) ( SURFACE-AT ?auto_348330 ?auto_348325 ) ( CLEAR ?auto_348330 ) ( LIFTING ?auto_348326 ?auto_348327 ) ( IS-CRATE ?auto_348327 ) ( not ( = ?auto_348330 ?auto_348327 ) ) ( not ( = ?auto_348320 ?auto_348330 ) ) ( not ( = ?auto_348321 ?auto_348330 ) ) ( not ( = ?auto_348322 ?auto_348330 ) ) ( not ( = ?auto_348329 ?auto_348330 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_348330 ?auto_348327 )
      ( MAKE-2CRATE ?auto_348327 ?auto_348320 ?auto_348321 )
      ( MAKE-1CRATE-VERIFY ?auto_348320 ?auto_348321 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_348331 - SURFACE
      ?auto_348332 - SURFACE
      ?auto_348333 - SURFACE
    )
    :vars
    (
      ?auto_348338 - HOIST
      ?auto_348337 - PLACE
      ?auto_348334 - PLACE
      ?auto_348339 - HOIST
      ?auto_348340 - SURFACE
      ?auto_348335 - SURFACE
      ?auto_348341 - TRUCK
      ?auto_348336 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348338 ?auto_348337 ) ( IS-CRATE ?auto_348333 ) ( not ( = ?auto_348332 ?auto_348333 ) ) ( not ( = ?auto_348331 ?auto_348332 ) ) ( not ( = ?auto_348331 ?auto_348333 ) ) ( not ( = ?auto_348334 ?auto_348337 ) ) ( HOIST-AT ?auto_348339 ?auto_348334 ) ( not ( = ?auto_348338 ?auto_348339 ) ) ( SURFACE-AT ?auto_348333 ?auto_348334 ) ( ON ?auto_348333 ?auto_348340 ) ( CLEAR ?auto_348333 ) ( not ( = ?auto_348332 ?auto_348340 ) ) ( not ( = ?auto_348333 ?auto_348340 ) ) ( not ( = ?auto_348331 ?auto_348340 ) ) ( IS-CRATE ?auto_348332 ) ( AVAILABLE ?auto_348339 ) ( SURFACE-AT ?auto_348332 ?auto_348334 ) ( ON ?auto_348332 ?auto_348335 ) ( CLEAR ?auto_348332 ) ( not ( = ?auto_348332 ?auto_348335 ) ) ( not ( = ?auto_348333 ?auto_348335 ) ) ( not ( = ?auto_348331 ?auto_348335 ) ) ( not ( = ?auto_348340 ?auto_348335 ) ) ( TRUCK-AT ?auto_348341 ?auto_348337 ) ( SURFACE-AT ?auto_348336 ?auto_348337 ) ( CLEAR ?auto_348336 ) ( LIFTING ?auto_348338 ?auto_348331 ) ( IS-CRATE ?auto_348331 ) ( not ( = ?auto_348336 ?auto_348331 ) ) ( not ( = ?auto_348332 ?auto_348336 ) ) ( not ( = ?auto_348333 ?auto_348336 ) ) ( not ( = ?auto_348340 ?auto_348336 ) ) ( not ( = ?auto_348335 ?auto_348336 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_348332 ?auto_348333 )
      ( MAKE-2CRATE-VERIFY ?auto_348331 ?auto_348332 ?auto_348333 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_348342 - SURFACE
      ?auto_348343 - SURFACE
      ?auto_348344 - SURFACE
      ?auto_348345 - SURFACE
    )
    :vars
    (
      ?auto_348348 - HOIST
      ?auto_348346 - PLACE
      ?auto_348349 - PLACE
      ?auto_348352 - HOIST
      ?auto_348347 - SURFACE
      ?auto_348350 - SURFACE
      ?auto_348351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348348 ?auto_348346 ) ( IS-CRATE ?auto_348345 ) ( not ( = ?auto_348344 ?auto_348345 ) ) ( not ( = ?auto_348343 ?auto_348344 ) ) ( not ( = ?auto_348343 ?auto_348345 ) ) ( not ( = ?auto_348349 ?auto_348346 ) ) ( HOIST-AT ?auto_348352 ?auto_348349 ) ( not ( = ?auto_348348 ?auto_348352 ) ) ( SURFACE-AT ?auto_348345 ?auto_348349 ) ( ON ?auto_348345 ?auto_348347 ) ( CLEAR ?auto_348345 ) ( not ( = ?auto_348344 ?auto_348347 ) ) ( not ( = ?auto_348345 ?auto_348347 ) ) ( not ( = ?auto_348343 ?auto_348347 ) ) ( IS-CRATE ?auto_348344 ) ( AVAILABLE ?auto_348352 ) ( SURFACE-AT ?auto_348344 ?auto_348349 ) ( ON ?auto_348344 ?auto_348350 ) ( CLEAR ?auto_348344 ) ( not ( = ?auto_348344 ?auto_348350 ) ) ( not ( = ?auto_348345 ?auto_348350 ) ) ( not ( = ?auto_348343 ?auto_348350 ) ) ( not ( = ?auto_348347 ?auto_348350 ) ) ( TRUCK-AT ?auto_348351 ?auto_348346 ) ( SURFACE-AT ?auto_348342 ?auto_348346 ) ( CLEAR ?auto_348342 ) ( LIFTING ?auto_348348 ?auto_348343 ) ( IS-CRATE ?auto_348343 ) ( not ( = ?auto_348342 ?auto_348343 ) ) ( not ( = ?auto_348344 ?auto_348342 ) ) ( not ( = ?auto_348345 ?auto_348342 ) ) ( not ( = ?auto_348347 ?auto_348342 ) ) ( not ( = ?auto_348350 ?auto_348342 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348343 ?auto_348344 ?auto_348345 )
      ( MAKE-3CRATE-VERIFY ?auto_348342 ?auto_348343 ?auto_348344 ?auto_348345 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_348488 - SURFACE
      ?auto_348489 - SURFACE
      ?auto_348490 - SURFACE
      ?auto_348491 - SURFACE
      ?auto_348492 - SURFACE
    )
    :vars
    (
      ?auto_348494 - HOIST
      ?auto_348493 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348494 ?auto_348493 ) ( SURFACE-AT ?auto_348491 ?auto_348493 ) ( CLEAR ?auto_348491 ) ( LIFTING ?auto_348494 ?auto_348492 ) ( IS-CRATE ?auto_348492 ) ( not ( = ?auto_348491 ?auto_348492 ) ) ( ON ?auto_348489 ?auto_348488 ) ( ON ?auto_348490 ?auto_348489 ) ( ON ?auto_348491 ?auto_348490 ) ( not ( = ?auto_348488 ?auto_348489 ) ) ( not ( = ?auto_348488 ?auto_348490 ) ) ( not ( = ?auto_348488 ?auto_348491 ) ) ( not ( = ?auto_348488 ?auto_348492 ) ) ( not ( = ?auto_348489 ?auto_348490 ) ) ( not ( = ?auto_348489 ?auto_348491 ) ) ( not ( = ?auto_348489 ?auto_348492 ) ) ( not ( = ?auto_348490 ?auto_348491 ) ) ( not ( = ?auto_348490 ?auto_348492 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_348491 ?auto_348492 )
      ( MAKE-4CRATE-VERIFY ?auto_348488 ?auto_348489 ?auto_348490 ?auto_348491 ?auto_348492 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_348513 - SURFACE
      ?auto_348514 - SURFACE
      ?auto_348515 - SURFACE
      ?auto_348516 - SURFACE
      ?auto_348517 - SURFACE
    )
    :vars
    (
      ?auto_348518 - HOIST
      ?auto_348519 - PLACE
      ?auto_348520 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348518 ?auto_348519 ) ( SURFACE-AT ?auto_348516 ?auto_348519 ) ( CLEAR ?auto_348516 ) ( IS-CRATE ?auto_348517 ) ( not ( = ?auto_348516 ?auto_348517 ) ) ( TRUCK-AT ?auto_348520 ?auto_348519 ) ( AVAILABLE ?auto_348518 ) ( IN ?auto_348517 ?auto_348520 ) ( ON ?auto_348516 ?auto_348515 ) ( not ( = ?auto_348515 ?auto_348516 ) ) ( not ( = ?auto_348515 ?auto_348517 ) ) ( ON ?auto_348514 ?auto_348513 ) ( ON ?auto_348515 ?auto_348514 ) ( not ( = ?auto_348513 ?auto_348514 ) ) ( not ( = ?auto_348513 ?auto_348515 ) ) ( not ( = ?auto_348513 ?auto_348516 ) ) ( not ( = ?auto_348513 ?auto_348517 ) ) ( not ( = ?auto_348514 ?auto_348515 ) ) ( not ( = ?auto_348514 ?auto_348516 ) ) ( not ( = ?auto_348514 ?auto_348517 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348515 ?auto_348516 ?auto_348517 )
      ( MAKE-4CRATE-VERIFY ?auto_348513 ?auto_348514 ?auto_348515 ?auto_348516 ?auto_348517 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_348543 - SURFACE
      ?auto_348544 - SURFACE
      ?auto_348545 - SURFACE
      ?auto_348546 - SURFACE
      ?auto_348547 - SURFACE
    )
    :vars
    (
      ?auto_348551 - HOIST
      ?auto_348549 - PLACE
      ?auto_348548 - TRUCK
      ?auto_348550 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348551 ?auto_348549 ) ( SURFACE-AT ?auto_348546 ?auto_348549 ) ( CLEAR ?auto_348546 ) ( IS-CRATE ?auto_348547 ) ( not ( = ?auto_348546 ?auto_348547 ) ) ( AVAILABLE ?auto_348551 ) ( IN ?auto_348547 ?auto_348548 ) ( ON ?auto_348546 ?auto_348545 ) ( not ( = ?auto_348545 ?auto_348546 ) ) ( not ( = ?auto_348545 ?auto_348547 ) ) ( TRUCK-AT ?auto_348548 ?auto_348550 ) ( not ( = ?auto_348550 ?auto_348549 ) ) ( ON ?auto_348544 ?auto_348543 ) ( ON ?auto_348545 ?auto_348544 ) ( not ( = ?auto_348543 ?auto_348544 ) ) ( not ( = ?auto_348543 ?auto_348545 ) ) ( not ( = ?auto_348543 ?auto_348546 ) ) ( not ( = ?auto_348543 ?auto_348547 ) ) ( not ( = ?auto_348544 ?auto_348545 ) ) ( not ( = ?auto_348544 ?auto_348546 ) ) ( not ( = ?auto_348544 ?auto_348547 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348545 ?auto_348546 ?auto_348547 )
      ( MAKE-4CRATE-VERIFY ?auto_348543 ?auto_348544 ?auto_348545 ?auto_348546 ?auto_348547 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_348577 - SURFACE
      ?auto_348578 - SURFACE
      ?auto_348579 - SURFACE
      ?auto_348580 - SURFACE
      ?auto_348581 - SURFACE
    )
    :vars
    (
      ?auto_348582 - HOIST
      ?auto_348583 - PLACE
      ?auto_348586 - TRUCK
      ?auto_348584 - PLACE
      ?auto_348585 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_348582 ?auto_348583 ) ( SURFACE-AT ?auto_348580 ?auto_348583 ) ( CLEAR ?auto_348580 ) ( IS-CRATE ?auto_348581 ) ( not ( = ?auto_348580 ?auto_348581 ) ) ( AVAILABLE ?auto_348582 ) ( ON ?auto_348580 ?auto_348579 ) ( not ( = ?auto_348579 ?auto_348580 ) ) ( not ( = ?auto_348579 ?auto_348581 ) ) ( TRUCK-AT ?auto_348586 ?auto_348584 ) ( not ( = ?auto_348584 ?auto_348583 ) ) ( HOIST-AT ?auto_348585 ?auto_348584 ) ( LIFTING ?auto_348585 ?auto_348581 ) ( not ( = ?auto_348582 ?auto_348585 ) ) ( ON ?auto_348578 ?auto_348577 ) ( ON ?auto_348579 ?auto_348578 ) ( not ( = ?auto_348577 ?auto_348578 ) ) ( not ( = ?auto_348577 ?auto_348579 ) ) ( not ( = ?auto_348577 ?auto_348580 ) ) ( not ( = ?auto_348577 ?auto_348581 ) ) ( not ( = ?auto_348578 ?auto_348579 ) ) ( not ( = ?auto_348578 ?auto_348580 ) ) ( not ( = ?auto_348578 ?auto_348581 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348579 ?auto_348580 ?auto_348581 )
      ( MAKE-4CRATE-VERIFY ?auto_348577 ?auto_348578 ?auto_348579 ?auto_348580 ?auto_348581 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_348615 - SURFACE
      ?auto_348616 - SURFACE
      ?auto_348617 - SURFACE
      ?auto_348618 - SURFACE
      ?auto_348619 - SURFACE
    )
    :vars
    (
      ?auto_348620 - HOIST
      ?auto_348625 - PLACE
      ?auto_348623 - TRUCK
      ?auto_348622 - PLACE
      ?auto_348624 - HOIST
      ?auto_348621 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348620 ?auto_348625 ) ( SURFACE-AT ?auto_348618 ?auto_348625 ) ( CLEAR ?auto_348618 ) ( IS-CRATE ?auto_348619 ) ( not ( = ?auto_348618 ?auto_348619 ) ) ( AVAILABLE ?auto_348620 ) ( ON ?auto_348618 ?auto_348617 ) ( not ( = ?auto_348617 ?auto_348618 ) ) ( not ( = ?auto_348617 ?auto_348619 ) ) ( TRUCK-AT ?auto_348623 ?auto_348622 ) ( not ( = ?auto_348622 ?auto_348625 ) ) ( HOIST-AT ?auto_348624 ?auto_348622 ) ( not ( = ?auto_348620 ?auto_348624 ) ) ( AVAILABLE ?auto_348624 ) ( SURFACE-AT ?auto_348619 ?auto_348622 ) ( ON ?auto_348619 ?auto_348621 ) ( CLEAR ?auto_348619 ) ( not ( = ?auto_348618 ?auto_348621 ) ) ( not ( = ?auto_348619 ?auto_348621 ) ) ( not ( = ?auto_348617 ?auto_348621 ) ) ( ON ?auto_348616 ?auto_348615 ) ( ON ?auto_348617 ?auto_348616 ) ( not ( = ?auto_348615 ?auto_348616 ) ) ( not ( = ?auto_348615 ?auto_348617 ) ) ( not ( = ?auto_348615 ?auto_348618 ) ) ( not ( = ?auto_348615 ?auto_348619 ) ) ( not ( = ?auto_348615 ?auto_348621 ) ) ( not ( = ?auto_348616 ?auto_348617 ) ) ( not ( = ?auto_348616 ?auto_348618 ) ) ( not ( = ?auto_348616 ?auto_348619 ) ) ( not ( = ?auto_348616 ?auto_348621 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348617 ?auto_348618 ?auto_348619 )
      ( MAKE-4CRATE-VERIFY ?auto_348615 ?auto_348616 ?auto_348617 ?auto_348618 ?auto_348619 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_348654 - SURFACE
      ?auto_348655 - SURFACE
      ?auto_348656 - SURFACE
      ?auto_348657 - SURFACE
      ?auto_348658 - SURFACE
    )
    :vars
    (
      ?auto_348664 - HOIST
      ?auto_348660 - PLACE
      ?auto_348663 - PLACE
      ?auto_348659 - HOIST
      ?auto_348662 - SURFACE
      ?auto_348661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348664 ?auto_348660 ) ( SURFACE-AT ?auto_348657 ?auto_348660 ) ( CLEAR ?auto_348657 ) ( IS-CRATE ?auto_348658 ) ( not ( = ?auto_348657 ?auto_348658 ) ) ( AVAILABLE ?auto_348664 ) ( ON ?auto_348657 ?auto_348656 ) ( not ( = ?auto_348656 ?auto_348657 ) ) ( not ( = ?auto_348656 ?auto_348658 ) ) ( not ( = ?auto_348663 ?auto_348660 ) ) ( HOIST-AT ?auto_348659 ?auto_348663 ) ( not ( = ?auto_348664 ?auto_348659 ) ) ( AVAILABLE ?auto_348659 ) ( SURFACE-AT ?auto_348658 ?auto_348663 ) ( ON ?auto_348658 ?auto_348662 ) ( CLEAR ?auto_348658 ) ( not ( = ?auto_348657 ?auto_348662 ) ) ( not ( = ?auto_348658 ?auto_348662 ) ) ( not ( = ?auto_348656 ?auto_348662 ) ) ( TRUCK-AT ?auto_348661 ?auto_348660 ) ( ON ?auto_348655 ?auto_348654 ) ( ON ?auto_348656 ?auto_348655 ) ( not ( = ?auto_348654 ?auto_348655 ) ) ( not ( = ?auto_348654 ?auto_348656 ) ) ( not ( = ?auto_348654 ?auto_348657 ) ) ( not ( = ?auto_348654 ?auto_348658 ) ) ( not ( = ?auto_348654 ?auto_348662 ) ) ( not ( = ?auto_348655 ?auto_348656 ) ) ( not ( = ?auto_348655 ?auto_348657 ) ) ( not ( = ?auto_348655 ?auto_348658 ) ) ( not ( = ?auto_348655 ?auto_348662 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348656 ?auto_348657 ?auto_348658 )
      ( MAKE-4CRATE-VERIFY ?auto_348654 ?auto_348655 ?auto_348656 ?auto_348657 ?auto_348658 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_348693 - SURFACE
      ?auto_348694 - SURFACE
      ?auto_348695 - SURFACE
      ?auto_348696 - SURFACE
      ?auto_348697 - SURFACE
    )
    :vars
    (
      ?auto_348701 - HOIST
      ?auto_348698 - PLACE
      ?auto_348699 - PLACE
      ?auto_348702 - HOIST
      ?auto_348700 - SURFACE
      ?auto_348703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348701 ?auto_348698 ) ( IS-CRATE ?auto_348697 ) ( not ( = ?auto_348696 ?auto_348697 ) ) ( not ( = ?auto_348695 ?auto_348696 ) ) ( not ( = ?auto_348695 ?auto_348697 ) ) ( not ( = ?auto_348699 ?auto_348698 ) ) ( HOIST-AT ?auto_348702 ?auto_348699 ) ( not ( = ?auto_348701 ?auto_348702 ) ) ( AVAILABLE ?auto_348702 ) ( SURFACE-AT ?auto_348697 ?auto_348699 ) ( ON ?auto_348697 ?auto_348700 ) ( CLEAR ?auto_348697 ) ( not ( = ?auto_348696 ?auto_348700 ) ) ( not ( = ?auto_348697 ?auto_348700 ) ) ( not ( = ?auto_348695 ?auto_348700 ) ) ( TRUCK-AT ?auto_348703 ?auto_348698 ) ( SURFACE-AT ?auto_348695 ?auto_348698 ) ( CLEAR ?auto_348695 ) ( LIFTING ?auto_348701 ?auto_348696 ) ( IS-CRATE ?auto_348696 ) ( ON ?auto_348694 ?auto_348693 ) ( ON ?auto_348695 ?auto_348694 ) ( not ( = ?auto_348693 ?auto_348694 ) ) ( not ( = ?auto_348693 ?auto_348695 ) ) ( not ( = ?auto_348693 ?auto_348696 ) ) ( not ( = ?auto_348693 ?auto_348697 ) ) ( not ( = ?auto_348693 ?auto_348700 ) ) ( not ( = ?auto_348694 ?auto_348695 ) ) ( not ( = ?auto_348694 ?auto_348696 ) ) ( not ( = ?auto_348694 ?auto_348697 ) ) ( not ( = ?auto_348694 ?auto_348700 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348695 ?auto_348696 ?auto_348697 )
      ( MAKE-4CRATE-VERIFY ?auto_348693 ?auto_348694 ?auto_348695 ?auto_348696 ?auto_348697 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_348732 - SURFACE
      ?auto_348733 - SURFACE
      ?auto_348734 - SURFACE
      ?auto_348735 - SURFACE
      ?auto_348736 - SURFACE
    )
    :vars
    (
      ?auto_348742 - HOIST
      ?auto_348738 - PLACE
      ?auto_348741 - PLACE
      ?auto_348739 - HOIST
      ?auto_348737 - SURFACE
      ?auto_348740 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348742 ?auto_348738 ) ( IS-CRATE ?auto_348736 ) ( not ( = ?auto_348735 ?auto_348736 ) ) ( not ( = ?auto_348734 ?auto_348735 ) ) ( not ( = ?auto_348734 ?auto_348736 ) ) ( not ( = ?auto_348741 ?auto_348738 ) ) ( HOIST-AT ?auto_348739 ?auto_348741 ) ( not ( = ?auto_348742 ?auto_348739 ) ) ( AVAILABLE ?auto_348739 ) ( SURFACE-AT ?auto_348736 ?auto_348741 ) ( ON ?auto_348736 ?auto_348737 ) ( CLEAR ?auto_348736 ) ( not ( = ?auto_348735 ?auto_348737 ) ) ( not ( = ?auto_348736 ?auto_348737 ) ) ( not ( = ?auto_348734 ?auto_348737 ) ) ( TRUCK-AT ?auto_348740 ?auto_348738 ) ( SURFACE-AT ?auto_348734 ?auto_348738 ) ( CLEAR ?auto_348734 ) ( IS-CRATE ?auto_348735 ) ( AVAILABLE ?auto_348742 ) ( IN ?auto_348735 ?auto_348740 ) ( ON ?auto_348733 ?auto_348732 ) ( ON ?auto_348734 ?auto_348733 ) ( not ( = ?auto_348732 ?auto_348733 ) ) ( not ( = ?auto_348732 ?auto_348734 ) ) ( not ( = ?auto_348732 ?auto_348735 ) ) ( not ( = ?auto_348732 ?auto_348736 ) ) ( not ( = ?auto_348732 ?auto_348737 ) ) ( not ( = ?auto_348733 ?auto_348734 ) ) ( not ( = ?auto_348733 ?auto_348735 ) ) ( not ( = ?auto_348733 ?auto_348736 ) ) ( not ( = ?auto_348733 ?auto_348737 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348734 ?auto_348735 ?auto_348736 )
      ( MAKE-4CRATE-VERIFY ?auto_348732 ?auto_348733 ?auto_348734 ?auto_348735 ?auto_348736 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_349005 - SURFACE
      ?auto_349006 - SURFACE
    )
    :vars
    (
      ?auto_349011 - HOIST
      ?auto_349012 - PLACE
      ?auto_349008 - SURFACE
      ?auto_349007 - PLACE
      ?auto_349013 - HOIST
      ?auto_349009 - SURFACE
      ?auto_349010 - TRUCK
      ?auto_349014 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_349011 ?auto_349012 ) ( SURFACE-AT ?auto_349005 ?auto_349012 ) ( CLEAR ?auto_349005 ) ( IS-CRATE ?auto_349006 ) ( not ( = ?auto_349005 ?auto_349006 ) ) ( ON ?auto_349005 ?auto_349008 ) ( not ( = ?auto_349008 ?auto_349005 ) ) ( not ( = ?auto_349008 ?auto_349006 ) ) ( not ( = ?auto_349007 ?auto_349012 ) ) ( HOIST-AT ?auto_349013 ?auto_349007 ) ( not ( = ?auto_349011 ?auto_349013 ) ) ( AVAILABLE ?auto_349013 ) ( SURFACE-AT ?auto_349006 ?auto_349007 ) ( ON ?auto_349006 ?auto_349009 ) ( CLEAR ?auto_349006 ) ( not ( = ?auto_349005 ?auto_349009 ) ) ( not ( = ?auto_349006 ?auto_349009 ) ) ( not ( = ?auto_349008 ?auto_349009 ) ) ( TRUCK-AT ?auto_349010 ?auto_349012 ) ( LIFTING ?auto_349011 ?auto_349014 ) ( IS-CRATE ?auto_349014 ) ( not ( = ?auto_349005 ?auto_349014 ) ) ( not ( = ?auto_349006 ?auto_349014 ) ) ( not ( = ?auto_349008 ?auto_349014 ) ) ( not ( = ?auto_349009 ?auto_349014 ) ) )
    :subtasks
    ( ( !LOAD ?auto_349011 ?auto_349014 ?auto_349010 ?auto_349012 )
      ( MAKE-1CRATE ?auto_349005 ?auto_349006 )
      ( MAKE-1CRATE-VERIFY ?auto_349005 ?auto_349006 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_349391 - SURFACE
      ?auto_349392 - SURFACE
      ?auto_349393 - SURFACE
      ?auto_349394 - SURFACE
      ?auto_349395 - SURFACE
      ?auto_349396 - SURFACE
    )
    :vars
    (
      ?auto_349397 - HOIST
      ?auto_349398 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_349397 ?auto_349398 ) ( SURFACE-AT ?auto_349395 ?auto_349398 ) ( CLEAR ?auto_349395 ) ( LIFTING ?auto_349397 ?auto_349396 ) ( IS-CRATE ?auto_349396 ) ( not ( = ?auto_349395 ?auto_349396 ) ) ( ON ?auto_349392 ?auto_349391 ) ( ON ?auto_349393 ?auto_349392 ) ( ON ?auto_349394 ?auto_349393 ) ( ON ?auto_349395 ?auto_349394 ) ( not ( = ?auto_349391 ?auto_349392 ) ) ( not ( = ?auto_349391 ?auto_349393 ) ) ( not ( = ?auto_349391 ?auto_349394 ) ) ( not ( = ?auto_349391 ?auto_349395 ) ) ( not ( = ?auto_349391 ?auto_349396 ) ) ( not ( = ?auto_349392 ?auto_349393 ) ) ( not ( = ?auto_349392 ?auto_349394 ) ) ( not ( = ?auto_349392 ?auto_349395 ) ) ( not ( = ?auto_349392 ?auto_349396 ) ) ( not ( = ?auto_349393 ?auto_349394 ) ) ( not ( = ?auto_349393 ?auto_349395 ) ) ( not ( = ?auto_349393 ?auto_349396 ) ) ( not ( = ?auto_349394 ?auto_349395 ) ) ( not ( = ?auto_349394 ?auto_349396 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_349395 ?auto_349396 )
      ( MAKE-5CRATE-VERIFY ?auto_349391 ?auto_349392 ?auto_349393 ?auto_349394 ?auto_349395 ?auto_349396 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_349425 - SURFACE
      ?auto_349426 - SURFACE
      ?auto_349427 - SURFACE
      ?auto_349428 - SURFACE
      ?auto_349429 - SURFACE
      ?auto_349430 - SURFACE
    )
    :vars
    (
      ?auto_349432 - HOIST
      ?auto_349431 - PLACE
      ?auto_349433 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_349432 ?auto_349431 ) ( SURFACE-AT ?auto_349429 ?auto_349431 ) ( CLEAR ?auto_349429 ) ( IS-CRATE ?auto_349430 ) ( not ( = ?auto_349429 ?auto_349430 ) ) ( TRUCK-AT ?auto_349433 ?auto_349431 ) ( AVAILABLE ?auto_349432 ) ( IN ?auto_349430 ?auto_349433 ) ( ON ?auto_349429 ?auto_349428 ) ( not ( = ?auto_349428 ?auto_349429 ) ) ( not ( = ?auto_349428 ?auto_349430 ) ) ( ON ?auto_349426 ?auto_349425 ) ( ON ?auto_349427 ?auto_349426 ) ( ON ?auto_349428 ?auto_349427 ) ( not ( = ?auto_349425 ?auto_349426 ) ) ( not ( = ?auto_349425 ?auto_349427 ) ) ( not ( = ?auto_349425 ?auto_349428 ) ) ( not ( = ?auto_349425 ?auto_349429 ) ) ( not ( = ?auto_349425 ?auto_349430 ) ) ( not ( = ?auto_349426 ?auto_349427 ) ) ( not ( = ?auto_349426 ?auto_349428 ) ) ( not ( = ?auto_349426 ?auto_349429 ) ) ( not ( = ?auto_349426 ?auto_349430 ) ) ( not ( = ?auto_349427 ?auto_349428 ) ) ( not ( = ?auto_349427 ?auto_349429 ) ) ( not ( = ?auto_349427 ?auto_349430 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_349428 ?auto_349429 ?auto_349430 )
      ( MAKE-5CRATE-VERIFY ?auto_349425 ?auto_349426 ?auto_349427 ?auto_349428 ?auto_349429 ?auto_349430 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_349465 - SURFACE
      ?auto_349466 - SURFACE
      ?auto_349467 - SURFACE
      ?auto_349468 - SURFACE
      ?auto_349469 - SURFACE
      ?auto_349470 - SURFACE
    )
    :vars
    (
      ?auto_349474 - HOIST
      ?auto_349472 - PLACE
      ?auto_349471 - TRUCK
      ?auto_349473 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_349474 ?auto_349472 ) ( SURFACE-AT ?auto_349469 ?auto_349472 ) ( CLEAR ?auto_349469 ) ( IS-CRATE ?auto_349470 ) ( not ( = ?auto_349469 ?auto_349470 ) ) ( AVAILABLE ?auto_349474 ) ( IN ?auto_349470 ?auto_349471 ) ( ON ?auto_349469 ?auto_349468 ) ( not ( = ?auto_349468 ?auto_349469 ) ) ( not ( = ?auto_349468 ?auto_349470 ) ) ( TRUCK-AT ?auto_349471 ?auto_349473 ) ( not ( = ?auto_349473 ?auto_349472 ) ) ( ON ?auto_349466 ?auto_349465 ) ( ON ?auto_349467 ?auto_349466 ) ( ON ?auto_349468 ?auto_349467 ) ( not ( = ?auto_349465 ?auto_349466 ) ) ( not ( = ?auto_349465 ?auto_349467 ) ) ( not ( = ?auto_349465 ?auto_349468 ) ) ( not ( = ?auto_349465 ?auto_349469 ) ) ( not ( = ?auto_349465 ?auto_349470 ) ) ( not ( = ?auto_349466 ?auto_349467 ) ) ( not ( = ?auto_349466 ?auto_349468 ) ) ( not ( = ?auto_349466 ?auto_349469 ) ) ( not ( = ?auto_349466 ?auto_349470 ) ) ( not ( = ?auto_349467 ?auto_349468 ) ) ( not ( = ?auto_349467 ?auto_349469 ) ) ( not ( = ?auto_349467 ?auto_349470 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_349468 ?auto_349469 ?auto_349470 )
      ( MAKE-5CRATE-VERIFY ?auto_349465 ?auto_349466 ?auto_349467 ?auto_349468 ?auto_349469 ?auto_349470 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_349510 - SURFACE
      ?auto_349511 - SURFACE
      ?auto_349512 - SURFACE
      ?auto_349513 - SURFACE
      ?auto_349514 - SURFACE
      ?auto_349515 - SURFACE
    )
    :vars
    (
      ?auto_349519 - HOIST
      ?auto_349520 - PLACE
      ?auto_349517 - TRUCK
      ?auto_349516 - PLACE
      ?auto_349518 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_349519 ?auto_349520 ) ( SURFACE-AT ?auto_349514 ?auto_349520 ) ( CLEAR ?auto_349514 ) ( IS-CRATE ?auto_349515 ) ( not ( = ?auto_349514 ?auto_349515 ) ) ( AVAILABLE ?auto_349519 ) ( ON ?auto_349514 ?auto_349513 ) ( not ( = ?auto_349513 ?auto_349514 ) ) ( not ( = ?auto_349513 ?auto_349515 ) ) ( TRUCK-AT ?auto_349517 ?auto_349516 ) ( not ( = ?auto_349516 ?auto_349520 ) ) ( HOIST-AT ?auto_349518 ?auto_349516 ) ( LIFTING ?auto_349518 ?auto_349515 ) ( not ( = ?auto_349519 ?auto_349518 ) ) ( ON ?auto_349511 ?auto_349510 ) ( ON ?auto_349512 ?auto_349511 ) ( ON ?auto_349513 ?auto_349512 ) ( not ( = ?auto_349510 ?auto_349511 ) ) ( not ( = ?auto_349510 ?auto_349512 ) ) ( not ( = ?auto_349510 ?auto_349513 ) ) ( not ( = ?auto_349510 ?auto_349514 ) ) ( not ( = ?auto_349510 ?auto_349515 ) ) ( not ( = ?auto_349511 ?auto_349512 ) ) ( not ( = ?auto_349511 ?auto_349513 ) ) ( not ( = ?auto_349511 ?auto_349514 ) ) ( not ( = ?auto_349511 ?auto_349515 ) ) ( not ( = ?auto_349512 ?auto_349513 ) ) ( not ( = ?auto_349512 ?auto_349514 ) ) ( not ( = ?auto_349512 ?auto_349515 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_349513 ?auto_349514 ?auto_349515 )
      ( MAKE-5CRATE-VERIFY ?auto_349510 ?auto_349511 ?auto_349512 ?auto_349513 ?auto_349514 ?auto_349515 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_349560 - SURFACE
      ?auto_349561 - SURFACE
      ?auto_349562 - SURFACE
      ?auto_349563 - SURFACE
      ?auto_349564 - SURFACE
      ?auto_349565 - SURFACE
    )
    :vars
    (
      ?auto_349569 - HOIST
      ?auto_349568 - PLACE
      ?auto_349566 - TRUCK
      ?auto_349567 - PLACE
      ?auto_349570 - HOIST
      ?auto_349571 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_349569 ?auto_349568 ) ( SURFACE-AT ?auto_349564 ?auto_349568 ) ( CLEAR ?auto_349564 ) ( IS-CRATE ?auto_349565 ) ( not ( = ?auto_349564 ?auto_349565 ) ) ( AVAILABLE ?auto_349569 ) ( ON ?auto_349564 ?auto_349563 ) ( not ( = ?auto_349563 ?auto_349564 ) ) ( not ( = ?auto_349563 ?auto_349565 ) ) ( TRUCK-AT ?auto_349566 ?auto_349567 ) ( not ( = ?auto_349567 ?auto_349568 ) ) ( HOIST-AT ?auto_349570 ?auto_349567 ) ( not ( = ?auto_349569 ?auto_349570 ) ) ( AVAILABLE ?auto_349570 ) ( SURFACE-AT ?auto_349565 ?auto_349567 ) ( ON ?auto_349565 ?auto_349571 ) ( CLEAR ?auto_349565 ) ( not ( = ?auto_349564 ?auto_349571 ) ) ( not ( = ?auto_349565 ?auto_349571 ) ) ( not ( = ?auto_349563 ?auto_349571 ) ) ( ON ?auto_349561 ?auto_349560 ) ( ON ?auto_349562 ?auto_349561 ) ( ON ?auto_349563 ?auto_349562 ) ( not ( = ?auto_349560 ?auto_349561 ) ) ( not ( = ?auto_349560 ?auto_349562 ) ) ( not ( = ?auto_349560 ?auto_349563 ) ) ( not ( = ?auto_349560 ?auto_349564 ) ) ( not ( = ?auto_349560 ?auto_349565 ) ) ( not ( = ?auto_349560 ?auto_349571 ) ) ( not ( = ?auto_349561 ?auto_349562 ) ) ( not ( = ?auto_349561 ?auto_349563 ) ) ( not ( = ?auto_349561 ?auto_349564 ) ) ( not ( = ?auto_349561 ?auto_349565 ) ) ( not ( = ?auto_349561 ?auto_349571 ) ) ( not ( = ?auto_349562 ?auto_349563 ) ) ( not ( = ?auto_349562 ?auto_349564 ) ) ( not ( = ?auto_349562 ?auto_349565 ) ) ( not ( = ?auto_349562 ?auto_349571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_349563 ?auto_349564 ?auto_349565 )
      ( MAKE-5CRATE-VERIFY ?auto_349560 ?auto_349561 ?auto_349562 ?auto_349563 ?auto_349564 ?auto_349565 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_349611 - SURFACE
      ?auto_349612 - SURFACE
      ?auto_349613 - SURFACE
      ?auto_349614 - SURFACE
      ?auto_349615 - SURFACE
      ?auto_349616 - SURFACE
    )
    :vars
    (
      ?auto_349618 - HOIST
      ?auto_349620 - PLACE
      ?auto_349622 - PLACE
      ?auto_349619 - HOIST
      ?auto_349621 - SURFACE
      ?auto_349617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_349618 ?auto_349620 ) ( SURFACE-AT ?auto_349615 ?auto_349620 ) ( CLEAR ?auto_349615 ) ( IS-CRATE ?auto_349616 ) ( not ( = ?auto_349615 ?auto_349616 ) ) ( AVAILABLE ?auto_349618 ) ( ON ?auto_349615 ?auto_349614 ) ( not ( = ?auto_349614 ?auto_349615 ) ) ( not ( = ?auto_349614 ?auto_349616 ) ) ( not ( = ?auto_349622 ?auto_349620 ) ) ( HOIST-AT ?auto_349619 ?auto_349622 ) ( not ( = ?auto_349618 ?auto_349619 ) ) ( AVAILABLE ?auto_349619 ) ( SURFACE-AT ?auto_349616 ?auto_349622 ) ( ON ?auto_349616 ?auto_349621 ) ( CLEAR ?auto_349616 ) ( not ( = ?auto_349615 ?auto_349621 ) ) ( not ( = ?auto_349616 ?auto_349621 ) ) ( not ( = ?auto_349614 ?auto_349621 ) ) ( TRUCK-AT ?auto_349617 ?auto_349620 ) ( ON ?auto_349612 ?auto_349611 ) ( ON ?auto_349613 ?auto_349612 ) ( ON ?auto_349614 ?auto_349613 ) ( not ( = ?auto_349611 ?auto_349612 ) ) ( not ( = ?auto_349611 ?auto_349613 ) ) ( not ( = ?auto_349611 ?auto_349614 ) ) ( not ( = ?auto_349611 ?auto_349615 ) ) ( not ( = ?auto_349611 ?auto_349616 ) ) ( not ( = ?auto_349611 ?auto_349621 ) ) ( not ( = ?auto_349612 ?auto_349613 ) ) ( not ( = ?auto_349612 ?auto_349614 ) ) ( not ( = ?auto_349612 ?auto_349615 ) ) ( not ( = ?auto_349612 ?auto_349616 ) ) ( not ( = ?auto_349612 ?auto_349621 ) ) ( not ( = ?auto_349613 ?auto_349614 ) ) ( not ( = ?auto_349613 ?auto_349615 ) ) ( not ( = ?auto_349613 ?auto_349616 ) ) ( not ( = ?auto_349613 ?auto_349621 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_349614 ?auto_349615 ?auto_349616 )
      ( MAKE-5CRATE-VERIFY ?auto_349611 ?auto_349612 ?auto_349613 ?auto_349614 ?auto_349615 ?auto_349616 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_349662 - SURFACE
      ?auto_349663 - SURFACE
      ?auto_349664 - SURFACE
      ?auto_349665 - SURFACE
      ?auto_349666 - SURFACE
      ?auto_349667 - SURFACE
    )
    :vars
    (
      ?auto_349673 - HOIST
      ?auto_349671 - PLACE
      ?auto_349668 - PLACE
      ?auto_349670 - HOIST
      ?auto_349669 - SURFACE
      ?auto_349672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_349673 ?auto_349671 ) ( IS-CRATE ?auto_349667 ) ( not ( = ?auto_349666 ?auto_349667 ) ) ( not ( = ?auto_349665 ?auto_349666 ) ) ( not ( = ?auto_349665 ?auto_349667 ) ) ( not ( = ?auto_349668 ?auto_349671 ) ) ( HOIST-AT ?auto_349670 ?auto_349668 ) ( not ( = ?auto_349673 ?auto_349670 ) ) ( AVAILABLE ?auto_349670 ) ( SURFACE-AT ?auto_349667 ?auto_349668 ) ( ON ?auto_349667 ?auto_349669 ) ( CLEAR ?auto_349667 ) ( not ( = ?auto_349666 ?auto_349669 ) ) ( not ( = ?auto_349667 ?auto_349669 ) ) ( not ( = ?auto_349665 ?auto_349669 ) ) ( TRUCK-AT ?auto_349672 ?auto_349671 ) ( SURFACE-AT ?auto_349665 ?auto_349671 ) ( CLEAR ?auto_349665 ) ( LIFTING ?auto_349673 ?auto_349666 ) ( IS-CRATE ?auto_349666 ) ( ON ?auto_349663 ?auto_349662 ) ( ON ?auto_349664 ?auto_349663 ) ( ON ?auto_349665 ?auto_349664 ) ( not ( = ?auto_349662 ?auto_349663 ) ) ( not ( = ?auto_349662 ?auto_349664 ) ) ( not ( = ?auto_349662 ?auto_349665 ) ) ( not ( = ?auto_349662 ?auto_349666 ) ) ( not ( = ?auto_349662 ?auto_349667 ) ) ( not ( = ?auto_349662 ?auto_349669 ) ) ( not ( = ?auto_349663 ?auto_349664 ) ) ( not ( = ?auto_349663 ?auto_349665 ) ) ( not ( = ?auto_349663 ?auto_349666 ) ) ( not ( = ?auto_349663 ?auto_349667 ) ) ( not ( = ?auto_349663 ?auto_349669 ) ) ( not ( = ?auto_349664 ?auto_349665 ) ) ( not ( = ?auto_349664 ?auto_349666 ) ) ( not ( = ?auto_349664 ?auto_349667 ) ) ( not ( = ?auto_349664 ?auto_349669 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_349665 ?auto_349666 ?auto_349667 )
      ( MAKE-5CRATE-VERIFY ?auto_349662 ?auto_349663 ?auto_349664 ?auto_349665 ?auto_349666 ?auto_349667 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_349713 - SURFACE
      ?auto_349714 - SURFACE
      ?auto_349715 - SURFACE
      ?auto_349716 - SURFACE
      ?auto_349717 - SURFACE
      ?auto_349718 - SURFACE
    )
    :vars
    (
      ?auto_349719 - HOIST
      ?auto_349722 - PLACE
      ?auto_349720 - PLACE
      ?auto_349723 - HOIST
      ?auto_349724 - SURFACE
      ?auto_349721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_349719 ?auto_349722 ) ( IS-CRATE ?auto_349718 ) ( not ( = ?auto_349717 ?auto_349718 ) ) ( not ( = ?auto_349716 ?auto_349717 ) ) ( not ( = ?auto_349716 ?auto_349718 ) ) ( not ( = ?auto_349720 ?auto_349722 ) ) ( HOIST-AT ?auto_349723 ?auto_349720 ) ( not ( = ?auto_349719 ?auto_349723 ) ) ( AVAILABLE ?auto_349723 ) ( SURFACE-AT ?auto_349718 ?auto_349720 ) ( ON ?auto_349718 ?auto_349724 ) ( CLEAR ?auto_349718 ) ( not ( = ?auto_349717 ?auto_349724 ) ) ( not ( = ?auto_349718 ?auto_349724 ) ) ( not ( = ?auto_349716 ?auto_349724 ) ) ( TRUCK-AT ?auto_349721 ?auto_349722 ) ( SURFACE-AT ?auto_349716 ?auto_349722 ) ( CLEAR ?auto_349716 ) ( IS-CRATE ?auto_349717 ) ( AVAILABLE ?auto_349719 ) ( IN ?auto_349717 ?auto_349721 ) ( ON ?auto_349714 ?auto_349713 ) ( ON ?auto_349715 ?auto_349714 ) ( ON ?auto_349716 ?auto_349715 ) ( not ( = ?auto_349713 ?auto_349714 ) ) ( not ( = ?auto_349713 ?auto_349715 ) ) ( not ( = ?auto_349713 ?auto_349716 ) ) ( not ( = ?auto_349713 ?auto_349717 ) ) ( not ( = ?auto_349713 ?auto_349718 ) ) ( not ( = ?auto_349713 ?auto_349724 ) ) ( not ( = ?auto_349714 ?auto_349715 ) ) ( not ( = ?auto_349714 ?auto_349716 ) ) ( not ( = ?auto_349714 ?auto_349717 ) ) ( not ( = ?auto_349714 ?auto_349718 ) ) ( not ( = ?auto_349714 ?auto_349724 ) ) ( not ( = ?auto_349715 ?auto_349716 ) ) ( not ( = ?auto_349715 ?auto_349717 ) ) ( not ( = ?auto_349715 ?auto_349718 ) ) ( not ( = ?auto_349715 ?auto_349724 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_349716 ?auto_349717 ?auto_349718 )
      ( MAKE-5CRATE-VERIFY ?auto_349713 ?auto_349714 ?auto_349715 ?auto_349716 ?auto_349717 ?auto_349718 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_350922 - SURFACE
      ?auto_350923 - SURFACE
      ?auto_350924 - SURFACE
      ?auto_350925 - SURFACE
      ?auto_350926 - SURFACE
      ?auto_350927 - SURFACE
      ?auto_350928 - SURFACE
    )
    :vars
    (
      ?auto_350930 - HOIST
      ?auto_350929 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_350930 ?auto_350929 ) ( SURFACE-AT ?auto_350927 ?auto_350929 ) ( CLEAR ?auto_350927 ) ( LIFTING ?auto_350930 ?auto_350928 ) ( IS-CRATE ?auto_350928 ) ( not ( = ?auto_350927 ?auto_350928 ) ) ( ON ?auto_350923 ?auto_350922 ) ( ON ?auto_350924 ?auto_350923 ) ( ON ?auto_350925 ?auto_350924 ) ( ON ?auto_350926 ?auto_350925 ) ( ON ?auto_350927 ?auto_350926 ) ( not ( = ?auto_350922 ?auto_350923 ) ) ( not ( = ?auto_350922 ?auto_350924 ) ) ( not ( = ?auto_350922 ?auto_350925 ) ) ( not ( = ?auto_350922 ?auto_350926 ) ) ( not ( = ?auto_350922 ?auto_350927 ) ) ( not ( = ?auto_350922 ?auto_350928 ) ) ( not ( = ?auto_350923 ?auto_350924 ) ) ( not ( = ?auto_350923 ?auto_350925 ) ) ( not ( = ?auto_350923 ?auto_350926 ) ) ( not ( = ?auto_350923 ?auto_350927 ) ) ( not ( = ?auto_350923 ?auto_350928 ) ) ( not ( = ?auto_350924 ?auto_350925 ) ) ( not ( = ?auto_350924 ?auto_350926 ) ) ( not ( = ?auto_350924 ?auto_350927 ) ) ( not ( = ?auto_350924 ?auto_350928 ) ) ( not ( = ?auto_350925 ?auto_350926 ) ) ( not ( = ?auto_350925 ?auto_350927 ) ) ( not ( = ?auto_350925 ?auto_350928 ) ) ( not ( = ?auto_350926 ?auto_350927 ) ) ( not ( = ?auto_350926 ?auto_350928 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_350927 ?auto_350928 )
      ( MAKE-6CRATE-VERIFY ?auto_350922 ?auto_350923 ?auto_350924 ?auto_350925 ?auto_350926 ?auto_350927 ?auto_350928 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_350966 - SURFACE
      ?auto_350967 - SURFACE
      ?auto_350968 - SURFACE
      ?auto_350969 - SURFACE
      ?auto_350970 - SURFACE
      ?auto_350971 - SURFACE
      ?auto_350972 - SURFACE
    )
    :vars
    (
      ?auto_350975 - HOIST
      ?auto_350974 - PLACE
      ?auto_350973 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_350975 ?auto_350974 ) ( SURFACE-AT ?auto_350971 ?auto_350974 ) ( CLEAR ?auto_350971 ) ( IS-CRATE ?auto_350972 ) ( not ( = ?auto_350971 ?auto_350972 ) ) ( TRUCK-AT ?auto_350973 ?auto_350974 ) ( AVAILABLE ?auto_350975 ) ( IN ?auto_350972 ?auto_350973 ) ( ON ?auto_350971 ?auto_350970 ) ( not ( = ?auto_350970 ?auto_350971 ) ) ( not ( = ?auto_350970 ?auto_350972 ) ) ( ON ?auto_350967 ?auto_350966 ) ( ON ?auto_350968 ?auto_350967 ) ( ON ?auto_350969 ?auto_350968 ) ( ON ?auto_350970 ?auto_350969 ) ( not ( = ?auto_350966 ?auto_350967 ) ) ( not ( = ?auto_350966 ?auto_350968 ) ) ( not ( = ?auto_350966 ?auto_350969 ) ) ( not ( = ?auto_350966 ?auto_350970 ) ) ( not ( = ?auto_350966 ?auto_350971 ) ) ( not ( = ?auto_350966 ?auto_350972 ) ) ( not ( = ?auto_350967 ?auto_350968 ) ) ( not ( = ?auto_350967 ?auto_350969 ) ) ( not ( = ?auto_350967 ?auto_350970 ) ) ( not ( = ?auto_350967 ?auto_350971 ) ) ( not ( = ?auto_350967 ?auto_350972 ) ) ( not ( = ?auto_350968 ?auto_350969 ) ) ( not ( = ?auto_350968 ?auto_350970 ) ) ( not ( = ?auto_350968 ?auto_350971 ) ) ( not ( = ?auto_350968 ?auto_350972 ) ) ( not ( = ?auto_350969 ?auto_350970 ) ) ( not ( = ?auto_350969 ?auto_350971 ) ) ( not ( = ?auto_350969 ?auto_350972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_350970 ?auto_350971 ?auto_350972 )
      ( MAKE-6CRATE-VERIFY ?auto_350966 ?auto_350967 ?auto_350968 ?auto_350969 ?auto_350970 ?auto_350971 ?auto_350972 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_351017 - SURFACE
      ?auto_351018 - SURFACE
      ?auto_351019 - SURFACE
      ?auto_351020 - SURFACE
      ?auto_351021 - SURFACE
      ?auto_351022 - SURFACE
      ?auto_351023 - SURFACE
    )
    :vars
    (
      ?auto_351025 - HOIST
      ?auto_351027 - PLACE
      ?auto_351024 - TRUCK
      ?auto_351026 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_351025 ?auto_351027 ) ( SURFACE-AT ?auto_351022 ?auto_351027 ) ( CLEAR ?auto_351022 ) ( IS-CRATE ?auto_351023 ) ( not ( = ?auto_351022 ?auto_351023 ) ) ( AVAILABLE ?auto_351025 ) ( IN ?auto_351023 ?auto_351024 ) ( ON ?auto_351022 ?auto_351021 ) ( not ( = ?auto_351021 ?auto_351022 ) ) ( not ( = ?auto_351021 ?auto_351023 ) ) ( TRUCK-AT ?auto_351024 ?auto_351026 ) ( not ( = ?auto_351026 ?auto_351027 ) ) ( ON ?auto_351018 ?auto_351017 ) ( ON ?auto_351019 ?auto_351018 ) ( ON ?auto_351020 ?auto_351019 ) ( ON ?auto_351021 ?auto_351020 ) ( not ( = ?auto_351017 ?auto_351018 ) ) ( not ( = ?auto_351017 ?auto_351019 ) ) ( not ( = ?auto_351017 ?auto_351020 ) ) ( not ( = ?auto_351017 ?auto_351021 ) ) ( not ( = ?auto_351017 ?auto_351022 ) ) ( not ( = ?auto_351017 ?auto_351023 ) ) ( not ( = ?auto_351018 ?auto_351019 ) ) ( not ( = ?auto_351018 ?auto_351020 ) ) ( not ( = ?auto_351018 ?auto_351021 ) ) ( not ( = ?auto_351018 ?auto_351022 ) ) ( not ( = ?auto_351018 ?auto_351023 ) ) ( not ( = ?auto_351019 ?auto_351020 ) ) ( not ( = ?auto_351019 ?auto_351021 ) ) ( not ( = ?auto_351019 ?auto_351022 ) ) ( not ( = ?auto_351019 ?auto_351023 ) ) ( not ( = ?auto_351020 ?auto_351021 ) ) ( not ( = ?auto_351020 ?auto_351022 ) ) ( not ( = ?auto_351020 ?auto_351023 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_351021 ?auto_351022 ?auto_351023 )
      ( MAKE-6CRATE-VERIFY ?auto_351017 ?auto_351018 ?auto_351019 ?auto_351020 ?auto_351021 ?auto_351022 ?auto_351023 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_351074 - SURFACE
      ?auto_351075 - SURFACE
      ?auto_351076 - SURFACE
      ?auto_351077 - SURFACE
      ?auto_351078 - SURFACE
      ?auto_351079 - SURFACE
      ?auto_351080 - SURFACE
    )
    :vars
    (
      ?auto_351083 - HOIST
      ?auto_351082 - PLACE
      ?auto_351084 - TRUCK
      ?auto_351081 - PLACE
      ?auto_351085 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_351083 ?auto_351082 ) ( SURFACE-AT ?auto_351079 ?auto_351082 ) ( CLEAR ?auto_351079 ) ( IS-CRATE ?auto_351080 ) ( not ( = ?auto_351079 ?auto_351080 ) ) ( AVAILABLE ?auto_351083 ) ( ON ?auto_351079 ?auto_351078 ) ( not ( = ?auto_351078 ?auto_351079 ) ) ( not ( = ?auto_351078 ?auto_351080 ) ) ( TRUCK-AT ?auto_351084 ?auto_351081 ) ( not ( = ?auto_351081 ?auto_351082 ) ) ( HOIST-AT ?auto_351085 ?auto_351081 ) ( LIFTING ?auto_351085 ?auto_351080 ) ( not ( = ?auto_351083 ?auto_351085 ) ) ( ON ?auto_351075 ?auto_351074 ) ( ON ?auto_351076 ?auto_351075 ) ( ON ?auto_351077 ?auto_351076 ) ( ON ?auto_351078 ?auto_351077 ) ( not ( = ?auto_351074 ?auto_351075 ) ) ( not ( = ?auto_351074 ?auto_351076 ) ) ( not ( = ?auto_351074 ?auto_351077 ) ) ( not ( = ?auto_351074 ?auto_351078 ) ) ( not ( = ?auto_351074 ?auto_351079 ) ) ( not ( = ?auto_351074 ?auto_351080 ) ) ( not ( = ?auto_351075 ?auto_351076 ) ) ( not ( = ?auto_351075 ?auto_351077 ) ) ( not ( = ?auto_351075 ?auto_351078 ) ) ( not ( = ?auto_351075 ?auto_351079 ) ) ( not ( = ?auto_351075 ?auto_351080 ) ) ( not ( = ?auto_351076 ?auto_351077 ) ) ( not ( = ?auto_351076 ?auto_351078 ) ) ( not ( = ?auto_351076 ?auto_351079 ) ) ( not ( = ?auto_351076 ?auto_351080 ) ) ( not ( = ?auto_351077 ?auto_351078 ) ) ( not ( = ?auto_351077 ?auto_351079 ) ) ( not ( = ?auto_351077 ?auto_351080 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_351078 ?auto_351079 ?auto_351080 )
      ( MAKE-6CRATE-VERIFY ?auto_351074 ?auto_351075 ?auto_351076 ?auto_351077 ?auto_351078 ?auto_351079 ?auto_351080 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_351137 - SURFACE
      ?auto_351138 - SURFACE
      ?auto_351139 - SURFACE
      ?auto_351140 - SURFACE
      ?auto_351141 - SURFACE
      ?auto_351142 - SURFACE
      ?auto_351143 - SURFACE
    )
    :vars
    (
      ?auto_351148 - HOIST
      ?auto_351147 - PLACE
      ?auto_351149 - TRUCK
      ?auto_351146 - PLACE
      ?auto_351145 - HOIST
      ?auto_351144 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_351148 ?auto_351147 ) ( SURFACE-AT ?auto_351142 ?auto_351147 ) ( CLEAR ?auto_351142 ) ( IS-CRATE ?auto_351143 ) ( not ( = ?auto_351142 ?auto_351143 ) ) ( AVAILABLE ?auto_351148 ) ( ON ?auto_351142 ?auto_351141 ) ( not ( = ?auto_351141 ?auto_351142 ) ) ( not ( = ?auto_351141 ?auto_351143 ) ) ( TRUCK-AT ?auto_351149 ?auto_351146 ) ( not ( = ?auto_351146 ?auto_351147 ) ) ( HOIST-AT ?auto_351145 ?auto_351146 ) ( not ( = ?auto_351148 ?auto_351145 ) ) ( AVAILABLE ?auto_351145 ) ( SURFACE-AT ?auto_351143 ?auto_351146 ) ( ON ?auto_351143 ?auto_351144 ) ( CLEAR ?auto_351143 ) ( not ( = ?auto_351142 ?auto_351144 ) ) ( not ( = ?auto_351143 ?auto_351144 ) ) ( not ( = ?auto_351141 ?auto_351144 ) ) ( ON ?auto_351138 ?auto_351137 ) ( ON ?auto_351139 ?auto_351138 ) ( ON ?auto_351140 ?auto_351139 ) ( ON ?auto_351141 ?auto_351140 ) ( not ( = ?auto_351137 ?auto_351138 ) ) ( not ( = ?auto_351137 ?auto_351139 ) ) ( not ( = ?auto_351137 ?auto_351140 ) ) ( not ( = ?auto_351137 ?auto_351141 ) ) ( not ( = ?auto_351137 ?auto_351142 ) ) ( not ( = ?auto_351137 ?auto_351143 ) ) ( not ( = ?auto_351137 ?auto_351144 ) ) ( not ( = ?auto_351138 ?auto_351139 ) ) ( not ( = ?auto_351138 ?auto_351140 ) ) ( not ( = ?auto_351138 ?auto_351141 ) ) ( not ( = ?auto_351138 ?auto_351142 ) ) ( not ( = ?auto_351138 ?auto_351143 ) ) ( not ( = ?auto_351138 ?auto_351144 ) ) ( not ( = ?auto_351139 ?auto_351140 ) ) ( not ( = ?auto_351139 ?auto_351141 ) ) ( not ( = ?auto_351139 ?auto_351142 ) ) ( not ( = ?auto_351139 ?auto_351143 ) ) ( not ( = ?auto_351139 ?auto_351144 ) ) ( not ( = ?auto_351140 ?auto_351141 ) ) ( not ( = ?auto_351140 ?auto_351142 ) ) ( not ( = ?auto_351140 ?auto_351143 ) ) ( not ( = ?auto_351140 ?auto_351144 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_351141 ?auto_351142 ?auto_351143 )
      ( MAKE-6CRATE-VERIFY ?auto_351137 ?auto_351138 ?auto_351139 ?auto_351140 ?auto_351141 ?auto_351142 ?auto_351143 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_351201 - SURFACE
      ?auto_351202 - SURFACE
      ?auto_351203 - SURFACE
      ?auto_351204 - SURFACE
      ?auto_351205 - SURFACE
      ?auto_351206 - SURFACE
      ?auto_351207 - SURFACE
    )
    :vars
    (
      ?auto_351213 - HOIST
      ?auto_351211 - PLACE
      ?auto_351208 - PLACE
      ?auto_351209 - HOIST
      ?auto_351212 - SURFACE
      ?auto_351210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_351213 ?auto_351211 ) ( SURFACE-AT ?auto_351206 ?auto_351211 ) ( CLEAR ?auto_351206 ) ( IS-CRATE ?auto_351207 ) ( not ( = ?auto_351206 ?auto_351207 ) ) ( AVAILABLE ?auto_351213 ) ( ON ?auto_351206 ?auto_351205 ) ( not ( = ?auto_351205 ?auto_351206 ) ) ( not ( = ?auto_351205 ?auto_351207 ) ) ( not ( = ?auto_351208 ?auto_351211 ) ) ( HOIST-AT ?auto_351209 ?auto_351208 ) ( not ( = ?auto_351213 ?auto_351209 ) ) ( AVAILABLE ?auto_351209 ) ( SURFACE-AT ?auto_351207 ?auto_351208 ) ( ON ?auto_351207 ?auto_351212 ) ( CLEAR ?auto_351207 ) ( not ( = ?auto_351206 ?auto_351212 ) ) ( not ( = ?auto_351207 ?auto_351212 ) ) ( not ( = ?auto_351205 ?auto_351212 ) ) ( TRUCK-AT ?auto_351210 ?auto_351211 ) ( ON ?auto_351202 ?auto_351201 ) ( ON ?auto_351203 ?auto_351202 ) ( ON ?auto_351204 ?auto_351203 ) ( ON ?auto_351205 ?auto_351204 ) ( not ( = ?auto_351201 ?auto_351202 ) ) ( not ( = ?auto_351201 ?auto_351203 ) ) ( not ( = ?auto_351201 ?auto_351204 ) ) ( not ( = ?auto_351201 ?auto_351205 ) ) ( not ( = ?auto_351201 ?auto_351206 ) ) ( not ( = ?auto_351201 ?auto_351207 ) ) ( not ( = ?auto_351201 ?auto_351212 ) ) ( not ( = ?auto_351202 ?auto_351203 ) ) ( not ( = ?auto_351202 ?auto_351204 ) ) ( not ( = ?auto_351202 ?auto_351205 ) ) ( not ( = ?auto_351202 ?auto_351206 ) ) ( not ( = ?auto_351202 ?auto_351207 ) ) ( not ( = ?auto_351202 ?auto_351212 ) ) ( not ( = ?auto_351203 ?auto_351204 ) ) ( not ( = ?auto_351203 ?auto_351205 ) ) ( not ( = ?auto_351203 ?auto_351206 ) ) ( not ( = ?auto_351203 ?auto_351207 ) ) ( not ( = ?auto_351203 ?auto_351212 ) ) ( not ( = ?auto_351204 ?auto_351205 ) ) ( not ( = ?auto_351204 ?auto_351206 ) ) ( not ( = ?auto_351204 ?auto_351207 ) ) ( not ( = ?auto_351204 ?auto_351212 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_351205 ?auto_351206 ?auto_351207 )
      ( MAKE-6CRATE-VERIFY ?auto_351201 ?auto_351202 ?auto_351203 ?auto_351204 ?auto_351205 ?auto_351206 ?auto_351207 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_351265 - SURFACE
      ?auto_351266 - SURFACE
      ?auto_351267 - SURFACE
      ?auto_351268 - SURFACE
      ?auto_351269 - SURFACE
      ?auto_351270 - SURFACE
      ?auto_351271 - SURFACE
    )
    :vars
    (
      ?auto_351277 - HOIST
      ?auto_351274 - PLACE
      ?auto_351276 - PLACE
      ?auto_351273 - HOIST
      ?auto_351275 - SURFACE
      ?auto_351272 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_351277 ?auto_351274 ) ( IS-CRATE ?auto_351271 ) ( not ( = ?auto_351270 ?auto_351271 ) ) ( not ( = ?auto_351269 ?auto_351270 ) ) ( not ( = ?auto_351269 ?auto_351271 ) ) ( not ( = ?auto_351276 ?auto_351274 ) ) ( HOIST-AT ?auto_351273 ?auto_351276 ) ( not ( = ?auto_351277 ?auto_351273 ) ) ( AVAILABLE ?auto_351273 ) ( SURFACE-AT ?auto_351271 ?auto_351276 ) ( ON ?auto_351271 ?auto_351275 ) ( CLEAR ?auto_351271 ) ( not ( = ?auto_351270 ?auto_351275 ) ) ( not ( = ?auto_351271 ?auto_351275 ) ) ( not ( = ?auto_351269 ?auto_351275 ) ) ( TRUCK-AT ?auto_351272 ?auto_351274 ) ( SURFACE-AT ?auto_351269 ?auto_351274 ) ( CLEAR ?auto_351269 ) ( LIFTING ?auto_351277 ?auto_351270 ) ( IS-CRATE ?auto_351270 ) ( ON ?auto_351266 ?auto_351265 ) ( ON ?auto_351267 ?auto_351266 ) ( ON ?auto_351268 ?auto_351267 ) ( ON ?auto_351269 ?auto_351268 ) ( not ( = ?auto_351265 ?auto_351266 ) ) ( not ( = ?auto_351265 ?auto_351267 ) ) ( not ( = ?auto_351265 ?auto_351268 ) ) ( not ( = ?auto_351265 ?auto_351269 ) ) ( not ( = ?auto_351265 ?auto_351270 ) ) ( not ( = ?auto_351265 ?auto_351271 ) ) ( not ( = ?auto_351265 ?auto_351275 ) ) ( not ( = ?auto_351266 ?auto_351267 ) ) ( not ( = ?auto_351266 ?auto_351268 ) ) ( not ( = ?auto_351266 ?auto_351269 ) ) ( not ( = ?auto_351266 ?auto_351270 ) ) ( not ( = ?auto_351266 ?auto_351271 ) ) ( not ( = ?auto_351266 ?auto_351275 ) ) ( not ( = ?auto_351267 ?auto_351268 ) ) ( not ( = ?auto_351267 ?auto_351269 ) ) ( not ( = ?auto_351267 ?auto_351270 ) ) ( not ( = ?auto_351267 ?auto_351271 ) ) ( not ( = ?auto_351267 ?auto_351275 ) ) ( not ( = ?auto_351268 ?auto_351269 ) ) ( not ( = ?auto_351268 ?auto_351270 ) ) ( not ( = ?auto_351268 ?auto_351271 ) ) ( not ( = ?auto_351268 ?auto_351275 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_351269 ?auto_351270 ?auto_351271 )
      ( MAKE-6CRATE-VERIFY ?auto_351265 ?auto_351266 ?auto_351267 ?auto_351268 ?auto_351269 ?auto_351270 ?auto_351271 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_351329 - SURFACE
      ?auto_351330 - SURFACE
      ?auto_351331 - SURFACE
      ?auto_351332 - SURFACE
      ?auto_351333 - SURFACE
      ?auto_351334 - SURFACE
      ?auto_351335 - SURFACE
    )
    :vars
    (
      ?auto_351338 - HOIST
      ?auto_351337 - PLACE
      ?auto_351336 - PLACE
      ?auto_351339 - HOIST
      ?auto_351340 - SURFACE
      ?auto_351341 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_351338 ?auto_351337 ) ( IS-CRATE ?auto_351335 ) ( not ( = ?auto_351334 ?auto_351335 ) ) ( not ( = ?auto_351333 ?auto_351334 ) ) ( not ( = ?auto_351333 ?auto_351335 ) ) ( not ( = ?auto_351336 ?auto_351337 ) ) ( HOIST-AT ?auto_351339 ?auto_351336 ) ( not ( = ?auto_351338 ?auto_351339 ) ) ( AVAILABLE ?auto_351339 ) ( SURFACE-AT ?auto_351335 ?auto_351336 ) ( ON ?auto_351335 ?auto_351340 ) ( CLEAR ?auto_351335 ) ( not ( = ?auto_351334 ?auto_351340 ) ) ( not ( = ?auto_351335 ?auto_351340 ) ) ( not ( = ?auto_351333 ?auto_351340 ) ) ( TRUCK-AT ?auto_351341 ?auto_351337 ) ( SURFACE-AT ?auto_351333 ?auto_351337 ) ( CLEAR ?auto_351333 ) ( IS-CRATE ?auto_351334 ) ( AVAILABLE ?auto_351338 ) ( IN ?auto_351334 ?auto_351341 ) ( ON ?auto_351330 ?auto_351329 ) ( ON ?auto_351331 ?auto_351330 ) ( ON ?auto_351332 ?auto_351331 ) ( ON ?auto_351333 ?auto_351332 ) ( not ( = ?auto_351329 ?auto_351330 ) ) ( not ( = ?auto_351329 ?auto_351331 ) ) ( not ( = ?auto_351329 ?auto_351332 ) ) ( not ( = ?auto_351329 ?auto_351333 ) ) ( not ( = ?auto_351329 ?auto_351334 ) ) ( not ( = ?auto_351329 ?auto_351335 ) ) ( not ( = ?auto_351329 ?auto_351340 ) ) ( not ( = ?auto_351330 ?auto_351331 ) ) ( not ( = ?auto_351330 ?auto_351332 ) ) ( not ( = ?auto_351330 ?auto_351333 ) ) ( not ( = ?auto_351330 ?auto_351334 ) ) ( not ( = ?auto_351330 ?auto_351335 ) ) ( not ( = ?auto_351330 ?auto_351340 ) ) ( not ( = ?auto_351331 ?auto_351332 ) ) ( not ( = ?auto_351331 ?auto_351333 ) ) ( not ( = ?auto_351331 ?auto_351334 ) ) ( not ( = ?auto_351331 ?auto_351335 ) ) ( not ( = ?auto_351331 ?auto_351340 ) ) ( not ( = ?auto_351332 ?auto_351333 ) ) ( not ( = ?auto_351332 ?auto_351334 ) ) ( not ( = ?auto_351332 ?auto_351335 ) ) ( not ( = ?auto_351332 ?auto_351340 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_351333 ?auto_351334 ?auto_351335 )
      ( MAKE-6CRATE-VERIFY ?auto_351329 ?auto_351330 ?auto_351331 ?auto_351332 ?auto_351333 ?auto_351334 ?auto_351335 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353285 - SURFACE
      ?auto_353286 - SURFACE
      ?auto_353287 - SURFACE
      ?auto_353288 - SURFACE
      ?auto_353289 - SURFACE
      ?auto_353290 - SURFACE
      ?auto_353291 - SURFACE
      ?auto_353292 - SURFACE
    )
    :vars
    (
      ?auto_353294 - HOIST
      ?auto_353293 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_353294 ?auto_353293 ) ( SURFACE-AT ?auto_353291 ?auto_353293 ) ( CLEAR ?auto_353291 ) ( LIFTING ?auto_353294 ?auto_353292 ) ( IS-CRATE ?auto_353292 ) ( not ( = ?auto_353291 ?auto_353292 ) ) ( ON ?auto_353286 ?auto_353285 ) ( ON ?auto_353287 ?auto_353286 ) ( ON ?auto_353288 ?auto_353287 ) ( ON ?auto_353289 ?auto_353288 ) ( ON ?auto_353290 ?auto_353289 ) ( ON ?auto_353291 ?auto_353290 ) ( not ( = ?auto_353285 ?auto_353286 ) ) ( not ( = ?auto_353285 ?auto_353287 ) ) ( not ( = ?auto_353285 ?auto_353288 ) ) ( not ( = ?auto_353285 ?auto_353289 ) ) ( not ( = ?auto_353285 ?auto_353290 ) ) ( not ( = ?auto_353285 ?auto_353291 ) ) ( not ( = ?auto_353285 ?auto_353292 ) ) ( not ( = ?auto_353286 ?auto_353287 ) ) ( not ( = ?auto_353286 ?auto_353288 ) ) ( not ( = ?auto_353286 ?auto_353289 ) ) ( not ( = ?auto_353286 ?auto_353290 ) ) ( not ( = ?auto_353286 ?auto_353291 ) ) ( not ( = ?auto_353286 ?auto_353292 ) ) ( not ( = ?auto_353287 ?auto_353288 ) ) ( not ( = ?auto_353287 ?auto_353289 ) ) ( not ( = ?auto_353287 ?auto_353290 ) ) ( not ( = ?auto_353287 ?auto_353291 ) ) ( not ( = ?auto_353287 ?auto_353292 ) ) ( not ( = ?auto_353288 ?auto_353289 ) ) ( not ( = ?auto_353288 ?auto_353290 ) ) ( not ( = ?auto_353288 ?auto_353291 ) ) ( not ( = ?auto_353288 ?auto_353292 ) ) ( not ( = ?auto_353289 ?auto_353290 ) ) ( not ( = ?auto_353289 ?auto_353291 ) ) ( not ( = ?auto_353289 ?auto_353292 ) ) ( not ( = ?auto_353290 ?auto_353291 ) ) ( not ( = ?auto_353290 ?auto_353292 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_353291 ?auto_353292 )
      ( MAKE-7CRATE-VERIFY ?auto_353285 ?auto_353286 ?auto_353287 ?auto_353288 ?auto_353289 ?auto_353290 ?auto_353291 ?auto_353292 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353340 - SURFACE
      ?auto_353341 - SURFACE
      ?auto_353342 - SURFACE
      ?auto_353343 - SURFACE
      ?auto_353344 - SURFACE
      ?auto_353345 - SURFACE
      ?auto_353346 - SURFACE
      ?auto_353347 - SURFACE
    )
    :vars
    (
      ?auto_353350 - HOIST
      ?auto_353348 - PLACE
      ?auto_353349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353350 ?auto_353348 ) ( SURFACE-AT ?auto_353346 ?auto_353348 ) ( CLEAR ?auto_353346 ) ( IS-CRATE ?auto_353347 ) ( not ( = ?auto_353346 ?auto_353347 ) ) ( TRUCK-AT ?auto_353349 ?auto_353348 ) ( AVAILABLE ?auto_353350 ) ( IN ?auto_353347 ?auto_353349 ) ( ON ?auto_353346 ?auto_353345 ) ( not ( = ?auto_353345 ?auto_353346 ) ) ( not ( = ?auto_353345 ?auto_353347 ) ) ( ON ?auto_353341 ?auto_353340 ) ( ON ?auto_353342 ?auto_353341 ) ( ON ?auto_353343 ?auto_353342 ) ( ON ?auto_353344 ?auto_353343 ) ( ON ?auto_353345 ?auto_353344 ) ( not ( = ?auto_353340 ?auto_353341 ) ) ( not ( = ?auto_353340 ?auto_353342 ) ) ( not ( = ?auto_353340 ?auto_353343 ) ) ( not ( = ?auto_353340 ?auto_353344 ) ) ( not ( = ?auto_353340 ?auto_353345 ) ) ( not ( = ?auto_353340 ?auto_353346 ) ) ( not ( = ?auto_353340 ?auto_353347 ) ) ( not ( = ?auto_353341 ?auto_353342 ) ) ( not ( = ?auto_353341 ?auto_353343 ) ) ( not ( = ?auto_353341 ?auto_353344 ) ) ( not ( = ?auto_353341 ?auto_353345 ) ) ( not ( = ?auto_353341 ?auto_353346 ) ) ( not ( = ?auto_353341 ?auto_353347 ) ) ( not ( = ?auto_353342 ?auto_353343 ) ) ( not ( = ?auto_353342 ?auto_353344 ) ) ( not ( = ?auto_353342 ?auto_353345 ) ) ( not ( = ?auto_353342 ?auto_353346 ) ) ( not ( = ?auto_353342 ?auto_353347 ) ) ( not ( = ?auto_353343 ?auto_353344 ) ) ( not ( = ?auto_353343 ?auto_353345 ) ) ( not ( = ?auto_353343 ?auto_353346 ) ) ( not ( = ?auto_353343 ?auto_353347 ) ) ( not ( = ?auto_353344 ?auto_353345 ) ) ( not ( = ?auto_353344 ?auto_353346 ) ) ( not ( = ?auto_353344 ?auto_353347 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353345 ?auto_353346 ?auto_353347 )
      ( MAKE-7CRATE-VERIFY ?auto_353340 ?auto_353341 ?auto_353342 ?auto_353343 ?auto_353344 ?auto_353345 ?auto_353346 ?auto_353347 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353403 - SURFACE
      ?auto_353404 - SURFACE
      ?auto_353405 - SURFACE
      ?auto_353406 - SURFACE
      ?auto_353407 - SURFACE
      ?auto_353408 - SURFACE
      ?auto_353409 - SURFACE
      ?auto_353410 - SURFACE
    )
    :vars
    (
      ?auto_353413 - HOIST
      ?auto_353414 - PLACE
      ?auto_353411 - TRUCK
      ?auto_353412 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_353413 ?auto_353414 ) ( SURFACE-AT ?auto_353409 ?auto_353414 ) ( CLEAR ?auto_353409 ) ( IS-CRATE ?auto_353410 ) ( not ( = ?auto_353409 ?auto_353410 ) ) ( AVAILABLE ?auto_353413 ) ( IN ?auto_353410 ?auto_353411 ) ( ON ?auto_353409 ?auto_353408 ) ( not ( = ?auto_353408 ?auto_353409 ) ) ( not ( = ?auto_353408 ?auto_353410 ) ) ( TRUCK-AT ?auto_353411 ?auto_353412 ) ( not ( = ?auto_353412 ?auto_353414 ) ) ( ON ?auto_353404 ?auto_353403 ) ( ON ?auto_353405 ?auto_353404 ) ( ON ?auto_353406 ?auto_353405 ) ( ON ?auto_353407 ?auto_353406 ) ( ON ?auto_353408 ?auto_353407 ) ( not ( = ?auto_353403 ?auto_353404 ) ) ( not ( = ?auto_353403 ?auto_353405 ) ) ( not ( = ?auto_353403 ?auto_353406 ) ) ( not ( = ?auto_353403 ?auto_353407 ) ) ( not ( = ?auto_353403 ?auto_353408 ) ) ( not ( = ?auto_353403 ?auto_353409 ) ) ( not ( = ?auto_353403 ?auto_353410 ) ) ( not ( = ?auto_353404 ?auto_353405 ) ) ( not ( = ?auto_353404 ?auto_353406 ) ) ( not ( = ?auto_353404 ?auto_353407 ) ) ( not ( = ?auto_353404 ?auto_353408 ) ) ( not ( = ?auto_353404 ?auto_353409 ) ) ( not ( = ?auto_353404 ?auto_353410 ) ) ( not ( = ?auto_353405 ?auto_353406 ) ) ( not ( = ?auto_353405 ?auto_353407 ) ) ( not ( = ?auto_353405 ?auto_353408 ) ) ( not ( = ?auto_353405 ?auto_353409 ) ) ( not ( = ?auto_353405 ?auto_353410 ) ) ( not ( = ?auto_353406 ?auto_353407 ) ) ( not ( = ?auto_353406 ?auto_353408 ) ) ( not ( = ?auto_353406 ?auto_353409 ) ) ( not ( = ?auto_353406 ?auto_353410 ) ) ( not ( = ?auto_353407 ?auto_353408 ) ) ( not ( = ?auto_353407 ?auto_353409 ) ) ( not ( = ?auto_353407 ?auto_353410 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353408 ?auto_353409 ?auto_353410 )
      ( MAKE-7CRATE-VERIFY ?auto_353403 ?auto_353404 ?auto_353405 ?auto_353406 ?auto_353407 ?auto_353408 ?auto_353409 ?auto_353410 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353473 - SURFACE
      ?auto_353474 - SURFACE
      ?auto_353475 - SURFACE
      ?auto_353476 - SURFACE
      ?auto_353477 - SURFACE
      ?auto_353478 - SURFACE
      ?auto_353479 - SURFACE
      ?auto_353480 - SURFACE
    )
    :vars
    (
      ?auto_353485 - HOIST
      ?auto_353481 - PLACE
      ?auto_353482 - TRUCK
      ?auto_353484 - PLACE
      ?auto_353483 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_353485 ?auto_353481 ) ( SURFACE-AT ?auto_353479 ?auto_353481 ) ( CLEAR ?auto_353479 ) ( IS-CRATE ?auto_353480 ) ( not ( = ?auto_353479 ?auto_353480 ) ) ( AVAILABLE ?auto_353485 ) ( ON ?auto_353479 ?auto_353478 ) ( not ( = ?auto_353478 ?auto_353479 ) ) ( not ( = ?auto_353478 ?auto_353480 ) ) ( TRUCK-AT ?auto_353482 ?auto_353484 ) ( not ( = ?auto_353484 ?auto_353481 ) ) ( HOIST-AT ?auto_353483 ?auto_353484 ) ( LIFTING ?auto_353483 ?auto_353480 ) ( not ( = ?auto_353485 ?auto_353483 ) ) ( ON ?auto_353474 ?auto_353473 ) ( ON ?auto_353475 ?auto_353474 ) ( ON ?auto_353476 ?auto_353475 ) ( ON ?auto_353477 ?auto_353476 ) ( ON ?auto_353478 ?auto_353477 ) ( not ( = ?auto_353473 ?auto_353474 ) ) ( not ( = ?auto_353473 ?auto_353475 ) ) ( not ( = ?auto_353473 ?auto_353476 ) ) ( not ( = ?auto_353473 ?auto_353477 ) ) ( not ( = ?auto_353473 ?auto_353478 ) ) ( not ( = ?auto_353473 ?auto_353479 ) ) ( not ( = ?auto_353473 ?auto_353480 ) ) ( not ( = ?auto_353474 ?auto_353475 ) ) ( not ( = ?auto_353474 ?auto_353476 ) ) ( not ( = ?auto_353474 ?auto_353477 ) ) ( not ( = ?auto_353474 ?auto_353478 ) ) ( not ( = ?auto_353474 ?auto_353479 ) ) ( not ( = ?auto_353474 ?auto_353480 ) ) ( not ( = ?auto_353475 ?auto_353476 ) ) ( not ( = ?auto_353475 ?auto_353477 ) ) ( not ( = ?auto_353475 ?auto_353478 ) ) ( not ( = ?auto_353475 ?auto_353479 ) ) ( not ( = ?auto_353475 ?auto_353480 ) ) ( not ( = ?auto_353476 ?auto_353477 ) ) ( not ( = ?auto_353476 ?auto_353478 ) ) ( not ( = ?auto_353476 ?auto_353479 ) ) ( not ( = ?auto_353476 ?auto_353480 ) ) ( not ( = ?auto_353477 ?auto_353478 ) ) ( not ( = ?auto_353477 ?auto_353479 ) ) ( not ( = ?auto_353477 ?auto_353480 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353478 ?auto_353479 ?auto_353480 )
      ( MAKE-7CRATE-VERIFY ?auto_353473 ?auto_353474 ?auto_353475 ?auto_353476 ?auto_353477 ?auto_353478 ?auto_353479 ?auto_353480 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353550 - SURFACE
      ?auto_353551 - SURFACE
      ?auto_353552 - SURFACE
      ?auto_353553 - SURFACE
      ?auto_353554 - SURFACE
      ?auto_353555 - SURFACE
      ?auto_353556 - SURFACE
      ?auto_353557 - SURFACE
    )
    :vars
    (
      ?auto_353558 - HOIST
      ?auto_353561 - PLACE
      ?auto_353563 - TRUCK
      ?auto_353559 - PLACE
      ?auto_353562 - HOIST
      ?auto_353560 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_353558 ?auto_353561 ) ( SURFACE-AT ?auto_353556 ?auto_353561 ) ( CLEAR ?auto_353556 ) ( IS-CRATE ?auto_353557 ) ( not ( = ?auto_353556 ?auto_353557 ) ) ( AVAILABLE ?auto_353558 ) ( ON ?auto_353556 ?auto_353555 ) ( not ( = ?auto_353555 ?auto_353556 ) ) ( not ( = ?auto_353555 ?auto_353557 ) ) ( TRUCK-AT ?auto_353563 ?auto_353559 ) ( not ( = ?auto_353559 ?auto_353561 ) ) ( HOIST-AT ?auto_353562 ?auto_353559 ) ( not ( = ?auto_353558 ?auto_353562 ) ) ( AVAILABLE ?auto_353562 ) ( SURFACE-AT ?auto_353557 ?auto_353559 ) ( ON ?auto_353557 ?auto_353560 ) ( CLEAR ?auto_353557 ) ( not ( = ?auto_353556 ?auto_353560 ) ) ( not ( = ?auto_353557 ?auto_353560 ) ) ( not ( = ?auto_353555 ?auto_353560 ) ) ( ON ?auto_353551 ?auto_353550 ) ( ON ?auto_353552 ?auto_353551 ) ( ON ?auto_353553 ?auto_353552 ) ( ON ?auto_353554 ?auto_353553 ) ( ON ?auto_353555 ?auto_353554 ) ( not ( = ?auto_353550 ?auto_353551 ) ) ( not ( = ?auto_353550 ?auto_353552 ) ) ( not ( = ?auto_353550 ?auto_353553 ) ) ( not ( = ?auto_353550 ?auto_353554 ) ) ( not ( = ?auto_353550 ?auto_353555 ) ) ( not ( = ?auto_353550 ?auto_353556 ) ) ( not ( = ?auto_353550 ?auto_353557 ) ) ( not ( = ?auto_353550 ?auto_353560 ) ) ( not ( = ?auto_353551 ?auto_353552 ) ) ( not ( = ?auto_353551 ?auto_353553 ) ) ( not ( = ?auto_353551 ?auto_353554 ) ) ( not ( = ?auto_353551 ?auto_353555 ) ) ( not ( = ?auto_353551 ?auto_353556 ) ) ( not ( = ?auto_353551 ?auto_353557 ) ) ( not ( = ?auto_353551 ?auto_353560 ) ) ( not ( = ?auto_353552 ?auto_353553 ) ) ( not ( = ?auto_353552 ?auto_353554 ) ) ( not ( = ?auto_353552 ?auto_353555 ) ) ( not ( = ?auto_353552 ?auto_353556 ) ) ( not ( = ?auto_353552 ?auto_353557 ) ) ( not ( = ?auto_353552 ?auto_353560 ) ) ( not ( = ?auto_353553 ?auto_353554 ) ) ( not ( = ?auto_353553 ?auto_353555 ) ) ( not ( = ?auto_353553 ?auto_353556 ) ) ( not ( = ?auto_353553 ?auto_353557 ) ) ( not ( = ?auto_353553 ?auto_353560 ) ) ( not ( = ?auto_353554 ?auto_353555 ) ) ( not ( = ?auto_353554 ?auto_353556 ) ) ( not ( = ?auto_353554 ?auto_353557 ) ) ( not ( = ?auto_353554 ?auto_353560 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353555 ?auto_353556 ?auto_353557 )
      ( MAKE-7CRATE-VERIFY ?auto_353550 ?auto_353551 ?auto_353552 ?auto_353553 ?auto_353554 ?auto_353555 ?auto_353556 ?auto_353557 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353628 - SURFACE
      ?auto_353629 - SURFACE
      ?auto_353630 - SURFACE
      ?auto_353631 - SURFACE
      ?auto_353632 - SURFACE
      ?auto_353633 - SURFACE
      ?auto_353634 - SURFACE
      ?auto_353635 - SURFACE
    )
    :vars
    (
      ?auto_353637 - HOIST
      ?auto_353639 - PLACE
      ?auto_353636 - PLACE
      ?auto_353640 - HOIST
      ?auto_353641 - SURFACE
      ?auto_353638 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353637 ?auto_353639 ) ( SURFACE-AT ?auto_353634 ?auto_353639 ) ( CLEAR ?auto_353634 ) ( IS-CRATE ?auto_353635 ) ( not ( = ?auto_353634 ?auto_353635 ) ) ( AVAILABLE ?auto_353637 ) ( ON ?auto_353634 ?auto_353633 ) ( not ( = ?auto_353633 ?auto_353634 ) ) ( not ( = ?auto_353633 ?auto_353635 ) ) ( not ( = ?auto_353636 ?auto_353639 ) ) ( HOIST-AT ?auto_353640 ?auto_353636 ) ( not ( = ?auto_353637 ?auto_353640 ) ) ( AVAILABLE ?auto_353640 ) ( SURFACE-AT ?auto_353635 ?auto_353636 ) ( ON ?auto_353635 ?auto_353641 ) ( CLEAR ?auto_353635 ) ( not ( = ?auto_353634 ?auto_353641 ) ) ( not ( = ?auto_353635 ?auto_353641 ) ) ( not ( = ?auto_353633 ?auto_353641 ) ) ( TRUCK-AT ?auto_353638 ?auto_353639 ) ( ON ?auto_353629 ?auto_353628 ) ( ON ?auto_353630 ?auto_353629 ) ( ON ?auto_353631 ?auto_353630 ) ( ON ?auto_353632 ?auto_353631 ) ( ON ?auto_353633 ?auto_353632 ) ( not ( = ?auto_353628 ?auto_353629 ) ) ( not ( = ?auto_353628 ?auto_353630 ) ) ( not ( = ?auto_353628 ?auto_353631 ) ) ( not ( = ?auto_353628 ?auto_353632 ) ) ( not ( = ?auto_353628 ?auto_353633 ) ) ( not ( = ?auto_353628 ?auto_353634 ) ) ( not ( = ?auto_353628 ?auto_353635 ) ) ( not ( = ?auto_353628 ?auto_353641 ) ) ( not ( = ?auto_353629 ?auto_353630 ) ) ( not ( = ?auto_353629 ?auto_353631 ) ) ( not ( = ?auto_353629 ?auto_353632 ) ) ( not ( = ?auto_353629 ?auto_353633 ) ) ( not ( = ?auto_353629 ?auto_353634 ) ) ( not ( = ?auto_353629 ?auto_353635 ) ) ( not ( = ?auto_353629 ?auto_353641 ) ) ( not ( = ?auto_353630 ?auto_353631 ) ) ( not ( = ?auto_353630 ?auto_353632 ) ) ( not ( = ?auto_353630 ?auto_353633 ) ) ( not ( = ?auto_353630 ?auto_353634 ) ) ( not ( = ?auto_353630 ?auto_353635 ) ) ( not ( = ?auto_353630 ?auto_353641 ) ) ( not ( = ?auto_353631 ?auto_353632 ) ) ( not ( = ?auto_353631 ?auto_353633 ) ) ( not ( = ?auto_353631 ?auto_353634 ) ) ( not ( = ?auto_353631 ?auto_353635 ) ) ( not ( = ?auto_353631 ?auto_353641 ) ) ( not ( = ?auto_353632 ?auto_353633 ) ) ( not ( = ?auto_353632 ?auto_353634 ) ) ( not ( = ?auto_353632 ?auto_353635 ) ) ( not ( = ?auto_353632 ?auto_353641 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353633 ?auto_353634 ?auto_353635 )
      ( MAKE-7CRATE-VERIFY ?auto_353628 ?auto_353629 ?auto_353630 ?auto_353631 ?auto_353632 ?auto_353633 ?auto_353634 ?auto_353635 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353706 - SURFACE
      ?auto_353707 - SURFACE
      ?auto_353708 - SURFACE
      ?auto_353709 - SURFACE
      ?auto_353710 - SURFACE
      ?auto_353711 - SURFACE
      ?auto_353712 - SURFACE
      ?auto_353713 - SURFACE
    )
    :vars
    (
      ?auto_353715 - HOIST
      ?auto_353718 - PLACE
      ?auto_353714 - PLACE
      ?auto_353719 - HOIST
      ?auto_353717 - SURFACE
      ?auto_353716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353715 ?auto_353718 ) ( IS-CRATE ?auto_353713 ) ( not ( = ?auto_353712 ?auto_353713 ) ) ( not ( = ?auto_353711 ?auto_353712 ) ) ( not ( = ?auto_353711 ?auto_353713 ) ) ( not ( = ?auto_353714 ?auto_353718 ) ) ( HOIST-AT ?auto_353719 ?auto_353714 ) ( not ( = ?auto_353715 ?auto_353719 ) ) ( AVAILABLE ?auto_353719 ) ( SURFACE-AT ?auto_353713 ?auto_353714 ) ( ON ?auto_353713 ?auto_353717 ) ( CLEAR ?auto_353713 ) ( not ( = ?auto_353712 ?auto_353717 ) ) ( not ( = ?auto_353713 ?auto_353717 ) ) ( not ( = ?auto_353711 ?auto_353717 ) ) ( TRUCK-AT ?auto_353716 ?auto_353718 ) ( SURFACE-AT ?auto_353711 ?auto_353718 ) ( CLEAR ?auto_353711 ) ( LIFTING ?auto_353715 ?auto_353712 ) ( IS-CRATE ?auto_353712 ) ( ON ?auto_353707 ?auto_353706 ) ( ON ?auto_353708 ?auto_353707 ) ( ON ?auto_353709 ?auto_353708 ) ( ON ?auto_353710 ?auto_353709 ) ( ON ?auto_353711 ?auto_353710 ) ( not ( = ?auto_353706 ?auto_353707 ) ) ( not ( = ?auto_353706 ?auto_353708 ) ) ( not ( = ?auto_353706 ?auto_353709 ) ) ( not ( = ?auto_353706 ?auto_353710 ) ) ( not ( = ?auto_353706 ?auto_353711 ) ) ( not ( = ?auto_353706 ?auto_353712 ) ) ( not ( = ?auto_353706 ?auto_353713 ) ) ( not ( = ?auto_353706 ?auto_353717 ) ) ( not ( = ?auto_353707 ?auto_353708 ) ) ( not ( = ?auto_353707 ?auto_353709 ) ) ( not ( = ?auto_353707 ?auto_353710 ) ) ( not ( = ?auto_353707 ?auto_353711 ) ) ( not ( = ?auto_353707 ?auto_353712 ) ) ( not ( = ?auto_353707 ?auto_353713 ) ) ( not ( = ?auto_353707 ?auto_353717 ) ) ( not ( = ?auto_353708 ?auto_353709 ) ) ( not ( = ?auto_353708 ?auto_353710 ) ) ( not ( = ?auto_353708 ?auto_353711 ) ) ( not ( = ?auto_353708 ?auto_353712 ) ) ( not ( = ?auto_353708 ?auto_353713 ) ) ( not ( = ?auto_353708 ?auto_353717 ) ) ( not ( = ?auto_353709 ?auto_353710 ) ) ( not ( = ?auto_353709 ?auto_353711 ) ) ( not ( = ?auto_353709 ?auto_353712 ) ) ( not ( = ?auto_353709 ?auto_353713 ) ) ( not ( = ?auto_353709 ?auto_353717 ) ) ( not ( = ?auto_353710 ?auto_353711 ) ) ( not ( = ?auto_353710 ?auto_353712 ) ) ( not ( = ?auto_353710 ?auto_353713 ) ) ( not ( = ?auto_353710 ?auto_353717 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353711 ?auto_353712 ?auto_353713 )
      ( MAKE-7CRATE-VERIFY ?auto_353706 ?auto_353707 ?auto_353708 ?auto_353709 ?auto_353710 ?auto_353711 ?auto_353712 ?auto_353713 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353784 - SURFACE
      ?auto_353785 - SURFACE
      ?auto_353786 - SURFACE
      ?auto_353787 - SURFACE
      ?auto_353788 - SURFACE
      ?auto_353789 - SURFACE
      ?auto_353790 - SURFACE
      ?auto_353791 - SURFACE
    )
    :vars
    (
      ?auto_353796 - HOIST
      ?auto_353795 - PLACE
      ?auto_353793 - PLACE
      ?auto_353794 - HOIST
      ?auto_353792 - SURFACE
      ?auto_353797 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353796 ?auto_353795 ) ( IS-CRATE ?auto_353791 ) ( not ( = ?auto_353790 ?auto_353791 ) ) ( not ( = ?auto_353789 ?auto_353790 ) ) ( not ( = ?auto_353789 ?auto_353791 ) ) ( not ( = ?auto_353793 ?auto_353795 ) ) ( HOIST-AT ?auto_353794 ?auto_353793 ) ( not ( = ?auto_353796 ?auto_353794 ) ) ( AVAILABLE ?auto_353794 ) ( SURFACE-AT ?auto_353791 ?auto_353793 ) ( ON ?auto_353791 ?auto_353792 ) ( CLEAR ?auto_353791 ) ( not ( = ?auto_353790 ?auto_353792 ) ) ( not ( = ?auto_353791 ?auto_353792 ) ) ( not ( = ?auto_353789 ?auto_353792 ) ) ( TRUCK-AT ?auto_353797 ?auto_353795 ) ( SURFACE-AT ?auto_353789 ?auto_353795 ) ( CLEAR ?auto_353789 ) ( IS-CRATE ?auto_353790 ) ( AVAILABLE ?auto_353796 ) ( IN ?auto_353790 ?auto_353797 ) ( ON ?auto_353785 ?auto_353784 ) ( ON ?auto_353786 ?auto_353785 ) ( ON ?auto_353787 ?auto_353786 ) ( ON ?auto_353788 ?auto_353787 ) ( ON ?auto_353789 ?auto_353788 ) ( not ( = ?auto_353784 ?auto_353785 ) ) ( not ( = ?auto_353784 ?auto_353786 ) ) ( not ( = ?auto_353784 ?auto_353787 ) ) ( not ( = ?auto_353784 ?auto_353788 ) ) ( not ( = ?auto_353784 ?auto_353789 ) ) ( not ( = ?auto_353784 ?auto_353790 ) ) ( not ( = ?auto_353784 ?auto_353791 ) ) ( not ( = ?auto_353784 ?auto_353792 ) ) ( not ( = ?auto_353785 ?auto_353786 ) ) ( not ( = ?auto_353785 ?auto_353787 ) ) ( not ( = ?auto_353785 ?auto_353788 ) ) ( not ( = ?auto_353785 ?auto_353789 ) ) ( not ( = ?auto_353785 ?auto_353790 ) ) ( not ( = ?auto_353785 ?auto_353791 ) ) ( not ( = ?auto_353785 ?auto_353792 ) ) ( not ( = ?auto_353786 ?auto_353787 ) ) ( not ( = ?auto_353786 ?auto_353788 ) ) ( not ( = ?auto_353786 ?auto_353789 ) ) ( not ( = ?auto_353786 ?auto_353790 ) ) ( not ( = ?auto_353786 ?auto_353791 ) ) ( not ( = ?auto_353786 ?auto_353792 ) ) ( not ( = ?auto_353787 ?auto_353788 ) ) ( not ( = ?auto_353787 ?auto_353789 ) ) ( not ( = ?auto_353787 ?auto_353790 ) ) ( not ( = ?auto_353787 ?auto_353791 ) ) ( not ( = ?auto_353787 ?auto_353792 ) ) ( not ( = ?auto_353788 ?auto_353789 ) ) ( not ( = ?auto_353788 ?auto_353790 ) ) ( not ( = ?auto_353788 ?auto_353791 ) ) ( not ( = ?auto_353788 ?auto_353792 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353789 ?auto_353790 ?auto_353791 )
      ( MAKE-7CRATE-VERIFY ?auto_353784 ?auto_353785 ?auto_353786 ?auto_353787 ?auto_353788 ?auto_353789 ?auto_353790 ?auto_353791 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_356703 - SURFACE
      ?auto_356704 - SURFACE
      ?auto_356705 - SURFACE
      ?auto_356706 - SURFACE
      ?auto_356707 - SURFACE
      ?auto_356708 - SURFACE
      ?auto_356709 - SURFACE
      ?auto_356710 - SURFACE
      ?auto_356711 - SURFACE
    )
    :vars
    (
      ?auto_356712 - HOIST
      ?auto_356713 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_356712 ?auto_356713 ) ( SURFACE-AT ?auto_356710 ?auto_356713 ) ( CLEAR ?auto_356710 ) ( LIFTING ?auto_356712 ?auto_356711 ) ( IS-CRATE ?auto_356711 ) ( not ( = ?auto_356710 ?auto_356711 ) ) ( ON ?auto_356704 ?auto_356703 ) ( ON ?auto_356705 ?auto_356704 ) ( ON ?auto_356706 ?auto_356705 ) ( ON ?auto_356707 ?auto_356706 ) ( ON ?auto_356708 ?auto_356707 ) ( ON ?auto_356709 ?auto_356708 ) ( ON ?auto_356710 ?auto_356709 ) ( not ( = ?auto_356703 ?auto_356704 ) ) ( not ( = ?auto_356703 ?auto_356705 ) ) ( not ( = ?auto_356703 ?auto_356706 ) ) ( not ( = ?auto_356703 ?auto_356707 ) ) ( not ( = ?auto_356703 ?auto_356708 ) ) ( not ( = ?auto_356703 ?auto_356709 ) ) ( not ( = ?auto_356703 ?auto_356710 ) ) ( not ( = ?auto_356703 ?auto_356711 ) ) ( not ( = ?auto_356704 ?auto_356705 ) ) ( not ( = ?auto_356704 ?auto_356706 ) ) ( not ( = ?auto_356704 ?auto_356707 ) ) ( not ( = ?auto_356704 ?auto_356708 ) ) ( not ( = ?auto_356704 ?auto_356709 ) ) ( not ( = ?auto_356704 ?auto_356710 ) ) ( not ( = ?auto_356704 ?auto_356711 ) ) ( not ( = ?auto_356705 ?auto_356706 ) ) ( not ( = ?auto_356705 ?auto_356707 ) ) ( not ( = ?auto_356705 ?auto_356708 ) ) ( not ( = ?auto_356705 ?auto_356709 ) ) ( not ( = ?auto_356705 ?auto_356710 ) ) ( not ( = ?auto_356705 ?auto_356711 ) ) ( not ( = ?auto_356706 ?auto_356707 ) ) ( not ( = ?auto_356706 ?auto_356708 ) ) ( not ( = ?auto_356706 ?auto_356709 ) ) ( not ( = ?auto_356706 ?auto_356710 ) ) ( not ( = ?auto_356706 ?auto_356711 ) ) ( not ( = ?auto_356707 ?auto_356708 ) ) ( not ( = ?auto_356707 ?auto_356709 ) ) ( not ( = ?auto_356707 ?auto_356710 ) ) ( not ( = ?auto_356707 ?auto_356711 ) ) ( not ( = ?auto_356708 ?auto_356709 ) ) ( not ( = ?auto_356708 ?auto_356710 ) ) ( not ( = ?auto_356708 ?auto_356711 ) ) ( not ( = ?auto_356709 ?auto_356710 ) ) ( not ( = ?auto_356709 ?auto_356711 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_356710 ?auto_356711 )
      ( MAKE-8CRATE-VERIFY ?auto_356703 ?auto_356704 ?auto_356705 ?auto_356706 ?auto_356707 ?auto_356708 ?auto_356709 ?auto_356710 ?auto_356711 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_356770 - SURFACE
      ?auto_356771 - SURFACE
      ?auto_356772 - SURFACE
      ?auto_356773 - SURFACE
      ?auto_356774 - SURFACE
      ?auto_356775 - SURFACE
      ?auto_356776 - SURFACE
      ?auto_356777 - SURFACE
      ?auto_356778 - SURFACE
    )
    :vars
    (
      ?auto_356780 - HOIST
      ?auto_356779 - PLACE
      ?auto_356781 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_356780 ?auto_356779 ) ( SURFACE-AT ?auto_356777 ?auto_356779 ) ( CLEAR ?auto_356777 ) ( IS-CRATE ?auto_356778 ) ( not ( = ?auto_356777 ?auto_356778 ) ) ( TRUCK-AT ?auto_356781 ?auto_356779 ) ( AVAILABLE ?auto_356780 ) ( IN ?auto_356778 ?auto_356781 ) ( ON ?auto_356777 ?auto_356776 ) ( not ( = ?auto_356776 ?auto_356777 ) ) ( not ( = ?auto_356776 ?auto_356778 ) ) ( ON ?auto_356771 ?auto_356770 ) ( ON ?auto_356772 ?auto_356771 ) ( ON ?auto_356773 ?auto_356772 ) ( ON ?auto_356774 ?auto_356773 ) ( ON ?auto_356775 ?auto_356774 ) ( ON ?auto_356776 ?auto_356775 ) ( not ( = ?auto_356770 ?auto_356771 ) ) ( not ( = ?auto_356770 ?auto_356772 ) ) ( not ( = ?auto_356770 ?auto_356773 ) ) ( not ( = ?auto_356770 ?auto_356774 ) ) ( not ( = ?auto_356770 ?auto_356775 ) ) ( not ( = ?auto_356770 ?auto_356776 ) ) ( not ( = ?auto_356770 ?auto_356777 ) ) ( not ( = ?auto_356770 ?auto_356778 ) ) ( not ( = ?auto_356771 ?auto_356772 ) ) ( not ( = ?auto_356771 ?auto_356773 ) ) ( not ( = ?auto_356771 ?auto_356774 ) ) ( not ( = ?auto_356771 ?auto_356775 ) ) ( not ( = ?auto_356771 ?auto_356776 ) ) ( not ( = ?auto_356771 ?auto_356777 ) ) ( not ( = ?auto_356771 ?auto_356778 ) ) ( not ( = ?auto_356772 ?auto_356773 ) ) ( not ( = ?auto_356772 ?auto_356774 ) ) ( not ( = ?auto_356772 ?auto_356775 ) ) ( not ( = ?auto_356772 ?auto_356776 ) ) ( not ( = ?auto_356772 ?auto_356777 ) ) ( not ( = ?auto_356772 ?auto_356778 ) ) ( not ( = ?auto_356773 ?auto_356774 ) ) ( not ( = ?auto_356773 ?auto_356775 ) ) ( not ( = ?auto_356773 ?auto_356776 ) ) ( not ( = ?auto_356773 ?auto_356777 ) ) ( not ( = ?auto_356773 ?auto_356778 ) ) ( not ( = ?auto_356774 ?auto_356775 ) ) ( not ( = ?auto_356774 ?auto_356776 ) ) ( not ( = ?auto_356774 ?auto_356777 ) ) ( not ( = ?auto_356774 ?auto_356778 ) ) ( not ( = ?auto_356775 ?auto_356776 ) ) ( not ( = ?auto_356775 ?auto_356777 ) ) ( not ( = ?auto_356775 ?auto_356778 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_356776 ?auto_356777 ?auto_356778 )
      ( MAKE-8CRATE-VERIFY ?auto_356770 ?auto_356771 ?auto_356772 ?auto_356773 ?auto_356774 ?auto_356775 ?auto_356776 ?auto_356777 ?auto_356778 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_356846 - SURFACE
      ?auto_356847 - SURFACE
      ?auto_356848 - SURFACE
      ?auto_356849 - SURFACE
      ?auto_356850 - SURFACE
      ?auto_356851 - SURFACE
      ?auto_356852 - SURFACE
      ?auto_356853 - SURFACE
      ?auto_356854 - SURFACE
    )
    :vars
    (
      ?auto_356857 - HOIST
      ?auto_356858 - PLACE
      ?auto_356856 - TRUCK
      ?auto_356855 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_356857 ?auto_356858 ) ( SURFACE-AT ?auto_356853 ?auto_356858 ) ( CLEAR ?auto_356853 ) ( IS-CRATE ?auto_356854 ) ( not ( = ?auto_356853 ?auto_356854 ) ) ( AVAILABLE ?auto_356857 ) ( IN ?auto_356854 ?auto_356856 ) ( ON ?auto_356853 ?auto_356852 ) ( not ( = ?auto_356852 ?auto_356853 ) ) ( not ( = ?auto_356852 ?auto_356854 ) ) ( TRUCK-AT ?auto_356856 ?auto_356855 ) ( not ( = ?auto_356855 ?auto_356858 ) ) ( ON ?auto_356847 ?auto_356846 ) ( ON ?auto_356848 ?auto_356847 ) ( ON ?auto_356849 ?auto_356848 ) ( ON ?auto_356850 ?auto_356849 ) ( ON ?auto_356851 ?auto_356850 ) ( ON ?auto_356852 ?auto_356851 ) ( not ( = ?auto_356846 ?auto_356847 ) ) ( not ( = ?auto_356846 ?auto_356848 ) ) ( not ( = ?auto_356846 ?auto_356849 ) ) ( not ( = ?auto_356846 ?auto_356850 ) ) ( not ( = ?auto_356846 ?auto_356851 ) ) ( not ( = ?auto_356846 ?auto_356852 ) ) ( not ( = ?auto_356846 ?auto_356853 ) ) ( not ( = ?auto_356846 ?auto_356854 ) ) ( not ( = ?auto_356847 ?auto_356848 ) ) ( not ( = ?auto_356847 ?auto_356849 ) ) ( not ( = ?auto_356847 ?auto_356850 ) ) ( not ( = ?auto_356847 ?auto_356851 ) ) ( not ( = ?auto_356847 ?auto_356852 ) ) ( not ( = ?auto_356847 ?auto_356853 ) ) ( not ( = ?auto_356847 ?auto_356854 ) ) ( not ( = ?auto_356848 ?auto_356849 ) ) ( not ( = ?auto_356848 ?auto_356850 ) ) ( not ( = ?auto_356848 ?auto_356851 ) ) ( not ( = ?auto_356848 ?auto_356852 ) ) ( not ( = ?auto_356848 ?auto_356853 ) ) ( not ( = ?auto_356848 ?auto_356854 ) ) ( not ( = ?auto_356849 ?auto_356850 ) ) ( not ( = ?auto_356849 ?auto_356851 ) ) ( not ( = ?auto_356849 ?auto_356852 ) ) ( not ( = ?auto_356849 ?auto_356853 ) ) ( not ( = ?auto_356849 ?auto_356854 ) ) ( not ( = ?auto_356850 ?auto_356851 ) ) ( not ( = ?auto_356850 ?auto_356852 ) ) ( not ( = ?auto_356850 ?auto_356853 ) ) ( not ( = ?auto_356850 ?auto_356854 ) ) ( not ( = ?auto_356851 ?auto_356852 ) ) ( not ( = ?auto_356851 ?auto_356853 ) ) ( not ( = ?auto_356851 ?auto_356854 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_356852 ?auto_356853 ?auto_356854 )
      ( MAKE-8CRATE-VERIFY ?auto_356846 ?auto_356847 ?auto_356848 ?auto_356849 ?auto_356850 ?auto_356851 ?auto_356852 ?auto_356853 ?auto_356854 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_356930 - SURFACE
      ?auto_356931 - SURFACE
      ?auto_356932 - SURFACE
      ?auto_356933 - SURFACE
      ?auto_356934 - SURFACE
      ?auto_356935 - SURFACE
      ?auto_356936 - SURFACE
      ?auto_356937 - SURFACE
      ?auto_356938 - SURFACE
    )
    :vars
    (
      ?auto_356943 - HOIST
      ?auto_356939 - PLACE
      ?auto_356941 - TRUCK
      ?auto_356940 - PLACE
      ?auto_356942 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_356943 ?auto_356939 ) ( SURFACE-AT ?auto_356937 ?auto_356939 ) ( CLEAR ?auto_356937 ) ( IS-CRATE ?auto_356938 ) ( not ( = ?auto_356937 ?auto_356938 ) ) ( AVAILABLE ?auto_356943 ) ( ON ?auto_356937 ?auto_356936 ) ( not ( = ?auto_356936 ?auto_356937 ) ) ( not ( = ?auto_356936 ?auto_356938 ) ) ( TRUCK-AT ?auto_356941 ?auto_356940 ) ( not ( = ?auto_356940 ?auto_356939 ) ) ( HOIST-AT ?auto_356942 ?auto_356940 ) ( LIFTING ?auto_356942 ?auto_356938 ) ( not ( = ?auto_356943 ?auto_356942 ) ) ( ON ?auto_356931 ?auto_356930 ) ( ON ?auto_356932 ?auto_356931 ) ( ON ?auto_356933 ?auto_356932 ) ( ON ?auto_356934 ?auto_356933 ) ( ON ?auto_356935 ?auto_356934 ) ( ON ?auto_356936 ?auto_356935 ) ( not ( = ?auto_356930 ?auto_356931 ) ) ( not ( = ?auto_356930 ?auto_356932 ) ) ( not ( = ?auto_356930 ?auto_356933 ) ) ( not ( = ?auto_356930 ?auto_356934 ) ) ( not ( = ?auto_356930 ?auto_356935 ) ) ( not ( = ?auto_356930 ?auto_356936 ) ) ( not ( = ?auto_356930 ?auto_356937 ) ) ( not ( = ?auto_356930 ?auto_356938 ) ) ( not ( = ?auto_356931 ?auto_356932 ) ) ( not ( = ?auto_356931 ?auto_356933 ) ) ( not ( = ?auto_356931 ?auto_356934 ) ) ( not ( = ?auto_356931 ?auto_356935 ) ) ( not ( = ?auto_356931 ?auto_356936 ) ) ( not ( = ?auto_356931 ?auto_356937 ) ) ( not ( = ?auto_356931 ?auto_356938 ) ) ( not ( = ?auto_356932 ?auto_356933 ) ) ( not ( = ?auto_356932 ?auto_356934 ) ) ( not ( = ?auto_356932 ?auto_356935 ) ) ( not ( = ?auto_356932 ?auto_356936 ) ) ( not ( = ?auto_356932 ?auto_356937 ) ) ( not ( = ?auto_356932 ?auto_356938 ) ) ( not ( = ?auto_356933 ?auto_356934 ) ) ( not ( = ?auto_356933 ?auto_356935 ) ) ( not ( = ?auto_356933 ?auto_356936 ) ) ( not ( = ?auto_356933 ?auto_356937 ) ) ( not ( = ?auto_356933 ?auto_356938 ) ) ( not ( = ?auto_356934 ?auto_356935 ) ) ( not ( = ?auto_356934 ?auto_356936 ) ) ( not ( = ?auto_356934 ?auto_356937 ) ) ( not ( = ?auto_356934 ?auto_356938 ) ) ( not ( = ?auto_356935 ?auto_356936 ) ) ( not ( = ?auto_356935 ?auto_356937 ) ) ( not ( = ?auto_356935 ?auto_356938 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_356936 ?auto_356937 ?auto_356938 )
      ( MAKE-8CRATE-VERIFY ?auto_356930 ?auto_356931 ?auto_356932 ?auto_356933 ?auto_356934 ?auto_356935 ?auto_356936 ?auto_356937 ?auto_356938 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_357022 - SURFACE
      ?auto_357023 - SURFACE
      ?auto_357024 - SURFACE
      ?auto_357025 - SURFACE
      ?auto_357026 - SURFACE
      ?auto_357027 - SURFACE
      ?auto_357028 - SURFACE
      ?auto_357029 - SURFACE
      ?auto_357030 - SURFACE
    )
    :vars
    (
      ?auto_357036 - HOIST
      ?auto_357034 - PLACE
      ?auto_357031 - TRUCK
      ?auto_357032 - PLACE
      ?auto_357033 - HOIST
      ?auto_357035 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_357036 ?auto_357034 ) ( SURFACE-AT ?auto_357029 ?auto_357034 ) ( CLEAR ?auto_357029 ) ( IS-CRATE ?auto_357030 ) ( not ( = ?auto_357029 ?auto_357030 ) ) ( AVAILABLE ?auto_357036 ) ( ON ?auto_357029 ?auto_357028 ) ( not ( = ?auto_357028 ?auto_357029 ) ) ( not ( = ?auto_357028 ?auto_357030 ) ) ( TRUCK-AT ?auto_357031 ?auto_357032 ) ( not ( = ?auto_357032 ?auto_357034 ) ) ( HOIST-AT ?auto_357033 ?auto_357032 ) ( not ( = ?auto_357036 ?auto_357033 ) ) ( AVAILABLE ?auto_357033 ) ( SURFACE-AT ?auto_357030 ?auto_357032 ) ( ON ?auto_357030 ?auto_357035 ) ( CLEAR ?auto_357030 ) ( not ( = ?auto_357029 ?auto_357035 ) ) ( not ( = ?auto_357030 ?auto_357035 ) ) ( not ( = ?auto_357028 ?auto_357035 ) ) ( ON ?auto_357023 ?auto_357022 ) ( ON ?auto_357024 ?auto_357023 ) ( ON ?auto_357025 ?auto_357024 ) ( ON ?auto_357026 ?auto_357025 ) ( ON ?auto_357027 ?auto_357026 ) ( ON ?auto_357028 ?auto_357027 ) ( not ( = ?auto_357022 ?auto_357023 ) ) ( not ( = ?auto_357022 ?auto_357024 ) ) ( not ( = ?auto_357022 ?auto_357025 ) ) ( not ( = ?auto_357022 ?auto_357026 ) ) ( not ( = ?auto_357022 ?auto_357027 ) ) ( not ( = ?auto_357022 ?auto_357028 ) ) ( not ( = ?auto_357022 ?auto_357029 ) ) ( not ( = ?auto_357022 ?auto_357030 ) ) ( not ( = ?auto_357022 ?auto_357035 ) ) ( not ( = ?auto_357023 ?auto_357024 ) ) ( not ( = ?auto_357023 ?auto_357025 ) ) ( not ( = ?auto_357023 ?auto_357026 ) ) ( not ( = ?auto_357023 ?auto_357027 ) ) ( not ( = ?auto_357023 ?auto_357028 ) ) ( not ( = ?auto_357023 ?auto_357029 ) ) ( not ( = ?auto_357023 ?auto_357030 ) ) ( not ( = ?auto_357023 ?auto_357035 ) ) ( not ( = ?auto_357024 ?auto_357025 ) ) ( not ( = ?auto_357024 ?auto_357026 ) ) ( not ( = ?auto_357024 ?auto_357027 ) ) ( not ( = ?auto_357024 ?auto_357028 ) ) ( not ( = ?auto_357024 ?auto_357029 ) ) ( not ( = ?auto_357024 ?auto_357030 ) ) ( not ( = ?auto_357024 ?auto_357035 ) ) ( not ( = ?auto_357025 ?auto_357026 ) ) ( not ( = ?auto_357025 ?auto_357027 ) ) ( not ( = ?auto_357025 ?auto_357028 ) ) ( not ( = ?auto_357025 ?auto_357029 ) ) ( not ( = ?auto_357025 ?auto_357030 ) ) ( not ( = ?auto_357025 ?auto_357035 ) ) ( not ( = ?auto_357026 ?auto_357027 ) ) ( not ( = ?auto_357026 ?auto_357028 ) ) ( not ( = ?auto_357026 ?auto_357029 ) ) ( not ( = ?auto_357026 ?auto_357030 ) ) ( not ( = ?auto_357026 ?auto_357035 ) ) ( not ( = ?auto_357027 ?auto_357028 ) ) ( not ( = ?auto_357027 ?auto_357029 ) ) ( not ( = ?auto_357027 ?auto_357030 ) ) ( not ( = ?auto_357027 ?auto_357035 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_357028 ?auto_357029 ?auto_357030 )
      ( MAKE-8CRATE-VERIFY ?auto_357022 ?auto_357023 ?auto_357024 ?auto_357025 ?auto_357026 ?auto_357027 ?auto_357028 ?auto_357029 ?auto_357030 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_357115 - SURFACE
      ?auto_357116 - SURFACE
      ?auto_357117 - SURFACE
      ?auto_357118 - SURFACE
      ?auto_357119 - SURFACE
      ?auto_357120 - SURFACE
      ?auto_357121 - SURFACE
      ?auto_357122 - SURFACE
      ?auto_357123 - SURFACE
    )
    :vars
    (
      ?auto_357125 - HOIST
      ?auto_357128 - PLACE
      ?auto_357126 - PLACE
      ?auto_357127 - HOIST
      ?auto_357129 - SURFACE
      ?auto_357124 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_357125 ?auto_357128 ) ( SURFACE-AT ?auto_357122 ?auto_357128 ) ( CLEAR ?auto_357122 ) ( IS-CRATE ?auto_357123 ) ( not ( = ?auto_357122 ?auto_357123 ) ) ( AVAILABLE ?auto_357125 ) ( ON ?auto_357122 ?auto_357121 ) ( not ( = ?auto_357121 ?auto_357122 ) ) ( not ( = ?auto_357121 ?auto_357123 ) ) ( not ( = ?auto_357126 ?auto_357128 ) ) ( HOIST-AT ?auto_357127 ?auto_357126 ) ( not ( = ?auto_357125 ?auto_357127 ) ) ( AVAILABLE ?auto_357127 ) ( SURFACE-AT ?auto_357123 ?auto_357126 ) ( ON ?auto_357123 ?auto_357129 ) ( CLEAR ?auto_357123 ) ( not ( = ?auto_357122 ?auto_357129 ) ) ( not ( = ?auto_357123 ?auto_357129 ) ) ( not ( = ?auto_357121 ?auto_357129 ) ) ( TRUCK-AT ?auto_357124 ?auto_357128 ) ( ON ?auto_357116 ?auto_357115 ) ( ON ?auto_357117 ?auto_357116 ) ( ON ?auto_357118 ?auto_357117 ) ( ON ?auto_357119 ?auto_357118 ) ( ON ?auto_357120 ?auto_357119 ) ( ON ?auto_357121 ?auto_357120 ) ( not ( = ?auto_357115 ?auto_357116 ) ) ( not ( = ?auto_357115 ?auto_357117 ) ) ( not ( = ?auto_357115 ?auto_357118 ) ) ( not ( = ?auto_357115 ?auto_357119 ) ) ( not ( = ?auto_357115 ?auto_357120 ) ) ( not ( = ?auto_357115 ?auto_357121 ) ) ( not ( = ?auto_357115 ?auto_357122 ) ) ( not ( = ?auto_357115 ?auto_357123 ) ) ( not ( = ?auto_357115 ?auto_357129 ) ) ( not ( = ?auto_357116 ?auto_357117 ) ) ( not ( = ?auto_357116 ?auto_357118 ) ) ( not ( = ?auto_357116 ?auto_357119 ) ) ( not ( = ?auto_357116 ?auto_357120 ) ) ( not ( = ?auto_357116 ?auto_357121 ) ) ( not ( = ?auto_357116 ?auto_357122 ) ) ( not ( = ?auto_357116 ?auto_357123 ) ) ( not ( = ?auto_357116 ?auto_357129 ) ) ( not ( = ?auto_357117 ?auto_357118 ) ) ( not ( = ?auto_357117 ?auto_357119 ) ) ( not ( = ?auto_357117 ?auto_357120 ) ) ( not ( = ?auto_357117 ?auto_357121 ) ) ( not ( = ?auto_357117 ?auto_357122 ) ) ( not ( = ?auto_357117 ?auto_357123 ) ) ( not ( = ?auto_357117 ?auto_357129 ) ) ( not ( = ?auto_357118 ?auto_357119 ) ) ( not ( = ?auto_357118 ?auto_357120 ) ) ( not ( = ?auto_357118 ?auto_357121 ) ) ( not ( = ?auto_357118 ?auto_357122 ) ) ( not ( = ?auto_357118 ?auto_357123 ) ) ( not ( = ?auto_357118 ?auto_357129 ) ) ( not ( = ?auto_357119 ?auto_357120 ) ) ( not ( = ?auto_357119 ?auto_357121 ) ) ( not ( = ?auto_357119 ?auto_357122 ) ) ( not ( = ?auto_357119 ?auto_357123 ) ) ( not ( = ?auto_357119 ?auto_357129 ) ) ( not ( = ?auto_357120 ?auto_357121 ) ) ( not ( = ?auto_357120 ?auto_357122 ) ) ( not ( = ?auto_357120 ?auto_357123 ) ) ( not ( = ?auto_357120 ?auto_357129 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_357121 ?auto_357122 ?auto_357123 )
      ( MAKE-8CRATE-VERIFY ?auto_357115 ?auto_357116 ?auto_357117 ?auto_357118 ?auto_357119 ?auto_357120 ?auto_357121 ?auto_357122 ?auto_357123 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_357208 - SURFACE
      ?auto_357209 - SURFACE
      ?auto_357210 - SURFACE
      ?auto_357211 - SURFACE
      ?auto_357212 - SURFACE
      ?auto_357213 - SURFACE
      ?auto_357214 - SURFACE
      ?auto_357215 - SURFACE
      ?auto_357216 - SURFACE
    )
    :vars
    (
      ?auto_357220 - HOIST
      ?auto_357217 - PLACE
      ?auto_357219 - PLACE
      ?auto_357218 - HOIST
      ?auto_357222 - SURFACE
      ?auto_357221 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_357220 ?auto_357217 ) ( IS-CRATE ?auto_357216 ) ( not ( = ?auto_357215 ?auto_357216 ) ) ( not ( = ?auto_357214 ?auto_357215 ) ) ( not ( = ?auto_357214 ?auto_357216 ) ) ( not ( = ?auto_357219 ?auto_357217 ) ) ( HOIST-AT ?auto_357218 ?auto_357219 ) ( not ( = ?auto_357220 ?auto_357218 ) ) ( AVAILABLE ?auto_357218 ) ( SURFACE-AT ?auto_357216 ?auto_357219 ) ( ON ?auto_357216 ?auto_357222 ) ( CLEAR ?auto_357216 ) ( not ( = ?auto_357215 ?auto_357222 ) ) ( not ( = ?auto_357216 ?auto_357222 ) ) ( not ( = ?auto_357214 ?auto_357222 ) ) ( TRUCK-AT ?auto_357221 ?auto_357217 ) ( SURFACE-AT ?auto_357214 ?auto_357217 ) ( CLEAR ?auto_357214 ) ( LIFTING ?auto_357220 ?auto_357215 ) ( IS-CRATE ?auto_357215 ) ( ON ?auto_357209 ?auto_357208 ) ( ON ?auto_357210 ?auto_357209 ) ( ON ?auto_357211 ?auto_357210 ) ( ON ?auto_357212 ?auto_357211 ) ( ON ?auto_357213 ?auto_357212 ) ( ON ?auto_357214 ?auto_357213 ) ( not ( = ?auto_357208 ?auto_357209 ) ) ( not ( = ?auto_357208 ?auto_357210 ) ) ( not ( = ?auto_357208 ?auto_357211 ) ) ( not ( = ?auto_357208 ?auto_357212 ) ) ( not ( = ?auto_357208 ?auto_357213 ) ) ( not ( = ?auto_357208 ?auto_357214 ) ) ( not ( = ?auto_357208 ?auto_357215 ) ) ( not ( = ?auto_357208 ?auto_357216 ) ) ( not ( = ?auto_357208 ?auto_357222 ) ) ( not ( = ?auto_357209 ?auto_357210 ) ) ( not ( = ?auto_357209 ?auto_357211 ) ) ( not ( = ?auto_357209 ?auto_357212 ) ) ( not ( = ?auto_357209 ?auto_357213 ) ) ( not ( = ?auto_357209 ?auto_357214 ) ) ( not ( = ?auto_357209 ?auto_357215 ) ) ( not ( = ?auto_357209 ?auto_357216 ) ) ( not ( = ?auto_357209 ?auto_357222 ) ) ( not ( = ?auto_357210 ?auto_357211 ) ) ( not ( = ?auto_357210 ?auto_357212 ) ) ( not ( = ?auto_357210 ?auto_357213 ) ) ( not ( = ?auto_357210 ?auto_357214 ) ) ( not ( = ?auto_357210 ?auto_357215 ) ) ( not ( = ?auto_357210 ?auto_357216 ) ) ( not ( = ?auto_357210 ?auto_357222 ) ) ( not ( = ?auto_357211 ?auto_357212 ) ) ( not ( = ?auto_357211 ?auto_357213 ) ) ( not ( = ?auto_357211 ?auto_357214 ) ) ( not ( = ?auto_357211 ?auto_357215 ) ) ( not ( = ?auto_357211 ?auto_357216 ) ) ( not ( = ?auto_357211 ?auto_357222 ) ) ( not ( = ?auto_357212 ?auto_357213 ) ) ( not ( = ?auto_357212 ?auto_357214 ) ) ( not ( = ?auto_357212 ?auto_357215 ) ) ( not ( = ?auto_357212 ?auto_357216 ) ) ( not ( = ?auto_357212 ?auto_357222 ) ) ( not ( = ?auto_357213 ?auto_357214 ) ) ( not ( = ?auto_357213 ?auto_357215 ) ) ( not ( = ?auto_357213 ?auto_357216 ) ) ( not ( = ?auto_357213 ?auto_357222 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_357214 ?auto_357215 ?auto_357216 )
      ( MAKE-8CRATE-VERIFY ?auto_357208 ?auto_357209 ?auto_357210 ?auto_357211 ?auto_357212 ?auto_357213 ?auto_357214 ?auto_357215 ?auto_357216 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_357301 - SURFACE
      ?auto_357302 - SURFACE
      ?auto_357303 - SURFACE
      ?auto_357304 - SURFACE
      ?auto_357305 - SURFACE
      ?auto_357306 - SURFACE
      ?auto_357307 - SURFACE
      ?auto_357308 - SURFACE
      ?auto_357309 - SURFACE
    )
    :vars
    (
      ?auto_357310 - HOIST
      ?auto_357315 - PLACE
      ?auto_357314 - PLACE
      ?auto_357312 - HOIST
      ?auto_357311 - SURFACE
      ?auto_357313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_357310 ?auto_357315 ) ( IS-CRATE ?auto_357309 ) ( not ( = ?auto_357308 ?auto_357309 ) ) ( not ( = ?auto_357307 ?auto_357308 ) ) ( not ( = ?auto_357307 ?auto_357309 ) ) ( not ( = ?auto_357314 ?auto_357315 ) ) ( HOIST-AT ?auto_357312 ?auto_357314 ) ( not ( = ?auto_357310 ?auto_357312 ) ) ( AVAILABLE ?auto_357312 ) ( SURFACE-AT ?auto_357309 ?auto_357314 ) ( ON ?auto_357309 ?auto_357311 ) ( CLEAR ?auto_357309 ) ( not ( = ?auto_357308 ?auto_357311 ) ) ( not ( = ?auto_357309 ?auto_357311 ) ) ( not ( = ?auto_357307 ?auto_357311 ) ) ( TRUCK-AT ?auto_357313 ?auto_357315 ) ( SURFACE-AT ?auto_357307 ?auto_357315 ) ( CLEAR ?auto_357307 ) ( IS-CRATE ?auto_357308 ) ( AVAILABLE ?auto_357310 ) ( IN ?auto_357308 ?auto_357313 ) ( ON ?auto_357302 ?auto_357301 ) ( ON ?auto_357303 ?auto_357302 ) ( ON ?auto_357304 ?auto_357303 ) ( ON ?auto_357305 ?auto_357304 ) ( ON ?auto_357306 ?auto_357305 ) ( ON ?auto_357307 ?auto_357306 ) ( not ( = ?auto_357301 ?auto_357302 ) ) ( not ( = ?auto_357301 ?auto_357303 ) ) ( not ( = ?auto_357301 ?auto_357304 ) ) ( not ( = ?auto_357301 ?auto_357305 ) ) ( not ( = ?auto_357301 ?auto_357306 ) ) ( not ( = ?auto_357301 ?auto_357307 ) ) ( not ( = ?auto_357301 ?auto_357308 ) ) ( not ( = ?auto_357301 ?auto_357309 ) ) ( not ( = ?auto_357301 ?auto_357311 ) ) ( not ( = ?auto_357302 ?auto_357303 ) ) ( not ( = ?auto_357302 ?auto_357304 ) ) ( not ( = ?auto_357302 ?auto_357305 ) ) ( not ( = ?auto_357302 ?auto_357306 ) ) ( not ( = ?auto_357302 ?auto_357307 ) ) ( not ( = ?auto_357302 ?auto_357308 ) ) ( not ( = ?auto_357302 ?auto_357309 ) ) ( not ( = ?auto_357302 ?auto_357311 ) ) ( not ( = ?auto_357303 ?auto_357304 ) ) ( not ( = ?auto_357303 ?auto_357305 ) ) ( not ( = ?auto_357303 ?auto_357306 ) ) ( not ( = ?auto_357303 ?auto_357307 ) ) ( not ( = ?auto_357303 ?auto_357308 ) ) ( not ( = ?auto_357303 ?auto_357309 ) ) ( not ( = ?auto_357303 ?auto_357311 ) ) ( not ( = ?auto_357304 ?auto_357305 ) ) ( not ( = ?auto_357304 ?auto_357306 ) ) ( not ( = ?auto_357304 ?auto_357307 ) ) ( not ( = ?auto_357304 ?auto_357308 ) ) ( not ( = ?auto_357304 ?auto_357309 ) ) ( not ( = ?auto_357304 ?auto_357311 ) ) ( not ( = ?auto_357305 ?auto_357306 ) ) ( not ( = ?auto_357305 ?auto_357307 ) ) ( not ( = ?auto_357305 ?auto_357308 ) ) ( not ( = ?auto_357305 ?auto_357309 ) ) ( not ( = ?auto_357305 ?auto_357311 ) ) ( not ( = ?auto_357306 ?auto_357307 ) ) ( not ( = ?auto_357306 ?auto_357308 ) ) ( not ( = ?auto_357306 ?auto_357309 ) ) ( not ( = ?auto_357306 ?auto_357311 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_357307 ?auto_357308 ?auto_357309 )
      ( MAKE-8CRATE-VERIFY ?auto_357301 ?auto_357302 ?auto_357303 ?auto_357304 ?auto_357305 ?auto_357306 ?auto_357307 ?auto_357308 ?auto_357309 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_357996 - SURFACE
      ?auto_357997 - SURFACE
    )
    :vars
    (
      ?auto_358001 - HOIST
      ?auto_357999 - PLACE
      ?auto_357998 - SURFACE
      ?auto_358002 - TRUCK
      ?auto_358003 - PLACE
      ?auto_358000 - HOIST
      ?auto_358004 - SURFACE
      ?auto_358005 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_358001 ?auto_357999 ) ( SURFACE-AT ?auto_357996 ?auto_357999 ) ( CLEAR ?auto_357996 ) ( IS-CRATE ?auto_357997 ) ( not ( = ?auto_357996 ?auto_357997 ) ) ( AVAILABLE ?auto_358001 ) ( ON ?auto_357996 ?auto_357998 ) ( not ( = ?auto_357998 ?auto_357996 ) ) ( not ( = ?auto_357998 ?auto_357997 ) ) ( TRUCK-AT ?auto_358002 ?auto_358003 ) ( not ( = ?auto_358003 ?auto_357999 ) ) ( HOIST-AT ?auto_358000 ?auto_358003 ) ( not ( = ?auto_358001 ?auto_358000 ) ) ( SURFACE-AT ?auto_357997 ?auto_358003 ) ( ON ?auto_357997 ?auto_358004 ) ( CLEAR ?auto_357997 ) ( not ( = ?auto_357996 ?auto_358004 ) ) ( not ( = ?auto_357997 ?auto_358004 ) ) ( not ( = ?auto_357998 ?auto_358004 ) ) ( LIFTING ?auto_358000 ?auto_358005 ) ( IS-CRATE ?auto_358005 ) ( not ( = ?auto_357996 ?auto_358005 ) ) ( not ( = ?auto_357997 ?auto_358005 ) ) ( not ( = ?auto_357998 ?auto_358005 ) ) ( not ( = ?auto_358004 ?auto_358005 ) ) )
    :subtasks
    ( ( !LOAD ?auto_358000 ?auto_358005 ?auto_358002 ?auto_358003 )
      ( MAKE-1CRATE ?auto_357996 ?auto_357997 )
      ( MAKE-1CRATE-VERIFY ?auto_357996 ?auto_357997 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_361404 - SURFACE
      ?auto_361405 - SURFACE
      ?auto_361406 - SURFACE
      ?auto_361407 - SURFACE
      ?auto_361408 - SURFACE
      ?auto_361409 - SURFACE
      ?auto_361410 - SURFACE
      ?auto_361411 - SURFACE
      ?auto_361412 - SURFACE
      ?auto_361413 - SURFACE
    )
    :vars
    (
      ?auto_361415 - HOIST
      ?auto_361414 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_361415 ?auto_361414 ) ( SURFACE-AT ?auto_361412 ?auto_361414 ) ( CLEAR ?auto_361412 ) ( LIFTING ?auto_361415 ?auto_361413 ) ( IS-CRATE ?auto_361413 ) ( not ( = ?auto_361412 ?auto_361413 ) ) ( ON ?auto_361405 ?auto_361404 ) ( ON ?auto_361406 ?auto_361405 ) ( ON ?auto_361407 ?auto_361406 ) ( ON ?auto_361408 ?auto_361407 ) ( ON ?auto_361409 ?auto_361408 ) ( ON ?auto_361410 ?auto_361409 ) ( ON ?auto_361411 ?auto_361410 ) ( ON ?auto_361412 ?auto_361411 ) ( not ( = ?auto_361404 ?auto_361405 ) ) ( not ( = ?auto_361404 ?auto_361406 ) ) ( not ( = ?auto_361404 ?auto_361407 ) ) ( not ( = ?auto_361404 ?auto_361408 ) ) ( not ( = ?auto_361404 ?auto_361409 ) ) ( not ( = ?auto_361404 ?auto_361410 ) ) ( not ( = ?auto_361404 ?auto_361411 ) ) ( not ( = ?auto_361404 ?auto_361412 ) ) ( not ( = ?auto_361404 ?auto_361413 ) ) ( not ( = ?auto_361405 ?auto_361406 ) ) ( not ( = ?auto_361405 ?auto_361407 ) ) ( not ( = ?auto_361405 ?auto_361408 ) ) ( not ( = ?auto_361405 ?auto_361409 ) ) ( not ( = ?auto_361405 ?auto_361410 ) ) ( not ( = ?auto_361405 ?auto_361411 ) ) ( not ( = ?auto_361405 ?auto_361412 ) ) ( not ( = ?auto_361405 ?auto_361413 ) ) ( not ( = ?auto_361406 ?auto_361407 ) ) ( not ( = ?auto_361406 ?auto_361408 ) ) ( not ( = ?auto_361406 ?auto_361409 ) ) ( not ( = ?auto_361406 ?auto_361410 ) ) ( not ( = ?auto_361406 ?auto_361411 ) ) ( not ( = ?auto_361406 ?auto_361412 ) ) ( not ( = ?auto_361406 ?auto_361413 ) ) ( not ( = ?auto_361407 ?auto_361408 ) ) ( not ( = ?auto_361407 ?auto_361409 ) ) ( not ( = ?auto_361407 ?auto_361410 ) ) ( not ( = ?auto_361407 ?auto_361411 ) ) ( not ( = ?auto_361407 ?auto_361412 ) ) ( not ( = ?auto_361407 ?auto_361413 ) ) ( not ( = ?auto_361408 ?auto_361409 ) ) ( not ( = ?auto_361408 ?auto_361410 ) ) ( not ( = ?auto_361408 ?auto_361411 ) ) ( not ( = ?auto_361408 ?auto_361412 ) ) ( not ( = ?auto_361408 ?auto_361413 ) ) ( not ( = ?auto_361409 ?auto_361410 ) ) ( not ( = ?auto_361409 ?auto_361411 ) ) ( not ( = ?auto_361409 ?auto_361412 ) ) ( not ( = ?auto_361409 ?auto_361413 ) ) ( not ( = ?auto_361410 ?auto_361411 ) ) ( not ( = ?auto_361410 ?auto_361412 ) ) ( not ( = ?auto_361410 ?auto_361413 ) ) ( not ( = ?auto_361411 ?auto_361412 ) ) ( not ( = ?auto_361411 ?auto_361413 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_361412 ?auto_361413 )
      ( MAKE-9CRATE-VERIFY ?auto_361404 ?auto_361405 ?auto_361406 ?auto_361407 ?auto_361408 ?auto_361409 ?auto_361410 ?auto_361411 ?auto_361412 ?auto_361413 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_361484 - SURFACE
      ?auto_361485 - SURFACE
      ?auto_361486 - SURFACE
      ?auto_361487 - SURFACE
      ?auto_361488 - SURFACE
      ?auto_361489 - SURFACE
      ?auto_361490 - SURFACE
      ?auto_361491 - SURFACE
      ?auto_361492 - SURFACE
      ?auto_361493 - SURFACE
    )
    :vars
    (
      ?auto_361495 - HOIST
      ?auto_361494 - PLACE
      ?auto_361496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_361495 ?auto_361494 ) ( SURFACE-AT ?auto_361492 ?auto_361494 ) ( CLEAR ?auto_361492 ) ( IS-CRATE ?auto_361493 ) ( not ( = ?auto_361492 ?auto_361493 ) ) ( TRUCK-AT ?auto_361496 ?auto_361494 ) ( AVAILABLE ?auto_361495 ) ( IN ?auto_361493 ?auto_361496 ) ( ON ?auto_361492 ?auto_361491 ) ( not ( = ?auto_361491 ?auto_361492 ) ) ( not ( = ?auto_361491 ?auto_361493 ) ) ( ON ?auto_361485 ?auto_361484 ) ( ON ?auto_361486 ?auto_361485 ) ( ON ?auto_361487 ?auto_361486 ) ( ON ?auto_361488 ?auto_361487 ) ( ON ?auto_361489 ?auto_361488 ) ( ON ?auto_361490 ?auto_361489 ) ( ON ?auto_361491 ?auto_361490 ) ( not ( = ?auto_361484 ?auto_361485 ) ) ( not ( = ?auto_361484 ?auto_361486 ) ) ( not ( = ?auto_361484 ?auto_361487 ) ) ( not ( = ?auto_361484 ?auto_361488 ) ) ( not ( = ?auto_361484 ?auto_361489 ) ) ( not ( = ?auto_361484 ?auto_361490 ) ) ( not ( = ?auto_361484 ?auto_361491 ) ) ( not ( = ?auto_361484 ?auto_361492 ) ) ( not ( = ?auto_361484 ?auto_361493 ) ) ( not ( = ?auto_361485 ?auto_361486 ) ) ( not ( = ?auto_361485 ?auto_361487 ) ) ( not ( = ?auto_361485 ?auto_361488 ) ) ( not ( = ?auto_361485 ?auto_361489 ) ) ( not ( = ?auto_361485 ?auto_361490 ) ) ( not ( = ?auto_361485 ?auto_361491 ) ) ( not ( = ?auto_361485 ?auto_361492 ) ) ( not ( = ?auto_361485 ?auto_361493 ) ) ( not ( = ?auto_361486 ?auto_361487 ) ) ( not ( = ?auto_361486 ?auto_361488 ) ) ( not ( = ?auto_361486 ?auto_361489 ) ) ( not ( = ?auto_361486 ?auto_361490 ) ) ( not ( = ?auto_361486 ?auto_361491 ) ) ( not ( = ?auto_361486 ?auto_361492 ) ) ( not ( = ?auto_361486 ?auto_361493 ) ) ( not ( = ?auto_361487 ?auto_361488 ) ) ( not ( = ?auto_361487 ?auto_361489 ) ) ( not ( = ?auto_361487 ?auto_361490 ) ) ( not ( = ?auto_361487 ?auto_361491 ) ) ( not ( = ?auto_361487 ?auto_361492 ) ) ( not ( = ?auto_361487 ?auto_361493 ) ) ( not ( = ?auto_361488 ?auto_361489 ) ) ( not ( = ?auto_361488 ?auto_361490 ) ) ( not ( = ?auto_361488 ?auto_361491 ) ) ( not ( = ?auto_361488 ?auto_361492 ) ) ( not ( = ?auto_361488 ?auto_361493 ) ) ( not ( = ?auto_361489 ?auto_361490 ) ) ( not ( = ?auto_361489 ?auto_361491 ) ) ( not ( = ?auto_361489 ?auto_361492 ) ) ( not ( = ?auto_361489 ?auto_361493 ) ) ( not ( = ?auto_361490 ?auto_361491 ) ) ( not ( = ?auto_361490 ?auto_361492 ) ) ( not ( = ?auto_361490 ?auto_361493 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_361491 ?auto_361492 ?auto_361493 )
      ( MAKE-9CRATE-VERIFY ?auto_361484 ?auto_361485 ?auto_361486 ?auto_361487 ?auto_361488 ?auto_361489 ?auto_361490 ?auto_361491 ?auto_361492 ?auto_361493 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_361574 - SURFACE
      ?auto_361575 - SURFACE
      ?auto_361576 - SURFACE
      ?auto_361577 - SURFACE
      ?auto_361578 - SURFACE
      ?auto_361579 - SURFACE
      ?auto_361580 - SURFACE
      ?auto_361581 - SURFACE
      ?auto_361582 - SURFACE
      ?auto_361583 - SURFACE
    )
    :vars
    (
      ?auto_361584 - HOIST
      ?auto_361586 - PLACE
      ?auto_361585 - TRUCK
      ?auto_361587 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_361584 ?auto_361586 ) ( SURFACE-AT ?auto_361582 ?auto_361586 ) ( CLEAR ?auto_361582 ) ( IS-CRATE ?auto_361583 ) ( not ( = ?auto_361582 ?auto_361583 ) ) ( AVAILABLE ?auto_361584 ) ( IN ?auto_361583 ?auto_361585 ) ( ON ?auto_361582 ?auto_361581 ) ( not ( = ?auto_361581 ?auto_361582 ) ) ( not ( = ?auto_361581 ?auto_361583 ) ) ( TRUCK-AT ?auto_361585 ?auto_361587 ) ( not ( = ?auto_361587 ?auto_361586 ) ) ( ON ?auto_361575 ?auto_361574 ) ( ON ?auto_361576 ?auto_361575 ) ( ON ?auto_361577 ?auto_361576 ) ( ON ?auto_361578 ?auto_361577 ) ( ON ?auto_361579 ?auto_361578 ) ( ON ?auto_361580 ?auto_361579 ) ( ON ?auto_361581 ?auto_361580 ) ( not ( = ?auto_361574 ?auto_361575 ) ) ( not ( = ?auto_361574 ?auto_361576 ) ) ( not ( = ?auto_361574 ?auto_361577 ) ) ( not ( = ?auto_361574 ?auto_361578 ) ) ( not ( = ?auto_361574 ?auto_361579 ) ) ( not ( = ?auto_361574 ?auto_361580 ) ) ( not ( = ?auto_361574 ?auto_361581 ) ) ( not ( = ?auto_361574 ?auto_361582 ) ) ( not ( = ?auto_361574 ?auto_361583 ) ) ( not ( = ?auto_361575 ?auto_361576 ) ) ( not ( = ?auto_361575 ?auto_361577 ) ) ( not ( = ?auto_361575 ?auto_361578 ) ) ( not ( = ?auto_361575 ?auto_361579 ) ) ( not ( = ?auto_361575 ?auto_361580 ) ) ( not ( = ?auto_361575 ?auto_361581 ) ) ( not ( = ?auto_361575 ?auto_361582 ) ) ( not ( = ?auto_361575 ?auto_361583 ) ) ( not ( = ?auto_361576 ?auto_361577 ) ) ( not ( = ?auto_361576 ?auto_361578 ) ) ( not ( = ?auto_361576 ?auto_361579 ) ) ( not ( = ?auto_361576 ?auto_361580 ) ) ( not ( = ?auto_361576 ?auto_361581 ) ) ( not ( = ?auto_361576 ?auto_361582 ) ) ( not ( = ?auto_361576 ?auto_361583 ) ) ( not ( = ?auto_361577 ?auto_361578 ) ) ( not ( = ?auto_361577 ?auto_361579 ) ) ( not ( = ?auto_361577 ?auto_361580 ) ) ( not ( = ?auto_361577 ?auto_361581 ) ) ( not ( = ?auto_361577 ?auto_361582 ) ) ( not ( = ?auto_361577 ?auto_361583 ) ) ( not ( = ?auto_361578 ?auto_361579 ) ) ( not ( = ?auto_361578 ?auto_361580 ) ) ( not ( = ?auto_361578 ?auto_361581 ) ) ( not ( = ?auto_361578 ?auto_361582 ) ) ( not ( = ?auto_361578 ?auto_361583 ) ) ( not ( = ?auto_361579 ?auto_361580 ) ) ( not ( = ?auto_361579 ?auto_361581 ) ) ( not ( = ?auto_361579 ?auto_361582 ) ) ( not ( = ?auto_361579 ?auto_361583 ) ) ( not ( = ?auto_361580 ?auto_361581 ) ) ( not ( = ?auto_361580 ?auto_361582 ) ) ( not ( = ?auto_361580 ?auto_361583 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_361581 ?auto_361582 ?auto_361583 )
      ( MAKE-9CRATE-VERIFY ?auto_361574 ?auto_361575 ?auto_361576 ?auto_361577 ?auto_361578 ?auto_361579 ?auto_361580 ?auto_361581 ?auto_361582 ?auto_361583 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_361673 - SURFACE
      ?auto_361674 - SURFACE
      ?auto_361675 - SURFACE
      ?auto_361676 - SURFACE
      ?auto_361677 - SURFACE
      ?auto_361678 - SURFACE
      ?auto_361679 - SURFACE
      ?auto_361680 - SURFACE
      ?auto_361681 - SURFACE
      ?auto_361682 - SURFACE
    )
    :vars
    (
      ?auto_361686 - HOIST
      ?auto_361685 - PLACE
      ?auto_361684 - TRUCK
      ?auto_361683 - PLACE
      ?auto_361687 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_361686 ?auto_361685 ) ( SURFACE-AT ?auto_361681 ?auto_361685 ) ( CLEAR ?auto_361681 ) ( IS-CRATE ?auto_361682 ) ( not ( = ?auto_361681 ?auto_361682 ) ) ( AVAILABLE ?auto_361686 ) ( ON ?auto_361681 ?auto_361680 ) ( not ( = ?auto_361680 ?auto_361681 ) ) ( not ( = ?auto_361680 ?auto_361682 ) ) ( TRUCK-AT ?auto_361684 ?auto_361683 ) ( not ( = ?auto_361683 ?auto_361685 ) ) ( HOIST-AT ?auto_361687 ?auto_361683 ) ( LIFTING ?auto_361687 ?auto_361682 ) ( not ( = ?auto_361686 ?auto_361687 ) ) ( ON ?auto_361674 ?auto_361673 ) ( ON ?auto_361675 ?auto_361674 ) ( ON ?auto_361676 ?auto_361675 ) ( ON ?auto_361677 ?auto_361676 ) ( ON ?auto_361678 ?auto_361677 ) ( ON ?auto_361679 ?auto_361678 ) ( ON ?auto_361680 ?auto_361679 ) ( not ( = ?auto_361673 ?auto_361674 ) ) ( not ( = ?auto_361673 ?auto_361675 ) ) ( not ( = ?auto_361673 ?auto_361676 ) ) ( not ( = ?auto_361673 ?auto_361677 ) ) ( not ( = ?auto_361673 ?auto_361678 ) ) ( not ( = ?auto_361673 ?auto_361679 ) ) ( not ( = ?auto_361673 ?auto_361680 ) ) ( not ( = ?auto_361673 ?auto_361681 ) ) ( not ( = ?auto_361673 ?auto_361682 ) ) ( not ( = ?auto_361674 ?auto_361675 ) ) ( not ( = ?auto_361674 ?auto_361676 ) ) ( not ( = ?auto_361674 ?auto_361677 ) ) ( not ( = ?auto_361674 ?auto_361678 ) ) ( not ( = ?auto_361674 ?auto_361679 ) ) ( not ( = ?auto_361674 ?auto_361680 ) ) ( not ( = ?auto_361674 ?auto_361681 ) ) ( not ( = ?auto_361674 ?auto_361682 ) ) ( not ( = ?auto_361675 ?auto_361676 ) ) ( not ( = ?auto_361675 ?auto_361677 ) ) ( not ( = ?auto_361675 ?auto_361678 ) ) ( not ( = ?auto_361675 ?auto_361679 ) ) ( not ( = ?auto_361675 ?auto_361680 ) ) ( not ( = ?auto_361675 ?auto_361681 ) ) ( not ( = ?auto_361675 ?auto_361682 ) ) ( not ( = ?auto_361676 ?auto_361677 ) ) ( not ( = ?auto_361676 ?auto_361678 ) ) ( not ( = ?auto_361676 ?auto_361679 ) ) ( not ( = ?auto_361676 ?auto_361680 ) ) ( not ( = ?auto_361676 ?auto_361681 ) ) ( not ( = ?auto_361676 ?auto_361682 ) ) ( not ( = ?auto_361677 ?auto_361678 ) ) ( not ( = ?auto_361677 ?auto_361679 ) ) ( not ( = ?auto_361677 ?auto_361680 ) ) ( not ( = ?auto_361677 ?auto_361681 ) ) ( not ( = ?auto_361677 ?auto_361682 ) ) ( not ( = ?auto_361678 ?auto_361679 ) ) ( not ( = ?auto_361678 ?auto_361680 ) ) ( not ( = ?auto_361678 ?auto_361681 ) ) ( not ( = ?auto_361678 ?auto_361682 ) ) ( not ( = ?auto_361679 ?auto_361680 ) ) ( not ( = ?auto_361679 ?auto_361681 ) ) ( not ( = ?auto_361679 ?auto_361682 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_361680 ?auto_361681 ?auto_361682 )
      ( MAKE-9CRATE-VERIFY ?auto_361673 ?auto_361674 ?auto_361675 ?auto_361676 ?auto_361677 ?auto_361678 ?auto_361679 ?auto_361680 ?auto_361681 ?auto_361682 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_361781 - SURFACE
      ?auto_361782 - SURFACE
      ?auto_361783 - SURFACE
      ?auto_361784 - SURFACE
      ?auto_361785 - SURFACE
      ?auto_361786 - SURFACE
      ?auto_361787 - SURFACE
      ?auto_361788 - SURFACE
      ?auto_361789 - SURFACE
      ?auto_361790 - SURFACE
    )
    :vars
    (
      ?auto_361792 - HOIST
      ?auto_361794 - PLACE
      ?auto_361796 - TRUCK
      ?auto_361791 - PLACE
      ?auto_361793 - HOIST
      ?auto_361795 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_361792 ?auto_361794 ) ( SURFACE-AT ?auto_361789 ?auto_361794 ) ( CLEAR ?auto_361789 ) ( IS-CRATE ?auto_361790 ) ( not ( = ?auto_361789 ?auto_361790 ) ) ( AVAILABLE ?auto_361792 ) ( ON ?auto_361789 ?auto_361788 ) ( not ( = ?auto_361788 ?auto_361789 ) ) ( not ( = ?auto_361788 ?auto_361790 ) ) ( TRUCK-AT ?auto_361796 ?auto_361791 ) ( not ( = ?auto_361791 ?auto_361794 ) ) ( HOIST-AT ?auto_361793 ?auto_361791 ) ( not ( = ?auto_361792 ?auto_361793 ) ) ( AVAILABLE ?auto_361793 ) ( SURFACE-AT ?auto_361790 ?auto_361791 ) ( ON ?auto_361790 ?auto_361795 ) ( CLEAR ?auto_361790 ) ( not ( = ?auto_361789 ?auto_361795 ) ) ( not ( = ?auto_361790 ?auto_361795 ) ) ( not ( = ?auto_361788 ?auto_361795 ) ) ( ON ?auto_361782 ?auto_361781 ) ( ON ?auto_361783 ?auto_361782 ) ( ON ?auto_361784 ?auto_361783 ) ( ON ?auto_361785 ?auto_361784 ) ( ON ?auto_361786 ?auto_361785 ) ( ON ?auto_361787 ?auto_361786 ) ( ON ?auto_361788 ?auto_361787 ) ( not ( = ?auto_361781 ?auto_361782 ) ) ( not ( = ?auto_361781 ?auto_361783 ) ) ( not ( = ?auto_361781 ?auto_361784 ) ) ( not ( = ?auto_361781 ?auto_361785 ) ) ( not ( = ?auto_361781 ?auto_361786 ) ) ( not ( = ?auto_361781 ?auto_361787 ) ) ( not ( = ?auto_361781 ?auto_361788 ) ) ( not ( = ?auto_361781 ?auto_361789 ) ) ( not ( = ?auto_361781 ?auto_361790 ) ) ( not ( = ?auto_361781 ?auto_361795 ) ) ( not ( = ?auto_361782 ?auto_361783 ) ) ( not ( = ?auto_361782 ?auto_361784 ) ) ( not ( = ?auto_361782 ?auto_361785 ) ) ( not ( = ?auto_361782 ?auto_361786 ) ) ( not ( = ?auto_361782 ?auto_361787 ) ) ( not ( = ?auto_361782 ?auto_361788 ) ) ( not ( = ?auto_361782 ?auto_361789 ) ) ( not ( = ?auto_361782 ?auto_361790 ) ) ( not ( = ?auto_361782 ?auto_361795 ) ) ( not ( = ?auto_361783 ?auto_361784 ) ) ( not ( = ?auto_361783 ?auto_361785 ) ) ( not ( = ?auto_361783 ?auto_361786 ) ) ( not ( = ?auto_361783 ?auto_361787 ) ) ( not ( = ?auto_361783 ?auto_361788 ) ) ( not ( = ?auto_361783 ?auto_361789 ) ) ( not ( = ?auto_361783 ?auto_361790 ) ) ( not ( = ?auto_361783 ?auto_361795 ) ) ( not ( = ?auto_361784 ?auto_361785 ) ) ( not ( = ?auto_361784 ?auto_361786 ) ) ( not ( = ?auto_361784 ?auto_361787 ) ) ( not ( = ?auto_361784 ?auto_361788 ) ) ( not ( = ?auto_361784 ?auto_361789 ) ) ( not ( = ?auto_361784 ?auto_361790 ) ) ( not ( = ?auto_361784 ?auto_361795 ) ) ( not ( = ?auto_361785 ?auto_361786 ) ) ( not ( = ?auto_361785 ?auto_361787 ) ) ( not ( = ?auto_361785 ?auto_361788 ) ) ( not ( = ?auto_361785 ?auto_361789 ) ) ( not ( = ?auto_361785 ?auto_361790 ) ) ( not ( = ?auto_361785 ?auto_361795 ) ) ( not ( = ?auto_361786 ?auto_361787 ) ) ( not ( = ?auto_361786 ?auto_361788 ) ) ( not ( = ?auto_361786 ?auto_361789 ) ) ( not ( = ?auto_361786 ?auto_361790 ) ) ( not ( = ?auto_361786 ?auto_361795 ) ) ( not ( = ?auto_361787 ?auto_361788 ) ) ( not ( = ?auto_361787 ?auto_361789 ) ) ( not ( = ?auto_361787 ?auto_361790 ) ) ( not ( = ?auto_361787 ?auto_361795 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_361788 ?auto_361789 ?auto_361790 )
      ( MAKE-9CRATE-VERIFY ?auto_361781 ?auto_361782 ?auto_361783 ?auto_361784 ?auto_361785 ?auto_361786 ?auto_361787 ?auto_361788 ?auto_361789 ?auto_361790 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_361890 - SURFACE
      ?auto_361891 - SURFACE
      ?auto_361892 - SURFACE
      ?auto_361893 - SURFACE
      ?auto_361894 - SURFACE
      ?auto_361895 - SURFACE
      ?auto_361896 - SURFACE
      ?auto_361897 - SURFACE
      ?auto_361898 - SURFACE
      ?auto_361899 - SURFACE
    )
    :vars
    (
      ?auto_361905 - HOIST
      ?auto_361900 - PLACE
      ?auto_361903 - PLACE
      ?auto_361901 - HOIST
      ?auto_361902 - SURFACE
      ?auto_361904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_361905 ?auto_361900 ) ( SURFACE-AT ?auto_361898 ?auto_361900 ) ( CLEAR ?auto_361898 ) ( IS-CRATE ?auto_361899 ) ( not ( = ?auto_361898 ?auto_361899 ) ) ( AVAILABLE ?auto_361905 ) ( ON ?auto_361898 ?auto_361897 ) ( not ( = ?auto_361897 ?auto_361898 ) ) ( not ( = ?auto_361897 ?auto_361899 ) ) ( not ( = ?auto_361903 ?auto_361900 ) ) ( HOIST-AT ?auto_361901 ?auto_361903 ) ( not ( = ?auto_361905 ?auto_361901 ) ) ( AVAILABLE ?auto_361901 ) ( SURFACE-AT ?auto_361899 ?auto_361903 ) ( ON ?auto_361899 ?auto_361902 ) ( CLEAR ?auto_361899 ) ( not ( = ?auto_361898 ?auto_361902 ) ) ( not ( = ?auto_361899 ?auto_361902 ) ) ( not ( = ?auto_361897 ?auto_361902 ) ) ( TRUCK-AT ?auto_361904 ?auto_361900 ) ( ON ?auto_361891 ?auto_361890 ) ( ON ?auto_361892 ?auto_361891 ) ( ON ?auto_361893 ?auto_361892 ) ( ON ?auto_361894 ?auto_361893 ) ( ON ?auto_361895 ?auto_361894 ) ( ON ?auto_361896 ?auto_361895 ) ( ON ?auto_361897 ?auto_361896 ) ( not ( = ?auto_361890 ?auto_361891 ) ) ( not ( = ?auto_361890 ?auto_361892 ) ) ( not ( = ?auto_361890 ?auto_361893 ) ) ( not ( = ?auto_361890 ?auto_361894 ) ) ( not ( = ?auto_361890 ?auto_361895 ) ) ( not ( = ?auto_361890 ?auto_361896 ) ) ( not ( = ?auto_361890 ?auto_361897 ) ) ( not ( = ?auto_361890 ?auto_361898 ) ) ( not ( = ?auto_361890 ?auto_361899 ) ) ( not ( = ?auto_361890 ?auto_361902 ) ) ( not ( = ?auto_361891 ?auto_361892 ) ) ( not ( = ?auto_361891 ?auto_361893 ) ) ( not ( = ?auto_361891 ?auto_361894 ) ) ( not ( = ?auto_361891 ?auto_361895 ) ) ( not ( = ?auto_361891 ?auto_361896 ) ) ( not ( = ?auto_361891 ?auto_361897 ) ) ( not ( = ?auto_361891 ?auto_361898 ) ) ( not ( = ?auto_361891 ?auto_361899 ) ) ( not ( = ?auto_361891 ?auto_361902 ) ) ( not ( = ?auto_361892 ?auto_361893 ) ) ( not ( = ?auto_361892 ?auto_361894 ) ) ( not ( = ?auto_361892 ?auto_361895 ) ) ( not ( = ?auto_361892 ?auto_361896 ) ) ( not ( = ?auto_361892 ?auto_361897 ) ) ( not ( = ?auto_361892 ?auto_361898 ) ) ( not ( = ?auto_361892 ?auto_361899 ) ) ( not ( = ?auto_361892 ?auto_361902 ) ) ( not ( = ?auto_361893 ?auto_361894 ) ) ( not ( = ?auto_361893 ?auto_361895 ) ) ( not ( = ?auto_361893 ?auto_361896 ) ) ( not ( = ?auto_361893 ?auto_361897 ) ) ( not ( = ?auto_361893 ?auto_361898 ) ) ( not ( = ?auto_361893 ?auto_361899 ) ) ( not ( = ?auto_361893 ?auto_361902 ) ) ( not ( = ?auto_361894 ?auto_361895 ) ) ( not ( = ?auto_361894 ?auto_361896 ) ) ( not ( = ?auto_361894 ?auto_361897 ) ) ( not ( = ?auto_361894 ?auto_361898 ) ) ( not ( = ?auto_361894 ?auto_361899 ) ) ( not ( = ?auto_361894 ?auto_361902 ) ) ( not ( = ?auto_361895 ?auto_361896 ) ) ( not ( = ?auto_361895 ?auto_361897 ) ) ( not ( = ?auto_361895 ?auto_361898 ) ) ( not ( = ?auto_361895 ?auto_361899 ) ) ( not ( = ?auto_361895 ?auto_361902 ) ) ( not ( = ?auto_361896 ?auto_361897 ) ) ( not ( = ?auto_361896 ?auto_361898 ) ) ( not ( = ?auto_361896 ?auto_361899 ) ) ( not ( = ?auto_361896 ?auto_361902 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_361897 ?auto_361898 ?auto_361899 )
      ( MAKE-9CRATE-VERIFY ?auto_361890 ?auto_361891 ?auto_361892 ?auto_361893 ?auto_361894 ?auto_361895 ?auto_361896 ?auto_361897 ?auto_361898 ?auto_361899 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_361999 - SURFACE
      ?auto_362000 - SURFACE
      ?auto_362001 - SURFACE
      ?auto_362002 - SURFACE
      ?auto_362003 - SURFACE
      ?auto_362004 - SURFACE
      ?auto_362005 - SURFACE
      ?auto_362006 - SURFACE
      ?auto_362007 - SURFACE
      ?auto_362008 - SURFACE
    )
    :vars
    (
      ?auto_362014 - HOIST
      ?auto_362012 - PLACE
      ?auto_362011 - PLACE
      ?auto_362010 - HOIST
      ?auto_362009 - SURFACE
      ?auto_362013 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_362014 ?auto_362012 ) ( IS-CRATE ?auto_362008 ) ( not ( = ?auto_362007 ?auto_362008 ) ) ( not ( = ?auto_362006 ?auto_362007 ) ) ( not ( = ?auto_362006 ?auto_362008 ) ) ( not ( = ?auto_362011 ?auto_362012 ) ) ( HOIST-AT ?auto_362010 ?auto_362011 ) ( not ( = ?auto_362014 ?auto_362010 ) ) ( AVAILABLE ?auto_362010 ) ( SURFACE-AT ?auto_362008 ?auto_362011 ) ( ON ?auto_362008 ?auto_362009 ) ( CLEAR ?auto_362008 ) ( not ( = ?auto_362007 ?auto_362009 ) ) ( not ( = ?auto_362008 ?auto_362009 ) ) ( not ( = ?auto_362006 ?auto_362009 ) ) ( TRUCK-AT ?auto_362013 ?auto_362012 ) ( SURFACE-AT ?auto_362006 ?auto_362012 ) ( CLEAR ?auto_362006 ) ( LIFTING ?auto_362014 ?auto_362007 ) ( IS-CRATE ?auto_362007 ) ( ON ?auto_362000 ?auto_361999 ) ( ON ?auto_362001 ?auto_362000 ) ( ON ?auto_362002 ?auto_362001 ) ( ON ?auto_362003 ?auto_362002 ) ( ON ?auto_362004 ?auto_362003 ) ( ON ?auto_362005 ?auto_362004 ) ( ON ?auto_362006 ?auto_362005 ) ( not ( = ?auto_361999 ?auto_362000 ) ) ( not ( = ?auto_361999 ?auto_362001 ) ) ( not ( = ?auto_361999 ?auto_362002 ) ) ( not ( = ?auto_361999 ?auto_362003 ) ) ( not ( = ?auto_361999 ?auto_362004 ) ) ( not ( = ?auto_361999 ?auto_362005 ) ) ( not ( = ?auto_361999 ?auto_362006 ) ) ( not ( = ?auto_361999 ?auto_362007 ) ) ( not ( = ?auto_361999 ?auto_362008 ) ) ( not ( = ?auto_361999 ?auto_362009 ) ) ( not ( = ?auto_362000 ?auto_362001 ) ) ( not ( = ?auto_362000 ?auto_362002 ) ) ( not ( = ?auto_362000 ?auto_362003 ) ) ( not ( = ?auto_362000 ?auto_362004 ) ) ( not ( = ?auto_362000 ?auto_362005 ) ) ( not ( = ?auto_362000 ?auto_362006 ) ) ( not ( = ?auto_362000 ?auto_362007 ) ) ( not ( = ?auto_362000 ?auto_362008 ) ) ( not ( = ?auto_362000 ?auto_362009 ) ) ( not ( = ?auto_362001 ?auto_362002 ) ) ( not ( = ?auto_362001 ?auto_362003 ) ) ( not ( = ?auto_362001 ?auto_362004 ) ) ( not ( = ?auto_362001 ?auto_362005 ) ) ( not ( = ?auto_362001 ?auto_362006 ) ) ( not ( = ?auto_362001 ?auto_362007 ) ) ( not ( = ?auto_362001 ?auto_362008 ) ) ( not ( = ?auto_362001 ?auto_362009 ) ) ( not ( = ?auto_362002 ?auto_362003 ) ) ( not ( = ?auto_362002 ?auto_362004 ) ) ( not ( = ?auto_362002 ?auto_362005 ) ) ( not ( = ?auto_362002 ?auto_362006 ) ) ( not ( = ?auto_362002 ?auto_362007 ) ) ( not ( = ?auto_362002 ?auto_362008 ) ) ( not ( = ?auto_362002 ?auto_362009 ) ) ( not ( = ?auto_362003 ?auto_362004 ) ) ( not ( = ?auto_362003 ?auto_362005 ) ) ( not ( = ?auto_362003 ?auto_362006 ) ) ( not ( = ?auto_362003 ?auto_362007 ) ) ( not ( = ?auto_362003 ?auto_362008 ) ) ( not ( = ?auto_362003 ?auto_362009 ) ) ( not ( = ?auto_362004 ?auto_362005 ) ) ( not ( = ?auto_362004 ?auto_362006 ) ) ( not ( = ?auto_362004 ?auto_362007 ) ) ( not ( = ?auto_362004 ?auto_362008 ) ) ( not ( = ?auto_362004 ?auto_362009 ) ) ( not ( = ?auto_362005 ?auto_362006 ) ) ( not ( = ?auto_362005 ?auto_362007 ) ) ( not ( = ?auto_362005 ?auto_362008 ) ) ( not ( = ?auto_362005 ?auto_362009 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_362006 ?auto_362007 ?auto_362008 )
      ( MAKE-9CRATE-VERIFY ?auto_361999 ?auto_362000 ?auto_362001 ?auto_362002 ?auto_362003 ?auto_362004 ?auto_362005 ?auto_362006 ?auto_362007 ?auto_362008 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_362108 - SURFACE
      ?auto_362109 - SURFACE
      ?auto_362110 - SURFACE
      ?auto_362111 - SURFACE
      ?auto_362112 - SURFACE
      ?auto_362113 - SURFACE
      ?auto_362114 - SURFACE
      ?auto_362115 - SURFACE
      ?auto_362116 - SURFACE
      ?auto_362117 - SURFACE
    )
    :vars
    (
      ?auto_362122 - HOIST
      ?auto_362123 - PLACE
      ?auto_362121 - PLACE
      ?auto_362119 - HOIST
      ?auto_362120 - SURFACE
      ?auto_362118 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_362122 ?auto_362123 ) ( IS-CRATE ?auto_362117 ) ( not ( = ?auto_362116 ?auto_362117 ) ) ( not ( = ?auto_362115 ?auto_362116 ) ) ( not ( = ?auto_362115 ?auto_362117 ) ) ( not ( = ?auto_362121 ?auto_362123 ) ) ( HOIST-AT ?auto_362119 ?auto_362121 ) ( not ( = ?auto_362122 ?auto_362119 ) ) ( AVAILABLE ?auto_362119 ) ( SURFACE-AT ?auto_362117 ?auto_362121 ) ( ON ?auto_362117 ?auto_362120 ) ( CLEAR ?auto_362117 ) ( not ( = ?auto_362116 ?auto_362120 ) ) ( not ( = ?auto_362117 ?auto_362120 ) ) ( not ( = ?auto_362115 ?auto_362120 ) ) ( TRUCK-AT ?auto_362118 ?auto_362123 ) ( SURFACE-AT ?auto_362115 ?auto_362123 ) ( CLEAR ?auto_362115 ) ( IS-CRATE ?auto_362116 ) ( AVAILABLE ?auto_362122 ) ( IN ?auto_362116 ?auto_362118 ) ( ON ?auto_362109 ?auto_362108 ) ( ON ?auto_362110 ?auto_362109 ) ( ON ?auto_362111 ?auto_362110 ) ( ON ?auto_362112 ?auto_362111 ) ( ON ?auto_362113 ?auto_362112 ) ( ON ?auto_362114 ?auto_362113 ) ( ON ?auto_362115 ?auto_362114 ) ( not ( = ?auto_362108 ?auto_362109 ) ) ( not ( = ?auto_362108 ?auto_362110 ) ) ( not ( = ?auto_362108 ?auto_362111 ) ) ( not ( = ?auto_362108 ?auto_362112 ) ) ( not ( = ?auto_362108 ?auto_362113 ) ) ( not ( = ?auto_362108 ?auto_362114 ) ) ( not ( = ?auto_362108 ?auto_362115 ) ) ( not ( = ?auto_362108 ?auto_362116 ) ) ( not ( = ?auto_362108 ?auto_362117 ) ) ( not ( = ?auto_362108 ?auto_362120 ) ) ( not ( = ?auto_362109 ?auto_362110 ) ) ( not ( = ?auto_362109 ?auto_362111 ) ) ( not ( = ?auto_362109 ?auto_362112 ) ) ( not ( = ?auto_362109 ?auto_362113 ) ) ( not ( = ?auto_362109 ?auto_362114 ) ) ( not ( = ?auto_362109 ?auto_362115 ) ) ( not ( = ?auto_362109 ?auto_362116 ) ) ( not ( = ?auto_362109 ?auto_362117 ) ) ( not ( = ?auto_362109 ?auto_362120 ) ) ( not ( = ?auto_362110 ?auto_362111 ) ) ( not ( = ?auto_362110 ?auto_362112 ) ) ( not ( = ?auto_362110 ?auto_362113 ) ) ( not ( = ?auto_362110 ?auto_362114 ) ) ( not ( = ?auto_362110 ?auto_362115 ) ) ( not ( = ?auto_362110 ?auto_362116 ) ) ( not ( = ?auto_362110 ?auto_362117 ) ) ( not ( = ?auto_362110 ?auto_362120 ) ) ( not ( = ?auto_362111 ?auto_362112 ) ) ( not ( = ?auto_362111 ?auto_362113 ) ) ( not ( = ?auto_362111 ?auto_362114 ) ) ( not ( = ?auto_362111 ?auto_362115 ) ) ( not ( = ?auto_362111 ?auto_362116 ) ) ( not ( = ?auto_362111 ?auto_362117 ) ) ( not ( = ?auto_362111 ?auto_362120 ) ) ( not ( = ?auto_362112 ?auto_362113 ) ) ( not ( = ?auto_362112 ?auto_362114 ) ) ( not ( = ?auto_362112 ?auto_362115 ) ) ( not ( = ?auto_362112 ?auto_362116 ) ) ( not ( = ?auto_362112 ?auto_362117 ) ) ( not ( = ?auto_362112 ?auto_362120 ) ) ( not ( = ?auto_362113 ?auto_362114 ) ) ( not ( = ?auto_362113 ?auto_362115 ) ) ( not ( = ?auto_362113 ?auto_362116 ) ) ( not ( = ?auto_362113 ?auto_362117 ) ) ( not ( = ?auto_362113 ?auto_362120 ) ) ( not ( = ?auto_362114 ?auto_362115 ) ) ( not ( = ?auto_362114 ?auto_362116 ) ) ( not ( = ?auto_362114 ?auto_362117 ) ) ( not ( = ?auto_362114 ?auto_362120 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_362115 ?auto_362116 ?auto_362117 )
      ( MAKE-9CRATE-VERIFY ?auto_362108 ?auto_362109 ?auto_362110 ?auto_362111 ?auto_362112 ?auto_362113 ?auto_362114 ?auto_362115 ?auto_362116 ?auto_362117 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_367658 - SURFACE
      ?auto_367659 - SURFACE
      ?auto_367660 - SURFACE
      ?auto_367661 - SURFACE
      ?auto_367662 - SURFACE
      ?auto_367663 - SURFACE
      ?auto_367664 - SURFACE
      ?auto_367665 - SURFACE
      ?auto_367666 - SURFACE
      ?auto_367667 - SURFACE
      ?auto_367668 - SURFACE
    )
    :vars
    (
      ?auto_367670 - HOIST
      ?auto_367669 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_367670 ?auto_367669 ) ( SURFACE-AT ?auto_367667 ?auto_367669 ) ( CLEAR ?auto_367667 ) ( LIFTING ?auto_367670 ?auto_367668 ) ( IS-CRATE ?auto_367668 ) ( not ( = ?auto_367667 ?auto_367668 ) ) ( ON ?auto_367659 ?auto_367658 ) ( ON ?auto_367660 ?auto_367659 ) ( ON ?auto_367661 ?auto_367660 ) ( ON ?auto_367662 ?auto_367661 ) ( ON ?auto_367663 ?auto_367662 ) ( ON ?auto_367664 ?auto_367663 ) ( ON ?auto_367665 ?auto_367664 ) ( ON ?auto_367666 ?auto_367665 ) ( ON ?auto_367667 ?auto_367666 ) ( not ( = ?auto_367658 ?auto_367659 ) ) ( not ( = ?auto_367658 ?auto_367660 ) ) ( not ( = ?auto_367658 ?auto_367661 ) ) ( not ( = ?auto_367658 ?auto_367662 ) ) ( not ( = ?auto_367658 ?auto_367663 ) ) ( not ( = ?auto_367658 ?auto_367664 ) ) ( not ( = ?auto_367658 ?auto_367665 ) ) ( not ( = ?auto_367658 ?auto_367666 ) ) ( not ( = ?auto_367658 ?auto_367667 ) ) ( not ( = ?auto_367658 ?auto_367668 ) ) ( not ( = ?auto_367659 ?auto_367660 ) ) ( not ( = ?auto_367659 ?auto_367661 ) ) ( not ( = ?auto_367659 ?auto_367662 ) ) ( not ( = ?auto_367659 ?auto_367663 ) ) ( not ( = ?auto_367659 ?auto_367664 ) ) ( not ( = ?auto_367659 ?auto_367665 ) ) ( not ( = ?auto_367659 ?auto_367666 ) ) ( not ( = ?auto_367659 ?auto_367667 ) ) ( not ( = ?auto_367659 ?auto_367668 ) ) ( not ( = ?auto_367660 ?auto_367661 ) ) ( not ( = ?auto_367660 ?auto_367662 ) ) ( not ( = ?auto_367660 ?auto_367663 ) ) ( not ( = ?auto_367660 ?auto_367664 ) ) ( not ( = ?auto_367660 ?auto_367665 ) ) ( not ( = ?auto_367660 ?auto_367666 ) ) ( not ( = ?auto_367660 ?auto_367667 ) ) ( not ( = ?auto_367660 ?auto_367668 ) ) ( not ( = ?auto_367661 ?auto_367662 ) ) ( not ( = ?auto_367661 ?auto_367663 ) ) ( not ( = ?auto_367661 ?auto_367664 ) ) ( not ( = ?auto_367661 ?auto_367665 ) ) ( not ( = ?auto_367661 ?auto_367666 ) ) ( not ( = ?auto_367661 ?auto_367667 ) ) ( not ( = ?auto_367661 ?auto_367668 ) ) ( not ( = ?auto_367662 ?auto_367663 ) ) ( not ( = ?auto_367662 ?auto_367664 ) ) ( not ( = ?auto_367662 ?auto_367665 ) ) ( not ( = ?auto_367662 ?auto_367666 ) ) ( not ( = ?auto_367662 ?auto_367667 ) ) ( not ( = ?auto_367662 ?auto_367668 ) ) ( not ( = ?auto_367663 ?auto_367664 ) ) ( not ( = ?auto_367663 ?auto_367665 ) ) ( not ( = ?auto_367663 ?auto_367666 ) ) ( not ( = ?auto_367663 ?auto_367667 ) ) ( not ( = ?auto_367663 ?auto_367668 ) ) ( not ( = ?auto_367664 ?auto_367665 ) ) ( not ( = ?auto_367664 ?auto_367666 ) ) ( not ( = ?auto_367664 ?auto_367667 ) ) ( not ( = ?auto_367664 ?auto_367668 ) ) ( not ( = ?auto_367665 ?auto_367666 ) ) ( not ( = ?auto_367665 ?auto_367667 ) ) ( not ( = ?auto_367665 ?auto_367668 ) ) ( not ( = ?auto_367666 ?auto_367667 ) ) ( not ( = ?auto_367666 ?auto_367668 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_367667 ?auto_367668 )
      ( MAKE-10CRATE-VERIFY ?auto_367658 ?auto_367659 ?auto_367660 ?auto_367661 ?auto_367662 ?auto_367663 ?auto_367664 ?auto_367665 ?auto_367666 ?auto_367667 ?auto_367668 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_367752 - SURFACE
      ?auto_367753 - SURFACE
      ?auto_367754 - SURFACE
      ?auto_367755 - SURFACE
      ?auto_367756 - SURFACE
      ?auto_367757 - SURFACE
      ?auto_367758 - SURFACE
      ?auto_367759 - SURFACE
      ?auto_367760 - SURFACE
      ?auto_367761 - SURFACE
      ?auto_367762 - SURFACE
    )
    :vars
    (
      ?auto_367764 - HOIST
      ?auto_367763 - PLACE
      ?auto_367765 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_367764 ?auto_367763 ) ( SURFACE-AT ?auto_367761 ?auto_367763 ) ( CLEAR ?auto_367761 ) ( IS-CRATE ?auto_367762 ) ( not ( = ?auto_367761 ?auto_367762 ) ) ( TRUCK-AT ?auto_367765 ?auto_367763 ) ( AVAILABLE ?auto_367764 ) ( IN ?auto_367762 ?auto_367765 ) ( ON ?auto_367761 ?auto_367760 ) ( not ( = ?auto_367760 ?auto_367761 ) ) ( not ( = ?auto_367760 ?auto_367762 ) ) ( ON ?auto_367753 ?auto_367752 ) ( ON ?auto_367754 ?auto_367753 ) ( ON ?auto_367755 ?auto_367754 ) ( ON ?auto_367756 ?auto_367755 ) ( ON ?auto_367757 ?auto_367756 ) ( ON ?auto_367758 ?auto_367757 ) ( ON ?auto_367759 ?auto_367758 ) ( ON ?auto_367760 ?auto_367759 ) ( not ( = ?auto_367752 ?auto_367753 ) ) ( not ( = ?auto_367752 ?auto_367754 ) ) ( not ( = ?auto_367752 ?auto_367755 ) ) ( not ( = ?auto_367752 ?auto_367756 ) ) ( not ( = ?auto_367752 ?auto_367757 ) ) ( not ( = ?auto_367752 ?auto_367758 ) ) ( not ( = ?auto_367752 ?auto_367759 ) ) ( not ( = ?auto_367752 ?auto_367760 ) ) ( not ( = ?auto_367752 ?auto_367761 ) ) ( not ( = ?auto_367752 ?auto_367762 ) ) ( not ( = ?auto_367753 ?auto_367754 ) ) ( not ( = ?auto_367753 ?auto_367755 ) ) ( not ( = ?auto_367753 ?auto_367756 ) ) ( not ( = ?auto_367753 ?auto_367757 ) ) ( not ( = ?auto_367753 ?auto_367758 ) ) ( not ( = ?auto_367753 ?auto_367759 ) ) ( not ( = ?auto_367753 ?auto_367760 ) ) ( not ( = ?auto_367753 ?auto_367761 ) ) ( not ( = ?auto_367753 ?auto_367762 ) ) ( not ( = ?auto_367754 ?auto_367755 ) ) ( not ( = ?auto_367754 ?auto_367756 ) ) ( not ( = ?auto_367754 ?auto_367757 ) ) ( not ( = ?auto_367754 ?auto_367758 ) ) ( not ( = ?auto_367754 ?auto_367759 ) ) ( not ( = ?auto_367754 ?auto_367760 ) ) ( not ( = ?auto_367754 ?auto_367761 ) ) ( not ( = ?auto_367754 ?auto_367762 ) ) ( not ( = ?auto_367755 ?auto_367756 ) ) ( not ( = ?auto_367755 ?auto_367757 ) ) ( not ( = ?auto_367755 ?auto_367758 ) ) ( not ( = ?auto_367755 ?auto_367759 ) ) ( not ( = ?auto_367755 ?auto_367760 ) ) ( not ( = ?auto_367755 ?auto_367761 ) ) ( not ( = ?auto_367755 ?auto_367762 ) ) ( not ( = ?auto_367756 ?auto_367757 ) ) ( not ( = ?auto_367756 ?auto_367758 ) ) ( not ( = ?auto_367756 ?auto_367759 ) ) ( not ( = ?auto_367756 ?auto_367760 ) ) ( not ( = ?auto_367756 ?auto_367761 ) ) ( not ( = ?auto_367756 ?auto_367762 ) ) ( not ( = ?auto_367757 ?auto_367758 ) ) ( not ( = ?auto_367757 ?auto_367759 ) ) ( not ( = ?auto_367757 ?auto_367760 ) ) ( not ( = ?auto_367757 ?auto_367761 ) ) ( not ( = ?auto_367757 ?auto_367762 ) ) ( not ( = ?auto_367758 ?auto_367759 ) ) ( not ( = ?auto_367758 ?auto_367760 ) ) ( not ( = ?auto_367758 ?auto_367761 ) ) ( not ( = ?auto_367758 ?auto_367762 ) ) ( not ( = ?auto_367759 ?auto_367760 ) ) ( not ( = ?auto_367759 ?auto_367761 ) ) ( not ( = ?auto_367759 ?auto_367762 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_367760 ?auto_367761 ?auto_367762 )
      ( MAKE-10CRATE-VERIFY ?auto_367752 ?auto_367753 ?auto_367754 ?auto_367755 ?auto_367756 ?auto_367757 ?auto_367758 ?auto_367759 ?auto_367760 ?auto_367761 ?auto_367762 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_367857 - SURFACE
      ?auto_367858 - SURFACE
      ?auto_367859 - SURFACE
      ?auto_367860 - SURFACE
      ?auto_367861 - SURFACE
      ?auto_367862 - SURFACE
      ?auto_367863 - SURFACE
      ?auto_367864 - SURFACE
      ?auto_367865 - SURFACE
      ?auto_367866 - SURFACE
      ?auto_367867 - SURFACE
    )
    :vars
    (
      ?auto_367870 - HOIST
      ?auto_367868 - PLACE
      ?auto_367869 - TRUCK
      ?auto_367871 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_367870 ?auto_367868 ) ( SURFACE-AT ?auto_367866 ?auto_367868 ) ( CLEAR ?auto_367866 ) ( IS-CRATE ?auto_367867 ) ( not ( = ?auto_367866 ?auto_367867 ) ) ( AVAILABLE ?auto_367870 ) ( IN ?auto_367867 ?auto_367869 ) ( ON ?auto_367866 ?auto_367865 ) ( not ( = ?auto_367865 ?auto_367866 ) ) ( not ( = ?auto_367865 ?auto_367867 ) ) ( TRUCK-AT ?auto_367869 ?auto_367871 ) ( not ( = ?auto_367871 ?auto_367868 ) ) ( ON ?auto_367858 ?auto_367857 ) ( ON ?auto_367859 ?auto_367858 ) ( ON ?auto_367860 ?auto_367859 ) ( ON ?auto_367861 ?auto_367860 ) ( ON ?auto_367862 ?auto_367861 ) ( ON ?auto_367863 ?auto_367862 ) ( ON ?auto_367864 ?auto_367863 ) ( ON ?auto_367865 ?auto_367864 ) ( not ( = ?auto_367857 ?auto_367858 ) ) ( not ( = ?auto_367857 ?auto_367859 ) ) ( not ( = ?auto_367857 ?auto_367860 ) ) ( not ( = ?auto_367857 ?auto_367861 ) ) ( not ( = ?auto_367857 ?auto_367862 ) ) ( not ( = ?auto_367857 ?auto_367863 ) ) ( not ( = ?auto_367857 ?auto_367864 ) ) ( not ( = ?auto_367857 ?auto_367865 ) ) ( not ( = ?auto_367857 ?auto_367866 ) ) ( not ( = ?auto_367857 ?auto_367867 ) ) ( not ( = ?auto_367858 ?auto_367859 ) ) ( not ( = ?auto_367858 ?auto_367860 ) ) ( not ( = ?auto_367858 ?auto_367861 ) ) ( not ( = ?auto_367858 ?auto_367862 ) ) ( not ( = ?auto_367858 ?auto_367863 ) ) ( not ( = ?auto_367858 ?auto_367864 ) ) ( not ( = ?auto_367858 ?auto_367865 ) ) ( not ( = ?auto_367858 ?auto_367866 ) ) ( not ( = ?auto_367858 ?auto_367867 ) ) ( not ( = ?auto_367859 ?auto_367860 ) ) ( not ( = ?auto_367859 ?auto_367861 ) ) ( not ( = ?auto_367859 ?auto_367862 ) ) ( not ( = ?auto_367859 ?auto_367863 ) ) ( not ( = ?auto_367859 ?auto_367864 ) ) ( not ( = ?auto_367859 ?auto_367865 ) ) ( not ( = ?auto_367859 ?auto_367866 ) ) ( not ( = ?auto_367859 ?auto_367867 ) ) ( not ( = ?auto_367860 ?auto_367861 ) ) ( not ( = ?auto_367860 ?auto_367862 ) ) ( not ( = ?auto_367860 ?auto_367863 ) ) ( not ( = ?auto_367860 ?auto_367864 ) ) ( not ( = ?auto_367860 ?auto_367865 ) ) ( not ( = ?auto_367860 ?auto_367866 ) ) ( not ( = ?auto_367860 ?auto_367867 ) ) ( not ( = ?auto_367861 ?auto_367862 ) ) ( not ( = ?auto_367861 ?auto_367863 ) ) ( not ( = ?auto_367861 ?auto_367864 ) ) ( not ( = ?auto_367861 ?auto_367865 ) ) ( not ( = ?auto_367861 ?auto_367866 ) ) ( not ( = ?auto_367861 ?auto_367867 ) ) ( not ( = ?auto_367862 ?auto_367863 ) ) ( not ( = ?auto_367862 ?auto_367864 ) ) ( not ( = ?auto_367862 ?auto_367865 ) ) ( not ( = ?auto_367862 ?auto_367866 ) ) ( not ( = ?auto_367862 ?auto_367867 ) ) ( not ( = ?auto_367863 ?auto_367864 ) ) ( not ( = ?auto_367863 ?auto_367865 ) ) ( not ( = ?auto_367863 ?auto_367866 ) ) ( not ( = ?auto_367863 ?auto_367867 ) ) ( not ( = ?auto_367864 ?auto_367865 ) ) ( not ( = ?auto_367864 ?auto_367866 ) ) ( not ( = ?auto_367864 ?auto_367867 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_367865 ?auto_367866 ?auto_367867 )
      ( MAKE-10CRATE-VERIFY ?auto_367857 ?auto_367858 ?auto_367859 ?auto_367860 ?auto_367861 ?auto_367862 ?auto_367863 ?auto_367864 ?auto_367865 ?auto_367866 ?auto_367867 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_367972 - SURFACE
      ?auto_367973 - SURFACE
      ?auto_367974 - SURFACE
      ?auto_367975 - SURFACE
      ?auto_367976 - SURFACE
      ?auto_367977 - SURFACE
      ?auto_367978 - SURFACE
      ?auto_367979 - SURFACE
      ?auto_367980 - SURFACE
      ?auto_367981 - SURFACE
      ?auto_367982 - SURFACE
    )
    :vars
    (
      ?auto_367987 - HOIST
      ?auto_367984 - PLACE
      ?auto_367985 - TRUCK
      ?auto_367986 - PLACE
      ?auto_367983 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_367987 ?auto_367984 ) ( SURFACE-AT ?auto_367981 ?auto_367984 ) ( CLEAR ?auto_367981 ) ( IS-CRATE ?auto_367982 ) ( not ( = ?auto_367981 ?auto_367982 ) ) ( AVAILABLE ?auto_367987 ) ( ON ?auto_367981 ?auto_367980 ) ( not ( = ?auto_367980 ?auto_367981 ) ) ( not ( = ?auto_367980 ?auto_367982 ) ) ( TRUCK-AT ?auto_367985 ?auto_367986 ) ( not ( = ?auto_367986 ?auto_367984 ) ) ( HOIST-AT ?auto_367983 ?auto_367986 ) ( LIFTING ?auto_367983 ?auto_367982 ) ( not ( = ?auto_367987 ?auto_367983 ) ) ( ON ?auto_367973 ?auto_367972 ) ( ON ?auto_367974 ?auto_367973 ) ( ON ?auto_367975 ?auto_367974 ) ( ON ?auto_367976 ?auto_367975 ) ( ON ?auto_367977 ?auto_367976 ) ( ON ?auto_367978 ?auto_367977 ) ( ON ?auto_367979 ?auto_367978 ) ( ON ?auto_367980 ?auto_367979 ) ( not ( = ?auto_367972 ?auto_367973 ) ) ( not ( = ?auto_367972 ?auto_367974 ) ) ( not ( = ?auto_367972 ?auto_367975 ) ) ( not ( = ?auto_367972 ?auto_367976 ) ) ( not ( = ?auto_367972 ?auto_367977 ) ) ( not ( = ?auto_367972 ?auto_367978 ) ) ( not ( = ?auto_367972 ?auto_367979 ) ) ( not ( = ?auto_367972 ?auto_367980 ) ) ( not ( = ?auto_367972 ?auto_367981 ) ) ( not ( = ?auto_367972 ?auto_367982 ) ) ( not ( = ?auto_367973 ?auto_367974 ) ) ( not ( = ?auto_367973 ?auto_367975 ) ) ( not ( = ?auto_367973 ?auto_367976 ) ) ( not ( = ?auto_367973 ?auto_367977 ) ) ( not ( = ?auto_367973 ?auto_367978 ) ) ( not ( = ?auto_367973 ?auto_367979 ) ) ( not ( = ?auto_367973 ?auto_367980 ) ) ( not ( = ?auto_367973 ?auto_367981 ) ) ( not ( = ?auto_367973 ?auto_367982 ) ) ( not ( = ?auto_367974 ?auto_367975 ) ) ( not ( = ?auto_367974 ?auto_367976 ) ) ( not ( = ?auto_367974 ?auto_367977 ) ) ( not ( = ?auto_367974 ?auto_367978 ) ) ( not ( = ?auto_367974 ?auto_367979 ) ) ( not ( = ?auto_367974 ?auto_367980 ) ) ( not ( = ?auto_367974 ?auto_367981 ) ) ( not ( = ?auto_367974 ?auto_367982 ) ) ( not ( = ?auto_367975 ?auto_367976 ) ) ( not ( = ?auto_367975 ?auto_367977 ) ) ( not ( = ?auto_367975 ?auto_367978 ) ) ( not ( = ?auto_367975 ?auto_367979 ) ) ( not ( = ?auto_367975 ?auto_367980 ) ) ( not ( = ?auto_367975 ?auto_367981 ) ) ( not ( = ?auto_367975 ?auto_367982 ) ) ( not ( = ?auto_367976 ?auto_367977 ) ) ( not ( = ?auto_367976 ?auto_367978 ) ) ( not ( = ?auto_367976 ?auto_367979 ) ) ( not ( = ?auto_367976 ?auto_367980 ) ) ( not ( = ?auto_367976 ?auto_367981 ) ) ( not ( = ?auto_367976 ?auto_367982 ) ) ( not ( = ?auto_367977 ?auto_367978 ) ) ( not ( = ?auto_367977 ?auto_367979 ) ) ( not ( = ?auto_367977 ?auto_367980 ) ) ( not ( = ?auto_367977 ?auto_367981 ) ) ( not ( = ?auto_367977 ?auto_367982 ) ) ( not ( = ?auto_367978 ?auto_367979 ) ) ( not ( = ?auto_367978 ?auto_367980 ) ) ( not ( = ?auto_367978 ?auto_367981 ) ) ( not ( = ?auto_367978 ?auto_367982 ) ) ( not ( = ?auto_367979 ?auto_367980 ) ) ( not ( = ?auto_367979 ?auto_367981 ) ) ( not ( = ?auto_367979 ?auto_367982 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_367980 ?auto_367981 ?auto_367982 )
      ( MAKE-10CRATE-VERIFY ?auto_367972 ?auto_367973 ?auto_367974 ?auto_367975 ?auto_367976 ?auto_367977 ?auto_367978 ?auto_367979 ?auto_367980 ?auto_367981 ?auto_367982 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_368097 - SURFACE
      ?auto_368098 - SURFACE
      ?auto_368099 - SURFACE
      ?auto_368100 - SURFACE
      ?auto_368101 - SURFACE
      ?auto_368102 - SURFACE
      ?auto_368103 - SURFACE
      ?auto_368104 - SURFACE
      ?auto_368105 - SURFACE
      ?auto_368106 - SURFACE
      ?auto_368107 - SURFACE
    )
    :vars
    (
      ?auto_368112 - HOIST
      ?auto_368108 - PLACE
      ?auto_368113 - TRUCK
      ?auto_368109 - PLACE
      ?auto_368110 - HOIST
      ?auto_368111 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_368112 ?auto_368108 ) ( SURFACE-AT ?auto_368106 ?auto_368108 ) ( CLEAR ?auto_368106 ) ( IS-CRATE ?auto_368107 ) ( not ( = ?auto_368106 ?auto_368107 ) ) ( AVAILABLE ?auto_368112 ) ( ON ?auto_368106 ?auto_368105 ) ( not ( = ?auto_368105 ?auto_368106 ) ) ( not ( = ?auto_368105 ?auto_368107 ) ) ( TRUCK-AT ?auto_368113 ?auto_368109 ) ( not ( = ?auto_368109 ?auto_368108 ) ) ( HOIST-AT ?auto_368110 ?auto_368109 ) ( not ( = ?auto_368112 ?auto_368110 ) ) ( AVAILABLE ?auto_368110 ) ( SURFACE-AT ?auto_368107 ?auto_368109 ) ( ON ?auto_368107 ?auto_368111 ) ( CLEAR ?auto_368107 ) ( not ( = ?auto_368106 ?auto_368111 ) ) ( not ( = ?auto_368107 ?auto_368111 ) ) ( not ( = ?auto_368105 ?auto_368111 ) ) ( ON ?auto_368098 ?auto_368097 ) ( ON ?auto_368099 ?auto_368098 ) ( ON ?auto_368100 ?auto_368099 ) ( ON ?auto_368101 ?auto_368100 ) ( ON ?auto_368102 ?auto_368101 ) ( ON ?auto_368103 ?auto_368102 ) ( ON ?auto_368104 ?auto_368103 ) ( ON ?auto_368105 ?auto_368104 ) ( not ( = ?auto_368097 ?auto_368098 ) ) ( not ( = ?auto_368097 ?auto_368099 ) ) ( not ( = ?auto_368097 ?auto_368100 ) ) ( not ( = ?auto_368097 ?auto_368101 ) ) ( not ( = ?auto_368097 ?auto_368102 ) ) ( not ( = ?auto_368097 ?auto_368103 ) ) ( not ( = ?auto_368097 ?auto_368104 ) ) ( not ( = ?auto_368097 ?auto_368105 ) ) ( not ( = ?auto_368097 ?auto_368106 ) ) ( not ( = ?auto_368097 ?auto_368107 ) ) ( not ( = ?auto_368097 ?auto_368111 ) ) ( not ( = ?auto_368098 ?auto_368099 ) ) ( not ( = ?auto_368098 ?auto_368100 ) ) ( not ( = ?auto_368098 ?auto_368101 ) ) ( not ( = ?auto_368098 ?auto_368102 ) ) ( not ( = ?auto_368098 ?auto_368103 ) ) ( not ( = ?auto_368098 ?auto_368104 ) ) ( not ( = ?auto_368098 ?auto_368105 ) ) ( not ( = ?auto_368098 ?auto_368106 ) ) ( not ( = ?auto_368098 ?auto_368107 ) ) ( not ( = ?auto_368098 ?auto_368111 ) ) ( not ( = ?auto_368099 ?auto_368100 ) ) ( not ( = ?auto_368099 ?auto_368101 ) ) ( not ( = ?auto_368099 ?auto_368102 ) ) ( not ( = ?auto_368099 ?auto_368103 ) ) ( not ( = ?auto_368099 ?auto_368104 ) ) ( not ( = ?auto_368099 ?auto_368105 ) ) ( not ( = ?auto_368099 ?auto_368106 ) ) ( not ( = ?auto_368099 ?auto_368107 ) ) ( not ( = ?auto_368099 ?auto_368111 ) ) ( not ( = ?auto_368100 ?auto_368101 ) ) ( not ( = ?auto_368100 ?auto_368102 ) ) ( not ( = ?auto_368100 ?auto_368103 ) ) ( not ( = ?auto_368100 ?auto_368104 ) ) ( not ( = ?auto_368100 ?auto_368105 ) ) ( not ( = ?auto_368100 ?auto_368106 ) ) ( not ( = ?auto_368100 ?auto_368107 ) ) ( not ( = ?auto_368100 ?auto_368111 ) ) ( not ( = ?auto_368101 ?auto_368102 ) ) ( not ( = ?auto_368101 ?auto_368103 ) ) ( not ( = ?auto_368101 ?auto_368104 ) ) ( not ( = ?auto_368101 ?auto_368105 ) ) ( not ( = ?auto_368101 ?auto_368106 ) ) ( not ( = ?auto_368101 ?auto_368107 ) ) ( not ( = ?auto_368101 ?auto_368111 ) ) ( not ( = ?auto_368102 ?auto_368103 ) ) ( not ( = ?auto_368102 ?auto_368104 ) ) ( not ( = ?auto_368102 ?auto_368105 ) ) ( not ( = ?auto_368102 ?auto_368106 ) ) ( not ( = ?auto_368102 ?auto_368107 ) ) ( not ( = ?auto_368102 ?auto_368111 ) ) ( not ( = ?auto_368103 ?auto_368104 ) ) ( not ( = ?auto_368103 ?auto_368105 ) ) ( not ( = ?auto_368103 ?auto_368106 ) ) ( not ( = ?auto_368103 ?auto_368107 ) ) ( not ( = ?auto_368103 ?auto_368111 ) ) ( not ( = ?auto_368104 ?auto_368105 ) ) ( not ( = ?auto_368104 ?auto_368106 ) ) ( not ( = ?auto_368104 ?auto_368107 ) ) ( not ( = ?auto_368104 ?auto_368111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_368105 ?auto_368106 ?auto_368107 )
      ( MAKE-10CRATE-VERIFY ?auto_368097 ?auto_368098 ?auto_368099 ?auto_368100 ?auto_368101 ?auto_368102 ?auto_368103 ?auto_368104 ?auto_368105 ?auto_368106 ?auto_368107 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_368223 - SURFACE
      ?auto_368224 - SURFACE
      ?auto_368225 - SURFACE
      ?auto_368226 - SURFACE
      ?auto_368227 - SURFACE
      ?auto_368228 - SURFACE
      ?auto_368229 - SURFACE
      ?auto_368230 - SURFACE
      ?auto_368231 - SURFACE
      ?auto_368232 - SURFACE
      ?auto_368233 - SURFACE
    )
    :vars
    (
      ?auto_368238 - HOIST
      ?auto_368237 - PLACE
      ?auto_368239 - PLACE
      ?auto_368236 - HOIST
      ?auto_368234 - SURFACE
      ?auto_368235 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_368238 ?auto_368237 ) ( SURFACE-AT ?auto_368232 ?auto_368237 ) ( CLEAR ?auto_368232 ) ( IS-CRATE ?auto_368233 ) ( not ( = ?auto_368232 ?auto_368233 ) ) ( AVAILABLE ?auto_368238 ) ( ON ?auto_368232 ?auto_368231 ) ( not ( = ?auto_368231 ?auto_368232 ) ) ( not ( = ?auto_368231 ?auto_368233 ) ) ( not ( = ?auto_368239 ?auto_368237 ) ) ( HOIST-AT ?auto_368236 ?auto_368239 ) ( not ( = ?auto_368238 ?auto_368236 ) ) ( AVAILABLE ?auto_368236 ) ( SURFACE-AT ?auto_368233 ?auto_368239 ) ( ON ?auto_368233 ?auto_368234 ) ( CLEAR ?auto_368233 ) ( not ( = ?auto_368232 ?auto_368234 ) ) ( not ( = ?auto_368233 ?auto_368234 ) ) ( not ( = ?auto_368231 ?auto_368234 ) ) ( TRUCK-AT ?auto_368235 ?auto_368237 ) ( ON ?auto_368224 ?auto_368223 ) ( ON ?auto_368225 ?auto_368224 ) ( ON ?auto_368226 ?auto_368225 ) ( ON ?auto_368227 ?auto_368226 ) ( ON ?auto_368228 ?auto_368227 ) ( ON ?auto_368229 ?auto_368228 ) ( ON ?auto_368230 ?auto_368229 ) ( ON ?auto_368231 ?auto_368230 ) ( not ( = ?auto_368223 ?auto_368224 ) ) ( not ( = ?auto_368223 ?auto_368225 ) ) ( not ( = ?auto_368223 ?auto_368226 ) ) ( not ( = ?auto_368223 ?auto_368227 ) ) ( not ( = ?auto_368223 ?auto_368228 ) ) ( not ( = ?auto_368223 ?auto_368229 ) ) ( not ( = ?auto_368223 ?auto_368230 ) ) ( not ( = ?auto_368223 ?auto_368231 ) ) ( not ( = ?auto_368223 ?auto_368232 ) ) ( not ( = ?auto_368223 ?auto_368233 ) ) ( not ( = ?auto_368223 ?auto_368234 ) ) ( not ( = ?auto_368224 ?auto_368225 ) ) ( not ( = ?auto_368224 ?auto_368226 ) ) ( not ( = ?auto_368224 ?auto_368227 ) ) ( not ( = ?auto_368224 ?auto_368228 ) ) ( not ( = ?auto_368224 ?auto_368229 ) ) ( not ( = ?auto_368224 ?auto_368230 ) ) ( not ( = ?auto_368224 ?auto_368231 ) ) ( not ( = ?auto_368224 ?auto_368232 ) ) ( not ( = ?auto_368224 ?auto_368233 ) ) ( not ( = ?auto_368224 ?auto_368234 ) ) ( not ( = ?auto_368225 ?auto_368226 ) ) ( not ( = ?auto_368225 ?auto_368227 ) ) ( not ( = ?auto_368225 ?auto_368228 ) ) ( not ( = ?auto_368225 ?auto_368229 ) ) ( not ( = ?auto_368225 ?auto_368230 ) ) ( not ( = ?auto_368225 ?auto_368231 ) ) ( not ( = ?auto_368225 ?auto_368232 ) ) ( not ( = ?auto_368225 ?auto_368233 ) ) ( not ( = ?auto_368225 ?auto_368234 ) ) ( not ( = ?auto_368226 ?auto_368227 ) ) ( not ( = ?auto_368226 ?auto_368228 ) ) ( not ( = ?auto_368226 ?auto_368229 ) ) ( not ( = ?auto_368226 ?auto_368230 ) ) ( not ( = ?auto_368226 ?auto_368231 ) ) ( not ( = ?auto_368226 ?auto_368232 ) ) ( not ( = ?auto_368226 ?auto_368233 ) ) ( not ( = ?auto_368226 ?auto_368234 ) ) ( not ( = ?auto_368227 ?auto_368228 ) ) ( not ( = ?auto_368227 ?auto_368229 ) ) ( not ( = ?auto_368227 ?auto_368230 ) ) ( not ( = ?auto_368227 ?auto_368231 ) ) ( not ( = ?auto_368227 ?auto_368232 ) ) ( not ( = ?auto_368227 ?auto_368233 ) ) ( not ( = ?auto_368227 ?auto_368234 ) ) ( not ( = ?auto_368228 ?auto_368229 ) ) ( not ( = ?auto_368228 ?auto_368230 ) ) ( not ( = ?auto_368228 ?auto_368231 ) ) ( not ( = ?auto_368228 ?auto_368232 ) ) ( not ( = ?auto_368228 ?auto_368233 ) ) ( not ( = ?auto_368228 ?auto_368234 ) ) ( not ( = ?auto_368229 ?auto_368230 ) ) ( not ( = ?auto_368229 ?auto_368231 ) ) ( not ( = ?auto_368229 ?auto_368232 ) ) ( not ( = ?auto_368229 ?auto_368233 ) ) ( not ( = ?auto_368229 ?auto_368234 ) ) ( not ( = ?auto_368230 ?auto_368231 ) ) ( not ( = ?auto_368230 ?auto_368232 ) ) ( not ( = ?auto_368230 ?auto_368233 ) ) ( not ( = ?auto_368230 ?auto_368234 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_368231 ?auto_368232 ?auto_368233 )
      ( MAKE-10CRATE-VERIFY ?auto_368223 ?auto_368224 ?auto_368225 ?auto_368226 ?auto_368227 ?auto_368228 ?auto_368229 ?auto_368230 ?auto_368231 ?auto_368232 ?auto_368233 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_368349 - SURFACE
      ?auto_368350 - SURFACE
      ?auto_368351 - SURFACE
      ?auto_368352 - SURFACE
      ?auto_368353 - SURFACE
      ?auto_368354 - SURFACE
      ?auto_368355 - SURFACE
      ?auto_368356 - SURFACE
      ?auto_368357 - SURFACE
      ?auto_368358 - SURFACE
      ?auto_368359 - SURFACE
    )
    :vars
    (
      ?auto_368365 - HOIST
      ?auto_368362 - PLACE
      ?auto_368361 - PLACE
      ?auto_368364 - HOIST
      ?auto_368360 - SURFACE
      ?auto_368363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_368365 ?auto_368362 ) ( IS-CRATE ?auto_368359 ) ( not ( = ?auto_368358 ?auto_368359 ) ) ( not ( = ?auto_368357 ?auto_368358 ) ) ( not ( = ?auto_368357 ?auto_368359 ) ) ( not ( = ?auto_368361 ?auto_368362 ) ) ( HOIST-AT ?auto_368364 ?auto_368361 ) ( not ( = ?auto_368365 ?auto_368364 ) ) ( AVAILABLE ?auto_368364 ) ( SURFACE-AT ?auto_368359 ?auto_368361 ) ( ON ?auto_368359 ?auto_368360 ) ( CLEAR ?auto_368359 ) ( not ( = ?auto_368358 ?auto_368360 ) ) ( not ( = ?auto_368359 ?auto_368360 ) ) ( not ( = ?auto_368357 ?auto_368360 ) ) ( TRUCK-AT ?auto_368363 ?auto_368362 ) ( SURFACE-AT ?auto_368357 ?auto_368362 ) ( CLEAR ?auto_368357 ) ( LIFTING ?auto_368365 ?auto_368358 ) ( IS-CRATE ?auto_368358 ) ( ON ?auto_368350 ?auto_368349 ) ( ON ?auto_368351 ?auto_368350 ) ( ON ?auto_368352 ?auto_368351 ) ( ON ?auto_368353 ?auto_368352 ) ( ON ?auto_368354 ?auto_368353 ) ( ON ?auto_368355 ?auto_368354 ) ( ON ?auto_368356 ?auto_368355 ) ( ON ?auto_368357 ?auto_368356 ) ( not ( = ?auto_368349 ?auto_368350 ) ) ( not ( = ?auto_368349 ?auto_368351 ) ) ( not ( = ?auto_368349 ?auto_368352 ) ) ( not ( = ?auto_368349 ?auto_368353 ) ) ( not ( = ?auto_368349 ?auto_368354 ) ) ( not ( = ?auto_368349 ?auto_368355 ) ) ( not ( = ?auto_368349 ?auto_368356 ) ) ( not ( = ?auto_368349 ?auto_368357 ) ) ( not ( = ?auto_368349 ?auto_368358 ) ) ( not ( = ?auto_368349 ?auto_368359 ) ) ( not ( = ?auto_368349 ?auto_368360 ) ) ( not ( = ?auto_368350 ?auto_368351 ) ) ( not ( = ?auto_368350 ?auto_368352 ) ) ( not ( = ?auto_368350 ?auto_368353 ) ) ( not ( = ?auto_368350 ?auto_368354 ) ) ( not ( = ?auto_368350 ?auto_368355 ) ) ( not ( = ?auto_368350 ?auto_368356 ) ) ( not ( = ?auto_368350 ?auto_368357 ) ) ( not ( = ?auto_368350 ?auto_368358 ) ) ( not ( = ?auto_368350 ?auto_368359 ) ) ( not ( = ?auto_368350 ?auto_368360 ) ) ( not ( = ?auto_368351 ?auto_368352 ) ) ( not ( = ?auto_368351 ?auto_368353 ) ) ( not ( = ?auto_368351 ?auto_368354 ) ) ( not ( = ?auto_368351 ?auto_368355 ) ) ( not ( = ?auto_368351 ?auto_368356 ) ) ( not ( = ?auto_368351 ?auto_368357 ) ) ( not ( = ?auto_368351 ?auto_368358 ) ) ( not ( = ?auto_368351 ?auto_368359 ) ) ( not ( = ?auto_368351 ?auto_368360 ) ) ( not ( = ?auto_368352 ?auto_368353 ) ) ( not ( = ?auto_368352 ?auto_368354 ) ) ( not ( = ?auto_368352 ?auto_368355 ) ) ( not ( = ?auto_368352 ?auto_368356 ) ) ( not ( = ?auto_368352 ?auto_368357 ) ) ( not ( = ?auto_368352 ?auto_368358 ) ) ( not ( = ?auto_368352 ?auto_368359 ) ) ( not ( = ?auto_368352 ?auto_368360 ) ) ( not ( = ?auto_368353 ?auto_368354 ) ) ( not ( = ?auto_368353 ?auto_368355 ) ) ( not ( = ?auto_368353 ?auto_368356 ) ) ( not ( = ?auto_368353 ?auto_368357 ) ) ( not ( = ?auto_368353 ?auto_368358 ) ) ( not ( = ?auto_368353 ?auto_368359 ) ) ( not ( = ?auto_368353 ?auto_368360 ) ) ( not ( = ?auto_368354 ?auto_368355 ) ) ( not ( = ?auto_368354 ?auto_368356 ) ) ( not ( = ?auto_368354 ?auto_368357 ) ) ( not ( = ?auto_368354 ?auto_368358 ) ) ( not ( = ?auto_368354 ?auto_368359 ) ) ( not ( = ?auto_368354 ?auto_368360 ) ) ( not ( = ?auto_368355 ?auto_368356 ) ) ( not ( = ?auto_368355 ?auto_368357 ) ) ( not ( = ?auto_368355 ?auto_368358 ) ) ( not ( = ?auto_368355 ?auto_368359 ) ) ( not ( = ?auto_368355 ?auto_368360 ) ) ( not ( = ?auto_368356 ?auto_368357 ) ) ( not ( = ?auto_368356 ?auto_368358 ) ) ( not ( = ?auto_368356 ?auto_368359 ) ) ( not ( = ?auto_368356 ?auto_368360 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_368357 ?auto_368358 ?auto_368359 )
      ( MAKE-10CRATE-VERIFY ?auto_368349 ?auto_368350 ?auto_368351 ?auto_368352 ?auto_368353 ?auto_368354 ?auto_368355 ?auto_368356 ?auto_368357 ?auto_368358 ?auto_368359 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_368475 - SURFACE
      ?auto_368476 - SURFACE
      ?auto_368477 - SURFACE
      ?auto_368478 - SURFACE
      ?auto_368479 - SURFACE
      ?auto_368480 - SURFACE
      ?auto_368481 - SURFACE
      ?auto_368482 - SURFACE
      ?auto_368483 - SURFACE
      ?auto_368484 - SURFACE
      ?auto_368485 - SURFACE
    )
    :vars
    (
      ?auto_368490 - HOIST
      ?auto_368487 - PLACE
      ?auto_368491 - PLACE
      ?auto_368488 - HOIST
      ?auto_368489 - SURFACE
      ?auto_368486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_368490 ?auto_368487 ) ( IS-CRATE ?auto_368485 ) ( not ( = ?auto_368484 ?auto_368485 ) ) ( not ( = ?auto_368483 ?auto_368484 ) ) ( not ( = ?auto_368483 ?auto_368485 ) ) ( not ( = ?auto_368491 ?auto_368487 ) ) ( HOIST-AT ?auto_368488 ?auto_368491 ) ( not ( = ?auto_368490 ?auto_368488 ) ) ( AVAILABLE ?auto_368488 ) ( SURFACE-AT ?auto_368485 ?auto_368491 ) ( ON ?auto_368485 ?auto_368489 ) ( CLEAR ?auto_368485 ) ( not ( = ?auto_368484 ?auto_368489 ) ) ( not ( = ?auto_368485 ?auto_368489 ) ) ( not ( = ?auto_368483 ?auto_368489 ) ) ( TRUCK-AT ?auto_368486 ?auto_368487 ) ( SURFACE-AT ?auto_368483 ?auto_368487 ) ( CLEAR ?auto_368483 ) ( IS-CRATE ?auto_368484 ) ( AVAILABLE ?auto_368490 ) ( IN ?auto_368484 ?auto_368486 ) ( ON ?auto_368476 ?auto_368475 ) ( ON ?auto_368477 ?auto_368476 ) ( ON ?auto_368478 ?auto_368477 ) ( ON ?auto_368479 ?auto_368478 ) ( ON ?auto_368480 ?auto_368479 ) ( ON ?auto_368481 ?auto_368480 ) ( ON ?auto_368482 ?auto_368481 ) ( ON ?auto_368483 ?auto_368482 ) ( not ( = ?auto_368475 ?auto_368476 ) ) ( not ( = ?auto_368475 ?auto_368477 ) ) ( not ( = ?auto_368475 ?auto_368478 ) ) ( not ( = ?auto_368475 ?auto_368479 ) ) ( not ( = ?auto_368475 ?auto_368480 ) ) ( not ( = ?auto_368475 ?auto_368481 ) ) ( not ( = ?auto_368475 ?auto_368482 ) ) ( not ( = ?auto_368475 ?auto_368483 ) ) ( not ( = ?auto_368475 ?auto_368484 ) ) ( not ( = ?auto_368475 ?auto_368485 ) ) ( not ( = ?auto_368475 ?auto_368489 ) ) ( not ( = ?auto_368476 ?auto_368477 ) ) ( not ( = ?auto_368476 ?auto_368478 ) ) ( not ( = ?auto_368476 ?auto_368479 ) ) ( not ( = ?auto_368476 ?auto_368480 ) ) ( not ( = ?auto_368476 ?auto_368481 ) ) ( not ( = ?auto_368476 ?auto_368482 ) ) ( not ( = ?auto_368476 ?auto_368483 ) ) ( not ( = ?auto_368476 ?auto_368484 ) ) ( not ( = ?auto_368476 ?auto_368485 ) ) ( not ( = ?auto_368476 ?auto_368489 ) ) ( not ( = ?auto_368477 ?auto_368478 ) ) ( not ( = ?auto_368477 ?auto_368479 ) ) ( not ( = ?auto_368477 ?auto_368480 ) ) ( not ( = ?auto_368477 ?auto_368481 ) ) ( not ( = ?auto_368477 ?auto_368482 ) ) ( not ( = ?auto_368477 ?auto_368483 ) ) ( not ( = ?auto_368477 ?auto_368484 ) ) ( not ( = ?auto_368477 ?auto_368485 ) ) ( not ( = ?auto_368477 ?auto_368489 ) ) ( not ( = ?auto_368478 ?auto_368479 ) ) ( not ( = ?auto_368478 ?auto_368480 ) ) ( not ( = ?auto_368478 ?auto_368481 ) ) ( not ( = ?auto_368478 ?auto_368482 ) ) ( not ( = ?auto_368478 ?auto_368483 ) ) ( not ( = ?auto_368478 ?auto_368484 ) ) ( not ( = ?auto_368478 ?auto_368485 ) ) ( not ( = ?auto_368478 ?auto_368489 ) ) ( not ( = ?auto_368479 ?auto_368480 ) ) ( not ( = ?auto_368479 ?auto_368481 ) ) ( not ( = ?auto_368479 ?auto_368482 ) ) ( not ( = ?auto_368479 ?auto_368483 ) ) ( not ( = ?auto_368479 ?auto_368484 ) ) ( not ( = ?auto_368479 ?auto_368485 ) ) ( not ( = ?auto_368479 ?auto_368489 ) ) ( not ( = ?auto_368480 ?auto_368481 ) ) ( not ( = ?auto_368480 ?auto_368482 ) ) ( not ( = ?auto_368480 ?auto_368483 ) ) ( not ( = ?auto_368480 ?auto_368484 ) ) ( not ( = ?auto_368480 ?auto_368485 ) ) ( not ( = ?auto_368480 ?auto_368489 ) ) ( not ( = ?auto_368481 ?auto_368482 ) ) ( not ( = ?auto_368481 ?auto_368483 ) ) ( not ( = ?auto_368481 ?auto_368484 ) ) ( not ( = ?auto_368481 ?auto_368485 ) ) ( not ( = ?auto_368481 ?auto_368489 ) ) ( not ( = ?auto_368482 ?auto_368483 ) ) ( not ( = ?auto_368482 ?auto_368484 ) ) ( not ( = ?auto_368482 ?auto_368485 ) ) ( not ( = ?auto_368482 ?auto_368489 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_368483 ?auto_368484 ?auto_368485 )
      ( MAKE-10CRATE-VERIFY ?auto_368475 ?auto_368476 ?auto_368477 ?auto_368478 ?auto_368479 ?auto_368480 ?auto_368481 ?auto_368482 ?auto_368483 ?auto_368484 ?auto_368485 ) )
  )

)

