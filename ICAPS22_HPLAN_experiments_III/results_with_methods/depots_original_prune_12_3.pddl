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
      ?auto_743908 - SURFACE
      ?auto_743909 - SURFACE
    )
    :vars
    (
      ?auto_743910 - HOIST
      ?auto_743911 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_743910 ?auto_743911 ) ( SURFACE-AT ?auto_743908 ?auto_743911 ) ( CLEAR ?auto_743908 ) ( LIFTING ?auto_743910 ?auto_743909 ) ( IS-CRATE ?auto_743909 ) ( not ( = ?auto_743908 ?auto_743909 ) ) )
    :subtasks
    ( ( !DROP ?auto_743910 ?auto_743909 ?auto_743908 ?auto_743911 )
      ( MAKE-1CRATE-VERIFY ?auto_743908 ?auto_743909 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_743912 - SURFACE
      ?auto_743913 - SURFACE
    )
    :vars
    (
      ?auto_743915 - HOIST
      ?auto_743914 - PLACE
      ?auto_743916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_743915 ?auto_743914 ) ( SURFACE-AT ?auto_743912 ?auto_743914 ) ( CLEAR ?auto_743912 ) ( IS-CRATE ?auto_743913 ) ( not ( = ?auto_743912 ?auto_743913 ) ) ( TRUCK-AT ?auto_743916 ?auto_743914 ) ( AVAILABLE ?auto_743915 ) ( IN ?auto_743913 ?auto_743916 ) )
    :subtasks
    ( ( !UNLOAD ?auto_743915 ?auto_743913 ?auto_743916 ?auto_743914 )
      ( MAKE-1CRATE ?auto_743912 ?auto_743913 )
      ( MAKE-1CRATE-VERIFY ?auto_743912 ?auto_743913 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_743917 - SURFACE
      ?auto_743918 - SURFACE
    )
    :vars
    (
      ?auto_743920 - HOIST
      ?auto_743921 - PLACE
      ?auto_743919 - TRUCK
      ?auto_743922 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_743920 ?auto_743921 ) ( SURFACE-AT ?auto_743917 ?auto_743921 ) ( CLEAR ?auto_743917 ) ( IS-CRATE ?auto_743918 ) ( not ( = ?auto_743917 ?auto_743918 ) ) ( AVAILABLE ?auto_743920 ) ( IN ?auto_743918 ?auto_743919 ) ( TRUCK-AT ?auto_743919 ?auto_743922 ) ( not ( = ?auto_743922 ?auto_743921 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_743919 ?auto_743922 ?auto_743921 )
      ( MAKE-1CRATE ?auto_743917 ?auto_743918 )
      ( MAKE-1CRATE-VERIFY ?auto_743917 ?auto_743918 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_743923 - SURFACE
      ?auto_743924 - SURFACE
    )
    :vars
    (
      ?auto_743925 - HOIST
      ?auto_743928 - PLACE
      ?auto_743927 - TRUCK
      ?auto_743926 - PLACE
      ?auto_743929 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_743925 ?auto_743928 ) ( SURFACE-AT ?auto_743923 ?auto_743928 ) ( CLEAR ?auto_743923 ) ( IS-CRATE ?auto_743924 ) ( not ( = ?auto_743923 ?auto_743924 ) ) ( AVAILABLE ?auto_743925 ) ( TRUCK-AT ?auto_743927 ?auto_743926 ) ( not ( = ?auto_743926 ?auto_743928 ) ) ( HOIST-AT ?auto_743929 ?auto_743926 ) ( LIFTING ?auto_743929 ?auto_743924 ) ( not ( = ?auto_743925 ?auto_743929 ) ) )
    :subtasks
    ( ( !LOAD ?auto_743929 ?auto_743924 ?auto_743927 ?auto_743926 )
      ( MAKE-1CRATE ?auto_743923 ?auto_743924 )
      ( MAKE-1CRATE-VERIFY ?auto_743923 ?auto_743924 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_743930 - SURFACE
      ?auto_743931 - SURFACE
    )
    :vars
    (
      ?auto_743932 - HOIST
      ?auto_743934 - PLACE
      ?auto_743936 - TRUCK
      ?auto_743933 - PLACE
      ?auto_743935 - HOIST
      ?auto_743937 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_743932 ?auto_743934 ) ( SURFACE-AT ?auto_743930 ?auto_743934 ) ( CLEAR ?auto_743930 ) ( IS-CRATE ?auto_743931 ) ( not ( = ?auto_743930 ?auto_743931 ) ) ( AVAILABLE ?auto_743932 ) ( TRUCK-AT ?auto_743936 ?auto_743933 ) ( not ( = ?auto_743933 ?auto_743934 ) ) ( HOIST-AT ?auto_743935 ?auto_743933 ) ( not ( = ?auto_743932 ?auto_743935 ) ) ( AVAILABLE ?auto_743935 ) ( SURFACE-AT ?auto_743931 ?auto_743933 ) ( ON ?auto_743931 ?auto_743937 ) ( CLEAR ?auto_743931 ) ( not ( = ?auto_743930 ?auto_743937 ) ) ( not ( = ?auto_743931 ?auto_743937 ) ) )
    :subtasks
    ( ( !LIFT ?auto_743935 ?auto_743931 ?auto_743937 ?auto_743933 )
      ( MAKE-1CRATE ?auto_743930 ?auto_743931 )
      ( MAKE-1CRATE-VERIFY ?auto_743930 ?auto_743931 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_743938 - SURFACE
      ?auto_743939 - SURFACE
    )
    :vars
    (
      ?auto_743943 - HOIST
      ?auto_743942 - PLACE
      ?auto_743941 - PLACE
      ?auto_743945 - HOIST
      ?auto_743944 - SURFACE
      ?auto_743940 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_743943 ?auto_743942 ) ( SURFACE-AT ?auto_743938 ?auto_743942 ) ( CLEAR ?auto_743938 ) ( IS-CRATE ?auto_743939 ) ( not ( = ?auto_743938 ?auto_743939 ) ) ( AVAILABLE ?auto_743943 ) ( not ( = ?auto_743941 ?auto_743942 ) ) ( HOIST-AT ?auto_743945 ?auto_743941 ) ( not ( = ?auto_743943 ?auto_743945 ) ) ( AVAILABLE ?auto_743945 ) ( SURFACE-AT ?auto_743939 ?auto_743941 ) ( ON ?auto_743939 ?auto_743944 ) ( CLEAR ?auto_743939 ) ( not ( = ?auto_743938 ?auto_743944 ) ) ( not ( = ?auto_743939 ?auto_743944 ) ) ( TRUCK-AT ?auto_743940 ?auto_743942 ) )
    :subtasks
    ( ( !DRIVE ?auto_743940 ?auto_743942 ?auto_743941 )
      ( MAKE-1CRATE ?auto_743938 ?auto_743939 )
      ( MAKE-1CRATE-VERIFY ?auto_743938 ?auto_743939 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_743955 - SURFACE
      ?auto_743956 - SURFACE
      ?auto_743957 - SURFACE
    )
    :vars
    (
      ?auto_743959 - HOIST
      ?auto_743958 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_743959 ?auto_743958 ) ( SURFACE-AT ?auto_743956 ?auto_743958 ) ( CLEAR ?auto_743956 ) ( LIFTING ?auto_743959 ?auto_743957 ) ( IS-CRATE ?auto_743957 ) ( not ( = ?auto_743956 ?auto_743957 ) ) ( ON ?auto_743956 ?auto_743955 ) ( not ( = ?auto_743955 ?auto_743956 ) ) ( not ( = ?auto_743955 ?auto_743957 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_743956 ?auto_743957 )
      ( MAKE-2CRATE-VERIFY ?auto_743955 ?auto_743956 ?auto_743957 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_743965 - SURFACE
      ?auto_743966 - SURFACE
      ?auto_743967 - SURFACE
    )
    :vars
    (
      ?auto_743968 - HOIST
      ?auto_743970 - PLACE
      ?auto_743969 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_743968 ?auto_743970 ) ( SURFACE-AT ?auto_743966 ?auto_743970 ) ( CLEAR ?auto_743966 ) ( IS-CRATE ?auto_743967 ) ( not ( = ?auto_743966 ?auto_743967 ) ) ( TRUCK-AT ?auto_743969 ?auto_743970 ) ( AVAILABLE ?auto_743968 ) ( IN ?auto_743967 ?auto_743969 ) ( ON ?auto_743966 ?auto_743965 ) ( not ( = ?auto_743965 ?auto_743966 ) ) ( not ( = ?auto_743965 ?auto_743967 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_743966 ?auto_743967 )
      ( MAKE-2CRATE-VERIFY ?auto_743965 ?auto_743966 ?auto_743967 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_743971 - SURFACE
      ?auto_743972 - SURFACE
    )
    :vars
    (
      ?auto_743974 - HOIST
      ?auto_743976 - PLACE
      ?auto_743975 - TRUCK
      ?auto_743973 - SURFACE
      ?auto_743977 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_743974 ?auto_743976 ) ( SURFACE-AT ?auto_743971 ?auto_743976 ) ( CLEAR ?auto_743971 ) ( IS-CRATE ?auto_743972 ) ( not ( = ?auto_743971 ?auto_743972 ) ) ( AVAILABLE ?auto_743974 ) ( IN ?auto_743972 ?auto_743975 ) ( ON ?auto_743971 ?auto_743973 ) ( not ( = ?auto_743973 ?auto_743971 ) ) ( not ( = ?auto_743973 ?auto_743972 ) ) ( TRUCK-AT ?auto_743975 ?auto_743977 ) ( not ( = ?auto_743977 ?auto_743976 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_743975 ?auto_743977 ?auto_743976 )
      ( MAKE-2CRATE ?auto_743973 ?auto_743971 ?auto_743972 )
      ( MAKE-1CRATE-VERIFY ?auto_743971 ?auto_743972 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_743978 - SURFACE
      ?auto_743979 - SURFACE
      ?auto_743980 - SURFACE
    )
    :vars
    (
      ?auto_743984 - HOIST
      ?auto_743982 - PLACE
      ?auto_743981 - TRUCK
      ?auto_743983 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_743984 ?auto_743982 ) ( SURFACE-AT ?auto_743979 ?auto_743982 ) ( CLEAR ?auto_743979 ) ( IS-CRATE ?auto_743980 ) ( not ( = ?auto_743979 ?auto_743980 ) ) ( AVAILABLE ?auto_743984 ) ( IN ?auto_743980 ?auto_743981 ) ( ON ?auto_743979 ?auto_743978 ) ( not ( = ?auto_743978 ?auto_743979 ) ) ( not ( = ?auto_743978 ?auto_743980 ) ) ( TRUCK-AT ?auto_743981 ?auto_743983 ) ( not ( = ?auto_743983 ?auto_743982 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_743979 ?auto_743980 )
      ( MAKE-2CRATE-VERIFY ?auto_743978 ?auto_743979 ?auto_743980 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_743985 - SURFACE
      ?auto_743986 - SURFACE
    )
    :vars
    (
      ?auto_743989 - HOIST
      ?auto_743991 - PLACE
      ?auto_743988 - SURFACE
      ?auto_743990 - TRUCK
      ?auto_743987 - PLACE
      ?auto_743992 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_743989 ?auto_743991 ) ( SURFACE-AT ?auto_743985 ?auto_743991 ) ( CLEAR ?auto_743985 ) ( IS-CRATE ?auto_743986 ) ( not ( = ?auto_743985 ?auto_743986 ) ) ( AVAILABLE ?auto_743989 ) ( ON ?auto_743985 ?auto_743988 ) ( not ( = ?auto_743988 ?auto_743985 ) ) ( not ( = ?auto_743988 ?auto_743986 ) ) ( TRUCK-AT ?auto_743990 ?auto_743987 ) ( not ( = ?auto_743987 ?auto_743991 ) ) ( HOIST-AT ?auto_743992 ?auto_743987 ) ( LIFTING ?auto_743992 ?auto_743986 ) ( not ( = ?auto_743989 ?auto_743992 ) ) )
    :subtasks
    ( ( !LOAD ?auto_743992 ?auto_743986 ?auto_743990 ?auto_743987 )
      ( MAKE-2CRATE ?auto_743988 ?auto_743985 ?auto_743986 )
      ( MAKE-1CRATE-VERIFY ?auto_743985 ?auto_743986 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_743993 - SURFACE
      ?auto_743994 - SURFACE
      ?auto_743995 - SURFACE
    )
    :vars
    (
      ?auto_743997 - HOIST
      ?auto_744000 - PLACE
      ?auto_743998 - TRUCK
      ?auto_743996 - PLACE
      ?auto_743999 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_743997 ?auto_744000 ) ( SURFACE-AT ?auto_743994 ?auto_744000 ) ( CLEAR ?auto_743994 ) ( IS-CRATE ?auto_743995 ) ( not ( = ?auto_743994 ?auto_743995 ) ) ( AVAILABLE ?auto_743997 ) ( ON ?auto_743994 ?auto_743993 ) ( not ( = ?auto_743993 ?auto_743994 ) ) ( not ( = ?auto_743993 ?auto_743995 ) ) ( TRUCK-AT ?auto_743998 ?auto_743996 ) ( not ( = ?auto_743996 ?auto_744000 ) ) ( HOIST-AT ?auto_743999 ?auto_743996 ) ( LIFTING ?auto_743999 ?auto_743995 ) ( not ( = ?auto_743997 ?auto_743999 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_743994 ?auto_743995 )
      ( MAKE-2CRATE-VERIFY ?auto_743993 ?auto_743994 ?auto_743995 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744001 - SURFACE
      ?auto_744002 - SURFACE
    )
    :vars
    (
      ?auto_744007 - HOIST
      ?auto_744005 - PLACE
      ?auto_744008 - SURFACE
      ?auto_744006 - TRUCK
      ?auto_744004 - PLACE
      ?auto_744003 - HOIST
      ?auto_744009 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744007 ?auto_744005 ) ( SURFACE-AT ?auto_744001 ?auto_744005 ) ( CLEAR ?auto_744001 ) ( IS-CRATE ?auto_744002 ) ( not ( = ?auto_744001 ?auto_744002 ) ) ( AVAILABLE ?auto_744007 ) ( ON ?auto_744001 ?auto_744008 ) ( not ( = ?auto_744008 ?auto_744001 ) ) ( not ( = ?auto_744008 ?auto_744002 ) ) ( TRUCK-AT ?auto_744006 ?auto_744004 ) ( not ( = ?auto_744004 ?auto_744005 ) ) ( HOIST-AT ?auto_744003 ?auto_744004 ) ( not ( = ?auto_744007 ?auto_744003 ) ) ( AVAILABLE ?auto_744003 ) ( SURFACE-AT ?auto_744002 ?auto_744004 ) ( ON ?auto_744002 ?auto_744009 ) ( CLEAR ?auto_744002 ) ( not ( = ?auto_744001 ?auto_744009 ) ) ( not ( = ?auto_744002 ?auto_744009 ) ) ( not ( = ?auto_744008 ?auto_744009 ) ) )
    :subtasks
    ( ( !LIFT ?auto_744003 ?auto_744002 ?auto_744009 ?auto_744004 )
      ( MAKE-2CRATE ?auto_744008 ?auto_744001 ?auto_744002 )
      ( MAKE-1CRATE-VERIFY ?auto_744001 ?auto_744002 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_744010 - SURFACE
      ?auto_744011 - SURFACE
      ?auto_744012 - SURFACE
    )
    :vars
    (
      ?auto_744014 - HOIST
      ?auto_744016 - PLACE
      ?auto_744013 - TRUCK
      ?auto_744015 - PLACE
      ?auto_744018 - HOIST
      ?auto_744017 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744014 ?auto_744016 ) ( SURFACE-AT ?auto_744011 ?auto_744016 ) ( CLEAR ?auto_744011 ) ( IS-CRATE ?auto_744012 ) ( not ( = ?auto_744011 ?auto_744012 ) ) ( AVAILABLE ?auto_744014 ) ( ON ?auto_744011 ?auto_744010 ) ( not ( = ?auto_744010 ?auto_744011 ) ) ( not ( = ?auto_744010 ?auto_744012 ) ) ( TRUCK-AT ?auto_744013 ?auto_744015 ) ( not ( = ?auto_744015 ?auto_744016 ) ) ( HOIST-AT ?auto_744018 ?auto_744015 ) ( not ( = ?auto_744014 ?auto_744018 ) ) ( AVAILABLE ?auto_744018 ) ( SURFACE-AT ?auto_744012 ?auto_744015 ) ( ON ?auto_744012 ?auto_744017 ) ( CLEAR ?auto_744012 ) ( not ( = ?auto_744011 ?auto_744017 ) ) ( not ( = ?auto_744012 ?auto_744017 ) ) ( not ( = ?auto_744010 ?auto_744017 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744011 ?auto_744012 )
      ( MAKE-2CRATE-VERIFY ?auto_744010 ?auto_744011 ?auto_744012 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744019 - SURFACE
      ?auto_744020 - SURFACE
    )
    :vars
    (
      ?auto_744027 - HOIST
      ?auto_744025 - PLACE
      ?auto_744026 - SURFACE
      ?auto_744024 - PLACE
      ?auto_744021 - HOIST
      ?auto_744023 - SURFACE
      ?auto_744022 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744027 ?auto_744025 ) ( SURFACE-AT ?auto_744019 ?auto_744025 ) ( CLEAR ?auto_744019 ) ( IS-CRATE ?auto_744020 ) ( not ( = ?auto_744019 ?auto_744020 ) ) ( AVAILABLE ?auto_744027 ) ( ON ?auto_744019 ?auto_744026 ) ( not ( = ?auto_744026 ?auto_744019 ) ) ( not ( = ?auto_744026 ?auto_744020 ) ) ( not ( = ?auto_744024 ?auto_744025 ) ) ( HOIST-AT ?auto_744021 ?auto_744024 ) ( not ( = ?auto_744027 ?auto_744021 ) ) ( AVAILABLE ?auto_744021 ) ( SURFACE-AT ?auto_744020 ?auto_744024 ) ( ON ?auto_744020 ?auto_744023 ) ( CLEAR ?auto_744020 ) ( not ( = ?auto_744019 ?auto_744023 ) ) ( not ( = ?auto_744020 ?auto_744023 ) ) ( not ( = ?auto_744026 ?auto_744023 ) ) ( TRUCK-AT ?auto_744022 ?auto_744025 ) )
    :subtasks
    ( ( !DRIVE ?auto_744022 ?auto_744025 ?auto_744024 )
      ( MAKE-2CRATE ?auto_744026 ?auto_744019 ?auto_744020 )
      ( MAKE-1CRATE-VERIFY ?auto_744019 ?auto_744020 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_744028 - SURFACE
      ?auto_744029 - SURFACE
      ?auto_744030 - SURFACE
    )
    :vars
    (
      ?auto_744035 - HOIST
      ?auto_744034 - PLACE
      ?auto_744036 - PLACE
      ?auto_744031 - HOIST
      ?auto_744033 - SURFACE
      ?auto_744032 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744035 ?auto_744034 ) ( SURFACE-AT ?auto_744029 ?auto_744034 ) ( CLEAR ?auto_744029 ) ( IS-CRATE ?auto_744030 ) ( not ( = ?auto_744029 ?auto_744030 ) ) ( AVAILABLE ?auto_744035 ) ( ON ?auto_744029 ?auto_744028 ) ( not ( = ?auto_744028 ?auto_744029 ) ) ( not ( = ?auto_744028 ?auto_744030 ) ) ( not ( = ?auto_744036 ?auto_744034 ) ) ( HOIST-AT ?auto_744031 ?auto_744036 ) ( not ( = ?auto_744035 ?auto_744031 ) ) ( AVAILABLE ?auto_744031 ) ( SURFACE-AT ?auto_744030 ?auto_744036 ) ( ON ?auto_744030 ?auto_744033 ) ( CLEAR ?auto_744030 ) ( not ( = ?auto_744029 ?auto_744033 ) ) ( not ( = ?auto_744030 ?auto_744033 ) ) ( not ( = ?auto_744028 ?auto_744033 ) ) ( TRUCK-AT ?auto_744032 ?auto_744034 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744029 ?auto_744030 )
      ( MAKE-2CRATE-VERIFY ?auto_744028 ?auto_744029 ?auto_744030 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744037 - SURFACE
      ?auto_744038 - SURFACE
    )
    :vars
    (
      ?auto_744044 - HOIST
      ?auto_744041 - PLACE
      ?auto_744045 - SURFACE
      ?auto_744042 - PLACE
      ?auto_744043 - HOIST
      ?auto_744039 - SURFACE
      ?auto_744040 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744044 ?auto_744041 ) ( IS-CRATE ?auto_744038 ) ( not ( = ?auto_744037 ?auto_744038 ) ) ( not ( = ?auto_744045 ?auto_744037 ) ) ( not ( = ?auto_744045 ?auto_744038 ) ) ( not ( = ?auto_744042 ?auto_744041 ) ) ( HOIST-AT ?auto_744043 ?auto_744042 ) ( not ( = ?auto_744044 ?auto_744043 ) ) ( AVAILABLE ?auto_744043 ) ( SURFACE-AT ?auto_744038 ?auto_744042 ) ( ON ?auto_744038 ?auto_744039 ) ( CLEAR ?auto_744038 ) ( not ( = ?auto_744037 ?auto_744039 ) ) ( not ( = ?auto_744038 ?auto_744039 ) ) ( not ( = ?auto_744045 ?auto_744039 ) ) ( TRUCK-AT ?auto_744040 ?auto_744041 ) ( SURFACE-AT ?auto_744045 ?auto_744041 ) ( CLEAR ?auto_744045 ) ( LIFTING ?auto_744044 ?auto_744037 ) ( IS-CRATE ?auto_744037 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744045 ?auto_744037 )
      ( MAKE-2CRATE ?auto_744045 ?auto_744037 ?auto_744038 )
      ( MAKE-1CRATE-VERIFY ?auto_744037 ?auto_744038 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_744046 - SURFACE
      ?auto_744047 - SURFACE
      ?auto_744048 - SURFACE
    )
    :vars
    (
      ?auto_744049 - HOIST
      ?auto_744054 - PLACE
      ?auto_744050 - PLACE
      ?auto_744053 - HOIST
      ?auto_744052 - SURFACE
      ?auto_744051 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744049 ?auto_744054 ) ( IS-CRATE ?auto_744048 ) ( not ( = ?auto_744047 ?auto_744048 ) ) ( not ( = ?auto_744046 ?auto_744047 ) ) ( not ( = ?auto_744046 ?auto_744048 ) ) ( not ( = ?auto_744050 ?auto_744054 ) ) ( HOIST-AT ?auto_744053 ?auto_744050 ) ( not ( = ?auto_744049 ?auto_744053 ) ) ( AVAILABLE ?auto_744053 ) ( SURFACE-AT ?auto_744048 ?auto_744050 ) ( ON ?auto_744048 ?auto_744052 ) ( CLEAR ?auto_744048 ) ( not ( = ?auto_744047 ?auto_744052 ) ) ( not ( = ?auto_744048 ?auto_744052 ) ) ( not ( = ?auto_744046 ?auto_744052 ) ) ( TRUCK-AT ?auto_744051 ?auto_744054 ) ( SURFACE-AT ?auto_744046 ?auto_744054 ) ( CLEAR ?auto_744046 ) ( LIFTING ?auto_744049 ?auto_744047 ) ( IS-CRATE ?auto_744047 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744047 ?auto_744048 )
      ( MAKE-2CRATE-VERIFY ?auto_744046 ?auto_744047 ?auto_744048 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744055 - SURFACE
      ?auto_744056 - SURFACE
    )
    :vars
    (
      ?auto_744061 - HOIST
      ?auto_744063 - PLACE
      ?auto_744059 - SURFACE
      ?auto_744058 - PLACE
      ?auto_744060 - HOIST
      ?auto_744057 - SURFACE
      ?auto_744062 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744061 ?auto_744063 ) ( IS-CRATE ?auto_744056 ) ( not ( = ?auto_744055 ?auto_744056 ) ) ( not ( = ?auto_744059 ?auto_744055 ) ) ( not ( = ?auto_744059 ?auto_744056 ) ) ( not ( = ?auto_744058 ?auto_744063 ) ) ( HOIST-AT ?auto_744060 ?auto_744058 ) ( not ( = ?auto_744061 ?auto_744060 ) ) ( AVAILABLE ?auto_744060 ) ( SURFACE-AT ?auto_744056 ?auto_744058 ) ( ON ?auto_744056 ?auto_744057 ) ( CLEAR ?auto_744056 ) ( not ( = ?auto_744055 ?auto_744057 ) ) ( not ( = ?auto_744056 ?auto_744057 ) ) ( not ( = ?auto_744059 ?auto_744057 ) ) ( TRUCK-AT ?auto_744062 ?auto_744063 ) ( SURFACE-AT ?auto_744059 ?auto_744063 ) ( CLEAR ?auto_744059 ) ( IS-CRATE ?auto_744055 ) ( AVAILABLE ?auto_744061 ) ( IN ?auto_744055 ?auto_744062 ) )
    :subtasks
    ( ( !UNLOAD ?auto_744061 ?auto_744055 ?auto_744062 ?auto_744063 )
      ( MAKE-2CRATE ?auto_744059 ?auto_744055 ?auto_744056 )
      ( MAKE-1CRATE-VERIFY ?auto_744055 ?auto_744056 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_744064 - SURFACE
      ?auto_744065 - SURFACE
      ?auto_744066 - SURFACE
    )
    :vars
    (
      ?auto_744072 - HOIST
      ?auto_744069 - PLACE
      ?auto_744067 - PLACE
      ?auto_744068 - HOIST
      ?auto_744071 - SURFACE
      ?auto_744070 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744072 ?auto_744069 ) ( IS-CRATE ?auto_744066 ) ( not ( = ?auto_744065 ?auto_744066 ) ) ( not ( = ?auto_744064 ?auto_744065 ) ) ( not ( = ?auto_744064 ?auto_744066 ) ) ( not ( = ?auto_744067 ?auto_744069 ) ) ( HOIST-AT ?auto_744068 ?auto_744067 ) ( not ( = ?auto_744072 ?auto_744068 ) ) ( AVAILABLE ?auto_744068 ) ( SURFACE-AT ?auto_744066 ?auto_744067 ) ( ON ?auto_744066 ?auto_744071 ) ( CLEAR ?auto_744066 ) ( not ( = ?auto_744065 ?auto_744071 ) ) ( not ( = ?auto_744066 ?auto_744071 ) ) ( not ( = ?auto_744064 ?auto_744071 ) ) ( TRUCK-AT ?auto_744070 ?auto_744069 ) ( SURFACE-AT ?auto_744064 ?auto_744069 ) ( CLEAR ?auto_744064 ) ( IS-CRATE ?auto_744065 ) ( AVAILABLE ?auto_744072 ) ( IN ?auto_744065 ?auto_744070 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744065 ?auto_744066 )
      ( MAKE-2CRATE-VERIFY ?auto_744064 ?auto_744065 ?auto_744066 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744109 - SURFACE
      ?auto_744110 - SURFACE
    )
    :vars
    (
      ?auto_744114 - HOIST
      ?auto_744116 - PLACE
      ?auto_744113 - SURFACE
      ?auto_744117 - PLACE
      ?auto_744115 - HOIST
      ?auto_744112 - SURFACE
      ?auto_744111 - TRUCK
      ?auto_744118 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744114 ?auto_744116 ) ( SURFACE-AT ?auto_744109 ?auto_744116 ) ( CLEAR ?auto_744109 ) ( IS-CRATE ?auto_744110 ) ( not ( = ?auto_744109 ?auto_744110 ) ) ( AVAILABLE ?auto_744114 ) ( ON ?auto_744109 ?auto_744113 ) ( not ( = ?auto_744113 ?auto_744109 ) ) ( not ( = ?auto_744113 ?auto_744110 ) ) ( not ( = ?auto_744117 ?auto_744116 ) ) ( HOIST-AT ?auto_744115 ?auto_744117 ) ( not ( = ?auto_744114 ?auto_744115 ) ) ( AVAILABLE ?auto_744115 ) ( SURFACE-AT ?auto_744110 ?auto_744117 ) ( ON ?auto_744110 ?auto_744112 ) ( CLEAR ?auto_744110 ) ( not ( = ?auto_744109 ?auto_744112 ) ) ( not ( = ?auto_744110 ?auto_744112 ) ) ( not ( = ?auto_744113 ?auto_744112 ) ) ( TRUCK-AT ?auto_744111 ?auto_744118 ) ( not ( = ?auto_744118 ?auto_744116 ) ) ( not ( = ?auto_744117 ?auto_744118 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_744111 ?auto_744118 ?auto_744116 )
      ( MAKE-1CRATE ?auto_744109 ?auto_744110 )
      ( MAKE-1CRATE-VERIFY ?auto_744109 ?auto_744110 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_744148 - SURFACE
      ?auto_744149 - SURFACE
      ?auto_744150 - SURFACE
      ?auto_744151 - SURFACE
    )
    :vars
    (
      ?auto_744152 - HOIST
      ?auto_744153 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744152 ?auto_744153 ) ( SURFACE-AT ?auto_744150 ?auto_744153 ) ( CLEAR ?auto_744150 ) ( LIFTING ?auto_744152 ?auto_744151 ) ( IS-CRATE ?auto_744151 ) ( not ( = ?auto_744150 ?auto_744151 ) ) ( ON ?auto_744149 ?auto_744148 ) ( ON ?auto_744150 ?auto_744149 ) ( not ( = ?auto_744148 ?auto_744149 ) ) ( not ( = ?auto_744148 ?auto_744150 ) ) ( not ( = ?auto_744148 ?auto_744151 ) ) ( not ( = ?auto_744149 ?auto_744150 ) ) ( not ( = ?auto_744149 ?auto_744151 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744150 ?auto_744151 )
      ( MAKE-3CRATE-VERIFY ?auto_744148 ?auto_744149 ?auto_744150 ?auto_744151 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_744165 - SURFACE
      ?auto_744166 - SURFACE
      ?auto_744167 - SURFACE
      ?auto_744168 - SURFACE
    )
    :vars
    (
      ?auto_744169 - HOIST
      ?auto_744170 - PLACE
      ?auto_744171 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744169 ?auto_744170 ) ( SURFACE-AT ?auto_744167 ?auto_744170 ) ( CLEAR ?auto_744167 ) ( IS-CRATE ?auto_744168 ) ( not ( = ?auto_744167 ?auto_744168 ) ) ( TRUCK-AT ?auto_744171 ?auto_744170 ) ( AVAILABLE ?auto_744169 ) ( IN ?auto_744168 ?auto_744171 ) ( ON ?auto_744167 ?auto_744166 ) ( not ( = ?auto_744166 ?auto_744167 ) ) ( not ( = ?auto_744166 ?auto_744168 ) ) ( ON ?auto_744166 ?auto_744165 ) ( not ( = ?auto_744165 ?auto_744166 ) ) ( not ( = ?auto_744165 ?auto_744167 ) ) ( not ( = ?auto_744165 ?auto_744168 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744166 ?auto_744167 ?auto_744168 )
      ( MAKE-3CRATE-VERIFY ?auto_744165 ?auto_744166 ?auto_744167 ?auto_744168 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_744186 - SURFACE
      ?auto_744187 - SURFACE
      ?auto_744188 - SURFACE
      ?auto_744189 - SURFACE
    )
    :vars
    (
      ?auto_744193 - HOIST
      ?auto_744192 - PLACE
      ?auto_744191 - TRUCK
      ?auto_744190 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744193 ?auto_744192 ) ( SURFACE-AT ?auto_744188 ?auto_744192 ) ( CLEAR ?auto_744188 ) ( IS-CRATE ?auto_744189 ) ( not ( = ?auto_744188 ?auto_744189 ) ) ( AVAILABLE ?auto_744193 ) ( IN ?auto_744189 ?auto_744191 ) ( ON ?auto_744188 ?auto_744187 ) ( not ( = ?auto_744187 ?auto_744188 ) ) ( not ( = ?auto_744187 ?auto_744189 ) ) ( TRUCK-AT ?auto_744191 ?auto_744190 ) ( not ( = ?auto_744190 ?auto_744192 ) ) ( ON ?auto_744187 ?auto_744186 ) ( not ( = ?auto_744186 ?auto_744187 ) ) ( not ( = ?auto_744186 ?auto_744188 ) ) ( not ( = ?auto_744186 ?auto_744189 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744187 ?auto_744188 ?auto_744189 )
      ( MAKE-3CRATE-VERIFY ?auto_744186 ?auto_744187 ?auto_744188 ?auto_744189 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_744210 - SURFACE
      ?auto_744211 - SURFACE
      ?auto_744212 - SURFACE
      ?auto_744213 - SURFACE
    )
    :vars
    (
      ?auto_744216 - HOIST
      ?auto_744215 - PLACE
      ?auto_744217 - TRUCK
      ?auto_744218 - PLACE
      ?auto_744214 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_744216 ?auto_744215 ) ( SURFACE-AT ?auto_744212 ?auto_744215 ) ( CLEAR ?auto_744212 ) ( IS-CRATE ?auto_744213 ) ( not ( = ?auto_744212 ?auto_744213 ) ) ( AVAILABLE ?auto_744216 ) ( ON ?auto_744212 ?auto_744211 ) ( not ( = ?auto_744211 ?auto_744212 ) ) ( not ( = ?auto_744211 ?auto_744213 ) ) ( TRUCK-AT ?auto_744217 ?auto_744218 ) ( not ( = ?auto_744218 ?auto_744215 ) ) ( HOIST-AT ?auto_744214 ?auto_744218 ) ( LIFTING ?auto_744214 ?auto_744213 ) ( not ( = ?auto_744216 ?auto_744214 ) ) ( ON ?auto_744211 ?auto_744210 ) ( not ( = ?auto_744210 ?auto_744211 ) ) ( not ( = ?auto_744210 ?auto_744212 ) ) ( not ( = ?auto_744210 ?auto_744213 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744211 ?auto_744212 ?auto_744213 )
      ( MAKE-3CRATE-VERIFY ?auto_744210 ?auto_744211 ?auto_744212 ?auto_744213 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_744237 - SURFACE
      ?auto_744238 - SURFACE
      ?auto_744239 - SURFACE
      ?auto_744240 - SURFACE
    )
    :vars
    (
      ?auto_744243 - HOIST
      ?auto_744241 - PLACE
      ?auto_744246 - TRUCK
      ?auto_744245 - PLACE
      ?auto_744242 - HOIST
      ?auto_744244 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744243 ?auto_744241 ) ( SURFACE-AT ?auto_744239 ?auto_744241 ) ( CLEAR ?auto_744239 ) ( IS-CRATE ?auto_744240 ) ( not ( = ?auto_744239 ?auto_744240 ) ) ( AVAILABLE ?auto_744243 ) ( ON ?auto_744239 ?auto_744238 ) ( not ( = ?auto_744238 ?auto_744239 ) ) ( not ( = ?auto_744238 ?auto_744240 ) ) ( TRUCK-AT ?auto_744246 ?auto_744245 ) ( not ( = ?auto_744245 ?auto_744241 ) ) ( HOIST-AT ?auto_744242 ?auto_744245 ) ( not ( = ?auto_744243 ?auto_744242 ) ) ( AVAILABLE ?auto_744242 ) ( SURFACE-AT ?auto_744240 ?auto_744245 ) ( ON ?auto_744240 ?auto_744244 ) ( CLEAR ?auto_744240 ) ( not ( = ?auto_744239 ?auto_744244 ) ) ( not ( = ?auto_744240 ?auto_744244 ) ) ( not ( = ?auto_744238 ?auto_744244 ) ) ( ON ?auto_744238 ?auto_744237 ) ( not ( = ?auto_744237 ?auto_744238 ) ) ( not ( = ?auto_744237 ?auto_744239 ) ) ( not ( = ?auto_744237 ?auto_744240 ) ) ( not ( = ?auto_744237 ?auto_744244 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744238 ?auto_744239 ?auto_744240 )
      ( MAKE-3CRATE-VERIFY ?auto_744237 ?auto_744238 ?auto_744239 ?auto_744240 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_744265 - SURFACE
      ?auto_744266 - SURFACE
      ?auto_744267 - SURFACE
      ?auto_744268 - SURFACE
    )
    :vars
    (
      ?auto_744270 - HOIST
      ?auto_744269 - PLACE
      ?auto_744272 - PLACE
      ?auto_744271 - HOIST
      ?auto_744274 - SURFACE
      ?auto_744273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744270 ?auto_744269 ) ( SURFACE-AT ?auto_744267 ?auto_744269 ) ( CLEAR ?auto_744267 ) ( IS-CRATE ?auto_744268 ) ( not ( = ?auto_744267 ?auto_744268 ) ) ( AVAILABLE ?auto_744270 ) ( ON ?auto_744267 ?auto_744266 ) ( not ( = ?auto_744266 ?auto_744267 ) ) ( not ( = ?auto_744266 ?auto_744268 ) ) ( not ( = ?auto_744272 ?auto_744269 ) ) ( HOIST-AT ?auto_744271 ?auto_744272 ) ( not ( = ?auto_744270 ?auto_744271 ) ) ( AVAILABLE ?auto_744271 ) ( SURFACE-AT ?auto_744268 ?auto_744272 ) ( ON ?auto_744268 ?auto_744274 ) ( CLEAR ?auto_744268 ) ( not ( = ?auto_744267 ?auto_744274 ) ) ( not ( = ?auto_744268 ?auto_744274 ) ) ( not ( = ?auto_744266 ?auto_744274 ) ) ( TRUCK-AT ?auto_744273 ?auto_744269 ) ( ON ?auto_744266 ?auto_744265 ) ( not ( = ?auto_744265 ?auto_744266 ) ) ( not ( = ?auto_744265 ?auto_744267 ) ) ( not ( = ?auto_744265 ?auto_744268 ) ) ( not ( = ?auto_744265 ?auto_744274 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744266 ?auto_744267 ?auto_744268 )
      ( MAKE-3CRATE-VERIFY ?auto_744265 ?auto_744266 ?auto_744267 ?auto_744268 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_744293 - SURFACE
      ?auto_744294 - SURFACE
      ?auto_744295 - SURFACE
      ?auto_744296 - SURFACE
    )
    :vars
    (
      ?auto_744300 - HOIST
      ?auto_744297 - PLACE
      ?auto_744299 - PLACE
      ?auto_744301 - HOIST
      ?auto_744298 - SURFACE
      ?auto_744302 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744300 ?auto_744297 ) ( IS-CRATE ?auto_744296 ) ( not ( = ?auto_744295 ?auto_744296 ) ) ( not ( = ?auto_744294 ?auto_744295 ) ) ( not ( = ?auto_744294 ?auto_744296 ) ) ( not ( = ?auto_744299 ?auto_744297 ) ) ( HOIST-AT ?auto_744301 ?auto_744299 ) ( not ( = ?auto_744300 ?auto_744301 ) ) ( AVAILABLE ?auto_744301 ) ( SURFACE-AT ?auto_744296 ?auto_744299 ) ( ON ?auto_744296 ?auto_744298 ) ( CLEAR ?auto_744296 ) ( not ( = ?auto_744295 ?auto_744298 ) ) ( not ( = ?auto_744296 ?auto_744298 ) ) ( not ( = ?auto_744294 ?auto_744298 ) ) ( TRUCK-AT ?auto_744302 ?auto_744297 ) ( SURFACE-AT ?auto_744294 ?auto_744297 ) ( CLEAR ?auto_744294 ) ( LIFTING ?auto_744300 ?auto_744295 ) ( IS-CRATE ?auto_744295 ) ( ON ?auto_744294 ?auto_744293 ) ( not ( = ?auto_744293 ?auto_744294 ) ) ( not ( = ?auto_744293 ?auto_744295 ) ) ( not ( = ?auto_744293 ?auto_744296 ) ) ( not ( = ?auto_744293 ?auto_744298 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744294 ?auto_744295 ?auto_744296 )
      ( MAKE-3CRATE-VERIFY ?auto_744293 ?auto_744294 ?auto_744295 ?auto_744296 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_744321 - SURFACE
      ?auto_744322 - SURFACE
      ?auto_744323 - SURFACE
      ?auto_744324 - SURFACE
    )
    :vars
    (
      ?auto_744325 - HOIST
      ?auto_744328 - PLACE
      ?auto_744327 - PLACE
      ?auto_744326 - HOIST
      ?auto_744330 - SURFACE
      ?auto_744329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744325 ?auto_744328 ) ( IS-CRATE ?auto_744324 ) ( not ( = ?auto_744323 ?auto_744324 ) ) ( not ( = ?auto_744322 ?auto_744323 ) ) ( not ( = ?auto_744322 ?auto_744324 ) ) ( not ( = ?auto_744327 ?auto_744328 ) ) ( HOIST-AT ?auto_744326 ?auto_744327 ) ( not ( = ?auto_744325 ?auto_744326 ) ) ( AVAILABLE ?auto_744326 ) ( SURFACE-AT ?auto_744324 ?auto_744327 ) ( ON ?auto_744324 ?auto_744330 ) ( CLEAR ?auto_744324 ) ( not ( = ?auto_744323 ?auto_744330 ) ) ( not ( = ?auto_744324 ?auto_744330 ) ) ( not ( = ?auto_744322 ?auto_744330 ) ) ( TRUCK-AT ?auto_744329 ?auto_744328 ) ( SURFACE-AT ?auto_744322 ?auto_744328 ) ( CLEAR ?auto_744322 ) ( IS-CRATE ?auto_744323 ) ( AVAILABLE ?auto_744325 ) ( IN ?auto_744323 ?auto_744329 ) ( ON ?auto_744322 ?auto_744321 ) ( not ( = ?auto_744321 ?auto_744322 ) ) ( not ( = ?auto_744321 ?auto_744323 ) ) ( not ( = ?auto_744321 ?auto_744324 ) ) ( not ( = ?auto_744321 ?auto_744330 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744322 ?auto_744323 ?auto_744324 )
      ( MAKE-3CRATE-VERIFY ?auto_744321 ?auto_744322 ?auto_744323 ?auto_744324 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_744612 - SURFACE
      ?auto_744613 - SURFACE
      ?auto_744614 - SURFACE
      ?auto_744616 - SURFACE
      ?auto_744615 - SURFACE
    )
    :vars
    (
      ?auto_744618 - HOIST
      ?auto_744617 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744618 ?auto_744617 ) ( SURFACE-AT ?auto_744616 ?auto_744617 ) ( CLEAR ?auto_744616 ) ( LIFTING ?auto_744618 ?auto_744615 ) ( IS-CRATE ?auto_744615 ) ( not ( = ?auto_744616 ?auto_744615 ) ) ( ON ?auto_744613 ?auto_744612 ) ( ON ?auto_744614 ?auto_744613 ) ( ON ?auto_744616 ?auto_744614 ) ( not ( = ?auto_744612 ?auto_744613 ) ) ( not ( = ?auto_744612 ?auto_744614 ) ) ( not ( = ?auto_744612 ?auto_744616 ) ) ( not ( = ?auto_744612 ?auto_744615 ) ) ( not ( = ?auto_744613 ?auto_744614 ) ) ( not ( = ?auto_744613 ?auto_744616 ) ) ( not ( = ?auto_744613 ?auto_744615 ) ) ( not ( = ?auto_744614 ?auto_744616 ) ) ( not ( = ?auto_744614 ?auto_744615 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744616 ?auto_744615 )
      ( MAKE-4CRATE-VERIFY ?auto_744612 ?auto_744613 ?auto_744614 ?auto_744616 ?auto_744615 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_744637 - SURFACE
      ?auto_744638 - SURFACE
      ?auto_744639 - SURFACE
      ?auto_744641 - SURFACE
      ?auto_744640 - SURFACE
    )
    :vars
    (
      ?auto_744644 - HOIST
      ?auto_744643 - PLACE
      ?auto_744642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744644 ?auto_744643 ) ( SURFACE-AT ?auto_744641 ?auto_744643 ) ( CLEAR ?auto_744641 ) ( IS-CRATE ?auto_744640 ) ( not ( = ?auto_744641 ?auto_744640 ) ) ( TRUCK-AT ?auto_744642 ?auto_744643 ) ( AVAILABLE ?auto_744644 ) ( IN ?auto_744640 ?auto_744642 ) ( ON ?auto_744641 ?auto_744639 ) ( not ( = ?auto_744639 ?auto_744641 ) ) ( not ( = ?auto_744639 ?auto_744640 ) ) ( ON ?auto_744638 ?auto_744637 ) ( ON ?auto_744639 ?auto_744638 ) ( not ( = ?auto_744637 ?auto_744638 ) ) ( not ( = ?auto_744637 ?auto_744639 ) ) ( not ( = ?auto_744637 ?auto_744641 ) ) ( not ( = ?auto_744637 ?auto_744640 ) ) ( not ( = ?auto_744638 ?auto_744639 ) ) ( not ( = ?auto_744638 ?auto_744641 ) ) ( not ( = ?auto_744638 ?auto_744640 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744639 ?auto_744641 ?auto_744640 )
      ( MAKE-4CRATE-VERIFY ?auto_744637 ?auto_744638 ?auto_744639 ?auto_744641 ?auto_744640 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_744667 - SURFACE
      ?auto_744668 - SURFACE
      ?auto_744669 - SURFACE
      ?auto_744671 - SURFACE
      ?auto_744670 - SURFACE
    )
    :vars
    (
      ?auto_744673 - HOIST
      ?auto_744672 - PLACE
      ?auto_744675 - TRUCK
      ?auto_744674 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744673 ?auto_744672 ) ( SURFACE-AT ?auto_744671 ?auto_744672 ) ( CLEAR ?auto_744671 ) ( IS-CRATE ?auto_744670 ) ( not ( = ?auto_744671 ?auto_744670 ) ) ( AVAILABLE ?auto_744673 ) ( IN ?auto_744670 ?auto_744675 ) ( ON ?auto_744671 ?auto_744669 ) ( not ( = ?auto_744669 ?auto_744671 ) ) ( not ( = ?auto_744669 ?auto_744670 ) ) ( TRUCK-AT ?auto_744675 ?auto_744674 ) ( not ( = ?auto_744674 ?auto_744672 ) ) ( ON ?auto_744668 ?auto_744667 ) ( ON ?auto_744669 ?auto_744668 ) ( not ( = ?auto_744667 ?auto_744668 ) ) ( not ( = ?auto_744667 ?auto_744669 ) ) ( not ( = ?auto_744667 ?auto_744671 ) ) ( not ( = ?auto_744667 ?auto_744670 ) ) ( not ( = ?auto_744668 ?auto_744669 ) ) ( not ( = ?auto_744668 ?auto_744671 ) ) ( not ( = ?auto_744668 ?auto_744670 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744669 ?auto_744671 ?auto_744670 )
      ( MAKE-4CRATE-VERIFY ?auto_744667 ?auto_744668 ?auto_744669 ?auto_744671 ?auto_744670 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_744701 - SURFACE
      ?auto_744702 - SURFACE
      ?auto_744703 - SURFACE
      ?auto_744705 - SURFACE
      ?auto_744704 - SURFACE
    )
    :vars
    (
      ?auto_744710 - HOIST
      ?auto_744708 - PLACE
      ?auto_744707 - TRUCK
      ?auto_744709 - PLACE
      ?auto_744706 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_744710 ?auto_744708 ) ( SURFACE-AT ?auto_744705 ?auto_744708 ) ( CLEAR ?auto_744705 ) ( IS-CRATE ?auto_744704 ) ( not ( = ?auto_744705 ?auto_744704 ) ) ( AVAILABLE ?auto_744710 ) ( ON ?auto_744705 ?auto_744703 ) ( not ( = ?auto_744703 ?auto_744705 ) ) ( not ( = ?auto_744703 ?auto_744704 ) ) ( TRUCK-AT ?auto_744707 ?auto_744709 ) ( not ( = ?auto_744709 ?auto_744708 ) ) ( HOIST-AT ?auto_744706 ?auto_744709 ) ( LIFTING ?auto_744706 ?auto_744704 ) ( not ( = ?auto_744710 ?auto_744706 ) ) ( ON ?auto_744702 ?auto_744701 ) ( ON ?auto_744703 ?auto_744702 ) ( not ( = ?auto_744701 ?auto_744702 ) ) ( not ( = ?auto_744701 ?auto_744703 ) ) ( not ( = ?auto_744701 ?auto_744705 ) ) ( not ( = ?auto_744701 ?auto_744704 ) ) ( not ( = ?auto_744702 ?auto_744703 ) ) ( not ( = ?auto_744702 ?auto_744705 ) ) ( not ( = ?auto_744702 ?auto_744704 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744703 ?auto_744705 ?auto_744704 )
      ( MAKE-4CRATE-VERIFY ?auto_744701 ?auto_744702 ?auto_744703 ?auto_744705 ?auto_744704 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_744739 - SURFACE
      ?auto_744740 - SURFACE
      ?auto_744741 - SURFACE
      ?auto_744743 - SURFACE
      ?auto_744742 - SURFACE
    )
    :vars
    (
      ?auto_744749 - HOIST
      ?auto_744745 - PLACE
      ?auto_744747 - TRUCK
      ?auto_744746 - PLACE
      ?auto_744748 - HOIST
      ?auto_744744 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744749 ?auto_744745 ) ( SURFACE-AT ?auto_744743 ?auto_744745 ) ( CLEAR ?auto_744743 ) ( IS-CRATE ?auto_744742 ) ( not ( = ?auto_744743 ?auto_744742 ) ) ( AVAILABLE ?auto_744749 ) ( ON ?auto_744743 ?auto_744741 ) ( not ( = ?auto_744741 ?auto_744743 ) ) ( not ( = ?auto_744741 ?auto_744742 ) ) ( TRUCK-AT ?auto_744747 ?auto_744746 ) ( not ( = ?auto_744746 ?auto_744745 ) ) ( HOIST-AT ?auto_744748 ?auto_744746 ) ( not ( = ?auto_744749 ?auto_744748 ) ) ( AVAILABLE ?auto_744748 ) ( SURFACE-AT ?auto_744742 ?auto_744746 ) ( ON ?auto_744742 ?auto_744744 ) ( CLEAR ?auto_744742 ) ( not ( = ?auto_744743 ?auto_744744 ) ) ( not ( = ?auto_744742 ?auto_744744 ) ) ( not ( = ?auto_744741 ?auto_744744 ) ) ( ON ?auto_744740 ?auto_744739 ) ( ON ?auto_744741 ?auto_744740 ) ( not ( = ?auto_744739 ?auto_744740 ) ) ( not ( = ?auto_744739 ?auto_744741 ) ) ( not ( = ?auto_744739 ?auto_744743 ) ) ( not ( = ?auto_744739 ?auto_744742 ) ) ( not ( = ?auto_744739 ?auto_744744 ) ) ( not ( = ?auto_744740 ?auto_744741 ) ) ( not ( = ?auto_744740 ?auto_744743 ) ) ( not ( = ?auto_744740 ?auto_744742 ) ) ( not ( = ?auto_744740 ?auto_744744 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744741 ?auto_744743 ?auto_744742 )
      ( MAKE-4CRATE-VERIFY ?auto_744739 ?auto_744740 ?auto_744741 ?auto_744743 ?auto_744742 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_744778 - SURFACE
      ?auto_744779 - SURFACE
      ?auto_744780 - SURFACE
      ?auto_744782 - SURFACE
      ?auto_744781 - SURFACE
    )
    :vars
    (
      ?auto_744783 - HOIST
      ?auto_744787 - PLACE
      ?auto_744784 - PLACE
      ?auto_744788 - HOIST
      ?auto_744785 - SURFACE
      ?auto_744786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744783 ?auto_744787 ) ( SURFACE-AT ?auto_744782 ?auto_744787 ) ( CLEAR ?auto_744782 ) ( IS-CRATE ?auto_744781 ) ( not ( = ?auto_744782 ?auto_744781 ) ) ( AVAILABLE ?auto_744783 ) ( ON ?auto_744782 ?auto_744780 ) ( not ( = ?auto_744780 ?auto_744782 ) ) ( not ( = ?auto_744780 ?auto_744781 ) ) ( not ( = ?auto_744784 ?auto_744787 ) ) ( HOIST-AT ?auto_744788 ?auto_744784 ) ( not ( = ?auto_744783 ?auto_744788 ) ) ( AVAILABLE ?auto_744788 ) ( SURFACE-AT ?auto_744781 ?auto_744784 ) ( ON ?auto_744781 ?auto_744785 ) ( CLEAR ?auto_744781 ) ( not ( = ?auto_744782 ?auto_744785 ) ) ( not ( = ?auto_744781 ?auto_744785 ) ) ( not ( = ?auto_744780 ?auto_744785 ) ) ( TRUCK-AT ?auto_744786 ?auto_744787 ) ( ON ?auto_744779 ?auto_744778 ) ( ON ?auto_744780 ?auto_744779 ) ( not ( = ?auto_744778 ?auto_744779 ) ) ( not ( = ?auto_744778 ?auto_744780 ) ) ( not ( = ?auto_744778 ?auto_744782 ) ) ( not ( = ?auto_744778 ?auto_744781 ) ) ( not ( = ?auto_744778 ?auto_744785 ) ) ( not ( = ?auto_744779 ?auto_744780 ) ) ( not ( = ?auto_744779 ?auto_744782 ) ) ( not ( = ?auto_744779 ?auto_744781 ) ) ( not ( = ?auto_744779 ?auto_744785 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744780 ?auto_744782 ?auto_744781 )
      ( MAKE-4CRATE-VERIFY ?auto_744778 ?auto_744779 ?auto_744780 ?auto_744782 ?auto_744781 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_744817 - SURFACE
      ?auto_744818 - SURFACE
      ?auto_744819 - SURFACE
      ?auto_744821 - SURFACE
      ?auto_744820 - SURFACE
    )
    :vars
    (
      ?auto_744823 - HOIST
      ?auto_744825 - PLACE
      ?auto_744822 - PLACE
      ?auto_744826 - HOIST
      ?auto_744824 - SURFACE
      ?auto_744827 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744823 ?auto_744825 ) ( IS-CRATE ?auto_744820 ) ( not ( = ?auto_744821 ?auto_744820 ) ) ( not ( = ?auto_744819 ?auto_744821 ) ) ( not ( = ?auto_744819 ?auto_744820 ) ) ( not ( = ?auto_744822 ?auto_744825 ) ) ( HOIST-AT ?auto_744826 ?auto_744822 ) ( not ( = ?auto_744823 ?auto_744826 ) ) ( AVAILABLE ?auto_744826 ) ( SURFACE-AT ?auto_744820 ?auto_744822 ) ( ON ?auto_744820 ?auto_744824 ) ( CLEAR ?auto_744820 ) ( not ( = ?auto_744821 ?auto_744824 ) ) ( not ( = ?auto_744820 ?auto_744824 ) ) ( not ( = ?auto_744819 ?auto_744824 ) ) ( TRUCK-AT ?auto_744827 ?auto_744825 ) ( SURFACE-AT ?auto_744819 ?auto_744825 ) ( CLEAR ?auto_744819 ) ( LIFTING ?auto_744823 ?auto_744821 ) ( IS-CRATE ?auto_744821 ) ( ON ?auto_744818 ?auto_744817 ) ( ON ?auto_744819 ?auto_744818 ) ( not ( = ?auto_744817 ?auto_744818 ) ) ( not ( = ?auto_744817 ?auto_744819 ) ) ( not ( = ?auto_744817 ?auto_744821 ) ) ( not ( = ?auto_744817 ?auto_744820 ) ) ( not ( = ?auto_744817 ?auto_744824 ) ) ( not ( = ?auto_744818 ?auto_744819 ) ) ( not ( = ?auto_744818 ?auto_744821 ) ) ( not ( = ?auto_744818 ?auto_744820 ) ) ( not ( = ?auto_744818 ?auto_744824 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744819 ?auto_744821 ?auto_744820 )
      ( MAKE-4CRATE-VERIFY ?auto_744817 ?auto_744818 ?auto_744819 ?auto_744821 ?auto_744820 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_744856 - SURFACE
      ?auto_744857 - SURFACE
      ?auto_744858 - SURFACE
      ?auto_744860 - SURFACE
      ?auto_744859 - SURFACE
    )
    :vars
    (
      ?auto_744866 - HOIST
      ?auto_744865 - PLACE
      ?auto_744863 - PLACE
      ?auto_744861 - HOIST
      ?auto_744862 - SURFACE
      ?auto_744864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744866 ?auto_744865 ) ( IS-CRATE ?auto_744859 ) ( not ( = ?auto_744860 ?auto_744859 ) ) ( not ( = ?auto_744858 ?auto_744860 ) ) ( not ( = ?auto_744858 ?auto_744859 ) ) ( not ( = ?auto_744863 ?auto_744865 ) ) ( HOIST-AT ?auto_744861 ?auto_744863 ) ( not ( = ?auto_744866 ?auto_744861 ) ) ( AVAILABLE ?auto_744861 ) ( SURFACE-AT ?auto_744859 ?auto_744863 ) ( ON ?auto_744859 ?auto_744862 ) ( CLEAR ?auto_744859 ) ( not ( = ?auto_744860 ?auto_744862 ) ) ( not ( = ?auto_744859 ?auto_744862 ) ) ( not ( = ?auto_744858 ?auto_744862 ) ) ( TRUCK-AT ?auto_744864 ?auto_744865 ) ( SURFACE-AT ?auto_744858 ?auto_744865 ) ( CLEAR ?auto_744858 ) ( IS-CRATE ?auto_744860 ) ( AVAILABLE ?auto_744866 ) ( IN ?auto_744860 ?auto_744864 ) ( ON ?auto_744857 ?auto_744856 ) ( ON ?auto_744858 ?auto_744857 ) ( not ( = ?auto_744856 ?auto_744857 ) ) ( not ( = ?auto_744856 ?auto_744858 ) ) ( not ( = ?auto_744856 ?auto_744860 ) ) ( not ( = ?auto_744856 ?auto_744859 ) ) ( not ( = ?auto_744856 ?auto_744862 ) ) ( not ( = ?auto_744857 ?auto_744858 ) ) ( not ( = ?auto_744857 ?auto_744860 ) ) ( not ( = ?auto_744857 ?auto_744859 ) ) ( not ( = ?auto_744857 ?auto_744862 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744858 ?auto_744860 ?auto_744859 )
      ( MAKE-4CRATE-VERIFY ?auto_744856 ?auto_744857 ?auto_744858 ?auto_744860 ?auto_744859 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_745516 - SURFACE
      ?auto_745517 - SURFACE
      ?auto_745518 - SURFACE
      ?auto_745520 - SURFACE
      ?auto_745519 - SURFACE
      ?auto_745521 - SURFACE
    )
    :vars
    (
      ?auto_745522 - HOIST
      ?auto_745523 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_745522 ?auto_745523 ) ( SURFACE-AT ?auto_745519 ?auto_745523 ) ( CLEAR ?auto_745519 ) ( LIFTING ?auto_745522 ?auto_745521 ) ( IS-CRATE ?auto_745521 ) ( not ( = ?auto_745519 ?auto_745521 ) ) ( ON ?auto_745517 ?auto_745516 ) ( ON ?auto_745518 ?auto_745517 ) ( ON ?auto_745520 ?auto_745518 ) ( ON ?auto_745519 ?auto_745520 ) ( not ( = ?auto_745516 ?auto_745517 ) ) ( not ( = ?auto_745516 ?auto_745518 ) ) ( not ( = ?auto_745516 ?auto_745520 ) ) ( not ( = ?auto_745516 ?auto_745519 ) ) ( not ( = ?auto_745516 ?auto_745521 ) ) ( not ( = ?auto_745517 ?auto_745518 ) ) ( not ( = ?auto_745517 ?auto_745520 ) ) ( not ( = ?auto_745517 ?auto_745519 ) ) ( not ( = ?auto_745517 ?auto_745521 ) ) ( not ( = ?auto_745518 ?auto_745520 ) ) ( not ( = ?auto_745518 ?auto_745519 ) ) ( not ( = ?auto_745518 ?auto_745521 ) ) ( not ( = ?auto_745520 ?auto_745519 ) ) ( not ( = ?auto_745520 ?auto_745521 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_745519 ?auto_745521 )
      ( MAKE-5CRATE-VERIFY ?auto_745516 ?auto_745517 ?auto_745518 ?auto_745520 ?auto_745519 ?auto_745521 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_745550 - SURFACE
      ?auto_745551 - SURFACE
      ?auto_745552 - SURFACE
      ?auto_745554 - SURFACE
      ?auto_745553 - SURFACE
      ?auto_745555 - SURFACE
    )
    :vars
    (
      ?auto_745556 - HOIST
      ?auto_745558 - PLACE
      ?auto_745557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_745556 ?auto_745558 ) ( SURFACE-AT ?auto_745553 ?auto_745558 ) ( CLEAR ?auto_745553 ) ( IS-CRATE ?auto_745555 ) ( not ( = ?auto_745553 ?auto_745555 ) ) ( TRUCK-AT ?auto_745557 ?auto_745558 ) ( AVAILABLE ?auto_745556 ) ( IN ?auto_745555 ?auto_745557 ) ( ON ?auto_745553 ?auto_745554 ) ( not ( = ?auto_745554 ?auto_745553 ) ) ( not ( = ?auto_745554 ?auto_745555 ) ) ( ON ?auto_745551 ?auto_745550 ) ( ON ?auto_745552 ?auto_745551 ) ( ON ?auto_745554 ?auto_745552 ) ( not ( = ?auto_745550 ?auto_745551 ) ) ( not ( = ?auto_745550 ?auto_745552 ) ) ( not ( = ?auto_745550 ?auto_745554 ) ) ( not ( = ?auto_745550 ?auto_745553 ) ) ( not ( = ?auto_745550 ?auto_745555 ) ) ( not ( = ?auto_745551 ?auto_745552 ) ) ( not ( = ?auto_745551 ?auto_745554 ) ) ( not ( = ?auto_745551 ?auto_745553 ) ) ( not ( = ?auto_745551 ?auto_745555 ) ) ( not ( = ?auto_745552 ?auto_745554 ) ) ( not ( = ?auto_745552 ?auto_745553 ) ) ( not ( = ?auto_745552 ?auto_745555 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_745554 ?auto_745553 ?auto_745555 )
      ( MAKE-5CRATE-VERIFY ?auto_745550 ?auto_745551 ?auto_745552 ?auto_745554 ?auto_745553 ?auto_745555 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_745590 - SURFACE
      ?auto_745591 - SURFACE
      ?auto_745592 - SURFACE
      ?auto_745594 - SURFACE
      ?auto_745593 - SURFACE
      ?auto_745595 - SURFACE
    )
    :vars
    (
      ?auto_745599 - HOIST
      ?auto_745598 - PLACE
      ?auto_745596 - TRUCK
      ?auto_745597 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_745599 ?auto_745598 ) ( SURFACE-AT ?auto_745593 ?auto_745598 ) ( CLEAR ?auto_745593 ) ( IS-CRATE ?auto_745595 ) ( not ( = ?auto_745593 ?auto_745595 ) ) ( AVAILABLE ?auto_745599 ) ( IN ?auto_745595 ?auto_745596 ) ( ON ?auto_745593 ?auto_745594 ) ( not ( = ?auto_745594 ?auto_745593 ) ) ( not ( = ?auto_745594 ?auto_745595 ) ) ( TRUCK-AT ?auto_745596 ?auto_745597 ) ( not ( = ?auto_745597 ?auto_745598 ) ) ( ON ?auto_745591 ?auto_745590 ) ( ON ?auto_745592 ?auto_745591 ) ( ON ?auto_745594 ?auto_745592 ) ( not ( = ?auto_745590 ?auto_745591 ) ) ( not ( = ?auto_745590 ?auto_745592 ) ) ( not ( = ?auto_745590 ?auto_745594 ) ) ( not ( = ?auto_745590 ?auto_745593 ) ) ( not ( = ?auto_745590 ?auto_745595 ) ) ( not ( = ?auto_745591 ?auto_745592 ) ) ( not ( = ?auto_745591 ?auto_745594 ) ) ( not ( = ?auto_745591 ?auto_745593 ) ) ( not ( = ?auto_745591 ?auto_745595 ) ) ( not ( = ?auto_745592 ?auto_745594 ) ) ( not ( = ?auto_745592 ?auto_745593 ) ) ( not ( = ?auto_745592 ?auto_745595 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_745594 ?auto_745593 ?auto_745595 )
      ( MAKE-5CRATE-VERIFY ?auto_745590 ?auto_745591 ?auto_745592 ?auto_745594 ?auto_745593 ?auto_745595 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_745635 - SURFACE
      ?auto_745636 - SURFACE
      ?auto_745637 - SURFACE
      ?auto_745639 - SURFACE
      ?auto_745638 - SURFACE
      ?auto_745640 - SURFACE
    )
    :vars
    (
      ?auto_745645 - HOIST
      ?auto_745643 - PLACE
      ?auto_745642 - TRUCK
      ?auto_745641 - PLACE
      ?auto_745644 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_745645 ?auto_745643 ) ( SURFACE-AT ?auto_745638 ?auto_745643 ) ( CLEAR ?auto_745638 ) ( IS-CRATE ?auto_745640 ) ( not ( = ?auto_745638 ?auto_745640 ) ) ( AVAILABLE ?auto_745645 ) ( ON ?auto_745638 ?auto_745639 ) ( not ( = ?auto_745639 ?auto_745638 ) ) ( not ( = ?auto_745639 ?auto_745640 ) ) ( TRUCK-AT ?auto_745642 ?auto_745641 ) ( not ( = ?auto_745641 ?auto_745643 ) ) ( HOIST-AT ?auto_745644 ?auto_745641 ) ( LIFTING ?auto_745644 ?auto_745640 ) ( not ( = ?auto_745645 ?auto_745644 ) ) ( ON ?auto_745636 ?auto_745635 ) ( ON ?auto_745637 ?auto_745636 ) ( ON ?auto_745639 ?auto_745637 ) ( not ( = ?auto_745635 ?auto_745636 ) ) ( not ( = ?auto_745635 ?auto_745637 ) ) ( not ( = ?auto_745635 ?auto_745639 ) ) ( not ( = ?auto_745635 ?auto_745638 ) ) ( not ( = ?auto_745635 ?auto_745640 ) ) ( not ( = ?auto_745636 ?auto_745637 ) ) ( not ( = ?auto_745636 ?auto_745639 ) ) ( not ( = ?auto_745636 ?auto_745638 ) ) ( not ( = ?auto_745636 ?auto_745640 ) ) ( not ( = ?auto_745637 ?auto_745639 ) ) ( not ( = ?auto_745637 ?auto_745638 ) ) ( not ( = ?auto_745637 ?auto_745640 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_745639 ?auto_745638 ?auto_745640 )
      ( MAKE-5CRATE-VERIFY ?auto_745635 ?auto_745636 ?auto_745637 ?auto_745639 ?auto_745638 ?auto_745640 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_745685 - SURFACE
      ?auto_745686 - SURFACE
      ?auto_745687 - SURFACE
      ?auto_745689 - SURFACE
      ?auto_745688 - SURFACE
      ?auto_745690 - SURFACE
    )
    :vars
    (
      ?auto_745696 - HOIST
      ?auto_745692 - PLACE
      ?auto_745694 - TRUCK
      ?auto_745695 - PLACE
      ?auto_745693 - HOIST
      ?auto_745691 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_745696 ?auto_745692 ) ( SURFACE-AT ?auto_745688 ?auto_745692 ) ( CLEAR ?auto_745688 ) ( IS-CRATE ?auto_745690 ) ( not ( = ?auto_745688 ?auto_745690 ) ) ( AVAILABLE ?auto_745696 ) ( ON ?auto_745688 ?auto_745689 ) ( not ( = ?auto_745689 ?auto_745688 ) ) ( not ( = ?auto_745689 ?auto_745690 ) ) ( TRUCK-AT ?auto_745694 ?auto_745695 ) ( not ( = ?auto_745695 ?auto_745692 ) ) ( HOIST-AT ?auto_745693 ?auto_745695 ) ( not ( = ?auto_745696 ?auto_745693 ) ) ( AVAILABLE ?auto_745693 ) ( SURFACE-AT ?auto_745690 ?auto_745695 ) ( ON ?auto_745690 ?auto_745691 ) ( CLEAR ?auto_745690 ) ( not ( = ?auto_745688 ?auto_745691 ) ) ( not ( = ?auto_745690 ?auto_745691 ) ) ( not ( = ?auto_745689 ?auto_745691 ) ) ( ON ?auto_745686 ?auto_745685 ) ( ON ?auto_745687 ?auto_745686 ) ( ON ?auto_745689 ?auto_745687 ) ( not ( = ?auto_745685 ?auto_745686 ) ) ( not ( = ?auto_745685 ?auto_745687 ) ) ( not ( = ?auto_745685 ?auto_745689 ) ) ( not ( = ?auto_745685 ?auto_745688 ) ) ( not ( = ?auto_745685 ?auto_745690 ) ) ( not ( = ?auto_745685 ?auto_745691 ) ) ( not ( = ?auto_745686 ?auto_745687 ) ) ( not ( = ?auto_745686 ?auto_745689 ) ) ( not ( = ?auto_745686 ?auto_745688 ) ) ( not ( = ?auto_745686 ?auto_745690 ) ) ( not ( = ?auto_745686 ?auto_745691 ) ) ( not ( = ?auto_745687 ?auto_745689 ) ) ( not ( = ?auto_745687 ?auto_745688 ) ) ( not ( = ?auto_745687 ?auto_745690 ) ) ( not ( = ?auto_745687 ?auto_745691 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_745689 ?auto_745688 ?auto_745690 )
      ( MAKE-5CRATE-VERIFY ?auto_745685 ?auto_745686 ?auto_745687 ?auto_745689 ?auto_745688 ?auto_745690 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_745736 - SURFACE
      ?auto_745737 - SURFACE
      ?auto_745738 - SURFACE
      ?auto_745740 - SURFACE
      ?auto_745739 - SURFACE
      ?auto_745741 - SURFACE
    )
    :vars
    (
      ?auto_745742 - HOIST
      ?auto_745744 - PLACE
      ?auto_745747 - PLACE
      ?auto_745746 - HOIST
      ?auto_745743 - SURFACE
      ?auto_745745 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_745742 ?auto_745744 ) ( SURFACE-AT ?auto_745739 ?auto_745744 ) ( CLEAR ?auto_745739 ) ( IS-CRATE ?auto_745741 ) ( not ( = ?auto_745739 ?auto_745741 ) ) ( AVAILABLE ?auto_745742 ) ( ON ?auto_745739 ?auto_745740 ) ( not ( = ?auto_745740 ?auto_745739 ) ) ( not ( = ?auto_745740 ?auto_745741 ) ) ( not ( = ?auto_745747 ?auto_745744 ) ) ( HOIST-AT ?auto_745746 ?auto_745747 ) ( not ( = ?auto_745742 ?auto_745746 ) ) ( AVAILABLE ?auto_745746 ) ( SURFACE-AT ?auto_745741 ?auto_745747 ) ( ON ?auto_745741 ?auto_745743 ) ( CLEAR ?auto_745741 ) ( not ( = ?auto_745739 ?auto_745743 ) ) ( not ( = ?auto_745741 ?auto_745743 ) ) ( not ( = ?auto_745740 ?auto_745743 ) ) ( TRUCK-AT ?auto_745745 ?auto_745744 ) ( ON ?auto_745737 ?auto_745736 ) ( ON ?auto_745738 ?auto_745737 ) ( ON ?auto_745740 ?auto_745738 ) ( not ( = ?auto_745736 ?auto_745737 ) ) ( not ( = ?auto_745736 ?auto_745738 ) ) ( not ( = ?auto_745736 ?auto_745740 ) ) ( not ( = ?auto_745736 ?auto_745739 ) ) ( not ( = ?auto_745736 ?auto_745741 ) ) ( not ( = ?auto_745736 ?auto_745743 ) ) ( not ( = ?auto_745737 ?auto_745738 ) ) ( not ( = ?auto_745737 ?auto_745740 ) ) ( not ( = ?auto_745737 ?auto_745739 ) ) ( not ( = ?auto_745737 ?auto_745741 ) ) ( not ( = ?auto_745737 ?auto_745743 ) ) ( not ( = ?auto_745738 ?auto_745740 ) ) ( not ( = ?auto_745738 ?auto_745739 ) ) ( not ( = ?auto_745738 ?auto_745741 ) ) ( not ( = ?auto_745738 ?auto_745743 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_745740 ?auto_745739 ?auto_745741 )
      ( MAKE-5CRATE-VERIFY ?auto_745736 ?auto_745737 ?auto_745738 ?auto_745740 ?auto_745739 ?auto_745741 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_745787 - SURFACE
      ?auto_745788 - SURFACE
      ?auto_745789 - SURFACE
      ?auto_745791 - SURFACE
      ?auto_745790 - SURFACE
      ?auto_745792 - SURFACE
    )
    :vars
    (
      ?auto_745795 - HOIST
      ?auto_745793 - PLACE
      ?auto_745797 - PLACE
      ?auto_745798 - HOIST
      ?auto_745794 - SURFACE
      ?auto_745796 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_745795 ?auto_745793 ) ( IS-CRATE ?auto_745792 ) ( not ( = ?auto_745790 ?auto_745792 ) ) ( not ( = ?auto_745791 ?auto_745790 ) ) ( not ( = ?auto_745791 ?auto_745792 ) ) ( not ( = ?auto_745797 ?auto_745793 ) ) ( HOIST-AT ?auto_745798 ?auto_745797 ) ( not ( = ?auto_745795 ?auto_745798 ) ) ( AVAILABLE ?auto_745798 ) ( SURFACE-AT ?auto_745792 ?auto_745797 ) ( ON ?auto_745792 ?auto_745794 ) ( CLEAR ?auto_745792 ) ( not ( = ?auto_745790 ?auto_745794 ) ) ( not ( = ?auto_745792 ?auto_745794 ) ) ( not ( = ?auto_745791 ?auto_745794 ) ) ( TRUCK-AT ?auto_745796 ?auto_745793 ) ( SURFACE-AT ?auto_745791 ?auto_745793 ) ( CLEAR ?auto_745791 ) ( LIFTING ?auto_745795 ?auto_745790 ) ( IS-CRATE ?auto_745790 ) ( ON ?auto_745788 ?auto_745787 ) ( ON ?auto_745789 ?auto_745788 ) ( ON ?auto_745791 ?auto_745789 ) ( not ( = ?auto_745787 ?auto_745788 ) ) ( not ( = ?auto_745787 ?auto_745789 ) ) ( not ( = ?auto_745787 ?auto_745791 ) ) ( not ( = ?auto_745787 ?auto_745790 ) ) ( not ( = ?auto_745787 ?auto_745792 ) ) ( not ( = ?auto_745787 ?auto_745794 ) ) ( not ( = ?auto_745788 ?auto_745789 ) ) ( not ( = ?auto_745788 ?auto_745791 ) ) ( not ( = ?auto_745788 ?auto_745790 ) ) ( not ( = ?auto_745788 ?auto_745792 ) ) ( not ( = ?auto_745788 ?auto_745794 ) ) ( not ( = ?auto_745789 ?auto_745791 ) ) ( not ( = ?auto_745789 ?auto_745790 ) ) ( not ( = ?auto_745789 ?auto_745792 ) ) ( not ( = ?auto_745789 ?auto_745794 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_745791 ?auto_745790 ?auto_745792 )
      ( MAKE-5CRATE-VERIFY ?auto_745787 ?auto_745788 ?auto_745789 ?auto_745791 ?auto_745790 ?auto_745792 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_745838 - SURFACE
      ?auto_745839 - SURFACE
      ?auto_745840 - SURFACE
      ?auto_745842 - SURFACE
      ?auto_745841 - SURFACE
      ?auto_745843 - SURFACE
    )
    :vars
    (
      ?auto_745844 - HOIST
      ?auto_745848 - PLACE
      ?auto_745845 - PLACE
      ?auto_745849 - HOIST
      ?auto_745847 - SURFACE
      ?auto_745846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_745844 ?auto_745848 ) ( IS-CRATE ?auto_745843 ) ( not ( = ?auto_745841 ?auto_745843 ) ) ( not ( = ?auto_745842 ?auto_745841 ) ) ( not ( = ?auto_745842 ?auto_745843 ) ) ( not ( = ?auto_745845 ?auto_745848 ) ) ( HOIST-AT ?auto_745849 ?auto_745845 ) ( not ( = ?auto_745844 ?auto_745849 ) ) ( AVAILABLE ?auto_745849 ) ( SURFACE-AT ?auto_745843 ?auto_745845 ) ( ON ?auto_745843 ?auto_745847 ) ( CLEAR ?auto_745843 ) ( not ( = ?auto_745841 ?auto_745847 ) ) ( not ( = ?auto_745843 ?auto_745847 ) ) ( not ( = ?auto_745842 ?auto_745847 ) ) ( TRUCK-AT ?auto_745846 ?auto_745848 ) ( SURFACE-AT ?auto_745842 ?auto_745848 ) ( CLEAR ?auto_745842 ) ( IS-CRATE ?auto_745841 ) ( AVAILABLE ?auto_745844 ) ( IN ?auto_745841 ?auto_745846 ) ( ON ?auto_745839 ?auto_745838 ) ( ON ?auto_745840 ?auto_745839 ) ( ON ?auto_745842 ?auto_745840 ) ( not ( = ?auto_745838 ?auto_745839 ) ) ( not ( = ?auto_745838 ?auto_745840 ) ) ( not ( = ?auto_745838 ?auto_745842 ) ) ( not ( = ?auto_745838 ?auto_745841 ) ) ( not ( = ?auto_745838 ?auto_745843 ) ) ( not ( = ?auto_745838 ?auto_745847 ) ) ( not ( = ?auto_745839 ?auto_745840 ) ) ( not ( = ?auto_745839 ?auto_745842 ) ) ( not ( = ?auto_745839 ?auto_745841 ) ) ( not ( = ?auto_745839 ?auto_745843 ) ) ( not ( = ?auto_745839 ?auto_745847 ) ) ( not ( = ?auto_745840 ?auto_745842 ) ) ( not ( = ?auto_745840 ?auto_745841 ) ) ( not ( = ?auto_745840 ?auto_745843 ) ) ( not ( = ?auto_745840 ?auto_745847 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_745842 ?auto_745841 ?auto_745843 )
      ( MAKE-5CRATE-VERIFY ?auto_745838 ?auto_745839 ?auto_745840 ?auto_745842 ?auto_745841 ?auto_745843 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_747047 - SURFACE
      ?auto_747048 - SURFACE
      ?auto_747049 - SURFACE
      ?auto_747051 - SURFACE
      ?auto_747050 - SURFACE
      ?auto_747052 - SURFACE
      ?auto_747053 - SURFACE
    )
    :vars
    (
      ?auto_747054 - HOIST
      ?auto_747055 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_747054 ?auto_747055 ) ( SURFACE-AT ?auto_747052 ?auto_747055 ) ( CLEAR ?auto_747052 ) ( LIFTING ?auto_747054 ?auto_747053 ) ( IS-CRATE ?auto_747053 ) ( not ( = ?auto_747052 ?auto_747053 ) ) ( ON ?auto_747048 ?auto_747047 ) ( ON ?auto_747049 ?auto_747048 ) ( ON ?auto_747051 ?auto_747049 ) ( ON ?auto_747050 ?auto_747051 ) ( ON ?auto_747052 ?auto_747050 ) ( not ( = ?auto_747047 ?auto_747048 ) ) ( not ( = ?auto_747047 ?auto_747049 ) ) ( not ( = ?auto_747047 ?auto_747051 ) ) ( not ( = ?auto_747047 ?auto_747050 ) ) ( not ( = ?auto_747047 ?auto_747052 ) ) ( not ( = ?auto_747047 ?auto_747053 ) ) ( not ( = ?auto_747048 ?auto_747049 ) ) ( not ( = ?auto_747048 ?auto_747051 ) ) ( not ( = ?auto_747048 ?auto_747050 ) ) ( not ( = ?auto_747048 ?auto_747052 ) ) ( not ( = ?auto_747048 ?auto_747053 ) ) ( not ( = ?auto_747049 ?auto_747051 ) ) ( not ( = ?auto_747049 ?auto_747050 ) ) ( not ( = ?auto_747049 ?auto_747052 ) ) ( not ( = ?auto_747049 ?auto_747053 ) ) ( not ( = ?auto_747051 ?auto_747050 ) ) ( not ( = ?auto_747051 ?auto_747052 ) ) ( not ( = ?auto_747051 ?auto_747053 ) ) ( not ( = ?auto_747050 ?auto_747052 ) ) ( not ( = ?auto_747050 ?auto_747053 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_747052 ?auto_747053 )
      ( MAKE-6CRATE-VERIFY ?auto_747047 ?auto_747048 ?auto_747049 ?auto_747051 ?auto_747050 ?auto_747052 ?auto_747053 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_747091 - SURFACE
      ?auto_747092 - SURFACE
      ?auto_747093 - SURFACE
      ?auto_747095 - SURFACE
      ?auto_747094 - SURFACE
      ?auto_747096 - SURFACE
      ?auto_747097 - SURFACE
    )
    :vars
    (
      ?auto_747099 - HOIST
      ?auto_747098 - PLACE
      ?auto_747100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_747099 ?auto_747098 ) ( SURFACE-AT ?auto_747096 ?auto_747098 ) ( CLEAR ?auto_747096 ) ( IS-CRATE ?auto_747097 ) ( not ( = ?auto_747096 ?auto_747097 ) ) ( TRUCK-AT ?auto_747100 ?auto_747098 ) ( AVAILABLE ?auto_747099 ) ( IN ?auto_747097 ?auto_747100 ) ( ON ?auto_747096 ?auto_747094 ) ( not ( = ?auto_747094 ?auto_747096 ) ) ( not ( = ?auto_747094 ?auto_747097 ) ) ( ON ?auto_747092 ?auto_747091 ) ( ON ?auto_747093 ?auto_747092 ) ( ON ?auto_747095 ?auto_747093 ) ( ON ?auto_747094 ?auto_747095 ) ( not ( = ?auto_747091 ?auto_747092 ) ) ( not ( = ?auto_747091 ?auto_747093 ) ) ( not ( = ?auto_747091 ?auto_747095 ) ) ( not ( = ?auto_747091 ?auto_747094 ) ) ( not ( = ?auto_747091 ?auto_747096 ) ) ( not ( = ?auto_747091 ?auto_747097 ) ) ( not ( = ?auto_747092 ?auto_747093 ) ) ( not ( = ?auto_747092 ?auto_747095 ) ) ( not ( = ?auto_747092 ?auto_747094 ) ) ( not ( = ?auto_747092 ?auto_747096 ) ) ( not ( = ?auto_747092 ?auto_747097 ) ) ( not ( = ?auto_747093 ?auto_747095 ) ) ( not ( = ?auto_747093 ?auto_747094 ) ) ( not ( = ?auto_747093 ?auto_747096 ) ) ( not ( = ?auto_747093 ?auto_747097 ) ) ( not ( = ?auto_747095 ?auto_747094 ) ) ( not ( = ?auto_747095 ?auto_747096 ) ) ( not ( = ?auto_747095 ?auto_747097 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_747094 ?auto_747096 ?auto_747097 )
      ( MAKE-6CRATE-VERIFY ?auto_747091 ?auto_747092 ?auto_747093 ?auto_747095 ?auto_747094 ?auto_747096 ?auto_747097 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_747142 - SURFACE
      ?auto_747143 - SURFACE
      ?auto_747144 - SURFACE
      ?auto_747146 - SURFACE
      ?auto_747145 - SURFACE
      ?auto_747147 - SURFACE
      ?auto_747148 - SURFACE
    )
    :vars
    (
      ?auto_747152 - HOIST
      ?auto_747150 - PLACE
      ?auto_747149 - TRUCK
      ?auto_747151 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_747152 ?auto_747150 ) ( SURFACE-AT ?auto_747147 ?auto_747150 ) ( CLEAR ?auto_747147 ) ( IS-CRATE ?auto_747148 ) ( not ( = ?auto_747147 ?auto_747148 ) ) ( AVAILABLE ?auto_747152 ) ( IN ?auto_747148 ?auto_747149 ) ( ON ?auto_747147 ?auto_747145 ) ( not ( = ?auto_747145 ?auto_747147 ) ) ( not ( = ?auto_747145 ?auto_747148 ) ) ( TRUCK-AT ?auto_747149 ?auto_747151 ) ( not ( = ?auto_747151 ?auto_747150 ) ) ( ON ?auto_747143 ?auto_747142 ) ( ON ?auto_747144 ?auto_747143 ) ( ON ?auto_747146 ?auto_747144 ) ( ON ?auto_747145 ?auto_747146 ) ( not ( = ?auto_747142 ?auto_747143 ) ) ( not ( = ?auto_747142 ?auto_747144 ) ) ( not ( = ?auto_747142 ?auto_747146 ) ) ( not ( = ?auto_747142 ?auto_747145 ) ) ( not ( = ?auto_747142 ?auto_747147 ) ) ( not ( = ?auto_747142 ?auto_747148 ) ) ( not ( = ?auto_747143 ?auto_747144 ) ) ( not ( = ?auto_747143 ?auto_747146 ) ) ( not ( = ?auto_747143 ?auto_747145 ) ) ( not ( = ?auto_747143 ?auto_747147 ) ) ( not ( = ?auto_747143 ?auto_747148 ) ) ( not ( = ?auto_747144 ?auto_747146 ) ) ( not ( = ?auto_747144 ?auto_747145 ) ) ( not ( = ?auto_747144 ?auto_747147 ) ) ( not ( = ?auto_747144 ?auto_747148 ) ) ( not ( = ?auto_747146 ?auto_747145 ) ) ( not ( = ?auto_747146 ?auto_747147 ) ) ( not ( = ?auto_747146 ?auto_747148 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_747145 ?auto_747147 ?auto_747148 )
      ( MAKE-6CRATE-VERIFY ?auto_747142 ?auto_747143 ?auto_747144 ?auto_747146 ?auto_747145 ?auto_747147 ?auto_747148 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_747199 - SURFACE
      ?auto_747200 - SURFACE
      ?auto_747201 - SURFACE
      ?auto_747203 - SURFACE
      ?auto_747202 - SURFACE
      ?auto_747204 - SURFACE
      ?auto_747205 - SURFACE
    )
    :vars
    (
      ?auto_747210 - HOIST
      ?auto_747209 - PLACE
      ?auto_747208 - TRUCK
      ?auto_747207 - PLACE
      ?auto_747206 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_747210 ?auto_747209 ) ( SURFACE-AT ?auto_747204 ?auto_747209 ) ( CLEAR ?auto_747204 ) ( IS-CRATE ?auto_747205 ) ( not ( = ?auto_747204 ?auto_747205 ) ) ( AVAILABLE ?auto_747210 ) ( ON ?auto_747204 ?auto_747202 ) ( not ( = ?auto_747202 ?auto_747204 ) ) ( not ( = ?auto_747202 ?auto_747205 ) ) ( TRUCK-AT ?auto_747208 ?auto_747207 ) ( not ( = ?auto_747207 ?auto_747209 ) ) ( HOIST-AT ?auto_747206 ?auto_747207 ) ( LIFTING ?auto_747206 ?auto_747205 ) ( not ( = ?auto_747210 ?auto_747206 ) ) ( ON ?auto_747200 ?auto_747199 ) ( ON ?auto_747201 ?auto_747200 ) ( ON ?auto_747203 ?auto_747201 ) ( ON ?auto_747202 ?auto_747203 ) ( not ( = ?auto_747199 ?auto_747200 ) ) ( not ( = ?auto_747199 ?auto_747201 ) ) ( not ( = ?auto_747199 ?auto_747203 ) ) ( not ( = ?auto_747199 ?auto_747202 ) ) ( not ( = ?auto_747199 ?auto_747204 ) ) ( not ( = ?auto_747199 ?auto_747205 ) ) ( not ( = ?auto_747200 ?auto_747201 ) ) ( not ( = ?auto_747200 ?auto_747203 ) ) ( not ( = ?auto_747200 ?auto_747202 ) ) ( not ( = ?auto_747200 ?auto_747204 ) ) ( not ( = ?auto_747200 ?auto_747205 ) ) ( not ( = ?auto_747201 ?auto_747203 ) ) ( not ( = ?auto_747201 ?auto_747202 ) ) ( not ( = ?auto_747201 ?auto_747204 ) ) ( not ( = ?auto_747201 ?auto_747205 ) ) ( not ( = ?auto_747203 ?auto_747202 ) ) ( not ( = ?auto_747203 ?auto_747204 ) ) ( not ( = ?auto_747203 ?auto_747205 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_747202 ?auto_747204 ?auto_747205 )
      ( MAKE-6CRATE-VERIFY ?auto_747199 ?auto_747200 ?auto_747201 ?auto_747203 ?auto_747202 ?auto_747204 ?auto_747205 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_747262 - SURFACE
      ?auto_747263 - SURFACE
      ?auto_747264 - SURFACE
      ?auto_747266 - SURFACE
      ?auto_747265 - SURFACE
      ?auto_747267 - SURFACE
      ?auto_747268 - SURFACE
    )
    :vars
    (
      ?auto_747270 - HOIST
      ?auto_747273 - PLACE
      ?auto_747269 - TRUCK
      ?auto_747272 - PLACE
      ?auto_747274 - HOIST
      ?auto_747271 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_747270 ?auto_747273 ) ( SURFACE-AT ?auto_747267 ?auto_747273 ) ( CLEAR ?auto_747267 ) ( IS-CRATE ?auto_747268 ) ( not ( = ?auto_747267 ?auto_747268 ) ) ( AVAILABLE ?auto_747270 ) ( ON ?auto_747267 ?auto_747265 ) ( not ( = ?auto_747265 ?auto_747267 ) ) ( not ( = ?auto_747265 ?auto_747268 ) ) ( TRUCK-AT ?auto_747269 ?auto_747272 ) ( not ( = ?auto_747272 ?auto_747273 ) ) ( HOIST-AT ?auto_747274 ?auto_747272 ) ( not ( = ?auto_747270 ?auto_747274 ) ) ( AVAILABLE ?auto_747274 ) ( SURFACE-AT ?auto_747268 ?auto_747272 ) ( ON ?auto_747268 ?auto_747271 ) ( CLEAR ?auto_747268 ) ( not ( = ?auto_747267 ?auto_747271 ) ) ( not ( = ?auto_747268 ?auto_747271 ) ) ( not ( = ?auto_747265 ?auto_747271 ) ) ( ON ?auto_747263 ?auto_747262 ) ( ON ?auto_747264 ?auto_747263 ) ( ON ?auto_747266 ?auto_747264 ) ( ON ?auto_747265 ?auto_747266 ) ( not ( = ?auto_747262 ?auto_747263 ) ) ( not ( = ?auto_747262 ?auto_747264 ) ) ( not ( = ?auto_747262 ?auto_747266 ) ) ( not ( = ?auto_747262 ?auto_747265 ) ) ( not ( = ?auto_747262 ?auto_747267 ) ) ( not ( = ?auto_747262 ?auto_747268 ) ) ( not ( = ?auto_747262 ?auto_747271 ) ) ( not ( = ?auto_747263 ?auto_747264 ) ) ( not ( = ?auto_747263 ?auto_747266 ) ) ( not ( = ?auto_747263 ?auto_747265 ) ) ( not ( = ?auto_747263 ?auto_747267 ) ) ( not ( = ?auto_747263 ?auto_747268 ) ) ( not ( = ?auto_747263 ?auto_747271 ) ) ( not ( = ?auto_747264 ?auto_747266 ) ) ( not ( = ?auto_747264 ?auto_747265 ) ) ( not ( = ?auto_747264 ?auto_747267 ) ) ( not ( = ?auto_747264 ?auto_747268 ) ) ( not ( = ?auto_747264 ?auto_747271 ) ) ( not ( = ?auto_747266 ?auto_747265 ) ) ( not ( = ?auto_747266 ?auto_747267 ) ) ( not ( = ?auto_747266 ?auto_747268 ) ) ( not ( = ?auto_747266 ?auto_747271 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_747265 ?auto_747267 ?auto_747268 )
      ( MAKE-6CRATE-VERIFY ?auto_747262 ?auto_747263 ?auto_747264 ?auto_747266 ?auto_747265 ?auto_747267 ?auto_747268 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_747326 - SURFACE
      ?auto_747327 - SURFACE
      ?auto_747328 - SURFACE
      ?auto_747330 - SURFACE
      ?auto_747329 - SURFACE
      ?auto_747331 - SURFACE
      ?auto_747332 - SURFACE
    )
    :vars
    (
      ?auto_747337 - HOIST
      ?auto_747336 - PLACE
      ?auto_747338 - PLACE
      ?auto_747335 - HOIST
      ?auto_747333 - SURFACE
      ?auto_747334 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_747337 ?auto_747336 ) ( SURFACE-AT ?auto_747331 ?auto_747336 ) ( CLEAR ?auto_747331 ) ( IS-CRATE ?auto_747332 ) ( not ( = ?auto_747331 ?auto_747332 ) ) ( AVAILABLE ?auto_747337 ) ( ON ?auto_747331 ?auto_747329 ) ( not ( = ?auto_747329 ?auto_747331 ) ) ( not ( = ?auto_747329 ?auto_747332 ) ) ( not ( = ?auto_747338 ?auto_747336 ) ) ( HOIST-AT ?auto_747335 ?auto_747338 ) ( not ( = ?auto_747337 ?auto_747335 ) ) ( AVAILABLE ?auto_747335 ) ( SURFACE-AT ?auto_747332 ?auto_747338 ) ( ON ?auto_747332 ?auto_747333 ) ( CLEAR ?auto_747332 ) ( not ( = ?auto_747331 ?auto_747333 ) ) ( not ( = ?auto_747332 ?auto_747333 ) ) ( not ( = ?auto_747329 ?auto_747333 ) ) ( TRUCK-AT ?auto_747334 ?auto_747336 ) ( ON ?auto_747327 ?auto_747326 ) ( ON ?auto_747328 ?auto_747327 ) ( ON ?auto_747330 ?auto_747328 ) ( ON ?auto_747329 ?auto_747330 ) ( not ( = ?auto_747326 ?auto_747327 ) ) ( not ( = ?auto_747326 ?auto_747328 ) ) ( not ( = ?auto_747326 ?auto_747330 ) ) ( not ( = ?auto_747326 ?auto_747329 ) ) ( not ( = ?auto_747326 ?auto_747331 ) ) ( not ( = ?auto_747326 ?auto_747332 ) ) ( not ( = ?auto_747326 ?auto_747333 ) ) ( not ( = ?auto_747327 ?auto_747328 ) ) ( not ( = ?auto_747327 ?auto_747330 ) ) ( not ( = ?auto_747327 ?auto_747329 ) ) ( not ( = ?auto_747327 ?auto_747331 ) ) ( not ( = ?auto_747327 ?auto_747332 ) ) ( not ( = ?auto_747327 ?auto_747333 ) ) ( not ( = ?auto_747328 ?auto_747330 ) ) ( not ( = ?auto_747328 ?auto_747329 ) ) ( not ( = ?auto_747328 ?auto_747331 ) ) ( not ( = ?auto_747328 ?auto_747332 ) ) ( not ( = ?auto_747328 ?auto_747333 ) ) ( not ( = ?auto_747330 ?auto_747329 ) ) ( not ( = ?auto_747330 ?auto_747331 ) ) ( not ( = ?auto_747330 ?auto_747332 ) ) ( not ( = ?auto_747330 ?auto_747333 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_747329 ?auto_747331 ?auto_747332 )
      ( MAKE-6CRATE-VERIFY ?auto_747326 ?auto_747327 ?auto_747328 ?auto_747330 ?auto_747329 ?auto_747331 ?auto_747332 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_747390 - SURFACE
      ?auto_747391 - SURFACE
      ?auto_747392 - SURFACE
      ?auto_747394 - SURFACE
      ?auto_747393 - SURFACE
      ?auto_747395 - SURFACE
      ?auto_747396 - SURFACE
    )
    :vars
    (
      ?auto_747400 - HOIST
      ?auto_747398 - PLACE
      ?auto_747399 - PLACE
      ?auto_747402 - HOIST
      ?auto_747397 - SURFACE
      ?auto_747401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_747400 ?auto_747398 ) ( IS-CRATE ?auto_747396 ) ( not ( = ?auto_747395 ?auto_747396 ) ) ( not ( = ?auto_747393 ?auto_747395 ) ) ( not ( = ?auto_747393 ?auto_747396 ) ) ( not ( = ?auto_747399 ?auto_747398 ) ) ( HOIST-AT ?auto_747402 ?auto_747399 ) ( not ( = ?auto_747400 ?auto_747402 ) ) ( AVAILABLE ?auto_747402 ) ( SURFACE-AT ?auto_747396 ?auto_747399 ) ( ON ?auto_747396 ?auto_747397 ) ( CLEAR ?auto_747396 ) ( not ( = ?auto_747395 ?auto_747397 ) ) ( not ( = ?auto_747396 ?auto_747397 ) ) ( not ( = ?auto_747393 ?auto_747397 ) ) ( TRUCK-AT ?auto_747401 ?auto_747398 ) ( SURFACE-AT ?auto_747393 ?auto_747398 ) ( CLEAR ?auto_747393 ) ( LIFTING ?auto_747400 ?auto_747395 ) ( IS-CRATE ?auto_747395 ) ( ON ?auto_747391 ?auto_747390 ) ( ON ?auto_747392 ?auto_747391 ) ( ON ?auto_747394 ?auto_747392 ) ( ON ?auto_747393 ?auto_747394 ) ( not ( = ?auto_747390 ?auto_747391 ) ) ( not ( = ?auto_747390 ?auto_747392 ) ) ( not ( = ?auto_747390 ?auto_747394 ) ) ( not ( = ?auto_747390 ?auto_747393 ) ) ( not ( = ?auto_747390 ?auto_747395 ) ) ( not ( = ?auto_747390 ?auto_747396 ) ) ( not ( = ?auto_747390 ?auto_747397 ) ) ( not ( = ?auto_747391 ?auto_747392 ) ) ( not ( = ?auto_747391 ?auto_747394 ) ) ( not ( = ?auto_747391 ?auto_747393 ) ) ( not ( = ?auto_747391 ?auto_747395 ) ) ( not ( = ?auto_747391 ?auto_747396 ) ) ( not ( = ?auto_747391 ?auto_747397 ) ) ( not ( = ?auto_747392 ?auto_747394 ) ) ( not ( = ?auto_747392 ?auto_747393 ) ) ( not ( = ?auto_747392 ?auto_747395 ) ) ( not ( = ?auto_747392 ?auto_747396 ) ) ( not ( = ?auto_747392 ?auto_747397 ) ) ( not ( = ?auto_747394 ?auto_747393 ) ) ( not ( = ?auto_747394 ?auto_747395 ) ) ( not ( = ?auto_747394 ?auto_747396 ) ) ( not ( = ?auto_747394 ?auto_747397 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_747393 ?auto_747395 ?auto_747396 )
      ( MAKE-6CRATE-VERIFY ?auto_747390 ?auto_747391 ?auto_747392 ?auto_747394 ?auto_747393 ?auto_747395 ?auto_747396 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_747454 - SURFACE
      ?auto_747455 - SURFACE
      ?auto_747456 - SURFACE
      ?auto_747458 - SURFACE
      ?auto_747457 - SURFACE
      ?auto_747459 - SURFACE
      ?auto_747460 - SURFACE
    )
    :vars
    (
      ?auto_747462 - HOIST
      ?auto_747464 - PLACE
      ?auto_747465 - PLACE
      ?auto_747466 - HOIST
      ?auto_747461 - SURFACE
      ?auto_747463 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_747462 ?auto_747464 ) ( IS-CRATE ?auto_747460 ) ( not ( = ?auto_747459 ?auto_747460 ) ) ( not ( = ?auto_747457 ?auto_747459 ) ) ( not ( = ?auto_747457 ?auto_747460 ) ) ( not ( = ?auto_747465 ?auto_747464 ) ) ( HOIST-AT ?auto_747466 ?auto_747465 ) ( not ( = ?auto_747462 ?auto_747466 ) ) ( AVAILABLE ?auto_747466 ) ( SURFACE-AT ?auto_747460 ?auto_747465 ) ( ON ?auto_747460 ?auto_747461 ) ( CLEAR ?auto_747460 ) ( not ( = ?auto_747459 ?auto_747461 ) ) ( not ( = ?auto_747460 ?auto_747461 ) ) ( not ( = ?auto_747457 ?auto_747461 ) ) ( TRUCK-AT ?auto_747463 ?auto_747464 ) ( SURFACE-AT ?auto_747457 ?auto_747464 ) ( CLEAR ?auto_747457 ) ( IS-CRATE ?auto_747459 ) ( AVAILABLE ?auto_747462 ) ( IN ?auto_747459 ?auto_747463 ) ( ON ?auto_747455 ?auto_747454 ) ( ON ?auto_747456 ?auto_747455 ) ( ON ?auto_747458 ?auto_747456 ) ( ON ?auto_747457 ?auto_747458 ) ( not ( = ?auto_747454 ?auto_747455 ) ) ( not ( = ?auto_747454 ?auto_747456 ) ) ( not ( = ?auto_747454 ?auto_747458 ) ) ( not ( = ?auto_747454 ?auto_747457 ) ) ( not ( = ?auto_747454 ?auto_747459 ) ) ( not ( = ?auto_747454 ?auto_747460 ) ) ( not ( = ?auto_747454 ?auto_747461 ) ) ( not ( = ?auto_747455 ?auto_747456 ) ) ( not ( = ?auto_747455 ?auto_747458 ) ) ( not ( = ?auto_747455 ?auto_747457 ) ) ( not ( = ?auto_747455 ?auto_747459 ) ) ( not ( = ?auto_747455 ?auto_747460 ) ) ( not ( = ?auto_747455 ?auto_747461 ) ) ( not ( = ?auto_747456 ?auto_747458 ) ) ( not ( = ?auto_747456 ?auto_747457 ) ) ( not ( = ?auto_747456 ?auto_747459 ) ) ( not ( = ?auto_747456 ?auto_747460 ) ) ( not ( = ?auto_747456 ?auto_747461 ) ) ( not ( = ?auto_747458 ?auto_747457 ) ) ( not ( = ?auto_747458 ?auto_747459 ) ) ( not ( = ?auto_747458 ?auto_747460 ) ) ( not ( = ?auto_747458 ?auto_747461 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_747457 ?auto_747459 ?auto_747460 )
      ( MAKE-6CRATE-VERIFY ?auto_747454 ?auto_747455 ?auto_747456 ?auto_747458 ?auto_747457 ?auto_747459 ?auto_747460 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_749410 - SURFACE
      ?auto_749411 - SURFACE
      ?auto_749412 - SURFACE
      ?auto_749414 - SURFACE
      ?auto_749413 - SURFACE
      ?auto_749415 - SURFACE
      ?auto_749416 - SURFACE
      ?auto_749417 - SURFACE
    )
    :vars
    (
      ?auto_749419 - HOIST
      ?auto_749418 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_749419 ?auto_749418 ) ( SURFACE-AT ?auto_749416 ?auto_749418 ) ( CLEAR ?auto_749416 ) ( LIFTING ?auto_749419 ?auto_749417 ) ( IS-CRATE ?auto_749417 ) ( not ( = ?auto_749416 ?auto_749417 ) ) ( ON ?auto_749411 ?auto_749410 ) ( ON ?auto_749412 ?auto_749411 ) ( ON ?auto_749414 ?auto_749412 ) ( ON ?auto_749413 ?auto_749414 ) ( ON ?auto_749415 ?auto_749413 ) ( ON ?auto_749416 ?auto_749415 ) ( not ( = ?auto_749410 ?auto_749411 ) ) ( not ( = ?auto_749410 ?auto_749412 ) ) ( not ( = ?auto_749410 ?auto_749414 ) ) ( not ( = ?auto_749410 ?auto_749413 ) ) ( not ( = ?auto_749410 ?auto_749415 ) ) ( not ( = ?auto_749410 ?auto_749416 ) ) ( not ( = ?auto_749410 ?auto_749417 ) ) ( not ( = ?auto_749411 ?auto_749412 ) ) ( not ( = ?auto_749411 ?auto_749414 ) ) ( not ( = ?auto_749411 ?auto_749413 ) ) ( not ( = ?auto_749411 ?auto_749415 ) ) ( not ( = ?auto_749411 ?auto_749416 ) ) ( not ( = ?auto_749411 ?auto_749417 ) ) ( not ( = ?auto_749412 ?auto_749414 ) ) ( not ( = ?auto_749412 ?auto_749413 ) ) ( not ( = ?auto_749412 ?auto_749415 ) ) ( not ( = ?auto_749412 ?auto_749416 ) ) ( not ( = ?auto_749412 ?auto_749417 ) ) ( not ( = ?auto_749414 ?auto_749413 ) ) ( not ( = ?auto_749414 ?auto_749415 ) ) ( not ( = ?auto_749414 ?auto_749416 ) ) ( not ( = ?auto_749414 ?auto_749417 ) ) ( not ( = ?auto_749413 ?auto_749415 ) ) ( not ( = ?auto_749413 ?auto_749416 ) ) ( not ( = ?auto_749413 ?auto_749417 ) ) ( not ( = ?auto_749415 ?auto_749416 ) ) ( not ( = ?auto_749415 ?auto_749417 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_749416 ?auto_749417 )
      ( MAKE-7CRATE-VERIFY ?auto_749410 ?auto_749411 ?auto_749412 ?auto_749414 ?auto_749413 ?auto_749415 ?auto_749416 ?auto_749417 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_749465 - SURFACE
      ?auto_749466 - SURFACE
      ?auto_749467 - SURFACE
      ?auto_749469 - SURFACE
      ?auto_749468 - SURFACE
      ?auto_749470 - SURFACE
      ?auto_749471 - SURFACE
      ?auto_749472 - SURFACE
    )
    :vars
    (
      ?auto_749473 - HOIST
      ?auto_749475 - PLACE
      ?auto_749474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_749473 ?auto_749475 ) ( SURFACE-AT ?auto_749471 ?auto_749475 ) ( CLEAR ?auto_749471 ) ( IS-CRATE ?auto_749472 ) ( not ( = ?auto_749471 ?auto_749472 ) ) ( TRUCK-AT ?auto_749474 ?auto_749475 ) ( AVAILABLE ?auto_749473 ) ( IN ?auto_749472 ?auto_749474 ) ( ON ?auto_749471 ?auto_749470 ) ( not ( = ?auto_749470 ?auto_749471 ) ) ( not ( = ?auto_749470 ?auto_749472 ) ) ( ON ?auto_749466 ?auto_749465 ) ( ON ?auto_749467 ?auto_749466 ) ( ON ?auto_749469 ?auto_749467 ) ( ON ?auto_749468 ?auto_749469 ) ( ON ?auto_749470 ?auto_749468 ) ( not ( = ?auto_749465 ?auto_749466 ) ) ( not ( = ?auto_749465 ?auto_749467 ) ) ( not ( = ?auto_749465 ?auto_749469 ) ) ( not ( = ?auto_749465 ?auto_749468 ) ) ( not ( = ?auto_749465 ?auto_749470 ) ) ( not ( = ?auto_749465 ?auto_749471 ) ) ( not ( = ?auto_749465 ?auto_749472 ) ) ( not ( = ?auto_749466 ?auto_749467 ) ) ( not ( = ?auto_749466 ?auto_749469 ) ) ( not ( = ?auto_749466 ?auto_749468 ) ) ( not ( = ?auto_749466 ?auto_749470 ) ) ( not ( = ?auto_749466 ?auto_749471 ) ) ( not ( = ?auto_749466 ?auto_749472 ) ) ( not ( = ?auto_749467 ?auto_749469 ) ) ( not ( = ?auto_749467 ?auto_749468 ) ) ( not ( = ?auto_749467 ?auto_749470 ) ) ( not ( = ?auto_749467 ?auto_749471 ) ) ( not ( = ?auto_749467 ?auto_749472 ) ) ( not ( = ?auto_749469 ?auto_749468 ) ) ( not ( = ?auto_749469 ?auto_749470 ) ) ( not ( = ?auto_749469 ?auto_749471 ) ) ( not ( = ?auto_749469 ?auto_749472 ) ) ( not ( = ?auto_749468 ?auto_749470 ) ) ( not ( = ?auto_749468 ?auto_749471 ) ) ( not ( = ?auto_749468 ?auto_749472 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_749470 ?auto_749471 ?auto_749472 )
      ( MAKE-7CRATE-VERIFY ?auto_749465 ?auto_749466 ?auto_749467 ?auto_749469 ?auto_749468 ?auto_749470 ?auto_749471 ?auto_749472 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_749528 - SURFACE
      ?auto_749529 - SURFACE
      ?auto_749530 - SURFACE
      ?auto_749532 - SURFACE
      ?auto_749531 - SURFACE
      ?auto_749533 - SURFACE
      ?auto_749534 - SURFACE
      ?auto_749535 - SURFACE
    )
    :vars
    (
      ?auto_749536 - HOIST
      ?auto_749539 - PLACE
      ?auto_749537 - TRUCK
      ?auto_749538 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_749536 ?auto_749539 ) ( SURFACE-AT ?auto_749534 ?auto_749539 ) ( CLEAR ?auto_749534 ) ( IS-CRATE ?auto_749535 ) ( not ( = ?auto_749534 ?auto_749535 ) ) ( AVAILABLE ?auto_749536 ) ( IN ?auto_749535 ?auto_749537 ) ( ON ?auto_749534 ?auto_749533 ) ( not ( = ?auto_749533 ?auto_749534 ) ) ( not ( = ?auto_749533 ?auto_749535 ) ) ( TRUCK-AT ?auto_749537 ?auto_749538 ) ( not ( = ?auto_749538 ?auto_749539 ) ) ( ON ?auto_749529 ?auto_749528 ) ( ON ?auto_749530 ?auto_749529 ) ( ON ?auto_749532 ?auto_749530 ) ( ON ?auto_749531 ?auto_749532 ) ( ON ?auto_749533 ?auto_749531 ) ( not ( = ?auto_749528 ?auto_749529 ) ) ( not ( = ?auto_749528 ?auto_749530 ) ) ( not ( = ?auto_749528 ?auto_749532 ) ) ( not ( = ?auto_749528 ?auto_749531 ) ) ( not ( = ?auto_749528 ?auto_749533 ) ) ( not ( = ?auto_749528 ?auto_749534 ) ) ( not ( = ?auto_749528 ?auto_749535 ) ) ( not ( = ?auto_749529 ?auto_749530 ) ) ( not ( = ?auto_749529 ?auto_749532 ) ) ( not ( = ?auto_749529 ?auto_749531 ) ) ( not ( = ?auto_749529 ?auto_749533 ) ) ( not ( = ?auto_749529 ?auto_749534 ) ) ( not ( = ?auto_749529 ?auto_749535 ) ) ( not ( = ?auto_749530 ?auto_749532 ) ) ( not ( = ?auto_749530 ?auto_749531 ) ) ( not ( = ?auto_749530 ?auto_749533 ) ) ( not ( = ?auto_749530 ?auto_749534 ) ) ( not ( = ?auto_749530 ?auto_749535 ) ) ( not ( = ?auto_749532 ?auto_749531 ) ) ( not ( = ?auto_749532 ?auto_749533 ) ) ( not ( = ?auto_749532 ?auto_749534 ) ) ( not ( = ?auto_749532 ?auto_749535 ) ) ( not ( = ?auto_749531 ?auto_749533 ) ) ( not ( = ?auto_749531 ?auto_749534 ) ) ( not ( = ?auto_749531 ?auto_749535 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_749533 ?auto_749534 ?auto_749535 )
      ( MAKE-7CRATE-VERIFY ?auto_749528 ?auto_749529 ?auto_749530 ?auto_749532 ?auto_749531 ?auto_749533 ?auto_749534 ?auto_749535 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_749598 - SURFACE
      ?auto_749599 - SURFACE
      ?auto_749600 - SURFACE
      ?auto_749602 - SURFACE
      ?auto_749601 - SURFACE
      ?auto_749603 - SURFACE
      ?auto_749604 - SURFACE
      ?auto_749605 - SURFACE
    )
    :vars
    (
      ?auto_749609 - HOIST
      ?auto_749607 - PLACE
      ?auto_749610 - TRUCK
      ?auto_749608 - PLACE
      ?auto_749606 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_749609 ?auto_749607 ) ( SURFACE-AT ?auto_749604 ?auto_749607 ) ( CLEAR ?auto_749604 ) ( IS-CRATE ?auto_749605 ) ( not ( = ?auto_749604 ?auto_749605 ) ) ( AVAILABLE ?auto_749609 ) ( ON ?auto_749604 ?auto_749603 ) ( not ( = ?auto_749603 ?auto_749604 ) ) ( not ( = ?auto_749603 ?auto_749605 ) ) ( TRUCK-AT ?auto_749610 ?auto_749608 ) ( not ( = ?auto_749608 ?auto_749607 ) ) ( HOIST-AT ?auto_749606 ?auto_749608 ) ( LIFTING ?auto_749606 ?auto_749605 ) ( not ( = ?auto_749609 ?auto_749606 ) ) ( ON ?auto_749599 ?auto_749598 ) ( ON ?auto_749600 ?auto_749599 ) ( ON ?auto_749602 ?auto_749600 ) ( ON ?auto_749601 ?auto_749602 ) ( ON ?auto_749603 ?auto_749601 ) ( not ( = ?auto_749598 ?auto_749599 ) ) ( not ( = ?auto_749598 ?auto_749600 ) ) ( not ( = ?auto_749598 ?auto_749602 ) ) ( not ( = ?auto_749598 ?auto_749601 ) ) ( not ( = ?auto_749598 ?auto_749603 ) ) ( not ( = ?auto_749598 ?auto_749604 ) ) ( not ( = ?auto_749598 ?auto_749605 ) ) ( not ( = ?auto_749599 ?auto_749600 ) ) ( not ( = ?auto_749599 ?auto_749602 ) ) ( not ( = ?auto_749599 ?auto_749601 ) ) ( not ( = ?auto_749599 ?auto_749603 ) ) ( not ( = ?auto_749599 ?auto_749604 ) ) ( not ( = ?auto_749599 ?auto_749605 ) ) ( not ( = ?auto_749600 ?auto_749602 ) ) ( not ( = ?auto_749600 ?auto_749601 ) ) ( not ( = ?auto_749600 ?auto_749603 ) ) ( not ( = ?auto_749600 ?auto_749604 ) ) ( not ( = ?auto_749600 ?auto_749605 ) ) ( not ( = ?auto_749602 ?auto_749601 ) ) ( not ( = ?auto_749602 ?auto_749603 ) ) ( not ( = ?auto_749602 ?auto_749604 ) ) ( not ( = ?auto_749602 ?auto_749605 ) ) ( not ( = ?auto_749601 ?auto_749603 ) ) ( not ( = ?auto_749601 ?auto_749604 ) ) ( not ( = ?auto_749601 ?auto_749605 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_749603 ?auto_749604 ?auto_749605 )
      ( MAKE-7CRATE-VERIFY ?auto_749598 ?auto_749599 ?auto_749600 ?auto_749602 ?auto_749601 ?auto_749603 ?auto_749604 ?auto_749605 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_749675 - SURFACE
      ?auto_749676 - SURFACE
      ?auto_749677 - SURFACE
      ?auto_749679 - SURFACE
      ?auto_749678 - SURFACE
      ?auto_749680 - SURFACE
      ?auto_749681 - SURFACE
      ?auto_749682 - SURFACE
    )
    :vars
    (
      ?auto_749685 - HOIST
      ?auto_749683 - PLACE
      ?auto_749684 - TRUCK
      ?auto_749688 - PLACE
      ?auto_749686 - HOIST
      ?auto_749687 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_749685 ?auto_749683 ) ( SURFACE-AT ?auto_749681 ?auto_749683 ) ( CLEAR ?auto_749681 ) ( IS-CRATE ?auto_749682 ) ( not ( = ?auto_749681 ?auto_749682 ) ) ( AVAILABLE ?auto_749685 ) ( ON ?auto_749681 ?auto_749680 ) ( not ( = ?auto_749680 ?auto_749681 ) ) ( not ( = ?auto_749680 ?auto_749682 ) ) ( TRUCK-AT ?auto_749684 ?auto_749688 ) ( not ( = ?auto_749688 ?auto_749683 ) ) ( HOIST-AT ?auto_749686 ?auto_749688 ) ( not ( = ?auto_749685 ?auto_749686 ) ) ( AVAILABLE ?auto_749686 ) ( SURFACE-AT ?auto_749682 ?auto_749688 ) ( ON ?auto_749682 ?auto_749687 ) ( CLEAR ?auto_749682 ) ( not ( = ?auto_749681 ?auto_749687 ) ) ( not ( = ?auto_749682 ?auto_749687 ) ) ( not ( = ?auto_749680 ?auto_749687 ) ) ( ON ?auto_749676 ?auto_749675 ) ( ON ?auto_749677 ?auto_749676 ) ( ON ?auto_749679 ?auto_749677 ) ( ON ?auto_749678 ?auto_749679 ) ( ON ?auto_749680 ?auto_749678 ) ( not ( = ?auto_749675 ?auto_749676 ) ) ( not ( = ?auto_749675 ?auto_749677 ) ) ( not ( = ?auto_749675 ?auto_749679 ) ) ( not ( = ?auto_749675 ?auto_749678 ) ) ( not ( = ?auto_749675 ?auto_749680 ) ) ( not ( = ?auto_749675 ?auto_749681 ) ) ( not ( = ?auto_749675 ?auto_749682 ) ) ( not ( = ?auto_749675 ?auto_749687 ) ) ( not ( = ?auto_749676 ?auto_749677 ) ) ( not ( = ?auto_749676 ?auto_749679 ) ) ( not ( = ?auto_749676 ?auto_749678 ) ) ( not ( = ?auto_749676 ?auto_749680 ) ) ( not ( = ?auto_749676 ?auto_749681 ) ) ( not ( = ?auto_749676 ?auto_749682 ) ) ( not ( = ?auto_749676 ?auto_749687 ) ) ( not ( = ?auto_749677 ?auto_749679 ) ) ( not ( = ?auto_749677 ?auto_749678 ) ) ( not ( = ?auto_749677 ?auto_749680 ) ) ( not ( = ?auto_749677 ?auto_749681 ) ) ( not ( = ?auto_749677 ?auto_749682 ) ) ( not ( = ?auto_749677 ?auto_749687 ) ) ( not ( = ?auto_749679 ?auto_749678 ) ) ( not ( = ?auto_749679 ?auto_749680 ) ) ( not ( = ?auto_749679 ?auto_749681 ) ) ( not ( = ?auto_749679 ?auto_749682 ) ) ( not ( = ?auto_749679 ?auto_749687 ) ) ( not ( = ?auto_749678 ?auto_749680 ) ) ( not ( = ?auto_749678 ?auto_749681 ) ) ( not ( = ?auto_749678 ?auto_749682 ) ) ( not ( = ?auto_749678 ?auto_749687 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_749680 ?auto_749681 ?auto_749682 )
      ( MAKE-7CRATE-VERIFY ?auto_749675 ?auto_749676 ?auto_749677 ?auto_749679 ?auto_749678 ?auto_749680 ?auto_749681 ?auto_749682 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_749753 - SURFACE
      ?auto_749754 - SURFACE
      ?auto_749755 - SURFACE
      ?auto_749757 - SURFACE
      ?auto_749756 - SURFACE
      ?auto_749758 - SURFACE
      ?auto_749759 - SURFACE
      ?auto_749760 - SURFACE
    )
    :vars
    (
      ?auto_749763 - HOIST
      ?auto_749761 - PLACE
      ?auto_749764 - PLACE
      ?auto_749762 - HOIST
      ?auto_749766 - SURFACE
      ?auto_749765 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_749763 ?auto_749761 ) ( SURFACE-AT ?auto_749759 ?auto_749761 ) ( CLEAR ?auto_749759 ) ( IS-CRATE ?auto_749760 ) ( not ( = ?auto_749759 ?auto_749760 ) ) ( AVAILABLE ?auto_749763 ) ( ON ?auto_749759 ?auto_749758 ) ( not ( = ?auto_749758 ?auto_749759 ) ) ( not ( = ?auto_749758 ?auto_749760 ) ) ( not ( = ?auto_749764 ?auto_749761 ) ) ( HOIST-AT ?auto_749762 ?auto_749764 ) ( not ( = ?auto_749763 ?auto_749762 ) ) ( AVAILABLE ?auto_749762 ) ( SURFACE-AT ?auto_749760 ?auto_749764 ) ( ON ?auto_749760 ?auto_749766 ) ( CLEAR ?auto_749760 ) ( not ( = ?auto_749759 ?auto_749766 ) ) ( not ( = ?auto_749760 ?auto_749766 ) ) ( not ( = ?auto_749758 ?auto_749766 ) ) ( TRUCK-AT ?auto_749765 ?auto_749761 ) ( ON ?auto_749754 ?auto_749753 ) ( ON ?auto_749755 ?auto_749754 ) ( ON ?auto_749757 ?auto_749755 ) ( ON ?auto_749756 ?auto_749757 ) ( ON ?auto_749758 ?auto_749756 ) ( not ( = ?auto_749753 ?auto_749754 ) ) ( not ( = ?auto_749753 ?auto_749755 ) ) ( not ( = ?auto_749753 ?auto_749757 ) ) ( not ( = ?auto_749753 ?auto_749756 ) ) ( not ( = ?auto_749753 ?auto_749758 ) ) ( not ( = ?auto_749753 ?auto_749759 ) ) ( not ( = ?auto_749753 ?auto_749760 ) ) ( not ( = ?auto_749753 ?auto_749766 ) ) ( not ( = ?auto_749754 ?auto_749755 ) ) ( not ( = ?auto_749754 ?auto_749757 ) ) ( not ( = ?auto_749754 ?auto_749756 ) ) ( not ( = ?auto_749754 ?auto_749758 ) ) ( not ( = ?auto_749754 ?auto_749759 ) ) ( not ( = ?auto_749754 ?auto_749760 ) ) ( not ( = ?auto_749754 ?auto_749766 ) ) ( not ( = ?auto_749755 ?auto_749757 ) ) ( not ( = ?auto_749755 ?auto_749756 ) ) ( not ( = ?auto_749755 ?auto_749758 ) ) ( not ( = ?auto_749755 ?auto_749759 ) ) ( not ( = ?auto_749755 ?auto_749760 ) ) ( not ( = ?auto_749755 ?auto_749766 ) ) ( not ( = ?auto_749757 ?auto_749756 ) ) ( not ( = ?auto_749757 ?auto_749758 ) ) ( not ( = ?auto_749757 ?auto_749759 ) ) ( not ( = ?auto_749757 ?auto_749760 ) ) ( not ( = ?auto_749757 ?auto_749766 ) ) ( not ( = ?auto_749756 ?auto_749758 ) ) ( not ( = ?auto_749756 ?auto_749759 ) ) ( not ( = ?auto_749756 ?auto_749760 ) ) ( not ( = ?auto_749756 ?auto_749766 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_749758 ?auto_749759 ?auto_749760 )
      ( MAKE-7CRATE-VERIFY ?auto_749753 ?auto_749754 ?auto_749755 ?auto_749757 ?auto_749756 ?auto_749758 ?auto_749759 ?auto_749760 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_749831 - SURFACE
      ?auto_749832 - SURFACE
      ?auto_749833 - SURFACE
      ?auto_749835 - SURFACE
      ?auto_749834 - SURFACE
      ?auto_749836 - SURFACE
      ?auto_749837 - SURFACE
      ?auto_749838 - SURFACE
    )
    :vars
    (
      ?auto_749843 - HOIST
      ?auto_749842 - PLACE
      ?auto_749844 - PLACE
      ?auto_749840 - HOIST
      ?auto_749841 - SURFACE
      ?auto_749839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_749843 ?auto_749842 ) ( IS-CRATE ?auto_749838 ) ( not ( = ?auto_749837 ?auto_749838 ) ) ( not ( = ?auto_749836 ?auto_749837 ) ) ( not ( = ?auto_749836 ?auto_749838 ) ) ( not ( = ?auto_749844 ?auto_749842 ) ) ( HOIST-AT ?auto_749840 ?auto_749844 ) ( not ( = ?auto_749843 ?auto_749840 ) ) ( AVAILABLE ?auto_749840 ) ( SURFACE-AT ?auto_749838 ?auto_749844 ) ( ON ?auto_749838 ?auto_749841 ) ( CLEAR ?auto_749838 ) ( not ( = ?auto_749837 ?auto_749841 ) ) ( not ( = ?auto_749838 ?auto_749841 ) ) ( not ( = ?auto_749836 ?auto_749841 ) ) ( TRUCK-AT ?auto_749839 ?auto_749842 ) ( SURFACE-AT ?auto_749836 ?auto_749842 ) ( CLEAR ?auto_749836 ) ( LIFTING ?auto_749843 ?auto_749837 ) ( IS-CRATE ?auto_749837 ) ( ON ?auto_749832 ?auto_749831 ) ( ON ?auto_749833 ?auto_749832 ) ( ON ?auto_749835 ?auto_749833 ) ( ON ?auto_749834 ?auto_749835 ) ( ON ?auto_749836 ?auto_749834 ) ( not ( = ?auto_749831 ?auto_749832 ) ) ( not ( = ?auto_749831 ?auto_749833 ) ) ( not ( = ?auto_749831 ?auto_749835 ) ) ( not ( = ?auto_749831 ?auto_749834 ) ) ( not ( = ?auto_749831 ?auto_749836 ) ) ( not ( = ?auto_749831 ?auto_749837 ) ) ( not ( = ?auto_749831 ?auto_749838 ) ) ( not ( = ?auto_749831 ?auto_749841 ) ) ( not ( = ?auto_749832 ?auto_749833 ) ) ( not ( = ?auto_749832 ?auto_749835 ) ) ( not ( = ?auto_749832 ?auto_749834 ) ) ( not ( = ?auto_749832 ?auto_749836 ) ) ( not ( = ?auto_749832 ?auto_749837 ) ) ( not ( = ?auto_749832 ?auto_749838 ) ) ( not ( = ?auto_749832 ?auto_749841 ) ) ( not ( = ?auto_749833 ?auto_749835 ) ) ( not ( = ?auto_749833 ?auto_749834 ) ) ( not ( = ?auto_749833 ?auto_749836 ) ) ( not ( = ?auto_749833 ?auto_749837 ) ) ( not ( = ?auto_749833 ?auto_749838 ) ) ( not ( = ?auto_749833 ?auto_749841 ) ) ( not ( = ?auto_749835 ?auto_749834 ) ) ( not ( = ?auto_749835 ?auto_749836 ) ) ( not ( = ?auto_749835 ?auto_749837 ) ) ( not ( = ?auto_749835 ?auto_749838 ) ) ( not ( = ?auto_749835 ?auto_749841 ) ) ( not ( = ?auto_749834 ?auto_749836 ) ) ( not ( = ?auto_749834 ?auto_749837 ) ) ( not ( = ?auto_749834 ?auto_749838 ) ) ( not ( = ?auto_749834 ?auto_749841 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_749836 ?auto_749837 ?auto_749838 )
      ( MAKE-7CRATE-VERIFY ?auto_749831 ?auto_749832 ?auto_749833 ?auto_749835 ?auto_749834 ?auto_749836 ?auto_749837 ?auto_749838 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_749909 - SURFACE
      ?auto_749910 - SURFACE
      ?auto_749911 - SURFACE
      ?auto_749913 - SURFACE
      ?auto_749912 - SURFACE
      ?auto_749914 - SURFACE
      ?auto_749915 - SURFACE
      ?auto_749916 - SURFACE
    )
    :vars
    (
      ?auto_749918 - HOIST
      ?auto_749921 - PLACE
      ?auto_749922 - PLACE
      ?auto_749920 - HOIST
      ?auto_749917 - SURFACE
      ?auto_749919 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_749918 ?auto_749921 ) ( IS-CRATE ?auto_749916 ) ( not ( = ?auto_749915 ?auto_749916 ) ) ( not ( = ?auto_749914 ?auto_749915 ) ) ( not ( = ?auto_749914 ?auto_749916 ) ) ( not ( = ?auto_749922 ?auto_749921 ) ) ( HOIST-AT ?auto_749920 ?auto_749922 ) ( not ( = ?auto_749918 ?auto_749920 ) ) ( AVAILABLE ?auto_749920 ) ( SURFACE-AT ?auto_749916 ?auto_749922 ) ( ON ?auto_749916 ?auto_749917 ) ( CLEAR ?auto_749916 ) ( not ( = ?auto_749915 ?auto_749917 ) ) ( not ( = ?auto_749916 ?auto_749917 ) ) ( not ( = ?auto_749914 ?auto_749917 ) ) ( TRUCK-AT ?auto_749919 ?auto_749921 ) ( SURFACE-AT ?auto_749914 ?auto_749921 ) ( CLEAR ?auto_749914 ) ( IS-CRATE ?auto_749915 ) ( AVAILABLE ?auto_749918 ) ( IN ?auto_749915 ?auto_749919 ) ( ON ?auto_749910 ?auto_749909 ) ( ON ?auto_749911 ?auto_749910 ) ( ON ?auto_749913 ?auto_749911 ) ( ON ?auto_749912 ?auto_749913 ) ( ON ?auto_749914 ?auto_749912 ) ( not ( = ?auto_749909 ?auto_749910 ) ) ( not ( = ?auto_749909 ?auto_749911 ) ) ( not ( = ?auto_749909 ?auto_749913 ) ) ( not ( = ?auto_749909 ?auto_749912 ) ) ( not ( = ?auto_749909 ?auto_749914 ) ) ( not ( = ?auto_749909 ?auto_749915 ) ) ( not ( = ?auto_749909 ?auto_749916 ) ) ( not ( = ?auto_749909 ?auto_749917 ) ) ( not ( = ?auto_749910 ?auto_749911 ) ) ( not ( = ?auto_749910 ?auto_749913 ) ) ( not ( = ?auto_749910 ?auto_749912 ) ) ( not ( = ?auto_749910 ?auto_749914 ) ) ( not ( = ?auto_749910 ?auto_749915 ) ) ( not ( = ?auto_749910 ?auto_749916 ) ) ( not ( = ?auto_749910 ?auto_749917 ) ) ( not ( = ?auto_749911 ?auto_749913 ) ) ( not ( = ?auto_749911 ?auto_749912 ) ) ( not ( = ?auto_749911 ?auto_749914 ) ) ( not ( = ?auto_749911 ?auto_749915 ) ) ( not ( = ?auto_749911 ?auto_749916 ) ) ( not ( = ?auto_749911 ?auto_749917 ) ) ( not ( = ?auto_749913 ?auto_749912 ) ) ( not ( = ?auto_749913 ?auto_749914 ) ) ( not ( = ?auto_749913 ?auto_749915 ) ) ( not ( = ?auto_749913 ?auto_749916 ) ) ( not ( = ?auto_749913 ?auto_749917 ) ) ( not ( = ?auto_749912 ?auto_749914 ) ) ( not ( = ?auto_749912 ?auto_749915 ) ) ( not ( = ?auto_749912 ?auto_749916 ) ) ( not ( = ?auto_749912 ?auto_749917 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_749914 ?auto_749915 ?auto_749916 )
      ( MAKE-7CRATE-VERIFY ?auto_749909 ?auto_749910 ?auto_749911 ?auto_749913 ?auto_749912 ?auto_749914 ?auto_749915 ?auto_749916 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_752828 - SURFACE
      ?auto_752829 - SURFACE
      ?auto_752830 - SURFACE
      ?auto_752832 - SURFACE
      ?auto_752831 - SURFACE
      ?auto_752833 - SURFACE
      ?auto_752834 - SURFACE
      ?auto_752835 - SURFACE
      ?auto_752836 - SURFACE
    )
    :vars
    (
      ?auto_752837 - HOIST
      ?auto_752838 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_752837 ?auto_752838 ) ( SURFACE-AT ?auto_752835 ?auto_752838 ) ( CLEAR ?auto_752835 ) ( LIFTING ?auto_752837 ?auto_752836 ) ( IS-CRATE ?auto_752836 ) ( not ( = ?auto_752835 ?auto_752836 ) ) ( ON ?auto_752829 ?auto_752828 ) ( ON ?auto_752830 ?auto_752829 ) ( ON ?auto_752832 ?auto_752830 ) ( ON ?auto_752831 ?auto_752832 ) ( ON ?auto_752833 ?auto_752831 ) ( ON ?auto_752834 ?auto_752833 ) ( ON ?auto_752835 ?auto_752834 ) ( not ( = ?auto_752828 ?auto_752829 ) ) ( not ( = ?auto_752828 ?auto_752830 ) ) ( not ( = ?auto_752828 ?auto_752832 ) ) ( not ( = ?auto_752828 ?auto_752831 ) ) ( not ( = ?auto_752828 ?auto_752833 ) ) ( not ( = ?auto_752828 ?auto_752834 ) ) ( not ( = ?auto_752828 ?auto_752835 ) ) ( not ( = ?auto_752828 ?auto_752836 ) ) ( not ( = ?auto_752829 ?auto_752830 ) ) ( not ( = ?auto_752829 ?auto_752832 ) ) ( not ( = ?auto_752829 ?auto_752831 ) ) ( not ( = ?auto_752829 ?auto_752833 ) ) ( not ( = ?auto_752829 ?auto_752834 ) ) ( not ( = ?auto_752829 ?auto_752835 ) ) ( not ( = ?auto_752829 ?auto_752836 ) ) ( not ( = ?auto_752830 ?auto_752832 ) ) ( not ( = ?auto_752830 ?auto_752831 ) ) ( not ( = ?auto_752830 ?auto_752833 ) ) ( not ( = ?auto_752830 ?auto_752834 ) ) ( not ( = ?auto_752830 ?auto_752835 ) ) ( not ( = ?auto_752830 ?auto_752836 ) ) ( not ( = ?auto_752832 ?auto_752831 ) ) ( not ( = ?auto_752832 ?auto_752833 ) ) ( not ( = ?auto_752832 ?auto_752834 ) ) ( not ( = ?auto_752832 ?auto_752835 ) ) ( not ( = ?auto_752832 ?auto_752836 ) ) ( not ( = ?auto_752831 ?auto_752833 ) ) ( not ( = ?auto_752831 ?auto_752834 ) ) ( not ( = ?auto_752831 ?auto_752835 ) ) ( not ( = ?auto_752831 ?auto_752836 ) ) ( not ( = ?auto_752833 ?auto_752834 ) ) ( not ( = ?auto_752833 ?auto_752835 ) ) ( not ( = ?auto_752833 ?auto_752836 ) ) ( not ( = ?auto_752834 ?auto_752835 ) ) ( not ( = ?auto_752834 ?auto_752836 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_752835 ?auto_752836 )
      ( MAKE-8CRATE-VERIFY ?auto_752828 ?auto_752829 ?auto_752830 ?auto_752832 ?auto_752831 ?auto_752833 ?auto_752834 ?auto_752835 ?auto_752836 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_752895 - SURFACE
      ?auto_752896 - SURFACE
      ?auto_752897 - SURFACE
      ?auto_752899 - SURFACE
      ?auto_752898 - SURFACE
      ?auto_752900 - SURFACE
      ?auto_752901 - SURFACE
      ?auto_752902 - SURFACE
      ?auto_752903 - SURFACE
    )
    :vars
    (
      ?auto_752905 - HOIST
      ?auto_752906 - PLACE
      ?auto_752904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_752905 ?auto_752906 ) ( SURFACE-AT ?auto_752902 ?auto_752906 ) ( CLEAR ?auto_752902 ) ( IS-CRATE ?auto_752903 ) ( not ( = ?auto_752902 ?auto_752903 ) ) ( TRUCK-AT ?auto_752904 ?auto_752906 ) ( AVAILABLE ?auto_752905 ) ( IN ?auto_752903 ?auto_752904 ) ( ON ?auto_752902 ?auto_752901 ) ( not ( = ?auto_752901 ?auto_752902 ) ) ( not ( = ?auto_752901 ?auto_752903 ) ) ( ON ?auto_752896 ?auto_752895 ) ( ON ?auto_752897 ?auto_752896 ) ( ON ?auto_752899 ?auto_752897 ) ( ON ?auto_752898 ?auto_752899 ) ( ON ?auto_752900 ?auto_752898 ) ( ON ?auto_752901 ?auto_752900 ) ( not ( = ?auto_752895 ?auto_752896 ) ) ( not ( = ?auto_752895 ?auto_752897 ) ) ( not ( = ?auto_752895 ?auto_752899 ) ) ( not ( = ?auto_752895 ?auto_752898 ) ) ( not ( = ?auto_752895 ?auto_752900 ) ) ( not ( = ?auto_752895 ?auto_752901 ) ) ( not ( = ?auto_752895 ?auto_752902 ) ) ( not ( = ?auto_752895 ?auto_752903 ) ) ( not ( = ?auto_752896 ?auto_752897 ) ) ( not ( = ?auto_752896 ?auto_752899 ) ) ( not ( = ?auto_752896 ?auto_752898 ) ) ( not ( = ?auto_752896 ?auto_752900 ) ) ( not ( = ?auto_752896 ?auto_752901 ) ) ( not ( = ?auto_752896 ?auto_752902 ) ) ( not ( = ?auto_752896 ?auto_752903 ) ) ( not ( = ?auto_752897 ?auto_752899 ) ) ( not ( = ?auto_752897 ?auto_752898 ) ) ( not ( = ?auto_752897 ?auto_752900 ) ) ( not ( = ?auto_752897 ?auto_752901 ) ) ( not ( = ?auto_752897 ?auto_752902 ) ) ( not ( = ?auto_752897 ?auto_752903 ) ) ( not ( = ?auto_752899 ?auto_752898 ) ) ( not ( = ?auto_752899 ?auto_752900 ) ) ( not ( = ?auto_752899 ?auto_752901 ) ) ( not ( = ?auto_752899 ?auto_752902 ) ) ( not ( = ?auto_752899 ?auto_752903 ) ) ( not ( = ?auto_752898 ?auto_752900 ) ) ( not ( = ?auto_752898 ?auto_752901 ) ) ( not ( = ?auto_752898 ?auto_752902 ) ) ( not ( = ?auto_752898 ?auto_752903 ) ) ( not ( = ?auto_752900 ?auto_752901 ) ) ( not ( = ?auto_752900 ?auto_752902 ) ) ( not ( = ?auto_752900 ?auto_752903 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_752901 ?auto_752902 ?auto_752903 )
      ( MAKE-8CRATE-VERIFY ?auto_752895 ?auto_752896 ?auto_752897 ?auto_752899 ?auto_752898 ?auto_752900 ?auto_752901 ?auto_752902 ?auto_752903 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_752971 - SURFACE
      ?auto_752972 - SURFACE
      ?auto_752973 - SURFACE
      ?auto_752975 - SURFACE
      ?auto_752974 - SURFACE
      ?auto_752976 - SURFACE
      ?auto_752977 - SURFACE
      ?auto_752978 - SURFACE
      ?auto_752979 - SURFACE
    )
    :vars
    (
      ?auto_752983 - HOIST
      ?auto_752981 - PLACE
      ?auto_752982 - TRUCK
      ?auto_752980 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_752983 ?auto_752981 ) ( SURFACE-AT ?auto_752978 ?auto_752981 ) ( CLEAR ?auto_752978 ) ( IS-CRATE ?auto_752979 ) ( not ( = ?auto_752978 ?auto_752979 ) ) ( AVAILABLE ?auto_752983 ) ( IN ?auto_752979 ?auto_752982 ) ( ON ?auto_752978 ?auto_752977 ) ( not ( = ?auto_752977 ?auto_752978 ) ) ( not ( = ?auto_752977 ?auto_752979 ) ) ( TRUCK-AT ?auto_752982 ?auto_752980 ) ( not ( = ?auto_752980 ?auto_752981 ) ) ( ON ?auto_752972 ?auto_752971 ) ( ON ?auto_752973 ?auto_752972 ) ( ON ?auto_752975 ?auto_752973 ) ( ON ?auto_752974 ?auto_752975 ) ( ON ?auto_752976 ?auto_752974 ) ( ON ?auto_752977 ?auto_752976 ) ( not ( = ?auto_752971 ?auto_752972 ) ) ( not ( = ?auto_752971 ?auto_752973 ) ) ( not ( = ?auto_752971 ?auto_752975 ) ) ( not ( = ?auto_752971 ?auto_752974 ) ) ( not ( = ?auto_752971 ?auto_752976 ) ) ( not ( = ?auto_752971 ?auto_752977 ) ) ( not ( = ?auto_752971 ?auto_752978 ) ) ( not ( = ?auto_752971 ?auto_752979 ) ) ( not ( = ?auto_752972 ?auto_752973 ) ) ( not ( = ?auto_752972 ?auto_752975 ) ) ( not ( = ?auto_752972 ?auto_752974 ) ) ( not ( = ?auto_752972 ?auto_752976 ) ) ( not ( = ?auto_752972 ?auto_752977 ) ) ( not ( = ?auto_752972 ?auto_752978 ) ) ( not ( = ?auto_752972 ?auto_752979 ) ) ( not ( = ?auto_752973 ?auto_752975 ) ) ( not ( = ?auto_752973 ?auto_752974 ) ) ( not ( = ?auto_752973 ?auto_752976 ) ) ( not ( = ?auto_752973 ?auto_752977 ) ) ( not ( = ?auto_752973 ?auto_752978 ) ) ( not ( = ?auto_752973 ?auto_752979 ) ) ( not ( = ?auto_752975 ?auto_752974 ) ) ( not ( = ?auto_752975 ?auto_752976 ) ) ( not ( = ?auto_752975 ?auto_752977 ) ) ( not ( = ?auto_752975 ?auto_752978 ) ) ( not ( = ?auto_752975 ?auto_752979 ) ) ( not ( = ?auto_752974 ?auto_752976 ) ) ( not ( = ?auto_752974 ?auto_752977 ) ) ( not ( = ?auto_752974 ?auto_752978 ) ) ( not ( = ?auto_752974 ?auto_752979 ) ) ( not ( = ?auto_752976 ?auto_752977 ) ) ( not ( = ?auto_752976 ?auto_752978 ) ) ( not ( = ?auto_752976 ?auto_752979 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_752977 ?auto_752978 ?auto_752979 )
      ( MAKE-8CRATE-VERIFY ?auto_752971 ?auto_752972 ?auto_752973 ?auto_752975 ?auto_752974 ?auto_752976 ?auto_752977 ?auto_752978 ?auto_752979 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_753055 - SURFACE
      ?auto_753056 - SURFACE
      ?auto_753057 - SURFACE
      ?auto_753059 - SURFACE
      ?auto_753058 - SURFACE
      ?auto_753060 - SURFACE
      ?auto_753061 - SURFACE
      ?auto_753062 - SURFACE
      ?auto_753063 - SURFACE
    )
    :vars
    (
      ?auto_753067 - HOIST
      ?auto_753064 - PLACE
      ?auto_753065 - TRUCK
      ?auto_753066 - PLACE
      ?auto_753068 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_753067 ?auto_753064 ) ( SURFACE-AT ?auto_753062 ?auto_753064 ) ( CLEAR ?auto_753062 ) ( IS-CRATE ?auto_753063 ) ( not ( = ?auto_753062 ?auto_753063 ) ) ( AVAILABLE ?auto_753067 ) ( ON ?auto_753062 ?auto_753061 ) ( not ( = ?auto_753061 ?auto_753062 ) ) ( not ( = ?auto_753061 ?auto_753063 ) ) ( TRUCK-AT ?auto_753065 ?auto_753066 ) ( not ( = ?auto_753066 ?auto_753064 ) ) ( HOIST-AT ?auto_753068 ?auto_753066 ) ( LIFTING ?auto_753068 ?auto_753063 ) ( not ( = ?auto_753067 ?auto_753068 ) ) ( ON ?auto_753056 ?auto_753055 ) ( ON ?auto_753057 ?auto_753056 ) ( ON ?auto_753059 ?auto_753057 ) ( ON ?auto_753058 ?auto_753059 ) ( ON ?auto_753060 ?auto_753058 ) ( ON ?auto_753061 ?auto_753060 ) ( not ( = ?auto_753055 ?auto_753056 ) ) ( not ( = ?auto_753055 ?auto_753057 ) ) ( not ( = ?auto_753055 ?auto_753059 ) ) ( not ( = ?auto_753055 ?auto_753058 ) ) ( not ( = ?auto_753055 ?auto_753060 ) ) ( not ( = ?auto_753055 ?auto_753061 ) ) ( not ( = ?auto_753055 ?auto_753062 ) ) ( not ( = ?auto_753055 ?auto_753063 ) ) ( not ( = ?auto_753056 ?auto_753057 ) ) ( not ( = ?auto_753056 ?auto_753059 ) ) ( not ( = ?auto_753056 ?auto_753058 ) ) ( not ( = ?auto_753056 ?auto_753060 ) ) ( not ( = ?auto_753056 ?auto_753061 ) ) ( not ( = ?auto_753056 ?auto_753062 ) ) ( not ( = ?auto_753056 ?auto_753063 ) ) ( not ( = ?auto_753057 ?auto_753059 ) ) ( not ( = ?auto_753057 ?auto_753058 ) ) ( not ( = ?auto_753057 ?auto_753060 ) ) ( not ( = ?auto_753057 ?auto_753061 ) ) ( not ( = ?auto_753057 ?auto_753062 ) ) ( not ( = ?auto_753057 ?auto_753063 ) ) ( not ( = ?auto_753059 ?auto_753058 ) ) ( not ( = ?auto_753059 ?auto_753060 ) ) ( not ( = ?auto_753059 ?auto_753061 ) ) ( not ( = ?auto_753059 ?auto_753062 ) ) ( not ( = ?auto_753059 ?auto_753063 ) ) ( not ( = ?auto_753058 ?auto_753060 ) ) ( not ( = ?auto_753058 ?auto_753061 ) ) ( not ( = ?auto_753058 ?auto_753062 ) ) ( not ( = ?auto_753058 ?auto_753063 ) ) ( not ( = ?auto_753060 ?auto_753061 ) ) ( not ( = ?auto_753060 ?auto_753062 ) ) ( not ( = ?auto_753060 ?auto_753063 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_753061 ?auto_753062 ?auto_753063 )
      ( MAKE-8CRATE-VERIFY ?auto_753055 ?auto_753056 ?auto_753057 ?auto_753059 ?auto_753058 ?auto_753060 ?auto_753061 ?auto_753062 ?auto_753063 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_753147 - SURFACE
      ?auto_753148 - SURFACE
      ?auto_753149 - SURFACE
      ?auto_753151 - SURFACE
      ?auto_753150 - SURFACE
      ?auto_753152 - SURFACE
      ?auto_753153 - SURFACE
      ?auto_753154 - SURFACE
      ?auto_753155 - SURFACE
    )
    :vars
    (
      ?auto_753158 - HOIST
      ?auto_753156 - PLACE
      ?auto_753160 - TRUCK
      ?auto_753157 - PLACE
      ?auto_753161 - HOIST
      ?auto_753159 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_753158 ?auto_753156 ) ( SURFACE-AT ?auto_753154 ?auto_753156 ) ( CLEAR ?auto_753154 ) ( IS-CRATE ?auto_753155 ) ( not ( = ?auto_753154 ?auto_753155 ) ) ( AVAILABLE ?auto_753158 ) ( ON ?auto_753154 ?auto_753153 ) ( not ( = ?auto_753153 ?auto_753154 ) ) ( not ( = ?auto_753153 ?auto_753155 ) ) ( TRUCK-AT ?auto_753160 ?auto_753157 ) ( not ( = ?auto_753157 ?auto_753156 ) ) ( HOIST-AT ?auto_753161 ?auto_753157 ) ( not ( = ?auto_753158 ?auto_753161 ) ) ( AVAILABLE ?auto_753161 ) ( SURFACE-AT ?auto_753155 ?auto_753157 ) ( ON ?auto_753155 ?auto_753159 ) ( CLEAR ?auto_753155 ) ( not ( = ?auto_753154 ?auto_753159 ) ) ( not ( = ?auto_753155 ?auto_753159 ) ) ( not ( = ?auto_753153 ?auto_753159 ) ) ( ON ?auto_753148 ?auto_753147 ) ( ON ?auto_753149 ?auto_753148 ) ( ON ?auto_753151 ?auto_753149 ) ( ON ?auto_753150 ?auto_753151 ) ( ON ?auto_753152 ?auto_753150 ) ( ON ?auto_753153 ?auto_753152 ) ( not ( = ?auto_753147 ?auto_753148 ) ) ( not ( = ?auto_753147 ?auto_753149 ) ) ( not ( = ?auto_753147 ?auto_753151 ) ) ( not ( = ?auto_753147 ?auto_753150 ) ) ( not ( = ?auto_753147 ?auto_753152 ) ) ( not ( = ?auto_753147 ?auto_753153 ) ) ( not ( = ?auto_753147 ?auto_753154 ) ) ( not ( = ?auto_753147 ?auto_753155 ) ) ( not ( = ?auto_753147 ?auto_753159 ) ) ( not ( = ?auto_753148 ?auto_753149 ) ) ( not ( = ?auto_753148 ?auto_753151 ) ) ( not ( = ?auto_753148 ?auto_753150 ) ) ( not ( = ?auto_753148 ?auto_753152 ) ) ( not ( = ?auto_753148 ?auto_753153 ) ) ( not ( = ?auto_753148 ?auto_753154 ) ) ( not ( = ?auto_753148 ?auto_753155 ) ) ( not ( = ?auto_753148 ?auto_753159 ) ) ( not ( = ?auto_753149 ?auto_753151 ) ) ( not ( = ?auto_753149 ?auto_753150 ) ) ( not ( = ?auto_753149 ?auto_753152 ) ) ( not ( = ?auto_753149 ?auto_753153 ) ) ( not ( = ?auto_753149 ?auto_753154 ) ) ( not ( = ?auto_753149 ?auto_753155 ) ) ( not ( = ?auto_753149 ?auto_753159 ) ) ( not ( = ?auto_753151 ?auto_753150 ) ) ( not ( = ?auto_753151 ?auto_753152 ) ) ( not ( = ?auto_753151 ?auto_753153 ) ) ( not ( = ?auto_753151 ?auto_753154 ) ) ( not ( = ?auto_753151 ?auto_753155 ) ) ( not ( = ?auto_753151 ?auto_753159 ) ) ( not ( = ?auto_753150 ?auto_753152 ) ) ( not ( = ?auto_753150 ?auto_753153 ) ) ( not ( = ?auto_753150 ?auto_753154 ) ) ( not ( = ?auto_753150 ?auto_753155 ) ) ( not ( = ?auto_753150 ?auto_753159 ) ) ( not ( = ?auto_753152 ?auto_753153 ) ) ( not ( = ?auto_753152 ?auto_753154 ) ) ( not ( = ?auto_753152 ?auto_753155 ) ) ( not ( = ?auto_753152 ?auto_753159 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_753153 ?auto_753154 ?auto_753155 )
      ( MAKE-8CRATE-VERIFY ?auto_753147 ?auto_753148 ?auto_753149 ?auto_753151 ?auto_753150 ?auto_753152 ?auto_753153 ?auto_753154 ?auto_753155 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_753240 - SURFACE
      ?auto_753241 - SURFACE
      ?auto_753242 - SURFACE
      ?auto_753244 - SURFACE
      ?auto_753243 - SURFACE
      ?auto_753245 - SURFACE
      ?auto_753246 - SURFACE
      ?auto_753247 - SURFACE
      ?auto_753248 - SURFACE
    )
    :vars
    (
      ?auto_753251 - HOIST
      ?auto_753253 - PLACE
      ?auto_753249 - PLACE
      ?auto_753254 - HOIST
      ?auto_753250 - SURFACE
      ?auto_753252 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_753251 ?auto_753253 ) ( SURFACE-AT ?auto_753247 ?auto_753253 ) ( CLEAR ?auto_753247 ) ( IS-CRATE ?auto_753248 ) ( not ( = ?auto_753247 ?auto_753248 ) ) ( AVAILABLE ?auto_753251 ) ( ON ?auto_753247 ?auto_753246 ) ( not ( = ?auto_753246 ?auto_753247 ) ) ( not ( = ?auto_753246 ?auto_753248 ) ) ( not ( = ?auto_753249 ?auto_753253 ) ) ( HOIST-AT ?auto_753254 ?auto_753249 ) ( not ( = ?auto_753251 ?auto_753254 ) ) ( AVAILABLE ?auto_753254 ) ( SURFACE-AT ?auto_753248 ?auto_753249 ) ( ON ?auto_753248 ?auto_753250 ) ( CLEAR ?auto_753248 ) ( not ( = ?auto_753247 ?auto_753250 ) ) ( not ( = ?auto_753248 ?auto_753250 ) ) ( not ( = ?auto_753246 ?auto_753250 ) ) ( TRUCK-AT ?auto_753252 ?auto_753253 ) ( ON ?auto_753241 ?auto_753240 ) ( ON ?auto_753242 ?auto_753241 ) ( ON ?auto_753244 ?auto_753242 ) ( ON ?auto_753243 ?auto_753244 ) ( ON ?auto_753245 ?auto_753243 ) ( ON ?auto_753246 ?auto_753245 ) ( not ( = ?auto_753240 ?auto_753241 ) ) ( not ( = ?auto_753240 ?auto_753242 ) ) ( not ( = ?auto_753240 ?auto_753244 ) ) ( not ( = ?auto_753240 ?auto_753243 ) ) ( not ( = ?auto_753240 ?auto_753245 ) ) ( not ( = ?auto_753240 ?auto_753246 ) ) ( not ( = ?auto_753240 ?auto_753247 ) ) ( not ( = ?auto_753240 ?auto_753248 ) ) ( not ( = ?auto_753240 ?auto_753250 ) ) ( not ( = ?auto_753241 ?auto_753242 ) ) ( not ( = ?auto_753241 ?auto_753244 ) ) ( not ( = ?auto_753241 ?auto_753243 ) ) ( not ( = ?auto_753241 ?auto_753245 ) ) ( not ( = ?auto_753241 ?auto_753246 ) ) ( not ( = ?auto_753241 ?auto_753247 ) ) ( not ( = ?auto_753241 ?auto_753248 ) ) ( not ( = ?auto_753241 ?auto_753250 ) ) ( not ( = ?auto_753242 ?auto_753244 ) ) ( not ( = ?auto_753242 ?auto_753243 ) ) ( not ( = ?auto_753242 ?auto_753245 ) ) ( not ( = ?auto_753242 ?auto_753246 ) ) ( not ( = ?auto_753242 ?auto_753247 ) ) ( not ( = ?auto_753242 ?auto_753248 ) ) ( not ( = ?auto_753242 ?auto_753250 ) ) ( not ( = ?auto_753244 ?auto_753243 ) ) ( not ( = ?auto_753244 ?auto_753245 ) ) ( not ( = ?auto_753244 ?auto_753246 ) ) ( not ( = ?auto_753244 ?auto_753247 ) ) ( not ( = ?auto_753244 ?auto_753248 ) ) ( not ( = ?auto_753244 ?auto_753250 ) ) ( not ( = ?auto_753243 ?auto_753245 ) ) ( not ( = ?auto_753243 ?auto_753246 ) ) ( not ( = ?auto_753243 ?auto_753247 ) ) ( not ( = ?auto_753243 ?auto_753248 ) ) ( not ( = ?auto_753243 ?auto_753250 ) ) ( not ( = ?auto_753245 ?auto_753246 ) ) ( not ( = ?auto_753245 ?auto_753247 ) ) ( not ( = ?auto_753245 ?auto_753248 ) ) ( not ( = ?auto_753245 ?auto_753250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_753246 ?auto_753247 ?auto_753248 )
      ( MAKE-8CRATE-VERIFY ?auto_753240 ?auto_753241 ?auto_753242 ?auto_753244 ?auto_753243 ?auto_753245 ?auto_753246 ?auto_753247 ?auto_753248 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_753333 - SURFACE
      ?auto_753334 - SURFACE
      ?auto_753335 - SURFACE
      ?auto_753337 - SURFACE
      ?auto_753336 - SURFACE
      ?auto_753338 - SURFACE
      ?auto_753339 - SURFACE
      ?auto_753340 - SURFACE
      ?auto_753341 - SURFACE
    )
    :vars
    (
      ?auto_753344 - HOIST
      ?auto_753345 - PLACE
      ?auto_753347 - PLACE
      ?auto_753346 - HOIST
      ?auto_753343 - SURFACE
      ?auto_753342 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_753344 ?auto_753345 ) ( IS-CRATE ?auto_753341 ) ( not ( = ?auto_753340 ?auto_753341 ) ) ( not ( = ?auto_753339 ?auto_753340 ) ) ( not ( = ?auto_753339 ?auto_753341 ) ) ( not ( = ?auto_753347 ?auto_753345 ) ) ( HOIST-AT ?auto_753346 ?auto_753347 ) ( not ( = ?auto_753344 ?auto_753346 ) ) ( AVAILABLE ?auto_753346 ) ( SURFACE-AT ?auto_753341 ?auto_753347 ) ( ON ?auto_753341 ?auto_753343 ) ( CLEAR ?auto_753341 ) ( not ( = ?auto_753340 ?auto_753343 ) ) ( not ( = ?auto_753341 ?auto_753343 ) ) ( not ( = ?auto_753339 ?auto_753343 ) ) ( TRUCK-AT ?auto_753342 ?auto_753345 ) ( SURFACE-AT ?auto_753339 ?auto_753345 ) ( CLEAR ?auto_753339 ) ( LIFTING ?auto_753344 ?auto_753340 ) ( IS-CRATE ?auto_753340 ) ( ON ?auto_753334 ?auto_753333 ) ( ON ?auto_753335 ?auto_753334 ) ( ON ?auto_753337 ?auto_753335 ) ( ON ?auto_753336 ?auto_753337 ) ( ON ?auto_753338 ?auto_753336 ) ( ON ?auto_753339 ?auto_753338 ) ( not ( = ?auto_753333 ?auto_753334 ) ) ( not ( = ?auto_753333 ?auto_753335 ) ) ( not ( = ?auto_753333 ?auto_753337 ) ) ( not ( = ?auto_753333 ?auto_753336 ) ) ( not ( = ?auto_753333 ?auto_753338 ) ) ( not ( = ?auto_753333 ?auto_753339 ) ) ( not ( = ?auto_753333 ?auto_753340 ) ) ( not ( = ?auto_753333 ?auto_753341 ) ) ( not ( = ?auto_753333 ?auto_753343 ) ) ( not ( = ?auto_753334 ?auto_753335 ) ) ( not ( = ?auto_753334 ?auto_753337 ) ) ( not ( = ?auto_753334 ?auto_753336 ) ) ( not ( = ?auto_753334 ?auto_753338 ) ) ( not ( = ?auto_753334 ?auto_753339 ) ) ( not ( = ?auto_753334 ?auto_753340 ) ) ( not ( = ?auto_753334 ?auto_753341 ) ) ( not ( = ?auto_753334 ?auto_753343 ) ) ( not ( = ?auto_753335 ?auto_753337 ) ) ( not ( = ?auto_753335 ?auto_753336 ) ) ( not ( = ?auto_753335 ?auto_753338 ) ) ( not ( = ?auto_753335 ?auto_753339 ) ) ( not ( = ?auto_753335 ?auto_753340 ) ) ( not ( = ?auto_753335 ?auto_753341 ) ) ( not ( = ?auto_753335 ?auto_753343 ) ) ( not ( = ?auto_753337 ?auto_753336 ) ) ( not ( = ?auto_753337 ?auto_753338 ) ) ( not ( = ?auto_753337 ?auto_753339 ) ) ( not ( = ?auto_753337 ?auto_753340 ) ) ( not ( = ?auto_753337 ?auto_753341 ) ) ( not ( = ?auto_753337 ?auto_753343 ) ) ( not ( = ?auto_753336 ?auto_753338 ) ) ( not ( = ?auto_753336 ?auto_753339 ) ) ( not ( = ?auto_753336 ?auto_753340 ) ) ( not ( = ?auto_753336 ?auto_753341 ) ) ( not ( = ?auto_753336 ?auto_753343 ) ) ( not ( = ?auto_753338 ?auto_753339 ) ) ( not ( = ?auto_753338 ?auto_753340 ) ) ( not ( = ?auto_753338 ?auto_753341 ) ) ( not ( = ?auto_753338 ?auto_753343 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_753339 ?auto_753340 ?auto_753341 )
      ( MAKE-8CRATE-VERIFY ?auto_753333 ?auto_753334 ?auto_753335 ?auto_753337 ?auto_753336 ?auto_753338 ?auto_753339 ?auto_753340 ?auto_753341 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_753426 - SURFACE
      ?auto_753427 - SURFACE
      ?auto_753428 - SURFACE
      ?auto_753430 - SURFACE
      ?auto_753429 - SURFACE
      ?auto_753431 - SURFACE
      ?auto_753432 - SURFACE
      ?auto_753433 - SURFACE
      ?auto_753434 - SURFACE
    )
    :vars
    (
      ?auto_753436 - HOIST
      ?auto_753439 - PLACE
      ?auto_753438 - PLACE
      ?auto_753435 - HOIST
      ?auto_753437 - SURFACE
      ?auto_753440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_753436 ?auto_753439 ) ( IS-CRATE ?auto_753434 ) ( not ( = ?auto_753433 ?auto_753434 ) ) ( not ( = ?auto_753432 ?auto_753433 ) ) ( not ( = ?auto_753432 ?auto_753434 ) ) ( not ( = ?auto_753438 ?auto_753439 ) ) ( HOIST-AT ?auto_753435 ?auto_753438 ) ( not ( = ?auto_753436 ?auto_753435 ) ) ( AVAILABLE ?auto_753435 ) ( SURFACE-AT ?auto_753434 ?auto_753438 ) ( ON ?auto_753434 ?auto_753437 ) ( CLEAR ?auto_753434 ) ( not ( = ?auto_753433 ?auto_753437 ) ) ( not ( = ?auto_753434 ?auto_753437 ) ) ( not ( = ?auto_753432 ?auto_753437 ) ) ( TRUCK-AT ?auto_753440 ?auto_753439 ) ( SURFACE-AT ?auto_753432 ?auto_753439 ) ( CLEAR ?auto_753432 ) ( IS-CRATE ?auto_753433 ) ( AVAILABLE ?auto_753436 ) ( IN ?auto_753433 ?auto_753440 ) ( ON ?auto_753427 ?auto_753426 ) ( ON ?auto_753428 ?auto_753427 ) ( ON ?auto_753430 ?auto_753428 ) ( ON ?auto_753429 ?auto_753430 ) ( ON ?auto_753431 ?auto_753429 ) ( ON ?auto_753432 ?auto_753431 ) ( not ( = ?auto_753426 ?auto_753427 ) ) ( not ( = ?auto_753426 ?auto_753428 ) ) ( not ( = ?auto_753426 ?auto_753430 ) ) ( not ( = ?auto_753426 ?auto_753429 ) ) ( not ( = ?auto_753426 ?auto_753431 ) ) ( not ( = ?auto_753426 ?auto_753432 ) ) ( not ( = ?auto_753426 ?auto_753433 ) ) ( not ( = ?auto_753426 ?auto_753434 ) ) ( not ( = ?auto_753426 ?auto_753437 ) ) ( not ( = ?auto_753427 ?auto_753428 ) ) ( not ( = ?auto_753427 ?auto_753430 ) ) ( not ( = ?auto_753427 ?auto_753429 ) ) ( not ( = ?auto_753427 ?auto_753431 ) ) ( not ( = ?auto_753427 ?auto_753432 ) ) ( not ( = ?auto_753427 ?auto_753433 ) ) ( not ( = ?auto_753427 ?auto_753434 ) ) ( not ( = ?auto_753427 ?auto_753437 ) ) ( not ( = ?auto_753428 ?auto_753430 ) ) ( not ( = ?auto_753428 ?auto_753429 ) ) ( not ( = ?auto_753428 ?auto_753431 ) ) ( not ( = ?auto_753428 ?auto_753432 ) ) ( not ( = ?auto_753428 ?auto_753433 ) ) ( not ( = ?auto_753428 ?auto_753434 ) ) ( not ( = ?auto_753428 ?auto_753437 ) ) ( not ( = ?auto_753430 ?auto_753429 ) ) ( not ( = ?auto_753430 ?auto_753431 ) ) ( not ( = ?auto_753430 ?auto_753432 ) ) ( not ( = ?auto_753430 ?auto_753433 ) ) ( not ( = ?auto_753430 ?auto_753434 ) ) ( not ( = ?auto_753430 ?auto_753437 ) ) ( not ( = ?auto_753429 ?auto_753431 ) ) ( not ( = ?auto_753429 ?auto_753432 ) ) ( not ( = ?auto_753429 ?auto_753433 ) ) ( not ( = ?auto_753429 ?auto_753434 ) ) ( not ( = ?auto_753429 ?auto_753437 ) ) ( not ( = ?auto_753431 ?auto_753432 ) ) ( not ( = ?auto_753431 ?auto_753433 ) ) ( not ( = ?auto_753431 ?auto_753434 ) ) ( not ( = ?auto_753431 ?auto_753437 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_753432 ?auto_753433 ?auto_753434 )
      ( MAKE-8CRATE-VERIFY ?auto_753426 ?auto_753427 ?auto_753428 ?auto_753430 ?auto_753429 ?auto_753431 ?auto_753432 ?auto_753433 ?auto_753434 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_757542 - SURFACE
      ?auto_757543 - SURFACE
      ?auto_757544 - SURFACE
      ?auto_757546 - SURFACE
      ?auto_757545 - SURFACE
      ?auto_757547 - SURFACE
      ?auto_757548 - SURFACE
      ?auto_757549 - SURFACE
      ?auto_757550 - SURFACE
      ?auto_757551 - SURFACE
    )
    :vars
    (
      ?auto_757552 - HOIST
      ?auto_757553 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_757552 ?auto_757553 ) ( SURFACE-AT ?auto_757550 ?auto_757553 ) ( CLEAR ?auto_757550 ) ( LIFTING ?auto_757552 ?auto_757551 ) ( IS-CRATE ?auto_757551 ) ( not ( = ?auto_757550 ?auto_757551 ) ) ( ON ?auto_757543 ?auto_757542 ) ( ON ?auto_757544 ?auto_757543 ) ( ON ?auto_757546 ?auto_757544 ) ( ON ?auto_757545 ?auto_757546 ) ( ON ?auto_757547 ?auto_757545 ) ( ON ?auto_757548 ?auto_757547 ) ( ON ?auto_757549 ?auto_757548 ) ( ON ?auto_757550 ?auto_757549 ) ( not ( = ?auto_757542 ?auto_757543 ) ) ( not ( = ?auto_757542 ?auto_757544 ) ) ( not ( = ?auto_757542 ?auto_757546 ) ) ( not ( = ?auto_757542 ?auto_757545 ) ) ( not ( = ?auto_757542 ?auto_757547 ) ) ( not ( = ?auto_757542 ?auto_757548 ) ) ( not ( = ?auto_757542 ?auto_757549 ) ) ( not ( = ?auto_757542 ?auto_757550 ) ) ( not ( = ?auto_757542 ?auto_757551 ) ) ( not ( = ?auto_757543 ?auto_757544 ) ) ( not ( = ?auto_757543 ?auto_757546 ) ) ( not ( = ?auto_757543 ?auto_757545 ) ) ( not ( = ?auto_757543 ?auto_757547 ) ) ( not ( = ?auto_757543 ?auto_757548 ) ) ( not ( = ?auto_757543 ?auto_757549 ) ) ( not ( = ?auto_757543 ?auto_757550 ) ) ( not ( = ?auto_757543 ?auto_757551 ) ) ( not ( = ?auto_757544 ?auto_757546 ) ) ( not ( = ?auto_757544 ?auto_757545 ) ) ( not ( = ?auto_757544 ?auto_757547 ) ) ( not ( = ?auto_757544 ?auto_757548 ) ) ( not ( = ?auto_757544 ?auto_757549 ) ) ( not ( = ?auto_757544 ?auto_757550 ) ) ( not ( = ?auto_757544 ?auto_757551 ) ) ( not ( = ?auto_757546 ?auto_757545 ) ) ( not ( = ?auto_757546 ?auto_757547 ) ) ( not ( = ?auto_757546 ?auto_757548 ) ) ( not ( = ?auto_757546 ?auto_757549 ) ) ( not ( = ?auto_757546 ?auto_757550 ) ) ( not ( = ?auto_757546 ?auto_757551 ) ) ( not ( = ?auto_757545 ?auto_757547 ) ) ( not ( = ?auto_757545 ?auto_757548 ) ) ( not ( = ?auto_757545 ?auto_757549 ) ) ( not ( = ?auto_757545 ?auto_757550 ) ) ( not ( = ?auto_757545 ?auto_757551 ) ) ( not ( = ?auto_757547 ?auto_757548 ) ) ( not ( = ?auto_757547 ?auto_757549 ) ) ( not ( = ?auto_757547 ?auto_757550 ) ) ( not ( = ?auto_757547 ?auto_757551 ) ) ( not ( = ?auto_757548 ?auto_757549 ) ) ( not ( = ?auto_757548 ?auto_757550 ) ) ( not ( = ?auto_757548 ?auto_757551 ) ) ( not ( = ?auto_757549 ?auto_757550 ) ) ( not ( = ?auto_757549 ?auto_757551 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_757550 ?auto_757551 )
      ( MAKE-9CRATE-VERIFY ?auto_757542 ?auto_757543 ?auto_757544 ?auto_757546 ?auto_757545 ?auto_757547 ?auto_757548 ?auto_757549 ?auto_757550 ?auto_757551 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_757622 - SURFACE
      ?auto_757623 - SURFACE
      ?auto_757624 - SURFACE
      ?auto_757626 - SURFACE
      ?auto_757625 - SURFACE
      ?auto_757627 - SURFACE
      ?auto_757628 - SURFACE
      ?auto_757629 - SURFACE
      ?auto_757630 - SURFACE
      ?auto_757631 - SURFACE
    )
    :vars
    (
      ?auto_757633 - HOIST
      ?auto_757634 - PLACE
      ?auto_757632 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_757633 ?auto_757634 ) ( SURFACE-AT ?auto_757630 ?auto_757634 ) ( CLEAR ?auto_757630 ) ( IS-CRATE ?auto_757631 ) ( not ( = ?auto_757630 ?auto_757631 ) ) ( TRUCK-AT ?auto_757632 ?auto_757634 ) ( AVAILABLE ?auto_757633 ) ( IN ?auto_757631 ?auto_757632 ) ( ON ?auto_757630 ?auto_757629 ) ( not ( = ?auto_757629 ?auto_757630 ) ) ( not ( = ?auto_757629 ?auto_757631 ) ) ( ON ?auto_757623 ?auto_757622 ) ( ON ?auto_757624 ?auto_757623 ) ( ON ?auto_757626 ?auto_757624 ) ( ON ?auto_757625 ?auto_757626 ) ( ON ?auto_757627 ?auto_757625 ) ( ON ?auto_757628 ?auto_757627 ) ( ON ?auto_757629 ?auto_757628 ) ( not ( = ?auto_757622 ?auto_757623 ) ) ( not ( = ?auto_757622 ?auto_757624 ) ) ( not ( = ?auto_757622 ?auto_757626 ) ) ( not ( = ?auto_757622 ?auto_757625 ) ) ( not ( = ?auto_757622 ?auto_757627 ) ) ( not ( = ?auto_757622 ?auto_757628 ) ) ( not ( = ?auto_757622 ?auto_757629 ) ) ( not ( = ?auto_757622 ?auto_757630 ) ) ( not ( = ?auto_757622 ?auto_757631 ) ) ( not ( = ?auto_757623 ?auto_757624 ) ) ( not ( = ?auto_757623 ?auto_757626 ) ) ( not ( = ?auto_757623 ?auto_757625 ) ) ( not ( = ?auto_757623 ?auto_757627 ) ) ( not ( = ?auto_757623 ?auto_757628 ) ) ( not ( = ?auto_757623 ?auto_757629 ) ) ( not ( = ?auto_757623 ?auto_757630 ) ) ( not ( = ?auto_757623 ?auto_757631 ) ) ( not ( = ?auto_757624 ?auto_757626 ) ) ( not ( = ?auto_757624 ?auto_757625 ) ) ( not ( = ?auto_757624 ?auto_757627 ) ) ( not ( = ?auto_757624 ?auto_757628 ) ) ( not ( = ?auto_757624 ?auto_757629 ) ) ( not ( = ?auto_757624 ?auto_757630 ) ) ( not ( = ?auto_757624 ?auto_757631 ) ) ( not ( = ?auto_757626 ?auto_757625 ) ) ( not ( = ?auto_757626 ?auto_757627 ) ) ( not ( = ?auto_757626 ?auto_757628 ) ) ( not ( = ?auto_757626 ?auto_757629 ) ) ( not ( = ?auto_757626 ?auto_757630 ) ) ( not ( = ?auto_757626 ?auto_757631 ) ) ( not ( = ?auto_757625 ?auto_757627 ) ) ( not ( = ?auto_757625 ?auto_757628 ) ) ( not ( = ?auto_757625 ?auto_757629 ) ) ( not ( = ?auto_757625 ?auto_757630 ) ) ( not ( = ?auto_757625 ?auto_757631 ) ) ( not ( = ?auto_757627 ?auto_757628 ) ) ( not ( = ?auto_757627 ?auto_757629 ) ) ( not ( = ?auto_757627 ?auto_757630 ) ) ( not ( = ?auto_757627 ?auto_757631 ) ) ( not ( = ?auto_757628 ?auto_757629 ) ) ( not ( = ?auto_757628 ?auto_757630 ) ) ( not ( = ?auto_757628 ?auto_757631 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_757629 ?auto_757630 ?auto_757631 )
      ( MAKE-9CRATE-VERIFY ?auto_757622 ?auto_757623 ?auto_757624 ?auto_757626 ?auto_757625 ?auto_757627 ?auto_757628 ?auto_757629 ?auto_757630 ?auto_757631 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_757712 - SURFACE
      ?auto_757713 - SURFACE
      ?auto_757714 - SURFACE
      ?auto_757716 - SURFACE
      ?auto_757715 - SURFACE
      ?auto_757717 - SURFACE
      ?auto_757718 - SURFACE
      ?auto_757719 - SURFACE
      ?auto_757720 - SURFACE
      ?auto_757721 - SURFACE
    )
    :vars
    (
      ?auto_757723 - HOIST
      ?auto_757722 - PLACE
      ?auto_757724 - TRUCK
      ?auto_757725 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_757723 ?auto_757722 ) ( SURFACE-AT ?auto_757720 ?auto_757722 ) ( CLEAR ?auto_757720 ) ( IS-CRATE ?auto_757721 ) ( not ( = ?auto_757720 ?auto_757721 ) ) ( AVAILABLE ?auto_757723 ) ( IN ?auto_757721 ?auto_757724 ) ( ON ?auto_757720 ?auto_757719 ) ( not ( = ?auto_757719 ?auto_757720 ) ) ( not ( = ?auto_757719 ?auto_757721 ) ) ( TRUCK-AT ?auto_757724 ?auto_757725 ) ( not ( = ?auto_757725 ?auto_757722 ) ) ( ON ?auto_757713 ?auto_757712 ) ( ON ?auto_757714 ?auto_757713 ) ( ON ?auto_757716 ?auto_757714 ) ( ON ?auto_757715 ?auto_757716 ) ( ON ?auto_757717 ?auto_757715 ) ( ON ?auto_757718 ?auto_757717 ) ( ON ?auto_757719 ?auto_757718 ) ( not ( = ?auto_757712 ?auto_757713 ) ) ( not ( = ?auto_757712 ?auto_757714 ) ) ( not ( = ?auto_757712 ?auto_757716 ) ) ( not ( = ?auto_757712 ?auto_757715 ) ) ( not ( = ?auto_757712 ?auto_757717 ) ) ( not ( = ?auto_757712 ?auto_757718 ) ) ( not ( = ?auto_757712 ?auto_757719 ) ) ( not ( = ?auto_757712 ?auto_757720 ) ) ( not ( = ?auto_757712 ?auto_757721 ) ) ( not ( = ?auto_757713 ?auto_757714 ) ) ( not ( = ?auto_757713 ?auto_757716 ) ) ( not ( = ?auto_757713 ?auto_757715 ) ) ( not ( = ?auto_757713 ?auto_757717 ) ) ( not ( = ?auto_757713 ?auto_757718 ) ) ( not ( = ?auto_757713 ?auto_757719 ) ) ( not ( = ?auto_757713 ?auto_757720 ) ) ( not ( = ?auto_757713 ?auto_757721 ) ) ( not ( = ?auto_757714 ?auto_757716 ) ) ( not ( = ?auto_757714 ?auto_757715 ) ) ( not ( = ?auto_757714 ?auto_757717 ) ) ( not ( = ?auto_757714 ?auto_757718 ) ) ( not ( = ?auto_757714 ?auto_757719 ) ) ( not ( = ?auto_757714 ?auto_757720 ) ) ( not ( = ?auto_757714 ?auto_757721 ) ) ( not ( = ?auto_757716 ?auto_757715 ) ) ( not ( = ?auto_757716 ?auto_757717 ) ) ( not ( = ?auto_757716 ?auto_757718 ) ) ( not ( = ?auto_757716 ?auto_757719 ) ) ( not ( = ?auto_757716 ?auto_757720 ) ) ( not ( = ?auto_757716 ?auto_757721 ) ) ( not ( = ?auto_757715 ?auto_757717 ) ) ( not ( = ?auto_757715 ?auto_757718 ) ) ( not ( = ?auto_757715 ?auto_757719 ) ) ( not ( = ?auto_757715 ?auto_757720 ) ) ( not ( = ?auto_757715 ?auto_757721 ) ) ( not ( = ?auto_757717 ?auto_757718 ) ) ( not ( = ?auto_757717 ?auto_757719 ) ) ( not ( = ?auto_757717 ?auto_757720 ) ) ( not ( = ?auto_757717 ?auto_757721 ) ) ( not ( = ?auto_757718 ?auto_757719 ) ) ( not ( = ?auto_757718 ?auto_757720 ) ) ( not ( = ?auto_757718 ?auto_757721 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_757719 ?auto_757720 ?auto_757721 )
      ( MAKE-9CRATE-VERIFY ?auto_757712 ?auto_757713 ?auto_757714 ?auto_757716 ?auto_757715 ?auto_757717 ?auto_757718 ?auto_757719 ?auto_757720 ?auto_757721 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_757811 - SURFACE
      ?auto_757812 - SURFACE
      ?auto_757813 - SURFACE
      ?auto_757815 - SURFACE
      ?auto_757814 - SURFACE
      ?auto_757816 - SURFACE
      ?auto_757817 - SURFACE
      ?auto_757818 - SURFACE
      ?auto_757819 - SURFACE
      ?auto_757820 - SURFACE
    )
    :vars
    (
      ?auto_757823 - HOIST
      ?auto_757824 - PLACE
      ?auto_757825 - TRUCK
      ?auto_757822 - PLACE
      ?auto_757821 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_757823 ?auto_757824 ) ( SURFACE-AT ?auto_757819 ?auto_757824 ) ( CLEAR ?auto_757819 ) ( IS-CRATE ?auto_757820 ) ( not ( = ?auto_757819 ?auto_757820 ) ) ( AVAILABLE ?auto_757823 ) ( ON ?auto_757819 ?auto_757818 ) ( not ( = ?auto_757818 ?auto_757819 ) ) ( not ( = ?auto_757818 ?auto_757820 ) ) ( TRUCK-AT ?auto_757825 ?auto_757822 ) ( not ( = ?auto_757822 ?auto_757824 ) ) ( HOIST-AT ?auto_757821 ?auto_757822 ) ( LIFTING ?auto_757821 ?auto_757820 ) ( not ( = ?auto_757823 ?auto_757821 ) ) ( ON ?auto_757812 ?auto_757811 ) ( ON ?auto_757813 ?auto_757812 ) ( ON ?auto_757815 ?auto_757813 ) ( ON ?auto_757814 ?auto_757815 ) ( ON ?auto_757816 ?auto_757814 ) ( ON ?auto_757817 ?auto_757816 ) ( ON ?auto_757818 ?auto_757817 ) ( not ( = ?auto_757811 ?auto_757812 ) ) ( not ( = ?auto_757811 ?auto_757813 ) ) ( not ( = ?auto_757811 ?auto_757815 ) ) ( not ( = ?auto_757811 ?auto_757814 ) ) ( not ( = ?auto_757811 ?auto_757816 ) ) ( not ( = ?auto_757811 ?auto_757817 ) ) ( not ( = ?auto_757811 ?auto_757818 ) ) ( not ( = ?auto_757811 ?auto_757819 ) ) ( not ( = ?auto_757811 ?auto_757820 ) ) ( not ( = ?auto_757812 ?auto_757813 ) ) ( not ( = ?auto_757812 ?auto_757815 ) ) ( not ( = ?auto_757812 ?auto_757814 ) ) ( not ( = ?auto_757812 ?auto_757816 ) ) ( not ( = ?auto_757812 ?auto_757817 ) ) ( not ( = ?auto_757812 ?auto_757818 ) ) ( not ( = ?auto_757812 ?auto_757819 ) ) ( not ( = ?auto_757812 ?auto_757820 ) ) ( not ( = ?auto_757813 ?auto_757815 ) ) ( not ( = ?auto_757813 ?auto_757814 ) ) ( not ( = ?auto_757813 ?auto_757816 ) ) ( not ( = ?auto_757813 ?auto_757817 ) ) ( not ( = ?auto_757813 ?auto_757818 ) ) ( not ( = ?auto_757813 ?auto_757819 ) ) ( not ( = ?auto_757813 ?auto_757820 ) ) ( not ( = ?auto_757815 ?auto_757814 ) ) ( not ( = ?auto_757815 ?auto_757816 ) ) ( not ( = ?auto_757815 ?auto_757817 ) ) ( not ( = ?auto_757815 ?auto_757818 ) ) ( not ( = ?auto_757815 ?auto_757819 ) ) ( not ( = ?auto_757815 ?auto_757820 ) ) ( not ( = ?auto_757814 ?auto_757816 ) ) ( not ( = ?auto_757814 ?auto_757817 ) ) ( not ( = ?auto_757814 ?auto_757818 ) ) ( not ( = ?auto_757814 ?auto_757819 ) ) ( not ( = ?auto_757814 ?auto_757820 ) ) ( not ( = ?auto_757816 ?auto_757817 ) ) ( not ( = ?auto_757816 ?auto_757818 ) ) ( not ( = ?auto_757816 ?auto_757819 ) ) ( not ( = ?auto_757816 ?auto_757820 ) ) ( not ( = ?auto_757817 ?auto_757818 ) ) ( not ( = ?auto_757817 ?auto_757819 ) ) ( not ( = ?auto_757817 ?auto_757820 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_757818 ?auto_757819 ?auto_757820 )
      ( MAKE-9CRATE-VERIFY ?auto_757811 ?auto_757812 ?auto_757813 ?auto_757815 ?auto_757814 ?auto_757816 ?auto_757817 ?auto_757818 ?auto_757819 ?auto_757820 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_757919 - SURFACE
      ?auto_757920 - SURFACE
      ?auto_757921 - SURFACE
      ?auto_757923 - SURFACE
      ?auto_757922 - SURFACE
      ?auto_757924 - SURFACE
      ?auto_757925 - SURFACE
      ?auto_757926 - SURFACE
      ?auto_757927 - SURFACE
      ?auto_757928 - SURFACE
    )
    :vars
    (
      ?auto_757929 - HOIST
      ?auto_757933 - PLACE
      ?auto_757930 - TRUCK
      ?auto_757934 - PLACE
      ?auto_757932 - HOIST
      ?auto_757931 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_757929 ?auto_757933 ) ( SURFACE-AT ?auto_757927 ?auto_757933 ) ( CLEAR ?auto_757927 ) ( IS-CRATE ?auto_757928 ) ( not ( = ?auto_757927 ?auto_757928 ) ) ( AVAILABLE ?auto_757929 ) ( ON ?auto_757927 ?auto_757926 ) ( not ( = ?auto_757926 ?auto_757927 ) ) ( not ( = ?auto_757926 ?auto_757928 ) ) ( TRUCK-AT ?auto_757930 ?auto_757934 ) ( not ( = ?auto_757934 ?auto_757933 ) ) ( HOIST-AT ?auto_757932 ?auto_757934 ) ( not ( = ?auto_757929 ?auto_757932 ) ) ( AVAILABLE ?auto_757932 ) ( SURFACE-AT ?auto_757928 ?auto_757934 ) ( ON ?auto_757928 ?auto_757931 ) ( CLEAR ?auto_757928 ) ( not ( = ?auto_757927 ?auto_757931 ) ) ( not ( = ?auto_757928 ?auto_757931 ) ) ( not ( = ?auto_757926 ?auto_757931 ) ) ( ON ?auto_757920 ?auto_757919 ) ( ON ?auto_757921 ?auto_757920 ) ( ON ?auto_757923 ?auto_757921 ) ( ON ?auto_757922 ?auto_757923 ) ( ON ?auto_757924 ?auto_757922 ) ( ON ?auto_757925 ?auto_757924 ) ( ON ?auto_757926 ?auto_757925 ) ( not ( = ?auto_757919 ?auto_757920 ) ) ( not ( = ?auto_757919 ?auto_757921 ) ) ( not ( = ?auto_757919 ?auto_757923 ) ) ( not ( = ?auto_757919 ?auto_757922 ) ) ( not ( = ?auto_757919 ?auto_757924 ) ) ( not ( = ?auto_757919 ?auto_757925 ) ) ( not ( = ?auto_757919 ?auto_757926 ) ) ( not ( = ?auto_757919 ?auto_757927 ) ) ( not ( = ?auto_757919 ?auto_757928 ) ) ( not ( = ?auto_757919 ?auto_757931 ) ) ( not ( = ?auto_757920 ?auto_757921 ) ) ( not ( = ?auto_757920 ?auto_757923 ) ) ( not ( = ?auto_757920 ?auto_757922 ) ) ( not ( = ?auto_757920 ?auto_757924 ) ) ( not ( = ?auto_757920 ?auto_757925 ) ) ( not ( = ?auto_757920 ?auto_757926 ) ) ( not ( = ?auto_757920 ?auto_757927 ) ) ( not ( = ?auto_757920 ?auto_757928 ) ) ( not ( = ?auto_757920 ?auto_757931 ) ) ( not ( = ?auto_757921 ?auto_757923 ) ) ( not ( = ?auto_757921 ?auto_757922 ) ) ( not ( = ?auto_757921 ?auto_757924 ) ) ( not ( = ?auto_757921 ?auto_757925 ) ) ( not ( = ?auto_757921 ?auto_757926 ) ) ( not ( = ?auto_757921 ?auto_757927 ) ) ( not ( = ?auto_757921 ?auto_757928 ) ) ( not ( = ?auto_757921 ?auto_757931 ) ) ( not ( = ?auto_757923 ?auto_757922 ) ) ( not ( = ?auto_757923 ?auto_757924 ) ) ( not ( = ?auto_757923 ?auto_757925 ) ) ( not ( = ?auto_757923 ?auto_757926 ) ) ( not ( = ?auto_757923 ?auto_757927 ) ) ( not ( = ?auto_757923 ?auto_757928 ) ) ( not ( = ?auto_757923 ?auto_757931 ) ) ( not ( = ?auto_757922 ?auto_757924 ) ) ( not ( = ?auto_757922 ?auto_757925 ) ) ( not ( = ?auto_757922 ?auto_757926 ) ) ( not ( = ?auto_757922 ?auto_757927 ) ) ( not ( = ?auto_757922 ?auto_757928 ) ) ( not ( = ?auto_757922 ?auto_757931 ) ) ( not ( = ?auto_757924 ?auto_757925 ) ) ( not ( = ?auto_757924 ?auto_757926 ) ) ( not ( = ?auto_757924 ?auto_757927 ) ) ( not ( = ?auto_757924 ?auto_757928 ) ) ( not ( = ?auto_757924 ?auto_757931 ) ) ( not ( = ?auto_757925 ?auto_757926 ) ) ( not ( = ?auto_757925 ?auto_757927 ) ) ( not ( = ?auto_757925 ?auto_757928 ) ) ( not ( = ?auto_757925 ?auto_757931 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_757926 ?auto_757927 ?auto_757928 )
      ( MAKE-9CRATE-VERIFY ?auto_757919 ?auto_757920 ?auto_757921 ?auto_757923 ?auto_757922 ?auto_757924 ?auto_757925 ?auto_757926 ?auto_757927 ?auto_757928 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_758028 - SURFACE
      ?auto_758029 - SURFACE
      ?auto_758030 - SURFACE
      ?auto_758032 - SURFACE
      ?auto_758031 - SURFACE
      ?auto_758033 - SURFACE
      ?auto_758034 - SURFACE
      ?auto_758035 - SURFACE
      ?auto_758036 - SURFACE
      ?auto_758037 - SURFACE
    )
    :vars
    (
      ?auto_758038 - HOIST
      ?auto_758040 - PLACE
      ?auto_758042 - PLACE
      ?auto_758041 - HOIST
      ?auto_758043 - SURFACE
      ?auto_758039 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758038 ?auto_758040 ) ( SURFACE-AT ?auto_758036 ?auto_758040 ) ( CLEAR ?auto_758036 ) ( IS-CRATE ?auto_758037 ) ( not ( = ?auto_758036 ?auto_758037 ) ) ( AVAILABLE ?auto_758038 ) ( ON ?auto_758036 ?auto_758035 ) ( not ( = ?auto_758035 ?auto_758036 ) ) ( not ( = ?auto_758035 ?auto_758037 ) ) ( not ( = ?auto_758042 ?auto_758040 ) ) ( HOIST-AT ?auto_758041 ?auto_758042 ) ( not ( = ?auto_758038 ?auto_758041 ) ) ( AVAILABLE ?auto_758041 ) ( SURFACE-AT ?auto_758037 ?auto_758042 ) ( ON ?auto_758037 ?auto_758043 ) ( CLEAR ?auto_758037 ) ( not ( = ?auto_758036 ?auto_758043 ) ) ( not ( = ?auto_758037 ?auto_758043 ) ) ( not ( = ?auto_758035 ?auto_758043 ) ) ( TRUCK-AT ?auto_758039 ?auto_758040 ) ( ON ?auto_758029 ?auto_758028 ) ( ON ?auto_758030 ?auto_758029 ) ( ON ?auto_758032 ?auto_758030 ) ( ON ?auto_758031 ?auto_758032 ) ( ON ?auto_758033 ?auto_758031 ) ( ON ?auto_758034 ?auto_758033 ) ( ON ?auto_758035 ?auto_758034 ) ( not ( = ?auto_758028 ?auto_758029 ) ) ( not ( = ?auto_758028 ?auto_758030 ) ) ( not ( = ?auto_758028 ?auto_758032 ) ) ( not ( = ?auto_758028 ?auto_758031 ) ) ( not ( = ?auto_758028 ?auto_758033 ) ) ( not ( = ?auto_758028 ?auto_758034 ) ) ( not ( = ?auto_758028 ?auto_758035 ) ) ( not ( = ?auto_758028 ?auto_758036 ) ) ( not ( = ?auto_758028 ?auto_758037 ) ) ( not ( = ?auto_758028 ?auto_758043 ) ) ( not ( = ?auto_758029 ?auto_758030 ) ) ( not ( = ?auto_758029 ?auto_758032 ) ) ( not ( = ?auto_758029 ?auto_758031 ) ) ( not ( = ?auto_758029 ?auto_758033 ) ) ( not ( = ?auto_758029 ?auto_758034 ) ) ( not ( = ?auto_758029 ?auto_758035 ) ) ( not ( = ?auto_758029 ?auto_758036 ) ) ( not ( = ?auto_758029 ?auto_758037 ) ) ( not ( = ?auto_758029 ?auto_758043 ) ) ( not ( = ?auto_758030 ?auto_758032 ) ) ( not ( = ?auto_758030 ?auto_758031 ) ) ( not ( = ?auto_758030 ?auto_758033 ) ) ( not ( = ?auto_758030 ?auto_758034 ) ) ( not ( = ?auto_758030 ?auto_758035 ) ) ( not ( = ?auto_758030 ?auto_758036 ) ) ( not ( = ?auto_758030 ?auto_758037 ) ) ( not ( = ?auto_758030 ?auto_758043 ) ) ( not ( = ?auto_758032 ?auto_758031 ) ) ( not ( = ?auto_758032 ?auto_758033 ) ) ( not ( = ?auto_758032 ?auto_758034 ) ) ( not ( = ?auto_758032 ?auto_758035 ) ) ( not ( = ?auto_758032 ?auto_758036 ) ) ( not ( = ?auto_758032 ?auto_758037 ) ) ( not ( = ?auto_758032 ?auto_758043 ) ) ( not ( = ?auto_758031 ?auto_758033 ) ) ( not ( = ?auto_758031 ?auto_758034 ) ) ( not ( = ?auto_758031 ?auto_758035 ) ) ( not ( = ?auto_758031 ?auto_758036 ) ) ( not ( = ?auto_758031 ?auto_758037 ) ) ( not ( = ?auto_758031 ?auto_758043 ) ) ( not ( = ?auto_758033 ?auto_758034 ) ) ( not ( = ?auto_758033 ?auto_758035 ) ) ( not ( = ?auto_758033 ?auto_758036 ) ) ( not ( = ?auto_758033 ?auto_758037 ) ) ( not ( = ?auto_758033 ?auto_758043 ) ) ( not ( = ?auto_758034 ?auto_758035 ) ) ( not ( = ?auto_758034 ?auto_758036 ) ) ( not ( = ?auto_758034 ?auto_758037 ) ) ( not ( = ?auto_758034 ?auto_758043 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758035 ?auto_758036 ?auto_758037 )
      ( MAKE-9CRATE-VERIFY ?auto_758028 ?auto_758029 ?auto_758030 ?auto_758032 ?auto_758031 ?auto_758033 ?auto_758034 ?auto_758035 ?auto_758036 ?auto_758037 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_758137 - SURFACE
      ?auto_758138 - SURFACE
      ?auto_758139 - SURFACE
      ?auto_758141 - SURFACE
      ?auto_758140 - SURFACE
      ?auto_758142 - SURFACE
      ?auto_758143 - SURFACE
      ?auto_758144 - SURFACE
      ?auto_758145 - SURFACE
      ?auto_758146 - SURFACE
    )
    :vars
    (
      ?auto_758151 - HOIST
      ?auto_758150 - PLACE
      ?auto_758147 - PLACE
      ?auto_758148 - HOIST
      ?auto_758152 - SURFACE
      ?auto_758149 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758151 ?auto_758150 ) ( IS-CRATE ?auto_758146 ) ( not ( = ?auto_758145 ?auto_758146 ) ) ( not ( = ?auto_758144 ?auto_758145 ) ) ( not ( = ?auto_758144 ?auto_758146 ) ) ( not ( = ?auto_758147 ?auto_758150 ) ) ( HOIST-AT ?auto_758148 ?auto_758147 ) ( not ( = ?auto_758151 ?auto_758148 ) ) ( AVAILABLE ?auto_758148 ) ( SURFACE-AT ?auto_758146 ?auto_758147 ) ( ON ?auto_758146 ?auto_758152 ) ( CLEAR ?auto_758146 ) ( not ( = ?auto_758145 ?auto_758152 ) ) ( not ( = ?auto_758146 ?auto_758152 ) ) ( not ( = ?auto_758144 ?auto_758152 ) ) ( TRUCK-AT ?auto_758149 ?auto_758150 ) ( SURFACE-AT ?auto_758144 ?auto_758150 ) ( CLEAR ?auto_758144 ) ( LIFTING ?auto_758151 ?auto_758145 ) ( IS-CRATE ?auto_758145 ) ( ON ?auto_758138 ?auto_758137 ) ( ON ?auto_758139 ?auto_758138 ) ( ON ?auto_758141 ?auto_758139 ) ( ON ?auto_758140 ?auto_758141 ) ( ON ?auto_758142 ?auto_758140 ) ( ON ?auto_758143 ?auto_758142 ) ( ON ?auto_758144 ?auto_758143 ) ( not ( = ?auto_758137 ?auto_758138 ) ) ( not ( = ?auto_758137 ?auto_758139 ) ) ( not ( = ?auto_758137 ?auto_758141 ) ) ( not ( = ?auto_758137 ?auto_758140 ) ) ( not ( = ?auto_758137 ?auto_758142 ) ) ( not ( = ?auto_758137 ?auto_758143 ) ) ( not ( = ?auto_758137 ?auto_758144 ) ) ( not ( = ?auto_758137 ?auto_758145 ) ) ( not ( = ?auto_758137 ?auto_758146 ) ) ( not ( = ?auto_758137 ?auto_758152 ) ) ( not ( = ?auto_758138 ?auto_758139 ) ) ( not ( = ?auto_758138 ?auto_758141 ) ) ( not ( = ?auto_758138 ?auto_758140 ) ) ( not ( = ?auto_758138 ?auto_758142 ) ) ( not ( = ?auto_758138 ?auto_758143 ) ) ( not ( = ?auto_758138 ?auto_758144 ) ) ( not ( = ?auto_758138 ?auto_758145 ) ) ( not ( = ?auto_758138 ?auto_758146 ) ) ( not ( = ?auto_758138 ?auto_758152 ) ) ( not ( = ?auto_758139 ?auto_758141 ) ) ( not ( = ?auto_758139 ?auto_758140 ) ) ( not ( = ?auto_758139 ?auto_758142 ) ) ( not ( = ?auto_758139 ?auto_758143 ) ) ( not ( = ?auto_758139 ?auto_758144 ) ) ( not ( = ?auto_758139 ?auto_758145 ) ) ( not ( = ?auto_758139 ?auto_758146 ) ) ( not ( = ?auto_758139 ?auto_758152 ) ) ( not ( = ?auto_758141 ?auto_758140 ) ) ( not ( = ?auto_758141 ?auto_758142 ) ) ( not ( = ?auto_758141 ?auto_758143 ) ) ( not ( = ?auto_758141 ?auto_758144 ) ) ( not ( = ?auto_758141 ?auto_758145 ) ) ( not ( = ?auto_758141 ?auto_758146 ) ) ( not ( = ?auto_758141 ?auto_758152 ) ) ( not ( = ?auto_758140 ?auto_758142 ) ) ( not ( = ?auto_758140 ?auto_758143 ) ) ( not ( = ?auto_758140 ?auto_758144 ) ) ( not ( = ?auto_758140 ?auto_758145 ) ) ( not ( = ?auto_758140 ?auto_758146 ) ) ( not ( = ?auto_758140 ?auto_758152 ) ) ( not ( = ?auto_758142 ?auto_758143 ) ) ( not ( = ?auto_758142 ?auto_758144 ) ) ( not ( = ?auto_758142 ?auto_758145 ) ) ( not ( = ?auto_758142 ?auto_758146 ) ) ( not ( = ?auto_758142 ?auto_758152 ) ) ( not ( = ?auto_758143 ?auto_758144 ) ) ( not ( = ?auto_758143 ?auto_758145 ) ) ( not ( = ?auto_758143 ?auto_758146 ) ) ( not ( = ?auto_758143 ?auto_758152 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758144 ?auto_758145 ?auto_758146 )
      ( MAKE-9CRATE-VERIFY ?auto_758137 ?auto_758138 ?auto_758139 ?auto_758141 ?auto_758140 ?auto_758142 ?auto_758143 ?auto_758144 ?auto_758145 ?auto_758146 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_758246 - SURFACE
      ?auto_758247 - SURFACE
      ?auto_758248 - SURFACE
      ?auto_758250 - SURFACE
      ?auto_758249 - SURFACE
      ?auto_758251 - SURFACE
      ?auto_758252 - SURFACE
      ?auto_758253 - SURFACE
      ?auto_758254 - SURFACE
      ?auto_758255 - SURFACE
    )
    :vars
    (
      ?auto_758258 - HOIST
      ?auto_758261 - PLACE
      ?auto_758257 - PLACE
      ?auto_758260 - HOIST
      ?auto_758259 - SURFACE
      ?auto_758256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758258 ?auto_758261 ) ( IS-CRATE ?auto_758255 ) ( not ( = ?auto_758254 ?auto_758255 ) ) ( not ( = ?auto_758253 ?auto_758254 ) ) ( not ( = ?auto_758253 ?auto_758255 ) ) ( not ( = ?auto_758257 ?auto_758261 ) ) ( HOIST-AT ?auto_758260 ?auto_758257 ) ( not ( = ?auto_758258 ?auto_758260 ) ) ( AVAILABLE ?auto_758260 ) ( SURFACE-AT ?auto_758255 ?auto_758257 ) ( ON ?auto_758255 ?auto_758259 ) ( CLEAR ?auto_758255 ) ( not ( = ?auto_758254 ?auto_758259 ) ) ( not ( = ?auto_758255 ?auto_758259 ) ) ( not ( = ?auto_758253 ?auto_758259 ) ) ( TRUCK-AT ?auto_758256 ?auto_758261 ) ( SURFACE-AT ?auto_758253 ?auto_758261 ) ( CLEAR ?auto_758253 ) ( IS-CRATE ?auto_758254 ) ( AVAILABLE ?auto_758258 ) ( IN ?auto_758254 ?auto_758256 ) ( ON ?auto_758247 ?auto_758246 ) ( ON ?auto_758248 ?auto_758247 ) ( ON ?auto_758250 ?auto_758248 ) ( ON ?auto_758249 ?auto_758250 ) ( ON ?auto_758251 ?auto_758249 ) ( ON ?auto_758252 ?auto_758251 ) ( ON ?auto_758253 ?auto_758252 ) ( not ( = ?auto_758246 ?auto_758247 ) ) ( not ( = ?auto_758246 ?auto_758248 ) ) ( not ( = ?auto_758246 ?auto_758250 ) ) ( not ( = ?auto_758246 ?auto_758249 ) ) ( not ( = ?auto_758246 ?auto_758251 ) ) ( not ( = ?auto_758246 ?auto_758252 ) ) ( not ( = ?auto_758246 ?auto_758253 ) ) ( not ( = ?auto_758246 ?auto_758254 ) ) ( not ( = ?auto_758246 ?auto_758255 ) ) ( not ( = ?auto_758246 ?auto_758259 ) ) ( not ( = ?auto_758247 ?auto_758248 ) ) ( not ( = ?auto_758247 ?auto_758250 ) ) ( not ( = ?auto_758247 ?auto_758249 ) ) ( not ( = ?auto_758247 ?auto_758251 ) ) ( not ( = ?auto_758247 ?auto_758252 ) ) ( not ( = ?auto_758247 ?auto_758253 ) ) ( not ( = ?auto_758247 ?auto_758254 ) ) ( not ( = ?auto_758247 ?auto_758255 ) ) ( not ( = ?auto_758247 ?auto_758259 ) ) ( not ( = ?auto_758248 ?auto_758250 ) ) ( not ( = ?auto_758248 ?auto_758249 ) ) ( not ( = ?auto_758248 ?auto_758251 ) ) ( not ( = ?auto_758248 ?auto_758252 ) ) ( not ( = ?auto_758248 ?auto_758253 ) ) ( not ( = ?auto_758248 ?auto_758254 ) ) ( not ( = ?auto_758248 ?auto_758255 ) ) ( not ( = ?auto_758248 ?auto_758259 ) ) ( not ( = ?auto_758250 ?auto_758249 ) ) ( not ( = ?auto_758250 ?auto_758251 ) ) ( not ( = ?auto_758250 ?auto_758252 ) ) ( not ( = ?auto_758250 ?auto_758253 ) ) ( not ( = ?auto_758250 ?auto_758254 ) ) ( not ( = ?auto_758250 ?auto_758255 ) ) ( not ( = ?auto_758250 ?auto_758259 ) ) ( not ( = ?auto_758249 ?auto_758251 ) ) ( not ( = ?auto_758249 ?auto_758252 ) ) ( not ( = ?auto_758249 ?auto_758253 ) ) ( not ( = ?auto_758249 ?auto_758254 ) ) ( not ( = ?auto_758249 ?auto_758255 ) ) ( not ( = ?auto_758249 ?auto_758259 ) ) ( not ( = ?auto_758251 ?auto_758252 ) ) ( not ( = ?auto_758251 ?auto_758253 ) ) ( not ( = ?auto_758251 ?auto_758254 ) ) ( not ( = ?auto_758251 ?auto_758255 ) ) ( not ( = ?auto_758251 ?auto_758259 ) ) ( not ( = ?auto_758252 ?auto_758253 ) ) ( not ( = ?auto_758252 ?auto_758254 ) ) ( not ( = ?auto_758252 ?auto_758255 ) ) ( not ( = ?auto_758252 ?auto_758259 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758253 ?auto_758254 ?auto_758255 )
      ( MAKE-9CRATE-VERIFY ?auto_758246 ?auto_758247 ?auto_758248 ?auto_758250 ?auto_758249 ?auto_758251 ?auto_758252 ?auto_758253 ?auto_758254 ?auto_758255 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_758262 - SURFACE
      ?auto_758263 - SURFACE
    )
    :vars
    (
      ?auto_758266 - HOIST
      ?auto_758269 - PLACE
      ?auto_758270 - SURFACE
      ?auto_758265 - PLACE
      ?auto_758268 - HOIST
      ?auto_758267 - SURFACE
      ?auto_758264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758266 ?auto_758269 ) ( IS-CRATE ?auto_758263 ) ( not ( = ?auto_758262 ?auto_758263 ) ) ( not ( = ?auto_758270 ?auto_758262 ) ) ( not ( = ?auto_758270 ?auto_758263 ) ) ( not ( = ?auto_758265 ?auto_758269 ) ) ( HOIST-AT ?auto_758268 ?auto_758265 ) ( not ( = ?auto_758266 ?auto_758268 ) ) ( AVAILABLE ?auto_758268 ) ( SURFACE-AT ?auto_758263 ?auto_758265 ) ( ON ?auto_758263 ?auto_758267 ) ( CLEAR ?auto_758263 ) ( not ( = ?auto_758262 ?auto_758267 ) ) ( not ( = ?auto_758263 ?auto_758267 ) ) ( not ( = ?auto_758270 ?auto_758267 ) ) ( SURFACE-AT ?auto_758270 ?auto_758269 ) ( CLEAR ?auto_758270 ) ( IS-CRATE ?auto_758262 ) ( AVAILABLE ?auto_758266 ) ( IN ?auto_758262 ?auto_758264 ) ( TRUCK-AT ?auto_758264 ?auto_758265 ) )
    :subtasks
    ( ( !DRIVE ?auto_758264 ?auto_758265 ?auto_758269 )
      ( MAKE-2CRATE ?auto_758270 ?auto_758262 ?auto_758263 )
      ( MAKE-1CRATE-VERIFY ?auto_758262 ?auto_758263 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_758271 - SURFACE
      ?auto_758272 - SURFACE
      ?auto_758273 - SURFACE
    )
    :vars
    (
      ?auto_758275 - HOIST
      ?auto_758276 - PLACE
      ?auto_758274 - PLACE
      ?auto_758279 - HOIST
      ?auto_758277 - SURFACE
      ?auto_758278 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758275 ?auto_758276 ) ( IS-CRATE ?auto_758273 ) ( not ( = ?auto_758272 ?auto_758273 ) ) ( not ( = ?auto_758271 ?auto_758272 ) ) ( not ( = ?auto_758271 ?auto_758273 ) ) ( not ( = ?auto_758274 ?auto_758276 ) ) ( HOIST-AT ?auto_758279 ?auto_758274 ) ( not ( = ?auto_758275 ?auto_758279 ) ) ( AVAILABLE ?auto_758279 ) ( SURFACE-AT ?auto_758273 ?auto_758274 ) ( ON ?auto_758273 ?auto_758277 ) ( CLEAR ?auto_758273 ) ( not ( = ?auto_758272 ?auto_758277 ) ) ( not ( = ?auto_758273 ?auto_758277 ) ) ( not ( = ?auto_758271 ?auto_758277 ) ) ( SURFACE-AT ?auto_758271 ?auto_758276 ) ( CLEAR ?auto_758271 ) ( IS-CRATE ?auto_758272 ) ( AVAILABLE ?auto_758275 ) ( IN ?auto_758272 ?auto_758278 ) ( TRUCK-AT ?auto_758278 ?auto_758274 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_758272 ?auto_758273 )
      ( MAKE-2CRATE-VERIFY ?auto_758271 ?auto_758272 ?auto_758273 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_758280 - SURFACE
      ?auto_758281 - SURFACE
      ?auto_758282 - SURFACE
      ?auto_758283 - SURFACE
    )
    :vars
    (
      ?auto_758288 - HOIST
      ?auto_758289 - PLACE
      ?auto_758286 - PLACE
      ?auto_758284 - HOIST
      ?auto_758287 - SURFACE
      ?auto_758285 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758288 ?auto_758289 ) ( IS-CRATE ?auto_758283 ) ( not ( = ?auto_758282 ?auto_758283 ) ) ( not ( = ?auto_758281 ?auto_758282 ) ) ( not ( = ?auto_758281 ?auto_758283 ) ) ( not ( = ?auto_758286 ?auto_758289 ) ) ( HOIST-AT ?auto_758284 ?auto_758286 ) ( not ( = ?auto_758288 ?auto_758284 ) ) ( AVAILABLE ?auto_758284 ) ( SURFACE-AT ?auto_758283 ?auto_758286 ) ( ON ?auto_758283 ?auto_758287 ) ( CLEAR ?auto_758283 ) ( not ( = ?auto_758282 ?auto_758287 ) ) ( not ( = ?auto_758283 ?auto_758287 ) ) ( not ( = ?auto_758281 ?auto_758287 ) ) ( SURFACE-AT ?auto_758281 ?auto_758289 ) ( CLEAR ?auto_758281 ) ( IS-CRATE ?auto_758282 ) ( AVAILABLE ?auto_758288 ) ( IN ?auto_758282 ?auto_758285 ) ( TRUCK-AT ?auto_758285 ?auto_758286 ) ( ON ?auto_758281 ?auto_758280 ) ( not ( = ?auto_758280 ?auto_758281 ) ) ( not ( = ?auto_758280 ?auto_758282 ) ) ( not ( = ?auto_758280 ?auto_758283 ) ) ( not ( = ?auto_758280 ?auto_758287 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758281 ?auto_758282 ?auto_758283 )
      ( MAKE-3CRATE-VERIFY ?auto_758280 ?auto_758281 ?auto_758282 ?auto_758283 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_758290 - SURFACE
      ?auto_758291 - SURFACE
      ?auto_758292 - SURFACE
      ?auto_758294 - SURFACE
      ?auto_758293 - SURFACE
    )
    :vars
    (
      ?auto_758299 - HOIST
      ?auto_758300 - PLACE
      ?auto_758297 - PLACE
      ?auto_758295 - HOIST
      ?auto_758298 - SURFACE
      ?auto_758296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758299 ?auto_758300 ) ( IS-CRATE ?auto_758293 ) ( not ( = ?auto_758294 ?auto_758293 ) ) ( not ( = ?auto_758292 ?auto_758294 ) ) ( not ( = ?auto_758292 ?auto_758293 ) ) ( not ( = ?auto_758297 ?auto_758300 ) ) ( HOIST-AT ?auto_758295 ?auto_758297 ) ( not ( = ?auto_758299 ?auto_758295 ) ) ( AVAILABLE ?auto_758295 ) ( SURFACE-AT ?auto_758293 ?auto_758297 ) ( ON ?auto_758293 ?auto_758298 ) ( CLEAR ?auto_758293 ) ( not ( = ?auto_758294 ?auto_758298 ) ) ( not ( = ?auto_758293 ?auto_758298 ) ) ( not ( = ?auto_758292 ?auto_758298 ) ) ( SURFACE-AT ?auto_758292 ?auto_758300 ) ( CLEAR ?auto_758292 ) ( IS-CRATE ?auto_758294 ) ( AVAILABLE ?auto_758299 ) ( IN ?auto_758294 ?auto_758296 ) ( TRUCK-AT ?auto_758296 ?auto_758297 ) ( ON ?auto_758291 ?auto_758290 ) ( ON ?auto_758292 ?auto_758291 ) ( not ( = ?auto_758290 ?auto_758291 ) ) ( not ( = ?auto_758290 ?auto_758292 ) ) ( not ( = ?auto_758290 ?auto_758294 ) ) ( not ( = ?auto_758290 ?auto_758293 ) ) ( not ( = ?auto_758290 ?auto_758298 ) ) ( not ( = ?auto_758291 ?auto_758292 ) ) ( not ( = ?auto_758291 ?auto_758294 ) ) ( not ( = ?auto_758291 ?auto_758293 ) ) ( not ( = ?auto_758291 ?auto_758298 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758292 ?auto_758294 ?auto_758293 )
      ( MAKE-4CRATE-VERIFY ?auto_758290 ?auto_758291 ?auto_758292 ?auto_758294 ?auto_758293 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_758301 - SURFACE
      ?auto_758302 - SURFACE
      ?auto_758303 - SURFACE
      ?auto_758305 - SURFACE
      ?auto_758304 - SURFACE
      ?auto_758306 - SURFACE
    )
    :vars
    (
      ?auto_758311 - HOIST
      ?auto_758312 - PLACE
      ?auto_758309 - PLACE
      ?auto_758307 - HOIST
      ?auto_758310 - SURFACE
      ?auto_758308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758311 ?auto_758312 ) ( IS-CRATE ?auto_758306 ) ( not ( = ?auto_758304 ?auto_758306 ) ) ( not ( = ?auto_758305 ?auto_758304 ) ) ( not ( = ?auto_758305 ?auto_758306 ) ) ( not ( = ?auto_758309 ?auto_758312 ) ) ( HOIST-AT ?auto_758307 ?auto_758309 ) ( not ( = ?auto_758311 ?auto_758307 ) ) ( AVAILABLE ?auto_758307 ) ( SURFACE-AT ?auto_758306 ?auto_758309 ) ( ON ?auto_758306 ?auto_758310 ) ( CLEAR ?auto_758306 ) ( not ( = ?auto_758304 ?auto_758310 ) ) ( not ( = ?auto_758306 ?auto_758310 ) ) ( not ( = ?auto_758305 ?auto_758310 ) ) ( SURFACE-AT ?auto_758305 ?auto_758312 ) ( CLEAR ?auto_758305 ) ( IS-CRATE ?auto_758304 ) ( AVAILABLE ?auto_758311 ) ( IN ?auto_758304 ?auto_758308 ) ( TRUCK-AT ?auto_758308 ?auto_758309 ) ( ON ?auto_758302 ?auto_758301 ) ( ON ?auto_758303 ?auto_758302 ) ( ON ?auto_758305 ?auto_758303 ) ( not ( = ?auto_758301 ?auto_758302 ) ) ( not ( = ?auto_758301 ?auto_758303 ) ) ( not ( = ?auto_758301 ?auto_758305 ) ) ( not ( = ?auto_758301 ?auto_758304 ) ) ( not ( = ?auto_758301 ?auto_758306 ) ) ( not ( = ?auto_758301 ?auto_758310 ) ) ( not ( = ?auto_758302 ?auto_758303 ) ) ( not ( = ?auto_758302 ?auto_758305 ) ) ( not ( = ?auto_758302 ?auto_758304 ) ) ( not ( = ?auto_758302 ?auto_758306 ) ) ( not ( = ?auto_758302 ?auto_758310 ) ) ( not ( = ?auto_758303 ?auto_758305 ) ) ( not ( = ?auto_758303 ?auto_758304 ) ) ( not ( = ?auto_758303 ?auto_758306 ) ) ( not ( = ?auto_758303 ?auto_758310 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758305 ?auto_758304 ?auto_758306 )
      ( MAKE-5CRATE-VERIFY ?auto_758301 ?auto_758302 ?auto_758303 ?auto_758305 ?auto_758304 ?auto_758306 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_758313 - SURFACE
      ?auto_758314 - SURFACE
      ?auto_758315 - SURFACE
      ?auto_758317 - SURFACE
      ?auto_758316 - SURFACE
      ?auto_758318 - SURFACE
      ?auto_758319 - SURFACE
    )
    :vars
    (
      ?auto_758324 - HOIST
      ?auto_758325 - PLACE
      ?auto_758322 - PLACE
      ?auto_758320 - HOIST
      ?auto_758323 - SURFACE
      ?auto_758321 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758324 ?auto_758325 ) ( IS-CRATE ?auto_758319 ) ( not ( = ?auto_758318 ?auto_758319 ) ) ( not ( = ?auto_758316 ?auto_758318 ) ) ( not ( = ?auto_758316 ?auto_758319 ) ) ( not ( = ?auto_758322 ?auto_758325 ) ) ( HOIST-AT ?auto_758320 ?auto_758322 ) ( not ( = ?auto_758324 ?auto_758320 ) ) ( AVAILABLE ?auto_758320 ) ( SURFACE-AT ?auto_758319 ?auto_758322 ) ( ON ?auto_758319 ?auto_758323 ) ( CLEAR ?auto_758319 ) ( not ( = ?auto_758318 ?auto_758323 ) ) ( not ( = ?auto_758319 ?auto_758323 ) ) ( not ( = ?auto_758316 ?auto_758323 ) ) ( SURFACE-AT ?auto_758316 ?auto_758325 ) ( CLEAR ?auto_758316 ) ( IS-CRATE ?auto_758318 ) ( AVAILABLE ?auto_758324 ) ( IN ?auto_758318 ?auto_758321 ) ( TRUCK-AT ?auto_758321 ?auto_758322 ) ( ON ?auto_758314 ?auto_758313 ) ( ON ?auto_758315 ?auto_758314 ) ( ON ?auto_758317 ?auto_758315 ) ( ON ?auto_758316 ?auto_758317 ) ( not ( = ?auto_758313 ?auto_758314 ) ) ( not ( = ?auto_758313 ?auto_758315 ) ) ( not ( = ?auto_758313 ?auto_758317 ) ) ( not ( = ?auto_758313 ?auto_758316 ) ) ( not ( = ?auto_758313 ?auto_758318 ) ) ( not ( = ?auto_758313 ?auto_758319 ) ) ( not ( = ?auto_758313 ?auto_758323 ) ) ( not ( = ?auto_758314 ?auto_758315 ) ) ( not ( = ?auto_758314 ?auto_758317 ) ) ( not ( = ?auto_758314 ?auto_758316 ) ) ( not ( = ?auto_758314 ?auto_758318 ) ) ( not ( = ?auto_758314 ?auto_758319 ) ) ( not ( = ?auto_758314 ?auto_758323 ) ) ( not ( = ?auto_758315 ?auto_758317 ) ) ( not ( = ?auto_758315 ?auto_758316 ) ) ( not ( = ?auto_758315 ?auto_758318 ) ) ( not ( = ?auto_758315 ?auto_758319 ) ) ( not ( = ?auto_758315 ?auto_758323 ) ) ( not ( = ?auto_758317 ?auto_758316 ) ) ( not ( = ?auto_758317 ?auto_758318 ) ) ( not ( = ?auto_758317 ?auto_758319 ) ) ( not ( = ?auto_758317 ?auto_758323 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758316 ?auto_758318 ?auto_758319 )
      ( MAKE-6CRATE-VERIFY ?auto_758313 ?auto_758314 ?auto_758315 ?auto_758317 ?auto_758316 ?auto_758318 ?auto_758319 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_758326 - SURFACE
      ?auto_758327 - SURFACE
      ?auto_758328 - SURFACE
      ?auto_758330 - SURFACE
      ?auto_758329 - SURFACE
      ?auto_758331 - SURFACE
      ?auto_758332 - SURFACE
      ?auto_758333 - SURFACE
    )
    :vars
    (
      ?auto_758338 - HOIST
      ?auto_758339 - PLACE
      ?auto_758336 - PLACE
      ?auto_758334 - HOIST
      ?auto_758337 - SURFACE
      ?auto_758335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758338 ?auto_758339 ) ( IS-CRATE ?auto_758333 ) ( not ( = ?auto_758332 ?auto_758333 ) ) ( not ( = ?auto_758331 ?auto_758332 ) ) ( not ( = ?auto_758331 ?auto_758333 ) ) ( not ( = ?auto_758336 ?auto_758339 ) ) ( HOIST-AT ?auto_758334 ?auto_758336 ) ( not ( = ?auto_758338 ?auto_758334 ) ) ( AVAILABLE ?auto_758334 ) ( SURFACE-AT ?auto_758333 ?auto_758336 ) ( ON ?auto_758333 ?auto_758337 ) ( CLEAR ?auto_758333 ) ( not ( = ?auto_758332 ?auto_758337 ) ) ( not ( = ?auto_758333 ?auto_758337 ) ) ( not ( = ?auto_758331 ?auto_758337 ) ) ( SURFACE-AT ?auto_758331 ?auto_758339 ) ( CLEAR ?auto_758331 ) ( IS-CRATE ?auto_758332 ) ( AVAILABLE ?auto_758338 ) ( IN ?auto_758332 ?auto_758335 ) ( TRUCK-AT ?auto_758335 ?auto_758336 ) ( ON ?auto_758327 ?auto_758326 ) ( ON ?auto_758328 ?auto_758327 ) ( ON ?auto_758330 ?auto_758328 ) ( ON ?auto_758329 ?auto_758330 ) ( ON ?auto_758331 ?auto_758329 ) ( not ( = ?auto_758326 ?auto_758327 ) ) ( not ( = ?auto_758326 ?auto_758328 ) ) ( not ( = ?auto_758326 ?auto_758330 ) ) ( not ( = ?auto_758326 ?auto_758329 ) ) ( not ( = ?auto_758326 ?auto_758331 ) ) ( not ( = ?auto_758326 ?auto_758332 ) ) ( not ( = ?auto_758326 ?auto_758333 ) ) ( not ( = ?auto_758326 ?auto_758337 ) ) ( not ( = ?auto_758327 ?auto_758328 ) ) ( not ( = ?auto_758327 ?auto_758330 ) ) ( not ( = ?auto_758327 ?auto_758329 ) ) ( not ( = ?auto_758327 ?auto_758331 ) ) ( not ( = ?auto_758327 ?auto_758332 ) ) ( not ( = ?auto_758327 ?auto_758333 ) ) ( not ( = ?auto_758327 ?auto_758337 ) ) ( not ( = ?auto_758328 ?auto_758330 ) ) ( not ( = ?auto_758328 ?auto_758329 ) ) ( not ( = ?auto_758328 ?auto_758331 ) ) ( not ( = ?auto_758328 ?auto_758332 ) ) ( not ( = ?auto_758328 ?auto_758333 ) ) ( not ( = ?auto_758328 ?auto_758337 ) ) ( not ( = ?auto_758330 ?auto_758329 ) ) ( not ( = ?auto_758330 ?auto_758331 ) ) ( not ( = ?auto_758330 ?auto_758332 ) ) ( not ( = ?auto_758330 ?auto_758333 ) ) ( not ( = ?auto_758330 ?auto_758337 ) ) ( not ( = ?auto_758329 ?auto_758331 ) ) ( not ( = ?auto_758329 ?auto_758332 ) ) ( not ( = ?auto_758329 ?auto_758333 ) ) ( not ( = ?auto_758329 ?auto_758337 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758331 ?auto_758332 ?auto_758333 )
      ( MAKE-7CRATE-VERIFY ?auto_758326 ?auto_758327 ?auto_758328 ?auto_758330 ?auto_758329 ?auto_758331 ?auto_758332 ?auto_758333 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_758340 - SURFACE
      ?auto_758341 - SURFACE
      ?auto_758342 - SURFACE
      ?auto_758344 - SURFACE
      ?auto_758343 - SURFACE
      ?auto_758345 - SURFACE
      ?auto_758346 - SURFACE
      ?auto_758347 - SURFACE
      ?auto_758348 - SURFACE
    )
    :vars
    (
      ?auto_758353 - HOIST
      ?auto_758354 - PLACE
      ?auto_758351 - PLACE
      ?auto_758349 - HOIST
      ?auto_758352 - SURFACE
      ?auto_758350 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758353 ?auto_758354 ) ( IS-CRATE ?auto_758348 ) ( not ( = ?auto_758347 ?auto_758348 ) ) ( not ( = ?auto_758346 ?auto_758347 ) ) ( not ( = ?auto_758346 ?auto_758348 ) ) ( not ( = ?auto_758351 ?auto_758354 ) ) ( HOIST-AT ?auto_758349 ?auto_758351 ) ( not ( = ?auto_758353 ?auto_758349 ) ) ( AVAILABLE ?auto_758349 ) ( SURFACE-AT ?auto_758348 ?auto_758351 ) ( ON ?auto_758348 ?auto_758352 ) ( CLEAR ?auto_758348 ) ( not ( = ?auto_758347 ?auto_758352 ) ) ( not ( = ?auto_758348 ?auto_758352 ) ) ( not ( = ?auto_758346 ?auto_758352 ) ) ( SURFACE-AT ?auto_758346 ?auto_758354 ) ( CLEAR ?auto_758346 ) ( IS-CRATE ?auto_758347 ) ( AVAILABLE ?auto_758353 ) ( IN ?auto_758347 ?auto_758350 ) ( TRUCK-AT ?auto_758350 ?auto_758351 ) ( ON ?auto_758341 ?auto_758340 ) ( ON ?auto_758342 ?auto_758341 ) ( ON ?auto_758344 ?auto_758342 ) ( ON ?auto_758343 ?auto_758344 ) ( ON ?auto_758345 ?auto_758343 ) ( ON ?auto_758346 ?auto_758345 ) ( not ( = ?auto_758340 ?auto_758341 ) ) ( not ( = ?auto_758340 ?auto_758342 ) ) ( not ( = ?auto_758340 ?auto_758344 ) ) ( not ( = ?auto_758340 ?auto_758343 ) ) ( not ( = ?auto_758340 ?auto_758345 ) ) ( not ( = ?auto_758340 ?auto_758346 ) ) ( not ( = ?auto_758340 ?auto_758347 ) ) ( not ( = ?auto_758340 ?auto_758348 ) ) ( not ( = ?auto_758340 ?auto_758352 ) ) ( not ( = ?auto_758341 ?auto_758342 ) ) ( not ( = ?auto_758341 ?auto_758344 ) ) ( not ( = ?auto_758341 ?auto_758343 ) ) ( not ( = ?auto_758341 ?auto_758345 ) ) ( not ( = ?auto_758341 ?auto_758346 ) ) ( not ( = ?auto_758341 ?auto_758347 ) ) ( not ( = ?auto_758341 ?auto_758348 ) ) ( not ( = ?auto_758341 ?auto_758352 ) ) ( not ( = ?auto_758342 ?auto_758344 ) ) ( not ( = ?auto_758342 ?auto_758343 ) ) ( not ( = ?auto_758342 ?auto_758345 ) ) ( not ( = ?auto_758342 ?auto_758346 ) ) ( not ( = ?auto_758342 ?auto_758347 ) ) ( not ( = ?auto_758342 ?auto_758348 ) ) ( not ( = ?auto_758342 ?auto_758352 ) ) ( not ( = ?auto_758344 ?auto_758343 ) ) ( not ( = ?auto_758344 ?auto_758345 ) ) ( not ( = ?auto_758344 ?auto_758346 ) ) ( not ( = ?auto_758344 ?auto_758347 ) ) ( not ( = ?auto_758344 ?auto_758348 ) ) ( not ( = ?auto_758344 ?auto_758352 ) ) ( not ( = ?auto_758343 ?auto_758345 ) ) ( not ( = ?auto_758343 ?auto_758346 ) ) ( not ( = ?auto_758343 ?auto_758347 ) ) ( not ( = ?auto_758343 ?auto_758348 ) ) ( not ( = ?auto_758343 ?auto_758352 ) ) ( not ( = ?auto_758345 ?auto_758346 ) ) ( not ( = ?auto_758345 ?auto_758347 ) ) ( not ( = ?auto_758345 ?auto_758348 ) ) ( not ( = ?auto_758345 ?auto_758352 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758346 ?auto_758347 ?auto_758348 )
      ( MAKE-8CRATE-VERIFY ?auto_758340 ?auto_758341 ?auto_758342 ?auto_758344 ?auto_758343 ?auto_758345 ?auto_758346 ?auto_758347 ?auto_758348 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_758355 - SURFACE
      ?auto_758356 - SURFACE
      ?auto_758357 - SURFACE
      ?auto_758359 - SURFACE
      ?auto_758358 - SURFACE
      ?auto_758360 - SURFACE
      ?auto_758361 - SURFACE
      ?auto_758362 - SURFACE
      ?auto_758363 - SURFACE
      ?auto_758364 - SURFACE
    )
    :vars
    (
      ?auto_758369 - HOIST
      ?auto_758370 - PLACE
      ?auto_758367 - PLACE
      ?auto_758365 - HOIST
      ?auto_758368 - SURFACE
      ?auto_758366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758369 ?auto_758370 ) ( IS-CRATE ?auto_758364 ) ( not ( = ?auto_758363 ?auto_758364 ) ) ( not ( = ?auto_758362 ?auto_758363 ) ) ( not ( = ?auto_758362 ?auto_758364 ) ) ( not ( = ?auto_758367 ?auto_758370 ) ) ( HOIST-AT ?auto_758365 ?auto_758367 ) ( not ( = ?auto_758369 ?auto_758365 ) ) ( AVAILABLE ?auto_758365 ) ( SURFACE-AT ?auto_758364 ?auto_758367 ) ( ON ?auto_758364 ?auto_758368 ) ( CLEAR ?auto_758364 ) ( not ( = ?auto_758363 ?auto_758368 ) ) ( not ( = ?auto_758364 ?auto_758368 ) ) ( not ( = ?auto_758362 ?auto_758368 ) ) ( SURFACE-AT ?auto_758362 ?auto_758370 ) ( CLEAR ?auto_758362 ) ( IS-CRATE ?auto_758363 ) ( AVAILABLE ?auto_758369 ) ( IN ?auto_758363 ?auto_758366 ) ( TRUCK-AT ?auto_758366 ?auto_758367 ) ( ON ?auto_758356 ?auto_758355 ) ( ON ?auto_758357 ?auto_758356 ) ( ON ?auto_758359 ?auto_758357 ) ( ON ?auto_758358 ?auto_758359 ) ( ON ?auto_758360 ?auto_758358 ) ( ON ?auto_758361 ?auto_758360 ) ( ON ?auto_758362 ?auto_758361 ) ( not ( = ?auto_758355 ?auto_758356 ) ) ( not ( = ?auto_758355 ?auto_758357 ) ) ( not ( = ?auto_758355 ?auto_758359 ) ) ( not ( = ?auto_758355 ?auto_758358 ) ) ( not ( = ?auto_758355 ?auto_758360 ) ) ( not ( = ?auto_758355 ?auto_758361 ) ) ( not ( = ?auto_758355 ?auto_758362 ) ) ( not ( = ?auto_758355 ?auto_758363 ) ) ( not ( = ?auto_758355 ?auto_758364 ) ) ( not ( = ?auto_758355 ?auto_758368 ) ) ( not ( = ?auto_758356 ?auto_758357 ) ) ( not ( = ?auto_758356 ?auto_758359 ) ) ( not ( = ?auto_758356 ?auto_758358 ) ) ( not ( = ?auto_758356 ?auto_758360 ) ) ( not ( = ?auto_758356 ?auto_758361 ) ) ( not ( = ?auto_758356 ?auto_758362 ) ) ( not ( = ?auto_758356 ?auto_758363 ) ) ( not ( = ?auto_758356 ?auto_758364 ) ) ( not ( = ?auto_758356 ?auto_758368 ) ) ( not ( = ?auto_758357 ?auto_758359 ) ) ( not ( = ?auto_758357 ?auto_758358 ) ) ( not ( = ?auto_758357 ?auto_758360 ) ) ( not ( = ?auto_758357 ?auto_758361 ) ) ( not ( = ?auto_758357 ?auto_758362 ) ) ( not ( = ?auto_758357 ?auto_758363 ) ) ( not ( = ?auto_758357 ?auto_758364 ) ) ( not ( = ?auto_758357 ?auto_758368 ) ) ( not ( = ?auto_758359 ?auto_758358 ) ) ( not ( = ?auto_758359 ?auto_758360 ) ) ( not ( = ?auto_758359 ?auto_758361 ) ) ( not ( = ?auto_758359 ?auto_758362 ) ) ( not ( = ?auto_758359 ?auto_758363 ) ) ( not ( = ?auto_758359 ?auto_758364 ) ) ( not ( = ?auto_758359 ?auto_758368 ) ) ( not ( = ?auto_758358 ?auto_758360 ) ) ( not ( = ?auto_758358 ?auto_758361 ) ) ( not ( = ?auto_758358 ?auto_758362 ) ) ( not ( = ?auto_758358 ?auto_758363 ) ) ( not ( = ?auto_758358 ?auto_758364 ) ) ( not ( = ?auto_758358 ?auto_758368 ) ) ( not ( = ?auto_758360 ?auto_758361 ) ) ( not ( = ?auto_758360 ?auto_758362 ) ) ( not ( = ?auto_758360 ?auto_758363 ) ) ( not ( = ?auto_758360 ?auto_758364 ) ) ( not ( = ?auto_758360 ?auto_758368 ) ) ( not ( = ?auto_758361 ?auto_758362 ) ) ( not ( = ?auto_758361 ?auto_758363 ) ) ( not ( = ?auto_758361 ?auto_758364 ) ) ( not ( = ?auto_758361 ?auto_758368 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758362 ?auto_758363 ?auto_758364 )
      ( MAKE-9CRATE-VERIFY ?auto_758355 ?auto_758356 ?auto_758357 ?auto_758359 ?auto_758358 ?auto_758360 ?auto_758361 ?auto_758362 ?auto_758363 ?auto_758364 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_758371 - SURFACE
      ?auto_758372 - SURFACE
    )
    :vars
    (
      ?auto_758377 - HOIST
      ?auto_758378 - PLACE
      ?auto_758379 - SURFACE
      ?auto_758375 - PLACE
      ?auto_758373 - HOIST
      ?auto_758376 - SURFACE
      ?auto_758374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758377 ?auto_758378 ) ( IS-CRATE ?auto_758372 ) ( not ( = ?auto_758371 ?auto_758372 ) ) ( not ( = ?auto_758379 ?auto_758371 ) ) ( not ( = ?auto_758379 ?auto_758372 ) ) ( not ( = ?auto_758375 ?auto_758378 ) ) ( HOIST-AT ?auto_758373 ?auto_758375 ) ( not ( = ?auto_758377 ?auto_758373 ) ) ( SURFACE-AT ?auto_758372 ?auto_758375 ) ( ON ?auto_758372 ?auto_758376 ) ( CLEAR ?auto_758372 ) ( not ( = ?auto_758371 ?auto_758376 ) ) ( not ( = ?auto_758372 ?auto_758376 ) ) ( not ( = ?auto_758379 ?auto_758376 ) ) ( SURFACE-AT ?auto_758379 ?auto_758378 ) ( CLEAR ?auto_758379 ) ( IS-CRATE ?auto_758371 ) ( AVAILABLE ?auto_758377 ) ( TRUCK-AT ?auto_758374 ?auto_758375 ) ( LIFTING ?auto_758373 ?auto_758371 ) )
    :subtasks
    ( ( !LOAD ?auto_758373 ?auto_758371 ?auto_758374 ?auto_758375 )
      ( MAKE-2CRATE ?auto_758379 ?auto_758371 ?auto_758372 )
      ( MAKE-1CRATE-VERIFY ?auto_758371 ?auto_758372 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_758380 - SURFACE
      ?auto_758381 - SURFACE
      ?auto_758382 - SURFACE
    )
    :vars
    (
      ?auto_758388 - HOIST
      ?auto_758384 - PLACE
      ?auto_758385 - PLACE
      ?auto_758383 - HOIST
      ?auto_758386 - SURFACE
      ?auto_758387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758388 ?auto_758384 ) ( IS-CRATE ?auto_758382 ) ( not ( = ?auto_758381 ?auto_758382 ) ) ( not ( = ?auto_758380 ?auto_758381 ) ) ( not ( = ?auto_758380 ?auto_758382 ) ) ( not ( = ?auto_758385 ?auto_758384 ) ) ( HOIST-AT ?auto_758383 ?auto_758385 ) ( not ( = ?auto_758388 ?auto_758383 ) ) ( SURFACE-AT ?auto_758382 ?auto_758385 ) ( ON ?auto_758382 ?auto_758386 ) ( CLEAR ?auto_758382 ) ( not ( = ?auto_758381 ?auto_758386 ) ) ( not ( = ?auto_758382 ?auto_758386 ) ) ( not ( = ?auto_758380 ?auto_758386 ) ) ( SURFACE-AT ?auto_758380 ?auto_758384 ) ( CLEAR ?auto_758380 ) ( IS-CRATE ?auto_758381 ) ( AVAILABLE ?auto_758388 ) ( TRUCK-AT ?auto_758387 ?auto_758385 ) ( LIFTING ?auto_758383 ?auto_758381 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_758381 ?auto_758382 )
      ( MAKE-2CRATE-VERIFY ?auto_758380 ?auto_758381 ?auto_758382 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_758389 - SURFACE
      ?auto_758390 - SURFACE
      ?auto_758391 - SURFACE
      ?auto_758392 - SURFACE
    )
    :vars
    (
      ?auto_758393 - HOIST
      ?auto_758394 - PLACE
      ?auto_758395 - PLACE
      ?auto_758398 - HOIST
      ?auto_758396 - SURFACE
      ?auto_758397 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758393 ?auto_758394 ) ( IS-CRATE ?auto_758392 ) ( not ( = ?auto_758391 ?auto_758392 ) ) ( not ( = ?auto_758390 ?auto_758391 ) ) ( not ( = ?auto_758390 ?auto_758392 ) ) ( not ( = ?auto_758395 ?auto_758394 ) ) ( HOIST-AT ?auto_758398 ?auto_758395 ) ( not ( = ?auto_758393 ?auto_758398 ) ) ( SURFACE-AT ?auto_758392 ?auto_758395 ) ( ON ?auto_758392 ?auto_758396 ) ( CLEAR ?auto_758392 ) ( not ( = ?auto_758391 ?auto_758396 ) ) ( not ( = ?auto_758392 ?auto_758396 ) ) ( not ( = ?auto_758390 ?auto_758396 ) ) ( SURFACE-AT ?auto_758390 ?auto_758394 ) ( CLEAR ?auto_758390 ) ( IS-CRATE ?auto_758391 ) ( AVAILABLE ?auto_758393 ) ( TRUCK-AT ?auto_758397 ?auto_758395 ) ( LIFTING ?auto_758398 ?auto_758391 ) ( ON ?auto_758390 ?auto_758389 ) ( not ( = ?auto_758389 ?auto_758390 ) ) ( not ( = ?auto_758389 ?auto_758391 ) ) ( not ( = ?auto_758389 ?auto_758392 ) ) ( not ( = ?auto_758389 ?auto_758396 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758390 ?auto_758391 ?auto_758392 )
      ( MAKE-3CRATE-VERIFY ?auto_758389 ?auto_758390 ?auto_758391 ?auto_758392 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_758399 - SURFACE
      ?auto_758400 - SURFACE
      ?auto_758401 - SURFACE
      ?auto_758403 - SURFACE
      ?auto_758402 - SURFACE
    )
    :vars
    (
      ?auto_758404 - HOIST
      ?auto_758405 - PLACE
      ?auto_758406 - PLACE
      ?auto_758409 - HOIST
      ?auto_758407 - SURFACE
      ?auto_758408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758404 ?auto_758405 ) ( IS-CRATE ?auto_758402 ) ( not ( = ?auto_758403 ?auto_758402 ) ) ( not ( = ?auto_758401 ?auto_758403 ) ) ( not ( = ?auto_758401 ?auto_758402 ) ) ( not ( = ?auto_758406 ?auto_758405 ) ) ( HOIST-AT ?auto_758409 ?auto_758406 ) ( not ( = ?auto_758404 ?auto_758409 ) ) ( SURFACE-AT ?auto_758402 ?auto_758406 ) ( ON ?auto_758402 ?auto_758407 ) ( CLEAR ?auto_758402 ) ( not ( = ?auto_758403 ?auto_758407 ) ) ( not ( = ?auto_758402 ?auto_758407 ) ) ( not ( = ?auto_758401 ?auto_758407 ) ) ( SURFACE-AT ?auto_758401 ?auto_758405 ) ( CLEAR ?auto_758401 ) ( IS-CRATE ?auto_758403 ) ( AVAILABLE ?auto_758404 ) ( TRUCK-AT ?auto_758408 ?auto_758406 ) ( LIFTING ?auto_758409 ?auto_758403 ) ( ON ?auto_758400 ?auto_758399 ) ( ON ?auto_758401 ?auto_758400 ) ( not ( = ?auto_758399 ?auto_758400 ) ) ( not ( = ?auto_758399 ?auto_758401 ) ) ( not ( = ?auto_758399 ?auto_758403 ) ) ( not ( = ?auto_758399 ?auto_758402 ) ) ( not ( = ?auto_758399 ?auto_758407 ) ) ( not ( = ?auto_758400 ?auto_758401 ) ) ( not ( = ?auto_758400 ?auto_758403 ) ) ( not ( = ?auto_758400 ?auto_758402 ) ) ( not ( = ?auto_758400 ?auto_758407 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758401 ?auto_758403 ?auto_758402 )
      ( MAKE-4CRATE-VERIFY ?auto_758399 ?auto_758400 ?auto_758401 ?auto_758403 ?auto_758402 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_758410 - SURFACE
      ?auto_758411 - SURFACE
      ?auto_758412 - SURFACE
      ?auto_758414 - SURFACE
      ?auto_758413 - SURFACE
      ?auto_758415 - SURFACE
    )
    :vars
    (
      ?auto_758416 - HOIST
      ?auto_758417 - PLACE
      ?auto_758418 - PLACE
      ?auto_758421 - HOIST
      ?auto_758419 - SURFACE
      ?auto_758420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758416 ?auto_758417 ) ( IS-CRATE ?auto_758415 ) ( not ( = ?auto_758413 ?auto_758415 ) ) ( not ( = ?auto_758414 ?auto_758413 ) ) ( not ( = ?auto_758414 ?auto_758415 ) ) ( not ( = ?auto_758418 ?auto_758417 ) ) ( HOIST-AT ?auto_758421 ?auto_758418 ) ( not ( = ?auto_758416 ?auto_758421 ) ) ( SURFACE-AT ?auto_758415 ?auto_758418 ) ( ON ?auto_758415 ?auto_758419 ) ( CLEAR ?auto_758415 ) ( not ( = ?auto_758413 ?auto_758419 ) ) ( not ( = ?auto_758415 ?auto_758419 ) ) ( not ( = ?auto_758414 ?auto_758419 ) ) ( SURFACE-AT ?auto_758414 ?auto_758417 ) ( CLEAR ?auto_758414 ) ( IS-CRATE ?auto_758413 ) ( AVAILABLE ?auto_758416 ) ( TRUCK-AT ?auto_758420 ?auto_758418 ) ( LIFTING ?auto_758421 ?auto_758413 ) ( ON ?auto_758411 ?auto_758410 ) ( ON ?auto_758412 ?auto_758411 ) ( ON ?auto_758414 ?auto_758412 ) ( not ( = ?auto_758410 ?auto_758411 ) ) ( not ( = ?auto_758410 ?auto_758412 ) ) ( not ( = ?auto_758410 ?auto_758414 ) ) ( not ( = ?auto_758410 ?auto_758413 ) ) ( not ( = ?auto_758410 ?auto_758415 ) ) ( not ( = ?auto_758410 ?auto_758419 ) ) ( not ( = ?auto_758411 ?auto_758412 ) ) ( not ( = ?auto_758411 ?auto_758414 ) ) ( not ( = ?auto_758411 ?auto_758413 ) ) ( not ( = ?auto_758411 ?auto_758415 ) ) ( not ( = ?auto_758411 ?auto_758419 ) ) ( not ( = ?auto_758412 ?auto_758414 ) ) ( not ( = ?auto_758412 ?auto_758413 ) ) ( not ( = ?auto_758412 ?auto_758415 ) ) ( not ( = ?auto_758412 ?auto_758419 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758414 ?auto_758413 ?auto_758415 )
      ( MAKE-5CRATE-VERIFY ?auto_758410 ?auto_758411 ?auto_758412 ?auto_758414 ?auto_758413 ?auto_758415 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_758422 - SURFACE
      ?auto_758423 - SURFACE
      ?auto_758424 - SURFACE
      ?auto_758426 - SURFACE
      ?auto_758425 - SURFACE
      ?auto_758427 - SURFACE
      ?auto_758428 - SURFACE
    )
    :vars
    (
      ?auto_758429 - HOIST
      ?auto_758430 - PLACE
      ?auto_758431 - PLACE
      ?auto_758434 - HOIST
      ?auto_758432 - SURFACE
      ?auto_758433 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758429 ?auto_758430 ) ( IS-CRATE ?auto_758428 ) ( not ( = ?auto_758427 ?auto_758428 ) ) ( not ( = ?auto_758425 ?auto_758427 ) ) ( not ( = ?auto_758425 ?auto_758428 ) ) ( not ( = ?auto_758431 ?auto_758430 ) ) ( HOIST-AT ?auto_758434 ?auto_758431 ) ( not ( = ?auto_758429 ?auto_758434 ) ) ( SURFACE-AT ?auto_758428 ?auto_758431 ) ( ON ?auto_758428 ?auto_758432 ) ( CLEAR ?auto_758428 ) ( not ( = ?auto_758427 ?auto_758432 ) ) ( not ( = ?auto_758428 ?auto_758432 ) ) ( not ( = ?auto_758425 ?auto_758432 ) ) ( SURFACE-AT ?auto_758425 ?auto_758430 ) ( CLEAR ?auto_758425 ) ( IS-CRATE ?auto_758427 ) ( AVAILABLE ?auto_758429 ) ( TRUCK-AT ?auto_758433 ?auto_758431 ) ( LIFTING ?auto_758434 ?auto_758427 ) ( ON ?auto_758423 ?auto_758422 ) ( ON ?auto_758424 ?auto_758423 ) ( ON ?auto_758426 ?auto_758424 ) ( ON ?auto_758425 ?auto_758426 ) ( not ( = ?auto_758422 ?auto_758423 ) ) ( not ( = ?auto_758422 ?auto_758424 ) ) ( not ( = ?auto_758422 ?auto_758426 ) ) ( not ( = ?auto_758422 ?auto_758425 ) ) ( not ( = ?auto_758422 ?auto_758427 ) ) ( not ( = ?auto_758422 ?auto_758428 ) ) ( not ( = ?auto_758422 ?auto_758432 ) ) ( not ( = ?auto_758423 ?auto_758424 ) ) ( not ( = ?auto_758423 ?auto_758426 ) ) ( not ( = ?auto_758423 ?auto_758425 ) ) ( not ( = ?auto_758423 ?auto_758427 ) ) ( not ( = ?auto_758423 ?auto_758428 ) ) ( not ( = ?auto_758423 ?auto_758432 ) ) ( not ( = ?auto_758424 ?auto_758426 ) ) ( not ( = ?auto_758424 ?auto_758425 ) ) ( not ( = ?auto_758424 ?auto_758427 ) ) ( not ( = ?auto_758424 ?auto_758428 ) ) ( not ( = ?auto_758424 ?auto_758432 ) ) ( not ( = ?auto_758426 ?auto_758425 ) ) ( not ( = ?auto_758426 ?auto_758427 ) ) ( not ( = ?auto_758426 ?auto_758428 ) ) ( not ( = ?auto_758426 ?auto_758432 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758425 ?auto_758427 ?auto_758428 )
      ( MAKE-6CRATE-VERIFY ?auto_758422 ?auto_758423 ?auto_758424 ?auto_758426 ?auto_758425 ?auto_758427 ?auto_758428 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_758435 - SURFACE
      ?auto_758436 - SURFACE
      ?auto_758437 - SURFACE
      ?auto_758439 - SURFACE
      ?auto_758438 - SURFACE
      ?auto_758440 - SURFACE
      ?auto_758441 - SURFACE
      ?auto_758442 - SURFACE
    )
    :vars
    (
      ?auto_758443 - HOIST
      ?auto_758444 - PLACE
      ?auto_758445 - PLACE
      ?auto_758448 - HOIST
      ?auto_758446 - SURFACE
      ?auto_758447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758443 ?auto_758444 ) ( IS-CRATE ?auto_758442 ) ( not ( = ?auto_758441 ?auto_758442 ) ) ( not ( = ?auto_758440 ?auto_758441 ) ) ( not ( = ?auto_758440 ?auto_758442 ) ) ( not ( = ?auto_758445 ?auto_758444 ) ) ( HOIST-AT ?auto_758448 ?auto_758445 ) ( not ( = ?auto_758443 ?auto_758448 ) ) ( SURFACE-AT ?auto_758442 ?auto_758445 ) ( ON ?auto_758442 ?auto_758446 ) ( CLEAR ?auto_758442 ) ( not ( = ?auto_758441 ?auto_758446 ) ) ( not ( = ?auto_758442 ?auto_758446 ) ) ( not ( = ?auto_758440 ?auto_758446 ) ) ( SURFACE-AT ?auto_758440 ?auto_758444 ) ( CLEAR ?auto_758440 ) ( IS-CRATE ?auto_758441 ) ( AVAILABLE ?auto_758443 ) ( TRUCK-AT ?auto_758447 ?auto_758445 ) ( LIFTING ?auto_758448 ?auto_758441 ) ( ON ?auto_758436 ?auto_758435 ) ( ON ?auto_758437 ?auto_758436 ) ( ON ?auto_758439 ?auto_758437 ) ( ON ?auto_758438 ?auto_758439 ) ( ON ?auto_758440 ?auto_758438 ) ( not ( = ?auto_758435 ?auto_758436 ) ) ( not ( = ?auto_758435 ?auto_758437 ) ) ( not ( = ?auto_758435 ?auto_758439 ) ) ( not ( = ?auto_758435 ?auto_758438 ) ) ( not ( = ?auto_758435 ?auto_758440 ) ) ( not ( = ?auto_758435 ?auto_758441 ) ) ( not ( = ?auto_758435 ?auto_758442 ) ) ( not ( = ?auto_758435 ?auto_758446 ) ) ( not ( = ?auto_758436 ?auto_758437 ) ) ( not ( = ?auto_758436 ?auto_758439 ) ) ( not ( = ?auto_758436 ?auto_758438 ) ) ( not ( = ?auto_758436 ?auto_758440 ) ) ( not ( = ?auto_758436 ?auto_758441 ) ) ( not ( = ?auto_758436 ?auto_758442 ) ) ( not ( = ?auto_758436 ?auto_758446 ) ) ( not ( = ?auto_758437 ?auto_758439 ) ) ( not ( = ?auto_758437 ?auto_758438 ) ) ( not ( = ?auto_758437 ?auto_758440 ) ) ( not ( = ?auto_758437 ?auto_758441 ) ) ( not ( = ?auto_758437 ?auto_758442 ) ) ( not ( = ?auto_758437 ?auto_758446 ) ) ( not ( = ?auto_758439 ?auto_758438 ) ) ( not ( = ?auto_758439 ?auto_758440 ) ) ( not ( = ?auto_758439 ?auto_758441 ) ) ( not ( = ?auto_758439 ?auto_758442 ) ) ( not ( = ?auto_758439 ?auto_758446 ) ) ( not ( = ?auto_758438 ?auto_758440 ) ) ( not ( = ?auto_758438 ?auto_758441 ) ) ( not ( = ?auto_758438 ?auto_758442 ) ) ( not ( = ?auto_758438 ?auto_758446 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758440 ?auto_758441 ?auto_758442 )
      ( MAKE-7CRATE-VERIFY ?auto_758435 ?auto_758436 ?auto_758437 ?auto_758439 ?auto_758438 ?auto_758440 ?auto_758441 ?auto_758442 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_758449 - SURFACE
      ?auto_758450 - SURFACE
      ?auto_758451 - SURFACE
      ?auto_758453 - SURFACE
      ?auto_758452 - SURFACE
      ?auto_758454 - SURFACE
      ?auto_758455 - SURFACE
      ?auto_758456 - SURFACE
      ?auto_758457 - SURFACE
    )
    :vars
    (
      ?auto_758458 - HOIST
      ?auto_758459 - PLACE
      ?auto_758460 - PLACE
      ?auto_758463 - HOIST
      ?auto_758461 - SURFACE
      ?auto_758462 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758458 ?auto_758459 ) ( IS-CRATE ?auto_758457 ) ( not ( = ?auto_758456 ?auto_758457 ) ) ( not ( = ?auto_758455 ?auto_758456 ) ) ( not ( = ?auto_758455 ?auto_758457 ) ) ( not ( = ?auto_758460 ?auto_758459 ) ) ( HOIST-AT ?auto_758463 ?auto_758460 ) ( not ( = ?auto_758458 ?auto_758463 ) ) ( SURFACE-AT ?auto_758457 ?auto_758460 ) ( ON ?auto_758457 ?auto_758461 ) ( CLEAR ?auto_758457 ) ( not ( = ?auto_758456 ?auto_758461 ) ) ( not ( = ?auto_758457 ?auto_758461 ) ) ( not ( = ?auto_758455 ?auto_758461 ) ) ( SURFACE-AT ?auto_758455 ?auto_758459 ) ( CLEAR ?auto_758455 ) ( IS-CRATE ?auto_758456 ) ( AVAILABLE ?auto_758458 ) ( TRUCK-AT ?auto_758462 ?auto_758460 ) ( LIFTING ?auto_758463 ?auto_758456 ) ( ON ?auto_758450 ?auto_758449 ) ( ON ?auto_758451 ?auto_758450 ) ( ON ?auto_758453 ?auto_758451 ) ( ON ?auto_758452 ?auto_758453 ) ( ON ?auto_758454 ?auto_758452 ) ( ON ?auto_758455 ?auto_758454 ) ( not ( = ?auto_758449 ?auto_758450 ) ) ( not ( = ?auto_758449 ?auto_758451 ) ) ( not ( = ?auto_758449 ?auto_758453 ) ) ( not ( = ?auto_758449 ?auto_758452 ) ) ( not ( = ?auto_758449 ?auto_758454 ) ) ( not ( = ?auto_758449 ?auto_758455 ) ) ( not ( = ?auto_758449 ?auto_758456 ) ) ( not ( = ?auto_758449 ?auto_758457 ) ) ( not ( = ?auto_758449 ?auto_758461 ) ) ( not ( = ?auto_758450 ?auto_758451 ) ) ( not ( = ?auto_758450 ?auto_758453 ) ) ( not ( = ?auto_758450 ?auto_758452 ) ) ( not ( = ?auto_758450 ?auto_758454 ) ) ( not ( = ?auto_758450 ?auto_758455 ) ) ( not ( = ?auto_758450 ?auto_758456 ) ) ( not ( = ?auto_758450 ?auto_758457 ) ) ( not ( = ?auto_758450 ?auto_758461 ) ) ( not ( = ?auto_758451 ?auto_758453 ) ) ( not ( = ?auto_758451 ?auto_758452 ) ) ( not ( = ?auto_758451 ?auto_758454 ) ) ( not ( = ?auto_758451 ?auto_758455 ) ) ( not ( = ?auto_758451 ?auto_758456 ) ) ( not ( = ?auto_758451 ?auto_758457 ) ) ( not ( = ?auto_758451 ?auto_758461 ) ) ( not ( = ?auto_758453 ?auto_758452 ) ) ( not ( = ?auto_758453 ?auto_758454 ) ) ( not ( = ?auto_758453 ?auto_758455 ) ) ( not ( = ?auto_758453 ?auto_758456 ) ) ( not ( = ?auto_758453 ?auto_758457 ) ) ( not ( = ?auto_758453 ?auto_758461 ) ) ( not ( = ?auto_758452 ?auto_758454 ) ) ( not ( = ?auto_758452 ?auto_758455 ) ) ( not ( = ?auto_758452 ?auto_758456 ) ) ( not ( = ?auto_758452 ?auto_758457 ) ) ( not ( = ?auto_758452 ?auto_758461 ) ) ( not ( = ?auto_758454 ?auto_758455 ) ) ( not ( = ?auto_758454 ?auto_758456 ) ) ( not ( = ?auto_758454 ?auto_758457 ) ) ( not ( = ?auto_758454 ?auto_758461 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758455 ?auto_758456 ?auto_758457 )
      ( MAKE-8CRATE-VERIFY ?auto_758449 ?auto_758450 ?auto_758451 ?auto_758453 ?auto_758452 ?auto_758454 ?auto_758455 ?auto_758456 ?auto_758457 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_758464 - SURFACE
      ?auto_758465 - SURFACE
      ?auto_758466 - SURFACE
      ?auto_758468 - SURFACE
      ?auto_758467 - SURFACE
      ?auto_758469 - SURFACE
      ?auto_758470 - SURFACE
      ?auto_758471 - SURFACE
      ?auto_758472 - SURFACE
      ?auto_758473 - SURFACE
    )
    :vars
    (
      ?auto_758474 - HOIST
      ?auto_758475 - PLACE
      ?auto_758476 - PLACE
      ?auto_758479 - HOIST
      ?auto_758477 - SURFACE
      ?auto_758478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758474 ?auto_758475 ) ( IS-CRATE ?auto_758473 ) ( not ( = ?auto_758472 ?auto_758473 ) ) ( not ( = ?auto_758471 ?auto_758472 ) ) ( not ( = ?auto_758471 ?auto_758473 ) ) ( not ( = ?auto_758476 ?auto_758475 ) ) ( HOIST-AT ?auto_758479 ?auto_758476 ) ( not ( = ?auto_758474 ?auto_758479 ) ) ( SURFACE-AT ?auto_758473 ?auto_758476 ) ( ON ?auto_758473 ?auto_758477 ) ( CLEAR ?auto_758473 ) ( not ( = ?auto_758472 ?auto_758477 ) ) ( not ( = ?auto_758473 ?auto_758477 ) ) ( not ( = ?auto_758471 ?auto_758477 ) ) ( SURFACE-AT ?auto_758471 ?auto_758475 ) ( CLEAR ?auto_758471 ) ( IS-CRATE ?auto_758472 ) ( AVAILABLE ?auto_758474 ) ( TRUCK-AT ?auto_758478 ?auto_758476 ) ( LIFTING ?auto_758479 ?auto_758472 ) ( ON ?auto_758465 ?auto_758464 ) ( ON ?auto_758466 ?auto_758465 ) ( ON ?auto_758468 ?auto_758466 ) ( ON ?auto_758467 ?auto_758468 ) ( ON ?auto_758469 ?auto_758467 ) ( ON ?auto_758470 ?auto_758469 ) ( ON ?auto_758471 ?auto_758470 ) ( not ( = ?auto_758464 ?auto_758465 ) ) ( not ( = ?auto_758464 ?auto_758466 ) ) ( not ( = ?auto_758464 ?auto_758468 ) ) ( not ( = ?auto_758464 ?auto_758467 ) ) ( not ( = ?auto_758464 ?auto_758469 ) ) ( not ( = ?auto_758464 ?auto_758470 ) ) ( not ( = ?auto_758464 ?auto_758471 ) ) ( not ( = ?auto_758464 ?auto_758472 ) ) ( not ( = ?auto_758464 ?auto_758473 ) ) ( not ( = ?auto_758464 ?auto_758477 ) ) ( not ( = ?auto_758465 ?auto_758466 ) ) ( not ( = ?auto_758465 ?auto_758468 ) ) ( not ( = ?auto_758465 ?auto_758467 ) ) ( not ( = ?auto_758465 ?auto_758469 ) ) ( not ( = ?auto_758465 ?auto_758470 ) ) ( not ( = ?auto_758465 ?auto_758471 ) ) ( not ( = ?auto_758465 ?auto_758472 ) ) ( not ( = ?auto_758465 ?auto_758473 ) ) ( not ( = ?auto_758465 ?auto_758477 ) ) ( not ( = ?auto_758466 ?auto_758468 ) ) ( not ( = ?auto_758466 ?auto_758467 ) ) ( not ( = ?auto_758466 ?auto_758469 ) ) ( not ( = ?auto_758466 ?auto_758470 ) ) ( not ( = ?auto_758466 ?auto_758471 ) ) ( not ( = ?auto_758466 ?auto_758472 ) ) ( not ( = ?auto_758466 ?auto_758473 ) ) ( not ( = ?auto_758466 ?auto_758477 ) ) ( not ( = ?auto_758468 ?auto_758467 ) ) ( not ( = ?auto_758468 ?auto_758469 ) ) ( not ( = ?auto_758468 ?auto_758470 ) ) ( not ( = ?auto_758468 ?auto_758471 ) ) ( not ( = ?auto_758468 ?auto_758472 ) ) ( not ( = ?auto_758468 ?auto_758473 ) ) ( not ( = ?auto_758468 ?auto_758477 ) ) ( not ( = ?auto_758467 ?auto_758469 ) ) ( not ( = ?auto_758467 ?auto_758470 ) ) ( not ( = ?auto_758467 ?auto_758471 ) ) ( not ( = ?auto_758467 ?auto_758472 ) ) ( not ( = ?auto_758467 ?auto_758473 ) ) ( not ( = ?auto_758467 ?auto_758477 ) ) ( not ( = ?auto_758469 ?auto_758470 ) ) ( not ( = ?auto_758469 ?auto_758471 ) ) ( not ( = ?auto_758469 ?auto_758472 ) ) ( not ( = ?auto_758469 ?auto_758473 ) ) ( not ( = ?auto_758469 ?auto_758477 ) ) ( not ( = ?auto_758470 ?auto_758471 ) ) ( not ( = ?auto_758470 ?auto_758472 ) ) ( not ( = ?auto_758470 ?auto_758473 ) ) ( not ( = ?auto_758470 ?auto_758477 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758471 ?auto_758472 ?auto_758473 )
      ( MAKE-9CRATE-VERIFY ?auto_758464 ?auto_758465 ?auto_758466 ?auto_758468 ?auto_758467 ?auto_758469 ?auto_758470 ?auto_758471 ?auto_758472 ?auto_758473 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_758480 - SURFACE
      ?auto_758481 - SURFACE
    )
    :vars
    (
      ?auto_758483 - HOIST
      ?auto_758484 - PLACE
      ?auto_758482 - SURFACE
      ?auto_758485 - PLACE
      ?auto_758488 - HOIST
      ?auto_758486 - SURFACE
      ?auto_758487 - TRUCK
      ?auto_758489 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_758483 ?auto_758484 ) ( IS-CRATE ?auto_758481 ) ( not ( = ?auto_758480 ?auto_758481 ) ) ( not ( = ?auto_758482 ?auto_758480 ) ) ( not ( = ?auto_758482 ?auto_758481 ) ) ( not ( = ?auto_758485 ?auto_758484 ) ) ( HOIST-AT ?auto_758488 ?auto_758485 ) ( not ( = ?auto_758483 ?auto_758488 ) ) ( SURFACE-AT ?auto_758481 ?auto_758485 ) ( ON ?auto_758481 ?auto_758486 ) ( CLEAR ?auto_758481 ) ( not ( = ?auto_758480 ?auto_758486 ) ) ( not ( = ?auto_758481 ?auto_758486 ) ) ( not ( = ?auto_758482 ?auto_758486 ) ) ( SURFACE-AT ?auto_758482 ?auto_758484 ) ( CLEAR ?auto_758482 ) ( IS-CRATE ?auto_758480 ) ( AVAILABLE ?auto_758483 ) ( TRUCK-AT ?auto_758487 ?auto_758485 ) ( AVAILABLE ?auto_758488 ) ( SURFACE-AT ?auto_758480 ?auto_758485 ) ( ON ?auto_758480 ?auto_758489 ) ( CLEAR ?auto_758480 ) ( not ( = ?auto_758480 ?auto_758489 ) ) ( not ( = ?auto_758481 ?auto_758489 ) ) ( not ( = ?auto_758482 ?auto_758489 ) ) ( not ( = ?auto_758486 ?auto_758489 ) ) )
    :subtasks
    ( ( !LIFT ?auto_758488 ?auto_758480 ?auto_758489 ?auto_758485 )
      ( MAKE-2CRATE ?auto_758482 ?auto_758480 ?auto_758481 )
      ( MAKE-1CRATE-VERIFY ?auto_758480 ?auto_758481 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_758490 - SURFACE
      ?auto_758491 - SURFACE
      ?auto_758492 - SURFACE
    )
    :vars
    (
      ?auto_758493 - HOIST
      ?auto_758498 - PLACE
      ?auto_758497 - PLACE
      ?auto_758499 - HOIST
      ?auto_758495 - SURFACE
      ?auto_758496 - TRUCK
      ?auto_758494 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_758493 ?auto_758498 ) ( IS-CRATE ?auto_758492 ) ( not ( = ?auto_758491 ?auto_758492 ) ) ( not ( = ?auto_758490 ?auto_758491 ) ) ( not ( = ?auto_758490 ?auto_758492 ) ) ( not ( = ?auto_758497 ?auto_758498 ) ) ( HOIST-AT ?auto_758499 ?auto_758497 ) ( not ( = ?auto_758493 ?auto_758499 ) ) ( SURFACE-AT ?auto_758492 ?auto_758497 ) ( ON ?auto_758492 ?auto_758495 ) ( CLEAR ?auto_758492 ) ( not ( = ?auto_758491 ?auto_758495 ) ) ( not ( = ?auto_758492 ?auto_758495 ) ) ( not ( = ?auto_758490 ?auto_758495 ) ) ( SURFACE-AT ?auto_758490 ?auto_758498 ) ( CLEAR ?auto_758490 ) ( IS-CRATE ?auto_758491 ) ( AVAILABLE ?auto_758493 ) ( TRUCK-AT ?auto_758496 ?auto_758497 ) ( AVAILABLE ?auto_758499 ) ( SURFACE-AT ?auto_758491 ?auto_758497 ) ( ON ?auto_758491 ?auto_758494 ) ( CLEAR ?auto_758491 ) ( not ( = ?auto_758491 ?auto_758494 ) ) ( not ( = ?auto_758492 ?auto_758494 ) ) ( not ( = ?auto_758490 ?auto_758494 ) ) ( not ( = ?auto_758495 ?auto_758494 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_758491 ?auto_758492 )
      ( MAKE-2CRATE-VERIFY ?auto_758490 ?auto_758491 ?auto_758492 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_758500 - SURFACE
      ?auto_758501 - SURFACE
      ?auto_758502 - SURFACE
      ?auto_758503 - SURFACE
    )
    :vars
    (
      ?auto_758505 - HOIST
      ?auto_758507 - PLACE
      ?auto_758504 - PLACE
      ?auto_758510 - HOIST
      ?auto_758509 - SURFACE
      ?auto_758508 - TRUCK
      ?auto_758506 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_758505 ?auto_758507 ) ( IS-CRATE ?auto_758503 ) ( not ( = ?auto_758502 ?auto_758503 ) ) ( not ( = ?auto_758501 ?auto_758502 ) ) ( not ( = ?auto_758501 ?auto_758503 ) ) ( not ( = ?auto_758504 ?auto_758507 ) ) ( HOIST-AT ?auto_758510 ?auto_758504 ) ( not ( = ?auto_758505 ?auto_758510 ) ) ( SURFACE-AT ?auto_758503 ?auto_758504 ) ( ON ?auto_758503 ?auto_758509 ) ( CLEAR ?auto_758503 ) ( not ( = ?auto_758502 ?auto_758509 ) ) ( not ( = ?auto_758503 ?auto_758509 ) ) ( not ( = ?auto_758501 ?auto_758509 ) ) ( SURFACE-AT ?auto_758501 ?auto_758507 ) ( CLEAR ?auto_758501 ) ( IS-CRATE ?auto_758502 ) ( AVAILABLE ?auto_758505 ) ( TRUCK-AT ?auto_758508 ?auto_758504 ) ( AVAILABLE ?auto_758510 ) ( SURFACE-AT ?auto_758502 ?auto_758504 ) ( ON ?auto_758502 ?auto_758506 ) ( CLEAR ?auto_758502 ) ( not ( = ?auto_758502 ?auto_758506 ) ) ( not ( = ?auto_758503 ?auto_758506 ) ) ( not ( = ?auto_758501 ?auto_758506 ) ) ( not ( = ?auto_758509 ?auto_758506 ) ) ( ON ?auto_758501 ?auto_758500 ) ( not ( = ?auto_758500 ?auto_758501 ) ) ( not ( = ?auto_758500 ?auto_758502 ) ) ( not ( = ?auto_758500 ?auto_758503 ) ) ( not ( = ?auto_758500 ?auto_758509 ) ) ( not ( = ?auto_758500 ?auto_758506 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758501 ?auto_758502 ?auto_758503 )
      ( MAKE-3CRATE-VERIFY ?auto_758500 ?auto_758501 ?auto_758502 ?auto_758503 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_758511 - SURFACE
      ?auto_758512 - SURFACE
      ?auto_758513 - SURFACE
      ?auto_758515 - SURFACE
      ?auto_758514 - SURFACE
    )
    :vars
    (
      ?auto_758517 - HOIST
      ?auto_758519 - PLACE
      ?auto_758516 - PLACE
      ?auto_758522 - HOIST
      ?auto_758521 - SURFACE
      ?auto_758520 - TRUCK
      ?auto_758518 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_758517 ?auto_758519 ) ( IS-CRATE ?auto_758514 ) ( not ( = ?auto_758515 ?auto_758514 ) ) ( not ( = ?auto_758513 ?auto_758515 ) ) ( not ( = ?auto_758513 ?auto_758514 ) ) ( not ( = ?auto_758516 ?auto_758519 ) ) ( HOIST-AT ?auto_758522 ?auto_758516 ) ( not ( = ?auto_758517 ?auto_758522 ) ) ( SURFACE-AT ?auto_758514 ?auto_758516 ) ( ON ?auto_758514 ?auto_758521 ) ( CLEAR ?auto_758514 ) ( not ( = ?auto_758515 ?auto_758521 ) ) ( not ( = ?auto_758514 ?auto_758521 ) ) ( not ( = ?auto_758513 ?auto_758521 ) ) ( SURFACE-AT ?auto_758513 ?auto_758519 ) ( CLEAR ?auto_758513 ) ( IS-CRATE ?auto_758515 ) ( AVAILABLE ?auto_758517 ) ( TRUCK-AT ?auto_758520 ?auto_758516 ) ( AVAILABLE ?auto_758522 ) ( SURFACE-AT ?auto_758515 ?auto_758516 ) ( ON ?auto_758515 ?auto_758518 ) ( CLEAR ?auto_758515 ) ( not ( = ?auto_758515 ?auto_758518 ) ) ( not ( = ?auto_758514 ?auto_758518 ) ) ( not ( = ?auto_758513 ?auto_758518 ) ) ( not ( = ?auto_758521 ?auto_758518 ) ) ( ON ?auto_758512 ?auto_758511 ) ( ON ?auto_758513 ?auto_758512 ) ( not ( = ?auto_758511 ?auto_758512 ) ) ( not ( = ?auto_758511 ?auto_758513 ) ) ( not ( = ?auto_758511 ?auto_758515 ) ) ( not ( = ?auto_758511 ?auto_758514 ) ) ( not ( = ?auto_758511 ?auto_758521 ) ) ( not ( = ?auto_758511 ?auto_758518 ) ) ( not ( = ?auto_758512 ?auto_758513 ) ) ( not ( = ?auto_758512 ?auto_758515 ) ) ( not ( = ?auto_758512 ?auto_758514 ) ) ( not ( = ?auto_758512 ?auto_758521 ) ) ( not ( = ?auto_758512 ?auto_758518 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758513 ?auto_758515 ?auto_758514 )
      ( MAKE-4CRATE-VERIFY ?auto_758511 ?auto_758512 ?auto_758513 ?auto_758515 ?auto_758514 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_758523 - SURFACE
      ?auto_758524 - SURFACE
      ?auto_758525 - SURFACE
      ?auto_758527 - SURFACE
      ?auto_758526 - SURFACE
      ?auto_758528 - SURFACE
    )
    :vars
    (
      ?auto_758530 - HOIST
      ?auto_758532 - PLACE
      ?auto_758529 - PLACE
      ?auto_758535 - HOIST
      ?auto_758534 - SURFACE
      ?auto_758533 - TRUCK
      ?auto_758531 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_758530 ?auto_758532 ) ( IS-CRATE ?auto_758528 ) ( not ( = ?auto_758526 ?auto_758528 ) ) ( not ( = ?auto_758527 ?auto_758526 ) ) ( not ( = ?auto_758527 ?auto_758528 ) ) ( not ( = ?auto_758529 ?auto_758532 ) ) ( HOIST-AT ?auto_758535 ?auto_758529 ) ( not ( = ?auto_758530 ?auto_758535 ) ) ( SURFACE-AT ?auto_758528 ?auto_758529 ) ( ON ?auto_758528 ?auto_758534 ) ( CLEAR ?auto_758528 ) ( not ( = ?auto_758526 ?auto_758534 ) ) ( not ( = ?auto_758528 ?auto_758534 ) ) ( not ( = ?auto_758527 ?auto_758534 ) ) ( SURFACE-AT ?auto_758527 ?auto_758532 ) ( CLEAR ?auto_758527 ) ( IS-CRATE ?auto_758526 ) ( AVAILABLE ?auto_758530 ) ( TRUCK-AT ?auto_758533 ?auto_758529 ) ( AVAILABLE ?auto_758535 ) ( SURFACE-AT ?auto_758526 ?auto_758529 ) ( ON ?auto_758526 ?auto_758531 ) ( CLEAR ?auto_758526 ) ( not ( = ?auto_758526 ?auto_758531 ) ) ( not ( = ?auto_758528 ?auto_758531 ) ) ( not ( = ?auto_758527 ?auto_758531 ) ) ( not ( = ?auto_758534 ?auto_758531 ) ) ( ON ?auto_758524 ?auto_758523 ) ( ON ?auto_758525 ?auto_758524 ) ( ON ?auto_758527 ?auto_758525 ) ( not ( = ?auto_758523 ?auto_758524 ) ) ( not ( = ?auto_758523 ?auto_758525 ) ) ( not ( = ?auto_758523 ?auto_758527 ) ) ( not ( = ?auto_758523 ?auto_758526 ) ) ( not ( = ?auto_758523 ?auto_758528 ) ) ( not ( = ?auto_758523 ?auto_758534 ) ) ( not ( = ?auto_758523 ?auto_758531 ) ) ( not ( = ?auto_758524 ?auto_758525 ) ) ( not ( = ?auto_758524 ?auto_758527 ) ) ( not ( = ?auto_758524 ?auto_758526 ) ) ( not ( = ?auto_758524 ?auto_758528 ) ) ( not ( = ?auto_758524 ?auto_758534 ) ) ( not ( = ?auto_758524 ?auto_758531 ) ) ( not ( = ?auto_758525 ?auto_758527 ) ) ( not ( = ?auto_758525 ?auto_758526 ) ) ( not ( = ?auto_758525 ?auto_758528 ) ) ( not ( = ?auto_758525 ?auto_758534 ) ) ( not ( = ?auto_758525 ?auto_758531 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758527 ?auto_758526 ?auto_758528 )
      ( MAKE-5CRATE-VERIFY ?auto_758523 ?auto_758524 ?auto_758525 ?auto_758527 ?auto_758526 ?auto_758528 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_758536 - SURFACE
      ?auto_758537 - SURFACE
      ?auto_758538 - SURFACE
      ?auto_758540 - SURFACE
      ?auto_758539 - SURFACE
      ?auto_758541 - SURFACE
      ?auto_758542 - SURFACE
    )
    :vars
    (
      ?auto_758544 - HOIST
      ?auto_758546 - PLACE
      ?auto_758543 - PLACE
      ?auto_758549 - HOIST
      ?auto_758548 - SURFACE
      ?auto_758547 - TRUCK
      ?auto_758545 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_758544 ?auto_758546 ) ( IS-CRATE ?auto_758542 ) ( not ( = ?auto_758541 ?auto_758542 ) ) ( not ( = ?auto_758539 ?auto_758541 ) ) ( not ( = ?auto_758539 ?auto_758542 ) ) ( not ( = ?auto_758543 ?auto_758546 ) ) ( HOIST-AT ?auto_758549 ?auto_758543 ) ( not ( = ?auto_758544 ?auto_758549 ) ) ( SURFACE-AT ?auto_758542 ?auto_758543 ) ( ON ?auto_758542 ?auto_758548 ) ( CLEAR ?auto_758542 ) ( not ( = ?auto_758541 ?auto_758548 ) ) ( not ( = ?auto_758542 ?auto_758548 ) ) ( not ( = ?auto_758539 ?auto_758548 ) ) ( SURFACE-AT ?auto_758539 ?auto_758546 ) ( CLEAR ?auto_758539 ) ( IS-CRATE ?auto_758541 ) ( AVAILABLE ?auto_758544 ) ( TRUCK-AT ?auto_758547 ?auto_758543 ) ( AVAILABLE ?auto_758549 ) ( SURFACE-AT ?auto_758541 ?auto_758543 ) ( ON ?auto_758541 ?auto_758545 ) ( CLEAR ?auto_758541 ) ( not ( = ?auto_758541 ?auto_758545 ) ) ( not ( = ?auto_758542 ?auto_758545 ) ) ( not ( = ?auto_758539 ?auto_758545 ) ) ( not ( = ?auto_758548 ?auto_758545 ) ) ( ON ?auto_758537 ?auto_758536 ) ( ON ?auto_758538 ?auto_758537 ) ( ON ?auto_758540 ?auto_758538 ) ( ON ?auto_758539 ?auto_758540 ) ( not ( = ?auto_758536 ?auto_758537 ) ) ( not ( = ?auto_758536 ?auto_758538 ) ) ( not ( = ?auto_758536 ?auto_758540 ) ) ( not ( = ?auto_758536 ?auto_758539 ) ) ( not ( = ?auto_758536 ?auto_758541 ) ) ( not ( = ?auto_758536 ?auto_758542 ) ) ( not ( = ?auto_758536 ?auto_758548 ) ) ( not ( = ?auto_758536 ?auto_758545 ) ) ( not ( = ?auto_758537 ?auto_758538 ) ) ( not ( = ?auto_758537 ?auto_758540 ) ) ( not ( = ?auto_758537 ?auto_758539 ) ) ( not ( = ?auto_758537 ?auto_758541 ) ) ( not ( = ?auto_758537 ?auto_758542 ) ) ( not ( = ?auto_758537 ?auto_758548 ) ) ( not ( = ?auto_758537 ?auto_758545 ) ) ( not ( = ?auto_758538 ?auto_758540 ) ) ( not ( = ?auto_758538 ?auto_758539 ) ) ( not ( = ?auto_758538 ?auto_758541 ) ) ( not ( = ?auto_758538 ?auto_758542 ) ) ( not ( = ?auto_758538 ?auto_758548 ) ) ( not ( = ?auto_758538 ?auto_758545 ) ) ( not ( = ?auto_758540 ?auto_758539 ) ) ( not ( = ?auto_758540 ?auto_758541 ) ) ( not ( = ?auto_758540 ?auto_758542 ) ) ( not ( = ?auto_758540 ?auto_758548 ) ) ( not ( = ?auto_758540 ?auto_758545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758539 ?auto_758541 ?auto_758542 )
      ( MAKE-6CRATE-VERIFY ?auto_758536 ?auto_758537 ?auto_758538 ?auto_758540 ?auto_758539 ?auto_758541 ?auto_758542 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_758550 - SURFACE
      ?auto_758551 - SURFACE
      ?auto_758552 - SURFACE
      ?auto_758554 - SURFACE
      ?auto_758553 - SURFACE
      ?auto_758555 - SURFACE
      ?auto_758556 - SURFACE
      ?auto_758557 - SURFACE
    )
    :vars
    (
      ?auto_758559 - HOIST
      ?auto_758561 - PLACE
      ?auto_758558 - PLACE
      ?auto_758564 - HOIST
      ?auto_758563 - SURFACE
      ?auto_758562 - TRUCK
      ?auto_758560 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_758559 ?auto_758561 ) ( IS-CRATE ?auto_758557 ) ( not ( = ?auto_758556 ?auto_758557 ) ) ( not ( = ?auto_758555 ?auto_758556 ) ) ( not ( = ?auto_758555 ?auto_758557 ) ) ( not ( = ?auto_758558 ?auto_758561 ) ) ( HOIST-AT ?auto_758564 ?auto_758558 ) ( not ( = ?auto_758559 ?auto_758564 ) ) ( SURFACE-AT ?auto_758557 ?auto_758558 ) ( ON ?auto_758557 ?auto_758563 ) ( CLEAR ?auto_758557 ) ( not ( = ?auto_758556 ?auto_758563 ) ) ( not ( = ?auto_758557 ?auto_758563 ) ) ( not ( = ?auto_758555 ?auto_758563 ) ) ( SURFACE-AT ?auto_758555 ?auto_758561 ) ( CLEAR ?auto_758555 ) ( IS-CRATE ?auto_758556 ) ( AVAILABLE ?auto_758559 ) ( TRUCK-AT ?auto_758562 ?auto_758558 ) ( AVAILABLE ?auto_758564 ) ( SURFACE-AT ?auto_758556 ?auto_758558 ) ( ON ?auto_758556 ?auto_758560 ) ( CLEAR ?auto_758556 ) ( not ( = ?auto_758556 ?auto_758560 ) ) ( not ( = ?auto_758557 ?auto_758560 ) ) ( not ( = ?auto_758555 ?auto_758560 ) ) ( not ( = ?auto_758563 ?auto_758560 ) ) ( ON ?auto_758551 ?auto_758550 ) ( ON ?auto_758552 ?auto_758551 ) ( ON ?auto_758554 ?auto_758552 ) ( ON ?auto_758553 ?auto_758554 ) ( ON ?auto_758555 ?auto_758553 ) ( not ( = ?auto_758550 ?auto_758551 ) ) ( not ( = ?auto_758550 ?auto_758552 ) ) ( not ( = ?auto_758550 ?auto_758554 ) ) ( not ( = ?auto_758550 ?auto_758553 ) ) ( not ( = ?auto_758550 ?auto_758555 ) ) ( not ( = ?auto_758550 ?auto_758556 ) ) ( not ( = ?auto_758550 ?auto_758557 ) ) ( not ( = ?auto_758550 ?auto_758563 ) ) ( not ( = ?auto_758550 ?auto_758560 ) ) ( not ( = ?auto_758551 ?auto_758552 ) ) ( not ( = ?auto_758551 ?auto_758554 ) ) ( not ( = ?auto_758551 ?auto_758553 ) ) ( not ( = ?auto_758551 ?auto_758555 ) ) ( not ( = ?auto_758551 ?auto_758556 ) ) ( not ( = ?auto_758551 ?auto_758557 ) ) ( not ( = ?auto_758551 ?auto_758563 ) ) ( not ( = ?auto_758551 ?auto_758560 ) ) ( not ( = ?auto_758552 ?auto_758554 ) ) ( not ( = ?auto_758552 ?auto_758553 ) ) ( not ( = ?auto_758552 ?auto_758555 ) ) ( not ( = ?auto_758552 ?auto_758556 ) ) ( not ( = ?auto_758552 ?auto_758557 ) ) ( not ( = ?auto_758552 ?auto_758563 ) ) ( not ( = ?auto_758552 ?auto_758560 ) ) ( not ( = ?auto_758554 ?auto_758553 ) ) ( not ( = ?auto_758554 ?auto_758555 ) ) ( not ( = ?auto_758554 ?auto_758556 ) ) ( not ( = ?auto_758554 ?auto_758557 ) ) ( not ( = ?auto_758554 ?auto_758563 ) ) ( not ( = ?auto_758554 ?auto_758560 ) ) ( not ( = ?auto_758553 ?auto_758555 ) ) ( not ( = ?auto_758553 ?auto_758556 ) ) ( not ( = ?auto_758553 ?auto_758557 ) ) ( not ( = ?auto_758553 ?auto_758563 ) ) ( not ( = ?auto_758553 ?auto_758560 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758555 ?auto_758556 ?auto_758557 )
      ( MAKE-7CRATE-VERIFY ?auto_758550 ?auto_758551 ?auto_758552 ?auto_758554 ?auto_758553 ?auto_758555 ?auto_758556 ?auto_758557 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_758565 - SURFACE
      ?auto_758566 - SURFACE
      ?auto_758567 - SURFACE
      ?auto_758569 - SURFACE
      ?auto_758568 - SURFACE
      ?auto_758570 - SURFACE
      ?auto_758571 - SURFACE
      ?auto_758572 - SURFACE
      ?auto_758573 - SURFACE
    )
    :vars
    (
      ?auto_758575 - HOIST
      ?auto_758577 - PLACE
      ?auto_758574 - PLACE
      ?auto_758580 - HOIST
      ?auto_758579 - SURFACE
      ?auto_758578 - TRUCK
      ?auto_758576 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_758575 ?auto_758577 ) ( IS-CRATE ?auto_758573 ) ( not ( = ?auto_758572 ?auto_758573 ) ) ( not ( = ?auto_758571 ?auto_758572 ) ) ( not ( = ?auto_758571 ?auto_758573 ) ) ( not ( = ?auto_758574 ?auto_758577 ) ) ( HOIST-AT ?auto_758580 ?auto_758574 ) ( not ( = ?auto_758575 ?auto_758580 ) ) ( SURFACE-AT ?auto_758573 ?auto_758574 ) ( ON ?auto_758573 ?auto_758579 ) ( CLEAR ?auto_758573 ) ( not ( = ?auto_758572 ?auto_758579 ) ) ( not ( = ?auto_758573 ?auto_758579 ) ) ( not ( = ?auto_758571 ?auto_758579 ) ) ( SURFACE-AT ?auto_758571 ?auto_758577 ) ( CLEAR ?auto_758571 ) ( IS-CRATE ?auto_758572 ) ( AVAILABLE ?auto_758575 ) ( TRUCK-AT ?auto_758578 ?auto_758574 ) ( AVAILABLE ?auto_758580 ) ( SURFACE-AT ?auto_758572 ?auto_758574 ) ( ON ?auto_758572 ?auto_758576 ) ( CLEAR ?auto_758572 ) ( not ( = ?auto_758572 ?auto_758576 ) ) ( not ( = ?auto_758573 ?auto_758576 ) ) ( not ( = ?auto_758571 ?auto_758576 ) ) ( not ( = ?auto_758579 ?auto_758576 ) ) ( ON ?auto_758566 ?auto_758565 ) ( ON ?auto_758567 ?auto_758566 ) ( ON ?auto_758569 ?auto_758567 ) ( ON ?auto_758568 ?auto_758569 ) ( ON ?auto_758570 ?auto_758568 ) ( ON ?auto_758571 ?auto_758570 ) ( not ( = ?auto_758565 ?auto_758566 ) ) ( not ( = ?auto_758565 ?auto_758567 ) ) ( not ( = ?auto_758565 ?auto_758569 ) ) ( not ( = ?auto_758565 ?auto_758568 ) ) ( not ( = ?auto_758565 ?auto_758570 ) ) ( not ( = ?auto_758565 ?auto_758571 ) ) ( not ( = ?auto_758565 ?auto_758572 ) ) ( not ( = ?auto_758565 ?auto_758573 ) ) ( not ( = ?auto_758565 ?auto_758579 ) ) ( not ( = ?auto_758565 ?auto_758576 ) ) ( not ( = ?auto_758566 ?auto_758567 ) ) ( not ( = ?auto_758566 ?auto_758569 ) ) ( not ( = ?auto_758566 ?auto_758568 ) ) ( not ( = ?auto_758566 ?auto_758570 ) ) ( not ( = ?auto_758566 ?auto_758571 ) ) ( not ( = ?auto_758566 ?auto_758572 ) ) ( not ( = ?auto_758566 ?auto_758573 ) ) ( not ( = ?auto_758566 ?auto_758579 ) ) ( not ( = ?auto_758566 ?auto_758576 ) ) ( not ( = ?auto_758567 ?auto_758569 ) ) ( not ( = ?auto_758567 ?auto_758568 ) ) ( not ( = ?auto_758567 ?auto_758570 ) ) ( not ( = ?auto_758567 ?auto_758571 ) ) ( not ( = ?auto_758567 ?auto_758572 ) ) ( not ( = ?auto_758567 ?auto_758573 ) ) ( not ( = ?auto_758567 ?auto_758579 ) ) ( not ( = ?auto_758567 ?auto_758576 ) ) ( not ( = ?auto_758569 ?auto_758568 ) ) ( not ( = ?auto_758569 ?auto_758570 ) ) ( not ( = ?auto_758569 ?auto_758571 ) ) ( not ( = ?auto_758569 ?auto_758572 ) ) ( not ( = ?auto_758569 ?auto_758573 ) ) ( not ( = ?auto_758569 ?auto_758579 ) ) ( not ( = ?auto_758569 ?auto_758576 ) ) ( not ( = ?auto_758568 ?auto_758570 ) ) ( not ( = ?auto_758568 ?auto_758571 ) ) ( not ( = ?auto_758568 ?auto_758572 ) ) ( not ( = ?auto_758568 ?auto_758573 ) ) ( not ( = ?auto_758568 ?auto_758579 ) ) ( not ( = ?auto_758568 ?auto_758576 ) ) ( not ( = ?auto_758570 ?auto_758571 ) ) ( not ( = ?auto_758570 ?auto_758572 ) ) ( not ( = ?auto_758570 ?auto_758573 ) ) ( not ( = ?auto_758570 ?auto_758579 ) ) ( not ( = ?auto_758570 ?auto_758576 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758571 ?auto_758572 ?auto_758573 )
      ( MAKE-8CRATE-VERIFY ?auto_758565 ?auto_758566 ?auto_758567 ?auto_758569 ?auto_758568 ?auto_758570 ?auto_758571 ?auto_758572 ?auto_758573 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_758581 - SURFACE
      ?auto_758582 - SURFACE
      ?auto_758583 - SURFACE
      ?auto_758585 - SURFACE
      ?auto_758584 - SURFACE
      ?auto_758586 - SURFACE
      ?auto_758587 - SURFACE
      ?auto_758588 - SURFACE
      ?auto_758589 - SURFACE
      ?auto_758590 - SURFACE
    )
    :vars
    (
      ?auto_758592 - HOIST
      ?auto_758594 - PLACE
      ?auto_758591 - PLACE
      ?auto_758597 - HOIST
      ?auto_758596 - SURFACE
      ?auto_758595 - TRUCK
      ?auto_758593 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_758592 ?auto_758594 ) ( IS-CRATE ?auto_758590 ) ( not ( = ?auto_758589 ?auto_758590 ) ) ( not ( = ?auto_758588 ?auto_758589 ) ) ( not ( = ?auto_758588 ?auto_758590 ) ) ( not ( = ?auto_758591 ?auto_758594 ) ) ( HOIST-AT ?auto_758597 ?auto_758591 ) ( not ( = ?auto_758592 ?auto_758597 ) ) ( SURFACE-AT ?auto_758590 ?auto_758591 ) ( ON ?auto_758590 ?auto_758596 ) ( CLEAR ?auto_758590 ) ( not ( = ?auto_758589 ?auto_758596 ) ) ( not ( = ?auto_758590 ?auto_758596 ) ) ( not ( = ?auto_758588 ?auto_758596 ) ) ( SURFACE-AT ?auto_758588 ?auto_758594 ) ( CLEAR ?auto_758588 ) ( IS-CRATE ?auto_758589 ) ( AVAILABLE ?auto_758592 ) ( TRUCK-AT ?auto_758595 ?auto_758591 ) ( AVAILABLE ?auto_758597 ) ( SURFACE-AT ?auto_758589 ?auto_758591 ) ( ON ?auto_758589 ?auto_758593 ) ( CLEAR ?auto_758589 ) ( not ( = ?auto_758589 ?auto_758593 ) ) ( not ( = ?auto_758590 ?auto_758593 ) ) ( not ( = ?auto_758588 ?auto_758593 ) ) ( not ( = ?auto_758596 ?auto_758593 ) ) ( ON ?auto_758582 ?auto_758581 ) ( ON ?auto_758583 ?auto_758582 ) ( ON ?auto_758585 ?auto_758583 ) ( ON ?auto_758584 ?auto_758585 ) ( ON ?auto_758586 ?auto_758584 ) ( ON ?auto_758587 ?auto_758586 ) ( ON ?auto_758588 ?auto_758587 ) ( not ( = ?auto_758581 ?auto_758582 ) ) ( not ( = ?auto_758581 ?auto_758583 ) ) ( not ( = ?auto_758581 ?auto_758585 ) ) ( not ( = ?auto_758581 ?auto_758584 ) ) ( not ( = ?auto_758581 ?auto_758586 ) ) ( not ( = ?auto_758581 ?auto_758587 ) ) ( not ( = ?auto_758581 ?auto_758588 ) ) ( not ( = ?auto_758581 ?auto_758589 ) ) ( not ( = ?auto_758581 ?auto_758590 ) ) ( not ( = ?auto_758581 ?auto_758596 ) ) ( not ( = ?auto_758581 ?auto_758593 ) ) ( not ( = ?auto_758582 ?auto_758583 ) ) ( not ( = ?auto_758582 ?auto_758585 ) ) ( not ( = ?auto_758582 ?auto_758584 ) ) ( not ( = ?auto_758582 ?auto_758586 ) ) ( not ( = ?auto_758582 ?auto_758587 ) ) ( not ( = ?auto_758582 ?auto_758588 ) ) ( not ( = ?auto_758582 ?auto_758589 ) ) ( not ( = ?auto_758582 ?auto_758590 ) ) ( not ( = ?auto_758582 ?auto_758596 ) ) ( not ( = ?auto_758582 ?auto_758593 ) ) ( not ( = ?auto_758583 ?auto_758585 ) ) ( not ( = ?auto_758583 ?auto_758584 ) ) ( not ( = ?auto_758583 ?auto_758586 ) ) ( not ( = ?auto_758583 ?auto_758587 ) ) ( not ( = ?auto_758583 ?auto_758588 ) ) ( not ( = ?auto_758583 ?auto_758589 ) ) ( not ( = ?auto_758583 ?auto_758590 ) ) ( not ( = ?auto_758583 ?auto_758596 ) ) ( not ( = ?auto_758583 ?auto_758593 ) ) ( not ( = ?auto_758585 ?auto_758584 ) ) ( not ( = ?auto_758585 ?auto_758586 ) ) ( not ( = ?auto_758585 ?auto_758587 ) ) ( not ( = ?auto_758585 ?auto_758588 ) ) ( not ( = ?auto_758585 ?auto_758589 ) ) ( not ( = ?auto_758585 ?auto_758590 ) ) ( not ( = ?auto_758585 ?auto_758596 ) ) ( not ( = ?auto_758585 ?auto_758593 ) ) ( not ( = ?auto_758584 ?auto_758586 ) ) ( not ( = ?auto_758584 ?auto_758587 ) ) ( not ( = ?auto_758584 ?auto_758588 ) ) ( not ( = ?auto_758584 ?auto_758589 ) ) ( not ( = ?auto_758584 ?auto_758590 ) ) ( not ( = ?auto_758584 ?auto_758596 ) ) ( not ( = ?auto_758584 ?auto_758593 ) ) ( not ( = ?auto_758586 ?auto_758587 ) ) ( not ( = ?auto_758586 ?auto_758588 ) ) ( not ( = ?auto_758586 ?auto_758589 ) ) ( not ( = ?auto_758586 ?auto_758590 ) ) ( not ( = ?auto_758586 ?auto_758596 ) ) ( not ( = ?auto_758586 ?auto_758593 ) ) ( not ( = ?auto_758587 ?auto_758588 ) ) ( not ( = ?auto_758587 ?auto_758589 ) ) ( not ( = ?auto_758587 ?auto_758590 ) ) ( not ( = ?auto_758587 ?auto_758596 ) ) ( not ( = ?auto_758587 ?auto_758593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758588 ?auto_758589 ?auto_758590 )
      ( MAKE-9CRATE-VERIFY ?auto_758581 ?auto_758582 ?auto_758583 ?auto_758585 ?auto_758584 ?auto_758586 ?auto_758587 ?auto_758588 ?auto_758589 ?auto_758590 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_758598 - SURFACE
      ?auto_758599 - SURFACE
    )
    :vars
    (
      ?auto_758601 - HOIST
      ?auto_758603 - PLACE
      ?auto_758605 - SURFACE
      ?auto_758600 - PLACE
      ?auto_758607 - HOIST
      ?auto_758606 - SURFACE
      ?auto_758602 - SURFACE
      ?auto_758604 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758601 ?auto_758603 ) ( IS-CRATE ?auto_758599 ) ( not ( = ?auto_758598 ?auto_758599 ) ) ( not ( = ?auto_758605 ?auto_758598 ) ) ( not ( = ?auto_758605 ?auto_758599 ) ) ( not ( = ?auto_758600 ?auto_758603 ) ) ( HOIST-AT ?auto_758607 ?auto_758600 ) ( not ( = ?auto_758601 ?auto_758607 ) ) ( SURFACE-AT ?auto_758599 ?auto_758600 ) ( ON ?auto_758599 ?auto_758606 ) ( CLEAR ?auto_758599 ) ( not ( = ?auto_758598 ?auto_758606 ) ) ( not ( = ?auto_758599 ?auto_758606 ) ) ( not ( = ?auto_758605 ?auto_758606 ) ) ( SURFACE-AT ?auto_758605 ?auto_758603 ) ( CLEAR ?auto_758605 ) ( IS-CRATE ?auto_758598 ) ( AVAILABLE ?auto_758601 ) ( AVAILABLE ?auto_758607 ) ( SURFACE-AT ?auto_758598 ?auto_758600 ) ( ON ?auto_758598 ?auto_758602 ) ( CLEAR ?auto_758598 ) ( not ( = ?auto_758598 ?auto_758602 ) ) ( not ( = ?auto_758599 ?auto_758602 ) ) ( not ( = ?auto_758605 ?auto_758602 ) ) ( not ( = ?auto_758606 ?auto_758602 ) ) ( TRUCK-AT ?auto_758604 ?auto_758603 ) )
    :subtasks
    ( ( !DRIVE ?auto_758604 ?auto_758603 ?auto_758600 )
      ( MAKE-2CRATE ?auto_758605 ?auto_758598 ?auto_758599 )
      ( MAKE-1CRATE-VERIFY ?auto_758598 ?auto_758599 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_758608 - SURFACE
      ?auto_758609 - SURFACE
      ?auto_758610 - SURFACE
    )
    :vars
    (
      ?auto_758611 - HOIST
      ?auto_758616 - PLACE
      ?auto_758612 - PLACE
      ?auto_758615 - HOIST
      ?auto_758614 - SURFACE
      ?auto_758617 - SURFACE
      ?auto_758613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758611 ?auto_758616 ) ( IS-CRATE ?auto_758610 ) ( not ( = ?auto_758609 ?auto_758610 ) ) ( not ( = ?auto_758608 ?auto_758609 ) ) ( not ( = ?auto_758608 ?auto_758610 ) ) ( not ( = ?auto_758612 ?auto_758616 ) ) ( HOIST-AT ?auto_758615 ?auto_758612 ) ( not ( = ?auto_758611 ?auto_758615 ) ) ( SURFACE-AT ?auto_758610 ?auto_758612 ) ( ON ?auto_758610 ?auto_758614 ) ( CLEAR ?auto_758610 ) ( not ( = ?auto_758609 ?auto_758614 ) ) ( not ( = ?auto_758610 ?auto_758614 ) ) ( not ( = ?auto_758608 ?auto_758614 ) ) ( SURFACE-AT ?auto_758608 ?auto_758616 ) ( CLEAR ?auto_758608 ) ( IS-CRATE ?auto_758609 ) ( AVAILABLE ?auto_758611 ) ( AVAILABLE ?auto_758615 ) ( SURFACE-AT ?auto_758609 ?auto_758612 ) ( ON ?auto_758609 ?auto_758617 ) ( CLEAR ?auto_758609 ) ( not ( = ?auto_758609 ?auto_758617 ) ) ( not ( = ?auto_758610 ?auto_758617 ) ) ( not ( = ?auto_758608 ?auto_758617 ) ) ( not ( = ?auto_758614 ?auto_758617 ) ) ( TRUCK-AT ?auto_758613 ?auto_758616 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_758609 ?auto_758610 )
      ( MAKE-2CRATE-VERIFY ?auto_758608 ?auto_758609 ?auto_758610 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_758618 - SURFACE
      ?auto_758619 - SURFACE
      ?auto_758620 - SURFACE
      ?auto_758621 - SURFACE
    )
    :vars
    (
      ?auto_758624 - HOIST
      ?auto_758623 - PLACE
      ?auto_758622 - PLACE
      ?auto_758626 - HOIST
      ?auto_758627 - SURFACE
      ?auto_758628 - SURFACE
      ?auto_758625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758624 ?auto_758623 ) ( IS-CRATE ?auto_758621 ) ( not ( = ?auto_758620 ?auto_758621 ) ) ( not ( = ?auto_758619 ?auto_758620 ) ) ( not ( = ?auto_758619 ?auto_758621 ) ) ( not ( = ?auto_758622 ?auto_758623 ) ) ( HOIST-AT ?auto_758626 ?auto_758622 ) ( not ( = ?auto_758624 ?auto_758626 ) ) ( SURFACE-AT ?auto_758621 ?auto_758622 ) ( ON ?auto_758621 ?auto_758627 ) ( CLEAR ?auto_758621 ) ( not ( = ?auto_758620 ?auto_758627 ) ) ( not ( = ?auto_758621 ?auto_758627 ) ) ( not ( = ?auto_758619 ?auto_758627 ) ) ( SURFACE-AT ?auto_758619 ?auto_758623 ) ( CLEAR ?auto_758619 ) ( IS-CRATE ?auto_758620 ) ( AVAILABLE ?auto_758624 ) ( AVAILABLE ?auto_758626 ) ( SURFACE-AT ?auto_758620 ?auto_758622 ) ( ON ?auto_758620 ?auto_758628 ) ( CLEAR ?auto_758620 ) ( not ( = ?auto_758620 ?auto_758628 ) ) ( not ( = ?auto_758621 ?auto_758628 ) ) ( not ( = ?auto_758619 ?auto_758628 ) ) ( not ( = ?auto_758627 ?auto_758628 ) ) ( TRUCK-AT ?auto_758625 ?auto_758623 ) ( ON ?auto_758619 ?auto_758618 ) ( not ( = ?auto_758618 ?auto_758619 ) ) ( not ( = ?auto_758618 ?auto_758620 ) ) ( not ( = ?auto_758618 ?auto_758621 ) ) ( not ( = ?auto_758618 ?auto_758627 ) ) ( not ( = ?auto_758618 ?auto_758628 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758619 ?auto_758620 ?auto_758621 )
      ( MAKE-3CRATE-VERIFY ?auto_758618 ?auto_758619 ?auto_758620 ?auto_758621 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_758629 - SURFACE
      ?auto_758630 - SURFACE
      ?auto_758631 - SURFACE
      ?auto_758633 - SURFACE
      ?auto_758632 - SURFACE
    )
    :vars
    (
      ?auto_758636 - HOIST
      ?auto_758635 - PLACE
      ?auto_758634 - PLACE
      ?auto_758638 - HOIST
      ?auto_758639 - SURFACE
      ?auto_758640 - SURFACE
      ?auto_758637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758636 ?auto_758635 ) ( IS-CRATE ?auto_758632 ) ( not ( = ?auto_758633 ?auto_758632 ) ) ( not ( = ?auto_758631 ?auto_758633 ) ) ( not ( = ?auto_758631 ?auto_758632 ) ) ( not ( = ?auto_758634 ?auto_758635 ) ) ( HOIST-AT ?auto_758638 ?auto_758634 ) ( not ( = ?auto_758636 ?auto_758638 ) ) ( SURFACE-AT ?auto_758632 ?auto_758634 ) ( ON ?auto_758632 ?auto_758639 ) ( CLEAR ?auto_758632 ) ( not ( = ?auto_758633 ?auto_758639 ) ) ( not ( = ?auto_758632 ?auto_758639 ) ) ( not ( = ?auto_758631 ?auto_758639 ) ) ( SURFACE-AT ?auto_758631 ?auto_758635 ) ( CLEAR ?auto_758631 ) ( IS-CRATE ?auto_758633 ) ( AVAILABLE ?auto_758636 ) ( AVAILABLE ?auto_758638 ) ( SURFACE-AT ?auto_758633 ?auto_758634 ) ( ON ?auto_758633 ?auto_758640 ) ( CLEAR ?auto_758633 ) ( not ( = ?auto_758633 ?auto_758640 ) ) ( not ( = ?auto_758632 ?auto_758640 ) ) ( not ( = ?auto_758631 ?auto_758640 ) ) ( not ( = ?auto_758639 ?auto_758640 ) ) ( TRUCK-AT ?auto_758637 ?auto_758635 ) ( ON ?auto_758630 ?auto_758629 ) ( ON ?auto_758631 ?auto_758630 ) ( not ( = ?auto_758629 ?auto_758630 ) ) ( not ( = ?auto_758629 ?auto_758631 ) ) ( not ( = ?auto_758629 ?auto_758633 ) ) ( not ( = ?auto_758629 ?auto_758632 ) ) ( not ( = ?auto_758629 ?auto_758639 ) ) ( not ( = ?auto_758629 ?auto_758640 ) ) ( not ( = ?auto_758630 ?auto_758631 ) ) ( not ( = ?auto_758630 ?auto_758633 ) ) ( not ( = ?auto_758630 ?auto_758632 ) ) ( not ( = ?auto_758630 ?auto_758639 ) ) ( not ( = ?auto_758630 ?auto_758640 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758631 ?auto_758633 ?auto_758632 )
      ( MAKE-4CRATE-VERIFY ?auto_758629 ?auto_758630 ?auto_758631 ?auto_758633 ?auto_758632 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_758641 - SURFACE
      ?auto_758642 - SURFACE
      ?auto_758643 - SURFACE
      ?auto_758645 - SURFACE
      ?auto_758644 - SURFACE
      ?auto_758646 - SURFACE
    )
    :vars
    (
      ?auto_758649 - HOIST
      ?auto_758648 - PLACE
      ?auto_758647 - PLACE
      ?auto_758651 - HOIST
      ?auto_758652 - SURFACE
      ?auto_758653 - SURFACE
      ?auto_758650 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758649 ?auto_758648 ) ( IS-CRATE ?auto_758646 ) ( not ( = ?auto_758644 ?auto_758646 ) ) ( not ( = ?auto_758645 ?auto_758644 ) ) ( not ( = ?auto_758645 ?auto_758646 ) ) ( not ( = ?auto_758647 ?auto_758648 ) ) ( HOIST-AT ?auto_758651 ?auto_758647 ) ( not ( = ?auto_758649 ?auto_758651 ) ) ( SURFACE-AT ?auto_758646 ?auto_758647 ) ( ON ?auto_758646 ?auto_758652 ) ( CLEAR ?auto_758646 ) ( not ( = ?auto_758644 ?auto_758652 ) ) ( not ( = ?auto_758646 ?auto_758652 ) ) ( not ( = ?auto_758645 ?auto_758652 ) ) ( SURFACE-AT ?auto_758645 ?auto_758648 ) ( CLEAR ?auto_758645 ) ( IS-CRATE ?auto_758644 ) ( AVAILABLE ?auto_758649 ) ( AVAILABLE ?auto_758651 ) ( SURFACE-AT ?auto_758644 ?auto_758647 ) ( ON ?auto_758644 ?auto_758653 ) ( CLEAR ?auto_758644 ) ( not ( = ?auto_758644 ?auto_758653 ) ) ( not ( = ?auto_758646 ?auto_758653 ) ) ( not ( = ?auto_758645 ?auto_758653 ) ) ( not ( = ?auto_758652 ?auto_758653 ) ) ( TRUCK-AT ?auto_758650 ?auto_758648 ) ( ON ?auto_758642 ?auto_758641 ) ( ON ?auto_758643 ?auto_758642 ) ( ON ?auto_758645 ?auto_758643 ) ( not ( = ?auto_758641 ?auto_758642 ) ) ( not ( = ?auto_758641 ?auto_758643 ) ) ( not ( = ?auto_758641 ?auto_758645 ) ) ( not ( = ?auto_758641 ?auto_758644 ) ) ( not ( = ?auto_758641 ?auto_758646 ) ) ( not ( = ?auto_758641 ?auto_758652 ) ) ( not ( = ?auto_758641 ?auto_758653 ) ) ( not ( = ?auto_758642 ?auto_758643 ) ) ( not ( = ?auto_758642 ?auto_758645 ) ) ( not ( = ?auto_758642 ?auto_758644 ) ) ( not ( = ?auto_758642 ?auto_758646 ) ) ( not ( = ?auto_758642 ?auto_758652 ) ) ( not ( = ?auto_758642 ?auto_758653 ) ) ( not ( = ?auto_758643 ?auto_758645 ) ) ( not ( = ?auto_758643 ?auto_758644 ) ) ( not ( = ?auto_758643 ?auto_758646 ) ) ( not ( = ?auto_758643 ?auto_758652 ) ) ( not ( = ?auto_758643 ?auto_758653 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758645 ?auto_758644 ?auto_758646 )
      ( MAKE-5CRATE-VERIFY ?auto_758641 ?auto_758642 ?auto_758643 ?auto_758645 ?auto_758644 ?auto_758646 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_758654 - SURFACE
      ?auto_758655 - SURFACE
      ?auto_758656 - SURFACE
      ?auto_758658 - SURFACE
      ?auto_758657 - SURFACE
      ?auto_758659 - SURFACE
      ?auto_758660 - SURFACE
    )
    :vars
    (
      ?auto_758663 - HOIST
      ?auto_758662 - PLACE
      ?auto_758661 - PLACE
      ?auto_758665 - HOIST
      ?auto_758666 - SURFACE
      ?auto_758667 - SURFACE
      ?auto_758664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758663 ?auto_758662 ) ( IS-CRATE ?auto_758660 ) ( not ( = ?auto_758659 ?auto_758660 ) ) ( not ( = ?auto_758657 ?auto_758659 ) ) ( not ( = ?auto_758657 ?auto_758660 ) ) ( not ( = ?auto_758661 ?auto_758662 ) ) ( HOIST-AT ?auto_758665 ?auto_758661 ) ( not ( = ?auto_758663 ?auto_758665 ) ) ( SURFACE-AT ?auto_758660 ?auto_758661 ) ( ON ?auto_758660 ?auto_758666 ) ( CLEAR ?auto_758660 ) ( not ( = ?auto_758659 ?auto_758666 ) ) ( not ( = ?auto_758660 ?auto_758666 ) ) ( not ( = ?auto_758657 ?auto_758666 ) ) ( SURFACE-AT ?auto_758657 ?auto_758662 ) ( CLEAR ?auto_758657 ) ( IS-CRATE ?auto_758659 ) ( AVAILABLE ?auto_758663 ) ( AVAILABLE ?auto_758665 ) ( SURFACE-AT ?auto_758659 ?auto_758661 ) ( ON ?auto_758659 ?auto_758667 ) ( CLEAR ?auto_758659 ) ( not ( = ?auto_758659 ?auto_758667 ) ) ( not ( = ?auto_758660 ?auto_758667 ) ) ( not ( = ?auto_758657 ?auto_758667 ) ) ( not ( = ?auto_758666 ?auto_758667 ) ) ( TRUCK-AT ?auto_758664 ?auto_758662 ) ( ON ?auto_758655 ?auto_758654 ) ( ON ?auto_758656 ?auto_758655 ) ( ON ?auto_758658 ?auto_758656 ) ( ON ?auto_758657 ?auto_758658 ) ( not ( = ?auto_758654 ?auto_758655 ) ) ( not ( = ?auto_758654 ?auto_758656 ) ) ( not ( = ?auto_758654 ?auto_758658 ) ) ( not ( = ?auto_758654 ?auto_758657 ) ) ( not ( = ?auto_758654 ?auto_758659 ) ) ( not ( = ?auto_758654 ?auto_758660 ) ) ( not ( = ?auto_758654 ?auto_758666 ) ) ( not ( = ?auto_758654 ?auto_758667 ) ) ( not ( = ?auto_758655 ?auto_758656 ) ) ( not ( = ?auto_758655 ?auto_758658 ) ) ( not ( = ?auto_758655 ?auto_758657 ) ) ( not ( = ?auto_758655 ?auto_758659 ) ) ( not ( = ?auto_758655 ?auto_758660 ) ) ( not ( = ?auto_758655 ?auto_758666 ) ) ( not ( = ?auto_758655 ?auto_758667 ) ) ( not ( = ?auto_758656 ?auto_758658 ) ) ( not ( = ?auto_758656 ?auto_758657 ) ) ( not ( = ?auto_758656 ?auto_758659 ) ) ( not ( = ?auto_758656 ?auto_758660 ) ) ( not ( = ?auto_758656 ?auto_758666 ) ) ( not ( = ?auto_758656 ?auto_758667 ) ) ( not ( = ?auto_758658 ?auto_758657 ) ) ( not ( = ?auto_758658 ?auto_758659 ) ) ( not ( = ?auto_758658 ?auto_758660 ) ) ( not ( = ?auto_758658 ?auto_758666 ) ) ( not ( = ?auto_758658 ?auto_758667 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758657 ?auto_758659 ?auto_758660 )
      ( MAKE-6CRATE-VERIFY ?auto_758654 ?auto_758655 ?auto_758656 ?auto_758658 ?auto_758657 ?auto_758659 ?auto_758660 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_758668 - SURFACE
      ?auto_758669 - SURFACE
      ?auto_758670 - SURFACE
      ?auto_758672 - SURFACE
      ?auto_758671 - SURFACE
      ?auto_758673 - SURFACE
      ?auto_758674 - SURFACE
      ?auto_758675 - SURFACE
    )
    :vars
    (
      ?auto_758678 - HOIST
      ?auto_758677 - PLACE
      ?auto_758676 - PLACE
      ?auto_758680 - HOIST
      ?auto_758681 - SURFACE
      ?auto_758682 - SURFACE
      ?auto_758679 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758678 ?auto_758677 ) ( IS-CRATE ?auto_758675 ) ( not ( = ?auto_758674 ?auto_758675 ) ) ( not ( = ?auto_758673 ?auto_758674 ) ) ( not ( = ?auto_758673 ?auto_758675 ) ) ( not ( = ?auto_758676 ?auto_758677 ) ) ( HOIST-AT ?auto_758680 ?auto_758676 ) ( not ( = ?auto_758678 ?auto_758680 ) ) ( SURFACE-AT ?auto_758675 ?auto_758676 ) ( ON ?auto_758675 ?auto_758681 ) ( CLEAR ?auto_758675 ) ( not ( = ?auto_758674 ?auto_758681 ) ) ( not ( = ?auto_758675 ?auto_758681 ) ) ( not ( = ?auto_758673 ?auto_758681 ) ) ( SURFACE-AT ?auto_758673 ?auto_758677 ) ( CLEAR ?auto_758673 ) ( IS-CRATE ?auto_758674 ) ( AVAILABLE ?auto_758678 ) ( AVAILABLE ?auto_758680 ) ( SURFACE-AT ?auto_758674 ?auto_758676 ) ( ON ?auto_758674 ?auto_758682 ) ( CLEAR ?auto_758674 ) ( not ( = ?auto_758674 ?auto_758682 ) ) ( not ( = ?auto_758675 ?auto_758682 ) ) ( not ( = ?auto_758673 ?auto_758682 ) ) ( not ( = ?auto_758681 ?auto_758682 ) ) ( TRUCK-AT ?auto_758679 ?auto_758677 ) ( ON ?auto_758669 ?auto_758668 ) ( ON ?auto_758670 ?auto_758669 ) ( ON ?auto_758672 ?auto_758670 ) ( ON ?auto_758671 ?auto_758672 ) ( ON ?auto_758673 ?auto_758671 ) ( not ( = ?auto_758668 ?auto_758669 ) ) ( not ( = ?auto_758668 ?auto_758670 ) ) ( not ( = ?auto_758668 ?auto_758672 ) ) ( not ( = ?auto_758668 ?auto_758671 ) ) ( not ( = ?auto_758668 ?auto_758673 ) ) ( not ( = ?auto_758668 ?auto_758674 ) ) ( not ( = ?auto_758668 ?auto_758675 ) ) ( not ( = ?auto_758668 ?auto_758681 ) ) ( not ( = ?auto_758668 ?auto_758682 ) ) ( not ( = ?auto_758669 ?auto_758670 ) ) ( not ( = ?auto_758669 ?auto_758672 ) ) ( not ( = ?auto_758669 ?auto_758671 ) ) ( not ( = ?auto_758669 ?auto_758673 ) ) ( not ( = ?auto_758669 ?auto_758674 ) ) ( not ( = ?auto_758669 ?auto_758675 ) ) ( not ( = ?auto_758669 ?auto_758681 ) ) ( not ( = ?auto_758669 ?auto_758682 ) ) ( not ( = ?auto_758670 ?auto_758672 ) ) ( not ( = ?auto_758670 ?auto_758671 ) ) ( not ( = ?auto_758670 ?auto_758673 ) ) ( not ( = ?auto_758670 ?auto_758674 ) ) ( not ( = ?auto_758670 ?auto_758675 ) ) ( not ( = ?auto_758670 ?auto_758681 ) ) ( not ( = ?auto_758670 ?auto_758682 ) ) ( not ( = ?auto_758672 ?auto_758671 ) ) ( not ( = ?auto_758672 ?auto_758673 ) ) ( not ( = ?auto_758672 ?auto_758674 ) ) ( not ( = ?auto_758672 ?auto_758675 ) ) ( not ( = ?auto_758672 ?auto_758681 ) ) ( not ( = ?auto_758672 ?auto_758682 ) ) ( not ( = ?auto_758671 ?auto_758673 ) ) ( not ( = ?auto_758671 ?auto_758674 ) ) ( not ( = ?auto_758671 ?auto_758675 ) ) ( not ( = ?auto_758671 ?auto_758681 ) ) ( not ( = ?auto_758671 ?auto_758682 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758673 ?auto_758674 ?auto_758675 )
      ( MAKE-7CRATE-VERIFY ?auto_758668 ?auto_758669 ?auto_758670 ?auto_758672 ?auto_758671 ?auto_758673 ?auto_758674 ?auto_758675 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_758683 - SURFACE
      ?auto_758684 - SURFACE
      ?auto_758685 - SURFACE
      ?auto_758687 - SURFACE
      ?auto_758686 - SURFACE
      ?auto_758688 - SURFACE
      ?auto_758689 - SURFACE
      ?auto_758690 - SURFACE
      ?auto_758691 - SURFACE
    )
    :vars
    (
      ?auto_758694 - HOIST
      ?auto_758693 - PLACE
      ?auto_758692 - PLACE
      ?auto_758696 - HOIST
      ?auto_758697 - SURFACE
      ?auto_758698 - SURFACE
      ?auto_758695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758694 ?auto_758693 ) ( IS-CRATE ?auto_758691 ) ( not ( = ?auto_758690 ?auto_758691 ) ) ( not ( = ?auto_758689 ?auto_758690 ) ) ( not ( = ?auto_758689 ?auto_758691 ) ) ( not ( = ?auto_758692 ?auto_758693 ) ) ( HOIST-AT ?auto_758696 ?auto_758692 ) ( not ( = ?auto_758694 ?auto_758696 ) ) ( SURFACE-AT ?auto_758691 ?auto_758692 ) ( ON ?auto_758691 ?auto_758697 ) ( CLEAR ?auto_758691 ) ( not ( = ?auto_758690 ?auto_758697 ) ) ( not ( = ?auto_758691 ?auto_758697 ) ) ( not ( = ?auto_758689 ?auto_758697 ) ) ( SURFACE-AT ?auto_758689 ?auto_758693 ) ( CLEAR ?auto_758689 ) ( IS-CRATE ?auto_758690 ) ( AVAILABLE ?auto_758694 ) ( AVAILABLE ?auto_758696 ) ( SURFACE-AT ?auto_758690 ?auto_758692 ) ( ON ?auto_758690 ?auto_758698 ) ( CLEAR ?auto_758690 ) ( not ( = ?auto_758690 ?auto_758698 ) ) ( not ( = ?auto_758691 ?auto_758698 ) ) ( not ( = ?auto_758689 ?auto_758698 ) ) ( not ( = ?auto_758697 ?auto_758698 ) ) ( TRUCK-AT ?auto_758695 ?auto_758693 ) ( ON ?auto_758684 ?auto_758683 ) ( ON ?auto_758685 ?auto_758684 ) ( ON ?auto_758687 ?auto_758685 ) ( ON ?auto_758686 ?auto_758687 ) ( ON ?auto_758688 ?auto_758686 ) ( ON ?auto_758689 ?auto_758688 ) ( not ( = ?auto_758683 ?auto_758684 ) ) ( not ( = ?auto_758683 ?auto_758685 ) ) ( not ( = ?auto_758683 ?auto_758687 ) ) ( not ( = ?auto_758683 ?auto_758686 ) ) ( not ( = ?auto_758683 ?auto_758688 ) ) ( not ( = ?auto_758683 ?auto_758689 ) ) ( not ( = ?auto_758683 ?auto_758690 ) ) ( not ( = ?auto_758683 ?auto_758691 ) ) ( not ( = ?auto_758683 ?auto_758697 ) ) ( not ( = ?auto_758683 ?auto_758698 ) ) ( not ( = ?auto_758684 ?auto_758685 ) ) ( not ( = ?auto_758684 ?auto_758687 ) ) ( not ( = ?auto_758684 ?auto_758686 ) ) ( not ( = ?auto_758684 ?auto_758688 ) ) ( not ( = ?auto_758684 ?auto_758689 ) ) ( not ( = ?auto_758684 ?auto_758690 ) ) ( not ( = ?auto_758684 ?auto_758691 ) ) ( not ( = ?auto_758684 ?auto_758697 ) ) ( not ( = ?auto_758684 ?auto_758698 ) ) ( not ( = ?auto_758685 ?auto_758687 ) ) ( not ( = ?auto_758685 ?auto_758686 ) ) ( not ( = ?auto_758685 ?auto_758688 ) ) ( not ( = ?auto_758685 ?auto_758689 ) ) ( not ( = ?auto_758685 ?auto_758690 ) ) ( not ( = ?auto_758685 ?auto_758691 ) ) ( not ( = ?auto_758685 ?auto_758697 ) ) ( not ( = ?auto_758685 ?auto_758698 ) ) ( not ( = ?auto_758687 ?auto_758686 ) ) ( not ( = ?auto_758687 ?auto_758688 ) ) ( not ( = ?auto_758687 ?auto_758689 ) ) ( not ( = ?auto_758687 ?auto_758690 ) ) ( not ( = ?auto_758687 ?auto_758691 ) ) ( not ( = ?auto_758687 ?auto_758697 ) ) ( not ( = ?auto_758687 ?auto_758698 ) ) ( not ( = ?auto_758686 ?auto_758688 ) ) ( not ( = ?auto_758686 ?auto_758689 ) ) ( not ( = ?auto_758686 ?auto_758690 ) ) ( not ( = ?auto_758686 ?auto_758691 ) ) ( not ( = ?auto_758686 ?auto_758697 ) ) ( not ( = ?auto_758686 ?auto_758698 ) ) ( not ( = ?auto_758688 ?auto_758689 ) ) ( not ( = ?auto_758688 ?auto_758690 ) ) ( not ( = ?auto_758688 ?auto_758691 ) ) ( not ( = ?auto_758688 ?auto_758697 ) ) ( not ( = ?auto_758688 ?auto_758698 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758689 ?auto_758690 ?auto_758691 )
      ( MAKE-8CRATE-VERIFY ?auto_758683 ?auto_758684 ?auto_758685 ?auto_758687 ?auto_758686 ?auto_758688 ?auto_758689 ?auto_758690 ?auto_758691 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_758699 - SURFACE
      ?auto_758700 - SURFACE
      ?auto_758701 - SURFACE
      ?auto_758703 - SURFACE
      ?auto_758702 - SURFACE
      ?auto_758704 - SURFACE
      ?auto_758705 - SURFACE
      ?auto_758706 - SURFACE
      ?auto_758707 - SURFACE
      ?auto_758708 - SURFACE
    )
    :vars
    (
      ?auto_758711 - HOIST
      ?auto_758710 - PLACE
      ?auto_758709 - PLACE
      ?auto_758713 - HOIST
      ?auto_758714 - SURFACE
      ?auto_758715 - SURFACE
      ?auto_758712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758711 ?auto_758710 ) ( IS-CRATE ?auto_758708 ) ( not ( = ?auto_758707 ?auto_758708 ) ) ( not ( = ?auto_758706 ?auto_758707 ) ) ( not ( = ?auto_758706 ?auto_758708 ) ) ( not ( = ?auto_758709 ?auto_758710 ) ) ( HOIST-AT ?auto_758713 ?auto_758709 ) ( not ( = ?auto_758711 ?auto_758713 ) ) ( SURFACE-AT ?auto_758708 ?auto_758709 ) ( ON ?auto_758708 ?auto_758714 ) ( CLEAR ?auto_758708 ) ( not ( = ?auto_758707 ?auto_758714 ) ) ( not ( = ?auto_758708 ?auto_758714 ) ) ( not ( = ?auto_758706 ?auto_758714 ) ) ( SURFACE-AT ?auto_758706 ?auto_758710 ) ( CLEAR ?auto_758706 ) ( IS-CRATE ?auto_758707 ) ( AVAILABLE ?auto_758711 ) ( AVAILABLE ?auto_758713 ) ( SURFACE-AT ?auto_758707 ?auto_758709 ) ( ON ?auto_758707 ?auto_758715 ) ( CLEAR ?auto_758707 ) ( not ( = ?auto_758707 ?auto_758715 ) ) ( not ( = ?auto_758708 ?auto_758715 ) ) ( not ( = ?auto_758706 ?auto_758715 ) ) ( not ( = ?auto_758714 ?auto_758715 ) ) ( TRUCK-AT ?auto_758712 ?auto_758710 ) ( ON ?auto_758700 ?auto_758699 ) ( ON ?auto_758701 ?auto_758700 ) ( ON ?auto_758703 ?auto_758701 ) ( ON ?auto_758702 ?auto_758703 ) ( ON ?auto_758704 ?auto_758702 ) ( ON ?auto_758705 ?auto_758704 ) ( ON ?auto_758706 ?auto_758705 ) ( not ( = ?auto_758699 ?auto_758700 ) ) ( not ( = ?auto_758699 ?auto_758701 ) ) ( not ( = ?auto_758699 ?auto_758703 ) ) ( not ( = ?auto_758699 ?auto_758702 ) ) ( not ( = ?auto_758699 ?auto_758704 ) ) ( not ( = ?auto_758699 ?auto_758705 ) ) ( not ( = ?auto_758699 ?auto_758706 ) ) ( not ( = ?auto_758699 ?auto_758707 ) ) ( not ( = ?auto_758699 ?auto_758708 ) ) ( not ( = ?auto_758699 ?auto_758714 ) ) ( not ( = ?auto_758699 ?auto_758715 ) ) ( not ( = ?auto_758700 ?auto_758701 ) ) ( not ( = ?auto_758700 ?auto_758703 ) ) ( not ( = ?auto_758700 ?auto_758702 ) ) ( not ( = ?auto_758700 ?auto_758704 ) ) ( not ( = ?auto_758700 ?auto_758705 ) ) ( not ( = ?auto_758700 ?auto_758706 ) ) ( not ( = ?auto_758700 ?auto_758707 ) ) ( not ( = ?auto_758700 ?auto_758708 ) ) ( not ( = ?auto_758700 ?auto_758714 ) ) ( not ( = ?auto_758700 ?auto_758715 ) ) ( not ( = ?auto_758701 ?auto_758703 ) ) ( not ( = ?auto_758701 ?auto_758702 ) ) ( not ( = ?auto_758701 ?auto_758704 ) ) ( not ( = ?auto_758701 ?auto_758705 ) ) ( not ( = ?auto_758701 ?auto_758706 ) ) ( not ( = ?auto_758701 ?auto_758707 ) ) ( not ( = ?auto_758701 ?auto_758708 ) ) ( not ( = ?auto_758701 ?auto_758714 ) ) ( not ( = ?auto_758701 ?auto_758715 ) ) ( not ( = ?auto_758703 ?auto_758702 ) ) ( not ( = ?auto_758703 ?auto_758704 ) ) ( not ( = ?auto_758703 ?auto_758705 ) ) ( not ( = ?auto_758703 ?auto_758706 ) ) ( not ( = ?auto_758703 ?auto_758707 ) ) ( not ( = ?auto_758703 ?auto_758708 ) ) ( not ( = ?auto_758703 ?auto_758714 ) ) ( not ( = ?auto_758703 ?auto_758715 ) ) ( not ( = ?auto_758702 ?auto_758704 ) ) ( not ( = ?auto_758702 ?auto_758705 ) ) ( not ( = ?auto_758702 ?auto_758706 ) ) ( not ( = ?auto_758702 ?auto_758707 ) ) ( not ( = ?auto_758702 ?auto_758708 ) ) ( not ( = ?auto_758702 ?auto_758714 ) ) ( not ( = ?auto_758702 ?auto_758715 ) ) ( not ( = ?auto_758704 ?auto_758705 ) ) ( not ( = ?auto_758704 ?auto_758706 ) ) ( not ( = ?auto_758704 ?auto_758707 ) ) ( not ( = ?auto_758704 ?auto_758708 ) ) ( not ( = ?auto_758704 ?auto_758714 ) ) ( not ( = ?auto_758704 ?auto_758715 ) ) ( not ( = ?auto_758705 ?auto_758706 ) ) ( not ( = ?auto_758705 ?auto_758707 ) ) ( not ( = ?auto_758705 ?auto_758708 ) ) ( not ( = ?auto_758705 ?auto_758714 ) ) ( not ( = ?auto_758705 ?auto_758715 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758706 ?auto_758707 ?auto_758708 )
      ( MAKE-9CRATE-VERIFY ?auto_758699 ?auto_758700 ?auto_758701 ?auto_758703 ?auto_758702 ?auto_758704 ?auto_758705 ?auto_758706 ?auto_758707 ?auto_758708 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_758716 - SURFACE
      ?auto_758717 - SURFACE
    )
    :vars
    (
      ?auto_758720 - HOIST
      ?auto_758719 - PLACE
      ?auto_758724 - SURFACE
      ?auto_758718 - PLACE
      ?auto_758722 - HOIST
      ?auto_758723 - SURFACE
      ?auto_758725 - SURFACE
      ?auto_758721 - TRUCK
      ?auto_758726 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_758720 ?auto_758719 ) ( IS-CRATE ?auto_758717 ) ( not ( = ?auto_758716 ?auto_758717 ) ) ( not ( = ?auto_758724 ?auto_758716 ) ) ( not ( = ?auto_758724 ?auto_758717 ) ) ( not ( = ?auto_758718 ?auto_758719 ) ) ( HOIST-AT ?auto_758722 ?auto_758718 ) ( not ( = ?auto_758720 ?auto_758722 ) ) ( SURFACE-AT ?auto_758717 ?auto_758718 ) ( ON ?auto_758717 ?auto_758723 ) ( CLEAR ?auto_758717 ) ( not ( = ?auto_758716 ?auto_758723 ) ) ( not ( = ?auto_758717 ?auto_758723 ) ) ( not ( = ?auto_758724 ?auto_758723 ) ) ( IS-CRATE ?auto_758716 ) ( AVAILABLE ?auto_758722 ) ( SURFACE-AT ?auto_758716 ?auto_758718 ) ( ON ?auto_758716 ?auto_758725 ) ( CLEAR ?auto_758716 ) ( not ( = ?auto_758716 ?auto_758725 ) ) ( not ( = ?auto_758717 ?auto_758725 ) ) ( not ( = ?auto_758724 ?auto_758725 ) ) ( not ( = ?auto_758723 ?auto_758725 ) ) ( TRUCK-AT ?auto_758721 ?auto_758719 ) ( SURFACE-AT ?auto_758726 ?auto_758719 ) ( CLEAR ?auto_758726 ) ( LIFTING ?auto_758720 ?auto_758724 ) ( IS-CRATE ?auto_758724 ) ( not ( = ?auto_758726 ?auto_758724 ) ) ( not ( = ?auto_758716 ?auto_758726 ) ) ( not ( = ?auto_758717 ?auto_758726 ) ) ( not ( = ?auto_758723 ?auto_758726 ) ) ( not ( = ?auto_758725 ?auto_758726 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_758726 ?auto_758724 )
      ( MAKE-2CRATE ?auto_758724 ?auto_758716 ?auto_758717 )
      ( MAKE-1CRATE-VERIFY ?auto_758716 ?auto_758717 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_758727 - SURFACE
      ?auto_758728 - SURFACE
      ?auto_758729 - SURFACE
    )
    :vars
    (
      ?auto_758734 - HOIST
      ?auto_758732 - PLACE
      ?auto_758737 - PLACE
      ?auto_758730 - HOIST
      ?auto_758733 - SURFACE
      ?auto_758736 - SURFACE
      ?auto_758735 - TRUCK
      ?auto_758731 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_758734 ?auto_758732 ) ( IS-CRATE ?auto_758729 ) ( not ( = ?auto_758728 ?auto_758729 ) ) ( not ( = ?auto_758727 ?auto_758728 ) ) ( not ( = ?auto_758727 ?auto_758729 ) ) ( not ( = ?auto_758737 ?auto_758732 ) ) ( HOIST-AT ?auto_758730 ?auto_758737 ) ( not ( = ?auto_758734 ?auto_758730 ) ) ( SURFACE-AT ?auto_758729 ?auto_758737 ) ( ON ?auto_758729 ?auto_758733 ) ( CLEAR ?auto_758729 ) ( not ( = ?auto_758728 ?auto_758733 ) ) ( not ( = ?auto_758729 ?auto_758733 ) ) ( not ( = ?auto_758727 ?auto_758733 ) ) ( IS-CRATE ?auto_758728 ) ( AVAILABLE ?auto_758730 ) ( SURFACE-AT ?auto_758728 ?auto_758737 ) ( ON ?auto_758728 ?auto_758736 ) ( CLEAR ?auto_758728 ) ( not ( = ?auto_758728 ?auto_758736 ) ) ( not ( = ?auto_758729 ?auto_758736 ) ) ( not ( = ?auto_758727 ?auto_758736 ) ) ( not ( = ?auto_758733 ?auto_758736 ) ) ( TRUCK-AT ?auto_758735 ?auto_758732 ) ( SURFACE-AT ?auto_758731 ?auto_758732 ) ( CLEAR ?auto_758731 ) ( LIFTING ?auto_758734 ?auto_758727 ) ( IS-CRATE ?auto_758727 ) ( not ( = ?auto_758731 ?auto_758727 ) ) ( not ( = ?auto_758728 ?auto_758731 ) ) ( not ( = ?auto_758729 ?auto_758731 ) ) ( not ( = ?auto_758733 ?auto_758731 ) ) ( not ( = ?auto_758736 ?auto_758731 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_758728 ?auto_758729 )
      ( MAKE-2CRATE-VERIFY ?auto_758727 ?auto_758728 ?auto_758729 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_758738 - SURFACE
      ?auto_758739 - SURFACE
      ?auto_758740 - SURFACE
      ?auto_758741 - SURFACE
    )
    :vars
    (
      ?auto_758742 - HOIST
      ?auto_758747 - PLACE
      ?auto_758743 - PLACE
      ?auto_758744 - HOIST
      ?auto_758748 - SURFACE
      ?auto_758745 - SURFACE
      ?auto_758746 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758742 ?auto_758747 ) ( IS-CRATE ?auto_758741 ) ( not ( = ?auto_758740 ?auto_758741 ) ) ( not ( = ?auto_758739 ?auto_758740 ) ) ( not ( = ?auto_758739 ?auto_758741 ) ) ( not ( = ?auto_758743 ?auto_758747 ) ) ( HOIST-AT ?auto_758744 ?auto_758743 ) ( not ( = ?auto_758742 ?auto_758744 ) ) ( SURFACE-AT ?auto_758741 ?auto_758743 ) ( ON ?auto_758741 ?auto_758748 ) ( CLEAR ?auto_758741 ) ( not ( = ?auto_758740 ?auto_758748 ) ) ( not ( = ?auto_758741 ?auto_758748 ) ) ( not ( = ?auto_758739 ?auto_758748 ) ) ( IS-CRATE ?auto_758740 ) ( AVAILABLE ?auto_758744 ) ( SURFACE-AT ?auto_758740 ?auto_758743 ) ( ON ?auto_758740 ?auto_758745 ) ( CLEAR ?auto_758740 ) ( not ( = ?auto_758740 ?auto_758745 ) ) ( not ( = ?auto_758741 ?auto_758745 ) ) ( not ( = ?auto_758739 ?auto_758745 ) ) ( not ( = ?auto_758748 ?auto_758745 ) ) ( TRUCK-AT ?auto_758746 ?auto_758747 ) ( SURFACE-AT ?auto_758738 ?auto_758747 ) ( CLEAR ?auto_758738 ) ( LIFTING ?auto_758742 ?auto_758739 ) ( IS-CRATE ?auto_758739 ) ( not ( = ?auto_758738 ?auto_758739 ) ) ( not ( = ?auto_758740 ?auto_758738 ) ) ( not ( = ?auto_758741 ?auto_758738 ) ) ( not ( = ?auto_758748 ?auto_758738 ) ) ( not ( = ?auto_758745 ?auto_758738 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758739 ?auto_758740 ?auto_758741 )
      ( MAKE-3CRATE-VERIFY ?auto_758738 ?auto_758739 ?auto_758740 ?auto_758741 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_758749 - SURFACE
      ?auto_758750 - SURFACE
      ?auto_758751 - SURFACE
      ?auto_758753 - SURFACE
      ?auto_758752 - SURFACE
    )
    :vars
    (
      ?auto_758754 - HOIST
      ?auto_758759 - PLACE
      ?auto_758755 - PLACE
      ?auto_758756 - HOIST
      ?auto_758760 - SURFACE
      ?auto_758757 - SURFACE
      ?auto_758758 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758754 ?auto_758759 ) ( IS-CRATE ?auto_758752 ) ( not ( = ?auto_758753 ?auto_758752 ) ) ( not ( = ?auto_758751 ?auto_758753 ) ) ( not ( = ?auto_758751 ?auto_758752 ) ) ( not ( = ?auto_758755 ?auto_758759 ) ) ( HOIST-AT ?auto_758756 ?auto_758755 ) ( not ( = ?auto_758754 ?auto_758756 ) ) ( SURFACE-AT ?auto_758752 ?auto_758755 ) ( ON ?auto_758752 ?auto_758760 ) ( CLEAR ?auto_758752 ) ( not ( = ?auto_758753 ?auto_758760 ) ) ( not ( = ?auto_758752 ?auto_758760 ) ) ( not ( = ?auto_758751 ?auto_758760 ) ) ( IS-CRATE ?auto_758753 ) ( AVAILABLE ?auto_758756 ) ( SURFACE-AT ?auto_758753 ?auto_758755 ) ( ON ?auto_758753 ?auto_758757 ) ( CLEAR ?auto_758753 ) ( not ( = ?auto_758753 ?auto_758757 ) ) ( not ( = ?auto_758752 ?auto_758757 ) ) ( not ( = ?auto_758751 ?auto_758757 ) ) ( not ( = ?auto_758760 ?auto_758757 ) ) ( TRUCK-AT ?auto_758758 ?auto_758759 ) ( SURFACE-AT ?auto_758750 ?auto_758759 ) ( CLEAR ?auto_758750 ) ( LIFTING ?auto_758754 ?auto_758751 ) ( IS-CRATE ?auto_758751 ) ( not ( = ?auto_758750 ?auto_758751 ) ) ( not ( = ?auto_758753 ?auto_758750 ) ) ( not ( = ?auto_758752 ?auto_758750 ) ) ( not ( = ?auto_758760 ?auto_758750 ) ) ( not ( = ?auto_758757 ?auto_758750 ) ) ( ON ?auto_758750 ?auto_758749 ) ( not ( = ?auto_758749 ?auto_758750 ) ) ( not ( = ?auto_758749 ?auto_758751 ) ) ( not ( = ?auto_758749 ?auto_758753 ) ) ( not ( = ?auto_758749 ?auto_758752 ) ) ( not ( = ?auto_758749 ?auto_758760 ) ) ( not ( = ?auto_758749 ?auto_758757 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758751 ?auto_758753 ?auto_758752 )
      ( MAKE-4CRATE-VERIFY ?auto_758749 ?auto_758750 ?auto_758751 ?auto_758753 ?auto_758752 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_758761 - SURFACE
      ?auto_758762 - SURFACE
      ?auto_758763 - SURFACE
      ?auto_758765 - SURFACE
      ?auto_758764 - SURFACE
      ?auto_758766 - SURFACE
    )
    :vars
    (
      ?auto_758767 - HOIST
      ?auto_758772 - PLACE
      ?auto_758768 - PLACE
      ?auto_758769 - HOIST
      ?auto_758773 - SURFACE
      ?auto_758770 - SURFACE
      ?auto_758771 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758767 ?auto_758772 ) ( IS-CRATE ?auto_758766 ) ( not ( = ?auto_758764 ?auto_758766 ) ) ( not ( = ?auto_758765 ?auto_758764 ) ) ( not ( = ?auto_758765 ?auto_758766 ) ) ( not ( = ?auto_758768 ?auto_758772 ) ) ( HOIST-AT ?auto_758769 ?auto_758768 ) ( not ( = ?auto_758767 ?auto_758769 ) ) ( SURFACE-AT ?auto_758766 ?auto_758768 ) ( ON ?auto_758766 ?auto_758773 ) ( CLEAR ?auto_758766 ) ( not ( = ?auto_758764 ?auto_758773 ) ) ( not ( = ?auto_758766 ?auto_758773 ) ) ( not ( = ?auto_758765 ?auto_758773 ) ) ( IS-CRATE ?auto_758764 ) ( AVAILABLE ?auto_758769 ) ( SURFACE-AT ?auto_758764 ?auto_758768 ) ( ON ?auto_758764 ?auto_758770 ) ( CLEAR ?auto_758764 ) ( not ( = ?auto_758764 ?auto_758770 ) ) ( not ( = ?auto_758766 ?auto_758770 ) ) ( not ( = ?auto_758765 ?auto_758770 ) ) ( not ( = ?auto_758773 ?auto_758770 ) ) ( TRUCK-AT ?auto_758771 ?auto_758772 ) ( SURFACE-AT ?auto_758763 ?auto_758772 ) ( CLEAR ?auto_758763 ) ( LIFTING ?auto_758767 ?auto_758765 ) ( IS-CRATE ?auto_758765 ) ( not ( = ?auto_758763 ?auto_758765 ) ) ( not ( = ?auto_758764 ?auto_758763 ) ) ( not ( = ?auto_758766 ?auto_758763 ) ) ( not ( = ?auto_758773 ?auto_758763 ) ) ( not ( = ?auto_758770 ?auto_758763 ) ) ( ON ?auto_758762 ?auto_758761 ) ( ON ?auto_758763 ?auto_758762 ) ( not ( = ?auto_758761 ?auto_758762 ) ) ( not ( = ?auto_758761 ?auto_758763 ) ) ( not ( = ?auto_758761 ?auto_758765 ) ) ( not ( = ?auto_758761 ?auto_758764 ) ) ( not ( = ?auto_758761 ?auto_758766 ) ) ( not ( = ?auto_758761 ?auto_758773 ) ) ( not ( = ?auto_758761 ?auto_758770 ) ) ( not ( = ?auto_758762 ?auto_758763 ) ) ( not ( = ?auto_758762 ?auto_758765 ) ) ( not ( = ?auto_758762 ?auto_758764 ) ) ( not ( = ?auto_758762 ?auto_758766 ) ) ( not ( = ?auto_758762 ?auto_758773 ) ) ( not ( = ?auto_758762 ?auto_758770 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758765 ?auto_758764 ?auto_758766 )
      ( MAKE-5CRATE-VERIFY ?auto_758761 ?auto_758762 ?auto_758763 ?auto_758765 ?auto_758764 ?auto_758766 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_758774 - SURFACE
      ?auto_758775 - SURFACE
      ?auto_758776 - SURFACE
      ?auto_758778 - SURFACE
      ?auto_758777 - SURFACE
      ?auto_758779 - SURFACE
      ?auto_758780 - SURFACE
    )
    :vars
    (
      ?auto_758781 - HOIST
      ?auto_758786 - PLACE
      ?auto_758782 - PLACE
      ?auto_758783 - HOIST
      ?auto_758787 - SURFACE
      ?auto_758784 - SURFACE
      ?auto_758785 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758781 ?auto_758786 ) ( IS-CRATE ?auto_758780 ) ( not ( = ?auto_758779 ?auto_758780 ) ) ( not ( = ?auto_758777 ?auto_758779 ) ) ( not ( = ?auto_758777 ?auto_758780 ) ) ( not ( = ?auto_758782 ?auto_758786 ) ) ( HOIST-AT ?auto_758783 ?auto_758782 ) ( not ( = ?auto_758781 ?auto_758783 ) ) ( SURFACE-AT ?auto_758780 ?auto_758782 ) ( ON ?auto_758780 ?auto_758787 ) ( CLEAR ?auto_758780 ) ( not ( = ?auto_758779 ?auto_758787 ) ) ( not ( = ?auto_758780 ?auto_758787 ) ) ( not ( = ?auto_758777 ?auto_758787 ) ) ( IS-CRATE ?auto_758779 ) ( AVAILABLE ?auto_758783 ) ( SURFACE-AT ?auto_758779 ?auto_758782 ) ( ON ?auto_758779 ?auto_758784 ) ( CLEAR ?auto_758779 ) ( not ( = ?auto_758779 ?auto_758784 ) ) ( not ( = ?auto_758780 ?auto_758784 ) ) ( not ( = ?auto_758777 ?auto_758784 ) ) ( not ( = ?auto_758787 ?auto_758784 ) ) ( TRUCK-AT ?auto_758785 ?auto_758786 ) ( SURFACE-AT ?auto_758778 ?auto_758786 ) ( CLEAR ?auto_758778 ) ( LIFTING ?auto_758781 ?auto_758777 ) ( IS-CRATE ?auto_758777 ) ( not ( = ?auto_758778 ?auto_758777 ) ) ( not ( = ?auto_758779 ?auto_758778 ) ) ( not ( = ?auto_758780 ?auto_758778 ) ) ( not ( = ?auto_758787 ?auto_758778 ) ) ( not ( = ?auto_758784 ?auto_758778 ) ) ( ON ?auto_758775 ?auto_758774 ) ( ON ?auto_758776 ?auto_758775 ) ( ON ?auto_758778 ?auto_758776 ) ( not ( = ?auto_758774 ?auto_758775 ) ) ( not ( = ?auto_758774 ?auto_758776 ) ) ( not ( = ?auto_758774 ?auto_758778 ) ) ( not ( = ?auto_758774 ?auto_758777 ) ) ( not ( = ?auto_758774 ?auto_758779 ) ) ( not ( = ?auto_758774 ?auto_758780 ) ) ( not ( = ?auto_758774 ?auto_758787 ) ) ( not ( = ?auto_758774 ?auto_758784 ) ) ( not ( = ?auto_758775 ?auto_758776 ) ) ( not ( = ?auto_758775 ?auto_758778 ) ) ( not ( = ?auto_758775 ?auto_758777 ) ) ( not ( = ?auto_758775 ?auto_758779 ) ) ( not ( = ?auto_758775 ?auto_758780 ) ) ( not ( = ?auto_758775 ?auto_758787 ) ) ( not ( = ?auto_758775 ?auto_758784 ) ) ( not ( = ?auto_758776 ?auto_758778 ) ) ( not ( = ?auto_758776 ?auto_758777 ) ) ( not ( = ?auto_758776 ?auto_758779 ) ) ( not ( = ?auto_758776 ?auto_758780 ) ) ( not ( = ?auto_758776 ?auto_758787 ) ) ( not ( = ?auto_758776 ?auto_758784 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758777 ?auto_758779 ?auto_758780 )
      ( MAKE-6CRATE-VERIFY ?auto_758774 ?auto_758775 ?auto_758776 ?auto_758778 ?auto_758777 ?auto_758779 ?auto_758780 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_758788 - SURFACE
      ?auto_758789 - SURFACE
      ?auto_758790 - SURFACE
      ?auto_758792 - SURFACE
      ?auto_758791 - SURFACE
      ?auto_758793 - SURFACE
      ?auto_758794 - SURFACE
      ?auto_758795 - SURFACE
    )
    :vars
    (
      ?auto_758796 - HOIST
      ?auto_758801 - PLACE
      ?auto_758797 - PLACE
      ?auto_758798 - HOIST
      ?auto_758802 - SURFACE
      ?auto_758799 - SURFACE
      ?auto_758800 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758796 ?auto_758801 ) ( IS-CRATE ?auto_758795 ) ( not ( = ?auto_758794 ?auto_758795 ) ) ( not ( = ?auto_758793 ?auto_758794 ) ) ( not ( = ?auto_758793 ?auto_758795 ) ) ( not ( = ?auto_758797 ?auto_758801 ) ) ( HOIST-AT ?auto_758798 ?auto_758797 ) ( not ( = ?auto_758796 ?auto_758798 ) ) ( SURFACE-AT ?auto_758795 ?auto_758797 ) ( ON ?auto_758795 ?auto_758802 ) ( CLEAR ?auto_758795 ) ( not ( = ?auto_758794 ?auto_758802 ) ) ( not ( = ?auto_758795 ?auto_758802 ) ) ( not ( = ?auto_758793 ?auto_758802 ) ) ( IS-CRATE ?auto_758794 ) ( AVAILABLE ?auto_758798 ) ( SURFACE-AT ?auto_758794 ?auto_758797 ) ( ON ?auto_758794 ?auto_758799 ) ( CLEAR ?auto_758794 ) ( not ( = ?auto_758794 ?auto_758799 ) ) ( not ( = ?auto_758795 ?auto_758799 ) ) ( not ( = ?auto_758793 ?auto_758799 ) ) ( not ( = ?auto_758802 ?auto_758799 ) ) ( TRUCK-AT ?auto_758800 ?auto_758801 ) ( SURFACE-AT ?auto_758791 ?auto_758801 ) ( CLEAR ?auto_758791 ) ( LIFTING ?auto_758796 ?auto_758793 ) ( IS-CRATE ?auto_758793 ) ( not ( = ?auto_758791 ?auto_758793 ) ) ( not ( = ?auto_758794 ?auto_758791 ) ) ( not ( = ?auto_758795 ?auto_758791 ) ) ( not ( = ?auto_758802 ?auto_758791 ) ) ( not ( = ?auto_758799 ?auto_758791 ) ) ( ON ?auto_758789 ?auto_758788 ) ( ON ?auto_758790 ?auto_758789 ) ( ON ?auto_758792 ?auto_758790 ) ( ON ?auto_758791 ?auto_758792 ) ( not ( = ?auto_758788 ?auto_758789 ) ) ( not ( = ?auto_758788 ?auto_758790 ) ) ( not ( = ?auto_758788 ?auto_758792 ) ) ( not ( = ?auto_758788 ?auto_758791 ) ) ( not ( = ?auto_758788 ?auto_758793 ) ) ( not ( = ?auto_758788 ?auto_758794 ) ) ( not ( = ?auto_758788 ?auto_758795 ) ) ( not ( = ?auto_758788 ?auto_758802 ) ) ( not ( = ?auto_758788 ?auto_758799 ) ) ( not ( = ?auto_758789 ?auto_758790 ) ) ( not ( = ?auto_758789 ?auto_758792 ) ) ( not ( = ?auto_758789 ?auto_758791 ) ) ( not ( = ?auto_758789 ?auto_758793 ) ) ( not ( = ?auto_758789 ?auto_758794 ) ) ( not ( = ?auto_758789 ?auto_758795 ) ) ( not ( = ?auto_758789 ?auto_758802 ) ) ( not ( = ?auto_758789 ?auto_758799 ) ) ( not ( = ?auto_758790 ?auto_758792 ) ) ( not ( = ?auto_758790 ?auto_758791 ) ) ( not ( = ?auto_758790 ?auto_758793 ) ) ( not ( = ?auto_758790 ?auto_758794 ) ) ( not ( = ?auto_758790 ?auto_758795 ) ) ( not ( = ?auto_758790 ?auto_758802 ) ) ( not ( = ?auto_758790 ?auto_758799 ) ) ( not ( = ?auto_758792 ?auto_758791 ) ) ( not ( = ?auto_758792 ?auto_758793 ) ) ( not ( = ?auto_758792 ?auto_758794 ) ) ( not ( = ?auto_758792 ?auto_758795 ) ) ( not ( = ?auto_758792 ?auto_758802 ) ) ( not ( = ?auto_758792 ?auto_758799 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758793 ?auto_758794 ?auto_758795 )
      ( MAKE-7CRATE-VERIFY ?auto_758788 ?auto_758789 ?auto_758790 ?auto_758792 ?auto_758791 ?auto_758793 ?auto_758794 ?auto_758795 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_758803 - SURFACE
      ?auto_758804 - SURFACE
      ?auto_758805 - SURFACE
      ?auto_758807 - SURFACE
      ?auto_758806 - SURFACE
      ?auto_758808 - SURFACE
      ?auto_758809 - SURFACE
      ?auto_758810 - SURFACE
      ?auto_758811 - SURFACE
    )
    :vars
    (
      ?auto_758812 - HOIST
      ?auto_758817 - PLACE
      ?auto_758813 - PLACE
      ?auto_758814 - HOIST
      ?auto_758818 - SURFACE
      ?auto_758815 - SURFACE
      ?auto_758816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758812 ?auto_758817 ) ( IS-CRATE ?auto_758811 ) ( not ( = ?auto_758810 ?auto_758811 ) ) ( not ( = ?auto_758809 ?auto_758810 ) ) ( not ( = ?auto_758809 ?auto_758811 ) ) ( not ( = ?auto_758813 ?auto_758817 ) ) ( HOIST-AT ?auto_758814 ?auto_758813 ) ( not ( = ?auto_758812 ?auto_758814 ) ) ( SURFACE-AT ?auto_758811 ?auto_758813 ) ( ON ?auto_758811 ?auto_758818 ) ( CLEAR ?auto_758811 ) ( not ( = ?auto_758810 ?auto_758818 ) ) ( not ( = ?auto_758811 ?auto_758818 ) ) ( not ( = ?auto_758809 ?auto_758818 ) ) ( IS-CRATE ?auto_758810 ) ( AVAILABLE ?auto_758814 ) ( SURFACE-AT ?auto_758810 ?auto_758813 ) ( ON ?auto_758810 ?auto_758815 ) ( CLEAR ?auto_758810 ) ( not ( = ?auto_758810 ?auto_758815 ) ) ( not ( = ?auto_758811 ?auto_758815 ) ) ( not ( = ?auto_758809 ?auto_758815 ) ) ( not ( = ?auto_758818 ?auto_758815 ) ) ( TRUCK-AT ?auto_758816 ?auto_758817 ) ( SURFACE-AT ?auto_758808 ?auto_758817 ) ( CLEAR ?auto_758808 ) ( LIFTING ?auto_758812 ?auto_758809 ) ( IS-CRATE ?auto_758809 ) ( not ( = ?auto_758808 ?auto_758809 ) ) ( not ( = ?auto_758810 ?auto_758808 ) ) ( not ( = ?auto_758811 ?auto_758808 ) ) ( not ( = ?auto_758818 ?auto_758808 ) ) ( not ( = ?auto_758815 ?auto_758808 ) ) ( ON ?auto_758804 ?auto_758803 ) ( ON ?auto_758805 ?auto_758804 ) ( ON ?auto_758807 ?auto_758805 ) ( ON ?auto_758806 ?auto_758807 ) ( ON ?auto_758808 ?auto_758806 ) ( not ( = ?auto_758803 ?auto_758804 ) ) ( not ( = ?auto_758803 ?auto_758805 ) ) ( not ( = ?auto_758803 ?auto_758807 ) ) ( not ( = ?auto_758803 ?auto_758806 ) ) ( not ( = ?auto_758803 ?auto_758808 ) ) ( not ( = ?auto_758803 ?auto_758809 ) ) ( not ( = ?auto_758803 ?auto_758810 ) ) ( not ( = ?auto_758803 ?auto_758811 ) ) ( not ( = ?auto_758803 ?auto_758818 ) ) ( not ( = ?auto_758803 ?auto_758815 ) ) ( not ( = ?auto_758804 ?auto_758805 ) ) ( not ( = ?auto_758804 ?auto_758807 ) ) ( not ( = ?auto_758804 ?auto_758806 ) ) ( not ( = ?auto_758804 ?auto_758808 ) ) ( not ( = ?auto_758804 ?auto_758809 ) ) ( not ( = ?auto_758804 ?auto_758810 ) ) ( not ( = ?auto_758804 ?auto_758811 ) ) ( not ( = ?auto_758804 ?auto_758818 ) ) ( not ( = ?auto_758804 ?auto_758815 ) ) ( not ( = ?auto_758805 ?auto_758807 ) ) ( not ( = ?auto_758805 ?auto_758806 ) ) ( not ( = ?auto_758805 ?auto_758808 ) ) ( not ( = ?auto_758805 ?auto_758809 ) ) ( not ( = ?auto_758805 ?auto_758810 ) ) ( not ( = ?auto_758805 ?auto_758811 ) ) ( not ( = ?auto_758805 ?auto_758818 ) ) ( not ( = ?auto_758805 ?auto_758815 ) ) ( not ( = ?auto_758807 ?auto_758806 ) ) ( not ( = ?auto_758807 ?auto_758808 ) ) ( not ( = ?auto_758807 ?auto_758809 ) ) ( not ( = ?auto_758807 ?auto_758810 ) ) ( not ( = ?auto_758807 ?auto_758811 ) ) ( not ( = ?auto_758807 ?auto_758818 ) ) ( not ( = ?auto_758807 ?auto_758815 ) ) ( not ( = ?auto_758806 ?auto_758808 ) ) ( not ( = ?auto_758806 ?auto_758809 ) ) ( not ( = ?auto_758806 ?auto_758810 ) ) ( not ( = ?auto_758806 ?auto_758811 ) ) ( not ( = ?auto_758806 ?auto_758818 ) ) ( not ( = ?auto_758806 ?auto_758815 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758809 ?auto_758810 ?auto_758811 )
      ( MAKE-8CRATE-VERIFY ?auto_758803 ?auto_758804 ?auto_758805 ?auto_758807 ?auto_758806 ?auto_758808 ?auto_758809 ?auto_758810 ?auto_758811 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_758819 - SURFACE
      ?auto_758820 - SURFACE
      ?auto_758821 - SURFACE
      ?auto_758823 - SURFACE
      ?auto_758822 - SURFACE
      ?auto_758824 - SURFACE
      ?auto_758825 - SURFACE
      ?auto_758826 - SURFACE
      ?auto_758827 - SURFACE
      ?auto_758828 - SURFACE
    )
    :vars
    (
      ?auto_758829 - HOIST
      ?auto_758834 - PLACE
      ?auto_758830 - PLACE
      ?auto_758831 - HOIST
      ?auto_758835 - SURFACE
      ?auto_758832 - SURFACE
      ?auto_758833 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758829 ?auto_758834 ) ( IS-CRATE ?auto_758828 ) ( not ( = ?auto_758827 ?auto_758828 ) ) ( not ( = ?auto_758826 ?auto_758827 ) ) ( not ( = ?auto_758826 ?auto_758828 ) ) ( not ( = ?auto_758830 ?auto_758834 ) ) ( HOIST-AT ?auto_758831 ?auto_758830 ) ( not ( = ?auto_758829 ?auto_758831 ) ) ( SURFACE-AT ?auto_758828 ?auto_758830 ) ( ON ?auto_758828 ?auto_758835 ) ( CLEAR ?auto_758828 ) ( not ( = ?auto_758827 ?auto_758835 ) ) ( not ( = ?auto_758828 ?auto_758835 ) ) ( not ( = ?auto_758826 ?auto_758835 ) ) ( IS-CRATE ?auto_758827 ) ( AVAILABLE ?auto_758831 ) ( SURFACE-AT ?auto_758827 ?auto_758830 ) ( ON ?auto_758827 ?auto_758832 ) ( CLEAR ?auto_758827 ) ( not ( = ?auto_758827 ?auto_758832 ) ) ( not ( = ?auto_758828 ?auto_758832 ) ) ( not ( = ?auto_758826 ?auto_758832 ) ) ( not ( = ?auto_758835 ?auto_758832 ) ) ( TRUCK-AT ?auto_758833 ?auto_758834 ) ( SURFACE-AT ?auto_758825 ?auto_758834 ) ( CLEAR ?auto_758825 ) ( LIFTING ?auto_758829 ?auto_758826 ) ( IS-CRATE ?auto_758826 ) ( not ( = ?auto_758825 ?auto_758826 ) ) ( not ( = ?auto_758827 ?auto_758825 ) ) ( not ( = ?auto_758828 ?auto_758825 ) ) ( not ( = ?auto_758835 ?auto_758825 ) ) ( not ( = ?auto_758832 ?auto_758825 ) ) ( ON ?auto_758820 ?auto_758819 ) ( ON ?auto_758821 ?auto_758820 ) ( ON ?auto_758823 ?auto_758821 ) ( ON ?auto_758822 ?auto_758823 ) ( ON ?auto_758824 ?auto_758822 ) ( ON ?auto_758825 ?auto_758824 ) ( not ( = ?auto_758819 ?auto_758820 ) ) ( not ( = ?auto_758819 ?auto_758821 ) ) ( not ( = ?auto_758819 ?auto_758823 ) ) ( not ( = ?auto_758819 ?auto_758822 ) ) ( not ( = ?auto_758819 ?auto_758824 ) ) ( not ( = ?auto_758819 ?auto_758825 ) ) ( not ( = ?auto_758819 ?auto_758826 ) ) ( not ( = ?auto_758819 ?auto_758827 ) ) ( not ( = ?auto_758819 ?auto_758828 ) ) ( not ( = ?auto_758819 ?auto_758835 ) ) ( not ( = ?auto_758819 ?auto_758832 ) ) ( not ( = ?auto_758820 ?auto_758821 ) ) ( not ( = ?auto_758820 ?auto_758823 ) ) ( not ( = ?auto_758820 ?auto_758822 ) ) ( not ( = ?auto_758820 ?auto_758824 ) ) ( not ( = ?auto_758820 ?auto_758825 ) ) ( not ( = ?auto_758820 ?auto_758826 ) ) ( not ( = ?auto_758820 ?auto_758827 ) ) ( not ( = ?auto_758820 ?auto_758828 ) ) ( not ( = ?auto_758820 ?auto_758835 ) ) ( not ( = ?auto_758820 ?auto_758832 ) ) ( not ( = ?auto_758821 ?auto_758823 ) ) ( not ( = ?auto_758821 ?auto_758822 ) ) ( not ( = ?auto_758821 ?auto_758824 ) ) ( not ( = ?auto_758821 ?auto_758825 ) ) ( not ( = ?auto_758821 ?auto_758826 ) ) ( not ( = ?auto_758821 ?auto_758827 ) ) ( not ( = ?auto_758821 ?auto_758828 ) ) ( not ( = ?auto_758821 ?auto_758835 ) ) ( not ( = ?auto_758821 ?auto_758832 ) ) ( not ( = ?auto_758823 ?auto_758822 ) ) ( not ( = ?auto_758823 ?auto_758824 ) ) ( not ( = ?auto_758823 ?auto_758825 ) ) ( not ( = ?auto_758823 ?auto_758826 ) ) ( not ( = ?auto_758823 ?auto_758827 ) ) ( not ( = ?auto_758823 ?auto_758828 ) ) ( not ( = ?auto_758823 ?auto_758835 ) ) ( not ( = ?auto_758823 ?auto_758832 ) ) ( not ( = ?auto_758822 ?auto_758824 ) ) ( not ( = ?auto_758822 ?auto_758825 ) ) ( not ( = ?auto_758822 ?auto_758826 ) ) ( not ( = ?auto_758822 ?auto_758827 ) ) ( not ( = ?auto_758822 ?auto_758828 ) ) ( not ( = ?auto_758822 ?auto_758835 ) ) ( not ( = ?auto_758822 ?auto_758832 ) ) ( not ( = ?auto_758824 ?auto_758825 ) ) ( not ( = ?auto_758824 ?auto_758826 ) ) ( not ( = ?auto_758824 ?auto_758827 ) ) ( not ( = ?auto_758824 ?auto_758828 ) ) ( not ( = ?auto_758824 ?auto_758835 ) ) ( not ( = ?auto_758824 ?auto_758832 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758826 ?auto_758827 ?auto_758828 )
      ( MAKE-9CRATE-VERIFY ?auto_758819 ?auto_758820 ?auto_758821 ?auto_758823 ?auto_758822 ?auto_758824 ?auto_758825 ?auto_758826 ?auto_758827 ?auto_758828 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_763726 - SURFACE
      ?auto_763727 - SURFACE
      ?auto_763728 - SURFACE
      ?auto_763730 - SURFACE
      ?auto_763729 - SURFACE
      ?auto_763731 - SURFACE
      ?auto_763732 - SURFACE
      ?auto_763733 - SURFACE
      ?auto_763734 - SURFACE
      ?auto_763735 - SURFACE
      ?auto_763736 - SURFACE
    )
    :vars
    (
      ?auto_763738 - HOIST
      ?auto_763737 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_763738 ?auto_763737 ) ( SURFACE-AT ?auto_763735 ?auto_763737 ) ( CLEAR ?auto_763735 ) ( LIFTING ?auto_763738 ?auto_763736 ) ( IS-CRATE ?auto_763736 ) ( not ( = ?auto_763735 ?auto_763736 ) ) ( ON ?auto_763727 ?auto_763726 ) ( ON ?auto_763728 ?auto_763727 ) ( ON ?auto_763730 ?auto_763728 ) ( ON ?auto_763729 ?auto_763730 ) ( ON ?auto_763731 ?auto_763729 ) ( ON ?auto_763732 ?auto_763731 ) ( ON ?auto_763733 ?auto_763732 ) ( ON ?auto_763734 ?auto_763733 ) ( ON ?auto_763735 ?auto_763734 ) ( not ( = ?auto_763726 ?auto_763727 ) ) ( not ( = ?auto_763726 ?auto_763728 ) ) ( not ( = ?auto_763726 ?auto_763730 ) ) ( not ( = ?auto_763726 ?auto_763729 ) ) ( not ( = ?auto_763726 ?auto_763731 ) ) ( not ( = ?auto_763726 ?auto_763732 ) ) ( not ( = ?auto_763726 ?auto_763733 ) ) ( not ( = ?auto_763726 ?auto_763734 ) ) ( not ( = ?auto_763726 ?auto_763735 ) ) ( not ( = ?auto_763726 ?auto_763736 ) ) ( not ( = ?auto_763727 ?auto_763728 ) ) ( not ( = ?auto_763727 ?auto_763730 ) ) ( not ( = ?auto_763727 ?auto_763729 ) ) ( not ( = ?auto_763727 ?auto_763731 ) ) ( not ( = ?auto_763727 ?auto_763732 ) ) ( not ( = ?auto_763727 ?auto_763733 ) ) ( not ( = ?auto_763727 ?auto_763734 ) ) ( not ( = ?auto_763727 ?auto_763735 ) ) ( not ( = ?auto_763727 ?auto_763736 ) ) ( not ( = ?auto_763728 ?auto_763730 ) ) ( not ( = ?auto_763728 ?auto_763729 ) ) ( not ( = ?auto_763728 ?auto_763731 ) ) ( not ( = ?auto_763728 ?auto_763732 ) ) ( not ( = ?auto_763728 ?auto_763733 ) ) ( not ( = ?auto_763728 ?auto_763734 ) ) ( not ( = ?auto_763728 ?auto_763735 ) ) ( not ( = ?auto_763728 ?auto_763736 ) ) ( not ( = ?auto_763730 ?auto_763729 ) ) ( not ( = ?auto_763730 ?auto_763731 ) ) ( not ( = ?auto_763730 ?auto_763732 ) ) ( not ( = ?auto_763730 ?auto_763733 ) ) ( not ( = ?auto_763730 ?auto_763734 ) ) ( not ( = ?auto_763730 ?auto_763735 ) ) ( not ( = ?auto_763730 ?auto_763736 ) ) ( not ( = ?auto_763729 ?auto_763731 ) ) ( not ( = ?auto_763729 ?auto_763732 ) ) ( not ( = ?auto_763729 ?auto_763733 ) ) ( not ( = ?auto_763729 ?auto_763734 ) ) ( not ( = ?auto_763729 ?auto_763735 ) ) ( not ( = ?auto_763729 ?auto_763736 ) ) ( not ( = ?auto_763731 ?auto_763732 ) ) ( not ( = ?auto_763731 ?auto_763733 ) ) ( not ( = ?auto_763731 ?auto_763734 ) ) ( not ( = ?auto_763731 ?auto_763735 ) ) ( not ( = ?auto_763731 ?auto_763736 ) ) ( not ( = ?auto_763732 ?auto_763733 ) ) ( not ( = ?auto_763732 ?auto_763734 ) ) ( not ( = ?auto_763732 ?auto_763735 ) ) ( not ( = ?auto_763732 ?auto_763736 ) ) ( not ( = ?auto_763733 ?auto_763734 ) ) ( not ( = ?auto_763733 ?auto_763735 ) ) ( not ( = ?auto_763733 ?auto_763736 ) ) ( not ( = ?auto_763734 ?auto_763735 ) ) ( not ( = ?auto_763734 ?auto_763736 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_763735 ?auto_763736 )
      ( MAKE-10CRATE-VERIFY ?auto_763726 ?auto_763727 ?auto_763728 ?auto_763730 ?auto_763729 ?auto_763731 ?auto_763732 ?auto_763733 ?auto_763734 ?auto_763735 ?auto_763736 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_763820 - SURFACE
      ?auto_763821 - SURFACE
      ?auto_763822 - SURFACE
      ?auto_763824 - SURFACE
      ?auto_763823 - SURFACE
      ?auto_763825 - SURFACE
      ?auto_763826 - SURFACE
      ?auto_763827 - SURFACE
      ?auto_763828 - SURFACE
      ?auto_763829 - SURFACE
      ?auto_763830 - SURFACE
    )
    :vars
    (
      ?auto_763832 - HOIST
      ?auto_763831 - PLACE
      ?auto_763833 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_763832 ?auto_763831 ) ( SURFACE-AT ?auto_763829 ?auto_763831 ) ( CLEAR ?auto_763829 ) ( IS-CRATE ?auto_763830 ) ( not ( = ?auto_763829 ?auto_763830 ) ) ( TRUCK-AT ?auto_763833 ?auto_763831 ) ( AVAILABLE ?auto_763832 ) ( IN ?auto_763830 ?auto_763833 ) ( ON ?auto_763829 ?auto_763828 ) ( not ( = ?auto_763828 ?auto_763829 ) ) ( not ( = ?auto_763828 ?auto_763830 ) ) ( ON ?auto_763821 ?auto_763820 ) ( ON ?auto_763822 ?auto_763821 ) ( ON ?auto_763824 ?auto_763822 ) ( ON ?auto_763823 ?auto_763824 ) ( ON ?auto_763825 ?auto_763823 ) ( ON ?auto_763826 ?auto_763825 ) ( ON ?auto_763827 ?auto_763826 ) ( ON ?auto_763828 ?auto_763827 ) ( not ( = ?auto_763820 ?auto_763821 ) ) ( not ( = ?auto_763820 ?auto_763822 ) ) ( not ( = ?auto_763820 ?auto_763824 ) ) ( not ( = ?auto_763820 ?auto_763823 ) ) ( not ( = ?auto_763820 ?auto_763825 ) ) ( not ( = ?auto_763820 ?auto_763826 ) ) ( not ( = ?auto_763820 ?auto_763827 ) ) ( not ( = ?auto_763820 ?auto_763828 ) ) ( not ( = ?auto_763820 ?auto_763829 ) ) ( not ( = ?auto_763820 ?auto_763830 ) ) ( not ( = ?auto_763821 ?auto_763822 ) ) ( not ( = ?auto_763821 ?auto_763824 ) ) ( not ( = ?auto_763821 ?auto_763823 ) ) ( not ( = ?auto_763821 ?auto_763825 ) ) ( not ( = ?auto_763821 ?auto_763826 ) ) ( not ( = ?auto_763821 ?auto_763827 ) ) ( not ( = ?auto_763821 ?auto_763828 ) ) ( not ( = ?auto_763821 ?auto_763829 ) ) ( not ( = ?auto_763821 ?auto_763830 ) ) ( not ( = ?auto_763822 ?auto_763824 ) ) ( not ( = ?auto_763822 ?auto_763823 ) ) ( not ( = ?auto_763822 ?auto_763825 ) ) ( not ( = ?auto_763822 ?auto_763826 ) ) ( not ( = ?auto_763822 ?auto_763827 ) ) ( not ( = ?auto_763822 ?auto_763828 ) ) ( not ( = ?auto_763822 ?auto_763829 ) ) ( not ( = ?auto_763822 ?auto_763830 ) ) ( not ( = ?auto_763824 ?auto_763823 ) ) ( not ( = ?auto_763824 ?auto_763825 ) ) ( not ( = ?auto_763824 ?auto_763826 ) ) ( not ( = ?auto_763824 ?auto_763827 ) ) ( not ( = ?auto_763824 ?auto_763828 ) ) ( not ( = ?auto_763824 ?auto_763829 ) ) ( not ( = ?auto_763824 ?auto_763830 ) ) ( not ( = ?auto_763823 ?auto_763825 ) ) ( not ( = ?auto_763823 ?auto_763826 ) ) ( not ( = ?auto_763823 ?auto_763827 ) ) ( not ( = ?auto_763823 ?auto_763828 ) ) ( not ( = ?auto_763823 ?auto_763829 ) ) ( not ( = ?auto_763823 ?auto_763830 ) ) ( not ( = ?auto_763825 ?auto_763826 ) ) ( not ( = ?auto_763825 ?auto_763827 ) ) ( not ( = ?auto_763825 ?auto_763828 ) ) ( not ( = ?auto_763825 ?auto_763829 ) ) ( not ( = ?auto_763825 ?auto_763830 ) ) ( not ( = ?auto_763826 ?auto_763827 ) ) ( not ( = ?auto_763826 ?auto_763828 ) ) ( not ( = ?auto_763826 ?auto_763829 ) ) ( not ( = ?auto_763826 ?auto_763830 ) ) ( not ( = ?auto_763827 ?auto_763828 ) ) ( not ( = ?auto_763827 ?auto_763829 ) ) ( not ( = ?auto_763827 ?auto_763830 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_763828 ?auto_763829 ?auto_763830 )
      ( MAKE-10CRATE-VERIFY ?auto_763820 ?auto_763821 ?auto_763822 ?auto_763824 ?auto_763823 ?auto_763825 ?auto_763826 ?auto_763827 ?auto_763828 ?auto_763829 ?auto_763830 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_763925 - SURFACE
      ?auto_763926 - SURFACE
      ?auto_763927 - SURFACE
      ?auto_763929 - SURFACE
      ?auto_763928 - SURFACE
      ?auto_763930 - SURFACE
      ?auto_763931 - SURFACE
      ?auto_763932 - SURFACE
      ?auto_763933 - SURFACE
      ?auto_763934 - SURFACE
      ?auto_763935 - SURFACE
    )
    :vars
    (
      ?auto_763937 - HOIST
      ?auto_763936 - PLACE
      ?auto_763939 - TRUCK
      ?auto_763938 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_763937 ?auto_763936 ) ( SURFACE-AT ?auto_763934 ?auto_763936 ) ( CLEAR ?auto_763934 ) ( IS-CRATE ?auto_763935 ) ( not ( = ?auto_763934 ?auto_763935 ) ) ( AVAILABLE ?auto_763937 ) ( IN ?auto_763935 ?auto_763939 ) ( ON ?auto_763934 ?auto_763933 ) ( not ( = ?auto_763933 ?auto_763934 ) ) ( not ( = ?auto_763933 ?auto_763935 ) ) ( TRUCK-AT ?auto_763939 ?auto_763938 ) ( not ( = ?auto_763938 ?auto_763936 ) ) ( ON ?auto_763926 ?auto_763925 ) ( ON ?auto_763927 ?auto_763926 ) ( ON ?auto_763929 ?auto_763927 ) ( ON ?auto_763928 ?auto_763929 ) ( ON ?auto_763930 ?auto_763928 ) ( ON ?auto_763931 ?auto_763930 ) ( ON ?auto_763932 ?auto_763931 ) ( ON ?auto_763933 ?auto_763932 ) ( not ( = ?auto_763925 ?auto_763926 ) ) ( not ( = ?auto_763925 ?auto_763927 ) ) ( not ( = ?auto_763925 ?auto_763929 ) ) ( not ( = ?auto_763925 ?auto_763928 ) ) ( not ( = ?auto_763925 ?auto_763930 ) ) ( not ( = ?auto_763925 ?auto_763931 ) ) ( not ( = ?auto_763925 ?auto_763932 ) ) ( not ( = ?auto_763925 ?auto_763933 ) ) ( not ( = ?auto_763925 ?auto_763934 ) ) ( not ( = ?auto_763925 ?auto_763935 ) ) ( not ( = ?auto_763926 ?auto_763927 ) ) ( not ( = ?auto_763926 ?auto_763929 ) ) ( not ( = ?auto_763926 ?auto_763928 ) ) ( not ( = ?auto_763926 ?auto_763930 ) ) ( not ( = ?auto_763926 ?auto_763931 ) ) ( not ( = ?auto_763926 ?auto_763932 ) ) ( not ( = ?auto_763926 ?auto_763933 ) ) ( not ( = ?auto_763926 ?auto_763934 ) ) ( not ( = ?auto_763926 ?auto_763935 ) ) ( not ( = ?auto_763927 ?auto_763929 ) ) ( not ( = ?auto_763927 ?auto_763928 ) ) ( not ( = ?auto_763927 ?auto_763930 ) ) ( not ( = ?auto_763927 ?auto_763931 ) ) ( not ( = ?auto_763927 ?auto_763932 ) ) ( not ( = ?auto_763927 ?auto_763933 ) ) ( not ( = ?auto_763927 ?auto_763934 ) ) ( not ( = ?auto_763927 ?auto_763935 ) ) ( not ( = ?auto_763929 ?auto_763928 ) ) ( not ( = ?auto_763929 ?auto_763930 ) ) ( not ( = ?auto_763929 ?auto_763931 ) ) ( not ( = ?auto_763929 ?auto_763932 ) ) ( not ( = ?auto_763929 ?auto_763933 ) ) ( not ( = ?auto_763929 ?auto_763934 ) ) ( not ( = ?auto_763929 ?auto_763935 ) ) ( not ( = ?auto_763928 ?auto_763930 ) ) ( not ( = ?auto_763928 ?auto_763931 ) ) ( not ( = ?auto_763928 ?auto_763932 ) ) ( not ( = ?auto_763928 ?auto_763933 ) ) ( not ( = ?auto_763928 ?auto_763934 ) ) ( not ( = ?auto_763928 ?auto_763935 ) ) ( not ( = ?auto_763930 ?auto_763931 ) ) ( not ( = ?auto_763930 ?auto_763932 ) ) ( not ( = ?auto_763930 ?auto_763933 ) ) ( not ( = ?auto_763930 ?auto_763934 ) ) ( not ( = ?auto_763930 ?auto_763935 ) ) ( not ( = ?auto_763931 ?auto_763932 ) ) ( not ( = ?auto_763931 ?auto_763933 ) ) ( not ( = ?auto_763931 ?auto_763934 ) ) ( not ( = ?auto_763931 ?auto_763935 ) ) ( not ( = ?auto_763932 ?auto_763933 ) ) ( not ( = ?auto_763932 ?auto_763934 ) ) ( not ( = ?auto_763932 ?auto_763935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_763933 ?auto_763934 ?auto_763935 )
      ( MAKE-10CRATE-VERIFY ?auto_763925 ?auto_763926 ?auto_763927 ?auto_763929 ?auto_763928 ?auto_763930 ?auto_763931 ?auto_763932 ?auto_763933 ?auto_763934 ?auto_763935 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_764040 - SURFACE
      ?auto_764041 - SURFACE
      ?auto_764042 - SURFACE
      ?auto_764044 - SURFACE
      ?auto_764043 - SURFACE
      ?auto_764045 - SURFACE
      ?auto_764046 - SURFACE
      ?auto_764047 - SURFACE
      ?auto_764048 - SURFACE
      ?auto_764049 - SURFACE
      ?auto_764050 - SURFACE
    )
    :vars
    (
      ?auto_764055 - HOIST
      ?auto_764051 - PLACE
      ?auto_764052 - TRUCK
      ?auto_764053 - PLACE
      ?auto_764054 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_764055 ?auto_764051 ) ( SURFACE-AT ?auto_764049 ?auto_764051 ) ( CLEAR ?auto_764049 ) ( IS-CRATE ?auto_764050 ) ( not ( = ?auto_764049 ?auto_764050 ) ) ( AVAILABLE ?auto_764055 ) ( ON ?auto_764049 ?auto_764048 ) ( not ( = ?auto_764048 ?auto_764049 ) ) ( not ( = ?auto_764048 ?auto_764050 ) ) ( TRUCK-AT ?auto_764052 ?auto_764053 ) ( not ( = ?auto_764053 ?auto_764051 ) ) ( HOIST-AT ?auto_764054 ?auto_764053 ) ( LIFTING ?auto_764054 ?auto_764050 ) ( not ( = ?auto_764055 ?auto_764054 ) ) ( ON ?auto_764041 ?auto_764040 ) ( ON ?auto_764042 ?auto_764041 ) ( ON ?auto_764044 ?auto_764042 ) ( ON ?auto_764043 ?auto_764044 ) ( ON ?auto_764045 ?auto_764043 ) ( ON ?auto_764046 ?auto_764045 ) ( ON ?auto_764047 ?auto_764046 ) ( ON ?auto_764048 ?auto_764047 ) ( not ( = ?auto_764040 ?auto_764041 ) ) ( not ( = ?auto_764040 ?auto_764042 ) ) ( not ( = ?auto_764040 ?auto_764044 ) ) ( not ( = ?auto_764040 ?auto_764043 ) ) ( not ( = ?auto_764040 ?auto_764045 ) ) ( not ( = ?auto_764040 ?auto_764046 ) ) ( not ( = ?auto_764040 ?auto_764047 ) ) ( not ( = ?auto_764040 ?auto_764048 ) ) ( not ( = ?auto_764040 ?auto_764049 ) ) ( not ( = ?auto_764040 ?auto_764050 ) ) ( not ( = ?auto_764041 ?auto_764042 ) ) ( not ( = ?auto_764041 ?auto_764044 ) ) ( not ( = ?auto_764041 ?auto_764043 ) ) ( not ( = ?auto_764041 ?auto_764045 ) ) ( not ( = ?auto_764041 ?auto_764046 ) ) ( not ( = ?auto_764041 ?auto_764047 ) ) ( not ( = ?auto_764041 ?auto_764048 ) ) ( not ( = ?auto_764041 ?auto_764049 ) ) ( not ( = ?auto_764041 ?auto_764050 ) ) ( not ( = ?auto_764042 ?auto_764044 ) ) ( not ( = ?auto_764042 ?auto_764043 ) ) ( not ( = ?auto_764042 ?auto_764045 ) ) ( not ( = ?auto_764042 ?auto_764046 ) ) ( not ( = ?auto_764042 ?auto_764047 ) ) ( not ( = ?auto_764042 ?auto_764048 ) ) ( not ( = ?auto_764042 ?auto_764049 ) ) ( not ( = ?auto_764042 ?auto_764050 ) ) ( not ( = ?auto_764044 ?auto_764043 ) ) ( not ( = ?auto_764044 ?auto_764045 ) ) ( not ( = ?auto_764044 ?auto_764046 ) ) ( not ( = ?auto_764044 ?auto_764047 ) ) ( not ( = ?auto_764044 ?auto_764048 ) ) ( not ( = ?auto_764044 ?auto_764049 ) ) ( not ( = ?auto_764044 ?auto_764050 ) ) ( not ( = ?auto_764043 ?auto_764045 ) ) ( not ( = ?auto_764043 ?auto_764046 ) ) ( not ( = ?auto_764043 ?auto_764047 ) ) ( not ( = ?auto_764043 ?auto_764048 ) ) ( not ( = ?auto_764043 ?auto_764049 ) ) ( not ( = ?auto_764043 ?auto_764050 ) ) ( not ( = ?auto_764045 ?auto_764046 ) ) ( not ( = ?auto_764045 ?auto_764047 ) ) ( not ( = ?auto_764045 ?auto_764048 ) ) ( not ( = ?auto_764045 ?auto_764049 ) ) ( not ( = ?auto_764045 ?auto_764050 ) ) ( not ( = ?auto_764046 ?auto_764047 ) ) ( not ( = ?auto_764046 ?auto_764048 ) ) ( not ( = ?auto_764046 ?auto_764049 ) ) ( not ( = ?auto_764046 ?auto_764050 ) ) ( not ( = ?auto_764047 ?auto_764048 ) ) ( not ( = ?auto_764047 ?auto_764049 ) ) ( not ( = ?auto_764047 ?auto_764050 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_764048 ?auto_764049 ?auto_764050 )
      ( MAKE-10CRATE-VERIFY ?auto_764040 ?auto_764041 ?auto_764042 ?auto_764044 ?auto_764043 ?auto_764045 ?auto_764046 ?auto_764047 ?auto_764048 ?auto_764049 ?auto_764050 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_764165 - SURFACE
      ?auto_764166 - SURFACE
      ?auto_764167 - SURFACE
      ?auto_764169 - SURFACE
      ?auto_764168 - SURFACE
      ?auto_764170 - SURFACE
      ?auto_764171 - SURFACE
      ?auto_764172 - SURFACE
      ?auto_764173 - SURFACE
      ?auto_764174 - SURFACE
      ?auto_764175 - SURFACE
    )
    :vars
    (
      ?auto_764176 - HOIST
      ?auto_764178 - PLACE
      ?auto_764181 - TRUCK
      ?auto_764179 - PLACE
      ?auto_764177 - HOIST
      ?auto_764180 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_764176 ?auto_764178 ) ( SURFACE-AT ?auto_764174 ?auto_764178 ) ( CLEAR ?auto_764174 ) ( IS-CRATE ?auto_764175 ) ( not ( = ?auto_764174 ?auto_764175 ) ) ( AVAILABLE ?auto_764176 ) ( ON ?auto_764174 ?auto_764173 ) ( not ( = ?auto_764173 ?auto_764174 ) ) ( not ( = ?auto_764173 ?auto_764175 ) ) ( TRUCK-AT ?auto_764181 ?auto_764179 ) ( not ( = ?auto_764179 ?auto_764178 ) ) ( HOIST-AT ?auto_764177 ?auto_764179 ) ( not ( = ?auto_764176 ?auto_764177 ) ) ( AVAILABLE ?auto_764177 ) ( SURFACE-AT ?auto_764175 ?auto_764179 ) ( ON ?auto_764175 ?auto_764180 ) ( CLEAR ?auto_764175 ) ( not ( = ?auto_764174 ?auto_764180 ) ) ( not ( = ?auto_764175 ?auto_764180 ) ) ( not ( = ?auto_764173 ?auto_764180 ) ) ( ON ?auto_764166 ?auto_764165 ) ( ON ?auto_764167 ?auto_764166 ) ( ON ?auto_764169 ?auto_764167 ) ( ON ?auto_764168 ?auto_764169 ) ( ON ?auto_764170 ?auto_764168 ) ( ON ?auto_764171 ?auto_764170 ) ( ON ?auto_764172 ?auto_764171 ) ( ON ?auto_764173 ?auto_764172 ) ( not ( = ?auto_764165 ?auto_764166 ) ) ( not ( = ?auto_764165 ?auto_764167 ) ) ( not ( = ?auto_764165 ?auto_764169 ) ) ( not ( = ?auto_764165 ?auto_764168 ) ) ( not ( = ?auto_764165 ?auto_764170 ) ) ( not ( = ?auto_764165 ?auto_764171 ) ) ( not ( = ?auto_764165 ?auto_764172 ) ) ( not ( = ?auto_764165 ?auto_764173 ) ) ( not ( = ?auto_764165 ?auto_764174 ) ) ( not ( = ?auto_764165 ?auto_764175 ) ) ( not ( = ?auto_764165 ?auto_764180 ) ) ( not ( = ?auto_764166 ?auto_764167 ) ) ( not ( = ?auto_764166 ?auto_764169 ) ) ( not ( = ?auto_764166 ?auto_764168 ) ) ( not ( = ?auto_764166 ?auto_764170 ) ) ( not ( = ?auto_764166 ?auto_764171 ) ) ( not ( = ?auto_764166 ?auto_764172 ) ) ( not ( = ?auto_764166 ?auto_764173 ) ) ( not ( = ?auto_764166 ?auto_764174 ) ) ( not ( = ?auto_764166 ?auto_764175 ) ) ( not ( = ?auto_764166 ?auto_764180 ) ) ( not ( = ?auto_764167 ?auto_764169 ) ) ( not ( = ?auto_764167 ?auto_764168 ) ) ( not ( = ?auto_764167 ?auto_764170 ) ) ( not ( = ?auto_764167 ?auto_764171 ) ) ( not ( = ?auto_764167 ?auto_764172 ) ) ( not ( = ?auto_764167 ?auto_764173 ) ) ( not ( = ?auto_764167 ?auto_764174 ) ) ( not ( = ?auto_764167 ?auto_764175 ) ) ( not ( = ?auto_764167 ?auto_764180 ) ) ( not ( = ?auto_764169 ?auto_764168 ) ) ( not ( = ?auto_764169 ?auto_764170 ) ) ( not ( = ?auto_764169 ?auto_764171 ) ) ( not ( = ?auto_764169 ?auto_764172 ) ) ( not ( = ?auto_764169 ?auto_764173 ) ) ( not ( = ?auto_764169 ?auto_764174 ) ) ( not ( = ?auto_764169 ?auto_764175 ) ) ( not ( = ?auto_764169 ?auto_764180 ) ) ( not ( = ?auto_764168 ?auto_764170 ) ) ( not ( = ?auto_764168 ?auto_764171 ) ) ( not ( = ?auto_764168 ?auto_764172 ) ) ( not ( = ?auto_764168 ?auto_764173 ) ) ( not ( = ?auto_764168 ?auto_764174 ) ) ( not ( = ?auto_764168 ?auto_764175 ) ) ( not ( = ?auto_764168 ?auto_764180 ) ) ( not ( = ?auto_764170 ?auto_764171 ) ) ( not ( = ?auto_764170 ?auto_764172 ) ) ( not ( = ?auto_764170 ?auto_764173 ) ) ( not ( = ?auto_764170 ?auto_764174 ) ) ( not ( = ?auto_764170 ?auto_764175 ) ) ( not ( = ?auto_764170 ?auto_764180 ) ) ( not ( = ?auto_764171 ?auto_764172 ) ) ( not ( = ?auto_764171 ?auto_764173 ) ) ( not ( = ?auto_764171 ?auto_764174 ) ) ( not ( = ?auto_764171 ?auto_764175 ) ) ( not ( = ?auto_764171 ?auto_764180 ) ) ( not ( = ?auto_764172 ?auto_764173 ) ) ( not ( = ?auto_764172 ?auto_764174 ) ) ( not ( = ?auto_764172 ?auto_764175 ) ) ( not ( = ?auto_764172 ?auto_764180 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_764173 ?auto_764174 ?auto_764175 )
      ( MAKE-10CRATE-VERIFY ?auto_764165 ?auto_764166 ?auto_764167 ?auto_764169 ?auto_764168 ?auto_764170 ?auto_764171 ?auto_764172 ?auto_764173 ?auto_764174 ?auto_764175 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_764291 - SURFACE
      ?auto_764292 - SURFACE
      ?auto_764293 - SURFACE
      ?auto_764295 - SURFACE
      ?auto_764294 - SURFACE
      ?auto_764296 - SURFACE
      ?auto_764297 - SURFACE
      ?auto_764298 - SURFACE
      ?auto_764299 - SURFACE
      ?auto_764300 - SURFACE
      ?auto_764301 - SURFACE
    )
    :vars
    (
      ?auto_764306 - HOIST
      ?auto_764302 - PLACE
      ?auto_764303 - PLACE
      ?auto_764304 - HOIST
      ?auto_764307 - SURFACE
      ?auto_764305 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_764306 ?auto_764302 ) ( SURFACE-AT ?auto_764300 ?auto_764302 ) ( CLEAR ?auto_764300 ) ( IS-CRATE ?auto_764301 ) ( not ( = ?auto_764300 ?auto_764301 ) ) ( AVAILABLE ?auto_764306 ) ( ON ?auto_764300 ?auto_764299 ) ( not ( = ?auto_764299 ?auto_764300 ) ) ( not ( = ?auto_764299 ?auto_764301 ) ) ( not ( = ?auto_764303 ?auto_764302 ) ) ( HOIST-AT ?auto_764304 ?auto_764303 ) ( not ( = ?auto_764306 ?auto_764304 ) ) ( AVAILABLE ?auto_764304 ) ( SURFACE-AT ?auto_764301 ?auto_764303 ) ( ON ?auto_764301 ?auto_764307 ) ( CLEAR ?auto_764301 ) ( not ( = ?auto_764300 ?auto_764307 ) ) ( not ( = ?auto_764301 ?auto_764307 ) ) ( not ( = ?auto_764299 ?auto_764307 ) ) ( TRUCK-AT ?auto_764305 ?auto_764302 ) ( ON ?auto_764292 ?auto_764291 ) ( ON ?auto_764293 ?auto_764292 ) ( ON ?auto_764295 ?auto_764293 ) ( ON ?auto_764294 ?auto_764295 ) ( ON ?auto_764296 ?auto_764294 ) ( ON ?auto_764297 ?auto_764296 ) ( ON ?auto_764298 ?auto_764297 ) ( ON ?auto_764299 ?auto_764298 ) ( not ( = ?auto_764291 ?auto_764292 ) ) ( not ( = ?auto_764291 ?auto_764293 ) ) ( not ( = ?auto_764291 ?auto_764295 ) ) ( not ( = ?auto_764291 ?auto_764294 ) ) ( not ( = ?auto_764291 ?auto_764296 ) ) ( not ( = ?auto_764291 ?auto_764297 ) ) ( not ( = ?auto_764291 ?auto_764298 ) ) ( not ( = ?auto_764291 ?auto_764299 ) ) ( not ( = ?auto_764291 ?auto_764300 ) ) ( not ( = ?auto_764291 ?auto_764301 ) ) ( not ( = ?auto_764291 ?auto_764307 ) ) ( not ( = ?auto_764292 ?auto_764293 ) ) ( not ( = ?auto_764292 ?auto_764295 ) ) ( not ( = ?auto_764292 ?auto_764294 ) ) ( not ( = ?auto_764292 ?auto_764296 ) ) ( not ( = ?auto_764292 ?auto_764297 ) ) ( not ( = ?auto_764292 ?auto_764298 ) ) ( not ( = ?auto_764292 ?auto_764299 ) ) ( not ( = ?auto_764292 ?auto_764300 ) ) ( not ( = ?auto_764292 ?auto_764301 ) ) ( not ( = ?auto_764292 ?auto_764307 ) ) ( not ( = ?auto_764293 ?auto_764295 ) ) ( not ( = ?auto_764293 ?auto_764294 ) ) ( not ( = ?auto_764293 ?auto_764296 ) ) ( not ( = ?auto_764293 ?auto_764297 ) ) ( not ( = ?auto_764293 ?auto_764298 ) ) ( not ( = ?auto_764293 ?auto_764299 ) ) ( not ( = ?auto_764293 ?auto_764300 ) ) ( not ( = ?auto_764293 ?auto_764301 ) ) ( not ( = ?auto_764293 ?auto_764307 ) ) ( not ( = ?auto_764295 ?auto_764294 ) ) ( not ( = ?auto_764295 ?auto_764296 ) ) ( not ( = ?auto_764295 ?auto_764297 ) ) ( not ( = ?auto_764295 ?auto_764298 ) ) ( not ( = ?auto_764295 ?auto_764299 ) ) ( not ( = ?auto_764295 ?auto_764300 ) ) ( not ( = ?auto_764295 ?auto_764301 ) ) ( not ( = ?auto_764295 ?auto_764307 ) ) ( not ( = ?auto_764294 ?auto_764296 ) ) ( not ( = ?auto_764294 ?auto_764297 ) ) ( not ( = ?auto_764294 ?auto_764298 ) ) ( not ( = ?auto_764294 ?auto_764299 ) ) ( not ( = ?auto_764294 ?auto_764300 ) ) ( not ( = ?auto_764294 ?auto_764301 ) ) ( not ( = ?auto_764294 ?auto_764307 ) ) ( not ( = ?auto_764296 ?auto_764297 ) ) ( not ( = ?auto_764296 ?auto_764298 ) ) ( not ( = ?auto_764296 ?auto_764299 ) ) ( not ( = ?auto_764296 ?auto_764300 ) ) ( not ( = ?auto_764296 ?auto_764301 ) ) ( not ( = ?auto_764296 ?auto_764307 ) ) ( not ( = ?auto_764297 ?auto_764298 ) ) ( not ( = ?auto_764297 ?auto_764299 ) ) ( not ( = ?auto_764297 ?auto_764300 ) ) ( not ( = ?auto_764297 ?auto_764301 ) ) ( not ( = ?auto_764297 ?auto_764307 ) ) ( not ( = ?auto_764298 ?auto_764299 ) ) ( not ( = ?auto_764298 ?auto_764300 ) ) ( not ( = ?auto_764298 ?auto_764301 ) ) ( not ( = ?auto_764298 ?auto_764307 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_764299 ?auto_764300 ?auto_764301 )
      ( MAKE-10CRATE-VERIFY ?auto_764291 ?auto_764292 ?auto_764293 ?auto_764295 ?auto_764294 ?auto_764296 ?auto_764297 ?auto_764298 ?auto_764299 ?auto_764300 ?auto_764301 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_764417 - SURFACE
      ?auto_764418 - SURFACE
      ?auto_764419 - SURFACE
      ?auto_764421 - SURFACE
      ?auto_764420 - SURFACE
      ?auto_764422 - SURFACE
      ?auto_764423 - SURFACE
      ?auto_764424 - SURFACE
      ?auto_764425 - SURFACE
      ?auto_764426 - SURFACE
      ?auto_764427 - SURFACE
    )
    :vars
    (
      ?auto_764428 - HOIST
      ?auto_764432 - PLACE
      ?auto_764431 - PLACE
      ?auto_764430 - HOIST
      ?auto_764429 - SURFACE
      ?auto_764433 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_764428 ?auto_764432 ) ( IS-CRATE ?auto_764427 ) ( not ( = ?auto_764426 ?auto_764427 ) ) ( not ( = ?auto_764425 ?auto_764426 ) ) ( not ( = ?auto_764425 ?auto_764427 ) ) ( not ( = ?auto_764431 ?auto_764432 ) ) ( HOIST-AT ?auto_764430 ?auto_764431 ) ( not ( = ?auto_764428 ?auto_764430 ) ) ( AVAILABLE ?auto_764430 ) ( SURFACE-AT ?auto_764427 ?auto_764431 ) ( ON ?auto_764427 ?auto_764429 ) ( CLEAR ?auto_764427 ) ( not ( = ?auto_764426 ?auto_764429 ) ) ( not ( = ?auto_764427 ?auto_764429 ) ) ( not ( = ?auto_764425 ?auto_764429 ) ) ( TRUCK-AT ?auto_764433 ?auto_764432 ) ( SURFACE-AT ?auto_764425 ?auto_764432 ) ( CLEAR ?auto_764425 ) ( LIFTING ?auto_764428 ?auto_764426 ) ( IS-CRATE ?auto_764426 ) ( ON ?auto_764418 ?auto_764417 ) ( ON ?auto_764419 ?auto_764418 ) ( ON ?auto_764421 ?auto_764419 ) ( ON ?auto_764420 ?auto_764421 ) ( ON ?auto_764422 ?auto_764420 ) ( ON ?auto_764423 ?auto_764422 ) ( ON ?auto_764424 ?auto_764423 ) ( ON ?auto_764425 ?auto_764424 ) ( not ( = ?auto_764417 ?auto_764418 ) ) ( not ( = ?auto_764417 ?auto_764419 ) ) ( not ( = ?auto_764417 ?auto_764421 ) ) ( not ( = ?auto_764417 ?auto_764420 ) ) ( not ( = ?auto_764417 ?auto_764422 ) ) ( not ( = ?auto_764417 ?auto_764423 ) ) ( not ( = ?auto_764417 ?auto_764424 ) ) ( not ( = ?auto_764417 ?auto_764425 ) ) ( not ( = ?auto_764417 ?auto_764426 ) ) ( not ( = ?auto_764417 ?auto_764427 ) ) ( not ( = ?auto_764417 ?auto_764429 ) ) ( not ( = ?auto_764418 ?auto_764419 ) ) ( not ( = ?auto_764418 ?auto_764421 ) ) ( not ( = ?auto_764418 ?auto_764420 ) ) ( not ( = ?auto_764418 ?auto_764422 ) ) ( not ( = ?auto_764418 ?auto_764423 ) ) ( not ( = ?auto_764418 ?auto_764424 ) ) ( not ( = ?auto_764418 ?auto_764425 ) ) ( not ( = ?auto_764418 ?auto_764426 ) ) ( not ( = ?auto_764418 ?auto_764427 ) ) ( not ( = ?auto_764418 ?auto_764429 ) ) ( not ( = ?auto_764419 ?auto_764421 ) ) ( not ( = ?auto_764419 ?auto_764420 ) ) ( not ( = ?auto_764419 ?auto_764422 ) ) ( not ( = ?auto_764419 ?auto_764423 ) ) ( not ( = ?auto_764419 ?auto_764424 ) ) ( not ( = ?auto_764419 ?auto_764425 ) ) ( not ( = ?auto_764419 ?auto_764426 ) ) ( not ( = ?auto_764419 ?auto_764427 ) ) ( not ( = ?auto_764419 ?auto_764429 ) ) ( not ( = ?auto_764421 ?auto_764420 ) ) ( not ( = ?auto_764421 ?auto_764422 ) ) ( not ( = ?auto_764421 ?auto_764423 ) ) ( not ( = ?auto_764421 ?auto_764424 ) ) ( not ( = ?auto_764421 ?auto_764425 ) ) ( not ( = ?auto_764421 ?auto_764426 ) ) ( not ( = ?auto_764421 ?auto_764427 ) ) ( not ( = ?auto_764421 ?auto_764429 ) ) ( not ( = ?auto_764420 ?auto_764422 ) ) ( not ( = ?auto_764420 ?auto_764423 ) ) ( not ( = ?auto_764420 ?auto_764424 ) ) ( not ( = ?auto_764420 ?auto_764425 ) ) ( not ( = ?auto_764420 ?auto_764426 ) ) ( not ( = ?auto_764420 ?auto_764427 ) ) ( not ( = ?auto_764420 ?auto_764429 ) ) ( not ( = ?auto_764422 ?auto_764423 ) ) ( not ( = ?auto_764422 ?auto_764424 ) ) ( not ( = ?auto_764422 ?auto_764425 ) ) ( not ( = ?auto_764422 ?auto_764426 ) ) ( not ( = ?auto_764422 ?auto_764427 ) ) ( not ( = ?auto_764422 ?auto_764429 ) ) ( not ( = ?auto_764423 ?auto_764424 ) ) ( not ( = ?auto_764423 ?auto_764425 ) ) ( not ( = ?auto_764423 ?auto_764426 ) ) ( not ( = ?auto_764423 ?auto_764427 ) ) ( not ( = ?auto_764423 ?auto_764429 ) ) ( not ( = ?auto_764424 ?auto_764425 ) ) ( not ( = ?auto_764424 ?auto_764426 ) ) ( not ( = ?auto_764424 ?auto_764427 ) ) ( not ( = ?auto_764424 ?auto_764429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_764425 ?auto_764426 ?auto_764427 )
      ( MAKE-10CRATE-VERIFY ?auto_764417 ?auto_764418 ?auto_764419 ?auto_764421 ?auto_764420 ?auto_764422 ?auto_764423 ?auto_764424 ?auto_764425 ?auto_764426 ?auto_764427 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_764543 - SURFACE
      ?auto_764544 - SURFACE
      ?auto_764545 - SURFACE
      ?auto_764547 - SURFACE
      ?auto_764546 - SURFACE
      ?auto_764548 - SURFACE
      ?auto_764549 - SURFACE
      ?auto_764550 - SURFACE
      ?auto_764551 - SURFACE
      ?auto_764552 - SURFACE
      ?auto_764553 - SURFACE
    )
    :vars
    (
      ?auto_764555 - HOIST
      ?auto_764558 - PLACE
      ?auto_764556 - PLACE
      ?auto_764554 - HOIST
      ?auto_764559 - SURFACE
      ?auto_764557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_764555 ?auto_764558 ) ( IS-CRATE ?auto_764553 ) ( not ( = ?auto_764552 ?auto_764553 ) ) ( not ( = ?auto_764551 ?auto_764552 ) ) ( not ( = ?auto_764551 ?auto_764553 ) ) ( not ( = ?auto_764556 ?auto_764558 ) ) ( HOIST-AT ?auto_764554 ?auto_764556 ) ( not ( = ?auto_764555 ?auto_764554 ) ) ( AVAILABLE ?auto_764554 ) ( SURFACE-AT ?auto_764553 ?auto_764556 ) ( ON ?auto_764553 ?auto_764559 ) ( CLEAR ?auto_764553 ) ( not ( = ?auto_764552 ?auto_764559 ) ) ( not ( = ?auto_764553 ?auto_764559 ) ) ( not ( = ?auto_764551 ?auto_764559 ) ) ( TRUCK-AT ?auto_764557 ?auto_764558 ) ( SURFACE-AT ?auto_764551 ?auto_764558 ) ( CLEAR ?auto_764551 ) ( IS-CRATE ?auto_764552 ) ( AVAILABLE ?auto_764555 ) ( IN ?auto_764552 ?auto_764557 ) ( ON ?auto_764544 ?auto_764543 ) ( ON ?auto_764545 ?auto_764544 ) ( ON ?auto_764547 ?auto_764545 ) ( ON ?auto_764546 ?auto_764547 ) ( ON ?auto_764548 ?auto_764546 ) ( ON ?auto_764549 ?auto_764548 ) ( ON ?auto_764550 ?auto_764549 ) ( ON ?auto_764551 ?auto_764550 ) ( not ( = ?auto_764543 ?auto_764544 ) ) ( not ( = ?auto_764543 ?auto_764545 ) ) ( not ( = ?auto_764543 ?auto_764547 ) ) ( not ( = ?auto_764543 ?auto_764546 ) ) ( not ( = ?auto_764543 ?auto_764548 ) ) ( not ( = ?auto_764543 ?auto_764549 ) ) ( not ( = ?auto_764543 ?auto_764550 ) ) ( not ( = ?auto_764543 ?auto_764551 ) ) ( not ( = ?auto_764543 ?auto_764552 ) ) ( not ( = ?auto_764543 ?auto_764553 ) ) ( not ( = ?auto_764543 ?auto_764559 ) ) ( not ( = ?auto_764544 ?auto_764545 ) ) ( not ( = ?auto_764544 ?auto_764547 ) ) ( not ( = ?auto_764544 ?auto_764546 ) ) ( not ( = ?auto_764544 ?auto_764548 ) ) ( not ( = ?auto_764544 ?auto_764549 ) ) ( not ( = ?auto_764544 ?auto_764550 ) ) ( not ( = ?auto_764544 ?auto_764551 ) ) ( not ( = ?auto_764544 ?auto_764552 ) ) ( not ( = ?auto_764544 ?auto_764553 ) ) ( not ( = ?auto_764544 ?auto_764559 ) ) ( not ( = ?auto_764545 ?auto_764547 ) ) ( not ( = ?auto_764545 ?auto_764546 ) ) ( not ( = ?auto_764545 ?auto_764548 ) ) ( not ( = ?auto_764545 ?auto_764549 ) ) ( not ( = ?auto_764545 ?auto_764550 ) ) ( not ( = ?auto_764545 ?auto_764551 ) ) ( not ( = ?auto_764545 ?auto_764552 ) ) ( not ( = ?auto_764545 ?auto_764553 ) ) ( not ( = ?auto_764545 ?auto_764559 ) ) ( not ( = ?auto_764547 ?auto_764546 ) ) ( not ( = ?auto_764547 ?auto_764548 ) ) ( not ( = ?auto_764547 ?auto_764549 ) ) ( not ( = ?auto_764547 ?auto_764550 ) ) ( not ( = ?auto_764547 ?auto_764551 ) ) ( not ( = ?auto_764547 ?auto_764552 ) ) ( not ( = ?auto_764547 ?auto_764553 ) ) ( not ( = ?auto_764547 ?auto_764559 ) ) ( not ( = ?auto_764546 ?auto_764548 ) ) ( not ( = ?auto_764546 ?auto_764549 ) ) ( not ( = ?auto_764546 ?auto_764550 ) ) ( not ( = ?auto_764546 ?auto_764551 ) ) ( not ( = ?auto_764546 ?auto_764552 ) ) ( not ( = ?auto_764546 ?auto_764553 ) ) ( not ( = ?auto_764546 ?auto_764559 ) ) ( not ( = ?auto_764548 ?auto_764549 ) ) ( not ( = ?auto_764548 ?auto_764550 ) ) ( not ( = ?auto_764548 ?auto_764551 ) ) ( not ( = ?auto_764548 ?auto_764552 ) ) ( not ( = ?auto_764548 ?auto_764553 ) ) ( not ( = ?auto_764548 ?auto_764559 ) ) ( not ( = ?auto_764549 ?auto_764550 ) ) ( not ( = ?auto_764549 ?auto_764551 ) ) ( not ( = ?auto_764549 ?auto_764552 ) ) ( not ( = ?auto_764549 ?auto_764553 ) ) ( not ( = ?auto_764549 ?auto_764559 ) ) ( not ( = ?auto_764550 ?auto_764551 ) ) ( not ( = ?auto_764550 ?auto_764552 ) ) ( not ( = ?auto_764550 ?auto_764553 ) ) ( not ( = ?auto_764550 ?auto_764559 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_764551 ?auto_764552 ?auto_764553 )
      ( MAKE-10CRATE-VERIFY ?auto_764543 ?auto_764544 ?auto_764545 ?auto_764547 ?auto_764546 ?auto_764548 ?auto_764549 ?auto_764550 ?auto_764551 ?auto_764552 ?auto_764553 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_765491 - SURFACE
      ?auto_765492 - SURFACE
    )
    :vars
    (
      ?auto_765499 - HOIST
      ?auto_765497 - PLACE
      ?auto_765493 - SURFACE
      ?auto_765496 - PLACE
      ?auto_765495 - HOIST
      ?auto_765494 - SURFACE
      ?auto_765498 - TRUCK
      ?auto_765500 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_765499 ?auto_765497 ) ( SURFACE-AT ?auto_765491 ?auto_765497 ) ( CLEAR ?auto_765491 ) ( IS-CRATE ?auto_765492 ) ( not ( = ?auto_765491 ?auto_765492 ) ) ( ON ?auto_765491 ?auto_765493 ) ( not ( = ?auto_765493 ?auto_765491 ) ) ( not ( = ?auto_765493 ?auto_765492 ) ) ( not ( = ?auto_765496 ?auto_765497 ) ) ( HOIST-AT ?auto_765495 ?auto_765496 ) ( not ( = ?auto_765499 ?auto_765495 ) ) ( AVAILABLE ?auto_765495 ) ( SURFACE-AT ?auto_765492 ?auto_765496 ) ( ON ?auto_765492 ?auto_765494 ) ( CLEAR ?auto_765492 ) ( not ( = ?auto_765491 ?auto_765494 ) ) ( not ( = ?auto_765492 ?auto_765494 ) ) ( not ( = ?auto_765493 ?auto_765494 ) ) ( TRUCK-AT ?auto_765498 ?auto_765497 ) ( LIFTING ?auto_765499 ?auto_765500 ) ( IS-CRATE ?auto_765500 ) ( not ( = ?auto_765491 ?auto_765500 ) ) ( not ( = ?auto_765492 ?auto_765500 ) ) ( not ( = ?auto_765493 ?auto_765500 ) ) ( not ( = ?auto_765494 ?auto_765500 ) ) )
    :subtasks
    ( ( !LOAD ?auto_765499 ?auto_765500 ?auto_765498 ?auto_765497 )
      ( MAKE-1CRATE ?auto_765491 ?auto_765492 )
      ( MAKE-1CRATE-VERIFY ?auto_765491 ?auto_765492 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_768760 - SURFACE
      ?auto_768761 - SURFACE
    )
    :vars
    (
      ?auto_768768 - HOIST
      ?auto_768762 - PLACE
      ?auto_768766 - SURFACE
      ?auto_768765 - TRUCK
      ?auto_768763 - PLACE
      ?auto_768767 - HOIST
      ?auto_768764 - SURFACE
      ?auto_768769 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_768768 ?auto_768762 ) ( SURFACE-AT ?auto_768760 ?auto_768762 ) ( CLEAR ?auto_768760 ) ( IS-CRATE ?auto_768761 ) ( not ( = ?auto_768760 ?auto_768761 ) ) ( AVAILABLE ?auto_768768 ) ( ON ?auto_768760 ?auto_768766 ) ( not ( = ?auto_768766 ?auto_768760 ) ) ( not ( = ?auto_768766 ?auto_768761 ) ) ( TRUCK-AT ?auto_768765 ?auto_768763 ) ( not ( = ?auto_768763 ?auto_768762 ) ) ( HOIST-AT ?auto_768767 ?auto_768763 ) ( not ( = ?auto_768768 ?auto_768767 ) ) ( SURFACE-AT ?auto_768761 ?auto_768763 ) ( ON ?auto_768761 ?auto_768764 ) ( CLEAR ?auto_768761 ) ( not ( = ?auto_768760 ?auto_768764 ) ) ( not ( = ?auto_768761 ?auto_768764 ) ) ( not ( = ?auto_768766 ?auto_768764 ) ) ( LIFTING ?auto_768767 ?auto_768769 ) ( IS-CRATE ?auto_768769 ) ( not ( = ?auto_768760 ?auto_768769 ) ) ( not ( = ?auto_768761 ?auto_768769 ) ) ( not ( = ?auto_768766 ?auto_768769 ) ) ( not ( = ?auto_768764 ?auto_768769 ) ) )
    :subtasks
    ( ( !LOAD ?auto_768767 ?auto_768769 ?auto_768765 ?auto_768763 )
      ( MAKE-1CRATE ?auto_768760 ?auto_768761 )
      ( MAKE-1CRATE-VERIFY ?auto_768760 ?auto_768761 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_771793 - SURFACE
      ?auto_771794 - SURFACE
      ?auto_771795 - SURFACE
      ?auto_771797 - SURFACE
      ?auto_771796 - SURFACE
      ?auto_771798 - SURFACE
      ?auto_771799 - SURFACE
      ?auto_771800 - SURFACE
      ?auto_771801 - SURFACE
      ?auto_771802 - SURFACE
      ?auto_771803 - SURFACE
      ?auto_771804 - SURFACE
    )
    :vars
    (
      ?auto_771805 - HOIST
      ?auto_771806 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_771805 ?auto_771806 ) ( SURFACE-AT ?auto_771803 ?auto_771806 ) ( CLEAR ?auto_771803 ) ( LIFTING ?auto_771805 ?auto_771804 ) ( IS-CRATE ?auto_771804 ) ( not ( = ?auto_771803 ?auto_771804 ) ) ( ON ?auto_771794 ?auto_771793 ) ( ON ?auto_771795 ?auto_771794 ) ( ON ?auto_771797 ?auto_771795 ) ( ON ?auto_771796 ?auto_771797 ) ( ON ?auto_771798 ?auto_771796 ) ( ON ?auto_771799 ?auto_771798 ) ( ON ?auto_771800 ?auto_771799 ) ( ON ?auto_771801 ?auto_771800 ) ( ON ?auto_771802 ?auto_771801 ) ( ON ?auto_771803 ?auto_771802 ) ( not ( = ?auto_771793 ?auto_771794 ) ) ( not ( = ?auto_771793 ?auto_771795 ) ) ( not ( = ?auto_771793 ?auto_771797 ) ) ( not ( = ?auto_771793 ?auto_771796 ) ) ( not ( = ?auto_771793 ?auto_771798 ) ) ( not ( = ?auto_771793 ?auto_771799 ) ) ( not ( = ?auto_771793 ?auto_771800 ) ) ( not ( = ?auto_771793 ?auto_771801 ) ) ( not ( = ?auto_771793 ?auto_771802 ) ) ( not ( = ?auto_771793 ?auto_771803 ) ) ( not ( = ?auto_771793 ?auto_771804 ) ) ( not ( = ?auto_771794 ?auto_771795 ) ) ( not ( = ?auto_771794 ?auto_771797 ) ) ( not ( = ?auto_771794 ?auto_771796 ) ) ( not ( = ?auto_771794 ?auto_771798 ) ) ( not ( = ?auto_771794 ?auto_771799 ) ) ( not ( = ?auto_771794 ?auto_771800 ) ) ( not ( = ?auto_771794 ?auto_771801 ) ) ( not ( = ?auto_771794 ?auto_771802 ) ) ( not ( = ?auto_771794 ?auto_771803 ) ) ( not ( = ?auto_771794 ?auto_771804 ) ) ( not ( = ?auto_771795 ?auto_771797 ) ) ( not ( = ?auto_771795 ?auto_771796 ) ) ( not ( = ?auto_771795 ?auto_771798 ) ) ( not ( = ?auto_771795 ?auto_771799 ) ) ( not ( = ?auto_771795 ?auto_771800 ) ) ( not ( = ?auto_771795 ?auto_771801 ) ) ( not ( = ?auto_771795 ?auto_771802 ) ) ( not ( = ?auto_771795 ?auto_771803 ) ) ( not ( = ?auto_771795 ?auto_771804 ) ) ( not ( = ?auto_771797 ?auto_771796 ) ) ( not ( = ?auto_771797 ?auto_771798 ) ) ( not ( = ?auto_771797 ?auto_771799 ) ) ( not ( = ?auto_771797 ?auto_771800 ) ) ( not ( = ?auto_771797 ?auto_771801 ) ) ( not ( = ?auto_771797 ?auto_771802 ) ) ( not ( = ?auto_771797 ?auto_771803 ) ) ( not ( = ?auto_771797 ?auto_771804 ) ) ( not ( = ?auto_771796 ?auto_771798 ) ) ( not ( = ?auto_771796 ?auto_771799 ) ) ( not ( = ?auto_771796 ?auto_771800 ) ) ( not ( = ?auto_771796 ?auto_771801 ) ) ( not ( = ?auto_771796 ?auto_771802 ) ) ( not ( = ?auto_771796 ?auto_771803 ) ) ( not ( = ?auto_771796 ?auto_771804 ) ) ( not ( = ?auto_771798 ?auto_771799 ) ) ( not ( = ?auto_771798 ?auto_771800 ) ) ( not ( = ?auto_771798 ?auto_771801 ) ) ( not ( = ?auto_771798 ?auto_771802 ) ) ( not ( = ?auto_771798 ?auto_771803 ) ) ( not ( = ?auto_771798 ?auto_771804 ) ) ( not ( = ?auto_771799 ?auto_771800 ) ) ( not ( = ?auto_771799 ?auto_771801 ) ) ( not ( = ?auto_771799 ?auto_771802 ) ) ( not ( = ?auto_771799 ?auto_771803 ) ) ( not ( = ?auto_771799 ?auto_771804 ) ) ( not ( = ?auto_771800 ?auto_771801 ) ) ( not ( = ?auto_771800 ?auto_771802 ) ) ( not ( = ?auto_771800 ?auto_771803 ) ) ( not ( = ?auto_771800 ?auto_771804 ) ) ( not ( = ?auto_771801 ?auto_771802 ) ) ( not ( = ?auto_771801 ?auto_771803 ) ) ( not ( = ?auto_771801 ?auto_771804 ) ) ( not ( = ?auto_771802 ?auto_771803 ) ) ( not ( = ?auto_771802 ?auto_771804 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_771803 ?auto_771804 )
      ( MAKE-11CRATE-VERIFY ?auto_771793 ?auto_771794 ?auto_771795 ?auto_771797 ?auto_771796 ?auto_771798 ?auto_771799 ?auto_771800 ?auto_771801 ?auto_771802 ?auto_771803 ?auto_771804 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_771902 - SURFACE
      ?auto_771903 - SURFACE
      ?auto_771904 - SURFACE
      ?auto_771906 - SURFACE
      ?auto_771905 - SURFACE
      ?auto_771907 - SURFACE
      ?auto_771908 - SURFACE
      ?auto_771909 - SURFACE
      ?auto_771910 - SURFACE
      ?auto_771911 - SURFACE
      ?auto_771912 - SURFACE
      ?auto_771913 - SURFACE
    )
    :vars
    (
      ?auto_771914 - HOIST
      ?auto_771916 - PLACE
      ?auto_771915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_771914 ?auto_771916 ) ( SURFACE-AT ?auto_771912 ?auto_771916 ) ( CLEAR ?auto_771912 ) ( IS-CRATE ?auto_771913 ) ( not ( = ?auto_771912 ?auto_771913 ) ) ( TRUCK-AT ?auto_771915 ?auto_771916 ) ( AVAILABLE ?auto_771914 ) ( IN ?auto_771913 ?auto_771915 ) ( ON ?auto_771912 ?auto_771911 ) ( not ( = ?auto_771911 ?auto_771912 ) ) ( not ( = ?auto_771911 ?auto_771913 ) ) ( ON ?auto_771903 ?auto_771902 ) ( ON ?auto_771904 ?auto_771903 ) ( ON ?auto_771906 ?auto_771904 ) ( ON ?auto_771905 ?auto_771906 ) ( ON ?auto_771907 ?auto_771905 ) ( ON ?auto_771908 ?auto_771907 ) ( ON ?auto_771909 ?auto_771908 ) ( ON ?auto_771910 ?auto_771909 ) ( ON ?auto_771911 ?auto_771910 ) ( not ( = ?auto_771902 ?auto_771903 ) ) ( not ( = ?auto_771902 ?auto_771904 ) ) ( not ( = ?auto_771902 ?auto_771906 ) ) ( not ( = ?auto_771902 ?auto_771905 ) ) ( not ( = ?auto_771902 ?auto_771907 ) ) ( not ( = ?auto_771902 ?auto_771908 ) ) ( not ( = ?auto_771902 ?auto_771909 ) ) ( not ( = ?auto_771902 ?auto_771910 ) ) ( not ( = ?auto_771902 ?auto_771911 ) ) ( not ( = ?auto_771902 ?auto_771912 ) ) ( not ( = ?auto_771902 ?auto_771913 ) ) ( not ( = ?auto_771903 ?auto_771904 ) ) ( not ( = ?auto_771903 ?auto_771906 ) ) ( not ( = ?auto_771903 ?auto_771905 ) ) ( not ( = ?auto_771903 ?auto_771907 ) ) ( not ( = ?auto_771903 ?auto_771908 ) ) ( not ( = ?auto_771903 ?auto_771909 ) ) ( not ( = ?auto_771903 ?auto_771910 ) ) ( not ( = ?auto_771903 ?auto_771911 ) ) ( not ( = ?auto_771903 ?auto_771912 ) ) ( not ( = ?auto_771903 ?auto_771913 ) ) ( not ( = ?auto_771904 ?auto_771906 ) ) ( not ( = ?auto_771904 ?auto_771905 ) ) ( not ( = ?auto_771904 ?auto_771907 ) ) ( not ( = ?auto_771904 ?auto_771908 ) ) ( not ( = ?auto_771904 ?auto_771909 ) ) ( not ( = ?auto_771904 ?auto_771910 ) ) ( not ( = ?auto_771904 ?auto_771911 ) ) ( not ( = ?auto_771904 ?auto_771912 ) ) ( not ( = ?auto_771904 ?auto_771913 ) ) ( not ( = ?auto_771906 ?auto_771905 ) ) ( not ( = ?auto_771906 ?auto_771907 ) ) ( not ( = ?auto_771906 ?auto_771908 ) ) ( not ( = ?auto_771906 ?auto_771909 ) ) ( not ( = ?auto_771906 ?auto_771910 ) ) ( not ( = ?auto_771906 ?auto_771911 ) ) ( not ( = ?auto_771906 ?auto_771912 ) ) ( not ( = ?auto_771906 ?auto_771913 ) ) ( not ( = ?auto_771905 ?auto_771907 ) ) ( not ( = ?auto_771905 ?auto_771908 ) ) ( not ( = ?auto_771905 ?auto_771909 ) ) ( not ( = ?auto_771905 ?auto_771910 ) ) ( not ( = ?auto_771905 ?auto_771911 ) ) ( not ( = ?auto_771905 ?auto_771912 ) ) ( not ( = ?auto_771905 ?auto_771913 ) ) ( not ( = ?auto_771907 ?auto_771908 ) ) ( not ( = ?auto_771907 ?auto_771909 ) ) ( not ( = ?auto_771907 ?auto_771910 ) ) ( not ( = ?auto_771907 ?auto_771911 ) ) ( not ( = ?auto_771907 ?auto_771912 ) ) ( not ( = ?auto_771907 ?auto_771913 ) ) ( not ( = ?auto_771908 ?auto_771909 ) ) ( not ( = ?auto_771908 ?auto_771910 ) ) ( not ( = ?auto_771908 ?auto_771911 ) ) ( not ( = ?auto_771908 ?auto_771912 ) ) ( not ( = ?auto_771908 ?auto_771913 ) ) ( not ( = ?auto_771909 ?auto_771910 ) ) ( not ( = ?auto_771909 ?auto_771911 ) ) ( not ( = ?auto_771909 ?auto_771912 ) ) ( not ( = ?auto_771909 ?auto_771913 ) ) ( not ( = ?auto_771910 ?auto_771911 ) ) ( not ( = ?auto_771910 ?auto_771912 ) ) ( not ( = ?auto_771910 ?auto_771913 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_771911 ?auto_771912 ?auto_771913 )
      ( MAKE-11CRATE-VERIFY ?auto_771902 ?auto_771903 ?auto_771904 ?auto_771906 ?auto_771905 ?auto_771907 ?auto_771908 ?auto_771909 ?auto_771910 ?auto_771911 ?auto_771912 ?auto_771913 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_772023 - SURFACE
      ?auto_772024 - SURFACE
      ?auto_772025 - SURFACE
      ?auto_772027 - SURFACE
      ?auto_772026 - SURFACE
      ?auto_772028 - SURFACE
      ?auto_772029 - SURFACE
      ?auto_772030 - SURFACE
      ?auto_772031 - SURFACE
      ?auto_772032 - SURFACE
      ?auto_772033 - SURFACE
      ?auto_772034 - SURFACE
    )
    :vars
    (
      ?auto_772037 - HOIST
      ?auto_772035 - PLACE
      ?auto_772036 - TRUCK
      ?auto_772038 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_772037 ?auto_772035 ) ( SURFACE-AT ?auto_772033 ?auto_772035 ) ( CLEAR ?auto_772033 ) ( IS-CRATE ?auto_772034 ) ( not ( = ?auto_772033 ?auto_772034 ) ) ( AVAILABLE ?auto_772037 ) ( IN ?auto_772034 ?auto_772036 ) ( ON ?auto_772033 ?auto_772032 ) ( not ( = ?auto_772032 ?auto_772033 ) ) ( not ( = ?auto_772032 ?auto_772034 ) ) ( TRUCK-AT ?auto_772036 ?auto_772038 ) ( not ( = ?auto_772038 ?auto_772035 ) ) ( ON ?auto_772024 ?auto_772023 ) ( ON ?auto_772025 ?auto_772024 ) ( ON ?auto_772027 ?auto_772025 ) ( ON ?auto_772026 ?auto_772027 ) ( ON ?auto_772028 ?auto_772026 ) ( ON ?auto_772029 ?auto_772028 ) ( ON ?auto_772030 ?auto_772029 ) ( ON ?auto_772031 ?auto_772030 ) ( ON ?auto_772032 ?auto_772031 ) ( not ( = ?auto_772023 ?auto_772024 ) ) ( not ( = ?auto_772023 ?auto_772025 ) ) ( not ( = ?auto_772023 ?auto_772027 ) ) ( not ( = ?auto_772023 ?auto_772026 ) ) ( not ( = ?auto_772023 ?auto_772028 ) ) ( not ( = ?auto_772023 ?auto_772029 ) ) ( not ( = ?auto_772023 ?auto_772030 ) ) ( not ( = ?auto_772023 ?auto_772031 ) ) ( not ( = ?auto_772023 ?auto_772032 ) ) ( not ( = ?auto_772023 ?auto_772033 ) ) ( not ( = ?auto_772023 ?auto_772034 ) ) ( not ( = ?auto_772024 ?auto_772025 ) ) ( not ( = ?auto_772024 ?auto_772027 ) ) ( not ( = ?auto_772024 ?auto_772026 ) ) ( not ( = ?auto_772024 ?auto_772028 ) ) ( not ( = ?auto_772024 ?auto_772029 ) ) ( not ( = ?auto_772024 ?auto_772030 ) ) ( not ( = ?auto_772024 ?auto_772031 ) ) ( not ( = ?auto_772024 ?auto_772032 ) ) ( not ( = ?auto_772024 ?auto_772033 ) ) ( not ( = ?auto_772024 ?auto_772034 ) ) ( not ( = ?auto_772025 ?auto_772027 ) ) ( not ( = ?auto_772025 ?auto_772026 ) ) ( not ( = ?auto_772025 ?auto_772028 ) ) ( not ( = ?auto_772025 ?auto_772029 ) ) ( not ( = ?auto_772025 ?auto_772030 ) ) ( not ( = ?auto_772025 ?auto_772031 ) ) ( not ( = ?auto_772025 ?auto_772032 ) ) ( not ( = ?auto_772025 ?auto_772033 ) ) ( not ( = ?auto_772025 ?auto_772034 ) ) ( not ( = ?auto_772027 ?auto_772026 ) ) ( not ( = ?auto_772027 ?auto_772028 ) ) ( not ( = ?auto_772027 ?auto_772029 ) ) ( not ( = ?auto_772027 ?auto_772030 ) ) ( not ( = ?auto_772027 ?auto_772031 ) ) ( not ( = ?auto_772027 ?auto_772032 ) ) ( not ( = ?auto_772027 ?auto_772033 ) ) ( not ( = ?auto_772027 ?auto_772034 ) ) ( not ( = ?auto_772026 ?auto_772028 ) ) ( not ( = ?auto_772026 ?auto_772029 ) ) ( not ( = ?auto_772026 ?auto_772030 ) ) ( not ( = ?auto_772026 ?auto_772031 ) ) ( not ( = ?auto_772026 ?auto_772032 ) ) ( not ( = ?auto_772026 ?auto_772033 ) ) ( not ( = ?auto_772026 ?auto_772034 ) ) ( not ( = ?auto_772028 ?auto_772029 ) ) ( not ( = ?auto_772028 ?auto_772030 ) ) ( not ( = ?auto_772028 ?auto_772031 ) ) ( not ( = ?auto_772028 ?auto_772032 ) ) ( not ( = ?auto_772028 ?auto_772033 ) ) ( not ( = ?auto_772028 ?auto_772034 ) ) ( not ( = ?auto_772029 ?auto_772030 ) ) ( not ( = ?auto_772029 ?auto_772031 ) ) ( not ( = ?auto_772029 ?auto_772032 ) ) ( not ( = ?auto_772029 ?auto_772033 ) ) ( not ( = ?auto_772029 ?auto_772034 ) ) ( not ( = ?auto_772030 ?auto_772031 ) ) ( not ( = ?auto_772030 ?auto_772032 ) ) ( not ( = ?auto_772030 ?auto_772033 ) ) ( not ( = ?auto_772030 ?auto_772034 ) ) ( not ( = ?auto_772031 ?auto_772032 ) ) ( not ( = ?auto_772031 ?auto_772033 ) ) ( not ( = ?auto_772031 ?auto_772034 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_772032 ?auto_772033 ?auto_772034 )
      ( MAKE-11CRATE-VERIFY ?auto_772023 ?auto_772024 ?auto_772025 ?auto_772027 ?auto_772026 ?auto_772028 ?auto_772029 ?auto_772030 ?auto_772031 ?auto_772032 ?auto_772033 ?auto_772034 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_772155 - SURFACE
      ?auto_772156 - SURFACE
      ?auto_772157 - SURFACE
      ?auto_772159 - SURFACE
      ?auto_772158 - SURFACE
      ?auto_772160 - SURFACE
      ?auto_772161 - SURFACE
      ?auto_772162 - SURFACE
      ?auto_772163 - SURFACE
      ?auto_772164 - SURFACE
      ?auto_772165 - SURFACE
      ?auto_772166 - SURFACE
    )
    :vars
    (
      ?auto_772170 - HOIST
      ?auto_772171 - PLACE
      ?auto_772169 - TRUCK
      ?auto_772167 - PLACE
      ?auto_772168 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_772170 ?auto_772171 ) ( SURFACE-AT ?auto_772165 ?auto_772171 ) ( CLEAR ?auto_772165 ) ( IS-CRATE ?auto_772166 ) ( not ( = ?auto_772165 ?auto_772166 ) ) ( AVAILABLE ?auto_772170 ) ( ON ?auto_772165 ?auto_772164 ) ( not ( = ?auto_772164 ?auto_772165 ) ) ( not ( = ?auto_772164 ?auto_772166 ) ) ( TRUCK-AT ?auto_772169 ?auto_772167 ) ( not ( = ?auto_772167 ?auto_772171 ) ) ( HOIST-AT ?auto_772168 ?auto_772167 ) ( LIFTING ?auto_772168 ?auto_772166 ) ( not ( = ?auto_772170 ?auto_772168 ) ) ( ON ?auto_772156 ?auto_772155 ) ( ON ?auto_772157 ?auto_772156 ) ( ON ?auto_772159 ?auto_772157 ) ( ON ?auto_772158 ?auto_772159 ) ( ON ?auto_772160 ?auto_772158 ) ( ON ?auto_772161 ?auto_772160 ) ( ON ?auto_772162 ?auto_772161 ) ( ON ?auto_772163 ?auto_772162 ) ( ON ?auto_772164 ?auto_772163 ) ( not ( = ?auto_772155 ?auto_772156 ) ) ( not ( = ?auto_772155 ?auto_772157 ) ) ( not ( = ?auto_772155 ?auto_772159 ) ) ( not ( = ?auto_772155 ?auto_772158 ) ) ( not ( = ?auto_772155 ?auto_772160 ) ) ( not ( = ?auto_772155 ?auto_772161 ) ) ( not ( = ?auto_772155 ?auto_772162 ) ) ( not ( = ?auto_772155 ?auto_772163 ) ) ( not ( = ?auto_772155 ?auto_772164 ) ) ( not ( = ?auto_772155 ?auto_772165 ) ) ( not ( = ?auto_772155 ?auto_772166 ) ) ( not ( = ?auto_772156 ?auto_772157 ) ) ( not ( = ?auto_772156 ?auto_772159 ) ) ( not ( = ?auto_772156 ?auto_772158 ) ) ( not ( = ?auto_772156 ?auto_772160 ) ) ( not ( = ?auto_772156 ?auto_772161 ) ) ( not ( = ?auto_772156 ?auto_772162 ) ) ( not ( = ?auto_772156 ?auto_772163 ) ) ( not ( = ?auto_772156 ?auto_772164 ) ) ( not ( = ?auto_772156 ?auto_772165 ) ) ( not ( = ?auto_772156 ?auto_772166 ) ) ( not ( = ?auto_772157 ?auto_772159 ) ) ( not ( = ?auto_772157 ?auto_772158 ) ) ( not ( = ?auto_772157 ?auto_772160 ) ) ( not ( = ?auto_772157 ?auto_772161 ) ) ( not ( = ?auto_772157 ?auto_772162 ) ) ( not ( = ?auto_772157 ?auto_772163 ) ) ( not ( = ?auto_772157 ?auto_772164 ) ) ( not ( = ?auto_772157 ?auto_772165 ) ) ( not ( = ?auto_772157 ?auto_772166 ) ) ( not ( = ?auto_772159 ?auto_772158 ) ) ( not ( = ?auto_772159 ?auto_772160 ) ) ( not ( = ?auto_772159 ?auto_772161 ) ) ( not ( = ?auto_772159 ?auto_772162 ) ) ( not ( = ?auto_772159 ?auto_772163 ) ) ( not ( = ?auto_772159 ?auto_772164 ) ) ( not ( = ?auto_772159 ?auto_772165 ) ) ( not ( = ?auto_772159 ?auto_772166 ) ) ( not ( = ?auto_772158 ?auto_772160 ) ) ( not ( = ?auto_772158 ?auto_772161 ) ) ( not ( = ?auto_772158 ?auto_772162 ) ) ( not ( = ?auto_772158 ?auto_772163 ) ) ( not ( = ?auto_772158 ?auto_772164 ) ) ( not ( = ?auto_772158 ?auto_772165 ) ) ( not ( = ?auto_772158 ?auto_772166 ) ) ( not ( = ?auto_772160 ?auto_772161 ) ) ( not ( = ?auto_772160 ?auto_772162 ) ) ( not ( = ?auto_772160 ?auto_772163 ) ) ( not ( = ?auto_772160 ?auto_772164 ) ) ( not ( = ?auto_772160 ?auto_772165 ) ) ( not ( = ?auto_772160 ?auto_772166 ) ) ( not ( = ?auto_772161 ?auto_772162 ) ) ( not ( = ?auto_772161 ?auto_772163 ) ) ( not ( = ?auto_772161 ?auto_772164 ) ) ( not ( = ?auto_772161 ?auto_772165 ) ) ( not ( = ?auto_772161 ?auto_772166 ) ) ( not ( = ?auto_772162 ?auto_772163 ) ) ( not ( = ?auto_772162 ?auto_772164 ) ) ( not ( = ?auto_772162 ?auto_772165 ) ) ( not ( = ?auto_772162 ?auto_772166 ) ) ( not ( = ?auto_772163 ?auto_772164 ) ) ( not ( = ?auto_772163 ?auto_772165 ) ) ( not ( = ?auto_772163 ?auto_772166 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_772164 ?auto_772165 ?auto_772166 )
      ( MAKE-11CRATE-VERIFY ?auto_772155 ?auto_772156 ?auto_772157 ?auto_772159 ?auto_772158 ?auto_772160 ?auto_772161 ?auto_772162 ?auto_772163 ?auto_772164 ?auto_772165 ?auto_772166 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_772298 - SURFACE
      ?auto_772299 - SURFACE
      ?auto_772300 - SURFACE
      ?auto_772302 - SURFACE
      ?auto_772301 - SURFACE
      ?auto_772303 - SURFACE
      ?auto_772304 - SURFACE
      ?auto_772305 - SURFACE
      ?auto_772306 - SURFACE
      ?auto_772307 - SURFACE
      ?auto_772308 - SURFACE
      ?auto_772309 - SURFACE
    )
    :vars
    (
      ?auto_772313 - HOIST
      ?auto_772310 - PLACE
      ?auto_772311 - TRUCK
      ?auto_772314 - PLACE
      ?auto_772315 - HOIST
      ?auto_772312 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_772313 ?auto_772310 ) ( SURFACE-AT ?auto_772308 ?auto_772310 ) ( CLEAR ?auto_772308 ) ( IS-CRATE ?auto_772309 ) ( not ( = ?auto_772308 ?auto_772309 ) ) ( AVAILABLE ?auto_772313 ) ( ON ?auto_772308 ?auto_772307 ) ( not ( = ?auto_772307 ?auto_772308 ) ) ( not ( = ?auto_772307 ?auto_772309 ) ) ( TRUCK-AT ?auto_772311 ?auto_772314 ) ( not ( = ?auto_772314 ?auto_772310 ) ) ( HOIST-AT ?auto_772315 ?auto_772314 ) ( not ( = ?auto_772313 ?auto_772315 ) ) ( AVAILABLE ?auto_772315 ) ( SURFACE-AT ?auto_772309 ?auto_772314 ) ( ON ?auto_772309 ?auto_772312 ) ( CLEAR ?auto_772309 ) ( not ( = ?auto_772308 ?auto_772312 ) ) ( not ( = ?auto_772309 ?auto_772312 ) ) ( not ( = ?auto_772307 ?auto_772312 ) ) ( ON ?auto_772299 ?auto_772298 ) ( ON ?auto_772300 ?auto_772299 ) ( ON ?auto_772302 ?auto_772300 ) ( ON ?auto_772301 ?auto_772302 ) ( ON ?auto_772303 ?auto_772301 ) ( ON ?auto_772304 ?auto_772303 ) ( ON ?auto_772305 ?auto_772304 ) ( ON ?auto_772306 ?auto_772305 ) ( ON ?auto_772307 ?auto_772306 ) ( not ( = ?auto_772298 ?auto_772299 ) ) ( not ( = ?auto_772298 ?auto_772300 ) ) ( not ( = ?auto_772298 ?auto_772302 ) ) ( not ( = ?auto_772298 ?auto_772301 ) ) ( not ( = ?auto_772298 ?auto_772303 ) ) ( not ( = ?auto_772298 ?auto_772304 ) ) ( not ( = ?auto_772298 ?auto_772305 ) ) ( not ( = ?auto_772298 ?auto_772306 ) ) ( not ( = ?auto_772298 ?auto_772307 ) ) ( not ( = ?auto_772298 ?auto_772308 ) ) ( not ( = ?auto_772298 ?auto_772309 ) ) ( not ( = ?auto_772298 ?auto_772312 ) ) ( not ( = ?auto_772299 ?auto_772300 ) ) ( not ( = ?auto_772299 ?auto_772302 ) ) ( not ( = ?auto_772299 ?auto_772301 ) ) ( not ( = ?auto_772299 ?auto_772303 ) ) ( not ( = ?auto_772299 ?auto_772304 ) ) ( not ( = ?auto_772299 ?auto_772305 ) ) ( not ( = ?auto_772299 ?auto_772306 ) ) ( not ( = ?auto_772299 ?auto_772307 ) ) ( not ( = ?auto_772299 ?auto_772308 ) ) ( not ( = ?auto_772299 ?auto_772309 ) ) ( not ( = ?auto_772299 ?auto_772312 ) ) ( not ( = ?auto_772300 ?auto_772302 ) ) ( not ( = ?auto_772300 ?auto_772301 ) ) ( not ( = ?auto_772300 ?auto_772303 ) ) ( not ( = ?auto_772300 ?auto_772304 ) ) ( not ( = ?auto_772300 ?auto_772305 ) ) ( not ( = ?auto_772300 ?auto_772306 ) ) ( not ( = ?auto_772300 ?auto_772307 ) ) ( not ( = ?auto_772300 ?auto_772308 ) ) ( not ( = ?auto_772300 ?auto_772309 ) ) ( not ( = ?auto_772300 ?auto_772312 ) ) ( not ( = ?auto_772302 ?auto_772301 ) ) ( not ( = ?auto_772302 ?auto_772303 ) ) ( not ( = ?auto_772302 ?auto_772304 ) ) ( not ( = ?auto_772302 ?auto_772305 ) ) ( not ( = ?auto_772302 ?auto_772306 ) ) ( not ( = ?auto_772302 ?auto_772307 ) ) ( not ( = ?auto_772302 ?auto_772308 ) ) ( not ( = ?auto_772302 ?auto_772309 ) ) ( not ( = ?auto_772302 ?auto_772312 ) ) ( not ( = ?auto_772301 ?auto_772303 ) ) ( not ( = ?auto_772301 ?auto_772304 ) ) ( not ( = ?auto_772301 ?auto_772305 ) ) ( not ( = ?auto_772301 ?auto_772306 ) ) ( not ( = ?auto_772301 ?auto_772307 ) ) ( not ( = ?auto_772301 ?auto_772308 ) ) ( not ( = ?auto_772301 ?auto_772309 ) ) ( not ( = ?auto_772301 ?auto_772312 ) ) ( not ( = ?auto_772303 ?auto_772304 ) ) ( not ( = ?auto_772303 ?auto_772305 ) ) ( not ( = ?auto_772303 ?auto_772306 ) ) ( not ( = ?auto_772303 ?auto_772307 ) ) ( not ( = ?auto_772303 ?auto_772308 ) ) ( not ( = ?auto_772303 ?auto_772309 ) ) ( not ( = ?auto_772303 ?auto_772312 ) ) ( not ( = ?auto_772304 ?auto_772305 ) ) ( not ( = ?auto_772304 ?auto_772306 ) ) ( not ( = ?auto_772304 ?auto_772307 ) ) ( not ( = ?auto_772304 ?auto_772308 ) ) ( not ( = ?auto_772304 ?auto_772309 ) ) ( not ( = ?auto_772304 ?auto_772312 ) ) ( not ( = ?auto_772305 ?auto_772306 ) ) ( not ( = ?auto_772305 ?auto_772307 ) ) ( not ( = ?auto_772305 ?auto_772308 ) ) ( not ( = ?auto_772305 ?auto_772309 ) ) ( not ( = ?auto_772305 ?auto_772312 ) ) ( not ( = ?auto_772306 ?auto_772307 ) ) ( not ( = ?auto_772306 ?auto_772308 ) ) ( not ( = ?auto_772306 ?auto_772309 ) ) ( not ( = ?auto_772306 ?auto_772312 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_772307 ?auto_772308 ?auto_772309 )
      ( MAKE-11CRATE-VERIFY ?auto_772298 ?auto_772299 ?auto_772300 ?auto_772302 ?auto_772301 ?auto_772303 ?auto_772304 ?auto_772305 ?auto_772306 ?auto_772307 ?auto_772308 ?auto_772309 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_772442 - SURFACE
      ?auto_772443 - SURFACE
      ?auto_772444 - SURFACE
      ?auto_772446 - SURFACE
      ?auto_772445 - SURFACE
      ?auto_772447 - SURFACE
      ?auto_772448 - SURFACE
      ?auto_772449 - SURFACE
      ?auto_772450 - SURFACE
      ?auto_772451 - SURFACE
      ?auto_772452 - SURFACE
      ?auto_772453 - SURFACE
    )
    :vars
    (
      ?auto_772456 - HOIST
      ?auto_772454 - PLACE
      ?auto_772455 - PLACE
      ?auto_772458 - HOIST
      ?auto_772459 - SURFACE
      ?auto_772457 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_772456 ?auto_772454 ) ( SURFACE-AT ?auto_772452 ?auto_772454 ) ( CLEAR ?auto_772452 ) ( IS-CRATE ?auto_772453 ) ( not ( = ?auto_772452 ?auto_772453 ) ) ( AVAILABLE ?auto_772456 ) ( ON ?auto_772452 ?auto_772451 ) ( not ( = ?auto_772451 ?auto_772452 ) ) ( not ( = ?auto_772451 ?auto_772453 ) ) ( not ( = ?auto_772455 ?auto_772454 ) ) ( HOIST-AT ?auto_772458 ?auto_772455 ) ( not ( = ?auto_772456 ?auto_772458 ) ) ( AVAILABLE ?auto_772458 ) ( SURFACE-AT ?auto_772453 ?auto_772455 ) ( ON ?auto_772453 ?auto_772459 ) ( CLEAR ?auto_772453 ) ( not ( = ?auto_772452 ?auto_772459 ) ) ( not ( = ?auto_772453 ?auto_772459 ) ) ( not ( = ?auto_772451 ?auto_772459 ) ) ( TRUCK-AT ?auto_772457 ?auto_772454 ) ( ON ?auto_772443 ?auto_772442 ) ( ON ?auto_772444 ?auto_772443 ) ( ON ?auto_772446 ?auto_772444 ) ( ON ?auto_772445 ?auto_772446 ) ( ON ?auto_772447 ?auto_772445 ) ( ON ?auto_772448 ?auto_772447 ) ( ON ?auto_772449 ?auto_772448 ) ( ON ?auto_772450 ?auto_772449 ) ( ON ?auto_772451 ?auto_772450 ) ( not ( = ?auto_772442 ?auto_772443 ) ) ( not ( = ?auto_772442 ?auto_772444 ) ) ( not ( = ?auto_772442 ?auto_772446 ) ) ( not ( = ?auto_772442 ?auto_772445 ) ) ( not ( = ?auto_772442 ?auto_772447 ) ) ( not ( = ?auto_772442 ?auto_772448 ) ) ( not ( = ?auto_772442 ?auto_772449 ) ) ( not ( = ?auto_772442 ?auto_772450 ) ) ( not ( = ?auto_772442 ?auto_772451 ) ) ( not ( = ?auto_772442 ?auto_772452 ) ) ( not ( = ?auto_772442 ?auto_772453 ) ) ( not ( = ?auto_772442 ?auto_772459 ) ) ( not ( = ?auto_772443 ?auto_772444 ) ) ( not ( = ?auto_772443 ?auto_772446 ) ) ( not ( = ?auto_772443 ?auto_772445 ) ) ( not ( = ?auto_772443 ?auto_772447 ) ) ( not ( = ?auto_772443 ?auto_772448 ) ) ( not ( = ?auto_772443 ?auto_772449 ) ) ( not ( = ?auto_772443 ?auto_772450 ) ) ( not ( = ?auto_772443 ?auto_772451 ) ) ( not ( = ?auto_772443 ?auto_772452 ) ) ( not ( = ?auto_772443 ?auto_772453 ) ) ( not ( = ?auto_772443 ?auto_772459 ) ) ( not ( = ?auto_772444 ?auto_772446 ) ) ( not ( = ?auto_772444 ?auto_772445 ) ) ( not ( = ?auto_772444 ?auto_772447 ) ) ( not ( = ?auto_772444 ?auto_772448 ) ) ( not ( = ?auto_772444 ?auto_772449 ) ) ( not ( = ?auto_772444 ?auto_772450 ) ) ( not ( = ?auto_772444 ?auto_772451 ) ) ( not ( = ?auto_772444 ?auto_772452 ) ) ( not ( = ?auto_772444 ?auto_772453 ) ) ( not ( = ?auto_772444 ?auto_772459 ) ) ( not ( = ?auto_772446 ?auto_772445 ) ) ( not ( = ?auto_772446 ?auto_772447 ) ) ( not ( = ?auto_772446 ?auto_772448 ) ) ( not ( = ?auto_772446 ?auto_772449 ) ) ( not ( = ?auto_772446 ?auto_772450 ) ) ( not ( = ?auto_772446 ?auto_772451 ) ) ( not ( = ?auto_772446 ?auto_772452 ) ) ( not ( = ?auto_772446 ?auto_772453 ) ) ( not ( = ?auto_772446 ?auto_772459 ) ) ( not ( = ?auto_772445 ?auto_772447 ) ) ( not ( = ?auto_772445 ?auto_772448 ) ) ( not ( = ?auto_772445 ?auto_772449 ) ) ( not ( = ?auto_772445 ?auto_772450 ) ) ( not ( = ?auto_772445 ?auto_772451 ) ) ( not ( = ?auto_772445 ?auto_772452 ) ) ( not ( = ?auto_772445 ?auto_772453 ) ) ( not ( = ?auto_772445 ?auto_772459 ) ) ( not ( = ?auto_772447 ?auto_772448 ) ) ( not ( = ?auto_772447 ?auto_772449 ) ) ( not ( = ?auto_772447 ?auto_772450 ) ) ( not ( = ?auto_772447 ?auto_772451 ) ) ( not ( = ?auto_772447 ?auto_772452 ) ) ( not ( = ?auto_772447 ?auto_772453 ) ) ( not ( = ?auto_772447 ?auto_772459 ) ) ( not ( = ?auto_772448 ?auto_772449 ) ) ( not ( = ?auto_772448 ?auto_772450 ) ) ( not ( = ?auto_772448 ?auto_772451 ) ) ( not ( = ?auto_772448 ?auto_772452 ) ) ( not ( = ?auto_772448 ?auto_772453 ) ) ( not ( = ?auto_772448 ?auto_772459 ) ) ( not ( = ?auto_772449 ?auto_772450 ) ) ( not ( = ?auto_772449 ?auto_772451 ) ) ( not ( = ?auto_772449 ?auto_772452 ) ) ( not ( = ?auto_772449 ?auto_772453 ) ) ( not ( = ?auto_772449 ?auto_772459 ) ) ( not ( = ?auto_772450 ?auto_772451 ) ) ( not ( = ?auto_772450 ?auto_772452 ) ) ( not ( = ?auto_772450 ?auto_772453 ) ) ( not ( = ?auto_772450 ?auto_772459 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_772451 ?auto_772452 ?auto_772453 )
      ( MAKE-11CRATE-VERIFY ?auto_772442 ?auto_772443 ?auto_772444 ?auto_772446 ?auto_772445 ?auto_772447 ?auto_772448 ?auto_772449 ?auto_772450 ?auto_772451 ?auto_772452 ?auto_772453 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_772586 - SURFACE
      ?auto_772587 - SURFACE
      ?auto_772588 - SURFACE
      ?auto_772590 - SURFACE
      ?auto_772589 - SURFACE
      ?auto_772591 - SURFACE
      ?auto_772592 - SURFACE
      ?auto_772593 - SURFACE
      ?auto_772594 - SURFACE
      ?auto_772595 - SURFACE
      ?auto_772596 - SURFACE
      ?auto_772597 - SURFACE
    )
    :vars
    (
      ?auto_772603 - HOIST
      ?auto_772600 - PLACE
      ?auto_772598 - PLACE
      ?auto_772599 - HOIST
      ?auto_772601 - SURFACE
      ?auto_772602 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_772603 ?auto_772600 ) ( IS-CRATE ?auto_772597 ) ( not ( = ?auto_772596 ?auto_772597 ) ) ( not ( = ?auto_772595 ?auto_772596 ) ) ( not ( = ?auto_772595 ?auto_772597 ) ) ( not ( = ?auto_772598 ?auto_772600 ) ) ( HOIST-AT ?auto_772599 ?auto_772598 ) ( not ( = ?auto_772603 ?auto_772599 ) ) ( AVAILABLE ?auto_772599 ) ( SURFACE-AT ?auto_772597 ?auto_772598 ) ( ON ?auto_772597 ?auto_772601 ) ( CLEAR ?auto_772597 ) ( not ( = ?auto_772596 ?auto_772601 ) ) ( not ( = ?auto_772597 ?auto_772601 ) ) ( not ( = ?auto_772595 ?auto_772601 ) ) ( TRUCK-AT ?auto_772602 ?auto_772600 ) ( SURFACE-AT ?auto_772595 ?auto_772600 ) ( CLEAR ?auto_772595 ) ( LIFTING ?auto_772603 ?auto_772596 ) ( IS-CRATE ?auto_772596 ) ( ON ?auto_772587 ?auto_772586 ) ( ON ?auto_772588 ?auto_772587 ) ( ON ?auto_772590 ?auto_772588 ) ( ON ?auto_772589 ?auto_772590 ) ( ON ?auto_772591 ?auto_772589 ) ( ON ?auto_772592 ?auto_772591 ) ( ON ?auto_772593 ?auto_772592 ) ( ON ?auto_772594 ?auto_772593 ) ( ON ?auto_772595 ?auto_772594 ) ( not ( = ?auto_772586 ?auto_772587 ) ) ( not ( = ?auto_772586 ?auto_772588 ) ) ( not ( = ?auto_772586 ?auto_772590 ) ) ( not ( = ?auto_772586 ?auto_772589 ) ) ( not ( = ?auto_772586 ?auto_772591 ) ) ( not ( = ?auto_772586 ?auto_772592 ) ) ( not ( = ?auto_772586 ?auto_772593 ) ) ( not ( = ?auto_772586 ?auto_772594 ) ) ( not ( = ?auto_772586 ?auto_772595 ) ) ( not ( = ?auto_772586 ?auto_772596 ) ) ( not ( = ?auto_772586 ?auto_772597 ) ) ( not ( = ?auto_772586 ?auto_772601 ) ) ( not ( = ?auto_772587 ?auto_772588 ) ) ( not ( = ?auto_772587 ?auto_772590 ) ) ( not ( = ?auto_772587 ?auto_772589 ) ) ( not ( = ?auto_772587 ?auto_772591 ) ) ( not ( = ?auto_772587 ?auto_772592 ) ) ( not ( = ?auto_772587 ?auto_772593 ) ) ( not ( = ?auto_772587 ?auto_772594 ) ) ( not ( = ?auto_772587 ?auto_772595 ) ) ( not ( = ?auto_772587 ?auto_772596 ) ) ( not ( = ?auto_772587 ?auto_772597 ) ) ( not ( = ?auto_772587 ?auto_772601 ) ) ( not ( = ?auto_772588 ?auto_772590 ) ) ( not ( = ?auto_772588 ?auto_772589 ) ) ( not ( = ?auto_772588 ?auto_772591 ) ) ( not ( = ?auto_772588 ?auto_772592 ) ) ( not ( = ?auto_772588 ?auto_772593 ) ) ( not ( = ?auto_772588 ?auto_772594 ) ) ( not ( = ?auto_772588 ?auto_772595 ) ) ( not ( = ?auto_772588 ?auto_772596 ) ) ( not ( = ?auto_772588 ?auto_772597 ) ) ( not ( = ?auto_772588 ?auto_772601 ) ) ( not ( = ?auto_772590 ?auto_772589 ) ) ( not ( = ?auto_772590 ?auto_772591 ) ) ( not ( = ?auto_772590 ?auto_772592 ) ) ( not ( = ?auto_772590 ?auto_772593 ) ) ( not ( = ?auto_772590 ?auto_772594 ) ) ( not ( = ?auto_772590 ?auto_772595 ) ) ( not ( = ?auto_772590 ?auto_772596 ) ) ( not ( = ?auto_772590 ?auto_772597 ) ) ( not ( = ?auto_772590 ?auto_772601 ) ) ( not ( = ?auto_772589 ?auto_772591 ) ) ( not ( = ?auto_772589 ?auto_772592 ) ) ( not ( = ?auto_772589 ?auto_772593 ) ) ( not ( = ?auto_772589 ?auto_772594 ) ) ( not ( = ?auto_772589 ?auto_772595 ) ) ( not ( = ?auto_772589 ?auto_772596 ) ) ( not ( = ?auto_772589 ?auto_772597 ) ) ( not ( = ?auto_772589 ?auto_772601 ) ) ( not ( = ?auto_772591 ?auto_772592 ) ) ( not ( = ?auto_772591 ?auto_772593 ) ) ( not ( = ?auto_772591 ?auto_772594 ) ) ( not ( = ?auto_772591 ?auto_772595 ) ) ( not ( = ?auto_772591 ?auto_772596 ) ) ( not ( = ?auto_772591 ?auto_772597 ) ) ( not ( = ?auto_772591 ?auto_772601 ) ) ( not ( = ?auto_772592 ?auto_772593 ) ) ( not ( = ?auto_772592 ?auto_772594 ) ) ( not ( = ?auto_772592 ?auto_772595 ) ) ( not ( = ?auto_772592 ?auto_772596 ) ) ( not ( = ?auto_772592 ?auto_772597 ) ) ( not ( = ?auto_772592 ?auto_772601 ) ) ( not ( = ?auto_772593 ?auto_772594 ) ) ( not ( = ?auto_772593 ?auto_772595 ) ) ( not ( = ?auto_772593 ?auto_772596 ) ) ( not ( = ?auto_772593 ?auto_772597 ) ) ( not ( = ?auto_772593 ?auto_772601 ) ) ( not ( = ?auto_772594 ?auto_772595 ) ) ( not ( = ?auto_772594 ?auto_772596 ) ) ( not ( = ?auto_772594 ?auto_772597 ) ) ( not ( = ?auto_772594 ?auto_772601 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_772595 ?auto_772596 ?auto_772597 )
      ( MAKE-11CRATE-VERIFY ?auto_772586 ?auto_772587 ?auto_772588 ?auto_772590 ?auto_772589 ?auto_772591 ?auto_772592 ?auto_772593 ?auto_772594 ?auto_772595 ?auto_772596 ?auto_772597 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_772730 - SURFACE
      ?auto_772731 - SURFACE
      ?auto_772732 - SURFACE
      ?auto_772734 - SURFACE
      ?auto_772733 - SURFACE
      ?auto_772735 - SURFACE
      ?auto_772736 - SURFACE
      ?auto_772737 - SURFACE
      ?auto_772738 - SURFACE
      ?auto_772739 - SURFACE
      ?auto_772740 - SURFACE
      ?auto_772741 - SURFACE
    )
    :vars
    (
      ?auto_772743 - HOIST
      ?auto_772745 - PLACE
      ?auto_772742 - PLACE
      ?auto_772746 - HOIST
      ?auto_772744 - SURFACE
      ?auto_772747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_772743 ?auto_772745 ) ( IS-CRATE ?auto_772741 ) ( not ( = ?auto_772740 ?auto_772741 ) ) ( not ( = ?auto_772739 ?auto_772740 ) ) ( not ( = ?auto_772739 ?auto_772741 ) ) ( not ( = ?auto_772742 ?auto_772745 ) ) ( HOIST-AT ?auto_772746 ?auto_772742 ) ( not ( = ?auto_772743 ?auto_772746 ) ) ( AVAILABLE ?auto_772746 ) ( SURFACE-AT ?auto_772741 ?auto_772742 ) ( ON ?auto_772741 ?auto_772744 ) ( CLEAR ?auto_772741 ) ( not ( = ?auto_772740 ?auto_772744 ) ) ( not ( = ?auto_772741 ?auto_772744 ) ) ( not ( = ?auto_772739 ?auto_772744 ) ) ( TRUCK-AT ?auto_772747 ?auto_772745 ) ( SURFACE-AT ?auto_772739 ?auto_772745 ) ( CLEAR ?auto_772739 ) ( IS-CRATE ?auto_772740 ) ( AVAILABLE ?auto_772743 ) ( IN ?auto_772740 ?auto_772747 ) ( ON ?auto_772731 ?auto_772730 ) ( ON ?auto_772732 ?auto_772731 ) ( ON ?auto_772734 ?auto_772732 ) ( ON ?auto_772733 ?auto_772734 ) ( ON ?auto_772735 ?auto_772733 ) ( ON ?auto_772736 ?auto_772735 ) ( ON ?auto_772737 ?auto_772736 ) ( ON ?auto_772738 ?auto_772737 ) ( ON ?auto_772739 ?auto_772738 ) ( not ( = ?auto_772730 ?auto_772731 ) ) ( not ( = ?auto_772730 ?auto_772732 ) ) ( not ( = ?auto_772730 ?auto_772734 ) ) ( not ( = ?auto_772730 ?auto_772733 ) ) ( not ( = ?auto_772730 ?auto_772735 ) ) ( not ( = ?auto_772730 ?auto_772736 ) ) ( not ( = ?auto_772730 ?auto_772737 ) ) ( not ( = ?auto_772730 ?auto_772738 ) ) ( not ( = ?auto_772730 ?auto_772739 ) ) ( not ( = ?auto_772730 ?auto_772740 ) ) ( not ( = ?auto_772730 ?auto_772741 ) ) ( not ( = ?auto_772730 ?auto_772744 ) ) ( not ( = ?auto_772731 ?auto_772732 ) ) ( not ( = ?auto_772731 ?auto_772734 ) ) ( not ( = ?auto_772731 ?auto_772733 ) ) ( not ( = ?auto_772731 ?auto_772735 ) ) ( not ( = ?auto_772731 ?auto_772736 ) ) ( not ( = ?auto_772731 ?auto_772737 ) ) ( not ( = ?auto_772731 ?auto_772738 ) ) ( not ( = ?auto_772731 ?auto_772739 ) ) ( not ( = ?auto_772731 ?auto_772740 ) ) ( not ( = ?auto_772731 ?auto_772741 ) ) ( not ( = ?auto_772731 ?auto_772744 ) ) ( not ( = ?auto_772732 ?auto_772734 ) ) ( not ( = ?auto_772732 ?auto_772733 ) ) ( not ( = ?auto_772732 ?auto_772735 ) ) ( not ( = ?auto_772732 ?auto_772736 ) ) ( not ( = ?auto_772732 ?auto_772737 ) ) ( not ( = ?auto_772732 ?auto_772738 ) ) ( not ( = ?auto_772732 ?auto_772739 ) ) ( not ( = ?auto_772732 ?auto_772740 ) ) ( not ( = ?auto_772732 ?auto_772741 ) ) ( not ( = ?auto_772732 ?auto_772744 ) ) ( not ( = ?auto_772734 ?auto_772733 ) ) ( not ( = ?auto_772734 ?auto_772735 ) ) ( not ( = ?auto_772734 ?auto_772736 ) ) ( not ( = ?auto_772734 ?auto_772737 ) ) ( not ( = ?auto_772734 ?auto_772738 ) ) ( not ( = ?auto_772734 ?auto_772739 ) ) ( not ( = ?auto_772734 ?auto_772740 ) ) ( not ( = ?auto_772734 ?auto_772741 ) ) ( not ( = ?auto_772734 ?auto_772744 ) ) ( not ( = ?auto_772733 ?auto_772735 ) ) ( not ( = ?auto_772733 ?auto_772736 ) ) ( not ( = ?auto_772733 ?auto_772737 ) ) ( not ( = ?auto_772733 ?auto_772738 ) ) ( not ( = ?auto_772733 ?auto_772739 ) ) ( not ( = ?auto_772733 ?auto_772740 ) ) ( not ( = ?auto_772733 ?auto_772741 ) ) ( not ( = ?auto_772733 ?auto_772744 ) ) ( not ( = ?auto_772735 ?auto_772736 ) ) ( not ( = ?auto_772735 ?auto_772737 ) ) ( not ( = ?auto_772735 ?auto_772738 ) ) ( not ( = ?auto_772735 ?auto_772739 ) ) ( not ( = ?auto_772735 ?auto_772740 ) ) ( not ( = ?auto_772735 ?auto_772741 ) ) ( not ( = ?auto_772735 ?auto_772744 ) ) ( not ( = ?auto_772736 ?auto_772737 ) ) ( not ( = ?auto_772736 ?auto_772738 ) ) ( not ( = ?auto_772736 ?auto_772739 ) ) ( not ( = ?auto_772736 ?auto_772740 ) ) ( not ( = ?auto_772736 ?auto_772741 ) ) ( not ( = ?auto_772736 ?auto_772744 ) ) ( not ( = ?auto_772737 ?auto_772738 ) ) ( not ( = ?auto_772737 ?auto_772739 ) ) ( not ( = ?auto_772737 ?auto_772740 ) ) ( not ( = ?auto_772737 ?auto_772741 ) ) ( not ( = ?auto_772737 ?auto_772744 ) ) ( not ( = ?auto_772738 ?auto_772739 ) ) ( not ( = ?auto_772738 ?auto_772740 ) ) ( not ( = ?auto_772738 ?auto_772741 ) ) ( not ( = ?auto_772738 ?auto_772744 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_772739 ?auto_772740 ?auto_772741 )
      ( MAKE-11CRATE-VERIFY ?auto_772730 ?auto_772731 ?auto_772732 ?auto_772734 ?auto_772733 ?auto_772735 ?auto_772736 ?auto_772737 ?auto_772738 ?auto_772739 ?auto_772740 ?auto_772741 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_781996 - SURFACE
      ?auto_781997 - SURFACE
      ?auto_781998 - SURFACE
      ?auto_782000 - SURFACE
      ?auto_781999 - SURFACE
      ?auto_782001 - SURFACE
      ?auto_782002 - SURFACE
      ?auto_782003 - SURFACE
      ?auto_782004 - SURFACE
      ?auto_782005 - SURFACE
      ?auto_782006 - SURFACE
      ?auto_782007 - SURFACE
      ?auto_782008 - SURFACE
    )
    :vars
    (
      ?auto_782009 - HOIST
      ?auto_782010 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_782009 ?auto_782010 ) ( SURFACE-AT ?auto_782007 ?auto_782010 ) ( CLEAR ?auto_782007 ) ( LIFTING ?auto_782009 ?auto_782008 ) ( IS-CRATE ?auto_782008 ) ( not ( = ?auto_782007 ?auto_782008 ) ) ( ON ?auto_781997 ?auto_781996 ) ( ON ?auto_781998 ?auto_781997 ) ( ON ?auto_782000 ?auto_781998 ) ( ON ?auto_781999 ?auto_782000 ) ( ON ?auto_782001 ?auto_781999 ) ( ON ?auto_782002 ?auto_782001 ) ( ON ?auto_782003 ?auto_782002 ) ( ON ?auto_782004 ?auto_782003 ) ( ON ?auto_782005 ?auto_782004 ) ( ON ?auto_782006 ?auto_782005 ) ( ON ?auto_782007 ?auto_782006 ) ( not ( = ?auto_781996 ?auto_781997 ) ) ( not ( = ?auto_781996 ?auto_781998 ) ) ( not ( = ?auto_781996 ?auto_782000 ) ) ( not ( = ?auto_781996 ?auto_781999 ) ) ( not ( = ?auto_781996 ?auto_782001 ) ) ( not ( = ?auto_781996 ?auto_782002 ) ) ( not ( = ?auto_781996 ?auto_782003 ) ) ( not ( = ?auto_781996 ?auto_782004 ) ) ( not ( = ?auto_781996 ?auto_782005 ) ) ( not ( = ?auto_781996 ?auto_782006 ) ) ( not ( = ?auto_781996 ?auto_782007 ) ) ( not ( = ?auto_781996 ?auto_782008 ) ) ( not ( = ?auto_781997 ?auto_781998 ) ) ( not ( = ?auto_781997 ?auto_782000 ) ) ( not ( = ?auto_781997 ?auto_781999 ) ) ( not ( = ?auto_781997 ?auto_782001 ) ) ( not ( = ?auto_781997 ?auto_782002 ) ) ( not ( = ?auto_781997 ?auto_782003 ) ) ( not ( = ?auto_781997 ?auto_782004 ) ) ( not ( = ?auto_781997 ?auto_782005 ) ) ( not ( = ?auto_781997 ?auto_782006 ) ) ( not ( = ?auto_781997 ?auto_782007 ) ) ( not ( = ?auto_781997 ?auto_782008 ) ) ( not ( = ?auto_781998 ?auto_782000 ) ) ( not ( = ?auto_781998 ?auto_781999 ) ) ( not ( = ?auto_781998 ?auto_782001 ) ) ( not ( = ?auto_781998 ?auto_782002 ) ) ( not ( = ?auto_781998 ?auto_782003 ) ) ( not ( = ?auto_781998 ?auto_782004 ) ) ( not ( = ?auto_781998 ?auto_782005 ) ) ( not ( = ?auto_781998 ?auto_782006 ) ) ( not ( = ?auto_781998 ?auto_782007 ) ) ( not ( = ?auto_781998 ?auto_782008 ) ) ( not ( = ?auto_782000 ?auto_781999 ) ) ( not ( = ?auto_782000 ?auto_782001 ) ) ( not ( = ?auto_782000 ?auto_782002 ) ) ( not ( = ?auto_782000 ?auto_782003 ) ) ( not ( = ?auto_782000 ?auto_782004 ) ) ( not ( = ?auto_782000 ?auto_782005 ) ) ( not ( = ?auto_782000 ?auto_782006 ) ) ( not ( = ?auto_782000 ?auto_782007 ) ) ( not ( = ?auto_782000 ?auto_782008 ) ) ( not ( = ?auto_781999 ?auto_782001 ) ) ( not ( = ?auto_781999 ?auto_782002 ) ) ( not ( = ?auto_781999 ?auto_782003 ) ) ( not ( = ?auto_781999 ?auto_782004 ) ) ( not ( = ?auto_781999 ?auto_782005 ) ) ( not ( = ?auto_781999 ?auto_782006 ) ) ( not ( = ?auto_781999 ?auto_782007 ) ) ( not ( = ?auto_781999 ?auto_782008 ) ) ( not ( = ?auto_782001 ?auto_782002 ) ) ( not ( = ?auto_782001 ?auto_782003 ) ) ( not ( = ?auto_782001 ?auto_782004 ) ) ( not ( = ?auto_782001 ?auto_782005 ) ) ( not ( = ?auto_782001 ?auto_782006 ) ) ( not ( = ?auto_782001 ?auto_782007 ) ) ( not ( = ?auto_782001 ?auto_782008 ) ) ( not ( = ?auto_782002 ?auto_782003 ) ) ( not ( = ?auto_782002 ?auto_782004 ) ) ( not ( = ?auto_782002 ?auto_782005 ) ) ( not ( = ?auto_782002 ?auto_782006 ) ) ( not ( = ?auto_782002 ?auto_782007 ) ) ( not ( = ?auto_782002 ?auto_782008 ) ) ( not ( = ?auto_782003 ?auto_782004 ) ) ( not ( = ?auto_782003 ?auto_782005 ) ) ( not ( = ?auto_782003 ?auto_782006 ) ) ( not ( = ?auto_782003 ?auto_782007 ) ) ( not ( = ?auto_782003 ?auto_782008 ) ) ( not ( = ?auto_782004 ?auto_782005 ) ) ( not ( = ?auto_782004 ?auto_782006 ) ) ( not ( = ?auto_782004 ?auto_782007 ) ) ( not ( = ?auto_782004 ?auto_782008 ) ) ( not ( = ?auto_782005 ?auto_782006 ) ) ( not ( = ?auto_782005 ?auto_782007 ) ) ( not ( = ?auto_782005 ?auto_782008 ) ) ( not ( = ?auto_782006 ?auto_782007 ) ) ( not ( = ?auto_782006 ?auto_782008 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_782007 ?auto_782008 )
      ( MAKE-12CRATE-VERIFY ?auto_781996 ?auto_781997 ?auto_781998 ?auto_782000 ?auto_781999 ?auto_782001 ?auto_782002 ?auto_782003 ?auto_782004 ?auto_782005 ?auto_782006 ?auto_782007 ?auto_782008 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_782121 - SURFACE
      ?auto_782122 - SURFACE
      ?auto_782123 - SURFACE
      ?auto_782125 - SURFACE
      ?auto_782124 - SURFACE
      ?auto_782126 - SURFACE
      ?auto_782127 - SURFACE
      ?auto_782128 - SURFACE
      ?auto_782129 - SURFACE
      ?auto_782130 - SURFACE
      ?auto_782131 - SURFACE
      ?auto_782132 - SURFACE
      ?auto_782133 - SURFACE
    )
    :vars
    (
      ?auto_782134 - HOIST
      ?auto_782136 - PLACE
      ?auto_782135 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_782134 ?auto_782136 ) ( SURFACE-AT ?auto_782132 ?auto_782136 ) ( CLEAR ?auto_782132 ) ( IS-CRATE ?auto_782133 ) ( not ( = ?auto_782132 ?auto_782133 ) ) ( TRUCK-AT ?auto_782135 ?auto_782136 ) ( AVAILABLE ?auto_782134 ) ( IN ?auto_782133 ?auto_782135 ) ( ON ?auto_782132 ?auto_782131 ) ( not ( = ?auto_782131 ?auto_782132 ) ) ( not ( = ?auto_782131 ?auto_782133 ) ) ( ON ?auto_782122 ?auto_782121 ) ( ON ?auto_782123 ?auto_782122 ) ( ON ?auto_782125 ?auto_782123 ) ( ON ?auto_782124 ?auto_782125 ) ( ON ?auto_782126 ?auto_782124 ) ( ON ?auto_782127 ?auto_782126 ) ( ON ?auto_782128 ?auto_782127 ) ( ON ?auto_782129 ?auto_782128 ) ( ON ?auto_782130 ?auto_782129 ) ( ON ?auto_782131 ?auto_782130 ) ( not ( = ?auto_782121 ?auto_782122 ) ) ( not ( = ?auto_782121 ?auto_782123 ) ) ( not ( = ?auto_782121 ?auto_782125 ) ) ( not ( = ?auto_782121 ?auto_782124 ) ) ( not ( = ?auto_782121 ?auto_782126 ) ) ( not ( = ?auto_782121 ?auto_782127 ) ) ( not ( = ?auto_782121 ?auto_782128 ) ) ( not ( = ?auto_782121 ?auto_782129 ) ) ( not ( = ?auto_782121 ?auto_782130 ) ) ( not ( = ?auto_782121 ?auto_782131 ) ) ( not ( = ?auto_782121 ?auto_782132 ) ) ( not ( = ?auto_782121 ?auto_782133 ) ) ( not ( = ?auto_782122 ?auto_782123 ) ) ( not ( = ?auto_782122 ?auto_782125 ) ) ( not ( = ?auto_782122 ?auto_782124 ) ) ( not ( = ?auto_782122 ?auto_782126 ) ) ( not ( = ?auto_782122 ?auto_782127 ) ) ( not ( = ?auto_782122 ?auto_782128 ) ) ( not ( = ?auto_782122 ?auto_782129 ) ) ( not ( = ?auto_782122 ?auto_782130 ) ) ( not ( = ?auto_782122 ?auto_782131 ) ) ( not ( = ?auto_782122 ?auto_782132 ) ) ( not ( = ?auto_782122 ?auto_782133 ) ) ( not ( = ?auto_782123 ?auto_782125 ) ) ( not ( = ?auto_782123 ?auto_782124 ) ) ( not ( = ?auto_782123 ?auto_782126 ) ) ( not ( = ?auto_782123 ?auto_782127 ) ) ( not ( = ?auto_782123 ?auto_782128 ) ) ( not ( = ?auto_782123 ?auto_782129 ) ) ( not ( = ?auto_782123 ?auto_782130 ) ) ( not ( = ?auto_782123 ?auto_782131 ) ) ( not ( = ?auto_782123 ?auto_782132 ) ) ( not ( = ?auto_782123 ?auto_782133 ) ) ( not ( = ?auto_782125 ?auto_782124 ) ) ( not ( = ?auto_782125 ?auto_782126 ) ) ( not ( = ?auto_782125 ?auto_782127 ) ) ( not ( = ?auto_782125 ?auto_782128 ) ) ( not ( = ?auto_782125 ?auto_782129 ) ) ( not ( = ?auto_782125 ?auto_782130 ) ) ( not ( = ?auto_782125 ?auto_782131 ) ) ( not ( = ?auto_782125 ?auto_782132 ) ) ( not ( = ?auto_782125 ?auto_782133 ) ) ( not ( = ?auto_782124 ?auto_782126 ) ) ( not ( = ?auto_782124 ?auto_782127 ) ) ( not ( = ?auto_782124 ?auto_782128 ) ) ( not ( = ?auto_782124 ?auto_782129 ) ) ( not ( = ?auto_782124 ?auto_782130 ) ) ( not ( = ?auto_782124 ?auto_782131 ) ) ( not ( = ?auto_782124 ?auto_782132 ) ) ( not ( = ?auto_782124 ?auto_782133 ) ) ( not ( = ?auto_782126 ?auto_782127 ) ) ( not ( = ?auto_782126 ?auto_782128 ) ) ( not ( = ?auto_782126 ?auto_782129 ) ) ( not ( = ?auto_782126 ?auto_782130 ) ) ( not ( = ?auto_782126 ?auto_782131 ) ) ( not ( = ?auto_782126 ?auto_782132 ) ) ( not ( = ?auto_782126 ?auto_782133 ) ) ( not ( = ?auto_782127 ?auto_782128 ) ) ( not ( = ?auto_782127 ?auto_782129 ) ) ( not ( = ?auto_782127 ?auto_782130 ) ) ( not ( = ?auto_782127 ?auto_782131 ) ) ( not ( = ?auto_782127 ?auto_782132 ) ) ( not ( = ?auto_782127 ?auto_782133 ) ) ( not ( = ?auto_782128 ?auto_782129 ) ) ( not ( = ?auto_782128 ?auto_782130 ) ) ( not ( = ?auto_782128 ?auto_782131 ) ) ( not ( = ?auto_782128 ?auto_782132 ) ) ( not ( = ?auto_782128 ?auto_782133 ) ) ( not ( = ?auto_782129 ?auto_782130 ) ) ( not ( = ?auto_782129 ?auto_782131 ) ) ( not ( = ?auto_782129 ?auto_782132 ) ) ( not ( = ?auto_782129 ?auto_782133 ) ) ( not ( = ?auto_782130 ?auto_782131 ) ) ( not ( = ?auto_782130 ?auto_782132 ) ) ( not ( = ?auto_782130 ?auto_782133 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_782131 ?auto_782132 ?auto_782133 )
      ( MAKE-12CRATE-VERIFY ?auto_782121 ?auto_782122 ?auto_782123 ?auto_782125 ?auto_782124 ?auto_782126 ?auto_782127 ?auto_782128 ?auto_782129 ?auto_782130 ?auto_782131 ?auto_782132 ?auto_782133 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_782259 - SURFACE
      ?auto_782260 - SURFACE
      ?auto_782261 - SURFACE
      ?auto_782263 - SURFACE
      ?auto_782262 - SURFACE
      ?auto_782264 - SURFACE
      ?auto_782265 - SURFACE
      ?auto_782266 - SURFACE
      ?auto_782267 - SURFACE
      ?auto_782268 - SURFACE
      ?auto_782269 - SURFACE
      ?auto_782270 - SURFACE
      ?auto_782271 - SURFACE
    )
    :vars
    (
      ?auto_782275 - HOIST
      ?auto_782274 - PLACE
      ?auto_782272 - TRUCK
      ?auto_782273 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_782275 ?auto_782274 ) ( SURFACE-AT ?auto_782270 ?auto_782274 ) ( CLEAR ?auto_782270 ) ( IS-CRATE ?auto_782271 ) ( not ( = ?auto_782270 ?auto_782271 ) ) ( AVAILABLE ?auto_782275 ) ( IN ?auto_782271 ?auto_782272 ) ( ON ?auto_782270 ?auto_782269 ) ( not ( = ?auto_782269 ?auto_782270 ) ) ( not ( = ?auto_782269 ?auto_782271 ) ) ( TRUCK-AT ?auto_782272 ?auto_782273 ) ( not ( = ?auto_782273 ?auto_782274 ) ) ( ON ?auto_782260 ?auto_782259 ) ( ON ?auto_782261 ?auto_782260 ) ( ON ?auto_782263 ?auto_782261 ) ( ON ?auto_782262 ?auto_782263 ) ( ON ?auto_782264 ?auto_782262 ) ( ON ?auto_782265 ?auto_782264 ) ( ON ?auto_782266 ?auto_782265 ) ( ON ?auto_782267 ?auto_782266 ) ( ON ?auto_782268 ?auto_782267 ) ( ON ?auto_782269 ?auto_782268 ) ( not ( = ?auto_782259 ?auto_782260 ) ) ( not ( = ?auto_782259 ?auto_782261 ) ) ( not ( = ?auto_782259 ?auto_782263 ) ) ( not ( = ?auto_782259 ?auto_782262 ) ) ( not ( = ?auto_782259 ?auto_782264 ) ) ( not ( = ?auto_782259 ?auto_782265 ) ) ( not ( = ?auto_782259 ?auto_782266 ) ) ( not ( = ?auto_782259 ?auto_782267 ) ) ( not ( = ?auto_782259 ?auto_782268 ) ) ( not ( = ?auto_782259 ?auto_782269 ) ) ( not ( = ?auto_782259 ?auto_782270 ) ) ( not ( = ?auto_782259 ?auto_782271 ) ) ( not ( = ?auto_782260 ?auto_782261 ) ) ( not ( = ?auto_782260 ?auto_782263 ) ) ( not ( = ?auto_782260 ?auto_782262 ) ) ( not ( = ?auto_782260 ?auto_782264 ) ) ( not ( = ?auto_782260 ?auto_782265 ) ) ( not ( = ?auto_782260 ?auto_782266 ) ) ( not ( = ?auto_782260 ?auto_782267 ) ) ( not ( = ?auto_782260 ?auto_782268 ) ) ( not ( = ?auto_782260 ?auto_782269 ) ) ( not ( = ?auto_782260 ?auto_782270 ) ) ( not ( = ?auto_782260 ?auto_782271 ) ) ( not ( = ?auto_782261 ?auto_782263 ) ) ( not ( = ?auto_782261 ?auto_782262 ) ) ( not ( = ?auto_782261 ?auto_782264 ) ) ( not ( = ?auto_782261 ?auto_782265 ) ) ( not ( = ?auto_782261 ?auto_782266 ) ) ( not ( = ?auto_782261 ?auto_782267 ) ) ( not ( = ?auto_782261 ?auto_782268 ) ) ( not ( = ?auto_782261 ?auto_782269 ) ) ( not ( = ?auto_782261 ?auto_782270 ) ) ( not ( = ?auto_782261 ?auto_782271 ) ) ( not ( = ?auto_782263 ?auto_782262 ) ) ( not ( = ?auto_782263 ?auto_782264 ) ) ( not ( = ?auto_782263 ?auto_782265 ) ) ( not ( = ?auto_782263 ?auto_782266 ) ) ( not ( = ?auto_782263 ?auto_782267 ) ) ( not ( = ?auto_782263 ?auto_782268 ) ) ( not ( = ?auto_782263 ?auto_782269 ) ) ( not ( = ?auto_782263 ?auto_782270 ) ) ( not ( = ?auto_782263 ?auto_782271 ) ) ( not ( = ?auto_782262 ?auto_782264 ) ) ( not ( = ?auto_782262 ?auto_782265 ) ) ( not ( = ?auto_782262 ?auto_782266 ) ) ( not ( = ?auto_782262 ?auto_782267 ) ) ( not ( = ?auto_782262 ?auto_782268 ) ) ( not ( = ?auto_782262 ?auto_782269 ) ) ( not ( = ?auto_782262 ?auto_782270 ) ) ( not ( = ?auto_782262 ?auto_782271 ) ) ( not ( = ?auto_782264 ?auto_782265 ) ) ( not ( = ?auto_782264 ?auto_782266 ) ) ( not ( = ?auto_782264 ?auto_782267 ) ) ( not ( = ?auto_782264 ?auto_782268 ) ) ( not ( = ?auto_782264 ?auto_782269 ) ) ( not ( = ?auto_782264 ?auto_782270 ) ) ( not ( = ?auto_782264 ?auto_782271 ) ) ( not ( = ?auto_782265 ?auto_782266 ) ) ( not ( = ?auto_782265 ?auto_782267 ) ) ( not ( = ?auto_782265 ?auto_782268 ) ) ( not ( = ?auto_782265 ?auto_782269 ) ) ( not ( = ?auto_782265 ?auto_782270 ) ) ( not ( = ?auto_782265 ?auto_782271 ) ) ( not ( = ?auto_782266 ?auto_782267 ) ) ( not ( = ?auto_782266 ?auto_782268 ) ) ( not ( = ?auto_782266 ?auto_782269 ) ) ( not ( = ?auto_782266 ?auto_782270 ) ) ( not ( = ?auto_782266 ?auto_782271 ) ) ( not ( = ?auto_782267 ?auto_782268 ) ) ( not ( = ?auto_782267 ?auto_782269 ) ) ( not ( = ?auto_782267 ?auto_782270 ) ) ( not ( = ?auto_782267 ?auto_782271 ) ) ( not ( = ?auto_782268 ?auto_782269 ) ) ( not ( = ?auto_782268 ?auto_782270 ) ) ( not ( = ?auto_782268 ?auto_782271 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_782269 ?auto_782270 ?auto_782271 )
      ( MAKE-12CRATE-VERIFY ?auto_782259 ?auto_782260 ?auto_782261 ?auto_782263 ?auto_782262 ?auto_782264 ?auto_782265 ?auto_782266 ?auto_782267 ?auto_782268 ?auto_782269 ?auto_782270 ?auto_782271 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_782409 - SURFACE
      ?auto_782410 - SURFACE
      ?auto_782411 - SURFACE
      ?auto_782413 - SURFACE
      ?auto_782412 - SURFACE
      ?auto_782414 - SURFACE
      ?auto_782415 - SURFACE
      ?auto_782416 - SURFACE
      ?auto_782417 - SURFACE
      ?auto_782418 - SURFACE
      ?auto_782419 - SURFACE
      ?auto_782420 - SURFACE
      ?auto_782421 - SURFACE
    )
    :vars
    (
      ?auto_782425 - HOIST
      ?auto_782423 - PLACE
      ?auto_782422 - TRUCK
      ?auto_782424 - PLACE
      ?auto_782426 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_782425 ?auto_782423 ) ( SURFACE-AT ?auto_782420 ?auto_782423 ) ( CLEAR ?auto_782420 ) ( IS-CRATE ?auto_782421 ) ( not ( = ?auto_782420 ?auto_782421 ) ) ( AVAILABLE ?auto_782425 ) ( ON ?auto_782420 ?auto_782419 ) ( not ( = ?auto_782419 ?auto_782420 ) ) ( not ( = ?auto_782419 ?auto_782421 ) ) ( TRUCK-AT ?auto_782422 ?auto_782424 ) ( not ( = ?auto_782424 ?auto_782423 ) ) ( HOIST-AT ?auto_782426 ?auto_782424 ) ( LIFTING ?auto_782426 ?auto_782421 ) ( not ( = ?auto_782425 ?auto_782426 ) ) ( ON ?auto_782410 ?auto_782409 ) ( ON ?auto_782411 ?auto_782410 ) ( ON ?auto_782413 ?auto_782411 ) ( ON ?auto_782412 ?auto_782413 ) ( ON ?auto_782414 ?auto_782412 ) ( ON ?auto_782415 ?auto_782414 ) ( ON ?auto_782416 ?auto_782415 ) ( ON ?auto_782417 ?auto_782416 ) ( ON ?auto_782418 ?auto_782417 ) ( ON ?auto_782419 ?auto_782418 ) ( not ( = ?auto_782409 ?auto_782410 ) ) ( not ( = ?auto_782409 ?auto_782411 ) ) ( not ( = ?auto_782409 ?auto_782413 ) ) ( not ( = ?auto_782409 ?auto_782412 ) ) ( not ( = ?auto_782409 ?auto_782414 ) ) ( not ( = ?auto_782409 ?auto_782415 ) ) ( not ( = ?auto_782409 ?auto_782416 ) ) ( not ( = ?auto_782409 ?auto_782417 ) ) ( not ( = ?auto_782409 ?auto_782418 ) ) ( not ( = ?auto_782409 ?auto_782419 ) ) ( not ( = ?auto_782409 ?auto_782420 ) ) ( not ( = ?auto_782409 ?auto_782421 ) ) ( not ( = ?auto_782410 ?auto_782411 ) ) ( not ( = ?auto_782410 ?auto_782413 ) ) ( not ( = ?auto_782410 ?auto_782412 ) ) ( not ( = ?auto_782410 ?auto_782414 ) ) ( not ( = ?auto_782410 ?auto_782415 ) ) ( not ( = ?auto_782410 ?auto_782416 ) ) ( not ( = ?auto_782410 ?auto_782417 ) ) ( not ( = ?auto_782410 ?auto_782418 ) ) ( not ( = ?auto_782410 ?auto_782419 ) ) ( not ( = ?auto_782410 ?auto_782420 ) ) ( not ( = ?auto_782410 ?auto_782421 ) ) ( not ( = ?auto_782411 ?auto_782413 ) ) ( not ( = ?auto_782411 ?auto_782412 ) ) ( not ( = ?auto_782411 ?auto_782414 ) ) ( not ( = ?auto_782411 ?auto_782415 ) ) ( not ( = ?auto_782411 ?auto_782416 ) ) ( not ( = ?auto_782411 ?auto_782417 ) ) ( not ( = ?auto_782411 ?auto_782418 ) ) ( not ( = ?auto_782411 ?auto_782419 ) ) ( not ( = ?auto_782411 ?auto_782420 ) ) ( not ( = ?auto_782411 ?auto_782421 ) ) ( not ( = ?auto_782413 ?auto_782412 ) ) ( not ( = ?auto_782413 ?auto_782414 ) ) ( not ( = ?auto_782413 ?auto_782415 ) ) ( not ( = ?auto_782413 ?auto_782416 ) ) ( not ( = ?auto_782413 ?auto_782417 ) ) ( not ( = ?auto_782413 ?auto_782418 ) ) ( not ( = ?auto_782413 ?auto_782419 ) ) ( not ( = ?auto_782413 ?auto_782420 ) ) ( not ( = ?auto_782413 ?auto_782421 ) ) ( not ( = ?auto_782412 ?auto_782414 ) ) ( not ( = ?auto_782412 ?auto_782415 ) ) ( not ( = ?auto_782412 ?auto_782416 ) ) ( not ( = ?auto_782412 ?auto_782417 ) ) ( not ( = ?auto_782412 ?auto_782418 ) ) ( not ( = ?auto_782412 ?auto_782419 ) ) ( not ( = ?auto_782412 ?auto_782420 ) ) ( not ( = ?auto_782412 ?auto_782421 ) ) ( not ( = ?auto_782414 ?auto_782415 ) ) ( not ( = ?auto_782414 ?auto_782416 ) ) ( not ( = ?auto_782414 ?auto_782417 ) ) ( not ( = ?auto_782414 ?auto_782418 ) ) ( not ( = ?auto_782414 ?auto_782419 ) ) ( not ( = ?auto_782414 ?auto_782420 ) ) ( not ( = ?auto_782414 ?auto_782421 ) ) ( not ( = ?auto_782415 ?auto_782416 ) ) ( not ( = ?auto_782415 ?auto_782417 ) ) ( not ( = ?auto_782415 ?auto_782418 ) ) ( not ( = ?auto_782415 ?auto_782419 ) ) ( not ( = ?auto_782415 ?auto_782420 ) ) ( not ( = ?auto_782415 ?auto_782421 ) ) ( not ( = ?auto_782416 ?auto_782417 ) ) ( not ( = ?auto_782416 ?auto_782418 ) ) ( not ( = ?auto_782416 ?auto_782419 ) ) ( not ( = ?auto_782416 ?auto_782420 ) ) ( not ( = ?auto_782416 ?auto_782421 ) ) ( not ( = ?auto_782417 ?auto_782418 ) ) ( not ( = ?auto_782417 ?auto_782419 ) ) ( not ( = ?auto_782417 ?auto_782420 ) ) ( not ( = ?auto_782417 ?auto_782421 ) ) ( not ( = ?auto_782418 ?auto_782419 ) ) ( not ( = ?auto_782418 ?auto_782420 ) ) ( not ( = ?auto_782418 ?auto_782421 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_782419 ?auto_782420 ?auto_782421 )
      ( MAKE-12CRATE-VERIFY ?auto_782409 ?auto_782410 ?auto_782411 ?auto_782413 ?auto_782412 ?auto_782414 ?auto_782415 ?auto_782416 ?auto_782417 ?auto_782418 ?auto_782419 ?auto_782420 ?auto_782421 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_782571 - SURFACE
      ?auto_782572 - SURFACE
      ?auto_782573 - SURFACE
      ?auto_782575 - SURFACE
      ?auto_782574 - SURFACE
      ?auto_782576 - SURFACE
      ?auto_782577 - SURFACE
      ?auto_782578 - SURFACE
      ?auto_782579 - SURFACE
      ?auto_782580 - SURFACE
      ?auto_782581 - SURFACE
      ?auto_782582 - SURFACE
      ?auto_782583 - SURFACE
    )
    :vars
    (
      ?auto_782584 - HOIST
      ?auto_782588 - PLACE
      ?auto_782586 - TRUCK
      ?auto_782589 - PLACE
      ?auto_782585 - HOIST
      ?auto_782587 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_782584 ?auto_782588 ) ( SURFACE-AT ?auto_782582 ?auto_782588 ) ( CLEAR ?auto_782582 ) ( IS-CRATE ?auto_782583 ) ( not ( = ?auto_782582 ?auto_782583 ) ) ( AVAILABLE ?auto_782584 ) ( ON ?auto_782582 ?auto_782581 ) ( not ( = ?auto_782581 ?auto_782582 ) ) ( not ( = ?auto_782581 ?auto_782583 ) ) ( TRUCK-AT ?auto_782586 ?auto_782589 ) ( not ( = ?auto_782589 ?auto_782588 ) ) ( HOIST-AT ?auto_782585 ?auto_782589 ) ( not ( = ?auto_782584 ?auto_782585 ) ) ( AVAILABLE ?auto_782585 ) ( SURFACE-AT ?auto_782583 ?auto_782589 ) ( ON ?auto_782583 ?auto_782587 ) ( CLEAR ?auto_782583 ) ( not ( = ?auto_782582 ?auto_782587 ) ) ( not ( = ?auto_782583 ?auto_782587 ) ) ( not ( = ?auto_782581 ?auto_782587 ) ) ( ON ?auto_782572 ?auto_782571 ) ( ON ?auto_782573 ?auto_782572 ) ( ON ?auto_782575 ?auto_782573 ) ( ON ?auto_782574 ?auto_782575 ) ( ON ?auto_782576 ?auto_782574 ) ( ON ?auto_782577 ?auto_782576 ) ( ON ?auto_782578 ?auto_782577 ) ( ON ?auto_782579 ?auto_782578 ) ( ON ?auto_782580 ?auto_782579 ) ( ON ?auto_782581 ?auto_782580 ) ( not ( = ?auto_782571 ?auto_782572 ) ) ( not ( = ?auto_782571 ?auto_782573 ) ) ( not ( = ?auto_782571 ?auto_782575 ) ) ( not ( = ?auto_782571 ?auto_782574 ) ) ( not ( = ?auto_782571 ?auto_782576 ) ) ( not ( = ?auto_782571 ?auto_782577 ) ) ( not ( = ?auto_782571 ?auto_782578 ) ) ( not ( = ?auto_782571 ?auto_782579 ) ) ( not ( = ?auto_782571 ?auto_782580 ) ) ( not ( = ?auto_782571 ?auto_782581 ) ) ( not ( = ?auto_782571 ?auto_782582 ) ) ( not ( = ?auto_782571 ?auto_782583 ) ) ( not ( = ?auto_782571 ?auto_782587 ) ) ( not ( = ?auto_782572 ?auto_782573 ) ) ( not ( = ?auto_782572 ?auto_782575 ) ) ( not ( = ?auto_782572 ?auto_782574 ) ) ( not ( = ?auto_782572 ?auto_782576 ) ) ( not ( = ?auto_782572 ?auto_782577 ) ) ( not ( = ?auto_782572 ?auto_782578 ) ) ( not ( = ?auto_782572 ?auto_782579 ) ) ( not ( = ?auto_782572 ?auto_782580 ) ) ( not ( = ?auto_782572 ?auto_782581 ) ) ( not ( = ?auto_782572 ?auto_782582 ) ) ( not ( = ?auto_782572 ?auto_782583 ) ) ( not ( = ?auto_782572 ?auto_782587 ) ) ( not ( = ?auto_782573 ?auto_782575 ) ) ( not ( = ?auto_782573 ?auto_782574 ) ) ( not ( = ?auto_782573 ?auto_782576 ) ) ( not ( = ?auto_782573 ?auto_782577 ) ) ( not ( = ?auto_782573 ?auto_782578 ) ) ( not ( = ?auto_782573 ?auto_782579 ) ) ( not ( = ?auto_782573 ?auto_782580 ) ) ( not ( = ?auto_782573 ?auto_782581 ) ) ( not ( = ?auto_782573 ?auto_782582 ) ) ( not ( = ?auto_782573 ?auto_782583 ) ) ( not ( = ?auto_782573 ?auto_782587 ) ) ( not ( = ?auto_782575 ?auto_782574 ) ) ( not ( = ?auto_782575 ?auto_782576 ) ) ( not ( = ?auto_782575 ?auto_782577 ) ) ( not ( = ?auto_782575 ?auto_782578 ) ) ( not ( = ?auto_782575 ?auto_782579 ) ) ( not ( = ?auto_782575 ?auto_782580 ) ) ( not ( = ?auto_782575 ?auto_782581 ) ) ( not ( = ?auto_782575 ?auto_782582 ) ) ( not ( = ?auto_782575 ?auto_782583 ) ) ( not ( = ?auto_782575 ?auto_782587 ) ) ( not ( = ?auto_782574 ?auto_782576 ) ) ( not ( = ?auto_782574 ?auto_782577 ) ) ( not ( = ?auto_782574 ?auto_782578 ) ) ( not ( = ?auto_782574 ?auto_782579 ) ) ( not ( = ?auto_782574 ?auto_782580 ) ) ( not ( = ?auto_782574 ?auto_782581 ) ) ( not ( = ?auto_782574 ?auto_782582 ) ) ( not ( = ?auto_782574 ?auto_782583 ) ) ( not ( = ?auto_782574 ?auto_782587 ) ) ( not ( = ?auto_782576 ?auto_782577 ) ) ( not ( = ?auto_782576 ?auto_782578 ) ) ( not ( = ?auto_782576 ?auto_782579 ) ) ( not ( = ?auto_782576 ?auto_782580 ) ) ( not ( = ?auto_782576 ?auto_782581 ) ) ( not ( = ?auto_782576 ?auto_782582 ) ) ( not ( = ?auto_782576 ?auto_782583 ) ) ( not ( = ?auto_782576 ?auto_782587 ) ) ( not ( = ?auto_782577 ?auto_782578 ) ) ( not ( = ?auto_782577 ?auto_782579 ) ) ( not ( = ?auto_782577 ?auto_782580 ) ) ( not ( = ?auto_782577 ?auto_782581 ) ) ( not ( = ?auto_782577 ?auto_782582 ) ) ( not ( = ?auto_782577 ?auto_782583 ) ) ( not ( = ?auto_782577 ?auto_782587 ) ) ( not ( = ?auto_782578 ?auto_782579 ) ) ( not ( = ?auto_782578 ?auto_782580 ) ) ( not ( = ?auto_782578 ?auto_782581 ) ) ( not ( = ?auto_782578 ?auto_782582 ) ) ( not ( = ?auto_782578 ?auto_782583 ) ) ( not ( = ?auto_782578 ?auto_782587 ) ) ( not ( = ?auto_782579 ?auto_782580 ) ) ( not ( = ?auto_782579 ?auto_782581 ) ) ( not ( = ?auto_782579 ?auto_782582 ) ) ( not ( = ?auto_782579 ?auto_782583 ) ) ( not ( = ?auto_782579 ?auto_782587 ) ) ( not ( = ?auto_782580 ?auto_782581 ) ) ( not ( = ?auto_782580 ?auto_782582 ) ) ( not ( = ?auto_782580 ?auto_782583 ) ) ( not ( = ?auto_782580 ?auto_782587 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_782581 ?auto_782582 ?auto_782583 )
      ( MAKE-12CRATE-VERIFY ?auto_782571 ?auto_782572 ?auto_782573 ?auto_782575 ?auto_782574 ?auto_782576 ?auto_782577 ?auto_782578 ?auto_782579 ?auto_782580 ?auto_782581 ?auto_782582 ?auto_782583 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_782734 - SURFACE
      ?auto_782735 - SURFACE
      ?auto_782736 - SURFACE
      ?auto_782738 - SURFACE
      ?auto_782737 - SURFACE
      ?auto_782739 - SURFACE
      ?auto_782740 - SURFACE
      ?auto_782741 - SURFACE
      ?auto_782742 - SURFACE
      ?auto_782743 - SURFACE
      ?auto_782744 - SURFACE
      ?auto_782745 - SURFACE
      ?auto_782746 - SURFACE
    )
    :vars
    (
      ?auto_782747 - HOIST
      ?auto_782748 - PLACE
      ?auto_782751 - PLACE
      ?auto_782752 - HOIST
      ?auto_782750 - SURFACE
      ?auto_782749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_782747 ?auto_782748 ) ( SURFACE-AT ?auto_782745 ?auto_782748 ) ( CLEAR ?auto_782745 ) ( IS-CRATE ?auto_782746 ) ( not ( = ?auto_782745 ?auto_782746 ) ) ( AVAILABLE ?auto_782747 ) ( ON ?auto_782745 ?auto_782744 ) ( not ( = ?auto_782744 ?auto_782745 ) ) ( not ( = ?auto_782744 ?auto_782746 ) ) ( not ( = ?auto_782751 ?auto_782748 ) ) ( HOIST-AT ?auto_782752 ?auto_782751 ) ( not ( = ?auto_782747 ?auto_782752 ) ) ( AVAILABLE ?auto_782752 ) ( SURFACE-AT ?auto_782746 ?auto_782751 ) ( ON ?auto_782746 ?auto_782750 ) ( CLEAR ?auto_782746 ) ( not ( = ?auto_782745 ?auto_782750 ) ) ( not ( = ?auto_782746 ?auto_782750 ) ) ( not ( = ?auto_782744 ?auto_782750 ) ) ( TRUCK-AT ?auto_782749 ?auto_782748 ) ( ON ?auto_782735 ?auto_782734 ) ( ON ?auto_782736 ?auto_782735 ) ( ON ?auto_782738 ?auto_782736 ) ( ON ?auto_782737 ?auto_782738 ) ( ON ?auto_782739 ?auto_782737 ) ( ON ?auto_782740 ?auto_782739 ) ( ON ?auto_782741 ?auto_782740 ) ( ON ?auto_782742 ?auto_782741 ) ( ON ?auto_782743 ?auto_782742 ) ( ON ?auto_782744 ?auto_782743 ) ( not ( = ?auto_782734 ?auto_782735 ) ) ( not ( = ?auto_782734 ?auto_782736 ) ) ( not ( = ?auto_782734 ?auto_782738 ) ) ( not ( = ?auto_782734 ?auto_782737 ) ) ( not ( = ?auto_782734 ?auto_782739 ) ) ( not ( = ?auto_782734 ?auto_782740 ) ) ( not ( = ?auto_782734 ?auto_782741 ) ) ( not ( = ?auto_782734 ?auto_782742 ) ) ( not ( = ?auto_782734 ?auto_782743 ) ) ( not ( = ?auto_782734 ?auto_782744 ) ) ( not ( = ?auto_782734 ?auto_782745 ) ) ( not ( = ?auto_782734 ?auto_782746 ) ) ( not ( = ?auto_782734 ?auto_782750 ) ) ( not ( = ?auto_782735 ?auto_782736 ) ) ( not ( = ?auto_782735 ?auto_782738 ) ) ( not ( = ?auto_782735 ?auto_782737 ) ) ( not ( = ?auto_782735 ?auto_782739 ) ) ( not ( = ?auto_782735 ?auto_782740 ) ) ( not ( = ?auto_782735 ?auto_782741 ) ) ( not ( = ?auto_782735 ?auto_782742 ) ) ( not ( = ?auto_782735 ?auto_782743 ) ) ( not ( = ?auto_782735 ?auto_782744 ) ) ( not ( = ?auto_782735 ?auto_782745 ) ) ( not ( = ?auto_782735 ?auto_782746 ) ) ( not ( = ?auto_782735 ?auto_782750 ) ) ( not ( = ?auto_782736 ?auto_782738 ) ) ( not ( = ?auto_782736 ?auto_782737 ) ) ( not ( = ?auto_782736 ?auto_782739 ) ) ( not ( = ?auto_782736 ?auto_782740 ) ) ( not ( = ?auto_782736 ?auto_782741 ) ) ( not ( = ?auto_782736 ?auto_782742 ) ) ( not ( = ?auto_782736 ?auto_782743 ) ) ( not ( = ?auto_782736 ?auto_782744 ) ) ( not ( = ?auto_782736 ?auto_782745 ) ) ( not ( = ?auto_782736 ?auto_782746 ) ) ( not ( = ?auto_782736 ?auto_782750 ) ) ( not ( = ?auto_782738 ?auto_782737 ) ) ( not ( = ?auto_782738 ?auto_782739 ) ) ( not ( = ?auto_782738 ?auto_782740 ) ) ( not ( = ?auto_782738 ?auto_782741 ) ) ( not ( = ?auto_782738 ?auto_782742 ) ) ( not ( = ?auto_782738 ?auto_782743 ) ) ( not ( = ?auto_782738 ?auto_782744 ) ) ( not ( = ?auto_782738 ?auto_782745 ) ) ( not ( = ?auto_782738 ?auto_782746 ) ) ( not ( = ?auto_782738 ?auto_782750 ) ) ( not ( = ?auto_782737 ?auto_782739 ) ) ( not ( = ?auto_782737 ?auto_782740 ) ) ( not ( = ?auto_782737 ?auto_782741 ) ) ( not ( = ?auto_782737 ?auto_782742 ) ) ( not ( = ?auto_782737 ?auto_782743 ) ) ( not ( = ?auto_782737 ?auto_782744 ) ) ( not ( = ?auto_782737 ?auto_782745 ) ) ( not ( = ?auto_782737 ?auto_782746 ) ) ( not ( = ?auto_782737 ?auto_782750 ) ) ( not ( = ?auto_782739 ?auto_782740 ) ) ( not ( = ?auto_782739 ?auto_782741 ) ) ( not ( = ?auto_782739 ?auto_782742 ) ) ( not ( = ?auto_782739 ?auto_782743 ) ) ( not ( = ?auto_782739 ?auto_782744 ) ) ( not ( = ?auto_782739 ?auto_782745 ) ) ( not ( = ?auto_782739 ?auto_782746 ) ) ( not ( = ?auto_782739 ?auto_782750 ) ) ( not ( = ?auto_782740 ?auto_782741 ) ) ( not ( = ?auto_782740 ?auto_782742 ) ) ( not ( = ?auto_782740 ?auto_782743 ) ) ( not ( = ?auto_782740 ?auto_782744 ) ) ( not ( = ?auto_782740 ?auto_782745 ) ) ( not ( = ?auto_782740 ?auto_782746 ) ) ( not ( = ?auto_782740 ?auto_782750 ) ) ( not ( = ?auto_782741 ?auto_782742 ) ) ( not ( = ?auto_782741 ?auto_782743 ) ) ( not ( = ?auto_782741 ?auto_782744 ) ) ( not ( = ?auto_782741 ?auto_782745 ) ) ( not ( = ?auto_782741 ?auto_782746 ) ) ( not ( = ?auto_782741 ?auto_782750 ) ) ( not ( = ?auto_782742 ?auto_782743 ) ) ( not ( = ?auto_782742 ?auto_782744 ) ) ( not ( = ?auto_782742 ?auto_782745 ) ) ( not ( = ?auto_782742 ?auto_782746 ) ) ( not ( = ?auto_782742 ?auto_782750 ) ) ( not ( = ?auto_782743 ?auto_782744 ) ) ( not ( = ?auto_782743 ?auto_782745 ) ) ( not ( = ?auto_782743 ?auto_782746 ) ) ( not ( = ?auto_782743 ?auto_782750 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_782744 ?auto_782745 ?auto_782746 )
      ( MAKE-12CRATE-VERIFY ?auto_782734 ?auto_782735 ?auto_782736 ?auto_782738 ?auto_782737 ?auto_782739 ?auto_782740 ?auto_782741 ?auto_782742 ?auto_782743 ?auto_782744 ?auto_782745 ?auto_782746 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_782897 - SURFACE
      ?auto_782898 - SURFACE
      ?auto_782899 - SURFACE
      ?auto_782901 - SURFACE
      ?auto_782900 - SURFACE
      ?auto_782902 - SURFACE
      ?auto_782903 - SURFACE
      ?auto_782904 - SURFACE
      ?auto_782905 - SURFACE
      ?auto_782906 - SURFACE
      ?auto_782907 - SURFACE
      ?auto_782908 - SURFACE
      ?auto_782909 - SURFACE
    )
    :vars
    (
      ?auto_782913 - HOIST
      ?auto_782911 - PLACE
      ?auto_782910 - PLACE
      ?auto_782914 - HOIST
      ?auto_782912 - SURFACE
      ?auto_782915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_782913 ?auto_782911 ) ( IS-CRATE ?auto_782909 ) ( not ( = ?auto_782908 ?auto_782909 ) ) ( not ( = ?auto_782907 ?auto_782908 ) ) ( not ( = ?auto_782907 ?auto_782909 ) ) ( not ( = ?auto_782910 ?auto_782911 ) ) ( HOIST-AT ?auto_782914 ?auto_782910 ) ( not ( = ?auto_782913 ?auto_782914 ) ) ( AVAILABLE ?auto_782914 ) ( SURFACE-AT ?auto_782909 ?auto_782910 ) ( ON ?auto_782909 ?auto_782912 ) ( CLEAR ?auto_782909 ) ( not ( = ?auto_782908 ?auto_782912 ) ) ( not ( = ?auto_782909 ?auto_782912 ) ) ( not ( = ?auto_782907 ?auto_782912 ) ) ( TRUCK-AT ?auto_782915 ?auto_782911 ) ( SURFACE-AT ?auto_782907 ?auto_782911 ) ( CLEAR ?auto_782907 ) ( LIFTING ?auto_782913 ?auto_782908 ) ( IS-CRATE ?auto_782908 ) ( ON ?auto_782898 ?auto_782897 ) ( ON ?auto_782899 ?auto_782898 ) ( ON ?auto_782901 ?auto_782899 ) ( ON ?auto_782900 ?auto_782901 ) ( ON ?auto_782902 ?auto_782900 ) ( ON ?auto_782903 ?auto_782902 ) ( ON ?auto_782904 ?auto_782903 ) ( ON ?auto_782905 ?auto_782904 ) ( ON ?auto_782906 ?auto_782905 ) ( ON ?auto_782907 ?auto_782906 ) ( not ( = ?auto_782897 ?auto_782898 ) ) ( not ( = ?auto_782897 ?auto_782899 ) ) ( not ( = ?auto_782897 ?auto_782901 ) ) ( not ( = ?auto_782897 ?auto_782900 ) ) ( not ( = ?auto_782897 ?auto_782902 ) ) ( not ( = ?auto_782897 ?auto_782903 ) ) ( not ( = ?auto_782897 ?auto_782904 ) ) ( not ( = ?auto_782897 ?auto_782905 ) ) ( not ( = ?auto_782897 ?auto_782906 ) ) ( not ( = ?auto_782897 ?auto_782907 ) ) ( not ( = ?auto_782897 ?auto_782908 ) ) ( not ( = ?auto_782897 ?auto_782909 ) ) ( not ( = ?auto_782897 ?auto_782912 ) ) ( not ( = ?auto_782898 ?auto_782899 ) ) ( not ( = ?auto_782898 ?auto_782901 ) ) ( not ( = ?auto_782898 ?auto_782900 ) ) ( not ( = ?auto_782898 ?auto_782902 ) ) ( not ( = ?auto_782898 ?auto_782903 ) ) ( not ( = ?auto_782898 ?auto_782904 ) ) ( not ( = ?auto_782898 ?auto_782905 ) ) ( not ( = ?auto_782898 ?auto_782906 ) ) ( not ( = ?auto_782898 ?auto_782907 ) ) ( not ( = ?auto_782898 ?auto_782908 ) ) ( not ( = ?auto_782898 ?auto_782909 ) ) ( not ( = ?auto_782898 ?auto_782912 ) ) ( not ( = ?auto_782899 ?auto_782901 ) ) ( not ( = ?auto_782899 ?auto_782900 ) ) ( not ( = ?auto_782899 ?auto_782902 ) ) ( not ( = ?auto_782899 ?auto_782903 ) ) ( not ( = ?auto_782899 ?auto_782904 ) ) ( not ( = ?auto_782899 ?auto_782905 ) ) ( not ( = ?auto_782899 ?auto_782906 ) ) ( not ( = ?auto_782899 ?auto_782907 ) ) ( not ( = ?auto_782899 ?auto_782908 ) ) ( not ( = ?auto_782899 ?auto_782909 ) ) ( not ( = ?auto_782899 ?auto_782912 ) ) ( not ( = ?auto_782901 ?auto_782900 ) ) ( not ( = ?auto_782901 ?auto_782902 ) ) ( not ( = ?auto_782901 ?auto_782903 ) ) ( not ( = ?auto_782901 ?auto_782904 ) ) ( not ( = ?auto_782901 ?auto_782905 ) ) ( not ( = ?auto_782901 ?auto_782906 ) ) ( not ( = ?auto_782901 ?auto_782907 ) ) ( not ( = ?auto_782901 ?auto_782908 ) ) ( not ( = ?auto_782901 ?auto_782909 ) ) ( not ( = ?auto_782901 ?auto_782912 ) ) ( not ( = ?auto_782900 ?auto_782902 ) ) ( not ( = ?auto_782900 ?auto_782903 ) ) ( not ( = ?auto_782900 ?auto_782904 ) ) ( not ( = ?auto_782900 ?auto_782905 ) ) ( not ( = ?auto_782900 ?auto_782906 ) ) ( not ( = ?auto_782900 ?auto_782907 ) ) ( not ( = ?auto_782900 ?auto_782908 ) ) ( not ( = ?auto_782900 ?auto_782909 ) ) ( not ( = ?auto_782900 ?auto_782912 ) ) ( not ( = ?auto_782902 ?auto_782903 ) ) ( not ( = ?auto_782902 ?auto_782904 ) ) ( not ( = ?auto_782902 ?auto_782905 ) ) ( not ( = ?auto_782902 ?auto_782906 ) ) ( not ( = ?auto_782902 ?auto_782907 ) ) ( not ( = ?auto_782902 ?auto_782908 ) ) ( not ( = ?auto_782902 ?auto_782909 ) ) ( not ( = ?auto_782902 ?auto_782912 ) ) ( not ( = ?auto_782903 ?auto_782904 ) ) ( not ( = ?auto_782903 ?auto_782905 ) ) ( not ( = ?auto_782903 ?auto_782906 ) ) ( not ( = ?auto_782903 ?auto_782907 ) ) ( not ( = ?auto_782903 ?auto_782908 ) ) ( not ( = ?auto_782903 ?auto_782909 ) ) ( not ( = ?auto_782903 ?auto_782912 ) ) ( not ( = ?auto_782904 ?auto_782905 ) ) ( not ( = ?auto_782904 ?auto_782906 ) ) ( not ( = ?auto_782904 ?auto_782907 ) ) ( not ( = ?auto_782904 ?auto_782908 ) ) ( not ( = ?auto_782904 ?auto_782909 ) ) ( not ( = ?auto_782904 ?auto_782912 ) ) ( not ( = ?auto_782905 ?auto_782906 ) ) ( not ( = ?auto_782905 ?auto_782907 ) ) ( not ( = ?auto_782905 ?auto_782908 ) ) ( not ( = ?auto_782905 ?auto_782909 ) ) ( not ( = ?auto_782905 ?auto_782912 ) ) ( not ( = ?auto_782906 ?auto_782907 ) ) ( not ( = ?auto_782906 ?auto_782908 ) ) ( not ( = ?auto_782906 ?auto_782909 ) ) ( not ( = ?auto_782906 ?auto_782912 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_782907 ?auto_782908 ?auto_782909 )
      ( MAKE-12CRATE-VERIFY ?auto_782897 ?auto_782898 ?auto_782899 ?auto_782901 ?auto_782900 ?auto_782902 ?auto_782903 ?auto_782904 ?auto_782905 ?auto_782906 ?auto_782907 ?auto_782908 ?auto_782909 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_783060 - SURFACE
      ?auto_783061 - SURFACE
      ?auto_783062 - SURFACE
      ?auto_783064 - SURFACE
      ?auto_783063 - SURFACE
      ?auto_783065 - SURFACE
      ?auto_783066 - SURFACE
      ?auto_783067 - SURFACE
      ?auto_783068 - SURFACE
      ?auto_783069 - SURFACE
      ?auto_783070 - SURFACE
      ?auto_783071 - SURFACE
      ?auto_783072 - SURFACE
    )
    :vars
    (
      ?auto_783074 - HOIST
      ?auto_783076 - PLACE
      ?auto_783073 - PLACE
      ?auto_783077 - HOIST
      ?auto_783078 - SURFACE
      ?auto_783075 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_783074 ?auto_783076 ) ( IS-CRATE ?auto_783072 ) ( not ( = ?auto_783071 ?auto_783072 ) ) ( not ( = ?auto_783070 ?auto_783071 ) ) ( not ( = ?auto_783070 ?auto_783072 ) ) ( not ( = ?auto_783073 ?auto_783076 ) ) ( HOIST-AT ?auto_783077 ?auto_783073 ) ( not ( = ?auto_783074 ?auto_783077 ) ) ( AVAILABLE ?auto_783077 ) ( SURFACE-AT ?auto_783072 ?auto_783073 ) ( ON ?auto_783072 ?auto_783078 ) ( CLEAR ?auto_783072 ) ( not ( = ?auto_783071 ?auto_783078 ) ) ( not ( = ?auto_783072 ?auto_783078 ) ) ( not ( = ?auto_783070 ?auto_783078 ) ) ( TRUCK-AT ?auto_783075 ?auto_783076 ) ( SURFACE-AT ?auto_783070 ?auto_783076 ) ( CLEAR ?auto_783070 ) ( IS-CRATE ?auto_783071 ) ( AVAILABLE ?auto_783074 ) ( IN ?auto_783071 ?auto_783075 ) ( ON ?auto_783061 ?auto_783060 ) ( ON ?auto_783062 ?auto_783061 ) ( ON ?auto_783064 ?auto_783062 ) ( ON ?auto_783063 ?auto_783064 ) ( ON ?auto_783065 ?auto_783063 ) ( ON ?auto_783066 ?auto_783065 ) ( ON ?auto_783067 ?auto_783066 ) ( ON ?auto_783068 ?auto_783067 ) ( ON ?auto_783069 ?auto_783068 ) ( ON ?auto_783070 ?auto_783069 ) ( not ( = ?auto_783060 ?auto_783061 ) ) ( not ( = ?auto_783060 ?auto_783062 ) ) ( not ( = ?auto_783060 ?auto_783064 ) ) ( not ( = ?auto_783060 ?auto_783063 ) ) ( not ( = ?auto_783060 ?auto_783065 ) ) ( not ( = ?auto_783060 ?auto_783066 ) ) ( not ( = ?auto_783060 ?auto_783067 ) ) ( not ( = ?auto_783060 ?auto_783068 ) ) ( not ( = ?auto_783060 ?auto_783069 ) ) ( not ( = ?auto_783060 ?auto_783070 ) ) ( not ( = ?auto_783060 ?auto_783071 ) ) ( not ( = ?auto_783060 ?auto_783072 ) ) ( not ( = ?auto_783060 ?auto_783078 ) ) ( not ( = ?auto_783061 ?auto_783062 ) ) ( not ( = ?auto_783061 ?auto_783064 ) ) ( not ( = ?auto_783061 ?auto_783063 ) ) ( not ( = ?auto_783061 ?auto_783065 ) ) ( not ( = ?auto_783061 ?auto_783066 ) ) ( not ( = ?auto_783061 ?auto_783067 ) ) ( not ( = ?auto_783061 ?auto_783068 ) ) ( not ( = ?auto_783061 ?auto_783069 ) ) ( not ( = ?auto_783061 ?auto_783070 ) ) ( not ( = ?auto_783061 ?auto_783071 ) ) ( not ( = ?auto_783061 ?auto_783072 ) ) ( not ( = ?auto_783061 ?auto_783078 ) ) ( not ( = ?auto_783062 ?auto_783064 ) ) ( not ( = ?auto_783062 ?auto_783063 ) ) ( not ( = ?auto_783062 ?auto_783065 ) ) ( not ( = ?auto_783062 ?auto_783066 ) ) ( not ( = ?auto_783062 ?auto_783067 ) ) ( not ( = ?auto_783062 ?auto_783068 ) ) ( not ( = ?auto_783062 ?auto_783069 ) ) ( not ( = ?auto_783062 ?auto_783070 ) ) ( not ( = ?auto_783062 ?auto_783071 ) ) ( not ( = ?auto_783062 ?auto_783072 ) ) ( not ( = ?auto_783062 ?auto_783078 ) ) ( not ( = ?auto_783064 ?auto_783063 ) ) ( not ( = ?auto_783064 ?auto_783065 ) ) ( not ( = ?auto_783064 ?auto_783066 ) ) ( not ( = ?auto_783064 ?auto_783067 ) ) ( not ( = ?auto_783064 ?auto_783068 ) ) ( not ( = ?auto_783064 ?auto_783069 ) ) ( not ( = ?auto_783064 ?auto_783070 ) ) ( not ( = ?auto_783064 ?auto_783071 ) ) ( not ( = ?auto_783064 ?auto_783072 ) ) ( not ( = ?auto_783064 ?auto_783078 ) ) ( not ( = ?auto_783063 ?auto_783065 ) ) ( not ( = ?auto_783063 ?auto_783066 ) ) ( not ( = ?auto_783063 ?auto_783067 ) ) ( not ( = ?auto_783063 ?auto_783068 ) ) ( not ( = ?auto_783063 ?auto_783069 ) ) ( not ( = ?auto_783063 ?auto_783070 ) ) ( not ( = ?auto_783063 ?auto_783071 ) ) ( not ( = ?auto_783063 ?auto_783072 ) ) ( not ( = ?auto_783063 ?auto_783078 ) ) ( not ( = ?auto_783065 ?auto_783066 ) ) ( not ( = ?auto_783065 ?auto_783067 ) ) ( not ( = ?auto_783065 ?auto_783068 ) ) ( not ( = ?auto_783065 ?auto_783069 ) ) ( not ( = ?auto_783065 ?auto_783070 ) ) ( not ( = ?auto_783065 ?auto_783071 ) ) ( not ( = ?auto_783065 ?auto_783072 ) ) ( not ( = ?auto_783065 ?auto_783078 ) ) ( not ( = ?auto_783066 ?auto_783067 ) ) ( not ( = ?auto_783066 ?auto_783068 ) ) ( not ( = ?auto_783066 ?auto_783069 ) ) ( not ( = ?auto_783066 ?auto_783070 ) ) ( not ( = ?auto_783066 ?auto_783071 ) ) ( not ( = ?auto_783066 ?auto_783072 ) ) ( not ( = ?auto_783066 ?auto_783078 ) ) ( not ( = ?auto_783067 ?auto_783068 ) ) ( not ( = ?auto_783067 ?auto_783069 ) ) ( not ( = ?auto_783067 ?auto_783070 ) ) ( not ( = ?auto_783067 ?auto_783071 ) ) ( not ( = ?auto_783067 ?auto_783072 ) ) ( not ( = ?auto_783067 ?auto_783078 ) ) ( not ( = ?auto_783068 ?auto_783069 ) ) ( not ( = ?auto_783068 ?auto_783070 ) ) ( not ( = ?auto_783068 ?auto_783071 ) ) ( not ( = ?auto_783068 ?auto_783072 ) ) ( not ( = ?auto_783068 ?auto_783078 ) ) ( not ( = ?auto_783069 ?auto_783070 ) ) ( not ( = ?auto_783069 ?auto_783071 ) ) ( not ( = ?auto_783069 ?auto_783072 ) ) ( not ( = ?auto_783069 ?auto_783078 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_783070 ?auto_783071 ?auto_783072 )
      ( MAKE-12CRATE-VERIFY ?auto_783060 ?auto_783061 ?auto_783062 ?auto_783064 ?auto_783063 ?auto_783065 ?auto_783066 ?auto_783067 ?auto_783068 ?auto_783069 ?auto_783070 ?auto_783071 ?auto_783072 ) )
  )

)

