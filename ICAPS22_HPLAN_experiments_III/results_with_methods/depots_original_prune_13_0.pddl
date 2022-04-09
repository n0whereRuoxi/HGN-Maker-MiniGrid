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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_844782 - SURFACE
      ?auto_844783 - SURFACE
    )
    :vars
    (
      ?auto_844784 - HOIST
      ?auto_844785 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_844784 ?auto_844785 ) ( SURFACE-AT ?auto_844782 ?auto_844785 ) ( CLEAR ?auto_844782 ) ( LIFTING ?auto_844784 ?auto_844783 ) ( IS-CRATE ?auto_844783 ) ( not ( = ?auto_844782 ?auto_844783 ) ) )
    :subtasks
    ( ( !DROP ?auto_844784 ?auto_844783 ?auto_844782 ?auto_844785 )
      ( MAKE-1CRATE-VERIFY ?auto_844782 ?auto_844783 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_844786 - SURFACE
      ?auto_844787 - SURFACE
    )
    :vars
    (
      ?auto_844789 - HOIST
      ?auto_844788 - PLACE
      ?auto_844790 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_844789 ?auto_844788 ) ( SURFACE-AT ?auto_844786 ?auto_844788 ) ( CLEAR ?auto_844786 ) ( IS-CRATE ?auto_844787 ) ( not ( = ?auto_844786 ?auto_844787 ) ) ( TRUCK-AT ?auto_844790 ?auto_844788 ) ( AVAILABLE ?auto_844789 ) ( IN ?auto_844787 ?auto_844790 ) )
    :subtasks
    ( ( !UNLOAD ?auto_844789 ?auto_844787 ?auto_844790 ?auto_844788 )
      ( MAKE-1CRATE ?auto_844786 ?auto_844787 )
      ( MAKE-1CRATE-VERIFY ?auto_844786 ?auto_844787 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_844791 - SURFACE
      ?auto_844792 - SURFACE
    )
    :vars
    (
      ?auto_844794 - HOIST
      ?auto_844793 - PLACE
      ?auto_844795 - TRUCK
      ?auto_844796 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_844794 ?auto_844793 ) ( SURFACE-AT ?auto_844791 ?auto_844793 ) ( CLEAR ?auto_844791 ) ( IS-CRATE ?auto_844792 ) ( not ( = ?auto_844791 ?auto_844792 ) ) ( AVAILABLE ?auto_844794 ) ( IN ?auto_844792 ?auto_844795 ) ( TRUCK-AT ?auto_844795 ?auto_844796 ) ( not ( = ?auto_844796 ?auto_844793 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_844795 ?auto_844796 ?auto_844793 )
      ( MAKE-1CRATE ?auto_844791 ?auto_844792 )
      ( MAKE-1CRATE-VERIFY ?auto_844791 ?auto_844792 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_844797 - SURFACE
      ?auto_844798 - SURFACE
    )
    :vars
    (
      ?auto_844800 - HOIST
      ?auto_844802 - PLACE
      ?auto_844801 - TRUCK
      ?auto_844799 - PLACE
      ?auto_844803 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_844800 ?auto_844802 ) ( SURFACE-AT ?auto_844797 ?auto_844802 ) ( CLEAR ?auto_844797 ) ( IS-CRATE ?auto_844798 ) ( not ( = ?auto_844797 ?auto_844798 ) ) ( AVAILABLE ?auto_844800 ) ( TRUCK-AT ?auto_844801 ?auto_844799 ) ( not ( = ?auto_844799 ?auto_844802 ) ) ( HOIST-AT ?auto_844803 ?auto_844799 ) ( LIFTING ?auto_844803 ?auto_844798 ) ( not ( = ?auto_844800 ?auto_844803 ) ) )
    :subtasks
    ( ( !LOAD ?auto_844803 ?auto_844798 ?auto_844801 ?auto_844799 )
      ( MAKE-1CRATE ?auto_844797 ?auto_844798 )
      ( MAKE-1CRATE-VERIFY ?auto_844797 ?auto_844798 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_844804 - SURFACE
      ?auto_844805 - SURFACE
    )
    :vars
    (
      ?auto_844809 - HOIST
      ?auto_844808 - PLACE
      ?auto_844806 - TRUCK
      ?auto_844810 - PLACE
      ?auto_844807 - HOIST
      ?auto_844811 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_844809 ?auto_844808 ) ( SURFACE-AT ?auto_844804 ?auto_844808 ) ( CLEAR ?auto_844804 ) ( IS-CRATE ?auto_844805 ) ( not ( = ?auto_844804 ?auto_844805 ) ) ( AVAILABLE ?auto_844809 ) ( TRUCK-AT ?auto_844806 ?auto_844810 ) ( not ( = ?auto_844810 ?auto_844808 ) ) ( HOIST-AT ?auto_844807 ?auto_844810 ) ( not ( = ?auto_844809 ?auto_844807 ) ) ( AVAILABLE ?auto_844807 ) ( SURFACE-AT ?auto_844805 ?auto_844810 ) ( ON ?auto_844805 ?auto_844811 ) ( CLEAR ?auto_844805 ) ( not ( = ?auto_844804 ?auto_844811 ) ) ( not ( = ?auto_844805 ?auto_844811 ) ) )
    :subtasks
    ( ( !LIFT ?auto_844807 ?auto_844805 ?auto_844811 ?auto_844810 )
      ( MAKE-1CRATE ?auto_844804 ?auto_844805 )
      ( MAKE-1CRATE-VERIFY ?auto_844804 ?auto_844805 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_844812 - SURFACE
      ?auto_844813 - SURFACE
    )
    :vars
    (
      ?auto_844815 - HOIST
      ?auto_844814 - PLACE
      ?auto_844818 - PLACE
      ?auto_844816 - HOIST
      ?auto_844817 - SURFACE
      ?auto_844819 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_844815 ?auto_844814 ) ( SURFACE-AT ?auto_844812 ?auto_844814 ) ( CLEAR ?auto_844812 ) ( IS-CRATE ?auto_844813 ) ( not ( = ?auto_844812 ?auto_844813 ) ) ( AVAILABLE ?auto_844815 ) ( not ( = ?auto_844818 ?auto_844814 ) ) ( HOIST-AT ?auto_844816 ?auto_844818 ) ( not ( = ?auto_844815 ?auto_844816 ) ) ( AVAILABLE ?auto_844816 ) ( SURFACE-AT ?auto_844813 ?auto_844818 ) ( ON ?auto_844813 ?auto_844817 ) ( CLEAR ?auto_844813 ) ( not ( = ?auto_844812 ?auto_844817 ) ) ( not ( = ?auto_844813 ?auto_844817 ) ) ( TRUCK-AT ?auto_844819 ?auto_844814 ) )
    :subtasks
    ( ( !DRIVE ?auto_844819 ?auto_844814 ?auto_844818 )
      ( MAKE-1CRATE ?auto_844812 ?auto_844813 )
      ( MAKE-1CRATE-VERIFY ?auto_844812 ?auto_844813 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_844829 - SURFACE
      ?auto_844830 - SURFACE
      ?auto_844831 - SURFACE
    )
    :vars
    (
      ?auto_844833 - HOIST
      ?auto_844832 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_844833 ?auto_844832 ) ( SURFACE-AT ?auto_844830 ?auto_844832 ) ( CLEAR ?auto_844830 ) ( LIFTING ?auto_844833 ?auto_844831 ) ( IS-CRATE ?auto_844831 ) ( not ( = ?auto_844830 ?auto_844831 ) ) ( ON ?auto_844830 ?auto_844829 ) ( not ( = ?auto_844829 ?auto_844830 ) ) ( not ( = ?auto_844829 ?auto_844831 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_844830 ?auto_844831 )
      ( MAKE-2CRATE-VERIFY ?auto_844829 ?auto_844830 ?auto_844831 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_844839 - SURFACE
      ?auto_844840 - SURFACE
      ?auto_844841 - SURFACE
    )
    :vars
    (
      ?auto_844844 - HOIST
      ?auto_844842 - PLACE
      ?auto_844843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_844844 ?auto_844842 ) ( SURFACE-AT ?auto_844840 ?auto_844842 ) ( CLEAR ?auto_844840 ) ( IS-CRATE ?auto_844841 ) ( not ( = ?auto_844840 ?auto_844841 ) ) ( TRUCK-AT ?auto_844843 ?auto_844842 ) ( AVAILABLE ?auto_844844 ) ( IN ?auto_844841 ?auto_844843 ) ( ON ?auto_844840 ?auto_844839 ) ( not ( = ?auto_844839 ?auto_844840 ) ) ( not ( = ?auto_844839 ?auto_844841 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_844840 ?auto_844841 )
      ( MAKE-2CRATE-VERIFY ?auto_844839 ?auto_844840 ?auto_844841 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_844845 - SURFACE
      ?auto_844846 - SURFACE
    )
    :vars
    (
      ?auto_844847 - HOIST
      ?auto_844849 - PLACE
      ?auto_844850 - TRUCK
      ?auto_844848 - SURFACE
      ?auto_844851 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_844847 ?auto_844849 ) ( SURFACE-AT ?auto_844845 ?auto_844849 ) ( CLEAR ?auto_844845 ) ( IS-CRATE ?auto_844846 ) ( not ( = ?auto_844845 ?auto_844846 ) ) ( AVAILABLE ?auto_844847 ) ( IN ?auto_844846 ?auto_844850 ) ( ON ?auto_844845 ?auto_844848 ) ( not ( = ?auto_844848 ?auto_844845 ) ) ( not ( = ?auto_844848 ?auto_844846 ) ) ( TRUCK-AT ?auto_844850 ?auto_844851 ) ( not ( = ?auto_844851 ?auto_844849 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_844850 ?auto_844851 ?auto_844849 )
      ( MAKE-2CRATE ?auto_844848 ?auto_844845 ?auto_844846 )
      ( MAKE-1CRATE-VERIFY ?auto_844845 ?auto_844846 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_844852 - SURFACE
      ?auto_844853 - SURFACE
      ?auto_844854 - SURFACE
    )
    :vars
    (
      ?auto_844858 - HOIST
      ?auto_844855 - PLACE
      ?auto_844857 - TRUCK
      ?auto_844856 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_844858 ?auto_844855 ) ( SURFACE-AT ?auto_844853 ?auto_844855 ) ( CLEAR ?auto_844853 ) ( IS-CRATE ?auto_844854 ) ( not ( = ?auto_844853 ?auto_844854 ) ) ( AVAILABLE ?auto_844858 ) ( IN ?auto_844854 ?auto_844857 ) ( ON ?auto_844853 ?auto_844852 ) ( not ( = ?auto_844852 ?auto_844853 ) ) ( not ( = ?auto_844852 ?auto_844854 ) ) ( TRUCK-AT ?auto_844857 ?auto_844856 ) ( not ( = ?auto_844856 ?auto_844855 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_844853 ?auto_844854 )
      ( MAKE-2CRATE-VERIFY ?auto_844852 ?auto_844853 ?auto_844854 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_844859 - SURFACE
      ?auto_844860 - SURFACE
    )
    :vars
    (
      ?auto_844862 - HOIST
      ?auto_844865 - PLACE
      ?auto_844864 - SURFACE
      ?auto_844863 - TRUCK
      ?auto_844861 - PLACE
      ?auto_844866 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_844862 ?auto_844865 ) ( SURFACE-AT ?auto_844859 ?auto_844865 ) ( CLEAR ?auto_844859 ) ( IS-CRATE ?auto_844860 ) ( not ( = ?auto_844859 ?auto_844860 ) ) ( AVAILABLE ?auto_844862 ) ( ON ?auto_844859 ?auto_844864 ) ( not ( = ?auto_844864 ?auto_844859 ) ) ( not ( = ?auto_844864 ?auto_844860 ) ) ( TRUCK-AT ?auto_844863 ?auto_844861 ) ( not ( = ?auto_844861 ?auto_844865 ) ) ( HOIST-AT ?auto_844866 ?auto_844861 ) ( LIFTING ?auto_844866 ?auto_844860 ) ( not ( = ?auto_844862 ?auto_844866 ) ) )
    :subtasks
    ( ( !LOAD ?auto_844866 ?auto_844860 ?auto_844863 ?auto_844861 )
      ( MAKE-2CRATE ?auto_844864 ?auto_844859 ?auto_844860 )
      ( MAKE-1CRATE-VERIFY ?auto_844859 ?auto_844860 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_844867 - SURFACE
      ?auto_844868 - SURFACE
      ?auto_844869 - SURFACE
    )
    :vars
    (
      ?auto_844870 - HOIST
      ?auto_844874 - PLACE
      ?auto_844873 - TRUCK
      ?auto_844871 - PLACE
      ?auto_844872 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_844870 ?auto_844874 ) ( SURFACE-AT ?auto_844868 ?auto_844874 ) ( CLEAR ?auto_844868 ) ( IS-CRATE ?auto_844869 ) ( not ( = ?auto_844868 ?auto_844869 ) ) ( AVAILABLE ?auto_844870 ) ( ON ?auto_844868 ?auto_844867 ) ( not ( = ?auto_844867 ?auto_844868 ) ) ( not ( = ?auto_844867 ?auto_844869 ) ) ( TRUCK-AT ?auto_844873 ?auto_844871 ) ( not ( = ?auto_844871 ?auto_844874 ) ) ( HOIST-AT ?auto_844872 ?auto_844871 ) ( LIFTING ?auto_844872 ?auto_844869 ) ( not ( = ?auto_844870 ?auto_844872 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_844868 ?auto_844869 )
      ( MAKE-2CRATE-VERIFY ?auto_844867 ?auto_844868 ?auto_844869 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_844875 - SURFACE
      ?auto_844876 - SURFACE
    )
    :vars
    (
      ?auto_844879 - HOIST
      ?auto_844881 - PLACE
      ?auto_844878 - SURFACE
      ?auto_844880 - TRUCK
      ?auto_844877 - PLACE
      ?auto_844882 - HOIST
      ?auto_844883 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_844879 ?auto_844881 ) ( SURFACE-AT ?auto_844875 ?auto_844881 ) ( CLEAR ?auto_844875 ) ( IS-CRATE ?auto_844876 ) ( not ( = ?auto_844875 ?auto_844876 ) ) ( AVAILABLE ?auto_844879 ) ( ON ?auto_844875 ?auto_844878 ) ( not ( = ?auto_844878 ?auto_844875 ) ) ( not ( = ?auto_844878 ?auto_844876 ) ) ( TRUCK-AT ?auto_844880 ?auto_844877 ) ( not ( = ?auto_844877 ?auto_844881 ) ) ( HOIST-AT ?auto_844882 ?auto_844877 ) ( not ( = ?auto_844879 ?auto_844882 ) ) ( AVAILABLE ?auto_844882 ) ( SURFACE-AT ?auto_844876 ?auto_844877 ) ( ON ?auto_844876 ?auto_844883 ) ( CLEAR ?auto_844876 ) ( not ( = ?auto_844875 ?auto_844883 ) ) ( not ( = ?auto_844876 ?auto_844883 ) ) ( not ( = ?auto_844878 ?auto_844883 ) ) )
    :subtasks
    ( ( !LIFT ?auto_844882 ?auto_844876 ?auto_844883 ?auto_844877 )
      ( MAKE-2CRATE ?auto_844878 ?auto_844875 ?auto_844876 )
      ( MAKE-1CRATE-VERIFY ?auto_844875 ?auto_844876 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_844884 - SURFACE
      ?auto_844885 - SURFACE
      ?auto_844886 - SURFACE
    )
    :vars
    (
      ?auto_844887 - HOIST
      ?auto_844891 - PLACE
      ?auto_844890 - TRUCK
      ?auto_844892 - PLACE
      ?auto_844888 - HOIST
      ?auto_844889 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_844887 ?auto_844891 ) ( SURFACE-AT ?auto_844885 ?auto_844891 ) ( CLEAR ?auto_844885 ) ( IS-CRATE ?auto_844886 ) ( not ( = ?auto_844885 ?auto_844886 ) ) ( AVAILABLE ?auto_844887 ) ( ON ?auto_844885 ?auto_844884 ) ( not ( = ?auto_844884 ?auto_844885 ) ) ( not ( = ?auto_844884 ?auto_844886 ) ) ( TRUCK-AT ?auto_844890 ?auto_844892 ) ( not ( = ?auto_844892 ?auto_844891 ) ) ( HOIST-AT ?auto_844888 ?auto_844892 ) ( not ( = ?auto_844887 ?auto_844888 ) ) ( AVAILABLE ?auto_844888 ) ( SURFACE-AT ?auto_844886 ?auto_844892 ) ( ON ?auto_844886 ?auto_844889 ) ( CLEAR ?auto_844886 ) ( not ( = ?auto_844885 ?auto_844889 ) ) ( not ( = ?auto_844886 ?auto_844889 ) ) ( not ( = ?auto_844884 ?auto_844889 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_844885 ?auto_844886 )
      ( MAKE-2CRATE-VERIFY ?auto_844884 ?auto_844885 ?auto_844886 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_844893 - SURFACE
      ?auto_844894 - SURFACE
    )
    :vars
    (
      ?auto_844899 - HOIST
      ?auto_844897 - PLACE
      ?auto_844895 - SURFACE
      ?auto_844896 - PLACE
      ?auto_844901 - HOIST
      ?auto_844900 - SURFACE
      ?auto_844898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_844899 ?auto_844897 ) ( SURFACE-AT ?auto_844893 ?auto_844897 ) ( CLEAR ?auto_844893 ) ( IS-CRATE ?auto_844894 ) ( not ( = ?auto_844893 ?auto_844894 ) ) ( AVAILABLE ?auto_844899 ) ( ON ?auto_844893 ?auto_844895 ) ( not ( = ?auto_844895 ?auto_844893 ) ) ( not ( = ?auto_844895 ?auto_844894 ) ) ( not ( = ?auto_844896 ?auto_844897 ) ) ( HOIST-AT ?auto_844901 ?auto_844896 ) ( not ( = ?auto_844899 ?auto_844901 ) ) ( AVAILABLE ?auto_844901 ) ( SURFACE-AT ?auto_844894 ?auto_844896 ) ( ON ?auto_844894 ?auto_844900 ) ( CLEAR ?auto_844894 ) ( not ( = ?auto_844893 ?auto_844900 ) ) ( not ( = ?auto_844894 ?auto_844900 ) ) ( not ( = ?auto_844895 ?auto_844900 ) ) ( TRUCK-AT ?auto_844898 ?auto_844897 ) )
    :subtasks
    ( ( !DRIVE ?auto_844898 ?auto_844897 ?auto_844896 )
      ( MAKE-2CRATE ?auto_844895 ?auto_844893 ?auto_844894 )
      ( MAKE-1CRATE-VERIFY ?auto_844893 ?auto_844894 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_844902 - SURFACE
      ?auto_844903 - SURFACE
      ?auto_844904 - SURFACE
    )
    :vars
    (
      ?auto_844908 - HOIST
      ?auto_844906 - PLACE
      ?auto_844910 - PLACE
      ?auto_844907 - HOIST
      ?auto_844909 - SURFACE
      ?auto_844905 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_844908 ?auto_844906 ) ( SURFACE-AT ?auto_844903 ?auto_844906 ) ( CLEAR ?auto_844903 ) ( IS-CRATE ?auto_844904 ) ( not ( = ?auto_844903 ?auto_844904 ) ) ( AVAILABLE ?auto_844908 ) ( ON ?auto_844903 ?auto_844902 ) ( not ( = ?auto_844902 ?auto_844903 ) ) ( not ( = ?auto_844902 ?auto_844904 ) ) ( not ( = ?auto_844910 ?auto_844906 ) ) ( HOIST-AT ?auto_844907 ?auto_844910 ) ( not ( = ?auto_844908 ?auto_844907 ) ) ( AVAILABLE ?auto_844907 ) ( SURFACE-AT ?auto_844904 ?auto_844910 ) ( ON ?auto_844904 ?auto_844909 ) ( CLEAR ?auto_844904 ) ( not ( = ?auto_844903 ?auto_844909 ) ) ( not ( = ?auto_844904 ?auto_844909 ) ) ( not ( = ?auto_844902 ?auto_844909 ) ) ( TRUCK-AT ?auto_844905 ?auto_844906 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_844903 ?auto_844904 )
      ( MAKE-2CRATE-VERIFY ?auto_844902 ?auto_844903 ?auto_844904 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_844911 - SURFACE
      ?auto_844912 - SURFACE
    )
    :vars
    (
      ?auto_844919 - HOIST
      ?auto_844918 - PLACE
      ?auto_844914 - SURFACE
      ?auto_844916 - PLACE
      ?auto_844913 - HOIST
      ?auto_844917 - SURFACE
      ?auto_844915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_844919 ?auto_844918 ) ( IS-CRATE ?auto_844912 ) ( not ( = ?auto_844911 ?auto_844912 ) ) ( not ( = ?auto_844914 ?auto_844911 ) ) ( not ( = ?auto_844914 ?auto_844912 ) ) ( not ( = ?auto_844916 ?auto_844918 ) ) ( HOIST-AT ?auto_844913 ?auto_844916 ) ( not ( = ?auto_844919 ?auto_844913 ) ) ( AVAILABLE ?auto_844913 ) ( SURFACE-AT ?auto_844912 ?auto_844916 ) ( ON ?auto_844912 ?auto_844917 ) ( CLEAR ?auto_844912 ) ( not ( = ?auto_844911 ?auto_844917 ) ) ( not ( = ?auto_844912 ?auto_844917 ) ) ( not ( = ?auto_844914 ?auto_844917 ) ) ( TRUCK-AT ?auto_844915 ?auto_844918 ) ( SURFACE-AT ?auto_844914 ?auto_844918 ) ( CLEAR ?auto_844914 ) ( LIFTING ?auto_844919 ?auto_844911 ) ( IS-CRATE ?auto_844911 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_844914 ?auto_844911 )
      ( MAKE-2CRATE ?auto_844914 ?auto_844911 ?auto_844912 )
      ( MAKE-1CRATE-VERIFY ?auto_844911 ?auto_844912 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_844920 - SURFACE
      ?auto_844921 - SURFACE
      ?auto_844922 - SURFACE
    )
    :vars
    (
      ?auto_844926 - HOIST
      ?auto_844924 - PLACE
      ?auto_844927 - PLACE
      ?auto_844928 - HOIST
      ?auto_844925 - SURFACE
      ?auto_844923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_844926 ?auto_844924 ) ( IS-CRATE ?auto_844922 ) ( not ( = ?auto_844921 ?auto_844922 ) ) ( not ( = ?auto_844920 ?auto_844921 ) ) ( not ( = ?auto_844920 ?auto_844922 ) ) ( not ( = ?auto_844927 ?auto_844924 ) ) ( HOIST-AT ?auto_844928 ?auto_844927 ) ( not ( = ?auto_844926 ?auto_844928 ) ) ( AVAILABLE ?auto_844928 ) ( SURFACE-AT ?auto_844922 ?auto_844927 ) ( ON ?auto_844922 ?auto_844925 ) ( CLEAR ?auto_844922 ) ( not ( = ?auto_844921 ?auto_844925 ) ) ( not ( = ?auto_844922 ?auto_844925 ) ) ( not ( = ?auto_844920 ?auto_844925 ) ) ( TRUCK-AT ?auto_844923 ?auto_844924 ) ( SURFACE-AT ?auto_844920 ?auto_844924 ) ( CLEAR ?auto_844920 ) ( LIFTING ?auto_844926 ?auto_844921 ) ( IS-CRATE ?auto_844921 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_844921 ?auto_844922 )
      ( MAKE-2CRATE-VERIFY ?auto_844920 ?auto_844921 ?auto_844922 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_844929 - SURFACE
      ?auto_844930 - SURFACE
    )
    :vars
    (
      ?auto_844937 - HOIST
      ?auto_844935 - PLACE
      ?auto_844932 - SURFACE
      ?auto_844936 - PLACE
      ?auto_844931 - HOIST
      ?auto_844933 - SURFACE
      ?auto_844934 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_844937 ?auto_844935 ) ( IS-CRATE ?auto_844930 ) ( not ( = ?auto_844929 ?auto_844930 ) ) ( not ( = ?auto_844932 ?auto_844929 ) ) ( not ( = ?auto_844932 ?auto_844930 ) ) ( not ( = ?auto_844936 ?auto_844935 ) ) ( HOIST-AT ?auto_844931 ?auto_844936 ) ( not ( = ?auto_844937 ?auto_844931 ) ) ( AVAILABLE ?auto_844931 ) ( SURFACE-AT ?auto_844930 ?auto_844936 ) ( ON ?auto_844930 ?auto_844933 ) ( CLEAR ?auto_844930 ) ( not ( = ?auto_844929 ?auto_844933 ) ) ( not ( = ?auto_844930 ?auto_844933 ) ) ( not ( = ?auto_844932 ?auto_844933 ) ) ( TRUCK-AT ?auto_844934 ?auto_844935 ) ( SURFACE-AT ?auto_844932 ?auto_844935 ) ( CLEAR ?auto_844932 ) ( IS-CRATE ?auto_844929 ) ( AVAILABLE ?auto_844937 ) ( IN ?auto_844929 ?auto_844934 ) )
    :subtasks
    ( ( !UNLOAD ?auto_844937 ?auto_844929 ?auto_844934 ?auto_844935 )
      ( MAKE-2CRATE ?auto_844932 ?auto_844929 ?auto_844930 )
      ( MAKE-1CRATE-VERIFY ?auto_844929 ?auto_844930 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_844938 - SURFACE
      ?auto_844939 - SURFACE
      ?auto_844940 - SURFACE
    )
    :vars
    (
      ?auto_844946 - HOIST
      ?auto_844941 - PLACE
      ?auto_844942 - PLACE
      ?auto_844944 - HOIST
      ?auto_844945 - SURFACE
      ?auto_844943 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_844946 ?auto_844941 ) ( IS-CRATE ?auto_844940 ) ( not ( = ?auto_844939 ?auto_844940 ) ) ( not ( = ?auto_844938 ?auto_844939 ) ) ( not ( = ?auto_844938 ?auto_844940 ) ) ( not ( = ?auto_844942 ?auto_844941 ) ) ( HOIST-AT ?auto_844944 ?auto_844942 ) ( not ( = ?auto_844946 ?auto_844944 ) ) ( AVAILABLE ?auto_844944 ) ( SURFACE-AT ?auto_844940 ?auto_844942 ) ( ON ?auto_844940 ?auto_844945 ) ( CLEAR ?auto_844940 ) ( not ( = ?auto_844939 ?auto_844945 ) ) ( not ( = ?auto_844940 ?auto_844945 ) ) ( not ( = ?auto_844938 ?auto_844945 ) ) ( TRUCK-AT ?auto_844943 ?auto_844941 ) ( SURFACE-AT ?auto_844938 ?auto_844941 ) ( CLEAR ?auto_844938 ) ( IS-CRATE ?auto_844939 ) ( AVAILABLE ?auto_844946 ) ( IN ?auto_844939 ?auto_844943 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_844939 ?auto_844940 )
      ( MAKE-2CRATE-VERIFY ?auto_844938 ?auto_844939 ?auto_844940 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_844983 - SURFACE
      ?auto_844984 - SURFACE
    )
    :vars
    (
      ?auto_844985 - HOIST
      ?auto_844991 - PLACE
      ?auto_844989 - SURFACE
      ?auto_844990 - PLACE
      ?auto_844986 - HOIST
      ?auto_844987 - SURFACE
      ?auto_844988 - TRUCK
      ?auto_844992 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_844985 ?auto_844991 ) ( SURFACE-AT ?auto_844983 ?auto_844991 ) ( CLEAR ?auto_844983 ) ( IS-CRATE ?auto_844984 ) ( not ( = ?auto_844983 ?auto_844984 ) ) ( AVAILABLE ?auto_844985 ) ( ON ?auto_844983 ?auto_844989 ) ( not ( = ?auto_844989 ?auto_844983 ) ) ( not ( = ?auto_844989 ?auto_844984 ) ) ( not ( = ?auto_844990 ?auto_844991 ) ) ( HOIST-AT ?auto_844986 ?auto_844990 ) ( not ( = ?auto_844985 ?auto_844986 ) ) ( AVAILABLE ?auto_844986 ) ( SURFACE-AT ?auto_844984 ?auto_844990 ) ( ON ?auto_844984 ?auto_844987 ) ( CLEAR ?auto_844984 ) ( not ( = ?auto_844983 ?auto_844987 ) ) ( not ( = ?auto_844984 ?auto_844987 ) ) ( not ( = ?auto_844989 ?auto_844987 ) ) ( TRUCK-AT ?auto_844988 ?auto_844992 ) ( not ( = ?auto_844992 ?auto_844991 ) ) ( not ( = ?auto_844990 ?auto_844992 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_844988 ?auto_844992 ?auto_844991 )
      ( MAKE-1CRATE ?auto_844983 ?auto_844984 )
      ( MAKE-1CRATE-VERIFY ?auto_844983 ?auto_844984 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_845022 - SURFACE
      ?auto_845023 - SURFACE
      ?auto_845024 - SURFACE
      ?auto_845025 - SURFACE
    )
    :vars
    (
      ?auto_845026 - HOIST
      ?auto_845027 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845026 ?auto_845027 ) ( SURFACE-AT ?auto_845024 ?auto_845027 ) ( CLEAR ?auto_845024 ) ( LIFTING ?auto_845026 ?auto_845025 ) ( IS-CRATE ?auto_845025 ) ( not ( = ?auto_845024 ?auto_845025 ) ) ( ON ?auto_845023 ?auto_845022 ) ( ON ?auto_845024 ?auto_845023 ) ( not ( = ?auto_845022 ?auto_845023 ) ) ( not ( = ?auto_845022 ?auto_845024 ) ) ( not ( = ?auto_845022 ?auto_845025 ) ) ( not ( = ?auto_845023 ?auto_845024 ) ) ( not ( = ?auto_845023 ?auto_845025 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845024 ?auto_845025 )
      ( MAKE-3CRATE-VERIFY ?auto_845022 ?auto_845023 ?auto_845024 ?auto_845025 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_845039 - SURFACE
      ?auto_845040 - SURFACE
      ?auto_845041 - SURFACE
      ?auto_845042 - SURFACE
    )
    :vars
    (
      ?auto_845045 - HOIST
      ?auto_845044 - PLACE
      ?auto_845043 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845045 ?auto_845044 ) ( SURFACE-AT ?auto_845041 ?auto_845044 ) ( CLEAR ?auto_845041 ) ( IS-CRATE ?auto_845042 ) ( not ( = ?auto_845041 ?auto_845042 ) ) ( TRUCK-AT ?auto_845043 ?auto_845044 ) ( AVAILABLE ?auto_845045 ) ( IN ?auto_845042 ?auto_845043 ) ( ON ?auto_845041 ?auto_845040 ) ( not ( = ?auto_845040 ?auto_845041 ) ) ( not ( = ?auto_845040 ?auto_845042 ) ) ( ON ?auto_845040 ?auto_845039 ) ( not ( = ?auto_845039 ?auto_845040 ) ) ( not ( = ?auto_845039 ?auto_845041 ) ) ( not ( = ?auto_845039 ?auto_845042 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845040 ?auto_845041 ?auto_845042 )
      ( MAKE-3CRATE-VERIFY ?auto_845039 ?auto_845040 ?auto_845041 ?auto_845042 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_845060 - SURFACE
      ?auto_845061 - SURFACE
      ?auto_845062 - SURFACE
      ?auto_845063 - SURFACE
    )
    :vars
    (
      ?auto_845065 - HOIST
      ?auto_845064 - PLACE
      ?auto_845066 - TRUCK
      ?auto_845067 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845065 ?auto_845064 ) ( SURFACE-AT ?auto_845062 ?auto_845064 ) ( CLEAR ?auto_845062 ) ( IS-CRATE ?auto_845063 ) ( not ( = ?auto_845062 ?auto_845063 ) ) ( AVAILABLE ?auto_845065 ) ( IN ?auto_845063 ?auto_845066 ) ( ON ?auto_845062 ?auto_845061 ) ( not ( = ?auto_845061 ?auto_845062 ) ) ( not ( = ?auto_845061 ?auto_845063 ) ) ( TRUCK-AT ?auto_845066 ?auto_845067 ) ( not ( = ?auto_845067 ?auto_845064 ) ) ( ON ?auto_845061 ?auto_845060 ) ( not ( = ?auto_845060 ?auto_845061 ) ) ( not ( = ?auto_845060 ?auto_845062 ) ) ( not ( = ?auto_845060 ?auto_845063 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845061 ?auto_845062 ?auto_845063 )
      ( MAKE-3CRATE-VERIFY ?auto_845060 ?auto_845061 ?auto_845062 ?auto_845063 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_845084 - SURFACE
      ?auto_845085 - SURFACE
      ?auto_845086 - SURFACE
      ?auto_845087 - SURFACE
    )
    :vars
    (
      ?auto_845088 - HOIST
      ?auto_845092 - PLACE
      ?auto_845091 - TRUCK
      ?auto_845090 - PLACE
      ?auto_845089 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_845088 ?auto_845092 ) ( SURFACE-AT ?auto_845086 ?auto_845092 ) ( CLEAR ?auto_845086 ) ( IS-CRATE ?auto_845087 ) ( not ( = ?auto_845086 ?auto_845087 ) ) ( AVAILABLE ?auto_845088 ) ( ON ?auto_845086 ?auto_845085 ) ( not ( = ?auto_845085 ?auto_845086 ) ) ( not ( = ?auto_845085 ?auto_845087 ) ) ( TRUCK-AT ?auto_845091 ?auto_845090 ) ( not ( = ?auto_845090 ?auto_845092 ) ) ( HOIST-AT ?auto_845089 ?auto_845090 ) ( LIFTING ?auto_845089 ?auto_845087 ) ( not ( = ?auto_845088 ?auto_845089 ) ) ( ON ?auto_845085 ?auto_845084 ) ( not ( = ?auto_845084 ?auto_845085 ) ) ( not ( = ?auto_845084 ?auto_845086 ) ) ( not ( = ?auto_845084 ?auto_845087 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845085 ?auto_845086 ?auto_845087 )
      ( MAKE-3CRATE-VERIFY ?auto_845084 ?auto_845085 ?auto_845086 ?auto_845087 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_845111 - SURFACE
      ?auto_845112 - SURFACE
      ?auto_845113 - SURFACE
      ?auto_845114 - SURFACE
    )
    :vars
    (
      ?auto_845120 - HOIST
      ?auto_845115 - PLACE
      ?auto_845118 - TRUCK
      ?auto_845119 - PLACE
      ?auto_845116 - HOIST
      ?auto_845117 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845120 ?auto_845115 ) ( SURFACE-AT ?auto_845113 ?auto_845115 ) ( CLEAR ?auto_845113 ) ( IS-CRATE ?auto_845114 ) ( not ( = ?auto_845113 ?auto_845114 ) ) ( AVAILABLE ?auto_845120 ) ( ON ?auto_845113 ?auto_845112 ) ( not ( = ?auto_845112 ?auto_845113 ) ) ( not ( = ?auto_845112 ?auto_845114 ) ) ( TRUCK-AT ?auto_845118 ?auto_845119 ) ( not ( = ?auto_845119 ?auto_845115 ) ) ( HOIST-AT ?auto_845116 ?auto_845119 ) ( not ( = ?auto_845120 ?auto_845116 ) ) ( AVAILABLE ?auto_845116 ) ( SURFACE-AT ?auto_845114 ?auto_845119 ) ( ON ?auto_845114 ?auto_845117 ) ( CLEAR ?auto_845114 ) ( not ( = ?auto_845113 ?auto_845117 ) ) ( not ( = ?auto_845114 ?auto_845117 ) ) ( not ( = ?auto_845112 ?auto_845117 ) ) ( ON ?auto_845112 ?auto_845111 ) ( not ( = ?auto_845111 ?auto_845112 ) ) ( not ( = ?auto_845111 ?auto_845113 ) ) ( not ( = ?auto_845111 ?auto_845114 ) ) ( not ( = ?auto_845111 ?auto_845117 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845112 ?auto_845113 ?auto_845114 )
      ( MAKE-3CRATE-VERIFY ?auto_845111 ?auto_845112 ?auto_845113 ?auto_845114 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_845139 - SURFACE
      ?auto_845140 - SURFACE
      ?auto_845141 - SURFACE
      ?auto_845142 - SURFACE
    )
    :vars
    (
      ?auto_845148 - HOIST
      ?auto_845145 - PLACE
      ?auto_845147 - PLACE
      ?auto_845143 - HOIST
      ?auto_845146 - SURFACE
      ?auto_845144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845148 ?auto_845145 ) ( SURFACE-AT ?auto_845141 ?auto_845145 ) ( CLEAR ?auto_845141 ) ( IS-CRATE ?auto_845142 ) ( not ( = ?auto_845141 ?auto_845142 ) ) ( AVAILABLE ?auto_845148 ) ( ON ?auto_845141 ?auto_845140 ) ( not ( = ?auto_845140 ?auto_845141 ) ) ( not ( = ?auto_845140 ?auto_845142 ) ) ( not ( = ?auto_845147 ?auto_845145 ) ) ( HOIST-AT ?auto_845143 ?auto_845147 ) ( not ( = ?auto_845148 ?auto_845143 ) ) ( AVAILABLE ?auto_845143 ) ( SURFACE-AT ?auto_845142 ?auto_845147 ) ( ON ?auto_845142 ?auto_845146 ) ( CLEAR ?auto_845142 ) ( not ( = ?auto_845141 ?auto_845146 ) ) ( not ( = ?auto_845142 ?auto_845146 ) ) ( not ( = ?auto_845140 ?auto_845146 ) ) ( TRUCK-AT ?auto_845144 ?auto_845145 ) ( ON ?auto_845140 ?auto_845139 ) ( not ( = ?auto_845139 ?auto_845140 ) ) ( not ( = ?auto_845139 ?auto_845141 ) ) ( not ( = ?auto_845139 ?auto_845142 ) ) ( not ( = ?auto_845139 ?auto_845146 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845140 ?auto_845141 ?auto_845142 )
      ( MAKE-3CRATE-VERIFY ?auto_845139 ?auto_845140 ?auto_845141 ?auto_845142 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_845167 - SURFACE
      ?auto_845168 - SURFACE
      ?auto_845169 - SURFACE
      ?auto_845170 - SURFACE
    )
    :vars
    (
      ?auto_845174 - HOIST
      ?auto_845172 - PLACE
      ?auto_845173 - PLACE
      ?auto_845176 - HOIST
      ?auto_845171 - SURFACE
      ?auto_845175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845174 ?auto_845172 ) ( IS-CRATE ?auto_845170 ) ( not ( = ?auto_845169 ?auto_845170 ) ) ( not ( = ?auto_845168 ?auto_845169 ) ) ( not ( = ?auto_845168 ?auto_845170 ) ) ( not ( = ?auto_845173 ?auto_845172 ) ) ( HOIST-AT ?auto_845176 ?auto_845173 ) ( not ( = ?auto_845174 ?auto_845176 ) ) ( AVAILABLE ?auto_845176 ) ( SURFACE-AT ?auto_845170 ?auto_845173 ) ( ON ?auto_845170 ?auto_845171 ) ( CLEAR ?auto_845170 ) ( not ( = ?auto_845169 ?auto_845171 ) ) ( not ( = ?auto_845170 ?auto_845171 ) ) ( not ( = ?auto_845168 ?auto_845171 ) ) ( TRUCK-AT ?auto_845175 ?auto_845172 ) ( SURFACE-AT ?auto_845168 ?auto_845172 ) ( CLEAR ?auto_845168 ) ( LIFTING ?auto_845174 ?auto_845169 ) ( IS-CRATE ?auto_845169 ) ( ON ?auto_845168 ?auto_845167 ) ( not ( = ?auto_845167 ?auto_845168 ) ) ( not ( = ?auto_845167 ?auto_845169 ) ) ( not ( = ?auto_845167 ?auto_845170 ) ) ( not ( = ?auto_845167 ?auto_845171 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845168 ?auto_845169 ?auto_845170 )
      ( MAKE-3CRATE-VERIFY ?auto_845167 ?auto_845168 ?auto_845169 ?auto_845170 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_845195 - SURFACE
      ?auto_845196 - SURFACE
      ?auto_845197 - SURFACE
      ?auto_845198 - SURFACE
    )
    :vars
    (
      ?auto_845204 - HOIST
      ?auto_845201 - PLACE
      ?auto_845200 - PLACE
      ?auto_845199 - HOIST
      ?auto_845203 - SURFACE
      ?auto_845202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845204 ?auto_845201 ) ( IS-CRATE ?auto_845198 ) ( not ( = ?auto_845197 ?auto_845198 ) ) ( not ( = ?auto_845196 ?auto_845197 ) ) ( not ( = ?auto_845196 ?auto_845198 ) ) ( not ( = ?auto_845200 ?auto_845201 ) ) ( HOIST-AT ?auto_845199 ?auto_845200 ) ( not ( = ?auto_845204 ?auto_845199 ) ) ( AVAILABLE ?auto_845199 ) ( SURFACE-AT ?auto_845198 ?auto_845200 ) ( ON ?auto_845198 ?auto_845203 ) ( CLEAR ?auto_845198 ) ( not ( = ?auto_845197 ?auto_845203 ) ) ( not ( = ?auto_845198 ?auto_845203 ) ) ( not ( = ?auto_845196 ?auto_845203 ) ) ( TRUCK-AT ?auto_845202 ?auto_845201 ) ( SURFACE-AT ?auto_845196 ?auto_845201 ) ( CLEAR ?auto_845196 ) ( IS-CRATE ?auto_845197 ) ( AVAILABLE ?auto_845204 ) ( IN ?auto_845197 ?auto_845202 ) ( ON ?auto_845196 ?auto_845195 ) ( not ( = ?auto_845195 ?auto_845196 ) ) ( not ( = ?auto_845195 ?auto_845197 ) ) ( not ( = ?auto_845195 ?auto_845198 ) ) ( not ( = ?auto_845195 ?auto_845203 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845196 ?auto_845197 ?auto_845198 )
      ( MAKE-3CRATE-VERIFY ?auto_845195 ?auto_845196 ?auto_845197 ?auto_845198 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_845486 - SURFACE
      ?auto_845487 - SURFACE
      ?auto_845488 - SURFACE
      ?auto_845490 - SURFACE
      ?auto_845489 - SURFACE
    )
    :vars
    (
      ?auto_845491 - HOIST
      ?auto_845492 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845491 ?auto_845492 ) ( SURFACE-AT ?auto_845490 ?auto_845492 ) ( CLEAR ?auto_845490 ) ( LIFTING ?auto_845491 ?auto_845489 ) ( IS-CRATE ?auto_845489 ) ( not ( = ?auto_845490 ?auto_845489 ) ) ( ON ?auto_845487 ?auto_845486 ) ( ON ?auto_845488 ?auto_845487 ) ( ON ?auto_845490 ?auto_845488 ) ( not ( = ?auto_845486 ?auto_845487 ) ) ( not ( = ?auto_845486 ?auto_845488 ) ) ( not ( = ?auto_845486 ?auto_845490 ) ) ( not ( = ?auto_845486 ?auto_845489 ) ) ( not ( = ?auto_845487 ?auto_845488 ) ) ( not ( = ?auto_845487 ?auto_845490 ) ) ( not ( = ?auto_845487 ?auto_845489 ) ) ( not ( = ?auto_845488 ?auto_845490 ) ) ( not ( = ?auto_845488 ?auto_845489 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845490 ?auto_845489 )
      ( MAKE-4CRATE-VERIFY ?auto_845486 ?auto_845487 ?auto_845488 ?auto_845490 ?auto_845489 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_845511 - SURFACE
      ?auto_845512 - SURFACE
      ?auto_845513 - SURFACE
      ?auto_845515 - SURFACE
      ?auto_845514 - SURFACE
    )
    :vars
    (
      ?auto_845516 - HOIST
      ?auto_845518 - PLACE
      ?auto_845517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845516 ?auto_845518 ) ( SURFACE-AT ?auto_845515 ?auto_845518 ) ( CLEAR ?auto_845515 ) ( IS-CRATE ?auto_845514 ) ( not ( = ?auto_845515 ?auto_845514 ) ) ( TRUCK-AT ?auto_845517 ?auto_845518 ) ( AVAILABLE ?auto_845516 ) ( IN ?auto_845514 ?auto_845517 ) ( ON ?auto_845515 ?auto_845513 ) ( not ( = ?auto_845513 ?auto_845515 ) ) ( not ( = ?auto_845513 ?auto_845514 ) ) ( ON ?auto_845512 ?auto_845511 ) ( ON ?auto_845513 ?auto_845512 ) ( not ( = ?auto_845511 ?auto_845512 ) ) ( not ( = ?auto_845511 ?auto_845513 ) ) ( not ( = ?auto_845511 ?auto_845515 ) ) ( not ( = ?auto_845511 ?auto_845514 ) ) ( not ( = ?auto_845512 ?auto_845513 ) ) ( not ( = ?auto_845512 ?auto_845515 ) ) ( not ( = ?auto_845512 ?auto_845514 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845513 ?auto_845515 ?auto_845514 )
      ( MAKE-4CRATE-VERIFY ?auto_845511 ?auto_845512 ?auto_845513 ?auto_845515 ?auto_845514 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_845541 - SURFACE
      ?auto_845542 - SURFACE
      ?auto_845543 - SURFACE
      ?auto_845545 - SURFACE
      ?auto_845544 - SURFACE
    )
    :vars
    (
      ?auto_845549 - HOIST
      ?auto_845547 - PLACE
      ?auto_845546 - TRUCK
      ?auto_845548 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845549 ?auto_845547 ) ( SURFACE-AT ?auto_845545 ?auto_845547 ) ( CLEAR ?auto_845545 ) ( IS-CRATE ?auto_845544 ) ( not ( = ?auto_845545 ?auto_845544 ) ) ( AVAILABLE ?auto_845549 ) ( IN ?auto_845544 ?auto_845546 ) ( ON ?auto_845545 ?auto_845543 ) ( not ( = ?auto_845543 ?auto_845545 ) ) ( not ( = ?auto_845543 ?auto_845544 ) ) ( TRUCK-AT ?auto_845546 ?auto_845548 ) ( not ( = ?auto_845548 ?auto_845547 ) ) ( ON ?auto_845542 ?auto_845541 ) ( ON ?auto_845543 ?auto_845542 ) ( not ( = ?auto_845541 ?auto_845542 ) ) ( not ( = ?auto_845541 ?auto_845543 ) ) ( not ( = ?auto_845541 ?auto_845545 ) ) ( not ( = ?auto_845541 ?auto_845544 ) ) ( not ( = ?auto_845542 ?auto_845543 ) ) ( not ( = ?auto_845542 ?auto_845545 ) ) ( not ( = ?auto_845542 ?auto_845544 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845543 ?auto_845545 ?auto_845544 )
      ( MAKE-4CRATE-VERIFY ?auto_845541 ?auto_845542 ?auto_845543 ?auto_845545 ?auto_845544 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_845575 - SURFACE
      ?auto_845576 - SURFACE
      ?auto_845577 - SURFACE
      ?auto_845579 - SURFACE
      ?auto_845578 - SURFACE
    )
    :vars
    (
      ?auto_845582 - HOIST
      ?auto_845580 - PLACE
      ?auto_845583 - TRUCK
      ?auto_845581 - PLACE
      ?auto_845584 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_845582 ?auto_845580 ) ( SURFACE-AT ?auto_845579 ?auto_845580 ) ( CLEAR ?auto_845579 ) ( IS-CRATE ?auto_845578 ) ( not ( = ?auto_845579 ?auto_845578 ) ) ( AVAILABLE ?auto_845582 ) ( ON ?auto_845579 ?auto_845577 ) ( not ( = ?auto_845577 ?auto_845579 ) ) ( not ( = ?auto_845577 ?auto_845578 ) ) ( TRUCK-AT ?auto_845583 ?auto_845581 ) ( not ( = ?auto_845581 ?auto_845580 ) ) ( HOIST-AT ?auto_845584 ?auto_845581 ) ( LIFTING ?auto_845584 ?auto_845578 ) ( not ( = ?auto_845582 ?auto_845584 ) ) ( ON ?auto_845576 ?auto_845575 ) ( ON ?auto_845577 ?auto_845576 ) ( not ( = ?auto_845575 ?auto_845576 ) ) ( not ( = ?auto_845575 ?auto_845577 ) ) ( not ( = ?auto_845575 ?auto_845579 ) ) ( not ( = ?auto_845575 ?auto_845578 ) ) ( not ( = ?auto_845576 ?auto_845577 ) ) ( not ( = ?auto_845576 ?auto_845579 ) ) ( not ( = ?auto_845576 ?auto_845578 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845577 ?auto_845579 ?auto_845578 )
      ( MAKE-4CRATE-VERIFY ?auto_845575 ?auto_845576 ?auto_845577 ?auto_845579 ?auto_845578 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_845613 - SURFACE
      ?auto_845614 - SURFACE
      ?auto_845615 - SURFACE
      ?auto_845617 - SURFACE
      ?auto_845616 - SURFACE
    )
    :vars
    (
      ?auto_845622 - HOIST
      ?auto_845618 - PLACE
      ?auto_845619 - TRUCK
      ?auto_845620 - PLACE
      ?auto_845623 - HOIST
      ?auto_845621 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845622 ?auto_845618 ) ( SURFACE-AT ?auto_845617 ?auto_845618 ) ( CLEAR ?auto_845617 ) ( IS-CRATE ?auto_845616 ) ( not ( = ?auto_845617 ?auto_845616 ) ) ( AVAILABLE ?auto_845622 ) ( ON ?auto_845617 ?auto_845615 ) ( not ( = ?auto_845615 ?auto_845617 ) ) ( not ( = ?auto_845615 ?auto_845616 ) ) ( TRUCK-AT ?auto_845619 ?auto_845620 ) ( not ( = ?auto_845620 ?auto_845618 ) ) ( HOIST-AT ?auto_845623 ?auto_845620 ) ( not ( = ?auto_845622 ?auto_845623 ) ) ( AVAILABLE ?auto_845623 ) ( SURFACE-AT ?auto_845616 ?auto_845620 ) ( ON ?auto_845616 ?auto_845621 ) ( CLEAR ?auto_845616 ) ( not ( = ?auto_845617 ?auto_845621 ) ) ( not ( = ?auto_845616 ?auto_845621 ) ) ( not ( = ?auto_845615 ?auto_845621 ) ) ( ON ?auto_845614 ?auto_845613 ) ( ON ?auto_845615 ?auto_845614 ) ( not ( = ?auto_845613 ?auto_845614 ) ) ( not ( = ?auto_845613 ?auto_845615 ) ) ( not ( = ?auto_845613 ?auto_845617 ) ) ( not ( = ?auto_845613 ?auto_845616 ) ) ( not ( = ?auto_845613 ?auto_845621 ) ) ( not ( = ?auto_845614 ?auto_845615 ) ) ( not ( = ?auto_845614 ?auto_845617 ) ) ( not ( = ?auto_845614 ?auto_845616 ) ) ( not ( = ?auto_845614 ?auto_845621 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845615 ?auto_845617 ?auto_845616 )
      ( MAKE-4CRATE-VERIFY ?auto_845613 ?auto_845614 ?auto_845615 ?auto_845617 ?auto_845616 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_845652 - SURFACE
      ?auto_845653 - SURFACE
      ?auto_845654 - SURFACE
      ?auto_845656 - SURFACE
      ?auto_845655 - SURFACE
    )
    :vars
    (
      ?auto_845662 - HOIST
      ?auto_845659 - PLACE
      ?auto_845657 - PLACE
      ?auto_845660 - HOIST
      ?auto_845661 - SURFACE
      ?auto_845658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845662 ?auto_845659 ) ( SURFACE-AT ?auto_845656 ?auto_845659 ) ( CLEAR ?auto_845656 ) ( IS-CRATE ?auto_845655 ) ( not ( = ?auto_845656 ?auto_845655 ) ) ( AVAILABLE ?auto_845662 ) ( ON ?auto_845656 ?auto_845654 ) ( not ( = ?auto_845654 ?auto_845656 ) ) ( not ( = ?auto_845654 ?auto_845655 ) ) ( not ( = ?auto_845657 ?auto_845659 ) ) ( HOIST-AT ?auto_845660 ?auto_845657 ) ( not ( = ?auto_845662 ?auto_845660 ) ) ( AVAILABLE ?auto_845660 ) ( SURFACE-AT ?auto_845655 ?auto_845657 ) ( ON ?auto_845655 ?auto_845661 ) ( CLEAR ?auto_845655 ) ( not ( = ?auto_845656 ?auto_845661 ) ) ( not ( = ?auto_845655 ?auto_845661 ) ) ( not ( = ?auto_845654 ?auto_845661 ) ) ( TRUCK-AT ?auto_845658 ?auto_845659 ) ( ON ?auto_845653 ?auto_845652 ) ( ON ?auto_845654 ?auto_845653 ) ( not ( = ?auto_845652 ?auto_845653 ) ) ( not ( = ?auto_845652 ?auto_845654 ) ) ( not ( = ?auto_845652 ?auto_845656 ) ) ( not ( = ?auto_845652 ?auto_845655 ) ) ( not ( = ?auto_845652 ?auto_845661 ) ) ( not ( = ?auto_845653 ?auto_845654 ) ) ( not ( = ?auto_845653 ?auto_845656 ) ) ( not ( = ?auto_845653 ?auto_845655 ) ) ( not ( = ?auto_845653 ?auto_845661 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845654 ?auto_845656 ?auto_845655 )
      ( MAKE-4CRATE-VERIFY ?auto_845652 ?auto_845653 ?auto_845654 ?auto_845656 ?auto_845655 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_845691 - SURFACE
      ?auto_845692 - SURFACE
      ?auto_845693 - SURFACE
      ?auto_845695 - SURFACE
      ?auto_845694 - SURFACE
    )
    :vars
    (
      ?auto_845700 - HOIST
      ?auto_845697 - PLACE
      ?auto_845701 - PLACE
      ?auto_845696 - HOIST
      ?auto_845699 - SURFACE
      ?auto_845698 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845700 ?auto_845697 ) ( IS-CRATE ?auto_845694 ) ( not ( = ?auto_845695 ?auto_845694 ) ) ( not ( = ?auto_845693 ?auto_845695 ) ) ( not ( = ?auto_845693 ?auto_845694 ) ) ( not ( = ?auto_845701 ?auto_845697 ) ) ( HOIST-AT ?auto_845696 ?auto_845701 ) ( not ( = ?auto_845700 ?auto_845696 ) ) ( AVAILABLE ?auto_845696 ) ( SURFACE-AT ?auto_845694 ?auto_845701 ) ( ON ?auto_845694 ?auto_845699 ) ( CLEAR ?auto_845694 ) ( not ( = ?auto_845695 ?auto_845699 ) ) ( not ( = ?auto_845694 ?auto_845699 ) ) ( not ( = ?auto_845693 ?auto_845699 ) ) ( TRUCK-AT ?auto_845698 ?auto_845697 ) ( SURFACE-AT ?auto_845693 ?auto_845697 ) ( CLEAR ?auto_845693 ) ( LIFTING ?auto_845700 ?auto_845695 ) ( IS-CRATE ?auto_845695 ) ( ON ?auto_845692 ?auto_845691 ) ( ON ?auto_845693 ?auto_845692 ) ( not ( = ?auto_845691 ?auto_845692 ) ) ( not ( = ?auto_845691 ?auto_845693 ) ) ( not ( = ?auto_845691 ?auto_845695 ) ) ( not ( = ?auto_845691 ?auto_845694 ) ) ( not ( = ?auto_845691 ?auto_845699 ) ) ( not ( = ?auto_845692 ?auto_845693 ) ) ( not ( = ?auto_845692 ?auto_845695 ) ) ( not ( = ?auto_845692 ?auto_845694 ) ) ( not ( = ?auto_845692 ?auto_845699 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845693 ?auto_845695 ?auto_845694 )
      ( MAKE-4CRATE-VERIFY ?auto_845691 ?auto_845692 ?auto_845693 ?auto_845695 ?auto_845694 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_845730 - SURFACE
      ?auto_845731 - SURFACE
      ?auto_845732 - SURFACE
      ?auto_845734 - SURFACE
      ?auto_845733 - SURFACE
    )
    :vars
    (
      ?auto_845735 - HOIST
      ?auto_845736 - PLACE
      ?auto_845738 - PLACE
      ?auto_845737 - HOIST
      ?auto_845740 - SURFACE
      ?auto_845739 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845735 ?auto_845736 ) ( IS-CRATE ?auto_845733 ) ( not ( = ?auto_845734 ?auto_845733 ) ) ( not ( = ?auto_845732 ?auto_845734 ) ) ( not ( = ?auto_845732 ?auto_845733 ) ) ( not ( = ?auto_845738 ?auto_845736 ) ) ( HOIST-AT ?auto_845737 ?auto_845738 ) ( not ( = ?auto_845735 ?auto_845737 ) ) ( AVAILABLE ?auto_845737 ) ( SURFACE-AT ?auto_845733 ?auto_845738 ) ( ON ?auto_845733 ?auto_845740 ) ( CLEAR ?auto_845733 ) ( not ( = ?auto_845734 ?auto_845740 ) ) ( not ( = ?auto_845733 ?auto_845740 ) ) ( not ( = ?auto_845732 ?auto_845740 ) ) ( TRUCK-AT ?auto_845739 ?auto_845736 ) ( SURFACE-AT ?auto_845732 ?auto_845736 ) ( CLEAR ?auto_845732 ) ( IS-CRATE ?auto_845734 ) ( AVAILABLE ?auto_845735 ) ( IN ?auto_845734 ?auto_845739 ) ( ON ?auto_845731 ?auto_845730 ) ( ON ?auto_845732 ?auto_845731 ) ( not ( = ?auto_845730 ?auto_845731 ) ) ( not ( = ?auto_845730 ?auto_845732 ) ) ( not ( = ?auto_845730 ?auto_845734 ) ) ( not ( = ?auto_845730 ?auto_845733 ) ) ( not ( = ?auto_845730 ?auto_845740 ) ) ( not ( = ?auto_845731 ?auto_845732 ) ) ( not ( = ?auto_845731 ?auto_845734 ) ) ( not ( = ?auto_845731 ?auto_845733 ) ) ( not ( = ?auto_845731 ?auto_845740 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845732 ?auto_845734 ?auto_845733 )
      ( MAKE-4CRATE-VERIFY ?auto_845730 ?auto_845731 ?auto_845732 ?auto_845734 ?auto_845733 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_846390 - SURFACE
      ?auto_846391 - SURFACE
      ?auto_846392 - SURFACE
      ?auto_846394 - SURFACE
      ?auto_846393 - SURFACE
      ?auto_846395 - SURFACE
    )
    :vars
    (
      ?auto_846396 - HOIST
      ?auto_846397 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_846396 ?auto_846397 ) ( SURFACE-AT ?auto_846393 ?auto_846397 ) ( CLEAR ?auto_846393 ) ( LIFTING ?auto_846396 ?auto_846395 ) ( IS-CRATE ?auto_846395 ) ( not ( = ?auto_846393 ?auto_846395 ) ) ( ON ?auto_846391 ?auto_846390 ) ( ON ?auto_846392 ?auto_846391 ) ( ON ?auto_846394 ?auto_846392 ) ( ON ?auto_846393 ?auto_846394 ) ( not ( = ?auto_846390 ?auto_846391 ) ) ( not ( = ?auto_846390 ?auto_846392 ) ) ( not ( = ?auto_846390 ?auto_846394 ) ) ( not ( = ?auto_846390 ?auto_846393 ) ) ( not ( = ?auto_846390 ?auto_846395 ) ) ( not ( = ?auto_846391 ?auto_846392 ) ) ( not ( = ?auto_846391 ?auto_846394 ) ) ( not ( = ?auto_846391 ?auto_846393 ) ) ( not ( = ?auto_846391 ?auto_846395 ) ) ( not ( = ?auto_846392 ?auto_846394 ) ) ( not ( = ?auto_846392 ?auto_846393 ) ) ( not ( = ?auto_846392 ?auto_846395 ) ) ( not ( = ?auto_846394 ?auto_846393 ) ) ( not ( = ?auto_846394 ?auto_846395 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_846393 ?auto_846395 )
      ( MAKE-5CRATE-VERIFY ?auto_846390 ?auto_846391 ?auto_846392 ?auto_846394 ?auto_846393 ?auto_846395 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_846424 - SURFACE
      ?auto_846425 - SURFACE
      ?auto_846426 - SURFACE
      ?auto_846428 - SURFACE
      ?auto_846427 - SURFACE
      ?auto_846429 - SURFACE
    )
    :vars
    (
      ?auto_846430 - HOIST
      ?auto_846431 - PLACE
      ?auto_846432 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_846430 ?auto_846431 ) ( SURFACE-AT ?auto_846427 ?auto_846431 ) ( CLEAR ?auto_846427 ) ( IS-CRATE ?auto_846429 ) ( not ( = ?auto_846427 ?auto_846429 ) ) ( TRUCK-AT ?auto_846432 ?auto_846431 ) ( AVAILABLE ?auto_846430 ) ( IN ?auto_846429 ?auto_846432 ) ( ON ?auto_846427 ?auto_846428 ) ( not ( = ?auto_846428 ?auto_846427 ) ) ( not ( = ?auto_846428 ?auto_846429 ) ) ( ON ?auto_846425 ?auto_846424 ) ( ON ?auto_846426 ?auto_846425 ) ( ON ?auto_846428 ?auto_846426 ) ( not ( = ?auto_846424 ?auto_846425 ) ) ( not ( = ?auto_846424 ?auto_846426 ) ) ( not ( = ?auto_846424 ?auto_846428 ) ) ( not ( = ?auto_846424 ?auto_846427 ) ) ( not ( = ?auto_846424 ?auto_846429 ) ) ( not ( = ?auto_846425 ?auto_846426 ) ) ( not ( = ?auto_846425 ?auto_846428 ) ) ( not ( = ?auto_846425 ?auto_846427 ) ) ( not ( = ?auto_846425 ?auto_846429 ) ) ( not ( = ?auto_846426 ?auto_846428 ) ) ( not ( = ?auto_846426 ?auto_846427 ) ) ( not ( = ?auto_846426 ?auto_846429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_846428 ?auto_846427 ?auto_846429 )
      ( MAKE-5CRATE-VERIFY ?auto_846424 ?auto_846425 ?auto_846426 ?auto_846428 ?auto_846427 ?auto_846429 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_846464 - SURFACE
      ?auto_846465 - SURFACE
      ?auto_846466 - SURFACE
      ?auto_846468 - SURFACE
      ?auto_846467 - SURFACE
      ?auto_846469 - SURFACE
    )
    :vars
    (
      ?auto_846472 - HOIST
      ?auto_846470 - PLACE
      ?auto_846471 - TRUCK
      ?auto_846473 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_846472 ?auto_846470 ) ( SURFACE-AT ?auto_846467 ?auto_846470 ) ( CLEAR ?auto_846467 ) ( IS-CRATE ?auto_846469 ) ( not ( = ?auto_846467 ?auto_846469 ) ) ( AVAILABLE ?auto_846472 ) ( IN ?auto_846469 ?auto_846471 ) ( ON ?auto_846467 ?auto_846468 ) ( not ( = ?auto_846468 ?auto_846467 ) ) ( not ( = ?auto_846468 ?auto_846469 ) ) ( TRUCK-AT ?auto_846471 ?auto_846473 ) ( not ( = ?auto_846473 ?auto_846470 ) ) ( ON ?auto_846465 ?auto_846464 ) ( ON ?auto_846466 ?auto_846465 ) ( ON ?auto_846468 ?auto_846466 ) ( not ( = ?auto_846464 ?auto_846465 ) ) ( not ( = ?auto_846464 ?auto_846466 ) ) ( not ( = ?auto_846464 ?auto_846468 ) ) ( not ( = ?auto_846464 ?auto_846467 ) ) ( not ( = ?auto_846464 ?auto_846469 ) ) ( not ( = ?auto_846465 ?auto_846466 ) ) ( not ( = ?auto_846465 ?auto_846468 ) ) ( not ( = ?auto_846465 ?auto_846467 ) ) ( not ( = ?auto_846465 ?auto_846469 ) ) ( not ( = ?auto_846466 ?auto_846468 ) ) ( not ( = ?auto_846466 ?auto_846467 ) ) ( not ( = ?auto_846466 ?auto_846469 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_846468 ?auto_846467 ?auto_846469 )
      ( MAKE-5CRATE-VERIFY ?auto_846464 ?auto_846465 ?auto_846466 ?auto_846468 ?auto_846467 ?auto_846469 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_846509 - SURFACE
      ?auto_846510 - SURFACE
      ?auto_846511 - SURFACE
      ?auto_846513 - SURFACE
      ?auto_846512 - SURFACE
      ?auto_846514 - SURFACE
    )
    :vars
    (
      ?auto_846518 - HOIST
      ?auto_846516 - PLACE
      ?auto_846517 - TRUCK
      ?auto_846519 - PLACE
      ?auto_846515 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_846518 ?auto_846516 ) ( SURFACE-AT ?auto_846512 ?auto_846516 ) ( CLEAR ?auto_846512 ) ( IS-CRATE ?auto_846514 ) ( not ( = ?auto_846512 ?auto_846514 ) ) ( AVAILABLE ?auto_846518 ) ( ON ?auto_846512 ?auto_846513 ) ( not ( = ?auto_846513 ?auto_846512 ) ) ( not ( = ?auto_846513 ?auto_846514 ) ) ( TRUCK-AT ?auto_846517 ?auto_846519 ) ( not ( = ?auto_846519 ?auto_846516 ) ) ( HOIST-AT ?auto_846515 ?auto_846519 ) ( LIFTING ?auto_846515 ?auto_846514 ) ( not ( = ?auto_846518 ?auto_846515 ) ) ( ON ?auto_846510 ?auto_846509 ) ( ON ?auto_846511 ?auto_846510 ) ( ON ?auto_846513 ?auto_846511 ) ( not ( = ?auto_846509 ?auto_846510 ) ) ( not ( = ?auto_846509 ?auto_846511 ) ) ( not ( = ?auto_846509 ?auto_846513 ) ) ( not ( = ?auto_846509 ?auto_846512 ) ) ( not ( = ?auto_846509 ?auto_846514 ) ) ( not ( = ?auto_846510 ?auto_846511 ) ) ( not ( = ?auto_846510 ?auto_846513 ) ) ( not ( = ?auto_846510 ?auto_846512 ) ) ( not ( = ?auto_846510 ?auto_846514 ) ) ( not ( = ?auto_846511 ?auto_846513 ) ) ( not ( = ?auto_846511 ?auto_846512 ) ) ( not ( = ?auto_846511 ?auto_846514 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_846513 ?auto_846512 ?auto_846514 )
      ( MAKE-5CRATE-VERIFY ?auto_846509 ?auto_846510 ?auto_846511 ?auto_846513 ?auto_846512 ?auto_846514 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_846559 - SURFACE
      ?auto_846560 - SURFACE
      ?auto_846561 - SURFACE
      ?auto_846563 - SURFACE
      ?auto_846562 - SURFACE
      ?auto_846564 - SURFACE
    )
    :vars
    (
      ?auto_846570 - HOIST
      ?auto_846569 - PLACE
      ?auto_846566 - TRUCK
      ?auto_846568 - PLACE
      ?auto_846565 - HOIST
      ?auto_846567 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_846570 ?auto_846569 ) ( SURFACE-AT ?auto_846562 ?auto_846569 ) ( CLEAR ?auto_846562 ) ( IS-CRATE ?auto_846564 ) ( not ( = ?auto_846562 ?auto_846564 ) ) ( AVAILABLE ?auto_846570 ) ( ON ?auto_846562 ?auto_846563 ) ( not ( = ?auto_846563 ?auto_846562 ) ) ( not ( = ?auto_846563 ?auto_846564 ) ) ( TRUCK-AT ?auto_846566 ?auto_846568 ) ( not ( = ?auto_846568 ?auto_846569 ) ) ( HOIST-AT ?auto_846565 ?auto_846568 ) ( not ( = ?auto_846570 ?auto_846565 ) ) ( AVAILABLE ?auto_846565 ) ( SURFACE-AT ?auto_846564 ?auto_846568 ) ( ON ?auto_846564 ?auto_846567 ) ( CLEAR ?auto_846564 ) ( not ( = ?auto_846562 ?auto_846567 ) ) ( not ( = ?auto_846564 ?auto_846567 ) ) ( not ( = ?auto_846563 ?auto_846567 ) ) ( ON ?auto_846560 ?auto_846559 ) ( ON ?auto_846561 ?auto_846560 ) ( ON ?auto_846563 ?auto_846561 ) ( not ( = ?auto_846559 ?auto_846560 ) ) ( not ( = ?auto_846559 ?auto_846561 ) ) ( not ( = ?auto_846559 ?auto_846563 ) ) ( not ( = ?auto_846559 ?auto_846562 ) ) ( not ( = ?auto_846559 ?auto_846564 ) ) ( not ( = ?auto_846559 ?auto_846567 ) ) ( not ( = ?auto_846560 ?auto_846561 ) ) ( not ( = ?auto_846560 ?auto_846563 ) ) ( not ( = ?auto_846560 ?auto_846562 ) ) ( not ( = ?auto_846560 ?auto_846564 ) ) ( not ( = ?auto_846560 ?auto_846567 ) ) ( not ( = ?auto_846561 ?auto_846563 ) ) ( not ( = ?auto_846561 ?auto_846562 ) ) ( not ( = ?auto_846561 ?auto_846564 ) ) ( not ( = ?auto_846561 ?auto_846567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_846563 ?auto_846562 ?auto_846564 )
      ( MAKE-5CRATE-VERIFY ?auto_846559 ?auto_846560 ?auto_846561 ?auto_846563 ?auto_846562 ?auto_846564 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_846610 - SURFACE
      ?auto_846611 - SURFACE
      ?auto_846612 - SURFACE
      ?auto_846614 - SURFACE
      ?auto_846613 - SURFACE
      ?auto_846615 - SURFACE
    )
    :vars
    (
      ?auto_846617 - HOIST
      ?auto_846620 - PLACE
      ?auto_846616 - PLACE
      ?auto_846621 - HOIST
      ?auto_846618 - SURFACE
      ?auto_846619 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_846617 ?auto_846620 ) ( SURFACE-AT ?auto_846613 ?auto_846620 ) ( CLEAR ?auto_846613 ) ( IS-CRATE ?auto_846615 ) ( not ( = ?auto_846613 ?auto_846615 ) ) ( AVAILABLE ?auto_846617 ) ( ON ?auto_846613 ?auto_846614 ) ( not ( = ?auto_846614 ?auto_846613 ) ) ( not ( = ?auto_846614 ?auto_846615 ) ) ( not ( = ?auto_846616 ?auto_846620 ) ) ( HOIST-AT ?auto_846621 ?auto_846616 ) ( not ( = ?auto_846617 ?auto_846621 ) ) ( AVAILABLE ?auto_846621 ) ( SURFACE-AT ?auto_846615 ?auto_846616 ) ( ON ?auto_846615 ?auto_846618 ) ( CLEAR ?auto_846615 ) ( not ( = ?auto_846613 ?auto_846618 ) ) ( not ( = ?auto_846615 ?auto_846618 ) ) ( not ( = ?auto_846614 ?auto_846618 ) ) ( TRUCK-AT ?auto_846619 ?auto_846620 ) ( ON ?auto_846611 ?auto_846610 ) ( ON ?auto_846612 ?auto_846611 ) ( ON ?auto_846614 ?auto_846612 ) ( not ( = ?auto_846610 ?auto_846611 ) ) ( not ( = ?auto_846610 ?auto_846612 ) ) ( not ( = ?auto_846610 ?auto_846614 ) ) ( not ( = ?auto_846610 ?auto_846613 ) ) ( not ( = ?auto_846610 ?auto_846615 ) ) ( not ( = ?auto_846610 ?auto_846618 ) ) ( not ( = ?auto_846611 ?auto_846612 ) ) ( not ( = ?auto_846611 ?auto_846614 ) ) ( not ( = ?auto_846611 ?auto_846613 ) ) ( not ( = ?auto_846611 ?auto_846615 ) ) ( not ( = ?auto_846611 ?auto_846618 ) ) ( not ( = ?auto_846612 ?auto_846614 ) ) ( not ( = ?auto_846612 ?auto_846613 ) ) ( not ( = ?auto_846612 ?auto_846615 ) ) ( not ( = ?auto_846612 ?auto_846618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_846614 ?auto_846613 ?auto_846615 )
      ( MAKE-5CRATE-VERIFY ?auto_846610 ?auto_846611 ?auto_846612 ?auto_846614 ?auto_846613 ?auto_846615 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_846661 - SURFACE
      ?auto_846662 - SURFACE
      ?auto_846663 - SURFACE
      ?auto_846665 - SURFACE
      ?auto_846664 - SURFACE
      ?auto_846666 - SURFACE
    )
    :vars
    (
      ?auto_846672 - HOIST
      ?auto_846668 - PLACE
      ?auto_846670 - PLACE
      ?auto_846671 - HOIST
      ?auto_846667 - SURFACE
      ?auto_846669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_846672 ?auto_846668 ) ( IS-CRATE ?auto_846666 ) ( not ( = ?auto_846664 ?auto_846666 ) ) ( not ( = ?auto_846665 ?auto_846664 ) ) ( not ( = ?auto_846665 ?auto_846666 ) ) ( not ( = ?auto_846670 ?auto_846668 ) ) ( HOIST-AT ?auto_846671 ?auto_846670 ) ( not ( = ?auto_846672 ?auto_846671 ) ) ( AVAILABLE ?auto_846671 ) ( SURFACE-AT ?auto_846666 ?auto_846670 ) ( ON ?auto_846666 ?auto_846667 ) ( CLEAR ?auto_846666 ) ( not ( = ?auto_846664 ?auto_846667 ) ) ( not ( = ?auto_846666 ?auto_846667 ) ) ( not ( = ?auto_846665 ?auto_846667 ) ) ( TRUCK-AT ?auto_846669 ?auto_846668 ) ( SURFACE-AT ?auto_846665 ?auto_846668 ) ( CLEAR ?auto_846665 ) ( LIFTING ?auto_846672 ?auto_846664 ) ( IS-CRATE ?auto_846664 ) ( ON ?auto_846662 ?auto_846661 ) ( ON ?auto_846663 ?auto_846662 ) ( ON ?auto_846665 ?auto_846663 ) ( not ( = ?auto_846661 ?auto_846662 ) ) ( not ( = ?auto_846661 ?auto_846663 ) ) ( not ( = ?auto_846661 ?auto_846665 ) ) ( not ( = ?auto_846661 ?auto_846664 ) ) ( not ( = ?auto_846661 ?auto_846666 ) ) ( not ( = ?auto_846661 ?auto_846667 ) ) ( not ( = ?auto_846662 ?auto_846663 ) ) ( not ( = ?auto_846662 ?auto_846665 ) ) ( not ( = ?auto_846662 ?auto_846664 ) ) ( not ( = ?auto_846662 ?auto_846666 ) ) ( not ( = ?auto_846662 ?auto_846667 ) ) ( not ( = ?auto_846663 ?auto_846665 ) ) ( not ( = ?auto_846663 ?auto_846664 ) ) ( not ( = ?auto_846663 ?auto_846666 ) ) ( not ( = ?auto_846663 ?auto_846667 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_846665 ?auto_846664 ?auto_846666 )
      ( MAKE-5CRATE-VERIFY ?auto_846661 ?auto_846662 ?auto_846663 ?auto_846665 ?auto_846664 ?auto_846666 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_846712 - SURFACE
      ?auto_846713 - SURFACE
      ?auto_846714 - SURFACE
      ?auto_846716 - SURFACE
      ?auto_846715 - SURFACE
      ?auto_846717 - SURFACE
    )
    :vars
    (
      ?auto_846722 - HOIST
      ?auto_846721 - PLACE
      ?auto_846723 - PLACE
      ?auto_846720 - HOIST
      ?auto_846718 - SURFACE
      ?auto_846719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_846722 ?auto_846721 ) ( IS-CRATE ?auto_846717 ) ( not ( = ?auto_846715 ?auto_846717 ) ) ( not ( = ?auto_846716 ?auto_846715 ) ) ( not ( = ?auto_846716 ?auto_846717 ) ) ( not ( = ?auto_846723 ?auto_846721 ) ) ( HOIST-AT ?auto_846720 ?auto_846723 ) ( not ( = ?auto_846722 ?auto_846720 ) ) ( AVAILABLE ?auto_846720 ) ( SURFACE-AT ?auto_846717 ?auto_846723 ) ( ON ?auto_846717 ?auto_846718 ) ( CLEAR ?auto_846717 ) ( not ( = ?auto_846715 ?auto_846718 ) ) ( not ( = ?auto_846717 ?auto_846718 ) ) ( not ( = ?auto_846716 ?auto_846718 ) ) ( TRUCK-AT ?auto_846719 ?auto_846721 ) ( SURFACE-AT ?auto_846716 ?auto_846721 ) ( CLEAR ?auto_846716 ) ( IS-CRATE ?auto_846715 ) ( AVAILABLE ?auto_846722 ) ( IN ?auto_846715 ?auto_846719 ) ( ON ?auto_846713 ?auto_846712 ) ( ON ?auto_846714 ?auto_846713 ) ( ON ?auto_846716 ?auto_846714 ) ( not ( = ?auto_846712 ?auto_846713 ) ) ( not ( = ?auto_846712 ?auto_846714 ) ) ( not ( = ?auto_846712 ?auto_846716 ) ) ( not ( = ?auto_846712 ?auto_846715 ) ) ( not ( = ?auto_846712 ?auto_846717 ) ) ( not ( = ?auto_846712 ?auto_846718 ) ) ( not ( = ?auto_846713 ?auto_846714 ) ) ( not ( = ?auto_846713 ?auto_846716 ) ) ( not ( = ?auto_846713 ?auto_846715 ) ) ( not ( = ?auto_846713 ?auto_846717 ) ) ( not ( = ?auto_846713 ?auto_846718 ) ) ( not ( = ?auto_846714 ?auto_846716 ) ) ( not ( = ?auto_846714 ?auto_846715 ) ) ( not ( = ?auto_846714 ?auto_846717 ) ) ( not ( = ?auto_846714 ?auto_846718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_846716 ?auto_846715 ?auto_846717 )
      ( MAKE-5CRATE-VERIFY ?auto_846712 ?auto_846713 ?auto_846714 ?auto_846716 ?auto_846715 ?auto_846717 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_847921 - SURFACE
      ?auto_847922 - SURFACE
      ?auto_847923 - SURFACE
      ?auto_847925 - SURFACE
      ?auto_847924 - SURFACE
      ?auto_847926 - SURFACE
      ?auto_847927 - SURFACE
    )
    :vars
    (
      ?auto_847929 - HOIST
      ?auto_847928 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_847929 ?auto_847928 ) ( SURFACE-AT ?auto_847926 ?auto_847928 ) ( CLEAR ?auto_847926 ) ( LIFTING ?auto_847929 ?auto_847927 ) ( IS-CRATE ?auto_847927 ) ( not ( = ?auto_847926 ?auto_847927 ) ) ( ON ?auto_847922 ?auto_847921 ) ( ON ?auto_847923 ?auto_847922 ) ( ON ?auto_847925 ?auto_847923 ) ( ON ?auto_847924 ?auto_847925 ) ( ON ?auto_847926 ?auto_847924 ) ( not ( = ?auto_847921 ?auto_847922 ) ) ( not ( = ?auto_847921 ?auto_847923 ) ) ( not ( = ?auto_847921 ?auto_847925 ) ) ( not ( = ?auto_847921 ?auto_847924 ) ) ( not ( = ?auto_847921 ?auto_847926 ) ) ( not ( = ?auto_847921 ?auto_847927 ) ) ( not ( = ?auto_847922 ?auto_847923 ) ) ( not ( = ?auto_847922 ?auto_847925 ) ) ( not ( = ?auto_847922 ?auto_847924 ) ) ( not ( = ?auto_847922 ?auto_847926 ) ) ( not ( = ?auto_847922 ?auto_847927 ) ) ( not ( = ?auto_847923 ?auto_847925 ) ) ( not ( = ?auto_847923 ?auto_847924 ) ) ( not ( = ?auto_847923 ?auto_847926 ) ) ( not ( = ?auto_847923 ?auto_847927 ) ) ( not ( = ?auto_847925 ?auto_847924 ) ) ( not ( = ?auto_847925 ?auto_847926 ) ) ( not ( = ?auto_847925 ?auto_847927 ) ) ( not ( = ?auto_847924 ?auto_847926 ) ) ( not ( = ?auto_847924 ?auto_847927 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_847926 ?auto_847927 )
      ( MAKE-6CRATE-VERIFY ?auto_847921 ?auto_847922 ?auto_847923 ?auto_847925 ?auto_847924 ?auto_847926 ?auto_847927 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_847965 - SURFACE
      ?auto_847966 - SURFACE
      ?auto_847967 - SURFACE
      ?auto_847969 - SURFACE
      ?auto_847968 - SURFACE
      ?auto_847970 - SURFACE
      ?auto_847971 - SURFACE
    )
    :vars
    (
      ?auto_847972 - HOIST
      ?auto_847974 - PLACE
      ?auto_847973 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847972 ?auto_847974 ) ( SURFACE-AT ?auto_847970 ?auto_847974 ) ( CLEAR ?auto_847970 ) ( IS-CRATE ?auto_847971 ) ( not ( = ?auto_847970 ?auto_847971 ) ) ( TRUCK-AT ?auto_847973 ?auto_847974 ) ( AVAILABLE ?auto_847972 ) ( IN ?auto_847971 ?auto_847973 ) ( ON ?auto_847970 ?auto_847968 ) ( not ( = ?auto_847968 ?auto_847970 ) ) ( not ( = ?auto_847968 ?auto_847971 ) ) ( ON ?auto_847966 ?auto_847965 ) ( ON ?auto_847967 ?auto_847966 ) ( ON ?auto_847969 ?auto_847967 ) ( ON ?auto_847968 ?auto_847969 ) ( not ( = ?auto_847965 ?auto_847966 ) ) ( not ( = ?auto_847965 ?auto_847967 ) ) ( not ( = ?auto_847965 ?auto_847969 ) ) ( not ( = ?auto_847965 ?auto_847968 ) ) ( not ( = ?auto_847965 ?auto_847970 ) ) ( not ( = ?auto_847965 ?auto_847971 ) ) ( not ( = ?auto_847966 ?auto_847967 ) ) ( not ( = ?auto_847966 ?auto_847969 ) ) ( not ( = ?auto_847966 ?auto_847968 ) ) ( not ( = ?auto_847966 ?auto_847970 ) ) ( not ( = ?auto_847966 ?auto_847971 ) ) ( not ( = ?auto_847967 ?auto_847969 ) ) ( not ( = ?auto_847967 ?auto_847968 ) ) ( not ( = ?auto_847967 ?auto_847970 ) ) ( not ( = ?auto_847967 ?auto_847971 ) ) ( not ( = ?auto_847969 ?auto_847968 ) ) ( not ( = ?auto_847969 ?auto_847970 ) ) ( not ( = ?auto_847969 ?auto_847971 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847968 ?auto_847970 ?auto_847971 )
      ( MAKE-6CRATE-VERIFY ?auto_847965 ?auto_847966 ?auto_847967 ?auto_847969 ?auto_847968 ?auto_847970 ?auto_847971 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_848016 - SURFACE
      ?auto_848017 - SURFACE
      ?auto_848018 - SURFACE
      ?auto_848020 - SURFACE
      ?auto_848019 - SURFACE
      ?auto_848021 - SURFACE
      ?auto_848022 - SURFACE
    )
    :vars
    (
      ?auto_848024 - HOIST
      ?auto_848025 - PLACE
      ?auto_848026 - TRUCK
      ?auto_848023 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_848024 ?auto_848025 ) ( SURFACE-AT ?auto_848021 ?auto_848025 ) ( CLEAR ?auto_848021 ) ( IS-CRATE ?auto_848022 ) ( not ( = ?auto_848021 ?auto_848022 ) ) ( AVAILABLE ?auto_848024 ) ( IN ?auto_848022 ?auto_848026 ) ( ON ?auto_848021 ?auto_848019 ) ( not ( = ?auto_848019 ?auto_848021 ) ) ( not ( = ?auto_848019 ?auto_848022 ) ) ( TRUCK-AT ?auto_848026 ?auto_848023 ) ( not ( = ?auto_848023 ?auto_848025 ) ) ( ON ?auto_848017 ?auto_848016 ) ( ON ?auto_848018 ?auto_848017 ) ( ON ?auto_848020 ?auto_848018 ) ( ON ?auto_848019 ?auto_848020 ) ( not ( = ?auto_848016 ?auto_848017 ) ) ( not ( = ?auto_848016 ?auto_848018 ) ) ( not ( = ?auto_848016 ?auto_848020 ) ) ( not ( = ?auto_848016 ?auto_848019 ) ) ( not ( = ?auto_848016 ?auto_848021 ) ) ( not ( = ?auto_848016 ?auto_848022 ) ) ( not ( = ?auto_848017 ?auto_848018 ) ) ( not ( = ?auto_848017 ?auto_848020 ) ) ( not ( = ?auto_848017 ?auto_848019 ) ) ( not ( = ?auto_848017 ?auto_848021 ) ) ( not ( = ?auto_848017 ?auto_848022 ) ) ( not ( = ?auto_848018 ?auto_848020 ) ) ( not ( = ?auto_848018 ?auto_848019 ) ) ( not ( = ?auto_848018 ?auto_848021 ) ) ( not ( = ?auto_848018 ?auto_848022 ) ) ( not ( = ?auto_848020 ?auto_848019 ) ) ( not ( = ?auto_848020 ?auto_848021 ) ) ( not ( = ?auto_848020 ?auto_848022 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_848019 ?auto_848021 ?auto_848022 )
      ( MAKE-6CRATE-VERIFY ?auto_848016 ?auto_848017 ?auto_848018 ?auto_848020 ?auto_848019 ?auto_848021 ?auto_848022 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_848073 - SURFACE
      ?auto_848074 - SURFACE
      ?auto_848075 - SURFACE
      ?auto_848077 - SURFACE
      ?auto_848076 - SURFACE
      ?auto_848078 - SURFACE
      ?auto_848079 - SURFACE
    )
    :vars
    (
      ?auto_848080 - HOIST
      ?auto_848084 - PLACE
      ?auto_848082 - TRUCK
      ?auto_848083 - PLACE
      ?auto_848081 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_848080 ?auto_848084 ) ( SURFACE-AT ?auto_848078 ?auto_848084 ) ( CLEAR ?auto_848078 ) ( IS-CRATE ?auto_848079 ) ( not ( = ?auto_848078 ?auto_848079 ) ) ( AVAILABLE ?auto_848080 ) ( ON ?auto_848078 ?auto_848076 ) ( not ( = ?auto_848076 ?auto_848078 ) ) ( not ( = ?auto_848076 ?auto_848079 ) ) ( TRUCK-AT ?auto_848082 ?auto_848083 ) ( not ( = ?auto_848083 ?auto_848084 ) ) ( HOIST-AT ?auto_848081 ?auto_848083 ) ( LIFTING ?auto_848081 ?auto_848079 ) ( not ( = ?auto_848080 ?auto_848081 ) ) ( ON ?auto_848074 ?auto_848073 ) ( ON ?auto_848075 ?auto_848074 ) ( ON ?auto_848077 ?auto_848075 ) ( ON ?auto_848076 ?auto_848077 ) ( not ( = ?auto_848073 ?auto_848074 ) ) ( not ( = ?auto_848073 ?auto_848075 ) ) ( not ( = ?auto_848073 ?auto_848077 ) ) ( not ( = ?auto_848073 ?auto_848076 ) ) ( not ( = ?auto_848073 ?auto_848078 ) ) ( not ( = ?auto_848073 ?auto_848079 ) ) ( not ( = ?auto_848074 ?auto_848075 ) ) ( not ( = ?auto_848074 ?auto_848077 ) ) ( not ( = ?auto_848074 ?auto_848076 ) ) ( not ( = ?auto_848074 ?auto_848078 ) ) ( not ( = ?auto_848074 ?auto_848079 ) ) ( not ( = ?auto_848075 ?auto_848077 ) ) ( not ( = ?auto_848075 ?auto_848076 ) ) ( not ( = ?auto_848075 ?auto_848078 ) ) ( not ( = ?auto_848075 ?auto_848079 ) ) ( not ( = ?auto_848077 ?auto_848076 ) ) ( not ( = ?auto_848077 ?auto_848078 ) ) ( not ( = ?auto_848077 ?auto_848079 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_848076 ?auto_848078 ?auto_848079 )
      ( MAKE-6CRATE-VERIFY ?auto_848073 ?auto_848074 ?auto_848075 ?auto_848077 ?auto_848076 ?auto_848078 ?auto_848079 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_848136 - SURFACE
      ?auto_848137 - SURFACE
      ?auto_848138 - SURFACE
      ?auto_848140 - SURFACE
      ?auto_848139 - SURFACE
      ?auto_848141 - SURFACE
      ?auto_848142 - SURFACE
    )
    :vars
    (
      ?auto_848148 - HOIST
      ?auto_848143 - PLACE
      ?auto_848147 - TRUCK
      ?auto_848144 - PLACE
      ?auto_848145 - HOIST
      ?auto_848146 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_848148 ?auto_848143 ) ( SURFACE-AT ?auto_848141 ?auto_848143 ) ( CLEAR ?auto_848141 ) ( IS-CRATE ?auto_848142 ) ( not ( = ?auto_848141 ?auto_848142 ) ) ( AVAILABLE ?auto_848148 ) ( ON ?auto_848141 ?auto_848139 ) ( not ( = ?auto_848139 ?auto_848141 ) ) ( not ( = ?auto_848139 ?auto_848142 ) ) ( TRUCK-AT ?auto_848147 ?auto_848144 ) ( not ( = ?auto_848144 ?auto_848143 ) ) ( HOIST-AT ?auto_848145 ?auto_848144 ) ( not ( = ?auto_848148 ?auto_848145 ) ) ( AVAILABLE ?auto_848145 ) ( SURFACE-AT ?auto_848142 ?auto_848144 ) ( ON ?auto_848142 ?auto_848146 ) ( CLEAR ?auto_848142 ) ( not ( = ?auto_848141 ?auto_848146 ) ) ( not ( = ?auto_848142 ?auto_848146 ) ) ( not ( = ?auto_848139 ?auto_848146 ) ) ( ON ?auto_848137 ?auto_848136 ) ( ON ?auto_848138 ?auto_848137 ) ( ON ?auto_848140 ?auto_848138 ) ( ON ?auto_848139 ?auto_848140 ) ( not ( = ?auto_848136 ?auto_848137 ) ) ( not ( = ?auto_848136 ?auto_848138 ) ) ( not ( = ?auto_848136 ?auto_848140 ) ) ( not ( = ?auto_848136 ?auto_848139 ) ) ( not ( = ?auto_848136 ?auto_848141 ) ) ( not ( = ?auto_848136 ?auto_848142 ) ) ( not ( = ?auto_848136 ?auto_848146 ) ) ( not ( = ?auto_848137 ?auto_848138 ) ) ( not ( = ?auto_848137 ?auto_848140 ) ) ( not ( = ?auto_848137 ?auto_848139 ) ) ( not ( = ?auto_848137 ?auto_848141 ) ) ( not ( = ?auto_848137 ?auto_848142 ) ) ( not ( = ?auto_848137 ?auto_848146 ) ) ( not ( = ?auto_848138 ?auto_848140 ) ) ( not ( = ?auto_848138 ?auto_848139 ) ) ( not ( = ?auto_848138 ?auto_848141 ) ) ( not ( = ?auto_848138 ?auto_848142 ) ) ( not ( = ?auto_848138 ?auto_848146 ) ) ( not ( = ?auto_848140 ?auto_848139 ) ) ( not ( = ?auto_848140 ?auto_848141 ) ) ( not ( = ?auto_848140 ?auto_848142 ) ) ( not ( = ?auto_848140 ?auto_848146 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_848139 ?auto_848141 ?auto_848142 )
      ( MAKE-6CRATE-VERIFY ?auto_848136 ?auto_848137 ?auto_848138 ?auto_848140 ?auto_848139 ?auto_848141 ?auto_848142 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_848200 - SURFACE
      ?auto_848201 - SURFACE
      ?auto_848202 - SURFACE
      ?auto_848204 - SURFACE
      ?auto_848203 - SURFACE
      ?auto_848205 - SURFACE
      ?auto_848206 - SURFACE
    )
    :vars
    (
      ?auto_848210 - HOIST
      ?auto_848208 - PLACE
      ?auto_848211 - PLACE
      ?auto_848209 - HOIST
      ?auto_848212 - SURFACE
      ?auto_848207 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_848210 ?auto_848208 ) ( SURFACE-AT ?auto_848205 ?auto_848208 ) ( CLEAR ?auto_848205 ) ( IS-CRATE ?auto_848206 ) ( not ( = ?auto_848205 ?auto_848206 ) ) ( AVAILABLE ?auto_848210 ) ( ON ?auto_848205 ?auto_848203 ) ( not ( = ?auto_848203 ?auto_848205 ) ) ( not ( = ?auto_848203 ?auto_848206 ) ) ( not ( = ?auto_848211 ?auto_848208 ) ) ( HOIST-AT ?auto_848209 ?auto_848211 ) ( not ( = ?auto_848210 ?auto_848209 ) ) ( AVAILABLE ?auto_848209 ) ( SURFACE-AT ?auto_848206 ?auto_848211 ) ( ON ?auto_848206 ?auto_848212 ) ( CLEAR ?auto_848206 ) ( not ( = ?auto_848205 ?auto_848212 ) ) ( not ( = ?auto_848206 ?auto_848212 ) ) ( not ( = ?auto_848203 ?auto_848212 ) ) ( TRUCK-AT ?auto_848207 ?auto_848208 ) ( ON ?auto_848201 ?auto_848200 ) ( ON ?auto_848202 ?auto_848201 ) ( ON ?auto_848204 ?auto_848202 ) ( ON ?auto_848203 ?auto_848204 ) ( not ( = ?auto_848200 ?auto_848201 ) ) ( not ( = ?auto_848200 ?auto_848202 ) ) ( not ( = ?auto_848200 ?auto_848204 ) ) ( not ( = ?auto_848200 ?auto_848203 ) ) ( not ( = ?auto_848200 ?auto_848205 ) ) ( not ( = ?auto_848200 ?auto_848206 ) ) ( not ( = ?auto_848200 ?auto_848212 ) ) ( not ( = ?auto_848201 ?auto_848202 ) ) ( not ( = ?auto_848201 ?auto_848204 ) ) ( not ( = ?auto_848201 ?auto_848203 ) ) ( not ( = ?auto_848201 ?auto_848205 ) ) ( not ( = ?auto_848201 ?auto_848206 ) ) ( not ( = ?auto_848201 ?auto_848212 ) ) ( not ( = ?auto_848202 ?auto_848204 ) ) ( not ( = ?auto_848202 ?auto_848203 ) ) ( not ( = ?auto_848202 ?auto_848205 ) ) ( not ( = ?auto_848202 ?auto_848206 ) ) ( not ( = ?auto_848202 ?auto_848212 ) ) ( not ( = ?auto_848204 ?auto_848203 ) ) ( not ( = ?auto_848204 ?auto_848205 ) ) ( not ( = ?auto_848204 ?auto_848206 ) ) ( not ( = ?auto_848204 ?auto_848212 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_848203 ?auto_848205 ?auto_848206 )
      ( MAKE-6CRATE-VERIFY ?auto_848200 ?auto_848201 ?auto_848202 ?auto_848204 ?auto_848203 ?auto_848205 ?auto_848206 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_848264 - SURFACE
      ?auto_848265 - SURFACE
      ?auto_848266 - SURFACE
      ?auto_848268 - SURFACE
      ?auto_848267 - SURFACE
      ?auto_848269 - SURFACE
      ?auto_848270 - SURFACE
    )
    :vars
    (
      ?auto_848271 - HOIST
      ?auto_848273 - PLACE
      ?auto_848274 - PLACE
      ?auto_848275 - HOIST
      ?auto_848272 - SURFACE
      ?auto_848276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_848271 ?auto_848273 ) ( IS-CRATE ?auto_848270 ) ( not ( = ?auto_848269 ?auto_848270 ) ) ( not ( = ?auto_848267 ?auto_848269 ) ) ( not ( = ?auto_848267 ?auto_848270 ) ) ( not ( = ?auto_848274 ?auto_848273 ) ) ( HOIST-AT ?auto_848275 ?auto_848274 ) ( not ( = ?auto_848271 ?auto_848275 ) ) ( AVAILABLE ?auto_848275 ) ( SURFACE-AT ?auto_848270 ?auto_848274 ) ( ON ?auto_848270 ?auto_848272 ) ( CLEAR ?auto_848270 ) ( not ( = ?auto_848269 ?auto_848272 ) ) ( not ( = ?auto_848270 ?auto_848272 ) ) ( not ( = ?auto_848267 ?auto_848272 ) ) ( TRUCK-AT ?auto_848276 ?auto_848273 ) ( SURFACE-AT ?auto_848267 ?auto_848273 ) ( CLEAR ?auto_848267 ) ( LIFTING ?auto_848271 ?auto_848269 ) ( IS-CRATE ?auto_848269 ) ( ON ?auto_848265 ?auto_848264 ) ( ON ?auto_848266 ?auto_848265 ) ( ON ?auto_848268 ?auto_848266 ) ( ON ?auto_848267 ?auto_848268 ) ( not ( = ?auto_848264 ?auto_848265 ) ) ( not ( = ?auto_848264 ?auto_848266 ) ) ( not ( = ?auto_848264 ?auto_848268 ) ) ( not ( = ?auto_848264 ?auto_848267 ) ) ( not ( = ?auto_848264 ?auto_848269 ) ) ( not ( = ?auto_848264 ?auto_848270 ) ) ( not ( = ?auto_848264 ?auto_848272 ) ) ( not ( = ?auto_848265 ?auto_848266 ) ) ( not ( = ?auto_848265 ?auto_848268 ) ) ( not ( = ?auto_848265 ?auto_848267 ) ) ( not ( = ?auto_848265 ?auto_848269 ) ) ( not ( = ?auto_848265 ?auto_848270 ) ) ( not ( = ?auto_848265 ?auto_848272 ) ) ( not ( = ?auto_848266 ?auto_848268 ) ) ( not ( = ?auto_848266 ?auto_848267 ) ) ( not ( = ?auto_848266 ?auto_848269 ) ) ( not ( = ?auto_848266 ?auto_848270 ) ) ( not ( = ?auto_848266 ?auto_848272 ) ) ( not ( = ?auto_848268 ?auto_848267 ) ) ( not ( = ?auto_848268 ?auto_848269 ) ) ( not ( = ?auto_848268 ?auto_848270 ) ) ( not ( = ?auto_848268 ?auto_848272 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_848267 ?auto_848269 ?auto_848270 )
      ( MAKE-6CRATE-VERIFY ?auto_848264 ?auto_848265 ?auto_848266 ?auto_848268 ?auto_848267 ?auto_848269 ?auto_848270 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_848328 - SURFACE
      ?auto_848329 - SURFACE
      ?auto_848330 - SURFACE
      ?auto_848332 - SURFACE
      ?auto_848331 - SURFACE
      ?auto_848333 - SURFACE
      ?auto_848334 - SURFACE
    )
    :vars
    (
      ?auto_848335 - HOIST
      ?auto_848337 - PLACE
      ?auto_848339 - PLACE
      ?auto_848340 - HOIST
      ?auto_848338 - SURFACE
      ?auto_848336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_848335 ?auto_848337 ) ( IS-CRATE ?auto_848334 ) ( not ( = ?auto_848333 ?auto_848334 ) ) ( not ( = ?auto_848331 ?auto_848333 ) ) ( not ( = ?auto_848331 ?auto_848334 ) ) ( not ( = ?auto_848339 ?auto_848337 ) ) ( HOIST-AT ?auto_848340 ?auto_848339 ) ( not ( = ?auto_848335 ?auto_848340 ) ) ( AVAILABLE ?auto_848340 ) ( SURFACE-AT ?auto_848334 ?auto_848339 ) ( ON ?auto_848334 ?auto_848338 ) ( CLEAR ?auto_848334 ) ( not ( = ?auto_848333 ?auto_848338 ) ) ( not ( = ?auto_848334 ?auto_848338 ) ) ( not ( = ?auto_848331 ?auto_848338 ) ) ( TRUCK-AT ?auto_848336 ?auto_848337 ) ( SURFACE-AT ?auto_848331 ?auto_848337 ) ( CLEAR ?auto_848331 ) ( IS-CRATE ?auto_848333 ) ( AVAILABLE ?auto_848335 ) ( IN ?auto_848333 ?auto_848336 ) ( ON ?auto_848329 ?auto_848328 ) ( ON ?auto_848330 ?auto_848329 ) ( ON ?auto_848332 ?auto_848330 ) ( ON ?auto_848331 ?auto_848332 ) ( not ( = ?auto_848328 ?auto_848329 ) ) ( not ( = ?auto_848328 ?auto_848330 ) ) ( not ( = ?auto_848328 ?auto_848332 ) ) ( not ( = ?auto_848328 ?auto_848331 ) ) ( not ( = ?auto_848328 ?auto_848333 ) ) ( not ( = ?auto_848328 ?auto_848334 ) ) ( not ( = ?auto_848328 ?auto_848338 ) ) ( not ( = ?auto_848329 ?auto_848330 ) ) ( not ( = ?auto_848329 ?auto_848332 ) ) ( not ( = ?auto_848329 ?auto_848331 ) ) ( not ( = ?auto_848329 ?auto_848333 ) ) ( not ( = ?auto_848329 ?auto_848334 ) ) ( not ( = ?auto_848329 ?auto_848338 ) ) ( not ( = ?auto_848330 ?auto_848332 ) ) ( not ( = ?auto_848330 ?auto_848331 ) ) ( not ( = ?auto_848330 ?auto_848333 ) ) ( not ( = ?auto_848330 ?auto_848334 ) ) ( not ( = ?auto_848330 ?auto_848338 ) ) ( not ( = ?auto_848332 ?auto_848331 ) ) ( not ( = ?auto_848332 ?auto_848333 ) ) ( not ( = ?auto_848332 ?auto_848334 ) ) ( not ( = ?auto_848332 ?auto_848338 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_848331 ?auto_848333 ?auto_848334 )
      ( MAKE-6CRATE-VERIFY ?auto_848328 ?auto_848329 ?auto_848330 ?auto_848332 ?auto_848331 ?auto_848333 ?auto_848334 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_850284 - SURFACE
      ?auto_850285 - SURFACE
      ?auto_850286 - SURFACE
      ?auto_850288 - SURFACE
      ?auto_850287 - SURFACE
      ?auto_850289 - SURFACE
      ?auto_850290 - SURFACE
      ?auto_850291 - SURFACE
    )
    :vars
    (
      ?auto_850293 - HOIST
      ?auto_850292 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_850293 ?auto_850292 ) ( SURFACE-AT ?auto_850290 ?auto_850292 ) ( CLEAR ?auto_850290 ) ( LIFTING ?auto_850293 ?auto_850291 ) ( IS-CRATE ?auto_850291 ) ( not ( = ?auto_850290 ?auto_850291 ) ) ( ON ?auto_850285 ?auto_850284 ) ( ON ?auto_850286 ?auto_850285 ) ( ON ?auto_850288 ?auto_850286 ) ( ON ?auto_850287 ?auto_850288 ) ( ON ?auto_850289 ?auto_850287 ) ( ON ?auto_850290 ?auto_850289 ) ( not ( = ?auto_850284 ?auto_850285 ) ) ( not ( = ?auto_850284 ?auto_850286 ) ) ( not ( = ?auto_850284 ?auto_850288 ) ) ( not ( = ?auto_850284 ?auto_850287 ) ) ( not ( = ?auto_850284 ?auto_850289 ) ) ( not ( = ?auto_850284 ?auto_850290 ) ) ( not ( = ?auto_850284 ?auto_850291 ) ) ( not ( = ?auto_850285 ?auto_850286 ) ) ( not ( = ?auto_850285 ?auto_850288 ) ) ( not ( = ?auto_850285 ?auto_850287 ) ) ( not ( = ?auto_850285 ?auto_850289 ) ) ( not ( = ?auto_850285 ?auto_850290 ) ) ( not ( = ?auto_850285 ?auto_850291 ) ) ( not ( = ?auto_850286 ?auto_850288 ) ) ( not ( = ?auto_850286 ?auto_850287 ) ) ( not ( = ?auto_850286 ?auto_850289 ) ) ( not ( = ?auto_850286 ?auto_850290 ) ) ( not ( = ?auto_850286 ?auto_850291 ) ) ( not ( = ?auto_850288 ?auto_850287 ) ) ( not ( = ?auto_850288 ?auto_850289 ) ) ( not ( = ?auto_850288 ?auto_850290 ) ) ( not ( = ?auto_850288 ?auto_850291 ) ) ( not ( = ?auto_850287 ?auto_850289 ) ) ( not ( = ?auto_850287 ?auto_850290 ) ) ( not ( = ?auto_850287 ?auto_850291 ) ) ( not ( = ?auto_850289 ?auto_850290 ) ) ( not ( = ?auto_850289 ?auto_850291 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_850290 ?auto_850291 )
      ( MAKE-7CRATE-VERIFY ?auto_850284 ?auto_850285 ?auto_850286 ?auto_850288 ?auto_850287 ?auto_850289 ?auto_850290 ?auto_850291 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_850339 - SURFACE
      ?auto_850340 - SURFACE
      ?auto_850341 - SURFACE
      ?auto_850343 - SURFACE
      ?auto_850342 - SURFACE
      ?auto_850344 - SURFACE
      ?auto_850345 - SURFACE
      ?auto_850346 - SURFACE
    )
    :vars
    (
      ?auto_850349 - HOIST
      ?auto_850347 - PLACE
      ?auto_850348 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_850349 ?auto_850347 ) ( SURFACE-AT ?auto_850345 ?auto_850347 ) ( CLEAR ?auto_850345 ) ( IS-CRATE ?auto_850346 ) ( not ( = ?auto_850345 ?auto_850346 ) ) ( TRUCK-AT ?auto_850348 ?auto_850347 ) ( AVAILABLE ?auto_850349 ) ( IN ?auto_850346 ?auto_850348 ) ( ON ?auto_850345 ?auto_850344 ) ( not ( = ?auto_850344 ?auto_850345 ) ) ( not ( = ?auto_850344 ?auto_850346 ) ) ( ON ?auto_850340 ?auto_850339 ) ( ON ?auto_850341 ?auto_850340 ) ( ON ?auto_850343 ?auto_850341 ) ( ON ?auto_850342 ?auto_850343 ) ( ON ?auto_850344 ?auto_850342 ) ( not ( = ?auto_850339 ?auto_850340 ) ) ( not ( = ?auto_850339 ?auto_850341 ) ) ( not ( = ?auto_850339 ?auto_850343 ) ) ( not ( = ?auto_850339 ?auto_850342 ) ) ( not ( = ?auto_850339 ?auto_850344 ) ) ( not ( = ?auto_850339 ?auto_850345 ) ) ( not ( = ?auto_850339 ?auto_850346 ) ) ( not ( = ?auto_850340 ?auto_850341 ) ) ( not ( = ?auto_850340 ?auto_850343 ) ) ( not ( = ?auto_850340 ?auto_850342 ) ) ( not ( = ?auto_850340 ?auto_850344 ) ) ( not ( = ?auto_850340 ?auto_850345 ) ) ( not ( = ?auto_850340 ?auto_850346 ) ) ( not ( = ?auto_850341 ?auto_850343 ) ) ( not ( = ?auto_850341 ?auto_850342 ) ) ( not ( = ?auto_850341 ?auto_850344 ) ) ( not ( = ?auto_850341 ?auto_850345 ) ) ( not ( = ?auto_850341 ?auto_850346 ) ) ( not ( = ?auto_850343 ?auto_850342 ) ) ( not ( = ?auto_850343 ?auto_850344 ) ) ( not ( = ?auto_850343 ?auto_850345 ) ) ( not ( = ?auto_850343 ?auto_850346 ) ) ( not ( = ?auto_850342 ?auto_850344 ) ) ( not ( = ?auto_850342 ?auto_850345 ) ) ( not ( = ?auto_850342 ?auto_850346 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_850344 ?auto_850345 ?auto_850346 )
      ( MAKE-7CRATE-VERIFY ?auto_850339 ?auto_850340 ?auto_850341 ?auto_850343 ?auto_850342 ?auto_850344 ?auto_850345 ?auto_850346 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_850402 - SURFACE
      ?auto_850403 - SURFACE
      ?auto_850404 - SURFACE
      ?auto_850406 - SURFACE
      ?auto_850405 - SURFACE
      ?auto_850407 - SURFACE
      ?auto_850408 - SURFACE
      ?auto_850409 - SURFACE
    )
    :vars
    (
      ?auto_850411 - HOIST
      ?auto_850413 - PLACE
      ?auto_850410 - TRUCK
      ?auto_850412 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_850411 ?auto_850413 ) ( SURFACE-AT ?auto_850408 ?auto_850413 ) ( CLEAR ?auto_850408 ) ( IS-CRATE ?auto_850409 ) ( not ( = ?auto_850408 ?auto_850409 ) ) ( AVAILABLE ?auto_850411 ) ( IN ?auto_850409 ?auto_850410 ) ( ON ?auto_850408 ?auto_850407 ) ( not ( = ?auto_850407 ?auto_850408 ) ) ( not ( = ?auto_850407 ?auto_850409 ) ) ( TRUCK-AT ?auto_850410 ?auto_850412 ) ( not ( = ?auto_850412 ?auto_850413 ) ) ( ON ?auto_850403 ?auto_850402 ) ( ON ?auto_850404 ?auto_850403 ) ( ON ?auto_850406 ?auto_850404 ) ( ON ?auto_850405 ?auto_850406 ) ( ON ?auto_850407 ?auto_850405 ) ( not ( = ?auto_850402 ?auto_850403 ) ) ( not ( = ?auto_850402 ?auto_850404 ) ) ( not ( = ?auto_850402 ?auto_850406 ) ) ( not ( = ?auto_850402 ?auto_850405 ) ) ( not ( = ?auto_850402 ?auto_850407 ) ) ( not ( = ?auto_850402 ?auto_850408 ) ) ( not ( = ?auto_850402 ?auto_850409 ) ) ( not ( = ?auto_850403 ?auto_850404 ) ) ( not ( = ?auto_850403 ?auto_850406 ) ) ( not ( = ?auto_850403 ?auto_850405 ) ) ( not ( = ?auto_850403 ?auto_850407 ) ) ( not ( = ?auto_850403 ?auto_850408 ) ) ( not ( = ?auto_850403 ?auto_850409 ) ) ( not ( = ?auto_850404 ?auto_850406 ) ) ( not ( = ?auto_850404 ?auto_850405 ) ) ( not ( = ?auto_850404 ?auto_850407 ) ) ( not ( = ?auto_850404 ?auto_850408 ) ) ( not ( = ?auto_850404 ?auto_850409 ) ) ( not ( = ?auto_850406 ?auto_850405 ) ) ( not ( = ?auto_850406 ?auto_850407 ) ) ( not ( = ?auto_850406 ?auto_850408 ) ) ( not ( = ?auto_850406 ?auto_850409 ) ) ( not ( = ?auto_850405 ?auto_850407 ) ) ( not ( = ?auto_850405 ?auto_850408 ) ) ( not ( = ?auto_850405 ?auto_850409 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_850407 ?auto_850408 ?auto_850409 )
      ( MAKE-7CRATE-VERIFY ?auto_850402 ?auto_850403 ?auto_850404 ?auto_850406 ?auto_850405 ?auto_850407 ?auto_850408 ?auto_850409 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_850472 - SURFACE
      ?auto_850473 - SURFACE
      ?auto_850474 - SURFACE
      ?auto_850476 - SURFACE
      ?auto_850475 - SURFACE
      ?auto_850477 - SURFACE
      ?auto_850478 - SURFACE
      ?auto_850479 - SURFACE
    )
    :vars
    (
      ?auto_850482 - HOIST
      ?auto_850483 - PLACE
      ?auto_850484 - TRUCK
      ?auto_850481 - PLACE
      ?auto_850480 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_850482 ?auto_850483 ) ( SURFACE-AT ?auto_850478 ?auto_850483 ) ( CLEAR ?auto_850478 ) ( IS-CRATE ?auto_850479 ) ( not ( = ?auto_850478 ?auto_850479 ) ) ( AVAILABLE ?auto_850482 ) ( ON ?auto_850478 ?auto_850477 ) ( not ( = ?auto_850477 ?auto_850478 ) ) ( not ( = ?auto_850477 ?auto_850479 ) ) ( TRUCK-AT ?auto_850484 ?auto_850481 ) ( not ( = ?auto_850481 ?auto_850483 ) ) ( HOIST-AT ?auto_850480 ?auto_850481 ) ( LIFTING ?auto_850480 ?auto_850479 ) ( not ( = ?auto_850482 ?auto_850480 ) ) ( ON ?auto_850473 ?auto_850472 ) ( ON ?auto_850474 ?auto_850473 ) ( ON ?auto_850476 ?auto_850474 ) ( ON ?auto_850475 ?auto_850476 ) ( ON ?auto_850477 ?auto_850475 ) ( not ( = ?auto_850472 ?auto_850473 ) ) ( not ( = ?auto_850472 ?auto_850474 ) ) ( not ( = ?auto_850472 ?auto_850476 ) ) ( not ( = ?auto_850472 ?auto_850475 ) ) ( not ( = ?auto_850472 ?auto_850477 ) ) ( not ( = ?auto_850472 ?auto_850478 ) ) ( not ( = ?auto_850472 ?auto_850479 ) ) ( not ( = ?auto_850473 ?auto_850474 ) ) ( not ( = ?auto_850473 ?auto_850476 ) ) ( not ( = ?auto_850473 ?auto_850475 ) ) ( not ( = ?auto_850473 ?auto_850477 ) ) ( not ( = ?auto_850473 ?auto_850478 ) ) ( not ( = ?auto_850473 ?auto_850479 ) ) ( not ( = ?auto_850474 ?auto_850476 ) ) ( not ( = ?auto_850474 ?auto_850475 ) ) ( not ( = ?auto_850474 ?auto_850477 ) ) ( not ( = ?auto_850474 ?auto_850478 ) ) ( not ( = ?auto_850474 ?auto_850479 ) ) ( not ( = ?auto_850476 ?auto_850475 ) ) ( not ( = ?auto_850476 ?auto_850477 ) ) ( not ( = ?auto_850476 ?auto_850478 ) ) ( not ( = ?auto_850476 ?auto_850479 ) ) ( not ( = ?auto_850475 ?auto_850477 ) ) ( not ( = ?auto_850475 ?auto_850478 ) ) ( not ( = ?auto_850475 ?auto_850479 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_850477 ?auto_850478 ?auto_850479 )
      ( MAKE-7CRATE-VERIFY ?auto_850472 ?auto_850473 ?auto_850474 ?auto_850476 ?auto_850475 ?auto_850477 ?auto_850478 ?auto_850479 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_850549 - SURFACE
      ?auto_850550 - SURFACE
      ?auto_850551 - SURFACE
      ?auto_850553 - SURFACE
      ?auto_850552 - SURFACE
      ?auto_850554 - SURFACE
      ?auto_850555 - SURFACE
      ?auto_850556 - SURFACE
    )
    :vars
    (
      ?auto_850562 - HOIST
      ?auto_850561 - PLACE
      ?auto_850557 - TRUCK
      ?auto_850560 - PLACE
      ?auto_850558 - HOIST
      ?auto_850559 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_850562 ?auto_850561 ) ( SURFACE-AT ?auto_850555 ?auto_850561 ) ( CLEAR ?auto_850555 ) ( IS-CRATE ?auto_850556 ) ( not ( = ?auto_850555 ?auto_850556 ) ) ( AVAILABLE ?auto_850562 ) ( ON ?auto_850555 ?auto_850554 ) ( not ( = ?auto_850554 ?auto_850555 ) ) ( not ( = ?auto_850554 ?auto_850556 ) ) ( TRUCK-AT ?auto_850557 ?auto_850560 ) ( not ( = ?auto_850560 ?auto_850561 ) ) ( HOIST-AT ?auto_850558 ?auto_850560 ) ( not ( = ?auto_850562 ?auto_850558 ) ) ( AVAILABLE ?auto_850558 ) ( SURFACE-AT ?auto_850556 ?auto_850560 ) ( ON ?auto_850556 ?auto_850559 ) ( CLEAR ?auto_850556 ) ( not ( = ?auto_850555 ?auto_850559 ) ) ( not ( = ?auto_850556 ?auto_850559 ) ) ( not ( = ?auto_850554 ?auto_850559 ) ) ( ON ?auto_850550 ?auto_850549 ) ( ON ?auto_850551 ?auto_850550 ) ( ON ?auto_850553 ?auto_850551 ) ( ON ?auto_850552 ?auto_850553 ) ( ON ?auto_850554 ?auto_850552 ) ( not ( = ?auto_850549 ?auto_850550 ) ) ( not ( = ?auto_850549 ?auto_850551 ) ) ( not ( = ?auto_850549 ?auto_850553 ) ) ( not ( = ?auto_850549 ?auto_850552 ) ) ( not ( = ?auto_850549 ?auto_850554 ) ) ( not ( = ?auto_850549 ?auto_850555 ) ) ( not ( = ?auto_850549 ?auto_850556 ) ) ( not ( = ?auto_850549 ?auto_850559 ) ) ( not ( = ?auto_850550 ?auto_850551 ) ) ( not ( = ?auto_850550 ?auto_850553 ) ) ( not ( = ?auto_850550 ?auto_850552 ) ) ( not ( = ?auto_850550 ?auto_850554 ) ) ( not ( = ?auto_850550 ?auto_850555 ) ) ( not ( = ?auto_850550 ?auto_850556 ) ) ( not ( = ?auto_850550 ?auto_850559 ) ) ( not ( = ?auto_850551 ?auto_850553 ) ) ( not ( = ?auto_850551 ?auto_850552 ) ) ( not ( = ?auto_850551 ?auto_850554 ) ) ( not ( = ?auto_850551 ?auto_850555 ) ) ( not ( = ?auto_850551 ?auto_850556 ) ) ( not ( = ?auto_850551 ?auto_850559 ) ) ( not ( = ?auto_850553 ?auto_850552 ) ) ( not ( = ?auto_850553 ?auto_850554 ) ) ( not ( = ?auto_850553 ?auto_850555 ) ) ( not ( = ?auto_850553 ?auto_850556 ) ) ( not ( = ?auto_850553 ?auto_850559 ) ) ( not ( = ?auto_850552 ?auto_850554 ) ) ( not ( = ?auto_850552 ?auto_850555 ) ) ( not ( = ?auto_850552 ?auto_850556 ) ) ( not ( = ?auto_850552 ?auto_850559 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_850554 ?auto_850555 ?auto_850556 )
      ( MAKE-7CRATE-VERIFY ?auto_850549 ?auto_850550 ?auto_850551 ?auto_850553 ?auto_850552 ?auto_850554 ?auto_850555 ?auto_850556 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_850627 - SURFACE
      ?auto_850628 - SURFACE
      ?auto_850629 - SURFACE
      ?auto_850631 - SURFACE
      ?auto_850630 - SURFACE
      ?auto_850632 - SURFACE
      ?auto_850633 - SURFACE
      ?auto_850634 - SURFACE
    )
    :vars
    (
      ?auto_850635 - HOIST
      ?auto_850637 - PLACE
      ?auto_850639 - PLACE
      ?auto_850636 - HOIST
      ?auto_850638 - SURFACE
      ?auto_850640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_850635 ?auto_850637 ) ( SURFACE-AT ?auto_850633 ?auto_850637 ) ( CLEAR ?auto_850633 ) ( IS-CRATE ?auto_850634 ) ( not ( = ?auto_850633 ?auto_850634 ) ) ( AVAILABLE ?auto_850635 ) ( ON ?auto_850633 ?auto_850632 ) ( not ( = ?auto_850632 ?auto_850633 ) ) ( not ( = ?auto_850632 ?auto_850634 ) ) ( not ( = ?auto_850639 ?auto_850637 ) ) ( HOIST-AT ?auto_850636 ?auto_850639 ) ( not ( = ?auto_850635 ?auto_850636 ) ) ( AVAILABLE ?auto_850636 ) ( SURFACE-AT ?auto_850634 ?auto_850639 ) ( ON ?auto_850634 ?auto_850638 ) ( CLEAR ?auto_850634 ) ( not ( = ?auto_850633 ?auto_850638 ) ) ( not ( = ?auto_850634 ?auto_850638 ) ) ( not ( = ?auto_850632 ?auto_850638 ) ) ( TRUCK-AT ?auto_850640 ?auto_850637 ) ( ON ?auto_850628 ?auto_850627 ) ( ON ?auto_850629 ?auto_850628 ) ( ON ?auto_850631 ?auto_850629 ) ( ON ?auto_850630 ?auto_850631 ) ( ON ?auto_850632 ?auto_850630 ) ( not ( = ?auto_850627 ?auto_850628 ) ) ( not ( = ?auto_850627 ?auto_850629 ) ) ( not ( = ?auto_850627 ?auto_850631 ) ) ( not ( = ?auto_850627 ?auto_850630 ) ) ( not ( = ?auto_850627 ?auto_850632 ) ) ( not ( = ?auto_850627 ?auto_850633 ) ) ( not ( = ?auto_850627 ?auto_850634 ) ) ( not ( = ?auto_850627 ?auto_850638 ) ) ( not ( = ?auto_850628 ?auto_850629 ) ) ( not ( = ?auto_850628 ?auto_850631 ) ) ( not ( = ?auto_850628 ?auto_850630 ) ) ( not ( = ?auto_850628 ?auto_850632 ) ) ( not ( = ?auto_850628 ?auto_850633 ) ) ( not ( = ?auto_850628 ?auto_850634 ) ) ( not ( = ?auto_850628 ?auto_850638 ) ) ( not ( = ?auto_850629 ?auto_850631 ) ) ( not ( = ?auto_850629 ?auto_850630 ) ) ( not ( = ?auto_850629 ?auto_850632 ) ) ( not ( = ?auto_850629 ?auto_850633 ) ) ( not ( = ?auto_850629 ?auto_850634 ) ) ( not ( = ?auto_850629 ?auto_850638 ) ) ( not ( = ?auto_850631 ?auto_850630 ) ) ( not ( = ?auto_850631 ?auto_850632 ) ) ( not ( = ?auto_850631 ?auto_850633 ) ) ( not ( = ?auto_850631 ?auto_850634 ) ) ( not ( = ?auto_850631 ?auto_850638 ) ) ( not ( = ?auto_850630 ?auto_850632 ) ) ( not ( = ?auto_850630 ?auto_850633 ) ) ( not ( = ?auto_850630 ?auto_850634 ) ) ( not ( = ?auto_850630 ?auto_850638 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_850632 ?auto_850633 ?auto_850634 )
      ( MAKE-7CRATE-VERIFY ?auto_850627 ?auto_850628 ?auto_850629 ?auto_850631 ?auto_850630 ?auto_850632 ?auto_850633 ?auto_850634 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_850705 - SURFACE
      ?auto_850706 - SURFACE
      ?auto_850707 - SURFACE
      ?auto_850709 - SURFACE
      ?auto_850708 - SURFACE
      ?auto_850710 - SURFACE
      ?auto_850711 - SURFACE
      ?auto_850712 - SURFACE
    )
    :vars
    (
      ?auto_850718 - HOIST
      ?auto_850717 - PLACE
      ?auto_850715 - PLACE
      ?auto_850714 - HOIST
      ?auto_850713 - SURFACE
      ?auto_850716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_850718 ?auto_850717 ) ( IS-CRATE ?auto_850712 ) ( not ( = ?auto_850711 ?auto_850712 ) ) ( not ( = ?auto_850710 ?auto_850711 ) ) ( not ( = ?auto_850710 ?auto_850712 ) ) ( not ( = ?auto_850715 ?auto_850717 ) ) ( HOIST-AT ?auto_850714 ?auto_850715 ) ( not ( = ?auto_850718 ?auto_850714 ) ) ( AVAILABLE ?auto_850714 ) ( SURFACE-AT ?auto_850712 ?auto_850715 ) ( ON ?auto_850712 ?auto_850713 ) ( CLEAR ?auto_850712 ) ( not ( = ?auto_850711 ?auto_850713 ) ) ( not ( = ?auto_850712 ?auto_850713 ) ) ( not ( = ?auto_850710 ?auto_850713 ) ) ( TRUCK-AT ?auto_850716 ?auto_850717 ) ( SURFACE-AT ?auto_850710 ?auto_850717 ) ( CLEAR ?auto_850710 ) ( LIFTING ?auto_850718 ?auto_850711 ) ( IS-CRATE ?auto_850711 ) ( ON ?auto_850706 ?auto_850705 ) ( ON ?auto_850707 ?auto_850706 ) ( ON ?auto_850709 ?auto_850707 ) ( ON ?auto_850708 ?auto_850709 ) ( ON ?auto_850710 ?auto_850708 ) ( not ( = ?auto_850705 ?auto_850706 ) ) ( not ( = ?auto_850705 ?auto_850707 ) ) ( not ( = ?auto_850705 ?auto_850709 ) ) ( not ( = ?auto_850705 ?auto_850708 ) ) ( not ( = ?auto_850705 ?auto_850710 ) ) ( not ( = ?auto_850705 ?auto_850711 ) ) ( not ( = ?auto_850705 ?auto_850712 ) ) ( not ( = ?auto_850705 ?auto_850713 ) ) ( not ( = ?auto_850706 ?auto_850707 ) ) ( not ( = ?auto_850706 ?auto_850709 ) ) ( not ( = ?auto_850706 ?auto_850708 ) ) ( not ( = ?auto_850706 ?auto_850710 ) ) ( not ( = ?auto_850706 ?auto_850711 ) ) ( not ( = ?auto_850706 ?auto_850712 ) ) ( not ( = ?auto_850706 ?auto_850713 ) ) ( not ( = ?auto_850707 ?auto_850709 ) ) ( not ( = ?auto_850707 ?auto_850708 ) ) ( not ( = ?auto_850707 ?auto_850710 ) ) ( not ( = ?auto_850707 ?auto_850711 ) ) ( not ( = ?auto_850707 ?auto_850712 ) ) ( not ( = ?auto_850707 ?auto_850713 ) ) ( not ( = ?auto_850709 ?auto_850708 ) ) ( not ( = ?auto_850709 ?auto_850710 ) ) ( not ( = ?auto_850709 ?auto_850711 ) ) ( not ( = ?auto_850709 ?auto_850712 ) ) ( not ( = ?auto_850709 ?auto_850713 ) ) ( not ( = ?auto_850708 ?auto_850710 ) ) ( not ( = ?auto_850708 ?auto_850711 ) ) ( not ( = ?auto_850708 ?auto_850712 ) ) ( not ( = ?auto_850708 ?auto_850713 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_850710 ?auto_850711 ?auto_850712 )
      ( MAKE-7CRATE-VERIFY ?auto_850705 ?auto_850706 ?auto_850707 ?auto_850709 ?auto_850708 ?auto_850710 ?auto_850711 ?auto_850712 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_850783 - SURFACE
      ?auto_850784 - SURFACE
      ?auto_850785 - SURFACE
      ?auto_850787 - SURFACE
      ?auto_850786 - SURFACE
      ?auto_850788 - SURFACE
      ?auto_850789 - SURFACE
      ?auto_850790 - SURFACE
    )
    :vars
    (
      ?auto_850794 - HOIST
      ?auto_850793 - PLACE
      ?auto_850795 - PLACE
      ?auto_850792 - HOIST
      ?auto_850796 - SURFACE
      ?auto_850791 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_850794 ?auto_850793 ) ( IS-CRATE ?auto_850790 ) ( not ( = ?auto_850789 ?auto_850790 ) ) ( not ( = ?auto_850788 ?auto_850789 ) ) ( not ( = ?auto_850788 ?auto_850790 ) ) ( not ( = ?auto_850795 ?auto_850793 ) ) ( HOIST-AT ?auto_850792 ?auto_850795 ) ( not ( = ?auto_850794 ?auto_850792 ) ) ( AVAILABLE ?auto_850792 ) ( SURFACE-AT ?auto_850790 ?auto_850795 ) ( ON ?auto_850790 ?auto_850796 ) ( CLEAR ?auto_850790 ) ( not ( = ?auto_850789 ?auto_850796 ) ) ( not ( = ?auto_850790 ?auto_850796 ) ) ( not ( = ?auto_850788 ?auto_850796 ) ) ( TRUCK-AT ?auto_850791 ?auto_850793 ) ( SURFACE-AT ?auto_850788 ?auto_850793 ) ( CLEAR ?auto_850788 ) ( IS-CRATE ?auto_850789 ) ( AVAILABLE ?auto_850794 ) ( IN ?auto_850789 ?auto_850791 ) ( ON ?auto_850784 ?auto_850783 ) ( ON ?auto_850785 ?auto_850784 ) ( ON ?auto_850787 ?auto_850785 ) ( ON ?auto_850786 ?auto_850787 ) ( ON ?auto_850788 ?auto_850786 ) ( not ( = ?auto_850783 ?auto_850784 ) ) ( not ( = ?auto_850783 ?auto_850785 ) ) ( not ( = ?auto_850783 ?auto_850787 ) ) ( not ( = ?auto_850783 ?auto_850786 ) ) ( not ( = ?auto_850783 ?auto_850788 ) ) ( not ( = ?auto_850783 ?auto_850789 ) ) ( not ( = ?auto_850783 ?auto_850790 ) ) ( not ( = ?auto_850783 ?auto_850796 ) ) ( not ( = ?auto_850784 ?auto_850785 ) ) ( not ( = ?auto_850784 ?auto_850787 ) ) ( not ( = ?auto_850784 ?auto_850786 ) ) ( not ( = ?auto_850784 ?auto_850788 ) ) ( not ( = ?auto_850784 ?auto_850789 ) ) ( not ( = ?auto_850784 ?auto_850790 ) ) ( not ( = ?auto_850784 ?auto_850796 ) ) ( not ( = ?auto_850785 ?auto_850787 ) ) ( not ( = ?auto_850785 ?auto_850786 ) ) ( not ( = ?auto_850785 ?auto_850788 ) ) ( not ( = ?auto_850785 ?auto_850789 ) ) ( not ( = ?auto_850785 ?auto_850790 ) ) ( not ( = ?auto_850785 ?auto_850796 ) ) ( not ( = ?auto_850787 ?auto_850786 ) ) ( not ( = ?auto_850787 ?auto_850788 ) ) ( not ( = ?auto_850787 ?auto_850789 ) ) ( not ( = ?auto_850787 ?auto_850790 ) ) ( not ( = ?auto_850787 ?auto_850796 ) ) ( not ( = ?auto_850786 ?auto_850788 ) ) ( not ( = ?auto_850786 ?auto_850789 ) ) ( not ( = ?auto_850786 ?auto_850790 ) ) ( not ( = ?auto_850786 ?auto_850796 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_850788 ?auto_850789 ?auto_850790 )
      ( MAKE-7CRATE-VERIFY ?auto_850783 ?auto_850784 ?auto_850785 ?auto_850787 ?auto_850786 ?auto_850788 ?auto_850789 ?auto_850790 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_852358 - SURFACE
      ?auto_852359 - SURFACE
    )
    :vars
    (
      ?auto_852363 - HOIST
      ?auto_852366 - PLACE
      ?auto_852360 - SURFACE
      ?auto_852364 - TRUCK
      ?auto_852365 - PLACE
      ?auto_852362 - HOIST
      ?auto_852361 - SURFACE
      ?auto_852367 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_852363 ?auto_852366 ) ( SURFACE-AT ?auto_852358 ?auto_852366 ) ( CLEAR ?auto_852358 ) ( IS-CRATE ?auto_852359 ) ( not ( = ?auto_852358 ?auto_852359 ) ) ( AVAILABLE ?auto_852363 ) ( ON ?auto_852358 ?auto_852360 ) ( not ( = ?auto_852360 ?auto_852358 ) ) ( not ( = ?auto_852360 ?auto_852359 ) ) ( TRUCK-AT ?auto_852364 ?auto_852365 ) ( not ( = ?auto_852365 ?auto_852366 ) ) ( HOIST-AT ?auto_852362 ?auto_852365 ) ( not ( = ?auto_852363 ?auto_852362 ) ) ( SURFACE-AT ?auto_852359 ?auto_852365 ) ( ON ?auto_852359 ?auto_852361 ) ( CLEAR ?auto_852359 ) ( not ( = ?auto_852358 ?auto_852361 ) ) ( not ( = ?auto_852359 ?auto_852361 ) ) ( not ( = ?auto_852360 ?auto_852361 ) ) ( LIFTING ?auto_852362 ?auto_852367 ) ( IS-CRATE ?auto_852367 ) ( not ( = ?auto_852358 ?auto_852367 ) ) ( not ( = ?auto_852359 ?auto_852367 ) ) ( not ( = ?auto_852360 ?auto_852367 ) ) ( not ( = ?auto_852361 ?auto_852367 ) ) )
    :subtasks
    ( ( !LOAD ?auto_852362 ?auto_852367 ?auto_852364 ?auto_852365 )
      ( MAKE-1CRATE ?auto_852358 ?auto_852359 )
      ( MAKE-1CRATE-VERIFY ?auto_852358 ?auto_852359 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_853694 - SURFACE
      ?auto_853695 - SURFACE
      ?auto_853696 - SURFACE
      ?auto_853698 - SURFACE
      ?auto_853697 - SURFACE
      ?auto_853699 - SURFACE
      ?auto_853700 - SURFACE
      ?auto_853701 - SURFACE
      ?auto_853702 - SURFACE
    )
    :vars
    (
      ?auto_853703 - HOIST
      ?auto_853704 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_853703 ?auto_853704 ) ( SURFACE-AT ?auto_853701 ?auto_853704 ) ( CLEAR ?auto_853701 ) ( LIFTING ?auto_853703 ?auto_853702 ) ( IS-CRATE ?auto_853702 ) ( not ( = ?auto_853701 ?auto_853702 ) ) ( ON ?auto_853695 ?auto_853694 ) ( ON ?auto_853696 ?auto_853695 ) ( ON ?auto_853698 ?auto_853696 ) ( ON ?auto_853697 ?auto_853698 ) ( ON ?auto_853699 ?auto_853697 ) ( ON ?auto_853700 ?auto_853699 ) ( ON ?auto_853701 ?auto_853700 ) ( not ( = ?auto_853694 ?auto_853695 ) ) ( not ( = ?auto_853694 ?auto_853696 ) ) ( not ( = ?auto_853694 ?auto_853698 ) ) ( not ( = ?auto_853694 ?auto_853697 ) ) ( not ( = ?auto_853694 ?auto_853699 ) ) ( not ( = ?auto_853694 ?auto_853700 ) ) ( not ( = ?auto_853694 ?auto_853701 ) ) ( not ( = ?auto_853694 ?auto_853702 ) ) ( not ( = ?auto_853695 ?auto_853696 ) ) ( not ( = ?auto_853695 ?auto_853698 ) ) ( not ( = ?auto_853695 ?auto_853697 ) ) ( not ( = ?auto_853695 ?auto_853699 ) ) ( not ( = ?auto_853695 ?auto_853700 ) ) ( not ( = ?auto_853695 ?auto_853701 ) ) ( not ( = ?auto_853695 ?auto_853702 ) ) ( not ( = ?auto_853696 ?auto_853698 ) ) ( not ( = ?auto_853696 ?auto_853697 ) ) ( not ( = ?auto_853696 ?auto_853699 ) ) ( not ( = ?auto_853696 ?auto_853700 ) ) ( not ( = ?auto_853696 ?auto_853701 ) ) ( not ( = ?auto_853696 ?auto_853702 ) ) ( not ( = ?auto_853698 ?auto_853697 ) ) ( not ( = ?auto_853698 ?auto_853699 ) ) ( not ( = ?auto_853698 ?auto_853700 ) ) ( not ( = ?auto_853698 ?auto_853701 ) ) ( not ( = ?auto_853698 ?auto_853702 ) ) ( not ( = ?auto_853697 ?auto_853699 ) ) ( not ( = ?auto_853697 ?auto_853700 ) ) ( not ( = ?auto_853697 ?auto_853701 ) ) ( not ( = ?auto_853697 ?auto_853702 ) ) ( not ( = ?auto_853699 ?auto_853700 ) ) ( not ( = ?auto_853699 ?auto_853701 ) ) ( not ( = ?auto_853699 ?auto_853702 ) ) ( not ( = ?auto_853700 ?auto_853701 ) ) ( not ( = ?auto_853700 ?auto_853702 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_853701 ?auto_853702 )
      ( MAKE-8CRATE-VERIFY ?auto_853694 ?auto_853695 ?auto_853696 ?auto_853698 ?auto_853697 ?auto_853699 ?auto_853700 ?auto_853701 ?auto_853702 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_853761 - SURFACE
      ?auto_853762 - SURFACE
      ?auto_853763 - SURFACE
      ?auto_853765 - SURFACE
      ?auto_853764 - SURFACE
      ?auto_853766 - SURFACE
      ?auto_853767 - SURFACE
      ?auto_853768 - SURFACE
      ?auto_853769 - SURFACE
    )
    :vars
    (
      ?auto_853771 - HOIST
      ?auto_853772 - PLACE
      ?auto_853770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_853771 ?auto_853772 ) ( SURFACE-AT ?auto_853768 ?auto_853772 ) ( CLEAR ?auto_853768 ) ( IS-CRATE ?auto_853769 ) ( not ( = ?auto_853768 ?auto_853769 ) ) ( TRUCK-AT ?auto_853770 ?auto_853772 ) ( AVAILABLE ?auto_853771 ) ( IN ?auto_853769 ?auto_853770 ) ( ON ?auto_853768 ?auto_853767 ) ( not ( = ?auto_853767 ?auto_853768 ) ) ( not ( = ?auto_853767 ?auto_853769 ) ) ( ON ?auto_853762 ?auto_853761 ) ( ON ?auto_853763 ?auto_853762 ) ( ON ?auto_853765 ?auto_853763 ) ( ON ?auto_853764 ?auto_853765 ) ( ON ?auto_853766 ?auto_853764 ) ( ON ?auto_853767 ?auto_853766 ) ( not ( = ?auto_853761 ?auto_853762 ) ) ( not ( = ?auto_853761 ?auto_853763 ) ) ( not ( = ?auto_853761 ?auto_853765 ) ) ( not ( = ?auto_853761 ?auto_853764 ) ) ( not ( = ?auto_853761 ?auto_853766 ) ) ( not ( = ?auto_853761 ?auto_853767 ) ) ( not ( = ?auto_853761 ?auto_853768 ) ) ( not ( = ?auto_853761 ?auto_853769 ) ) ( not ( = ?auto_853762 ?auto_853763 ) ) ( not ( = ?auto_853762 ?auto_853765 ) ) ( not ( = ?auto_853762 ?auto_853764 ) ) ( not ( = ?auto_853762 ?auto_853766 ) ) ( not ( = ?auto_853762 ?auto_853767 ) ) ( not ( = ?auto_853762 ?auto_853768 ) ) ( not ( = ?auto_853762 ?auto_853769 ) ) ( not ( = ?auto_853763 ?auto_853765 ) ) ( not ( = ?auto_853763 ?auto_853764 ) ) ( not ( = ?auto_853763 ?auto_853766 ) ) ( not ( = ?auto_853763 ?auto_853767 ) ) ( not ( = ?auto_853763 ?auto_853768 ) ) ( not ( = ?auto_853763 ?auto_853769 ) ) ( not ( = ?auto_853765 ?auto_853764 ) ) ( not ( = ?auto_853765 ?auto_853766 ) ) ( not ( = ?auto_853765 ?auto_853767 ) ) ( not ( = ?auto_853765 ?auto_853768 ) ) ( not ( = ?auto_853765 ?auto_853769 ) ) ( not ( = ?auto_853764 ?auto_853766 ) ) ( not ( = ?auto_853764 ?auto_853767 ) ) ( not ( = ?auto_853764 ?auto_853768 ) ) ( not ( = ?auto_853764 ?auto_853769 ) ) ( not ( = ?auto_853766 ?auto_853767 ) ) ( not ( = ?auto_853766 ?auto_853768 ) ) ( not ( = ?auto_853766 ?auto_853769 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_853767 ?auto_853768 ?auto_853769 )
      ( MAKE-8CRATE-VERIFY ?auto_853761 ?auto_853762 ?auto_853763 ?auto_853765 ?auto_853764 ?auto_853766 ?auto_853767 ?auto_853768 ?auto_853769 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_853837 - SURFACE
      ?auto_853838 - SURFACE
      ?auto_853839 - SURFACE
      ?auto_853841 - SURFACE
      ?auto_853840 - SURFACE
      ?auto_853842 - SURFACE
      ?auto_853843 - SURFACE
      ?auto_853844 - SURFACE
      ?auto_853845 - SURFACE
    )
    :vars
    (
      ?auto_853849 - HOIST
      ?auto_853848 - PLACE
      ?auto_853846 - TRUCK
      ?auto_853847 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_853849 ?auto_853848 ) ( SURFACE-AT ?auto_853844 ?auto_853848 ) ( CLEAR ?auto_853844 ) ( IS-CRATE ?auto_853845 ) ( not ( = ?auto_853844 ?auto_853845 ) ) ( AVAILABLE ?auto_853849 ) ( IN ?auto_853845 ?auto_853846 ) ( ON ?auto_853844 ?auto_853843 ) ( not ( = ?auto_853843 ?auto_853844 ) ) ( not ( = ?auto_853843 ?auto_853845 ) ) ( TRUCK-AT ?auto_853846 ?auto_853847 ) ( not ( = ?auto_853847 ?auto_853848 ) ) ( ON ?auto_853838 ?auto_853837 ) ( ON ?auto_853839 ?auto_853838 ) ( ON ?auto_853841 ?auto_853839 ) ( ON ?auto_853840 ?auto_853841 ) ( ON ?auto_853842 ?auto_853840 ) ( ON ?auto_853843 ?auto_853842 ) ( not ( = ?auto_853837 ?auto_853838 ) ) ( not ( = ?auto_853837 ?auto_853839 ) ) ( not ( = ?auto_853837 ?auto_853841 ) ) ( not ( = ?auto_853837 ?auto_853840 ) ) ( not ( = ?auto_853837 ?auto_853842 ) ) ( not ( = ?auto_853837 ?auto_853843 ) ) ( not ( = ?auto_853837 ?auto_853844 ) ) ( not ( = ?auto_853837 ?auto_853845 ) ) ( not ( = ?auto_853838 ?auto_853839 ) ) ( not ( = ?auto_853838 ?auto_853841 ) ) ( not ( = ?auto_853838 ?auto_853840 ) ) ( not ( = ?auto_853838 ?auto_853842 ) ) ( not ( = ?auto_853838 ?auto_853843 ) ) ( not ( = ?auto_853838 ?auto_853844 ) ) ( not ( = ?auto_853838 ?auto_853845 ) ) ( not ( = ?auto_853839 ?auto_853841 ) ) ( not ( = ?auto_853839 ?auto_853840 ) ) ( not ( = ?auto_853839 ?auto_853842 ) ) ( not ( = ?auto_853839 ?auto_853843 ) ) ( not ( = ?auto_853839 ?auto_853844 ) ) ( not ( = ?auto_853839 ?auto_853845 ) ) ( not ( = ?auto_853841 ?auto_853840 ) ) ( not ( = ?auto_853841 ?auto_853842 ) ) ( not ( = ?auto_853841 ?auto_853843 ) ) ( not ( = ?auto_853841 ?auto_853844 ) ) ( not ( = ?auto_853841 ?auto_853845 ) ) ( not ( = ?auto_853840 ?auto_853842 ) ) ( not ( = ?auto_853840 ?auto_853843 ) ) ( not ( = ?auto_853840 ?auto_853844 ) ) ( not ( = ?auto_853840 ?auto_853845 ) ) ( not ( = ?auto_853842 ?auto_853843 ) ) ( not ( = ?auto_853842 ?auto_853844 ) ) ( not ( = ?auto_853842 ?auto_853845 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_853843 ?auto_853844 ?auto_853845 )
      ( MAKE-8CRATE-VERIFY ?auto_853837 ?auto_853838 ?auto_853839 ?auto_853841 ?auto_853840 ?auto_853842 ?auto_853843 ?auto_853844 ?auto_853845 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_853921 - SURFACE
      ?auto_853922 - SURFACE
      ?auto_853923 - SURFACE
      ?auto_853925 - SURFACE
      ?auto_853924 - SURFACE
      ?auto_853926 - SURFACE
      ?auto_853927 - SURFACE
      ?auto_853928 - SURFACE
      ?auto_853929 - SURFACE
    )
    :vars
    (
      ?auto_853934 - HOIST
      ?auto_853932 - PLACE
      ?auto_853931 - TRUCK
      ?auto_853933 - PLACE
      ?auto_853930 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_853934 ?auto_853932 ) ( SURFACE-AT ?auto_853928 ?auto_853932 ) ( CLEAR ?auto_853928 ) ( IS-CRATE ?auto_853929 ) ( not ( = ?auto_853928 ?auto_853929 ) ) ( AVAILABLE ?auto_853934 ) ( ON ?auto_853928 ?auto_853927 ) ( not ( = ?auto_853927 ?auto_853928 ) ) ( not ( = ?auto_853927 ?auto_853929 ) ) ( TRUCK-AT ?auto_853931 ?auto_853933 ) ( not ( = ?auto_853933 ?auto_853932 ) ) ( HOIST-AT ?auto_853930 ?auto_853933 ) ( LIFTING ?auto_853930 ?auto_853929 ) ( not ( = ?auto_853934 ?auto_853930 ) ) ( ON ?auto_853922 ?auto_853921 ) ( ON ?auto_853923 ?auto_853922 ) ( ON ?auto_853925 ?auto_853923 ) ( ON ?auto_853924 ?auto_853925 ) ( ON ?auto_853926 ?auto_853924 ) ( ON ?auto_853927 ?auto_853926 ) ( not ( = ?auto_853921 ?auto_853922 ) ) ( not ( = ?auto_853921 ?auto_853923 ) ) ( not ( = ?auto_853921 ?auto_853925 ) ) ( not ( = ?auto_853921 ?auto_853924 ) ) ( not ( = ?auto_853921 ?auto_853926 ) ) ( not ( = ?auto_853921 ?auto_853927 ) ) ( not ( = ?auto_853921 ?auto_853928 ) ) ( not ( = ?auto_853921 ?auto_853929 ) ) ( not ( = ?auto_853922 ?auto_853923 ) ) ( not ( = ?auto_853922 ?auto_853925 ) ) ( not ( = ?auto_853922 ?auto_853924 ) ) ( not ( = ?auto_853922 ?auto_853926 ) ) ( not ( = ?auto_853922 ?auto_853927 ) ) ( not ( = ?auto_853922 ?auto_853928 ) ) ( not ( = ?auto_853922 ?auto_853929 ) ) ( not ( = ?auto_853923 ?auto_853925 ) ) ( not ( = ?auto_853923 ?auto_853924 ) ) ( not ( = ?auto_853923 ?auto_853926 ) ) ( not ( = ?auto_853923 ?auto_853927 ) ) ( not ( = ?auto_853923 ?auto_853928 ) ) ( not ( = ?auto_853923 ?auto_853929 ) ) ( not ( = ?auto_853925 ?auto_853924 ) ) ( not ( = ?auto_853925 ?auto_853926 ) ) ( not ( = ?auto_853925 ?auto_853927 ) ) ( not ( = ?auto_853925 ?auto_853928 ) ) ( not ( = ?auto_853925 ?auto_853929 ) ) ( not ( = ?auto_853924 ?auto_853926 ) ) ( not ( = ?auto_853924 ?auto_853927 ) ) ( not ( = ?auto_853924 ?auto_853928 ) ) ( not ( = ?auto_853924 ?auto_853929 ) ) ( not ( = ?auto_853926 ?auto_853927 ) ) ( not ( = ?auto_853926 ?auto_853928 ) ) ( not ( = ?auto_853926 ?auto_853929 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_853927 ?auto_853928 ?auto_853929 )
      ( MAKE-8CRATE-VERIFY ?auto_853921 ?auto_853922 ?auto_853923 ?auto_853925 ?auto_853924 ?auto_853926 ?auto_853927 ?auto_853928 ?auto_853929 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_854013 - SURFACE
      ?auto_854014 - SURFACE
      ?auto_854015 - SURFACE
      ?auto_854017 - SURFACE
      ?auto_854016 - SURFACE
      ?auto_854018 - SURFACE
      ?auto_854019 - SURFACE
      ?auto_854020 - SURFACE
      ?auto_854021 - SURFACE
    )
    :vars
    (
      ?auto_854024 - HOIST
      ?auto_854026 - PLACE
      ?auto_854023 - TRUCK
      ?auto_854025 - PLACE
      ?auto_854022 - HOIST
      ?auto_854027 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_854024 ?auto_854026 ) ( SURFACE-AT ?auto_854020 ?auto_854026 ) ( CLEAR ?auto_854020 ) ( IS-CRATE ?auto_854021 ) ( not ( = ?auto_854020 ?auto_854021 ) ) ( AVAILABLE ?auto_854024 ) ( ON ?auto_854020 ?auto_854019 ) ( not ( = ?auto_854019 ?auto_854020 ) ) ( not ( = ?auto_854019 ?auto_854021 ) ) ( TRUCK-AT ?auto_854023 ?auto_854025 ) ( not ( = ?auto_854025 ?auto_854026 ) ) ( HOIST-AT ?auto_854022 ?auto_854025 ) ( not ( = ?auto_854024 ?auto_854022 ) ) ( AVAILABLE ?auto_854022 ) ( SURFACE-AT ?auto_854021 ?auto_854025 ) ( ON ?auto_854021 ?auto_854027 ) ( CLEAR ?auto_854021 ) ( not ( = ?auto_854020 ?auto_854027 ) ) ( not ( = ?auto_854021 ?auto_854027 ) ) ( not ( = ?auto_854019 ?auto_854027 ) ) ( ON ?auto_854014 ?auto_854013 ) ( ON ?auto_854015 ?auto_854014 ) ( ON ?auto_854017 ?auto_854015 ) ( ON ?auto_854016 ?auto_854017 ) ( ON ?auto_854018 ?auto_854016 ) ( ON ?auto_854019 ?auto_854018 ) ( not ( = ?auto_854013 ?auto_854014 ) ) ( not ( = ?auto_854013 ?auto_854015 ) ) ( not ( = ?auto_854013 ?auto_854017 ) ) ( not ( = ?auto_854013 ?auto_854016 ) ) ( not ( = ?auto_854013 ?auto_854018 ) ) ( not ( = ?auto_854013 ?auto_854019 ) ) ( not ( = ?auto_854013 ?auto_854020 ) ) ( not ( = ?auto_854013 ?auto_854021 ) ) ( not ( = ?auto_854013 ?auto_854027 ) ) ( not ( = ?auto_854014 ?auto_854015 ) ) ( not ( = ?auto_854014 ?auto_854017 ) ) ( not ( = ?auto_854014 ?auto_854016 ) ) ( not ( = ?auto_854014 ?auto_854018 ) ) ( not ( = ?auto_854014 ?auto_854019 ) ) ( not ( = ?auto_854014 ?auto_854020 ) ) ( not ( = ?auto_854014 ?auto_854021 ) ) ( not ( = ?auto_854014 ?auto_854027 ) ) ( not ( = ?auto_854015 ?auto_854017 ) ) ( not ( = ?auto_854015 ?auto_854016 ) ) ( not ( = ?auto_854015 ?auto_854018 ) ) ( not ( = ?auto_854015 ?auto_854019 ) ) ( not ( = ?auto_854015 ?auto_854020 ) ) ( not ( = ?auto_854015 ?auto_854021 ) ) ( not ( = ?auto_854015 ?auto_854027 ) ) ( not ( = ?auto_854017 ?auto_854016 ) ) ( not ( = ?auto_854017 ?auto_854018 ) ) ( not ( = ?auto_854017 ?auto_854019 ) ) ( not ( = ?auto_854017 ?auto_854020 ) ) ( not ( = ?auto_854017 ?auto_854021 ) ) ( not ( = ?auto_854017 ?auto_854027 ) ) ( not ( = ?auto_854016 ?auto_854018 ) ) ( not ( = ?auto_854016 ?auto_854019 ) ) ( not ( = ?auto_854016 ?auto_854020 ) ) ( not ( = ?auto_854016 ?auto_854021 ) ) ( not ( = ?auto_854016 ?auto_854027 ) ) ( not ( = ?auto_854018 ?auto_854019 ) ) ( not ( = ?auto_854018 ?auto_854020 ) ) ( not ( = ?auto_854018 ?auto_854021 ) ) ( not ( = ?auto_854018 ?auto_854027 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_854019 ?auto_854020 ?auto_854021 )
      ( MAKE-8CRATE-VERIFY ?auto_854013 ?auto_854014 ?auto_854015 ?auto_854017 ?auto_854016 ?auto_854018 ?auto_854019 ?auto_854020 ?auto_854021 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_854106 - SURFACE
      ?auto_854107 - SURFACE
      ?auto_854108 - SURFACE
      ?auto_854110 - SURFACE
      ?auto_854109 - SURFACE
      ?auto_854111 - SURFACE
      ?auto_854112 - SURFACE
      ?auto_854113 - SURFACE
      ?auto_854114 - SURFACE
    )
    :vars
    (
      ?auto_854117 - HOIST
      ?auto_854115 - PLACE
      ?auto_854118 - PLACE
      ?auto_854120 - HOIST
      ?auto_854116 - SURFACE
      ?auto_854119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_854117 ?auto_854115 ) ( SURFACE-AT ?auto_854113 ?auto_854115 ) ( CLEAR ?auto_854113 ) ( IS-CRATE ?auto_854114 ) ( not ( = ?auto_854113 ?auto_854114 ) ) ( AVAILABLE ?auto_854117 ) ( ON ?auto_854113 ?auto_854112 ) ( not ( = ?auto_854112 ?auto_854113 ) ) ( not ( = ?auto_854112 ?auto_854114 ) ) ( not ( = ?auto_854118 ?auto_854115 ) ) ( HOIST-AT ?auto_854120 ?auto_854118 ) ( not ( = ?auto_854117 ?auto_854120 ) ) ( AVAILABLE ?auto_854120 ) ( SURFACE-AT ?auto_854114 ?auto_854118 ) ( ON ?auto_854114 ?auto_854116 ) ( CLEAR ?auto_854114 ) ( not ( = ?auto_854113 ?auto_854116 ) ) ( not ( = ?auto_854114 ?auto_854116 ) ) ( not ( = ?auto_854112 ?auto_854116 ) ) ( TRUCK-AT ?auto_854119 ?auto_854115 ) ( ON ?auto_854107 ?auto_854106 ) ( ON ?auto_854108 ?auto_854107 ) ( ON ?auto_854110 ?auto_854108 ) ( ON ?auto_854109 ?auto_854110 ) ( ON ?auto_854111 ?auto_854109 ) ( ON ?auto_854112 ?auto_854111 ) ( not ( = ?auto_854106 ?auto_854107 ) ) ( not ( = ?auto_854106 ?auto_854108 ) ) ( not ( = ?auto_854106 ?auto_854110 ) ) ( not ( = ?auto_854106 ?auto_854109 ) ) ( not ( = ?auto_854106 ?auto_854111 ) ) ( not ( = ?auto_854106 ?auto_854112 ) ) ( not ( = ?auto_854106 ?auto_854113 ) ) ( not ( = ?auto_854106 ?auto_854114 ) ) ( not ( = ?auto_854106 ?auto_854116 ) ) ( not ( = ?auto_854107 ?auto_854108 ) ) ( not ( = ?auto_854107 ?auto_854110 ) ) ( not ( = ?auto_854107 ?auto_854109 ) ) ( not ( = ?auto_854107 ?auto_854111 ) ) ( not ( = ?auto_854107 ?auto_854112 ) ) ( not ( = ?auto_854107 ?auto_854113 ) ) ( not ( = ?auto_854107 ?auto_854114 ) ) ( not ( = ?auto_854107 ?auto_854116 ) ) ( not ( = ?auto_854108 ?auto_854110 ) ) ( not ( = ?auto_854108 ?auto_854109 ) ) ( not ( = ?auto_854108 ?auto_854111 ) ) ( not ( = ?auto_854108 ?auto_854112 ) ) ( not ( = ?auto_854108 ?auto_854113 ) ) ( not ( = ?auto_854108 ?auto_854114 ) ) ( not ( = ?auto_854108 ?auto_854116 ) ) ( not ( = ?auto_854110 ?auto_854109 ) ) ( not ( = ?auto_854110 ?auto_854111 ) ) ( not ( = ?auto_854110 ?auto_854112 ) ) ( not ( = ?auto_854110 ?auto_854113 ) ) ( not ( = ?auto_854110 ?auto_854114 ) ) ( not ( = ?auto_854110 ?auto_854116 ) ) ( not ( = ?auto_854109 ?auto_854111 ) ) ( not ( = ?auto_854109 ?auto_854112 ) ) ( not ( = ?auto_854109 ?auto_854113 ) ) ( not ( = ?auto_854109 ?auto_854114 ) ) ( not ( = ?auto_854109 ?auto_854116 ) ) ( not ( = ?auto_854111 ?auto_854112 ) ) ( not ( = ?auto_854111 ?auto_854113 ) ) ( not ( = ?auto_854111 ?auto_854114 ) ) ( not ( = ?auto_854111 ?auto_854116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_854112 ?auto_854113 ?auto_854114 )
      ( MAKE-8CRATE-VERIFY ?auto_854106 ?auto_854107 ?auto_854108 ?auto_854110 ?auto_854109 ?auto_854111 ?auto_854112 ?auto_854113 ?auto_854114 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_854199 - SURFACE
      ?auto_854200 - SURFACE
      ?auto_854201 - SURFACE
      ?auto_854203 - SURFACE
      ?auto_854202 - SURFACE
      ?auto_854204 - SURFACE
      ?auto_854205 - SURFACE
      ?auto_854206 - SURFACE
      ?auto_854207 - SURFACE
    )
    :vars
    (
      ?auto_854208 - HOIST
      ?auto_854211 - PLACE
      ?auto_854212 - PLACE
      ?auto_854213 - HOIST
      ?auto_854209 - SURFACE
      ?auto_854210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_854208 ?auto_854211 ) ( IS-CRATE ?auto_854207 ) ( not ( = ?auto_854206 ?auto_854207 ) ) ( not ( = ?auto_854205 ?auto_854206 ) ) ( not ( = ?auto_854205 ?auto_854207 ) ) ( not ( = ?auto_854212 ?auto_854211 ) ) ( HOIST-AT ?auto_854213 ?auto_854212 ) ( not ( = ?auto_854208 ?auto_854213 ) ) ( AVAILABLE ?auto_854213 ) ( SURFACE-AT ?auto_854207 ?auto_854212 ) ( ON ?auto_854207 ?auto_854209 ) ( CLEAR ?auto_854207 ) ( not ( = ?auto_854206 ?auto_854209 ) ) ( not ( = ?auto_854207 ?auto_854209 ) ) ( not ( = ?auto_854205 ?auto_854209 ) ) ( TRUCK-AT ?auto_854210 ?auto_854211 ) ( SURFACE-AT ?auto_854205 ?auto_854211 ) ( CLEAR ?auto_854205 ) ( LIFTING ?auto_854208 ?auto_854206 ) ( IS-CRATE ?auto_854206 ) ( ON ?auto_854200 ?auto_854199 ) ( ON ?auto_854201 ?auto_854200 ) ( ON ?auto_854203 ?auto_854201 ) ( ON ?auto_854202 ?auto_854203 ) ( ON ?auto_854204 ?auto_854202 ) ( ON ?auto_854205 ?auto_854204 ) ( not ( = ?auto_854199 ?auto_854200 ) ) ( not ( = ?auto_854199 ?auto_854201 ) ) ( not ( = ?auto_854199 ?auto_854203 ) ) ( not ( = ?auto_854199 ?auto_854202 ) ) ( not ( = ?auto_854199 ?auto_854204 ) ) ( not ( = ?auto_854199 ?auto_854205 ) ) ( not ( = ?auto_854199 ?auto_854206 ) ) ( not ( = ?auto_854199 ?auto_854207 ) ) ( not ( = ?auto_854199 ?auto_854209 ) ) ( not ( = ?auto_854200 ?auto_854201 ) ) ( not ( = ?auto_854200 ?auto_854203 ) ) ( not ( = ?auto_854200 ?auto_854202 ) ) ( not ( = ?auto_854200 ?auto_854204 ) ) ( not ( = ?auto_854200 ?auto_854205 ) ) ( not ( = ?auto_854200 ?auto_854206 ) ) ( not ( = ?auto_854200 ?auto_854207 ) ) ( not ( = ?auto_854200 ?auto_854209 ) ) ( not ( = ?auto_854201 ?auto_854203 ) ) ( not ( = ?auto_854201 ?auto_854202 ) ) ( not ( = ?auto_854201 ?auto_854204 ) ) ( not ( = ?auto_854201 ?auto_854205 ) ) ( not ( = ?auto_854201 ?auto_854206 ) ) ( not ( = ?auto_854201 ?auto_854207 ) ) ( not ( = ?auto_854201 ?auto_854209 ) ) ( not ( = ?auto_854203 ?auto_854202 ) ) ( not ( = ?auto_854203 ?auto_854204 ) ) ( not ( = ?auto_854203 ?auto_854205 ) ) ( not ( = ?auto_854203 ?auto_854206 ) ) ( not ( = ?auto_854203 ?auto_854207 ) ) ( not ( = ?auto_854203 ?auto_854209 ) ) ( not ( = ?auto_854202 ?auto_854204 ) ) ( not ( = ?auto_854202 ?auto_854205 ) ) ( not ( = ?auto_854202 ?auto_854206 ) ) ( not ( = ?auto_854202 ?auto_854207 ) ) ( not ( = ?auto_854202 ?auto_854209 ) ) ( not ( = ?auto_854204 ?auto_854205 ) ) ( not ( = ?auto_854204 ?auto_854206 ) ) ( not ( = ?auto_854204 ?auto_854207 ) ) ( not ( = ?auto_854204 ?auto_854209 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_854205 ?auto_854206 ?auto_854207 )
      ( MAKE-8CRATE-VERIFY ?auto_854199 ?auto_854200 ?auto_854201 ?auto_854203 ?auto_854202 ?auto_854204 ?auto_854205 ?auto_854206 ?auto_854207 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_854292 - SURFACE
      ?auto_854293 - SURFACE
      ?auto_854294 - SURFACE
      ?auto_854296 - SURFACE
      ?auto_854295 - SURFACE
      ?auto_854297 - SURFACE
      ?auto_854298 - SURFACE
      ?auto_854299 - SURFACE
      ?auto_854300 - SURFACE
    )
    :vars
    (
      ?auto_854302 - HOIST
      ?auto_854301 - PLACE
      ?auto_854303 - PLACE
      ?auto_854305 - HOIST
      ?auto_854306 - SURFACE
      ?auto_854304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_854302 ?auto_854301 ) ( IS-CRATE ?auto_854300 ) ( not ( = ?auto_854299 ?auto_854300 ) ) ( not ( = ?auto_854298 ?auto_854299 ) ) ( not ( = ?auto_854298 ?auto_854300 ) ) ( not ( = ?auto_854303 ?auto_854301 ) ) ( HOIST-AT ?auto_854305 ?auto_854303 ) ( not ( = ?auto_854302 ?auto_854305 ) ) ( AVAILABLE ?auto_854305 ) ( SURFACE-AT ?auto_854300 ?auto_854303 ) ( ON ?auto_854300 ?auto_854306 ) ( CLEAR ?auto_854300 ) ( not ( = ?auto_854299 ?auto_854306 ) ) ( not ( = ?auto_854300 ?auto_854306 ) ) ( not ( = ?auto_854298 ?auto_854306 ) ) ( TRUCK-AT ?auto_854304 ?auto_854301 ) ( SURFACE-AT ?auto_854298 ?auto_854301 ) ( CLEAR ?auto_854298 ) ( IS-CRATE ?auto_854299 ) ( AVAILABLE ?auto_854302 ) ( IN ?auto_854299 ?auto_854304 ) ( ON ?auto_854293 ?auto_854292 ) ( ON ?auto_854294 ?auto_854293 ) ( ON ?auto_854296 ?auto_854294 ) ( ON ?auto_854295 ?auto_854296 ) ( ON ?auto_854297 ?auto_854295 ) ( ON ?auto_854298 ?auto_854297 ) ( not ( = ?auto_854292 ?auto_854293 ) ) ( not ( = ?auto_854292 ?auto_854294 ) ) ( not ( = ?auto_854292 ?auto_854296 ) ) ( not ( = ?auto_854292 ?auto_854295 ) ) ( not ( = ?auto_854292 ?auto_854297 ) ) ( not ( = ?auto_854292 ?auto_854298 ) ) ( not ( = ?auto_854292 ?auto_854299 ) ) ( not ( = ?auto_854292 ?auto_854300 ) ) ( not ( = ?auto_854292 ?auto_854306 ) ) ( not ( = ?auto_854293 ?auto_854294 ) ) ( not ( = ?auto_854293 ?auto_854296 ) ) ( not ( = ?auto_854293 ?auto_854295 ) ) ( not ( = ?auto_854293 ?auto_854297 ) ) ( not ( = ?auto_854293 ?auto_854298 ) ) ( not ( = ?auto_854293 ?auto_854299 ) ) ( not ( = ?auto_854293 ?auto_854300 ) ) ( not ( = ?auto_854293 ?auto_854306 ) ) ( not ( = ?auto_854294 ?auto_854296 ) ) ( not ( = ?auto_854294 ?auto_854295 ) ) ( not ( = ?auto_854294 ?auto_854297 ) ) ( not ( = ?auto_854294 ?auto_854298 ) ) ( not ( = ?auto_854294 ?auto_854299 ) ) ( not ( = ?auto_854294 ?auto_854300 ) ) ( not ( = ?auto_854294 ?auto_854306 ) ) ( not ( = ?auto_854296 ?auto_854295 ) ) ( not ( = ?auto_854296 ?auto_854297 ) ) ( not ( = ?auto_854296 ?auto_854298 ) ) ( not ( = ?auto_854296 ?auto_854299 ) ) ( not ( = ?auto_854296 ?auto_854300 ) ) ( not ( = ?auto_854296 ?auto_854306 ) ) ( not ( = ?auto_854295 ?auto_854297 ) ) ( not ( = ?auto_854295 ?auto_854298 ) ) ( not ( = ?auto_854295 ?auto_854299 ) ) ( not ( = ?auto_854295 ?auto_854300 ) ) ( not ( = ?auto_854295 ?auto_854306 ) ) ( not ( = ?auto_854297 ?auto_854298 ) ) ( not ( = ?auto_854297 ?auto_854299 ) ) ( not ( = ?auto_854297 ?auto_854300 ) ) ( not ( = ?auto_854297 ?auto_854306 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_854298 ?auto_854299 ?auto_854300 )
      ( MAKE-8CRATE-VERIFY ?auto_854292 ?auto_854293 ?auto_854294 ?auto_854296 ?auto_854295 ?auto_854297 ?auto_854298 ?auto_854299 ?auto_854300 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_856787 - SURFACE
      ?auto_856788 - SURFACE
    )
    :vars
    (
      ?auto_856793 - HOIST
      ?auto_856794 - PLACE
      ?auto_856789 - SURFACE
      ?auto_856791 - PLACE
      ?auto_856795 - HOIST
      ?auto_856790 - SURFACE
      ?auto_856792 - TRUCK
      ?auto_856796 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_856793 ?auto_856794 ) ( SURFACE-AT ?auto_856787 ?auto_856794 ) ( CLEAR ?auto_856787 ) ( IS-CRATE ?auto_856788 ) ( not ( = ?auto_856787 ?auto_856788 ) ) ( ON ?auto_856787 ?auto_856789 ) ( not ( = ?auto_856789 ?auto_856787 ) ) ( not ( = ?auto_856789 ?auto_856788 ) ) ( not ( = ?auto_856791 ?auto_856794 ) ) ( HOIST-AT ?auto_856795 ?auto_856791 ) ( not ( = ?auto_856793 ?auto_856795 ) ) ( AVAILABLE ?auto_856795 ) ( SURFACE-AT ?auto_856788 ?auto_856791 ) ( ON ?auto_856788 ?auto_856790 ) ( CLEAR ?auto_856788 ) ( not ( = ?auto_856787 ?auto_856790 ) ) ( not ( = ?auto_856788 ?auto_856790 ) ) ( not ( = ?auto_856789 ?auto_856790 ) ) ( TRUCK-AT ?auto_856792 ?auto_856794 ) ( LIFTING ?auto_856793 ?auto_856796 ) ( IS-CRATE ?auto_856796 ) ( not ( = ?auto_856787 ?auto_856796 ) ) ( not ( = ?auto_856788 ?auto_856796 ) ) ( not ( = ?auto_856789 ?auto_856796 ) ) ( not ( = ?auto_856790 ?auto_856796 ) ) )
    :subtasks
    ( ( !LOAD ?auto_856793 ?auto_856796 ?auto_856792 ?auto_856794 )
      ( MAKE-1CRATE ?auto_856787 ?auto_856788 )
      ( MAKE-1CRATE-VERIFY ?auto_856787 ?auto_856788 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_858398 - SURFACE
      ?auto_858399 - SURFACE
      ?auto_858400 - SURFACE
      ?auto_858402 - SURFACE
      ?auto_858401 - SURFACE
      ?auto_858403 - SURFACE
      ?auto_858404 - SURFACE
      ?auto_858405 - SURFACE
      ?auto_858406 - SURFACE
      ?auto_858407 - SURFACE
    )
    :vars
    (
      ?auto_858408 - HOIST
      ?auto_858409 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_858408 ?auto_858409 ) ( SURFACE-AT ?auto_858406 ?auto_858409 ) ( CLEAR ?auto_858406 ) ( LIFTING ?auto_858408 ?auto_858407 ) ( IS-CRATE ?auto_858407 ) ( not ( = ?auto_858406 ?auto_858407 ) ) ( ON ?auto_858399 ?auto_858398 ) ( ON ?auto_858400 ?auto_858399 ) ( ON ?auto_858402 ?auto_858400 ) ( ON ?auto_858401 ?auto_858402 ) ( ON ?auto_858403 ?auto_858401 ) ( ON ?auto_858404 ?auto_858403 ) ( ON ?auto_858405 ?auto_858404 ) ( ON ?auto_858406 ?auto_858405 ) ( not ( = ?auto_858398 ?auto_858399 ) ) ( not ( = ?auto_858398 ?auto_858400 ) ) ( not ( = ?auto_858398 ?auto_858402 ) ) ( not ( = ?auto_858398 ?auto_858401 ) ) ( not ( = ?auto_858398 ?auto_858403 ) ) ( not ( = ?auto_858398 ?auto_858404 ) ) ( not ( = ?auto_858398 ?auto_858405 ) ) ( not ( = ?auto_858398 ?auto_858406 ) ) ( not ( = ?auto_858398 ?auto_858407 ) ) ( not ( = ?auto_858399 ?auto_858400 ) ) ( not ( = ?auto_858399 ?auto_858402 ) ) ( not ( = ?auto_858399 ?auto_858401 ) ) ( not ( = ?auto_858399 ?auto_858403 ) ) ( not ( = ?auto_858399 ?auto_858404 ) ) ( not ( = ?auto_858399 ?auto_858405 ) ) ( not ( = ?auto_858399 ?auto_858406 ) ) ( not ( = ?auto_858399 ?auto_858407 ) ) ( not ( = ?auto_858400 ?auto_858402 ) ) ( not ( = ?auto_858400 ?auto_858401 ) ) ( not ( = ?auto_858400 ?auto_858403 ) ) ( not ( = ?auto_858400 ?auto_858404 ) ) ( not ( = ?auto_858400 ?auto_858405 ) ) ( not ( = ?auto_858400 ?auto_858406 ) ) ( not ( = ?auto_858400 ?auto_858407 ) ) ( not ( = ?auto_858402 ?auto_858401 ) ) ( not ( = ?auto_858402 ?auto_858403 ) ) ( not ( = ?auto_858402 ?auto_858404 ) ) ( not ( = ?auto_858402 ?auto_858405 ) ) ( not ( = ?auto_858402 ?auto_858406 ) ) ( not ( = ?auto_858402 ?auto_858407 ) ) ( not ( = ?auto_858401 ?auto_858403 ) ) ( not ( = ?auto_858401 ?auto_858404 ) ) ( not ( = ?auto_858401 ?auto_858405 ) ) ( not ( = ?auto_858401 ?auto_858406 ) ) ( not ( = ?auto_858401 ?auto_858407 ) ) ( not ( = ?auto_858403 ?auto_858404 ) ) ( not ( = ?auto_858403 ?auto_858405 ) ) ( not ( = ?auto_858403 ?auto_858406 ) ) ( not ( = ?auto_858403 ?auto_858407 ) ) ( not ( = ?auto_858404 ?auto_858405 ) ) ( not ( = ?auto_858404 ?auto_858406 ) ) ( not ( = ?auto_858404 ?auto_858407 ) ) ( not ( = ?auto_858405 ?auto_858406 ) ) ( not ( = ?auto_858405 ?auto_858407 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_858406 ?auto_858407 )
      ( MAKE-9CRATE-VERIFY ?auto_858398 ?auto_858399 ?auto_858400 ?auto_858402 ?auto_858401 ?auto_858403 ?auto_858404 ?auto_858405 ?auto_858406 ?auto_858407 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_858478 - SURFACE
      ?auto_858479 - SURFACE
      ?auto_858480 - SURFACE
      ?auto_858482 - SURFACE
      ?auto_858481 - SURFACE
      ?auto_858483 - SURFACE
      ?auto_858484 - SURFACE
      ?auto_858485 - SURFACE
      ?auto_858486 - SURFACE
      ?auto_858487 - SURFACE
    )
    :vars
    (
      ?auto_858490 - HOIST
      ?auto_858489 - PLACE
      ?auto_858488 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_858490 ?auto_858489 ) ( SURFACE-AT ?auto_858486 ?auto_858489 ) ( CLEAR ?auto_858486 ) ( IS-CRATE ?auto_858487 ) ( not ( = ?auto_858486 ?auto_858487 ) ) ( TRUCK-AT ?auto_858488 ?auto_858489 ) ( AVAILABLE ?auto_858490 ) ( IN ?auto_858487 ?auto_858488 ) ( ON ?auto_858486 ?auto_858485 ) ( not ( = ?auto_858485 ?auto_858486 ) ) ( not ( = ?auto_858485 ?auto_858487 ) ) ( ON ?auto_858479 ?auto_858478 ) ( ON ?auto_858480 ?auto_858479 ) ( ON ?auto_858482 ?auto_858480 ) ( ON ?auto_858481 ?auto_858482 ) ( ON ?auto_858483 ?auto_858481 ) ( ON ?auto_858484 ?auto_858483 ) ( ON ?auto_858485 ?auto_858484 ) ( not ( = ?auto_858478 ?auto_858479 ) ) ( not ( = ?auto_858478 ?auto_858480 ) ) ( not ( = ?auto_858478 ?auto_858482 ) ) ( not ( = ?auto_858478 ?auto_858481 ) ) ( not ( = ?auto_858478 ?auto_858483 ) ) ( not ( = ?auto_858478 ?auto_858484 ) ) ( not ( = ?auto_858478 ?auto_858485 ) ) ( not ( = ?auto_858478 ?auto_858486 ) ) ( not ( = ?auto_858478 ?auto_858487 ) ) ( not ( = ?auto_858479 ?auto_858480 ) ) ( not ( = ?auto_858479 ?auto_858482 ) ) ( not ( = ?auto_858479 ?auto_858481 ) ) ( not ( = ?auto_858479 ?auto_858483 ) ) ( not ( = ?auto_858479 ?auto_858484 ) ) ( not ( = ?auto_858479 ?auto_858485 ) ) ( not ( = ?auto_858479 ?auto_858486 ) ) ( not ( = ?auto_858479 ?auto_858487 ) ) ( not ( = ?auto_858480 ?auto_858482 ) ) ( not ( = ?auto_858480 ?auto_858481 ) ) ( not ( = ?auto_858480 ?auto_858483 ) ) ( not ( = ?auto_858480 ?auto_858484 ) ) ( not ( = ?auto_858480 ?auto_858485 ) ) ( not ( = ?auto_858480 ?auto_858486 ) ) ( not ( = ?auto_858480 ?auto_858487 ) ) ( not ( = ?auto_858482 ?auto_858481 ) ) ( not ( = ?auto_858482 ?auto_858483 ) ) ( not ( = ?auto_858482 ?auto_858484 ) ) ( not ( = ?auto_858482 ?auto_858485 ) ) ( not ( = ?auto_858482 ?auto_858486 ) ) ( not ( = ?auto_858482 ?auto_858487 ) ) ( not ( = ?auto_858481 ?auto_858483 ) ) ( not ( = ?auto_858481 ?auto_858484 ) ) ( not ( = ?auto_858481 ?auto_858485 ) ) ( not ( = ?auto_858481 ?auto_858486 ) ) ( not ( = ?auto_858481 ?auto_858487 ) ) ( not ( = ?auto_858483 ?auto_858484 ) ) ( not ( = ?auto_858483 ?auto_858485 ) ) ( not ( = ?auto_858483 ?auto_858486 ) ) ( not ( = ?auto_858483 ?auto_858487 ) ) ( not ( = ?auto_858484 ?auto_858485 ) ) ( not ( = ?auto_858484 ?auto_858486 ) ) ( not ( = ?auto_858484 ?auto_858487 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_858485 ?auto_858486 ?auto_858487 )
      ( MAKE-9CRATE-VERIFY ?auto_858478 ?auto_858479 ?auto_858480 ?auto_858482 ?auto_858481 ?auto_858483 ?auto_858484 ?auto_858485 ?auto_858486 ?auto_858487 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_858568 - SURFACE
      ?auto_858569 - SURFACE
      ?auto_858570 - SURFACE
      ?auto_858572 - SURFACE
      ?auto_858571 - SURFACE
      ?auto_858573 - SURFACE
      ?auto_858574 - SURFACE
      ?auto_858575 - SURFACE
      ?auto_858576 - SURFACE
      ?auto_858577 - SURFACE
    )
    :vars
    (
      ?auto_858578 - HOIST
      ?auto_858581 - PLACE
      ?auto_858579 - TRUCK
      ?auto_858580 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_858578 ?auto_858581 ) ( SURFACE-AT ?auto_858576 ?auto_858581 ) ( CLEAR ?auto_858576 ) ( IS-CRATE ?auto_858577 ) ( not ( = ?auto_858576 ?auto_858577 ) ) ( AVAILABLE ?auto_858578 ) ( IN ?auto_858577 ?auto_858579 ) ( ON ?auto_858576 ?auto_858575 ) ( not ( = ?auto_858575 ?auto_858576 ) ) ( not ( = ?auto_858575 ?auto_858577 ) ) ( TRUCK-AT ?auto_858579 ?auto_858580 ) ( not ( = ?auto_858580 ?auto_858581 ) ) ( ON ?auto_858569 ?auto_858568 ) ( ON ?auto_858570 ?auto_858569 ) ( ON ?auto_858572 ?auto_858570 ) ( ON ?auto_858571 ?auto_858572 ) ( ON ?auto_858573 ?auto_858571 ) ( ON ?auto_858574 ?auto_858573 ) ( ON ?auto_858575 ?auto_858574 ) ( not ( = ?auto_858568 ?auto_858569 ) ) ( not ( = ?auto_858568 ?auto_858570 ) ) ( not ( = ?auto_858568 ?auto_858572 ) ) ( not ( = ?auto_858568 ?auto_858571 ) ) ( not ( = ?auto_858568 ?auto_858573 ) ) ( not ( = ?auto_858568 ?auto_858574 ) ) ( not ( = ?auto_858568 ?auto_858575 ) ) ( not ( = ?auto_858568 ?auto_858576 ) ) ( not ( = ?auto_858568 ?auto_858577 ) ) ( not ( = ?auto_858569 ?auto_858570 ) ) ( not ( = ?auto_858569 ?auto_858572 ) ) ( not ( = ?auto_858569 ?auto_858571 ) ) ( not ( = ?auto_858569 ?auto_858573 ) ) ( not ( = ?auto_858569 ?auto_858574 ) ) ( not ( = ?auto_858569 ?auto_858575 ) ) ( not ( = ?auto_858569 ?auto_858576 ) ) ( not ( = ?auto_858569 ?auto_858577 ) ) ( not ( = ?auto_858570 ?auto_858572 ) ) ( not ( = ?auto_858570 ?auto_858571 ) ) ( not ( = ?auto_858570 ?auto_858573 ) ) ( not ( = ?auto_858570 ?auto_858574 ) ) ( not ( = ?auto_858570 ?auto_858575 ) ) ( not ( = ?auto_858570 ?auto_858576 ) ) ( not ( = ?auto_858570 ?auto_858577 ) ) ( not ( = ?auto_858572 ?auto_858571 ) ) ( not ( = ?auto_858572 ?auto_858573 ) ) ( not ( = ?auto_858572 ?auto_858574 ) ) ( not ( = ?auto_858572 ?auto_858575 ) ) ( not ( = ?auto_858572 ?auto_858576 ) ) ( not ( = ?auto_858572 ?auto_858577 ) ) ( not ( = ?auto_858571 ?auto_858573 ) ) ( not ( = ?auto_858571 ?auto_858574 ) ) ( not ( = ?auto_858571 ?auto_858575 ) ) ( not ( = ?auto_858571 ?auto_858576 ) ) ( not ( = ?auto_858571 ?auto_858577 ) ) ( not ( = ?auto_858573 ?auto_858574 ) ) ( not ( = ?auto_858573 ?auto_858575 ) ) ( not ( = ?auto_858573 ?auto_858576 ) ) ( not ( = ?auto_858573 ?auto_858577 ) ) ( not ( = ?auto_858574 ?auto_858575 ) ) ( not ( = ?auto_858574 ?auto_858576 ) ) ( not ( = ?auto_858574 ?auto_858577 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_858575 ?auto_858576 ?auto_858577 )
      ( MAKE-9CRATE-VERIFY ?auto_858568 ?auto_858569 ?auto_858570 ?auto_858572 ?auto_858571 ?auto_858573 ?auto_858574 ?auto_858575 ?auto_858576 ?auto_858577 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_858667 - SURFACE
      ?auto_858668 - SURFACE
      ?auto_858669 - SURFACE
      ?auto_858671 - SURFACE
      ?auto_858670 - SURFACE
      ?auto_858672 - SURFACE
      ?auto_858673 - SURFACE
      ?auto_858674 - SURFACE
      ?auto_858675 - SURFACE
      ?auto_858676 - SURFACE
    )
    :vars
    (
      ?auto_858680 - HOIST
      ?auto_858681 - PLACE
      ?auto_858677 - TRUCK
      ?auto_858679 - PLACE
      ?auto_858678 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_858680 ?auto_858681 ) ( SURFACE-AT ?auto_858675 ?auto_858681 ) ( CLEAR ?auto_858675 ) ( IS-CRATE ?auto_858676 ) ( not ( = ?auto_858675 ?auto_858676 ) ) ( AVAILABLE ?auto_858680 ) ( ON ?auto_858675 ?auto_858674 ) ( not ( = ?auto_858674 ?auto_858675 ) ) ( not ( = ?auto_858674 ?auto_858676 ) ) ( TRUCK-AT ?auto_858677 ?auto_858679 ) ( not ( = ?auto_858679 ?auto_858681 ) ) ( HOIST-AT ?auto_858678 ?auto_858679 ) ( LIFTING ?auto_858678 ?auto_858676 ) ( not ( = ?auto_858680 ?auto_858678 ) ) ( ON ?auto_858668 ?auto_858667 ) ( ON ?auto_858669 ?auto_858668 ) ( ON ?auto_858671 ?auto_858669 ) ( ON ?auto_858670 ?auto_858671 ) ( ON ?auto_858672 ?auto_858670 ) ( ON ?auto_858673 ?auto_858672 ) ( ON ?auto_858674 ?auto_858673 ) ( not ( = ?auto_858667 ?auto_858668 ) ) ( not ( = ?auto_858667 ?auto_858669 ) ) ( not ( = ?auto_858667 ?auto_858671 ) ) ( not ( = ?auto_858667 ?auto_858670 ) ) ( not ( = ?auto_858667 ?auto_858672 ) ) ( not ( = ?auto_858667 ?auto_858673 ) ) ( not ( = ?auto_858667 ?auto_858674 ) ) ( not ( = ?auto_858667 ?auto_858675 ) ) ( not ( = ?auto_858667 ?auto_858676 ) ) ( not ( = ?auto_858668 ?auto_858669 ) ) ( not ( = ?auto_858668 ?auto_858671 ) ) ( not ( = ?auto_858668 ?auto_858670 ) ) ( not ( = ?auto_858668 ?auto_858672 ) ) ( not ( = ?auto_858668 ?auto_858673 ) ) ( not ( = ?auto_858668 ?auto_858674 ) ) ( not ( = ?auto_858668 ?auto_858675 ) ) ( not ( = ?auto_858668 ?auto_858676 ) ) ( not ( = ?auto_858669 ?auto_858671 ) ) ( not ( = ?auto_858669 ?auto_858670 ) ) ( not ( = ?auto_858669 ?auto_858672 ) ) ( not ( = ?auto_858669 ?auto_858673 ) ) ( not ( = ?auto_858669 ?auto_858674 ) ) ( not ( = ?auto_858669 ?auto_858675 ) ) ( not ( = ?auto_858669 ?auto_858676 ) ) ( not ( = ?auto_858671 ?auto_858670 ) ) ( not ( = ?auto_858671 ?auto_858672 ) ) ( not ( = ?auto_858671 ?auto_858673 ) ) ( not ( = ?auto_858671 ?auto_858674 ) ) ( not ( = ?auto_858671 ?auto_858675 ) ) ( not ( = ?auto_858671 ?auto_858676 ) ) ( not ( = ?auto_858670 ?auto_858672 ) ) ( not ( = ?auto_858670 ?auto_858673 ) ) ( not ( = ?auto_858670 ?auto_858674 ) ) ( not ( = ?auto_858670 ?auto_858675 ) ) ( not ( = ?auto_858670 ?auto_858676 ) ) ( not ( = ?auto_858672 ?auto_858673 ) ) ( not ( = ?auto_858672 ?auto_858674 ) ) ( not ( = ?auto_858672 ?auto_858675 ) ) ( not ( = ?auto_858672 ?auto_858676 ) ) ( not ( = ?auto_858673 ?auto_858674 ) ) ( not ( = ?auto_858673 ?auto_858675 ) ) ( not ( = ?auto_858673 ?auto_858676 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_858674 ?auto_858675 ?auto_858676 )
      ( MAKE-9CRATE-VERIFY ?auto_858667 ?auto_858668 ?auto_858669 ?auto_858671 ?auto_858670 ?auto_858672 ?auto_858673 ?auto_858674 ?auto_858675 ?auto_858676 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_858775 - SURFACE
      ?auto_858776 - SURFACE
      ?auto_858777 - SURFACE
      ?auto_858779 - SURFACE
      ?auto_858778 - SURFACE
      ?auto_858780 - SURFACE
      ?auto_858781 - SURFACE
      ?auto_858782 - SURFACE
      ?auto_858783 - SURFACE
      ?auto_858784 - SURFACE
    )
    :vars
    (
      ?auto_858790 - HOIST
      ?auto_858787 - PLACE
      ?auto_858788 - TRUCK
      ?auto_858786 - PLACE
      ?auto_858789 - HOIST
      ?auto_858785 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_858790 ?auto_858787 ) ( SURFACE-AT ?auto_858783 ?auto_858787 ) ( CLEAR ?auto_858783 ) ( IS-CRATE ?auto_858784 ) ( not ( = ?auto_858783 ?auto_858784 ) ) ( AVAILABLE ?auto_858790 ) ( ON ?auto_858783 ?auto_858782 ) ( not ( = ?auto_858782 ?auto_858783 ) ) ( not ( = ?auto_858782 ?auto_858784 ) ) ( TRUCK-AT ?auto_858788 ?auto_858786 ) ( not ( = ?auto_858786 ?auto_858787 ) ) ( HOIST-AT ?auto_858789 ?auto_858786 ) ( not ( = ?auto_858790 ?auto_858789 ) ) ( AVAILABLE ?auto_858789 ) ( SURFACE-AT ?auto_858784 ?auto_858786 ) ( ON ?auto_858784 ?auto_858785 ) ( CLEAR ?auto_858784 ) ( not ( = ?auto_858783 ?auto_858785 ) ) ( not ( = ?auto_858784 ?auto_858785 ) ) ( not ( = ?auto_858782 ?auto_858785 ) ) ( ON ?auto_858776 ?auto_858775 ) ( ON ?auto_858777 ?auto_858776 ) ( ON ?auto_858779 ?auto_858777 ) ( ON ?auto_858778 ?auto_858779 ) ( ON ?auto_858780 ?auto_858778 ) ( ON ?auto_858781 ?auto_858780 ) ( ON ?auto_858782 ?auto_858781 ) ( not ( = ?auto_858775 ?auto_858776 ) ) ( not ( = ?auto_858775 ?auto_858777 ) ) ( not ( = ?auto_858775 ?auto_858779 ) ) ( not ( = ?auto_858775 ?auto_858778 ) ) ( not ( = ?auto_858775 ?auto_858780 ) ) ( not ( = ?auto_858775 ?auto_858781 ) ) ( not ( = ?auto_858775 ?auto_858782 ) ) ( not ( = ?auto_858775 ?auto_858783 ) ) ( not ( = ?auto_858775 ?auto_858784 ) ) ( not ( = ?auto_858775 ?auto_858785 ) ) ( not ( = ?auto_858776 ?auto_858777 ) ) ( not ( = ?auto_858776 ?auto_858779 ) ) ( not ( = ?auto_858776 ?auto_858778 ) ) ( not ( = ?auto_858776 ?auto_858780 ) ) ( not ( = ?auto_858776 ?auto_858781 ) ) ( not ( = ?auto_858776 ?auto_858782 ) ) ( not ( = ?auto_858776 ?auto_858783 ) ) ( not ( = ?auto_858776 ?auto_858784 ) ) ( not ( = ?auto_858776 ?auto_858785 ) ) ( not ( = ?auto_858777 ?auto_858779 ) ) ( not ( = ?auto_858777 ?auto_858778 ) ) ( not ( = ?auto_858777 ?auto_858780 ) ) ( not ( = ?auto_858777 ?auto_858781 ) ) ( not ( = ?auto_858777 ?auto_858782 ) ) ( not ( = ?auto_858777 ?auto_858783 ) ) ( not ( = ?auto_858777 ?auto_858784 ) ) ( not ( = ?auto_858777 ?auto_858785 ) ) ( not ( = ?auto_858779 ?auto_858778 ) ) ( not ( = ?auto_858779 ?auto_858780 ) ) ( not ( = ?auto_858779 ?auto_858781 ) ) ( not ( = ?auto_858779 ?auto_858782 ) ) ( not ( = ?auto_858779 ?auto_858783 ) ) ( not ( = ?auto_858779 ?auto_858784 ) ) ( not ( = ?auto_858779 ?auto_858785 ) ) ( not ( = ?auto_858778 ?auto_858780 ) ) ( not ( = ?auto_858778 ?auto_858781 ) ) ( not ( = ?auto_858778 ?auto_858782 ) ) ( not ( = ?auto_858778 ?auto_858783 ) ) ( not ( = ?auto_858778 ?auto_858784 ) ) ( not ( = ?auto_858778 ?auto_858785 ) ) ( not ( = ?auto_858780 ?auto_858781 ) ) ( not ( = ?auto_858780 ?auto_858782 ) ) ( not ( = ?auto_858780 ?auto_858783 ) ) ( not ( = ?auto_858780 ?auto_858784 ) ) ( not ( = ?auto_858780 ?auto_858785 ) ) ( not ( = ?auto_858781 ?auto_858782 ) ) ( not ( = ?auto_858781 ?auto_858783 ) ) ( not ( = ?auto_858781 ?auto_858784 ) ) ( not ( = ?auto_858781 ?auto_858785 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_858782 ?auto_858783 ?auto_858784 )
      ( MAKE-9CRATE-VERIFY ?auto_858775 ?auto_858776 ?auto_858777 ?auto_858779 ?auto_858778 ?auto_858780 ?auto_858781 ?auto_858782 ?auto_858783 ?auto_858784 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_858884 - SURFACE
      ?auto_858885 - SURFACE
      ?auto_858886 - SURFACE
      ?auto_858888 - SURFACE
      ?auto_858887 - SURFACE
      ?auto_858889 - SURFACE
      ?auto_858890 - SURFACE
      ?auto_858891 - SURFACE
      ?auto_858892 - SURFACE
      ?auto_858893 - SURFACE
    )
    :vars
    (
      ?auto_858899 - HOIST
      ?auto_858896 - PLACE
      ?auto_858895 - PLACE
      ?auto_858897 - HOIST
      ?auto_858898 - SURFACE
      ?auto_858894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_858899 ?auto_858896 ) ( SURFACE-AT ?auto_858892 ?auto_858896 ) ( CLEAR ?auto_858892 ) ( IS-CRATE ?auto_858893 ) ( not ( = ?auto_858892 ?auto_858893 ) ) ( AVAILABLE ?auto_858899 ) ( ON ?auto_858892 ?auto_858891 ) ( not ( = ?auto_858891 ?auto_858892 ) ) ( not ( = ?auto_858891 ?auto_858893 ) ) ( not ( = ?auto_858895 ?auto_858896 ) ) ( HOIST-AT ?auto_858897 ?auto_858895 ) ( not ( = ?auto_858899 ?auto_858897 ) ) ( AVAILABLE ?auto_858897 ) ( SURFACE-AT ?auto_858893 ?auto_858895 ) ( ON ?auto_858893 ?auto_858898 ) ( CLEAR ?auto_858893 ) ( not ( = ?auto_858892 ?auto_858898 ) ) ( not ( = ?auto_858893 ?auto_858898 ) ) ( not ( = ?auto_858891 ?auto_858898 ) ) ( TRUCK-AT ?auto_858894 ?auto_858896 ) ( ON ?auto_858885 ?auto_858884 ) ( ON ?auto_858886 ?auto_858885 ) ( ON ?auto_858888 ?auto_858886 ) ( ON ?auto_858887 ?auto_858888 ) ( ON ?auto_858889 ?auto_858887 ) ( ON ?auto_858890 ?auto_858889 ) ( ON ?auto_858891 ?auto_858890 ) ( not ( = ?auto_858884 ?auto_858885 ) ) ( not ( = ?auto_858884 ?auto_858886 ) ) ( not ( = ?auto_858884 ?auto_858888 ) ) ( not ( = ?auto_858884 ?auto_858887 ) ) ( not ( = ?auto_858884 ?auto_858889 ) ) ( not ( = ?auto_858884 ?auto_858890 ) ) ( not ( = ?auto_858884 ?auto_858891 ) ) ( not ( = ?auto_858884 ?auto_858892 ) ) ( not ( = ?auto_858884 ?auto_858893 ) ) ( not ( = ?auto_858884 ?auto_858898 ) ) ( not ( = ?auto_858885 ?auto_858886 ) ) ( not ( = ?auto_858885 ?auto_858888 ) ) ( not ( = ?auto_858885 ?auto_858887 ) ) ( not ( = ?auto_858885 ?auto_858889 ) ) ( not ( = ?auto_858885 ?auto_858890 ) ) ( not ( = ?auto_858885 ?auto_858891 ) ) ( not ( = ?auto_858885 ?auto_858892 ) ) ( not ( = ?auto_858885 ?auto_858893 ) ) ( not ( = ?auto_858885 ?auto_858898 ) ) ( not ( = ?auto_858886 ?auto_858888 ) ) ( not ( = ?auto_858886 ?auto_858887 ) ) ( not ( = ?auto_858886 ?auto_858889 ) ) ( not ( = ?auto_858886 ?auto_858890 ) ) ( not ( = ?auto_858886 ?auto_858891 ) ) ( not ( = ?auto_858886 ?auto_858892 ) ) ( not ( = ?auto_858886 ?auto_858893 ) ) ( not ( = ?auto_858886 ?auto_858898 ) ) ( not ( = ?auto_858888 ?auto_858887 ) ) ( not ( = ?auto_858888 ?auto_858889 ) ) ( not ( = ?auto_858888 ?auto_858890 ) ) ( not ( = ?auto_858888 ?auto_858891 ) ) ( not ( = ?auto_858888 ?auto_858892 ) ) ( not ( = ?auto_858888 ?auto_858893 ) ) ( not ( = ?auto_858888 ?auto_858898 ) ) ( not ( = ?auto_858887 ?auto_858889 ) ) ( not ( = ?auto_858887 ?auto_858890 ) ) ( not ( = ?auto_858887 ?auto_858891 ) ) ( not ( = ?auto_858887 ?auto_858892 ) ) ( not ( = ?auto_858887 ?auto_858893 ) ) ( not ( = ?auto_858887 ?auto_858898 ) ) ( not ( = ?auto_858889 ?auto_858890 ) ) ( not ( = ?auto_858889 ?auto_858891 ) ) ( not ( = ?auto_858889 ?auto_858892 ) ) ( not ( = ?auto_858889 ?auto_858893 ) ) ( not ( = ?auto_858889 ?auto_858898 ) ) ( not ( = ?auto_858890 ?auto_858891 ) ) ( not ( = ?auto_858890 ?auto_858892 ) ) ( not ( = ?auto_858890 ?auto_858893 ) ) ( not ( = ?auto_858890 ?auto_858898 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_858891 ?auto_858892 ?auto_858893 )
      ( MAKE-9CRATE-VERIFY ?auto_858884 ?auto_858885 ?auto_858886 ?auto_858888 ?auto_858887 ?auto_858889 ?auto_858890 ?auto_858891 ?auto_858892 ?auto_858893 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_858993 - SURFACE
      ?auto_858994 - SURFACE
      ?auto_858995 - SURFACE
      ?auto_858997 - SURFACE
      ?auto_858996 - SURFACE
      ?auto_858998 - SURFACE
      ?auto_858999 - SURFACE
      ?auto_859000 - SURFACE
      ?auto_859001 - SURFACE
      ?auto_859002 - SURFACE
    )
    :vars
    (
      ?auto_859003 - HOIST
      ?auto_859005 - PLACE
      ?auto_859004 - PLACE
      ?auto_859006 - HOIST
      ?auto_859008 - SURFACE
      ?auto_859007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859003 ?auto_859005 ) ( IS-CRATE ?auto_859002 ) ( not ( = ?auto_859001 ?auto_859002 ) ) ( not ( = ?auto_859000 ?auto_859001 ) ) ( not ( = ?auto_859000 ?auto_859002 ) ) ( not ( = ?auto_859004 ?auto_859005 ) ) ( HOIST-AT ?auto_859006 ?auto_859004 ) ( not ( = ?auto_859003 ?auto_859006 ) ) ( AVAILABLE ?auto_859006 ) ( SURFACE-AT ?auto_859002 ?auto_859004 ) ( ON ?auto_859002 ?auto_859008 ) ( CLEAR ?auto_859002 ) ( not ( = ?auto_859001 ?auto_859008 ) ) ( not ( = ?auto_859002 ?auto_859008 ) ) ( not ( = ?auto_859000 ?auto_859008 ) ) ( TRUCK-AT ?auto_859007 ?auto_859005 ) ( SURFACE-AT ?auto_859000 ?auto_859005 ) ( CLEAR ?auto_859000 ) ( LIFTING ?auto_859003 ?auto_859001 ) ( IS-CRATE ?auto_859001 ) ( ON ?auto_858994 ?auto_858993 ) ( ON ?auto_858995 ?auto_858994 ) ( ON ?auto_858997 ?auto_858995 ) ( ON ?auto_858996 ?auto_858997 ) ( ON ?auto_858998 ?auto_858996 ) ( ON ?auto_858999 ?auto_858998 ) ( ON ?auto_859000 ?auto_858999 ) ( not ( = ?auto_858993 ?auto_858994 ) ) ( not ( = ?auto_858993 ?auto_858995 ) ) ( not ( = ?auto_858993 ?auto_858997 ) ) ( not ( = ?auto_858993 ?auto_858996 ) ) ( not ( = ?auto_858993 ?auto_858998 ) ) ( not ( = ?auto_858993 ?auto_858999 ) ) ( not ( = ?auto_858993 ?auto_859000 ) ) ( not ( = ?auto_858993 ?auto_859001 ) ) ( not ( = ?auto_858993 ?auto_859002 ) ) ( not ( = ?auto_858993 ?auto_859008 ) ) ( not ( = ?auto_858994 ?auto_858995 ) ) ( not ( = ?auto_858994 ?auto_858997 ) ) ( not ( = ?auto_858994 ?auto_858996 ) ) ( not ( = ?auto_858994 ?auto_858998 ) ) ( not ( = ?auto_858994 ?auto_858999 ) ) ( not ( = ?auto_858994 ?auto_859000 ) ) ( not ( = ?auto_858994 ?auto_859001 ) ) ( not ( = ?auto_858994 ?auto_859002 ) ) ( not ( = ?auto_858994 ?auto_859008 ) ) ( not ( = ?auto_858995 ?auto_858997 ) ) ( not ( = ?auto_858995 ?auto_858996 ) ) ( not ( = ?auto_858995 ?auto_858998 ) ) ( not ( = ?auto_858995 ?auto_858999 ) ) ( not ( = ?auto_858995 ?auto_859000 ) ) ( not ( = ?auto_858995 ?auto_859001 ) ) ( not ( = ?auto_858995 ?auto_859002 ) ) ( not ( = ?auto_858995 ?auto_859008 ) ) ( not ( = ?auto_858997 ?auto_858996 ) ) ( not ( = ?auto_858997 ?auto_858998 ) ) ( not ( = ?auto_858997 ?auto_858999 ) ) ( not ( = ?auto_858997 ?auto_859000 ) ) ( not ( = ?auto_858997 ?auto_859001 ) ) ( not ( = ?auto_858997 ?auto_859002 ) ) ( not ( = ?auto_858997 ?auto_859008 ) ) ( not ( = ?auto_858996 ?auto_858998 ) ) ( not ( = ?auto_858996 ?auto_858999 ) ) ( not ( = ?auto_858996 ?auto_859000 ) ) ( not ( = ?auto_858996 ?auto_859001 ) ) ( not ( = ?auto_858996 ?auto_859002 ) ) ( not ( = ?auto_858996 ?auto_859008 ) ) ( not ( = ?auto_858998 ?auto_858999 ) ) ( not ( = ?auto_858998 ?auto_859000 ) ) ( not ( = ?auto_858998 ?auto_859001 ) ) ( not ( = ?auto_858998 ?auto_859002 ) ) ( not ( = ?auto_858998 ?auto_859008 ) ) ( not ( = ?auto_858999 ?auto_859000 ) ) ( not ( = ?auto_858999 ?auto_859001 ) ) ( not ( = ?auto_858999 ?auto_859002 ) ) ( not ( = ?auto_858999 ?auto_859008 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859000 ?auto_859001 ?auto_859002 )
      ( MAKE-9CRATE-VERIFY ?auto_858993 ?auto_858994 ?auto_858995 ?auto_858997 ?auto_858996 ?auto_858998 ?auto_858999 ?auto_859000 ?auto_859001 ?auto_859002 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_859102 - SURFACE
      ?auto_859103 - SURFACE
      ?auto_859104 - SURFACE
      ?auto_859106 - SURFACE
      ?auto_859105 - SURFACE
      ?auto_859107 - SURFACE
      ?auto_859108 - SURFACE
      ?auto_859109 - SURFACE
      ?auto_859110 - SURFACE
      ?auto_859111 - SURFACE
    )
    :vars
    (
      ?auto_859114 - HOIST
      ?auto_859112 - PLACE
      ?auto_859117 - PLACE
      ?auto_859115 - HOIST
      ?auto_859116 - SURFACE
      ?auto_859113 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859114 ?auto_859112 ) ( IS-CRATE ?auto_859111 ) ( not ( = ?auto_859110 ?auto_859111 ) ) ( not ( = ?auto_859109 ?auto_859110 ) ) ( not ( = ?auto_859109 ?auto_859111 ) ) ( not ( = ?auto_859117 ?auto_859112 ) ) ( HOIST-AT ?auto_859115 ?auto_859117 ) ( not ( = ?auto_859114 ?auto_859115 ) ) ( AVAILABLE ?auto_859115 ) ( SURFACE-AT ?auto_859111 ?auto_859117 ) ( ON ?auto_859111 ?auto_859116 ) ( CLEAR ?auto_859111 ) ( not ( = ?auto_859110 ?auto_859116 ) ) ( not ( = ?auto_859111 ?auto_859116 ) ) ( not ( = ?auto_859109 ?auto_859116 ) ) ( TRUCK-AT ?auto_859113 ?auto_859112 ) ( SURFACE-AT ?auto_859109 ?auto_859112 ) ( CLEAR ?auto_859109 ) ( IS-CRATE ?auto_859110 ) ( AVAILABLE ?auto_859114 ) ( IN ?auto_859110 ?auto_859113 ) ( ON ?auto_859103 ?auto_859102 ) ( ON ?auto_859104 ?auto_859103 ) ( ON ?auto_859106 ?auto_859104 ) ( ON ?auto_859105 ?auto_859106 ) ( ON ?auto_859107 ?auto_859105 ) ( ON ?auto_859108 ?auto_859107 ) ( ON ?auto_859109 ?auto_859108 ) ( not ( = ?auto_859102 ?auto_859103 ) ) ( not ( = ?auto_859102 ?auto_859104 ) ) ( not ( = ?auto_859102 ?auto_859106 ) ) ( not ( = ?auto_859102 ?auto_859105 ) ) ( not ( = ?auto_859102 ?auto_859107 ) ) ( not ( = ?auto_859102 ?auto_859108 ) ) ( not ( = ?auto_859102 ?auto_859109 ) ) ( not ( = ?auto_859102 ?auto_859110 ) ) ( not ( = ?auto_859102 ?auto_859111 ) ) ( not ( = ?auto_859102 ?auto_859116 ) ) ( not ( = ?auto_859103 ?auto_859104 ) ) ( not ( = ?auto_859103 ?auto_859106 ) ) ( not ( = ?auto_859103 ?auto_859105 ) ) ( not ( = ?auto_859103 ?auto_859107 ) ) ( not ( = ?auto_859103 ?auto_859108 ) ) ( not ( = ?auto_859103 ?auto_859109 ) ) ( not ( = ?auto_859103 ?auto_859110 ) ) ( not ( = ?auto_859103 ?auto_859111 ) ) ( not ( = ?auto_859103 ?auto_859116 ) ) ( not ( = ?auto_859104 ?auto_859106 ) ) ( not ( = ?auto_859104 ?auto_859105 ) ) ( not ( = ?auto_859104 ?auto_859107 ) ) ( not ( = ?auto_859104 ?auto_859108 ) ) ( not ( = ?auto_859104 ?auto_859109 ) ) ( not ( = ?auto_859104 ?auto_859110 ) ) ( not ( = ?auto_859104 ?auto_859111 ) ) ( not ( = ?auto_859104 ?auto_859116 ) ) ( not ( = ?auto_859106 ?auto_859105 ) ) ( not ( = ?auto_859106 ?auto_859107 ) ) ( not ( = ?auto_859106 ?auto_859108 ) ) ( not ( = ?auto_859106 ?auto_859109 ) ) ( not ( = ?auto_859106 ?auto_859110 ) ) ( not ( = ?auto_859106 ?auto_859111 ) ) ( not ( = ?auto_859106 ?auto_859116 ) ) ( not ( = ?auto_859105 ?auto_859107 ) ) ( not ( = ?auto_859105 ?auto_859108 ) ) ( not ( = ?auto_859105 ?auto_859109 ) ) ( not ( = ?auto_859105 ?auto_859110 ) ) ( not ( = ?auto_859105 ?auto_859111 ) ) ( not ( = ?auto_859105 ?auto_859116 ) ) ( not ( = ?auto_859107 ?auto_859108 ) ) ( not ( = ?auto_859107 ?auto_859109 ) ) ( not ( = ?auto_859107 ?auto_859110 ) ) ( not ( = ?auto_859107 ?auto_859111 ) ) ( not ( = ?auto_859107 ?auto_859116 ) ) ( not ( = ?auto_859108 ?auto_859109 ) ) ( not ( = ?auto_859108 ?auto_859110 ) ) ( not ( = ?auto_859108 ?auto_859111 ) ) ( not ( = ?auto_859108 ?auto_859116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859109 ?auto_859110 ?auto_859111 )
      ( MAKE-9CRATE-VERIFY ?auto_859102 ?auto_859103 ?auto_859104 ?auto_859106 ?auto_859105 ?auto_859107 ?auto_859108 ?auto_859109 ?auto_859110 ?auto_859111 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_859118 - SURFACE
      ?auto_859119 - SURFACE
    )
    :vars
    (
      ?auto_859122 - HOIST
      ?auto_859120 - PLACE
      ?auto_859126 - SURFACE
      ?auto_859125 - PLACE
      ?auto_859123 - HOIST
      ?auto_859124 - SURFACE
      ?auto_859121 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859122 ?auto_859120 ) ( IS-CRATE ?auto_859119 ) ( not ( = ?auto_859118 ?auto_859119 ) ) ( not ( = ?auto_859126 ?auto_859118 ) ) ( not ( = ?auto_859126 ?auto_859119 ) ) ( not ( = ?auto_859125 ?auto_859120 ) ) ( HOIST-AT ?auto_859123 ?auto_859125 ) ( not ( = ?auto_859122 ?auto_859123 ) ) ( AVAILABLE ?auto_859123 ) ( SURFACE-AT ?auto_859119 ?auto_859125 ) ( ON ?auto_859119 ?auto_859124 ) ( CLEAR ?auto_859119 ) ( not ( = ?auto_859118 ?auto_859124 ) ) ( not ( = ?auto_859119 ?auto_859124 ) ) ( not ( = ?auto_859126 ?auto_859124 ) ) ( SURFACE-AT ?auto_859126 ?auto_859120 ) ( CLEAR ?auto_859126 ) ( IS-CRATE ?auto_859118 ) ( AVAILABLE ?auto_859122 ) ( IN ?auto_859118 ?auto_859121 ) ( TRUCK-AT ?auto_859121 ?auto_859125 ) )
    :subtasks
    ( ( !DRIVE ?auto_859121 ?auto_859125 ?auto_859120 )
      ( MAKE-2CRATE ?auto_859126 ?auto_859118 ?auto_859119 )
      ( MAKE-1CRATE-VERIFY ?auto_859118 ?auto_859119 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_859127 - SURFACE
      ?auto_859128 - SURFACE
      ?auto_859129 - SURFACE
    )
    :vars
    (
      ?auto_859134 - HOIST
      ?auto_859130 - PLACE
      ?auto_859131 - PLACE
      ?auto_859133 - HOIST
      ?auto_859135 - SURFACE
      ?auto_859132 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859134 ?auto_859130 ) ( IS-CRATE ?auto_859129 ) ( not ( = ?auto_859128 ?auto_859129 ) ) ( not ( = ?auto_859127 ?auto_859128 ) ) ( not ( = ?auto_859127 ?auto_859129 ) ) ( not ( = ?auto_859131 ?auto_859130 ) ) ( HOIST-AT ?auto_859133 ?auto_859131 ) ( not ( = ?auto_859134 ?auto_859133 ) ) ( AVAILABLE ?auto_859133 ) ( SURFACE-AT ?auto_859129 ?auto_859131 ) ( ON ?auto_859129 ?auto_859135 ) ( CLEAR ?auto_859129 ) ( not ( = ?auto_859128 ?auto_859135 ) ) ( not ( = ?auto_859129 ?auto_859135 ) ) ( not ( = ?auto_859127 ?auto_859135 ) ) ( SURFACE-AT ?auto_859127 ?auto_859130 ) ( CLEAR ?auto_859127 ) ( IS-CRATE ?auto_859128 ) ( AVAILABLE ?auto_859134 ) ( IN ?auto_859128 ?auto_859132 ) ( TRUCK-AT ?auto_859132 ?auto_859131 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_859128 ?auto_859129 )
      ( MAKE-2CRATE-VERIFY ?auto_859127 ?auto_859128 ?auto_859129 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_859136 - SURFACE
      ?auto_859137 - SURFACE
      ?auto_859138 - SURFACE
      ?auto_859139 - SURFACE
    )
    :vars
    (
      ?auto_859145 - HOIST
      ?auto_859140 - PLACE
      ?auto_859142 - PLACE
      ?auto_859141 - HOIST
      ?auto_859144 - SURFACE
      ?auto_859143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859145 ?auto_859140 ) ( IS-CRATE ?auto_859139 ) ( not ( = ?auto_859138 ?auto_859139 ) ) ( not ( = ?auto_859137 ?auto_859138 ) ) ( not ( = ?auto_859137 ?auto_859139 ) ) ( not ( = ?auto_859142 ?auto_859140 ) ) ( HOIST-AT ?auto_859141 ?auto_859142 ) ( not ( = ?auto_859145 ?auto_859141 ) ) ( AVAILABLE ?auto_859141 ) ( SURFACE-AT ?auto_859139 ?auto_859142 ) ( ON ?auto_859139 ?auto_859144 ) ( CLEAR ?auto_859139 ) ( not ( = ?auto_859138 ?auto_859144 ) ) ( not ( = ?auto_859139 ?auto_859144 ) ) ( not ( = ?auto_859137 ?auto_859144 ) ) ( SURFACE-AT ?auto_859137 ?auto_859140 ) ( CLEAR ?auto_859137 ) ( IS-CRATE ?auto_859138 ) ( AVAILABLE ?auto_859145 ) ( IN ?auto_859138 ?auto_859143 ) ( TRUCK-AT ?auto_859143 ?auto_859142 ) ( ON ?auto_859137 ?auto_859136 ) ( not ( = ?auto_859136 ?auto_859137 ) ) ( not ( = ?auto_859136 ?auto_859138 ) ) ( not ( = ?auto_859136 ?auto_859139 ) ) ( not ( = ?auto_859136 ?auto_859144 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859137 ?auto_859138 ?auto_859139 )
      ( MAKE-3CRATE-VERIFY ?auto_859136 ?auto_859137 ?auto_859138 ?auto_859139 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_859146 - SURFACE
      ?auto_859147 - SURFACE
      ?auto_859148 - SURFACE
      ?auto_859150 - SURFACE
      ?auto_859149 - SURFACE
    )
    :vars
    (
      ?auto_859156 - HOIST
      ?auto_859151 - PLACE
      ?auto_859153 - PLACE
      ?auto_859152 - HOIST
      ?auto_859155 - SURFACE
      ?auto_859154 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859156 ?auto_859151 ) ( IS-CRATE ?auto_859149 ) ( not ( = ?auto_859150 ?auto_859149 ) ) ( not ( = ?auto_859148 ?auto_859150 ) ) ( not ( = ?auto_859148 ?auto_859149 ) ) ( not ( = ?auto_859153 ?auto_859151 ) ) ( HOIST-AT ?auto_859152 ?auto_859153 ) ( not ( = ?auto_859156 ?auto_859152 ) ) ( AVAILABLE ?auto_859152 ) ( SURFACE-AT ?auto_859149 ?auto_859153 ) ( ON ?auto_859149 ?auto_859155 ) ( CLEAR ?auto_859149 ) ( not ( = ?auto_859150 ?auto_859155 ) ) ( not ( = ?auto_859149 ?auto_859155 ) ) ( not ( = ?auto_859148 ?auto_859155 ) ) ( SURFACE-AT ?auto_859148 ?auto_859151 ) ( CLEAR ?auto_859148 ) ( IS-CRATE ?auto_859150 ) ( AVAILABLE ?auto_859156 ) ( IN ?auto_859150 ?auto_859154 ) ( TRUCK-AT ?auto_859154 ?auto_859153 ) ( ON ?auto_859147 ?auto_859146 ) ( ON ?auto_859148 ?auto_859147 ) ( not ( = ?auto_859146 ?auto_859147 ) ) ( not ( = ?auto_859146 ?auto_859148 ) ) ( not ( = ?auto_859146 ?auto_859150 ) ) ( not ( = ?auto_859146 ?auto_859149 ) ) ( not ( = ?auto_859146 ?auto_859155 ) ) ( not ( = ?auto_859147 ?auto_859148 ) ) ( not ( = ?auto_859147 ?auto_859150 ) ) ( not ( = ?auto_859147 ?auto_859149 ) ) ( not ( = ?auto_859147 ?auto_859155 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859148 ?auto_859150 ?auto_859149 )
      ( MAKE-4CRATE-VERIFY ?auto_859146 ?auto_859147 ?auto_859148 ?auto_859150 ?auto_859149 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_859157 - SURFACE
      ?auto_859158 - SURFACE
      ?auto_859159 - SURFACE
      ?auto_859161 - SURFACE
      ?auto_859160 - SURFACE
      ?auto_859162 - SURFACE
    )
    :vars
    (
      ?auto_859168 - HOIST
      ?auto_859163 - PLACE
      ?auto_859165 - PLACE
      ?auto_859164 - HOIST
      ?auto_859167 - SURFACE
      ?auto_859166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859168 ?auto_859163 ) ( IS-CRATE ?auto_859162 ) ( not ( = ?auto_859160 ?auto_859162 ) ) ( not ( = ?auto_859161 ?auto_859160 ) ) ( not ( = ?auto_859161 ?auto_859162 ) ) ( not ( = ?auto_859165 ?auto_859163 ) ) ( HOIST-AT ?auto_859164 ?auto_859165 ) ( not ( = ?auto_859168 ?auto_859164 ) ) ( AVAILABLE ?auto_859164 ) ( SURFACE-AT ?auto_859162 ?auto_859165 ) ( ON ?auto_859162 ?auto_859167 ) ( CLEAR ?auto_859162 ) ( not ( = ?auto_859160 ?auto_859167 ) ) ( not ( = ?auto_859162 ?auto_859167 ) ) ( not ( = ?auto_859161 ?auto_859167 ) ) ( SURFACE-AT ?auto_859161 ?auto_859163 ) ( CLEAR ?auto_859161 ) ( IS-CRATE ?auto_859160 ) ( AVAILABLE ?auto_859168 ) ( IN ?auto_859160 ?auto_859166 ) ( TRUCK-AT ?auto_859166 ?auto_859165 ) ( ON ?auto_859158 ?auto_859157 ) ( ON ?auto_859159 ?auto_859158 ) ( ON ?auto_859161 ?auto_859159 ) ( not ( = ?auto_859157 ?auto_859158 ) ) ( not ( = ?auto_859157 ?auto_859159 ) ) ( not ( = ?auto_859157 ?auto_859161 ) ) ( not ( = ?auto_859157 ?auto_859160 ) ) ( not ( = ?auto_859157 ?auto_859162 ) ) ( not ( = ?auto_859157 ?auto_859167 ) ) ( not ( = ?auto_859158 ?auto_859159 ) ) ( not ( = ?auto_859158 ?auto_859161 ) ) ( not ( = ?auto_859158 ?auto_859160 ) ) ( not ( = ?auto_859158 ?auto_859162 ) ) ( not ( = ?auto_859158 ?auto_859167 ) ) ( not ( = ?auto_859159 ?auto_859161 ) ) ( not ( = ?auto_859159 ?auto_859160 ) ) ( not ( = ?auto_859159 ?auto_859162 ) ) ( not ( = ?auto_859159 ?auto_859167 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859161 ?auto_859160 ?auto_859162 )
      ( MAKE-5CRATE-VERIFY ?auto_859157 ?auto_859158 ?auto_859159 ?auto_859161 ?auto_859160 ?auto_859162 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_859169 - SURFACE
      ?auto_859170 - SURFACE
      ?auto_859171 - SURFACE
      ?auto_859173 - SURFACE
      ?auto_859172 - SURFACE
      ?auto_859174 - SURFACE
      ?auto_859175 - SURFACE
    )
    :vars
    (
      ?auto_859181 - HOIST
      ?auto_859176 - PLACE
      ?auto_859178 - PLACE
      ?auto_859177 - HOIST
      ?auto_859180 - SURFACE
      ?auto_859179 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859181 ?auto_859176 ) ( IS-CRATE ?auto_859175 ) ( not ( = ?auto_859174 ?auto_859175 ) ) ( not ( = ?auto_859172 ?auto_859174 ) ) ( not ( = ?auto_859172 ?auto_859175 ) ) ( not ( = ?auto_859178 ?auto_859176 ) ) ( HOIST-AT ?auto_859177 ?auto_859178 ) ( not ( = ?auto_859181 ?auto_859177 ) ) ( AVAILABLE ?auto_859177 ) ( SURFACE-AT ?auto_859175 ?auto_859178 ) ( ON ?auto_859175 ?auto_859180 ) ( CLEAR ?auto_859175 ) ( not ( = ?auto_859174 ?auto_859180 ) ) ( not ( = ?auto_859175 ?auto_859180 ) ) ( not ( = ?auto_859172 ?auto_859180 ) ) ( SURFACE-AT ?auto_859172 ?auto_859176 ) ( CLEAR ?auto_859172 ) ( IS-CRATE ?auto_859174 ) ( AVAILABLE ?auto_859181 ) ( IN ?auto_859174 ?auto_859179 ) ( TRUCK-AT ?auto_859179 ?auto_859178 ) ( ON ?auto_859170 ?auto_859169 ) ( ON ?auto_859171 ?auto_859170 ) ( ON ?auto_859173 ?auto_859171 ) ( ON ?auto_859172 ?auto_859173 ) ( not ( = ?auto_859169 ?auto_859170 ) ) ( not ( = ?auto_859169 ?auto_859171 ) ) ( not ( = ?auto_859169 ?auto_859173 ) ) ( not ( = ?auto_859169 ?auto_859172 ) ) ( not ( = ?auto_859169 ?auto_859174 ) ) ( not ( = ?auto_859169 ?auto_859175 ) ) ( not ( = ?auto_859169 ?auto_859180 ) ) ( not ( = ?auto_859170 ?auto_859171 ) ) ( not ( = ?auto_859170 ?auto_859173 ) ) ( not ( = ?auto_859170 ?auto_859172 ) ) ( not ( = ?auto_859170 ?auto_859174 ) ) ( not ( = ?auto_859170 ?auto_859175 ) ) ( not ( = ?auto_859170 ?auto_859180 ) ) ( not ( = ?auto_859171 ?auto_859173 ) ) ( not ( = ?auto_859171 ?auto_859172 ) ) ( not ( = ?auto_859171 ?auto_859174 ) ) ( not ( = ?auto_859171 ?auto_859175 ) ) ( not ( = ?auto_859171 ?auto_859180 ) ) ( not ( = ?auto_859173 ?auto_859172 ) ) ( not ( = ?auto_859173 ?auto_859174 ) ) ( not ( = ?auto_859173 ?auto_859175 ) ) ( not ( = ?auto_859173 ?auto_859180 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859172 ?auto_859174 ?auto_859175 )
      ( MAKE-6CRATE-VERIFY ?auto_859169 ?auto_859170 ?auto_859171 ?auto_859173 ?auto_859172 ?auto_859174 ?auto_859175 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_859182 - SURFACE
      ?auto_859183 - SURFACE
      ?auto_859184 - SURFACE
      ?auto_859186 - SURFACE
      ?auto_859185 - SURFACE
      ?auto_859187 - SURFACE
      ?auto_859188 - SURFACE
      ?auto_859189 - SURFACE
    )
    :vars
    (
      ?auto_859195 - HOIST
      ?auto_859190 - PLACE
      ?auto_859192 - PLACE
      ?auto_859191 - HOIST
      ?auto_859194 - SURFACE
      ?auto_859193 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859195 ?auto_859190 ) ( IS-CRATE ?auto_859189 ) ( not ( = ?auto_859188 ?auto_859189 ) ) ( not ( = ?auto_859187 ?auto_859188 ) ) ( not ( = ?auto_859187 ?auto_859189 ) ) ( not ( = ?auto_859192 ?auto_859190 ) ) ( HOIST-AT ?auto_859191 ?auto_859192 ) ( not ( = ?auto_859195 ?auto_859191 ) ) ( AVAILABLE ?auto_859191 ) ( SURFACE-AT ?auto_859189 ?auto_859192 ) ( ON ?auto_859189 ?auto_859194 ) ( CLEAR ?auto_859189 ) ( not ( = ?auto_859188 ?auto_859194 ) ) ( not ( = ?auto_859189 ?auto_859194 ) ) ( not ( = ?auto_859187 ?auto_859194 ) ) ( SURFACE-AT ?auto_859187 ?auto_859190 ) ( CLEAR ?auto_859187 ) ( IS-CRATE ?auto_859188 ) ( AVAILABLE ?auto_859195 ) ( IN ?auto_859188 ?auto_859193 ) ( TRUCK-AT ?auto_859193 ?auto_859192 ) ( ON ?auto_859183 ?auto_859182 ) ( ON ?auto_859184 ?auto_859183 ) ( ON ?auto_859186 ?auto_859184 ) ( ON ?auto_859185 ?auto_859186 ) ( ON ?auto_859187 ?auto_859185 ) ( not ( = ?auto_859182 ?auto_859183 ) ) ( not ( = ?auto_859182 ?auto_859184 ) ) ( not ( = ?auto_859182 ?auto_859186 ) ) ( not ( = ?auto_859182 ?auto_859185 ) ) ( not ( = ?auto_859182 ?auto_859187 ) ) ( not ( = ?auto_859182 ?auto_859188 ) ) ( not ( = ?auto_859182 ?auto_859189 ) ) ( not ( = ?auto_859182 ?auto_859194 ) ) ( not ( = ?auto_859183 ?auto_859184 ) ) ( not ( = ?auto_859183 ?auto_859186 ) ) ( not ( = ?auto_859183 ?auto_859185 ) ) ( not ( = ?auto_859183 ?auto_859187 ) ) ( not ( = ?auto_859183 ?auto_859188 ) ) ( not ( = ?auto_859183 ?auto_859189 ) ) ( not ( = ?auto_859183 ?auto_859194 ) ) ( not ( = ?auto_859184 ?auto_859186 ) ) ( not ( = ?auto_859184 ?auto_859185 ) ) ( not ( = ?auto_859184 ?auto_859187 ) ) ( not ( = ?auto_859184 ?auto_859188 ) ) ( not ( = ?auto_859184 ?auto_859189 ) ) ( not ( = ?auto_859184 ?auto_859194 ) ) ( not ( = ?auto_859186 ?auto_859185 ) ) ( not ( = ?auto_859186 ?auto_859187 ) ) ( not ( = ?auto_859186 ?auto_859188 ) ) ( not ( = ?auto_859186 ?auto_859189 ) ) ( not ( = ?auto_859186 ?auto_859194 ) ) ( not ( = ?auto_859185 ?auto_859187 ) ) ( not ( = ?auto_859185 ?auto_859188 ) ) ( not ( = ?auto_859185 ?auto_859189 ) ) ( not ( = ?auto_859185 ?auto_859194 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859187 ?auto_859188 ?auto_859189 )
      ( MAKE-7CRATE-VERIFY ?auto_859182 ?auto_859183 ?auto_859184 ?auto_859186 ?auto_859185 ?auto_859187 ?auto_859188 ?auto_859189 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_859196 - SURFACE
      ?auto_859197 - SURFACE
      ?auto_859198 - SURFACE
      ?auto_859200 - SURFACE
      ?auto_859199 - SURFACE
      ?auto_859201 - SURFACE
      ?auto_859202 - SURFACE
      ?auto_859203 - SURFACE
      ?auto_859204 - SURFACE
    )
    :vars
    (
      ?auto_859210 - HOIST
      ?auto_859205 - PLACE
      ?auto_859207 - PLACE
      ?auto_859206 - HOIST
      ?auto_859209 - SURFACE
      ?auto_859208 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859210 ?auto_859205 ) ( IS-CRATE ?auto_859204 ) ( not ( = ?auto_859203 ?auto_859204 ) ) ( not ( = ?auto_859202 ?auto_859203 ) ) ( not ( = ?auto_859202 ?auto_859204 ) ) ( not ( = ?auto_859207 ?auto_859205 ) ) ( HOIST-AT ?auto_859206 ?auto_859207 ) ( not ( = ?auto_859210 ?auto_859206 ) ) ( AVAILABLE ?auto_859206 ) ( SURFACE-AT ?auto_859204 ?auto_859207 ) ( ON ?auto_859204 ?auto_859209 ) ( CLEAR ?auto_859204 ) ( not ( = ?auto_859203 ?auto_859209 ) ) ( not ( = ?auto_859204 ?auto_859209 ) ) ( not ( = ?auto_859202 ?auto_859209 ) ) ( SURFACE-AT ?auto_859202 ?auto_859205 ) ( CLEAR ?auto_859202 ) ( IS-CRATE ?auto_859203 ) ( AVAILABLE ?auto_859210 ) ( IN ?auto_859203 ?auto_859208 ) ( TRUCK-AT ?auto_859208 ?auto_859207 ) ( ON ?auto_859197 ?auto_859196 ) ( ON ?auto_859198 ?auto_859197 ) ( ON ?auto_859200 ?auto_859198 ) ( ON ?auto_859199 ?auto_859200 ) ( ON ?auto_859201 ?auto_859199 ) ( ON ?auto_859202 ?auto_859201 ) ( not ( = ?auto_859196 ?auto_859197 ) ) ( not ( = ?auto_859196 ?auto_859198 ) ) ( not ( = ?auto_859196 ?auto_859200 ) ) ( not ( = ?auto_859196 ?auto_859199 ) ) ( not ( = ?auto_859196 ?auto_859201 ) ) ( not ( = ?auto_859196 ?auto_859202 ) ) ( not ( = ?auto_859196 ?auto_859203 ) ) ( not ( = ?auto_859196 ?auto_859204 ) ) ( not ( = ?auto_859196 ?auto_859209 ) ) ( not ( = ?auto_859197 ?auto_859198 ) ) ( not ( = ?auto_859197 ?auto_859200 ) ) ( not ( = ?auto_859197 ?auto_859199 ) ) ( not ( = ?auto_859197 ?auto_859201 ) ) ( not ( = ?auto_859197 ?auto_859202 ) ) ( not ( = ?auto_859197 ?auto_859203 ) ) ( not ( = ?auto_859197 ?auto_859204 ) ) ( not ( = ?auto_859197 ?auto_859209 ) ) ( not ( = ?auto_859198 ?auto_859200 ) ) ( not ( = ?auto_859198 ?auto_859199 ) ) ( not ( = ?auto_859198 ?auto_859201 ) ) ( not ( = ?auto_859198 ?auto_859202 ) ) ( not ( = ?auto_859198 ?auto_859203 ) ) ( not ( = ?auto_859198 ?auto_859204 ) ) ( not ( = ?auto_859198 ?auto_859209 ) ) ( not ( = ?auto_859200 ?auto_859199 ) ) ( not ( = ?auto_859200 ?auto_859201 ) ) ( not ( = ?auto_859200 ?auto_859202 ) ) ( not ( = ?auto_859200 ?auto_859203 ) ) ( not ( = ?auto_859200 ?auto_859204 ) ) ( not ( = ?auto_859200 ?auto_859209 ) ) ( not ( = ?auto_859199 ?auto_859201 ) ) ( not ( = ?auto_859199 ?auto_859202 ) ) ( not ( = ?auto_859199 ?auto_859203 ) ) ( not ( = ?auto_859199 ?auto_859204 ) ) ( not ( = ?auto_859199 ?auto_859209 ) ) ( not ( = ?auto_859201 ?auto_859202 ) ) ( not ( = ?auto_859201 ?auto_859203 ) ) ( not ( = ?auto_859201 ?auto_859204 ) ) ( not ( = ?auto_859201 ?auto_859209 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859202 ?auto_859203 ?auto_859204 )
      ( MAKE-8CRATE-VERIFY ?auto_859196 ?auto_859197 ?auto_859198 ?auto_859200 ?auto_859199 ?auto_859201 ?auto_859202 ?auto_859203 ?auto_859204 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_859211 - SURFACE
      ?auto_859212 - SURFACE
      ?auto_859213 - SURFACE
      ?auto_859215 - SURFACE
      ?auto_859214 - SURFACE
      ?auto_859216 - SURFACE
      ?auto_859217 - SURFACE
      ?auto_859218 - SURFACE
      ?auto_859219 - SURFACE
      ?auto_859220 - SURFACE
    )
    :vars
    (
      ?auto_859226 - HOIST
      ?auto_859221 - PLACE
      ?auto_859223 - PLACE
      ?auto_859222 - HOIST
      ?auto_859225 - SURFACE
      ?auto_859224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859226 ?auto_859221 ) ( IS-CRATE ?auto_859220 ) ( not ( = ?auto_859219 ?auto_859220 ) ) ( not ( = ?auto_859218 ?auto_859219 ) ) ( not ( = ?auto_859218 ?auto_859220 ) ) ( not ( = ?auto_859223 ?auto_859221 ) ) ( HOIST-AT ?auto_859222 ?auto_859223 ) ( not ( = ?auto_859226 ?auto_859222 ) ) ( AVAILABLE ?auto_859222 ) ( SURFACE-AT ?auto_859220 ?auto_859223 ) ( ON ?auto_859220 ?auto_859225 ) ( CLEAR ?auto_859220 ) ( not ( = ?auto_859219 ?auto_859225 ) ) ( not ( = ?auto_859220 ?auto_859225 ) ) ( not ( = ?auto_859218 ?auto_859225 ) ) ( SURFACE-AT ?auto_859218 ?auto_859221 ) ( CLEAR ?auto_859218 ) ( IS-CRATE ?auto_859219 ) ( AVAILABLE ?auto_859226 ) ( IN ?auto_859219 ?auto_859224 ) ( TRUCK-AT ?auto_859224 ?auto_859223 ) ( ON ?auto_859212 ?auto_859211 ) ( ON ?auto_859213 ?auto_859212 ) ( ON ?auto_859215 ?auto_859213 ) ( ON ?auto_859214 ?auto_859215 ) ( ON ?auto_859216 ?auto_859214 ) ( ON ?auto_859217 ?auto_859216 ) ( ON ?auto_859218 ?auto_859217 ) ( not ( = ?auto_859211 ?auto_859212 ) ) ( not ( = ?auto_859211 ?auto_859213 ) ) ( not ( = ?auto_859211 ?auto_859215 ) ) ( not ( = ?auto_859211 ?auto_859214 ) ) ( not ( = ?auto_859211 ?auto_859216 ) ) ( not ( = ?auto_859211 ?auto_859217 ) ) ( not ( = ?auto_859211 ?auto_859218 ) ) ( not ( = ?auto_859211 ?auto_859219 ) ) ( not ( = ?auto_859211 ?auto_859220 ) ) ( not ( = ?auto_859211 ?auto_859225 ) ) ( not ( = ?auto_859212 ?auto_859213 ) ) ( not ( = ?auto_859212 ?auto_859215 ) ) ( not ( = ?auto_859212 ?auto_859214 ) ) ( not ( = ?auto_859212 ?auto_859216 ) ) ( not ( = ?auto_859212 ?auto_859217 ) ) ( not ( = ?auto_859212 ?auto_859218 ) ) ( not ( = ?auto_859212 ?auto_859219 ) ) ( not ( = ?auto_859212 ?auto_859220 ) ) ( not ( = ?auto_859212 ?auto_859225 ) ) ( not ( = ?auto_859213 ?auto_859215 ) ) ( not ( = ?auto_859213 ?auto_859214 ) ) ( not ( = ?auto_859213 ?auto_859216 ) ) ( not ( = ?auto_859213 ?auto_859217 ) ) ( not ( = ?auto_859213 ?auto_859218 ) ) ( not ( = ?auto_859213 ?auto_859219 ) ) ( not ( = ?auto_859213 ?auto_859220 ) ) ( not ( = ?auto_859213 ?auto_859225 ) ) ( not ( = ?auto_859215 ?auto_859214 ) ) ( not ( = ?auto_859215 ?auto_859216 ) ) ( not ( = ?auto_859215 ?auto_859217 ) ) ( not ( = ?auto_859215 ?auto_859218 ) ) ( not ( = ?auto_859215 ?auto_859219 ) ) ( not ( = ?auto_859215 ?auto_859220 ) ) ( not ( = ?auto_859215 ?auto_859225 ) ) ( not ( = ?auto_859214 ?auto_859216 ) ) ( not ( = ?auto_859214 ?auto_859217 ) ) ( not ( = ?auto_859214 ?auto_859218 ) ) ( not ( = ?auto_859214 ?auto_859219 ) ) ( not ( = ?auto_859214 ?auto_859220 ) ) ( not ( = ?auto_859214 ?auto_859225 ) ) ( not ( = ?auto_859216 ?auto_859217 ) ) ( not ( = ?auto_859216 ?auto_859218 ) ) ( not ( = ?auto_859216 ?auto_859219 ) ) ( not ( = ?auto_859216 ?auto_859220 ) ) ( not ( = ?auto_859216 ?auto_859225 ) ) ( not ( = ?auto_859217 ?auto_859218 ) ) ( not ( = ?auto_859217 ?auto_859219 ) ) ( not ( = ?auto_859217 ?auto_859220 ) ) ( not ( = ?auto_859217 ?auto_859225 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859218 ?auto_859219 ?auto_859220 )
      ( MAKE-9CRATE-VERIFY ?auto_859211 ?auto_859212 ?auto_859213 ?auto_859215 ?auto_859214 ?auto_859216 ?auto_859217 ?auto_859218 ?auto_859219 ?auto_859220 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_859227 - SURFACE
      ?auto_859228 - SURFACE
    )
    :vars
    (
      ?auto_859235 - HOIST
      ?auto_859230 - PLACE
      ?auto_859229 - SURFACE
      ?auto_859232 - PLACE
      ?auto_859231 - HOIST
      ?auto_859234 - SURFACE
      ?auto_859233 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859235 ?auto_859230 ) ( IS-CRATE ?auto_859228 ) ( not ( = ?auto_859227 ?auto_859228 ) ) ( not ( = ?auto_859229 ?auto_859227 ) ) ( not ( = ?auto_859229 ?auto_859228 ) ) ( not ( = ?auto_859232 ?auto_859230 ) ) ( HOIST-AT ?auto_859231 ?auto_859232 ) ( not ( = ?auto_859235 ?auto_859231 ) ) ( SURFACE-AT ?auto_859228 ?auto_859232 ) ( ON ?auto_859228 ?auto_859234 ) ( CLEAR ?auto_859228 ) ( not ( = ?auto_859227 ?auto_859234 ) ) ( not ( = ?auto_859228 ?auto_859234 ) ) ( not ( = ?auto_859229 ?auto_859234 ) ) ( SURFACE-AT ?auto_859229 ?auto_859230 ) ( CLEAR ?auto_859229 ) ( IS-CRATE ?auto_859227 ) ( AVAILABLE ?auto_859235 ) ( TRUCK-AT ?auto_859233 ?auto_859232 ) ( LIFTING ?auto_859231 ?auto_859227 ) )
    :subtasks
    ( ( !LOAD ?auto_859231 ?auto_859227 ?auto_859233 ?auto_859232 )
      ( MAKE-2CRATE ?auto_859229 ?auto_859227 ?auto_859228 )
      ( MAKE-1CRATE-VERIFY ?auto_859227 ?auto_859228 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_859236 - SURFACE
      ?auto_859237 - SURFACE
      ?auto_859238 - SURFACE
    )
    :vars
    (
      ?auto_859241 - HOIST
      ?auto_859239 - PLACE
      ?auto_859242 - PLACE
      ?auto_859243 - HOIST
      ?auto_859240 - SURFACE
      ?auto_859244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859241 ?auto_859239 ) ( IS-CRATE ?auto_859238 ) ( not ( = ?auto_859237 ?auto_859238 ) ) ( not ( = ?auto_859236 ?auto_859237 ) ) ( not ( = ?auto_859236 ?auto_859238 ) ) ( not ( = ?auto_859242 ?auto_859239 ) ) ( HOIST-AT ?auto_859243 ?auto_859242 ) ( not ( = ?auto_859241 ?auto_859243 ) ) ( SURFACE-AT ?auto_859238 ?auto_859242 ) ( ON ?auto_859238 ?auto_859240 ) ( CLEAR ?auto_859238 ) ( not ( = ?auto_859237 ?auto_859240 ) ) ( not ( = ?auto_859238 ?auto_859240 ) ) ( not ( = ?auto_859236 ?auto_859240 ) ) ( SURFACE-AT ?auto_859236 ?auto_859239 ) ( CLEAR ?auto_859236 ) ( IS-CRATE ?auto_859237 ) ( AVAILABLE ?auto_859241 ) ( TRUCK-AT ?auto_859244 ?auto_859242 ) ( LIFTING ?auto_859243 ?auto_859237 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_859237 ?auto_859238 )
      ( MAKE-2CRATE-VERIFY ?auto_859236 ?auto_859237 ?auto_859238 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_859245 - SURFACE
      ?auto_859246 - SURFACE
      ?auto_859247 - SURFACE
      ?auto_859248 - SURFACE
    )
    :vars
    (
      ?auto_859250 - HOIST
      ?auto_859253 - PLACE
      ?auto_859254 - PLACE
      ?auto_859249 - HOIST
      ?auto_859251 - SURFACE
      ?auto_859252 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859250 ?auto_859253 ) ( IS-CRATE ?auto_859248 ) ( not ( = ?auto_859247 ?auto_859248 ) ) ( not ( = ?auto_859246 ?auto_859247 ) ) ( not ( = ?auto_859246 ?auto_859248 ) ) ( not ( = ?auto_859254 ?auto_859253 ) ) ( HOIST-AT ?auto_859249 ?auto_859254 ) ( not ( = ?auto_859250 ?auto_859249 ) ) ( SURFACE-AT ?auto_859248 ?auto_859254 ) ( ON ?auto_859248 ?auto_859251 ) ( CLEAR ?auto_859248 ) ( not ( = ?auto_859247 ?auto_859251 ) ) ( not ( = ?auto_859248 ?auto_859251 ) ) ( not ( = ?auto_859246 ?auto_859251 ) ) ( SURFACE-AT ?auto_859246 ?auto_859253 ) ( CLEAR ?auto_859246 ) ( IS-CRATE ?auto_859247 ) ( AVAILABLE ?auto_859250 ) ( TRUCK-AT ?auto_859252 ?auto_859254 ) ( LIFTING ?auto_859249 ?auto_859247 ) ( ON ?auto_859246 ?auto_859245 ) ( not ( = ?auto_859245 ?auto_859246 ) ) ( not ( = ?auto_859245 ?auto_859247 ) ) ( not ( = ?auto_859245 ?auto_859248 ) ) ( not ( = ?auto_859245 ?auto_859251 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859246 ?auto_859247 ?auto_859248 )
      ( MAKE-3CRATE-VERIFY ?auto_859245 ?auto_859246 ?auto_859247 ?auto_859248 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_859255 - SURFACE
      ?auto_859256 - SURFACE
      ?auto_859257 - SURFACE
      ?auto_859259 - SURFACE
      ?auto_859258 - SURFACE
    )
    :vars
    (
      ?auto_859261 - HOIST
      ?auto_859264 - PLACE
      ?auto_859265 - PLACE
      ?auto_859260 - HOIST
      ?auto_859262 - SURFACE
      ?auto_859263 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859261 ?auto_859264 ) ( IS-CRATE ?auto_859258 ) ( not ( = ?auto_859259 ?auto_859258 ) ) ( not ( = ?auto_859257 ?auto_859259 ) ) ( not ( = ?auto_859257 ?auto_859258 ) ) ( not ( = ?auto_859265 ?auto_859264 ) ) ( HOIST-AT ?auto_859260 ?auto_859265 ) ( not ( = ?auto_859261 ?auto_859260 ) ) ( SURFACE-AT ?auto_859258 ?auto_859265 ) ( ON ?auto_859258 ?auto_859262 ) ( CLEAR ?auto_859258 ) ( not ( = ?auto_859259 ?auto_859262 ) ) ( not ( = ?auto_859258 ?auto_859262 ) ) ( not ( = ?auto_859257 ?auto_859262 ) ) ( SURFACE-AT ?auto_859257 ?auto_859264 ) ( CLEAR ?auto_859257 ) ( IS-CRATE ?auto_859259 ) ( AVAILABLE ?auto_859261 ) ( TRUCK-AT ?auto_859263 ?auto_859265 ) ( LIFTING ?auto_859260 ?auto_859259 ) ( ON ?auto_859256 ?auto_859255 ) ( ON ?auto_859257 ?auto_859256 ) ( not ( = ?auto_859255 ?auto_859256 ) ) ( not ( = ?auto_859255 ?auto_859257 ) ) ( not ( = ?auto_859255 ?auto_859259 ) ) ( not ( = ?auto_859255 ?auto_859258 ) ) ( not ( = ?auto_859255 ?auto_859262 ) ) ( not ( = ?auto_859256 ?auto_859257 ) ) ( not ( = ?auto_859256 ?auto_859259 ) ) ( not ( = ?auto_859256 ?auto_859258 ) ) ( not ( = ?auto_859256 ?auto_859262 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859257 ?auto_859259 ?auto_859258 )
      ( MAKE-4CRATE-VERIFY ?auto_859255 ?auto_859256 ?auto_859257 ?auto_859259 ?auto_859258 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_859266 - SURFACE
      ?auto_859267 - SURFACE
      ?auto_859268 - SURFACE
      ?auto_859270 - SURFACE
      ?auto_859269 - SURFACE
      ?auto_859271 - SURFACE
    )
    :vars
    (
      ?auto_859273 - HOIST
      ?auto_859276 - PLACE
      ?auto_859277 - PLACE
      ?auto_859272 - HOIST
      ?auto_859274 - SURFACE
      ?auto_859275 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859273 ?auto_859276 ) ( IS-CRATE ?auto_859271 ) ( not ( = ?auto_859269 ?auto_859271 ) ) ( not ( = ?auto_859270 ?auto_859269 ) ) ( not ( = ?auto_859270 ?auto_859271 ) ) ( not ( = ?auto_859277 ?auto_859276 ) ) ( HOIST-AT ?auto_859272 ?auto_859277 ) ( not ( = ?auto_859273 ?auto_859272 ) ) ( SURFACE-AT ?auto_859271 ?auto_859277 ) ( ON ?auto_859271 ?auto_859274 ) ( CLEAR ?auto_859271 ) ( not ( = ?auto_859269 ?auto_859274 ) ) ( not ( = ?auto_859271 ?auto_859274 ) ) ( not ( = ?auto_859270 ?auto_859274 ) ) ( SURFACE-AT ?auto_859270 ?auto_859276 ) ( CLEAR ?auto_859270 ) ( IS-CRATE ?auto_859269 ) ( AVAILABLE ?auto_859273 ) ( TRUCK-AT ?auto_859275 ?auto_859277 ) ( LIFTING ?auto_859272 ?auto_859269 ) ( ON ?auto_859267 ?auto_859266 ) ( ON ?auto_859268 ?auto_859267 ) ( ON ?auto_859270 ?auto_859268 ) ( not ( = ?auto_859266 ?auto_859267 ) ) ( not ( = ?auto_859266 ?auto_859268 ) ) ( not ( = ?auto_859266 ?auto_859270 ) ) ( not ( = ?auto_859266 ?auto_859269 ) ) ( not ( = ?auto_859266 ?auto_859271 ) ) ( not ( = ?auto_859266 ?auto_859274 ) ) ( not ( = ?auto_859267 ?auto_859268 ) ) ( not ( = ?auto_859267 ?auto_859270 ) ) ( not ( = ?auto_859267 ?auto_859269 ) ) ( not ( = ?auto_859267 ?auto_859271 ) ) ( not ( = ?auto_859267 ?auto_859274 ) ) ( not ( = ?auto_859268 ?auto_859270 ) ) ( not ( = ?auto_859268 ?auto_859269 ) ) ( not ( = ?auto_859268 ?auto_859271 ) ) ( not ( = ?auto_859268 ?auto_859274 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859270 ?auto_859269 ?auto_859271 )
      ( MAKE-5CRATE-VERIFY ?auto_859266 ?auto_859267 ?auto_859268 ?auto_859270 ?auto_859269 ?auto_859271 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_859278 - SURFACE
      ?auto_859279 - SURFACE
      ?auto_859280 - SURFACE
      ?auto_859282 - SURFACE
      ?auto_859281 - SURFACE
      ?auto_859283 - SURFACE
      ?auto_859284 - SURFACE
    )
    :vars
    (
      ?auto_859286 - HOIST
      ?auto_859289 - PLACE
      ?auto_859290 - PLACE
      ?auto_859285 - HOIST
      ?auto_859287 - SURFACE
      ?auto_859288 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859286 ?auto_859289 ) ( IS-CRATE ?auto_859284 ) ( not ( = ?auto_859283 ?auto_859284 ) ) ( not ( = ?auto_859281 ?auto_859283 ) ) ( not ( = ?auto_859281 ?auto_859284 ) ) ( not ( = ?auto_859290 ?auto_859289 ) ) ( HOIST-AT ?auto_859285 ?auto_859290 ) ( not ( = ?auto_859286 ?auto_859285 ) ) ( SURFACE-AT ?auto_859284 ?auto_859290 ) ( ON ?auto_859284 ?auto_859287 ) ( CLEAR ?auto_859284 ) ( not ( = ?auto_859283 ?auto_859287 ) ) ( not ( = ?auto_859284 ?auto_859287 ) ) ( not ( = ?auto_859281 ?auto_859287 ) ) ( SURFACE-AT ?auto_859281 ?auto_859289 ) ( CLEAR ?auto_859281 ) ( IS-CRATE ?auto_859283 ) ( AVAILABLE ?auto_859286 ) ( TRUCK-AT ?auto_859288 ?auto_859290 ) ( LIFTING ?auto_859285 ?auto_859283 ) ( ON ?auto_859279 ?auto_859278 ) ( ON ?auto_859280 ?auto_859279 ) ( ON ?auto_859282 ?auto_859280 ) ( ON ?auto_859281 ?auto_859282 ) ( not ( = ?auto_859278 ?auto_859279 ) ) ( not ( = ?auto_859278 ?auto_859280 ) ) ( not ( = ?auto_859278 ?auto_859282 ) ) ( not ( = ?auto_859278 ?auto_859281 ) ) ( not ( = ?auto_859278 ?auto_859283 ) ) ( not ( = ?auto_859278 ?auto_859284 ) ) ( not ( = ?auto_859278 ?auto_859287 ) ) ( not ( = ?auto_859279 ?auto_859280 ) ) ( not ( = ?auto_859279 ?auto_859282 ) ) ( not ( = ?auto_859279 ?auto_859281 ) ) ( not ( = ?auto_859279 ?auto_859283 ) ) ( not ( = ?auto_859279 ?auto_859284 ) ) ( not ( = ?auto_859279 ?auto_859287 ) ) ( not ( = ?auto_859280 ?auto_859282 ) ) ( not ( = ?auto_859280 ?auto_859281 ) ) ( not ( = ?auto_859280 ?auto_859283 ) ) ( not ( = ?auto_859280 ?auto_859284 ) ) ( not ( = ?auto_859280 ?auto_859287 ) ) ( not ( = ?auto_859282 ?auto_859281 ) ) ( not ( = ?auto_859282 ?auto_859283 ) ) ( not ( = ?auto_859282 ?auto_859284 ) ) ( not ( = ?auto_859282 ?auto_859287 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859281 ?auto_859283 ?auto_859284 )
      ( MAKE-6CRATE-VERIFY ?auto_859278 ?auto_859279 ?auto_859280 ?auto_859282 ?auto_859281 ?auto_859283 ?auto_859284 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_859291 - SURFACE
      ?auto_859292 - SURFACE
      ?auto_859293 - SURFACE
      ?auto_859295 - SURFACE
      ?auto_859294 - SURFACE
      ?auto_859296 - SURFACE
      ?auto_859297 - SURFACE
      ?auto_859298 - SURFACE
    )
    :vars
    (
      ?auto_859300 - HOIST
      ?auto_859303 - PLACE
      ?auto_859304 - PLACE
      ?auto_859299 - HOIST
      ?auto_859301 - SURFACE
      ?auto_859302 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859300 ?auto_859303 ) ( IS-CRATE ?auto_859298 ) ( not ( = ?auto_859297 ?auto_859298 ) ) ( not ( = ?auto_859296 ?auto_859297 ) ) ( not ( = ?auto_859296 ?auto_859298 ) ) ( not ( = ?auto_859304 ?auto_859303 ) ) ( HOIST-AT ?auto_859299 ?auto_859304 ) ( not ( = ?auto_859300 ?auto_859299 ) ) ( SURFACE-AT ?auto_859298 ?auto_859304 ) ( ON ?auto_859298 ?auto_859301 ) ( CLEAR ?auto_859298 ) ( not ( = ?auto_859297 ?auto_859301 ) ) ( not ( = ?auto_859298 ?auto_859301 ) ) ( not ( = ?auto_859296 ?auto_859301 ) ) ( SURFACE-AT ?auto_859296 ?auto_859303 ) ( CLEAR ?auto_859296 ) ( IS-CRATE ?auto_859297 ) ( AVAILABLE ?auto_859300 ) ( TRUCK-AT ?auto_859302 ?auto_859304 ) ( LIFTING ?auto_859299 ?auto_859297 ) ( ON ?auto_859292 ?auto_859291 ) ( ON ?auto_859293 ?auto_859292 ) ( ON ?auto_859295 ?auto_859293 ) ( ON ?auto_859294 ?auto_859295 ) ( ON ?auto_859296 ?auto_859294 ) ( not ( = ?auto_859291 ?auto_859292 ) ) ( not ( = ?auto_859291 ?auto_859293 ) ) ( not ( = ?auto_859291 ?auto_859295 ) ) ( not ( = ?auto_859291 ?auto_859294 ) ) ( not ( = ?auto_859291 ?auto_859296 ) ) ( not ( = ?auto_859291 ?auto_859297 ) ) ( not ( = ?auto_859291 ?auto_859298 ) ) ( not ( = ?auto_859291 ?auto_859301 ) ) ( not ( = ?auto_859292 ?auto_859293 ) ) ( not ( = ?auto_859292 ?auto_859295 ) ) ( not ( = ?auto_859292 ?auto_859294 ) ) ( not ( = ?auto_859292 ?auto_859296 ) ) ( not ( = ?auto_859292 ?auto_859297 ) ) ( not ( = ?auto_859292 ?auto_859298 ) ) ( not ( = ?auto_859292 ?auto_859301 ) ) ( not ( = ?auto_859293 ?auto_859295 ) ) ( not ( = ?auto_859293 ?auto_859294 ) ) ( not ( = ?auto_859293 ?auto_859296 ) ) ( not ( = ?auto_859293 ?auto_859297 ) ) ( not ( = ?auto_859293 ?auto_859298 ) ) ( not ( = ?auto_859293 ?auto_859301 ) ) ( not ( = ?auto_859295 ?auto_859294 ) ) ( not ( = ?auto_859295 ?auto_859296 ) ) ( not ( = ?auto_859295 ?auto_859297 ) ) ( not ( = ?auto_859295 ?auto_859298 ) ) ( not ( = ?auto_859295 ?auto_859301 ) ) ( not ( = ?auto_859294 ?auto_859296 ) ) ( not ( = ?auto_859294 ?auto_859297 ) ) ( not ( = ?auto_859294 ?auto_859298 ) ) ( not ( = ?auto_859294 ?auto_859301 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859296 ?auto_859297 ?auto_859298 )
      ( MAKE-7CRATE-VERIFY ?auto_859291 ?auto_859292 ?auto_859293 ?auto_859295 ?auto_859294 ?auto_859296 ?auto_859297 ?auto_859298 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_859305 - SURFACE
      ?auto_859306 - SURFACE
      ?auto_859307 - SURFACE
      ?auto_859309 - SURFACE
      ?auto_859308 - SURFACE
      ?auto_859310 - SURFACE
      ?auto_859311 - SURFACE
      ?auto_859312 - SURFACE
      ?auto_859313 - SURFACE
    )
    :vars
    (
      ?auto_859315 - HOIST
      ?auto_859318 - PLACE
      ?auto_859319 - PLACE
      ?auto_859314 - HOIST
      ?auto_859316 - SURFACE
      ?auto_859317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859315 ?auto_859318 ) ( IS-CRATE ?auto_859313 ) ( not ( = ?auto_859312 ?auto_859313 ) ) ( not ( = ?auto_859311 ?auto_859312 ) ) ( not ( = ?auto_859311 ?auto_859313 ) ) ( not ( = ?auto_859319 ?auto_859318 ) ) ( HOIST-AT ?auto_859314 ?auto_859319 ) ( not ( = ?auto_859315 ?auto_859314 ) ) ( SURFACE-AT ?auto_859313 ?auto_859319 ) ( ON ?auto_859313 ?auto_859316 ) ( CLEAR ?auto_859313 ) ( not ( = ?auto_859312 ?auto_859316 ) ) ( not ( = ?auto_859313 ?auto_859316 ) ) ( not ( = ?auto_859311 ?auto_859316 ) ) ( SURFACE-AT ?auto_859311 ?auto_859318 ) ( CLEAR ?auto_859311 ) ( IS-CRATE ?auto_859312 ) ( AVAILABLE ?auto_859315 ) ( TRUCK-AT ?auto_859317 ?auto_859319 ) ( LIFTING ?auto_859314 ?auto_859312 ) ( ON ?auto_859306 ?auto_859305 ) ( ON ?auto_859307 ?auto_859306 ) ( ON ?auto_859309 ?auto_859307 ) ( ON ?auto_859308 ?auto_859309 ) ( ON ?auto_859310 ?auto_859308 ) ( ON ?auto_859311 ?auto_859310 ) ( not ( = ?auto_859305 ?auto_859306 ) ) ( not ( = ?auto_859305 ?auto_859307 ) ) ( not ( = ?auto_859305 ?auto_859309 ) ) ( not ( = ?auto_859305 ?auto_859308 ) ) ( not ( = ?auto_859305 ?auto_859310 ) ) ( not ( = ?auto_859305 ?auto_859311 ) ) ( not ( = ?auto_859305 ?auto_859312 ) ) ( not ( = ?auto_859305 ?auto_859313 ) ) ( not ( = ?auto_859305 ?auto_859316 ) ) ( not ( = ?auto_859306 ?auto_859307 ) ) ( not ( = ?auto_859306 ?auto_859309 ) ) ( not ( = ?auto_859306 ?auto_859308 ) ) ( not ( = ?auto_859306 ?auto_859310 ) ) ( not ( = ?auto_859306 ?auto_859311 ) ) ( not ( = ?auto_859306 ?auto_859312 ) ) ( not ( = ?auto_859306 ?auto_859313 ) ) ( not ( = ?auto_859306 ?auto_859316 ) ) ( not ( = ?auto_859307 ?auto_859309 ) ) ( not ( = ?auto_859307 ?auto_859308 ) ) ( not ( = ?auto_859307 ?auto_859310 ) ) ( not ( = ?auto_859307 ?auto_859311 ) ) ( not ( = ?auto_859307 ?auto_859312 ) ) ( not ( = ?auto_859307 ?auto_859313 ) ) ( not ( = ?auto_859307 ?auto_859316 ) ) ( not ( = ?auto_859309 ?auto_859308 ) ) ( not ( = ?auto_859309 ?auto_859310 ) ) ( not ( = ?auto_859309 ?auto_859311 ) ) ( not ( = ?auto_859309 ?auto_859312 ) ) ( not ( = ?auto_859309 ?auto_859313 ) ) ( not ( = ?auto_859309 ?auto_859316 ) ) ( not ( = ?auto_859308 ?auto_859310 ) ) ( not ( = ?auto_859308 ?auto_859311 ) ) ( not ( = ?auto_859308 ?auto_859312 ) ) ( not ( = ?auto_859308 ?auto_859313 ) ) ( not ( = ?auto_859308 ?auto_859316 ) ) ( not ( = ?auto_859310 ?auto_859311 ) ) ( not ( = ?auto_859310 ?auto_859312 ) ) ( not ( = ?auto_859310 ?auto_859313 ) ) ( not ( = ?auto_859310 ?auto_859316 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859311 ?auto_859312 ?auto_859313 )
      ( MAKE-8CRATE-VERIFY ?auto_859305 ?auto_859306 ?auto_859307 ?auto_859309 ?auto_859308 ?auto_859310 ?auto_859311 ?auto_859312 ?auto_859313 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_859320 - SURFACE
      ?auto_859321 - SURFACE
      ?auto_859322 - SURFACE
      ?auto_859324 - SURFACE
      ?auto_859323 - SURFACE
      ?auto_859325 - SURFACE
      ?auto_859326 - SURFACE
      ?auto_859327 - SURFACE
      ?auto_859328 - SURFACE
      ?auto_859329 - SURFACE
    )
    :vars
    (
      ?auto_859331 - HOIST
      ?auto_859334 - PLACE
      ?auto_859335 - PLACE
      ?auto_859330 - HOIST
      ?auto_859332 - SURFACE
      ?auto_859333 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859331 ?auto_859334 ) ( IS-CRATE ?auto_859329 ) ( not ( = ?auto_859328 ?auto_859329 ) ) ( not ( = ?auto_859327 ?auto_859328 ) ) ( not ( = ?auto_859327 ?auto_859329 ) ) ( not ( = ?auto_859335 ?auto_859334 ) ) ( HOIST-AT ?auto_859330 ?auto_859335 ) ( not ( = ?auto_859331 ?auto_859330 ) ) ( SURFACE-AT ?auto_859329 ?auto_859335 ) ( ON ?auto_859329 ?auto_859332 ) ( CLEAR ?auto_859329 ) ( not ( = ?auto_859328 ?auto_859332 ) ) ( not ( = ?auto_859329 ?auto_859332 ) ) ( not ( = ?auto_859327 ?auto_859332 ) ) ( SURFACE-AT ?auto_859327 ?auto_859334 ) ( CLEAR ?auto_859327 ) ( IS-CRATE ?auto_859328 ) ( AVAILABLE ?auto_859331 ) ( TRUCK-AT ?auto_859333 ?auto_859335 ) ( LIFTING ?auto_859330 ?auto_859328 ) ( ON ?auto_859321 ?auto_859320 ) ( ON ?auto_859322 ?auto_859321 ) ( ON ?auto_859324 ?auto_859322 ) ( ON ?auto_859323 ?auto_859324 ) ( ON ?auto_859325 ?auto_859323 ) ( ON ?auto_859326 ?auto_859325 ) ( ON ?auto_859327 ?auto_859326 ) ( not ( = ?auto_859320 ?auto_859321 ) ) ( not ( = ?auto_859320 ?auto_859322 ) ) ( not ( = ?auto_859320 ?auto_859324 ) ) ( not ( = ?auto_859320 ?auto_859323 ) ) ( not ( = ?auto_859320 ?auto_859325 ) ) ( not ( = ?auto_859320 ?auto_859326 ) ) ( not ( = ?auto_859320 ?auto_859327 ) ) ( not ( = ?auto_859320 ?auto_859328 ) ) ( not ( = ?auto_859320 ?auto_859329 ) ) ( not ( = ?auto_859320 ?auto_859332 ) ) ( not ( = ?auto_859321 ?auto_859322 ) ) ( not ( = ?auto_859321 ?auto_859324 ) ) ( not ( = ?auto_859321 ?auto_859323 ) ) ( not ( = ?auto_859321 ?auto_859325 ) ) ( not ( = ?auto_859321 ?auto_859326 ) ) ( not ( = ?auto_859321 ?auto_859327 ) ) ( not ( = ?auto_859321 ?auto_859328 ) ) ( not ( = ?auto_859321 ?auto_859329 ) ) ( not ( = ?auto_859321 ?auto_859332 ) ) ( not ( = ?auto_859322 ?auto_859324 ) ) ( not ( = ?auto_859322 ?auto_859323 ) ) ( not ( = ?auto_859322 ?auto_859325 ) ) ( not ( = ?auto_859322 ?auto_859326 ) ) ( not ( = ?auto_859322 ?auto_859327 ) ) ( not ( = ?auto_859322 ?auto_859328 ) ) ( not ( = ?auto_859322 ?auto_859329 ) ) ( not ( = ?auto_859322 ?auto_859332 ) ) ( not ( = ?auto_859324 ?auto_859323 ) ) ( not ( = ?auto_859324 ?auto_859325 ) ) ( not ( = ?auto_859324 ?auto_859326 ) ) ( not ( = ?auto_859324 ?auto_859327 ) ) ( not ( = ?auto_859324 ?auto_859328 ) ) ( not ( = ?auto_859324 ?auto_859329 ) ) ( not ( = ?auto_859324 ?auto_859332 ) ) ( not ( = ?auto_859323 ?auto_859325 ) ) ( not ( = ?auto_859323 ?auto_859326 ) ) ( not ( = ?auto_859323 ?auto_859327 ) ) ( not ( = ?auto_859323 ?auto_859328 ) ) ( not ( = ?auto_859323 ?auto_859329 ) ) ( not ( = ?auto_859323 ?auto_859332 ) ) ( not ( = ?auto_859325 ?auto_859326 ) ) ( not ( = ?auto_859325 ?auto_859327 ) ) ( not ( = ?auto_859325 ?auto_859328 ) ) ( not ( = ?auto_859325 ?auto_859329 ) ) ( not ( = ?auto_859325 ?auto_859332 ) ) ( not ( = ?auto_859326 ?auto_859327 ) ) ( not ( = ?auto_859326 ?auto_859328 ) ) ( not ( = ?auto_859326 ?auto_859329 ) ) ( not ( = ?auto_859326 ?auto_859332 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859327 ?auto_859328 ?auto_859329 )
      ( MAKE-9CRATE-VERIFY ?auto_859320 ?auto_859321 ?auto_859322 ?auto_859324 ?auto_859323 ?auto_859325 ?auto_859326 ?auto_859327 ?auto_859328 ?auto_859329 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_859336 - SURFACE
      ?auto_859337 - SURFACE
    )
    :vars
    (
      ?auto_859339 - HOIST
      ?auto_859343 - PLACE
      ?auto_859342 - SURFACE
      ?auto_859344 - PLACE
      ?auto_859338 - HOIST
      ?auto_859340 - SURFACE
      ?auto_859341 - TRUCK
      ?auto_859345 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_859339 ?auto_859343 ) ( IS-CRATE ?auto_859337 ) ( not ( = ?auto_859336 ?auto_859337 ) ) ( not ( = ?auto_859342 ?auto_859336 ) ) ( not ( = ?auto_859342 ?auto_859337 ) ) ( not ( = ?auto_859344 ?auto_859343 ) ) ( HOIST-AT ?auto_859338 ?auto_859344 ) ( not ( = ?auto_859339 ?auto_859338 ) ) ( SURFACE-AT ?auto_859337 ?auto_859344 ) ( ON ?auto_859337 ?auto_859340 ) ( CLEAR ?auto_859337 ) ( not ( = ?auto_859336 ?auto_859340 ) ) ( not ( = ?auto_859337 ?auto_859340 ) ) ( not ( = ?auto_859342 ?auto_859340 ) ) ( SURFACE-AT ?auto_859342 ?auto_859343 ) ( CLEAR ?auto_859342 ) ( IS-CRATE ?auto_859336 ) ( AVAILABLE ?auto_859339 ) ( TRUCK-AT ?auto_859341 ?auto_859344 ) ( AVAILABLE ?auto_859338 ) ( SURFACE-AT ?auto_859336 ?auto_859344 ) ( ON ?auto_859336 ?auto_859345 ) ( CLEAR ?auto_859336 ) ( not ( = ?auto_859336 ?auto_859345 ) ) ( not ( = ?auto_859337 ?auto_859345 ) ) ( not ( = ?auto_859342 ?auto_859345 ) ) ( not ( = ?auto_859340 ?auto_859345 ) ) )
    :subtasks
    ( ( !LIFT ?auto_859338 ?auto_859336 ?auto_859345 ?auto_859344 )
      ( MAKE-2CRATE ?auto_859342 ?auto_859336 ?auto_859337 )
      ( MAKE-1CRATE-VERIFY ?auto_859336 ?auto_859337 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_859346 - SURFACE
      ?auto_859347 - SURFACE
      ?auto_859348 - SURFACE
    )
    :vars
    (
      ?auto_859353 - HOIST
      ?auto_859354 - PLACE
      ?auto_859351 - PLACE
      ?auto_859349 - HOIST
      ?auto_859352 - SURFACE
      ?auto_859350 - TRUCK
      ?auto_859355 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_859353 ?auto_859354 ) ( IS-CRATE ?auto_859348 ) ( not ( = ?auto_859347 ?auto_859348 ) ) ( not ( = ?auto_859346 ?auto_859347 ) ) ( not ( = ?auto_859346 ?auto_859348 ) ) ( not ( = ?auto_859351 ?auto_859354 ) ) ( HOIST-AT ?auto_859349 ?auto_859351 ) ( not ( = ?auto_859353 ?auto_859349 ) ) ( SURFACE-AT ?auto_859348 ?auto_859351 ) ( ON ?auto_859348 ?auto_859352 ) ( CLEAR ?auto_859348 ) ( not ( = ?auto_859347 ?auto_859352 ) ) ( not ( = ?auto_859348 ?auto_859352 ) ) ( not ( = ?auto_859346 ?auto_859352 ) ) ( SURFACE-AT ?auto_859346 ?auto_859354 ) ( CLEAR ?auto_859346 ) ( IS-CRATE ?auto_859347 ) ( AVAILABLE ?auto_859353 ) ( TRUCK-AT ?auto_859350 ?auto_859351 ) ( AVAILABLE ?auto_859349 ) ( SURFACE-AT ?auto_859347 ?auto_859351 ) ( ON ?auto_859347 ?auto_859355 ) ( CLEAR ?auto_859347 ) ( not ( = ?auto_859347 ?auto_859355 ) ) ( not ( = ?auto_859348 ?auto_859355 ) ) ( not ( = ?auto_859346 ?auto_859355 ) ) ( not ( = ?auto_859352 ?auto_859355 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_859347 ?auto_859348 )
      ( MAKE-2CRATE-VERIFY ?auto_859346 ?auto_859347 ?auto_859348 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_859356 - SURFACE
      ?auto_859357 - SURFACE
      ?auto_859358 - SURFACE
      ?auto_859359 - SURFACE
    )
    :vars
    (
      ?auto_859364 - HOIST
      ?auto_859360 - PLACE
      ?auto_859362 - PLACE
      ?auto_859365 - HOIST
      ?auto_859366 - SURFACE
      ?auto_859361 - TRUCK
      ?auto_859363 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_859364 ?auto_859360 ) ( IS-CRATE ?auto_859359 ) ( not ( = ?auto_859358 ?auto_859359 ) ) ( not ( = ?auto_859357 ?auto_859358 ) ) ( not ( = ?auto_859357 ?auto_859359 ) ) ( not ( = ?auto_859362 ?auto_859360 ) ) ( HOIST-AT ?auto_859365 ?auto_859362 ) ( not ( = ?auto_859364 ?auto_859365 ) ) ( SURFACE-AT ?auto_859359 ?auto_859362 ) ( ON ?auto_859359 ?auto_859366 ) ( CLEAR ?auto_859359 ) ( not ( = ?auto_859358 ?auto_859366 ) ) ( not ( = ?auto_859359 ?auto_859366 ) ) ( not ( = ?auto_859357 ?auto_859366 ) ) ( SURFACE-AT ?auto_859357 ?auto_859360 ) ( CLEAR ?auto_859357 ) ( IS-CRATE ?auto_859358 ) ( AVAILABLE ?auto_859364 ) ( TRUCK-AT ?auto_859361 ?auto_859362 ) ( AVAILABLE ?auto_859365 ) ( SURFACE-AT ?auto_859358 ?auto_859362 ) ( ON ?auto_859358 ?auto_859363 ) ( CLEAR ?auto_859358 ) ( not ( = ?auto_859358 ?auto_859363 ) ) ( not ( = ?auto_859359 ?auto_859363 ) ) ( not ( = ?auto_859357 ?auto_859363 ) ) ( not ( = ?auto_859366 ?auto_859363 ) ) ( ON ?auto_859357 ?auto_859356 ) ( not ( = ?auto_859356 ?auto_859357 ) ) ( not ( = ?auto_859356 ?auto_859358 ) ) ( not ( = ?auto_859356 ?auto_859359 ) ) ( not ( = ?auto_859356 ?auto_859366 ) ) ( not ( = ?auto_859356 ?auto_859363 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859357 ?auto_859358 ?auto_859359 )
      ( MAKE-3CRATE-VERIFY ?auto_859356 ?auto_859357 ?auto_859358 ?auto_859359 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_859367 - SURFACE
      ?auto_859368 - SURFACE
      ?auto_859369 - SURFACE
      ?auto_859371 - SURFACE
      ?auto_859370 - SURFACE
    )
    :vars
    (
      ?auto_859376 - HOIST
      ?auto_859372 - PLACE
      ?auto_859374 - PLACE
      ?auto_859377 - HOIST
      ?auto_859378 - SURFACE
      ?auto_859373 - TRUCK
      ?auto_859375 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_859376 ?auto_859372 ) ( IS-CRATE ?auto_859370 ) ( not ( = ?auto_859371 ?auto_859370 ) ) ( not ( = ?auto_859369 ?auto_859371 ) ) ( not ( = ?auto_859369 ?auto_859370 ) ) ( not ( = ?auto_859374 ?auto_859372 ) ) ( HOIST-AT ?auto_859377 ?auto_859374 ) ( not ( = ?auto_859376 ?auto_859377 ) ) ( SURFACE-AT ?auto_859370 ?auto_859374 ) ( ON ?auto_859370 ?auto_859378 ) ( CLEAR ?auto_859370 ) ( not ( = ?auto_859371 ?auto_859378 ) ) ( not ( = ?auto_859370 ?auto_859378 ) ) ( not ( = ?auto_859369 ?auto_859378 ) ) ( SURFACE-AT ?auto_859369 ?auto_859372 ) ( CLEAR ?auto_859369 ) ( IS-CRATE ?auto_859371 ) ( AVAILABLE ?auto_859376 ) ( TRUCK-AT ?auto_859373 ?auto_859374 ) ( AVAILABLE ?auto_859377 ) ( SURFACE-AT ?auto_859371 ?auto_859374 ) ( ON ?auto_859371 ?auto_859375 ) ( CLEAR ?auto_859371 ) ( not ( = ?auto_859371 ?auto_859375 ) ) ( not ( = ?auto_859370 ?auto_859375 ) ) ( not ( = ?auto_859369 ?auto_859375 ) ) ( not ( = ?auto_859378 ?auto_859375 ) ) ( ON ?auto_859368 ?auto_859367 ) ( ON ?auto_859369 ?auto_859368 ) ( not ( = ?auto_859367 ?auto_859368 ) ) ( not ( = ?auto_859367 ?auto_859369 ) ) ( not ( = ?auto_859367 ?auto_859371 ) ) ( not ( = ?auto_859367 ?auto_859370 ) ) ( not ( = ?auto_859367 ?auto_859378 ) ) ( not ( = ?auto_859367 ?auto_859375 ) ) ( not ( = ?auto_859368 ?auto_859369 ) ) ( not ( = ?auto_859368 ?auto_859371 ) ) ( not ( = ?auto_859368 ?auto_859370 ) ) ( not ( = ?auto_859368 ?auto_859378 ) ) ( not ( = ?auto_859368 ?auto_859375 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859369 ?auto_859371 ?auto_859370 )
      ( MAKE-4CRATE-VERIFY ?auto_859367 ?auto_859368 ?auto_859369 ?auto_859371 ?auto_859370 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_859379 - SURFACE
      ?auto_859380 - SURFACE
      ?auto_859381 - SURFACE
      ?auto_859383 - SURFACE
      ?auto_859382 - SURFACE
      ?auto_859384 - SURFACE
    )
    :vars
    (
      ?auto_859389 - HOIST
      ?auto_859385 - PLACE
      ?auto_859387 - PLACE
      ?auto_859390 - HOIST
      ?auto_859391 - SURFACE
      ?auto_859386 - TRUCK
      ?auto_859388 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_859389 ?auto_859385 ) ( IS-CRATE ?auto_859384 ) ( not ( = ?auto_859382 ?auto_859384 ) ) ( not ( = ?auto_859383 ?auto_859382 ) ) ( not ( = ?auto_859383 ?auto_859384 ) ) ( not ( = ?auto_859387 ?auto_859385 ) ) ( HOIST-AT ?auto_859390 ?auto_859387 ) ( not ( = ?auto_859389 ?auto_859390 ) ) ( SURFACE-AT ?auto_859384 ?auto_859387 ) ( ON ?auto_859384 ?auto_859391 ) ( CLEAR ?auto_859384 ) ( not ( = ?auto_859382 ?auto_859391 ) ) ( not ( = ?auto_859384 ?auto_859391 ) ) ( not ( = ?auto_859383 ?auto_859391 ) ) ( SURFACE-AT ?auto_859383 ?auto_859385 ) ( CLEAR ?auto_859383 ) ( IS-CRATE ?auto_859382 ) ( AVAILABLE ?auto_859389 ) ( TRUCK-AT ?auto_859386 ?auto_859387 ) ( AVAILABLE ?auto_859390 ) ( SURFACE-AT ?auto_859382 ?auto_859387 ) ( ON ?auto_859382 ?auto_859388 ) ( CLEAR ?auto_859382 ) ( not ( = ?auto_859382 ?auto_859388 ) ) ( not ( = ?auto_859384 ?auto_859388 ) ) ( not ( = ?auto_859383 ?auto_859388 ) ) ( not ( = ?auto_859391 ?auto_859388 ) ) ( ON ?auto_859380 ?auto_859379 ) ( ON ?auto_859381 ?auto_859380 ) ( ON ?auto_859383 ?auto_859381 ) ( not ( = ?auto_859379 ?auto_859380 ) ) ( not ( = ?auto_859379 ?auto_859381 ) ) ( not ( = ?auto_859379 ?auto_859383 ) ) ( not ( = ?auto_859379 ?auto_859382 ) ) ( not ( = ?auto_859379 ?auto_859384 ) ) ( not ( = ?auto_859379 ?auto_859391 ) ) ( not ( = ?auto_859379 ?auto_859388 ) ) ( not ( = ?auto_859380 ?auto_859381 ) ) ( not ( = ?auto_859380 ?auto_859383 ) ) ( not ( = ?auto_859380 ?auto_859382 ) ) ( not ( = ?auto_859380 ?auto_859384 ) ) ( not ( = ?auto_859380 ?auto_859391 ) ) ( not ( = ?auto_859380 ?auto_859388 ) ) ( not ( = ?auto_859381 ?auto_859383 ) ) ( not ( = ?auto_859381 ?auto_859382 ) ) ( not ( = ?auto_859381 ?auto_859384 ) ) ( not ( = ?auto_859381 ?auto_859391 ) ) ( not ( = ?auto_859381 ?auto_859388 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859383 ?auto_859382 ?auto_859384 )
      ( MAKE-5CRATE-VERIFY ?auto_859379 ?auto_859380 ?auto_859381 ?auto_859383 ?auto_859382 ?auto_859384 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_859392 - SURFACE
      ?auto_859393 - SURFACE
      ?auto_859394 - SURFACE
      ?auto_859396 - SURFACE
      ?auto_859395 - SURFACE
      ?auto_859397 - SURFACE
      ?auto_859398 - SURFACE
    )
    :vars
    (
      ?auto_859403 - HOIST
      ?auto_859399 - PLACE
      ?auto_859401 - PLACE
      ?auto_859404 - HOIST
      ?auto_859405 - SURFACE
      ?auto_859400 - TRUCK
      ?auto_859402 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_859403 ?auto_859399 ) ( IS-CRATE ?auto_859398 ) ( not ( = ?auto_859397 ?auto_859398 ) ) ( not ( = ?auto_859395 ?auto_859397 ) ) ( not ( = ?auto_859395 ?auto_859398 ) ) ( not ( = ?auto_859401 ?auto_859399 ) ) ( HOIST-AT ?auto_859404 ?auto_859401 ) ( not ( = ?auto_859403 ?auto_859404 ) ) ( SURFACE-AT ?auto_859398 ?auto_859401 ) ( ON ?auto_859398 ?auto_859405 ) ( CLEAR ?auto_859398 ) ( not ( = ?auto_859397 ?auto_859405 ) ) ( not ( = ?auto_859398 ?auto_859405 ) ) ( not ( = ?auto_859395 ?auto_859405 ) ) ( SURFACE-AT ?auto_859395 ?auto_859399 ) ( CLEAR ?auto_859395 ) ( IS-CRATE ?auto_859397 ) ( AVAILABLE ?auto_859403 ) ( TRUCK-AT ?auto_859400 ?auto_859401 ) ( AVAILABLE ?auto_859404 ) ( SURFACE-AT ?auto_859397 ?auto_859401 ) ( ON ?auto_859397 ?auto_859402 ) ( CLEAR ?auto_859397 ) ( not ( = ?auto_859397 ?auto_859402 ) ) ( not ( = ?auto_859398 ?auto_859402 ) ) ( not ( = ?auto_859395 ?auto_859402 ) ) ( not ( = ?auto_859405 ?auto_859402 ) ) ( ON ?auto_859393 ?auto_859392 ) ( ON ?auto_859394 ?auto_859393 ) ( ON ?auto_859396 ?auto_859394 ) ( ON ?auto_859395 ?auto_859396 ) ( not ( = ?auto_859392 ?auto_859393 ) ) ( not ( = ?auto_859392 ?auto_859394 ) ) ( not ( = ?auto_859392 ?auto_859396 ) ) ( not ( = ?auto_859392 ?auto_859395 ) ) ( not ( = ?auto_859392 ?auto_859397 ) ) ( not ( = ?auto_859392 ?auto_859398 ) ) ( not ( = ?auto_859392 ?auto_859405 ) ) ( not ( = ?auto_859392 ?auto_859402 ) ) ( not ( = ?auto_859393 ?auto_859394 ) ) ( not ( = ?auto_859393 ?auto_859396 ) ) ( not ( = ?auto_859393 ?auto_859395 ) ) ( not ( = ?auto_859393 ?auto_859397 ) ) ( not ( = ?auto_859393 ?auto_859398 ) ) ( not ( = ?auto_859393 ?auto_859405 ) ) ( not ( = ?auto_859393 ?auto_859402 ) ) ( not ( = ?auto_859394 ?auto_859396 ) ) ( not ( = ?auto_859394 ?auto_859395 ) ) ( not ( = ?auto_859394 ?auto_859397 ) ) ( not ( = ?auto_859394 ?auto_859398 ) ) ( not ( = ?auto_859394 ?auto_859405 ) ) ( not ( = ?auto_859394 ?auto_859402 ) ) ( not ( = ?auto_859396 ?auto_859395 ) ) ( not ( = ?auto_859396 ?auto_859397 ) ) ( not ( = ?auto_859396 ?auto_859398 ) ) ( not ( = ?auto_859396 ?auto_859405 ) ) ( not ( = ?auto_859396 ?auto_859402 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859395 ?auto_859397 ?auto_859398 )
      ( MAKE-6CRATE-VERIFY ?auto_859392 ?auto_859393 ?auto_859394 ?auto_859396 ?auto_859395 ?auto_859397 ?auto_859398 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_859406 - SURFACE
      ?auto_859407 - SURFACE
      ?auto_859408 - SURFACE
      ?auto_859410 - SURFACE
      ?auto_859409 - SURFACE
      ?auto_859411 - SURFACE
      ?auto_859412 - SURFACE
      ?auto_859413 - SURFACE
    )
    :vars
    (
      ?auto_859418 - HOIST
      ?auto_859414 - PLACE
      ?auto_859416 - PLACE
      ?auto_859419 - HOIST
      ?auto_859420 - SURFACE
      ?auto_859415 - TRUCK
      ?auto_859417 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_859418 ?auto_859414 ) ( IS-CRATE ?auto_859413 ) ( not ( = ?auto_859412 ?auto_859413 ) ) ( not ( = ?auto_859411 ?auto_859412 ) ) ( not ( = ?auto_859411 ?auto_859413 ) ) ( not ( = ?auto_859416 ?auto_859414 ) ) ( HOIST-AT ?auto_859419 ?auto_859416 ) ( not ( = ?auto_859418 ?auto_859419 ) ) ( SURFACE-AT ?auto_859413 ?auto_859416 ) ( ON ?auto_859413 ?auto_859420 ) ( CLEAR ?auto_859413 ) ( not ( = ?auto_859412 ?auto_859420 ) ) ( not ( = ?auto_859413 ?auto_859420 ) ) ( not ( = ?auto_859411 ?auto_859420 ) ) ( SURFACE-AT ?auto_859411 ?auto_859414 ) ( CLEAR ?auto_859411 ) ( IS-CRATE ?auto_859412 ) ( AVAILABLE ?auto_859418 ) ( TRUCK-AT ?auto_859415 ?auto_859416 ) ( AVAILABLE ?auto_859419 ) ( SURFACE-AT ?auto_859412 ?auto_859416 ) ( ON ?auto_859412 ?auto_859417 ) ( CLEAR ?auto_859412 ) ( not ( = ?auto_859412 ?auto_859417 ) ) ( not ( = ?auto_859413 ?auto_859417 ) ) ( not ( = ?auto_859411 ?auto_859417 ) ) ( not ( = ?auto_859420 ?auto_859417 ) ) ( ON ?auto_859407 ?auto_859406 ) ( ON ?auto_859408 ?auto_859407 ) ( ON ?auto_859410 ?auto_859408 ) ( ON ?auto_859409 ?auto_859410 ) ( ON ?auto_859411 ?auto_859409 ) ( not ( = ?auto_859406 ?auto_859407 ) ) ( not ( = ?auto_859406 ?auto_859408 ) ) ( not ( = ?auto_859406 ?auto_859410 ) ) ( not ( = ?auto_859406 ?auto_859409 ) ) ( not ( = ?auto_859406 ?auto_859411 ) ) ( not ( = ?auto_859406 ?auto_859412 ) ) ( not ( = ?auto_859406 ?auto_859413 ) ) ( not ( = ?auto_859406 ?auto_859420 ) ) ( not ( = ?auto_859406 ?auto_859417 ) ) ( not ( = ?auto_859407 ?auto_859408 ) ) ( not ( = ?auto_859407 ?auto_859410 ) ) ( not ( = ?auto_859407 ?auto_859409 ) ) ( not ( = ?auto_859407 ?auto_859411 ) ) ( not ( = ?auto_859407 ?auto_859412 ) ) ( not ( = ?auto_859407 ?auto_859413 ) ) ( not ( = ?auto_859407 ?auto_859420 ) ) ( not ( = ?auto_859407 ?auto_859417 ) ) ( not ( = ?auto_859408 ?auto_859410 ) ) ( not ( = ?auto_859408 ?auto_859409 ) ) ( not ( = ?auto_859408 ?auto_859411 ) ) ( not ( = ?auto_859408 ?auto_859412 ) ) ( not ( = ?auto_859408 ?auto_859413 ) ) ( not ( = ?auto_859408 ?auto_859420 ) ) ( not ( = ?auto_859408 ?auto_859417 ) ) ( not ( = ?auto_859410 ?auto_859409 ) ) ( not ( = ?auto_859410 ?auto_859411 ) ) ( not ( = ?auto_859410 ?auto_859412 ) ) ( not ( = ?auto_859410 ?auto_859413 ) ) ( not ( = ?auto_859410 ?auto_859420 ) ) ( not ( = ?auto_859410 ?auto_859417 ) ) ( not ( = ?auto_859409 ?auto_859411 ) ) ( not ( = ?auto_859409 ?auto_859412 ) ) ( not ( = ?auto_859409 ?auto_859413 ) ) ( not ( = ?auto_859409 ?auto_859420 ) ) ( not ( = ?auto_859409 ?auto_859417 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859411 ?auto_859412 ?auto_859413 )
      ( MAKE-7CRATE-VERIFY ?auto_859406 ?auto_859407 ?auto_859408 ?auto_859410 ?auto_859409 ?auto_859411 ?auto_859412 ?auto_859413 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_859421 - SURFACE
      ?auto_859422 - SURFACE
      ?auto_859423 - SURFACE
      ?auto_859425 - SURFACE
      ?auto_859424 - SURFACE
      ?auto_859426 - SURFACE
      ?auto_859427 - SURFACE
      ?auto_859428 - SURFACE
      ?auto_859429 - SURFACE
    )
    :vars
    (
      ?auto_859434 - HOIST
      ?auto_859430 - PLACE
      ?auto_859432 - PLACE
      ?auto_859435 - HOIST
      ?auto_859436 - SURFACE
      ?auto_859431 - TRUCK
      ?auto_859433 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_859434 ?auto_859430 ) ( IS-CRATE ?auto_859429 ) ( not ( = ?auto_859428 ?auto_859429 ) ) ( not ( = ?auto_859427 ?auto_859428 ) ) ( not ( = ?auto_859427 ?auto_859429 ) ) ( not ( = ?auto_859432 ?auto_859430 ) ) ( HOIST-AT ?auto_859435 ?auto_859432 ) ( not ( = ?auto_859434 ?auto_859435 ) ) ( SURFACE-AT ?auto_859429 ?auto_859432 ) ( ON ?auto_859429 ?auto_859436 ) ( CLEAR ?auto_859429 ) ( not ( = ?auto_859428 ?auto_859436 ) ) ( not ( = ?auto_859429 ?auto_859436 ) ) ( not ( = ?auto_859427 ?auto_859436 ) ) ( SURFACE-AT ?auto_859427 ?auto_859430 ) ( CLEAR ?auto_859427 ) ( IS-CRATE ?auto_859428 ) ( AVAILABLE ?auto_859434 ) ( TRUCK-AT ?auto_859431 ?auto_859432 ) ( AVAILABLE ?auto_859435 ) ( SURFACE-AT ?auto_859428 ?auto_859432 ) ( ON ?auto_859428 ?auto_859433 ) ( CLEAR ?auto_859428 ) ( not ( = ?auto_859428 ?auto_859433 ) ) ( not ( = ?auto_859429 ?auto_859433 ) ) ( not ( = ?auto_859427 ?auto_859433 ) ) ( not ( = ?auto_859436 ?auto_859433 ) ) ( ON ?auto_859422 ?auto_859421 ) ( ON ?auto_859423 ?auto_859422 ) ( ON ?auto_859425 ?auto_859423 ) ( ON ?auto_859424 ?auto_859425 ) ( ON ?auto_859426 ?auto_859424 ) ( ON ?auto_859427 ?auto_859426 ) ( not ( = ?auto_859421 ?auto_859422 ) ) ( not ( = ?auto_859421 ?auto_859423 ) ) ( not ( = ?auto_859421 ?auto_859425 ) ) ( not ( = ?auto_859421 ?auto_859424 ) ) ( not ( = ?auto_859421 ?auto_859426 ) ) ( not ( = ?auto_859421 ?auto_859427 ) ) ( not ( = ?auto_859421 ?auto_859428 ) ) ( not ( = ?auto_859421 ?auto_859429 ) ) ( not ( = ?auto_859421 ?auto_859436 ) ) ( not ( = ?auto_859421 ?auto_859433 ) ) ( not ( = ?auto_859422 ?auto_859423 ) ) ( not ( = ?auto_859422 ?auto_859425 ) ) ( not ( = ?auto_859422 ?auto_859424 ) ) ( not ( = ?auto_859422 ?auto_859426 ) ) ( not ( = ?auto_859422 ?auto_859427 ) ) ( not ( = ?auto_859422 ?auto_859428 ) ) ( not ( = ?auto_859422 ?auto_859429 ) ) ( not ( = ?auto_859422 ?auto_859436 ) ) ( not ( = ?auto_859422 ?auto_859433 ) ) ( not ( = ?auto_859423 ?auto_859425 ) ) ( not ( = ?auto_859423 ?auto_859424 ) ) ( not ( = ?auto_859423 ?auto_859426 ) ) ( not ( = ?auto_859423 ?auto_859427 ) ) ( not ( = ?auto_859423 ?auto_859428 ) ) ( not ( = ?auto_859423 ?auto_859429 ) ) ( not ( = ?auto_859423 ?auto_859436 ) ) ( not ( = ?auto_859423 ?auto_859433 ) ) ( not ( = ?auto_859425 ?auto_859424 ) ) ( not ( = ?auto_859425 ?auto_859426 ) ) ( not ( = ?auto_859425 ?auto_859427 ) ) ( not ( = ?auto_859425 ?auto_859428 ) ) ( not ( = ?auto_859425 ?auto_859429 ) ) ( not ( = ?auto_859425 ?auto_859436 ) ) ( not ( = ?auto_859425 ?auto_859433 ) ) ( not ( = ?auto_859424 ?auto_859426 ) ) ( not ( = ?auto_859424 ?auto_859427 ) ) ( not ( = ?auto_859424 ?auto_859428 ) ) ( not ( = ?auto_859424 ?auto_859429 ) ) ( not ( = ?auto_859424 ?auto_859436 ) ) ( not ( = ?auto_859424 ?auto_859433 ) ) ( not ( = ?auto_859426 ?auto_859427 ) ) ( not ( = ?auto_859426 ?auto_859428 ) ) ( not ( = ?auto_859426 ?auto_859429 ) ) ( not ( = ?auto_859426 ?auto_859436 ) ) ( not ( = ?auto_859426 ?auto_859433 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859427 ?auto_859428 ?auto_859429 )
      ( MAKE-8CRATE-VERIFY ?auto_859421 ?auto_859422 ?auto_859423 ?auto_859425 ?auto_859424 ?auto_859426 ?auto_859427 ?auto_859428 ?auto_859429 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_859437 - SURFACE
      ?auto_859438 - SURFACE
      ?auto_859439 - SURFACE
      ?auto_859441 - SURFACE
      ?auto_859440 - SURFACE
      ?auto_859442 - SURFACE
      ?auto_859443 - SURFACE
      ?auto_859444 - SURFACE
      ?auto_859445 - SURFACE
      ?auto_859446 - SURFACE
    )
    :vars
    (
      ?auto_859451 - HOIST
      ?auto_859447 - PLACE
      ?auto_859449 - PLACE
      ?auto_859452 - HOIST
      ?auto_859453 - SURFACE
      ?auto_859448 - TRUCK
      ?auto_859450 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_859451 ?auto_859447 ) ( IS-CRATE ?auto_859446 ) ( not ( = ?auto_859445 ?auto_859446 ) ) ( not ( = ?auto_859444 ?auto_859445 ) ) ( not ( = ?auto_859444 ?auto_859446 ) ) ( not ( = ?auto_859449 ?auto_859447 ) ) ( HOIST-AT ?auto_859452 ?auto_859449 ) ( not ( = ?auto_859451 ?auto_859452 ) ) ( SURFACE-AT ?auto_859446 ?auto_859449 ) ( ON ?auto_859446 ?auto_859453 ) ( CLEAR ?auto_859446 ) ( not ( = ?auto_859445 ?auto_859453 ) ) ( not ( = ?auto_859446 ?auto_859453 ) ) ( not ( = ?auto_859444 ?auto_859453 ) ) ( SURFACE-AT ?auto_859444 ?auto_859447 ) ( CLEAR ?auto_859444 ) ( IS-CRATE ?auto_859445 ) ( AVAILABLE ?auto_859451 ) ( TRUCK-AT ?auto_859448 ?auto_859449 ) ( AVAILABLE ?auto_859452 ) ( SURFACE-AT ?auto_859445 ?auto_859449 ) ( ON ?auto_859445 ?auto_859450 ) ( CLEAR ?auto_859445 ) ( not ( = ?auto_859445 ?auto_859450 ) ) ( not ( = ?auto_859446 ?auto_859450 ) ) ( not ( = ?auto_859444 ?auto_859450 ) ) ( not ( = ?auto_859453 ?auto_859450 ) ) ( ON ?auto_859438 ?auto_859437 ) ( ON ?auto_859439 ?auto_859438 ) ( ON ?auto_859441 ?auto_859439 ) ( ON ?auto_859440 ?auto_859441 ) ( ON ?auto_859442 ?auto_859440 ) ( ON ?auto_859443 ?auto_859442 ) ( ON ?auto_859444 ?auto_859443 ) ( not ( = ?auto_859437 ?auto_859438 ) ) ( not ( = ?auto_859437 ?auto_859439 ) ) ( not ( = ?auto_859437 ?auto_859441 ) ) ( not ( = ?auto_859437 ?auto_859440 ) ) ( not ( = ?auto_859437 ?auto_859442 ) ) ( not ( = ?auto_859437 ?auto_859443 ) ) ( not ( = ?auto_859437 ?auto_859444 ) ) ( not ( = ?auto_859437 ?auto_859445 ) ) ( not ( = ?auto_859437 ?auto_859446 ) ) ( not ( = ?auto_859437 ?auto_859453 ) ) ( not ( = ?auto_859437 ?auto_859450 ) ) ( not ( = ?auto_859438 ?auto_859439 ) ) ( not ( = ?auto_859438 ?auto_859441 ) ) ( not ( = ?auto_859438 ?auto_859440 ) ) ( not ( = ?auto_859438 ?auto_859442 ) ) ( not ( = ?auto_859438 ?auto_859443 ) ) ( not ( = ?auto_859438 ?auto_859444 ) ) ( not ( = ?auto_859438 ?auto_859445 ) ) ( not ( = ?auto_859438 ?auto_859446 ) ) ( not ( = ?auto_859438 ?auto_859453 ) ) ( not ( = ?auto_859438 ?auto_859450 ) ) ( not ( = ?auto_859439 ?auto_859441 ) ) ( not ( = ?auto_859439 ?auto_859440 ) ) ( not ( = ?auto_859439 ?auto_859442 ) ) ( not ( = ?auto_859439 ?auto_859443 ) ) ( not ( = ?auto_859439 ?auto_859444 ) ) ( not ( = ?auto_859439 ?auto_859445 ) ) ( not ( = ?auto_859439 ?auto_859446 ) ) ( not ( = ?auto_859439 ?auto_859453 ) ) ( not ( = ?auto_859439 ?auto_859450 ) ) ( not ( = ?auto_859441 ?auto_859440 ) ) ( not ( = ?auto_859441 ?auto_859442 ) ) ( not ( = ?auto_859441 ?auto_859443 ) ) ( not ( = ?auto_859441 ?auto_859444 ) ) ( not ( = ?auto_859441 ?auto_859445 ) ) ( not ( = ?auto_859441 ?auto_859446 ) ) ( not ( = ?auto_859441 ?auto_859453 ) ) ( not ( = ?auto_859441 ?auto_859450 ) ) ( not ( = ?auto_859440 ?auto_859442 ) ) ( not ( = ?auto_859440 ?auto_859443 ) ) ( not ( = ?auto_859440 ?auto_859444 ) ) ( not ( = ?auto_859440 ?auto_859445 ) ) ( not ( = ?auto_859440 ?auto_859446 ) ) ( not ( = ?auto_859440 ?auto_859453 ) ) ( not ( = ?auto_859440 ?auto_859450 ) ) ( not ( = ?auto_859442 ?auto_859443 ) ) ( not ( = ?auto_859442 ?auto_859444 ) ) ( not ( = ?auto_859442 ?auto_859445 ) ) ( not ( = ?auto_859442 ?auto_859446 ) ) ( not ( = ?auto_859442 ?auto_859453 ) ) ( not ( = ?auto_859442 ?auto_859450 ) ) ( not ( = ?auto_859443 ?auto_859444 ) ) ( not ( = ?auto_859443 ?auto_859445 ) ) ( not ( = ?auto_859443 ?auto_859446 ) ) ( not ( = ?auto_859443 ?auto_859453 ) ) ( not ( = ?auto_859443 ?auto_859450 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859444 ?auto_859445 ?auto_859446 )
      ( MAKE-9CRATE-VERIFY ?auto_859437 ?auto_859438 ?auto_859439 ?auto_859441 ?auto_859440 ?auto_859442 ?auto_859443 ?auto_859444 ?auto_859445 ?auto_859446 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_859454 - SURFACE
      ?auto_859455 - SURFACE
    )
    :vars
    (
      ?auto_859461 - HOIST
      ?auto_859456 - PLACE
      ?auto_859457 - SURFACE
      ?auto_859459 - PLACE
      ?auto_859462 - HOIST
      ?auto_859463 - SURFACE
      ?auto_859460 - SURFACE
      ?auto_859458 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859461 ?auto_859456 ) ( IS-CRATE ?auto_859455 ) ( not ( = ?auto_859454 ?auto_859455 ) ) ( not ( = ?auto_859457 ?auto_859454 ) ) ( not ( = ?auto_859457 ?auto_859455 ) ) ( not ( = ?auto_859459 ?auto_859456 ) ) ( HOIST-AT ?auto_859462 ?auto_859459 ) ( not ( = ?auto_859461 ?auto_859462 ) ) ( SURFACE-AT ?auto_859455 ?auto_859459 ) ( ON ?auto_859455 ?auto_859463 ) ( CLEAR ?auto_859455 ) ( not ( = ?auto_859454 ?auto_859463 ) ) ( not ( = ?auto_859455 ?auto_859463 ) ) ( not ( = ?auto_859457 ?auto_859463 ) ) ( SURFACE-AT ?auto_859457 ?auto_859456 ) ( CLEAR ?auto_859457 ) ( IS-CRATE ?auto_859454 ) ( AVAILABLE ?auto_859461 ) ( AVAILABLE ?auto_859462 ) ( SURFACE-AT ?auto_859454 ?auto_859459 ) ( ON ?auto_859454 ?auto_859460 ) ( CLEAR ?auto_859454 ) ( not ( = ?auto_859454 ?auto_859460 ) ) ( not ( = ?auto_859455 ?auto_859460 ) ) ( not ( = ?auto_859457 ?auto_859460 ) ) ( not ( = ?auto_859463 ?auto_859460 ) ) ( TRUCK-AT ?auto_859458 ?auto_859456 ) )
    :subtasks
    ( ( !DRIVE ?auto_859458 ?auto_859456 ?auto_859459 )
      ( MAKE-2CRATE ?auto_859457 ?auto_859454 ?auto_859455 )
      ( MAKE-1CRATE-VERIFY ?auto_859454 ?auto_859455 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_859464 - SURFACE
      ?auto_859465 - SURFACE
      ?auto_859466 - SURFACE
    )
    :vars
    (
      ?auto_859473 - HOIST
      ?auto_859469 - PLACE
      ?auto_859470 - PLACE
      ?auto_859471 - HOIST
      ?auto_859468 - SURFACE
      ?auto_859467 - SURFACE
      ?auto_859472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859473 ?auto_859469 ) ( IS-CRATE ?auto_859466 ) ( not ( = ?auto_859465 ?auto_859466 ) ) ( not ( = ?auto_859464 ?auto_859465 ) ) ( not ( = ?auto_859464 ?auto_859466 ) ) ( not ( = ?auto_859470 ?auto_859469 ) ) ( HOIST-AT ?auto_859471 ?auto_859470 ) ( not ( = ?auto_859473 ?auto_859471 ) ) ( SURFACE-AT ?auto_859466 ?auto_859470 ) ( ON ?auto_859466 ?auto_859468 ) ( CLEAR ?auto_859466 ) ( not ( = ?auto_859465 ?auto_859468 ) ) ( not ( = ?auto_859466 ?auto_859468 ) ) ( not ( = ?auto_859464 ?auto_859468 ) ) ( SURFACE-AT ?auto_859464 ?auto_859469 ) ( CLEAR ?auto_859464 ) ( IS-CRATE ?auto_859465 ) ( AVAILABLE ?auto_859473 ) ( AVAILABLE ?auto_859471 ) ( SURFACE-AT ?auto_859465 ?auto_859470 ) ( ON ?auto_859465 ?auto_859467 ) ( CLEAR ?auto_859465 ) ( not ( = ?auto_859465 ?auto_859467 ) ) ( not ( = ?auto_859466 ?auto_859467 ) ) ( not ( = ?auto_859464 ?auto_859467 ) ) ( not ( = ?auto_859468 ?auto_859467 ) ) ( TRUCK-AT ?auto_859472 ?auto_859469 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_859465 ?auto_859466 )
      ( MAKE-2CRATE-VERIFY ?auto_859464 ?auto_859465 ?auto_859466 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_859474 - SURFACE
      ?auto_859475 - SURFACE
      ?auto_859476 - SURFACE
      ?auto_859477 - SURFACE
    )
    :vars
    (
      ?auto_859478 - HOIST
      ?auto_859480 - PLACE
      ?auto_859481 - PLACE
      ?auto_859483 - HOIST
      ?auto_859484 - SURFACE
      ?auto_859479 - SURFACE
      ?auto_859482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859478 ?auto_859480 ) ( IS-CRATE ?auto_859477 ) ( not ( = ?auto_859476 ?auto_859477 ) ) ( not ( = ?auto_859475 ?auto_859476 ) ) ( not ( = ?auto_859475 ?auto_859477 ) ) ( not ( = ?auto_859481 ?auto_859480 ) ) ( HOIST-AT ?auto_859483 ?auto_859481 ) ( not ( = ?auto_859478 ?auto_859483 ) ) ( SURFACE-AT ?auto_859477 ?auto_859481 ) ( ON ?auto_859477 ?auto_859484 ) ( CLEAR ?auto_859477 ) ( not ( = ?auto_859476 ?auto_859484 ) ) ( not ( = ?auto_859477 ?auto_859484 ) ) ( not ( = ?auto_859475 ?auto_859484 ) ) ( SURFACE-AT ?auto_859475 ?auto_859480 ) ( CLEAR ?auto_859475 ) ( IS-CRATE ?auto_859476 ) ( AVAILABLE ?auto_859478 ) ( AVAILABLE ?auto_859483 ) ( SURFACE-AT ?auto_859476 ?auto_859481 ) ( ON ?auto_859476 ?auto_859479 ) ( CLEAR ?auto_859476 ) ( not ( = ?auto_859476 ?auto_859479 ) ) ( not ( = ?auto_859477 ?auto_859479 ) ) ( not ( = ?auto_859475 ?auto_859479 ) ) ( not ( = ?auto_859484 ?auto_859479 ) ) ( TRUCK-AT ?auto_859482 ?auto_859480 ) ( ON ?auto_859475 ?auto_859474 ) ( not ( = ?auto_859474 ?auto_859475 ) ) ( not ( = ?auto_859474 ?auto_859476 ) ) ( not ( = ?auto_859474 ?auto_859477 ) ) ( not ( = ?auto_859474 ?auto_859484 ) ) ( not ( = ?auto_859474 ?auto_859479 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859475 ?auto_859476 ?auto_859477 )
      ( MAKE-3CRATE-VERIFY ?auto_859474 ?auto_859475 ?auto_859476 ?auto_859477 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_859485 - SURFACE
      ?auto_859486 - SURFACE
      ?auto_859487 - SURFACE
      ?auto_859489 - SURFACE
      ?auto_859488 - SURFACE
    )
    :vars
    (
      ?auto_859490 - HOIST
      ?auto_859492 - PLACE
      ?auto_859493 - PLACE
      ?auto_859495 - HOIST
      ?auto_859496 - SURFACE
      ?auto_859491 - SURFACE
      ?auto_859494 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859490 ?auto_859492 ) ( IS-CRATE ?auto_859488 ) ( not ( = ?auto_859489 ?auto_859488 ) ) ( not ( = ?auto_859487 ?auto_859489 ) ) ( not ( = ?auto_859487 ?auto_859488 ) ) ( not ( = ?auto_859493 ?auto_859492 ) ) ( HOIST-AT ?auto_859495 ?auto_859493 ) ( not ( = ?auto_859490 ?auto_859495 ) ) ( SURFACE-AT ?auto_859488 ?auto_859493 ) ( ON ?auto_859488 ?auto_859496 ) ( CLEAR ?auto_859488 ) ( not ( = ?auto_859489 ?auto_859496 ) ) ( not ( = ?auto_859488 ?auto_859496 ) ) ( not ( = ?auto_859487 ?auto_859496 ) ) ( SURFACE-AT ?auto_859487 ?auto_859492 ) ( CLEAR ?auto_859487 ) ( IS-CRATE ?auto_859489 ) ( AVAILABLE ?auto_859490 ) ( AVAILABLE ?auto_859495 ) ( SURFACE-AT ?auto_859489 ?auto_859493 ) ( ON ?auto_859489 ?auto_859491 ) ( CLEAR ?auto_859489 ) ( not ( = ?auto_859489 ?auto_859491 ) ) ( not ( = ?auto_859488 ?auto_859491 ) ) ( not ( = ?auto_859487 ?auto_859491 ) ) ( not ( = ?auto_859496 ?auto_859491 ) ) ( TRUCK-AT ?auto_859494 ?auto_859492 ) ( ON ?auto_859486 ?auto_859485 ) ( ON ?auto_859487 ?auto_859486 ) ( not ( = ?auto_859485 ?auto_859486 ) ) ( not ( = ?auto_859485 ?auto_859487 ) ) ( not ( = ?auto_859485 ?auto_859489 ) ) ( not ( = ?auto_859485 ?auto_859488 ) ) ( not ( = ?auto_859485 ?auto_859496 ) ) ( not ( = ?auto_859485 ?auto_859491 ) ) ( not ( = ?auto_859486 ?auto_859487 ) ) ( not ( = ?auto_859486 ?auto_859489 ) ) ( not ( = ?auto_859486 ?auto_859488 ) ) ( not ( = ?auto_859486 ?auto_859496 ) ) ( not ( = ?auto_859486 ?auto_859491 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859487 ?auto_859489 ?auto_859488 )
      ( MAKE-4CRATE-VERIFY ?auto_859485 ?auto_859486 ?auto_859487 ?auto_859489 ?auto_859488 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_859497 - SURFACE
      ?auto_859498 - SURFACE
      ?auto_859499 - SURFACE
      ?auto_859501 - SURFACE
      ?auto_859500 - SURFACE
      ?auto_859502 - SURFACE
    )
    :vars
    (
      ?auto_859503 - HOIST
      ?auto_859505 - PLACE
      ?auto_859506 - PLACE
      ?auto_859508 - HOIST
      ?auto_859509 - SURFACE
      ?auto_859504 - SURFACE
      ?auto_859507 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859503 ?auto_859505 ) ( IS-CRATE ?auto_859502 ) ( not ( = ?auto_859500 ?auto_859502 ) ) ( not ( = ?auto_859501 ?auto_859500 ) ) ( not ( = ?auto_859501 ?auto_859502 ) ) ( not ( = ?auto_859506 ?auto_859505 ) ) ( HOIST-AT ?auto_859508 ?auto_859506 ) ( not ( = ?auto_859503 ?auto_859508 ) ) ( SURFACE-AT ?auto_859502 ?auto_859506 ) ( ON ?auto_859502 ?auto_859509 ) ( CLEAR ?auto_859502 ) ( not ( = ?auto_859500 ?auto_859509 ) ) ( not ( = ?auto_859502 ?auto_859509 ) ) ( not ( = ?auto_859501 ?auto_859509 ) ) ( SURFACE-AT ?auto_859501 ?auto_859505 ) ( CLEAR ?auto_859501 ) ( IS-CRATE ?auto_859500 ) ( AVAILABLE ?auto_859503 ) ( AVAILABLE ?auto_859508 ) ( SURFACE-AT ?auto_859500 ?auto_859506 ) ( ON ?auto_859500 ?auto_859504 ) ( CLEAR ?auto_859500 ) ( not ( = ?auto_859500 ?auto_859504 ) ) ( not ( = ?auto_859502 ?auto_859504 ) ) ( not ( = ?auto_859501 ?auto_859504 ) ) ( not ( = ?auto_859509 ?auto_859504 ) ) ( TRUCK-AT ?auto_859507 ?auto_859505 ) ( ON ?auto_859498 ?auto_859497 ) ( ON ?auto_859499 ?auto_859498 ) ( ON ?auto_859501 ?auto_859499 ) ( not ( = ?auto_859497 ?auto_859498 ) ) ( not ( = ?auto_859497 ?auto_859499 ) ) ( not ( = ?auto_859497 ?auto_859501 ) ) ( not ( = ?auto_859497 ?auto_859500 ) ) ( not ( = ?auto_859497 ?auto_859502 ) ) ( not ( = ?auto_859497 ?auto_859509 ) ) ( not ( = ?auto_859497 ?auto_859504 ) ) ( not ( = ?auto_859498 ?auto_859499 ) ) ( not ( = ?auto_859498 ?auto_859501 ) ) ( not ( = ?auto_859498 ?auto_859500 ) ) ( not ( = ?auto_859498 ?auto_859502 ) ) ( not ( = ?auto_859498 ?auto_859509 ) ) ( not ( = ?auto_859498 ?auto_859504 ) ) ( not ( = ?auto_859499 ?auto_859501 ) ) ( not ( = ?auto_859499 ?auto_859500 ) ) ( not ( = ?auto_859499 ?auto_859502 ) ) ( not ( = ?auto_859499 ?auto_859509 ) ) ( not ( = ?auto_859499 ?auto_859504 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859501 ?auto_859500 ?auto_859502 )
      ( MAKE-5CRATE-VERIFY ?auto_859497 ?auto_859498 ?auto_859499 ?auto_859501 ?auto_859500 ?auto_859502 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_859510 - SURFACE
      ?auto_859511 - SURFACE
      ?auto_859512 - SURFACE
      ?auto_859514 - SURFACE
      ?auto_859513 - SURFACE
      ?auto_859515 - SURFACE
      ?auto_859516 - SURFACE
    )
    :vars
    (
      ?auto_859517 - HOIST
      ?auto_859519 - PLACE
      ?auto_859520 - PLACE
      ?auto_859522 - HOIST
      ?auto_859523 - SURFACE
      ?auto_859518 - SURFACE
      ?auto_859521 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859517 ?auto_859519 ) ( IS-CRATE ?auto_859516 ) ( not ( = ?auto_859515 ?auto_859516 ) ) ( not ( = ?auto_859513 ?auto_859515 ) ) ( not ( = ?auto_859513 ?auto_859516 ) ) ( not ( = ?auto_859520 ?auto_859519 ) ) ( HOIST-AT ?auto_859522 ?auto_859520 ) ( not ( = ?auto_859517 ?auto_859522 ) ) ( SURFACE-AT ?auto_859516 ?auto_859520 ) ( ON ?auto_859516 ?auto_859523 ) ( CLEAR ?auto_859516 ) ( not ( = ?auto_859515 ?auto_859523 ) ) ( not ( = ?auto_859516 ?auto_859523 ) ) ( not ( = ?auto_859513 ?auto_859523 ) ) ( SURFACE-AT ?auto_859513 ?auto_859519 ) ( CLEAR ?auto_859513 ) ( IS-CRATE ?auto_859515 ) ( AVAILABLE ?auto_859517 ) ( AVAILABLE ?auto_859522 ) ( SURFACE-AT ?auto_859515 ?auto_859520 ) ( ON ?auto_859515 ?auto_859518 ) ( CLEAR ?auto_859515 ) ( not ( = ?auto_859515 ?auto_859518 ) ) ( not ( = ?auto_859516 ?auto_859518 ) ) ( not ( = ?auto_859513 ?auto_859518 ) ) ( not ( = ?auto_859523 ?auto_859518 ) ) ( TRUCK-AT ?auto_859521 ?auto_859519 ) ( ON ?auto_859511 ?auto_859510 ) ( ON ?auto_859512 ?auto_859511 ) ( ON ?auto_859514 ?auto_859512 ) ( ON ?auto_859513 ?auto_859514 ) ( not ( = ?auto_859510 ?auto_859511 ) ) ( not ( = ?auto_859510 ?auto_859512 ) ) ( not ( = ?auto_859510 ?auto_859514 ) ) ( not ( = ?auto_859510 ?auto_859513 ) ) ( not ( = ?auto_859510 ?auto_859515 ) ) ( not ( = ?auto_859510 ?auto_859516 ) ) ( not ( = ?auto_859510 ?auto_859523 ) ) ( not ( = ?auto_859510 ?auto_859518 ) ) ( not ( = ?auto_859511 ?auto_859512 ) ) ( not ( = ?auto_859511 ?auto_859514 ) ) ( not ( = ?auto_859511 ?auto_859513 ) ) ( not ( = ?auto_859511 ?auto_859515 ) ) ( not ( = ?auto_859511 ?auto_859516 ) ) ( not ( = ?auto_859511 ?auto_859523 ) ) ( not ( = ?auto_859511 ?auto_859518 ) ) ( not ( = ?auto_859512 ?auto_859514 ) ) ( not ( = ?auto_859512 ?auto_859513 ) ) ( not ( = ?auto_859512 ?auto_859515 ) ) ( not ( = ?auto_859512 ?auto_859516 ) ) ( not ( = ?auto_859512 ?auto_859523 ) ) ( not ( = ?auto_859512 ?auto_859518 ) ) ( not ( = ?auto_859514 ?auto_859513 ) ) ( not ( = ?auto_859514 ?auto_859515 ) ) ( not ( = ?auto_859514 ?auto_859516 ) ) ( not ( = ?auto_859514 ?auto_859523 ) ) ( not ( = ?auto_859514 ?auto_859518 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859513 ?auto_859515 ?auto_859516 )
      ( MAKE-6CRATE-VERIFY ?auto_859510 ?auto_859511 ?auto_859512 ?auto_859514 ?auto_859513 ?auto_859515 ?auto_859516 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_859524 - SURFACE
      ?auto_859525 - SURFACE
      ?auto_859526 - SURFACE
      ?auto_859528 - SURFACE
      ?auto_859527 - SURFACE
      ?auto_859529 - SURFACE
      ?auto_859530 - SURFACE
      ?auto_859531 - SURFACE
    )
    :vars
    (
      ?auto_859532 - HOIST
      ?auto_859534 - PLACE
      ?auto_859535 - PLACE
      ?auto_859537 - HOIST
      ?auto_859538 - SURFACE
      ?auto_859533 - SURFACE
      ?auto_859536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859532 ?auto_859534 ) ( IS-CRATE ?auto_859531 ) ( not ( = ?auto_859530 ?auto_859531 ) ) ( not ( = ?auto_859529 ?auto_859530 ) ) ( not ( = ?auto_859529 ?auto_859531 ) ) ( not ( = ?auto_859535 ?auto_859534 ) ) ( HOIST-AT ?auto_859537 ?auto_859535 ) ( not ( = ?auto_859532 ?auto_859537 ) ) ( SURFACE-AT ?auto_859531 ?auto_859535 ) ( ON ?auto_859531 ?auto_859538 ) ( CLEAR ?auto_859531 ) ( not ( = ?auto_859530 ?auto_859538 ) ) ( not ( = ?auto_859531 ?auto_859538 ) ) ( not ( = ?auto_859529 ?auto_859538 ) ) ( SURFACE-AT ?auto_859529 ?auto_859534 ) ( CLEAR ?auto_859529 ) ( IS-CRATE ?auto_859530 ) ( AVAILABLE ?auto_859532 ) ( AVAILABLE ?auto_859537 ) ( SURFACE-AT ?auto_859530 ?auto_859535 ) ( ON ?auto_859530 ?auto_859533 ) ( CLEAR ?auto_859530 ) ( not ( = ?auto_859530 ?auto_859533 ) ) ( not ( = ?auto_859531 ?auto_859533 ) ) ( not ( = ?auto_859529 ?auto_859533 ) ) ( not ( = ?auto_859538 ?auto_859533 ) ) ( TRUCK-AT ?auto_859536 ?auto_859534 ) ( ON ?auto_859525 ?auto_859524 ) ( ON ?auto_859526 ?auto_859525 ) ( ON ?auto_859528 ?auto_859526 ) ( ON ?auto_859527 ?auto_859528 ) ( ON ?auto_859529 ?auto_859527 ) ( not ( = ?auto_859524 ?auto_859525 ) ) ( not ( = ?auto_859524 ?auto_859526 ) ) ( not ( = ?auto_859524 ?auto_859528 ) ) ( not ( = ?auto_859524 ?auto_859527 ) ) ( not ( = ?auto_859524 ?auto_859529 ) ) ( not ( = ?auto_859524 ?auto_859530 ) ) ( not ( = ?auto_859524 ?auto_859531 ) ) ( not ( = ?auto_859524 ?auto_859538 ) ) ( not ( = ?auto_859524 ?auto_859533 ) ) ( not ( = ?auto_859525 ?auto_859526 ) ) ( not ( = ?auto_859525 ?auto_859528 ) ) ( not ( = ?auto_859525 ?auto_859527 ) ) ( not ( = ?auto_859525 ?auto_859529 ) ) ( not ( = ?auto_859525 ?auto_859530 ) ) ( not ( = ?auto_859525 ?auto_859531 ) ) ( not ( = ?auto_859525 ?auto_859538 ) ) ( not ( = ?auto_859525 ?auto_859533 ) ) ( not ( = ?auto_859526 ?auto_859528 ) ) ( not ( = ?auto_859526 ?auto_859527 ) ) ( not ( = ?auto_859526 ?auto_859529 ) ) ( not ( = ?auto_859526 ?auto_859530 ) ) ( not ( = ?auto_859526 ?auto_859531 ) ) ( not ( = ?auto_859526 ?auto_859538 ) ) ( not ( = ?auto_859526 ?auto_859533 ) ) ( not ( = ?auto_859528 ?auto_859527 ) ) ( not ( = ?auto_859528 ?auto_859529 ) ) ( not ( = ?auto_859528 ?auto_859530 ) ) ( not ( = ?auto_859528 ?auto_859531 ) ) ( not ( = ?auto_859528 ?auto_859538 ) ) ( not ( = ?auto_859528 ?auto_859533 ) ) ( not ( = ?auto_859527 ?auto_859529 ) ) ( not ( = ?auto_859527 ?auto_859530 ) ) ( not ( = ?auto_859527 ?auto_859531 ) ) ( not ( = ?auto_859527 ?auto_859538 ) ) ( not ( = ?auto_859527 ?auto_859533 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859529 ?auto_859530 ?auto_859531 )
      ( MAKE-7CRATE-VERIFY ?auto_859524 ?auto_859525 ?auto_859526 ?auto_859528 ?auto_859527 ?auto_859529 ?auto_859530 ?auto_859531 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_859539 - SURFACE
      ?auto_859540 - SURFACE
      ?auto_859541 - SURFACE
      ?auto_859543 - SURFACE
      ?auto_859542 - SURFACE
      ?auto_859544 - SURFACE
      ?auto_859545 - SURFACE
      ?auto_859546 - SURFACE
      ?auto_859547 - SURFACE
    )
    :vars
    (
      ?auto_859548 - HOIST
      ?auto_859550 - PLACE
      ?auto_859551 - PLACE
      ?auto_859553 - HOIST
      ?auto_859554 - SURFACE
      ?auto_859549 - SURFACE
      ?auto_859552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859548 ?auto_859550 ) ( IS-CRATE ?auto_859547 ) ( not ( = ?auto_859546 ?auto_859547 ) ) ( not ( = ?auto_859545 ?auto_859546 ) ) ( not ( = ?auto_859545 ?auto_859547 ) ) ( not ( = ?auto_859551 ?auto_859550 ) ) ( HOIST-AT ?auto_859553 ?auto_859551 ) ( not ( = ?auto_859548 ?auto_859553 ) ) ( SURFACE-AT ?auto_859547 ?auto_859551 ) ( ON ?auto_859547 ?auto_859554 ) ( CLEAR ?auto_859547 ) ( not ( = ?auto_859546 ?auto_859554 ) ) ( not ( = ?auto_859547 ?auto_859554 ) ) ( not ( = ?auto_859545 ?auto_859554 ) ) ( SURFACE-AT ?auto_859545 ?auto_859550 ) ( CLEAR ?auto_859545 ) ( IS-CRATE ?auto_859546 ) ( AVAILABLE ?auto_859548 ) ( AVAILABLE ?auto_859553 ) ( SURFACE-AT ?auto_859546 ?auto_859551 ) ( ON ?auto_859546 ?auto_859549 ) ( CLEAR ?auto_859546 ) ( not ( = ?auto_859546 ?auto_859549 ) ) ( not ( = ?auto_859547 ?auto_859549 ) ) ( not ( = ?auto_859545 ?auto_859549 ) ) ( not ( = ?auto_859554 ?auto_859549 ) ) ( TRUCK-AT ?auto_859552 ?auto_859550 ) ( ON ?auto_859540 ?auto_859539 ) ( ON ?auto_859541 ?auto_859540 ) ( ON ?auto_859543 ?auto_859541 ) ( ON ?auto_859542 ?auto_859543 ) ( ON ?auto_859544 ?auto_859542 ) ( ON ?auto_859545 ?auto_859544 ) ( not ( = ?auto_859539 ?auto_859540 ) ) ( not ( = ?auto_859539 ?auto_859541 ) ) ( not ( = ?auto_859539 ?auto_859543 ) ) ( not ( = ?auto_859539 ?auto_859542 ) ) ( not ( = ?auto_859539 ?auto_859544 ) ) ( not ( = ?auto_859539 ?auto_859545 ) ) ( not ( = ?auto_859539 ?auto_859546 ) ) ( not ( = ?auto_859539 ?auto_859547 ) ) ( not ( = ?auto_859539 ?auto_859554 ) ) ( not ( = ?auto_859539 ?auto_859549 ) ) ( not ( = ?auto_859540 ?auto_859541 ) ) ( not ( = ?auto_859540 ?auto_859543 ) ) ( not ( = ?auto_859540 ?auto_859542 ) ) ( not ( = ?auto_859540 ?auto_859544 ) ) ( not ( = ?auto_859540 ?auto_859545 ) ) ( not ( = ?auto_859540 ?auto_859546 ) ) ( not ( = ?auto_859540 ?auto_859547 ) ) ( not ( = ?auto_859540 ?auto_859554 ) ) ( not ( = ?auto_859540 ?auto_859549 ) ) ( not ( = ?auto_859541 ?auto_859543 ) ) ( not ( = ?auto_859541 ?auto_859542 ) ) ( not ( = ?auto_859541 ?auto_859544 ) ) ( not ( = ?auto_859541 ?auto_859545 ) ) ( not ( = ?auto_859541 ?auto_859546 ) ) ( not ( = ?auto_859541 ?auto_859547 ) ) ( not ( = ?auto_859541 ?auto_859554 ) ) ( not ( = ?auto_859541 ?auto_859549 ) ) ( not ( = ?auto_859543 ?auto_859542 ) ) ( not ( = ?auto_859543 ?auto_859544 ) ) ( not ( = ?auto_859543 ?auto_859545 ) ) ( not ( = ?auto_859543 ?auto_859546 ) ) ( not ( = ?auto_859543 ?auto_859547 ) ) ( not ( = ?auto_859543 ?auto_859554 ) ) ( not ( = ?auto_859543 ?auto_859549 ) ) ( not ( = ?auto_859542 ?auto_859544 ) ) ( not ( = ?auto_859542 ?auto_859545 ) ) ( not ( = ?auto_859542 ?auto_859546 ) ) ( not ( = ?auto_859542 ?auto_859547 ) ) ( not ( = ?auto_859542 ?auto_859554 ) ) ( not ( = ?auto_859542 ?auto_859549 ) ) ( not ( = ?auto_859544 ?auto_859545 ) ) ( not ( = ?auto_859544 ?auto_859546 ) ) ( not ( = ?auto_859544 ?auto_859547 ) ) ( not ( = ?auto_859544 ?auto_859554 ) ) ( not ( = ?auto_859544 ?auto_859549 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859545 ?auto_859546 ?auto_859547 )
      ( MAKE-8CRATE-VERIFY ?auto_859539 ?auto_859540 ?auto_859541 ?auto_859543 ?auto_859542 ?auto_859544 ?auto_859545 ?auto_859546 ?auto_859547 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_859555 - SURFACE
      ?auto_859556 - SURFACE
      ?auto_859557 - SURFACE
      ?auto_859559 - SURFACE
      ?auto_859558 - SURFACE
      ?auto_859560 - SURFACE
      ?auto_859561 - SURFACE
      ?auto_859562 - SURFACE
      ?auto_859563 - SURFACE
      ?auto_859564 - SURFACE
    )
    :vars
    (
      ?auto_859565 - HOIST
      ?auto_859567 - PLACE
      ?auto_859568 - PLACE
      ?auto_859570 - HOIST
      ?auto_859571 - SURFACE
      ?auto_859566 - SURFACE
      ?auto_859569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859565 ?auto_859567 ) ( IS-CRATE ?auto_859564 ) ( not ( = ?auto_859563 ?auto_859564 ) ) ( not ( = ?auto_859562 ?auto_859563 ) ) ( not ( = ?auto_859562 ?auto_859564 ) ) ( not ( = ?auto_859568 ?auto_859567 ) ) ( HOIST-AT ?auto_859570 ?auto_859568 ) ( not ( = ?auto_859565 ?auto_859570 ) ) ( SURFACE-AT ?auto_859564 ?auto_859568 ) ( ON ?auto_859564 ?auto_859571 ) ( CLEAR ?auto_859564 ) ( not ( = ?auto_859563 ?auto_859571 ) ) ( not ( = ?auto_859564 ?auto_859571 ) ) ( not ( = ?auto_859562 ?auto_859571 ) ) ( SURFACE-AT ?auto_859562 ?auto_859567 ) ( CLEAR ?auto_859562 ) ( IS-CRATE ?auto_859563 ) ( AVAILABLE ?auto_859565 ) ( AVAILABLE ?auto_859570 ) ( SURFACE-AT ?auto_859563 ?auto_859568 ) ( ON ?auto_859563 ?auto_859566 ) ( CLEAR ?auto_859563 ) ( not ( = ?auto_859563 ?auto_859566 ) ) ( not ( = ?auto_859564 ?auto_859566 ) ) ( not ( = ?auto_859562 ?auto_859566 ) ) ( not ( = ?auto_859571 ?auto_859566 ) ) ( TRUCK-AT ?auto_859569 ?auto_859567 ) ( ON ?auto_859556 ?auto_859555 ) ( ON ?auto_859557 ?auto_859556 ) ( ON ?auto_859559 ?auto_859557 ) ( ON ?auto_859558 ?auto_859559 ) ( ON ?auto_859560 ?auto_859558 ) ( ON ?auto_859561 ?auto_859560 ) ( ON ?auto_859562 ?auto_859561 ) ( not ( = ?auto_859555 ?auto_859556 ) ) ( not ( = ?auto_859555 ?auto_859557 ) ) ( not ( = ?auto_859555 ?auto_859559 ) ) ( not ( = ?auto_859555 ?auto_859558 ) ) ( not ( = ?auto_859555 ?auto_859560 ) ) ( not ( = ?auto_859555 ?auto_859561 ) ) ( not ( = ?auto_859555 ?auto_859562 ) ) ( not ( = ?auto_859555 ?auto_859563 ) ) ( not ( = ?auto_859555 ?auto_859564 ) ) ( not ( = ?auto_859555 ?auto_859571 ) ) ( not ( = ?auto_859555 ?auto_859566 ) ) ( not ( = ?auto_859556 ?auto_859557 ) ) ( not ( = ?auto_859556 ?auto_859559 ) ) ( not ( = ?auto_859556 ?auto_859558 ) ) ( not ( = ?auto_859556 ?auto_859560 ) ) ( not ( = ?auto_859556 ?auto_859561 ) ) ( not ( = ?auto_859556 ?auto_859562 ) ) ( not ( = ?auto_859556 ?auto_859563 ) ) ( not ( = ?auto_859556 ?auto_859564 ) ) ( not ( = ?auto_859556 ?auto_859571 ) ) ( not ( = ?auto_859556 ?auto_859566 ) ) ( not ( = ?auto_859557 ?auto_859559 ) ) ( not ( = ?auto_859557 ?auto_859558 ) ) ( not ( = ?auto_859557 ?auto_859560 ) ) ( not ( = ?auto_859557 ?auto_859561 ) ) ( not ( = ?auto_859557 ?auto_859562 ) ) ( not ( = ?auto_859557 ?auto_859563 ) ) ( not ( = ?auto_859557 ?auto_859564 ) ) ( not ( = ?auto_859557 ?auto_859571 ) ) ( not ( = ?auto_859557 ?auto_859566 ) ) ( not ( = ?auto_859559 ?auto_859558 ) ) ( not ( = ?auto_859559 ?auto_859560 ) ) ( not ( = ?auto_859559 ?auto_859561 ) ) ( not ( = ?auto_859559 ?auto_859562 ) ) ( not ( = ?auto_859559 ?auto_859563 ) ) ( not ( = ?auto_859559 ?auto_859564 ) ) ( not ( = ?auto_859559 ?auto_859571 ) ) ( not ( = ?auto_859559 ?auto_859566 ) ) ( not ( = ?auto_859558 ?auto_859560 ) ) ( not ( = ?auto_859558 ?auto_859561 ) ) ( not ( = ?auto_859558 ?auto_859562 ) ) ( not ( = ?auto_859558 ?auto_859563 ) ) ( not ( = ?auto_859558 ?auto_859564 ) ) ( not ( = ?auto_859558 ?auto_859571 ) ) ( not ( = ?auto_859558 ?auto_859566 ) ) ( not ( = ?auto_859560 ?auto_859561 ) ) ( not ( = ?auto_859560 ?auto_859562 ) ) ( not ( = ?auto_859560 ?auto_859563 ) ) ( not ( = ?auto_859560 ?auto_859564 ) ) ( not ( = ?auto_859560 ?auto_859571 ) ) ( not ( = ?auto_859560 ?auto_859566 ) ) ( not ( = ?auto_859561 ?auto_859562 ) ) ( not ( = ?auto_859561 ?auto_859563 ) ) ( not ( = ?auto_859561 ?auto_859564 ) ) ( not ( = ?auto_859561 ?auto_859571 ) ) ( not ( = ?auto_859561 ?auto_859566 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859562 ?auto_859563 ?auto_859564 )
      ( MAKE-9CRATE-VERIFY ?auto_859555 ?auto_859556 ?auto_859557 ?auto_859559 ?auto_859558 ?auto_859560 ?auto_859561 ?auto_859562 ?auto_859563 ?auto_859564 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_859572 - SURFACE
      ?auto_859573 - SURFACE
    )
    :vars
    (
      ?auto_859574 - HOIST
      ?auto_859577 - PLACE
      ?auto_859575 - SURFACE
      ?auto_859578 - PLACE
      ?auto_859580 - HOIST
      ?auto_859581 - SURFACE
      ?auto_859576 - SURFACE
      ?auto_859579 - TRUCK
      ?auto_859582 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_859574 ?auto_859577 ) ( IS-CRATE ?auto_859573 ) ( not ( = ?auto_859572 ?auto_859573 ) ) ( not ( = ?auto_859575 ?auto_859572 ) ) ( not ( = ?auto_859575 ?auto_859573 ) ) ( not ( = ?auto_859578 ?auto_859577 ) ) ( HOIST-AT ?auto_859580 ?auto_859578 ) ( not ( = ?auto_859574 ?auto_859580 ) ) ( SURFACE-AT ?auto_859573 ?auto_859578 ) ( ON ?auto_859573 ?auto_859581 ) ( CLEAR ?auto_859573 ) ( not ( = ?auto_859572 ?auto_859581 ) ) ( not ( = ?auto_859573 ?auto_859581 ) ) ( not ( = ?auto_859575 ?auto_859581 ) ) ( IS-CRATE ?auto_859572 ) ( AVAILABLE ?auto_859580 ) ( SURFACE-AT ?auto_859572 ?auto_859578 ) ( ON ?auto_859572 ?auto_859576 ) ( CLEAR ?auto_859572 ) ( not ( = ?auto_859572 ?auto_859576 ) ) ( not ( = ?auto_859573 ?auto_859576 ) ) ( not ( = ?auto_859575 ?auto_859576 ) ) ( not ( = ?auto_859581 ?auto_859576 ) ) ( TRUCK-AT ?auto_859579 ?auto_859577 ) ( SURFACE-AT ?auto_859582 ?auto_859577 ) ( CLEAR ?auto_859582 ) ( LIFTING ?auto_859574 ?auto_859575 ) ( IS-CRATE ?auto_859575 ) ( not ( = ?auto_859582 ?auto_859575 ) ) ( not ( = ?auto_859572 ?auto_859582 ) ) ( not ( = ?auto_859573 ?auto_859582 ) ) ( not ( = ?auto_859581 ?auto_859582 ) ) ( not ( = ?auto_859576 ?auto_859582 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_859582 ?auto_859575 )
      ( MAKE-2CRATE ?auto_859575 ?auto_859572 ?auto_859573 )
      ( MAKE-1CRATE-VERIFY ?auto_859572 ?auto_859573 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_859583 - SURFACE
      ?auto_859584 - SURFACE
      ?auto_859585 - SURFACE
    )
    :vars
    (
      ?auto_859592 - HOIST
      ?auto_859586 - PLACE
      ?auto_859593 - PLACE
      ?auto_859590 - HOIST
      ?auto_859591 - SURFACE
      ?auto_859587 - SURFACE
      ?auto_859588 - TRUCK
      ?auto_859589 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_859592 ?auto_859586 ) ( IS-CRATE ?auto_859585 ) ( not ( = ?auto_859584 ?auto_859585 ) ) ( not ( = ?auto_859583 ?auto_859584 ) ) ( not ( = ?auto_859583 ?auto_859585 ) ) ( not ( = ?auto_859593 ?auto_859586 ) ) ( HOIST-AT ?auto_859590 ?auto_859593 ) ( not ( = ?auto_859592 ?auto_859590 ) ) ( SURFACE-AT ?auto_859585 ?auto_859593 ) ( ON ?auto_859585 ?auto_859591 ) ( CLEAR ?auto_859585 ) ( not ( = ?auto_859584 ?auto_859591 ) ) ( not ( = ?auto_859585 ?auto_859591 ) ) ( not ( = ?auto_859583 ?auto_859591 ) ) ( IS-CRATE ?auto_859584 ) ( AVAILABLE ?auto_859590 ) ( SURFACE-AT ?auto_859584 ?auto_859593 ) ( ON ?auto_859584 ?auto_859587 ) ( CLEAR ?auto_859584 ) ( not ( = ?auto_859584 ?auto_859587 ) ) ( not ( = ?auto_859585 ?auto_859587 ) ) ( not ( = ?auto_859583 ?auto_859587 ) ) ( not ( = ?auto_859591 ?auto_859587 ) ) ( TRUCK-AT ?auto_859588 ?auto_859586 ) ( SURFACE-AT ?auto_859589 ?auto_859586 ) ( CLEAR ?auto_859589 ) ( LIFTING ?auto_859592 ?auto_859583 ) ( IS-CRATE ?auto_859583 ) ( not ( = ?auto_859589 ?auto_859583 ) ) ( not ( = ?auto_859584 ?auto_859589 ) ) ( not ( = ?auto_859585 ?auto_859589 ) ) ( not ( = ?auto_859591 ?auto_859589 ) ) ( not ( = ?auto_859587 ?auto_859589 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_859584 ?auto_859585 )
      ( MAKE-2CRATE-VERIFY ?auto_859583 ?auto_859584 ?auto_859585 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_859594 - SURFACE
      ?auto_859595 - SURFACE
      ?auto_859596 - SURFACE
      ?auto_859597 - SURFACE
    )
    :vars
    (
      ?auto_859602 - HOIST
      ?auto_859598 - PLACE
      ?auto_859601 - PLACE
      ?auto_859599 - HOIST
      ?auto_859603 - SURFACE
      ?auto_859600 - SURFACE
      ?auto_859604 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859602 ?auto_859598 ) ( IS-CRATE ?auto_859597 ) ( not ( = ?auto_859596 ?auto_859597 ) ) ( not ( = ?auto_859595 ?auto_859596 ) ) ( not ( = ?auto_859595 ?auto_859597 ) ) ( not ( = ?auto_859601 ?auto_859598 ) ) ( HOIST-AT ?auto_859599 ?auto_859601 ) ( not ( = ?auto_859602 ?auto_859599 ) ) ( SURFACE-AT ?auto_859597 ?auto_859601 ) ( ON ?auto_859597 ?auto_859603 ) ( CLEAR ?auto_859597 ) ( not ( = ?auto_859596 ?auto_859603 ) ) ( not ( = ?auto_859597 ?auto_859603 ) ) ( not ( = ?auto_859595 ?auto_859603 ) ) ( IS-CRATE ?auto_859596 ) ( AVAILABLE ?auto_859599 ) ( SURFACE-AT ?auto_859596 ?auto_859601 ) ( ON ?auto_859596 ?auto_859600 ) ( CLEAR ?auto_859596 ) ( not ( = ?auto_859596 ?auto_859600 ) ) ( not ( = ?auto_859597 ?auto_859600 ) ) ( not ( = ?auto_859595 ?auto_859600 ) ) ( not ( = ?auto_859603 ?auto_859600 ) ) ( TRUCK-AT ?auto_859604 ?auto_859598 ) ( SURFACE-AT ?auto_859594 ?auto_859598 ) ( CLEAR ?auto_859594 ) ( LIFTING ?auto_859602 ?auto_859595 ) ( IS-CRATE ?auto_859595 ) ( not ( = ?auto_859594 ?auto_859595 ) ) ( not ( = ?auto_859596 ?auto_859594 ) ) ( not ( = ?auto_859597 ?auto_859594 ) ) ( not ( = ?auto_859603 ?auto_859594 ) ) ( not ( = ?auto_859600 ?auto_859594 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859595 ?auto_859596 ?auto_859597 )
      ( MAKE-3CRATE-VERIFY ?auto_859594 ?auto_859595 ?auto_859596 ?auto_859597 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_859605 - SURFACE
      ?auto_859606 - SURFACE
      ?auto_859607 - SURFACE
      ?auto_859609 - SURFACE
      ?auto_859608 - SURFACE
    )
    :vars
    (
      ?auto_859614 - HOIST
      ?auto_859610 - PLACE
      ?auto_859613 - PLACE
      ?auto_859611 - HOIST
      ?auto_859615 - SURFACE
      ?auto_859612 - SURFACE
      ?auto_859616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859614 ?auto_859610 ) ( IS-CRATE ?auto_859608 ) ( not ( = ?auto_859609 ?auto_859608 ) ) ( not ( = ?auto_859607 ?auto_859609 ) ) ( not ( = ?auto_859607 ?auto_859608 ) ) ( not ( = ?auto_859613 ?auto_859610 ) ) ( HOIST-AT ?auto_859611 ?auto_859613 ) ( not ( = ?auto_859614 ?auto_859611 ) ) ( SURFACE-AT ?auto_859608 ?auto_859613 ) ( ON ?auto_859608 ?auto_859615 ) ( CLEAR ?auto_859608 ) ( not ( = ?auto_859609 ?auto_859615 ) ) ( not ( = ?auto_859608 ?auto_859615 ) ) ( not ( = ?auto_859607 ?auto_859615 ) ) ( IS-CRATE ?auto_859609 ) ( AVAILABLE ?auto_859611 ) ( SURFACE-AT ?auto_859609 ?auto_859613 ) ( ON ?auto_859609 ?auto_859612 ) ( CLEAR ?auto_859609 ) ( not ( = ?auto_859609 ?auto_859612 ) ) ( not ( = ?auto_859608 ?auto_859612 ) ) ( not ( = ?auto_859607 ?auto_859612 ) ) ( not ( = ?auto_859615 ?auto_859612 ) ) ( TRUCK-AT ?auto_859616 ?auto_859610 ) ( SURFACE-AT ?auto_859606 ?auto_859610 ) ( CLEAR ?auto_859606 ) ( LIFTING ?auto_859614 ?auto_859607 ) ( IS-CRATE ?auto_859607 ) ( not ( = ?auto_859606 ?auto_859607 ) ) ( not ( = ?auto_859609 ?auto_859606 ) ) ( not ( = ?auto_859608 ?auto_859606 ) ) ( not ( = ?auto_859615 ?auto_859606 ) ) ( not ( = ?auto_859612 ?auto_859606 ) ) ( ON ?auto_859606 ?auto_859605 ) ( not ( = ?auto_859605 ?auto_859606 ) ) ( not ( = ?auto_859605 ?auto_859607 ) ) ( not ( = ?auto_859605 ?auto_859609 ) ) ( not ( = ?auto_859605 ?auto_859608 ) ) ( not ( = ?auto_859605 ?auto_859615 ) ) ( not ( = ?auto_859605 ?auto_859612 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859607 ?auto_859609 ?auto_859608 )
      ( MAKE-4CRATE-VERIFY ?auto_859605 ?auto_859606 ?auto_859607 ?auto_859609 ?auto_859608 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_859617 - SURFACE
      ?auto_859618 - SURFACE
      ?auto_859619 - SURFACE
      ?auto_859621 - SURFACE
      ?auto_859620 - SURFACE
      ?auto_859622 - SURFACE
    )
    :vars
    (
      ?auto_859627 - HOIST
      ?auto_859623 - PLACE
      ?auto_859626 - PLACE
      ?auto_859624 - HOIST
      ?auto_859628 - SURFACE
      ?auto_859625 - SURFACE
      ?auto_859629 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859627 ?auto_859623 ) ( IS-CRATE ?auto_859622 ) ( not ( = ?auto_859620 ?auto_859622 ) ) ( not ( = ?auto_859621 ?auto_859620 ) ) ( not ( = ?auto_859621 ?auto_859622 ) ) ( not ( = ?auto_859626 ?auto_859623 ) ) ( HOIST-AT ?auto_859624 ?auto_859626 ) ( not ( = ?auto_859627 ?auto_859624 ) ) ( SURFACE-AT ?auto_859622 ?auto_859626 ) ( ON ?auto_859622 ?auto_859628 ) ( CLEAR ?auto_859622 ) ( not ( = ?auto_859620 ?auto_859628 ) ) ( not ( = ?auto_859622 ?auto_859628 ) ) ( not ( = ?auto_859621 ?auto_859628 ) ) ( IS-CRATE ?auto_859620 ) ( AVAILABLE ?auto_859624 ) ( SURFACE-AT ?auto_859620 ?auto_859626 ) ( ON ?auto_859620 ?auto_859625 ) ( CLEAR ?auto_859620 ) ( not ( = ?auto_859620 ?auto_859625 ) ) ( not ( = ?auto_859622 ?auto_859625 ) ) ( not ( = ?auto_859621 ?auto_859625 ) ) ( not ( = ?auto_859628 ?auto_859625 ) ) ( TRUCK-AT ?auto_859629 ?auto_859623 ) ( SURFACE-AT ?auto_859619 ?auto_859623 ) ( CLEAR ?auto_859619 ) ( LIFTING ?auto_859627 ?auto_859621 ) ( IS-CRATE ?auto_859621 ) ( not ( = ?auto_859619 ?auto_859621 ) ) ( not ( = ?auto_859620 ?auto_859619 ) ) ( not ( = ?auto_859622 ?auto_859619 ) ) ( not ( = ?auto_859628 ?auto_859619 ) ) ( not ( = ?auto_859625 ?auto_859619 ) ) ( ON ?auto_859618 ?auto_859617 ) ( ON ?auto_859619 ?auto_859618 ) ( not ( = ?auto_859617 ?auto_859618 ) ) ( not ( = ?auto_859617 ?auto_859619 ) ) ( not ( = ?auto_859617 ?auto_859621 ) ) ( not ( = ?auto_859617 ?auto_859620 ) ) ( not ( = ?auto_859617 ?auto_859622 ) ) ( not ( = ?auto_859617 ?auto_859628 ) ) ( not ( = ?auto_859617 ?auto_859625 ) ) ( not ( = ?auto_859618 ?auto_859619 ) ) ( not ( = ?auto_859618 ?auto_859621 ) ) ( not ( = ?auto_859618 ?auto_859620 ) ) ( not ( = ?auto_859618 ?auto_859622 ) ) ( not ( = ?auto_859618 ?auto_859628 ) ) ( not ( = ?auto_859618 ?auto_859625 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859621 ?auto_859620 ?auto_859622 )
      ( MAKE-5CRATE-VERIFY ?auto_859617 ?auto_859618 ?auto_859619 ?auto_859621 ?auto_859620 ?auto_859622 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_859630 - SURFACE
      ?auto_859631 - SURFACE
      ?auto_859632 - SURFACE
      ?auto_859634 - SURFACE
      ?auto_859633 - SURFACE
      ?auto_859635 - SURFACE
      ?auto_859636 - SURFACE
    )
    :vars
    (
      ?auto_859641 - HOIST
      ?auto_859637 - PLACE
      ?auto_859640 - PLACE
      ?auto_859638 - HOIST
      ?auto_859642 - SURFACE
      ?auto_859639 - SURFACE
      ?auto_859643 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859641 ?auto_859637 ) ( IS-CRATE ?auto_859636 ) ( not ( = ?auto_859635 ?auto_859636 ) ) ( not ( = ?auto_859633 ?auto_859635 ) ) ( not ( = ?auto_859633 ?auto_859636 ) ) ( not ( = ?auto_859640 ?auto_859637 ) ) ( HOIST-AT ?auto_859638 ?auto_859640 ) ( not ( = ?auto_859641 ?auto_859638 ) ) ( SURFACE-AT ?auto_859636 ?auto_859640 ) ( ON ?auto_859636 ?auto_859642 ) ( CLEAR ?auto_859636 ) ( not ( = ?auto_859635 ?auto_859642 ) ) ( not ( = ?auto_859636 ?auto_859642 ) ) ( not ( = ?auto_859633 ?auto_859642 ) ) ( IS-CRATE ?auto_859635 ) ( AVAILABLE ?auto_859638 ) ( SURFACE-AT ?auto_859635 ?auto_859640 ) ( ON ?auto_859635 ?auto_859639 ) ( CLEAR ?auto_859635 ) ( not ( = ?auto_859635 ?auto_859639 ) ) ( not ( = ?auto_859636 ?auto_859639 ) ) ( not ( = ?auto_859633 ?auto_859639 ) ) ( not ( = ?auto_859642 ?auto_859639 ) ) ( TRUCK-AT ?auto_859643 ?auto_859637 ) ( SURFACE-AT ?auto_859634 ?auto_859637 ) ( CLEAR ?auto_859634 ) ( LIFTING ?auto_859641 ?auto_859633 ) ( IS-CRATE ?auto_859633 ) ( not ( = ?auto_859634 ?auto_859633 ) ) ( not ( = ?auto_859635 ?auto_859634 ) ) ( not ( = ?auto_859636 ?auto_859634 ) ) ( not ( = ?auto_859642 ?auto_859634 ) ) ( not ( = ?auto_859639 ?auto_859634 ) ) ( ON ?auto_859631 ?auto_859630 ) ( ON ?auto_859632 ?auto_859631 ) ( ON ?auto_859634 ?auto_859632 ) ( not ( = ?auto_859630 ?auto_859631 ) ) ( not ( = ?auto_859630 ?auto_859632 ) ) ( not ( = ?auto_859630 ?auto_859634 ) ) ( not ( = ?auto_859630 ?auto_859633 ) ) ( not ( = ?auto_859630 ?auto_859635 ) ) ( not ( = ?auto_859630 ?auto_859636 ) ) ( not ( = ?auto_859630 ?auto_859642 ) ) ( not ( = ?auto_859630 ?auto_859639 ) ) ( not ( = ?auto_859631 ?auto_859632 ) ) ( not ( = ?auto_859631 ?auto_859634 ) ) ( not ( = ?auto_859631 ?auto_859633 ) ) ( not ( = ?auto_859631 ?auto_859635 ) ) ( not ( = ?auto_859631 ?auto_859636 ) ) ( not ( = ?auto_859631 ?auto_859642 ) ) ( not ( = ?auto_859631 ?auto_859639 ) ) ( not ( = ?auto_859632 ?auto_859634 ) ) ( not ( = ?auto_859632 ?auto_859633 ) ) ( not ( = ?auto_859632 ?auto_859635 ) ) ( not ( = ?auto_859632 ?auto_859636 ) ) ( not ( = ?auto_859632 ?auto_859642 ) ) ( not ( = ?auto_859632 ?auto_859639 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859633 ?auto_859635 ?auto_859636 )
      ( MAKE-6CRATE-VERIFY ?auto_859630 ?auto_859631 ?auto_859632 ?auto_859634 ?auto_859633 ?auto_859635 ?auto_859636 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_859644 - SURFACE
      ?auto_859645 - SURFACE
      ?auto_859646 - SURFACE
      ?auto_859648 - SURFACE
      ?auto_859647 - SURFACE
      ?auto_859649 - SURFACE
      ?auto_859650 - SURFACE
      ?auto_859651 - SURFACE
    )
    :vars
    (
      ?auto_859656 - HOIST
      ?auto_859652 - PLACE
      ?auto_859655 - PLACE
      ?auto_859653 - HOIST
      ?auto_859657 - SURFACE
      ?auto_859654 - SURFACE
      ?auto_859658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859656 ?auto_859652 ) ( IS-CRATE ?auto_859651 ) ( not ( = ?auto_859650 ?auto_859651 ) ) ( not ( = ?auto_859649 ?auto_859650 ) ) ( not ( = ?auto_859649 ?auto_859651 ) ) ( not ( = ?auto_859655 ?auto_859652 ) ) ( HOIST-AT ?auto_859653 ?auto_859655 ) ( not ( = ?auto_859656 ?auto_859653 ) ) ( SURFACE-AT ?auto_859651 ?auto_859655 ) ( ON ?auto_859651 ?auto_859657 ) ( CLEAR ?auto_859651 ) ( not ( = ?auto_859650 ?auto_859657 ) ) ( not ( = ?auto_859651 ?auto_859657 ) ) ( not ( = ?auto_859649 ?auto_859657 ) ) ( IS-CRATE ?auto_859650 ) ( AVAILABLE ?auto_859653 ) ( SURFACE-AT ?auto_859650 ?auto_859655 ) ( ON ?auto_859650 ?auto_859654 ) ( CLEAR ?auto_859650 ) ( not ( = ?auto_859650 ?auto_859654 ) ) ( not ( = ?auto_859651 ?auto_859654 ) ) ( not ( = ?auto_859649 ?auto_859654 ) ) ( not ( = ?auto_859657 ?auto_859654 ) ) ( TRUCK-AT ?auto_859658 ?auto_859652 ) ( SURFACE-AT ?auto_859647 ?auto_859652 ) ( CLEAR ?auto_859647 ) ( LIFTING ?auto_859656 ?auto_859649 ) ( IS-CRATE ?auto_859649 ) ( not ( = ?auto_859647 ?auto_859649 ) ) ( not ( = ?auto_859650 ?auto_859647 ) ) ( not ( = ?auto_859651 ?auto_859647 ) ) ( not ( = ?auto_859657 ?auto_859647 ) ) ( not ( = ?auto_859654 ?auto_859647 ) ) ( ON ?auto_859645 ?auto_859644 ) ( ON ?auto_859646 ?auto_859645 ) ( ON ?auto_859648 ?auto_859646 ) ( ON ?auto_859647 ?auto_859648 ) ( not ( = ?auto_859644 ?auto_859645 ) ) ( not ( = ?auto_859644 ?auto_859646 ) ) ( not ( = ?auto_859644 ?auto_859648 ) ) ( not ( = ?auto_859644 ?auto_859647 ) ) ( not ( = ?auto_859644 ?auto_859649 ) ) ( not ( = ?auto_859644 ?auto_859650 ) ) ( not ( = ?auto_859644 ?auto_859651 ) ) ( not ( = ?auto_859644 ?auto_859657 ) ) ( not ( = ?auto_859644 ?auto_859654 ) ) ( not ( = ?auto_859645 ?auto_859646 ) ) ( not ( = ?auto_859645 ?auto_859648 ) ) ( not ( = ?auto_859645 ?auto_859647 ) ) ( not ( = ?auto_859645 ?auto_859649 ) ) ( not ( = ?auto_859645 ?auto_859650 ) ) ( not ( = ?auto_859645 ?auto_859651 ) ) ( not ( = ?auto_859645 ?auto_859657 ) ) ( not ( = ?auto_859645 ?auto_859654 ) ) ( not ( = ?auto_859646 ?auto_859648 ) ) ( not ( = ?auto_859646 ?auto_859647 ) ) ( not ( = ?auto_859646 ?auto_859649 ) ) ( not ( = ?auto_859646 ?auto_859650 ) ) ( not ( = ?auto_859646 ?auto_859651 ) ) ( not ( = ?auto_859646 ?auto_859657 ) ) ( not ( = ?auto_859646 ?auto_859654 ) ) ( not ( = ?auto_859648 ?auto_859647 ) ) ( not ( = ?auto_859648 ?auto_859649 ) ) ( not ( = ?auto_859648 ?auto_859650 ) ) ( not ( = ?auto_859648 ?auto_859651 ) ) ( not ( = ?auto_859648 ?auto_859657 ) ) ( not ( = ?auto_859648 ?auto_859654 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859649 ?auto_859650 ?auto_859651 )
      ( MAKE-7CRATE-VERIFY ?auto_859644 ?auto_859645 ?auto_859646 ?auto_859648 ?auto_859647 ?auto_859649 ?auto_859650 ?auto_859651 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_859659 - SURFACE
      ?auto_859660 - SURFACE
      ?auto_859661 - SURFACE
      ?auto_859663 - SURFACE
      ?auto_859662 - SURFACE
      ?auto_859664 - SURFACE
      ?auto_859665 - SURFACE
      ?auto_859666 - SURFACE
      ?auto_859667 - SURFACE
    )
    :vars
    (
      ?auto_859672 - HOIST
      ?auto_859668 - PLACE
      ?auto_859671 - PLACE
      ?auto_859669 - HOIST
      ?auto_859673 - SURFACE
      ?auto_859670 - SURFACE
      ?auto_859674 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859672 ?auto_859668 ) ( IS-CRATE ?auto_859667 ) ( not ( = ?auto_859666 ?auto_859667 ) ) ( not ( = ?auto_859665 ?auto_859666 ) ) ( not ( = ?auto_859665 ?auto_859667 ) ) ( not ( = ?auto_859671 ?auto_859668 ) ) ( HOIST-AT ?auto_859669 ?auto_859671 ) ( not ( = ?auto_859672 ?auto_859669 ) ) ( SURFACE-AT ?auto_859667 ?auto_859671 ) ( ON ?auto_859667 ?auto_859673 ) ( CLEAR ?auto_859667 ) ( not ( = ?auto_859666 ?auto_859673 ) ) ( not ( = ?auto_859667 ?auto_859673 ) ) ( not ( = ?auto_859665 ?auto_859673 ) ) ( IS-CRATE ?auto_859666 ) ( AVAILABLE ?auto_859669 ) ( SURFACE-AT ?auto_859666 ?auto_859671 ) ( ON ?auto_859666 ?auto_859670 ) ( CLEAR ?auto_859666 ) ( not ( = ?auto_859666 ?auto_859670 ) ) ( not ( = ?auto_859667 ?auto_859670 ) ) ( not ( = ?auto_859665 ?auto_859670 ) ) ( not ( = ?auto_859673 ?auto_859670 ) ) ( TRUCK-AT ?auto_859674 ?auto_859668 ) ( SURFACE-AT ?auto_859664 ?auto_859668 ) ( CLEAR ?auto_859664 ) ( LIFTING ?auto_859672 ?auto_859665 ) ( IS-CRATE ?auto_859665 ) ( not ( = ?auto_859664 ?auto_859665 ) ) ( not ( = ?auto_859666 ?auto_859664 ) ) ( not ( = ?auto_859667 ?auto_859664 ) ) ( not ( = ?auto_859673 ?auto_859664 ) ) ( not ( = ?auto_859670 ?auto_859664 ) ) ( ON ?auto_859660 ?auto_859659 ) ( ON ?auto_859661 ?auto_859660 ) ( ON ?auto_859663 ?auto_859661 ) ( ON ?auto_859662 ?auto_859663 ) ( ON ?auto_859664 ?auto_859662 ) ( not ( = ?auto_859659 ?auto_859660 ) ) ( not ( = ?auto_859659 ?auto_859661 ) ) ( not ( = ?auto_859659 ?auto_859663 ) ) ( not ( = ?auto_859659 ?auto_859662 ) ) ( not ( = ?auto_859659 ?auto_859664 ) ) ( not ( = ?auto_859659 ?auto_859665 ) ) ( not ( = ?auto_859659 ?auto_859666 ) ) ( not ( = ?auto_859659 ?auto_859667 ) ) ( not ( = ?auto_859659 ?auto_859673 ) ) ( not ( = ?auto_859659 ?auto_859670 ) ) ( not ( = ?auto_859660 ?auto_859661 ) ) ( not ( = ?auto_859660 ?auto_859663 ) ) ( not ( = ?auto_859660 ?auto_859662 ) ) ( not ( = ?auto_859660 ?auto_859664 ) ) ( not ( = ?auto_859660 ?auto_859665 ) ) ( not ( = ?auto_859660 ?auto_859666 ) ) ( not ( = ?auto_859660 ?auto_859667 ) ) ( not ( = ?auto_859660 ?auto_859673 ) ) ( not ( = ?auto_859660 ?auto_859670 ) ) ( not ( = ?auto_859661 ?auto_859663 ) ) ( not ( = ?auto_859661 ?auto_859662 ) ) ( not ( = ?auto_859661 ?auto_859664 ) ) ( not ( = ?auto_859661 ?auto_859665 ) ) ( not ( = ?auto_859661 ?auto_859666 ) ) ( not ( = ?auto_859661 ?auto_859667 ) ) ( not ( = ?auto_859661 ?auto_859673 ) ) ( not ( = ?auto_859661 ?auto_859670 ) ) ( not ( = ?auto_859663 ?auto_859662 ) ) ( not ( = ?auto_859663 ?auto_859664 ) ) ( not ( = ?auto_859663 ?auto_859665 ) ) ( not ( = ?auto_859663 ?auto_859666 ) ) ( not ( = ?auto_859663 ?auto_859667 ) ) ( not ( = ?auto_859663 ?auto_859673 ) ) ( not ( = ?auto_859663 ?auto_859670 ) ) ( not ( = ?auto_859662 ?auto_859664 ) ) ( not ( = ?auto_859662 ?auto_859665 ) ) ( not ( = ?auto_859662 ?auto_859666 ) ) ( not ( = ?auto_859662 ?auto_859667 ) ) ( not ( = ?auto_859662 ?auto_859673 ) ) ( not ( = ?auto_859662 ?auto_859670 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859665 ?auto_859666 ?auto_859667 )
      ( MAKE-8CRATE-VERIFY ?auto_859659 ?auto_859660 ?auto_859661 ?auto_859663 ?auto_859662 ?auto_859664 ?auto_859665 ?auto_859666 ?auto_859667 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_859675 - SURFACE
      ?auto_859676 - SURFACE
      ?auto_859677 - SURFACE
      ?auto_859679 - SURFACE
      ?auto_859678 - SURFACE
      ?auto_859680 - SURFACE
      ?auto_859681 - SURFACE
      ?auto_859682 - SURFACE
      ?auto_859683 - SURFACE
      ?auto_859684 - SURFACE
    )
    :vars
    (
      ?auto_859689 - HOIST
      ?auto_859685 - PLACE
      ?auto_859688 - PLACE
      ?auto_859686 - HOIST
      ?auto_859690 - SURFACE
      ?auto_859687 - SURFACE
      ?auto_859691 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859689 ?auto_859685 ) ( IS-CRATE ?auto_859684 ) ( not ( = ?auto_859683 ?auto_859684 ) ) ( not ( = ?auto_859682 ?auto_859683 ) ) ( not ( = ?auto_859682 ?auto_859684 ) ) ( not ( = ?auto_859688 ?auto_859685 ) ) ( HOIST-AT ?auto_859686 ?auto_859688 ) ( not ( = ?auto_859689 ?auto_859686 ) ) ( SURFACE-AT ?auto_859684 ?auto_859688 ) ( ON ?auto_859684 ?auto_859690 ) ( CLEAR ?auto_859684 ) ( not ( = ?auto_859683 ?auto_859690 ) ) ( not ( = ?auto_859684 ?auto_859690 ) ) ( not ( = ?auto_859682 ?auto_859690 ) ) ( IS-CRATE ?auto_859683 ) ( AVAILABLE ?auto_859686 ) ( SURFACE-AT ?auto_859683 ?auto_859688 ) ( ON ?auto_859683 ?auto_859687 ) ( CLEAR ?auto_859683 ) ( not ( = ?auto_859683 ?auto_859687 ) ) ( not ( = ?auto_859684 ?auto_859687 ) ) ( not ( = ?auto_859682 ?auto_859687 ) ) ( not ( = ?auto_859690 ?auto_859687 ) ) ( TRUCK-AT ?auto_859691 ?auto_859685 ) ( SURFACE-AT ?auto_859681 ?auto_859685 ) ( CLEAR ?auto_859681 ) ( LIFTING ?auto_859689 ?auto_859682 ) ( IS-CRATE ?auto_859682 ) ( not ( = ?auto_859681 ?auto_859682 ) ) ( not ( = ?auto_859683 ?auto_859681 ) ) ( not ( = ?auto_859684 ?auto_859681 ) ) ( not ( = ?auto_859690 ?auto_859681 ) ) ( not ( = ?auto_859687 ?auto_859681 ) ) ( ON ?auto_859676 ?auto_859675 ) ( ON ?auto_859677 ?auto_859676 ) ( ON ?auto_859679 ?auto_859677 ) ( ON ?auto_859678 ?auto_859679 ) ( ON ?auto_859680 ?auto_859678 ) ( ON ?auto_859681 ?auto_859680 ) ( not ( = ?auto_859675 ?auto_859676 ) ) ( not ( = ?auto_859675 ?auto_859677 ) ) ( not ( = ?auto_859675 ?auto_859679 ) ) ( not ( = ?auto_859675 ?auto_859678 ) ) ( not ( = ?auto_859675 ?auto_859680 ) ) ( not ( = ?auto_859675 ?auto_859681 ) ) ( not ( = ?auto_859675 ?auto_859682 ) ) ( not ( = ?auto_859675 ?auto_859683 ) ) ( not ( = ?auto_859675 ?auto_859684 ) ) ( not ( = ?auto_859675 ?auto_859690 ) ) ( not ( = ?auto_859675 ?auto_859687 ) ) ( not ( = ?auto_859676 ?auto_859677 ) ) ( not ( = ?auto_859676 ?auto_859679 ) ) ( not ( = ?auto_859676 ?auto_859678 ) ) ( not ( = ?auto_859676 ?auto_859680 ) ) ( not ( = ?auto_859676 ?auto_859681 ) ) ( not ( = ?auto_859676 ?auto_859682 ) ) ( not ( = ?auto_859676 ?auto_859683 ) ) ( not ( = ?auto_859676 ?auto_859684 ) ) ( not ( = ?auto_859676 ?auto_859690 ) ) ( not ( = ?auto_859676 ?auto_859687 ) ) ( not ( = ?auto_859677 ?auto_859679 ) ) ( not ( = ?auto_859677 ?auto_859678 ) ) ( not ( = ?auto_859677 ?auto_859680 ) ) ( not ( = ?auto_859677 ?auto_859681 ) ) ( not ( = ?auto_859677 ?auto_859682 ) ) ( not ( = ?auto_859677 ?auto_859683 ) ) ( not ( = ?auto_859677 ?auto_859684 ) ) ( not ( = ?auto_859677 ?auto_859690 ) ) ( not ( = ?auto_859677 ?auto_859687 ) ) ( not ( = ?auto_859679 ?auto_859678 ) ) ( not ( = ?auto_859679 ?auto_859680 ) ) ( not ( = ?auto_859679 ?auto_859681 ) ) ( not ( = ?auto_859679 ?auto_859682 ) ) ( not ( = ?auto_859679 ?auto_859683 ) ) ( not ( = ?auto_859679 ?auto_859684 ) ) ( not ( = ?auto_859679 ?auto_859690 ) ) ( not ( = ?auto_859679 ?auto_859687 ) ) ( not ( = ?auto_859678 ?auto_859680 ) ) ( not ( = ?auto_859678 ?auto_859681 ) ) ( not ( = ?auto_859678 ?auto_859682 ) ) ( not ( = ?auto_859678 ?auto_859683 ) ) ( not ( = ?auto_859678 ?auto_859684 ) ) ( not ( = ?auto_859678 ?auto_859690 ) ) ( not ( = ?auto_859678 ?auto_859687 ) ) ( not ( = ?auto_859680 ?auto_859681 ) ) ( not ( = ?auto_859680 ?auto_859682 ) ) ( not ( = ?auto_859680 ?auto_859683 ) ) ( not ( = ?auto_859680 ?auto_859684 ) ) ( not ( = ?auto_859680 ?auto_859690 ) ) ( not ( = ?auto_859680 ?auto_859687 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859682 ?auto_859683 ?auto_859684 )
      ( MAKE-9CRATE-VERIFY ?auto_859675 ?auto_859676 ?auto_859677 ?auto_859679 ?auto_859678 ?auto_859680 ?auto_859681 ?auto_859682 ?auto_859683 ?auto_859684 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_864556 - SURFACE
      ?auto_864557 - SURFACE
      ?auto_864558 - SURFACE
      ?auto_864560 - SURFACE
      ?auto_864559 - SURFACE
      ?auto_864561 - SURFACE
      ?auto_864562 - SURFACE
      ?auto_864563 - SURFACE
      ?auto_864564 - SURFACE
      ?auto_864565 - SURFACE
      ?auto_864566 - SURFACE
    )
    :vars
    (
      ?auto_864568 - HOIST
      ?auto_864567 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_864568 ?auto_864567 ) ( SURFACE-AT ?auto_864565 ?auto_864567 ) ( CLEAR ?auto_864565 ) ( LIFTING ?auto_864568 ?auto_864566 ) ( IS-CRATE ?auto_864566 ) ( not ( = ?auto_864565 ?auto_864566 ) ) ( ON ?auto_864557 ?auto_864556 ) ( ON ?auto_864558 ?auto_864557 ) ( ON ?auto_864560 ?auto_864558 ) ( ON ?auto_864559 ?auto_864560 ) ( ON ?auto_864561 ?auto_864559 ) ( ON ?auto_864562 ?auto_864561 ) ( ON ?auto_864563 ?auto_864562 ) ( ON ?auto_864564 ?auto_864563 ) ( ON ?auto_864565 ?auto_864564 ) ( not ( = ?auto_864556 ?auto_864557 ) ) ( not ( = ?auto_864556 ?auto_864558 ) ) ( not ( = ?auto_864556 ?auto_864560 ) ) ( not ( = ?auto_864556 ?auto_864559 ) ) ( not ( = ?auto_864556 ?auto_864561 ) ) ( not ( = ?auto_864556 ?auto_864562 ) ) ( not ( = ?auto_864556 ?auto_864563 ) ) ( not ( = ?auto_864556 ?auto_864564 ) ) ( not ( = ?auto_864556 ?auto_864565 ) ) ( not ( = ?auto_864556 ?auto_864566 ) ) ( not ( = ?auto_864557 ?auto_864558 ) ) ( not ( = ?auto_864557 ?auto_864560 ) ) ( not ( = ?auto_864557 ?auto_864559 ) ) ( not ( = ?auto_864557 ?auto_864561 ) ) ( not ( = ?auto_864557 ?auto_864562 ) ) ( not ( = ?auto_864557 ?auto_864563 ) ) ( not ( = ?auto_864557 ?auto_864564 ) ) ( not ( = ?auto_864557 ?auto_864565 ) ) ( not ( = ?auto_864557 ?auto_864566 ) ) ( not ( = ?auto_864558 ?auto_864560 ) ) ( not ( = ?auto_864558 ?auto_864559 ) ) ( not ( = ?auto_864558 ?auto_864561 ) ) ( not ( = ?auto_864558 ?auto_864562 ) ) ( not ( = ?auto_864558 ?auto_864563 ) ) ( not ( = ?auto_864558 ?auto_864564 ) ) ( not ( = ?auto_864558 ?auto_864565 ) ) ( not ( = ?auto_864558 ?auto_864566 ) ) ( not ( = ?auto_864560 ?auto_864559 ) ) ( not ( = ?auto_864560 ?auto_864561 ) ) ( not ( = ?auto_864560 ?auto_864562 ) ) ( not ( = ?auto_864560 ?auto_864563 ) ) ( not ( = ?auto_864560 ?auto_864564 ) ) ( not ( = ?auto_864560 ?auto_864565 ) ) ( not ( = ?auto_864560 ?auto_864566 ) ) ( not ( = ?auto_864559 ?auto_864561 ) ) ( not ( = ?auto_864559 ?auto_864562 ) ) ( not ( = ?auto_864559 ?auto_864563 ) ) ( not ( = ?auto_864559 ?auto_864564 ) ) ( not ( = ?auto_864559 ?auto_864565 ) ) ( not ( = ?auto_864559 ?auto_864566 ) ) ( not ( = ?auto_864561 ?auto_864562 ) ) ( not ( = ?auto_864561 ?auto_864563 ) ) ( not ( = ?auto_864561 ?auto_864564 ) ) ( not ( = ?auto_864561 ?auto_864565 ) ) ( not ( = ?auto_864561 ?auto_864566 ) ) ( not ( = ?auto_864562 ?auto_864563 ) ) ( not ( = ?auto_864562 ?auto_864564 ) ) ( not ( = ?auto_864562 ?auto_864565 ) ) ( not ( = ?auto_864562 ?auto_864566 ) ) ( not ( = ?auto_864563 ?auto_864564 ) ) ( not ( = ?auto_864563 ?auto_864565 ) ) ( not ( = ?auto_864563 ?auto_864566 ) ) ( not ( = ?auto_864564 ?auto_864565 ) ) ( not ( = ?auto_864564 ?auto_864566 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_864565 ?auto_864566 )
      ( MAKE-10CRATE-VERIFY ?auto_864556 ?auto_864557 ?auto_864558 ?auto_864560 ?auto_864559 ?auto_864561 ?auto_864562 ?auto_864563 ?auto_864564 ?auto_864565 ?auto_864566 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_864650 - SURFACE
      ?auto_864651 - SURFACE
      ?auto_864652 - SURFACE
      ?auto_864654 - SURFACE
      ?auto_864653 - SURFACE
      ?auto_864655 - SURFACE
      ?auto_864656 - SURFACE
      ?auto_864657 - SURFACE
      ?auto_864658 - SURFACE
      ?auto_864659 - SURFACE
      ?auto_864660 - SURFACE
    )
    :vars
    (
      ?auto_864661 - HOIST
      ?auto_864663 - PLACE
      ?auto_864662 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_864661 ?auto_864663 ) ( SURFACE-AT ?auto_864659 ?auto_864663 ) ( CLEAR ?auto_864659 ) ( IS-CRATE ?auto_864660 ) ( not ( = ?auto_864659 ?auto_864660 ) ) ( TRUCK-AT ?auto_864662 ?auto_864663 ) ( AVAILABLE ?auto_864661 ) ( IN ?auto_864660 ?auto_864662 ) ( ON ?auto_864659 ?auto_864658 ) ( not ( = ?auto_864658 ?auto_864659 ) ) ( not ( = ?auto_864658 ?auto_864660 ) ) ( ON ?auto_864651 ?auto_864650 ) ( ON ?auto_864652 ?auto_864651 ) ( ON ?auto_864654 ?auto_864652 ) ( ON ?auto_864653 ?auto_864654 ) ( ON ?auto_864655 ?auto_864653 ) ( ON ?auto_864656 ?auto_864655 ) ( ON ?auto_864657 ?auto_864656 ) ( ON ?auto_864658 ?auto_864657 ) ( not ( = ?auto_864650 ?auto_864651 ) ) ( not ( = ?auto_864650 ?auto_864652 ) ) ( not ( = ?auto_864650 ?auto_864654 ) ) ( not ( = ?auto_864650 ?auto_864653 ) ) ( not ( = ?auto_864650 ?auto_864655 ) ) ( not ( = ?auto_864650 ?auto_864656 ) ) ( not ( = ?auto_864650 ?auto_864657 ) ) ( not ( = ?auto_864650 ?auto_864658 ) ) ( not ( = ?auto_864650 ?auto_864659 ) ) ( not ( = ?auto_864650 ?auto_864660 ) ) ( not ( = ?auto_864651 ?auto_864652 ) ) ( not ( = ?auto_864651 ?auto_864654 ) ) ( not ( = ?auto_864651 ?auto_864653 ) ) ( not ( = ?auto_864651 ?auto_864655 ) ) ( not ( = ?auto_864651 ?auto_864656 ) ) ( not ( = ?auto_864651 ?auto_864657 ) ) ( not ( = ?auto_864651 ?auto_864658 ) ) ( not ( = ?auto_864651 ?auto_864659 ) ) ( not ( = ?auto_864651 ?auto_864660 ) ) ( not ( = ?auto_864652 ?auto_864654 ) ) ( not ( = ?auto_864652 ?auto_864653 ) ) ( not ( = ?auto_864652 ?auto_864655 ) ) ( not ( = ?auto_864652 ?auto_864656 ) ) ( not ( = ?auto_864652 ?auto_864657 ) ) ( not ( = ?auto_864652 ?auto_864658 ) ) ( not ( = ?auto_864652 ?auto_864659 ) ) ( not ( = ?auto_864652 ?auto_864660 ) ) ( not ( = ?auto_864654 ?auto_864653 ) ) ( not ( = ?auto_864654 ?auto_864655 ) ) ( not ( = ?auto_864654 ?auto_864656 ) ) ( not ( = ?auto_864654 ?auto_864657 ) ) ( not ( = ?auto_864654 ?auto_864658 ) ) ( not ( = ?auto_864654 ?auto_864659 ) ) ( not ( = ?auto_864654 ?auto_864660 ) ) ( not ( = ?auto_864653 ?auto_864655 ) ) ( not ( = ?auto_864653 ?auto_864656 ) ) ( not ( = ?auto_864653 ?auto_864657 ) ) ( not ( = ?auto_864653 ?auto_864658 ) ) ( not ( = ?auto_864653 ?auto_864659 ) ) ( not ( = ?auto_864653 ?auto_864660 ) ) ( not ( = ?auto_864655 ?auto_864656 ) ) ( not ( = ?auto_864655 ?auto_864657 ) ) ( not ( = ?auto_864655 ?auto_864658 ) ) ( not ( = ?auto_864655 ?auto_864659 ) ) ( not ( = ?auto_864655 ?auto_864660 ) ) ( not ( = ?auto_864656 ?auto_864657 ) ) ( not ( = ?auto_864656 ?auto_864658 ) ) ( not ( = ?auto_864656 ?auto_864659 ) ) ( not ( = ?auto_864656 ?auto_864660 ) ) ( not ( = ?auto_864657 ?auto_864658 ) ) ( not ( = ?auto_864657 ?auto_864659 ) ) ( not ( = ?auto_864657 ?auto_864660 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_864658 ?auto_864659 ?auto_864660 )
      ( MAKE-10CRATE-VERIFY ?auto_864650 ?auto_864651 ?auto_864652 ?auto_864654 ?auto_864653 ?auto_864655 ?auto_864656 ?auto_864657 ?auto_864658 ?auto_864659 ?auto_864660 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_864755 - SURFACE
      ?auto_864756 - SURFACE
      ?auto_864757 - SURFACE
      ?auto_864759 - SURFACE
      ?auto_864758 - SURFACE
      ?auto_864760 - SURFACE
      ?auto_864761 - SURFACE
      ?auto_864762 - SURFACE
      ?auto_864763 - SURFACE
      ?auto_864764 - SURFACE
      ?auto_864765 - SURFACE
    )
    :vars
    (
      ?auto_864768 - HOIST
      ?auto_864769 - PLACE
      ?auto_864766 - TRUCK
      ?auto_864767 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_864768 ?auto_864769 ) ( SURFACE-AT ?auto_864764 ?auto_864769 ) ( CLEAR ?auto_864764 ) ( IS-CRATE ?auto_864765 ) ( not ( = ?auto_864764 ?auto_864765 ) ) ( AVAILABLE ?auto_864768 ) ( IN ?auto_864765 ?auto_864766 ) ( ON ?auto_864764 ?auto_864763 ) ( not ( = ?auto_864763 ?auto_864764 ) ) ( not ( = ?auto_864763 ?auto_864765 ) ) ( TRUCK-AT ?auto_864766 ?auto_864767 ) ( not ( = ?auto_864767 ?auto_864769 ) ) ( ON ?auto_864756 ?auto_864755 ) ( ON ?auto_864757 ?auto_864756 ) ( ON ?auto_864759 ?auto_864757 ) ( ON ?auto_864758 ?auto_864759 ) ( ON ?auto_864760 ?auto_864758 ) ( ON ?auto_864761 ?auto_864760 ) ( ON ?auto_864762 ?auto_864761 ) ( ON ?auto_864763 ?auto_864762 ) ( not ( = ?auto_864755 ?auto_864756 ) ) ( not ( = ?auto_864755 ?auto_864757 ) ) ( not ( = ?auto_864755 ?auto_864759 ) ) ( not ( = ?auto_864755 ?auto_864758 ) ) ( not ( = ?auto_864755 ?auto_864760 ) ) ( not ( = ?auto_864755 ?auto_864761 ) ) ( not ( = ?auto_864755 ?auto_864762 ) ) ( not ( = ?auto_864755 ?auto_864763 ) ) ( not ( = ?auto_864755 ?auto_864764 ) ) ( not ( = ?auto_864755 ?auto_864765 ) ) ( not ( = ?auto_864756 ?auto_864757 ) ) ( not ( = ?auto_864756 ?auto_864759 ) ) ( not ( = ?auto_864756 ?auto_864758 ) ) ( not ( = ?auto_864756 ?auto_864760 ) ) ( not ( = ?auto_864756 ?auto_864761 ) ) ( not ( = ?auto_864756 ?auto_864762 ) ) ( not ( = ?auto_864756 ?auto_864763 ) ) ( not ( = ?auto_864756 ?auto_864764 ) ) ( not ( = ?auto_864756 ?auto_864765 ) ) ( not ( = ?auto_864757 ?auto_864759 ) ) ( not ( = ?auto_864757 ?auto_864758 ) ) ( not ( = ?auto_864757 ?auto_864760 ) ) ( not ( = ?auto_864757 ?auto_864761 ) ) ( not ( = ?auto_864757 ?auto_864762 ) ) ( not ( = ?auto_864757 ?auto_864763 ) ) ( not ( = ?auto_864757 ?auto_864764 ) ) ( not ( = ?auto_864757 ?auto_864765 ) ) ( not ( = ?auto_864759 ?auto_864758 ) ) ( not ( = ?auto_864759 ?auto_864760 ) ) ( not ( = ?auto_864759 ?auto_864761 ) ) ( not ( = ?auto_864759 ?auto_864762 ) ) ( not ( = ?auto_864759 ?auto_864763 ) ) ( not ( = ?auto_864759 ?auto_864764 ) ) ( not ( = ?auto_864759 ?auto_864765 ) ) ( not ( = ?auto_864758 ?auto_864760 ) ) ( not ( = ?auto_864758 ?auto_864761 ) ) ( not ( = ?auto_864758 ?auto_864762 ) ) ( not ( = ?auto_864758 ?auto_864763 ) ) ( not ( = ?auto_864758 ?auto_864764 ) ) ( not ( = ?auto_864758 ?auto_864765 ) ) ( not ( = ?auto_864760 ?auto_864761 ) ) ( not ( = ?auto_864760 ?auto_864762 ) ) ( not ( = ?auto_864760 ?auto_864763 ) ) ( not ( = ?auto_864760 ?auto_864764 ) ) ( not ( = ?auto_864760 ?auto_864765 ) ) ( not ( = ?auto_864761 ?auto_864762 ) ) ( not ( = ?auto_864761 ?auto_864763 ) ) ( not ( = ?auto_864761 ?auto_864764 ) ) ( not ( = ?auto_864761 ?auto_864765 ) ) ( not ( = ?auto_864762 ?auto_864763 ) ) ( not ( = ?auto_864762 ?auto_864764 ) ) ( not ( = ?auto_864762 ?auto_864765 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_864763 ?auto_864764 ?auto_864765 )
      ( MAKE-10CRATE-VERIFY ?auto_864755 ?auto_864756 ?auto_864757 ?auto_864759 ?auto_864758 ?auto_864760 ?auto_864761 ?auto_864762 ?auto_864763 ?auto_864764 ?auto_864765 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_864870 - SURFACE
      ?auto_864871 - SURFACE
      ?auto_864872 - SURFACE
      ?auto_864874 - SURFACE
      ?auto_864873 - SURFACE
      ?auto_864875 - SURFACE
      ?auto_864876 - SURFACE
      ?auto_864877 - SURFACE
      ?auto_864878 - SURFACE
      ?auto_864879 - SURFACE
      ?auto_864880 - SURFACE
    )
    :vars
    (
      ?auto_864882 - HOIST
      ?auto_864883 - PLACE
      ?auto_864885 - TRUCK
      ?auto_864884 - PLACE
      ?auto_864881 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_864882 ?auto_864883 ) ( SURFACE-AT ?auto_864879 ?auto_864883 ) ( CLEAR ?auto_864879 ) ( IS-CRATE ?auto_864880 ) ( not ( = ?auto_864879 ?auto_864880 ) ) ( AVAILABLE ?auto_864882 ) ( ON ?auto_864879 ?auto_864878 ) ( not ( = ?auto_864878 ?auto_864879 ) ) ( not ( = ?auto_864878 ?auto_864880 ) ) ( TRUCK-AT ?auto_864885 ?auto_864884 ) ( not ( = ?auto_864884 ?auto_864883 ) ) ( HOIST-AT ?auto_864881 ?auto_864884 ) ( LIFTING ?auto_864881 ?auto_864880 ) ( not ( = ?auto_864882 ?auto_864881 ) ) ( ON ?auto_864871 ?auto_864870 ) ( ON ?auto_864872 ?auto_864871 ) ( ON ?auto_864874 ?auto_864872 ) ( ON ?auto_864873 ?auto_864874 ) ( ON ?auto_864875 ?auto_864873 ) ( ON ?auto_864876 ?auto_864875 ) ( ON ?auto_864877 ?auto_864876 ) ( ON ?auto_864878 ?auto_864877 ) ( not ( = ?auto_864870 ?auto_864871 ) ) ( not ( = ?auto_864870 ?auto_864872 ) ) ( not ( = ?auto_864870 ?auto_864874 ) ) ( not ( = ?auto_864870 ?auto_864873 ) ) ( not ( = ?auto_864870 ?auto_864875 ) ) ( not ( = ?auto_864870 ?auto_864876 ) ) ( not ( = ?auto_864870 ?auto_864877 ) ) ( not ( = ?auto_864870 ?auto_864878 ) ) ( not ( = ?auto_864870 ?auto_864879 ) ) ( not ( = ?auto_864870 ?auto_864880 ) ) ( not ( = ?auto_864871 ?auto_864872 ) ) ( not ( = ?auto_864871 ?auto_864874 ) ) ( not ( = ?auto_864871 ?auto_864873 ) ) ( not ( = ?auto_864871 ?auto_864875 ) ) ( not ( = ?auto_864871 ?auto_864876 ) ) ( not ( = ?auto_864871 ?auto_864877 ) ) ( not ( = ?auto_864871 ?auto_864878 ) ) ( not ( = ?auto_864871 ?auto_864879 ) ) ( not ( = ?auto_864871 ?auto_864880 ) ) ( not ( = ?auto_864872 ?auto_864874 ) ) ( not ( = ?auto_864872 ?auto_864873 ) ) ( not ( = ?auto_864872 ?auto_864875 ) ) ( not ( = ?auto_864872 ?auto_864876 ) ) ( not ( = ?auto_864872 ?auto_864877 ) ) ( not ( = ?auto_864872 ?auto_864878 ) ) ( not ( = ?auto_864872 ?auto_864879 ) ) ( not ( = ?auto_864872 ?auto_864880 ) ) ( not ( = ?auto_864874 ?auto_864873 ) ) ( not ( = ?auto_864874 ?auto_864875 ) ) ( not ( = ?auto_864874 ?auto_864876 ) ) ( not ( = ?auto_864874 ?auto_864877 ) ) ( not ( = ?auto_864874 ?auto_864878 ) ) ( not ( = ?auto_864874 ?auto_864879 ) ) ( not ( = ?auto_864874 ?auto_864880 ) ) ( not ( = ?auto_864873 ?auto_864875 ) ) ( not ( = ?auto_864873 ?auto_864876 ) ) ( not ( = ?auto_864873 ?auto_864877 ) ) ( not ( = ?auto_864873 ?auto_864878 ) ) ( not ( = ?auto_864873 ?auto_864879 ) ) ( not ( = ?auto_864873 ?auto_864880 ) ) ( not ( = ?auto_864875 ?auto_864876 ) ) ( not ( = ?auto_864875 ?auto_864877 ) ) ( not ( = ?auto_864875 ?auto_864878 ) ) ( not ( = ?auto_864875 ?auto_864879 ) ) ( not ( = ?auto_864875 ?auto_864880 ) ) ( not ( = ?auto_864876 ?auto_864877 ) ) ( not ( = ?auto_864876 ?auto_864878 ) ) ( not ( = ?auto_864876 ?auto_864879 ) ) ( not ( = ?auto_864876 ?auto_864880 ) ) ( not ( = ?auto_864877 ?auto_864878 ) ) ( not ( = ?auto_864877 ?auto_864879 ) ) ( not ( = ?auto_864877 ?auto_864880 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_864878 ?auto_864879 ?auto_864880 )
      ( MAKE-10CRATE-VERIFY ?auto_864870 ?auto_864871 ?auto_864872 ?auto_864874 ?auto_864873 ?auto_864875 ?auto_864876 ?auto_864877 ?auto_864878 ?auto_864879 ?auto_864880 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_864995 - SURFACE
      ?auto_864996 - SURFACE
      ?auto_864997 - SURFACE
      ?auto_864999 - SURFACE
      ?auto_864998 - SURFACE
      ?auto_865000 - SURFACE
      ?auto_865001 - SURFACE
      ?auto_865002 - SURFACE
      ?auto_865003 - SURFACE
      ?auto_865004 - SURFACE
      ?auto_865005 - SURFACE
    )
    :vars
    (
      ?auto_865008 - HOIST
      ?auto_865009 - PLACE
      ?auto_865007 - TRUCK
      ?auto_865011 - PLACE
      ?auto_865006 - HOIST
      ?auto_865010 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_865008 ?auto_865009 ) ( SURFACE-AT ?auto_865004 ?auto_865009 ) ( CLEAR ?auto_865004 ) ( IS-CRATE ?auto_865005 ) ( not ( = ?auto_865004 ?auto_865005 ) ) ( AVAILABLE ?auto_865008 ) ( ON ?auto_865004 ?auto_865003 ) ( not ( = ?auto_865003 ?auto_865004 ) ) ( not ( = ?auto_865003 ?auto_865005 ) ) ( TRUCK-AT ?auto_865007 ?auto_865011 ) ( not ( = ?auto_865011 ?auto_865009 ) ) ( HOIST-AT ?auto_865006 ?auto_865011 ) ( not ( = ?auto_865008 ?auto_865006 ) ) ( AVAILABLE ?auto_865006 ) ( SURFACE-AT ?auto_865005 ?auto_865011 ) ( ON ?auto_865005 ?auto_865010 ) ( CLEAR ?auto_865005 ) ( not ( = ?auto_865004 ?auto_865010 ) ) ( not ( = ?auto_865005 ?auto_865010 ) ) ( not ( = ?auto_865003 ?auto_865010 ) ) ( ON ?auto_864996 ?auto_864995 ) ( ON ?auto_864997 ?auto_864996 ) ( ON ?auto_864999 ?auto_864997 ) ( ON ?auto_864998 ?auto_864999 ) ( ON ?auto_865000 ?auto_864998 ) ( ON ?auto_865001 ?auto_865000 ) ( ON ?auto_865002 ?auto_865001 ) ( ON ?auto_865003 ?auto_865002 ) ( not ( = ?auto_864995 ?auto_864996 ) ) ( not ( = ?auto_864995 ?auto_864997 ) ) ( not ( = ?auto_864995 ?auto_864999 ) ) ( not ( = ?auto_864995 ?auto_864998 ) ) ( not ( = ?auto_864995 ?auto_865000 ) ) ( not ( = ?auto_864995 ?auto_865001 ) ) ( not ( = ?auto_864995 ?auto_865002 ) ) ( not ( = ?auto_864995 ?auto_865003 ) ) ( not ( = ?auto_864995 ?auto_865004 ) ) ( not ( = ?auto_864995 ?auto_865005 ) ) ( not ( = ?auto_864995 ?auto_865010 ) ) ( not ( = ?auto_864996 ?auto_864997 ) ) ( not ( = ?auto_864996 ?auto_864999 ) ) ( not ( = ?auto_864996 ?auto_864998 ) ) ( not ( = ?auto_864996 ?auto_865000 ) ) ( not ( = ?auto_864996 ?auto_865001 ) ) ( not ( = ?auto_864996 ?auto_865002 ) ) ( not ( = ?auto_864996 ?auto_865003 ) ) ( not ( = ?auto_864996 ?auto_865004 ) ) ( not ( = ?auto_864996 ?auto_865005 ) ) ( not ( = ?auto_864996 ?auto_865010 ) ) ( not ( = ?auto_864997 ?auto_864999 ) ) ( not ( = ?auto_864997 ?auto_864998 ) ) ( not ( = ?auto_864997 ?auto_865000 ) ) ( not ( = ?auto_864997 ?auto_865001 ) ) ( not ( = ?auto_864997 ?auto_865002 ) ) ( not ( = ?auto_864997 ?auto_865003 ) ) ( not ( = ?auto_864997 ?auto_865004 ) ) ( not ( = ?auto_864997 ?auto_865005 ) ) ( not ( = ?auto_864997 ?auto_865010 ) ) ( not ( = ?auto_864999 ?auto_864998 ) ) ( not ( = ?auto_864999 ?auto_865000 ) ) ( not ( = ?auto_864999 ?auto_865001 ) ) ( not ( = ?auto_864999 ?auto_865002 ) ) ( not ( = ?auto_864999 ?auto_865003 ) ) ( not ( = ?auto_864999 ?auto_865004 ) ) ( not ( = ?auto_864999 ?auto_865005 ) ) ( not ( = ?auto_864999 ?auto_865010 ) ) ( not ( = ?auto_864998 ?auto_865000 ) ) ( not ( = ?auto_864998 ?auto_865001 ) ) ( not ( = ?auto_864998 ?auto_865002 ) ) ( not ( = ?auto_864998 ?auto_865003 ) ) ( not ( = ?auto_864998 ?auto_865004 ) ) ( not ( = ?auto_864998 ?auto_865005 ) ) ( not ( = ?auto_864998 ?auto_865010 ) ) ( not ( = ?auto_865000 ?auto_865001 ) ) ( not ( = ?auto_865000 ?auto_865002 ) ) ( not ( = ?auto_865000 ?auto_865003 ) ) ( not ( = ?auto_865000 ?auto_865004 ) ) ( not ( = ?auto_865000 ?auto_865005 ) ) ( not ( = ?auto_865000 ?auto_865010 ) ) ( not ( = ?auto_865001 ?auto_865002 ) ) ( not ( = ?auto_865001 ?auto_865003 ) ) ( not ( = ?auto_865001 ?auto_865004 ) ) ( not ( = ?auto_865001 ?auto_865005 ) ) ( not ( = ?auto_865001 ?auto_865010 ) ) ( not ( = ?auto_865002 ?auto_865003 ) ) ( not ( = ?auto_865002 ?auto_865004 ) ) ( not ( = ?auto_865002 ?auto_865005 ) ) ( not ( = ?auto_865002 ?auto_865010 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_865003 ?auto_865004 ?auto_865005 )
      ( MAKE-10CRATE-VERIFY ?auto_864995 ?auto_864996 ?auto_864997 ?auto_864999 ?auto_864998 ?auto_865000 ?auto_865001 ?auto_865002 ?auto_865003 ?auto_865004 ?auto_865005 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_865121 - SURFACE
      ?auto_865122 - SURFACE
      ?auto_865123 - SURFACE
      ?auto_865125 - SURFACE
      ?auto_865124 - SURFACE
      ?auto_865126 - SURFACE
      ?auto_865127 - SURFACE
      ?auto_865128 - SURFACE
      ?auto_865129 - SURFACE
      ?auto_865130 - SURFACE
      ?auto_865131 - SURFACE
    )
    :vars
    (
      ?auto_865132 - HOIST
      ?auto_865133 - PLACE
      ?auto_865135 - PLACE
      ?auto_865137 - HOIST
      ?auto_865134 - SURFACE
      ?auto_865136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_865132 ?auto_865133 ) ( SURFACE-AT ?auto_865130 ?auto_865133 ) ( CLEAR ?auto_865130 ) ( IS-CRATE ?auto_865131 ) ( not ( = ?auto_865130 ?auto_865131 ) ) ( AVAILABLE ?auto_865132 ) ( ON ?auto_865130 ?auto_865129 ) ( not ( = ?auto_865129 ?auto_865130 ) ) ( not ( = ?auto_865129 ?auto_865131 ) ) ( not ( = ?auto_865135 ?auto_865133 ) ) ( HOIST-AT ?auto_865137 ?auto_865135 ) ( not ( = ?auto_865132 ?auto_865137 ) ) ( AVAILABLE ?auto_865137 ) ( SURFACE-AT ?auto_865131 ?auto_865135 ) ( ON ?auto_865131 ?auto_865134 ) ( CLEAR ?auto_865131 ) ( not ( = ?auto_865130 ?auto_865134 ) ) ( not ( = ?auto_865131 ?auto_865134 ) ) ( not ( = ?auto_865129 ?auto_865134 ) ) ( TRUCK-AT ?auto_865136 ?auto_865133 ) ( ON ?auto_865122 ?auto_865121 ) ( ON ?auto_865123 ?auto_865122 ) ( ON ?auto_865125 ?auto_865123 ) ( ON ?auto_865124 ?auto_865125 ) ( ON ?auto_865126 ?auto_865124 ) ( ON ?auto_865127 ?auto_865126 ) ( ON ?auto_865128 ?auto_865127 ) ( ON ?auto_865129 ?auto_865128 ) ( not ( = ?auto_865121 ?auto_865122 ) ) ( not ( = ?auto_865121 ?auto_865123 ) ) ( not ( = ?auto_865121 ?auto_865125 ) ) ( not ( = ?auto_865121 ?auto_865124 ) ) ( not ( = ?auto_865121 ?auto_865126 ) ) ( not ( = ?auto_865121 ?auto_865127 ) ) ( not ( = ?auto_865121 ?auto_865128 ) ) ( not ( = ?auto_865121 ?auto_865129 ) ) ( not ( = ?auto_865121 ?auto_865130 ) ) ( not ( = ?auto_865121 ?auto_865131 ) ) ( not ( = ?auto_865121 ?auto_865134 ) ) ( not ( = ?auto_865122 ?auto_865123 ) ) ( not ( = ?auto_865122 ?auto_865125 ) ) ( not ( = ?auto_865122 ?auto_865124 ) ) ( not ( = ?auto_865122 ?auto_865126 ) ) ( not ( = ?auto_865122 ?auto_865127 ) ) ( not ( = ?auto_865122 ?auto_865128 ) ) ( not ( = ?auto_865122 ?auto_865129 ) ) ( not ( = ?auto_865122 ?auto_865130 ) ) ( not ( = ?auto_865122 ?auto_865131 ) ) ( not ( = ?auto_865122 ?auto_865134 ) ) ( not ( = ?auto_865123 ?auto_865125 ) ) ( not ( = ?auto_865123 ?auto_865124 ) ) ( not ( = ?auto_865123 ?auto_865126 ) ) ( not ( = ?auto_865123 ?auto_865127 ) ) ( not ( = ?auto_865123 ?auto_865128 ) ) ( not ( = ?auto_865123 ?auto_865129 ) ) ( not ( = ?auto_865123 ?auto_865130 ) ) ( not ( = ?auto_865123 ?auto_865131 ) ) ( not ( = ?auto_865123 ?auto_865134 ) ) ( not ( = ?auto_865125 ?auto_865124 ) ) ( not ( = ?auto_865125 ?auto_865126 ) ) ( not ( = ?auto_865125 ?auto_865127 ) ) ( not ( = ?auto_865125 ?auto_865128 ) ) ( not ( = ?auto_865125 ?auto_865129 ) ) ( not ( = ?auto_865125 ?auto_865130 ) ) ( not ( = ?auto_865125 ?auto_865131 ) ) ( not ( = ?auto_865125 ?auto_865134 ) ) ( not ( = ?auto_865124 ?auto_865126 ) ) ( not ( = ?auto_865124 ?auto_865127 ) ) ( not ( = ?auto_865124 ?auto_865128 ) ) ( not ( = ?auto_865124 ?auto_865129 ) ) ( not ( = ?auto_865124 ?auto_865130 ) ) ( not ( = ?auto_865124 ?auto_865131 ) ) ( not ( = ?auto_865124 ?auto_865134 ) ) ( not ( = ?auto_865126 ?auto_865127 ) ) ( not ( = ?auto_865126 ?auto_865128 ) ) ( not ( = ?auto_865126 ?auto_865129 ) ) ( not ( = ?auto_865126 ?auto_865130 ) ) ( not ( = ?auto_865126 ?auto_865131 ) ) ( not ( = ?auto_865126 ?auto_865134 ) ) ( not ( = ?auto_865127 ?auto_865128 ) ) ( not ( = ?auto_865127 ?auto_865129 ) ) ( not ( = ?auto_865127 ?auto_865130 ) ) ( not ( = ?auto_865127 ?auto_865131 ) ) ( not ( = ?auto_865127 ?auto_865134 ) ) ( not ( = ?auto_865128 ?auto_865129 ) ) ( not ( = ?auto_865128 ?auto_865130 ) ) ( not ( = ?auto_865128 ?auto_865131 ) ) ( not ( = ?auto_865128 ?auto_865134 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_865129 ?auto_865130 ?auto_865131 )
      ( MAKE-10CRATE-VERIFY ?auto_865121 ?auto_865122 ?auto_865123 ?auto_865125 ?auto_865124 ?auto_865126 ?auto_865127 ?auto_865128 ?auto_865129 ?auto_865130 ?auto_865131 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_865247 - SURFACE
      ?auto_865248 - SURFACE
      ?auto_865249 - SURFACE
      ?auto_865251 - SURFACE
      ?auto_865250 - SURFACE
      ?auto_865252 - SURFACE
      ?auto_865253 - SURFACE
      ?auto_865254 - SURFACE
      ?auto_865255 - SURFACE
      ?auto_865256 - SURFACE
      ?auto_865257 - SURFACE
    )
    :vars
    (
      ?auto_865261 - HOIST
      ?auto_865260 - PLACE
      ?auto_865259 - PLACE
      ?auto_865258 - HOIST
      ?auto_865263 - SURFACE
      ?auto_865262 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_865261 ?auto_865260 ) ( IS-CRATE ?auto_865257 ) ( not ( = ?auto_865256 ?auto_865257 ) ) ( not ( = ?auto_865255 ?auto_865256 ) ) ( not ( = ?auto_865255 ?auto_865257 ) ) ( not ( = ?auto_865259 ?auto_865260 ) ) ( HOIST-AT ?auto_865258 ?auto_865259 ) ( not ( = ?auto_865261 ?auto_865258 ) ) ( AVAILABLE ?auto_865258 ) ( SURFACE-AT ?auto_865257 ?auto_865259 ) ( ON ?auto_865257 ?auto_865263 ) ( CLEAR ?auto_865257 ) ( not ( = ?auto_865256 ?auto_865263 ) ) ( not ( = ?auto_865257 ?auto_865263 ) ) ( not ( = ?auto_865255 ?auto_865263 ) ) ( TRUCK-AT ?auto_865262 ?auto_865260 ) ( SURFACE-AT ?auto_865255 ?auto_865260 ) ( CLEAR ?auto_865255 ) ( LIFTING ?auto_865261 ?auto_865256 ) ( IS-CRATE ?auto_865256 ) ( ON ?auto_865248 ?auto_865247 ) ( ON ?auto_865249 ?auto_865248 ) ( ON ?auto_865251 ?auto_865249 ) ( ON ?auto_865250 ?auto_865251 ) ( ON ?auto_865252 ?auto_865250 ) ( ON ?auto_865253 ?auto_865252 ) ( ON ?auto_865254 ?auto_865253 ) ( ON ?auto_865255 ?auto_865254 ) ( not ( = ?auto_865247 ?auto_865248 ) ) ( not ( = ?auto_865247 ?auto_865249 ) ) ( not ( = ?auto_865247 ?auto_865251 ) ) ( not ( = ?auto_865247 ?auto_865250 ) ) ( not ( = ?auto_865247 ?auto_865252 ) ) ( not ( = ?auto_865247 ?auto_865253 ) ) ( not ( = ?auto_865247 ?auto_865254 ) ) ( not ( = ?auto_865247 ?auto_865255 ) ) ( not ( = ?auto_865247 ?auto_865256 ) ) ( not ( = ?auto_865247 ?auto_865257 ) ) ( not ( = ?auto_865247 ?auto_865263 ) ) ( not ( = ?auto_865248 ?auto_865249 ) ) ( not ( = ?auto_865248 ?auto_865251 ) ) ( not ( = ?auto_865248 ?auto_865250 ) ) ( not ( = ?auto_865248 ?auto_865252 ) ) ( not ( = ?auto_865248 ?auto_865253 ) ) ( not ( = ?auto_865248 ?auto_865254 ) ) ( not ( = ?auto_865248 ?auto_865255 ) ) ( not ( = ?auto_865248 ?auto_865256 ) ) ( not ( = ?auto_865248 ?auto_865257 ) ) ( not ( = ?auto_865248 ?auto_865263 ) ) ( not ( = ?auto_865249 ?auto_865251 ) ) ( not ( = ?auto_865249 ?auto_865250 ) ) ( not ( = ?auto_865249 ?auto_865252 ) ) ( not ( = ?auto_865249 ?auto_865253 ) ) ( not ( = ?auto_865249 ?auto_865254 ) ) ( not ( = ?auto_865249 ?auto_865255 ) ) ( not ( = ?auto_865249 ?auto_865256 ) ) ( not ( = ?auto_865249 ?auto_865257 ) ) ( not ( = ?auto_865249 ?auto_865263 ) ) ( not ( = ?auto_865251 ?auto_865250 ) ) ( not ( = ?auto_865251 ?auto_865252 ) ) ( not ( = ?auto_865251 ?auto_865253 ) ) ( not ( = ?auto_865251 ?auto_865254 ) ) ( not ( = ?auto_865251 ?auto_865255 ) ) ( not ( = ?auto_865251 ?auto_865256 ) ) ( not ( = ?auto_865251 ?auto_865257 ) ) ( not ( = ?auto_865251 ?auto_865263 ) ) ( not ( = ?auto_865250 ?auto_865252 ) ) ( not ( = ?auto_865250 ?auto_865253 ) ) ( not ( = ?auto_865250 ?auto_865254 ) ) ( not ( = ?auto_865250 ?auto_865255 ) ) ( not ( = ?auto_865250 ?auto_865256 ) ) ( not ( = ?auto_865250 ?auto_865257 ) ) ( not ( = ?auto_865250 ?auto_865263 ) ) ( not ( = ?auto_865252 ?auto_865253 ) ) ( not ( = ?auto_865252 ?auto_865254 ) ) ( not ( = ?auto_865252 ?auto_865255 ) ) ( not ( = ?auto_865252 ?auto_865256 ) ) ( not ( = ?auto_865252 ?auto_865257 ) ) ( not ( = ?auto_865252 ?auto_865263 ) ) ( not ( = ?auto_865253 ?auto_865254 ) ) ( not ( = ?auto_865253 ?auto_865255 ) ) ( not ( = ?auto_865253 ?auto_865256 ) ) ( not ( = ?auto_865253 ?auto_865257 ) ) ( not ( = ?auto_865253 ?auto_865263 ) ) ( not ( = ?auto_865254 ?auto_865255 ) ) ( not ( = ?auto_865254 ?auto_865256 ) ) ( not ( = ?auto_865254 ?auto_865257 ) ) ( not ( = ?auto_865254 ?auto_865263 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_865255 ?auto_865256 ?auto_865257 )
      ( MAKE-10CRATE-VERIFY ?auto_865247 ?auto_865248 ?auto_865249 ?auto_865251 ?auto_865250 ?auto_865252 ?auto_865253 ?auto_865254 ?auto_865255 ?auto_865256 ?auto_865257 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_865373 - SURFACE
      ?auto_865374 - SURFACE
      ?auto_865375 - SURFACE
      ?auto_865377 - SURFACE
      ?auto_865376 - SURFACE
      ?auto_865378 - SURFACE
      ?auto_865379 - SURFACE
      ?auto_865380 - SURFACE
      ?auto_865381 - SURFACE
      ?auto_865382 - SURFACE
      ?auto_865383 - SURFACE
    )
    :vars
    (
      ?auto_865384 - HOIST
      ?auto_865385 - PLACE
      ?auto_865388 - PLACE
      ?auto_865387 - HOIST
      ?auto_865389 - SURFACE
      ?auto_865386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_865384 ?auto_865385 ) ( IS-CRATE ?auto_865383 ) ( not ( = ?auto_865382 ?auto_865383 ) ) ( not ( = ?auto_865381 ?auto_865382 ) ) ( not ( = ?auto_865381 ?auto_865383 ) ) ( not ( = ?auto_865388 ?auto_865385 ) ) ( HOIST-AT ?auto_865387 ?auto_865388 ) ( not ( = ?auto_865384 ?auto_865387 ) ) ( AVAILABLE ?auto_865387 ) ( SURFACE-AT ?auto_865383 ?auto_865388 ) ( ON ?auto_865383 ?auto_865389 ) ( CLEAR ?auto_865383 ) ( not ( = ?auto_865382 ?auto_865389 ) ) ( not ( = ?auto_865383 ?auto_865389 ) ) ( not ( = ?auto_865381 ?auto_865389 ) ) ( TRUCK-AT ?auto_865386 ?auto_865385 ) ( SURFACE-AT ?auto_865381 ?auto_865385 ) ( CLEAR ?auto_865381 ) ( IS-CRATE ?auto_865382 ) ( AVAILABLE ?auto_865384 ) ( IN ?auto_865382 ?auto_865386 ) ( ON ?auto_865374 ?auto_865373 ) ( ON ?auto_865375 ?auto_865374 ) ( ON ?auto_865377 ?auto_865375 ) ( ON ?auto_865376 ?auto_865377 ) ( ON ?auto_865378 ?auto_865376 ) ( ON ?auto_865379 ?auto_865378 ) ( ON ?auto_865380 ?auto_865379 ) ( ON ?auto_865381 ?auto_865380 ) ( not ( = ?auto_865373 ?auto_865374 ) ) ( not ( = ?auto_865373 ?auto_865375 ) ) ( not ( = ?auto_865373 ?auto_865377 ) ) ( not ( = ?auto_865373 ?auto_865376 ) ) ( not ( = ?auto_865373 ?auto_865378 ) ) ( not ( = ?auto_865373 ?auto_865379 ) ) ( not ( = ?auto_865373 ?auto_865380 ) ) ( not ( = ?auto_865373 ?auto_865381 ) ) ( not ( = ?auto_865373 ?auto_865382 ) ) ( not ( = ?auto_865373 ?auto_865383 ) ) ( not ( = ?auto_865373 ?auto_865389 ) ) ( not ( = ?auto_865374 ?auto_865375 ) ) ( not ( = ?auto_865374 ?auto_865377 ) ) ( not ( = ?auto_865374 ?auto_865376 ) ) ( not ( = ?auto_865374 ?auto_865378 ) ) ( not ( = ?auto_865374 ?auto_865379 ) ) ( not ( = ?auto_865374 ?auto_865380 ) ) ( not ( = ?auto_865374 ?auto_865381 ) ) ( not ( = ?auto_865374 ?auto_865382 ) ) ( not ( = ?auto_865374 ?auto_865383 ) ) ( not ( = ?auto_865374 ?auto_865389 ) ) ( not ( = ?auto_865375 ?auto_865377 ) ) ( not ( = ?auto_865375 ?auto_865376 ) ) ( not ( = ?auto_865375 ?auto_865378 ) ) ( not ( = ?auto_865375 ?auto_865379 ) ) ( not ( = ?auto_865375 ?auto_865380 ) ) ( not ( = ?auto_865375 ?auto_865381 ) ) ( not ( = ?auto_865375 ?auto_865382 ) ) ( not ( = ?auto_865375 ?auto_865383 ) ) ( not ( = ?auto_865375 ?auto_865389 ) ) ( not ( = ?auto_865377 ?auto_865376 ) ) ( not ( = ?auto_865377 ?auto_865378 ) ) ( not ( = ?auto_865377 ?auto_865379 ) ) ( not ( = ?auto_865377 ?auto_865380 ) ) ( not ( = ?auto_865377 ?auto_865381 ) ) ( not ( = ?auto_865377 ?auto_865382 ) ) ( not ( = ?auto_865377 ?auto_865383 ) ) ( not ( = ?auto_865377 ?auto_865389 ) ) ( not ( = ?auto_865376 ?auto_865378 ) ) ( not ( = ?auto_865376 ?auto_865379 ) ) ( not ( = ?auto_865376 ?auto_865380 ) ) ( not ( = ?auto_865376 ?auto_865381 ) ) ( not ( = ?auto_865376 ?auto_865382 ) ) ( not ( = ?auto_865376 ?auto_865383 ) ) ( not ( = ?auto_865376 ?auto_865389 ) ) ( not ( = ?auto_865378 ?auto_865379 ) ) ( not ( = ?auto_865378 ?auto_865380 ) ) ( not ( = ?auto_865378 ?auto_865381 ) ) ( not ( = ?auto_865378 ?auto_865382 ) ) ( not ( = ?auto_865378 ?auto_865383 ) ) ( not ( = ?auto_865378 ?auto_865389 ) ) ( not ( = ?auto_865379 ?auto_865380 ) ) ( not ( = ?auto_865379 ?auto_865381 ) ) ( not ( = ?auto_865379 ?auto_865382 ) ) ( not ( = ?auto_865379 ?auto_865383 ) ) ( not ( = ?auto_865379 ?auto_865389 ) ) ( not ( = ?auto_865380 ?auto_865381 ) ) ( not ( = ?auto_865380 ?auto_865382 ) ) ( not ( = ?auto_865380 ?auto_865383 ) ) ( not ( = ?auto_865380 ?auto_865389 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_865381 ?auto_865382 ?auto_865383 )
      ( MAKE-10CRATE-VERIFY ?auto_865373 ?auto_865374 ?auto_865375 ?auto_865377 ?auto_865376 ?auto_865378 ?auto_865379 ?auto_865380 ?auto_865381 ?auto_865382 ?auto_865383 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_872638 - SURFACE
      ?auto_872639 - SURFACE
      ?auto_872640 - SURFACE
      ?auto_872642 - SURFACE
      ?auto_872641 - SURFACE
      ?auto_872643 - SURFACE
      ?auto_872644 - SURFACE
      ?auto_872645 - SURFACE
      ?auto_872646 - SURFACE
      ?auto_872647 - SURFACE
      ?auto_872648 - SURFACE
      ?auto_872649 - SURFACE
    )
    :vars
    (
      ?auto_872650 - HOIST
      ?auto_872651 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_872650 ?auto_872651 ) ( SURFACE-AT ?auto_872648 ?auto_872651 ) ( CLEAR ?auto_872648 ) ( LIFTING ?auto_872650 ?auto_872649 ) ( IS-CRATE ?auto_872649 ) ( not ( = ?auto_872648 ?auto_872649 ) ) ( ON ?auto_872639 ?auto_872638 ) ( ON ?auto_872640 ?auto_872639 ) ( ON ?auto_872642 ?auto_872640 ) ( ON ?auto_872641 ?auto_872642 ) ( ON ?auto_872643 ?auto_872641 ) ( ON ?auto_872644 ?auto_872643 ) ( ON ?auto_872645 ?auto_872644 ) ( ON ?auto_872646 ?auto_872645 ) ( ON ?auto_872647 ?auto_872646 ) ( ON ?auto_872648 ?auto_872647 ) ( not ( = ?auto_872638 ?auto_872639 ) ) ( not ( = ?auto_872638 ?auto_872640 ) ) ( not ( = ?auto_872638 ?auto_872642 ) ) ( not ( = ?auto_872638 ?auto_872641 ) ) ( not ( = ?auto_872638 ?auto_872643 ) ) ( not ( = ?auto_872638 ?auto_872644 ) ) ( not ( = ?auto_872638 ?auto_872645 ) ) ( not ( = ?auto_872638 ?auto_872646 ) ) ( not ( = ?auto_872638 ?auto_872647 ) ) ( not ( = ?auto_872638 ?auto_872648 ) ) ( not ( = ?auto_872638 ?auto_872649 ) ) ( not ( = ?auto_872639 ?auto_872640 ) ) ( not ( = ?auto_872639 ?auto_872642 ) ) ( not ( = ?auto_872639 ?auto_872641 ) ) ( not ( = ?auto_872639 ?auto_872643 ) ) ( not ( = ?auto_872639 ?auto_872644 ) ) ( not ( = ?auto_872639 ?auto_872645 ) ) ( not ( = ?auto_872639 ?auto_872646 ) ) ( not ( = ?auto_872639 ?auto_872647 ) ) ( not ( = ?auto_872639 ?auto_872648 ) ) ( not ( = ?auto_872639 ?auto_872649 ) ) ( not ( = ?auto_872640 ?auto_872642 ) ) ( not ( = ?auto_872640 ?auto_872641 ) ) ( not ( = ?auto_872640 ?auto_872643 ) ) ( not ( = ?auto_872640 ?auto_872644 ) ) ( not ( = ?auto_872640 ?auto_872645 ) ) ( not ( = ?auto_872640 ?auto_872646 ) ) ( not ( = ?auto_872640 ?auto_872647 ) ) ( not ( = ?auto_872640 ?auto_872648 ) ) ( not ( = ?auto_872640 ?auto_872649 ) ) ( not ( = ?auto_872642 ?auto_872641 ) ) ( not ( = ?auto_872642 ?auto_872643 ) ) ( not ( = ?auto_872642 ?auto_872644 ) ) ( not ( = ?auto_872642 ?auto_872645 ) ) ( not ( = ?auto_872642 ?auto_872646 ) ) ( not ( = ?auto_872642 ?auto_872647 ) ) ( not ( = ?auto_872642 ?auto_872648 ) ) ( not ( = ?auto_872642 ?auto_872649 ) ) ( not ( = ?auto_872641 ?auto_872643 ) ) ( not ( = ?auto_872641 ?auto_872644 ) ) ( not ( = ?auto_872641 ?auto_872645 ) ) ( not ( = ?auto_872641 ?auto_872646 ) ) ( not ( = ?auto_872641 ?auto_872647 ) ) ( not ( = ?auto_872641 ?auto_872648 ) ) ( not ( = ?auto_872641 ?auto_872649 ) ) ( not ( = ?auto_872643 ?auto_872644 ) ) ( not ( = ?auto_872643 ?auto_872645 ) ) ( not ( = ?auto_872643 ?auto_872646 ) ) ( not ( = ?auto_872643 ?auto_872647 ) ) ( not ( = ?auto_872643 ?auto_872648 ) ) ( not ( = ?auto_872643 ?auto_872649 ) ) ( not ( = ?auto_872644 ?auto_872645 ) ) ( not ( = ?auto_872644 ?auto_872646 ) ) ( not ( = ?auto_872644 ?auto_872647 ) ) ( not ( = ?auto_872644 ?auto_872648 ) ) ( not ( = ?auto_872644 ?auto_872649 ) ) ( not ( = ?auto_872645 ?auto_872646 ) ) ( not ( = ?auto_872645 ?auto_872647 ) ) ( not ( = ?auto_872645 ?auto_872648 ) ) ( not ( = ?auto_872645 ?auto_872649 ) ) ( not ( = ?auto_872646 ?auto_872647 ) ) ( not ( = ?auto_872646 ?auto_872648 ) ) ( not ( = ?auto_872646 ?auto_872649 ) ) ( not ( = ?auto_872647 ?auto_872648 ) ) ( not ( = ?auto_872647 ?auto_872649 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_872648 ?auto_872649 )
      ( MAKE-11CRATE-VERIFY ?auto_872638 ?auto_872639 ?auto_872640 ?auto_872642 ?auto_872641 ?auto_872643 ?auto_872644 ?auto_872645 ?auto_872646 ?auto_872647 ?auto_872648 ?auto_872649 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_872747 - SURFACE
      ?auto_872748 - SURFACE
      ?auto_872749 - SURFACE
      ?auto_872751 - SURFACE
      ?auto_872750 - SURFACE
      ?auto_872752 - SURFACE
      ?auto_872753 - SURFACE
      ?auto_872754 - SURFACE
      ?auto_872755 - SURFACE
      ?auto_872756 - SURFACE
      ?auto_872757 - SURFACE
      ?auto_872758 - SURFACE
    )
    :vars
    (
      ?auto_872759 - HOIST
      ?auto_872760 - PLACE
      ?auto_872761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_872759 ?auto_872760 ) ( SURFACE-AT ?auto_872757 ?auto_872760 ) ( CLEAR ?auto_872757 ) ( IS-CRATE ?auto_872758 ) ( not ( = ?auto_872757 ?auto_872758 ) ) ( TRUCK-AT ?auto_872761 ?auto_872760 ) ( AVAILABLE ?auto_872759 ) ( IN ?auto_872758 ?auto_872761 ) ( ON ?auto_872757 ?auto_872756 ) ( not ( = ?auto_872756 ?auto_872757 ) ) ( not ( = ?auto_872756 ?auto_872758 ) ) ( ON ?auto_872748 ?auto_872747 ) ( ON ?auto_872749 ?auto_872748 ) ( ON ?auto_872751 ?auto_872749 ) ( ON ?auto_872750 ?auto_872751 ) ( ON ?auto_872752 ?auto_872750 ) ( ON ?auto_872753 ?auto_872752 ) ( ON ?auto_872754 ?auto_872753 ) ( ON ?auto_872755 ?auto_872754 ) ( ON ?auto_872756 ?auto_872755 ) ( not ( = ?auto_872747 ?auto_872748 ) ) ( not ( = ?auto_872747 ?auto_872749 ) ) ( not ( = ?auto_872747 ?auto_872751 ) ) ( not ( = ?auto_872747 ?auto_872750 ) ) ( not ( = ?auto_872747 ?auto_872752 ) ) ( not ( = ?auto_872747 ?auto_872753 ) ) ( not ( = ?auto_872747 ?auto_872754 ) ) ( not ( = ?auto_872747 ?auto_872755 ) ) ( not ( = ?auto_872747 ?auto_872756 ) ) ( not ( = ?auto_872747 ?auto_872757 ) ) ( not ( = ?auto_872747 ?auto_872758 ) ) ( not ( = ?auto_872748 ?auto_872749 ) ) ( not ( = ?auto_872748 ?auto_872751 ) ) ( not ( = ?auto_872748 ?auto_872750 ) ) ( not ( = ?auto_872748 ?auto_872752 ) ) ( not ( = ?auto_872748 ?auto_872753 ) ) ( not ( = ?auto_872748 ?auto_872754 ) ) ( not ( = ?auto_872748 ?auto_872755 ) ) ( not ( = ?auto_872748 ?auto_872756 ) ) ( not ( = ?auto_872748 ?auto_872757 ) ) ( not ( = ?auto_872748 ?auto_872758 ) ) ( not ( = ?auto_872749 ?auto_872751 ) ) ( not ( = ?auto_872749 ?auto_872750 ) ) ( not ( = ?auto_872749 ?auto_872752 ) ) ( not ( = ?auto_872749 ?auto_872753 ) ) ( not ( = ?auto_872749 ?auto_872754 ) ) ( not ( = ?auto_872749 ?auto_872755 ) ) ( not ( = ?auto_872749 ?auto_872756 ) ) ( not ( = ?auto_872749 ?auto_872757 ) ) ( not ( = ?auto_872749 ?auto_872758 ) ) ( not ( = ?auto_872751 ?auto_872750 ) ) ( not ( = ?auto_872751 ?auto_872752 ) ) ( not ( = ?auto_872751 ?auto_872753 ) ) ( not ( = ?auto_872751 ?auto_872754 ) ) ( not ( = ?auto_872751 ?auto_872755 ) ) ( not ( = ?auto_872751 ?auto_872756 ) ) ( not ( = ?auto_872751 ?auto_872757 ) ) ( not ( = ?auto_872751 ?auto_872758 ) ) ( not ( = ?auto_872750 ?auto_872752 ) ) ( not ( = ?auto_872750 ?auto_872753 ) ) ( not ( = ?auto_872750 ?auto_872754 ) ) ( not ( = ?auto_872750 ?auto_872755 ) ) ( not ( = ?auto_872750 ?auto_872756 ) ) ( not ( = ?auto_872750 ?auto_872757 ) ) ( not ( = ?auto_872750 ?auto_872758 ) ) ( not ( = ?auto_872752 ?auto_872753 ) ) ( not ( = ?auto_872752 ?auto_872754 ) ) ( not ( = ?auto_872752 ?auto_872755 ) ) ( not ( = ?auto_872752 ?auto_872756 ) ) ( not ( = ?auto_872752 ?auto_872757 ) ) ( not ( = ?auto_872752 ?auto_872758 ) ) ( not ( = ?auto_872753 ?auto_872754 ) ) ( not ( = ?auto_872753 ?auto_872755 ) ) ( not ( = ?auto_872753 ?auto_872756 ) ) ( not ( = ?auto_872753 ?auto_872757 ) ) ( not ( = ?auto_872753 ?auto_872758 ) ) ( not ( = ?auto_872754 ?auto_872755 ) ) ( not ( = ?auto_872754 ?auto_872756 ) ) ( not ( = ?auto_872754 ?auto_872757 ) ) ( not ( = ?auto_872754 ?auto_872758 ) ) ( not ( = ?auto_872755 ?auto_872756 ) ) ( not ( = ?auto_872755 ?auto_872757 ) ) ( not ( = ?auto_872755 ?auto_872758 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_872756 ?auto_872757 ?auto_872758 )
      ( MAKE-11CRATE-VERIFY ?auto_872747 ?auto_872748 ?auto_872749 ?auto_872751 ?auto_872750 ?auto_872752 ?auto_872753 ?auto_872754 ?auto_872755 ?auto_872756 ?auto_872757 ?auto_872758 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_872868 - SURFACE
      ?auto_872869 - SURFACE
      ?auto_872870 - SURFACE
      ?auto_872872 - SURFACE
      ?auto_872871 - SURFACE
      ?auto_872873 - SURFACE
      ?auto_872874 - SURFACE
      ?auto_872875 - SURFACE
      ?auto_872876 - SURFACE
      ?auto_872877 - SURFACE
      ?auto_872878 - SURFACE
      ?auto_872879 - SURFACE
    )
    :vars
    (
      ?auto_872883 - HOIST
      ?auto_872881 - PLACE
      ?auto_872882 - TRUCK
      ?auto_872880 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_872883 ?auto_872881 ) ( SURFACE-AT ?auto_872878 ?auto_872881 ) ( CLEAR ?auto_872878 ) ( IS-CRATE ?auto_872879 ) ( not ( = ?auto_872878 ?auto_872879 ) ) ( AVAILABLE ?auto_872883 ) ( IN ?auto_872879 ?auto_872882 ) ( ON ?auto_872878 ?auto_872877 ) ( not ( = ?auto_872877 ?auto_872878 ) ) ( not ( = ?auto_872877 ?auto_872879 ) ) ( TRUCK-AT ?auto_872882 ?auto_872880 ) ( not ( = ?auto_872880 ?auto_872881 ) ) ( ON ?auto_872869 ?auto_872868 ) ( ON ?auto_872870 ?auto_872869 ) ( ON ?auto_872872 ?auto_872870 ) ( ON ?auto_872871 ?auto_872872 ) ( ON ?auto_872873 ?auto_872871 ) ( ON ?auto_872874 ?auto_872873 ) ( ON ?auto_872875 ?auto_872874 ) ( ON ?auto_872876 ?auto_872875 ) ( ON ?auto_872877 ?auto_872876 ) ( not ( = ?auto_872868 ?auto_872869 ) ) ( not ( = ?auto_872868 ?auto_872870 ) ) ( not ( = ?auto_872868 ?auto_872872 ) ) ( not ( = ?auto_872868 ?auto_872871 ) ) ( not ( = ?auto_872868 ?auto_872873 ) ) ( not ( = ?auto_872868 ?auto_872874 ) ) ( not ( = ?auto_872868 ?auto_872875 ) ) ( not ( = ?auto_872868 ?auto_872876 ) ) ( not ( = ?auto_872868 ?auto_872877 ) ) ( not ( = ?auto_872868 ?auto_872878 ) ) ( not ( = ?auto_872868 ?auto_872879 ) ) ( not ( = ?auto_872869 ?auto_872870 ) ) ( not ( = ?auto_872869 ?auto_872872 ) ) ( not ( = ?auto_872869 ?auto_872871 ) ) ( not ( = ?auto_872869 ?auto_872873 ) ) ( not ( = ?auto_872869 ?auto_872874 ) ) ( not ( = ?auto_872869 ?auto_872875 ) ) ( not ( = ?auto_872869 ?auto_872876 ) ) ( not ( = ?auto_872869 ?auto_872877 ) ) ( not ( = ?auto_872869 ?auto_872878 ) ) ( not ( = ?auto_872869 ?auto_872879 ) ) ( not ( = ?auto_872870 ?auto_872872 ) ) ( not ( = ?auto_872870 ?auto_872871 ) ) ( not ( = ?auto_872870 ?auto_872873 ) ) ( not ( = ?auto_872870 ?auto_872874 ) ) ( not ( = ?auto_872870 ?auto_872875 ) ) ( not ( = ?auto_872870 ?auto_872876 ) ) ( not ( = ?auto_872870 ?auto_872877 ) ) ( not ( = ?auto_872870 ?auto_872878 ) ) ( not ( = ?auto_872870 ?auto_872879 ) ) ( not ( = ?auto_872872 ?auto_872871 ) ) ( not ( = ?auto_872872 ?auto_872873 ) ) ( not ( = ?auto_872872 ?auto_872874 ) ) ( not ( = ?auto_872872 ?auto_872875 ) ) ( not ( = ?auto_872872 ?auto_872876 ) ) ( not ( = ?auto_872872 ?auto_872877 ) ) ( not ( = ?auto_872872 ?auto_872878 ) ) ( not ( = ?auto_872872 ?auto_872879 ) ) ( not ( = ?auto_872871 ?auto_872873 ) ) ( not ( = ?auto_872871 ?auto_872874 ) ) ( not ( = ?auto_872871 ?auto_872875 ) ) ( not ( = ?auto_872871 ?auto_872876 ) ) ( not ( = ?auto_872871 ?auto_872877 ) ) ( not ( = ?auto_872871 ?auto_872878 ) ) ( not ( = ?auto_872871 ?auto_872879 ) ) ( not ( = ?auto_872873 ?auto_872874 ) ) ( not ( = ?auto_872873 ?auto_872875 ) ) ( not ( = ?auto_872873 ?auto_872876 ) ) ( not ( = ?auto_872873 ?auto_872877 ) ) ( not ( = ?auto_872873 ?auto_872878 ) ) ( not ( = ?auto_872873 ?auto_872879 ) ) ( not ( = ?auto_872874 ?auto_872875 ) ) ( not ( = ?auto_872874 ?auto_872876 ) ) ( not ( = ?auto_872874 ?auto_872877 ) ) ( not ( = ?auto_872874 ?auto_872878 ) ) ( not ( = ?auto_872874 ?auto_872879 ) ) ( not ( = ?auto_872875 ?auto_872876 ) ) ( not ( = ?auto_872875 ?auto_872877 ) ) ( not ( = ?auto_872875 ?auto_872878 ) ) ( not ( = ?auto_872875 ?auto_872879 ) ) ( not ( = ?auto_872876 ?auto_872877 ) ) ( not ( = ?auto_872876 ?auto_872878 ) ) ( not ( = ?auto_872876 ?auto_872879 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_872877 ?auto_872878 ?auto_872879 )
      ( MAKE-11CRATE-VERIFY ?auto_872868 ?auto_872869 ?auto_872870 ?auto_872872 ?auto_872871 ?auto_872873 ?auto_872874 ?auto_872875 ?auto_872876 ?auto_872877 ?auto_872878 ?auto_872879 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_873000 - SURFACE
      ?auto_873001 - SURFACE
      ?auto_873002 - SURFACE
      ?auto_873004 - SURFACE
      ?auto_873003 - SURFACE
      ?auto_873005 - SURFACE
      ?auto_873006 - SURFACE
      ?auto_873007 - SURFACE
      ?auto_873008 - SURFACE
      ?auto_873009 - SURFACE
      ?auto_873010 - SURFACE
      ?auto_873011 - SURFACE
    )
    :vars
    (
      ?auto_873013 - HOIST
      ?auto_873015 - PLACE
      ?auto_873012 - TRUCK
      ?auto_873014 - PLACE
      ?auto_873016 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_873013 ?auto_873015 ) ( SURFACE-AT ?auto_873010 ?auto_873015 ) ( CLEAR ?auto_873010 ) ( IS-CRATE ?auto_873011 ) ( not ( = ?auto_873010 ?auto_873011 ) ) ( AVAILABLE ?auto_873013 ) ( ON ?auto_873010 ?auto_873009 ) ( not ( = ?auto_873009 ?auto_873010 ) ) ( not ( = ?auto_873009 ?auto_873011 ) ) ( TRUCK-AT ?auto_873012 ?auto_873014 ) ( not ( = ?auto_873014 ?auto_873015 ) ) ( HOIST-AT ?auto_873016 ?auto_873014 ) ( LIFTING ?auto_873016 ?auto_873011 ) ( not ( = ?auto_873013 ?auto_873016 ) ) ( ON ?auto_873001 ?auto_873000 ) ( ON ?auto_873002 ?auto_873001 ) ( ON ?auto_873004 ?auto_873002 ) ( ON ?auto_873003 ?auto_873004 ) ( ON ?auto_873005 ?auto_873003 ) ( ON ?auto_873006 ?auto_873005 ) ( ON ?auto_873007 ?auto_873006 ) ( ON ?auto_873008 ?auto_873007 ) ( ON ?auto_873009 ?auto_873008 ) ( not ( = ?auto_873000 ?auto_873001 ) ) ( not ( = ?auto_873000 ?auto_873002 ) ) ( not ( = ?auto_873000 ?auto_873004 ) ) ( not ( = ?auto_873000 ?auto_873003 ) ) ( not ( = ?auto_873000 ?auto_873005 ) ) ( not ( = ?auto_873000 ?auto_873006 ) ) ( not ( = ?auto_873000 ?auto_873007 ) ) ( not ( = ?auto_873000 ?auto_873008 ) ) ( not ( = ?auto_873000 ?auto_873009 ) ) ( not ( = ?auto_873000 ?auto_873010 ) ) ( not ( = ?auto_873000 ?auto_873011 ) ) ( not ( = ?auto_873001 ?auto_873002 ) ) ( not ( = ?auto_873001 ?auto_873004 ) ) ( not ( = ?auto_873001 ?auto_873003 ) ) ( not ( = ?auto_873001 ?auto_873005 ) ) ( not ( = ?auto_873001 ?auto_873006 ) ) ( not ( = ?auto_873001 ?auto_873007 ) ) ( not ( = ?auto_873001 ?auto_873008 ) ) ( not ( = ?auto_873001 ?auto_873009 ) ) ( not ( = ?auto_873001 ?auto_873010 ) ) ( not ( = ?auto_873001 ?auto_873011 ) ) ( not ( = ?auto_873002 ?auto_873004 ) ) ( not ( = ?auto_873002 ?auto_873003 ) ) ( not ( = ?auto_873002 ?auto_873005 ) ) ( not ( = ?auto_873002 ?auto_873006 ) ) ( not ( = ?auto_873002 ?auto_873007 ) ) ( not ( = ?auto_873002 ?auto_873008 ) ) ( not ( = ?auto_873002 ?auto_873009 ) ) ( not ( = ?auto_873002 ?auto_873010 ) ) ( not ( = ?auto_873002 ?auto_873011 ) ) ( not ( = ?auto_873004 ?auto_873003 ) ) ( not ( = ?auto_873004 ?auto_873005 ) ) ( not ( = ?auto_873004 ?auto_873006 ) ) ( not ( = ?auto_873004 ?auto_873007 ) ) ( not ( = ?auto_873004 ?auto_873008 ) ) ( not ( = ?auto_873004 ?auto_873009 ) ) ( not ( = ?auto_873004 ?auto_873010 ) ) ( not ( = ?auto_873004 ?auto_873011 ) ) ( not ( = ?auto_873003 ?auto_873005 ) ) ( not ( = ?auto_873003 ?auto_873006 ) ) ( not ( = ?auto_873003 ?auto_873007 ) ) ( not ( = ?auto_873003 ?auto_873008 ) ) ( not ( = ?auto_873003 ?auto_873009 ) ) ( not ( = ?auto_873003 ?auto_873010 ) ) ( not ( = ?auto_873003 ?auto_873011 ) ) ( not ( = ?auto_873005 ?auto_873006 ) ) ( not ( = ?auto_873005 ?auto_873007 ) ) ( not ( = ?auto_873005 ?auto_873008 ) ) ( not ( = ?auto_873005 ?auto_873009 ) ) ( not ( = ?auto_873005 ?auto_873010 ) ) ( not ( = ?auto_873005 ?auto_873011 ) ) ( not ( = ?auto_873006 ?auto_873007 ) ) ( not ( = ?auto_873006 ?auto_873008 ) ) ( not ( = ?auto_873006 ?auto_873009 ) ) ( not ( = ?auto_873006 ?auto_873010 ) ) ( not ( = ?auto_873006 ?auto_873011 ) ) ( not ( = ?auto_873007 ?auto_873008 ) ) ( not ( = ?auto_873007 ?auto_873009 ) ) ( not ( = ?auto_873007 ?auto_873010 ) ) ( not ( = ?auto_873007 ?auto_873011 ) ) ( not ( = ?auto_873008 ?auto_873009 ) ) ( not ( = ?auto_873008 ?auto_873010 ) ) ( not ( = ?auto_873008 ?auto_873011 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_873009 ?auto_873010 ?auto_873011 )
      ( MAKE-11CRATE-VERIFY ?auto_873000 ?auto_873001 ?auto_873002 ?auto_873004 ?auto_873003 ?auto_873005 ?auto_873006 ?auto_873007 ?auto_873008 ?auto_873009 ?auto_873010 ?auto_873011 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_873143 - SURFACE
      ?auto_873144 - SURFACE
      ?auto_873145 - SURFACE
      ?auto_873147 - SURFACE
      ?auto_873146 - SURFACE
      ?auto_873148 - SURFACE
      ?auto_873149 - SURFACE
      ?auto_873150 - SURFACE
      ?auto_873151 - SURFACE
      ?auto_873152 - SURFACE
      ?auto_873153 - SURFACE
      ?auto_873154 - SURFACE
    )
    :vars
    (
      ?auto_873157 - HOIST
      ?auto_873159 - PLACE
      ?auto_873158 - TRUCK
      ?auto_873155 - PLACE
      ?auto_873156 - HOIST
      ?auto_873160 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_873157 ?auto_873159 ) ( SURFACE-AT ?auto_873153 ?auto_873159 ) ( CLEAR ?auto_873153 ) ( IS-CRATE ?auto_873154 ) ( not ( = ?auto_873153 ?auto_873154 ) ) ( AVAILABLE ?auto_873157 ) ( ON ?auto_873153 ?auto_873152 ) ( not ( = ?auto_873152 ?auto_873153 ) ) ( not ( = ?auto_873152 ?auto_873154 ) ) ( TRUCK-AT ?auto_873158 ?auto_873155 ) ( not ( = ?auto_873155 ?auto_873159 ) ) ( HOIST-AT ?auto_873156 ?auto_873155 ) ( not ( = ?auto_873157 ?auto_873156 ) ) ( AVAILABLE ?auto_873156 ) ( SURFACE-AT ?auto_873154 ?auto_873155 ) ( ON ?auto_873154 ?auto_873160 ) ( CLEAR ?auto_873154 ) ( not ( = ?auto_873153 ?auto_873160 ) ) ( not ( = ?auto_873154 ?auto_873160 ) ) ( not ( = ?auto_873152 ?auto_873160 ) ) ( ON ?auto_873144 ?auto_873143 ) ( ON ?auto_873145 ?auto_873144 ) ( ON ?auto_873147 ?auto_873145 ) ( ON ?auto_873146 ?auto_873147 ) ( ON ?auto_873148 ?auto_873146 ) ( ON ?auto_873149 ?auto_873148 ) ( ON ?auto_873150 ?auto_873149 ) ( ON ?auto_873151 ?auto_873150 ) ( ON ?auto_873152 ?auto_873151 ) ( not ( = ?auto_873143 ?auto_873144 ) ) ( not ( = ?auto_873143 ?auto_873145 ) ) ( not ( = ?auto_873143 ?auto_873147 ) ) ( not ( = ?auto_873143 ?auto_873146 ) ) ( not ( = ?auto_873143 ?auto_873148 ) ) ( not ( = ?auto_873143 ?auto_873149 ) ) ( not ( = ?auto_873143 ?auto_873150 ) ) ( not ( = ?auto_873143 ?auto_873151 ) ) ( not ( = ?auto_873143 ?auto_873152 ) ) ( not ( = ?auto_873143 ?auto_873153 ) ) ( not ( = ?auto_873143 ?auto_873154 ) ) ( not ( = ?auto_873143 ?auto_873160 ) ) ( not ( = ?auto_873144 ?auto_873145 ) ) ( not ( = ?auto_873144 ?auto_873147 ) ) ( not ( = ?auto_873144 ?auto_873146 ) ) ( not ( = ?auto_873144 ?auto_873148 ) ) ( not ( = ?auto_873144 ?auto_873149 ) ) ( not ( = ?auto_873144 ?auto_873150 ) ) ( not ( = ?auto_873144 ?auto_873151 ) ) ( not ( = ?auto_873144 ?auto_873152 ) ) ( not ( = ?auto_873144 ?auto_873153 ) ) ( not ( = ?auto_873144 ?auto_873154 ) ) ( not ( = ?auto_873144 ?auto_873160 ) ) ( not ( = ?auto_873145 ?auto_873147 ) ) ( not ( = ?auto_873145 ?auto_873146 ) ) ( not ( = ?auto_873145 ?auto_873148 ) ) ( not ( = ?auto_873145 ?auto_873149 ) ) ( not ( = ?auto_873145 ?auto_873150 ) ) ( not ( = ?auto_873145 ?auto_873151 ) ) ( not ( = ?auto_873145 ?auto_873152 ) ) ( not ( = ?auto_873145 ?auto_873153 ) ) ( not ( = ?auto_873145 ?auto_873154 ) ) ( not ( = ?auto_873145 ?auto_873160 ) ) ( not ( = ?auto_873147 ?auto_873146 ) ) ( not ( = ?auto_873147 ?auto_873148 ) ) ( not ( = ?auto_873147 ?auto_873149 ) ) ( not ( = ?auto_873147 ?auto_873150 ) ) ( not ( = ?auto_873147 ?auto_873151 ) ) ( not ( = ?auto_873147 ?auto_873152 ) ) ( not ( = ?auto_873147 ?auto_873153 ) ) ( not ( = ?auto_873147 ?auto_873154 ) ) ( not ( = ?auto_873147 ?auto_873160 ) ) ( not ( = ?auto_873146 ?auto_873148 ) ) ( not ( = ?auto_873146 ?auto_873149 ) ) ( not ( = ?auto_873146 ?auto_873150 ) ) ( not ( = ?auto_873146 ?auto_873151 ) ) ( not ( = ?auto_873146 ?auto_873152 ) ) ( not ( = ?auto_873146 ?auto_873153 ) ) ( not ( = ?auto_873146 ?auto_873154 ) ) ( not ( = ?auto_873146 ?auto_873160 ) ) ( not ( = ?auto_873148 ?auto_873149 ) ) ( not ( = ?auto_873148 ?auto_873150 ) ) ( not ( = ?auto_873148 ?auto_873151 ) ) ( not ( = ?auto_873148 ?auto_873152 ) ) ( not ( = ?auto_873148 ?auto_873153 ) ) ( not ( = ?auto_873148 ?auto_873154 ) ) ( not ( = ?auto_873148 ?auto_873160 ) ) ( not ( = ?auto_873149 ?auto_873150 ) ) ( not ( = ?auto_873149 ?auto_873151 ) ) ( not ( = ?auto_873149 ?auto_873152 ) ) ( not ( = ?auto_873149 ?auto_873153 ) ) ( not ( = ?auto_873149 ?auto_873154 ) ) ( not ( = ?auto_873149 ?auto_873160 ) ) ( not ( = ?auto_873150 ?auto_873151 ) ) ( not ( = ?auto_873150 ?auto_873152 ) ) ( not ( = ?auto_873150 ?auto_873153 ) ) ( not ( = ?auto_873150 ?auto_873154 ) ) ( not ( = ?auto_873150 ?auto_873160 ) ) ( not ( = ?auto_873151 ?auto_873152 ) ) ( not ( = ?auto_873151 ?auto_873153 ) ) ( not ( = ?auto_873151 ?auto_873154 ) ) ( not ( = ?auto_873151 ?auto_873160 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_873152 ?auto_873153 ?auto_873154 )
      ( MAKE-11CRATE-VERIFY ?auto_873143 ?auto_873144 ?auto_873145 ?auto_873147 ?auto_873146 ?auto_873148 ?auto_873149 ?auto_873150 ?auto_873151 ?auto_873152 ?auto_873153 ?auto_873154 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_873287 - SURFACE
      ?auto_873288 - SURFACE
      ?auto_873289 - SURFACE
      ?auto_873291 - SURFACE
      ?auto_873290 - SURFACE
      ?auto_873292 - SURFACE
      ?auto_873293 - SURFACE
      ?auto_873294 - SURFACE
      ?auto_873295 - SURFACE
      ?auto_873296 - SURFACE
      ?auto_873297 - SURFACE
      ?auto_873298 - SURFACE
    )
    :vars
    (
      ?auto_873300 - HOIST
      ?auto_873303 - PLACE
      ?auto_873299 - PLACE
      ?auto_873302 - HOIST
      ?auto_873301 - SURFACE
      ?auto_873304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_873300 ?auto_873303 ) ( SURFACE-AT ?auto_873297 ?auto_873303 ) ( CLEAR ?auto_873297 ) ( IS-CRATE ?auto_873298 ) ( not ( = ?auto_873297 ?auto_873298 ) ) ( AVAILABLE ?auto_873300 ) ( ON ?auto_873297 ?auto_873296 ) ( not ( = ?auto_873296 ?auto_873297 ) ) ( not ( = ?auto_873296 ?auto_873298 ) ) ( not ( = ?auto_873299 ?auto_873303 ) ) ( HOIST-AT ?auto_873302 ?auto_873299 ) ( not ( = ?auto_873300 ?auto_873302 ) ) ( AVAILABLE ?auto_873302 ) ( SURFACE-AT ?auto_873298 ?auto_873299 ) ( ON ?auto_873298 ?auto_873301 ) ( CLEAR ?auto_873298 ) ( not ( = ?auto_873297 ?auto_873301 ) ) ( not ( = ?auto_873298 ?auto_873301 ) ) ( not ( = ?auto_873296 ?auto_873301 ) ) ( TRUCK-AT ?auto_873304 ?auto_873303 ) ( ON ?auto_873288 ?auto_873287 ) ( ON ?auto_873289 ?auto_873288 ) ( ON ?auto_873291 ?auto_873289 ) ( ON ?auto_873290 ?auto_873291 ) ( ON ?auto_873292 ?auto_873290 ) ( ON ?auto_873293 ?auto_873292 ) ( ON ?auto_873294 ?auto_873293 ) ( ON ?auto_873295 ?auto_873294 ) ( ON ?auto_873296 ?auto_873295 ) ( not ( = ?auto_873287 ?auto_873288 ) ) ( not ( = ?auto_873287 ?auto_873289 ) ) ( not ( = ?auto_873287 ?auto_873291 ) ) ( not ( = ?auto_873287 ?auto_873290 ) ) ( not ( = ?auto_873287 ?auto_873292 ) ) ( not ( = ?auto_873287 ?auto_873293 ) ) ( not ( = ?auto_873287 ?auto_873294 ) ) ( not ( = ?auto_873287 ?auto_873295 ) ) ( not ( = ?auto_873287 ?auto_873296 ) ) ( not ( = ?auto_873287 ?auto_873297 ) ) ( not ( = ?auto_873287 ?auto_873298 ) ) ( not ( = ?auto_873287 ?auto_873301 ) ) ( not ( = ?auto_873288 ?auto_873289 ) ) ( not ( = ?auto_873288 ?auto_873291 ) ) ( not ( = ?auto_873288 ?auto_873290 ) ) ( not ( = ?auto_873288 ?auto_873292 ) ) ( not ( = ?auto_873288 ?auto_873293 ) ) ( not ( = ?auto_873288 ?auto_873294 ) ) ( not ( = ?auto_873288 ?auto_873295 ) ) ( not ( = ?auto_873288 ?auto_873296 ) ) ( not ( = ?auto_873288 ?auto_873297 ) ) ( not ( = ?auto_873288 ?auto_873298 ) ) ( not ( = ?auto_873288 ?auto_873301 ) ) ( not ( = ?auto_873289 ?auto_873291 ) ) ( not ( = ?auto_873289 ?auto_873290 ) ) ( not ( = ?auto_873289 ?auto_873292 ) ) ( not ( = ?auto_873289 ?auto_873293 ) ) ( not ( = ?auto_873289 ?auto_873294 ) ) ( not ( = ?auto_873289 ?auto_873295 ) ) ( not ( = ?auto_873289 ?auto_873296 ) ) ( not ( = ?auto_873289 ?auto_873297 ) ) ( not ( = ?auto_873289 ?auto_873298 ) ) ( not ( = ?auto_873289 ?auto_873301 ) ) ( not ( = ?auto_873291 ?auto_873290 ) ) ( not ( = ?auto_873291 ?auto_873292 ) ) ( not ( = ?auto_873291 ?auto_873293 ) ) ( not ( = ?auto_873291 ?auto_873294 ) ) ( not ( = ?auto_873291 ?auto_873295 ) ) ( not ( = ?auto_873291 ?auto_873296 ) ) ( not ( = ?auto_873291 ?auto_873297 ) ) ( not ( = ?auto_873291 ?auto_873298 ) ) ( not ( = ?auto_873291 ?auto_873301 ) ) ( not ( = ?auto_873290 ?auto_873292 ) ) ( not ( = ?auto_873290 ?auto_873293 ) ) ( not ( = ?auto_873290 ?auto_873294 ) ) ( not ( = ?auto_873290 ?auto_873295 ) ) ( not ( = ?auto_873290 ?auto_873296 ) ) ( not ( = ?auto_873290 ?auto_873297 ) ) ( not ( = ?auto_873290 ?auto_873298 ) ) ( not ( = ?auto_873290 ?auto_873301 ) ) ( not ( = ?auto_873292 ?auto_873293 ) ) ( not ( = ?auto_873292 ?auto_873294 ) ) ( not ( = ?auto_873292 ?auto_873295 ) ) ( not ( = ?auto_873292 ?auto_873296 ) ) ( not ( = ?auto_873292 ?auto_873297 ) ) ( not ( = ?auto_873292 ?auto_873298 ) ) ( not ( = ?auto_873292 ?auto_873301 ) ) ( not ( = ?auto_873293 ?auto_873294 ) ) ( not ( = ?auto_873293 ?auto_873295 ) ) ( not ( = ?auto_873293 ?auto_873296 ) ) ( not ( = ?auto_873293 ?auto_873297 ) ) ( not ( = ?auto_873293 ?auto_873298 ) ) ( not ( = ?auto_873293 ?auto_873301 ) ) ( not ( = ?auto_873294 ?auto_873295 ) ) ( not ( = ?auto_873294 ?auto_873296 ) ) ( not ( = ?auto_873294 ?auto_873297 ) ) ( not ( = ?auto_873294 ?auto_873298 ) ) ( not ( = ?auto_873294 ?auto_873301 ) ) ( not ( = ?auto_873295 ?auto_873296 ) ) ( not ( = ?auto_873295 ?auto_873297 ) ) ( not ( = ?auto_873295 ?auto_873298 ) ) ( not ( = ?auto_873295 ?auto_873301 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_873296 ?auto_873297 ?auto_873298 )
      ( MAKE-11CRATE-VERIFY ?auto_873287 ?auto_873288 ?auto_873289 ?auto_873291 ?auto_873290 ?auto_873292 ?auto_873293 ?auto_873294 ?auto_873295 ?auto_873296 ?auto_873297 ?auto_873298 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_873431 - SURFACE
      ?auto_873432 - SURFACE
      ?auto_873433 - SURFACE
      ?auto_873435 - SURFACE
      ?auto_873434 - SURFACE
      ?auto_873436 - SURFACE
      ?auto_873437 - SURFACE
      ?auto_873438 - SURFACE
      ?auto_873439 - SURFACE
      ?auto_873440 - SURFACE
      ?auto_873441 - SURFACE
      ?auto_873442 - SURFACE
    )
    :vars
    (
      ?auto_873447 - HOIST
      ?auto_873448 - PLACE
      ?auto_873445 - PLACE
      ?auto_873446 - HOIST
      ?auto_873444 - SURFACE
      ?auto_873443 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_873447 ?auto_873448 ) ( IS-CRATE ?auto_873442 ) ( not ( = ?auto_873441 ?auto_873442 ) ) ( not ( = ?auto_873440 ?auto_873441 ) ) ( not ( = ?auto_873440 ?auto_873442 ) ) ( not ( = ?auto_873445 ?auto_873448 ) ) ( HOIST-AT ?auto_873446 ?auto_873445 ) ( not ( = ?auto_873447 ?auto_873446 ) ) ( AVAILABLE ?auto_873446 ) ( SURFACE-AT ?auto_873442 ?auto_873445 ) ( ON ?auto_873442 ?auto_873444 ) ( CLEAR ?auto_873442 ) ( not ( = ?auto_873441 ?auto_873444 ) ) ( not ( = ?auto_873442 ?auto_873444 ) ) ( not ( = ?auto_873440 ?auto_873444 ) ) ( TRUCK-AT ?auto_873443 ?auto_873448 ) ( SURFACE-AT ?auto_873440 ?auto_873448 ) ( CLEAR ?auto_873440 ) ( LIFTING ?auto_873447 ?auto_873441 ) ( IS-CRATE ?auto_873441 ) ( ON ?auto_873432 ?auto_873431 ) ( ON ?auto_873433 ?auto_873432 ) ( ON ?auto_873435 ?auto_873433 ) ( ON ?auto_873434 ?auto_873435 ) ( ON ?auto_873436 ?auto_873434 ) ( ON ?auto_873437 ?auto_873436 ) ( ON ?auto_873438 ?auto_873437 ) ( ON ?auto_873439 ?auto_873438 ) ( ON ?auto_873440 ?auto_873439 ) ( not ( = ?auto_873431 ?auto_873432 ) ) ( not ( = ?auto_873431 ?auto_873433 ) ) ( not ( = ?auto_873431 ?auto_873435 ) ) ( not ( = ?auto_873431 ?auto_873434 ) ) ( not ( = ?auto_873431 ?auto_873436 ) ) ( not ( = ?auto_873431 ?auto_873437 ) ) ( not ( = ?auto_873431 ?auto_873438 ) ) ( not ( = ?auto_873431 ?auto_873439 ) ) ( not ( = ?auto_873431 ?auto_873440 ) ) ( not ( = ?auto_873431 ?auto_873441 ) ) ( not ( = ?auto_873431 ?auto_873442 ) ) ( not ( = ?auto_873431 ?auto_873444 ) ) ( not ( = ?auto_873432 ?auto_873433 ) ) ( not ( = ?auto_873432 ?auto_873435 ) ) ( not ( = ?auto_873432 ?auto_873434 ) ) ( not ( = ?auto_873432 ?auto_873436 ) ) ( not ( = ?auto_873432 ?auto_873437 ) ) ( not ( = ?auto_873432 ?auto_873438 ) ) ( not ( = ?auto_873432 ?auto_873439 ) ) ( not ( = ?auto_873432 ?auto_873440 ) ) ( not ( = ?auto_873432 ?auto_873441 ) ) ( not ( = ?auto_873432 ?auto_873442 ) ) ( not ( = ?auto_873432 ?auto_873444 ) ) ( not ( = ?auto_873433 ?auto_873435 ) ) ( not ( = ?auto_873433 ?auto_873434 ) ) ( not ( = ?auto_873433 ?auto_873436 ) ) ( not ( = ?auto_873433 ?auto_873437 ) ) ( not ( = ?auto_873433 ?auto_873438 ) ) ( not ( = ?auto_873433 ?auto_873439 ) ) ( not ( = ?auto_873433 ?auto_873440 ) ) ( not ( = ?auto_873433 ?auto_873441 ) ) ( not ( = ?auto_873433 ?auto_873442 ) ) ( not ( = ?auto_873433 ?auto_873444 ) ) ( not ( = ?auto_873435 ?auto_873434 ) ) ( not ( = ?auto_873435 ?auto_873436 ) ) ( not ( = ?auto_873435 ?auto_873437 ) ) ( not ( = ?auto_873435 ?auto_873438 ) ) ( not ( = ?auto_873435 ?auto_873439 ) ) ( not ( = ?auto_873435 ?auto_873440 ) ) ( not ( = ?auto_873435 ?auto_873441 ) ) ( not ( = ?auto_873435 ?auto_873442 ) ) ( not ( = ?auto_873435 ?auto_873444 ) ) ( not ( = ?auto_873434 ?auto_873436 ) ) ( not ( = ?auto_873434 ?auto_873437 ) ) ( not ( = ?auto_873434 ?auto_873438 ) ) ( not ( = ?auto_873434 ?auto_873439 ) ) ( not ( = ?auto_873434 ?auto_873440 ) ) ( not ( = ?auto_873434 ?auto_873441 ) ) ( not ( = ?auto_873434 ?auto_873442 ) ) ( not ( = ?auto_873434 ?auto_873444 ) ) ( not ( = ?auto_873436 ?auto_873437 ) ) ( not ( = ?auto_873436 ?auto_873438 ) ) ( not ( = ?auto_873436 ?auto_873439 ) ) ( not ( = ?auto_873436 ?auto_873440 ) ) ( not ( = ?auto_873436 ?auto_873441 ) ) ( not ( = ?auto_873436 ?auto_873442 ) ) ( not ( = ?auto_873436 ?auto_873444 ) ) ( not ( = ?auto_873437 ?auto_873438 ) ) ( not ( = ?auto_873437 ?auto_873439 ) ) ( not ( = ?auto_873437 ?auto_873440 ) ) ( not ( = ?auto_873437 ?auto_873441 ) ) ( not ( = ?auto_873437 ?auto_873442 ) ) ( not ( = ?auto_873437 ?auto_873444 ) ) ( not ( = ?auto_873438 ?auto_873439 ) ) ( not ( = ?auto_873438 ?auto_873440 ) ) ( not ( = ?auto_873438 ?auto_873441 ) ) ( not ( = ?auto_873438 ?auto_873442 ) ) ( not ( = ?auto_873438 ?auto_873444 ) ) ( not ( = ?auto_873439 ?auto_873440 ) ) ( not ( = ?auto_873439 ?auto_873441 ) ) ( not ( = ?auto_873439 ?auto_873442 ) ) ( not ( = ?auto_873439 ?auto_873444 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_873440 ?auto_873441 ?auto_873442 )
      ( MAKE-11CRATE-VERIFY ?auto_873431 ?auto_873432 ?auto_873433 ?auto_873435 ?auto_873434 ?auto_873436 ?auto_873437 ?auto_873438 ?auto_873439 ?auto_873440 ?auto_873441 ?auto_873442 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_873575 - SURFACE
      ?auto_873576 - SURFACE
      ?auto_873577 - SURFACE
      ?auto_873579 - SURFACE
      ?auto_873578 - SURFACE
      ?auto_873580 - SURFACE
      ?auto_873581 - SURFACE
      ?auto_873582 - SURFACE
      ?auto_873583 - SURFACE
      ?auto_873584 - SURFACE
      ?auto_873585 - SURFACE
      ?auto_873586 - SURFACE
    )
    :vars
    (
      ?auto_873592 - HOIST
      ?auto_873591 - PLACE
      ?auto_873588 - PLACE
      ?auto_873590 - HOIST
      ?auto_873589 - SURFACE
      ?auto_873587 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_873592 ?auto_873591 ) ( IS-CRATE ?auto_873586 ) ( not ( = ?auto_873585 ?auto_873586 ) ) ( not ( = ?auto_873584 ?auto_873585 ) ) ( not ( = ?auto_873584 ?auto_873586 ) ) ( not ( = ?auto_873588 ?auto_873591 ) ) ( HOIST-AT ?auto_873590 ?auto_873588 ) ( not ( = ?auto_873592 ?auto_873590 ) ) ( AVAILABLE ?auto_873590 ) ( SURFACE-AT ?auto_873586 ?auto_873588 ) ( ON ?auto_873586 ?auto_873589 ) ( CLEAR ?auto_873586 ) ( not ( = ?auto_873585 ?auto_873589 ) ) ( not ( = ?auto_873586 ?auto_873589 ) ) ( not ( = ?auto_873584 ?auto_873589 ) ) ( TRUCK-AT ?auto_873587 ?auto_873591 ) ( SURFACE-AT ?auto_873584 ?auto_873591 ) ( CLEAR ?auto_873584 ) ( IS-CRATE ?auto_873585 ) ( AVAILABLE ?auto_873592 ) ( IN ?auto_873585 ?auto_873587 ) ( ON ?auto_873576 ?auto_873575 ) ( ON ?auto_873577 ?auto_873576 ) ( ON ?auto_873579 ?auto_873577 ) ( ON ?auto_873578 ?auto_873579 ) ( ON ?auto_873580 ?auto_873578 ) ( ON ?auto_873581 ?auto_873580 ) ( ON ?auto_873582 ?auto_873581 ) ( ON ?auto_873583 ?auto_873582 ) ( ON ?auto_873584 ?auto_873583 ) ( not ( = ?auto_873575 ?auto_873576 ) ) ( not ( = ?auto_873575 ?auto_873577 ) ) ( not ( = ?auto_873575 ?auto_873579 ) ) ( not ( = ?auto_873575 ?auto_873578 ) ) ( not ( = ?auto_873575 ?auto_873580 ) ) ( not ( = ?auto_873575 ?auto_873581 ) ) ( not ( = ?auto_873575 ?auto_873582 ) ) ( not ( = ?auto_873575 ?auto_873583 ) ) ( not ( = ?auto_873575 ?auto_873584 ) ) ( not ( = ?auto_873575 ?auto_873585 ) ) ( not ( = ?auto_873575 ?auto_873586 ) ) ( not ( = ?auto_873575 ?auto_873589 ) ) ( not ( = ?auto_873576 ?auto_873577 ) ) ( not ( = ?auto_873576 ?auto_873579 ) ) ( not ( = ?auto_873576 ?auto_873578 ) ) ( not ( = ?auto_873576 ?auto_873580 ) ) ( not ( = ?auto_873576 ?auto_873581 ) ) ( not ( = ?auto_873576 ?auto_873582 ) ) ( not ( = ?auto_873576 ?auto_873583 ) ) ( not ( = ?auto_873576 ?auto_873584 ) ) ( not ( = ?auto_873576 ?auto_873585 ) ) ( not ( = ?auto_873576 ?auto_873586 ) ) ( not ( = ?auto_873576 ?auto_873589 ) ) ( not ( = ?auto_873577 ?auto_873579 ) ) ( not ( = ?auto_873577 ?auto_873578 ) ) ( not ( = ?auto_873577 ?auto_873580 ) ) ( not ( = ?auto_873577 ?auto_873581 ) ) ( not ( = ?auto_873577 ?auto_873582 ) ) ( not ( = ?auto_873577 ?auto_873583 ) ) ( not ( = ?auto_873577 ?auto_873584 ) ) ( not ( = ?auto_873577 ?auto_873585 ) ) ( not ( = ?auto_873577 ?auto_873586 ) ) ( not ( = ?auto_873577 ?auto_873589 ) ) ( not ( = ?auto_873579 ?auto_873578 ) ) ( not ( = ?auto_873579 ?auto_873580 ) ) ( not ( = ?auto_873579 ?auto_873581 ) ) ( not ( = ?auto_873579 ?auto_873582 ) ) ( not ( = ?auto_873579 ?auto_873583 ) ) ( not ( = ?auto_873579 ?auto_873584 ) ) ( not ( = ?auto_873579 ?auto_873585 ) ) ( not ( = ?auto_873579 ?auto_873586 ) ) ( not ( = ?auto_873579 ?auto_873589 ) ) ( not ( = ?auto_873578 ?auto_873580 ) ) ( not ( = ?auto_873578 ?auto_873581 ) ) ( not ( = ?auto_873578 ?auto_873582 ) ) ( not ( = ?auto_873578 ?auto_873583 ) ) ( not ( = ?auto_873578 ?auto_873584 ) ) ( not ( = ?auto_873578 ?auto_873585 ) ) ( not ( = ?auto_873578 ?auto_873586 ) ) ( not ( = ?auto_873578 ?auto_873589 ) ) ( not ( = ?auto_873580 ?auto_873581 ) ) ( not ( = ?auto_873580 ?auto_873582 ) ) ( not ( = ?auto_873580 ?auto_873583 ) ) ( not ( = ?auto_873580 ?auto_873584 ) ) ( not ( = ?auto_873580 ?auto_873585 ) ) ( not ( = ?auto_873580 ?auto_873586 ) ) ( not ( = ?auto_873580 ?auto_873589 ) ) ( not ( = ?auto_873581 ?auto_873582 ) ) ( not ( = ?auto_873581 ?auto_873583 ) ) ( not ( = ?auto_873581 ?auto_873584 ) ) ( not ( = ?auto_873581 ?auto_873585 ) ) ( not ( = ?auto_873581 ?auto_873586 ) ) ( not ( = ?auto_873581 ?auto_873589 ) ) ( not ( = ?auto_873582 ?auto_873583 ) ) ( not ( = ?auto_873582 ?auto_873584 ) ) ( not ( = ?auto_873582 ?auto_873585 ) ) ( not ( = ?auto_873582 ?auto_873586 ) ) ( not ( = ?auto_873582 ?auto_873589 ) ) ( not ( = ?auto_873583 ?auto_873584 ) ) ( not ( = ?auto_873583 ?auto_873585 ) ) ( not ( = ?auto_873583 ?auto_873586 ) ) ( not ( = ?auto_873583 ?auto_873589 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_873584 ?auto_873585 ?auto_873586 )
      ( MAKE-11CRATE-VERIFY ?auto_873575 ?auto_873576 ?auto_873577 ?auto_873579 ?auto_873578 ?auto_873580 ?auto_873581 ?auto_873582 ?auto_873583 ?auto_873584 ?auto_873585 ?auto_873586 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_882866 - SURFACE
      ?auto_882867 - SURFACE
      ?auto_882868 - SURFACE
      ?auto_882870 - SURFACE
      ?auto_882869 - SURFACE
      ?auto_882871 - SURFACE
      ?auto_882872 - SURFACE
      ?auto_882873 - SURFACE
      ?auto_882874 - SURFACE
      ?auto_882875 - SURFACE
      ?auto_882876 - SURFACE
      ?auto_882877 - SURFACE
      ?auto_882878 - SURFACE
    )
    :vars
    (
      ?auto_882879 - HOIST
      ?auto_882880 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_882879 ?auto_882880 ) ( SURFACE-AT ?auto_882877 ?auto_882880 ) ( CLEAR ?auto_882877 ) ( LIFTING ?auto_882879 ?auto_882878 ) ( IS-CRATE ?auto_882878 ) ( not ( = ?auto_882877 ?auto_882878 ) ) ( ON ?auto_882867 ?auto_882866 ) ( ON ?auto_882868 ?auto_882867 ) ( ON ?auto_882870 ?auto_882868 ) ( ON ?auto_882869 ?auto_882870 ) ( ON ?auto_882871 ?auto_882869 ) ( ON ?auto_882872 ?auto_882871 ) ( ON ?auto_882873 ?auto_882872 ) ( ON ?auto_882874 ?auto_882873 ) ( ON ?auto_882875 ?auto_882874 ) ( ON ?auto_882876 ?auto_882875 ) ( ON ?auto_882877 ?auto_882876 ) ( not ( = ?auto_882866 ?auto_882867 ) ) ( not ( = ?auto_882866 ?auto_882868 ) ) ( not ( = ?auto_882866 ?auto_882870 ) ) ( not ( = ?auto_882866 ?auto_882869 ) ) ( not ( = ?auto_882866 ?auto_882871 ) ) ( not ( = ?auto_882866 ?auto_882872 ) ) ( not ( = ?auto_882866 ?auto_882873 ) ) ( not ( = ?auto_882866 ?auto_882874 ) ) ( not ( = ?auto_882866 ?auto_882875 ) ) ( not ( = ?auto_882866 ?auto_882876 ) ) ( not ( = ?auto_882866 ?auto_882877 ) ) ( not ( = ?auto_882866 ?auto_882878 ) ) ( not ( = ?auto_882867 ?auto_882868 ) ) ( not ( = ?auto_882867 ?auto_882870 ) ) ( not ( = ?auto_882867 ?auto_882869 ) ) ( not ( = ?auto_882867 ?auto_882871 ) ) ( not ( = ?auto_882867 ?auto_882872 ) ) ( not ( = ?auto_882867 ?auto_882873 ) ) ( not ( = ?auto_882867 ?auto_882874 ) ) ( not ( = ?auto_882867 ?auto_882875 ) ) ( not ( = ?auto_882867 ?auto_882876 ) ) ( not ( = ?auto_882867 ?auto_882877 ) ) ( not ( = ?auto_882867 ?auto_882878 ) ) ( not ( = ?auto_882868 ?auto_882870 ) ) ( not ( = ?auto_882868 ?auto_882869 ) ) ( not ( = ?auto_882868 ?auto_882871 ) ) ( not ( = ?auto_882868 ?auto_882872 ) ) ( not ( = ?auto_882868 ?auto_882873 ) ) ( not ( = ?auto_882868 ?auto_882874 ) ) ( not ( = ?auto_882868 ?auto_882875 ) ) ( not ( = ?auto_882868 ?auto_882876 ) ) ( not ( = ?auto_882868 ?auto_882877 ) ) ( not ( = ?auto_882868 ?auto_882878 ) ) ( not ( = ?auto_882870 ?auto_882869 ) ) ( not ( = ?auto_882870 ?auto_882871 ) ) ( not ( = ?auto_882870 ?auto_882872 ) ) ( not ( = ?auto_882870 ?auto_882873 ) ) ( not ( = ?auto_882870 ?auto_882874 ) ) ( not ( = ?auto_882870 ?auto_882875 ) ) ( not ( = ?auto_882870 ?auto_882876 ) ) ( not ( = ?auto_882870 ?auto_882877 ) ) ( not ( = ?auto_882870 ?auto_882878 ) ) ( not ( = ?auto_882869 ?auto_882871 ) ) ( not ( = ?auto_882869 ?auto_882872 ) ) ( not ( = ?auto_882869 ?auto_882873 ) ) ( not ( = ?auto_882869 ?auto_882874 ) ) ( not ( = ?auto_882869 ?auto_882875 ) ) ( not ( = ?auto_882869 ?auto_882876 ) ) ( not ( = ?auto_882869 ?auto_882877 ) ) ( not ( = ?auto_882869 ?auto_882878 ) ) ( not ( = ?auto_882871 ?auto_882872 ) ) ( not ( = ?auto_882871 ?auto_882873 ) ) ( not ( = ?auto_882871 ?auto_882874 ) ) ( not ( = ?auto_882871 ?auto_882875 ) ) ( not ( = ?auto_882871 ?auto_882876 ) ) ( not ( = ?auto_882871 ?auto_882877 ) ) ( not ( = ?auto_882871 ?auto_882878 ) ) ( not ( = ?auto_882872 ?auto_882873 ) ) ( not ( = ?auto_882872 ?auto_882874 ) ) ( not ( = ?auto_882872 ?auto_882875 ) ) ( not ( = ?auto_882872 ?auto_882876 ) ) ( not ( = ?auto_882872 ?auto_882877 ) ) ( not ( = ?auto_882872 ?auto_882878 ) ) ( not ( = ?auto_882873 ?auto_882874 ) ) ( not ( = ?auto_882873 ?auto_882875 ) ) ( not ( = ?auto_882873 ?auto_882876 ) ) ( not ( = ?auto_882873 ?auto_882877 ) ) ( not ( = ?auto_882873 ?auto_882878 ) ) ( not ( = ?auto_882874 ?auto_882875 ) ) ( not ( = ?auto_882874 ?auto_882876 ) ) ( not ( = ?auto_882874 ?auto_882877 ) ) ( not ( = ?auto_882874 ?auto_882878 ) ) ( not ( = ?auto_882875 ?auto_882876 ) ) ( not ( = ?auto_882875 ?auto_882877 ) ) ( not ( = ?auto_882875 ?auto_882878 ) ) ( not ( = ?auto_882876 ?auto_882877 ) ) ( not ( = ?auto_882876 ?auto_882878 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_882877 ?auto_882878 )
      ( MAKE-12CRATE-VERIFY ?auto_882866 ?auto_882867 ?auto_882868 ?auto_882870 ?auto_882869 ?auto_882871 ?auto_882872 ?auto_882873 ?auto_882874 ?auto_882875 ?auto_882876 ?auto_882877 ?auto_882878 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_882991 - SURFACE
      ?auto_882992 - SURFACE
      ?auto_882993 - SURFACE
      ?auto_882995 - SURFACE
      ?auto_882994 - SURFACE
      ?auto_882996 - SURFACE
      ?auto_882997 - SURFACE
      ?auto_882998 - SURFACE
      ?auto_882999 - SURFACE
      ?auto_883000 - SURFACE
      ?auto_883001 - SURFACE
      ?auto_883002 - SURFACE
      ?auto_883003 - SURFACE
    )
    :vars
    (
      ?auto_883004 - HOIST
      ?auto_883006 - PLACE
      ?auto_883005 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_883004 ?auto_883006 ) ( SURFACE-AT ?auto_883002 ?auto_883006 ) ( CLEAR ?auto_883002 ) ( IS-CRATE ?auto_883003 ) ( not ( = ?auto_883002 ?auto_883003 ) ) ( TRUCK-AT ?auto_883005 ?auto_883006 ) ( AVAILABLE ?auto_883004 ) ( IN ?auto_883003 ?auto_883005 ) ( ON ?auto_883002 ?auto_883001 ) ( not ( = ?auto_883001 ?auto_883002 ) ) ( not ( = ?auto_883001 ?auto_883003 ) ) ( ON ?auto_882992 ?auto_882991 ) ( ON ?auto_882993 ?auto_882992 ) ( ON ?auto_882995 ?auto_882993 ) ( ON ?auto_882994 ?auto_882995 ) ( ON ?auto_882996 ?auto_882994 ) ( ON ?auto_882997 ?auto_882996 ) ( ON ?auto_882998 ?auto_882997 ) ( ON ?auto_882999 ?auto_882998 ) ( ON ?auto_883000 ?auto_882999 ) ( ON ?auto_883001 ?auto_883000 ) ( not ( = ?auto_882991 ?auto_882992 ) ) ( not ( = ?auto_882991 ?auto_882993 ) ) ( not ( = ?auto_882991 ?auto_882995 ) ) ( not ( = ?auto_882991 ?auto_882994 ) ) ( not ( = ?auto_882991 ?auto_882996 ) ) ( not ( = ?auto_882991 ?auto_882997 ) ) ( not ( = ?auto_882991 ?auto_882998 ) ) ( not ( = ?auto_882991 ?auto_882999 ) ) ( not ( = ?auto_882991 ?auto_883000 ) ) ( not ( = ?auto_882991 ?auto_883001 ) ) ( not ( = ?auto_882991 ?auto_883002 ) ) ( not ( = ?auto_882991 ?auto_883003 ) ) ( not ( = ?auto_882992 ?auto_882993 ) ) ( not ( = ?auto_882992 ?auto_882995 ) ) ( not ( = ?auto_882992 ?auto_882994 ) ) ( not ( = ?auto_882992 ?auto_882996 ) ) ( not ( = ?auto_882992 ?auto_882997 ) ) ( not ( = ?auto_882992 ?auto_882998 ) ) ( not ( = ?auto_882992 ?auto_882999 ) ) ( not ( = ?auto_882992 ?auto_883000 ) ) ( not ( = ?auto_882992 ?auto_883001 ) ) ( not ( = ?auto_882992 ?auto_883002 ) ) ( not ( = ?auto_882992 ?auto_883003 ) ) ( not ( = ?auto_882993 ?auto_882995 ) ) ( not ( = ?auto_882993 ?auto_882994 ) ) ( not ( = ?auto_882993 ?auto_882996 ) ) ( not ( = ?auto_882993 ?auto_882997 ) ) ( not ( = ?auto_882993 ?auto_882998 ) ) ( not ( = ?auto_882993 ?auto_882999 ) ) ( not ( = ?auto_882993 ?auto_883000 ) ) ( not ( = ?auto_882993 ?auto_883001 ) ) ( not ( = ?auto_882993 ?auto_883002 ) ) ( not ( = ?auto_882993 ?auto_883003 ) ) ( not ( = ?auto_882995 ?auto_882994 ) ) ( not ( = ?auto_882995 ?auto_882996 ) ) ( not ( = ?auto_882995 ?auto_882997 ) ) ( not ( = ?auto_882995 ?auto_882998 ) ) ( not ( = ?auto_882995 ?auto_882999 ) ) ( not ( = ?auto_882995 ?auto_883000 ) ) ( not ( = ?auto_882995 ?auto_883001 ) ) ( not ( = ?auto_882995 ?auto_883002 ) ) ( not ( = ?auto_882995 ?auto_883003 ) ) ( not ( = ?auto_882994 ?auto_882996 ) ) ( not ( = ?auto_882994 ?auto_882997 ) ) ( not ( = ?auto_882994 ?auto_882998 ) ) ( not ( = ?auto_882994 ?auto_882999 ) ) ( not ( = ?auto_882994 ?auto_883000 ) ) ( not ( = ?auto_882994 ?auto_883001 ) ) ( not ( = ?auto_882994 ?auto_883002 ) ) ( not ( = ?auto_882994 ?auto_883003 ) ) ( not ( = ?auto_882996 ?auto_882997 ) ) ( not ( = ?auto_882996 ?auto_882998 ) ) ( not ( = ?auto_882996 ?auto_882999 ) ) ( not ( = ?auto_882996 ?auto_883000 ) ) ( not ( = ?auto_882996 ?auto_883001 ) ) ( not ( = ?auto_882996 ?auto_883002 ) ) ( not ( = ?auto_882996 ?auto_883003 ) ) ( not ( = ?auto_882997 ?auto_882998 ) ) ( not ( = ?auto_882997 ?auto_882999 ) ) ( not ( = ?auto_882997 ?auto_883000 ) ) ( not ( = ?auto_882997 ?auto_883001 ) ) ( not ( = ?auto_882997 ?auto_883002 ) ) ( not ( = ?auto_882997 ?auto_883003 ) ) ( not ( = ?auto_882998 ?auto_882999 ) ) ( not ( = ?auto_882998 ?auto_883000 ) ) ( not ( = ?auto_882998 ?auto_883001 ) ) ( not ( = ?auto_882998 ?auto_883002 ) ) ( not ( = ?auto_882998 ?auto_883003 ) ) ( not ( = ?auto_882999 ?auto_883000 ) ) ( not ( = ?auto_882999 ?auto_883001 ) ) ( not ( = ?auto_882999 ?auto_883002 ) ) ( not ( = ?auto_882999 ?auto_883003 ) ) ( not ( = ?auto_883000 ?auto_883001 ) ) ( not ( = ?auto_883000 ?auto_883002 ) ) ( not ( = ?auto_883000 ?auto_883003 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_883001 ?auto_883002 ?auto_883003 )
      ( MAKE-12CRATE-VERIFY ?auto_882991 ?auto_882992 ?auto_882993 ?auto_882995 ?auto_882994 ?auto_882996 ?auto_882997 ?auto_882998 ?auto_882999 ?auto_883000 ?auto_883001 ?auto_883002 ?auto_883003 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_883129 - SURFACE
      ?auto_883130 - SURFACE
      ?auto_883131 - SURFACE
      ?auto_883133 - SURFACE
      ?auto_883132 - SURFACE
      ?auto_883134 - SURFACE
      ?auto_883135 - SURFACE
      ?auto_883136 - SURFACE
      ?auto_883137 - SURFACE
      ?auto_883138 - SURFACE
      ?auto_883139 - SURFACE
      ?auto_883140 - SURFACE
      ?auto_883141 - SURFACE
    )
    :vars
    (
      ?auto_883144 - HOIST
      ?auto_883145 - PLACE
      ?auto_883142 - TRUCK
      ?auto_883143 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_883144 ?auto_883145 ) ( SURFACE-AT ?auto_883140 ?auto_883145 ) ( CLEAR ?auto_883140 ) ( IS-CRATE ?auto_883141 ) ( not ( = ?auto_883140 ?auto_883141 ) ) ( AVAILABLE ?auto_883144 ) ( IN ?auto_883141 ?auto_883142 ) ( ON ?auto_883140 ?auto_883139 ) ( not ( = ?auto_883139 ?auto_883140 ) ) ( not ( = ?auto_883139 ?auto_883141 ) ) ( TRUCK-AT ?auto_883142 ?auto_883143 ) ( not ( = ?auto_883143 ?auto_883145 ) ) ( ON ?auto_883130 ?auto_883129 ) ( ON ?auto_883131 ?auto_883130 ) ( ON ?auto_883133 ?auto_883131 ) ( ON ?auto_883132 ?auto_883133 ) ( ON ?auto_883134 ?auto_883132 ) ( ON ?auto_883135 ?auto_883134 ) ( ON ?auto_883136 ?auto_883135 ) ( ON ?auto_883137 ?auto_883136 ) ( ON ?auto_883138 ?auto_883137 ) ( ON ?auto_883139 ?auto_883138 ) ( not ( = ?auto_883129 ?auto_883130 ) ) ( not ( = ?auto_883129 ?auto_883131 ) ) ( not ( = ?auto_883129 ?auto_883133 ) ) ( not ( = ?auto_883129 ?auto_883132 ) ) ( not ( = ?auto_883129 ?auto_883134 ) ) ( not ( = ?auto_883129 ?auto_883135 ) ) ( not ( = ?auto_883129 ?auto_883136 ) ) ( not ( = ?auto_883129 ?auto_883137 ) ) ( not ( = ?auto_883129 ?auto_883138 ) ) ( not ( = ?auto_883129 ?auto_883139 ) ) ( not ( = ?auto_883129 ?auto_883140 ) ) ( not ( = ?auto_883129 ?auto_883141 ) ) ( not ( = ?auto_883130 ?auto_883131 ) ) ( not ( = ?auto_883130 ?auto_883133 ) ) ( not ( = ?auto_883130 ?auto_883132 ) ) ( not ( = ?auto_883130 ?auto_883134 ) ) ( not ( = ?auto_883130 ?auto_883135 ) ) ( not ( = ?auto_883130 ?auto_883136 ) ) ( not ( = ?auto_883130 ?auto_883137 ) ) ( not ( = ?auto_883130 ?auto_883138 ) ) ( not ( = ?auto_883130 ?auto_883139 ) ) ( not ( = ?auto_883130 ?auto_883140 ) ) ( not ( = ?auto_883130 ?auto_883141 ) ) ( not ( = ?auto_883131 ?auto_883133 ) ) ( not ( = ?auto_883131 ?auto_883132 ) ) ( not ( = ?auto_883131 ?auto_883134 ) ) ( not ( = ?auto_883131 ?auto_883135 ) ) ( not ( = ?auto_883131 ?auto_883136 ) ) ( not ( = ?auto_883131 ?auto_883137 ) ) ( not ( = ?auto_883131 ?auto_883138 ) ) ( not ( = ?auto_883131 ?auto_883139 ) ) ( not ( = ?auto_883131 ?auto_883140 ) ) ( not ( = ?auto_883131 ?auto_883141 ) ) ( not ( = ?auto_883133 ?auto_883132 ) ) ( not ( = ?auto_883133 ?auto_883134 ) ) ( not ( = ?auto_883133 ?auto_883135 ) ) ( not ( = ?auto_883133 ?auto_883136 ) ) ( not ( = ?auto_883133 ?auto_883137 ) ) ( not ( = ?auto_883133 ?auto_883138 ) ) ( not ( = ?auto_883133 ?auto_883139 ) ) ( not ( = ?auto_883133 ?auto_883140 ) ) ( not ( = ?auto_883133 ?auto_883141 ) ) ( not ( = ?auto_883132 ?auto_883134 ) ) ( not ( = ?auto_883132 ?auto_883135 ) ) ( not ( = ?auto_883132 ?auto_883136 ) ) ( not ( = ?auto_883132 ?auto_883137 ) ) ( not ( = ?auto_883132 ?auto_883138 ) ) ( not ( = ?auto_883132 ?auto_883139 ) ) ( not ( = ?auto_883132 ?auto_883140 ) ) ( not ( = ?auto_883132 ?auto_883141 ) ) ( not ( = ?auto_883134 ?auto_883135 ) ) ( not ( = ?auto_883134 ?auto_883136 ) ) ( not ( = ?auto_883134 ?auto_883137 ) ) ( not ( = ?auto_883134 ?auto_883138 ) ) ( not ( = ?auto_883134 ?auto_883139 ) ) ( not ( = ?auto_883134 ?auto_883140 ) ) ( not ( = ?auto_883134 ?auto_883141 ) ) ( not ( = ?auto_883135 ?auto_883136 ) ) ( not ( = ?auto_883135 ?auto_883137 ) ) ( not ( = ?auto_883135 ?auto_883138 ) ) ( not ( = ?auto_883135 ?auto_883139 ) ) ( not ( = ?auto_883135 ?auto_883140 ) ) ( not ( = ?auto_883135 ?auto_883141 ) ) ( not ( = ?auto_883136 ?auto_883137 ) ) ( not ( = ?auto_883136 ?auto_883138 ) ) ( not ( = ?auto_883136 ?auto_883139 ) ) ( not ( = ?auto_883136 ?auto_883140 ) ) ( not ( = ?auto_883136 ?auto_883141 ) ) ( not ( = ?auto_883137 ?auto_883138 ) ) ( not ( = ?auto_883137 ?auto_883139 ) ) ( not ( = ?auto_883137 ?auto_883140 ) ) ( not ( = ?auto_883137 ?auto_883141 ) ) ( not ( = ?auto_883138 ?auto_883139 ) ) ( not ( = ?auto_883138 ?auto_883140 ) ) ( not ( = ?auto_883138 ?auto_883141 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_883139 ?auto_883140 ?auto_883141 )
      ( MAKE-12CRATE-VERIFY ?auto_883129 ?auto_883130 ?auto_883131 ?auto_883133 ?auto_883132 ?auto_883134 ?auto_883135 ?auto_883136 ?auto_883137 ?auto_883138 ?auto_883139 ?auto_883140 ?auto_883141 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_883279 - SURFACE
      ?auto_883280 - SURFACE
      ?auto_883281 - SURFACE
      ?auto_883283 - SURFACE
      ?auto_883282 - SURFACE
      ?auto_883284 - SURFACE
      ?auto_883285 - SURFACE
      ?auto_883286 - SURFACE
      ?auto_883287 - SURFACE
      ?auto_883288 - SURFACE
      ?auto_883289 - SURFACE
      ?auto_883290 - SURFACE
      ?auto_883291 - SURFACE
    )
    :vars
    (
      ?auto_883292 - HOIST
      ?auto_883293 - PLACE
      ?auto_883296 - TRUCK
      ?auto_883295 - PLACE
      ?auto_883294 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_883292 ?auto_883293 ) ( SURFACE-AT ?auto_883290 ?auto_883293 ) ( CLEAR ?auto_883290 ) ( IS-CRATE ?auto_883291 ) ( not ( = ?auto_883290 ?auto_883291 ) ) ( AVAILABLE ?auto_883292 ) ( ON ?auto_883290 ?auto_883289 ) ( not ( = ?auto_883289 ?auto_883290 ) ) ( not ( = ?auto_883289 ?auto_883291 ) ) ( TRUCK-AT ?auto_883296 ?auto_883295 ) ( not ( = ?auto_883295 ?auto_883293 ) ) ( HOIST-AT ?auto_883294 ?auto_883295 ) ( LIFTING ?auto_883294 ?auto_883291 ) ( not ( = ?auto_883292 ?auto_883294 ) ) ( ON ?auto_883280 ?auto_883279 ) ( ON ?auto_883281 ?auto_883280 ) ( ON ?auto_883283 ?auto_883281 ) ( ON ?auto_883282 ?auto_883283 ) ( ON ?auto_883284 ?auto_883282 ) ( ON ?auto_883285 ?auto_883284 ) ( ON ?auto_883286 ?auto_883285 ) ( ON ?auto_883287 ?auto_883286 ) ( ON ?auto_883288 ?auto_883287 ) ( ON ?auto_883289 ?auto_883288 ) ( not ( = ?auto_883279 ?auto_883280 ) ) ( not ( = ?auto_883279 ?auto_883281 ) ) ( not ( = ?auto_883279 ?auto_883283 ) ) ( not ( = ?auto_883279 ?auto_883282 ) ) ( not ( = ?auto_883279 ?auto_883284 ) ) ( not ( = ?auto_883279 ?auto_883285 ) ) ( not ( = ?auto_883279 ?auto_883286 ) ) ( not ( = ?auto_883279 ?auto_883287 ) ) ( not ( = ?auto_883279 ?auto_883288 ) ) ( not ( = ?auto_883279 ?auto_883289 ) ) ( not ( = ?auto_883279 ?auto_883290 ) ) ( not ( = ?auto_883279 ?auto_883291 ) ) ( not ( = ?auto_883280 ?auto_883281 ) ) ( not ( = ?auto_883280 ?auto_883283 ) ) ( not ( = ?auto_883280 ?auto_883282 ) ) ( not ( = ?auto_883280 ?auto_883284 ) ) ( not ( = ?auto_883280 ?auto_883285 ) ) ( not ( = ?auto_883280 ?auto_883286 ) ) ( not ( = ?auto_883280 ?auto_883287 ) ) ( not ( = ?auto_883280 ?auto_883288 ) ) ( not ( = ?auto_883280 ?auto_883289 ) ) ( not ( = ?auto_883280 ?auto_883290 ) ) ( not ( = ?auto_883280 ?auto_883291 ) ) ( not ( = ?auto_883281 ?auto_883283 ) ) ( not ( = ?auto_883281 ?auto_883282 ) ) ( not ( = ?auto_883281 ?auto_883284 ) ) ( not ( = ?auto_883281 ?auto_883285 ) ) ( not ( = ?auto_883281 ?auto_883286 ) ) ( not ( = ?auto_883281 ?auto_883287 ) ) ( not ( = ?auto_883281 ?auto_883288 ) ) ( not ( = ?auto_883281 ?auto_883289 ) ) ( not ( = ?auto_883281 ?auto_883290 ) ) ( not ( = ?auto_883281 ?auto_883291 ) ) ( not ( = ?auto_883283 ?auto_883282 ) ) ( not ( = ?auto_883283 ?auto_883284 ) ) ( not ( = ?auto_883283 ?auto_883285 ) ) ( not ( = ?auto_883283 ?auto_883286 ) ) ( not ( = ?auto_883283 ?auto_883287 ) ) ( not ( = ?auto_883283 ?auto_883288 ) ) ( not ( = ?auto_883283 ?auto_883289 ) ) ( not ( = ?auto_883283 ?auto_883290 ) ) ( not ( = ?auto_883283 ?auto_883291 ) ) ( not ( = ?auto_883282 ?auto_883284 ) ) ( not ( = ?auto_883282 ?auto_883285 ) ) ( not ( = ?auto_883282 ?auto_883286 ) ) ( not ( = ?auto_883282 ?auto_883287 ) ) ( not ( = ?auto_883282 ?auto_883288 ) ) ( not ( = ?auto_883282 ?auto_883289 ) ) ( not ( = ?auto_883282 ?auto_883290 ) ) ( not ( = ?auto_883282 ?auto_883291 ) ) ( not ( = ?auto_883284 ?auto_883285 ) ) ( not ( = ?auto_883284 ?auto_883286 ) ) ( not ( = ?auto_883284 ?auto_883287 ) ) ( not ( = ?auto_883284 ?auto_883288 ) ) ( not ( = ?auto_883284 ?auto_883289 ) ) ( not ( = ?auto_883284 ?auto_883290 ) ) ( not ( = ?auto_883284 ?auto_883291 ) ) ( not ( = ?auto_883285 ?auto_883286 ) ) ( not ( = ?auto_883285 ?auto_883287 ) ) ( not ( = ?auto_883285 ?auto_883288 ) ) ( not ( = ?auto_883285 ?auto_883289 ) ) ( not ( = ?auto_883285 ?auto_883290 ) ) ( not ( = ?auto_883285 ?auto_883291 ) ) ( not ( = ?auto_883286 ?auto_883287 ) ) ( not ( = ?auto_883286 ?auto_883288 ) ) ( not ( = ?auto_883286 ?auto_883289 ) ) ( not ( = ?auto_883286 ?auto_883290 ) ) ( not ( = ?auto_883286 ?auto_883291 ) ) ( not ( = ?auto_883287 ?auto_883288 ) ) ( not ( = ?auto_883287 ?auto_883289 ) ) ( not ( = ?auto_883287 ?auto_883290 ) ) ( not ( = ?auto_883287 ?auto_883291 ) ) ( not ( = ?auto_883288 ?auto_883289 ) ) ( not ( = ?auto_883288 ?auto_883290 ) ) ( not ( = ?auto_883288 ?auto_883291 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_883289 ?auto_883290 ?auto_883291 )
      ( MAKE-12CRATE-VERIFY ?auto_883279 ?auto_883280 ?auto_883281 ?auto_883283 ?auto_883282 ?auto_883284 ?auto_883285 ?auto_883286 ?auto_883287 ?auto_883288 ?auto_883289 ?auto_883290 ?auto_883291 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_883441 - SURFACE
      ?auto_883442 - SURFACE
      ?auto_883443 - SURFACE
      ?auto_883445 - SURFACE
      ?auto_883444 - SURFACE
      ?auto_883446 - SURFACE
      ?auto_883447 - SURFACE
      ?auto_883448 - SURFACE
      ?auto_883449 - SURFACE
      ?auto_883450 - SURFACE
      ?auto_883451 - SURFACE
      ?auto_883452 - SURFACE
      ?auto_883453 - SURFACE
    )
    :vars
    (
      ?auto_883459 - HOIST
      ?auto_883458 - PLACE
      ?auto_883454 - TRUCK
      ?auto_883457 - PLACE
      ?auto_883455 - HOIST
      ?auto_883456 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_883459 ?auto_883458 ) ( SURFACE-AT ?auto_883452 ?auto_883458 ) ( CLEAR ?auto_883452 ) ( IS-CRATE ?auto_883453 ) ( not ( = ?auto_883452 ?auto_883453 ) ) ( AVAILABLE ?auto_883459 ) ( ON ?auto_883452 ?auto_883451 ) ( not ( = ?auto_883451 ?auto_883452 ) ) ( not ( = ?auto_883451 ?auto_883453 ) ) ( TRUCK-AT ?auto_883454 ?auto_883457 ) ( not ( = ?auto_883457 ?auto_883458 ) ) ( HOIST-AT ?auto_883455 ?auto_883457 ) ( not ( = ?auto_883459 ?auto_883455 ) ) ( AVAILABLE ?auto_883455 ) ( SURFACE-AT ?auto_883453 ?auto_883457 ) ( ON ?auto_883453 ?auto_883456 ) ( CLEAR ?auto_883453 ) ( not ( = ?auto_883452 ?auto_883456 ) ) ( not ( = ?auto_883453 ?auto_883456 ) ) ( not ( = ?auto_883451 ?auto_883456 ) ) ( ON ?auto_883442 ?auto_883441 ) ( ON ?auto_883443 ?auto_883442 ) ( ON ?auto_883445 ?auto_883443 ) ( ON ?auto_883444 ?auto_883445 ) ( ON ?auto_883446 ?auto_883444 ) ( ON ?auto_883447 ?auto_883446 ) ( ON ?auto_883448 ?auto_883447 ) ( ON ?auto_883449 ?auto_883448 ) ( ON ?auto_883450 ?auto_883449 ) ( ON ?auto_883451 ?auto_883450 ) ( not ( = ?auto_883441 ?auto_883442 ) ) ( not ( = ?auto_883441 ?auto_883443 ) ) ( not ( = ?auto_883441 ?auto_883445 ) ) ( not ( = ?auto_883441 ?auto_883444 ) ) ( not ( = ?auto_883441 ?auto_883446 ) ) ( not ( = ?auto_883441 ?auto_883447 ) ) ( not ( = ?auto_883441 ?auto_883448 ) ) ( not ( = ?auto_883441 ?auto_883449 ) ) ( not ( = ?auto_883441 ?auto_883450 ) ) ( not ( = ?auto_883441 ?auto_883451 ) ) ( not ( = ?auto_883441 ?auto_883452 ) ) ( not ( = ?auto_883441 ?auto_883453 ) ) ( not ( = ?auto_883441 ?auto_883456 ) ) ( not ( = ?auto_883442 ?auto_883443 ) ) ( not ( = ?auto_883442 ?auto_883445 ) ) ( not ( = ?auto_883442 ?auto_883444 ) ) ( not ( = ?auto_883442 ?auto_883446 ) ) ( not ( = ?auto_883442 ?auto_883447 ) ) ( not ( = ?auto_883442 ?auto_883448 ) ) ( not ( = ?auto_883442 ?auto_883449 ) ) ( not ( = ?auto_883442 ?auto_883450 ) ) ( not ( = ?auto_883442 ?auto_883451 ) ) ( not ( = ?auto_883442 ?auto_883452 ) ) ( not ( = ?auto_883442 ?auto_883453 ) ) ( not ( = ?auto_883442 ?auto_883456 ) ) ( not ( = ?auto_883443 ?auto_883445 ) ) ( not ( = ?auto_883443 ?auto_883444 ) ) ( not ( = ?auto_883443 ?auto_883446 ) ) ( not ( = ?auto_883443 ?auto_883447 ) ) ( not ( = ?auto_883443 ?auto_883448 ) ) ( not ( = ?auto_883443 ?auto_883449 ) ) ( not ( = ?auto_883443 ?auto_883450 ) ) ( not ( = ?auto_883443 ?auto_883451 ) ) ( not ( = ?auto_883443 ?auto_883452 ) ) ( not ( = ?auto_883443 ?auto_883453 ) ) ( not ( = ?auto_883443 ?auto_883456 ) ) ( not ( = ?auto_883445 ?auto_883444 ) ) ( not ( = ?auto_883445 ?auto_883446 ) ) ( not ( = ?auto_883445 ?auto_883447 ) ) ( not ( = ?auto_883445 ?auto_883448 ) ) ( not ( = ?auto_883445 ?auto_883449 ) ) ( not ( = ?auto_883445 ?auto_883450 ) ) ( not ( = ?auto_883445 ?auto_883451 ) ) ( not ( = ?auto_883445 ?auto_883452 ) ) ( not ( = ?auto_883445 ?auto_883453 ) ) ( not ( = ?auto_883445 ?auto_883456 ) ) ( not ( = ?auto_883444 ?auto_883446 ) ) ( not ( = ?auto_883444 ?auto_883447 ) ) ( not ( = ?auto_883444 ?auto_883448 ) ) ( not ( = ?auto_883444 ?auto_883449 ) ) ( not ( = ?auto_883444 ?auto_883450 ) ) ( not ( = ?auto_883444 ?auto_883451 ) ) ( not ( = ?auto_883444 ?auto_883452 ) ) ( not ( = ?auto_883444 ?auto_883453 ) ) ( not ( = ?auto_883444 ?auto_883456 ) ) ( not ( = ?auto_883446 ?auto_883447 ) ) ( not ( = ?auto_883446 ?auto_883448 ) ) ( not ( = ?auto_883446 ?auto_883449 ) ) ( not ( = ?auto_883446 ?auto_883450 ) ) ( not ( = ?auto_883446 ?auto_883451 ) ) ( not ( = ?auto_883446 ?auto_883452 ) ) ( not ( = ?auto_883446 ?auto_883453 ) ) ( not ( = ?auto_883446 ?auto_883456 ) ) ( not ( = ?auto_883447 ?auto_883448 ) ) ( not ( = ?auto_883447 ?auto_883449 ) ) ( not ( = ?auto_883447 ?auto_883450 ) ) ( not ( = ?auto_883447 ?auto_883451 ) ) ( not ( = ?auto_883447 ?auto_883452 ) ) ( not ( = ?auto_883447 ?auto_883453 ) ) ( not ( = ?auto_883447 ?auto_883456 ) ) ( not ( = ?auto_883448 ?auto_883449 ) ) ( not ( = ?auto_883448 ?auto_883450 ) ) ( not ( = ?auto_883448 ?auto_883451 ) ) ( not ( = ?auto_883448 ?auto_883452 ) ) ( not ( = ?auto_883448 ?auto_883453 ) ) ( not ( = ?auto_883448 ?auto_883456 ) ) ( not ( = ?auto_883449 ?auto_883450 ) ) ( not ( = ?auto_883449 ?auto_883451 ) ) ( not ( = ?auto_883449 ?auto_883452 ) ) ( not ( = ?auto_883449 ?auto_883453 ) ) ( not ( = ?auto_883449 ?auto_883456 ) ) ( not ( = ?auto_883450 ?auto_883451 ) ) ( not ( = ?auto_883450 ?auto_883452 ) ) ( not ( = ?auto_883450 ?auto_883453 ) ) ( not ( = ?auto_883450 ?auto_883456 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_883451 ?auto_883452 ?auto_883453 )
      ( MAKE-12CRATE-VERIFY ?auto_883441 ?auto_883442 ?auto_883443 ?auto_883445 ?auto_883444 ?auto_883446 ?auto_883447 ?auto_883448 ?auto_883449 ?auto_883450 ?auto_883451 ?auto_883452 ?auto_883453 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_883604 - SURFACE
      ?auto_883605 - SURFACE
      ?auto_883606 - SURFACE
      ?auto_883608 - SURFACE
      ?auto_883607 - SURFACE
      ?auto_883609 - SURFACE
      ?auto_883610 - SURFACE
      ?auto_883611 - SURFACE
      ?auto_883612 - SURFACE
      ?auto_883613 - SURFACE
      ?auto_883614 - SURFACE
      ?auto_883615 - SURFACE
      ?auto_883616 - SURFACE
    )
    :vars
    (
      ?auto_883617 - HOIST
      ?auto_883620 - PLACE
      ?auto_883622 - PLACE
      ?auto_883618 - HOIST
      ?auto_883621 - SURFACE
      ?auto_883619 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_883617 ?auto_883620 ) ( SURFACE-AT ?auto_883615 ?auto_883620 ) ( CLEAR ?auto_883615 ) ( IS-CRATE ?auto_883616 ) ( not ( = ?auto_883615 ?auto_883616 ) ) ( AVAILABLE ?auto_883617 ) ( ON ?auto_883615 ?auto_883614 ) ( not ( = ?auto_883614 ?auto_883615 ) ) ( not ( = ?auto_883614 ?auto_883616 ) ) ( not ( = ?auto_883622 ?auto_883620 ) ) ( HOIST-AT ?auto_883618 ?auto_883622 ) ( not ( = ?auto_883617 ?auto_883618 ) ) ( AVAILABLE ?auto_883618 ) ( SURFACE-AT ?auto_883616 ?auto_883622 ) ( ON ?auto_883616 ?auto_883621 ) ( CLEAR ?auto_883616 ) ( not ( = ?auto_883615 ?auto_883621 ) ) ( not ( = ?auto_883616 ?auto_883621 ) ) ( not ( = ?auto_883614 ?auto_883621 ) ) ( TRUCK-AT ?auto_883619 ?auto_883620 ) ( ON ?auto_883605 ?auto_883604 ) ( ON ?auto_883606 ?auto_883605 ) ( ON ?auto_883608 ?auto_883606 ) ( ON ?auto_883607 ?auto_883608 ) ( ON ?auto_883609 ?auto_883607 ) ( ON ?auto_883610 ?auto_883609 ) ( ON ?auto_883611 ?auto_883610 ) ( ON ?auto_883612 ?auto_883611 ) ( ON ?auto_883613 ?auto_883612 ) ( ON ?auto_883614 ?auto_883613 ) ( not ( = ?auto_883604 ?auto_883605 ) ) ( not ( = ?auto_883604 ?auto_883606 ) ) ( not ( = ?auto_883604 ?auto_883608 ) ) ( not ( = ?auto_883604 ?auto_883607 ) ) ( not ( = ?auto_883604 ?auto_883609 ) ) ( not ( = ?auto_883604 ?auto_883610 ) ) ( not ( = ?auto_883604 ?auto_883611 ) ) ( not ( = ?auto_883604 ?auto_883612 ) ) ( not ( = ?auto_883604 ?auto_883613 ) ) ( not ( = ?auto_883604 ?auto_883614 ) ) ( not ( = ?auto_883604 ?auto_883615 ) ) ( not ( = ?auto_883604 ?auto_883616 ) ) ( not ( = ?auto_883604 ?auto_883621 ) ) ( not ( = ?auto_883605 ?auto_883606 ) ) ( not ( = ?auto_883605 ?auto_883608 ) ) ( not ( = ?auto_883605 ?auto_883607 ) ) ( not ( = ?auto_883605 ?auto_883609 ) ) ( not ( = ?auto_883605 ?auto_883610 ) ) ( not ( = ?auto_883605 ?auto_883611 ) ) ( not ( = ?auto_883605 ?auto_883612 ) ) ( not ( = ?auto_883605 ?auto_883613 ) ) ( not ( = ?auto_883605 ?auto_883614 ) ) ( not ( = ?auto_883605 ?auto_883615 ) ) ( not ( = ?auto_883605 ?auto_883616 ) ) ( not ( = ?auto_883605 ?auto_883621 ) ) ( not ( = ?auto_883606 ?auto_883608 ) ) ( not ( = ?auto_883606 ?auto_883607 ) ) ( not ( = ?auto_883606 ?auto_883609 ) ) ( not ( = ?auto_883606 ?auto_883610 ) ) ( not ( = ?auto_883606 ?auto_883611 ) ) ( not ( = ?auto_883606 ?auto_883612 ) ) ( not ( = ?auto_883606 ?auto_883613 ) ) ( not ( = ?auto_883606 ?auto_883614 ) ) ( not ( = ?auto_883606 ?auto_883615 ) ) ( not ( = ?auto_883606 ?auto_883616 ) ) ( not ( = ?auto_883606 ?auto_883621 ) ) ( not ( = ?auto_883608 ?auto_883607 ) ) ( not ( = ?auto_883608 ?auto_883609 ) ) ( not ( = ?auto_883608 ?auto_883610 ) ) ( not ( = ?auto_883608 ?auto_883611 ) ) ( not ( = ?auto_883608 ?auto_883612 ) ) ( not ( = ?auto_883608 ?auto_883613 ) ) ( not ( = ?auto_883608 ?auto_883614 ) ) ( not ( = ?auto_883608 ?auto_883615 ) ) ( not ( = ?auto_883608 ?auto_883616 ) ) ( not ( = ?auto_883608 ?auto_883621 ) ) ( not ( = ?auto_883607 ?auto_883609 ) ) ( not ( = ?auto_883607 ?auto_883610 ) ) ( not ( = ?auto_883607 ?auto_883611 ) ) ( not ( = ?auto_883607 ?auto_883612 ) ) ( not ( = ?auto_883607 ?auto_883613 ) ) ( not ( = ?auto_883607 ?auto_883614 ) ) ( not ( = ?auto_883607 ?auto_883615 ) ) ( not ( = ?auto_883607 ?auto_883616 ) ) ( not ( = ?auto_883607 ?auto_883621 ) ) ( not ( = ?auto_883609 ?auto_883610 ) ) ( not ( = ?auto_883609 ?auto_883611 ) ) ( not ( = ?auto_883609 ?auto_883612 ) ) ( not ( = ?auto_883609 ?auto_883613 ) ) ( not ( = ?auto_883609 ?auto_883614 ) ) ( not ( = ?auto_883609 ?auto_883615 ) ) ( not ( = ?auto_883609 ?auto_883616 ) ) ( not ( = ?auto_883609 ?auto_883621 ) ) ( not ( = ?auto_883610 ?auto_883611 ) ) ( not ( = ?auto_883610 ?auto_883612 ) ) ( not ( = ?auto_883610 ?auto_883613 ) ) ( not ( = ?auto_883610 ?auto_883614 ) ) ( not ( = ?auto_883610 ?auto_883615 ) ) ( not ( = ?auto_883610 ?auto_883616 ) ) ( not ( = ?auto_883610 ?auto_883621 ) ) ( not ( = ?auto_883611 ?auto_883612 ) ) ( not ( = ?auto_883611 ?auto_883613 ) ) ( not ( = ?auto_883611 ?auto_883614 ) ) ( not ( = ?auto_883611 ?auto_883615 ) ) ( not ( = ?auto_883611 ?auto_883616 ) ) ( not ( = ?auto_883611 ?auto_883621 ) ) ( not ( = ?auto_883612 ?auto_883613 ) ) ( not ( = ?auto_883612 ?auto_883614 ) ) ( not ( = ?auto_883612 ?auto_883615 ) ) ( not ( = ?auto_883612 ?auto_883616 ) ) ( not ( = ?auto_883612 ?auto_883621 ) ) ( not ( = ?auto_883613 ?auto_883614 ) ) ( not ( = ?auto_883613 ?auto_883615 ) ) ( not ( = ?auto_883613 ?auto_883616 ) ) ( not ( = ?auto_883613 ?auto_883621 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_883614 ?auto_883615 ?auto_883616 )
      ( MAKE-12CRATE-VERIFY ?auto_883604 ?auto_883605 ?auto_883606 ?auto_883608 ?auto_883607 ?auto_883609 ?auto_883610 ?auto_883611 ?auto_883612 ?auto_883613 ?auto_883614 ?auto_883615 ?auto_883616 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_883767 - SURFACE
      ?auto_883768 - SURFACE
      ?auto_883769 - SURFACE
      ?auto_883771 - SURFACE
      ?auto_883770 - SURFACE
      ?auto_883772 - SURFACE
      ?auto_883773 - SURFACE
      ?auto_883774 - SURFACE
      ?auto_883775 - SURFACE
      ?auto_883776 - SURFACE
      ?auto_883777 - SURFACE
      ?auto_883778 - SURFACE
      ?auto_883779 - SURFACE
    )
    :vars
    (
      ?auto_883783 - HOIST
      ?auto_883780 - PLACE
      ?auto_883782 - PLACE
      ?auto_883781 - HOIST
      ?auto_883784 - SURFACE
      ?auto_883785 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_883783 ?auto_883780 ) ( IS-CRATE ?auto_883779 ) ( not ( = ?auto_883778 ?auto_883779 ) ) ( not ( = ?auto_883777 ?auto_883778 ) ) ( not ( = ?auto_883777 ?auto_883779 ) ) ( not ( = ?auto_883782 ?auto_883780 ) ) ( HOIST-AT ?auto_883781 ?auto_883782 ) ( not ( = ?auto_883783 ?auto_883781 ) ) ( AVAILABLE ?auto_883781 ) ( SURFACE-AT ?auto_883779 ?auto_883782 ) ( ON ?auto_883779 ?auto_883784 ) ( CLEAR ?auto_883779 ) ( not ( = ?auto_883778 ?auto_883784 ) ) ( not ( = ?auto_883779 ?auto_883784 ) ) ( not ( = ?auto_883777 ?auto_883784 ) ) ( TRUCK-AT ?auto_883785 ?auto_883780 ) ( SURFACE-AT ?auto_883777 ?auto_883780 ) ( CLEAR ?auto_883777 ) ( LIFTING ?auto_883783 ?auto_883778 ) ( IS-CRATE ?auto_883778 ) ( ON ?auto_883768 ?auto_883767 ) ( ON ?auto_883769 ?auto_883768 ) ( ON ?auto_883771 ?auto_883769 ) ( ON ?auto_883770 ?auto_883771 ) ( ON ?auto_883772 ?auto_883770 ) ( ON ?auto_883773 ?auto_883772 ) ( ON ?auto_883774 ?auto_883773 ) ( ON ?auto_883775 ?auto_883774 ) ( ON ?auto_883776 ?auto_883775 ) ( ON ?auto_883777 ?auto_883776 ) ( not ( = ?auto_883767 ?auto_883768 ) ) ( not ( = ?auto_883767 ?auto_883769 ) ) ( not ( = ?auto_883767 ?auto_883771 ) ) ( not ( = ?auto_883767 ?auto_883770 ) ) ( not ( = ?auto_883767 ?auto_883772 ) ) ( not ( = ?auto_883767 ?auto_883773 ) ) ( not ( = ?auto_883767 ?auto_883774 ) ) ( not ( = ?auto_883767 ?auto_883775 ) ) ( not ( = ?auto_883767 ?auto_883776 ) ) ( not ( = ?auto_883767 ?auto_883777 ) ) ( not ( = ?auto_883767 ?auto_883778 ) ) ( not ( = ?auto_883767 ?auto_883779 ) ) ( not ( = ?auto_883767 ?auto_883784 ) ) ( not ( = ?auto_883768 ?auto_883769 ) ) ( not ( = ?auto_883768 ?auto_883771 ) ) ( not ( = ?auto_883768 ?auto_883770 ) ) ( not ( = ?auto_883768 ?auto_883772 ) ) ( not ( = ?auto_883768 ?auto_883773 ) ) ( not ( = ?auto_883768 ?auto_883774 ) ) ( not ( = ?auto_883768 ?auto_883775 ) ) ( not ( = ?auto_883768 ?auto_883776 ) ) ( not ( = ?auto_883768 ?auto_883777 ) ) ( not ( = ?auto_883768 ?auto_883778 ) ) ( not ( = ?auto_883768 ?auto_883779 ) ) ( not ( = ?auto_883768 ?auto_883784 ) ) ( not ( = ?auto_883769 ?auto_883771 ) ) ( not ( = ?auto_883769 ?auto_883770 ) ) ( not ( = ?auto_883769 ?auto_883772 ) ) ( not ( = ?auto_883769 ?auto_883773 ) ) ( not ( = ?auto_883769 ?auto_883774 ) ) ( not ( = ?auto_883769 ?auto_883775 ) ) ( not ( = ?auto_883769 ?auto_883776 ) ) ( not ( = ?auto_883769 ?auto_883777 ) ) ( not ( = ?auto_883769 ?auto_883778 ) ) ( not ( = ?auto_883769 ?auto_883779 ) ) ( not ( = ?auto_883769 ?auto_883784 ) ) ( not ( = ?auto_883771 ?auto_883770 ) ) ( not ( = ?auto_883771 ?auto_883772 ) ) ( not ( = ?auto_883771 ?auto_883773 ) ) ( not ( = ?auto_883771 ?auto_883774 ) ) ( not ( = ?auto_883771 ?auto_883775 ) ) ( not ( = ?auto_883771 ?auto_883776 ) ) ( not ( = ?auto_883771 ?auto_883777 ) ) ( not ( = ?auto_883771 ?auto_883778 ) ) ( not ( = ?auto_883771 ?auto_883779 ) ) ( not ( = ?auto_883771 ?auto_883784 ) ) ( not ( = ?auto_883770 ?auto_883772 ) ) ( not ( = ?auto_883770 ?auto_883773 ) ) ( not ( = ?auto_883770 ?auto_883774 ) ) ( not ( = ?auto_883770 ?auto_883775 ) ) ( not ( = ?auto_883770 ?auto_883776 ) ) ( not ( = ?auto_883770 ?auto_883777 ) ) ( not ( = ?auto_883770 ?auto_883778 ) ) ( not ( = ?auto_883770 ?auto_883779 ) ) ( not ( = ?auto_883770 ?auto_883784 ) ) ( not ( = ?auto_883772 ?auto_883773 ) ) ( not ( = ?auto_883772 ?auto_883774 ) ) ( not ( = ?auto_883772 ?auto_883775 ) ) ( not ( = ?auto_883772 ?auto_883776 ) ) ( not ( = ?auto_883772 ?auto_883777 ) ) ( not ( = ?auto_883772 ?auto_883778 ) ) ( not ( = ?auto_883772 ?auto_883779 ) ) ( not ( = ?auto_883772 ?auto_883784 ) ) ( not ( = ?auto_883773 ?auto_883774 ) ) ( not ( = ?auto_883773 ?auto_883775 ) ) ( not ( = ?auto_883773 ?auto_883776 ) ) ( not ( = ?auto_883773 ?auto_883777 ) ) ( not ( = ?auto_883773 ?auto_883778 ) ) ( not ( = ?auto_883773 ?auto_883779 ) ) ( not ( = ?auto_883773 ?auto_883784 ) ) ( not ( = ?auto_883774 ?auto_883775 ) ) ( not ( = ?auto_883774 ?auto_883776 ) ) ( not ( = ?auto_883774 ?auto_883777 ) ) ( not ( = ?auto_883774 ?auto_883778 ) ) ( not ( = ?auto_883774 ?auto_883779 ) ) ( not ( = ?auto_883774 ?auto_883784 ) ) ( not ( = ?auto_883775 ?auto_883776 ) ) ( not ( = ?auto_883775 ?auto_883777 ) ) ( not ( = ?auto_883775 ?auto_883778 ) ) ( not ( = ?auto_883775 ?auto_883779 ) ) ( not ( = ?auto_883775 ?auto_883784 ) ) ( not ( = ?auto_883776 ?auto_883777 ) ) ( not ( = ?auto_883776 ?auto_883778 ) ) ( not ( = ?auto_883776 ?auto_883779 ) ) ( not ( = ?auto_883776 ?auto_883784 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_883777 ?auto_883778 ?auto_883779 )
      ( MAKE-12CRATE-VERIFY ?auto_883767 ?auto_883768 ?auto_883769 ?auto_883771 ?auto_883770 ?auto_883772 ?auto_883773 ?auto_883774 ?auto_883775 ?auto_883776 ?auto_883777 ?auto_883778 ?auto_883779 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_883930 - SURFACE
      ?auto_883931 - SURFACE
      ?auto_883932 - SURFACE
      ?auto_883934 - SURFACE
      ?auto_883933 - SURFACE
      ?auto_883935 - SURFACE
      ?auto_883936 - SURFACE
      ?auto_883937 - SURFACE
      ?auto_883938 - SURFACE
      ?auto_883939 - SURFACE
      ?auto_883940 - SURFACE
      ?auto_883941 - SURFACE
      ?auto_883942 - SURFACE
    )
    :vars
    (
      ?auto_883947 - HOIST
      ?auto_883948 - PLACE
      ?auto_883944 - PLACE
      ?auto_883943 - HOIST
      ?auto_883946 - SURFACE
      ?auto_883945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_883947 ?auto_883948 ) ( IS-CRATE ?auto_883942 ) ( not ( = ?auto_883941 ?auto_883942 ) ) ( not ( = ?auto_883940 ?auto_883941 ) ) ( not ( = ?auto_883940 ?auto_883942 ) ) ( not ( = ?auto_883944 ?auto_883948 ) ) ( HOIST-AT ?auto_883943 ?auto_883944 ) ( not ( = ?auto_883947 ?auto_883943 ) ) ( AVAILABLE ?auto_883943 ) ( SURFACE-AT ?auto_883942 ?auto_883944 ) ( ON ?auto_883942 ?auto_883946 ) ( CLEAR ?auto_883942 ) ( not ( = ?auto_883941 ?auto_883946 ) ) ( not ( = ?auto_883942 ?auto_883946 ) ) ( not ( = ?auto_883940 ?auto_883946 ) ) ( TRUCK-AT ?auto_883945 ?auto_883948 ) ( SURFACE-AT ?auto_883940 ?auto_883948 ) ( CLEAR ?auto_883940 ) ( IS-CRATE ?auto_883941 ) ( AVAILABLE ?auto_883947 ) ( IN ?auto_883941 ?auto_883945 ) ( ON ?auto_883931 ?auto_883930 ) ( ON ?auto_883932 ?auto_883931 ) ( ON ?auto_883934 ?auto_883932 ) ( ON ?auto_883933 ?auto_883934 ) ( ON ?auto_883935 ?auto_883933 ) ( ON ?auto_883936 ?auto_883935 ) ( ON ?auto_883937 ?auto_883936 ) ( ON ?auto_883938 ?auto_883937 ) ( ON ?auto_883939 ?auto_883938 ) ( ON ?auto_883940 ?auto_883939 ) ( not ( = ?auto_883930 ?auto_883931 ) ) ( not ( = ?auto_883930 ?auto_883932 ) ) ( not ( = ?auto_883930 ?auto_883934 ) ) ( not ( = ?auto_883930 ?auto_883933 ) ) ( not ( = ?auto_883930 ?auto_883935 ) ) ( not ( = ?auto_883930 ?auto_883936 ) ) ( not ( = ?auto_883930 ?auto_883937 ) ) ( not ( = ?auto_883930 ?auto_883938 ) ) ( not ( = ?auto_883930 ?auto_883939 ) ) ( not ( = ?auto_883930 ?auto_883940 ) ) ( not ( = ?auto_883930 ?auto_883941 ) ) ( not ( = ?auto_883930 ?auto_883942 ) ) ( not ( = ?auto_883930 ?auto_883946 ) ) ( not ( = ?auto_883931 ?auto_883932 ) ) ( not ( = ?auto_883931 ?auto_883934 ) ) ( not ( = ?auto_883931 ?auto_883933 ) ) ( not ( = ?auto_883931 ?auto_883935 ) ) ( not ( = ?auto_883931 ?auto_883936 ) ) ( not ( = ?auto_883931 ?auto_883937 ) ) ( not ( = ?auto_883931 ?auto_883938 ) ) ( not ( = ?auto_883931 ?auto_883939 ) ) ( not ( = ?auto_883931 ?auto_883940 ) ) ( not ( = ?auto_883931 ?auto_883941 ) ) ( not ( = ?auto_883931 ?auto_883942 ) ) ( not ( = ?auto_883931 ?auto_883946 ) ) ( not ( = ?auto_883932 ?auto_883934 ) ) ( not ( = ?auto_883932 ?auto_883933 ) ) ( not ( = ?auto_883932 ?auto_883935 ) ) ( not ( = ?auto_883932 ?auto_883936 ) ) ( not ( = ?auto_883932 ?auto_883937 ) ) ( not ( = ?auto_883932 ?auto_883938 ) ) ( not ( = ?auto_883932 ?auto_883939 ) ) ( not ( = ?auto_883932 ?auto_883940 ) ) ( not ( = ?auto_883932 ?auto_883941 ) ) ( not ( = ?auto_883932 ?auto_883942 ) ) ( not ( = ?auto_883932 ?auto_883946 ) ) ( not ( = ?auto_883934 ?auto_883933 ) ) ( not ( = ?auto_883934 ?auto_883935 ) ) ( not ( = ?auto_883934 ?auto_883936 ) ) ( not ( = ?auto_883934 ?auto_883937 ) ) ( not ( = ?auto_883934 ?auto_883938 ) ) ( not ( = ?auto_883934 ?auto_883939 ) ) ( not ( = ?auto_883934 ?auto_883940 ) ) ( not ( = ?auto_883934 ?auto_883941 ) ) ( not ( = ?auto_883934 ?auto_883942 ) ) ( not ( = ?auto_883934 ?auto_883946 ) ) ( not ( = ?auto_883933 ?auto_883935 ) ) ( not ( = ?auto_883933 ?auto_883936 ) ) ( not ( = ?auto_883933 ?auto_883937 ) ) ( not ( = ?auto_883933 ?auto_883938 ) ) ( not ( = ?auto_883933 ?auto_883939 ) ) ( not ( = ?auto_883933 ?auto_883940 ) ) ( not ( = ?auto_883933 ?auto_883941 ) ) ( not ( = ?auto_883933 ?auto_883942 ) ) ( not ( = ?auto_883933 ?auto_883946 ) ) ( not ( = ?auto_883935 ?auto_883936 ) ) ( not ( = ?auto_883935 ?auto_883937 ) ) ( not ( = ?auto_883935 ?auto_883938 ) ) ( not ( = ?auto_883935 ?auto_883939 ) ) ( not ( = ?auto_883935 ?auto_883940 ) ) ( not ( = ?auto_883935 ?auto_883941 ) ) ( not ( = ?auto_883935 ?auto_883942 ) ) ( not ( = ?auto_883935 ?auto_883946 ) ) ( not ( = ?auto_883936 ?auto_883937 ) ) ( not ( = ?auto_883936 ?auto_883938 ) ) ( not ( = ?auto_883936 ?auto_883939 ) ) ( not ( = ?auto_883936 ?auto_883940 ) ) ( not ( = ?auto_883936 ?auto_883941 ) ) ( not ( = ?auto_883936 ?auto_883942 ) ) ( not ( = ?auto_883936 ?auto_883946 ) ) ( not ( = ?auto_883937 ?auto_883938 ) ) ( not ( = ?auto_883937 ?auto_883939 ) ) ( not ( = ?auto_883937 ?auto_883940 ) ) ( not ( = ?auto_883937 ?auto_883941 ) ) ( not ( = ?auto_883937 ?auto_883942 ) ) ( not ( = ?auto_883937 ?auto_883946 ) ) ( not ( = ?auto_883938 ?auto_883939 ) ) ( not ( = ?auto_883938 ?auto_883940 ) ) ( not ( = ?auto_883938 ?auto_883941 ) ) ( not ( = ?auto_883938 ?auto_883942 ) ) ( not ( = ?auto_883938 ?auto_883946 ) ) ( not ( = ?auto_883939 ?auto_883940 ) ) ( not ( = ?auto_883939 ?auto_883941 ) ) ( not ( = ?auto_883939 ?auto_883942 ) ) ( not ( = ?auto_883939 ?auto_883946 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_883940 ?auto_883941 ?auto_883942 )
      ( MAKE-12CRATE-VERIFY ?auto_883930 ?auto_883931 ?auto_883932 ?auto_883934 ?auto_883933 ?auto_883935 ?auto_883936 ?auto_883937 ?auto_883938 ?auto_883939 ?auto_883940 ?auto_883941 ?auto_883942 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_895479 - SURFACE
      ?auto_895480 - SURFACE
      ?auto_895481 - SURFACE
      ?auto_895483 - SURFACE
      ?auto_895482 - SURFACE
      ?auto_895484 - SURFACE
      ?auto_895485 - SURFACE
      ?auto_895486 - SURFACE
      ?auto_895487 - SURFACE
      ?auto_895488 - SURFACE
      ?auto_895489 - SURFACE
      ?auto_895490 - SURFACE
      ?auto_895491 - SURFACE
      ?auto_895492 - SURFACE
    )
    :vars
    (
      ?auto_895493 - HOIST
      ?auto_895494 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_895493 ?auto_895494 ) ( SURFACE-AT ?auto_895491 ?auto_895494 ) ( CLEAR ?auto_895491 ) ( LIFTING ?auto_895493 ?auto_895492 ) ( IS-CRATE ?auto_895492 ) ( not ( = ?auto_895491 ?auto_895492 ) ) ( ON ?auto_895480 ?auto_895479 ) ( ON ?auto_895481 ?auto_895480 ) ( ON ?auto_895483 ?auto_895481 ) ( ON ?auto_895482 ?auto_895483 ) ( ON ?auto_895484 ?auto_895482 ) ( ON ?auto_895485 ?auto_895484 ) ( ON ?auto_895486 ?auto_895485 ) ( ON ?auto_895487 ?auto_895486 ) ( ON ?auto_895488 ?auto_895487 ) ( ON ?auto_895489 ?auto_895488 ) ( ON ?auto_895490 ?auto_895489 ) ( ON ?auto_895491 ?auto_895490 ) ( not ( = ?auto_895479 ?auto_895480 ) ) ( not ( = ?auto_895479 ?auto_895481 ) ) ( not ( = ?auto_895479 ?auto_895483 ) ) ( not ( = ?auto_895479 ?auto_895482 ) ) ( not ( = ?auto_895479 ?auto_895484 ) ) ( not ( = ?auto_895479 ?auto_895485 ) ) ( not ( = ?auto_895479 ?auto_895486 ) ) ( not ( = ?auto_895479 ?auto_895487 ) ) ( not ( = ?auto_895479 ?auto_895488 ) ) ( not ( = ?auto_895479 ?auto_895489 ) ) ( not ( = ?auto_895479 ?auto_895490 ) ) ( not ( = ?auto_895479 ?auto_895491 ) ) ( not ( = ?auto_895479 ?auto_895492 ) ) ( not ( = ?auto_895480 ?auto_895481 ) ) ( not ( = ?auto_895480 ?auto_895483 ) ) ( not ( = ?auto_895480 ?auto_895482 ) ) ( not ( = ?auto_895480 ?auto_895484 ) ) ( not ( = ?auto_895480 ?auto_895485 ) ) ( not ( = ?auto_895480 ?auto_895486 ) ) ( not ( = ?auto_895480 ?auto_895487 ) ) ( not ( = ?auto_895480 ?auto_895488 ) ) ( not ( = ?auto_895480 ?auto_895489 ) ) ( not ( = ?auto_895480 ?auto_895490 ) ) ( not ( = ?auto_895480 ?auto_895491 ) ) ( not ( = ?auto_895480 ?auto_895492 ) ) ( not ( = ?auto_895481 ?auto_895483 ) ) ( not ( = ?auto_895481 ?auto_895482 ) ) ( not ( = ?auto_895481 ?auto_895484 ) ) ( not ( = ?auto_895481 ?auto_895485 ) ) ( not ( = ?auto_895481 ?auto_895486 ) ) ( not ( = ?auto_895481 ?auto_895487 ) ) ( not ( = ?auto_895481 ?auto_895488 ) ) ( not ( = ?auto_895481 ?auto_895489 ) ) ( not ( = ?auto_895481 ?auto_895490 ) ) ( not ( = ?auto_895481 ?auto_895491 ) ) ( not ( = ?auto_895481 ?auto_895492 ) ) ( not ( = ?auto_895483 ?auto_895482 ) ) ( not ( = ?auto_895483 ?auto_895484 ) ) ( not ( = ?auto_895483 ?auto_895485 ) ) ( not ( = ?auto_895483 ?auto_895486 ) ) ( not ( = ?auto_895483 ?auto_895487 ) ) ( not ( = ?auto_895483 ?auto_895488 ) ) ( not ( = ?auto_895483 ?auto_895489 ) ) ( not ( = ?auto_895483 ?auto_895490 ) ) ( not ( = ?auto_895483 ?auto_895491 ) ) ( not ( = ?auto_895483 ?auto_895492 ) ) ( not ( = ?auto_895482 ?auto_895484 ) ) ( not ( = ?auto_895482 ?auto_895485 ) ) ( not ( = ?auto_895482 ?auto_895486 ) ) ( not ( = ?auto_895482 ?auto_895487 ) ) ( not ( = ?auto_895482 ?auto_895488 ) ) ( not ( = ?auto_895482 ?auto_895489 ) ) ( not ( = ?auto_895482 ?auto_895490 ) ) ( not ( = ?auto_895482 ?auto_895491 ) ) ( not ( = ?auto_895482 ?auto_895492 ) ) ( not ( = ?auto_895484 ?auto_895485 ) ) ( not ( = ?auto_895484 ?auto_895486 ) ) ( not ( = ?auto_895484 ?auto_895487 ) ) ( not ( = ?auto_895484 ?auto_895488 ) ) ( not ( = ?auto_895484 ?auto_895489 ) ) ( not ( = ?auto_895484 ?auto_895490 ) ) ( not ( = ?auto_895484 ?auto_895491 ) ) ( not ( = ?auto_895484 ?auto_895492 ) ) ( not ( = ?auto_895485 ?auto_895486 ) ) ( not ( = ?auto_895485 ?auto_895487 ) ) ( not ( = ?auto_895485 ?auto_895488 ) ) ( not ( = ?auto_895485 ?auto_895489 ) ) ( not ( = ?auto_895485 ?auto_895490 ) ) ( not ( = ?auto_895485 ?auto_895491 ) ) ( not ( = ?auto_895485 ?auto_895492 ) ) ( not ( = ?auto_895486 ?auto_895487 ) ) ( not ( = ?auto_895486 ?auto_895488 ) ) ( not ( = ?auto_895486 ?auto_895489 ) ) ( not ( = ?auto_895486 ?auto_895490 ) ) ( not ( = ?auto_895486 ?auto_895491 ) ) ( not ( = ?auto_895486 ?auto_895492 ) ) ( not ( = ?auto_895487 ?auto_895488 ) ) ( not ( = ?auto_895487 ?auto_895489 ) ) ( not ( = ?auto_895487 ?auto_895490 ) ) ( not ( = ?auto_895487 ?auto_895491 ) ) ( not ( = ?auto_895487 ?auto_895492 ) ) ( not ( = ?auto_895488 ?auto_895489 ) ) ( not ( = ?auto_895488 ?auto_895490 ) ) ( not ( = ?auto_895488 ?auto_895491 ) ) ( not ( = ?auto_895488 ?auto_895492 ) ) ( not ( = ?auto_895489 ?auto_895490 ) ) ( not ( = ?auto_895489 ?auto_895491 ) ) ( not ( = ?auto_895489 ?auto_895492 ) ) ( not ( = ?auto_895490 ?auto_895491 ) ) ( not ( = ?auto_895490 ?auto_895492 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_895491 ?auto_895492 )
      ( MAKE-13CRATE-VERIFY ?auto_895479 ?auto_895480 ?auto_895481 ?auto_895483 ?auto_895482 ?auto_895484 ?auto_895485 ?auto_895486 ?auto_895487 ?auto_895488 ?auto_895489 ?auto_895490 ?auto_895491 ?auto_895492 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_895621 - SURFACE
      ?auto_895622 - SURFACE
      ?auto_895623 - SURFACE
      ?auto_895625 - SURFACE
      ?auto_895624 - SURFACE
      ?auto_895626 - SURFACE
      ?auto_895627 - SURFACE
      ?auto_895628 - SURFACE
      ?auto_895629 - SURFACE
      ?auto_895630 - SURFACE
      ?auto_895631 - SURFACE
      ?auto_895632 - SURFACE
      ?auto_895633 - SURFACE
      ?auto_895634 - SURFACE
    )
    :vars
    (
      ?auto_895636 - HOIST
      ?auto_895635 - PLACE
      ?auto_895637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_895636 ?auto_895635 ) ( SURFACE-AT ?auto_895633 ?auto_895635 ) ( CLEAR ?auto_895633 ) ( IS-CRATE ?auto_895634 ) ( not ( = ?auto_895633 ?auto_895634 ) ) ( TRUCK-AT ?auto_895637 ?auto_895635 ) ( AVAILABLE ?auto_895636 ) ( IN ?auto_895634 ?auto_895637 ) ( ON ?auto_895633 ?auto_895632 ) ( not ( = ?auto_895632 ?auto_895633 ) ) ( not ( = ?auto_895632 ?auto_895634 ) ) ( ON ?auto_895622 ?auto_895621 ) ( ON ?auto_895623 ?auto_895622 ) ( ON ?auto_895625 ?auto_895623 ) ( ON ?auto_895624 ?auto_895625 ) ( ON ?auto_895626 ?auto_895624 ) ( ON ?auto_895627 ?auto_895626 ) ( ON ?auto_895628 ?auto_895627 ) ( ON ?auto_895629 ?auto_895628 ) ( ON ?auto_895630 ?auto_895629 ) ( ON ?auto_895631 ?auto_895630 ) ( ON ?auto_895632 ?auto_895631 ) ( not ( = ?auto_895621 ?auto_895622 ) ) ( not ( = ?auto_895621 ?auto_895623 ) ) ( not ( = ?auto_895621 ?auto_895625 ) ) ( not ( = ?auto_895621 ?auto_895624 ) ) ( not ( = ?auto_895621 ?auto_895626 ) ) ( not ( = ?auto_895621 ?auto_895627 ) ) ( not ( = ?auto_895621 ?auto_895628 ) ) ( not ( = ?auto_895621 ?auto_895629 ) ) ( not ( = ?auto_895621 ?auto_895630 ) ) ( not ( = ?auto_895621 ?auto_895631 ) ) ( not ( = ?auto_895621 ?auto_895632 ) ) ( not ( = ?auto_895621 ?auto_895633 ) ) ( not ( = ?auto_895621 ?auto_895634 ) ) ( not ( = ?auto_895622 ?auto_895623 ) ) ( not ( = ?auto_895622 ?auto_895625 ) ) ( not ( = ?auto_895622 ?auto_895624 ) ) ( not ( = ?auto_895622 ?auto_895626 ) ) ( not ( = ?auto_895622 ?auto_895627 ) ) ( not ( = ?auto_895622 ?auto_895628 ) ) ( not ( = ?auto_895622 ?auto_895629 ) ) ( not ( = ?auto_895622 ?auto_895630 ) ) ( not ( = ?auto_895622 ?auto_895631 ) ) ( not ( = ?auto_895622 ?auto_895632 ) ) ( not ( = ?auto_895622 ?auto_895633 ) ) ( not ( = ?auto_895622 ?auto_895634 ) ) ( not ( = ?auto_895623 ?auto_895625 ) ) ( not ( = ?auto_895623 ?auto_895624 ) ) ( not ( = ?auto_895623 ?auto_895626 ) ) ( not ( = ?auto_895623 ?auto_895627 ) ) ( not ( = ?auto_895623 ?auto_895628 ) ) ( not ( = ?auto_895623 ?auto_895629 ) ) ( not ( = ?auto_895623 ?auto_895630 ) ) ( not ( = ?auto_895623 ?auto_895631 ) ) ( not ( = ?auto_895623 ?auto_895632 ) ) ( not ( = ?auto_895623 ?auto_895633 ) ) ( not ( = ?auto_895623 ?auto_895634 ) ) ( not ( = ?auto_895625 ?auto_895624 ) ) ( not ( = ?auto_895625 ?auto_895626 ) ) ( not ( = ?auto_895625 ?auto_895627 ) ) ( not ( = ?auto_895625 ?auto_895628 ) ) ( not ( = ?auto_895625 ?auto_895629 ) ) ( not ( = ?auto_895625 ?auto_895630 ) ) ( not ( = ?auto_895625 ?auto_895631 ) ) ( not ( = ?auto_895625 ?auto_895632 ) ) ( not ( = ?auto_895625 ?auto_895633 ) ) ( not ( = ?auto_895625 ?auto_895634 ) ) ( not ( = ?auto_895624 ?auto_895626 ) ) ( not ( = ?auto_895624 ?auto_895627 ) ) ( not ( = ?auto_895624 ?auto_895628 ) ) ( not ( = ?auto_895624 ?auto_895629 ) ) ( not ( = ?auto_895624 ?auto_895630 ) ) ( not ( = ?auto_895624 ?auto_895631 ) ) ( not ( = ?auto_895624 ?auto_895632 ) ) ( not ( = ?auto_895624 ?auto_895633 ) ) ( not ( = ?auto_895624 ?auto_895634 ) ) ( not ( = ?auto_895626 ?auto_895627 ) ) ( not ( = ?auto_895626 ?auto_895628 ) ) ( not ( = ?auto_895626 ?auto_895629 ) ) ( not ( = ?auto_895626 ?auto_895630 ) ) ( not ( = ?auto_895626 ?auto_895631 ) ) ( not ( = ?auto_895626 ?auto_895632 ) ) ( not ( = ?auto_895626 ?auto_895633 ) ) ( not ( = ?auto_895626 ?auto_895634 ) ) ( not ( = ?auto_895627 ?auto_895628 ) ) ( not ( = ?auto_895627 ?auto_895629 ) ) ( not ( = ?auto_895627 ?auto_895630 ) ) ( not ( = ?auto_895627 ?auto_895631 ) ) ( not ( = ?auto_895627 ?auto_895632 ) ) ( not ( = ?auto_895627 ?auto_895633 ) ) ( not ( = ?auto_895627 ?auto_895634 ) ) ( not ( = ?auto_895628 ?auto_895629 ) ) ( not ( = ?auto_895628 ?auto_895630 ) ) ( not ( = ?auto_895628 ?auto_895631 ) ) ( not ( = ?auto_895628 ?auto_895632 ) ) ( not ( = ?auto_895628 ?auto_895633 ) ) ( not ( = ?auto_895628 ?auto_895634 ) ) ( not ( = ?auto_895629 ?auto_895630 ) ) ( not ( = ?auto_895629 ?auto_895631 ) ) ( not ( = ?auto_895629 ?auto_895632 ) ) ( not ( = ?auto_895629 ?auto_895633 ) ) ( not ( = ?auto_895629 ?auto_895634 ) ) ( not ( = ?auto_895630 ?auto_895631 ) ) ( not ( = ?auto_895630 ?auto_895632 ) ) ( not ( = ?auto_895630 ?auto_895633 ) ) ( not ( = ?auto_895630 ?auto_895634 ) ) ( not ( = ?auto_895631 ?auto_895632 ) ) ( not ( = ?auto_895631 ?auto_895633 ) ) ( not ( = ?auto_895631 ?auto_895634 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_895632 ?auto_895633 ?auto_895634 )
      ( MAKE-13CRATE-VERIFY ?auto_895621 ?auto_895622 ?auto_895623 ?auto_895625 ?auto_895624 ?auto_895626 ?auto_895627 ?auto_895628 ?auto_895629 ?auto_895630 ?auto_895631 ?auto_895632 ?auto_895633 ?auto_895634 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_895777 - SURFACE
      ?auto_895778 - SURFACE
      ?auto_895779 - SURFACE
      ?auto_895781 - SURFACE
      ?auto_895780 - SURFACE
      ?auto_895782 - SURFACE
      ?auto_895783 - SURFACE
      ?auto_895784 - SURFACE
      ?auto_895785 - SURFACE
      ?auto_895786 - SURFACE
      ?auto_895787 - SURFACE
      ?auto_895788 - SURFACE
      ?auto_895789 - SURFACE
      ?auto_895790 - SURFACE
    )
    :vars
    (
      ?auto_895793 - HOIST
      ?auto_895794 - PLACE
      ?auto_895791 - TRUCK
      ?auto_895792 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_895793 ?auto_895794 ) ( SURFACE-AT ?auto_895789 ?auto_895794 ) ( CLEAR ?auto_895789 ) ( IS-CRATE ?auto_895790 ) ( not ( = ?auto_895789 ?auto_895790 ) ) ( AVAILABLE ?auto_895793 ) ( IN ?auto_895790 ?auto_895791 ) ( ON ?auto_895789 ?auto_895788 ) ( not ( = ?auto_895788 ?auto_895789 ) ) ( not ( = ?auto_895788 ?auto_895790 ) ) ( TRUCK-AT ?auto_895791 ?auto_895792 ) ( not ( = ?auto_895792 ?auto_895794 ) ) ( ON ?auto_895778 ?auto_895777 ) ( ON ?auto_895779 ?auto_895778 ) ( ON ?auto_895781 ?auto_895779 ) ( ON ?auto_895780 ?auto_895781 ) ( ON ?auto_895782 ?auto_895780 ) ( ON ?auto_895783 ?auto_895782 ) ( ON ?auto_895784 ?auto_895783 ) ( ON ?auto_895785 ?auto_895784 ) ( ON ?auto_895786 ?auto_895785 ) ( ON ?auto_895787 ?auto_895786 ) ( ON ?auto_895788 ?auto_895787 ) ( not ( = ?auto_895777 ?auto_895778 ) ) ( not ( = ?auto_895777 ?auto_895779 ) ) ( not ( = ?auto_895777 ?auto_895781 ) ) ( not ( = ?auto_895777 ?auto_895780 ) ) ( not ( = ?auto_895777 ?auto_895782 ) ) ( not ( = ?auto_895777 ?auto_895783 ) ) ( not ( = ?auto_895777 ?auto_895784 ) ) ( not ( = ?auto_895777 ?auto_895785 ) ) ( not ( = ?auto_895777 ?auto_895786 ) ) ( not ( = ?auto_895777 ?auto_895787 ) ) ( not ( = ?auto_895777 ?auto_895788 ) ) ( not ( = ?auto_895777 ?auto_895789 ) ) ( not ( = ?auto_895777 ?auto_895790 ) ) ( not ( = ?auto_895778 ?auto_895779 ) ) ( not ( = ?auto_895778 ?auto_895781 ) ) ( not ( = ?auto_895778 ?auto_895780 ) ) ( not ( = ?auto_895778 ?auto_895782 ) ) ( not ( = ?auto_895778 ?auto_895783 ) ) ( not ( = ?auto_895778 ?auto_895784 ) ) ( not ( = ?auto_895778 ?auto_895785 ) ) ( not ( = ?auto_895778 ?auto_895786 ) ) ( not ( = ?auto_895778 ?auto_895787 ) ) ( not ( = ?auto_895778 ?auto_895788 ) ) ( not ( = ?auto_895778 ?auto_895789 ) ) ( not ( = ?auto_895778 ?auto_895790 ) ) ( not ( = ?auto_895779 ?auto_895781 ) ) ( not ( = ?auto_895779 ?auto_895780 ) ) ( not ( = ?auto_895779 ?auto_895782 ) ) ( not ( = ?auto_895779 ?auto_895783 ) ) ( not ( = ?auto_895779 ?auto_895784 ) ) ( not ( = ?auto_895779 ?auto_895785 ) ) ( not ( = ?auto_895779 ?auto_895786 ) ) ( not ( = ?auto_895779 ?auto_895787 ) ) ( not ( = ?auto_895779 ?auto_895788 ) ) ( not ( = ?auto_895779 ?auto_895789 ) ) ( not ( = ?auto_895779 ?auto_895790 ) ) ( not ( = ?auto_895781 ?auto_895780 ) ) ( not ( = ?auto_895781 ?auto_895782 ) ) ( not ( = ?auto_895781 ?auto_895783 ) ) ( not ( = ?auto_895781 ?auto_895784 ) ) ( not ( = ?auto_895781 ?auto_895785 ) ) ( not ( = ?auto_895781 ?auto_895786 ) ) ( not ( = ?auto_895781 ?auto_895787 ) ) ( not ( = ?auto_895781 ?auto_895788 ) ) ( not ( = ?auto_895781 ?auto_895789 ) ) ( not ( = ?auto_895781 ?auto_895790 ) ) ( not ( = ?auto_895780 ?auto_895782 ) ) ( not ( = ?auto_895780 ?auto_895783 ) ) ( not ( = ?auto_895780 ?auto_895784 ) ) ( not ( = ?auto_895780 ?auto_895785 ) ) ( not ( = ?auto_895780 ?auto_895786 ) ) ( not ( = ?auto_895780 ?auto_895787 ) ) ( not ( = ?auto_895780 ?auto_895788 ) ) ( not ( = ?auto_895780 ?auto_895789 ) ) ( not ( = ?auto_895780 ?auto_895790 ) ) ( not ( = ?auto_895782 ?auto_895783 ) ) ( not ( = ?auto_895782 ?auto_895784 ) ) ( not ( = ?auto_895782 ?auto_895785 ) ) ( not ( = ?auto_895782 ?auto_895786 ) ) ( not ( = ?auto_895782 ?auto_895787 ) ) ( not ( = ?auto_895782 ?auto_895788 ) ) ( not ( = ?auto_895782 ?auto_895789 ) ) ( not ( = ?auto_895782 ?auto_895790 ) ) ( not ( = ?auto_895783 ?auto_895784 ) ) ( not ( = ?auto_895783 ?auto_895785 ) ) ( not ( = ?auto_895783 ?auto_895786 ) ) ( not ( = ?auto_895783 ?auto_895787 ) ) ( not ( = ?auto_895783 ?auto_895788 ) ) ( not ( = ?auto_895783 ?auto_895789 ) ) ( not ( = ?auto_895783 ?auto_895790 ) ) ( not ( = ?auto_895784 ?auto_895785 ) ) ( not ( = ?auto_895784 ?auto_895786 ) ) ( not ( = ?auto_895784 ?auto_895787 ) ) ( not ( = ?auto_895784 ?auto_895788 ) ) ( not ( = ?auto_895784 ?auto_895789 ) ) ( not ( = ?auto_895784 ?auto_895790 ) ) ( not ( = ?auto_895785 ?auto_895786 ) ) ( not ( = ?auto_895785 ?auto_895787 ) ) ( not ( = ?auto_895785 ?auto_895788 ) ) ( not ( = ?auto_895785 ?auto_895789 ) ) ( not ( = ?auto_895785 ?auto_895790 ) ) ( not ( = ?auto_895786 ?auto_895787 ) ) ( not ( = ?auto_895786 ?auto_895788 ) ) ( not ( = ?auto_895786 ?auto_895789 ) ) ( not ( = ?auto_895786 ?auto_895790 ) ) ( not ( = ?auto_895787 ?auto_895788 ) ) ( not ( = ?auto_895787 ?auto_895789 ) ) ( not ( = ?auto_895787 ?auto_895790 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_895788 ?auto_895789 ?auto_895790 )
      ( MAKE-13CRATE-VERIFY ?auto_895777 ?auto_895778 ?auto_895779 ?auto_895781 ?auto_895780 ?auto_895782 ?auto_895783 ?auto_895784 ?auto_895785 ?auto_895786 ?auto_895787 ?auto_895788 ?auto_895789 ?auto_895790 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_895946 - SURFACE
      ?auto_895947 - SURFACE
      ?auto_895948 - SURFACE
      ?auto_895950 - SURFACE
      ?auto_895949 - SURFACE
      ?auto_895951 - SURFACE
      ?auto_895952 - SURFACE
      ?auto_895953 - SURFACE
      ?auto_895954 - SURFACE
      ?auto_895955 - SURFACE
      ?auto_895956 - SURFACE
      ?auto_895957 - SURFACE
      ?auto_895958 - SURFACE
      ?auto_895959 - SURFACE
    )
    :vars
    (
      ?auto_895960 - HOIST
      ?auto_895961 - PLACE
      ?auto_895964 - TRUCK
      ?auto_895962 - PLACE
      ?auto_895963 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_895960 ?auto_895961 ) ( SURFACE-AT ?auto_895958 ?auto_895961 ) ( CLEAR ?auto_895958 ) ( IS-CRATE ?auto_895959 ) ( not ( = ?auto_895958 ?auto_895959 ) ) ( AVAILABLE ?auto_895960 ) ( ON ?auto_895958 ?auto_895957 ) ( not ( = ?auto_895957 ?auto_895958 ) ) ( not ( = ?auto_895957 ?auto_895959 ) ) ( TRUCK-AT ?auto_895964 ?auto_895962 ) ( not ( = ?auto_895962 ?auto_895961 ) ) ( HOIST-AT ?auto_895963 ?auto_895962 ) ( LIFTING ?auto_895963 ?auto_895959 ) ( not ( = ?auto_895960 ?auto_895963 ) ) ( ON ?auto_895947 ?auto_895946 ) ( ON ?auto_895948 ?auto_895947 ) ( ON ?auto_895950 ?auto_895948 ) ( ON ?auto_895949 ?auto_895950 ) ( ON ?auto_895951 ?auto_895949 ) ( ON ?auto_895952 ?auto_895951 ) ( ON ?auto_895953 ?auto_895952 ) ( ON ?auto_895954 ?auto_895953 ) ( ON ?auto_895955 ?auto_895954 ) ( ON ?auto_895956 ?auto_895955 ) ( ON ?auto_895957 ?auto_895956 ) ( not ( = ?auto_895946 ?auto_895947 ) ) ( not ( = ?auto_895946 ?auto_895948 ) ) ( not ( = ?auto_895946 ?auto_895950 ) ) ( not ( = ?auto_895946 ?auto_895949 ) ) ( not ( = ?auto_895946 ?auto_895951 ) ) ( not ( = ?auto_895946 ?auto_895952 ) ) ( not ( = ?auto_895946 ?auto_895953 ) ) ( not ( = ?auto_895946 ?auto_895954 ) ) ( not ( = ?auto_895946 ?auto_895955 ) ) ( not ( = ?auto_895946 ?auto_895956 ) ) ( not ( = ?auto_895946 ?auto_895957 ) ) ( not ( = ?auto_895946 ?auto_895958 ) ) ( not ( = ?auto_895946 ?auto_895959 ) ) ( not ( = ?auto_895947 ?auto_895948 ) ) ( not ( = ?auto_895947 ?auto_895950 ) ) ( not ( = ?auto_895947 ?auto_895949 ) ) ( not ( = ?auto_895947 ?auto_895951 ) ) ( not ( = ?auto_895947 ?auto_895952 ) ) ( not ( = ?auto_895947 ?auto_895953 ) ) ( not ( = ?auto_895947 ?auto_895954 ) ) ( not ( = ?auto_895947 ?auto_895955 ) ) ( not ( = ?auto_895947 ?auto_895956 ) ) ( not ( = ?auto_895947 ?auto_895957 ) ) ( not ( = ?auto_895947 ?auto_895958 ) ) ( not ( = ?auto_895947 ?auto_895959 ) ) ( not ( = ?auto_895948 ?auto_895950 ) ) ( not ( = ?auto_895948 ?auto_895949 ) ) ( not ( = ?auto_895948 ?auto_895951 ) ) ( not ( = ?auto_895948 ?auto_895952 ) ) ( not ( = ?auto_895948 ?auto_895953 ) ) ( not ( = ?auto_895948 ?auto_895954 ) ) ( not ( = ?auto_895948 ?auto_895955 ) ) ( not ( = ?auto_895948 ?auto_895956 ) ) ( not ( = ?auto_895948 ?auto_895957 ) ) ( not ( = ?auto_895948 ?auto_895958 ) ) ( not ( = ?auto_895948 ?auto_895959 ) ) ( not ( = ?auto_895950 ?auto_895949 ) ) ( not ( = ?auto_895950 ?auto_895951 ) ) ( not ( = ?auto_895950 ?auto_895952 ) ) ( not ( = ?auto_895950 ?auto_895953 ) ) ( not ( = ?auto_895950 ?auto_895954 ) ) ( not ( = ?auto_895950 ?auto_895955 ) ) ( not ( = ?auto_895950 ?auto_895956 ) ) ( not ( = ?auto_895950 ?auto_895957 ) ) ( not ( = ?auto_895950 ?auto_895958 ) ) ( not ( = ?auto_895950 ?auto_895959 ) ) ( not ( = ?auto_895949 ?auto_895951 ) ) ( not ( = ?auto_895949 ?auto_895952 ) ) ( not ( = ?auto_895949 ?auto_895953 ) ) ( not ( = ?auto_895949 ?auto_895954 ) ) ( not ( = ?auto_895949 ?auto_895955 ) ) ( not ( = ?auto_895949 ?auto_895956 ) ) ( not ( = ?auto_895949 ?auto_895957 ) ) ( not ( = ?auto_895949 ?auto_895958 ) ) ( not ( = ?auto_895949 ?auto_895959 ) ) ( not ( = ?auto_895951 ?auto_895952 ) ) ( not ( = ?auto_895951 ?auto_895953 ) ) ( not ( = ?auto_895951 ?auto_895954 ) ) ( not ( = ?auto_895951 ?auto_895955 ) ) ( not ( = ?auto_895951 ?auto_895956 ) ) ( not ( = ?auto_895951 ?auto_895957 ) ) ( not ( = ?auto_895951 ?auto_895958 ) ) ( not ( = ?auto_895951 ?auto_895959 ) ) ( not ( = ?auto_895952 ?auto_895953 ) ) ( not ( = ?auto_895952 ?auto_895954 ) ) ( not ( = ?auto_895952 ?auto_895955 ) ) ( not ( = ?auto_895952 ?auto_895956 ) ) ( not ( = ?auto_895952 ?auto_895957 ) ) ( not ( = ?auto_895952 ?auto_895958 ) ) ( not ( = ?auto_895952 ?auto_895959 ) ) ( not ( = ?auto_895953 ?auto_895954 ) ) ( not ( = ?auto_895953 ?auto_895955 ) ) ( not ( = ?auto_895953 ?auto_895956 ) ) ( not ( = ?auto_895953 ?auto_895957 ) ) ( not ( = ?auto_895953 ?auto_895958 ) ) ( not ( = ?auto_895953 ?auto_895959 ) ) ( not ( = ?auto_895954 ?auto_895955 ) ) ( not ( = ?auto_895954 ?auto_895956 ) ) ( not ( = ?auto_895954 ?auto_895957 ) ) ( not ( = ?auto_895954 ?auto_895958 ) ) ( not ( = ?auto_895954 ?auto_895959 ) ) ( not ( = ?auto_895955 ?auto_895956 ) ) ( not ( = ?auto_895955 ?auto_895957 ) ) ( not ( = ?auto_895955 ?auto_895958 ) ) ( not ( = ?auto_895955 ?auto_895959 ) ) ( not ( = ?auto_895956 ?auto_895957 ) ) ( not ( = ?auto_895956 ?auto_895958 ) ) ( not ( = ?auto_895956 ?auto_895959 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_895957 ?auto_895958 ?auto_895959 )
      ( MAKE-13CRATE-VERIFY ?auto_895946 ?auto_895947 ?auto_895948 ?auto_895950 ?auto_895949 ?auto_895951 ?auto_895952 ?auto_895953 ?auto_895954 ?auto_895955 ?auto_895956 ?auto_895957 ?auto_895958 ?auto_895959 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_896128 - SURFACE
      ?auto_896129 - SURFACE
      ?auto_896130 - SURFACE
      ?auto_896132 - SURFACE
      ?auto_896131 - SURFACE
      ?auto_896133 - SURFACE
      ?auto_896134 - SURFACE
      ?auto_896135 - SURFACE
      ?auto_896136 - SURFACE
      ?auto_896137 - SURFACE
      ?auto_896138 - SURFACE
      ?auto_896139 - SURFACE
      ?auto_896140 - SURFACE
      ?auto_896141 - SURFACE
    )
    :vars
    (
      ?auto_896146 - HOIST
      ?auto_896142 - PLACE
      ?auto_896144 - TRUCK
      ?auto_896143 - PLACE
      ?auto_896147 - HOIST
      ?auto_896145 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_896146 ?auto_896142 ) ( SURFACE-AT ?auto_896140 ?auto_896142 ) ( CLEAR ?auto_896140 ) ( IS-CRATE ?auto_896141 ) ( not ( = ?auto_896140 ?auto_896141 ) ) ( AVAILABLE ?auto_896146 ) ( ON ?auto_896140 ?auto_896139 ) ( not ( = ?auto_896139 ?auto_896140 ) ) ( not ( = ?auto_896139 ?auto_896141 ) ) ( TRUCK-AT ?auto_896144 ?auto_896143 ) ( not ( = ?auto_896143 ?auto_896142 ) ) ( HOIST-AT ?auto_896147 ?auto_896143 ) ( not ( = ?auto_896146 ?auto_896147 ) ) ( AVAILABLE ?auto_896147 ) ( SURFACE-AT ?auto_896141 ?auto_896143 ) ( ON ?auto_896141 ?auto_896145 ) ( CLEAR ?auto_896141 ) ( not ( = ?auto_896140 ?auto_896145 ) ) ( not ( = ?auto_896141 ?auto_896145 ) ) ( not ( = ?auto_896139 ?auto_896145 ) ) ( ON ?auto_896129 ?auto_896128 ) ( ON ?auto_896130 ?auto_896129 ) ( ON ?auto_896132 ?auto_896130 ) ( ON ?auto_896131 ?auto_896132 ) ( ON ?auto_896133 ?auto_896131 ) ( ON ?auto_896134 ?auto_896133 ) ( ON ?auto_896135 ?auto_896134 ) ( ON ?auto_896136 ?auto_896135 ) ( ON ?auto_896137 ?auto_896136 ) ( ON ?auto_896138 ?auto_896137 ) ( ON ?auto_896139 ?auto_896138 ) ( not ( = ?auto_896128 ?auto_896129 ) ) ( not ( = ?auto_896128 ?auto_896130 ) ) ( not ( = ?auto_896128 ?auto_896132 ) ) ( not ( = ?auto_896128 ?auto_896131 ) ) ( not ( = ?auto_896128 ?auto_896133 ) ) ( not ( = ?auto_896128 ?auto_896134 ) ) ( not ( = ?auto_896128 ?auto_896135 ) ) ( not ( = ?auto_896128 ?auto_896136 ) ) ( not ( = ?auto_896128 ?auto_896137 ) ) ( not ( = ?auto_896128 ?auto_896138 ) ) ( not ( = ?auto_896128 ?auto_896139 ) ) ( not ( = ?auto_896128 ?auto_896140 ) ) ( not ( = ?auto_896128 ?auto_896141 ) ) ( not ( = ?auto_896128 ?auto_896145 ) ) ( not ( = ?auto_896129 ?auto_896130 ) ) ( not ( = ?auto_896129 ?auto_896132 ) ) ( not ( = ?auto_896129 ?auto_896131 ) ) ( not ( = ?auto_896129 ?auto_896133 ) ) ( not ( = ?auto_896129 ?auto_896134 ) ) ( not ( = ?auto_896129 ?auto_896135 ) ) ( not ( = ?auto_896129 ?auto_896136 ) ) ( not ( = ?auto_896129 ?auto_896137 ) ) ( not ( = ?auto_896129 ?auto_896138 ) ) ( not ( = ?auto_896129 ?auto_896139 ) ) ( not ( = ?auto_896129 ?auto_896140 ) ) ( not ( = ?auto_896129 ?auto_896141 ) ) ( not ( = ?auto_896129 ?auto_896145 ) ) ( not ( = ?auto_896130 ?auto_896132 ) ) ( not ( = ?auto_896130 ?auto_896131 ) ) ( not ( = ?auto_896130 ?auto_896133 ) ) ( not ( = ?auto_896130 ?auto_896134 ) ) ( not ( = ?auto_896130 ?auto_896135 ) ) ( not ( = ?auto_896130 ?auto_896136 ) ) ( not ( = ?auto_896130 ?auto_896137 ) ) ( not ( = ?auto_896130 ?auto_896138 ) ) ( not ( = ?auto_896130 ?auto_896139 ) ) ( not ( = ?auto_896130 ?auto_896140 ) ) ( not ( = ?auto_896130 ?auto_896141 ) ) ( not ( = ?auto_896130 ?auto_896145 ) ) ( not ( = ?auto_896132 ?auto_896131 ) ) ( not ( = ?auto_896132 ?auto_896133 ) ) ( not ( = ?auto_896132 ?auto_896134 ) ) ( not ( = ?auto_896132 ?auto_896135 ) ) ( not ( = ?auto_896132 ?auto_896136 ) ) ( not ( = ?auto_896132 ?auto_896137 ) ) ( not ( = ?auto_896132 ?auto_896138 ) ) ( not ( = ?auto_896132 ?auto_896139 ) ) ( not ( = ?auto_896132 ?auto_896140 ) ) ( not ( = ?auto_896132 ?auto_896141 ) ) ( not ( = ?auto_896132 ?auto_896145 ) ) ( not ( = ?auto_896131 ?auto_896133 ) ) ( not ( = ?auto_896131 ?auto_896134 ) ) ( not ( = ?auto_896131 ?auto_896135 ) ) ( not ( = ?auto_896131 ?auto_896136 ) ) ( not ( = ?auto_896131 ?auto_896137 ) ) ( not ( = ?auto_896131 ?auto_896138 ) ) ( not ( = ?auto_896131 ?auto_896139 ) ) ( not ( = ?auto_896131 ?auto_896140 ) ) ( not ( = ?auto_896131 ?auto_896141 ) ) ( not ( = ?auto_896131 ?auto_896145 ) ) ( not ( = ?auto_896133 ?auto_896134 ) ) ( not ( = ?auto_896133 ?auto_896135 ) ) ( not ( = ?auto_896133 ?auto_896136 ) ) ( not ( = ?auto_896133 ?auto_896137 ) ) ( not ( = ?auto_896133 ?auto_896138 ) ) ( not ( = ?auto_896133 ?auto_896139 ) ) ( not ( = ?auto_896133 ?auto_896140 ) ) ( not ( = ?auto_896133 ?auto_896141 ) ) ( not ( = ?auto_896133 ?auto_896145 ) ) ( not ( = ?auto_896134 ?auto_896135 ) ) ( not ( = ?auto_896134 ?auto_896136 ) ) ( not ( = ?auto_896134 ?auto_896137 ) ) ( not ( = ?auto_896134 ?auto_896138 ) ) ( not ( = ?auto_896134 ?auto_896139 ) ) ( not ( = ?auto_896134 ?auto_896140 ) ) ( not ( = ?auto_896134 ?auto_896141 ) ) ( not ( = ?auto_896134 ?auto_896145 ) ) ( not ( = ?auto_896135 ?auto_896136 ) ) ( not ( = ?auto_896135 ?auto_896137 ) ) ( not ( = ?auto_896135 ?auto_896138 ) ) ( not ( = ?auto_896135 ?auto_896139 ) ) ( not ( = ?auto_896135 ?auto_896140 ) ) ( not ( = ?auto_896135 ?auto_896141 ) ) ( not ( = ?auto_896135 ?auto_896145 ) ) ( not ( = ?auto_896136 ?auto_896137 ) ) ( not ( = ?auto_896136 ?auto_896138 ) ) ( not ( = ?auto_896136 ?auto_896139 ) ) ( not ( = ?auto_896136 ?auto_896140 ) ) ( not ( = ?auto_896136 ?auto_896141 ) ) ( not ( = ?auto_896136 ?auto_896145 ) ) ( not ( = ?auto_896137 ?auto_896138 ) ) ( not ( = ?auto_896137 ?auto_896139 ) ) ( not ( = ?auto_896137 ?auto_896140 ) ) ( not ( = ?auto_896137 ?auto_896141 ) ) ( not ( = ?auto_896137 ?auto_896145 ) ) ( not ( = ?auto_896138 ?auto_896139 ) ) ( not ( = ?auto_896138 ?auto_896140 ) ) ( not ( = ?auto_896138 ?auto_896141 ) ) ( not ( = ?auto_896138 ?auto_896145 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_896139 ?auto_896140 ?auto_896141 )
      ( MAKE-13CRATE-VERIFY ?auto_896128 ?auto_896129 ?auto_896130 ?auto_896132 ?auto_896131 ?auto_896133 ?auto_896134 ?auto_896135 ?auto_896136 ?auto_896137 ?auto_896138 ?auto_896139 ?auto_896140 ?auto_896141 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_896311 - SURFACE
      ?auto_896312 - SURFACE
      ?auto_896313 - SURFACE
      ?auto_896315 - SURFACE
      ?auto_896314 - SURFACE
      ?auto_896316 - SURFACE
      ?auto_896317 - SURFACE
      ?auto_896318 - SURFACE
      ?auto_896319 - SURFACE
      ?auto_896320 - SURFACE
      ?auto_896321 - SURFACE
      ?auto_896322 - SURFACE
      ?auto_896323 - SURFACE
      ?auto_896324 - SURFACE
    )
    :vars
    (
      ?auto_896328 - HOIST
      ?auto_896326 - PLACE
      ?auto_896330 - PLACE
      ?auto_896325 - HOIST
      ?auto_896327 - SURFACE
      ?auto_896329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_896328 ?auto_896326 ) ( SURFACE-AT ?auto_896323 ?auto_896326 ) ( CLEAR ?auto_896323 ) ( IS-CRATE ?auto_896324 ) ( not ( = ?auto_896323 ?auto_896324 ) ) ( AVAILABLE ?auto_896328 ) ( ON ?auto_896323 ?auto_896322 ) ( not ( = ?auto_896322 ?auto_896323 ) ) ( not ( = ?auto_896322 ?auto_896324 ) ) ( not ( = ?auto_896330 ?auto_896326 ) ) ( HOIST-AT ?auto_896325 ?auto_896330 ) ( not ( = ?auto_896328 ?auto_896325 ) ) ( AVAILABLE ?auto_896325 ) ( SURFACE-AT ?auto_896324 ?auto_896330 ) ( ON ?auto_896324 ?auto_896327 ) ( CLEAR ?auto_896324 ) ( not ( = ?auto_896323 ?auto_896327 ) ) ( not ( = ?auto_896324 ?auto_896327 ) ) ( not ( = ?auto_896322 ?auto_896327 ) ) ( TRUCK-AT ?auto_896329 ?auto_896326 ) ( ON ?auto_896312 ?auto_896311 ) ( ON ?auto_896313 ?auto_896312 ) ( ON ?auto_896315 ?auto_896313 ) ( ON ?auto_896314 ?auto_896315 ) ( ON ?auto_896316 ?auto_896314 ) ( ON ?auto_896317 ?auto_896316 ) ( ON ?auto_896318 ?auto_896317 ) ( ON ?auto_896319 ?auto_896318 ) ( ON ?auto_896320 ?auto_896319 ) ( ON ?auto_896321 ?auto_896320 ) ( ON ?auto_896322 ?auto_896321 ) ( not ( = ?auto_896311 ?auto_896312 ) ) ( not ( = ?auto_896311 ?auto_896313 ) ) ( not ( = ?auto_896311 ?auto_896315 ) ) ( not ( = ?auto_896311 ?auto_896314 ) ) ( not ( = ?auto_896311 ?auto_896316 ) ) ( not ( = ?auto_896311 ?auto_896317 ) ) ( not ( = ?auto_896311 ?auto_896318 ) ) ( not ( = ?auto_896311 ?auto_896319 ) ) ( not ( = ?auto_896311 ?auto_896320 ) ) ( not ( = ?auto_896311 ?auto_896321 ) ) ( not ( = ?auto_896311 ?auto_896322 ) ) ( not ( = ?auto_896311 ?auto_896323 ) ) ( not ( = ?auto_896311 ?auto_896324 ) ) ( not ( = ?auto_896311 ?auto_896327 ) ) ( not ( = ?auto_896312 ?auto_896313 ) ) ( not ( = ?auto_896312 ?auto_896315 ) ) ( not ( = ?auto_896312 ?auto_896314 ) ) ( not ( = ?auto_896312 ?auto_896316 ) ) ( not ( = ?auto_896312 ?auto_896317 ) ) ( not ( = ?auto_896312 ?auto_896318 ) ) ( not ( = ?auto_896312 ?auto_896319 ) ) ( not ( = ?auto_896312 ?auto_896320 ) ) ( not ( = ?auto_896312 ?auto_896321 ) ) ( not ( = ?auto_896312 ?auto_896322 ) ) ( not ( = ?auto_896312 ?auto_896323 ) ) ( not ( = ?auto_896312 ?auto_896324 ) ) ( not ( = ?auto_896312 ?auto_896327 ) ) ( not ( = ?auto_896313 ?auto_896315 ) ) ( not ( = ?auto_896313 ?auto_896314 ) ) ( not ( = ?auto_896313 ?auto_896316 ) ) ( not ( = ?auto_896313 ?auto_896317 ) ) ( not ( = ?auto_896313 ?auto_896318 ) ) ( not ( = ?auto_896313 ?auto_896319 ) ) ( not ( = ?auto_896313 ?auto_896320 ) ) ( not ( = ?auto_896313 ?auto_896321 ) ) ( not ( = ?auto_896313 ?auto_896322 ) ) ( not ( = ?auto_896313 ?auto_896323 ) ) ( not ( = ?auto_896313 ?auto_896324 ) ) ( not ( = ?auto_896313 ?auto_896327 ) ) ( not ( = ?auto_896315 ?auto_896314 ) ) ( not ( = ?auto_896315 ?auto_896316 ) ) ( not ( = ?auto_896315 ?auto_896317 ) ) ( not ( = ?auto_896315 ?auto_896318 ) ) ( not ( = ?auto_896315 ?auto_896319 ) ) ( not ( = ?auto_896315 ?auto_896320 ) ) ( not ( = ?auto_896315 ?auto_896321 ) ) ( not ( = ?auto_896315 ?auto_896322 ) ) ( not ( = ?auto_896315 ?auto_896323 ) ) ( not ( = ?auto_896315 ?auto_896324 ) ) ( not ( = ?auto_896315 ?auto_896327 ) ) ( not ( = ?auto_896314 ?auto_896316 ) ) ( not ( = ?auto_896314 ?auto_896317 ) ) ( not ( = ?auto_896314 ?auto_896318 ) ) ( not ( = ?auto_896314 ?auto_896319 ) ) ( not ( = ?auto_896314 ?auto_896320 ) ) ( not ( = ?auto_896314 ?auto_896321 ) ) ( not ( = ?auto_896314 ?auto_896322 ) ) ( not ( = ?auto_896314 ?auto_896323 ) ) ( not ( = ?auto_896314 ?auto_896324 ) ) ( not ( = ?auto_896314 ?auto_896327 ) ) ( not ( = ?auto_896316 ?auto_896317 ) ) ( not ( = ?auto_896316 ?auto_896318 ) ) ( not ( = ?auto_896316 ?auto_896319 ) ) ( not ( = ?auto_896316 ?auto_896320 ) ) ( not ( = ?auto_896316 ?auto_896321 ) ) ( not ( = ?auto_896316 ?auto_896322 ) ) ( not ( = ?auto_896316 ?auto_896323 ) ) ( not ( = ?auto_896316 ?auto_896324 ) ) ( not ( = ?auto_896316 ?auto_896327 ) ) ( not ( = ?auto_896317 ?auto_896318 ) ) ( not ( = ?auto_896317 ?auto_896319 ) ) ( not ( = ?auto_896317 ?auto_896320 ) ) ( not ( = ?auto_896317 ?auto_896321 ) ) ( not ( = ?auto_896317 ?auto_896322 ) ) ( not ( = ?auto_896317 ?auto_896323 ) ) ( not ( = ?auto_896317 ?auto_896324 ) ) ( not ( = ?auto_896317 ?auto_896327 ) ) ( not ( = ?auto_896318 ?auto_896319 ) ) ( not ( = ?auto_896318 ?auto_896320 ) ) ( not ( = ?auto_896318 ?auto_896321 ) ) ( not ( = ?auto_896318 ?auto_896322 ) ) ( not ( = ?auto_896318 ?auto_896323 ) ) ( not ( = ?auto_896318 ?auto_896324 ) ) ( not ( = ?auto_896318 ?auto_896327 ) ) ( not ( = ?auto_896319 ?auto_896320 ) ) ( not ( = ?auto_896319 ?auto_896321 ) ) ( not ( = ?auto_896319 ?auto_896322 ) ) ( not ( = ?auto_896319 ?auto_896323 ) ) ( not ( = ?auto_896319 ?auto_896324 ) ) ( not ( = ?auto_896319 ?auto_896327 ) ) ( not ( = ?auto_896320 ?auto_896321 ) ) ( not ( = ?auto_896320 ?auto_896322 ) ) ( not ( = ?auto_896320 ?auto_896323 ) ) ( not ( = ?auto_896320 ?auto_896324 ) ) ( not ( = ?auto_896320 ?auto_896327 ) ) ( not ( = ?auto_896321 ?auto_896322 ) ) ( not ( = ?auto_896321 ?auto_896323 ) ) ( not ( = ?auto_896321 ?auto_896324 ) ) ( not ( = ?auto_896321 ?auto_896327 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_896322 ?auto_896323 ?auto_896324 )
      ( MAKE-13CRATE-VERIFY ?auto_896311 ?auto_896312 ?auto_896313 ?auto_896315 ?auto_896314 ?auto_896316 ?auto_896317 ?auto_896318 ?auto_896319 ?auto_896320 ?auto_896321 ?auto_896322 ?auto_896323 ?auto_896324 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_896494 - SURFACE
      ?auto_896495 - SURFACE
      ?auto_896496 - SURFACE
      ?auto_896498 - SURFACE
      ?auto_896497 - SURFACE
      ?auto_896499 - SURFACE
      ?auto_896500 - SURFACE
      ?auto_896501 - SURFACE
      ?auto_896502 - SURFACE
      ?auto_896503 - SURFACE
      ?auto_896504 - SURFACE
      ?auto_896505 - SURFACE
      ?auto_896506 - SURFACE
      ?auto_896507 - SURFACE
    )
    :vars
    (
      ?auto_896508 - HOIST
      ?auto_896509 - PLACE
      ?auto_896510 - PLACE
      ?auto_896512 - HOIST
      ?auto_896511 - SURFACE
      ?auto_896513 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_896508 ?auto_896509 ) ( IS-CRATE ?auto_896507 ) ( not ( = ?auto_896506 ?auto_896507 ) ) ( not ( = ?auto_896505 ?auto_896506 ) ) ( not ( = ?auto_896505 ?auto_896507 ) ) ( not ( = ?auto_896510 ?auto_896509 ) ) ( HOIST-AT ?auto_896512 ?auto_896510 ) ( not ( = ?auto_896508 ?auto_896512 ) ) ( AVAILABLE ?auto_896512 ) ( SURFACE-AT ?auto_896507 ?auto_896510 ) ( ON ?auto_896507 ?auto_896511 ) ( CLEAR ?auto_896507 ) ( not ( = ?auto_896506 ?auto_896511 ) ) ( not ( = ?auto_896507 ?auto_896511 ) ) ( not ( = ?auto_896505 ?auto_896511 ) ) ( TRUCK-AT ?auto_896513 ?auto_896509 ) ( SURFACE-AT ?auto_896505 ?auto_896509 ) ( CLEAR ?auto_896505 ) ( LIFTING ?auto_896508 ?auto_896506 ) ( IS-CRATE ?auto_896506 ) ( ON ?auto_896495 ?auto_896494 ) ( ON ?auto_896496 ?auto_896495 ) ( ON ?auto_896498 ?auto_896496 ) ( ON ?auto_896497 ?auto_896498 ) ( ON ?auto_896499 ?auto_896497 ) ( ON ?auto_896500 ?auto_896499 ) ( ON ?auto_896501 ?auto_896500 ) ( ON ?auto_896502 ?auto_896501 ) ( ON ?auto_896503 ?auto_896502 ) ( ON ?auto_896504 ?auto_896503 ) ( ON ?auto_896505 ?auto_896504 ) ( not ( = ?auto_896494 ?auto_896495 ) ) ( not ( = ?auto_896494 ?auto_896496 ) ) ( not ( = ?auto_896494 ?auto_896498 ) ) ( not ( = ?auto_896494 ?auto_896497 ) ) ( not ( = ?auto_896494 ?auto_896499 ) ) ( not ( = ?auto_896494 ?auto_896500 ) ) ( not ( = ?auto_896494 ?auto_896501 ) ) ( not ( = ?auto_896494 ?auto_896502 ) ) ( not ( = ?auto_896494 ?auto_896503 ) ) ( not ( = ?auto_896494 ?auto_896504 ) ) ( not ( = ?auto_896494 ?auto_896505 ) ) ( not ( = ?auto_896494 ?auto_896506 ) ) ( not ( = ?auto_896494 ?auto_896507 ) ) ( not ( = ?auto_896494 ?auto_896511 ) ) ( not ( = ?auto_896495 ?auto_896496 ) ) ( not ( = ?auto_896495 ?auto_896498 ) ) ( not ( = ?auto_896495 ?auto_896497 ) ) ( not ( = ?auto_896495 ?auto_896499 ) ) ( not ( = ?auto_896495 ?auto_896500 ) ) ( not ( = ?auto_896495 ?auto_896501 ) ) ( not ( = ?auto_896495 ?auto_896502 ) ) ( not ( = ?auto_896495 ?auto_896503 ) ) ( not ( = ?auto_896495 ?auto_896504 ) ) ( not ( = ?auto_896495 ?auto_896505 ) ) ( not ( = ?auto_896495 ?auto_896506 ) ) ( not ( = ?auto_896495 ?auto_896507 ) ) ( not ( = ?auto_896495 ?auto_896511 ) ) ( not ( = ?auto_896496 ?auto_896498 ) ) ( not ( = ?auto_896496 ?auto_896497 ) ) ( not ( = ?auto_896496 ?auto_896499 ) ) ( not ( = ?auto_896496 ?auto_896500 ) ) ( not ( = ?auto_896496 ?auto_896501 ) ) ( not ( = ?auto_896496 ?auto_896502 ) ) ( not ( = ?auto_896496 ?auto_896503 ) ) ( not ( = ?auto_896496 ?auto_896504 ) ) ( not ( = ?auto_896496 ?auto_896505 ) ) ( not ( = ?auto_896496 ?auto_896506 ) ) ( not ( = ?auto_896496 ?auto_896507 ) ) ( not ( = ?auto_896496 ?auto_896511 ) ) ( not ( = ?auto_896498 ?auto_896497 ) ) ( not ( = ?auto_896498 ?auto_896499 ) ) ( not ( = ?auto_896498 ?auto_896500 ) ) ( not ( = ?auto_896498 ?auto_896501 ) ) ( not ( = ?auto_896498 ?auto_896502 ) ) ( not ( = ?auto_896498 ?auto_896503 ) ) ( not ( = ?auto_896498 ?auto_896504 ) ) ( not ( = ?auto_896498 ?auto_896505 ) ) ( not ( = ?auto_896498 ?auto_896506 ) ) ( not ( = ?auto_896498 ?auto_896507 ) ) ( not ( = ?auto_896498 ?auto_896511 ) ) ( not ( = ?auto_896497 ?auto_896499 ) ) ( not ( = ?auto_896497 ?auto_896500 ) ) ( not ( = ?auto_896497 ?auto_896501 ) ) ( not ( = ?auto_896497 ?auto_896502 ) ) ( not ( = ?auto_896497 ?auto_896503 ) ) ( not ( = ?auto_896497 ?auto_896504 ) ) ( not ( = ?auto_896497 ?auto_896505 ) ) ( not ( = ?auto_896497 ?auto_896506 ) ) ( not ( = ?auto_896497 ?auto_896507 ) ) ( not ( = ?auto_896497 ?auto_896511 ) ) ( not ( = ?auto_896499 ?auto_896500 ) ) ( not ( = ?auto_896499 ?auto_896501 ) ) ( not ( = ?auto_896499 ?auto_896502 ) ) ( not ( = ?auto_896499 ?auto_896503 ) ) ( not ( = ?auto_896499 ?auto_896504 ) ) ( not ( = ?auto_896499 ?auto_896505 ) ) ( not ( = ?auto_896499 ?auto_896506 ) ) ( not ( = ?auto_896499 ?auto_896507 ) ) ( not ( = ?auto_896499 ?auto_896511 ) ) ( not ( = ?auto_896500 ?auto_896501 ) ) ( not ( = ?auto_896500 ?auto_896502 ) ) ( not ( = ?auto_896500 ?auto_896503 ) ) ( not ( = ?auto_896500 ?auto_896504 ) ) ( not ( = ?auto_896500 ?auto_896505 ) ) ( not ( = ?auto_896500 ?auto_896506 ) ) ( not ( = ?auto_896500 ?auto_896507 ) ) ( not ( = ?auto_896500 ?auto_896511 ) ) ( not ( = ?auto_896501 ?auto_896502 ) ) ( not ( = ?auto_896501 ?auto_896503 ) ) ( not ( = ?auto_896501 ?auto_896504 ) ) ( not ( = ?auto_896501 ?auto_896505 ) ) ( not ( = ?auto_896501 ?auto_896506 ) ) ( not ( = ?auto_896501 ?auto_896507 ) ) ( not ( = ?auto_896501 ?auto_896511 ) ) ( not ( = ?auto_896502 ?auto_896503 ) ) ( not ( = ?auto_896502 ?auto_896504 ) ) ( not ( = ?auto_896502 ?auto_896505 ) ) ( not ( = ?auto_896502 ?auto_896506 ) ) ( not ( = ?auto_896502 ?auto_896507 ) ) ( not ( = ?auto_896502 ?auto_896511 ) ) ( not ( = ?auto_896503 ?auto_896504 ) ) ( not ( = ?auto_896503 ?auto_896505 ) ) ( not ( = ?auto_896503 ?auto_896506 ) ) ( not ( = ?auto_896503 ?auto_896507 ) ) ( not ( = ?auto_896503 ?auto_896511 ) ) ( not ( = ?auto_896504 ?auto_896505 ) ) ( not ( = ?auto_896504 ?auto_896506 ) ) ( not ( = ?auto_896504 ?auto_896507 ) ) ( not ( = ?auto_896504 ?auto_896511 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_896505 ?auto_896506 ?auto_896507 )
      ( MAKE-13CRATE-VERIFY ?auto_896494 ?auto_896495 ?auto_896496 ?auto_896498 ?auto_896497 ?auto_896499 ?auto_896500 ?auto_896501 ?auto_896502 ?auto_896503 ?auto_896504 ?auto_896505 ?auto_896506 ?auto_896507 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_896677 - SURFACE
      ?auto_896678 - SURFACE
      ?auto_896679 - SURFACE
      ?auto_896681 - SURFACE
      ?auto_896680 - SURFACE
      ?auto_896682 - SURFACE
      ?auto_896683 - SURFACE
      ?auto_896684 - SURFACE
      ?auto_896685 - SURFACE
      ?auto_896686 - SURFACE
      ?auto_896687 - SURFACE
      ?auto_896688 - SURFACE
      ?auto_896689 - SURFACE
      ?auto_896690 - SURFACE
    )
    :vars
    (
      ?auto_896692 - HOIST
      ?auto_896696 - PLACE
      ?auto_896694 - PLACE
      ?auto_896695 - HOIST
      ?auto_896693 - SURFACE
      ?auto_896691 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_896692 ?auto_896696 ) ( IS-CRATE ?auto_896690 ) ( not ( = ?auto_896689 ?auto_896690 ) ) ( not ( = ?auto_896688 ?auto_896689 ) ) ( not ( = ?auto_896688 ?auto_896690 ) ) ( not ( = ?auto_896694 ?auto_896696 ) ) ( HOIST-AT ?auto_896695 ?auto_896694 ) ( not ( = ?auto_896692 ?auto_896695 ) ) ( AVAILABLE ?auto_896695 ) ( SURFACE-AT ?auto_896690 ?auto_896694 ) ( ON ?auto_896690 ?auto_896693 ) ( CLEAR ?auto_896690 ) ( not ( = ?auto_896689 ?auto_896693 ) ) ( not ( = ?auto_896690 ?auto_896693 ) ) ( not ( = ?auto_896688 ?auto_896693 ) ) ( TRUCK-AT ?auto_896691 ?auto_896696 ) ( SURFACE-AT ?auto_896688 ?auto_896696 ) ( CLEAR ?auto_896688 ) ( IS-CRATE ?auto_896689 ) ( AVAILABLE ?auto_896692 ) ( IN ?auto_896689 ?auto_896691 ) ( ON ?auto_896678 ?auto_896677 ) ( ON ?auto_896679 ?auto_896678 ) ( ON ?auto_896681 ?auto_896679 ) ( ON ?auto_896680 ?auto_896681 ) ( ON ?auto_896682 ?auto_896680 ) ( ON ?auto_896683 ?auto_896682 ) ( ON ?auto_896684 ?auto_896683 ) ( ON ?auto_896685 ?auto_896684 ) ( ON ?auto_896686 ?auto_896685 ) ( ON ?auto_896687 ?auto_896686 ) ( ON ?auto_896688 ?auto_896687 ) ( not ( = ?auto_896677 ?auto_896678 ) ) ( not ( = ?auto_896677 ?auto_896679 ) ) ( not ( = ?auto_896677 ?auto_896681 ) ) ( not ( = ?auto_896677 ?auto_896680 ) ) ( not ( = ?auto_896677 ?auto_896682 ) ) ( not ( = ?auto_896677 ?auto_896683 ) ) ( not ( = ?auto_896677 ?auto_896684 ) ) ( not ( = ?auto_896677 ?auto_896685 ) ) ( not ( = ?auto_896677 ?auto_896686 ) ) ( not ( = ?auto_896677 ?auto_896687 ) ) ( not ( = ?auto_896677 ?auto_896688 ) ) ( not ( = ?auto_896677 ?auto_896689 ) ) ( not ( = ?auto_896677 ?auto_896690 ) ) ( not ( = ?auto_896677 ?auto_896693 ) ) ( not ( = ?auto_896678 ?auto_896679 ) ) ( not ( = ?auto_896678 ?auto_896681 ) ) ( not ( = ?auto_896678 ?auto_896680 ) ) ( not ( = ?auto_896678 ?auto_896682 ) ) ( not ( = ?auto_896678 ?auto_896683 ) ) ( not ( = ?auto_896678 ?auto_896684 ) ) ( not ( = ?auto_896678 ?auto_896685 ) ) ( not ( = ?auto_896678 ?auto_896686 ) ) ( not ( = ?auto_896678 ?auto_896687 ) ) ( not ( = ?auto_896678 ?auto_896688 ) ) ( not ( = ?auto_896678 ?auto_896689 ) ) ( not ( = ?auto_896678 ?auto_896690 ) ) ( not ( = ?auto_896678 ?auto_896693 ) ) ( not ( = ?auto_896679 ?auto_896681 ) ) ( not ( = ?auto_896679 ?auto_896680 ) ) ( not ( = ?auto_896679 ?auto_896682 ) ) ( not ( = ?auto_896679 ?auto_896683 ) ) ( not ( = ?auto_896679 ?auto_896684 ) ) ( not ( = ?auto_896679 ?auto_896685 ) ) ( not ( = ?auto_896679 ?auto_896686 ) ) ( not ( = ?auto_896679 ?auto_896687 ) ) ( not ( = ?auto_896679 ?auto_896688 ) ) ( not ( = ?auto_896679 ?auto_896689 ) ) ( not ( = ?auto_896679 ?auto_896690 ) ) ( not ( = ?auto_896679 ?auto_896693 ) ) ( not ( = ?auto_896681 ?auto_896680 ) ) ( not ( = ?auto_896681 ?auto_896682 ) ) ( not ( = ?auto_896681 ?auto_896683 ) ) ( not ( = ?auto_896681 ?auto_896684 ) ) ( not ( = ?auto_896681 ?auto_896685 ) ) ( not ( = ?auto_896681 ?auto_896686 ) ) ( not ( = ?auto_896681 ?auto_896687 ) ) ( not ( = ?auto_896681 ?auto_896688 ) ) ( not ( = ?auto_896681 ?auto_896689 ) ) ( not ( = ?auto_896681 ?auto_896690 ) ) ( not ( = ?auto_896681 ?auto_896693 ) ) ( not ( = ?auto_896680 ?auto_896682 ) ) ( not ( = ?auto_896680 ?auto_896683 ) ) ( not ( = ?auto_896680 ?auto_896684 ) ) ( not ( = ?auto_896680 ?auto_896685 ) ) ( not ( = ?auto_896680 ?auto_896686 ) ) ( not ( = ?auto_896680 ?auto_896687 ) ) ( not ( = ?auto_896680 ?auto_896688 ) ) ( not ( = ?auto_896680 ?auto_896689 ) ) ( not ( = ?auto_896680 ?auto_896690 ) ) ( not ( = ?auto_896680 ?auto_896693 ) ) ( not ( = ?auto_896682 ?auto_896683 ) ) ( not ( = ?auto_896682 ?auto_896684 ) ) ( not ( = ?auto_896682 ?auto_896685 ) ) ( not ( = ?auto_896682 ?auto_896686 ) ) ( not ( = ?auto_896682 ?auto_896687 ) ) ( not ( = ?auto_896682 ?auto_896688 ) ) ( not ( = ?auto_896682 ?auto_896689 ) ) ( not ( = ?auto_896682 ?auto_896690 ) ) ( not ( = ?auto_896682 ?auto_896693 ) ) ( not ( = ?auto_896683 ?auto_896684 ) ) ( not ( = ?auto_896683 ?auto_896685 ) ) ( not ( = ?auto_896683 ?auto_896686 ) ) ( not ( = ?auto_896683 ?auto_896687 ) ) ( not ( = ?auto_896683 ?auto_896688 ) ) ( not ( = ?auto_896683 ?auto_896689 ) ) ( not ( = ?auto_896683 ?auto_896690 ) ) ( not ( = ?auto_896683 ?auto_896693 ) ) ( not ( = ?auto_896684 ?auto_896685 ) ) ( not ( = ?auto_896684 ?auto_896686 ) ) ( not ( = ?auto_896684 ?auto_896687 ) ) ( not ( = ?auto_896684 ?auto_896688 ) ) ( not ( = ?auto_896684 ?auto_896689 ) ) ( not ( = ?auto_896684 ?auto_896690 ) ) ( not ( = ?auto_896684 ?auto_896693 ) ) ( not ( = ?auto_896685 ?auto_896686 ) ) ( not ( = ?auto_896685 ?auto_896687 ) ) ( not ( = ?auto_896685 ?auto_896688 ) ) ( not ( = ?auto_896685 ?auto_896689 ) ) ( not ( = ?auto_896685 ?auto_896690 ) ) ( not ( = ?auto_896685 ?auto_896693 ) ) ( not ( = ?auto_896686 ?auto_896687 ) ) ( not ( = ?auto_896686 ?auto_896688 ) ) ( not ( = ?auto_896686 ?auto_896689 ) ) ( not ( = ?auto_896686 ?auto_896690 ) ) ( not ( = ?auto_896686 ?auto_896693 ) ) ( not ( = ?auto_896687 ?auto_896688 ) ) ( not ( = ?auto_896687 ?auto_896689 ) ) ( not ( = ?auto_896687 ?auto_896690 ) ) ( not ( = ?auto_896687 ?auto_896693 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_896688 ?auto_896689 ?auto_896690 )
      ( MAKE-13CRATE-VERIFY ?auto_896677 ?auto_896678 ?auto_896679 ?auto_896681 ?auto_896680 ?auto_896682 ?auto_896683 ?auto_896684 ?auto_896685 ?auto_896686 ?auto_896687 ?auto_896688 ?auto_896689 ?auto_896690 ) )
  )

)

