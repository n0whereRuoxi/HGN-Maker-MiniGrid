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
      ?auto_17928 - SURFACE
      ?auto_17929 - SURFACE
    )
    :vars
    (
      ?auto_17930 - HOIST
      ?auto_17931 - PLACE
      ?auto_17933 - PLACE
      ?auto_17934 - HOIST
      ?auto_17935 - SURFACE
      ?auto_17932 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17930 ?auto_17931 ) ( SURFACE-AT ?auto_17928 ?auto_17931 ) ( CLEAR ?auto_17928 ) ( IS-CRATE ?auto_17929 ) ( AVAILABLE ?auto_17930 ) ( not ( = ?auto_17933 ?auto_17931 ) ) ( HOIST-AT ?auto_17934 ?auto_17933 ) ( AVAILABLE ?auto_17934 ) ( SURFACE-AT ?auto_17929 ?auto_17933 ) ( ON ?auto_17929 ?auto_17935 ) ( CLEAR ?auto_17929 ) ( TRUCK-AT ?auto_17932 ?auto_17931 ) ( not ( = ?auto_17928 ?auto_17929 ) ) ( not ( = ?auto_17928 ?auto_17935 ) ) ( not ( = ?auto_17929 ?auto_17935 ) ) ( not ( = ?auto_17930 ?auto_17934 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17932 ?auto_17931 ?auto_17933 )
      ( !LIFT ?auto_17934 ?auto_17929 ?auto_17935 ?auto_17933 )
      ( !LOAD ?auto_17934 ?auto_17929 ?auto_17932 ?auto_17933 )
      ( !DRIVE ?auto_17932 ?auto_17933 ?auto_17931 )
      ( !UNLOAD ?auto_17930 ?auto_17929 ?auto_17932 ?auto_17931 )
      ( !DROP ?auto_17930 ?auto_17929 ?auto_17928 ?auto_17931 )
      ( MAKE-1CRATE-VERIFY ?auto_17928 ?auto_17929 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17938 - SURFACE
      ?auto_17939 - SURFACE
    )
    :vars
    (
      ?auto_17940 - HOIST
      ?auto_17941 - PLACE
      ?auto_17943 - PLACE
      ?auto_17944 - HOIST
      ?auto_17945 - SURFACE
      ?auto_17942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17940 ?auto_17941 ) ( SURFACE-AT ?auto_17938 ?auto_17941 ) ( CLEAR ?auto_17938 ) ( IS-CRATE ?auto_17939 ) ( AVAILABLE ?auto_17940 ) ( not ( = ?auto_17943 ?auto_17941 ) ) ( HOIST-AT ?auto_17944 ?auto_17943 ) ( AVAILABLE ?auto_17944 ) ( SURFACE-AT ?auto_17939 ?auto_17943 ) ( ON ?auto_17939 ?auto_17945 ) ( CLEAR ?auto_17939 ) ( TRUCK-AT ?auto_17942 ?auto_17941 ) ( not ( = ?auto_17938 ?auto_17939 ) ) ( not ( = ?auto_17938 ?auto_17945 ) ) ( not ( = ?auto_17939 ?auto_17945 ) ) ( not ( = ?auto_17940 ?auto_17944 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17942 ?auto_17941 ?auto_17943 )
      ( !LIFT ?auto_17944 ?auto_17939 ?auto_17945 ?auto_17943 )
      ( !LOAD ?auto_17944 ?auto_17939 ?auto_17942 ?auto_17943 )
      ( !DRIVE ?auto_17942 ?auto_17943 ?auto_17941 )
      ( !UNLOAD ?auto_17940 ?auto_17939 ?auto_17942 ?auto_17941 )
      ( !DROP ?auto_17940 ?auto_17939 ?auto_17938 ?auto_17941 )
      ( MAKE-1CRATE-VERIFY ?auto_17938 ?auto_17939 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17949 - SURFACE
      ?auto_17950 - SURFACE
      ?auto_17951 - SURFACE
    )
    :vars
    (
      ?auto_17957 - HOIST
      ?auto_17952 - PLACE
      ?auto_17954 - PLACE
      ?auto_17953 - HOIST
      ?auto_17955 - SURFACE
      ?auto_17958 - PLACE
      ?auto_17959 - HOIST
      ?auto_17960 - SURFACE
      ?auto_17956 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17957 ?auto_17952 ) ( IS-CRATE ?auto_17951 ) ( not ( = ?auto_17954 ?auto_17952 ) ) ( HOIST-AT ?auto_17953 ?auto_17954 ) ( AVAILABLE ?auto_17953 ) ( SURFACE-AT ?auto_17951 ?auto_17954 ) ( ON ?auto_17951 ?auto_17955 ) ( CLEAR ?auto_17951 ) ( not ( = ?auto_17950 ?auto_17951 ) ) ( not ( = ?auto_17950 ?auto_17955 ) ) ( not ( = ?auto_17951 ?auto_17955 ) ) ( not ( = ?auto_17957 ?auto_17953 ) ) ( SURFACE-AT ?auto_17949 ?auto_17952 ) ( CLEAR ?auto_17949 ) ( IS-CRATE ?auto_17950 ) ( AVAILABLE ?auto_17957 ) ( not ( = ?auto_17958 ?auto_17952 ) ) ( HOIST-AT ?auto_17959 ?auto_17958 ) ( AVAILABLE ?auto_17959 ) ( SURFACE-AT ?auto_17950 ?auto_17958 ) ( ON ?auto_17950 ?auto_17960 ) ( CLEAR ?auto_17950 ) ( TRUCK-AT ?auto_17956 ?auto_17952 ) ( not ( = ?auto_17949 ?auto_17950 ) ) ( not ( = ?auto_17949 ?auto_17960 ) ) ( not ( = ?auto_17950 ?auto_17960 ) ) ( not ( = ?auto_17957 ?auto_17959 ) ) ( not ( = ?auto_17949 ?auto_17951 ) ) ( not ( = ?auto_17949 ?auto_17955 ) ) ( not ( = ?auto_17951 ?auto_17960 ) ) ( not ( = ?auto_17954 ?auto_17958 ) ) ( not ( = ?auto_17953 ?auto_17959 ) ) ( not ( = ?auto_17955 ?auto_17960 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17949 ?auto_17950 )
      ( MAKE-1CRATE ?auto_17950 ?auto_17951 )
      ( MAKE-2CRATE-VERIFY ?auto_17949 ?auto_17950 ?auto_17951 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17963 - SURFACE
      ?auto_17964 - SURFACE
    )
    :vars
    (
      ?auto_17965 - HOIST
      ?auto_17966 - PLACE
      ?auto_17968 - PLACE
      ?auto_17969 - HOIST
      ?auto_17970 - SURFACE
      ?auto_17967 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17965 ?auto_17966 ) ( SURFACE-AT ?auto_17963 ?auto_17966 ) ( CLEAR ?auto_17963 ) ( IS-CRATE ?auto_17964 ) ( AVAILABLE ?auto_17965 ) ( not ( = ?auto_17968 ?auto_17966 ) ) ( HOIST-AT ?auto_17969 ?auto_17968 ) ( AVAILABLE ?auto_17969 ) ( SURFACE-AT ?auto_17964 ?auto_17968 ) ( ON ?auto_17964 ?auto_17970 ) ( CLEAR ?auto_17964 ) ( TRUCK-AT ?auto_17967 ?auto_17966 ) ( not ( = ?auto_17963 ?auto_17964 ) ) ( not ( = ?auto_17963 ?auto_17970 ) ) ( not ( = ?auto_17964 ?auto_17970 ) ) ( not ( = ?auto_17965 ?auto_17969 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17967 ?auto_17966 ?auto_17968 )
      ( !LIFT ?auto_17969 ?auto_17964 ?auto_17970 ?auto_17968 )
      ( !LOAD ?auto_17969 ?auto_17964 ?auto_17967 ?auto_17968 )
      ( !DRIVE ?auto_17967 ?auto_17968 ?auto_17966 )
      ( !UNLOAD ?auto_17965 ?auto_17964 ?auto_17967 ?auto_17966 )
      ( !DROP ?auto_17965 ?auto_17964 ?auto_17963 ?auto_17966 )
      ( MAKE-1CRATE-VERIFY ?auto_17963 ?auto_17964 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17975 - SURFACE
      ?auto_17976 - SURFACE
      ?auto_17977 - SURFACE
      ?auto_17978 - SURFACE
    )
    :vars
    (
      ?auto_17979 - HOIST
      ?auto_17982 - PLACE
      ?auto_17983 - PLACE
      ?auto_17981 - HOIST
      ?auto_17984 - SURFACE
      ?auto_17988 - PLACE
      ?auto_17985 - HOIST
      ?auto_17986 - SURFACE
      ?auto_17987 - PLACE
      ?auto_17990 - HOIST
      ?auto_17989 - SURFACE
      ?auto_17980 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17979 ?auto_17982 ) ( IS-CRATE ?auto_17978 ) ( not ( = ?auto_17983 ?auto_17982 ) ) ( HOIST-AT ?auto_17981 ?auto_17983 ) ( AVAILABLE ?auto_17981 ) ( SURFACE-AT ?auto_17978 ?auto_17983 ) ( ON ?auto_17978 ?auto_17984 ) ( CLEAR ?auto_17978 ) ( not ( = ?auto_17977 ?auto_17978 ) ) ( not ( = ?auto_17977 ?auto_17984 ) ) ( not ( = ?auto_17978 ?auto_17984 ) ) ( not ( = ?auto_17979 ?auto_17981 ) ) ( IS-CRATE ?auto_17977 ) ( not ( = ?auto_17988 ?auto_17982 ) ) ( HOIST-AT ?auto_17985 ?auto_17988 ) ( AVAILABLE ?auto_17985 ) ( SURFACE-AT ?auto_17977 ?auto_17988 ) ( ON ?auto_17977 ?auto_17986 ) ( CLEAR ?auto_17977 ) ( not ( = ?auto_17976 ?auto_17977 ) ) ( not ( = ?auto_17976 ?auto_17986 ) ) ( not ( = ?auto_17977 ?auto_17986 ) ) ( not ( = ?auto_17979 ?auto_17985 ) ) ( SURFACE-AT ?auto_17975 ?auto_17982 ) ( CLEAR ?auto_17975 ) ( IS-CRATE ?auto_17976 ) ( AVAILABLE ?auto_17979 ) ( not ( = ?auto_17987 ?auto_17982 ) ) ( HOIST-AT ?auto_17990 ?auto_17987 ) ( AVAILABLE ?auto_17990 ) ( SURFACE-AT ?auto_17976 ?auto_17987 ) ( ON ?auto_17976 ?auto_17989 ) ( CLEAR ?auto_17976 ) ( TRUCK-AT ?auto_17980 ?auto_17982 ) ( not ( = ?auto_17975 ?auto_17976 ) ) ( not ( = ?auto_17975 ?auto_17989 ) ) ( not ( = ?auto_17976 ?auto_17989 ) ) ( not ( = ?auto_17979 ?auto_17990 ) ) ( not ( = ?auto_17975 ?auto_17977 ) ) ( not ( = ?auto_17975 ?auto_17986 ) ) ( not ( = ?auto_17977 ?auto_17989 ) ) ( not ( = ?auto_17988 ?auto_17987 ) ) ( not ( = ?auto_17985 ?auto_17990 ) ) ( not ( = ?auto_17986 ?auto_17989 ) ) ( not ( = ?auto_17975 ?auto_17978 ) ) ( not ( = ?auto_17975 ?auto_17984 ) ) ( not ( = ?auto_17976 ?auto_17978 ) ) ( not ( = ?auto_17976 ?auto_17984 ) ) ( not ( = ?auto_17978 ?auto_17986 ) ) ( not ( = ?auto_17978 ?auto_17989 ) ) ( not ( = ?auto_17983 ?auto_17988 ) ) ( not ( = ?auto_17983 ?auto_17987 ) ) ( not ( = ?auto_17981 ?auto_17985 ) ) ( not ( = ?auto_17981 ?auto_17990 ) ) ( not ( = ?auto_17984 ?auto_17986 ) ) ( not ( = ?auto_17984 ?auto_17989 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17975 ?auto_17976 ?auto_17977 )
      ( MAKE-1CRATE ?auto_17977 ?auto_17978 )
      ( MAKE-3CRATE-VERIFY ?auto_17975 ?auto_17976 ?auto_17977 ?auto_17978 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17993 - SURFACE
      ?auto_17994 - SURFACE
    )
    :vars
    (
      ?auto_17995 - HOIST
      ?auto_17996 - PLACE
      ?auto_17998 - PLACE
      ?auto_17999 - HOIST
      ?auto_18000 - SURFACE
      ?auto_17997 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17995 ?auto_17996 ) ( SURFACE-AT ?auto_17993 ?auto_17996 ) ( CLEAR ?auto_17993 ) ( IS-CRATE ?auto_17994 ) ( AVAILABLE ?auto_17995 ) ( not ( = ?auto_17998 ?auto_17996 ) ) ( HOIST-AT ?auto_17999 ?auto_17998 ) ( AVAILABLE ?auto_17999 ) ( SURFACE-AT ?auto_17994 ?auto_17998 ) ( ON ?auto_17994 ?auto_18000 ) ( CLEAR ?auto_17994 ) ( TRUCK-AT ?auto_17997 ?auto_17996 ) ( not ( = ?auto_17993 ?auto_17994 ) ) ( not ( = ?auto_17993 ?auto_18000 ) ) ( not ( = ?auto_17994 ?auto_18000 ) ) ( not ( = ?auto_17995 ?auto_17999 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17997 ?auto_17996 ?auto_17998 )
      ( !LIFT ?auto_17999 ?auto_17994 ?auto_18000 ?auto_17998 )
      ( !LOAD ?auto_17999 ?auto_17994 ?auto_17997 ?auto_17998 )
      ( !DRIVE ?auto_17997 ?auto_17998 ?auto_17996 )
      ( !UNLOAD ?auto_17995 ?auto_17994 ?auto_17997 ?auto_17996 )
      ( !DROP ?auto_17995 ?auto_17994 ?auto_17993 ?auto_17996 )
      ( MAKE-1CRATE-VERIFY ?auto_17993 ?auto_17994 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18006 - SURFACE
      ?auto_18007 - SURFACE
      ?auto_18008 - SURFACE
      ?auto_18009 - SURFACE
      ?auto_18010 - SURFACE
    )
    :vars
    (
      ?auto_18011 - HOIST
      ?auto_18016 - PLACE
      ?auto_18012 - PLACE
      ?auto_18014 - HOIST
      ?auto_18013 - SURFACE
      ?auto_18017 - PLACE
      ?auto_18024 - HOIST
      ?auto_18021 - SURFACE
      ?auto_18018 - PLACE
      ?auto_18020 - HOIST
      ?auto_18023 - SURFACE
      ?auto_18025 - PLACE
      ?auto_18022 - HOIST
      ?auto_18019 - SURFACE
      ?auto_18015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18011 ?auto_18016 ) ( IS-CRATE ?auto_18010 ) ( not ( = ?auto_18012 ?auto_18016 ) ) ( HOIST-AT ?auto_18014 ?auto_18012 ) ( AVAILABLE ?auto_18014 ) ( SURFACE-AT ?auto_18010 ?auto_18012 ) ( ON ?auto_18010 ?auto_18013 ) ( CLEAR ?auto_18010 ) ( not ( = ?auto_18009 ?auto_18010 ) ) ( not ( = ?auto_18009 ?auto_18013 ) ) ( not ( = ?auto_18010 ?auto_18013 ) ) ( not ( = ?auto_18011 ?auto_18014 ) ) ( IS-CRATE ?auto_18009 ) ( not ( = ?auto_18017 ?auto_18016 ) ) ( HOIST-AT ?auto_18024 ?auto_18017 ) ( AVAILABLE ?auto_18024 ) ( SURFACE-AT ?auto_18009 ?auto_18017 ) ( ON ?auto_18009 ?auto_18021 ) ( CLEAR ?auto_18009 ) ( not ( = ?auto_18008 ?auto_18009 ) ) ( not ( = ?auto_18008 ?auto_18021 ) ) ( not ( = ?auto_18009 ?auto_18021 ) ) ( not ( = ?auto_18011 ?auto_18024 ) ) ( IS-CRATE ?auto_18008 ) ( not ( = ?auto_18018 ?auto_18016 ) ) ( HOIST-AT ?auto_18020 ?auto_18018 ) ( AVAILABLE ?auto_18020 ) ( SURFACE-AT ?auto_18008 ?auto_18018 ) ( ON ?auto_18008 ?auto_18023 ) ( CLEAR ?auto_18008 ) ( not ( = ?auto_18007 ?auto_18008 ) ) ( not ( = ?auto_18007 ?auto_18023 ) ) ( not ( = ?auto_18008 ?auto_18023 ) ) ( not ( = ?auto_18011 ?auto_18020 ) ) ( SURFACE-AT ?auto_18006 ?auto_18016 ) ( CLEAR ?auto_18006 ) ( IS-CRATE ?auto_18007 ) ( AVAILABLE ?auto_18011 ) ( not ( = ?auto_18025 ?auto_18016 ) ) ( HOIST-AT ?auto_18022 ?auto_18025 ) ( AVAILABLE ?auto_18022 ) ( SURFACE-AT ?auto_18007 ?auto_18025 ) ( ON ?auto_18007 ?auto_18019 ) ( CLEAR ?auto_18007 ) ( TRUCK-AT ?auto_18015 ?auto_18016 ) ( not ( = ?auto_18006 ?auto_18007 ) ) ( not ( = ?auto_18006 ?auto_18019 ) ) ( not ( = ?auto_18007 ?auto_18019 ) ) ( not ( = ?auto_18011 ?auto_18022 ) ) ( not ( = ?auto_18006 ?auto_18008 ) ) ( not ( = ?auto_18006 ?auto_18023 ) ) ( not ( = ?auto_18008 ?auto_18019 ) ) ( not ( = ?auto_18018 ?auto_18025 ) ) ( not ( = ?auto_18020 ?auto_18022 ) ) ( not ( = ?auto_18023 ?auto_18019 ) ) ( not ( = ?auto_18006 ?auto_18009 ) ) ( not ( = ?auto_18006 ?auto_18021 ) ) ( not ( = ?auto_18007 ?auto_18009 ) ) ( not ( = ?auto_18007 ?auto_18021 ) ) ( not ( = ?auto_18009 ?auto_18023 ) ) ( not ( = ?auto_18009 ?auto_18019 ) ) ( not ( = ?auto_18017 ?auto_18018 ) ) ( not ( = ?auto_18017 ?auto_18025 ) ) ( not ( = ?auto_18024 ?auto_18020 ) ) ( not ( = ?auto_18024 ?auto_18022 ) ) ( not ( = ?auto_18021 ?auto_18023 ) ) ( not ( = ?auto_18021 ?auto_18019 ) ) ( not ( = ?auto_18006 ?auto_18010 ) ) ( not ( = ?auto_18006 ?auto_18013 ) ) ( not ( = ?auto_18007 ?auto_18010 ) ) ( not ( = ?auto_18007 ?auto_18013 ) ) ( not ( = ?auto_18008 ?auto_18010 ) ) ( not ( = ?auto_18008 ?auto_18013 ) ) ( not ( = ?auto_18010 ?auto_18021 ) ) ( not ( = ?auto_18010 ?auto_18023 ) ) ( not ( = ?auto_18010 ?auto_18019 ) ) ( not ( = ?auto_18012 ?auto_18017 ) ) ( not ( = ?auto_18012 ?auto_18018 ) ) ( not ( = ?auto_18012 ?auto_18025 ) ) ( not ( = ?auto_18014 ?auto_18024 ) ) ( not ( = ?auto_18014 ?auto_18020 ) ) ( not ( = ?auto_18014 ?auto_18022 ) ) ( not ( = ?auto_18013 ?auto_18021 ) ) ( not ( = ?auto_18013 ?auto_18023 ) ) ( not ( = ?auto_18013 ?auto_18019 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_18006 ?auto_18007 ?auto_18008 ?auto_18009 )
      ( MAKE-1CRATE ?auto_18009 ?auto_18010 )
      ( MAKE-4CRATE-VERIFY ?auto_18006 ?auto_18007 ?auto_18008 ?auto_18009 ?auto_18010 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18028 - SURFACE
      ?auto_18029 - SURFACE
    )
    :vars
    (
      ?auto_18030 - HOIST
      ?auto_18031 - PLACE
      ?auto_18033 - PLACE
      ?auto_18034 - HOIST
      ?auto_18035 - SURFACE
      ?auto_18032 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18030 ?auto_18031 ) ( SURFACE-AT ?auto_18028 ?auto_18031 ) ( CLEAR ?auto_18028 ) ( IS-CRATE ?auto_18029 ) ( AVAILABLE ?auto_18030 ) ( not ( = ?auto_18033 ?auto_18031 ) ) ( HOIST-AT ?auto_18034 ?auto_18033 ) ( AVAILABLE ?auto_18034 ) ( SURFACE-AT ?auto_18029 ?auto_18033 ) ( ON ?auto_18029 ?auto_18035 ) ( CLEAR ?auto_18029 ) ( TRUCK-AT ?auto_18032 ?auto_18031 ) ( not ( = ?auto_18028 ?auto_18029 ) ) ( not ( = ?auto_18028 ?auto_18035 ) ) ( not ( = ?auto_18029 ?auto_18035 ) ) ( not ( = ?auto_18030 ?auto_18034 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18032 ?auto_18031 ?auto_18033 )
      ( !LIFT ?auto_18034 ?auto_18029 ?auto_18035 ?auto_18033 )
      ( !LOAD ?auto_18034 ?auto_18029 ?auto_18032 ?auto_18033 )
      ( !DRIVE ?auto_18032 ?auto_18033 ?auto_18031 )
      ( !UNLOAD ?auto_18030 ?auto_18029 ?auto_18032 ?auto_18031 )
      ( !DROP ?auto_18030 ?auto_18029 ?auto_18028 ?auto_18031 )
      ( MAKE-1CRATE-VERIFY ?auto_18028 ?auto_18029 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18042 - SURFACE
      ?auto_18043 - SURFACE
      ?auto_18044 - SURFACE
      ?auto_18045 - SURFACE
      ?auto_18046 - SURFACE
      ?auto_18047 - SURFACE
    )
    :vars
    (
      ?auto_18050 - HOIST
      ?auto_18052 - PLACE
      ?auto_18049 - PLACE
      ?auto_18051 - HOIST
      ?auto_18053 - SURFACE
      ?auto_18062 - PLACE
      ?auto_18063 - HOIST
      ?auto_18064 - SURFACE
      ?auto_18056 - PLACE
      ?auto_18058 - HOIST
      ?auto_18061 - SURFACE
      ?auto_18059 - PLACE
      ?auto_18065 - HOIST
      ?auto_18054 - SURFACE
      ?auto_18057 - PLACE
      ?auto_18055 - HOIST
      ?auto_18060 - SURFACE
      ?auto_18048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18050 ?auto_18052 ) ( IS-CRATE ?auto_18047 ) ( not ( = ?auto_18049 ?auto_18052 ) ) ( HOIST-AT ?auto_18051 ?auto_18049 ) ( AVAILABLE ?auto_18051 ) ( SURFACE-AT ?auto_18047 ?auto_18049 ) ( ON ?auto_18047 ?auto_18053 ) ( CLEAR ?auto_18047 ) ( not ( = ?auto_18046 ?auto_18047 ) ) ( not ( = ?auto_18046 ?auto_18053 ) ) ( not ( = ?auto_18047 ?auto_18053 ) ) ( not ( = ?auto_18050 ?auto_18051 ) ) ( IS-CRATE ?auto_18046 ) ( not ( = ?auto_18062 ?auto_18052 ) ) ( HOIST-AT ?auto_18063 ?auto_18062 ) ( AVAILABLE ?auto_18063 ) ( SURFACE-AT ?auto_18046 ?auto_18062 ) ( ON ?auto_18046 ?auto_18064 ) ( CLEAR ?auto_18046 ) ( not ( = ?auto_18045 ?auto_18046 ) ) ( not ( = ?auto_18045 ?auto_18064 ) ) ( not ( = ?auto_18046 ?auto_18064 ) ) ( not ( = ?auto_18050 ?auto_18063 ) ) ( IS-CRATE ?auto_18045 ) ( not ( = ?auto_18056 ?auto_18052 ) ) ( HOIST-AT ?auto_18058 ?auto_18056 ) ( AVAILABLE ?auto_18058 ) ( SURFACE-AT ?auto_18045 ?auto_18056 ) ( ON ?auto_18045 ?auto_18061 ) ( CLEAR ?auto_18045 ) ( not ( = ?auto_18044 ?auto_18045 ) ) ( not ( = ?auto_18044 ?auto_18061 ) ) ( not ( = ?auto_18045 ?auto_18061 ) ) ( not ( = ?auto_18050 ?auto_18058 ) ) ( IS-CRATE ?auto_18044 ) ( not ( = ?auto_18059 ?auto_18052 ) ) ( HOIST-AT ?auto_18065 ?auto_18059 ) ( AVAILABLE ?auto_18065 ) ( SURFACE-AT ?auto_18044 ?auto_18059 ) ( ON ?auto_18044 ?auto_18054 ) ( CLEAR ?auto_18044 ) ( not ( = ?auto_18043 ?auto_18044 ) ) ( not ( = ?auto_18043 ?auto_18054 ) ) ( not ( = ?auto_18044 ?auto_18054 ) ) ( not ( = ?auto_18050 ?auto_18065 ) ) ( SURFACE-AT ?auto_18042 ?auto_18052 ) ( CLEAR ?auto_18042 ) ( IS-CRATE ?auto_18043 ) ( AVAILABLE ?auto_18050 ) ( not ( = ?auto_18057 ?auto_18052 ) ) ( HOIST-AT ?auto_18055 ?auto_18057 ) ( AVAILABLE ?auto_18055 ) ( SURFACE-AT ?auto_18043 ?auto_18057 ) ( ON ?auto_18043 ?auto_18060 ) ( CLEAR ?auto_18043 ) ( TRUCK-AT ?auto_18048 ?auto_18052 ) ( not ( = ?auto_18042 ?auto_18043 ) ) ( not ( = ?auto_18042 ?auto_18060 ) ) ( not ( = ?auto_18043 ?auto_18060 ) ) ( not ( = ?auto_18050 ?auto_18055 ) ) ( not ( = ?auto_18042 ?auto_18044 ) ) ( not ( = ?auto_18042 ?auto_18054 ) ) ( not ( = ?auto_18044 ?auto_18060 ) ) ( not ( = ?auto_18059 ?auto_18057 ) ) ( not ( = ?auto_18065 ?auto_18055 ) ) ( not ( = ?auto_18054 ?auto_18060 ) ) ( not ( = ?auto_18042 ?auto_18045 ) ) ( not ( = ?auto_18042 ?auto_18061 ) ) ( not ( = ?auto_18043 ?auto_18045 ) ) ( not ( = ?auto_18043 ?auto_18061 ) ) ( not ( = ?auto_18045 ?auto_18054 ) ) ( not ( = ?auto_18045 ?auto_18060 ) ) ( not ( = ?auto_18056 ?auto_18059 ) ) ( not ( = ?auto_18056 ?auto_18057 ) ) ( not ( = ?auto_18058 ?auto_18065 ) ) ( not ( = ?auto_18058 ?auto_18055 ) ) ( not ( = ?auto_18061 ?auto_18054 ) ) ( not ( = ?auto_18061 ?auto_18060 ) ) ( not ( = ?auto_18042 ?auto_18046 ) ) ( not ( = ?auto_18042 ?auto_18064 ) ) ( not ( = ?auto_18043 ?auto_18046 ) ) ( not ( = ?auto_18043 ?auto_18064 ) ) ( not ( = ?auto_18044 ?auto_18046 ) ) ( not ( = ?auto_18044 ?auto_18064 ) ) ( not ( = ?auto_18046 ?auto_18061 ) ) ( not ( = ?auto_18046 ?auto_18054 ) ) ( not ( = ?auto_18046 ?auto_18060 ) ) ( not ( = ?auto_18062 ?auto_18056 ) ) ( not ( = ?auto_18062 ?auto_18059 ) ) ( not ( = ?auto_18062 ?auto_18057 ) ) ( not ( = ?auto_18063 ?auto_18058 ) ) ( not ( = ?auto_18063 ?auto_18065 ) ) ( not ( = ?auto_18063 ?auto_18055 ) ) ( not ( = ?auto_18064 ?auto_18061 ) ) ( not ( = ?auto_18064 ?auto_18054 ) ) ( not ( = ?auto_18064 ?auto_18060 ) ) ( not ( = ?auto_18042 ?auto_18047 ) ) ( not ( = ?auto_18042 ?auto_18053 ) ) ( not ( = ?auto_18043 ?auto_18047 ) ) ( not ( = ?auto_18043 ?auto_18053 ) ) ( not ( = ?auto_18044 ?auto_18047 ) ) ( not ( = ?auto_18044 ?auto_18053 ) ) ( not ( = ?auto_18045 ?auto_18047 ) ) ( not ( = ?auto_18045 ?auto_18053 ) ) ( not ( = ?auto_18047 ?auto_18064 ) ) ( not ( = ?auto_18047 ?auto_18061 ) ) ( not ( = ?auto_18047 ?auto_18054 ) ) ( not ( = ?auto_18047 ?auto_18060 ) ) ( not ( = ?auto_18049 ?auto_18062 ) ) ( not ( = ?auto_18049 ?auto_18056 ) ) ( not ( = ?auto_18049 ?auto_18059 ) ) ( not ( = ?auto_18049 ?auto_18057 ) ) ( not ( = ?auto_18051 ?auto_18063 ) ) ( not ( = ?auto_18051 ?auto_18058 ) ) ( not ( = ?auto_18051 ?auto_18065 ) ) ( not ( = ?auto_18051 ?auto_18055 ) ) ( not ( = ?auto_18053 ?auto_18064 ) ) ( not ( = ?auto_18053 ?auto_18061 ) ) ( not ( = ?auto_18053 ?auto_18054 ) ) ( not ( = ?auto_18053 ?auto_18060 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_18042 ?auto_18043 ?auto_18044 ?auto_18045 ?auto_18046 )
      ( MAKE-1CRATE ?auto_18046 ?auto_18047 )
      ( MAKE-5CRATE-VERIFY ?auto_18042 ?auto_18043 ?auto_18044 ?auto_18045 ?auto_18046 ?auto_18047 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18068 - SURFACE
      ?auto_18069 - SURFACE
    )
    :vars
    (
      ?auto_18070 - HOIST
      ?auto_18071 - PLACE
      ?auto_18073 - PLACE
      ?auto_18074 - HOIST
      ?auto_18075 - SURFACE
      ?auto_18072 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18070 ?auto_18071 ) ( SURFACE-AT ?auto_18068 ?auto_18071 ) ( CLEAR ?auto_18068 ) ( IS-CRATE ?auto_18069 ) ( AVAILABLE ?auto_18070 ) ( not ( = ?auto_18073 ?auto_18071 ) ) ( HOIST-AT ?auto_18074 ?auto_18073 ) ( AVAILABLE ?auto_18074 ) ( SURFACE-AT ?auto_18069 ?auto_18073 ) ( ON ?auto_18069 ?auto_18075 ) ( CLEAR ?auto_18069 ) ( TRUCK-AT ?auto_18072 ?auto_18071 ) ( not ( = ?auto_18068 ?auto_18069 ) ) ( not ( = ?auto_18068 ?auto_18075 ) ) ( not ( = ?auto_18069 ?auto_18075 ) ) ( not ( = ?auto_18070 ?auto_18074 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18072 ?auto_18071 ?auto_18073 )
      ( !LIFT ?auto_18074 ?auto_18069 ?auto_18075 ?auto_18073 )
      ( !LOAD ?auto_18074 ?auto_18069 ?auto_18072 ?auto_18073 )
      ( !DRIVE ?auto_18072 ?auto_18073 ?auto_18071 )
      ( !UNLOAD ?auto_18070 ?auto_18069 ?auto_18072 ?auto_18071 )
      ( !DROP ?auto_18070 ?auto_18069 ?auto_18068 ?auto_18071 )
      ( MAKE-1CRATE-VERIFY ?auto_18068 ?auto_18069 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_18083 - SURFACE
      ?auto_18084 - SURFACE
      ?auto_18085 - SURFACE
      ?auto_18086 - SURFACE
      ?auto_18087 - SURFACE
      ?auto_18088 - SURFACE
      ?auto_18089 - SURFACE
    )
    :vars
    (
      ?auto_18093 - HOIST
      ?auto_18092 - PLACE
      ?auto_18094 - PLACE
      ?auto_18090 - HOIST
      ?auto_18091 - SURFACE
      ?auto_18100 - PLACE
      ?auto_18101 - HOIST
      ?auto_18107 - SURFACE
      ?auto_18110 - PLACE
      ?auto_18097 - HOIST
      ?auto_18102 - SURFACE
      ?auto_18099 - PLACE
      ?auto_18106 - HOIST
      ?auto_18103 - SURFACE
      ?auto_18105 - PLACE
      ?auto_18098 - HOIST
      ?auto_18096 - SURFACE
      ?auto_18109 - PLACE
      ?auto_18108 - HOIST
      ?auto_18104 - SURFACE
      ?auto_18095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18093 ?auto_18092 ) ( IS-CRATE ?auto_18089 ) ( not ( = ?auto_18094 ?auto_18092 ) ) ( HOIST-AT ?auto_18090 ?auto_18094 ) ( AVAILABLE ?auto_18090 ) ( SURFACE-AT ?auto_18089 ?auto_18094 ) ( ON ?auto_18089 ?auto_18091 ) ( CLEAR ?auto_18089 ) ( not ( = ?auto_18088 ?auto_18089 ) ) ( not ( = ?auto_18088 ?auto_18091 ) ) ( not ( = ?auto_18089 ?auto_18091 ) ) ( not ( = ?auto_18093 ?auto_18090 ) ) ( IS-CRATE ?auto_18088 ) ( not ( = ?auto_18100 ?auto_18092 ) ) ( HOIST-AT ?auto_18101 ?auto_18100 ) ( AVAILABLE ?auto_18101 ) ( SURFACE-AT ?auto_18088 ?auto_18100 ) ( ON ?auto_18088 ?auto_18107 ) ( CLEAR ?auto_18088 ) ( not ( = ?auto_18087 ?auto_18088 ) ) ( not ( = ?auto_18087 ?auto_18107 ) ) ( not ( = ?auto_18088 ?auto_18107 ) ) ( not ( = ?auto_18093 ?auto_18101 ) ) ( IS-CRATE ?auto_18087 ) ( not ( = ?auto_18110 ?auto_18092 ) ) ( HOIST-AT ?auto_18097 ?auto_18110 ) ( AVAILABLE ?auto_18097 ) ( SURFACE-AT ?auto_18087 ?auto_18110 ) ( ON ?auto_18087 ?auto_18102 ) ( CLEAR ?auto_18087 ) ( not ( = ?auto_18086 ?auto_18087 ) ) ( not ( = ?auto_18086 ?auto_18102 ) ) ( not ( = ?auto_18087 ?auto_18102 ) ) ( not ( = ?auto_18093 ?auto_18097 ) ) ( IS-CRATE ?auto_18086 ) ( not ( = ?auto_18099 ?auto_18092 ) ) ( HOIST-AT ?auto_18106 ?auto_18099 ) ( AVAILABLE ?auto_18106 ) ( SURFACE-AT ?auto_18086 ?auto_18099 ) ( ON ?auto_18086 ?auto_18103 ) ( CLEAR ?auto_18086 ) ( not ( = ?auto_18085 ?auto_18086 ) ) ( not ( = ?auto_18085 ?auto_18103 ) ) ( not ( = ?auto_18086 ?auto_18103 ) ) ( not ( = ?auto_18093 ?auto_18106 ) ) ( IS-CRATE ?auto_18085 ) ( not ( = ?auto_18105 ?auto_18092 ) ) ( HOIST-AT ?auto_18098 ?auto_18105 ) ( AVAILABLE ?auto_18098 ) ( SURFACE-AT ?auto_18085 ?auto_18105 ) ( ON ?auto_18085 ?auto_18096 ) ( CLEAR ?auto_18085 ) ( not ( = ?auto_18084 ?auto_18085 ) ) ( not ( = ?auto_18084 ?auto_18096 ) ) ( not ( = ?auto_18085 ?auto_18096 ) ) ( not ( = ?auto_18093 ?auto_18098 ) ) ( SURFACE-AT ?auto_18083 ?auto_18092 ) ( CLEAR ?auto_18083 ) ( IS-CRATE ?auto_18084 ) ( AVAILABLE ?auto_18093 ) ( not ( = ?auto_18109 ?auto_18092 ) ) ( HOIST-AT ?auto_18108 ?auto_18109 ) ( AVAILABLE ?auto_18108 ) ( SURFACE-AT ?auto_18084 ?auto_18109 ) ( ON ?auto_18084 ?auto_18104 ) ( CLEAR ?auto_18084 ) ( TRUCK-AT ?auto_18095 ?auto_18092 ) ( not ( = ?auto_18083 ?auto_18084 ) ) ( not ( = ?auto_18083 ?auto_18104 ) ) ( not ( = ?auto_18084 ?auto_18104 ) ) ( not ( = ?auto_18093 ?auto_18108 ) ) ( not ( = ?auto_18083 ?auto_18085 ) ) ( not ( = ?auto_18083 ?auto_18096 ) ) ( not ( = ?auto_18085 ?auto_18104 ) ) ( not ( = ?auto_18105 ?auto_18109 ) ) ( not ( = ?auto_18098 ?auto_18108 ) ) ( not ( = ?auto_18096 ?auto_18104 ) ) ( not ( = ?auto_18083 ?auto_18086 ) ) ( not ( = ?auto_18083 ?auto_18103 ) ) ( not ( = ?auto_18084 ?auto_18086 ) ) ( not ( = ?auto_18084 ?auto_18103 ) ) ( not ( = ?auto_18086 ?auto_18096 ) ) ( not ( = ?auto_18086 ?auto_18104 ) ) ( not ( = ?auto_18099 ?auto_18105 ) ) ( not ( = ?auto_18099 ?auto_18109 ) ) ( not ( = ?auto_18106 ?auto_18098 ) ) ( not ( = ?auto_18106 ?auto_18108 ) ) ( not ( = ?auto_18103 ?auto_18096 ) ) ( not ( = ?auto_18103 ?auto_18104 ) ) ( not ( = ?auto_18083 ?auto_18087 ) ) ( not ( = ?auto_18083 ?auto_18102 ) ) ( not ( = ?auto_18084 ?auto_18087 ) ) ( not ( = ?auto_18084 ?auto_18102 ) ) ( not ( = ?auto_18085 ?auto_18087 ) ) ( not ( = ?auto_18085 ?auto_18102 ) ) ( not ( = ?auto_18087 ?auto_18103 ) ) ( not ( = ?auto_18087 ?auto_18096 ) ) ( not ( = ?auto_18087 ?auto_18104 ) ) ( not ( = ?auto_18110 ?auto_18099 ) ) ( not ( = ?auto_18110 ?auto_18105 ) ) ( not ( = ?auto_18110 ?auto_18109 ) ) ( not ( = ?auto_18097 ?auto_18106 ) ) ( not ( = ?auto_18097 ?auto_18098 ) ) ( not ( = ?auto_18097 ?auto_18108 ) ) ( not ( = ?auto_18102 ?auto_18103 ) ) ( not ( = ?auto_18102 ?auto_18096 ) ) ( not ( = ?auto_18102 ?auto_18104 ) ) ( not ( = ?auto_18083 ?auto_18088 ) ) ( not ( = ?auto_18083 ?auto_18107 ) ) ( not ( = ?auto_18084 ?auto_18088 ) ) ( not ( = ?auto_18084 ?auto_18107 ) ) ( not ( = ?auto_18085 ?auto_18088 ) ) ( not ( = ?auto_18085 ?auto_18107 ) ) ( not ( = ?auto_18086 ?auto_18088 ) ) ( not ( = ?auto_18086 ?auto_18107 ) ) ( not ( = ?auto_18088 ?auto_18102 ) ) ( not ( = ?auto_18088 ?auto_18103 ) ) ( not ( = ?auto_18088 ?auto_18096 ) ) ( not ( = ?auto_18088 ?auto_18104 ) ) ( not ( = ?auto_18100 ?auto_18110 ) ) ( not ( = ?auto_18100 ?auto_18099 ) ) ( not ( = ?auto_18100 ?auto_18105 ) ) ( not ( = ?auto_18100 ?auto_18109 ) ) ( not ( = ?auto_18101 ?auto_18097 ) ) ( not ( = ?auto_18101 ?auto_18106 ) ) ( not ( = ?auto_18101 ?auto_18098 ) ) ( not ( = ?auto_18101 ?auto_18108 ) ) ( not ( = ?auto_18107 ?auto_18102 ) ) ( not ( = ?auto_18107 ?auto_18103 ) ) ( not ( = ?auto_18107 ?auto_18096 ) ) ( not ( = ?auto_18107 ?auto_18104 ) ) ( not ( = ?auto_18083 ?auto_18089 ) ) ( not ( = ?auto_18083 ?auto_18091 ) ) ( not ( = ?auto_18084 ?auto_18089 ) ) ( not ( = ?auto_18084 ?auto_18091 ) ) ( not ( = ?auto_18085 ?auto_18089 ) ) ( not ( = ?auto_18085 ?auto_18091 ) ) ( not ( = ?auto_18086 ?auto_18089 ) ) ( not ( = ?auto_18086 ?auto_18091 ) ) ( not ( = ?auto_18087 ?auto_18089 ) ) ( not ( = ?auto_18087 ?auto_18091 ) ) ( not ( = ?auto_18089 ?auto_18107 ) ) ( not ( = ?auto_18089 ?auto_18102 ) ) ( not ( = ?auto_18089 ?auto_18103 ) ) ( not ( = ?auto_18089 ?auto_18096 ) ) ( not ( = ?auto_18089 ?auto_18104 ) ) ( not ( = ?auto_18094 ?auto_18100 ) ) ( not ( = ?auto_18094 ?auto_18110 ) ) ( not ( = ?auto_18094 ?auto_18099 ) ) ( not ( = ?auto_18094 ?auto_18105 ) ) ( not ( = ?auto_18094 ?auto_18109 ) ) ( not ( = ?auto_18090 ?auto_18101 ) ) ( not ( = ?auto_18090 ?auto_18097 ) ) ( not ( = ?auto_18090 ?auto_18106 ) ) ( not ( = ?auto_18090 ?auto_18098 ) ) ( not ( = ?auto_18090 ?auto_18108 ) ) ( not ( = ?auto_18091 ?auto_18107 ) ) ( not ( = ?auto_18091 ?auto_18102 ) ) ( not ( = ?auto_18091 ?auto_18103 ) ) ( not ( = ?auto_18091 ?auto_18096 ) ) ( not ( = ?auto_18091 ?auto_18104 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_18083 ?auto_18084 ?auto_18085 ?auto_18086 ?auto_18087 ?auto_18088 )
      ( MAKE-1CRATE ?auto_18088 ?auto_18089 )
      ( MAKE-6CRATE-VERIFY ?auto_18083 ?auto_18084 ?auto_18085 ?auto_18086 ?auto_18087 ?auto_18088 ?auto_18089 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18113 - SURFACE
      ?auto_18114 - SURFACE
    )
    :vars
    (
      ?auto_18115 - HOIST
      ?auto_18116 - PLACE
      ?auto_18118 - PLACE
      ?auto_18119 - HOIST
      ?auto_18120 - SURFACE
      ?auto_18117 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18115 ?auto_18116 ) ( SURFACE-AT ?auto_18113 ?auto_18116 ) ( CLEAR ?auto_18113 ) ( IS-CRATE ?auto_18114 ) ( AVAILABLE ?auto_18115 ) ( not ( = ?auto_18118 ?auto_18116 ) ) ( HOIST-AT ?auto_18119 ?auto_18118 ) ( AVAILABLE ?auto_18119 ) ( SURFACE-AT ?auto_18114 ?auto_18118 ) ( ON ?auto_18114 ?auto_18120 ) ( CLEAR ?auto_18114 ) ( TRUCK-AT ?auto_18117 ?auto_18116 ) ( not ( = ?auto_18113 ?auto_18114 ) ) ( not ( = ?auto_18113 ?auto_18120 ) ) ( not ( = ?auto_18114 ?auto_18120 ) ) ( not ( = ?auto_18115 ?auto_18119 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18117 ?auto_18116 ?auto_18118 )
      ( !LIFT ?auto_18119 ?auto_18114 ?auto_18120 ?auto_18118 )
      ( !LOAD ?auto_18119 ?auto_18114 ?auto_18117 ?auto_18118 )
      ( !DRIVE ?auto_18117 ?auto_18118 ?auto_18116 )
      ( !UNLOAD ?auto_18115 ?auto_18114 ?auto_18117 ?auto_18116 )
      ( !DROP ?auto_18115 ?auto_18114 ?auto_18113 ?auto_18116 )
      ( MAKE-1CRATE-VERIFY ?auto_18113 ?auto_18114 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_18129 - SURFACE
      ?auto_18130 - SURFACE
      ?auto_18131 - SURFACE
      ?auto_18132 - SURFACE
      ?auto_18133 - SURFACE
      ?auto_18134 - SURFACE
      ?auto_18135 - SURFACE
      ?auto_18136 - SURFACE
    )
    :vars
    (
      ?auto_18138 - HOIST
      ?auto_18137 - PLACE
      ?auto_18139 - PLACE
      ?auto_18141 - HOIST
      ?auto_18142 - SURFACE
      ?auto_18158 - PLACE
      ?auto_18149 - HOIST
      ?auto_18148 - SURFACE
      ?auto_18157 - PLACE
      ?auto_18156 - HOIST
      ?auto_18151 - SURFACE
      ?auto_18155 - SURFACE
      ?auto_18143 - PLACE
      ?auto_18147 - HOIST
      ?auto_18154 - SURFACE
      ?auto_18150 - PLACE
      ?auto_18144 - HOIST
      ?auto_18145 - SURFACE
      ?auto_18153 - PLACE
      ?auto_18152 - HOIST
      ?auto_18146 - SURFACE
      ?auto_18140 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18138 ?auto_18137 ) ( IS-CRATE ?auto_18136 ) ( not ( = ?auto_18139 ?auto_18137 ) ) ( HOIST-AT ?auto_18141 ?auto_18139 ) ( SURFACE-AT ?auto_18136 ?auto_18139 ) ( ON ?auto_18136 ?auto_18142 ) ( CLEAR ?auto_18136 ) ( not ( = ?auto_18135 ?auto_18136 ) ) ( not ( = ?auto_18135 ?auto_18142 ) ) ( not ( = ?auto_18136 ?auto_18142 ) ) ( not ( = ?auto_18138 ?auto_18141 ) ) ( IS-CRATE ?auto_18135 ) ( not ( = ?auto_18158 ?auto_18137 ) ) ( HOIST-AT ?auto_18149 ?auto_18158 ) ( AVAILABLE ?auto_18149 ) ( SURFACE-AT ?auto_18135 ?auto_18158 ) ( ON ?auto_18135 ?auto_18148 ) ( CLEAR ?auto_18135 ) ( not ( = ?auto_18134 ?auto_18135 ) ) ( not ( = ?auto_18134 ?auto_18148 ) ) ( not ( = ?auto_18135 ?auto_18148 ) ) ( not ( = ?auto_18138 ?auto_18149 ) ) ( IS-CRATE ?auto_18134 ) ( not ( = ?auto_18157 ?auto_18137 ) ) ( HOIST-AT ?auto_18156 ?auto_18157 ) ( AVAILABLE ?auto_18156 ) ( SURFACE-AT ?auto_18134 ?auto_18157 ) ( ON ?auto_18134 ?auto_18151 ) ( CLEAR ?auto_18134 ) ( not ( = ?auto_18133 ?auto_18134 ) ) ( not ( = ?auto_18133 ?auto_18151 ) ) ( not ( = ?auto_18134 ?auto_18151 ) ) ( not ( = ?auto_18138 ?auto_18156 ) ) ( IS-CRATE ?auto_18133 ) ( AVAILABLE ?auto_18141 ) ( SURFACE-AT ?auto_18133 ?auto_18139 ) ( ON ?auto_18133 ?auto_18155 ) ( CLEAR ?auto_18133 ) ( not ( = ?auto_18132 ?auto_18133 ) ) ( not ( = ?auto_18132 ?auto_18155 ) ) ( not ( = ?auto_18133 ?auto_18155 ) ) ( IS-CRATE ?auto_18132 ) ( not ( = ?auto_18143 ?auto_18137 ) ) ( HOIST-AT ?auto_18147 ?auto_18143 ) ( AVAILABLE ?auto_18147 ) ( SURFACE-AT ?auto_18132 ?auto_18143 ) ( ON ?auto_18132 ?auto_18154 ) ( CLEAR ?auto_18132 ) ( not ( = ?auto_18131 ?auto_18132 ) ) ( not ( = ?auto_18131 ?auto_18154 ) ) ( not ( = ?auto_18132 ?auto_18154 ) ) ( not ( = ?auto_18138 ?auto_18147 ) ) ( IS-CRATE ?auto_18131 ) ( not ( = ?auto_18150 ?auto_18137 ) ) ( HOIST-AT ?auto_18144 ?auto_18150 ) ( AVAILABLE ?auto_18144 ) ( SURFACE-AT ?auto_18131 ?auto_18150 ) ( ON ?auto_18131 ?auto_18145 ) ( CLEAR ?auto_18131 ) ( not ( = ?auto_18130 ?auto_18131 ) ) ( not ( = ?auto_18130 ?auto_18145 ) ) ( not ( = ?auto_18131 ?auto_18145 ) ) ( not ( = ?auto_18138 ?auto_18144 ) ) ( SURFACE-AT ?auto_18129 ?auto_18137 ) ( CLEAR ?auto_18129 ) ( IS-CRATE ?auto_18130 ) ( AVAILABLE ?auto_18138 ) ( not ( = ?auto_18153 ?auto_18137 ) ) ( HOIST-AT ?auto_18152 ?auto_18153 ) ( AVAILABLE ?auto_18152 ) ( SURFACE-AT ?auto_18130 ?auto_18153 ) ( ON ?auto_18130 ?auto_18146 ) ( CLEAR ?auto_18130 ) ( TRUCK-AT ?auto_18140 ?auto_18137 ) ( not ( = ?auto_18129 ?auto_18130 ) ) ( not ( = ?auto_18129 ?auto_18146 ) ) ( not ( = ?auto_18130 ?auto_18146 ) ) ( not ( = ?auto_18138 ?auto_18152 ) ) ( not ( = ?auto_18129 ?auto_18131 ) ) ( not ( = ?auto_18129 ?auto_18145 ) ) ( not ( = ?auto_18131 ?auto_18146 ) ) ( not ( = ?auto_18150 ?auto_18153 ) ) ( not ( = ?auto_18144 ?auto_18152 ) ) ( not ( = ?auto_18145 ?auto_18146 ) ) ( not ( = ?auto_18129 ?auto_18132 ) ) ( not ( = ?auto_18129 ?auto_18154 ) ) ( not ( = ?auto_18130 ?auto_18132 ) ) ( not ( = ?auto_18130 ?auto_18154 ) ) ( not ( = ?auto_18132 ?auto_18145 ) ) ( not ( = ?auto_18132 ?auto_18146 ) ) ( not ( = ?auto_18143 ?auto_18150 ) ) ( not ( = ?auto_18143 ?auto_18153 ) ) ( not ( = ?auto_18147 ?auto_18144 ) ) ( not ( = ?auto_18147 ?auto_18152 ) ) ( not ( = ?auto_18154 ?auto_18145 ) ) ( not ( = ?auto_18154 ?auto_18146 ) ) ( not ( = ?auto_18129 ?auto_18133 ) ) ( not ( = ?auto_18129 ?auto_18155 ) ) ( not ( = ?auto_18130 ?auto_18133 ) ) ( not ( = ?auto_18130 ?auto_18155 ) ) ( not ( = ?auto_18131 ?auto_18133 ) ) ( not ( = ?auto_18131 ?auto_18155 ) ) ( not ( = ?auto_18133 ?auto_18154 ) ) ( not ( = ?auto_18133 ?auto_18145 ) ) ( not ( = ?auto_18133 ?auto_18146 ) ) ( not ( = ?auto_18139 ?auto_18143 ) ) ( not ( = ?auto_18139 ?auto_18150 ) ) ( not ( = ?auto_18139 ?auto_18153 ) ) ( not ( = ?auto_18141 ?auto_18147 ) ) ( not ( = ?auto_18141 ?auto_18144 ) ) ( not ( = ?auto_18141 ?auto_18152 ) ) ( not ( = ?auto_18155 ?auto_18154 ) ) ( not ( = ?auto_18155 ?auto_18145 ) ) ( not ( = ?auto_18155 ?auto_18146 ) ) ( not ( = ?auto_18129 ?auto_18134 ) ) ( not ( = ?auto_18129 ?auto_18151 ) ) ( not ( = ?auto_18130 ?auto_18134 ) ) ( not ( = ?auto_18130 ?auto_18151 ) ) ( not ( = ?auto_18131 ?auto_18134 ) ) ( not ( = ?auto_18131 ?auto_18151 ) ) ( not ( = ?auto_18132 ?auto_18134 ) ) ( not ( = ?auto_18132 ?auto_18151 ) ) ( not ( = ?auto_18134 ?auto_18155 ) ) ( not ( = ?auto_18134 ?auto_18154 ) ) ( not ( = ?auto_18134 ?auto_18145 ) ) ( not ( = ?auto_18134 ?auto_18146 ) ) ( not ( = ?auto_18157 ?auto_18139 ) ) ( not ( = ?auto_18157 ?auto_18143 ) ) ( not ( = ?auto_18157 ?auto_18150 ) ) ( not ( = ?auto_18157 ?auto_18153 ) ) ( not ( = ?auto_18156 ?auto_18141 ) ) ( not ( = ?auto_18156 ?auto_18147 ) ) ( not ( = ?auto_18156 ?auto_18144 ) ) ( not ( = ?auto_18156 ?auto_18152 ) ) ( not ( = ?auto_18151 ?auto_18155 ) ) ( not ( = ?auto_18151 ?auto_18154 ) ) ( not ( = ?auto_18151 ?auto_18145 ) ) ( not ( = ?auto_18151 ?auto_18146 ) ) ( not ( = ?auto_18129 ?auto_18135 ) ) ( not ( = ?auto_18129 ?auto_18148 ) ) ( not ( = ?auto_18130 ?auto_18135 ) ) ( not ( = ?auto_18130 ?auto_18148 ) ) ( not ( = ?auto_18131 ?auto_18135 ) ) ( not ( = ?auto_18131 ?auto_18148 ) ) ( not ( = ?auto_18132 ?auto_18135 ) ) ( not ( = ?auto_18132 ?auto_18148 ) ) ( not ( = ?auto_18133 ?auto_18135 ) ) ( not ( = ?auto_18133 ?auto_18148 ) ) ( not ( = ?auto_18135 ?auto_18151 ) ) ( not ( = ?auto_18135 ?auto_18155 ) ) ( not ( = ?auto_18135 ?auto_18154 ) ) ( not ( = ?auto_18135 ?auto_18145 ) ) ( not ( = ?auto_18135 ?auto_18146 ) ) ( not ( = ?auto_18158 ?auto_18157 ) ) ( not ( = ?auto_18158 ?auto_18139 ) ) ( not ( = ?auto_18158 ?auto_18143 ) ) ( not ( = ?auto_18158 ?auto_18150 ) ) ( not ( = ?auto_18158 ?auto_18153 ) ) ( not ( = ?auto_18149 ?auto_18156 ) ) ( not ( = ?auto_18149 ?auto_18141 ) ) ( not ( = ?auto_18149 ?auto_18147 ) ) ( not ( = ?auto_18149 ?auto_18144 ) ) ( not ( = ?auto_18149 ?auto_18152 ) ) ( not ( = ?auto_18148 ?auto_18151 ) ) ( not ( = ?auto_18148 ?auto_18155 ) ) ( not ( = ?auto_18148 ?auto_18154 ) ) ( not ( = ?auto_18148 ?auto_18145 ) ) ( not ( = ?auto_18148 ?auto_18146 ) ) ( not ( = ?auto_18129 ?auto_18136 ) ) ( not ( = ?auto_18129 ?auto_18142 ) ) ( not ( = ?auto_18130 ?auto_18136 ) ) ( not ( = ?auto_18130 ?auto_18142 ) ) ( not ( = ?auto_18131 ?auto_18136 ) ) ( not ( = ?auto_18131 ?auto_18142 ) ) ( not ( = ?auto_18132 ?auto_18136 ) ) ( not ( = ?auto_18132 ?auto_18142 ) ) ( not ( = ?auto_18133 ?auto_18136 ) ) ( not ( = ?auto_18133 ?auto_18142 ) ) ( not ( = ?auto_18134 ?auto_18136 ) ) ( not ( = ?auto_18134 ?auto_18142 ) ) ( not ( = ?auto_18136 ?auto_18148 ) ) ( not ( = ?auto_18136 ?auto_18151 ) ) ( not ( = ?auto_18136 ?auto_18155 ) ) ( not ( = ?auto_18136 ?auto_18154 ) ) ( not ( = ?auto_18136 ?auto_18145 ) ) ( not ( = ?auto_18136 ?auto_18146 ) ) ( not ( = ?auto_18142 ?auto_18148 ) ) ( not ( = ?auto_18142 ?auto_18151 ) ) ( not ( = ?auto_18142 ?auto_18155 ) ) ( not ( = ?auto_18142 ?auto_18154 ) ) ( not ( = ?auto_18142 ?auto_18145 ) ) ( not ( = ?auto_18142 ?auto_18146 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_18129 ?auto_18130 ?auto_18131 ?auto_18132 ?auto_18133 ?auto_18134 ?auto_18135 )
      ( MAKE-1CRATE ?auto_18135 ?auto_18136 )
      ( MAKE-7CRATE-VERIFY ?auto_18129 ?auto_18130 ?auto_18131 ?auto_18132 ?auto_18133 ?auto_18134 ?auto_18135 ?auto_18136 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18161 - SURFACE
      ?auto_18162 - SURFACE
    )
    :vars
    (
      ?auto_18163 - HOIST
      ?auto_18164 - PLACE
      ?auto_18166 - PLACE
      ?auto_18167 - HOIST
      ?auto_18168 - SURFACE
      ?auto_18165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18163 ?auto_18164 ) ( SURFACE-AT ?auto_18161 ?auto_18164 ) ( CLEAR ?auto_18161 ) ( IS-CRATE ?auto_18162 ) ( AVAILABLE ?auto_18163 ) ( not ( = ?auto_18166 ?auto_18164 ) ) ( HOIST-AT ?auto_18167 ?auto_18166 ) ( AVAILABLE ?auto_18167 ) ( SURFACE-AT ?auto_18162 ?auto_18166 ) ( ON ?auto_18162 ?auto_18168 ) ( CLEAR ?auto_18162 ) ( TRUCK-AT ?auto_18165 ?auto_18164 ) ( not ( = ?auto_18161 ?auto_18162 ) ) ( not ( = ?auto_18161 ?auto_18168 ) ) ( not ( = ?auto_18162 ?auto_18168 ) ) ( not ( = ?auto_18163 ?auto_18167 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18165 ?auto_18164 ?auto_18166 )
      ( !LIFT ?auto_18167 ?auto_18162 ?auto_18168 ?auto_18166 )
      ( !LOAD ?auto_18167 ?auto_18162 ?auto_18165 ?auto_18166 )
      ( !DRIVE ?auto_18165 ?auto_18166 ?auto_18164 )
      ( !UNLOAD ?auto_18163 ?auto_18162 ?auto_18165 ?auto_18164 )
      ( !DROP ?auto_18163 ?auto_18162 ?auto_18161 ?auto_18164 )
      ( MAKE-1CRATE-VERIFY ?auto_18161 ?auto_18162 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_18178 - SURFACE
      ?auto_18179 - SURFACE
      ?auto_18180 - SURFACE
      ?auto_18181 - SURFACE
      ?auto_18182 - SURFACE
      ?auto_18183 - SURFACE
      ?auto_18184 - SURFACE
      ?auto_18186 - SURFACE
      ?auto_18185 - SURFACE
    )
    :vars
    (
      ?auto_18189 - HOIST
      ?auto_18187 - PLACE
      ?auto_18191 - PLACE
      ?auto_18188 - HOIST
      ?auto_18190 - SURFACE
      ?auto_18210 - PLACE
      ?auto_18196 - HOIST
      ?auto_18197 - SURFACE
      ?auto_18202 - PLACE
      ?auto_18193 - HOIST
      ?auto_18194 - SURFACE
      ?auto_18200 - PLACE
      ?auto_18208 - HOIST
      ?auto_18203 - SURFACE
      ?auto_18207 - SURFACE
      ?auto_18201 - PLACE
      ?auto_18195 - HOIST
      ?auto_18206 - SURFACE
      ?auto_18209 - PLACE
      ?auto_18198 - HOIST
      ?auto_18199 - SURFACE
      ?auto_18204 - PLACE
      ?auto_18205 - HOIST
      ?auto_18211 - SURFACE
      ?auto_18192 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18189 ?auto_18187 ) ( IS-CRATE ?auto_18185 ) ( not ( = ?auto_18191 ?auto_18187 ) ) ( HOIST-AT ?auto_18188 ?auto_18191 ) ( AVAILABLE ?auto_18188 ) ( SURFACE-AT ?auto_18185 ?auto_18191 ) ( ON ?auto_18185 ?auto_18190 ) ( CLEAR ?auto_18185 ) ( not ( = ?auto_18186 ?auto_18185 ) ) ( not ( = ?auto_18186 ?auto_18190 ) ) ( not ( = ?auto_18185 ?auto_18190 ) ) ( not ( = ?auto_18189 ?auto_18188 ) ) ( IS-CRATE ?auto_18186 ) ( not ( = ?auto_18210 ?auto_18187 ) ) ( HOIST-AT ?auto_18196 ?auto_18210 ) ( SURFACE-AT ?auto_18186 ?auto_18210 ) ( ON ?auto_18186 ?auto_18197 ) ( CLEAR ?auto_18186 ) ( not ( = ?auto_18184 ?auto_18186 ) ) ( not ( = ?auto_18184 ?auto_18197 ) ) ( not ( = ?auto_18186 ?auto_18197 ) ) ( not ( = ?auto_18189 ?auto_18196 ) ) ( IS-CRATE ?auto_18184 ) ( not ( = ?auto_18202 ?auto_18187 ) ) ( HOIST-AT ?auto_18193 ?auto_18202 ) ( AVAILABLE ?auto_18193 ) ( SURFACE-AT ?auto_18184 ?auto_18202 ) ( ON ?auto_18184 ?auto_18194 ) ( CLEAR ?auto_18184 ) ( not ( = ?auto_18183 ?auto_18184 ) ) ( not ( = ?auto_18183 ?auto_18194 ) ) ( not ( = ?auto_18184 ?auto_18194 ) ) ( not ( = ?auto_18189 ?auto_18193 ) ) ( IS-CRATE ?auto_18183 ) ( not ( = ?auto_18200 ?auto_18187 ) ) ( HOIST-AT ?auto_18208 ?auto_18200 ) ( AVAILABLE ?auto_18208 ) ( SURFACE-AT ?auto_18183 ?auto_18200 ) ( ON ?auto_18183 ?auto_18203 ) ( CLEAR ?auto_18183 ) ( not ( = ?auto_18182 ?auto_18183 ) ) ( not ( = ?auto_18182 ?auto_18203 ) ) ( not ( = ?auto_18183 ?auto_18203 ) ) ( not ( = ?auto_18189 ?auto_18208 ) ) ( IS-CRATE ?auto_18182 ) ( AVAILABLE ?auto_18196 ) ( SURFACE-AT ?auto_18182 ?auto_18210 ) ( ON ?auto_18182 ?auto_18207 ) ( CLEAR ?auto_18182 ) ( not ( = ?auto_18181 ?auto_18182 ) ) ( not ( = ?auto_18181 ?auto_18207 ) ) ( not ( = ?auto_18182 ?auto_18207 ) ) ( IS-CRATE ?auto_18181 ) ( not ( = ?auto_18201 ?auto_18187 ) ) ( HOIST-AT ?auto_18195 ?auto_18201 ) ( AVAILABLE ?auto_18195 ) ( SURFACE-AT ?auto_18181 ?auto_18201 ) ( ON ?auto_18181 ?auto_18206 ) ( CLEAR ?auto_18181 ) ( not ( = ?auto_18180 ?auto_18181 ) ) ( not ( = ?auto_18180 ?auto_18206 ) ) ( not ( = ?auto_18181 ?auto_18206 ) ) ( not ( = ?auto_18189 ?auto_18195 ) ) ( IS-CRATE ?auto_18180 ) ( not ( = ?auto_18209 ?auto_18187 ) ) ( HOIST-AT ?auto_18198 ?auto_18209 ) ( AVAILABLE ?auto_18198 ) ( SURFACE-AT ?auto_18180 ?auto_18209 ) ( ON ?auto_18180 ?auto_18199 ) ( CLEAR ?auto_18180 ) ( not ( = ?auto_18179 ?auto_18180 ) ) ( not ( = ?auto_18179 ?auto_18199 ) ) ( not ( = ?auto_18180 ?auto_18199 ) ) ( not ( = ?auto_18189 ?auto_18198 ) ) ( SURFACE-AT ?auto_18178 ?auto_18187 ) ( CLEAR ?auto_18178 ) ( IS-CRATE ?auto_18179 ) ( AVAILABLE ?auto_18189 ) ( not ( = ?auto_18204 ?auto_18187 ) ) ( HOIST-AT ?auto_18205 ?auto_18204 ) ( AVAILABLE ?auto_18205 ) ( SURFACE-AT ?auto_18179 ?auto_18204 ) ( ON ?auto_18179 ?auto_18211 ) ( CLEAR ?auto_18179 ) ( TRUCK-AT ?auto_18192 ?auto_18187 ) ( not ( = ?auto_18178 ?auto_18179 ) ) ( not ( = ?auto_18178 ?auto_18211 ) ) ( not ( = ?auto_18179 ?auto_18211 ) ) ( not ( = ?auto_18189 ?auto_18205 ) ) ( not ( = ?auto_18178 ?auto_18180 ) ) ( not ( = ?auto_18178 ?auto_18199 ) ) ( not ( = ?auto_18180 ?auto_18211 ) ) ( not ( = ?auto_18209 ?auto_18204 ) ) ( not ( = ?auto_18198 ?auto_18205 ) ) ( not ( = ?auto_18199 ?auto_18211 ) ) ( not ( = ?auto_18178 ?auto_18181 ) ) ( not ( = ?auto_18178 ?auto_18206 ) ) ( not ( = ?auto_18179 ?auto_18181 ) ) ( not ( = ?auto_18179 ?auto_18206 ) ) ( not ( = ?auto_18181 ?auto_18199 ) ) ( not ( = ?auto_18181 ?auto_18211 ) ) ( not ( = ?auto_18201 ?auto_18209 ) ) ( not ( = ?auto_18201 ?auto_18204 ) ) ( not ( = ?auto_18195 ?auto_18198 ) ) ( not ( = ?auto_18195 ?auto_18205 ) ) ( not ( = ?auto_18206 ?auto_18199 ) ) ( not ( = ?auto_18206 ?auto_18211 ) ) ( not ( = ?auto_18178 ?auto_18182 ) ) ( not ( = ?auto_18178 ?auto_18207 ) ) ( not ( = ?auto_18179 ?auto_18182 ) ) ( not ( = ?auto_18179 ?auto_18207 ) ) ( not ( = ?auto_18180 ?auto_18182 ) ) ( not ( = ?auto_18180 ?auto_18207 ) ) ( not ( = ?auto_18182 ?auto_18206 ) ) ( not ( = ?auto_18182 ?auto_18199 ) ) ( not ( = ?auto_18182 ?auto_18211 ) ) ( not ( = ?auto_18210 ?auto_18201 ) ) ( not ( = ?auto_18210 ?auto_18209 ) ) ( not ( = ?auto_18210 ?auto_18204 ) ) ( not ( = ?auto_18196 ?auto_18195 ) ) ( not ( = ?auto_18196 ?auto_18198 ) ) ( not ( = ?auto_18196 ?auto_18205 ) ) ( not ( = ?auto_18207 ?auto_18206 ) ) ( not ( = ?auto_18207 ?auto_18199 ) ) ( not ( = ?auto_18207 ?auto_18211 ) ) ( not ( = ?auto_18178 ?auto_18183 ) ) ( not ( = ?auto_18178 ?auto_18203 ) ) ( not ( = ?auto_18179 ?auto_18183 ) ) ( not ( = ?auto_18179 ?auto_18203 ) ) ( not ( = ?auto_18180 ?auto_18183 ) ) ( not ( = ?auto_18180 ?auto_18203 ) ) ( not ( = ?auto_18181 ?auto_18183 ) ) ( not ( = ?auto_18181 ?auto_18203 ) ) ( not ( = ?auto_18183 ?auto_18207 ) ) ( not ( = ?auto_18183 ?auto_18206 ) ) ( not ( = ?auto_18183 ?auto_18199 ) ) ( not ( = ?auto_18183 ?auto_18211 ) ) ( not ( = ?auto_18200 ?auto_18210 ) ) ( not ( = ?auto_18200 ?auto_18201 ) ) ( not ( = ?auto_18200 ?auto_18209 ) ) ( not ( = ?auto_18200 ?auto_18204 ) ) ( not ( = ?auto_18208 ?auto_18196 ) ) ( not ( = ?auto_18208 ?auto_18195 ) ) ( not ( = ?auto_18208 ?auto_18198 ) ) ( not ( = ?auto_18208 ?auto_18205 ) ) ( not ( = ?auto_18203 ?auto_18207 ) ) ( not ( = ?auto_18203 ?auto_18206 ) ) ( not ( = ?auto_18203 ?auto_18199 ) ) ( not ( = ?auto_18203 ?auto_18211 ) ) ( not ( = ?auto_18178 ?auto_18184 ) ) ( not ( = ?auto_18178 ?auto_18194 ) ) ( not ( = ?auto_18179 ?auto_18184 ) ) ( not ( = ?auto_18179 ?auto_18194 ) ) ( not ( = ?auto_18180 ?auto_18184 ) ) ( not ( = ?auto_18180 ?auto_18194 ) ) ( not ( = ?auto_18181 ?auto_18184 ) ) ( not ( = ?auto_18181 ?auto_18194 ) ) ( not ( = ?auto_18182 ?auto_18184 ) ) ( not ( = ?auto_18182 ?auto_18194 ) ) ( not ( = ?auto_18184 ?auto_18203 ) ) ( not ( = ?auto_18184 ?auto_18207 ) ) ( not ( = ?auto_18184 ?auto_18206 ) ) ( not ( = ?auto_18184 ?auto_18199 ) ) ( not ( = ?auto_18184 ?auto_18211 ) ) ( not ( = ?auto_18202 ?auto_18200 ) ) ( not ( = ?auto_18202 ?auto_18210 ) ) ( not ( = ?auto_18202 ?auto_18201 ) ) ( not ( = ?auto_18202 ?auto_18209 ) ) ( not ( = ?auto_18202 ?auto_18204 ) ) ( not ( = ?auto_18193 ?auto_18208 ) ) ( not ( = ?auto_18193 ?auto_18196 ) ) ( not ( = ?auto_18193 ?auto_18195 ) ) ( not ( = ?auto_18193 ?auto_18198 ) ) ( not ( = ?auto_18193 ?auto_18205 ) ) ( not ( = ?auto_18194 ?auto_18203 ) ) ( not ( = ?auto_18194 ?auto_18207 ) ) ( not ( = ?auto_18194 ?auto_18206 ) ) ( not ( = ?auto_18194 ?auto_18199 ) ) ( not ( = ?auto_18194 ?auto_18211 ) ) ( not ( = ?auto_18178 ?auto_18186 ) ) ( not ( = ?auto_18178 ?auto_18197 ) ) ( not ( = ?auto_18179 ?auto_18186 ) ) ( not ( = ?auto_18179 ?auto_18197 ) ) ( not ( = ?auto_18180 ?auto_18186 ) ) ( not ( = ?auto_18180 ?auto_18197 ) ) ( not ( = ?auto_18181 ?auto_18186 ) ) ( not ( = ?auto_18181 ?auto_18197 ) ) ( not ( = ?auto_18182 ?auto_18186 ) ) ( not ( = ?auto_18182 ?auto_18197 ) ) ( not ( = ?auto_18183 ?auto_18186 ) ) ( not ( = ?auto_18183 ?auto_18197 ) ) ( not ( = ?auto_18186 ?auto_18194 ) ) ( not ( = ?auto_18186 ?auto_18203 ) ) ( not ( = ?auto_18186 ?auto_18207 ) ) ( not ( = ?auto_18186 ?auto_18206 ) ) ( not ( = ?auto_18186 ?auto_18199 ) ) ( not ( = ?auto_18186 ?auto_18211 ) ) ( not ( = ?auto_18197 ?auto_18194 ) ) ( not ( = ?auto_18197 ?auto_18203 ) ) ( not ( = ?auto_18197 ?auto_18207 ) ) ( not ( = ?auto_18197 ?auto_18206 ) ) ( not ( = ?auto_18197 ?auto_18199 ) ) ( not ( = ?auto_18197 ?auto_18211 ) ) ( not ( = ?auto_18178 ?auto_18185 ) ) ( not ( = ?auto_18178 ?auto_18190 ) ) ( not ( = ?auto_18179 ?auto_18185 ) ) ( not ( = ?auto_18179 ?auto_18190 ) ) ( not ( = ?auto_18180 ?auto_18185 ) ) ( not ( = ?auto_18180 ?auto_18190 ) ) ( not ( = ?auto_18181 ?auto_18185 ) ) ( not ( = ?auto_18181 ?auto_18190 ) ) ( not ( = ?auto_18182 ?auto_18185 ) ) ( not ( = ?auto_18182 ?auto_18190 ) ) ( not ( = ?auto_18183 ?auto_18185 ) ) ( not ( = ?auto_18183 ?auto_18190 ) ) ( not ( = ?auto_18184 ?auto_18185 ) ) ( not ( = ?auto_18184 ?auto_18190 ) ) ( not ( = ?auto_18185 ?auto_18197 ) ) ( not ( = ?auto_18185 ?auto_18194 ) ) ( not ( = ?auto_18185 ?auto_18203 ) ) ( not ( = ?auto_18185 ?auto_18207 ) ) ( not ( = ?auto_18185 ?auto_18206 ) ) ( not ( = ?auto_18185 ?auto_18199 ) ) ( not ( = ?auto_18185 ?auto_18211 ) ) ( not ( = ?auto_18191 ?auto_18210 ) ) ( not ( = ?auto_18191 ?auto_18202 ) ) ( not ( = ?auto_18191 ?auto_18200 ) ) ( not ( = ?auto_18191 ?auto_18201 ) ) ( not ( = ?auto_18191 ?auto_18209 ) ) ( not ( = ?auto_18191 ?auto_18204 ) ) ( not ( = ?auto_18188 ?auto_18196 ) ) ( not ( = ?auto_18188 ?auto_18193 ) ) ( not ( = ?auto_18188 ?auto_18208 ) ) ( not ( = ?auto_18188 ?auto_18195 ) ) ( not ( = ?auto_18188 ?auto_18198 ) ) ( not ( = ?auto_18188 ?auto_18205 ) ) ( not ( = ?auto_18190 ?auto_18197 ) ) ( not ( = ?auto_18190 ?auto_18194 ) ) ( not ( = ?auto_18190 ?auto_18203 ) ) ( not ( = ?auto_18190 ?auto_18207 ) ) ( not ( = ?auto_18190 ?auto_18206 ) ) ( not ( = ?auto_18190 ?auto_18199 ) ) ( not ( = ?auto_18190 ?auto_18211 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_18178 ?auto_18179 ?auto_18180 ?auto_18181 ?auto_18182 ?auto_18183 ?auto_18184 ?auto_18186 )
      ( MAKE-1CRATE ?auto_18186 ?auto_18185 )
      ( MAKE-8CRATE-VERIFY ?auto_18178 ?auto_18179 ?auto_18180 ?auto_18181 ?auto_18182 ?auto_18183 ?auto_18184 ?auto_18186 ?auto_18185 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18214 - SURFACE
      ?auto_18215 - SURFACE
    )
    :vars
    (
      ?auto_18216 - HOIST
      ?auto_18217 - PLACE
      ?auto_18219 - PLACE
      ?auto_18220 - HOIST
      ?auto_18221 - SURFACE
      ?auto_18218 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18216 ?auto_18217 ) ( SURFACE-AT ?auto_18214 ?auto_18217 ) ( CLEAR ?auto_18214 ) ( IS-CRATE ?auto_18215 ) ( AVAILABLE ?auto_18216 ) ( not ( = ?auto_18219 ?auto_18217 ) ) ( HOIST-AT ?auto_18220 ?auto_18219 ) ( AVAILABLE ?auto_18220 ) ( SURFACE-AT ?auto_18215 ?auto_18219 ) ( ON ?auto_18215 ?auto_18221 ) ( CLEAR ?auto_18215 ) ( TRUCK-AT ?auto_18218 ?auto_18217 ) ( not ( = ?auto_18214 ?auto_18215 ) ) ( not ( = ?auto_18214 ?auto_18221 ) ) ( not ( = ?auto_18215 ?auto_18221 ) ) ( not ( = ?auto_18216 ?auto_18220 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18218 ?auto_18217 ?auto_18219 )
      ( !LIFT ?auto_18220 ?auto_18215 ?auto_18221 ?auto_18219 )
      ( !LOAD ?auto_18220 ?auto_18215 ?auto_18218 ?auto_18219 )
      ( !DRIVE ?auto_18218 ?auto_18219 ?auto_18217 )
      ( !UNLOAD ?auto_18216 ?auto_18215 ?auto_18218 ?auto_18217 )
      ( !DROP ?auto_18216 ?auto_18215 ?auto_18214 ?auto_18217 )
      ( MAKE-1CRATE-VERIFY ?auto_18214 ?auto_18215 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_18232 - SURFACE
      ?auto_18233 - SURFACE
      ?auto_18234 - SURFACE
      ?auto_18235 - SURFACE
      ?auto_18236 - SURFACE
      ?auto_18237 - SURFACE
      ?auto_18238 - SURFACE
      ?auto_18241 - SURFACE
      ?auto_18240 - SURFACE
      ?auto_18239 - SURFACE
    )
    :vars
    (
      ?auto_18242 - HOIST
      ?auto_18244 - PLACE
      ?auto_18247 - PLACE
      ?auto_18245 - HOIST
      ?auto_18243 - SURFACE
      ?auto_18248 - PLACE
      ?auto_18269 - HOIST
      ?auto_18250 - SURFACE
      ?auto_18254 - PLACE
      ?auto_18249 - HOIST
      ?auto_18268 - SURFACE
      ?auto_18261 - PLACE
      ?auto_18255 - HOIST
      ?auto_18251 - SURFACE
      ?auto_18265 - PLACE
      ?auto_18258 - HOIST
      ?auto_18260 - SURFACE
      ?auto_18253 - SURFACE
      ?auto_18259 - PLACE
      ?auto_18252 - HOIST
      ?auto_18264 - SURFACE
      ?auto_18256 - PLACE
      ?auto_18267 - HOIST
      ?auto_18266 - SURFACE
      ?auto_18262 - PLACE
      ?auto_18263 - HOIST
      ?auto_18257 - SURFACE
      ?auto_18246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18242 ?auto_18244 ) ( IS-CRATE ?auto_18239 ) ( not ( = ?auto_18247 ?auto_18244 ) ) ( HOIST-AT ?auto_18245 ?auto_18247 ) ( AVAILABLE ?auto_18245 ) ( SURFACE-AT ?auto_18239 ?auto_18247 ) ( ON ?auto_18239 ?auto_18243 ) ( CLEAR ?auto_18239 ) ( not ( = ?auto_18240 ?auto_18239 ) ) ( not ( = ?auto_18240 ?auto_18243 ) ) ( not ( = ?auto_18239 ?auto_18243 ) ) ( not ( = ?auto_18242 ?auto_18245 ) ) ( IS-CRATE ?auto_18240 ) ( not ( = ?auto_18248 ?auto_18244 ) ) ( HOIST-AT ?auto_18269 ?auto_18248 ) ( AVAILABLE ?auto_18269 ) ( SURFACE-AT ?auto_18240 ?auto_18248 ) ( ON ?auto_18240 ?auto_18250 ) ( CLEAR ?auto_18240 ) ( not ( = ?auto_18241 ?auto_18240 ) ) ( not ( = ?auto_18241 ?auto_18250 ) ) ( not ( = ?auto_18240 ?auto_18250 ) ) ( not ( = ?auto_18242 ?auto_18269 ) ) ( IS-CRATE ?auto_18241 ) ( not ( = ?auto_18254 ?auto_18244 ) ) ( HOIST-AT ?auto_18249 ?auto_18254 ) ( SURFACE-AT ?auto_18241 ?auto_18254 ) ( ON ?auto_18241 ?auto_18268 ) ( CLEAR ?auto_18241 ) ( not ( = ?auto_18238 ?auto_18241 ) ) ( not ( = ?auto_18238 ?auto_18268 ) ) ( not ( = ?auto_18241 ?auto_18268 ) ) ( not ( = ?auto_18242 ?auto_18249 ) ) ( IS-CRATE ?auto_18238 ) ( not ( = ?auto_18261 ?auto_18244 ) ) ( HOIST-AT ?auto_18255 ?auto_18261 ) ( AVAILABLE ?auto_18255 ) ( SURFACE-AT ?auto_18238 ?auto_18261 ) ( ON ?auto_18238 ?auto_18251 ) ( CLEAR ?auto_18238 ) ( not ( = ?auto_18237 ?auto_18238 ) ) ( not ( = ?auto_18237 ?auto_18251 ) ) ( not ( = ?auto_18238 ?auto_18251 ) ) ( not ( = ?auto_18242 ?auto_18255 ) ) ( IS-CRATE ?auto_18237 ) ( not ( = ?auto_18265 ?auto_18244 ) ) ( HOIST-AT ?auto_18258 ?auto_18265 ) ( AVAILABLE ?auto_18258 ) ( SURFACE-AT ?auto_18237 ?auto_18265 ) ( ON ?auto_18237 ?auto_18260 ) ( CLEAR ?auto_18237 ) ( not ( = ?auto_18236 ?auto_18237 ) ) ( not ( = ?auto_18236 ?auto_18260 ) ) ( not ( = ?auto_18237 ?auto_18260 ) ) ( not ( = ?auto_18242 ?auto_18258 ) ) ( IS-CRATE ?auto_18236 ) ( AVAILABLE ?auto_18249 ) ( SURFACE-AT ?auto_18236 ?auto_18254 ) ( ON ?auto_18236 ?auto_18253 ) ( CLEAR ?auto_18236 ) ( not ( = ?auto_18235 ?auto_18236 ) ) ( not ( = ?auto_18235 ?auto_18253 ) ) ( not ( = ?auto_18236 ?auto_18253 ) ) ( IS-CRATE ?auto_18235 ) ( not ( = ?auto_18259 ?auto_18244 ) ) ( HOIST-AT ?auto_18252 ?auto_18259 ) ( AVAILABLE ?auto_18252 ) ( SURFACE-AT ?auto_18235 ?auto_18259 ) ( ON ?auto_18235 ?auto_18264 ) ( CLEAR ?auto_18235 ) ( not ( = ?auto_18234 ?auto_18235 ) ) ( not ( = ?auto_18234 ?auto_18264 ) ) ( not ( = ?auto_18235 ?auto_18264 ) ) ( not ( = ?auto_18242 ?auto_18252 ) ) ( IS-CRATE ?auto_18234 ) ( not ( = ?auto_18256 ?auto_18244 ) ) ( HOIST-AT ?auto_18267 ?auto_18256 ) ( AVAILABLE ?auto_18267 ) ( SURFACE-AT ?auto_18234 ?auto_18256 ) ( ON ?auto_18234 ?auto_18266 ) ( CLEAR ?auto_18234 ) ( not ( = ?auto_18233 ?auto_18234 ) ) ( not ( = ?auto_18233 ?auto_18266 ) ) ( not ( = ?auto_18234 ?auto_18266 ) ) ( not ( = ?auto_18242 ?auto_18267 ) ) ( SURFACE-AT ?auto_18232 ?auto_18244 ) ( CLEAR ?auto_18232 ) ( IS-CRATE ?auto_18233 ) ( AVAILABLE ?auto_18242 ) ( not ( = ?auto_18262 ?auto_18244 ) ) ( HOIST-AT ?auto_18263 ?auto_18262 ) ( AVAILABLE ?auto_18263 ) ( SURFACE-AT ?auto_18233 ?auto_18262 ) ( ON ?auto_18233 ?auto_18257 ) ( CLEAR ?auto_18233 ) ( TRUCK-AT ?auto_18246 ?auto_18244 ) ( not ( = ?auto_18232 ?auto_18233 ) ) ( not ( = ?auto_18232 ?auto_18257 ) ) ( not ( = ?auto_18233 ?auto_18257 ) ) ( not ( = ?auto_18242 ?auto_18263 ) ) ( not ( = ?auto_18232 ?auto_18234 ) ) ( not ( = ?auto_18232 ?auto_18266 ) ) ( not ( = ?auto_18234 ?auto_18257 ) ) ( not ( = ?auto_18256 ?auto_18262 ) ) ( not ( = ?auto_18267 ?auto_18263 ) ) ( not ( = ?auto_18266 ?auto_18257 ) ) ( not ( = ?auto_18232 ?auto_18235 ) ) ( not ( = ?auto_18232 ?auto_18264 ) ) ( not ( = ?auto_18233 ?auto_18235 ) ) ( not ( = ?auto_18233 ?auto_18264 ) ) ( not ( = ?auto_18235 ?auto_18266 ) ) ( not ( = ?auto_18235 ?auto_18257 ) ) ( not ( = ?auto_18259 ?auto_18256 ) ) ( not ( = ?auto_18259 ?auto_18262 ) ) ( not ( = ?auto_18252 ?auto_18267 ) ) ( not ( = ?auto_18252 ?auto_18263 ) ) ( not ( = ?auto_18264 ?auto_18266 ) ) ( not ( = ?auto_18264 ?auto_18257 ) ) ( not ( = ?auto_18232 ?auto_18236 ) ) ( not ( = ?auto_18232 ?auto_18253 ) ) ( not ( = ?auto_18233 ?auto_18236 ) ) ( not ( = ?auto_18233 ?auto_18253 ) ) ( not ( = ?auto_18234 ?auto_18236 ) ) ( not ( = ?auto_18234 ?auto_18253 ) ) ( not ( = ?auto_18236 ?auto_18264 ) ) ( not ( = ?auto_18236 ?auto_18266 ) ) ( not ( = ?auto_18236 ?auto_18257 ) ) ( not ( = ?auto_18254 ?auto_18259 ) ) ( not ( = ?auto_18254 ?auto_18256 ) ) ( not ( = ?auto_18254 ?auto_18262 ) ) ( not ( = ?auto_18249 ?auto_18252 ) ) ( not ( = ?auto_18249 ?auto_18267 ) ) ( not ( = ?auto_18249 ?auto_18263 ) ) ( not ( = ?auto_18253 ?auto_18264 ) ) ( not ( = ?auto_18253 ?auto_18266 ) ) ( not ( = ?auto_18253 ?auto_18257 ) ) ( not ( = ?auto_18232 ?auto_18237 ) ) ( not ( = ?auto_18232 ?auto_18260 ) ) ( not ( = ?auto_18233 ?auto_18237 ) ) ( not ( = ?auto_18233 ?auto_18260 ) ) ( not ( = ?auto_18234 ?auto_18237 ) ) ( not ( = ?auto_18234 ?auto_18260 ) ) ( not ( = ?auto_18235 ?auto_18237 ) ) ( not ( = ?auto_18235 ?auto_18260 ) ) ( not ( = ?auto_18237 ?auto_18253 ) ) ( not ( = ?auto_18237 ?auto_18264 ) ) ( not ( = ?auto_18237 ?auto_18266 ) ) ( not ( = ?auto_18237 ?auto_18257 ) ) ( not ( = ?auto_18265 ?auto_18254 ) ) ( not ( = ?auto_18265 ?auto_18259 ) ) ( not ( = ?auto_18265 ?auto_18256 ) ) ( not ( = ?auto_18265 ?auto_18262 ) ) ( not ( = ?auto_18258 ?auto_18249 ) ) ( not ( = ?auto_18258 ?auto_18252 ) ) ( not ( = ?auto_18258 ?auto_18267 ) ) ( not ( = ?auto_18258 ?auto_18263 ) ) ( not ( = ?auto_18260 ?auto_18253 ) ) ( not ( = ?auto_18260 ?auto_18264 ) ) ( not ( = ?auto_18260 ?auto_18266 ) ) ( not ( = ?auto_18260 ?auto_18257 ) ) ( not ( = ?auto_18232 ?auto_18238 ) ) ( not ( = ?auto_18232 ?auto_18251 ) ) ( not ( = ?auto_18233 ?auto_18238 ) ) ( not ( = ?auto_18233 ?auto_18251 ) ) ( not ( = ?auto_18234 ?auto_18238 ) ) ( not ( = ?auto_18234 ?auto_18251 ) ) ( not ( = ?auto_18235 ?auto_18238 ) ) ( not ( = ?auto_18235 ?auto_18251 ) ) ( not ( = ?auto_18236 ?auto_18238 ) ) ( not ( = ?auto_18236 ?auto_18251 ) ) ( not ( = ?auto_18238 ?auto_18260 ) ) ( not ( = ?auto_18238 ?auto_18253 ) ) ( not ( = ?auto_18238 ?auto_18264 ) ) ( not ( = ?auto_18238 ?auto_18266 ) ) ( not ( = ?auto_18238 ?auto_18257 ) ) ( not ( = ?auto_18261 ?auto_18265 ) ) ( not ( = ?auto_18261 ?auto_18254 ) ) ( not ( = ?auto_18261 ?auto_18259 ) ) ( not ( = ?auto_18261 ?auto_18256 ) ) ( not ( = ?auto_18261 ?auto_18262 ) ) ( not ( = ?auto_18255 ?auto_18258 ) ) ( not ( = ?auto_18255 ?auto_18249 ) ) ( not ( = ?auto_18255 ?auto_18252 ) ) ( not ( = ?auto_18255 ?auto_18267 ) ) ( not ( = ?auto_18255 ?auto_18263 ) ) ( not ( = ?auto_18251 ?auto_18260 ) ) ( not ( = ?auto_18251 ?auto_18253 ) ) ( not ( = ?auto_18251 ?auto_18264 ) ) ( not ( = ?auto_18251 ?auto_18266 ) ) ( not ( = ?auto_18251 ?auto_18257 ) ) ( not ( = ?auto_18232 ?auto_18241 ) ) ( not ( = ?auto_18232 ?auto_18268 ) ) ( not ( = ?auto_18233 ?auto_18241 ) ) ( not ( = ?auto_18233 ?auto_18268 ) ) ( not ( = ?auto_18234 ?auto_18241 ) ) ( not ( = ?auto_18234 ?auto_18268 ) ) ( not ( = ?auto_18235 ?auto_18241 ) ) ( not ( = ?auto_18235 ?auto_18268 ) ) ( not ( = ?auto_18236 ?auto_18241 ) ) ( not ( = ?auto_18236 ?auto_18268 ) ) ( not ( = ?auto_18237 ?auto_18241 ) ) ( not ( = ?auto_18237 ?auto_18268 ) ) ( not ( = ?auto_18241 ?auto_18251 ) ) ( not ( = ?auto_18241 ?auto_18260 ) ) ( not ( = ?auto_18241 ?auto_18253 ) ) ( not ( = ?auto_18241 ?auto_18264 ) ) ( not ( = ?auto_18241 ?auto_18266 ) ) ( not ( = ?auto_18241 ?auto_18257 ) ) ( not ( = ?auto_18268 ?auto_18251 ) ) ( not ( = ?auto_18268 ?auto_18260 ) ) ( not ( = ?auto_18268 ?auto_18253 ) ) ( not ( = ?auto_18268 ?auto_18264 ) ) ( not ( = ?auto_18268 ?auto_18266 ) ) ( not ( = ?auto_18268 ?auto_18257 ) ) ( not ( = ?auto_18232 ?auto_18240 ) ) ( not ( = ?auto_18232 ?auto_18250 ) ) ( not ( = ?auto_18233 ?auto_18240 ) ) ( not ( = ?auto_18233 ?auto_18250 ) ) ( not ( = ?auto_18234 ?auto_18240 ) ) ( not ( = ?auto_18234 ?auto_18250 ) ) ( not ( = ?auto_18235 ?auto_18240 ) ) ( not ( = ?auto_18235 ?auto_18250 ) ) ( not ( = ?auto_18236 ?auto_18240 ) ) ( not ( = ?auto_18236 ?auto_18250 ) ) ( not ( = ?auto_18237 ?auto_18240 ) ) ( not ( = ?auto_18237 ?auto_18250 ) ) ( not ( = ?auto_18238 ?auto_18240 ) ) ( not ( = ?auto_18238 ?auto_18250 ) ) ( not ( = ?auto_18240 ?auto_18268 ) ) ( not ( = ?auto_18240 ?auto_18251 ) ) ( not ( = ?auto_18240 ?auto_18260 ) ) ( not ( = ?auto_18240 ?auto_18253 ) ) ( not ( = ?auto_18240 ?auto_18264 ) ) ( not ( = ?auto_18240 ?auto_18266 ) ) ( not ( = ?auto_18240 ?auto_18257 ) ) ( not ( = ?auto_18248 ?auto_18254 ) ) ( not ( = ?auto_18248 ?auto_18261 ) ) ( not ( = ?auto_18248 ?auto_18265 ) ) ( not ( = ?auto_18248 ?auto_18259 ) ) ( not ( = ?auto_18248 ?auto_18256 ) ) ( not ( = ?auto_18248 ?auto_18262 ) ) ( not ( = ?auto_18269 ?auto_18249 ) ) ( not ( = ?auto_18269 ?auto_18255 ) ) ( not ( = ?auto_18269 ?auto_18258 ) ) ( not ( = ?auto_18269 ?auto_18252 ) ) ( not ( = ?auto_18269 ?auto_18267 ) ) ( not ( = ?auto_18269 ?auto_18263 ) ) ( not ( = ?auto_18250 ?auto_18268 ) ) ( not ( = ?auto_18250 ?auto_18251 ) ) ( not ( = ?auto_18250 ?auto_18260 ) ) ( not ( = ?auto_18250 ?auto_18253 ) ) ( not ( = ?auto_18250 ?auto_18264 ) ) ( not ( = ?auto_18250 ?auto_18266 ) ) ( not ( = ?auto_18250 ?auto_18257 ) ) ( not ( = ?auto_18232 ?auto_18239 ) ) ( not ( = ?auto_18232 ?auto_18243 ) ) ( not ( = ?auto_18233 ?auto_18239 ) ) ( not ( = ?auto_18233 ?auto_18243 ) ) ( not ( = ?auto_18234 ?auto_18239 ) ) ( not ( = ?auto_18234 ?auto_18243 ) ) ( not ( = ?auto_18235 ?auto_18239 ) ) ( not ( = ?auto_18235 ?auto_18243 ) ) ( not ( = ?auto_18236 ?auto_18239 ) ) ( not ( = ?auto_18236 ?auto_18243 ) ) ( not ( = ?auto_18237 ?auto_18239 ) ) ( not ( = ?auto_18237 ?auto_18243 ) ) ( not ( = ?auto_18238 ?auto_18239 ) ) ( not ( = ?auto_18238 ?auto_18243 ) ) ( not ( = ?auto_18241 ?auto_18239 ) ) ( not ( = ?auto_18241 ?auto_18243 ) ) ( not ( = ?auto_18239 ?auto_18250 ) ) ( not ( = ?auto_18239 ?auto_18268 ) ) ( not ( = ?auto_18239 ?auto_18251 ) ) ( not ( = ?auto_18239 ?auto_18260 ) ) ( not ( = ?auto_18239 ?auto_18253 ) ) ( not ( = ?auto_18239 ?auto_18264 ) ) ( not ( = ?auto_18239 ?auto_18266 ) ) ( not ( = ?auto_18239 ?auto_18257 ) ) ( not ( = ?auto_18247 ?auto_18248 ) ) ( not ( = ?auto_18247 ?auto_18254 ) ) ( not ( = ?auto_18247 ?auto_18261 ) ) ( not ( = ?auto_18247 ?auto_18265 ) ) ( not ( = ?auto_18247 ?auto_18259 ) ) ( not ( = ?auto_18247 ?auto_18256 ) ) ( not ( = ?auto_18247 ?auto_18262 ) ) ( not ( = ?auto_18245 ?auto_18269 ) ) ( not ( = ?auto_18245 ?auto_18249 ) ) ( not ( = ?auto_18245 ?auto_18255 ) ) ( not ( = ?auto_18245 ?auto_18258 ) ) ( not ( = ?auto_18245 ?auto_18252 ) ) ( not ( = ?auto_18245 ?auto_18267 ) ) ( not ( = ?auto_18245 ?auto_18263 ) ) ( not ( = ?auto_18243 ?auto_18250 ) ) ( not ( = ?auto_18243 ?auto_18268 ) ) ( not ( = ?auto_18243 ?auto_18251 ) ) ( not ( = ?auto_18243 ?auto_18260 ) ) ( not ( = ?auto_18243 ?auto_18253 ) ) ( not ( = ?auto_18243 ?auto_18264 ) ) ( not ( = ?auto_18243 ?auto_18266 ) ) ( not ( = ?auto_18243 ?auto_18257 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_18232 ?auto_18233 ?auto_18234 ?auto_18235 ?auto_18236 ?auto_18237 ?auto_18238 ?auto_18241 ?auto_18240 )
      ( MAKE-1CRATE ?auto_18240 ?auto_18239 )
      ( MAKE-9CRATE-VERIFY ?auto_18232 ?auto_18233 ?auto_18234 ?auto_18235 ?auto_18236 ?auto_18237 ?auto_18238 ?auto_18241 ?auto_18240 ?auto_18239 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18272 - SURFACE
      ?auto_18273 - SURFACE
    )
    :vars
    (
      ?auto_18274 - HOIST
      ?auto_18275 - PLACE
      ?auto_18277 - PLACE
      ?auto_18278 - HOIST
      ?auto_18279 - SURFACE
      ?auto_18276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18274 ?auto_18275 ) ( SURFACE-AT ?auto_18272 ?auto_18275 ) ( CLEAR ?auto_18272 ) ( IS-CRATE ?auto_18273 ) ( AVAILABLE ?auto_18274 ) ( not ( = ?auto_18277 ?auto_18275 ) ) ( HOIST-AT ?auto_18278 ?auto_18277 ) ( AVAILABLE ?auto_18278 ) ( SURFACE-AT ?auto_18273 ?auto_18277 ) ( ON ?auto_18273 ?auto_18279 ) ( CLEAR ?auto_18273 ) ( TRUCK-AT ?auto_18276 ?auto_18275 ) ( not ( = ?auto_18272 ?auto_18273 ) ) ( not ( = ?auto_18272 ?auto_18279 ) ) ( not ( = ?auto_18273 ?auto_18279 ) ) ( not ( = ?auto_18274 ?auto_18278 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18276 ?auto_18275 ?auto_18277 )
      ( !LIFT ?auto_18278 ?auto_18273 ?auto_18279 ?auto_18277 )
      ( !LOAD ?auto_18278 ?auto_18273 ?auto_18276 ?auto_18277 )
      ( !DRIVE ?auto_18276 ?auto_18277 ?auto_18275 )
      ( !UNLOAD ?auto_18274 ?auto_18273 ?auto_18276 ?auto_18275 )
      ( !DROP ?auto_18274 ?auto_18273 ?auto_18272 ?auto_18275 )
      ( MAKE-1CRATE-VERIFY ?auto_18272 ?auto_18273 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_18291 - SURFACE
      ?auto_18292 - SURFACE
      ?auto_18293 - SURFACE
      ?auto_18294 - SURFACE
      ?auto_18295 - SURFACE
      ?auto_18296 - SURFACE
      ?auto_18297 - SURFACE
      ?auto_18300 - SURFACE
      ?auto_18299 - SURFACE
      ?auto_18298 - SURFACE
      ?auto_18301 - SURFACE
    )
    :vars
    (
      ?auto_18307 - HOIST
      ?auto_18306 - PLACE
      ?auto_18304 - PLACE
      ?auto_18302 - HOIST
      ?auto_18305 - SURFACE
      ?auto_18329 - PLACE
      ?auto_18315 - HOIST
      ?auto_18328 - SURFACE
      ?auto_18319 - PLACE
      ?auto_18327 - HOIST
      ?auto_18311 - SURFACE
      ?auto_18318 - SURFACE
      ?auto_18330 - PLACE
      ?auto_18313 - HOIST
      ?auto_18316 - SURFACE
      ?auto_18317 - PLACE
      ?auto_18310 - HOIST
      ?auto_18321 - SURFACE
      ?auto_18324 - SURFACE
      ?auto_18320 - PLACE
      ?auto_18325 - HOIST
      ?auto_18309 - SURFACE
      ?auto_18308 - PLACE
      ?auto_18326 - HOIST
      ?auto_18312 - SURFACE
      ?auto_18314 - PLACE
      ?auto_18323 - HOIST
      ?auto_18322 - SURFACE
      ?auto_18303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18307 ?auto_18306 ) ( IS-CRATE ?auto_18301 ) ( not ( = ?auto_18304 ?auto_18306 ) ) ( HOIST-AT ?auto_18302 ?auto_18304 ) ( SURFACE-AT ?auto_18301 ?auto_18304 ) ( ON ?auto_18301 ?auto_18305 ) ( CLEAR ?auto_18301 ) ( not ( = ?auto_18298 ?auto_18301 ) ) ( not ( = ?auto_18298 ?auto_18305 ) ) ( not ( = ?auto_18301 ?auto_18305 ) ) ( not ( = ?auto_18307 ?auto_18302 ) ) ( IS-CRATE ?auto_18298 ) ( not ( = ?auto_18329 ?auto_18306 ) ) ( HOIST-AT ?auto_18315 ?auto_18329 ) ( AVAILABLE ?auto_18315 ) ( SURFACE-AT ?auto_18298 ?auto_18329 ) ( ON ?auto_18298 ?auto_18328 ) ( CLEAR ?auto_18298 ) ( not ( = ?auto_18299 ?auto_18298 ) ) ( not ( = ?auto_18299 ?auto_18328 ) ) ( not ( = ?auto_18298 ?auto_18328 ) ) ( not ( = ?auto_18307 ?auto_18315 ) ) ( IS-CRATE ?auto_18299 ) ( not ( = ?auto_18319 ?auto_18306 ) ) ( HOIST-AT ?auto_18327 ?auto_18319 ) ( AVAILABLE ?auto_18327 ) ( SURFACE-AT ?auto_18299 ?auto_18319 ) ( ON ?auto_18299 ?auto_18311 ) ( CLEAR ?auto_18299 ) ( not ( = ?auto_18300 ?auto_18299 ) ) ( not ( = ?auto_18300 ?auto_18311 ) ) ( not ( = ?auto_18299 ?auto_18311 ) ) ( not ( = ?auto_18307 ?auto_18327 ) ) ( IS-CRATE ?auto_18300 ) ( SURFACE-AT ?auto_18300 ?auto_18304 ) ( ON ?auto_18300 ?auto_18318 ) ( CLEAR ?auto_18300 ) ( not ( = ?auto_18297 ?auto_18300 ) ) ( not ( = ?auto_18297 ?auto_18318 ) ) ( not ( = ?auto_18300 ?auto_18318 ) ) ( IS-CRATE ?auto_18297 ) ( not ( = ?auto_18330 ?auto_18306 ) ) ( HOIST-AT ?auto_18313 ?auto_18330 ) ( AVAILABLE ?auto_18313 ) ( SURFACE-AT ?auto_18297 ?auto_18330 ) ( ON ?auto_18297 ?auto_18316 ) ( CLEAR ?auto_18297 ) ( not ( = ?auto_18296 ?auto_18297 ) ) ( not ( = ?auto_18296 ?auto_18316 ) ) ( not ( = ?auto_18297 ?auto_18316 ) ) ( not ( = ?auto_18307 ?auto_18313 ) ) ( IS-CRATE ?auto_18296 ) ( not ( = ?auto_18317 ?auto_18306 ) ) ( HOIST-AT ?auto_18310 ?auto_18317 ) ( AVAILABLE ?auto_18310 ) ( SURFACE-AT ?auto_18296 ?auto_18317 ) ( ON ?auto_18296 ?auto_18321 ) ( CLEAR ?auto_18296 ) ( not ( = ?auto_18295 ?auto_18296 ) ) ( not ( = ?auto_18295 ?auto_18321 ) ) ( not ( = ?auto_18296 ?auto_18321 ) ) ( not ( = ?auto_18307 ?auto_18310 ) ) ( IS-CRATE ?auto_18295 ) ( AVAILABLE ?auto_18302 ) ( SURFACE-AT ?auto_18295 ?auto_18304 ) ( ON ?auto_18295 ?auto_18324 ) ( CLEAR ?auto_18295 ) ( not ( = ?auto_18294 ?auto_18295 ) ) ( not ( = ?auto_18294 ?auto_18324 ) ) ( not ( = ?auto_18295 ?auto_18324 ) ) ( IS-CRATE ?auto_18294 ) ( not ( = ?auto_18320 ?auto_18306 ) ) ( HOIST-AT ?auto_18325 ?auto_18320 ) ( AVAILABLE ?auto_18325 ) ( SURFACE-AT ?auto_18294 ?auto_18320 ) ( ON ?auto_18294 ?auto_18309 ) ( CLEAR ?auto_18294 ) ( not ( = ?auto_18293 ?auto_18294 ) ) ( not ( = ?auto_18293 ?auto_18309 ) ) ( not ( = ?auto_18294 ?auto_18309 ) ) ( not ( = ?auto_18307 ?auto_18325 ) ) ( IS-CRATE ?auto_18293 ) ( not ( = ?auto_18308 ?auto_18306 ) ) ( HOIST-AT ?auto_18326 ?auto_18308 ) ( AVAILABLE ?auto_18326 ) ( SURFACE-AT ?auto_18293 ?auto_18308 ) ( ON ?auto_18293 ?auto_18312 ) ( CLEAR ?auto_18293 ) ( not ( = ?auto_18292 ?auto_18293 ) ) ( not ( = ?auto_18292 ?auto_18312 ) ) ( not ( = ?auto_18293 ?auto_18312 ) ) ( not ( = ?auto_18307 ?auto_18326 ) ) ( SURFACE-AT ?auto_18291 ?auto_18306 ) ( CLEAR ?auto_18291 ) ( IS-CRATE ?auto_18292 ) ( AVAILABLE ?auto_18307 ) ( not ( = ?auto_18314 ?auto_18306 ) ) ( HOIST-AT ?auto_18323 ?auto_18314 ) ( AVAILABLE ?auto_18323 ) ( SURFACE-AT ?auto_18292 ?auto_18314 ) ( ON ?auto_18292 ?auto_18322 ) ( CLEAR ?auto_18292 ) ( TRUCK-AT ?auto_18303 ?auto_18306 ) ( not ( = ?auto_18291 ?auto_18292 ) ) ( not ( = ?auto_18291 ?auto_18322 ) ) ( not ( = ?auto_18292 ?auto_18322 ) ) ( not ( = ?auto_18307 ?auto_18323 ) ) ( not ( = ?auto_18291 ?auto_18293 ) ) ( not ( = ?auto_18291 ?auto_18312 ) ) ( not ( = ?auto_18293 ?auto_18322 ) ) ( not ( = ?auto_18308 ?auto_18314 ) ) ( not ( = ?auto_18326 ?auto_18323 ) ) ( not ( = ?auto_18312 ?auto_18322 ) ) ( not ( = ?auto_18291 ?auto_18294 ) ) ( not ( = ?auto_18291 ?auto_18309 ) ) ( not ( = ?auto_18292 ?auto_18294 ) ) ( not ( = ?auto_18292 ?auto_18309 ) ) ( not ( = ?auto_18294 ?auto_18312 ) ) ( not ( = ?auto_18294 ?auto_18322 ) ) ( not ( = ?auto_18320 ?auto_18308 ) ) ( not ( = ?auto_18320 ?auto_18314 ) ) ( not ( = ?auto_18325 ?auto_18326 ) ) ( not ( = ?auto_18325 ?auto_18323 ) ) ( not ( = ?auto_18309 ?auto_18312 ) ) ( not ( = ?auto_18309 ?auto_18322 ) ) ( not ( = ?auto_18291 ?auto_18295 ) ) ( not ( = ?auto_18291 ?auto_18324 ) ) ( not ( = ?auto_18292 ?auto_18295 ) ) ( not ( = ?auto_18292 ?auto_18324 ) ) ( not ( = ?auto_18293 ?auto_18295 ) ) ( not ( = ?auto_18293 ?auto_18324 ) ) ( not ( = ?auto_18295 ?auto_18309 ) ) ( not ( = ?auto_18295 ?auto_18312 ) ) ( not ( = ?auto_18295 ?auto_18322 ) ) ( not ( = ?auto_18304 ?auto_18320 ) ) ( not ( = ?auto_18304 ?auto_18308 ) ) ( not ( = ?auto_18304 ?auto_18314 ) ) ( not ( = ?auto_18302 ?auto_18325 ) ) ( not ( = ?auto_18302 ?auto_18326 ) ) ( not ( = ?auto_18302 ?auto_18323 ) ) ( not ( = ?auto_18324 ?auto_18309 ) ) ( not ( = ?auto_18324 ?auto_18312 ) ) ( not ( = ?auto_18324 ?auto_18322 ) ) ( not ( = ?auto_18291 ?auto_18296 ) ) ( not ( = ?auto_18291 ?auto_18321 ) ) ( not ( = ?auto_18292 ?auto_18296 ) ) ( not ( = ?auto_18292 ?auto_18321 ) ) ( not ( = ?auto_18293 ?auto_18296 ) ) ( not ( = ?auto_18293 ?auto_18321 ) ) ( not ( = ?auto_18294 ?auto_18296 ) ) ( not ( = ?auto_18294 ?auto_18321 ) ) ( not ( = ?auto_18296 ?auto_18324 ) ) ( not ( = ?auto_18296 ?auto_18309 ) ) ( not ( = ?auto_18296 ?auto_18312 ) ) ( not ( = ?auto_18296 ?auto_18322 ) ) ( not ( = ?auto_18317 ?auto_18304 ) ) ( not ( = ?auto_18317 ?auto_18320 ) ) ( not ( = ?auto_18317 ?auto_18308 ) ) ( not ( = ?auto_18317 ?auto_18314 ) ) ( not ( = ?auto_18310 ?auto_18302 ) ) ( not ( = ?auto_18310 ?auto_18325 ) ) ( not ( = ?auto_18310 ?auto_18326 ) ) ( not ( = ?auto_18310 ?auto_18323 ) ) ( not ( = ?auto_18321 ?auto_18324 ) ) ( not ( = ?auto_18321 ?auto_18309 ) ) ( not ( = ?auto_18321 ?auto_18312 ) ) ( not ( = ?auto_18321 ?auto_18322 ) ) ( not ( = ?auto_18291 ?auto_18297 ) ) ( not ( = ?auto_18291 ?auto_18316 ) ) ( not ( = ?auto_18292 ?auto_18297 ) ) ( not ( = ?auto_18292 ?auto_18316 ) ) ( not ( = ?auto_18293 ?auto_18297 ) ) ( not ( = ?auto_18293 ?auto_18316 ) ) ( not ( = ?auto_18294 ?auto_18297 ) ) ( not ( = ?auto_18294 ?auto_18316 ) ) ( not ( = ?auto_18295 ?auto_18297 ) ) ( not ( = ?auto_18295 ?auto_18316 ) ) ( not ( = ?auto_18297 ?auto_18321 ) ) ( not ( = ?auto_18297 ?auto_18324 ) ) ( not ( = ?auto_18297 ?auto_18309 ) ) ( not ( = ?auto_18297 ?auto_18312 ) ) ( not ( = ?auto_18297 ?auto_18322 ) ) ( not ( = ?auto_18330 ?auto_18317 ) ) ( not ( = ?auto_18330 ?auto_18304 ) ) ( not ( = ?auto_18330 ?auto_18320 ) ) ( not ( = ?auto_18330 ?auto_18308 ) ) ( not ( = ?auto_18330 ?auto_18314 ) ) ( not ( = ?auto_18313 ?auto_18310 ) ) ( not ( = ?auto_18313 ?auto_18302 ) ) ( not ( = ?auto_18313 ?auto_18325 ) ) ( not ( = ?auto_18313 ?auto_18326 ) ) ( not ( = ?auto_18313 ?auto_18323 ) ) ( not ( = ?auto_18316 ?auto_18321 ) ) ( not ( = ?auto_18316 ?auto_18324 ) ) ( not ( = ?auto_18316 ?auto_18309 ) ) ( not ( = ?auto_18316 ?auto_18312 ) ) ( not ( = ?auto_18316 ?auto_18322 ) ) ( not ( = ?auto_18291 ?auto_18300 ) ) ( not ( = ?auto_18291 ?auto_18318 ) ) ( not ( = ?auto_18292 ?auto_18300 ) ) ( not ( = ?auto_18292 ?auto_18318 ) ) ( not ( = ?auto_18293 ?auto_18300 ) ) ( not ( = ?auto_18293 ?auto_18318 ) ) ( not ( = ?auto_18294 ?auto_18300 ) ) ( not ( = ?auto_18294 ?auto_18318 ) ) ( not ( = ?auto_18295 ?auto_18300 ) ) ( not ( = ?auto_18295 ?auto_18318 ) ) ( not ( = ?auto_18296 ?auto_18300 ) ) ( not ( = ?auto_18296 ?auto_18318 ) ) ( not ( = ?auto_18300 ?auto_18316 ) ) ( not ( = ?auto_18300 ?auto_18321 ) ) ( not ( = ?auto_18300 ?auto_18324 ) ) ( not ( = ?auto_18300 ?auto_18309 ) ) ( not ( = ?auto_18300 ?auto_18312 ) ) ( not ( = ?auto_18300 ?auto_18322 ) ) ( not ( = ?auto_18318 ?auto_18316 ) ) ( not ( = ?auto_18318 ?auto_18321 ) ) ( not ( = ?auto_18318 ?auto_18324 ) ) ( not ( = ?auto_18318 ?auto_18309 ) ) ( not ( = ?auto_18318 ?auto_18312 ) ) ( not ( = ?auto_18318 ?auto_18322 ) ) ( not ( = ?auto_18291 ?auto_18299 ) ) ( not ( = ?auto_18291 ?auto_18311 ) ) ( not ( = ?auto_18292 ?auto_18299 ) ) ( not ( = ?auto_18292 ?auto_18311 ) ) ( not ( = ?auto_18293 ?auto_18299 ) ) ( not ( = ?auto_18293 ?auto_18311 ) ) ( not ( = ?auto_18294 ?auto_18299 ) ) ( not ( = ?auto_18294 ?auto_18311 ) ) ( not ( = ?auto_18295 ?auto_18299 ) ) ( not ( = ?auto_18295 ?auto_18311 ) ) ( not ( = ?auto_18296 ?auto_18299 ) ) ( not ( = ?auto_18296 ?auto_18311 ) ) ( not ( = ?auto_18297 ?auto_18299 ) ) ( not ( = ?auto_18297 ?auto_18311 ) ) ( not ( = ?auto_18299 ?auto_18318 ) ) ( not ( = ?auto_18299 ?auto_18316 ) ) ( not ( = ?auto_18299 ?auto_18321 ) ) ( not ( = ?auto_18299 ?auto_18324 ) ) ( not ( = ?auto_18299 ?auto_18309 ) ) ( not ( = ?auto_18299 ?auto_18312 ) ) ( not ( = ?auto_18299 ?auto_18322 ) ) ( not ( = ?auto_18319 ?auto_18304 ) ) ( not ( = ?auto_18319 ?auto_18330 ) ) ( not ( = ?auto_18319 ?auto_18317 ) ) ( not ( = ?auto_18319 ?auto_18320 ) ) ( not ( = ?auto_18319 ?auto_18308 ) ) ( not ( = ?auto_18319 ?auto_18314 ) ) ( not ( = ?auto_18327 ?auto_18302 ) ) ( not ( = ?auto_18327 ?auto_18313 ) ) ( not ( = ?auto_18327 ?auto_18310 ) ) ( not ( = ?auto_18327 ?auto_18325 ) ) ( not ( = ?auto_18327 ?auto_18326 ) ) ( not ( = ?auto_18327 ?auto_18323 ) ) ( not ( = ?auto_18311 ?auto_18318 ) ) ( not ( = ?auto_18311 ?auto_18316 ) ) ( not ( = ?auto_18311 ?auto_18321 ) ) ( not ( = ?auto_18311 ?auto_18324 ) ) ( not ( = ?auto_18311 ?auto_18309 ) ) ( not ( = ?auto_18311 ?auto_18312 ) ) ( not ( = ?auto_18311 ?auto_18322 ) ) ( not ( = ?auto_18291 ?auto_18298 ) ) ( not ( = ?auto_18291 ?auto_18328 ) ) ( not ( = ?auto_18292 ?auto_18298 ) ) ( not ( = ?auto_18292 ?auto_18328 ) ) ( not ( = ?auto_18293 ?auto_18298 ) ) ( not ( = ?auto_18293 ?auto_18328 ) ) ( not ( = ?auto_18294 ?auto_18298 ) ) ( not ( = ?auto_18294 ?auto_18328 ) ) ( not ( = ?auto_18295 ?auto_18298 ) ) ( not ( = ?auto_18295 ?auto_18328 ) ) ( not ( = ?auto_18296 ?auto_18298 ) ) ( not ( = ?auto_18296 ?auto_18328 ) ) ( not ( = ?auto_18297 ?auto_18298 ) ) ( not ( = ?auto_18297 ?auto_18328 ) ) ( not ( = ?auto_18300 ?auto_18298 ) ) ( not ( = ?auto_18300 ?auto_18328 ) ) ( not ( = ?auto_18298 ?auto_18311 ) ) ( not ( = ?auto_18298 ?auto_18318 ) ) ( not ( = ?auto_18298 ?auto_18316 ) ) ( not ( = ?auto_18298 ?auto_18321 ) ) ( not ( = ?auto_18298 ?auto_18324 ) ) ( not ( = ?auto_18298 ?auto_18309 ) ) ( not ( = ?auto_18298 ?auto_18312 ) ) ( not ( = ?auto_18298 ?auto_18322 ) ) ( not ( = ?auto_18329 ?auto_18319 ) ) ( not ( = ?auto_18329 ?auto_18304 ) ) ( not ( = ?auto_18329 ?auto_18330 ) ) ( not ( = ?auto_18329 ?auto_18317 ) ) ( not ( = ?auto_18329 ?auto_18320 ) ) ( not ( = ?auto_18329 ?auto_18308 ) ) ( not ( = ?auto_18329 ?auto_18314 ) ) ( not ( = ?auto_18315 ?auto_18327 ) ) ( not ( = ?auto_18315 ?auto_18302 ) ) ( not ( = ?auto_18315 ?auto_18313 ) ) ( not ( = ?auto_18315 ?auto_18310 ) ) ( not ( = ?auto_18315 ?auto_18325 ) ) ( not ( = ?auto_18315 ?auto_18326 ) ) ( not ( = ?auto_18315 ?auto_18323 ) ) ( not ( = ?auto_18328 ?auto_18311 ) ) ( not ( = ?auto_18328 ?auto_18318 ) ) ( not ( = ?auto_18328 ?auto_18316 ) ) ( not ( = ?auto_18328 ?auto_18321 ) ) ( not ( = ?auto_18328 ?auto_18324 ) ) ( not ( = ?auto_18328 ?auto_18309 ) ) ( not ( = ?auto_18328 ?auto_18312 ) ) ( not ( = ?auto_18328 ?auto_18322 ) ) ( not ( = ?auto_18291 ?auto_18301 ) ) ( not ( = ?auto_18291 ?auto_18305 ) ) ( not ( = ?auto_18292 ?auto_18301 ) ) ( not ( = ?auto_18292 ?auto_18305 ) ) ( not ( = ?auto_18293 ?auto_18301 ) ) ( not ( = ?auto_18293 ?auto_18305 ) ) ( not ( = ?auto_18294 ?auto_18301 ) ) ( not ( = ?auto_18294 ?auto_18305 ) ) ( not ( = ?auto_18295 ?auto_18301 ) ) ( not ( = ?auto_18295 ?auto_18305 ) ) ( not ( = ?auto_18296 ?auto_18301 ) ) ( not ( = ?auto_18296 ?auto_18305 ) ) ( not ( = ?auto_18297 ?auto_18301 ) ) ( not ( = ?auto_18297 ?auto_18305 ) ) ( not ( = ?auto_18300 ?auto_18301 ) ) ( not ( = ?auto_18300 ?auto_18305 ) ) ( not ( = ?auto_18299 ?auto_18301 ) ) ( not ( = ?auto_18299 ?auto_18305 ) ) ( not ( = ?auto_18301 ?auto_18328 ) ) ( not ( = ?auto_18301 ?auto_18311 ) ) ( not ( = ?auto_18301 ?auto_18318 ) ) ( not ( = ?auto_18301 ?auto_18316 ) ) ( not ( = ?auto_18301 ?auto_18321 ) ) ( not ( = ?auto_18301 ?auto_18324 ) ) ( not ( = ?auto_18301 ?auto_18309 ) ) ( not ( = ?auto_18301 ?auto_18312 ) ) ( not ( = ?auto_18301 ?auto_18322 ) ) ( not ( = ?auto_18305 ?auto_18328 ) ) ( not ( = ?auto_18305 ?auto_18311 ) ) ( not ( = ?auto_18305 ?auto_18318 ) ) ( not ( = ?auto_18305 ?auto_18316 ) ) ( not ( = ?auto_18305 ?auto_18321 ) ) ( not ( = ?auto_18305 ?auto_18324 ) ) ( not ( = ?auto_18305 ?auto_18309 ) ) ( not ( = ?auto_18305 ?auto_18312 ) ) ( not ( = ?auto_18305 ?auto_18322 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_18291 ?auto_18292 ?auto_18293 ?auto_18294 ?auto_18295 ?auto_18296 ?auto_18297 ?auto_18300 ?auto_18299 ?auto_18298 )
      ( MAKE-1CRATE ?auto_18298 ?auto_18301 )
      ( MAKE-10CRATE-VERIFY ?auto_18291 ?auto_18292 ?auto_18293 ?auto_18294 ?auto_18295 ?auto_18296 ?auto_18297 ?auto_18300 ?auto_18299 ?auto_18298 ?auto_18301 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18333 - SURFACE
      ?auto_18334 - SURFACE
    )
    :vars
    (
      ?auto_18335 - HOIST
      ?auto_18336 - PLACE
      ?auto_18338 - PLACE
      ?auto_18339 - HOIST
      ?auto_18340 - SURFACE
      ?auto_18337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18335 ?auto_18336 ) ( SURFACE-AT ?auto_18333 ?auto_18336 ) ( CLEAR ?auto_18333 ) ( IS-CRATE ?auto_18334 ) ( AVAILABLE ?auto_18335 ) ( not ( = ?auto_18338 ?auto_18336 ) ) ( HOIST-AT ?auto_18339 ?auto_18338 ) ( AVAILABLE ?auto_18339 ) ( SURFACE-AT ?auto_18334 ?auto_18338 ) ( ON ?auto_18334 ?auto_18340 ) ( CLEAR ?auto_18334 ) ( TRUCK-AT ?auto_18337 ?auto_18336 ) ( not ( = ?auto_18333 ?auto_18334 ) ) ( not ( = ?auto_18333 ?auto_18340 ) ) ( not ( = ?auto_18334 ?auto_18340 ) ) ( not ( = ?auto_18335 ?auto_18339 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18337 ?auto_18336 ?auto_18338 )
      ( !LIFT ?auto_18339 ?auto_18334 ?auto_18340 ?auto_18338 )
      ( !LOAD ?auto_18339 ?auto_18334 ?auto_18337 ?auto_18338 )
      ( !DRIVE ?auto_18337 ?auto_18338 ?auto_18336 )
      ( !UNLOAD ?auto_18335 ?auto_18334 ?auto_18337 ?auto_18336 )
      ( !DROP ?auto_18335 ?auto_18334 ?auto_18333 ?auto_18336 )
      ( MAKE-1CRATE-VERIFY ?auto_18333 ?auto_18334 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_18353 - SURFACE
      ?auto_18354 - SURFACE
      ?auto_18355 - SURFACE
      ?auto_18356 - SURFACE
      ?auto_18357 - SURFACE
      ?auto_18358 - SURFACE
      ?auto_18359 - SURFACE
      ?auto_18362 - SURFACE
      ?auto_18361 - SURFACE
      ?auto_18360 - SURFACE
      ?auto_18363 - SURFACE
      ?auto_18364 - SURFACE
    )
    :vars
    (
      ?auto_18369 - HOIST
      ?auto_18366 - PLACE
      ?auto_18365 - PLACE
      ?auto_18368 - HOIST
      ?auto_18370 - SURFACE
      ?auto_18394 - PLACE
      ?auto_18392 - HOIST
      ?auto_18393 - SURFACE
      ?auto_18384 - SURFACE
      ?auto_18378 - PLACE
      ?auto_18383 - HOIST
      ?auto_18376 - SURFACE
      ?auto_18373 - SURFACE
      ?auto_18382 - PLACE
      ?auto_18375 - HOIST
      ?auto_18385 - SURFACE
      ?auto_18372 - PLACE
      ?auto_18380 - HOIST
      ?auto_18371 - SURFACE
      ?auto_18379 - SURFACE
      ?auto_18374 - PLACE
      ?auto_18390 - HOIST
      ?auto_18388 - SURFACE
      ?auto_18377 - PLACE
      ?auto_18381 - HOIST
      ?auto_18391 - SURFACE
      ?auto_18389 - PLACE
      ?auto_18387 - HOIST
      ?auto_18386 - SURFACE
      ?auto_18367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18369 ?auto_18366 ) ( IS-CRATE ?auto_18364 ) ( not ( = ?auto_18365 ?auto_18366 ) ) ( HOIST-AT ?auto_18368 ?auto_18365 ) ( SURFACE-AT ?auto_18364 ?auto_18365 ) ( ON ?auto_18364 ?auto_18370 ) ( CLEAR ?auto_18364 ) ( not ( = ?auto_18363 ?auto_18364 ) ) ( not ( = ?auto_18363 ?auto_18370 ) ) ( not ( = ?auto_18364 ?auto_18370 ) ) ( not ( = ?auto_18369 ?auto_18368 ) ) ( IS-CRATE ?auto_18363 ) ( not ( = ?auto_18394 ?auto_18366 ) ) ( HOIST-AT ?auto_18392 ?auto_18394 ) ( SURFACE-AT ?auto_18363 ?auto_18394 ) ( ON ?auto_18363 ?auto_18393 ) ( CLEAR ?auto_18363 ) ( not ( = ?auto_18360 ?auto_18363 ) ) ( not ( = ?auto_18360 ?auto_18393 ) ) ( not ( = ?auto_18363 ?auto_18393 ) ) ( not ( = ?auto_18369 ?auto_18392 ) ) ( IS-CRATE ?auto_18360 ) ( AVAILABLE ?auto_18368 ) ( SURFACE-AT ?auto_18360 ?auto_18365 ) ( ON ?auto_18360 ?auto_18384 ) ( CLEAR ?auto_18360 ) ( not ( = ?auto_18361 ?auto_18360 ) ) ( not ( = ?auto_18361 ?auto_18384 ) ) ( not ( = ?auto_18360 ?auto_18384 ) ) ( IS-CRATE ?auto_18361 ) ( not ( = ?auto_18378 ?auto_18366 ) ) ( HOIST-AT ?auto_18383 ?auto_18378 ) ( AVAILABLE ?auto_18383 ) ( SURFACE-AT ?auto_18361 ?auto_18378 ) ( ON ?auto_18361 ?auto_18376 ) ( CLEAR ?auto_18361 ) ( not ( = ?auto_18362 ?auto_18361 ) ) ( not ( = ?auto_18362 ?auto_18376 ) ) ( not ( = ?auto_18361 ?auto_18376 ) ) ( not ( = ?auto_18369 ?auto_18383 ) ) ( IS-CRATE ?auto_18362 ) ( SURFACE-AT ?auto_18362 ?auto_18394 ) ( ON ?auto_18362 ?auto_18373 ) ( CLEAR ?auto_18362 ) ( not ( = ?auto_18359 ?auto_18362 ) ) ( not ( = ?auto_18359 ?auto_18373 ) ) ( not ( = ?auto_18362 ?auto_18373 ) ) ( IS-CRATE ?auto_18359 ) ( not ( = ?auto_18382 ?auto_18366 ) ) ( HOIST-AT ?auto_18375 ?auto_18382 ) ( AVAILABLE ?auto_18375 ) ( SURFACE-AT ?auto_18359 ?auto_18382 ) ( ON ?auto_18359 ?auto_18385 ) ( CLEAR ?auto_18359 ) ( not ( = ?auto_18358 ?auto_18359 ) ) ( not ( = ?auto_18358 ?auto_18385 ) ) ( not ( = ?auto_18359 ?auto_18385 ) ) ( not ( = ?auto_18369 ?auto_18375 ) ) ( IS-CRATE ?auto_18358 ) ( not ( = ?auto_18372 ?auto_18366 ) ) ( HOIST-AT ?auto_18380 ?auto_18372 ) ( AVAILABLE ?auto_18380 ) ( SURFACE-AT ?auto_18358 ?auto_18372 ) ( ON ?auto_18358 ?auto_18371 ) ( CLEAR ?auto_18358 ) ( not ( = ?auto_18357 ?auto_18358 ) ) ( not ( = ?auto_18357 ?auto_18371 ) ) ( not ( = ?auto_18358 ?auto_18371 ) ) ( not ( = ?auto_18369 ?auto_18380 ) ) ( IS-CRATE ?auto_18357 ) ( AVAILABLE ?auto_18392 ) ( SURFACE-AT ?auto_18357 ?auto_18394 ) ( ON ?auto_18357 ?auto_18379 ) ( CLEAR ?auto_18357 ) ( not ( = ?auto_18356 ?auto_18357 ) ) ( not ( = ?auto_18356 ?auto_18379 ) ) ( not ( = ?auto_18357 ?auto_18379 ) ) ( IS-CRATE ?auto_18356 ) ( not ( = ?auto_18374 ?auto_18366 ) ) ( HOIST-AT ?auto_18390 ?auto_18374 ) ( AVAILABLE ?auto_18390 ) ( SURFACE-AT ?auto_18356 ?auto_18374 ) ( ON ?auto_18356 ?auto_18388 ) ( CLEAR ?auto_18356 ) ( not ( = ?auto_18355 ?auto_18356 ) ) ( not ( = ?auto_18355 ?auto_18388 ) ) ( not ( = ?auto_18356 ?auto_18388 ) ) ( not ( = ?auto_18369 ?auto_18390 ) ) ( IS-CRATE ?auto_18355 ) ( not ( = ?auto_18377 ?auto_18366 ) ) ( HOIST-AT ?auto_18381 ?auto_18377 ) ( AVAILABLE ?auto_18381 ) ( SURFACE-AT ?auto_18355 ?auto_18377 ) ( ON ?auto_18355 ?auto_18391 ) ( CLEAR ?auto_18355 ) ( not ( = ?auto_18354 ?auto_18355 ) ) ( not ( = ?auto_18354 ?auto_18391 ) ) ( not ( = ?auto_18355 ?auto_18391 ) ) ( not ( = ?auto_18369 ?auto_18381 ) ) ( SURFACE-AT ?auto_18353 ?auto_18366 ) ( CLEAR ?auto_18353 ) ( IS-CRATE ?auto_18354 ) ( AVAILABLE ?auto_18369 ) ( not ( = ?auto_18389 ?auto_18366 ) ) ( HOIST-AT ?auto_18387 ?auto_18389 ) ( AVAILABLE ?auto_18387 ) ( SURFACE-AT ?auto_18354 ?auto_18389 ) ( ON ?auto_18354 ?auto_18386 ) ( CLEAR ?auto_18354 ) ( TRUCK-AT ?auto_18367 ?auto_18366 ) ( not ( = ?auto_18353 ?auto_18354 ) ) ( not ( = ?auto_18353 ?auto_18386 ) ) ( not ( = ?auto_18354 ?auto_18386 ) ) ( not ( = ?auto_18369 ?auto_18387 ) ) ( not ( = ?auto_18353 ?auto_18355 ) ) ( not ( = ?auto_18353 ?auto_18391 ) ) ( not ( = ?auto_18355 ?auto_18386 ) ) ( not ( = ?auto_18377 ?auto_18389 ) ) ( not ( = ?auto_18381 ?auto_18387 ) ) ( not ( = ?auto_18391 ?auto_18386 ) ) ( not ( = ?auto_18353 ?auto_18356 ) ) ( not ( = ?auto_18353 ?auto_18388 ) ) ( not ( = ?auto_18354 ?auto_18356 ) ) ( not ( = ?auto_18354 ?auto_18388 ) ) ( not ( = ?auto_18356 ?auto_18391 ) ) ( not ( = ?auto_18356 ?auto_18386 ) ) ( not ( = ?auto_18374 ?auto_18377 ) ) ( not ( = ?auto_18374 ?auto_18389 ) ) ( not ( = ?auto_18390 ?auto_18381 ) ) ( not ( = ?auto_18390 ?auto_18387 ) ) ( not ( = ?auto_18388 ?auto_18391 ) ) ( not ( = ?auto_18388 ?auto_18386 ) ) ( not ( = ?auto_18353 ?auto_18357 ) ) ( not ( = ?auto_18353 ?auto_18379 ) ) ( not ( = ?auto_18354 ?auto_18357 ) ) ( not ( = ?auto_18354 ?auto_18379 ) ) ( not ( = ?auto_18355 ?auto_18357 ) ) ( not ( = ?auto_18355 ?auto_18379 ) ) ( not ( = ?auto_18357 ?auto_18388 ) ) ( not ( = ?auto_18357 ?auto_18391 ) ) ( not ( = ?auto_18357 ?auto_18386 ) ) ( not ( = ?auto_18394 ?auto_18374 ) ) ( not ( = ?auto_18394 ?auto_18377 ) ) ( not ( = ?auto_18394 ?auto_18389 ) ) ( not ( = ?auto_18392 ?auto_18390 ) ) ( not ( = ?auto_18392 ?auto_18381 ) ) ( not ( = ?auto_18392 ?auto_18387 ) ) ( not ( = ?auto_18379 ?auto_18388 ) ) ( not ( = ?auto_18379 ?auto_18391 ) ) ( not ( = ?auto_18379 ?auto_18386 ) ) ( not ( = ?auto_18353 ?auto_18358 ) ) ( not ( = ?auto_18353 ?auto_18371 ) ) ( not ( = ?auto_18354 ?auto_18358 ) ) ( not ( = ?auto_18354 ?auto_18371 ) ) ( not ( = ?auto_18355 ?auto_18358 ) ) ( not ( = ?auto_18355 ?auto_18371 ) ) ( not ( = ?auto_18356 ?auto_18358 ) ) ( not ( = ?auto_18356 ?auto_18371 ) ) ( not ( = ?auto_18358 ?auto_18379 ) ) ( not ( = ?auto_18358 ?auto_18388 ) ) ( not ( = ?auto_18358 ?auto_18391 ) ) ( not ( = ?auto_18358 ?auto_18386 ) ) ( not ( = ?auto_18372 ?auto_18394 ) ) ( not ( = ?auto_18372 ?auto_18374 ) ) ( not ( = ?auto_18372 ?auto_18377 ) ) ( not ( = ?auto_18372 ?auto_18389 ) ) ( not ( = ?auto_18380 ?auto_18392 ) ) ( not ( = ?auto_18380 ?auto_18390 ) ) ( not ( = ?auto_18380 ?auto_18381 ) ) ( not ( = ?auto_18380 ?auto_18387 ) ) ( not ( = ?auto_18371 ?auto_18379 ) ) ( not ( = ?auto_18371 ?auto_18388 ) ) ( not ( = ?auto_18371 ?auto_18391 ) ) ( not ( = ?auto_18371 ?auto_18386 ) ) ( not ( = ?auto_18353 ?auto_18359 ) ) ( not ( = ?auto_18353 ?auto_18385 ) ) ( not ( = ?auto_18354 ?auto_18359 ) ) ( not ( = ?auto_18354 ?auto_18385 ) ) ( not ( = ?auto_18355 ?auto_18359 ) ) ( not ( = ?auto_18355 ?auto_18385 ) ) ( not ( = ?auto_18356 ?auto_18359 ) ) ( not ( = ?auto_18356 ?auto_18385 ) ) ( not ( = ?auto_18357 ?auto_18359 ) ) ( not ( = ?auto_18357 ?auto_18385 ) ) ( not ( = ?auto_18359 ?auto_18371 ) ) ( not ( = ?auto_18359 ?auto_18379 ) ) ( not ( = ?auto_18359 ?auto_18388 ) ) ( not ( = ?auto_18359 ?auto_18391 ) ) ( not ( = ?auto_18359 ?auto_18386 ) ) ( not ( = ?auto_18382 ?auto_18372 ) ) ( not ( = ?auto_18382 ?auto_18394 ) ) ( not ( = ?auto_18382 ?auto_18374 ) ) ( not ( = ?auto_18382 ?auto_18377 ) ) ( not ( = ?auto_18382 ?auto_18389 ) ) ( not ( = ?auto_18375 ?auto_18380 ) ) ( not ( = ?auto_18375 ?auto_18392 ) ) ( not ( = ?auto_18375 ?auto_18390 ) ) ( not ( = ?auto_18375 ?auto_18381 ) ) ( not ( = ?auto_18375 ?auto_18387 ) ) ( not ( = ?auto_18385 ?auto_18371 ) ) ( not ( = ?auto_18385 ?auto_18379 ) ) ( not ( = ?auto_18385 ?auto_18388 ) ) ( not ( = ?auto_18385 ?auto_18391 ) ) ( not ( = ?auto_18385 ?auto_18386 ) ) ( not ( = ?auto_18353 ?auto_18362 ) ) ( not ( = ?auto_18353 ?auto_18373 ) ) ( not ( = ?auto_18354 ?auto_18362 ) ) ( not ( = ?auto_18354 ?auto_18373 ) ) ( not ( = ?auto_18355 ?auto_18362 ) ) ( not ( = ?auto_18355 ?auto_18373 ) ) ( not ( = ?auto_18356 ?auto_18362 ) ) ( not ( = ?auto_18356 ?auto_18373 ) ) ( not ( = ?auto_18357 ?auto_18362 ) ) ( not ( = ?auto_18357 ?auto_18373 ) ) ( not ( = ?auto_18358 ?auto_18362 ) ) ( not ( = ?auto_18358 ?auto_18373 ) ) ( not ( = ?auto_18362 ?auto_18385 ) ) ( not ( = ?auto_18362 ?auto_18371 ) ) ( not ( = ?auto_18362 ?auto_18379 ) ) ( not ( = ?auto_18362 ?auto_18388 ) ) ( not ( = ?auto_18362 ?auto_18391 ) ) ( not ( = ?auto_18362 ?auto_18386 ) ) ( not ( = ?auto_18373 ?auto_18385 ) ) ( not ( = ?auto_18373 ?auto_18371 ) ) ( not ( = ?auto_18373 ?auto_18379 ) ) ( not ( = ?auto_18373 ?auto_18388 ) ) ( not ( = ?auto_18373 ?auto_18391 ) ) ( not ( = ?auto_18373 ?auto_18386 ) ) ( not ( = ?auto_18353 ?auto_18361 ) ) ( not ( = ?auto_18353 ?auto_18376 ) ) ( not ( = ?auto_18354 ?auto_18361 ) ) ( not ( = ?auto_18354 ?auto_18376 ) ) ( not ( = ?auto_18355 ?auto_18361 ) ) ( not ( = ?auto_18355 ?auto_18376 ) ) ( not ( = ?auto_18356 ?auto_18361 ) ) ( not ( = ?auto_18356 ?auto_18376 ) ) ( not ( = ?auto_18357 ?auto_18361 ) ) ( not ( = ?auto_18357 ?auto_18376 ) ) ( not ( = ?auto_18358 ?auto_18361 ) ) ( not ( = ?auto_18358 ?auto_18376 ) ) ( not ( = ?auto_18359 ?auto_18361 ) ) ( not ( = ?auto_18359 ?auto_18376 ) ) ( not ( = ?auto_18361 ?auto_18373 ) ) ( not ( = ?auto_18361 ?auto_18385 ) ) ( not ( = ?auto_18361 ?auto_18371 ) ) ( not ( = ?auto_18361 ?auto_18379 ) ) ( not ( = ?auto_18361 ?auto_18388 ) ) ( not ( = ?auto_18361 ?auto_18391 ) ) ( not ( = ?auto_18361 ?auto_18386 ) ) ( not ( = ?auto_18378 ?auto_18394 ) ) ( not ( = ?auto_18378 ?auto_18382 ) ) ( not ( = ?auto_18378 ?auto_18372 ) ) ( not ( = ?auto_18378 ?auto_18374 ) ) ( not ( = ?auto_18378 ?auto_18377 ) ) ( not ( = ?auto_18378 ?auto_18389 ) ) ( not ( = ?auto_18383 ?auto_18392 ) ) ( not ( = ?auto_18383 ?auto_18375 ) ) ( not ( = ?auto_18383 ?auto_18380 ) ) ( not ( = ?auto_18383 ?auto_18390 ) ) ( not ( = ?auto_18383 ?auto_18381 ) ) ( not ( = ?auto_18383 ?auto_18387 ) ) ( not ( = ?auto_18376 ?auto_18373 ) ) ( not ( = ?auto_18376 ?auto_18385 ) ) ( not ( = ?auto_18376 ?auto_18371 ) ) ( not ( = ?auto_18376 ?auto_18379 ) ) ( not ( = ?auto_18376 ?auto_18388 ) ) ( not ( = ?auto_18376 ?auto_18391 ) ) ( not ( = ?auto_18376 ?auto_18386 ) ) ( not ( = ?auto_18353 ?auto_18360 ) ) ( not ( = ?auto_18353 ?auto_18384 ) ) ( not ( = ?auto_18354 ?auto_18360 ) ) ( not ( = ?auto_18354 ?auto_18384 ) ) ( not ( = ?auto_18355 ?auto_18360 ) ) ( not ( = ?auto_18355 ?auto_18384 ) ) ( not ( = ?auto_18356 ?auto_18360 ) ) ( not ( = ?auto_18356 ?auto_18384 ) ) ( not ( = ?auto_18357 ?auto_18360 ) ) ( not ( = ?auto_18357 ?auto_18384 ) ) ( not ( = ?auto_18358 ?auto_18360 ) ) ( not ( = ?auto_18358 ?auto_18384 ) ) ( not ( = ?auto_18359 ?auto_18360 ) ) ( not ( = ?auto_18359 ?auto_18384 ) ) ( not ( = ?auto_18362 ?auto_18360 ) ) ( not ( = ?auto_18362 ?auto_18384 ) ) ( not ( = ?auto_18360 ?auto_18376 ) ) ( not ( = ?auto_18360 ?auto_18373 ) ) ( not ( = ?auto_18360 ?auto_18385 ) ) ( not ( = ?auto_18360 ?auto_18371 ) ) ( not ( = ?auto_18360 ?auto_18379 ) ) ( not ( = ?auto_18360 ?auto_18388 ) ) ( not ( = ?auto_18360 ?auto_18391 ) ) ( not ( = ?auto_18360 ?auto_18386 ) ) ( not ( = ?auto_18365 ?auto_18378 ) ) ( not ( = ?auto_18365 ?auto_18394 ) ) ( not ( = ?auto_18365 ?auto_18382 ) ) ( not ( = ?auto_18365 ?auto_18372 ) ) ( not ( = ?auto_18365 ?auto_18374 ) ) ( not ( = ?auto_18365 ?auto_18377 ) ) ( not ( = ?auto_18365 ?auto_18389 ) ) ( not ( = ?auto_18368 ?auto_18383 ) ) ( not ( = ?auto_18368 ?auto_18392 ) ) ( not ( = ?auto_18368 ?auto_18375 ) ) ( not ( = ?auto_18368 ?auto_18380 ) ) ( not ( = ?auto_18368 ?auto_18390 ) ) ( not ( = ?auto_18368 ?auto_18381 ) ) ( not ( = ?auto_18368 ?auto_18387 ) ) ( not ( = ?auto_18384 ?auto_18376 ) ) ( not ( = ?auto_18384 ?auto_18373 ) ) ( not ( = ?auto_18384 ?auto_18385 ) ) ( not ( = ?auto_18384 ?auto_18371 ) ) ( not ( = ?auto_18384 ?auto_18379 ) ) ( not ( = ?auto_18384 ?auto_18388 ) ) ( not ( = ?auto_18384 ?auto_18391 ) ) ( not ( = ?auto_18384 ?auto_18386 ) ) ( not ( = ?auto_18353 ?auto_18363 ) ) ( not ( = ?auto_18353 ?auto_18393 ) ) ( not ( = ?auto_18354 ?auto_18363 ) ) ( not ( = ?auto_18354 ?auto_18393 ) ) ( not ( = ?auto_18355 ?auto_18363 ) ) ( not ( = ?auto_18355 ?auto_18393 ) ) ( not ( = ?auto_18356 ?auto_18363 ) ) ( not ( = ?auto_18356 ?auto_18393 ) ) ( not ( = ?auto_18357 ?auto_18363 ) ) ( not ( = ?auto_18357 ?auto_18393 ) ) ( not ( = ?auto_18358 ?auto_18363 ) ) ( not ( = ?auto_18358 ?auto_18393 ) ) ( not ( = ?auto_18359 ?auto_18363 ) ) ( not ( = ?auto_18359 ?auto_18393 ) ) ( not ( = ?auto_18362 ?auto_18363 ) ) ( not ( = ?auto_18362 ?auto_18393 ) ) ( not ( = ?auto_18361 ?auto_18363 ) ) ( not ( = ?auto_18361 ?auto_18393 ) ) ( not ( = ?auto_18363 ?auto_18384 ) ) ( not ( = ?auto_18363 ?auto_18376 ) ) ( not ( = ?auto_18363 ?auto_18373 ) ) ( not ( = ?auto_18363 ?auto_18385 ) ) ( not ( = ?auto_18363 ?auto_18371 ) ) ( not ( = ?auto_18363 ?auto_18379 ) ) ( not ( = ?auto_18363 ?auto_18388 ) ) ( not ( = ?auto_18363 ?auto_18391 ) ) ( not ( = ?auto_18363 ?auto_18386 ) ) ( not ( = ?auto_18393 ?auto_18384 ) ) ( not ( = ?auto_18393 ?auto_18376 ) ) ( not ( = ?auto_18393 ?auto_18373 ) ) ( not ( = ?auto_18393 ?auto_18385 ) ) ( not ( = ?auto_18393 ?auto_18371 ) ) ( not ( = ?auto_18393 ?auto_18379 ) ) ( not ( = ?auto_18393 ?auto_18388 ) ) ( not ( = ?auto_18393 ?auto_18391 ) ) ( not ( = ?auto_18393 ?auto_18386 ) ) ( not ( = ?auto_18353 ?auto_18364 ) ) ( not ( = ?auto_18353 ?auto_18370 ) ) ( not ( = ?auto_18354 ?auto_18364 ) ) ( not ( = ?auto_18354 ?auto_18370 ) ) ( not ( = ?auto_18355 ?auto_18364 ) ) ( not ( = ?auto_18355 ?auto_18370 ) ) ( not ( = ?auto_18356 ?auto_18364 ) ) ( not ( = ?auto_18356 ?auto_18370 ) ) ( not ( = ?auto_18357 ?auto_18364 ) ) ( not ( = ?auto_18357 ?auto_18370 ) ) ( not ( = ?auto_18358 ?auto_18364 ) ) ( not ( = ?auto_18358 ?auto_18370 ) ) ( not ( = ?auto_18359 ?auto_18364 ) ) ( not ( = ?auto_18359 ?auto_18370 ) ) ( not ( = ?auto_18362 ?auto_18364 ) ) ( not ( = ?auto_18362 ?auto_18370 ) ) ( not ( = ?auto_18361 ?auto_18364 ) ) ( not ( = ?auto_18361 ?auto_18370 ) ) ( not ( = ?auto_18360 ?auto_18364 ) ) ( not ( = ?auto_18360 ?auto_18370 ) ) ( not ( = ?auto_18364 ?auto_18393 ) ) ( not ( = ?auto_18364 ?auto_18384 ) ) ( not ( = ?auto_18364 ?auto_18376 ) ) ( not ( = ?auto_18364 ?auto_18373 ) ) ( not ( = ?auto_18364 ?auto_18385 ) ) ( not ( = ?auto_18364 ?auto_18371 ) ) ( not ( = ?auto_18364 ?auto_18379 ) ) ( not ( = ?auto_18364 ?auto_18388 ) ) ( not ( = ?auto_18364 ?auto_18391 ) ) ( not ( = ?auto_18364 ?auto_18386 ) ) ( not ( = ?auto_18370 ?auto_18393 ) ) ( not ( = ?auto_18370 ?auto_18384 ) ) ( not ( = ?auto_18370 ?auto_18376 ) ) ( not ( = ?auto_18370 ?auto_18373 ) ) ( not ( = ?auto_18370 ?auto_18385 ) ) ( not ( = ?auto_18370 ?auto_18371 ) ) ( not ( = ?auto_18370 ?auto_18379 ) ) ( not ( = ?auto_18370 ?auto_18388 ) ) ( not ( = ?auto_18370 ?auto_18391 ) ) ( not ( = ?auto_18370 ?auto_18386 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_18353 ?auto_18354 ?auto_18355 ?auto_18356 ?auto_18357 ?auto_18358 ?auto_18359 ?auto_18362 ?auto_18361 ?auto_18360 ?auto_18363 )
      ( MAKE-1CRATE ?auto_18363 ?auto_18364 )
      ( MAKE-11CRATE-VERIFY ?auto_18353 ?auto_18354 ?auto_18355 ?auto_18356 ?auto_18357 ?auto_18358 ?auto_18359 ?auto_18362 ?auto_18361 ?auto_18360 ?auto_18363 ?auto_18364 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18397 - SURFACE
      ?auto_18398 - SURFACE
    )
    :vars
    (
      ?auto_18399 - HOIST
      ?auto_18400 - PLACE
      ?auto_18402 - PLACE
      ?auto_18403 - HOIST
      ?auto_18404 - SURFACE
      ?auto_18401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18399 ?auto_18400 ) ( SURFACE-AT ?auto_18397 ?auto_18400 ) ( CLEAR ?auto_18397 ) ( IS-CRATE ?auto_18398 ) ( AVAILABLE ?auto_18399 ) ( not ( = ?auto_18402 ?auto_18400 ) ) ( HOIST-AT ?auto_18403 ?auto_18402 ) ( AVAILABLE ?auto_18403 ) ( SURFACE-AT ?auto_18398 ?auto_18402 ) ( ON ?auto_18398 ?auto_18404 ) ( CLEAR ?auto_18398 ) ( TRUCK-AT ?auto_18401 ?auto_18400 ) ( not ( = ?auto_18397 ?auto_18398 ) ) ( not ( = ?auto_18397 ?auto_18404 ) ) ( not ( = ?auto_18398 ?auto_18404 ) ) ( not ( = ?auto_18399 ?auto_18403 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18401 ?auto_18400 ?auto_18402 )
      ( !LIFT ?auto_18403 ?auto_18398 ?auto_18404 ?auto_18402 )
      ( !LOAD ?auto_18403 ?auto_18398 ?auto_18401 ?auto_18402 )
      ( !DRIVE ?auto_18401 ?auto_18402 ?auto_18400 )
      ( !UNLOAD ?auto_18399 ?auto_18398 ?auto_18401 ?auto_18400 )
      ( !DROP ?auto_18399 ?auto_18398 ?auto_18397 ?auto_18400 )
      ( MAKE-1CRATE-VERIFY ?auto_18397 ?auto_18398 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_18418 - SURFACE
      ?auto_18419 - SURFACE
      ?auto_18420 - SURFACE
      ?auto_18421 - SURFACE
      ?auto_18422 - SURFACE
      ?auto_18423 - SURFACE
      ?auto_18424 - SURFACE
      ?auto_18427 - SURFACE
      ?auto_18426 - SURFACE
      ?auto_18425 - SURFACE
      ?auto_18428 - SURFACE
      ?auto_18429 - SURFACE
      ?auto_18430 - SURFACE
    )
    :vars
    (
      ?auto_18436 - HOIST
      ?auto_18431 - PLACE
      ?auto_18435 - PLACE
      ?auto_18433 - HOIST
      ?auto_18432 - SURFACE
      ?auto_18439 - PLACE
      ?auto_18462 - HOIST
      ?auto_18460 - SURFACE
      ?auto_18458 - PLACE
      ?auto_18461 - HOIST
      ?auto_18446 - SURFACE
      ?auto_18454 - SURFACE
      ?auto_18449 - PLACE
      ?auto_18450 - HOIST
      ?auto_18442 - SURFACE
      ?auto_18437 - SURFACE
      ?auto_18452 - PLACE
      ?auto_18453 - HOIST
      ?auto_18451 - SURFACE
      ?auto_18459 - PLACE
      ?auto_18441 - HOIST
      ?auto_18445 - SURFACE
      ?auto_18444 - SURFACE
      ?auto_18456 - PLACE
      ?auto_18443 - HOIST
      ?auto_18448 - SURFACE
      ?auto_18438 - PLACE
      ?auto_18440 - HOIST
      ?auto_18457 - SURFACE
      ?auto_18455 - PLACE
      ?auto_18447 - HOIST
      ?auto_18463 - SURFACE
      ?auto_18434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18436 ?auto_18431 ) ( IS-CRATE ?auto_18430 ) ( not ( = ?auto_18435 ?auto_18431 ) ) ( HOIST-AT ?auto_18433 ?auto_18435 ) ( AVAILABLE ?auto_18433 ) ( SURFACE-AT ?auto_18430 ?auto_18435 ) ( ON ?auto_18430 ?auto_18432 ) ( CLEAR ?auto_18430 ) ( not ( = ?auto_18429 ?auto_18430 ) ) ( not ( = ?auto_18429 ?auto_18432 ) ) ( not ( = ?auto_18430 ?auto_18432 ) ) ( not ( = ?auto_18436 ?auto_18433 ) ) ( IS-CRATE ?auto_18429 ) ( not ( = ?auto_18439 ?auto_18431 ) ) ( HOIST-AT ?auto_18462 ?auto_18439 ) ( SURFACE-AT ?auto_18429 ?auto_18439 ) ( ON ?auto_18429 ?auto_18460 ) ( CLEAR ?auto_18429 ) ( not ( = ?auto_18428 ?auto_18429 ) ) ( not ( = ?auto_18428 ?auto_18460 ) ) ( not ( = ?auto_18429 ?auto_18460 ) ) ( not ( = ?auto_18436 ?auto_18462 ) ) ( IS-CRATE ?auto_18428 ) ( not ( = ?auto_18458 ?auto_18431 ) ) ( HOIST-AT ?auto_18461 ?auto_18458 ) ( SURFACE-AT ?auto_18428 ?auto_18458 ) ( ON ?auto_18428 ?auto_18446 ) ( CLEAR ?auto_18428 ) ( not ( = ?auto_18425 ?auto_18428 ) ) ( not ( = ?auto_18425 ?auto_18446 ) ) ( not ( = ?auto_18428 ?auto_18446 ) ) ( not ( = ?auto_18436 ?auto_18461 ) ) ( IS-CRATE ?auto_18425 ) ( AVAILABLE ?auto_18462 ) ( SURFACE-AT ?auto_18425 ?auto_18439 ) ( ON ?auto_18425 ?auto_18454 ) ( CLEAR ?auto_18425 ) ( not ( = ?auto_18426 ?auto_18425 ) ) ( not ( = ?auto_18426 ?auto_18454 ) ) ( not ( = ?auto_18425 ?auto_18454 ) ) ( IS-CRATE ?auto_18426 ) ( not ( = ?auto_18449 ?auto_18431 ) ) ( HOIST-AT ?auto_18450 ?auto_18449 ) ( AVAILABLE ?auto_18450 ) ( SURFACE-AT ?auto_18426 ?auto_18449 ) ( ON ?auto_18426 ?auto_18442 ) ( CLEAR ?auto_18426 ) ( not ( = ?auto_18427 ?auto_18426 ) ) ( not ( = ?auto_18427 ?auto_18442 ) ) ( not ( = ?auto_18426 ?auto_18442 ) ) ( not ( = ?auto_18436 ?auto_18450 ) ) ( IS-CRATE ?auto_18427 ) ( SURFACE-AT ?auto_18427 ?auto_18458 ) ( ON ?auto_18427 ?auto_18437 ) ( CLEAR ?auto_18427 ) ( not ( = ?auto_18424 ?auto_18427 ) ) ( not ( = ?auto_18424 ?auto_18437 ) ) ( not ( = ?auto_18427 ?auto_18437 ) ) ( IS-CRATE ?auto_18424 ) ( not ( = ?auto_18452 ?auto_18431 ) ) ( HOIST-AT ?auto_18453 ?auto_18452 ) ( AVAILABLE ?auto_18453 ) ( SURFACE-AT ?auto_18424 ?auto_18452 ) ( ON ?auto_18424 ?auto_18451 ) ( CLEAR ?auto_18424 ) ( not ( = ?auto_18423 ?auto_18424 ) ) ( not ( = ?auto_18423 ?auto_18451 ) ) ( not ( = ?auto_18424 ?auto_18451 ) ) ( not ( = ?auto_18436 ?auto_18453 ) ) ( IS-CRATE ?auto_18423 ) ( not ( = ?auto_18459 ?auto_18431 ) ) ( HOIST-AT ?auto_18441 ?auto_18459 ) ( AVAILABLE ?auto_18441 ) ( SURFACE-AT ?auto_18423 ?auto_18459 ) ( ON ?auto_18423 ?auto_18445 ) ( CLEAR ?auto_18423 ) ( not ( = ?auto_18422 ?auto_18423 ) ) ( not ( = ?auto_18422 ?auto_18445 ) ) ( not ( = ?auto_18423 ?auto_18445 ) ) ( not ( = ?auto_18436 ?auto_18441 ) ) ( IS-CRATE ?auto_18422 ) ( AVAILABLE ?auto_18461 ) ( SURFACE-AT ?auto_18422 ?auto_18458 ) ( ON ?auto_18422 ?auto_18444 ) ( CLEAR ?auto_18422 ) ( not ( = ?auto_18421 ?auto_18422 ) ) ( not ( = ?auto_18421 ?auto_18444 ) ) ( not ( = ?auto_18422 ?auto_18444 ) ) ( IS-CRATE ?auto_18421 ) ( not ( = ?auto_18456 ?auto_18431 ) ) ( HOIST-AT ?auto_18443 ?auto_18456 ) ( AVAILABLE ?auto_18443 ) ( SURFACE-AT ?auto_18421 ?auto_18456 ) ( ON ?auto_18421 ?auto_18448 ) ( CLEAR ?auto_18421 ) ( not ( = ?auto_18420 ?auto_18421 ) ) ( not ( = ?auto_18420 ?auto_18448 ) ) ( not ( = ?auto_18421 ?auto_18448 ) ) ( not ( = ?auto_18436 ?auto_18443 ) ) ( IS-CRATE ?auto_18420 ) ( not ( = ?auto_18438 ?auto_18431 ) ) ( HOIST-AT ?auto_18440 ?auto_18438 ) ( AVAILABLE ?auto_18440 ) ( SURFACE-AT ?auto_18420 ?auto_18438 ) ( ON ?auto_18420 ?auto_18457 ) ( CLEAR ?auto_18420 ) ( not ( = ?auto_18419 ?auto_18420 ) ) ( not ( = ?auto_18419 ?auto_18457 ) ) ( not ( = ?auto_18420 ?auto_18457 ) ) ( not ( = ?auto_18436 ?auto_18440 ) ) ( SURFACE-AT ?auto_18418 ?auto_18431 ) ( CLEAR ?auto_18418 ) ( IS-CRATE ?auto_18419 ) ( AVAILABLE ?auto_18436 ) ( not ( = ?auto_18455 ?auto_18431 ) ) ( HOIST-AT ?auto_18447 ?auto_18455 ) ( AVAILABLE ?auto_18447 ) ( SURFACE-AT ?auto_18419 ?auto_18455 ) ( ON ?auto_18419 ?auto_18463 ) ( CLEAR ?auto_18419 ) ( TRUCK-AT ?auto_18434 ?auto_18431 ) ( not ( = ?auto_18418 ?auto_18419 ) ) ( not ( = ?auto_18418 ?auto_18463 ) ) ( not ( = ?auto_18419 ?auto_18463 ) ) ( not ( = ?auto_18436 ?auto_18447 ) ) ( not ( = ?auto_18418 ?auto_18420 ) ) ( not ( = ?auto_18418 ?auto_18457 ) ) ( not ( = ?auto_18420 ?auto_18463 ) ) ( not ( = ?auto_18438 ?auto_18455 ) ) ( not ( = ?auto_18440 ?auto_18447 ) ) ( not ( = ?auto_18457 ?auto_18463 ) ) ( not ( = ?auto_18418 ?auto_18421 ) ) ( not ( = ?auto_18418 ?auto_18448 ) ) ( not ( = ?auto_18419 ?auto_18421 ) ) ( not ( = ?auto_18419 ?auto_18448 ) ) ( not ( = ?auto_18421 ?auto_18457 ) ) ( not ( = ?auto_18421 ?auto_18463 ) ) ( not ( = ?auto_18456 ?auto_18438 ) ) ( not ( = ?auto_18456 ?auto_18455 ) ) ( not ( = ?auto_18443 ?auto_18440 ) ) ( not ( = ?auto_18443 ?auto_18447 ) ) ( not ( = ?auto_18448 ?auto_18457 ) ) ( not ( = ?auto_18448 ?auto_18463 ) ) ( not ( = ?auto_18418 ?auto_18422 ) ) ( not ( = ?auto_18418 ?auto_18444 ) ) ( not ( = ?auto_18419 ?auto_18422 ) ) ( not ( = ?auto_18419 ?auto_18444 ) ) ( not ( = ?auto_18420 ?auto_18422 ) ) ( not ( = ?auto_18420 ?auto_18444 ) ) ( not ( = ?auto_18422 ?auto_18448 ) ) ( not ( = ?auto_18422 ?auto_18457 ) ) ( not ( = ?auto_18422 ?auto_18463 ) ) ( not ( = ?auto_18458 ?auto_18456 ) ) ( not ( = ?auto_18458 ?auto_18438 ) ) ( not ( = ?auto_18458 ?auto_18455 ) ) ( not ( = ?auto_18461 ?auto_18443 ) ) ( not ( = ?auto_18461 ?auto_18440 ) ) ( not ( = ?auto_18461 ?auto_18447 ) ) ( not ( = ?auto_18444 ?auto_18448 ) ) ( not ( = ?auto_18444 ?auto_18457 ) ) ( not ( = ?auto_18444 ?auto_18463 ) ) ( not ( = ?auto_18418 ?auto_18423 ) ) ( not ( = ?auto_18418 ?auto_18445 ) ) ( not ( = ?auto_18419 ?auto_18423 ) ) ( not ( = ?auto_18419 ?auto_18445 ) ) ( not ( = ?auto_18420 ?auto_18423 ) ) ( not ( = ?auto_18420 ?auto_18445 ) ) ( not ( = ?auto_18421 ?auto_18423 ) ) ( not ( = ?auto_18421 ?auto_18445 ) ) ( not ( = ?auto_18423 ?auto_18444 ) ) ( not ( = ?auto_18423 ?auto_18448 ) ) ( not ( = ?auto_18423 ?auto_18457 ) ) ( not ( = ?auto_18423 ?auto_18463 ) ) ( not ( = ?auto_18459 ?auto_18458 ) ) ( not ( = ?auto_18459 ?auto_18456 ) ) ( not ( = ?auto_18459 ?auto_18438 ) ) ( not ( = ?auto_18459 ?auto_18455 ) ) ( not ( = ?auto_18441 ?auto_18461 ) ) ( not ( = ?auto_18441 ?auto_18443 ) ) ( not ( = ?auto_18441 ?auto_18440 ) ) ( not ( = ?auto_18441 ?auto_18447 ) ) ( not ( = ?auto_18445 ?auto_18444 ) ) ( not ( = ?auto_18445 ?auto_18448 ) ) ( not ( = ?auto_18445 ?auto_18457 ) ) ( not ( = ?auto_18445 ?auto_18463 ) ) ( not ( = ?auto_18418 ?auto_18424 ) ) ( not ( = ?auto_18418 ?auto_18451 ) ) ( not ( = ?auto_18419 ?auto_18424 ) ) ( not ( = ?auto_18419 ?auto_18451 ) ) ( not ( = ?auto_18420 ?auto_18424 ) ) ( not ( = ?auto_18420 ?auto_18451 ) ) ( not ( = ?auto_18421 ?auto_18424 ) ) ( not ( = ?auto_18421 ?auto_18451 ) ) ( not ( = ?auto_18422 ?auto_18424 ) ) ( not ( = ?auto_18422 ?auto_18451 ) ) ( not ( = ?auto_18424 ?auto_18445 ) ) ( not ( = ?auto_18424 ?auto_18444 ) ) ( not ( = ?auto_18424 ?auto_18448 ) ) ( not ( = ?auto_18424 ?auto_18457 ) ) ( not ( = ?auto_18424 ?auto_18463 ) ) ( not ( = ?auto_18452 ?auto_18459 ) ) ( not ( = ?auto_18452 ?auto_18458 ) ) ( not ( = ?auto_18452 ?auto_18456 ) ) ( not ( = ?auto_18452 ?auto_18438 ) ) ( not ( = ?auto_18452 ?auto_18455 ) ) ( not ( = ?auto_18453 ?auto_18441 ) ) ( not ( = ?auto_18453 ?auto_18461 ) ) ( not ( = ?auto_18453 ?auto_18443 ) ) ( not ( = ?auto_18453 ?auto_18440 ) ) ( not ( = ?auto_18453 ?auto_18447 ) ) ( not ( = ?auto_18451 ?auto_18445 ) ) ( not ( = ?auto_18451 ?auto_18444 ) ) ( not ( = ?auto_18451 ?auto_18448 ) ) ( not ( = ?auto_18451 ?auto_18457 ) ) ( not ( = ?auto_18451 ?auto_18463 ) ) ( not ( = ?auto_18418 ?auto_18427 ) ) ( not ( = ?auto_18418 ?auto_18437 ) ) ( not ( = ?auto_18419 ?auto_18427 ) ) ( not ( = ?auto_18419 ?auto_18437 ) ) ( not ( = ?auto_18420 ?auto_18427 ) ) ( not ( = ?auto_18420 ?auto_18437 ) ) ( not ( = ?auto_18421 ?auto_18427 ) ) ( not ( = ?auto_18421 ?auto_18437 ) ) ( not ( = ?auto_18422 ?auto_18427 ) ) ( not ( = ?auto_18422 ?auto_18437 ) ) ( not ( = ?auto_18423 ?auto_18427 ) ) ( not ( = ?auto_18423 ?auto_18437 ) ) ( not ( = ?auto_18427 ?auto_18451 ) ) ( not ( = ?auto_18427 ?auto_18445 ) ) ( not ( = ?auto_18427 ?auto_18444 ) ) ( not ( = ?auto_18427 ?auto_18448 ) ) ( not ( = ?auto_18427 ?auto_18457 ) ) ( not ( = ?auto_18427 ?auto_18463 ) ) ( not ( = ?auto_18437 ?auto_18451 ) ) ( not ( = ?auto_18437 ?auto_18445 ) ) ( not ( = ?auto_18437 ?auto_18444 ) ) ( not ( = ?auto_18437 ?auto_18448 ) ) ( not ( = ?auto_18437 ?auto_18457 ) ) ( not ( = ?auto_18437 ?auto_18463 ) ) ( not ( = ?auto_18418 ?auto_18426 ) ) ( not ( = ?auto_18418 ?auto_18442 ) ) ( not ( = ?auto_18419 ?auto_18426 ) ) ( not ( = ?auto_18419 ?auto_18442 ) ) ( not ( = ?auto_18420 ?auto_18426 ) ) ( not ( = ?auto_18420 ?auto_18442 ) ) ( not ( = ?auto_18421 ?auto_18426 ) ) ( not ( = ?auto_18421 ?auto_18442 ) ) ( not ( = ?auto_18422 ?auto_18426 ) ) ( not ( = ?auto_18422 ?auto_18442 ) ) ( not ( = ?auto_18423 ?auto_18426 ) ) ( not ( = ?auto_18423 ?auto_18442 ) ) ( not ( = ?auto_18424 ?auto_18426 ) ) ( not ( = ?auto_18424 ?auto_18442 ) ) ( not ( = ?auto_18426 ?auto_18437 ) ) ( not ( = ?auto_18426 ?auto_18451 ) ) ( not ( = ?auto_18426 ?auto_18445 ) ) ( not ( = ?auto_18426 ?auto_18444 ) ) ( not ( = ?auto_18426 ?auto_18448 ) ) ( not ( = ?auto_18426 ?auto_18457 ) ) ( not ( = ?auto_18426 ?auto_18463 ) ) ( not ( = ?auto_18449 ?auto_18458 ) ) ( not ( = ?auto_18449 ?auto_18452 ) ) ( not ( = ?auto_18449 ?auto_18459 ) ) ( not ( = ?auto_18449 ?auto_18456 ) ) ( not ( = ?auto_18449 ?auto_18438 ) ) ( not ( = ?auto_18449 ?auto_18455 ) ) ( not ( = ?auto_18450 ?auto_18461 ) ) ( not ( = ?auto_18450 ?auto_18453 ) ) ( not ( = ?auto_18450 ?auto_18441 ) ) ( not ( = ?auto_18450 ?auto_18443 ) ) ( not ( = ?auto_18450 ?auto_18440 ) ) ( not ( = ?auto_18450 ?auto_18447 ) ) ( not ( = ?auto_18442 ?auto_18437 ) ) ( not ( = ?auto_18442 ?auto_18451 ) ) ( not ( = ?auto_18442 ?auto_18445 ) ) ( not ( = ?auto_18442 ?auto_18444 ) ) ( not ( = ?auto_18442 ?auto_18448 ) ) ( not ( = ?auto_18442 ?auto_18457 ) ) ( not ( = ?auto_18442 ?auto_18463 ) ) ( not ( = ?auto_18418 ?auto_18425 ) ) ( not ( = ?auto_18418 ?auto_18454 ) ) ( not ( = ?auto_18419 ?auto_18425 ) ) ( not ( = ?auto_18419 ?auto_18454 ) ) ( not ( = ?auto_18420 ?auto_18425 ) ) ( not ( = ?auto_18420 ?auto_18454 ) ) ( not ( = ?auto_18421 ?auto_18425 ) ) ( not ( = ?auto_18421 ?auto_18454 ) ) ( not ( = ?auto_18422 ?auto_18425 ) ) ( not ( = ?auto_18422 ?auto_18454 ) ) ( not ( = ?auto_18423 ?auto_18425 ) ) ( not ( = ?auto_18423 ?auto_18454 ) ) ( not ( = ?auto_18424 ?auto_18425 ) ) ( not ( = ?auto_18424 ?auto_18454 ) ) ( not ( = ?auto_18427 ?auto_18425 ) ) ( not ( = ?auto_18427 ?auto_18454 ) ) ( not ( = ?auto_18425 ?auto_18442 ) ) ( not ( = ?auto_18425 ?auto_18437 ) ) ( not ( = ?auto_18425 ?auto_18451 ) ) ( not ( = ?auto_18425 ?auto_18445 ) ) ( not ( = ?auto_18425 ?auto_18444 ) ) ( not ( = ?auto_18425 ?auto_18448 ) ) ( not ( = ?auto_18425 ?auto_18457 ) ) ( not ( = ?auto_18425 ?auto_18463 ) ) ( not ( = ?auto_18439 ?auto_18449 ) ) ( not ( = ?auto_18439 ?auto_18458 ) ) ( not ( = ?auto_18439 ?auto_18452 ) ) ( not ( = ?auto_18439 ?auto_18459 ) ) ( not ( = ?auto_18439 ?auto_18456 ) ) ( not ( = ?auto_18439 ?auto_18438 ) ) ( not ( = ?auto_18439 ?auto_18455 ) ) ( not ( = ?auto_18462 ?auto_18450 ) ) ( not ( = ?auto_18462 ?auto_18461 ) ) ( not ( = ?auto_18462 ?auto_18453 ) ) ( not ( = ?auto_18462 ?auto_18441 ) ) ( not ( = ?auto_18462 ?auto_18443 ) ) ( not ( = ?auto_18462 ?auto_18440 ) ) ( not ( = ?auto_18462 ?auto_18447 ) ) ( not ( = ?auto_18454 ?auto_18442 ) ) ( not ( = ?auto_18454 ?auto_18437 ) ) ( not ( = ?auto_18454 ?auto_18451 ) ) ( not ( = ?auto_18454 ?auto_18445 ) ) ( not ( = ?auto_18454 ?auto_18444 ) ) ( not ( = ?auto_18454 ?auto_18448 ) ) ( not ( = ?auto_18454 ?auto_18457 ) ) ( not ( = ?auto_18454 ?auto_18463 ) ) ( not ( = ?auto_18418 ?auto_18428 ) ) ( not ( = ?auto_18418 ?auto_18446 ) ) ( not ( = ?auto_18419 ?auto_18428 ) ) ( not ( = ?auto_18419 ?auto_18446 ) ) ( not ( = ?auto_18420 ?auto_18428 ) ) ( not ( = ?auto_18420 ?auto_18446 ) ) ( not ( = ?auto_18421 ?auto_18428 ) ) ( not ( = ?auto_18421 ?auto_18446 ) ) ( not ( = ?auto_18422 ?auto_18428 ) ) ( not ( = ?auto_18422 ?auto_18446 ) ) ( not ( = ?auto_18423 ?auto_18428 ) ) ( not ( = ?auto_18423 ?auto_18446 ) ) ( not ( = ?auto_18424 ?auto_18428 ) ) ( not ( = ?auto_18424 ?auto_18446 ) ) ( not ( = ?auto_18427 ?auto_18428 ) ) ( not ( = ?auto_18427 ?auto_18446 ) ) ( not ( = ?auto_18426 ?auto_18428 ) ) ( not ( = ?auto_18426 ?auto_18446 ) ) ( not ( = ?auto_18428 ?auto_18454 ) ) ( not ( = ?auto_18428 ?auto_18442 ) ) ( not ( = ?auto_18428 ?auto_18437 ) ) ( not ( = ?auto_18428 ?auto_18451 ) ) ( not ( = ?auto_18428 ?auto_18445 ) ) ( not ( = ?auto_18428 ?auto_18444 ) ) ( not ( = ?auto_18428 ?auto_18448 ) ) ( not ( = ?auto_18428 ?auto_18457 ) ) ( not ( = ?auto_18428 ?auto_18463 ) ) ( not ( = ?auto_18446 ?auto_18454 ) ) ( not ( = ?auto_18446 ?auto_18442 ) ) ( not ( = ?auto_18446 ?auto_18437 ) ) ( not ( = ?auto_18446 ?auto_18451 ) ) ( not ( = ?auto_18446 ?auto_18445 ) ) ( not ( = ?auto_18446 ?auto_18444 ) ) ( not ( = ?auto_18446 ?auto_18448 ) ) ( not ( = ?auto_18446 ?auto_18457 ) ) ( not ( = ?auto_18446 ?auto_18463 ) ) ( not ( = ?auto_18418 ?auto_18429 ) ) ( not ( = ?auto_18418 ?auto_18460 ) ) ( not ( = ?auto_18419 ?auto_18429 ) ) ( not ( = ?auto_18419 ?auto_18460 ) ) ( not ( = ?auto_18420 ?auto_18429 ) ) ( not ( = ?auto_18420 ?auto_18460 ) ) ( not ( = ?auto_18421 ?auto_18429 ) ) ( not ( = ?auto_18421 ?auto_18460 ) ) ( not ( = ?auto_18422 ?auto_18429 ) ) ( not ( = ?auto_18422 ?auto_18460 ) ) ( not ( = ?auto_18423 ?auto_18429 ) ) ( not ( = ?auto_18423 ?auto_18460 ) ) ( not ( = ?auto_18424 ?auto_18429 ) ) ( not ( = ?auto_18424 ?auto_18460 ) ) ( not ( = ?auto_18427 ?auto_18429 ) ) ( not ( = ?auto_18427 ?auto_18460 ) ) ( not ( = ?auto_18426 ?auto_18429 ) ) ( not ( = ?auto_18426 ?auto_18460 ) ) ( not ( = ?auto_18425 ?auto_18429 ) ) ( not ( = ?auto_18425 ?auto_18460 ) ) ( not ( = ?auto_18429 ?auto_18446 ) ) ( not ( = ?auto_18429 ?auto_18454 ) ) ( not ( = ?auto_18429 ?auto_18442 ) ) ( not ( = ?auto_18429 ?auto_18437 ) ) ( not ( = ?auto_18429 ?auto_18451 ) ) ( not ( = ?auto_18429 ?auto_18445 ) ) ( not ( = ?auto_18429 ?auto_18444 ) ) ( not ( = ?auto_18429 ?auto_18448 ) ) ( not ( = ?auto_18429 ?auto_18457 ) ) ( not ( = ?auto_18429 ?auto_18463 ) ) ( not ( = ?auto_18460 ?auto_18446 ) ) ( not ( = ?auto_18460 ?auto_18454 ) ) ( not ( = ?auto_18460 ?auto_18442 ) ) ( not ( = ?auto_18460 ?auto_18437 ) ) ( not ( = ?auto_18460 ?auto_18451 ) ) ( not ( = ?auto_18460 ?auto_18445 ) ) ( not ( = ?auto_18460 ?auto_18444 ) ) ( not ( = ?auto_18460 ?auto_18448 ) ) ( not ( = ?auto_18460 ?auto_18457 ) ) ( not ( = ?auto_18460 ?auto_18463 ) ) ( not ( = ?auto_18418 ?auto_18430 ) ) ( not ( = ?auto_18418 ?auto_18432 ) ) ( not ( = ?auto_18419 ?auto_18430 ) ) ( not ( = ?auto_18419 ?auto_18432 ) ) ( not ( = ?auto_18420 ?auto_18430 ) ) ( not ( = ?auto_18420 ?auto_18432 ) ) ( not ( = ?auto_18421 ?auto_18430 ) ) ( not ( = ?auto_18421 ?auto_18432 ) ) ( not ( = ?auto_18422 ?auto_18430 ) ) ( not ( = ?auto_18422 ?auto_18432 ) ) ( not ( = ?auto_18423 ?auto_18430 ) ) ( not ( = ?auto_18423 ?auto_18432 ) ) ( not ( = ?auto_18424 ?auto_18430 ) ) ( not ( = ?auto_18424 ?auto_18432 ) ) ( not ( = ?auto_18427 ?auto_18430 ) ) ( not ( = ?auto_18427 ?auto_18432 ) ) ( not ( = ?auto_18426 ?auto_18430 ) ) ( not ( = ?auto_18426 ?auto_18432 ) ) ( not ( = ?auto_18425 ?auto_18430 ) ) ( not ( = ?auto_18425 ?auto_18432 ) ) ( not ( = ?auto_18428 ?auto_18430 ) ) ( not ( = ?auto_18428 ?auto_18432 ) ) ( not ( = ?auto_18430 ?auto_18460 ) ) ( not ( = ?auto_18430 ?auto_18446 ) ) ( not ( = ?auto_18430 ?auto_18454 ) ) ( not ( = ?auto_18430 ?auto_18442 ) ) ( not ( = ?auto_18430 ?auto_18437 ) ) ( not ( = ?auto_18430 ?auto_18451 ) ) ( not ( = ?auto_18430 ?auto_18445 ) ) ( not ( = ?auto_18430 ?auto_18444 ) ) ( not ( = ?auto_18430 ?auto_18448 ) ) ( not ( = ?auto_18430 ?auto_18457 ) ) ( not ( = ?auto_18430 ?auto_18463 ) ) ( not ( = ?auto_18435 ?auto_18439 ) ) ( not ( = ?auto_18435 ?auto_18458 ) ) ( not ( = ?auto_18435 ?auto_18449 ) ) ( not ( = ?auto_18435 ?auto_18452 ) ) ( not ( = ?auto_18435 ?auto_18459 ) ) ( not ( = ?auto_18435 ?auto_18456 ) ) ( not ( = ?auto_18435 ?auto_18438 ) ) ( not ( = ?auto_18435 ?auto_18455 ) ) ( not ( = ?auto_18433 ?auto_18462 ) ) ( not ( = ?auto_18433 ?auto_18461 ) ) ( not ( = ?auto_18433 ?auto_18450 ) ) ( not ( = ?auto_18433 ?auto_18453 ) ) ( not ( = ?auto_18433 ?auto_18441 ) ) ( not ( = ?auto_18433 ?auto_18443 ) ) ( not ( = ?auto_18433 ?auto_18440 ) ) ( not ( = ?auto_18433 ?auto_18447 ) ) ( not ( = ?auto_18432 ?auto_18460 ) ) ( not ( = ?auto_18432 ?auto_18446 ) ) ( not ( = ?auto_18432 ?auto_18454 ) ) ( not ( = ?auto_18432 ?auto_18442 ) ) ( not ( = ?auto_18432 ?auto_18437 ) ) ( not ( = ?auto_18432 ?auto_18451 ) ) ( not ( = ?auto_18432 ?auto_18445 ) ) ( not ( = ?auto_18432 ?auto_18444 ) ) ( not ( = ?auto_18432 ?auto_18448 ) ) ( not ( = ?auto_18432 ?auto_18457 ) ) ( not ( = ?auto_18432 ?auto_18463 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_18418 ?auto_18419 ?auto_18420 ?auto_18421 ?auto_18422 ?auto_18423 ?auto_18424 ?auto_18427 ?auto_18426 ?auto_18425 ?auto_18428 ?auto_18429 )
      ( MAKE-1CRATE ?auto_18429 ?auto_18430 )
      ( MAKE-12CRATE-VERIFY ?auto_18418 ?auto_18419 ?auto_18420 ?auto_18421 ?auto_18422 ?auto_18423 ?auto_18424 ?auto_18427 ?auto_18426 ?auto_18425 ?auto_18428 ?auto_18429 ?auto_18430 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18466 - SURFACE
      ?auto_18467 - SURFACE
    )
    :vars
    (
      ?auto_18468 - HOIST
      ?auto_18469 - PLACE
      ?auto_18471 - PLACE
      ?auto_18472 - HOIST
      ?auto_18473 - SURFACE
      ?auto_18470 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18468 ?auto_18469 ) ( SURFACE-AT ?auto_18466 ?auto_18469 ) ( CLEAR ?auto_18466 ) ( IS-CRATE ?auto_18467 ) ( AVAILABLE ?auto_18468 ) ( not ( = ?auto_18471 ?auto_18469 ) ) ( HOIST-AT ?auto_18472 ?auto_18471 ) ( AVAILABLE ?auto_18472 ) ( SURFACE-AT ?auto_18467 ?auto_18471 ) ( ON ?auto_18467 ?auto_18473 ) ( CLEAR ?auto_18467 ) ( TRUCK-AT ?auto_18470 ?auto_18469 ) ( not ( = ?auto_18466 ?auto_18467 ) ) ( not ( = ?auto_18466 ?auto_18473 ) ) ( not ( = ?auto_18467 ?auto_18473 ) ) ( not ( = ?auto_18468 ?auto_18472 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18470 ?auto_18469 ?auto_18471 )
      ( !LIFT ?auto_18472 ?auto_18467 ?auto_18473 ?auto_18471 )
      ( !LOAD ?auto_18472 ?auto_18467 ?auto_18470 ?auto_18471 )
      ( !DRIVE ?auto_18470 ?auto_18471 ?auto_18469 )
      ( !UNLOAD ?auto_18468 ?auto_18467 ?auto_18470 ?auto_18469 )
      ( !DROP ?auto_18468 ?auto_18467 ?auto_18466 ?auto_18469 )
      ( MAKE-1CRATE-VERIFY ?auto_18466 ?auto_18467 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_18488 - SURFACE
      ?auto_18489 - SURFACE
      ?auto_18490 - SURFACE
      ?auto_18491 - SURFACE
      ?auto_18492 - SURFACE
      ?auto_18493 - SURFACE
      ?auto_18494 - SURFACE
      ?auto_18497 - SURFACE
      ?auto_18496 - SURFACE
      ?auto_18495 - SURFACE
      ?auto_18498 - SURFACE
      ?auto_18499 - SURFACE
      ?auto_18500 - SURFACE
      ?auto_18501 - SURFACE
    )
    :vars
    (
      ?auto_18507 - HOIST
      ?auto_18505 - PLACE
      ?auto_18503 - PLACE
      ?auto_18504 - HOIST
      ?auto_18502 - SURFACE
      ?auto_18511 - PLACE
      ?auto_18519 - HOIST
      ?auto_18535 - SURFACE
      ?auto_18533 - PLACE
      ?auto_18513 - HOIST
      ?auto_18509 - SURFACE
      ?auto_18530 - PLACE
      ?auto_18526 - HOIST
      ?auto_18529 - SURFACE
      ?auto_18521 - SURFACE
      ?auto_18508 - PLACE
      ?auto_18537 - HOIST
      ?auto_18532 - SURFACE
      ?auto_18510 - SURFACE
      ?auto_18524 - PLACE
      ?auto_18534 - HOIST
      ?auto_18522 - SURFACE
      ?auto_18520 - PLACE
      ?auto_18523 - HOIST
      ?auto_18516 - SURFACE
      ?auto_18512 - SURFACE
      ?auto_18528 - PLACE
      ?auto_18518 - HOIST
      ?auto_18514 - SURFACE
      ?auto_18517 - PLACE
      ?auto_18531 - HOIST
      ?auto_18515 - SURFACE
      ?auto_18525 - PLACE
      ?auto_18527 - HOIST
      ?auto_18536 - SURFACE
      ?auto_18506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18507 ?auto_18505 ) ( IS-CRATE ?auto_18501 ) ( not ( = ?auto_18503 ?auto_18505 ) ) ( HOIST-AT ?auto_18504 ?auto_18503 ) ( AVAILABLE ?auto_18504 ) ( SURFACE-AT ?auto_18501 ?auto_18503 ) ( ON ?auto_18501 ?auto_18502 ) ( CLEAR ?auto_18501 ) ( not ( = ?auto_18500 ?auto_18501 ) ) ( not ( = ?auto_18500 ?auto_18502 ) ) ( not ( = ?auto_18501 ?auto_18502 ) ) ( not ( = ?auto_18507 ?auto_18504 ) ) ( IS-CRATE ?auto_18500 ) ( not ( = ?auto_18511 ?auto_18505 ) ) ( HOIST-AT ?auto_18519 ?auto_18511 ) ( AVAILABLE ?auto_18519 ) ( SURFACE-AT ?auto_18500 ?auto_18511 ) ( ON ?auto_18500 ?auto_18535 ) ( CLEAR ?auto_18500 ) ( not ( = ?auto_18499 ?auto_18500 ) ) ( not ( = ?auto_18499 ?auto_18535 ) ) ( not ( = ?auto_18500 ?auto_18535 ) ) ( not ( = ?auto_18507 ?auto_18519 ) ) ( IS-CRATE ?auto_18499 ) ( not ( = ?auto_18533 ?auto_18505 ) ) ( HOIST-AT ?auto_18513 ?auto_18533 ) ( SURFACE-AT ?auto_18499 ?auto_18533 ) ( ON ?auto_18499 ?auto_18509 ) ( CLEAR ?auto_18499 ) ( not ( = ?auto_18498 ?auto_18499 ) ) ( not ( = ?auto_18498 ?auto_18509 ) ) ( not ( = ?auto_18499 ?auto_18509 ) ) ( not ( = ?auto_18507 ?auto_18513 ) ) ( IS-CRATE ?auto_18498 ) ( not ( = ?auto_18530 ?auto_18505 ) ) ( HOIST-AT ?auto_18526 ?auto_18530 ) ( SURFACE-AT ?auto_18498 ?auto_18530 ) ( ON ?auto_18498 ?auto_18529 ) ( CLEAR ?auto_18498 ) ( not ( = ?auto_18495 ?auto_18498 ) ) ( not ( = ?auto_18495 ?auto_18529 ) ) ( not ( = ?auto_18498 ?auto_18529 ) ) ( not ( = ?auto_18507 ?auto_18526 ) ) ( IS-CRATE ?auto_18495 ) ( AVAILABLE ?auto_18513 ) ( SURFACE-AT ?auto_18495 ?auto_18533 ) ( ON ?auto_18495 ?auto_18521 ) ( CLEAR ?auto_18495 ) ( not ( = ?auto_18496 ?auto_18495 ) ) ( not ( = ?auto_18496 ?auto_18521 ) ) ( not ( = ?auto_18495 ?auto_18521 ) ) ( IS-CRATE ?auto_18496 ) ( not ( = ?auto_18508 ?auto_18505 ) ) ( HOIST-AT ?auto_18537 ?auto_18508 ) ( AVAILABLE ?auto_18537 ) ( SURFACE-AT ?auto_18496 ?auto_18508 ) ( ON ?auto_18496 ?auto_18532 ) ( CLEAR ?auto_18496 ) ( not ( = ?auto_18497 ?auto_18496 ) ) ( not ( = ?auto_18497 ?auto_18532 ) ) ( not ( = ?auto_18496 ?auto_18532 ) ) ( not ( = ?auto_18507 ?auto_18537 ) ) ( IS-CRATE ?auto_18497 ) ( SURFACE-AT ?auto_18497 ?auto_18530 ) ( ON ?auto_18497 ?auto_18510 ) ( CLEAR ?auto_18497 ) ( not ( = ?auto_18494 ?auto_18497 ) ) ( not ( = ?auto_18494 ?auto_18510 ) ) ( not ( = ?auto_18497 ?auto_18510 ) ) ( IS-CRATE ?auto_18494 ) ( not ( = ?auto_18524 ?auto_18505 ) ) ( HOIST-AT ?auto_18534 ?auto_18524 ) ( AVAILABLE ?auto_18534 ) ( SURFACE-AT ?auto_18494 ?auto_18524 ) ( ON ?auto_18494 ?auto_18522 ) ( CLEAR ?auto_18494 ) ( not ( = ?auto_18493 ?auto_18494 ) ) ( not ( = ?auto_18493 ?auto_18522 ) ) ( not ( = ?auto_18494 ?auto_18522 ) ) ( not ( = ?auto_18507 ?auto_18534 ) ) ( IS-CRATE ?auto_18493 ) ( not ( = ?auto_18520 ?auto_18505 ) ) ( HOIST-AT ?auto_18523 ?auto_18520 ) ( AVAILABLE ?auto_18523 ) ( SURFACE-AT ?auto_18493 ?auto_18520 ) ( ON ?auto_18493 ?auto_18516 ) ( CLEAR ?auto_18493 ) ( not ( = ?auto_18492 ?auto_18493 ) ) ( not ( = ?auto_18492 ?auto_18516 ) ) ( not ( = ?auto_18493 ?auto_18516 ) ) ( not ( = ?auto_18507 ?auto_18523 ) ) ( IS-CRATE ?auto_18492 ) ( AVAILABLE ?auto_18526 ) ( SURFACE-AT ?auto_18492 ?auto_18530 ) ( ON ?auto_18492 ?auto_18512 ) ( CLEAR ?auto_18492 ) ( not ( = ?auto_18491 ?auto_18492 ) ) ( not ( = ?auto_18491 ?auto_18512 ) ) ( not ( = ?auto_18492 ?auto_18512 ) ) ( IS-CRATE ?auto_18491 ) ( not ( = ?auto_18528 ?auto_18505 ) ) ( HOIST-AT ?auto_18518 ?auto_18528 ) ( AVAILABLE ?auto_18518 ) ( SURFACE-AT ?auto_18491 ?auto_18528 ) ( ON ?auto_18491 ?auto_18514 ) ( CLEAR ?auto_18491 ) ( not ( = ?auto_18490 ?auto_18491 ) ) ( not ( = ?auto_18490 ?auto_18514 ) ) ( not ( = ?auto_18491 ?auto_18514 ) ) ( not ( = ?auto_18507 ?auto_18518 ) ) ( IS-CRATE ?auto_18490 ) ( not ( = ?auto_18517 ?auto_18505 ) ) ( HOIST-AT ?auto_18531 ?auto_18517 ) ( AVAILABLE ?auto_18531 ) ( SURFACE-AT ?auto_18490 ?auto_18517 ) ( ON ?auto_18490 ?auto_18515 ) ( CLEAR ?auto_18490 ) ( not ( = ?auto_18489 ?auto_18490 ) ) ( not ( = ?auto_18489 ?auto_18515 ) ) ( not ( = ?auto_18490 ?auto_18515 ) ) ( not ( = ?auto_18507 ?auto_18531 ) ) ( SURFACE-AT ?auto_18488 ?auto_18505 ) ( CLEAR ?auto_18488 ) ( IS-CRATE ?auto_18489 ) ( AVAILABLE ?auto_18507 ) ( not ( = ?auto_18525 ?auto_18505 ) ) ( HOIST-AT ?auto_18527 ?auto_18525 ) ( AVAILABLE ?auto_18527 ) ( SURFACE-AT ?auto_18489 ?auto_18525 ) ( ON ?auto_18489 ?auto_18536 ) ( CLEAR ?auto_18489 ) ( TRUCK-AT ?auto_18506 ?auto_18505 ) ( not ( = ?auto_18488 ?auto_18489 ) ) ( not ( = ?auto_18488 ?auto_18536 ) ) ( not ( = ?auto_18489 ?auto_18536 ) ) ( not ( = ?auto_18507 ?auto_18527 ) ) ( not ( = ?auto_18488 ?auto_18490 ) ) ( not ( = ?auto_18488 ?auto_18515 ) ) ( not ( = ?auto_18490 ?auto_18536 ) ) ( not ( = ?auto_18517 ?auto_18525 ) ) ( not ( = ?auto_18531 ?auto_18527 ) ) ( not ( = ?auto_18515 ?auto_18536 ) ) ( not ( = ?auto_18488 ?auto_18491 ) ) ( not ( = ?auto_18488 ?auto_18514 ) ) ( not ( = ?auto_18489 ?auto_18491 ) ) ( not ( = ?auto_18489 ?auto_18514 ) ) ( not ( = ?auto_18491 ?auto_18515 ) ) ( not ( = ?auto_18491 ?auto_18536 ) ) ( not ( = ?auto_18528 ?auto_18517 ) ) ( not ( = ?auto_18528 ?auto_18525 ) ) ( not ( = ?auto_18518 ?auto_18531 ) ) ( not ( = ?auto_18518 ?auto_18527 ) ) ( not ( = ?auto_18514 ?auto_18515 ) ) ( not ( = ?auto_18514 ?auto_18536 ) ) ( not ( = ?auto_18488 ?auto_18492 ) ) ( not ( = ?auto_18488 ?auto_18512 ) ) ( not ( = ?auto_18489 ?auto_18492 ) ) ( not ( = ?auto_18489 ?auto_18512 ) ) ( not ( = ?auto_18490 ?auto_18492 ) ) ( not ( = ?auto_18490 ?auto_18512 ) ) ( not ( = ?auto_18492 ?auto_18514 ) ) ( not ( = ?auto_18492 ?auto_18515 ) ) ( not ( = ?auto_18492 ?auto_18536 ) ) ( not ( = ?auto_18530 ?auto_18528 ) ) ( not ( = ?auto_18530 ?auto_18517 ) ) ( not ( = ?auto_18530 ?auto_18525 ) ) ( not ( = ?auto_18526 ?auto_18518 ) ) ( not ( = ?auto_18526 ?auto_18531 ) ) ( not ( = ?auto_18526 ?auto_18527 ) ) ( not ( = ?auto_18512 ?auto_18514 ) ) ( not ( = ?auto_18512 ?auto_18515 ) ) ( not ( = ?auto_18512 ?auto_18536 ) ) ( not ( = ?auto_18488 ?auto_18493 ) ) ( not ( = ?auto_18488 ?auto_18516 ) ) ( not ( = ?auto_18489 ?auto_18493 ) ) ( not ( = ?auto_18489 ?auto_18516 ) ) ( not ( = ?auto_18490 ?auto_18493 ) ) ( not ( = ?auto_18490 ?auto_18516 ) ) ( not ( = ?auto_18491 ?auto_18493 ) ) ( not ( = ?auto_18491 ?auto_18516 ) ) ( not ( = ?auto_18493 ?auto_18512 ) ) ( not ( = ?auto_18493 ?auto_18514 ) ) ( not ( = ?auto_18493 ?auto_18515 ) ) ( not ( = ?auto_18493 ?auto_18536 ) ) ( not ( = ?auto_18520 ?auto_18530 ) ) ( not ( = ?auto_18520 ?auto_18528 ) ) ( not ( = ?auto_18520 ?auto_18517 ) ) ( not ( = ?auto_18520 ?auto_18525 ) ) ( not ( = ?auto_18523 ?auto_18526 ) ) ( not ( = ?auto_18523 ?auto_18518 ) ) ( not ( = ?auto_18523 ?auto_18531 ) ) ( not ( = ?auto_18523 ?auto_18527 ) ) ( not ( = ?auto_18516 ?auto_18512 ) ) ( not ( = ?auto_18516 ?auto_18514 ) ) ( not ( = ?auto_18516 ?auto_18515 ) ) ( not ( = ?auto_18516 ?auto_18536 ) ) ( not ( = ?auto_18488 ?auto_18494 ) ) ( not ( = ?auto_18488 ?auto_18522 ) ) ( not ( = ?auto_18489 ?auto_18494 ) ) ( not ( = ?auto_18489 ?auto_18522 ) ) ( not ( = ?auto_18490 ?auto_18494 ) ) ( not ( = ?auto_18490 ?auto_18522 ) ) ( not ( = ?auto_18491 ?auto_18494 ) ) ( not ( = ?auto_18491 ?auto_18522 ) ) ( not ( = ?auto_18492 ?auto_18494 ) ) ( not ( = ?auto_18492 ?auto_18522 ) ) ( not ( = ?auto_18494 ?auto_18516 ) ) ( not ( = ?auto_18494 ?auto_18512 ) ) ( not ( = ?auto_18494 ?auto_18514 ) ) ( not ( = ?auto_18494 ?auto_18515 ) ) ( not ( = ?auto_18494 ?auto_18536 ) ) ( not ( = ?auto_18524 ?auto_18520 ) ) ( not ( = ?auto_18524 ?auto_18530 ) ) ( not ( = ?auto_18524 ?auto_18528 ) ) ( not ( = ?auto_18524 ?auto_18517 ) ) ( not ( = ?auto_18524 ?auto_18525 ) ) ( not ( = ?auto_18534 ?auto_18523 ) ) ( not ( = ?auto_18534 ?auto_18526 ) ) ( not ( = ?auto_18534 ?auto_18518 ) ) ( not ( = ?auto_18534 ?auto_18531 ) ) ( not ( = ?auto_18534 ?auto_18527 ) ) ( not ( = ?auto_18522 ?auto_18516 ) ) ( not ( = ?auto_18522 ?auto_18512 ) ) ( not ( = ?auto_18522 ?auto_18514 ) ) ( not ( = ?auto_18522 ?auto_18515 ) ) ( not ( = ?auto_18522 ?auto_18536 ) ) ( not ( = ?auto_18488 ?auto_18497 ) ) ( not ( = ?auto_18488 ?auto_18510 ) ) ( not ( = ?auto_18489 ?auto_18497 ) ) ( not ( = ?auto_18489 ?auto_18510 ) ) ( not ( = ?auto_18490 ?auto_18497 ) ) ( not ( = ?auto_18490 ?auto_18510 ) ) ( not ( = ?auto_18491 ?auto_18497 ) ) ( not ( = ?auto_18491 ?auto_18510 ) ) ( not ( = ?auto_18492 ?auto_18497 ) ) ( not ( = ?auto_18492 ?auto_18510 ) ) ( not ( = ?auto_18493 ?auto_18497 ) ) ( not ( = ?auto_18493 ?auto_18510 ) ) ( not ( = ?auto_18497 ?auto_18522 ) ) ( not ( = ?auto_18497 ?auto_18516 ) ) ( not ( = ?auto_18497 ?auto_18512 ) ) ( not ( = ?auto_18497 ?auto_18514 ) ) ( not ( = ?auto_18497 ?auto_18515 ) ) ( not ( = ?auto_18497 ?auto_18536 ) ) ( not ( = ?auto_18510 ?auto_18522 ) ) ( not ( = ?auto_18510 ?auto_18516 ) ) ( not ( = ?auto_18510 ?auto_18512 ) ) ( not ( = ?auto_18510 ?auto_18514 ) ) ( not ( = ?auto_18510 ?auto_18515 ) ) ( not ( = ?auto_18510 ?auto_18536 ) ) ( not ( = ?auto_18488 ?auto_18496 ) ) ( not ( = ?auto_18488 ?auto_18532 ) ) ( not ( = ?auto_18489 ?auto_18496 ) ) ( not ( = ?auto_18489 ?auto_18532 ) ) ( not ( = ?auto_18490 ?auto_18496 ) ) ( not ( = ?auto_18490 ?auto_18532 ) ) ( not ( = ?auto_18491 ?auto_18496 ) ) ( not ( = ?auto_18491 ?auto_18532 ) ) ( not ( = ?auto_18492 ?auto_18496 ) ) ( not ( = ?auto_18492 ?auto_18532 ) ) ( not ( = ?auto_18493 ?auto_18496 ) ) ( not ( = ?auto_18493 ?auto_18532 ) ) ( not ( = ?auto_18494 ?auto_18496 ) ) ( not ( = ?auto_18494 ?auto_18532 ) ) ( not ( = ?auto_18496 ?auto_18510 ) ) ( not ( = ?auto_18496 ?auto_18522 ) ) ( not ( = ?auto_18496 ?auto_18516 ) ) ( not ( = ?auto_18496 ?auto_18512 ) ) ( not ( = ?auto_18496 ?auto_18514 ) ) ( not ( = ?auto_18496 ?auto_18515 ) ) ( not ( = ?auto_18496 ?auto_18536 ) ) ( not ( = ?auto_18508 ?auto_18530 ) ) ( not ( = ?auto_18508 ?auto_18524 ) ) ( not ( = ?auto_18508 ?auto_18520 ) ) ( not ( = ?auto_18508 ?auto_18528 ) ) ( not ( = ?auto_18508 ?auto_18517 ) ) ( not ( = ?auto_18508 ?auto_18525 ) ) ( not ( = ?auto_18537 ?auto_18526 ) ) ( not ( = ?auto_18537 ?auto_18534 ) ) ( not ( = ?auto_18537 ?auto_18523 ) ) ( not ( = ?auto_18537 ?auto_18518 ) ) ( not ( = ?auto_18537 ?auto_18531 ) ) ( not ( = ?auto_18537 ?auto_18527 ) ) ( not ( = ?auto_18532 ?auto_18510 ) ) ( not ( = ?auto_18532 ?auto_18522 ) ) ( not ( = ?auto_18532 ?auto_18516 ) ) ( not ( = ?auto_18532 ?auto_18512 ) ) ( not ( = ?auto_18532 ?auto_18514 ) ) ( not ( = ?auto_18532 ?auto_18515 ) ) ( not ( = ?auto_18532 ?auto_18536 ) ) ( not ( = ?auto_18488 ?auto_18495 ) ) ( not ( = ?auto_18488 ?auto_18521 ) ) ( not ( = ?auto_18489 ?auto_18495 ) ) ( not ( = ?auto_18489 ?auto_18521 ) ) ( not ( = ?auto_18490 ?auto_18495 ) ) ( not ( = ?auto_18490 ?auto_18521 ) ) ( not ( = ?auto_18491 ?auto_18495 ) ) ( not ( = ?auto_18491 ?auto_18521 ) ) ( not ( = ?auto_18492 ?auto_18495 ) ) ( not ( = ?auto_18492 ?auto_18521 ) ) ( not ( = ?auto_18493 ?auto_18495 ) ) ( not ( = ?auto_18493 ?auto_18521 ) ) ( not ( = ?auto_18494 ?auto_18495 ) ) ( not ( = ?auto_18494 ?auto_18521 ) ) ( not ( = ?auto_18497 ?auto_18495 ) ) ( not ( = ?auto_18497 ?auto_18521 ) ) ( not ( = ?auto_18495 ?auto_18532 ) ) ( not ( = ?auto_18495 ?auto_18510 ) ) ( not ( = ?auto_18495 ?auto_18522 ) ) ( not ( = ?auto_18495 ?auto_18516 ) ) ( not ( = ?auto_18495 ?auto_18512 ) ) ( not ( = ?auto_18495 ?auto_18514 ) ) ( not ( = ?auto_18495 ?auto_18515 ) ) ( not ( = ?auto_18495 ?auto_18536 ) ) ( not ( = ?auto_18533 ?auto_18508 ) ) ( not ( = ?auto_18533 ?auto_18530 ) ) ( not ( = ?auto_18533 ?auto_18524 ) ) ( not ( = ?auto_18533 ?auto_18520 ) ) ( not ( = ?auto_18533 ?auto_18528 ) ) ( not ( = ?auto_18533 ?auto_18517 ) ) ( not ( = ?auto_18533 ?auto_18525 ) ) ( not ( = ?auto_18513 ?auto_18537 ) ) ( not ( = ?auto_18513 ?auto_18526 ) ) ( not ( = ?auto_18513 ?auto_18534 ) ) ( not ( = ?auto_18513 ?auto_18523 ) ) ( not ( = ?auto_18513 ?auto_18518 ) ) ( not ( = ?auto_18513 ?auto_18531 ) ) ( not ( = ?auto_18513 ?auto_18527 ) ) ( not ( = ?auto_18521 ?auto_18532 ) ) ( not ( = ?auto_18521 ?auto_18510 ) ) ( not ( = ?auto_18521 ?auto_18522 ) ) ( not ( = ?auto_18521 ?auto_18516 ) ) ( not ( = ?auto_18521 ?auto_18512 ) ) ( not ( = ?auto_18521 ?auto_18514 ) ) ( not ( = ?auto_18521 ?auto_18515 ) ) ( not ( = ?auto_18521 ?auto_18536 ) ) ( not ( = ?auto_18488 ?auto_18498 ) ) ( not ( = ?auto_18488 ?auto_18529 ) ) ( not ( = ?auto_18489 ?auto_18498 ) ) ( not ( = ?auto_18489 ?auto_18529 ) ) ( not ( = ?auto_18490 ?auto_18498 ) ) ( not ( = ?auto_18490 ?auto_18529 ) ) ( not ( = ?auto_18491 ?auto_18498 ) ) ( not ( = ?auto_18491 ?auto_18529 ) ) ( not ( = ?auto_18492 ?auto_18498 ) ) ( not ( = ?auto_18492 ?auto_18529 ) ) ( not ( = ?auto_18493 ?auto_18498 ) ) ( not ( = ?auto_18493 ?auto_18529 ) ) ( not ( = ?auto_18494 ?auto_18498 ) ) ( not ( = ?auto_18494 ?auto_18529 ) ) ( not ( = ?auto_18497 ?auto_18498 ) ) ( not ( = ?auto_18497 ?auto_18529 ) ) ( not ( = ?auto_18496 ?auto_18498 ) ) ( not ( = ?auto_18496 ?auto_18529 ) ) ( not ( = ?auto_18498 ?auto_18521 ) ) ( not ( = ?auto_18498 ?auto_18532 ) ) ( not ( = ?auto_18498 ?auto_18510 ) ) ( not ( = ?auto_18498 ?auto_18522 ) ) ( not ( = ?auto_18498 ?auto_18516 ) ) ( not ( = ?auto_18498 ?auto_18512 ) ) ( not ( = ?auto_18498 ?auto_18514 ) ) ( not ( = ?auto_18498 ?auto_18515 ) ) ( not ( = ?auto_18498 ?auto_18536 ) ) ( not ( = ?auto_18529 ?auto_18521 ) ) ( not ( = ?auto_18529 ?auto_18532 ) ) ( not ( = ?auto_18529 ?auto_18510 ) ) ( not ( = ?auto_18529 ?auto_18522 ) ) ( not ( = ?auto_18529 ?auto_18516 ) ) ( not ( = ?auto_18529 ?auto_18512 ) ) ( not ( = ?auto_18529 ?auto_18514 ) ) ( not ( = ?auto_18529 ?auto_18515 ) ) ( not ( = ?auto_18529 ?auto_18536 ) ) ( not ( = ?auto_18488 ?auto_18499 ) ) ( not ( = ?auto_18488 ?auto_18509 ) ) ( not ( = ?auto_18489 ?auto_18499 ) ) ( not ( = ?auto_18489 ?auto_18509 ) ) ( not ( = ?auto_18490 ?auto_18499 ) ) ( not ( = ?auto_18490 ?auto_18509 ) ) ( not ( = ?auto_18491 ?auto_18499 ) ) ( not ( = ?auto_18491 ?auto_18509 ) ) ( not ( = ?auto_18492 ?auto_18499 ) ) ( not ( = ?auto_18492 ?auto_18509 ) ) ( not ( = ?auto_18493 ?auto_18499 ) ) ( not ( = ?auto_18493 ?auto_18509 ) ) ( not ( = ?auto_18494 ?auto_18499 ) ) ( not ( = ?auto_18494 ?auto_18509 ) ) ( not ( = ?auto_18497 ?auto_18499 ) ) ( not ( = ?auto_18497 ?auto_18509 ) ) ( not ( = ?auto_18496 ?auto_18499 ) ) ( not ( = ?auto_18496 ?auto_18509 ) ) ( not ( = ?auto_18495 ?auto_18499 ) ) ( not ( = ?auto_18495 ?auto_18509 ) ) ( not ( = ?auto_18499 ?auto_18529 ) ) ( not ( = ?auto_18499 ?auto_18521 ) ) ( not ( = ?auto_18499 ?auto_18532 ) ) ( not ( = ?auto_18499 ?auto_18510 ) ) ( not ( = ?auto_18499 ?auto_18522 ) ) ( not ( = ?auto_18499 ?auto_18516 ) ) ( not ( = ?auto_18499 ?auto_18512 ) ) ( not ( = ?auto_18499 ?auto_18514 ) ) ( not ( = ?auto_18499 ?auto_18515 ) ) ( not ( = ?auto_18499 ?auto_18536 ) ) ( not ( = ?auto_18509 ?auto_18529 ) ) ( not ( = ?auto_18509 ?auto_18521 ) ) ( not ( = ?auto_18509 ?auto_18532 ) ) ( not ( = ?auto_18509 ?auto_18510 ) ) ( not ( = ?auto_18509 ?auto_18522 ) ) ( not ( = ?auto_18509 ?auto_18516 ) ) ( not ( = ?auto_18509 ?auto_18512 ) ) ( not ( = ?auto_18509 ?auto_18514 ) ) ( not ( = ?auto_18509 ?auto_18515 ) ) ( not ( = ?auto_18509 ?auto_18536 ) ) ( not ( = ?auto_18488 ?auto_18500 ) ) ( not ( = ?auto_18488 ?auto_18535 ) ) ( not ( = ?auto_18489 ?auto_18500 ) ) ( not ( = ?auto_18489 ?auto_18535 ) ) ( not ( = ?auto_18490 ?auto_18500 ) ) ( not ( = ?auto_18490 ?auto_18535 ) ) ( not ( = ?auto_18491 ?auto_18500 ) ) ( not ( = ?auto_18491 ?auto_18535 ) ) ( not ( = ?auto_18492 ?auto_18500 ) ) ( not ( = ?auto_18492 ?auto_18535 ) ) ( not ( = ?auto_18493 ?auto_18500 ) ) ( not ( = ?auto_18493 ?auto_18535 ) ) ( not ( = ?auto_18494 ?auto_18500 ) ) ( not ( = ?auto_18494 ?auto_18535 ) ) ( not ( = ?auto_18497 ?auto_18500 ) ) ( not ( = ?auto_18497 ?auto_18535 ) ) ( not ( = ?auto_18496 ?auto_18500 ) ) ( not ( = ?auto_18496 ?auto_18535 ) ) ( not ( = ?auto_18495 ?auto_18500 ) ) ( not ( = ?auto_18495 ?auto_18535 ) ) ( not ( = ?auto_18498 ?auto_18500 ) ) ( not ( = ?auto_18498 ?auto_18535 ) ) ( not ( = ?auto_18500 ?auto_18509 ) ) ( not ( = ?auto_18500 ?auto_18529 ) ) ( not ( = ?auto_18500 ?auto_18521 ) ) ( not ( = ?auto_18500 ?auto_18532 ) ) ( not ( = ?auto_18500 ?auto_18510 ) ) ( not ( = ?auto_18500 ?auto_18522 ) ) ( not ( = ?auto_18500 ?auto_18516 ) ) ( not ( = ?auto_18500 ?auto_18512 ) ) ( not ( = ?auto_18500 ?auto_18514 ) ) ( not ( = ?auto_18500 ?auto_18515 ) ) ( not ( = ?auto_18500 ?auto_18536 ) ) ( not ( = ?auto_18511 ?auto_18533 ) ) ( not ( = ?auto_18511 ?auto_18530 ) ) ( not ( = ?auto_18511 ?auto_18508 ) ) ( not ( = ?auto_18511 ?auto_18524 ) ) ( not ( = ?auto_18511 ?auto_18520 ) ) ( not ( = ?auto_18511 ?auto_18528 ) ) ( not ( = ?auto_18511 ?auto_18517 ) ) ( not ( = ?auto_18511 ?auto_18525 ) ) ( not ( = ?auto_18519 ?auto_18513 ) ) ( not ( = ?auto_18519 ?auto_18526 ) ) ( not ( = ?auto_18519 ?auto_18537 ) ) ( not ( = ?auto_18519 ?auto_18534 ) ) ( not ( = ?auto_18519 ?auto_18523 ) ) ( not ( = ?auto_18519 ?auto_18518 ) ) ( not ( = ?auto_18519 ?auto_18531 ) ) ( not ( = ?auto_18519 ?auto_18527 ) ) ( not ( = ?auto_18535 ?auto_18509 ) ) ( not ( = ?auto_18535 ?auto_18529 ) ) ( not ( = ?auto_18535 ?auto_18521 ) ) ( not ( = ?auto_18535 ?auto_18532 ) ) ( not ( = ?auto_18535 ?auto_18510 ) ) ( not ( = ?auto_18535 ?auto_18522 ) ) ( not ( = ?auto_18535 ?auto_18516 ) ) ( not ( = ?auto_18535 ?auto_18512 ) ) ( not ( = ?auto_18535 ?auto_18514 ) ) ( not ( = ?auto_18535 ?auto_18515 ) ) ( not ( = ?auto_18535 ?auto_18536 ) ) ( not ( = ?auto_18488 ?auto_18501 ) ) ( not ( = ?auto_18488 ?auto_18502 ) ) ( not ( = ?auto_18489 ?auto_18501 ) ) ( not ( = ?auto_18489 ?auto_18502 ) ) ( not ( = ?auto_18490 ?auto_18501 ) ) ( not ( = ?auto_18490 ?auto_18502 ) ) ( not ( = ?auto_18491 ?auto_18501 ) ) ( not ( = ?auto_18491 ?auto_18502 ) ) ( not ( = ?auto_18492 ?auto_18501 ) ) ( not ( = ?auto_18492 ?auto_18502 ) ) ( not ( = ?auto_18493 ?auto_18501 ) ) ( not ( = ?auto_18493 ?auto_18502 ) ) ( not ( = ?auto_18494 ?auto_18501 ) ) ( not ( = ?auto_18494 ?auto_18502 ) ) ( not ( = ?auto_18497 ?auto_18501 ) ) ( not ( = ?auto_18497 ?auto_18502 ) ) ( not ( = ?auto_18496 ?auto_18501 ) ) ( not ( = ?auto_18496 ?auto_18502 ) ) ( not ( = ?auto_18495 ?auto_18501 ) ) ( not ( = ?auto_18495 ?auto_18502 ) ) ( not ( = ?auto_18498 ?auto_18501 ) ) ( not ( = ?auto_18498 ?auto_18502 ) ) ( not ( = ?auto_18499 ?auto_18501 ) ) ( not ( = ?auto_18499 ?auto_18502 ) ) ( not ( = ?auto_18501 ?auto_18535 ) ) ( not ( = ?auto_18501 ?auto_18509 ) ) ( not ( = ?auto_18501 ?auto_18529 ) ) ( not ( = ?auto_18501 ?auto_18521 ) ) ( not ( = ?auto_18501 ?auto_18532 ) ) ( not ( = ?auto_18501 ?auto_18510 ) ) ( not ( = ?auto_18501 ?auto_18522 ) ) ( not ( = ?auto_18501 ?auto_18516 ) ) ( not ( = ?auto_18501 ?auto_18512 ) ) ( not ( = ?auto_18501 ?auto_18514 ) ) ( not ( = ?auto_18501 ?auto_18515 ) ) ( not ( = ?auto_18501 ?auto_18536 ) ) ( not ( = ?auto_18503 ?auto_18511 ) ) ( not ( = ?auto_18503 ?auto_18533 ) ) ( not ( = ?auto_18503 ?auto_18530 ) ) ( not ( = ?auto_18503 ?auto_18508 ) ) ( not ( = ?auto_18503 ?auto_18524 ) ) ( not ( = ?auto_18503 ?auto_18520 ) ) ( not ( = ?auto_18503 ?auto_18528 ) ) ( not ( = ?auto_18503 ?auto_18517 ) ) ( not ( = ?auto_18503 ?auto_18525 ) ) ( not ( = ?auto_18504 ?auto_18519 ) ) ( not ( = ?auto_18504 ?auto_18513 ) ) ( not ( = ?auto_18504 ?auto_18526 ) ) ( not ( = ?auto_18504 ?auto_18537 ) ) ( not ( = ?auto_18504 ?auto_18534 ) ) ( not ( = ?auto_18504 ?auto_18523 ) ) ( not ( = ?auto_18504 ?auto_18518 ) ) ( not ( = ?auto_18504 ?auto_18531 ) ) ( not ( = ?auto_18504 ?auto_18527 ) ) ( not ( = ?auto_18502 ?auto_18535 ) ) ( not ( = ?auto_18502 ?auto_18509 ) ) ( not ( = ?auto_18502 ?auto_18529 ) ) ( not ( = ?auto_18502 ?auto_18521 ) ) ( not ( = ?auto_18502 ?auto_18532 ) ) ( not ( = ?auto_18502 ?auto_18510 ) ) ( not ( = ?auto_18502 ?auto_18522 ) ) ( not ( = ?auto_18502 ?auto_18516 ) ) ( not ( = ?auto_18502 ?auto_18512 ) ) ( not ( = ?auto_18502 ?auto_18514 ) ) ( not ( = ?auto_18502 ?auto_18515 ) ) ( not ( = ?auto_18502 ?auto_18536 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_18488 ?auto_18489 ?auto_18490 ?auto_18491 ?auto_18492 ?auto_18493 ?auto_18494 ?auto_18497 ?auto_18496 ?auto_18495 ?auto_18498 ?auto_18499 ?auto_18500 )
      ( MAKE-1CRATE ?auto_18500 ?auto_18501 )
      ( MAKE-13CRATE-VERIFY ?auto_18488 ?auto_18489 ?auto_18490 ?auto_18491 ?auto_18492 ?auto_18493 ?auto_18494 ?auto_18497 ?auto_18496 ?auto_18495 ?auto_18498 ?auto_18499 ?auto_18500 ?auto_18501 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18540 - SURFACE
      ?auto_18541 - SURFACE
    )
    :vars
    (
      ?auto_18542 - HOIST
      ?auto_18543 - PLACE
      ?auto_18545 - PLACE
      ?auto_18546 - HOIST
      ?auto_18547 - SURFACE
      ?auto_18544 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18542 ?auto_18543 ) ( SURFACE-AT ?auto_18540 ?auto_18543 ) ( CLEAR ?auto_18540 ) ( IS-CRATE ?auto_18541 ) ( AVAILABLE ?auto_18542 ) ( not ( = ?auto_18545 ?auto_18543 ) ) ( HOIST-AT ?auto_18546 ?auto_18545 ) ( AVAILABLE ?auto_18546 ) ( SURFACE-AT ?auto_18541 ?auto_18545 ) ( ON ?auto_18541 ?auto_18547 ) ( CLEAR ?auto_18541 ) ( TRUCK-AT ?auto_18544 ?auto_18543 ) ( not ( = ?auto_18540 ?auto_18541 ) ) ( not ( = ?auto_18540 ?auto_18547 ) ) ( not ( = ?auto_18541 ?auto_18547 ) ) ( not ( = ?auto_18542 ?auto_18546 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18544 ?auto_18543 ?auto_18545 )
      ( !LIFT ?auto_18546 ?auto_18541 ?auto_18547 ?auto_18545 )
      ( !LOAD ?auto_18546 ?auto_18541 ?auto_18544 ?auto_18545 )
      ( !DRIVE ?auto_18544 ?auto_18545 ?auto_18543 )
      ( !UNLOAD ?auto_18542 ?auto_18541 ?auto_18544 ?auto_18543 )
      ( !DROP ?auto_18542 ?auto_18541 ?auto_18540 ?auto_18543 )
      ( MAKE-1CRATE-VERIFY ?auto_18540 ?auto_18541 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_18563 - SURFACE
      ?auto_18564 - SURFACE
      ?auto_18565 - SURFACE
      ?auto_18566 - SURFACE
      ?auto_18567 - SURFACE
      ?auto_18568 - SURFACE
      ?auto_18569 - SURFACE
      ?auto_18572 - SURFACE
      ?auto_18571 - SURFACE
      ?auto_18570 - SURFACE
      ?auto_18573 - SURFACE
      ?auto_18574 - SURFACE
      ?auto_18575 - SURFACE
      ?auto_18576 - SURFACE
      ?auto_18577 - SURFACE
    )
    :vars
    (
      ?auto_18579 - HOIST
      ?auto_18581 - PLACE
      ?auto_18583 - PLACE
      ?auto_18578 - HOIST
      ?auto_18582 - SURFACE
      ?auto_18607 - PLACE
      ?auto_18588 - HOIST
      ?auto_18609 - SURFACE
      ?auto_18597 - PLACE
      ?auto_18589 - HOIST
      ?auto_18590 - SURFACE
      ?auto_18613 - PLACE
      ?auto_18595 - HOIST
      ?auto_18598 - SURFACE
      ?auto_18604 - SURFACE
      ?auto_18587 - SURFACE
      ?auto_18608 - PLACE
      ?auto_18584 - HOIST
      ?auto_18605 - SURFACE
      ?auto_18596 - SURFACE
      ?auto_18611 - PLACE
      ?auto_18592 - HOIST
      ?auto_18612 - SURFACE
      ?auto_18610 - PLACE
      ?auto_18614 - HOIST
      ?auto_18586 - SURFACE
      ?auto_18599 - SURFACE
      ?auto_18606 - PLACE
      ?auto_18600 - HOIST
      ?auto_18603 - SURFACE
      ?auto_18585 - PLACE
      ?auto_18602 - HOIST
      ?auto_18591 - SURFACE
      ?auto_18601 - PLACE
      ?auto_18594 - HOIST
      ?auto_18593 - SURFACE
      ?auto_18580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18579 ?auto_18581 ) ( IS-CRATE ?auto_18577 ) ( not ( = ?auto_18583 ?auto_18581 ) ) ( HOIST-AT ?auto_18578 ?auto_18583 ) ( SURFACE-AT ?auto_18577 ?auto_18583 ) ( ON ?auto_18577 ?auto_18582 ) ( CLEAR ?auto_18577 ) ( not ( = ?auto_18576 ?auto_18577 ) ) ( not ( = ?auto_18576 ?auto_18582 ) ) ( not ( = ?auto_18577 ?auto_18582 ) ) ( not ( = ?auto_18579 ?auto_18578 ) ) ( IS-CRATE ?auto_18576 ) ( not ( = ?auto_18607 ?auto_18581 ) ) ( HOIST-AT ?auto_18588 ?auto_18607 ) ( AVAILABLE ?auto_18588 ) ( SURFACE-AT ?auto_18576 ?auto_18607 ) ( ON ?auto_18576 ?auto_18609 ) ( CLEAR ?auto_18576 ) ( not ( = ?auto_18575 ?auto_18576 ) ) ( not ( = ?auto_18575 ?auto_18609 ) ) ( not ( = ?auto_18576 ?auto_18609 ) ) ( not ( = ?auto_18579 ?auto_18588 ) ) ( IS-CRATE ?auto_18575 ) ( not ( = ?auto_18597 ?auto_18581 ) ) ( HOIST-AT ?auto_18589 ?auto_18597 ) ( AVAILABLE ?auto_18589 ) ( SURFACE-AT ?auto_18575 ?auto_18597 ) ( ON ?auto_18575 ?auto_18590 ) ( CLEAR ?auto_18575 ) ( not ( = ?auto_18574 ?auto_18575 ) ) ( not ( = ?auto_18574 ?auto_18590 ) ) ( not ( = ?auto_18575 ?auto_18590 ) ) ( not ( = ?auto_18579 ?auto_18589 ) ) ( IS-CRATE ?auto_18574 ) ( not ( = ?auto_18613 ?auto_18581 ) ) ( HOIST-AT ?auto_18595 ?auto_18613 ) ( SURFACE-AT ?auto_18574 ?auto_18613 ) ( ON ?auto_18574 ?auto_18598 ) ( CLEAR ?auto_18574 ) ( not ( = ?auto_18573 ?auto_18574 ) ) ( not ( = ?auto_18573 ?auto_18598 ) ) ( not ( = ?auto_18574 ?auto_18598 ) ) ( not ( = ?auto_18579 ?auto_18595 ) ) ( IS-CRATE ?auto_18573 ) ( SURFACE-AT ?auto_18573 ?auto_18583 ) ( ON ?auto_18573 ?auto_18604 ) ( CLEAR ?auto_18573 ) ( not ( = ?auto_18570 ?auto_18573 ) ) ( not ( = ?auto_18570 ?auto_18604 ) ) ( not ( = ?auto_18573 ?auto_18604 ) ) ( IS-CRATE ?auto_18570 ) ( AVAILABLE ?auto_18595 ) ( SURFACE-AT ?auto_18570 ?auto_18613 ) ( ON ?auto_18570 ?auto_18587 ) ( CLEAR ?auto_18570 ) ( not ( = ?auto_18571 ?auto_18570 ) ) ( not ( = ?auto_18571 ?auto_18587 ) ) ( not ( = ?auto_18570 ?auto_18587 ) ) ( IS-CRATE ?auto_18571 ) ( not ( = ?auto_18608 ?auto_18581 ) ) ( HOIST-AT ?auto_18584 ?auto_18608 ) ( AVAILABLE ?auto_18584 ) ( SURFACE-AT ?auto_18571 ?auto_18608 ) ( ON ?auto_18571 ?auto_18605 ) ( CLEAR ?auto_18571 ) ( not ( = ?auto_18572 ?auto_18571 ) ) ( not ( = ?auto_18572 ?auto_18605 ) ) ( not ( = ?auto_18571 ?auto_18605 ) ) ( not ( = ?auto_18579 ?auto_18584 ) ) ( IS-CRATE ?auto_18572 ) ( SURFACE-AT ?auto_18572 ?auto_18583 ) ( ON ?auto_18572 ?auto_18596 ) ( CLEAR ?auto_18572 ) ( not ( = ?auto_18569 ?auto_18572 ) ) ( not ( = ?auto_18569 ?auto_18596 ) ) ( not ( = ?auto_18572 ?auto_18596 ) ) ( IS-CRATE ?auto_18569 ) ( not ( = ?auto_18611 ?auto_18581 ) ) ( HOIST-AT ?auto_18592 ?auto_18611 ) ( AVAILABLE ?auto_18592 ) ( SURFACE-AT ?auto_18569 ?auto_18611 ) ( ON ?auto_18569 ?auto_18612 ) ( CLEAR ?auto_18569 ) ( not ( = ?auto_18568 ?auto_18569 ) ) ( not ( = ?auto_18568 ?auto_18612 ) ) ( not ( = ?auto_18569 ?auto_18612 ) ) ( not ( = ?auto_18579 ?auto_18592 ) ) ( IS-CRATE ?auto_18568 ) ( not ( = ?auto_18610 ?auto_18581 ) ) ( HOIST-AT ?auto_18614 ?auto_18610 ) ( AVAILABLE ?auto_18614 ) ( SURFACE-AT ?auto_18568 ?auto_18610 ) ( ON ?auto_18568 ?auto_18586 ) ( CLEAR ?auto_18568 ) ( not ( = ?auto_18567 ?auto_18568 ) ) ( not ( = ?auto_18567 ?auto_18586 ) ) ( not ( = ?auto_18568 ?auto_18586 ) ) ( not ( = ?auto_18579 ?auto_18614 ) ) ( IS-CRATE ?auto_18567 ) ( AVAILABLE ?auto_18578 ) ( SURFACE-AT ?auto_18567 ?auto_18583 ) ( ON ?auto_18567 ?auto_18599 ) ( CLEAR ?auto_18567 ) ( not ( = ?auto_18566 ?auto_18567 ) ) ( not ( = ?auto_18566 ?auto_18599 ) ) ( not ( = ?auto_18567 ?auto_18599 ) ) ( IS-CRATE ?auto_18566 ) ( not ( = ?auto_18606 ?auto_18581 ) ) ( HOIST-AT ?auto_18600 ?auto_18606 ) ( AVAILABLE ?auto_18600 ) ( SURFACE-AT ?auto_18566 ?auto_18606 ) ( ON ?auto_18566 ?auto_18603 ) ( CLEAR ?auto_18566 ) ( not ( = ?auto_18565 ?auto_18566 ) ) ( not ( = ?auto_18565 ?auto_18603 ) ) ( not ( = ?auto_18566 ?auto_18603 ) ) ( not ( = ?auto_18579 ?auto_18600 ) ) ( IS-CRATE ?auto_18565 ) ( not ( = ?auto_18585 ?auto_18581 ) ) ( HOIST-AT ?auto_18602 ?auto_18585 ) ( AVAILABLE ?auto_18602 ) ( SURFACE-AT ?auto_18565 ?auto_18585 ) ( ON ?auto_18565 ?auto_18591 ) ( CLEAR ?auto_18565 ) ( not ( = ?auto_18564 ?auto_18565 ) ) ( not ( = ?auto_18564 ?auto_18591 ) ) ( not ( = ?auto_18565 ?auto_18591 ) ) ( not ( = ?auto_18579 ?auto_18602 ) ) ( SURFACE-AT ?auto_18563 ?auto_18581 ) ( CLEAR ?auto_18563 ) ( IS-CRATE ?auto_18564 ) ( AVAILABLE ?auto_18579 ) ( not ( = ?auto_18601 ?auto_18581 ) ) ( HOIST-AT ?auto_18594 ?auto_18601 ) ( AVAILABLE ?auto_18594 ) ( SURFACE-AT ?auto_18564 ?auto_18601 ) ( ON ?auto_18564 ?auto_18593 ) ( CLEAR ?auto_18564 ) ( TRUCK-AT ?auto_18580 ?auto_18581 ) ( not ( = ?auto_18563 ?auto_18564 ) ) ( not ( = ?auto_18563 ?auto_18593 ) ) ( not ( = ?auto_18564 ?auto_18593 ) ) ( not ( = ?auto_18579 ?auto_18594 ) ) ( not ( = ?auto_18563 ?auto_18565 ) ) ( not ( = ?auto_18563 ?auto_18591 ) ) ( not ( = ?auto_18565 ?auto_18593 ) ) ( not ( = ?auto_18585 ?auto_18601 ) ) ( not ( = ?auto_18602 ?auto_18594 ) ) ( not ( = ?auto_18591 ?auto_18593 ) ) ( not ( = ?auto_18563 ?auto_18566 ) ) ( not ( = ?auto_18563 ?auto_18603 ) ) ( not ( = ?auto_18564 ?auto_18566 ) ) ( not ( = ?auto_18564 ?auto_18603 ) ) ( not ( = ?auto_18566 ?auto_18591 ) ) ( not ( = ?auto_18566 ?auto_18593 ) ) ( not ( = ?auto_18606 ?auto_18585 ) ) ( not ( = ?auto_18606 ?auto_18601 ) ) ( not ( = ?auto_18600 ?auto_18602 ) ) ( not ( = ?auto_18600 ?auto_18594 ) ) ( not ( = ?auto_18603 ?auto_18591 ) ) ( not ( = ?auto_18603 ?auto_18593 ) ) ( not ( = ?auto_18563 ?auto_18567 ) ) ( not ( = ?auto_18563 ?auto_18599 ) ) ( not ( = ?auto_18564 ?auto_18567 ) ) ( not ( = ?auto_18564 ?auto_18599 ) ) ( not ( = ?auto_18565 ?auto_18567 ) ) ( not ( = ?auto_18565 ?auto_18599 ) ) ( not ( = ?auto_18567 ?auto_18603 ) ) ( not ( = ?auto_18567 ?auto_18591 ) ) ( not ( = ?auto_18567 ?auto_18593 ) ) ( not ( = ?auto_18583 ?auto_18606 ) ) ( not ( = ?auto_18583 ?auto_18585 ) ) ( not ( = ?auto_18583 ?auto_18601 ) ) ( not ( = ?auto_18578 ?auto_18600 ) ) ( not ( = ?auto_18578 ?auto_18602 ) ) ( not ( = ?auto_18578 ?auto_18594 ) ) ( not ( = ?auto_18599 ?auto_18603 ) ) ( not ( = ?auto_18599 ?auto_18591 ) ) ( not ( = ?auto_18599 ?auto_18593 ) ) ( not ( = ?auto_18563 ?auto_18568 ) ) ( not ( = ?auto_18563 ?auto_18586 ) ) ( not ( = ?auto_18564 ?auto_18568 ) ) ( not ( = ?auto_18564 ?auto_18586 ) ) ( not ( = ?auto_18565 ?auto_18568 ) ) ( not ( = ?auto_18565 ?auto_18586 ) ) ( not ( = ?auto_18566 ?auto_18568 ) ) ( not ( = ?auto_18566 ?auto_18586 ) ) ( not ( = ?auto_18568 ?auto_18599 ) ) ( not ( = ?auto_18568 ?auto_18603 ) ) ( not ( = ?auto_18568 ?auto_18591 ) ) ( not ( = ?auto_18568 ?auto_18593 ) ) ( not ( = ?auto_18610 ?auto_18583 ) ) ( not ( = ?auto_18610 ?auto_18606 ) ) ( not ( = ?auto_18610 ?auto_18585 ) ) ( not ( = ?auto_18610 ?auto_18601 ) ) ( not ( = ?auto_18614 ?auto_18578 ) ) ( not ( = ?auto_18614 ?auto_18600 ) ) ( not ( = ?auto_18614 ?auto_18602 ) ) ( not ( = ?auto_18614 ?auto_18594 ) ) ( not ( = ?auto_18586 ?auto_18599 ) ) ( not ( = ?auto_18586 ?auto_18603 ) ) ( not ( = ?auto_18586 ?auto_18591 ) ) ( not ( = ?auto_18586 ?auto_18593 ) ) ( not ( = ?auto_18563 ?auto_18569 ) ) ( not ( = ?auto_18563 ?auto_18612 ) ) ( not ( = ?auto_18564 ?auto_18569 ) ) ( not ( = ?auto_18564 ?auto_18612 ) ) ( not ( = ?auto_18565 ?auto_18569 ) ) ( not ( = ?auto_18565 ?auto_18612 ) ) ( not ( = ?auto_18566 ?auto_18569 ) ) ( not ( = ?auto_18566 ?auto_18612 ) ) ( not ( = ?auto_18567 ?auto_18569 ) ) ( not ( = ?auto_18567 ?auto_18612 ) ) ( not ( = ?auto_18569 ?auto_18586 ) ) ( not ( = ?auto_18569 ?auto_18599 ) ) ( not ( = ?auto_18569 ?auto_18603 ) ) ( not ( = ?auto_18569 ?auto_18591 ) ) ( not ( = ?auto_18569 ?auto_18593 ) ) ( not ( = ?auto_18611 ?auto_18610 ) ) ( not ( = ?auto_18611 ?auto_18583 ) ) ( not ( = ?auto_18611 ?auto_18606 ) ) ( not ( = ?auto_18611 ?auto_18585 ) ) ( not ( = ?auto_18611 ?auto_18601 ) ) ( not ( = ?auto_18592 ?auto_18614 ) ) ( not ( = ?auto_18592 ?auto_18578 ) ) ( not ( = ?auto_18592 ?auto_18600 ) ) ( not ( = ?auto_18592 ?auto_18602 ) ) ( not ( = ?auto_18592 ?auto_18594 ) ) ( not ( = ?auto_18612 ?auto_18586 ) ) ( not ( = ?auto_18612 ?auto_18599 ) ) ( not ( = ?auto_18612 ?auto_18603 ) ) ( not ( = ?auto_18612 ?auto_18591 ) ) ( not ( = ?auto_18612 ?auto_18593 ) ) ( not ( = ?auto_18563 ?auto_18572 ) ) ( not ( = ?auto_18563 ?auto_18596 ) ) ( not ( = ?auto_18564 ?auto_18572 ) ) ( not ( = ?auto_18564 ?auto_18596 ) ) ( not ( = ?auto_18565 ?auto_18572 ) ) ( not ( = ?auto_18565 ?auto_18596 ) ) ( not ( = ?auto_18566 ?auto_18572 ) ) ( not ( = ?auto_18566 ?auto_18596 ) ) ( not ( = ?auto_18567 ?auto_18572 ) ) ( not ( = ?auto_18567 ?auto_18596 ) ) ( not ( = ?auto_18568 ?auto_18572 ) ) ( not ( = ?auto_18568 ?auto_18596 ) ) ( not ( = ?auto_18572 ?auto_18612 ) ) ( not ( = ?auto_18572 ?auto_18586 ) ) ( not ( = ?auto_18572 ?auto_18599 ) ) ( not ( = ?auto_18572 ?auto_18603 ) ) ( not ( = ?auto_18572 ?auto_18591 ) ) ( not ( = ?auto_18572 ?auto_18593 ) ) ( not ( = ?auto_18596 ?auto_18612 ) ) ( not ( = ?auto_18596 ?auto_18586 ) ) ( not ( = ?auto_18596 ?auto_18599 ) ) ( not ( = ?auto_18596 ?auto_18603 ) ) ( not ( = ?auto_18596 ?auto_18591 ) ) ( not ( = ?auto_18596 ?auto_18593 ) ) ( not ( = ?auto_18563 ?auto_18571 ) ) ( not ( = ?auto_18563 ?auto_18605 ) ) ( not ( = ?auto_18564 ?auto_18571 ) ) ( not ( = ?auto_18564 ?auto_18605 ) ) ( not ( = ?auto_18565 ?auto_18571 ) ) ( not ( = ?auto_18565 ?auto_18605 ) ) ( not ( = ?auto_18566 ?auto_18571 ) ) ( not ( = ?auto_18566 ?auto_18605 ) ) ( not ( = ?auto_18567 ?auto_18571 ) ) ( not ( = ?auto_18567 ?auto_18605 ) ) ( not ( = ?auto_18568 ?auto_18571 ) ) ( not ( = ?auto_18568 ?auto_18605 ) ) ( not ( = ?auto_18569 ?auto_18571 ) ) ( not ( = ?auto_18569 ?auto_18605 ) ) ( not ( = ?auto_18571 ?auto_18596 ) ) ( not ( = ?auto_18571 ?auto_18612 ) ) ( not ( = ?auto_18571 ?auto_18586 ) ) ( not ( = ?auto_18571 ?auto_18599 ) ) ( not ( = ?auto_18571 ?auto_18603 ) ) ( not ( = ?auto_18571 ?auto_18591 ) ) ( not ( = ?auto_18571 ?auto_18593 ) ) ( not ( = ?auto_18608 ?auto_18583 ) ) ( not ( = ?auto_18608 ?auto_18611 ) ) ( not ( = ?auto_18608 ?auto_18610 ) ) ( not ( = ?auto_18608 ?auto_18606 ) ) ( not ( = ?auto_18608 ?auto_18585 ) ) ( not ( = ?auto_18608 ?auto_18601 ) ) ( not ( = ?auto_18584 ?auto_18578 ) ) ( not ( = ?auto_18584 ?auto_18592 ) ) ( not ( = ?auto_18584 ?auto_18614 ) ) ( not ( = ?auto_18584 ?auto_18600 ) ) ( not ( = ?auto_18584 ?auto_18602 ) ) ( not ( = ?auto_18584 ?auto_18594 ) ) ( not ( = ?auto_18605 ?auto_18596 ) ) ( not ( = ?auto_18605 ?auto_18612 ) ) ( not ( = ?auto_18605 ?auto_18586 ) ) ( not ( = ?auto_18605 ?auto_18599 ) ) ( not ( = ?auto_18605 ?auto_18603 ) ) ( not ( = ?auto_18605 ?auto_18591 ) ) ( not ( = ?auto_18605 ?auto_18593 ) ) ( not ( = ?auto_18563 ?auto_18570 ) ) ( not ( = ?auto_18563 ?auto_18587 ) ) ( not ( = ?auto_18564 ?auto_18570 ) ) ( not ( = ?auto_18564 ?auto_18587 ) ) ( not ( = ?auto_18565 ?auto_18570 ) ) ( not ( = ?auto_18565 ?auto_18587 ) ) ( not ( = ?auto_18566 ?auto_18570 ) ) ( not ( = ?auto_18566 ?auto_18587 ) ) ( not ( = ?auto_18567 ?auto_18570 ) ) ( not ( = ?auto_18567 ?auto_18587 ) ) ( not ( = ?auto_18568 ?auto_18570 ) ) ( not ( = ?auto_18568 ?auto_18587 ) ) ( not ( = ?auto_18569 ?auto_18570 ) ) ( not ( = ?auto_18569 ?auto_18587 ) ) ( not ( = ?auto_18572 ?auto_18570 ) ) ( not ( = ?auto_18572 ?auto_18587 ) ) ( not ( = ?auto_18570 ?auto_18605 ) ) ( not ( = ?auto_18570 ?auto_18596 ) ) ( not ( = ?auto_18570 ?auto_18612 ) ) ( not ( = ?auto_18570 ?auto_18586 ) ) ( not ( = ?auto_18570 ?auto_18599 ) ) ( not ( = ?auto_18570 ?auto_18603 ) ) ( not ( = ?auto_18570 ?auto_18591 ) ) ( not ( = ?auto_18570 ?auto_18593 ) ) ( not ( = ?auto_18613 ?auto_18608 ) ) ( not ( = ?auto_18613 ?auto_18583 ) ) ( not ( = ?auto_18613 ?auto_18611 ) ) ( not ( = ?auto_18613 ?auto_18610 ) ) ( not ( = ?auto_18613 ?auto_18606 ) ) ( not ( = ?auto_18613 ?auto_18585 ) ) ( not ( = ?auto_18613 ?auto_18601 ) ) ( not ( = ?auto_18595 ?auto_18584 ) ) ( not ( = ?auto_18595 ?auto_18578 ) ) ( not ( = ?auto_18595 ?auto_18592 ) ) ( not ( = ?auto_18595 ?auto_18614 ) ) ( not ( = ?auto_18595 ?auto_18600 ) ) ( not ( = ?auto_18595 ?auto_18602 ) ) ( not ( = ?auto_18595 ?auto_18594 ) ) ( not ( = ?auto_18587 ?auto_18605 ) ) ( not ( = ?auto_18587 ?auto_18596 ) ) ( not ( = ?auto_18587 ?auto_18612 ) ) ( not ( = ?auto_18587 ?auto_18586 ) ) ( not ( = ?auto_18587 ?auto_18599 ) ) ( not ( = ?auto_18587 ?auto_18603 ) ) ( not ( = ?auto_18587 ?auto_18591 ) ) ( not ( = ?auto_18587 ?auto_18593 ) ) ( not ( = ?auto_18563 ?auto_18573 ) ) ( not ( = ?auto_18563 ?auto_18604 ) ) ( not ( = ?auto_18564 ?auto_18573 ) ) ( not ( = ?auto_18564 ?auto_18604 ) ) ( not ( = ?auto_18565 ?auto_18573 ) ) ( not ( = ?auto_18565 ?auto_18604 ) ) ( not ( = ?auto_18566 ?auto_18573 ) ) ( not ( = ?auto_18566 ?auto_18604 ) ) ( not ( = ?auto_18567 ?auto_18573 ) ) ( not ( = ?auto_18567 ?auto_18604 ) ) ( not ( = ?auto_18568 ?auto_18573 ) ) ( not ( = ?auto_18568 ?auto_18604 ) ) ( not ( = ?auto_18569 ?auto_18573 ) ) ( not ( = ?auto_18569 ?auto_18604 ) ) ( not ( = ?auto_18572 ?auto_18573 ) ) ( not ( = ?auto_18572 ?auto_18604 ) ) ( not ( = ?auto_18571 ?auto_18573 ) ) ( not ( = ?auto_18571 ?auto_18604 ) ) ( not ( = ?auto_18573 ?auto_18587 ) ) ( not ( = ?auto_18573 ?auto_18605 ) ) ( not ( = ?auto_18573 ?auto_18596 ) ) ( not ( = ?auto_18573 ?auto_18612 ) ) ( not ( = ?auto_18573 ?auto_18586 ) ) ( not ( = ?auto_18573 ?auto_18599 ) ) ( not ( = ?auto_18573 ?auto_18603 ) ) ( not ( = ?auto_18573 ?auto_18591 ) ) ( not ( = ?auto_18573 ?auto_18593 ) ) ( not ( = ?auto_18604 ?auto_18587 ) ) ( not ( = ?auto_18604 ?auto_18605 ) ) ( not ( = ?auto_18604 ?auto_18596 ) ) ( not ( = ?auto_18604 ?auto_18612 ) ) ( not ( = ?auto_18604 ?auto_18586 ) ) ( not ( = ?auto_18604 ?auto_18599 ) ) ( not ( = ?auto_18604 ?auto_18603 ) ) ( not ( = ?auto_18604 ?auto_18591 ) ) ( not ( = ?auto_18604 ?auto_18593 ) ) ( not ( = ?auto_18563 ?auto_18574 ) ) ( not ( = ?auto_18563 ?auto_18598 ) ) ( not ( = ?auto_18564 ?auto_18574 ) ) ( not ( = ?auto_18564 ?auto_18598 ) ) ( not ( = ?auto_18565 ?auto_18574 ) ) ( not ( = ?auto_18565 ?auto_18598 ) ) ( not ( = ?auto_18566 ?auto_18574 ) ) ( not ( = ?auto_18566 ?auto_18598 ) ) ( not ( = ?auto_18567 ?auto_18574 ) ) ( not ( = ?auto_18567 ?auto_18598 ) ) ( not ( = ?auto_18568 ?auto_18574 ) ) ( not ( = ?auto_18568 ?auto_18598 ) ) ( not ( = ?auto_18569 ?auto_18574 ) ) ( not ( = ?auto_18569 ?auto_18598 ) ) ( not ( = ?auto_18572 ?auto_18574 ) ) ( not ( = ?auto_18572 ?auto_18598 ) ) ( not ( = ?auto_18571 ?auto_18574 ) ) ( not ( = ?auto_18571 ?auto_18598 ) ) ( not ( = ?auto_18570 ?auto_18574 ) ) ( not ( = ?auto_18570 ?auto_18598 ) ) ( not ( = ?auto_18574 ?auto_18604 ) ) ( not ( = ?auto_18574 ?auto_18587 ) ) ( not ( = ?auto_18574 ?auto_18605 ) ) ( not ( = ?auto_18574 ?auto_18596 ) ) ( not ( = ?auto_18574 ?auto_18612 ) ) ( not ( = ?auto_18574 ?auto_18586 ) ) ( not ( = ?auto_18574 ?auto_18599 ) ) ( not ( = ?auto_18574 ?auto_18603 ) ) ( not ( = ?auto_18574 ?auto_18591 ) ) ( not ( = ?auto_18574 ?auto_18593 ) ) ( not ( = ?auto_18598 ?auto_18604 ) ) ( not ( = ?auto_18598 ?auto_18587 ) ) ( not ( = ?auto_18598 ?auto_18605 ) ) ( not ( = ?auto_18598 ?auto_18596 ) ) ( not ( = ?auto_18598 ?auto_18612 ) ) ( not ( = ?auto_18598 ?auto_18586 ) ) ( not ( = ?auto_18598 ?auto_18599 ) ) ( not ( = ?auto_18598 ?auto_18603 ) ) ( not ( = ?auto_18598 ?auto_18591 ) ) ( not ( = ?auto_18598 ?auto_18593 ) ) ( not ( = ?auto_18563 ?auto_18575 ) ) ( not ( = ?auto_18563 ?auto_18590 ) ) ( not ( = ?auto_18564 ?auto_18575 ) ) ( not ( = ?auto_18564 ?auto_18590 ) ) ( not ( = ?auto_18565 ?auto_18575 ) ) ( not ( = ?auto_18565 ?auto_18590 ) ) ( not ( = ?auto_18566 ?auto_18575 ) ) ( not ( = ?auto_18566 ?auto_18590 ) ) ( not ( = ?auto_18567 ?auto_18575 ) ) ( not ( = ?auto_18567 ?auto_18590 ) ) ( not ( = ?auto_18568 ?auto_18575 ) ) ( not ( = ?auto_18568 ?auto_18590 ) ) ( not ( = ?auto_18569 ?auto_18575 ) ) ( not ( = ?auto_18569 ?auto_18590 ) ) ( not ( = ?auto_18572 ?auto_18575 ) ) ( not ( = ?auto_18572 ?auto_18590 ) ) ( not ( = ?auto_18571 ?auto_18575 ) ) ( not ( = ?auto_18571 ?auto_18590 ) ) ( not ( = ?auto_18570 ?auto_18575 ) ) ( not ( = ?auto_18570 ?auto_18590 ) ) ( not ( = ?auto_18573 ?auto_18575 ) ) ( not ( = ?auto_18573 ?auto_18590 ) ) ( not ( = ?auto_18575 ?auto_18598 ) ) ( not ( = ?auto_18575 ?auto_18604 ) ) ( not ( = ?auto_18575 ?auto_18587 ) ) ( not ( = ?auto_18575 ?auto_18605 ) ) ( not ( = ?auto_18575 ?auto_18596 ) ) ( not ( = ?auto_18575 ?auto_18612 ) ) ( not ( = ?auto_18575 ?auto_18586 ) ) ( not ( = ?auto_18575 ?auto_18599 ) ) ( not ( = ?auto_18575 ?auto_18603 ) ) ( not ( = ?auto_18575 ?auto_18591 ) ) ( not ( = ?auto_18575 ?auto_18593 ) ) ( not ( = ?auto_18597 ?auto_18613 ) ) ( not ( = ?auto_18597 ?auto_18583 ) ) ( not ( = ?auto_18597 ?auto_18608 ) ) ( not ( = ?auto_18597 ?auto_18611 ) ) ( not ( = ?auto_18597 ?auto_18610 ) ) ( not ( = ?auto_18597 ?auto_18606 ) ) ( not ( = ?auto_18597 ?auto_18585 ) ) ( not ( = ?auto_18597 ?auto_18601 ) ) ( not ( = ?auto_18589 ?auto_18595 ) ) ( not ( = ?auto_18589 ?auto_18578 ) ) ( not ( = ?auto_18589 ?auto_18584 ) ) ( not ( = ?auto_18589 ?auto_18592 ) ) ( not ( = ?auto_18589 ?auto_18614 ) ) ( not ( = ?auto_18589 ?auto_18600 ) ) ( not ( = ?auto_18589 ?auto_18602 ) ) ( not ( = ?auto_18589 ?auto_18594 ) ) ( not ( = ?auto_18590 ?auto_18598 ) ) ( not ( = ?auto_18590 ?auto_18604 ) ) ( not ( = ?auto_18590 ?auto_18587 ) ) ( not ( = ?auto_18590 ?auto_18605 ) ) ( not ( = ?auto_18590 ?auto_18596 ) ) ( not ( = ?auto_18590 ?auto_18612 ) ) ( not ( = ?auto_18590 ?auto_18586 ) ) ( not ( = ?auto_18590 ?auto_18599 ) ) ( not ( = ?auto_18590 ?auto_18603 ) ) ( not ( = ?auto_18590 ?auto_18591 ) ) ( not ( = ?auto_18590 ?auto_18593 ) ) ( not ( = ?auto_18563 ?auto_18576 ) ) ( not ( = ?auto_18563 ?auto_18609 ) ) ( not ( = ?auto_18564 ?auto_18576 ) ) ( not ( = ?auto_18564 ?auto_18609 ) ) ( not ( = ?auto_18565 ?auto_18576 ) ) ( not ( = ?auto_18565 ?auto_18609 ) ) ( not ( = ?auto_18566 ?auto_18576 ) ) ( not ( = ?auto_18566 ?auto_18609 ) ) ( not ( = ?auto_18567 ?auto_18576 ) ) ( not ( = ?auto_18567 ?auto_18609 ) ) ( not ( = ?auto_18568 ?auto_18576 ) ) ( not ( = ?auto_18568 ?auto_18609 ) ) ( not ( = ?auto_18569 ?auto_18576 ) ) ( not ( = ?auto_18569 ?auto_18609 ) ) ( not ( = ?auto_18572 ?auto_18576 ) ) ( not ( = ?auto_18572 ?auto_18609 ) ) ( not ( = ?auto_18571 ?auto_18576 ) ) ( not ( = ?auto_18571 ?auto_18609 ) ) ( not ( = ?auto_18570 ?auto_18576 ) ) ( not ( = ?auto_18570 ?auto_18609 ) ) ( not ( = ?auto_18573 ?auto_18576 ) ) ( not ( = ?auto_18573 ?auto_18609 ) ) ( not ( = ?auto_18574 ?auto_18576 ) ) ( not ( = ?auto_18574 ?auto_18609 ) ) ( not ( = ?auto_18576 ?auto_18590 ) ) ( not ( = ?auto_18576 ?auto_18598 ) ) ( not ( = ?auto_18576 ?auto_18604 ) ) ( not ( = ?auto_18576 ?auto_18587 ) ) ( not ( = ?auto_18576 ?auto_18605 ) ) ( not ( = ?auto_18576 ?auto_18596 ) ) ( not ( = ?auto_18576 ?auto_18612 ) ) ( not ( = ?auto_18576 ?auto_18586 ) ) ( not ( = ?auto_18576 ?auto_18599 ) ) ( not ( = ?auto_18576 ?auto_18603 ) ) ( not ( = ?auto_18576 ?auto_18591 ) ) ( not ( = ?auto_18576 ?auto_18593 ) ) ( not ( = ?auto_18607 ?auto_18597 ) ) ( not ( = ?auto_18607 ?auto_18613 ) ) ( not ( = ?auto_18607 ?auto_18583 ) ) ( not ( = ?auto_18607 ?auto_18608 ) ) ( not ( = ?auto_18607 ?auto_18611 ) ) ( not ( = ?auto_18607 ?auto_18610 ) ) ( not ( = ?auto_18607 ?auto_18606 ) ) ( not ( = ?auto_18607 ?auto_18585 ) ) ( not ( = ?auto_18607 ?auto_18601 ) ) ( not ( = ?auto_18588 ?auto_18589 ) ) ( not ( = ?auto_18588 ?auto_18595 ) ) ( not ( = ?auto_18588 ?auto_18578 ) ) ( not ( = ?auto_18588 ?auto_18584 ) ) ( not ( = ?auto_18588 ?auto_18592 ) ) ( not ( = ?auto_18588 ?auto_18614 ) ) ( not ( = ?auto_18588 ?auto_18600 ) ) ( not ( = ?auto_18588 ?auto_18602 ) ) ( not ( = ?auto_18588 ?auto_18594 ) ) ( not ( = ?auto_18609 ?auto_18590 ) ) ( not ( = ?auto_18609 ?auto_18598 ) ) ( not ( = ?auto_18609 ?auto_18604 ) ) ( not ( = ?auto_18609 ?auto_18587 ) ) ( not ( = ?auto_18609 ?auto_18605 ) ) ( not ( = ?auto_18609 ?auto_18596 ) ) ( not ( = ?auto_18609 ?auto_18612 ) ) ( not ( = ?auto_18609 ?auto_18586 ) ) ( not ( = ?auto_18609 ?auto_18599 ) ) ( not ( = ?auto_18609 ?auto_18603 ) ) ( not ( = ?auto_18609 ?auto_18591 ) ) ( not ( = ?auto_18609 ?auto_18593 ) ) ( not ( = ?auto_18563 ?auto_18577 ) ) ( not ( = ?auto_18563 ?auto_18582 ) ) ( not ( = ?auto_18564 ?auto_18577 ) ) ( not ( = ?auto_18564 ?auto_18582 ) ) ( not ( = ?auto_18565 ?auto_18577 ) ) ( not ( = ?auto_18565 ?auto_18582 ) ) ( not ( = ?auto_18566 ?auto_18577 ) ) ( not ( = ?auto_18566 ?auto_18582 ) ) ( not ( = ?auto_18567 ?auto_18577 ) ) ( not ( = ?auto_18567 ?auto_18582 ) ) ( not ( = ?auto_18568 ?auto_18577 ) ) ( not ( = ?auto_18568 ?auto_18582 ) ) ( not ( = ?auto_18569 ?auto_18577 ) ) ( not ( = ?auto_18569 ?auto_18582 ) ) ( not ( = ?auto_18572 ?auto_18577 ) ) ( not ( = ?auto_18572 ?auto_18582 ) ) ( not ( = ?auto_18571 ?auto_18577 ) ) ( not ( = ?auto_18571 ?auto_18582 ) ) ( not ( = ?auto_18570 ?auto_18577 ) ) ( not ( = ?auto_18570 ?auto_18582 ) ) ( not ( = ?auto_18573 ?auto_18577 ) ) ( not ( = ?auto_18573 ?auto_18582 ) ) ( not ( = ?auto_18574 ?auto_18577 ) ) ( not ( = ?auto_18574 ?auto_18582 ) ) ( not ( = ?auto_18575 ?auto_18577 ) ) ( not ( = ?auto_18575 ?auto_18582 ) ) ( not ( = ?auto_18577 ?auto_18609 ) ) ( not ( = ?auto_18577 ?auto_18590 ) ) ( not ( = ?auto_18577 ?auto_18598 ) ) ( not ( = ?auto_18577 ?auto_18604 ) ) ( not ( = ?auto_18577 ?auto_18587 ) ) ( not ( = ?auto_18577 ?auto_18605 ) ) ( not ( = ?auto_18577 ?auto_18596 ) ) ( not ( = ?auto_18577 ?auto_18612 ) ) ( not ( = ?auto_18577 ?auto_18586 ) ) ( not ( = ?auto_18577 ?auto_18599 ) ) ( not ( = ?auto_18577 ?auto_18603 ) ) ( not ( = ?auto_18577 ?auto_18591 ) ) ( not ( = ?auto_18577 ?auto_18593 ) ) ( not ( = ?auto_18582 ?auto_18609 ) ) ( not ( = ?auto_18582 ?auto_18590 ) ) ( not ( = ?auto_18582 ?auto_18598 ) ) ( not ( = ?auto_18582 ?auto_18604 ) ) ( not ( = ?auto_18582 ?auto_18587 ) ) ( not ( = ?auto_18582 ?auto_18605 ) ) ( not ( = ?auto_18582 ?auto_18596 ) ) ( not ( = ?auto_18582 ?auto_18612 ) ) ( not ( = ?auto_18582 ?auto_18586 ) ) ( not ( = ?auto_18582 ?auto_18599 ) ) ( not ( = ?auto_18582 ?auto_18603 ) ) ( not ( = ?auto_18582 ?auto_18591 ) ) ( not ( = ?auto_18582 ?auto_18593 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_18563 ?auto_18564 ?auto_18565 ?auto_18566 ?auto_18567 ?auto_18568 ?auto_18569 ?auto_18572 ?auto_18571 ?auto_18570 ?auto_18573 ?auto_18574 ?auto_18575 ?auto_18576 )
      ( MAKE-1CRATE ?auto_18576 ?auto_18577 )
      ( MAKE-14CRATE-VERIFY ?auto_18563 ?auto_18564 ?auto_18565 ?auto_18566 ?auto_18567 ?auto_18568 ?auto_18569 ?auto_18572 ?auto_18571 ?auto_18570 ?auto_18573 ?auto_18574 ?auto_18575 ?auto_18576 ?auto_18577 ) )
  )

)

