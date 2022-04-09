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
      ?auto_15884 - SURFACE
      ?auto_15885 - SURFACE
    )
    :vars
    (
      ?auto_15886 - HOIST
      ?auto_15887 - PLACE
      ?auto_15889 - PLACE
      ?auto_15890 - HOIST
      ?auto_15891 - SURFACE
      ?auto_15888 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15886 ?auto_15887 ) ( SURFACE-AT ?auto_15884 ?auto_15887 ) ( CLEAR ?auto_15884 ) ( IS-CRATE ?auto_15885 ) ( AVAILABLE ?auto_15886 ) ( not ( = ?auto_15889 ?auto_15887 ) ) ( HOIST-AT ?auto_15890 ?auto_15889 ) ( AVAILABLE ?auto_15890 ) ( SURFACE-AT ?auto_15885 ?auto_15889 ) ( ON ?auto_15885 ?auto_15891 ) ( CLEAR ?auto_15885 ) ( TRUCK-AT ?auto_15888 ?auto_15887 ) ( not ( = ?auto_15884 ?auto_15885 ) ) ( not ( = ?auto_15884 ?auto_15891 ) ) ( not ( = ?auto_15885 ?auto_15891 ) ) ( not ( = ?auto_15886 ?auto_15890 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15888 ?auto_15887 ?auto_15889 )
      ( !LIFT ?auto_15890 ?auto_15885 ?auto_15891 ?auto_15889 )
      ( !LOAD ?auto_15890 ?auto_15885 ?auto_15888 ?auto_15889 )
      ( !DRIVE ?auto_15888 ?auto_15889 ?auto_15887 )
      ( !UNLOAD ?auto_15886 ?auto_15885 ?auto_15888 ?auto_15887 )
      ( !DROP ?auto_15886 ?auto_15885 ?auto_15884 ?auto_15887 )
      ( MAKE-1CRATE-VERIFY ?auto_15884 ?auto_15885 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15894 - SURFACE
      ?auto_15895 - SURFACE
    )
    :vars
    (
      ?auto_15896 - HOIST
      ?auto_15897 - PLACE
      ?auto_15899 - PLACE
      ?auto_15900 - HOIST
      ?auto_15901 - SURFACE
      ?auto_15898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15896 ?auto_15897 ) ( SURFACE-AT ?auto_15894 ?auto_15897 ) ( CLEAR ?auto_15894 ) ( IS-CRATE ?auto_15895 ) ( AVAILABLE ?auto_15896 ) ( not ( = ?auto_15899 ?auto_15897 ) ) ( HOIST-AT ?auto_15900 ?auto_15899 ) ( AVAILABLE ?auto_15900 ) ( SURFACE-AT ?auto_15895 ?auto_15899 ) ( ON ?auto_15895 ?auto_15901 ) ( CLEAR ?auto_15895 ) ( TRUCK-AT ?auto_15898 ?auto_15897 ) ( not ( = ?auto_15894 ?auto_15895 ) ) ( not ( = ?auto_15894 ?auto_15901 ) ) ( not ( = ?auto_15895 ?auto_15901 ) ) ( not ( = ?auto_15896 ?auto_15900 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15898 ?auto_15897 ?auto_15899 )
      ( !LIFT ?auto_15900 ?auto_15895 ?auto_15901 ?auto_15899 )
      ( !LOAD ?auto_15900 ?auto_15895 ?auto_15898 ?auto_15899 )
      ( !DRIVE ?auto_15898 ?auto_15899 ?auto_15897 )
      ( !UNLOAD ?auto_15896 ?auto_15895 ?auto_15898 ?auto_15897 )
      ( !DROP ?auto_15896 ?auto_15895 ?auto_15894 ?auto_15897 )
      ( MAKE-1CRATE-VERIFY ?auto_15894 ?auto_15895 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15905 - SURFACE
      ?auto_15906 - SURFACE
      ?auto_15907 - SURFACE
    )
    :vars
    (
      ?auto_15908 - HOIST
      ?auto_15910 - PLACE
      ?auto_15909 - PLACE
      ?auto_15912 - HOIST
      ?auto_15913 - SURFACE
      ?auto_15914 - PLACE
      ?auto_15916 - HOIST
      ?auto_15915 - SURFACE
      ?auto_15911 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15908 ?auto_15910 ) ( IS-CRATE ?auto_15907 ) ( not ( = ?auto_15909 ?auto_15910 ) ) ( HOIST-AT ?auto_15912 ?auto_15909 ) ( AVAILABLE ?auto_15912 ) ( SURFACE-AT ?auto_15907 ?auto_15909 ) ( ON ?auto_15907 ?auto_15913 ) ( CLEAR ?auto_15907 ) ( not ( = ?auto_15906 ?auto_15907 ) ) ( not ( = ?auto_15906 ?auto_15913 ) ) ( not ( = ?auto_15907 ?auto_15913 ) ) ( not ( = ?auto_15908 ?auto_15912 ) ) ( SURFACE-AT ?auto_15905 ?auto_15910 ) ( CLEAR ?auto_15905 ) ( IS-CRATE ?auto_15906 ) ( AVAILABLE ?auto_15908 ) ( not ( = ?auto_15914 ?auto_15910 ) ) ( HOIST-AT ?auto_15916 ?auto_15914 ) ( AVAILABLE ?auto_15916 ) ( SURFACE-AT ?auto_15906 ?auto_15914 ) ( ON ?auto_15906 ?auto_15915 ) ( CLEAR ?auto_15906 ) ( TRUCK-AT ?auto_15911 ?auto_15910 ) ( not ( = ?auto_15905 ?auto_15906 ) ) ( not ( = ?auto_15905 ?auto_15915 ) ) ( not ( = ?auto_15906 ?auto_15915 ) ) ( not ( = ?auto_15908 ?auto_15916 ) ) ( not ( = ?auto_15905 ?auto_15907 ) ) ( not ( = ?auto_15905 ?auto_15913 ) ) ( not ( = ?auto_15907 ?auto_15915 ) ) ( not ( = ?auto_15909 ?auto_15914 ) ) ( not ( = ?auto_15912 ?auto_15916 ) ) ( not ( = ?auto_15913 ?auto_15915 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15905 ?auto_15906 )
      ( MAKE-1CRATE ?auto_15906 ?auto_15907 )
      ( MAKE-2CRATE-VERIFY ?auto_15905 ?auto_15906 ?auto_15907 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15919 - SURFACE
      ?auto_15920 - SURFACE
    )
    :vars
    (
      ?auto_15921 - HOIST
      ?auto_15922 - PLACE
      ?auto_15924 - PLACE
      ?auto_15925 - HOIST
      ?auto_15926 - SURFACE
      ?auto_15923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15921 ?auto_15922 ) ( SURFACE-AT ?auto_15919 ?auto_15922 ) ( CLEAR ?auto_15919 ) ( IS-CRATE ?auto_15920 ) ( AVAILABLE ?auto_15921 ) ( not ( = ?auto_15924 ?auto_15922 ) ) ( HOIST-AT ?auto_15925 ?auto_15924 ) ( AVAILABLE ?auto_15925 ) ( SURFACE-AT ?auto_15920 ?auto_15924 ) ( ON ?auto_15920 ?auto_15926 ) ( CLEAR ?auto_15920 ) ( TRUCK-AT ?auto_15923 ?auto_15922 ) ( not ( = ?auto_15919 ?auto_15920 ) ) ( not ( = ?auto_15919 ?auto_15926 ) ) ( not ( = ?auto_15920 ?auto_15926 ) ) ( not ( = ?auto_15921 ?auto_15925 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15923 ?auto_15922 ?auto_15924 )
      ( !LIFT ?auto_15925 ?auto_15920 ?auto_15926 ?auto_15924 )
      ( !LOAD ?auto_15925 ?auto_15920 ?auto_15923 ?auto_15924 )
      ( !DRIVE ?auto_15923 ?auto_15924 ?auto_15922 )
      ( !UNLOAD ?auto_15921 ?auto_15920 ?auto_15923 ?auto_15922 )
      ( !DROP ?auto_15921 ?auto_15920 ?auto_15919 ?auto_15922 )
      ( MAKE-1CRATE-VERIFY ?auto_15919 ?auto_15920 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15931 - SURFACE
      ?auto_15932 - SURFACE
      ?auto_15933 - SURFACE
      ?auto_15934 - SURFACE
    )
    :vars
    (
      ?auto_15940 - HOIST
      ?auto_15937 - PLACE
      ?auto_15936 - PLACE
      ?auto_15935 - HOIST
      ?auto_15939 - SURFACE
      ?auto_15944 - PLACE
      ?auto_15945 - HOIST
      ?auto_15942 - SURFACE
      ?auto_15946 - PLACE
      ?auto_15941 - HOIST
      ?auto_15943 - SURFACE
      ?auto_15938 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15940 ?auto_15937 ) ( IS-CRATE ?auto_15934 ) ( not ( = ?auto_15936 ?auto_15937 ) ) ( HOIST-AT ?auto_15935 ?auto_15936 ) ( AVAILABLE ?auto_15935 ) ( SURFACE-AT ?auto_15934 ?auto_15936 ) ( ON ?auto_15934 ?auto_15939 ) ( CLEAR ?auto_15934 ) ( not ( = ?auto_15933 ?auto_15934 ) ) ( not ( = ?auto_15933 ?auto_15939 ) ) ( not ( = ?auto_15934 ?auto_15939 ) ) ( not ( = ?auto_15940 ?auto_15935 ) ) ( IS-CRATE ?auto_15933 ) ( not ( = ?auto_15944 ?auto_15937 ) ) ( HOIST-AT ?auto_15945 ?auto_15944 ) ( AVAILABLE ?auto_15945 ) ( SURFACE-AT ?auto_15933 ?auto_15944 ) ( ON ?auto_15933 ?auto_15942 ) ( CLEAR ?auto_15933 ) ( not ( = ?auto_15932 ?auto_15933 ) ) ( not ( = ?auto_15932 ?auto_15942 ) ) ( not ( = ?auto_15933 ?auto_15942 ) ) ( not ( = ?auto_15940 ?auto_15945 ) ) ( SURFACE-AT ?auto_15931 ?auto_15937 ) ( CLEAR ?auto_15931 ) ( IS-CRATE ?auto_15932 ) ( AVAILABLE ?auto_15940 ) ( not ( = ?auto_15946 ?auto_15937 ) ) ( HOIST-AT ?auto_15941 ?auto_15946 ) ( AVAILABLE ?auto_15941 ) ( SURFACE-AT ?auto_15932 ?auto_15946 ) ( ON ?auto_15932 ?auto_15943 ) ( CLEAR ?auto_15932 ) ( TRUCK-AT ?auto_15938 ?auto_15937 ) ( not ( = ?auto_15931 ?auto_15932 ) ) ( not ( = ?auto_15931 ?auto_15943 ) ) ( not ( = ?auto_15932 ?auto_15943 ) ) ( not ( = ?auto_15940 ?auto_15941 ) ) ( not ( = ?auto_15931 ?auto_15933 ) ) ( not ( = ?auto_15931 ?auto_15942 ) ) ( not ( = ?auto_15933 ?auto_15943 ) ) ( not ( = ?auto_15944 ?auto_15946 ) ) ( not ( = ?auto_15945 ?auto_15941 ) ) ( not ( = ?auto_15942 ?auto_15943 ) ) ( not ( = ?auto_15931 ?auto_15934 ) ) ( not ( = ?auto_15931 ?auto_15939 ) ) ( not ( = ?auto_15932 ?auto_15934 ) ) ( not ( = ?auto_15932 ?auto_15939 ) ) ( not ( = ?auto_15934 ?auto_15942 ) ) ( not ( = ?auto_15934 ?auto_15943 ) ) ( not ( = ?auto_15936 ?auto_15944 ) ) ( not ( = ?auto_15936 ?auto_15946 ) ) ( not ( = ?auto_15935 ?auto_15945 ) ) ( not ( = ?auto_15935 ?auto_15941 ) ) ( not ( = ?auto_15939 ?auto_15942 ) ) ( not ( = ?auto_15939 ?auto_15943 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15931 ?auto_15932 ?auto_15933 )
      ( MAKE-1CRATE ?auto_15933 ?auto_15934 )
      ( MAKE-3CRATE-VERIFY ?auto_15931 ?auto_15932 ?auto_15933 ?auto_15934 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15949 - SURFACE
      ?auto_15950 - SURFACE
    )
    :vars
    (
      ?auto_15951 - HOIST
      ?auto_15952 - PLACE
      ?auto_15954 - PLACE
      ?auto_15955 - HOIST
      ?auto_15956 - SURFACE
      ?auto_15953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15951 ?auto_15952 ) ( SURFACE-AT ?auto_15949 ?auto_15952 ) ( CLEAR ?auto_15949 ) ( IS-CRATE ?auto_15950 ) ( AVAILABLE ?auto_15951 ) ( not ( = ?auto_15954 ?auto_15952 ) ) ( HOIST-AT ?auto_15955 ?auto_15954 ) ( AVAILABLE ?auto_15955 ) ( SURFACE-AT ?auto_15950 ?auto_15954 ) ( ON ?auto_15950 ?auto_15956 ) ( CLEAR ?auto_15950 ) ( TRUCK-AT ?auto_15953 ?auto_15952 ) ( not ( = ?auto_15949 ?auto_15950 ) ) ( not ( = ?auto_15949 ?auto_15956 ) ) ( not ( = ?auto_15950 ?auto_15956 ) ) ( not ( = ?auto_15951 ?auto_15955 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15953 ?auto_15952 ?auto_15954 )
      ( !LIFT ?auto_15955 ?auto_15950 ?auto_15956 ?auto_15954 )
      ( !LOAD ?auto_15955 ?auto_15950 ?auto_15953 ?auto_15954 )
      ( !DRIVE ?auto_15953 ?auto_15954 ?auto_15952 )
      ( !UNLOAD ?auto_15951 ?auto_15950 ?auto_15953 ?auto_15952 )
      ( !DROP ?auto_15951 ?auto_15950 ?auto_15949 ?auto_15952 )
      ( MAKE-1CRATE-VERIFY ?auto_15949 ?auto_15950 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15962 - SURFACE
      ?auto_15963 - SURFACE
      ?auto_15964 - SURFACE
      ?auto_15965 - SURFACE
      ?auto_15966 - SURFACE
    )
    :vars
    (
      ?auto_15968 - HOIST
      ?auto_15970 - PLACE
      ?auto_15972 - PLACE
      ?auto_15967 - HOIST
      ?auto_15969 - SURFACE
      ?auto_15973 - PLACE
      ?auto_15981 - HOIST
      ?auto_15974 - SURFACE
      ?auto_15977 - PLACE
      ?auto_15980 - HOIST
      ?auto_15979 - SURFACE
      ?auto_15978 - PLACE
      ?auto_15976 - HOIST
      ?auto_15975 - SURFACE
      ?auto_15971 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15968 ?auto_15970 ) ( IS-CRATE ?auto_15966 ) ( not ( = ?auto_15972 ?auto_15970 ) ) ( HOIST-AT ?auto_15967 ?auto_15972 ) ( AVAILABLE ?auto_15967 ) ( SURFACE-AT ?auto_15966 ?auto_15972 ) ( ON ?auto_15966 ?auto_15969 ) ( CLEAR ?auto_15966 ) ( not ( = ?auto_15965 ?auto_15966 ) ) ( not ( = ?auto_15965 ?auto_15969 ) ) ( not ( = ?auto_15966 ?auto_15969 ) ) ( not ( = ?auto_15968 ?auto_15967 ) ) ( IS-CRATE ?auto_15965 ) ( not ( = ?auto_15973 ?auto_15970 ) ) ( HOIST-AT ?auto_15981 ?auto_15973 ) ( AVAILABLE ?auto_15981 ) ( SURFACE-AT ?auto_15965 ?auto_15973 ) ( ON ?auto_15965 ?auto_15974 ) ( CLEAR ?auto_15965 ) ( not ( = ?auto_15964 ?auto_15965 ) ) ( not ( = ?auto_15964 ?auto_15974 ) ) ( not ( = ?auto_15965 ?auto_15974 ) ) ( not ( = ?auto_15968 ?auto_15981 ) ) ( IS-CRATE ?auto_15964 ) ( not ( = ?auto_15977 ?auto_15970 ) ) ( HOIST-AT ?auto_15980 ?auto_15977 ) ( AVAILABLE ?auto_15980 ) ( SURFACE-AT ?auto_15964 ?auto_15977 ) ( ON ?auto_15964 ?auto_15979 ) ( CLEAR ?auto_15964 ) ( not ( = ?auto_15963 ?auto_15964 ) ) ( not ( = ?auto_15963 ?auto_15979 ) ) ( not ( = ?auto_15964 ?auto_15979 ) ) ( not ( = ?auto_15968 ?auto_15980 ) ) ( SURFACE-AT ?auto_15962 ?auto_15970 ) ( CLEAR ?auto_15962 ) ( IS-CRATE ?auto_15963 ) ( AVAILABLE ?auto_15968 ) ( not ( = ?auto_15978 ?auto_15970 ) ) ( HOIST-AT ?auto_15976 ?auto_15978 ) ( AVAILABLE ?auto_15976 ) ( SURFACE-AT ?auto_15963 ?auto_15978 ) ( ON ?auto_15963 ?auto_15975 ) ( CLEAR ?auto_15963 ) ( TRUCK-AT ?auto_15971 ?auto_15970 ) ( not ( = ?auto_15962 ?auto_15963 ) ) ( not ( = ?auto_15962 ?auto_15975 ) ) ( not ( = ?auto_15963 ?auto_15975 ) ) ( not ( = ?auto_15968 ?auto_15976 ) ) ( not ( = ?auto_15962 ?auto_15964 ) ) ( not ( = ?auto_15962 ?auto_15979 ) ) ( not ( = ?auto_15964 ?auto_15975 ) ) ( not ( = ?auto_15977 ?auto_15978 ) ) ( not ( = ?auto_15980 ?auto_15976 ) ) ( not ( = ?auto_15979 ?auto_15975 ) ) ( not ( = ?auto_15962 ?auto_15965 ) ) ( not ( = ?auto_15962 ?auto_15974 ) ) ( not ( = ?auto_15963 ?auto_15965 ) ) ( not ( = ?auto_15963 ?auto_15974 ) ) ( not ( = ?auto_15965 ?auto_15979 ) ) ( not ( = ?auto_15965 ?auto_15975 ) ) ( not ( = ?auto_15973 ?auto_15977 ) ) ( not ( = ?auto_15973 ?auto_15978 ) ) ( not ( = ?auto_15981 ?auto_15980 ) ) ( not ( = ?auto_15981 ?auto_15976 ) ) ( not ( = ?auto_15974 ?auto_15979 ) ) ( not ( = ?auto_15974 ?auto_15975 ) ) ( not ( = ?auto_15962 ?auto_15966 ) ) ( not ( = ?auto_15962 ?auto_15969 ) ) ( not ( = ?auto_15963 ?auto_15966 ) ) ( not ( = ?auto_15963 ?auto_15969 ) ) ( not ( = ?auto_15964 ?auto_15966 ) ) ( not ( = ?auto_15964 ?auto_15969 ) ) ( not ( = ?auto_15966 ?auto_15974 ) ) ( not ( = ?auto_15966 ?auto_15979 ) ) ( not ( = ?auto_15966 ?auto_15975 ) ) ( not ( = ?auto_15972 ?auto_15973 ) ) ( not ( = ?auto_15972 ?auto_15977 ) ) ( not ( = ?auto_15972 ?auto_15978 ) ) ( not ( = ?auto_15967 ?auto_15981 ) ) ( not ( = ?auto_15967 ?auto_15980 ) ) ( not ( = ?auto_15967 ?auto_15976 ) ) ( not ( = ?auto_15969 ?auto_15974 ) ) ( not ( = ?auto_15969 ?auto_15979 ) ) ( not ( = ?auto_15969 ?auto_15975 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_15962 ?auto_15963 ?auto_15964 ?auto_15965 )
      ( MAKE-1CRATE ?auto_15965 ?auto_15966 )
      ( MAKE-4CRATE-VERIFY ?auto_15962 ?auto_15963 ?auto_15964 ?auto_15965 ?auto_15966 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15984 - SURFACE
      ?auto_15985 - SURFACE
    )
    :vars
    (
      ?auto_15986 - HOIST
      ?auto_15987 - PLACE
      ?auto_15989 - PLACE
      ?auto_15990 - HOIST
      ?auto_15991 - SURFACE
      ?auto_15988 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15986 ?auto_15987 ) ( SURFACE-AT ?auto_15984 ?auto_15987 ) ( CLEAR ?auto_15984 ) ( IS-CRATE ?auto_15985 ) ( AVAILABLE ?auto_15986 ) ( not ( = ?auto_15989 ?auto_15987 ) ) ( HOIST-AT ?auto_15990 ?auto_15989 ) ( AVAILABLE ?auto_15990 ) ( SURFACE-AT ?auto_15985 ?auto_15989 ) ( ON ?auto_15985 ?auto_15991 ) ( CLEAR ?auto_15985 ) ( TRUCK-AT ?auto_15988 ?auto_15987 ) ( not ( = ?auto_15984 ?auto_15985 ) ) ( not ( = ?auto_15984 ?auto_15991 ) ) ( not ( = ?auto_15985 ?auto_15991 ) ) ( not ( = ?auto_15986 ?auto_15990 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15988 ?auto_15987 ?auto_15989 )
      ( !LIFT ?auto_15990 ?auto_15985 ?auto_15991 ?auto_15989 )
      ( !LOAD ?auto_15990 ?auto_15985 ?auto_15988 ?auto_15989 )
      ( !DRIVE ?auto_15988 ?auto_15989 ?auto_15987 )
      ( !UNLOAD ?auto_15986 ?auto_15985 ?auto_15988 ?auto_15987 )
      ( !DROP ?auto_15986 ?auto_15985 ?auto_15984 ?auto_15987 )
      ( MAKE-1CRATE-VERIFY ?auto_15984 ?auto_15985 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_15998 - SURFACE
      ?auto_15999 - SURFACE
      ?auto_16000 - SURFACE
      ?auto_16001 - SURFACE
      ?auto_16002 - SURFACE
      ?auto_16003 - SURFACE
    )
    :vars
    (
      ?auto_16009 - HOIST
      ?auto_16008 - PLACE
      ?auto_16005 - PLACE
      ?auto_16006 - HOIST
      ?auto_16004 - SURFACE
      ?auto_16021 - PLACE
      ?auto_16015 - HOIST
      ?auto_16014 - SURFACE
      ?auto_16018 - PLACE
      ?auto_16012 - HOIST
      ?auto_16013 - SURFACE
      ?auto_16020 - PLACE
      ?auto_16019 - HOIST
      ?auto_16010 - SURFACE
      ?auto_16011 - PLACE
      ?auto_16016 - HOIST
      ?auto_16017 - SURFACE
      ?auto_16007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16009 ?auto_16008 ) ( IS-CRATE ?auto_16003 ) ( not ( = ?auto_16005 ?auto_16008 ) ) ( HOIST-AT ?auto_16006 ?auto_16005 ) ( AVAILABLE ?auto_16006 ) ( SURFACE-AT ?auto_16003 ?auto_16005 ) ( ON ?auto_16003 ?auto_16004 ) ( CLEAR ?auto_16003 ) ( not ( = ?auto_16002 ?auto_16003 ) ) ( not ( = ?auto_16002 ?auto_16004 ) ) ( not ( = ?auto_16003 ?auto_16004 ) ) ( not ( = ?auto_16009 ?auto_16006 ) ) ( IS-CRATE ?auto_16002 ) ( not ( = ?auto_16021 ?auto_16008 ) ) ( HOIST-AT ?auto_16015 ?auto_16021 ) ( AVAILABLE ?auto_16015 ) ( SURFACE-AT ?auto_16002 ?auto_16021 ) ( ON ?auto_16002 ?auto_16014 ) ( CLEAR ?auto_16002 ) ( not ( = ?auto_16001 ?auto_16002 ) ) ( not ( = ?auto_16001 ?auto_16014 ) ) ( not ( = ?auto_16002 ?auto_16014 ) ) ( not ( = ?auto_16009 ?auto_16015 ) ) ( IS-CRATE ?auto_16001 ) ( not ( = ?auto_16018 ?auto_16008 ) ) ( HOIST-AT ?auto_16012 ?auto_16018 ) ( AVAILABLE ?auto_16012 ) ( SURFACE-AT ?auto_16001 ?auto_16018 ) ( ON ?auto_16001 ?auto_16013 ) ( CLEAR ?auto_16001 ) ( not ( = ?auto_16000 ?auto_16001 ) ) ( not ( = ?auto_16000 ?auto_16013 ) ) ( not ( = ?auto_16001 ?auto_16013 ) ) ( not ( = ?auto_16009 ?auto_16012 ) ) ( IS-CRATE ?auto_16000 ) ( not ( = ?auto_16020 ?auto_16008 ) ) ( HOIST-AT ?auto_16019 ?auto_16020 ) ( AVAILABLE ?auto_16019 ) ( SURFACE-AT ?auto_16000 ?auto_16020 ) ( ON ?auto_16000 ?auto_16010 ) ( CLEAR ?auto_16000 ) ( not ( = ?auto_15999 ?auto_16000 ) ) ( not ( = ?auto_15999 ?auto_16010 ) ) ( not ( = ?auto_16000 ?auto_16010 ) ) ( not ( = ?auto_16009 ?auto_16019 ) ) ( SURFACE-AT ?auto_15998 ?auto_16008 ) ( CLEAR ?auto_15998 ) ( IS-CRATE ?auto_15999 ) ( AVAILABLE ?auto_16009 ) ( not ( = ?auto_16011 ?auto_16008 ) ) ( HOIST-AT ?auto_16016 ?auto_16011 ) ( AVAILABLE ?auto_16016 ) ( SURFACE-AT ?auto_15999 ?auto_16011 ) ( ON ?auto_15999 ?auto_16017 ) ( CLEAR ?auto_15999 ) ( TRUCK-AT ?auto_16007 ?auto_16008 ) ( not ( = ?auto_15998 ?auto_15999 ) ) ( not ( = ?auto_15998 ?auto_16017 ) ) ( not ( = ?auto_15999 ?auto_16017 ) ) ( not ( = ?auto_16009 ?auto_16016 ) ) ( not ( = ?auto_15998 ?auto_16000 ) ) ( not ( = ?auto_15998 ?auto_16010 ) ) ( not ( = ?auto_16000 ?auto_16017 ) ) ( not ( = ?auto_16020 ?auto_16011 ) ) ( not ( = ?auto_16019 ?auto_16016 ) ) ( not ( = ?auto_16010 ?auto_16017 ) ) ( not ( = ?auto_15998 ?auto_16001 ) ) ( not ( = ?auto_15998 ?auto_16013 ) ) ( not ( = ?auto_15999 ?auto_16001 ) ) ( not ( = ?auto_15999 ?auto_16013 ) ) ( not ( = ?auto_16001 ?auto_16010 ) ) ( not ( = ?auto_16001 ?auto_16017 ) ) ( not ( = ?auto_16018 ?auto_16020 ) ) ( not ( = ?auto_16018 ?auto_16011 ) ) ( not ( = ?auto_16012 ?auto_16019 ) ) ( not ( = ?auto_16012 ?auto_16016 ) ) ( not ( = ?auto_16013 ?auto_16010 ) ) ( not ( = ?auto_16013 ?auto_16017 ) ) ( not ( = ?auto_15998 ?auto_16002 ) ) ( not ( = ?auto_15998 ?auto_16014 ) ) ( not ( = ?auto_15999 ?auto_16002 ) ) ( not ( = ?auto_15999 ?auto_16014 ) ) ( not ( = ?auto_16000 ?auto_16002 ) ) ( not ( = ?auto_16000 ?auto_16014 ) ) ( not ( = ?auto_16002 ?auto_16013 ) ) ( not ( = ?auto_16002 ?auto_16010 ) ) ( not ( = ?auto_16002 ?auto_16017 ) ) ( not ( = ?auto_16021 ?auto_16018 ) ) ( not ( = ?auto_16021 ?auto_16020 ) ) ( not ( = ?auto_16021 ?auto_16011 ) ) ( not ( = ?auto_16015 ?auto_16012 ) ) ( not ( = ?auto_16015 ?auto_16019 ) ) ( not ( = ?auto_16015 ?auto_16016 ) ) ( not ( = ?auto_16014 ?auto_16013 ) ) ( not ( = ?auto_16014 ?auto_16010 ) ) ( not ( = ?auto_16014 ?auto_16017 ) ) ( not ( = ?auto_15998 ?auto_16003 ) ) ( not ( = ?auto_15998 ?auto_16004 ) ) ( not ( = ?auto_15999 ?auto_16003 ) ) ( not ( = ?auto_15999 ?auto_16004 ) ) ( not ( = ?auto_16000 ?auto_16003 ) ) ( not ( = ?auto_16000 ?auto_16004 ) ) ( not ( = ?auto_16001 ?auto_16003 ) ) ( not ( = ?auto_16001 ?auto_16004 ) ) ( not ( = ?auto_16003 ?auto_16014 ) ) ( not ( = ?auto_16003 ?auto_16013 ) ) ( not ( = ?auto_16003 ?auto_16010 ) ) ( not ( = ?auto_16003 ?auto_16017 ) ) ( not ( = ?auto_16005 ?auto_16021 ) ) ( not ( = ?auto_16005 ?auto_16018 ) ) ( not ( = ?auto_16005 ?auto_16020 ) ) ( not ( = ?auto_16005 ?auto_16011 ) ) ( not ( = ?auto_16006 ?auto_16015 ) ) ( not ( = ?auto_16006 ?auto_16012 ) ) ( not ( = ?auto_16006 ?auto_16019 ) ) ( not ( = ?auto_16006 ?auto_16016 ) ) ( not ( = ?auto_16004 ?auto_16014 ) ) ( not ( = ?auto_16004 ?auto_16013 ) ) ( not ( = ?auto_16004 ?auto_16010 ) ) ( not ( = ?auto_16004 ?auto_16017 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_15998 ?auto_15999 ?auto_16000 ?auto_16001 ?auto_16002 )
      ( MAKE-1CRATE ?auto_16002 ?auto_16003 )
      ( MAKE-5CRATE-VERIFY ?auto_15998 ?auto_15999 ?auto_16000 ?auto_16001 ?auto_16002 ?auto_16003 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16024 - SURFACE
      ?auto_16025 - SURFACE
    )
    :vars
    (
      ?auto_16026 - HOIST
      ?auto_16027 - PLACE
      ?auto_16029 - PLACE
      ?auto_16030 - HOIST
      ?auto_16031 - SURFACE
      ?auto_16028 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16026 ?auto_16027 ) ( SURFACE-AT ?auto_16024 ?auto_16027 ) ( CLEAR ?auto_16024 ) ( IS-CRATE ?auto_16025 ) ( AVAILABLE ?auto_16026 ) ( not ( = ?auto_16029 ?auto_16027 ) ) ( HOIST-AT ?auto_16030 ?auto_16029 ) ( AVAILABLE ?auto_16030 ) ( SURFACE-AT ?auto_16025 ?auto_16029 ) ( ON ?auto_16025 ?auto_16031 ) ( CLEAR ?auto_16025 ) ( TRUCK-AT ?auto_16028 ?auto_16027 ) ( not ( = ?auto_16024 ?auto_16025 ) ) ( not ( = ?auto_16024 ?auto_16031 ) ) ( not ( = ?auto_16025 ?auto_16031 ) ) ( not ( = ?auto_16026 ?auto_16030 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16028 ?auto_16027 ?auto_16029 )
      ( !LIFT ?auto_16030 ?auto_16025 ?auto_16031 ?auto_16029 )
      ( !LOAD ?auto_16030 ?auto_16025 ?auto_16028 ?auto_16029 )
      ( !DRIVE ?auto_16028 ?auto_16029 ?auto_16027 )
      ( !UNLOAD ?auto_16026 ?auto_16025 ?auto_16028 ?auto_16027 )
      ( !DROP ?auto_16026 ?auto_16025 ?auto_16024 ?auto_16027 )
      ( MAKE-1CRATE-VERIFY ?auto_16024 ?auto_16025 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_16039 - SURFACE
      ?auto_16040 - SURFACE
      ?auto_16041 - SURFACE
      ?auto_16042 - SURFACE
      ?auto_16043 - SURFACE
      ?auto_16044 - SURFACE
      ?auto_16045 - SURFACE
    )
    :vars
    (
      ?auto_16048 - HOIST
      ?auto_16047 - PLACE
      ?auto_16050 - PLACE
      ?auto_16051 - HOIST
      ?auto_16049 - SURFACE
      ?auto_16053 - PLACE
      ?auto_16052 - HOIST
      ?auto_16061 - SURFACE
      ?auto_16066 - PLACE
      ?auto_16058 - HOIST
      ?auto_16059 - SURFACE
      ?auto_16064 - PLACE
      ?auto_16054 - HOIST
      ?auto_16055 - SURFACE
      ?auto_16062 - PLACE
      ?auto_16065 - HOIST
      ?auto_16063 - SURFACE
      ?auto_16060 - PLACE
      ?auto_16057 - HOIST
      ?auto_16056 - SURFACE
      ?auto_16046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16048 ?auto_16047 ) ( IS-CRATE ?auto_16045 ) ( not ( = ?auto_16050 ?auto_16047 ) ) ( HOIST-AT ?auto_16051 ?auto_16050 ) ( AVAILABLE ?auto_16051 ) ( SURFACE-AT ?auto_16045 ?auto_16050 ) ( ON ?auto_16045 ?auto_16049 ) ( CLEAR ?auto_16045 ) ( not ( = ?auto_16044 ?auto_16045 ) ) ( not ( = ?auto_16044 ?auto_16049 ) ) ( not ( = ?auto_16045 ?auto_16049 ) ) ( not ( = ?auto_16048 ?auto_16051 ) ) ( IS-CRATE ?auto_16044 ) ( not ( = ?auto_16053 ?auto_16047 ) ) ( HOIST-AT ?auto_16052 ?auto_16053 ) ( AVAILABLE ?auto_16052 ) ( SURFACE-AT ?auto_16044 ?auto_16053 ) ( ON ?auto_16044 ?auto_16061 ) ( CLEAR ?auto_16044 ) ( not ( = ?auto_16043 ?auto_16044 ) ) ( not ( = ?auto_16043 ?auto_16061 ) ) ( not ( = ?auto_16044 ?auto_16061 ) ) ( not ( = ?auto_16048 ?auto_16052 ) ) ( IS-CRATE ?auto_16043 ) ( not ( = ?auto_16066 ?auto_16047 ) ) ( HOIST-AT ?auto_16058 ?auto_16066 ) ( AVAILABLE ?auto_16058 ) ( SURFACE-AT ?auto_16043 ?auto_16066 ) ( ON ?auto_16043 ?auto_16059 ) ( CLEAR ?auto_16043 ) ( not ( = ?auto_16042 ?auto_16043 ) ) ( not ( = ?auto_16042 ?auto_16059 ) ) ( not ( = ?auto_16043 ?auto_16059 ) ) ( not ( = ?auto_16048 ?auto_16058 ) ) ( IS-CRATE ?auto_16042 ) ( not ( = ?auto_16064 ?auto_16047 ) ) ( HOIST-AT ?auto_16054 ?auto_16064 ) ( AVAILABLE ?auto_16054 ) ( SURFACE-AT ?auto_16042 ?auto_16064 ) ( ON ?auto_16042 ?auto_16055 ) ( CLEAR ?auto_16042 ) ( not ( = ?auto_16041 ?auto_16042 ) ) ( not ( = ?auto_16041 ?auto_16055 ) ) ( not ( = ?auto_16042 ?auto_16055 ) ) ( not ( = ?auto_16048 ?auto_16054 ) ) ( IS-CRATE ?auto_16041 ) ( not ( = ?auto_16062 ?auto_16047 ) ) ( HOIST-AT ?auto_16065 ?auto_16062 ) ( AVAILABLE ?auto_16065 ) ( SURFACE-AT ?auto_16041 ?auto_16062 ) ( ON ?auto_16041 ?auto_16063 ) ( CLEAR ?auto_16041 ) ( not ( = ?auto_16040 ?auto_16041 ) ) ( not ( = ?auto_16040 ?auto_16063 ) ) ( not ( = ?auto_16041 ?auto_16063 ) ) ( not ( = ?auto_16048 ?auto_16065 ) ) ( SURFACE-AT ?auto_16039 ?auto_16047 ) ( CLEAR ?auto_16039 ) ( IS-CRATE ?auto_16040 ) ( AVAILABLE ?auto_16048 ) ( not ( = ?auto_16060 ?auto_16047 ) ) ( HOIST-AT ?auto_16057 ?auto_16060 ) ( AVAILABLE ?auto_16057 ) ( SURFACE-AT ?auto_16040 ?auto_16060 ) ( ON ?auto_16040 ?auto_16056 ) ( CLEAR ?auto_16040 ) ( TRUCK-AT ?auto_16046 ?auto_16047 ) ( not ( = ?auto_16039 ?auto_16040 ) ) ( not ( = ?auto_16039 ?auto_16056 ) ) ( not ( = ?auto_16040 ?auto_16056 ) ) ( not ( = ?auto_16048 ?auto_16057 ) ) ( not ( = ?auto_16039 ?auto_16041 ) ) ( not ( = ?auto_16039 ?auto_16063 ) ) ( not ( = ?auto_16041 ?auto_16056 ) ) ( not ( = ?auto_16062 ?auto_16060 ) ) ( not ( = ?auto_16065 ?auto_16057 ) ) ( not ( = ?auto_16063 ?auto_16056 ) ) ( not ( = ?auto_16039 ?auto_16042 ) ) ( not ( = ?auto_16039 ?auto_16055 ) ) ( not ( = ?auto_16040 ?auto_16042 ) ) ( not ( = ?auto_16040 ?auto_16055 ) ) ( not ( = ?auto_16042 ?auto_16063 ) ) ( not ( = ?auto_16042 ?auto_16056 ) ) ( not ( = ?auto_16064 ?auto_16062 ) ) ( not ( = ?auto_16064 ?auto_16060 ) ) ( not ( = ?auto_16054 ?auto_16065 ) ) ( not ( = ?auto_16054 ?auto_16057 ) ) ( not ( = ?auto_16055 ?auto_16063 ) ) ( not ( = ?auto_16055 ?auto_16056 ) ) ( not ( = ?auto_16039 ?auto_16043 ) ) ( not ( = ?auto_16039 ?auto_16059 ) ) ( not ( = ?auto_16040 ?auto_16043 ) ) ( not ( = ?auto_16040 ?auto_16059 ) ) ( not ( = ?auto_16041 ?auto_16043 ) ) ( not ( = ?auto_16041 ?auto_16059 ) ) ( not ( = ?auto_16043 ?auto_16055 ) ) ( not ( = ?auto_16043 ?auto_16063 ) ) ( not ( = ?auto_16043 ?auto_16056 ) ) ( not ( = ?auto_16066 ?auto_16064 ) ) ( not ( = ?auto_16066 ?auto_16062 ) ) ( not ( = ?auto_16066 ?auto_16060 ) ) ( not ( = ?auto_16058 ?auto_16054 ) ) ( not ( = ?auto_16058 ?auto_16065 ) ) ( not ( = ?auto_16058 ?auto_16057 ) ) ( not ( = ?auto_16059 ?auto_16055 ) ) ( not ( = ?auto_16059 ?auto_16063 ) ) ( not ( = ?auto_16059 ?auto_16056 ) ) ( not ( = ?auto_16039 ?auto_16044 ) ) ( not ( = ?auto_16039 ?auto_16061 ) ) ( not ( = ?auto_16040 ?auto_16044 ) ) ( not ( = ?auto_16040 ?auto_16061 ) ) ( not ( = ?auto_16041 ?auto_16044 ) ) ( not ( = ?auto_16041 ?auto_16061 ) ) ( not ( = ?auto_16042 ?auto_16044 ) ) ( not ( = ?auto_16042 ?auto_16061 ) ) ( not ( = ?auto_16044 ?auto_16059 ) ) ( not ( = ?auto_16044 ?auto_16055 ) ) ( not ( = ?auto_16044 ?auto_16063 ) ) ( not ( = ?auto_16044 ?auto_16056 ) ) ( not ( = ?auto_16053 ?auto_16066 ) ) ( not ( = ?auto_16053 ?auto_16064 ) ) ( not ( = ?auto_16053 ?auto_16062 ) ) ( not ( = ?auto_16053 ?auto_16060 ) ) ( not ( = ?auto_16052 ?auto_16058 ) ) ( not ( = ?auto_16052 ?auto_16054 ) ) ( not ( = ?auto_16052 ?auto_16065 ) ) ( not ( = ?auto_16052 ?auto_16057 ) ) ( not ( = ?auto_16061 ?auto_16059 ) ) ( not ( = ?auto_16061 ?auto_16055 ) ) ( not ( = ?auto_16061 ?auto_16063 ) ) ( not ( = ?auto_16061 ?auto_16056 ) ) ( not ( = ?auto_16039 ?auto_16045 ) ) ( not ( = ?auto_16039 ?auto_16049 ) ) ( not ( = ?auto_16040 ?auto_16045 ) ) ( not ( = ?auto_16040 ?auto_16049 ) ) ( not ( = ?auto_16041 ?auto_16045 ) ) ( not ( = ?auto_16041 ?auto_16049 ) ) ( not ( = ?auto_16042 ?auto_16045 ) ) ( not ( = ?auto_16042 ?auto_16049 ) ) ( not ( = ?auto_16043 ?auto_16045 ) ) ( not ( = ?auto_16043 ?auto_16049 ) ) ( not ( = ?auto_16045 ?auto_16061 ) ) ( not ( = ?auto_16045 ?auto_16059 ) ) ( not ( = ?auto_16045 ?auto_16055 ) ) ( not ( = ?auto_16045 ?auto_16063 ) ) ( not ( = ?auto_16045 ?auto_16056 ) ) ( not ( = ?auto_16050 ?auto_16053 ) ) ( not ( = ?auto_16050 ?auto_16066 ) ) ( not ( = ?auto_16050 ?auto_16064 ) ) ( not ( = ?auto_16050 ?auto_16062 ) ) ( not ( = ?auto_16050 ?auto_16060 ) ) ( not ( = ?auto_16051 ?auto_16052 ) ) ( not ( = ?auto_16051 ?auto_16058 ) ) ( not ( = ?auto_16051 ?auto_16054 ) ) ( not ( = ?auto_16051 ?auto_16065 ) ) ( not ( = ?auto_16051 ?auto_16057 ) ) ( not ( = ?auto_16049 ?auto_16061 ) ) ( not ( = ?auto_16049 ?auto_16059 ) ) ( not ( = ?auto_16049 ?auto_16055 ) ) ( not ( = ?auto_16049 ?auto_16063 ) ) ( not ( = ?auto_16049 ?auto_16056 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_16039 ?auto_16040 ?auto_16041 ?auto_16042 ?auto_16043 ?auto_16044 )
      ( MAKE-1CRATE ?auto_16044 ?auto_16045 )
      ( MAKE-6CRATE-VERIFY ?auto_16039 ?auto_16040 ?auto_16041 ?auto_16042 ?auto_16043 ?auto_16044 ?auto_16045 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16069 - SURFACE
      ?auto_16070 - SURFACE
    )
    :vars
    (
      ?auto_16071 - HOIST
      ?auto_16072 - PLACE
      ?auto_16074 - PLACE
      ?auto_16075 - HOIST
      ?auto_16076 - SURFACE
      ?auto_16073 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16071 ?auto_16072 ) ( SURFACE-AT ?auto_16069 ?auto_16072 ) ( CLEAR ?auto_16069 ) ( IS-CRATE ?auto_16070 ) ( AVAILABLE ?auto_16071 ) ( not ( = ?auto_16074 ?auto_16072 ) ) ( HOIST-AT ?auto_16075 ?auto_16074 ) ( AVAILABLE ?auto_16075 ) ( SURFACE-AT ?auto_16070 ?auto_16074 ) ( ON ?auto_16070 ?auto_16076 ) ( CLEAR ?auto_16070 ) ( TRUCK-AT ?auto_16073 ?auto_16072 ) ( not ( = ?auto_16069 ?auto_16070 ) ) ( not ( = ?auto_16069 ?auto_16076 ) ) ( not ( = ?auto_16070 ?auto_16076 ) ) ( not ( = ?auto_16071 ?auto_16075 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16073 ?auto_16072 ?auto_16074 )
      ( !LIFT ?auto_16075 ?auto_16070 ?auto_16076 ?auto_16074 )
      ( !LOAD ?auto_16075 ?auto_16070 ?auto_16073 ?auto_16074 )
      ( !DRIVE ?auto_16073 ?auto_16074 ?auto_16072 )
      ( !UNLOAD ?auto_16071 ?auto_16070 ?auto_16073 ?auto_16072 )
      ( !DROP ?auto_16071 ?auto_16070 ?auto_16069 ?auto_16072 )
      ( MAKE-1CRATE-VERIFY ?auto_16069 ?auto_16070 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_16085 - SURFACE
      ?auto_16086 - SURFACE
      ?auto_16087 - SURFACE
      ?auto_16088 - SURFACE
      ?auto_16089 - SURFACE
      ?auto_16090 - SURFACE
      ?auto_16091 - SURFACE
      ?auto_16092 - SURFACE
    )
    :vars
    (
      ?auto_16096 - HOIST
      ?auto_16098 - PLACE
      ?auto_16097 - PLACE
      ?auto_16094 - HOIST
      ?auto_16093 - SURFACE
      ?auto_16100 - PLACE
      ?auto_16099 - HOIST
      ?auto_16112 - SURFACE
      ?auto_16103 - PLACE
      ?auto_16115 - HOIST
      ?auto_16104 - SURFACE
      ?auto_16114 - PLACE
      ?auto_16109 - HOIST
      ?auto_16108 - SURFACE
      ?auto_16106 - PLACE
      ?auto_16113 - HOIST
      ?auto_16116 - SURFACE
      ?auto_16102 - PLACE
      ?auto_16107 - HOIST
      ?auto_16105 - SURFACE
      ?auto_16101 - PLACE
      ?auto_16110 - HOIST
      ?auto_16111 - SURFACE
      ?auto_16095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16096 ?auto_16098 ) ( IS-CRATE ?auto_16092 ) ( not ( = ?auto_16097 ?auto_16098 ) ) ( HOIST-AT ?auto_16094 ?auto_16097 ) ( AVAILABLE ?auto_16094 ) ( SURFACE-AT ?auto_16092 ?auto_16097 ) ( ON ?auto_16092 ?auto_16093 ) ( CLEAR ?auto_16092 ) ( not ( = ?auto_16091 ?auto_16092 ) ) ( not ( = ?auto_16091 ?auto_16093 ) ) ( not ( = ?auto_16092 ?auto_16093 ) ) ( not ( = ?auto_16096 ?auto_16094 ) ) ( IS-CRATE ?auto_16091 ) ( not ( = ?auto_16100 ?auto_16098 ) ) ( HOIST-AT ?auto_16099 ?auto_16100 ) ( AVAILABLE ?auto_16099 ) ( SURFACE-AT ?auto_16091 ?auto_16100 ) ( ON ?auto_16091 ?auto_16112 ) ( CLEAR ?auto_16091 ) ( not ( = ?auto_16090 ?auto_16091 ) ) ( not ( = ?auto_16090 ?auto_16112 ) ) ( not ( = ?auto_16091 ?auto_16112 ) ) ( not ( = ?auto_16096 ?auto_16099 ) ) ( IS-CRATE ?auto_16090 ) ( not ( = ?auto_16103 ?auto_16098 ) ) ( HOIST-AT ?auto_16115 ?auto_16103 ) ( AVAILABLE ?auto_16115 ) ( SURFACE-AT ?auto_16090 ?auto_16103 ) ( ON ?auto_16090 ?auto_16104 ) ( CLEAR ?auto_16090 ) ( not ( = ?auto_16089 ?auto_16090 ) ) ( not ( = ?auto_16089 ?auto_16104 ) ) ( not ( = ?auto_16090 ?auto_16104 ) ) ( not ( = ?auto_16096 ?auto_16115 ) ) ( IS-CRATE ?auto_16089 ) ( not ( = ?auto_16114 ?auto_16098 ) ) ( HOIST-AT ?auto_16109 ?auto_16114 ) ( AVAILABLE ?auto_16109 ) ( SURFACE-AT ?auto_16089 ?auto_16114 ) ( ON ?auto_16089 ?auto_16108 ) ( CLEAR ?auto_16089 ) ( not ( = ?auto_16088 ?auto_16089 ) ) ( not ( = ?auto_16088 ?auto_16108 ) ) ( not ( = ?auto_16089 ?auto_16108 ) ) ( not ( = ?auto_16096 ?auto_16109 ) ) ( IS-CRATE ?auto_16088 ) ( not ( = ?auto_16106 ?auto_16098 ) ) ( HOIST-AT ?auto_16113 ?auto_16106 ) ( AVAILABLE ?auto_16113 ) ( SURFACE-AT ?auto_16088 ?auto_16106 ) ( ON ?auto_16088 ?auto_16116 ) ( CLEAR ?auto_16088 ) ( not ( = ?auto_16087 ?auto_16088 ) ) ( not ( = ?auto_16087 ?auto_16116 ) ) ( not ( = ?auto_16088 ?auto_16116 ) ) ( not ( = ?auto_16096 ?auto_16113 ) ) ( IS-CRATE ?auto_16087 ) ( not ( = ?auto_16102 ?auto_16098 ) ) ( HOIST-AT ?auto_16107 ?auto_16102 ) ( AVAILABLE ?auto_16107 ) ( SURFACE-AT ?auto_16087 ?auto_16102 ) ( ON ?auto_16087 ?auto_16105 ) ( CLEAR ?auto_16087 ) ( not ( = ?auto_16086 ?auto_16087 ) ) ( not ( = ?auto_16086 ?auto_16105 ) ) ( not ( = ?auto_16087 ?auto_16105 ) ) ( not ( = ?auto_16096 ?auto_16107 ) ) ( SURFACE-AT ?auto_16085 ?auto_16098 ) ( CLEAR ?auto_16085 ) ( IS-CRATE ?auto_16086 ) ( AVAILABLE ?auto_16096 ) ( not ( = ?auto_16101 ?auto_16098 ) ) ( HOIST-AT ?auto_16110 ?auto_16101 ) ( AVAILABLE ?auto_16110 ) ( SURFACE-AT ?auto_16086 ?auto_16101 ) ( ON ?auto_16086 ?auto_16111 ) ( CLEAR ?auto_16086 ) ( TRUCK-AT ?auto_16095 ?auto_16098 ) ( not ( = ?auto_16085 ?auto_16086 ) ) ( not ( = ?auto_16085 ?auto_16111 ) ) ( not ( = ?auto_16086 ?auto_16111 ) ) ( not ( = ?auto_16096 ?auto_16110 ) ) ( not ( = ?auto_16085 ?auto_16087 ) ) ( not ( = ?auto_16085 ?auto_16105 ) ) ( not ( = ?auto_16087 ?auto_16111 ) ) ( not ( = ?auto_16102 ?auto_16101 ) ) ( not ( = ?auto_16107 ?auto_16110 ) ) ( not ( = ?auto_16105 ?auto_16111 ) ) ( not ( = ?auto_16085 ?auto_16088 ) ) ( not ( = ?auto_16085 ?auto_16116 ) ) ( not ( = ?auto_16086 ?auto_16088 ) ) ( not ( = ?auto_16086 ?auto_16116 ) ) ( not ( = ?auto_16088 ?auto_16105 ) ) ( not ( = ?auto_16088 ?auto_16111 ) ) ( not ( = ?auto_16106 ?auto_16102 ) ) ( not ( = ?auto_16106 ?auto_16101 ) ) ( not ( = ?auto_16113 ?auto_16107 ) ) ( not ( = ?auto_16113 ?auto_16110 ) ) ( not ( = ?auto_16116 ?auto_16105 ) ) ( not ( = ?auto_16116 ?auto_16111 ) ) ( not ( = ?auto_16085 ?auto_16089 ) ) ( not ( = ?auto_16085 ?auto_16108 ) ) ( not ( = ?auto_16086 ?auto_16089 ) ) ( not ( = ?auto_16086 ?auto_16108 ) ) ( not ( = ?auto_16087 ?auto_16089 ) ) ( not ( = ?auto_16087 ?auto_16108 ) ) ( not ( = ?auto_16089 ?auto_16116 ) ) ( not ( = ?auto_16089 ?auto_16105 ) ) ( not ( = ?auto_16089 ?auto_16111 ) ) ( not ( = ?auto_16114 ?auto_16106 ) ) ( not ( = ?auto_16114 ?auto_16102 ) ) ( not ( = ?auto_16114 ?auto_16101 ) ) ( not ( = ?auto_16109 ?auto_16113 ) ) ( not ( = ?auto_16109 ?auto_16107 ) ) ( not ( = ?auto_16109 ?auto_16110 ) ) ( not ( = ?auto_16108 ?auto_16116 ) ) ( not ( = ?auto_16108 ?auto_16105 ) ) ( not ( = ?auto_16108 ?auto_16111 ) ) ( not ( = ?auto_16085 ?auto_16090 ) ) ( not ( = ?auto_16085 ?auto_16104 ) ) ( not ( = ?auto_16086 ?auto_16090 ) ) ( not ( = ?auto_16086 ?auto_16104 ) ) ( not ( = ?auto_16087 ?auto_16090 ) ) ( not ( = ?auto_16087 ?auto_16104 ) ) ( not ( = ?auto_16088 ?auto_16090 ) ) ( not ( = ?auto_16088 ?auto_16104 ) ) ( not ( = ?auto_16090 ?auto_16108 ) ) ( not ( = ?auto_16090 ?auto_16116 ) ) ( not ( = ?auto_16090 ?auto_16105 ) ) ( not ( = ?auto_16090 ?auto_16111 ) ) ( not ( = ?auto_16103 ?auto_16114 ) ) ( not ( = ?auto_16103 ?auto_16106 ) ) ( not ( = ?auto_16103 ?auto_16102 ) ) ( not ( = ?auto_16103 ?auto_16101 ) ) ( not ( = ?auto_16115 ?auto_16109 ) ) ( not ( = ?auto_16115 ?auto_16113 ) ) ( not ( = ?auto_16115 ?auto_16107 ) ) ( not ( = ?auto_16115 ?auto_16110 ) ) ( not ( = ?auto_16104 ?auto_16108 ) ) ( not ( = ?auto_16104 ?auto_16116 ) ) ( not ( = ?auto_16104 ?auto_16105 ) ) ( not ( = ?auto_16104 ?auto_16111 ) ) ( not ( = ?auto_16085 ?auto_16091 ) ) ( not ( = ?auto_16085 ?auto_16112 ) ) ( not ( = ?auto_16086 ?auto_16091 ) ) ( not ( = ?auto_16086 ?auto_16112 ) ) ( not ( = ?auto_16087 ?auto_16091 ) ) ( not ( = ?auto_16087 ?auto_16112 ) ) ( not ( = ?auto_16088 ?auto_16091 ) ) ( not ( = ?auto_16088 ?auto_16112 ) ) ( not ( = ?auto_16089 ?auto_16091 ) ) ( not ( = ?auto_16089 ?auto_16112 ) ) ( not ( = ?auto_16091 ?auto_16104 ) ) ( not ( = ?auto_16091 ?auto_16108 ) ) ( not ( = ?auto_16091 ?auto_16116 ) ) ( not ( = ?auto_16091 ?auto_16105 ) ) ( not ( = ?auto_16091 ?auto_16111 ) ) ( not ( = ?auto_16100 ?auto_16103 ) ) ( not ( = ?auto_16100 ?auto_16114 ) ) ( not ( = ?auto_16100 ?auto_16106 ) ) ( not ( = ?auto_16100 ?auto_16102 ) ) ( not ( = ?auto_16100 ?auto_16101 ) ) ( not ( = ?auto_16099 ?auto_16115 ) ) ( not ( = ?auto_16099 ?auto_16109 ) ) ( not ( = ?auto_16099 ?auto_16113 ) ) ( not ( = ?auto_16099 ?auto_16107 ) ) ( not ( = ?auto_16099 ?auto_16110 ) ) ( not ( = ?auto_16112 ?auto_16104 ) ) ( not ( = ?auto_16112 ?auto_16108 ) ) ( not ( = ?auto_16112 ?auto_16116 ) ) ( not ( = ?auto_16112 ?auto_16105 ) ) ( not ( = ?auto_16112 ?auto_16111 ) ) ( not ( = ?auto_16085 ?auto_16092 ) ) ( not ( = ?auto_16085 ?auto_16093 ) ) ( not ( = ?auto_16086 ?auto_16092 ) ) ( not ( = ?auto_16086 ?auto_16093 ) ) ( not ( = ?auto_16087 ?auto_16092 ) ) ( not ( = ?auto_16087 ?auto_16093 ) ) ( not ( = ?auto_16088 ?auto_16092 ) ) ( not ( = ?auto_16088 ?auto_16093 ) ) ( not ( = ?auto_16089 ?auto_16092 ) ) ( not ( = ?auto_16089 ?auto_16093 ) ) ( not ( = ?auto_16090 ?auto_16092 ) ) ( not ( = ?auto_16090 ?auto_16093 ) ) ( not ( = ?auto_16092 ?auto_16112 ) ) ( not ( = ?auto_16092 ?auto_16104 ) ) ( not ( = ?auto_16092 ?auto_16108 ) ) ( not ( = ?auto_16092 ?auto_16116 ) ) ( not ( = ?auto_16092 ?auto_16105 ) ) ( not ( = ?auto_16092 ?auto_16111 ) ) ( not ( = ?auto_16097 ?auto_16100 ) ) ( not ( = ?auto_16097 ?auto_16103 ) ) ( not ( = ?auto_16097 ?auto_16114 ) ) ( not ( = ?auto_16097 ?auto_16106 ) ) ( not ( = ?auto_16097 ?auto_16102 ) ) ( not ( = ?auto_16097 ?auto_16101 ) ) ( not ( = ?auto_16094 ?auto_16099 ) ) ( not ( = ?auto_16094 ?auto_16115 ) ) ( not ( = ?auto_16094 ?auto_16109 ) ) ( not ( = ?auto_16094 ?auto_16113 ) ) ( not ( = ?auto_16094 ?auto_16107 ) ) ( not ( = ?auto_16094 ?auto_16110 ) ) ( not ( = ?auto_16093 ?auto_16112 ) ) ( not ( = ?auto_16093 ?auto_16104 ) ) ( not ( = ?auto_16093 ?auto_16108 ) ) ( not ( = ?auto_16093 ?auto_16116 ) ) ( not ( = ?auto_16093 ?auto_16105 ) ) ( not ( = ?auto_16093 ?auto_16111 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_16085 ?auto_16086 ?auto_16087 ?auto_16088 ?auto_16089 ?auto_16090 ?auto_16091 )
      ( MAKE-1CRATE ?auto_16091 ?auto_16092 )
      ( MAKE-7CRATE-VERIFY ?auto_16085 ?auto_16086 ?auto_16087 ?auto_16088 ?auto_16089 ?auto_16090 ?auto_16091 ?auto_16092 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16119 - SURFACE
      ?auto_16120 - SURFACE
    )
    :vars
    (
      ?auto_16121 - HOIST
      ?auto_16122 - PLACE
      ?auto_16124 - PLACE
      ?auto_16125 - HOIST
      ?auto_16126 - SURFACE
      ?auto_16123 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16121 ?auto_16122 ) ( SURFACE-AT ?auto_16119 ?auto_16122 ) ( CLEAR ?auto_16119 ) ( IS-CRATE ?auto_16120 ) ( AVAILABLE ?auto_16121 ) ( not ( = ?auto_16124 ?auto_16122 ) ) ( HOIST-AT ?auto_16125 ?auto_16124 ) ( AVAILABLE ?auto_16125 ) ( SURFACE-AT ?auto_16120 ?auto_16124 ) ( ON ?auto_16120 ?auto_16126 ) ( CLEAR ?auto_16120 ) ( TRUCK-AT ?auto_16123 ?auto_16122 ) ( not ( = ?auto_16119 ?auto_16120 ) ) ( not ( = ?auto_16119 ?auto_16126 ) ) ( not ( = ?auto_16120 ?auto_16126 ) ) ( not ( = ?auto_16121 ?auto_16125 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16123 ?auto_16122 ?auto_16124 )
      ( !LIFT ?auto_16125 ?auto_16120 ?auto_16126 ?auto_16124 )
      ( !LOAD ?auto_16125 ?auto_16120 ?auto_16123 ?auto_16124 )
      ( !DRIVE ?auto_16123 ?auto_16124 ?auto_16122 )
      ( !UNLOAD ?auto_16121 ?auto_16120 ?auto_16123 ?auto_16122 )
      ( !DROP ?auto_16121 ?auto_16120 ?auto_16119 ?auto_16122 )
      ( MAKE-1CRATE-VERIFY ?auto_16119 ?auto_16120 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_16136 - SURFACE
      ?auto_16137 - SURFACE
      ?auto_16138 - SURFACE
      ?auto_16139 - SURFACE
      ?auto_16140 - SURFACE
      ?auto_16141 - SURFACE
      ?auto_16142 - SURFACE
      ?auto_16144 - SURFACE
      ?auto_16143 - SURFACE
    )
    :vars
    (
      ?auto_16145 - HOIST
      ?auto_16146 - PLACE
      ?auto_16149 - PLACE
      ?auto_16147 - HOIST
      ?auto_16148 - SURFACE
      ?auto_16170 - PLACE
      ?auto_16169 - HOIST
      ?auto_16167 - SURFACE
      ?auto_16151 - PLACE
      ?auto_16156 - HOIST
      ?auto_16163 - SURFACE
      ?auto_16168 - PLACE
      ?auto_16155 - HOIST
      ?auto_16166 - SURFACE
      ?auto_16157 - PLACE
      ?auto_16159 - HOIST
      ?auto_16160 - SURFACE
      ?auto_16164 - PLACE
      ?auto_16153 - HOIST
      ?auto_16154 - SURFACE
      ?auto_16171 - PLACE
      ?auto_16158 - HOIST
      ?auto_16165 - SURFACE
      ?auto_16152 - PLACE
      ?auto_16161 - HOIST
      ?auto_16162 - SURFACE
      ?auto_16150 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16145 ?auto_16146 ) ( IS-CRATE ?auto_16143 ) ( not ( = ?auto_16149 ?auto_16146 ) ) ( HOIST-AT ?auto_16147 ?auto_16149 ) ( AVAILABLE ?auto_16147 ) ( SURFACE-AT ?auto_16143 ?auto_16149 ) ( ON ?auto_16143 ?auto_16148 ) ( CLEAR ?auto_16143 ) ( not ( = ?auto_16144 ?auto_16143 ) ) ( not ( = ?auto_16144 ?auto_16148 ) ) ( not ( = ?auto_16143 ?auto_16148 ) ) ( not ( = ?auto_16145 ?auto_16147 ) ) ( IS-CRATE ?auto_16144 ) ( not ( = ?auto_16170 ?auto_16146 ) ) ( HOIST-AT ?auto_16169 ?auto_16170 ) ( AVAILABLE ?auto_16169 ) ( SURFACE-AT ?auto_16144 ?auto_16170 ) ( ON ?auto_16144 ?auto_16167 ) ( CLEAR ?auto_16144 ) ( not ( = ?auto_16142 ?auto_16144 ) ) ( not ( = ?auto_16142 ?auto_16167 ) ) ( not ( = ?auto_16144 ?auto_16167 ) ) ( not ( = ?auto_16145 ?auto_16169 ) ) ( IS-CRATE ?auto_16142 ) ( not ( = ?auto_16151 ?auto_16146 ) ) ( HOIST-AT ?auto_16156 ?auto_16151 ) ( AVAILABLE ?auto_16156 ) ( SURFACE-AT ?auto_16142 ?auto_16151 ) ( ON ?auto_16142 ?auto_16163 ) ( CLEAR ?auto_16142 ) ( not ( = ?auto_16141 ?auto_16142 ) ) ( not ( = ?auto_16141 ?auto_16163 ) ) ( not ( = ?auto_16142 ?auto_16163 ) ) ( not ( = ?auto_16145 ?auto_16156 ) ) ( IS-CRATE ?auto_16141 ) ( not ( = ?auto_16168 ?auto_16146 ) ) ( HOIST-AT ?auto_16155 ?auto_16168 ) ( AVAILABLE ?auto_16155 ) ( SURFACE-AT ?auto_16141 ?auto_16168 ) ( ON ?auto_16141 ?auto_16166 ) ( CLEAR ?auto_16141 ) ( not ( = ?auto_16140 ?auto_16141 ) ) ( not ( = ?auto_16140 ?auto_16166 ) ) ( not ( = ?auto_16141 ?auto_16166 ) ) ( not ( = ?auto_16145 ?auto_16155 ) ) ( IS-CRATE ?auto_16140 ) ( not ( = ?auto_16157 ?auto_16146 ) ) ( HOIST-AT ?auto_16159 ?auto_16157 ) ( AVAILABLE ?auto_16159 ) ( SURFACE-AT ?auto_16140 ?auto_16157 ) ( ON ?auto_16140 ?auto_16160 ) ( CLEAR ?auto_16140 ) ( not ( = ?auto_16139 ?auto_16140 ) ) ( not ( = ?auto_16139 ?auto_16160 ) ) ( not ( = ?auto_16140 ?auto_16160 ) ) ( not ( = ?auto_16145 ?auto_16159 ) ) ( IS-CRATE ?auto_16139 ) ( not ( = ?auto_16164 ?auto_16146 ) ) ( HOIST-AT ?auto_16153 ?auto_16164 ) ( AVAILABLE ?auto_16153 ) ( SURFACE-AT ?auto_16139 ?auto_16164 ) ( ON ?auto_16139 ?auto_16154 ) ( CLEAR ?auto_16139 ) ( not ( = ?auto_16138 ?auto_16139 ) ) ( not ( = ?auto_16138 ?auto_16154 ) ) ( not ( = ?auto_16139 ?auto_16154 ) ) ( not ( = ?auto_16145 ?auto_16153 ) ) ( IS-CRATE ?auto_16138 ) ( not ( = ?auto_16171 ?auto_16146 ) ) ( HOIST-AT ?auto_16158 ?auto_16171 ) ( AVAILABLE ?auto_16158 ) ( SURFACE-AT ?auto_16138 ?auto_16171 ) ( ON ?auto_16138 ?auto_16165 ) ( CLEAR ?auto_16138 ) ( not ( = ?auto_16137 ?auto_16138 ) ) ( not ( = ?auto_16137 ?auto_16165 ) ) ( not ( = ?auto_16138 ?auto_16165 ) ) ( not ( = ?auto_16145 ?auto_16158 ) ) ( SURFACE-AT ?auto_16136 ?auto_16146 ) ( CLEAR ?auto_16136 ) ( IS-CRATE ?auto_16137 ) ( AVAILABLE ?auto_16145 ) ( not ( = ?auto_16152 ?auto_16146 ) ) ( HOIST-AT ?auto_16161 ?auto_16152 ) ( AVAILABLE ?auto_16161 ) ( SURFACE-AT ?auto_16137 ?auto_16152 ) ( ON ?auto_16137 ?auto_16162 ) ( CLEAR ?auto_16137 ) ( TRUCK-AT ?auto_16150 ?auto_16146 ) ( not ( = ?auto_16136 ?auto_16137 ) ) ( not ( = ?auto_16136 ?auto_16162 ) ) ( not ( = ?auto_16137 ?auto_16162 ) ) ( not ( = ?auto_16145 ?auto_16161 ) ) ( not ( = ?auto_16136 ?auto_16138 ) ) ( not ( = ?auto_16136 ?auto_16165 ) ) ( not ( = ?auto_16138 ?auto_16162 ) ) ( not ( = ?auto_16171 ?auto_16152 ) ) ( not ( = ?auto_16158 ?auto_16161 ) ) ( not ( = ?auto_16165 ?auto_16162 ) ) ( not ( = ?auto_16136 ?auto_16139 ) ) ( not ( = ?auto_16136 ?auto_16154 ) ) ( not ( = ?auto_16137 ?auto_16139 ) ) ( not ( = ?auto_16137 ?auto_16154 ) ) ( not ( = ?auto_16139 ?auto_16165 ) ) ( not ( = ?auto_16139 ?auto_16162 ) ) ( not ( = ?auto_16164 ?auto_16171 ) ) ( not ( = ?auto_16164 ?auto_16152 ) ) ( not ( = ?auto_16153 ?auto_16158 ) ) ( not ( = ?auto_16153 ?auto_16161 ) ) ( not ( = ?auto_16154 ?auto_16165 ) ) ( not ( = ?auto_16154 ?auto_16162 ) ) ( not ( = ?auto_16136 ?auto_16140 ) ) ( not ( = ?auto_16136 ?auto_16160 ) ) ( not ( = ?auto_16137 ?auto_16140 ) ) ( not ( = ?auto_16137 ?auto_16160 ) ) ( not ( = ?auto_16138 ?auto_16140 ) ) ( not ( = ?auto_16138 ?auto_16160 ) ) ( not ( = ?auto_16140 ?auto_16154 ) ) ( not ( = ?auto_16140 ?auto_16165 ) ) ( not ( = ?auto_16140 ?auto_16162 ) ) ( not ( = ?auto_16157 ?auto_16164 ) ) ( not ( = ?auto_16157 ?auto_16171 ) ) ( not ( = ?auto_16157 ?auto_16152 ) ) ( not ( = ?auto_16159 ?auto_16153 ) ) ( not ( = ?auto_16159 ?auto_16158 ) ) ( not ( = ?auto_16159 ?auto_16161 ) ) ( not ( = ?auto_16160 ?auto_16154 ) ) ( not ( = ?auto_16160 ?auto_16165 ) ) ( not ( = ?auto_16160 ?auto_16162 ) ) ( not ( = ?auto_16136 ?auto_16141 ) ) ( not ( = ?auto_16136 ?auto_16166 ) ) ( not ( = ?auto_16137 ?auto_16141 ) ) ( not ( = ?auto_16137 ?auto_16166 ) ) ( not ( = ?auto_16138 ?auto_16141 ) ) ( not ( = ?auto_16138 ?auto_16166 ) ) ( not ( = ?auto_16139 ?auto_16141 ) ) ( not ( = ?auto_16139 ?auto_16166 ) ) ( not ( = ?auto_16141 ?auto_16160 ) ) ( not ( = ?auto_16141 ?auto_16154 ) ) ( not ( = ?auto_16141 ?auto_16165 ) ) ( not ( = ?auto_16141 ?auto_16162 ) ) ( not ( = ?auto_16168 ?auto_16157 ) ) ( not ( = ?auto_16168 ?auto_16164 ) ) ( not ( = ?auto_16168 ?auto_16171 ) ) ( not ( = ?auto_16168 ?auto_16152 ) ) ( not ( = ?auto_16155 ?auto_16159 ) ) ( not ( = ?auto_16155 ?auto_16153 ) ) ( not ( = ?auto_16155 ?auto_16158 ) ) ( not ( = ?auto_16155 ?auto_16161 ) ) ( not ( = ?auto_16166 ?auto_16160 ) ) ( not ( = ?auto_16166 ?auto_16154 ) ) ( not ( = ?auto_16166 ?auto_16165 ) ) ( not ( = ?auto_16166 ?auto_16162 ) ) ( not ( = ?auto_16136 ?auto_16142 ) ) ( not ( = ?auto_16136 ?auto_16163 ) ) ( not ( = ?auto_16137 ?auto_16142 ) ) ( not ( = ?auto_16137 ?auto_16163 ) ) ( not ( = ?auto_16138 ?auto_16142 ) ) ( not ( = ?auto_16138 ?auto_16163 ) ) ( not ( = ?auto_16139 ?auto_16142 ) ) ( not ( = ?auto_16139 ?auto_16163 ) ) ( not ( = ?auto_16140 ?auto_16142 ) ) ( not ( = ?auto_16140 ?auto_16163 ) ) ( not ( = ?auto_16142 ?auto_16166 ) ) ( not ( = ?auto_16142 ?auto_16160 ) ) ( not ( = ?auto_16142 ?auto_16154 ) ) ( not ( = ?auto_16142 ?auto_16165 ) ) ( not ( = ?auto_16142 ?auto_16162 ) ) ( not ( = ?auto_16151 ?auto_16168 ) ) ( not ( = ?auto_16151 ?auto_16157 ) ) ( not ( = ?auto_16151 ?auto_16164 ) ) ( not ( = ?auto_16151 ?auto_16171 ) ) ( not ( = ?auto_16151 ?auto_16152 ) ) ( not ( = ?auto_16156 ?auto_16155 ) ) ( not ( = ?auto_16156 ?auto_16159 ) ) ( not ( = ?auto_16156 ?auto_16153 ) ) ( not ( = ?auto_16156 ?auto_16158 ) ) ( not ( = ?auto_16156 ?auto_16161 ) ) ( not ( = ?auto_16163 ?auto_16166 ) ) ( not ( = ?auto_16163 ?auto_16160 ) ) ( not ( = ?auto_16163 ?auto_16154 ) ) ( not ( = ?auto_16163 ?auto_16165 ) ) ( not ( = ?auto_16163 ?auto_16162 ) ) ( not ( = ?auto_16136 ?auto_16144 ) ) ( not ( = ?auto_16136 ?auto_16167 ) ) ( not ( = ?auto_16137 ?auto_16144 ) ) ( not ( = ?auto_16137 ?auto_16167 ) ) ( not ( = ?auto_16138 ?auto_16144 ) ) ( not ( = ?auto_16138 ?auto_16167 ) ) ( not ( = ?auto_16139 ?auto_16144 ) ) ( not ( = ?auto_16139 ?auto_16167 ) ) ( not ( = ?auto_16140 ?auto_16144 ) ) ( not ( = ?auto_16140 ?auto_16167 ) ) ( not ( = ?auto_16141 ?auto_16144 ) ) ( not ( = ?auto_16141 ?auto_16167 ) ) ( not ( = ?auto_16144 ?auto_16163 ) ) ( not ( = ?auto_16144 ?auto_16166 ) ) ( not ( = ?auto_16144 ?auto_16160 ) ) ( not ( = ?auto_16144 ?auto_16154 ) ) ( not ( = ?auto_16144 ?auto_16165 ) ) ( not ( = ?auto_16144 ?auto_16162 ) ) ( not ( = ?auto_16170 ?auto_16151 ) ) ( not ( = ?auto_16170 ?auto_16168 ) ) ( not ( = ?auto_16170 ?auto_16157 ) ) ( not ( = ?auto_16170 ?auto_16164 ) ) ( not ( = ?auto_16170 ?auto_16171 ) ) ( not ( = ?auto_16170 ?auto_16152 ) ) ( not ( = ?auto_16169 ?auto_16156 ) ) ( not ( = ?auto_16169 ?auto_16155 ) ) ( not ( = ?auto_16169 ?auto_16159 ) ) ( not ( = ?auto_16169 ?auto_16153 ) ) ( not ( = ?auto_16169 ?auto_16158 ) ) ( not ( = ?auto_16169 ?auto_16161 ) ) ( not ( = ?auto_16167 ?auto_16163 ) ) ( not ( = ?auto_16167 ?auto_16166 ) ) ( not ( = ?auto_16167 ?auto_16160 ) ) ( not ( = ?auto_16167 ?auto_16154 ) ) ( not ( = ?auto_16167 ?auto_16165 ) ) ( not ( = ?auto_16167 ?auto_16162 ) ) ( not ( = ?auto_16136 ?auto_16143 ) ) ( not ( = ?auto_16136 ?auto_16148 ) ) ( not ( = ?auto_16137 ?auto_16143 ) ) ( not ( = ?auto_16137 ?auto_16148 ) ) ( not ( = ?auto_16138 ?auto_16143 ) ) ( not ( = ?auto_16138 ?auto_16148 ) ) ( not ( = ?auto_16139 ?auto_16143 ) ) ( not ( = ?auto_16139 ?auto_16148 ) ) ( not ( = ?auto_16140 ?auto_16143 ) ) ( not ( = ?auto_16140 ?auto_16148 ) ) ( not ( = ?auto_16141 ?auto_16143 ) ) ( not ( = ?auto_16141 ?auto_16148 ) ) ( not ( = ?auto_16142 ?auto_16143 ) ) ( not ( = ?auto_16142 ?auto_16148 ) ) ( not ( = ?auto_16143 ?auto_16167 ) ) ( not ( = ?auto_16143 ?auto_16163 ) ) ( not ( = ?auto_16143 ?auto_16166 ) ) ( not ( = ?auto_16143 ?auto_16160 ) ) ( not ( = ?auto_16143 ?auto_16154 ) ) ( not ( = ?auto_16143 ?auto_16165 ) ) ( not ( = ?auto_16143 ?auto_16162 ) ) ( not ( = ?auto_16149 ?auto_16170 ) ) ( not ( = ?auto_16149 ?auto_16151 ) ) ( not ( = ?auto_16149 ?auto_16168 ) ) ( not ( = ?auto_16149 ?auto_16157 ) ) ( not ( = ?auto_16149 ?auto_16164 ) ) ( not ( = ?auto_16149 ?auto_16171 ) ) ( not ( = ?auto_16149 ?auto_16152 ) ) ( not ( = ?auto_16147 ?auto_16169 ) ) ( not ( = ?auto_16147 ?auto_16156 ) ) ( not ( = ?auto_16147 ?auto_16155 ) ) ( not ( = ?auto_16147 ?auto_16159 ) ) ( not ( = ?auto_16147 ?auto_16153 ) ) ( not ( = ?auto_16147 ?auto_16158 ) ) ( not ( = ?auto_16147 ?auto_16161 ) ) ( not ( = ?auto_16148 ?auto_16167 ) ) ( not ( = ?auto_16148 ?auto_16163 ) ) ( not ( = ?auto_16148 ?auto_16166 ) ) ( not ( = ?auto_16148 ?auto_16160 ) ) ( not ( = ?auto_16148 ?auto_16154 ) ) ( not ( = ?auto_16148 ?auto_16165 ) ) ( not ( = ?auto_16148 ?auto_16162 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_16136 ?auto_16137 ?auto_16138 ?auto_16139 ?auto_16140 ?auto_16141 ?auto_16142 ?auto_16144 )
      ( MAKE-1CRATE ?auto_16144 ?auto_16143 )
      ( MAKE-8CRATE-VERIFY ?auto_16136 ?auto_16137 ?auto_16138 ?auto_16139 ?auto_16140 ?auto_16141 ?auto_16142 ?auto_16144 ?auto_16143 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16174 - SURFACE
      ?auto_16175 - SURFACE
    )
    :vars
    (
      ?auto_16176 - HOIST
      ?auto_16177 - PLACE
      ?auto_16179 - PLACE
      ?auto_16180 - HOIST
      ?auto_16181 - SURFACE
      ?auto_16178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16176 ?auto_16177 ) ( SURFACE-AT ?auto_16174 ?auto_16177 ) ( CLEAR ?auto_16174 ) ( IS-CRATE ?auto_16175 ) ( AVAILABLE ?auto_16176 ) ( not ( = ?auto_16179 ?auto_16177 ) ) ( HOIST-AT ?auto_16180 ?auto_16179 ) ( AVAILABLE ?auto_16180 ) ( SURFACE-AT ?auto_16175 ?auto_16179 ) ( ON ?auto_16175 ?auto_16181 ) ( CLEAR ?auto_16175 ) ( TRUCK-AT ?auto_16178 ?auto_16177 ) ( not ( = ?auto_16174 ?auto_16175 ) ) ( not ( = ?auto_16174 ?auto_16181 ) ) ( not ( = ?auto_16175 ?auto_16181 ) ) ( not ( = ?auto_16176 ?auto_16180 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16178 ?auto_16177 ?auto_16179 )
      ( !LIFT ?auto_16180 ?auto_16175 ?auto_16181 ?auto_16179 )
      ( !LOAD ?auto_16180 ?auto_16175 ?auto_16178 ?auto_16179 )
      ( !DRIVE ?auto_16178 ?auto_16179 ?auto_16177 )
      ( !UNLOAD ?auto_16176 ?auto_16175 ?auto_16178 ?auto_16177 )
      ( !DROP ?auto_16176 ?auto_16175 ?auto_16174 ?auto_16177 )
      ( MAKE-1CRATE-VERIFY ?auto_16174 ?auto_16175 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_16192 - SURFACE
      ?auto_16193 - SURFACE
      ?auto_16194 - SURFACE
      ?auto_16195 - SURFACE
      ?auto_16196 - SURFACE
      ?auto_16197 - SURFACE
      ?auto_16198 - SURFACE
      ?auto_16201 - SURFACE
      ?auto_16200 - SURFACE
      ?auto_16199 - SURFACE
    )
    :vars
    (
      ?auto_16203 - HOIST
      ?auto_16202 - PLACE
      ?auto_16207 - PLACE
      ?auto_16205 - HOIST
      ?auto_16206 - SURFACE
      ?auto_16210 - PLACE
      ?auto_16208 - HOIST
      ?auto_16231 - SURFACE
      ?auto_16217 - PLACE
      ?auto_16215 - HOIST
      ?auto_16214 - SURFACE
      ?auto_16213 - PLACE
      ?auto_16227 - HOIST
      ?auto_16223 - SURFACE
      ?auto_16212 - PLACE
      ?auto_16228 - HOIST
      ?auto_16218 - SURFACE
      ?auto_16226 - PLACE
      ?auto_16219 - HOIST
      ?auto_16221 - SURFACE
      ?auto_16224 - PLACE
      ?auto_16230 - HOIST
      ?auto_16211 - SURFACE
      ?auto_16216 - PLACE
      ?auto_16225 - HOIST
      ?auto_16229 - SURFACE
      ?auto_16209 - PLACE
      ?auto_16220 - HOIST
      ?auto_16222 - SURFACE
      ?auto_16204 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16203 ?auto_16202 ) ( IS-CRATE ?auto_16199 ) ( not ( = ?auto_16207 ?auto_16202 ) ) ( HOIST-AT ?auto_16205 ?auto_16207 ) ( AVAILABLE ?auto_16205 ) ( SURFACE-AT ?auto_16199 ?auto_16207 ) ( ON ?auto_16199 ?auto_16206 ) ( CLEAR ?auto_16199 ) ( not ( = ?auto_16200 ?auto_16199 ) ) ( not ( = ?auto_16200 ?auto_16206 ) ) ( not ( = ?auto_16199 ?auto_16206 ) ) ( not ( = ?auto_16203 ?auto_16205 ) ) ( IS-CRATE ?auto_16200 ) ( not ( = ?auto_16210 ?auto_16202 ) ) ( HOIST-AT ?auto_16208 ?auto_16210 ) ( AVAILABLE ?auto_16208 ) ( SURFACE-AT ?auto_16200 ?auto_16210 ) ( ON ?auto_16200 ?auto_16231 ) ( CLEAR ?auto_16200 ) ( not ( = ?auto_16201 ?auto_16200 ) ) ( not ( = ?auto_16201 ?auto_16231 ) ) ( not ( = ?auto_16200 ?auto_16231 ) ) ( not ( = ?auto_16203 ?auto_16208 ) ) ( IS-CRATE ?auto_16201 ) ( not ( = ?auto_16217 ?auto_16202 ) ) ( HOIST-AT ?auto_16215 ?auto_16217 ) ( AVAILABLE ?auto_16215 ) ( SURFACE-AT ?auto_16201 ?auto_16217 ) ( ON ?auto_16201 ?auto_16214 ) ( CLEAR ?auto_16201 ) ( not ( = ?auto_16198 ?auto_16201 ) ) ( not ( = ?auto_16198 ?auto_16214 ) ) ( not ( = ?auto_16201 ?auto_16214 ) ) ( not ( = ?auto_16203 ?auto_16215 ) ) ( IS-CRATE ?auto_16198 ) ( not ( = ?auto_16213 ?auto_16202 ) ) ( HOIST-AT ?auto_16227 ?auto_16213 ) ( AVAILABLE ?auto_16227 ) ( SURFACE-AT ?auto_16198 ?auto_16213 ) ( ON ?auto_16198 ?auto_16223 ) ( CLEAR ?auto_16198 ) ( not ( = ?auto_16197 ?auto_16198 ) ) ( not ( = ?auto_16197 ?auto_16223 ) ) ( not ( = ?auto_16198 ?auto_16223 ) ) ( not ( = ?auto_16203 ?auto_16227 ) ) ( IS-CRATE ?auto_16197 ) ( not ( = ?auto_16212 ?auto_16202 ) ) ( HOIST-AT ?auto_16228 ?auto_16212 ) ( AVAILABLE ?auto_16228 ) ( SURFACE-AT ?auto_16197 ?auto_16212 ) ( ON ?auto_16197 ?auto_16218 ) ( CLEAR ?auto_16197 ) ( not ( = ?auto_16196 ?auto_16197 ) ) ( not ( = ?auto_16196 ?auto_16218 ) ) ( not ( = ?auto_16197 ?auto_16218 ) ) ( not ( = ?auto_16203 ?auto_16228 ) ) ( IS-CRATE ?auto_16196 ) ( not ( = ?auto_16226 ?auto_16202 ) ) ( HOIST-AT ?auto_16219 ?auto_16226 ) ( AVAILABLE ?auto_16219 ) ( SURFACE-AT ?auto_16196 ?auto_16226 ) ( ON ?auto_16196 ?auto_16221 ) ( CLEAR ?auto_16196 ) ( not ( = ?auto_16195 ?auto_16196 ) ) ( not ( = ?auto_16195 ?auto_16221 ) ) ( not ( = ?auto_16196 ?auto_16221 ) ) ( not ( = ?auto_16203 ?auto_16219 ) ) ( IS-CRATE ?auto_16195 ) ( not ( = ?auto_16224 ?auto_16202 ) ) ( HOIST-AT ?auto_16230 ?auto_16224 ) ( AVAILABLE ?auto_16230 ) ( SURFACE-AT ?auto_16195 ?auto_16224 ) ( ON ?auto_16195 ?auto_16211 ) ( CLEAR ?auto_16195 ) ( not ( = ?auto_16194 ?auto_16195 ) ) ( not ( = ?auto_16194 ?auto_16211 ) ) ( not ( = ?auto_16195 ?auto_16211 ) ) ( not ( = ?auto_16203 ?auto_16230 ) ) ( IS-CRATE ?auto_16194 ) ( not ( = ?auto_16216 ?auto_16202 ) ) ( HOIST-AT ?auto_16225 ?auto_16216 ) ( AVAILABLE ?auto_16225 ) ( SURFACE-AT ?auto_16194 ?auto_16216 ) ( ON ?auto_16194 ?auto_16229 ) ( CLEAR ?auto_16194 ) ( not ( = ?auto_16193 ?auto_16194 ) ) ( not ( = ?auto_16193 ?auto_16229 ) ) ( not ( = ?auto_16194 ?auto_16229 ) ) ( not ( = ?auto_16203 ?auto_16225 ) ) ( SURFACE-AT ?auto_16192 ?auto_16202 ) ( CLEAR ?auto_16192 ) ( IS-CRATE ?auto_16193 ) ( AVAILABLE ?auto_16203 ) ( not ( = ?auto_16209 ?auto_16202 ) ) ( HOIST-AT ?auto_16220 ?auto_16209 ) ( AVAILABLE ?auto_16220 ) ( SURFACE-AT ?auto_16193 ?auto_16209 ) ( ON ?auto_16193 ?auto_16222 ) ( CLEAR ?auto_16193 ) ( TRUCK-AT ?auto_16204 ?auto_16202 ) ( not ( = ?auto_16192 ?auto_16193 ) ) ( not ( = ?auto_16192 ?auto_16222 ) ) ( not ( = ?auto_16193 ?auto_16222 ) ) ( not ( = ?auto_16203 ?auto_16220 ) ) ( not ( = ?auto_16192 ?auto_16194 ) ) ( not ( = ?auto_16192 ?auto_16229 ) ) ( not ( = ?auto_16194 ?auto_16222 ) ) ( not ( = ?auto_16216 ?auto_16209 ) ) ( not ( = ?auto_16225 ?auto_16220 ) ) ( not ( = ?auto_16229 ?auto_16222 ) ) ( not ( = ?auto_16192 ?auto_16195 ) ) ( not ( = ?auto_16192 ?auto_16211 ) ) ( not ( = ?auto_16193 ?auto_16195 ) ) ( not ( = ?auto_16193 ?auto_16211 ) ) ( not ( = ?auto_16195 ?auto_16229 ) ) ( not ( = ?auto_16195 ?auto_16222 ) ) ( not ( = ?auto_16224 ?auto_16216 ) ) ( not ( = ?auto_16224 ?auto_16209 ) ) ( not ( = ?auto_16230 ?auto_16225 ) ) ( not ( = ?auto_16230 ?auto_16220 ) ) ( not ( = ?auto_16211 ?auto_16229 ) ) ( not ( = ?auto_16211 ?auto_16222 ) ) ( not ( = ?auto_16192 ?auto_16196 ) ) ( not ( = ?auto_16192 ?auto_16221 ) ) ( not ( = ?auto_16193 ?auto_16196 ) ) ( not ( = ?auto_16193 ?auto_16221 ) ) ( not ( = ?auto_16194 ?auto_16196 ) ) ( not ( = ?auto_16194 ?auto_16221 ) ) ( not ( = ?auto_16196 ?auto_16211 ) ) ( not ( = ?auto_16196 ?auto_16229 ) ) ( not ( = ?auto_16196 ?auto_16222 ) ) ( not ( = ?auto_16226 ?auto_16224 ) ) ( not ( = ?auto_16226 ?auto_16216 ) ) ( not ( = ?auto_16226 ?auto_16209 ) ) ( not ( = ?auto_16219 ?auto_16230 ) ) ( not ( = ?auto_16219 ?auto_16225 ) ) ( not ( = ?auto_16219 ?auto_16220 ) ) ( not ( = ?auto_16221 ?auto_16211 ) ) ( not ( = ?auto_16221 ?auto_16229 ) ) ( not ( = ?auto_16221 ?auto_16222 ) ) ( not ( = ?auto_16192 ?auto_16197 ) ) ( not ( = ?auto_16192 ?auto_16218 ) ) ( not ( = ?auto_16193 ?auto_16197 ) ) ( not ( = ?auto_16193 ?auto_16218 ) ) ( not ( = ?auto_16194 ?auto_16197 ) ) ( not ( = ?auto_16194 ?auto_16218 ) ) ( not ( = ?auto_16195 ?auto_16197 ) ) ( not ( = ?auto_16195 ?auto_16218 ) ) ( not ( = ?auto_16197 ?auto_16221 ) ) ( not ( = ?auto_16197 ?auto_16211 ) ) ( not ( = ?auto_16197 ?auto_16229 ) ) ( not ( = ?auto_16197 ?auto_16222 ) ) ( not ( = ?auto_16212 ?auto_16226 ) ) ( not ( = ?auto_16212 ?auto_16224 ) ) ( not ( = ?auto_16212 ?auto_16216 ) ) ( not ( = ?auto_16212 ?auto_16209 ) ) ( not ( = ?auto_16228 ?auto_16219 ) ) ( not ( = ?auto_16228 ?auto_16230 ) ) ( not ( = ?auto_16228 ?auto_16225 ) ) ( not ( = ?auto_16228 ?auto_16220 ) ) ( not ( = ?auto_16218 ?auto_16221 ) ) ( not ( = ?auto_16218 ?auto_16211 ) ) ( not ( = ?auto_16218 ?auto_16229 ) ) ( not ( = ?auto_16218 ?auto_16222 ) ) ( not ( = ?auto_16192 ?auto_16198 ) ) ( not ( = ?auto_16192 ?auto_16223 ) ) ( not ( = ?auto_16193 ?auto_16198 ) ) ( not ( = ?auto_16193 ?auto_16223 ) ) ( not ( = ?auto_16194 ?auto_16198 ) ) ( not ( = ?auto_16194 ?auto_16223 ) ) ( not ( = ?auto_16195 ?auto_16198 ) ) ( not ( = ?auto_16195 ?auto_16223 ) ) ( not ( = ?auto_16196 ?auto_16198 ) ) ( not ( = ?auto_16196 ?auto_16223 ) ) ( not ( = ?auto_16198 ?auto_16218 ) ) ( not ( = ?auto_16198 ?auto_16221 ) ) ( not ( = ?auto_16198 ?auto_16211 ) ) ( not ( = ?auto_16198 ?auto_16229 ) ) ( not ( = ?auto_16198 ?auto_16222 ) ) ( not ( = ?auto_16213 ?auto_16212 ) ) ( not ( = ?auto_16213 ?auto_16226 ) ) ( not ( = ?auto_16213 ?auto_16224 ) ) ( not ( = ?auto_16213 ?auto_16216 ) ) ( not ( = ?auto_16213 ?auto_16209 ) ) ( not ( = ?auto_16227 ?auto_16228 ) ) ( not ( = ?auto_16227 ?auto_16219 ) ) ( not ( = ?auto_16227 ?auto_16230 ) ) ( not ( = ?auto_16227 ?auto_16225 ) ) ( not ( = ?auto_16227 ?auto_16220 ) ) ( not ( = ?auto_16223 ?auto_16218 ) ) ( not ( = ?auto_16223 ?auto_16221 ) ) ( not ( = ?auto_16223 ?auto_16211 ) ) ( not ( = ?auto_16223 ?auto_16229 ) ) ( not ( = ?auto_16223 ?auto_16222 ) ) ( not ( = ?auto_16192 ?auto_16201 ) ) ( not ( = ?auto_16192 ?auto_16214 ) ) ( not ( = ?auto_16193 ?auto_16201 ) ) ( not ( = ?auto_16193 ?auto_16214 ) ) ( not ( = ?auto_16194 ?auto_16201 ) ) ( not ( = ?auto_16194 ?auto_16214 ) ) ( not ( = ?auto_16195 ?auto_16201 ) ) ( not ( = ?auto_16195 ?auto_16214 ) ) ( not ( = ?auto_16196 ?auto_16201 ) ) ( not ( = ?auto_16196 ?auto_16214 ) ) ( not ( = ?auto_16197 ?auto_16201 ) ) ( not ( = ?auto_16197 ?auto_16214 ) ) ( not ( = ?auto_16201 ?auto_16223 ) ) ( not ( = ?auto_16201 ?auto_16218 ) ) ( not ( = ?auto_16201 ?auto_16221 ) ) ( not ( = ?auto_16201 ?auto_16211 ) ) ( not ( = ?auto_16201 ?auto_16229 ) ) ( not ( = ?auto_16201 ?auto_16222 ) ) ( not ( = ?auto_16217 ?auto_16213 ) ) ( not ( = ?auto_16217 ?auto_16212 ) ) ( not ( = ?auto_16217 ?auto_16226 ) ) ( not ( = ?auto_16217 ?auto_16224 ) ) ( not ( = ?auto_16217 ?auto_16216 ) ) ( not ( = ?auto_16217 ?auto_16209 ) ) ( not ( = ?auto_16215 ?auto_16227 ) ) ( not ( = ?auto_16215 ?auto_16228 ) ) ( not ( = ?auto_16215 ?auto_16219 ) ) ( not ( = ?auto_16215 ?auto_16230 ) ) ( not ( = ?auto_16215 ?auto_16225 ) ) ( not ( = ?auto_16215 ?auto_16220 ) ) ( not ( = ?auto_16214 ?auto_16223 ) ) ( not ( = ?auto_16214 ?auto_16218 ) ) ( not ( = ?auto_16214 ?auto_16221 ) ) ( not ( = ?auto_16214 ?auto_16211 ) ) ( not ( = ?auto_16214 ?auto_16229 ) ) ( not ( = ?auto_16214 ?auto_16222 ) ) ( not ( = ?auto_16192 ?auto_16200 ) ) ( not ( = ?auto_16192 ?auto_16231 ) ) ( not ( = ?auto_16193 ?auto_16200 ) ) ( not ( = ?auto_16193 ?auto_16231 ) ) ( not ( = ?auto_16194 ?auto_16200 ) ) ( not ( = ?auto_16194 ?auto_16231 ) ) ( not ( = ?auto_16195 ?auto_16200 ) ) ( not ( = ?auto_16195 ?auto_16231 ) ) ( not ( = ?auto_16196 ?auto_16200 ) ) ( not ( = ?auto_16196 ?auto_16231 ) ) ( not ( = ?auto_16197 ?auto_16200 ) ) ( not ( = ?auto_16197 ?auto_16231 ) ) ( not ( = ?auto_16198 ?auto_16200 ) ) ( not ( = ?auto_16198 ?auto_16231 ) ) ( not ( = ?auto_16200 ?auto_16214 ) ) ( not ( = ?auto_16200 ?auto_16223 ) ) ( not ( = ?auto_16200 ?auto_16218 ) ) ( not ( = ?auto_16200 ?auto_16221 ) ) ( not ( = ?auto_16200 ?auto_16211 ) ) ( not ( = ?auto_16200 ?auto_16229 ) ) ( not ( = ?auto_16200 ?auto_16222 ) ) ( not ( = ?auto_16210 ?auto_16217 ) ) ( not ( = ?auto_16210 ?auto_16213 ) ) ( not ( = ?auto_16210 ?auto_16212 ) ) ( not ( = ?auto_16210 ?auto_16226 ) ) ( not ( = ?auto_16210 ?auto_16224 ) ) ( not ( = ?auto_16210 ?auto_16216 ) ) ( not ( = ?auto_16210 ?auto_16209 ) ) ( not ( = ?auto_16208 ?auto_16215 ) ) ( not ( = ?auto_16208 ?auto_16227 ) ) ( not ( = ?auto_16208 ?auto_16228 ) ) ( not ( = ?auto_16208 ?auto_16219 ) ) ( not ( = ?auto_16208 ?auto_16230 ) ) ( not ( = ?auto_16208 ?auto_16225 ) ) ( not ( = ?auto_16208 ?auto_16220 ) ) ( not ( = ?auto_16231 ?auto_16214 ) ) ( not ( = ?auto_16231 ?auto_16223 ) ) ( not ( = ?auto_16231 ?auto_16218 ) ) ( not ( = ?auto_16231 ?auto_16221 ) ) ( not ( = ?auto_16231 ?auto_16211 ) ) ( not ( = ?auto_16231 ?auto_16229 ) ) ( not ( = ?auto_16231 ?auto_16222 ) ) ( not ( = ?auto_16192 ?auto_16199 ) ) ( not ( = ?auto_16192 ?auto_16206 ) ) ( not ( = ?auto_16193 ?auto_16199 ) ) ( not ( = ?auto_16193 ?auto_16206 ) ) ( not ( = ?auto_16194 ?auto_16199 ) ) ( not ( = ?auto_16194 ?auto_16206 ) ) ( not ( = ?auto_16195 ?auto_16199 ) ) ( not ( = ?auto_16195 ?auto_16206 ) ) ( not ( = ?auto_16196 ?auto_16199 ) ) ( not ( = ?auto_16196 ?auto_16206 ) ) ( not ( = ?auto_16197 ?auto_16199 ) ) ( not ( = ?auto_16197 ?auto_16206 ) ) ( not ( = ?auto_16198 ?auto_16199 ) ) ( not ( = ?auto_16198 ?auto_16206 ) ) ( not ( = ?auto_16201 ?auto_16199 ) ) ( not ( = ?auto_16201 ?auto_16206 ) ) ( not ( = ?auto_16199 ?auto_16231 ) ) ( not ( = ?auto_16199 ?auto_16214 ) ) ( not ( = ?auto_16199 ?auto_16223 ) ) ( not ( = ?auto_16199 ?auto_16218 ) ) ( not ( = ?auto_16199 ?auto_16221 ) ) ( not ( = ?auto_16199 ?auto_16211 ) ) ( not ( = ?auto_16199 ?auto_16229 ) ) ( not ( = ?auto_16199 ?auto_16222 ) ) ( not ( = ?auto_16207 ?auto_16210 ) ) ( not ( = ?auto_16207 ?auto_16217 ) ) ( not ( = ?auto_16207 ?auto_16213 ) ) ( not ( = ?auto_16207 ?auto_16212 ) ) ( not ( = ?auto_16207 ?auto_16226 ) ) ( not ( = ?auto_16207 ?auto_16224 ) ) ( not ( = ?auto_16207 ?auto_16216 ) ) ( not ( = ?auto_16207 ?auto_16209 ) ) ( not ( = ?auto_16205 ?auto_16208 ) ) ( not ( = ?auto_16205 ?auto_16215 ) ) ( not ( = ?auto_16205 ?auto_16227 ) ) ( not ( = ?auto_16205 ?auto_16228 ) ) ( not ( = ?auto_16205 ?auto_16219 ) ) ( not ( = ?auto_16205 ?auto_16230 ) ) ( not ( = ?auto_16205 ?auto_16225 ) ) ( not ( = ?auto_16205 ?auto_16220 ) ) ( not ( = ?auto_16206 ?auto_16231 ) ) ( not ( = ?auto_16206 ?auto_16214 ) ) ( not ( = ?auto_16206 ?auto_16223 ) ) ( not ( = ?auto_16206 ?auto_16218 ) ) ( not ( = ?auto_16206 ?auto_16221 ) ) ( not ( = ?auto_16206 ?auto_16211 ) ) ( not ( = ?auto_16206 ?auto_16229 ) ) ( not ( = ?auto_16206 ?auto_16222 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_16192 ?auto_16193 ?auto_16194 ?auto_16195 ?auto_16196 ?auto_16197 ?auto_16198 ?auto_16201 ?auto_16200 )
      ( MAKE-1CRATE ?auto_16200 ?auto_16199 )
      ( MAKE-9CRATE-VERIFY ?auto_16192 ?auto_16193 ?auto_16194 ?auto_16195 ?auto_16196 ?auto_16197 ?auto_16198 ?auto_16201 ?auto_16200 ?auto_16199 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16234 - SURFACE
      ?auto_16235 - SURFACE
    )
    :vars
    (
      ?auto_16236 - HOIST
      ?auto_16237 - PLACE
      ?auto_16239 - PLACE
      ?auto_16240 - HOIST
      ?auto_16241 - SURFACE
      ?auto_16238 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16236 ?auto_16237 ) ( SURFACE-AT ?auto_16234 ?auto_16237 ) ( CLEAR ?auto_16234 ) ( IS-CRATE ?auto_16235 ) ( AVAILABLE ?auto_16236 ) ( not ( = ?auto_16239 ?auto_16237 ) ) ( HOIST-AT ?auto_16240 ?auto_16239 ) ( AVAILABLE ?auto_16240 ) ( SURFACE-AT ?auto_16235 ?auto_16239 ) ( ON ?auto_16235 ?auto_16241 ) ( CLEAR ?auto_16235 ) ( TRUCK-AT ?auto_16238 ?auto_16237 ) ( not ( = ?auto_16234 ?auto_16235 ) ) ( not ( = ?auto_16234 ?auto_16241 ) ) ( not ( = ?auto_16235 ?auto_16241 ) ) ( not ( = ?auto_16236 ?auto_16240 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16238 ?auto_16237 ?auto_16239 )
      ( !LIFT ?auto_16240 ?auto_16235 ?auto_16241 ?auto_16239 )
      ( !LOAD ?auto_16240 ?auto_16235 ?auto_16238 ?auto_16239 )
      ( !DRIVE ?auto_16238 ?auto_16239 ?auto_16237 )
      ( !UNLOAD ?auto_16236 ?auto_16235 ?auto_16238 ?auto_16237 )
      ( !DROP ?auto_16236 ?auto_16235 ?auto_16234 ?auto_16237 )
      ( MAKE-1CRATE-VERIFY ?auto_16234 ?auto_16235 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_16253 - SURFACE
      ?auto_16254 - SURFACE
      ?auto_16255 - SURFACE
      ?auto_16256 - SURFACE
      ?auto_16257 - SURFACE
      ?auto_16258 - SURFACE
      ?auto_16259 - SURFACE
      ?auto_16262 - SURFACE
      ?auto_16261 - SURFACE
      ?auto_16260 - SURFACE
      ?auto_16263 - SURFACE
    )
    :vars
    (
      ?auto_16267 - HOIST
      ?auto_16269 - PLACE
      ?auto_16264 - PLACE
      ?auto_16268 - HOIST
      ?auto_16265 - SURFACE
      ?auto_16273 - SURFACE
      ?auto_16280 - PLACE
      ?auto_16281 - HOIST
      ?auto_16271 - SURFACE
      ?auto_16285 - PLACE
      ?auto_16291 - HOIST
      ?auto_16292 - SURFACE
      ?auto_16293 - PLACE
      ?auto_16279 - HOIST
      ?auto_16284 - SURFACE
      ?auto_16294 - PLACE
      ?auto_16274 - HOIST
      ?auto_16287 - SURFACE
      ?auto_16272 - PLACE
      ?auto_16286 - HOIST
      ?auto_16290 - SURFACE
      ?auto_16288 - PLACE
      ?auto_16275 - HOIST
      ?auto_16282 - SURFACE
      ?auto_16276 - PLACE
      ?auto_16283 - HOIST
      ?auto_16278 - SURFACE
      ?auto_16277 - PLACE
      ?auto_16289 - HOIST
      ?auto_16270 - SURFACE
      ?auto_16266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16267 ?auto_16269 ) ( IS-CRATE ?auto_16263 ) ( not ( = ?auto_16264 ?auto_16269 ) ) ( HOIST-AT ?auto_16268 ?auto_16264 ) ( SURFACE-AT ?auto_16263 ?auto_16264 ) ( ON ?auto_16263 ?auto_16265 ) ( CLEAR ?auto_16263 ) ( not ( = ?auto_16260 ?auto_16263 ) ) ( not ( = ?auto_16260 ?auto_16265 ) ) ( not ( = ?auto_16263 ?auto_16265 ) ) ( not ( = ?auto_16267 ?auto_16268 ) ) ( IS-CRATE ?auto_16260 ) ( AVAILABLE ?auto_16268 ) ( SURFACE-AT ?auto_16260 ?auto_16264 ) ( ON ?auto_16260 ?auto_16273 ) ( CLEAR ?auto_16260 ) ( not ( = ?auto_16261 ?auto_16260 ) ) ( not ( = ?auto_16261 ?auto_16273 ) ) ( not ( = ?auto_16260 ?auto_16273 ) ) ( IS-CRATE ?auto_16261 ) ( not ( = ?auto_16280 ?auto_16269 ) ) ( HOIST-AT ?auto_16281 ?auto_16280 ) ( AVAILABLE ?auto_16281 ) ( SURFACE-AT ?auto_16261 ?auto_16280 ) ( ON ?auto_16261 ?auto_16271 ) ( CLEAR ?auto_16261 ) ( not ( = ?auto_16262 ?auto_16261 ) ) ( not ( = ?auto_16262 ?auto_16271 ) ) ( not ( = ?auto_16261 ?auto_16271 ) ) ( not ( = ?auto_16267 ?auto_16281 ) ) ( IS-CRATE ?auto_16262 ) ( not ( = ?auto_16285 ?auto_16269 ) ) ( HOIST-AT ?auto_16291 ?auto_16285 ) ( AVAILABLE ?auto_16291 ) ( SURFACE-AT ?auto_16262 ?auto_16285 ) ( ON ?auto_16262 ?auto_16292 ) ( CLEAR ?auto_16262 ) ( not ( = ?auto_16259 ?auto_16262 ) ) ( not ( = ?auto_16259 ?auto_16292 ) ) ( not ( = ?auto_16262 ?auto_16292 ) ) ( not ( = ?auto_16267 ?auto_16291 ) ) ( IS-CRATE ?auto_16259 ) ( not ( = ?auto_16293 ?auto_16269 ) ) ( HOIST-AT ?auto_16279 ?auto_16293 ) ( AVAILABLE ?auto_16279 ) ( SURFACE-AT ?auto_16259 ?auto_16293 ) ( ON ?auto_16259 ?auto_16284 ) ( CLEAR ?auto_16259 ) ( not ( = ?auto_16258 ?auto_16259 ) ) ( not ( = ?auto_16258 ?auto_16284 ) ) ( not ( = ?auto_16259 ?auto_16284 ) ) ( not ( = ?auto_16267 ?auto_16279 ) ) ( IS-CRATE ?auto_16258 ) ( not ( = ?auto_16294 ?auto_16269 ) ) ( HOIST-AT ?auto_16274 ?auto_16294 ) ( AVAILABLE ?auto_16274 ) ( SURFACE-AT ?auto_16258 ?auto_16294 ) ( ON ?auto_16258 ?auto_16287 ) ( CLEAR ?auto_16258 ) ( not ( = ?auto_16257 ?auto_16258 ) ) ( not ( = ?auto_16257 ?auto_16287 ) ) ( not ( = ?auto_16258 ?auto_16287 ) ) ( not ( = ?auto_16267 ?auto_16274 ) ) ( IS-CRATE ?auto_16257 ) ( not ( = ?auto_16272 ?auto_16269 ) ) ( HOIST-AT ?auto_16286 ?auto_16272 ) ( AVAILABLE ?auto_16286 ) ( SURFACE-AT ?auto_16257 ?auto_16272 ) ( ON ?auto_16257 ?auto_16290 ) ( CLEAR ?auto_16257 ) ( not ( = ?auto_16256 ?auto_16257 ) ) ( not ( = ?auto_16256 ?auto_16290 ) ) ( not ( = ?auto_16257 ?auto_16290 ) ) ( not ( = ?auto_16267 ?auto_16286 ) ) ( IS-CRATE ?auto_16256 ) ( not ( = ?auto_16288 ?auto_16269 ) ) ( HOIST-AT ?auto_16275 ?auto_16288 ) ( AVAILABLE ?auto_16275 ) ( SURFACE-AT ?auto_16256 ?auto_16288 ) ( ON ?auto_16256 ?auto_16282 ) ( CLEAR ?auto_16256 ) ( not ( = ?auto_16255 ?auto_16256 ) ) ( not ( = ?auto_16255 ?auto_16282 ) ) ( not ( = ?auto_16256 ?auto_16282 ) ) ( not ( = ?auto_16267 ?auto_16275 ) ) ( IS-CRATE ?auto_16255 ) ( not ( = ?auto_16276 ?auto_16269 ) ) ( HOIST-AT ?auto_16283 ?auto_16276 ) ( AVAILABLE ?auto_16283 ) ( SURFACE-AT ?auto_16255 ?auto_16276 ) ( ON ?auto_16255 ?auto_16278 ) ( CLEAR ?auto_16255 ) ( not ( = ?auto_16254 ?auto_16255 ) ) ( not ( = ?auto_16254 ?auto_16278 ) ) ( not ( = ?auto_16255 ?auto_16278 ) ) ( not ( = ?auto_16267 ?auto_16283 ) ) ( SURFACE-AT ?auto_16253 ?auto_16269 ) ( CLEAR ?auto_16253 ) ( IS-CRATE ?auto_16254 ) ( AVAILABLE ?auto_16267 ) ( not ( = ?auto_16277 ?auto_16269 ) ) ( HOIST-AT ?auto_16289 ?auto_16277 ) ( AVAILABLE ?auto_16289 ) ( SURFACE-AT ?auto_16254 ?auto_16277 ) ( ON ?auto_16254 ?auto_16270 ) ( CLEAR ?auto_16254 ) ( TRUCK-AT ?auto_16266 ?auto_16269 ) ( not ( = ?auto_16253 ?auto_16254 ) ) ( not ( = ?auto_16253 ?auto_16270 ) ) ( not ( = ?auto_16254 ?auto_16270 ) ) ( not ( = ?auto_16267 ?auto_16289 ) ) ( not ( = ?auto_16253 ?auto_16255 ) ) ( not ( = ?auto_16253 ?auto_16278 ) ) ( not ( = ?auto_16255 ?auto_16270 ) ) ( not ( = ?auto_16276 ?auto_16277 ) ) ( not ( = ?auto_16283 ?auto_16289 ) ) ( not ( = ?auto_16278 ?auto_16270 ) ) ( not ( = ?auto_16253 ?auto_16256 ) ) ( not ( = ?auto_16253 ?auto_16282 ) ) ( not ( = ?auto_16254 ?auto_16256 ) ) ( not ( = ?auto_16254 ?auto_16282 ) ) ( not ( = ?auto_16256 ?auto_16278 ) ) ( not ( = ?auto_16256 ?auto_16270 ) ) ( not ( = ?auto_16288 ?auto_16276 ) ) ( not ( = ?auto_16288 ?auto_16277 ) ) ( not ( = ?auto_16275 ?auto_16283 ) ) ( not ( = ?auto_16275 ?auto_16289 ) ) ( not ( = ?auto_16282 ?auto_16278 ) ) ( not ( = ?auto_16282 ?auto_16270 ) ) ( not ( = ?auto_16253 ?auto_16257 ) ) ( not ( = ?auto_16253 ?auto_16290 ) ) ( not ( = ?auto_16254 ?auto_16257 ) ) ( not ( = ?auto_16254 ?auto_16290 ) ) ( not ( = ?auto_16255 ?auto_16257 ) ) ( not ( = ?auto_16255 ?auto_16290 ) ) ( not ( = ?auto_16257 ?auto_16282 ) ) ( not ( = ?auto_16257 ?auto_16278 ) ) ( not ( = ?auto_16257 ?auto_16270 ) ) ( not ( = ?auto_16272 ?auto_16288 ) ) ( not ( = ?auto_16272 ?auto_16276 ) ) ( not ( = ?auto_16272 ?auto_16277 ) ) ( not ( = ?auto_16286 ?auto_16275 ) ) ( not ( = ?auto_16286 ?auto_16283 ) ) ( not ( = ?auto_16286 ?auto_16289 ) ) ( not ( = ?auto_16290 ?auto_16282 ) ) ( not ( = ?auto_16290 ?auto_16278 ) ) ( not ( = ?auto_16290 ?auto_16270 ) ) ( not ( = ?auto_16253 ?auto_16258 ) ) ( not ( = ?auto_16253 ?auto_16287 ) ) ( not ( = ?auto_16254 ?auto_16258 ) ) ( not ( = ?auto_16254 ?auto_16287 ) ) ( not ( = ?auto_16255 ?auto_16258 ) ) ( not ( = ?auto_16255 ?auto_16287 ) ) ( not ( = ?auto_16256 ?auto_16258 ) ) ( not ( = ?auto_16256 ?auto_16287 ) ) ( not ( = ?auto_16258 ?auto_16290 ) ) ( not ( = ?auto_16258 ?auto_16282 ) ) ( not ( = ?auto_16258 ?auto_16278 ) ) ( not ( = ?auto_16258 ?auto_16270 ) ) ( not ( = ?auto_16294 ?auto_16272 ) ) ( not ( = ?auto_16294 ?auto_16288 ) ) ( not ( = ?auto_16294 ?auto_16276 ) ) ( not ( = ?auto_16294 ?auto_16277 ) ) ( not ( = ?auto_16274 ?auto_16286 ) ) ( not ( = ?auto_16274 ?auto_16275 ) ) ( not ( = ?auto_16274 ?auto_16283 ) ) ( not ( = ?auto_16274 ?auto_16289 ) ) ( not ( = ?auto_16287 ?auto_16290 ) ) ( not ( = ?auto_16287 ?auto_16282 ) ) ( not ( = ?auto_16287 ?auto_16278 ) ) ( not ( = ?auto_16287 ?auto_16270 ) ) ( not ( = ?auto_16253 ?auto_16259 ) ) ( not ( = ?auto_16253 ?auto_16284 ) ) ( not ( = ?auto_16254 ?auto_16259 ) ) ( not ( = ?auto_16254 ?auto_16284 ) ) ( not ( = ?auto_16255 ?auto_16259 ) ) ( not ( = ?auto_16255 ?auto_16284 ) ) ( not ( = ?auto_16256 ?auto_16259 ) ) ( not ( = ?auto_16256 ?auto_16284 ) ) ( not ( = ?auto_16257 ?auto_16259 ) ) ( not ( = ?auto_16257 ?auto_16284 ) ) ( not ( = ?auto_16259 ?auto_16287 ) ) ( not ( = ?auto_16259 ?auto_16290 ) ) ( not ( = ?auto_16259 ?auto_16282 ) ) ( not ( = ?auto_16259 ?auto_16278 ) ) ( not ( = ?auto_16259 ?auto_16270 ) ) ( not ( = ?auto_16293 ?auto_16294 ) ) ( not ( = ?auto_16293 ?auto_16272 ) ) ( not ( = ?auto_16293 ?auto_16288 ) ) ( not ( = ?auto_16293 ?auto_16276 ) ) ( not ( = ?auto_16293 ?auto_16277 ) ) ( not ( = ?auto_16279 ?auto_16274 ) ) ( not ( = ?auto_16279 ?auto_16286 ) ) ( not ( = ?auto_16279 ?auto_16275 ) ) ( not ( = ?auto_16279 ?auto_16283 ) ) ( not ( = ?auto_16279 ?auto_16289 ) ) ( not ( = ?auto_16284 ?auto_16287 ) ) ( not ( = ?auto_16284 ?auto_16290 ) ) ( not ( = ?auto_16284 ?auto_16282 ) ) ( not ( = ?auto_16284 ?auto_16278 ) ) ( not ( = ?auto_16284 ?auto_16270 ) ) ( not ( = ?auto_16253 ?auto_16262 ) ) ( not ( = ?auto_16253 ?auto_16292 ) ) ( not ( = ?auto_16254 ?auto_16262 ) ) ( not ( = ?auto_16254 ?auto_16292 ) ) ( not ( = ?auto_16255 ?auto_16262 ) ) ( not ( = ?auto_16255 ?auto_16292 ) ) ( not ( = ?auto_16256 ?auto_16262 ) ) ( not ( = ?auto_16256 ?auto_16292 ) ) ( not ( = ?auto_16257 ?auto_16262 ) ) ( not ( = ?auto_16257 ?auto_16292 ) ) ( not ( = ?auto_16258 ?auto_16262 ) ) ( not ( = ?auto_16258 ?auto_16292 ) ) ( not ( = ?auto_16262 ?auto_16284 ) ) ( not ( = ?auto_16262 ?auto_16287 ) ) ( not ( = ?auto_16262 ?auto_16290 ) ) ( not ( = ?auto_16262 ?auto_16282 ) ) ( not ( = ?auto_16262 ?auto_16278 ) ) ( not ( = ?auto_16262 ?auto_16270 ) ) ( not ( = ?auto_16285 ?auto_16293 ) ) ( not ( = ?auto_16285 ?auto_16294 ) ) ( not ( = ?auto_16285 ?auto_16272 ) ) ( not ( = ?auto_16285 ?auto_16288 ) ) ( not ( = ?auto_16285 ?auto_16276 ) ) ( not ( = ?auto_16285 ?auto_16277 ) ) ( not ( = ?auto_16291 ?auto_16279 ) ) ( not ( = ?auto_16291 ?auto_16274 ) ) ( not ( = ?auto_16291 ?auto_16286 ) ) ( not ( = ?auto_16291 ?auto_16275 ) ) ( not ( = ?auto_16291 ?auto_16283 ) ) ( not ( = ?auto_16291 ?auto_16289 ) ) ( not ( = ?auto_16292 ?auto_16284 ) ) ( not ( = ?auto_16292 ?auto_16287 ) ) ( not ( = ?auto_16292 ?auto_16290 ) ) ( not ( = ?auto_16292 ?auto_16282 ) ) ( not ( = ?auto_16292 ?auto_16278 ) ) ( not ( = ?auto_16292 ?auto_16270 ) ) ( not ( = ?auto_16253 ?auto_16261 ) ) ( not ( = ?auto_16253 ?auto_16271 ) ) ( not ( = ?auto_16254 ?auto_16261 ) ) ( not ( = ?auto_16254 ?auto_16271 ) ) ( not ( = ?auto_16255 ?auto_16261 ) ) ( not ( = ?auto_16255 ?auto_16271 ) ) ( not ( = ?auto_16256 ?auto_16261 ) ) ( not ( = ?auto_16256 ?auto_16271 ) ) ( not ( = ?auto_16257 ?auto_16261 ) ) ( not ( = ?auto_16257 ?auto_16271 ) ) ( not ( = ?auto_16258 ?auto_16261 ) ) ( not ( = ?auto_16258 ?auto_16271 ) ) ( not ( = ?auto_16259 ?auto_16261 ) ) ( not ( = ?auto_16259 ?auto_16271 ) ) ( not ( = ?auto_16261 ?auto_16292 ) ) ( not ( = ?auto_16261 ?auto_16284 ) ) ( not ( = ?auto_16261 ?auto_16287 ) ) ( not ( = ?auto_16261 ?auto_16290 ) ) ( not ( = ?auto_16261 ?auto_16282 ) ) ( not ( = ?auto_16261 ?auto_16278 ) ) ( not ( = ?auto_16261 ?auto_16270 ) ) ( not ( = ?auto_16280 ?auto_16285 ) ) ( not ( = ?auto_16280 ?auto_16293 ) ) ( not ( = ?auto_16280 ?auto_16294 ) ) ( not ( = ?auto_16280 ?auto_16272 ) ) ( not ( = ?auto_16280 ?auto_16288 ) ) ( not ( = ?auto_16280 ?auto_16276 ) ) ( not ( = ?auto_16280 ?auto_16277 ) ) ( not ( = ?auto_16281 ?auto_16291 ) ) ( not ( = ?auto_16281 ?auto_16279 ) ) ( not ( = ?auto_16281 ?auto_16274 ) ) ( not ( = ?auto_16281 ?auto_16286 ) ) ( not ( = ?auto_16281 ?auto_16275 ) ) ( not ( = ?auto_16281 ?auto_16283 ) ) ( not ( = ?auto_16281 ?auto_16289 ) ) ( not ( = ?auto_16271 ?auto_16292 ) ) ( not ( = ?auto_16271 ?auto_16284 ) ) ( not ( = ?auto_16271 ?auto_16287 ) ) ( not ( = ?auto_16271 ?auto_16290 ) ) ( not ( = ?auto_16271 ?auto_16282 ) ) ( not ( = ?auto_16271 ?auto_16278 ) ) ( not ( = ?auto_16271 ?auto_16270 ) ) ( not ( = ?auto_16253 ?auto_16260 ) ) ( not ( = ?auto_16253 ?auto_16273 ) ) ( not ( = ?auto_16254 ?auto_16260 ) ) ( not ( = ?auto_16254 ?auto_16273 ) ) ( not ( = ?auto_16255 ?auto_16260 ) ) ( not ( = ?auto_16255 ?auto_16273 ) ) ( not ( = ?auto_16256 ?auto_16260 ) ) ( not ( = ?auto_16256 ?auto_16273 ) ) ( not ( = ?auto_16257 ?auto_16260 ) ) ( not ( = ?auto_16257 ?auto_16273 ) ) ( not ( = ?auto_16258 ?auto_16260 ) ) ( not ( = ?auto_16258 ?auto_16273 ) ) ( not ( = ?auto_16259 ?auto_16260 ) ) ( not ( = ?auto_16259 ?auto_16273 ) ) ( not ( = ?auto_16262 ?auto_16260 ) ) ( not ( = ?auto_16262 ?auto_16273 ) ) ( not ( = ?auto_16260 ?auto_16271 ) ) ( not ( = ?auto_16260 ?auto_16292 ) ) ( not ( = ?auto_16260 ?auto_16284 ) ) ( not ( = ?auto_16260 ?auto_16287 ) ) ( not ( = ?auto_16260 ?auto_16290 ) ) ( not ( = ?auto_16260 ?auto_16282 ) ) ( not ( = ?auto_16260 ?auto_16278 ) ) ( not ( = ?auto_16260 ?auto_16270 ) ) ( not ( = ?auto_16264 ?auto_16280 ) ) ( not ( = ?auto_16264 ?auto_16285 ) ) ( not ( = ?auto_16264 ?auto_16293 ) ) ( not ( = ?auto_16264 ?auto_16294 ) ) ( not ( = ?auto_16264 ?auto_16272 ) ) ( not ( = ?auto_16264 ?auto_16288 ) ) ( not ( = ?auto_16264 ?auto_16276 ) ) ( not ( = ?auto_16264 ?auto_16277 ) ) ( not ( = ?auto_16268 ?auto_16281 ) ) ( not ( = ?auto_16268 ?auto_16291 ) ) ( not ( = ?auto_16268 ?auto_16279 ) ) ( not ( = ?auto_16268 ?auto_16274 ) ) ( not ( = ?auto_16268 ?auto_16286 ) ) ( not ( = ?auto_16268 ?auto_16275 ) ) ( not ( = ?auto_16268 ?auto_16283 ) ) ( not ( = ?auto_16268 ?auto_16289 ) ) ( not ( = ?auto_16273 ?auto_16271 ) ) ( not ( = ?auto_16273 ?auto_16292 ) ) ( not ( = ?auto_16273 ?auto_16284 ) ) ( not ( = ?auto_16273 ?auto_16287 ) ) ( not ( = ?auto_16273 ?auto_16290 ) ) ( not ( = ?auto_16273 ?auto_16282 ) ) ( not ( = ?auto_16273 ?auto_16278 ) ) ( not ( = ?auto_16273 ?auto_16270 ) ) ( not ( = ?auto_16253 ?auto_16263 ) ) ( not ( = ?auto_16253 ?auto_16265 ) ) ( not ( = ?auto_16254 ?auto_16263 ) ) ( not ( = ?auto_16254 ?auto_16265 ) ) ( not ( = ?auto_16255 ?auto_16263 ) ) ( not ( = ?auto_16255 ?auto_16265 ) ) ( not ( = ?auto_16256 ?auto_16263 ) ) ( not ( = ?auto_16256 ?auto_16265 ) ) ( not ( = ?auto_16257 ?auto_16263 ) ) ( not ( = ?auto_16257 ?auto_16265 ) ) ( not ( = ?auto_16258 ?auto_16263 ) ) ( not ( = ?auto_16258 ?auto_16265 ) ) ( not ( = ?auto_16259 ?auto_16263 ) ) ( not ( = ?auto_16259 ?auto_16265 ) ) ( not ( = ?auto_16262 ?auto_16263 ) ) ( not ( = ?auto_16262 ?auto_16265 ) ) ( not ( = ?auto_16261 ?auto_16263 ) ) ( not ( = ?auto_16261 ?auto_16265 ) ) ( not ( = ?auto_16263 ?auto_16273 ) ) ( not ( = ?auto_16263 ?auto_16271 ) ) ( not ( = ?auto_16263 ?auto_16292 ) ) ( not ( = ?auto_16263 ?auto_16284 ) ) ( not ( = ?auto_16263 ?auto_16287 ) ) ( not ( = ?auto_16263 ?auto_16290 ) ) ( not ( = ?auto_16263 ?auto_16282 ) ) ( not ( = ?auto_16263 ?auto_16278 ) ) ( not ( = ?auto_16263 ?auto_16270 ) ) ( not ( = ?auto_16265 ?auto_16273 ) ) ( not ( = ?auto_16265 ?auto_16271 ) ) ( not ( = ?auto_16265 ?auto_16292 ) ) ( not ( = ?auto_16265 ?auto_16284 ) ) ( not ( = ?auto_16265 ?auto_16287 ) ) ( not ( = ?auto_16265 ?auto_16290 ) ) ( not ( = ?auto_16265 ?auto_16282 ) ) ( not ( = ?auto_16265 ?auto_16278 ) ) ( not ( = ?auto_16265 ?auto_16270 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_16253 ?auto_16254 ?auto_16255 ?auto_16256 ?auto_16257 ?auto_16258 ?auto_16259 ?auto_16262 ?auto_16261 ?auto_16260 )
      ( MAKE-1CRATE ?auto_16260 ?auto_16263 )
      ( MAKE-10CRATE-VERIFY ?auto_16253 ?auto_16254 ?auto_16255 ?auto_16256 ?auto_16257 ?auto_16258 ?auto_16259 ?auto_16262 ?auto_16261 ?auto_16260 ?auto_16263 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16297 - SURFACE
      ?auto_16298 - SURFACE
    )
    :vars
    (
      ?auto_16299 - HOIST
      ?auto_16300 - PLACE
      ?auto_16302 - PLACE
      ?auto_16303 - HOIST
      ?auto_16304 - SURFACE
      ?auto_16301 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16299 ?auto_16300 ) ( SURFACE-AT ?auto_16297 ?auto_16300 ) ( CLEAR ?auto_16297 ) ( IS-CRATE ?auto_16298 ) ( AVAILABLE ?auto_16299 ) ( not ( = ?auto_16302 ?auto_16300 ) ) ( HOIST-AT ?auto_16303 ?auto_16302 ) ( AVAILABLE ?auto_16303 ) ( SURFACE-AT ?auto_16298 ?auto_16302 ) ( ON ?auto_16298 ?auto_16304 ) ( CLEAR ?auto_16298 ) ( TRUCK-AT ?auto_16301 ?auto_16300 ) ( not ( = ?auto_16297 ?auto_16298 ) ) ( not ( = ?auto_16297 ?auto_16304 ) ) ( not ( = ?auto_16298 ?auto_16304 ) ) ( not ( = ?auto_16299 ?auto_16303 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16301 ?auto_16300 ?auto_16302 )
      ( !LIFT ?auto_16303 ?auto_16298 ?auto_16304 ?auto_16302 )
      ( !LOAD ?auto_16303 ?auto_16298 ?auto_16301 ?auto_16302 )
      ( !DRIVE ?auto_16301 ?auto_16302 ?auto_16300 )
      ( !UNLOAD ?auto_16299 ?auto_16298 ?auto_16301 ?auto_16300 )
      ( !DROP ?auto_16299 ?auto_16298 ?auto_16297 ?auto_16300 )
      ( MAKE-1CRATE-VERIFY ?auto_16297 ?auto_16298 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_16317 - SURFACE
      ?auto_16318 - SURFACE
      ?auto_16319 - SURFACE
      ?auto_16320 - SURFACE
      ?auto_16321 - SURFACE
      ?auto_16322 - SURFACE
      ?auto_16323 - SURFACE
      ?auto_16326 - SURFACE
      ?auto_16325 - SURFACE
      ?auto_16324 - SURFACE
      ?auto_16327 - SURFACE
      ?auto_16328 - SURFACE
    )
    :vars
    (
      ?auto_16330 - HOIST
      ?auto_16331 - PLACE
      ?auto_16334 - PLACE
      ?auto_16333 - HOIST
      ?auto_16329 - SURFACE
      ?auto_16339 - PLACE
      ?auto_16361 - HOIST
      ?auto_16352 - SURFACE
      ?auto_16343 - SURFACE
      ?auto_16355 - PLACE
      ?auto_16344 - HOIST
      ?auto_16340 - SURFACE
      ?auto_16360 - PLACE
      ?auto_16338 - HOIST
      ?auto_16335 - SURFACE
      ?auto_16348 - PLACE
      ?auto_16358 - HOIST
      ?auto_16349 - SURFACE
      ?auto_16359 - PLACE
      ?auto_16351 - HOIST
      ?auto_16350 - SURFACE
      ?auto_16346 - PLACE
      ?auto_16345 - HOIST
      ?auto_16362 - SURFACE
      ?auto_16347 - PLACE
      ?auto_16354 - HOIST
      ?auto_16356 - SURFACE
      ?auto_16341 - PLACE
      ?auto_16357 - HOIST
      ?auto_16353 - SURFACE
      ?auto_16336 - PLACE
      ?auto_16337 - HOIST
      ?auto_16342 - SURFACE
      ?auto_16332 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16330 ?auto_16331 ) ( IS-CRATE ?auto_16328 ) ( not ( = ?auto_16334 ?auto_16331 ) ) ( HOIST-AT ?auto_16333 ?auto_16334 ) ( AVAILABLE ?auto_16333 ) ( SURFACE-AT ?auto_16328 ?auto_16334 ) ( ON ?auto_16328 ?auto_16329 ) ( CLEAR ?auto_16328 ) ( not ( = ?auto_16327 ?auto_16328 ) ) ( not ( = ?auto_16327 ?auto_16329 ) ) ( not ( = ?auto_16328 ?auto_16329 ) ) ( not ( = ?auto_16330 ?auto_16333 ) ) ( IS-CRATE ?auto_16327 ) ( not ( = ?auto_16339 ?auto_16331 ) ) ( HOIST-AT ?auto_16361 ?auto_16339 ) ( SURFACE-AT ?auto_16327 ?auto_16339 ) ( ON ?auto_16327 ?auto_16352 ) ( CLEAR ?auto_16327 ) ( not ( = ?auto_16324 ?auto_16327 ) ) ( not ( = ?auto_16324 ?auto_16352 ) ) ( not ( = ?auto_16327 ?auto_16352 ) ) ( not ( = ?auto_16330 ?auto_16361 ) ) ( IS-CRATE ?auto_16324 ) ( AVAILABLE ?auto_16361 ) ( SURFACE-AT ?auto_16324 ?auto_16339 ) ( ON ?auto_16324 ?auto_16343 ) ( CLEAR ?auto_16324 ) ( not ( = ?auto_16325 ?auto_16324 ) ) ( not ( = ?auto_16325 ?auto_16343 ) ) ( not ( = ?auto_16324 ?auto_16343 ) ) ( IS-CRATE ?auto_16325 ) ( not ( = ?auto_16355 ?auto_16331 ) ) ( HOIST-AT ?auto_16344 ?auto_16355 ) ( AVAILABLE ?auto_16344 ) ( SURFACE-AT ?auto_16325 ?auto_16355 ) ( ON ?auto_16325 ?auto_16340 ) ( CLEAR ?auto_16325 ) ( not ( = ?auto_16326 ?auto_16325 ) ) ( not ( = ?auto_16326 ?auto_16340 ) ) ( not ( = ?auto_16325 ?auto_16340 ) ) ( not ( = ?auto_16330 ?auto_16344 ) ) ( IS-CRATE ?auto_16326 ) ( not ( = ?auto_16360 ?auto_16331 ) ) ( HOIST-AT ?auto_16338 ?auto_16360 ) ( AVAILABLE ?auto_16338 ) ( SURFACE-AT ?auto_16326 ?auto_16360 ) ( ON ?auto_16326 ?auto_16335 ) ( CLEAR ?auto_16326 ) ( not ( = ?auto_16323 ?auto_16326 ) ) ( not ( = ?auto_16323 ?auto_16335 ) ) ( not ( = ?auto_16326 ?auto_16335 ) ) ( not ( = ?auto_16330 ?auto_16338 ) ) ( IS-CRATE ?auto_16323 ) ( not ( = ?auto_16348 ?auto_16331 ) ) ( HOIST-AT ?auto_16358 ?auto_16348 ) ( AVAILABLE ?auto_16358 ) ( SURFACE-AT ?auto_16323 ?auto_16348 ) ( ON ?auto_16323 ?auto_16349 ) ( CLEAR ?auto_16323 ) ( not ( = ?auto_16322 ?auto_16323 ) ) ( not ( = ?auto_16322 ?auto_16349 ) ) ( not ( = ?auto_16323 ?auto_16349 ) ) ( not ( = ?auto_16330 ?auto_16358 ) ) ( IS-CRATE ?auto_16322 ) ( not ( = ?auto_16359 ?auto_16331 ) ) ( HOIST-AT ?auto_16351 ?auto_16359 ) ( AVAILABLE ?auto_16351 ) ( SURFACE-AT ?auto_16322 ?auto_16359 ) ( ON ?auto_16322 ?auto_16350 ) ( CLEAR ?auto_16322 ) ( not ( = ?auto_16321 ?auto_16322 ) ) ( not ( = ?auto_16321 ?auto_16350 ) ) ( not ( = ?auto_16322 ?auto_16350 ) ) ( not ( = ?auto_16330 ?auto_16351 ) ) ( IS-CRATE ?auto_16321 ) ( not ( = ?auto_16346 ?auto_16331 ) ) ( HOIST-AT ?auto_16345 ?auto_16346 ) ( AVAILABLE ?auto_16345 ) ( SURFACE-AT ?auto_16321 ?auto_16346 ) ( ON ?auto_16321 ?auto_16362 ) ( CLEAR ?auto_16321 ) ( not ( = ?auto_16320 ?auto_16321 ) ) ( not ( = ?auto_16320 ?auto_16362 ) ) ( not ( = ?auto_16321 ?auto_16362 ) ) ( not ( = ?auto_16330 ?auto_16345 ) ) ( IS-CRATE ?auto_16320 ) ( not ( = ?auto_16347 ?auto_16331 ) ) ( HOIST-AT ?auto_16354 ?auto_16347 ) ( AVAILABLE ?auto_16354 ) ( SURFACE-AT ?auto_16320 ?auto_16347 ) ( ON ?auto_16320 ?auto_16356 ) ( CLEAR ?auto_16320 ) ( not ( = ?auto_16319 ?auto_16320 ) ) ( not ( = ?auto_16319 ?auto_16356 ) ) ( not ( = ?auto_16320 ?auto_16356 ) ) ( not ( = ?auto_16330 ?auto_16354 ) ) ( IS-CRATE ?auto_16319 ) ( not ( = ?auto_16341 ?auto_16331 ) ) ( HOIST-AT ?auto_16357 ?auto_16341 ) ( AVAILABLE ?auto_16357 ) ( SURFACE-AT ?auto_16319 ?auto_16341 ) ( ON ?auto_16319 ?auto_16353 ) ( CLEAR ?auto_16319 ) ( not ( = ?auto_16318 ?auto_16319 ) ) ( not ( = ?auto_16318 ?auto_16353 ) ) ( not ( = ?auto_16319 ?auto_16353 ) ) ( not ( = ?auto_16330 ?auto_16357 ) ) ( SURFACE-AT ?auto_16317 ?auto_16331 ) ( CLEAR ?auto_16317 ) ( IS-CRATE ?auto_16318 ) ( AVAILABLE ?auto_16330 ) ( not ( = ?auto_16336 ?auto_16331 ) ) ( HOIST-AT ?auto_16337 ?auto_16336 ) ( AVAILABLE ?auto_16337 ) ( SURFACE-AT ?auto_16318 ?auto_16336 ) ( ON ?auto_16318 ?auto_16342 ) ( CLEAR ?auto_16318 ) ( TRUCK-AT ?auto_16332 ?auto_16331 ) ( not ( = ?auto_16317 ?auto_16318 ) ) ( not ( = ?auto_16317 ?auto_16342 ) ) ( not ( = ?auto_16318 ?auto_16342 ) ) ( not ( = ?auto_16330 ?auto_16337 ) ) ( not ( = ?auto_16317 ?auto_16319 ) ) ( not ( = ?auto_16317 ?auto_16353 ) ) ( not ( = ?auto_16319 ?auto_16342 ) ) ( not ( = ?auto_16341 ?auto_16336 ) ) ( not ( = ?auto_16357 ?auto_16337 ) ) ( not ( = ?auto_16353 ?auto_16342 ) ) ( not ( = ?auto_16317 ?auto_16320 ) ) ( not ( = ?auto_16317 ?auto_16356 ) ) ( not ( = ?auto_16318 ?auto_16320 ) ) ( not ( = ?auto_16318 ?auto_16356 ) ) ( not ( = ?auto_16320 ?auto_16353 ) ) ( not ( = ?auto_16320 ?auto_16342 ) ) ( not ( = ?auto_16347 ?auto_16341 ) ) ( not ( = ?auto_16347 ?auto_16336 ) ) ( not ( = ?auto_16354 ?auto_16357 ) ) ( not ( = ?auto_16354 ?auto_16337 ) ) ( not ( = ?auto_16356 ?auto_16353 ) ) ( not ( = ?auto_16356 ?auto_16342 ) ) ( not ( = ?auto_16317 ?auto_16321 ) ) ( not ( = ?auto_16317 ?auto_16362 ) ) ( not ( = ?auto_16318 ?auto_16321 ) ) ( not ( = ?auto_16318 ?auto_16362 ) ) ( not ( = ?auto_16319 ?auto_16321 ) ) ( not ( = ?auto_16319 ?auto_16362 ) ) ( not ( = ?auto_16321 ?auto_16356 ) ) ( not ( = ?auto_16321 ?auto_16353 ) ) ( not ( = ?auto_16321 ?auto_16342 ) ) ( not ( = ?auto_16346 ?auto_16347 ) ) ( not ( = ?auto_16346 ?auto_16341 ) ) ( not ( = ?auto_16346 ?auto_16336 ) ) ( not ( = ?auto_16345 ?auto_16354 ) ) ( not ( = ?auto_16345 ?auto_16357 ) ) ( not ( = ?auto_16345 ?auto_16337 ) ) ( not ( = ?auto_16362 ?auto_16356 ) ) ( not ( = ?auto_16362 ?auto_16353 ) ) ( not ( = ?auto_16362 ?auto_16342 ) ) ( not ( = ?auto_16317 ?auto_16322 ) ) ( not ( = ?auto_16317 ?auto_16350 ) ) ( not ( = ?auto_16318 ?auto_16322 ) ) ( not ( = ?auto_16318 ?auto_16350 ) ) ( not ( = ?auto_16319 ?auto_16322 ) ) ( not ( = ?auto_16319 ?auto_16350 ) ) ( not ( = ?auto_16320 ?auto_16322 ) ) ( not ( = ?auto_16320 ?auto_16350 ) ) ( not ( = ?auto_16322 ?auto_16362 ) ) ( not ( = ?auto_16322 ?auto_16356 ) ) ( not ( = ?auto_16322 ?auto_16353 ) ) ( not ( = ?auto_16322 ?auto_16342 ) ) ( not ( = ?auto_16359 ?auto_16346 ) ) ( not ( = ?auto_16359 ?auto_16347 ) ) ( not ( = ?auto_16359 ?auto_16341 ) ) ( not ( = ?auto_16359 ?auto_16336 ) ) ( not ( = ?auto_16351 ?auto_16345 ) ) ( not ( = ?auto_16351 ?auto_16354 ) ) ( not ( = ?auto_16351 ?auto_16357 ) ) ( not ( = ?auto_16351 ?auto_16337 ) ) ( not ( = ?auto_16350 ?auto_16362 ) ) ( not ( = ?auto_16350 ?auto_16356 ) ) ( not ( = ?auto_16350 ?auto_16353 ) ) ( not ( = ?auto_16350 ?auto_16342 ) ) ( not ( = ?auto_16317 ?auto_16323 ) ) ( not ( = ?auto_16317 ?auto_16349 ) ) ( not ( = ?auto_16318 ?auto_16323 ) ) ( not ( = ?auto_16318 ?auto_16349 ) ) ( not ( = ?auto_16319 ?auto_16323 ) ) ( not ( = ?auto_16319 ?auto_16349 ) ) ( not ( = ?auto_16320 ?auto_16323 ) ) ( not ( = ?auto_16320 ?auto_16349 ) ) ( not ( = ?auto_16321 ?auto_16323 ) ) ( not ( = ?auto_16321 ?auto_16349 ) ) ( not ( = ?auto_16323 ?auto_16350 ) ) ( not ( = ?auto_16323 ?auto_16362 ) ) ( not ( = ?auto_16323 ?auto_16356 ) ) ( not ( = ?auto_16323 ?auto_16353 ) ) ( not ( = ?auto_16323 ?auto_16342 ) ) ( not ( = ?auto_16348 ?auto_16359 ) ) ( not ( = ?auto_16348 ?auto_16346 ) ) ( not ( = ?auto_16348 ?auto_16347 ) ) ( not ( = ?auto_16348 ?auto_16341 ) ) ( not ( = ?auto_16348 ?auto_16336 ) ) ( not ( = ?auto_16358 ?auto_16351 ) ) ( not ( = ?auto_16358 ?auto_16345 ) ) ( not ( = ?auto_16358 ?auto_16354 ) ) ( not ( = ?auto_16358 ?auto_16357 ) ) ( not ( = ?auto_16358 ?auto_16337 ) ) ( not ( = ?auto_16349 ?auto_16350 ) ) ( not ( = ?auto_16349 ?auto_16362 ) ) ( not ( = ?auto_16349 ?auto_16356 ) ) ( not ( = ?auto_16349 ?auto_16353 ) ) ( not ( = ?auto_16349 ?auto_16342 ) ) ( not ( = ?auto_16317 ?auto_16326 ) ) ( not ( = ?auto_16317 ?auto_16335 ) ) ( not ( = ?auto_16318 ?auto_16326 ) ) ( not ( = ?auto_16318 ?auto_16335 ) ) ( not ( = ?auto_16319 ?auto_16326 ) ) ( not ( = ?auto_16319 ?auto_16335 ) ) ( not ( = ?auto_16320 ?auto_16326 ) ) ( not ( = ?auto_16320 ?auto_16335 ) ) ( not ( = ?auto_16321 ?auto_16326 ) ) ( not ( = ?auto_16321 ?auto_16335 ) ) ( not ( = ?auto_16322 ?auto_16326 ) ) ( not ( = ?auto_16322 ?auto_16335 ) ) ( not ( = ?auto_16326 ?auto_16349 ) ) ( not ( = ?auto_16326 ?auto_16350 ) ) ( not ( = ?auto_16326 ?auto_16362 ) ) ( not ( = ?auto_16326 ?auto_16356 ) ) ( not ( = ?auto_16326 ?auto_16353 ) ) ( not ( = ?auto_16326 ?auto_16342 ) ) ( not ( = ?auto_16360 ?auto_16348 ) ) ( not ( = ?auto_16360 ?auto_16359 ) ) ( not ( = ?auto_16360 ?auto_16346 ) ) ( not ( = ?auto_16360 ?auto_16347 ) ) ( not ( = ?auto_16360 ?auto_16341 ) ) ( not ( = ?auto_16360 ?auto_16336 ) ) ( not ( = ?auto_16338 ?auto_16358 ) ) ( not ( = ?auto_16338 ?auto_16351 ) ) ( not ( = ?auto_16338 ?auto_16345 ) ) ( not ( = ?auto_16338 ?auto_16354 ) ) ( not ( = ?auto_16338 ?auto_16357 ) ) ( not ( = ?auto_16338 ?auto_16337 ) ) ( not ( = ?auto_16335 ?auto_16349 ) ) ( not ( = ?auto_16335 ?auto_16350 ) ) ( not ( = ?auto_16335 ?auto_16362 ) ) ( not ( = ?auto_16335 ?auto_16356 ) ) ( not ( = ?auto_16335 ?auto_16353 ) ) ( not ( = ?auto_16335 ?auto_16342 ) ) ( not ( = ?auto_16317 ?auto_16325 ) ) ( not ( = ?auto_16317 ?auto_16340 ) ) ( not ( = ?auto_16318 ?auto_16325 ) ) ( not ( = ?auto_16318 ?auto_16340 ) ) ( not ( = ?auto_16319 ?auto_16325 ) ) ( not ( = ?auto_16319 ?auto_16340 ) ) ( not ( = ?auto_16320 ?auto_16325 ) ) ( not ( = ?auto_16320 ?auto_16340 ) ) ( not ( = ?auto_16321 ?auto_16325 ) ) ( not ( = ?auto_16321 ?auto_16340 ) ) ( not ( = ?auto_16322 ?auto_16325 ) ) ( not ( = ?auto_16322 ?auto_16340 ) ) ( not ( = ?auto_16323 ?auto_16325 ) ) ( not ( = ?auto_16323 ?auto_16340 ) ) ( not ( = ?auto_16325 ?auto_16335 ) ) ( not ( = ?auto_16325 ?auto_16349 ) ) ( not ( = ?auto_16325 ?auto_16350 ) ) ( not ( = ?auto_16325 ?auto_16362 ) ) ( not ( = ?auto_16325 ?auto_16356 ) ) ( not ( = ?auto_16325 ?auto_16353 ) ) ( not ( = ?auto_16325 ?auto_16342 ) ) ( not ( = ?auto_16355 ?auto_16360 ) ) ( not ( = ?auto_16355 ?auto_16348 ) ) ( not ( = ?auto_16355 ?auto_16359 ) ) ( not ( = ?auto_16355 ?auto_16346 ) ) ( not ( = ?auto_16355 ?auto_16347 ) ) ( not ( = ?auto_16355 ?auto_16341 ) ) ( not ( = ?auto_16355 ?auto_16336 ) ) ( not ( = ?auto_16344 ?auto_16338 ) ) ( not ( = ?auto_16344 ?auto_16358 ) ) ( not ( = ?auto_16344 ?auto_16351 ) ) ( not ( = ?auto_16344 ?auto_16345 ) ) ( not ( = ?auto_16344 ?auto_16354 ) ) ( not ( = ?auto_16344 ?auto_16357 ) ) ( not ( = ?auto_16344 ?auto_16337 ) ) ( not ( = ?auto_16340 ?auto_16335 ) ) ( not ( = ?auto_16340 ?auto_16349 ) ) ( not ( = ?auto_16340 ?auto_16350 ) ) ( not ( = ?auto_16340 ?auto_16362 ) ) ( not ( = ?auto_16340 ?auto_16356 ) ) ( not ( = ?auto_16340 ?auto_16353 ) ) ( not ( = ?auto_16340 ?auto_16342 ) ) ( not ( = ?auto_16317 ?auto_16324 ) ) ( not ( = ?auto_16317 ?auto_16343 ) ) ( not ( = ?auto_16318 ?auto_16324 ) ) ( not ( = ?auto_16318 ?auto_16343 ) ) ( not ( = ?auto_16319 ?auto_16324 ) ) ( not ( = ?auto_16319 ?auto_16343 ) ) ( not ( = ?auto_16320 ?auto_16324 ) ) ( not ( = ?auto_16320 ?auto_16343 ) ) ( not ( = ?auto_16321 ?auto_16324 ) ) ( not ( = ?auto_16321 ?auto_16343 ) ) ( not ( = ?auto_16322 ?auto_16324 ) ) ( not ( = ?auto_16322 ?auto_16343 ) ) ( not ( = ?auto_16323 ?auto_16324 ) ) ( not ( = ?auto_16323 ?auto_16343 ) ) ( not ( = ?auto_16326 ?auto_16324 ) ) ( not ( = ?auto_16326 ?auto_16343 ) ) ( not ( = ?auto_16324 ?auto_16340 ) ) ( not ( = ?auto_16324 ?auto_16335 ) ) ( not ( = ?auto_16324 ?auto_16349 ) ) ( not ( = ?auto_16324 ?auto_16350 ) ) ( not ( = ?auto_16324 ?auto_16362 ) ) ( not ( = ?auto_16324 ?auto_16356 ) ) ( not ( = ?auto_16324 ?auto_16353 ) ) ( not ( = ?auto_16324 ?auto_16342 ) ) ( not ( = ?auto_16339 ?auto_16355 ) ) ( not ( = ?auto_16339 ?auto_16360 ) ) ( not ( = ?auto_16339 ?auto_16348 ) ) ( not ( = ?auto_16339 ?auto_16359 ) ) ( not ( = ?auto_16339 ?auto_16346 ) ) ( not ( = ?auto_16339 ?auto_16347 ) ) ( not ( = ?auto_16339 ?auto_16341 ) ) ( not ( = ?auto_16339 ?auto_16336 ) ) ( not ( = ?auto_16361 ?auto_16344 ) ) ( not ( = ?auto_16361 ?auto_16338 ) ) ( not ( = ?auto_16361 ?auto_16358 ) ) ( not ( = ?auto_16361 ?auto_16351 ) ) ( not ( = ?auto_16361 ?auto_16345 ) ) ( not ( = ?auto_16361 ?auto_16354 ) ) ( not ( = ?auto_16361 ?auto_16357 ) ) ( not ( = ?auto_16361 ?auto_16337 ) ) ( not ( = ?auto_16343 ?auto_16340 ) ) ( not ( = ?auto_16343 ?auto_16335 ) ) ( not ( = ?auto_16343 ?auto_16349 ) ) ( not ( = ?auto_16343 ?auto_16350 ) ) ( not ( = ?auto_16343 ?auto_16362 ) ) ( not ( = ?auto_16343 ?auto_16356 ) ) ( not ( = ?auto_16343 ?auto_16353 ) ) ( not ( = ?auto_16343 ?auto_16342 ) ) ( not ( = ?auto_16317 ?auto_16327 ) ) ( not ( = ?auto_16317 ?auto_16352 ) ) ( not ( = ?auto_16318 ?auto_16327 ) ) ( not ( = ?auto_16318 ?auto_16352 ) ) ( not ( = ?auto_16319 ?auto_16327 ) ) ( not ( = ?auto_16319 ?auto_16352 ) ) ( not ( = ?auto_16320 ?auto_16327 ) ) ( not ( = ?auto_16320 ?auto_16352 ) ) ( not ( = ?auto_16321 ?auto_16327 ) ) ( not ( = ?auto_16321 ?auto_16352 ) ) ( not ( = ?auto_16322 ?auto_16327 ) ) ( not ( = ?auto_16322 ?auto_16352 ) ) ( not ( = ?auto_16323 ?auto_16327 ) ) ( not ( = ?auto_16323 ?auto_16352 ) ) ( not ( = ?auto_16326 ?auto_16327 ) ) ( not ( = ?auto_16326 ?auto_16352 ) ) ( not ( = ?auto_16325 ?auto_16327 ) ) ( not ( = ?auto_16325 ?auto_16352 ) ) ( not ( = ?auto_16327 ?auto_16343 ) ) ( not ( = ?auto_16327 ?auto_16340 ) ) ( not ( = ?auto_16327 ?auto_16335 ) ) ( not ( = ?auto_16327 ?auto_16349 ) ) ( not ( = ?auto_16327 ?auto_16350 ) ) ( not ( = ?auto_16327 ?auto_16362 ) ) ( not ( = ?auto_16327 ?auto_16356 ) ) ( not ( = ?auto_16327 ?auto_16353 ) ) ( not ( = ?auto_16327 ?auto_16342 ) ) ( not ( = ?auto_16352 ?auto_16343 ) ) ( not ( = ?auto_16352 ?auto_16340 ) ) ( not ( = ?auto_16352 ?auto_16335 ) ) ( not ( = ?auto_16352 ?auto_16349 ) ) ( not ( = ?auto_16352 ?auto_16350 ) ) ( not ( = ?auto_16352 ?auto_16362 ) ) ( not ( = ?auto_16352 ?auto_16356 ) ) ( not ( = ?auto_16352 ?auto_16353 ) ) ( not ( = ?auto_16352 ?auto_16342 ) ) ( not ( = ?auto_16317 ?auto_16328 ) ) ( not ( = ?auto_16317 ?auto_16329 ) ) ( not ( = ?auto_16318 ?auto_16328 ) ) ( not ( = ?auto_16318 ?auto_16329 ) ) ( not ( = ?auto_16319 ?auto_16328 ) ) ( not ( = ?auto_16319 ?auto_16329 ) ) ( not ( = ?auto_16320 ?auto_16328 ) ) ( not ( = ?auto_16320 ?auto_16329 ) ) ( not ( = ?auto_16321 ?auto_16328 ) ) ( not ( = ?auto_16321 ?auto_16329 ) ) ( not ( = ?auto_16322 ?auto_16328 ) ) ( not ( = ?auto_16322 ?auto_16329 ) ) ( not ( = ?auto_16323 ?auto_16328 ) ) ( not ( = ?auto_16323 ?auto_16329 ) ) ( not ( = ?auto_16326 ?auto_16328 ) ) ( not ( = ?auto_16326 ?auto_16329 ) ) ( not ( = ?auto_16325 ?auto_16328 ) ) ( not ( = ?auto_16325 ?auto_16329 ) ) ( not ( = ?auto_16324 ?auto_16328 ) ) ( not ( = ?auto_16324 ?auto_16329 ) ) ( not ( = ?auto_16328 ?auto_16352 ) ) ( not ( = ?auto_16328 ?auto_16343 ) ) ( not ( = ?auto_16328 ?auto_16340 ) ) ( not ( = ?auto_16328 ?auto_16335 ) ) ( not ( = ?auto_16328 ?auto_16349 ) ) ( not ( = ?auto_16328 ?auto_16350 ) ) ( not ( = ?auto_16328 ?auto_16362 ) ) ( not ( = ?auto_16328 ?auto_16356 ) ) ( not ( = ?auto_16328 ?auto_16353 ) ) ( not ( = ?auto_16328 ?auto_16342 ) ) ( not ( = ?auto_16334 ?auto_16339 ) ) ( not ( = ?auto_16334 ?auto_16355 ) ) ( not ( = ?auto_16334 ?auto_16360 ) ) ( not ( = ?auto_16334 ?auto_16348 ) ) ( not ( = ?auto_16334 ?auto_16359 ) ) ( not ( = ?auto_16334 ?auto_16346 ) ) ( not ( = ?auto_16334 ?auto_16347 ) ) ( not ( = ?auto_16334 ?auto_16341 ) ) ( not ( = ?auto_16334 ?auto_16336 ) ) ( not ( = ?auto_16333 ?auto_16361 ) ) ( not ( = ?auto_16333 ?auto_16344 ) ) ( not ( = ?auto_16333 ?auto_16338 ) ) ( not ( = ?auto_16333 ?auto_16358 ) ) ( not ( = ?auto_16333 ?auto_16351 ) ) ( not ( = ?auto_16333 ?auto_16345 ) ) ( not ( = ?auto_16333 ?auto_16354 ) ) ( not ( = ?auto_16333 ?auto_16357 ) ) ( not ( = ?auto_16333 ?auto_16337 ) ) ( not ( = ?auto_16329 ?auto_16352 ) ) ( not ( = ?auto_16329 ?auto_16343 ) ) ( not ( = ?auto_16329 ?auto_16340 ) ) ( not ( = ?auto_16329 ?auto_16335 ) ) ( not ( = ?auto_16329 ?auto_16349 ) ) ( not ( = ?auto_16329 ?auto_16350 ) ) ( not ( = ?auto_16329 ?auto_16362 ) ) ( not ( = ?auto_16329 ?auto_16356 ) ) ( not ( = ?auto_16329 ?auto_16353 ) ) ( not ( = ?auto_16329 ?auto_16342 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_16317 ?auto_16318 ?auto_16319 ?auto_16320 ?auto_16321 ?auto_16322 ?auto_16323 ?auto_16326 ?auto_16325 ?auto_16324 ?auto_16327 )
      ( MAKE-1CRATE ?auto_16327 ?auto_16328 )
      ( MAKE-11CRATE-VERIFY ?auto_16317 ?auto_16318 ?auto_16319 ?auto_16320 ?auto_16321 ?auto_16322 ?auto_16323 ?auto_16326 ?auto_16325 ?auto_16324 ?auto_16327 ?auto_16328 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16365 - SURFACE
      ?auto_16366 - SURFACE
    )
    :vars
    (
      ?auto_16367 - HOIST
      ?auto_16368 - PLACE
      ?auto_16370 - PLACE
      ?auto_16371 - HOIST
      ?auto_16372 - SURFACE
      ?auto_16369 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16367 ?auto_16368 ) ( SURFACE-AT ?auto_16365 ?auto_16368 ) ( CLEAR ?auto_16365 ) ( IS-CRATE ?auto_16366 ) ( AVAILABLE ?auto_16367 ) ( not ( = ?auto_16370 ?auto_16368 ) ) ( HOIST-AT ?auto_16371 ?auto_16370 ) ( AVAILABLE ?auto_16371 ) ( SURFACE-AT ?auto_16366 ?auto_16370 ) ( ON ?auto_16366 ?auto_16372 ) ( CLEAR ?auto_16366 ) ( TRUCK-AT ?auto_16369 ?auto_16368 ) ( not ( = ?auto_16365 ?auto_16366 ) ) ( not ( = ?auto_16365 ?auto_16372 ) ) ( not ( = ?auto_16366 ?auto_16372 ) ) ( not ( = ?auto_16367 ?auto_16371 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16369 ?auto_16368 ?auto_16370 )
      ( !LIFT ?auto_16371 ?auto_16366 ?auto_16372 ?auto_16370 )
      ( !LOAD ?auto_16371 ?auto_16366 ?auto_16369 ?auto_16370 )
      ( !DRIVE ?auto_16369 ?auto_16370 ?auto_16368 )
      ( !UNLOAD ?auto_16367 ?auto_16366 ?auto_16369 ?auto_16368 )
      ( !DROP ?auto_16367 ?auto_16366 ?auto_16365 ?auto_16368 )
      ( MAKE-1CRATE-VERIFY ?auto_16365 ?auto_16366 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_16386 - SURFACE
      ?auto_16387 - SURFACE
      ?auto_16388 - SURFACE
      ?auto_16389 - SURFACE
      ?auto_16390 - SURFACE
      ?auto_16391 - SURFACE
      ?auto_16392 - SURFACE
      ?auto_16395 - SURFACE
      ?auto_16394 - SURFACE
      ?auto_16393 - SURFACE
      ?auto_16396 - SURFACE
      ?auto_16397 - SURFACE
      ?auto_16398 - SURFACE
    )
    :vars
    (
      ?auto_16403 - HOIST
      ?auto_16404 - PLACE
      ?auto_16402 - PLACE
      ?auto_16399 - HOIST
      ?auto_16400 - SURFACE
      ?auto_16406 - PLACE
      ?auto_16424 - HOIST
      ?auto_16420 - SURFACE
      ?auto_16409 - PLACE
      ?auto_16419 - HOIST
      ?auto_16435 - SURFACE
      ?auto_16418 - SURFACE
      ?auto_16423 - PLACE
      ?auto_16422 - HOIST
      ?auto_16415 - SURFACE
      ?auto_16429 - PLACE
      ?auto_16410 - HOIST
      ?auto_16411 - SURFACE
      ?auto_16408 - PLACE
      ?auto_16432 - HOIST
      ?auto_16431 - SURFACE
      ?auto_16416 - PLACE
      ?auto_16434 - HOIST
      ?auto_16407 - SURFACE
      ?auto_16417 - PLACE
      ?auto_16421 - HOIST
      ?auto_16414 - SURFACE
      ?auto_16430 - PLACE
      ?auto_16412 - HOIST
      ?auto_16426 - SURFACE
      ?auto_16427 - PLACE
      ?auto_16413 - HOIST
      ?auto_16405 - SURFACE
      ?auto_16425 - PLACE
      ?auto_16433 - HOIST
      ?auto_16428 - SURFACE
      ?auto_16401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16403 ?auto_16404 ) ( IS-CRATE ?auto_16398 ) ( not ( = ?auto_16402 ?auto_16404 ) ) ( HOIST-AT ?auto_16399 ?auto_16402 ) ( AVAILABLE ?auto_16399 ) ( SURFACE-AT ?auto_16398 ?auto_16402 ) ( ON ?auto_16398 ?auto_16400 ) ( CLEAR ?auto_16398 ) ( not ( = ?auto_16397 ?auto_16398 ) ) ( not ( = ?auto_16397 ?auto_16400 ) ) ( not ( = ?auto_16398 ?auto_16400 ) ) ( not ( = ?auto_16403 ?auto_16399 ) ) ( IS-CRATE ?auto_16397 ) ( not ( = ?auto_16406 ?auto_16404 ) ) ( HOIST-AT ?auto_16424 ?auto_16406 ) ( AVAILABLE ?auto_16424 ) ( SURFACE-AT ?auto_16397 ?auto_16406 ) ( ON ?auto_16397 ?auto_16420 ) ( CLEAR ?auto_16397 ) ( not ( = ?auto_16396 ?auto_16397 ) ) ( not ( = ?auto_16396 ?auto_16420 ) ) ( not ( = ?auto_16397 ?auto_16420 ) ) ( not ( = ?auto_16403 ?auto_16424 ) ) ( IS-CRATE ?auto_16396 ) ( not ( = ?auto_16409 ?auto_16404 ) ) ( HOIST-AT ?auto_16419 ?auto_16409 ) ( SURFACE-AT ?auto_16396 ?auto_16409 ) ( ON ?auto_16396 ?auto_16435 ) ( CLEAR ?auto_16396 ) ( not ( = ?auto_16393 ?auto_16396 ) ) ( not ( = ?auto_16393 ?auto_16435 ) ) ( not ( = ?auto_16396 ?auto_16435 ) ) ( not ( = ?auto_16403 ?auto_16419 ) ) ( IS-CRATE ?auto_16393 ) ( AVAILABLE ?auto_16419 ) ( SURFACE-AT ?auto_16393 ?auto_16409 ) ( ON ?auto_16393 ?auto_16418 ) ( CLEAR ?auto_16393 ) ( not ( = ?auto_16394 ?auto_16393 ) ) ( not ( = ?auto_16394 ?auto_16418 ) ) ( not ( = ?auto_16393 ?auto_16418 ) ) ( IS-CRATE ?auto_16394 ) ( not ( = ?auto_16423 ?auto_16404 ) ) ( HOIST-AT ?auto_16422 ?auto_16423 ) ( AVAILABLE ?auto_16422 ) ( SURFACE-AT ?auto_16394 ?auto_16423 ) ( ON ?auto_16394 ?auto_16415 ) ( CLEAR ?auto_16394 ) ( not ( = ?auto_16395 ?auto_16394 ) ) ( not ( = ?auto_16395 ?auto_16415 ) ) ( not ( = ?auto_16394 ?auto_16415 ) ) ( not ( = ?auto_16403 ?auto_16422 ) ) ( IS-CRATE ?auto_16395 ) ( not ( = ?auto_16429 ?auto_16404 ) ) ( HOIST-AT ?auto_16410 ?auto_16429 ) ( AVAILABLE ?auto_16410 ) ( SURFACE-AT ?auto_16395 ?auto_16429 ) ( ON ?auto_16395 ?auto_16411 ) ( CLEAR ?auto_16395 ) ( not ( = ?auto_16392 ?auto_16395 ) ) ( not ( = ?auto_16392 ?auto_16411 ) ) ( not ( = ?auto_16395 ?auto_16411 ) ) ( not ( = ?auto_16403 ?auto_16410 ) ) ( IS-CRATE ?auto_16392 ) ( not ( = ?auto_16408 ?auto_16404 ) ) ( HOIST-AT ?auto_16432 ?auto_16408 ) ( AVAILABLE ?auto_16432 ) ( SURFACE-AT ?auto_16392 ?auto_16408 ) ( ON ?auto_16392 ?auto_16431 ) ( CLEAR ?auto_16392 ) ( not ( = ?auto_16391 ?auto_16392 ) ) ( not ( = ?auto_16391 ?auto_16431 ) ) ( not ( = ?auto_16392 ?auto_16431 ) ) ( not ( = ?auto_16403 ?auto_16432 ) ) ( IS-CRATE ?auto_16391 ) ( not ( = ?auto_16416 ?auto_16404 ) ) ( HOIST-AT ?auto_16434 ?auto_16416 ) ( AVAILABLE ?auto_16434 ) ( SURFACE-AT ?auto_16391 ?auto_16416 ) ( ON ?auto_16391 ?auto_16407 ) ( CLEAR ?auto_16391 ) ( not ( = ?auto_16390 ?auto_16391 ) ) ( not ( = ?auto_16390 ?auto_16407 ) ) ( not ( = ?auto_16391 ?auto_16407 ) ) ( not ( = ?auto_16403 ?auto_16434 ) ) ( IS-CRATE ?auto_16390 ) ( not ( = ?auto_16417 ?auto_16404 ) ) ( HOIST-AT ?auto_16421 ?auto_16417 ) ( AVAILABLE ?auto_16421 ) ( SURFACE-AT ?auto_16390 ?auto_16417 ) ( ON ?auto_16390 ?auto_16414 ) ( CLEAR ?auto_16390 ) ( not ( = ?auto_16389 ?auto_16390 ) ) ( not ( = ?auto_16389 ?auto_16414 ) ) ( not ( = ?auto_16390 ?auto_16414 ) ) ( not ( = ?auto_16403 ?auto_16421 ) ) ( IS-CRATE ?auto_16389 ) ( not ( = ?auto_16430 ?auto_16404 ) ) ( HOIST-AT ?auto_16412 ?auto_16430 ) ( AVAILABLE ?auto_16412 ) ( SURFACE-AT ?auto_16389 ?auto_16430 ) ( ON ?auto_16389 ?auto_16426 ) ( CLEAR ?auto_16389 ) ( not ( = ?auto_16388 ?auto_16389 ) ) ( not ( = ?auto_16388 ?auto_16426 ) ) ( not ( = ?auto_16389 ?auto_16426 ) ) ( not ( = ?auto_16403 ?auto_16412 ) ) ( IS-CRATE ?auto_16388 ) ( not ( = ?auto_16427 ?auto_16404 ) ) ( HOIST-AT ?auto_16413 ?auto_16427 ) ( AVAILABLE ?auto_16413 ) ( SURFACE-AT ?auto_16388 ?auto_16427 ) ( ON ?auto_16388 ?auto_16405 ) ( CLEAR ?auto_16388 ) ( not ( = ?auto_16387 ?auto_16388 ) ) ( not ( = ?auto_16387 ?auto_16405 ) ) ( not ( = ?auto_16388 ?auto_16405 ) ) ( not ( = ?auto_16403 ?auto_16413 ) ) ( SURFACE-AT ?auto_16386 ?auto_16404 ) ( CLEAR ?auto_16386 ) ( IS-CRATE ?auto_16387 ) ( AVAILABLE ?auto_16403 ) ( not ( = ?auto_16425 ?auto_16404 ) ) ( HOIST-AT ?auto_16433 ?auto_16425 ) ( AVAILABLE ?auto_16433 ) ( SURFACE-AT ?auto_16387 ?auto_16425 ) ( ON ?auto_16387 ?auto_16428 ) ( CLEAR ?auto_16387 ) ( TRUCK-AT ?auto_16401 ?auto_16404 ) ( not ( = ?auto_16386 ?auto_16387 ) ) ( not ( = ?auto_16386 ?auto_16428 ) ) ( not ( = ?auto_16387 ?auto_16428 ) ) ( not ( = ?auto_16403 ?auto_16433 ) ) ( not ( = ?auto_16386 ?auto_16388 ) ) ( not ( = ?auto_16386 ?auto_16405 ) ) ( not ( = ?auto_16388 ?auto_16428 ) ) ( not ( = ?auto_16427 ?auto_16425 ) ) ( not ( = ?auto_16413 ?auto_16433 ) ) ( not ( = ?auto_16405 ?auto_16428 ) ) ( not ( = ?auto_16386 ?auto_16389 ) ) ( not ( = ?auto_16386 ?auto_16426 ) ) ( not ( = ?auto_16387 ?auto_16389 ) ) ( not ( = ?auto_16387 ?auto_16426 ) ) ( not ( = ?auto_16389 ?auto_16405 ) ) ( not ( = ?auto_16389 ?auto_16428 ) ) ( not ( = ?auto_16430 ?auto_16427 ) ) ( not ( = ?auto_16430 ?auto_16425 ) ) ( not ( = ?auto_16412 ?auto_16413 ) ) ( not ( = ?auto_16412 ?auto_16433 ) ) ( not ( = ?auto_16426 ?auto_16405 ) ) ( not ( = ?auto_16426 ?auto_16428 ) ) ( not ( = ?auto_16386 ?auto_16390 ) ) ( not ( = ?auto_16386 ?auto_16414 ) ) ( not ( = ?auto_16387 ?auto_16390 ) ) ( not ( = ?auto_16387 ?auto_16414 ) ) ( not ( = ?auto_16388 ?auto_16390 ) ) ( not ( = ?auto_16388 ?auto_16414 ) ) ( not ( = ?auto_16390 ?auto_16426 ) ) ( not ( = ?auto_16390 ?auto_16405 ) ) ( not ( = ?auto_16390 ?auto_16428 ) ) ( not ( = ?auto_16417 ?auto_16430 ) ) ( not ( = ?auto_16417 ?auto_16427 ) ) ( not ( = ?auto_16417 ?auto_16425 ) ) ( not ( = ?auto_16421 ?auto_16412 ) ) ( not ( = ?auto_16421 ?auto_16413 ) ) ( not ( = ?auto_16421 ?auto_16433 ) ) ( not ( = ?auto_16414 ?auto_16426 ) ) ( not ( = ?auto_16414 ?auto_16405 ) ) ( not ( = ?auto_16414 ?auto_16428 ) ) ( not ( = ?auto_16386 ?auto_16391 ) ) ( not ( = ?auto_16386 ?auto_16407 ) ) ( not ( = ?auto_16387 ?auto_16391 ) ) ( not ( = ?auto_16387 ?auto_16407 ) ) ( not ( = ?auto_16388 ?auto_16391 ) ) ( not ( = ?auto_16388 ?auto_16407 ) ) ( not ( = ?auto_16389 ?auto_16391 ) ) ( not ( = ?auto_16389 ?auto_16407 ) ) ( not ( = ?auto_16391 ?auto_16414 ) ) ( not ( = ?auto_16391 ?auto_16426 ) ) ( not ( = ?auto_16391 ?auto_16405 ) ) ( not ( = ?auto_16391 ?auto_16428 ) ) ( not ( = ?auto_16416 ?auto_16417 ) ) ( not ( = ?auto_16416 ?auto_16430 ) ) ( not ( = ?auto_16416 ?auto_16427 ) ) ( not ( = ?auto_16416 ?auto_16425 ) ) ( not ( = ?auto_16434 ?auto_16421 ) ) ( not ( = ?auto_16434 ?auto_16412 ) ) ( not ( = ?auto_16434 ?auto_16413 ) ) ( not ( = ?auto_16434 ?auto_16433 ) ) ( not ( = ?auto_16407 ?auto_16414 ) ) ( not ( = ?auto_16407 ?auto_16426 ) ) ( not ( = ?auto_16407 ?auto_16405 ) ) ( not ( = ?auto_16407 ?auto_16428 ) ) ( not ( = ?auto_16386 ?auto_16392 ) ) ( not ( = ?auto_16386 ?auto_16431 ) ) ( not ( = ?auto_16387 ?auto_16392 ) ) ( not ( = ?auto_16387 ?auto_16431 ) ) ( not ( = ?auto_16388 ?auto_16392 ) ) ( not ( = ?auto_16388 ?auto_16431 ) ) ( not ( = ?auto_16389 ?auto_16392 ) ) ( not ( = ?auto_16389 ?auto_16431 ) ) ( not ( = ?auto_16390 ?auto_16392 ) ) ( not ( = ?auto_16390 ?auto_16431 ) ) ( not ( = ?auto_16392 ?auto_16407 ) ) ( not ( = ?auto_16392 ?auto_16414 ) ) ( not ( = ?auto_16392 ?auto_16426 ) ) ( not ( = ?auto_16392 ?auto_16405 ) ) ( not ( = ?auto_16392 ?auto_16428 ) ) ( not ( = ?auto_16408 ?auto_16416 ) ) ( not ( = ?auto_16408 ?auto_16417 ) ) ( not ( = ?auto_16408 ?auto_16430 ) ) ( not ( = ?auto_16408 ?auto_16427 ) ) ( not ( = ?auto_16408 ?auto_16425 ) ) ( not ( = ?auto_16432 ?auto_16434 ) ) ( not ( = ?auto_16432 ?auto_16421 ) ) ( not ( = ?auto_16432 ?auto_16412 ) ) ( not ( = ?auto_16432 ?auto_16413 ) ) ( not ( = ?auto_16432 ?auto_16433 ) ) ( not ( = ?auto_16431 ?auto_16407 ) ) ( not ( = ?auto_16431 ?auto_16414 ) ) ( not ( = ?auto_16431 ?auto_16426 ) ) ( not ( = ?auto_16431 ?auto_16405 ) ) ( not ( = ?auto_16431 ?auto_16428 ) ) ( not ( = ?auto_16386 ?auto_16395 ) ) ( not ( = ?auto_16386 ?auto_16411 ) ) ( not ( = ?auto_16387 ?auto_16395 ) ) ( not ( = ?auto_16387 ?auto_16411 ) ) ( not ( = ?auto_16388 ?auto_16395 ) ) ( not ( = ?auto_16388 ?auto_16411 ) ) ( not ( = ?auto_16389 ?auto_16395 ) ) ( not ( = ?auto_16389 ?auto_16411 ) ) ( not ( = ?auto_16390 ?auto_16395 ) ) ( not ( = ?auto_16390 ?auto_16411 ) ) ( not ( = ?auto_16391 ?auto_16395 ) ) ( not ( = ?auto_16391 ?auto_16411 ) ) ( not ( = ?auto_16395 ?auto_16431 ) ) ( not ( = ?auto_16395 ?auto_16407 ) ) ( not ( = ?auto_16395 ?auto_16414 ) ) ( not ( = ?auto_16395 ?auto_16426 ) ) ( not ( = ?auto_16395 ?auto_16405 ) ) ( not ( = ?auto_16395 ?auto_16428 ) ) ( not ( = ?auto_16429 ?auto_16408 ) ) ( not ( = ?auto_16429 ?auto_16416 ) ) ( not ( = ?auto_16429 ?auto_16417 ) ) ( not ( = ?auto_16429 ?auto_16430 ) ) ( not ( = ?auto_16429 ?auto_16427 ) ) ( not ( = ?auto_16429 ?auto_16425 ) ) ( not ( = ?auto_16410 ?auto_16432 ) ) ( not ( = ?auto_16410 ?auto_16434 ) ) ( not ( = ?auto_16410 ?auto_16421 ) ) ( not ( = ?auto_16410 ?auto_16412 ) ) ( not ( = ?auto_16410 ?auto_16413 ) ) ( not ( = ?auto_16410 ?auto_16433 ) ) ( not ( = ?auto_16411 ?auto_16431 ) ) ( not ( = ?auto_16411 ?auto_16407 ) ) ( not ( = ?auto_16411 ?auto_16414 ) ) ( not ( = ?auto_16411 ?auto_16426 ) ) ( not ( = ?auto_16411 ?auto_16405 ) ) ( not ( = ?auto_16411 ?auto_16428 ) ) ( not ( = ?auto_16386 ?auto_16394 ) ) ( not ( = ?auto_16386 ?auto_16415 ) ) ( not ( = ?auto_16387 ?auto_16394 ) ) ( not ( = ?auto_16387 ?auto_16415 ) ) ( not ( = ?auto_16388 ?auto_16394 ) ) ( not ( = ?auto_16388 ?auto_16415 ) ) ( not ( = ?auto_16389 ?auto_16394 ) ) ( not ( = ?auto_16389 ?auto_16415 ) ) ( not ( = ?auto_16390 ?auto_16394 ) ) ( not ( = ?auto_16390 ?auto_16415 ) ) ( not ( = ?auto_16391 ?auto_16394 ) ) ( not ( = ?auto_16391 ?auto_16415 ) ) ( not ( = ?auto_16392 ?auto_16394 ) ) ( not ( = ?auto_16392 ?auto_16415 ) ) ( not ( = ?auto_16394 ?auto_16411 ) ) ( not ( = ?auto_16394 ?auto_16431 ) ) ( not ( = ?auto_16394 ?auto_16407 ) ) ( not ( = ?auto_16394 ?auto_16414 ) ) ( not ( = ?auto_16394 ?auto_16426 ) ) ( not ( = ?auto_16394 ?auto_16405 ) ) ( not ( = ?auto_16394 ?auto_16428 ) ) ( not ( = ?auto_16423 ?auto_16429 ) ) ( not ( = ?auto_16423 ?auto_16408 ) ) ( not ( = ?auto_16423 ?auto_16416 ) ) ( not ( = ?auto_16423 ?auto_16417 ) ) ( not ( = ?auto_16423 ?auto_16430 ) ) ( not ( = ?auto_16423 ?auto_16427 ) ) ( not ( = ?auto_16423 ?auto_16425 ) ) ( not ( = ?auto_16422 ?auto_16410 ) ) ( not ( = ?auto_16422 ?auto_16432 ) ) ( not ( = ?auto_16422 ?auto_16434 ) ) ( not ( = ?auto_16422 ?auto_16421 ) ) ( not ( = ?auto_16422 ?auto_16412 ) ) ( not ( = ?auto_16422 ?auto_16413 ) ) ( not ( = ?auto_16422 ?auto_16433 ) ) ( not ( = ?auto_16415 ?auto_16411 ) ) ( not ( = ?auto_16415 ?auto_16431 ) ) ( not ( = ?auto_16415 ?auto_16407 ) ) ( not ( = ?auto_16415 ?auto_16414 ) ) ( not ( = ?auto_16415 ?auto_16426 ) ) ( not ( = ?auto_16415 ?auto_16405 ) ) ( not ( = ?auto_16415 ?auto_16428 ) ) ( not ( = ?auto_16386 ?auto_16393 ) ) ( not ( = ?auto_16386 ?auto_16418 ) ) ( not ( = ?auto_16387 ?auto_16393 ) ) ( not ( = ?auto_16387 ?auto_16418 ) ) ( not ( = ?auto_16388 ?auto_16393 ) ) ( not ( = ?auto_16388 ?auto_16418 ) ) ( not ( = ?auto_16389 ?auto_16393 ) ) ( not ( = ?auto_16389 ?auto_16418 ) ) ( not ( = ?auto_16390 ?auto_16393 ) ) ( not ( = ?auto_16390 ?auto_16418 ) ) ( not ( = ?auto_16391 ?auto_16393 ) ) ( not ( = ?auto_16391 ?auto_16418 ) ) ( not ( = ?auto_16392 ?auto_16393 ) ) ( not ( = ?auto_16392 ?auto_16418 ) ) ( not ( = ?auto_16395 ?auto_16393 ) ) ( not ( = ?auto_16395 ?auto_16418 ) ) ( not ( = ?auto_16393 ?auto_16415 ) ) ( not ( = ?auto_16393 ?auto_16411 ) ) ( not ( = ?auto_16393 ?auto_16431 ) ) ( not ( = ?auto_16393 ?auto_16407 ) ) ( not ( = ?auto_16393 ?auto_16414 ) ) ( not ( = ?auto_16393 ?auto_16426 ) ) ( not ( = ?auto_16393 ?auto_16405 ) ) ( not ( = ?auto_16393 ?auto_16428 ) ) ( not ( = ?auto_16409 ?auto_16423 ) ) ( not ( = ?auto_16409 ?auto_16429 ) ) ( not ( = ?auto_16409 ?auto_16408 ) ) ( not ( = ?auto_16409 ?auto_16416 ) ) ( not ( = ?auto_16409 ?auto_16417 ) ) ( not ( = ?auto_16409 ?auto_16430 ) ) ( not ( = ?auto_16409 ?auto_16427 ) ) ( not ( = ?auto_16409 ?auto_16425 ) ) ( not ( = ?auto_16419 ?auto_16422 ) ) ( not ( = ?auto_16419 ?auto_16410 ) ) ( not ( = ?auto_16419 ?auto_16432 ) ) ( not ( = ?auto_16419 ?auto_16434 ) ) ( not ( = ?auto_16419 ?auto_16421 ) ) ( not ( = ?auto_16419 ?auto_16412 ) ) ( not ( = ?auto_16419 ?auto_16413 ) ) ( not ( = ?auto_16419 ?auto_16433 ) ) ( not ( = ?auto_16418 ?auto_16415 ) ) ( not ( = ?auto_16418 ?auto_16411 ) ) ( not ( = ?auto_16418 ?auto_16431 ) ) ( not ( = ?auto_16418 ?auto_16407 ) ) ( not ( = ?auto_16418 ?auto_16414 ) ) ( not ( = ?auto_16418 ?auto_16426 ) ) ( not ( = ?auto_16418 ?auto_16405 ) ) ( not ( = ?auto_16418 ?auto_16428 ) ) ( not ( = ?auto_16386 ?auto_16396 ) ) ( not ( = ?auto_16386 ?auto_16435 ) ) ( not ( = ?auto_16387 ?auto_16396 ) ) ( not ( = ?auto_16387 ?auto_16435 ) ) ( not ( = ?auto_16388 ?auto_16396 ) ) ( not ( = ?auto_16388 ?auto_16435 ) ) ( not ( = ?auto_16389 ?auto_16396 ) ) ( not ( = ?auto_16389 ?auto_16435 ) ) ( not ( = ?auto_16390 ?auto_16396 ) ) ( not ( = ?auto_16390 ?auto_16435 ) ) ( not ( = ?auto_16391 ?auto_16396 ) ) ( not ( = ?auto_16391 ?auto_16435 ) ) ( not ( = ?auto_16392 ?auto_16396 ) ) ( not ( = ?auto_16392 ?auto_16435 ) ) ( not ( = ?auto_16395 ?auto_16396 ) ) ( not ( = ?auto_16395 ?auto_16435 ) ) ( not ( = ?auto_16394 ?auto_16396 ) ) ( not ( = ?auto_16394 ?auto_16435 ) ) ( not ( = ?auto_16396 ?auto_16418 ) ) ( not ( = ?auto_16396 ?auto_16415 ) ) ( not ( = ?auto_16396 ?auto_16411 ) ) ( not ( = ?auto_16396 ?auto_16431 ) ) ( not ( = ?auto_16396 ?auto_16407 ) ) ( not ( = ?auto_16396 ?auto_16414 ) ) ( not ( = ?auto_16396 ?auto_16426 ) ) ( not ( = ?auto_16396 ?auto_16405 ) ) ( not ( = ?auto_16396 ?auto_16428 ) ) ( not ( = ?auto_16435 ?auto_16418 ) ) ( not ( = ?auto_16435 ?auto_16415 ) ) ( not ( = ?auto_16435 ?auto_16411 ) ) ( not ( = ?auto_16435 ?auto_16431 ) ) ( not ( = ?auto_16435 ?auto_16407 ) ) ( not ( = ?auto_16435 ?auto_16414 ) ) ( not ( = ?auto_16435 ?auto_16426 ) ) ( not ( = ?auto_16435 ?auto_16405 ) ) ( not ( = ?auto_16435 ?auto_16428 ) ) ( not ( = ?auto_16386 ?auto_16397 ) ) ( not ( = ?auto_16386 ?auto_16420 ) ) ( not ( = ?auto_16387 ?auto_16397 ) ) ( not ( = ?auto_16387 ?auto_16420 ) ) ( not ( = ?auto_16388 ?auto_16397 ) ) ( not ( = ?auto_16388 ?auto_16420 ) ) ( not ( = ?auto_16389 ?auto_16397 ) ) ( not ( = ?auto_16389 ?auto_16420 ) ) ( not ( = ?auto_16390 ?auto_16397 ) ) ( not ( = ?auto_16390 ?auto_16420 ) ) ( not ( = ?auto_16391 ?auto_16397 ) ) ( not ( = ?auto_16391 ?auto_16420 ) ) ( not ( = ?auto_16392 ?auto_16397 ) ) ( not ( = ?auto_16392 ?auto_16420 ) ) ( not ( = ?auto_16395 ?auto_16397 ) ) ( not ( = ?auto_16395 ?auto_16420 ) ) ( not ( = ?auto_16394 ?auto_16397 ) ) ( not ( = ?auto_16394 ?auto_16420 ) ) ( not ( = ?auto_16393 ?auto_16397 ) ) ( not ( = ?auto_16393 ?auto_16420 ) ) ( not ( = ?auto_16397 ?auto_16435 ) ) ( not ( = ?auto_16397 ?auto_16418 ) ) ( not ( = ?auto_16397 ?auto_16415 ) ) ( not ( = ?auto_16397 ?auto_16411 ) ) ( not ( = ?auto_16397 ?auto_16431 ) ) ( not ( = ?auto_16397 ?auto_16407 ) ) ( not ( = ?auto_16397 ?auto_16414 ) ) ( not ( = ?auto_16397 ?auto_16426 ) ) ( not ( = ?auto_16397 ?auto_16405 ) ) ( not ( = ?auto_16397 ?auto_16428 ) ) ( not ( = ?auto_16406 ?auto_16409 ) ) ( not ( = ?auto_16406 ?auto_16423 ) ) ( not ( = ?auto_16406 ?auto_16429 ) ) ( not ( = ?auto_16406 ?auto_16408 ) ) ( not ( = ?auto_16406 ?auto_16416 ) ) ( not ( = ?auto_16406 ?auto_16417 ) ) ( not ( = ?auto_16406 ?auto_16430 ) ) ( not ( = ?auto_16406 ?auto_16427 ) ) ( not ( = ?auto_16406 ?auto_16425 ) ) ( not ( = ?auto_16424 ?auto_16419 ) ) ( not ( = ?auto_16424 ?auto_16422 ) ) ( not ( = ?auto_16424 ?auto_16410 ) ) ( not ( = ?auto_16424 ?auto_16432 ) ) ( not ( = ?auto_16424 ?auto_16434 ) ) ( not ( = ?auto_16424 ?auto_16421 ) ) ( not ( = ?auto_16424 ?auto_16412 ) ) ( not ( = ?auto_16424 ?auto_16413 ) ) ( not ( = ?auto_16424 ?auto_16433 ) ) ( not ( = ?auto_16420 ?auto_16435 ) ) ( not ( = ?auto_16420 ?auto_16418 ) ) ( not ( = ?auto_16420 ?auto_16415 ) ) ( not ( = ?auto_16420 ?auto_16411 ) ) ( not ( = ?auto_16420 ?auto_16431 ) ) ( not ( = ?auto_16420 ?auto_16407 ) ) ( not ( = ?auto_16420 ?auto_16414 ) ) ( not ( = ?auto_16420 ?auto_16426 ) ) ( not ( = ?auto_16420 ?auto_16405 ) ) ( not ( = ?auto_16420 ?auto_16428 ) ) ( not ( = ?auto_16386 ?auto_16398 ) ) ( not ( = ?auto_16386 ?auto_16400 ) ) ( not ( = ?auto_16387 ?auto_16398 ) ) ( not ( = ?auto_16387 ?auto_16400 ) ) ( not ( = ?auto_16388 ?auto_16398 ) ) ( not ( = ?auto_16388 ?auto_16400 ) ) ( not ( = ?auto_16389 ?auto_16398 ) ) ( not ( = ?auto_16389 ?auto_16400 ) ) ( not ( = ?auto_16390 ?auto_16398 ) ) ( not ( = ?auto_16390 ?auto_16400 ) ) ( not ( = ?auto_16391 ?auto_16398 ) ) ( not ( = ?auto_16391 ?auto_16400 ) ) ( not ( = ?auto_16392 ?auto_16398 ) ) ( not ( = ?auto_16392 ?auto_16400 ) ) ( not ( = ?auto_16395 ?auto_16398 ) ) ( not ( = ?auto_16395 ?auto_16400 ) ) ( not ( = ?auto_16394 ?auto_16398 ) ) ( not ( = ?auto_16394 ?auto_16400 ) ) ( not ( = ?auto_16393 ?auto_16398 ) ) ( not ( = ?auto_16393 ?auto_16400 ) ) ( not ( = ?auto_16396 ?auto_16398 ) ) ( not ( = ?auto_16396 ?auto_16400 ) ) ( not ( = ?auto_16398 ?auto_16420 ) ) ( not ( = ?auto_16398 ?auto_16435 ) ) ( not ( = ?auto_16398 ?auto_16418 ) ) ( not ( = ?auto_16398 ?auto_16415 ) ) ( not ( = ?auto_16398 ?auto_16411 ) ) ( not ( = ?auto_16398 ?auto_16431 ) ) ( not ( = ?auto_16398 ?auto_16407 ) ) ( not ( = ?auto_16398 ?auto_16414 ) ) ( not ( = ?auto_16398 ?auto_16426 ) ) ( not ( = ?auto_16398 ?auto_16405 ) ) ( not ( = ?auto_16398 ?auto_16428 ) ) ( not ( = ?auto_16402 ?auto_16406 ) ) ( not ( = ?auto_16402 ?auto_16409 ) ) ( not ( = ?auto_16402 ?auto_16423 ) ) ( not ( = ?auto_16402 ?auto_16429 ) ) ( not ( = ?auto_16402 ?auto_16408 ) ) ( not ( = ?auto_16402 ?auto_16416 ) ) ( not ( = ?auto_16402 ?auto_16417 ) ) ( not ( = ?auto_16402 ?auto_16430 ) ) ( not ( = ?auto_16402 ?auto_16427 ) ) ( not ( = ?auto_16402 ?auto_16425 ) ) ( not ( = ?auto_16399 ?auto_16424 ) ) ( not ( = ?auto_16399 ?auto_16419 ) ) ( not ( = ?auto_16399 ?auto_16422 ) ) ( not ( = ?auto_16399 ?auto_16410 ) ) ( not ( = ?auto_16399 ?auto_16432 ) ) ( not ( = ?auto_16399 ?auto_16434 ) ) ( not ( = ?auto_16399 ?auto_16421 ) ) ( not ( = ?auto_16399 ?auto_16412 ) ) ( not ( = ?auto_16399 ?auto_16413 ) ) ( not ( = ?auto_16399 ?auto_16433 ) ) ( not ( = ?auto_16400 ?auto_16420 ) ) ( not ( = ?auto_16400 ?auto_16435 ) ) ( not ( = ?auto_16400 ?auto_16418 ) ) ( not ( = ?auto_16400 ?auto_16415 ) ) ( not ( = ?auto_16400 ?auto_16411 ) ) ( not ( = ?auto_16400 ?auto_16431 ) ) ( not ( = ?auto_16400 ?auto_16407 ) ) ( not ( = ?auto_16400 ?auto_16414 ) ) ( not ( = ?auto_16400 ?auto_16426 ) ) ( not ( = ?auto_16400 ?auto_16405 ) ) ( not ( = ?auto_16400 ?auto_16428 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_16386 ?auto_16387 ?auto_16388 ?auto_16389 ?auto_16390 ?auto_16391 ?auto_16392 ?auto_16395 ?auto_16394 ?auto_16393 ?auto_16396 ?auto_16397 )
      ( MAKE-1CRATE ?auto_16397 ?auto_16398 )
      ( MAKE-12CRATE-VERIFY ?auto_16386 ?auto_16387 ?auto_16388 ?auto_16389 ?auto_16390 ?auto_16391 ?auto_16392 ?auto_16395 ?auto_16394 ?auto_16393 ?auto_16396 ?auto_16397 ?auto_16398 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16438 - SURFACE
      ?auto_16439 - SURFACE
    )
    :vars
    (
      ?auto_16440 - HOIST
      ?auto_16441 - PLACE
      ?auto_16443 - PLACE
      ?auto_16444 - HOIST
      ?auto_16445 - SURFACE
      ?auto_16442 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16440 ?auto_16441 ) ( SURFACE-AT ?auto_16438 ?auto_16441 ) ( CLEAR ?auto_16438 ) ( IS-CRATE ?auto_16439 ) ( AVAILABLE ?auto_16440 ) ( not ( = ?auto_16443 ?auto_16441 ) ) ( HOIST-AT ?auto_16444 ?auto_16443 ) ( AVAILABLE ?auto_16444 ) ( SURFACE-AT ?auto_16439 ?auto_16443 ) ( ON ?auto_16439 ?auto_16445 ) ( CLEAR ?auto_16439 ) ( TRUCK-AT ?auto_16442 ?auto_16441 ) ( not ( = ?auto_16438 ?auto_16439 ) ) ( not ( = ?auto_16438 ?auto_16445 ) ) ( not ( = ?auto_16439 ?auto_16445 ) ) ( not ( = ?auto_16440 ?auto_16444 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16442 ?auto_16441 ?auto_16443 )
      ( !LIFT ?auto_16444 ?auto_16439 ?auto_16445 ?auto_16443 )
      ( !LOAD ?auto_16444 ?auto_16439 ?auto_16442 ?auto_16443 )
      ( !DRIVE ?auto_16442 ?auto_16443 ?auto_16441 )
      ( !UNLOAD ?auto_16440 ?auto_16439 ?auto_16442 ?auto_16441 )
      ( !DROP ?auto_16440 ?auto_16439 ?auto_16438 ?auto_16441 )
      ( MAKE-1CRATE-VERIFY ?auto_16438 ?auto_16439 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_16460 - SURFACE
      ?auto_16461 - SURFACE
      ?auto_16462 - SURFACE
      ?auto_16463 - SURFACE
      ?auto_16464 - SURFACE
      ?auto_16465 - SURFACE
      ?auto_16466 - SURFACE
      ?auto_16469 - SURFACE
      ?auto_16468 - SURFACE
      ?auto_16467 - SURFACE
      ?auto_16470 - SURFACE
      ?auto_16471 - SURFACE
      ?auto_16472 - SURFACE
      ?auto_16473 - SURFACE
    )
    :vars
    (
      ?auto_16475 - HOIST
      ?auto_16477 - PLACE
      ?auto_16476 - PLACE
      ?auto_16479 - HOIST
      ?auto_16474 - SURFACE
      ?auto_16481 - PLACE
      ?auto_16488 - HOIST
      ?auto_16489 - SURFACE
      ?auto_16482 - PLACE
      ?auto_16499 - HOIST
      ?auto_16502 - SURFACE
      ?auto_16495 - PLACE
      ?auto_16487 - HOIST
      ?auto_16496 - SURFACE
      ?auto_16511 - SURFACE
      ?auto_16493 - PLACE
      ?auto_16485 - HOIST
      ?auto_16504 - SURFACE
      ?auto_16509 - PLACE
      ?auto_16491 - HOIST
      ?auto_16483 - SURFACE
      ?auto_16510 - PLACE
      ?auto_16484 - HOIST
      ?auto_16503 - SURFACE
      ?auto_16498 - PLACE
      ?auto_16494 - HOIST
      ?auto_16490 - SURFACE
      ?auto_16506 - PLACE
      ?auto_16507 - HOIST
      ?auto_16492 - SURFACE
      ?auto_16513 - PLACE
      ?auto_16505 - HOIST
      ?auto_16480 - SURFACE
      ?auto_16486 - PLACE
      ?auto_16501 - HOIST
      ?auto_16512 - SURFACE
      ?auto_16500 - PLACE
      ?auto_16497 - HOIST
      ?auto_16508 - SURFACE
      ?auto_16478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16475 ?auto_16477 ) ( IS-CRATE ?auto_16473 ) ( not ( = ?auto_16476 ?auto_16477 ) ) ( HOIST-AT ?auto_16479 ?auto_16476 ) ( AVAILABLE ?auto_16479 ) ( SURFACE-AT ?auto_16473 ?auto_16476 ) ( ON ?auto_16473 ?auto_16474 ) ( CLEAR ?auto_16473 ) ( not ( = ?auto_16472 ?auto_16473 ) ) ( not ( = ?auto_16472 ?auto_16474 ) ) ( not ( = ?auto_16473 ?auto_16474 ) ) ( not ( = ?auto_16475 ?auto_16479 ) ) ( IS-CRATE ?auto_16472 ) ( not ( = ?auto_16481 ?auto_16477 ) ) ( HOIST-AT ?auto_16488 ?auto_16481 ) ( AVAILABLE ?auto_16488 ) ( SURFACE-AT ?auto_16472 ?auto_16481 ) ( ON ?auto_16472 ?auto_16489 ) ( CLEAR ?auto_16472 ) ( not ( = ?auto_16471 ?auto_16472 ) ) ( not ( = ?auto_16471 ?auto_16489 ) ) ( not ( = ?auto_16472 ?auto_16489 ) ) ( not ( = ?auto_16475 ?auto_16488 ) ) ( IS-CRATE ?auto_16471 ) ( not ( = ?auto_16482 ?auto_16477 ) ) ( HOIST-AT ?auto_16499 ?auto_16482 ) ( AVAILABLE ?auto_16499 ) ( SURFACE-AT ?auto_16471 ?auto_16482 ) ( ON ?auto_16471 ?auto_16502 ) ( CLEAR ?auto_16471 ) ( not ( = ?auto_16470 ?auto_16471 ) ) ( not ( = ?auto_16470 ?auto_16502 ) ) ( not ( = ?auto_16471 ?auto_16502 ) ) ( not ( = ?auto_16475 ?auto_16499 ) ) ( IS-CRATE ?auto_16470 ) ( not ( = ?auto_16495 ?auto_16477 ) ) ( HOIST-AT ?auto_16487 ?auto_16495 ) ( SURFACE-AT ?auto_16470 ?auto_16495 ) ( ON ?auto_16470 ?auto_16496 ) ( CLEAR ?auto_16470 ) ( not ( = ?auto_16467 ?auto_16470 ) ) ( not ( = ?auto_16467 ?auto_16496 ) ) ( not ( = ?auto_16470 ?auto_16496 ) ) ( not ( = ?auto_16475 ?auto_16487 ) ) ( IS-CRATE ?auto_16467 ) ( AVAILABLE ?auto_16487 ) ( SURFACE-AT ?auto_16467 ?auto_16495 ) ( ON ?auto_16467 ?auto_16511 ) ( CLEAR ?auto_16467 ) ( not ( = ?auto_16468 ?auto_16467 ) ) ( not ( = ?auto_16468 ?auto_16511 ) ) ( not ( = ?auto_16467 ?auto_16511 ) ) ( IS-CRATE ?auto_16468 ) ( not ( = ?auto_16493 ?auto_16477 ) ) ( HOIST-AT ?auto_16485 ?auto_16493 ) ( AVAILABLE ?auto_16485 ) ( SURFACE-AT ?auto_16468 ?auto_16493 ) ( ON ?auto_16468 ?auto_16504 ) ( CLEAR ?auto_16468 ) ( not ( = ?auto_16469 ?auto_16468 ) ) ( not ( = ?auto_16469 ?auto_16504 ) ) ( not ( = ?auto_16468 ?auto_16504 ) ) ( not ( = ?auto_16475 ?auto_16485 ) ) ( IS-CRATE ?auto_16469 ) ( not ( = ?auto_16509 ?auto_16477 ) ) ( HOIST-AT ?auto_16491 ?auto_16509 ) ( AVAILABLE ?auto_16491 ) ( SURFACE-AT ?auto_16469 ?auto_16509 ) ( ON ?auto_16469 ?auto_16483 ) ( CLEAR ?auto_16469 ) ( not ( = ?auto_16466 ?auto_16469 ) ) ( not ( = ?auto_16466 ?auto_16483 ) ) ( not ( = ?auto_16469 ?auto_16483 ) ) ( not ( = ?auto_16475 ?auto_16491 ) ) ( IS-CRATE ?auto_16466 ) ( not ( = ?auto_16510 ?auto_16477 ) ) ( HOIST-AT ?auto_16484 ?auto_16510 ) ( AVAILABLE ?auto_16484 ) ( SURFACE-AT ?auto_16466 ?auto_16510 ) ( ON ?auto_16466 ?auto_16503 ) ( CLEAR ?auto_16466 ) ( not ( = ?auto_16465 ?auto_16466 ) ) ( not ( = ?auto_16465 ?auto_16503 ) ) ( not ( = ?auto_16466 ?auto_16503 ) ) ( not ( = ?auto_16475 ?auto_16484 ) ) ( IS-CRATE ?auto_16465 ) ( not ( = ?auto_16498 ?auto_16477 ) ) ( HOIST-AT ?auto_16494 ?auto_16498 ) ( AVAILABLE ?auto_16494 ) ( SURFACE-AT ?auto_16465 ?auto_16498 ) ( ON ?auto_16465 ?auto_16490 ) ( CLEAR ?auto_16465 ) ( not ( = ?auto_16464 ?auto_16465 ) ) ( not ( = ?auto_16464 ?auto_16490 ) ) ( not ( = ?auto_16465 ?auto_16490 ) ) ( not ( = ?auto_16475 ?auto_16494 ) ) ( IS-CRATE ?auto_16464 ) ( not ( = ?auto_16506 ?auto_16477 ) ) ( HOIST-AT ?auto_16507 ?auto_16506 ) ( AVAILABLE ?auto_16507 ) ( SURFACE-AT ?auto_16464 ?auto_16506 ) ( ON ?auto_16464 ?auto_16492 ) ( CLEAR ?auto_16464 ) ( not ( = ?auto_16463 ?auto_16464 ) ) ( not ( = ?auto_16463 ?auto_16492 ) ) ( not ( = ?auto_16464 ?auto_16492 ) ) ( not ( = ?auto_16475 ?auto_16507 ) ) ( IS-CRATE ?auto_16463 ) ( not ( = ?auto_16513 ?auto_16477 ) ) ( HOIST-AT ?auto_16505 ?auto_16513 ) ( AVAILABLE ?auto_16505 ) ( SURFACE-AT ?auto_16463 ?auto_16513 ) ( ON ?auto_16463 ?auto_16480 ) ( CLEAR ?auto_16463 ) ( not ( = ?auto_16462 ?auto_16463 ) ) ( not ( = ?auto_16462 ?auto_16480 ) ) ( not ( = ?auto_16463 ?auto_16480 ) ) ( not ( = ?auto_16475 ?auto_16505 ) ) ( IS-CRATE ?auto_16462 ) ( not ( = ?auto_16486 ?auto_16477 ) ) ( HOIST-AT ?auto_16501 ?auto_16486 ) ( AVAILABLE ?auto_16501 ) ( SURFACE-AT ?auto_16462 ?auto_16486 ) ( ON ?auto_16462 ?auto_16512 ) ( CLEAR ?auto_16462 ) ( not ( = ?auto_16461 ?auto_16462 ) ) ( not ( = ?auto_16461 ?auto_16512 ) ) ( not ( = ?auto_16462 ?auto_16512 ) ) ( not ( = ?auto_16475 ?auto_16501 ) ) ( SURFACE-AT ?auto_16460 ?auto_16477 ) ( CLEAR ?auto_16460 ) ( IS-CRATE ?auto_16461 ) ( AVAILABLE ?auto_16475 ) ( not ( = ?auto_16500 ?auto_16477 ) ) ( HOIST-AT ?auto_16497 ?auto_16500 ) ( AVAILABLE ?auto_16497 ) ( SURFACE-AT ?auto_16461 ?auto_16500 ) ( ON ?auto_16461 ?auto_16508 ) ( CLEAR ?auto_16461 ) ( TRUCK-AT ?auto_16478 ?auto_16477 ) ( not ( = ?auto_16460 ?auto_16461 ) ) ( not ( = ?auto_16460 ?auto_16508 ) ) ( not ( = ?auto_16461 ?auto_16508 ) ) ( not ( = ?auto_16475 ?auto_16497 ) ) ( not ( = ?auto_16460 ?auto_16462 ) ) ( not ( = ?auto_16460 ?auto_16512 ) ) ( not ( = ?auto_16462 ?auto_16508 ) ) ( not ( = ?auto_16486 ?auto_16500 ) ) ( not ( = ?auto_16501 ?auto_16497 ) ) ( not ( = ?auto_16512 ?auto_16508 ) ) ( not ( = ?auto_16460 ?auto_16463 ) ) ( not ( = ?auto_16460 ?auto_16480 ) ) ( not ( = ?auto_16461 ?auto_16463 ) ) ( not ( = ?auto_16461 ?auto_16480 ) ) ( not ( = ?auto_16463 ?auto_16512 ) ) ( not ( = ?auto_16463 ?auto_16508 ) ) ( not ( = ?auto_16513 ?auto_16486 ) ) ( not ( = ?auto_16513 ?auto_16500 ) ) ( not ( = ?auto_16505 ?auto_16501 ) ) ( not ( = ?auto_16505 ?auto_16497 ) ) ( not ( = ?auto_16480 ?auto_16512 ) ) ( not ( = ?auto_16480 ?auto_16508 ) ) ( not ( = ?auto_16460 ?auto_16464 ) ) ( not ( = ?auto_16460 ?auto_16492 ) ) ( not ( = ?auto_16461 ?auto_16464 ) ) ( not ( = ?auto_16461 ?auto_16492 ) ) ( not ( = ?auto_16462 ?auto_16464 ) ) ( not ( = ?auto_16462 ?auto_16492 ) ) ( not ( = ?auto_16464 ?auto_16480 ) ) ( not ( = ?auto_16464 ?auto_16512 ) ) ( not ( = ?auto_16464 ?auto_16508 ) ) ( not ( = ?auto_16506 ?auto_16513 ) ) ( not ( = ?auto_16506 ?auto_16486 ) ) ( not ( = ?auto_16506 ?auto_16500 ) ) ( not ( = ?auto_16507 ?auto_16505 ) ) ( not ( = ?auto_16507 ?auto_16501 ) ) ( not ( = ?auto_16507 ?auto_16497 ) ) ( not ( = ?auto_16492 ?auto_16480 ) ) ( not ( = ?auto_16492 ?auto_16512 ) ) ( not ( = ?auto_16492 ?auto_16508 ) ) ( not ( = ?auto_16460 ?auto_16465 ) ) ( not ( = ?auto_16460 ?auto_16490 ) ) ( not ( = ?auto_16461 ?auto_16465 ) ) ( not ( = ?auto_16461 ?auto_16490 ) ) ( not ( = ?auto_16462 ?auto_16465 ) ) ( not ( = ?auto_16462 ?auto_16490 ) ) ( not ( = ?auto_16463 ?auto_16465 ) ) ( not ( = ?auto_16463 ?auto_16490 ) ) ( not ( = ?auto_16465 ?auto_16492 ) ) ( not ( = ?auto_16465 ?auto_16480 ) ) ( not ( = ?auto_16465 ?auto_16512 ) ) ( not ( = ?auto_16465 ?auto_16508 ) ) ( not ( = ?auto_16498 ?auto_16506 ) ) ( not ( = ?auto_16498 ?auto_16513 ) ) ( not ( = ?auto_16498 ?auto_16486 ) ) ( not ( = ?auto_16498 ?auto_16500 ) ) ( not ( = ?auto_16494 ?auto_16507 ) ) ( not ( = ?auto_16494 ?auto_16505 ) ) ( not ( = ?auto_16494 ?auto_16501 ) ) ( not ( = ?auto_16494 ?auto_16497 ) ) ( not ( = ?auto_16490 ?auto_16492 ) ) ( not ( = ?auto_16490 ?auto_16480 ) ) ( not ( = ?auto_16490 ?auto_16512 ) ) ( not ( = ?auto_16490 ?auto_16508 ) ) ( not ( = ?auto_16460 ?auto_16466 ) ) ( not ( = ?auto_16460 ?auto_16503 ) ) ( not ( = ?auto_16461 ?auto_16466 ) ) ( not ( = ?auto_16461 ?auto_16503 ) ) ( not ( = ?auto_16462 ?auto_16466 ) ) ( not ( = ?auto_16462 ?auto_16503 ) ) ( not ( = ?auto_16463 ?auto_16466 ) ) ( not ( = ?auto_16463 ?auto_16503 ) ) ( not ( = ?auto_16464 ?auto_16466 ) ) ( not ( = ?auto_16464 ?auto_16503 ) ) ( not ( = ?auto_16466 ?auto_16490 ) ) ( not ( = ?auto_16466 ?auto_16492 ) ) ( not ( = ?auto_16466 ?auto_16480 ) ) ( not ( = ?auto_16466 ?auto_16512 ) ) ( not ( = ?auto_16466 ?auto_16508 ) ) ( not ( = ?auto_16510 ?auto_16498 ) ) ( not ( = ?auto_16510 ?auto_16506 ) ) ( not ( = ?auto_16510 ?auto_16513 ) ) ( not ( = ?auto_16510 ?auto_16486 ) ) ( not ( = ?auto_16510 ?auto_16500 ) ) ( not ( = ?auto_16484 ?auto_16494 ) ) ( not ( = ?auto_16484 ?auto_16507 ) ) ( not ( = ?auto_16484 ?auto_16505 ) ) ( not ( = ?auto_16484 ?auto_16501 ) ) ( not ( = ?auto_16484 ?auto_16497 ) ) ( not ( = ?auto_16503 ?auto_16490 ) ) ( not ( = ?auto_16503 ?auto_16492 ) ) ( not ( = ?auto_16503 ?auto_16480 ) ) ( not ( = ?auto_16503 ?auto_16512 ) ) ( not ( = ?auto_16503 ?auto_16508 ) ) ( not ( = ?auto_16460 ?auto_16469 ) ) ( not ( = ?auto_16460 ?auto_16483 ) ) ( not ( = ?auto_16461 ?auto_16469 ) ) ( not ( = ?auto_16461 ?auto_16483 ) ) ( not ( = ?auto_16462 ?auto_16469 ) ) ( not ( = ?auto_16462 ?auto_16483 ) ) ( not ( = ?auto_16463 ?auto_16469 ) ) ( not ( = ?auto_16463 ?auto_16483 ) ) ( not ( = ?auto_16464 ?auto_16469 ) ) ( not ( = ?auto_16464 ?auto_16483 ) ) ( not ( = ?auto_16465 ?auto_16469 ) ) ( not ( = ?auto_16465 ?auto_16483 ) ) ( not ( = ?auto_16469 ?auto_16503 ) ) ( not ( = ?auto_16469 ?auto_16490 ) ) ( not ( = ?auto_16469 ?auto_16492 ) ) ( not ( = ?auto_16469 ?auto_16480 ) ) ( not ( = ?auto_16469 ?auto_16512 ) ) ( not ( = ?auto_16469 ?auto_16508 ) ) ( not ( = ?auto_16509 ?auto_16510 ) ) ( not ( = ?auto_16509 ?auto_16498 ) ) ( not ( = ?auto_16509 ?auto_16506 ) ) ( not ( = ?auto_16509 ?auto_16513 ) ) ( not ( = ?auto_16509 ?auto_16486 ) ) ( not ( = ?auto_16509 ?auto_16500 ) ) ( not ( = ?auto_16491 ?auto_16484 ) ) ( not ( = ?auto_16491 ?auto_16494 ) ) ( not ( = ?auto_16491 ?auto_16507 ) ) ( not ( = ?auto_16491 ?auto_16505 ) ) ( not ( = ?auto_16491 ?auto_16501 ) ) ( not ( = ?auto_16491 ?auto_16497 ) ) ( not ( = ?auto_16483 ?auto_16503 ) ) ( not ( = ?auto_16483 ?auto_16490 ) ) ( not ( = ?auto_16483 ?auto_16492 ) ) ( not ( = ?auto_16483 ?auto_16480 ) ) ( not ( = ?auto_16483 ?auto_16512 ) ) ( not ( = ?auto_16483 ?auto_16508 ) ) ( not ( = ?auto_16460 ?auto_16468 ) ) ( not ( = ?auto_16460 ?auto_16504 ) ) ( not ( = ?auto_16461 ?auto_16468 ) ) ( not ( = ?auto_16461 ?auto_16504 ) ) ( not ( = ?auto_16462 ?auto_16468 ) ) ( not ( = ?auto_16462 ?auto_16504 ) ) ( not ( = ?auto_16463 ?auto_16468 ) ) ( not ( = ?auto_16463 ?auto_16504 ) ) ( not ( = ?auto_16464 ?auto_16468 ) ) ( not ( = ?auto_16464 ?auto_16504 ) ) ( not ( = ?auto_16465 ?auto_16468 ) ) ( not ( = ?auto_16465 ?auto_16504 ) ) ( not ( = ?auto_16466 ?auto_16468 ) ) ( not ( = ?auto_16466 ?auto_16504 ) ) ( not ( = ?auto_16468 ?auto_16483 ) ) ( not ( = ?auto_16468 ?auto_16503 ) ) ( not ( = ?auto_16468 ?auto_16490 ) ) ( not ( = ?auto_16468 ?auto_16492 ) ) ( not ( = ?auto_16468 ?auto_16480 ) ) ( not ( = ?auto_16468 ?auto_16512 ) ) ( not ( = ?auto_16468 ?auto_16508 ) ) ( not ( = ?auto_16493 ?auto_16509 ) ) ( not ( = ?auto_16493 ?auto_16510 ) ) ( not ( = ?auto_16493 ?auto_16498 ) ) ( not ( = ?auto_16493 ?auto_16506 ) ) ( not ( = ?auto_16493 ?auto_16513 ) ) ( not ( = ?auto_16493 ?auto_16486 ) ) ( not ( = ?auto_16493 ?auto_16500 ) ) ( not ( = ?auto_16485 ?auto_16491 ) ) ( not ( = ?auto_16485 ?auto_16484 ) ) ( not ( = ?auto_16485 ?auto_16494 ) ) ( not ( = ?auto_16485 ?auto_16507 ) ) ( not ( = ?auto_16485 ?auto_16505 ) ) ( not ( = ?auto_16485 ?auto_16501 ) ) ( not ( = ?auto_16485 ?auto_16497 ) ) ( not ( = ?auto_16504 ?auto_16483 ) ) ( not ( = ?auto_16504 ?auto_16503 ) ) ( not ( = ?auto_16504 ?auto_16490 ) ) ( not ( = ?auto_16504 ?auto_16492 ) ) ( not ( = ?auto_16504 ?auto_16480 ) ) ( not ( = ?auto_16504 ?auto_16512 ) ) ( not ( = ?auto_16504 ?auto_16508 ) ) ( not ( = ?auto_16460 ?auto_16467 ) ) ( not ( = ?auto_16460 ?auto_16511 ) ) ( not ( = ?auto_16461 ?auto_16467 ) ) ( not ( = ?auto_16461 ?auto_16511 ) ) ( not ( = ?auto_16462 ?auto_16467 ) ) ( not ( = ?auto_16462 ?auto_16511 ) ) ( not ( = ?auto_16463 ?auto_16467 ) ) ( not ( = ?auto_16463 ?auto_16511 ) ) ( not ( = ?auto_16464 ?auto_16467 ) ) ( not ( = ?auto_16464 ?auto_16511 ) ) ( not ( = ?auto_16465 ?auto_16467 ) ) ( not ( = ?auto_16465 ?auto_16511 ) ) ( not ( = ?auto_16466 ?auto_16467 ) ) ( not ( = ?auto_16466 ?auto_16511 ) ) ( not ( = ?auto_16469 ?auto_16467 ) ) ( not ( = ?auto_16469 ?auto_16511 ) ) ( not ( = ?auto_16467 ?auto_16504 ) ) ( not ( = ?auto_16467 ?auto_16483 ) ) ( not ( = ?auto_16467 ?auto_16503 ) ) ( not ( = ?auto_16467 ?auto_16490 ) ) ( not ( = ?auto_16467 ?auto_16492 ) ) ( not ( = ?auto_16467 ?auto_16480 ) ) ( not ( = ?auto_16467 ?auto_16512 ) ) ( not ( = ?auto_16467 ?auto_16508 ) ) ( not ( = ?auto_16495 ?auto_16493 ) ) ( not ( = ?auto_16495 ?auto_16509 ) ) ( not ( = ?auto_16495 ?auto_16510 ) ) ( not ( = ?auto_16495 ?auto_16498 ) ) ( not ( = ?auto_16495 ?auto_16506 ) ) ( not ( = ?auto_16495 ?auto_16513 ) ) ( not ( = ?auto_16495 ?auto_16486 ) ) ( not ( = ?auto_16495 ?auto_16500 ) ) ( not ( = ?auto_16487 ?auto_16485 ) ) ( not ( = ?auto_16487 ?auto_16491 ) ) ( not ( = ?auto_16487 ?auto_16484 ) ) ( not ( = ?auto_16487 ?auto_16494 ) ) ( not ( = ?auto_16487 ?auto_16507 ) ) ( not ( = ?auto_16487 ?auto_16505 ) ) ( not ( = ?auto_16487 ?auto_16501 ) ) ( not ( = ?auto_16487 ?auto_16497 ) ) ( not ( = ?auto_16511 ?auto_16504 ) ) ( not ( = ?auto_16511 ?auto_16483 ) ) ( not ( = ?auto_16511 ?auto_16503 ) ) ( not ( = ?auto_16511 ?auto_16490 ) ) ( not ( = ?auto_16511 ?auto_16492 ) ) ( not ( = ?auto_16511 ?auto_16480 ) ) ( not ( = ?auto_16511 ?auto_16512 ) ) ( not ( = ?auto_16511 ?auto_16508 ) ) ( not ( = ?auto_16460 ?auto_16470 ) ) ( not ( = ?auto_16460 ?auto_16496 ) ) ( not ( = ?auto_16461 ?auto_16470 ) ) ( not ( = ?auto_16461 ?auto_16496 ) ) ( not ( = ?auto_16462 ?auto_16470 ) ) ( not ( = ?auto_16462 ?auto_16496 ) ) ( not ( = ?auto_16463 ?auto_16470 ) ) ( not ( = ?auto_16463 ?auto_16496 ) ) ( not ( = ?auto_16464 ?auto_16470 ) ) ( not ( = ?auto_16464 ?auto_16496 ) ) ( not ( = ?auto_16465 ?auto_16470 ) ) ( not ( = ?auto_16465 ?auto_16496 ) ) ( not ( = ?auto_16466 ?auto_16470 ) ) ( not ( = ?auto_16466 ?auto_16496 ) ) ( not ( = ?auto_16469 ?auto_16470 ) ) ( not ( = ?auto_16469 ?auto_16496 ) ) ( not ( = ?auto_16468 ?auto_16470 ) ) ( not ( = ?auto_16468 ?auto_16496 ) ) ( not ( = ?auto_16470 ?auto_16511 ) ) ( not ( = ?auto_16470 ?auto_16504 ) ) ( not ( = ?auto_16470 ?auto_16483 ) ) ( not ( = ?auto_16470 ?auto_16503 ) ) ( not ( = ?auto_16470 ?auto_16490 ) ) ( not ( = ?auto_16470 ?auto_16492 ) ) ( not ( = ?auto_16470 ?auto_16480 ) ) ( not ( = ?auto_16470 ?auto_16512 ) ) ( not ( = ?auto_16470 ?auto_16508 ) ) ( not ( = ?auto_16496 ?auto_16511 ) ) ( not ( = ?auto_16496 ?auto_16504 ) ) ( not ( = ?auto_16496 ?auto_16483 ) ) ( not ( = ?auto_16496 ?auto_16503 ) ) ( not ( = ?auto_16496 ?auto_16490 ) ) ( not ( = ?auto_16496 ?auto_16492 ) ) ( not ( = ?auto_16496 ?auto_16480 ) ) ( not ( = ?auto_16496 ?auto_16512 ) ) ( not ( = ?auto_16496 ?auto_16508 ) ) ( not ( = ?auto_16460 ?auto_16471 ) ) ( not ( = ?auto_16460 ?auto_16502 ) ) ( not ( = ?auto_16461 ?auto_16471 ) ) ( not ( = ?auto_16461 ?auto_16502 ) ) ( not ( = ?auto_16462 ?auto_16471 ) ) ( not ( = ?auto_16462 ?auto_16502 ) ) ( not ( = ?auto_16463 ?auto_16471 ) ) ( not ( = ?auto_16463 ?auto_16502 ) ) ( not ( = ?auto_16464 ?auto_16471 ) ) ( not ( = ?auto_16464 ?auto_16502 ) ) ( not ( = ?auto_16465 ?auto_16471 ) ) ( not ( = ?auto_16465 ?auto_16502 ) ) ( not ( = ?auto_16466 ?auto_16471 ) ) ( not ( = ?auto_16466 ?auto_16502 ) ) ( not ( = ?auto_16469 ?auto_16471 ) ) ( not ( = ?auto_16469 ?auto_16502 ) ) ( not ( = ?auto_16468 ?auto_16471 ) ) ( not ( = ?auto_16468 ?auto_16502 ) ) ( not ( = ?auto_16467 ?auto_16471 ) ) ( not ( = ?auto_16467 ?auto_16502 ) ) ( not ( = ?auto_16471 ?auto_16496 ) ) ( not ( = ?auto_16471 ?auto_16511 ) ) ( not ( = ?auto_16471 ?auto_16504 ) ) ( not ( = ?auto_16471 ?auto_16483 ) ) ( not ( = ?auto_16471 ?auto_16503 ) ) ( not ( = ?auto_16471 ?auto_16490 ) ) ( not ( = ?auto_16471 ?auto_16492 ) ) ( not ( = ?auto_16471 ?auto_16480 ) ) ( not ( = ?auto_16471 ?auto_16512 ) ) ( not ( = ?auto_16471 ?auto_16508 ) ) ( not ( = ?auto_16482 ?auto_16495 ) ) ( not ( = ?auto_16482 ?auto_16493 ) ) ( not ( = ?auto_16482 ?auto_16509 ) ) ( not ( = ?auto_16482 ?auto_16510 ) ) ( not ( = ?auto_16482 ?auto_16498 ) ) ( not ( = ?auto_16482 ?auto_16506 ) ) ( not ( = ?auto_16482 ?auto_16513 ) ) ( not ( = ?auto_16482 ?auto_16486 ) ) ( not ( = ?auto_16482 ?auto_16500 ) ) ( not ( = ?auto_16499 ?auto_16487 ) ) ( not ( = ?auto_16499 ?auto_16485 ) ) ( not ( = ?auto_16499 ?auto_16491 ) ) ( not ( = ?auto_16499 ?auto_16484 ) ) ( not ( = ?auto_16499 ?auto_16494 ) ) ( not ( = ?auto_16499 ?auto_16507 ) ) ( not ( = ?auto_16499 ?auto_16505 ) ) ( not ( = ?auto_16499 ?auto_16501 ) ) ( not ( = ?auto_16499 ?auto_16497 ) ) ( not ( = ?auto_16502 ?auto_16496 ) ) ( not ( = ?auto_16502 ?auto_16511 ) ) ( not ( = ?auto_16502 ?auto_16504 ) ) ( not ( = ?auto_16502 ?auto_16483 ) ) ( not ( = ?auto_16502 ?auto_16503 ) ) ( not ( = ?auto_16502 ?auto_16490 ) ) ( not ( = ?auto_16502 ?auto_16492 ) ) ( not ( = ?auto_16502 ?auto_16480 ) ) ( not ( = ?auto_16502 ?auto_16512 ) ) ( not ( = ?auto_16502 ?auto_16508 ) ) ( not ( = ?auto_16460 ?auto_16472 ) ) ( not ( = ?auto_16460 ?auto_16489 ) ) ( not ( = ?auto_16461 ?auto_16472 ) ) ( not ( = ?auto_16461 ?auto_16489 ) ) ( not ( = ?auto_16462 ?auto_16472 ) ) ( not ( = ?auto_16462 ?auto_16489 ) ) ( not ( = ?auto_16463 ?auto_16472 ) ) ( not ( = ?auto_16463 ?auto_16489 ) ) ( not ( = ?auto_16464 ?auto_16472 ) ) ( not ( = ?auto_16464 ?auto_16489 ) ) ( not ( = ?auto_16465 ?auto_16472 ) ) ( not ( = ?auto_16465 ?auto_16489 ) ) ( not ( = ?auto_16466 ?auto_16472 ) ) ( not ( = ?auto_16466 ?auto_16489 ) ) ( not ( = ?auto_16469 ?auto_16472 ) ) ( not ( = ?auto_16469 ?auto_16489 ) ) ( not ( = ?auto_16468 ?auto_16472 ) ) ( not ( = ?auto_16468 ?auto_16489 ) ) ( not ( = ?auto_16467 ?auto_16472 ) ) ( not ( = ?auto_16467 ?auto_16489 ) ) ( not ( = ?auto_16470 ?auto_16472 ) ) ( not ( = ?auto_16470 ?auto_16489 ) ) ( not ( = ?auto_16472 ?auto_16502 ) ) ( not ( = ?auto_16472 ?auto_16496 ) ) ( not ( = ?auto_16472 ?auto_16511 ) ) ( not ( = ?auto_16472 ?auto_16504 ) ) ( not ( = ?auto_16472 ?auto_16483 ) ) ( not ( = ?auto_16472 ?auto_16503 ) ) ( not ( = ?auto_16472 ?auto_16490 ) ) ( not ( = ?auto_16472 ?auto_16492 ) ) ( not ( = ?auto_16472 ?auto_16480 ) ) ( not ( = ?auto_16472 ?auto_16512 ) ) ( not ( = ?auto_16472 ?auto_16508 ) ) ( not ( = ?auto_16481 ?auto_16482 ) ) ( not ( = ?auto_16481 ?auto_16495 ) ) ( not ( = ?auto_16481 ?auto_16493 ) ) ( not ( = ?auto_16481 ?auto_16509 ) ) ( not ( = ?auto_16481 ?auto_16510 ) ) ( not ( = ?auto_16481 ?auto_16498 ) ) ( not ( = ?auto_16481 ?auto_16506 ) ) ( not ( = ?auto_16481 ?auto_16513 ) ) ( not ( = ?auto_16481 ?auto_16486 ) ) ( not ( = ?auto_16481 ?auto_16500 ) ) ( not ( = ?auto_16488 ?auto_16499 ) ) ( not ( = ?auto_16488 ?auto_16487 ) ) ( not ( = ?auto_16488 ?auto_16485 ) ) ( not ( = ?auto_16488 ?auto_16491 ) ) ( not ( = ?auto_16488 ?auto_16484 ) ) ( not ( = ?auto_16488 ?auto_16494 ) ) ( not ( = ?auto_16488 ?auto_16507 ) ) ( not ( = ?auto_16488 ?auto_16505 ) ) ( not ( = ?auto_16488 ?auto_16501 ) ) ( not ( = ?auto_16488 ?auto_16497 ) ) ( not ( = ?auto_16489 ?auto_16502 ) ) ( not ( = ?auto_16489 ?auto_16496 ) ) ( not ( = ?auto_16489 ?auto_16511 ) ) ( not ( = ?auto_16489 ?auto_16504 ) ) ( not ( = ?auto_16489 ?auto_16483 ) ) ( not ( = ?auto_16489 ?auto_16503 ) ) ( not ( = ?auto_16489 ?auto_16490 ) ) ( not ( = ?auto_16489 ?auto_16492 ) ) ( not ( = ?auto_16489 ?auto_16480 ) ) ( not ( = ?auto_16489 ?auto_16512 ) ) ( not ( = ?auto_16489 ?auto_16508 ) ) ( not ( = ?auto_16460 ?auto_16473 ) ) ( not ( = ?auto_16460 ?auto_16474 ) ) ( not ( = ?auto_16461 ?auto_16473 ) ) ( not ( = ?auto_16461 ?auto_16474 ) ) ( not ( = ?auto_16462 ?auto_16473 ) ) ( not ( = ?auto_16462 ?auto_16474 ) ) ( not ( = ?auto_16463 ?auto_16473 ) ) ( not ( = ?auto_16463 ?auto_16474 ) ) ( not ( = ?auto_16464 ?auto_16473 ) ) ( not ( = ?auto_16464 ?auto_16474 ) ) ( not ( = ?auto_16465 ?auto_16473 ) ) ( not ( = ?auto_16465 ?auto_16474 ) ) ( not ( = ?auto_16466 ?auto_16473 ) ) ( not ( = ?auto_16466 ?auto_16474 ) ) ( not ( = ?auto_16469 ?auto_16473 ) ) ( not ( = ?auto_16469 ?auto_16474 ) ) ( not ( = ?auto_16468 ?auto_16473 ) ) ( not ( = ?auto_16468 ?auto_16474 ) ) ( not ( = ?auto_16467 ?auto_16473 ) ) ( not ( = ?auto_16467 ?auto_16474 ) ) ( not ( = ?auto_16470 ?auto_16473 ) ) ( not ( = ?auto_16470 ?auto_16474 ) ) ( not ( = ?auto_16471 ?auto_16473 ) ) ( not ( = ?auto_16471 ?auto_16474 ) ) ( not ( = ?auto_16473 ?auto_16489 ) ) ( not ( = ?auto_16473 ?auto_16502 ) ) ( not ( = ?auto_16473 ?auto_16496 ) ) ( not ( = ?auto_16473 ?auto_16511 ) ) ( not ( = ?auto_16473 ?auto_16504 ) ) ( not ( = ?auto_16473 ?auto_16483 ) ) ( not ( = ?auto_16473 ?auto_16503 ) ) ( not ( = ?auto_16473 ?auto_16490 ) ) ( not ( = ?auto_16473 ?auto_16492 ) ) ( not ( = ?auto_16473 ?auto_16480 ) ) ( not ( = ?auto_16473 ?auto_16512 ) ) ( not ( = ?auto_16473 ?auto_16508 ) ) ( not ( = ?auto_16476 ?auto_16481 ) ) ( not ( = ?auto_16476 ?auto_16482 ) ) ( not ( = ?auto_16476 ?auto_16495 ) ) ( not ( = ?auto_16476 ?auto_16493 ) ) ( not ( = ?auto_16476 ?auto_16509 ) ) ( not ( = ?auto_16476 ?auto_16510 ) ) ( not ( = ?auto_16476 ?auto_16498 ) ) ( not ( = ?auto_16476 ?auto_16506 ) ) ( not ( = ?auto_16476 ?auto_16513 ) ) ( not ( = ?auto_16476 ?auto_16486 ) ) ( not ( = ?auto_16476 ?auto_16500 ) ) ( not ( = ?auto_16479 ?auto_16488 ) ) ( not ( = ?auto_16479 ?auto_16499 ) ) ( not ( = ?auto_16479 ?auto_16487 ) ) ( not ( = ?auto_16479 ?auto_16485 ) ) ( not ( = ?auto_16479 ?auto_16491 ) ) ( not ( = ?auto_16479 ?auto_16484 ) ) ( not ( = ?auto_16479 ?auto_16494 ) ) ( not ( = ?auto_16479 ?auto_16507 ) ) ( not ( = ?auto_16479 ?auto_16505 ) ) ( not ( = ?auto_16479 ?auto_16501 ) ) ( not ( = ?auto_16479 ?auto_16497 ) ) ( not ( = ?auto_16474 ?auto_16489 ) ) ( not ( = ?auto_16474 ?auto_16502 ) ) ( not ( = ?auto_16474 ?auto_16496 ) ) ( not ( = ?auto_16474 ?auto_16511 ) ) ( not ( = ?auto_16474 ?auto_16504 ) ) ( not ( = ?auto_16474 ?auto_16483 ) ) ( not ( = ?auto_16474 ?auto_16503 ) ) ( not ( = ?auto_16474 ?auto_16490 ) ) ( not ( = ?auto_16474 ?auto_16492 ) ) ( not ( = ?auto_16474 ?auto_16480 ) ) ( not ( = ?auto_16474 ?auto_16512 ) ) ( not ( = ?auto_16474 ?auto_16508 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_16460 ?auto_16461 ?auto_16462 ?auto_16463 ?auto_16464 ?auto_16465 ?auto_16466 ?auto_16469 ?auto_16468 ?auto_16467 ?auto_16470 ?auto_16471 ?auto_16472 )
      ( MAKE-1CRATE ?auto_16472 ?auto_16473 )
      ( MAKE-13CRATE-VERIFY ?auto_16460 ?auto_16461 ?auto_16462 ?auto_16463 ?auto_16464 ?auto_16465 ?auto_16466 ?auto_16469 ?auto_16468 ?auto_16467 ?auto_16470 ?auto_16471 ?auto_16472 ?auto_16473 ) )
  )

)

