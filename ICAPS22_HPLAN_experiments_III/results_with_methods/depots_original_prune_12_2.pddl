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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693830 - SURFACE
      ?auto_693831 - SURFACE
    )
    :vars
    (
      ?auto_693832 - HOIST
      ?auto_693833 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693832 ?auto_693833 ) ( SURFACE-AT ?auto_693830 ?auto_693833 ) ( CLEAR ?auto_693830 ) ( LIFTING ?auto_693832 ?auto_693831 ) ( IS-CRATE ?auto_693831 ) ( not ( = ?auto_693830 ?auto_693831 ) ) )
    :subtasks
    ( ( !DROP ?auto_693832 ?auto_693831 ?auto_693830 ?auto_693833 )
      ( MAKE-1CRATE-VERIFY ?auto_693830 ?auto_693831 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693834 - SURFACE
      ?auto_693835 - SURFACE
    )
    :vars
    (
      ?auto_693836 - HOIST
      ?auto_693837 - PLACE
      ?auto_693838 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693836 ?auto_693837 ) ( SURFACE-AT ?auto_693834 ?auto_693837 ) ( CLEAR ?auto_693834 ) ( IS-CRATE ?auto_693835 ) ( not ( = ?auto_693834 ?auto_693835 ) ) ( TRUCK-AT ?auto_693838 ?auto_693837 ) ( AVAILABLE ?auto_693836 ) ( IN ?auto_693835 ?auto_693838 ) )
    :subtasks
    ( ( !UNLOAD ?auto_693836 ?auto_693835 ?auto_693838 ?auto_693837 )
      ( MAKE-1CRATE ?auto_693834 ?auto_693835 )
      ( MAKE-1CRATE-VERIFY ?auto_693834 ?auto_693835 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693839 - SURFACE
      ?auto_693840 - SURFACE
    )
    :vars
    (
      ?auto_693843 - HOIST
      ?auto_693842 - PLACE
      ?auto_693841 - TRUCK
      ?auto_693844 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693843 ?auto_693842 ) ( SURFACE-AT ?auto_693839 ?auto_693842 ) ( CLEAR ?auto_693839 ) ( IS-CRATE ?auto_693840 ) ( not ( = ?auto_693839 ?auto_693840 ) ) ( AVAILABLE ?auto_693843 ) ( IN ?auto_693840 ?auto_693841 ) ( TRUCK-AT ?auto_693841 ?auto_693844 ) ( not ( = ?auto_693844 ?auto_693842 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_693841 ?auto_693844 ?auto_693842 )
      ( MAKE-1CRATE ?auto_693839 ?auto_693840 )
      ( MAKE-1CRATE-VERIFY ?auto_693839 ?auto_693840 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693845 - SURFACE
      ?auto_693846 - SURFACE
    )
    :vars
    (
      ?auto_693849 - HOIST
      ?auto_693850 - PLACE
      ?auto_693847 - TRUCK
      ?auto_693848 - PLACE
      ?auto_693851 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_693849 ?auto_693850 ) ( SURFACE-AT ?auto_693845 ?auto_693850 ) ( CLEAR ?auto_693845 ) ( IS-CRATE ?auto_693846 ) ( not ( = ?auto_693845 ?auto_693846 ) ) ( AVAILABLE ?auto_693849 ) ( TRUCK-AT ?auto_693847 ?auto_693848 ) ( not ( = ?auto_693848 ?auto_693850 ) ) ( HOIST-AT ?auto_693851 ?auto_693848 ) ( LIFTING ?auto_693851 ?auto_693846 ) ( not ( = ?auto_693849 ?auto_693851 ) ) )
    :subtasks
    ( ( !LOAD ?auto_693851 ?auto_693846 ?auto_693847 ?auto_693848 )
      ( MAKE-1CRATE ?auto_693845 ?auto_693846 )
      ( MAKE-1CRATE-VERIFY ?auto_693845 ?auto_693846 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693852 - SURFACE
      ?auto_693853 - SURFACE
    )
    :vars
    (
      ?auto_693858 - HOIST
      ?auto_693856 - PLACE
      ?auto_693854 - TRUCK
      ?auto_693855 - PLACE
      ?auto_693857 - HOIST
      ?auto_693859 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693858 ?auto_693856 ) ( SURFACE-AT ?auto_693852 ?auto_693856 ) ( CLEAR ?auto_693852 ) ( IS-CRATE ?auto_693853 ) ( not ( = ?auto_693852 ?auto_693853 ) ) ( AVAILABLE ?auto_693858 ) ( TRUCK-AT ?auto_693854 ?auto_693855 ) ( not ( = ?auto_693855 ?auto_693856 ) ) ( HOIST-AT ?auto_693857 ?auto_693855 ) ( not ( = ?auto_693858 ?auto_693857 ) ) ( AVAILABLE ?auto_693857 ) ( SURFACE-AT ?auto_693853 ?auto_693855 ) ( ON ?auto_693853 ?auto_693859 ) ( CLEAR ?auto_693853 ) ( not ( = ?auto_693852 ?auto_693859 ) ) ( not ( = ?auto_693853 ?auto_693859 ) ) )
    :subtasks
    ( ( !LIFT ?auto_693857 ?auto_693853 ?auto_693859 ?auto_693855 )
      ( MAKE-1CRATE ?auto_693852 ?auto_693853 )
      ( MAKE-1CRATE-VERIFY ?auto_693852 ?auto_693853 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693860 - SURFACE
      ?auto_693861 - SURFACE
    )
    :vars
    (
      ?auto_693866 - HOIST
      ?auto_693864 - PLACE
      ?auto_693863 - PLACE
      ?auto_693865 - HOIST
      ?auto_693862 - SURFACE
      ?auto_693867 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693866 ?auto_693864 ) ( SURFACE-AT ?auto_693860 ?auto_693864 ) ( CLEAR ?auto_693860 ) ( IS-CRATE ?auto_693861 ) ( not ( = ?auto_693860 ?auto_693861 ) ) ( AVAILABLE ?auto_693866 ) ( not ( = ?auto_693863 ?auto_693864 ) ) ( HOIST-AT ?auto_693865 ?auto_693863 ) ( not ( = ?auto_693866 ?auto_693865 ) ) ( AVAILABLE ?auto_693865 ) ( SURFACE-AT ?auto_693861 ?auto_693863 ) ( ON ?auto_693861 ?auto_693862 ) ( CLEAR ?auto_693861 ) ( not ( = ?auto_693860 ?auto_693862 ) ) ( not ( = ?auto_693861 ?auto_693862 ) ) ( TRUCK-AT ?auto_693867 ?auto_693864 ) )
    :subtasks
    ( ( !DRIVE ?auto_693867 ?auto_693864 ?auto_693863 )
      ( MAKE-1CRATE ?auto_693860 ?auto_693861 )
      ( MAKE-1CRATE-VERIFY ?auto_693860 ?auto_693861 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_693877 - SURFACE
      ?auto_693878 - SURFACE
      ?auto_693879 - SURFACE
    )
    :vars
    (
      ?auto_693881 - HOIST
      ?auto_693880 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693881 ?auto_693880 ) ( SURFACE-AT ?auto_693878 ?auto_693880 ) ( CLEAR ?auto_693878 ) ( LIFTING ?auto_693881 ?auto_693879 ) ( IS-CRATE ?auto_693879 ) ( not ( = ?auto_693878 ?auto_693879 ) ) ( ON ?auto_693878 ?auto_693877 ) ( not ( = ?auto_693877 ?auto_693878 ) ) ( not ( = ?auto_693877 ?auto_693879 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693878 ?auto_693879 )
      ( MAKE-2CRATE-VERIFY ?auto_693877 ?auto_693878 ?auto_693879 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_693887 - SURFACE
      ?auto_693888 - SURFACE
      ?auto_693889 - SURFACE
    )
    :vars
    (
      ?auto_693891 - HOIST
      ?auto_693890 - PLACE
      ?auto_693892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693891 ?auto_693890 ) ( SURFACE-AT ?auto_693888 ?auto_693890 ) ( CLEAR ?auto_693888 ) ( IS-CRATE ?auto_693889 ) ( not ( = ?auto_693888 ?auto_693889 ) ) ( TRUCK-AT ?auto_693892 ?auto_693890 ) ( AVAILABLE ?auto_693891 ) ( IN ?auto_693889 ?auto_693892 ) ( ON ?auto_693888 ?auto_693887 ) ( not ( = ?auto_693887 ?auto_693888 ) ) ( not ( = ?auto_693887 ?auto_693889 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693888 ?auto_693889 )
      ( MAKE-2CRATE-VERIFY ?auto_693887 ?auto_693888 ?auto_693889 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693893 - SURFACE
      ?auto_693894 - SURFACE
    )
    :vars
    (
      ?auto_693897 - HOIST
      ?auto_693896 - PLACE
      ?auto_693898 - TRUCK
      ?auto_693895 - SURFACE
      ?auto_693899 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693897 ?auto_693896 ) ( SURFACE-AT ?auto_693893 ?auto_693896 ) ( CLEAR ?auto_693893 ) ( IS-CRATE ?auto_693894 ) ( not ( = ?auto_693893 ?auto_693894 ) ) ( AVAILABLE ?auto_693897 ) ( IN ?auto_693894 ?auto_693898 ) ( ON ?auto_693893 ?auto_693895 ) ( not ( = ?auto_693895 ?auto_693893 ) ) ( not ( = ?auto_693895 ?auto_693894 ) ) ( TRUCK-AT ?auto_693898 ?auto_693899 ) ( not ( = ?auto_693899 ?auto_693896 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_693898 ?auto_693899 ?auto_693896 )
      ( MAKE-2CRATE ?auto_693895 ?auto_693893 ?auto_693894 )
      ( MAKE-1CRATE-VERIFY ?auto_693893 ?auto_693894 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_693900 - SURFACE
      ?auto_693901 - SURFACE
      ?auto_693902 - SURFACE
    )
    :vars
    (
      ?auto_693905 - HOIST
      ?auto_693903 - PLACE
      ?auto_693906 - TRUCK
      ?auto_693904 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693905 ?auto_693903 ) ( SURFACE-AT ?auto_693901 ?auto_693903 ) ( CLEAR ?auto_693901 ) ( IS-CRATE ?auto_693902 ) ( not ( = ?auto_693901 ?auto_693902 ) ) ( AVAILABLE ?auto_693905 ) ( IN ?auto_693902 ?auto_693906 ) ( ON ?auto_693901 ?auto_693900 ) ( not ( = ?auto_693900 ?auto_693901 ) ) ( not ( = ?auto_693900 ?auto_693902 ) ) ( TRUCK-AT ?auto_693906 ?auto_693904 ) ( not ( = ?auto_693904 ?auto_693903 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693901 ?auto_693902 )
      ( MAKE-2CRATE-VERIFY ?auto_693900 ?auto_693901 ?auto_693902 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693907 - SURFACE
      ?auto_693908 - SURFACE
    )
    :vars
    (
      ?auto_693909 - HOIST
      ?auto_693912 - PLACE
      ?auto_693913 - SURFACE
      ?auto_693910 - TRUCK
      ?auto_693911 - PLACE
      ?auto_693914 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_693909 ?auto_693912 ) ( SURFACE-AT ?auto_693907 ?auto_693912 ) ( CLEAR ?auto_693907 ) ( IS-CRATE ?auto_693908 ) ( not ( = ?auto_693907 ?auto_693908 ) ) ( AVAILABLE ?auto_693909 ) ( ON ?auto_693907 ?auto_693913 ) ( not ( = ?auto_693913 ?auto_693907 ) ) ( not ( = ?auto_693913 ?auto_693908 ) ) ( TRUCK-AT ?auto_693910 ?auto_693911 ) ( not ( = ?auto_693911 ?auto_693912 ) ) ( HOIST-AT ?auto_693914 ?auto_693911 ) ( LIFTING ?auto_693914 ?auto_693908 ) ( not ( = ?auto_693909 ?auto_693914 ) ) )
    :subtasks
    ( ( !LOAD ?auto_693914 ?auto_693908 ?auto_693910 ?auto_693911 )
      ( MAKE-2CRATE ?auto_693913 ?auto_693907 ?auto_693908 )
      ( MAKE-1CRATE-VERIFY ?auto_693907 ?auto_693908 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_693915 - SURFACE
      ?auto_693916 - SURFACE
      ?auto_693917 - SURFACE
    )
    :vars
    (
      ?auto_693918 - HOIST
      ?auto_693922 - PLACE
      ?auto_693919 - TRUCK
      ?auto_693920 - PLACE
      ?auto_693921 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_693918 ?auto_693922 ) ( SURFACE-AT ?auto_693916 ?auto_693922 ) ( CLEAR ?auto_693916 ) ( IS-CRATE ?auto_693917 ) ( not ( = ?auto_693916 ?auto_693917 ) ) ( AVAILABLE ?auto_693918 ) ( ON ?auto_693916 ?auto_693915 ) ( not ( = ?auto_693915 ?auto_693916 ) ) ( not ( = ?auto_693915 ?auto_693917 ) ) ( TRUCK-AT ?auto_693919 ?auto_693920 ) ( not ( = ?auto_693920 ?auto_693922 ) ) ( HOIST-AT ?auto_693921 ?auto_693920 ) ( LIFTING ?auto_693921 ?auto_693917 ) ( not ( = ?auto_693918 ?auto_693921 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693916 ?auto_693917 )
      ( MAKE-2CRATE-VERIFY ?auto_693915 ?auto_693916 ?auto_693917 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693923 - SURFACE
      ?auto_693924 - SURFACE
    )
    :vars
    (
      ?auto_693929 - HOIST
      ?auto_693928 - PLACE
      ?auto_693927 - SURFACE
      ?auto_693925 - TRUCK
      ?auto_693930 - PLACE
      ?auto_693926 - HOIST
      ?auto_693931 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693929 ?auto_693928 ) ( SURFACE-AT ?auto_693923 ?auto_693928 ) ( CLEAR ?auto_693923 ) ( IS-CRATE ?auto_693924 ) ( not ( = ?auto_693923 ?auto_693924 ) ) ( AVAILABLE ?auto_693929 ) ( ON ?auto_693923 ?auto_693927 ) ( not ( = ?auto_693927 ?auto_693923 ) ) ( not ( = ?auto_693927 ?auto_693924 ) ) ( TRUCK-AT ?auto_693925 ?auto_693930 ) ( not ( = ?auto_693930 ?auto_693928 ) ) ( HOIST-AT ?auto_693926 ?auto_693930 ) ( not ( = ?auto_693929 ?auto_693926 ) ) ( AVAILABLE ?auto_693926 ) ( SURFACE-AT ?auto_693924 ?auto_693930 ) ( ON ?auto_693924 ?auto_693931 ) ( CLEAR ?auto_693924 ) ( not ( = ?auto_693923 ?auto_693931 ) ) ( not ( = ?auto_693924 ?auto_693931 ) ) ( not ( = ?auto_693927 ?auto_693931 ) ) )
    :subtasks
    ( ( !LIFT ?auto_693926 ?auto_693924 ?auto_693931 ?auto_693930 )
      ( MAKE-2CRATE ?auto_693927 ?auto_693923 ?auto_693924 )
      ( MAKE-1CRATE-VERIFY ?auto_693923 ?auto_693924 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_693932 - SURFACE
      ?auto_693933 - SURFACE
      ?auto_693934 - SURFACE
    )
    :vars
    (
      ?auto_693936 - HOIST
      ?auto_693938 - PLACE
      ?auto_693935 - TRUCK
      ?auto_693940 - PLACE
      ?auto_693937 - HOIST
      ?auto_693939 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_693936 ?auto_693938 ) ( SURFACE-AT ?auto_693933 ?auto_693938 ) ( CLEAR ?auto_693933 ) ( IS-CRATE ?auto_693934 ) ( not ( = ?auto_693933 ?auto_693934 ) ) ( AVAILABLE ?auto_693936 ) ( ON ?auto_693933 ?auto_693932 ) ( not ( = ?auto_693932 ?auto_693933 ) ) ( not ( = ?auto_693932 ?auto_693934 ) ) ( TRUCK-AT ?auto_693935 ?auto_693940 ) ( not ( = ?auto_693940 ?auto_693938 ) ) ( HOIST-AT ?auto_693937 ?auto_693940 ) ( not ( = ?auto_693936 ?auto_693937 ) ) ( AVAILABLE ?auto_693937 ) ( SURFACE-AT ?auto_693934 ?auto_693940 ) ( ON ?auto_693934 ?auto_693939 ) ( CLEAR ?auto_693934 ) ( not ( = ?auto_693933 ?auto_693939 ) ) ( not ( = ?auto_693934 ?auto_693939 ) ) ( not ( = ?auto_693932 ?auto_693939 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693933 ?auto_693934 )
      ( MAKE-2CRATE-VERIFY ?auto_693932 ?auto_693933 ?auto_693934 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693941 - SURFACE
      ?auto_693942 - SURFACE
    )
    :vars
    (
      ?auto_693945 - HOIST
      ?auto_693948 - PLACE
      ?auto_693949 - SURFACE
      ?auto_693943 - PLACE
      ?auto_693946 - HOIST
      ?auto_693944 - SURFACE
      ?auto_693947 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693945 ?auto_693948 ) ( SURFACE-AT ?auto_693941 ?auto_693948 ) ( CLEAR ?auto_693941 ) ( IS-CRATE ?auto_693942 ) ( not ( = ?auto_693941 ?auto_693942 ) ) ( AVAILABLE ?auto_693945 ) ( ON ?auto_693941 ?auto_693949 ) ( not ( = ?auto_693949 ?auto_693941 ) ) ( not ( = ?auto_693949 ?auto_693942 ) ) ( not ( = ?auto_693943 ?auto_693948 ) ) ( HOIST-AT ?auto_693946 ?auto_693943 ) ( not ( = ?auto_693945 ?auto_693946 ) ) ( AVAILABLE ?auto_693946 ) ( SURFACE-AT ?auto_693942 ?auto_693943 ) ( ON ?auto_693942 ?auto_693944 ) ( CLEAR ?auto_693942 ) ( not ( = ?auto_693941 ?auto_693944 ) ) ( not ( = ?auto_693942 ?auto_693944 ) ) ( not ( = ?auto_693949 ?auto_693944 ) ) ( TRUCK-AT ?auto_693947 ?auto_693948 ) )
    :subtasks
    ( ( !DRIVE ?auto_693947 ?auto_693948 ?auto_693943 )
      ( MAKE-2CRATE ?auto_693949 ?auto_693941 ?auto_693942 )
      ( MAKE-1CRATE-VERIFY ?auto_693941 ?auto_693942 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_693950 - SURFACE
      ?auto_693951 - SURFACE
      ?auto_693952 - SURFACE
    )
    :vars
    (
      ?auto_693953 - HOIST
      ?auto_693954 - PLACE
      ?auto_693958 - PLACE
      ?auto_693957 - HOIST
      ?auto_693955 - SURFACE
      ?auto_693956 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693953 ?auto_693954 ) ( SURFACE-AT ?auto_693951 ?auto_693954 ) ( CLEAR ?auto_693951 ) ( IS-CRATE ?auto_693952 ) ( not ( = ?auto_693951 ?auto_693952 ) ) ( AVAILABLE ?auto_693953 ) ( ON ?auto_693951 ?auto_693950 ) ( not ( = ?auto_693950 ?auto_693951 ) ) ( not ( = ?auto_693950 ?auto_693952 ) ) ( not ( = ?auto_693958 ?auto_693954 ) ) ( HOIST-AT ?auto_693957 ?auto_693958 ) ( not ( = ?auto_693953 ?auto_693957 ) ) ( AVAILABLE ?auto_693957 ) ( SURFACE-AT ?auto_693952 ?auto_693958 ) ( ON ?auto_693952 ?auto_693955 ) ( CLEAR ?auto_693952 ) ( not ( = ?auto_693951 ?auto_693955 ) ) ( not ( = ?auto_693952 ?auto_693955 ) ) ( not ( = ?auto_693950 ?auto_693955 ) ) ( TRUCK-AT ?auto_693956 ?auto_693954 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693951 ?auto_693952 )
      ( MAKE-2CRATE-VERIFY ?auto_693950 ?auto_693951 ?auto_693952 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693959 - SURFACE
      ?auto_693960 - SURFACE
    )
    :vars
    (
      ?auto_693964 - HOIST
      ?auto_693962 - PLACE
      ?auto_693961 - SURFACE
      ?auto_693965 - PLACE
      ?auto_693966 - HOIST
      ?auto_693963 - SURFACE
      ?auto_693967 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693964 ?auto_693962 ) ( IS-CRATE ?auto_693960 ) ( not ( = ?auto_693959 ?auto_693960 ) ) ( not ( = ?auto_693961 ?auto_693959 ) ) ( not ( = ?auto_693961 ?auto_693960 ) ) ( not ( = ?auto_693965 ?auto_693962 ) ) ( HOIST-AT ?auto_693966 ?auto_693965 ) ( not ( = ?auto_693964 ?auto_693966 ) ) ( AVAILABLE ?auto_693966 ) ( SURFACE-AT ?auto_693960 ?auto_693965 ) ( ON ?auto_693960 ?auto_693963 ) ( CLEAR ?auto_693960 ) ( not ( = ?auto_693959 ?auto_693963 ) ) ( not ( = ?auto_693960 ?auto_693963 ) ) ( not ( = ?auto_693961 ?auto_693963 ) ) ( TRUCK-AT ?auto_693967 ?auto_693962 ) ( SURFACE-AT ?auto_693961 ?auto_693962 ) ( CLEAR ?auto_693961 ) ( LIFTING ?auto_693964 ?auto_693959 ) ( IS-CRATE ?auto_693959 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693961 ?auto_693959 )
      ( MAKE-2CRATE ?auto_693961 ?auto_693959 ?auto_693960 )
      ( MAKE-1CRATE-VERIFY ?auto_693959 ?auto_693960 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_693968 - SURFACE
      ?auto_693969 - SURFACE
      ?auto_693970 - SURFACE
    )
    :vars
    (
      ?auto_693973 - HOIST
      ?auto_693971 - PLACE
      ?auto_693974 - PLACE
      ?auto_693976 - HOIST
      ?auto_693972 - SURFACE
      ?auto_693975 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693973 ?auto_693971 ) ( IS-CRATE ?auto_693970 ) ( not ( = ?auto_693969 ?auto_693970 ) ) ( not ( = ?auto_693968 ?auto_693969 ) ) ( not ( = ?auto_693968 ?auto_693970 ) ) ( not ( = ?auto_693974 ?auto_693971 ) ) ( HOIST-AT ?auto_693976 ?auto_693974 ) ( not ( = ?auto_693973 ?auto_693976 ) ) ( AVAILABLE ?auto_693976 ) ( SURFACE-AT ?auto_693970 ?auto_693974 ) ( ON ?auto_693970 ?auto_693972 ) ( CLEAR ?auto_693970 ) ( not ( = ?auto_693969 ?auto_693972 ) ) ( not ( = ?auto_693970 ?auto_693972 ) ) ( not ( = ?auto_693968 ?auto_693972 ) ) ( TRUCK-AT ?auto_693975 ?auto_693971 ) ( SURFACE-AT ?auto_693968 ?auto_693971 ) ( CLEAR ?auto_693968 ) ( LIFTING ?auto_693973 ?auto_693969 ) ( IS-CRATE ?auto_693969 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693969 ?auto_693970 )
      ( MAKE-2CRATE-VERIFY ?auto_693968 ?auto_693969 ?auto_693970 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693977 - SURFACE
      ?auto_693978 - SURFACE
    )
    :vars
    (
      ?auto_693979 - HOIST
      ?auto_693983 - PLACE
      ?auto_693985 - SURFACE
      ?auto_693981 - PLACE
      ?auto_693982 - HOIST
      ?auto_693980 - SURFACE
      ?auto_693984 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693979 ?auto_693983 ) ( IS-CRATE ?auto_693978 ) ( not ( = ?auto_693977 ?auto_693978 ) ) ( not ( = ?auto_693985 ?auto_693977 ) ) ( not ( = ?auto_693985 ?auto_693978 ) ) ( not ( = ?auto_693981 ?auto_693983 ) ) ( HOIST-AT ?auto_693982 ?auto_693981 ) ( not ( = ?auto_693979 ?auto_693982 ) ) ( AVAILABLE ?auto_693982 ) ( SURFACE-AT ?auto_693978 ?auto_693981 ) ( ON ?auto_693978 ?auto_693980 ) ( CLEAR ?auto_693978 ) ( not ( = ?auto_693977 ?auto_693980 ) ) ( not ( = ?auto_693978 ?auto_693980 ) ) ( not ( = ?auto_693985 ?auto_693980 ) ) ( TRUCK-AT ?auto_693984 ?auto_693983 ) ( SURFACE-AT ?auto_693985 ?auto_693983 ) ( CLEAR ?auto_693985 ) ( IS-CRATE ?auto_693977 ) ( AVAILABLE ?auto_693979 ) ( IN ?auto_693977 ?auto_693984 ) )
    :subtasks
    ( ( !UNLOAD ?auto_693979 ?auto_693977 ?auto_693984 ?auto_693983 )
      ( MAKE-2CRATE ?auto_693985 ?auto_693977 ?auto_693978 )
      ( MAKE-1CRATE-VERIFY ?auto_693977 ?auto_693978 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_693986 - SURFACE
      ?auto_693987 - SURFACE
      ?auto_693988 - SURFACE
    )
    :vars
    (
      ?auto_693989 - HOIST
      ?auto_693991 - PLACE
      ?auto_693993 - PLACE
      ?auto_693992 - HOIST
      ?auto_693990 - SURFACE
      ?auto_693994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693989 ?auto_693991 ) ( IS-CRATE ?auto_693988 ) ( not ( = ?auto_693987 ?auto_693988 ) ) ( not ( = ?auto_693986 ?auto_693987 ) ) ( not ( = ?auto_693986 ?auto_693988 ) ) ( not ( = ?auto_693993 ?auto_693991 ) ) ( HOIST-AT ?auto_693992 ?auto_693993 ) ( not ( = ?auto_693989 ?auto_693992 ) ) ( AVAILABLE ?auto_693992 ) ( SURFACE-AT ?auto_693988 ?auto_693993 ) ( ON ?auto_693988 ?auto_693990 ) ( CLEAR ?auto_693988 ) ( not ( = ?auto_693987 ?auto_693990 ) ) ( not ( = ?auto_693988 ?auto_693990 ) ) ( not ( = ?auto_693986 ?auto_693990 ) ) ( TRUCK-AT ?auto_693994 ?auto_693991 ) ( SURFACE-AT ?auto_693986 ?auto_693991 ) ( CLEAR ?auto_693986 ) ( IS-CRATE ?auto_693987 ) ( AVAILABLE ?auto_693989 ) ( IN ?auto_693987 ?auto_693994 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_693987 ?auto_693988 )
      ( MAKE-2CRATE-VERIFY ?auto_693986 ?auto_693987 ?auto_693988 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_694031 - SURFACE
      ?auto_694032 - SURFACE
    )
    :vars
    (
      ?auto_694036 - HOIST
      ?auto_694037 - PLACE
      ?auto_694035 - SURFACE
      ?auto_694033 - PLACE
      ?auto_694034 - HOIST
      ?auto_694038 - SURFACE
      ?auto_694039 - TRUCK
      ?auto_694040 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_694036 ?auto_694037 ) ( SURFACE-AT ?auto_694031 ?auto_694037 ) ( CLEAR ?auto_694031 ) ( IS-CRATE ?auto_694032 ) ( not ( = ?auto_694031 ?auto_694032 ) ) ( AVAILABLE ?auto_694036 ) ( ON ?auto_694031 ?auto_694035 ) ( not ( = ?auto_694035 ?auto_694031 ) ) ( not ( = ?auto_694035 ?auto_694032 ) ) ( not ( = ?auto_694033 ?auto_694037 ) ) ( HOIST-AT ?auto_694034 ?auto_694033 ) ( not ( = ?auto_694036 ?auto_694034 ) ) ( AVAILABLE ?auto_694034 ) ( SURFACE-AT ?auto_694032 ?auto_694033 ) ( ON ?auto_694032 ?auto_694038 ) ( CLEAR ?auto_694032 ) ( not ( = ?auto_694031 ?auto_694038 ) ) ( not ( = ?auto_694032 ?auto_694038 ) ) ( not ( = ?auto_694035 ?auto_694038 ) ) ( TRUCK-AT ?auto_694039 ?auto_694040 ) ( not ( = ?auto_694040 ?auto_694037 ) ) ( not ( = ?auto_694033 ?auto_694040 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_694039 ?auto_694040 ?auto_694037 )
      ( MAKE-1CRATE ?auto_694031 ?auto_694032 )
      ( MAKE-1CRATE-VERIFY ?auto_694031 ?auto_694032 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_694070 - SURFACE
      ?auto_694071 - SURFACE
      ?auto_694072 - SURFACE
      ?auto_694073 - SURFACE
    )
    :vars
    (
      ?auto_694074 - HOIST
      ?auto_694075 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_694074 ?auto_694075 ) ( SURFACE-AT ?auto_694072 ?auto_694075 ) ( CLEAR ?auto_694072 ) ( LIFTING ?auto_694074 ?auto_694073 ) ( IS-CRATE ?auto_694073 ) ( not ( = ?auto_694072 ?auto_694073 ) ) ( ON ?auto_694071 ?auto_694070 ) ( ON ?auto_694072 ?auto_694071 ) ( not ( = ?auto_694070 ?auto_694071 ) ) ( not ( = ?auto_694070 ?auto_694072 ) ) ( not ( = ?auto_694070 ?auto_694073 ) ) ( not ( = ?auto_694071 ?auto_694072 ) ) ( not ( = ?auto_694071 ?auto_694073 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_694072 ?auto_694073 )
      ( MAKE-3CRATE-VERIFY ?auto_694070 ?auto_694071 ?auto_694072 ?auto_694073 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_694087 - SURFACE
      ?auto_694088 - SURFACE
      ?auto_694089 - SURFACE
      ?auto_694090 - SURFACE
    )
    :vars
    (
      ?auto_694091 - HOIST
      ?auto_694093 - PLACE
      ?auto_694092 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_694091 ?auto_694093 ) ( SURFACE-AT ?auto_694089 ?auto_694093 ) ( CLEAR ?auto_694089 ) ( IS-CRATE ?auto_694090 ) ( not ( = ?auto_694089 ?auto_694090 ) ) ( TRUCK-AT ?auto_694092 ?auto_694093 ) ( AVAILABLE ?auto_694091 ) ( IN ?auto_694090 ?auto_694092 ) ( ON ?auto_694089 ?auto_694088 ) ( not ( = ?auto_694088 ?auto_694089 ) ) ( not ( = ?auto_694088 ?auto_694090 ) ) ( ON ?auto_694088 ?auto_694087 ) ( not ( = ?auto_694087 ?auto_694088 ) ) ( not ( = ?auto_694087 ?auto_694089 ) ) ( not ( = ?auto_694087 ?auto_694090 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694088 ?auto_694089 ?auto_694090 )
      ( MAKE-3CRATE-VERIFY ?auto_694087 ?auto_694088 ?auto_694089 ?auto_694090 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_694108 - SURFACE
      ?auto_694109 - SURFACE
      ?auto_694110 - SURFACE
      ?auto_694111 - SURFACE
    )
    :vars
    (
      ?auto_694113 - HOIST
      ?auto_694114 - PLACE
      ?auto_694112 - TRUCK
      ?auto_694115 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_694113 ?auto_694114 ) ( SURFACE-AT ?auto_694110 ?auto_694114 ) ( CLEAR ?auto_694110 ) ( IS-CRATE ?auto_694111 ) ( not ( = ?auto_694110 ?auto_694111 ) ) ( AVAILABLE ?auto_694113 ) ( IN ?auto_694111 ?auto_694112 ) ( ON ?auto_694110 ?auto_694109 ) ( not ( = ?auto_694109 ?auto_694110 ) ) ( not ( = ?auto_694109 ?auto_694111 ) ) ( TRUCK-AT ?auto_694112 ?auto_694115 ) ( not ( = ?auto_694115 ?auto_694114 ) ) ( ON ?auto_694109 ?auto_694108 ) ( not ( = ?auto_694108 ?auto_694109 ) ) ( not ( = ?auto_694108 ?auto_694110 ) ) ( not ( = ?auto_694108 ?auto_694111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694109 ?auto_694110 ?auto_694111 )
      ( MAKE-3CRATE-VERIFY ?auto_694108 ?auto_694109 ?auto_694110 ?auto_694111 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_694132 - SURFACE
      ?auto_694133 - SURFACE
      ?auto_694134 - SURFACE
      ?auto_694135 - SURFACE
    )
    :vars
    (
      ?auto_694137 - HOIST
      ?auto_694136 - PLACE
      ?auto_694139 - TRUCK
      ?auto_694138 - PLACE
      ?auto_694140 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_694137 ?auto_694136 ) ( SURFACE-AT ?auto_694134 ?auto_694136 ) ( CLEAR ?auto_694134 ) ( IS-CRATE ?auto_694135 ) ( not ( = ?auto_694134 ?auto_694135 ) ) ( AVAILABLE ?auto_694137 ) ( ON ?auto_694134 ?auto_694133 ) ( not ( = ?auto_694133 ?auto_694134 ) ) ( not ( = ?auto_694133 ?auto_694135 ) ) ( TRUCK-AT ?auto_694139 ?auto_694138 ) ( not ( = ?auto_694138 ?auto_694136 ) ) ( HOIST-AT ?auto_694140 ?auto_694138 ) ( LIFTING ?auto_694140 ?auto_694135 ) ( not ( = ?auto_694137 ?auto_694140 ) ) ( ON ?auto_694133 ?auto_694132 ) ( not ( = ?auto_694132 ?auto_694133 ) ) ( not ( = ?auto_694132 ?auto_694134 ) ) ( not ( = ?auto_694132 ?auto_694135 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694133 ?auto_694134 ?auto_694135 )
      ( MAKE-3CRATE-VERIFY ?auto_694132 ?auto_694133 ?auto_694134 ?auto_694135 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_694159 - SURFACE
      ?auto_694160 - SURFACE
      ?auto_694161 - SURFACE
      ?auto_694162 - SURFACE
    )
    :vars
    (
      ?auto_694164 - HOIST
      ?auto_694163 - PLACE
      ?auto_694168 - TRUCK
      ?auto_694166 - PLACE
      ?auto_694165 - HOIST
      ?auto_694167 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_694164 ?auto_694163 ) ( SURFACE-AT ?auto_694161 ?auto_694163 ) ( CLEAR ?auto_694161 ) ( IS-CRATE ?auto_694162 ) ( not ( = ?auto_694161 ?auto_694162 ) ) ( AVAILABLE ?auto_694164 ) ( ON ?auto_694161 ?auto_694160 ) ( not ( = ?auto_694160 ?auto_694161 ) ) ( not ( = ?auto_694160 ?auto_694162 ) ) ( TRUCK-AT ?auto_694168 ?auto_694166 ) ( not ( = ?auto_694166 ?auto_694163 ) ) ( HOIST-AT ?auto_694165 ?auto_694166 ) ( not ( = ?auto_694164 ?auto_694165 ) ) ( AVAILABLE ?auto_694165 ) ( SURFACE-AT ?auto_694162 ?auto_694166 ) ( ON ?auto_694162 ?auto_694167 ) ( CLEAR ?auto_694162 ) ( not ( = ?auto_694161 ?auto_694167 ) ) ( not ( = ?auto_694162 ?auto_694167 ) ) ( not ( = ?auto_694160 ?auto_694167 ) ) ( ON ?auto_694160 ?auto_694159 ) ( not ( = ?auto_694159 ?auto_694160 ) ) ( not ( = ?auto_694159 ?auto_694161 ) ) ( not ( = ?auto_694159 ?auto_694162 ) ) ( not ( = ?auto_694159 ?auto_694167 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694160 ?auto_694161 ?auto_694162 )
      ( MAKE-3CRATE-VERIFY ?auto_694159 ?auto_694160 ?auto_694161 ?auto_694162 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_694187 - SURFACE
      ?auto_694188 - SURFACE
      ?auto_694189 - SURFACE
      ?auto_694190 - SURFACE
    )
    :vars
    (
      ?auto_694194 - HOIST
      ?auto_694192 - PLACE
      ?auto_694191 - PLACE
      ?auto_694193 - HOIST
      ?auto_694196 - SURFACE
      ?auto_694195 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_694194 ?auto_694192 ) ( SURFACE-AT ?auto_694189 ?auto_694192 ) ( CLEAR ?auto_694189 ) ( IS-CRATE ?auto_694190 ) ( not ( = ?auto_694189 ?auto_694190 ) ) ( AVAILABLE ?auto_694194 ) ( ON ?auto_694189 ?auto_694188 ) ( not ( = ?auto_694188 ?auto_694189 ) ) ( not ( = ?auto_694188 ?auto_694190 ) ) ( not ( = ?auto_694191 ?auto_694192 ) ) ( HOIST-AT ?auto_694193 ?auto_694191 ) ( not ( = ?auto_694194 ?auto_694193 ) ) ( AVAILABLE ?auto_694193 ) ( SURFACE-AT ?auto_694190 ?auto_694191 ) ( ON ?auto_694190 ?auto_694196 ) ( CLEAR ?auto_694190 ) ( not ( = ?auto_694189 ?auto_694196 ) ) ( not ( = ?auto_694190 ?auto_694196 ) ) ( not ( = ?auto_694188 ?auto_694196 ) ) ( TRUCK-AT ?auto_694195 ?auto_694192 ) ( ON ?auto_694188 ?auto_694187 ) ( not ( = ?auto_694187 ?auto_694188 ) ) ( not ( = ?auto_694187 ?auto_694189 ) ) ( not ( = ?auto_694187 ?auto_694190 ) ) ( not ( = ?auto_694187 ?auto_694196 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694188 ?auto_694189 ?auto_694190 )
      ( MAKE-3CRATE-VERIFY ?auto_694187 ?auto_694188 ?auto_694189 ?auto_694190 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_694215 - SURFACE
      ?auto_694216 - SURFACE
      ?auto_694217 - SURFACE
      ?auto_694218 - SURFACE
    )
    :vars
    (
      ?auto_694222 - HOIST
      ?auto_694220 - PLACE
      ?auto_694219 - PLACE
      ?auto_694221 - HOIST
      ?auto_694223 - SURFACE
      ?auto_694224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_694222 ?auto_694220 ) ( IS-CRATE ?auto_694218 ) ( not ( = ?auto_694217 ?auto_694218 ) ) ( not ( = ?auto_694216 ?auto_694217 ) ) ( not ( = ?auto_694216 ?auto_694218 ) ) ( not ( = ?auto_694219 ?auto_694220 ) ) ( HOIST-AT ?auto_694221 ?auto_694219 ) ( not ( = ?auto_694222 ?auto_694221 ) ) ( AVAILABLE ?auto_694221 ) ( SURFACE-AT ?auto_694218 ?auto_694219 ) ( ON ?auto_694218 ?auto_694223 ) ( CLEAR ?auto_694218 ) ( not ( = ?auto_694217 ?auto_694223 ) ) ( not ( = ?auto_694218 ?auto_694223 ) ) ( not ( = ?auto_694216 ?auto_694223 ) ) ( TRUCK-AT ?auto_694224 ?auto_694220 ) ( SURFACE-AT ?auto_694216 ?auto_694220 ) ( CLEAR ?auto_694216 ) ( LIFTING ?auto_694222 ?auto_694217 ) ( IS-CRATE ?auto_694217 ) ( ON ?auto_694216 ?auto_694215 ) ( not ( = ?auto_694215 ?auto_694216 ) ) ( not ( = ?auto_694215 ?auto_694217 ) ) ( not ( = ?auto_694215 ?auto_694218 ) ) ( not ( = ?auto_694215 ?auto_694223 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694216 ?auto_694217 ?auto_694218 )
      ( MAKE-3CRATE-VERIFY ?auto_694215 ?auto_694216 ?auto_694217 ?auto_694218 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_694243 - SURFACE
      ?auto_694244 - SURFACE
      ?auto_694245 - SURFACE
      ?auto_694246 - SURFACE
    )
    :vars
    (
      ?auto_694248 - HOIST
      ?auto_694252 - PLACE
      ?auto_694250 - PLACE
      ?auto_694251 - HOIST
      ?auto_694249 - SURFACE
      ?auto_694247 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_694248 ?auto_694252 ) ( IS-CRATE ?auto_694246 ) ( not ( = ?auto_694245 ?auto_694246 ) ) ( not ( = ?auto_694244 ?auto_694245 ) ) ( not ( = ?auto_694244 ?auto_694246 ) ) ( not ( = ?auto_694250 ?auto_694252 ) ) ( HOIST-AT ?auto_694251 ?auto_694250 ) ( not ( = ?auto_694248 ?auto_694251 ) ) ( AVAILABLE ?auto_694251 ) ( SURFACE-AT ?auto_694246 ?auto_694250 ) ( ON ?auto_694246 ?auto_694249 ) ( CLEAR ?auto_694246 ) ( not ( = ?auto_694245 ?auto_694249 ) ) ( not ( = ?auto_694246 ?auto_694249 ) ) ( not ( = ?auto_694244 ?auto_694249 ) ) ( TRUCK-AT ?auto_694247 ?auto_694252 ) ( SURFACE-AT ?auto_694244 ?auto_694252 ) ( CLEAR ?auto_694244 ) ( IS-CRATE ?auto_694245 ) ( AVAILABLE ?auto_694248 ) ( IN ?auto_694245 ?auto_694247 ) ( ON ?auto_694244 ?auto_694243 ) ( not ( = ?auto_694243 ?auto_694244 ) ) ( not ( = ?auto_694243 ?auto_694245 ) ) ( not ( = ?auto_694243 ?auto_694246 ) ) ( not ( = ?auto_694243 ?auto_694249 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694244 ?auto_694245 ?auto_694246 )
      ( MAKE-3CRATE-VERIFY ?auto_694243 ?auto_694244 ?auto_694245 ?auto_694246 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_694534 - SURFACE
      ?auto_694535 - SURFACE
      ?auto_694536 - SURFACE
      ?auto_694537 - SURFACE
      ?auto_694538 - SURFACE
    )
    :vars
    (
      ?auto_694539 - HOIST
      ?auto_694540 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_694539 ?auto_694540 ) ( SURFACE-AT ?auto_694537 ?auto_694540 ) ( CLEAR ?auto_694537 ) ( LIFTING ?auto_694539 ?auto_694538 ) ( IS-CRATE ?auto_694538 ) ( not ( = ?auto_694537 ?auto_694538 ) ) ( ON ?auto_694535 ?auto_694534 ) ( ON ?auto_694536 ?auto_694535 ) ( ON ?auto_694537 ?auto_694536 ) ( not ( = ?auto_694534 ?auto_694535 ) ) ( not ( = ?auto_694534 ?auto_694536 ) ) ( not ( = ?auto_694534 ?auto_694537 ) ) ( not ( = ?auto_694534 ?auto_694538 ) ) ( not ( = ?auto_694535 ?auto_694536 ) ) ( not ( = ?auto_694535 ?auto_694537 ) ) ( not ( = ?auto_694535 ?auto_694538 ) ) ( not ( = ?auto_694536 ?auto_694537 ) ) ( not ( = ?auto_694536 ?auto_694538 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_694537 ?auto_694538 )
      ( MAKE-4CRATE-VERIFY ?auto_694534 ?auto_694535 ?auto_694536 ?auto_694537 ?auto_694538 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_694559 - SURFACE
      ?auto_694560 - SURFACE
      ?auto_694561 - SURFACE
      ?auto_694562 - SURFACE
      ?auto_694563 - SURFACE
    )
    :vars
    (
      ?auto_694565 - HOIST
      ?auto_694566 - PLACE
      ?auto_694564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_694565 ?auto_694566 ) ( SURFACE-AT ?auto_694562 ?auto_694566 ) ( CLEAR ?auto_694562 ) ( IS-CRATE ?auto_694563 ) ( not ( = ?auto_694562 ?auto_694563 ) ) ( TRUCK-AT ?auto_694564 ?auto_694566 ) ( AVAILABLE ?auto_694565 ) ( IN ?auto_694563 ?auto_694564 ) ( ON ?auto_694562 ?auto_694561 ) ( not ( = ?auto_694561 ?auto_694562 ) ) ( not ( = ?auto_694561 ?auto_694563 ) ) ( ON ?auto_694560 ?auto_694559 ) ( ON ?auto_694561 ?auto_694560 ) ( not ( = ?auto_694559 ?auto_694560 ) ) ( not ( = ?auto_694559 ?auto_694561 ) ) ( not ( = ?auto_694559 ?auto_694562 ) ) ( not ( = ?auto_694559 ?auto_694563 ) ) ( not ( = ?auto_694560 ?auto_694561 ) ) ( not ( = ?auto_694560 ?auto_694562 ) ) ( not ( = ?auto_694560 ?auto_694563 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694561 ?auto_694562 ?auto_694563 )
      ( MAKE-4CRATE-VERIFY ?auto_694559 ?auto_694560 ?auto_694561 ?auto_694562 ?auto_694563 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_694589 - SURFACE
      ?auto_694590 - SURFACE
      ?auto_694591 - SURFACE
      ?auto_694592 - SURFACE
      ?auto_694593 - SURFACE
    )
    :vars
    (
      ?auto_694596 - HOIST
      ?auto_694597 - PLACE
      ?auto_694595 - TRUCK
      ?auto_694594 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_694596 ?auto_694597 ) ( SURFACE-AT ?auto_694592 ?auto_694597 ) ( CLEAR ?auto_694592 ) ( IS-CRATE ?auto_694593 ) ( not ( = ?auto_694592 ?auto_694593 ) ) ( AVAILABLE ?auto_694596 ) ( IN ?auto_694593 ?auto_694595 ) ( ON ?auto_694592 ?auto_694591 ) ( not ( = ?auto_694591 ?auto_694592 ) ) ( not ( = ?auto_694591 ?auto_694593 ) ) ( TRUCK-AT ?auto_694595 ?auto_694594 ) ( not ( = ?auto_694594 ?auto_694597 ) ) ( ON ?auto_694590 ?auto_694589 ) ( ON ?auto_694591 ?auto_694590 ) ( not ( = ?auto_694589 ?auto_694590 ) ) ( not ( = ?auto_694589 ?auto_694591 ) ) ( not ( = ?auto_694589 ?auto_694592 ) ) ( not ( = ?auto_694589 ?auto_694593 ) ) ( not ( = ?auto_694590 ?auto_694591 ) ) ( not ( = ?auto_694590 ?auto_694592 ) ) ( not ( = ?auto_694590 ?auto_694593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694591 ?auto_694592 ?auto_694593 )
      ( MAKE-4CRATE-VERIFY ?auto_694589 ?auto_694590 ?auto_694591 ?auto_694592 ?auto_694593 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_694623 - SURFACE
      ?auto_694624 - SURFACE
      ?auto_694625 - SURFACE
      ?auto_694626 - SURFACE
      ?auto_694627 - SURFACE
    )
    :vars
    (
      ?auto_694629 - HOIST
      ?auto_694628 - PLACE
      ?auto_694630 - TRUCK
      ?auto_694631 - PLACE
      ?auto_694632 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_694629 ?auto_694628 ) ( SURFACE-AT ?auto_694626 ?auto_694628 ) ( CLEAR ?auto_694626 ) ( IS-CRATE ?auto_694627 ) ( not ( = ?auto_694626 ?auto_694627 ) ) ( AVAILABLE ?auto_694629 ) ( ON ?auto_694626 ?auto_694625 ) ( not ( = ?auto_694625 ?auto_694626 ) ) ( not ( = ?auto_694625 ?auto_694627 ) ) ( TRUCK-AT ?auto_694630 ?auto_694631 ) ( not ( = ?auto_694631 ?auto_694628 ) ) ( HOIST-AT ?auto_694632 ?auto_694631 ) ( LIFTING ?auto_694632 ?auto_694627 ) ( not ( = ?auto_694629 ?auto_694632 ) ) ( ON ?auto_694624 ?auto_694623 ) ( ON ?auto_694625 ?auto_694624 ) ( not ( = ?auto_694623 ?auto_694624 ) ) ( not ( = ?auto_694623 ?auto_694625 ) ) ( not ( = ?auto_694623 ?auto_694626 ) ) ( not ( = ?auto_694623 ?auto_694627 ) ) ( not ( = ?auto_694624 ?auto_694625 ) ) ( not ( = ?auto_694624 ?auto_694626 ) ) ( not ( = ?auto_694624 ?auto_694627 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694625 ?auto_694626 ?auto_694627 )
      ( MAKE-4CRATE-VERIFY ?auto_694623 ?auto_694624 ?auto_694625 ?auto_694626 ?auto_694627 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_694661 - SURFACE
      ?auto_694662 - SURFACE
      ?auto_694663 - SURFACE
      ?auto_694664 - SURFACE
      ?auto_694665 - SURFACE
    )
    :vars
    (
      ?auto_694669 - HOIST
      ?auto_694668 - PLACE
      ?auto_694667 - TRUCK
      ?auto_694666 - PLACE
      ?auto_694671 - HOIST
      ?auto_694670 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_694669 ?auto_694668 ) ( SURFACE-AT ?auto_694664 ?auto_694668 ) ( CLEAR ?auto_694664 ) ( IS-CRATE ?auto_694665 ) ( not ( = ?auto_694664 ?auto_694665 ) ) ( AVAILABLE ?auto_694669 ) ( ON ?auto_694664 ?auto_694663 ) ( not ( = ?auto_694663 ?auto_694664 ) ) ( not ( = ?auto_694663 ?auto_694665 ) ) ( TRUCK-AT ?auto_694667 ?auto_694666 ) ( not ( = ?auto_694666 ?auto_694668 ) ) ( HOIST-AT ?auto_694671 ?auto_694666 ) ( not ( = ?auto_694669 ?auto_694671 ) ) ( AVAILABLE ?auto_694671 ) ( SURFACE-AT ?auto_694665 ?auto_694666 ) ( ON ?auto_694665 ?auto_694670 ) ( CLEAR ?auto_694665 ) ( not ( = ?auto_694664 ?auto_694670 ) ) ( not ( = ?auto_694665 ?auto_694670 ) ) ( not ( = ?auto_694663 ?auto_694670 ) ) ( ON ?auto_694662 ?auto_694661 ) ( ON ?auto_694663 ?auto_694662 ) ( not ( = ?auto_694661 ?auto_694662 ) ) ( not ( = ?auto_694661 ?auto_694663 ) ) ( not ( = ?auto_694661 ?auto_694664 ) ) ( not ( = ?auto_694661 ?auto_694665 ) ) ( not ( = ?auto_694661 ?auto_694670 ) ) ( not ( = ?auto_694662 ?auto_694663 ) ) ( not ( = ?auto_694662 ?auto_694664 ) ) ( not ( = ?auto_694662 ?auto_694665 ) ) ( not ( = ?auto_694662 ?auto_694670 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694663 ?auto_694664 ?auto_694665 )
      ( MAKE-4CRATE-VERIFY ?auto_694661 ?auto_694662 ?auto_694663 ?auto_694664 ?auto_694665 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_694700 - SURFACE
      ?auto_694701 - SURFACE
      ?auto_694702 - SURFACE
      ?auto_694703 - SURFACE
      ?auto_694704 - SURFACE
    )
    :vars
    (
      ?auto_694707 - HOIST
      ?auto_694705 - PLACE
      ?auto_694710 - PLACE
      ?auto_694709 - HOIST
      ?auto_694708 - SURFACE
      ?auto_694706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_694707 ?auto_694705 ) ( SURFACE-AT ?auto_694703 ?auto_694705 ) ( CLEAR ?auto_694703 ) ( IS-CRATE ?auto_694704 ) ( not ( = ?auto_694703 ?auto_694704 ) ) ( AVAILABLE ?auto_694707 ) ( ON ?auto_694703 ?auto_694702 ) ( not ( = ?auto_694702 ?auto_694703 ) ) ( not ( = ?auto_694702 ?auto_694704 ) ) ( not ( = ?auto_694710 ?auto_694705 ) ) ( HOIST-AT ?auto_694709 ?auto_694710 ) ( not ( = ?auto_694707 ?auto_694709 ) ) ( AVAILABLE ?auto_694709 ) ( SURFACE-AT ?auto_694704 ?auto_694710 ) ( ON ?auto_694704 ?auto_694708 ) ( CLEAR ?auto_694704 ) ( not ( = ?auto_694703 ?auto_694708 ) ) ( not ( = ?auto_694704 ?auto_694708 ) ) ( not ( = ?auto_694702 ?auto_694708 ) ) ( TRUCK-AT ?auto_694706 ?auto_694705 ) ( ON ?auto_694701 ?auto_694700 ) ( ON ?auto_694702 ?auto_694701 ) ( not ( = ?auto_694700 ?auto_694701 ) ) ( not ( = ?auto_694700 ?auto_694702 ) ) ( not ( = ?auto_694700 ?auto_694703 ) ) ( not ( = ?auto_694700 ?auto_694704 ) ) ( not ( = ?auto_694700 ?auto_694708 ) ) ( not ( = ?auto_694701 ?auto_694702 ) ) ( not ( = ?auto_694701 ?auto_694703 ) ) ( not ( = ?auto_694701 ?auto_694704 ) ) ( not ( = ?auto_694701 ?auto_694708 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694702 ?auto_694703 ?auto_694704 )
      ( MAKE-4CRATE-VERIFY ?auto_694700 ?auto_694701 ?auto_694702 ?auto_694703 ?auto_694704 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_694739 - SURFACE
      ?auto_694740 - SURFACE
      ?auto_694741 - SURFACE
      ?auto_694742 - SURFACE
      ?auto_694743 - SURFACE
    )
    :vars
    (
      ?auto_694746 - HOIST
      ?auto_694747 - PLACE
      ?auto_694744 - PLACE
      ?auto_694748 - HOIST
      ?auto_694749 - SURFACE
      ?auto_694745 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_694746 ?auto_694747 ) ( IS-CRATE ?auto_694743 ) ( not ( = ?auto_694742 ?auto_694743 ) ) ( not ( = ?auto_694741 ?auto_694742 ) ) ( not ( = ?auto_694741 ?auto_694743 ) ) ( not ( = ?auto_694744 ?auto_694747 ) ) ( HOIST-AT ?auto_694748 ?auto_694744 ) ( not ( = ?auto_694746 ?auto_694748 ) ) ( AVAILABLE ?auto_694748 ) ( SURFACE-AT ?auto_694743 ?auto_694744 ) ( ON ?auto_694743 ?auto_694749 ) ( CLEAR ?auto_694743 ) ( not ( = ?auto_694742 ?auto_694749 ) ) ( not ( = ?auto_694743 ?auto_694749 ) ) ( not ( = ?auto_694741 ?auto_694749 ) ) ( TRUCK-AT ?auto_694745 ?auto_694747 ) ( SURFACE-AT ?auto_694741 ?auto_694747 ) ( CLEAR ?auto_694741 ) ( LIFTING ?auto_694746 ?auto_694742 ) ( IS-CRATE ?auto_694742 ) ( ON ?auto_694740 ?auto_694739 ) ( ON ?auto_694741 ?auto_694740 ) ( not ( = ?auto_694739 ?auto_694740 ) ) ( not ( = ?auto_694739 ?auto_694741 ) ) ( not ( = ?auto_694739 ?auto_694742 ) ) ( not ( = ?auto_694739 ?auto_694743 ) ) ( not ( = ?auto_694739 ?auto_694749 ) ) ( not ( = ?auto_694740 ?auto_694741 ) ) ( not ( = ?auto_694740 ?auto_694742 ) ) ( not ( = ?auto_694740 ?auto_694743 ) ) ( not ( = ?auto_694740 ?auto_694749 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694741 ?auto_694742 ?auto_694743 )
      ( MAKE-4CRATE-VERIFY ?auto_694739 ?auto_694740 ?auto_694741 ?auto_694742 ?auto_694743 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_694778 - SURFACE
      ?auto_694779 - SURFACE
      ?auto_694780 - SURFACE
      ?auto_694781 - SURFACE
      ?auto_694782 - SURFACE
    )
    :vars
    (
      ?auto_694784 - HOIST
      ?auto_694785 - PLACE
      ?auto_694787 - PLACE
      ?auto_694783 - HOIST
      ?auto_694786 - SURFACE
      ?auto_694788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_694784 ?auto_694785 ) ( IS-CRATE ?auto_694782 ) ( not ( = ?auto_694781 ?auto_694782 ) ) ( not ( = ?auto_694780 ?auto_694781 ) ) ( not ( = ?auto_694780 ?auto_694782 ) ) ( not ( = ?auto_694787 ?auto_694785 ) ) ( HOIST-AT ?auto_694783 ?auto_694787 ) ( not ( = ?auto_694784 ?auto_694783 ) ) ( AVAILABLE ?auto_694783 ) ( SURFACE-AT ?auto_694782 ?auto_694787 ) ( ON ?auto_694782 ?auto_694786 ) ( CLEAR ?auto_694782 ) ( not ( = ?auto_694781 ?auto_694786 ) ) ( not ( = ?auto_694782 ?auto_694786 ) ) ( not ( = ?auto_694780 ?auto_694786 ) ) ( TRUCK-AT ?auto_694788 ?auto_694785 ) ( SURFACE-AT ?auto_694780 ?auto_694785 ) ( CLEAR ?auto_694780 ) ( IS-CRATE ?auto_694781 ) ( AVAILABLE ?auto_694784 ) ( IN ?auto_694781 ?auto_694788 ) ( ON ?auto_694779 ?auto_694778 ) ( ON ?auto_694780 ?auto_694779 ) ( not ( = ?auto_694778 ?auto_694779 ) ) ( not ( = ?auto_694778 ?auto_694780 ) ) ( not ( = ?auto_694778 ?auto_694781 ) ) ( not ( = ?auto_694778 ?auto_694782 ) ) ( not ( = ?auto_694778 ?auto_694786 ) ) ( not ( = ?auto_694779 ?auto_694780 ) ) ( not ( = ?auto_694779 ?auto_694781 ) ) ( not ( = ?auto_694779 ?auto_694782 ) ) ( not ( = ?auto_694779 ?auto_694786 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_694780 ?auto_694781 ?auto_694782 )
      ( MAKE-4CRATE-VERIFY ?auto_694778 ?auto_694779 ?auto_694780 ?auto_694781 ?auto_694782 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_695438 - SURFACE
      ?auto_695439 - SURFACE
      ?auto_695440 - SURFACE
      ?auto_695441 - SURFACE
      ?auto_695442 - SURFACE
      ?auto_695443 - SURFACE
    )
    :vars
    (
      ?auto_695444 - HOIST
      ?auto_695445 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_695444 ?auto_695445 ) ( SURFACE-AT ?auto_695442 ?auto_695445 ) ( CLEAR ?auto_695442 ) ( LIFTING ?auto_695444 ?auto_695443 ) ( IS-CRATE ?auto_695443 ) ( not ( = ?auto_695442 ?auto_695443 ) ) ( ON ?auto_695439 ?auto_695438 ) ( ON ?auto_695440 ?auto_695439 ) ( ON ?auto_695441 ?auto_695440 ) ( ON ?auto_695442 ?auto_695441 ) ( not ( = ?auto_695438 ?auto_695439 ) ) ( not ( = ?auto_695438 ?auto_695440 ) ) ( not ( = ?auto_695438 ?auto_695441 ) ) ( not ( = ?auto_695438 ?auto_695442 ) ) ( not ( = ?auto_695438 ?auto_695443 ) ) ( not ( = ?auto_695439 ?auto_695440 ) ) ( not ( = ?auto_695439 ?auto_695441 ) ) ( not ( = ?auto_695439 ?auto_695442 ) ) ( not ( = ?auto_695439 ?auto_695443 ) ) ( not ( = ?auto_695440 ?auto_695441 ) ) ( not ( = ?auto_695440 ?auto_695442 ) ) ( not ( = ?auto_695440 ?auto_695443 ) ) ( not ( = ?auto_695441 ?auto_695442 ) ) ( not ( = ?auto_695441 ?auto_695443 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_695442 ?auto_695443 )
      ( MAKE-5CRATE-VERIFY ?auto_695438 ?auto_695439 ?auto_695440 ?auto_695441 ?auto_695442 ?auto_695443 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_695472 - SURFACE
      ?auto_695473 - SURFACE
      ?auto_695474 - SURFACE
      ?auto_695475 - SURFACE
      ?auto_695476 - SURFACE
      ?auto_695477 - SURFACE
    )
    :vars
    (
      ?auto_695478 - HOIST
      ?auto_695480 - PLACE
      ?auto_695479 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_695478 ?auto_695480 ) ( SURFACE-AT ?auto_695476 ?auto_695480 ) ( CLEAR ?auto_695476 ) ( IS-CRATE ?auto_695477 ) ( not ( = ?auto_695476 ?auto_695477 ) ) ( TRUCK-AT ?auto_695479 ?auto_695480 ) ( AVAILABLE ?auto_695478 ) ( IN ?auto_695477 ?auto_695479 ) ( ON ?auto_695476 ?auto_695475 ) ( not ( = ?auto_695475 ?auto_695476 ) ) ( not ( = ?auto_695475 ?auto_695477 ) ) ( ON ?auto_695473 ?auto_695472 ) ( ON ?auto_695474 ?auto_695473 ) ( ON ?auto_695475 ?auto_695474 ) ( not ( = ?auto_695472 ?auto_695473 ) ) ( not ( = ?auto_695472 ?auto_695474 ) ) ( not ( = ?auto_695472 ?auto_695475 ) ) ( not ( = ?auto_695472 ?auto_695476 ) ) ( not ( = ?auto_695472 ?auto_695477 ) ) ( not ( = ?auto_695473 ?auto_695474 ) ) ( not ( = ?auto_695473 ?auto_695475 ) ) ( not ( = ?auto_695473 ?auto_695476 ) ) ( not ( = ?auto_695473 ?auto_695477 ) ) ( not ( = ?auto_695474 ?auto_695475 ) ) ( not ( = ?auto_695474 ?auto_695476 ) ) ( not ( = ?auto_695474 ?auto_695477 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_695475 ?auto_695476 ?auto_695477 )
      ( MAKE-5CRATE-VERIFY ?auto_695472 ?auto_695473 ?auto_695474 ?auto_695475 ?auto_695476 ?auto_695477 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_695512 - SURFACE
      ?auto_695513 - SURFACE
      ?auto_695514 - SURFACE
      ?auto_695515 - SURFACE
      ?auto_695516 - SURFACE
      ?auto_695517 - SURFACE
    )
    :vars
    (
      ?auto_695520 - HOIST
      ?auto_695518 - PLACE
      ?auto_695521 - TRUCK
      ?auto_695519 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_695520 ?auto_695518 ) ( SURFACE-AT ?auto_695516 ?auto_695518 ) ( CLEAR ?auto_695516 ) ( IS-CRATE ?auto_695517 ) ( not ( = ?auto_695516 ?auto_695517 ) ) ( AVAILABLE ?auto_695520 ) ( IN ?auto_695517 ?auto_695521 ) ( ON ?auto_695516 ?auto_695515 ) ( not ( = ?auto_695515 ?auto_695516 ) ) ( not ( = ?auto_695515 ?auto_695517 ) ) ( TRUCK-AT ?auto_695521 ?auto_695519 ) ( not ( = ?auto_695519 ?auto_695518 ) ) ( ON ?auto_695513 ?auto_695512 ) ( ON ?auto_695514 ?auto_695513 ) ( ON ?auto_695515 ?auto_695514 ) ( not ( = ?auto_695512 ?auto_695513 ) ) ( not ( = ?auto_695512 ?auto_695514 ) ) ( not ( = ?auto_695512 ?auto_695515 ) ) ( not ( = ?auto_695512 ?auto_695516 ) ) ( not ( = ?auto_695512 ?auto_695517 ) ) ( not ( = ?auto_695513 ?auto_695514 ) ) ( not ( = ?auto_695513 ?auto_695515 ) ) ( not ( = ?auto_695513 ?auto_695516 ) ) ( not ( = ?auto_695513 ?auto_695517 ) ) ( not ( = ?auto_695514 ?auto_695515 ) ) ( not ( = ?auto_695514 ?auto_695516 ) ) ( not ( = ?auto_695514 ?auto_695517 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_695515 ?auto_695516 ?auto_695517 )
      ( MAKE-5CRATE-VERIFY ?auto_695512 ?auto_695513 ?auto_695514 ?auto_695515 ?auto_695516 ?auto_695517 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_695557 - SURFACE
      ?auto_695558 - SURFACE
      ?auto_695559 - SURFACE
      ?auto_695560 - SURFACE
      ?auto_695561 - SURFACE
      ?auto_695562 - SURFACE
    )
    :vars
    (
      ?auto_695566 - HOIST
      ?auto_695564 - PLACE
      ?auto_695567 - TRUCK
      ?auto_695563 - PLACE
      ?auto_695565 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_695566 ?auto_695564 ) ( SURFACE-AT ?auto_695561 ?auto_695564 ) ( CLEAR ?auto_695561 ) ( IS-CRATE ?auto_695562 ) ( not ( = ?auto_695561 ?auto_695562 ) ) ( AVAILABLE ?auto_695566 ) ( ON ?auto_695561 ?auto_695560 ) ( not ( = ?auto_695560 ?auto_695561 ) ) ( not ( = ?auto_695560 ?auto_695562 ) ) ( TRUCK-AT ?auto_695567 ?auto_695563 ) ( not ( = ?auto_695563 ?auto_695564 ) ) ( HOIST-AT ?auto_695565 ?auto_695563 ) ( LIFTING ?auto_695565 ?auto_695562 ) ( not ( = ?auto_695566 ?auto_695565 ) ) ( ON ?auto_695558 ?auto_695557 ) ( ON ?auto_695559 ?auto_695558 ) ( ON ?auto_695560 ?auto_695559 ) ( not ( = ?auto_695557 ?auto_695558 ) ) ( not ( = ?auto_695557 ?auto_695559 ) ) ( not ( = ?auto_695557 ?auto_695560 ) ) ( not ( = ?auto_695557 ?auto_695561 ) ) ( not ( = ?auto_695557 ?auto_695562 ) ) ( not ( = ?auto_695558 ?auto_695559 ) ) ( not ( = ?auto_695558 ?auto_695560 ) ) ( not ( = ?auto_695558 ?auto_695561 ) ) ( not ( = ?auto_695558 ?auto_695562 ) ) ( not ( = ?auto_695559 ?auto_695560 ) ) ( not ( = ?auto_695559 ?auto_695561 ) ) ( not ( = ?auto_695559 ?auto_695562 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_695560 ?auto_695561 ?auto_695562 )
      ( MAKE-5CRATE-VERIFY ?auto_695557 ?auto_695558 ?auto_695559 ?auto_695560 ?auto_695561 ?auto_695562 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_695607 - SURFACE
      ?auto_695608 - SURFACE
      ?auto_695609 - SURFACE
      ?auto_695610 - SURFACE
      ?auto_695611 - SURFACE
      ?auto_695612 - SURFACE
    )
    :vars
    (
      ?auto_695614 - HOIST
      ?auto_695617 - PLACE
      ?auto_695618 - TRUCK
      ?auto_695613 - PLACE
      ?auto_695615 - HOIST
      ?auto_695616 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_695614 ?auto_695617 ) ( SURFACE-AT ?auto_695611 ?auto_695617 ) ( CLEAR ?auto_695611 ) ( IS-CRATE ?auto_695612 ) ( not ( = ?auto_695611 ?auto_695612 ) ) ( AVAILABLE ?auto_695614 ) ( ON ?auto_695611 ?auto_695610 ) ( not ( = ?auto_695610 ?auto_695611 ) ) ( not ( = ?auto_695610 ?auto_695612 ) ) ( TRUCK-AT ?auto_695618 ?auto_695613 ) ( not ( = ?auto_695613 ?auto_695617 ) ) ( HOIST-AT ?auto_695615 ?auto_695613 ) ( not ( = ?auto_695614 ?auto_695615 ) ) ( AVAILABLE ?auto_695615 ) ( SURFACE-AT ?auto_695612 ?auto_695613 ) ( ON ?auto_695612 ?auto_695616 ) ( CLEAR ?auto_695612 ) ( not ( = ?auto_695611 ?auto_695616 ) ) ( not ( = ?auto_695612 ?auto_695616 ) ) ( not ( = ?auto_695610 ?auto_695616 ) ) ( ON ?auto_695608 ?auto_695607 ) ( ON ?auto_695609 ?auto_695608 ) ( ON ?auto_695610 ?auto_695609 ) ( not ( = ?auto_695607 ?auto_695608 ) ) ( not ( = ?auto_695607 ?auto_695609 ) ) ( not ( = ?auto_695607 ?auto_695610 ) ) ( not ( = ?auto_695607 ?auto_695611 ) ) ( not ( = ?auto_695607 ?auto_695612 ) ) ( not ( = ?auto_695607 ?auto_695616 ) ) ( not ( = ?auto_695608 ?auto_695609 ) ) ( not ( = ?auto_695608 ?auto_695610 ) ) ( not ( = ?auto_695608 ?auto_695611 ) ) ( not ( = ?auto_695608 ?auto_695612 ) ) ( not ( = ?auto_695608 ?auto_695616 ) ) ( not ( = ?auto_695609 ?auto_695610 ) ) ( not ( = ?auto_695609 ?auto_695611 ) ) ( not ( = ?auto_695609 ?auto_695612 ) ) ( not ( = ?auto_695609 ?auto_695616 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_695610 ?auto_695611 ?auto_695612 )
      ( MAKE-5CRATE-VERIFY ?auto_695607 ?auto_695608 ?auto_695609 ?auto_695610 ?auto_695611 ?auto_695612 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_695658 - SURFACE
      ?auto_695659 - SURFACE
      ?auto_695660 - SURFACE
      ?auto_695661 - SURFACE
      ?auto_695662 - SURFACE
      ?auto_695663 - SURFACE
    )
    :vars
    (
      ?auto_695667 - HOIST
      ?auto_695666 - PLACE
      ?auto_695665 - PLACE
      ?auto_695664 - HOIST
      ?auto_695668 - SURFACE
      ?auto_695669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_695667 ?auto_695666 ) ( SURFACE-AT ?auto_695662 ?auto_695666 ) ( CLEAR ?auto_695662 ) ( IS-CRATE ?auto_695663 ) ( not ( = ?auto_695662 ?auto_695663 ) ) ( AVAILABLE ?auto_695667 ) ( ON ?auto_695662 ?auto_695661 ) ( not ( = ?auto_695661 ?auto_695662 ) ) ( not ( = ?auto_695661 ?auto_695663 ) ) ( not ( = ?auto_695665 ?auto_695666 ) ) ( HOIST-AT ?auto_695664 ?auto_695665 ) ( not ( = ?auto_695667 ?auto_695664 ) ) ( AVAILABLE ?auto_695664 ) ( SURFACE-AT ?auto_695663 ?auto_695665 ) ( ON ?auto_695663 ?auto_695668 ) ( CLEAR ?auto_695663 ) ( not ( = ?auto_695662 ?auto_695668 ) ) ( not ( = ?auto_695663 ?auto_695668 ) ) ( not ( = ?auto_695661 ?auto_695668 ) ) ( TRUCK-AT ?auto_695669 ?auto_695666 ) ( ON ?auto_695659 ?auto_695658 ) ( ON ?auto_695660 ?auto_695659 ) ( ON ?auto_695661 ?auto_695660 ) ( not ( = ?auto_695658 ?auto_695659 ) ) ( not ( = ?auto_695658 ?auto_695660 ) ) ( not ( = ?auto_695658 ?auto_695661 ) ) ( not ( = ?auto_695658 ?auto_695662 ) ) ( not ( = ?auto_695658 ?auto_695663 ) ) ( not ( = ?auto_695658 ?auto_695668 ) ) ( not ( = ?auto_695659 ?auto_695660 ) ) ( not ( = ?auto_695659 ?auto_695661 ) ) ( not ( = ?auto_695659 ?auto_695662 ) ) ( not ( = ?auto_695659 ?auto_695663 ) ) ( not ( = ?auto_695659 ?auto_695668 ) ) ( not ( = ?auto_695660 ?auto_695661 ) ) ( not ( = ?auto_695660 ?auto_695662 ) ) ( not ( = ?auto_695660 ?auto_695663 ) ) ( not ( = ?auto_695660 ?auto_695668 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_695661 ?auto_695662 ?auto_695663 )
      ( MAKE-5CRATE-VERIFY ?auto_695658 ?auto_695659 ?auto_695660 ?auto_695661 ?auto_695662 ?auto_695663 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_695709 - SURFACE
      ?auto_695710 - SURFACE
      ?auto_695711 - SURFACE
      ?auto_695712 - SURFACE
      ?auto_695713 - SURFACE
      ?auto_695714 - SURFACE
    )
    :vars
    (
      ?auto_695718 - HOIST
      ?auto_695716 - PLACE
      ?auto_695715 - PLACE
      ?auto_695717 - HOIST
      ?auto_695720 - SURFACE
      ?auto_695719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_695718 ?auto_695716 ) ( IS-CRATE ?auto_695714 ) ( not ( = ?auto_695713 ?auto_695714 ) ) ( not ( = ?auto_695712 ?auto_695713 ) ) ( not ( = ?auto_695712 ?auto_695714 ) ) ( not ( = ?auto_695715 ?auto_695716 ) ) ( HOIST-AT ?auto_695717 ?auto_695715 ) ( not ( = ?auto_695718 ?auto_695717 ) ) ( AVAILABLE ?auto_695717 ) ( SURFACE-AT ?auto_695714 ?auto_695715 ) ( ON ?auto_695714 ?auto_695720 ) ( CLEAR ?auto_695714 ) ( not ( = ?auto_695713 ?auto_695720 ) ) ( not ( = ?auto_695714 ?auto_695720 ) ) ( not ( = ?auto_695712 ?auto_695720 ) ) ( TRUCK-AT ?auto_695719 ?auto_695716 ) ( SURFACE-AT ?auto_695712 ?auto_695716 ) ( CLEAR ?auto_695712 ) ( LIFTING ?auto_695718 ?auto_695713 ) ( IS-CRATE ?auto_695713 ) ( ON ?auto_695710 ?auto_695709 ) ( ON ?auto_695711 ?auto_695710 ) ( ON ?auto_695712 ?auto_695711 ) ( not ( = ?auto_695709 ?auto_695710 ) ) ( not ( = ?auto_695709 ?auto_695711 ) ) ( not ( = ?auto_695709 ?auto_695712 ) ) ( not ( = ?auto_695709 ?auto_695713 ) ) ( not ( = ?auto_695709 ?auto_695714 ) ) ( not ( = ?auto_695709 ?auto_695720 ) ) ( not ( = ?auto_695710 ?auto_695711 ) ) ( not ( = ?auto_695710 ?auto_695712 ) ) ( not ( = ?auto_695710 ?auto_695713 ) ) ( not ( = ?auto_695710 ?auto_695714 ) ) ( not ( = ?auto_695710 ?auto_695720 ) ) ( not ( = ?auto_695711 ?auto_695712 ) ) ( not ( = ?auto_695711 ?auto_695713 ) ) ( not ( = ?auto_695711 ?auto_695714 ) ) ( not ( = ?auto_695711 ?auto_695720 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_695712 ?auto_695713 ?auto_695714 )
      ( MAKE-5CRATE-VERIFY ?auto_695709 ?auto_695710 ?auto_695711 ?auto_695712 ?auto_695713 ?auto_695714 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_695760 - SURFACE
      ?auto_695761 - SURFACE
      ?auto_695762 - SURFACE
      ?auto_695763 - SURFACE
      ?auto_695764 - SURFACE
      ?auto_695765 - SURFACE
    )
    :vars
    (
      ?auto_695770 - HOIST
      ?auto_695768 - PLACE
      ?auto_695769 - PLACE
      ?auto_695767 - HOIST
      ?auto_695766 - SURFACE
      ?auto_695771 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_695770 ?auto_695768 ) ( IS-CRATE ?auto_695765 ) ( not ( = ?auto_695764 ?auto_695765 ) ) ( not ( = ?auto_695763 ?auto_695764 ) ) ( not ( = ?auto_695763 ?auto_695765 ) ) ( not ( = ?auto_695769 ?auto_695768 ) ) ( HOIST-AT ?auto_695767 ?auto_695769 ) ( not ( = ?auto_695770 ?auto_695767 ) ) ( AVAILABLE ?auto_695767 ) ( SURFACE-AT ?auto_695765 ?auto_695769 ) ( ON ?auto_695765 ?auto_695766 ) ( CLEAR ?auto_695765 ) ( not ( = ?auto_695764 ?auto_695766 ) ) ( not ( = ?auto_695765 ?auto_695766 ) ) ( not ( = ?auto_695763 ?auto_695766 ) ) ( TRUCK-AT ?auto_695771 ?auto_695768 ) ( SURFACE-AT ?auto_695763 ?auto_695768 ) ( CLEAR ?auto_695763 ) ( IS-CRATE ?auto_695764 ) ( AVAILABLE ?auto_695770 ) ( IN ?auto_695764 ?auto_695771 ) ( ON ?auto_695761 ?auto_695760 ) ( ON ?auto_695762 ?auto_695761 ) ( ON ?auto_695763 ?auto_695762 ) ( not ( = ?auto_695760 ?auto_695761 ) ) ( not ( = ?auto_695760 ?auto_695762 ) ) ( not ( = ?auto_695760 ?auto_695763 ) ) ( not ( = ?auto_695760 ?auto_695764 ) ) ( not ( = ?auto_695760 ?auto_695765 ) ) ( not ( = ?auto_695760 ?auto_695766 ) ) ( not ( = ?auto_695761 ?auto_695762 ) ) ( not ( = ?auto_695761 ?auto_695763 ) ) ( not ( = ?auto_695761 ?auto_695764 ) ) ( not ( = ?auto_695761 ?auto_695765 ) ) ( not ( = ?auto_695761 ?auto_695766 ) ) ( not ( = ?auto_695762 ?auto_695763 ) ) ( not ( = ?auto_695762 ?auto_695764 ) ) ( not ( = ?auto_695762 ?auto_695765 ) ) ( not ( = ?auto_695762 ?auto_695766 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_695763 ?auto_695764 ?auto_695765 )
      ( MAKE-5CRATE-VERIFY ?auto_695760 ?auto_695761 ?auto_695762 ?auto_695763 ?auto_695764 ?auto_695765 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_696440 - SURFACE
      ?auto_696441 - SURFACE
    )
    :vars
    (
      ?auto_696445 - HOIST
      ?auto_696446 - PLACE
      ?auto_696448 - SURFACE
      ?auto_696447 - TRUCK
      ?auto_696442 - PLACE
      ?auto_696444 - HOIST
      ?auto_696443 - SURFACE
      ?auto_696449 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_696445 ?auto_696446 ) ( SURFACE-AT ?auto_696440 ?auto_696446 ) ( CLEAR ?auto_696440 ) ( IS-CRATE ?auto_696441 ) ( not ( = ?auto_696440 ?auto_696441 ) ) ( AVAILABLE ?auto_696445 ) ( ON ?auto_696440 ?auto_696448 ) ( not ( = ?auto_696448 ?auto_696440 ) ) ( not ( = ?auto_696448 ?auto_696441 ) ) ( TRUCK-AT ?auto_696447 ?auto_696442 ) ( not ( = ?auto_696442 ?auto_696446 ) ) ( HOIST-AT ?auto_696444 ?auto_696442 ) ( not ( = ?auto_696445 ?auto_696444 ) ) ( SURFACE-AT ?auto_696441 ?auto_696442 ) ( ON ?auto_696441 ?auto_696443 ) ( CLEAR ?auto_696441 ) ( not ( = ?auto_696440 ?auto_696443 ) ) ( not ( = ?auto_696441 ?auto_696443 ) ) ( not ( = ?auto_696448 ?auto_696443 ) ) ( LIFTING ?auto_696444 ?auto_696449 ) ( IS-CRATE ?auto_696449 ) ( not ( = ?auto_696440 ?auto_696449 ) ) ( not ( = ?auto_696441 ?auto_696449 ) ) ( not ( = ?auto_696448 ?auto_696449 ) ) ( not ( = ?auto_696443 ?auto_696449 ) ) )
    :subtasks
    ( ( !LOAD ?auto_696444 ?auto_696449 ?auto_696447 ?auto_696442 )
      ( MAKE-1CRATE ?auto_696440 ?auto_696441 )
      ( MAKE-1CRATE-VERIFY ?auto_696440 ?auto_696441 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_696966 - SURFACE
      ?auto_696967 - SURFACE
      ?auto_696968 - SURFACE
      ?auto_696969 - SURFACE
      ?auto_696970 - SURFACE
      ?auto_696971 - SURFACE
      ?auto_696972 - SURFACE
    )
    :vars
    (
      ?auto_696974 - HOIST
      ?auto_696973 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_696974 ?auto_696973 ) ( SURFACE-AT ?auto_696971 ?auto_696973 ) ( CLEAR ?auto_696971 ) ( LIFTING ?auto_696974 ?auto_696972 ) ( IS-CRATE ?auto_696972 ) ( not ( = ?auto_696971 ?auto_696972 ) ) ( ON ?auto_696967 ?auto_696966 ) ( ON ?auto_696968 ?auto_696967 ) ( ON ?auto_696969 ?auto_696968 ) ( ON ?auto_696970 ?auto_696969 ) ( ON ?auto_696971 ?auto_696970 ) ( not ( = ?auto_696966 ?auto_696967 ) ) ( not ( = ?auto_696966 ?auto_696968 ) ) ( not ( = ?auto_696966 ?auto_696969 ) ) ( not ( = ?auto_696966 ?auto_696970 ) ) ( not ( = ?auto_696966 ?auto_696971 ) ) ( not ( = ?auto_696966 ?auto_696972 ) ) ( not ( = ?auto_696967 ?auto_696968 ) ) ( not ( = ?auto_696967 ?auto_696969 ) ) ( not ( = ?auto_696967 ?auto_696970 ) ) ( not ( = ?auto_696967 ?auto_696971 ) ) ( not ( = ?auto_696967 ?auto_696972 ) ) ( not ( = ?auto_696968 ?auto_696969 ) ) ( not ( = ?auto_696968 ?auto_696970 ) ) ( not ( = ?auto_696968 ?auto_696971 ) ) ( not ( = ?auto_696968 ?auto_696972 ) ) ( not ( = ?auto_696969 ?auto_696970 ) ) ( not ( = ?auto_696969 ?auto_696971 ) ) ( not ( = ?auto_696969 ?auto_696972 ) ) ( not ( = ?auto_696970 ?auto_696971 ) ) ( not ( = ?auto_696970 ?auto_696972 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_696971 ?auto_696972 )
      ( MAKE-6CRATE-VERIFY ?auto_696966 ?auto_696967 ?auto_696968 ?auto_696969 ?auto_696970 ?auto_696971 ?auto_696972 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_697010 - SURFACE
      ?auto_697011 - SURFACE
      ?auto_697012 - SURFACE
      ?auto_697013 - SURFACE
      ?auto_697014 - SURFACE
      ?auto_697015 - SURFACE
      ?auto_697016 - SURFACE
    )
    :vars
    (
      ?auto_697018 - HOIST
      ?auto_697019 - PLACE
      ?auto_697017 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_697018 ?auto_697019 ) ( SURFACE-AT ?auto_697015 ?auto_697019 ) ( CLEAR ?auto_697015 ) ( IS-CRATE ?auto_697016 ) ( not ( = ?auto_697015 ?auto_697016 ) ) ( TRUCK-AT ?auto_697017 ?auto_697019 ) ( AVAILABLE ?auto_697018 ) ( IN ?auto_697016 ?auto_697017 ) ( ON ?auto_697015 ?auto_697014 ) ( not ( = ?auto_697014 ?auto_697015 ) ) ( not ( = ?auto_697014 ?auto_697016 ) ) ( ON ?auto_697011 ?auto_697010 ) ( ON ?auto_697012 ?auto_697011 ) ( ON ?auto_697013 ?auto_697012 ) ( ON ?auto_697014 ?auto_697013 ) ( not ( = ?auto_697010 ?auto_697011 ) ) ( not ( = ?auto_697010 ?auto_697012 ) ) ( not ( = ?auto_697010 ?auto_697013 ) ) ( not ( = ?auto_697010 ?auto_697014 ) ) ( not ( = ?auto_697010 ?auto_697015 ) ) ( not ( = ?auto_697010 ?auto_697016 ) ) ( not ( = ?auto_697011 ?auto_697012 ) ) ( not ( = ?auto_697011 ?auto_697013 ) ) ( not ( = ?auto_697011 ?auto_697014 ) ) ( not ( = ?auto_697011 ?auto_697015 ) ) ( not ( = ?auto_697011 ?auto_697016 ) ) ( not ( = ?auto_697012 ?auto_697013 ) ) ( not ( = ?auto_697012 ?auto_697014 ) ) ( not ( = ?auto_697012 ?auto_697015 ) ) ( not ( = ?auto_697012 ?auto_697016 ) ) ( not ( = ?auto_697013 ?auto_697014 ) ) ( not ( = ?auto_697013 ?auto_697015 ) ) ( not ( = ?auto_697013 ?auto_697016 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_697014 ?auto_697015 ?auto_697016 )
      ( MAKE-6CRATE-VERIFY ?auto_697010 ?auto_697011 ?auto_697012 ?auto_697013 ?auto_697014 ?auto_697015 ?auto_697016 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_697061 - SURFACE
      ?auto_697062 - SURFACE
      ?auto_697063 - SURFACE
      ?auto_697064 - SURFACE
      ?auto_697065 - SURFACE
      ?auto_697066 - SURFACE
      ?auto_697067 - SURFACE
    )
    :vars
    (
      ?auto_697069 - HOIST
      ?auto_697071 - PLACE
      ?auto_697068 - TRUCK
      ?auto_697070 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_697069 ?auto_697071 ) ( SURFACE-AT ?auto_697066 ?auto_697071 ) ( CLEAR ?auto_697066 ) ( IS-CRATE ?auto_697067 ) ( not ( = ?auto_697066 ?auto_697067 ) ) ( AVAILABLE ?auto_697069 ) ( IN ?auto_697067 ?auto_697068 ) ( ON ?auto_697066 ?auto_697065 ) ( not ( = ?auto_697065 ?auto_697066 ) ) ( not ( = ?auto_697065 ?auto_697067 ) ) ( TRUCK-AT ?auto_697068 ?auto_697070 ) ( not ( = ?auto_697070 ?auto_697071 ) ) ( ON ?auto_697062 ?auto_697061 ) ( ON ?auto_697063 ?auto_697062 ) ( ON ?auto_697064 ?auto_697063 ) ( ON ?auto_697065 ?auto_697064 ) ( not ( = ?auto_697061 ?auto_697062 ) ) ( not ( = ?auto_697061 ?auto_697063 ) ) ( not ( = ?auto_697061 ?auto_697064 ) ) ( not ( = ?auto_697061 ?auto_697065 ) ) ( not ( = ?auto_697061 ?auto_697066 ) ) ( not ( = ?auto_697061 ?auto_697067 ) ) ( not ( = ?auto_697062 ?auto_697063 ) ) ( not ( = ?auto_697062 ?auto_697064 ) ) ( not ( = ?auto_697062 ?auto_697065 ) ) ( not ( = ?auto_697062 ?auto_697066 ) ) ( not ( = ?auto_697062 ?auto_697067 ) ) ( not ( = ?auto_697063 ?auto_697064 ) ) ( not ( = ?auto_697063 ?auto_697065 ) ) ( not ( = ?auto_697063 ?auto_697066 ) ) ( not ( = ?auto_697063 ?auto_697067 ) ) ( not ( = ?auto_697064 ?auto_697065 ) ) ( not ( = ?auto_697064 ?auto_697066 ) ) ( not ( = ?auto_697064 ?auto_697067 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_697065 ?auto_697066 ?auto_697067 )
      ( MAKE-6CRATE-VERIFY ?auto_697061 ?auto_697062 ?auto_697063 ?auto_697064 ?auto_697065 ?auto_697066 ?auto_697067 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_697118 - SURFACE
      ?auto_697119 - SURFACE
      ?auto_697120 - SURFACE
      ?auto_697121 - SURFACE
      ?auto_697122 - SURFACE
      ?auto_697123 - SURFACE
      ?auto_697124 - SURFACE
    )
    :vars
    (
      ?auto_697125 - HOIST
      ?auto_697127 - PLACE
      ?auto_697126 - TRUCK
      ?auto_697129 - PLACE
      ?auto_697128 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_697125 ?auto_697127 ) ( SURFACE-AT ?auto_697123 ?auto_697127 ) ( CLEAR ?auto_697123 ) ( IS-CRATE ?auto_697124 ) ( not ( = ?auto_697123 ?auto_697124 ) ) ( AVAILABLE ?auto_697125 ) ( ON ?auto_697123 ?auto_697122 ) ( not ( = ?auto_697122 ?auto_697123 ) ) ( not ( = ?auto_697122 ?auto_697124 ) ) ( TRUCK-AT ?auto_697126 ?auto_697129 ) ( not ( = ?auto_697129 ?auto_697127 ) ) ( HOIST-AT ?auto_697128 ?auto_697129 ) ( LIFTING ?auto_697128 ?auto_697124 ) ( not ( = ?auto_697125 ?auto_697128 ) ) ( ON ?auto_697119 ?auto_697118 ) ( ON ?auto_697120 ?auto_697119 ) ( ON ?auto_697121 ?auto_697120 ) ( ON ?auto_697122 ?auto_697121 ) ( not ( = ?auto_697118 ?auto_697119 ) ) ( not ( = ?auto_697118 ?auto_697120 ) ) ( not ( = ?auto_697118 ?auto_697121 ) ) ( not ( = ?auto_697118 ?auto_697122 ) ) ( not ( = ?auto_697118 ?auto_697123 ) ) ( not ( = ?auto_697118 ?auto_697124 ) ) ( not ( = ?auto_697119 ?auto_697120 ) ) ( not ( = ?auto_697119 ?auto_697121 ) ) ( not ( = ?auto_697119 ?auto_697122 ) ) ( not ( = ?auto_697119 ?auto_697123 ) ) ( not ( = ?auto_697119 ?auto_697124 ) ) ( not ( = ?auto_697120 ?auto_697121 ) ) ( not ( = ?auto_697120 ?auto_697122 ) ) ( not ( = ?auto_697120 ?auto_697123 ) ) ( not ( = ?auto_697120 ?auto_697124 ) ) ( not ( = ?auto_697121 ?auto_697122 ) ) ( not ( = ?auto_697121 ?auto_697123 ) ) ( not ( = ?auto_697121 ?auto_697124 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_697122 ?auto_697123 ?auto_697124 )
      ( MAKE-6CRATE-VERIFY ?auto_697118 ?auto_697119 ?auto_697120 ?auto_697121 ?auto_697122 ?auto_697123 ?auto_697124 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_697181 - SURFACE
      ?auto_697182 - SURFACE
      ?auto_697183 - SURFACE
      ?auto_697184 - SURFACE
      ?auto_697185 - SURFACE
      ?auto_697186 - SURFACE
      ?auto_697187 - SURFACE
    )
    :vars
    (
      ?auto_697190 - HOIST
      ?auto_697189 - PLACE
      ?auto_697191 - TRUCK
      ?auto_697188 - PLACE
      ?auto_697193 - HOIST
      ?auto_697192 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_697190 ?auto_697189 ) ( SURFACE-AT ?auto_697186 ?auto_697189 ) ( CLEAR ?auto_697186 ) ( IS-CRATE ?auto_697187 ) ( not ( = ?auto_697186 ?auto_697187 ) ) ( AVAILABLE ?auto_697190 ) ( ON ?auto_697186 ?auto_697185 ) ( not ( = ?auto_697185 ?auto_697186 ) ) ( not ( = ?auto_697185 ?auto_697187 ) ) ( TRUCK-AT ?auto_697191 ?auto_697188 ) ( not ( = ?auto_697188 ?auto_697189 ) ) ( HOIST-AT ?auto_697193 ?auto_697188 ) ( not ( = ?auto_697190 ?auto_697193 ) ) ( AVAILABLE ?auto_697193 ) ( SURFACE-AT ?auto_697187 ?auto_697188 ) ( ON ?auto_697187 ?auto_697192 ) ( CLEAR ?auto_697187 ) ( not ( = ?auto_697186 ?auto_697192 ) ) ( not ( = ?auto_697187 ?auto_697192 ) ) ( not ( = ?auto_697185 ?auto_697192 ) ) ( ON ?auto_697182 ?auto_697181 ) ( ON ?auto_697183 ?auto_697182 ) ( ON ?auto_697184 ?auto_697183 ) ( ON ?auto_697185 ?auto_697184 ) ( not ( = ?auto_697181 ?auto_697182 ) ) ( not ( = ?auto_697181 ?auto_697183 ) ) ( not ( = ?auto_697181 ?auto_697184 ) ) ( not ( = ?auto_697181 ?auto_697185 ) ) ( not ( = ?auto_697181 ?auto_697186 ) ) ( not ( = ?auto_697181 ?auto_697187 ) ) ( not ( = ?auto_697181 ?auto_697192 ) ) ( not ( = ?auto_697182 ?auto_697183 ) ) ( not ( = ?auto_697182 ?auto_697184 ) ) ( not ( = ?auto_697182 ?auto_697185 ) ) ( not ( = ?auto_697182 ?auto_697186 ) ) ( not ( = ?auto_697182 ?auto_697187 ) ) ( not ( = ?auto_697182 ?auto_697192 ) ) ( not ( = ?auto_697183 ?auto_697184 ) ) ( not ( = ?auto_697183 ?auto_697185 ) ) ( not ( = ?auto_697183 ?auto_697186 ) ) ( not ( = ?auto_697183 ?auto_697187 ) ) ( not ( = ?auto_697183 ?auto_697192 ) ) ( not ( = ?auto_697184 ?auto_697185 ) ) ( not ( = ?auto_697184 ?auto_697186 ) ) ( not ( = ?auto_697184 ?auto_697187 ) ) ( not ( = ?auto_697184 ?auto_697192 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_697185 ?auto_697186 ?auto_697187 )
      ( MAKE-6CRATE-VERIFY ?auto_697181 ?auto_697182 ?auto_697183 ?auto_697184 ?auto_697185 ?auto_697186 ?auto_697187 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_697245 - SURFACE
      ?auto_697246 - SURFACE
      ?auto_697247 - SURFACE
      ?auto_697248 - SURFACE
      ?auto_697249 - SURFACE
      ?auto_697250 - SURFACE
      ?auto_697251 - SURFACE
    )
    :vars
    (
      ?auto_697252 - HOIST
      ?auto_697255 - PLACE
      ?auto_697257 - PLACE
      ?auto_697253 - HOIST
      ?auto_697256 - SURFACE
      ?auto_697254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_697252 ?auto_697255 ) ( SURFACE-AT ?auto_697250 ?auto_697255 ) ( CLEAR ?auto_697250 ) ( IS-CRATE ?auto_697251 ) ( not ( = ?auto_697250 ?auto_697251 ) ) ( AVAILABLE ?auto_697252 ) ( ON ?auto_697250 ?auto_697249 ) ( not ( = ?auto_697249 ?auto_697250 ) ) ( not ( = ?auto_697249 ?auto_697251 ) ) ( not ( = ?auto_697257 ?auto_697255 ) ) ( HOIST-AT ?auto_697253 ?auto_697257 ) ( not ( = ?auto_697252 ?auto_697253 ) ) ( AVAILABLE ?auto_697253 ) ( SURFACE-AT ?auto_697251 ?auto_697257 ) ( ON ?auto_697251 ?auto_697256 ) ( CLEAR ?auto_697251 ) ( not ( = ?auto_697250 ?auto_697256 ) ) ( not ( = ?auto_697251 ?auto_697256 ) ) ( not ( = ?auto_697249 ?auto_697256 ) ) ( TRUCK-AT ?auto_697254 ?auto_697255 ) ( ON ?auto_697246 ?auto_697245 ) ( ON ?auto_697247 ?auto_697246 ) ( ON ?auto_697248 ?auto_697247 ) ( ON ?auto_697249 ?auto_697248 ) ( not ( = ?auto_697245 ?auto_697246 ) ) ( not ( = ?auto_697245 ?auto_697247 ) ) ( not ( = ?auto_697245 ?auto_697248 ) ) ( not ( = ?auto_697245 ?auto_697249 ) ) ( not ( = ?auto_697245 ?auto_697250 ) ) ( not ( = ?auto_697245 ?auto_697251 ) ) ( not ( = ?auto_697245 ?auto_697256 ) ) ( not ( = ?auto_697246 ?auto_697247 ) ) ( not ( = ?auto_697246 ?auto_697248 ) ) ( not ( = ?auto_697246 ?auto_697249 ) ) ( not ( = ?auto_697246 ?auto_697250 ) ) ( not ( = ?auto_697246 ?auto_697251 ) ) ( not ( = ?auto_697246 ?auto_697256 ) ) ( not ( = ?auto_697247 ?auto_697248 ) ) ( not ( = ?auto_697247 ?auto_697249 ) ) ( not ( = ?auto_697247 ?auto_697250 ) ) ( not ( = ?auto_697247 ?auto_697251 ) ) ( not ( = ?auto_697247 ?auto_697256 ) ) ( not ( = ?auto_697248 ?auto_697249 ) ) ( not ( = ?auto_697248 ?auto_697250 ) ) ( not ( = ?auto_697248 ?auto_697251 ) ) ( not ( = ?auto_697248 ?auto_697256 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_697249 ?auto_697250 ?auto_697251 )
      ( MAKE-6CRATE-VERIFY ?auto_697245 ?auto_697246 ?auto_697247 ?auto_697248 ?auto_697249 ?auto_697250 ?auto_697251 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_697309 - SURFACE
      ?auto_697310 - SURFACE
      ?auto_697311 - SURFACE
      ?auto_697312 - SURFACE
      ?auto_697313 - SURFACE
      ?auto_697314 - SURFACE
      ?auto_697315 - SURFACE
    )
    :vars
    (
      ?auto_697318 - HOIST
      ?auto_697317 - PLACE
      ?auto_697321 - PLACE
      ?auto_697316 - HOIST
      ?auto_697320 - SURFACE
      ?auto_697319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_697318 ?auto_697317 ) ( IS-CRATE ?auto_697315 ) ( not ( = ?auto_697314 ?auto_697315 ) ) ( not ( = ?auto_697313 ?auto_697314 ) ) ( not ( = ?auto_697313 ?auto_697315 ) ) ( not ( = ?auto_697321 ?auto_697317 ) ) ( HOIST-AT ?auto_697316 ?auto_697321 ) ( not ( = ?auto_697318 ?auto_697316 ) ) ( AVAILABLE ?auto_697316 ) ( SURFACE-AT ?auto_697315 ?auto_697321 ) ( ON ?auto_697315 ?auto_697320 ) ( CLEAR ?auto_697315 ) ( not ( = ?auto_697314 ?auto_697320 ) ) ( not ( = ?auto_697315 ?auto_697320 ) ) ( not ( = ?auto_697313 ?auto_697320 ) ) ( TRUCK-AT ?auto_697319 ?auto_697317 ) ( SURFACE-AT ?auto_697313 ?auto_697317 ) ( CLEAR ?auto_697313 ) ( LIFTING ?auto_697318 ?auto_697314 ) ( IS-CRATE ?auto_697314 ) ( ON ?auto_697310 ?auto_697309 ) ( ON ?auto_697311 ?auto_697310 ) ( ON ?auto_697312 ?auto_697311 ) ( ON ?auto_697313 ?auto_697312 ) ( not ( = ?auto_697309 ?auto_697310 ) ) ( not ( = ?auto_697309 ?auto_697311 ) ) ( not ( = ?auto_697309 ?auto_697312 ) ) ( not ( = ?auto_697309 ?auto_697313 ) ) ( not ( = ?auto_697309 ?auto_697314 ) ) ( not ( = ?auto_697309 ?auto_697315 ) ) ( not ( = ?auto_697309 ?auto_697320 ) ) ( not ( = ?auto_697310 ?auto_697311 ) ) ( not ( = ?auto_697310 ?auto_697312 ) ) ( not ( = ?auto_697310 ?auto_697313 ) ) ( not ( = ?auto_697310 ?auto_697314 ) ) ( not ( = ?auto_697310 ?auto_697315 ) ) ( not ( = ?auto_697310 ?auto_697320 ) ) ( not ( = ?auto_697311 ?auto_697312 ) ) ( not ( = ?auto_697311 ?auto_697313 ) ) ( not ( = ?auto_697311 ?auto_697314 ) ) ( not ( = ?auto_697311 ?auto_697315 ) ) ( not ( = ?auto_697311 ?auto_697320 ) ) ( not ( = ?auto_697312 ?auto_697313 ) ) ( not ( = ?auto_697312 ?auto_697314 ) ) ( not ( = ?auto_697312 ?auto_697315 ) ) ( not ( = ?auto_697312 ?auto_697320 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_697313 ?auto_697314 ?auto_697315 )
      ( MAKE-6CRATE-VERIFY ?auto_697309 ?auto_697310 ?auto_697311 ?auto_697312 ?auto_697313 ?auto_697314 ?auto_697315 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_697373 - SURFACE
      ?auto_697374 - SURFACE
      ?auto_697375 - SURFACE
      ?auto_697376 - SURFACE
      ?auto_697377 - SURFACE
      ?auto_697378 - SURFACE
      ?auto_697379 - SURFACE
    )
    :vars
    (
      ?auto_697382 - HOIST
      ?auto_697385 - PLACE
      ?auto_697381 - PLACE
      ?auto_697380 - HOIST
      ?auto_697384 - SURFACE
      ?auto_697383 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_697382 ?auto_697385 ) ( IS-CRATE ?auto_697379 ) ( not ( = ?auto_697378 ?auto_697379 ) ) ( not ( = ?auto_697377 ?auto_697378 ) ) ( not ( = ?auto_697377 ?auto_697379 ) ) ( not ( = ?auto_697381 ?auto_697385 ) ) ( HOIST-AT ?auto_697380 ?auto_697381 ) ( not ( = ?auto_697382 ?auto_697380 ) ) ( AVAILABLE ?auto_697380 ) ( SURFACE-AT ?auto_697379 ?auto_697381 ) ( ON ?auto_697379 ?auto_697384 ) ( CLEAR ?auto_697379 ) ( not ( = ?auto_697378 ?auto_697384 ) ) ( not ( = ?auto_697379 ?auto_697384 ) ) ( not ( = ?auto_697377 ?auto_697384 ) ) ( TRUCK-AT ?auto_697383 ?auto_697385 ) ( SURFACE-AT ?auto_697377 ?auto_697385 ) ( CLEAR ?auto_697377 ) ( IS-CRATE ?auto_697378 ) ( AVAILABLE ?auto_697382 ) ( IN ?auto_697378 ?auto_697383 ) ( ON ?auto_697374 ?auto_697373 ) ( ON ?auto_697375 ?auto_697374 ) ( ON ?auto_697376 ?auto_697375 ) ( ON ?auto_697377 ?auto_697376 ) ( not ( = ?auto_697373 ?auto_697374 ) ) ( not ( = ?auto_697373 ?auto_697375 ) ) ( not ( = ?auto_697373 ?auto_697376 ) ) ( not ( = ?auto_697373 ?auto_697377 ) ) ( not ( = ?auto_697373 ?auto_697378 ) ) ( not ( = ?auto_697373 ?auto_697379 ) ) ( not ( = ?auto_697373 ?auto_697384 ) ) ( not ( = ?auto_697374 ?auto_697375 ) ) ( not ( = ?auto_697374 ?auto_697376 ) ) ( not ( = ?auto_697374 ?auto_697377 ) ) ( not ( = ?auto_697374 ?auto_697378 ) ) ( not ( = ?auto_697374 ?auto_697379 ) ) ( not ( = ?auto_697374 ?auto_697384 ) ) ( not ( = ?auto_697375 ?auto_697376 ) ) ( not ( = ?auto_697375 ?auto_697377 ) ) ( not ( = ?auto_697375 ?auto_697378 ) ) ( not ( = ?auto_697375 ?auto_697379 ) ) ( not ( = ?auto_697375 ?auto_697384 ) ) ( not ( = ?auto_697376 ?auto_697377 ) ) ( not ( = ?auto_697376 ?auto_697378 ) ) ( not ( = ?auto_697376 ?auto_697379 ) ) ( not ( = ?auto_697376 ?auto_697384 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_697377 ?auto_697378 ?auto_697379 )
      ( MAKE-6CRATE-VERIFY ?auto_697373 ?auto_697374 ?auto_697375 ?auto_697376 ?auto_697377 ?auto_697378 ?auto_697379 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_698647 - SURFACE
      ?auto_698648 - SURFACE
    )
    :vars
    (
      ?auto_698654 - HOIST
      ?auto_698649 - PLACE
      ?auto_698651 - SURFACE
      ?auto_698655 - PLACE
      ?auto_698652 - HOIST
      ?auto_698653 - SURFACE
      ?auto_698650 - TRUCK
      ?auto_698656 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_698654 ?auto_698649 ) ( SURFACE-AT ?auto_698647 ?auto_698649 ) ( CLEAR ?auto_698647 ) ( IS-CRATE ?auto_698648 ) ( not ( = ?auto_698647 ?auto_698648 ) ) ( ON ?auto_698647 ?auto_698651 ) ( not ( = ?auto_698651 ?auto_698647 ) ) ( not ( = ?auto_698651 ?auto_698648 ) ) ( not ( = ?auto_698655 ?auto_698649 ) ) ( HOIST-AT ?auto_698652 ?auto_698655 ) ( not ( = ?auto_698654 ?auto_698652 ) ) ( AVAILABLE ?auto_698652 ) ( SURFACE-AT ?auto_698648 ?auto_698655 ) ( ON ?auto_698648 ?auto_698653 ) ( CLEAR ?auto_698648 ) ( not ( = ?auto_698647 ?auto_698653 ) ) ( not ( = ?auto_698648 ?auto_698653 ) ) ( not ( = ?auto_698651 ?auto_698653 ) ) ( TRUCK-AT ?auto_698650 ?auto_698649 ) ( LIFTING ?auto_698654 ?auto_698656 ) ( IS-CRATE ?auto_698656 ) ( not ( = ?auto_698647 ?auto_698656 ) ) ( not ( = ?auto_698648 ?auto_698656 ) ) ( not ( = ?auto_698651 ?auto_698656 ) ) ( not ( = ?auto_698653 ?auto_698656 ) ) )
    :subtasks
    ( ( !LOAD ?auto_698654 ?auto_698656 ?auto_698650 ?auto_698649 )
      ( MAKE-1CRATE ?auto_698647 ?auto_698648 )
      ( MAKE-1CRATE-VERIFY ?auto_698647 ?auto_698648 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_699324 - SURFACE
      ?auto_699325 - SURFACE
      ?auto_699326 - SURFACE
      ?auto_699327 - SURFACE
      ?auto_699328 - SURFACE
      ?auto_699329 - SURFACE
      ?auto_699330 - SURFACE
      ?auto_699331 - SURFACE
    )
    :vars
    (
      ?auto_699332 - HOIST
      ?auto_699333 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_699332 ?auto_699333 ) ( SURFACE-AT ?auto_699330 ?auto_699333 ) ( CLEAR ?auto_699330 ) ( LIFTING ?auto_699332 ?auto_699331 ) ( IS-CRATE ?auto_699331 ) ( not ( = ?auto_699330 ?auto_699331 ) ) ( ON ?auto_699325 ?auto_699324 ) ( ON ?auto_699326 ?auto_699325 ) ( ON ?auto_699327 ?auto_699326 ) ( ON ?auto_699328 ?auto_699327 ) ( ON ?auto_699329 ?auto_699328 ) ( ON ?auto_699330 ?auto_699329 ) ( not ( = ?auto_699324 ?auto_699325 ) ) ( not ( = ?auto_699324 ?auto_699326 ) ) ( not ( = ?auto_699324 ?auto_699327 ) ) ( not ( = ?auto_699324 ?auto_699328 ) ) ( not ( = ?auto_699324 ?auto_699329 ) ) ( not ( = ?auto_699324 ?auto_699330 ) ) ( not ( = ?auto_699324 ?auto_699331 ) ) ( not ( = ?auto_699325 ?auto_699326 ) ) ( not ( = ?auto_699325 ?auto_699327 ) ) ( not ( = ?auto_699325 ?auto_699328 ) ) ( not ( = ?auto_699325 ?auto_699329 ) ) ( not ( = ?auto_699325 ?auto_699330 ) ) ( not ( = ?auto_699325 ?auto_699331 ) ) ( not ( = ?auto_699326 ?auto_699327 ) ) ( not ( = ?auto_699326 ?auto_699328 ) ) ( not ( = ?auto_699326 ?auto_699329 ) ) ( not ( = ?auto_699326 ?auto_699330 ) ) ( not ( = ?auto_699326 ?auto_699331 ) ) ( not ( = ?auto_699327 ?auto_699328 ) ) ( not ( = ?auto_699327 ?auto_699329 ) ) ( not ( = ?auto_699327 ?auto_699330 ) ) ( not ( = ?auto_699327 ?auto_699331 ) ) ( not ( = ?auto_699328 ?auto_699329 ) ) ( not ( = ?auto_699328 ?auto_699330 ) ) ( not ( = ?auto_699328 ?auto_699331 ) ) ( not ( = ?auto_699329 ?auto_699330 ) ) ( not ( = ?auto_699329 ?auto_699331 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_699330 ?auto_699331 )
      ( MAKE-7CRATE-VERIFY ?auto_699324 ?auto_699325 ?auto_699326 ?auto_699327 ?auto_699328 ?auto_699329 ?auto_699330 ?auto_699331 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_699379 - SURFACE
      ?auto_699380 - SURFACE
      ?auto_699381 - SURFACE
      ?auto_699382 - SURFACE
      ?auto_699383 - SURFACE
      ?auto_699384 - SURFACE
      ?auto_699385 - SURFACE
      ?auto_699386 - SURFACE
    )
    :vars
    (
      ?auto_699389 - HOIST
      ?auto_699387 - PLACE
      ?auto_699388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_699389 ?auto_699387 ) ( SURFACE-AT ?auto_699385 ?auto_699387 ) ( CLEAR ?auto_699385 ) ( IS-CRATE ?auto_699386 ) ( not ( = ?auto_699385 ?auto_699386 ) ) ( TRUCK-AT ?auto_699388 ?auto_699387 ) ( AVAILABLE ?auto_699389 ) ( IN ?auto_699386 ?auto_699388 ) ( ON ?auto_699385 ?auto_699384 ) ( not ( = ?auto_699384 ?auto_699385 ) ) ( not ( = ?auto_699384 ?auto_699386 ) ) ( ON ?auto_699380 ?auto_699379 ) ( ON ?auto_699381 ?auto_699380 ) ( ON ?auto_699382 ?auto_699381 ) ( ON ?auto_699383 ?auto_699382 ) ( ON ?auto_699384 ?auto_699383 ) ( not ( = ?auto_699379 ?auto_699380 ) ) ( not ( = ?auto_699379 ?auto_699381 ) ) ( not ( = ?auto_699379 ?auto_699382 ) ) ( not ( = ?auto_699379 ?auto_699383 ) ) ( not ( = ?auto_699379 ?auto_699384 ) ) ( not ( = ?auto_699379 ?auto_699385 ) ) ( not ( = ?auto_699379 ?auto_699386 ) ) ( not ( = ?auto_699380 ?auto_699381 ) ) ( not ( = ?auto_699380 ?auto_699382 ) ) ( not ( = ?auto_699380 ?auto_699383 ) ) ( not ( = ?auto_699380 ?auto_699384 ) ) ( not ( = ?auto_699380 ?auto_699385 ) ) ( not ( = ?auto_699380 ?auto_699386 ) ) ( not ( = ?auto_699381 ?auto_699382 ) ) ( not ( = ?auto_699381 ?auto_699383 ) ) ( not ( = ?auto_699381 ?auto_699384 ) ) ( not ( = ?auto_699381 ?auto_699385 ) ) ( not ( = ?auto_699381 ?auto_699386 ) ) ( not ( = ?auto_699382 ?auto_699383 ) ) ( not ( = ?auto_699382 ?auto_699384 ) ) ( not ( = ?auto_699382 ?auto_699385 ) ) ( not ( = ?auto_699382 ?auto_699386 ) ) ( not ( = ?auto_699383 ?auto_699384 ) ) ( not ( = ?auto_699383 ?auto_699385 ) ) ( not ( = ?auto_699383 ?auto_699386 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_699384 ?auto_699385 ?auto_699386 )
      ( MAKE-7CRATE-VERIFY ?auto_699379 ?auto_699380 ?auto_699381 ?auto_699382 ?auto_699383 ?auto_699384 ?auto_699385 ?auto_699386 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_699442 - SURFACE
      ?auto_699443 - SURFACE
      ?auto_699444 - SURFACE
      ?auto_699445 - SURFACE
      ?auto_699446 - SURFACE
      ?auto_699447 - SURFACE
      ?auto_699448 - SURFACE
      ?auto_699449 - SURFACE
    )
    :vars
    (
      ?auto_699453 - HOIST
      ?auto_699451 - PLACE
      ?auto_699452 - TRUCK
      ?auto_699450 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_699453 ?auto_699451 ) ( SURFACE-AT ?auto_699448 ?auto_699451 ) ( CLEAR ?auto_699448 ) ( IS-CRATE ?auto_699449 ) ( not ( = ?auto_699448 ?auto_699449 ) ) ( AVAILABLE ?auto_699453 ) ( IN ?auto_699449 ?auto_699452 ) ( ON ?auto_699448 ?auto_699447 ) ( not ( = ?auto_699447 ?auto_699448 ) ) ( not ( = ?auto_699447 ?auto_699449 ) ) ( TRUCK-AT ?auto_699452 ?auto_699450 ) ( not ( = ?auto_699450 ?auto_699451 ) ) ( ON ?auto_699443 ?auto_699442 ) ( ON ?auto_699444 ?auto_699443 ) ( ON ?auto_699445 ?auto_699444 ) ( ON ?auto_699446 ?auto_699445 ) ( ON ?auto_699447 ?auto_699446 ) ( not ( = ?auto_699442 ?auto_699443 ) ) ( not ( = ?auto_699442 ?auto_699444 ) ) ( not ( = ?auto_699442 ?auto_699445 ) ) ( not ( = ?auto_699442 ?auto_699446 ) ) ( not ( = ?auto_699442 ?auto_699447 ) ) ( not ( = ?auto_699442 ?auto_699448 ) ) ( not ( = ?auto_699442 ?auto_699449 ) ) ( not ( = ?auto_699443 ?auto_699444 ) ) ( not ( = ?auto_699443 ?auto_699445 ) ) ( not ( = ?auto_699443 ?auto_699446 ) ) ( not ( = ?auto_699443 ?auto_699447 ) ) ( not ( = ?auto_699443 ?auto_699448 ) ) ( not ( = ?auto_699443 ?auto_699449 ) ) ( not ( = ?auto_699444 ?auto_699445 ) ) ( not ( = ?auto_699444 ?auto_699446 ) ) ( not ( = ?auto_699444 ?auto_699447 ) ) ( not ( = ?auto_699444 ?auto_699448 ) ) ( not ( = ?auto_699444 ?auto_699449 ) ) ( not ( = ?auto_699445 ?auto_699446 ) ) ( not ( = ?auto_699445 ?auto_699447 ) ) ( not ( = ?auto_699445 ?auto_699448 ) ) ( not ( = ?auto_699445 ?auto_699449 ) ) ( not ( = ?auto_699446 ?auto_699447 ) ) ( not ( = ?auto_699446 ?auto_699448 ) ) ( not ( = ?auto_699446 ?auto_699449 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_699447 ?auto_699448 ?auto_699449 )
      ( MAKE-7CRATE-VERIFY ?auto_699442 ?auto_699443 ?auto_699444 ?auto_699445 ?auto_699446 ?auto_699447 ?auto_699448 ?auto_699449 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_699512 - SURFACE
      ?auto_699513 - SURFACE
      ?auto_699514 - SURFACE
      ?auto_699515 - SURFACE
      ?auto_699516 - SURFACE
      ?auto_699517 - SURFACE
      ?auto_699518 - SURFACE
      ?auto_699519 - SURFACE
    )
    :vars
    (
      ?auto_699522 - HOIST
      ?auto_699520 - PLACE
      ?auto_699521 - TRUCK
      ?auto_699524 - PLACE
      ?auto_699523 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_699522 ?auto_699520 ) ( SURFACE-AT ?auto_699518 ?auto_699520 ) ( CLEAR ?auto_699518 ) ( IS-CRATE ?auto_699519 ) ( not ( = ?auto_699518 ?auto_699519 ) ) ( AVAILABLE ?auto_699522 ) ( ON ?auto_699518 ?auto_699517 ) ( not ( = ?auto_699517 ?auto_699518 ) ) ( not ( = ?auto_699517 ?auto_699519 ) ) ( TRUCK-AT ?auto_699521 ?auto_699524 ) ( not ( = ?auto_699524 ?auto_699520 ) ) ( HOIST-AT ?auto_699523 ?auto_699524 ) ( LIFTING ?auto_699523 ?auto_699519 ) ( not ( = ?auto_699522 ?auto_699523 ) ) ( ON ?auto_699513 ?auto_699512 ) ( ON ?auto_699514 ?auto_699513 ) ( ON ?auto_699515 ?auto_699514 ) ( ON ?auto_699516 ?auto_699515 ) ( ON ?auto_699517 ?auto_699516 ) ( not ( = ?auto_699512 ?auto_699513 ) ) ( not ( = ?auto_699512 ?auto_699514 ) ) ( not ( = ?auto_699512 ?auto_699515 ) ) ( not ( = ?auto_699512 ?auto_699516 ) ) ( not ( = ?auto_699512 ?auto_699517 ) ) ( not ( = ?auto_699512 ?auto_699518 ) ) ( not ( = ?auto_699512 ?auto_699519 ) ) ( not ( = ?auto_699513 ?auto_699514 ) ) ( not ( = ?auto_699513 ?auto_699515 ) ) ( not ( = ?auto_699513 ?auto_699516 ) ) ( not ( = ?auto_699513 ?auto_699517 ) ) ( not ( = ?auto_699513 ?auto_699518 ) ) ( not ( = ?auto_699513 ?auto_699519 ) ) ( not ( = ?auto_699514 ?auto_699515 ) ) ( not ( = ?auto_699514 ?auto_699516 ) ) ( not ( = ?auto_699514 ?auto_699517 ) ) ( not ( = ?auto_699514 ?auto_699518 ) ) ( not ( = ?auto_699514 ?auto_699519 ) ) ( not ( = ?auto_699515 ?auto_699516 ) ) ( not ( = ?auto_699515 ?auto_699517 ) ) ( not ( = ?auto_699515 ?auto_699518 ) ) ( not ( = ?auto_699515 ?auto_699519 ) ) ( not ( = ?auto_699516 ?auto_699517 ) ) ( not ( = ?auto_699516 ?auto_699518 ) ) ( not ( = ?auto_699516 ?auto_699519 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_699517 ?auto_699518 ?auto_699519 )
      ( MAKE-7CRATE-VERIFY ?auto_699512 ?auto_699513 ?auto_699514 ?auto_699515 ?auto_699516 ?auto_699517 ?auto_699518 ?auto_699519 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_699589 - SURFACE
      ?auto_699590 - SURFACE
      ?auto_699591 - SURFACE
      ?auto_699592 - SURFACE
      ?auto_699593 - SURFACE
      ?auto_699594 - SURFACE
      ?auto_699595 - SURFACE
      ?auto_699596 - SURFACE
    )
    :vars
    (
      ?auto_699598 - HOIST
      ?auto_699597 - PLACE
      ?auto_699599 - TRUCK
      ?auto_699601 - PLACE
      ?auto_699602 - HOIST
      ?auto_699600 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_699598 ?auto_699597 ) ( SURFACE-AT ?auto_699595 ?auto_699597 ) ( CLEAR ?auto_699595 ) ( IS-CRATE ?auto_699596 ) ( not ( = ?auto_699595 ?auto_699596 ) ) ( AVAILABLE ?auto_699598 ) ( ON ?auto_699595 ?auto_699594 ) ( not ( = ?auto_699594 ?auto_699595 ) ) ( not ( = ?auto_699594 ?auto_699596 ) ) ( TRUCK-AT ?auto_699599 ?auto_699601 ) ( not ( = ?auto_699601 ?auto_699597 ) ) ( HOIST-AT ?auto_699602 ?auto_699601 ) ( not ( = ?auto_699598 ?auto_699602 ) ) ( AVAILABLE ?auto_699602 ) ( SURFACE-AT ?auto_699596 ?auto_699601 ) ( ON ?auto_699596 ?auto_699600 ) ( CLEAR ?auto_699596 ) ( not ( = ?auto_699595 ?auto_699600 ) ) ( not ( = ?auto_699596 ?auto_699600 ) ) ( not ( = ?auto_699594 ?auto_699600 ) ) ( ON ?auto_699590 ?auto_699589 ) ( ON ?auto_699591 ?auto_699590 ) ( ON ?auto_699592 ?auto_699591 ) ( ON ?auto_699593 ?auto_699592 ) ( ON ?auto_699594 ?auto_699593 ) ( not ( = ?auto_699589 ?auto_699590 ) ) ( not ( = ?auto_699589 ?auto_699591 ) ) ( not ( = ?auto_699589 ?auto_699592 ) ) ( not ( = ?auto_699589 ?auto_699593 ) ) ( not ( = ?auto_699589 ?auto_699594 ) ) ( not ( = ?auto_699589 ?auto_699595 ) ) ( not ( = ?auto_699589 ?auto_699596 ) ) ( not ( = ?auto_699589 ?auto_699600 ) ) ( not ( = ?auto_699590 ?auto_699591 ) ) ( not ( = ?auto_699590 ?auto_699592 ) ) ( not ( = ?auto_699590 ?auto_699593 ) ) ( not ( = ?auto_699590 ?auto_699594 ) ) ( not ( = ?auto_699590 ?auto_699595 ) ) ( not ( = ?auto_699590 ?auto_699596 ) ) ( not ( = ?auto_699590 ?auto_699600 ) ) ( not ( = ?auto_699591 ?auto_699592 ) ) ( not ( = ?auto_699591 ?auto_699593 ) ) ( not ( = ?auto_699591 ?auto_699594 ) ) ( not ( = ?auto_699591 ?auto_699595 ) ) ( not ( = ?auto_699591 ?auto_699596 ) ) ( not ( = ?auto_699591 ?auto_699600 ) ) ( not ( = ?auto_699592 ?auto_699593 ) ) ( not ( = ?auto_699592 ?auto_699594 ) ) ( not ( = ?auto_699592 ?auto_699595 ) ) ( not ( = ?auto_699592 ?auto_699596 ) ) ( not ( = ?auto_699592 ?auto_699600 ) ) ( not ( = ?auto_699593 ?auto_699594 ) ) ( not ( = ?auto_699593 ?auto_699595 ) ) ( not ( = ?auto_699593 ?auto_699596 ) ) ( not ( = ?auto_699593 ?auto_699600 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_699594 ?auto_699595 ?auto_699596 )
      ( MAKE-7CRATE-VERIFY ?auto_699589 ?auto_699590 ?auto_699591 ?auto_699592 ?auto_699593 ?auto_699594 ?auto_699595 ?auto_699596 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_699667 - SURFACE
      ?auto_699668 - SURFACE
      ?auto_699669 - SURFACE
      ?auto_699670 - SURFACE
      ?auto_699671 - SURFACE
      ?auto_699672 - SURFACE
      ?auto_699673 - SURFACE
      ?auto_699674 - SURFACE
    )
    :vars
    (
      ?auto_699677 - HOIST
      ?auto_699675 - PLACE
      ?auto_699680 - PLACE
      ?auto_699678 - HOIST
      ?auto_699679 - SURFACE
      ?auto_699676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_699677 ?auto_699675 ) ( SURFACE-AT ?auto_699673 ?auto_699675 ) ( CLEAR ?auto_699673 ) ( IS-CRATE ?auto_699674 ) ( not ( = ?auto_699673 ?auto_699674 ) ) ( AVAILABLE ?auto_699677 ) ( ON ?auto_699673 ?auto_699672 ) ( not ( = ?auto_699672 ?auto_699673 ) ) ( not ( = ?auto_699672 ?auto_699674 ) ) ( not ( = ?auto_699680 ?auto_699675 ) ) ( HOIST-AT ?auto_699678 ?auto_699680 ) ( not ( = ?auto_699677 ?auto_699678 ) ) ( AVAILABLE ?auto_699678 ) ( SURFACE-AT ?auto_699674 ?auto_699680 ) ( ON ?auto_699674 ?auto_699679 ) ( CLEAR ?auto_699674 ) ( not ( = ?auto_699673 ?auto_699679 ) ) ( not ( = ?auto_699674 ?auto_699679 ) ) ( not ( = ?auto_699672 ?auto_699679 ) ) ( TRUCK-AT ?auto_699676 ?auto_699675 ) ( ON ?auto_699668 ?auto_699667 ) ( ON ?auto_699669 ?auto_699668 ) ( ON ?auto_699670 ?auto_699669 ) ( ON ?auto_699671 ?auto_699670 ) ( ON ?auto_699672 ?auto_699671 ) ( not ( = ?auto_699667 ?auto_699668 ) ) ( not ( = ?auto_699667 ?auto_699669 ) ) ( not ( = ?auto_699667 ?auto_699670 ) ) ( not ( = ?auto_699667 ?auto_699671 ) ) ( not ( = ?auto_699667 ?auto_699672 ) ) ( not ( = ?auto_699667 ?auto_699673 ) ) ( not ( = ?auto_699667 ?auto_699674 ) ) ( not ( = ?auto_699667 ?auto_699679 ) ) ( not ( = ?auto_699668 ?auto_699669 ) ) ( not ( = ?auto_699668 ?auto_699670 ) ) ( not ( = ?auto_699668 ?auto_699671 ) ) ( not ( = ?auto_699668 ?auto_699672 ) ) ( not ( = ?auto_699668 ?auto_699673 ) ) ( not ( = ?auto_699668 ?auto_699674 ) ) ( not ( = ?auto_699668 ?auto_699679 ) ) ( not ( = ?auto_699669 ?auto_699670 ) ) ( not ( = ?auto_699669 ?auto_699671 ) ) ( not ( = ?auto_699669 ?auto_699672 ) ) ( not ( = ?auto_699669 ?auto_699673 ) ) ( not ( = ?auto_699669 ?auto_699674 ) ) ( not ( = ?auto_699669 ?auto_699679 ) ) ( not ( = ?auto_699670 ?auto_699671 ) ) ( not ( = ?auto_699670 ?auto_699672 ) ) ( not ( = ?auto_699670 ?auto_699673 ) ) ( not ( = ?auto_699670 ?auto_699674 ) ) ( not ( = ?auto_699670 ?auto_699679 ) ) ( not ( = ?auto_699671 ?auto_699672 ) ) ( not ( = ?auto_699671 ?auto_699673 ) ) ( not ( = ?auto_699671 ?auto_699674 ) ) ( not ( = ?auto_699671 ?auto_699679 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_699672 ?auto_699673 ?auto_699674 )
      ( MAKE-7CRATE-VERIFY ?auto_699667 ?auto_699668 ?auto_699669 ?auto_699670 ?auto_699671 ?auto_699672 ?auto_699673 ?auto_699674 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_699745 - SURFACE
      ?auto_699746 - SURFACE
      ?auto_699747 - SURFACE
      ?auto_699748 - SURFACE
      ?auto_699749 - SURFACE
      ?auto_699750 - SURFACE
      ?auto_699751 - SURFACE
      ?auto_699752 - SURFACE
    )
    :vars
    (
      ?auto_699755 - HOIST
      ?auto_699753 - PLACE
      ?auto_699754 - PLACE
      ?auto_699757 - HOIST
      ?auto_699758 - SURFACE
      ?auto_699756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_699755 ?auto_699753 ) ( IS-CRATE ?auto_699752 ) ( not ( = ?auto_699751 ?auto_699752 ) ) ( not ( = ?auto_699750 ?auto_699751 ) ) ( not ( = ?auto_699750 ?auto_699752 ) ) ( not ( = ?auto_699754 ?auto_699753 ) ) ( HOIST-AT ?auto_699757 ?auto_699754 ) ( not ( = ?auto_699755 ?auto_699757 ) ) ( AVAILABLE ?auto_699757 ) ( SURFACE-AT ?auto_699752 ?auto_699754 ) ( ON ?auto_699752 ?auto_699758 ) ( CLEAR ?auto_699752 ) ( not ( = ?auto_699751 ?auto_699758 ) ) ( not ( = ?auto_699752 ?auto_699758 ) ) ( not ( = ?auto_699750 ?auto_699758 ) ) ( TRUCK-AT ?auto_699756 ?auto_699753 ) ( SURFACE-AT ?auto_699750 ?auto_699753 ) ( CLEAR ?auto_699750 ) ( LIFTING ?auto_699755 ?auto_699751 ) ( IS-CRATE ?auto_699751 ) ( ON ?auto_699746 ?auto_699745 ) ( ON ?auto_699747 ?auto_699746 ) ( ON ?auto_699748 ?auto_699747 ) ( ON ?auto_699749 ?auto_699748 ) ( ON ?auto_699750 ?auto_699749 ) ( not ( = ?auto_699745 ?auto_699746 ) ) ( not ( = ?auto_699745 ?auto_699747 ) ) ( not ( = ?auto_699745 ?auto_699748 ) ) ( not ( = ?auto_699745 ?auto_699749 ) ) ( not ( = ?auto_699745 ?auto_699750 ) ) ( not ( = ?auto_699745 ?auto_699751 ) ) ( not ( = ?auto_699745 ?auto_699752 ) ) ( not ( = ?auto_699745 ?auto_699758 ) ) ( not ( = ?auto_699746 ?auto_699747 ) ) ( not ( = ?auto_699746 ?auto_699748 ) ) ( not ( = ?auto_699746 ?auto_699749 ) ) ( not ( = ?auto_699746 ?auto_699750 ) ) ( not ( = ?auto_699746 ?auto_699751 ) ) ( not ( = ?auto_699746 ?auto_699752 ) ) ( not ( = ?auto_699746 ?auto_699758 ) ) ( not ( = ?auto_699747 ?auto_699748 ) ) ( not ( = ?auto_699747 ?auto_699749 ) ) ( not ( = ?auto_699747 ?auto_699750 ) ) ( not ( = ?auto_699747 ?auto_699751 ) ) ( not ( = ?auto_699747 ?auto_699752 ) ) ( not ( = ?auto_699747 ?auto_699758 ) ) ( not ( = ?auto_699748 ?auto_699749 ) ) ( not ( = ?auto_699748 ?auto_699750 ) ) ( not ( = ?auto_699748 ?auto_699751 ) ) ( not ( = ?auto_699748 ?auto_699752 ) ) ( not ( = ?auto_699748 ?auto_699758 ) ) ( not ( = ?auto_699749 ?auto_699750 ) ) ( not ( = ?auto_699749 ?auto_699751 ) ) ( not ( = ?auto_699749 ?auto_699752 ) ) ( not ( = ?auto_699749 ?auto_699758 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_699750 ?auto_699751 ?auto_699752 )
      ( MAKE-7CRATE-VERIFY ?auto_699745 ?auto_699746 ?auto_699747 ?auto_699748 ?auto_699749 ?auto_699750 ?auto_699751 ?auto_699752 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_699823 - SURFACE
      ?auto_699824 - SURFACE
      ?auto_699825 - SURFACE
      ?auto_699826 - SURFACE
      ?auto_699827 - SURFACE
      ?auto_699828 - SURFACE
      ?auto_699829 - SURFACE
      ?auto_699830 - SURFACE
    )
    :vars
    (
      ?auto_699832 - HOIST
      ?auto_699836 - PLACE
      ?auto_699831 - PLACE
      ?auto_699834 - HOIST
      ?auto_699833 - SURFACE
      ?auto_699835 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_699832 ?auto_699836 ) ( IS-CRATE ?auto_699830 ) ( not ( = ?auto_699829 ?auto_699830 ) ) ( not ( = ?auto_699828 ?auto_699829 ) ) ( not ( = ?auto_699828 ?auto_699830 ) ) ( not ( = ?auto_699831 ?auto_699836 ) ) ( HOIST-AT ?auto_699834 ?auto_699831 ) ( not ( = ?auto_699832 ?auto_699834 ) ) ( AVAILABLE ?auto_699834 ) ( SURFACE-AT ?auto_699830 ?auto_699831 ) ( ON ?auto_699830 ?auto_699833 ) ( CLEAR ?auto_699830 ) ( not ( = ?auto_699829 ?auto_699833 ) ) ( not ( = ?auto_699830 ?auto_699833 ) ) ( not ( = ?auto_699828 ?auto_699833 ) ) ( TRUCK-AT ?auto_699835 ?auto_699836 ) ( SURFACE-AT ?auto_699828 ?auto_699836 ) ( CLEAR ?auto_699828 ) ( IS-CRATE ?auto_699829 ) ( AVAILABLE ?auto_699832 ) ( IN ?auto_699829 ?auto_699835 ) ( ON ?auto_699824 ?auto_699823 ) ( ON ?auto_699825 ?auto_699824 ) ( ON ?auto_699826 ?auto_699825 ) ( ON ?auto_699827 ?auto_699826 ) ( ON ?auto_699828 ?auto_699827 ) ( not ( = ?auto_699823 ?auto_699824 ) ) ( not ( = ?auto_699823 ?auto_699825 ) ) ( not ( = ?auto_699823 ?auto_699826 ) ) ( not ( = ?auto_699823 ?auto_699827 ) ) ( not ( = ?auto_699823 ?auto_699828 ) ) ( not ( = ?auto_699823 ?auto_699829 ) ) ( not ( = ?auto_699823 ?auto_699830 ) ) ( not ( = ?auto_699823 ?auto_699833 ) ) ( not ( = ?auto_699824 ?auto_699825 ) ) ( not ( = ?auto_699824 ?auto_699826 ) ) ( not ( = ?auto_699824 ?auto_699827 ) ) ( not ( = ?auto_699824 ?auto_699828 ) ) ( not ( = ?auto_699824 ?auto_699829 ) ) ( not ( = ?auto_699824 ?auto_699830 ) ) ( not ( = ?auto_699824 ?auto_699833 ) ) ( not ( = ?auto_699825 ?auto_699826 ) ) ( not ( = ?auto_699825 ?auto_699827 ) ) ( not ( = ?auto_699825 ?auto_699828 ) ) ( not ( = ?auto_699825 ?auto_699829 ) ) ( not ( = ?auto_699825 ?auto_699830 ) ) ( not ( = ?auto_699825 ?auto_699833 ) ) ( not ( = ?auto_699826 ?auto_699827 ) ) ( not ( = ?auto_699826 ?auto_699828 ) ) ( not ( = ?auto_699826 ?auto_699829 ) ) ( not ( = ?auto_699826 ?auto_699830 ) ) ( not ( = ?auto_699826 ?auto_699833 ) ) ( not ( = ?auto_699827 ?auto_699828 ) ) ( not ( = ?auto_699827 ?auto_699829 ) ) ( not ( = ?auto_699827 ?auto_699830 ) ) ( not ( = ?auto_699827 ?auto_699833 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_699828 ?auto_699829 ?auto_699830 )
      ( MAKE-7CRATE-VERIFY ?auto_699823 ?auto_699824 ?auto_699825 ?auto_699826 ?auto_699827 ?auto_699828 ?auto_699829 ?auto_699830 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_702728 - SURFACE
      ?auto_702729 - SURFACE
      ?auto_702730 - SURFACE
      ?auto_702731 - SURFACE
      ?auto_702732 - SURFACE
      ?auto_702733 - SURFACE
      ?auto_702734 - SURFACE
      ?auto_702735 - SURFACE
      ?auto_702736 - SURFACE
    )
    :vars
    (
      ?auto_702738 - HOIST
      ?auto_702737 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_702738 ?auto_702737 ) ( SURFACE-AT ?auto_702735 ?auto_702737 ) ( CLEAR ?auto_702735 ) ( LIFTING ?auto_702738 ?auto_702736 ) ( IS-CRATE ?auto_702736 ) ( not ( = ?auto_702735 ?auto_702736 ) ) ( ON ?auto_702729 ?auto_702728 ) ( ON ?auto_702730 ?auto_702729 ) ( ON ?auto_702731 ?auto_702730 ) ( ON ?auto_702732 ?auto_702731 ) ( ON ?auto_702733 ?auto_702732 ) ( ON ?auto_702734 ?auto_702733 ) ( ON ?auto_702735 ?auto_702734 ) ( not ( = ?auto_702728 ?auto_702729 ) ) ( not ( = ?auto_702728 ?auto_702730 ) ) ( not ( = ?auto_702728 ?auto_702731 ) ) ( not ( = ?auto_702728 ?auto_702732 ) ) ( not ( = ?auto_702728 ?auto_702733 ) ) ( not ( = ?auto_702728 ?auto_702734 ) ) ( not ( = ?auto_702728 ?auto_702735 ) ) ( not ( = ?auto_702728 ?auto_702736 ) ) ( not ( = ?auto_702729 ?auto_702730 ) ) ( not ( = ?auto_702729 ?auto_702731 ) ) ( not ( = ?auto_702729 ?auto_702732 ) ) ( not ( = ?auto_702729 ?auto_702733 ) ) ( not ( = ?auto_702729 ?auto_702734 ) ) ( not ( = ?auto_702729 ?auto_702735 ) ) ( not ( = ?auto_702729 ?auto_702736 ) ) ( not ( = ?auto_702730 ?auto_702731 ) ) ( not ( = ?auto_702730 ?auto_702732 ) ) ( not ( = ?auto_702730 ?auto_702733 ) ) ( not ( = ?auto_702730 ?auto_702734 ) ) ( not ( = ?auto_702730 ?auto_702735 ) ) ( not ( = ?auto_702730 ?auto_702736 ) ) ( not ( = ?auto_702731 ?auto_702732 ) ) ( not ( = ?auto_702731 ?auto_702733 ) ) ( not ( = ?auto_702731 ?auto_702734 ) ) ( not ( = ?auto_702731 ?auto_702735 ) ) ( not ( = ?auto_702731 ?auto_702736 ) ) ( not ( = ?auto_702732 ?auto_702733 ) ) ( not ( = ?auto_702732 ?auto_702734 ) ) ( not ( = ?auto_702732 ?auto_702735 ) ) ( not ( = ?auto_702732 ?auto_702736 ) ) ( not ( = ?auto_702733 ?auto_702734 ) ) ( not ( = ?auto_702733 ?auto_702735 ) ) ( not ( = ?auto_702733 ?auto_702736 ) ) ( not ( = ?auto_702734 ?auto_702735 ) ) ( not ( = ?auto_702734 ?auto_702736 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_702735 ?auto_702736 )
      ( MAKE-8CRATE-VERIFY ?auto_702728 ?auto_702729 ?auto_702730 ?auto_702731 ?auto_702732 ?auto_702733 ?auto_702734 ?auto_702735 ?auto_702736 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_702795 - SURFACE
      ?auto_702796 - SURFACE
      ?auto_702797 - SURFACE
      ?auto_702798 - SURFACE
      ?auto_702799 - SURFACE
      ?auto_702800 - SURFACE
      ?auto_702801 - SURFACE
      ?auto_702802 - SURFACE
      ?auto_702803 - SURFACE
    )
    :vars
    (
      ?auto_702805 - HOIST
      ?auto_702806 - PLACE
      ?auto_702804 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_702805 ?auto_702806 ) ( SURFACE-AT ?auto_702802 ?auto_702806 ) ( CLEAR ?auto_702802 ) ( IS-CRATE ?auto_702803 ) ( not ( = ?auto_702802 ?auto_702803 ) ) ( TRUCK-AT ?auto_702804 ?auto_702806 ) ( AVAILABLE ?auto_702805 ) ( IN ?auto_702803 ?auto_702804 ) ( ON ?auto_702802 ?auto_702801 ) ( not ( = ?auto_702801 ?auto_702802 ) ) ( not ( = ?auto_702801 ?auto_702803 ) ) ( ON ?auto_702796 ?auto_702795 ) ( ON ?auto_702797 ?auto_702796 ) ( ON ?auto_702798 ?auto_702797 ) ( ON ?auto_702799 ?auto_702798 ) ( ON ?auto_702800 ?auto_702799 ) ( ON ?auto_702801 ?auto_702800 ) ( not ( = ?auto_702795 ?auto_702796 ) ) ( not ( = ?auto_702795 ?auto_702797 ) ) ( not ( = ?auto_702795 ?auto_702798 ) ) ( not ( = ?auto_702795 ?auto_702799 ) ) ( not ( = ?auto_702795 ?auto_702800 ) ) ( not ( = ?auto_702795 ?auto_702801 ) ) ( not ( = ?auto_702795 ?auto_702802 ) ) ( not ( = ?auto_702795 ?auto_702803 ) ) ( not ( = ?auto_702796 ?auto_702797 ) ) ( not ( = ?auto_702796 ?auto_702798 ) ) ( not ( = ?auto_702796 ?auto_702799 ) ) ( not ( = ?auto_702796 ?auto_702800 ) ) ( not ( = ?auto_702796 ?auto_702801 ) ) ( not ( = ?auto_702796 ?auto_702802 ) ) ( not ( = ?auto_702796 ?auto_702803 ) ) ( not ( = ?auto_702797 ?auto_702798 ) ) ( not ( = ?auto_702797 ?auto_702799 ) ) ( not ( = ?auto_702797 ?auto_702800 ) ) ( not ( = ?auto_702797 ?auto_702801 ) ) ( not ( = ?auto_702797 ?auto_702802 ) ) ( not ( = ?auto_702797 ?auto_702803 ) ) ( not ( = ?auto_702798 ?auto_702799 ) ) ( not ( = ?auto_702798 ?auto_702800 ) ) ( not ( = ?auto_702798 ?auto_702801 ) ) ( not ( = ?auto_702798 ?auto_702802 ) ) ( not ( = ?auto_702798 ?auto_702803 ) ) ( not ( = ?auto_702799 ?auto_702800 ) ) ( not ( = ?auto_702799 ?auto_702801 ) ) ( not ( = ?auto_702799 ?auto_702802 ) ) ( not ( = ?auto_702799 ?auto_702803 ) ) ( not ( = ?auto_702800 ?auto_702801 ) ) ( not ( = ?auto_702800 ?auto_702802 ) ) ( not ( = ?auto_702800 ?auto_702803 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_702801 ?auto_702802 ?auto_702803 )
      ( MAKE-8CRATE-VERIFY ?auto_702795 ?auto_702796 ?auto_702797 ?auto_702798 ?auto_702799 ?auto_702800 ?auto_702801 ?auto_702802 ?auto_702803 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_702871 - SURFACE
      ?auto_702872 - SURFACE
      ?auto_702873 - SURFACE
      ?auto_702874 - SURFACE
      ?auto_702875 - SURFACE
      ?auto_702876 - SURFACE
      ?auto_702877 - SURFACE
      ?auto_702878 - SURFACE
      ?auto_702879 - SURFACE
    )
    :vars
    (
      ?auto_702883 - HOIST
      ?auto_702880 - PLACE
      ?auto_702882 - TRUCK
      ?auto_702881 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_702883 ?auto_702880 ) ( SURFACE-AT ?auto_702878 ?auto_702880 ) ( CLEAR ?auto_702878 ) ( IS-CRATE ?auto_702879 ) ( not ( = ?auto_702878 ?auto_702879 ) ) ( AVAILABLE ?auto_702883 ) ( IN ?auto_702879 ?auto_702882 ) ( ON ?auto_702878 ?auto_702877 ) ( not ( = ?auto_702877 ?auto_702878 ) ) ( not ( = ?auto_702877 ?auto_702879 ) ) ( TRUCK-AT ?auto_702882 ?auto_702881 ) ( not ( = ?auto_702881 ?auto_702880 ) ) ( ON ?auto_702872 ?auto_702871 ) ( ON ?auto_702873 ?auto_702872 ) ( ON ?auto_702874 ?auto_702873 ) ( ON ?auto_702875 ?auto_702874 ) ( ON ?auto_702876 ?auto_702875 ) ( ON ?auto_702877 ?auto_702876 ) ( not ( = ?auto_702871 ?auto_702872 ) ) ( not ( = ?auto_702871 ?auto_702873 ) ) ( not ( = ?auto_702871 ?auto_702874 ) ) ( not ( = ?auto_702871 ?auto_702875 ) ) ( not ( = ?auto_702871 ?auto_702876 ) ) ( not ( = ?auto_702871 ?auto_702877 ) ) ( not ( = ?auto_702871 ?auto_702878 ) ) ( not ( = ?auto_702871 ?auto_702879 ) ) ( not ( = ?auto_702872 ?auto_702873 ) ) ( not ( = ?auto_702872 ?auto_702874 ) ) ( not ( = ?auto_702872 ?auto_702875 ) ) ( not ( = ?auto_702872 ?auto_702876 ) ) ( not ( = ?auto_702872 ?auto_702877 ) ) ( not ( = ?auto_702872 ?auto_702878 ) ) ( not ( = ?auto_702872 ?auto_702879 ) ) ( not ( = ?auto_702873 ?auto_702874 ) ) ( not ( = ?auto_702873 ?auto_702875 ) ) ( not ( = ?auto_702873 ?auto_702876 ) ) ( not ( = ?auto_702873 ?auto_702877 ) ) ( not ( = ?auto_702873 ?auto_702878 ) ) ( not ( = ?auto_702873 ?auto_702879 ) ) ( not ( = ?auto_702874 ?auto_702875 ) ) ( not ( = ?auto_702874 ?auto_702876 ) ) ( not ( = ?auto_702874 ?auto_702877 ) ) ( not ( = ?auto_702874 ?auto_702878 ) ) ( not ( = ?auto_702874 ?auto_702879 ) ) ( not ( = ?auto_702875 ?auto_702876 ) ) ( not ( = ?auto_702875 ?auto_702877 ) ) ( not ( = ?auto_702875 ?auto_702878 ) ) ( not ( = ?auto_702875 ?auto_702879 ) ) ( not ( = ?auto_702876 ?auto_702877 ) ) ( not ( = ?auto_702876 ?auto_702878 ) ) ( not ( = ?auto_702876 ?auto_702879 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_702877 ?auto_702878 ?auto_702879 )
      ( MAKE-8CRATE-VERIFY ?auto_702871 ?auto_702872 ?auto_702873 ?auto_702874 ?auto_702875 ?auto_702876 ?auto_702877 ?auto_702878 ?auto_702879 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_702955 - SURFACE
      ?auto_702956 - SURFACE
      ?auto_702957 - SURFACE
      ?auto_702958 - SURFACE
      ?auto_702959 - SURFACE
      ?auto_702960 - SURFACE
      ?auto_702961 - SURFACE
      ?auto_702962 - SURFACE
      ?auto_702963 - SURFACE
    )
    :vars
    (
      ?auto_702967 - HOIST
      ?auto_702966 - PLACE
      ?auto_702965 - TRUCK
      ?auto_702968 - PLACE
      ?auto_702964 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_702967 ?auto_702966 ) ( SURFACE-AT ?auto_702962 ?auto_702966 ) ( CLEAR ?auto_702962 ) ( IS-CRATE ?auto_702963 ) ( not ( = ?auto_702962 ?auto_702963 ) ) ( AVAILABLE ?auto_702967 ) ( ON ?auto_702962 ?auto_702961 ) ( not ( = ?auto_702961 ?auto_702962 ) ) ( not ( = ?auto_702961 ?auto_702963 ) ) ( TRUCK-AT ?auto_702965 ?auto_702968 ) ( not ( = ?auto_702968 ?auto_702966 ) ) ( HOIST-AT ?auto_702964 ?auto_702968 ) ( LIFTING ?auto_702964 ?auto_702963 ) ( not ( = ?auto_702967 ?auto_702964 ) ) ( ON ?auto_702956 ?auto_702955 ) ( ON ?auto_702957 ?auto_702956 ) ( ON ?auto_702958 ?auto_702957 ) ( ON ?auto_702959 ?auto_702958 ) ( ON ?auto_702960 ?auto_702959 ) ( ON ?auto_702961 ?auto_702960 ) ( not ( = ?auto_702955 ?auto_702956 ) ) ( not ( = ?auto_702955 ?auto_702957 ) ) ( not ( = ?auto_702955 ?auto_702958 ) ) ( not ( = ?auto_702955 ?auto_702959 ) ) ( not ( = ?auto_702955 ?auto_702960 ) ) ( not ( = ?auto_702955 ?auto_702961 ) ) ( not ( = ?auto_702955 ?auto_702962 ) ) ( not ( = ?auto_702955 ?auto_702963 ) ) ( not ( = ?auto_702956 ?auto_702957 ) ) ( not ( = ?auto_702956 ?auto_702958 ) ) ( not ( = ?auto_702956 ?auto_702959 ) ) ( not ( = ?auto_702956 ?auto_702960 ) ) ( not ( = ?auto_702956 ?auto_702961 ) ) ( not ( = ?auto_702956 ?auto_702962 ) ) ( not ( = ?auto_702956 ?auto_702963 ) ) ( not ( = ?auto_702957 ?auto_702958 ) ) ( not ( = ?auto_702957 ?auto_702959 ) ) ( not ( = ?auto_702957 ?auto_702960 ) ) ( not ( = ?auto_702957 ?auto_702961 ) ) ( not ( = ?auto_702957 ?auto_702962 ) ) ( not ( = ?auto_702957 ?auto_702963 ) ) ( not ( = ?auto_702958 ?auto_702959 ) ) ( not ( = ?auto_702958 ?auto_702960 ) ) ( not ( = ?auto_702958 ?auto_702961 ) ) ( not ( = ?auto_702958 ?auto_702962 ) ) ( not ( = ?auto_702958 ?auto_702963 ) ) ( not ( = ?auto_702959 ?auto_702960 ) ) ( not ( = ?auto_702959 ?auto_702961 ) ) ( not ( = ?auto_702959 ?auto_702962 ) ) ( not ( = ?auto_702959 ?auto_702963 ) ) ( not ( = ?auto_702960 ?auto_702961 ) ) ( not ( = ?auto_702960 ?auto_702962 ) ) ( not ( = ?auto_702960 ?auto_702963 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_702961 ?auto_702962 ?auto_702963 )
      ( MAKE-8CRATE-VERIFY ?auto_702955 ?auto_702956 ?auto_702957 ?auto_702958 ?auto_702959 ?auto_702960 ?auto_702961 ?auto_702962 ?auto_702963 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_703047 - SURFACE
      ?auto_703048 - SURFACE
      ?auto_703049 - SURFACE
      ?auto_703050 - SURFACE
      ?auto_703051 - SURFACE
      ?auto_703052 - SURFACE
      ?auto_703053 - SURFACE
      ?auto_703054 - SURFACE
      ?auto_703055 - SURFACE
    )
    :vars
    (
      ?auto_703060 - HOIST
      ?auto_703057 - PLACE
      ?auto_703058 - TRUCK
      ?auto_703061 - PLACE
      ?auto_703056 - HOIST
      ?auto_703059 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_703060 ?auto_703057 ) ( SURFACE-AT ?auto_703054 ?auto_703057 ) ( CLEAR ?auto_703054 ) ( IS-CRATE ?auto_703055 ) ( not ( = ?auto_703054 ?auto_703055 ) ) ( AVAILABLE ?auto_703060 ) ( ON ?auto_703054 ?auto_703053 ) ( not ( = ?auto_703053 ?auto_703054 ) ) ( not ( = ?auto_703053 ?auto_703055 ) ) ( TRUCK-AT ?auto_703058 ?auto_703061 ) ( not ( = ?auto_703061 ?auto_703057 ) ) ( HOIST-AT ?auto_703056 ?auto_703061 ) ( not ( = ?auto_703060 ?auto_703056 ) ) ( AVAILABLE ?auto_703056 ) ( SURFACE-AT ?auto_703055 ?auto_703061 ) ( ON ?auto_703055 ?auto_703059 ) ( CLEAR ?auto_703055 ) ( not ( = ?auto_703054 ?auto_703059 ) ) ( not ( = ?auto_703055 ?auto_703059 ) ) ( not ( = ?auto_703053 ?auto_703059 ) ) ( ON ?auto_703048 ?auto_703047 ) ( ON ?auto_703049 ?auto_703048 ) ( ON ?auto_703050 ?auto_703049 ) ( ON ?auto_703051 ?auto_703050 ) ( ON ?auto_703052 ?auto_703051 ) ( ON ?auto_703053 ?auto_703052 ) ( not ( = ?auto_703047 ?auto_703048 ) ) ( not ( = ?auto_703047 ?auto_703049 ) ) ( not ( = ?auto_703047 ?auto_703050 ) ) ( not ( = ?auto_703047 ?auto_703051 ) ) ( not ( = ?auto_703047 ?auto_703052 ) ) ( not ( = ?auto_703047 ?auto_703053 ) ) ( not ( = ?auto_703047 ?auto_703054 ) ) ( not ( = ?auto_703047 ?auto_703055 ) ) ( not ( = ?auto_703047 ?auto_703059 ) ) ( not ( = ?auto_703048 ?auto_703049 ) ) ( not ( = ?auto_703048 ?auto_703050 ) ) ( not ( = ?auto_703048 ?auto_703051 ) ) ( not ( = ?auto_703048 ?auto_703052 ) ) ( not ( = ?auto_703048 ?auto_703053 ) ) ( not ( = ?auto_703048 ?auto_703054 ) ) ( not ( = ?auto_703048 ?auto_703055 ) ) ( not ( = ?auto_703048 ?auto_703059 ) ) ( not ( = ?auto_703049 ?auto_703050 ) ) ( not ( = ?auto_703049 ?auto_703051 ) ) ( not ( = ?auto_703049 ?auto_703052 ) ) ( not ( = ?auto_703049 ?auto_703053 ) ) ( not ( = ?auto_703049 ?auto_703054 ) ) ( not ( = ?auto_703049 ?auto_703055 ) ) ( not ( = ?auto_703049 ?auto_703059 ) ) ( not ( = ?auto_703050 ?auto_703051 ) ) ( not ( = ?auto_703050 ?auto_703052 ) ) ( not ( = ?auto_703050 ?auto_703053 ) ) ( not ( = ?auto_703050 ?auto_703054 ) ) ( not ( = ?auto_703050 ?auto_703055 ) ) ( not ( = ?auto_703050 ?auto_703059 ) ) ( not ( = ?auto_703051 ?auto_703052 ) ) ( not ( = ?auto_703051 ?auto_703053 ) ) ( not ( = ?auto_703051 ?auto_703054 ) ) ( not ( = ?auto_703051 ?auto_703055 ) ) ( not ( = ?auto_703051 ?auto_703059 ) ) ( not ( = ?auto_703052 ?auto_703053 ) ) ( not ( = ?auto_703052 ?auto_703054 ) ) ( not ( = ?auto_703052 ?auto_703055 ) ) ( not ( = ?auto_703052 ?auto_703059 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_703053 ?auto_703054 ?auto_703055 )
      ( MAKE-8CRATE-VERIFY ?auto_703047 ?auto_703048 ?auto_703049 ?auto_703050 ?auto_703051 ?auto_703052 ?auto_703053 ?auto_703054 ?auto_703055 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_703140 - SURFACE
      ?auto_703141 - SURFACE
      ?auto_703142 - SURFACE
      ?auto_703143 - SURFACE
      ?auto_703144 - SURFACE
      ?auto_703145 - SURFACE
      ?auto_703146 - SURFACE
      ?auto_703147 - SURFACE
      ?auto_703148 - SURFACE
    )
    :vars
    (
      ?auto_703154 - HOIST
      ?auto_703149 - PLACE
      ?auto_703151 - PLACE
      ?auto_703153 - HOIST
      ?auto_703152 - SURFACE
      ?auto_703150 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_703154 ?auto_703149 ) ( SURFACE-AT ?auto_703147 ?auto_703149 ) ( CLEAR ?auto_703147 ) ( IS-CRATE ?auto_703148 ) ( not ( = ?auto_703147 ?auto_703148 ) ) ( AVAILABLE ?auto_703154 ) ( ON ?auto_703147 ?auto_703146 ) ( not ( = ?auto_703146 ?auto_703147 ) ) ( not ( = ?auto_703146 ?auto_703148 ) ) ( not ( = ?auto_703151 ?auto_703149 ) ) ( HOIST-AT ?auto_703153 ?auto_703151 ) ( not ( = ?auto_703154 ?auto_703153 ) ) ( AVAILABLE ?auto_703153 ) ( SURFACE-AT ?auto_703148 ?auto_703151 ) ( ON ?auto_703148 ?auto_703152 ) ( CLEAR ?auto_703148 ) ( not ( = ?auto_703147 ?auto_703152 ) ) ( not ( = ?auto_703148 ?auto_703152 ) ) ( not ( = ?auto_703146 ?auto_703152 ) ) ( TRUCK-AT ?auto_703150 ?auto_703149 ) ( ON ?auto_703141 ?auto_703140 ) ( ON ?auto_703142 ?auto_703141 ) ( ON ?auto_703143 ?auto_703142 ) ( ON ?auto_703144 ?auto_703143 ) ( ON ?auto_703145 ?auto_703144 ) ( ON ?auto_703146 ?auto_703145 ) ( not ( = ?auto_703140 ?auto_703141 ) ) ( not ( = ?auto_703140 ?auto_703142 ) ) ( not ( = ?auto_703140 ?auto_703143 ) ) ( not ( = ?auto_703140 ?auto_703144 ) ) ( not ( = ?auto_703140 ?auto_703145 ) ) ( not ( = ?auto_703140 ?auto_703146 ) ) ( not ( = ?auto_703140 ?auto_703147 ) ) ( not ( = ?auto_703140 ?auto_703148 ) ) ( not ( = ?auto_703140 ?auto_703152 ) ) ( not ( = ?auto_703141 ?auto_703142 ) ) ( not ( = ?auto_703141 ?auto_703143 ) ) ( not ( = ?auto_703141 ?auto_703144 ) ) ( not ( = ?auto_703141 ?auto_703145 ) ) ( not ( = ?auto_703141 ?auto_703146 ) ) ( not ( = ?auto_703141 ?auto_703147 ) ) ( not ( = ?auto_703141 ?auto_703148 ) ) ( not ( = ?auto_703141 ?auto_703152 ) ) ( not ( = ?auto_703142 ?auto_703143 ) ) ( not ( = ?auto_703142 ?auto_703144 ) ) ( not ( = ?auto_703142 ?auto_703145 ) ) ( not ( = ?auto_703142 ?auto_703146 ) ) ( not ( = ?auto_703142 ?auto_703147 ) ) ( not ( = ?auto_703142 ?auto_703148 ) ) ( not ( = ?auto_703142 ?auto_703152 ) ) ( not ( = ?auto_703143 ?auto_703144 ) ) ( not ( = ?auto_703143 ?auto_703145 ) ) ( not ( = ?auto_703143 ?auto_703146 ) ) ( not ( = ?auto_703143 ?auto_703147 ) ) ( not ( = ?auto_703143 ?auto_703148 ) ) ( not ( = ?auto_703143 ?auto_703152 ) ) ( not ( = ?auto_703144 ?auto_703145 ) ) ( not ( = ?auto_703144 ?auto_703146 ) ) ( not ( = ?auto_703144 ?auto_703147 ) ) ( not ( = ?auto_703144 ?auto_703148 ) ) ( not ( = ?auto_703144 ?auto_703152 ) ) ( not ( = ?auto_703145 ?auto_703146 ) ) ( not ( = ?auto_703145 ?auto_703147 ) ) ( not ( = ?auto_703145 ?auto_703148 ) ) ( not ( = ?auto_703145 ?auto_703152 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_703146 ?auto_703147 ?auto_703148 )
      ( MAKE-8CRATE-VERIFY ?auto_703140 ?auto_703141 ?auto_703142 ?auto_703143 ?auto_703144 ?auto_703145 ?auto_703146 ?auto_703147 ?auto_703148 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_703233 - SURFACE
      ?auto_703234 - SURFACE
      ?auto_703235 - SURFACE
      ?auto_703236 - SURFACE
      ?auto_703237 - SURFACE
      ?auto_703238 - SURFACE
      ?auto_703239 - SURFACE
      ?auto_703240 - SURFACE
      ?auto_703241 - SURFACE
    )
    :vars
    (
      ?auto_703245 - HOIST
      ?auto_703244 - PLACE
      ?auto_703247 - PLACE
      ?auto_703246 - HOIST
      ?auto_703242 - SURFACE
      ?auto_703243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_703245 ?auto_703244 ) ( IS-CRATE ?auto_703241 ) ( not ( = ?auto_703240 ?auto_703241 ) ) ( not ( = ?auto_703239 ?auto_703240 ) ) ( not ( = ?auto_703239 ?auto_703241 ) ) ( not ( = ?auto_703247 ?auto_703244 ) ) ( HOIST-AT ?auto_703246 ?auto_703247 ) ( not ( = ?auto_703245 ?auto_703246 ) ) ( AVAILABLE ?auto_703246 ) ( SURFACE-AT ?auto_703241 ?auto_703247 ) ( ON ?auto_703241 ?auto_703242 ) ( CLEAR ?auto_703241 ) ( not ( = ?auto_703240 ?auto_703242 ) ) ( not ( = ?auto_703241 ?auto_703242 ) ) ( not ( = ?auto_703239 ?auto_703242 ) ) ( TRUCK-AT ?auto_703243 ?auto_703244 ) ( SURFACE-AT ?auto_703239 ?auto_703244 ) ( CLEAR ?auto_703239 ) ( LIFTING ?auto_703245 ?auto_703240 ) ( IS-CRATE ?auto_703240 ) ( ON ?auto_703234 ?auto_703233 ) ( ON ?auto_703235 ?auto_703234 ) ( ON ?auto_703236 ?auto_703235 ) ( ON ?auto_703237 ?auto_703236 ) ( ON ?auto_703238 ?auto_703237 ) ( ON ?auto_703239 ?auto_703238 ) ( not ( = ?auto_703233 ?auto_703234 ) ) ( not ( = ?auto_703233 ?auto_703235 ) ) ( not ( = ?auto_703233 ?auto_703236 ) ) ( not ( = ?auto_703233 ?auto_703237 ) ) ( not ( = ?auto_703233 ?auto_703238 ) ) ( not ( = ?auto_703233 ?auto_703239 ) ) ( not ( = ?auto_703233 ?auto_703240 ) ) ( not ( = ?auto_703233 ?auto_703241 ) ) ( not ( = ?auto_703233 ?auto_703242 ) ) ( not ( = ?auto_703234 ?auto_703235 ) ) ( not ( = ?auto_703234 ?auto_703236 ) ) ( not ( = ?auto_703234 ?auto_703237 ) ) ( not ( = ?auto_703234 ?auto_703238 ) ) ( not ( = ?auto_703234 ?auto_703239 ) ) ( not ( = ?auto_703234 ?auto_703240 ) ) ( not ( = ?auto_703234 ?auto_703241 ) ) ( not ( = ?auto_703234 ?auto_703242 ) ) ( not ( = ?auto_703235 ?auto_703236 ) ) ( not ( = ?auto_703235 ?auto_703237 ) ) ( not ( = ?auto_703235 ?auto_703238 ) ) ( not ( = ?auto_703235 ?auto_703239 ) ) ( not ( = ?auto_703235 ?auto_703240 ) ) ( not ( = ?auto_703235 ?auto_703241 ) ) ( not ( = ?auto_703235 ?auto_703242 ) ) ( not ( = ?auto_703236 ?auto_703237 ) ) ( not ( = ?auto_703236 ?auto_703238 ) ) ( not ( = ?auto_703236 ?auto_703239 ) ) ( not ( = ?auto_703236 ?auto_703240 ) ) ( not ( = ?auto_703236 ?auto_703241 ) ) ( not ( = ?auto_703236 ?auto_703242 ) ) ( not ( = ?auto_703237 ?auto_703238 ) ) ( not ( = ?auto_703237 ?auto_703239 ) ) ( not ( = ?auto_703237 ?auto_703240 ) ) ( not ( = ?auto_703237 ?auto_703241 ) ) ( not ( = ?auto_703237 ?auto_703242 ) ) ( not ( = ?auto_703238 ?auto_703239 ) ) ( not ( = ?auto_703238 ?auto_703240 ) ) ( not ( = ?auto_703238 ?auto_703241 ) ) ( not ( = ?auto_703238 ?auto_703242 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_703239 ?auto_703240 ?auto_703241 )
      ( MAKE-8CRATE-VERIFY ?auto_703233 ?auto_703234 ?auto_703235 ?auto_703236 ?auto_703237 ?auto_703238 ?auto_703239 ?auto_703240 ?auto_703241 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_703326 - SURFACE
      ?auto_703327 - SURFACE
      ?auto_703328 - SURFACE
      ?auto_703329 - SURFACE
      ?auto_703330 - SURFACE
      ?auto_703331 - SURFACE
      ?auto_703332 - SURFACE
      ?auto_703333 - SURFACE
      ?auto_703334 - SURFACE
    )
    :vars
    (
      ?auto_703338 - HOIST
      ?auto_703340 - PLACE
      ?auto_703335 - PLACE
      ?auto_703337 - HOIST
      ?auto_703336 - SURFACE
      ?auto_703339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_703338 ?auto_703340 ) ( IS-CRATE ?auto_703334 ) ( not ( = ?auto_703333 ?auto_703334 ) ) ( not ( = ?auto_703332 ?auto_703333 ) ) ( not ( = ?auto_703332 ?auto_703334 ) ) ( not ( = ?auto_703335 ?auto_703340 ) ) ( HOIST-AT ?auto_703337 ?auto_703335 ) ( not ( = ?auto_703338 ?auto_703337 ) ) ( AVAILABLE ?auto_703337 ) ( SURFACE-AT ?auto_703334 ?auto_703335 ) ( ON ?auto_703334 ?auto_703336 ) ( CLEAR ?auto_703334 ) ( not ( = ?auto_703333 ?auto_703336 ) ) ( not ( = ?auto_703334 ?auto_703336 ) ) ( not ( = ?auto_703332 ?auto_703336 ) ) ( TRUCK-AT ?auto_703339 ?auto_703340 ) ( SURFACE-AT ?auto_703332 ?auto_703340 ) ( CLEAR ?auto_703332 ) ( IS-CRATE ?auto_703333 ) ( AVAILABLE ?auto_703338 ) ( IN ?auto_703333 ?auto_703339 ) ( ON ?auto_703327 ?auto_703326 ) ( ON ?auto_703328 ?auto_703327 ) ( ON ?auto_703329 ?auto_703328 ) ( ON ?auto_703330 ?auto_703329 ) ( ON ?auto_703331 ?auto_703330 ) ( ON ?auto_703332 ?auto_703331 ) ( not ( = ?auto_703326 ?auto_703327 ) ) ( not ( = ?auto_703326 ?auto_703328 ) ) ( not ( = ?auto_703326 ?auto_703329 ) ) ( not ( = ?auto_703326 ?auto_703330 ) ) ( not ( = ?auto_703326 ?auto_703331 ) ) ( not ( = ?auto_703326 ?auto_703332 ) ) ( not ( = ?auto_703326 ?auto_703333 ) ) ( not ( = ?auto_703326 ?auto_703334 ) ) ( not ( = ?auto_703326 ?auto_703336 ) ) ( not ( = ?auto_703327 ?auto_703328 ) ) ( not ( = ?auto_703327 ?auto_703329 ) ) ( not ( = ?auto_703327 ?auto_703330 ) ) ( not ( = ?auto_703327 ?auto_703331 ) ) ( not ( = ?auto_703327 ?auto_703332 ) ) ( not ( = ?auto_703327 ?auto_703333 ) ) ( not ( = ?auto_703327 ?auto_703334 ) ) ( not ( = ?auto_703327 ?auto_703336 ) ) ( not ( = ?auto_703328 ?auto_703329 ) ) ( not ( = ?auto_703328 ?auto_703330 ) ) ( not ( = ?auto_703328 ?auto_703331 ) ) ( not ( = ?auto_703328 ?auto_703332 ) ) ( not ( = ?auto_703328 ?auto_703333 ) ) ( not ( = ?auto_703328 ?auto_703334 ) ) ( not ( = ?auto_703328 ?auto_703336 ) ) ( not ( = ?auto_703329 ?auto_703330 ) ) ( not ( = ?auto_703329 ?auto_703331 ) ) ( not ( = ?auto_703329 ?auto_703332 ) ) ( not ( = ?auto_703329 ?auto_703333 ) ) ( not ( = ?auto_703329 ?auto_703334 ) ) ( not ( = ?auto_703329 ?auto_703336 ) ) ( not ( = ?auto_703330 ?auto_703331 ) ) ( not ( = ?auto_703330 ?auto_703332 ) ) ( not ( = ?auto_703330 ?auto_703333 ) ) ( not ( = ?auto_703330 ?auto_703334 ) ) ( not ( = ?auto_703330 ?auto_703336 ) ) ( not ( = ?auto_703331 ?auto_703332 ) ) ( not ( = ?auto_703331 ?auto_703333 ) ) ( not ( = ?auto_703331 ?auto_703334 ) ) ( not ( = ?auto_703331 ?auto_703336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_703332 ?auto_703333 ?auto_703334 )
      ( MAKE-8CRATE-VERIFY ?auto_703326 ?auto_703327 ?auto_703328 ?auto_703329 ?auto_703330 ?auto_703331 ?auto_703332 ?auto_703333 ?auto_703334 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_707426 - SURFACE
      ?auto_707427 - SURFACE
      ?auto_707428 - SURFACE
      ?auto_707429 - SURFACE
      ?auto_707430 - SURFACE
      ?auto_707431 - SURFACE
      ?auto_707432 - SURFACE
      ?auto_707433 - SURFACE
      ?auto_707434 - SURFACE
      ?auto_707435 - SURFACE
    )
    :vars
    (
      ?auto_707436 - HOIST
      ?auto_707437 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_707436 ?auto_707437 ) ( SURFACE-AT ?auto_707434 ?auto_707437 ) ( CLEAR ?auto_707434 ) ( LIFTING ?auto_707436 ?auto_707435 ) ( IS-CRATE ?auto_707435 ) ( not ( = ?auto_707434 ?auto_707435 ) ) ( ON ?auto_707427 ?auto_707426 ) ( ON ?auto_707428 ?auto_707427 ) ( ON ?auto_707429 ?auto_707428 ) ( ON ?auto_707430 ?auto_707429 ) ( ON ?auto_707431 ?auto_707430 ) ( ON ?auto_707432 ?auto_707431 ) ( ON ?auto_707433 ?auto_707432 ) ( ON ?auto_707434 ?auto_707433 ) ( not ( = ?auto_707426 ?auto_707427 ) ) ( not ( = ?auto_707426 ?auto_707428 ) ) ( not ( = ?auto_707426 ?auto_707429 ) ) ( not ( = ?auto_707426 ?auto_707430 ) ) ( not ( = ?auto_707426 ?auto_707431 ) ) ( not ( = ?auto_707426 ?auto_707432 ) ) ( not ( = ?auto_707426 ?auto_707433 ) ) ( not ( = ?auto_707426 ?auto_707434 ) ) ( not ( = ?auto_707426 ?auto_707435 ) ) ( not ( = ?auto_707427 ?auto_707428 ) ) ( not ( = ?auto_707427 ?auto_707429 ) ) ( not ( = ?auto_707427 ?auto_707430 ) ) ( not ( = ?auto_707427 ?auto_707431 ) ) ( not ( = ?auto_707427 ?auto_707432 ) ) ( not ( = ?auto_707427 ?auto_707433 ) ) ( not ( = ?auto_707427 ?auto_707434 ) ) ( not ( = ?auto_707427 ?auto_707435 ) ) ( not ( = ?auto_707428 ?auto_707429 ) ) ( not ( = ?auto_707428 ?auto_707430 ) ) ( not ( = ?auto_707428 ?auto_707431 ) ) ( not ( = ?auto_707428 ?auto_707432 ) ) ( not ( = ?auto_707428 ?auto_707433 ) ) ( not ( = ?auto_707428 ?auto_707434 ) ) ( not ( = ?auto_707428 ?auto_707435 ) ) ( not ( = ?auto_707429 ?auto_707430 ) ) ( not ( = ?auto_707429 ?auto_707431 ) ) ( not ( = ?auto_707429 ?auto_707432 ) ) ( not ( = ?auto_707429 ?auto_707433 ) ) ( not ( = ?auto_707429 ?auto_707434 ) ) ( not ( = ?auto_707429 ?auto_707435 ) ) ( not ( = ?auto_707430 ?auto_707431 ) ) ( not ( = ?auto_707430 ?auto_707432 ) ) ( not ( = ?auto_707430 ?auto_707433 ) ) ( not ( = ?auto_707430 ?auto_707434 ) ) ( not ( = ?auto_707430 ?auto_707435 ) ) ( not ( = ?auto_707431 ?auto_707432 ) ) ( not ( = ?auto_707431 ?auto_707433 ) ) ( not ( = ?auto_707431 ?auto_707434 ) ) ( not ( = ?auto_707431 ?auto_707435 ) ) ( not ( = ?auto_707432 ?auto_707433 ) ) ( not ( = ?auto_707432 ?auto_707434 ) ) ( not ( = ?auto_707432 ?auto_707435 ) ) ( not ( = ?auto_707433 ?auto_707434 ) ) ( not ( = ?auto_707433 ?auto_707435 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_707434 ?auto_707435 )
      ( MAKE-9CRATE-VERIFY ?auto_707426 ?auto_707427 ?auto_707428 ?auto_707429 ?auto_707430 ?auto_707431 ?auto_707432 ?auto_707433 ?auto_707434 ?auto_707435 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_707506 - SURFACE
      ?auto_707507 - SURFACE
      ?auto_707508 - SURFACE
      ?auto_707509 - SURFACE
      ?auto_707510 - SURFACE
      ?auto_707511 - SURFACE
      ?auto_707512 - SURFACE
      ?auto_707513 - SURFACE
      ?auto_707514 - SURFACE
      ?auto_707515 - SURFACE
    )
    :vars
    (
      ?auto_707518 - HOIST
      ?auto_707516 - PLACE
      ?auto_707517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_707518 ?auto_707516 ) ( SURFACE-AT ?auto_707514 ?auto_707516 ) ( CLEAR ?auto_707514 ) ( IS-CRATE ?auto_707515 ) ( not ( = ?auto_707514 ?auto_707515 ) ) ( TRUCK-AT ?auto_707517 ?auto_707516 ) ( AVAILABLE ?auto_707518 ) ( IN ?auto_707515 ?auto_707517 ) ( ON ?auto_707514 ?auto_707513 ) ( not ( = ?auto_707513 ?auto_707514 ) ) ( not ( = ?auto_707513 ?auto_707515 ) ) ( ON ?auto_707507 ?auto_707506 ) ( ON ?auto_707508 ?auto_707507 ) ( ON ?auto_707509 ?auto_707508 ) ( ON ?auto_707510 ?auto_707509 ) ( ON ?auto_707511 ?auto_707510 ) ( ON ?auto_707512 ?auto_707511 ) ( ON ?auto_707513 ?auto_707512 ) ( not ( = ?auto_707506 ?auto_707507 ) ) ( not ( = ?auto_707506 ?auto_707508 ) ) ( not ( = ?auto_707506 ?auto_707509 ) ) ( not ( = ?auto_707506 ?auto_707510 ) ) ( not ( = ?auto_707506 ?auto_707511 ) ) ( not ( = ?auto_707506 ?auto_707512 ) ) ( not ( = ?auto_707506 ?auto_707513 ) ) ( not ( = ?auto_707506 ?auto_707514 ) ) ( not ( = ?auto_707506 ?auto_707515 ) ) ( not ( = ?auto_707507 ?auto_707508 ) ) ( not ( = ?auto_707507 ?auto_707509 ) ) ( not ( = ?auto_707507 ?auto_707510 ) ) ( not ( = ?auto_707507 ?auto_707511 ) ) ( not ( = ?auto_707507 ?auto_707512 ) ) ( not ( = ?auto_707507 ?auto_707513 ) ) ( not ( = ?auto_707507 ?auto_707514 ) ) ( not ( = ?auto_707507 ?auto_707515 ) ) ( not ( = ?auto_707508 ?auto_707509 ) ) ( not ( = ?auto_707508 ?auto_707510 ) ) ( not ( = ?auto_707508 ?auto_707511 ) ) ( not ( = ?auto_707508 ?auto_707512 ) ) ( not ( = ?auto_707508 ?auto_707513 ) ) ( not ( = ?auto_707508 ?auto_707514 ) ) ( not ( = ?auto_707508 ?auto_707515 ) ) ( not ( = ?auto_707509 ?auto_707510 ) ) ( not ( = ?auto_707509 ?auto_707511 ) ) ( not ( = ?auto_707509 ?auto_707512 ) ) ( not ( = ?auto_707509 ?auto_707513 ) ) ( not ( = ?auto_707509 ?auto_707514 ) ) ( not ( = ?auto_707509 ?auto_707515 ) ) ( not ( = ?auto_707510 ?auto_707511 ) ) ( not ( = ?auto_707510 ?auto_707512 ) ) ( not ( = ?auto_707510 ?auto_707513 ) ) ( not ( = ?auto_707510 ?auto_707514 ) ) ( not ( = ?auto_707510 ?auto_707515 ) ) ( not ( = ?auto_707511 ?auto_707512 ) ) ( not ( = ?auto_707511 ?auto_707513 ) ) ( not ( = ?auto_707511 ?auto_707514 ) ) ( not ( = ?auto_707511 ?auto_707515 ) ) ( not ( = ?auto_707512 ?auto_707513 ) ) ( not ( = ?auto_707512 ?auto_707514 ) ) ( not ( = ?auto_707512 ?auto_707515 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_707513 ?auto_707514 ?auto_707515 )
      ( MAKE-9CRATE-VERIFY ?auto_707506 ?auto_707507 ?auto_707508 ?auto_707509 ?auto_707510 ?auto_707511 ?auto_707512 ?auto_707513 ?auto_707514 ?auto_707515 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_707596 - SURFACE
      ?auto_707597 - SURFACE
      ?auto_707598 - SURFACE
      ?auto_707599 - SURFACE
      ?auto_707600 - SURFACE
      ?auto_707601 - SURFACE
      ?auto_707602 - SURFACE
      ?auto_707603 - SURFACE
      ?auto_707604 - SURFACE
      ?auto_707605 - SURFACE
    )
    :vars
    (
      ?auto_707607 - HOIST
      ?auto_707609 - PLACE
      ?auto_707608 - TRUCK
      ?auto_707606 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_707607 ?auto_707609 ) ( SURFACE-AT ?auto_707604 ?auto_707609 ) ( CLEAR ?auto_707604 ) ( IS-CRATE ?auto_707605 ) ( not ( = ?auto_707604 ?auto_707605 ) ) ( AVAILABLE ?auto_707607 ) ( IN ?auto_707605 ?auto_707608 ) ( ON ?auto_707604 ?auto_707603 ) ( not ( = ?auto_707603 ?auto_707604 ) ) ( not ( = ?auto_707603 ?auto_707605 ) ) ( TRUCK-AT ?auto_707608 ?auto_707606 ) ( not ( = ?auto_707606 ?auto_707609 ) ) ( ON ?auto_707597 ?auto_707596 ) ( ON ?auto_707598 ?auto_707597 ) ( ON ?auto_707599 ?auto_707598 ) ( ON ?auto_707600 ?auto_707599 ) ( ON ?auto_707601 ?auto_707600 ) ( ON ?auto_707602 ?auto_707601 ) ( ON ?auto_707603 ?auto_707602 ) ( not ( = ?auto_707596 ?auto_707597 ) ) ( not ( = ?auto_707596 ?auto_707598 ) ) ( not ( = ?auto_707596 ?auto_707599 ) ) ( not ( = ?auto_707596 ?auto_707600 ) ) ( not ( = ?auto_707596 ?auto_707601 ) ) ( not ( = ?auto_707596 ?auto_707602 ) ) ( not ( = ?auto_707596 ?auto_707603 ) ) ( not ( = ?auto_707596 ?auto_707604 ) ) ( not ( = ?auto_707596 ?auto_707605 ) ) ( not ( = ?auto_707597 ?auto_707598 ) ) ( not ( = ?auto_707597 ?auto_707599 ) ) ( not ( = ?auto_707597 ?auto_707600 ) ) ( not ( = ?auto_707597 ?auto_707601 ) ) ( not ( = ?auto_707597 ?auto_707602 ) ) ( not ( = ?auto_707597 ?auto_707603 ) ) ( not ( = ?auto_707597 ?auto_707604 ) ) ( not ( = ?auto_707597 ?auto_707605 ) ) ( not ( = ?auto_707598 ?auto_707599 ) ) ( not ( = ?auto_707598 ?auto_707600 ) ) ( not ( = ?auto_707598 ?auto_707601 ) ) ( not ( = ?auto_707598 ?auto_707602 ) ) ( not ( = ?auto_707598 ?auto_707603 ) ) ( not ( = ?auto_707598 ?auto_707604 ) ) ( not ( = ?auto_707598 ?auto_707605 ) ) ( not ( = ?auto_707599 ?auto_707600 ) ) ( not ( = ?auto_707599 ?auto_707601 ) ) ( not ( = ?auto_707599 ?auto_707602 ) ) ( not ( = ?auto_707599 ?auto_707603 ) ) ( not ( = ?auto_707599 ?auto_707604 ) ) ( not ( = ?auto_707599 ?auto_707605 ) ) ( not ( = ?auto_707600 ?auto_707601 ) ) ( not ( = ?auto_707600 ?auto_707602 ) ) ( not ( = ?auto_707600 ?auto_707603 ) ) ( not ( = ?auto_707600 ?auto_707604 ) ) ( not ( = ?auto_707600 ?auto_707605 ) ) ( not ( = ?auto_707601 ?auto_707602 ) ) ( not ( = ?auto_707601 ?auto_707603 ) ) ( not ( = ?auto_707601 ?auto_707604 ) ) ( not ( = ?auto_707601 ?auto_707605 ) ) ( not ( = ?auto_707602 ?auto_707603 ) ) ( not ( = ?auto_707602 ?auto_707604 ) ) ( not ( = ?auto_707602 ?auto_707605 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_707603 ?auto_707604 ?auto_707605 )
      ( MAKE-9CRATE-VERIFY ?auto_707596 ?auto_707597 ?auto_707598 ?auto_707599 ?auto_707600 ?auto_707601 ?auto_707602 ?auto_707603 ?auto_707604 ?auto_707605 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_707695 - SURFACE
      ?auto_707696 - SURFACE
      ?auto_707697 - SURFACE
      ?auto_707698 - SURFACE
      ?auto_707699 - SURFACE
      ?auto_707700 - SURFACE
      ?auto_707701 - SURFACE
      ?auto_707702 - SURFACE
      ?auto_707703 - SURFACE
      ?auto_707704 - SURFACE
    )
    :vars
    (
      ?auto_707708 - HOIST
      ?auto_707709 - PLACE
      ?auto_707707 - TRUCK
      ?auto_707705 - PLACE
      ?auto_707706 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_707708 ?auto_707709 ) ( SURFACE-AT ?auto_707703 ?auto_707709 ) ( CLEAR ?auto_707703 ) ( IS-CRATE ?auto_707704 ) ( not ( = ?auto_707703 ?auto_707704 ) ) ( AVAILABLE ?auto_707708 ) ( ON ?auto_707703 ?auto_707702 ) ( not ( = ?auto_707702 ?auto_707703 ) ) ( not ( = ?auto_707702 ?auto_707704 ) ) ( TRUCK-AT ?auto_707707 ?auto_707705 ) ( not ( = ?auto_707705 ?auto_707709 ) ) ( HOIST-AT ?auto_707706 ?auto_707705 ) ( LIFTING ?auto_707706 ?auto_707704 ) ( not ( = ?auto_707708 ?auto_707706 ) ) ( ON ?auto_707696 ?auto_707695 ) ( ON ?auto_707697 ?auto_707696 ) ( ON ?auto_707698 ?auto_707697 ) ( ON ?auto_707699 ?auto_707698 ) ( ON ?auto_707700 ?auto_707699 ) ( ON ?auto_707701 ?auto_707700 ) ( ON ?auto_707702 ?auto_707701 ) ( not ( = ?auto_707695 ?auto_707696 ) ) ( not ( = ?auto_707695 ?auto_707697 ) ) ( not ( = ?auto_707695 ?auto_707698 ) ) ( not ( = ?auto_707695 ?auto_707699 ) ) ( not ( = ?auto_707695 ?auto_707700 ) ) ( not ( = ?auto_707695 ?auto_707701 ) ) ( not ( = ?auto_707695 ?auto_707702 ) ) ( not ( = ?auto_707695 ?auto_707703 ) ) ( not ( = ?auto_707695 ?auto_707704 ) ) ( not ( = ?auto_707696 ?auto_707697 ) ) ( not ( = ?auto_707696 ?auto_707698 ) ) ( not ( = ?auto_707696 ?auto_707699 ) ) ( not ( = ?auto_707696 ?auto_707700 ) ) ( not ( = ?auto_707696 ?auto_707701 ) ) ( not ( = ?auto_707696 ?auto_707702 ) ) ( not ( = ?auto_707696 ?auto_707703 ) ) ( not ( = ?auto_707696 ?auto_707704 ) ) ( not ( = ?auto_707697 ?auto_707698 ) ) ( not ( = ?auto_707697 ?auto_707699 ) ) ( not ( = ?auto_707697 ?auto_707700 ) ) ( not ( = ?auto_707697 ?auto_707701 ) ) ( not ( = ?auto_707697 ?auto_707702 ) ) ( not ( = ?auto_707697 ?auto_707703 ) ) ( not ( = ?auto_707697 ?auto_707704 ) ) ( not ( = ?auto_707698 ?auto_707699 ) ) ( not ( = ?auto_707698 ?auto_707700 ) ) ( not ( = ?auto_707698 ?auto_707701 ) ) ( not ( = ?auto_707698 ?auto_707702 ) ) ( not ( = ?auto_707698 ?auto_707703 ) ) ( not ( = ?auto_707698 ?auto_707704 ) ) ( not ( = ?auto_707699 ?auto_707700 ) ) ( not ( = ?auto_707699 ?auto_707701 ) ) ( not ( = ?auto_707699 ?auto_707702 ) ) ( not ( = ?auto_707699 ?auto_707703 ) ) ( not ( = ?auto_707699 ?auto_707704 ) ) ( not ( = ?auto_707700 ?auto_707701 ) ) ( not ( = ?auto_707700 ?auto_707702 ) ) ( not ( = ?auto_707700 ?auto_707703 ) ) ( not ( = ?auto_707700 ?auto_707704 ) ) ( not ( = ?auto_707701 ?auto_707702 ) ) ( not ( = ?auto_707701 ?auto_707703 ) ) ( not ( = ?auto_707701 ?auto_707704 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_707702 ?auto_707703 ?auto_707704 )
      ( MAKE-9CRATE-VERIFY ?auto_707695 ?auto_707696 ?auto_707697 ?auto_707698 ?auto_707699 ?auto_707700 ?auto_707701 ?auto_707702 ?auto_707703 ?auto_707704 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_707803 - SURFACE
      ?auto_707804 - SURFACE
      ?auto_707805 - SURFACE
      ?auto_707806 - SURFACE
      ?auto_707807 - SURFACE
      ?auto_707808 - SURFACE
      ?auto_707809 - SURFACE
      ?auto_707810 - SURFACE
      ?auto_707811 - SURFACE
      ?auto_707812 - SURFACE
    )
    :vars
    (
      ?auto_707815 - HOIST
      ?auto_707813 - PLACE
      ?auto_707816 - TRUCK
      ?auto_707817 - PLACE
      ?auto_707818 - HOIST
      ?auto_707814 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_707815 ?auto_707813 ) ( SURFACE-AT ?auto_707811 ?auto_707813 ) ( CLEAR ?auto_707811 ) ( IS-CRATE ?auto_707812 ) ( not ( = ?auto_707811 ?auto_707812 ) ) ( AVAILABLE ?auto_707815 ) ( ON ?auto_707811 ?auto_707810 ) ( not ( = ?auto_707810 ?auto_707811 ) ) ( not ( = ?auto_707810 ?auto_707812 ) ) ( TRUCK-AT ?auto_707816 ?auto_707817 ) ( not ( = ?auto_707817 ?auto_707813 ) ) ( HOIST-AT ?auto_707818 ?auto_707817 ) ( not ( = ?auto_707815 ?auto_707818 ) ) ( AVAILABLE ?auto_707818 ) ( SURFACE-AT ?auto_707812 ?auto_707817 ) ( ON ?auto_707812 ?auto_707814 ) ( CLEAR ?auto_707812 ) ( not ( = ?auto_707811 ?auto_707814 ) ) ( not ( = ?auto_707812 ?auto_707814 ) ) ( not ( = ?auto_707810 ?auto_707814 ) ) ( ON ?auto_707804 ?auto_707803 ) ( ON ?auto_707805 ?auto_707804 ) ( ON ?auto_707806 ?auto_707805 ) ( ON ?auto_707807 ?auto_707806 ) ( ON ?auto_707808 ?auto_707807 ) ( ON ?auto_707809 ?auto_707808 ) ( ON ?auto_707810 ?auto_707809 ) ( not ( = ?auto_707803 ?auto_707804 ) ) ( not ( = ?auto_707803 ?auto_707805 ) ) ( not ( = ?auto_707803 ?auto_707806 ) ) ( not ( = ?auto_707803 ?auto_707807 ) ) ( not ( = ?auto_707803 ?auto_707808 ) ) ( not ( = ?auto_707803 ?auto_707809 ) ) ( not ( = ?auto_707803 ?auto_707810 ) ) ( not ( = ?auto_707803 ?auto_707811 ) ) ( not ( = ?auto_707803 ?auto_707812 ) ) ( not ( = ?auto_707803 ?auto_707814 ) ) ( not ( = ?auto_707804 ?auto_707805 ) ) ( not ( = ?auto_707804 ?auto_707806 ) ) ( not ( = ?auto_707804 ?auto_707807 ) ) ( not ( = ?auto_707804 ?auto_707808 ) ) ( not ( = ?auto_707804 ?auto_707809 ) ) ( not ( = ?auto_707804 ?auto_707810 ) ) ( not ( = ?auto_707804 ?auto_707811 ) ) ( not ( = ?auto_707804 ?auto_707812 ) ) ( not ( = ?auto_707804 ?auto_707814 ) ) ( not ( = ?auto_707805 ?auto_707806 ) ) ( not ( = ?auto_707805 ?auto_707807 ) ) ( not ( = ?auto_707805 ?auto_707808 ) ) ( not ( = ?auto_707805 ?auto_707809 ) ) ( not ( = ?auto_707805 ?auto_707810 ) ) ( not ( = ?auto_707805 ?auto_707811 ) ) ( not ( = ?auto_707805 ?auto_707812 ) ) ( not ( = ?auto_707805 ?auto_707814 ) ) ( not ( = ?auto_707806 ?auto_707807 ) ) ( not ( = ?auto_707806 ?auto_707808 ) ) ( not ( = ?auto_707806 ?auto_707809 ) ) ( not ( = ?auto_707806 ?auto_707810 ) ) ( not ( = ?auto_707806 ?auto_707811 ) ) ( not ( = ?auto_707806 ?auto_707812 ) ) ( not ( = ?auto_707806 ?auto_707814 ) ) ( not ( = ?auto_707807 ?auto_707808 ) ) ( not ( = ?auto_707807 ?auto_707809 ) ) ( not ( = ?auto_707807 ?auto_707810 ) ) ( not ( = ?auto_707807 ?auto_707811 ) ) ( not ( = ?auto_707807 ?auto_707812 ) ) ( not ( = ?auto_707807 ?auto_707814 ) ) ( not ( = ?auto_707808 ?auto_707809 ) ) ( not ( = ?auto_707808 ?auto_707810 ) ) ( not ( = ?auto_707808 ?auto_707811 ) ) ( not ( = ?auto_707808 ?auto_707812 ) ) ( not ( = ?auto_707808 ?auto_707814 ) ) ( not ( = ?auto_707809 ?auto_707810 ) ) ( not ( = ?auto_707809 ?auto_707811 ) ) ( not ( = ?auto_707809 ?auto_707812 ) ) ( not ( = ?auto_707809 ?auto_707814 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_707810 ?auto_707811 ?auto_707812 )
      ( MAKE-9CRATE-VERIFY ?auto_707803 ?auto_707804 ?auto_707805 ?auto_707806 ?auto_707807 ?auto_707808 ?auto_707809 ?auto_707810 ?auto_707811 ?auto_707812 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_707912 - SURFACE
      ?auto_707913 - SURFACE
      ?auto_707914 - SURFACE
      ?auto_707915 - SURFACE
      ?auto_707916 - SURFACE
      ?auto_707917 - SURFACE
      ?auto_707918 - SURFACE
      ?auto_707919 - SURFACE
      ?auto_707920 - SURFACE
      ?auto_707921 - SURFACE
    )
    :vars
    (
      ?auto_707922 - HOIST
      ?auto_707926 - PLACE
      ?auto_707925 - PLACE
      ?auto_707923 - HOIST
      ?auto_707924 - SURFACE
      ?auto_707927 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_707922 ?auto_707926 ) ( SURFACE-AT ?auto_707920 ?auto_707926 ) ( CLEAR ?auto_707920 ) ( IS-CRATE ?auto_707921 ) ( not ( = ?auto_707920 ?auto_707921 ) ) ( AVAILABLE ?auto_707922 ) ( ON ?auto_707920 ?auto_707919 ) ( not ( = ?auto_707919 ?auto_707920 ) ) ( not ( = ?auto_707919 ?auto_707921 ) ) ( not ( = ?auto_707925 ?auto_707926 ) ) ( HOIST-AT ?auto_707923 ?auto_707925 ) ( not ( = ?auto_707922 ?auto_707923 ) ) ( AVAILABLE ?auto_707923 ) ( SURFACE-AT ?auto_707921 ?auto_707925 ) ( ON ?auto_707921 ?auto_707924 ) ( CLEAR ?auto_707921 ) ( not ( = ?auto_707920 ?auto_707924 ) ) ( not ( = ?auto_707921 ?auto_707924 ) ) ( not ( = ?auto_707919 ?auto_707924 ) ) ( TRUCK-AT ?auto_707927 ?auto_707926 ) ( ON ?auto_707913 ?auto_707912 ) ( ON ?auto_707914 ?auto_707913 ) ( ON ?auto_707915 ?auto_707914 ) ( ON ?auto_707916 ?auto_707915 ) ( ON ?auto_707917 ?auto_707916 ) ( ON ?auto_707918 ?auto_707917 ) ( ON ?auto_707919 ?auto_707918 ) ( not ( = ?auto_707912 ?auto_707913 ) ) ( not ( = ?auto_707912 ?auto_707914 ) ) ( not ( = ?auto_707912 ?auto_707915 ) ) ( not ( = ?auto_707912 ?auto_707916 ) ) ( not ( = ?auto_707912 ?auto_707917 ) ) ( not ( = ?auto_707912 ?auto_707918 ) ) ( not ( = ?auto_707912 ?auto_707919 ) ) ( not ( = ?auto_707912 ?auto_707920 ) ) ( not ( = ?auto_707912 ?auto_707921 ) ) ( not ( = ?auto_707912 ?auto_707924 ) ) ( not ( = ?auto_707913 ?auto_707914 ) ) ( not ( = ?auto_707913 ?auto_707915 ) ) ( not ( = ?auto_707913 ?auto_707916 ) ) ( not ( = ?auto_707913 ?auto_707917 ) ) ( not ( = ?auto_707913 ?auto_707918 ) ) ( not ( = ?auto_707913 ?auto_707919 ) ) ( not ( = ?auto_707913 ?auto_707920 ) ) ( not ( = ?auto_707913 ?auto_707921 ) ) ( not ( = ?auto_707913 ?auto_707924 ) ) ( not ( = ?auto_707914 ?auto_707915 ) ) ( not ( = ?auto_707914 ?auto_707916 ) ) ( not ( = ?auto_707914 ?auto_707917 ) ) ( not ( = ?auto_707914 ?auto_707918 ) ) ( not ( = ?auto_707914 ?auto_707919 ) ) ( not ( = ?auto_707914 ?auto_707920 ) ) ( not ( = ?auto_707914 ?auto_707921 ) ) ( not ( = ?auto_707914 ?auto_707924 ) ) ( not ( = ?auto_707915 ?auto_707916 ) ) ( not ( = ?auto_707915 ?auto_707917 ) ) ( not ( = ?auto_707915 ?auto_707918 ) ) ( not ( = ?auto_707915 ?auto_707919 ) ) ( not ( = ?auto_707915 ?auto_707920 ) ) ( not ( = ?auto_707915 ?auto_707921 ) ) ( not ( = ?auto_707915 ?auto_707924 ) ) ( not ( = ?auto_707916 ?auto_707917 ) ) ( not ( = ?auto_707916 ?auto_707918 ) ) ( not ( = ?auto_707916 ?auto_707919 ) ) ( not ( = ?auto_707916 ?auto_707920 ) ) ( not ( = ?auto_707916 ?auto_707921 ) ) ( not ( = ?auto_707916 ?auto_707924 ) ) ( not ( = ?auto_707917 ?auto_707918 ) ) ( not ( = ?auto_707917 ?auto_707919 ) ) ( not ( = ?auto_707917 ?auto_707920 ) ) ( not ( = ?auto_707917 ?auto_707921 ) ) ( not ( = ?auto_707917 ?auto_707924 ) ) ( not ( = ?auto_707918 ?auto_707919 ) ) ( not ( = ?auto_707918 ?auto_707920 ) ) ( not ( = ?auto_707918 ?auto_707921 ) ) ( not ( = ?auto_707918 ?auto_707924 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_707919 ?auto_707920 ?auto_707921 )
      ( MAKE-9CRATE-VERIFY ?auto_707912 ?auto_707913 ?auto_707914 ?auto_707915 ?auto_707916 ?auto_707917 ?auto_707918 ?auto_707919 ?auto_707920 ?auto_707921 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_708021 - SURFACE
      ?auto_708022 - SURFACE
      ?auto_708023 - SURFACE
      ?auto_708024 - SURFACE
      ?auto_708025 - SURFACE
      ?auto_708026 - SURFACE
      ?auto_708027 - SURFACE
      ?auto_708028 - SURFACE
      ?auto_708029 - SURFACE
      ?auto_708030 - SURFACE
    )
    :vars
    (
      ?auto_708032 - HOIST
      ?auto_708035 - PLACE
      ?auto_708033 - PLACE
      ?auto_708034 - HOIST
      ?auto_708036 - SURFACE
      ?auto_708031 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_708032 ?auto_708035 ) ( IS-CRATE ?auto_708030 ) ( not ( = ?auto_708029 ?auto_708030 ) ) ( not ( = ?auto_708028 ?auto_708029 ) ) ( not ( = ?auto_708028 ?auto_708030 ) ) ( not ( = ?auto_708033 ?auto_708035 ) ) ( HOIST-AT ?auto_708034 ?auto_708033 ) ( not ( = ?auto_708032 ?auto_708034 ) ) ( AVAILABLE ?auto_708034 ) ( SURFACE-AT ?auto_708030 ?auto_708033 ) ( ON ?auto_708030 ?auto_708036 ) ( CLEAR ?auto_708030 ) ( not ( = ?auto_708029 ?auto_708036 ) ) ( not ( = ?auto_708030 ?auto_708036 ) ) ( not ( = ?auto_708028 ?auto_708036 ) ) ( TRUCK-AT ?auto_708031 ?auto_708035 ) ( SURFACE-AT ?auto_708028 ?auto_708035 ) ( CLEAR ?auto_708028 ) ( LIFTING ?auto_708032 ?auto_708029 ) ( IS-CRATE ?auto_708029 ) ( ON ?auto_708022 ?auto_708021 ) ( ON ?auto_708023 ?auto_708022 ) ( ON ?auto_708024 ?auto_708023 ) ( ON ?auto_708025 ?auto_708024 ) ( ON ?auto_708026 ?auto_708025 ) ( ON ?auto_708027 ?auto_708026 ) ( ON ?auto_708028 ?auto_708027 ) ( not ( = ?auto_708021 ?auto_708022 ) ) ( not ( = ?auto_708021 ?auto_708023 ) ) ( not ( = ?auto_708021 ?auto_708024 ) ) ( not ( = ?auto_708021 ?auto_708025 ) ) ( not ( = ?auto_708021 ?auto_708026 ) ) ( not ( = ?auto_708021 ?auto_708027 ) ) ( not ( = ?auto_708021 ?auto_708028 ) ) ( not ( = ?auto_708021 ?auto_708029 ) ) ( not ( = ?auto_708021 ?auto_708030 ) ) ( not ( = ?auto_708021 ?auto_708036 ) ) ( not ( = ?auto_708022 ?auto_708023 ) ) ( not ( = ?auto_708022 ?auto_708024 ) ) ( not ( = ?auto_708022 ?auto_708025 ) ) ( not ( = ?auto_708022 ?auto_708026 ) ) ( not ( = ?auto_708022 ?auto_708027 ) ) ( not ( = ?auto_708022 ?auto_708028 ) ) ( not ( = ?auto_708022 ?auto_708029 ) ) ( not ( = ?auto_708022 ?auto_708030 ) ) ( not ( = ?auto_708022 ?auto_708036 ) ) ( not ( = ?auto_708023 ?auto_708024 ) ) ( not ( = ?auto_708023 ?auto_708025 ) ) ( not ( = ?auto_708023 ?auto_708026 ) ) ( not ( = ?auto_708023 ?auto_708027 ) ) ( not ( = ?auto_708023 ?auto_708028 ) ) ( not ( = ?auto_708023 ?auto_708029 ) ) ( not ( = ?auto_708023 ?auto_708030 ) ) ( not ( = ?auto_708023 ?auto_708036 ) ) ( not ( = ?auto_708024 ?auto_708025 ) ) ( not ( = ?auto_708024 ?auto_708026 ) ) ( not ( = ?auto_708024 ?auto_708027 ) ) ( not ( = ?auto_708024 ?auto_708028 ) ) ( not ( = ?auto_708024 ?auto_708029 ) ) ( not ( = ?auto_708024 ?auto_708030 ) ) ( not ( = ?auto_708024 ?auto_708036 ) ) ( not ( = ?auto_708025 ?auto_708026 ) ) ( not ( = ?auto_708025 ?auto_708027 ) ) ( not ( = ?auto_708025 ?auto_708028 ) ) ( not ( = ?auto_708025 ?auto_708029 ) ) ( not ( = ?auto_708025 ?auto_708030 ) ) ( not ( = ?auto_708025 ?auto_708036 ) ) ( not ( = ?auto_708026 ?auto_708027 ) ) ( not ( = ?auto_708026 ?auto_708028 ) ) ( not ( = ?auto_708026 ?auto_708029 ) ) ( not ( = ?auto_708026 ?auto_708030 ) ) ( not ( = ?auto_708026 ?auto_708036 ) ) ( not ( = ?auto_708027 ?auto_708028 ) ) ( not ( = ?auto_708027 ?auto_708029 ) ) ( not ( = ?auto_708027 ?auto_708030 ) ) ( not ( = ?auto_708027 ?auto_708036 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_708028 ?auto_708029 ?auto_708030 )
      ( MAKE-9CRATE-VERIFY ?auto_708021 ?auto_708022 ?auto_708023 ?auto_708024 ?auto_708025 ?auto_708026 ?auto_708027 ?auto_708028 ?auto_708029 ?auto_708030 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_708130 - SURFACE
      ?auto_708131 - SURFACE
      ?auto_708132 - SURFACE
      ?auto_708133 - SURFACE
      ?auto_708134 - SURFACE
      ?auto_708135 - SURFACE
      ?auto_708136 - SURFACE
      ?auto_708137 - SURFACE
      ?auto_708138 - SURFACE
      ?auto_708139 - SURFACE
    )
    :vars
    (
      ?auto_708142 - HOIST
      ?auto_708145 - PLACE
      ?auto_708143 - PLACE
      ?auto_708140 - HOIST
      ?auto_708144 - SURFACE
      ?auto_708141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_708142 ?auto_708145 ) ( IS-CRATE ?auto_708139 ) ( not ( = ?auto_708138 ?auto_708139 ) ) ( not ( = ?auto_708137 ?auto_708138 ) ) ( not ( = ?auto_708137 ?auto_708139 ) ) ( not ( = ?auto_708143 ?auto_708145 ) ) ( HOIST-AT ?auto_708140 ?auto_708143 ) ( not ( = ?auto_708142 ?auto_708140 ) ) ( AVAILABLE ?auto_708140 ) ( SURFACE-AT ?auto_708139 ?auto_708143 ) ( ON ?auto_708139 ?auto_708144 ) ( CLEAR ?auto_708139 ) ( not ( = ?auto_708138 ?auto_708144 ) ) ( not ( = ?auto_708139 ?auto_708144 ) ) ( not ( = ?auto_708137 ?auto_708144 ) ) ( TRUCK-AT ?auto_708141 ?auto_708145 ) ( SURFACE-AT ?auto_708137 ?auto_708145 ) ( CLEAR ?auto_708137 ) ( IS-CRATE ?auto_708138 ) ( AVAILABLE ?auto_708142 ) ( IN ?auto_708138 ?auto_708141 ) ( ON ?auto_708131 ?auto_708130 ) ( ON ?auto_708132 ?auto_708131 ) ( ON ?auto_708133 ?auto_708132 ) ( ON ?auto_708134 ?auto_708133 ) ( ON ?auto_708135 ?auto_708134 ) ( ON ?auto_708136 ?auto_708135 ) ( ON ?auto_708137 ?auto_708136 ) ( not ( = ?auto_708130 ?auto_708131 ) ) ( not ( = ?auto_708130 ?auto_708132 ) ) ( not ( = ?auto_708130 ?auto_708133 ) ) ( not ( = ?auto_708130 ?auto_708134 ) ) ( not ( = ?auto_708130 ?auto_708135 ) ) ( not ( = ?auto_708130 ?auto_708136 ) ) ( not ( = ?auto_708130 ?auto_708137 ) ) ( not ( = ?auto_708130 ?auto_708138 ) ) ( not ( = ?auto_708130 ?auto_708139 ) ) ( not ( = ?auto_708130 ?auto_708144 ) ) ( not ( = ?auto_708131 ?auto_708132 ) ) ( not ( = ?auto_708131 ?auto_708133 ) ) ( not ( = ?auto_708131 ?auto_708134 ) ) ( not ( = ?auto_708131 ?auto_708135 ) ) ( not ( = ?auto_708131 ?auto_708136 ) ) ( not ( = ?auto_708131 ?auto_708137 ) ) ( not ( = ?auto_708131 ?auto_708138 ) ) ( not ( = ?auto_708131 ?auto_708139 ) ) ( not ( = ?auto_708131 ?auto_708144 ) ) ( not ( = ?auto_708132 ?auto_708133 ) ) ( not ( = ?auto_708132 ?auto_708134 ) ) ( not ( = ?auto_708132 ?auto_708135 ) ) ( not ( = ?auto_708132 ?auto_708136 ) ) ( not ( = ?auto_708132 ?auto_708137 ) ) ( not ( = ?auto_708132 ?auto_708138 ) ) ( not ( = ?auto_708132 ?auto_708139 ) ) ( not ( = ?auto_708132 ?auto_708144 ) ) ( not ( = ?auto_708133 ?auto_708134 ) ) ( not ( = ?auto_708133 ?auto_708135 ) ) ( not ( = ?auto_708133 ?auto_708136 ) ) ( not ( = ?auto_708133 ?auto_708137 ) ) ( not ( = ?auto_708133 ?auto_708138 ) ) ( not ( = ?auto_708133 ?auto_708139 ) ) ( not ( = ?auto_708133 ?auto_708144 ) ) ( not ( = ?auto_708134 ?auto_708135 ) ) ( not ( = ?auto_708134 ?auto_708136 ) ) ( not ( = ?auto_708134 ?auto_708137 ) ) ( not ( = ?auto_708134 ?auto_708138 ) ) ( not ( = ?auto_708134 ?auto_708139 ) ) ( not ( = ?auto_708134 ?auto_708144 ) ) ( not ( = ?auto_708135 ?auto_708136 ) ) ( not ( = ?auto_708135 ?auto_708137 ) ) ( not ( = ?auto_708135 ?auto_708138 ) ) ( not ( = ?auto_708135 ?auto_708139 ) ) ( not ( = ?auto_708135 ?auto_708144 ) ) ( not ( = ?auto_708136 ?auto_708137 ) ) ( not ( = ?auto_708136 ?auto_708138 ) ) ( not ( = ?auto_708136 ?auto_708139 ) ) ( not ( = ?auto_708136 ?auto_708144 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_708137 ?auto_708138 ?auto_708139 )
      ( MAKE-9CRATE-VERIFY ?auto_708130 ?auto_708131 ?auto_708132 ?auto_708133 ?auto_708134 ?auto_708135 ?auto_708136 ?auto_708137 ?auto_708138 ?auto_708139 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_713695 - SURFACE
      ?auto_713696 - SURFACE
      ?auto_713697 - SURFACE
      ?auto_713698 - SURFACE
      ?auto_713699 - SURFACE
      ?auto_713700 - SURFACE
      ?auto_713701 - SURFACE
      ?auto_713702 - SURFACE
      ?auto_713703 - SURFACE
      ?auto_713704 - SURFACE
      ?auto_713705 - SURFACE
    )
    :vars
    (
      ?auto_713707 - HOIST
      ?auto_713706 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_713707 ?auto_713706 ) ( SURFACE-AT ?auto_713704 ?auto_713706 ) ( CLEAR ?auto_713704 ) ( LIFTING ?auto_713707 ?auto_713705 ) ( IS-CRATE ?auto_713705 ) ( not ( = ?auto_713704 ?auto_713705 ) ) ( ON ?auto_713696 ?auto_713695 ) ( ON ?auto_713697 ?auto_713696 ) ( ON ?auto_713698 ?auto_713697 ) ( ON ?auto_713699 ?auto_713698 ) ( ON ?auto_713700 ?auto_713699 ) ( ON ?auto_713701 ?auto_713700 ) ( ON ?auto_713702 ?auto_713701 ) ( ON ?auto_713703 ?auto_713702 ) ( ON ?auto_713704 ?auto_713703 ) ( not ( = ?auto_713695 ?auto_713696 ) ) ( not ( = ?auto_713695 ?auto_713697 ) ) ( not ( = ?auto_713695 ?auto_713698 ) ) ( not ( = ?auto_713695 ?auto_713699 ) ) ( not ( = ?auto_713695 ?auto_713700 ) ) ( not ( = ?auto_713695 ?auto_713701 ) ) ( not ( = ?auto_713695 ?auto_713702 ) ) ( not ( = ?auto_713695 ?auto_713703 ) ) ( not ( = ?auto_713695 ?auto_713704 ) ) ( not ( = ?auto_713695 ?auto_713705 ) ) ( not ( = ?auto_713696 ?auto_713697 ) ) ( not ( = ?auto_713696 ?auto_713698 ) ) ( not ( = ?auto_713696 ?auto_713699 ) ) ( not ( = ?auto_713696 ?auto_713700 ) ) ( not ( = ?auto_713696 ?auto_713701 ) ) ( not ( = ?auto_713696 ?auto_713702 ) ) ( not ( = ?auto_713696 ?auto_713703 ) ) ( not ( = ?auto_713696 ?auto_713704 ) ) ( not ( = ?auto_713696 ?auto_713705 ) ) ( not ( = ?auto_713697 ?auto_713698 ) ) ( not ( = ?auto_713697 ?auto_713699 ) ) ( not ( = ?auto_713697 ?auto_713700 ) ) ( not ( = ?auto_713697 ?auto_713701 ) ) ( not ( = ?auto_713697 ?auto_713702 ) ) ( not ( = ?auto_713697 ?auto_713703 ) ) ( not ( = ?auto_713697 ?auto_713704 ) ) ( not ( = ?auto_713697 ?auto_713705 ) ) ( not ( = ?auto_713698 ?auto_713699 ) ) ( not ( = ?auto_713698 ?auto_713700 ) ) ( not ( = ?auto_713698 ?auto_713701 ) ) ( not ( = ?auto_713698 ?auto_713702 ) ) ( not ( = ?auto_713698 ?auto_713703 ) ) ( not ( = ?auto_713698 ?auto_713704 ) ) ( not ( = ?auto_713698 ?auto_713705 ) ) ( not ( = ?auto_713699 ?auto_713700 ) ) ( not ( = ?auto_713699 ?auto_713701 ) ) ( not ( = ?auto_713699 ?auto_713702 ) ) ( not ( = ?auto_713699 ?auto_713703 ) ) ( not ( = ?auto_713699 ?auto_713704 ) ) ( not ( = ?auto_713699 ?auto_713705 ) ) ( not ( = ?auto_713700 ?auto_713701 ) ) ( not ( = ?auto_713700 ?auto_713702 ) ) ( not ( = ?auto_713700 ?auto_713703 ) ) ( not ( = ?auto_713700 ?auto_713704 ) ) ( not ( = ?auto_713700 ?auto_713705 ) ) ( not ( = ?auto_713701 ?auto_713702 ) ) ( not ( = ?auto_713701 ?auto_713703 ) ) ( not ( = ?auto_713701 ?auto_713704 ) ) ( not ( = ?auto_713701 ?auto_713705 ) ) ( not ( = ?auto_713702 ?auto_713703 ) ) ( not ( = ?auto_713702 ?auto_713704 ) ) ( not ( = ?auto_713702 ?auto_713705 ) ) ( not ( = ?auto_713703 ?auto_713704 ) ) ( not ( = ?auto_713703 ?auto_713705 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_713704 ?auto_713705 )
      ( MAKE-10CRATE-VERIFY ?auto_713695 ?auto_713696 ?auto_713697 ?auto_713698 ?auto_713699 ?auto_713700 ?auto_713701 ?auto_713702 ?auto_713703 ?auto_713704 ?auto_713705 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_713789 - SURFACE
      ?auto_713790 - SURFACE
      ?auto_713791 - SURFACE
      ?auto_713792 - SURFACE
      ?auto_713793 - SURFACE
      ?auto_713794 - SURFACE
      ?auto_713795 - SURFACE
      ?auto_713796 - SURFACE
      ?auto_713797 - SURFACE
      ?auto_713798 - SURFACE
      ?auto_713799 - SURFACE
    )
    :vars
    (
      ?auto_713800 - HOIST
      ?auto_713801 - PLACE
      ?auto_713802 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_713800 ?auto_713801 ) ( SURFACE-AT ?auto_713798 ?auto_713801 ) ( CLEAR ?auto_713798 ) ( IS-CRATE ?auto_713799 ) ( not ( = ?auto_713798 ?auto_713799 ) ) ( TRUCK-AT ?auto_713802 ?auto_713801 ) ( AVAILABLE ?auto_713800 ) ( IN ?auto_713799 ?auto_713802 ) ( ON ?auto_713798 ?auto_713797 ) ( not ( = ?auto_713797 ?auto_713798 ) ) ( not ( = ?auto_713797 ?auto_713799 ) ) ( ON ?auto_713790 ?auto_713789 ) ( ON ?auto_713791 ?auto_713790 ) ( ON ?auto_713792 ?auto_713791 ) ( ON ?auto_713793 ?auto_713792 ) ( ON ?auto_713794 ?auto_713793 ) ( ON ?auto_713795 ?auto_713794 ) ( ON ?auto_713796 ?auto_713795 ) ( ON ?auto_713797 ?auto_713796 ) ( not ( = ?auto_713789 ?auto_713790 ) ) ( not ( = ?auto_713789 ?auto_713791 ) ) ( not ( = ?auto_713789 ?auto_713792 ) ) ( not ( = ?auto_713789 ?auto_713793 ) ) ( not ( = ?auto_713789 ?auto_713794 ) ) ( not ( = ?auto_713789 ?auto_713795 ) ) ( not ( = ?auto_713789 ?auto_713796 ) ) ( not ( = ?auto_713789 ?auto_713797 ) ) ( not ( = ?auto_713789 ?auto_713798 ) ) ( not ( = ?auto_713789 ?auto_713799 ) ) ( not ( = ?auto_713790 ?auto_713791 ) ) ( not ( = ?auto_713790 ?auto_713792 ) ) ( not ( = ?auto_713790 ?auto_713793 ) ) ( not ( = ?auto_713790 ?auto_713794 ) ) ( not ( = ?auto_713790 ?auto_713795 ) ) ( not ( = ?auto_713790 ?auto_713796 ) ) ( not ( = ?auto_713790 ?auto_713797 ) ) ( not ( = ?auto_713790 ?auto_713798 ) ) ( not ( = ?auto_713790 ?auto_713799 ) ) ( not ( = ?auto_713791 ?auto_713792 ) ) ( not ( = ?auto_713791 ?auto_713793 ) ) ( not ( = ?auto_713791 ?auto_713794 ) ) ( not ( = ?auto_713791 ?auto_713795 ) ) ( not ( = ?auto_713791 ?auto_713796 ) ) ( not ( = ?auto_713791 ?auto_713797 ) ) ( not ( = ?auto_713791 ?auto_713798 ) ) ( not ( = ?auto_713791 ?auto_713799 ) ) ( not ( = ?auto_713792 ?auto_713793 ) ) ( not ( = ?auto_713792 ?auto_713794 ) ) ( not ( = ?auto_713792 ?auto_713795 ) ) ( not ( = ?auto_713792 ?auto_713796 ) ) ( not ( = ?auto_713792 ?auto_713797 ) ) ( not ( = ?auto_713792 ?auto_713798 ) ) ( not ( = ?auto_713792 ?auto_713799 ) ) ( not ( = ?auto_713793 ?auto_713794 ) ) ( not ( = ?auto_713793 ?auto_713795 ) ) ( not ( = ?auto_713793 ?auto_713796 ) ) ( not ( = ?auto_713793 ?auto_713797 ) ) ( not ( = ?auto_713793 ?auto_713798 ) ) ( not ( = ?auto_713793 ?auto_713799 ) ) ( not ( = ?auto_713794 ?auto_713795 ) ) ( not ( = ?auto_713794 ?auto_713796 ) ) ( not ( = ?auto_713794 ?auto_713797 ) ) ( not ( = ?auto_713794 ?auto_713798 ) ) ( not ( = ?auto_713794 ?auto_713799 ) ) ( not ( = ?auto_713795 ?auto_713796 ) ) ( not ( = ?auto_713795 ?auto_713797 ) ) ( not ( = ?auto_713795 ?auto_713798 ) ) ( not ( = ?auto_713795 ?auto_713799 ) ) ( not ( = ?auto_713796 ?auto_713797 ) ) ( not ( = ?auto_713796 ?auto_713798 ) ) ( not ( = ?auto_713796 ?auto_713799 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_713797 ?auto_713798 ?auto_713799 )
      ( MAKE-10CRATE-VERIFY ?auto_713789 ?auto_713790 ?auto_713791 ?auto_713792 ?auto_713793 ?auto_713794 ?auto_713795 ?auto_713796 ?auto_713797 ?auto_713798 ?auto_713799 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_713894 - SURFACE
      ?auto_713895 - SURFACE
      ?auto_713896 - SURFACE
      ?auto_713897 - SURFACE
      ?auto_713898 - SURFACE
      ?auto_713899 - SURFACE
      ?auto_713900 - SURFACE
      ?auto_713901 - SURFACE
      ?auto_713902 - SURFACE
      ?auto_713903 - SURFACE
      ?auto_713904 - SURFACE
    )
    :vars
    (
      ?auto_713906 - HOIST
      ?auto_713905 - PLACE
      ?auto_713908 - TRUCK
      ?auto_713907 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_713906 ?auto_713905 ) ( SURFACE-AT ?auto_713903 ?auto_713905 ) ( CLEAR ?auto_713903 ) ( IS-CRATE ?auto_713904 ) ( not ( = ?auto_713903 ?auto_713904 ) ) ( AVAILABLE ?auto_713906 ) ( IN ?auto_713904 ?auto_713908 ) ( ON ?auto_713903 ?auto_713902 ) ( not ( = ?auto_713902 ?auto_713903 ) ) ( not ( = ?auto_713902 ?auto_713904 ) ) ( TRUCK-AT ?auto_713908 ?auto_713907 ) ( not ( = ?auto_713907 ?auto_713905 ) ) ( ON ?auto_713895 ?auto_713894 ) ( ON ?auto_713896 ?auto_713895 ) ( ON ?auto_713897 ?auto_713896 ) ( ON ?auto_713898 ?auto_713897 ) ( ON ?auto_713899 ?auto_713898 ) ( ON ?auto_713900 ?auto_713899 ) ( ON ?auto_713901 ?auto_713900 ) ( ON ?auto_713902 ?auto_713901 ) ( not ( = ?auto_713894 ?auto_713895 ) ) ( not ( = ?auto_713894 ?auto_713896 ) ) ( not ( = ?auto_713894 ?auto_713897 ) ) ( not ( = ?auto_713894 ?auto_713898 ) ) ( not ( = ?auto_713894 ?auto_713899 ) ) ( not ( = ?auto_713894 ?auto_713900 ) ) ( not ( = ?auto_713894 ?auto_713901 ) ) ( not ( = ?auto_713894 ?auto_713902 ) ) ( not ( = ?auto_713894 ?auto_713903 ) ) ( not ( = ?auto_713894 ?auto_713904 ) ) ( not ( = ?auto_713895 ?auto_713896 ) ) ( not ( = ?auto_713895 ?auto_713897 ) ) ( not ( = ?auto_713895 ?auto_713898 ) ) ( not ( = ?auto_713895 ?auto_713899 ) ) ( not ( = ?auto_713895 ?auto_713900 ) ) ( not ( = ?auto_713895 ?auto_713901 ) ) ( not ( = ?auto_713895 ?auto_713902 ) ) ( not ( = ?auto_713895 ?auto_713903 ) ) ( not ( = ?auto_713895 ?auto_713904 ) ) ( not ( = ?auto_713896 ?auto_713897 ) ) ( not ( = ?auto_713896 ?auto_713898 ) ) ( not ( = ?auto_713896 ?auto_713899 ) ) ( not ( = ?auto_713896 ?auto_713900 ) ) ( not ( = ?auto_713896 ?auto_713901 ) ) ( not ( = ?auto_713896 ?auto_713902 ) ) ( not ( = ?auto_713896 ?auto_713903 ) ) ( not ( = ?auto_713896 ?auto_713904 ) ) ( not ( = ?auto_713897 ?auto_713898 ) ) ( not ( = ?auto_713897 ?auto_713899 ) ) ( not ( = ?auto_713897 ?auto_713900 ) ) ( not ( = ?auto_713897 ?auto_713901 ) ) ( not ( = ?auto_713897 ?auto_713902 ) ) ( not ( = ?auto_713897 ?auto_713903 ) ) ( not ( = ?auto_713897 ?auto_713904 ) ) ( not ( = ?auto_713898 ?auto_713899 ) ) ( not ( = ?auto_713898 ?auto_713900 ) ) ( not ( = ?auto_713898 ?auto_713901 ) ) ( not ( = ?auto_713898 ?auto_713902 ) ) ( not ( = ?auto_713898 ?auto_713903 ) ) ( not ( = ?auto_713898 ?auto_713904 ) ) ( not ( = ?auto_713899 ?auto_713900 ) ) ( not ( = ?auto_713899 ?auto_713901 ) ) ( not ( = ?auto_713899 ?auto_713902 ) ) ( not ( = ?auto_713899 ?auto_713903 ) ) ( not ( = ?auto_713899 ?auto_713904 ) ) ( not ( = ?auto_713900 ?auto_713901 ) ) ( not ( = ?auto_713900 ?auto_713902 ) ) ( not ( = ?auto_713900 ?auto_713903 ) ) ( not ( = ?auto_713900 ?auto_713904 ) ) ( not ( = ?auto_713901 ?auto_713902 ) ) ( not ( = ?auto_713901 ?auto_713903 ) ) ( not ( = ?auto_713901 ?auto_713904 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_713902 ?auto_713903 ?auto_713904 )
      ( MAKE-10CRATE-VERIFY ?auto_713894 ?auto_713895 ?auto_713896 ?auto_713897 ?auto_713898 ?auto_713899 ?auto_713900 ?auto_713901 ?auto_713902 ?auto_713903 ?auto_713904 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_714009 - SURFACE
      ?auto_714010 - SURFACE
      ?auto_714011 - SURFACE
      ?auto_714012 - SURFACE
      ?auto_714013 - SURFACE
      ?auto_714014 - SURFACE
      ?auto_714015 - SURFACE
      ?auto_714016 - SURFACE
      ?auto_714017 - SURFACE
      ?auto_714018 - SURFACE
      ?auto_714019 - SURFACE
    )
    :vars
    (
      ?auto_714022 - HOIST
      ?auto_714024 - PLACE
      ?auto_714021 - TRUCK
      ?auto_714023 - PLACE
      ?auto_714020 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_714022 ?auto_714024 ) ( SURFACE-AT ?auto_714018 ?auto_714024 ) ( CLEAR ?auto_714018 ) ( IS-CRATE ?auto_714019 ) ( not ( = ?auto_714018 ?auto_714019 ) ) ( AVAILABLE ?auto_714022 ) ( ON ?auto_714018 ?auto_714017 ) ( not ( = ?auto_714017 ?auto_714018 ) ) ( not ( = ?auto_714017 ?auto_714019 ) ) ( TRUCK-AT ?auto_714021 ?auto_714023 ) ( not ( = ?auto_714023 ?auto_714024 ) ) ( HOIST-AT ?auto_714020 ?auto_714023 ) ( LIFTING ?auto_714020 ?auto_714019 ) ( not ( = ?auto_714022 ?auto_714020 ) ) ( ON ?auto_714010 ?auto_714009 ) ( ON ?auto_714011 ?auto_714010 ) ( ON ?auto_714012 ?auto_714011 ) ( ON ?auto_714013 ?auto_714012 ) ( ON ?auto_714014 ?auto_714013 ) ( ON ?auto_714015 ?auto_714014 ) ( ON ?auto_714016 ?auto_714015 ) ( ON ?auto_714017 ?auto_714016 ) ( not ( = ?auto_714009 ?auto_714010 ) ) ( not ( = ?auto_714009 ?auto_714011 ) ) ( not ( = ?auto_714009 ?auto_714012 ) ) ( not ( = ?auto_714009 ?auto_714013 ) ) ( not ( = ?auto_714009 ?auto_714014 ) ) ( not ( = ?auto_714009 ?auto_714015 ) ) ( not ( = ?auto_714009 ?auto_714016 ) ) ( not ( = ?auto_714009 ?auto_714017 ) ) ( not ( = ?auto_714009 ?auto_714018 ) ) ( not ( = ?auto_714009 ?auto_714019 ) ) ( not ( = ?auto_714010 ?auto_714011 ) ) ( not ( = ?auto_714010 ?auto_714012 ) ) ( not ( = ?auto_714010 ?auto_714013 ) ) ( not ( = ?auto_714010 ?auto_714014 ) ) ( not ( = ?auto_714010 ?auto_714015 ) ) ( not ( = ?auto_714010 ?auto_714016 ) ) ( not ( = ?auto_714010 ?auto_714017 ) ) ( not ( = ?auto_714010 ?auto_714018 ) ) ( not ( = ?auto_714010 ?auto_714019 ) ) ( not ( = ?auto_714011 ?auto_714012 ) ) ( not ( = ?auto_714011 ?auto_714013 ) ) ( not ( = ?auto_714011 ?auto_714014 ) ) ( not ( = ?auto_714011 ?auto_714015 ) ) ( not ( = ?auto_714011 ?auto_714016 ) ) ( not ( = ?auto_714011 ?auto_714017 ) ) ( not ( = ?auto_714011 ?auto_714018 ) ) ( not ( = ?auto_714011 ?auto_714019 ) ) ( not ( = ?auto_714012 ?auto_714013 ) ) ( not ( = ?auto_714012 ?auto_714014 ) ) ( not ( = ?auto_714012 ?auto_714015 ) ) ( not ( = ?auto_714012 ?auto_714016 ) ) ( not ( = ?auto_714012 ?auto_714017 ) ) ( not ( = ?auto_714012 ?auto_714018 ) ) ( not ( = ?auto_714012 ?auto_714019 ) ) ( not ( = ?auto_714013 ?auto_714014 ) ) ( not ( = ?auto_714013 ?auto_714015 ) ) ( not ( = ?auto_714013 ?auto_714016 ) ) ( not ( = ?auto_714013 ?auto_714017 ) ) ( not ( = ?auto_714013 ?auto_714018 ) ) ( not ( = ?auto_714013 ?auto_714019 ) ) ( not ( = ?auto_714014 ?auto_714015 ) ) ( not ( = ?auto_714014 ?auto_714016 ) ) ( not ( = ?auto_714014 ?auto_714017 ) ) ( not ( = ?auto_714014 ?auto_714018 ) ) ( not ( = ?auto_714014 ?auto_714019 ) ) ( not ( = ?auto_714015 ?auto_714016 ) ) ( not ( = ?auto_714015 ?auto_714017 ) ) ( not ( = ?auto_714015 ?auto_714018 ) ) ( not ( = ?auto_714015 ?auto_714019 ) ) ( not ( = ?auto_714016 ?auto_714017 ) ) ( not ( = ?auto_714016 ?auto_714018 ) ) ( not ( = ?auto_714016 ?auto_714019 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_714017 ?auto_714018 ?auto_714019 )
      ( MAKE-10CRATE-VERIFY ?auto_714009 ?auto_714010 ?auto_714011 ?auto_714012 ?auto_714013 ?auto_714014 ?auto_714015 ?auto_714016 ?auto_714017 ?auto_714018 ?auto_714019 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_714134 - SURFACE
      ?auto_714135 - SURFACE
      ?auto_714136 - SURFACE
      ?auto_714137 - SURFACE
      ?auto_714138 - SURFACE
      ?auto_714139 - SURFACE
      ?auto_714140 - SURFACE
      ?auto_714141 - SURFACE
      ?auto_714142 - SURFACE
      ?auto_714143 - SURFACE
      ?auto_714144 - SURFACE
    )
    :vars
    (
      ?auto_714150 - HOIST
      ?auto_714149 - PLACE
      ?auto_714147 - TRUCK
      ?auto_714145 - PLACE
      ?auto_714146 - HOIST
      ?auto_714148 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_714150 ?auto_714149 ) ( SURFACE-AT ?auto_714143 ?auto_714149 ) ( CLEAR ?auto_714143 ) ( IS-CRATE ?auto_714144 ) ( not ( = ?auto_714143 ?auto_714144 ) ) ( AVAILABLE ?auto_714150 ) ( ON ?auto_714143 ?auto_714142 ) ( not ( = ?auto_714142 ?auto_714143 ) ) ( not ( = ?auto_714142 ?auto_714144 ) ) ( TRUCK-AT ?auto_714147 ?auto_714145 ) ( not ( = ?auto_714145 ?auto_714149 ) ) ( HOIST-AT ?auto_714146 ?auto_714145 ) ( not ( = ?auto_714150 ?auto_714146 ) ) ( AVAILABLE ?auto_714146 ) ( SURFACE-AT ?auto_714144 ?auto_714145 ) ( ON ?auto_714144 ?auto_714148 ) ( CLEAR ?auto_714144 ) ( not ( = ?auto_714143 ?auto_714148 ) ) ( not ( = ?auto_714144 ?auto_714148 ) ) ( not ( = ?auto_714142 ?auto_714148 ) ) ( ON ?auto_714135 ?auto_714134 ) ( ON ?auto_714136 ?auto_714135 ) ( ON ?auto_714137 ?auto_714136 ) ( ON ?auto_714138 ?auto_714137 ) ( ON ?auto_714139 ?auto_714138 ) ( ON ?auto_714140 ?auto_714139 ) ( ON ?auto_714141 ?auto_714140 ) ( ON ?auto_714142 ?auto_714141 ) ( not ( = ?auto_714134 ?auto_714135 ) ) ( not ( = ?auto_714134 ?auto_714136 ) ) ( not ( = ?auto_714134 ?auto_714137 ) ) ( not ( = ?auto_714134 ?auto_714138 ) ) ( not ( = ?auto_714134 ?auto_714139 ) ) ( not ( = ?auto_714134 ?auto_714140 ) ) ( not ( = ?auto_714134 ?auto_714141 ) ) ( not ( = ?auto_714134 ?auto_714142 ) ) ( not ( = ?auto_714134 ?auto_714143 ) ) ( not ( = ?auto_714134 ?auto_714144 ) ) ( not ( = ?auto_714134 ?auto_714148 ) ) ( not ( = ?auto_714135 ?auto_714136 ) ) ( not ( = ?auto_714135 ?auto_714137 ) ) ( not ( = ?auto_714135 ?auto_714138 ) ) ( not ( = ?auto_714135 ?auto_714139 ) ) ( not ( = ?auto_714135 ?auto_714140 ) ) ( not ( = ?auto_714135 ?auto_714141 ) ) ( not ( = ?auto_714135 ?auto_714142 ) ) ( not ( = ?auto_714135 ?auto_714143 ) ) ( not ( = ?auto_714135 ?auto_714144 ) ) ( not ( = ?auto_714135 ?auto_714148 ) ) ( not ( = ?auto_714136 ?auto_714137 ) ) ( not ( = ?auto_714136 ?auto_714138 ) ) ( not ( = ?auto_714136 ?auto_714139 ) ) ( not ( = ?auto_714136 ?auto_714140 ) ) ( not ( = ?auto_714136 ?auto_714141 ) ) ( not ( = ?auto_714136 ?auto_714142 ) ) ( not ( = ?auto_714136 ?auto_714143 ) ) ( not ( = ?auto_714136 ?auto_714144 ) ) ( not ( = ?auto_714136 ?auto_714148 ) ) ( not ( = ?auto_714137 ?auto_714138 ) ) ( not ( = ?auto_714137 ?auto_714139 ) ) ( not ( = ?auto_714137 ?auto_714140 ) ) ( not ( = ?auto_714137 ?auto_714141 ) ) ( not ( = ?auto_714137 ?auto_714142 ) ) ( not ( = ?auto_714137 ?auto_714143 ) ) ( not ( = ?auto_714137 ?auto_714144 ) ) ( not ( = ?auto_714137 ?auto_714148 ) ) ( not ( = ?auto_714138 ?auto_714139 ) ) ( not ( = ?auto_714138 ?auto_714140 ) ) ( not ( = ?auto_714138 ?auto_714141 ) ) ( not ( = ?auto_714138 ?auto_714142 ) ) ( not ( = ?auto_714138 ?auto_714143 ) ) ( not ( = ?auto_714138 ?auto_714144 ) ) ( not ( = ?auto_714138 ?auto_714148 ) ) ( not ( = ?auto_714139 ?auto_714140 ) ) ( not ( = ?auto_714139 ?auto_714141 ) ) ( not ( = ?auto_714139 ?auto_714142 ) ) ( not ( = ?auto_714139 ?auto_714143 ) ) ( not ( = ?auto_714139 ?auto_714144 ) ) ( not ( = ?auto_714139 ?auto_714148 ) ) ( not ( = ?auto_714140 ?auto_714141 ) ) ( not ( = ?auto_714140 ?auto_714142 ) ) ( not ( = ?auto_714140 ?auto_714143 ) ) ( not ( = ?auto_714140 ?auto_714144 ) ) ( not ( = ?auto_714140 ?auto_714148 ) ) ( not ( = ?auto_714141 ?auto_714142 ) ) ( not ( = ?auto_714141 ?auto_714143 ) ) ( not ( = ?auto_714141 ?auto_714144 ) ) ( not ( = ?auto_714141 ?auto_714148 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_714142 ?auto_714143 ?auto_714144 )
      ( MAKE-10CRATE-VERIFY ?auto_714134 ?auto_714135 ?auto_714136 ?auto_714137 ?auto_714138 ?auto_714139 ?auto_714140 ?auto_714141 ?auto_714142 ?auto_714143 ?auto_714144 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_714260 - SURFACE
      ?auto_714261 - SURFACE
      ?auto_714262 - SURFACE
      ?auto_714263 - SURFACE
      ?auto_714264 - SURFACE
      ?auto_714265 - SURFACE
      ?auto_714266 - SURFACE
      ?auto_714267 - SURFACE
      ?auto_714268 - SURFACE
      ?auto_714269 - SURFACE
      ?auto_714270 - SURFACE
    )
    :vars
    (
      ?auto_714272 - HOIST
      ?auto_714271 - PLACE
      ?auto_714274 - PLACE
      ?auto_714273 - HOIST
      ?auto_714276 - SURFACE
      ?auto_714275 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_714272 ?auto_714271 ) ( SURFACE-AT ?auto_714269 ?auto_714271 ) ( CLEAR ?auto_714269 ) ( IS-CRATE ?auto_714270 ) ( not ( = ?auto_714269 ?auto_714270 ) ) ( AVAILABLE ?auto_714272 ) ( ON ?auto_714269 ?auto_714268 ) ( not ( = ?auto_714268 ?auto_714269 ) ) ( not ( = ?auto_714268 ?auto_714270 ) ) ( not ( = ?auto_714274 ?auto_714271 ) ) ( HOIST-AT ?auto_714273 ?auto_714274 ) ( not ( = ?auto_714272 ?auto_714273 ) ) ( AVAILABLE ?auto_714273 ) ( SURFACE-AT ?auto_714270 ?auto_714274 ) ( ON ?auto_714270 ?auto_714276 ) ( CLEAR ?auto_714270 ) ( not ( = ?auto_714269 ?auto_714276 ) ) ( not ( = ?auto_714270 ?auto_714276 ) ) ( not ( = ?auto_714268 ?auto_714276 ) ) ( TRUCK-AT ?auto_714275 ?auto_714271 ) ( ON ?auto_714261 ?auto_714260 ) ( ON ?auto_714262 ?auto_714261 ) ( ON ?auto_714263 ?auto_714262 ) ( ON ?auto_714264 ?auto_714263 ) ( ON ?auto_714265 ?auto_714264 ) ( ON ?auto_714266 ?auto_714265 ) ( ON ?auto_714267 ?auto_714266 ) ( ON ?auto_714268 ?auto_714267 ) ( not ( = ?auto_714260 ?auto_714261 ) ) ( not ( = ?auto_714260 ?auto_714262 ) ) ( not ( = ?auto_714260 ?auto_714263 ) ) ( not ( = ?auto_714260 ?auto_714264 ) ) ( not ( = ?auto_714260 ?auto_714265 ) ) ( not ( = ?auto_714260 ?auto_714266 ) ) ( not ( = ?auto_714260 ?auto_714267 ) ) ( not ( = ?auto_714260 ?auto_714268 ) ) ( not ( = ?auto_714260 ?auto_714269 ) ) ( not ( = ?auto_714260 ?auto_714270 ) ) ( not ( = ?auto_714260 ?auto_714276 ) ) ( not ( = ?auto_714261 ?auto_714262 ) ) ( not ( = ?auto_714261 ?auto_714263 ) ) ( not ( = ?auto_714261 ?auto_714264 ) ) ( not ( = ?auto_714261 ?auto_714265 ) ) ( not ( = ?auto_714261 ?auto_714266 ) ) ( not ( = ?auto_714261 ?auto_714267 ) ) ( not ( = ?auto_714261 ?auto_714268 ) ) ( not ( = ?auto_714261 ?auto_714269 ) ) ( not ( = ?auto_714261 ?auto_714270 ) ) ( not ( = ?auto_714261 ?auto_714276 ) ) ( not ( = ?auto_714262 ?auto_714263 ) ) ( not ( = ?auto_714262 ?auto_714264 ) ) ( not ( = ?auto_714262 ?auto_714265 ) ) ( not ( = ?auto_714262 ?auto_714266 ) ) ( not ( = ?auto_714262 ?auto_714267 ) ) ( not ( = ?auto_714262 ?auto_714268 ) ) ( not ( = ?auto_714262 ?auto_714269 ) ) ( not ( = ?auto_714262 ?auto_714270 ) ) ( not ( = ?auto_714262 ?auto_714276 ) ) ( not ( = ?auto_714263 ?auto_714264 ) ) ( not ( = ?auto_714263 ?auto_714265 ) ) ( not ( = ?auto_714263 ?auto_714266 ) ) ( not ( = ?auto_714263 ?auto_714267 ) ) ( not ( = ?auto_714263 ?auto_714268 ) ) ( not ( = ?auto_714263 ?auto_714269 ) ) ( not ( = ?auto_714263 ?auto_714270 ) ) ( not ( = ?auto_714263 ?auto_714276 ) ) ( not ( = ?auto_714264 ?auto_714265 ) ) ( not ( = ?auto_714264 ?auto_714266 ) ) ( not ( = ?auto_714264 ?auto_714267 ) ) ( not ( = ?auto_714264 ?auto_714268 ) ) ( not ( = ?auto_714264 ?auto_714269 ) ) ( not ( = ?auto_714264 ?auto_714270 ) ) ( not ( = ?auto_714264 ?auto_714276 ) ) ( not ( = ?auto_714265 ?auto_714266 ) ) ( not ( = ?auto_714265 ?auto_714267 ) ) ( not ( = ?auto_714265 ?auto_714268 ) ) ( not ( = ?auto_714265 ?auto_714269 ) ) ( not ( = ?auto_714265 ?auto_714270 ) ) ( not ( = ?auto_714265 ?auto_714276 ) ) ( not ( = ?auto_714266 ?auto_714267 ) ) ( not ( = ?auto_714266 ?auto_714268 ) ) ( not ( = ?auto_714266 ?auto_714269 ) ) ( not ( = ?auto_714266 ?auto_714270 ) ) ( not ( = ?auto_714266 ?auto_714276 ) ) ( not ( = ?auto_714267 ?auto_714268 ) ) ( not ( = ?auto_714267 ?auto_714269 ) ) ( not ( = ?auto_714267 ?auto_714270 ) ) ( not ( = ?auto_714267 ?auto_714276 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_714268 ?auto_714269 ?auto_714270 )
      ( MAKE-10CRATE-VERIFY ?auto_714260 ?auto_714261 ?auto_714262 ?auto_714263 ?auto_714264 ?auto_714265 ?auto_714266 ?auto_714267 ?auto_714268 ?auto_714269 ?auto_714270 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_714386 - SURFACE
      ?auto_714387 - SURFACE
      ?auto_714388 - SURFACE
      ?auto_714389 - SURFACE
      ?auto_714390 - SURFACE
      ?auto_714391 - SURFACE
      ?auto_714392 - SURFACE
      ?auto_714393 - SURFACE
      ?auto_714394 - SURFACE
      ?auto_714395 - SURFACE
      ?auto_714396 - SURFACE
    )
    :vars
    (
      ?auto_714400 - HOIST
      ?auto_714397 - PLACE
      ?auto_714399 - PLACE
      ?auto_714398 - HOIST
      ?auto_714402 - SURFACE
      ?auto_714401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_714400 ?auto_714397 ) ( IS-CRATE ?auto_714396 ) ( not ( = ?auto_714395 ?auto_714396 ) ) ( not ( = ?auto_714394 ?auto_714395 ) ) ( not ( = ?auto_714394 ?auto_714396 ) ) ( not ( = ?auto_714399 ?auto_714397 ) ) ( HOIST-AT ?auto_714398 ?auto_714399 ) ( not ( = ?auto_714400 ?auto_714398 ) ) ( AVAILABLE ?auto_714398 ) ( SURFACE-AT ?auto_714396 ?auto_714399 ) ( ON ?auto_714396 ?auto_714402 ) ( CLEAR ?auto_714396 ) ( not ( = ?auto_714395 ?auto_714402 ) ) ( not ( = ?auto_714396 ?auto_714402 ) ) ( not ( = ?auto_714394 ?auto_714402 ) ) ( TRUCK-AT ?auto_714401 ?auto_714397 ) ( SURFACE-AT ?auto_714394 ?auto_714397 ) ( CLEAR ?auto_714394 ) ( LIFTING ?auto_714400 ?auto_714395 ) ( IS-CRATE ?auto_714395 ) ( ON ?auto_714387 ?auto_714386 ) ( ON ?auto_714388 ?auto_714387 ) ( ON ?auto_714389 ?auto_714388 ) ( ON ?auto_714390 ?auto_714389 ) ( ON ?auto_714391 ?auto_714390 ) ( ON ?auto_714392 ?auto_714391 ) ( ON ?auto_714393 ?auto_714392 ) ( ON ?auto_714394 ?auto_714393 ) ( not ( = ?auto_714386 ?auto_714387 ) ) ( not ( = ?auto_714386 ?auto_714388 ) ) ( not ( = ?auto_714386 ?auto_714389 ) ) ( not ( = ?auto_714386 ?auto_714390 ) ) ( not ( = ?auto_714386 ?auto_714391 ) ) ( not ( = ?auto_714386 ?auto_714392 ) ) ( not ( = ?auto_714386 ?auto_714393 ) ) ( not ( = ?auto_714386 ?auto_714394 ) ) ( not ( = ?auto_714386 ?auto_714395 ) ) ( not ( = ?auto_714386 ?auto_714396 ) ) ( not ( = ?auto_714386 ?auto_714402 ) ) ( not ( = ?auto_714387 ?auto_714388 ) ) ( not ( = ?auto_714387 ?auto_714389 ) ) ( not ( = ?auto_714387 ?auto_714390 ) ) ( not ( = ?auto_714387 ?auto_714391 ) ) ( not ( = ?auto_714387 ?auto_714392 ) ) ( not ( = ?auto_714387 ?auto_714393 ) ) ( not ( = ?auto_714387 ?auto_714394 ) ) ( not ( = ?auto_714387 ?auto_714395 ) ) ( not ( = ?auto_714387 ?auto_714396 ) ) ( not ( = ?auto_714387 ?auto_714402 ) ) ( not ( = ?auto_714388 ?auto_714389 ) ) ( not ( = ?auto_714388 ?auto_714390 ) ) ( not ( = ?auto_714388 ?auto_714391 ) ) ( not ( = ?auto_714388 ?auto_714392 ) ) ( not ( = ?auto_714388 ?auto_714393 ) ) ( not ( = ?auto_714388 ?auto_714394 ) ) ( not ( = ?auto_714388 ?auto_714395 ) ) ( not ( = ?auto_714388 ?auto_714396 ) ) ( not ( = ?auto_714388 ?auto_714402 ) ) ( not ( = ?auto_714389 ?auto_714390 ) ) ( not ( = ?auto_714389 ?auto_714391 ) ) ( not ( = ?auto_714389 ?auto_714392 ) ) ( not ( = ?auto_714389 ?auto_714393 ) ) ( not ( = ?auto_714389 ?auto_714394 ) ) ( not ( = ?auto_714389 ?auto_714395 ) ) ( not ( = ?auto_714389 ?auto_714396 ) ) ( not ( = ?auto_714389 ?auto_714402 ) ) ( not ( = ?auto_714390 ?auto_714391 ) ) ( not ( = ?auto_714390 ?auto_714392 ) ) ( not ( = ?auto_714390 ?auto_714393 ) ) ( not ( = ?auto_714390 ?auto_714394 ) ) ( not ( = ?auto_714390 ?auto_714395 ) ) ( not ( = ?auto_714390 ?auto_714396 ) ) ( not ( = ?auto_714390 ?auto_714402 ) ) ( not ( = ?auto_714391 ?auto_714392 ) ) ( not ( = ?auto_714391 ?auto_714393 ) ) ( not ( = ?auto_714391 ?auto_714394 ) ) ( not ( = ?auto_714391 ?auto_714395 ) ) ( not ( = ?auto_714391 ?auto_714396 ) ) ( not ( = ?auto_714391 ?auto_714402 ) ) ( not ( = ?auto_714392 ?auto_714393 ) ) ( not ( = ?auto_714392 ?auto_714394 ) ) ( not ( = ?auto_714392 ?auto_714395 ) ) ( not ( = ?auto_714392 ?auto_714396 ) ) ( not ( = ?auto_714392 ?auto_714402 ) ) ( not ( = ?auto_714393 ?auto_714394 ) ) ( not ( = ?auto_714393 ?auto_714395 ) ) ( not ( = ?auto_714393 ?auto_714396 ) ) ( not ( = ?auto_714393 ?auto_714402 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_714394 ?auto_714395 ?auto_714396 )
      ( MAKE-10CRATE-VERIFY ?auto_714386 ?auto_714387 ?auto_714388 ?auto_714389 ?auto_714390 ?auto_714391 ?auto_714392 ?auto_714393 ?auto_714394 ?auto_714395 ?auto_714396 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_714512 - SURFACE
      ?auto_714513 - SURFACE
      ?auto_714514 - SURFACE
      ?auto_714515 - SURFACE
      ?auto_714516 - SURFACE
      ?auto_714517 - SURFACE
      ?auto_714518 - SURFACE
      ?auto_714519 - SURFACE
      ?auto_714520 - SURFACE
      ?auto_714521 - SURFACE
      ?auto_714522 - SURFACE
    )
    :vars
    (
      ?auto_714528 - HOIST
      ?auto_714523 - PLACE
      ?auto_714525 - PLACE
      ?auto_714524 - HOIST
      ?auto_714526 - SURFACE
      ?auto_714527 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_714528 ?auto_714523 ) ( IS-CRATE ?auto_714522 ) ( not ( = ?auto_714521 ?auto_714522 ) ) ( not ( = ?auto_714520 ?auto_714521 ) ) ( not ( = ?auto_714520 ?auto_714522 ) ) ( not ( = ?auto_714525 ?auto_714523 ) ) ( HOIST-AT ?auto_714524 ?auto_714525 ) ( not ( = ?auto_714528 ?auto_714524 ) ) ( AVAILABLE ?auto_714524 ) ( SURFACE-AT ?auto_714522 ?auto_714525 ) ( ON ?auto_714522 ?auto_714526 ) ( CLEAR ?auto_714522 ) ( not ( = ?auto_714521 ?auto_714526 ) ) ( not ( = ?auto_714522 ?auto_714526 ) ) ( not ( = ?auto_714520 ?auto_714526 ) ) ( TRUCK-AT ?auto_714527 ?auto_714523 ) ( SURFACE-AT ?auto_714520 ?auto_714523 ) ( CLEAR ?auto_714520 ) ( IS-CRATE ?auto_714521 ) ( AVAILABLE ?auto_714528 ) ( IN ?auto_714521 ?auto_714527 ) ( ON ?auto_714513 ?auto_714512 ) ( ON ?auto_714514 ?auto_714513 ) ( ON ?auto_714515 ?auto_714514 ) ( ON ?auto_714516 ?auto_714515 ) ( ON ?auto_714517 ?auto_714516 ) ( ON ?auto_714518 ?auto_714517 ) ( ON ?auto_714519 ?auto_714518 ) ( ON ?auto_714520 ?auto_714519 ) ( not ( = ?auto_714512 ?auto_714513 ) ) ( not ( = ?auto_714512 ?auto_714514 ) ) ( not ( = ?auto_714512 ?auto_714515 ) ) ( not ( = ?auto_714512 ?auto_714516 ) ) ( not ( = ?auto_714512 ?auto_714517 ) ) ( not ( = ?auto_714512 ?auto_714518 ) ) ( not ( = ?auto_714512 ?auto_714519 ) ) ( not ( = ?auto_714512 ?auto_714520 ) ) ( not ( = ?auto_714512 ?auto_714521 ) ) ( not ( = ?auto_714512 ?auto_714522 ) ) ( not ( = ?auto_714512 ?auto_714526 ) ) ( not ( = ?auto_714513 ?auto_714514 ) ) ( not ( = ?auto_714513 ?auto_714515 ) ) ( not ( = ?auto_714513 ?auto_714516 ) ) ( not ( = ?auto_714513 ?auto_714517 ) ) ( not ( = ?auto_714513 ?auto_714518 ) ) ( not ( = ?auto_714513 ?auto_714519 ) ) ( not ( = ?auto_714513 ?auto_714520 ) ) ( not ( = ?auto_714513 ?auto_714521 ) ) ( not ( = ?auto_714513 ?auto_714522 ) ) ( not ( = ?auto_714513 ?auto_714526 ) ) ( not ( = ?auto_714514 ?auto_714515 ) ) ( not ( = ?auto_714514 ?auto_714516 ) ) ( not ( = ?auto_714514 ?auto_714517 ) ) ( not ( = ?auto_714514 ?auto_714518 ) ) ( not ( = ?auto_714514 ?auto_714519 ) ) ( not ( = ?auto_714514 ?auto_714520 ) ) ( not ( = ?auto_714514 ?auto_714521 ) ) ( not ( = ?auto_714514 ?auto_714522 ) ) ( not ( = ?auto_714514 ?auto_714526 ) ) ( not ( = ?auto_714515 ?auto_714516 ) ) ( not ( = ?auto_714515 ?auto_714517 ) ) ( not ( = ?auto_714515 ?auto_714518 ) ) ( not ( = ?auto_714515 ?auto_714519 ) ) ( not ( = ?auto_714515 ?auto_714520 ) ) ( not ( = ?auto_714515 ?auto_714521 ) ) ( not ( = ?auto_714515 ?auto_714522 ) ) ( not ( = ?auto_714515 ?auto_714526 ) ) ( not ( = ?auto_714516 ?auto_714517 ) ) ( not ( = ?auto_714516 ?auto_714518 ) ) ( not ( = ?auto_714516 ?auto_714519 ) ) ( not ( = ?auto_714516 ?auto_714520 ) ) ( not ( = ?auto_714516 ?auto_714521 ) ) ( not ( = ?auto_714516 ?auto_714522 ) ) ( not ( = ?auto_714516 ?auto_714526 ) ) ( not ( = ?auto_714517 ?auto_714518 ) ) ( not ( = ?auto_714517 ?auto_714519 ) ) ( not ( = ?auto_714517 ?auto_714520 ) ) ( not ( = ?auto_714517 ?auto_714521 ) ) ( not ( = ?auto_714517 ?auto_714522 ) ) ( not ( = ?auto_714517 ?auto_714526 ) ) ( not ( = ?auto_714518 ?auto_714519 ) ) ( not ( = ?auto_714518 ?auto_714520 ) ) ( not ( = ?auto_714518 ?auto_714521 ) ) ( not ( = ?auto_714518 ?auto_714522 ) ) ( not ( = ?auto_714518 ?auto_714526 ) ) ( not ( = ?auto_714519 ?auto_714520 ) ) ( not ( = ?auto_714519 ?auto_714521 ) ) ( not ( = ?auto_714519 ?auto_714522 ) ) ( not ( = ?auto_714519 ?auto_714526 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_714520 ?auto_714521 ?auto_714522 )
      ( MAKE-10CRATE-VERIFY ?auto_714512 ?auto_714513 ?auto_714514 ?auto_714515 ?auto_714516 ?auto_714517 ?auto_714518 ?auto_714519 ?auto_714520 ?auto_714521 ?auto_714522 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_721796 - SURFACE
      ?auto_721797 - SURFACE
      ?auto_721798 - SURFACE
      ?auto_721799 - SURFACE
      ?auto_721800 - SURFACE
      ?auto_721801 - SURFACE
      ?auto_721802 - SURFACE
      ?auto_721803 - SURFACE
      ?auto_721804 - SURFACE
      ?auto_721805 - SURFACE
      ?auto_721806 - SURFACE
      ?auto_721807 - SURFACE
    )
    :vars
    (
      ?auto_721808 - HOIST
      ?auto_721809 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_721808 ?auto_721809 ) ( SURFACE-AT ?auto_721806 ?auto_721809 ) ( CLEAR ?auto_721806 ) ( LIFTING ?auto_721808 ?auto_721807 ) ( IS-CRATE ?auto_721807 ) ( not ( = ?auto_721806 ?auto_721807 ) ) ( ON ?auto_721797 ?auto_721796 ) ( ON ?auto_721798 ?auto_721797 ) ( ON ?auto_721799 ?auto_721798 ) ( ON ?auto_721800 ?auto_721799 ) ( ON ?auto_721801 ?auto_721800 ) ( ON ?auto_721802 ?auto_721801 ) ( ON ?auto_721803 ?auto_721802 ) ( ON ?auto_721804 ?auto_721803 ) ( ON ?auto_721805 ?auto_721804 ) ( ON ?auto_721806 ?auto_721805 ) ( not ( = ?auto_721796 ?auto_721797 ) ) ( not ( = ?auto_721796 ?auto_721798 ) ) ( not ( = ?auto_721796 ?auto_721799 ) ) ( not ( = ?auto_721796 ?auto_721800 ) ) ( not ( = ?auto_721796 ?auto_721801 ) ) ( not ( = ?auto_721796 ?auto_721802 ) ) ( not ( = ?auto_721796 ?auto_721803 ) ) ( not ( = ?auto_721796 ?auto_721804 ) ) ( not ( = ?auto_721796 ?auto_721805 ) ) ( not ( = ?auto_721796 ?auto_721806 ) ) ( not ( = ?auto_721796 ?auto_721807 ) ) ( not ( = ?auto_721797 ?auto_721798 ) ) ( not ( = ?auto_721797 ?auto_721799 ) ) ( not ( = ?auto_721797 ?auto_721800 ) ) ( not ( = ?auto_721797 ?auto_721801 ) ) ( not ( = ?auto_721797 ?auto_721802 ) ) ( not ( = ?auto_721797 ?auto_721803 ) ) ( not ( = ?auto_721797 ?auto_721804 ) ) ( not ( = ?auto_721797 ?auto_721805 ) ) ( not ( = ?auto_721797 ?auto_721806 ) ) ( not ( = ?auto_721797 ?auto_721807 ) ) ( not ( = ?auto_721798 ?auto_721799 ) ) ( not ( = ?auto_721798 ?auto_721800 ) ) ( not ( = ?auto_721798 ?auto_721801 ) ) ( not ( = ?auto_721798 ?auto_721802 ) ) ( not ( = ?auto_721798 ?auto_721803 ) ) ( not ( = ?auto_721798 ?auto_721804 ) ) ( not ( = ?auto_721798 ?auto_721805 ) ) ( not ( = ?auto_721798 ?auto_721806 ) ) ( not ( = ?auto_721798 ?auto_721807 ) ) ( not ( = ?auto_721799 ?auto_721800 ) ) ( not ( = ?auto_721799 ?auto_721801 ) ) ( not ( = ?auto_721799 ?auto_721802 ) ) ( not ( = ?auto_721799 ?auto_721803 ) ) ( not ( = ?auto_721799 ?auto_721804 ) ) ( not ( = ?auto_721799 ?auto_721805 ) ) ( not ( = ?auto_721799 ?auto_721806 ) ) ( not ( = ?auto_721799 ?auto_721807 ) ) ( not ( = ?auto_721800 ?auto_721801 ) ) ( not ( = ?auto_721800 ?auto_721802 ) ) ( not ( = ?auto_721800 ?auto_721803 ) ) ( not ( = ?auto_721800 ?auto_721804 ) ) ( not ( = ?auto_721800 ?auto_721805 ) ) ( not ( = ?auto_721800 ?auto_721806 ) ) ( not ( = ?auto_721800 ?auto_721807 ) ) ( not ( = ?auto_721801 ?auto_721802 ) ) ( not ( = ?auto_721801 ?auto_721803 ) ) ( not ( = ?auto_721801 ?auto_721804 ) ) ( not ( = ?auto_721801 ?auto_721805 ) ) ( not ( = ?auto_721801 ?auto_721806 ) ) ( not ( = ?auto_721801 ?auto_721807 ) ) ( not ( = ?auto_721802 ?auto_721803 ) ) ( not ( = ?auto_721802 ?auto_721804 ) ) ( not ( = ?auto_721802 ?auto_721805 ) ) ( not ( = ?auto_721802 ?auto_721806 ) ) ( not ( = ?auto_721802 ?auto_721807 ) ) ( not ( = ?auto_721803 ?auto_721804 ) ) ( not ( = ?auto_721803 ?auto_721805 ) ) ( not ( = ?auto_721803 ?auto_721806 ) ) ( not ( = ?auto_721803 ?auto_721807 ) ) ( not ( = ?auto_721804 ?auto_721805 ) ) ( not ( = ?auto_721804 ?auto_721806 ) ) ( not ( = ?auto_721804 ?auto_721807 ) ) ( not ( = ?auto_721805 ?auto_721806 ) ) ( not ( = ?auto_721805 ?auto_721807 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_721806 ?auto_721807 )
      ( MAKE-11CRATE-VERIFY ?auto_721796 ?auto_721797 ?auto_721798 ?auto_721799 ?auto_721800 ?auto_721801 ?auto_721802 ?auto_721803 ?auto_721804 ?auto_721805 ?auto_721806 ?auto_721807 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_721905 - SURFACE
      ?auto_721906 - SURFACE
      ?auto_721907 - SURFACE
      ?auto_721908 - SURFACE
      ?auto_721909 - SURFACE
      ?auto_721910 - SURFACE
      ?auto_721911 - SURFACE
      ?auto_721912 - SURFACE
      ?auto_721913 - SURFACE
      ?auto_721914 - SURFACE
      ?auto_721915 - SURFACE
      ?auto_721916 - SURFACE
    )
    :vars
    (
      ?auto_721917 - HOIST
      ?auto_721918 - PLACE
      ?auto_721919 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_721917 ?auto_721918 ) ( SURFACE-AT ?auto_721915 ?auto_721918 ) ( CLEAR ?auto_721915 ) ( IS-CRATE ?auto_721916 ) ( not ( = ?auto_721915 ?auto_721916 ) ) ( TRUCK-AT ?auto_721919 ?auto_721918 ) ( AVAILABLE ?auto_721917 ) ( IN ?auto_721916 ?auto_721919 ) ( ON ?auto_721915 ?auto_721914 ) ( not ( = ?auto_721914 ?auto_721915 ) ) ( not ( = ?auto_721914 ?auto_721916 ) ) ( ON ?auto_721906 ?auto_721905 ) ( ON ?auto_721907 ?auto_721906 ) ( ON ?auto_721908 ?auto_721907 ) ( ON ?auto_721909 ?auto_721908 ) ( ON ?auto_721910 ?auto_721909 ) ( ON ?auto_721911 ?auto_721910 ) ( ON ?auto_721912 ?auto_721911 ) ( ON ?auto_721913 ?auto_721912 ) ( ON ?auto_721914 ?auto_721913 ) ( not ( = ?auto_721905 ?auto_721906 ) ) ( not ( = ?auto_721905 ?auto_721907 ) ) ( not ( = ?auto_721905 ?auto_721908 ) ) ( not ( = ?auto_721905 ?auto_721909 ) ) ( not ( = ?auto_721905 ?auto_721910 ) ) ( not ( = ?auto_721905 ?auto_721911 ) ) ( not ( = ?auto_721905 ?auto_721912 ) ) ( not ( = ?auto_721905 ?auto_721913 ) ) ( not ( = ?auto_721905 ?auto_721914 ) ) ( not ( = ?auto_721905 ?auto_721915 ) ) ( not ( = ?auto_721905 ?auto_721916 ) ) ( not ( = ?auto_721906 ?auto_721907 ) ) ( not ( = ?auto_721906 ?auto_721908 ) ) ( not ( = ?auto_721906 ?auto_721909 ) ) ( not ( = ?auto_721906 ?auto_721910 ) ) ( not ( = ?auto_721906 ?auto_721911 ) ) ( not ( = ?auto_721906 ?auto_721912 ) ) ( not ( = ?auto_721906 ?auto_721913 ) ) ( not ( = ?auto_721906 ?auto_721914 ) ) ( not ( = ?auto_721906 ?auto_721915 ) ) ( not ( = ?auto_721906 ?auto_721916 ) ) ( not ( = ?auto_721907 ?auto_721908 ) ) ( not ( = ?auto_721907 ?auto_721909 ) ) ( not ( = ?auto_721907 ?auto_721910 ) ) ( not ( = ?auto_721907 ?auto_721911 ) ) ( not ( = ?auto_721907 ?auto_721912 ) ) ( not ( = ?auto_721907 ?auto_721913 ) ) ( not ( = ?auto_721907 ?auto_721914 ) ) ( not ( = ?auto_721907 ?auto_721915 ) ) ( not ( = ?auto_721907 ?auto_721916 ) ) ( not ( = ?auto_721908 ?auto_721909 ) ) ( not ( = ?auto_721908 ?auto_721910 ) ) ( not ( = ?auto_721908 ?auto_721911 ) ) ( not ( = ?auto_721908 ?auto_721912 ) ) ( not ( = ?auto_721908 ?auto_721913 ) ) ( not ( = ?auto_721908 ?auto_721914 ) ) ( not ( = ?auto_721908 ?auto_721915 ) ) ( not ( = ?auto_721908 ?auto_721916 ) ) ( not ( = ?auto_721909 ?auto_721910 ) ) ( not ( = ?auto_721909 ?auto_721911 ) ) ( not ( = ?auto_721909 ?auto_721912 ) ) ( not ( = ?auto_721909 ?auto_721913 ) ) ( not ( = ?auto_721909 ?auto_721914 ) ) ( not ( = ?auto_721909 ?auto_721915 ) ) ( not ( = ?auto_721909 ?auto_721916 ) ) ( not ( = ?auto_721910 ?auto_721911 ) ) ( not ( = ?auto_721910 ?auto_721912 ) ) ( not ( = ?auto_721910 ?auto_721913 ) ) ( not ( = ?auto_721910 ?auto_721914 ) ) ( not ( = ?auto_721910 ?auto_721915 ) ) ( not ( = ?auto_721910 ?auto_721916 ) ) ( not ( = ?auto_721911 ?auto_721912 ) ) ( not ( = ?auto_721911 ?auto_721913 ) ) ( not ( = ?auto_721911 ?auto_721914 ) ) ( not ( = ?auto_721911 ?auto_721915 ) ) ( not ( = ?auto_721911 ?auto_721916 ) ) ( not ( = ?auto_721912 ?auto_721913 ) ) ( not ( = ?auto_721912 ?auto_721914 ) ) ( not ( = ?auto_721912 ?auto_721915 ) ) ( not ( = ?auto_721912 ?auto_721916 ) ) ( not ( = ?auto_721913 ?auto_721914 ) ) ( not ( = ?auto_721913 ?auto_721915 ) ) ( not ( = ?auto_721913 ?auto_721916 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_721914 ?auto_721915 ?auto_721916 )
      ( MAKE-11CRATE-VERIFY ?auto_721905 ?auto_721906 ?auto_721907 ?auto_721908 ?auto_721909 ?auto_721910 ?auto_721911 ?auto_721912 ?auto_721913 ?auto_721914 ?auto_721915 ?auto_721916 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_722026 - SURFACE
      ?auto_722027 - SURFACE
      ?auto_722028 - SURFACE
      ?auto_722029 - SURFACE
      ?auto_722030 - SURFACE
      ?auto_722031 - SURFACE
      ?auto_722032 - SURFACE
      ?auto_722033 - SURFACE
      ?auto_722034 - SURFACE
      ?auto_722035 - SURFACE
      ?auto_722036 - SURFACE
      ?auto_722037 - SURFACE
    )
    :vars
    (
      ?auto_722041 - HOIST
      ?auto_722040 - PLACE
      ?auto_722038 - TRUCK
      ?auto_722039 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_722041 ?auto_722040 ) ( SURFACE-AT ?auto_722036 ?auto_722040 ) ( CLEAR ?auto_722036 ) ( IS-CRATE ?auto_722037 ) ( not ( = ?auto_722036 ?auto_722037 ) ) ( AVAILABLE ?auto_722041 ) ( IN ?auto_722037 ?auto_722038 ) ( ON ?auto_722036 ?auto_722035 ) ( not ( = ?auto_722035 ?auto_722036 ) ) ( not ( = ?auto_722035 ?auto_722037 ) ) ( TRUCK-AT ?auto_722038 ?auto_722039 ) ( not ( = ?auto_722039 ?auto_722040 ) ) ( ON ?auto_722027 ?auto_722026 ) ( ON ?auto_722028 ?auto_722027 ) ( ON ?auto_722029 ?auto_722028 ) ( ON ?auto_722030 ?auto_722029 ) ( ON ?auto_722031 ?auto_722030 ) ( ON ?auto_722032 ?auto_722031 ) ( ON ?auto_722033 ?auto_722032 ) ( ON ?auto_722034 ?auto_722033 ) ( ON ?auto_722035 ?auto_722034 ) ( not ( = ?auto_722026 ?auto_722027 ) ) ( not ( = ?auto_722026 ?auto_722028 ) ) ( not ( = ?auto_722026 ?auto_722029 ) ) ( not ( = ?auto_722026 ?auto_722030 ) ) ( not ( = ?auto_722026 ?auto_722031 ) ) ( not ( = ?auto_722026 ?auto_722032 ) ) ( not ( = ?auto_722026 ?auto_722033 ) ) ( not ( = ?auto_722026 ?auto_722034 ) ) ( not ( = ?auto_722026 ?auto_722035 ) ) ( not ( = ?auto_722026 ?auto_722036 ) ) ( not ( = ?auto_722026 ?auto_722037 ) ) ( not ( = ?auto_722027 ?auto_722028 ) ) ( not ( = ?auto_722027 ?auto_722029 ) ) ( not ( = ?auto_722027 ?auto_722030 ) ) ( not ( = ?auto_722027 ?auto_722031 ) ) ( not ( = ?auto_722027 ?auto_722032 ) ) ( not ( = ?auto_722027 ?auto_722033 ) ) ( not ( = ?auto_722027 ?auto_722034 ) ) ( not ( = ?auto_722027 ?auto_722035 ) ) ( not ( = ?auto_722027 ?auto_722036 ) ) ( not ( = ?auto_722027 ?auto_722037 ) ) ( not ( = ?auto_722028 ?auto_722029 ) ) ( not ( = ?auto_722028 ?auto_722030 ) ) ( not ( = ?auto_722028 ?auto_722031 ) ) ( not ( = ?auto_722028 ?auto_722032 ) ) ( not ( = ?auto_722028 ?auto_722033 ) ) ( not ( = ?auto_722028 ?auto_722034 ) ) ( not ( = ?auto_722028 ?auto_722035 ) ) ( not ( = ?auto_722028 ?auto_722036 ) ) ( not ( = ?auto_722028 ?auto_722037 ) ) ( not ( = ?auto_722029 ?auto_722030 ) ) ( not ( = ?auto_722029 ?auto_722031 ) ) ( not ( = ?auto_722029 ?auto_722032 ) ) ( not ( = ?auto_722029 ?auto_722033 ) ) ( not ( = ?auto_722029 ?auto_722034 ) ) ( not ( = ?auto_722029 ?auto_722035 ) ) ( not ( = ?auto_722029 ?auto_722036 ) ) ( not ( = ?auto_722029 ?auto_722037 ) ) ( not ( = ?auto_722030 ?auto_722031 ) ) ( not ( = ?auto_722030 ?auto_722032 ) ) ( not ( = ?auto_722030 ?auto_722033 ) ) ( not ( = ?auto_722030 ?auto_722034 ) ) ( not ( = ?auto_722030 ?auto_722035 ) ) ( not ( = ?auto_722030 ?auto_722036 ) ) ( not ( = ?auto_722030 ?auto_722037 ) ) ( not ( = ?auto_722031 ?auto_722032 ) ) ( not ( = ?auto_722031 ?auto_722033 ) ) ( not ( = ?auto_722031 ?auto_722034 ) ) ( not ( = ?auto_722031 ?auto_722035 ) ) ( not ( = ?auto_722031 ?auto_722036 ) ) ( not ( = ?auto_722031 ?auto_722037 ) ) ( not ( = ?auto_722032 ?auto_722033 ) ) ( not ( = ?auto_722032 ?auto_722034 ) ) ( not ( = ?auto_722032 ?auto_722035 ) ) ( not ( = ?auto_722032 ?auto_722036 ) ) ( not ( = ?auto_722032 ?auto_722037 ) ) ( not ( = ?auto_722033 ?auto_722034 ) ) ( not ( = ?auto_722033 ?auto_722035 ) ) ( not ( = ?auto_722033 ?auto_722036 ) ) ( not ( = ?auto_722033 ?auto_722037 ) ) ( not ( = ?auto_722034 ?auto_722035 ) ) ( not ( = ?auto_722034 ?auto_722036 ) ) ( not ( = ?auto_722034 ?auto_722037 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_722035 ?auto_722036 ?auto_722037 )
      ( MAKE-11CRATE-VERIFY ?auto_722026 ?auto_722027 ?auto_722028 ?auto_722029 ?auto_722030 ?auto_722031 ?auto_722032 ?auto_722033 ?auto_722034 ?auto_722035 ?auto_722036 ?auto_722037 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_722158 - SURFACE
      ?auto_722159 - SURFACE
      ?auto_722160 - SURFACE
      ?auto_722161 - SURFACE
      ?auto_722162 - SURFACE
      ?auto_722163 - SURFACE
      ?auto_722164 - SURFACE
      ?auto_722165 - SURFACE
      ?auto_722166 - SURFACE
      ?auto_722167 - SURFACE
      ?auto_722168 - SURFACE
      ?auto_722169 - SURFACE
    )
    :vars
    (
      ?auto_722173 - HOIST
      ?auto_722171 - PLACE
      ?auto_722174 - TRUCK
      ?auto_722170 - PLACE
      ?auto_722172 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_722173 ?auto_722171 ) ( SURFACE-AT ?auto_722168 ?auto_722171 ) ( CLEAR ?auto_722168 ) ( IS-CRATE ?auto_722169 ) ( not ( = ?auto_722168 ?auto_722169 ) ) ( AVAILABLE ?auto_722173 ) ( ON ?auto_722168 ?auto_722167 ) ( not ( = ?auto_722167 ?auto_722168 ) ) ( not ( = ?auto_722167 ?auto_722169 ) ) ( TRUCK-AT ?auto_722174 ?auto_722170 ) ( not ( = ?auto_722170 ?auto_722171 ) ) ( HOIST-AT ?auto_722172 ?auto_722170 ) ( LIFTING ?auto_722172 ?auto_722169 ) ( not ( = ?auto_722173 ?auto_722172 ) ) ( ON ?auto_722159 ?auto_722158 ) ( ON ?auto_722160 ?auto_722159 ) ( ON ?auto_722161 ?auto_722160 ) ( ON ?auto_722162 ?auto_722161 ) ( ON ?auto_722163 ?auto_722162 ) ( ON ?auto_722164 ?auto_722163 ) ( ON ?auto_722165 ?auto_722164 ) ( ON ?auto_722166 ?auto_722165 ) ( ON ?auto_722167 ?auto_722166 ) ( not ( = ?auto_722158 ?auto_722159 ) ) ( not ( = ?auto_722158 ?auto_722160 ) ) ( not ( = ?auto_722158 ?auto_722161 ) ) ( not ( = ?auto_722158 ?auto_722162 ) ) ( not ( = ?auto_722158 ?auto_722163 ) ) ( not ( = ?auto_722158 ?auto_722164 ) ) ( not ( = ?auto_722158 ?auto_722165 ) ) ( not ( = ?auto_722158 ?auto_722166 ) ) ( not ( = ?auto_722158 ?auto_722167 ) ) ( not ( = ?auto_722158 ?auto_722168 ) ) ( not ( = ?auto_722158 ?auto_722169 ) ) ( not ( = ?auto_722159 ?auto_722160 ) ) ( not ( = ?auto_722159 ?auto_722161 ) ) ( not ( = ?auto_722159 ?auto_722162 ) ) ( not ( = ?auto_722159 ?auto_722163 ) ) ( not ( = ?auto_722159 ?auto_722164 ) ) ( not ( = ?auto_722159 ?auto_722165 ) ) ( not ( = ?auto_722159 ?auto_722166 ) ) ( not ( = ?auto_722159 ?auto_722167 ) ) ( not ( = ?auto_722159 ?auto_722168 ) ) ( not ( = ?auto_722159 ?auto_722169 ) ) ( not ( = ?auto_722160 ?auto_722161 ) ) ( not ( = ?auto_722160 ?auto_722162 ) ) ( not ( = ?auto_722160 ?auto_722163 ) ) ( not ( = ?auto_722160 ?auto_722164 ) ) ( not ( = ?auto_722160 ?auto_722165 ) ) ( not ( = ?auto_722160 ?auto_722166 ) ) ( not ( = ?auto_722160 ?auto_722167 ) ) ( not ( = ?auto_722160 ?auto_722168 ) ) ( not ( = ?auto_722160 ?auto_722169 ) ) ( not ( = ?auto_722161 ?auto_722162 ) ) ( not ( = ?auto_722161 ?auto_722163 ) ) ( not ( = ?auto_722161 ?auto_722164 ) ) ( not ( = ?auto_722161 ?auto_722165 ) ) ( not ( = ?auto_722161 ?auto_722166 ) ) ( not ( = ?auto_722161 ?auto_722167 ) ) ( not ( = ?auto_722161 ?auto_722168 ) ) ( not ( = ?auto_722161 ?auto_722169 ) ) ( not ( = ?auto_722162 ?auto_722163 ) ) ( not ( = ?auto_722162 ?auto_722164 ) ) ( not ( = ?auto_722162 ?auto_722165 ) ) ( not ( = ?auto_722162 ?auto_722166 ) ) ( not ( = ?auto_722162 ?auto_722167 ) ) ( not ( = ?auto_722162 ?auto_722168 ) ) ( not ( = ?auto_722162 ?auto_722169 ) ) ( not ( = ?auto_722163 ?auto_722164 ) ) ( not ( = ?auto_722163 ?auto_722165 ) ) ( not ( = ?auto_722163 ?auto_722166 ) ) ( not ( = ?auto_722163 ?auto_722167 ) ) ( not ( = ?auto_722163 ?auto_722168 ) ) ( not ( = ?auto_722163 ?auto_722169 ) ) ( not ( = ?auto_722164 ?auto_722165 ) ) ( not ( = ?auto_722164 ?auto_722166 ) ) ( not ( = ?auto_722164 ?auto_722167 ) ) ( not ( = ?auto_722164 ?auto_722168 ) ) ( not ( = ?auto_722164 ?auto_722169 ) ) ( not ( = ?auto_722165 ?auto_722166 ) ) ( not ( = ?auto_722165 ?auto_722167 ) ) ( not ( = ?auto_722165 ?auto_722168 ) ) ( not ( = ?auto_722165 ?auto_722169 ) ) ( not ( = ?auto_722166 ?auto_722167 ) ) ( not ( = ?auto_722166 ?auto_722168 ) ) ( not ( = ?auto_722166 ?auto_722169 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_722167 ?auto_722168 ?auto_722169 )
      ( MAKE-11CRATE-VERIFY ?auto_722158 ?auto_722159 ?auto_722160 ?auto_722161 ?auto_722162 ?auto_722163 ?auto_722164 ?auto_722165 ?auto_722166 ?auto_722167 ?auto_722168 ?auto_722169 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_722301 - SURFACE
      ?auto_722302 - SURFACE
      ?auto_722303 - SURFACE
      ?auto_722304 - SURFACE
      ?auto_722305 - SURFACE
      ?auto_722306 - SURFACE
      ?auto_722307 - SURFACE
      ?auto_722308 - SURFACE
      ?auto_722309 - SURFACE
      ?auto_722310 - SURFACE
      ?auto_722311 - SURFACE
      ?auto_722312 - SURFACE
    )
    :vars
    (
      ?auto_722317 - HOIST
      ?auto_722316 - PLACE
      ?auto_722318 - TRUCK
      ?auto_722315 - PLACE
      ?auto_722314 - HOIST
      ?auto_722313 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_722317 ?auto_722316 ) ( SURFACE-AT ?auto_722311 ?auto_722316 ) ( CLEAR ?auto_722311 ) ( IS-CRATE ?auto_722312 ) ( not ( = ?auto_722311 ?auto_722312 ) ) ( AVAILABLE ?auto_722317 ) ( ON ?auto_722311 ?auto_722310 ) ( not ( = ?auto_722310 ?auto_722311 ) ) ( not ( = ?auto_722310 ?auto_722312 ) ) ( TRUCK-AT ?auto_722318 ?auto_722315 ) ( not ( = ?auto_722315 ?auto_722316 ) ) ( HOIST-AT ?auto_722314 ?auto_722315 ) ( not ( = ?auto_722317 ?auto_722314 ) ) ( AVAILABLE ?auto_722314 ) ( SURFACE-AT ?auto_722312 ?auto_722315 ) ( ON ?auto_722312 ?auto_722313 ) ( CLEAR ?auto_722312 ) ( not ( = ?auto_722311 ?auto_722313 ) ) ( not ( = ?auto_722312 ?auto_722313 ) ) ( not ( = ?auto_722310 ?auto_722313 ) ) ( ON ?auto_722302 ?auto_722301 ) ( ON ?auto_722303 ?auto_722302 ) ( ON ?auto_722304 ?auto_722303 ) ( ON ?auto_722305 ?auto_722304 ) ( ON ?auto_722306 ?auto_722305 ) ( ON ?auto_722307 ?auto_722306 ) ( ON ?auto_722308 ?auto_722307 ) ( ON ?auto_722309 ?auto_722308 ) ( ON ?auto_722310 ?auto_722309 ) ( not ( = ?auto_722301 ?auto_722302 ) ) ( not ( = ?auto_722301 ?auto_722303 ) ) ( not ( = ?auto_722301 ?auto_722304 ) ) ( not ( = ?auto_722301 ?auto_722305 ) ) ( not ( = ?auto_722301 ?auto_722306 ) ) ( not ( = ?auto_722301 ?auto_722307 ) ) ( not ( = ?auto_722301 ?auto_722308 ) ) ( not ( = ?auto_722301 ?auto_722309 ) ) ( not ( = ?auto_722301 ?auto_722310 ) ) ( not ( = ?auto_722301 ?auto_722311 ) ) ( not ( = ?auto_722301 ?auto_722312 ) ) ( not ( = ?auto_722301 ?auto_722313 ) ) ( not ( = ?auto_722302 ?auto_722303 ) ) ( not ( = ?auto_722302 ?auto_722304 ) ) ( not ( = ?auto_722302 ?auto_722305 ) ) ( not ( = ?auto_722302 ?auto_722306 ) ) ( not ( = ?auto_722302 ?auto_722307 ) ) ( not ( = ?auto_722302 ?auto_722308 ) ) ( not ( = ?auto_722302 ?auto_722309 ) ) ( not ( = ?auto_722302 ?auto_722310 ) ) ( not ( = ?auto_722302 ?auto_722311 ) ) ( not ( = ?auto_722302 ?auto_722312 ) ) ( not ( = ?auto_722302 ?auto_722313 ) ) ( not ( = ?auto_722303 ?auto_722304 ) ) ( not ( = ?auto_722303 ?auto_722305 ) ) ( not ( = ?auto_722303 ?auto_722306 ) ) ( not ( = ?auto_722303 ?auto_722307 ) ) ( not ( = ?auto_722303 ?auto_722308 ) ) ( not ( = ?auto_722303 ?auto_722309 ) ) ( not ( = ?auto_722303 ?auto_722310 ) ) ( not ( = ?auto_722303 ?auto_722311 ) ) ( not ( = ?auto_722303 ?auto_722312 ) ) ( not ( = ?auto_722303 ?auto_722313 ) ) ( not ( = ?auto_722304 ?auto_722305 ) ) ( not ( = ?auto_722304 ?auto_722306 ) ) ( not ( = ?auto_722304 ?auto_722307 ) ) ( not ( = ?auto_722304 ?auto_722308 ) ) ( not ( = ?auto_722304 ?auto_722309 ) ) ( not ( = ?auto_722304 ?auto_722310 ) ) ( not ( = ?auto_722304 ?auto_722311 ) ) ( not ( = ?auto_722304 ?auto_722312 ) ) ( not ( = ?auto_722304 ?auto_722313 ) ) ( not ( = ?auto_722305 ?auto_722306 ) ) ( not ( = ?auto_722305 ?auto_722307 ) ) ( not ( = ?auto_722305 ?auto_722308 ) ) ( not ( = ?auto_722305 ?auto_722309 ) ) ( not ( = ?auto_722305 ?auto_722310 ) ) ( not ( = ?auto_722305 ?auto_722311 ) ) ( not ( = ?auto_722305 ?auto_722312 ) ) ( not ( = ?auto_722305 ?auto_722313 ) ) ( not ( = ?auto_722306 ?auto_722307 ) ) ( not ( = ?auto_722306 ?auto_722308 ) ) ( not ( = ?auto_722306 ?auto_722309 ) ) ( not ( = ?auto_722306 ?auto_722310 ) ) ( not ( = ?auto_722306 ?auto_722311 ) ) ( not ( = ?auto_722306 ?auto_722312 ) ) ( not ( = ?auto_722306 ?auto_722313 ) ) ( not ( = ?auto_722307 ?auto_722308 ) ) ( not ( = ?auto_722307 ?auto_722309 ) ) ( not ( = ?auto_722307 ?auto_722310 ) ) ( not ( = ?auto_722307 ?auto_722311 ) ) ( not ( = ?auto_722307 ?auto_722312 ) ) ( not ( = ?auto_722307 ?auto_722313 ) ) ( not ( = ?auto_722308 ?auto_722309 ) ) ( not ( = ?auto_722308 ?auto_722310 ) ) ( not ( = ?auto_722308 ?auto_722311 ) ) ( not ( = ?auto_722308 ?auto_722312 ) ) ( not ( = ?auto_722308 ?auto_722313 ) ) ( not ( = ?auto_722309 ?auto_722310 ) ) ( not ( = ?auto_722309 ?auto_722311 ) ) ( not ( = ?auto_722309 ?auto_722312 ) ) ( not ( = ?auto_722309 ?auto_722313 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_722310 ?auto_722311 ?auto_722312 )
      ( MAKE-11CRATE-VERIFY ?auto_722301 ?auto_722302 ?auto_722303 ?auto_722304 ?auto_722305 ?auto_722306 ?auto_722307 ?auto_722308 ?auto_722309 ?auto_722310 ?auto_722311 ?auto_722312 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_722445 - SURFACE
      ?auto_722446 - SURFACE
      ?auto_722447 - SURFACE
      ?auto_722448 - SURFACE
      ?auto_722449 - SURFACE
      ?auto_722450 - SURFACE
      ?auto_722451 - SURFACE
      ?auto_722452 - SURFACE
      ?auto_722453 - SURFACE
      ?auto_722454 - SURFACE
      ?auto_722455 - SURFACE
      ?auto_722456 - SURFACE
    )
    :vars
    (
      ?auto_722459 - HOIST
      ?auto_722457 - PLACE
      ?auto_722462 - PLACE
      ?auto_722461 - HOIST
      ?auto_722458 - SURFACE
      ?auto_722460 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_722459 ?auto_722457 ) ( SURFACE-AT ?auto_722455 ?auto_722457 ) ( CLEAR ?auto_722455 ) ( IS-CRATE ?auto_722456 ) ( not ( = ?auto_722455 ?auto_722456 ) ) ( AVAILABLE ?auto_722459 ) ( ON ?auto_722455 ?auto_722454 ) ( not ( = ?auto_722454 ?auto_722455 ) ) ( not ( = ?auto_722454 ?auto_722456 ) ) ( not ( = ?auto_722462 ?auto_722457 ) ) ( HOIST-AT ?auto_722461 ?auto_722462 ) ( not ( = ?auto_722459 ?auto_722461 ) ) ( AVAILABLE ?auto_722461 ) ( SURFACE-AT ?auto_722456 ?auto_722462 ) ( ON ?auto_722456 ?auto_722458 ) ( CLEAR ?auto_722456 ) ( not ( = ?auto_722455 ?auto_722458 ) ) ( not ( = ?auto_722456 ?auto_722458 ) ) ( not ( = ?auto_722454 ?auto_722458 ) ) ( TRUCK-AT ?auto_722460 ?auto_722457 ) ( ON ?auto_722446 ?auto_722445 ) ( ON ?auto_722447 ?auto_722446 ) ( ON ?auto_722448 ?auto_722447 ) ( ON ?auto_722449 ?auto_722448 ) ( ON ?auto_722450 ?auto_722449 ) ( ON ?auto_722451 ?auto_722450 ) ( ON ?auto_722452 ?auto_722451 ) ( ON ?auto_722453 ?auto_722452 ) ( ON ?auto_722454 ?auto_722453 ) ( not ( = ?auto_722445 ?auto_722446 ) ) ( not ( = ?auto_722445 ?auto_722447 ) ) ( not ( = ?auto_722445 ?auto_722448 ) ) ( not ( = ?auto_722445 ?auto_722449 ) ) ( not ( = ?auto_722445 ?auto_722450 ) ) ( not ( = ?auto_722445 ?auto_722451 ) ) ( not ( = ?auto_722445 ?auto_722452 ) ) ( not ( = ?auto_722445 ?auto_722453 ) ) ( not ( = ?auto_722445 ?auto_722454 ) ) ( not ( = ?auto_722445 ?auto_722455 ) ) ( not ( = ?auto_722445 ?auto_722456 ) ) ( not ( = ?auto_722445 ?auto_722458 ) ) ( not ( = ?auto_722446 ?auto_722447 ) ) ( not ( = ?auto_722446 ?auto_722448 ) ) ( not ( = ?auto_722446 ?auto_722449 ) ) ( not ( = ?auto_722446 ?auto_722450 ) ) ( not ( = ?auto_722446 ?auto_722451 ) ) ( not ( = ?auto_722446 ?auto_722452 ) ) ( not ( = ?auto_722446 ?auto_722453 ) ) ( not ( = ?auto_722446 ?auto_722454 ) ) ( not ( = ?auto_722446 ?auto_722455 ) ) ( not ( = ?auto_722446 ?auto_722456 ) ) ( not ( = ?auto_722446 ?auto_722458 ) ) ( not ( = ?auto_722447 ?auto_722448 ) ) ( not ( = ?auto_722447 ?auto_722449 ) ) ( not ( = ?auto_722447 ?auto_722450 ) ) ( not ( = ?auto_722447 ?auto_722451 ) ) ( not ( = ?auto_722447 ?auto_722452 ) ) ( not ( = ?auto_722447 ?auto_722453 ) ) ( not ( = ?auto_722447 ?auto_722454 ) ) ( not ( = ?auto_722447 ?auto_722455 ) ) ( not ( = ?auto_722447 ?auto_722456 ) ) ( not ( = ?auto_722447 ?auto_722458 ) ) ( not ( = ?auto_722448 ?auto_722449 ) ) ( not ( = ?auto_722448 ?auto_722450 ) ) ( not ( = ?auto_722448 ?auto_722451 ) ) ( not ( = ?auto_722448 ?auto_722452 ) ) ( not ( = ?auto_722448 ?auto_722453 ) ) ( not ( = ?auto_722448 ?auto_722454 ) ) ( not ( = ?auto_722448 ?auto_722455 ) ) ( not ( = ?auto_722448 ?auto_722456 ) ) ( not ( = ?auto_722448 ?auto_722458 ) ) ( not ( = ?auto_722449 ?auto_722450 ) ) ( not ( = ?auto_722449 ?auto_722451 ) ) ( not ( = ?auto_722449 ?auto_722452 ) ) ( not ( = ?auto_722449 ?auto_722453 ) ) ( not ( = ?auto_722449 ?auto_722454 ) ) ( not ( = ?auto_722449 ?auto_722455 ) ) ( not ( = ?auto_722449 ?auto_722456 ) ) ( not ( = ?auto_722449 ?auto_722458 ) ) ( not ( = ?auto_722450 ?auto_722451 ) ) ( not ( = ?auto_722450 ?auto_722452 ) ) ( not ( = ?auto_722450 ?auto_722453 ) ) ( not ( = ?auto_722450 ?auto_722454 ) ) ( not ( = ?auto_722450 ?auto_722455 ) ) ( not ( = ?auto_722450 ?auto_722456 ) ) ( not ( = ?auto_722450 ?auto_722458 ) ) ( not ( = ?auto_722451 ?auto_722452 ) ) ( not ( = ?auto_722451 ?auto_722453 ) ) ( not ( = ?auto_722451 ?auto_722454 ) ) ( not ( = ?auto_722451 ?auto_722455 ) ) ( not ( = ?auto_722451 ?auto_722456 ) ) ( not ( = ?auto_722451 ?auto_722458 ) ) ( not ( = ?auto_722452 ?auto_722453 ) ) ( not ( = ?auto_722452 ?auto_722454 ) ) ( not ( = ?auto_722452 ?auto_722455 ) ) ( not ( = ?auto_722452 ?auto_722456 ) ) ( not ( = ?auto_722452 ?auto_722458 ) ) ( not ( = ?auto_722453 ?auto_722454 ) ) ( not ( = ?auto_722453 ?auto_722455 ) ) ( not ( = ?auto_722453 ?auto_722456 ) ) ( not ( = ?auto_722453 ?auto_722458 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_722454 ?auto_722455 ?auto_722456 )
      ( MAKE-11CRATE-VERIFY ?auto_722445 ?auto_722446 ?auto_722447 ?auto_722448 ?auto_722449 ?auto_722450 ?auto_722451 ?auto_722452 ?auto_722453 ?auto_722454 ?auto_722455 ?auto_722456 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_722589 - SURFACE
      ?auto_722590 - SURFACE
      ?auto_722591 - SURFACE
      ?auto_722592 - SURFACE
      ?auto_722593 - SURFACE
      ?auto_722594 - SURFACE
      ?auto_722595 - SURFACE
      ?auto_722596 - SURFACE
      ?auto_722597 - SURFACE
      ?auto_722598 - SURFACE
      ?auto_722599 - SURFACE
      ?auto_722600 - SURFACE
    )
    :vars
    (
      ?auto_722601 - HOIST
      ?auto_722602 - PLACE
      ?auto_722605 - PLACE
      ?auto_722603 - HOIST
      ?auto_722604 - SURFACE
      ?auto_722606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_722601 ?auto_722602 ) ( IS-CRATE ?auto_722600 ) ( not ( = ?auto_722599 ?auto_722600 ) ) ( not ( = ?auto_722598 ?auto_722599 ) ) ( not ( = ?auto_722598 ?auto_722600 ) ) ( not ( = ?auto_722605 ?auto_722602 ) ) ( HOIST-AT ?auto_722603 ?auto_722605 ) ( not ( = ?auto_722601 ?auto_722603 ) ) ( AVAILABLE ?auto_722603 ) ( SURFACE-AT ?auto_722600 ?auto_722605 ) ( ON ?auto_722600 ?auto_722604 ) ( CLEAR ?auto_722600 ) ( not ( = ?auto_722599 ?auto_722604 ) ) ( not ( = ?auto_722600 ?auto_722604 ) ) ( not ( = ?auto_722598 ?auto_722604 ) ) ( TRUCK-AT ?auto_722606 ?auto_722602 ) ( SURFACE-AT ?auto_722598 ?auto_722602 ) ( CLEAR ?auto_722598 ) ( LIFTING ?auto_722601 ?auto_722599 ) ( IS-CRATE ?auto_722599 ) ( ON ?auto_722590 ?auto_722589 ) ( ON ?auto_722591 ?auto_722590 ) ( ON ?auto_722592 ?auto_722591 ) ( ON ?auto_722593 ?auto_722592 ) ( ON ?auto_722594 ?auto_722593 ) ( ON ?auto_722595 ?auto_722594 ) ( ON ?auto_722596 ?auto_722595 ) ( ON ?auto_722597 ?auto_722596 ) ( ON ?auto_722598 ?auto_722597 ) ( not ( = ?auto_722589 ?auto_722590 ) ) ( not ( = ?auto_722589 ?auto_722591 ) ) ( not ( = ?auto_722589 ?auto_722592 ) ) ( not ( = ?auto_722589 ?auto_722593 ) ) ( not ( = ?auto_722589 ?auto_722594 ) ) ( not ( = ?auto_722589 ?auto_722595 ) ) ( not ( = ?auto_722589 ?auto_722596 ) ) ( not ( = ?auto_722589 ?auto_722597 ) ) ( not ( = ?auto_722589 ?auto_722598 ) ) ( not ( = ?auto_722589 ?auto_722599 ) ) ( not ( = ?auto_722589 ?auto_722600 ) ) ( not ( = ?auto_722589 ?auto_722604 ) ) ( not ( = ?auto_722590 ?auto_722591 ) ) ( not ( = ?auto_722590 ?auto_722592 ) ) ( not ( = ?auto_722590 ?auto_722593 ) ) ( not ( = ?auto_722590 ?auto_722594 ) ) ( not ( = ?auto_722590 ?auto_722595 ) ) ( not ( = ?auto_722590 ?auto_722596 ) ) ( not ( = ?auto_722590 ?auto_722597 ) ) ( not ( = ?auto_722590 ?auto_722598 ) ) ( not ( = ?auto_722590 ?auto_722599 ) ) ( not ( = ?auto_722590 ?auto_722600 ) ) ( not ( = ?auto_722590 ?auto_722604 ) ) ( not ( = ?auto_722591 ?auto_722592 ) ) ( not ( = ?auto_722591 ?auto_722593 ) ) ( not ( = ?auto_722591 ?auto_722594 ) ) ( not ( = ?auto_722591 ?auto_722595 ) ) ( not ( = ?auto_722591 ?auto_722596 ) ) ( not ( = ?auto_722591 ?auto_722597 ) ) ( not ( = ?auto_722591 ?auto_722598 ) ) ( not ( = ?auto_722591 ?auto_722599 ) ) ( not ( = ?auto_722591 ?auto_722600 ) ) ( not ( = ?auto_722591 ?auto_722604 ) ) ( not ( = ?auto_722592 ?auto_722593 ) ) ( not ( = ?auto_722592 ?auto_722594 ) ) ( not ( = ?auto_722592 ?auto_722595 ) ) ( not ( = ?auto_722592 ?auto_722596 ) ) ( not ( = ?auto_722592 ?auto_722597 ) ) ( not ( = ?auto_722592 ?auto_722598 ) ) ( not ( = ?auto_722592 ?auto_722599 ) ) ( not ( = ?auto_722592 ?auto_722600 ) ) ( not ( = ?auto_722592 ?auto_722604 ) ) ( not ( = ?auto_722593 ?auto_722594 ) ) ( not ( = ?auto_722593 ?auto_722595 ) ) ( not ( = ?auto_722593 ?auto_722596 ) ) ( not ( = ?auto_722593 ?auto_722597 ) ) ( not ( = ?auto_722593 ?auto_722598 ) ) ( not ( = ?auto_722593 ?auto_722599 ) ) ( not ( = ?auto_722593 ?auto_722600 ) ) ( not ( = ?auto_722593 ?auto_722604 ) ) ( not ( = ?auto_722594 ?auto_722595 ) ) ( not ( = ?auto_722594 ?auto_722596 ) ) ( not ( = ?auto_722594 ?auto_722597 ) ) ( not ( = ?auto_722594 ?auto_722598 ) ) ( not ( = ?auto_722594 ?auto_722599 ) ) ( not ( = ?auto_722594 ?auto_722600 ) ) ( not ( = ?auto_722594 ?auto_722604 ) ) ( not ( = ?auto_722595 ?auto_722596 ) ) ( not ( = ?auto_722595 ?auto_722597 ) ) ( not ( = ?auto_722595 ?auto_722598 ) ) ( not ( = ?auto_722595 ?auto_722599 ) ) ( not ( = ?auto_722595 ?auto_722600 ) ) ( not ( = ?auto_722595 ?auto_722604 ) ) ( not ( = ?auto_722596 ?auto_722597 ) ) ( not ( = ?auto_722596 ?auto_722598 ) ) ( not ( = ?auto_722596 ?auto_722599 ) ) ( not ( = ?auto_722596 ?auto_722600 ) ) ( not ( = ?auto_722596 ?auto_722604 ) ) ( not ( = ?auto_722597 ?auto_722598 ) ) ( not ( = ?auto_722597 ?auto_722599 ) ) ( not ( = ?auto_722597 ?auto_722600 ) ) ( not ( = ?auto_722597 ?auto_722604 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_722598 ?auto_722599 ?auto_722600 )
      ( MAKE-11CRATE-VERIFY ?auto_722589 ?auto_722590 ?auto_722591 ?auto_722592 ?auto_722593 ?auto_722594 ?auto_722595 ?auto_722596 ?auto_722597 ?auto_722598 ?auto_722599 ?auto_722600 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_722733 - SURFACE
      ?auto_722734 - SURFACE
      ?auto_722735 - SURFACE
      ?auto_722736 - SURFACE
      ?auto_722737 - SURFACE
      ?auto_722738 - SURFACE
      ?auto_722739 - SURFACE
      ?auto_722740 - SURFACE
      ?auto_722741 - SURFACE
      ?auto_722742 - SURFACE
      ?auto_722743 - SURFACE
      ?auto_722744 - SURFACE
    )
    :vars
    (
      ?auto_722747 - HOIST
      ?auto_722748 - PLACE
      ?auto_722745 - PLACE
      ?auto_722749 - HOIST
      ?auto_722750 - SURFACE
      ?auto_722746 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_722747 ?auto_722748 ) ( IS-CRATE ?auto_722744 ) ( not ( = ?auto_722743 ?auto_722744 ) ) ( not ( = ?auto_722742 ?auto_722743 ) ) ( not ( = ?auto_722742 ?auto_722744 ) ) ( not ( = ?auto_722745 ?auto_722748 ) ) ( HOIST-AT ?auto_722749 ?auto_722745 ) ( not ( = ?auto_722747 ?auto_722749 ) ) ( AVAILABLE ?auto_722749 ) ( SURFACE-AT ?auto_722744 ?auto_722745 ) ( ON ?auto_722744 ?auto_722750 ) ( CLEAR ?auto_722744 ) ( not ( = ?auto_722743 ?auto_722750 ) ) ( not ( = ?auto_722744 ?auto_722750 ) ) ( not ( = ?auto_722742 ?auto_722750 ) ) ( TRUCK-AT ?auto_722746 ?auto_722748 ) ( SURFACE-AT ?auto_722742 ?auto_722748 ) ( CLEAR ?auto_722742 ) ( IS-CRATE ?auto_722743 ) ( AVAILABLE ?auto_722747 ) ( IN ?auto_722743 ?auto_722746 ) ( ON ?auto_722734 ?auto_722733 ) ( ON ?auto_722735 ?auto_722734 ) ( ON ?auto_722736 ?auto_722735 ) ( ON ?auto_722737 ?auto_722736 ) ( ON ?auto_722738 ?auto_722737 ) ( ON ?auto_722739 ?auto_722738 ) ( ON ?auto_722740 ?auto_722739 ) ( ON ?auto_722741 ?auto_722740 ) ( ON ?auto_722742 ?auto_722741 ) ( not ( = ?auto_722733 ?auto_722734 ) ) ( not ( = ?auto_722733 ?auto_722735 ) ) ( not ( = ?auto_722733 ?auto_722736 ) ) ( not ( = ?auto_722733 ?auto_722737 ) ) ( not ( = ?auto_722733 ?auto_722738 ) ) ( not ( = ?auto_722733 ?auto_722739 ) ) ( not ( = ?auto_722733 ?auto_722740 ) ) ( not ( = ?auto_722733 ?auto_722741 ) ) ( not ( = ?auto_722733 ?auto_722742 ) ) ( not ( = ?auto_722733 ?auto_722743 ) ) ( not ( = ?auto_722733 ?auto_722744 ) ) ( not ( = ?auto_722733 ?auto_722750 ) ) ( not ( = ?auto_722734 ?auto_722735 ) ) ( not ( = ?auto_722734 ?auto_722736 ) ) ( not ( = ?auto_722734 ?auto_722737 ) ) ( not ( = ?auto_722734 ?auto_722738 ) ) ( not ( = ?auto_722734 ?auto_722739 ) ) ( not ( = ?auto_722734 ?auto_722740 ) ) ( not ( = ?auto_722734 ?auto_722741 ) ) ( not ( = ?auto_722734 ?auto_722742 ) ) ( not ( = ?auto_722734 ?auto_722743 ) ) ( not ( = ?auto_722734 ?auto_722744 ) ) ( not ( = ?auto_722734 ?auto_722750 ) ) ( not ( = ?auto_722735 ?auto_722736 ) ) ( not ( = ?auto_722735 ?auto_722737 ) ) ( not ( = ?auto_722735 ?auto_722738 ) ) ( not ( = ?auto_722735 ?auto_722739 ) ) ( not ( = ?auto_722735 ?auto_722740 ) ) ( not ( = ?auto_722735 ?auto_722741 ) ) ( not ( = ?auto_722735 ?auto_722742 ) ) ( not ( = ?auto_722735 ?auto_722743 ) ) ( not ( = ?auto_722735 ?auto_722744 ) ) ( not ( = ?auto_722735 ?auto_722750 ) ) ( not ( = ?auto_722736 ?auto_722737 ) ) ( not ( = ?auto_722736 ?auto_722738 ) ) ( not ( = ?auto_722736 ?auto_722739 ) ) ( not ( = ?auto_722736 ?auto_722740 ) ) ( not ( = ?auto_722736 ?auto_722741 ) ) ( not ( = ?auto_722736 ?auto_722742 ) ) ( not ( = ?auto_722736 ?auto_722743 ) ) ( not ( = ?auto_722736 ?auto_722744 ) ) ( not ( = ?auto_722736 ?auto_722750 ) ) ( not ( = ?auto_722737 ?auto_722738 ) ) ( not ( = ?auto_722737 ?auto_722739 ) ) ( not ( = ?auto_722737 ?auto_722740 ) ) ( not ( = ?auto_722737 ?auto_722741 ) ) ( not ( = ?auto_722737 ?auto_722742 ) ) ( not ( = ?auto_722737 ?auto_722743 ) ) ( not ( = ?auto_722737 ?auto_722744 ) ) ( not ( = ?auto_722737 ?auto_722750 ) ) ( not ( = ?auto_722738 ?auto_722739 ) ) ( not ( = ?auto_722738 ?auto_722740 ) ) ( not ( = ?auto_722738 ?auto_722741 ) ) ( not ( = ?auto_722738 ?auto_722742 ) ) ( not ( = ?auto_722738 ?auto_722743 ) ) ( not ( = ?auto_722738 ?auto_722744 ) ) ( not ( = ?auto_722738 ?auto_722750 ) ) ( not ( = ?auto_722739 ?auto_722740 ) ) ( not ( = ?auto_722739 ?auto_722741 ) ) ( not ( = ?auto_722739 ?auto_722742 ) ) ( not ( = ?auto_722739 ?auto_722743 ) ) ( not ( = ?auto_722739 ?auto_722744 ) ) ( not ( = ?auto_722739 ?auto_722750 ) ) ( not ( = ?auto_722740 ?auto_722741 ) ) ( not ( = ?auto_722740 ?auto_722742 ) ) ( not ( = ?auto_722740 ?auto_722743 ) ) ( not ( = ?auto_722740 ?auto_722744 ) ) ( not ( = ?auto_722740 ?auto_722750 ) ) ( not ( = ?auto_722741 ?auto_722742 ) ) ( not ( = ?auto_722741 ?auto_722743 ) ) ( not ( = ?auto_722741 ?auto_722744 ) ) ( not ( = ?auto_722741 ?auto_722750 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_722742 ?auto_722743 ?auto_722744 )
      ( MAKE-11CRATE-VERIFY ?auto_722733 ?auto_722734 ?auto_722735 ?auto_722736 ?auto_722737 ?auto_722738 ?auto_722739 ?auto_722740 ?auto_722741 ?auto_722742 ?auto_722743 ?auto_722744 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_731982 - SURFACE
      ?auto_731983 - SURFACE
      ?auto_731984 - SURFACE
      ?auto_731985 - SURFACE
      ?auto_731986 - SURFACE
      ?auto_731987 - SURFACE
      ?auto_731988 - SURFACE
      ?auto_731989 - SURFACE
      ?auto_731990 - SURFACE
      ?auto_731991 - SURFACE
      ?auto_731992 - SURFACE
      ?auto_731993 - SURFACE
      ?auto_731994 - SURFACE
    )
    :vars
    (
      ?auto_731996 - HOIST
      ?auto_731995 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_731996 ?auto_731995 ) ( SURFACE-AT ?auto_731993 ?auto_731995 ) ( CLEAR ?auto_731993 ) ( LIFTING ?auto_731996 ?auto_731994 ) ( IS-CRATE ?auto_731994 ) ( not ( = ?auto_731993 ?auto_731994 ) ) ( ON ?auto_731983 ?auto_731982 ) ( ON ?auto_731984 ?auto_731983 ) ( ON ?auto_731985 ?auto_731984 ) ( ON ?auto_731986 ?auto_731985 ) ( ON ?auto_731987 ?auto_731986 ) ( ON ?auto_731988 ?auto_731987 ) ( ON ?auto_731989 ?auto_731988 ) ( ON ?auto_731990 ?auto_731989 ) ( ON ?auto_731991 ?auto_731990 ) ( ON ?auto_731992 ?auto_731991 ) ( ON ?auto_731993 ?auto_731992 ) ( not ( = ?auto_731982 ?auto_731983 ) ) ( not ( = ?auto_731982 ?auto_731984 ) ) ( not ( = ?auto_731982 ?auto_731985 ) ) ( not ( = ?auto_731982 ?auto_731986 ) ) ( not ( = ?auto_731982 ?auto_731987 ) ) ( not ( = ?auto_731982 ?auto_731988 ) ) ( not ( = ?auto_731982 ?auto_731989 ) ) ( not ( = ?auto_731982 ?auto_731990 ) ) ( not ( = ?auto_731982 ?auto_731991 ) ) ( not ( = ?auto_731982 ?auto_731992 ) ) ( not ( = ?auto_731982 ?auto_731993 ) ) ( not ( = ?auto_731982 ?auto_731994 ) ) ( not ( = ?auto_731983 ?auto_731984 ) ) ( not ( = ?auto_731983 ?auto_731985 ) ) ( not ( = ?auto_731983 ?auto_731986 ) ) ( not ( = ?auto_731983 ?auto_731987 ) ) ( not ( = ?auto_731983 ?auto_731988 ) ) ( not ( = ?auto_731983 ?auto_731989 ) ) ( not ( = ?auto_731983 ?auto_731990 ) ) ( not ( = ?auto_731983 ?auto_731991 ) ) ( not ( = ?auto_731983 ?auto_731992 ) ) ( not ( = ?auto_731983 ?auto_731993 ) ) ( not ( = ?auto_731983 ?auto_731994 ) ) ( not ( = ?auto_731984 ?auto_731985 ) ) ( not ( = ?auto_731984 ?auto_731986 ) ) ( not ( = ?auto_731984 ?auto_731987 ) ) ( not ( = ?auto_731984 ?auto_731988 ) ) ( not ( = ?auto_731984 ?auto_731989 ) ) ( not ( = ?auto_731984 ?auto_731990 ) ) ( not ( = ?auto_731984 ?auto_731991 ) ) ( not ( = ?auto_731984 ?auto_731992 ) ) ( not ( = ?auto_731984 ?auto_731993 ) ) ( not ( = ?auto_731984 ?auto_731994 ) ) ( not ( = ?auto_731985 ?auto_731986 ) ) ( not ( = ?auto_731985 ?auto_731987 ) ) ( not ( = ?auto_731985 ?auto_731988 ) ) ( not ( = ?auto_731985 ?auto_731989 ) ) ( not ( = ?auto_731985 ?auto_731990 ) ) ( not ( = ?auto_731985 ?auto_731991 ) ) ( not ( = ?auto_731985 ?auto_731992 ) ) ( not ( = ?auto_731985 ?auto_731993 ) ) ( not ( = ?auto_731985 ?auto_731994 ) ) ( not ( = ?auto_731986 ?auto_731987 ) ) ( not ( = ?auto_731986 ?auto_731988 ) ) ( not ( = ?auto_731986 ?auto_731989 ) ) ( not ( = ?auto_731986 ?auto_731990 ) ) ( not ( = ?auto_731986 ?auto_731991 ) ) ( not ( = ?auto_731986 ?auto_731992 ) ) ( not ( = ?auto_731986 ?auto_731993 ) ) ( not ( = ?auto_731986 ?auto_731994 ) ) ( not ( = ?auto_731987 ?auto_731988 ) ) ( not ( = ?auto_731987 ?auto_731989 ) ) ( not ( = ?auto_731987 ?auto_731990 ) ) ( not ( = ?auto_731987 ?auto_731991 ) ) ( not ( = ?auto_731987 ?auto_731992 ) ) ( not ( = ?auto_731987 ?auto_731993 ) ) ( not ( = ?auto_731987 ?auto_731994 ) ) ( not ( = ?auto_731988 ?auto_731989 ) ) ( not ( = ?auto_731988 ?auto_731990 ) ) ( not ( = ?auto_731988 ?auto_731991 ) ) ( not ( = ?auto_731988 ?auto_731992 ) ) ( not ( = ?auto_731988 ?auto_731993 ) ) ( not ( = ?auto_731988 ?auto_731994 ) ) ( not ( = ?auto_731989 ?auto_731990 ) ) ( not ( = ?auto_731989 ?auto_731991 ) ) ( not ( = ?auto_731989 ?auto_731992 ) ) ( not ( = ?auto_731989 ?auto_731993 ) ) ( not ( = ?auto_731989 ?auto_731994 ) ) ( not ( = ?auto_731990 ?auto_731991 ) ) ( not ( = ?auto_731990 ?auto_731992 ) ) ( not ( = ?auto_731990 ?auto_731993 ) ) ( not ( = ?auto_731990 ?auto_731994 ) ) ( not ( = ?auto_731991 ?auto_731992 ) ) ( not ( = ?auto_731991 ?auto_731993 ) ) ( not ( = ?auto_731991 ?auto_731994 ) ) ( not ( = ?auto_731992 ?auto_731993 ) ) ( not ( = ?auto_731992 ?auto_731994 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_731993 ?auto_731994 )
      ( MAKE-12CRATE-VERIFY ?auto_731982 ?auto_731983 ?auto_731984 ?auto_731985 ?auto_731986 ?auto_731987 ?auto_731988 ?auto_731989 ?auto_731990 ?auto_731991 ?auto_731992 ?auto_731993 ?auto_731994 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_732107 - SURFACE
      ?auto_732108 - SURFACE
      ?auto_732109 - SURFACE
      ?auto_732110 - SURFACE
      ?auto_732111 - SURFACE
      ?auto_732112 - SURFACE
      ?auto_732113 - SURFACE
      ?auto_732114 - SURFACE
      ?auto_732115 - SURFACE
      ?auto_732116 - SURFACE
      ?auto_732117 - SURFACE
      ?auto_732118 - SURFACE
      ?auto_732119 - SURFACE
    )
    :vars
    (
      ?auto_732121 - HOIST
      ?auto_732122 - PLACE
      ?auto_732120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_732121 ?auto_732122 ) ( SURFACE-AT ?auto_732118 ?auto_732122 ) ( CLEAR ?auto_732118 ) ( IS-CRATE ?auto_732119 ) ( not ( = ?auto_732118 ?auto_732119 ) ) ( TRUCK-AT ?auto_732120 ?auto_732122 ) ( AVAILABLE ?auto_732121 ) ( IN ?auto_732119 ?auto_732120 ) ( ON ?auto_732118 ?auto_732117 ) ( not ( = ?auto_732117 ?auto_732118 ) ) ( not ( = ?auto_732117 ?auto_732119 ) ) ( ON ?auto_732108 ?auto_732107 ) ( ON ?auto_732109 ?auto_732108 ) ( ON ?auto_732110 ?auto_732109 ) ( ON ?auto_732111 ?auto_732110 ) ( ON ?auto_732112 ?auto_732111 ) ( ON ?auto_732113 ?auto_732112 ) ( ON ?auto_732114 ?auto_732113 ) ( ON ?auto_732115 ?auto_732114 ) ( ON ?auto_732116 ?auto_732115 ) ( ON ?auto_732117 ?auto_732116 ) ( not ( = ?auto_732107 ?auto_732108 ) ) ( not ( = ?auto_732107 ?auto_732109 ) ) ( not ( = ?auto_732107 ?auto_732110 ) ) ( not ( = ?auto_732107 ?auto_732111 ) ) ( not ( = ?auto_732107 ?auto_732112 ) ) ( not ( = ?auto_732107 ?auto_732113 ) ) ( not ( = ?auto_732107 ?auto_732114 ) ) ( not ( = ?auto_732107 ?auto_732115 ) ) ( not ( = ?auto_732107 ?auto_732116 ) ) ( not ( = ?auto_732107 ?auto_732117 ) ) ( not ( = ?auto_732107 ?auto_732118 ) ) ( not ( = ?auto_732107 ?auto_732119 ) ) ( not ( = ?auto_732108 ?auto_732109 ) ) ( not ( = ?auto_732108 ?auto_732110 ) ) ( not ( = ?auto_732108 ?auto_732111 ) ) ( not ( = ?auto_732108 ?auto_732112 ) ) ( not ( = ?auto_732108 ?auto_732113 ) ) ( not ( = ?auto_732108 ?auto_732114 ) ) ( not ( = ?auto_732108 ?auto_732115 ) ) ( not ( = ?auto_732108 ?auto_732116 ) ) ( not ( = ?auto_732108 ?auto_732117 ) ) ( not ( = ?auto_732108 ?auto_732118 ) ) ( not ( = ?auto_732108 ?auto_732119 ) ) ( not ( = ?auto_732109 ?auto_732110 ) ) ( not ( = ?auto_732109 ?auto_732111 ) ) ( not ( = ?auto_732109 ?auto_732112 ) ) ( not ( = ?auto_732109 ?auto_732113 ) ) ( not ( = ?auto_732109 ?auto_732114 ) ) ( not ( = ?auto_732109 ?auto_732115 ) ) ( not ( = ?auto_732109 ?auto_732116 ) ) ( not ( = ?auto_732109 ?auto_732117 ) ) ( not ( = ?auto_732109 ?auto_732118 ) ) ( not ( = ?auto_732109 ?auto_732119 ) ) ( not ( = ?auto_732110 ?auto_732111 ) ) ( not ( = ?auto_732110 ?auto_732112 ) ) ( not ( = ?auto_732110 ?auto_732113 ) ) ( not ( = ?auto_732110 ?auto_732114 ) ) ( not ( = ?auto_732110 ?auto_732115 ) ) ( not ( = ?auto_732110 ?auto_732116 ) ) ( not ( = ?auto_732110 ?auto_732117 ) ) ( not ( = ?auto_732110 ?auto_732118 ) ) ( not ( = ?auto_732110 ?auto_732119 ) ) ( not ( = ?auto_732111 ?auto_732112 ) ) ( not ( = ?auto_732111 ?auto_732113 ) ) ( not ( = ?auto_732111 ?auto_732114 ) ) ( not ( = ?auto_732111 ?auto_732115 ) ) ( not ( = ?auto_732111 ?auto_732116 ) ) ( not ( = ?auto_732111 ?auto_732117 ) ) ( not ( = ?auto_732111 ?auto_732118 ) ) ( not ( = ?auto_732111 ?auto_732119 ) ) ( not ( = ?auto_732112 ?auto_732113 ) ) ( not ( = ?auto_732112 ?auto_732114 ) ) ( not ( = ?auto_732112 ?auto_732115 ) ) ( not ( = ?auto_732112 ?auto_732116 ) ) ( not ( = ?auto_732112 ?auto_732117 ) ) ( not ( = ?auto_732112 ?auto_732118 ) ) ( not ( = ?auto_732112 ?auto_732119 ) ) ( not ( = ?auto_732113 ?auto_732114 ) ) ( not ( = ?auto_732113 ?auto_732115 ) ) ( not ( = ?auto_732113 ?auto_732116 ) ) ( not ( = ?auto_732113 ?auto_732117 ) ) ( not ( = ?auto_732113 ?auto_732118 ) ) ( not ( = ?auto_732113 ?auto_732119 ) ) ( not ( = ?auto_732114 ?auto_732115 ) ) ( not ( = ?auto_732114 ?auto_732116 ) ) ( not ( = ?auto_732114 ?auto_732117 ) ) ( not ( = ?auto_732114 ?auto_732118 ) ) ( not ( = ?auto_732114 ?auto_732119 ) ) ( not ( = ?auto_732115 ?auto_732116 ) ) ( not ( = ?auto_732115 ?auto_732117 ) ) ( not ( = ?auto_732115 ?auto_732118 ) ) ( not ( = ?auto_732115 ?auto_732119 ) ) ( not ( = ?auto_732116 ?auto_732117 ) ) ( not ( = ?auto_732116 ?auto_732118 ) ) ( not ( = ?auto_732116 ?auto_732119 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_732117 ?auto_732118 ?auto_732119 )
      ( MAKE-12CRATE-VERIFY ?auto_732107 ?auto_732108 ?auto_732109 ?auto_732110 ?auto_732111 ?auto_732112 ?auto_732113 ?auto_732114 ?auto_732115 ?auto_732116 ?auto_732117 ?auto_732118 ?auto_732119 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_732245 - SURFACE
      ?auto_732246 - SURFACE
      ?auto_732247 - SURFACE
      ?auto_732248 - SURFACE
      ?auto_732249 - SURFACE
      ?auto_732250 - SURFACE
      ?auto_732251 - SURFACE
      ?auto_732252 - SURFACE
      ?auto_732253 - SURFACE
      ?auto_732254 - SURFACE
      ?auto_732255 - SURFACE
      ?auto_732256 - SURFACE
      ?auto_732257 - SURFACE
    )
    :vars
    (
      ?auto_732259 - HOIST
      ?auto_732261 - PLACE
      ?auto_732260 - TRUCK
      ?auto_732258 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_732259 ?auto_732261 ) ( SURFACE-AT ?auto_732256 ?auto_732261 ) ( CLEAR ?auto_732256 ) ( IS-CRATE ?auto_732257 ) ( not ( = ?auto_732256 ?auto_732257 ) ) ( AVAILABLE ?auto_732259 ) ( IN ?auto_732257 ?auto_732260 ) ( ON ?auto_732256 ?auto_732255 ) ( not ( = ?auto_732255 ?auto_732256 ) ) ( not ( = ?auto_732255 ?auto_732257 ) ) ( TRUCK-AT ?auto_732260 ?auto_732258 ) ( not ( = ?auto_732258 ?auto_732261 ) ) ( ON ?auto_732246 ?auto_732245 ) ( ON ?auto_732247 ?auto_732246 ) ( ON ?auto_732248 ?auto_732247 ) ( ON ?auto_732249 ?auto_732248 ) ( ON ?auto_732250 ?auto_732249 ) ( ON ?auto_732251 ?auto_732250 ) ( ON ?auto_732252 ?auto_732251 ) ( ON ?auto_732253 ?auto_732252 ) ( ON ?auto_732254 ?auto_732253 ) ( ON ?auto_732255 ?auto_732254 ) ( not ( = ?auto_732245 ?auto_732246 ) ) ( not ( = ?auto_732245 ?auto_732247 ) ) ( not ( = ?auto_732245 ?auto_732248 ) ) ( not ( = ?auto_732245 ?auto_732249 ) ) ( not ( = ?auto_732245 ?auto_732250 ) ) ( not ( = ?auto_732245 ?auto_732251 ) ) ( not ( = ?auto_732245 ?auto_732252 ) ) ( not ( = ?auto_732245 ?auto_732253 ) ) ( not ( = ?auto_732245 ?auto_732254 ) ) ( not ( = ?auto_732245 ?auto_732255 ) ) ( not ( = ?auto_732245 ?auto_732256 ) ) ( not ( = ?auto_732245 ?auto_732257 ) ) ( not ( = ?auto_732246 ?auto_732247 ) ) ( not ( = ?auto_732246 ?auto_732248 ) ) ( not ( = ?auto_732246 ?auto_732249 ) ) ( not ( = ?auto_732246 ?auto_732250 ) ) ( not ( = ?auto_732246 ?auto_732251 ) ) ( not ( = ?auto_732246 ?auto_732252 ) ) ( not ( = ?auto_732246 ?auto_732253 ) ) ( not ( = ?auto_732246 ?auto_732254 ) ) ( not ( = ?auto_732246 ?auto_732255 ) ) ( not ( = ?auto_732246 ?auto_732256 ) ) ( not ( = ?auto_732246 ?auto_732257 ) ) ( not ( = ?auto_732247 ?auto_732248 ) ) ( not ( = ?auto_732247 ?auto_732249 ) ) ( not ( = ?auto_732247 ?auto_732250 ) ) ( not ( = ?auto_732247 ?auto_732251 ) ) ( not ( = ?auto_732247 ?auto_732252 ) ) ( not ( = ?auto_732247 ?auto_732253 ) ) ( not ( = ?auto_732247 ?auto_732254 ) ) ( not ( = ?auto_732247 ?auto_732255 ) ) ( not ( = ?auto_732247 ?auto_732256 ) ) ( not ( = ?auto_732247 ?auto_732257 ) ) ( not ( = ?auto_732248 ?auto_732249 ) ) ( not ( = ?auto_732248 ?auto_732250 ) ) ( not ( = ?auto_732248 ?auto_732251 ) ) ( not ( = ?auto_732248 ?auto_732252 ) ) ( not ( = ?auto_732248 ?auto_732253 ) ) ( not ( = ?auto_732248 ?auto_732254 ) ) ( not ( = ?auto_732248 ?auto_732255 ) ) ( not ( = ?auto_732248 ?auto_732256 ) ) ( not ( = ?auto_732248 ?auto_732257 ) ) ( not ( = ?auto_732249 ?auto_732250 ) ) ( not ( = ?auto_732249 ?auto_732251 ) ) ( not ( = ?auto_732249 ?auto_732252 ) ) ( not ( = ?auto_732249 ?auto_732253 ) ) ( not ( = ?auto_732249 ?auto_732254 ) ) ( not ( = ?auto_732249 ?auto_732255 ) ) ( not ( = ?auto_732249 ?auto_732256 ) ) ( not ( = ?auto_732249 ?auto_732257 ) ) ( not ( = ?auto_732250 ?auto_732251 ) ) ( not ( = ?auto_732250 ?auto_732252 ) ) ( not ( = ?auto_732250 ?auto_732253 ) ) ( not ( = ?auto_732250 ?auto_732254 ) ) ( not ( = ?auto_732250 ?auto_732255 ) ) ( not ( = ?auto_732250 ?auto_732256 ) ) ( not ( = ?auto_732250 ?auto_732257 ) ) ( not ( = ?auto_732251 ?auto_732252 ) ) ( not ( = ?auto_732251 ?auto_732253 ) ) ( not ( = ?auto_732251 ?auto_732254 ) ) ( not ( = ?auto_732251 ?auto_732255 ) ) ( not ( = ?auto_732251 ?auto_732256 ) ) ( not ( = ?auto_732251 ?auto_732257 ) ) ( not ( = ?auto_732252 ?auto_732253 ) ) ( not ( = ?auto_732252 ?auto_732254 ) ) ( not ( = ?auto_732252 ?auto_732255 ) ) ( not ( = ?auto_732252 ?auto_732256 ) ) ( not ( = ?auto_732252 ?auto_732257 ) ) ( not ( = ?auto_732253 ?auto_732254 ) ) ( not ( = ?auto_732253 ?auto_732255 ) ) ( not ( = ?auto_732253 ?auto_732256 ) ) ( not ( = ?auto_732253 ?auto_732257 ) ) ( not ( = ?auto_732254 ?auto_732255 ) ) ( not ( = ?auto_732254 ?auto_732256 ) ) ( not ( = ?auto_732254 ?auto_732257 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_732255 ?auto_732256 ?auto_732257 )
      ( MAKE-12CRATE-VERIFY ?auto_732245 ?auto_732246 ?auto_732247 ?auto_732248 ?auto_732249 ?auto_732250 ?auto_732251 ?auto_732252 ?auto_732253 ?auto_732254 ?auto_732255 ?auto_732256 ?auto_732257 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_732395 - SURFACE
      ?auto_732396 - SURFACE
      ?auto_732397 - SURFACE
      ?auto_732398 - SURFACE
      ?auto_732399 - SURFACE
      ?auto_732400 - SURFACE
      ?auto_732401 - SURFACE
      ?auto_732402 - SURFACE
      ?auto_732403 - SURFACE
      ?auto_732404 - SURFACE
      ?auto_732405 - SURFACE
      ?auto_732406 - SURFACE
      ?auto_732407 - SURFACE
    )
    :vars
    (
      ?auto_732409 - HOIST
      ?auto_732408 - PLACE
      ?auto_732412 - TRUCK
      ?auto_732411 - PLACE
      ?auto_732410 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_732409 ?auto_732408 ) ( SURFACE-AT ?auto_732406 ?auto_732408 ) ( CLEAR ?auto_732406 ) ( IS-CRATE ?auto_732407 ) ( not ( = ?auto_732406 ?auto_732407 ) ) ( AVAILABLE ?auto_732409 ) ( ON ?auto_732406 ?auto_732405 ) ( not ( = ?auto_732405 ?auto_732406 ) ) ( not ( = ?auto_732405 ?auto_732407 ) ) ( TRUCK-AT ?auto_732412 ?auto_732411 ) ( not ( = ?auto_732411 ?auto_732408 ) ) ( HOIST-AT ?auto_732410 ?auto_732411 ) ( LIFTING ?auto_732410 ?auto_732407 ) ( not ( = ?auto_732409 ?auto_732410 ) ) ( ON ?auto_732396 ?auto_732395 ) ( ON ?auto_732397 ?auto_732396 ) ( ON ?auto_732398 ?auto_732397 ) ( ON ?auto_732399 ?auto_732398 ) ( ON ?auto_732400 ?auto_732399 ) ( ON ?auto_732401 ?auto_732400 ) ( ON ?auto_732402 ?auto_732401 ) ( ON ?auto_732403 ?auto_732402 ) ( ON ?auto_732404 ?auto_732403 ) ( ON ?auto_732405 ?auto_732404 ) ( not ( = ?auto_732395 ?auto_732396 ) ) ( not ( = ?auto_732395 ?auto_732397 ) ) ( not ( = ?auto_732395 ?auto_732398 ) ) ( not ( = ?auto_732395 ?auto_732399 ) ) ( not ( = ?auto_732395 ?auto_732400 ) ) ( not ( = ?auto_732395 ?auto_732401 ) ) ( not ( = ?auto_732395 ?auto_732402 ) ) ( not ( = ?auto_732395 ?auto_732403 ) ) ( not ( = ?auto_732395 ?auto_732404 ) ) ( not ( = ?auto_732395 ?auto_732405 ) ) ( not ( = ?auto_732395 ?auto_732406 ) ) ( not ( = ?auto_732395 ?auto_732407 ) ) ( not ( = ?auto_732396 ?auto_732397 ) ) ( not ( = ?auto_732396 ?auto_732398 ) ) ( not ( = ?auto_732396 ?auto_732399 ) ) ( not ( = ?auto_732396 ?auto_732400 ) ) ( not ( = ?auto_732396 ?auto_732401 ) ) ( not ( = ?auto_732396 ?auto_732402 ) ) ( not ( = ?auto_732396 ?auto_732403 ) ) ( not ( = ?auto_732396 ?auto_732404 ) ) ( not ( = ?auto_732396 ?auto_732405 ) ) ( not ( = ?auto_732396 ?auto_732406 ) ) ( not ( = ?auto_732396 ?auto_732407 ) ) ( not ( = ?auto_732397 ?auto_732398 ) ) ( not ( = ?auto_732397 ?auto_732399 ) ) ( not ( = ?auto_732397 ?auto_732400 ) ) ( not ( = ?auto_732397 ?auto_732401 ) ) ( not ( = ?auto_732397 ?auto_732402 ) ) ( not ( = ?auto_732397 ?auto_732403 ) ) ( not ( = ?auto_732397 ?auto_732404 ) ) ( not ( = ?auto_732397 ?auto_732405 ) ) ( not ( = ?auto_732397 ?auto_732406 ) ) ( not ( = ?auto_732397 ?auto_732407 ) ) ( not ( = ?auto_732398 ?auto_732399 ) ) ( not ( = ?auto_732398 ?auto_732400 ) ) ( not ( = ?auto_732398 ?auto_732401 ) ) ( not ( = ?auto_732398 ?auto_732402 ) ) ( not ( = ?auto_732398 ?auto_732403 ) ) ( not ( = ?auto_732398 ?auto_732404 ) ) ( not ( = ?auto_732398 ?auto_732405 ) ) ( not ( = ?auto_732398 ?auto_732406 ) ) ( not ( = ?auto_732398 ?auto_732407 ) ) ( not ( = ?auto_732399 ?auto_732400 ) ) ( not ( = ?auto_732399 ?auto_732401 ) ) ( not ( = ?auto_732399 ?auto_732402 ) ) ( not ( = ?auto_732399 ?auto_732403 ) ) ( not ( = ?auto_732399 ?auto_732404 ) ) ( not ( = ?auto_732399 ?auto_732405 ) ) ( not ( = ?auto_732399 ?auto_732406 ) ) ( not ( = ?auto_732399 ?auto_732407 ) ) ( not ( = ?auto_732400 ?auto_732401 ) ) ( not ( = ?auto_732400 ?auto_732402 ) ) ( not ( = ?auto_732400 ?auto_732403 ) ) ( not ( = ?auto_732400 ?auto_732404 ) ) ( not ( = ?auto_732400 ?auto_732405 ) ) ( not ( = ?auto_732400 ?auto_732406 ) ) ( not ( = ?auto_732400 ?auto_732407 ) ) ( not ( = ?auto_732401 ?auto_732402 ) ) ( not ( = ?auto_732401 ?auto_732403 ) ) ( not ( = ?auto_732401 ?auto_732404 ) ) ( not ( = ?auto_732401 ?auto_732405 ) ) ( not ( = ?auto_732401 ?auto_732406 ) ) ( not ( = ?auto_732401 ?auto_732407 ) ) ( not ( = ?auto_732402 ?auto_732403 ) ) ( not ( = ?auto_732402 ?auto_732404 ) ) ( not ( = ?auto_732402 ?auto_732405 ) ) ( not ( = ?auto_732402 ?auto_732406 ) ) ( not ( = ?auto_732402 ?auto_732407 ) ) ( not ( = ?auto_732403 ?auto_732404 ) ) ( not ( = ?auto_732403 ?auto_732405 ) ) ( not ( = ?auto_732403 ?auto_732406 ) ) ( not ( = ?auto_732403 ?auto_732407 ) ) ( not ( = ?auto_732404 ?auto_732405 ) ) ( not ( = ?auto_732404 ?auto_732406 ) ) ( not ( = ?auto_732404 ?auto_732407 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_732405 ?auto_732406 ?auto_732407 )
      ( MAKE-12CRATE-VERIFY ?auto_732395 ?auto_732396 ?auto_732397 ?auto_732398 ?auto_732399 ?auto_732400 ?auto_732401 ?auto_732402 ?auto_732403 ?auto_732404 ?auto_732405 ?auto_732406 ?auto_732407 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_732557 - SURFACE
      ?auto_732558 - SURFACE
      ?auto_732559 - SURFACE
      ?auto_732560 - SURFACE
      ?auto_732561 - SURFACE
      ?auto_732562 - SURFACE
      ?auto_732563 - SURFACE
      ?auto_732564 - SURFACE
      ?auto_732565 - SURFACE
      ?auto_732566 - SURFACE
      ?auto_732567 - SURFACE
      ?auto_732568 - SURFACE
      ?auto_732569 - SURFACE
    )
    :vars
    (
      ?auto_732572 - HOIST
      ?auto_732573 - PLACE
      ?auto_732570 - TRUCK
      ?auto_732574 - PLACE
      ?auto_732575 - HOIST
      ?auto_732571 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_732572 ?auto_732573 ) ( SURFACE-AT ?auto_732568 ?auto_732573 ) ( CLEAR ?auto_732568 ) ( IS-CRATE ?auto_732569 ) ( not ( = ?auto_732568 ?auto_732569 ) ) ( AVAILABLE ?auto_732572 ) ( ON ?auto_732568 ?auto_732567 ) ( not ( = ?auto_732567 ?auto_732568 ) ) ( not ( = ?auto_732567 ?auto_732569 ) ) ( TRUCK-AT ?auto_732570 ?auto_732574 ) ( not ( = ?auto_732574 ?auto_732573 ) ) ( HOIST-AT ?auto_732575 ?auto_732574 ) ( not ( = ?auto_732572 ?auto_732575 ) ) ( AVAILABLE ?auto_732575 ) ( SURFACE-AT ?auto_732569 ?auto_732574 ) ( ON ?auto_732569 ?auto_732571 ) ( CLEAR ?auto_732569 ) ( not ( = ?auto_732568 ?auto_732571 ) ) ( not ( = ?auto_732569 ?auto_732571 ) ) ( not ( = ?auto_732567 ?auto_732571 ) ) ( ON ?auto_732558 ?auto_732557 ) ( ON ?auto_732559 ?auto_732558 ) ( ON ?auto_732560 ?auto_732559 ) ( ON ?auto_732561 ?auto_732560 ) ( ON ?auto_732562 ?auto_732561 ) ( ON ?auto_732563 ?auto_732562 ) ( ON ?auto_732564 ?auto_732563 ) ( ON ?auto_732565 ?auto_732564 ) ( ON ?auto_732566 ?auto_732565 ) ( ON ?auto_732567 ?auto_732566 ) ( not ( = ?auto_732557 ?auto_732558 ) ) ( not ( = ?auto_732557 ?auto_732559 ) ) ( not ( = ?auto_732557 ?auto_732560 ) ) ( not ( = ?auto_732557 ?auto_732561 ) ) ( not ( = ?auto_732557 ?auto_732562 ) ) ( not ( = ?auto_732557 ?auto_732563 ) ) ( not ( = ?auto_732557 ?auto_732564 ) ) ( not ( = ?auto_732557 ?auto_732565 ) ) ( not ( = ?auto_732557 ?auto_732566 ) ) ( not ( = ?auto_732557 ?auto_732567 ) ) ( not ( = ?auto_732557 ?auto_732568 ) ) ( not ( = ?auto_732557 ?auto_732569 ) ) ( not ( = ?auto_732557 ?auto_732571 ) ) ( not ( = ?auto_732558 ?auto_732559 ) ) ( not ( = ?auto_732558 ?auto_732560 ) ) ( not ( = ?auto_732558 ?auto_732561 ) ) ( not ( = ?auto_732558 ?auto_732562 ) ) ( not ( = ?auto_732558 ?auto_732563 ) ) ( not ( = ?auto_732558 ?auto_732564 ) ) ( not ( = ?auto_732558 ?auto_732565 ) ) ( not ( = ?auto_732558 ?auto_732566 ) ) ( not ( = ?auto_732558 ?auto_732567 ) ) ( not ( = ?auto_732558 ?auto_732568 ) ) ( not ( = ?auto_732558 ?auto_732569 ) ) ( not ( = ?auto_732558 ?auto_732571 ) ) ( not ( = ?auto_732559 ?auto_732560 ) ) ( not ( = ?auto_732559 ?auto_732561 ) ) ( not ( = ?auto_732559 ?auto_732562 ) ) ( not ( = ?auto_732559 ?auto_732563 ) ) ( not ( = ?auto_732559 ?auto_732564 ) ) ( not ( = ?auto_732559 ?auto_732565 ) ) ( not ( = ?auto_732559 ?auto_732566 ) ) ( not ( = ?auto_732559 ?auto_732567 ) ) ( not ( = ?auto_732559 ?auto_732568 ) ) ( not ( = ?auto_732559 ?auto_732569 ) ) ( not ( = ?auto_732559 ?auto_732571 ) ) ( not ( = ?auto_732560 ?auto_732561 ) ) ( not ( = ?auto_732560 ?auto_732562 ) ) ( not ( = ?auto_732560 ?auto_732563 ) ) ( not ( = ?auto_732560 ?auto_732564 ) ) ( not ( = ?auto_732560 ?auto_732565 ) ) ( not ( = ?auto_732560 ?auto_732566 ) ) ( not ( = ?auto_732560 ?auto_732567 ) ) ( not ( = ?auto_732560 ?auto_732568 ) ) ( not ( = ?auto_732560 ?auto_732569 ) ) ( not ( = ?auto_732560 ?auto_732571 ) ) ( not ( = ?auto_732561 ?auto_732562 ) ) ( not ( = ?auto_732561 ?auto_732563 ) ) ( not ( = ?auto_732561 ?auto_732564 ) ) ( not ( = ?auto_732561 ?auto_732565 ) ) ( not ( = ?auto_732561 ?auto_732566 ) ) ( not ( = ?auto_732561 ?auto_732567 ) ) ( not ( = ?auto_732561 ?auto_732568 ) ) ( not ( = ?auto_732561 ?auto_732569 ) ) ( not ( = ?auto_732561 ?auto_732571 ) ) ( not ( = ?auto_732562 ?auto_732563 ) ) ( not ( = ?auto_732562 ?auto_732564 ) ) ( not ( = ?auto_732562 ?auto_732565 ) ) ( not ( = ?auto_732562 ?auto_732566 ) ) ( not ( = ?auto_732562 ?auto_732567 ) ) ( not ( = ?auto_732562 ?auto_732568 ) ) ( not ( = ?auto_732562 ?auto_732569 ) ) ( not ( = ?auto_732562 ?auto_732571 ) ) ( not ( = ?auto_732563 ?auto_732564 ) ) ( not ( = ?auto_732563 ?auto_732565 ) ) ( not ( = ?auto_732563 ?auto_732566 ) ) ( not ( = ?auto_732563 ?auto_732567 ) ) ( not ( = ?auto_732563 ?auto_732568 ) ) ( not ( = ?auto_732563 ?auto_732569 ) ) ( not ( = ?auto_732563 ?auto_732571 ) ) ( not ( = ?auto_732564 ?auto_732565 ) ) ( not ( = ?auto_732564 ?auto_732566 ) ) ( not ( = ?auto_732564 ?auto_732567 ) ) ( not ( = ?auto_732564 ?auto_732568 ) ) ( not ( = ?auto_732564 ?auto_732569 ) ) ( not ( = ?auto_732564 ?auto_732571 ) ) ( not ( = ?auto_732565 ?auto_732566 ) ) ( not ( = ?auto_732565 ?auto_732567 ) ) ( not ( = ?auto_732565 ?auto_732568 ) ) ( not ( = ?auto_732565 ?auto_732569 ) ) ( not ( = ?auto_732565 ?auto_732571 ) ) ( not ( = ?auto_732566 ?auto_732567 ) ) ( not ( = ?auto_732566 ?auto_732568 ) ) ( not ( = ?auto_732566 ?auto_732569 ) ) ( not ( = ?auto_732566 ?auto_732571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_732567 ?auto_732568 ?auto_732569 )
      ( MAKE-12CRATE-VERIFY ?auto_732557 ?auto_732558 ?auto_732559 ?auto_732560 ?auto_732561 ?auto_732562 ?auto_732563 ?auto_732564 ?auto_732565 ?auto_732566 ?auto_732567 ?auto_732568 ?auto_732569 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_732720 - SURFACE
      ?auto_732721 - SURFACE
      ?auto_732722 - SURFACE
      ?auto_732723 - SURFACE
      ?auto_732724 - SURFACE
      ?auto_732725 - SURFACE
      ?auto_732726 - SURFACE
      ?auto_732727 - SURFACE
      ?auto_732728 - SURFACE
      ?auto_732729 - SURFACE
      ?auto_732730 - SURFACE
      ?auto_732731 - SURFACE
      ?auto_732732 - SURFACE
    )
    :vars
    (
      ?auto_732738 - HOIST
      ?auto_732733 - PLACE
      ?auto_732734 - PLACE
      ?auto_732737 - HOIST
      ?auto_732735 - SURFACE
      ?auto_732736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_732738 ?auto_732733 ) ( SURFACE-AT ?auto_732731 ?auto_732733 ) ( CLEAR ?auto_732731 ) ( IS-CRATE ?auto_732732 ) ( not ( = ?auto_732731 ?auto_732732 ) ) ( AVAILABLE ?auto_732738 ) ( ON ?auto_732731 ?auto_732730 ) ( not ( = ?auto_732730 ?auto_732731 ) ) ( not ( = ?auto_732730 ?auto_732732 ) ) ( not ( = ?auto_732734 ?auto_732733 ) ) ( HOIST-AT ?auto_732737 ?auto_732734 ) ( not ( = ?auto_732738 ?auto_732737 ) ) ( AVAILABLE ?auto_732737 ) ( SURFACE-AT ?auto_732732 ?auto_732734 ) ( ON ?auto_732732 ?auto_732735 ) ( CLEAR ?auto_732732 ) ( not ( = ?auto_732731 ?auto_732735 ) ) ( not ( = ?auto_732732 ?auto_732735 ) ) ( not ( = ?auto_732730 ?auto_732735 ) ) ( TRUCK-AT ?auto_732736 ?auto_732733 ) ( ON ?auto_732721 ?auto_732720 ) ( ON ?auto_732722 ?auto_732721 ) ( ON ?auto_732723 ?auto_732722 ) ( ON ?auto_732724 ?auto_732723 ) ( ON ?auto_732725 ?auto_732724 ) ( ON ?auto_732726 ?auto_732725 ) ( ON ?auto_732727 ?auto_732726 ) ( ON ?auto_732728 ?auto_732727 ) ( ON ?auto_732729 ?auto_732728 ) ( ON ?auto_732730 ?auto_732729 ) ( not ( = ?auto_732720 ?auto_732721 ) ) ( not ( = ?auto_732720 ?auto_732722 ) ) ( not ( = ?auto_732720 ?auto_732723 ) ) ( not ( = ?auto_732720 ?auto_732724 ) ) ( not ( = ?auto_732720 ?auto_732725 ) ) ( not ( = ?auto_732720 ?auto_732726 ) ) ( not ( = ?auto_732720 ?auto_732727 ) ) ( not ( = ?auto_732720 ?auto_732728 ) ) ( not ( = ?auto_732720 ?auto_732729 ) ) ( not ( = ?auto_732720 ?auto_732730 ) ) ( not ( = ?auto_732720 ?auto_732731 ) ) ( not ( = ?auto_732720 ?auto_732732 ) ) ( not ( = ?auto_732720 ?auto_732735 ) ) ( not ( = ?auto_732721 ?auto_732722 ) ) ( not ( = ?auto_732721 ?auto_732723 ) ) ( not ( = ?auto_732721 ?auto_732724 ) ) ( not ( = ?auto_732721 ?auto_732725 ) ) ( not ( = ?auto_732721 ?auto_732726 ) ) ( not ( = ?auto_732721 ?auto_732727 ) ) ( not ( = ?auto_732721 ?auto_732728 ) ) ( not ( = ?auto_732721 ?auto_732729 ) ) ( not ( = ?auto_732721 ?auto_732730 ) ) ( not ( = ?auto_732721 ?auto_732731 ) ) ( not ( = ?auto_732721 ?auto_732732 ) ) ( not ( = ?auto_732721 ?auto_732735 ) ) ( not ( = ?auto_732722 ?auto_732723 ) ) ( not ( = ?auto_732722 ?auto_732724 ) ) ( not ( = ?auto_732722 ?auto_732725 ) ) ( not ( = ?auto_732722 ?auto_732726 ) ) ( not ( = ?auto_732722 ?auto_732727 ) ) ( not ( = ?auto_732722 ?auto_732728 ) ) ( not ( = ?auto_732722 ?auto_732729 ) ) ( not ( = ?auto_732722 ?auto_732730 ) ) ( not ( = ?auto_732722 ?auto_732731 ) ) ( not ( = ?auto_732722 ?auto_732732 ) ) ( not ( = ?auto_732722 ?auto_732735 ) ) ( not ( = ?auto_732723 ?auto_732724 ) ) ( not ( = ?auto_732723 ?auto_732725 ) ) ( not ( = ?auto_732723 ?auto_732726 ) ) ( not ( = ?auto_732723 ?auto_732727 ) ) ( not ( = ?auto_732723 ?auto_732728 ) ) ( not ( = ?auto_732723 ?auto_732729 ) ) ( not ( = ?auto_732723 ?auto_732730 ) ) ( not ( = ?auto_732723 ?auto_732731 ) ) ( not ( = ?auto_732723 ?auto_732732 ) ) ( not ( = ?auto_732723 ?auto_732735 ) ) ( not ( = ?auto_732724 ?auto_732725 ) ) ( not ( = ?auto_732724 ?auto_732726 ) ) ( not ( = ?auto_732724 ?auto_732727 ) ) ( not ( = ?auto_732724 ?auto_732728 ) ) ( not ( = ?auto_732724 ?auto_732729 ) ) ( not ( = ?auto_732724 ?auto_732730 ) ) ( not ( = ?auto_732724 ?auto_732731 ) ) ( not ( = ?auto_732724 ?auto_732732 ) ) ( not ( = ?auto_732724 ?auto_732735 ) ) ( not ( = ?auto_732725 ?auto_732726 ) ) ( not ( = ?auto_732725 ?auto_732727 ) ) ( not ( = ?auto_732725 ?auto_732728 ) ) ( not ( = ?auto_732725 ?auto_732729 ) ) ( not ( = ?auto_732725 ?auto_732730 ) ) ( not ( = ?auto_732725 ?auto_732731 ) ) ( not ( = ?auto_732725 ?auto_732732 ) ) ( not ( = ?auto_732725 ?auto_732735 ) ) ( not ( = ?auto_732726 ?auto_732727 ) ) ( not ( = ?auto_732726 ?auto_732728 ) ) ( not ( = ?auto_732726 ?auto_732729 ) ) ( not ( = ?auto_732726 ?auto_732730 ) ) ( not ( = ?auto_732726 ?auto_732731 ) ) ( not ( = ?auto_732726 ?auto_732732 ) ) ( not ( = ?auto_732726 ?auto_732735 ) ) ( not ( = ?auto_732727 ?auto_732728 ) ) ( not ( = ?auto_732727 ?auto_732729 ) ) ( not ( = ?auto_732727 ?auto_732730 ) ) ( not ( = ?auto_732727 ?auto_732731 ) ) ( not ( = ?auto_732727 ?auto_732732 ) ) ( not ( = ?auto_732727 ?auto_732735 ) ) ( not ( = ?auto_732728 ?auto_732729 ) ) ( not ( = ?auto_732728 ?auto_732730 ) ) ( not ( = ?auto_732728 ?auto_732731 ) ) ( not ( = ?auto_732728 ?auto_732732 ) ) ( not ( = ?auto_732728 ?auto_732735 ) ) ( not ( = ?auto_732729 ?auto_732730 ) ) ( not ( = ?auto_732729 ?auto_732731 ) ) ( not ( = ?auto_732729 ?auto_732732 ) ) ( not ( = ?auto_732729 ?auto_732735 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_732730 ?auto_732731 ?auto_732732 )
      ( MAKE-12CRATE-VERIFY ?auto_732720 ?auto_732721 ?auto_732722 ?auto_732723 ?auto_732724 ?auto_732725 ?auto_732726 ?auto_732727 ?auto_732728 ?auto_732729 ?auto_732730 ?auto_732731 ?auto_732732 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_732883 - SURFACE
      ?auto_732884 - SURFACE
      ?auto_732885 - SURFACE
      ?auto_732886 - SURFACE
      ?auto_732887 - SURFACE
      ?auto_732888 - SURFACE
      ?auto_732889 - SURFACE
      ?auto_732890 - SURFACE
      ?auto_732891 - SURFACE
      ?auto_732892 - SURFACE
      ?auto_732893 - SURFACE
      ?auto_732894 - SURFACE
      ?auto_732895 - SURFACE
    )
    :vars
    (
      ?auto_732901 - HOIST
      ?auto_732899 - PLACE
      ?auto_732897 - PLACE
      ?auto_732898 - HOIST
      ?auto_732900 - SURFACE
      ?auto_732896 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_732901 ?auto_732899 ) ( IS-CRATE ?auto_732895 ) ( not ( = ?auto_732894 ?auto_732895 ) ) ( not ( = ?auto_732893 ?auto_732894 ) ) ( not ( = ?auto_732893 ?auto_732895 ) ) ( not ( = ?auto_732897 ?auto_732899 ) ) ( HOIST-AT ?auto_732898 ?auto_732897 ) ( not ( = ?auto_732901 ?auto_732898 ) ) ( AVAILABLE ?auto_732898 ) ( SURFACE-AT ?auto_732895 ?auto_732897 ) ( ON ?auto_732895 ?auto_732900 ) ( CLEAR ?auto_732895 ) ( not ( = ?auto_732894 ?auto_732900 ) ) ( not ( = ?auto_732895 ?auto_732900 ) ) ( not ( = ?auto_732893 ?auto_732900 ) ) ( TRUCK-AT ?auto_732896 ?auto_732899 ) ( SURFACE-AT ?auto_732893 ?auto_732899 ) ( CLEAR ?auto_732893 ) ( LIFTING ?auto_732901 ?auto_732894 ) ( IS-CRATE ?auto_732894 ) ( ON ?auto_732884 ?auto_732883 ) ( ON ?auto_732885 ?auto_732884 ) ( ON ?auto_732886 ?auto_732885 ) ( ON ?auto_732887 ?auto_732886 ) ( ON ?auto_732888 ?auto_732887 ) ( ON ?auto_732889 ?auto_732888 ) ( ON ?auto_732890 ?auto_732889 ) ( ON ?auto_732891 ?auto_732890 ) ( ON ?auto_732892 ?auto_732891 ) ( ON ?auto_732893 ?auto_732892 ) ( not ( = ?auto_732883 ?auto_732884 ) ) ( not ( = ?auto_732883 ?auto_732885 ) ) ( not ( = ?auto_732883 ?auto_732886 ) ) ( not ( = ?auto_732883 ?auto_732887 ) ) ( not ( = ?auto_732883 ?auto_732888 ) ) ( not ( = ?auto_732883 ?auto_732889 ) ) ( not ( = ?auto_732883 ?auto_732890 ) ) ( not ( = ?auto_732883 ?auto_732891 ) ) ( not ( = ?auto_732883 ?auto_732892 ) ) ( not ( = ?auto_732883 ?auto_732893 ) ) ( not ( = ?auto_732883 ?auto_732894 ) ) ( not ( = ?auto_732883 ?auto_732895 ) ) ( not ( = ?auto_732883 ?auto_732900 ) ) ( not ( = ?auto_732884 ?auto_732885 ) ) ( not ( = ?auto_732884 ?auto_732886 ) ) ( not ( = ?auto_732884 ?auto_732887 ) ) ( not ( = ?auto_732884 ?auto_732888 ) ) ( not ( = ?auto_732884 ?auto_732889 ) ) ( not ( = ?auto_732884 ?auto_732890 ) ) ( not ( = ?auto_732884 ?auto_732891 ) ) ( not ( = ?auto_732884 ?auto_732892 ) ) ( not ( = ?auto_732884 ?auto_732893 ) ) ( not ( = ?auto_732884 ?auto_732894 ) ) ( not ( = ?auto_732884 ?auto_732895 ) ) ( not ( = ?auto_732884 ?auto_732900 ) ) ( not ( = ?auto_732885 ?auto_732886 ) ) ( not ( = ?auto_732885 ?auto_732887 ) ) ( not ( = ?auto_732885 ?auto_732888 ) ) ( not ( = ?auto_732885 ?auto_732889 ) ) ( not ( = ?auto_732885 ?auto_732890 ) ) ( not ( = ?auto_732885 ?auto_732891 ) ) ( not ( = ?auto_732885 ?auto_732892 ) ) ( not ( = ?auto_732885 ?auto_732893 ) ) ( not ( = ?auto_732885 ?auto_732894 ) ) ( not ( = ?auto_732885 ?auto_732895 ) ) ( not ( = ?auto_732885 ?auto_732900 ) ) ( not ( = ?auto_732886 ?auto_732887 ) ) ( not ( = ?auto_732886 ?auto_732888 ) ) ( not ( = ?auto_732886 ?auto_732889 ) ) ( not ( = ?auto_732886 ?auto_732890 ) ) ( not ( = ?auto_732886 ?auto_732891 ) ) ( not ( = ?auto_732886 ?auto_732892 ) ) ( not ( = ?auto_732886 ?auto_732893 ) ) ( not ( = ?auto_732886 ?auto_732894 ) ) ( not ( = ?auto_732886 ?auto_732895 ) ) ( not ( = ?auto_732886 ?auto_732900 ) ) ( not ( = ?auto_732887 ?auto_732888 ) ) ( not ( = ?auto_732887 ?auto_732889 ) ) ( not ( = ?auto_732887 ?auto_732890 ) ) ( not ( = ?auto_732887 ?auto_732891 ) ) ( not ( = ?auto_732887 ?auto_732892 ) ) ( not ( = ?auto_732887 ?auto_732893 ) ) ( not ( = ?auto_732887 ?auto_732894 ) ) ( not ( = ?auto_732887 ?auto_732895 ) ) ( not ( = ?auto_732887 ?auto_732900 ) ) ( not ( = ?auto_732888 ?auto_732889 ) ) ( not ( = ?auto_732888 ?auto_732890 ) ) ( not ( = ?auto_732888 ?auto_732891 ) ) ( not ( = ?auto_732888 ?auto_732892 ) ) ( not ( = ?auto_732888 ?auto_732893 ) ) ( not ( = ?auto_732888 ?auto_732894 ) ) ( not ( = ?auto_732888 ?auto_732895 ) ) ( not ( = ?auto_732888 ?auto_732900 ) ) ( not ( = ?auto_732889 ?auto_732890 ) ) ( not ( = ?auto_732889 ?auto_732891 ) ) ( not ( = ?auto_732889 ?auto_732892 ) ) ( not ( = ?auto_732889 ?auto_732893 ) ) ( not ( = ?auto_732889 ?auto_732894 ) ) ( not ( = ?auto_732889 ?auto_732895 ) ) ( not ( = ?auto_732889 ?auto_732900 ) ) ( not ( = ?auto_732890 ?auto_732891 ) ) ( not ( = ?auto_732890 ?auto_732892 ) ) ( not ( = ?auto_732890 ?auto_732893 ) ) ( not ( = ?auto_732890 ?auto_732894 ) ) ( not ( = ?auto_732890 ?auto_732895 ) ) ( not ( = ?auto_732890 ?auto_732900 ) ) ( not ( = ?auto_732891 ?auto_732892 ) ) ( not ( = ?auto_732891 ?auto_732893 ) ) ( not ( = ?auto_732891 ?auto_732894 ) ) ( not ( = ?auto_732891 ?auto_732895 ) ) ( not ( = ?auto_732891 ?auto_732900 ) ) ( not ( = ?auto_732892 ?auto_732893 ) ) ( not ( = ?auto_732892 ?auto_732894 ) ) ( not ( = ?auto_732892 ?auto_732895 ) ) ( not ( = ?auto_732892 ?auto_732900 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_732893 ?auto_732894 ?auto_732895 )
      ( MAKE-12CRATE-VERIFY ?auto_732883 ?auto_732884 ?auto_732885 ?auto_732886 ?auto_732887 ?auto_732888 ?auto_732889 ?auto_732890 ?auto_732891 ?auto_732892 ?auto_732893 ?auto_732894 ?auto_732895 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_733046 - SURFACE
      ?auto_733047 - SURFACE
      ?auto_733048 - SURFACE
      ?auto_733049 - SURFACE
      ?auto_733050 - SURFACE
      ?auto_733051 - SURFACE
      ?auto_733052 - SURFACE
      ?auto_733053 - SURFACE
      ?auto_733054 - SURFACE
      ?auto_733055 - SURFACE
      ?auto_733056 - SURFACE
      ?auto_733057 - SURFACE
      ?auto_733058 - SURFACE
    )
    :vars
    (
      ?auto_733060 - HOIST
      ?auto_733064 - PLACE
      ?auto_733059 - PLACE
      ?auto_733061 - HOIST
      ?auto_733063 - SURFACE
      ?auto_733062 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_733060 ?auto_733064 ) ( IS-CRATE ?auto_733058 ) ( not ( = ?auto_733057 ?auto_733058 ) ) ( not ( = ?auto_733056 ?auto_733057 ) ) ( not ( = ?auto_733056 ?auto_733058 ) ) ( not ( = ?auto_733059 ?auto_733064 ) ) ( HOIST-AT ?auto_733061 ?auto_733059 ) ( not ( = ?auto_733060 ?auto_733061 ) ) ( AVAILABLE ?auto_733061 ) ( SURFACE-AT ?auto_733058 ?auto_733059 ) ( ON ?auto_733058 ?auto_733063 ) ( CLEAR ?auto_733058 ) ( not ( = ?auto_733057 ?auto_733063 ) ) ( not ( = ?auto_733058 ?auto_733063 ) ) ( not ( = ?auto_733056 ?auto_733063 ) ) ( TRUCK-AT ?auto_733062 ?auto_733064 ) ( SURFACE-AT ?auto_733056 ?auto_733064 ) ( CLEAR ?auto_733056 ) ( IS-CRATE ?auto_733057 ) ( AVAILABLE ?auto_733060 ) ( IN ?auto_733057 ?auto_733062 ) ( ON ?auto_733047 ?auto_733046 ) ( ON ?auto_733048 ?auto_733047 ) ( ON ?auto_733049 ?auto_733048 ) ( ON ?auto_733050 ?auto_733049 ) ( ON ?auto_733051 ?auto_733050 ) ( ON ?auto_733052 ?auto_733051 ) ( ON ?auto_733053 ?auto_733052 ) ( ON ?auto_733054 ?auto_733053 ) ( ON ?auto_733055 ?auto_733054 ) ( ON ?auto_733056 ?auto_733055 ) ( not ( = ?auto_733046 ?auto_733047 ) ) ( not ( = ?auto_733046 ?auto_733048 ) ) ( not ( = ?auto_733046 ?auto_733049 ) ) ( not ( = ?auto_733046 ?auto_733050 ) ) ( not ( = ?auto_733046 ?auto_733051 ) ) ( not ( = ?auto_733046 ?auto_733052 ) ) ( not ( = ?auto_733046 ?auto_733053 ) ) ( not ( = ?auto_733046 ?auto_733054 ) ) ( not ( = ?auto_733046 ?auto_733055 ) ) ( not ( = ?auto_733046 ?auto_733056 ) ) ( not ( = ?auto_733046 ?auto_733057 ) ) ( not ( = ?auto_733046 ?auto_733058 ) ) ( not ( = ?auto_733046 ?auto_733063 ) ) ( not ( = ?auto_733047 ?auto_733048 ) ) ( not ( = ?auto_733047 ?auto_733049 ) ) ( not ( = ?auto_733047 ?auto_733050 ) ) ( not ( = ?auto_733047 ?auto_733051 ) ) ( not ( = ?auto_733047 ?auto_733052 ) ) ( not ( = ?auto_733047 ?auto_733053 ) ) ( not ( = ?auto_733047 ?auto_733054 ) ) ( not ( = ?auto_733047 ?auto_733055 ) ) ( not ( = ?auto_733047 ?auto_733056 ) ) ( not ( = ?auto_733047 ?auto_733057 ) ) ( not ( = ?auto_733047 ?auto_733058 ) ) ( not ( = ?auto_733047 ?auto_733063 ) ) ( not ( = ?auto_733048 ?auto_733049 ) ) ( not ( = ?auto_733048 ?auto_733050 ) ) ( not ( = ?auto_733048 ?auto_733051 ) ) ( not ( = ?auto_733048 ?auto_733052 ) ) ( not ( = ?auto_733048 ?auto_733053 ) ) ( not ( = ?auto_733048 ?auto_733054 ) ) ( not ( = ?auto_733048 ?auto_733055 ) ) ( not ( = ?auto_733048 ?auto_733056 ) ) ( not ( = ?auto_733048 ?auto_733057 ) ) ( not ( = ?auto_733048 ?auto_733058 ) ) ( not ( = ?auto_733048 ?auto_733063 ) ) ( not ( = ?auto_733049 ?auto_733050 ) ) ( not ( = ?auto_733049 ?auto_733051 ) ) ( not ( = ?auto_733049 ?auto_733052 ) ) ( not ( = ?auto_733049 ?auto_733053 ) ) ( not ( = ?auto_733049 ?auto_733054 ) ) ( not ( = ?auto_733049 ?auto_733055 ) ) ( not ( = ?auto_733049 ?auto_733056 ) ) ( not ( = ?auto_733049 ?auto_733057 ) ) ( not ( = ?auto_733049 ?auto_733058 ) ) ( not ( = ?auto_733049 ?auto_733063 ) ) ( not ( = ?auto_733050 ?auto_733051 ) ) ( not ( = ?auto_733050 ?auto_733052 ) ) ( not ( = ?auto_733050 ?auto_733053 ) ) ( not ( = ?auto_733050 ?auto_733054 ) ) ( not ( = ?auto_733050 ?auto_733055 ) ) ( not ( = ?auto_733050 ?auto_733056 ) ) ( not ( = ?auto_733050 ?auto_733057 ) ) ( not ( = ?auto_733050 ?auto_733058 ) ) ( not ( = ?auto_733050 ?auto_733063 ) ) ( not ( = ?auto_733051 ?auto_733052 ) ) ( not ( = ?auto_733051 ?auto_733053 ) ) ( not ( = ?auto_733051 ?auto_733054 ) ) ( not ( = ?auto_733051 ?auto_733055 ) ) ( not ( = ?auto_733051 ?auto_733056 ) ) ( not ( = ?auto_733051 ?auto_733057 ) ) ( not ( = ?auto_733051 ?auto_733058 ) ) ( not ( = ?auto_733051 ?auto_733063 ) ) ( not ( = ?auto_733052 ?auto_733053 ) ) ( not ( = ?auto_733052 ?auto_733054 ) ) ( not ( = ?auto_733052 ?auto_733055 ) ) ( not ( = ?auto_733052 ?auto_733056 ) ) ( not ( = ?auto_733052 ?auto_733057 ) ) ( not ( = ?auto_733052 ?auto_733058 ) ) ( not ( = ?auto_733052 ?auto_733063 ) ) ( not ( = ?auto_733053 ?auto_733054 ) ) ( not ( = ?auto_733053 ?auto_733055 ) ) ( not ( = ?auto_733053 ?auto_733056 ) ) ( not ( = ?auto_733053 ?auto_733057 ) ) ( not ( = ?auto_733053 ?auto_733058 ) ) ( not ( = ?auto_733053 ?auto_733063 ) ) ( not ( = ?auto_733054 ?auto_733055 ) ) ( not ( = ?auto_733054 ?auto_733056 ) ) ( not ( = ?auto_733054 ?auto_733057 ) ) ( not ( = ?auto_733054 ?auto_733058 ) ) ( not ( = ?auto_733054 ?auto_733063 ) ) ( not ( = ?auto_733055 ?auto_733056 ) ) ( not ( = ?auto_733055 ?auto_733057 ) ) ( not ( = ?auto_733055 ?auto_733058 ) ) ( not ( = ?auto_733055 ?auto_733063 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_733056 ?auto_733057 ?auto_733058 )
      ( MAKE-12CRATE-VERIFY ?auto_733046 ?auto_733047 ?auto_733048 ?auto_733049 ?auto_733050 ?auto_733051 ?auto_733052 ?auto_733053 ?auto_733054 ?auto_733055 ?auto_733056 ?auto_733057 ?auto_733058 ) )
  )

)

