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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15905 - SURFACE
      ?auto_15906 - SURFACE
      ?auto_15907 - SURFACE
    )
    :vars
    (
      ?auto_15910 - HOIST
      ?auto_15911 - PLACE
      ?auto_15908 - PLACE
      ?auto_15912 - HOIST
      ?auto_15909 - SURFACE
      ?auto_15916 - PLACE
      ?auto_15914 - HOIST
      ?auto_15915 - SURFACE
      ?auto_15913 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15910 ?auto_15911 ) ( IS-CRATE ?auto_15907 ) ( not ( = ?auto_15908 ?auto_15911 ) ) ( HOIST-AT ?auto_15912 ?auto_15908 ) ( AVAILABLE ?auto_15912 ) ( SURFACE-AT ?auto_15907 ?auto_15908 ) ( ON ?auto_15907 ?auto_15909 ) ( CLEAR ?auto_15907 ) ( not ( = ?auto_15906 ?auto_15907 ) ) ( not ( = ?auto_15906 ?auto_15909 ) ) ( not ( = ?auto_15907 ?auto_15909 ) ) ( not ( = ?auto_15910 ?auto_15912 ) ) ( SURFACE-AT ?auto_15905 ?auto_15911 ) ( CLEAR ?auto_15905 ) ( IS-CRATE ?auto_15906 ) ( AVAILABLE ?auto_15910 ) ( not ( = ?auto_15916 ?auto_15911 ) ) ( HOIST-AT ?auto_15914 ?auto_15916 ) ( AVAILABLE ?auto_15914 ) ( SURFACE-AT ?auto_15906 ?auto_15916 ) ( ON ?auto_15906 ?auto_15915 ) ( CLEAR ?auto_15906 ) ( TRUCK-AT ?auto_15913 ?auto_15911 ) ( not ( = ?auto_15905 ?auto_15906 ) ) ( not ( = ?auto_15905 ?auto_15915 ) ) ( not ( = ?auto_15906 ?auto_15915 ) ) ( not ( = ?auto_15910 ?auto_15914 ) ) ( not ( = ?auto_15905 ?auto_15907 ) ) ( not ( = ?auto_15905 ?auto_15909 ) ) ( not ( = ?auto_15907 ?auto_15915 ) ) ( not ( = ?auto_15908 ?auto_15916 ) ) ( not ( = ?auto_15912 ?auto_15914 ) ) ( not ( = ?auto_15909 ?auto_15915 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15905 ?auto_15906 )
      ( MAKE-1CRATE ?auto_15906 ?auto_15907 )
      ( MAKE-2CRATE-VERIFY ?auto_15905 ?auto_15906 ?auto_15907 ) )
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
      ?auto_15939 - HOIST
      ?auto_15935 - PLACE
      ?auto_15936 - PLACE
      ?auto_15938 - HOIST
      ?auto_15937 - SURFACE
      ?auto_15946 - PLACE
      ?auto_15945 - HOIST
      ?auto_15941 - SURFACE
      ?auto_15944 - PLACE
      ?auto_15943 - HOIST
      ?auto_15942 - SURFACE
      ?auto_15940 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15939 ?auto_15935 ) ( IS-CRATE ?auto_15934 ) ( not ( = ?auto_15936 ?auto_15935 ) ) ( HOIST-AT ?auto_15938 ?auto_15936 ) ( AVAILABLE ?auto_15938 ) ( SURFACE-AT ?auto_15934 ?auto_15936 ) ( ON ?auto_15934 ?auto_15937 ) ( CLEAR ?auto_15934 ) ( not ( = ?auto_15933 ?auto_15934 ) ) ( not ( = ?auto_15933 ?auto_15937 ) ) ( not ( = ?auto_15934 ?auto_15937 ) ) ( not ( = ?auto_15939 ?auto_15938 ) ) ( IS-CRATE ?auto_15933 ) ( not ( = ?auto_15946 ?auto_15935 ) ) ( HOIST-AT ?auto_15945 ?auto_15946 ) ( AVAILABLE ?auto_15945 ) ( SURFACE-AT ?auto_15933 ?auto_15946 ) ( ON ?auto_15933 ?auto_15941 ) ( CLEAR ?auto_15933 ) ( not ( = ?auto_15932 ?auto_15933 ) ) ( not ( = ?auto_15932 ?auto_15941 ) ) ( not ( = ?auto_15933 ?auto_15941 ) ) ( not ( = ?auto_15939 ?auto_15945 ) ) ( SURFACE-AT ?auto_15931 ?auto_15935 ) ( CLEAR ?auto_15931 ) ( IS-CRATE ?auto_15932 ) ( AVAILABLE ?auto_15939 ) ( not ( = ?auto_15944 ?auto_15935 ) ) ( HOIST-AT ?auto_15943 ?auto_15944 ) ( AVAILABLE ?auto_15943 ) ( SURFACE-AT ?auto_15932 ?auto_15944 ) ( ON ?auto_15932 ?auto_15942 ) ( CLEAR ?auto_15932 ) ( TRUCK-AT ?auto_15940 ?auto_15935 ) ( not ( = ?auto_15931 ?auto_15932 ) ) ( not ( = ?auto_15931 ?auto_15942 ) ) ( not ( = ?auto_15932 ?auto_15942 ) ) ( not ( = ?auto_15939 ?auto_15943 ) ) ( not ( = ?auto_15931 ?auto_15933 ) ) ( not ( = ?auto_15931 ?auto_15941 ) ) ( not ( = ?auto_15933 ?auto_15942 ) ) ( not ( = ?auto_15946 ?auto_15944 ) ) ( not ( = ?auto_15945 ?auto_15943 ) ) ( not ( = ?auto_15941 ?auto_15942 ) ) ( not ( = ?auto_15931 ?auto_15934 ) ) ( not ( = ?auto_15931 ?auto_15937 ) ) ( not ( = ?auto_15932 ?auto_15934 ) ) ( not ( = ?auto_15932 ?auto_15937 ) ) ( not ( = ?auto_15934 ?auto_15941 ) ) ( not ( = ?auto_15934 ?auto_15942 ) ) ( not ( = ?auto_15936 ?auto_15946 ) ) ( not ( = ?auto_15936 ?auto_15944 ) ) ( not ( = ?auto_15938 ?auto_15945 ) ) ( not ( = ?auto_15938 ?auto_15943 ) ) ( not ( = ?auto_15937 ?auto_15941 ) ) ( not ( = ?auto_15937 ?auto_15942 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15931 ?auto_15932 ?auto_15933 )
      ( MAKE-1CRATE ?auto_15933 ?auto_15934 )
      ( MAKE-3CRATE-VERIFY ?auto_15931 ?auto_15932 ?auto_15933 ?auto_15934 ) )
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
      ?auto_15967 - HOIST
      ?auto_15970 - PLACE
      ?auto_15968 - PLACE
      ?auto_15969 - HOIST
      ?auto_15971 - SURFACE
      ?auto_15978 - PLACE
      ?auto_15977 - HOIST
      ?auto_15979 - SURFACE
      ?auto_15973 - PLACE
      ?auto_15974 - HOIST
      ?auto_15976 - SURFACE
      ?auto_15980 - PLACE
      ?auto_15981 - HOIST
      ?auto_15975 - SURFACE
      ?auto_15972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15967 ?auto_15970 ) ( IS-CRATE ?auto_15966 ) ( not ( = ?auto_15968 ?auto_15970 ) ) ( HOIST-AT ?auto_15969 ?auto_15968 ) ( AVAILABLE ?auto_15969 ) ( SURFACE-AT ?auto_15966 ?auto_15968 ) ( ON ?auto_15966 ?auto_15971 ) ( CLEAR ?auto_15966 ) ( not ( = ?auto_15965 ?auto_15966 ) ) ( not ( = ?auto_15965 ?auto_15971 ) ) ( not ( = ?auto_15966 ?auto_15971 ) ) ( not ( = ?auto_15967 ?auto_15969 ) ) ( IS-CRATE ?auto_15965 ) ( not ( = ?auto_15978 ?auto_15970 ) ) ( HOIST-AT ?auto_15977 ?auto_15978 ) ( AVAILABLE ?auto_15977 ) ( SURFACE-AT ?auto_15965 ?auto_15978 ) ( ON ?auto_15965 ?auto_15979 ) ( CLEAR ?auto_15965 ) ( not ( = ?auto_15964 ?auto_15965 ) ) ( not ( = ?auto_15964 ?auto_15979 ) ) ( not ( = ?auto_15965 ?auto_15979 ) ) ( not ( = ?auto_15967 ?auto_15977 ) ) ( IS-CRATE ?auto_15964 ) ( not ( = ?auto_15973 ?auto_15970 ) ) ( HOIST-AT ?auto_15974 ?auto_15973 ) ( AVAILABLE ?auto_15974 ) ( SURFACE-AT ?auto_15964 ?auto_15973 ) ( ON ?auto_15964 ?auto_15976 ) ( CLEAR ?auto_15964 ) ( not ( = ?auto_15963 ?auto_15964 ) ) ( not ( = ?auto_15963 ?auto_15976 ) ) ( not ( = ?auto_15964 ?auto_15976 ) ) ( not ( = ?auto_15967 ?auto_15974 ) ) ( SURFACE-AT ?auto_15962 ?auto_15970 ) ( CLEAR ?auto_15962 ) ( IS-CRATE ?auto_15963 ) ( AVAILABLE ?auto_15967 ) ( not ( = ?auto_15980 ?auto_15970 ) ) ( HOIST-AT ?auto_15981 ?auto_15980 ) ( AVAILABLE ?auto_15981 ) ( SURFACE-AT ?auto_15963 ?auto_15980 ) ( ON ?auto_15963 ?auto_15975 ) ( CLEAR ?auto_15963 ) ( TRUCK-AT ?auto_15972 ?auto_15970 ) ( not ( = ?auto_15962 ?auto_15963 ) ) ( not ( = ?auto_15962 ?auto_15975 ) ) ( not ( = ?auto_15963 ?auto_15975 ) ) ( not ( = ?auto_15967 ?auto_15981 ) ) ( not ( = ?auto_15962 ?auto_15964 ) ) ( not ( = ?auto_15962 ?auto_15976 ) ) ( not ( = ?auto_15964 ?auto_15975 ) ) ( not ( = ?auto_15973 ?auto_15980 ) ) ( not ( = ?auto_15974 ?auto_15981 ) ) ( not ( = ?auto_15976 ?auto_15975 ) ) ( not ( = ?auto_15962 ?auto_15965 ) ) ( not ( = ?auto_15962 ?auto_15979 ) ) ( not ( = ?auto_15963 ?auto_15965 ) ) ( not ( = ?auto_15963 ?auto_15979 ) ) ( not ( = ?auto_15965 ?auto_15976 ) ) ( not ( = ?auto_15965 ?auto_15975 ) ) ( not ( = ?auto_15978 ?auto_15973 ) ) ( not ( = ?auto_15978 ?auto_15980 ) ) ( not ( = ?auto_15977 ?auto_15974 ) ) ( not ( = ?auto_15977 ?auto_15981 ) ) ( not ( = ?auto_15979 ?auto_15976 ) ) ( not ( = ?auto_15979 ?auto_15975 ) ) ( not ( = ?auto_15962 ?auto_15966 ) ) ( not ( = ?auto_15962 ?auto_15971 ) ) ( not ( = ?auto_15963 ?auto_15966 ) ) ( not ( = ?auto_15963 ?auto_15971 ) ) ( not ( = ?auto_15964 ?auto_15966 ) ) ( not ( = ?auto_15964 ?auto_15971 ) ) ( not ( = ?auto_15966 ?auto_15979 ) ) ( not ( = ?auto_15966 ?auto_15976 ) ) ( not ( = ?auto_15966 ?auto_15975 ) ) ( not ( = ?auto_15968 ?auto_15978 ) ) ( not ( = ?auto_15968 ?auto_15973 ) ) ( not ( = ?auto_15968 ?auto_15980 ) ) ( not ( = ?auto_15969 ?auto_15977 ) ) ( not ( = ?auto_15969 ?auto_15974 ) ) ( not ( = ?auto_15969 ?auto_15981 ) ) ( not ( = ?auto_15971 ?auto_15979 ) ) ( not ( = ?auto_15971 ?auto_15976 ) ) ( not ( = ?auto_15971 ?auto_15975 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_15962 ?auto_15963 ?auto_15964 ?auto_15965 )
      ( MAKE-1CRATE ?auto_15965 ?auto_15966 )
      ( MAKE-4CRATE-VERIFY ?auto_15962 ?auto_15963 ?auto_15964 ?auto_15965 ?auto_15966 ) )
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
      ?auto_16005 - HOIST
      ?auto_16008 - PLACE
      ?auto_16004 - PLACE
      ?auto_16006 - HOIST
      ?auto_16009 - SURFACE
      ?auto_16013 - PLACE
      ?auto_16015 - HOIST
      ?auto_16014 - SURFACE
      ?auto_16010 - PLACE
      ?auto_16011 - HOIST
      ?auto_16017 - SURFACE
      ?auto_16012 - PLACE
      ?auto_16020 - HOIST
      ?auto_16018 - SURFACE
      ?auto_16016 - PLACE
      ?auto_16021 - HOIST
      ?auto_16019 - SURFACE
      ?auto_16007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16005 ?auto_16008 ) ( IS-CRATE ?auto_16003 ) ( not ( = ?auto_16004 ?auto_16008 ) ) ( HOIST-AT ?auto_16006 ?auto_16004 ) ( AVAILABLE ?auto_16006 ) ( SURFACE-AT ?auto_16003 ?auto_16004 ) ( ON ?auto_16003 ?auto_16009 ) ( CLEAR ?auto_16003 ) ( not ( = ?auto_16002 ?auto_16003 ) ) ( not ( = ?auto_16002 ?auto_16009 ) ) ( not ( = ?auto_16003 ?auto_16009 ) ) ( not ( = ?auto_16005 ?auto_16006 ) ) ( IS-CRATE ?auto_16002 ) ( not ( = ?auto_16013 ?auto_16008 ) ) ( HOIST-AT ?auto_16015 ?auto_16013 ) ( AVAILABLE ?auto_16015 ) ( SURFACE-AT ?auto_16002 ?auto_16013 ) ( ON ?auto_16002 ?auto_16014 ) ( CLEAR ?auto_16002 ) ( not ( = ?auto_16001 ?auto_16002 ) ) ( not ( = ?auto_16001 ?auto_16014 ) ) ( not ( = ?auto_16002 ?auto_16014 ) ) ( not ( = ?auto_16005 ?auto_16015 ) ) ( IS-CRATE ?auto_16001 ) ( not ( = ?auto_16010 ?auto_16008 ) ) ( HOIST-AT ?auto_16011 ?auto_16010 ) ( AVAILABLE ?auto_16011 ) ( SURFACE-AT ?auto_16001 ?auto_16010 ) ( ON ?auto_16001 ?auto_16017 ) ( CLEAR ?auto_16001 ) ( not ( = ?auto_16000 ?auto_16001 ) ) ( not ( = ?auto_16000 ?auto_16017 ) ) ( not ( = ?auto_16001 ?auto_16017 ) ) ( not ( = ?auto_16005 ?auto_16011 ) ) ( IS-CRATE ?auto_16000 ) ( not ( = ?auto_16012 ?auto_16008 ) ) ( HOIST-AT ?auto_16020 ?auto_16012 ) ( AVAILABLE ?auto_16020 ) ( SURFACE-AT ?auto_16000 ?auto_16012 ) ( ON ?auto_16000 ?auto_16018 ) ( CLEAR ?auto_16000 ) ( not ( = ?auto_15999 ?auto_16000 ) ) ( not ( = ?auto_15999 ?auto_16018 ) ) ( not ( = ?auto_16000 ?auto_16018 ) ) ( not ( = ?auto_16005 ?auto_16020 ) ) ( SURFACE-AT ?auto_15998 ?auto_16008 ) ( CLEAR ?auto_15998 ) ( IS-CRATE ?auto_15999 ) ( AVAILABLE ?auto_16005 ) ( not ( = ?auto_16016 ?auto_16008 ) ) ( HOIST-AT ?auto_16021 ?auto_16016 ) ( AVAILABLE ?auto_16021 ) ( SURFACE-AT ?auto_15999 ?auto_16016 ) ( ON ?auto_15999 ?auto_16019 ) ( CLEAR ?auto_15999 ) ( TRUCK-AT ?auto_16007 ?auto_16008 ) ( not ( = ?auto_15998 ?auto_15999 ) ) ( not ( = ?auto_15998 ?auto_16019 ) ) ( not ( = ?auto_15999 ?auto_16019 ) ) ( not ( = ?auto_16005 ?auto_16021 ) ) ( not ( = ?auto_15998 ?auto_16000 ) ) ( not ( = ?auto_15998 ?auto_16018 ) ) ( not ( = ?auto_16000 ?auto_16019 ) ) ( not ( = ?auto_16012 ?auto_16016 ) ) ( not ( = ?auto_16020 ?auto_16021 ) ) ( not ( = ?auto_16018 ?auto_16019 ) ) ( not ( = ?auto_15998 ?auto_16001 ) ) ( not ( = ?auto_15998 ?auto_16017 ) ) ( not ( = ?auto_15999 ?auto_16001 ) ) ( not ( = ?auto_15999 ?auto_16017 ) ) ( not ( = ?auto_16001 ?auto_16018 ) ) ( not ( = ?auto_16001 ?auto_16019 ) ) ( not ( = ?auto_16010 ?auto_16012 ) ) ( not ( = ?auto_16010 ?auto_16016 ) ) ( not ( = ?auto_16011 ?auto_16020 ) ) ( not ( = ?auto_16011 ?auto_16021 ) ) ( not ( = ?auto_16017 ?auto_16018 ) ) ( not ( = ?auto_16017 ?auto_16019 ) ) ( not ( = ?auto_15998 ?auto_16002 ) ) ( not ( = ?auto_15998 ?auto_16014 ) ) ( not ( = ?auto_15999 ?auto_16002 ) ) ( not ( = ?auto_15999 ?auto_16014 ) ) ( not ( = ?auto_16000 ?auto_16002 ) ) ( not ( = ?auto_16000 ?auto_16014 ) ) ( not ( = ?auto_16002 ?auto_16017 ) ) ( not ( = ?auto_16002 ?auto_16018 ) ) ( not ( = ?auto_16002 ?auto_16019 ) ) ( not ( = ?auto_16013 ?auto_16010 ) ) ( not ( = ?auto_16013 ?auto_16012 ) ) ( not ( = ?auto_16013 ?auto_16016 ) ) ( not ( = ?auto_16015 ?auto_16011 ) ) ( not ( = ?auto_16015 ?auto_16020 ) ) ( not ( = ?auto_16015 ?auto_16021 ) ) ( not ( = ?auto_16014 ?auto_16017 ) ) ( not ( = ?auto_16014 ?auto_16018 ) ) ( not ( = ?auto_16014 ?auto_16019 ) ) ( not ( = ?auto_15998 ?auto_16003 ) ) ( not ( = ?auto_15998 ?auto_16009 ) ) ( not ( = ?auto_15999 ?auto_16003 ) ) ( not ( = ?auto_15999 ?auto_16009 ) ) ( not ( = ?auto_16000 ?auto_16003 ) ) ( not ( = ?auto_16000 ?auto_16009 ) ) ( not ( = ?auto_16001 ?auto_16003 ) ) ( not ( = ?auto_16001 ?auto_16009 ) ) ( not ( = ?auto_16003 ?auto_16014 ) ) ( not ( = ?auto_16003 ?auto_16017 ) ) ( not ( = ?auto_16003 ?auto_16018 ) ) ( not ( = ?auto_16003 ?auto_16019 ) ) ( not ( = ?auto_16004 ?auto_16013 ) ) ( not ( = ?auto_16004 ?auto_16010 ) ) ( not ( = ?auto_16004 ?auto_16012 ) ) ( not ( = ?auto_16004 ?auto_16016 ) ) ( not ( = ?auto_16006 ?auto_16015 ) ) ( not ( = ?auto_16006 ?auto_16011 ) ) ( not ( = ?auto_16006 ?auto_16020 ) ) ( not ( = ?auto_16006 ?auto_16021 ) ) ( not ( = ?auto_16009 ?auto_16014 ) ) ( not ( = ?auto_16009 ?auto_16017 ) ) ( not ( = ?auto_16009 ?auto_16018 ) ) ( not ( = ?auto_16009 ?auto_16019 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_15998 ?auto_15999 ?auto_16000 ?auto_16001 ?auto_16002 )
      ( MAKE-1CRATE ?auto_16002 ?auto_16003 )
      ( MAKE-5CRATE-VERIFY ?auto_15998 ?auto_15999 ?auto_16000 ?auto_16001 ?auto_16002 ?auto_16003 ) )
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
      ?auto_16049 - HOIST
      ?auto_16051 - PLACE
      ?auto_16046 - PLACE
      ?auto_16048 - HOIST
      ?auto_16047 - SURFACE
      ?auto_16059 - PLACE
      ?auto_16060 - HOIST
      ?auto_16061 - SURFACE
      ?auto_16063 - PLACE
      ?auto_16056 - HOIST
      ?auto_16057 - SURFACE
      ?auto_16064 - PLACE
      ?auto_16052 - HOIST
      ?auto_16054 - SURFACE
      ?auto_16053 - PLACE
      ?auto_16058 - HOIST
      ?auto_16062 - SURFACE
      ?auto_16055 - PLACE
      ?auto_16066 - HOIST
      ?auto_16065 - SURFACE
      ?auto_16050 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16049 ?auto_16051 ) ( IS-CRATE ?auto_16045 ) ( not ( = ?auto_16046 ?auto_16051 ) ) ( HOIST-AT ?auto_16048 ?auto_16046 ) ( AVAILABLE ?auto_16048 ) ( SURFACE-AT ?auto_16045 ?auto_16046 ) ( ON ?auto_16045 ?auto_16047 ) ( CLEAR ?auto_16045 ) ( not ( = ?auto_16044 ?auto_16045 ) ) ( not ( = ?auto_16044 ?auto_16047 ) ) ( not ( = ?auto_16045 ?auto_16047 ) ) ( not ( = ?auto_16049 ?auto_16048 ) ) ( IS-CRATE ?auto_16044 ) ( not ( = ?auto_16059 ?auto_16051 ) ) ( HOIST-AT ?auto_16060 ?auto_16059 ) ( AVAILABLE ?auto_16060 ) ( SURFACE-AT ?auto_16044 ?auto_16059 ) ( ON ?auto_16044 ?auto_16061 ) ( CLEAR ?auto_16044 ) ( not ( = ?auto_16043 ?auto_16044 ) ) ( not ( = ?auto_16043 ?auto_16061 ) ) ( not ( = ?auto_16044 ?auto_16061 ) ) ( not ( = ?auto_16049 ?auto_16060 ) ) ( IS-CRATE ?auto_16043 ) ( not ( = ?auto_16063 ?auto_16051 ) ) ( HOIST-AT ?auto_16056 ?auto_16063 ) ( AVAILABLE ?auto_16056 ) ( SURFACE-AT ?auto_16043 ?auto_16063 ) ( ON ?auto_16043 ?auto_16057 ) ( CLEAR ?auto_16043 ) ( not ( = ?auto_16042 ?auto_16043 ) ) ( not ( = ?auto_16042 ?auto_16057 ) ) ( not ( = ?auto_16043 ?auto_16057 ) ) ( not ( = ?auto_16049 ?auto_16056 ) ) ( IS-CRATE ?auto_16042 ) ( not ( = ?auto_16064 ?auto_16051 ) ) ( HOIST-AT ?auto_16052 ?auto_16064 ) ( AVAILABLE ?auto_16052 ) ( SURFACE-AT ?auto_16042 ?auto_16064 ) ( ON ?auto_16042 ?auto_16054 ) ( CLEAR ?auto_16042 ) ( not ( = ?auto_16041 ?auto_16042 ) ) ( not ( = ?auto_16041 ?auto_16054 ) ) ( not ( = ?auto_16042 ?auto_16054 ) ) ( not ( = ?auto_16049 ?auto_16052 ) ) ( IS-CRATE ?auto_16041 ) ( not ( = ?auto_16053 ?auto_16051 ) ) ( HOIST-AT ?auto_16058 ?auto_16053 ) ( AVAILABLE ?auto_16058 ) ( SURFACE-AT ?auto_16041 ?auto_16053 ) ( ON ?auto_16041 ?auto_16062 ) ( CLEAR ?auto_16041 ) ( not ( = ?auto_16040 ?auto_16041 ) ) ( not ( = ?auto_16040 ?auto_16062 ) ) ( not ( = ?auto_16041 ?auto_16062 ) ) ( not ( = ?auto_16049 ?auto_16058 ) ) ( SURFACE-AT ?auto_16039 ?auto_16051 ) ( CLEAR ?auto_16039 ) ( IS-CRATE ?auto_16040 ) ( AVAILABLE ?auto_16049 ) ( not ( = ?auto_16055 ?auto_16051 ) ) ( HOIST-AT ?auto_16066 ?auto_16055 ) ( AVAILABLE ?auto_16066 ) ( SURFACE-AT ?auto_16040 ?auto_16055 ) ( ON ?auto_16040 ?auto_16065 ) ( CLEAR ?auto_16040 ) ( TRUCK-AT ?auto_16050 ?auto_16051 ) ( not ( = ?auto_16039 ?auto_16040 ) ) ( not ( = ?auto_16039 ?auto_16065 ) ) ( not ( = ?auto_16040 ?auto_16065 ) ) ( not ( = ?auto_16049 ?auto_16066 ) ) ( not ( = ?auto_16039 ?auto_16041 ) ) ( not ( = ?auto_16039 ?auto_16062 ) ) ( not ( = ?auto_16041 ?auto_16065 ) ) ( not ( = ?auto_16053 ?auto_16055 ) ) ( not ( = ?auto_16058 ?auto_16066 ) ) ( not ( = ?auto_16062 ?auto_16065 ) ) ( not ( = ?auto_16039 ?auto_16042 ) ) ( not ( = ?auto_16039 ?auto_16054 ) ) ( not ( = ?auto_16040 ?auto_16042 ) ) ( not ( = ?auto_16040 ?auto_16054 ) ) ( not ( = ?auto_16042 ?auto_16062 ) ) ( not ( = ?auto_16042 ?auto_16065 ) ) ( not ( = ?auto_16064 ?auto_16053 ) ) ( not ( = ?auto_16064 ?auto_16055 ) ) ( not ( = ?auto_16052 ?auto_16058 ) ) ( not ( = ?auto_16052 ?auto_16066 ) ) ( not ( = ?auto_16054 ?auto_16062 ) ) ( not ( = ?auto_16054 ?auto_16065 ) ) ( not ( = ?auto_16039 ?auto_16043 ) ) ( not ( = ?auto_16039 ?auto_16057 ) ) ( not ( = ?auto_16040 ?auto_16043 ) ) ( not ( = ?auto_16040 ?auto_16057 ) ) ( not ( = ?auto_16041 ?auto_16043 ) ) ( not ( = ?auto_16041 ?auto_16057 ) ) ( not ( = ?auto_16043 ?auto_16054 ) ) ( not ( = ?auto_16043 ?auto_16062 ) ) ( not ( = ?auto_16043 ?auto_16065 ) ) ( not ( = ?auto_16063 ?auto_16064 ) ) ( not ( = ?auto_16063 ?auto_16053 ) ) ( not ( = ?auto_16063 ?auto_16055 ) ) ( not ( = ?auto_16056 ?auto_16052 ) ) ( not ( = ?auto_16056 ?auto_16058 ) ) ( not ( = ?auto_16056 ?auto_16066 ) ) ( not ( = ?auto_16057 ?auto_16054 ) ) ( not ( = ?auto_16057 ?auto_16062 ) ) ( not ( = ?auto_16057 ?auto_16065 ) ) ( not ( = ?auto_16039 ?auto_16044 ) ) ( not ( = ?auto_16039 ?auto_16061 ) ) ( not ( = ?auto_16040 ?auto_16044 ) ) ( not ( = ?auto_16040 ?auto_16061 ) ) ( not ( = ?auto_16041 ?auto_16044 ) ) ( not ( = ?auto_16041 ?auto_16061 ) ) ( not ( = ?auto_16042 ?auto_16044 ) ) ( not ( = ?auto_16042 ?auto_16061 ) ) ( not ( = ?auto_16044 ?auto_16057 ) ) ( not ( = ?auto_16044 ?auto_16054 ) ) ( not ( = ?auto_16044 ?auto_16062 ) ) ( not ( = ?auto_16044 ?auto_16065 ) ) ( not ( = ?auto_16059 ?auto_16063 ) ) ( not ( = ?auto_16059 ?auto_16064 ) ) ( not ( = ?auto_16059 ?auto_16053 ) ) ( not ( = ?auto_16059 ?auto_16055 ) ) ( not ( = ?auto_16060 ?auto_16056 ) ) ( not ( = ?auto_16060 ?auto_16052 ) ) ( not ( = ?auto_16060 ?auto_16058 ) ) ( not ( = ?auto_16060 ?auto_16066 ) ) ( not ( = ?auto_16061 ?auto_16057 ) ) ( not ( = ?auto_16061 ?auto_16054 ) ) ( not ( = ?auto_16061 ?auto_16062 ) ) ( not ( = ?auto_16061 ?auto_16065 ) ) ( not ( = ?auto_16039 ?auto_16045 ) ) ( not ( = ?auto_16039 ?auto_16047 ) ) ( not ( = ?auto_16040 ?auto_16045 ) ) ( not ( = ?auto_16040 ?auto_16047 ) ) ( not ( = ?auto_16041 ?auto_16045 ) ) ( not ( = ?auto_16041 ?auto_16047 ) ) ( not ( = ?auto_16042 ?auto_16045 ) ) ( not ( = ?auto_16042 ?auto_16047 ) ) ( not ( = ?auto_16043 ?auto_16045 ) ) ( not ( = ?auto_16043 ?auto_16047 ) ) ( not ( = ?auto_16045 ?auto_16061 ) ) ( not ( = ?auto_16045 ?auto_16057 ) ) ( not ( = ?auto_16045 ?auto_16054 ) ) ( not ( = ?auto_16045 ?auto_16062 ) ) ( not ( = ?auto_16045 ?auto_16065 ) ) ( not ( = ?auto_16046 ?auto_16059 ) ) ( not ( = ?auto_16046 ?auto_16063 ) ) ( not ( = ?auto_16046 ?auto_16064 ) ) ( not ( = ?auto_16046 ?auto_16053 ) ) ( not ( = ?auto_16046 ?auto_16055 ) ) ( not ( = ?auto_16048 ?auto_16060 ) ) ( not ( = ?auto_16048 ?auto_16056 ) ) ( not ( = ?auto_16048 ?auto_16052 ) ) ( not ( = ?auto_16048 ?auto_16058 ) ) ( not ( = ?auto_16048 ?auto_16066 ) ) ( not ( = ?auto_16047 ?auto_16061 ) ) ( not ( = ?auto_16047 ?auto_16057 ) ) ( not ( = ?auto_16047 ?auto_16054 ) ) ( not ( = ?auto_16047 ?auto_16062 ) ) ( not ( = ?auto_16047 ?auto_16065 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_16039 ?auto_16040 ?auto_16041 ?auto_16042 ?auto_16043 ?auto_16044 )
      ( MAKE-1CRATE ?auto_16044 ?auto_16045 )
      ( MAKE-6CRATE-VERIFY ?auto_16039 ?auto_16040 ?auto_16041 ?auto_16042 ?auto_16043 ?auto_16044 ?auto_16045 ) )
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
      ?auto_16093 - PLACE
      ?auto_16095 - PLACE
      ?auto_16097 - HOIST
      ?auto_16094 - SURFACE
      ?auto_16110 - PLACE
      ?auto_16111 - HOIST
      ?auto_16109 - SURFACE
      ?auto_16105 - PLACE
      ?auto_16116 - HOIST
      ?auto_16100 - SURFACE
      ?auto_16101 - PLACE
      ?auto_16108 - HOIST
      ?auto_16107 - SURFACE
      ?auto_16103 - PLACE
      ?auto_16099 - HOIST
      ?auto_16113 - SURFACE
      ?auto_16114 - PLACE
      ?auto_16106 - HOIST
      ?auto_16102 - SURFACE
      ?auto_16115 - PLACE
      ?auto_16112 - HOIST
      ?auto_16104 - SURFACE
      ?auto_16098 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16096 ?auto_16093 ) ( IS-CRATE ?auto_16092 ) ( not ( = ?auto_16095 ?auto_16093 ) ) ( HOIST-AT ?auto_16097 ?auto_16095 ) ( AVAILABLE ?auto_16097 ) ( SURFACE-AT ?auto_16092 ?auto_16095 ) ( ON ?auto_16092 ?auto_16094 ) ( CLEAR ?auto_16092 ) ( not ( = ?auto_16091 ?auto_16092 ) ) ( not ( = ?auto_16091 ?auto_16094 ) ) ( not ( = ?auto_16092 ?auto_16094 ) ) ( not ( = ?auto_16096 ?auto_16097 ) ) ( IS-CRATE ?auto_16091 ) ( not ( = ?auto_16110 ?auto_16093 ) ) ( HOIST-AT ?auto_16111 ?auto_16110 ) ( AVAILABLE ?auto_16111 ) ( SURFACE-AT ?auto_16091 ?auto_16110 ) ( ON ?auto_16091 ?auto_16109 ) ( CLEAR ?auto_16091 ) ( not ( = ?auto_16090 ?auto_16091 ) ) ( not ( = ?auto_16090 ?auto_16109 ) ) ( not ( = ?auto_16091 ?auto_16109 ) ) ( not ( = ?auto_16096 ?auto_16111 ) ) ( IS-CRATE ?auto_16090 ) ( not ( = ?auto_16105 ?auto_16093 ) ) ( HOIST-AT ?auto_16116 ?auto_16105 ) ( AVAILABLE ?auto_16116 ) ( SURFACE-AT ?auto_16090 ?auto_16105 ) ( ON ?auto_16090 ?auto_16100 ) ( CLEAR ?auto_16090 ) ( not ( = ?auto_16089 ?auto_16090 ) ) ( not ( = ?auto_16089 ?auto_16100 ) ) ( not ( = ?auto_16090 ?auto_16100 ) ) ( not ( = ?auto_16096 ?auto_16116 ) ) ( IS-CRATE ?auto_16089 ) ( not ( = ?auto_16101 ?auto_16093 ) ) ( HOIST-AT ?auto_16108 ?auto_16101 ) ( AVAILABLE ?auto_16108 ) ( SURFACE-AT ?auto_16089 ?auto_16101 ) ( ON ?auto_16089 ?auto_16107 ) ( CLEAR ?auto_16089 ) ( not ( = ?auto_16088 ?auto_16089 ) ) ( not ( = ?auto_16088 ?auto_16107 ) ) ( not ( = ?auto_16089 ?auto_16107 ) ) ( not ( = ?auto_16096 ?auto_16108 ) ) ( IS-CRATE ?auto_16088 ) ( not ( = ?auto_16103 ?auto_16093 ) ) ( HOIST-AT ?auto_16099 ?auto_16103 ) ( AVAILABLE ?auto_16099 ) ( SURFACE-AT ?auto_16088 ?auto_16103 ) ( ON ?auto_16088 ?auto_16113 ) ( CLEAR ?auto_16088 ) ( not ( = ?auto_16087 ?auto_16088 ) ) ( not ( = ?auto_16087 ?auto_16113 ) ) ( not ( = ?auto_16088 ?auto_16113 ) ) ( not ( = ?auto_16096 ?auto_16099 ) ) ( IS-CRATE ?auto_16087 ) ( not ( = ?auto_16114 ?auto_16093 ) ) ( HOIST-AT ?auto_16106 ?auto_16114 ) ( AVAILABLE ?auto_16106 ) ( SURFACE-AT ?auto_16087 ?auto_16114 ) ( ON ?auto_16087 ?auto_16102 ) ( CLEAR ?auto_16087 ) ( not ( = ?auto_16086 ?auto_16087 ) ) ( not ( = ?auto_16086 ?auto_16102 ) ) ( not ( = ?auto_16087 ?auto_16102 ) ) ( not ( = ?auto_16096 ?auto_16106 ) ) ( SURFACE-AT ?auto_16085 ?auto_16093 ) ( CLEAR ?auto_16085 ) ( IS-CRATE ?auto_16086 ) ( AVAILABLE ?auto_16096 ) ( not ( = ?auto_16115 ?auto_16093 ) ) ( HOIST-AT ?auto_16112 ?auto_16115 ) ( AVAILABLE ?auto_16112 ) ( SURFACE-AT ?auto_16086 ?auto_16115 ) ( ON ?auto_16086 ?auto_16104 ) ( CLEAR ?auto_16086 ) ( TRUCK-AT ?auto_16098 ?auto_16093 ) ( not ( = ?auto_16085 ?auto_16086 ) ) ( not ( = ?auto_16085 ?auto_16104 ) ) ( not ( = ?auto_16086 ?auto_16104 ) ) ( not ( = ?auto_16096 ?auto_16112 ) ) ( not ( = ?auto_16085 ?auto_16087 ) ) ( not ( = ?auto_16085 ?auto_16102 ) ) ( not ( = ?auto_16087 ?auto_16104 ) ) ( not ( = ?auto_16114 ?auto_16115 ) ) ( not ( = ?auto_16106 ?auto_16112 ) ) ( not ( = ?auto_16102 ?auto_16104 ) ) ( not ( = ?auto_16085 ?auto_16088 ) ) ( not ( = ?auto_16085 ?auto_16113 ) ) ( not ( = ?auto_16086 ?auto_16088 ) ) ( not ( = ?auto_16086 ?auto_16113 ) ) ( not ( = ?auto_16088 ?auto_16102 ) ) ( not ( = ?auto_16088 ?auto_16104 ) ) ( not ( = ?auto_16103 ?auto_16114 ) ) ( not ( = ?auto_16103 ?auto_16115 ) ) ( not ( = ?auto_16099 ?auto_16106 ) ) ( not ( = ?auto_16099 ?auto_16112 ) ) ( not ( = ?auto_16113 ?auto_16102 ) ) ( not ( = ?auto_16113 ?auto_16104 ) ) ( not ( = ?auto_16085 ?auto_16089 ) ) ( not ( = ?auto_16085 ?auto_16107 ) ) ( not ( = ?auto_16086 ?auto_16089 ) ) ( not ( = ?auto_16086 ?auto_16107 ) ) ( not ( = ?auto_16087 ?auto_16089 ) ) ( not ( = ?auto_16087 ?auto_16107 ) ) ( not ( = ?auto_16089 ?auto_16113 ) ) ( not ( = ?auto_16089 ?auto_16102 ) ) ( not ( = ?auto_16089 ?auto_16104 ) ) ( not ( = ?auto_16101 ?auto_16103 ) ) ( not ( = ?auto_16101 ?auto_16114 ) ) ( not ( = ?auto_16101 ?auto_16115 ) ) ( not ( = ?auto_16108 ?auto_16099 ) ) ( not ( = ?auto_16108 ?auto_16106 ) ) ( not ( = ?auto_16108 ?auto_16112 ) ) ( not ( = ?auto_16107 ?auto_16113 ) ) ( not ( = ?auto_16107 ?auto_16102 ) ) ( not ( = ?auto_16107 ?auto_16104 ) ) ( not ( = ?auto_16085 ?auto_16090 ) ) ( not ( = ?auto_16085 ?auto_16100 ) ) ( not ( = ?auto_16086 ?auto_16090 ) ) ( not ( = ?auto_16086 ?auto_16100 ) ) ( not ( = ?auto_16087 ?auto_16090 ) ) ( not ( = ?auto_16087 ?auto_16100 ) ) ( not ( = ?auto_16088 ?auto_16090 ) ) ( not ( = ?auto_16088 ?auto_16100 ) ) ( not ( = ?auto_16090 ?auto_16107 ) ) ( not ( = ?auto_16090 ?auto_16113 ) ) ( not ( = ?auto_16090 ?auto_16102 ) ) ( not ( = ?auto_16090 ?auto_16104 ) ) ( not ( = ?auto_16105 ?auto_16101 ) ) ( not ( = ?auto_16105 ?auto_16103 ) ) ( not ( = ?auto_16105 ?auto_16114 ) ) ( not ( = ?auto_16105 ?auto_16115 ) ) ( not ( = ?auto_16116 ?auto_16108 ) ) ( not ( = ?auto_16116 ?auto_16099 ) ) ( not ( = ?auto_16116 ?auto_16106 ) ) ( not ( = ?auto_16116 ?auto_16112 ) ) ( not ( = ?auto_16100 ?auto_16107 ) ) ( not ( = ?auto_16100 ?auto_16113 ) ) ( not ( = ?auto_16100 ?auto_16102 ) ) ( not ( = ?auto_16100 ?auto_16104 ) ) ( not ( = ?auto_16085 ?auto_16091 ) ) ( not ( = ?auto_16085 ?auto_16109 ) ) ( not ( = ?auto_16086 ?auto_16091 ) ) ( not ( = ?auto_16086 ?auto_16109 ) ) ( not ( = ?auto_16087 ?auto_16091 ) ) ( not ( = ?auto_16087 ?auto_16109 ) ) ( not ( = ?auto_16088 ?auto_16091 ) ) ( not ( = ?auto_16088 ?auto_16109 ) ) ( not ( = ?auto_16089 ?auto_16091 ) ) ( not ( = ?auto_16089 ?auto_16109 ) ) ( not ( = ?auto_16091 ?auto_16100 ) ) ( not ( = ?auto_16091 ?auto_16107 ) ) ( not ( = ?auto_16091 ?auto_16113 ) ) ( not ( = ?auto_16091 ?auto_16102 ) ) ( not ( = ?auto_16091 ?auto_16104 ) ) ( not ( = ?auto_16110 ?auto_16105 ) ) ( not ( = ?auto_16110 ?auto_16101 ) ) ( not ( = ?auto_16110 ?auto_16103 ) ) ( not ( = ?auto_16110 ?auto_16114 ) ) ( not ( = ?auto_16110 ?auto_16115 ) ) ( not ( = ?auto_16111 ?auto_16116 ) ) ( not ( = ?auto_16111 ?auto_16108 ) ) ( not ( = ?auto_16111 ?auto_16099 ) ) ( not ( = ?auto_16111 ?auto_16106 ) ) ( not ( = ?auto_16111 ?auto_16112 ) ) ( not ( = ?auto_16109 ?auto_16100 ) ) ( not ( = ?auto_16109 ?auto_16107 ) ) ( not ( = ?auto_16109 ?auto_16113 ) ) ( not ( = ?auto_16109 ?auto_16102 ) ) ( not ( = ?auto_16109 ?auto_16104 ) ) ( not ( = ?auto_16085 ?auto_16092 ) ) ( not ( = ?auto_16085 ?auto_16094 ) ) ( not ( = ?auto_16086 ?auto_16092 ) ) ( not ( = ?auto_16086 ?auto_16094 ) ) ( not ( = ?auto_16087 ?auto_16092 ) ) ( not ( = ?auto_16087 ?auto_16094 ) ) ( not ( = ?auto_16088 ?auto_16092 ) ) ( not ( = ?auto_16088 ?auto_16094 ) ) ( not ( = ?auto_16089 ?auto_16092 ) ) ( not ( = ?auto_16089 ?auto_16094 ) ) ( not ( = ?auto_16090 ?auto_16092 ) ) ( not ( = ?auto_16090 ?auto_16094 ) ) ( not ( = ?auto_16092 ?auto_16109 ) ) ( not ( = ?auto_16092 ?auto_16100 ) ) ( not ( = ?auto_16092 ?auto_16107 ) ) ( not ( = ?auto_16092 ?auto_16113 ) ) ( not ( = ?auto_16092 ?auto_16102 ) ) ( not ( = ?auto_16092 ?auto_16104 ) ) ( not ( = ?auto_16095 ?auto_16110 ) ) ( not ( = ?auto_16095 ?auto_16105 ) ) ( not ( = ?auto_16095 ?auto_16101 ) ) ( not ( = ?auto_16095 ?auto_16103 ) ) ( not ( = ?auto_16095 ?auto_16114 ) ) ( not ( = ?auto_16095 ?auto_16115 ) ) ( not ( = ?auto_16097 ?auto_16111 ) ) ( not ( = ?auto_16097 ?auto_16116 ) ) ( not ( = ?auto_16097 ?auto_16108 ) ) ( not ( = ?auto_16097 ?auto_16099 ) ) ( not ( = ?auto_16097 ?auto_16106 ) ) ( not ( = ?auto_16097 ?auto_16112 ) ) ( not ( = ?auto_16094 ?auto_16109 ) ) ( not ( = ?auto_16094 ?auto_16100 ) ) ( not ( = ?auto_16094 ?auto_16107 ) ) ( not ( = ?auto_16094 ?auto_16113 ) ) ( not ( = ?auto_16094 ?auto_16102 ) ) ( not ( = ?auto_16094 ?auto_16104 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_16085 ?auto_16086 ?auto_16087 ?auto_16088 ?auto_16089 ?auto_16090 ?auto_16091 )
      ( MAKE-1CRATE ?auto_16091 ?auto_16092 )
      ( MAKE-7CRATE-VERIFY ?auto_16085 ?auto_16086 ?auto_16087 ?auto_16088 ?auto_16089 ?auto_16090 ?auto_16091 ?auto_16092 ) )
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
      ?auto_16143 - SURFACE
      ?auto_16144 - SURFACE
    )
    :vars
    (
      ?auto_16145 - HOIST
      ?auto_16146 - PLACE
      ?auto_16148 - PLACE
      ?auto_16147 - HOIST
      ?auto_16150 - SURFACE
      ?auto_16152 - PLACE
      ?auto_16151 - HOIST
      ?auto_16154 - SURFACE
      ?auto_16158 - PLACE
      ?auto_16159 - HOIST
      ?auto_16156 - SURFACE
      ?auto_16162 - PLACE
      ?auto_16169 - HOIST
      ?auto_16166 - SURFACE
      ?auto_16167 - PLACE
      ?auto_16157 - HOIST
      ?auto_16155 - SURFACE
      ?auto_16153 - PLACE
      ?auto_16170 - HOIST
      ?auto_16168 - SURFACE
      ?auto_16171 - PLACE
      ?auto_16161 - HOIST
      ?auto_16165 - SURFACE
      ?auto_16164 - PLACE
      ?auto_16160 - HOIST
      ?auto_16163 - SURFACE
      ?auto_16149 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16145 ?auto_16146 ) ( IS-CRATE ?auto_16144 ) ( not ( = ?auto_16148 ?auto_16146 ) ) ( HOIST-AT ?auto_16147 ?auto_16148 ) ( AVAILABLE ?auto_16147 ) ( SURFACE-AT ?auto_16144 ?auto_16148 ) ( ON ?auto_16144 ?auto_16150 ) ( CLEAR ?auto_16144 ) ( not ( = ?auto_16143 ?auto_16144 ) ) ( not ( = ?auto_16143 ?auto_16150 ) ) ( not ( = ?auto_16144 ?auto_16150 ) ) ( not ( = ?auto_16145 ?auto_16147 ) ) ( IS-CRATE ?auto_16143 ) ( not ( = ?auto_16152 ?auto_16146 ) ) ( HOIST-AT ?auto_16151 ?auto_16152 ) ( AVAILABLE ?auto_16151 ) ( SURFACE-AT ?auto_16143 ?auto_16152 ) ( ON ?auto_16143 ?auto_16154 ) ( CLEAR ?auto_16143 ) ( not ( = ?auto_16142 ?auto_16143 ) ) ( not ( = ?auto_16142 ?auto_16154 ) ) ( not ( = ?auto_16143 ?auto_16154 ) ) ( not ( = ?auto_16145 ?auto_16151 ) ) ( IS-CRATE ?auto_16142 ) ( not ( = ?auto_16158 ?auto_16146 ) ) ( HOIST-AT ?auto_16159 ?auto_16158 ) ( AVAILABLE ?auto_16159 ) ( SURFACE-AT ?auto_16142 ?auto_16158 ) ( ON ?auto_16142 ?auto_16156 ) ( CLEAR ?auto_16142 ) ( not ( = ?auto_16141 ?auto_16142 ) ) ( not ( = ?auto_16141 ?auto_16156 ) ) ( not ( = ?auto_16142 ?auto_16156 ) ) ( not ( = ?auto_16145 ?auto_16159 ) ) ( IS-CRATE ?auto_16141 ) ( not ( = ?auto_16162 ?auto_16146 ) ) ( HOIST-AT ?auto_16169 ?auto_16162 ) ( AVAILABLE ?auto_16169 ) ( SURFACE-AT ?auto_16141 ?auto_16162 ) ( ON ?auto_16141 ?auto_16166 ) ( CLEAR ?auto_16141 ) ( not ( = ?auto_16140 ?auto_16141 ) ) ( not ( = ?auto_16140 ?auto_16166 ) ) ( not ( = ?auto_16141 ?auto_16166 ) ) ( not ( = ?auto_16145 ?auto_16169 ) ) ( IS-CRATE ?auto_16140 ) ( not ( = ?auto_16167 ?auto_16146 ) ) ( HOIST-AT ?auto_16157 ?auto_16167 ) ( AVAILABLE ?auto_16157 ) ( SURFACE-AT ?auto_16140 ?auto_16167 ) ( ON ?auto_16140 ?auto_16155 ) ( CLEAR ?auto_16140 ) ( not ( = ?auto_16139 ?auto_16140 ) ) ( not ( = ?auto_16139 ?auto_16155 ) ) ( not ( = ?auto_16140 ?auto_16155 ) ) ( not ( = ?auto_16145 ?auto_16157 ) ) ( IS-CRATE ?auto_16139 ) ( not ( = ?auto_16153 ?auto_16146 ) ) ( HOIST-AT ?auto_16170 ?auto_16153 ) ( AVAILABLE ?auto_16170 ) ( SURFACE-AT ?auto_16139 ?auto_16153 ) ( ON ?auto_16139 ?auto_16168 ) ( CLEAR ?auto_16139 ) ( not ( = ?auto_16138 ?auto_16139 ) ) ( not ( = ?auto_16138 ?auto_16168 ) ) ( not ( = ?auto_16139 ?auto_16168 ) ) ( not ( = ?auto_16145 ?auto_16170 ) ) ( IS-CRATE ?auto_16138 ) ( not ( = ?auto_16171 ?auto_16146 ) ) ( HOIST-AT ?auto_16161 ?auto_16171 ) ( AVAILABLE ?auto_16161 ) ( SURFACE-AT ?auto_16138 ?auto_16171 ) ( ON ?auto_16138 ?auto_16165 ) ( CLEAR ?auto_16138 ) ( not ( = ?auto_16137 ?auto_16138 ) ) ( not ( = ?auto_16137 ?auto_16165 ) ) ( not ( = ?auto_16138 ?auto_16165 ) ) ( not ( = ?auto_16145 ?auto_16161 ) ) ( SURFACE-AT ?auto_16136 ?auto_16146 ) ( CLEAR ?auto_16136 ) ( IS-CRATE ?auto_16137 ) ( AVAILABLE ?auto_16145 ) ( not ( = ?auto_16164 ?auto_16146 ) ) ( HOIST-AT ?auto_16160 ?auto_16164 ) ( AVAILABLE ?auto_16160 ) ( SURFACE-AT ?auto_16137 ?auto_16164 ) ( ON ?auto_16137 ?auto_16163 ) ( CLEAR ?auto_16137 ) ( TRUCK-AT ?auto_16149 ?auto_16146 ) ( not ( = ?auto_16136 ?auto_16137 ) ) ( not ( = ?auto_16136 ?auto_16163 ) ) ( not ( = ?auto_16137 ?auto_16163 ) ) ( not ( = ?auto_16145 ?auto_16160 ) ) ( not ( = ?auto_16136 ?auto_16138 ) ) ( not ( = ?auto_16136 ?auto_16165 ) ) ( not ( = ?auto_16138 ?auto_16163 ) ) ( not ( = ?auto_16171 ?auto_16164 ) ) ( not ( = ?auto_16161 ?auto_16160 ) ) ( not ( = ?auto_16165 ?auto_16163 ) ) ( not ( = ?auto_16136 ?auto_16139 ) ) ( not ( = ?auto_16136 ?auto_16168 ) ) ( not ( = ?auto_16137 ?auto_16139 ) ) ( not ( = ?auto_16137 ?auto_16168 ) ) ( not ( = ?auto_16139 ?auto_16165 ) ) ( not ( = ?auto_16139 ?auto_16163 ) ) ( not ( = ?auto_16153 ?auto_16171 ) ) ( not ( = ?auto_16153 ?auto_16164 ) ) ( not ( = ?auto_16170 ?auto_16161 ) ) ( not ( = ?auto_16170 ?auto_16160 ) ) ( not ( = ?auto_16168 ?auto_16165 ) ) ( not ( = ?auto_16168 ?auto_16163 ) ) ( not ( = ?auto_16136 ?auto_16140 ) ) ( not ( = ?auto_16136 ?auto_16155 ) ) ( not ( = ?auto_16137 ?auto_16140 ) ) ( not ( = ?auto_16137 ?auto_16155 ) ) ( not ( = ?auto_16138 ?auto_16140 ) ) ( not ( = ?auto_16138 ?auto_16155 ) ) ( not ( = ?auto_16140 ?auto_16168 ) ) ( not ( = ?auto_16140 ?auto_16165 ) ) ( not ( = ?auto_16140 ?auto_16163 ) ) ( not ( = ?auto_16167 ?auto_16153 ) ) ( not ( = ?auto_16167 ?auto_16171 ) ) ( not ( = ?auto_16167 ?auto_16164 ) ) ( not ( = ?auto_16157 ?auto_16170 ) ) ( not ( = ?auto_16157 ?auto_16161 ) ) ( not ( = ?auto_16157 ?auto_16160 ) ) ( not ( = ?auto_16155 ?auto_16168 ) ) ( not ( = ?auto_16155 ?auto_16165 ) ) ( not ( = ?auto_16155 ?auto_16163 ) ) ( not ( = ?auto_16136 ?auto_16141 ) ) ( not ( = ?auto_16136 ?auto_16166 ) ) ( not ( = ?auto_16137 ?auto_16141 ) ) ( not ( = ?auto_16137 ?auto_16166 ) ) ( not ( = ?auto_16138 ?auto_16141 ) ) ( not ( = ?auto_16138 ?auto_16166 ) ) ( not ( = ?auto_16139 ?auto_16141 ) ) ( not ( = ?auto_16139 ?auto_16166 ) ) ( not ( = ?auto_16141 ?auto_16155 ) ) ( not ( = ?auto_16141 ?auto_16168 ) ) ( not ( = ?auto_16141 ?auto_16165 ) ) ( not ( = ?auto_16141 ?auto_16163 ) ) ( not ( = ?auto_16162 ?auto_16167 ) ) ( not ( = ?auto_16162 ?auto_16153 ) ) ( not ( = ?auto_16162 ?auto_16171 ) ) ( not ( = ?auto_16162 ?auto_16164 ) ) ( not ( = ?auto_16169 ?auto_16157 ) ) ( not ( = ?auto_16169 ?auto_16170 ) ) ( not ( = ?auto_16169 ?auto_16161 ) ) ( not ( = ?auto_16169 ?auto_16160 ) ) ( not ( = ?auto_16166 ?auto_16155 ) ) ( not ( = ?auto_16166 ?auto_16168 ) ) ( not ( = ?auto_16166 ?auto_16165 ) ) ( not ( = ?auto_16166 ?auto_16163 ) ) ( not ( = ?auto_16136 ?auto_16142 ) ) ( not ( = ?auto_16136 ?auto_16156 ) ) ( not ( = ?auto_16137 ?auto_16142 ) ) ( not ( = ?auto_16137 ?auto_16156 ) ) ( not ( = ?auto_16138 ?auto_16142 ) ) ( not ( = ?auto_16138 ?auto_16156 ) ) ( not ( = ?auto_16139 ?auto_16142 ) ) ( not ( = ?auto_16139 ?auto_16156 ) ) ( not ( = ?auto_16140 ?auto_16142 ) ) ( not ( = ?auto_16140 ?auto_16156 ) ) ( not ( = ?auto_16142 ?auto_16166 ) ) ( not ( = ?auto_16142 ?auto_16155 ) ) ( not ( = ?auto_16142 ?auto_16168 ) ) ( not ( = ?auto_16142 ?auto_16165 ) ) ( not ( = ?auto_16142 ?auto_16163 ) ) ( not ( = ?auto_16158 ?auto_16162 ) ) ( not ( = ?auto_16158 ?auto_16167 ) ) ( not ( = ?auto_16158 ?auto_16153 ) ) ( not ( = ?auto_16158 ?auto_16171 ) ) ( not ( = ?auto_16158 ?auto_16164 ) ) ( not ( = ?auto_16159 ?auto_16169 ) ) ( not ( = ?auto_16159 ?auto_16157 ) ) ( not ( = ?auto_16159 ?auto_16170 ) ) ( not ( = ?auto_16159 ?auto_16161 ) ) ( not ( = ?auto_16159 ?auto_16160 ) ) ( not ( = ?auto_16156 ?auto_16166 ) ) ( not ( = ?auto_16156 ?auto_16155 ) ) ( not ( = ?auto_16156 ?auto_16168 ) ) ( not ( = ?auto_16156 ?auto_16165 ) ) ( not ( = ?auto_16156 ?auto_16163 ) ) ( not ( = ?auto_16136 ?auto_16143 ) ) ( not ( = ?auto_16136 ?auto_16154 ) ) ( not ( = ?auto_16137 ?auto_16143 ) ) ( not ( = ?auto_16137 ?auto_16154 ) ) ( not ( = ?auto_16138 ?auto_16143 ) ) ( not ( = ?auto_16138 ?auto_16154 ) ) ( not ( = ?auto_16139 ?auto_16143 ) ) ( not ( = ?auto_16139 ?auto_16154 ) ) ( not ( = ?auto_16140 ?auto_16143 ) ) ( not ( = ?auto_16140 ?auto_16154 ) ) ( not ( = ?auto_16141 ?auto_16143 ) ) ( not ( = ?auto_16141 ?auto_16154 ) ) ( not ( = ?auto_16143 ?auto_16156 ) ) ( not ( = ?auto_16143 ?auto_16166 ) ) ( not ( = ?auto_16143 ?auto_16155 ) ) ( not ( = ?auto_16143 ?auto_16168 ) ) ( not ( = ?auto_16143 ?auto_16165 ) ) ( not ( = ?auto_16143 ?auto_16163 ) ) ( not ( = ?auto_16152 ?auto_16158 ) ) ( not ( = ?auto_16152 ?auto_16162 ) ) ( not ( = ?auto_16152 ?auto_16167 ) ) ( not ( = ?auto_16152 ?auto_16153 ) ) ( not ( = ?auto_16152 ?auto_16171 ) ) ( not ( = ?auto_16152 ?auto_16164 ) ) ( not ( = ?auto_16151 ?auto_16159 ) ) ( not ( = ?auto_16151 ?auto_16169 ) ) ( not ( = ?auto_16151 ?auto_16157 ) ) ( not ( = ?auto_16151 ?auto_16170 ) ) ( not ( = ?auto_16151 ?auto_16161 ) ) ( not ( = ?auto_16151 ?auto_16160 ) ) ( not ( = ?auto_16154 ?auto_16156 ) ) ( not ( = ?auto_16154 ?auto_16166 ) ) ( not ( = ?auto_16154 ?auto_16155 ) ) ( not ( = ?auto_16154 ?auto_16168 ) ) ( not ( = ?auto_16154 ?auto_16165 ) ) ( not ( = ?auto_16154 ?auto_16163 ) ) ( not ( = ?auto_16136 ?auto_16144 ) ) ( not ( = ?auto_16136 ?auto_16150 ) ) ( not ( = ?auto_16137 ?auto_16144 ) ) ( not ( = ?auto_16137 ?auto_16150 ) ) ( not ( = ?auto_16138 ?auto_16144 ) ) ( not ( = ?auto_16138 ?auto_16150 ) ) ( not ( = ?auto_16139 ?auto_16144 ) ) ( not ( = ?auto_16139 ?auto_16150 ) ) ( not ( = ?auto_16140 ?auto_16144 ) ) ( not ( = ?auto_16140 ?auto_16150 ) ) ( not ( = ?auto_16141 ?auto_16144 ) ) ( not ( = ?auto_16141 ?auto_16150 ) ) ( not ( = ?auto_16142 ?auto_16144 ) ) ( not ( = ?auto_16142 ?auto_16150 ) ) ( not ( = ?auto_16144 ?auto_16154 ) ) ( not ( = ?auto_16144 ?auto_16156 ) ) ( not ( = ?auto_16144 ?auto_16166 ) ) ( not ( = ?auto_16144 ?auto_16155 ) ) ( not ( = ?auto_16144 ?auto_16168 ) ) ( not ( = ?auto_16144 ?auto_16165 ) ) ( not ( = ?auto_16144 ?auto_16163 ) ) ( not ( = ?auto_16148 ?auto_16152 ) ) ( not ( = ?auto_16148 ?auto_16158 ) ) ( not ( = ?auto_16148 ?auto_16162 ) ) ( not ( = ?auto_16148 ?auto_16167 ) ) ( not ( = ?auto_16148 ?auto_16153 ) ) ( not ( = ?auto_16148 ?auto_16171 ) ) ( not ( = ?auto_16148 ?auto_16164 ) ) ( not ( = ?auto_16147 ?auto_16151 ) ) ( not ( = ?auto_16147 ?auto_16159 ) ) ( not ( = ?auto_16147 ?auto_16169 ) ) ( not ( = ?auto_16147 ?auto_16157 ) ) ( not ( = ?auto_16147 ?auto_16170 ) ) ( not ( = ?auto_16147 ?auto_16161 ) ) ( not ( = ?auto_16147 ?auto_16160 ) ) ( not ( = ?auto_16150 ?auto_16154 ) ) ( not ( = ?auto_16150 ?auto_16156 ) ) ( not ( = ?auto_16150 ?auto_16166 ) ) ( not ( = ?auto_16150 ?auto_16155 ) ) ( not ( = ?auto_16150 ?auto_16168 ) ) ( not ( = ?auto_16150 ?auto_16165 ) ) ( not ( = ?auto_16150 ?auto_16163 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_16136 ?auto_16137 ?auto_16138 ?auto_16139 ?auto_16140 ?auto_16141 ?auto_16142 ?auto_16143 )
      ( MAKE-1CRATE ?auto_16143 ?auto_16144 )
      ( MAKE-8CRATE-VERIFY ?auto_16136 ?auto_16137 ?auto_16138 ?auto_16139 ?auto_16140 ?auto_16141 ?auto_16142 ?auto_16143 ?auto_16144 ) )
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
      ?auto_16199 - SURFACE
      ?auto_16200 - SURFACE
      ?auto_16201 - SURFACE
    )
    :vars
    (
      ?auto_16203 - HOIST
      ?auto_16206 - PLACE
      ?auto_16205 - PLACE
      ?auto_16207 - HOIST
      ?auto_16204 - SURFACE
      ?auto_16228 - PLACE
      ?auto_16223 - HOIST
      ?auto_16221 - SURFACE
      ?auto_16222 - PLACE
      ?auto_16226 - HOIST
      ?auto_16227 - SURFACE
      ?auto_16216 - PLACE
      ?auto_16225 - HOIST
      ?auto_16212 - SURFACE
      ?auto_16220 - PLACE
      ?auto_16214 - HOIST
      ?auto_16231 - SURFACE
      ?auto_16217 - PLACE
      ?auto_16211 - HOIST
      ?auto_16213 - SURFACE
      ?auto_16224 - PLACE
      ?auto_16209 - HOIST
      ?auto_16215 - SURFACE
      ?auto_16210 - PLACE
      ?auto_16218 - HOIST
      ?auto_16208 - SURFACE
      ?auto_16229 - PLACE
      ?auto_16219 - HOIST
      ?auto_16230 - SURFACE
      ?auto_16202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16203 ?auto_16206 ) ( IS-CRATE ?auto_16201 ) ( not ( = ?auto_16205 ?auto_16206 ) ) ( HOIST-AT ?auto_16207 ?auto_16205 ) ( AVAILABLE ?auto_16207 ) ( SURFACE-AT ?auto_16201 ?auto_16205 ) ( ON ?auto_16201 ?auto_16204 ) ( CLEAR ?auto_16201 ) ( not ( = ?auto_16200 ?auto_16201 ) ) ( not ( = ?auto_16200 ?auto_16204 ) ) ( not ( = ?auto_16201 ?auto_16204 ) ) ( not ( = ?auto_16203 ?auto_16207 ) ) ( IS-CRATE ?auto_16200 ) ( not ( = ?auto_16228 ?auto_16206 ) ) ( HOIST-AT ?auto_16223 ?auto_16228 ) ( AVAILABLE ?auto_16223 ) ( SURFACE-AT ?auto_16200 ?auto_16228 ) ( ON ?auto_16200 ?auto_16221 ) ( CLEAR ?auto_16200 ) ( not ( = ?auto_16199 ?auto_16200 ) ) ( not ( = ?auto_16199 ?auto_16221 ) ) ( not ( = ?auto_16200 ?auto_16221 ) ) ( not ( = ?auto_16203 ?auto_16223 ) ) ( IS-CRATE ?auto_16199 ) ( not ( = ?auto_16222 ?auto_16206 ) ) ( HOIST-AT ?auto_16226 ?auto_16222 ) ( AVAILABLE ?auto_16226 ) ( SURFACE-AT ?auto_16199 ?auto_16222 ) ( ON ?auto_16199 ?auto_16227 ) ( CLEAR ?auto_16199 ) ( not ( = ?auto_16198 ?auto_16199 ) ) ( not ( = ?auto_16198 ?auto_16227 ) ) ( not ( = ?auto_16199 ?auto_16227 ) ) ( not ( = ?auto_16203 ?auto_16226 ) ) ( IS-CRATE ?auto_16198 ) ( not ( = ?auto_16216 ?auto_16206 ) ) ( HOIST-AT ?auto_16225 ?auto_16216 ) ( AVAILABLE ?auto_16225 ) ( SURFACE-AT ?auto_16198 ?auto_16216 ) ( ON ?auto_16198 ?auto_16212 ) ( CLEAR ?auto_16198 ) ( not ( = ?auto_16197 ?auto_16198 ) ) ( not ( = ?auto_16197 ?auto_16212 ) ) ( not ( = ?auto_16198 ?auto_16212 ) ) ( not ( = ?auto_16203 ?auto_16225 ) ) ( IS-CRATE ?auto_16197 ) ( not ( = ?auto_16220 ?auto_16206 ) ) ( HOIST-AT ?auto_16214 ?auto_16220 ) ( AVAILABLE ?auto_16214 ) ( SURFACE-AT ?auto_16197 ?auto_16220 ) ( ON ?auto_16197 ?auto_16231 ) ( CLEAR ?auto_16197 ) ( not ( = ?auto_16196 ?auto_16197 ) ) ( not ( = ?auto_16196 ?auto_16231 ) ) ( not ( = ?auto_16197 ?auto_16231 ) ) ( not ( = ?auto_16203 ?auto_16214 ) ) ( IS-CRATE ?auto_16196 ) ( not ( = ?auto_16217 ?auto_16206 ) ) ( HOIST-AT ?auto_16211 ?auto_16217 ) ( AVAILABLE ?auto_16211 ) ( SURFACE-AT ?auto_16196 ?auto_16217 ) ( ON ?auto_16196 ?auto_16213 ) ( CLEAR ?auto_16196 ) ( not ( = ?auto_16195 ?auto_16196 ) ) ( not ( = ?auto_16195 ?auto_16213 ) ) ( not ( = ?auto_16196 ?auto_16213 ) ) ( not ( = ?auto_16203 ?auto_16211 ) ) ( IS-CRATE ?auto_16195 ) ( not ( = ?auto_16224 ?auto_16206 ) ) ( HOIST-AT ?auto_16209 ?auto_16224 ) ( AVAILABLE ?auto_16209 ) ( SURFACE-AT ?auto_16195 ?auto_16224 ) ( ON ?auto_16195 ?auto_16215 ) ( CLEAR ?auto_16195 ) ( not ( = ?auto_16194 ?auto_16195 ) ) ( not ( = ?auto_16194 ?auto_16215 ) ) ( not ( = ?auto_16195 ?auto_16215 ) ) ( not ( = ?auto_16203 ?auto_16209 ) ) ( IS-CRATE ?auto_16194 ) ( not ( = ?auto_16210 ?auto_16206 ) ) ( HOIST-AT ?auto_16218 ?auto_16210 ) ( AVAILABLE ?auto_16218 ) ( SURFACE-AT ?auto_16194 ?auto_16210 ) ( ON ?auto_16194 ?auto_16208 ) ( CLEAR ?auto_16194 ) ( not ( = ?auto_16193 ?auto_16194 ) ) ( not ( = ?auto_16193 ?auto_16208 ) ) ( not ( = ?auto_16194 ?auto_16208 ) ) ( not ( = ?auto_16203 ?auto_16218 ) ) ( SURFACE-AT ?auto_16192 ?auto_16206 ) ( CLEAR ?auto_16192 ) ( IS-CRATE ?auto_16193 ) ( AVAILABLE ?auto_16203 ) ( not ( = ?auto_16229 ?auto_16206 ) ) ( HOIST-AT ?auto_16219 ?auto_16229 ) ( AVAILABLE ?auto_16219 ) ( SURFACE-AT ?auto_16193 ?auto_16229 ) ( ON ?auto_16193 ?auto_16230 ) ( CLEAR ?auto_16193 ) ( TRUCK-AT ?auto_16202 ?auto_16206 ) ( not ( = ?auto_16192 ?auto_16193 ) ) ( not ( = ?auto_16192 ?auto_16230 ) ) ( not ( = ?auto_16193 ?auto_16230 ) ) ( not ( = ?auto_16203 ?auto_16219 ) ) ( not ( = ?auto_16192 ?auto_16194 ) ) ( not ( = ?auto_16192 ?auto_16208 ) ) ( not ( = ?auto_16194 ?auto_16230 ) ) ( not ( = ?auto_16210 ?auto_16229 ) ) ( not ( = ?auto_16218 ?auto_16219 ) ) ( not ( = ?auto_16208 ?auto_16230 ) ) ( not ( = ?auto_16192 ?auto_16195 ) ) ( not ( = ?auto_16192 ?auto_16215 ) ) ( not ( = ?auto_16193 ?auto_16195 ) ) ( not ( = ?auto_16193 ?auto_16215 ) ) ( not ( = ?auto_16195 ?auto_16208 ) ) ( not ( = ?auto_16195 ?auto_16230 ) ) ( not ( = ?auto_16224 ?auto_16210 ) ) ( not ( = ?auto_16224 ?auto_16229 ) ) ( not ( = ?auto_16209 ?auto_16218 ) ) ( not ( = ?auto_16209 ?auto_16219 ) ) ( not ( = ?auto_16215 ?auto_16208 ) ) ( not ( = ?auto_16215 ?auto_16230 ) ) ( not ( = ?auto_16192 ?auto_16196 ) ) ( not ( = ?auto_16192 ?auto_16213 ) ) ( not ( = ?auto_16193 ?auto_16196 ) ) ( not ( = ?auto_16193 ?auto_16213 ) ) ( not ( = ?auto_16194 ?auto_16196 ) ) ( not ( = ?auto_16194 ?auto_16213 ) ) ( not ( = ?auto_16196 ?auto_16215 ) ) ( not ( = ?auto_16196 ?auto_16208 ) ) ( not ( = ?auto_16196 ?auto_16230 ) ) ( not ( = ?auto_16217 ?auto_16224 ) ) ( not ( = ?auto_16217 ?auto_16210 ) ) ( not ( = ?auto_16217 ?auto_16229 ) ) ( not ( = ?auto_16211 ?auto_16209 ) ) ( not ( = ?auto_16211 ?auto_16218 ) ) ( not ( = ?auto_16211 ?auto_16219 ) ) ( not ( = ?auto_16213 ?auto_16215 ) ) ( not ( = ?auto_16213 ?auto_16208 ) ) ( not ( = ?auto_16213 ?auto_16230 ) ) ( not ( = ?auto_16192 ?auto_16197 ) ) ( not ( = ?auto_16192 ?auto_16231 ) ) ( not ( = ?auto_16193 ?auto_16197 ) ) ( not ( = ?auto_16193 ?auto_16231 ) ) ( not ( = ?auto_16194 ?auto_16197 ) ) ( not ( = ?auto_16194 ?auto_16231 ) ) ( not ( = ?auto_16195 ?auto_16197 ) ) ( not ( = ?auto_16195 ?auto_16231 ) ) ( not ( = ?auto_16197 ?auto_16213 ) ) ( not ( = ?auto_16197 ?auto_16215 ) ) ( not ( = ?auto_16197 ?auto_16208 ) ) ( not ( = ?auto_16197 ?auto_16230 ) ) ( not ( = ?auto_16220 ?auto_16217 ) ) ( not ( = ?auto_16220 ?auto_16224 ) ) ( not ( = ?auto_16220 ?auto_16210 ) ) ( not ( = ?auto_16220 ?auto_16229 ) ) ( not ( = ?auto_16214 ?auto_16211 ) ) ( not ( = ?auto_16214 ?auto_16209 ) ) ( not ( = ?auto_16214 ?auto_16218 ) ) ( not ( = ?auto_16214 ?auto_16219 ) ) ( not ( = ?auto_16231 ?auto_16213 ) ) ( not ( = ?auto_16231 ?auto_16215 ) ) ( not ( = ?auto_16231 ?auto_16208 ) ) ( not ( = ?auto_16231 ?auto_16230 ) ) ( not ( = ?auto_16192 ?auto_16198 ) ) ( not ( = ?auto_16192 ?auto_16212 ) ) ( not ( = ?auto_16193 ?auto_16198 ) ) ( not ( = ?auto_16193 ?auto_16212 ) ) ( not ( = ?auto_16194 ?auto_16198 ) ) ( not ( = ?auto_16194 ?auto_16212 ) ) ( not ( = ?auto_16195 ?auto_16198 ) ) ( not ( = ?auto_16195 ?auto_16212 ) ) ( not ( = ?auto_16196 ?auto_16198 ) ) ( not ( = ?auto_16196 ?auto_16212 ) ) ( not ( = ?auto_16198 ?auto_16231 ) ) ( not ( = ?auto_16198 ?auto_16213 ) ) ( not ( = ?auto_16198 ?auto_16215 ) ) ( not ( = ?auto_16198 ?auto_16208 ) ) ( not ( = ?auto_16198 ?auto_16230 ) ) ( not ( = ?auto_16216 ?auto_16220 ) ) ( not ( = ?auto_16216 ?auto_16217 ) ) ( not ( = ?auto_16216 ?auto_16224 ) ) ( not ( = ?auto_16216 ?auto_16210 ) ) ( not ( = ?auto_16216 ?auto_16229 ) ) ( not ( = ?auto_16225 ?auto_16214 ) ) ( not ( = ?auto_16225 ?auto_16211 ) ) ( not ( = ?auto_16225 ?auto_16209 ) ) ( not ( = ?auto_16225 ?auto_16218 ) ) ( not ( = ?auto_16225 ?auto_16219 ) ) ( not ( = ?auto_16212 ?auto_16231 ) ) ( not ( = ?auto_16212 ?auto_16213 ) ) ( not ( = ?auto_16212 ?auto_16215 ) ) ( not ( = ?auto_16212 ?auto_16208 ) ) ( not ( = ?auto_16212 ?auto_16230 ) ) ( not ( = ?auto_16192 ?auto_16199 ) ) ( not ( = ?auto_16192 ?auto_16227 ) ) ( not ( = ?auto_16193 ?auto_16199 ) ) ( not ( = ?auto_16193 ?auto_16227 ) ) ( not ( = ?auto_16194 ?auto_16199 ) ) ( not ( = ?auto_16194 ?auto_16227 ) ) ( not ( = ?auto_16195 ?auto_16199 ) ) ( not ( = ?auto_16195 ?auto_16227 ) ) ( not ( = ?auto_16196 ?auto_16199 ) ) ( not ( = ?auto_16196 ?auto_16227 ) ) ( not ( = ?auto_16197 ?auto_16199 ) ) ( not ( = ?auto_16197 ?auto_16227 ) ) ( not ( = ?auto_16199 ?auto_16212 ) ) ( not ( = ?auto_16199 ?auto_16231 ) ) ( not ( = ?auto_16199 ?auto_16213 ) ) ( not ( = ?auto_16199 ?auto_16215 ) ) ( not ( = ?auto_16199 ?auto_16208 ) ) ( not ( = ?auto_16199 ?auto_16230 ) ) ( not ( = ?auto_16222 ?auto_16216 ) ) ( not ( = ?auto_16222 ?auto_16220 ) ) ( not ( = ?auto_16222 ?auto_16217 ) ) ( not ( = ?auto_16222 ?auto_16224 ) ) ( not ( = ?auto_16222 ?auto_16210 ) ) ( not ( = ?auto_16222 ?auto_16229 ) ) ( not ( = ?auto_16226 ?auto_16225 ) ) ( not ( = ?auto_16226 ?auto_16214 ) ) ( not ( = ?auto_16226 ?auto_16211 ) ) ( not ( = ?auto_16226 ?auto_16209 ) ) ( not ( = ?auto_16226 ?auto_16218 ) ) ( not ( = ?auto_16226 ?auto_16219 ) ) ( not ( = ?auto_16227 ?auto_16212 ) ) ( not ( = ?auto_16227 ?auto_16231 ) ) ( not ( = ?auto_16227 ?auto_16213 ) ) ( not ( = ?auto_16227 ?auto_16215 ) ) ( not ( = ?auto_16227 ?auto_16208 ) ) ( not ( = ?auto_16227 ?auto_16230 ) ) ( not ( = ?auto_16192 ?auto_16200 ) ) ( not ( = ?auto_16192 ?auto_16221 ) ) ( not ( = ?auto_16193 ?auto_16200 ) ) ( not ( = ?auto_16193 ?auto_16221 ) ) ( not ( = ?auto_16194 ?auto_16200 ) ) ( not ( = ?auto_16194 ?auto_16221 ) ) ( not ( = ?auto_16195 ?auto_16200 ) ) ( not ( = ?auto_16195 ?auto_16221 ) ) ( not ( = ?auto_16196 ?auto_16200 ) ) ( not ( = ?auto_16196 ?auto_16221 ) ) ( not ( = ?auto_16197 ?auto_16200 ) ) ( not ( = ?auto_16197 ?auto_16221 ) ) ( not ( = ?auto_16198 ?auto_16200 ) ) ( not ( = ?auto_16198 ?auto_16221 ) ) ( not ( = ?auto_16200 ?auto_16227 ) ) ( not ( = ?auto_16200 ?auto_16212 ) ) ( not ( = ?auto_16200 ?auto_16231 ) ) ( not ( = ?auto_16200 ?auto_16213 ) ) ( not ( = ?auto_16200 ?auto_16215 ) ) ( not ( = ?auto_16200 ?auto_16208 ) ) ( not ( = ?auto_16200 ?auto_16230 ) ) ( not ( = ?auto_16228 ?auto_16222 ) ) ( not ( = ?auto_16228 ?auto_16216 ) ) ( not ( = ?auto_16228 ?auto_16220 ) ) ( not ( = ?auto_16228 ?auto_16217 ) ) ( not ( = ?auto_16228 ?auto_16224 ) ) ( not ( = ?auto_16228 ?auto_16210 ) ) ( not ( = ?auto_16228 ?auto_16229 ) ) ( not ( = ?auto_16223 ?auto_16226 ) ) ( not ( = ?auto_16223 ?auto_16225 ) ) ( not ( = ?auto_16223 ?auto_16214 ) ) ( not ( = ?auto_16223 ?auto_16211 ) ) ( not ( = ?auto_16223 ?auto_16209 ) ) ( not ( = ?auto_16223 ?auto_16218 ) ) ( not ( = ?auto_16223 ?auto_16219 ) ) ( not ( = ?auto_16221 ?auto_16227 ) ) ( not ( = ?auto_16221 ?auto_16212 ) ) ( not ( = ?auto_16221 ?auto_16231 ) ) ( not ( = ?auto_16221 ?auto_16213 ) ) ( not ( = ?auto_16221 ?auto_16215 ) ) ( not ( = ?auto_16221 ?auto_16208 ) ) ( not ( = ?auto_16221 ?auto_16230 ) ) ( not ( = ?auto_16192 ?auto_16201 ) ) ( not ( = ?auto_16192 ?auto_16204 ) ) ( not ( = ?auto_16193 ?auto_16201 ) ) ( not ( = ?auto_16193 ?auto_16204 ) ) ( not ( = ?auto_16194 ?auto_16201 ) ) ( not ( = ?auto_16194 ?auto_16204 ) ) ( not ( = ?auto_16195 ?auto_16201 ) ) ( not ( = ?auto_16195 ?auto_16204 ) ) ( not ( = ?auto_16196 ?auto_16201 ) ) ( not ( = ?auto_16196 ?auto_16204 ) ) ( not ( = ?auto_16197 ?auto_16201 ) ) ( not ( = ?auto_16197 ?auto_16204 ) ) ( not ( = ?auto_16198 ?auto_16201 ) ) ( not ( = ?auto_16198 ?auto_16204 ) ) ( not ( = ?auto_16199 ?auto_16201 ) ) ( not ( = ?auto_16199 ?auto_16204 ) ) ( not ( = ?auto_16201 ?auto_16221 ) ) ( not ( = ?auto_16201 ?auto_16227 ) ) ( not ( = ?auto_16201 ?auto_16212 ) ) ( not ( = ?auto_16201 ?auto_16231 ) ) ( not ( = ?auto_16201 ?auto_16213 ) ) ( not ( = ?auto_16201 ?auto_16215 ) ) ( not ( = ?auto_16201 ?auto_16208 ) ) ( not ( = ?auto_16201 ?auto_16230 ) ) ( not ( = ?auto_16205 ?auto_16228 ) ) ( not ( = ?auto_16205 ?auto_16222 ) ) ( not ( = ?auto_16205 ?auto_16216 ) ) ( not ( = ?auto_16205 ?auto_16220 ) ) ( not ( = ?auto_16205 ?auto_16217 ) ) ( not ( = ?auto_16205 ?auto_16224 ) ) ( not ( = ?auto_16205 ?auto_16210 ) ) ( not ( = ?auto_16205 ?auto_16229 ) ) ( not ( = ?auto_16207 ?auto_16223 ) ) ( not ( = ?auto_16207 ?auto_16226 ) ) ( not ( = ?auto_16207 ?auto_16225 ) ) ( not ( = ?auto_16207 ?auto_16214 ) ) ( not ( = ?auto_16207 ?auto_16211 ) ) ( not ( = ?auto_16207 ?auto_16209 ) ) ( not ( = ?auto_16207 ?auto_16218 ) ) ( not ( = ?auto_16207 ?auto_16219 ) ) ( not ( = ?auto_16204 ?auto_16221 ) ) ( not ( = ?auto_16204 ?auto_16227 ) ) ( not ( = ?auto_16204 ?auto_16212 ) ) ( not ( = ?auto_16204 ?auto_16231 ) ) ( not ( = ?auto_16204 ?auto_16213 ) ) ( not ( = ?auto_16204 ?auto_16215 ) ) ( not ( = ?auto_16204 ?auto_16208 ) ) ( not ( = ?auto_16204 ?auto_16230 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_16192 ?auto_16193 ?auto_16194 ?auto_16195 ?auto_16196 ?auto_16197 ?auto_16198 ?auto_16199 ?auto_16200 )
      ( MAKE-1CRATE ?auto_16200 ?auto_16201 )
      ( MAKE-9CRATE-VERIFY ?auto_16192 ?auto_16193 ?auto_16194 ?auto_16195 ?auto_16196 ?auto_16197 ?auto_16198 ?auto_16199 ?auto_16200 ?auto_16201 ) )
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
      ?auto_16260 - SURFACE
      ?auto_16261 - SURFACE
      ?auto_16262 - SURFACE
      ?auto_16263 - SURFACE
    )
    :vars
    (
      ?auto_16267 - HOIST
      ?auto_16268 - PLACE
      ?auto_16264 - PLACE
      ?auto_16266 - HOIST
      ?auto_16269 - SURFACE
      ?auto_16284 - SURFACE
      ?auto_16281 - PLACE
      ?auto_16274 - HOIST
      ?auto_16275 - SURFACE
      ?auto_16287 - PLACE
      ?auto_16289 - HOIST
      ?auto_16283 - SURFACE
      ?auto_16273 - PLACE
      ?auto_16291 - HOIST
      ?auto_16279 - SURFACE
      ?auto_16285 - PLACE
      ?auto_16277 - HOIST
      ?auto_16294 - SURFACE
      ?auto_16270 - PLACE
      ?auto_16290 - HOIST
      ?auto_16278 - SURFACE
      ?auto_16286 - PLACE
      ?auto_16288 - HOIST
      ?auto_16276 - SURFACE
      ?auto_16282 - PLACE
      ?auto_16293 - HOIST
      ?auto_16280 - SURFACE
      ?auto_16272 - PLACE
      ?auto_16271 - HOIST
      ?auto_16292 - SURFACE
      ?auto_16265 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16267 ?auto_16268 ) ( IS-CRATE ?auto_16263 ) ( not ( = ?auto_16264 ?auto_16268 ) ) ( HOIST-AT ?auto_16266 ?auto_16264 ) ( SURFACE-AT ?auto_16263 ?auto_16264 ) ( ON ?auto_16263 ?auto_16269 ) ( CLEAR ?auto_16263 ) ( not ( = ?auto_16262 ?auto_16263 ) ) ( not ( = ?auto_16262 ?auto_16269 ) ) ( not ( = ?auto_16263 ?auto_16269 ) ) ( not ( = ?auto_16267 ?auto_16266 ) ) ( IS-CRATE ?auto_16262 ) ( AVAILABLE ?auto_16266 ) ( SURFACE-AT ?auto_16262 ?auto_16264 ) ( ON ?auto_16262 ?auto_16284 ) ( CLEAR ?auto_16262 ) ( not ( = ?auto_16261 ?auto_16262 ) ) ( not ( = ?auto_16261 ?auto_16284 ) ) ( not ( = ?auto_16262 ?auto_16284 ) ) ( IS-CRATE ?auto_16261 ) ( not ( = ?auto_16281 ?auto_16268 ) ) ( HOIST-AT ?auto_16274 ?auto_16281 ) ( AVAILABLE ?auto_16274 ) ( SURFACE-AT ?auto_16261 ?auto_16281 ) ( ON ?auto_16261 ?auto_16275 ) ( CLEAR ?auto_16261 ) ( not ( = ?auto_16260 ?auto_16261 ) ) ( not ( = ?auto_16260 ?auto_16275 ) ) ( not ( = ?auto_16261 ?auto_16275 ) ) ( not ( = ?auto_16267 ?auto_16274 ) ) ( IS-CRATE ?auto_16260 ) ( not ( = ?auto_16287 ?auto_16268 ) ) ( HOIST-AT ?auto_16289 ?auto_16287 ) ( AVAILABLE ?auto_16289 ) ( SURFACE-AT ?auto_16260 ?auto_16287 ) ( ON ?auto_16260 ?auto_16283 ) ( CLEAR ?auto_16260 ) ( not ( = ?auto_16259 ?auto_16260 ) ) ( not ( = ?auto_16259 ?auto_16283 ) ) ( not ( = ?auto_16260 ?auto_16283 ) ) ( not ( = ?auto_16267 ?auto_16289 ) ) ( IS-CRATE ?auto_16259 ) ( not ( = ?auto_16273 ?auto_16268 ) ) ( HOIST-AT ?auto_16291 ?auto_16273 ) ( AVAILABLE ?auto_16291 ) ( SURFACE-AT ?auto_16259 ?auto_16273 ) ( ON ?auto_16259 ?auto_16279 ) ( CLEAR ?auto_16259 ) ( not ( = ?auto_16258 ?auto_16259 ) ) ( not ( = ?auto_16258 ?auto_16279 ) ) ( not ( = ?auto_16259 ?auto_16279 ) ) ( not ( = ?auto_16267 ?auto_16291 ) ) ( IS-CRATE ?auto_16258 ) ( not ( = ?auto_16285 ?auto_16268 ) ) ( HOIST-AT ?auto_16277 ?auto_16285 ) ( AVAILABLE ?auto_16277 ) ( SURFACE-AT ?auto_16258 ?auto_16285 ) ( ON ?auto_16258 ?auto_16294 ) ( CLEAR ?auto_16258 ) ( not ( = ?auto_16257 ?auto_16258 ) ) ( not ( = ?auto_16257 ?auto_16294 ) ) ( not ( = ?auto_16258 ?auto_16294 ) ) ( not ( = ?auto_16267 ?auto_16277 ) ) ( IS-CRATE ?auto_16257 ) ( not ( = ?auto_16270 ?auto_16268 ) ) ( HOIST-AT ?auto_16290 ?auto_16270 ) ( AVAILABLE ?auto_16290 ) ( SURFACE-AT ?auto_16257 ?auto_16270 ) ( ON ?auto_16257 ?auto_16278 ) ( CLEAR ?auto_16257 ) ( not ( = ?auto_16256 ?auto_16257 ) ) ( not ( = ?auto_16256 ?auto_16278 ) ) ( not ( = ?auto_16257 ?auto_16278 ) ) ( not ( = ?auto_16267 ?auto_16290 ) ) ( IS-CRATE ?auto_16256 ) ( not ( = ?auto_16286 ?auto_16268 ) ) ( HOIST-AT ?auto_16288 ?auto_16286 ) ( AVAILABLE ?auto_16288 ) ( SURFACE-AT ?auto_16256 ?auto_16286 ) ( ON ?auto_16256 ?auto_16276 ) ( CLEAR ?auto_16256 ) ( not ( = ?auto_16255 ?auto_16256 ) ) ( not ( = ?auto_16255 ?auto_16276 ) ) ( not ( = ?auto_16256 ?auto_16276 ) ) ( not ( = ?auto_16267 ?auto_16288 ) ) ( IS-CRATE ?auto_16255 ) ( not ( = ?auto_16282 ?auto_16268 ) ) ( HOIST-AT ?auto_16293 ?auto_16282 ) ( AVAILABLE ?auto_16293 ) ( SURFACE-AT ?auto_16255 ?auto_16282 ) ( ON ?auto_16255 ?auto_16280 ) ( CLEAR ?auto_16255 ) ( not ( = ?auto_16254 ?auto_16255 ) ) ( not ( = ?auto_16254 ?auto_16280 ) ) ( not ( = ?auto_16255 ?auto_16280 ) ) ( not ( = ?auto_16267 ?auto_16293 ) ) ( SURFACE-AT ?auto_16253 ?auto_16268 ) ( CLEAR ?auto_16253 ) ( IS-CRATE ?auto_16254 ) ( AVAILABLE ?auto_16267 ) ( not ( = ?auto_16272 ?auto_16268 ) ) ( HOIST-AT ?auto_16271 ?auto_16272 ) ( AVAILABLE ?auto_16271 ) ( SURFACE-AT ?auto_16254 ?auto_16272 ) ( ON ?auto_16254 ?auto_16292 ) ( CLEAR ?auto_16254 ) ( TRUCK-AT ?auto_16265 ?auto_16268 ) ( not ( = ?auto_16253 ?auto_16254 ) ) ( not ( = ?auto_16253 ?auto_16292 ) ) ( not ( = ?auto_16254 ?auto_16292 ) ) ( not ( = ?auto_16267 ?auto_16271 ) ) ( not ( = ?auto_16253 ?auto_16255 ) ) ( not ( = ?auto_16253 ?auto_16280 ) ) ( not ( = ?auto_16255 ?auto_16292 ) ) ( not ( = ?auto_16282 ?auto_16272 ) ) ( not ( = ?auto_16293 ?auto_16271 ) ) ( not ( = ?auto_16280 ?auto_16292 ) ) ( not ( = ?auto_16253 ?auto_16256 ) ) ( not ( = ?auto_16253 ?auto_16276 ) ) ( not ( = ?auto_16254 ?auto_16256 ) ) ( not ( = ?auto_16254 ?auto_16276 ) ) ( not ( = ?auto_16256 ?auto_16280 ) ) ( not ( = ?auto_16256 ?auto_16292 ) ) ( not ( = ?auto_16286 ?auto_16282 ) ) ( not ( = ?auto_16286 ?auto_16272 ) ) ( not ( = ?auto_16288 ?auto_16293 ) ) ( not ( = ?auto_16288 ?auto_16271 ) ) ( not ( = ?auto_16276 ?auto_16280 ) ) ( not ( = ?auto_16276 ?auto_16292 ) ) ( not ( = ?auto_16253 ?auto_16257 ) ) ( not ( = ?auto_16253 ?auto_16278 ) ) ( not ( = ?auto_16254 ?auto_16257 ) ) ( not ( = ?auto_16254 ?auto_16278 ) ) ( not ( = ?auto_16255 ?auto_16257 ) ) ( not ( = ?auto_16255 ?auto_16278 ) ) ( not ( = ?auto_16257 ?auto_16276 ) ) ( not ( = ?auto_16257 ?auto_16280 ) ) ( not ( = ?auto_16257 ?auto_16292 ) ) ( not ( = ?auto_16270 ?auto_16286 ) ) ( not ( = ?auto_16270 ?auto_16282 ) ) ( not ( = ?auto_16270 ?auto_16272 ) ) ( not ( = ?auto_16290 ?auto_16288 ) ) ( not ( = ?auto_16290 ?auto_16293 ) ) ( not ( = ?auto_16290 ?auto_16271 ) ) ( not ( = ?auto_16278 ?auto_16276 ) ) ( not ( = ?auto_16278 ?auto_16280 ) ) ( not ( = ?auto_16278 ?auto_16292 ) ) ( not ( = ?auto_16253 ?auto_16258 ) ) ( not ( = ?auto_16253 ?auto_16294 ) ) ( not ( = ?auto_16254 ?auto_16258 ) ) ( not ( = ?auto_16254 ?auto_16294 ) ) ( not ( = ?auto_16255 ?auto_16258 ) ) ( not ( = ?auto_16255 ?auto_16294 ) ) ( not ( = ?auto_16256 ?auto_16258 ) ) ( not ( = ?auto_16256 ?auto_16294 ) ) ( not ( = ?auto_16258 ?auto_16278 ) ) ( not ( = ?auto_16258 ?auto_16276 ) ) ( not ( = ?auto_16258 ?auto_16280 ) ) ( not ( = ?auto_16258 ?auto_16292 ) ) ( not ( = ?auto_16285 ?auto_16270 ) ) ( not ( = ?auto_16285 ?auto_16286 ) ) ( not ( = ?auto_16285 ?auto_16282 ) ) ( not ( = ?auto_16285 ?auto_16272 ) ) ( not ( = ?auto_16277 ?auto_16290 ) ) ( not ( = ?auto_16277 ?auto_16288 ) ) ( not ( = ?auto_16277 ?auto_16293 ) ) ( not ( = ?auto_16277 ?auto_16271 ) ) ( not ( = ?auto_16294 ?auto_16278 ) ) ( not ( = ?auto_16294 ?auto_16276 ) ) ( not ( = ?auto_16294 ?auto_16280 ) ) ( not ( = ?auto_16294 ?auto_16292 ) ) ( not ( = ?auto_16253 ?auto_16259 ) ) ( not ( = ?auto_16253 ?auto_16279 ) ) ( not ( = ?auto_16254 ?auto_16259 ) ) ( not ( = ?auto_16254 ?auto_16279 ) ) ( not ( = ?auto_16255 ?auto_16259 ) ) ( not ( = ?auto_16255 ?auto_16279 ) ) ( not ( = ?auto_16256 ?auto_16259 ) ) ( not ( = ?auto_16256 ?auto_16279 ) ) ( not ( = ?auto_16257 ?auto_16259 ) ) ( not ( = ?auto_16257 ?auto_16279 ) ) ( not ( = ?auto_16259 ?auto_16294 ) ) ( not ( = ?auto_16259 ?auto_16278 ) ) ( not ( = ?auto_16259 ?auto_16276 ) ) ( not ( = ?auto_16259 ?auto_16280 ) ) ( not ( = ?auto_16259 ?auto_16292 ) ) ( not ( = ?auto_16273 ?auto_16285 ) ) ( not ( = ?auto_16273 ?auto_16270 ) ) ( not ( = ?auto_16273 ?auto_16286 ) ) ( not ( = ?auto_16273 ?auto_16282 ) ) ( not ( = ?auto_16273 ?auto_16272 ) ) ( not ( = ?auto_16291 ?auto_16277 ) ) ( not ( = ?auto_16291 ?auto_16290 ) ) ( not ( = ?auto_16291 ?auto_16288 ) ) ( not ( = ?auto_16291 ?auto_16293 ) ) ( not ( = ?auto_16291 ?auto_16271 ) ) ( not ( = ?auto_16279 ?auto_16294 ) ) ( not ( = ?auto_16279 ?auto_16278 ) ) ( not ( = ?auto_16279 ?auto_16276 ) ) ( not ( = ?auto_16279 ?auto_16280 ) ) ( not ( = ?auto_16279 ?auto_16292 ) ) ( not ( = ?auto_16253 ?auto_16260 ) ) ( not ( = ?auto_16253 ?auto_16283 ) ) ( not ( = ?auto_16254 ?auto_16260 ) ) ( not ( = ?auto_16254 ?auto_16283 ) ) ( not ( = ?auto_16255 ?auto_16260 ) ) ( not ( = ?auto_16255 ?auto_16283 ) ) ( not ( = ?auto_16256 ?auto_16260 ) ) ( not ( = ?auto_16256 ?auto_16283 ) ) ( not ( = ?auto_16257 ?auto_16260 ) ) ( not ( = ?auto_16257 ?auto_16283 ) ) ( not ( = ?auto_16258 ?auto_16260 ) ) ( not ( = ?auto_16258 ?auto_16283 ) ) ( not ( = ?auto_16260 ?auto_16279 ) ) ( not ( = ?auto_16260 ?auto_16294 ) ) ( not ( = ?auto_16260 ?auto_16278 ) ) ( not ( = ?auto_16260 ?auto_16276 ) ) ( not ( = ?auto_16260 ?auto_16280 ) ) ( not ( = ?auto_16260 ?auto_16292 ) ) ( not ( = ?auto_16287 ?auto_16273 ) ) ( not ( = ?auto_16287 ?auto_16285 ) ) ( not ( = ?auto_16287 ?auto_16270 ) ) ( not ( = ?auto_16287 ?auto_16286 ) ) ( not ( = ?auto_16287 ?auto_16282 ) ) ( not ( = ?auto_16287 ?auto_16272 ) ) ( not ( = ?auto_16289 ?auto_16291 ) ) ( not ( = ?auto_16289 ?auto_16277 ) ) ( not ( = ?auto_16289 ?auto_16290 ) ) ( not ( = ?auto_16289 ?auto_16288 ) ) ( not ( = ?auto_16289 ?auto_16293 ) ) ( not ( = ?auto_16289 ?auto_16271 ) ) ( not ( = ?auto_16283 ?auto_16279 ) ) ( not ( = ?auto_16283 ?auto_16294 ) ) ( not ( = ?auto_16283 ?auto_16278 ) ) ( not ( = ?auto_16283 ?auto_16276 ) ) ( not ( = ?auto_16283 ?auto_16280 ) ) ( not ( = ?auto_16283 ?auto_16292 ) ) ( not ( = ?auto_16253 ?auto_16261 ) ) ( not ( = ?auto_16253 ?auto_16275 ) ) ( not ( = ?auto_16254 ?auto_16261 ) ) ( not ( = ?auto_16254 ?auto_16275 ) ) ( not ( = ?auto_16255 ?auto_16261 ) ) ( not ( = ?auto_16255 ?auto_16275 ) ) ( not ( = ?auto_16256 ?auto_16261 ) ) ( not ( = ?auto_16256 ?auto_16275 ) ) ( not ( = ?auto_16257 ?auto_16261 ) ) ( not ( = ?auto_16257 ?auto_16275 ) ) ( not ( = ?auto_16258 ?auto_16261 ) ) ( not ( = ?auto_16258 ?auto_16275 ) ) ( not ( = ?auto_16259 ?auto_16261 ) ) ( not ( = ?auto_16259 ?auto_16275 ) ) ( not ( = ?auto_16261 ?auto_16283 ) ) ( not ( = ?auto_16261 ?auto_16279 ) ) ( not ( = ?auto_16261 ?auto_16294 ) ) ( not ( = ?auto_16261 ?auto_16278 ) ) ( not ( = ?auto_16261 ?auto_16276 ) ) ( not ( = ?auto_16261 ?auto_16280 ) ) ( not ( = ?auto_16261 ?auto_16292 ) ) ( not ( = ?auto_16281 ?auto_16287 ) ) ( not ( = ?auto_16281 ?auto_16273 ) ) ( not ( = ?auto_16281 ?auto_16285 ) ) ( not ( = ?auto_16281 ?auto_16270 ) ) ( not ( = ?auto_16281 ?auto_16286 ) ) ( not ( = ?auto_16281 ?auto_16282 ) ) ( not ( = ?auto_16281 ?auto_16272 ) ) ( not ( = ?auto_16274 ?auto_16289 ) ) ( not ( = ?auto_16274 ?auto_16291 ) ) ( not ( = ?auto_16274 ?auto_16277 ) ) ( not ( = ?auto_16274 ?auto_16290 ) ) ( not ( = ?auto_16274 ?auto_16288 ) ) ( not ( = ?auto_16274 ?auto_16293 ) ) ( not ( = ?auto_16274 ?auto_16271 ) ) ( not ( = ?auto_16275 ?auto_16283 ) ) ( not ( = ?auto_16275 ?auto_16279 ) ) ( not ( = ?auto_16275 ?auto_16294 ) ) ( not ( = ?auto_16275 ?auto_16278 ) ) ( not ( = ?auto_16275 ?auto_16276 ) ) ( not ( = ?auto_16275 ?auto_16280 ) ) ( not ( = ?auto_16275 ?auto_16292 ) ) ( not ( = ?auto_16253 ?auto_16262 ) ) ( not ( = ?auto_16253 ?auto_16284 ) ) ( not ( = ?auto_16254 ?auto_16262 ) ) ( not ( = ?auto_16254 ?auto_16284 ) ) ( not ( = ?auto_16255 ?auto_16262 ) ) ( not ( = ?auto_16255 ?auto_16284 ) ) ( not ( = ?auto_16256 ?auto_16262 ) ) ( not ( = ?auto_16256 ?auto_16284 ) ) ( not ( = ?auto_16257 ?auto_16262 ) ) ( not ( = ?auto_16257 ?auto_16284 ) ) ( not ( = ?auto_16258 ?auto_16262 ) ) ( not ( = ?auto_16258 ?auto_16284 ) ) ( not ( = ?auto_16259 ?auto_16262 ) ) ( not ( = ?auto_16259 ?auto_16284 ) ) ( not ( = ?auto_16260 ?auto_16262 ) ) ( not ( = ?auto_16260 ?auto_16284 ) ) ( not ( = ?auto_16262 ?auto_16275 ) ) ( not ( = ?auto_16262 ?auto_16283 ) ) ( not ( = ?auto_16262 ?auto_16279 ) ) ( not ( = ?auto_16262 ?auto_16294 ) ) ( not ( = ?auto_16262 ?auto_16278 ) ) ( not ( = ?auto_16262 ?auto_16276 ) ) ( not ( = ?auto_16262 ?auto_16280 ) ) ( not ( = ?auto_16262 ?auto_16292 ) ) ( not ( = ?auto_16264 ?auto_16281 ) ) ( not ( = ?auto_16264 ?auto_16287 ) ) ( not ( = ?auto_16264 ?auto_16273 ) ) ( not ( = ?auto_16264 ?auto_16285 ) ) ( not ( = ?auto_16264 ?auto_16270 ) ) ( not ( = ?auto_16264 ?auto_16286 ) ) ( not ( = ?auto_16264 ?auto_16282 ) ) ( not ( = ?auto_16264 ?auto_16272 ) ) ( not ( = ?auto_16266 ?auto_16274 ) ) ( not ( = ?auto_16266 ?auto_16289 ) ) ( not ( = ?auto_16266 ?auto_16291 ) ) ( not ( = ?auto_16266 ?auto_16277 ) ) ( not ( = ?auto_16266 ?auto_16290 ) ) ( not ( = ?auto_16266 ?auto_16288 ) ) ( not ( = ?auto_16266 ?auto_16293 ) ) ( not ( = ?auto_16266 ?auto_16271 ) ) ( not ( = ?auto_16284 ?auto_16275 ) ) ( not ( = ?auto_16284 ?auto_16283 ) ) ( not ( = ?auto_16284 ?auto_16279 ) ) ( not ( = ?auto_16284 ?auto_16294 ) ) ( not ( = ?auto_16284 ?auto_16278 ) ) ( not ( = ?auto_16284 ?auto_16276 ) ) ( not ( = ?auto_16284 ?auto_16280 ) ) ( not ( = ?auto_16284 ?auto_16292 ) ) ( not ( = ?auto_16253 ?auto_16263 ) ) ( not ( = ?auto_16253 ?auto_16269 ) ) ( not ( = ?auto_16254 ?auto_16263 ) ) ( not ( = ?auto_16254 ?auto_16269 ) ) ( not ( = ?auto_16255 ?auto_16263 ) ) ( not ( = ?auto_16255 ?auto_16269 ) ) ( not ( = ?auto_16256 ?auto_16263 ) ) ( not ( = ?auto_16256 ?auto_16269 ) ) ( not ( = ?auto_16257 ?auto_16263 ) ) ( not ( = ?auto_16257 ?auto_16269 ) ) ( not ( = ?auto_16258 ?auto_16263 ) ) ( not ( = ?auto_16258 ?auto_16269 ) ) ( not ( = ?auto_16259 ?auto_16263 ) ) ( not ( = ?auto_16259 ?auto_16269 ) ) ( not ( = ?auto_16260 ?auto_16263 ) ) ( not ( = ?auto_16260 ?auto_16269 ) ) ( not ( = ?auto_16261 ?auto_16263 ) ) ( not ( = ?auto_16261 ?auto_16269 ) ) ( not ( = ?auto_16263 ?auto_16284 ) ) ( not ( = ?auto_16263 ?auto_16275 ) ) ( not ( = ?auto_16263 ?auto_16283 ) ) ( not ( = ?auto_16263 ?auto_16279 ) ) ( not ( = ?auto_16263 ?auto_16294 ) ) ( not ( = ?auto_16263 ?auto_16278 ) ) ( not ( = ?auto_16263 ?auto_16276 ) ) ( not ( = ?auto_16263 ?auto_16280 ) ) ( not ( = ?auto_16263 ?auto_16292 ) ) ( not ( = ?auto_16269 ?auto_16284 ) ) ( not ( = ?auto_16269 ?auto_16275 ) ) ( not ( = ?auto_16269 ?auto_16283 ) ) ( not ( = ?auto_16269 ?auto_16279 ) ) ( not ( = ?auto_16269 ?auto_16294 ) ) ( not ( = ?auto_16269 ?auto_16278 ) ) ( not ( = ?auto_16269 ?auto_16276 ) ) ( not ( = ?auto_16269 ?auto_16280 ) ) ( not ( = ?auto_16269 ?auto_16292 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_16253 ?auto_16254 ?auto_16255 ?auto_16256 ?auto_16257 ?auto_16258 ?auto_16259 ?auto_16260 ?auto_16261 ?auto_16262 )
      ( MAKE-1CRATE ?auto_16262 ?auto_16263 )
      ( MAKE-10CRATE-VERIFY ?auto_16253 ?auto_16254 ?auto_16255 ?auto_16256 ?auto_16257 ?auto_16258 ?auto_16259 ?auto_16260 ?auto_16261 ?auto_16262 ?auto_16263 ) )
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
      ?auto_16324 - SURFACE
      ?auto_16325 - SURFACE
      ?auto_16326 - SURFACE
      ?auto_16327 - SURFACE
      ?auto_16328 - SURFACE
    )
    :vars
    (
      ?auto_16333 - HOIST
      ?auto_16331 - PLACE
      ?auto_16334 - PLACE
      ?auto_16332 - HOIST
      ?auto_16329 - SURFACE
      ?auto_16355 - PLACE
      ?auto_16335 - HOIST
      ?auto_16343 - SURFACE
      ?auto_16356 - SURFACE
      ?auto_16344 - PLACE
      ?auto_16346 - HOIST
      ?auto_16347 - SURFACE
      ?auto_16345 - PLACE
      ?auto_16340 - HOIST
      ?auto_16354 - SURFACE
      ?auto_16348 - PLACE
      ?auto_16350 - HOIST
      ?auto_16357 - SURFACE
      ?auto_16338 - PLACE
      ?auto_16341 - HOIST
      ?auto_16353 - SURFACE
      ?auto_16349 - PLACE
      ?auto_16342 - HOIST
      ?auto_16351 - SURFACE
      ?auto_16360 - PLACE
      ?auto_16361 - HOIST
      ?auto_16337 - SURFACE
      ?auto_16358 - PLACE
      ?auto_16336 - HOIST
      ?auto_16352 - SURFACE
      ?auto_16359 - PLACE
      ?auto_16339 - HOIST
      ?auto_16362 - SURFACE
      ?auto_16330 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16333 ?auto_16331 ) ( IS-CRATE ?auto_16328 ) ( not ( = ?auto_16334 ?auto_16331 ) ) ( HOIST-AT ?auto_16332 ?auto_16334 ) ( AVAILABLE ?auto_16332 ) ( SURFACE-AT ?auto_16328 ?auto_16334 ) ( ON ?auto_16328 ?auto_16329 ) ( CLEAR ?auto_16328 ) ( not ( = ?auto_16327 ?auto_16328 ) ) ( not ( = ?auto_16327 ?auto_16329 ) ) ( not ( = ?auto_16328 ?auto_16329 ) ) ( not ( = ?auto_16333 ?auto_16332 ) ) ( IS-CRATE ?auto_16327 ) ( not ( = ?auto_16355 ?auto_16331 ) ) ( HOIST-AT ?auto_16335 ?auto_16355 ) ( SURFACE-AT ?auto_16327 ?auto_16355 ) ( ON ?auto_16327 ?auto_16343 ) ( CLEAR ?auto_16327 ) ( not ( = ?auto_16326 ?auto_16327 ) ) ( not ( = ?auto_16326 ?auto_16343 ) ) ( not ( = ?auto_16327 ?auto_16343 ) ) ( not ( = ?auto_16333 ?auto_16335 ) ) ( IS-CRATE ?auto_16326 ) ( AVAILABLE ?auto_16335 ) ( SURFACE-AT ?auto_16326 ?auto_16355 ) ( ON ?auto_16326 ?auto_16356 ) ( CLEAR ?auto_16326 ) ( not ( = ?auto_16325 ?auto_16326 ) ) ( not ( = ?auto_16325 ?auto_16356 ) ) ( not ( = ?auto_16326 ?auto_16356 ) ) ( IS-CRATE ?auto_16325 ) ( not ( = ?auto_16344 ?auto_16331 ) ) ( HOIST-AT ?auto_16346 ?auto_16344 ) ( AVAILABLE ?auto_16346 ) ( SURFACE-AT ?auto_16325 ?auto_16344 ) ( ON ?auto_16325 ?auto_16347 ) ( CLEAR ?auto_16325 ) ( not ( = ?auto_16324 ?auto_16325 ) ) ( not ( = ?auto_16324 ?auto_16347 ) ) ( not ( = ?auto_16325 ?auto_16347 ) ) ( not ( = ?auto_16333 ?auto_16346 ) ) ( IS-CRATE ?auto_16324 ) ( not ( = ?auto_16345 ?auto_16331 ) ) ( HOIST-AT ?auto_16340 ?auto_16345 ) ( AVAILABLE ?auto_16340 ) ( SURFACE-AT ?auto_16324 ?auto_16345 ) ( ON ?auto_16324 ?auto_16354 ) ( CLEAR ?auto_16324 ) ( not ( = ?auto_16323 ?auto_16324 ) ) ( not ( = ?auto_16323 ?auto_16354 ) ) ( not ( = ?auto_16324 ?auto_16354 ) ) ( not ( = ?auto_16333 ?auto_16340 ) ) ( IS-CRATE ?auto_16323 ) ( not ( = ?auto_16348 ?auto_16331 ) ) ( HOIST-AT ?auto_16350 ?auto_16348 ) ( AVAILABLE ?auto_16350 ) ( SURFACE-AT ?auto_16323 ?auto_16348 ) ( ON ?auto_16323 ?auto_16357 ) ( CLEAR ?auto_16323 ) ( not ( = ?auto_16322 ?auto_16323 ) ) ( not ( = ?auto_16322 ?auto_16357 ) ) ( not ( = ?auto_16323 ?auto_16357 ) ) ( not ( = ?auto_16333 ?auto_16350 ) ) ( IS-CRATE ?auto_16322 ) ( not ( = ?auto_16338 ?auto_16331 ) ) ( HOIST-AT ?auto_16341 ?auto_16338 ) ( AVAILABLE ?auto_16341 ) ( SURFACE-AT ?auto_16322 ?auto_16338 ) ( ON ?auto_16322 ?auto_16353 ) ( CLEAR ?auto_16322 ) ( not ( = ?auto_16321 ?auto_16322 ) ) ( not ( = ?auto_16321 ?auto_16353 ) ) ( not ( = ?auto_16322 ?auto_16353 ) ) ( not ( = ?auto_16333 ?auto_16341 ) ) ( IS-CRATE ?auto_16321 ) ( not ( = ?auto_16349 ?auto_16331 ) ) ( HOIST-AT ?auto_16342 ?auto_16349 ) ( AVAILABLE ?auto_16342 ) ( SURFACE-AT ?auto_16321 ?auto_16349 ) ( ON ?auto_16321 ?auto_16351 ) ( CLEAR ?auto_16321 ) ( not ( = ?auto_16320 ?auto_16321 ) ) ( not ( = ?auto_16320 ?auto_16351 ) ) ( not ( = ?auto_16321 ?auto_16351 ) ) ( not ( = ?auto_16333 ?auto_16342 ) ) ( IS-CRATE ?auto_16320 ) ( not ( = ?auto_16360 ?auto_16331 ) ) ( HOIST-AT ?auto_16361 ?auto_16360 ) ( AVAILABLE ?auto_16361 ) ( SURFACE-AT ?auto_16320 ?auto_16360 ) ( ON ?auto_16320 ?auto_16337 ) ( CLEAR ?auto_16320 ) ( not ( = ?auto_16319 ?auto_16320 ) ) ( not ( = ?auto_16319 ?auto_16337 ) ) ( not ( = ?auto_16320 ?auto_16337 ) ) ( not ( = ?auto_16333 ?auto_16361 ) ) ( IS-CRATE ?auto_16319 ) ( not ( = ?auto_16358 ?auto_16331 ) ) ( HOIST-AT ?auto_16336 ?auto_16358 ) ( AVAILABLE ?auto_16336 ) ( SURFACE-AT ?auto_16319 ?auto_16358 ) ( ON ?auto_16319 ?auto_16352 ) ( CLEAR ?auto_16319 ) ( not ( = ?auto_16318 ?auto_16319 ) ) ( not ( = ?auto_16318 ?auto_16352 ) ) ( not ( = ?auto_16319 ?auto_16352 ) ) ( not ( = ?auto_16333 ?auto_16336 ) ) ( SURFACE-AT ?auto_16317 ?auto_16331 ) ( CLEAR ?auto_16317 ) ( IS-CRATE ?auto_16318 ) ( AVAILABLE ?auto_16333 ) ( not ( = ?auto_16359 ?auto_16331 ) ) ( HOIST-AT ?auto_16339 ?auto_16359 ) ( AVAILABLE ?auto_16339 ) ( SURFACE-AT ?auto_16318 ?auto_16359 ) ( ON ?auto_16318 ?auto_16362 ) ( CLEAR ?auto_16318 ) ( TRUCK-AT ?auto_16330 ?auto_16331 ) ( not ( = ?auto_16317 ?auto_16318 ) ) ( not ( = ?auto_16317 ?auto_16362 ) ) ( not ( = ?auto_16318 ?auto_16362 ) ) ( not ( = ?auto_16333 ?auto_16339 ) ) ( not ( = ?auto_16317 ?auto_16319 ) ) ( not ( = ?auto_16317 ?auto_16352 ) ) ( not ( = ?auto_16319 ?auto_16362 ) ) ( not ( = ?auto_16358 ?auto_16359 ) ) ( not ( = ?auto_16336 ?auto_16339 ) ) ( not ( = ?auto_16352 ?auto_16362 ) ) ( not ( = ?auto_16317 ?auto_16320 ) ) ( not ( = ?auto_16317 ?auto_16337 ) ) ( not ( = ?auto_16318 ?auto_16320 ) ) ( not ( = ?auto_16318 ?auto_16337 ) ) ( not ( = ?auto_16320 ?auto_16352 ) ) ( not ( = ?auto_16320 ?auto_16362 ) ) ( not ( = ?auto_16360 ?auto_16358 ) ) ( not ( = ?auto_16360 ?auto_16359 ) ) ( not ( = ?auto_16361 ?auto_16336 ) ) ( not ( = ?auto_16361 ?auto_16339 ) ) ( not ( = ?auto_16337 ?auto_16352 ) ) ( not ( = ?auto_16337 ?auto_16362 ) ) ( not ( = ?auto_16317 ?auto_16321 ) ) ( not ( = ?auto_16317 ?auto_16351 ) ) ( not ( = ?auto_16318 ?auto_16321 ) ) ( not ( = ?auto_16318 ?auto_16351 ) ) ( not ( = ?auto_16319 ?auto_16321 ) ) ( not ( = ?auto_16319 ?auto_16351 ) ) ( not ( = ?auto_16321 ?auto_16337 ) ) ( not ( = ?auto_16321 ?auto_16352 ) ) ( not ( = ?auto_16321 ?auto_16362 ) ) ( not ( = ?auto_16349 ?auto_16360 ) ) ( not ( = ?auto_16349 ?auto_16358 ) ) ( not ( = ?auto_16349 ?auto_16359 ) ) ( not ( = ?auto_16342 ?auto_16361 ) ) ( not ( = ?auto_16342 ?auto_16336 ) ) ( not ( = ?auto_16342 ?auto_16339 ) ) ( not ( = ?auto_16351 ?auto_16337 ) ) ( not ( = ?auto_16351 ?auto_16352 ) ) ( not ( = ?auto_16351 ?auto_16362 ) ) ( not ( = ?auto_16317 ?auto_16322 ) ) ( not ( = ?auto_16317 ?auto_16353 ) ) ( not ( = ?auto_16318 ?auto_16322 ) ) ( not ( = ?auto_16318 ?auto_16353 ) ) ( not ( = ?auto_16319 ?auto_16322 ) ) ( not ( = ?auto_16319 ?auto_16353 ) ) ( not ( = ?auto_16320 ?auto_16322 ) ) ( not ( = ?auto_16320 ?auto_16353 ) ) ( not ( = ?auto_16322 ?auto_16351 ) ) ( not ( = ?auto_16322 ?auto_16337 ) ) ( not ( = ?auto_16322 ?auto_16352 ) ) ( not ( = ?auto_16322 ?auto_16362 ) ) ( not ( = ?auto_16338 ?auto_16349 ) ) ( not ( = ?auto_16338 ?auto_16360 ) ) ( not ( = ?auto_16338 ?auto_16358 ) ) ( not ( = ?auto_16338 ?auto_16359 ) ) ( not ( = ?auto_16341 ?auto_16342 ) ) ( not ( = ?auto_16341 ?auto_16361 ) ) ( not ( = ?auto_16341 ?auto_16336 ) ) ( not ( = ?auto_16341 ?auto_16339 ) ) ( not ( = ?auto_16353 ?auto_16351 ) ) ( not ( = ?auto_16353 ?auto_16337 ) ) ( not ( = ?auto_16353 ?auto_16352 ) ) ( not ( = ?auto_16353 ?auto_16362 ) ) ( not ( = ?auto_16317 ?auto_16323 ) ) ( not ( = ?auto_16317 ?auto_16357 ) ) ( not ( = ?auto_16318 ?auto_16323 ) ) ( not ( = ?auto_16318 ?auto_16357 ) ) ( not ( = ?auto_16319 ?auto_16323 ) ) ( not ( = ?auto_16319 ?auto_16357 ) ) ( not ( = ?auto_16320 ?auto_16323 ) ) ( not ( = ?auto_16320 ?auto_16357 ) ) ( not ( = ?auto_16321 ?auto_16323 ) ) ( not ( = ?auto_16321 ?auto_16357 ) ) ( not ( = ?auto_16323 ?auto_16353 ) ) ( not ( = ?auto_16323 ?auto_16351 ) ) ( not ( = ?auto_16323 ?auto_16337 ) ) ( not ( = ?auto_16323 ?auto_16352 ) ) ( not ( = ?auto_16323 ?auto_16362 ) ) ( not ( = ?auto_16348 ?auto_16338 ) ) ( not ( = ?auto_16348 ?auto_16349 ) ) ( not ( = ?auto_16348 ?auto_16360 ) ) ( not ( = ?auto_16348 ?auto_16358 ) ) ( not ( = ?auto_16348 ?auto_16359 ) ) ( not ( = ?auto_16350 ?auto_16341 ) ) ( not ( = ?auto_16350 ?auto_16342 ) ) ( not ( = ?auto_16350 ?auto_16361 ) ) ( not ( = ?auto_16350 ?auto_16336 ) ) ( not ( = ?auto_16350 ?auto_16339 ) ) ( not ( = ?auto_16357 ?auto_16353 ) ) ( not ( = ?auto_16357 ?auto_16351 ) ) ( not ( = ?auto_16357 ?auto_16337 ) ) ( not ( = ?auto_16357 ?auto_16352 ) ) ( not ( = ?auto_16357 ?auto_16362 ) ) ( not ( = ?auto_16317 ?auto_16324 ) ) ( not ( = ?auto_16317 ?auto_16354 ) ) ( not ( = ?auto_16318 ?auto_16324 ) ) ( not ( = ?auto_16318 ?auto_16354 ) ) ( not ( = ?auto_16319 ?auto_16324 ) ) ( not ( = ?auto_16319 ?auto_16354 ) ) ( not ( = ?auto_16320 ?auto_16324 ) ) ( not ( = ?auto_16320 ?auto_16354 ) ) ( not ( = ?auto_16321 ?auto_16324 ) ) ( not ( = ?auto_16321 ?auto_16354 ) ) ( not ( = ?auto_16322 ?auto_16324 ) ) ( not ( = ?auto_16322 ?auto_16354 ) ) ( not ( = ?auto_16324 ?auto_16357 ) ) ( not ( = ?auto_16324 ?auto_16353 ) ) ( not ( = ?auto_16324 ?auto_16351 ) ) ( not ( = ?auto_16324 ?auto_16337 ) ) ( not ( = ?auto_16324 ?auto_16352 ) ) ( not ( = ?auto_16324 ?auto_16362 ) ) ( not ( = ?auto_16345 ?auto_16348 ) ) ( not ( = ?auto_16345 ?auto_16338 ) ) ( not ( = ?auto_16345 ?auto_16349 ) ) ( not ( = ?auto_16345 ?auto_16360 ) ) ( not ( = ?auto_16345 ?auto_16358 ) ) ( not ( = ?auto_16345 ?auto_16359 ) ) ( not ( = ?auto_16340 ?auto_16350 ) ) ( not ( = ?auto_16340 ?auto_16341 ) ) ( not ( = ?auto_16340 ?auto_16342 ) ) ( not ( = ?auto_16340 ?auto_16361 ) ) ( not ( = ?auto_16340 ?auto_16336 ) ) ( not ( = ?auto_16340 ?auto_16339 ) ) ( not ( = ?auto_16354 ?auto_16357 ) ) ( not ( = ?auto_16354 ?auto_16353 ) ) ( not ( = ?auto_16354 ?auto_16351 ) ) ( not ( = ?auto_16354 ?auto_16337 ) ) ( not ( = ?auto_16354 ?auto_16352 ) ) ( not ( = ?auto_16354 ?auto_16362 ) ) ( not ( = ?auto_16317 ?auto_16325 ) ) ( not ( = ?auto_16317 ?auto_16347 ) ) ( not ( = ?auto_16318 ?auto_16325 ) ) ( not ( = ?auto_16318 ?auto_16347 ) ) ( not ( = ?auto_16319 ?auto_16325 ) ) ( not ( = ?auto_16319 ?auto_16347 ) ) ( not ( = ?auto_16320 ?auto_16325 ) ) ( not ( = ?auto_16320 ?auto_16347 ) ) ( not ( = ?auto_16321 ?auto_16325 ) ) ( not ( = ?auto_16321 ?auto_16347 ) ) ( not ( = ?auto_16322 ?auto_16325 ) ) ( not ( = ?auto_16322 ?auto_16347 ) ) ( not ( = ?auto_16323 ?auto_16325 ) ) ( not ( = ?auto_16323 ?auto_16347 ) ) ( not ( = ?auto_16325 ?auto_16354 ) ) ( not ( = ?auto_16325 ?auto_16357 ) ) ( not ( = ?auto_16325 ?auto_16353 ) ) ( not ( = ?auto_16325 ?auto_16351 ) ) ( not ( = ?auto_16325 ?auto_16337 ) ) ( not ( = ?auto_16325 ?auto_16352 ) ) ( not ( = ?auto_16325 ?auto_16362 ) ) ( not ( = ?auto_16344 ?auto_16345 ) ) ( not ( = ?auto_16344 ?auto_16348 ) ) ( not ( = ?auto_16344 ?auto_16338 ) ) ( not ( = ?auto_16344 ?auto_16349 ) ) ( not ( = ?auto_16344 ?auto_16360 ) ) ( not ( = ?auto_16344 ?auto_16358 ) ) ( not ( = ?auto_16344 ?auto_16359 ) ) ( not ( = ?auto_16346 ?auto_16340 ) ) ( not ( = ?auto_16346 ?auto_16350 ) ) ( not ( = ?auto_16346 ?auto_16341 ) ) ( not ( = ?auto_16346 ?auto_16342 ) ) ( not ( = ?auto_16346 ?auto_16361 ) ) ( not ( = ?auto_16346 ?auto_16336 ) ) ( not ( = ?auto_16346 ?auto_16339 ) ) ( not ( = ?auto_16347 ?auto_16354 ) ) ( not ( = ?auto_16347 ?auto_16357 ) ) ( not ( = ?auto_16347 ?auto_16353 ) ) ( not ( = ?auto_16347 ?auto_16351 ) ) ( not ( = ?auto_16347 ?auto_16337 ) ) ( not ( = ?auto_16347 ?auto_16352 ) ) ( not ( = ?auto_16347 ?auto_16362 ) ) ( not ( = ?auto_16317 ?auto_16326 ) ) ( not ( = ?auto_16317 ?auto_16356 ) ) ( not ( = ?auto_16318 ?auto_16326 ) ) ( not ( = ?auto_16318 ?auto_16356 ) ) ( not ( = ?auto_16319 ?auto_16326 ) ) ( not ( = ?auto_16319 ?auto_16356 ) ) ( not ( = ?auto_16320 ?auto_16326 ) ) ( not ( = ?auto_16320 ?auto_16356 ) ) ( not ( = ?auto_16321 ?auto_16326 ) ) ( not ( = ?auto_16321 ?auto_16356 ) ) ( not ( = ?auto_16322 ?auto_16326 ) ) ( not ( = ?auto_16322 ?auto_16356 ) ) ( not ( = ?auto_16323 ?auto_16326 ) ) ( not ( = ?auto_16323 ?auto_16356 ) ) ( not ( = ?auto_16324 ?auto_16326 ) ) ( not ( = ?auto_16324 ?auto_16356 ) ) ( not ( = ?auto_16326 ?auto_16347 ) ) ( not ( = ?auto_16326 ?auto_16354 ) ) ( not ( = ?auto_16326 ?auto_16357 ) ) ( not ( = ?auto_16326 ?auto_16353 ) ) ( not ( = ?auto_16326 ?auto_16351 ) ) ( not ( = ?auto_16326 ?auto_16337 ) ) ( not ( = ?auto_16326 ?auto_16352 ) ) ( not ( = ?auto_16326 ?auto_16362 ) ) ( not ( = ?auto_16355 ?auto_16344 ) ) ( not ( = ?auto_16355 ?auto_16345 ) ) ( not ( = ?auto_16355 ?auto_16348 ) ) ( not ( = ?auto_16355 ?auto_16338 ) ) ( not ( = ?auto_16355 ?auto_16349 ) ) ( not ( = ?auto_16355 ?auto_16360 ) ) ( not ( = ?auto_16355 ?auto_16358 ) ) ( not ( = ?auto_16355 ?auto_16359 ) ) ( not ( = ?auto_16335 ?auto_16346 ) ) ( not ( = ?auto_16335 ?auto_16340 ) ) ( not ( = ?auto_16335 ?auto_16350 ) ) ( not ( = ?auto_16335 ?auto_16341 ) ) ( not ( = ?auto_16335 ?auto_16342 ) ) ( not ( = ?auto_16335 ?auto_16361 ) ) ( not ( = ?auto_16335 ?auto_16336 ) ) ( not ( = ?auto_16335 ?auto_16339 ) ) ( not ( = ?auto_16356 ?auto_16347 ) ) ( not ( = ?auto_16356 ?auto_16354 ) ) ( not ( = ?auto_16356 ?auto_16357 ) ) ( not ( = ?auto_16356 ?auto_16353 ) ) ( not ( = ?auto_16356 ?auto_16351 ) ) ( not ( = ?auto_16356 ?auto_16337 ) ) ( not ( = ?auto_16356 ?auto_16352 ) ) ( not ( = ?auto_16356 ?auto_16362 ) ) ( not ( = ?auto_16317 ?auto_16327 ) ) ( not ( = ?auto_16317 ?auto_16343 ) ) ( not ( = ?auto_16318 ?auto_16327 ) ) ( not ( = ?auto_16318 ?auto_16343 ) ) ( not ( = ?auto_16319 ?auto_16327 ) ) ( not ( = ?auto_16319 ?auto_16343 ) ) ( not ( = ?auto_16320 ?auto_16327 ) ) ( not ( = ?auto_16320 ?auto_16343 ) ) ( not ( = ?auto_16321 ?auto_16327 ) ) ( not ( = ?auto_16321 ?auto_16343 ) ) ( not ( = ?auto_16322 ?auto_16327 ) ) ( not ( = ?auto_16322 ?auto_16343 ) ) ( not ( = ?auto_16323 ?auto_16327 ) ) ( not ( = ?auto_16323 ?auto_16343 ) ) ( not ( = ?auto_16324 ?auto_16327 ) ) ( not ( = ?auto_16324 ?auto_16343 ) ) ( not ( = ?auto_16325 ?auto_16327 ) ) ( not ( = ?auto_16325 ?auto_16343 ) ) ( not ( = ?auto_16327 ?auto_16356 ) ) ( not ( = ?auto_16327 ?auto_16347 ) ) ( not ( = ?auto_16327 ?auto_16354 ) ) ( not ( = ?auto_16327 ?auto_16357 ) ) ( not ( = ?auto_16327 ?auto_16353 ) ) ( not ( = ?auto_16327 ?auto_16351 ) ) ( not ( = ?auto_16327 ?auto_16337 ) ) ( not ( = ?auto_16327 ?auto_16352 ) ) ( not ( = ?auto_16327 ?auto_16362 ) ) ( not ( = ?auto_16343 ?auto_16356 ) ) ( not ( = ?auto_16343 ?auto_16347 ) ) ( not ( = ?auto_16343 ?auto_16354 ) ) ( not ( = ?auto_16343 ?auto_16357 ) ) ( not ( = ?auto_16343 ?auto_16353 ) ) ( not ( = ?auto_16343 ?auto_16351 ) ) ( not ( = ?auto_16343 ?auto_16337 ) ) ( not ( = ?auto_16343 ?auto_16352 ) ) ( not ( = ?auto_16343 ?auto_16362 ) ) ( not ( = ?auto_16317 ?auto_16328 ) ) ( not ( = ?auto_16317 ?auto_16329 ) ) ( not ( = ?auto_16318 ?auto_16328 ) ) ( not ( = ?auto_16318 ?auto_16329 ) ) ( not ( = ?auto_16319 ?auto_16328 ) ) ( not ( = ?auto_16319 ?auto_16329 ) ) ( not ( = ?auto_16320 ?auto_16328 ) ) ( not ( = ?auto_16320 ?auto_16329 ) ) ( not ( = ?auto_16321 ?auto_16328 ) ) ( not ( = ?auto_16321 ?auto_16329 ) ) ( not ( = ?auto_16322 ?auto_16328 ) ) ( not ( = ?auto_16322 ?auto_16329 ) ) ( not ( = ?auto_16323 ?auto_16328 ) ) ( not ( = ?auto_16323 ?auto_16329 ) ) ( not ( = ?auto_16324 ?auto_16328 ) ) ( not ( = ?auto_16324 ?auto_16329 ) ) ( not ( = ?auto_16325 ?auto_16328 ) ) ( not ( = ?auto_16325 ?auto_16329 ) ) ( not ( = ?auto_16326 ?auto_16328 ) ) ( not ( = ?auto_16326 ?auto_16329 ) ) ( not ( = ?auto_16328 ?auto_16343 ) ) ( not ( = ?auto_16328 ?auto_16356 ) ) ( not ( = ?auto_16328 ?auto_16347 ) ) ( not ( = ?auto_16328 ?auto_16354 ) ) ( not ( = ?auto_16328 ?auto_16357 ) ) ( not ( = ?auto_16328 ?auto_16353 ) ) ( not ( = ?auto_16328 ?auto_16351 ) ) ( not ( = ?auto_16328 ?auto_16337 ) ) ( not ( = ?auto_16328 ?auto_16352 ) ) ( not ( = ?auto_16328 ?auto_16362 ) ) ( not ( = ?auto_16334 ?auto_16355 ) ) ( not ( = ?auto_16334 ?auto_16344 ) ) ( not ( = ?auto_16334 ?auto_16345 ) ) ( not ( = ?auto_16334 ?auto_16348 ) ) ( not ( = ?auto_16334 ?auto_16338 ) ) ( not ( = ?auto_16334 ?auto_16349 ) ) ( not ( = ?auto_16334 ?auto_16360 ) ) ( not ( = ?auto_16334 ?auto_16358 ) ) ( not ( = ?auto_16334 ?auto_16359 ) ) ( not ( = ?auto_16332 ?auto_16335 ) ) ( not ( = ?auto_16332 ?auto_16346 ) ) ( not ( = ?auto_16332 ?auto_16340 ) ) ( not ( = ?auto_16332 ?auto_16350 ) ) ( not ( = ?auto_16332 ?auto_16341 ) ) ( not ( = ?auto_16332 ?auto_16342 ) ) ( not ( = ?auto_16332 ?auto_16361 ) ) ( not ( = ?auto_16332 ?auto_16336 ) ) ( not ( = ?auto_16332 ?auto_16339 ) ) ( not ( = ?auto_16329 ?auto_16343 ) ) ( not ( = ?auto_16329 ?auto_16356 ) ) ( not ( = ?auto_16329 ?auto_16347 ) ) ( not ( = ?auto_16329 ?auto_16354 ) ) ( not ( = ?auto_16329 ?auto_16357 ) ) ( not ( = ?auto_16329 ?auto_16353 ) ) ( not ( = ?auto_16329 ?auto_16351 ) ) ( not ( = ?auto_16329 ?auto_16337 ) ) ( not ( = ?auto_16329 ?auto_16352 ) ) ( not ( = ?auto_16329 ?auto_16362 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_16317 ?auto_16318 ?auto_16319 ?auto_16320 ?auto_16321 ?auto_16322 ?auto_16323 ?auto_16324 ?auto_16325 ?auto_16326 ?auto_16327 )
      ( MAKE-1CRATE ?auto_16327 ?auto_16328 )
      ( MAKE-11CRATE-VERIFY ?auto_16317 ?auto_16318 ?auto_16319 ?auto_16320 ?auto_16321 ?auto_16322 ?auto_16323 ?auto_16324 ?auto_16325 ?auto_16326 ?auto_16327 ?auto_16328 ) )
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
      ?auto_16393 - SURFACE
      ?auto_16394 - SURFACE
      ?auto_16395 - SURFACE
      ?auto_16396 - SURFACE
      ?auto_16397 - SURFACE
      ?auto_16398 - SURFACE
    )
    :vars
    (
      ?auto_16402 - HOIST
      ?auto_16403 - PLACE
      ?auto_16399 - PLACE
      ?auto_16401 - HOIST
      ?auto_16400 - SURFACE
      ?auto_16416 - PLACE
      ?auto_16428 - HOIST
      ?auto_16431 - SURFACE
      ?auto_16405 - PLACE
      ?auto_16420 - HOIST
      ?auto_16423 - SURFACE
      ?auto_16429 - SURFACE
      ?auto_16432 - PLACE
      ?auto_16415 - HOIST
      ?auto_16426 - SURFACE
      ?auto_16430 - PLACE
      ?auto_16421 - HOIST
      ?auto_16406 - SURFACE
      ?auto_16418 - PLACE
      ?auto_16411 - HOIST
      ?auto_16433 - SURFACE
      ?auto_16419 - PLACE
      ?auto_16408 - HOIST
      ?auto_16425 - SURFACE
      ?auto_16427 - PLACE
      ?auto_16414 - HOIST
      ?auto_16407 - SURFACE
      ?auto_16413 - PLACE
      ?auto_16422 - HOIST
      ?auto_16409 - SURFACE
      ?auto_16424 - PLACE
      ?auto_16417 - HOIST
      ?auto_16412 - SURFACE
      ?auto_16410 - PLACE
      ?auto_16435 - HOIST
      ?auto_16434 - SURFACE
      ?auto_16404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16402 ?auto_16403 ) ( IS-CRATE ?auto_16398 ) ( not ( = ?auto_16399 ?auto_16403 ) ) ( HOIST-AT ?auto_16401 ?auto_16399 ) ( AVAILABLE ?auto_16401 ) ( SURFACE-AT ?auto_16398 ?auto_16399 ) ( ON ?auto_16398 ?auto_16400 ) ( CLEAR ?auto_16398 ) ( not ( = ?auto_16397 ?auto_16398 ) ) ( not ( = ?auto_16397 ?auto_16400 ) ) ( not ( = ?auto_16398 ?auto_16400 ) ) ( not ( = ?auto_16402 ?auto_16401 ) ) ( IS-CRATE ?auto_16397 ) ( not ( = ?auto_16416 ?auto_16403 ) ) ( HOIST-AT ?auto_16428 ?auto_16416 ) ( AVAILABLE ?auto_16428 ) ( SURFACE-AT ?auto_16397 ?auto_16416 ) ( ON ?auto_16397 ?auto_16431 ) ( CLEAR ?auto_16397 ) ( not ( = ?auto_16396 ?auto_16397 ) ) ( not ( = ?auto_16396 ?auto_16431 ) ) ( not ( = ?auto_16397 ?auto_16431 ) ) ( not ( = ?auto_16402 ?auto_16428 ) ) ( IS-CRATE ?auto_16396 ) ( not ( = ?auto_16405 ?auto_16403 ) ) ( HOIST-AT ?auto_16420 ?auto_16405 ) ( SURFACE-AT ?auto_16396 ?auto_16405 ) ( ON ?auto_16396 ?auto_16423 ) ( CLEAR ?auto_16396 ) ( not ( = ?auto_16395 ?auto_16396 ) ) ( not ( = ?auto_16395 ?auto_16423 ) ) ( not ( = ?auto_16396 ?auto_16423 ) ) ( not ( = ?auto_16402 ?auto_16420 ) ) ( IS-CRATE ?auto_16395 ) ( AVAILABLE ?auto_16420 ) ( SURFACE-AT ?auto_16395 ?auto_16405 ) ( ON ?auto_16395 ?auto_16429 ) ( CLEAR ?auto_16395 ) ( not ( = ?auto_16394 ?auto_16395 ) ) ( not ( = ?auto_16394 ?auto_16429 ) ) ( not ( = ?auto_16395 ?auto_16429 ) ) ( IS-CRATE ?auto_16394 ) ( not ( = ?auto_16432 ?auto_16403 ) ) ( HOIST-AT ?auto_16415 ?auto_16432 ) ( AVAILABLE ?auto_16415 ) ( SURFACE-AT ?auto_16394 ?auto_16432 ) ( ON ?auto_16394 ?auto_16426 ) ( CLEAR ?auto_16394 ) ( not ( = ?auto_16393 ?auto_16394 ) ) ( not ( = ?auto_16393 ?auto_16426 ) ) ( not ( = ?auto_16394 ?auto_16426 ) ) ( not ( = ?auto_16402 ?auto_16415 ) ) ( IS-CRATE ?auto_16393 ) ( not ( = ?auto_16430 ?auto_16403 ) ) ( HOIST-AT ?auto_16421 ?auto_16430 ) ( AVAILABLE ?auto_16421 ) ( SURFACE-AT ?auto_16393 ?auto_16430 ) ( ON ?auto_16393 ?auto_16406 ) ( CLEAR ?auto_16393 ) ( not ( = ?auto_16392 ?auto_16393 ) ) ( not ( = ?auto_16392 ?auto_16406 ) ) ( not ( = ?auto_16393 ?auto_16406 ) ) ( not ( = ?auto_16402 ?auto_16421 ) ) ( IS-CRATE ?auto_16392 ) ( not ( = ?auto_16418 ?auto_16403 ) ) ( HOIST-AT ?auto_16411 ?auto_16418 ) ( AVAILABLE ?auto_16411 ) ( SURFACE-AT ?auto_16392 ?auto_16418 ) ( ON ?auto_16392 ?auto_16433 ) ( CLEAR ?auto_16392 ) ( not ( = ?auto_16391 ?auto_16392 ) ) ( not ( = ?auto_16391 ?auto_16433 ) ) ( not ( = ?auto_16392 ?auto_16433 ) ) ( not ( = ?auto_16402 ?auto_16411 ) ) ( IS-CRATE ?auto_16391 ) ( not ( = ?auto_16419 ?auto_16403 ) ) ( HOIST-AT ?auto_16408 ?auto_16419 ) ( AVAILABLE ?auto_16408 ) ( SURFACE-AT ?auto_16391 ?auto_16419 ) ( ON ?auto_16391 ?auto_16425 ) ( CLEAR ?auto_16391 ) ( not ( = ?auto_16390 ?auto_16391 ) ) ( not ( = ?auto_16390 ?auto_16425 ) ) ( not ( = ?auto_16391 ?auto_16425 ) ) ( not ( = ?auto_16402 ?auto_16408 ) ) ( IS-CRATE ?auto_16390 ) ( not ( = ?auto_16427 ?auto_16403 ) ) ( HOIST-AT ?auto_16414 ?auto_16427 ) ( AVAILABLE ?auto_16414 ) ( SURFACE-AT ?auto_16390 ?auto_16427 ) ( ON ?auto_16390 ?auto_16407 ) ( CLEAR ?auto_16390 ) ( not ( = ?auto_16389 ?auto_16390 ) ) ( not ( = ?auto_16389 ?auto_16407 ) ) ( not ( = ?auto_16390 ?auto_16407 ) ) ( not ( = ?auto_16402 ?auto_16414 ) ) ( IS-CRATE ?auto_16389 ) ( not ( = ?auto_16413 ?auto_16403 ) ) ( HOIST-AT ?auto_16422 ?auto_16413 ) ( AVAILABLE ?auto_16422 ) ( SURFACE-AT ?auto_16389 ?auto_16413 ) ( ON ?auto_16389 ?auto_16409 ) ( CLEAR ?auto_16389 ) ( not ( = ?auto_16388 ?auto_16389 ) ) ( not ( = ?auto_16388 ?auto_16409 ) ) ( not ( = ?auto_16389 ?auto_16409 ) ) ( not ( = ?auto_16402 ?auto_16422 ) ) ( IS-CRATE ?auto_16388 ) ( not ( = ?auto_16424 ?auto_16403 ) ) ( HOIST-AT ?auto_16417 ?auto_16424 ) ( AVAILABLE ?auto_16417 ) ( SURFACE-AT ?auto_16388 ?auto_16424 ) ( ON ?auto_16388 ?auto_16412 ) ( CLEAR ?auto_16388 ) ( not ( = ?auto_16387 ?auto_16388 ) ) ( not ( = ?auto_16387 ?auto_16412 ) ) ( not ( = ?auto_16388 ?auto_16412 ) ) ( not ( = ?auto_16402 ?auto_16417 ) ) ( SURFACE-AT ?auto_16386 ?auto_16403 ) ( CLEAR ?auto_16386 ) ( IS-CRATE ?auto_16387 ) ( AVAILABLE ?auto_16402 ) ( not ( = ?auto_16410 ?auto_16403 ) ) ( HOIST-AT ?auto_16435 ?auto_16410 ) ( AVAILABLE ?auto_16435 ) ( SURFACE-AT ?auto_16387 ?auto_16410 ) ( ON ?auto_16387 ?auto_16434 ) ( CLEAR ?auto_16387 ) ( TRUCK-AT ?auto_16404 ?auto_16403 ) ( not ( = ?auto_16386 ?auto_16387 ) ) ( not ( = ?auto_16386 ?auto_16434 ) ) ( not ( = ?auto_16387 ?auto_16434 ) ) ( not ( = ?auto_16402 ?auto_16435 ) ) ( not ( = ?auto_16386 ?auto_16388 ) ) ( not ( = ?auto_16386 ?auto_16412 ) ) ( not ( = ?auto_16388 ?auto_16434 ) ) ( not ( = ?auto_16424 ?auto_16410 ) ) ( not ( = ?auto_16417 ?auto_16435 ) ) ( not ( = ?auto_16412 ?auto_16434 ) ) ( not ( = ?auto_16386 ?auto_16389 ) ) ( not ( = ?auto_16386 ?auto_16409 ) ) ( not ( = ?auto_16387 ?auto_16389 ) ) ( not ( = ?auto_16387 ?auto_16409 ) ) ( not ( = ?auto_16389 ?auto_16412 ) ) ( not ( = ?auto_16389 ?auto_16434 ) ) ( not ( = ?auto_16413 ?auto_16424 ) ) ( not ( = ?auto_16413 ?auto_16410 ) ) ( not ( = ?auto_16422 ?auto_16417 ) ) ( not ( = ?auto_16422 ?auto_16435 ) ) ( not ( = ?auto_16409 ?auto_16412 ) ) ( not ( = ?auto_16409 ?auto_16434 ) ) ( not ( = ?auto_16386 ?auto_16390 ) ) ( not ( = ?auto_16386 ?auto_16407 ) ) ( not ( = ?auto_16387 ?auto_16390 ) ) ( not ( = ?auto_16387 ?auto_16407 ) ) ( not ( = ?auto_16388 ?auto_16390 ) ) ( not ( = ?auto_16388 ?auto_16407 ) ) ( not ( = ?auto_16390 ?auto_16409 ) ) ( not ( = ?auto_16390 ?auto_16412 ) ) ( not ( = ?auto_16390 ?auto_16434 ) ) ( not ( = ?auto_16427 ?auto_16413 ) ) ( not ( = ?auto_16427 ?auto_16424 ) ) ( not ( = ?auto_16427 ?auto_16410 ) ) ( not ( = ?auto_16414 ?auto_16422 ) ) ( not ( = ?auto_16414 ?auto_16417 ) ) ( not ( = ?auto_16414 ?auto_16435 ) ) ( not ( = ?auto_16407 ?auto_16409 ) ) ( not ( = ?auto_16407 ?auto_16412 ) ) ( not ( = ?auto_16407 ?auto_16434 ) ) ( not ( = ?auto_16386 ?auto_16391 ) ) ( not ( = ?auto_16386 ?auto_16425 ) ) ( not ( = ?auto_16387 ?auto_16391 ) ) ( not ( = ?auto_16387 ?auto_16425 ) ) ( not ( = ?auto_16388 ?auto_16391 ) ) ( not ( = ?auto_16388 ?auto_16425 ) ) ( not ( = ?auto_16389 ?auto_16391 ) ) ( not ( = ?auto_16389 ?auto_16425 ) ) ( not ( = ?auto_16391 ?auto_16407 ) ) ( not ( = ?auto_16391 ?auto_16409 ) ) ( not ( = ?auto_16391 ?auto_16412 ) ) ( not ( = ?auto_16391 ?auto_16434 ) ) ( not ( = ?auto_16419 ?auto_16427 ) ) ( not ( = ?auto_16419 ?auto_16413 ) ) ( not ( = ?auto_16419 ?auto_16424 ) ) ( not ( = ?auto_16419 ?auto_16410 ) ) ( not ( = ?auto_16408 ?auto_16414 ) ) ( not ( = ?auto_16408 ?auto_16422 ) ) ( not ( = ?auto_16408 ?auto_16417 ) ) ( not ( = ?auto_16408 ?auto_16435 ) ) ( not ( = ?auto_16425 ?auto_16407 ) ) ( not ( = ?auto_16425 ?auto_16409 ) ) ( not ( = ?auto_16425 ?auto_16412 ) ) ( not ( = ?auto_16425 ?auto_16434 ) ) ( not ( = ?auto_16386 ?auto_16392 ) ) ( not ( = ?auto_16386 ?auto_16433 ) ) ( not ( = ?auto_16387 ?auto_16392 ) ) ( not ( = ?auto_16387 ?auto_16433 ) ) ( not ( = ?auto_16388 ?auto_16392 ) ) ( not ( = ?auto_16388 ?auto_16433 ) ) ( not ( = ?auto_16389 ?auto_16392 ) ) ( not ( = ?auto_16389 ?auto_16433 ) ) ( not ( = ?auto_16390 ?auto_16392 ) ) ( not ( = ?auto_16390 ?auto_16433 ) ) ( not ( = ?auto_16392 ?auto_16425 ) ) ( not ( = ?auto_16392 ?auto_16407 ) ) ( not ( = ?auto_16392 ?auto_16409 ) ) ( not ( = ?auto_16392 ?auto_16412 ) ) ( not ( = ?auto_16392 ?auto_16434 ) ) ( not ( = ?auto_16418 ?auto_16419 ) ) ( not ( = ?auto_16418 ?auto_16427 ) ) ( not ( = ?auto_16418 ?auto_16413 ) ) ( not ( = ?auto_16418 ?auto_16424 ) ) ( not ( = ?auto_16418 ?auto_16410 ) ) ( not ( = ?auto_16411 ?auto_16408 ) ) ( not ( = ?auto_16411 ?auto_16414 ) ) ( not ( = ?auto_16411 ?auto_16422 ) ) ( not ( = ?auto_16411 ?auto_16417 ) ) ( not ( = ?auto_16411 ?auto_16435 ) ) ( not ( = ?auto_16433 ?auto_16425 ) ) ( not ( = ?auto_16433 ?auto_16407 ) ) ( not ( = ?auto_16433 ?auto_16409 ) ) ( not ( = ?auto_16433 ?auto_16412 ) ) ( not ( = ?auto_16433 ?auto_16434 ) ) ( not ( = ?auto_16386 ?auto_16393 ) ) ( not ( = ?auto_16386 ?auto_16406 ) ) ( not ( = ?auto_16387 ?auto_16393 ) ) ( not ( = ?auto_16387 ?auto_16406 ) ) ( not ( = ?auto_16388 ?auto_16393 ) ) ( not ( = ?auto_16388 ?auto_16406 ) ) ( not ( = ?auto_16389 ?auto_16393 ) ) ( not ( = ?auto_16389 ?auto_16406 ) ) ( not ( = ?auto_16390 ?auto_16393 ) ) ( not ( = ?auto_16390 ?auto_16406 ) ) ( not ( = ?auto_16391 ?auto_16393 ) ) ( not ( = ?auto_16391 ?auto_16406 ) ) ( not ( = ?auto_16393 ?auto_16433 ) ) ( not ( = ?auto_16393 ?auto_16425 ) ) ( not ( = ?auto_16393 ?auto_16407 ) ) ( not ( = ?auto_16393 ?auto_16409 ) ) ( not ( = ?auto_16393 ?auto_16412 ) ) ( not ( = ?auto_16393 ?auto_16434 ) ) ( not ( = ?auto_16430 ?auto_16418 ) ) ( not ( = ?auto_16430 ?auto_16419 ) ) ( not ( = ?auto_16430 ?auto_16427 ) ) ( not ( = ?auto_16430 ?auto_16413 ) ) ( not ( = ?auto_16430 ?auto_16424 ) ) ( not ( = ?auto_16430 ?auto_16410 ) ) ( not ( = ?auto_16421 ?auto_16411 ) ) ( not ( = ?auto_16421 ?auto_16408 ) ) ( not ( = ?auto_16421 ?auto_16414 ) ) ( not ( = ?auto_16421 ?auto_16422 ) ) ( not ( = ?auto_16421 ?auto_16417 ) ) ( not ( = ?auto_16421 ?auto_16435 ) ) ( not ( = ?auto_16406 ?auto_16433 ) ) ( not ( = ?auto_16406 ?auto_16425 ) ) ( not ( = ?auto_16406 ?auto_16407 ) ) ( not ( = ?auto_16406 ?auto_16409 ) ) ( not ( = ?auto_16406 ?auto_16412 ) ) ( not ( = ?auto_16406 ?auto_16434 ) ) ( not ( = ?auto_16386 ?auto_16394 ) ) ( not ( = ?auto_16386 ?auto_16426 ) ) ( not ( = ?auto_16387 ?auto_16394 ) ) ( not ( = ?auto_16387 ?auto_16426 ) ) ( not ( = ?auto_16388 ?auto_16394 ) ) ( not ( = ?auto_16388 ?auto_16426 ) ) ( not ( = ?auto_16389 ?auto_16394 ) ) ( not ( = ?auto_16389 ?auto_16426 ) ) ( not ( = ?auto_16390 ?auto_16394 ) ) ( not ( = ?auto_16390 ?auto_16426 ) ) ( not ( = ?auto_16391 ?auto_16394 ) ) ( not ( = ?auto_16391 ?auto_16426 ) ) ( not ( = ?auto_16392 ?auto_16394 ) ) ( not ( = ?auto_16392 ?auto_16426 ) ) ( not ( = ?auto_16394 ?auto_16406 ) ) ( not ( = ?auto_16394 ?auto_16433 ) ) ( not ( = ?auto_16394 ?auto_16425 ) ) ( not ( = ?auto_16394 ?auto_16407 ) ) ( not ( = ?auto_16394 ?auto_16409 ) ) ( not ( = ?auto_16394 ?auto_16412 ) ) ( not ( = ?auto_16394 ?auto_16434 ) ) ( not ( = ?auto_16432 ?auto_16430 ) ) ( not ( = ?auto_16432 ?auto_16418 ) ) ( not ( = ?auto_16432 ?auto_16419 ) ) ( not ( = ?auto_16432 ?auto_16427 ) ) ( not ( = ?auto_16432 ?auto_16413 ) ) ( not ( = ?auto_16432 ?auto_16424 ) ) ( not ( = ?auto_16432 ?auto_16410 ) ) ( not ( = ?auto_16415 ?auto_16421 ) ) ( not ( = ?auto_16415 ?auto_16411 ) ) ( not ( = ?auto_16415 ?auto_16408 ) ) ( not ( = ?auto_16415 ?auto_16414 ) ) ( not ( = ?auto_16415 ?auto_16422 ) ) ( not ( = ?auto_16415 ?auto_16417 ) ) ( not ( = ?auto_16415 ?auto_16435 ) ) ( not ( = ?auto_16426 ?auto_16406 ) ) ( not ( = ?auto_16426 ?auto_16433 ) ) ( not ( = ?auto_16426 ?auto_16425 ) ) ( not ( = ?auto_16426 ?auto_16407 ) ) ( not ( = ?auto_16426 ?auto_16409 ) ) ( not ( = ?auto_16426 ?auto_16412 ) ) ( not ( = ?auto_16426 ?auto_16434 ) ) ( not ( = ?auto_16386 ?auto_16395 ) ) ( not ( = ?auto_16386 ?auto_16429 ) ) ( not ( = ?auto_16387 ?auto_16395 ) ) ( not ( = ?auto_16387 ?auto_16429 ) ) ( not ( = ?auto_16388 ?auto_16395 ) ) ( not ( = ?auto_16388 ?auto_16429 ) ) ( not ( = ?auto_16389 ?auto_16395 ) ) ( not ( = ?auto_16389 ?auto_16429 ) ) ( not ( = ?auto_16390 ?auto_16395 ) ) ( not ( = ?auto_16390 ?auto_16429 ) ) ( not ( = ?auto_16391 ?auto_16395 ) ) ( not ( = ?auto_16391 ?auto_16429 ) ) ( not ( = ?auto_16392 ?auto_16395 ) ) ( not ( = ?auto_16392 ?auto_16429 ) ) ( not ( = ?auto_16393 ?auto_16395 ) ) ( not ( = ?auto_16393 ?auto_16429 ) ) ( not ( = ?auto_16395 ?auto_16426 ) ) ( not ( = ?auto_16395 ?auto_16406 ) ) ( not ( = ?auto_16395 ?auto_16433 ) ) ( not ( = ?auto_16395 ?auto_16425 ) ) ( not ( = ?auto_16395 ?auto_16407 ) ) ( not ( = ?auto_16395 ?auto_16409 ) ) ( not ( = ?auto_16395 ?auto_16412 ) ) ( not ( = ?auto_16395 ?auto_16434 ) ) ( not ( = ?auto_16405 ?auto_16432 ) ) ( not ( = ?auto_16405 ?auto_16430 ) ) ( not ( = ?auto_16405 ?auto_16418 ) ) ( not ( = ?auto_16405 ?auto_16419 ) ) ( not ( = ?auto_16405 ?auto_16427 ) ) ( not ( = ?auto_16405 ?auto_16413 ) ) ( not ( = ?auto_16405 ?auto_16424 ) ) ( not ( = ?auto_16405 ?auto_16410 ) ) ( not ( = ?auto_16420 ?auto_16415 ) ) ( not ( = ?auto_16420 ?auto_16421 ) ) ( not ( = ?auto_16420 ?auto_16411 ) ) ( not ( = ?auto_16420 ?auto_16408 ) ) ( not ( = ?auto_16420 ?auto_16414 ) ) ( not ( = ?auto_16420 ?auto_16422 ) ) ( not ( = ?auto_16420 ?auto_16417 ) ) ( not ( = ?auto_16420 ?auto_16435 ) ) ( not ( = ?auto_16429 ?auto_16426 ) ) ( not ( = ?auto_16429 ?auto_16406 ) ) ( not ( = ?auto_16429 ?auto_16433 ) ) ( not ( = ?auto_16429 ?auto_16425 ) ) ( not ( = ?auto_16429 ?auto_16407 ) ) ( not ( = ?auto_16429 ?auto_16409 ) ) ( not ( = ?auto_16429 ?auto_16412 ) ) ( not ( = ?auto_16429 ?auto_16434 ) ) ( not ( = ?auto_16386 ?auto_16396 ) ) ( not ( = ?auto_16386 ?auto_16423 ) ) ( not ( = ?auto_16387 ?auto_16396 ) ) ( not ( = ?auto_16387 ?auto_16423 ) ) ( not ( = ?auto_16388 ?auto_16396 ) ) ( not ( = ?auto_16388 ?auto_16423 ) ) ( not ( = ?auto_16389 ?auto_16396 ) ) ( not ( = ?auto_16389 ?auto_16423 ) ) ( not ( = ?auto_16390 ?auto_16396 ) ) ( not ( = ?auto_16390 ?auto_16423 ) ) ( not ( = ?auto_16391 ?auto_16396 ) ) ( not ( = ?auto_16391 ?auto_16423 ) ) ( not ( = ?auto_16392 ?auto_16396 ) ) ( not ( = ?auto_16392 ?auto_16423 ) ) ( not ( = ?auto_16393 ?auto_16396 ) ) ( not ( = ?auto_16393 ?auto_16423 ) ) ( not ( = ?auto_16394 ?auto_16396 ) ) ( not ( = ?auto_16394 ?auto_16423 ) ) ( not ( = ?auto_16396 ?auto_16429 ) ) ( not ( = ?auto_16396 ?auto_16426 ) ) ( not ( = ?auto_16396 ?auto_16406 ) ) ( not ( = ?auto_16396 ?auto_16433 ) ) ( not ( = ?auto_16396 ?auto_16425 ) ) ( not ( = ?auto_16396 ?auto_16407 ) ) ( not ( = ?auto_16396 ?auto_16409 ) ) ( not ( = ?auto_16396 ?auto_16412 ) ) ( not ( = ?auto_16396 ?auto_16434 ) ) ( not ( = ?auto_16423 ?auto_16429 ) ) ( not ( = ?auto_16423 ?auto_16426 ) ) ( not ( = ?auto_16423 ?auto_16406 ) ) ( not ( = ?auto_16423 ?auto_16433 ) ) ( not ( = ?auto_16423 ?auto_16425 ) ) ( not ( = ?auto_16423 ?auto_16407 ) ) ( not ( = ?auto_16423 ?auto_16409 ) ) ( not ( = ?auto_16423 ?auto_16412 ) ) ( not ( = ?auto_16423 ?auto_16434 ) ) ( not ( = ?auto_16386 ?auto_16397 ) ) ( not ( = ?auto_16386 ?auto_16431 ) ) ( not ( = ?auto_16387 ?auto_16397 ) ) ( not ( = ?auto_16387 ?auto_16431 ) ) ( not ( = ?auto_16388 ?auto_16397 ) ) ( not ( = ?auto_16388 ?auto_16431 ) ) ( not ( = ?auto_16389 ?auto_16397 ) ) ( not ( = ?auto_16389 ?auto_16431 ) ) ( not ( = ?auto_16390 ?auto_16397 ) ) ( not ( = ?auto_16390 ?auto_16431 ) ) ( not ( = ?auto_16391 ?auto_16397 ) ) ( not ( = ?auto_16391 ?auto_16431 ) ) ( not ( = ?auto_16392 ?auto_16397 ) ) ( not ( = ?auto_16392 ?auto_16431 ) ) ( not ( = ?auto_16393 ?auto_16397 ) ) ( not ( = ?auto_16393 ?auto_16431 ) ) ( not ( = ?auto_16394 ?auto_16397 ) ) ( not ( = ?auto_16394 ?auto_16431 ) ) ( not ( = ?auto_16395 ?auto_16397 ) ) ( not ( = ?auto_16395 ?auto_16431 ) ) ( not ( = ?auto_16397 ?auto_16423 ) ) ( not ( = ?auto_16397 ?auto_16429 ) ) ( not ( = ?auto_16397 ?auto_16426 ) ) ( not ( = ?auto_16397 ?auto_16406 ) ) ( not ( = ?auto_16397 ?auto_16433 ) ) ( not ( = ?auto_16397 ?auto_16425 ) ) ( not ( = ?auto_16397 ?auto_16407 ) ) ( not ( = ?auto_16397 ?auto_16409 ) ) ( not ( = ?auto_16397 ?auto_16412 ) ) ( not ( = ?auto_16397 ?auto_16434 ) ) ( not ( = ?auto_16416 ?auto_16405 ) ) ( not ( = ?auto_16416 ?auto_16432 ) ) ( not ( = ?auto_16416 ?auto_16430 ) ) ( not ( = ?auto_16416 ?auto_16418 ) ) ( not ( = ?auto_16416 ?auto_16419 ) ) ( not ( = ?auto_16416 ?auto_16427 ) ) ( not ( = ?auto_16416 ?auto_16413 ) ) ( not ( = ?auto_16416 ?auto_16424 ) ) ( not ( = ?auto_16416 ?auto_16410 ) ) ( not ( = ?auto_16428 ?auto_16420 ) ) ( not ( = ?auto_16428 ?auto_16415 ) ) ( not ( = ?auto_16428 ?auto_16421 ) ) ( not ( = ?auto_16428 ?auto_16411 ) ) ( not ( = ?auto_16428 ?auto_16408 ) ) ( not ( = ?auto_16428 ?auto_16414 ) ) ( not ( = ?auto_16428 ?auto_16422 ) ) ( not ( = ?auto_16428 ?auto_16417 ) ) ( not ( = ?auto_16428 ?auto_16435 ) ) ( not ( = ?auto_16431 ?auto_16423 ) ) ( not ( = ?auto_16431 ?auto_16429 ) ) ( not ( = ?auto_16431 ?auto_16426 ) ) ( not ( = ?auto_16431 ?auto_16406 ) ) ( not ( = ?auto_16431 ?auto_16433 ) ) ( not ( = ?auto_16431 ?auto_16425 ) ) ( not ( = ?auto_16431 ?auto_16407 ) ) ( not ( = ?auto_16431 ?auto_16409 ) ) ( not ( = ?auto_16431 ?auto_16412 ) ) ( not ( = ?auto_16431 ?auto_16434 ) ) ( not ( = ?auto_16386 ?auto_16398 ) ) ( not ( = ?auto_16386 ?auto_16400 ) ) ( not ( = ?auto_16387 ?auto_16398 ) ) ( not ( = ?auto_16387 ?auto_16400 ) ) ( not ( = ?auto_16388 ?auto_16398 ) ) ( not ( = ?auto_16388 ?auto_16400 ) ) ( not ( = ?auto_16389 ?auto_16398 ) ) ( not ( = ?auto_16389 ?auto_16400 ) ) ( not ( = ?auto_16390 ?auto_16398 ) ) ( not ( = ?auto_16390 ?auto_16400 ) ) ( not ( = ?auto_16391 ?auto_16398 ) ) ( not ( = ?auto_16391 ?auto_16400 ) ) ( not ( = ?auto_16392 ?auto_16398 ) ) ( not ( = ?auto_16392 ?auto_16400 ) ) ( not ( = ?auto_16393 ?auto_16398 ) ) ( not ( = ?auto_16393 ?auto_16400 ) ) ( not ( = ?auto_16394 ?auto_16398 ) ) ( not ( = ?auto_16394 ?auto_16400 ) ) ( not ( = ?auto_16395 ?auto_16398 ) ) ( not ( = ?auto_16395 ?auto_16400 ) ) ( not ( = ?auto_16396 ?auto_16398 ) ) ( not ( = ?auto_16396 ?auto_16400 ) ) ( not ( = ?auto_16398 ?auto_16431 ) ) ( not ( = ?auto_16398 ?auto_16423 ) ) ( not ( = ?auto_16398 ?auto_16429 ) ) ( not ( = ?auto_16398 ?auto_16426 ) ) ( not ( = ?auto_16398 ?auto_16406 ) ) ( not ( = ?auto_16398 ?auto_16433 ) ) ( not ( = ?auto_16398 ?auto_16425 ) ) ( not ( = ?auto_16398 ?auto_16407 ) ) ( not ( = ?auto_16398 ?auto_16409 ) ) ( not ( = ?auto_16398 ?auto_16412 ) ) ( not ( = ?auto_16398 ?auto_16434 ) ) ( not ( = ?auto_16399 ?auto_16416 ) ) ( not ( = ?auto_16399 ?auto_16405 ) ) ( not ( = ?auto_16399 ?auto_16432 ) ) ( not ( = ?auto_16399 ?auto_16430 ) ) ( not ( = ?auto_16399 ?auto_16418 ) ) ( not ( = ?auto_16399 ?auto_16419 ) ) ( not ( = ?auto_16399 ?auto_16427 ) ) ( not ( = ?auto_16399 ?auto_16413 ) ) ( not ( = ?auto_16399 ?auto_16424 ) ) ( not ( = ?auto_16399 ?auto_16410 ) ) ( not ( = ?auto_16401 ?auto_16428 ) ) ( not ( = ?auto_16401 ?auto_16420 ) ) ( not ( = ?auto_16401 ?auto_16415 ) ) ( not ( = ?auto_16401 ?auto_16421 ) ) ( not ( = ?auto_16401 ?auto_16411 ) ) ( not ( = ?auto_16401 ?auto_16408 ) ) ( not ( = ?auto_16401 ?auto_16414 ) ) ( not ( = ?auto_16401 ?auto_16422 ) ) ( not ( = ?auto_16401 ?auto_16417 ) ) ( not ( = ?auto_16401 ?auto_16435 ) ) ( not ( = ?auto_16400 ?auto_16431 ) ) ( not ( = ?auto_16400 ?auto_16423 ) ) ( not ( = ?auto_16400 ?auto_16429 ) ) ( not ( = ?auto_16400 ?auto_16426 ) ) ( not ( = ?auto_16400 ?auto_16406 ) ) ( not ( = ?auto_16400 ?auto_16433 ) ) ( not ( = ?auto_16400 ?auto_16425 ) ) ( not ( = ?auto_16400 ?auto_16407 ) ) ( not ( = ?auto_16400 ?auto_16409 ) ) ( not ( = ?auto_16400 ?auto_16412 ) ) ( not ( = ?auto_16400 ?auto_16434 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_16386 ?auto_16387 ?auto_16388 ?auto_16389 ?auto_16390 ?auto_16391 ?auto_16392 ?auto_16393 ?auto_16394 ?auto_16395 ?auto_16396 ?auto_16397 )
      ( MAKE-1CRATE ?auto_16397 ?auto_16398 )
      ( MAKE-12CRATE-VERIFY ?auto_16386 ?auto_16387 ?auto_16388 ?auto_16389 ?auto_16390 ?auto_16391 ?auto_16392 ?auto_16393 ?auto_16394 ?auto_16395 ?auto_16396 ?auto_16397 ?auto_16398 ) )
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
      ?auto_16467 - SURFACE
      ?auto_16468 - SURFACE
      ?auto_16469 - SURFACE
      ?auto_16470 - SURFACE
      ?auto_16471 - SURFACE
      ?auto_16472 - SURFACE
      ?auto_16473 - SURFACE
    )
    :vars
    (
      ?auto_16478 - HOIST
      ?auto_16475 - PLACE
      ?auto_16476 - PLACE
      ?auto_16477 - HOIST
      ?auto_16474 - SURFACE
      ?auto_16488 - PLACE
      ?auto_16504 - HOIST
      ?auto_16481 - SURFACE
      ?auto_16492 - PLACE
      ?auto_16483 - HOIST
      ?auto_16506 - SURFACE
      ?auto_16485 - PLACE
      ?auto_16493 - HOIST
      ?auto_16498 - SURFACE
      ?auto_16487 - SURFACE
      ?auto_16496 - PLACE
      ?auto_16489 - HOIST
      ?auto_16502 - SURFACE
      ?auto_16482 - PLACE
      ?auto_16486 - HOIST
      ?auto_16512 - SURFACE
      ?auto_16497 - PLACE
      ?auto_16495 - HOIST
      ?auto_16510 - SURFACE
      ?auto_16500 - PLACE
      ?auto_16505 - HOIST
      ?auto_16513 - SURFACE
      ?auto_16499 - PLACE
      ?auto_16507 - HOIST
      ?auto_16509 - SURFACE
      ?auto_16494 - PLACE
      ?auto_16490 - HOIST
      ?auto_16503 - SURFACE
      ?auto_16491 - PLACE
      ?auto_16480 - HOIST
      ?auto_16484 - SURFACE
      ?auto_16508 - PLACE
      ?auto_16501 - HOIST
      ?auto_16511 - SURFACE
      ?auto_16479 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16478 ?auto_16475 ) ( IS-CRATE ?auto_16473 ) ( not ( = ?auto_16476 ?auto_16475 ) ) ( HOIST-AT ?auto_16477 ?auto_16476 ) ( AVAILABLE ?auto_16477 ) ( SURFACE-AT ?auto_16473 ?auto_16476 ) ( ON ?auto_16473 ?auto_16474 ) ( CLEAR ?auto_16473 ) ( not ( = ?auto_16472 ?auto_16473 ) ) ( not ( = ?auto_16472 ?auto_16474 ) ) ( not ( = ?auto_16473 ?auto_16474 ) ) ( not ( = ?auto_16478 ?auto_16477 ) ) ( IS-CRATE ?auto_16472 ) ( not ( = ?auto_16488 ?auto_16475 ) ) ( HOIST-AT ?auto_16504 ?auto_16488 ) ( AVAILABLE ?auto_16504 ) ( SURFACE-AT ?auto_16472 ?auto_16488 ) ( ON ?auto_16472 ?auto_16481 ) ( CLEAR ?auto_16472 ) ( not ( = ?auto_16471 ?auto_16472 ) ) ( not ( = ?auto_16471 ?auto_16481 ) ) ( not ( = ?auto_16472 ?auto_16481 ) ) ( not ( = ?auto_16478 ?auto_16504 ) ) ( IS-CRATE ?auto_16471 ) ( not ( = ?auto_16492 ?auto_16475 ) ) ( HOIST-AT ?auto_16483 ?auto_16492 ) ( AVAILABLE ?auto_16483 ) ( SURFACE-AT ?auto_16471 ?auto_16492 ) ( ON ?auto_16471 ?auto_16506 ) ( CLEAR ?auto_16471 ) ( not ( = ?auto_16470 ?auto_16471 ) ) ( not ( = ?auto_16470 ?auto_16506 ) ) ( not ( = ?auto_16471 ?auto_16506 ) ) ( not ( = ?auto_16478 ?auto_16483 ) ) ( IS-CRATE ?auto_16470 ) ( not ( = ?auto_16485 ?auto_16475 ) ) ( HOIST-AT ?auto_16493 ?auto_16485 ) ( SURFACE-AT ?auto_16470 ?auto_16485 ) ( ON ?auto_16470 ?auto_16498 ) ( CLEAR ?auto_16470 ) ( not ( = ?auto_16469 ?auto_16470 ) ) ( not ( = ?auto_16469 ?auto_16498 ) ) ( not ( = ?auto_16470 ?auto_16498 ) ) ( not ( = ?auto_16478 ?auto_16493 ) ) ( IS-CRATE ?auto_16469 ) ( AVAILABLE ?auto_16493 ) ( SURFACE-AT ?auto_16469 ?auto_16485 ) ( ON ?auto_16469 ?auto_16487 ) ( CLEAR ?auto_16469 ) ( not ( = ?auto_16468 ?auto_16469 ) ) ( not ( = ?auto_16468 ?auto_16487 ) ) ( not ( = ?auto_16469 ?auto_16487 ) ) ( IS-CRATE ?auto_16468 ) ( not ( = ?auto_16496 ?auto_16475 ) ) ( HOIST-AT ?auto_16489 ?auto_16496 ) ( AVAILABLE ?auto_16489 ) ( SURFACE-AT ?auto_16468 ?auto_16496 ) ( ON ?auto_16468 ?auto_16502 ) ( CLEAR ?auto_16468 ) ( not ( = ?auto_16467 ?auto_16468 ) ) ( not ( = ?auto_16467 ?auto_16502 ) ) ( not ( = ?auto_16468 ?auto_16502 ) ) ( not ( = ?auto_16478 ?auto_16489 ) ) ( IS-CRATE ?auto_16467 ) ( not ( = ?auto_16482 ?auto_16475 ) ) ( HOIST-AT ?auto_16486 ?auto_16482 ) ( AVAILABLE ?auto_16486 ) ( SURFACE-AT ?auto_16467 ?auto_16482 ) ( ON ?auto_16467 ?auto_16512 ) ( CLEAR ?auto_16467 ) ( not ( = ?auto_16466 ?auto_16467 ) ) ( not ( = ?auto_16466 ?auto_16512 ) ) ( not ( = ?auto_16467 ?auto_16512 ) ) ( not ( = ?auto_16478 ?auto_16486 ) ) ( IS-CRATE ?auto_16466 ) ( not ( = ?auto_16497 ?auto_16475 ) ) ( HOIST-AT ?auto_16495 ?auto_16497 ) ( AVAILABLE ?auto_16495 ) ( SURFACE-AT ?auto_16466 ?auto_16497 ) ( ON ?auto_16466 ?auto_16510 ) ( CLEAR ?auto_16466 ) ( not ( = ?auto_16465 ?auto_16466 ) ) ( not ( = ?auto_16465 ?auto_16510 ) ) ( not ( = ?auto_16466 ?auto_16510 ) ) ( not ( = ?auto_16478 ?auto_16495 ) ) ( IS-CRATE ?auto_16465 ) ( not ( = ?auto_16500 ?auto_16475 ) ) ( HOIST-AT ?auto_16505 ?auto_16500 ) ( AVAILABLE ?auto_16505 ) ( SURFACE-AT ?auto_16465 ?auto_16500 ) ( ON ?auto_16465 ?auto_16513 ) ( CLEAR ?auto_16465 ) ( not ( = ?auto_16464 ?auto_16465 ) ) ( not ( = ?auto_16464 ?auto_16513 ) ) ( not ( = ?auto_16465 ?auto_16513 ) ) ( not ( = ?auto_16478 ?auto_16505 ) ) ( IS-CRATE ?auto_16464 ) ( not ( = ?auto_16499 ?auto_16475 ) ) ( HOIST-AT ?auto_16507 ?auto_16499 ) ( AVAILABLE ?auto_16507 ) ( SURFACE-AT ?auto_16464 ?auto_16499 ) ( ON ?auto_16464 ?auto_16509 ) ( CLEAR ?auto_16464 ) ( not ( = ?auto_16463 ?auto_16464 ) ) ( not ( = ?auto_16463 ?auto_16509 ) ) ( not ( = ?auto_16464 ?auto_16509 ) ) ( not ( = ?auto_16478 ?auto_16507 ) ) ( IS-CRATE ?auto_16463 ) ( not ( = ?auto_16494 ?auto_16475 ) ) ( HOIST-AT ?auto_16490 ?auto_16494 ) ( AVAILABLE ?auto_16490 ) ( SURFACE-AT ?auto_16463 ?auto_16494 ) ( ON ?auto_16463 ?auto_16503 ) ( CLEAR ?auto_16463 ) ( not ( = ?auto_16462 ?auto_16463 ) ) ( not ( = ?auto_16462 ?auto_16503 ) ) ( not ( = ?auto_16463 ?auto_16503 ) ) ( not ( = ?auto_16478 ?auto_16490 ) ) ( IS-CRATE ?auto_16462 ) ( not ( = ?auto_16491 ?auto_16475 ) ) ( HOIST-AT ?auto_16480 ?auto_16491 ) ( AVAILABLE ?auto_16480 ) ( SURFACE-AT ?auto_16462 ?auto_16491 ) ( ON ?auto_16462 ?auto_16484 ) ( CLEAR ?auto_16462 ) ( not ( = ?auto_16461 ?auto_16462 ) ) ( not ( = ?auto_16461 ?auto_16484 ) ) ( not ( = ?auto_16462 ?auto_16484 ) ) ( not ( = ?auto_16478 ?auto_16480 ) ) ( SURFACE-AT ?auto_16460 ?auto_16475 ) ( CLEAR ?auto_16460 ) ( IS-CRATE ?auto_16461 ) ( AVAILABLE ?auto_16478 ) ( not ( = ?auto_16508 ?auto_16475 ) ) ( HOIST-AT ?auto_16501 ?auto_16508 ) ( AVAILABLE ?auto_16501 ) ( SURFACE-AT ?auto_16461 ?auto_16508 ) ( ON ?auto_16461 ?auto_16511 ) ( CLEAR ?auto_16461 ) ( TRUCK-AT ?auto_16479 ?auto_16475 ) ( not ( = ?auto_16460 ?auto_16461 ) ) ( not ( = ?auto_16460 ?auto_16511 ) ) ( not ( = ?auto_16461 ?auto_16511 ) ) ( not ( = ?auto_16478 ?auto_16501 ) ) ( not ( = ?auto_16460 ?auto_16462 ) ) ( not ( = ?auto_16460 ?auto_16484 ) ) ( not ( = ?auto_16462 ?auto_16511 ) ) ( not ( = ?auto_16491 ?auto_16508 ) ) ( not ( = ?auto_16480 ?auto_16501 ) ) ( not ( = ?auto_16484 ?auto_16511 ) ) ( not ( = ?auto_16460 ?auto_16463 ) ) ( not ( = ?auto_16460 ?auto_16503 ) ) ( not ( = ?auto_16461 ?auto_16463 ) ) ( not ( = ?auto_16461 ?auto_16503 ) ) ( not ( = ?auto_16463 ?auto_16484 ) ) ( not ( = ?auto_16463 ?auto_16511 ) ) ( not ( = ?auto_16494 ?auto_16491 ) ) ( not ( = ?auto_16494 ?auto_16508 ) ) ( not ( = ?auto_16490 ?auto_16480 ) ) ( not ( = ?auto_16490 ?auto_16501 ) ) ( not ( = ?auto_16503 ?auto_16484 ) ) ( not ( = ?auto_16503 ?auto_16511 ) ) ( not ( = ?auto_16460 ?auto_16464 ) ) ( not ( = ?auto_16460 ?auto_16509 ) ) ( not ( = ?auto_16461 ?auto_16464 ) ) ( not ( = ?auto_16461 ?auto_16509 ) ) ( not ( = ?auto_16462 ?auto_16464 ) ) ( not ( = ?auto_16462 ?auto_16509 ) ) ( not ( = ?auto_16464 ?auto_16503 ) ) ( not ( = ?auto_16464 ?auto_16484 ) ) ( not ( = ?auto_16464 ?auto_16511 ) ) ( not ( = ?auto_16499 ?auto_16494 ) ) ( not ( = ?auto_16499 ?auto_16491 ) ) ( not ( = ?auto_16499 ?auto_16508 ) ) ( not ( = ?auto_16507 ?auto_16490 ) ) ( not ( = ?auto_16507 ?auto_16480 ) ) ( not ( = ?auto_16507 ?auto_16501 ) ) ( not ( = ?auto_16509 ?auto_16503 ) ) ( not ( = ?auto_16509 ?auto_16484 ) ) ( not ( = ?auto_16509 ?auto_16511 ) ) ( not ( = ?auto_16460 ?auto_16465 ) ) ( not ( = ?auto_16460 ?auto_16513 ) ) ( not ( = ?auto_16461 ?auto_16465 ) ) ( not ( = ?auto_16461 ?auto_16513 ) ) ( not ( = ?auto_16462 ?auto_16465 ) ) ( not ( = ?auto_16462 ?auto_16513 ) ) ( not ( = ?auto_16463 ?auto_16465 ) ) ( not ( = ?auto_16463 ?auto_16513 ) ) ( not ( = ?auto_16465 ?auto_16509 ) ) ( not ( = ?auto_16465 ?auto_16503 ) ) ( not ( = ?auto_16465 ?auto_16484 ) ) ( not ( = ?auto_16465 ?auto_16511 ) ) ( not ( = ?auto_16500 ?auto_16499 ) ) ( not ( = ?auto_16500 ?auto_16494 ) ) ( not ( = ?auto_16500 ?auto_16491 ) ) ( not ( = ?auto_16500 ?auto_16508 ) ) ( not ( = ?auto_16505 ?auto_16507 ) ) ( not ( = ?auto_16505 ?auto_16490 ) ) ( not ( = ?auto_16505 ?auto_16480 ) ) ( not ( = ?auto_16505 ?auto_16501 ) ) ( not ( = ?auto_16513 ?auto_16509 ) ) ( not ( = ?auto_16513 ?auto_16503 ) ) ( not ( = ?auto_16513 ?auto_16484 ) ) ( not ( = ?auto_16513 ?auto_16511 ) ) ( not ( = ?auto_16460 ?auto_16466 ) ) ( not ( = ?auto_16460 ?auto_16510 ) ) ( not ( = ?auto_16461 ?auto_16466 ) ) ( not ( = ?auto_16461 ?auto_16510 ) ) ( not ( = ?auto_16462 ?auto_16466 ) ) ( not ( = ?auto_16462 ?auto_16510 ) ) ( not ( = ?auto_16463 ?auto_16466 ) ) ( not ( = ?auto_16463 ?auto_16510 ) ) ( not ( = ?auto_16464 ?auto_16466 ) ) ( not ( = ?auto_16464 ?auto_16510 ) ) ( not ( = ?auto_16466 ?auto_16513 ) ) ( not ( = ?auto_16466 ?auto_16509 ) ) ( not ( = ?auto_16466 ?auto_16503 ) ) ( not ( = ?auto_16466 ?auto_16484 ) ) ( not ( = ?auto_16466 ?auto_16511 ) ) ( not ( = ?auto_16497 ?auto_16500 ) ) ( not ( = ?auto_16497 ?auto_16499 ) ) ( not ( = ?auto_16497 ?auto_16494 ) ) ( not ( = ?auto_16497 ?auto_16491 ) ) ( not ( = ?auto_16497 ?auto_16508 ) ) ( not ( = ?auto_16495 ?auto_16505 ) ) ( not ( = ?auto_16495 ?auto_16507 ) ) ( not ( = ?auto_16495 ?auto_16490 ) ) ( not ( = ?auto_16495 ?auto_16480 ) ) ( not ( = ?auto_16495 ?auto_16501 ) ) ( not ( = ?auto_16510 ?auto_16513 ) ) ( not ( = ?auto_16510 ?auto_16509 ) ) ( not ( = ?auto_16510 ?auto_16503 ) ) ( not ( = ?auto_16510 ?auto_16484 ) ) ( not ( = ?auto_16510 ?auto_16511 ) ) ( not ( = ?auto_16460 ?auto_16467 ) ) ( not ( = ?auto_16460 ?auto_16512 ) ) ( not ( = ?auto_16461 ?auto_16467 ) ) ( not ( = ?auto_16461 ?auto_16512 ) ) ( not ( = ?auto_16462 ?auto_16467 ) ) ( not ( = ?auto_16462 ?auto_16512 ) ) ( not ( = ?auto_16463 ?auto_16467 ) ) ( not ( = ?auto_16463 ?auto_16512 ) ) ( not ( = ?auto_16464 ?auto_16467 ) ) ( not ( = ?auto_16464 ?auto_16512 ) ) ( not ( = ?auto_16465 ?auto_16467 ) ) ( not ( = ?auto_16465 ?auto_16512 ) ) ( not ( = ?auto_16467 ?auto_16510 ) ) ( not ( = ?auto_16467 ?auto_16513 ) ) ( not ( = ?auto_16467 ?auto_16509 ) ) ( not ( = ?auto_16467 ?auto_16503 ) ) ( not ( = ?auto_16467 ?auto_16484 ) ) ( not ( = ?auto_16467 ?auto_16511 ) ) ( not ( = ?auto_16482 ?auto_16497 ) ) ( not ( = ?auto_16482 ?auto_16500 ) ) ( not ( = ?auto_16482 ?auto_16499 ) ) ( not ( = ?auto_16482 ?auto_16494 ) ) ( not ( = ?auto_16482 ?auto_16491 ) ) ( not ( = ?auto_16482 ?auto_16508 ) ) ( not ( = ?auto_16486 ?auto_16495 ) ) ( not ( = ?auto_16486 ?auto_16505 ) ) ( not ( = ?auto_16486 ?auto_16507 ) ) ( not ( = ?auto_16486 ?auto_16490 ) ) ( not ( = ?auto_16486 ?auto_16480 ) ) ( not ( = ?auto_16486 ?auto_16501 ) ) ( not ( = ?auto_16512 ?auto_16510 ) ) ( not ( = ?auto_16512 ?auto_16513 ) ) ( not ( = ?auto_16512 ?auto_16509 ) ) ( not ( = ?auto_16512 ?auto_16503 ) ) ( not ( = ?auto_16512 ?auto_16484 ) ) ( not ( = ?auto_16512 ?auto_16511 ) ) ( not ( = ?auto_16460 ?auto_16468 ) ) ( not ( = ?auto_16460 ?auto_16502 ) ) ( not ( = ?auto_16461 ?auto_16468 ) ) ( not ( = ?auto_16461 ?auto_16502 ) ) ( not ( = ?auto_16462 ?auto_16468 ) ) ( not ( = ?auto_16462 ?auto_16502 ) ) ( not ( = ?auto_16463 ?auto_16468 ) ) ( not ( = ?auto_16463 ?auto_16502 ) ) ( not ( = ?auto_16464 ?auto_16468 ) ) ( not ( = ?auto_16464 ?auto_16502 ) ) ( not ( = ?auto_16465 ?auto_16468 ) ) ( not ( = ?auto_16465 ?auto_16502 ) ) ( not ( = ?auto_16466 ?auto_16468 ) ) ( not ( = ?auto_16466 ?auto_16502 ) ) ( not ( = ?auto_16468 ?auto_16512 ) ) ( not ( = ?auto_16468 ?auto_16510 ) ) ( not ( = ?auto_16468 ?auto_16513 ) ) ( not ( = ?auto_16468 ?auto_16509 ) ) ( not ( = ?auto_16468 ?auto_16503 ) ) ( not ( = ?auto_16468 ?auto_16484 ) ) ( not ( = ?auto_16468 ?auto_16511 ) ) ( not ( = ?auto_16496 ?auto_16482 ) ) ( not ( = ?auto_16496 ?auto_16497 ) ) ( not ( = ?auto_16496 ?auto_16500 ) ) ( not ( = ?auto_16496 ?auto_16499 ) ) ( not ( = ?auto_16496 ?auto_16494 ) ) ( not ( = ?auto_16496 ?auto_16491 ) ) ( not ( = ?auto_16496 ?auto_16508 ) ) ( not ( = ?auto_16489 ?auto_16486 ) ) ( not ( = ?auto_16489 ?auto_16495 ) ) ( not ( = ?auto_16489 ?auto_16505 ) ) ( not ( = ?auto_16489 ?auto_16507 ) ) ( not ( = ?auto_16489 ?auto_16490 ) ) ( not ( = ?auto_16489 ?auto_16480 ) ) ( not ( = ?auto_16489 ?auto_16501 ) ) ( not ( = ?auto_16502 ?auto_16512 ) ) ( not ( = ?auto_16502 ?auto_16510 ) ) ( not ( = ?auto_16502 ?auto_16513 ) ) ( not ( = ?auto_16502 ?auto_16509 ) ) ( not ( = ?auto_16502 ?auto_16503 ) ) ( not ( = ?auto_16502 ?auto_16484 ) ) ( not ( = ?auto_16502 ?auto_16511 ) ) ( not ( = ?auto_16460 ?auto_16469 ) ) ( not ( = ?auto_16460 ?auto_16487 ) ) ( not ( = ?auto_16461 ?auto_16469 ) ) ( not ( = ?auto_16461 ?auto_16487 ) ) ( not ( = ?auto_16462 ?auto_16469 ) ) ( not ( = ?auto_16462 ?auto_16487 ) ) ( not ( = ?auto_16463 ?auto_16469 ) ) ( not ( = ?auto_16463 ?auto_16487 ) ) ( not ( = ?auto_16464 ?auto_16469 ) ) ( not ( = ?auto_16464 ?auto_16487 ) ) ( not ( = ?auto_16465 ?auto_16469 ) ) ( not ( = ?auto_16465 ?auto_16487 ) ) ( not ( = ?auto_16466 ?auto_16469 ) ) ( not ( = ?auto_16466 ?auto_16487 ) ) ( not ( = ?auto_16467 ?auto_16469 ) ) ( not ( = ?auto_16467 ?auto_16487 ) ) ( not ( = ?auto_16469 ?auto_16502 ) ) ( not ( = ?auto_16469 ?auto_16512 ) ) ( not ( = ?auto_16469 ?auto_16510 ) ) ( not ( = ?auto_16469 ?auto_16513 ) ) ( not ( = ?auto_16469 ?auto_16509 ) ) ( not ( = ?auto_16469 ?auto_16503 ) ) ( not ( = ?auto_16469 ?auto_16484 ) ) ( not ( = ?auto_16469 ?auto_16511 ) ) ( not ( = ?auto_16485 ?auto_16496 ) ) ( not ( = ?auto_16485 ?auto_16482 ) ) ( not ( = ?auto_16485 ?auto_16497 ) ) ( not ( = ?auto_16485 ?auto_16500 ) ) ( not ( = ?auto_16485 ?auto_16499 ) ) ( not ( = ?auto_16485 ?auto_16494 ) ) ( not ( = ?auto_16485 ?auto_16491 ) ) ( not ( = ?auto_16485 ?auto_16508 ) ) ( not ( = ?auto_16493 ?auto_16489 ) ) ( not ( = ?auto_16493 ?auto_16486 ) ) ( not ( = ?auto_16493 ?auto_16495 ) ) ( not ( = ?auto_16493 ?auto_16505 ) ) ( not ( = ?auto_16493 ?auto_16507 ) ) ( not ( = ?auto_16493 ?auto_16490 ) ) ( not ( = ?auto_16493 ?auto_16480 ) ) ( not ( = ?auto_16493 ?auto_16501 ) ) ( not ( = ?auto_16487 ?auto_16502 ) ) ( not ( = ?auto_16487 ?auto_16512 ) ) ( not ( = ?auto_16487 ?auto_16510 ) ) ( not ( = ?auto_16487 ?auto_16513 ) ) ( not ( = ?auto_16487 ?auto_16509 ) ) ( not ( = ?auto_16487 ?auto_16503 ) ) ( not ( = ?auto_16487 ?auto_16484 ) ) ( not ( = ?auto_16487 ?auto_16511 ) ) ( not ( = ?auto_16460 ?auto_16470 ) ) ( not ( = ?auto_16460 ?auto_16498 ) ) ( not ( = ?auto_16461 ?auto_16470 ) ) ( not ( = ?auto_16461 ?auto_16498 ) ) ( not ( = ?auto_16462 ?auto_16470 ) ) ( not ( = ?auto_16462 ?auto_16498 ) ) ( not ( = ?auto_16463 ?auto_16470 ) ) ( not ( = ?auto_16463 ?auto_16498 ) ) ( not ( = ?auto_16464 ?auto_16470 ) ) ( not ( = ?auto_16464 ?auto_16498 ) ) ( not ( = ?auto_16465 ?auto_16470 ) ) ( not ( = ?auto_16465 ?auto_16498 ) ) ( not ( = ?auto_16466 ?auto_16470 ) ) ( not ( = ?auto_16466 ?auto_16498 ) ) ( not ( = ?auto_16467 ?auto_16470 ) ) ( not ( = ?auto_16467 ?auto_16498 ) ) ( not ( = ?auto_16468 ?auto_16470 ) ) ( not ( = ?auto_16468 ?auto_16498 ) ) ( not ( = ?auto_16470 ?auto_16487 ) ) ( not ( = ?auto_16470 ?auto_16502 ) ) ( not ( = ?auto_16470 ?auto_16512 ) ) ( not ( = ?auto_16470 ?auto_16510 ) ) ( not ( = ?auto_16470 ?auto_16513 ) ) ( not ( = ?auto_16470 ?auto_16509 ) ) ( not ( = ?auto_16470 ?auto_16503 ) ) ( not ( = ?auto_16470 ?auto_16484 ) ) ( not ( = ?auto_16470 ?auto_16511 ) ) ( not ( = ?auto_16498 ?auto_16487 ) ) ( not ( = ?auto_16498 ?auto_16502 ) ) ( not ( = ?auto_16498 ?auto_16512 ) ) ( not ( = ?auto_16498 ?auto_16510 ) ) ( not ( = ?auto_16498 ?auto_16513 ) ) ( not ( = ?auto_16498 ?auto_16509 ) ) ( not ( = ?auto_16498 ?auto_16503 ) ) ( not ( = ?auto_16498 ?auto_16484 ) ) ( not ( = ?auto_16498 ?auto_16511 ) ) ( not ( = ?auto_16460 ?auto_16471 ) ) ( not ( = ?auto_16460 ?auto_16506 ) ) ( not ( = ?auto_16461 ?auto_16471 ) ) ( not ( = ?auto_16461 ?auto_16506 ) ) ( not ( = ?auto_16462 ?auto_16471 ) ) ( not ( = ?auto_16462 ?auto_16506 ) ) ( not ( = ?auto_16463 ?auto_16471 ) ) ( not ( = ?auto_16463 ?auto_16506 ) ) ( not ( = ?auto_16464 ?auto_16471 ) ) ( not ( = ?auto_16464 ?auto_16506 ) ) ( not ( = ?auto_16465 ?auto_16471 ) ) ( not ( = ?auto_16465 ?auto_16506 ) ) ( not ( = ?auto_16466 ?auto_16471 ) ) ( not ( = ?auto_16466 ?auto_16506 ) ) ( not ( = ?auto_16467 ?auto_16471 ) ) ( not ( = ?auto_16467 ?auto_16506 ) ) ( not ( = ?auto_16468 ?auto_16471 ) ) ( not ( = ?auto_16468 ?auto_16506 ) ) ( not ( = ?auto_16469 ?auto_16471 ) ) ( not ( = ?auto_16469 ?auto_16506 ) ) ( not ( = ?auto_16471 ?auto_16498 ) ) ( not ( = ?auto_16471 ?auto_16487 ) ) ( not ( = ?auto_16471 ?auto_16502 ) ) ( not ( = ?auto_16471 ?auto_16512 ) ) ( not ( = ?auto_16471 ?auto_16510 ) ) ( not ( = ?auto_16471 ?auto_16513 ) ) ( not ( = ?auto_16471 ?auto_16509 ) ) ( not ( = ?auto_16471 ?auto_16503 ) ) ( not ( = ?auto_16471 ?auto_16484 ) ) ( not ( = ?auto_16471 ?auto_16511 ) ) ( not ( = ?auto_16492 ?auto_16485 ) ) ( not ( = ?auto_16492 ?auto_16496 ) ) ( not ( = ?auto_16492 ?auto_16482 ) ) ( not ( = ?auto_16492 ?auto_16497 ) ) ( not ( = ?auto_16492 ?auto_16500 ) ) ( not ( = ?auto_16492 ?auto_16499 ) ) ( not ( = ?auto_16492 ?auto_16494 ) ) ( not ( = ?auto_16492 ?auto_16491 ) ) ( not ( = ?auto_16492 ?auto_16508 ) ) ( not ( = ?auto_16483 ?auto_16493 ) ) ( not ( = ?auto_16483 ?auto_16489 ) ) ( not ( = ?auto_16483 ?auto_16486 ) ) ( not ( = ?auto_16483 ?auto_16495 ) ) ( not ( = ?auto_16483 ?auto_16505 ) ) ( not ( = ?auto_16483 ?auto_16507 ) ) ( not ( = ?auto_16483 ?auto_16490 ) ) ( not ( = ?auto_16483 ?auto_16480 ) ) ( not ( = ?auto_16483 ?auto_16501 ) ) ( not ( = ?auto_16506 ?auto_16498 ) ) ( not ( = ?auto_16506 ?auto_16487 ) ) ( not ( = ?auto_16506 ?auto_16502 ) ) ( not ( = ?auto_16506 ?auto_16512 ) ) ( not ( = ?auto_16506 ?auto_16510 ) ) ( not ( = ?auto_16506 ?auto_16513 ) ) ( not ( = ?auto_16506 ?auto_16509 ) ) ( not ( = ?auto_16506 ?auto_16503 ) ) ( not ( = ?auto_16506 ?auto_16484 ) ) ( not ( = ?auto_16506 ?auto_16511 ) ) ( not ( = ?auto_16460 ?auto_16472 ) ) ( not ( = ?auto_16460 ?auto_16481 ) ) ( not ( = ?auto_16461 ?auto_16472 ) ) ( not ( = ?auto_16461 ?auto_16481 ) ) ( not ( = ?auto_16462 ?auto_16472 ) ) ( not ( = ?auto_16462 ?auto_16481 ) ) ( not ( = ?auto_16463 ?auto_16472 ) ) ( not ( = ?auto_16463 ?auto_16481 ) ) ( not ( = ?auto_16464 ?auto_16472 ) ) ( not ( = ?auto_16464 ?auto_16481 ) ) ( not ( = ?auto_16465 ?auto_16472 ) ) ( not ( = ?auto_16465 ?auto_16481 ) ) ( not ( = ?auto_16466 ?auto_16472 ) ) ( not ( = ?auto_16466 ?auto_16481 ) ) ( not ( = ?auto_16467 ?auto_16472 ) ) ( not ( = ?auto_16467 ?auto_16481 ) ) ( not ( = ?auto_16468 ?auto_16472 ) ) ( not ( = ?auto_16468 ?auto_16481 ) ) ( not ( = ?auto_16469 ?auto_16472 ) ) ( not ( = ?auto_16469 ?auto_16481 ) ) ( not ( = ?auto_16470 ?auto_16472 ) ) ( not ( = ?auto_16470 ?auto_16481 ) ) ( not ( = ?auto_16472 ?auto_16506 ) ) ( not ( = ?auto_16472 ?auto_16498 ) ) ( not ( = ?auto_16472 ?auto_16487 ) ) ( not ( = ?auto_16472 ?auto_16502 ) ) ( not ( = ?auto_16472 ?auto_16512 ) ) ( not ( = ?auto_16472 ?auto_16510 ) ) ( not ( = ?auto_16472 ?auto_16513 ) ) ( not ( = ?auto_16472 ?auto_16509 ) ) ( not ( = ?auto_16472 ?auto_16503 ) ) ( not ( = ?auto_16472 ?auto_16484 ) ) ( not ( = ?auto_16472 ?auto_16511 ) ) ( not ( = ?auto_16488 ?auto_16492 ) ) ( not ( = ?auto_16488 ?auto_16485 ) ) ( not ( = ?auto_16488 ?auto_16496 ) ) ( not ( = ?auto_16488 ?auto_16482 ) ) ( not ( = ?auto_16488 ?auto_16497 ) ) ( not ( = ?auto_16488 ?auto_16500 ) ) ( not ( = ?auto_16488 ?auto_16499 ) ) ( not ( = ?auto_16488 ?auto_16494 ) ) ( not ( = ?auto_16488 ?auto_16491 ) ) ( not ( = ?auto_16488 ?auto_16508 ) ) ( not ( = ?auto_16504 ?auto_16483 ) ) ( not ( = ?auto_16504 ?auto_16493 ) ) ( not ( = ?auto_16504 ?auto_16489 ) ) ( not ( = ?auto_16504 ?auto_16486 ) ) ( not ( = ?auto_16504 ?auto_16495 ) ) ( not ( = ?auto_16504 ?auto_16505 ) ) ( not ( = ?auto_16504 ?auto_16507 ) ) ( not ( = ?auto_16504 ?auto_16490 ) ) ( not ( = ?auto_16504 ?auto_16480 ) ) ( not ( = ?auto_16504 ?auto_16501 ) ) ( not ( = ?auto_16481 ?auto_16506 ) ) ( not ( = ?auto_16481 ?auto_16498 ) ) ( not ( = ?auto_16481 ?auto_16487 ) ) ( not ( = ?auto_16481 ?auto_16502 ) ) ( not ( = ?auto_16481 ?auto_16512 ) ) ( not ( = ?auto_16481 ?auto_16510 ) ) ( not ( = ?auto_16481 ?auto_16513 ) ) ( not ( = ?auto_16481 ?auto_16509 ) ) ( not ( = ?auto_16481 ?auto_16503 ) ) ( not ( = ?auto_16481 ?auto_16484 ) ) ( not ( = ?auto_16481 ?auto_16511 ) ) ( not ( = ?auto_16460 ?auto_16473 ) ) ( not ( = ?auto_16460 ?auto_16474 ) ) ( not ( = ?auto_16461 ?auto_16473 ) ) ( not ( = ?auto_16461 ?auto_16474 ) ) ( not ( = ?auto_16462 ?auto_16473 ) ) ( not ( = ?auto_16462 ?auto_16474 ) ) ( not ( = ?auto_16463 ?auto_16473 ) ) ( not ( = ?auto_16463 ?auto_16474 ) ) ( not ( = ?auto_16464 ?auto_16473 ) ) ( not ( = ?auto_16464 ?auto_16474 ) ) ( not ( = ?auto_16465 ?auto_16473 ) ) ( not ( = ?auto_16465 ?auto_16474 ) ) ( not ( = ?auto_16466 ?auto_16473 ) ) ( not ( = ?auto_16466 ?auto_16474 ) ) ( not ( = ?auto_16467 ?auto_16473 ) ) ( not ( = ?auto_16467 ?auto_16474 ) ) ( not ( = ?auto_16468 ?auto_16473 ) ) ( not ( = ?auto_16468 ?auto_16474 ) ) ( not ( = ?auto_16469 ?auto_16473 ) ) ( not ( = ?auto_16469 ?auto_16474 ) ) ( not ( = ?auto_16470 ?auto_16473 ) ) ( not ( = ?auto_16470 ?auto_16474 ) ) ( not ( = ?auto_16471 ?auto_16473 ) ) ( not ( = ?auto_16471 ?auto_16474 ) ) ( not ( = ?auto_16473 ?auto_16481 ) ) ( not ( = ?auto_16473 ?auto_16506 ) ) ( not ( = ?auto_16473 ?auto_16498 ) ) ( not ( = ?auto_16473 ?auto_16487 ) ) ( not ( = ?auto_16473 ?auto_16502 ) ) ( not ( = ?auto_16473 ?auto_16512 ) ) ( not ( = ?auto_16473 ?auto_16510 ) ) ( not ( = ?auto_16473 ?auto_16513 ) ) ( not ( = ?auto_16473 ?auto_16509 ) ) ( not ( = ?auto_16473 ?auto_16503 ) ) ( not ( = ?auto_16473 ?auto_16484 ) ) ( not ( = ?auto_16473 ?auto_16511 ) ) ( not ( = ?auto_16476 ?auto_16488 ) ) ( not ( = ?auto_16476 ?auto_16492 ) ) ( not ( = ?auto_16476 ?auto_16485 ) ) ( not ( = ?auto_16476 ?auto_16496 ) ) ( not ( = ?auto_16476 ?auto_16482 ) ) ( not ( = ?auto_16476 ?auto_16497 ) ) ( not ( = ?auto_16476 ?auto_16500 ) ) ( not ( = ?auto_16476 ?auto_16499 ) ) ( not ( = ?auto_16476 ?auto_16494 ) ) ( not ( = ?auto_16476 ?auto_16491 ) ) ( not ( = ?auto_16476 ?auto_16508 ) ) ( not ( = ?auto_16477 ?auto_16504 ) ) ( not ( = ?auto_16477 ?auto_16483 ) ) ( not ( = ?auto_16477 ?auto_16493 ) ) ( not ( = ?auto_16477 ?auto_16489 ) ) ( not ( = ?auto_16477 ?auto_16486 ) ) ( not ( = ?auto_16477 ?auto_16495 ) ) ( not ( = ?auto_16477 ?auto_16505 ) ) ( not ( = ?auto_16477 ?auto_16507 ) ) ( not ( = ?auto_16477 ?auto_16490 ) ) ( not ( = ?auto_16477 ?auto_16480 ) ) ( not ( = ?auto_16477 ?auto_16501 ) ) ( not ( = ?auto_16474 ?auto_16481 ) ) ( not ( = ?auto_16474 ?auto_16506 ) ) ( not ( = ?auto_16474 ?auto_16498 ) ) ( not ( = ?auto_16474 ?auto_16487 ) ) ( not ( = ?auto_16474 ?auto_16502 ) ) ( not ( = ?auto_16474 ?auto_16512 ) ) ( not ( = ?auto_16474 ?auto_16510 ) ) ( not ( = ?auto_16474 ?auto_16513 ) ) ( not ( = ?auto_16474 ?auto_16509 ) ) ( not ( = ?auto_16474 ?auto_16503 ) ) ( not ( = ?auto_16474 ?auto_16484 ) ) ( not ( = ?auto_16474 ?auto_16511 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_16460 ?auto_16461 ?auto_16462 ?auto_16463 ?auto_16464 ?auto_16465 ?auto_16466 ?auto_16467 ?auto_16468 ?auto_16469 ?auto_16470 ?auto_16471 ?auto_16472 )
      ( MAKE-1CRATE ?auto_16472 ?auto_16473 )
      ( MAKE-13CRATE-VERIFY ?auto_16460 ?auto_16461 ?auto_16462 ?auto_16463 ?auto_16464 ?auto_16465 ?auto_16466 ?auto_16467 ?auto_16468 ?auto_16469 ?auto_16470 ?auto_16471 ?auto_16472 ?auto_16473 ) )
  )

)

