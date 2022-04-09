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

  ( :method MAKE-14CRATE-VERIFY
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
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1343868 - SURFACE
      ?auto_1343869 - SURFACE
    )
    :vars
    (
      ?auto_1343870 - HOIST
      ?auto_1343871 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343870 ?auto_1343871 ) ( SURFACE-AT ?auto_1343868 ?auto_1343871 ) ( CLEAR ?auto_1343868 ) ( LIFTING ?auto_1343870 ?auto_1343869 ) ( IS-CRATE ?auto_1343869 ) ( not ( = ?auto_1343868 ?auto_1343869 ) ) )
    :subtasks
    ( ( !DROP ?auto_1343870 ?auto_1343869 ?auto_1343868 ?auto_1343871 )
      ( MAKE-1CRATE-VERIFY ?auto_1343868 ?auto_1343869 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1343872 - SURFACE
      ?auto_1343873 - SURFACE
    )
    :vars
    (
      ?auto_1343874 - HOIST
      ?auto_1343875 - PLACE
      ?auto_1343876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343874 ?auto_1343875 ) ( SURFACE-AT ?auto_1343872 ?auto_1343875 ) ( CLEAR ?auto_1343872 ) ( IS-CRATE ?auto_1343873 ) ( not ( = ?auto_1343872 ?auto_1343873 ) ) ( TRUCK-AT ?auto_1343876 ?auto_1343875 ) ( AVAILABLE ?auto_1343874 ) ( IN ?auto_1343873 ?auto_1343876 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1343874 ?auto_1343873 ?auto_1343876 ?auto_1343875 )
      ( MAKE-1CRATE ?auto_1343872 ?auto_1343873 )
      ( MAKE-1CRATE-VERIFY ?auto_1343872 ?auto_1343873 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1343877 - SURFACE
      ?auto_1343878 - SURFACE
    )
    :vars
    (
      ?auto_1343879 - HOIST
      ?auto_1343880 - PLACE
      ?auto_1343881 - TRUCK
      ?auto_1343882 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343879 ?auto_1343880 ) ( SURFACE-AT ?auto_1343877 ?auto_1343880 ) ( CLEAR ?auto_1343877 ) ( IS-CRATE ?auto_1343878 ) ( not ( = ?auto_1343877 ?auto_1343878 ) ) ( AVAILABLE ?auto_1343879 ) ( IN ?auto_1343878 ?auto_1343881 ) ( TRUCK-AT ?auto_1343881 ?auto_1343882 ) ( not ( = ?auto_1343882 ?auto_1343880 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1343881 ?auto_1343882 ?auto_1343880 )
      ( MAKE-1CRATE ?auto_1343877 ?auto_1343878 )
      ( MAKE-1CRATE-VERIFY ?auto_1343877 ?auto_1343878 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1343883 - SURFACE
      ?auto_1343884 - SURFACE
    )
    :vars
    (
      ?auto_1343888 - HOIST
      ?auto_1343885 - PLACE
      ?auto_1343886 - TRUCK
      ?auto_1343887 - PLACE
      ?auto_1343889 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343888 ?auto_1343885 ) ( SURFACE-AT ?auto_1343883 ?auto_1343885 ) ( CLEAR ?auto_1343883 ) ( IS-CRATE ?auto_1343884 ) ( not ( = ?auto_1343883 ?auto_1343884 ) ) ( AVAILABLE ?auto_1343888 ) ( TRUCK-AT ?auto_1343886 ?auto_1343887 ) ( not ( = ?auto_1343887 ?auto_1343885 ) ) ( HOIST-AT ?auto_1343889 ?auto_1343887 ) ( LIFTING ?auto_1343889 ?auto_1343884 ) ( not ( = ?auto_1343888 ?auto_1343889 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1343889 ?auto_1343884 ?auto_1343886 ?auto_1343887 )
      ( MAKE-1CRATE ?auto_1343883 ?auto_1343884 )
      ( MAKE-1CRATE-VERIFY ?auto_1343883 ?auto_1343884 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1343890 - SURFACE
      ?auto_1343891 - SURFACE
    )
    :vars
    (
      ?auto_1343893 - HOIST
      ?auto_1343892 - PLACE
      ?auto_1343895 - TRUCK
      ?auto_1343896 - PLACE
      ?auto_1343894 - HOIST
      ?auto_1343897 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343893 ?auto_1343892 ) ( SURFACE-AT ?auto_1343890 ?auto_1343892 ) ( CLEAR ?auto_1343890 ) ( IS-CRATE ?auto_1343891 ) ( not ( = ?auto_1343890 ?auto_1343891 ) ) ( AVAILABLE ?auto_1343893 ) ( TRUCK-AT ?auto_1343895 ?auto_1343896 ) ( not ( = ?auto_1343896 ?auto_1343892 ) ) ( HOIST-AT ?auto_1343894 ?auto_1343896 ) ( not ( = ?auto_1343893 ?auto_1343894 ) ) ( AVAILABLE ?auto_1343894 ) ( SURFACE-AT ?auto_1343891 ?auto_1343896 ) ( ON ?auto_1343891 ?auto_1343897 ) ( CLEAR ?auto_1343891 ) ( not ( = ?auto_1343890 ?auto_1343897 ) ) ( not ( = ?auto_1343891 ?auto_1343897 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1343894 ?auto_1343891 ?auto_1343897 ?auto_1343896 )
      ( MAKE-1CRATE ?auto_1343890 ?auto_1343891 )
      ( MAKE-1CRATE-VERIFY ?auto_1343890 ?auto_1343891 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1343898 - SURFACE
      ?auto_1343899 - SURFACE
    )
    :vars
    (
      ?auto_1343904 - HOIST
      ?auto_1343903 - PLACE
      ?auto_1343900 - PLACE
      ?auto_1343905 - HOIST
      ?auto_1343901 - SURFACE
      ?auto_1343902 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343904 ?auto_1343903 ) ( SURFACE-AT ?auto_1343898 ?auto_1343903 ) ( CLEAR ?auto_1343898 ) ( IS-CRATE ?auto_1343899 ) ( not ( = ?auto_1343898 ?auto_1343899 ) ) ( AVAILABLE ?auto_1343904 ) ( not ( = ?auto_1343900 ?auto_1343903 ) ) ( HOIST-AT ?auto_1343905 ?auto_1343900 ) ( not ( = ?auto_1343904 ?auto_1343905 ) ) ( AVAILABLE ?auto_1343905 ) ( SURFACE-AT ?auto_1343899 ?auto_1343900 ) ( ON ?auto_1343899 ?auto_1343901 ) ( CLEAR ?auto_1343899 ) ( not ( = ?auto_1343898 ?auto_1343901 ) ) ( not ( = ?auto_1343899 ?auto_1343901 ) ) ( TRUCK-AT ?auto_1343902 ?auto_1343903 ) )
    :subtasks
    ( ( !DRIVE ?auto_1343902 ?auto_1343903 ?auto_1343900 )
      ( MAKE-1CRATE ?auto_1343898 ?auto_1343899 )
      ( MAKE-1CRATE-VERIFY ?auto_1343898 ?auto_1343899 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1343915 - SURFACE
      ?auto_1343916 - SURFACE
      ?auto_1343917 - SURFACE
    )
    :vars
    (
      ?auto_1343919 - HOIST
      ?auto_1343918 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343919 ?auto_1343918 ) ( SURFACE-AT ?auto_1343916 ?auto_1343918 ) ( CLEAR ?auto_1343916 ) ( LIFTING ?auto_1343919 ?auto_1343917 ) ( IS-CRATE ?auto_1343917 ) ( not ( = ?auto_1343916 ?auto_1343917 ) ) ( ON ?auto_1343916 ?auto_1343915 ) ( not ( = ?auto_1343915 ?auto_1343916 ) ) ( not ( = ?auto_1343915 ?auto_1343917 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1343916 ?auto_1343917 )
      ( MAKE-2CRATE-VERIFY ?auto_1343915 ?auto_1343916 ?auto_1343917 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1343925 - SURFACE
      ?auto_1343926 - SURFACE
      ?auto_1343927 - SURFACE
    )
    :vars
    (
      ?auto_1343928 - HOIST
      ?auto_1343930 - PLACE
      ?auto_1343929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343928 ?auto_1343930 ) ( SURFACE-AT ?auto_1343926 ?auto_1343930 ) ( CLEAR ?auto_1343926 ) ( IS-CRATE ?auto_1343927 ) ( not ( = ?auto_1343926 ?auto_1343927 ) ) ( TRUCK-AT ?auto_1343929 ?auto_1343930 ) ( AVAILABLE ?auto_1343928 ) ( IN ?auto_1343927 ?auto_1343929 ) ( ON ?auto_1343926 ?auto_1343925 ) ( not ( = ?auto_1343925 ?auto_1343926 ) ) ( not ( = ?auto_1343925 ?auto_1343927 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1343926 ?auto_1343927 )
      ( MAKE-2CRATE-VERIFY ?auto_1343925 ?auto_1343926 ?auto_1343927 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1343931 - SURFACE
      ?auto_1343932 - SURFACE
    )
    :vars
    (
      ?auto_1343933 - HOIST
      ?auto_1343936 - PLACE
      ?auto_1343935 - TRUCK
      ?auto_1343934 - SURFACE
      ?auto_1343937 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343933 ?auto_1343936 ) ( SURFACE-AT ?auto_1343931 ?auto_1343936 ) ( CLEAR ?auto_1343931 ) ( IS-CRATE ?auto_1343932 ) ( not ( = ?auto_1343931 ?auto_1343932 ) ) ( AVAILABLE ?auto_1343933 ) ( IN ?auto_1343932 ?auto_1343935 ) ( ON ?auto_1343931 ?auto_1343934 ) ( not ( = ?auto_1343934 ?auto_1343931 ) ) ( not ( = ?auto_1343934 ?auto_1343932 ) ) ( TRUCK-AT ?auto_1343935 ?auto_1343937 ) ( not ( = ?auto_1343937 ?auto_1343936 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1343935 ?auto_1343937 ?auto_1343936 )
      ( MAKE-2CRATE ?auto_1343934 ?auto_1343931 ?auto_1343932 )
      ( MAKE-1CRATE-VERIFY ?auto_1343931 ?auto_1343932 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1343938 - SURFACE
      ?auto_1343939 - SURFACE
      ?auto_1343940 - SURFACE
    )
    :vars
    (
      ?auto_1343941 - HOIST
      ?auto_1343944 - PLACE
      ?auto_1343942 - TRUCK
      ?auto_1343943 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343941 ?auto_1343944 ) ( SURFACE-AT ?auto_1343939 ?auto_1343944 ) ( CLEAR ?auto_1343939 ) ( IS-CRATE ?auto_1343940 ) ( not ( = ?auto_1343939 ?auto_1343940 ) ) ( AVAILABLE ?auto_1343941 ) ( IN ?auto_1343940 ?auto_1343942 ) ( ON ?auto_1343939 ?auto_1343938 ) ( not ( = ?auto_1343938 ?auto_1343939 ) ) ( not ( = ?auto_1343938 ?auto_1343940 ) ) ( TRUCK-AT ?auto_1343942 ?auto_1343943 ) ( not ( = ?auto_1343943 ?auto_1343944 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1343939 ?auto_1343940 )
      ( MAKE-2CRATE-VERIFY ?auto_1343938 ?auto_1343939 ?auto_1343940 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1343945 - SURFACE
      ?auto_1343946 - SURFACE
    )
    :vars
    (
      ?auto_1343949 - HOIST
      ?auto_1343948 - PLACE
      ?auto_1343947 - SURFACE
      ?auto_1343950 - TRUCK
      ?auto_1343951 - PLACE
      ?auto_1343952 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343949 ?auto_1343948 ) ( SURFACE-AT ?auto_1343945 ?auto_1343948 ) ( CLEAR ?auto_1343945 ) ( IS-CRATE ?auto_1343946 ) ( not ( = ?auto_1343945 ?auto_1343946 ) ) ( AVAILABLE ?auto_1343949 ) ( ON ?auto_1343945 ?auto_1343947 ) ( not ( = ?auto_1343947 ?auto_1343945 ) ) ( not ( = ?auto_1343947 ?auto_1343946 ) ) ( TRUCK-AT ?auto_1343950 ?auto_1343951 ) ( not ( = ?auto_1343951 ?auto_1343948 ) ) ( HOIST-AT ?auto_1343952 ?auto_1343951 ) ( LIFTING ?auto_1343952 ?auto_1343946 ) ( not ( = ?auto_1343949 ?auto_1343952 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1343952 ?auto_1343946 ?auto_1343950 ?auto_1343951 )
      ( MAKE-2CRATE ?auto_1343947 ?auto_1343945 ?auto_1343946 )
      ( MAKE-1CRATE-VERIFY ?auto_1343945 ?auto_1343946 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1343953 - SURFACE
      ?auto_1343954 - SURFACE
      ?auto_1343955 - SURFACE
    )
    :vars
    (
      ?auto_1343960 - HOIST
      ?auto_1343956 - PLACE
      ?auto_1343958 - TRUCK
      ?auto_1343957 - PLACE
      ?auto_1343959 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343960 ?auto_1343956 ) ( SURFACE-AT ?auto_1343954 ?auto_1343956 ) ( CLEAR ?auto_1343954 ) ( IS-CRATE ?auto_1343955 ) ( not ( = ?auto_1343954 ?auto_1343955 ) ) ( AVAILABLE ?auto_1343960 ) ( ON ?auto_1343954 ?auto_1343953 ) ( not ( = ?auto_1343953 ?auto_1343954 ) ) ( not ( = ?auto_1343953 ?auto_1343955 ) ) ( TRUCK-AT ?auto_1343958 ?auto_1343957 ) ( not ( = ?auto_1343957 ?auto_1343956 ) ) ( HOIST-AT ?auto_1343959 ?auto_1343957 ) ( LIFTING ?auto_1343959 ?auto_1343955 ) ( not ( = ?auto_1343960 ?auto_1343959 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1343954 ?auto_1343955 )
      ( MAKE-2CRATE-VERIFY ?auto_1343953 ?auto_1343954 ?auto_1343955 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1343961 - SURFACE
      ?auto_1343962 - SURFACE
    )
    :vars
    (
      ?auto_1343967 - HOIST
      ?auto_1343963 - PLACE
      ?auto_1343968 - SURFACE
      ?auto_1343965 - TRUCK
      ?auto_1343964 - PLACE
      ?auto_1343966 - HOIST
      ?auto_1343969 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343967 ?auto_1343963 ) ( SURFACE-AT ?auto_1343961 ?auto_1343963 ) ( CLEAR ?auto_1343961 ) ( IS-CRATE ?auto_1343962 ) ( not ( = ?auto_1343961 ?auto_1343962 ) ) ( AVAILABLE ?auto_1343967 ) ( ON ?auto_1343961 ?auto_1343968 ) ( not ( = ?auto_1343968 ?auto_1343961 ) ) ( not ( = ?auto_1343968 ?auto_1343962 ) ) ( TRUCK-AT ?auto_1343965 ?auto_1343964 ) ( not ( = ?auto_1343964 ?auto_1343963 ) ) ( HOIST-AT ?auto_1343966 ?auto_1343964 ) ( not ( = ?auto_1343967 ?auto_1343966 ) ) ( AVAILABLE ?auto_1343966 ) ( SURFACE-AT ?auto_1343962 ?auto_1343964 ) ( ON ?auto_1343962 ?auto_1343969 ) ( CLEAR ?auto_1343962 ) ( not ( = ?auto_1343961 ?auto_1343969 ) ) ( not ( = ?auto_1343962 ?auto_1343969 ) ) ( not ( = ?auto_1343968 ?auto_1343969 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1343966 ?auto_1343962 ?auto_1343969 ?auto_1343964 )
      ( MAKE-2CRATE ?auto_1343968 ?auto_1343961 ?auto_1343962 )
      ( MAKE-1CRATE-VERIFY ?auto_1343961 ?auto_1343962 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1343970 - SURFACE
      ?auto_1343971 - SURFACE
      ?auto_1343972 - SURFACE
    )
    :vars
    (
      ?auto_1343974 - HOIST
      ?auto_1343978 - PLACE
      ?auto_1343976 - TRUCK
      ?auto_1343977 - PLACE
      ?auto_1343975 - HOIST
      ?auto_1343973 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343974 ?auto_1343978 ) ( SURFACE-AT ?auto_1343971 ?auto_1343978 ) ( CLEAR ?auto_1343971 ) ( IS-CRATE ?auto_1343972 ) ( not ( = ?auto_1343971 ?auto_1343972 ) ) ( AVAILABLE ?auto_1343974 ) ( ON ?auto_1343971 ?auto_1343970 ) ( not ( = ?auto_1343970 ?auto_1343971 ) ) ( not ( = ?auto_1343970 ?auto_1343972 ) ) ( TRUCK-AT ?auto_1343976 ?auto_1343977 ) ( not ( = ?auto_1343977 ?auto_1343978 ) ) ( HOIST-AT ?auto_1343975 ?auto_1343977 ) ( not ( = ?auto_1343974 ?auto_1343975 ) ) ( AVAILABLE ?auto_1343975 ) ( SURFACE-AT ?auto_1343972 ?auto_1343977 ) ( ON ?auto_1343972 ?auto_1343973 ) ( CLEAR ?auto_1343972 ) ( not ( = ?auto_1343971 ?auto_1343973 ) ) ( not ( = ?auto_1343972 ?auto_1343973 ) ) ( not ( = ?auto_1343970 ?auto_1343973 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1343971 ?auto_1343972 )
      ( MAKE-2CRATE-VERIFY ?auto_1343970 ?auto_1343971 ?auto_1343972 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1343979 - SURFACE
      ?auto_1343980 - SURFACE
    )
    :vars
    (
      ?auto_1343982 - HOIST
      ?auto_1343983 - PLACE
      ?auto_1343987 - SURFACE
      ?auto_1343981 - PLACE
      ?auto_1343986 - HOIST
      ?auto_1343984 - SURFACE
      ?auto_1343985 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343982 ?auto_1343983 ) ( SURFACE-AT ?auto_1343979 ?auto_1343983 ) ( CLEAR ?auto_1343979 ) ( IS-CRATE ?auto_1343980 ) ( not ( = ?auto_1343979 ?auto_1343980 ) ) ( AVAILABLE ?auto_1343982 ) ( ON ?auto_1343979 ?auto_1343987 ) ( not ( = ?auto_1343987 ?auto_1343979 ) ) ( not ( = ?auto_1343987 ?auto_1343980 ) ) ( not ( = ?auto_1343981 ?auto_1343983 ) ) ( HOIST-AT ?auto_1343986 ?auto_1343981 ) ( not ( = ?auto_1343982 ?auto_1343986 ) ) ( AVAILABLE ?auto_1343986 ) ( SURFACE-AT ?auto_1343980 ?auto_1343981 ) ( ON ?auto_1343980 ?auto_1343984 ) ( CLEAR ?auto_1343980 ) ( not ( = ?auto_1343979 ?auto_1343984 ) ) ( not ( = ?auto_1343980 ?auto_1343984 ) ) ( not ( = ?auto_1343987 ?auto_1343984 ) ) ( TRUCK-AT ?auto_1343985 ?auto_1343983 ) )
    :subtasks
    ( ( !DRIVE ?auto_1343985 ?auto_1343983 ?auto_1343981 )
      ( MAKE-2CRATE ?auto_1343987 ?auto_1343979 ?auto_1343980 )
      ( MAKE-1CRATE-VERIFY ?auto_1343979 ?auto_1343980 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1343988 - SURFACE
      ?auto_1343989 - SURFACE
      ?auto_1343990 - SURFACE
    )
    :vars
    (
      ?auto_1343994 - HOIST
      ?auto_1343995 - PLACE
      ?auto_1343992 - PLACE
      ?auto_1343996 - HOIST
      ?auto_1343993 - SURFACE
      ?auto_1343991 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343994 ?auto_1343995 ) ( SURFACE-AT ?auto_1343989 ?auto_1343995 ) ( CLEAR ?auto_1343989 ) ( IS-CRATE ?auto_1343990 ) ( not ( = ?auto_1343989 ?auto_1343990 ) ) ( AVAILABLE ?auto_1343994 ) ( ON ?auto_1343989 ?auto_1343988 ) ( not ( = ?auto_1343988 ?auto_1343989 ) ) ( not ( = ?auto_1343988 ?auto_1343990 ) ) ( not ( = ?auto_1343992 ?auto_1343995 ) ) ( HOIST-AT ?auto_1343996 ?auto_1343992 ) ( not ( = ?auto_1343994 ?auto_1343996 ) ) ( AVAILABLE ?auto_1343996 ) ( SURFACE-AT ?auto_1343990 ?auto_1343992 ) ( ON ?auto_1343990 ?auto_1343993 ) ( CLEAR ?auto_1343990 ) ( not ( = ?auto_1343989 ?auto_1343993 ) ) ( not ( = ?auto_1343990 ?auto_1343993 ) ) ( not ( = ?auto_1343988 ?auto_1343993 ) ) ( TRUCK-AT ?auto_1343991 ?auto_1343995 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1343989 ?auto_1343990 )
      ( MAKE-2CRATE-VERIFY ?auto_1343988 ?auto_1343989 ?auto_1343990 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1343997 - SURFACE
      ?auto_1343998 - SURFACE
    )
    :vars
    (
      ?auto_1344001 - HOIST
      ?auto_1344003 - PLACE
      ?auto_1344005 - SURFACE
      ?auto_1344002 - PLACE
      ?auto_1343999 - HOIST
      ?auto_1344004 - SURFACE
      ?auto_1344000 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344001 ?auto_1344003 ) ( IS-CRATE ?auto_1343998 ) ( not ( = ?auto_1343997 ?auto_1343998 ) ) ( not ( = ?auto_1344005 ?auto_1343997 ) ) ( not ( = ?auto_1344005 ?auto_1343998 ) ) ( not ( = ?auto_1344002 ?auto_1344003 ) ) ( HOIST-AT ?auto_1343999 ?auto_1344002 ) ( not ( = ?auto_1344001 ?auto_1343999 ) ) ( AVAILABLE ?auto_1343999 ) ( SURFACE-AT ?auto_1343998 ?auto_1344002 ) ( ON ?auto_1343998 ?auto_1344004 ) ( CLEAR ?auto_1343998 ) ( not ( = ?auto_1343997 ?auto_1344004 ) ) ( not ( = ?auto_1343998 ?auto_1344004 ) ) ( not ( = ?auto_1344005 ?auto_1344004 ) ) ( TRUCK-AT ?auto_1344000 ?auto_1344003 ) ( SURFACE-AT ?auto_1344005 ?auto_1344003 ) ( CLEAR ?auto_1344005 ) ( LIFTING ?auto_1344001 ?auto_1343997 ) ( IS-CRATE ?auto_1343997 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1344005 ?auto_1343997 )
      ( MAKE-2CRATE ?auto_1344005 ?auto_1343997 ?auto_1343998 )
      ( MAKE-1CRATE-VERIFY ?auto_1343997 ?auto_1343998 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1344006 - SURFACE
      ?auto_1344007 - SURFACE
      ?auto_1344008 - SURFACE
    )
    :vars
    (
      ?auto_1344009 - HOIST
      ?auto_1344010 - PLACE
      ?auto_1344014 - PLACE
      ?auto_1344013 - HOIST
      ?auto_1344012 - SURFACE
      ?auto_1344011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344009 ?auto_1344010 ) ( IS-CRATE ?auto_1344008 ) ( not ( = ?auto_1344007 ?auto_1344008 ) ) ( not ( = ?auto_1344006 ?auto_1344007 ) ) ( not ( = ?auto_1344006 ?auto_1344008 ) ) ( not ( = ?auto_1344014 ?auto_1344010 ) ) ( HOIST-AT ?auto_1344013 ?auto_1344014 ) ( not ( = ?auto_1344009 ?auto_1344013 ) ) ( AVAILABLE ?auto_1344013 ) ( SURFACE-AT ?auto_1344008 ?auto_1344014 ) ( ON ?auto_1344008 ?auto_1344012 ) ( CLEAR ?auto_1344008 ) ( not ( = ?auto_1344007 ?auto_1344012 ) ) ( not ( = ?auto_1344008 ?auto_1344012 ) ) ( not ( = ?auto_1344006 ?auto_1344012 ) ) ( TRUCK-AT ?auto_1344011 ?auto_1344010 ) ( SURFACE-AT ?auto_1344006 ?auto_1344010 ) ( CLEAR ?auto_1344006 ) ( LIFTING ?auto_1344009 ?auto_1344007 ) ( IS-CRATE ?auto_1344007 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1344007 ?auto_1344008 )
      ( MAKE-2CRATE-VERIFY ?auto_1344006 ?auto_1344007 ?auto_1344008 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1344015 - SURFACE
      ?auto_1344016 - SURFACE
    )
    :vars
    (
      ?auto_1344023 - HOIST
      ?auto_1344022 - PLACE
      ?auto_1344020 - SURFACE
      ?auto_1344018 - PLACE
      ?auto_1344021 - HOIST
      ?auto_1344019 - SURFACE
      ?auto_1344017 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344023 ?auto_1344022 ) ( IS-CRATE ?auto_1344016 ) ( not ( = ?auto_1344015 ?auto_1344016 ) ) ( not ( = ?auto_1344020 ?auto_1344015 ) ) ( not ( = ?auto_1344020 ?auto_1344016 ) ) ( not ( = ?auto_1344018 ?auto_1344022 ) ) ( HOIST-AT ?auto_1344021 ?auto_1344018 ) ( not ( = ?auto_1344023 ?auto_1344021 ) ) ( AVAILABLE ?auto_1344021 ) ( SURFACE-AT ?auto_1344016 ?auto_1344018 ) ( ON ?auto_1344016 ?auto_1344019 ) ( CLEAR ?auto_1344016 ) ( not ( = ?auto_1344015 ?auto_1344019 ) ) ( not ( = ?auto_1344016 ?auto_1344019 ) ) ( not ( = ?auto_1344020 ?auto_1344019 ) ) ( TRUCK-AT ?auto_1344017 ?auto_1344022 ) ( SURFACE-AT ?auto_1344020 ?auto_1344022 ) ( CLEAR ?auto_1344020 ) ( IS-CRATE ?auto_1344015 ) ( AVAILABLE ?auto_1344023 ) ( IN ?auto_1344015 ?auto_1344017 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1344023 ?auto_1344015 ?auto_1344017 ?auto_1344022 )
      ( MAKE-2CRATE ?auto_1344020 ?auto_1344015 ?auto_1344016 )
      ( MAKE-1CRATE-VERIFY ?auto_1344015 ?auto_1344016 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1344024 - SURFACE
      ?auto_1344025 - SURFACE
      ?auto_1344026 - SURFACE
    )
    :vars
    (
      ?auto_1344030 - HOIST
      ?auto_1344031 - PLACE
      ?auto_1344027 - PLACE
      ?auto_1344028 - HOIST
      ?auto_1344029 - SURFACE
      ?auto_1344032 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344030 ?auto_1344031 ) ( IS-CRATE ?auto_1344026 ) ( not ( = ?auto_1344025 ?auto_1344026 ) ) ( not ( = ?auto_1344024 ?auto_1344025 ) ) ( not ( = ?auto_1344024 ?auto_1344026 ) ) ( not ( = ?auto_1344027 ?auto_1344031 ) ) ( HOIST-AT ?auto_1344028 ?auto_1344027 ) ( not ( = ?auto_1344030 ?auto_1344028 ) ) ( AVAILABLE ?auto_1344028 ) ( SURFACE-AT ?auto_1344026 ?auto_1344027 ) ( ON ?auto_1344026 ?auto_1344029 ) ( CLEAR ?auto_1344026 ) ( not ( = ?auto_1344025 ?auto_1344029 ) ) ( not ( = ?auto_1344026 ?auto_1344029 ) ) ( not ( = ?auto_1344024 ?auto_1344029 ) ) ( TRUCK-AT ?auto_1344032 ?auto_1344031 ) ( SURFACE-AT ?auto_1344024 ?auto_1344031 ) ( CLEAR ?auto_1344024 ) ( IS-CRATE ?auto_1344025 ) ( AVAILABLE ?auto_1344030 ) ( IN ?auto_1344025 ?auto_1344032 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1344025 ?auto_1344026 )
      ( MAKE-2CRATE-VERIFY ?auto_1344024 ?auto_1344025 ?auto_1344026 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1344069 - SURFACE
      ?auto_1344070 - SURFACE
    )
    :vars
    (
      ?auto_1344073 - HOIST
      ?auto_1344076 - PLACE
      ?auto_1344075 - SURFACE
      ?auto_1344071 - PLACE
      ?auto_1344077 - HOIST
      ?auto_1344072 - SURFACE
      ?auto_1344074 - TRUCK
      ?auto_1344078 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344073 ?auto_1344076 ) ( SURFACE-AT ?auto_1344069 ?auto_1344076 ) ( CLEAR ?auto_1344069 ) ( IS-CRATE ?auto_1344070 ) ( not ( = ?auto_1344069 ?auto_1344070 ) ) ( AVAILABLE ?auto_1344073 ) ( ON ?auto_1344069 ?auto_1344075 ) ( not ( = ?auto_1344075 ?auto_1344069 ) ) ( not ( = ?auto_1344075 ?auto_1344070 ) ) ( not ( = ?auto_1344071 ?auto_1344076 ) ) ( HOIST-AT ?auto_1344077 ?auto_1344071 ) ( not ( = ?auto_1344073 ?auto_1344077 ) ) ( AVAILABLE ?auto_1344077 ) ( SURFACE-AT ?auto_1344070 ?auto_1344071 ) ( ON ?auto_1344070 ?auto_1344072 ) ( CLEAR ?auto_1344070 ) ( not ( = ?auto_1344069 ?auto_1344072 ) ) ( not ( = ?auto_1344070 ?auto_1344072 ) ) ( not ( = ?auto_1344075 ?auto_1344072 ) ) ( TRUCK-AT ?auto_1344074 ?auto_1344078 ) ( not ( = ?auto_1344078 ?auto_1344076 ) ) ( not ( = ?auto_1344071 ?auto_1344078 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1344074 ?auto_1344078 ?auto_1344076 )
      ( MAKE-1CRATE ?auto_1344069 ?auto_1344070 )
      ( MAKE-1CRATE-VERIFY ?auto_1344069 ?auto_1344070 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1344108 - SURFACE
      ?auto_1344109 - SURFACE
      ?auto_1344110 - SURFACE
      ?auto_1344111 - SURFACE
    )
    :vars
    (
      ?auto_1344112 - HOIST
      ?auto_1344113 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344112 ?auto_1344113 ) ( SURFACE-AT ?auto_1344110 ?auto_1344113 ) ( CLEAR ?auto_1344110 ) ( LIFTING ?auto_1344112 ?auto_1344111 ) ( IS-CRATE ?auto_1344111 ) ( not ( = ?auto_1344110 ?auto_1344111 ) ) ( ON ?auto_1344109 ?auto_1344108 ) ( ON ?auto_1344110 ?auto_1344109 ) ( not ( = ?auto_1344108 ?auto_1344109 ) ) ( not ( = ?auto_1344108 ?auto_1344110 ) ) ( not ( = ?auto_1344108 ?auto_1344111 ) ) ( not ( = ?auto_1344109 ?auto_1344110 ) ) ( not ( = ?auto_1344109 ?auto_1344111 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1344110 ?auto_1344111 )
      ( MAKE-3CRATE-VERIFY ?auto_1344108 ?auto_1344109 ?auto_1344110 ?auto_1344111 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1344125 - SURFACE
      ?auto_1344126 - SURFACE
      ?auto_1344127 - SURFACE
      ?auto_1344128 - SURFACE
    )
    :vars
    (
      ?auto_1344131 - HOIST
      ?auto_1344129 - PLACE
      ?auto_1344130 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344131 ?auto_1344129 ) ( SURFACE-AT ?auto_1344127 ?auto_1344129 ) ( CLEAR ?auto_1344127 ) ( IS-CRATE ?auto_1344128 ) ( not ( = ?auto_1344127 ?auto_1344128 ) ) ( TRUCK-AT ?auto_1344130 ?auto_1344129 ) ( AVAILABLE ?auto_1344131 ) ( IN ?auto_1344128 ?auto_1344130 ) ( ON ?auto_1344127 ?auto_1344126 ) ( not ( = ?auto_1344126 ?auto_1344127 ) ) ( not ( = ?auto_1344126 ?auto_1344128 ) ) ( ON ?auto_1344126 ?auto_1344125 ) ( not ( = ?auto_1344125 ?auto_1344126 ) ) ( not ( = ?auto_1344125 ?auto_1344127 ) ) ( not ( = ?auto_1344125 ?auto_1344128 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344126 ?auto_1344127 ?auto_1344128 )
      ( MAKE-3CRATE-VERIFY ?auto_1344125 ?auto_1344126 ?auto_1344127 ?auto_1344128 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1344146 - SURFACE
      ?auto_1344147 - SURFACE
      ?auto_1344148 - SURFACE
      ?auto_1344149 - SURFACE
    )
    :vars
    (
      ?auto_1344151 - HOIST
      ?auto_1344153 - PLACE
      ?auto_1344152 - TRUCK
      ?auto_1344150 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344151 ?auto_1344153 ) ( SURFACE-AT ?auto_1344148 ?auto_1344153 ) ( CLEAR ?auto_1344148 ) ( IS-CRATE ?auto_1344149 ) ( not ( = ?auto_1344148 ?auto_1344149 ) ) ( AVAILABLE ?auto_1344151 ) ( IN ?auto_1344149 ?auto_1344152 ) ( ON ?auto_1344148 ?auto_1344147 ) ( not ( = ?auto_1344147 ?auto_1344148 ) ) ( not ( = ?auto_1344147 ?auto_1344149 ) ) ( TRUCK-AT ?auto_1344152 ?auto_1344150 ) ( not ( = ?auto_1344150 ?auto_1344153 ) ) ( ON ?auto_1344147 ?auto_1344146 ) ( not ( = ?auto_1344146 ?auto_1344147 ) ) ( not ( = ?auto_1344146 ?auto_1344148 ) ) ( not ( = ?auto_1344146 ?auto_1344149 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344147 ?auto_1344148 ?auto_1344149 )
      ( MAKE-3CRATE-VERIFY ?auto_1344146 ?auto_1344147 ?auto_1344148 ?auto_1344149 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1344170 - SURFACE
      ?auto_1344171 - SURFACE
      ?auto_1344172 - SURFACE
      ?auto_1344173 - SURFACE
    )
    :vars
    (
      ?auto_1344176 - HOIST
      ?auto_1344175 - PLACE
      ?auto_1344177 - TRUCK
      ?auto_1344174 - PLACE
      ?auto_1344178 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344176 ?auto_1344175 ) ( SURFACE-AT ?auto_1344172 ?auto_1344175 ) ( CLEAR ?auto_1344172 ) ( IS-CRATE ?auto_1344173 ) ( not ( = ?auto_1344172 ?auto_1344173 ) ) ( AVAILABLE ?auto_1344176 ) ( ON ?auto_1344172 ?auto_1344171 ) ( not ( = ?auto_1344171 ?auto_1344172 ) ) ( not ( = ?auto_1344171 ?auto_1344173 ) ) ( TRUCK-AT ?auto_1344177 ?auto_1344174 ) ( not ( = ?auto_1344174 ?auto_1344175 ) ) ( HOIST-AT ?auto_1344178 ?auto_1344174 ) ( LIFTING ?auto_1344178 ?auto_1344173 ) ( not ( = ?auto_1344176 ?auto_1344178 ) ) ( ON ?auto_1344171 ?auto_1344170 ) ( not ( = ?auto_1344170 ?auto_1344171 ) ) ( not ( = ?auto_1344170 ?auto_1344172 ) ) ( not ( = ?auto_1344170 ?auto_1344173 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344171 ?auto_1344172 ?auto_1344173 )
      ( MAKE-3CRATE-VERIFY ?auto_1344170 ?auto_1344171 ?auto_1344172 ?auto_1344173 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1344197 - SURFACE
      ?auto_1344198 - SURFACE
      ?auto_1344199 - SURFACE
      ?auto_1344200 - SURFACE
    )
    :vars
    (
      ?auto_1344203 - HOIST
      ?auto_1344206 - PLACE
      ?auto_1344204 - TRUCK
      ?auto_1344201 - PLACE
      ?auto_1344202 - HOIST
      ?auto_1344205 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344203 ?auto_1344206 ) ( SURFACE-AT ?auto_1344199 ?auto_1344206 ) ( CLEAR ?auto_1344199 ) ( IS-CRATE ?auto_1344200 ) ( not ( = ?auto_1344199 ?auto_1344200 ) ) ( AVAILABLE ?auto_1344203 ) ( ON ?auto_1344199 ?auto_1344198 ) ( not ( = ?auto_1344198 ?auto_1344199 ) ) ( not ( = ?auto_1344198 ?auto_1344200 ) ) ( TRUCK-AT ?auto_1344204 ?auto_1344201 ) ( not ( = ?auto_1344201 ?auto_1344206 ) ) ( HOIST-AT ?auto_1344202 ?auto_1344201 ) ( not ( = ?auto_1344203 ?auto_1344202 ) ) ( AVAILABLE ?auto_1344202 ) ( SURFACE-AT ?auto_1344200 ?auto_1344201 ) ( ON ?auto_1344200 ?auto_1344205 ) ( CLEAR ?auto_1344200 ) ( not ( = ?auto_1344199 ?auto_1344205 ) ) ( not ( = ?auto_1344200 ?auto_1344205 ) ) ( not ( = ?auto_1344198 ?auto_1344205 ) ) ( ON ?auto_1344198 ?auto_1344197 ) ( not ( = ?auto_1344197 ?auto_1344198 ) ) ( not ( = ?auto_1344197 ?auto_1344199 ) ) ( not ( = ?auto_1344197 ?auto_1344200 ) ) ( not ( = ?auto_1344197 ?auto_1344205 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344198 ?auto_1344199 ?auto_1344200 )
      ( MAKE-3CRATE-VERIFY ?auto_1344197 ?auto_1344198 ?auto_1344199 ?auto_1344200 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1344225 - SURFACE
      ?auto_1344226 - SURFACE
      ?auto_1344227 - SURFACE
      ?auto_1344228 - SURFACE
    )
    :vars
    (
      ?auto_1344234 - HOIST
      ?auto_1344232 - PLACE
      ?auto_1344229 - PLACE
      ?auto_1344230 - HOIST
      ?auto_1344231 - SURFACE
      ?auto_1344233 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344234 ?auto_1344232 ) ( SURFACE-AT ?auto_1344227 ?auto_1344232 ) ( CLEAR ?auto_1344227 ) ( IS-CRATE ?auto_1344228 ) ( not ( = ?auto_1344227 ?auto_1344228 ) ) ( AVAILABLE ?auto_1344234 ) ( ON ?auto_1344227 ?auto_1344226 ) ( not ( = ?auto_1344226 ?auto_1344227 ) ) ( not ( = ?auto_1344226 ?auto_1344228 ) ) ( not ( = ?auto_1344229 ?auto_1344232 ) ) ( HOIST-AT ?auto_1344230 ?auto_1344229 ) ( not ( = ?auto_1344234 ?auto_1344230 ) ) ( AVAILABLE ?auto_1344230 ) ( SURFACE-AT ?auto_1344228 ?auto_1344229 ) ( ON ?auto_1344228 ?auto_1344231 ) ( CLEAR ?auto_1344228 ) ( not ( = ?auto_1344227 ?auto_1344231 ) ) ( not ( = ?auto_1344228 ?auto_1344231 ) ) ( not ( = ?auto_1344226 ?auto_1344231 ) ) ( TRUCK-AT ?auto_1344233 ?auto_1344232 ) ( ON ?auto_1344226 ?auto_1344225 ) ( not ( = ?auto_1344225 ?auto_1344226 ) ) ( not ( = ?auto_1344225 ?auto_1344227 ) ) ( not ( = ?auto_1344225 ?auto_1344228 ) ) ( not ( = ?auto_1344225 ?auto_1344231 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344226 ?auto_1344227 ?auto_1344228 )
      ( MAKE-3CRATE-VERIFY ?auto_1344225 ?auto_1344226 ?auto_1344227 ?auto_1344228 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1344253 - SURFACE
      ?auto_1344254 - SURFACE
      ?auto_1344255 - SURFACE
      ?auto_1344256 - SURFACE
    )
    :vars
    (
      ?auto_1344261 - HOIST
      ?auto_1344257 - PLACE
      ?auto_1344262 - PLACE
      ?auto_1344260 - HOIST
      ?auto_1344259 - SURFACE
      ?auto_1344258 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344261 ?auto_1344257 ) ( IS-CRATE ?auto_1344256 ) ( not ( = ?auto_1344255 ?auto_1344256 ) ) ( not ( = ?auto_1344254 ?auto_1344255 ) ) ( not ( = ?auto_1344254 ?auto_1344256 ) ) ( not ( = ?auto_1344262 ?auto_1344257 ) ) ( HOIST-AT ?auto_1344260 ?auto_1344262 ) ( not ( = ?auto_1344261 ?auto_1344260 ) ) ( AVAILABLE ?auto_1344260 ) ( SURFACE-AT ?auto_1344256 ?auto_1344262 ) ( ON ?auto_1344256 ?auto_1344259 ) ( CLEAR ?auto_1344256 ) ( not ( = ?auto_1344255 ?auto_1344259 ) ) ( not ( = ?auto_1344256 ?auto_1344259 ) ) ( not ( = ?auto_1344254 ?auto_1344259 ) ) ( TRUCK-AT ?auto_1344258 ?auto_1344257 ) ( SURFACE-AT ?auto_1344254 ?auto_1344257 ) ( CLEAR ?auto_1344254 ) ( LIFTING ?auto_1344261 ?auto_1344255 ) ( IS-CRATE ?auto_1344255 ) ( ON ?auto_1344254 ?auto_1344253 ) ( not ( = ?auto_1344253 ?auto_1344254 ) ) ( not ( = ?auto_1344253 ?auto_1344255 ) ) ( not ( = ?auto_1344253 ?auto_1344256 ) ) ( not ( = ?auto_1344253 ?auto_1344259 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344254 ?auto_1344255 ?auto_1344256 )
      ( MAKE-3CRATE-VERIFY ?auto_1344253 ?auto_1344254 ?auto_1344255 ?auto_1344256 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1344281 - SURFACE
      ?auto_1344282 - SURFACE
      ?auto_1344283 - SURFACE
      ?auto_1344284 - SURFACE
    )
    :vars
    (
      ?auto_1344286 - HOIST
      ?auto_1344288 - PLACE
      ?auto_1344290 - PLACE
      ?auto_1344285 - HOIST
      ?auto_1344287 - SURFACE
      ?auto_1344289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344286 ?auto_1344288 ) ( IS-CRATE ?auto_1344284 ) ( not ( = ?auto_1344283 ?auto_1344284 ) ) ( not ( = ?auto_1344282 ?auto_1344283 ) ) ( not ( = ?auto_1344282 ?auto_1344284 ) ) ( not ( = ?auto_1344290 ?auto_1344288 ) ) ( HOIST-AT ?auto_1344285 ?auto_1344290 ) ( not ( = ?auto_1344286 ?auto_1344285 ) ) ( AVAILABLE ?auto_1344285 ) ( SURFACE-AT ?auto_1344284 ?auto_1344290 ) ( ON ?auto_1344284 ?auto_1344287 ) ( CLEAR ?auto_1344284 ) ( not ( = ?auto_1344283 ?auto_1344287 ) ) ( not ( = ?auto_1344284 ?auto_1344287 ) ) ( not ( = ?auto_1344282 ?auto_1344287 ) ) ( TRUCK-AT ?auto_1344289 ?auto_1344288 ) ( SURFACE-AT ?auto_1344282 ?auto_1344288 ) ( CLEAR ?auto_1344282 ) ( IS-CRATE ?auto_1344283 ) ( AVAILABLE ?auto_1344286 ) ( IN ?auto_1344283 ?auto_1344289 ) ( ON ?auto_1344282 ?auto_1344281 ) ( not ( = ?auto_1344281 ?auto_1344282 ) ) ( not ( = ?auto_1344281 ?auto_1344283 ) ) ( not ( = ?auto_1344281 ?auto_1344284 ) ) ( not ( = ?auto_1344281 ?auto_1344287 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344282 ?auto_1344283 ?auto_1344284 )
      ( MAKE-3CRATE-VERIFY ?auto_1344281 ?auto_1344282 ?auto_1344283 ?auto_1344284 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1344572 - SURFACE
      ?auto_1344573 - SURFACE
      ?auto_1344574 - SURFACE
      ?auto_1344575 - SURFACE
      ?auto_1344576 - SURFACE
    )
    :vars
    (
      ?auto_1344577 - HOIST
      ?auto_1344578 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344577 ?auto_1344578 ) ( SURFACE-AT ?auto_1344575 ?auto_1344578 ) ( CLEAR ?auto_1344575 ) ( LIFTING ?auto_1344577 ?auto_1344576 ) ( IS-CRATE ?auto_1344576 ) ( not ( = ?auto_1344575 ?auto_1344576 ) ) ( ON ?auto_1344573 ?auto_1344572 ) ( ON ?auto_1344574 ?auto_1344573 ) ( ON ?auto_1344575 ?auto_1344574 ) ( not ( = ?auto_1344572 ?auto_1344573 ) ) ( not ( = ?auto_1344572 ?auto_1344574 ) ) ( not ( = ?auto_1344572 ?auto_1344575 ) ) ( not ( = ?auto_1344572 ?auto_1344576 ) ) ( not ( = ?auto_1344573 ?auto_1344574 ) ) ( not ( = ?auto_1344573 ?auto_1344575 ) ) ( not ( = ?auto_1344573 ?auto_1344576 ) ) ( not ( = ?auto_1344574 ?auto_1344575 ) ) ( not ( = ?auto_1344574 ?auto_1344576 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1344575 ?auto_1344576 )
      ( MAKE-4CRATE-VERIFY ?auto_1344572 ?auto_1344573 ?auto_1344574 ?auto_1344575 ?auto_1344576 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1344597 - SURFACE
      ?auto_1344598 - SURFACE
      ?auto_1344599 - SURFACE
      ?auto_1344600 - SURFACE
      ?auto_1344601 - SURFACE
    )
    :vars
    (
      ?auto_1344604 - HOIST
      ?auto_1344602 - PLACE
      ?auto_1344603 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344604 ?auto_1344602 ) ( SURFACE-AT ?auto_1344600 ?auto_1344602 ) ( CLEAR ?auto_1344600 ) ( IS-CRATE ?auto_1344601 ) ( not ( = ?auto_1344600 ?auto_1344601 ) ) ( TRUCK-AT ?auto_1344603 ?auto_1344602 ) ( AVAILABLE ?auto_1344604 ) ( IN ?auto_1344601 ?auto_1344603 ) ( ON ?auto_1344600 ?auto_1344599 ) ( not ( = ?auto_1344599 ?auto_1344600 ) ) ( not ( = ?auto_1344599 ?auto_1344601 ) ) ( ON ?auto_1344598 ?auto_1344597 ) ( ON ?auto_1344599 ?auto_1344598 ) ( not ( = ?auto_1344597 ?auto_1344598 ) ) ( not ( = ?auto_1344597 ?auto_1344599 ) ) ( not ( = ?auto_1344597 ?auto_1344600 ) ) ( not ( = ?auto_1344597 ?auto_1344601 ) ) ( not ( = ?auto_1344598 ?auto_1344599 ) ) ( not ( = ?auto_1344598 ?auto_1344600 ) ) ( not ( = ?auto_1344598 ?auto_1344601 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344599 ?auto_1344600 ?auto_1344601 )
      ( MAKE-4CRATE-VERIFY ?auto_1344597 ?auto_1344598 ?auto_1344599 ?auto_1344600 ?auto_1344601 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1344627 - SURFACE
      ?auto_1344628 - SURFACE
      ?auto_1344629 - SURFACE
      ?auto_1344630 - SURFACE
      ?auto_1344631 - SURFACE
    )
    :vars
    (
      ?auto_1344634 - HOIST
      ?auto_1344632 - PLACE
      ?auto_1344633 - TRUCK
      ?auto_1344635 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344634 ?auto_1344632 ) ( SURFACE-AT ?auto_1344630 ?auto_1344632 ) ( CLEAR ?auto_1344630 ) ( IS-CRATE ?auto_1344631 ) ( not ( = ?auto_1344630 ?auto_1344631 ) ) ( AVAILABLE ?auto_1344634 ) ( IN ?auto_1344631 ?auto_1344633 ) ( ON ?auto_1344630 ?auto_1344629 ) ( not ( = ?auto_1344629 ?auto_1344630 ) ) ( not ( = ?auto_1344629 ?auto_1344631 ) ) ( TRUCK-AT ?auto_1344633 ?auto_1344635 ) ( not ( = ?auto_1344635 ?auto_1344632 ) ) ( ON ?auto_1344628 ?auto_1344627 ) ( ON ?auto_1344629 ?auto_1344628 ) ( not ( = ?auto_1344627 ?auto_1344628 ) ) ( not ( = ?auto_1344627 ?auto_1344629 ) ) ( not ( = ?auto_1344627 ?auto_1344630 ) ) ( not ( = ?auto_1344627 ?auto_1344631 ) ) ( not ( = ?auto_1344628 ?auto_1344629 ) ) ( not ( = ?auto_1344628 ?auto_1344630 ) ) ( not ( = ?auto_1344628 ?auto_1344631 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344629 ?auto_1344630 ?auto_1344631 )
      ( MAKE-4CRATE-VERIFY ?auto_1344627 ?auto_1344628 ?auto_1344629 ?auto_1344630 ?auto_1344631 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1344661 - SURFACE
      ?auto_1344662 - SURFACE
      ?auto_1344663 - SURFACE
      ?auto_1344664 - SURFACE
      ?auto_1344665 - SURFACE
    )
    :vars
    (
      ?auto_1344668 - HOIST
      ?auto_1344669 - PLACE
      ?auto_1344666 - TRUCK
      ?auto_1344667 - PLACE
      ?auto_1344670 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344668 ?auto_1344669 ) ( SURFACE-AT ?auto_1344664 ?auto_1344669 ) ( CLEAR ?auto_1344664 ) ( IS-CRATE ?auto_1344665 ) ( not ( = ?auto_1344664 ?auto_1344665 ) ) ( AVAILABLE ?auto_1344668 ) ( ON ?auto_1344664 ?auto_1344663 ) ( not ( = ?auto_1344663 ?auto_1344664 ) ) ( not ( = ?auto_1344663 ?auto_1344665 ) ) ( TRUCK-AT ?auto_1344666 ?auto_1344667 ) ( not ( = ?auto_1344667 ?auto_1344669 ) ) ( HOIST-AT ?auto_1344670 ?auto_1344667 ) ( LIFTING ?auto_1344670 ?auto_1344665 ) ( not ( = ?auto_1344668 ?auto_1344670 ) ) ( ON ?auto_1344662 ?auto_1344661 ) ( ON ?auto_1344663 ?auto_1344662 ) ( not ( = ?auto_1344661 ?auto_1344662 ) ) ( not ( = ?auto_1344661 ?auto_1344663 ) ) ( not ( = ?auto_1344661 ?auto_1344664 ) ) ( not ( = ?auto_1344661 ?auto_1344665 ) ) ( not ( = ?auto_1344662 ?auto_1344663 ) ) ( not ( = ?auto_1344662 ?auto_1344664 ) ) ( not ( = ?auto_1344662 ?auto_1344665 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344663 ?auto_1344664 ?auto_1344665 )
      ( MAKE-4CRATE-VERIFY ?auto_1344661 ?auto_1344662 ?auto_1344663 ?auto_1344664 ?auto_1344665 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1344699 - SURFACE
      ?auto_1344700 - SURFACE
      ?auto_1344701 - SURFACE
      ?auto_1344702 - SURFACE
      ?auto_1344703 - SURFACE
    )
    :vars
    (
      ?auto_1344704 - HOIST
      ?auto_1344708 - PLACE
      ?auto_1344706 - TRUCK
      ?auto_1344707 - PLACE
      ?auto_1344705 - HOIST
      ?auto_1344709 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344704 ?auto_1344708 ) ( SURFACE-AT ?auto_1344702 ?auto_1344708 ) ( CLEAR ?auto_1344702 ) ( IS-CRATE ?auto_1344703 ) ( not ( = ?auto_1344702 ?auto_1344703 ) ) ( AVAILABLE ?auto_1344704 ) ( ON ?auto_1344702 ?auto_1344701 ) ( not ( = ?auto_1344701 ?auto_1344702 ) ) ( not ( = ?auto_1344701 ?auto_1344703 ) ) ( TRUCK-AT ?auto_1344706 ?auto_1344707 ) ( not ( = ?auto_1344707 ?auto_1344708 ) ) ( HOIST-AT ?auto_1344705 ?auto_1344707 ) ( not ( = ?auto_1344704 ?auto_1344705 ) ) ( AVAILABLE ?auto_1344705 ) ( SURFACE-AT ?auto_1344703 ?auto_1344707 ) ( ON ?auto_1344703 ?auto_1344709 ) ( CLEAR ?auto_1344703 ) ( not ( = ?auto_1344702 ?auto_1344709 ) ) ( not ( = ?auto_1344703 ?auto_1344709 ) ) ( not ( = ?auto_1344701 ?auto_1344709 ) ) ( ON ?auto_1344700 ?auto_1344699 ) ( ON ?auto_1344701 ?auto_1344700 ) ( not ( = ?auto_1344699 ?auto_1344700 ) ) ( not ( = ?auto_1344699 ?auto_1344701 ) ) ( not ( = ?auto_1344699 ?auto_1344702 ) ) ( not ( = ?auto_1344699 ?auto_1344703 ) ) ( not ( = ?auto_1344699 ?auto_1344709 ) ) ( not ( = ?auto_1344700 ?auto_1344701 ) ) ( not ( = ?auto_1344700 ?auto_1344702 ) ) ( not ( = ?auto_1344700 ?auto_1344703 ) ) ( not ( = ?auto_1344700 ?auto_1344709 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344701 ?auto_1344702 ?auto_1344703 )
      ( MAKE-4CRATE-VERIFY ?auto_1344699 ?auto_1344700 ?auto_1344701 ?auto_1344702 ?auto_1344703 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1344738 - SURFACE
      ?auto_1344739 - SURFACE
      ?auto_1344740 - SURFACE
      ?auto_1344741 - SURFACE
      ?auto_1344742 - SURFACE
    )
    :vars
    (
      ?auto_1344746 - HOIST
      ?auto_1344748 - PLACE
      ?auto_1344743 - PLACE
      ?auto_1344744 - HOIST
      ?auto_1344745 - SURFACE
      ?auto_1344747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344746 ?auto_1344748 ) ( SURFACE-AT ?auto_1344741 ?auto_1344748 ) ( CLEAR ?auto_1344741 ) ( IS-CRATE ?auto_1344742 ) ( not ( = ?auto_1344741 ?auto_1344742 ) ) ( AVAILABLE ?auto_1344746 ) ( ON ?auto_1344741 ?auto_1344740 ) ( not ( = ?auto_1344740 ?auto_1344741 ) ) ( not ( = ?auto_1344740 ?auto_1344742 ) ) ( not ( = ?auto_1344743 ?auto_1344748 ) ) ( HOIST-AT ?auto_1344744 ?auto_1344743 ) ( not ( = ?auto_1344746 ?auto_1344744 ) ) ( AVAILABLE ?auto_1344744 ) ( SURFACE-AT ?auto_1344742 ?auto_1344743 ) ( ON ?auto_1344742 ?auto_1344745 ) ( CLEAR ?auto_1344742 ) ( not ( = ?auto_1344741 ?auto_1344745 ) ) ( not ( = ?auto_1344742 ?auto_1344745 ) ) ( not ( = ?auto_1344740 ?auto_1344745 ) ) ( TRUCK-AT ?auto_1344747 ?auto_1344748 ) ( ON ?auto_1344739 ?auto_1344738 ) ( ON ?auto_1344740 ?auto_1344739 ) ( not ( = ?auto_1344738 ?auto_1344739 ) ) ( not ( = ?auto_1344738 ?auto_1344740 ) ) ( not ( = ?auto_1344738 ?auto_1344741 ) ) ( not ( = ?auto_1344738 ?auto_1344742 ) ) ( not ( = ?auto_1344738 ?auto_1344745 ) ) ( not ( = ?auto_1344739 ?auto_1344740 ) ) ( not ( = ?auto_1344739 ?auto_1344741 ) ) ( not ( = ?auto_1344739 ?auto_1344742 ) ) ( not ( = ?auto_1344739 ?auto_1344745 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344740 ?auto_1344741 ?auto_1344742 )
      ( MAKE-4CRATE-VERIFY ?auto_1344738 ?auto_1344739 ?auto_1344740 ?auto_1344741 ?auto_1344742 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1344777 - SURFACE
      ?auto_1344778 - SURFACE
      ?auto_1344779 - SURFACE
      ?auto_1344780 - SURFACE
      ?auto_1344781 - SURFACE
    )
    :vars
    (
      ?auto_1344787 - HOIST
      ?auto_1344785 - PLACE
      ?auto_1344783 - PLACE
      ?auto_1344784 - HOIST
      ?auto_1344782 - SURFACE
      ?auto_1344786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344787 ?auto_1344785 ) ( IS-CRATE ?auto_1344781 ) ( not ( = ?auto_1344780 ?auto_1344781 ) ) ( not ( = ?auto_1344779 ?auto_1344780 ) ) ( not ( = ?auto_1344779 ?auto_1344781 ) ) ( not ( = ?auto_1344783 ?auto_1344785 ) ) ( HOIST-AT ?auto_1344784 ?auto_1344783 ) ( not ( = ?auto_1344787 ?auto_1344784 ) ) ( AVAILABLE ?auto_1344784 ) ( SURFACE-AT ?auto_1344781 ?auto_1344783 ) ( ON ?auto_1344781 ?auto_1344782 ) ( CLEAR ?auto_1344781 ) ( not ( = ?auto_1344780 ?auto_1344782 ) ) ( not ( = ?auto_1344781 ?auto_1344782 ) ) ( not ( = ?auto_1344779 ?auto_1344782 ) ) ( TRUCK-AT ?auto_1344786 ?auto_1344785 ) ( SURFACE-AT ?auto_1344779 ?auto_1344785 ) ( CLEAR ?auto_1344779 ) ( LIFTING ?auto_1344787 ?auto_1344780 ) ( IS-CRATE ?auto_1344780 ) ( ON ?auto_1344778 ?auto_1344777 ) ( ON ?auto_1344779 ?auto_1344778 ) ( not ( = ?auto_1344777 ?auto_1344778 ) ) ( not ( = ?auto_1344777 ?auto_1344779 ) ) ( not ( = ?auto_1344777 ?auto_1344780 ) ) ( not ( = ?auto_1344777 ?auto_1344781 ) ) ( not ( = ?auto_1344777 ?auto_1344782 ) ) ( not ( = ?auto_1344778 ?auto_1344779 ) ) ( not ( = ?auto_1344778 ?auto_1344780 ) ) ( not ( = ?auto_1344778 ?auto_1344781 ) ) ( not ( = ?auto_1344778 ?auto_1344782 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344779 ?auto_1344780 ?auto_1344781 )
      ( MAKE-4CRATE-VERIFY ?auto_1344777 ?auto_1344778 ?auto_1344779 ?auto_1344780 ?auto_1344781 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1344816 - SURFACE
      ?auto_1344817 - SURFACE
      ?auto_1344818 - SURFACE
      ?auto_1344819 - SURFACE
      ?auto_1344820 - SURFACE
    )
    :vars
    (
      ?auto_1344825 - HOIST
      ?auto_1344826 - PLACE
      ?auto_1344821 - PLACE
      ?auto_1344824 - HOIST
      ?auto_1344822 - SURFACE
      ?auto_1344823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344825 ?auto_1344826 ) ( IS-CRATE ?auto_1344820 ) ( not ( = ?auto_1344819 ?auto_1344820 ) ) ( not ( = ?auto_1344818 ?auto_1344819 ) ) ( not ( = ?auto_1344818 ?auto_1344820 ) ) ( not ( = ?auto_1344821 ?auto_1344826 ) ) ( HOIST-AT ?auto_1344824 ?auto_1344821 ) ( not ( = ?auto_1344825 ?auto_1344824 ) ) ( AVAILABLE ?auto_1344824 ) ( SURFACE-AT ?auto_1344820 ?auto_1344821 ) ( ON ?auto_1344820 ?auto_1344822 ) ( CLEAR ?auto_1344820 ) ( not ( = ?auto_1344819 ?auto_1344822 ) ) ( not ( = ?auto_1344820 ?auto_1344822 ) ) ( not ( = ?auto_1344818 ?auto_1344822 ) ) ( TRUCK-AT ?auto_1344823 ?auto_1344826 ) ( SURFACE-AT ?auto_1344818 ?auto_1344826 ) ( CLEAR ?auto_1344818 ) ( IS-CRATE ?auto_1344819 ) ( AVAILABLE ?auto_1344825 ) ( IN ?auto_1344819 ?auto_1344823 ) ( ON ?auto_1344817 ?auto_1344816 ) ( ON ?auto_1344818 ?auto_1344817 ) ( not ( = ?auto_1344816 ?auto_1344817 ) ) ( not ( = ?auto_1344816 ?auto_1344818 ) ) ( not ( = ?auto_1344816 ?auto_1344819 ) ) ( not ( = ?auto_1344816 ?auto_1344820 ) ) ( not ( = ?auto_1344816 ?auto_1344822 ) ) ( not ( = ?auto_1344817 ?auto_1344818 ) ) ( not ( = ?auto_1344817 ?auto_1344819 ) ) ( not ( = ?auto_1344817 ?auto_1344820 ) ) ( not ( = ?auto_1344817 ?auto_1344822 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344818 ?auto_1344819 ?auto_1344820 )
      ( MAKE-4CRATE-VERIFY ?auto_1344816 ?auto_1344817 ?auto_1344818 ?auto_1344819 ?auto_1344820 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1345476 - SURFACE
      ?auto_1345477 - SURFACE
      ?auto_1345478 - SURFACE
      ?auto_1345479 - SURFACE
      ?auto_1345480 - SURFACE
      ?auto_1345481 - SURFACE
    )
    :vars
    (
      ?auto_1345483 - HOIST
      ?auto_1345482 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1345483 ?auto_1345482 ) ( SURFACE-AT ?auto_1345480 ?auto_1345482 ) ( CLEAR ?auto_1345480 ) ( LIFTING ?auto_1345483 ?auto_1345481 ) ( IS-CRATE ?auto_1345481 ) ( not ( = ?auto_1345480 ?auto_1345481 ) ) ( ON ?auto_1345477 ?auto_1345476 ) ( ON ?auto_1345478 ?auto_1345477 ) ( ON ?auto_1345479 ?auto_1345478 ) ( ON ?auto_1345480 ?auto_1345479 ) ( not ( = ?auto_1345476 ?auto_1345477 ) ) ( not ( = ?auto_1345476 ?auto_1345478 ) ) ( not ( = ?auto_1345476 ?auto_1345479 ) ) ( not ( = ?auto_1345476 ?auto_1345480 ) ) ( not ( = ?auto_1345476 ?auto_1345481 ) ) ( not ( = ?auto_1345477 ?auto_1345478 ) ) ( not ( = ?auto_1345477 ?auto_1345479 ) ) ( not ( = ?auto_1345477 ?auto_1345480 ) ) ( not ( = ?auto_1345477 ?auto_1345481 ) ) ( not ( = ?auto_1345478 ?auto_1345479 ) ) ( not ( = ?auto_1345478 ?auto_1345480 ) ) ( not ( = ?auto_1345478 ?auto_1345481 ) ) ( not ( = ?auto_1345479 ?auto_1345480 ) ) ( not ( = ?auto_1345479 ?auto_1345481 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1345480 ?auto_1345481 )
      ( MAKE-5CRATE-VERIFY ?auto_1345476 ?auto_1345477 ?auto_1345478 ?auto_1345479 ?auto_1345480 ?auto_1345481 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1345510 - SURFACE
      ?auto_1345511 - SURFACE
      ?auto_1345512 - SURFACE
      ?auto_1345513 - SURFACE
      ?auto_1345514 - SURFACE
      ?auto_1345515 - SURFACE
    )
    :vars
    (
      ?auto_1345517 - HOIST
      ?auto_1345518 - PLACE
      ?auto_1345516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1345517 ?auto_1345518 ) ( SURFACE-AT ?auto_1345514 ?auto_1345518 ) ( CLEAR ?auto_1345514 ) ( IS-CRATE ?auto_1345515 ) ( not ( = ?auto_1345514 ?auto_1345515 ) ) ( TRUCK-AT ?auto_1345516 ?auto_1345518 ) ( AVAILABLE ?auto_1345517 ) ( IN ?auto_1345515 ?auto_1345516 ) ( ON ?auto_1345514 ?auto_1345513 ) ( not ( = ?auto_1345513 ?auto_1345514 ) ) ( not ( = ?auto_1345513 ?auto_1345515 ) ) ( ON ?auto_1345511 ?auto_1345510 ) ( ON ?auto_1345512 ?auto_1345511 ) ( ON ?auto_1345513 ?auto_1345512 ) ( not ( = ?auto_1345510 ?auto_1345511 ) ) ( not ( = ?auto_1345510 ?auto_1345512 ) ) ( not ( = ?auto_1345510 ?auto_1345513 ) ) ( not ( = ?auto_1345510 ?auto_1345514 ) ) ( not ( = ?auto_1345510 ?auto_1345515 ) ) ( not ( = ?auto_1345511 ?auto_1345512 ) ) ( not ( = ?auto_1345511 ?auto_1345513 ) ) ( not ( = ?auto_1345511 ?auto_1345514 ) ) ( not ( = ?auto_1345511 ?auto_1345515 ) ) ( not ( = ?auto_1345512 ?auto_1345513 ) ) ( not ( = ?auto_1345512 ?auto_1345514 ) ) ( not ( = ?auto_1345512 ?auto_1345515 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1345513 ?auto_1345514 ?auto_1345515 )
      ( MAKE-5CRATE-VERIFY ?auto_1345510 ?auto_1345511 ?auto_1345512 ?auto_1345513 ?auto_1345514 ?auto_1345515 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1345550 - SURFACE
      ?auto_1345551 - SURFACE
      ?auto_1345552 - SURFACE
      ?auto_1345553 - SURFACE
      ?auto_1345554 - SURFACE
      ?auto_1345555 - SURFACE
    )
    :vars
    (
      ?auto_1345558 - HOIST
      ?auto_1345556 - PLACE
      ?auto_1345557 - TRUCK
      ?auto_1345559 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1345558 ?auto_1345556 ) ( SURFACE-AT ?auto_1345554 ?auto_1345556 ) ( CLEAR ?auto_1345554 ) ( IS-CRATE ?auto_1345555 ) ( not ( = ?auto_1345554 ?auto_1345555 ) ) ( AVAILABLE ?auto_1345558 ) ( IN ?auto_1345555 ?auto_1345557 ) ( ON ?auto_1345554 ?auto_1345553 ) ( not ( = ?auto_1345553 ?auto_1345554 ) ) ( not ( = ?auto_1345553 ?auto_1345555 ) ) ( TRUCK-AT ?auto_1345557 ?auto_1345559 ) ( not ( = ?auto_1345559 ?auto_1345556 ) ) ( ON ?auto_1345551 ?auto_1345550 ) ( ON ?auto_1345552 ?auto_1345551 ) ( ON ?auto_1345553 ?auto_1345552 ) ( not ( = ?auto_1345550 ?auto_1345551 ) ) ( not ( = ?auto_1345550 ?auto_1345552 ) ) ( not ( = ?auto_1345550 ?auto_1345553 ) ) ( not ( = ?auto_1345550 ?auto_1345554 ) ) ( not ( = ?auto_1345550 ?auto_1345555 ) ) ( not ( = ?auto_1345551 ?auto_1345552 ) ) ( not ( = ?auto_1345551 ?auto_1345553 ) ) ( not ( = ?auto_1345551 ?auto_1345554 ) ) ( not ( = ?auto_1345551 ?auto_1345555 ) ) ( not ( = ?auto_1345552 ?auto_1345553 ) ) ( not ( = ?auto_1345552 ?auto_1345554 ) ) ( not ( = ?auto_1345552 ?auto_1345555 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1345553 ?auto_1345554 ?auto_1345555 )
      ( MAKE-5CRATE-VERIFY ?auto_1345550 ?auto_1345551 ?auto_1345552 ?auto_1345553 ?auto_1345554 ?auto_1345555 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1345595 - SURFACE
      ?auto_1345596 - SURFACE
      ?auto_1345597 - SURFACE
      ?auto_1345598 - SURFACE
      ?auto_1345599 - SURFACE
      ?auto_1345600 - SURFACE
    )
    :vars
    (
      ?auto_1345601 - HOIST
      ?auto_1345604 - PLACE
      ?auto_1345605 - TRUCK
      ?auto_1345602 - PLACE
      ?auto_1345603 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1345601 ?auto_1345604 ) ( SURFACE-AT ?auto_1345599 ?auto_1345604 ) ( CLEAR ?auto_1345599 ) ( IS-CRATE ?auto_1345600 ) ( not ( = ?auto_1345599 ?auto_1345600 ) ) ( AVAILABLE ?auto_1345601 ) ( ON ?auto_1345599 ?auto_1345598 ) ( not ( = ?auto_1345598 ?auto_1345599 ) ) ( not ( = ?auto_1345598 ?auto_1345600 ) ) ( TRUCK-AT ?auto_1345605 ?auto_1345602 ) ( not ( = ?auto_1345602 ?auto_1345604 ) ) ( HOIST-AT ?auto_1345603 ?auto_1345602 ) ( LIFTING ?auto_1345603 ?auto_1345600 ) ( not ( = ?auto_1345601 ?auto_1345603 ) ) ( ON ?auto_1345596 ?auto_1345595 ) ( ON ?auto_1345597 ?auto_1345596 ) ( ON ?auto_1345598 ?auto_1345597 ) ( not ( = ?auto_1345595 ?auto_1345596 ) ) ( not ( = ?auto_1345595 ?auto_1345597 ) ) ( not ( = ?auto_1345595 ?auto_1345598 ) ) ( not ( = ?auto_1345595 ?auto_1345599 ) ) ( not ( = ?auto_1345595 ?auto_1345600 ) ) ( not ( = ?auto_1345596 ?auto_1345597 ) ) ( not ( = ?auto_1345596 ?auto_1345598 ) ) ( not ( = ?auto_1345596 ?auto_1345599 ) ) ( not ( = ?auto_1345596 ?auto_1345600 ) ) ( not ( = ?auto_1345597 ?auto_1345598 ) ) ( not ( = ?auto_1345597 ?auto_1345599 ) ) ( not ( = ?auto_1345597 ?auto_1345600 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1345598 ?auto_1345599 ?auto_1345600 )
      ( MAKE-5CRATE-VERIFY ?auto_1345595 ?auto_1345596 ?auto_1345597 ?auto_1345598 ?auto_1345599 ?auto_1345600 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1345645 - SURFACE
      ?auto_1345646 - SURFACE
      ?auto_1345647 - SURFACE
      ?auto_1345648 - SURFACE
      ?auto_1345649 - SURFACE
      ?auto_1345650 - SURFACE
    )
    :vars
    (
      ?auto_1345653 - HOIST
      ?auto_1345652 - PLACE
      ?auto_1345655 - TRUCK
      ?auto_1345654 - PLACE
      ?auto_1345651 - HOIST
      ?auto_1345656 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1345653 ?auto_1345652 ) ( SURFACE-AT ?auto_1345649 ?auto_1345652 ) ( CLEAR ?auto_1345649 ) ( IS-CRATE ?auto_1345650 ) ( not ( = ?auto_1345649 ?auto_1345650 ) ) ( AVAILABLE ?auto_1345653 ) ( ON ?auto_1345649 ?auto_1345648 ) ( not ( = ?auto_1345648 ?auto_1345649 ) ) ( not ( = ?auto_1345648 ?auto_1345650 ) ) ( TRUCK-AT ?auto_1345655 ?auto_1345654 ) ( not ( = ?auto_1345654 ?auto_1345652 ) ) ( HOIST-AT ?auto_1345651 ?auto_1345654 ) ( not ( = ?auto_1345653 ?auto_1345651 ) ) ( AVAILABLE ?auto_1345651 ) ( SURFACE-AT ?auto_1345650 ?auto_1345654 ) ( ON ?auto_1345650 ?auto_1345656 ) ( CLEAR ?auto_1345650 ) ( not ( = ?auto_1345649 ?auto_1345656 ) ) ( not ( = ?auto_1345650 ?auto_1345656 ) ) ( not ( = ?auto_1345648 ?auto_1345656 ) ) ( ON ?auto_1345646 ?auto_1345645 ) ( ON ?auto_1345647 ?auto_1345646 ) ( ON ?auto_1345648 ?auto_1345647 ) ( not ( = ?auto_1345645 ?auto_1345646 ) ) ( not ( = ?auto_1345645 ?auto_1345647 ) ) ( not ( = ?auto_1345645 ?auto_1345648 ) ) ( not ( = ?auto_1345645 ?auto_1345649 ) ) ( not ( = ?auto_1345645 ?auto_1345650 ) ) ( not ( = ?auto_1345645 ?auto_1345656 ) ) ( not ( = ?auto_1345646 ?auto_1345647 ) ) ( not ( = ?auto_1345646 ?auto_1345648 ) ) ( not ( = ?auto_1345646 ?auto_1345649 ) ) ( not ( = ?auto_1345646 ?auto_1345650 ) ) ( not ( = ?auto_1345646 ?auto_1345656 ) ) ( not ( = ?auto_1345647 ?auto_1345648 ) ) ( not ( = ?auto_1345647 ?auto_1345649 ) ) ( not ( = ?auto_1345647 ?auto_1345650 ) ) ( not ( = ?auto_1345647 ?auto_1345656 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1345648 ?auto_1345649 ?auto_1345650 )
      ( MAKE-5CRATE-VERIFY ?auto_1345645 ?auto_1345646 ?auto_1345647 ?auto_1345648 ?auto_1345649 ?auto_1345650 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1345696 - SURFACE
      ?auto_1345697 - SURFACE
      ?auto_1345698 - SURFACE
      ?auto_1345699 - SURFACE
      ?auto_1345700 - SURFACE
      ?auto_1345701 - SURFACE
    )
    :vars
    (
      ?auto_1345705 - HOIST
      ?auto_1345703 - PLACE
      ?auto_1345707 - PLACE
      ?auto_1345706 - HOIST
      ?auto_1345702 - SURFACE
      ?auto_1345704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1345705 ?auto_1345703 ) ( SURFACE-AT ?auto_1345700 ?auto_1345703 ) ( CLEAR ?auto_1345700 ) ( IS-CRATE ?auto_1345701 ) ( not ( = ?auto_1345700 ?auto_1345701 ) ) ( AVAILABLE ?auto_1345705 ) ( ON ?auto_1345700 ?auto_1345699 ) ( not ( = ?auto_1345699 ?auto_1345700 ) ) ( not ( = ?auto_1345699 ?auto_1345701 ) ) ( not ( = ?auto_1345707 ?auto_1345703 ) ) ( HOIST-AT ?auto_1345706 ?auto_1345707 ) ( not ( = ?auto_1345705 ?auto_1345706 ) ) ( AVAILABLE ?auto_1345706 ) ( SURFACE-AT ?auto_1345701 ?auto_1345707 ) ( ON ?auto_1345701 ?auto_1345702 ) ( CLEAR ?auto_1345701 ) ( not ( = ?auto_1345700 ?auto_1345702 ) ) ( not ( = ?auto_1345701 ?auto_1345702 ) ) ( not ( = ?auto_1345699 ?auto_1345702 ) ) ( TRUCK-AT ?auto_1345704 ?auto_1345703 ) ( ON ?auto_1345697 ?auto_1345696 ) ( ON ?auto_1345698 ?auto_1345697 ) ( ON ?auto_1345699 ?auto_1345698 ) ( not ( = ?auto_1345696 ?auto_1345697 ) ) ( not ( = ?auto_1345696 ?auto_1345698 ) ) ( not ( = ?auto_1345696 ?auto_1345699 ) ) ( not ( = ?auto_1345696 ?auto_1345700 ) ) ( not ( = ?auto_1345696 ?auto_1345701 ) ) ( not ( = ?auto_1345696 ?auto_1345702 ) ) ( not ( = ?auto_1345697 ?auto_1345698 ) ) ( not ( = ?auto_1345697 ?auto_1345699 ) ) ( not ( = ?auto_1345697 ?auto_1345700 ) ) ( not ( = ?auto_1345697 ?auto_1345701 ) ) ( not ( = ?auto_1345697 ?auto_1345702 ) ) ( not ( = ?auto_1345698 ?auto_1345699 ) ) ( not ( = ?auto_1345698 ?auto_1345700 ) ) ( not ( = ?auto_1345698 ?auto_1345701 ) ) ( not ( = ?auto_1345698 ?auto_1345702 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1345699 ?auto_1345700 ?auto_1345701 )
      ( MAKE-5CRATE-VERIFY ?auto_1345696 ?auto_1345697 ?auto_1345698 ?auto_1345699 ?auto_1345700 ?auto_1345701 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1345747 - SURFACE
      ?auto_1345748 - SURFACE
      ?auto_1345749 - SURFACE
      ?auto_1345750 - SURFACE
      ?auto_1345751 - SURFACE
      ?auto_1345752 - SURFACE
    )
    :vars
    (
      ?auto_1345754 - HOIST
      ?auto_1345753 - PLACE
      ?auto_1345757 - PLACE
      ?auto_1345755 - HOIST
      ?auto_1345756 - SURFACE
      ?auto_1345758 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1345754 ?auto_1345753 ) ( IS-CRATE ?auto_1345752 ) ( not ( = ?auto_1345751 ?auto_1345752 ) ) ( not ( = ?auto_1345750 ?auto_1345751 ) ) ( not ( = ?auto_1345750 ?auto_1345752 ) ) ( not ( = ?auto_1345757 ?auto_1345753 ) ) ( HOIST-AT ?auto_1345755 ?auto_1345757 ) ( not ( = ?auto_1345754 ?auto_1345755 ) ) ( AVAILABLE ?auto_1345755 ) ( SURFACE-AT ?auto_1345752 ?auto_1345757 ) ( ON ?auto_1345752 ?auto_1345756 ) ( CLEAR ?auto_1345752 ) ( not ( = ?auto_1345751 ?auto_1345756 ) ) ( not ( = ?auto_1345752 ?auto_1345756 ) ) ( not ( = ?auto_1345750 ?auto_1345756 ) ) ( TRUCK-AT ?auto_1345758 ?auto_1345753 ) ( SURFACE-AT ?auto_1345750 ?auto_1345753 ) ( CLEAR ?auto_1345750 ) ( LIFTING ?auto_1345754 ?auto_1345751 ) ( IS-CRATE ?auto_1345751 ) ( ON ?auto_1345748 ?auto_1345747 ) ( ON ?auto_1345749 ?auto_1345748 ) ( ON ?auto_1345750 ?auto_1345749 ) ( not ( = ?auto_1345747 ?auto_1345748 ) ) ( not ( = ?auto_1345747 ?auto_1345749 ) ) ( not ( = ?auto_1345747 ?auto_1345750 ) ) ( not ( = ?auto_1345747 ?auto_1345751 ) ) ( not ( = ?auto_1345747 ?auto_1345752 ) ) ( not ( = ?auto_1345747 ?auto_1345756 ) ) ( not ( = ?auto_1345748 ?auto_1345749 ) ) ( not ( = ?auto_1345748 ?auto_1345750 ) ) ( not ( = ?auto_1345748 ?auto_1345751 ) ) ( not ( = ?auto_1345748 ?auto_1345752 ) ) ( not ( = ?auto_1345748 ?auto_1345756 ) ) ( not ( = ?auto_1345749 ?auto_1345750 ) ) ( not ( = ?auto_1345749 ?auto_1345751 ) ) ( not ( = ?auto_1345749 ?auto_1345752 ) ) ( not ( = ?auto_1345749 ?auto_1345756 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1345750 ?auto_1345751 ?auto_1345752 )
      ( MAKE-5CRATE-VERIFY ?auto_1345747 ?auto_1345748 ?auto_1345749 ?auto_1345750 ?auto_1345751 ?auto_1345752 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1345798 - SURFACE
      ?auto_1345799 - SURFACE
      ?auto_1345800 - SURFACE
      ?auto_1345801 - SURFACE
      ?auto_1345802 - SURFACE
      ?auto_1345803 - SURFACE
    )
    :vars
    (
      ?auto_1345809 - HOIST
      ?auto_1345804 - PLACE
      ?auto_1345808 - PLACE
      ?auto_1345806 - HOIST
      ?auto_1345807 - SURFACE
      ?auto_1345805 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1345809 ?auto_1345804 ) ( IS-CRATE ?auto_1345803 ) ( not ( = ?auto_1345802 ?auto_1345803 ) ) ( not ( = ?auto_1345801 ?auto_1345802 ) ) ( not ( = ?auto_1345801 ?auto_1345803 ) ) ( not ( = ?auto_1345808 ?auto_1345804 ) ) ( HOIST-AT ?auto_1345806 ?auto_1345808 ) ( not ( = ?auto_1345809 ?auto_1345806 ) ) ( AVAILABLE ?auto_1345806 ) ( SURFACE-AT ?auto_1345803 ?auto_1345808 ) ( ON ?auto_1345803 ?auto_1345807 ) ( CLEAR ?auto_1345803 ) ( not ( = ?auto_1345802 ?auto_1345807 ) ) ( not ( = ?auto_1345803 ?auto_1345807 ) ) ( not ( = ?auto_1345801 ?auto_1345807 ) ) ( TRUCK-AT ?auto_1345805 ?auto_1345804 ) ( SURFACE-AT ?auto_1345801 ?auto_1345804 ) ( CLEAR ?auto_1345801 ) ( IS-CRATE ?auto_1345802 ) ( AVAILABLE ?auto_1345809 ) ( IN ?auto_1345802 ?auto_1345805 ) ( ON ?auto_1345799 ?auto_1345798 ) ( ON ?auto_1345800 ?auto_1345799 ) ( ON ?auto_1345801 ?auto_1345800 ) ( not ( = ?auto_1345798 ?auto_1345799 ) ) ( not ( = ?auto_1345798 ?auto_1345800 ) ) ( not ( = ?auto_1345798 ?auto_1345801 ) ) ( not ( = ?auto_1345798 ?auto_1345802 ) ) ( not ( = ?auto_1345798 ?auto_1345803 ) ) ( not ( = ?auto_1345798 ?auto_1345807 ) ) ( not ( = ?auto_1345799 ?auto_1345800 ) ) ( not ( = ?auto_1345799 ?auto_1345801 ) ) ( not ( = ?auto_1345799 ?auto_1345802 ) ) ( not ( = ?auto_1345799 ?auto_1345803 ) ) ( not ( = ?auto_1345799 ?auto_1345807 ) ) ( not ( = ?auto_1345800 ?auto_1345801 ) ) ( not ( = ?auto_1345800 ?auto_1345802 ) ) ( not ( = ?auto_1345800 ?auto_1345803 ) ) ( not ( = ?auto_1345800 ?auto_1345807 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1345801 ?auto_1345802 ?auto_1345803 )
      ( MAKE-5CRATE-VERIFY ?auto_1345798 ?auto_1345799 ?auto_1345800 ?auto_1345801 ?auto_1345802 ?auto_1345803 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1347007 - SURFACE
      ?auto_1347008 - SURFACE
      ?auto_1347009 - SURFACE
      ?auto_1347010 - SURFACE
      ?auto_1347011 - SURFACE
      ?auto_1347012 - SURFACE
      ?auto_1347013 - SURFACE
    )
    :vars
    (
      ?auto_1347014 - HOIST
      ?auto_1347015 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1347014 ?auto_1347015 ) ( SURFACE-AT ?auto_1347012 ?auto_1347015 ) ( CLEAR ?auto_1347012 ) ( LIFTING ?auto_1347014 ?auto_1347013 ) ( IS-CRATE ?auto_1347013 ) ( not ( = ?auto_1347012 ?auto_1347013 ) ) ( ON ?auto_1347008 ?auto_1347007 ) ( ON ?auto_1347009 ?auto_1347008 ) ( ON ?auto_1347010 ?auto_1347009 ) ( ON ?auto_1347011 ?auto_1347010 ) ( ON ?auto_1347012 ?auto_1347011 ) ( not ( = ?auto_1347007 ?auto_1347008 ) ) ( not ( = ?auto_1347007 ?auto_1347009 ) ) ( not ( = ?auto_1347007 ?auto_1347010 ) ) ( not ( = ?auto_1347007 ?auto_1347011 ) ) ( not ( = ?auto_1347007 ?auto_1347012 ) ) ( not ( = ?auto_1347007 ?auto_1347013 ) ) ( not ( = ?auto_1347008 ?auto_1347009 ) ) ( not ( = ?auto_1347008 ?auto_1347010 ) ) ( not ( = ?auto_1347008 ?auto_1347011 ) ) ( not ( = ?auto_1347008 ?auto_1347012 ) ) ( not ( = ?auto_1347008 ?auto_1347013 ) ) ( not ( = ?auto_1347009 ?auto_1347010 ) ) ( not ( = ?auto_1347009 ?auto_1347011 ) ) ( not ( = ?auto_1347009 ?auto_1347012 ) ) ( not ( = ?auto_1347009 ?auto_1347013 ) ) ( not ( = ?auto_1347010 ?auto_1347011 ) ) ( not ( = ?auto_1347010 ?auto_1347012 ) ) ( not ( = ?auto_1347010 ?auto_1347013 ) ) ( not ( = ?auto_1347011 ?auto_1347012 ) ) ( not ( = ?auto_1347011 ?auto_1347013 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1347012 ?auto_1347013 )
      ( MAKE-6CRATE-VERIFY ?auto_1347007 ?auto_1347008 ?auto_1347009 ?auto_1347010 ?auto_1347011 ?auto_1347012 ?auto_1347013 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1347051 - SURFACE
      ?auto_1347052 - SURFACE
      ?auto_1347053 - SURFACE
      ?auto_1347054 - SURFACE
      ?auto_1347055 - SURFACE
      ?auto_1347056 - SURFACE
      ?auto_1347057 - SURFACE
    )
    :vars
    (
      ?auto_1347059 - HOIST
      ?auto_1347060 - PLACE
      ?auto_1347058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1347059 ?auto_1347060 ) ( SURFACE-AT ?auto_1347056 ?auto_1347060 ) ( CLEAR ?auto_1347056 ) ( IS-CRATE ?auto_1347057 ) ( not ( = ?auto_1347056 ?auto_1347057 ) ) ( TRUCK-AT ?auto_1347058 ?auto_1347060 ) ( AVAILABLE ?auto_1347059 ) ( IN ?auto_1347057 ?auto_1347058 ) ( ON ?auto_1347056 ?auto_1347055 ) ( not ( = ?auto_1347055 ?auto_1347056 ) ) ( not ( = ?auto_1347055 ?auto_1347057 ) ) ( ON ?auto_1347052 ?auto_1347051 ) ( ON ?auto_1347053 ?auto_1347052 ) ( ON ?auto_1347054 ?auto_1347053 ) ( ON ?auto_1347055 ?auto_1347054 ) ( not ( = ?auto_1347051 ?auto_1347052 ) ) ( not ( = ?auto_1347051 ?auto_1347053 ) ) ( not ( = ?auto_1347051 ?auto_1347054 ) ) ( not ( = ?auto_1347051 ?auto_1347055 ) ) ( not ( = ?auto_1347051 ?auto_1347056 ) ) ( not ( = ?auto_1347051 ?auto_1347057 ) ) ( not ( = ?auto_1347052 ?auto_1347053 ) ) ( not ( = ?auto_1347052 ?auto_1347054 ) ) ( not ( = ?auto_1347052 ?auto_1347055 ) ) ( not ( = ?auto_1347052 ?auto_1347056 ) ) ( not ( = ?auto_1347052 ?auto_1347057 ) ) ( not ( = ?auto_1347053 ?auto_1347054 ) ) ( not ( = ?auto_1347053 ?auto_1347055 ) ) ( not ( = ?auto_1347053 ?auto_1347056 ) ) ( not ( = ?auto_1347053 ?auto_1347057 ) ) ( not ( = ?auto_1347054 ?auto_1347055 ) ) ( not ( = ?auto_1347054 ?auto_1347056 ) ) ( not ( = ?auto_1347054 ?auto_1347057 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1347055 ?auto_1347056 ?auto_1347057 )
      ( MAKE-6CRATE-VERIFY ?auto_1347051 ?auto_1347052 ?auto_1347053 ?auto_1347054 ?auto_1347055 ?auto_1347056 ?auto_1347057 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1347102 - SURFACE
      ?auto_1347103 - SURFACE
      ?auto_1347104 - SURFACE
      ?auto_1347105 - SURFACE
      ?auto_1347106 - SURFACE
      ?auto_1347107 - SURFACE
      ?auto_1347108 - SURFACE
    )
    :vars
    (
      ?auto_1347110 - HOIST
      ?auto_1347109 - PLACE
      ?auto_1347112 - TRUCK
      ?auto_1347111 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1347110 ?auto_1347109 ) ( SURFACE-AT ?auto_1347107 ?auto_1347109 ) ( CLEAR ?auto_1347107 ) ( IS-CRATE ?auto_1347108 ) ( not ( = ?auto_1347107 ?auto_1347108 ) ) ( AVAILABLE ?auto_1347110 ) ( IN ?auto_1347108 ?auto_1347112 ) ( ON ?auto_1347107 ?auto_1347106 ) ( not ( = ?auto_1347106 ?auto_1347107 ) ) ( not ( = ?auto_1347106 ?auto_1347108 ) ) ( TRUCK-AT ?auto_1347112 ?auto_1347111 ) ( not ( = ?auto_1347111 ?auto_1347109 ) ) ( ON ?auto_1347103 ?auto_1347102 ) ( ON ?auto_1347104 ?auto_1347103 ) ( ON ?auto_1347105 ?auto_1347104 ) ( ON ?auto_1347106 ?auto_1347105 ) ( not ( = ?auto_1347102 ?auto_1347103 ) ) ( not ( = ?auto_1347102 ?auto_1347104 ) ) ( not ( = ?auto_1347102 ?auto_1347105 ) ) ( not ( = ?auto_1347102 ?auto_1347106 ) ) ( not ( = ?auto_1347102 ?auto_1347107 ) ) ( not ( = ?auto_1347102 ?auto_1347108 ) ) ( not ( = ?auto_1347103 ?auto_1347104 ) ) ( not ( = ?auto_1347103 ?auto_1347105 ) ) ( not ( = ?auto_1347103 ?auto_1347106 ) ) ( not ( = ?auto_1347103 ?auto_1347107 ) ) ( not ( = ?auto_1347103 ?auto_1347108 ) ) ( not ( = ?auto_1347104 ?auto_1347105 ) ) ( not ( = ?auto_1347104 ?auto_1347106 ) ) ( not ( = ?auto_1347104 ?auto_1347107 ) ) ( not ( = ?auto_1347104 ?auto_1347108 ) ) ( not ( = ?auto_1347105 ?auto_1347106 ) ) ( not ( = ?auto_1347105 ?auto_1347107 ) ) ( not ( = ?auto_1347105 ?auto_1347108 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1347106 ?auto_1347107 ?auto_1347108 )
      ( MAKE-6CRATE-VERIFY ?auto_1347102 ?auto_1347103 ?auto_1347104 ?auto_1347105 ?auto_1347106 ?auto_1347107 ?auto_1347108 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1347159 - SURFACE
      ?auto_1347160 - SURFACE
      ?auto_1347161 - SURFACE
      ?auto_1347162 - SURFACE
      ?auto_1347163 - SURFACE
      ?auto_1347164 - SURFACE
      ?auto_1347165 - SURFACE
    )
    :vars
    (
      ?auto_1347167 - HOIST
      ?auto_1347168 - PLACE
      ?auto_1347169 - TRUCK
      ?auto_1347166 - PLACE
      ?auto_1347170 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1347167 ?auto_1347168 ) ( SURFACE-AT ?auto_1347164 ?auto_1347168 ) ( CLEAR ?auto_1347164 ) ( IS-CRATE ?auto_1347165 ) ( not ( = ?auto_1347164 ?auto_1347165 ) ) ( AVAILABLE ?auto_1347167 ) ( ON ?auto_1347164 ?auto_1347163 ) ( not ( = ?auto_1347163 ?auto_1347164 ) ) ( not ( = ?auto_1347163 ?auto_1347165 ) ) ( TRUCK-AT ?auto_1347169 ?auto_1347166 ) ( not ( = ?auto_1347166 ?auto_1347168 ) ) ( HOIST-AT ?auto_1347170 ?auto_1347166 ) ( LIFTING ?auto_1347170 ?auto_1347165 ) ( not ( = ?auto_1347167 ?auto_1347170 ) ) ( ON ?auto_1347160 ?auto_1347159 ) ( ON ?auto_1347161 ?auto_1347160 ) ( ON ?auto_1347162 ?auto_1347161 ) ( ON ?auto_1347163 ?auto_1347162 ) ( not ( = ?auto_1347159 ?auto_1347160 ) ) ( not ( = ?auto_1347159 ?auto_1347161 ) ) ( not ( = ?auto_1347159 ?auto_1347162 ) ) ( not ( = ?auto_1347159 ?auto_1347163 ) ) ( not ( = ?auto_1347159 ?auto_1347164 ) ) ( not ( = ?auto_1347159 ?auto_1347165 ) ) ( not ( = ?auto_1347160 ?auto_1347161 ) ) ( not ( = ?auto_1347160 ?auto_1347162 ) ) ( not ( = ?auto_1347160 ?auto_1347163 ) ) ( not ( = ?auto_1347160 ?auto_1347164 ) ) ( not ( = ?auto_1347160 ?auto_1347165 ) ) ( not ( = ?auto_1347161 ?auto_1347162 ) ) ( not ( = ?auto_1347161 ?auto_1347163 ) ) ( not ( = ?auto_1347161 ?auto_1347164 ) ) ( not ( = ?auto_1347161 ?auto_1347165 ) ) ( not ( = ?auto_1347162 ?auto_1347163 ) ) ( not ( = ?auto_1347162 ?auto_1347164 ) ) ( not ( = ?auto_1347162 ?auto_1347165 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1347163 ?auto_1347164 ?auto_1347165 )
      ( MAKE-6CRATE-VERIFY ?auto_1347159 ?auto_1347160 ?auto_1347161 ?auto_1347162 ?auto_1347163 ?auto_1347164 ?auto_1347165 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1347222 - SURFACE
      ?auto_1347223 - SURFACE
      ?auto_1347224 - SURFACE
      ?auto_1347225 - SURFACE
      ?auto_1347226 - SURFACE
      ?auto_1347227 - SURFACE
      ?auto_1347228 - SURFACE
    )
    :vars
    (
      ?auto_1347233 - HOIST
      ?auto_1347232 - PLACE
      ?auto_1347230 - TRUCK
      ?auto_1347229 - PLACE
      ?auto_1347231 - HOIST
      ?auto_1347234 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1347233 ?auto_1347232 ) ( SURFACE-AT ?auto_1347227 ?auto_1347232 ) ( CLEAR ?auto_1347227 ) ( IS-CRATE ?auto_1347228 ) ( not ( = ?auto_1347227 ?auto_1347228 ) ) ( AVAILABLE ?auto_1347233 ) ( ON ?auto_1347227 ?auto_1347226 ) ( not ( = ?auto_1347226 ?auto_1347227 ) ) ( not ( = ?auto_1347226 ?auto_1347228 ) ) ( TRUCK-AT ?auto_1347230 ?auto_1347229 ) ( not ( = ?auto_1347229 ?auto_1347232 ) ) ( HOIST-AT ?auto_1347231 ?auto_1347229 ) ( not ( = ?auto_1347233 ?auto_1347231 ) ) ( AVAILABLE ?auto_1347231 ) ( SURFACE-AT ?auto_1347228 ?auto_1347229 ) ( ON ?auto_1347228 ?auto_1347234 ) ( CLEAR ?auto_1347228 ) ( not ( = ?auto_1347227 ?auto_1347234 ) ) ( not ( = ?auto_1347228 ?auto_1347234 ) ) ( not ( = ?auto_1347226 ?auto_1347234 ) ) ( ON ?auto_1347223 ?auto_1347222 ) ( ON ?auto_1347224 ?auto_1347223 ) ( ON ?auto_1347225 ?auto_1347224 ) ( ON ?auto_1347226 ?auto_1347225 ) ( not ( = ?auto_1347222 ?auto_1347223 ) ) ( not ( = ?auto_1347222 ?auto_1347224 ) ) ( not ( = ?auto_1347222 ?auto_1347225 ) ) ( not ( = ?auto_1347222 ?auto_1347226 ) ) ( not ( = ?auto_1347222 ?auto_1347227 ) ) ( not ( = ?auto_1347222 ?auto_1347228 ) ) ( not ( = ?auto_1347222 ?auto_1347234 ) ) ( not ( = ?auto_1347223 ?auto_1347224 ) ) ( not ( = ?auto_1347223 ?auto_1347225 ) ) ( not ( = ?auto_1347223 ?auto_1347226 ) ) ( not ( = ?auto_1347223 ?auto_1347227 ) ) ( not ( = ?auto_1347223 ?auto_1347228 ) ) ( not ( = ?auto_1347223 ?auto_1347234 ) ) ( not ( = ?auto_1347224 ?auto_1347225 ) ) ( not ( = ?auto_1347224 ?auto_1347226 ) ) ( not ( = ?auto_1347224 ?auto_1347227 ) ) ( not ( = ?auto_1347224 ?auto_1347228 ) ) ( not ( = ?auto_1347224 ?auto_1347234 ) ) ( not ( = ?auto_1347225 ?auto_1347226 ) ) ( not ( = ?auto_1347225 ?auto_1347227 ) ) ( not ( = ?auto_1347225 ?auto_1347228 ) ) ( not ( = ?auto_1347225 ?auto_1347234 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1347226 ?auto_1347227 ?auto_1347228 )
      ( MAKE-6CRATE-VERIFY ?auto_1347222 ?auto_1347223 ?auto_1347224 ?auto_1347225 ?auto_1347226 ?auto_1347227 ?auto_1347228 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1347286 - SURFACE
      ?auto_1347287 - SURFACE
      ?auto_1347288 - SURFACE
      ?auto_1347289 - SURFACE
      ?auto_1347290 - SURFACE
      ?auto_1347291 - SURFACE
      ?auto_1347292 - SURFACE
    )
    :vars
    (
      ?auto_1347294 - HOIST
      ?auto_1347297 - PLACE
      ?auto_1347298 - PLACE
      ?auto_1347295 - HOIST
      ?auto_1347293 - SURFACE
      ?auto_1347296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1347294 ?auto_1347297 ) ( SURFACE-AT ?auto_1347291 ?auto_1347297 ) ( CLEAR ?auto_1347291 ) ( IS-CRATE ?auto_1347292 ) ( not ( = ?auto_1347291 ?auto_1347292 ) ) ( AVAILABLE ?auto_1347294 ) ( ON ?auto_1347291 ?auto_1347290 ) ( not ( = ?auto_1347290 ?auto_1347291 ) ) ( not ( = ?auto_1347290 ?auto_1347292 ) ) ( not ( = ?auto_1347298 ?auto_1347297 ) ) ( HOIST-AT ?auto_1347295 ?auto_1347298 ) ( not ( = ?auto_1347294 ?auto_1347295 ) ) ( AVAILABLE ?auto_1347295 ) ( SURFACE-AT ?auto_1347292 ?auto_1347298 ) ( ON ?auto_1347292 ?auto_1347293 ) ( CLEAR ?auto_1347292 ) ( not ( = ?auto_1347291 ?auto_1347293 ) ) ( not ( = ?auto_1347292 ?auto_1347293 ) ) ( not ( = ?auto_1347290 ?auto_1347293 ) ) ( TRUCK-AT ?auto_1347296 ?auto_1347297 ) ( ON ?auto_1347287 ?auto_1347286 ) ( ON ?auto_1347288 ?auto_1347287 ) ( ON ?auto_1347289 ?auto_1347288 ) ( ON ?auto_1347290 ?auto_1347289 ) ( not ( = ?auto_1347286 ?auto_1347287 ) ) ( not ( = ?auto_1347286 ?auto_1347288 ) ) ( not ( = ?auto_1347286 ?auto_1347289 ) ) ( not ( = ?auto_1347286 ?auto_1347290 ) ) ( not ( = ?auto_1347286 ?auto_1347291 ) ) ( not ( = ?auto_1347286 ?auto_1347292 ) ) ( not ( = ?auto_1347286 ?auto_1347293 ) ) ( not ( = ?auto_1347287 ?auto_1347288 ) ) ( not ( = ?auto_1347287 ?auto_1347289 ) ) ( not ( = ?auto_1347287 ?auto_1347290 ) ) ( not ( = ?auto_1347287 ?auto_1347291 ) ) ( not ( = ?auto_1347287 ?auto_1347292 ) ) ( not ( = ?auto_1347287 ?auto_1347293 ) ) ( not ( = ?auto_1347288 ?auto_1347289 ) ) ( not ( = ?auto_1347288 ?auto_1347290 ) ) ( not ( = ?auto_1347288 ?auto_1347291 ) ) ( not ( = ?auto_1347288 ?auto_1347292 ) ) ( not ( = ?auto_1347288 ?auto_1347293 ) ) ( not ( = ?auto_1347289 ?auto_1347290 ) ) ( not ( = ?auto_1347289 ?auto_1347291 ) ) ( not ( = ?auto_1347289 ?auto_1347292 ) ) ( not ( = ?auto_1347289 ?auto_1347293 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1347290 ?auto_1347291 ?auto_1347292 )
      ( MAKE-6CRATE-VERIFY ?auto_1347286 ?auto_1347287 ?auto_1347288 ?auto_1347289 ?auto_1347290 ?auto_1347291 ?auto_1347292 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1347350 - SURFACE
      ?auto_1347351 - SURFACE
      ?auto_1347352 - SURFACE
      ?auto_1347353 - SURFACE
      ?auto_1347354 - SURFACE
      ?auto_1347355 - SURFACE
      ?auto_1347356 - SURFACE
    )
    :vars
    (
      ?auto_1347357 - HOIST
      ?auto_1347362 - PLACE
      ?auto_1347358 - PLACE
      ?auto_1347359 - HOIST
      ?auto_1347360 - SURFACE
      ?auto_1347361 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1347357 ?auto_1347362 ) ( IS-CRATE ?auto_1347356 ) ( not ( = ?auto_1347355 ?auto_1347356 ) ) ( not ( = ?auto_1347354 ?auto_1347355 ) ) ( not ( = ?auto_1347354 ?auto_1347356 ) ) ( not ( = ?auto_1347358 ?auto_1347362 ) ) ( HOIST-AT ?auto_1347359 ?auto_1347358 ) ( not ( = ?auto_1347357 ?auto_1347359 ) ) ( AVAILABLE ?auto_1347359 ) ( SURFACE-AT ?auto_1347356 ?auto_1347358 ) ( ON ?auto_1347356 ?auto_1347360 ) ( CLEAR ?auto_1347356 ) ( not ( = ?auto_1347355 ?auto_1347360 ) ) ( not ( = ?auto_1347356 ?auto_1347360 ) ) ( not ( = ?auto_1347354 ?auto_1347360 ) ) ( TRUCK-AT ?auto_1347361 ?auto_1347362 ) ( SURFACE-AT ?auto_1347354 ?auto_1347362 ) ( CLEAR ?auto_1347354 ) ( LIFTING ?auto_1347357 ?auto_1347355 ) ( IS-CRATE ?auto_1347355 ) ( ON ?auto_1347351 ?auto_1347350 ) ( ON ?auto_1347352 ?auto_1347351 ) ( ON ?auto_1347353 ?auto_1347352 ) ( ON ?auto_1347354 ?auto_1347353 ) ( not ( = ?auto_1347350 ?auto_1347351 ) ) ( not ( = ?auto_1347350 ?auto_1347352 ) ) ( not ( = ?auto_1347350 ?auto_1347353 ) ) ( not ( = ?auto_1347350 ?auto_1347354 ) ) ( not ( = ?auto_1347350 ?auto_1347355 ) ) ( not ( = ?auto_1347350 ?auto_1347356 ) ) ( not ( = ?auto_1347350 ?auto_1347360 ) ) ( not ( = ?auto_1347351 ?auto_1347352 ) ) ( not ( = ?auto_1347351 ?auto_1347353 ) ) ( not ( = ?auto_1347351 ?auto_1347354 ) ) ( not ( = ?auto_1347351 ?auto_1347355 ) ) ( not ( = ?auto_1347351 ?auto_1347356 ) ) ( not ( = ?auto_1347351 ?auto_1347360 ) ) ( not ( = ?auto_1347352 ?auto_1347353 ) ) ( not ( = ?auto_1347352 ?auto_1347354 ) ) ( not ( = ?auto_1347352 ?auto_1347355 ) ) ( not ( = ?auto_1347352 ?auto_1347356 ) ) ( not ( = ?auto_1347352 ?auto_1347360 ) ) ( not ( = ?auto_1347353 ?auto_1347354 ) ) ( not ( = ?auto_1347353 ?auto_1347355 ) ) ( not ( = ?auto_1347353 ?auto_1347356 ) ) ( not ( = ?auto_1347353 ?auto_1347360 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1347354 ?auto_1347355 ?auto_1347356 )
      ( MAKE-6CRATE-VERIFY ?auto_1347350 ?auto_1347351 ?auto_1347352 ?auto_1347353 ?auto_1347354 ?auto_1347355 ?auto_1347356 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1347414 - SURFACE
      ?auto_1347415 - SURFACE
      ?auto_1347416 - SURFACE
      ?auto_1347417 - SURFACE
      ?auto_1347418 - SURFACE
      ?auto_1347419 - SURFACE
      ?auto_1347420 - SURFACE
    )
    :vars
    (
      ?auto_1347425 - HOIST
      ?auto_1347423 - PLACE
      ?auto_1347422 - PLACE
      ?auto_1347424 - HOIST
      ?auto_1347426 - SURFACE
      ?auto_1347421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1347425 ?auto_1347423 ) ( IS-CRATE ?auto_1347420 ) ( not ( = ?auto_1347419 ?auto_1347420 ) ) ( not ( = ?auto_1347418 ?auto_1347419 ) ) ( not ( = ?auto_1347418 ?auto_1347420 ) ) ( not ( = ?auto_1347422 ?auto_1347423 ) ) ( HOIST-AT ?auto_1347424 ?auto_1347422 ) ( not ( = ?auto_1347425 ?auto_1347424 ) ) ( AVAILABLE ?auto_1347424 ) ( SURFACE-AT ?auto_1347420 ?auto_1347422 ) ( ON ?auto_1347420 ?auto_1347426 ) ( CLEAR ?auto_1347420 ) ( not ( = ?auto_1347419 ?auto_1347426 ) ) ( not ( = ?auto_1347420 ?auto_1347426 ) ) ( not ( = ?auto_1347418 ?auto_1347426 ) ) ( TRUCK-AT ?auto_1347421 ?auto_1347423 ) ( SURFACE-AT ?auto_1347418 ?auto_1347423 ) ( CLEAR ?auto_1347418 ) ( IS-CRATE ?auto_1347419 ) ( AVAILABLE ?auto_1347425 ) ( IN ?auto_1347419 ?auto_1347421 ) ( ON ?auto_1347415 ?auto_1347414 ) ( ON ?auto_1347416 ?auto_1347415 ) ( ON ?auto_1347417 ?auto_1347416 ) ( ON ?auto_1347418 ?auto_1347417 ) ( not ( = ?auto_1347414 ?auto_1347415 ) ) ( not ( = ?auto_1347414 ?auto_1347416 ) ) ( not ( = ?auto_1347414 ?auto_1347417 ) ) ( not ( = ?auto_1347414 ?auto_1347418 ) ) ( not ( = ?auto_1347414 ?auto_1347419 ) ) ( not ( = ?auto_1347414 ?auto_1347420 ) ) ( not ( = ?auto_1347414 ?auto_1347426 ) ) ( not ( = ?auto_1347415 ?auto_1347416 ) ) ( not ( = ?auto_1347415 ?auto_1347417 ) ) ( not ( = ?auto_1347415 ?auto_1347418 ) ) ( not ( = ?auto_1347415 ?auto_1347419 ) ) ( not ( = ?auto_1347415 ?auto_1347420 ) ) ( not ( = ?auto_1347415 ?auto_1347426 ) ) ( not ( = ?auto_1347416 ?auto_1347417 ) ) ( not ( = ?auto_1347416 ?auto_1347418 ) ) ( not ( = ?auto_1347416 ?auto_1347419 ) ) ( not ( = ?auto_1347416 ?auto_1347420 ) ) ( not ( = ?auto_1347416 ?auto_1347426 ) ) ( not ( = ?auto_1347417 ?auto_1347418 ) ) ( not ( = ?auto_1347417 ?auto_1347419 ) ) ( not ( = ?auto_1347417 ?auto_1347420 ) ) ( not ( = ?auto_1347417 ?auto_1347426 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1347418 ?auto_1347419 ?auto_1347420 )
      ( MAKE-6CRATE-VERIFY ?auto_1347414 ?auto_1347415 ?auto_1347416 ?auto_1347417 ?auto_1347418 ?auto_1347419 ?auto_1347420 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1349370 - SURFACE
      ?auto_1349371 - SURFACE
      ?auto_1349372 - SURFACE
      ?auto_1349373 - SURFACE
      ?auto_1349374 - SURFACE
      ?auto_1349375 - SURFACE
      ?auto_1349376 - SURFACE
      ?auto_1349377 - SURFACE
    )
    :vars
    (
      ?auto_1349379 - HOIST
      ?auto_1349378 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1349379 ?auto_1349378 ) ( SURFACE-AT ?auto_1349376 ?auto_1349378 ) ( CLEAR ?auto_1349376 ) ( LIFTING ?auto_1349379 ?auto_1349377 ) ( IS-CRATE ?auto_1349377 ) ( not ( = ?auto_1349376 ?auto_1349377 ) ) ( ON ?auto_1349371 ?auto_1349370 ) ( ON ?auto_1349372 ?auto_1349371 ) ( ON ?auto_1349373 ?auto_1349372 ) ( ON ?auto_1349374 ?auto_1349373 ) ( ON ?auto_1349375 ?auto_1349374 ) ( ON ?auto_1349376 ?auto_1349375 ) ( not ( = ?auto_1349370 ?auto_1349371 ) ) ( not ( = ?auto_1349370 ?auto_1349372 ) ) ( not ( = ?auto_1349370 ?auto_1349373 ) ) ( not ( = ?auto_1349370 ?auto_1349374 ) ) ( not ( = ?auto_1349370 ?auto_1349375 ) ) ( not ( = ?auto_1349370 ?auto_1349376 ) ) ( not ( = ?auto_1349370 ?auto_1349377 ) ) ( not ( = ?auto_1349371 ?auto_1349372 ) ) ( not ( = ?auto_1349371 ?auto_1349373 ) ) ( not ( = ?auto_1349371 ?auto_1349374 ) ) ( not ( = ?auto_1349371 ?auto_1349375 ) ) ( not ( = ?auto_1349371 ?auto_1349376 ) ) ( not ( = ?auto_1349371 ?auto_1349377 ) ) ( not ( = ?auto_1349372 ?auto_1349373 ) ) ( not ( = ?auto_1349372 ?auto_1349374 ) ) ( not ( = ?auto_1349372 ?auto_1349375 ) ) ( not ( = ?auto_1349372 ?auto_1349376 ) ) ( not ( = ?auto_1349372 ?auto_1349377 ) ) ( not ( = ?auto_1349373 ?auto_1349374 ) ) ( not ( = ?auto_1349373 ?auto_1349375 ) ) ( not ( = ?auto_1349373 ?auto_1349376 ) ) ( not ( = ?auto_1349373 ?auto_1349377 ) ) ( not ( = ?auto_1349374 ?auto_1349375 ) ) ( not ( = ?auto_1349374 ?auto_1349376 ) ) ( not ( = ?auto_1349374 ?auto_1349377 ) ) ( not ( = ?auto_1349375 ?auto_1349376 ) ) ( not ( = ?auto_1349375 ?auto_1349377 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1349376 ?auto_1349377 )
      ( MAKE-7CRATE-VERIFY ?auto_1349370 ?auto_1349371 ?auto_1349372 ?auto_1349373 ?auto_1349374 ?auto_1349375 ?auto_1349376 ?auto_1349377 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1349425 - SURFACE
      ?auto_1349426 - SURFACE
      ?auto_1349427 - SURFACE
      ?auto_1349428 - SURFACE
      ?auto_1349429 - SURFACE
      ?auto_1349430 - SURFACE
      ?auto_1349431 - SURFACE
      ?auto_1349432 - SURFACE
    )
    :vars
    (
      ?auto_1349433 - HOIST
      ?auto_1349435 - PLACE
      ?auto_1349434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1349433 ?auto_1349435 ) ( SURFACE-AT ?auto_1349431 ?auto_1349435 ) ( CLEAR ?auto_1349431 ) ( IS-CRATE ?auto_1349432 ) ( not ( = ?auto_1349431 ?auto_1349432 ) ) ( TRUCK-AT ?auto_1349434 ?auto_1349435 ) ( AVAILABLE ?auto_1349433 ) ( IN ?auto_1349432 ?auto_1349434 ) ( ON ?auto_1349431 ?auto_1349430 ) ( not ( = ?auto_1349430 ?auto_1349431 ) ) ( not ( = ?auto_1349430 ?auto_1349432 ) ) ( ON ?auto_1349426 ?auto_1349425 ) ( ON ?auto_1349427 ?auto_1349426 ) ( ON ?auto_1349428 ?auto_1349427 ) ( ON ?auto_1349429 ?auto_1349428 ) ( ON ?auto_1349430 ?auto_1349429 ) ( not ( = ?auto_1349425 ?auto_1349426 ) ) ( not ( = ?auto_1349425 ?auto_1349427 ) ) ( not ( = ?auto_1349425 ?auto_1349428 ) ) ( not ( = ?auto_1349425 ?auto_1349429 ) ) ( not ( = ?auto_1349425 ?auto_1349430 ) ) ( not ( = ?auto_1349425 ?auto_1349431 ) ) ( not ( = ?auto_1349425 ?auto_1349432 ) ) ( not ( = ?auto_1349426 ?auto_1349427 ) ) ( not ( = ?auto_1349426 ?auto_1349428 ) ) ( not ( = ?auto_1349426 ?auto_1349429 ) ) ( not ( = ?auto_1349426 ?auto_1349430 ) ) ( not ( = ?auto_1349426 ?auto_1349431 ) ) ( not ( = ?auto_1349426 ?auto_1349432 ) ) ( not ( = ?auto_1349427 ?auto_1349428 ) ) ( not ( = ?auto_1349427 ?auto_1349429 ) ) ( not ( = ?auto_1349427 ?auto_1349430 ) ) ( not ( = ?auto_1349427 ?auto_1349431 ) ) ( not ( = ?auto_1349427 ?auto_1349432 ) ) ( not ( = ?auto_1349428 ?auto_1349429 ) ) ( not ( = ?auto_1349428 ?auto_1349430 ) ) ( not ( = ?auto_1349428 ?auto_1349431 ) ) ( not ( = ?auto_1349428 ?auto_1349432 ) ) ( not ( = ?auto_1349429 ?auto_1349430 ) ) ( not ( = ?auto_1349429 ?auto_1349431 ) ) ( not ( = ?auto_1349429 ?auto_1349432 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1349430 ?auto_1349431 ?auto_1349432 )
      ( MAKE-7CRATE-VERIFY ?auto_1349425 ?auto_1349426 ?auto_1349427 ?auto_1349428 ?auto_1349429 ?auto_1349430 ?auto_1349431 ?auto_1349432 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1349488 - SURFACE
      ?auto_1349489 - SURFACE
      ?auto_1349490 - SURFACE
      ?auto_1349491 - SURFACE
      ?auto_1349492 - SURFACE
      ?auto_1349493 - SURFACE
      ?auto_1349494 - SURFACE
      ?auto_1349495 - SURFACE
    )
    :vars
    (
      ?auto_1349496 - HOIST
      ?auto_1349498 - PLACE
      ?auto_1349499 - TRUCK
      ?auto_1349497 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1349496 ?auto_1349498 ) ( SURFACE-AT ?auto_1349494 ?auto_1349498 ) ( CLEAR ?auto_1349494 ) ( IS-CRATE ?auto_1349495 ) ( not ( = ?auto_1349494 ?auto_1349495 ) ) ( AVAILABLE ?auto_1349496 ) ( IN ?auto_1349495 ?auto_1349499 ) ( ON ?auto_1349494 ?auto_1349493 ) ( not ( = ?auto_1349493 ?auto_1349494 ) ) ( not ( = ?auto_1349493 ?auto_1349495 ) ) ( TRUCK-AT ?auto_1349499 ?auto_1349497 ) ( not ( = ?auto_1349497 ?auto_1349498 ) ) ( ON ?auto_1349489 ?auto_1349488 ) ( ON ?auto_1349490 ?auto_1349489 ) ( ON ?auto_1349491 ?auto_1349490 ) ( ON ?auto_1349492 ?auto_1349491 ) ( ON ?auto_1349493 ?auto_1349492 ) ( not ( = ?auto_1349488 ?auto_1349489 ) ) ( not ( = ?auto_1349488 ?auto_1349490 ) ) ( not ( = ?auto_1349488 ?auto_1349491 ) ) ( not ( = ?auto_1349488 ?auto_1349492 ) ) ( not ( = ?auto_1349488 ?auto_1349493 ) ) ( not ( = ?auto_1349488 ?auto_1349494 ) ) ( not ( = ?auto_1349488 ?auto_1349495 ) ) ( not ( = ?auto_1349489 ?auto_1349490 ) ) ( not ( = ?auto_1349489 ?auto_1349491 ) ) ( not ( = ?auto_1349489 ?auto_1349492 ) ) ( not ( = ?auto_1349489 ?auto_1349493 ) ) ( not ( = ?auto_1349489 ?auto_1349494 ) ) ( not ( = ?auto_1349489 ?auto_1349495 ) ) ( not ( = ?auto_1349490 ?auto_1349491 ) ) ( not ( = ?auto_1349490 ?auto_1349492 ) ) ( not ( = ?auto_1349490 ?auto_1349493 ) ) ( not ( = ?auto_1349490 ?auto_1349494 ) ) ( not ( = ?auto_1349490 ?auto_1349495 ) ) ( not ( = ?auto_1349491 ?auto_1349492 ) ) ( not ( = ?auto_1349491 ?auto_1349493 ) ) ( not ( = ?auto_1349491 ?auto_1349494 ) ) ( not ( = ?auto_1349491 ?auto_1349495 ) ) ( not ( = ?auto_1349492 ?auto_1349493 ) ) ( not ( = ?auto_1349492 ?auto_1349494 ) ) ( not ( = ?auto_1349492 ?auto_1349495 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1349493 ?auto_1349494 ?auto_1349495 )
      ( MAKE-7CRATE-VERIFY ?auto_1349488 ?auto_1349489 ?auto_1349490 ?auto_1349491 ?auto_1349492 ?auto_1349493 ?auto_1349494 ?auto_1349495 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1349558 - SURFACE
      ?auto_1349559 - SURFACE
      ?auto_1349560 - SURFACE
      ?auto_1349561 - SURFACE
      ?auto_1349562 - SURFACE
      ?auto_1349563 - SURFACE
      ?auto_1349564 - SURFACE
      ?auto_1349565 - SURFACE
    )
    :vars
    (
      ?auto_1349569 - HOIST
      ?auto_1349570 - PLACE
      ?auto_1349568 - TRUCK
      ?auto_1349567 - PLACE
      ?auto_1349566 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1349569 ?auto_1349570 ) ( SURFACE-AT ?auto_1349564 ?auto_1349570 ) ( CLEAR ?auto_1349564 ) ( IS-CRATE ?auto_1349565 ) ( not ( = ?auto_1349564 ?auto_1349565 ) ) ( AVAILABLE ?auto_1349569 ) ( ON ?auto_1349564 ?auto_1349563 ) ( not ( = ?auto_1349563 ?auto_1349564 ) ) ( not ( = ?auto_1349563 ?auto_1349565 ) ) ( TRUCK-AT ?auto_1349568 ?auto_1349567 ) ( not ( = ?auto_1349567 ?auto_1349570 ) ) ( HOIST-AT ?auto_1349566 ?auto_1349567 ) ( LIFTING ?auto_1349566 ?auto_1349565 ) ( not ( = ?auto_1349569 ?auto_1349566 ) ) ( ON ?auto_1349559 ?auto_1349558 ) ( ON ?auto_1349560 ?auto_1349559 ) ( ON ?auto_1349561 ?auto_1349560 ) ( ON ?auto_1349562 ?auto_1349561 ) ( ON ?auto_1349563 ?auto_1349562 ) ( not ( = ?auto_1349558 ?auto_1349559 ) ) ( not ( = ?auto_1349558 ?auto_1349560 ) ) ( not ( = ?auto_1349558 ?auto_1349561 ) ) ( not ( = ?auto_1349558 ?auto_1349562 ) ) ( not ( = ?auto_1349558 ?auto_1349563 ) ) ( not ( = ?auto_1349558 ?auto_1349564 ) ) ( not ( = ?auto_1349558 ?auto_1349565 ) ) ( not ( = ?auto_1349559 ?auto_1349560 ) ) ( not ( = ?auto_1349559 ?auto_1349561 ) ) ( not ( = ?auto_1349559 ?auto_1349562 ) ) ( not ( = ?auto_1349559 ?auto_1349563 ) ) ( not ( = ?auto_1349559 ?auto_1349564 ) ) ( not ( = ?auto_1349559 ?auto_1349565 ) ) ( not ( = ?auto_1349560 ?auto_1349561 ) ) ( not ( = ?auto_1349560 ?auto_1349562 ) ) ( not ( = ?auto_1349560 ?auto_1349563 ) ) ( not ( = ?auto_1349560 ?auto_1349564 ) ) ( not ( = ?auto_1349560 ?auto_1349565 ) ) ( not ( = ?auto_1349561 ?auto_1349562 ) ) ( not ( = ?auto_1349561 ?auto_1349563 ) ) ( not ( = ?auto_1349561 ?auto_1349564 ) ) ( not ( = ?auto_1349561 ?auto_1349565 ) ) ( not ( = ?auto_1349562 ?auto_1349563 ) ) ( not ( = ?auto_1349562 ?auto_1349564 ) ) ( not ( = ?auto_1349562 ?auto_1349565 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1349563 ?auto_1349564 ?auto_1349565 )
      ( MAKE-7CRATE-VERIFY ?auto_1349558 ?auto_1349559 ?auto_1349560 ?auto_1349561 ?auto_1349562 ?auto_1349563 ?auto_1349564 ?auto_1349565 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1349635 - SURFACE
      ?auto_1349636 - SURFACE
      ?auto_1349637 - SURFACE
      ?auto_1349638 - SURFACE
      ?auto_1349639 - SURFACE
      ?auto_1349640 - SURFACE
      ?auto_1349641 - SURFACE
      ?auto_1349642 - SURFACE
    )
    :vars
    (
      ?auto_1349648 - HOIST
      ?auto_1349643 - PLACE
      ?auto_1349645 - TRUCK
      ?auto_1349644 - PLACE
      ?auto_1349647 - HOIST
      ?auto_1349646 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1349648 ?auto_1349643 ) ( SURFACE-AT ?auto_1349641 ?auto_1349643 ) ( CLEAR ?auto_1349641 ) ( IS-CRATE ?auto_1349642 ) ( not ( = ?auto_1349641 ?auto_1349642 ) ) ( AVAILABLE ?auto_1349648 ) ( ON ?auto_1349641 ?auto_1349640 ) ( not ( = ?auto_1349640 ?auto_1349641 ) ) ( not ( = ?auto_1349640 ?auto_1349642 ) ) ( TRUCK-AT ?auto_1349645 ?auto_1349644 ) ( not ( = ?auto_1349644 ?auto_1349643 ) ) ( HOIST-AT ?auto_1349647 ?auto_1349644 ) ( not ( = ?auto_1349648 ?auto_1349647 ) ) ( AVAILABLE ?auto_1349647 ) ( SURFACE-AT ?auto_1349642 ?auto_1349644 ) ( ON ?auto_1349642 ?auto_1349646 ) ( CLEAR ?auto_1349642 ) ( not ( = ?auto_1349641 ?auto_1349646 ) ) ( not ( = ?auto_1349642 ?auto_1349646 ) ) ( not ( = ?auto_1349640 ?auto_1349646 ) ) ( ON ?auto_1349636 ?auto_1349635 ) ( ON ?auto_1349637 ?auto_1349636 ) ( ON ?auto_1349638 ?auto_1349637 ) ( ON ?auto_1349639 ?auto_1349638 ) ( ON ?auto_1349640 ?auto_1349639 ) ( not ( = ?auto_1349635 ?auto_1349636 ) ) ( not ( = ?auto_1349635 ?auto_1349637 ) ) ( not ( = ?auto_1349635 ?auto_1349638 ) ) ( not ( = ?auto_1349635 ?auto_1349639 ) ) ( not ( = ?auto_1349635 ?auto_1349640 ) ) ( not ( = ?auto_1349635 ?auto_1349641 ) ) ( not ( = ?auto_1349635 ?auto_1349642 ) ) ( not ( = ?auto_1349635 ?auto_1349646 ) ) ( not ( = ?auto_1349636 ?auto_1349637 ) ) ( not ( = ?auto_1349636 ?auto_1349638 ) ) ( not ( = ?auto_1349636 ?auto_1349639 ) ) ( not ( = ?auto_1349636 ?auto_1349640 ) ) ( not ( = ?auto_1349636 ?auto_1349641 ) ) ( not ( = ?auto_1349636 ?auto_1349642 ) ) ( not ( = ?auto_1349636 ?auto_1349646 ) ) ( not ( = ?auto_1349637 ?auto_1349638 ) ) ( not ( = ?auto_1349637 ?auto_1349639 ) ) ( not ( = ?auto_1349637 ?auto_1349640 ) ) ( not ( = ?auto_1349637 ?auto_1349641 ) ) ( not ( = ?auto_1349637 ?auto_1349642 ) ) ( not ( = ?auto_1349637 ?auto_1349646 ) ) ( not ( = ?auto_1349638 ?auto_1349639 ) ) ( not ( = ?auto_1349638 ?auto_1349640 ) ) ( not ( = ?auto_1349638 ?auto_1349641 ) ) ( not ( = ?auto_1349638 ?auto_1349642 ) ) ( not ( = ?auto_1349638 ?auto_1349646 ) ) ( not ( = ?auto_1349639 ?auto_1349640 ) ) ( not ( = ?auto_1349639 ?auto_1349641 ) ) ( not ( = ?auto_1349639 ?auto_1349642 ) ) ( not ( = ?auto_1349639 ?auto_1349646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1349640 ?auto_1349641 ?auto_1349642 )
      ( MAKE-7CRATE-VERIFY ?auto_1349635 ?auto_1349636 ?auto_1349637 ?auto_1349638 ?auto_1349639 ?auto_1349640 ?auto_1349641 ?auto_1349642 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1349713 - SURFACE
      ?auto_1349714 - SURFACE
      ?auto_1349715 - SURFACE
      ?auto_1349716 - SURFACE
      ?auto_1349717 - SURFACE
      ?auto_1349718 - SURFACE
      ?auto_1349719 - SURFACE
      ?auto_1349720 - SURFACE
    )
    :vars
    (
      ?auto_1349721 - HOIST
      ?auto_1349723 - PLACE
      ?auto_1349726 - PLACE
      ?auto_1349725 - HOIST
      ?auto_1349724 - SURFACE
      ?auto_1349722 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1349721 ?auto_1349723 ) ( SURFACE-AT ?auto_1349719 ?auto_1349723 ) ( CLEAR ?auto_1349719 ) ( IS-CRATE ?auto_1349720 ) ( not ( = ?auto_1349719 ?auto_1349720 ) ) ( AVAILABLE ?auto_1349721 ) ( ON ?auto_1349719 ?auto_1349718 ) ( not ( = ?auto_1349718 ?auto_1349719 ) ) ( not ( = ?auto_1349718 ?auto_1349720 ) ) ( not ( = ?auto_1349726 ?auto_1349723 ) ) ( HOIST-AT ?auto_1349725 ?auto_1349726 ) ( not ( = ?auto_1349721 ?auto_1349725 ) ) ( AVAILABLE ?auto_1349725 ) ( SURFACE-AT ?auto_1349720 ?auto_1349726 ) ( ON ?auto_1349720 ?auto_1349724 ) ( CLEAR ?auto_1349720 ) ( not ( = ?auto_1349719 ?auto_1349724 ) ) ( not ( = ?auto_1349720 ?auto_1349724 ) ) ( not ( = ?auto_1349718 ?auto_1349724 ) ) ( TRUCK-AT ?auto_1349722 ?auto_1349723 ) ( ON ?auto_1349714 ?auto_1349713 ) ( ON ?auto_1349715 ?auto_1349714 ) ( ON ?auto_1349716 ?auto_1349715 ) ( ON ?auto_1349717 ?auto_1349716 ) ( ON ?auto_1349718 ?auto_1349717 ) ( not ( = ?auto_1349713 ?auto_1349714 ) ) ( not ( = ?auto_1349713 ?auto_1349715 ) ) ( not ( = ?auto_1349713 ?auto_1349716 ) ) ( not ( = ?auto_1349713 ?auto_1349717 ) ) ( not ( = ?auto_1349713 ?auto_1349718 ) ) ( not ( = ?auto_1349713 ?auto_1349719 ) ) ( not ( = ?auto_1349713 ?auto_1349720 ) ) ( not ( = ?auto_1349713 ?auto_1349724 ) ) ( not ( = ?auto_1349714 ?auto_1349715 ) ) ( not ( = ?auto_1349714 ?auto_1349716 ) ) ( not ( = ?auto_1349714 ?auto_1349717 ) ) ( not ( = ?auto_1349714 ?auto_1349718 ) ) ( not ( = ?auto_1349714 ?auto_1349719 ) ) ( not ( = ?auto_1349714 ?auto_1349720 ) ) ( not ( = ?auto_1349714 ?auto_1349724 ) ) ( not ( = ?auto_1349715 ?auto_1349716 ) ) ( not ( = ?auto_1349715 ?auto_1349717 ) ) ( not ( = ?auto_1349715 ?auto_1349718 ) ) ( not ( = ?auto_1349715 ?auto_1349719 ) ) ( not ( = ?auto_1349715 ?auto_1349720 ) ) ( not ( = ?auto_1349715 ?auto_1349724 ) ) ( not ( = ?auto_1349716 ?auto_1349717 ) ) ( not ( = ?auto_1349716 ?auto_1349718 ) ) ( not ( = ?auto_1349716 ?auto_1349719 ) ) ( not ( = ?auto_1349716 ?auto_1349720 ) ) ( not ( = ?auto_1349716 ?auto_1349724 ) ) ( not ( = ?auto_1349717 ?auto_1349718 ) ) ( not ( = ?auto_1349717 ?auto_1349719 ) ) ( not ( = ?auto_1349717 ?auto_1349720 ) ) ( not ( = ?auto_1349717 ?auto_1349724 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1349718 ?auto_1349719 ?auto_1349720 )
      ( MAKE-7CRATE-VERIFY ?auto_1349713 ?auto_1349714 ?auto_1349715 ?auto_1349716 ?auto_1349717 ?auto_1349718 ?auto_1349719 ?auto_1349720 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1349791 - SURFACE
      ?auto_1349792 - SURFACE
      ?auto_1349793 - SURFACE
      ?auto_1349794 - SURFACE
      ?auto_1349795 - SURFACE
      ?auto_1349796 - SURFACE
      ?auto_1349797 - SURFACE
      ?auto_1349798 - SURFACE
    )
    :vars
    (
      ?auto_1349804 - HOIST
      ?auto_1349802 - PLACE
      ?auto_1349801 - PLACE
      ?auto_1349799 - HOIST
      ?auto_1349800 - SURFACE
      ?auto_1349803 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1349804 ?auto_1349802 ) ( IS-CRATE ?auto_1349798 ) ( not ( = ?auto_1349797 ?auto_1349798 ) ) ( not ( = ?auto_1349796 ?auto_1349797 ) ) ( not ( = ?auto_1349796 ?auto_1349798 ) ) ( not ( = ?auto_1349801 ?auto_1349802 ) ) ( HOIST-AT ?auto_1349799 ?auto_1349801 ) ( not ( = ?auto_1349804 ?auto_1349799 ) ) ( AVAILABLE ?auto_1349799 ) ( SURFACE-AT ?auto_1349798 ?auto_1349801 ) ( ON ?auto_1349798 ?auto_1349800 ) ( CLEAR ?auto_1349798 ) ( not ( = ?auto_1349797 ?auto_1349800 ) ) ( not ( = ?auto_1349798 ?auto_1349800 ) ) ( not ( = ?auto_1349796 ?auto_1349800 ) ) ( TRUCK-AT ?auto_1349803 ?auto_1349802 ) ( SURFACE-AT ?auto_1349796 ?auto_1349802 ) ( CLEAR ?auto_1349796 ) ( LIFTING ?auto_1349804 ?auto_1349797 ) ( IS-CRATE ?auto_1349797 ) ( ON ?auto_1349792 ?auto_1349791 ) ( ON ?auto_1349793 ?auto_1349792 ) ( ON ?auto_1349794 ?auto_1349793 ) ( ON ?auto_1349795 ?auto_1349794 ) ( ON ?auto_1349796 ?auto_1349795 ) ( not ( = ?auto_1349791 ?auto_1349792 ) ) ( not ( = ?auto_1349791 ?auto_1349793 ) ) ( not ( = ?auto_1349791 ?auto_1349794 ) ) ( not ( = ?auto_1349791 ?auto_1349795 ) ) ( not ( = ?auto_1349791 ?auto_1349796 ) ) ( not ( = ?auto_1349791 ?auto_1349797 ) ) ( not ( = ?auto_1349791 ?auto_1349798 ) ) ( not ( = ?auto_1349791 ?auto_1349800 ) ) ( not ( = ?auto_1349792 ?auto_1349793 ) ) ( not ( = ?auto_1349792 ?auto_1349794 ) ) ( not ( = ?auto_1349792 ?auto_1349795 ) ) ( not ( = ?auto_1349792 ?auto_1349796 ) ) ( not ( = ?auto_1349792 ?auto_1349797 ) ) ( not ( = ?auto_1349792 ?auto_1349798 ) ) ( not ( = ?auto_1349792 ?auto_1349800 ) ) ( not ( = ?auto_1349793 ?auto_1349794 ) ) ( not ( = ?auto_1349793 ?auto_1349795 ) ) ( not ( = ?auto_1349793 ?auto_1349796 ) ) ( not ( = ?auto_1349793 ?auto_1349797 ) ) ( not ( = ?auto_1349793 ?auto_1349798 ) ) ( not ( = ?auto_1349793 ?auto_1349800 ) ) ( not ( = ?auto_1349794 ?auto_1349795 ) ) ( not ( = ?auto_1349794 ?auto_1349796 ) ) ( not ( = ?auto_1349794 ?auto_1349797 ) ) ( not ( = ?auto_1349794 ?auto_1349798 ) ) ( not ( = ?auto_1349794 ?auto_1349800 ) ) ( not ( = ?auto_1349795 ?auto_1349796 ) ) ( not ( = ?auto_1349795 ?auto_1349797 ) ) ( not ( = ?auto_1349795 ?auto_1349798 ) ) ( not ( = ?auto_1349795 ?auto_1349800 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1349796 ?auto_1349797 ?auto_1349798 )
      ( MAKE-7CRATE-VERIFY ?auto_1349791 ?auto_1349792 ?auto_1349793 ?auto_1349794 ?auto_1349795 ?auto_1349796 ?auto_1349797 ?auto_1349798 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1349869 - SURFACE
      ?auto_1349870 - SURFACE
      ?auto_1349871 - SURFACE
      ?auto_1349872 - SURFACE
      ?auto_1349873 - SURFACE
      ?auto_1349874 - SURFACE
      ?auto_1349875 - SURFACE
      ?auto_1349876 - SURFACE
    )
    :vars
    (
      ?auto_1349882 - HOIST
      ?auto_1349880 - PLACE
      ?auto_1349881 - PLACE
      ?auto_1349878 - HOIST
      ?auto_1349879 - SURFACE
      ?auto_1349877 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1349882 ?auto_1349880 ) ( IS-CRATE ?auto_1349876 ) ( not ( = ?auto_1349875 ?auto_1349876 ) ) ( not ( = ?auto_1349874 ?auto_1349875 ) ) ( not ( = ?auto_1349874 ?auto_1349876 ) ) ( not ( = ?auto_1349881 ?auto_1349880 ) ) ( HOIST-AT ?auto_1349878 ?auto_1349881 ) ( not ( = ?auto_1349882 ?auto_1349878 ) ) ( AVAILABLE ?auto_1349878 ) ( SURFACE-AT ?auto_1349876 ?auto_1349881 ) ( ON ?auto_1349876 ?auto_1349879 ) ( CLEAR ?auto_1349876 ) ( not ( = ?auto_1349875 ?auto_1349879 ) ) ( not ( = ?auto_1349876 ?auto_1349879 ) ) ( not ( = ?auto_1349874 ?auto_1349879 ) ) ( TRUCK-AT ?auto_1349877 ?auto_1349880 ) ( SURFACE-AT ?auto_1349874 ?auto_1349880 ) ( CLEAR ?auto_1349874 ) ( IS-CRATE ?auto_1349875 ) ( AVAILABLE ?auto_1349882 ) ( IN ?auto_1349875 ?auto_1349877 ) ( ON ?auto_1349870 ?auto_1349869 ) ( ON ?auto_1349871 ?auto_1349870 ) ( ON ?auto_1349872 ?auto_1349871 ) ( ON ?auto_1349873 ?auto_1349872 ) ( ON ?auto_1349874 ?auto_1349873 ) ( not ( = ?auto_1349869 ?auto_1349870 ) ) ( not ( = ?auto_1349869 ?auto_1349871 ) ) ( not ( = ?auto_1349869 ?auto_1349872 ) ) ( not ( = ?auto_1349869 ?auto_1349873 ) ) ( not ( = ?auto_1349869 ?auto_1349874 ) ) ( not ( = ?auto_1349869 ?auto_1349875 ) ) ( not ( = ?auto_1349869 ?auto_1349876 ) ) ( not ( = ?auto_1349869 ?auto_1349879 ) ) ( not ( = ?auto_1349870 ?auto_1349871 ) ) ( not ( = ?auto_1349870 ?auto_1349872 ) ) ( not ( = ?auto_1349870 ?auto_1349873 ) ) ( not ( = ?auto_1349870 ?auto_1349874 ) ) ( not ( = ?auto_1349870 ?auto_1349875 ) ) ( not ( = ?auto_1349870 ?auto_1349876 ) ) ( not ( = ?auto_1349870 ?auto_1349879 ) ) ( not ( = ?auto_1349871 ?auto_1349872 ) ) ( not ( = ?auto_1349871 ?auto_1349873 ) ) ( not ( = ?auto_1349871 ?auto_1349874 ) ) ( not ( = ?auto_1349871 ?auto_1349875 ) ) ( not ( = ?auto_1349871 ?auto_1349876 ) ) ( not ( = ?auto_1349871 ?auto_1349879 ) ) ( not ( = ?auto_1349872 ?auto_1349873 ) ) ( not ( = ?auto_1349872 ?auto_1349874 ) ) ( not ( = ?auto_1349872 ?auto_1349875 ) ) ( not ( = ?auto_1349872 ?auto_1349876 ) ) ( not ( = ?auto_1349872 ?auto_1349879 ) ) ( not ( = ?auto_1349873 ?auto_1349874 ) ) ( not ( = ?auto_1349873 ?auto_1349875 ) ) ( not ( = ?auto_1349873 ?auto_1349876 ) ) ( not ( = ?auto_1349873 ?auto_1349879 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1349874 ?auto_1349875 ?auto_1349876 )
      ( MAKE-7CRATE-VERIFY ?auto_1349869 ?auto_1349870 ?auto_1349871 ?auto_1349872 ?auto_1349873 ?auto_1349874 ?auto_1349875 ?auto_1349876 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1350946 - SURFACE
      ?auto_1350947 - SURFACE
    )
    :vars
    (
      ?auto_1350954 - HOIST
      ?auto_1350953 - PLACE
      ?auto_1350948 - SURFACE
      ?auto_1350949 - TRUCK
      ?auto_1350952 - PLACE
      ?auto_1350951 - HOIST
      ?auto_1350950 - SURFACE
      ?auto_1350955 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1350954 ?auto_1350953 ) ( SURFACE-AT ?auto_1350946 ?auto_1350953 ) ( CLEAR ?auto_1350946 ) ( IS-CRATE ?auto_1350947 ) ( not ( = ?auto_1350946 ?auto_1350947 ) ) ( AVAILABLE ?auto_1350954 ) ( ON ?auto_1350946 ?auto_1350948 ) ( not ( = ?auto_1350948 ?auto_1350946 ) ) ( not ( = ?auto_1350948 ?auto_1350947 ) ) ( TRUCK-AT ?auto_1350949 ?auto_1350952 ) ( not ( = ?auto_1350952 ?auto_1350953 ) ) ( HOIST-AT ?auto_1350951 ?auto_1350952 ) ( not ( = ?auto_1350954 ?auto_1350951 ) ) ( SURFACE-AT ?auto_1350947 ?auto_1350952 ) ( ON ?auto_1350947 ?auto_1350950 ) ( CLEAR ?auto_1350947 ) ( not ( = ?auto_1350946 ?auto_1350950 ) ) ( not ( = ?auto_1350947 ?auto_1350950 ) ) ( not ( = ?auto_1350948 ?auto_1350950 ) ) ( LIFTING ?auto_1350951 ?auto_1350955 ) ( IS-CRATE ?auto_1350955 ) ( not ( = ?auto_1350946 ?auto_1350955 ) ) ( not ( = ?auto_1350947 ?auto_1350955 ) ) ( not ( = ?auto_1350948 ?auto_1350955 ) ) ( not ( = ?auto_1350950 ?auto_1350955 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1350951 ?auto_1350955 ?auto_1350949 ?auto_1350952 )
      ( MAKE-1CRATE ?auto_1350946 ?auto_1350947 )
      ( MAKE-1CRATE-VERIFY ?auto_1350946 ?auto_1350947 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1352779 - SURFACE
      ?auto_1352780 - SURFACE
      ?auto_1352781 - SURFACE
      ?auto_1352782 - SURFACE
      ?auto_1352783 - SURFACE
      ?auto_1352784 - SURFACE
      ?auto_1352785 - SURFACE
      ?auto_1352786 - SURFACE
      ?auto_1352787 - SURFACE
    )
    :vars
    (
      ?auto_1352789 - HOIST
      ?auto_1352788 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352789 ?auto_1352788 ) ( SURFACE-AT ?auto_1352786 ?auto_1352788 ) ( CLEAR ?auto_1352786 ) ( LIFTING ?auto_1352789 ?auto_1352787 ) ( IS-CRATE ?auto_1352787 ) ( not ( = ?auto_1352786 ?auto_1352787 ) ) ( ON ?auto_1352780 ?auto_1352779 ) ( ON ?auto_1352781 ?auto_1352780 ) ( ON ?auto_1352782 ?auto_1352781 ) ( ON ?auto_1352783 ?auto_1352782 ) ( ON ?auto_1352784 ?auto_1352783 ) ( ON ?auto_1352785 ?auto_1352784 ) ( ON ?auto_1352786 ?auto_1352785 ) ( not ( = ?auto_1352779 ?auto_1352780 ) ) ( not ( = ?auto_1352779 ?auto_1352781 ) ) ( not ( = ?auto_1352779 ?auto_1352782 ) ) ( not ( = ?auto_1352779 ?auto_1352783 ) ) ( not ( = ?auto_1352779 ?auto_1352784 ) ) ( not ( = ?auto_1352779 ?auto_1352785 ) ) ( not ( = ?auto_1352779 ?auto_1352786 ) ) ( not ( = ?auto_1352779 ?auto_1352787 ) ) ( not ( = ?auto_1352780 ?auto_1352781 ) ) ( not ( = ?auto_1352780 ?auto_1352782 ) ) ( not ( = ?auto_1352780 ?auto_1352783 ) ) ( not ( = ?auto_1352780 ?auto_1352784 ) ) ( not ( = ?auto_1352780 ?auto_1352785 ) ) ( not ( = ?auto_1352780 ?auto_1352786 ) ) ( not ( = ?auto_1352780 ?auto_1352787 ) ) ( not ( = ?auto_1352781 ?auto_1352782 ) ) ( not ( = ?auto_1352781 ?auto_1352783 ) ) ( not ( = ?auto_1352781 ?auto_1352784 ) ) ( not ( = ?auto_1352781 ?auto_1352785 ) ) ( not ( = ?auto_1352781 ?auto_1352786 ) ) ( not ( = ?auto_1352781 ?auto_1352787 ) ) ( not ( = ?auto_1352782 ?auto_1352783 ) ) ( not ( = ?auto_1352782 ?auto_1352784 ) ) ( not ( = ?auto_1352782 ?auto_1352785 ) ) ( not ( = ?auto_1352782 ?auto_1352786 ) ) ( not ( = ?auto_1352782 ?auto_1352787 ) ) ( not ( = ?auto_1352783 ?auto_1352784 ) ) ( not ( = ?auto_1352783 ?auto_1352785 ) ) ( not ( = ?auto_1352783 ?auto_1352786 ) ) ( not ( = ?auto_1352783 ?auto_1352787 ) ) ( not ( = ?auto_1352784 ?auto_1352785 ) ) ( not ( = ?auto_1352784 ?auto_1352786 ) ) ( not ( = ?auto_1352784 ?auto_1352787 ) ) ( not ( = ?auto_1352785 ?auto_1352786 ) ) ( not ( = ?auto_1352785 ?auto_1352787 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1352786 ?auto_1352787 )
      ( MAKE-8CRATE-VERIFY ?auto_1352779 ?auto_1352780 ?auto_1352781 ?auto_1352782 ?auto_1352783 ?auto_1352784 ?auto_1352785 ?auto_1352786 ?auto_1352787 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1352846 - SURFACE
      ?auto_1352847 - SURFACE
      ?auto_1352848 - SURFACE
      ?auto_1352849 - SURFACE
      ?auto_1352850 - SURFACE
      ?auto_1352851 - SURFACE
      ?auto_1352852 - SURFACE
      ?auto_1352853 - SURFACE
      ?auto_1352854 - SURFACE
    )
    :vars
    (
      ?auto_1352856 - HOIST
      ?auto_1352857 - PLACE
      ?auto_1352855 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352856 ?auto_1352857 ) ( SURFACE-AT ?auto_1352853 ?auto_1352857 ) ( CLEAR ?auto_1352853 ) ( IS-CRATE ?auto_1352854 ) ( not ( = ?auto_1352853 ?auto_1352854 ) ) ( TRUCK-AT ?auto_1352855 ?auto_1352857 ) ( AVAILABLE ?auto_1352856 ) ( IN ?auto_1352854 ?auto_1352855 ) ( ON ?auto_1352853 ?auto_1352852 ) ( not ( = ?auto_1352852 ?auto_1352853 ) ) ( not ( = ?auto_1352852 ?auto_1352854 ) ) ( ON ?auto_1352847 ?auto_1352846 ) ( ON ?auto_1352848 ?auto_1352847 ) ( ON ?auto_1352849 ?auto_1352848 ) ( ON ?auto_1352850 ?auto_1352849 ) ( ON ?auto_1352851 ?auto_1352850 ) ( ON ?auto_1352852 ?auto_1352851 ) ( not ( = ?auto_1352846 ?auto_1352847 ) ) ( not ( = ?auto_1352846 ?auto_1352848 ) ) ( not ( = ?auto_1352846 ?auto_1352849 ) ) ( not ( = ?auto_1352846 ?auto_1352850 ) ) ( not ( = ?auto_1352846 ?auto_1352851 ) ) ( not ( = ?auto_1352846 ?auto_1352852 ) ) ( not ( = ?auto_1352846 ?auto_1352853 ) ) ( not ( = ?auto_1352846 ?auto_1352854 ) ) ( not ( = ?auto_1352847 ?auto_1352848 ) ) ( not ( = ?auto_1352847 ?auto_1352849 ) ) ( not ( = ?auto_1352847 ?auto_1352850 ) ) ( not ( = ?auto_1352847 ?auto_1352851 ) ) ( not ( = ?auto_1352847 ?auto_1352852 ) ) ( not ( = ?auto_1352847 ?auto_1352853 ) ) ( not ( = ?auto_1352847 ?auto_1352854 ) ) ( not ( = ?auto_1352848 ?auto_1352849 ) ) ( not ( = ?auto_1352848 ?auto_1352850 ) ) ( not ( = ?auto_1352848 ?auto_1352851 ) ) ( not ( = ?auto_1352848 ?auto_1352852 ) ) ( not ( = ?auto_1352848 ?auto_1352853 ) ) ( not ( = ?auto_1352848 ?auto_1352854 ) ) ( not ( = ?auto_1352849 ?auto_1352850 ) ) ( not ( = ?auto_1352849 ?auto_1352851 ) ) ( not ( = ?auto_1352849 ?auto_1352852 ) ) ( not ( = ?auto_1352849 ?auto_1352853 ) ) ( not ( = ?auto_1352849 ?auto_1352854 ) ) ( not ( = ?auto_1352850 ?auto_1352851 ) ) ( not ( = ?auto_1352850 ?auto_1352852 ) ) ( not ( = ?auto_1352850 ?auto_1352853 ) ) ( not ( = ?auto_1352850 ?auto_1352854 ) ) ( not ( = ?auto_1352851 ?auto_1352852 ) ) ( not ( = ?auto_1352851 ?auto_1352853 ) ) ( not ( = ?auto_1352851 ?auto_1352854 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352852 ?auto_1352853 ?auto_1352854 )
      ( MAKE-8CRATE-VERIFY ?auto_1352846 ?auto_1352847 ?auto_1352848 ?auto_1352849 ?auto_1352850 ?auto_1352851 ?auto_1352852 ?auto_1352853 ?auto_1352854 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1352922 - SURFACE
      ?auto_1352923 - SURFACE
      ?auto_1352924 - SURFACE
      ?auto_1352925 - SURFACE
      ?auto_1352926 - SURFACE
      ?auto_1352927 - SURFACE
      ?auto_1352928 - SURFACE
      ?auto_1352929 - SURFACE
      ?auto_1352930 - SURFACE
    )
    :vars
    (
      ?auto_1352932 - HOIST
      ?auto_1352931 - PLACE
      ?auto_1352934 - TRUCK
      ?auto_1352933 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352932 ?auto_1352931 ) ( SURFACE-AT ?auto_1352929 ?auto_1352931 ) ( CLEAR ?auto_1352929 ) ( IS-CRATE ?auto_1352930 ) ( not ( = ?auto_1352929 ?auto_1352930 ) ) ( AVAILABLE ?auto_1352932 ) ( IN ?auto_1352930 ?auto_1352934 ) ( ON ?auto_1352929 ?auto_1352928 ) ( not ( = ?auto_1352928 ?auto_1352929 ) ) ( not ( = ?auto_1352928 ?auto_1352930 ) ) ( TRUCK-AT ?auto_1352934 ?auto_1352933 ) ( not ( = ?auto_1352933 ?auto_1352931 ) ) ( ON ?auto_1352923 ?auto_1352922 ) ( ON ?auto_1352924 ?auto_1352923 ) ( ON ?auto_1352925 ?auto_1352924 ) ( ON ?auto_1352926 ?auto_1352925 ) ( ON ?auto_1352927 ?auto_1352926 ) ( ON ?auto_1352928 ?auto_1352927 ) ( not ( = ?auto_1352922 ?auto_1352923 ) ) ( not ( = ?auto_1352922 ?auto_1352924 ) ) ( not ( = ?auto_1352922 ?auto_1352925 ) ) ( not ( = ?auto_1352922 ?auto_1352926 ) ) ( not ( = ?auto_1352922 ?auto_1352927 ) ) ( not ( = ?auto_1352922 ?auto_1352928 ) ) ( not ( = ?auto_1352922 ?auto_1352929 ) ) ( not ( = ?auto_1352922 ?auto_1352930 ) ) ( not ( = ?auto_1352923 ?auto_1352924 ) ) ( not ( = ?auto_1352923 ?auto_1352925 ) ) ( not ( = ?auto_1352923 ?auto_1352926 ) ) ( not ( = ?auto_1352923 ?auto_1352927 ) ) ( not ( = ?auto_1352923 ?auto_1352928 ) ) ( not ( = ?auto_1352923 ?auto_1352929 ) ) ( not ( = ?auto_1352923 ?auto_1352930 ) ) ( not ( = ?auto_1352924 ?auto_1352925 ) ) ( not ( = ?auto_1352924 ?auto_1352926 ) ) ( not ( = ?auto_1352924 ?auto_1352927 ) ) ( not ( = ?auto_1352924 ?auto_1352928 ) ) ( not ( = ?auto_1352924 ?auto_1352929 ) ) ( not ( = ?auto_1352924 ?auto_1352930 ) ) ( not ( = ?auto_1352925 ?auto_1352926 ) ) ( not ( = ?auto_1352925 ?auto_1352927 ) ) ( not ( = ?auto_1352925 ?auto_1352928 ) ) ( not ( = ?auto_1352925 ?auto_1352929 ) ) ( not ( = ?auto_1352925 ?auto_1352930 ) ) ( not ( = ?auto_1352926 ?auto_1352927 ) ) ( not ( = ?auto_1352926 ?auto_1352928 ) ) ( not ( = ?auto_1352926 ?auto_1352929 ) ) ( not ( = ?auto_1352926 ?auto_1352930 ) ) ( not ( = ?auto_1352927 ?auto_1352928 ) ) ( not ( = ?auto_1352927 ?auto_1352929 ) ) ( not ( = ?auto_1352927 ?auto_1352930 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352928 ?auto_1352929 ?auto_1352930 )
      ( MAKE-8CRATE-VERIFY ?auto_1352922 ?auto_1352923 ?auto_1352924 ?auto_1352925 ?auto_1352926 ?auto_1352927 ?auto_1352928 ?auto_1352929 ?auto_1352930 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1353006 - SURFACE
      ?auto_1353007 - SURFACE
      ?auto_1353008 - SURFACE
      ?auto_1353009 - SURFACE
      ?auto_1353010 - SURFACE
      ?auto_1353011 - SURFACE
      ?auto_1353012 - SURFACE
      ?auto_1353013 - SURFACE
      ?auto_1353014 - SURFACE
    )
    :vars
    (
      ?auto_1353016 - HOIST
      ?auto_1353017 - PLACE
      ?auto_1353018 - TRUCK
      ?auto_1353015 - PLACE
      ?auto_1353019 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1353016 ?auto_1353017 ) ( SURFACE-AT ?auto_1353013 ?auto_1353017 ) ( CLEAR ?auto_1353013 ) ( IS-CRATE ?auto_1353014 ) ( not ( = ?auto_1353013 ?auto_1353014 ) ) ( AVAILABLE ?auto_1353016 ) ( ON ?auto_1353013 ?auto_1353012 ) ( not ( = ?auto_1353012 ?auto_1353013 ) ) ( not ( = ?auto_1353012 ?auto_1353014 ) ) ( TRUCK-AT ?auto_1353018 ?auto_1353015 ) ( not ( = ?auto_1353015 ?auto_1353017 ) ) ( HOIST-AT ?auto_1353019 ?auto_1353015 ) ( LIFTING ?auto_1353019 ?auto_1353014 ) ( not ( = ?auto_1353016 ?auto_1353019 ) ) ( ON ?auto_1353007 ?auto_1353006 ) ( ON ?auto_1353008 ?auto_1353007 ) ( ON ?auto_1353009 ?auto_1353008 ) ( ON ?auto_1353010 ?auto_1353009 ) ( ON ?auto_1353011 ?auto_1353010 ) ( ON ?auto_1353012 ?auto_1353011 ) ( not ( = ?auto_1353006 ?auto_1353007 ) ) ( not ( = ?auto_1353006 ?auto_1353008 ) ) ( not ( = ?auto_1353006 ?auto_1353009 ) ) ( not ( = ?auto_1353006 ?auto_1353010 ) ) ( not ( = ?auto_1353006 ?auto_1353011 ) ) ( not ( = ?auto_1353006 ?auto_1353012 ) ) ( not ( = ?auto_1353006 ?auto_1353013 ) ) ( not ( = ?auto_1353006 ?auto_1353014 ) ) ( not ( = ?auto_1353007 ?auto_1353008 ) ) ( not ( = ?auto_1353007 ?auto_1353009 ) ) ( not ( = ?auto_1353007 ?auto_1353010 ) ) ( not ( = ?auto_1353007 ?auto_1353011 ) ) ( not ( = ?auto_1353007 ?auto_1353012 ) ) ( not ( = ?auto_1353007 ?auto_1353013 ) ) ( not ( = ?auto_1353007 ?auto_1353014 ) ) ( not ( = ?auto_1353008 ?auto_1353009 ) ) ( not ( = ?auto_1353008 ?auto_1353010 ) ) ( not ( = ?auto_1353008 ?auto_1353011 ) ) ( not ( = ?auto_1353008 ?auto_1353012 ) ) ( not ( = ?auto_1353008 ?auto_1353013 ) ) ( not ( = ?auto_1353008 ?auto_1353014 ) ) ( not ( = ?auto_1353009 ?auto_1353010 ) ) ( not ( = ?auto_1353009 ?auto_1353011 ) ) ( not ( = ?auto_1353009 ?auto_1353012 ) ) ( not ( = ?auto_1353009 ?auto_1353013 ) ) ( not ( = ?auto_1353009 ?auto_1353014 ) ) ( not ( = ?auto_1353010 ?auto_1353011 ) ) ( not ( = ?auto_1353010 ?auto_1353012 ) ) ( not ( = ?auto_1353010 ?auto_1353013 ) ) ( not ( = ?auto_1353010 ?auto_1353014 ) ) ( not ( = ?auto_1353011 ?auto_1353012 ) ) ( not ( = ?auto_1353011 ?auto_1353013 ) ) ( not ( = ?auto_1353011 ?auto_1353014 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1353012 ?auto_1353013 ?auto_1353014 )
      ( MAKE-8CRATE-VERIFY ?auto_1353006 ?auto_1353007 ?auto_1353008 ?auto_1353009 ?auto_1353010 ?auto_1353011 ?auto_1353012 ?auto_1353013 ?auto_1353014 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1353098 - SURFACE
      ?auto_1353099 - SURFACE
      ?auto_1353100 - SURFACE
      ?auto_1353101 - SURFACE
      ?auto_1353102 - SURFACE
      ?auto_1353103 - SURFACE
      ?auto_1353104 - SURFACE
      ?auto_1353105 - SURFACE
      ?auto_1353106 - SURFACE
    )
    :vars
    (
      ?auto_1353111 - HOIST
      ?auto_1353108 - PLACE
      ?auto_1353112 - TRUCK
      ?auto_1353109 - PLACE
      ?auto_1353107 - HOIST
      ?auto_1353110 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1353111 ?auto_1353108 ) ( SURFACE-AT ?auto_1353105 ?auto_1353108 ) ( CLEAR ?auto_1353105 ) ( IS-CRATE ?auto_1353106 ) ( not ( = ?auto_1353105 ?auto_1353106 ) ) ( AVAILABLE ?auto_1353111 ) ( ON ?auto_1353105 ?auto_1353104 ) ( not ( = ?auto_1353104 ?auto_1353105 ) ) ( not ( = ?auto_1353104 ?auto_1353106 ) ) ( TRUCK-AT ?auto_1353112 ?auto_1353109 ) ( not ( = ?auto_1353109 ?auto_1353108 ) ) ( HOIST-AT ?auto_1353107 ?auto_1353109 ) ( not ( = ?auto_1353111 ?auto_1353107 ) ) ( AVAILABLE ?auto_1353107 ) ( SURFACE-AT ?auto_1353106 ?auto_1353109 ) ( ON ?auto_1353106 ?auto_1353110 ) ( CLEAR ?auto_1353106 ) ( not ( = ?auto_1353105 ?auto_1353110 ) ) ( not ( = ?auto_1353106 ?auto_1353110 ) ) ( not ( = ?auto_1353104 ?auto_1353110 ) ) ( ON ?auto_1353099 ?auto_1353098 ) ( ON ?auto_1353100 ?auto_1353099 ) ( ON ?auto_1353101 ?auto_1353100 ) ( ON ?auto_1353102 ?auto_1353101 ) ( ON ?auto_1353103 ?auto_1353102 ) ( ON ?auto_1353104 ?auto_1353103 ) ( not ( = ?auto_1353098 ?auto_1353099 ) ) ( not ( = ?auto_1353098 ?auto_1353100 ) ) ( not ( = ?auto_1353098 ?auto_1353101 ) ) ( not ( = ?auto_1353098 ?auto_1353102 ) ) ( not ( = ?auto_1353098 ?auto_1353103 ) ) ( not ( = ?auto_1353098 ?auto_1353104 ) ) ( not ( = ?auto_1353098 ?auto_1353105 ) ) ( not ( = ?auto_1353098 ?auto_1353106 ) ) ( not ( = ?auto_1353098 ?auto_1353110 ) ) ( not ( = ?auto_1353099 ?auto_1353100 ) ) ( not ( = ?auto_1353099 ?auto_1353101 ) ) ( not ( = ?auto_1353099 ?auto_1353102 ) ) ( not ( = ?auto_1353099 ?auto_1353103 ) ) ( not ( = ?auto_1353099 ?auto_1353104 ) ) ( not ( = ?auto_1353099 ?auto_1353105 ) ) ( not ( = ?auto_1353099 ?auto_1353106 ) ) ( not ( = ?auto_1353099 ?auto_1353110 ) ) ( not ( = ?auto_1353100 ?auto_1353101 ) ) ( not ( = ?auto_1353100 ?auto_1353102 ) ) ( not ( = ?auto_1353100 ?auto_1353103 ) ) ( not ( = ?auto_1353100 ?auto_1353104 ) ) ( not ( = ?auto_1353100 ?auto_1353105 ) ) ( not ( = ?auto_1353100 ?auto_1353106 ) ) ( not ( = ?auto_1353100 ?auto_1353110 ) ) ( not ( = ?auto_1353101 ?auto_1353102 ) ) ( not ( = ?auto_1353101 ?auto_1353103 ) ) ( not ( = ?auto_1353101 ?auto_1353104 ) ) ( not ( = ?auto_1353101 ?auto_1353105 ) ) ( not ( = ?auto_1353101 ?auto_1353106 ) ) ( not ( = ?auto_1353101 ?auto_1353110 ) ) ( not ( = ?auto_1353102 ?auto_1353103 ) ) ( not ( = ?auto_1353102 ?auto_1353104 ) ) ( not ( = ?auto_1353102 ?auto_1353105 ) ) ( not ( = ?auto_1353102 ?auto_1353106 ) ) ( not ( = ?auto_1353102 ?auto_1353110 ) ) ( not ( = ?auto_1353103 ?auto_1353104 ) ) ( not ( = ?auto_1353103 ?auto_1353105 ) ) ( not ( = ?auto_1353103 ?auto_1353106 ) ) ( not ( = ?auto_1353103 ?auto_1353110 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1353104 ?auto_1353105 ?auto_1353106 )
      ( MAKE-8CRATE-VERIFY ?auto_1353098 ?auto_1353099 ?auto_1353100 ?auto_1353101 ?auto_1353102 ?auto_1353103 ?auto_1353104 ?auto_1353105 ?auto_1353106 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1353191 - SURFACE
      ?auto_1353192 - SURFACE
      ?auto_1353193 - SURFACE
      ?auto_1353194 - SURFACE
      ?auto_1353195 - SURFACE
      ?auto_1353196 - SURFACE
      ?auto_1353197 - SURFACE
      ?auto_1353198 - SURFACE
      ?auto_1353199 - SURFACE
    )
    :vars
    (
      ?auto_1353205 - HOIST
      ?auto_1353202 - PLACE
      ?auto_1353203 - PLACE
      ?auto_1353200 - HOIST
      ?auto_1353201 - SURFACE
      ?auto_1353204 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1353205 ?auto_1353202 ) ( SURFACE-AT ?auto_1353198 ?auto_1353202 ) ( CLEAR ?auto_1353198 ) ( IS-CRATE ?auto_1353199 ) ( not ( = ?auto_1353198 ?auto_1353199 ) ) ( AVAILABLE ?auto_1353205 ) ( ON ?auto_1353198 ?auto_1353197 ) ( not ( = ?auto_1353197 ?auto_1353198 ) ) ( not ( = ?auto_1353197 ?auto_1353199 ) ) ( not ( = ?auto_1353203 ?auto_1353202 ) ) ( HOIST-AT ?auto_1353200 ?auto_1353203 ) ( not ( = ?auto_1353205 ?auto_1353200 ) ) ( AVAILABLE ?auto_1353200 ) ( SURFACE-AT ?auto_1353199 ?auto_1353203 ) ( ON ?auto_1353199 ?auto_1353201 ) ( CLEAR ?auto_1353199 ) ( not ( = ?auto_1353198 ?auto_1353201 ) ) ( not ( = ?auto_1353199 ?auto_1353201 ) ) ( not ( = ?auto_1353197 ?auto_1353201 ) ) ( TRUCK-AT ?auto_1353204 ?auto_1353202 ) ( ON ?auto_1353192 ?auto_1353191 ) ( ON ?auto_1353193 ?auto_1353192 ) ( ON ?auto_1353194 ?auto_1353193 ) ( ON ?auto_1353195 ?auto_1353194 ) ( ON ?auto_1353196 ?auto_1353195 ) ( ON ?auto_1353197 ?auto_1353196 ) ( not ( = ?auto_1353191 ?auto_1353192 ) ) ( not ( = ?auto_1353191 ?auto_1353193 ) ) ( not ( = ?auto_1353191 ?auto_1353194 ) ) ( not ( = ?auto_1353191 ?auto_1353195 ) ) ( not ( = ?auto_1353191 ?auto_1353196 ) ) ( not ( = ?auto_1353191 ?auto_1353197 ) ) ( not ( = ?auto_1353191 ?auto_1353198 ) ) ( not ( = ?auto_1353191 ?auto_1353199 ) ) ( not ( = ?auto_1353191 ?auto_1353201 ) ) ( not ( = ?auto_1353192 ?auto_1353193 ) ) ( not ( = ?auto_1353192 ?auto_1353194 ) ) ( not ( = ?auto_1353192 ?auto_1353195 ) ) ( not ( = ?auto_1353192 ?auto_1353196 ) ) ( not ( = ?auto_1353192 ?auto_1353197 ) ) ( not ( = ?auto_1353192 ?auto_1353198 ) ) ( not ( = ?auto_1353192 ?auto_1353199 ) ) ( not ( = ?auto_1353192 ?auto_1353201 ) ) ( not ( = ?auto_1353193 ?auto_1353194 ) ) ( not ( = ?auto_1353193 ?auto_1353195 ) ) ( not ( = ?auto_1353193 ?auto_1353196 ) ) ( not ( = ?auto_1353193 ?auto_1353197 ) ) ( not ( = ?auto_1353193 ?auto_1353198 ) ) ( not ( = ?auto_1353193 ?auto_1353199 ) ) ( not ( = ?auto_1353193 ?auto_1353201 ) ) ( not ( = ?auto_1353194 ?auto_1353195 ) ) ( not ( = ?auto_1353194 ?auto_1353196 ) ) ( not ( = ?auto_1353194 ?auto_1353197 ) ) ( not ( = ?auto_1353194 ?auto_1353198 ) ) ( not ( = ?auto_1353194 ?auto_1353199 ) ) ( not ( = ?auto_1353194 ?auto_1353201 ) ) ( not ( = ?auto_1353195 ?auto_1353196 ) ) ( not ( = ?auto_1353195 ?auto_1353197 ) ) ( not ( = ?auto_1353195 ?auto_1353198 ) ) ( not ( = ?auto_1353195 ?auto_1353199 ) ) ( not ( = ?auto_1353195 ?auto_1353201 ) ) ( not ( = ?auto_1353196 ?auto_1353197 ) ) ( not ( = ?auto_1353196 ?auto_1353198 ) ) ( not ( = ?auto_1353196 ?auto_1353199 ) ) ( not ( = ?auto_1353196 ?auto_1353201 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1353197 ?auto_1353198 ?auto_1353199 )
      ( MAKE-8CRATE-VERIFY ?auto_1353191 ?auto_1353192 ?auto_1353193 ?auto_1353194 ?auto_1353195 ?auto_1353196 ?auto_1353197 ?auto_1353198 ?auto_1353199 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1353284 - SURFACE
      ?auto_1353285 - SURFACE
      ?auto_1353286 - SURFACE
      ?auto_1353287 - SURFACE
      ?auto_1353288 - SURFACE
      ?auto_1353289 - SURFACE
      ?auto_1353290 - SURFACE
      ?auto_1353291 - SURFACE
      ?auto_1353292 - SURFACE
    )
    :vars
    (
      ?auto_1353296 - HOIST
      ?auto_1353295 - PLACE
      ?auto_1353294 - PLACE
      ?auto_1353297 - HOIST
      ?auto_1353293 - SURFACE
      ?auto_1353298 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1353296 ?auto_1353295 ) ( IS-CRATE ?auto_1353292 ) ( not ( = ?auto_1353291 ?auto_1353292 ) ) ( not ( = ?auto_1353290 ?auto_1353291 ) ) ( not ( = ?auto_1353290 ?auto_1353292 ) ) ( not ( = ?auto_1353294 ?auto_1353295 ) ) ( HOIST-AT ?auto_1353297 ?auto_1353294 ) ( not ( = ?auto_1353296 ?auto_1353297 ) ) ( AVAILABLE ?auto_1353297 ) ( SURFACE-AT ?auto_1353292 ?auto_1353294 ) ( ON ?auto_1353292 ?auto_1353293 ) ( CLEAR ?auto_1353292 ) ( not ( = ?auto_1353291 ?auto_1353293 ) ) ( not ( = ?auto_1353292 ?auto_1353293 ) ) ( not ( = ?auto_1353290 ?auto_1353293 ) ) ( TRUCK-AT ?auto_1353298 ?auto_1353295 ) ( SURFACE-AT ?auto_1353290 ?auto_1353295 ) ( CLEAR ?auto_1353290 ) ( LIFTING ?auto_1353296 ?auto_1353291 ) ( IS-CRATE ?auto_1353291 ) ( ON ?auto_1353285 ?auto_1353284 ) ( ON ?auto_1353286 ?auto_1353285 ) ( ON ?auto_1353287 ?auto_1353286 ) ( ON ?auto_1353288 ?auto_1353287 ) ( ON ?auto_1353289 ?auto_1353288 ) ( ON ?auto_1353290 ?auto_1353289 ) ( not ( = ?auto_1353284 ?auto_1353285 ) ) ( not ( = ?auto_1353284 ?auto_1353286 ) ) ( not ( = ?auto_1353284 ?auto_1353287 ) ) ( not ( = ?auto_1353284 ?auto_1353288 ) ) ( not ( = ?auto_1353284 ?auto_1353289 ) ) ( not ( = ?auto_1353284 ?auto_1353290 ) ) ( not ( = ?auto_1353284 ?auto_1353291 ) ) ( not ( = ?auto_1353284 ?auto_1353292 ) ) ( not ( = ?auto_1353284 ?auto_1353293 ) ) ( not ( = ?auto_1353285 ?auto_1353286 ) ) ( not ( = ?auto_1353285 ?auto_1353287 ) ) ( not ( = ?auto_1353285 ?auto_1353288 ) ) ( not ( = ?auto_1353285 ?auto_1353289 ) ) ( not ( = ?auto_1353285 ?auto_1353290 ) ) ( not ( = ?auto_1353285 ?auto_1353291 ) ) ( not ( = ?auto_1353285 ?auto_1353292 ) ) ( not ( = ?auto_1353285 ?auto_1353293 ) ) ( not ( = ?auto_1353286 ?auto_1353287 ) ) ( not ( = ?auto_1353286 ?auto_1353288 ) ) ( not ( = ?auto_1353286 ?auto_1353289 ) ) ( not ( = ?auto_1353286 ?auto_1353290 ) ) ( not ( = ?auto_1353286 ?auto_1353291 ) ) ( not ( = ?auto_1353286 ?auto_1353292 ) ) ( not ( = ?auto_1353286 ?auto_1353293 ) ) ( not ( = ?auto_1353287 ?auto_1353288 ) ) ( not ( = ?auto_1353287 ?auto_1353289 ) ) ( not ( = ?auto_1353287 ?auto_1353290 ) ) ( not ( = ?auto_1353287 ?auto_1353291 ) ) ( not ( = ?auto_1353287 ?auto_1353292 ) ) ( not ( = ?auto_1353287 ?auto_1353293 ) ) ( not ( = ?auto_1353288 ?auto_1353289 ) ) ( not ( = ?auto_1353288 ?auto_1353290 ) ) ( not ( = ?auto_1353288 ?auto_1353291 ) ) ( not ( = ?auto_1353288 ?auto_1353292 ) ) ( not ( = ?auto_1353288 ?auto_1353293 ) ) ( not ( = ?auto_1353289 ?auto_1353290 ) ) ( not ( = ?auto_1353289 ?auto_1353291 ) ) ( not ( = ?auto_1353289 ?auto_1353292 ) ) ( not ( = ?auto_1353289 ?auto_1353293 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1353290 ?auto_1353291 ?auto_1353292 )
      ( MAKE-8CRATE-VERIFY ?auto_1353284 ?auto_1353285 ?auto_1353286 ?auto_1353287 ?auto_1353288 ?auto_1353289 ?auto_1353290 ?auto_1353291 ?auto_1353292 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1353377 - SURFACE
      ?auto_1353378 - SURFACE
      ?auto_1353379 - SURFACE
      ?auto_1353380 - SURFACE
      ?auto_1353381 - SURFACE
      ?auto_1353382 - SURFACE
      ?auto_1353383 - SURFACE
      ?auto_1353384 - SURFACE
      ?auto_1353385 - SURFACE
    )
    :vars
    (
      ?auto_1353387 - HOIST
      ?auto_1353391 - PLACE
      ?auto_1353386 - PLACE
      ?auto_1353390 - HOIST
      ?auto_1353388 - SURFACE
      ?auto_1353389 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1353387 ?auto_1353391 ) ( IS-CRATE ?auto_1353385 ) ( not ( = ?auto_1353384 ?auto_1353385 ) ) ( not ( = ?auto_1353383 ?auto_1353384 ) ) ( not ( = ?auto_1353383 ?auto_1353385 ) ) ( not ( = ?auto_1353386 ?auto_1353391 ) ) ( HOIST-AT ?auto_1353390 ?auto_1353386 ) ( not ( = ?auto_1353387 ?auto_1353390 ) ) ( AVAILABLE ?auto_1353390 ) ( SURFACE-AT ?auto_1353385 ?auto_1353386 ) ( ON ?auto_1353385 ?auto_1353388 ) ( CLEAR ?auto_1353385 ) ( not ( = ?auto_1353384 ?auto_1353388 ) ) ( not ( = ?auto_1353385 ?auto_1353388 ) ) ( not ( = ?auto_1353383 ?auto_1353388 ) ) ( TRUCK-AT ?auto_1353389 ?auto_1353391 ) ( SURFACE-AT ?auto_1353383 ?auto_1353391 ) ( CLEAR ?auto_1353383 ) ( IS-CRATE ?auto_1353384 ) ( AVAILABLE ?auto_1353387 ) ( IN ?auto_1353384 ?auto_1353389 ) ( ON ?auto_1353378 ?auto_1353377 ) ( ON ?auto_1353379 ?auto_1353378 ) ( ON ?auto_1353380 ?auto_1353379 ) ( ON ?auto_1353381 ?auto_1353380 ) ( ON ?auto_1353382 ?auto_1353381 ) ( ON ?auto_1353383 ?auto_1353382 ) ( not ( = ?auto_1353377 ?auto_1353378 ) ) ( not ( = ?auto_1353377 ?auto_1353379 ) ) ( not ( = ?auto_1353377 ?auto_1353380 ) ) ( not ( = ?auto_1353377 ?auto_1353381 ) ) ( not ( = ?auto_1353377 ?auto_1353382 ) ) ( not ( = ?auto_1353377 ?auto_1353383 ) ) ( not ( = ?auto_1353377 ?auto_1353384 ) ) ( not ( = ?auto_1353377 ?auto_1353385 ) ) ( not ( = ?auto_1353377 ?auto_1353388 ) ) ( not ( = ?auto_1353378 ?auto_1353379 ) ) ( not ( = ?auto_1353378 ?auto_1353380 ) ) ( not ( = ?auto_1353378 ?auto_1353381 ) ) ( not ( = ?auto_1353378 ?auto_1353382 ) ) ( not ( = ?auto_1353378 ?auto_1353383 ) ) ( not ( = ?auto_1353378 ?auto_1353384 ) ) ( not ( = ?auto_1353378 ?auto_1353385 ) ) ( not ( = ?auto_1353378 ?auto_1353388 ) ) ( not ( = ?auto_1353379 ?auto_1353380 ) ) ( not ( = ?auto_1353379 ?auto_1353381 ) ) ( not ( = ?auto_1353379 ?auto_1353382 ) ) ( not ( = ?auto_1353379 ?auto_1353383 ) ) ( not ( = ?auto_1353379 ?auto_1353384 ) ) ( not ( = ?auto_1353379 ?auto_1353385 ) ) ( not ( = ?auto_1353379 ?auto_1353388 ) ) ( not ( = ?auto_1353380 ?auto_1353381 ) ) ( not ( = ?auto_1353380 ?auto_1353382 ) ) ( not ( = ?auto_1353380 ?auto_1353383 ) ) ( not ( = ?auto_1353380 ?auto_1353384 ) ) ( not ( = ?auto_1353380 ?auto_1353385 ) ) ( not ( = ?auto_1353380 ?auto_1353388 ) ) ( not ( = ?auto_1353381 ?auto_1353382 ) ) ( not ( = ?auto_1353381 ?auto_1353383 ) ) ( not ( = ?auto_1353381 ?auto_1353384 ) ) ( not ( = ?auto_1353381 ?auto_1353385 ) ) ( not ( = ?auto_1353381 ?auto_1353388 ) ) ( not ( = ?auto_1353382 ?auto_1353383 ) ) ( not ( = ?auto_1353382 ?auto_1353384 ) ) ( not ( = ?auto_1353382 ?auto_1353385 ) ) ( not ( = ?auto_1353382 ?auto_1353388 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1353383 ?auto_1353384 ?auto_1353385 )
      ( MAKE-8CRATE-VERIFY ?auto_1353377 ?auto_1353378 ?auto_1353379 ?auto_1353380 ?auto_1353381 ?auto_1353382 ?auto_1353383 ?auto_1353384 ?auto_1353385 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1355272 - SURFACE
      ?auto_1355273 - SURFACE
    )
    :vars
    (
      ?auto_1355277 - HOIST
      ?auto_1355278 - PLACE
      ?auto_1355275 - SURFACE
      ?auto_1355276 - PLACE
      ?auto_1355280 - HOIST
      ?auto_1355274 - SURFACE
      ?auto_1355279 - TRUCK
      ?auto_1355281 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1355277 ?auto_1355278 ) ( SURFACE-AT ?auto_1355272 ?auto_1355278 ) ( CLEAR ?auto_1355272 ) ( IS-CRATE ?auto_1355273 ) ( not ( = ?auto_1355272 ?auto_1355273 ) ) ( ON ?auto_1355272 ?auto_1355275 ) ( not ( = ?auto_1355275 ?auto_1355272 ) ) ( not ( = ?auto_1355275 ?auto_1355273 ) ) ( not ( = ?auto_1355276 ?auto_1355278 ) ) ( HOIST-AT ?auto_1355280 ?auto_1355276 ) ( not ( = ?auto_1355277 ?auto_1355280 ) ) ( AVAILABLE ?auto_1355280 ) ( SURFACE-AT ?auto_1355273 ?auto_1355276 ) ( ON ?auto_1355273 ?auto_1355274 ) ( CLEAR ?auto_1355273 ) ( not ( = ?auto_1355272 ?auto_1355274 ) ) ( not ( = ?auto_1355273 ?auto_1355274 ) ) ( not ( = ?auto_1355275 ?auto_1355274 ) ) ( TRUCK-AT ?auto_1355279 ?auto_1355278 ) ( LIFTING ?auto_1355277 ?auto_1355281 ) ( IS-CRATE ?auto_1355281 ) ( not ( = ?auto_1355272 ?auto_1355281 ) ) ( not ( = ?auto_1355273 ?auto_1355281 ) ) ( not ( = ?auto_1355275 ?auto_1355281 ) ) ( not ( = ?auto_1355274 ?auto_1355281 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1355277 ?auto_1355281 ?auto_1355279 ?auto_1355278 )
      ( MAKE-1CRATE ?auto_1355272 ?auto_1355273 )
      ( MAKE-1CRATE-VERIFY ?auto_1355272 ?auto_1355273 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1357482 - SURFACE
      ?auto_1357483 - SURFACE
      ?auto_1357484 - SURFACE
      ?auto_1357485 - SURFACE
      ?auto_1357486 - SURFACE
      ?auto_1357487 - SURFACE
      ?auto_1357488 - SURFACE
      ?auto_1357489 - SURFACE
      ?auto_1357490 - SURFACE
      ?auto_1357491 - SURFACE
    )
    :vars
    (
      ?auto_1357493 - HOIST
      ?auto_1357492 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1357493 ?auto_1357492 ) ( SURFACE-AT ?auto_1357490 ?auto_1357492 ) ( CLEAR ?auto_1357490 ) ( LIFTING ?auto_1357493 ?auto_1357491 ) ( IS-CRATE ?auto_1357491 ) ( not ( = ?auto_1357490 ?auto_1357491 ) ) ( ON ?auto_1357483 ?auto_1357482 ) ( ON ?auto_1357484 ?auto_1357483 ) ( ON ?auto_1357485 ?auto_1357484 ) ( ON ?auto_1357486 ?auto_1357485 ) ( ON ?auto_1357487 ?auto_1357486 ) ( ON ?auto_1357488 ?auto_1357487 ) ( ON ?auto_1357489 ?auto_1357488 ) ( ON ?auto_1357490 ?auto_1357489 ) ( not ( = ?auto_1357482 ?auto_1357483 ) ) ( not ( = ?auto_1357482 ?auto_1357484 ) ) ( not ( = ?auto_1357482 ?auto_1357485 ) ) ( not ( = ?auto_1357482 ?auto_1357486 ) ) ( not ( = ?auto_1357482 ?auto_1357487 ) ) ( not ( = ?auto_1357482 ?auto_1357488 ) ) ( not ( = ?auto_1357482 ?auto_1357489 ) ) ( not ( = ?auto_1357482 ?auto_1357490 ) ) ( not ( = ?auto_1357482 ?auto_1357491 ) ) ( not ( = ?auto_1357483 ?auto_1357484 ) ) ( not ( = ?auto_1357483 ?auto_1357485 ) ) ( not ( = ?auto_1357483 ?auto_1357486 ) ) ( not ( = ?auto_1357483 ?auto_1357487 ) ) ( not ( = ?auto_1357483 ?auto_1357488 ) ) ( not ( = ?auto_1357483 ?auto_1357489 ) ) ( not ( = ?auto_1357483 ?auto_1357490 ) ) ( not ( = ?auto_1357483 ?auto_1357491 ) ) ( not ( = ?auto_1357484 ?auto_1357485 ) ) ( not ( = ?auto_1357484 ?auto_1357486 ) ) ( not ( = ?auto_1357484 ?auto_1357487 ) ) ( not ( = ?auto_1357484 ?auto_1357488 ) ) ( not ( = ?auto_1357484 ?auto_1357489 ) ) ( not ( = ?auto_1357484 ?auto_1357490 ) ) ( not ( = ?auto_1357484 ?auto_1357491 ) ) ( not ( = ?auto_1357485 ?auto_1357486 ) ) ( not ( = ?auto_1357485 ?auto_1357487 ) ) ( not ( = ?auto_1357485 ?auto_1357488 ) ) ( not ( = ?auto_1357485 ?auto_1357489 ) ) ( not ( = ?auto_1357485 ?auto_1357490 ) ) ( not ( = ?auto_1357485 ?auto_1357491 ) ) ( not ( = ?auto_1357486 ?auto_1357487 ) ) ( not ( = ?auto_1357486 ?auto_1357488 ) ) ( not ( = ?auto_1357486 ?auto_1357489 ) ) ( not ( = ?auto_1357486 ?auto_1357490 ) ) ( not ( = ?auto_1357486 ?auto_1357491 ) ) ( not ( = ?auto_1357487 ?auto_1357488 ) ) ( not ( = ?auto_1357487 ?auto_1357489 ) ) ( not ( = ?auto_1357487 ?auto_1357490 ) ) ( not ( = ?auto_1357487 ?auto_1357491 ) ) ( not ( = ?auto_1357488 ?auto_1357489 ) ) ( not ( = ?auto_1357488 ?auto_1357490 ) ) ( not ( = ?auto_1357488 ?auto_1357491 ) ) ( not ( = ?auto_1357489 ?auto_1357490 ) ) ( not ( = ?auto_1357489 ?auto_1357491 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1357490 ?auto_1357491 )
      ( MAKE-9CRATE-VERIFY ?auto_1357482 ?auto_1357483 ?auto_1357484 ?auto_1357485 ?auto_1357486 ?auto_1357487 ?auto_1357488 ?auto_1357489 ?auto_1357490 ?auto_1357491 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1357562 - SURFACE
      ?auto_1357563 - SURFACE
      ?auto_1357564 - SURFACE
      ?auto_1357565 - SURFACE
      ?auto_1357566 - SURFACE
      ?auto_1357567 - SURFACE
      ?auto_1357568 - SURFACE
      ?auto_1357569 - SURFACE
      ?auto_1357570 - SURFACE
      ?auto_1357571 - SURFACE
    )
    :vars
    (
      ?auto_1357574 - HOIST
      ?auto_1357572 - PLACE
      ?auto_1357573 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1357574 ?auto_1357572 ) ( SURFACE-AT ?auto_1357570 ?auto_1357572 ) ( CLEAR ?auto_1357570 ) ( IS-CRATE ?auto_1357571 ) ( not ( = ?auto_1357570 ?auto_1357571 ) ) ( TRUCK-AT ?auto_1357573 ?auto_1357572 ) ( AVAILABLE ?auto_1357574 ) ( IN ?auto_1357571 ?auto_1357573 ) ( ON ?auto_1357570 ?auto_1357569 ) ( not ( = ?auto_1357569 ?auto_1357570 ) ) ( not ( = ?auto_1357569 ?auto_1357571 ) ) ( ON ?auto_1357563 ?auto_1357562 ) ( ON ?auto_1357564 ?auto_1357563 ) ( ON ?auto_1357565 ?auto_1357564 ) ( ON ?auto_1357566 ?auto_1357565 ) ( ON ?auto_1357567 ?auto_1357566 ) ( ON ?auto_1357568 ?auto_1357567 ) ( ON ?auto_1357569 ?auto_1357568 ) ( not ( = ?auto_1357562 ?auto_1357563 ) ) ( not ( = ?auto_1357562 ?auto_1357564 ) ) ( not ( = ?auto_1357562 ?auto_1357565 ) ) ( not ( = ?auto_1357562 ?auto_1357566 ) ) ( not ( = ?auto_1357562 ?auto_1357567 ) ) ( not ( = ?auto_1357562 ?auto_1357568 ) ) ( not ( = ?auto_1357562 ?auto_1357569 ) ) ( not ( = ?auto_1357562 ?auto_1357570 ) ) ( not ( = ?auto_1357562 ?auto_1357571 ) ) ( not ( = ?auto_1357563 ?auto_1357564 ) ) ( not ( = ?auto_1357563 ?auto_1357565 ) ) ( not ( = ?auto_1357563 ?auto_1357566 ) ) ( not ( = ?auto_1357563 ?auto_1357567 ) ) ( not ( = ?auto_1357563 ?auto_1357568 ) ) ( not ( = ?auto_1357563 ?auto_1357569 ) ) ( not ( = ?auto_1357563 ?auto_1357570 ) ) ( not ( = ?auto_1357563 ?auto_1357571 ) ) ( not ( = ?auto_1357564 ?auto_1357565 ) ) ( not ( = ?auto_1357564 ?auto_1357566 ) ) ( not ( = ?auto_1357564 ?auto_1357567 ) ) ( not ( = ?auto_1357564 ?auto_1357568 ) ) ( not ( = ?auto_1357564 ?auto_1357569 ) ) ( not ( = ?auto_1357564 ?auto_1357570 ) ) ( not ( = ?auto_1357564 ?auto_1357571 ) ) ( not ( = ?auto_1357565 ?auto_1357566 ) ) ( not ( = ?auto_1357565 ?auto_1357567 ) ) ( not ( = ?auto_1357565 ?auto_1357568 ) ) ( not ( = ?auto_1357565 ?auto_1357569 ) ) ( not ( = ?auto_1357565 ?auto_1357570 ) ) ( not ( = ?auto_1357565 ?auto_1357571 ) ) ( not ( = ?auto_1357566 ?auto_1357567 ) ) ( not ( = ?auto_1357566 ?auto_1357568 ) ) ( not ( = ?auto_1357566 ?auto_1357569 ) ) ( not ( = ?auto_1357566 ?auto_1357570 ) ) ( not ( = ?auto_1357566 ?auto_1357571 ) ) ( not ( = ?auto_1357567 ?auto_1357568 ) ) ( not ( = ?auto_1357567 ?auto_1357569 ) ) ( not ( = ?auto_1357567 ?auto_1357570 ) ) ( not ( = ?auto_1357567 ?auto_1357571 ) ) ( not ( = ?auto_1357568 ?auto_1357569 ) ) ( not ( = ?auto_1357568 ?auto_1357570 ) ) ( not ( = ?auto_1357568 ?auto_1357571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1357569 ?auto_1357570 ?auto_1357571 )
      ( MAKE-9CRATE-VERIFY ?auto_1357562 ?auto_1357563 ?auto_1357564 ?auto_1357565 ?auto_1357566 ?auto_1357567 ?auto_1357568 ?auto_1357569 ?auto_1357570 ?auto_1357571 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1357652 - SURFACE
      ?auto_1357653 - SURFACE
      ?auto_1357654 - SURFACE
      ?auto_1357655 - SURFACE
      ?auto_1357656 - SURFACE
      ?auto_1357657 - SURFACE
      ?auto_1357658 - SURFACE
      ?auto_1357659 - SURFACE
      ?auto_1357660 - SURFACE
      ?auto_1357661 - SURFACE
    )
    :vars
    (
      ?auto_1357663 - HOIST
      ?auto_1357665 - PLACE
      ?auto_1357662 - TRUCK
      ?auto_1357664 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1357663 ?auto_1357665 ) ( SURFACE-AT ?auto_1357660 ?auto_1357665 ) ( CLEAR ?auto_1357660 ) ( IS-CRATE ?auto_1357661 ) ( not ( = ?auto_1357660 ?auto_1357661 ) ) ( AVAILABLE ?auto_1357663 ) ( IN ?auto_1357661 ?auto_1357662 ) ( ON ?auto_1357660 ?auto_1357659 ) ( not ( = ?auto_1357659 ?auto_1357660 ) ) ( not ( = ?auto_1357659 ?auto_1357661 ) ) ( TRUCK-AT ?auto_1357662 ?auto_1357664 ) ( not ( = ?auto_1357664 ?auto_1357665 ) ) ( ON ?auto_1357653 ?auto_1357652 ) ( ON ?auto_1357654 ?auto_1357653 ) ( ON ?auto_1357655 ?auto_1357654 ) ( ON ?auto_1357656 ?auto_1357655 ) ( ON ?auto_1357657 ?auto_1357656 ) ( ON ?auto_1357658 ?auto_1357657 ) ( ON ?auto_1357659 ?auto_1357658 ) ( not ( = ?auto_1357652 ?auto_1357653 ) ) ( not ( = ?auto_1357652 ?auto_1357654 ) ) ( not ( = ?auto_1357652 ?auto_1357655 ) ) ( not ( = ?auto_1357652 ?auto_1357656 ) ) ( not ( = ?auto_1357652 ?auto_1357657 ) ) ( not ( = ?auto_1357652 ?auto_1357658 ) ) ( not ( = ?auto_1357652 ?auto_1357659 ) ) ( not ( = ?auto_1357652 ?auto_1357660 ) ) ( not ( = ?auto_1357652 ?auto_1357661 ) ) ( not ( = ?auto_1357653 ?auto_1357654 ) ) ( not ( = ?auto_1357653 ?auto_1357655 ) ) ( not ( = ?auto_1357653 ?auto_1357656 ) ) ( not ( = ?auto_1357653 ?auto_1357657 ) ) ( not ( = ?auto_1357653 ?auto_1357658 ) ) ( not ( = ?auto_1357653 ?auto_1357659 ) ) ( not ( = ?auto_1357653 ?auto_1357660 ) ) ( not ( = ?auto_1357653 ?auto_1357661 ) ) ( not ( = ?auto_1357654 ?auto_1357655 ) ) ( not ( = ?auto_1357654 ?auto_1357656 ) ) ( not ( = ?auto_1357654 ?auto_1357657 ) ) ( not ( = ?auto_1357654 ?auto_1357658 ) ) ( not ( = ?auto_1357654 ?auto_1357659 ) ) ( not ( = ?auto_1357654 ?auto_1357660 ) ) ( not ( = ?auto_1357654 ?auto_1357661 ) ) ( not ( = ?auto_1357655 ?auto_1357656 ) ) ( not ( = ?auto_1357655 ?auto_1357657 ) ) ( not ( = ?auto_1357655 ?auto_1357658 ) ) ( not ( = ?auto_1357655 ?auto_1357659 ) ) ( not ( = ?auto_1357655 ?auto_1357660 ) ) ( not ( = ?auto_1357655 ?auto_1357661 ) ) ( not ( = ?auto_1357656 ?auto_1357657 ) ) ( not ( = ?auto_1357656 ?auto_1357658 ) ) ( not ( = ?auto_1357656 ?auto_1357659 ) ) ( not ( = ?auto_1357656 ?auto_1357660 ) ) ( not ( = ?auto_1357656 ?auto_1357661 ) ) ( not ( = ?auto_1357657 ?auto_1357658 ) ) ( not ( = ?auto_1357657 ?auto_1357659 ) ) ( not ( = ?auto_1357657 ?auto_1357660 ) ) ( not ( = ?auto_1357657 ?auto_1357661 ) ) ( not ( = ?auto_1357658 ?auto_1357659 ) ) ( not ( = ?auto_1357658 ?auto_1357660 ) ) ( not ( = ?auto_1357658 ?auto_1357661 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1357659 ?auto_1357660 ?auto_1357661 )
      ( MAKE-9CRATE-VERIFY ?auto_1357652 ?auto_1357653 ?auto_1357654 ?auto_1357655 ?auto_1357656 ?auto_1357657 ?auto_1357658 ?auto_1357659 ?auto_1357660 ?auto_1357661 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1357751 - SURFACE
      ?auto_1357752 - SURFACE
      ?auto_1357753 - SURFACE
      ?auto_1357754 - SURFACE
      ?auto_1357755 - SURFACE
      ?auto_1357756 - SURFACE
      ?auto_1357757 - SURFACE
      ?auto_1357758 - SURFACE
      ?auto_1357759 - SURFACE
      ?auto_1357760 - SURFACE
    )
    :vars
    (
      ?auto_1357763 - HOIST
      ?auto_1357765 - PLACE
      ?auto_1357762 - TRUCK
      ?auto_1357764 - PLACE
      ?auto_1357761 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1357763 ?auto_1357765 ) ( SURFACE-AT ?auto_1357759 ?auto_1357765 ) ( CLEAR ?auto_1357759 ) ( IS-CRATE ?auto_1357760 ) ( not ( = ?auto_1357759 ?auto_1357760 ) ) ( AVAILABLE ?auto_1357763 ) ( ON ?auto_1357759 ?auto_1357758 ) ( not ( = ?auto_1357758 ?auto_1357759 ) ) ( not ( = ?auto_1357758 ?auto_1357760 ) ) ( TRUCK-AT ?auto_1357762 ?auto_1357764 ) ( not ( = ?auto_1357764 ?auto_1357765 ) ) ( HOIST-AT ?auto_1357761 ?auto_1357764 ) ( LIFTING ?auto_1357761 ?auto_1357760 ) ( not ( = ?auto_1357763 ?auto_1357761 ) ) ( ON ?auto_1357752 ?auto_1357751 ) ( ON ?auto_1357753 ?auto_1357752 ) ( ON ?auto_1357754 ?auto_1357753 ) ( ON ?auto_1357755 ?auto_1357754 ) ( ON ?auto_1357756 ?auto_1357755 ) ( ON ?auto_1357757 ?auto_1357756 ) ( ON ?auto_1357758 ?auto_1357757 ) ( not ( = ?auto_1357751 ?auto_1357752 ) ) ( not ( = ?auto_1357751 ?auto_1357753 ) ) ( not ( = ?auto_1357751 ?auto_1357754 ) ) ( not ( = ?auto_1357751 ?auto_1357755 ) ) ( not ( = ?auto_1357751 ?auto_1357756 ) ) ( not ( = ?auto_1357751 ?auto_1357757 ) ) ( not ( = ?auto_1357751 ?auto_1357758 ) ) ( not ( = ?auto_1357751 ?auto_1357759 ) ) ( not ( = ?auto_1357751 ?auto_1357760 ) ) ( not ( = ?auto_1357752 ?auto_1357753 ) ) ( not ( = ?auto_1357752 ?auto_1357754 ) ) ( not ( = ?auto_1357752 ?auto_1357755 ) ) ( not ( = ?auto_1357752 ?auto_1357756 ) ) ( not ( = ?auto_1357752 ?auto_1357757 ) ) ( not ( = ?auto_1357752 ?auto_1357758 ) ) ( not ( = ?auto_1357752 ?auto_1357759 ) ) ( not ( = ?auto_1357752 ?auto_1357760 ) ) ( not ( = ?auto_1357753 ?auto_1357754 ) ) ( not ( = ?auto_1357753 ?auto_1357755 ) ) ( not ( = ?auto_1357753 ?auto_1357756 ) ) ( not ( = ?auto_1357753 ?auto_1357757 ) ) ( not ( = ?auto_1357753 ?auto_1357758 ) ) ( not ( = ?auto_1357753 ?auto_1357759 ) ) ( not ( = ?auto_1357753 ?auto_1357760 ) ) ( not ( = ?auto_1357754 ?auto_1357755 ) ) ( not ( = ?auto_1357754 ?auto_1357756 ) ) ( not ( = ?auto_1357754 ?auto_1357757 ) ) ( not ( = ?auto_1357754 ?auto_1357758 ) ) ( not ( = ?auto_1357754 ?auto_1357759 ) ) ( not ( = ?auto_1357754 ?auto_1357760 ) ) ( not ( = ?auto_1357755 ?auto_1357756 ) ) ( not ( = ?auto_1357755 ?auto_1357757 ) ) ( not ( = ?auto_1357755 ?auto_1357758 ) ) ( not ( = ?auto_1357755 ?auto_1357759 ) ) ( not ( = ?auto_1357755 ?auto_1357760 ) ) ( not ( = ?auto_1357756 ?auto_1357757 ) ) ( not ( = ?auto_1357756 ?auto_1357758 ) ) ( not ( = ?auto_1357756 ?auto_1357759 ) ) ( not ( = ?auto_1357756 ?auto_1357760 ) ) ( not ( = ?auto_1357757 ?auto_1357758 ) ) ( not ( = ?auto_1357757 ?auto_1357759 ) ) ( not ( = ?auto_1357757 ?auto_1357760 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1357758 ?auto_1357759 ?auto_1357760 )
      ( MAKE-9CRATE-VERIFY ?auto_1357751 ?auto_1357752 ?auto_1357753 ?auto_1357754 ?auto_1357755 ?auto_1357756 ?auto_1357757 ?auto_1357758 ?auto_1357759 ?auto_1357760 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1357859 - SURFACE
      ?auto_1357860 - SURFACE
      ?auto_1357861 - SURFACE
      ?auto_1357862 - SURFACE
      ?auto_1357863 - SURFACE
      ?auto_1357864 - SURFACE
      ?auto_1357865 - SURFACE
      ?auto_1357866 - SURFACE
      ?auto_1357867 - SURFACE
      ?auto_1357868 - SURFACE
    )
    :vars
    (
      ?auto_1357870 - HOIST
      ?auto_1357871 - PLACE
      ?auto_1357869 - TRUCK
      ?auto_1357872 - PLACE
      ?auto_1357874 - HOIST
      ?auto_1357873 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1357870 ?auto_1357871 ) ( SURFACE-AT ?auto_1357867 ?auto_1357871 ) ( CLEAR ?auto_1357867 ) ( IS-CRATE ?auto_1357868 ) ( not ( = ?auto_1357867 ?auto_1357868 ) ) ( AVAILABLE ?auto_1357870 ) ( ON ?auto_1357867 ?auto_1357866 ) ( not ( = ?auto_1357866 ?auto_1357867 ) ) ( not ( = ?auto_1357866 ?auto_1357868 ) ) ( TRUCK-AT ?auto_1357869 ?auto_1357872 ) ( not ( = ?auto_1357872 ?auto_1357871 ) ) ( HOIST-AT ?auto_1357874 ?auto_1357872 ) ( not ( = ?auto_1357870 ?auto_1357874 ) ) ( AVAILABLE ?auto_1357874 ) ( SURFACE-AT ?auto_1357868 ?auto_1357872 ) ( ON ?auto_1357868 ?auto_1357873 ) ( CLEAR ?auto_1357868 ) ( not ( = ?auto_1357867 ?auto_1357873 ) ) ( not ( = ?auto_1357868 ?auto_1357873 ) ) ( not ( = ?auto_1357866 ?auto_1357873 ) ) ( ON ?auto_1357860 ?auto_1357859 ) ( ON ?auto_1357861 ?auto_1357860 ) ( ON ?auto_1357862 ?auto_1357861 ) ( ON ?auto_1357863 ?auto_1357862 ) ( ON ?auto_1357864 ?auto_1357863 ) ( ON ?auto_1357865 ?auto_1357864 ) ( ON ?auto_1357866 ?auto_1357865 ) ( not ( = ?auto_1357859 ?auto_1357860 ) ) ( not ( = ?auto_1357859 ?auto_1357861 ) ) ( not ( = ?auto_1357859 ?auto_1357862 ) ) ( not ( = ?auto_1357859 ?auto_1357863 ) ) ( not ( = ?auto_1357859 ?auto_1357864 ) ) ( not ( = ?auto_1357859 ?auto_1357865 ) ) ( not ( = ?auto_1357859 ?auto_1357866 ) ) ( not ( = ?auto_1357859 ?auto_1357867 ) ) ( not ( = ?auto_1357859 ?auto_1357868 ) ) ( not ( = ?auto_1357859 ?auto_1357873 ) ) ( not ( = ?auto_1357860 ?auto_1357861 ) ) ( not ( = ?auto_1357860 ?auto_1357862 ) ) ( not ( = ?auto_1357860 ?auto_1357863 ) ) ( not ( = ?auto_1357860 ?auto_1357864 ) ) ( not ( = ?auto_1357860 ?auto_1357865 ) ) ( not ( = ?auto_1357860 ?auto_1357866 ) ) ( not ( = ?auto_1357860 ?auto_1357867 ) ) ( not ( = ?auto_1357860 ?auto_1357868 ) ) ( not ( = ?auto_1357860 ?auto_1357873 ) ) ( not ( = ?auto_1357861 ?auto_1357862 ) ) ( not ( = ?auto_1357861 ?auto_1357863 ) ) ( not ( = ?auto_1357861 ?auto_1357864 ) ) ( not ( = ?auto_1357861 ?auto_1357865 ) ) ( not ( = ?auto_1357861 ?auto_1357866 ) ) ( not ( = ?auto_1357861 ?auto_1357867 ) ) ( not ( = ?auto_1357861 ?auto_1357868 ) ) ( not ( = ?auto_1357861 ?auto_1357873 ) ) ( not ( = ?auto_1357862 ?auto_1357863 ) ) ( not ( = ?auto_1357862 ?auto_1357864 ) ) ( not ( = ?auto_1357862 ?auto_1357865 ) ) ( not ( = ?auto_1357862 ?auto_1357866 ) ) ( not ( = ?auto_1357862 ?auto_1357867 ) ) ( not ( = ?auto_1357862 ?auto_1357868 ) ) ( not ( = ?auto_1357862 ?auto_1357873 ) ) ( not ( = ?auto_1357863 ?auto_1357864 ) ) ( not ( = ?auto_1357863 ?auto_1357865 ) ) ( not ( = ?auto_1357863 ?auto_1357866 ) ) ( not ( = ?auto_1357863 ?auto_1357867 ) ) ( not ( = ?auto_1357863 ?auto_1357868 ) ) ( not ( = ?auto_1357863 ?auto_1357873 ) ) ( not ( = ?auto_1357864 ?auto_1357865 ) ) ( not ( = ?auto_1357864 ?auto_1357866 ) ) ( not ( = ?auto_1357864 ?auto_1357867 ) ) ( not ( = ?auto_1357864 ?auto_1357868 ) ) ( not ( = ?auto_1357864 ?auto_1357873 ) ) ( not ( = ?auto_1357865 ?auto_1357866 ) ) ( not ( = ?auto_1357865 ?auto_1357867 ) ) ( not ( = ?auto_1357865 ?auto_1357868 ) ) ( not ( = ?auto_1357865 ?auto_1357873 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1357866 ?auto_1357867 ?auto_1357868 )
      ( MAKE-9CRATE-VERIFY ?auto_1357859 ?auto_1357860 ?auto_1357861 ?auto_1357862 ?auto_1357863 ?auto_1357864 ?auto_1357865 ?auto_1357866 ?auto_1357867 ?auto_1357868 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1357968 - SURFACE
      ?auto_1357969 - SURFACE
      ?auto_1357970 - SURFACE
      ?auto_1357971 - SURFACE
      ?auto_1357972 - SURFACE
      ?auto_1357973 - SURFACE
      ?auto_1357974 - SURFACE
      ?auto_1357975 - SURFACE
      ?auto_1357976 - SURFACE
      ?auto_1357977 - SURFACE
    )
    :vars
    (
      ?auto_1357981 - HOIST
      ?auto_1357978 - PLACE
      ?auto_1357983 - PLACE
      ?auto_1357979 - HOIST
      ?auto_1357982 - SURFACE
      ?auto_1357980 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1357981 ?auto_1357978 ) ( SURFACE-AT ?auto_1357976 ?auto_1357978 ) ( CLEAR ?auto_1357976 ) ( IS-CRATE ?auto_1357977 ) ( not ( = ?auto_1357976 ?auto_1357977 ) ) ( AVAILABLE ?auto_1357981 ) ( ON ?auto_1357976 ?auto_1357975 ) ( not ( = ?auto_1357975 ?auto_1357976 ) ) ( not ( = ?auto_1357975 ?auto_1357977 ) ) ( not ( = ?auto_1357983 ?auto_1357978 ) ) ( HOIST-AT ?auto_1357979 ?auto_1357983 ) ( not ( = ?auto_1357981 ?auto_1357979 ) ) ( AVAILABLE ?auto_1357979 ) ( SURFACE-AT ?auto_1357977 ?auto_1357983 ) ( ON ?auto_1357977 ?auto_1357982 ) ( CLEAR ?auto_1357977 ) ( not ( = ?auto_1357976 ?auto_1357982 ) ) ( not ( = ?auto_1357977 ?auto_1357982 ) ) ( not ( = ?auto_1357975 ?auto_1357982 ) ) ( TRUCK-AT ?auto_1357980 ?auto_1357978 ) ( ON ?auto_1357969 ?auto_1357968 ) ( ON ?auto_1357970 ?auto_1357969 ) ( ON ?auto_1357971 ?auto_1357970 ) ( ON ?auto_1357972 ?auto_1357971 ) ( ON ?auto_1357973 ?auto_1357972 ) ( ON ?auto_1357974 ?auto_1357973 ) ( ON ?auto_1357975 ?auto_1357974 ) ( not ( = ?auto_1357968 ?auto_1357969 ) ) ( not ( = ?auto_1357968 ?auto_1357970 ) ) ( not ( = ?auto_1357968 ?auto_1357971 ) ) ( not ( = ?auto_1357968 ?auto_1357972 ) ) ( not ( = ?auto_1357968 ?auto_1357973 ) ) ( not ( = ?auto_1357968 ?auto_1357974 ) ) ( not ( = ?auto_1357968 ?auto_1357975 ) ) ( not ( = ?auto_1357968 ?auto_1357976 ) ) ( not ( = ?auto_1357968 ?auto_1357977 ) ) ( not ( = ?auto_1357968 ?auto_1357982 ) ) ( not ( = ?auto_1357969 ?auto_1357970 ) ) ( not ( = ?auto_1357969 ?auto_1357971 ) ) ( not ( = ?auto_1357969 ?auto_1357972 ) ) ( not ( = ?auto_1357969 ?auto_1357973 ) ) ( not ( = ?auto_1357969 ?auto_1357974 ) ) ( not ( = ?auto_1357969 ?auto_1357975 ) ) ( not ( = ?auto_1357969 ?auto_1357976 ) ) ( not ( = ?auto_1357969 ?auto_1357977 ) ) ( not ( = ?auto_1357969 ?auto_1357982 ) ) ( not ( = ?auto_1357970 ?auto_1357971 ) ) ( not ( = ?auto_1357970 ?auto_1357972 ) ) ( not ( = ?auto_1357970 ?auto_1357973 ) ) ( not ( = ?auto_1357970 ?auto_1357974 ) ) ( not ( = ?auto_1357970 ?auto_1357975 ) ) ( not ( = ?auto_1357970 ?auto_1357976 ) ) ( not ( = ?auto_1357970 ?auto_1357977 ) ) ( not ( = ?auto_1357970 ?auto_1357982 ) ) ( not ( = ?auto_1357971 ?auto_1357972 ) ) ( not ( = ?auto_1357971 ?auto_1357973 ) ) ( not ( = ?auto_1357971 ?auto_1357974 ) ) ( not ( = ?auto_1357971 ?auto_1357975 ) ) ( not ( = ?auto_1357971 ?auto_1357976 ) ) ( not ( = ?auto_1357971 ?auto_1357977 ) ) ( not ( = ?auto_1357971 ?auto_1357982 ) ) ( not ( = ?auto_1357972 ?auto_1357973 ) ) ( not ( = ?auto_1357972 ?auto_1357974 ) ) ( not ( = ?auto_1357972 ?auto_1357975 ) ) ( not ( = ?auto_1357972 ?auto_1357976 ) ) ( not ( = ?auto_1357972 ?auto_1357977 ) ) ( not ( = ?auto_1357972 ?auto_1357982 ) ) ( not ( = ?auto_1357973 ?auto_1357974 ) ) ( not ( = ?auto_1357973 ?auto_1357975 ) ) ( not ( = ?auto_1357973 ?auto_1357976 ) ) ( not ( = ?auto_1357973 ?auto_1357977 ) ) ( not ( = ?auto_1357973 ?auto_1357982 ) ) ( not ( = ?auto_1357974 ?auto_1357975 ) ) ( not ( = ?auto_1357974 ?auto_1357976 ) ) ( not ( = ?auto_1357974 ?auto_1357977 ) ) ( not ( = ?auto_1357974 ?auto_1357982 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1357975 ?auto_1357976 ?auto_1357977 )
      ( MAKE-9CRATE-VERIFY ?auto_1357968 ?auto_1357969 ?auto_1357970 ?auto_1357971 ?auto_1357972 ?auto_1357973 ?auto_1357974 ?auto_1357975 ?auto_1357976 ?auto_1357977 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1358077 - SURFACE
      ?auto_1358078 - SURFACE
      ?auto_1358079 - SURFACE
      ?auto_1358080 - SURFACE
      ?auto_1358081 - SURFACE
      ?auto_1358082 - SURFACE
      ?auto_1358083 - SURFACE
      ?auto_1358084 - SURFACE
      ?auto_1358085 - SURFACE
      ?auto_1358086 - SURFACE
    )
    :vars
    (
      ?auto_1358088 - HOIST
      ?auto_1358090 - PLACE
      ?auto_1358091 - PLACE
      ?auto_1358089 - HOIST
      ?auto_1358092 - SURFACE
      ?auto_1358087 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1358088 ?auto_1358090 ) ( IS-CRATE ?auto_1358086 ) ( not ( = ?auto_1358085 ?auto_1358086 ) ) ( not ( = ?auto_1358084 ?auto_1358085 ) ) ( not ( = ?auto_1358084 ?auto_1358086 ) ) ( not ( = ?auto_1358091 ?auto_1358090 ) ) ( HOIST-AT ?auto_1358089 ?auto_1358091 ) ( not ( = ?auto_1358088 ?auto_1358089 ) ) ( AVAILABLE ?auto_1358089 ) ( SURFACE-AT ?auto_1358086 ?auto_1358091 ) ( ON ?auto_1358086 ?auto_1358092 ) ( CLEAR ?auto_1358086 ) ( not ( = ?auto_1358085 ?auto_1358092 ) ) ( not ( = ?auto_1358086 ?auto_1358092 ) ) ( not ( = ?auto_1358084 ?auto_1358092 ) ) ( TRUCK-AT ?auto_1358087 ?auto_1358090 ) ( SURFACE-AT ?auto_1358084 ?auto_1358090 ) ( CLEAR ?auto_1358084 ) ( LIFTING ?auto_1358088 ?auto_1358085 ) ( IS-CRATE ?auto_1358085 ) ( ON ?auto_1358078 ?auto_1358077 ) ( ON ?auto_1358079 ?auto_1358078 ) ( ON ?auto_1358080 ?auto_1358079 ) ( ON ?auto_1358081 ?auto_1358080 ) ( ON ?auto_1358082 ?auto_1358081 ) ( ON ?auto_1358083 ?auto_1358082 ) ( ON ?auto_1358084 ?auto_1358083 ) ( not ( = ?auto_1358077 ?auto_1358078 ) ) ( not ( = ?auto_1358077 ?auto_1358079 ) ) ( not ( = ?auto_1358077 ?auto_1358080 ) ) ( not ( = ?auto_1358077 ?auto_1358081 ) ) ( not ( = ?auto_1358077 ?auto_1358082 ) ) ( not ( = ?auto_1358077 ?auto_1358083 ) ) ( not ( = ?auto_1358077 ?auto_1358084 ) ) ( not ( = ?auto_1358077 ?auto_1358085 ) ) ( not ( = ?auto_1358077 ?auto_1358086 ) ) ( not ( = ?auto_1358077 ?auto_1358092 ) ) ( not ( = ?auto_1358078 ?auto_1358079 ) ) ( not ( = ?auto_1358078 ?auto_1358080 ) ) ( not ( = ?auto_1358078 ?auto_1358081 ) ) ( not ( = ?auto_1358078 ?auto_1358082 ) ) ( not ( = ?auto_1358078 ?auto_1358083 ) ) ( not ( = ?auto_1358078 ?auto_1358084 ) ) ( not ( = ?auto_1358078 ?auto_1358085 ) ) ( not ( = ?auto_1358078 ?auto_1358086 ) ) ( not ( = ?auto_1358078 ?auto_1358092 ) ) ( not ( = ?auto_1358079 ?auto_1358080 ) ) ( not ( = ?auto_1358079 ?auto_1358081 ) ) ( not ( = ?auto_1358079 ?auto_1358082 ) ) ( not ( = ?auto_1358079 ?auto_1358083 ) ) ( not ( = ?auto_1358079 ?auto_1358084 ) ) ( not ( = ?auto_1358079 ?auto_1358085 ) ) ( not ( = ?auto_1358079 ?auto_1358086 ) ) ( not ( = ?auto_1358079 ?auto_1358092 ) ) ( not ( = ?auto_1358080 ?auto_1358081 ) ) ( not ( = ?auto_1358080 ?auto_1358082 ) ) ( not ( = ?auto_1358080 ?auto_1358083 ) ) ( not ( = ?auto_1358080 ?auto_1358084 ) ) ( not ( = ?auto_1358080 ?auto_1358085 ) ) ( not ( = ?auto_1358080 ?auto_1358086 ) ) ( not ( = ?auto_1358080 ?auto_1358092 ) ) ( not ( = ?auto_1358081 ?auto_1358082 ) ) ( not ( = ?auto_1358081 ?auto_1358083 ) ) ( not ( = ?auto_1358081 ?auto_1358084 ) ) ( not ( = ?auto_1358081 ?auto_1358085 ) ) ( not ( = ?auto_1358081 ?auto_1358086 ) ) ( not ( = ?auto_1358081 ?auto_1358092 ) ) ( not ( = ?auto_1358082 ?auto_1358083 ) ) ( not ( = ?auto_1358082 ?auto_1358084 ) ) ( not ( = ?auto_1358082 ?auto_1358085 ) ) ( not ( = ?auto_1358082 ?auto_1358086 ) ) ( not ( = ?auto_1358082 ?auto_1358092 ) ) ( not ( = ?auto_1358083 ?auto_1358084 ) ) ( not ( = ?auto_1358083 ?auto_1358085 ) ) ( not ( = ?auto_1358083 ?auto_1358086 ) ) ( not ( = ?auto_1358083 ?auto_1358092 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1358084 ?auto_1358085 ?auto_1358086 )
      ( MAKE-9CRATE-VERIFY ?auto_1358077 ?auto_1358078 ?auto_1358079 ?auto_1358080 ?auto_1358081 ?auto_1358082 ?auto_1358083 ?auto_1358084 ?auto_1358085 ?auto_1358086 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1358186 - SURFACE
      ?auto_1358187 - SURFACE
      ?auto_1358188 - SURFACE
      ?auto_1358189 - SURFACE
      ?auto_1358190 - SURFACE
      ?auto_1358191 - SURFACE
      ?auto_1358192 - SURFACE
      ?auto_1358193 - SURFACE
      ?auto_1358194 - SURFACE
      ?auto_1358195 - SURFACE
    )
    :vars
    (
      ?auto_1358196 - HOIST
      ?auto_1358198 - PLACE
      ?auto_1358200 - PLACE
      ?auto_1358201 - HOIST
      ?auto_1358199 - SURFACE
      ?auto_1358197 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1358196 ?auto_1358198 ) ( IS-CRATE ?auto_1358195 ) ( not ( = ?auto_1358194 ?auto_1358195 ) ) ( not ( = ?auto_1358193 ?auto_1358194 ) ) ( not ( = ?auto_1358193 ?auto_1358195 ) ) ( not ( = ?auto_1358200 ?auto_1358198 ) ) ( HOIST-AT ?auto_1358201 ?auto_1358200 ) ( not ( = ?auto_1358196 ?auto_1358201 ) ) ( AVAILABLE ?auto_1358201 ) ( SURFACE-AT ?auto_1358195 ?auto_1358200 ) ( ON ?auto_1358195 ?auto_1358199 ) ( CLEAR ?auto_1358195 ) ( not ( = ?auto_1358194 ?auto_1358199 ) ) ( not ( = ?auto_1358195 ?auto_1358199 ) ) ( not ( = ?auto_1358193 ?auto_1358199 ) ) ( TRUCK-AT ?auto_1358197 ?auto_1358198 ) ( SURFACE-AT ?auto_1358193 ?auto_1358198 ) ( CLEAR ?auto_1358193 ) ( IS-CRATE ?auto_1358194 ) ( AVAILABLE ?auto_1358196 ) ( IN ?auto_1358194 ?auto_1358197 ) ( ON ?auto_1358187 ?auto_1358186 ) ( ON ?auto_1358188 ?auto_1358187 ) ( ON ?auto_1358189 ?auto_1358188 ) ( ON ?auto_1358190 ?auto_1358189 ) ( ON ?auto_1358191 ?auto_1358190 ) ( ON ?auto_1358192 ?auto_1358191 ) ( ON ?auto_1358193 ?auto_1358192 ) ( not ( = ?auto_1358186 ?auto_1358187 ) ) ( not ( = ?auto_1358186 ?auto_1358188 ) ) ( not ( = ?auto_1358186 ?auto_1358189 ) ) ( not ( = ?auto_1358186 ?auto_1358190 ) ) ( not ( = ?auto_1358186 ?auto_1358191 ) ) ( not ( = ?auto_1358186 ?auto_1358192 ) ) ( not ( = ?auto_1358186 ?auto_1358193 ) ) ( not ( = ?auto_1358186 ?auto_1358194 ) ) ( not ( = ?auto_1358186 ?auto_1358195 ) ) ( not ( = ?auto_1358186 ?auto_1358199 ) ) ( not ( = ?auto_1358187 ?auto_1358188 ) ) ( not ( = ?auto_1358187 ?auto_1358189 ) ) ( not ( = ?auto_1358187 ?auto_1358190 ) ) ( not ( = ?auto_1358187 ?auto_1358191 ) ) ( not ( = ?auto_1358187 ?auto_1358192 ) ) ( not ( = ?auto_1358187 ?auto_1358193 ) ) ( not ( = ?auto_1358187 ?auto_1358194 ) ) ( not ( = ?auto_1358187 ?auto_1358195 ) ) ( not ( = ?auto_1358187 ?auto_1358199 ) ) ( not ( = ?auto_1358188 ?auto_1358189 ) ) ( not ( = ?auto_1358188 ?auto_1358190 ) ) ( not ( = ?auto_1358188 ?auto_1358191 ) ) ( not ( = ?auto_1358188 ?auto_1358192 ) ) ( not ( = ?auto_1358188 ?auto_1358193 ) ) ( not ( = ?auto_1358188 ?auto_1358194 ) ) ( not ( = ?auto_1358188 ?auto_1358195 ) ) ( not ( = ?auto_1358188 ?auto_1358199 ) ) ( not ( = ?auto_1358189 ?auto_1358190 ) ) ( not ( = ?auto_1358189 ?auto_1358191 ) ) ( not ( = ?auto_1358189 ?auto_1358192 ) ) ( not ( = ?auto_1358189 ?auto_1358193 ) ) ( not ( = ?auto_1358189 ?auto_1358194 ) ) ( not ( = ?auto_1358189 ?auto_1358195 ) ) ( not ( = ?auto_1358189 ?auto_1358199 ) ) ( not ( = ?auto_1358190 ?auto_1358191 ) ) ( not ( = ?auto_1358190 ?auto_1358192 ) ) ( not ( = ?auto_1358190 ?auto_1358193 ) ) ( not ( = ?auto_1358190 ?auto_1358194 ) ) ( not ( = ?auto_1358190 ?auto_1358195 ) ) ( not ( = ?auto_1358190 ?auto_1358199 ) ) ( not ( = ?auto_1358191 ?auto_1358192 ) ) ( not ( = ?auto_1358191 ?auto_1358193 ) ) ( not ( = ?auto_1358191 ?auto_1358194 ) ) ( not ( = ?auto_1358191 ?auto_1358195 ) ) ( not ( = ?auto_1358191 ?auto_1358199 ) ) ( not ( = ?auto_1358192 ?auto_1358193 ) ) ( not ( = ?auto_1358192 ?auto_1358194 ) ) ( not ( = ?auto_1358192 ?auto_1358195 ) ) ( not ( = ?auto_1358192 ?auto_1358199 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1358193 ?auto_1358194 ?auto_1358195 )
      ( MAKE-9CRATE-VERIFY ?auto_1358186 ?auto_1358187 ?auto_1358188 ?auto_1358189 ?auto_1358190 ?auto_1358191 ?auto_1358192 ?auto_1358193 ?auto_1358194 ?auto_1358195 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1363751 - SURFACE
      ?auto_1363752 - SURFACE
      ?auto_1363753 - SURFACE
      ?auto_1363754 - SURFACE
      ?auto_1363755 - SURFACE
      ?auto_1363756 - SURFACE
      ?auto_1363757 - SURFACE
      ?auto_1363758 - SURFACE
      ?auto_1363759 - SURFACE
      ?auto_1363760 - SURFACE
      ?auto_1363761 - SURFACE
    )
    :vars
    (
      ?auto_1363762 - HOIST
      ?auto_1363763 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1363762 ?auto_1363763 ) ( SURFACE-AT ?auto_1363760 ?auto_1363763 ) ( CLEAR ?auto_1363760 ) ( LIFTING ?auto_1363762 ?auto_1363761 ) ( IS-CRATE ?auto_1363761 ) ( not ( = ?auto_1363760 ?auto_1363761 ) ) ( ON ?auto_1363752 ?auto_1363751 ) ( ON ?auto_1363753 ?auto_1363752 ) ( ON ?auto_1363754 ?auto_1363753 ) ( ON ?auto_1363755 ?auto_1363754 ) ( ON ?auto_1363756 ?auto_1363755 ) ( ON ?auto_1363757 ?auto_1363756 ) ( ON ?auto_1363758 ?auto_1363757 ) ( ON ?auto_1363759 ?auto_1363758 ) ( ON ?auto_1363760 ?auto_1363759 ) ( not ( = ?auto_1363751 ?auto_1363752 ) ) ( not ( = ?auto_1363751 ?auto_1363753 ) ) ( not ( = ?auto_1363751 ?auto_1363754 ) ) ( not ( = ?auto_1363751 ?auto_1363755 ) ) ( not ( = ?auto_1363751 ?auto_1363756 ) ) ( not ( = ?auto_1363751 ?auto_1363757 ) ) ( not ( = ?auto_1363751 ?auto_1363758 ) ) ( not ( = ?auto_1363751 ?auto_1363759 ) ) ( not ( = ?auto_1363751 ?auto_1363760 ) ) ( not ( = ?auto_1363751 ?auto_1363761 ) ) ( not ( = ?auto_1363752 ?auto_1363753 ) ) ( not ( = ?auto_1363752 ?auto_1363754 ) ) ( not ( = ?auto_1363752 ?auto_1363755 ) ) ( not ( = ?auto_1363752 ?auto_1363756 ) ) ( not ( = ?auto_1363752 ?auto_1363757 ) ) ( not ( = ?auto_1363752 ?auto_1363758 ) ) ( not ( = ?auto_1363752 ?auto_1363759 ) ) ( not ( = ?auto_1363752 ?auto_1363760 ) ) ( not ( = ?auto_1363752 ?auto_1363761 ) ) ( not ( = ?auto_1363753 ?auto_1363754 ) ) ( not ( = ?auto_1363753 ?auto_1363755 ) ) ( not ( = ?auto_1363753 ?auto_1363756 ) ) ( not ( = ?auto_1363753 ?auto_1363757 ) ) ( not ( = ?auto_1363753 ?auto_1363758 ) ) ( not ( = ?auto_1363753 ?auto_1363759 ) ) ( not ( = ?auto_1363753 ?auto_1363760 ) ) ( not ( = ?auto_1363753 ?auto_1363761 ) ) ( not ( = ?auto_1363754 ?auto_1363755 ) ) ( not ( = ?auto_1363754 ?auto_1363756 ) ) ( not ( = ?auto_1363754 ?auto_1363757 ) ) ( not ( = ?auto_1363754 ?auto_1363758 ) ) ( not ( = ?auto_1363754 ?auto_1363759 ) ) ( not ( = ?auto_1363754 ?auto_1363760 ) ) ( not ( = ?auto_1363754 ?auto_1363761 ) ) ( not ( = ?auto_1363755 ?auto_1363756 ) ) ( not ( = ?auto_1363755 ?auto_1363757 ) ) ( not ( = ?auto_1363755 ?auto_1363758 ) ) ( not ( = ?auto_1363755 ?auto_1363759 ) ) ( not ( = ?auto_1363755 ?auto_1363760 ) ) ( not ( = ?auto_1363755 ?auto_1363761 ) ) ( not ( = ?auto_1363756 ?auto_1363757 ) ) ( not ( = ?auto_1363756 ?auto_1363758 ) ) ( not ( = ?auto_1363756 ?auto_1363759 ) ) ( not ( = ?auto_1363756 ?auto_1363760 ) ) ( not ( = ?auto_1363756 ?auto_1363761 ) ) ( not ( = ?auto_1363757 ?auto_1363758 ) ) ( not ( = ?auto_1363757 ?auto_1363759 ) ) ( not ( = ?auto_1363757 ?auto_1363760 ) ) ( not ( = ?auto_1363757 ?auto_1363761 ) ) ( not ( = ?auto_1363758 ?auto_1363759 ) ) ( not ( = ?auto_1363758 ?auto_1363760 ) ) ( not ( = ?auto_1363758 ?auto_1363761 ) ) ( not ( = ?auto_1363759 ?auto_1363760 ) ) ( not ( = ?auto_1363759 ?auto_1363761 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1363760 ?auto_1363761 )
      ( MAKE-10CRATE-VERIFY ?auto_1363751 ?auto_1363752 ?auto_1363753 ?auto_1363754 ?auto_1363755 ?auto_1363756 ?auto_1363757 ?auto_1363758 ?auto_1363759 ?auto_1363760 ?auto_1363761 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1363845 - SURFACE
      ?auto_1363846 - SURFACE
      ?auto_1363847 - SURFACE
      ?auto_1363848 - SURFACE
      ?auto_1363849 - SURFACE
      ?auto_1363850 - SURFACE
      ?auto_1363851 - SURFACE
      ?auto_1363852 - SURFACE
      ?auto_1363853 - SURFACE
      ?auto_1363854 - SURFACE
      ?auto_1363855 - SURFACE
    )
    :vars
    (
      ?auto_1363858 - HOIST
      ?auto_1363857 - PLACE
      ?auto_1363856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1363858 ?auto_1363857 ) ( SURFACE-AT ?auto_1363854 ?auto_1363857 ) ( CLEAR ?auto_1363854 ) ( IS-CRATE ?auto_1363855 ) ( not ( = ?auto_1363854 ?auto_1363855 ) ) ( TRUCK-AT ?auto_1363856 ?auto_1363857 ) ( AVAILABLE ?auto_1363858 ) ( IN ?auto_1363855 ?auto_1363856 ) ( ON ?auto_1363854 ?auto_1363853 ) ( not ( = ?auto_1363853 ?auto_1363854 ) ) ( not ( = ?auto_1363853 ?auto_1363855 ) ) ( ON ?auto_1363846 ?auto_1363845 ) ( ON ?auto_1363847 ?auto_1363846 ) ( ON ?auto_1363848 ?auto_1363847 ) ( ON ?auto_1363849 ?auto_1363848 ) ( ON ?auto_1363850 ?auto_1363849 ) ( ON ?auto_1363851 ?auto_1363850 ) ( ON ?auto_1363852 ?auto_1363851 ) ( ON ?auto_1363853 ?auto_1363852 ) ( not ( = ?auto_1363845 ?auto_1363846 ) ) ( not ( = ?auto_1363845 ?auto_1363847 ) ) ( not ( = ?auto_1363845 ?auto_1363848 ) ) ( not ( = ?auto_1363845 ?auto_1363849 ) ) ( not ( = ?auto_1363845 ?auto_1363850 ) ) ( not ( = ?auto_1363845 ?auto_1363851 ) ) ( not ( = ?auto_1363845 ?auto_1363852 ) ) ( not ( = ?auto_1363845 ?auto_1363853 ) ) ( not ( = ?auto_1363845 ?auto_1363854 ) ) ( not ( = ?auto_1363845 ?auto_1363855 ) ) ( not ( = ?auto_1363846 ?auto_1363847 ) ) ( not ( = ?auto_1363846 ?auto_1363848 ) ) ( not ( = ?auto_1363846 ?auto_1363849 ) ) ( not ( = ?auto_1363846 ?auto_1363850 ) ) ( not ( = ?auto_1363846 ?auto_1363851 ) ) ( not ( = ?auto_1363846 ?auto_1363852 ) ) ( not ( = ?auto_1363846 ?auto_1363853 ) ) ( not ( = ?auto_1363846 ?auto_1363854 ) ) ( not ( = ?auto_1363846 ?auto_1363855 ) ) ( not ( = ?auto_1363847 ?auto_1363848 ) ) ( not ( = ?auto_1363847 ?auto_1363849 ) ) ( not ( = ?auto_1363847 ?auto_1363850 ) ) ( not ( = ?auto_1363847 ?auto_1363851 ) ) ( not ( = ?auto_1363847 ?auto_1363852 ) ) ( not ( = ?auto_1363847 ?auto_1363853 ) ) ( not ( = ?auto_1363847 ?auto_1363854 ) ) ( not ( = ?auto_1363847 ?auto_1363855 ) ) ( not ( = ?auto_1363848 ?auto_1363849 ) ) ( not ( = ?auto_1363848 ?auto_1363850 ) ) ( not ( = ?auto_1363848 ?auto_1363851 ) ) ( not ( = ?auto_1363848 ?auto_1363852 ) ) ( not ( = ?auto_1363848 ?auto_1363853 ) ) ( not ( = ?auto_1363848 ?auto_1363854 ) ) ( not ( = ?auto_1363848 ?auto_1363855 ) ) ( not ( = ?auto_1363849 ?auto_1363850 ) ) ( not ( = ?auto_1363849 ?auto_1363851 ) ) ( not ( = ?auto_1363849 ?auto_1363852 ) ) ( not ( = ?auto_1363849 ?auto_1363853 ) ) ( not ( = ?auto_1363849 ?auto_1363854 ) ) ( not ( = ?auto_1363849 ?auto_1363855 ) ) ( not ( = ?auto_1363850 ?auto_1363851 ) ) ( not ( = ?auto_1363850 ?auto_1363852 ) ) ( not ( = ?auto_1363850 ?auto_1363853 ) ) ( not ( = ?auto_1363850 ?auto_1363854 ) ) ( not ( = ?auto_1363850 ?auto_1363855 ) ) ( not ( = ?auto_1363851 ?auto_1363852 ) ) ( not ( = ?auto_1363851 ?auto_1363853 ) ) ( not ( = ?auto_1363851 ?auto_1363854 ) ) ( not ( = ?auto_1363851 ?auto_1363855 ) ) ( not ( = ?auto_1363852 ?auto_1363853 ) ) ( not ( = ?auto_1363852 ?auto_1363854 ) ) ( not ( = ?auto_1363852 ?auto_1363855 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1363853 ?auto_1363854 ?auto_1363855 )
      ( MAKE-10CRATE-VERIFY ?auto_1363845 ?auto_1363846 ?auto_1363847 ?auto_1363848 ?auto_1363849 ?auto_1363850 ?auto_1363851 ?auto_1363852 ?auto_1363853 ?auto_1363854 ?auto_1363855 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1363950 - SURFACE
      ?auto_1363951 - SURFACE
      ?auto_1363952 - SURFACE
      ?auto_1363953 - SURFACE
      ?auto_1363954 - SURFACE
      ?auto_1363955 - SURFACE
      ?auto_1363956 - SURFACE
      ?auto_1363957 - SURFACE
      ?auto_1363958 - SURFACE
      ?auto_1363959 - SURFACE
      ?auto_1363960 - SURFACE
    )
    :vars
    (
      ?auto_1363962 - HOIST
      ?auto_1363964 - PLACE
      ?auto_1363963 - TRUCK
      ?auto_1363961 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1363962 ?auto_1363964 ) ( SURFACE-AT ?auto_1363959 ?auto_1363964 ) ( CLEAR ?auto_1363959 ) ( IS-CRATE ?auto_1363960 ) ( not ( = ?auto_1363959 ?auto_1363960 ) ) ( AVAILABLE ?auto_1363962 ) ( IN ?auto_1363960 ?auto_1363963 ) ( ON ?auto_1363959 ?auto_1363958 ) ( not ( = ?auto_1363958 ?auto_1363959 ) ) ( not ( = ?auto_1363958 ?auto_1363960 ) ) ( TRUCK-AT ?auto_1363963 ?auto_1363961 ) ( not ( = ?auto_1363961 ?auto_1363964 ) ) ( ON ?auto_1363951 ?auto_1363950 ) ( ON ?auto_1363952 ?auto_1363951 ) ( ON ?auto_1363953 ?auto_1363952 ) ( ON ?auto_1363954 ?auto_1363953 ) ( ON ?auto_1363955 ?auto_1363954 ) ( ON ?auto_1363956 ?auto_1363955 ) ( ON ?auto_1363957 ?auto_1363956 ) ( ON ?auto_1363958 ?auto_1363957 ) ( not ( = ?auto_1363950 ?auto_1363951 ) ) ( not ( = ?auto_1363950 ?auto_1363952 ) ) ( not ( = ?auto_1363950 ?auto_1363953 ) ) ( not ( = ?auto_1363950 ?auto_1363954 ) ) ( not ( = ?auto_1363950 ?auto_1363955 ) ) ( not ( = ?auto_1363950 ?auto_1363956 ) ) ( not ( = ?auto_1363950 ?auto_1363957 ) ) ( not ( = ?auto_1363950 ?auto_1363958 ) ) ( not ( = ?auto_1363950 ?auto_1363959 ) ) ( not ( = ?auto_1363950 ?auto_1363960 ) ) ( not ( = ?auto_1363951 ?auto_1363952 ) ) ( not ( = ?auto_1363951 ?auto_1363953 ) ) ( not ( = ?auto_1363951 ?auto_1363954 ) ) ( not ( = ?auto_1363951 ?auto_1363955 ) ) ( not ( = ?auto_1363951 ?auto_1363956 ) ) ( not ( = ?auto_1363951 ?auto_1363957 ) ) ( not ( = ?auto_1363951 ?auto_1363958 ) ) ( not ( = ?auto_1363951 ?auto_1363959 ) ) ( not ( = ?auto_1363951 ?auto_1363960 ) ) ( not ( = ?auto_1363952 ?auto_1363953 ) ) ( not ( = ?auto_1363952 ?auto_1363954 ) ) ( not ( = ?auto_1363952 ?auto_1363955 ) ) ( not ( = ?auto_1363952 ?auto_1363956 ) ) ( not ( = ?auto_1363952 ?auto_1363957 ) ) ( not ( = ?auto_1363952 ?auto_1363958 ) ) ( not ( = ?auto_1363952 ?auto_1363959 ) ) ( not ( = ?auto_1363952 ?auto_1363960 ) ) ( not ( = ?auto_1363953 ?auto_1363954 ) ) ( not ( = ?auto_1363953 ?auto_1363955 ) ) ( not ( = ?auto_1363953 ?auto_1363956 ) ) ( not ( = ?auto_1363953 ?auto_1363957 ) ) ( not ( = ?auto_1363953 ?auto_1363958 ) ) ( not ( = ?auto_1363953 ?auto_1363959 ) ) ( not ( = ?auto_1363953 ?auto_1363960 ) ) ( not ( = ?auto_1363954 ?auto_1363955 ) ) ( not ( = ?auto_1363954 ?auto_1363956 ) ) ( not ( = ?auto_1363954 ?auto_1363957 ) ) ( not ( = ?auto_1363954 ?auto_1363958 ) ) ( not ( = ?auto_1363954 ?auto_1363959 ) ) ( not ( = ?auto_1363954 ?auto_1363960 ) ) ( not ( = ?auto_1363955 ?auto_1363956 ) ) ( not ( = ?auto_1363955 ?auto_1363957 ) ) ( not ( = ?auto_1363955 ?auto_1363958 ) ) ( not ( = ?auto_1363955 ?auto_1363959 ) ) ( not ( = ?auto_1363955 ?auto_1363960 ) ) ( not ( = ?auto_1363956 ?auto_1363957 ) ) ( not ( = ?auto_1363956 ?auto_1363958 ) ) ( not ( = ?auto_1363956 ?auto_1363959 ) ) ( not ( = ?auto_1363956 ?auto_1363960 ) ) ( not ( = ?auto_1363957 ?auto_1363958 ) ) ( not ( = ?auto_1363957 ?auto_1363959 ) ) ( not ( = ?auto_1363957 ?auto_1363960 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1363958 ?auto_1363959 ?auto_1363960 )
      ( MAKE-10CRATE-VERIFY ?auto_1363950 ?auto_1363951 ?auto_1363952 ?auto_1363953 ?auto_1363954 ?auto_1363955 ?auto_1363956 ?auto_1363957 ?auto_1363958 ?auto_1363959 ?auto_1363960 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1364065 - SURFACE
      ?auto_1364066 - SURFACE
      ?auto_1364067 - SURFACE
      ?auto_1364068 - SURFACE
      ?auto_1364069 - SURFACE
      ?auto_1364070 - SURFACE
      ?auto_1364071 - SURFACE
      ?auto_1364072 - SURFACE
      ?auto_1364073 - SURFACE
      ?auto_1364074 - SURFACE
      ?auto_1364075 - SURFACE
    )
    :vars
    (
      ?auto_1364078 - HOIST
      ?auto_1364076 - PLACE
      ?auto_1364077 - TRUCK
      ?auto_1364080 - PLACE
      ?auto_1364079 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1364078 ?auto_1364076 ) ( SURFACE-AT ?auto_1364074 ?auto_1364076 ) ( CLEAR ?auto_1364074 ) ( IS-CRATE ?auto_1364075 ) ( not ( = ?auto_1364074 ?auto_1364075 ) ) ( AVAILABLE ?auto_1364078 ) ( ON ?auto_1364074 ?auto_1364073 ) ( not ( = ?auto_1364073 ?auto_1364074 ) ) ( not ( = ?auto_1364073 ?auto_1364075 ) ) ( TRUCK-AT ?auto_1364077 ?auto_1364080 ) ( not ( = ?auto_1364080 ?auto_1364076 ) ) ( HOIST-AT ?auto_1364079 ?auto_1364080 ) ( LIFTING ?auto_1364079 ?auto_1364075 ) ( not ( = ?auto_1364078 ?auto_1364079 ) ) ( ON ?auto_1364066 ?auto_1364065 ) ( ON ?auto_1364067 ?auto_1364066 ) ( ON ?auto_1364068 ?auto_1364067 ) ( ON ?auto_1364069 ?auto_1364068 ) ( ON ?auto_1364070 ?auto_1364069 ) ( ON ?auto_1364071 ?auto_1364070 ) ( ON ?auto_1364072 ?auto_1364071 ) ( ON ?auto_1364073 ?auto_1364072 ) ( not ( = ?auto_1364065 ?auto_1364066 ) ) ( not ( = ?auto_1364065 ?auto_1364067 ) ) ( not ( = ?auto_1364065 ?auto_1364068 ) ) ( not ( = ?auto_1364065 ?auto_1364069 ) ) ( not ( = ?auto_1364065 ?auto_1364070 ) ) ( not ( = ?auto_1364065 ?auto_1364071 ) ) ( not ( = ?auto_1364065 ?auto_1364072 ) ) ( not ( = ?auto_1364065 ?auto_1364073 ) ) ( not ( = ?auto_1364065 ?auto_1364074 ) ) ( not ( = ?auto_1364065 ?auto_1364075 ) ) ( not ( = ?auto_1364066 ?auto_1364067 ) ) ( not ( = ?auto_1364066 ?auto_1364068 ) ) ( not ( = ?auto_1364066 ?auto_1364069 ) ) ( not ( = ?auto_1364066 ?auto_1364070 ) ) ( not ( = ?auto_1364066 ?auto_1364071 ) ) ( not ( = ?auto_1364066 ?auto_1364072 ) ) ( not ( = ?auto_1364066 ?auto_1364073 ) ) ( not ( = ?auto_1364066 ?auto_1364074 ) ) ( not ( = ?auto_1364066 ?auto_1364075 ) ) ( not ( = ?auto_1364067 ?auto_1364068 ) ) ( not ( = ?auto_1364067 ?auto_1364069 ) ) ( not ( = ?auto_1364067 ?auto_1364070 ) ) ( not ( = ?auto_1364067 ?auto_1364071 ) ) ( not ( = ?auto_1364067 ?auto_1364072 ) ) ( not ( = ?auto_1364067 ?auto_1364073 ) ) ( not ( = ?auto_1364067 ?auto_1364074 ) ) ( not ( = ?auto_1364067 ?auto_1364075 ) ) ( not ( = ?auto_1364068 ?auto_1364069 ) ) ( not ( = ?auto_1364068 ?auto_1364070 ) ) ( not ( = ?auto_1364068 ?auto_1364071 ) ) ( not ( = ?auto_1364068 ?auto_1364072 ) ) ( not ( = ?auto_1364068 ?auto_1364073 ) ) ( not ( = ?auto_1364068 ?auto_1364074 ) ) ( not ( = ?auto_1364068 ?auto_1364075 ) ) ( not ( = ?auto_1364069 ?auto_1364070 ) ) ( not ( = ?auto_1364069 ?auto_1364071 ) ) ( not ( = ?auto_1364069 ?auto_1364072 ) ) ( not ( = ?auto_1364069 ?auto_1364073 ) ) ( not ( = ?auto_1364069 ?auto_1364074 ) ) ( not ( = ?auto_1364069 ?auto_1364075 ) ) ( not ( = ?auto_1364070 ?auto_1364071 ) ) ( not ( = ?auto_1364070 ?auto_1364072 ) ) ( not ( = ?auto_1364070 ?auto_1364073 ) ) ( not ( = ?auto_1364070 ?auto_1364074 ) ) ( not ( = ?auto_1364070 ?auto_1364075 ) ) ( not ( = ?auto_1364071 ?auto_1364072 ) ) ( not ( = ?auto_1364071 ?auto_1364073 ) ) ( not ( = ?auto_1364071 ?auto_1364074 ) ) ( not ( = ?auto_1364071 ?auto_1364075 ) ) ( not ( = ?auto_1364072 ?auto_1364073 ) ) ( not ( = ?auto_1364072 ?auto_1364074 ) ) ( not ( = ?auto_1364072 ?auto_1364075 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1364073 ?auto_1364074 ?auto_1364075 )
      ( MAKE-10CRATE-VERIFY ?auto_1364065 ?auto_1364066 ?auto_1364067 ?auto_1364068 ?auto_1364069 ?auto_1364070 ?auto_1364071 ?auto_1364072 ?auto_1364073 ?auto_1364074 ?auto_1364075 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1364190 - SURFACE
      ?auto_1364191 - SURFACE
      ?auto_1364192 - SURFACE
      ?auto_1364193 - SURFACE
      ?auto_1364194 - SURFACE
      ?auto_1364195 - SURFACE
      ?auto_1364196 - SURFACE
      ?auto_1364197 - SURFACE
      ?auto_1364198 - SURFACE
      ?auto_1364199 - SURFACE
      ?auto_1364200 - SURFACE
    )
    :vars
    (
      ?auto_1364203 - HOIST
      ?auto_1364206 - PLACE
      ?auto_1364202 - TRUCK
      ?auto_1364204 - PLACE
      ?auto_1364205 - HOIST
      ?auto_1364201 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1364203 ?auto_1364206 ) ( SURFACE-AT ?auto_1364199 ?auto_1364206 ) ( CLEAR ?auto_1364199 ) ( IS-CRATE ?auto_1364200 ) ( not ( = ?auto_1364199 ?auto_1364200 ) ) ( AVAILABLE ?auto_1364203 ) ( ON ?auto_1364199 ?auto_1364198 ) ( not ( = ?auto_1364198 ?auto_1364199 ) ) ( not ( = ?auto_1364198 ?auto_1364200 ) ) ( TRUCK-AT ?auto_1364202 ?auto_1364204 ) ( not ( = ?auto_1364204 ?auto_1364206 ) ) ( HOIST-AT ?auto_1364205 ?auto_1364204 ) ( not ( = ?auto_1364203 ?auto_1364205 ) ) ( AVAILABLE ?auto_1364205 ) ( SURFACE-AT ?auto_1364200 ?auto_1364204 ) ( ON ?auto_1364200 ?auto_1364201 ) ( CLEAR ?auto_1364200 ) ( not ( = ?auto_1364199 ?auto_1364201 ) ) ( not ( = ?auto_1364200 ?auto_1364201 ) ) ( not ( = ?auto_1364198 ?auto_1364201 ) ) ( ON ?auto_1364191 ?auto_1364190 ) ( ON ?auto_1364192 ?auto_1364191 ) ( ON ?auto_1364193 ?auto_1364192 ) ( ON ?auto_1364194 ?auto_1364193 ) ( ON ?auto_1364195 ?auto_1364194 ) ( ON ?auto_1364196 ?auto_1364195 ) ( ON ?auto_1364197 ?auto_1364196 ) ( ON ?auto_1364198 ?auto_1364197 ) ( not ( = ?auto_1364190 ?auto_1364191 ) ) ( not ( = ?auto_1364190 ?auto_1364192 ) ) ( not ( = ?auto_1364190 ?auto_1364193 ) ) ( not ( = ?auto_1364190 ?auto_1364194 ) ) ( not ( = ?auto_1364190 ?auto_1364195 ) ) ( not ( = ?auto_1364190 ?auto_1364196 ) ) ( not ( = ?auto_1364190 ?auto_1364197 ) ) ( not ( = ?auto_1364190 ?auto_1364198 ) ) ( not ( = ?auto_1364190 ?auto_1364199 ) ) ( not ( = ?auto_1364190 ?auto_1364200 ) ) ( not ( = ?auto_1364190 ?auto_1364201 ) ) ( not ( = ?auto_1364191 ?auto_1364192 ) ) ( not ( = ?auto_1364191 ?auto_1364193 ) ) ( not ( = ?auto_1364191 ?auto_1364194 ) ) ( not ( = ?auto_1364191 ?auto_1364195 ) ) ( not ( = ?auto_1364191 ?auto_1364196 ) ) ( not ( = ?auto_1364191 ?auto_1364197 ) ) ( not ( = ?auto_1364191 ?auto_1364198 ) ) ( not ( = ?auto_1364191 ?auto_1364199 ) ) ( not ( = ?auto_1364191 ?auto_1364200 ) ) ( not ( = ?auto_1364191 ?auto_1364201 ) ) ( not ( = ?auto_1364192 ?auto_1364193 ) ) ( not ( = ?auto_1364192 ?auto_1364194 ) ) ( not ( = ?auto_1364192 ?auto_1364195 ) ) ( not ( = ?auto_1364192 ?auto_1364196 ) ) ( not ( = ?auto_1364192 ?auto_1364197 ) ) ( not ( = ?auto_1364192 ?auto_1364198 ) ) ( not ( = ?auto_1364192 ?auto_1364199 ) ) ( not ( = ?auto_1364192 ?auto_1364200 ) ) ( not ( = ?auto_1364192 ?auto_1364201 ) ) ( not ( = ?auto_1364193 ?auto_1364194 ) ) ( not ( = ?auto_1364193 ?auto_1364195 ) ) ( not ( = ?auto_1364193 ?auto_1364196 ) ) ( not ( = ?auto_1364193 ?auto_1364197 ) ) ( not ( = ?auto_1364193 ?auto_1364198 ) ) ( not ( = ?auto_1364193 ?auto_1364199 ) ) ( not ( = ?auto_1364193 ?auto_1364200 ) ) ( not ( = ?auto_1364193 ?auto_1364201 ) ) ( not ( = ?auto_1364194 ?auto_1364195 ) ) ( not ( = ?auto_1364194 ?auto_1364196 ) ) ( not ( = ?auto_1364194 ?auto_1364197 ) ) ( not ( = ?auto_1364194 ?auto_1364198 ) ) ( not ( = ?auto_1364194 ?auto_1364199 ) ) ( not ( = ?auto_1364194 ?auto_1364200 ) ) ( not ( = ?auto_1364194 ?auto_1364201 ) ) ( not ( = ?auto_1364195 ?auto_1364196 ) ) ( not ( = ?auto_1364195 ?auto_1364197 ) ) ( not ( = ?auto_1364195 ?auto_1364198 ) ) ( not ( = ?auto_1364195 ?auto_1364199 ) ) ( not ( = ?auto_1364195 ?auto_1364200 ) ) ( not ( = ?auto_1364195 ?auto_1364201 ) ) ( not ( = ?auto_1364196 ?auto_1364197 ) ) ( not ( = ?auto_1364196 ?auto_1364198 ) ) ( not ( = ?auto_1364196 ?auto_1364199 ) ) ( not ( = ?auto_1364196 ?auto_1364200 ) ) ( not ( = ?auto_1364196 ?auto_1364201 ) ) ( not ( = ?auto_1364197 ?auto_1364198 ) ) ( not ( = ?auto_1364197 ?auto_1364199 ) ) ( not ( = ?auto_1364197 ?auto_1364200 ) ) ( not ( = ?auto_1364197 ?auto_1364201 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1364198 ?auto_1364199 ?auto_1364200 )
      ( MAKE-10CRATE-VERIFY ?auto_1364190 ?auto_1364191 ?auto_1364192 ?auto_1364193 ?auto_1364194 ?auto_1364195 ?auto_1364196 ?auto_1364197 ?auto_1364198 ?auto_1364199 ?auto_1364200 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1364316 - SURFACE
      ?auto_1364317 - SURFACE
      ?auto_1364318 - SURFACE
      ?auto_1364319 - SURFACE
      ?auto_1364320 - SURFACE
      ?auto_1364321 - SURFACE
      ?auto_1364322 - SURFACE
      ?auto_1364323 - SURFACE
      ?auto_1364324 - SURFACE
      ?auto_1364325 - SURFACE
      ?auto_1364326 - SURFACE
    )
    :vars
    (
      ?auto_1364331 - HOIST
      ?auto_1364330 - PLACE
      ?auto_1364327 - PLACE
      ?auto_1364328 - HOIST
      ?auto_1364332 - SURFACE
      ?auto_1364329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1364331 ?auto_1364330 ) ( SURFACE-AT ?auto_1364325 ?auto_1364330 ) ( CLEAR ?auto_1364325 ) ( IS-CRATE ?auto_1364326 ) ( not ( = ?auto_1364325 ?auto_1364326 ) ) ( AVAILABLE ?auto_1364331 ) ( ON ?auto_1364325 ?auto_1364324 ) ( not ( = ?auto_1364324 ?auto_1364325 ) ) ( not ( = ?auto_1364324 ?auto_1364326 ) ) ( not ( = ?auto_1364327 ?auto_1364330 ) ) ( HOIST-AT ?auto_1364328 ?auto_1364327 ) ( not ( = ?auto_1364331 ?auto_1364328 ) ) ( AVAILABLE ?auto_1364328 ) ( SURFACE-AT ?auto_1364326 ?auto_1364327 ) ( ON ?auto_1364326 ?auto_1364332 ) ( CLEAR ?auto_1364326 ) ( not ( = ?auto_1364325 ?auto_1364332 ) ) ( not ( = ?auto_1364326 ?auto_1364332 ) ) ( not ( = ?auto_1364324 ?auto_1364332 ) ) ( TRUCK-AT ?auto_1364329 ?auto_1364330 ) ( ON ?auto_1364317 ?auto_1364316 ) ( ON ?auto_1364318 ?auto_1364317 ) ( ON ?auto_1364319 ?auto_1364318 ) ( ON ?auto_1364320 ?auto_1364319 ) ( ON ?auto_1364321 ?auto_1364320 ) ( ON ?auto_1364322 ?auto_1364321 ) ( ON ?auto_1364323 ?auto_1364322 ) ( ON ?auto_1364324 ?auto_1364323 ) ( not ( = ?auto_1364316 ?auto_1364317 ) ) ( not ( = ?auto_1364316 ?auto_1364318 ) ) ( not ( = ?auto_1364316 ?auto_1364319 ) ) ( not ( = ?auto_1364316 ?auto_1364320 ) ) ( not ( = ?auto_1364316 ?auto_1364321 ) ) ( not ( = ?auto_1364316 ?auto_1364322 ) ) ( not ( = ?auto_1364316 ?auto_1364323 ) ) ( not ( = ?auto_1364316 ?auto_1364324 ) ) ( not ( = ?auto_1364316 ?auto_1364325 ) ) ( not ( = ?auto_1364316 ?auto_1364326 ) ) ( not ( = ?auto_1364316 ?auto_1364332 ) ) ( not ( = ?auto_1364317 ?auto_1364318 ) ) ( not ( = ?auto_1364317 ?auto_1364319 ) ) ( not ( = ?auto_1364317 ?auto_1364320 ) ) ( not ( = ?auto_1364317 ?auto_1364321 ) ) ( not ( = ?auto_1364317 ?auto_1364322 ) ) ( not ( = ?auto_1364317 ?auto_1364323 ) ) ( not ( = ?auto_1364317 ?auto_1364324 ) ) ( not ( = ?auto_1364317 ?auto_1364325 ) ) ( not ( = ?auto_1364317 ?auto_1364326 ) ) ( not ( = ?auto_1364317 ?auto_1364332 ) ) ( not ( = ?auto_1364318 ?auto_1364319 ) ) ( not ( = ?auto_1364318 ?auto_1364320 ) ) ( not ( = ?auto_1364318 ?auto_1364321 ) ) ( not ( = ?auto_1364318 ?auto_1364322 ) ) ( not ( = ?auto_1364318 ?auto_1364323 ) ) ( not ( = ?auto_1364318 ?auto_1364324 ) ) ( not ( = ?auto_1364318 ?auto_1364325 ) ) ( not ( = ?auto_1364318 ?auto_1364326 ) ) ( not ( = ?auto_1364318 ?auto_1364332 ) ) ( not ( = ?auto_1364319 ?auto_1364320 ) ) ( not ( = ?auto_1364319 ?auto_1364321 ) ) ( not ( = ?auto_1364319 ?auto_1364322 ) ) ( not ( = ?auto_1364319 ?auto_1364323 ) ) ( not ( = ?auto_1364319 ?auto_1364324 ) ) ( not ( = ?auto_1364319 ?auto_1364325 ) ) ( not ( = ?auto_1364319 ?auto_1364326 ) ) ( not ( = ?auto_1364319 ?auto_1364332 ) ) ( not ( = ?auto_1364320 ?auto_1364321 ) ) ( not ( = ?auto_1364320 ?auto_1364322 ) ) ( not ( = ?auto_1364320 ?auto_1364323 ) ) ( not ( = ?auto_1364320 ?auto_1364324 ) ) ( not ( = ?auto_1364320 ?auto_1364325 ) ) ( not ( = ?auto_1364320 ?auto_1364326 ) ) ( not ( = ?auto_1364320 ?auto_1364332 ) ) ( not ( = ?auto_1364321 ?auto_1364322 ) ) ( not ( = ?auto_1364321 ?auto_1364323 ) ) ( not ( = ?auto_1364321 ?auto_1364324 ) ) ( not ( = ?auto_1364321 ?auto_1364325 ) ) ( not ( = ?auto_1364321 ?auto_1364326 ) ) ( not ( = ?auto_1364321 ?auto_1364332 ) ) ( not ( = ?auto_1364322 ?auto_1364323 ) ) ( not ( = ?auto_1364322 ?auto_1364324 ) ) ( not ( = ?auto_1364322 ?auto_1364325 ) ) ( not ( = ?auto_1364322 ?auto_1364326 ) ) ( not ( = ?auto_1364322 ?auto_1364332 ) ) ( not ( = ?auto_1364323 ?auto_1364324 ) ) ( not ( = ?auto_1364323 ?auto_1364325 ) ) ( not ( = ?auto_1364323 ?auto_1364326 ) ) ( not ( = ?auto_1364323 ?auto_1364332 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1364324 ?auto_1364325 ?auto_1364326 )
      ( MAKE-10CRATE-VERIFY ?auto_1364316 ?auto_1364317 ?auto_1364318 ?auto_1364319 ?auto_1364320 ?auto_1364321 ?auto_1364322 ?auto_1364323 ?auto_1364324 ?auto_1364325 ?auto_1364326 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1364442 - SURFACE
      ?auto_1364443 - SURFACE
      ?auto_1364444 - SURFACE
      ?auto_1364445 - SURFACE
      ?auto_1364446 - SURFACE
      ?auto_1364447 - SURFACE
      ?auto_1364448 - SURFACE
      ?auto_1364449 - SURFACE
      ?auto_1364450 - SURFACE
      ?auto_1364451 - SURFACE
      ?auto_1364452 - SURFACE
    )
    :vars
    (
      ?auto_1364454 - HOIST
      ?auto_1364453 - PLACE
      ?auto_1364458 - PLACE
      ?auto_1364457 - HOIST
      ?auto_1364456 - SURFACE
      ?auto_1364455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1364454 ?auto_1364453 ) ( IS-CRATE ?auto_1364452 ) ( not ( = ?auto_1364451 ?auto_1364452 ) ) ( not ( = ?auto_1364450 ?auto_1364451 ) ) ( not ( = ?auto_1364450 ?auto_1364452 ) ) ( not ( = ?auto_1364458 ?auto_1364453 ) ) ( HOIST-AT ?auto_1364457 ?auto_1364458 ) ( not ( = ?auto_1364454 ?auto_1364457 ) ) ( AVAILABLE ?auto_1364457 ) ( SURFACE-AT ?auto_1364452 ?auto_1364458 ) ( ON ?auto_1364452 ?auto_1364456 ) ( CLEAR ?auto_1364452 ) ( not ( = ?auto_1364451 ?auto_1364456 ) ) ( not ( = ?auto_1364452 ?auto_1364456 ) ) ( not ( = ?auto_1364450 ?auto_1364456 ) ) ( TRUCK-AT ?auto_1364455 ?auto_1364453 ) ( SURFACE-AT ?auto_1364450 ?auto_1364453 ) ( CLEAR ?auto_1364450 ) ( LIFTING ?auto_1364454 ?auto_1364451 ) ( IS-CRATE ?auto_1364451 ) ( ON ?auto_1364443 ?auto_1364442 ) ( ON ?auto_1364444 ?auto_1364443 ) ( ON ?auto_1364445 ?auto_1364444 ) ( ON ?auto_1364446 ?auto_1364445 ) ( ON ?auto_1364447 ?auto_1364446 ) ( ON ?auto_1364448 ?auto_1364447 ) ( ON ?auto_1364449 ?auto_1364448 ) ( ON ?auto_1364450 ?auto_1364449 ) ( not ( = ?auto_1364442 ?auto_1364443 ) ) ( not ( = ?auto_1364442 ?auto_1364444 ) ) ( not ( = ?auto_1364442 ?auto_1364445 ) ) ( not ( = ?auto_1364442 ?auto_1364446 ) ) ( not ( = ?auto_1364442 ?auto_1364447 ) ) ( not ( = ?auto_1364442 ?auto_1364448 ) ) ( not ( = ?auto_1364442 ?auto_1364449 ) ) ( not ( = ?auto_1364442 ?auto_1364450 ) ) ( not ( = ?auto_1364442 ?auto_1364451 ) ) ( not ( = ?auto_1364442 ?auto_1364452 ) ) ( not ( = ?auto_1364442 ?auto_1364456 ) ) ( not ( = ?auto_1364443 ?auto_1364444 ) ) ( not ( = ?auto_1364443 ?auto_1364445 ) ) ( not ( = ?auto_1364443 ?auto_1364446 ) ) ( not ( = ?auto_1364443 ?auto_1364447 ) ) ( not ( = ?auto_1364443 ?auto_1364448 ) ) ( not ( = ?auto_1364443 ?auto_1364449 ) ) ( not ( = ?auto_1364443 ?auto_1364450 ) ) ( not ( = ?auto_1364443 ?auto_1364451 ) ) ( not ( = ?auto_1364443 ?auto_1364452 ) ) ( not ( = ?auto_1364443 ?auto_1364456 ) ) ( not ( = ?auto_1364444 ?auto_1364445 ) ) ( not ( = ?auto_1364444 ?auto_1364446 ) ) ( not ( = ?auto_1364444 ?auto_1364447 ) ) ( not ( = ?auto_1364444 ?auto_1364448 ) ) ( not ( = ?auto_1364444 ?auto_1364449 ) ) ( not ( = ?auto_1364444 ?auto_1364450 ) ) ( not ( = ?auto_1364444 ?auto_1364451 ) ) ( not ( = ?auto_1364444 ?auto_1364452 ) ) ( not ( = ?auto_1364444 ?auto_1364456 ) ) ( not ( = ?auto_1364445 ?auto_1364446 ) ) ( not ( = ?auto_1364445 ?auto_1364447 ) ) ( not ( = ?auto_1364445 ?auto_1364448 ) ) ( not ( = ?auto_1364445 ?auto_1364449 ) ) ( not ( = ?auto_1364445 ?auto_1364450 ) ) ( not ( = ?auto_1364445 ?auto_1364451 ) ) ( not ( = ?auto_1364445 ?auto_1364452 ) ) ( not ( = ?auto_1364445 ?auto_1364456 ) ) ( not ( = ?auto_1364446 ?auto_1364447 ) ) ( not ( = ?auto_1364446 ?auto_1364448 ) ) ( not ( = ?auto_1364446 ?auto_1364449 ) ) ( not ( = ?auto_1364446 ?auto_1364450 ) ) ( not ( = ?auto_1364446 ?auto_1364451 ) ) ( not ( = ?auto_1364446 ?auto_1364452 ) ) ( not ( = ?auto_1364446 ?auto_1364456 ) ) ( not ( = ?auto_1364447 ?auto_1364448 ) ) ( not ( = ?auto_1364447 ?auto_1364449 ) ) ( not ( = ?auto_1364447 ?auto_1364450 ) ) ( not ( = ?auto_1364447 ?auto_1364451 ) ) ( not ( = ?auto_1364447 ?auto_1364452 ) ) ( not ( = ?auto_1364447 ?auto_1364456 ) ) ( not ( = ?auto_1364448 ?auto_1364449 ) ) ( not ( = ?auto_1364448 ?auto_1364450 ) ) ( not ( = ?auto_1364448 ?auto_1364451 ) ) ( not ( = ?auto_1364448 ?auto_1364452 ) ) ( not ( = ?auto_1364448 ?auto_1364456 ) ) ( not ( = ?auto_1364449 ?auto_1364450 ) ) ( not ( = ?auto_1364449 ?auto_1364451 ) ) ( not ( = ?auto_1364449 ?auto_1364452 ) ) ( not ( = ?auto_1364449 ?auto_1364456 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1364450 ?auto_1364451 ?auto_1364452 )
      ( MAKE-10CRATE-VERIFY ?auto_1364442 ?auto_1364443 ?auto_1364444 ?auto_1364445 ?auto_1364446 ?auto_1364447 ?auto_1364448 ?auto_1364449 ?auto_1364450 ?auto_1364451 ?auto_1364452 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1364568 - SURFACE
      ?auto_1364569 - SURFACE
      ?auto_1364570 - SURFACE
      ?auto_1364571 - SURFACE
      ?auto_1364572 - SURFACE
      ?auto_1364573 - SURFACE
      ?auto_1364574 - SURFACE
      ?auto_1364575 - SURFACE
      ?auto_1364576 - SURFACE
      ?auto_1364577 - SURFACE
      ?auto_1364578 - SURFACE
    )
    :vars
    (
      ?auto_1364583 - HOIST
      ?auto_1364579 - PLACE
      ?auto_1364580 - PLACE
      ?auto_1364584 - HOIST
      ?auto_1364582 - SURFACE
      ?auto_1364581 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1364583 ?auto_1364579 ) ( IS-CRATE ?auto_1364578 ) ( not ( = ?auto_1364577 ?auto_1364578 ) ) ( not ( = ?auto_1364576 ?auto_1364577 ) ) ( not ( = ?auto_1364576 ?auto_1364578 ) ) ( not ( = ?auto_1364580 ?auto_1364579 ) ) ( HOIST-AT ?auto_1364584 ?auto_1364580 ) ( not ( = ?auto_1364583 ?auto_1364584 ) ) ( AVAILABLE ?auto_1364584 ) ( SURFACE-AT ?auto_1364578 ?auto_1364580 ) ( ON ?auto_1364578 ?auto_1364582 ) ( CLEAR ?auto_1364578 ) ( not ( = ?auto_1364577 ?auto_1364582 ) ) ( not ( = ?auto_1364578 ?auto_1364582 ) ) ( not ( = ?auto_1364576 ?auto_1364582 ) ) ( TRUCK-AT ?auto_1364581 ?auto_1364579 ) ( SURFACE-AT ?auto_1364576 ?auto_1364579 ) ( CLEAR ?auto_1364576 ) ( IS-CRATE ?auto_1364577 ) ( AVAILABLE ?auto_1364583 ) ( IN ?auto_1364577 ?auto_1364581 ) ( ON ?auto_1364569 ?auto_1364568 ) ( ON ?auto_1364570 ?auto_1364569 ) ( ON ?auto_1364571 ?auto_1364570 ) ( ON ?auto_1364572 ?auto_1364571 ) ( ON ?auto_1364573 ?auto_1364572 ) ( ON ?auto_1364574 ?auto_1364573 ) ( ON ?auto_1364575 ?auto_1364574 ) ( ON ?auto_1364576 ?auto_1364575 ) ( not ( = ?auto_1364568 ?auto_1364569 ) ) ( not ( = ?auto_1364568 ?auto_1364570 ) ) ( not ( = ?auto_1364568 ?auto_1364571 ) ) ( not ( = ?auto_1364568 ?auto_1364572 ) ) ( not ( = ?auto_1364568 ?auto_1364573 ) ) ( not ( = ?auto_1364568 ?auto_1364574 ) ) ( not ( = ?auto_1364568 ?auto_1364575 ) ) ( not ( = ?auto_1364568 ?auto_1364576 ) ) ( not ( = ?auto_1364568 ?auto_1364577 ) ) ( not ( = ?auto_1364568 ?auto_1364578 ) ) ( not ( = ?auto_1364568 ?auto_1364582 ) ) ( not ( = ?auto_1364569 ?auto_1364570 ) ) ( not ( = ?auto_1364569 ?auto_1364571 ) ) ( not ( = ?auto_1364569 ?auto_1364572 ) ) ( not ( = ?auto_1364569 ?auto_1364573 ) ) ( not ( = ?auto_1364569 ?auto_1364574 ) ) ( not ( = ?auto_1364569 ?auto_1364575 ) ) ( not ( = ?auto_1364569 ?auto_1364576 ) ) ( not ( = ?auto_1364569 ?auto_1364577 ) ) ( not ( = ?auto_1364569 ?auto_1364578 ) ) ( not ( = ?auto_1364569 ?auto_1364582 ) ) ( not ( = ?auto_1364570 ?auto_1364571 ) ) ( not ( = ?auto_1364570 ?auto_1364572 ) ) ( not ( = ?auto_1364570 ?auto_1364573 ) ) ( not ( = ?auto_1364570 ?auto_1364574 ) ) ( not ( = ?auto_1364570 ?auto_1364575 ) ) ( not ( = ?auto_1364570 ?auto_1364576 ) ) ( not ( = ?auto_1364570 ?auto_1364577 ) ) ( not ( = ?auto_1364570 ?auto_1364578 ) ) ( not ( = ?auto_1364570 ?auto_1364582 ) ) ( not ( = ?auto_1364571 ?auto_1364572 ) ) ( not ( = ?auto_1364571 ?auto_1364573 ) ) ( not ( = ?auto_1364571 ?auto_1364574 ) ) ( not ( = ?auto_1364571 ?auto_1364575 ) ) ( not ( = ?auto_1364571 ?auto_1364576 ) ) ( not ( = ?auto_1364571 ?auto_1364577 ) ) ( not ( = ?auto_1364571 ?auto_1364578 ) ) ( not ( = ?auto_1364571 ?auto_1364582 ) ) ( not ( = ?auto_1364572 ?auto_1364573 ) ) ( not ( = ?auto_1364572 ?auto_1364574 ) ) ( not ( = ?auto_1364572 ?auto_1364575 ) ) ( not ( = ?auto_1364572 ?auto_1364576 ) ) ( not ( = ?auto_1364572 ?auto_1364577 ) ) ( not ( = ?auto_1364572 ?auto_1364578 ) ) ( not ( = ?auto_1364572 ?auto_1364582 ) ) ( not ( = ?auto_1364573 ?auto_1364574 ) ) ( not ( = ?auto_1364573 ?auto_1364575 ) ) ( not ( = ?auto_1364573 ?auto_1364576 ) ) ( not ( = ?auto_1364573 ?auto_1364577 ) ) ( not ( = ?auto_1364573 ?auto_1364578 ) ) ( not ( = ?auto_1364573 ?auto_1364582 ) ) ( not ( = ?auto_1364574 ?auto_1364575 ) ) ( not ( = ?auto_1364574 ?auto_1364576 ) ) ( not ( = ?auto_1364574 ?auto_1364577 ) ) ( not ( = ?auto_1364574 ?auto_1364578 ) ) ( not ( = ?auto_1364574 ?auto_1364582 ) ) ( not ( = ?auto_1364575 ?auto_1364576 ) ) ( not ( = ?auto_1364575 ?auto_1364577 ) ) ( not ( = ?auto_1364575 ?auto_1364578 ) ) ( not ( = ?auto_1364575 ?auto_1364582 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1364576 ?auto_1364577 ?auto_1364578 )
      ( MAKE-10CRATE-VERIFY ?auto_1364568 ?auto_1364569 ?auto_1364570 ?auto_1364571 ?auto_1364572 ?auto_1364573 ?auto_1364574 ?auto_1364575 ?auto_1364576 ?auto_1364577 ?auto_1364578 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1371811 - SURFACE
      ?auto_1371812 - SURFACE
      ?auto_1371813 - SURFACE
      ?auto_1371814 - SURFACE
      ?auto_1371815 - SURFACE
      ?auto_1371816 - SURFACE
      ?auto_1371817 - SURFACE
      ?auto_1371818 - SURFACE
      ?auto_1371819 - SURFACE
      ?auto_1371820 - SURFACE
      ?auto_1371821 - SURFACE
      ?auto_1371822 - SURFACE
    )
    :vars
    (
      ?auto_1371824 - HOIST
      ?auto_1371823 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1371824 ?auto_1371823 ) ( SURFACE-AT ?auto_1371821 ?auto_1371823 ) ( CLEAR ?auto_1371821 ) ( LIFTING ?auto_1371824 ?auto_1371822 ) ( IS-CRATE ?auto_1371822 ) ( not ( = ?auto_1371821 ?auto_1371822 ) ) ( ON ?auto_1371812 ?auto_1371811 ) ( ON ?auto_1371813 ?auto_1371812 ) ( ON ?auto_1371814 ?auto_1371813 ) ( ON ?auto_1371815 ?auto_1371814 ) ( ON ?auto_1371816 ?auto_1371815 ) ( ON ?auto_1371817 ?auto_1371816 ) ( ON ?auto_1371818 ?auto_1371817 ) ( ON ?auto_1371819 ?auto_1371818 ) ( ON ?auto_1371820 ?auto_1371819 ) ( ON ?auto_1371821 ?auto_1371820 ) ( not ( = ?auto_1371811 ?auto_1371812 ) ) ( not ( = ?auto_1371811 ?auto_1371813 ) ) ( not ( = ?auto_1371811 ?auto_1371814 ) ) ( not ( = ?auto_1371811 ?auto_1371815 ) ) ( not ( = ?auto_1371811 ?auto_1371816 ) ) ( not ( = ?auto_1371811 ?auto_1371817 ) ) ( not ( = ?auto_1371811 ?auto_1371818 ) ) ( not ( = ?auto_1371811 ?auto_1371819 ) ) ( not ( = ?auto_1371811 ?auto_1371820 ) ) ( not ( = ?auto_1371811 ?auto_1371821 ) ) ( not ( = ?auto_1371811 ?auto_1371822 ) ) ( not ( = ?auto_1371812 ?auto_1371813 ) ) ( not ( = ?auto_1371812 ?auto_1371814 ) ) ( not ( = ?auto_1371812 ?auto_1371815 ) ) ( not ( = ?auto_1371812 ?auto_1371816 ) ) ( not ( = ?auto_1371812 ?auto_1371817 ) ) ( not ( = ?auto_1371812 ?auto_1371818 ) ) ( not ( = ?auto_1371812 ?auto_1371819 ) ) ( not ( = ?auto_1371812 ?auto_1371820 ) ) ( not ( = ?auto_1371812 ?auto_1371821 ) ) ( not ( = ?auto_1371812 ?auto_1371822 ) ) ( not ( = ?auto_1371813 ?auto_1371814 ) ) ( not ( = ?auto_1371813 ?auto_1371815 ) ) ( not ( = ?auto_1371813 ?auto_1371816 ) ) ( not ( = ?auto_1371813 ?auto_1371817 ) ) ( not ( = ?auto_1371813 ?auto_1371818 ) ) ( not ( = ?auto_1371813 ?auto_1371819 ) ) ( not ( = ?auto_1371813 ?auto_1371820 ) ) ( not ( = ?auto_1371813 ?auto_1371821 ) ) ( not ( = ?auto_1371813 ?auto_1371822 ) ) ( not ( = ?auto_1371814 ?auto_1371815 ) ) ( not ( = ?auto_1371814 ?auto_1371816 ) ) ( not ( = ?auto_1371814 ?auto_1371817 ) ) ( not ( = ?auto_1371814 ?auto_1371818 ) ) ( not ( = ?auto_1371814 ?auto_1371819 ) ) ( not ( = ?auto_1371814 ?auto_1371820 ) ) ( not ( = ?auto_1371814 ?auto_1371821 ) ) ( not ( = ?auto_1371814 ?auto_1371822 ) ) ( not ( = ?auto_1371815 ?auto_1371816 ) ) ( not ( = ?auto_1371815 ?auto_1371817 ) ) ( not ( = ?auto_1371815 ?auto_1371818 ) ) ( not ( = ?auto_1371815 ?auto_1371819 ) ) ( not ( = ?auto_1371815 ?auto_1371820 ) ) ( not ( = ?auto_1371815 ?auto_1371821 ) ) ( not ( = ?auto_1371815 ?auto_1371822 ) ) ( not ( = ?auto_1371816 ?auto_1371817 ) ) ( not ( = ?auto_1371816 ?auto_1371818 ) ) ( not ( = ?auto_1371816 ?auto_1371819 ) ) ( not ( = ?auto_1371816 ?auto_1371820 ) ) ( not ( = ?auto_1371816 ?auto_1371821 ) ) ( not ( = ?auto_1371816 ?auto_1371822 ) ) ( not ( = ?auto_1371817 ?auto_1371818 ) ) ( not ( = ?auto_1371817 ?auto_1371819 ) ) ( not ( = ?auto_1371817 ?auto_1371820 ) ) ( not ( = ?auto_1371817 ?auto_1371821 ) ) ( not ( = ?auto_1371817 ?auto_1371822 ) ) ( not ( = ?auto_1371818 ?auto_1371819 ) ) ( not ( = ?auto_1371818 ?auto_1371820 ) ) ( not ( = ?auto_1371818 ?auto_1371821 ) ) ( not ( = ?auto_1371818 ?auto_1371822 ) ) ( not ( = ?auto_1371819 ?auto_1371820 ) ) ( not ( = ?auto_1371819 ?auto_1371821 ) ) ( not ( = ?auto_1371819 ?auto_1371822 ) ) ( not ( = ?auto_1371820 ?auto_1371821 ) ) ( not ( = ?auto_1371820 ?auto_1371822 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1371821 ?auto_1371822 )
      ( MAKE-11CRATE-VERIFY ?auto_1371811 ?auto_1371812 ?auto_1371813 ?auto_1371814 ?auto_1371815 ?auto_1371816 ?auto_1371817 ?auto_1371818 ?auto_1371819 ?auto_1371820 ?auto_1371821 ?auto_1371822 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1371920 - SURFACE
      ?auto_1371921 - SURFACE
      ?auto_1371922 - SURFACE
      ?auto_1371923 - SURFACE
      ?auto_1371924 - SURFACE
      ?auto_1371925 - SURFACE
      ?auto_1371926 - SURFACE
      ?auto_1371927 - SURFACE
      ?auto_1371928 - SURFACE
      ?auto_1371929 - SURFACE
      ?auto_1371930 - SURFACE
      ?auto_1371931 - SURFACE
    )
    :vars
    (
      ?auto_1371933 - HOIST
      ?auto_1371932 - PLACE
      ?auto_1371934 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1371933 ?auto_1371932 ) ( SURFACE-AT ?auto_1371930 ?auto_1371932 ) ( CLEAR ?auto_1371930 ) ( IS-CRATE ?auto_1371931 ) ( not ( = ?auto_1371930 ?auto_1371931 ) ) ( TRUCK-AT ?auto_1371934 ?auto_1371932 ) ( AVAILABLE ?auto_1371933 ) ( IN ?auto_1371931 ?auto_1371934 ) ( ON ?auto_1371930 ?auto_1371929 ) ( not ( = ?auto_1371929 ?auto_1371930 ) ) ( not ( = ?auto_1371929 ?auto_1371931 ) ) ( ON ?auto_1371921 ?auto_1371920 ) ( ON ?auto_1371922 ?auto_1371921 ) ( ON ?auto_1371923 ?auto_1371922 ) ( ON ?auto_1371924 ?auto_1371923 ) ( ON ?auto_1371925 ?auto_1371924 ) ( ON ?auto_1371926 ?auto_1371925 ) ( ON ?auto_1371927 ?auto_1371926 ) ( ON ?auto_1371928 ?auto_1371927 ) ( ON ?auto_1371929 ?auto_1371928 ) ( not ( = ?auto_1371920 ?auto_1371921 ) ) ( not ( = ?auto_1371920 ?auto_1371922 ) ) ( not ( = ?auto_1371920 ?auto_1371923 ) ) ( not ( = ?auto_1371920 ?auto_1371924 ) ) ( not ( = ?auto_1371920 ?auto_1371925 ) ) ( not ( = ?auto_1371920 ?auto_1371926 ) ) ( not ( = ?auto_1371920 ?auto_1371927 ) ) ( not ( = ?auto_1371920 ?auto_1371928 ) ) ( not ( = ?auto_1371920 ?auto_1371929 ) ) ( not ( = ?auto_1371920 ?auto_1371930 ) ) ( not ( = ?auto_1371920 ?auto_1371931 ) ) ( not ( = ?auto_1371921 ?auto_1371922 ) ) ( not ( = ?auto_1371921 ?auto_1371923 ) ) ( not ( = ?auto_1371921 ?auto_1371924 ) ) ( not ( = ?auto_1371921 ?auto_1371925 ) ) ( not ( = ?auto_1371921 ?auto_1371926 ) ) ( not ( = ?auto_1371921 ?auto_1371927 ) ) ( not ( = ?auto_1371921 ?auto_1371928 ) ) ( not ( = ?auto_1371921 ?auto_1371929 ) ) ( not ( = ?auto_1371921 ?auto_1371930 ) ) ( not ( = ?auto_1371921 ?auto_1371931 ) ) ( not ( = ?auto_1371922 ?auto_1371923 ) ) ( not ( = ?auto_1371922 ?auto_1371924 ) ) ( not ( = ?auto_1371922 ?auto_1371925 ) ) ( not ( = ?auto_1371922 ?auto_1371926 ) ) ( not ( = ?auto_1371922 ?auto_1371927 ) ) ( not ( = ?auto_1371922 ?auto_1371928 ) ) ( not ( = ?auto_1371922 ?auto_1371929 ) ) ( not ( = ?auto_1371922 ?auto_1371930 ) ) ( not ( = ?auto_1371922 ?auto_1371931 ) ) ( not ( = ?auto_1371923 ?auto_1371924 ) ) ( not ( = ?auto_1371923 ?auto_1371925 ) ) ( not ( = ?auto_1371923 ?auto_1371926 ) ) ( not ( = ?auto_1371923 ?auto_1371927 ) ) ( not ( = ?auto_1371923 ?auto_1371928 ) ) ( not ( = ?auto_1371923 ?auto_1371929 ) ) ( not ( = ?auto_1371923 ?auto_1371930 ) ) ( not ( = ?auto_1371923 ?auto_1371931 ) ) ( not ( = ?auto_1371924 ?auto_1371925 ) ) ( not ( = ?auto_1371924 ?auto_1371926 ) ) ( not ( = ?auto_1371924 ?auto_1371927 ) ) ( not ( = ?auto_1371924 ?auto_1371928 ) ) ( not ( = ?auto_1371924 ?auto_1371929 ) ) ( not ( = ?auto_1371924 ?auto_1371930 ) ) ( not ( = ?auto_1371924 ?auto_1371931 ) ) ( not ( = ?auto_1371925 ?auto_1371926 ) ) ( not ( = ?auto_1371925 ?auto_1371927 ) ) ( not ( = ?auto_1371925 ?auto_1371928 ) ) ( not ( = ?auto_1371925 ?auto_1371929 ) ) ( not ( = ?auto_1371925 ?auto_1371930 ) ) ( not ( = ?auto_1371925 ?auto_1371931 ) ) ( not ( = ?auto_1371926 ?auto_1371927 ) ) ( not ( = ?auto_1371926 ?auto_1371928 ) ) ( not ( = ?auto_1371926 ?auto_1371929 ) ) ( not ( = ?auto_1371926 ?auto_1371930 ) ) ( not ( = ?auto_1371926 ?auto_1371931 ) ) ( not ( = ?auto_1371927 ?auto_1371928 ) ) ( not ( = ?auto_1371927 ?auto_1371929 ) ) ( not ( = ?auto_1371927 ?auto_1371930 ) ) ( not ( = ?auto_1371927 ?auto_1371931 ) ) ( not ( = ?auto_1371928 ?auto_1371929 ) ) ( not ( = ?auto_1371928 ?auto_1371930 ) ) ( not ( = ?auto_1371928 ?auto_1371931 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1371929 ?auto_1371930 ?auto_1371931 )
      ( MAKE-11CRATE-VERIFY ?auto_1371920 ?auto_1371921 ?auto_1371922 ?auto_1371923 ?auto_1371924 ?auto_1371925 ?auto_1371926 ?auto_1371927 ?auto_1371928 ?auto_1371929 ?auto_1371930 ?auto_1371931 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1372041 - SURFACE
      ?auto_1372042 - SURFACE
      ?auto_1372043 - SURFACE
      ?auto_1372044 - SURFACE
      ?auto_1372045 - SURFACE
      ?auto_1372046 - SURFACE
      ?auto_1372047 - SURFACE
      ?auto_1372048 - SURFACE
      ?auto_1372049 - SURFACE
      ?auto_1372050 - SURFACE
      ?auto_1372051 - SURFACE
      ?auto_1372052 - SURFACE
    )
    :vars
    (
      ?auto_1372054 - HOIST
      ?auto_1372053 - PLACE
      ?auto_1372055 - TRUCK
      ?auto_1372056 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1372054 ?auto_1372053 ) ( SURFACE-AT ?auto_1372051 ?auto_1372053 ) ( CLEAR ?auto_1372051 ) ( IS-CRATE ?auto_1372052 ) ( not ( = ?auto_1372051 ?auto_1372052 ) ) ( AVAILABLE ?auto_1372054 ) ( IN ?auto_1372052 ?auto_1372055 ) ( ON ?auto_1372051 ?auto_1372050 ) ( not ( = ?auto_1372050 ?auto_1372051 ) ) ( not ( = ?auto_1372050 ?auto_1372052 ) ) ( TRUCK-AT ?auto_1372055 ?auto_1372056 ) ( not ( = ?auto_1372056 ?auto_1372053 ) ) ( ON ?auto_1372042 ?auto_1372041 ) ( ON ?auto_1372043 ?auto_1372042 ) ( ON ?auto_1372044 ?auto_1372043 ) ( ON ?auto_1372045 ?auto_1372044 ) ( ON ?auto_1372046 ?auto_1372045 ) ( ON ?auto_1372047 ?auto_1372046 ) ( ON ?auto_1372048 ?auto_1372047 ) ( ON ?auto_1372049 ?auto_1372048 ) ( ON ?auto_1372050 ?auto_1372049 ) ( not ( = ?auto_1372041 ?auto_1372042 ) ) ( not ( = ?auto_1372041 ?auto_1372043 ) ) ( not ( = ?auto_1372041 ?auto_1372044 ) ) ( not ( = ?auto_1372041 ?auto_1372045 ) ) ( not ( = ?auto_1372041 ?auto_1372046 ) ) ( not ( = ?auto_1372041 ?auto_1372047 ) ) ( not ( = ?auto_1372041 ?auto_1372048 ) ) ( not ( = ?auto_1372041 ?auto_1372049 ) ) ( not ( = ?auto_1372041 ?auto_1372050 ) ) ( not ( = ?auto_1372041 ?auto_1372051 ) ) ( not ( = ?auto_1372041 ?auto_1372052 ) ) ( not ( = ?auto_1372042 ?auto_1372043 ) ) ( not ( = ?auto_1372042 ?auto_1372044 ) ) ( not ( = ?auto_1372042 ?auto_1372045 ) ) ( not ( = ?auto_1372042 ?auto_1372046 ) ) ( not ( = ?auto_1372042 ?auto_1372047 ) ) ( not ( = ?auto_1372042 ?auto_1372048 ) ) ( not ( = ?auto_1372042 ?auto_1372049 ) ) ( not ( = ?auto_1372042 ?auto_1372050 ) ) ( not ( = ?auto_1372042 ?auto_1372051 ) ) ( not ( = ?auto_1372042 ?auto_1372052 ) ) ( not ( = ?auto_1372043 ?auto_1372044 ) ) ( not ( = ?auto_1372043 ?auto_1372045 ) ) ( not ( = ?auto_1372043 ?auto_1372046 ) ) ( not ( = ?auto_1372043 ?auto_1372047 ) ) ( not ( = ?auto_1372043 ?auto_1372048 ) ) ( not ( = ?auto_1372043 ?auto_1372049 ) ) ( not ( = ?auto_1372043 ?auto_1372050 ) ) ( not ( = ?auto_1372043 ?auto_1372051 ) ) ( not ( = ?auto_1372043 ?auto_1372052 ) ) ( not ( = ?auto_1372044 ?auto_1372045 ) ) ( not ( = ?auto_1372044 ?auto_1372046 ) ) ( not ( = ?auto_1372044 ?auto_1372047 ) ) ( not ( = ?auto_1372044 ?auto_1372048 ) ) ( not ( = ?auto_1372044 ?auto_1372049 ) ) ( not ( = ?auto_1372044 ?auto_1372050 ) ) ( not ( = ?auto_1372044 ?auto_1372051 ) ) ( not ( = ?auto_1372044 ?auto_1372052 ) ) ( not ( = ?auto_1372045 ?auto_1372046 ) ) ( not ( = ?auto_1372045 ?auto_1372047 ) ) ( not ( = ?auto_1372045 ?auto_1372048 ) ) ( not ( = ?auto_1372045 ?auto_1372049 ) ) ( not ( = ?auto_1372045 ?auto_1372050 ) ) ( not ( = ?auto_1372045 ?auto_1372051 ) ) ( not ( = ?auto_1372045 ?auto_1372052 ) ) ( not ( = ?auto_1372046 ?auto_1372047 ) ) ( not ( = ?auto_1372046 ?auto_1372048 ) ) ( not ( = ?auto_1372046 ?auto_1372049 ) ) ( not ( = ?auto_1372046 ?auto_1372050 ) ) ( not ( = ?auto_1372046 ?auto_1372051 ) ) ( not ( = ?auto_1372046 ?auto_1372052 ) ) ( not ( = ?auto_1372047 ?auto_1372048 ) ) ( not ( = ?auto_1372047 ?auto_1372049 ) ) ( not ( = ?auto_1372047 ?auto_1372050 ) ) ( not ( = ?auto_1372047 ?auto_1372051 ) ) ( not ( = ?auto_1372047 ?auto_1372052 ) ) ( not ( = ?auto_1372048 ?auto_1372049 ) ) ( not ( = ?auto_1372048 ?auto_1372050 ) ) ( not ( = ?auto_1372048 ?auto_1372051 ) ) ( not ( = ?auto_1372048 ?auto_1372052 ) ) ( not ( = ?auto_1372049 ?auto_1372050 ) ) ( not ( = ?auto_1372049 ?auto_1372051 ) ) ( not ( = ?auto_1372049 ?auto_1372052 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1372050 ?auto_1372051 ?auto_1372052 )
      ( MAKE-11CRATE-VERIFY ?auto_1372041 ?auto_1372042 ?auto_1372043 ?auto_1372044 ?auto_1372045 ?auto_1372046 ?auto_1372047 ?auto_1372048 ?auto_1372049 ?auto_1372050 ?auto_1372051 ?auto_1372052 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1372173 - SURFACE
      ?auto_1372174 - SURFACE
      ?auto_1372175 - SURFACE
      ?auto_1372176 - SURFACE
      ?auto_1372177 - SURFACE
      ?auto_1372178 - SURFACE
      ?auto_1372179 - SURFACE
      ?auto_1372180 - SURFACE
      ?auto_1372181 - SURFACE
      ?auto_1372182 - SURFACE
      ?auto_1372183 - SURFACE
      ?auto_1372184 - SURFACE
    )
    :vars
    (
      ?auto_1372187 - HOIST
      ?auto_1372185 - PLACE
      ?auto_1372189 - TRUCK
      ?auto_1372188 - PLACE
      ?auto_1372186 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1372187 ?auto_1372185 ) ( SURFACE-AT ?auto_1372183 ?auto_1372185 ) ( CLEAR ?auto_1372183 ) ( IS-CRATE ?auto_1372184 ) ( not ( = ?auto_1372183 ?auto_1372184 ) ) ( AVAILABLE ?auto_1372187 ) ( ON ?auto_1372183 ?auto_1372182 ) ( not ( = ?auto_1372182 ?auto_1372183 ) ) ( not ( = ?auto_1372182 ?auto_1372184 ) ) ( TRUCK-AT ?auto_1372189 ?auto_1372188 ) ( not ( = ?auto_1372188 ?auto_1372185 ) ) ( HOIST-AT ?auto_1372186 ?auto_1372188 ) ( LIFTING ?auto_1372186 ?auto_1372184 ) ( not ( = ?auto_1372187 ?auto_1372186 ) ) ( ON ?auto_1372174 ?auto_1372173 ) ( ON ?auto_1372175 ?auto_1372174 ) ( ON ?auto_1372176 ?auto_1372175 ) ( ON ?auto_1372177 ?auto_1372176 ) ( ON ?auto_1372178 ?auto_1372177 ) ( ON ?auto_1372179 ?auto_1372178 ) ( ON ?auto_1372180 ?auto_1372179 ) ( ON ?auto_1372181 ?auto_1372180 ) ( ON ?auto_1372182 ?auto_1372181 ) ( not ( = ?auto_1372173 ?auto_1372174 ) ) ( not ( = ?auto_1372173 ?auto_1372175 ) ) ( not ( = ?auto_1372173 ?auto_1372176 ) ) ( not ( = ?auto_1372173 ?auto_1372177 ) ) ( not ( = ?auto_1372173 ?auto_1372178 ) ) ( not ( = ?auto_1372173 ?auto_1372179 ) ) ( not ( = ?auto_1372173 ?auto_1372180 ) ) ( not ( = ?auto_1372173 ?auto_1372181 ) ) ( not ( = ?auto_1372173 ?auto_1372182 ) ) ( not ( = ?auto_1372173 ?auto_1372183 ) ) ( not ( = ?auto_1372173 ?auto_1372184 ) ) ( not ( = ?auto_1372174 ?auto_1372175 ) ) ( not ( = ?auto_1372174 ?auto_1372176 ) ) ( not ( = ?auto_1372174 ?auto_1372177 ) ) ( not ( = ?auto_1372174 ?auto_1372178 ) ) ( not ( = ?auto_1372174 ?auto_1372179 ) ) ( not ( = ?auto_1372174 ?auto_1372180 ) ) ( not ( = ?auto_1372174 ?auto_1372181 ) ) ( not ( = ?auto_1372174 ?auto_1372182 ) ) ( not ( = ?auto_1372174 ?auto_1372183 ) ) ( not ( = ?auto_1372174 ?auto_1372184 ) ) ( not ( = ?auto_1372175 ?auto_1372176 ) ) ( not ( = ?auto_1372175 ?auto_1372177 ) ) ( not ( = ?auto_1372175 ?auto_1372178 ) ) ( not ( = ?auto_1372175 ?auto_1372179 ) ) ( not ( = ?auto_1372175 ?auto_1372180 ) ) ( not ( = ?auto_1372175 ?auto_1372181 ) ) ( not ( = ?auto_1372175 ?auto_1372182 ) ) ( not ( = ?auto_1372175 ?auto_1372183 ) ) ( not ( = ?auto_1372175 ?auto_1372184 ) ) ( not ( = ?auto_1372176 ?auto_1372177 ) ) ( not ( = ?auto_1372176 ?auto_1372178 ) ) ( not ( = ?auto_1372176 ?auto_1372179 ) ) ( not ( = ?auto_1372176 ?auto_1372180 ) ) ( not ( = ?auto_1372176 ?auto_1372181 ) ) ( not ( = ?auto_1372176 ?auto_1372182 ) ) ( not ( = ?auto_1372176 ?auto_1372183 ) ) ( not ( = ?auto_1372176 ?auto_1372184 ) ) ( not ( = ?auto_1372177 ?auto_1372178 ) ) ( not ( = ?auto_1372177 ?auto_1372179 ) ) ( not ( = ?auto_1372177 ?auto_1372180 ) ) ( not ( = ?auto_1372177 ?auto_1372181 ) ) ( not ( = ?auto_1372177 ?auto_1372182 ) ) ( not ( = ?auto_1372177 ?auto_1372183 ) ) ( not ( = ?auto_1372177 ?auto_1372184 ) ) ( not ( = ?auto_1372178 ?auto_1372179 ) ) ( not ( = ?auto_1372178 ?auto_1372180 ) ) ( not ( = ?auto_1372178 ?auto_1372181 ) ) ( not ( = ?auto_1372178 ?auto_1372182 ) ) ( not ( = ?auto_1372178 ?auto_1372183 ) ) ( not ( = ?auto_1372178 ?auto_1372184 ) ) ( not ( = ?auto_1372179 ?auto_1372180 ) ) ( not ( = ?auto_1372179 ?auto_1372181 ) ) ( not ( = ?auto_1372179 ?auto_1372182 ) ) ( not ( = ?auto_1372179 ?auto_1372183 ) ) ( not ( = ?auto_1372179 ?auto_1372184 ) ) ( not ( = ?auto_1372180 ?auto_1372181 ) ) ( not ( = ?auto_1372180 ?auto_1372182 ) ) ( not ( = ?auto_1372180 ?auto_1372183 ) ) ( not ( = ?auto_1372180 ?auto_1372184 ) ) ( not ( = ?auto_1372181 ?auto_1372182 ) ) ( not ( = ?auto_1372181 ?auto_1372183 ) ) ( not ( = ?auto_1372181 ?auto_1372184 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1372182 ?auto_1372183 ?auto_1372184 )
      ( MAKE-11CRATE-VERIFY ?auto_1372173 ?auto_1372174 ?auto_1372175 ?auto_1372176 ?auto_1372177 ?auto_1372178 ?auto_1372179 ?auto_1372180 ?auto_1372181 ?auto_1372182 ?auto_1372183 ?auto_1372184 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1372316 - SURFACE
      ?auto_1372317 - SURFACE
      ?auto_1372318 - SURFACE
      ?auto_1372319 - SURFACE
      ?auto_1372320 - SURFACE
      ?auto_1372321 - SURFACE
      ?auto_1372322 - SURFACE
      ?auto_1372323 - SURFACE
      ?auto_1372324 - SURFACE
      ?auto_1372325 - SURFACE
      ?auto_1372326 - SURFACE
      ?auto_1372327 - SURFACE
    )
    :vars
    (
      ?auto_1372330 - HOIST
      ?auto_1372328 - PLACE
      ?auto_1372329 - TRUCK
      ?auto_1372333 - PLACE
      ?auto_1372332 - HOIST
      ?auto_1372331 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1372330 ?auto_1372328 ) ( SURFACE-AT ?auto_1372326 ?auto_1372328 ) ( CLEAR ?auto_1372326 ) ( IS-CRATE ?auto_1372327 ) ( not ( = ?auto_1372326 ?auto_1372327 ) ) ( AVAILABLE ?auto_1372330 ) ( ON ?auto_1372326 ?auto_1372325 ) ( not ( = ?auto_1372325 ?auto_1372326 ) ) ( not ( = ?auto_1372325 ?auto_1372327 ) ) ( TRUCK-AT ?auto_1372329 ?auto_1372333 ) ( not ( = ?auto_1372333 ?auto_1372328 ) ) ( HOIST-AT ?auto_1372332 ?auto_1372333 ) ( not ( = ?auto_1372330 ?auto_1372332 ) ) ( AVAILABLE ?auto_1372332 ) ( SURFACE-AT ?auto_1372327 ?auto_1372333 ) ( ON ?auto_1372327 ?auto_1372331 ) ( CLEAR ?auto_1372327 ) ( not ( = ?auto_1372326 ?auto_1372331 ) ) ( not ( = ?auto_1372327 ?auto_1372331 ) ) ( not ( = ?auto_1372325 ?auto_1372331 ) ) ( ON ?auto_1372317 ?auto_1372316 ) ( ON ?auto_1372318 ?auto_1372317 ) ( ON ?auto_1372319 ?auto_1372318 ) ( ON ?auto_1372320 ?auto_1372319 ) ( ON ?auto_1372321 ?auto_1372320 ) ( ON ?auto_1372322 ?auto_1372321 ) ( ON ?auto_1372323 ?auto_1372322 ) ( ON ?auto_1372324 ?auto_1372323 ) ( ON ?auto_1372325 ?auto_1372324 ) ( not ( = ?auto_1372316 ?auto_1372317 ) ) ( not ( = ?auto_1372316 ?auto_1372318 ) ) ( not ( = ?auto_1372316 ?auto_1372319 ) ) ( not ( = ?auto_1372316 ?auto_1372320 ) ) ( not ( = ?auto_1372316 ?auto_1372321 ) ) ( not ( = ?auto_1372316 ?auto_1372322 ) ) ( not ( = ?auto_1372316 ?auto_1372323 ) ) ( not ( = ?auto_1372316 ?auto_1372324 ) ) ( not ( = ?auto_1372316 ?auto_1372325 ) ) ( not ( = ?auto_1372316 ?auto_1372326 ) ) ( not ( = ?auto_1372316 ?auto_1372327 ) ) ( not ( = ?auto_1372316 ?auto_1372331 ) ) ( not ( = ?auto_1372317 ?auto_1372318 ) ) ( not ( = ?auto_1372317 ?auto_1372319 ) ) ( not ( = ?auto_1372317 ?auto_1372320 ) ) ( not ( = ?auto_1372317 ?auto_1372321 ) ) ( not ( = ?auto_1372317 ?auto_1372322 ) ) ( not ( = ?auto_1372317 ?auto_1372323 ) ) ( not ( = ?auto_1372317 ?auto_1372324 ) ) ( not ( = ?auto_1372317 ?auto_1372325 ) ) ( not ( = ?auto_1372317 ?auto_1372326 ) ) ( not ( = ?auto_1372317 ?auto_1372327 ) ) ( not ( = ?auto_1372317 ?auto_1372331 ) ) ( not ( = ?auto_1372318 ?auto_1372319 ) ) ( not ( = ?auto_1372318 ?auto_1372320 ) ) ( not ( = ?auto_1372318 ?auto_1372321 ) ) ( not ( = ?auto_1372318 ?auto_1372322 ) ) ( not ( = ?auto_1372318 ?auto_1372323 ) ) ( not ( = ?auto_1372318 ?auto_1372324 ) ) ( not ( = ?auto_1372318 ?auto_1372325 ) ) ( not ( = ?auto_1372318 ?auto_1372326 ) ) ( not ( = ?auto_1372318 ?auto_1372327 ) ) ( not ( = ?auto_1372318 ?auto_1372331 ) ) ( not ( = ?auto_1372319 ?auto_1372320 ) ) ( not ( = ?auto_1372319 ?auto_1372321 ) ) ( not ( = ?auto_1372319 ?auto_1372322 ) ) ( not ( = ?auto_1372319 ?auto_1372323 ) ) ( not ( = ?auto_1372319 ?auto_1372324 ) ) ( not ( = ?auto_1372319 ?auto_1372325 ) ) ( not ( = ?auto_1372319 ?auto_1372326 ) ) ( not ( = ?auto_1372319 ?auto_1372327 ) ) ( not ( = ?auto_1372319 ?auto_1372331 ) ) ( not ( = ?auto_1372320 ?auto_1372321 ) ) ( not ( = ?auto_1372320 ?auto_1372322 ) ) ( not ( = ?auto_1372320 ?auto_1372323 ) ) ( not ( = ?auto_1372320 ?auto_1372324 ) ) ( not ( = ?auto_1372320 ?auto_1372325 ) ) ( not ( = ?auto_1372320 ?auto_1372326 ) ) ( not ( = ?auto_1372320 ?auto_1372327 ) ) ( not ( = ?auto_1372320 ?auto_1372331 ) ) ( not ( = ?auto_1372321 ?auto_1372322 ) ) ( not ( = ?auto_1372321 ?auto_1372323 ) ) ( not ( = ?auto_1372321 ?auto_1372324 ) ) ( not ( = ?auto_1372321 ?auto_1372325 ) ) ( not ( = ?auto_1372321 ?auto_1372326 ) ) ( not ( = ?auto_1372321 ?auto_1372327 ) ) ( not ( = ?auto_1372321 ?auto_1372331 ) ) ( not ( = ?auto_1372322 ?auto_1372323 ) ) ( not ( = ?auto_1372322 ?auto_1372324 ) ) ( not ( = ?auto_1372322 ?auto_1372325 ) ) ( not ( = ?auto_1372322 ?auto_1372326 ) ) ( not ( = ?auto_1372322 ?auto_1372327 ) ) ( not ( = ?auto_1372322 ?auto_1372331 ) ) ( not ( = ?auto_1372323 ?auto_1372324 ) ) ( not ( = ?auto_1372323 ?auto_1372325 ) ) ( not ( = ?auto_1372323 ?auto_1372326 ) ) ( not ( = ?auto_1372323 ?auto_1372327 ) ) ( not ( = ?auto_1372323 ?auto_1372331 ) ) ( not ( = ?auto_1372324 ?auto_1372325 ) ) ( not ( = ?auto_1372324 ?auto_1372326 ) ) ( not ( = ?auto_1372324 ?auto_1372327 ) ) ( not ( = ?auto_1372324 ?auto_1372331 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1372325 ?auto_1372326 ?auto_1372327 )
      ( MAKE-11CRATE-VERIFY ?auto_1372316 ?auto_1372317 ?auto_1372318 ?auto_1372319 ?auto_1372320 ?auto_1372321 ?auto_1372322 ?auto_1372323 ?auto_1372324 ?auto_1372325 ?auto_1372326 ?auto_1372327 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1372460 - SURFACE
      ?auto_1372461 - SURFACE
      ?auto_1372462 - SURFACE
      ?auto_1372463 - SURFACE
      ?auto_1372464 - SURFACE
      ?auto_1372465 - SURFACE
      ?auto_1372466 - SURFACE
      ?auto_1372467 - SURFACE
      ?auto_1372468 - SURFACE
      ?auto_1372469 - SURFACE
      ?auto_1372470 - SURFACE
      ?auto_1372471 - SURFACE
    )
    :vars
    (
      ?auto_1372475 - HOIST
      ?auto_1372472 - PLACE
      ?auto_1372477 - PLACE
      ?auto_1372473 - HOIST
      ?auto_1372476 - SURFACE
      ?auto_1372474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1372475 ?auto_1372472 ) ( SURFACE-AT ?auto_1372470 ?auto_1372472 ) ( CLEAR ?auto_1372470 ) ( IS-CRATE ?auto_1372471 ) ( not ( = ?auto_1372470 ?auto_1372471 ) ) ( AVAILABLE ?auto_1372475 ) ( ON ?auto_1372470 ?auto_1372469 ) ( not ( = ?auto_1372469 ?auto_1372470 ) ) ( not ( = ?auto_1372469 ?auto_1372471 ) ) ( not ( = ?auto_1372477 ?auto_1372472 ) ) ( HOIST-AT ?auto_1372473 ?auto_1372477 ) ( not ( = ?auto_1372475 ?auto_1372473 ) ) ( AVAILABLE ?auto_1372473 ) ( SURFACE-AT ?auto_1372471 ?auto_1372477 ) ( ON ?auto_1372471 ?auto_1372476 ) ( CLEAR ?auto_1372471 ) ( not ( = ?auto_1372470 ?auto_1372476 ) ) ( not ( = ?auto_1372471 ?auto_1372476 ) ) ( not ( = ?auto_1372469 ?auto_1372476 ) ) ( TRUCK-AT ?auto_1372474 ?auto_1372472 ) ( ON ?auto_1372461 ?auto_1372460 ) ( ON ?auto_1372462 ?auto_1372461 ) ( ON ?auto_1372463 ?auto_1372462 ) ( ON ?auto_1372464 ?auto_1372463 ) ( ON ?auto_1372465 ?auto_1372464 ) ( ON ?auto_1372466 ?auto_1372465 ) ( ON ?auto_1372467 ?auto_1372466 ) ( ON ?auto_1372468 ?auto_1372467 ) ( ON ?auto_1372469 ?auto_1372468 ) ( not ( = ?auto_1372460 ?auto_1372461 ) ) ( not ( = ?auto_1372460 ?auto_1372462 ) ) ( not ( = ?auto_1372460 ?auto_1372463 ) ) ( not ( = ?auto_1372460 ?auto_1372464 ) ) ( not ( = ?auto_1372460 ?auto_1372465 ) ) ( not ( = ?auto_1372460 ?auto_1372466 ) ) ( not ( = ?auto_1372460 ?auto_1372467 ) ) ( not ( = ?auto_1372460 ?auto_1372468 ) ) ( not ( = ?auto_1372460 ?auto_1372469 ) ) ( not ( = ?auto_1372460 ?auto_1372470 ) ) ( not ( = ?auto_1372460 ?auto_1372471 ) ) ( not ( = ?auto_1372460 ?auto_1372476 ) ) ( not ( = ?auto_1372461 ?auto_1372462 ) ) ( not ( = ?auto_1372461 ?auto_1372463 ) ) ( not ( = ?auto_1372461 ?auto_1372464 ) ) ( not ( = ?auto_1372461 ?auto_1372465 ) ) ( not ( = ?auto_1372461 ?auto_1372466 ) ) ( not ( = ?auto_1372461 ?auto_1372467 ) ) ( not ( = ?auto_1372461 ?auto_1372468 ) ) ( not ( = ?auto_1372461 ?auto_1372469 ) ) ( not ( = ?auto_1372461 ?auto_1372470 ) ) ( not ( = ?auto_1372461 ?auto_1372471 ) ) ( not ( = ?auto_1372461 ?auto_1372476 ) ) ( not ( = ?auto_1372462 ?auto_1372463 ) ) ( not ( = ?auto_1372462 ?auto_1372464 ) ) ( not ( = ?auto_1372462 ?auto_1372465 ) ) ( not ( = ?auto_1372462 ?auto_1372466 ) ) ( not ( = ?auto_1372462 ?auto_1372467 ) ) ( not ( = ?auto_1372462 ?auto_1372468 ) ) ( not ( = ?auto_1372462 ?auto_1372469 ) ) ( not ( = ?auto_1372462 ?auto_1372470 ) ) ( not ( = ?auto_1372462 ?auto_1372471 ) ) ( not ( = ?auto_1372462 ?auto_1372476 ) ) ( not ( = ?auto_1372463 ?auto_1372464 ) ) ( not ( = ?auto_1372463 ?auto_1372465 ) ) ( not ( = ?auto_1372463 ?auto_1372466 ) ) ( not ( = ?auto_1372463 ?auto_1372467 ) ) ( not ( = ?auto_1372463 ?auto_1372468 ) ) ( not ( = ?auto_1372463 ?auto_1372469 ) ) ( not ( = ?auto_1372463 ?auto_1372470 ) ) ( not ( = ?auto_1372463 ?auto_1372471 ) ) ( not ( = ?auto_1372463 ?auto_1372476 ) ) ( not ( = ?auto_1372464 ?auto_1372465 ) ) ( not ( = ?auto_1372464 ?auto_1372466 ) ) ( not ( = ?auto_1372464 ?auto_1372467 ) ) ( not ( = ?auto_1372464 ?auto_1372468 ) ) ( not ( = ?auto_1372464 ?auto_1372469 ) ) ( not ( = ?auto_1372464 ?auto_1372470 ) ) ( not ( = ?auto_1372464 ?auto_1372471 ) ) ( not ( = ?auto_1372464 ?auto_1372476 ) ) ( not ( = ?auto_1372465 ?auto_1372466 ) ) ( not ( = ?auto_1372465 ?auto_1372467 ) ) ( not ( = ?auto_1372465 ?auto_1372468 ) ) ( not ( = ?auto_1372465 ?auto_1372469 ) ) ( not ( = ?auto_1372465 ?auto_1372470 ) ) ( not ( = ?auto_1372465 ?auto_1372471 ) ) ( not ( = ?auto_1372465 ?auto_1372476 ) ) ( not ( = ?auto_1372466 ?auto_1372467 ) ) ( not ( = ?auto_1372466 ?auto_1372468 ) ) ( not ( = ?auto_1372466 ?auto_1372469 ) ) ( not ( = ?auto_1372466 ?auto_1372470 ) ) ( not ( = ?auto_1372466 ?auto_1372471 ) ) ( not ( = ?auto_1372466 ?auto_1372476 ) ) ( not ( = ?auto_1372467 ?auto_1372468 ) ) ( not ( = ?auto_1372467 ?auto_1372469 ) ) ( not ( = ?auto_1372467 ?auto_1372470 ) ) ( not ( = ?auto_1372467 ?auto_1372471 ) ) ( not ( = ?auto_1372467 ?auto_1372476 ) ) ( not ( = ?auto_1372468 ?auto_1372469 ) ) ( not ( = ?auto_1372468 ?auto_1372470 ) ) ( not ( = ?auto_1372468 ?auto_1372471 ) ) ( not ( = ?auto_1372468 ?auto_1372476 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1372469 ?auto_1372470 ?auto_1372471 )
      ( MAKE-11CRATE-VERIFY ?auto_1372460 ?auto_1372461 ?auto_1372462 ?auto_1372463 ?auto_1372464 ?auto_1372465 ?auto_1372466 ?auto_1372467 ?auto_1372468 ?auto_1372469 ?auto_1372470 ?auto_1372471 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1372604 - SURFACE
      ?auto_1372605 - SURFACE
      ?auto_1372606 - SURFACE
      ?auto_1372607 - SURFACE
      ?auto_1372608 - SURFACE
      ?auto_1372609 - SURFACE
      ?auto_1372610 - SURFACE
      ?auto_1372611 - SURFACE
      ?auto_1372612 - SURFACE
      ?auto_1372613 - SURFACE
      ?auto_1372614 - SURFACE
      ?auto_1372615 - SURFACE
    )
    :vars
    (
      ?auto_1372620 - HOIST
      ?auto_1372619 - PLACE
      ?auto_1372616 - PLACE
      ?auto_1372617 - HOIST
      ?auto_1372621 - SURFACE
      ?auto_1372618 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1372620 ?auto_1372619 ) ( IS-CRATE ?auto_1372615 ) ( not ( = ?auto_1372614 ?auto_1372615 ) ) ( not ( = ?auto_1372613 ?auto_1372614 ) ) ( not ( = ?auto_1372613 ?auto_1372615 ) ) ( not ( = ?auto_1372616 ?auto_1372619 ) ) ( HOIST-AT ?auto_1372617 ?auto_1372616 ) ( not ( = ?auto_1372620 ?auto_1372617 ) ) ( AVAILABLE ?auto_1372617 ) ( SURFACE-AT ?auto_1372615 ?auto_1372616 ) ( ON ?auto_1372615 ?auto_1372621 ) ( CLEAR ?auto_1372615 ) ( not ( = ?auto_1372614 ?auto_1372621 ) ) ( not ( = ?auto_1372615 ?auto_1372621 ) ) ( not ( = ?auto_1372613 ?auto_1372621 ) ) ( TRUCK-AT ?auto_1372618 ?auto_1372619 ) ( SURFACE-AT ?auto_1372613 ?auto_1372619 ) ( CLEAR ?auto_1372613 ) ( LIFTING ?auto_1372620 ?auto_1372614 ) ( IS-CRATE ?auto_1372614 ) ( ON ?auto_1372605 ?auto_1372604 ) ( ON ?auto_1372606 ?auto_1372605 ) ( ON ?auto_1372607 ?auto_1372606 ) ( ON ?auto_1372608 ?auto_1372607 ) ( ON ?auto_1372609 ?auto_1372608 ) ( ON ?auto_1372610 ?auto_1372609 ) ( ON ?auto_1372611 ?auto_1372610 ) ( ON ?auto_1372612 ?auto_1372611 ) ( ON ?auto_1372613 ?auto_1372612 ) ( not ( = ?auto_1372604 ?auto_1372605 ) ) ( not ( = ?auto_1372604 ?auto_1372606 ) ) ( not ( = ?auto_1372604 ?auto_1372607 ) ) ( not ( = ?auto_1372604 ?auto_1372608 ) ) ( not ( = ?auto_1372604 ?auto_1372609 ) ) ( not ( = ?auto_1372604 ?auto_1372610 ) ) ( not ( = ?auto_1372604 ?auto_1372611 ) ) ( not ( = ?auto_1372604 ?auto_1372612 ) ) ( not ( = ?auto_1372604 ?auto_1372613 ) ) ( not ( = ?auto_1372604 ?auto_1372614 ) ) ( not ( = ?auto_1372604 ?auto_1372615 ) ) ( not ( = ?auto_1372604 ?auto_1372621 ) ) ( not ( = ?auto_1372605 ?auto_1372606 ) ) ( not ( = ?auto_1372605 ?auto_1372607 ) ) ( not ( = ?auto_1372605 ?auto_1372608 ) ) ( not ( = ?auto_1372605 ?auto_1372609 ) ) ( not ( = ?auto_1372605 ?auto_1372610 ) ) ( not ( = ?auto_1372605 ?auto_1372611 ) ) ( not ( = ?auto_1372605 ?auto_1372612 ) ) ( not ( = ?auto_1372605 ?auto_1372613 ) ) ( not ( = ?auto_1372605 ?auto_1372614 ) ) ( not ( = ?auto_1372605 ?auto_1372615 ) ) ( not ( = ?auto_1372605 ?auto_1372621 ) ) ( not ( = ?auto_1372606 ?auto_1372607 ) ) ( not ( = ?auto_1372606 ?auto_1372608 ) ) ( not ( = ?auto_1372606 ?auto_1372609 ) ) ( not ( = ?auto_1372606 ?auto_1372610 ) ) ( not ( = ?auto_1372606 ?auto_1372611 ) ) ( not ( = ?auto_1372606 ?auto_1372612 ) ) ( not ( = ?auto_1372606 ?auto_1372613 ) ) ( not ( = ?auto_1372606 ?auto_1372614 ) ) ( not ( = ?auto_1372606 ?auto_1372615 ) ) ( not ( = ?auto_1372606 ?auto_1372621 ) ) ( not ( = ?auto_1372607 ?auto_1372608 ) ) ( not ( = ?auto_1372607 ?auto_1372609 ) ) ( not ( = ?auto_1372607 ?auto_1372610 ) ) ( not ( = ?auto_1372607 ?auto_1372611 ) ) ( not ( = ?auto_1372607 ?auto_1372612 ) ) ( not ( = ?auto_1372607 ?auto_1372613 ) ) ( not ( = ?auto_1372607 ?auto_1372614 ) ) ( not ( = ?auto_1372607 ?auto_1372615 ) ) ( not ( = ?auto_1372607 ?auto_1372621 ) ) ( not ( = ?auto_1372608 ?auto_1372609 ) ) ( not ( = ?auto_1372608 ?auto_1372610 ) ) ( not ( = ?auto_1372608 ?auto_1372611 ) ) ( not ( = ?auto_1372608 ?auto_1372612 ) ) ( not ( = ?auto_1372608 ?auto_1372613 ) ) ( not ( = ?auto_1372608 ?auto_1372614 ) ) ( not ( = ?auto_1372608 ?auto_1372615 ) ) ( not ( = ?auto_1372608 ?auto_1372621 ) ) ( not ( = ?auto_1372609 ?auto_1372610 ) ) ( not ( = ?auto_1372609 ?auto_1372611 ) ) ( not ( = ?auto_1372609 ?auto_1372612 ) ) ( not ( = ?auto_1372609 ?auto_1372613 ) ) ( not ( = ?auto_1372609 ?auto_1372614 ) ) ( not ( = ?auto_1372609 ?auto_1372615 ) ) ( not ( = ?auto_1372609 ?auto_1372621 ) ) ( not ( = ?auto_1372610 ?auto_1372611 ) ) ( not ( = ?auto_1372610 ?auto_1372612 ) ) ( not ( = ?auto_1372610 ?auto_1372613 ) ) ( not ( = ?auto_1372610 ?auto_1372614 ) ) ( not ( = ?auto_1372610 ?auto_1372615 ) ) ( not ( = ?auto_1372610 ?auto_1372621 ) ) ( not ( = ?auto_1372611 ?auto_1372612 ) ) ( not ( = ?auto_1372611 ?auto_1372613 ) ) ( not ( = ?auto_1372611 ?auto_1372614 ) ) ( not ( = ?auto_1372611 ?auto_1372615 ) ) ( not ( = ?auto_1372611 ?auto_1372621 ) ) ( not ( = ?auto_1372612 ?auto_1372613 ) ) ( not ( = ?auto_1372612 ?auto_1372614 ) ) ( not ( = ?auto_1372612 ?auto_1372615 ) ) ( not ( = ?auto_1372612 ?auto_1372621 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1372613 ?auto_1372614 ?auto_1372615 )
      ( MAKE-11CRATE-VERIFY ?auto_1372604 ?auto_1372605 ?auto_1372606 ?auto_1372607 ?auto_1372608 ?auto_1372609 ?auto_1372610 ?auto_1372611 ?auto_1372612 ?auto_1372613 ?auto_1372614 ?auto_1372615 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1372748 - SURFACE
      ?auto_1372749 - SURFACE
      ?auto_1372750 - SURFACE
      ?auto_1372751 - SURFACE
      ?auto_1372752 - SURFACE
      ?auto_1372753 - SURFACE
      ?auto_1372754 - SURFACE
      ?auto_1372755 - SURFACE
      ?auto_1372756 - SURFACE
      ?auto_1372757 - SURFACE
      ?auto_1372758 - SURFACE
      ?auto_1372759 - SURFACE
    )
    :vars
    (
      ?auto_1372762 - HOIST
      ?auto_1372764 - PLACE
      ?auto_1372761 - PLACE
      ?auto_1372760 - HOIST
      ?auto_1372763 - SURFACE
      ?auto_1372765 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1372762 ?auto_1372764 ) ( IS-CRATE ?auto_1372759 ) ( not ( = ?auto_1372758 ?auto_1372759 ) ) ( not ( = ?auto_1372757 ?auto_1372758 ) ) ( not ( = ?auto_1372757 ?auto_1372759 ) ) ( not ( = ?auto_1372761 ?auto_1372764 ) ) ( HOIST-AT ?auto_1372760 ?auto_1372761 ) ( not ( = ?auto_1372762 ?auto_1372760 ) ) ( AVAILABLE ?auto_1372760 ) ( SURFACE-AT ?auto_1372759 ?auto_1372761 ) ( ON ?auto_1372759 ?auto_1372763 ) ( CLEAR ?auto_1372759 ) ( not ( = ?auto_1372758 ?auto_1372763 ) ) ( not ( = ?auto_1372759 ?auto_1372763 ) ) ( not ( = ?auto_1372757 ?auto_1372763 ) ) ( TRUCK-AT ?auto_1372765 ?auto_1372764 ) ( SURFACE-AT ?auto_1372757 ?auto_1372764 ) ( CLEAR ?auto_1372757 ) ( IS-CRATE ?auto_1372758 ) ( AVAILABLE ?auto_1372762 ) ( IN ?auto_1372758 ?auto_1372765 ) ( ON ?auto_1372749 ?auto_1372748 ) ( ON ?auto_1372750 ?auto_1372749 ) ( ON ?auto_1372751 ?auto_1372750 ) ( ON ?auto_1372752 ?auto_1372751 ) ( ON ?auto_1372753 ?auto_1372752 ) ( ON ?auto_1372754 ?auto_1372753 ) ( ON ?auto_1372755 ?auto_1372754 ) ( ON ?auto_1372756 ?auto_1372755 ) ( ON ?auto_1372757 ?auto_1372756 ) ( not ( = ?auto_1372748 ?auto_1372749 ) ) ( not ( = ?auto_1372748 ?auto_1372750 ) ) ( not ( = ?auto_1372748 ?auto_1372751 ) ) ( not ( = ?auto_1372748 ?auto_1372752 ) ) ( not ( = ?auto_1372748 ?auto_1372753 ) ) ( not ( = ?auto_1372748 ?auto_1372754 ) ) ( not ( = ?auto_1372748 ?auto_1372755 ) ) ( not ( = ?auto_1372748 ?auto_1372756 ) ) ( not ( = ?auto_1372748 ?auto_1372757 ) ) ( not ( = ?auto_1372748 ?auto_1372758 ) ) ( not ( = ?auto_1372748 ?auto_1372759 ) ) ( not ( = ?auto_1372748 ?auto_1372763 ) ) ( not ( = ?auto_1372749 ?auto_1372750 ) ) ( not ( = ?auto_1372749 ?auto_1372751 ) ) ( not ( = ?auto_1372749 ?auto_1372752 ) ) ( not ( = ?auto_1372749 ?auto_1372753 ) ) ( not ( = ?auto_1372749 ?auto_1372754 ) ) ( not ( = ?auto_1372749 ?auto_1372755 ) ) ( not ( = ?auto_1372749 ?auto_1372756 ) ) ( not ( = ?auto_1372749 ?auto_1372757 ) ) ( not ( = ?auto_1372749 ?auto_1372758 ) ) ( not ( = ?auto_1372749 ?auto_1372759 ) ) ( not ( = ?auto_1372749 ?auto_1372763 ) ) ( not ( = ?auto_1372750 ?auto_1372751 ) ) ( not ( = ?auto_1372750 ?auto_1372752 ) ) ( not ( = ?auto_1372750 ?auto_1372753 ) ) ( not ( = ?auto_1372750 ?auto_1372754 ) ) ( not ( = ?auto_1372750 ?auto_1372755 ) ) ( not ( = ?auto_1372750 ?auto_1372756 ) ) ( not ( = ?auto_1372750 ?auto_1372757 ) ) ( not ( = ?auto_1372750 ?auto_1372758 ) ) ( not ( = ?auto_1372750 ?auto_1372759 ) ) ( not ( = ?auto_1372750 ?auto_1372763 ) ) ( not ( = ?auto_1372751 ?auto_1372752 ) ) ( not ( = ?auto_1372751 ?auto_1372753 ) ) ( not ( = ?auto_1372751 ?auto_1372754 ) ) ( not ( = ?auto_1372751 ?auto_1372755 ) ) ( not ( = ?auto_1372751 ?auto_1372756 ) ) ( not ( = ?auto_1372751 ?auto_1372757 ) ) ( not ( = ?auto_1372751 ?auto_1372758 ) ) ( not ( = ?auto_1372751 ?auto_1372759 ) ) ( not ( = ?auto_1372751 ?auto_1372763 ) ) ( not ( = ?auto_1372752 ?auto_1372753 ) ) ( not ( = ?auto_1372752 ?auto_1372754 ) ) ( not ( = ?auto_1372752 ?auto_1372755 ) ) ( not ( = ?auto_1372752 ?auto_1372756 ) ) ( not ( = ?auto_1372752 ?auto_1372757 ) ) ( not ( = ?auto_1372752 ?auto_1372758 ) ) ( not ( = ?auto_1372752 ?auto_1372759 ) ) ( not ( = ?auto_1372752 ?auto_1372763 ) ) ( not ( = ?auto_1372753 ?auto_1372754 ) ) ( not ( = ?auto_1372753 ?auto_1372755 ) ) ( not ( = ?auto_1372753 ?auto_1372756 ) ) ( not ( = ?auto_1372753 ?auto_1372757 ) ) ( not ( = ?auto_1372753 ?auto_1372758 ) ) ( not ( = ?auto_1372753 ?auto_1372759 ) ) ( not ( = ?auto_1372753 ?auto_1372763 ) ) ( not ( = ?auto_1372754 ?auto_1372755 ) ) ( not ( = ?auto_1372754 ?auto_1372756 ) ) ( not ( = ?auto_1372754 ?auto_1372757 ) ) ( not ( = ?auto_1372754 ?auto_1372758 ) ) ( not ( = ?auto_1372754 ?auto_1372759 ) ) ( not ( = ?auto_1372754 ?auto_1372763 ) ) ( not ( = ?auto_1372755 ?auto_1372756 ) ) ( not ( = ?auto_1372755 ?auto_1372757 ) ) ( not ( = ?auto_1372755 ?auto_1372758 ) ) ( not ( = ?auto_1372755 ?auto_1372759 ) ) ( not ( = ?auto_1372755 ?auto_1372763 ) ) ( not ( = ?auto_1372756 ?auto_1372757 ) ) ( not ( = ?auto_1372756 ?auto_1372758 ) ) ( not ( = ?auto_1372756 ?auto_1372759 ) ) ( not ( = ?auto_1372756 ?auto_1372763 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1372757 ?auto_1372758 ?auto_1372759 )
      ( MAKE-11CRATE-VERIFY ?auto_1372748 ?auto_1372749 ?auto_1372750 ?auto_1372751 ?auto_1372752 ?auto_1372753 ?auto_1372754 ?auto_1372755 ?auto_1372756 ?auto_1372757 ?auto_1372758 ?auto_1372759 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1381972 - SURFACE
      ?auto_1381973 - SURFACE
      ?auto_1381974 - SURFACE
      ?auto_1381975 - SURFACE
      ?auto_1381976 - SURFACE
      ?auto_1381977 - SURFACE
      ?auto_1381978 - SURFACE
      ?auto_1381979 - SURFACE
      ?auto_1381980 - SURFACE
      ?auto_1381981 - SURFACE
      ?auto_1381982 - SURFACE
      ?auto_1381983 - SURFACE
      ?auto_1381984 - SURFACE
    )
    :vars
    (
      ?auto_1381985 - HOIST
      ?auto_1381986 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1381985 ?auto_1381986 ) ( SURFACE-AT ?auto_1381983 ?auto_1381986 ) ( CLEAR ?auto_1381983 ) ( LIFTING ?auto_1381985 ?auto_1381984 ) ( IS-CRATE ?auto_1381984 ) ( not ( = ?auto_1381983 ?auto_1381984 ) ) ( ON ?auto_1381973 ?auto_1381972 ) ( ON ?auto_1381974 ?auto_1381973 ) ( ON ?auto_1381975 ?auto_1381974 ) ( ON ?auto_1381976 ?auto_1381975 ) ( ON ?auto_1381977 ?auto_1381976 ) ( ON ?auto_1381978 ?auto_1381977 ) ( ON ?auto_1381979 ?auto_1381978 ) ( ON ?auto_1381980 ?auto_1381979 ) ( ON ?auto_1381981 ?auto_1381980 ) ( ON ?auto_1381982 ?auto_1381981 ) ( ON ?auto_1381983 ?auto_1381982 ) ( not ( = ?auto_1381972 ?auto_1381973 ) ) ( not ( = ?auto_1381972 ?auto_1381974 ) ) ( not ( = ?auto_1381972 ?auto_1381975 ) ) ( not ( = ?auto_1381972 ?auto_1381976 ) ) ( not ( = ?auto_1381972 ?auto_1381977 ) ) ( not ( = ?auto_1381972 ?auto_1381978 ) ) ( not ( = ?auto_1381972 ?auto_1381979 ) ) ( not ( = ?auto_1381972 ?auto_1381980 ) ) ( not ( = ?auto_1381972 ?auto_1381981 ) ) ( not ( = ?auto_1381972 ?auto_1381982 ) ) ( not ( = ?auto_1381972 ?auto_1381983 ) ) ( not ( = ?auto_1381972 ?auto_1381984 ) ) ( not ( = ?auto_1381973 ?auto_1381974 ) ) ( not ( = ?auto_1381973 ?auto_1381975 ) ) ( not ( = ?auto_1381973 ?auto_1381976 ) ) ( not ( = ?auto_1381973 ?auto_1381977 ) ) ( not ( = ?auto_1381973 ?auto_1381978 ) ) ( not ( = ?auto_1381973 ?auto_1381979 ) ) ( not ( = ?auto_1381973 ?auto_1381980 ) ) ( not ( = ?auto_1381973 ?auto_1381981 ) ) ( not ( = ?auto_1381973 ?auto_1381982 ) ) ( not ( = ?auto_1381973 ?auto_1381983 ) ) ( not ( = ?auto_1381973 ?auto_1381984 ) ) ( not ( = ?auto_1381974 ?auto_1381975 ) ) ( not ( = ?auto_1381974 ?auto_1381976 ) ) ( not ( = ?auto_1381974 ?auto_1381977 ) ) ( not ( = ?auto_1381974 ?auto_1381978 ) ) ( not ( = ?auto_1381974 ?auto_1381979 ) ) ( not ( = ?auto_1381974 ?auto_1381980 ) ) ( not ( = ?auto_1381974 ?auto_1381981 ) ) ( not ( = ?auto_1381974 ?auto_1381982 ) ) ( not ( = ?auto_1381974 ?auto_1381983 ) ) ( not ( = ?auto_1381974 ?auto_1381984 ) ) ( not ( = ?auto_1381975 ?auto_1381976 ) ) ( not ( = ?auto_1381975 ?auto_1381977 ) ) ( not ( = ?auto_1381975 ?auto_1381978 ) ) ( not ( = ?auto_1381975 ?auto_1381979 ) ) ( not ( = ?auto_1381975 ?auto_1381980 ) ) ( not ( = ?auto_1381975 ?auto_1381981 ) ) ( not ( = ?auto_1381975 ?auto_1381982 ) ) ( not ( = ?auto_1381975 ?auto_1381983 ) ) ( not ( = ?auto_1381975 ?auto_1381984 ) ) ( not ( = ?auto_1381976 ?auto_1381977 ) ) ( not ( = ?auto_1381976 ?auto_1381978 ) ) ( not ( = ?auto_1381976 ?auto_1381979 ) ) ( not ( = ?auto_1381976 ?auto_1381980 ) ) ( not ( = ?auto_1381976 ?auto_1381981 ) ) ( not ( = ?auto_1381976 ?auto_1381982 ) ) ( not ( = ?auto_1381976 ?auto_1381983 ) ) ( not ( = ?auto_1381976 ?auto_1381984 ) ) ( not ( = ?auto_1381977 ?auto_1381978 ) ) ( not ( = ?auto_1381977 ?auto_1381979 ) ) ( not ( = ?auto_1381977 ?auto_1381980 ) ) ( not ( = ?auto_1381977 ?auto_1381981 ) ) ( not ( = ?auto_1381977 ?auto_1381982 ) ) ( not ( = ?auto_1381977 ?auto_1381983 ) ) ( not ( = ?auto_1381977 ?auto_1381984 ) ) ( not ( = ?auto_1381978 ?auto_1381979 ) ) ( not ( = ?auto_1381978 ?auto_1381980 ) ) ( not ( = ?auto_1381978 ?auto_1381981 ) ) ( not ( = ?auto_1381978 ?auto_1381982 ) ) ( not ( = ?auto_1381978 ?auto_1381983 ) ) ( not ( = ?auto_1381978 ?auto_1381984 ) ) ( not ( = ?auto_1381979 ?auto_1381980 ) ) ( not ( = ?auto_1381979 ?auto_1381981 ) ) ( not ( = ?auto_1381979 ?auto_1381982 ) ) ( not ( = ?auto_1381979 ?auto_1381983 ) ) ( not ( = ?auto_1381979 ?auto_1381984 ) ) ( not ( = ?auto_1381980 ?auto_1381981 ) ) ( not ( = ?auto_1381980 ?auto_1381982 ) ) ( not ( = ?auto_1381980 ?auto_1381983 ) ) ( not ( = ?auto_1381980 ?auto_1381984 ) ) ( not ( = ?auto_1381981 ?auto_1381982 ) ) ( not ( = ?auto_1381981 ?auto_1381983 ) ) ( not ( = ?auto_1381981 ?auto_1381984 ) ) ( not ( = ?auto_1381982 ?auto_1381983 ) ) ( not ( = ?auto_1381982 ?auto_1381984 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1381983 ?auto_1381984 )
      ( MAKE-12CRATE-VERIFY ?auto_1381972 ?auto_1381973 ?auto_1381974 ?auto_1381975 ?auto_1381976 ?auto_1381977 ?auto_1381978 ?auto_1381979 ?auto_1381980 ?auto_1381981 ?auto_1381982 ?auto_1381983 ?auto_1381984 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1382097 - SURFACE
      ?auto_1382098 - SURFACE
      ?auto_1382099 - SURFACE
      ?auto_1382100 - SURFACE
      ?auto_1382101 - SURFACE
      ?auto_1382102 - SURFACE
      ?auto_1382103 - SURFACE
      ?auto_1382104 - SURFACE
      ?auto_1382105 - SURFACE
      ?auto_1382106 - SURFACE
      ?auto_1382107 - SURFACE
      ?auto_1382108 - SURFACE
      ?auto_1382109 - SURFACE
    )
    :vars
    (
      ?auto_1382112 - HOIST
      ?auto_1382111 - PLACE
      ?auto_1382110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1382112 ?auto_1382111 ) ( SURFACE-AT ?auto_1382108 ?auto_1382111 ) ( CLEAR ?auto_1382108 ) ( IS-CRATE ?auto_1382109 ) ( not ( = ?auto_1382108 ?auto_1382109 ) ) ( TRUCK-AT ?auto_1382110 ?auto_1382111 ) ( AVAILABLE ?auto_1382112 ) ( IN ?auto_1382109 ?auto_1382110 ) ( ON ?auto_1382108 ?auto_1382107 ) ( not ( = ?auto_1382107 ?auto_1382108 ) ) ( not ( = ?auto_1382107 ?auto_1382109 ) ) ( ON ?auto_1382098 ?auto_1382097 ) ( ON ?auto_1382099 ?auto_1382098 ) ( ON ?auto_1382100 ?auto_1382099 ) ( ON ?auto_1382101 ?auto_1382100 ) ( ON ?auto_1382102 ?auto_1382101 ) ( ON ?auto_1382103 ?auto_1382102 ) ( ON ?auto_1382104 ?auto_1382103 ) ( ON ?auto_1382105 ?auto_1382104 ) ( ON ?auto_1382106 ?auto_1382105 ) ( ON ?auto_1382107 ?auto_1382106 ) ( not ( = ?auto_1382097 ?auto_1382098 ) ) ( not ( = ?auto_1382097 ?auto_1382099 ) ) ( not ( = ?auto_1382097 ?auto_1382100 ) ) ( not ( = ?auto_1382097 ?auto_1382101 ) ) ( not ( = ?auto_1382097 ?auto_1382102 ) ) ( not ( = ?auto_1382097 ?auto_1382103 ) ) ( not ( = ?auto_1382097 ?auto_1382104 ) ) ( not ( = ?auto_1382097 ?auto_1382105 ) ) ( not ( = ?auto_1382097 ?auto_1382106 ) ) ( not ( = ?auto_1382097 ?auto_1382107 ) ) ( not ( = ?auto_1382097 ?auto_1382108 ) ) ( not ( = ?auto_1382097 ?auto_1382109 ) ) ( not ( = ?auto_1382098 ?auto_1382099 ) ) ( not ( = ?auto_1382098 ?auto_1382100 ) ) ( not ( = ?auto_1382098 ?auto_1382101 ) ) ( not ( = ?auto_1382098 ?auto_1382102 ) ) ( not ( = ?auto_1382098 ?auto_1382103 ) ) ( not ( = ?auto_1382098 ?auto_1382104 ) ) ( not ( = ?auto_1382098 ?auto_1382105 ) ) ( not ( = ?auto_1382098 ?auto_1382106 ) ) ( not ( = ?auto_1382098 ?auto_1382107 ) ) ( not ( = ?auto_1382098 ?auto_1382108 ) ) ( not ( = ?auto_1382098 ?auto_1382109 ) ) ( not ( = ?auto_1382099 ?auto_1382100 ) ) ( not ( = ?auto_1382099 ?auto_1382101 ) ) ( not ( = ?auto_1382099 ?auto_1382102 ) ) ( not ( = ?auto_1382099 ?auto_1382103 ) ) ( not ( = ?auto_1382099 ?auto_1382104 ) ) ( not ( = ?auto_1382099 ?auto_1382105 ) ) ( not ( = ?auto_1382099 ?auto_1382106 ) ) ( not ( = ?auto_1382099 ?auto_1382107 ) ) ( not ( = ?auto_1382099 ?auto_1382108 ) ) ( not ( = ?auto_1382099 ?auto_1382109 ) ) ( not ( = ?auto_1382100 ?auto_1382101 ) ) ( not ( = ?auto_1382100 ?auto_1382102 ) ) ( not ( = ?auto_1382100 ?auto_1382103 ) ) ( not ( = ?auto_1382100 ?auto_1382104 ) ) ( not ( = ?auto_1382100 ?auto_1382105 ) ) ( not ( = ?auto_1382100 ?auto_1382106 ) ) ( not ( = ?auto_1382100 ?auto_1382107 ) ) ( not ( = ?auto_1382100 ?auto_1382108 ) ) ( not ( = ?auto_1382100 ?auto_1382109 ) ) ( not ( = ?auto_1382101 ?auto_1382102 ) ) ( not ( = ?auto_1382101 ?auto_1382103 ) ) ( not ( = ?auto_1382101 ?auto_1382104 ) ) ( not ( = ?auto_1382101 ?auto_1382105 ) ) ( not ( = ?auto_1382101 ?auto_1382106 ) ) ( not ( = ?auto_1382101 ?auto_1382107 ) ) ( not ( = ?auto_1382101 ?auto_1382108 ) ) ( not ( = ?auto_1382101 ?auto_1382109 ) ) ( not ( = ?auto_1382102 ?auto_1382103 ) ) ( not ( = ?auto_1382102 ?auto_1382104 ) ) ( not ( = ?auto_1382102 ?auto_1382105 ) ) ( not ( = ?auto_1382102 ?auto_1382106 ) ) ( not ( = ?auto_1382102 ?auto_1382107 ) ) ( not ( = ?auto_1382102 ?auto_1382108 ) ) ( not ( = ?auto_1382102 ?auto_1382109 ) ) ( not ( = ?auto_1382103 ?auto_1382104 ) ) ( not ( = ?auto_1382103 ?auto_1382105 ) ) ( not ( = ?auto_1382103 ?auto_1382106 ) ) ( not ( = ?auto_1382103 ?auto_1382107 ) ) ( not ( = ?auto_1382103 ?auto_1382108 ) ) ( not ( = ?auto_1382103 ?auto_1382109 ) ) ( not ( = ?auto_1382104 ?auto_1382105 ) ) ( not ( = ?auto_1382104 ?auto_1382106 ) ) ( not ( = ?auto_1382104 ?auto_1382107 ) ) ( not ( = ?auto_1382104 ?auto_1382108 ) ) ( not ( = ?auto_1382104 ?auto_1382109 ) ) ( not ( = ?auto_1382105 ?auto_1382106 ) ) ( not ( = ?auto_1382105 ?auto_1382107 ) ) ( not ( = ?auto_1382105 ?auto_1382108 ) ) ( not ( = ?auto_1382105 ?auto_1382109 ) ) ( not ( = ?auto_1382106 ?auto_1382107 ) ) ( not ( = ?auto_1382106 ?auto_1382108 ) ) ( not ( = ?auto_1382106 ?auto_1382109 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1382107 ?auto_1382108 ?auto_1382109 )
      ( MAKE-12CRATE-VERIFY ?auto_1382097 ?auto_1382098 ?auto_1382099 ?auto_1382100 ?auto_1382101 ?auto_1382102 ?auto_1382103 ?auto_1382104 ?auto_1382105 ?auto_1382106 ?auto_1382107 ?auto_1382108 ?auto_1382109 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1382235 - SURFACE
      ?auto_1382236 - SURFACE
      ?auto_1382237 - SURFACE
      ?auto_1382238 - SURFACE
      ?auto_1382239 - SURFACE
      ?auto_1382240 - SURFACE
      ?auto_1382241 - SURFACE
      ?auto_1382242 - SURFACE
      ?auto_1382243 - SURFACE
      ?auto_1382244 - SURFACE
      ?auto_1382245 - SURFACE
      ?auto_1382246 - SURFACE
      ?auto_1382247 - SURFACE
    )
    :vars
    (
      ?auto_1382249 - HOIST
      ?auto_1382250 - PLACE
      ?auto_1382248 - TRUCK
      ?auto_1382251 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1382249 ?auto_1382250 ) ( SURFACE-AT ?auto_1382246 ?auto_1382250 ) ( CLEAR ?auto_1382246 ) ( IS-CRATE ?auto_1382247 ) ( not ( = ?auto_1382246 ?auto_1382247 ) ) ( AVAILABLE ?auto_1382249 ) ( IN ?auto_1382247 ?auto_1382248 ) ( ON ?auto_1382246 ?auto_1382245 ) ( not ( = ?auto_1382245 ?auto_1382246 ) ) ( not ( = ?auto_1382245 ?auto_1382247 ) ) ( TRUCK-AT ?auto_1382248 ?auto_1382251 ) ( not ( = ?auto_1382251 ?auto_1382250 ) ) ( ON ?auto_1382236 ?auto_1382235 ) ( ON ?auto_1382237 ?auto_1382236 ) ( ON ?auto_1382238 ?auto_1382237 ) ( ON ?auto_1382239 ?auto_1382238 ) ( ON ?auto_1382240 ?auto_1382239 ) ( ON ?auto_1382241 ?auto_1382240 ) ( ON ?auto_1382242 ?auto_1382241 ) ( ON ?auto_1382243 ?auto_1382242 ) ( ON ?auto_1382244 ?auto_1382243 ) ( ON ?auto_1382245 ?auto_1382244 ) ( not ( = ?auto_1382235 ?auto_1382236 ) ) ( not ( = ?auto_1382235 ?auto_1382237 ) ) ( not ( = ?auto_1382235 ?auto_1382238 ) ) ( not ( = ?auto_1382235 ?auto_1382239 ) ) ( not ( = ?auto_1382235 ?auto_1382240 ) ) ( not ( = ?auto_1382235 ?auto_1382241 ) ) ( not ( = ?auto_1382235 ?auto_1382242 ) ) ( not ( = ?auto_1382235 ?auto_1382243 ) ) ( not ( = ?auto_1382235 ?auto_1382244 ) ) ( not ( = ?auto_1382235 ?auto_1382245 ) ) ( not ( = ?auto_1382235 ?auto_1382246 ) ) ( not ( = ?auto_1382235 ?auto_1382247 ) ) ( not ( = ?auto_1382236 ?auto_1382237 ) ) ( not ( = ?auto_1382236 ?auto_1382238 ) ) ( not ( = ?auto_1382236 ?auto_1382239 ) ) ( not ( = ?auto_1382236 ?auto_1382240 ) ) ( not ( = ?auto_1382236 ?auto_1382241 ) ) ( not ( = ?auto_1382236 ?auto_1382242 ) ) ( not ( = ?auto_1382236 ?auto_1382243 ) ) ( not ( = ?auto_1382236 ?auto_1382244 ) ) ( not ( = ?auto_1382236 ?auto_1382245 ) ) ( not ( = ?auto_1382236 ?auto_1382246 ) ) ( not ( = ?auto_1382236 ?auto_1382247 ) ) ( not ( = ?auto_1382237 ?auto_1382238 ) ) ( not ( = ?auto_1382237 ?auto_1382239 ) ) ( not ( = ?auto_1382237 ?auto_1382240 ) ) ( not ( = ?auto_1382237 ?auto_1382241 ) ) ( not ( = ?auto_1382237 ?auto_1382242 ) ) ( not ( = ?auto_1382237 ?auto_1382243 ) ) ( not ( = ?auto_1382237 ?auto_1382244 ) ) ( not ( = ?auto_1382237 ?auto_1382245 ) ) ( not ( = ?auto_1382237 ?auto_1382246 ) ) ( not ( = ?auto_1382237 ?auto_1382247 ) ) ( not ( = ?auto_1382238 ?auto_1382239 ) ) ( not ( = ?auto_1382238 ?auto_1382240 ) ) ( not ( = ?auto_1382238 ?auto_1382241 ) ) ( not ( = ?auto_1382238 ?auto_1382242 ) ) ( not ( = ?auto_1382238 ?auto_1382243 ) ) ( not ( = ?auto_1382238 ?auto_1382244 ) ) ( not ( = ?auto_1382238 ?auto_1382245 ) ) ( not ( = ?auto_1382238 ?auto_1382246 ) ) ( not ( = ?auto_1382238 ?auto_1382247 ) ) ( not ( = ?auto_1382239 ?auto_1382240 ) ) ( not ( = ?auto_1382239 ?auto_1382241 ) ) ( not ( = ?auto_1382239 ?auto_1382242 ) ) ( not ( = ?auto_1382239 ?auto_1382243 ) ) ( not ( = ?auto_1382239 ?auto_1382244 ) ) ( not ( = ?auto_1382239 ?auto_1382245 ) ) ( not ( = ?auto_1382239 ?auto_1382246 ) ) ( not ( = ?auto_1382239 ?auto_1382247 ) ) ( not ( = ?auto_1382240 ?auto_1382241 ) ) ( not ( = ?auto_1382240 ?auto_1382242 ) ) ( not ( = ?auto_1382240 ?auto_1382243 ) ) ( not ( = ?auto_1382240 ?auto_1382244 ) ) ( not ( = ?auto_1382240 ?auto_1382245 ) ) ( not ( = ?auto_1382240 ?auto_1382246 ) ) ( not ( = ?auto_1382240 ?auto_1382247 ) ) ( not ( = ?auto_1382241 ?auto_1382242 ) ) ( not ( = ?auto_1382241 ?auto_1382243 ) ) ( not ( = ?auto_1382241 ?auto_1382244 ) ) ( not ( = ?auto_1382241 ?auto_1382245 ) ) ( not ( = ?auto_1382241 ?auto_1382246 ) ) ( not ( = ?auto_1382241 ?auto_1382247 ) ) ( not ( = ?auto_1382242 ?auto_1382243 ) ) ( not ( = ?auto_1382242 ?auto_1382244 ) ) ( not ( = ?auto_1382242 ?auto_1382245 ) ) ( not ( = ?auto_1382242 ?auto_1382246 ) ) ( not ( = ?auto_1382242 ?auto_1382247 ) ) ( not ( = ?auto_1382243 ?auto_1382244 ) ) ( not ( = ?auto_1382243 ?auto_1382245 ) ) ( not ( = ?auto_1382243 ?auto_1382246 ) ) ( not ( = ?auto_1382243 ?auto_1382247 ) ) ( not ( = ?auto_1382244 ?auto_1382245 ) ) ( not ( = ?auto_1382244 ?auto_1382246 ) ) ( not ( = ?auto_1382244 ?auto_1382247 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1382245 ?auto_1382246 ?auto_1382247 )
      ( MAKE-12CRATE-VERIFY ?auto_1382235 ?auto_1382236 ?auto_1382237 ?auto_1382238 ?auto_1382239 ?auto_1382240 ?auto_1382241 ?auto_1382242 ?auto_1382243 ?auto_1382244 ?auto_1382245 ?auto_1382246 ?auto_1382247 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1382385 - SURFACE
      ?auto_1382386 - SURFACE
      ?auto_1382387 - SURFACE
      ?auto_1382388 - SURFACE
      ?auto_1382389 - SURFACE
      ?auto_1382390 - SURFACE
      ?auto_1382391 - SURFACE
      ?auto_1382392 - SURFACE
      ?auto_1382393 - SURFACE
      ?auto_1382394 - SURFACE
      ?auto_1382395 - SURFACE
      ?auto_1382396 - SURFACE
      ?auto_1382397 - SURFACE
    )
    :vars
    (
      ?auto_1382402 - HOIST
      ?auto_1382398 - PLACE
      ?auto_1382401 - TRUCK
      ?auto_1382400 - PLACE
      ?auto_1382399 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1382402 ?auto_1382398 ) ( SURFACE-AT ?auto_1382396 ?auto_1382398 ) ( CLEAR ?auto_1382396 ) ( IS-CRATE ?auto_1382397 ) ( not ( = ?auto_1382396 ?auto_1382397 ) ) ( AVAILABLE ?auto_1382402 ) ( ON ?auto_1382396 ?auto_1382395 ) ( not ( = ?auto_1382395 ?auto_1382396 ) ) ( not ( = ?auto_1382395 ?auto_1382397 ) ) ( TRUCK-AT ?auto_1382401 ?auto_1382400 ) ( not ( = ?auto_1382400 ?auto_1382398 ) ) ( HOIST-AT ?auto_1382399 ?auto_1382400 ) ( LIFTING ?auto_1382399 ?auto_1382397 ) ( not ( = ?auto_1382402 ?auto_1382399 ) ) ( ON ?auto_1382386 ?auto_1382385 ) ( ON ?auto_1382387 ?auto_1382386 ) ( ON ?auto_1382388 ?auto_1382387 ) ( ON ?auto_1382389 ?auto_1382388 ) ( ON ?auto_1382390 ?auto_1382389 ) ( ON ?auto_1382391 ?auto_1382390 ) ( ON ?auto_1382392 ?auto_1382391 ) ( ON ?auto_1382393 ?auto_1382392 ) ( ON ?auto_1382394 ?auto_1382393 ) ( ON ?auto_1382395 ?auto_1382394 ) ( not ( = ?auto_1382385 ?auto_1382386 ) ) ( not ( = ?auto_1382385 ?auto_1382387 ) ) ( not ( = ?auto_1382385 ?auto_1382388 ) ) ( not ( = ?auto_1382385 ?auto_1382389 ) ) ( not ( = ?auto_1382385 ?auto_1382390 ) ) ( not ( = ?auto_1382385 ?auto_1382391 ) ) ( not ( = ?auto_1382385 ?auto_1382392 ) ) ( not ( = ?auto_1382385 ?auto_1382393 ) ) ( not ( = ?auto_1382385 ?auto_1382394 ) ) ( not ( = ?auto_1382385 ?auto_1382395 ) ) ( not ( = ?auto_1382385 ?auto_1382396 ) ) ( not ( = ?auto_1382385 ?auto_1382397 ) ) ( not ( = ?auto_1382386 ?auto_1382387 ) ) ( not ( = ?auto_1382386 ?auto_1382388 ) ) ( not ( = ?auto_1382386 ?auto_1382389 ) ) ( not ( = ?auto_1382386 ?auto_1382390 ) ) ( not ( = ?auto_1382386 ?auto_1382391 ) ) ( not ( = ?auto_1382386 ?auto_1382392 ) ) ( not ( = ?auto_1382386 ?auto_1382393 ) ) ( not ( = ?auto_1382386 ?auto_1382394 ) ) ( not ( = ?auto_1382386 ?auto_1382395 ) ) ( not ( = ?auto_1382386 ?auto_1382396 ) ) ( not ( = ?auto_1382386 ?auto_1382397 ) ) ( not ( = ?auto_1382387 ?auto_1382388 ) ) ( not ( = ?auto_1382387 ?auto_1382389 ) ) ( not ( = ?auto_1382387 ?auto_1382390 ) ) ( not ( = ?auto_1382387 ?auto_1382391 ) ) ( not ( = ?auto_1382387 ?auto_1382392 ) ) ( not ( = ?auto_1382387 ?auto_1382393 ) ) ( not ( = ?auto_1382387 ?auto_1382394 ) ) ( not ( = ?auto_1382387 ?auto_1382395 ) ) ( not ( = ?auto_1382387 ?auto_1382396 ) ) ( not ( = ?auto_1382387 ?auto_1382397 ) ) ( not ( = ?auto_1382388 ?auto_1382389 ) ) ( not ( = ?auto_1382388 ?auto_1382390 ) ) ( not ( = ?auto_1382388 ?auto_1382391 ) ) ( not ( = ?auto_1382388 ?auto_1382392 ) ) ( not ( = ?auto_1382388 ?auto_1382393 ) ) ( not ( = ?auto_1382388 ?auto_1382394 ) ) ( not ( = ?auto_1382388 ?auto_1382395 ) ) ( not ( = ?auto_1382388 ?auto_1382396 ) ) ( not ( = ?auto_1382388 ?auto_1382397 ) ) ( not ( = ?auto_1382389 ?auto_1382390 ) ) ( not ( = ?auto_1382389 ?auto_1382391 ) ) ( not ( = ?auto_1382389 ?auto_1382392 ) ) ( not ( = ?auto_1382389 ?auto_1382393 ) ) ( not ( = ?auto_1382389 ?auto_1382394 ) ) ( not ( = ?auto_1382389 ?auto_1382395 ) ) ( not ( = ?auto_1382389 ?auto_1382396 ) ) ( not ( = ?auto_1382389 ?auto_1382397 ) ) ( not ( = ?auto_1382390 ?auto_1382391 ) ) ( not ( = ?auto_1382390 ?auto_1382392 ) ) ( not ( = ?auto_1382390 ?auto_1382393 ) ) ( not ( = ?auto_1382390 ?auto_1382394 ) ) ( not ( = ?auto_1382390 ?auto_1382395 ) ) ( not ( = ?auto_1382390 ?auto_1382396 ) ) ( not ( = ?auto_1382390 ?auto_1382397 ) ) ( not ( = ?auto_1382391 ?auto_1382392 ) ) ( not ( = ?auto_1382391 ?auto_1382393 ) ) ( not ( = ?auto_1382391 ?auto_1382394 ) ) ( not ( = ?auto_1382391 ?auto_1382395 ) ) ( not ( = ?auto_1382391 ?auto_1382396 ) ) ( not ( = ?auto_1382391 ?auto_1382397 ) ) ( not ( = ?auto_1382392 ?auto_1382393 ) ) ( not ( = ?auto_1382392 ?auto_1382394 ) ) ( not ( = ?auto_1382392 ?auto_1382395 ) ) ( not ( = ?auto_1382392 ?auto_1382396 ) ) ( not ( = ?auto_1382392 ?auto_1382397 ) ) ( not ( = ?auto_1382393 ?auto_1382394 ) ) ( not ( = ?auto_1382393 ?auto_1382395 ) ) ( not ( = ?auto_1382393 ?auto_1382396 ) ) ( not ( = ?auto_1382393 ?auto_1382397 ) ) ( not ( = ?auto_1382394 ?auto_1382395 ) ) ( not ( = ?auto_1382394 ?auto_1382396 ) ) ( not ( = ?auto_1382394 ?auto_1382397 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1382395 ?auto_1382396 ?auto_1382397 )
      ( MAKE-12CRATE-VERIFY ?auto_1382385 ?auto_1382386 ?auto_1382387 ?auto_1382388 ?auto_1382389 ?auto_1382390 ?auto_1382391 ?auto_1382392 ?auto_1382393 ?auto_1382394 ?auto_1382395 ?auto_1382396 ?auto_1382397 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1382547 - SURFACE
      ?auto_1382548 - SURFACE
      ?auto_1382549 - SURFACE
      ?auto_1382550 - SURFACE
      ?auto_1382551 - SURFACE
      ?auto_1382552 - SURFACE
      ?auto_1382553 - SURFACE
      ?auto_1382554 - SURFACE
      ?auto_1382555 - SURFACE
      ?auto_1382556 - SURFACE
      ?auto_1382557 - SURFACE
      ?auto_1382558 - SURFACE
      ?auto_1382559 - SURFACE
    )
    :vars
    (
      ?auto_1382563 - HOIST
      ?auto_1382564 - PLACE
      ?auto_1382565 - TRUCK
      ?auto_1382560 - PLACE
      ?auto_1382562 - HOIST
      ?auto_1382561 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1382563 ?auto_1382564 ) ( SURFACE-AT ?auto_1382558 ?auto_1382564 ) ( CLEAR ?auto_1382558 ) ( IS-CRATE ?auto_1382559 ) ( not ( = ?auto_1382558 ?auto_1382559 ) ) ( AVAILABLE ?auto_1382563 ) ( ON ?auto_1382558 ?auto_1382557 ) ( not ( = ?auto_1382557 ?auto_1382558 ) ) ( not ( = ?auto_1382557 ?auto_1382559 ) ) ( TRUCK-AT ?auto_1382565 ?auto_1382560 ) ( not ( = ?auto_1382560 ?auto_1382564 ) ) ( HOIST-AT ?auto_1382562 ?auto_1382560 ) ( not ( = ?auto_1382563 ?auto_1382562 ) ) ( AVAILABLE ?auto_1382562 ) ( SURFACE-AT ?auto_1382559 ?auto_1382560 ) ( ON ?auto_1382559 ?auto_1382561 ) ( CLEAR ?auto_1382559 ) ( not ( = ?auto_1382558 ?auto_1382561 ) ) ( not ( = ?auto_1382559 ?auto_1382561 ) ) ( not ( = ?auto_1382557 ?auto_1382561 ) ) ( ON ?auto_1382548 ?auto_1382547 ) ( ON ?auto_1382549 ?auto_1382548 ) ( ON ?auto_1382550 ?auto_1382549 ) ( ON ?auto_1382551 ?auto_1382550 ) ( ON ?auto_1382552 ?auto_1382551 ) ( ON ?auto_1382553 ?auto_1382552 ) ( ON ?auto_1382554 ?auto_1382553 ) ( ON ?auto_1382555 ?auto_1382554 ) ( ON ?auto_1382556 ?auto_1382555 ) ( ON ?auto_1382557 ?auto_1382556 ) ( not ( = ?auto_1382547 ?auto_1382548 ) ) ( not ( = ?auto_1382547 ?auto_1382549 ) ) ( not ( = ?auto_1382547 ?auto_1382550 ) ) ( not ( = ?auto_1382547 ?auto_1382551 ) ) ( not ( = ?auto_1382547 ?auto_1382552 ) ) ( not ( = ?auto_1382547 ?auto_1382553 ) ) ( not ( = ?auto_1382547 ?auto_1382554 ) ) ( not ( = ?auto_1382547 ?auto_1382555 ) ) ( not ( = ?auto_1382547 ?auto_1382556 ) ) ( not ( = ?auto_1382547 ?auto_1382557 ) ) ( not ( = ?auto_1382547 ?auto_1382558 ) ) ( not ( = ?auto_1382547 ?auto_1382559 ) ) ( not ( = ?auto_1382547 ?auto_1382561 ) ) ( not ( = ?auto_1382548 ?auto_1382549 ) ) ( not ( = ?auto_1382548 ?auto_1382550 ) ) ( not ( = ?auto_1382548 ?auto_1382551 ) ) ( not ( = ?auto_1382548 ?auto_1382552 ) ) ( not ( = ?auto_1382548 ?auto_1382553 ) ) ( not ( = ?auto_1382548 ?auto_1382554 ) ) ( not ( = ?auto_1382548 ?auto_1382555 ) ) ( not ( = ?auto_1382548 ?auto_1382556 ) ) ( not ( = ?auto_1382548 ?auto_1382557 ) ) ( not ( = ?auto_1382548 ?auto_1382558 ) ) ( not ( = ?auto_1382548 ?auto_1382559 ) ) ( not ( = ?auto_1382548 ?auto_1382561 ) ) ( not ( = ?auto_1382549 ?auto_1382550 ) ) ( not ( = ?auto_1382549 ?auto_1382551 ) ) ( not ( = ?auto_1382549 ?auto_1382552 ) ) ( not ( = ?auto_1382549 ?auto_1382553 ) ) ( not ( = ?auto_1382549 ?auto_1382554 ) ) ( not ( = ?auto_1382549 ?auto_1382555 ) ) ( not ( = ?auto_1382549 ?auto_1382556 ) ) ( not ( = ?auto_1382549 ?auto_1382557 ) ) ( not ( = ?auto_1382549 ?auto_1382558 ) ) ( not ( = ?auto_1382549 ?auto_1382559 ) ) ( not ( = ?auto_1382549 ?auto_1382561 ) ) ( not ( = ?auto_1382550 ?auto_1382551 ) ) ( not ( = ?auto_1382550 ?auto_1382552 ) ) ( not ( = ?auto_1382550 ?auto_1382553 ) ) ( not ( = ?auto_1382550 ?auto_1382554 ) ) ( not ( = ?auto_1382550 ?auto_1382555 ) ) ( not ( = ?auto_1382550 ?auto_1382556 ) ) ( not ( = ?auto_1382550 ?auto_1382557 ) ) ( not ( = ?auto_1382550 ?auto_1382558 ) ) ( not ( = ?auto_1382550 ?auto_1382559 ) ) ( not ( = ?auto_1382550 ?auto_1382561 ) ) ( not ( = ?auto_1382551 ?auto_1382552 ) ) ( not ( = ?auto_1382551 ?auto_1382553 ) ) ( not ( = ?auto_1382551 ?auto_1382554 ) ) ( not ( = ?auto_1382551 ?auto_1382555 ) ) ( not ( = ?auto_1382551 ?auto_1382556 ) ) ( not ( = ?auto_1382551 ?auto_1382557 ) ) ( not ( = ?auto_1382551 ?auto_1382558 ) ) ( not ( = ?auto_1382551 ?auto_1382559 ) ) ( not ( = ?auto_1382551 ?auto_1382561 ) ) ( not ( = ?auto_1382552 ?auto_1382553 ) ) ( not ( = ?auto_1382552 ?auto_1382554 ) ) ( not ( = ?auto_1382552 ?auto_1382555 ) ) ( not ( = ?auto_1382552 ?auto_1382556 ) ) ( not ( = ?auto_1382552 ?auto_1382557 ) ) ( not ( = ?auto_1382552 ?auto_1382558 ) ) ( not ( = ?auto_1382552 ?auto_1382559 ) ) ( not ( = ?auto_1382552 ?auto_1382561 ) ) ( not ( = ?auto_1382553 ?auto_1382554 ) ) ( not ( = ?auto_1382553 ?auto_1382555 ) ) ( not ( = ?auto_1382553 ?auto_1382556 ) ) ( not ( = ?auto_1382553 ?auto_1382557 ) ) ( not ( = ?auto_1382553 ?auto_1382558 ) ) ( not ( = ?auto_1382553 ?auto_1382559 ) ) ( not ( = ?auto_1382553 ?auto_1382561 ) ) ( not ( = ?auto_1382554 ?auto_1382555 ) ) ( not ( = ?auto_1382554 ?auto_1382556 ) ) ( not ( = ?auto_1382554 ?auto_1382557 ) ) ( not ( = ?auto_1382554 ?auto_1382558 ) ) ( not ( = ?auto_1382554 ?auto_1382559 ) ) ( not ( = ?auto_1382554 ?auto_1382561 ) ) ( not ( = ?auto_1382555 ?auto_1382556 ) ) ( not ( = ?auto_1382555 ?auto_1382557 ) ) ( not ( = ?auto_1382555 ?auto_1382558 ) ) ( not ( = ?auto_1382555 ?auto_1382559 ) ) ( not ( = ?auto_1382555 ?auto_1382561 ) ) ( not ( = ?auto_1382556 ?auto_1382557 ) ) ( not ( = ?auto_1382556 ?auto_1382558 ) ) ( not ( = ?auto_1382556 ?auto_1382559 ) ) ( not ( = ?auto_1382556 ?auto_1382561 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1382557 ?auto_1382558 ?auto_1382559 )
      ( MAKE-12CRATE-VERIFY ?auto_1382547 ?auto_1382548 ?auto_1382549 ?auto_1382550 ?auto_1382551 ?auto_1382552 ?auto_1382553 ?auto_1382554 ?auto_1382555 ?auto_1382556 ?auto_1382557 ?auto_1382558 ?auto_1382559 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1382710 - SURFACE
      ?auto_1382711 - SURFACE
      ?auto_1382712 - SURFACE
      ?auto_1382713 - SURFACE
      ?auto_1382714 - SURFACE
      ?auto_1382715 - SURFACE
      ?auto_1382716 - SURFACE
      ?auto_1382717 - SURFACE
      ?auto_1382718 - SURFACE
      ?auto_1382719 - SURFACE
      ?auto_1382720 - SURFACE
      ?auto_1382721 - SURFACE
      ?auto_1382722 - SURFACE
    )
    :vars
    (
      ?auto_1382726 - HOIST
      ?auto_1382728 - PLACE
      ?auto_1382724 - PLACE
      ?auto_1382725 - HOIST
      ?auto_1382727 - SURFACE
      ?auto_1382723 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1382726 ?auto_1382728 ) ( SURFACE-AT ?auto_1382721 ?auto_1382728 ) ( CLEAR ?auto_1382721 ) ( IS-CRATE ?auto_1382722 ) ( not ( = ?auto_1382721 ?auto_1382722 ) ) ( AVAILABLE ?auto_1382726 ) ( ON ?auto_1382721 ?auto_1382720 ) ( not ( = ?auto_1382720 ?auto_1382721 ) ) ( not ( = ?auto_1382720 ?auto_1382722 ) ) ( not ( = ?auto_1382724 ?auto_1382728 ) ) ( HOIST-AT ?auto_1382725 ?auto_1382724 ) ( not ( = ?auto_1382726 ?auto_1382725 ) ) ( AVAILABLE ?auto_1382725 ) ( SURFACE-AT ?auto_1382722 ?auto_1382724 ) ( ON ?auto_1382722 ?auto_1382727 ) ( CLEAR ?auto_1382722 ) ( not ( = ?auto_1382721 ?auto_1382727 ) ) ( not ( = ?auto_1382722 ?auto_1382727 ) ) ( not ( = ?auto_1382720 ?auto_1382727 ) ) ( TRUCK-AT ?auto_1382723 ?auto_1382728 ) ( ON ?auto_1382711 ?auto_1382710 ) ( ON ?auto_1382712 ?auto_1382711 ) ( ON ?auto_1382713 ?auto_1382712 ) ( ON ?auto_1382714 ?auto_1382713 ) ( ON ?auto_1382715 ?auto_1382714 ) ( ON ?auto_1382716 ?auto_1382715 ) ( ON ?auto_1382717 ?auto_1382716 ) ( ON ?auto_1382718 ?auto_1382717 ) ( ON ?auto_1382719 ?auto_1382718 ) ( ON ?auto_1382720 ?auto_1382719 ) ( not ( = ?auto_1382710 ?auto_1382711 ) ) ( not ( = ?auto_1382710 ?auto_1382712 ) ) ( not ( = ?auto_1382710 ?auto_1382713 ) ) ( not ( = ?auto_1382710 ?auto_1382714 ) ) ( not ( = ?auto_1382710 ?auto_1382715 ) ) ( not ( = ?auto_1382710 ?auto_1382716 ) ) ( not ( = ?auto_1382710 ?auto_1382717 ) ) ( not ( = ?auto_1382710 ?auto_1382718 ) ) ( not ( = ?auto_1382710 ?auto_1382719 ) ) ( not ( = ?auto_1382710 ?auto_1382720 ) ) ( not ( = ?auto_1382710 ?auto_1382721 ) ) ( not ( = ?auto_1382710 ?auto_1382722 ) ) ( not ( = ?auto_1382710 ?auto_1382727 ) ) ( not ( = ?auto_1382711 ?auto_1382712 ) ) ( not ( = ?auto_1382711 ?auto_1382713 ) ) ( not ( = ?auto_1382711 ?auto_1382714 ) ) ( not ( = ?auto_1382711 ?auto_1382715 ) ) ( not ( = ?auto_1382711 ?auto_1382716 ) ) ( not ( = ?auto_1382711 ?auto_1382717 ) ) ( not ( = ?auto_1382711 ?auto_1382718 ) ) ( not ( = ?auto_1382711 ?auto_1382719 ) ) ( not ( = ?auto_1382711 ?auto_1382720 ) ) ( not ( = ?auto_1382711 ?auto_1382721 ) ) ( not ( = ?auto_1382711 ?auto_1382722 ) ) ( not ( = ?auto_1382711 ?auto_1382727 ) ) ( not ( = ?auto_1382712 ?auto_1382713 ) ) ( not ( = ?auto_1382712 ?auto_1382714 ) ) ( not ( = ?auto_1382712 ?auto_1382715 ) ) ( not ( = ?auto_1382712 ?auto_1382716 ) ) ( not ( = ?auto_1382712 ?auto_1382717 ) ) ( not ( = ?auto_1382712 ?auto_1382718 ) ) ( not ( = ?auto_1382712 ?auto_1382719 ) ) ( not ( = ?auto_1382712 ?auto_1382720 ) ) ( not ( = ?auto_1382712 ?auto_1382721 ) ) ( not ( = ?auto_1382712 ?auto_1382722 ) ) ( not ( = ?auto_1382712 ?auto_1382727 ) ) ( not ( = ?auto_1382713 ?auto_1382714 ) ) ( not ( = ?auto_1382713 ?auto_1382715 ) ) ( not ( = ?auto_1382713 ?auto_1382716 ) ) ( not ( = ?auto_1382713 ?auto_1382717 ) ) ( not ( = ?auto_1382713 ?auto_1382718 ) ) ( not ( = ?auto_1382713 ?auto_1382719 ) ) ( not ( = ?auto_1382713 ?auto_1382720 ) ) ( not ( = ?auto_1382713 ?auto_1382721 ) ) ( not ( = ?auto_1382713 ?auto_1382722 ) ) ( not ( = ?auto_1382713 ?auto_1382727 ) ) ( not ( = ?auto_1382714 ?auto_1382715 ) ) ( not ( = ?auto_1382714 ?auto_1382716 ) ) ( not ( = ?auto_1382714 ?auto_1382717 ) ) ( not ( = ?auto_1382714 ?auto_1382718 ) ) ( not ( = ?auto_1382714 ?auto_1382719 ) ) ( not ( = ?auto_1382714 ?auto_1382720 ) ) ( not ( = ?auto_1382714 ?auto_1382721 ) ) ( not ( = ?auto_1382714 ?auto_1382722 ) ) ( not ( = ?auto_1382714 ?auto_1382727 ) ) ( not ( = ?auto_1382715 ?auto_1382716 ) ) ( not ( = ?auto_1382715 ?auto_1382717 ) ) ( not ( = ?auto_1382715 ?auto_1382718 ) ) ( not ( = ?auto_1382715 ?auto_1382719 ) ) ( not ( = ?auto_1382715 ?auto_1382720 ) ) ( not ( = ?auto_1382715 ?auto_1382721 ) ) ( not ( = ?auto_1382715 ?auto_1382722 ) ) ( not ( = ?auto_1382715 ?auto_1382727 ) ) ( not ( = ?auto_1382716 ?auto_1382717 ) ) ( not ( = ?auto_1382716 ?auto_1382718 ) ) ( not ( = ?auto_1382716 ?auto_1382719 ) ) ( not ( = ?auto_1382716 ?auto_1382720 ) ) ( not ( = ?auto_1382716 ?auto_1382721 ) ) ( not ( = ?auto_1382716 ?auto_1382722 ) ) ( not ( = ?auto_1382716 ?auto_1382727 ) ) ( not ( = ?auto_1382717 ?auto_1382718 ) ) ( not ( = ?auto_1382717 ?auto_1382719 ) ) ( not ( = ?auto_1382717 ?auto_1382720 ) ) ( not ( = ?auto_1382717 ?auto_1382721 ) ) ( not ( = ?auto_1382717 ?auto_1382722 ) ) ( not ( = ?auto_1382717 ?auto_1382727 ) ) ( not ( = ?auto_1382718 ?auto_1382719 ) ) ( not ( = ?auto_1382718 ?auto_1382720 ) ) ( not ( = ?auto_1382718 ?auto_1382721 ) ) ( not ( = ?auto_1382718 ?auto_1382722 ) ) ( not ( = ?auto_1382718 ?auto_1382727 ) ) ( not ( = ?auto_1382719 ?auto_1382720 ) ) ( not ( = ?auto_1382719 ?auto_1382721 ) ) ( not ( = ?auto_1382719 ?auto_1382722 ) ) ( not ( = ?auto_1382719 ?auto_1382727 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1382720 ?auto_1382721 ?auto_1382722 )
      ( MAKE-12CRATE-VERIFY ?auto_1382710 ?auto_1382711 ?auto_1382712 ?auto_1382713 ?auto_1382714 ?auto_1382715 ?auto_1382716 ?auto_1382717 ?auto_1382718 ?auto_1382719 ?auto_1382720 ?auto_1382721 ?auto_1382722 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1382873 - SURFACE
      ?auto_1382874 - SURFACE
      ?auto_1382875 - SURFACE
      ?auto_1382876 - SURFACE
      ?auto_1382877 - SURFACE
      ?auto_1382878 - SURFACE
      ?auto_1382879 - SURFACE
      ?auto_1382880 - SURFACE
      ?auto_1382881 - SURFACE
      ?auto_1382882 - SURFACE
      ?auto_1382883 - SURFACE
      ?auto_1382884 - SURFACE
      ?auto_1382885 - SURFACE
    )
    :vars
    (
      ?auto_1382890 - HOIST
      ?auto_1382888 - PLACE
      ?auto_1382887 - PLACE
      ?auto_1382891 - HOIST
      ?auto_1382886 - SURFACE
      ?auto_1382889 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1382890 ?auto_1382888 ) ( IS-CRATE ?auto_1382885 ) ( not ( = ?auto_1382884 ?auto_1382885 ) ) ( not ( = ?auto_1382883 ?auto_1382884 ) ) ( not ( = ?auto_1382883 ?auto_1382885 ) ) ( not ( = ?auto_1382887 ?auto_1382888 ) ) ( HOIST-AT ?auto_1382891 ?auto_1382887 ) ( not ( = ?auto_1382890 ?auto_1382891 ) ) ( AVAILABLE ?auto_1382891 ) ( SURFACE-AT ?auto_1382885 ?auto_1382887 ) ( ON ?auto_1382885 ?auto_1382886 ) ( CLEAR ?auto_1382885 ) ( not ( = ?auto_1382884 ?auto_1382886 ) ) ( not ( = ?auto_1382885 ?auto_1382886 ) ) ( not ( = ?auto_1382883 ?auto_1382886 ) ) ( TRUCK-AT ?auto_1382889 ?auto_1382888 ) ( SURFACE-AT ?auto_1382883 ?auto_1382888 ) ( CLEAR ?auto_1382883 ) ( LIFTING ?auto_1382890 ?auto_1382884 ) ( IS-CRATE ?auto_1382884 ) ( ON ?auto_1382874 ?auto_1382873 ) ( ON ?auto_1382875 ?auto_1382874 ) ( ON ?auto_1382876 ?auto_1382875 ) ( ON ?auto_1382877 ?auto_1382876 ) ( ON ?auto_1382878 ?auto_1382877 ) ( ON ?auto_1382879 ?auto_1382878 ) ( ON ?auto_1382880 ?auto_1382879 ) ( ON ?auto_1382881 ?auto_1382880 ) ( ON ?auto_1382882 ?auto_1382881 ) ( ON ?auto_1382883 ?auto_1382882 ) ( not ( = ?auto_1382873 ?auto_1382874 ) ) ( not ( = ?auto_1382873 ?auto_1382875 ) ) ( not ( = ?auto_1382873 ?auto_1382876 ) ) ( not ( = ?auto_1382873 ?auto_1382877 ) ) ( not ( = ?auto_1382873 ?auto_1382878 ) ) ( not ( = ?auto_1382873 ?auto_1382879 ) ) ( not ( = ?auto_1382873 ?auto_1382880 ) ) ( not ( = ?auto_1382873 ?auto_1382881 ) ) ( not ( = ?auto_1382873 ?auto_1382882 ) ) ( not ( = ?auto_1382873 ?auto_1382883 ) ) ( not ( = ?auto_1382873 ?auto_1382884 ) ) ( not ( = ?auto_1382873 ?auto_1382885 ) ) ( not ( = ?auto_1382873 ?auto_1382886 ) ) ( not ( = ?auto_1382874 ?auto_1382875 ) ) ( not ( = ?auto_1382874 ?auto_1382876 ) ) ( not ( = ?auto_1382874 ?auto_1382877 ) ) ( not ( = ?auto_1382874 ?auto_1382878 ) ) ( not ( = ?auto_1382874 ?auto_1382879 ) ) ( not ( = ?auto_1382874 ?auto_1382880 ) ) ( not ( = ?auto_1382874 ?auto_1382881 ) ) ( not ( = ?auto_1382874 ?auto_1382882 ) ) ( not ( = ?auto_1382874 ?auto_1382883 ) ) ( not ( = ?auto_1382874 ?auto_1382884 ) ) ( not ( = ?auto_1382874 ?auto_1382885 ) ) ( not ( = ?auto_1382874 ?auto_1382886 ) ) ( not ( = ?auto_1382875 ?auto_1382876 ) ) ( not ( = ?auto_1382875 ?auto_1382877 ) ) ( not ( = ?auto_1382875 ?auto_1382878 ) ) ( not ( = ?auto_1382875 ?auto_1382879 ) ) ( not ( = ?auto_1382875 ?auto_1382880 ) ) ( not ( = ?auto_1382875 ?auto_1382881 ) ) ( not ( = ?auto_1382875 ?auto_1382882 ) ) ( not ( = ?auto_1382875 ?auto_1382883 ) ) ( not ( = ?auto_1382875 ?auto_1382884 ) ) ( not ( = ?auto_1382875 ?auto_1382885 ) ) ( not ( = ?auto_1382875 ?auto_1382886 ) ) ( not ( = ?auto_1382876 ?auto_1382877 ) ) ( not ( = ?auto_1382876 ?auto_1382878 ) ) ( not ( = ?auto_1382876 ?auto_1382879 ) ) ( not ( = ?auto_1382876 ?auto_1382880 ) ) ( not ( = ?auto_1382876 ?auto_1382881 ) ) ( not ( = ?auto_1382876 ?auto_1382882 ) ) ( not ( = ?auto_1382876 ?auto_1382883 ) ) ( not ( = ?auto_1382876 ?auto_1382884 ) ) ( not ( = ?auto_1382876 ?auto_1382885 ) ) ( not ( = ?auto_1382876 ?auto_1382886 ) ) ( not ( = ?auto_1382877 ?auto_1382878 ) ) ( not ( = ?auto_1382877 ?auto_1382879 ) ) ( not ( = ?auto_1382877 ?auto_1382880 ) ) ( not ( = ?auto_1382877 ?auto_1382881 ) ) ( not ( = ?auto_1382877 ?auto_1382882 ) ) ( not ( = ?auto_1382877 ?auto_1382883 ) ) ( not ( = ?auto_1382877 ?auto_1382884 ) ) ( not ( = ?auto_1382877 ?auto_1382885 ) ) ( not ( = ?auto_1382877 ?auto_1382886 ) ) ( not ( = ?auto_1382878 ?auto_1382879 ) ) ( not ( = ?auto_1382878 ?auto_1382880 ) ) ( not ( = ?auto_1382878 ?auto_1382881 ) ) ( not ( = ?auto_1382878 ?auto_1382882 ) ) ( not ( = ?auto_1382878 ?auto_1382883 ) ) ( not ( = ?auto_1382878 ?auto_1382884 ) ) ( not ( = ?auto_1382878 ?auto_1382885 ) ) ( not ( = ?auto_1382878 ?auto_1382886 ) ) ( not ( = ?auto_1382879 ?auto_1382880 ) ) ( not ( = ?auto_1382879 ?auto_1382881 ) ) ( not ( = ?auto_1382879 ?auto_1382882 ) ) ( not ( = ?auto_1382879 ?auto_1382883 ) ) ( not ( = ?auto_1382879 ?auto_1382884 ) ) ( not ( = ?auto_1382879 ?auto_1382885 ) ) ( not ( = ?auto_1382879 ?auto_1382886 ) ) ( not ( = ?auto_1382880 ?auto_1382881 ) ) ( not ( = ?auto_1382880 ?auto_1382882 ) ) ( not ( = ?auto_1382880 ?auto_1382883 ) ) ( not ( = ?auto_1382880 ?auto_1382884 ) ) ( not ( = ?auto_1382880 ?auto_1382885 ) ) ( not ( = ?auto_1382880 ?auto_1382886 ) ) ( not ( = ?auto_1382881 ?auto_1382882 ) ) ( not ( = ?auto_1382881 ?auto_1382883 ) ) ( not ( = ?auto_1382881 ?auto_1382884 ) ) ( not ( = ?auto_1382881 ?auto_1382885 ) ) ( not ( = ?auto_1382881 ?auto_1382886 ) ) ( not ( = ?auto_1382882 ?auto_1382883 ) ) ( not ( = ?auto_1382882 ?auto_1382884 ) ) ( not ( = ?auto_1382882 ?auto_1382885 ) ) ( not ( = ?auto_1382882 ?auto_1382886 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1382883 ?auto_1382884 ?auto_1382885 )
      ( MAKE-12CRATE-VERIFY ?auto_1382873 ?auto_1382874 ?auto_1382875 ?auto_1382876 ?auto_1382877 ?auto_1382878 ?auto_1382879 ?auto_1382880 ?auto_1382881 ?auto_1382882 ?auto_1382883 ?auto_1382884 ?auto_1382885 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1383036 - SURFACE
      ?auto_1383037 - SURFACE
      ?auto_1383038 - SURFACE
      ?auto_1383039 - SURFACE
      ?auto_1383040 - SURFACE
      ?auto_1383041 - SURFACE
      ?auto_1383042 - SURFACE
      ?auto_1383043 - SURFACE
      ?auto_1383044 - SURFACE
      ?auto_1383045 - SURFACE
      ?auto_1383046 - SURFACE
      ?auto_1383047 - SURFACE
      ?auto_1383048 - SURFACE
    )
    :vars
    (
      ?auto_1383054 - HOIST
      ?auto_1383052 - PLACE
      ?auto_1383049 - PLACE
      ?auto_1383051 - HOIST
      ?auto_1383053 - SURFACE
      ?auto_1383050 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1383054 ?auto_1383052 ) ( IS-CRATE ?auto_1383048 ) ( not ( = ?auto_1383047 ?auto_1383048 ) ) ( not ( = ?auto_1383046 ?auto_1383047 ) ) ( not ( = ?auto_1383046 ?auto_1383048 ) ) ( not ( = ?auto_1383049 ?auto_1383052 ) ) ( HOIST-AT ?auto_1383051 ?auto_1383049 ) ( not ( = ?auto_1383054 ?auto_1383051 ) ) ( AVAILABLE ?auto_1383051 ) ( SURFACE-AT ?auto_1383048 ?auto_1383049 ) ( ON ?auto_1383048 ?auto_1383053 ) ( CLEAR ?auto_1383048 ) ( not ( = ?auto_1383047 ?auto_1383053 ) ) ( not ( = ?auto_1383048 ?auto_1383053 ) ) ( not ( = ?auto_1383046 ?auto_1383053 ) ) ( TRUCK-AT ?auto_1383050 ?auto_1383052 ) ( SURFACE-AT ?auto_1383046 ?auto_1383052 ) ( CLEAR ?auto_1383046 ) ( IS-CRATE ?auto_1383047 ) ( AVAILABLE ?auto_1383054 ) ( IN ?auto_1383047 ?auto_1383050 ) ( ON ?auto_1383037 ?auto_1383036 ) ( ON ?auto_1383038 ?auto_1383037 ) ( ON ?auto_1383039 ?auto_1383038 ) ( ON ?auto_1383040 ?auto_1383039 ) ( ON ?auto_1383041 ?auto_1383040 ) ( ON ?auto_1383042 ?auto_1383041 ) ( ON ?auto_1383043 ?auto_1383042 ) ( ON ?auto_1383044 ?auto_1383043 ) ( ON ?auto_1383045 ?auto_1383044 ) ( ON ?auto_1383046 ?auto_1383045 ) ( not ( = ?auto_1383036 ?auto_1383037 ) ) ( not ( = ?auto_1383036 ?auto_1383038 ) ) ( not ( = ?auto_1383036 ?auto_1383039 ) ) ( not ( = ?auto_1383036 ?auto_1383040 ) ) ( not ( = ?auto_1383036 ?auto_1383041 ) ) ( not ( = ?auto_1383036 ?auto_1383042 ) ) ( not ( = ?auto_1383036 ?auto_1383043 ) ) ( not ( = ?auto_1383036 ?auto_1383044 ) ) ( not ( = ?auto_1383036 ?auto_1383045 ) ) ( not ( = ?auto_1383036 ?auto_1383046 ) ) ( not ( = ?auto_1383036 ?auto_1383047 ) ) ( not ( = ?auto_1383036 ?auto_1383048 ) ) ( not ( = ?auto_1383036 ?auto_1383053 ) ) ( not ( = ?auto_1383037 ?auto_1383038 ) ) ( not ( = ?auto_1383037 ?auto_1383039 ) ) ( not ( = ?auto_1383037 ?auto_1383040 ) ) ( not ( = ?auto_1383037 ?auto_1383041 ) ) ( not ( = ?auto_1383037 ?auto_1383042 ) ) ( not ( = ?auto_1383037 ?auto_1383043 ) ) ( not ( = ?auto_1383037 ?auto_1383044 ) ) ( not ( = ?auto_1383037 ?auto_1383045 ) ) ( not ( = ?auto_1383037 ?auto_1383046 ) ) ( not ( = ?auto_1383037 ?auto_1383047 ) ) ( not ( = ?auto_1383037 ?auto_1383048 ) ) ( not ( = ?auto_1383037 ?auto_1383053 ) ) ( not ( = ?auto_1383038 ?auto_1383039 ) ) ( not ( = ?auto_1383038 ?auto_1383040 ) ) ( not ( = ?auto_1383038 ?auto_1383041 ) ) ( not ( = ?auto_1383038 ?auto_1383042 ) ) ( not ( = ?auto_1383038 ?auto_1383043 ) ) ( not ( = ?auto_1383038 ?auto_1383044 ) ) ( not ( = ?auto_1383038 ?auto_1383045 ) ) ( not ( = ?auto_1383038 ?auto_1383046 ) ) ( not ( = ?auto_1383038 ?auto_1383047 ) ) ( not ( = ?auto_1383038 ?auto_1383048 ) ) ( not ( = ?auto_1383038 ?auto_1383053 ) ) ( not ( = ?auto_1383039 ?auto_1383040 ) ) ( not ( = ?auto_1383039 ?auto_1383041 ) ) ( not ( = ?auto_1383039 ?auto_1383042 ) ) ( not ( = ?auto_1383039 ?auto_1383043 ) ) ( not ( = ?auto_1383039 ?auto_1383044 ) ) ( not ( = ?auto_1383039 ?auto_1383045 ) ) ( not ( = ?auto_1383039 ?auto_1383046 ) ) ( not ( = ?auto_1383039 ?auto_1383047 ) ) ( not ( = ?auto_1383039 ?auto_1383048 ) ) ( not ( = ?auto_1383039 ?auto_1383053 ) ) ( not ( = ?auto_1383040 ?auto_1383041 ) ) ( not ( = ?auto_1383040 ?auto_1383042 ) ) ( not ( = ?auto_1383040 ?auto_1383043 ) ) ( not ( = ?auto_1383040 ?auto_1383044 ) ) ( not ( = ?auto_1383040 ?auto_1383045 ) ) ( not ( = ?auto_1383040 ?auto_1383046 ) ) ( not ( = ?auto_1383040 ?auto_1383047 ) ) ( not ( = ?auto_1383040 ?auto_1383048 ) ) ( not ( = ?auto_1383040 ?auto_1383053 ) ) ( not ( = ?auto_1383041 ?auto_1383042 ) ) ( not ( = ?auto_1383041 ?auto_1383043 ) ) ( not ( = ?auto_1383041 ?auto_1383044 ) ) ( not ( = ?auto_1383041 ?auto_1383045 ) ) ( not ( = ?auto_1383041 ?auto_1383046 ) ) ( not ( = ?auto_1383041 ?auto_1383047 ) ) ( not ( = ?auto_1383041 ?auto_1383048 ) ) ( not ( = ?auto_1383041 ?auto_1383053 ) ) ( not ( = ?auto_1383042 ?auto_1383043 ) ) ( not ( = ?auto_1383042 ?auto_1383044 ) ) ( not ( = ?auto_1383042 ?auto_1383045 ) ) ( not ( = ?auto_1383042 ?auto_1383046 ) ) ( not ( = ?auto_1383042 ?auto_1383047 ) ) ( not ( = ?auto_1383042 ?auto_1383048 ) ) ( not ( = ?auto_1383042 ?auto_1383053 ) ) ( not ( = ?auto_1383043 ?auto_1383044 ) ) ( not ( = ?auto_1383043 ?auto_1383045 ) ) ( not ( = ?auto_1383043 ?auto_1383046 ) ) ( not ( = ?auto_1383043 ?auto_1383047 ) ) ( not ( = ?auto_1383043 ?auto_1383048 ) ) ( not ( = ?auto_1383043 ?auto_1383053 ) ) ( not ( = ?auto_1383044 ?auto_1383045 ) ) ( not ( = ?auto_1383044 ?auto_1383046 ) ) ( not ( = ?auto_1383044 ?auto_1383047 ) ) ( not ( = ?auto_1383044 ?auto_1383048 ) ) ( not ( = ?auto_1383044 ?auto_1383053 ) ) ( not ( = ?auto_1383045 ?auto_1383046 ) ) ( not ( = ?auto_1383045 ?auto_1383047 ) ) ( not ( = ?auto_1383045 ?auto_1383048 ) ) ( not ( = ?auto_1383045 ?auto_1383053 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1383046 ?auto_1383047 ?auto_1383048 )
      ( MAKE-12CRATE-VERIFY ?auto_1383036 ?auto_1383037 ?auto_1383038 ?auto_1383039 ?auto_1383040 ?auto_1383041 ?auto_1383042 ?auto_1383043 ?auto_1383044 ?auto_1383045 ?auto_1383046 ?auto_1383047 ?auto_1383048 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1394616 - SURFACE
      ?auto_1394617 - SURFACE
      ?auto_1394618 - SURFACE
      ?auto_1394619 - SURFACE
      ?auto_1394620 - SURFACE
      ?auto_1394621 - SURFACE
      ?auto_1394622 - SURFACE
      ?auto_1394623 - SURFACE
      ?auto_1394624 - SURFACE
      ?auto_1394625 - SURFACE
      ?auto_1394626 - SURFACE
      ?auto_1394627 - SURFACE
      ?auto_1394628 - SURFACE
      ?auto_1394629 - SURFACE
    )
    :vars
    (
      ?auto_1394630 - HOIST
      ?auto_1394631 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1394630 ?auto_1394631 ) ( SURFACE-AT ?auto_1394628 ?auto_1394631 ) ( CLEAR ?auto_1394628 ) ( LIFTING ?auto_1394630 ?auto_1394629 ) ( IS-CRATE ?auto_1394629 ) ( not ( = ?auto_1394628 ?auto_1394629 ) ) ( ON ?auto_1394617 ?auto_1394616 ) ( ON ?auto_1394618 ?auto_1394617 ) ( ON ?auto_1394619 ?auto_1394618 ) ( ON ?auto_1394620 ?auto_1394619 ) ( ON ?auto_1394621 ?auto_1394620 ) ( ON ?auto_1394622 ?auto_1394621 ) ( ON ?auto_1394623 ?auto_1394622 ) ( ON ?auto_1394624 ?auto_1394623 ) ( ON ?auto_1394625 ?auto_1394624 ) ( ON ?auto_1394626 ?auto_1394625 ) ( ON ?auto_1394627 ?auto_1394626 ) ( ON ?auto_1394628 ?auto_1394627 ) ( not ( = ?auto_1394616 ?auto_1394617 ) ) ( not ( = ?auto_1394616 ?auto_1394618 ) ) ( not ( = ?auto_1394616 ?auto_1394619 ) ) ( not ( = ?auto_1394616 ?auto_1394620 ) ) ( not ( = ?auto_1394616 ?auto_1394621 ) ) ( not ( = ?auto_1394616 ?auto_1394622 ) ) ( not ( = ?auto_1394616 ?auto_1394623 ) ) ( not ( = ?auto_1394616 ?auto_1394624 ) ) ( not ( = ?auto_1394616 ?auto_1394625 ) ) ( not ( = ?auto_1394616 ?auto_1394626 ) ) ( not ( = ?auto_1394616 ?auto_1394627 ) ) ( not ( = ?auto_1394616 ?auto_1394628 ) ) ( not ( = ?auto_1394616 ?auto_1394629 ) ) ( not ( = ?auto_1394617 ?auto_1394618 ) ) ( not ( = ?auto_1394617 ?auto_1394619 ) ) ( not ( = ?auto_1394617 ?auto_1394620 ) ) ( not ( = ?auto_1394617 ?auto_1394621 ) ) ( not ( = ?auto_1394617 ?auto_1394622 ) ) ( not ( = ?auto_1394617 ?auto_1394623 ) ) ( not ( = ?auto_1394617 ?auto_1394624 ) ) ( not ( = ?auto_1394617 ?auto_1394625 ) ) ( not ( = ?auto_1394617 ?auto_1394626 ) ) ( not ( = ?auto_1394617 ?auto_1394627 ) ) ( not ( = ?auto_1394617 ?auto_1394628 ) ) ( not ( = ?auto_1394617 ?auto_1394629 ) ) ( not ( = ?auto_1394618 ?auto_1394619 ) ) ( not ( = ?auto_1394618 ?auto_1394620 ) ) ( not ( = ?auto_1394618 ?auto_1394621 ) ) ( not ( = ?auto_1394618 ?auto_1394622 ) ) ( not ( = ?auto_1394618 ?auto_1394623 ) ) ( not ( = ?auto_1394618 ?auto_1394624 ) ) ( not ( = ?auto_1394618 ?auto_1394625 ) ) ( not ( = ?auto_1394618 ?auto_1394626 ) ) ( not ( = ?auto_1394618 ?auto_1394627 ) ) ( not ( = ?auto_1394618 ?auto_1394628 ) ) ( not ( = ?auto_1394618 ?auto_1394629 ) ) ( not ( = ?auto_1394619 ?auto_1394620 ) ) ( not ( = ?auto_1394619 ?auto_1394621 ) ) ( not ( = ?auto_1394619 ?auto_1394622 ) ) ( not ( = ?auto_1394619 ?auto_1394623 ) ) ( not ( = ?auto_1394619 ?auto_1394624 ) ) ( not ( = ?auto_1394619 ?auto_1394625 ) ) ( not ( = ?auto_1394619 ?auto_1394626 ) ) ( not ( = ?auto_1394619 ?auto_1394627 ) ) ( not ( = ?auto_1394619 ?auto_1394628 ) ) ( not ( = ?auto_1394619 ?auto_1394629 ) ) ( not ( = ?auto_1394620 ?auto_1394621 ) ) ( not ( = ?auto_1394620 ?auto_1394622 ) ) ( not ( = ?auto_1394620 ?auto_1394623 ) ) ( not ( = ?auto_1394620 ?auto_1394624 ) ) ( not ( = ?auto_1394620 ?auto_1394625 ) ) ( not ( = ?auto_1394620 ?auto_1394626 ) ) ( not ( = ?auto_1394620 ?auto_1394627 ) ) ( not ( = ?auto_1394620 ?auto_1394628 ) ) ( not ( = ?auto_1394620 ?auto_1394629 ) ) ( not ( = ?auto_1394621 ?auto_1394622 ) ) ( not ( = ?auto_1394621 ?auto_1394623 ) ) ( not ( = ?auto_1394621 ?auto_1394624 ) ) ( not ( = ?auto_1394621 ?auto_1394625 ) ) ( not ( = ?auto_1394621 ?auto_1394626 ) ) ( not ( = ?auto_1394621 ?auto_1394627 ) ) ( not ( = ?auto_1394621 ?auto_1394628 ) ) ( not ( = ?auto_1394621 ?auto_1394629 ) ) ( not ( = ?auto_1394622 ?auto_1394623 ) ) ( not ( = ?auto_1394622 ?auto_1394624 ) ) ( not ( = ?auto_1394622 ?auto_1394625 ) ) ( not ( = ?auto_1394622 ?auto_1394626 ) ) ( not ( = ?auto_1394622 ?auto_1394627 ) ) ( not ( = ?auto_1394622 ?auto_1394628 ) ) ( not ( = ?auto_1394622 ?auto_1394629 ) ) ( not ( = ?auto_1394623 ?auto_1394624 ) ) ( not ( = ?auto_1394623 ?auto_1394625 ) ) ( not ( = ?auto_1394623 ?auto_1394626 ) ) ( not ( = ?auto_1394623 ?auto_1394627 ) ) ( not ( = ?auto_1394623 ?auto_1394628 ) ) ( not ( = ?auto_1394623 ?auto_1394629 ) ) ( not ( = ?auto_1394624 ?auto_1394625 ) ) ( not ( = ?auto_1394624 ?auto_1394626 ) ) ( not ( = ?auto_1394624 ?auto_1394627 ) ) ( not ( = ?auto_1394624 ?auto_1394628 ) ) ( not ( = ?auto_1394624 ?auto_1394629 ) ) ( not ( = ?auto_1394625 ?auto_1394626 ) ) ( not ( = ?auto_1394625 ?auto_1394627 ) ) ( not ( = ?auto_1394625 ?auto_1394628 ) ) ( not ( = ?auto_1394625 ?auto_1394629 ) ) ( not ( = ?auto_1394626 ?auto_1394627 ) ) ( not ( = ?auto_1394626 ?auto_1394628 ) ) ( not ( = ?auto_1394626 ?auto_1394629 ) ) ( not ( = ?auto_1394627 ?auto_1394628 ) ) ( not ( = ?auto_1394627 ?auto_1394629 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1394628 ?auto_1394629 )
      ( MAKE-13CRATE-VERIFY ?auto_1394616 ?auto_1394617 ?auto_1394618 ?auto_1394619 ?auto_1394620 ?auto_1394621 ?auto_1394622 ?auto_1394623 ?auto_1394624 ?auto_1394625 ?auto_1394626 ?auto_1394627 ?auto_1394628 ?auto_1394629 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1394758 - SURFACE
      ?auto_1394759 - SURFACE
      ?auto_1394760 - SURFACE
      ?auto_1394761 - SURFACE
      ?auto_1394762 - SURFACE
      ?auto_1394763 - SURFACE
      ?auto_1394764 - SURFACE
      ?auto_1394765 - SURFACE
      ?auto_1394766 - SURFACE
      ?auto_1394767 - SURFACE
      ?auto_1394768 - SURFACE
      ?auto_1394769 - SURFACE
      ?auto_1394770 - SURFACE
      ?auto_1394771 - SURFACE
    )
    :vars
    (
      ?auto_1394772 - HOIST
      ?auto_1394773 - PLACE
      ?auto_1394774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1394772 ?auto_1394773 ) ( SURFACE-AT ?auto_1394770 ?auto_1394773 ) ( CLEAR ?auto_1394770 ) ( IS-CRATE ?auto_1394771 ) ( not ( = ?auto_1394770 ?auto_1394771 ) ) ( TRUCK-AT ?auto_1394774 ?auto_1394773 ) ( AVAILABLE ?auto_1394772 ) ( IN ?auto_1394771 ?auto_1394774 ) ( ON ?auto_1394770 ?auto_1394769 ) ( not ( = ?auto_1394769 ?auto_1394770 ) ) ( not ( = ?auto_1394769 ?auto_1394771 ) ) ( ON ?auto_1394759 ?auto_1394758 ) ( ON ?auto_1394760 ?auto_1394759 ) ( ON ?auto_1394761 ?auto_1394760 ) ( ON ?auto_1394762 ?auto_1394761 ) ( ON ?auto_1394763 ?auto_1394762 ) ( ON ?auto_1394764 ?auto_1394763 ) ( ON ?auto_1394765 ?auto_1394764 ) ( ON ?auto_1394766 ?auto_1394765 ) ( ON ?auto_1394767 ?auto_1394766 ) ( ON ?auto_1394768 ?auto_1394767 ) ( ON ?auto_1394769 ?auto_1394768 ) ( not ( = ?auto_1394758 ?auto_1394759 ) ) ( not ( = ?auto_1394758 ?auto_1394760 ) ) ( not ( = ?auto_1394758 ?auto_1394761 ) ) ( not ( = ?auto_1394758 ?auto_1394762 ) ) ( not ( = ?auto_1394758 ?auto_1394763 ) ) ( not ( = ?auto_1394758 ?auto_1394764 ) ) ( not ( = ?auto_1394758 ?auto_1394765 ) ) ( not ( = ?auto_1394758 ?auto_1394766 ) ) ( not ( = ?auto_1394758 ?auto_1394767 ) ) ( not ( = ?auto_1394758 ?auto_1394768 ) ) ( not ( = ?auto_1394758 ?auto_1394769 ) ) ( not ( = ?auto_1394758 ?auto_1394770 ) ) ( not ( = ?auto_1394758 ?auto_1394771 ) ) ( not ( = ?auto_1394759 ?auto_1394760 ) ) ( not ( = ?auto_1394759 ?auto_1394761 ) ) ( not ( = ?auto_1394759 ?auto_1394762 ) ) ( not ( = ?auto_1394759 ?auto_1394763 ) ) ( not ( = ?auto_1394759 ?auto_1394764 ) ) ( not ( = ?auto_1394759 ?auto_1394765 ) ) ( not ( = ?auto_1394759 ?auto_1394766 ) ) ( not ( = ?auto_1394759 ?auto_1394767 ) ) ( not ( = ?auto_1394759 ?auto_1394768 ) ) ( not ( = ?auto_1394759 ?auto_1394769 ) ) ( not ( = ?auto_1394759 ?auto_1394770 ) ) ( not ( = ?auto_1394759 ?auto_1394771 ) ) ( not ( = ?auto_1394760 ?auto_1394761 ) ) ( not ( = ?auto_1394760 ?auto_1394762 ) ) ( not ( = ?auto_1394760 ?auto_1394763 ) ) ( not ( = ?auto_1394760 ?auto_1394764 ) ) ( not ( = ?auto_1394760 ?auto_1394765 ) ) ( not ( = ?auto_1394760 ?auto_1394766 ) ) ( not ( = ?auto_1394760 ?auto_1394767 ) ) ( not ( = ?auto_1394760 ?auto_1394768 ) ) ( not ( = ?auto_1394760 ?auto_1394769 ) ) ( not ( = ?auto_1394760 ?auto_1394770 ) ) ( not ( = ?auto_1394760 ?auto_1394771 ) ) ( not ( = ?auto_1394761 ?auto_1394762 ) ) ( not ( = ?auto_1394761 ?auto_1394763 ) ) ( not ( = ?auto_1394761 ?auto_1394764 ) ) ( not ( = ?auto_1394761 ?auto_1394765 ) ) ( not ( = ?auto_1394761 ?auto_1394766 ) ) ( not ( = ?auto_1394761 ?auto_1394767 ) ) ( not ( = ?auto_1394761 ?auto_1394768 ) ) ( not ( = ?auto_1394761 ?auto_1394769 ) ) ( not ( = ?auto_1394761 ?auto_1394770 ) ) ( not ( = ?auto_1394761 ?auto_1394771 ) ) ( not ( = ?auto_1394762 ?auto_1394763 ) ) ( not ( = ?auto_1394762 ?auto_1394764 ) ) ( not ( = ?auto_1394762 ?auto_1394765 ) ) ( not ( = ?auto_1394762 ?auto_1394766 ) ) ( not ( = ?auto_1394762 ?auto_1394767 ) ) ( not ( = ?auto_1394762 ?auto_1394768 ) ) ( not ( = ?auto_1394762 ?auto_1394769 ) ) ( not ( = ?auto_1394762 ?auto_1394770 ) ) ( not ( = ?auto_1394762 ?auto_1394771 ) ) ( not ( = ?auto_1394763 ?auto_1394764 ) ) ( not ( = ?auto_1394763 ?auto_1394765 ) ) ( not ( = ?auto_1394763 ?auto_1394766 ) ) ( not ( = ?auto_1394763 ?auto_1394767 ) ) ( not ( = ?auto_1394763 ?auto_1394768 ) ) ( not ( = ?auto_1394763 ?auto_1394769 ) ) ( not ( = ?auto_1394763 ?auto_1394770 ) ) ( not ( = ?auto_1394763 ?auto_1394771 ) ) ( not ( = ?auto_1394764 ?auto_1394765 ) ) ( not ( = ?auto_1394764 ?auto_1394766 ) ) ( not ( = ?auto_1394764 ?auto_1394767 ) ) ( not ( = ?auto_1394764 ?auto_1394768 ) ) ( not ( = ?auto_1394764 ?auto_1394769 ) ) ( not ( = ?auto_1394764 ?auto_1394770 ) ) ( not ( = ?auto_1394764 ?auto_1394771 ) ) ( not ( = ?auto_1394765 ?auto_1394766 ) ) ( not ( = ?auto_1394765 ?auto_1394767 ) ) ( not ( = ?auto_1394765 ?auto_1394768 ) ) ( not ( = ?auto_1394765 ?auto_1394769 ) ) ( not ( = ?auto_1394765 ?auto_1394770 ) ) ( not ( = ?auto_1394765 ?auto_1394771 ) ) ( not ( = ?auto_1394766 ?auto_1394767 ) ) ( not ( = ?auto_1394766 ?auto_1394768 ) ) ( not ( = ?auto_1394766 ?auto_1394769 ) ) ( not ( = ?auto_1394766 ?auto_1394770 ) ) ( not ( = ?auto_1394766 ?auto_1394771 ) ) ( not ( = ?auto_1394767 ?auto_1394768 ) ) ( not ( = ?auto_1394767 ?auto_1394769 ) ) ( not ( = ?auto_1394767 ?auto_1394770 ) ) ( not ( = ?auto_1394767 ?auto_1394771 ) ) ( not ( = ?auto_1394768 ?auto_1394769 ) ) ( not ( = ?auto_1394768 ?auto_1394770 ) ) ( not ( = ?auto_1394768 ?auto_1394771 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1394769 ?auto_1394770 ?auto_1394771 )
      ( MAKE-13CRATE-VERIFY ?auto_1394758 ?auto_1394759 ?auto_1394760 ?auto_1394761 ?auto_1394762 ?auto_1394763 ?auto_1394764 ?auto_1394765 ?auto_1394766 ?auto_1394767 ?auto_1394768 ?auto_1394769 ?auto_1394770 ?auto_1394771 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1394914 - SURFACE
      ?auto_1394915 - SURFACE
      ?auto_1394916 - SURFACE
      ?auto_1394917 - SURFACE
      ?auto_1394918 - SURFACE
      ?auto_1394919 - SURFACE
      ?auto_1394920 - SURFACE
      ?auto_1394921 - SURFACE
      ?auto_1394922 - SURFACE
      ?auto_1394923 - SURFACE
      ?auto_1394924 - SURFACE
      ?auto_1394925 - SURFACE
      ?auto_1394926 - SURFACE
      ?auto_1394927 - SURFACE
    )
    :vars
    (
      ?auto_1394929 - HOIST
      ?auto_1394928 - PLACE
      ?auto_1394930 - TRUCK
      ?auto_1394931 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1394929 ?auto_1394928 ) ( SURFACE-AT ?auto_1394926 ?auto_1394928 ) ( CLEAR ?auto_1394926 ) ( IS-CRATE ?auto_1394927 ) ( not ( = ?auto_1394926 ?auto_1394927 ) ) ( AVAILABLE ?auto_1394929 ) ( IN ?auto_1394927 ?auto_1394930 ) ( ON ?auto_1394926 ?auto_1394925 ) ( not ( = ?auto_1394925 ?auto_1394926 ) ) ( not ( = ?auto_1394925 ?auto_1394927 ) ) ( TRUCK-AT ?auto_1394930 ?auto_1394931 ) ( not ( = ?auto_1394931 ?auto_1394928 ) ) ( ON ?auto_1394915 ?auto_1394914 ) ( ON ?auto_1394916 ?auto_1394915 ) ( ON ?auto_1394917 ?auto_1394916 ) ( ON ?auto_1394918 ?auto_1394917 ) ( ON ?auto_1394919 ?auto_1394918 ) ( ON ?auto_1394920 ?auto_1394919 ) ( ON ?auto_1394921 ?auto_1394920 ) ( ON ?auto_1394922 ?auto_1394921 ) ( ON ?auto_1394923 ?auto_1394922 ) ( ON ?auto_1394924 ?auto_1394923 ) ( ON ?auto_1394925 ?auto_1394924 ) ( not ( = ?auto_1394914 ?auto_1394915 ) ) ( not ( = ?auto_1394914 ?auto_1394916 ) ) ( not ( = ?auto_1394914 ?auto_1394917 ) ) ( not ( = ?auto_1394914 ?auto_1394918 ) ) ( not ( = ?auto_1394914 ?auto_1394919 ) ) ( not ( = ?auto_1394914 ?auto_1394920 ) ) ( not ( = ?auto_1394914 ?auto_1394921 ) ) ( not ( = ?auto_1394914 ?auto_1394922 ) ) ( not ( = ?auto_1394914 ?auto_1394923 ) ) ( not ( = ?auto_1394914 ?auto_1394924 ) ) ( not ( = ?auto_1394914 ?auto_1394925 ) ) ( not ( = ?auto_1394914 ?auto_1394926 ) ) ( not ( = ?auto_1394914 ?auto_1394927 ) ) ( not ( = ?auto_1394915 ?auto_1394916 ) ) ( not ( = ?auto_1394915 ?auto_1394917 ) ) ( not ( = ?auto_1394915 ?auto_1394918 ) ) ( not ( = ?auto_1394915 ?auto_1394919 ) ) ( not ( = ?auto_1394915 ?auto_1394920 ) ) ( not ( = ?auto_1394915 ?auto_1394921 ) ) ( not ( = ?auto_1394915 ?auto_1394922 ) ) ( not ( = ?auto_1394915 ?auto_1394923 ) ) ( not ( = ?auto_1394915 ?auto_1394924 ) ) ( not ( = ?auto_1394915 ?auto_1394925 ) ) ( not ( = ?auto_1394915 ?auto_1394926 ) ) ( not ( = ?auto_1394915 ?auto_1394927 ) ) ( not ( = ?auto_1394916 ?auto_1394917 ) ) ( not ( = ?auto_1394916 ?auto_1394918 ) ) ( not ( = ?auto_1394916 ?auto_1394919 ) ) ( not ( = ?auto_1394916 ?auto_1394920 ) ) ( not ( = ?auto_1394916 ?auto_1394921 ) ) ( not ( = ?auto_1394916 ?auto_1394922 ) ) ( not ( = ?auto_1394916 ?auto_1394923 ) ) ( not ( = ?auto_1394916 ?auto_1394924 ) ) ( not ( = ?auto_1394916 ?auto_1394925 ) ) ( not ( = ?auto_1394916 ?auto_1394926 ) ) ( not ( = ?auto_1394916 ?auto_1394927 ) ) ( not ( = ?auto_1394917 ?auto_1394918 ) ) ( not ( = ?auto_1394917 ?auto_1394919 ) ) ( not ( = ?auto_1394917 ?auto_1394920 ) ) ( not ( = ?auto_1394917 ?auto_1394921 ) ) ( not ( = ?auto_1394917 ?auto_1394922 ) ) ( not ( = ?auto_1394917 ?auto_1394923 ) ) ( not ( = ?auto_1394917 ?auto_1394924 ) ) ( not ( = ?auto_1394917 ?auto_1394925 ) ) ( not ( = ?auto_1394917 ?auto_1394926 ) ) ( not ( = ?auto_1394917 ?auto_1394927 ) ) ( not ( = ?auto_1394918 ?auto_1394919 ) ) ( not ( = ?auto_1394918 ?auto_1394920 ) ) ( not ( = ?auto_1394918 ?auto_1394921 ) ) ( not ( = ?auto_1394918 ?auto_1394922 ) ) ( not ( = ?auto_1394918 ?auto_1394923 ) ) ( not ( = ?auto_1394918 ?auto_1394924 ) ) ( not ( = ?auto_1394918 ?auto_1394925 ) ) ( not ( = ?auto_1394918 ?auto_1394926 ) ) ( not ( = ?auto_1394918 ?auto_1394927 ) ) ( not ( = ?auto_1394919 ?auto_1394920 ) ) ( not ( = ?auto_1394919 ?auto_1394921 ) ) ( not ( = ?auto_1394919 ?auto_1394922 ) ) ( not ( = ?auto_1394919 ?auto_1394923 ) ) ( not ( = ?auto_1394919 ?auto_1394924 ) ) ( not ( = ?auto_1394919 ?auto_1394925 ) ) ( not ( = ?auto_1394919 ?auto_1394926 ) ) ( not ( = ?auto_1394919 ?auto_1394927 ) ) ( not ( = ?auto_1394920 ?auto_1394921 ) ) ( not ( = ?auto_1394920 ?auto_1394922 ) ) ( not ( = ?auto_1394920 ?auto_1394923 ) ) ( not ( = ?auto_1394920 ?auto_1394924 ) ) ( not ( = ?auto_1394920 ?auto_1394925 ) ) ( not ( = ?auto_1394920 ?auto_1394926 ) ) ( not ( = ?auto_1394920 ?auto_1394927 ) ) ( not ( = ?auto_1394921 ?auto_1394922 ) ) ( not ( = ?auto_1394921 ?auto_1394923 ) ) ( not ( = ?auto_1394921 ?auto_1394924 ) ) ( not ( = ?auto_1394921 ?auto_1394925 ) ) ( not ( = ?auto_1394921 ?auto_1394926 ) ) ( not ( = ?auto_1394921 ?auto_1394927 ) ) ( not ( = ?auto_1394922 ?auto_1394923 ) ) ( not ( = ?auto_1394922 ?auto_1394924 ) ) ( not ( = ?auto_1394922 ?auto_1394925 ) ) ( not ( = ?auto_1394922 ?auto_1394926 ) ) ( not ( = ?auto_1394922 ?auto_1394927 ) ) ( not ( = ?auto_1394923 ?auto_1394924 ) ) ( not ( = ?auto_1394923 ?auto_1394925 ) ) ( not ( = ?auto_1394923 ?auto_1394926 ) ) ( not ( = ?auto_1394923 ?auto_1394927 ) ) ( not ( = ?auto_1394924 ?auto_1394925 ) ) ( not ( = ?auto_1394924 ?auto_1394926 ) ) ( not ( = ?auto_1394924 ?auto_1394927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1394925 ?auto_1394926 ?auto_1394927 )
      ( MAKE-13CRATE-VERIFY ?auto_1394914 ?auto_1394915 ?auto_1394916 ?auto_1394917 ?auto_1394918 ?auto_1394919 ?auto_1394920 ?auto_1394921 ?auto_1394922 ?auto_1394923 ?auto_1394924 ?auto_1394925 ?auto_1394926 ?auto_1394927 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1395083 - SURFACE
      ?auto_1395084 - SURFACE
      ?auto_1395085 - SURFACE
      ?auto_1395086 - SURFACE
      ?auto_1395087 - SURFACE
      ?auto_1395088 - SURFACE
      ?auto_1395089 - SURFACE
      ?auto_1395090 - SURFACE
      ?auto_1395091 - SURFACE
      ?auto_1395092 - SURFACE
      ?auto_1395093 - SURFACE
      ?auto_1395094 - SURFACE
      ?auto_1395095 - SURFACE
      ?auto_1395096 - SURFACE
    )
    :vars
    (
      ?auto_1395097 - HOIST
      ?auto_1395099 - PLACE
      ?auto_1395100 - TRUCK
      ?auto_1395101 - PLACE
      ?auto_1395098 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395097 ?auto_1395099 ) ( SURFACE-AT ?auto_1395095 ?auto_1395099 ) ( CLEAR ?auto_1395095 ) ( IS-CRATE ?auto_1395096 ) ( not ( = ?auto_1395095 ?auto_1395096 ) ) ( AVAILABLE ?auto_1395097 ) ( ON ?auto_1395095 ?auto_1395094 ) ( not ( = ?auto_1395094 ?auto_1395095 ) ) ( not ( = ?auto_1395094 ?auto_1395096 ) ) ( TRUCK-AT ?auto_1395100 ?auto_1395101 ) ( not ( = ?auto_1395101 ?auto_1395099 ) ) ( HOIST-AT ?auto_1395098 ?auto_1395101 ) ( LIFTING ?auto_1395098 ?auto_1395096 ) ( not ( = ?auto_1395097 ?auto_1395098 ) ) ( ON ?auto_1395084 ?auto_1395083 ) ( ON ?auto_1395085 ?auto_1395084 ) ( ON ?auto_1395086 ?auto_1395085 ) ( ON ?auto_1395087 ?auto_1395086 ) ( ON ?auto_1395088 ?auto_1395087 ) ( ON ?auto_1395089 ?auto_1395088 ) ( ON ?auto_1395090 ?auto_1395089 ) ( ON ?auto_1395091 ?auto_1395090 ) ( ON ?auto_1395092 ?auto_1395091 ) ( ON ?auto_1395093 ?auto_1395092 ) ( ON ?auto_1395094 ?auto_1395093 ) ( not ( = ?auto_1395083 ?auto_1395084 ) ) ( not ( = ?auto_1395083 ?auto_1395085 ) ) ( not ( = ?auto_1395083 ?auto_1395086 ) ) ( not ( = ?auto_1395083 ?auto_1395087 ) ) ( not ( = ?auto_1395083 ?auto_1395088 ) ) ( not ( = ?auto_1395083 ?auto_1395089 ) ) ( not ( = ?auto_1395083 ?auto_1395090 ) ) ( not ( = ?auto_1395083 ?auto_1395091 ) ) ( not ( = ?auto_1395083 ?auto_1395092 ) ) ( not ( = ?auto_1395083 ?auto_1395093 ) ) ( not ( = ?auto_1395083 ?auto_1395094 ) ) ( not ( = ?auto_1395083 ?auto_1395095 ) ) ( not ( = ?auto_1395083 ?auto_1395096 ) ) ( not ( = ?auto_1395084 ?auto_1395085 ) ) ( not ( = ?auto_1395084 ?auto_1395086 ) ) ( not ( = ?auto_1395084 ?auto_1395087 ) ) ( not ( = ?auto_1395084 ?auto_1395088 ) ) ( not ( = ?auto_1395084 ?auto_1395089 ) ) ( not ( = ?auto_1395084 ?auto_1395090 ) ) ( not ( = ?auto_1395084 ?auto_1395091 ) ) ( not ( = ?auto_1395084 ?auto_1395092 ) ) ( not ( = ?auto_1395084 ?auto_1395093 ) ) ( not ( = ?auto_1395084 ?auto_1395094 ) ) ( not ( = ?auto_1395084 ?auto_1395095 ) ) ( not ( = ?auto_1395084 ?auto_1395096 ) ) ( not ( = ?auto_1395085 ?auto_1395086 ) ) ( not ( = ?auto_1395085 ?auto_1395087 ) ) ( not ( = ?auto_1395085 ?auto_1395088 ) ) ( not ( = ?auto_1395085 ?auto_1395089 ) ) ( not ( = ?auto_1395085 ?auto_1395090 ) ) ( not ( = ?auto_1395085 ?auto_1395091 ) ) ( not ( = ?auto_1395085 ?auto_1395092 ) ) ( not ( = ?auto_1395085 ?auto_1395093 ) ) ( not ( = ?auto_1395085 ?auto_1395094 ) ) ( not ( = ?auto_1395085 ?auto_1395095 ) ) ( not ( = ?auto_1395085 ?auto_1395096 ) ) ( not ( = ?auto_1395086 ?auto_1395087 ) ) ( not ( = ?auto_1395086 ?auto_1395088 ) ) ( not ( = ?auto_1395086 ?auto_1395089 ) ) ( not ( = ?auto_1395086 ?auto_1395090 ) ) ( not ( = ?auto_1395086 ?auto_1395091 ) ) ( not ( = ?auto_1395086 ?auto_1395092 ) ) ( not ( = ?auto_1395086 ?auto_1395093 ) ) ( not ( = ?auto_1395086 ?auto_1395094 ) ) ( not ( = ?auto_1395086 ?auto_1395095 ) ) ( not ( = ?auto_1395086 ?auto_1395096 ) ) ( not ( = ?auto_1395087 ?auto_1395088 ) ) ( not ( = ?auto_1395087 ?auto_1395089 ) ) ( not ( = ?auto_1395087 ?auto_1395090 ) ) ( not ( = ?auto_1395087 ?auto_1395091 ) ) ( not ( = ?auto_1395087 ?auto_1395092 ) ) ( not ( = ?auto_1395087 ?auto_1395093 ) ) ( not ( = ?auto_1395087 ?auto_1395094 ) ) ( not ( = ?auto_1395087 ?auto_1395095 ) ) ( not ( = ?auto_1395087 ?auto_1395096 ) ) ( not ( = ?auto_1395088 ?auto_1395089 ) ) ( not ( = ?auto_1395088 ?auto_1395090 ) ) ( not ( = ?auto_1395088 ?auto_1395091 ) ) ( not ( = ?auto_1395088 ?auto_1395092 ) ) ( not ( = ?auto_1395088 ?auto_1395093 ) ) ( not ( = ?auto_1395088 ?auto_1395094 ) ) ( not ( = ?auto_1395088 ?auto_1395095 ) ) ( not ( = ?auto_1395088 ?auto_1395096 ) ) ( not ( = ?auto_1395089 ?auto_1395090 ) ) ( not ( = ?auto_1395089 ?auto_1395091 ) ) ( not ( = ?auto_1395089 ?auto_1395092 ) ) ( not ( = ?auto_1395089 ?auto_1395093 ) ) ( not ( = ?auto_1395089 ?auto_1395094 ) ) ( not ( = ?auto_1395089 ?auto_1395095 ) ) ( not ( = ?auto_1395089 ?auto_1395096 ) ) ( not ( = ?auto_1395090 ?auto_1395091 ) ) ( not ( = ?auto_1395090 ?auto_1395092 ) ) ( not ( = ?auto_1395090 ?auto_1395093 ) ) ( not ( = ?auto_1395090 ?auto_1395094 ) ) ( not ( = ?auto_1395090 ?auto_1395095 ) ) ( not ( = ?auto_1395090 ?auto_1395096 ) ) ( not ( = ?auto_1395091 ?auto_1395092 ) ) ( not ( = ?auto_1395091 ?auto_1395093 ) ) ( not ( = ?auto_1395091 ?auto_1395094 ) ) ( not ( = ?auto_1395091 ?auto_1395095 ) ) ( not ( = ?auto_1395091 ?auto_1395096 ) ) ( not ( = ?auto_1395092 ?auto_1395093 ) ) ( not ( = ?auto_1395092 ?auto_1395094 ) ) ( not ( = ?auto_1395092 ?auto_1395095 ) ) ( not ( = ?auto_1395092 ?auto_1395096 ) ) ( not ( = ?auto_1395093 ?auto_1395094 ) ) ( not ( = ?auto_1395093 ?auto_1395095 ) ) ( not ( = ?auto_1395093 ?auto_1395096 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1395094 ?auto_1395095 ?auto_1395096 )
      ( MAKE-13CRATE-VERIFY ?auto_1395083 ?auto_1395084 ?auto_1395085 ?auto_1395086 ?auto_1395087 ?auto_1395088 ?auto_1395089 ?auto_1395090 ?auto_1395091 ?auto_1395092 ?auto_1395093 ?auto_1395094 ?auto_1395095 ?auto_1395096 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1395265 - SURFACE
      ?auto_1395266 - SURFACE
      ?auto_1395267 - SURFACE
      ?auto_1395268 - SURFACE
      ?auto_1395269 - SURFACE
      ?auto_1395270 - SURFACE
      ?auto_1395271 - SURFACE
      ?auto_1395272 - SURFACE
      ?auto_1395273 - SURFACE
      ?auto_1395274 - SURFACE
      ?auto_1395275 - SURFACE
      ?auto_1395276 - SURFACE
      ?auto_1395277 - SURFACE
      ?auto_1395278 - SURFACE
    )
    :vars
    (
      ?auto_1395281 - HOIST
      ?auto_1395282 - PLACE
      ?auto_1395284 - TRUCK
      ?auto_1395280 - PLACE
      ?auto_1395279 - HOIST
      ?auto_1395283 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395281 ?auto_1395282 ) ( SURFACE-AT ?auto_1395277 ?auto_1395282 ) ( CLEAR ?auto_1395277 ) ( IS-CRATE ?auto_1395278 ) ( not ( = ?auto_1395277 ?auto_1395278 ) ) ( AVAILABLE ?auto_1395281 ) ( ON ?auto_1395277 ?auto_1395276 ) ( not ( = ?auto_1395276 ?auto_1395277 ) ) ( not ( = ?auto_1395276 ?auto_1395278 ) ) ( TRUCK-AT ?auto_1395284 ?auto_1395280 ) ( not ( = ?auto_1395280 ?auto_1395282 ) ) ( HOIST-AT ?auto_1395279 ?auto_1395280 ) ( not ( = ?auto_1395281 ?auto_1395279 ) ) ( AVAILABLE ?auto_1395279 ) ( SURFACE-AT ?auto_1395278 ?auto_1395280 ) ( ON ?auto_1395278 ?auto_1395283 ) ( CLEAR ?auto_1395278 ) ( not ( = ?auto_1395277 ?auto_1395283 ) ) ( not ( = ?auto_1395278 ?auto_1395283 ) ) ( not ( = ?auto_1395276 ?auto_1395283 ) ) ( ON ?auto_1395266 ?auto_1395265 ) ( ON ?auto_1395267 ?auto_1395266 ) ( ON ?auto_1395268 ?auto_1395267 ) ( ON ?auto_1395269 ?auto_1395268 ) ( ON ?auto_1395270 ?auto_1395269 ) ( ON ?auto_1395271 ?auto_1395270 ) ( ON ?auto_1395272 ?auto_1395271 ) ( ON ?auto_1395273 ?auto_1395272 ) ( ON ?auto_1395274 ?auto_1395273 ) ( ON ?auto_1395275 ?auto_1395274 ) ( ON ?auto_1395276 ?auto_1395275 ) ( not ( = ?auto_1395265 ?auto_1395266 ) ) ( not ( = ?auto_1395265 ?auto_1395267 ) ) ( not ( = ?auto_1395265 ?auto_1395268 ) ) ( not ( = ?auto_1395265 ?auto_1395269 ) ) ( not ( = ?auto_1395265 ?auto_1395270 ) ) ( not ( = ?auto_1395265 ?auto_1395271 ) ) ( not ( = ?auto_1395265 ?auto_1395272 ) ) ( not ( = ?auto_1395265 ?auto_1395273 ) ) ( not ( = ?auto_1395265 ?auto_1395274 ) ) ( not ( = ?auto_1395265 ?auto_1395275 ) ) ( not ( = ?auto_1395265 ?auto_1395276 ) ) ( not ( = ?auto_1395265 ?auto_1395277 ) ) ( not ( = ?auto_1395265 ?auto_1395278 ) ) ( not ( = ?auto_1395265 ?auto_1395283 ) ) ( not ( = ?auto_1395266 ?auto_1395267 ) ) ( not ( = ?auto_1395266 ?auto_1395268 ) ) ( not ( = ?auto_1395266 ?auto_1395269 ) ) ( not ( = ?auto_1395266 ?auto_1395270 ) ) ( not ( = ?auto_1395266 ?auto_1395271 ) ) ( not ( = ?auto_1395266 ?auto_1395272 ) ) ( not ( = ?auto_1395266 ?auto_1395273 ) ) ( not ( = ?auto_1395266 ?auto_1395274 ) ) ( not ( = ?auto_1395266 ?auto_1395275 ) ) ( not ( = ?auto_1395266 ?auto_1395276 ) ) ( not ( = ?auto_1395266 ?auto_1395277 ) ) ( not ( = ?auto_1395266 ?auto_1395278 ) ) ( not ( = ?auto_1395266 ?auto_1395283 ) ) ( not ( = ?auto_1395267 ?auto_1395268 ) ) ( not ( = ?auto_1395267 ?auto_1395269 ) ) ( not ( = ?auto_1395267 ?auto_1395270 ) ) ( not ( = ?auto_1395267 ?auto_1395271 ) ) ( not ( = ?auto_1395267 ?auto_1395272 ) ) ( not ( = ?auto_1395267 ?auto_1395273 ) ) ( not ( = ?auto_1395267 ?auto_1395274 ) ) ( not ( = ?auto_1395267 ?auto_1395275 ) ) ( not ( = ?auto_1395267 ?auto_1395276 ) ) ( not ( = ?auto_1395267 ?auto_1395277 ) ) ( not ( = ?auto_1395267 ?auto_1395278 ) ) ( not ( = ?auto_1395267 ?auto_1395283 ) ) ( not ( = ?auto_1395268 ?auto_1395269 ) ) ( not ( = ?auto_1395268 ?auto_1395270 ) ) ( not ( = ?auto_1395268 ?auto_1395271 ) ) ( not ( = ?auto_1395268 ?auto_1395272 ) ) ( not ( = ?auto_1395268 ?auto_1395273 ) ) ( not ( = ?auto_1395268 ?auto_1395274 ) ) ( not ( = ?auto_1395268 ?auto_1395275 ) ) ( not ( = ?auto_1395268 ?auto_1395276 ) ) ( not ( = ?auto_1395268 ?auto_1395277 ) ) ( not ( = ?auto_1395268 ?auto_1395278 ) ) ( not ( = ?auto_1395268 ?auto_1395283 ) ) ( not ( = ?auto_1395269 ?auto_1395270 ) ) ( not ( = ?auto_1395269 ?auto_1395271 ) ) ( not ( = ?auto_1395269 ?auto_1395272 ) ) ( not ( = ?auto_1395269 ?auto_1395273 ) ) ( not ( = ?auto_1395269 ?auto_1395274 ) ) ( not ( = ?auto_1395269 ?auto_1395275 ) ) ( not ( = ?auto_1395269 ?auto_1395276 ) ) ( not ( = ?auto_1395269 ?auto_1395277 ) ) ( not ( = ?auto_1395269 ?auto_1395278 ) ) ( not ( = ?auto_1395269 ?auto_1395283 ) ) ( not ( = ?auto_1395270 ?auto_1395271 ) ) ( not ( = ?auto_1395270 ?auto_1395272 ) ) ( not ( = ?auto_1395270 ?auto_1395273 ) ) ( not ( = ?auto_1395270 ?auto_1395274 ) ) ( not ( = ?auto_1395270 ?auto_1395275 ) ) ( not ( = ?auto_1395270 ?auto_1395276 ) ) ( not ( = ?auto_1395270 ?auto_1395277 ) ) ( not ( = ?auto_1395270 ?auto_1395278 ) ) ( not ( = ?auto_1395270 ?auto_1395283 ) ) ( not ( = ?auto_1395271 ?auto_1395272 ) ) ( not ( = ?auto_1395271 ?auto_1395273 ) ) ( not ( = ?auto_1395271 ?auto_1395274 ) ) ( not ( = ?auto_1395271 ?auto_1395275 ) ) ( not ( = ?auto_1395271 ?auto_1395276 ) ) ( not ( = ?auto_1395271 ?auto_1395277 ) ) ( not ( = ?auto_1395271 ?auto_1395278 ) ) ( not ( = ?auto_1395271 ?auto_1395283 ) ) ( not ( = ?auto_1395272 ?auto_1395273 ) ) ( not ( = ?auto_1395272 ?auto_1395274 ) ) ( not ( = ?auto_1395272 ?auto_1395275 ) ) ( not ( = ?auto_1395272 ?auto_1395276 ) ) ( not ( = ?auto_1395272 ?auto_1395277 ) ) ( not ( = ?auto_1395272 ?auto_1395278 ) ) ( not ( = ?auto_1395272 ?auto_1395283 ) ) ( not ( = ?auto_1395273 ?auto_1395274 ) ) ( not ( = ?auto_1395273 ?auto_1395275 ) ) ( not ( = ?auto_1395273 ?auto_1395276 ) ) ( not ( = ?auto_1395273 ?auto_1395277 ) ) ( not ( = ?auto_1395273 ?auto_1395278 ) ) ( not ( = ?auto_1395273 ?auto_1395283 ) ) ( not ( = ?auto_1395274 ?auto_1395275 ) ) ( not ( = ?auto_1395274 ?auto_1395276 ) ) ( not ( = ?auto_1395274 ?auto_1395277 ) ) ( not ( = ?auto_1395274 ?auto_1395278 ) ) ( not ( = ?auto_1395274 ?auto_1395283 ) ) ( not ( = ?auto_1395275 ?auto_1395276 ) ) ( not ( = ?auto_1395275 ?auto_1395277 ) ) ( not ( = ?auto_1395275 ?auto_1395278 ) ) ( not ( = ?auto_1395275 ?auto_1395283 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1395276 ?auto_1395277 ?auto_1395278 )
      ( MAKE-13CRATE-VERIFY ?auto_1395265 ?auto_1395266 ?auto_1395267 ?auto_1395268 ?auto_1395269 ?auto_1395270 ?auto_1395271 ?auto_1395272 ?auto_1395273 ?auto_1395274 ?auto_1395275 ?auto_1395276 ?auto_1395277 ?auto_1395278 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1395448 - SURFACE
      ?auto_1395449 - SURFACE
      ?auto_1395450 - SURFACE
      ?auto_1395451 - SURFACE
      ?auto_1395452 - SURFACE
      ?auto_1395453 - SURFACE
      ?auto_1395454 - SURFACE
      ?auto_1395455 - SURFACE
      ?auto_1395456 - SURFACE
      ?auto_1395457 - SURFACE
      ?auto_1395458 - SURFACE
      ?auto_1395459 - SURFACE
      ?auto_1395460 - SURFACE
      ?auto_1395461 - SURFACE
    )
    :vars
    (
      ?auto_1395465 - HOIST
      ?auto_1395467 - PLACE
      ?auto_1395464 - PLACE
      ?auto_1395466 - HOIST
      ?auto_1395463 - SURFACE
      ?auto_1395462 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395465 ?auto_1395467 ) ( SURFACE-AT ?auto_1395460 ?auto_1395467 ) ( CLEAR ?auto_1395460 ) ( IS-CRATE ?auto_1395461 ) ( not ( = ?auto_1395460 ?auto_1395461 ) ) ( AVAILABLE ?auto_1395465 ) ( ON ?auto_1395460 ?auto_1395459 ) ( not ( = ?auto_1395459 ?auto_1395460 ) ) ( not ( = ?auto_1395459 ?auto_1395461 ) ) ( not ( = ?auto_1395464 ?auto_1395467 ) ) ( HOIST-AT ?auto_1395466 ?auto_1395464 ) ( not ( = ?auto_1395465 ?auto_1395466 ) ) ( AVAILABLE ?auto_1395466 ) ( SURFACE-AT ?auto_1395461 ?auto_1395464 ) ( ON ?auto_1395461 ?auto_1395463 ) ( CLEAR ?auto_1395461 ) ( not ( = ?auto_1395460 ?auto_1395463 ) ) ( not ( = ?auto_1395461 ?auto_1395463 ) ) ( not ( = ?auto_1395459 ?auto_1395463 ) ) ( TRUCK-AT ?auto_1395462 ?auto_1395467 ) ( ON ?auto_1395449 ?auto_1395448 ) ( ON ?auto_1395450 ?auto_1395449 ) ( ON ?auto_1395451 ?auto_1395450 ) ( ON ?auto_1395452 ?auto_1395451 ) ( ON ?auto_1395453 ?auto_1395452 ) ( ON ?auto_1395454 ?auto_1395453 ) ( ON ?auto_1395455 ?auto_1395454 ) ( ON ?auto_1395456 ?auto_1395455 ) ( ON ?auto_1395457 ?auto_1395456 ) ( ON ?auto_1395458 ?auto_1395457 ) ( ON ?auto_1395459 ?auto_1395458 ) ( not ( = ?auto_1395448 ?auto_1395449 ) ) ( not ( = ?auto_1395448 ?auto_1395450 ) ) ( not ( = ?auto_1395448 ?auto_1395451 ) ) ( not ( = ?auto_1395448 ?auto_1395452 ) ) ( not ( = ?auto_1395448 ?auto_1395453 ) ) ( not ( = ?auto_1395448 ?auto_1395454 ) ) ( not ( = ?auto_1395448 ?auto_1395455 ) ) ( not ( = ?auto_1395448 ?auto_1395456 ) ) ( not ( = ?auto_1395448 ?auto_1395457 ) ) ( not ( = ?auto_1395448 ?auto_1395458 ) ) ( not ( = ?auto_1395448 ?auto_1395459 ) ) ( not ( = ?auto_1395448 ?auto_1395460 ) ) ( not ( = ?auto_1395448 ?auto_1395461 ) ) ( not ( = ?auto_1395448 ?auto_1395463 ) ) ( not ( = ?auto_1395449 ?auto_1395450 ) ) ( not ( = ?auto_1395449 ?auto_1395451 ) ) ( not ( = ?auto_1395449 ?auto_1395452 ) ) ( not ( = ?auto_1395449 ?auto_1395453 ) ) ( not ( = ?auto_1395449 ?auto_1395454 ) ) ( not ( = ?auto_1395449 ?auto_1395455 ) ) ( not ( = ?auto_1395449 ?auto_1395456 ) ) ( not ( = ?auto_1395449 ?auto_1395457 ) ) ( not ( = ?auto_1395449 ?auto_1395458 ) ) ( not ( = ?auto_1395449 ?auto_1395459 ) ) ( not ( = ?auto_1395449 ?auto_1395460 ) ) ( not ( = ?auto_1395449 ?auto_1395461 ) ) ( not ( = ?auto_1395449 ?auto_1395463 ) ) ( not ( = ?auto_1395450 ?auto_1395451 ) ) ( not ( = ?auto_1395450 ?auto_1395452 ) ) ( not ( = ?auto_1395450 ?auto_1395453 ) ) ( not ( = ?auto_1395450 ?auto_1395454 ) ) ( not ( = ?auto_1395450 ?auto_1395455 ) ) ( not ( = ?auto_1395450 ?auto_1395456 ) ) ( not ( = ?auto_1395450 ?auto_1395457 ) ) ( not ( = ?auto_1395450 ?auto_1395458 ) ) ( not ( = ?auto_1395450 ?auto_1395459 ) ) ( not ( = ?auto_1395450 ?auto_1395460 ) ) ( not ( = ?auto_1395450 ?auto_1395461 ) ) ( not ( = ?auto_1395450 ?auto_1395463 ) ) ( not ( = ?auto_1395451 ?auto_1395452 ) ) ( not ( = ?auto_1395451 ?auto_1395453 ) ) ( not ( = ?auto_1395451 ?auto_1395454 ) ) ( not ( = ?auto_1395451 ?auto_1395455 ) ) ( not ( = ?auto_1395451 ?auto_1395456 ) ) ( not ( = ?auto_1395451 ?auto_1395457 ) ) ( not ( = ?auto_1395451 ?auto_1395458 ) ) ( not ( = ?auto_1395451 ?auto_1395459 ) ) ( not ( = ?auto_1395451 ?auto_1395460 ) ) ( not ( = ?auto_1395451 ?auto_1395461 ) ) ( not ( = ?auto_1395451 ?auto_1395463 ) ) ( not ( = ?auto_1395452 ?auto_1395453 ) ) ( not ( = ?auto_1395452 ?auto_1395454 ) ) ( not ( = ?auto_1395452 ?auto_1395455 ) ) ( not ( = ?auto_1395452 ?auto_1395456 ) ) ( not ( = ?auto_1395452 ?auto_1395457 ) ) ( not ( = ?auto_1395452 ?auto_1395458 ) ) ( not ( = ?auto_1395452 ?auto_1395459 ) ) ( not ( = ?auto_1395452 ?auto_1395460 ) ) ( not ( = ?auto_1395452 ?auto_1395461 ) ) ( not ( = ?auto_1395452 ?auto_1395463 ) ) ( not ( = ?auto_1395453 ?auto_1395454 ) ) ( not ( = ?auto_1395453 ?auto_1395455 ) ) ( not ( = ?auto_1395453 ?auto_1395456 ) ) ( not ( = ?auto_1395453 ?auto_1395457 ) ) ( not ( = ?auto_1395453 ?auto_1395458 ) ) ( not ( = ?auto_1395453 ?auto_1395459 ) ) ( not ( = ?auto_1395453 ?auto_1395460 ) ) ( not ( = ?auto_1395453 ?auto_1395461 ) ) ( not ( = ?auto_1395453 ?auto_1395463 ) ) ( not ( = ?auto_1395454 ?auto_1395455 ) ) ( not ( = ?auto_1395454 ?auto_1395456 ) ) ( not ( = ?auto_1395454 ?auto_1395457 ) ) ( not ( = ?auto_1395454 ?auto_1395458 ) ) ( not ( = ?auto_1395454 ?auto_1395459 ) ) ( not ( = ?auto_1395454 ?auto_1395460 ) ) ( not ( = ?auto_1395454 ?auto_1395461 ) ) ( not ( = ?auto_1395454 ?auto_1395463 ) ) ( not ( = ?auto_1395455 ?auto_1395456 ) ) ( not ( = ?auto_1395455 ?auto_1395457 ) ) ( not ( = ?auto_1395455 ?auto_1395458 ) ) ( not ( = ?auto_1395455 ?auto_1395459 ) ) ( not ( = ?auto_1395455 ?auto_1395460 ) ) ( not ( = ?auto_1395455 ?auto_1395461 ) ) ( not ( = ?auto_1395455 ?auto_1395463 ) ) ( not ( = ?auto_1395456 ?auto_1395457 ) ) ( not ( = ?auto_1395456 ?auto_1395458 ) ) ( not ( = ?auto_1395456 ?auto_1395459 ) ) ( not ( = ?auto_1395456 ?auto_1395460 ) ) ( not ( = ?auto_1395456 ?auto_1395461 ) ) ( not ( = ?auto_1395456 ?auto_1395463 ) ) ( not ( = ?auto_1395457 ?auto_1395458 ) ) ( not ( = ?auto_1395457 ?auto_1395459 ) ) ( not ( = ?auto_1395457 ?auto_1395460 ) ) ( not ( = ?auto_1395457 ?auto_1395461 ) ) ( not ( = ?auto_1395457 ?auto_1395463 ) ) ( not ( = ?auto_1395458 ?auto_1395459 ) ) ( not ( = ?auto_1395458 ?auto_1395460 ) ) ( not ( = ?auto_1395458 ?auto_1395461 ) ) ( not ( = ?auto_1395458 ?auto_1395463 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1395459 ?auto_1395460 ?auto_1395461 )
      ( MAKE-13CRATE-VERIFY ?auto_1395448 ?auto_1395449 ?auto_1395450 ?auto_1395451 ?auto_1395452 ?auto_1395453 ?auto_1395454 ?auto_1395455 ?auto_1395456 ?auto_1395457 ?auto_1395458 ?auto_1395459 ?auto_1395460 ?auto_1395461 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1395631 - SURFACE
      ?auto_1395632 - SURFACE
      ?auto_1395633 - SURFACE
      ?auto_1395634 - SURFACE
      ?auto_1395635 - SURFACE
      ?auto_1395636 - SURFACE
      ?auto_1395637 - SURFACE
      ?auto_1395638 - SURFACE
      ?auto_1395639 - SURFACE
      ?auto_1395640 - SURFACE
      ?auto_1395641 - SURFACE
      ?auto_1395642 - SURFACE
      ?auto_1395643 - SURFACE
      ?auto_1395644 - SURFACE
    )
    :vars
    (
      ?auto_1395649 - HOIST
      ?auto_1395646 - PLACE
      ?auto_1395648 - PLACE
      ?auto_1395647 - HOIST
      ?auto_1395645 - SURFACE
      ?auto_1395650 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395649 ?auto_1395646 ) ( IS-CRATE ?auto_1395644 ) ( not ( = ?auto_1395643 ?auto_1395644 ) ) ( not ( = ?auto_1395642 ?auto_1395643 ) ) ( not ( = ?auto_1395642 ?auto_1395644 ) ) ( not ( = ?auto_1395648 ?auto_1395646 ) ) ( HOIST-AT ?auto_1395647 ?auto_1395648 ) ( not ( = ?auto_1395649 ?auto_1395647 ) ) ( AVAILABLE ?auto_1395647 ) ( SURFACE-AT ?auto_1395644 ?auto_1395648 ) ( ON ?auto_1395644 ?auto_1395645 ) ( CLEAR ?auto_1395644 ) ( not ( = ?auto_1395643 ?auto_1395645 ) ) ( not ( = ?auto_1395644 ?auto_1395645 ) ) ( not ( = ?auto_1395642 ?auto_1395645 ) ) ( TRUCK-AT ?auto_1395650 ?auto_1395646 ) ( SURFACE-AT ?auto_1395642 ?auto_1395646 ) ( CLEAR ?auto_1395642 ) ( LIFTING ?auto_1395649 ?auto_1395643 ) ( IS-CRATE ?auto_1395643 ) ( ON ?auto_1395632 ?auto_1395631 ) ( ON ?auto_1395633 ?auto_1395632 ) ( ON ?auto_1395634 ?auto_1395633 ) ( ON ?auto_1395635 ?auto_1395634 ) ( ON ?auto_1395636 ?auto_1395635 ) ( ON ?auto_1395637 ?auto_1395636 ) ( ON ?auto_1395638 ?auto_1395637 ) ( ON ?auto_1395639 ?auto_1395638 ) ( ON ?auto_1395640 ?auto_1395639 ) ( ON ?auto_1395641 ?auto_1395640 ) ( ON ?auto_1395642 ?auto_1395641 ) ( not ( = ?auto_1395631 ?auto_1395632 ) ) ( not ( = ?auto_1395631 ?auto_1395633 ) ) ( not ( = ?auto_1395631 ?auto_1395634 ) ) ( not ( = ?auto_1395631 ?auto_1395635 ) ) ( not ( = ?auto_1395631 ?auto_1395636 ) ) ( not ( = ?auto_1395631 ?auto_1395637 ) ) ( not ( = ?auto_1395631 ?auto_1395638 ) ) ( not ( = ?auto_1395631 ?auto_1395639 ) ) ( not ( = ?auto_1395631 ?auto_1395640 ) ) ( not ( = ?auto_1395631 ?auto_1395641 ) ) ( not ( = ?auto_1395631 ?auto_1395642 ) ) ( not ( = ?auto_1395631 ?auto_1395643 ) ) ( not ( = ?auto_1395631 ?auto_1395644 ) ) ( not ( = ?auto_1395631 ?auto_1395645 ) ) ( not ( = ?auto_1395632 ?auto_1395633 ) ) ( not ( = ?auto_1395632 ?auto_1395634 ) ) ( not ( = ?auto_1395632 ?auto_1395635 ) ) ( not ( = ?auto_1395632 ?auto_1395636 ) ) ( not ( = ?auto_1395632 ?auto_1395637 ) ) ( not ( = ?auto_1395632 ?auto_1395638 ) ) ( not ( = ?auto_1395632 ?auto_1395639 ) ) ( not ( = ?auto_1395632 ?auto_1395640 ) ) ( not ( = ?auto_1395632 ?auto_1395641 ) ) ( not ( = ?auto_1395632 ?auto_1395642 ) ) ( not ( = ?auto_1395632 ?auto_1395643 ) ) ( not ( = ?auto_1395632 ?auto_1395644 ) ) ( not ( = ?auto_1395632 ?auto_1395645 ) ) ( not ( = ?auto_1395633 ?auto_1395634 ) ) ( not ( = ?auto_1395633 ?auto_1395635 ) ) ( not ( = ?auto_1395633 ?auto_1395636 ) ) ( not ( = ?auto_1395633 ?auto_1395637 ) ) ( not ( = ?auto_1395633 ?auto_1395638 ) ) ( not ( = ?auto_1395633 ?auto_1395639 ) ) ( not ( = ?auto_1395633 ?auto_1395640 ) ) ( not ( = ?auto_1395633 ?auto_1395641 ) ) ( not ( = ?auto_1395633 ?auto_1395642 ) ) ( not ( = ?auto_1395633 ?auto_1395643 ) ) ( not ( = ?auto_1395633 ?auto_1395644 ) ) ( not ( = ?auto_1395633 ?auto_1395645 ) ) ( not ( = ?auto_1395634 ?auto_1395635 ) ) ( not ( = ?auto_1395634 ?auto_1395636 ) ) ( not ( = ?auto_1395634 ?auto_1395637 ) ) ( not ( = ?auto_1395634 ?auto_1395638 ) ) ( not ( = ?auto_1395634 ?auto_1395639 ) ) ( not ( = ?auto_1395634 ?auto_1395640 ) ) ( not ( = ?auto_1395634 ?auto_1395641 ) ) ( not ( = ?auto_1395634 ?auto_1395642 ) ) ( not ( = ?auto_1395634 ?auto_1395643 ) ) ( not ( = ?auto_1395634 ?auto_1395644 ) ) ( not ( = ?auto_1395634 ?auto_1395645 ) ) ( not ( = ?auto_1395635 ?auto_1395636 ) ) ( not ( = ?auto_1395635 ?auto_1395637 ) ) ( not ( = ?auto_1395635 ?auto_1395638 ) ) ( not ( = ?auto_1395635 ?auto_1395639 ) ) ( not ( = ?auto_1395635 ?auto_1395640 ) ) ( not ( = ?auto_1395635 ?auto_1395641 ) ) ( not ( = ?auto_1395635 ?auto_1395642 ) ) ( not ( = ?auto_1395635 ?auto_1395643 ) ) ( not ( = ?auto_1395635 ?auto_1395644 ) ) ( not ( = ?auto_1395635 ?auto_1395645 ) ) ( not ( = ?auto_1395636 ?auto_1395637 ) ) ( not ( = ?auto_1395636 ?auto_1395638 ) ) ( not ( = ?auto_1395636 ?auto_1395639 ) ) ( not ( = ?auto_1395636 ?auto_1395640 ) ) ( not ( = ?auto_1395636 ?auto_1395641 ) ) ( not ( = ?auto_1395636 ?auto_1395642 ) ) ( not ( = ?auto_1395636 ?auto_1395643 ) ) ( not ( = ?auto_1395636 ?auto_1395644 ) ) ( not ( = ?auto_1395636 ?auto_1395645 ) ) ( not ( = ?auto_1395637 ?auto_1395638 ) ) ( not ( = ?auto_1395637 ?auto_1395639 ) ) ( not ( = ?auto_1395637 ?auto_1395640 ) ) ( not ( = ?auto_1395637 ?auto_1395641 ) ) ( not ( = ?auto_1395637 ?auto_1395642 ) ) ( not ( = ?auto_1395637 ?auto_1395643 ) ) ( not ( = ?auto_1395637 ?auto_1395644 ) ) ( not ( = ?auto_1395637 ?auto_1395645 ) ) ( not ( = ?auto_1395638 ?auto_1395639 ) ) ( not ( = ?auto_1395638 ?auto_1395640 ) ) ( not ( = ?auto_1395638 ?auto_1395641 ) ) ( not ( = ?auto_1395638 ?auto_1395642 ) ) ( not ( = ?auto_1395638 ?auto_1395643 ) ) ( not ( = ?auto_1395638 ?auto_1395644 ) ) ( not ( = ?auto_1395638 ?auto_1395645 ) ) ( not ( = ?auto_1395639 ?auto_1395640 ) ) ( not ( = ?auto_1395639 ?auto_1395641 ) ) ( not ( = ?auto_1395639 ?auto_1395642 ) ) ( not ( = ?auto_1395639 ?auto_1395643 ) ) ( not ( = ?auto_1395639 ?auto_1395644 ) ) ( not ( = ?auto_1395639 ?auto_1395645 ) ) ( not ( = ?auto_1395640 ?auto_1395641 ) ) ( not ( = ?auto_1395640 ?auto_1395642 ) ) ( not ( = ?auto_1395640 ?auto_1395643 ) ) ( not ( = ?auto_1395640 ?auto_1395644 ) ) ( not ( = ?auto_1395640 ?auto_1395645 ) ) ( not ( = ?auto_1395641 ?auto_1395642 ) ) ( not ( = ?auto_1395641 ?auto_1395643 ) ) ( not ( = ?auto_1395641 ?auto_1395644 ) ) ( not ( = ?auto_1395641 ?auto_1395645 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1395642 ?auto_1395643 ?auto_1395644 )
      ( MAKE-13CRATE-VERIFY ?auto_1395631 ?auto_1395632 ?auto_1395633 ?auto_1395634 ?auto_1395635 ?auto_1395636 ?auto_1395637 ?auto_1395638 ?auto_1395639 ?auto_1395640 ?auto_1395641 ?auto_1395642 ?auto_1395643 ?auto_1395644 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1395814 - SURFACE
      ?auto_1395815 - SURFACE
      ?auto_1395816 - SURFACE
      ?auto_1395817 - SURFACE
      ?auto_1395818 - SURFACE
      ?auto_1395819 - SURFACE
      ?auto_1395820 - SURFACE
      ?auto_1395821 - SURFACE
      ?auto_1395822 - SURFACE
      ?auto_1395823 - SURFACE
      ?auto_1395824 - SURFACE
      ?auto_1395825 - SURFACE
      ?auto_1395826 - SURFACE
      ?auto_1395827 - SURFACE
    )
    :vars
    (
      ?auto_1395832 - HOIST
      ?auto_1395833 - PLACE
      ?auto_1395830 - PLACE
      ?auto_1395828 - HOIST
      ?auto_1395829 - SURFACE
      ?auto_1395831 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395832 ?auto_1395833 ) ( IS-CRATE ?auto_1395827 ) ( not ( = ?auto_1395826 ?auto_1395827 ) ) ( not ( = ?auto_1395825 ?auto_1395826 ) ) ( not ( = ?auto_1395825 ?auto_1395827 ) ) ( not ( = ?auto_1395830 ?auto_1395833 ) ) ( HOIST-AT ?auto_1395828 ?auto_1395830 ) ( not ( = ?auto_1395832 ?auto_1395828 ) ) ( AVAILABLE ?auto_1395828 ) ( SURFACE-AT ?auto_1395827 ?auto_1395830 ) ( ON ?auto_1395827 ?auto_1395829 ) ( CLEAR ?auto_1395827 ) ( not ( = ?auto_1395826 ?auto_1395829 ) ) ( not ( = ?auto_1395827 ?auto_1395829 ) ) ( not ( = ?auto_1395825 ?auto_1395829 ) ) ( TRUCK-AT ?auto_1395831 ?auto_1395833 ) ( SURFACE-AT ?auto_1395825 ?auto_1395833 ) ( CLEAR ?auto_1395825 ) ( IS-CRATE ?auto_1395826 ) ( AVAILABLE ?auto_1395832 ) ( IN ?auto_1395826 ?auto_1395831 ) ( ON ?auto_1395815 ?auto_1395814 ) ( ON ?auto_1395816 ?auto_1395815 ) ( ON ?auto_1395817 ?auto_1395816 ) ( ON ?auto_1395818 ?auto_1395817 ) ( ON ?auto_1395819 ?auto_1395818 ) ( ON ?auto_1395820 ?auto_1395819 ) ( ON ?auto_1395821 ?auto_1395820 ) ( ON ?auto_1395822 ?auto_1395821 ) ( ON ?auto_1395823 ?auto_1395822 ) ( ON ?auto_1395824 ?auto_1395823 ) ( ON ?auto_1395825 ?auto_1395824 ) ( not ( = ?auto_1395814 ?auto_1395815 ) ) ( not ( = ?auto_1395814 ?auto_1395816 ) ) ( not ( = ?auto_1395814 ?auto_1395817 ) ) ( not ( = ?auto_1395814 ?auto_1395818 ) ) ( not ( = ?auto_1395814 ?auto_1395819 ) ) ( not ( = ?auto_1395814 ?auto_1395820 ) ) ( not ( = ?auto_1395814 ?auto_1395821 ) ) ( not ( = ?auto_1395814 ?auto_1395822 ) ) ( not ( = ?auto_1395814 ?auto_1395823 ) ) ( not ( = ?auto_1395814 ?auto_1395824 ) ) ( not ( = ?auto_1395814 ?auto_1395825 ) ) ( not ( = ?auto_1395814 ?auto_1395826 ) ) ( not ( = ?auto_1395814 ?auto_1395827 ) ) ( not ( = ?auto_1395814 ?auto_1395829 ) ) ( not ( = ?auto_1395815 ?auto_1395816 ) ) ( not ( = ?auto_1395815 ?auto_1395817 ) ) ( not ( = ?auto_1395815 ?auto_1395818 ) ) ( not ( = ?auto_1395815 ?auto_1395819 ) ) ( not ( = ?auto_1395815 ?auto_1395820 ) ) ( not ( = ?auto_1395815 ?auto_1395821 ) ) ( not ( = ?auto_1395815 ?auto_1395822 ) ) ( not ( = ?auto_1395815 ?auto_1395823 ) ) ( not ( = ?auto_1395815 ?auto_1395824 ) ) ( not ( = ?auto_1395815 ?auto_1395825 ) ) ( not ( = ?auto_1395815 ?auto_1395826 ) ) ( not ( = ?auto_1395815 ?auto_1395827 ) ) ( not ( = ?auto_1395815 ?auto_1395829 ) ) ( not ( = ?auto_1395816 ?auto_1395817 ) ) ( not ( = ?auto_1395816 ?auto_1395818 ) ) ( not ( = ?auto_1395816 ?auto_1395819 ) ) ( not ( = ?auto_1395816 ?auto_1395820 ) ) ( not ( = ?auto_1395816 ?auto_1395821 ) ) ( not ( = ?auto_1395816 ?auto_1395822 ) ) ( not ( = ?auto_1395816 ?auto_1395823 ) ) ( not ( = ?auto_1395816 ?auto_1395824 ) ) ( not ( = ?auto_1395816 ?auto_1395825 ) ) ( not ( = ?auto_1395816 ?auto_1395826 ) ) ( not ( = ?auto_1395816 ?auto_1395827 ) ) ( not ( = ?auto_1395816 ?auto_1395829 ) ) ( not ( = ?auto_1395817 ?auto_1395818 ) ) ( not ( = ?auto_1395817 ?auto_1395819 ) ) ( not ( = ?auto_1395817 ?auto_1395820 ) ) ( not ( = ?auto_1395817 ?auto_1395821 ) ) ( not ( = ?auto_1395817 ?auto_1395822 ) ) ( not ( = ?auto_1395817 ?auto_1395823 ) ) ( not ( = ?auto_1395817 ?auto_1395824 ) ) ( not ( = ?auto_1395817 ?auto_1395825 ) ) ( not ( = ?auto_1395817 ?auto_1395826 ) ) ( not ( = ?auto_1395817 ?auto_1395827 ) ) ( not ( = ?auto_1395817 ?auto_1395829 ) ) ( not ( = ?auto_1395818 ?auto_1395819 ) ) ( not ( = ?auto_1395818 ?auto_1395820 ) ) ( not ( = ?auto_1395818 ?auto_1395821 ) ) ( not ( = ?auto_1395818 ?auto_1395822 ) ) ( not ( = ?auto_1395818 ?auto_1395823 ) ) ( not ( = ?auto_1395818 ?auto_1395824 ) ) ( not ( = ?auto_1395818 ?auto_1395825 ) ) ( not ( = ?auto_1395818 ?auto_1395826 ) ) ( not ( = ?auto_1395818 ?auto_1395827 ) ) ( not ( = ?auto_1395818 ?auto_1395829 ) ) ( not ( = ?auto_1395819 ?auto_1395820 ) ) ( not ( = ?auto_1395819 ?auto_1395821 ) ) ( not ( = ?auto_1395819 ?auto_1395822 ) ) ( not ( = ?auto_1395819 ?auto_1395823 ) ) ( not ( = ?auto_1395819 ?auto_1395824 ) ) ( not ( = ?auto_1395819 ?auto_1395825 ) ) ( not ( = ?auto_1395819 ?auto_1395826 ) ) ( not ( = ?auto_1395819 ?auto_1395827 ) ) ( not ( = ?auto_1395819 ?auto_1395829 ) ) ( not ( = ?auto_1395820 ?auto_1395821 ) ) ( not ( = ?auto_1395820 ?auto_1395822 ) ) ( not ( = ?auto_1395820 ?auto_1395823 ) ) ( not ( = ?auto_1395820 ?auto_1395824 ) ) ( not ( = ?auto_1395820 ?auto_1395825 ) ) ( not ( = ?auto_1395820 ?auto_1395826 ) ) ( not ( = ?auto_1395820 ?auto_1395827 ) ) ( not ( = ?auto_1395820 ?auto_1395829 ) ) ( not ( = ?auto_1395821 ?auto_1395822 ) ) ( not ( = ?auto_1395821 ?auto_1395823 ) ) ( not ( = ?auto_1395821 ?auto_1395824 ) ) ( not ( = ?auto_1395821 ?auto_1395825 ) ) ( not ( = ?auto_1395821 ?auto_1395826 ) ) ( not ( = ?auto_1395821 ?auto_1395827 ) ) ( not ( = ?auto_1395821 ?auto_1395829 ) ) ( not ( = ?auto_1395822 ?auto_1395823 ) ) ( not ( = ?auto_1395822 ?auto_1395824 ) ) ( not ( = ?auto_1395822 ?auto_1395825 ) ) ( not ( = ?auto_1395822 ?auto_1395826 ) ) ( not ( = ?auto_1395822 ?auto_1395827 ) ) ( not ( = ?auto_1395822 ?auto_1395829 ) ) ( not ( = ?auto_1395823 ?auto_1395824 ) ) ( not ( = ?auto_1395823 ?auto_1395825 ) ) ( not ( = ?auto_1395823 ?auto_1395826 ) ) ( not ( = ?auto_1395823 ?auto_1395827 ) ) ( not ( = ?auto_1395823 ?auto_1395829 ) ) ( not ( = ?auto_1395824 ?auto_1395825 ) ) ( not ( = ?auto_1395824 ?auto_1395826 ) ) ( not ( = ?auto_1395824 ?auto_1395827 ) ) ( not ( = ?auto_1395824 ?auto_1395829 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1395825 ?auto_1395826 ?auto_1395827 )
      ( MAKE-13CRATE-VERIFY ?auto_1395814 ?auto_1395815 ?auto_1395816 ?auto_1395817 ?auto_1395818 ?auto_1395819 ?auto_1395820 ?auto_1395821 ?auto_1395822 ?auto_1395823 ?auto_1395824 ?auto_1395825 ?auto_1395826 ?auto_1395827 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1410055 - SURFACE
      ?auto_1410056 - SURFACE
      ?auto_1410057 - SURFACE
      ?auto_1410058 - SURFACE
      ?auto_1410059 - SURFACE
      ?auto_1410060 - SURFACE
      ?auto_1410061 - SURFACE
      ?auto_1410062 - SURFACE
      ?auto_1410063 - SURFACE
      ?auto_1410064 - SURFACE
      ?auto_1410065 - SURFACE
      ?auto_1410066 - SURFACE
      ?auto_1410067 - SURFACE
      ?auto_1410068 - SURFACE
      ?auto_1410069 - SURFACE
    )
    :vars
    (
      ?auto_1410071 - HOIST
      ?auto_1410070 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1410071 ?auto_1410070 ) ( SURFACE-AT ?auto_1410068 ?auto_1410070 ) ( CLEAR ?auto_1410068 ) ( LIFTING ?auto_1410071 ?auto_1410069 ) ( IS-CRATE ?auto_1410069 ) ( not ( = ?auto_1410068 ?auto_1410069 ) ) ( ON ?auto_1410056 ?auto_1410055 ) ( ON ?auto_1410057 ?auto_1410056 ) ( ON ?auto_1410058 ?auto_1410057 ) ( ON ?auto_1410059 ?auto_1410058 ) ( ON ?auto_1410060 ?auto_1410059 ) ( ON ?auto_1410061 ?auto_1410060 ) ( ON ?auto_1410062 ?auto_1410061 ) ( ON ?auto_1410063 ?auto_1410062 ) ( ON ?auto_1410064 ?auto_1410063 ) ( ON ?auto_1410065 ?auto_1410064 ) ( ON ?auto_1410066 ?auto_1410065 ) ( ON ?auto_1410067 ?auto_1410066 ) ( ON ?auto_1410068 ?auto_1410067 ) ( not ( = ?auto_1410055 ?auto_1410056 ) ) ( not ( = ?auto_1410055 ?auto_1410057 ) ) ( not ( = ?auto_1410055 ?auto_1410058 ) ) ( not ( = ?auto_1410055 ?auto_1410059 ) ) ( not ( = ?auto_1410055 ?auto_1410060 ) ) ( not ( = ?auto_1410055 ?auto_1410061 ) ) ( not ( = ?auto_1410055 ?auto_1410062 ) ) ( not ( = ?auto_1410055 ?auto_1410063 ) ) ( not ( = ?auto_1410055 ?auto_1410064 ) ) ( not ( = ?auto_1410055 ?auto_1410065 ) ) ( not ( = ?auto_1410055 ?auto_1410066 ) ) ( not ( = ?auto_1410055 ?auto_1410067 ) ) ( not ( = ?auto_1410055 ?auto_1410068 ) ) ( not ( = ?auto_1410055 ?auto_1410069 ) ) ( not ( = ?auto_1410056 ?auto_1410057 ) ) ( not ( = ?auto_1410056 ?auto_1410058 ) ) ( not ( = ?auto_1410056 ?auto_1410059 ) ) ( not ( = ?auto_1410056 ?auto_1410060 ) ) ( not ( = ?auto_1410056 ?auto_1410061 ) ) ( not ( = ?auto_1410056 ?auto_1410062 ) ) ( not ( = ?auto_1410056 ?auto_1410063 ) ) ( not ( = ?auto_1410056 ?auto_1410064 ) ) ( not ( = ?auto_1410056 ?auto_1410065 ) ) ( not ( = ?auto_1410056 ?auto_1410066 ) ) ( not ( = ?auto_1410056 ?auto_1410067 ) ) ( not ( = ?auto_1410056 ?auto_1410068 ) ) ( not ( = ?auto_1410056 ?auto_1410069 ) ) ( not ( = ?auto_1410057 ?auto_1410058 ) ) ( not ( = ?auto_1410057 ?auto_1410059 ) ) ( not ( = ?auto_1410057 ?auto_1410060 ) ) ( not ( = ?auto_1410057 ?auto_1410061 ) ) ( not ( = ?auto_1410057 ?auto_1410062 ) ) ( not ( = ?auto_1410057 ?auto_1410063 ) ) ( not ( = ?auto_1410057 ?auto_1410064 ) ) ( not ( = ?auto_1410057 ?auto_1410065 ) ) ( not ( = ?auto_1410057 ?auto_1410066 ) ) ( not ( = ?auto_1410057 ?auto_1410067 ) ) ( not ( = ?auto_1410057 ?auto_1410068 ) ) ( not ( = ?auto_1410057 ?auto_1410069 ) ) ( not ( = ?auto_1410058 ?auto_1410059 ) ) ( not ( = ?auto_1410058 ?auto_1410060 ) ) ( not ( = ?auto_1410058 ?auto_1410061 ) ) ( not ( = ?auto_1410058 ?auto_1410062 ) ) ( not ( = ?auto_1410058 ?auto_1410063 ) ) ( not ( = ?auto_1410058 ?auto_1410064 ) ) ( not ( = ?auto_1410058 ?auto_1410065 ) ) ( not ( = ?auto_1410058 ?auto_1410066 ) ) ( not ( = ?auto_1410058 ?auto_1410067 ) ) ( not ( = ?auto_1410058 ?auto_1410068 ) ) ( not ( = ?auto_1410058 ?auto_1410069 ) ) ( not ( = ?auto_1410059 ?auto_1410060 ) ) ( not ( = ?auto_1410059 ?auto_1410061 ) ) ( not ( = ?auto_1410059 ?auto_1410062 ) ) ( not ( = ?auto_1410059 ?auto_1410063 ) ) ( not ( = ?auto_1410059 ?auto_1410064 ) ) ( not ( = ?auto_1410059 ?auto_1410065 ) ) ( not ( = ?auto_1410059 ?auto_1410066 ) ) ( not ( = ?auto_1410059 ?auto_1410067 ) ) ( not ( = ?auto_1410059 ?auto_1410068 ) ) ( not ( = ?auto_1410059 ?auto_1410069 ) ) ( not ( = ?auto_1410060 ?auto_1410061 ) ) ( not ( = ?auto_1410060 ?auto_1410062 ) ) ( not ( = ?auto_1410060 ?auto_1410063 ) ) ( not ( = ?auto_1410060 ?auto_1410064 ) ) ( not ( = ?auto_1410060 ?auto_1410065 ) ) ( not ( = ?auto_1410060 ?auto_1410066 ) ) ( not ( = ?auto_1410060 ?auto_1410067 ) ) ( not ( = ?auto_1410060 ?auto_1410068 ) ) ( not ( = ?auto_1410060 ?auto_1410069 ) ) ( not ( = ?auto_1410061 ?auto_1410062 ) ) ( not ( = ?auto_1410061 ?auto_1410063 ) ) ( not ( = ?auto_1410061 ?auto_1410064 ) ) ( not ( = ?auto_1410061 ?auto_1410065 ) ) ( not ( = ?auto_1410061 ?auto_1410066 ) ) ( not ( = ?auto_1410061 ?auto_1410067 ) ) ( not ( = ?auto_1410061 ?auto_1410068 ) ) ( not ( = ?auto_1410061 ?auto_1410069 ) ) ( not ( = ?auto_1410062 ?auto_1410063 ) ) ( not ( = ?auto_1410062 ?auto_1410064 ) ) ( not ( = ?auto_1410062 ?auto_1410065 ) ) ( not ( = ?auto_1410062 ?auto_1410066 ) ) ( not ( = ?auto_1410062 ?auto_1410067 ) ) ( not ( = ?auto_1410062 ?auto_1410068 ) ) ( not ( = ?auto_1410062 ?auto_1410069 ) ) ( not ( = ?auto_1410063 ?auto_1410064 ) ) ( not ( = ?auto_1410063 ?auto_1410065 ) ) ( not ( = ?auto_1410063 ?auto_1410066 ) ) ( not ( = ?auto_1410063 ?auto_1410067 ) ) ( not ( = ?auto_1410063 ?auto_1410068 ) ) ( not ( = ?auto_1410063 ?auto_1410069 ) ) ( not ( = ?auto_1410064 ?auto_1410065 ) ) ( not ( = ?auto_1410064 ?auto_1410066 ) ) ( not ( = ?auto_1410064 ?auto_1410067 ) ) ( not ( = ?auto_1410064 ?auto_1410068 ) ) ( not ( = ?auto_1410064 ?auto_1410069 ) ) ( not ( = ?auto_1410065 ?auto_1410066 ) ) ( not ( = ?auto_1410065 ?auto_1410067 ) ) ( not ( = ?auto_1410065 ?auto_1410068 ) ) ( not ( = ?auto_1410065 ?auto_1410069 ) ) ( not ( = ?auto_1410066 ?auto_1410067 ) ) ( not ( = ?auto_1410066 ?auto_1410068 ) ) ( not ( = ?auto_1410066 ?auto_1410069 ) ) ( not ( = ?auto_1410067 ?auto_1410068 ) ) ( not ( = ?auto_1410067 ?auto_1410069 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1410068 ?auto_1410069 )
      ( MAKE-14CRATE-VERIFY ?auto_1410055 ?auto_1410056 ?auto_1410057 ?auto_1410058 ?auto_1410059 ?auto_1410060 ?auto_1410061 ?auto_1410062 ?auto_1410063 ?auto_1410064 ?auto_1410065 ?auto_1410066 ?auto_1410067 ?auto_1410068 ?auto_1410069 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1410215 - SURFACE
      ?auto_1410216 - SURFACE
      ?auto_1410217 - SURFACE
      ?auto_1410218 - SURFACE
      ?auto_1410219 - SURFACE
      ?auto_1410220 - SURFACE
      ?auto_1410221 - SURFACE
      ?auto_1410222 - SURFACE
      ?auto_1410223 - SURFACE
      ?auto_1410224 - SURFACE
      ?auto_1410225 - SURFACE
      ?auto_1410226 - SURFACE
      ?auto_1410227 - SURFACE
      ?auto_1410228 - SURFACE
      ?auto_1410229 - SURFACE
    )
    :vars
    (
      ?auto_1410230 - HOIST
      ?auto_1410232 - PLACE
      ?auto_1410231 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1410230 ?auto_1410232 ) ( SURFACE-AT ?auto_1410228 ?auto_1410232 ) ( CLEAR ?auto_1410228 ) ( IS-CRATE ?auto_1410229 ) ( not ( = ?auto_1410228 ?auto_1410229 ) ) ( TRUCK-AT ?auto_1410231 ?auto_1410232 ) ( AVAILABLE ?auto_1410230 ) ( IN ?auto_1410229 ?auto_1410231 ) ( ON ?auto_1410228 ?auto_1410227 ) ( not ( = ?auto_1410227 ?auto_1410228 ) ) ( not ( = ?auto_1410227 ?auto_1410229 ) ) ( ON ?auto_1410216 ?auto_1410215 ) ( ON ?auto_1410217 ?auto_1410216 ) ( ON ?auto_1410218 ?auto_1410217 ) ( ON ?auto_1410219 ?auto_1410218 ) ( ON ?auto_1410220 ?auto_1410219 ) ( ON ?auto_1410221 ?auto_1410220 ) ( ON ?auto_1410222 ?auto_1410221 ) ( ON ?auto_1410223 ?auto_1410222 ) ( ON ?auto_1410224 ?auto_1410223 ) ( ON ?auto_1410225 ?auto_1410224 ) ( ON ?auto_1410226 ?auto_1410225 ) ( ON ?auto_1410227 ?auto_1410226 ) ( not ( = ?auto_1410215 ?auto_1410216 ) ) ( not ( = ?auto_1410215 ?auto_1410217 ) ) ( not ( = ?auto_1410215 ?auto_1410218 ) ) ( not ( = ?auto_1410215 ?auto_1410219 ) ) ( not ( = ?auto_1410215 ?auto_1410220 ) ) ( not ( = ?auto_1410215 ?auto_1410221 ) ) ( not ( = ?auto_1410215 ?auto_1410222 ) ) ( not ( = ?auto_1410215 ?auto_1410223 ) ) ( not ( = ?auto_1410215 ?auto_1410224 ) ) ( not ( = ?auto_1410215 ?auto_1410225 ) ) ( not ( = ?auto_1410215 ?auto_1410226 ) ) ( not ( = ?auto_1410215 ?auto_1410227 ) ) ( not ( = ?auto_1410215 ?auto_1410228 ) ) ( not ( = ?auto_1410215 ?auto_1410229 ) ) ( not ( = ?auto_1410216 ?auto_1410217 ) ) ( not ( = ?auto_1410216 ?auto_1410218 ) ) ( not ( = ?auto_1410216 ?auto_1410219 ) ) ( not ( = ?auto_1410216 ?auto_1410220 ) ) ( not ( = ?auto_1410216 ?auto_1410221 ) ) ( not ( = ?auto_1410216 ?auto_1410222 ) ) ( not ( = ?auto_1410216 ?auto_1410223 ) ) ( not ( = ?auto_1410216 ?auto_1410224 ) ) ( not ( = ?auto_1410216 ?auto_1410225 ) ) ( not ( = ?auto_1410216 ?auto_1410226 ) ) ( not ( = ?auto_1410216 ?auto_1410227 ) ) ( not ( = ?auto_1410216 ?auto_1410228 ) ) ( not ( = ?auto_1410216 ?auto_1410229 ) ) ( not ( = ?auto_1410217 ?auto_1410218 ) ) ( not ( = ?auto_1410217 ?auto_1410219 ) ) ( not ( = ?auto_1410217 ?auto_1410220 ) ) ( not ( = ?auto_1410217 ?auto_1410221 ) ) ( not ( = ?auto_1410217 ?auto_1410222 ) ) ( not ( = ?auto_1410217 ?auto_1410223 ) ) ( not ( = ?auto_1410217 ?auto_1410224 ) ) ( not ( = ?auto_1410217 ?auto_1410225 ) ) ( not ( = ?auto_1410217 ?auto_1410226 ) ) ( not ( = ?auto_1410217 ?auto_1410227 ) ) ( not ( = ?auto_1410217 ?auto_1410228 ) ) ( not ( = ?auto_1410217 ?auto_1410229 ) ) ( not ( = ?auto_1410218 ?auto_1410219 ) ) ( not ( = ?auto_1410218 ?auto_1410220 ) ) ( not ( = ?auto_1410218 ?auto_1410221 ) ) ( not ( = ?auto_1410218 ?auto_1410222 ) ) ( not ( = ?auto_1410218 ?auto_1410223 ) ) ( not ( = ?auto_1410218 ?auto_1410224 ) ) ( not ( = ?auto_1410218 ?auto_1410225 ) ) ( not ( = ?auto_1410218 ?auto_1410226 ) ) ( not ( = ?auto_1410218 ?auto_1410227 ) ) ( not ( = ?auto_1410218 ?auto_1410228 ) ) ( not ( = ?auto_1410218 ?auto_1410229 ) ) ( not ( = ?auto_1410219 ?auto_1410220 ) ) ( not ( = ?auto_1410219 ?auto_1410221 ) ) ( not ( = ?auto_1410219 ?auto_1410222 ) ) ( not ( = ?auto_1410219 ?auto_1410223 ) ) ( not ( = ?auto_1410219 ?auto_1410224 ) ) ( not ( = ?auto_1410219 ?auto_1410225 ) ) ( not ( = ?auto_1410219 ?auto_1410226 ) ) ( not ( = ?auto_1410219 ?auto_1410227 ) ) ( not ( = ?auto_1410219 ?auto_1410228 ) ) ( not ( = ?auto_1410219 ?auto_1410229 ) ) ( not ( = ?auto_1410220 ?auto_1410221 ) ) ( not ( = ?auto_1410220 ?auto_1410222 ) ) ( not ( = ?auto_1410220 ?auto_1410223 ) ) ( not ( = ?auto_1410220 ?auto_1410224 ) ) ( not ( = ?auto_1410220 ?auto_1410225 ) ) ( not ( = ?auto_1410220 ?auto_1410226 ) ) ( not ( = ?auto_1410220 ?auto_1410227 ) ) ( not ( = ?auto_1410220 ?auto_1410228 ) ) ( not ( = ?auto_1410220 ?auto_1410229 ) ) ( not ( = ?auto_1410221 ?auto_1410222 ) ) ( not ( = ?auto_1410221 ?auto_1410223 ) ) ( not ( = ?auto_1410221 ?auto_1410224 ) ) ( not ( = ?auto_1410221 ?auto_1410225 ) ) ( not ( = ?auto_1410221 ?auto_1410226 ) ) ( not ( = ?auto_1410221 ?auto_1410227 ) ) ( not ( = ?auto_1410221 ?auto_1410228 ) ) ( not ( = ?auto_1410221 ?auto_1410229 ) ) ( not ( = ?auto_1410222 ?auto_1410223 ) ) ( not ( = ?auto_1410222 ?auto_1410224 ) ) ( not ( = ?auto_1410222 ?auto_1410225 ) ) ( not ( = ?auto_1410222 ?auto_1410226 ) ) ( not ( = ?auto_1410222 ?auto_1410227 ) ) ( not ( = ?auto_1410222 ?auto_1410228 ) ) ( not ( = ?auto_1410222 ?auto_1410229 ) ) ( not ( = ?auto_1410223 ?auto_1410224 ) ) ( not ( = ?auto_1410223 ?auto_1410225 ) ) ( not ( = ?auto_1410223 ?auto_1410226 ) ) ( not ( = ?auto_1410223 ?auto_1410227 ) ) ( not ( = ?auto_1410223 ?auto_1410228 ) ) ( not ( = ?auto_1410223 ?auto_1410229 ) ) ( not ( = ?auto_1410224 ?auto_1410225 ) ) ( not ( = ?auto_1410224 ?auto_1410226 ) ) ( not ( = ?auto_1410224 ?auto_1410227 ) ) ( not ( = ?auto_1410224 ?auto_1410228 ) ) ( not ( = ?auto_1410224 ?auto_1410229 ) ) ( not ( = ?auto_1410225 ?auto_1410226 ) ) ( not ( = ?auto_1410225 ?auto_1410227 ) ) ( not ( = ?auto_1410225 ?auto_1410228 ) ) ( not ( = ?auto_1410225 ?auto_1410229 ) ) ( not ( = ?auto_1410226 ?auto_1410227 ) ) ( not ( = ?auto_1410226 ?auto_1410228 ) ) ( not ( = ?auto_1410226 ?auto_1410229 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1410227 ?auto_1410228 ?auto_1410229 )
      ( MAKE-14CRATE-VERIFY ?auto_1410215 ?auto_1410216 ?auto_1410217 ?auto_1410218 ?auto_1410219 ?auto_1410220 ?auto_1410221 ?auto_1410222 ?auto_1410223 ?auto_1410224 ?auto_1410225 ?auto_1410226 ?auto_1410227 ?auto_1410228 ?auto_1410229 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1410390 - SURFACE
      ?auto_1410391 - SURFACE
      ?auto_1410392 - SURFACE
      ?auto_1410393 - SURFACE
      ?auto_1410394 - SURFACE
      ?auto_1410395 - SURFACE
      ?auto_1410396 - SURFACE
      ?auto_1410397 - SURFACE
      ?auto_1410398 - SURFACE
      ?auto_1410399 - SURFACE
      ?auto_1410400 - SURFACE
      ?auto_1410401 - SURFACE
      ?auto_1410402 - SURFACE
      ?auto_1410403 - SURFACE
      ?auto_1410404 - SURFACE
    )
    :vars
    (
      ?auto_1410405 - HOIST
      ?auto_1410408 - PLACE
      ?auto_1410407 - TRUCK
      ?auto_1410406 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1410405 ?auto_1410408 ) ( SURFACE-AT ?auto_1410403 ?auto_1410408 ) ( CLEAR ?auto_1410403 ) ( IS-CRATE ?auto_1410404 ) ( not ( = ?auto_1410403 ?auto_1410404 ) ) ( AVAILABLE ?auto_1410405 ) ( IN ?auto_1410404 ?auto_1410407 ) ( ON ?auto_1410403 ?auto_1410402 ) ( not ( = ?auto_1410402 ?auto_1410403 ) ) ( not ( = ?auto_1410402 ?auto_1410404 ) ) ( TRUCK-AT ?auto_1410407 ?auto_1410406 ) ( not ( = ?auto_1410406 ?auto_1410408 ) ) ( ON ?auto_1410391 ?auto_1410390 ) ( ON ?auto_1410392 ?auto_1410391 ) ( ON ?auto_1410393 ?auto_1410392 ) ( ON ?auto_1410394 ?auto_1410393 ) ( ON ?auto_1410395 ?auto_1410394 ) ( ON ?auto_1410396 ?auto_1410395 ) ( ON ?auto_1410397 ?auto_1410396 ) ( ON ?auto_1410398 ?auto_1410397 ) ( ON ?auto_1410399 ?auto_1410398 ) ( ON ?auto_1410400 ?auto_1410399 ) ( ON ?auto_1410401 ?auto_1410400 ) ( ON ?auto_1410402 ?auto_1410401 ) ( not ( = ?auto_1410390 ?auto_1410391 ) ) ( not ( = ?auto_1410390 ?auto_1410392 ) ) ( not ( = ?auto_1410390 ?auto_1410393 ) ) ( not ( = ?auto_1410390 ?auto_1410394 ) ) ( not ( = ?auto_1410390 ?auto_1410395 ) ) ( not ( = ?auto_1410390 ?auto_1410396 ) ) ( not ( = ?auto_1410390 ?auto_1410397 ) ) ( not ( = ?auto_1410390 ?auto_1410398 ) ) ( not ( = ?auto_1410390 ?auto_1410399 ) ) ( not ( = ?auto_1410390 ?auto_1410400 ) ) ( not ( = ?auto_1410390 ?auto_1410401 ) ) ( not ( = ?auto_1410390 ?auto_1410402 ) ) ( not ( = ?auto_1410390 ?auto_1410403 ) ) ( not ( = ?auto_1410390 ?auto_1410404 ) ) ( not ( = ?auto_1410391 ?auto_1410392 ) ) ( not ( = ?auto_1410391 ?auto_1410393 ) ) ( not ( = ?auto_1410391 ?auto_1410394 ) ) ( not ( = ?auto_1410391 ?auto_1410395 ) ) ( not ( = ?auto_1410391 ?auto_1410396 ) ) ( not ( = ?auto_1410391 ?auto_1410397 ) ) ( not ( = ?auto_1410391 ?auto_1410398 ) ) ( not ( = ?auto_1410391 ?auto_1410399 ) ) ( not ( = ?auto_1410391 ?auto_1410400 ) ) ( not ( = ?auto_1410391 ?auto_1410401 ) ) ( not ( = ?auto_1410391 ?auto_1410402 ) ) ( not ( = ?auto_1410391 ?auto_1410403 ) ) ( not ( = ?auto_1410391 ?auto_1410404 ) ) ( not ( = ?auto_1410392 ?auto_1410393 ) ) ( not ( = ?auto_1410392 ?auto_1410394 ) ) ( not ( = ?auto_1410392 ?auto_1410395 ) ) ( not ( = ?auto_1410392 ?auto_1410396 ) ) ( not ( = ?auto_1410392 ?auto_1410397 ) ) ( not ( = ?auto_1410392 ?auto_1410398 ) ) ( not ( = ?auto_1410392 ?auto_1410399 ) ) ( not ( = ?auto_1410392 ?auto_1410400 ) ) ( not ( = ?auto_1410392 ?auto_1410401 ) ) ( not ( = ?auto_1410392 ?auto_1410402 ) ) ( not ( = ?auto_1410392 ?auto_1410403 ) ) ( not ( = ?auto_1410392 ?auto_1410404 ) ) ( not ( = ?auto_1410393 ?auto_1410394 ) ) ( not ( = ?auto_1410393 ?auto_1410395 ) ) ( not ( = ?auto_1410393 ?auto_1410396 ) ) ( not ( = ?auto_1410393 ?auto_1410397 ) ) ( not ( = ?auto_1410393 ?auto_1410398 ) ) ( not ( = ?auto_1410393 ?auto_1410399 ) ) ( not ( = ?auto_1410393 ?auto_1410400 ) ) ( not ( = ?auto_1410393 ?auto_1410401 ) ) ( not ( = ?auto_1410393 ?auto_1410402 ) ) ( not ( = ?auto_1410393 ?auto_1410403 ) ) ( not ( = ?auto_1410393 ?auto_1410404 ) ) ( not ( = ?auto_1410394 ?auto_1410395 ) ) ( not ( = ?auto_1410394 ?auto_1410396 ) ) ( not ( = ?auto_1410394 ?auto_1410397 ) ) ( not ( = ?auto_1410394 ?auto_1410398 ) ) ( not ( = ?auto_1410394 ?auto_1410399 ) ) ( not ( = ?auto_1410394 ?auto_1410400 ) ) ( not ( = ?auto_1410394 ?auto_1410401 ) ) ( not ( = ?auto_1410394 ?auto_1410402 ) ) ( not ( = ?auto_1410394 ?auto_1410403 ) ) ( not ( = ?auto_1410394 ?auto_1410404 ) ) ( not ( = ?auto_1410395 ?auto_1410396 ) ) ( not ( = ?auto_1410395 ?auto_1410397 ) ) ( not ( = ?auto_1410395 ?auto_1410398 ) ) ( not ( = ?auto_1410395 ?auto_1410399 ) ) ( not ( = ?auto_1410395 ?auto_1410400 ) ) ( not ( = ?auto_1410395 ?auto_1410401 ) ) ( not ( = ?auto_1410395 ?auto_1410402 ) ) ( not ( = ?auto_1410395 ?auto_1410403 ) ) ( not ( = ?auto_1410395 ?auto_1410404 ) ) ( not ( = ?auto_1410396 ?auto_1410397 ) ) ( not ( = ?auto_1410396 ?auto_1410398 ) ) ( not ( = ?auto_1410396 ?auto_1410399 ) ) ( not ( = ?auto_1410396 ?auto_1410400 ) ) ( not ( = ?auto_1410396 ?auto_1410401 ) ) ( not ( = ?auto_1410396 ?auto_1410402 ) ) ( not ( = ?auto_1410396 ?auto_1410403 ) ) ( not ( = ?auto_1410396 ?auto_1410404 ) ) ( not ( = ?auto_1410397 ?auto_1410398 ) ) ( not ( = ?auto_1410397 ?auto_1410399 ) ) ( not ( = ?auto_1410397 ?auto_1410400 ) ) ( not ( = ?auto_1410397 ?auto_1410401 ) ) ( not ( = ?auto_1410397 ?auto_1410402 ) ) ( not ( = ?auto_1410397 ?auto_1410403 ) ) ( not ( = ?auto_1410397 ?auto_1410404 ) ) ( not ( = ?auto_1410398 ?auto_1410399 ) ) ( not ( = ?auto_1410398 ?auto_1410400 ) ) ( not ( = ?auto_1410398 ?auto_1410401 ) ) ( not ( = ?auto_1410398 ?auto_1410402 ) ) ( not ( = ?auto_1410398 ?auto_1410403 ) ) ( not ( = ?auto_1410398 ?auto_1410404 ) ) ( not ( = ?auto_1410399 ?auto_1410400 ) ) ( not ( = ?auto_1410399 ?auto_1410401 ) ) ( not ( = ?auto_1410399 ?auto_1410402 ) ) ( not ( = ?auto_1410399 ?auto_1410403 ) ) ( not ( = ?auto_1410399 ?auto_1410404 ) ) ( not ( = ?auto_1410400 ?auto_1410401 ) ) ( not ( = ?auto_1410400 ?auto_1410402 ) ) ( not ( = ?auto_1410400 ?auto_1410403 ) ) ( not ( = ?auto_1410400 ?auto_1410404 ) ) ( not ( = ?auto_1410401 ?auto_1410402 ) ) ( not ( = ?auto_1410401 ?auto_1410403 ) ) ( not ( = ?auto_1410401 ?auto_1410404 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1410402 ?auto_1410403 ?auto_1410404 )
      ( MAKE-14CRATE-VERIFY ?auto_1410390 ?auto_1410391 ?auto_1410392 ?auto_1410393 ?auto_1410394 ?auto_1410395 ?auto_1410396 ?auto_1410397 ?auto_1410398 ?auto_1410399 ?auto_1410400 ?auto_1410401 ?auto_1410402 ?auto_1410403 ?auto_1410404 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1410579 - SURFACE
      ?auto_1410580 - SURFACE
      ?auto_1410581 - SURFACE
      ?auto_1410582 - SURFACE
      ?auto_1410583 - SURFACE
      ?auto_1410584 - SURFACE
      ?auto_1410585 - SURFACE
      ?auto_1410586 - SURFACE
      ?auto_1410587 - SURFACE
      ?auto_1410588 - SURFACE
      ?auto_1410589 - SURFACE
      ?auto_1410590 - SURFACE
      ?auto_1410591 - SURFACE
      ?auto_1410592 - SURFACE
      ?auto_1410593 - SURFACE
    )
    :vars
    (
      ?auto_1410594 - HOIST
      ?auto_1410595 - PLACE
      ?auto_1410596 - TRUCK
      ?auto_1410597 - PLACE
      ?auto_1410598 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1410594 ?auto_1410595 ) ( SURFACE-AT ?auto_1410592 ?auto_1410595 ) ( CLEAR ?auto_1410592 ) ( IS-CRATE ?auto_1410593 ) ( not ( = ?auto_1410592 ?auto_1410593 ) ) ( AVAILABLE ?auto_1410594 ) ( ON ?auto_1410592 ?auto_1410591 ) ( not ( = ?auto_1410591 ?auto_1410592 ) ) ( not ( = ?auto_1410591 ?auto_1410593 ) ) ( TRUCK-AT ?auto_1410596 ?auto_1410597 ) ( not ( = ?auto_1410597 ?auto_1410595 ) ) ( HOIST-AT ?auto_1410598 ?auto_1410597 ) ( LIFTING ?auto_1410598 ?auto_1410593 ) ( not ( = ?auto_1410594 ?auto_1410598 ) ) ( ON ?auto_1410580 ?auto_1410579 ) ( ON ?auto_1410581 ?auto_1410580 ) ( ON ?auto_1410582 ?auto_1410581 ) ( ON ?auto_1410583 ?auto_1410582 ) ( ON ?auto_1410584 ?auto_1410583 ) ( ON ?auto_1410585 ?auto_1410584 ) ( ON ?auto_1410586 ?auto_1410585 ) ( ON ?auto_1410587 ?auto_1410586 ) ( ON ?auto_1410588 ?auto_1410587 ) ( ON ?auto_1410589 ?auto_1410588 ) ( ON ?auto_1410590 ?auto_1410589 ) ( ON ?auto_1410591 ?auto_1410590 ) ( not ( = ?auto_1410579 ?auto_1410580 ) ) ( not ( = ?auto_1410579 ?auto_1410581 ) ) ( not ( = ?auto_1410579 ?auto_1410582 ) ) ( not ( = ?auto_1410579 ?auto_1410583 ) ) ( not ( = ?auto_1410579 ?auto_1410584 ) ) ( not ( = ?auto_1410579 ?auto_1410585 ) ) ( not ( = ?auto_1410579 ?auto_1410586 ) ) ( not ( = ?auto_1410579 ?auto_1410587 ) ) ( not ( = ?auto_1410579 ?auto_1410588 ) ) ( not ( = ?auto_1410579 ?auto_1410589 ) ) ( not ( = ?auto_1410579 ?auto_1410590 ) ) ( not ( = ?auto_1410579 ?auto_1410591 ) ) ( not ( = ?auto_1410579 ?auto_1410592 ) ) ( not ( = ?auto_1410579 ?auto_1410593 ) ) ( not ( = ?auto_1410580 ?auto_1410581 ) ) ( not ( = ?auto_1410580 ?auto_1410582 ) ) ( not ( = ?auto_1410580 ?auto_1410583 ) ) ( not ( = ?auto_1410580 ?auto_1410584 ) ) ( not ( = ?auto_1410580 ?auto_1410585 ) ) ( not ( = ?auto_1410580 ?auto_1410586 ) ) ( not ( = ?auto_1410580 ?auto_1410587 ) ) ( not ( = ?auto_1410580 ?auto_1410588 ) ) ( not ( = ?auto_1410580 ?auto_1410589 ) ) ( not ( = ?auto_1410580 ?auto_1410590 ) ) ( not ( = ?auto_1410580 ?auto_1410591 ) ) ( not ( = ?auto_1410580 ?auto_1410592 ) ) ( not ( = ?auto_1410580 ?auto_1410593 ) ) ( not ( = ?auto_1410581 ?auto_1410582 ) ) ( not ( = ?auto_1410581 ?auto_1410583 ) ) ( not ( = ?auto_1410581 ?auto_1410584 ) ) ( not ( = ?auto_1410581 ?auto_1410585 ) ) ( not ( = ?auto_1410581 ?auto_1410586 ) ) ( not ( = ?auto_1410581 ?auto_1410587 ) ) ( not ( = ?auto_1410581 ?auto_1410588 ) ) ( not ( = ?auto_1410581 ?auto_1410589 ) ) ( not ( = ?auto_1410581 ?auto_1410590 ) ) ( not ( = ?auto_1410581 ?auto_1410591 ) ) ( not ( = ?auto_1410581 ?auto_1410592 ) ) ( not ( = ?auto_1410581 ?auto_1410593 ) ) ( not ( = ?auto_1410582 ?auto_1410583 ) ) ( not ( = ?auto_1410582 ?auto_1410584 ) ) ( not ( = ?auto_1410582 ?auto_1410585 ) ) ( not ( = ?auto_1410582 ?auto_1410586 ) ) ( not ( = ?auto_1410582 ?auto_1410587 ) ) ( not ( = ?auto_1410582 ?auto_1410588 ) ) ( not ( = ?auto_1410582 ?auto_1410589 ) ) ( not ( = ?auto_1410582 ?auto_1410590 ) ) ( not ( = ?auto_1410582 ?auto_1410591 ) ) ( not ( = ?auto_1410582 ?auto_1410592 ) ) ( not ( = ?auto_1410582 ?auto_1410593 ) ) ( not ( = ?auto_1410583 ?auto_1410584 ) ) ( not ( = ?auto_1410583 ?auto_1410585 ) ) ( not ( = ?auto_1410583 ?auto_1410586 ) ) ( not ( = ?auto_1410583 ?auto_1410587 ) ) ( not ( = ?auto_1410583 ?auto_1410588 ) ) ( not ( = ?auto_1410583 ?auto_1410589 ) ) ( not ( = ?auto_1410583 ?auto_1410590 ) ) ( not ( = ?auto_1410583 ?auto_1410591 ) ) ( not ( = ?auto_1410583 ?auto_1410592 ) ) ( not ( = ?auto_1410583 ?auto_1410593 ) ) ( not ( = ?auto_1410584 ?auto_1410585 ) ) ( not ( = ?auto_1410584 ?auto_1410586 ) ) ( not ( = ?auto_1410584 ?auto_1410587 ) ) ( not ( = ?auto_1410584 ?auto_1410588 ) ) ( not ( = ?auto_1410584 ?auto_1410589 ) ) ( not ( = ?auto_1410584 ?auto_1410590 ) ) ( not ( = ?auto_1410584 ?auto_1410591 ) ) ( not ( = ?auto_1410584 ?auto_1410592 ) ) ( not ( = ?auto_1410584 ?auto_1410593 ) ) ( not ( = ?auto_1410585 ?auto_1410586 ) ) ( not ( = ?auto_1410585 ?auto_1410587 ) ) ( not ( = ?auto_1410585 ?auto_1410588 ) ) ( not ( = ?auto_1410585 ?auto_1410589 ) ) ( not ( = ?auto_1410585 ?auto_1410590 ) ) ( not ( = ?auto_1410585 ?auto_1410591 ) ) ( not ( = ?auto_1410585 ?auto_1410592 ) ) ( not ( = ?auto_1410585 ?auto_1410593 ) ) ( not ( = ?auto_1410586 ?auto_1410587 ) ) ( not ( = ?auto_1410586 ?auto_1410588 ) ) ( not ( = ?auto_1410586 ?auto_1410589 ) ) ( not ( = ?auto_1410586 ?auto_1410590 ) ) ( not ( = ?auto_1410586 ?auto_1410591 ) ) ( not ( = ?auto_1410586 ?auto_1410592 ) ) ( not ( = ?auto_1410586 ?auto_1410593 ) ) ( not ( = ?auto_1410587 ?auto_1410588 ) ) ( not ( = ?auto_1410587 ?auto_1410589 ) ) ( not ( = ?auto_1410587 ?auto_1410590 ) ) ( not ( = ?auto_1410587 ?auto_1410591 ) ) ( not ( = ?auto_1410587 ?auto_1410592 ) ) ( not ( = ?auto_1410587 ?auto_1410593 ) ) ( not ( = ?auto_1410588 ?auto_1410589 ) ) ( not ( = ?auto_1410588 ?auto_1410590 ) ) ( not ( = ?auto_1410588 ?auto_1410591 ) ) ( not ( = ?auto_1410588 ?auto_1410592 ) ) ( not ( = ?auto_1410588 ?auto_1410593 ) ) ( not ( = ?auto_1410589 ?auto_1410590 ) ) ( not ( = ?auto_1410589 ?auto_1410591 ) ) ( not ( = ?auto_1410589 ?auto_1410592 ) ) ( not ( = ?auto_1410589 ?auto_1410593 ) ) ( not ( = ?auto_1410590 ?auto_1410591 ) ) ( not ( = ?auto_1410590 ?auto_1410592 ) ) ( not ( = ?auto_1410590 ?auto_1410593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1410591 ?auto_1410592 ?auto_1410593 )
      ( MAKE-14CRATE-VERIFY ?auto_1410579 ?auto_1410580 ?auto_1410581 ?auto_1410582 ?auto_1410583 ?auto_1410584 ?auto_1410585 ?auto_1410586 ?auto_1410587 ?auto_1410588 ?auto_1410589 ?auto_1410590 ?auto_1410591 ?auto_1410592 ?auto_1410593 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1410782 - SURFACE
      ?auto_1410783 - SURFACE
      ?auto_1410784 - SURFACE
      ?auto_1410785 - SURFACE
      ?auto_1410786 - SURFACE
      ?auto_1410787 - SURFACE
      ?auto_1410788 - SURFACE
      ?auto_1410789 - SURFACE
      ?auto_1410790 - SURFACE
      ?auto_1410791 - SURFACE
      ?auto_1410792 - SURFACE
      ?auto_1410793 - SURFACE
      ?auto_1410794 - SURFACE
      ?auto_1410795 - SURFACE
      ?auto_1410796 - SURFACE
    )
    :vars
    (
      ?auto_1410797 - HOIST
      ?auto_1410801 - PLACE
      ?auto_1410798 - TRUCK
      ?auto_1410800 - PLACE
      ?auto_1410799 - HOIST
      ?auto_1410802 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1410797 ?auto_1410801 ) ( SURFACE-AT ?auto_1410795 ?auto_1410801 ) ( CLEAR ?auto_1410795 ) ( IS-CRATE ?auto_1410796 ) ( not ( = ?auto_1410795 ?auto_1410796 ) ) ( AVAILABLE ?auto_1410797 ) ( ON ?auto_1410795 ?auto_1410794 ) ( not ( = ?auto_1410794 ?auto_1410795 ) ) ( not ( = ?auto_1410794 ?auto_1410796 ) ) ( TRUCK-AT ?auto_1410798 ?auto_1410800 ) ( not ( = ?auto_1410800 ?auto_1410801 ) ) ( HOIST-AT ?auto_1410799 ?auto_1410800 ) ( not ( = ?auto_1410797 ?auto_1410799 ) ) ( AVAILABLE ?auto_1410799 ) ( SURFACE-AT ?auto_1410796 ?auto_1410800 ) ( ON ?auto_1410796 ?auto_1410802 ) ( CLEAR ?auto_1410796 ) ( not ( = ?auto_1410795 ?auto_1410802 ) ) ( not ( = ?auto_1410796 ?auto_1410802 ) ) ( not ( = ?auto_1410794 ?auto_1410802 ) ) ( ON ?auto_1410783 ?auto_1410782 ) ( ON ?auto_1410784 ?auto_1410783 ) ( ON ?auto_1410785 ?auto_1410784 ) ( ON ?auto_1410786 ?auto_1410785 ) ( ON ?auto_1410787 ?auto_1410786 ) ( ON ?auto_1410788 ?auto_1410787 ) ( ON ?auto_1410789 ?auto_1410788 ) ( ON ?auto_1410790 ?auto_1410789 ) ( ON ?auto_1410791 ?auto_1410790 ) ( ON ?auto_1410792 ?auto_1410791 ) ( ON ?auto_1410793 ?auto_1410792 ) ( ON ?auto_1410794 ?auto_1410793 ) ( not ( = ?auto_1410782 ?auto_1410783 ) ) ( not ( = ?auto_1410782 ?auto_1410784 ) ) ( not ( = ?auto_1410782 ?auto_1410785 ) ) ( not ( = ?auto_1410782 ?auto_1410786 ) ) ( not ( = ?auto_1410782 ?auto_1410787 ) ) ( not ( = ?auto_1410782 ?auto_1410788 ) ) ( not ( = ?auto_1410782 ?auto_1410789 ) ) ( not ( = ?auto_1410782 ?auto_1410790 ) ) ( not ( = ?auto_1410782 ?auto_1410791 ) ) ( not ( = ?auto_1410782 ?auto_1410792 ) ) ( not ( = ?auto_1410782 ?auto_1410793 ) ) ( not ( = ?auto_1410782 ?auto_1410794 ) ) ( not ( = ?auto_1410782 ?auto_1410795 ) ) ( not ( = ?auto_1410782 ?auto_1410796 ) ) ( not ( = ?auto_1410782 ?auto_1410802 ) ) ( not ( = ?auto_1410783 ?auto_1410784 ) ) ( not ( = ?auto_1410783 ?auto_1410785 ) ) ( not ( = ?auto_1410783 ?auto_1410786 ) ) ( not ( = ?auto_1410783 ?auto_1410787 ) ) ( not ( = ?auto_1410783 ?auto_1410788 ) ) ( not ( = ?auto_1410783 ?auto_1410789 ) ) ( not ( = ?auto_1410783 ?auto_1410790 ) ) ( not ( = ?auto_1410783 ?auto_1410791 ) ) ( not ( = ?auto_1410783 ?auto_1410792 ) ) ( not ( = ?auto_1410783 ?auto_1410793 ) ) ( not ( = ?auto_1410783 ?auto_1410794 ) ) ( not ( = ?auto_1410783 ?auto_1410795 ) ) ( not ( = ?auto_1410783 ?auto_1410796 ) ) ( not ( = ?auto_1410783 ?auto_1410802 ) ) ( not ( = ?auto_1410784 ?auto_1410785 ) ) ( not ( = ?auto_1410784 ?auto_1410786 ) ) ( not ( = ?auto_1410784 ?auto_1410787 ) ) ( not ( = ?auto_1410784 ?auto_1410788 ) ) ( not ( = ?auto_1410784 ?auto_1410789 ) ) ( not ( = ?auto_1410784 ?auto_1410790 ) ) ( not ( = ?auto_1410784 ?auto_1410791 ) ) ( not ( = ?auto_1410784 ?auto_1410792 ) ) ( not ( = ?auto_1410784 ?auto_1410793 ) ) ( not ( = ?auto_1410784 ?auto_1410794 ) ) ( not ( = ?auto_1410784 ?auto_1410795 ) ) ( not ( = ?auto_1410784 ?auto_1410796 ) ) ( not ( = ?auto_1410784 ?auto_1410802 ) ) ( not ( = ?auto_1410785 ?auto_1410786 ) ) ( not ( = ?auto_1410785 ?auto_1410787 ) ) ( not ( = ?auto_1410785 ?auto_1410788 ) ) ( not ( = ?auto_1410785 ?auto_1410789 ) ) ( not ( = ?auto_1410785 ?auto_1410790 ) ) ( not ( = ?auto_1410785 ?auto_1410791 ) ) ( not ( = ?auto_1410785 ?auto_1410792 ) ) ( not ( = ?auto_1410785 ?auto_1410793 ) ) ( not ( = ?auto_1410785 ?auto_1410794 ) ) ( not ( = ?auto_1410785 ?auto_1410795 ) ) ( not ( = ?auto_1410785 ?auto_1410796 ) ) ( not ( = ?auto_1410785 ?auto_1410802 ) ) ( not ( = ?auto_1410786 ?auto_1410787 ) ) ( not ( = ?auto_1410786 ?auto_1410788 ) ) ( not ( = ?auto_1410786 ?auto_1410789 ) ) ( not ( = ?auto_1410786 ?auto_1410790 ) ) ( not ( = ?auto_1410786 ?auto_1410791 ) ) ( not ( = ?auto_1410786 ?auto_1410792 ) ) ( not ( = ?auto_1410786 ?auto_1410793 ) ) ( not ( = ?auto_1410786 ?auto_1410794 ) ) ( not ( = ?auto_1410786 ?auto_1410795 ) ) ( not ( = ?auto_1410786 ?auto_1410796 ) ) ( not ( = ?auto_1410786 ?auto_1410802 ) ) ( not ( = ?auto_1410787 ?auto_1410788 ) ) ( not ( = ?auto_1410787 ?auto_1410789 ) ) ( not ( = ?auto_1410787 ?auto_1410790 ) ) ( not ( = ?auto_1410787 ?auto_1410791 ) ) ( not ( = ?auto_1410787 ?auto_1410792 ) ) ( not ( = ?auto_1410787 ?auto_1410793 ) ) ( not ( = ?auto_1410787 ?auto_1410794 ) ) ( not ( = ?auto_1410787 ?auto_1410795 ) ) ( not ( = ?auto_1410787 ?auto_1410796 ) ) ( not ( = ?auto_1410787 ?auto_1410802 ) ) ( not ( = ?auto_1410788 ?auto_1410789 ) ) ( not ( = ?auto_1410788 ?auto_1410790 ) ) ( not ( = ?auto_1410788 ?auto_1410791 ) ) ( not ( = ?auto_1410788 ?auto_1410792 ) ) ( not ( = ?auto_1410788 ?auto_1410793 ) ) ( not ( = ?auto_1410788 ?auto_1410794 ) ) ( not ( = ?auto_1410788 ?auto_1410795 ) ) ( not ( = ?auto_1410788 ?auto_1410796 ) ) ( not ( = ?auto_1410788 ?auto_1410802 ) ) ( not ( = ?auto_1410789 ?auto_1410790 ) ) ( not ( = ?auto_1410789 ?auto_1410791 ) ) ( not ( = ?auto_1410789 ?auto_1410792 ) ) ( not ( = ?auto_1410789 ?auto_1410793 ) ) ( not ( = ?auto_1410789 ?auto_1410794 ) ) ( not ( = ?auto_1410789 ?auto_1410795 ) ) ( not ( = ?auto_1410789 ?auto_1410796 ) ) ( not ( = ?auto_1410789 ?auto_1410802 ) ) ( not ( = ?auto_1410790 ?auto_1410791 ) ) ( not ( = ?auto_1410790 ?auto_1410792 ) ) ( not ( = ?auto_1410790 ?auto_1410793 ) ) ( not ( = ?auto_1410790 ?auto_1410794 ) ) ( not ( = ?auto_1410790 ?auto_1410795 ) ) ( not ( = ?auto_1410790 ?auto_1410796 ) ) ( not ( = ?auto_1410790 ?auto_1410802 ) ) ( not ( = ?auto_1410791 ?auto_1410792 ) ) ( not ( = ?auto_1410791 ?auto_1410793 ) ) ( not ( = ?auto_1410791 ?auto_1410794 ) ) ( not ( = ?auto_1410791 ?auto_1410795 ) ) ( not ( = ?auto_1410791 ?auto_1410796 ) ) ( not ( = ?auto_1410791 ?auto_1410802 ) ) ( not ( = ?auto_1410792 ?auto_1410793 ) ) ( not ( = ?auto_1410792 ?auto_1410794 ) ) ( not ( = ?auto_1410792 ?auto_1410795 ) ) ( not ( = ?auto_1410792 ?auto_1410796 ) ) ( not ( = ?auto_1410792 ?auto_1410802 ) ) ( not ( = ?auto_1410793 ?auto_1410794 ) ) ( not ( = ?auto_1410793 ?auto_1410795 ) ) ( not ( = ?auto_1410793 ?auto_1410796 ) ) ( not ( = ?auto_1410793 ?auto_1410802 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1410794 ?auto_1410795 ?auto_1410796 )
      ( MAKE-14CRATE-VERIFY ?auto_1410782 ?auto_1410783 ?auto_1410784 ?auto_1410785 ?auto_1410786 ?auto_1410787 ?auto_1410788 ?auto_1410789 ?auto_1410790 ?auto_1410791 ?auto_1410792 ?auto_1410793 ?auto_1410794 ?auto_1410795 ?auto_1410796 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1410986 - SURFACE
      ?auto_1410987 - SURFACE
      ?auto_1410988 - SURFACE
      ?auto_1410989 - SURFACE
      ?auto_1410990 - SURFACE
      ?auto_1410991 - SURFACE
      ?auto_1410992 - SURFACE
      ?auto_1410993 - SURFACE
      ?auto_1410994 - SURFACE
      ?auto_1410995 - SURFACE
      ?auto_1410996 - SURFACE
      ?auto_1410997 - SURFACE
      ?auto_1410998 - SURFACE
      ?auto_1410999 - SURFACE
      ?auto_1411000 - SURFACE
    )
    :vars
    (
      ?auto_1411001 - HOIST
      ?auto_1411006 - PLACE
      ?auto_1411003 - PLACE
      ?auto_1411005 - HOIST
      ?auto_1411004 - SURFACE
      ?auto_1411002 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411001 ?auto_1411006 ) ( SURFACE-AT ?auto_1410999 ?auto_1411006 ) ( CLEAR ?auto_1410999 ) ( IS-CRATE ?auto_1411000 ) ( not ( = ?auto_1410999 ?auto_1411000 ) ) ( AVAILABLE ?auto_1411001 ) ( ON ?auto_1410999 ?auto_1410998 ) ( not ( = ?auto_1410998 ?auto_1410999 ) ) ( not ( = ?auto_1410998 ?auto_1411000 ) ) ( not ( = ?auto_1411003 ?auto_1411006 ) ) ( HOIST-AT ?auto_1411005 ?auto_1411003 ) ( not ( = ?auto_1411001 ?auto_1411005 ) ) ( AVAILABLE ?auto_1411005 ) ( SURFACE-AT ?auto_1411000 ?auto_1411003 ) ( ON ?auto_1411000 ?auto_1411004 ) ( CLEAR ?auto_1411000 ) ( not ( = ?auto_1410999 ?auto_1411004 ) ) ( not ( = ?auto_1411000 ?auto_1411004 ) ) ( not ( = ?auto_1410998 ?auto_1411004 ) ) ( TRUCK-AT ?auto_1411002 ?auto_1411006 ) ( ON ?auto_1410987 ?auto_1410986 ) ( ON ?auto_1410988 ?auto_1410987 ) ( ON ?auto_1410989 ?auto_1410988 ) ( ON ?auto_1410990 ?auto_1410989 ) ( ON ?auto_1410991 ?auto_1410990 ) ( ON ?auto_1410992 ?auto_1410991 ) ( ON ?auto_1410993 ?auto_1410992 ) ( ON ?auto_1410994 ?auto_1410993 ) ( ON ?auto_1410995 ?auto_1410994 ) ( ON ?auto_1410996 ?auto_1410995 ) ( ON ?auto_1410997 ?auto_1410996 ) ( ON ?auto_1410998 ?auto_1410997 ) ( not ( = ?auto_1410986 ?auto_1410987 ) ) ( not ( = ?auto_1410986 ?auto_1410988 ) ) ( not ( = ?auto_1410986 ?auto_1410989 ) ) ( not ( = ?auto_1410986 ?auto_1410990 ) ) ( not ( = ?auto_1410986 ?auto_1410991 ) ) ( not ( = ?auto_1410986 ?auto_1410992 ) ) ( not ( = ?auto_1410986 ?auto_1410993 ) ) ( not ( = ?auto_1410986 ?auto_1410994 ) ) ( not ( = ?auto_1410986 ?auto_1410995 ) ) ( not ( = ?auto_1410986 ?auto_1410996 ) ) ( not ( = ?auto_1410986 ?auto_1410997 ) ) ( not ( = ?auto_1410986 ?auto_1410998 ) ) ( not ( = ?auto_1410986 ?auto_1410999 ) ) ( not ( = ?auto_1410986 ?auto_1411000 ) ) ( not ( = ?auto_1410986 ?auto_1411004 ) ) ( not ( = ?auto_1410987 ?auto_1410988 ) ) ( not ( = ?auto_1410987 ?auto_1410989 ) ) ( not ( = ?auto_1410987 ?auto_1410990 ) ) ( not ( = ?auto_1410987 ?auto_1410991 ) ) ( not ( = ?auto_1410987 ?auto_1410992 ) ) ( not ( = ?auto_1410987 ?auto_1410993 ) ) ( not ( = ?auto_1410987 ?auto_1410994 ) ) ( not ( = ?auto_1410987 ?auto_1410995 ) ) ( not ( = ?auto_1410987 ?auto_1410996 ) ) ( not ( = ?auto_1410987 ?auto_1410997 ) ) ( not ( = ?auto_1410987 ?auto_1410998 ) ) ( not ( = ?auto_1410987 ?auto_1410999 ) ) ( not ( = ?auto_1410987 ?auto_1411000 ) ) ( not ( = ?auto_1410987 ?auto_1411004 ) ) ( not ( = ?auto_1410988 ?auto_1410989 ) ) ( not ( = ?auto_1410988 ?auto_1410990 ) ) ( not ( = ?auto_1410988 ?auto_1410991 ) ) ( not ( = ?auto_1410988 ?auto_1410992 ) ) ( not ( = ?auto_1410988 ?auto_1410993 ) ) ( not ( = ?auto_1410988 ?auto_1410994 ) ) ( not ( = ?auto_1410988 ?auto_1410995 ) ) ( not ( = ?auto_1410988 ?auto_1410996 ) ) ( not ( = ?auto_1410988 ?auto_1410997 ) ) ( not ( = ?auto_1410988 ?auto_1410998 ) ) ( not ( = ?auto_1410988 ?auto_1410999 ) ) ( not ( = ?auto_1410988 ?auto_1411000 ) ) ( not ( = ?auto_1410988 ?auto_1411004 ) ) ( not ( = ?auto_1410989 ?auto_1410990 ) ) ( not ( = ?auto_1410989 ?auto_1410991 ) ) ( not ( = ?auto_1410989 ?auto_1410992 ) ) ( not ( = ?auto_1410989 ?auto_1410993 ) ) ( not ( = ?auto_1410989 ?auto_1410994 ) ) ( not ( = ?auto_1410989 ?auto_1410995 ) ) ( not ( = ?auto_1410989 ?auto_1410996 ) ) ( not ( = ?auto_1410989 ?auto_1410997 ) ) ( not ( = ?auto_1410989 ?auto_1410998 ) ) ( not ( = ?auto_1410989 ?auto_1410999 ) ) ( not ( = ?auto_1410989 ?auto_1411000 ) ) ( not ( = ?auto_1410989 ?auto_1411004 ) ) ( not ( = ?auto_1410990 ?auto_1410991 ) ) ( not ( = ?auto_1410990 ?auto_1410992 ) ) ( not ( = ?auto_1410990 ?auto_1410993 ) ) ( not ( = ?auto_1410990 ?auto_1410994 ) ) ( not ( = ?auto_1410990 ?auto_1410995 ) ) ( not ( = ?auto_1410990 ?auto_1410996 ) ) ( not ( = ?auto_1410990 ?auto_1410997 ) ) ( not ( = ?auto_1410990 ?auto_1410998 ) ) ( not ( = ?auto_1410990 ?auto_1410999 ) ) ( not ( = ?auto_1410990 ?auto_1411000 ) ) ( not ( = ?auto_1410990 ?auto_1411004 ) ) ( not ( = ?auto_1410991 ?auto_1410992 ) ) ( not ( = ?auto_1410991 ?auto_1410993 ) ) ( not ( = ?auto_1410991 ?auto_1410994 ) ) ( not ( = ?auto_1410991 ?auto_1410995 ) ) ( not ( = ?auto_1410991 ?auto_1410996 ) ) ( not ( = ?auto_1410991 ?auto_1410997 ) ) ( not ( = ?auto_1410991 ?auto_1410998 ) ) ( not ( = ?auto_1410991 ?auto_1410999 ) ) ( not ( = ?auto_1410991 ?auto_1411000 ) ) ( not ( = ?auto_1410991 ?auto_1411004 ) ) ( not ( = ?auto_1410992 ?auto_1410993 ) ) ( not ( = ?auto_1410992 ?auto_1410994 ) ) ( not ( = ?auto_1410992 ?auto_1410995 ) ) ( not ( = ?auto_1410992 ?auto_1410996 ) ) ( not ( = ?auto_1410992 ?auto_1410997 ) ) ( not ( = ?auto_1410992 ?auto_1410998 ) ) ( not ( = ?auto_1410992 ?auto_1410999 ) ) ( not ( = ?auto_1410992 ?auto_1411000 ) ) ( not ( = ?auto_1410992 ?auto_1411004 ) ) ( not ( = ?auto_1410993 ?auto_1410994 ) ) ( not ( = ?auto_1410993 ?auto_1410995 ) ) ( not ( = ?auto_1410993 ?auto_1410996 ) ) ( not ( = ?auto_1410993 ?auto_1410997 ) ) ( not ( = ?auto_1410993 ?auto_1410998 ) ) ( not ( = ?auto_1410993 ?auto_1410999 ) ) ( not ( = ?auto_1410993 ?auto_1411000 ) ) ( not ( = ?auto_1410993 ?auto_1411004 ) ) ( not ( = ?auto_1410994 ?auto_1410995 ) ) ( not ( = ?auto_1410994 ?auto_1410996 ) ) ( not ( = ?auto_1410994 ?auto_1410997 ) ) ( not ( = ?auto_1410994 ?auto_1410998 ) ) ( not ( = ?auto_1410994 ?auto_1410999 ) ) ( not ( = ?auto_1410994 ?auto_1411000 ) ) ( not ( = ?auto_1410994 ?auto_1411004 ) ) ( not ( = ?auto_1410995 ?auto_1410996 ) ) ( not ( = ?auto_1410995 ?auto_1410997 ) ) ( not ( = ?auto_1410995 ?auto_1410998 ) ) ( not ( = ?auto_1410995 ?auto_1410999 ) ) ( not ( = ?auto_1410995 ?auto_1411000 ) ) ( not ( = ?auto_1410995 ?auto_1411004 ) ) ( not ( = ?auto_1410996 ?auto_1410997 ) ) ( not ( = ?auto_1410996 ?auto_1410998 ) ) ( not ( = ?auto_1410996 ?auto_1410999 ) ) ( not ( = ?auto_1410996 ?auto_1411000 ) ) ( not ( = ?auto_1410996 ?auto_1411004 ) ) ( not ( = ?auto_1410997 ?auto_1410998 ) ) ( not ( = ?auto_1410997 ?auto_1410999 ) ) ( not ( = ?auto_1410997 ?auto_1411000 ) ) ( not ( = ?auto_1410997 ?auto_1411004 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1410998 ?auto_1410999 ?auto_1411000 )
      ( MAKE-14CRATE-VERIFY ?auto_1410986 ?auto_1410987 ?auto_1410988 ?auto_1410989 ?auto_1410990 ?auto_1410991 ?auto_1410992 ?auto_1410993 ?auto_1410994 ?auto_1410995 ?auto_1410996 ?auto_1410997 ?auto_1410998 ?auto_1410999 ?auto_1411000 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1411190 - SURFACE
      ?auto_1411191 - SURFACE
      ?auto_1411192 - SURFACE
      ?auto_1411193 - SURFACE
      ?auto_1411194 - SURFACE
      ?auto_1411195 - SURFACE
      ?auto_1411196 - SURFACE
      ?auto_1411197 - SURFACE
      ?auto_1411198 - SURFACE
      ?auto_1411199 - SURFACE
      ?auto_1411200 - SURFACE
      ?auto_1411201 - SURFACE
      ?auto_1411202 - SURFACE
      ?auto_1411203 - SURFACE
      ?auto_1411204 - SURFACE
    )
    :vars
    (
      ?auto_1411210 - HOIST
      ?auto_1411207 - PLACE
      ?auto_1411209 - PLACE
      ?auto_1411205 - HOIST
      ?auto_1411208 - SURFACE
      ?auto_1411206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411210 ?auto_1411207 ) ( IS-CRATE ?auto_1411204 ) ( not ( = ?auto_1411203 ?auto_1411204 ) ) ( not ( = ?auto_1411202 ?auto_1411203 ) ) ( not ( = ?auto_1411202 ?auto_1411204 ) ) ( not ( = ?auto_1411209 ?auto_1411207 ) ) ( HOIST-AT ?auto_1411205 ?auto_1411209 ) ( not ( = ?auto_1411210 ?auto_1411205 ) ) ( AVAILABLE ?auto_1411205 ) ( SURFACE-AT ?auto_1411204 ?auto_1411209 ) ( ON ?auto_1411204 ?auto_1411208 ) ( CLEAR ?auto_1411204 ) ( not ( = ?auto_1411203 ?auto_1411208 ) ) ( not ( = ?auto_1411204 ?auto_1411208 ) ) ( not ( = ?auto_1411202 ?auto_1411208 ) ) ( TRUCK-AT ?auto_1411206 ?auto_1411207 ) ( SURFACE-AT ?auto_1411202 ?auto_1411207 ) ( CLEAR ?auto_1411202 ) ( LIFTING ?auto_1411210 ?auto_1411203 ) ( IS-CRATE ?auto_1411203 ) ( ON ?auto_1411191 ?auto_1411190 ) ( ON ?auto_1411192 ?auto_1411191 ) ( ON ?auto_1411193 ?auto_1411192 ) ( ON ?auto_1411194 ?auto_1411193 ) ( ON ?auto_1411195 ?auto_1411194 ) ( ON ?auto_1411196 ?auto_1411195 ) ( ON ?auto_1411197 ?auto_1411196 ) ( ON ?auto_1411198 ?auto_1411197 ) ( ON ?auto_1411199 ?auto_1411198 ) ( ON ?auto_1411200 ?auto_1411199 ) ( ON ?auto_1411201 ?auto_1411200 ) ( ON ?auto_1411202 ?auto_1411201 ) ( not ( = ?auto_1411190 ?auto_1411191 ) ) ( not ( = ?auto_1411190 ?auto_1411192 ) ) ( not ( = ?auto_1411190 ?auto_1411193 ) ) ( not ( = ?auto_1411190 ?auto_1411194 ) ) ( not ( = ?auto_1411190 ?auto_1411195 ) ) ( not ( = ?auto_1411190 ?auto_1411196 ) ) ( not ( = ?auto_1411190 ?auto_1411197 ) ) ( not ( = ?auto_1411190 ?auto_1411198 ) ) ( not ( = ?auto_1411190 ?auto_1411199 ) ) ( not ( = ?auto_1411190 ?auto_1411200 ) ) ( not ( = ?auto_1411190 ?auto_1411201 ) ) ( not ( = ?auto_1411190 ?auto_1411202 ) ) ( not ( = ?auto_1411190 ?auto_1411203 ) ) ( not ( = ?auto_1411190 ?auto_1411204 ) ) ( not ( = ?auto_1411190 ?auto_1411208 ) ) ( not ( = ?auto_1411191 ?auto_1411192 ) ) ( not ( = ?auto_1411191 ?auto_1411193 ) ) ( not ( = ?auto_1411191 ?auto_1411194 ) ) ( not ( = ?auto_1411191 ?auto_1411195 ) ) ( not ( = ?auto_1411191 ?auto_1411196 ) ) ( not ( = ?auto_1411191 ?auto_1411197 ) ) ( not ( = ?auto_1411191 ?auto_1411198 ) ) ( not ( = ?auto_1411191 ?auto_1411199 ) ) ( not ( = ?auto_1411191 ?auto_1411200 ) ) ( not ( = ?auto_1411191 ?auto_1411201 ) ) ( not ( = ?auto_1411191 ?auto_1411202 ) ) ( not ( = ?auto_1411191 ?auto_1411203 ) ) ( not ( = ?auto_1411191 ?auto_1411204 ) ) ( not ( = ?auto_1411191 ?auto_1411208 ) ) ( not ( = ?auto_1411192 ?auto_1411193 ) ) ( not ( = ?auto_1411192 ?auto_1411194 ) ) ( not ( = ?auto_1411192 ?auto_1411195 ) ) ( not ( = ?auto_1411192 ?auto_1411196 ) ) ( not ( = ?auto_1411192 ?auto_1411197 ) ) ( not ( = ?auto_1411192 ?auto_1411198 ) ) ( not ( = ?auto_1411192 ?auto_1411199 ) ) ( not ( = ?auto_1411192 ?auto_1411200 ) ) ( not ( = ?auto_1411192 ?auto_1411201 ) ) ( not ( = ?auto_1411192 ?auto_1411202 ) ) ( not ( = ?auto_1411192 ?auto_1411203 ) ) ( not ( = ?auto_1411192 ?auto_1411204 ) ) ( not ( = ?auto_1411192 ?auto_1411208 ) ) ( not ( = ?auto_1411193 ?auto_1411194 ) ) ( not ( = ?auto_1411193 ?auto_1411195 ) ) ( not ( = ?auto_1411193 ?auto_1411196 ) ) ( not ( = ?auto_1411193 ?auto_1411197 ) ) ( not ( = ?auto_1411193 ?auto_1411198 ) ) ( not ( = ?auto_1411193 ?auto_1411199 ) ) ( not ( = ?auto_1411193 ?auto_1411200 ) ) ( not ( = ?auto_1411193 ?auto_1411201 ) ) ( not ( = ?auto_1411193 ?auto_1411202 ) ) ( not ( = ?auto_1411193 ?auto_1411203 ) ) ( not ( = ?auto_1411193 ?auto_1411204 ) ) ( not ( = ?auto_1411193 ?auto_1411208 ) ) ( not ( = ?auto_1411194 ?auto_1411195 ) ) ( not ( = ?auto_1411194 ?auto_1411196 ) ) ( not ( = ?auto_1411194 ?auto_1411197 ) ) ( not ( = ?auto_1411194 ?auto_1411198 ) ) ( not ( = ?auto_1411194 ?auto_1411199 ) ) ( not ( = ?auto_1411194 ?auto_1411200 ) ) ( not ( = ?auto_1411194 ?auto_1411201 ) ) ( not ( = ?auto_1411194 ?auto_1411202 ) ) ( not ( = ?auto_1411194 ?auto_1411203 ) ) ( not ( = ?auto_1411194 ?auto_1411204 ) ) ( not ( = ?auto_1411194 ?auto_1411208 ) ) ( not ( = ?auto_1411195 ?auto_1411196 ) ) ( not ( = ?auto_1411195 ?auto_1411197 ) ) ( not ( = ?auto_1411195 ?auto_1411198 ) ) ( not ( = ?auto_1411195 ?auto_1411199 ) ) ( not ( = ?auto_1411195 ?auto_1411200 ) ) ( not ( = ?auto_1411195 ?auto_1411201 ) ) ( not ( = ?auto_1411195 ?auto_1411202 ) ) ( not ( = ?auto_1411195 ?auto_1411203 ) ) ( not ( = ?auto_1411195 ?auto_1411204 ) ) ( not ( = ?auto_1411195 ?auto_1411208 ) ) ( not ( = ?auto_1411196 ?auto_1411197 ) ) ( not ( = ?auto_1411196 ?auto_1411198 ) ) ( not ( = ?auto_1411196 ?auto_1411199 ) ) ( not ( = ?auto_1411196 ?auto_1411200 ) ) ( not ( = ?auto_1411196 ?auto_1411201 ) ) ( not ( = ?auto_1411196 ?auto_1411202 ) ) ( not ( = ?auto_1411196 ?auto_1411203 ) ) ( not ( = ?auto_1411196 ?auto_1411204 ) ) ( not ( = ?auto_1411196 ?auto_1411208 ) ) ( not ( = ?auto_1411197 ?auto_1411198 ) ) ( not ( = ?auto_1411197 ?auto_1411199 ) ) ( not ( = ?auto_1411197 ?auto_1411200 ) ) ( not ( = ?auto_1411197 ?auto_1411201 ) ) ( not ( = ?auto_1411197 ?auto_1411202 ) ) ( not ( = ?auto_1411197 ?auto_1411203 ) ) ( not ( = ?auto_1411197 ?auto_1411204 ) ) ( not ( = ?auto_1411197 ?auto_1411208 ) ) ( not ( = ?auto_1411198 ?auto_1411199 ) ) ( not ( = ?auto_1411198 ?auto_1411200 ) ) ( not ( = ?auto_1411198 ?auto_1411201 ) ) ( not ( = ?auto_1411198 ?auto_1411202 ) ) ( not ( = ?auto_1411198 ?auto_1411203 ) ) ( not ( = ?auto_1411198 ?auto_1411204 ) ) ( not ( = ?auto_1411198 ?auto_1411208 ) ) ( not ( = ?auto_1411199 ?auto_1411200 ) ) ( not ( = ?auto_1411199 ?auto_1411201 ) ) ( not ( = ?auto_1411199 ?auto_1411202 ) ) ( not ( = ?auto_1411199 ?auto_1411203 ) ) ( not ( = ?auto_1411199 ?auto_1411204 ) ) ( not ( = ?auto_1411199 ?auto_1411208 ) ) ( not ( = ?auto_1411200 ?auto_1411201 ) ) ( not ( = ?auto_1411200 ?auto_1411202 ) ) ( not ( = ?auto_1411200 ?auto_1411203 ) ) ( not ( = ?auto_1411200 ?auto_1411204 ) ) ( not ( = ?auto_1411200 ?auto_1411208 ) ) ( not ( = ?auto_1411201 ?auto_1411202 ) ) ( not ( = ?auto_1411201 ?auto_1411203 ) ) ( not ( = ?auto_1411201 ?auto_1411204 ) ) ( not ( = ?auto_1411201 ?auto_1411208 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411202 ?auto_1411203 ?auto_1411204 )
      ( MAKE-14CRATE-VERIFY ?auto_1411190 ?auto_1411191 ?auto_1411192 ?auto_1411193 ?auto_1411194 ?auto_1411195 ?auto_1411196 ?auto_1411197 ?auto_1411198 ?auto_1411199 ?auto_1411200 ?auto_1411201 ?auto_1411202 ?auto_1411203 ?auto_1411204 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1411394 - SURFACE
      ?auto_1411395 - SURFACE
      ?auto_1411396 - SURFACE
      ?auto_1411397 - SURFACE
      ?auto_1411398 - SURFACE
      ?auto_1411399 - SURFACE
      ?auto_1411400 - SURFACE
      ?auto_1411401 - SURFACE
      ?auto_1411402 - SURFACE
      ?auto_1411403 - SURFACE
      ?auto_1411404 - SURFACE
      ?auto_1411405 - SURFACE
      ?auto_1411406 - SURFACE
      ?auto_1411407 - SURFACE
      ?auto_1411408 - SURFACE
    )
    :vars
    (
      ?auto_1411413 - HOIST
      ?auto_1411410 - PLACE
      ?auto_1411411 - PLACE
      ?auto_1411414 - HOIST
      ?auto_1411409 - SURFACE
      ?auto_1411412 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411413 ?auto_1411410 ) ( IS-CRATE ?auto_1411408 ) ( not ( = ?auto_1411407 ?auto_1411408 ) ) ( not ( = ?auto_1411406 ?auto_1411407 ) ) ( not ( = ?auto_1411406 ?auto_1411408 ) ) ( not ( = ?auto_1411411 ?auto_1411410 ) ) ( HOIST-AT ?auto_1411414 ?auto_1411411 ) ( not ( = ?auto_1411413 ?auto_1411414 ) ) ( AVAILABLE ?auto_1411414 ) ( SURFACE-AT ?auto_1411408 ?auto_1411411 ) ( ON ?auto_1411408 ?auto_1411409 ) ( CLEAR ?auto_1411408 ) ( not ( = ?auto_1411407 ?auto_1411409 ) ) ( not ( = ?auto_1411408 ?auto_1411409 ) ) ( not ( = ?auto_1411406 ?auto_1411409 ) ) ( TRUCK-AT ?auto_1411412 ?auto_1411410 ) ( SURFACE-AT ?auto_1411406 ?auto_1411410 ) ( CLEAR ?auto_1411406 ) ( IS-CRATE ?auto_1411407 ) ( AVAILABLE ?auto_1411413 ) ( IN ?auto_1411407 ?auto_1411412 ) ( ON ?auto_1411395 ?auto_1411394 ) ( ON ?auto_1411396 ?auto_1411395 ) ( ON ?auto_1411397 ?auto_1411396 ) ( ON ?auto_1411398 ?auto_1411397 ) ( ON ?auto_1411399 ?auto_1411398 ) ( ON ?auto_1411400 ?auto_1411399 ) ( ON ?auto_1411401 ?auto_1411400 ) ( ON ?auto_1411402 ?auto_1411401 ) ( ON ?auto_1411403 ?auto_1411402 ) ( ON ?auto_1411404 ?auto_1411403 ) ( ON ?auto_1411405 ?auto_1411404 ) ( ON ?auto_1411406 ?auto_1411405 ) ( not ( = ?auto_1411394 ?auto_1411395 ) ) ( not ( = ?auto_1411394 ?auto_1411396 ) ) ( not ( = ?auto_1411394 ?auto_1411397 ) ) ( not ( = ?auto_1411394 ?auto_1411398 ) ) ( not ( = ?auto_1411394 ?auto_1411399 ) ) ( not ( = ?auto_1411394 ?auto_1411400 ) ) ( not ( = ?auto_1411394 ?auto_1411401 ) ) ( not ( = ?auto_1411394 ?auto_1411402 ) ) ( not ( = ?auto_1411394 ?auto_1411403 ) ) ( not ( = ?auto_1411394 ?auto_1411404 ) ) ( not ( = ?auto_1411394 ?auto_1411405 ) ) ( not ( = ?auto_1411394 ?auto_1411406 ) ) ( not ( = ?auto_1411394 ?auto_1411407 ) ) ( not ( = ?auto_1411394 ?auto_1411408 ) ) ( not ( = ?auto_1411394 ?auto_1411409 ) ) ( not ( = ?auto_1411395 ?auto_1411396 ) ) ( not ( = ?auto_1411395 ?auto_1411397 ) ) ( not ( = ?auto_1411395 ?auto_1411398 ) ) ( not ( = ?auto_1411395 ?auto_1411399 ) ) ( not ( = ?auto_1411395 ?auto_1411400 ) ) ( not ( = ?auto_1411395 ?auto_1411401 ) ) ( not ( = ?auto_1411395 ?auto_1411402 ) ) ( not ( = ?auto_1411395 ?auto_1411403 ) ) ( not ( = ?auto_1411395 ?auto_1411404 ) ) ( not ( = ?auto_1411395 ?auto_1411405 ) ) ( not ( = ?auto_1411395 ?auto_1411406 ) ) ( not ( = ?auto_1411395 ?auto_1411407 ) ) ( not ( = ?auto_1411395 ?auto_1411408 ) ) ( not ( = ?auto_1411395 ?auto_1411409 ) ) ( not ( = ?auto_1411396 ?auto_1411397 ) ) ( not ( = ?auto_1411396 ?auto_1411398 ) ) ( not ( = ?auto_1411396 ?auto_1411399 ) ) ( not ( = ?auto_1411396 ?auto_1411400 ) ) ( not ( = ?auto_1411396 ?auto_1411401 ) ) ( not ( = ?auto_1411396 ?auto_1411402 ) ) ( not ( = ?auto_1411396 ?auto_1411403 ) ) ( not ( = ?auto_1411396 ?auto_1411404 ) ) ( not ( = ?auto_1411396 ?auto_1411405 ) ) ( not ( = ?auto_1411396 ?auto_1411406 ) ) ( not ( = ?auto_1411396 ?auto_1411407 ) ) ( not ( = ?auto_1411396 ?auto_1411408 ) ) ( not ( = ?auto_1411396 ?auto_1411409 ) ) ( not ( = ?auto_1411397 ?auto_1411398 ) ) ( not ( = ?auto_1411397 ?auto_1411399 ) ) ( not ( = ?auto_1411397 ?auto_1411400 ) ) ( not ( = ?auto_1411397 ?auto_1411401 ) ) ( not ( = ?auto_1411397 ?auto_1411402 ) ) ( not ( = ?auto_1411397 ?auto_1411403 ) ) ( not ( = ?auto_1411397 ?auto_1411404 ) ) ( not ( = ?auto_1411397 ?auto_1411405 ) ) ( not ( = ?auto_1411397 ?auto_1411406 ) ) ( not ( = ?auto_1411397 ?auto_1411407 ) ) ( not ( = ?auto_1411397 ?auto_1411408 ) ) ( not ( = ?auto_1411397 ?auto_1411409 ) ) ( not ( = ?auto_1411398 ?auto_1411399 ) ) ( not ( = ?auto_1411398 ?auto_1411400 ) ) ( not ( = ?auto_1411398 ?auto_1411401 ) ) ( not ( = ?auto_1411398 ?auto_1411402 ) ) ( not ( = ?auto_1411398 ?auto_1411403 ) ) ( not ( = ?auto_1411398 ?auto_1411404 ) ) ( not ( = ?auto_1411398 ?auto_1411405 ) ) ( not ( = ?auto_1411398 ?auto_1411406 ) ) ( not ( = ?auto_1411398 ?auto_1411407 ) ) ( not ( = ?auto_1411398 ?auto_1411408 ) ) ( not ( = ?auto_1411398 ?auto_1411409 ) ) ( not ( = ?auto_1411399 ?auto_1411400 ) ) ( not ( = ?auto_1411399 ?auto_1411401 ) ) ( not ( = ?auto_1411399 ?auto_1411402 ) ) ( not ( = ?auto_1411399 ?auto_1411403 ) ) ( not ( = ?auto_1411399 ?auto_1411404 ) ) ( not ( = ?auto_1411399 ?auto_1411405 ) ) ( not ( = ?auto_1411399 ?auto_1411406 ) ) ( not ( = ?auto_1411399 ?auto_1411407 ) ) ( not ( = ?auto_1411399 ?auto_1411408 ) ) ( not ( = ?auto_1411399 ?auto_1411409 ) ) ( not ( = ?auto_1411400 ?auto_1411401 ) ) ( not ( = ?auto_1411400 ?auto_1411402 ) ) ( not ( = ?auto_1411400 ?auto_1411403 ) ) ( not ( = ?auto_1411400 ?auto_1411404 ) ) ( not ( = ?auto_1411400 ?auto_1411405 ) ) ( not ( = ?auto_1411400 ?auto_1411406 ) ) ( not ( = ?auto_1411400 ?auto_1411407 ) ) ( not ( = ?auto_1411400 ?auto_1411408 ) ) ( not ( = ?auto_1411400 ?auto_1411409 ) ) ( not ( = ?auto_1411401 ?auto_1411402 ) ) ( not ( = ?auto_1411401 ?auto_1411403 ) ) ( not ( = ?auto_1411401 ?auto_1411404 ) ) ( not ( = ?auto_1411401 ?auto_1411405 ) ) ( not ( = ?auto_1411401 ?auto_1411406 ) ) ( not ( = ?auto_1411401 ?auto_1411407 ) ) ( not ( = ?auto_1411401 ?auto_1411408 ) ) ( not ( = ?auto_1411401 ?auto_1411409 ) ) ( not ( = ?auto_1411402 ?auto_1411403 ) ) ( not ( = ?auto_1411402 ?auto_1411404 ) ) ( not ( = ?auto_1411402 ?auto_1411405 ) ) ( not ( = ?auto_1411402 ?auto_1411406 ) ) ( not ( = ?auto_1411402 ?auto_1411407 ) ) ( not ( = ?auto_1411402 ?auto_1411408 ) ) ( not ( = ?auto_1411402 ?auto_1411409 ) ) ( not ( = ?auto_1411403 ?auto_1411404 ) ) ( not ( = ?auto_1411403 ?auto_1411405 ) ) ( not ( = ?auto_1411403 ?auto_1411406 ) ) ( not ( = ?auto_1411403 ?auto_1411407 ) ) ( not ( = ?auto_1411403 ?auto_1411408 ) ) ( not ( = ?auto_1411403 ?auto_1411409 ) ) ( not ( = ?auto_1411404 ?auto_1411405 ) ) ( not ( = ?auto_1411404 ?auto_1411406 ) ) ( not ( = ?auto_1411404 ?auto_1411407 ) ) ( not ( = ?auto_1411404 ?auto_1411408 ) ) ( not ( = ?auto_1411404 ?auto_1411409 ) ) ( not ( = ?auto_1411405 ?auto_1411406 ) ) ( not ( = ?auto_1411405 ?auto_1411407 ) ) ( not ( = ?auto_1411405 ?auto_1411408 ) ) ( not ( = ?auto_1411405 ?auto_1411409 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411406 ?auto_1411407 ?auto_1411408 )
      ( MAKE-14CRATE-VERIFY ?auto_1411394 ?auto_1411395 ?auto_1411396 ?auto_1411397 ?auto_1411398 ?auto_1411399 ?auto_1411400 ?auto_1411401 ?auto_1411402 ?auto_1411403 ?auto_1411404 ?auto_1411405 ?auto_1411406 ?auto_1411407 ?auto_1411408 ) )
  )

)

