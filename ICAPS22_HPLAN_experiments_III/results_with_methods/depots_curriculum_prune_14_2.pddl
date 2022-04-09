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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17949 - SURFACE
      ?auto_17950 - SURFACE
      ?auto_17951 - SURFACE
    )
    :vars
    (
      ?auto_17956 - HOIST
      ?auto_17957 - PLACE
      ?auto_17954 - PLACE
      ?auto_17953 - HOIST
      ?auto_17952 - SURFACE
      ?auto_17960 - PLACE
      ?auto_17958 - HOIST
      ?auto_17959 - SURFACE
      ?auto_17955 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17956 ?auto_17957 ) ( IS-CRATE ?auto_17951 ) ( not ( = ?auto_17954 ?auto_17957 ) ) ( HOIST-AT ?auto_17953 ?auto_17954 ) ( AVAILABLE ?auto_17953 ) ( SURFACE-AT ?auto_17951 ?auto_17954 ) ( ON ?auto_17951 ?auto_17952 ) ( CLEAR ?auto_17951 ) ( not ( = ?auto_17950 ?auto_17951 ) ) ( not ( = ?auto_17950 ?auto_17952 ) ) ( not ( = ?auto_17951 ?auto_17952 ) ) ( not ( = ?auto_17956 ?auto_17953 ) ) ( SURFACE-AT ?auto_17949 ?auto_17957 ) ( CLEAR ?auto_17949 ) ( IS-CRATE ?auto_17950 ) ( AVAILABLE ?auto_17956 ) ( not ( = ?auto_17960 ?auto_17957 ) ) ( HOIST-AT ?auto_17958 ?auto_17960 ) ( AVAILABLE ?auto_17958 ) ( SURFACE-AT ?auto_17950 ?auto_17960 ) ( ON ?auto_17950 ?auto_17959 ) ( CLEAR ?auto_17950 ) ( TRUCK-AT ?auto_17955 ?auto_17957 ) ( not ( = ?auto_17949 ?auto_17950 ) ) ( not ( = ?auto_17949 ?auto_17959 ) ) ( not ( = ?auto_17950 ?auto_17959 ) ) ( not ( = ?auto_17956 ?auto_17958 ) ) ( not ( = ?auto_17949 ?auto_17951 ) ) ( not ( = ?auto_17949 ?auto_17952 ) ) ( not ( = ?auto_17951 ?auto_17959 ) ) ( not ( = ?auto_17954 ?auto_17960 ) ) ( not ( = ?auto_17953 ?auto_17958 ) ) ( not ( = ?auto_17952 ?auto_17959 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17949 ?auto_17950 )
      ( MAKE-1CRATE ?auto_17950 ?auto_17951 )
      ( MAKE-2CRATE-VERIFY ?auto_17949 ?auto_17950 ?auto_17951 ) )
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
      ?auto_17981 - HOIST
      ?auto_17980 - PLACE
      ?auto_17982 - PLACE
      ?auto_17984 - HOIST
      ?auto_17979 - SURFACE
      ?auto_17988 - PLACE
      ?auto_17986 - HOIST
      ?auto_17987 - SURFACE
      ?auto_17990 - PLACE
      ?auto_17989 - HOIST
      ?auto_17985 - SURFACE
      ?auto_17983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17981 ?auto_17980 ) ( IS-CRATE ?auto_17978 ) ( not ( = ?auto_17982 ?auto_17980 ) ) ( HOIST-AT ?auto_17984 ?auto_17982 ) ( AVAILABLE ?auto_17984 ) ( SURFACE-AT ?auto_17978 ?auto_17982 ) ( ON ?auto_17978 ?auto_17979 ) ( CLEAR ?auto_17978 ) ( not ( = ?auto_17977 ?auto_17978 ) ) ( not ( = ?auto_17977 ?auto_17979 ) ) ( not ( = ?auto_17978 ?auto_17979 ) ) ( not ( = ?auto_17981 ?auto_17984 ) ) ( IS-CRATE ?auto_17977 ) ( not ( = ?auto_17988 ?auto_17980 ) ) ( HOIST-AT ?auto_17986 ?auto_17988 ) ( AVAILABLE ?auto_17986 ) ( SURFACE-AT ?auto_17977 ?auto_17988 ) ( ON ?auto_17977 ?auto_17987 ) ( CLEAR ?auto_17977 ) ( not ( = ?auto_17976 ?auto_17977 ) ) ( not ( = ?auto_17976 ?auto_17987 ) ) ( not ( = ?auto_17977 ?auto_17987 ) ) ( not ( = ?auto_17981 ?auto_17986 ) ) ( SURFACE-AT ?auto_17975 ?auto_17980 ) ( CLEAR ?auto_17975 ) ( IS-CRATE ?auto_17976 ) ( AVAILABLE ?auto_17981 ) ( not ( = ?auto_17990 ?auto_17980 ) ) ( HOIST-AT ?auto_17989 ?auto_17990 ) ( AVAILABLE ?auto_17989 ) ( SURFACE-AT ?auto_17976 ?auto_17990 ) ( ON ?auto_17976 ?auto_17985 ) ( CLEAR ?auto_17976 ) ( TRUCK-AT ?auto_17983 ?auto_17980 ) ( not ( = ?auto_17975 ?auto_17976 ) ) ( not ( = ?auto_17975 ?auto_17985 ) ) ( not ( = ?auto_17976 ?auto_17985 ) ) ( not ( = ?auto_17981 ?auto_17989 ) ) ( not ( = ?auto_17975 ?auto_17977 ) ) ( not ( = ?auto_17975 ?auto_17987 ) ) ( not ( = ?auto_17977 ?auto_17985 ) ) ( not ( = ?auto_17988 ?auto_17990 ) ) ( not ( = ?auto_17986 ?auto_17989 ) ) ( not ( = ?auto_17987 ?auto_17985 ) ) ( not ( = ?auto_17975 ?auto_17978 ) ) ( not ( = ?auto_17975 ?auto_17979 ) ) ( not ( = ?auto_17976 ?auto_17978 ) ) ( not ( = ?auto_17976 ?auto_17979 ) ) ( not ( = ?auto_17978 ?auto_17987 ) ) ( not ( = ?auto_17978 ?auto_17985 ) ) ( not ( = ?auto_17982 ?auto_17988 ) ) ( not ( = ?auto_17982 ?auto_17990 ) ) ( not ( = ?auto_17984 ?auto_17986 ) ) ( not ( = ?auto_17984 ?auto_17989 ) ) ( not ( = ?auto_17979 ?auto_17987 ) ) ( not ( = ?auto_17979 ?auto_17985 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17975 ?auto_17976 ?auto_17977 )
      ( MAKE-1CRATE ?auto_17977 ?auto_17978 )
      ( MAKE-3CRATE-VERIFY ?auto_17975 ?auto_17976 ?auto_17977 ?auto_17978 ) )
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
      ?auto_18012 - HOIST
      ?auto_18011 - PLACE
      ?auto_18014 - PLACE
      ?auto_18013 - HOIST
      ?auto_18015 - SURFACE
      ?auto_18025 - PLACE
      ?auto_18019 - HOIST
      ?auto_18024 - SURFACE
      ?auto_18021 - PLACE
      ?auto_18017 - HOIST
      ?auto_18018 - SURFACE
      ?auto_18023 - PLACE
      ?auto_18022 - HOIST
      ?auto_18020 - SURFACE
      ?auto_18016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18012 ?auto_18011 ) ( IS-CRATE ?auto_18010 ) ( not ( = ?auto_18014 ?auto_18011 ) ) ( HOIST-AT ?auto_18013 ?auto_18014 ) ( AVAILABLE ?auto_18013 ) ( SURFACE-AT ?auto_18010 ?auto_18014 ) ( ON ?auto_18010 ?auto_18015 ) ( CLEAR ?auto_18010 ) ( not ( = ?auto_18009 ?auto_18010 ) ) ( not ( = ?auto_18009 ?auto_18015 ) ) ( not ( = ?auto_18010 ?auto_18015 ) ) ( not ( = ?auto_18012 ?auto_18013 ) ) ( IS-CRATE ?auto_18009 ) ( not ( = ?auto_18025 ?auto_18011 ) ) ( HOIST-AT ?auto_18019 ?auto_18025 ) ( AVAILABLE ?auto_18019 ) ( SURFACE-AT ?auto_18009 ?auto_18025 ) ( ON ?auto_18009 ?auto_18024 ) ( CLEAR ?auto_18009 ) ( not ( = ?auto_18008 ?auto_18009 ) ) ( not ( = ?auto_18008 ?auto_18024 ) ) ( not ( = ?auto_18009 ?auto_18024 ) ) ( not ( = ?auto_18012 ?auto_18019 ) ) ( IS-CRATE ?auto_18008 ) ( not ( = ?auto_18021 ?auto_18011 ) ) ( HOIST-AT ?auto_18017 ?auto_18021 ) ( AVAILABLE ?auto_18017 ) ( SURFACE-AT ?auto_18008 ?auto_18021 ) ( ON ?auto_18008 ?auto_18018 ) ( CLEAR ?auto_18008 ) ( not ( = ?auto_18007 ?auto_18008 ) ) ( not ( = ?auto_18007 ?auto_18018 ) ) ( not ( = ?auto_18008 ?auto_18018 ) ) ( not ( = ?auto_18012 ?auto_18017 ) ) ( SURFACE-AT ?auto_18006 ?auto_18011 ) ( CLEAR ?auto_18006 ) ( IS-CRATE ?auto_18007 ) ( AVAILABLE ?auto_18012 ) ( not ( = ?auto_18023 ?auto_18011 ) ) ( HOIST-AT ?auto_18022 ?auto_18023 ) ( AVAILABLE ?auto_18022 ) ( SURFACE-AT ?auto_18007 ?auto_18023 ) ( ON ?auto_18007 ?auto_18020 ) ( CLEAR ?auto_18007 ) ( TRUCK-AT ?auto_18016 ?auto_18011 ) ( not ( = ?auto_18006 ?auto_18007 ) ) ( not ( = ?auto_18006 ?auto_18020 ) ) ( not ( = ?auto_18007 ?auto_18020 ) ) ( not ( = ?auto_18012 ?auto_18022 ) ) ( not ( = ?auto_18006 ?auto_18008 ) ) ( not ( = ?auto_18006 ?auto_18018 ) ) ( not ( = ?auto_18008 ?auto_18020 ) ) ( not ( = ?auto_18021 ?auto_18023 ) ) ( not ( = ?auto_18017 ?auto_18022 ) ) ( not ( = ?auto_18018 ?auto_18020 ) ) ( not ( = ?auto_18006 ?auto_18009 ) ) ( not ( = ?auto_18006 ?auto_18024 ) ) ( not ( = ?auto_18007 ?auto_18009 ) ) ( not ( = ?auto_18007 ?auto_18024 ) ) ( not ( = ?auto_18009 ?auto_18018 ) ) ( not ( = ?auto_18009 ?auto_18020 ) ) ( not ( = ?auto_18025 ?auto_18021 ) ) ( not ( = ?auto_18025 ?auto_18023 ) ) ( not ( = ?auto_18019 ?auto_18017 ) ) ( not ( = ?auto_18019 ?auto_18022 ) ) ( not ( = ?auto_18024 ?auto_18018 ) ) ( not ( = ?auto_18024 ?auto_18020 ) ) ( not ( = ?auto_18006 ?auto_18010 ) ) ( not ( = ?auto_18006 ?auto_18015 ) ) ( not ( = ?auto_18007 ?auto_18010 ) ) ( not ( = ?auto_18007 ?auto_18015 ) ) ( not ( = ?auto_18008 ?auto_18010 ) ) ( not ( = ?auto_18008 ?auto_18015 ) ) ( not ( = ?auto_18010 ?auto_18024 ) ) ( not ( = ?auto_18010 ?auto_18018 ) ) ( not ( = ?auto_18010 ?auto_18020 ) ) ( not ( = ?auto_18014 ?auto_18025 ) ) ( not ( = ?auto_18014 ?auto_18021 ) ) ( not ( = ?auto_18014 ?auto_18023 ) ) ( not ( = ?auto_18013 ?auto_18019 ) ) ( not ( = ?auto_18013 ?auto_18017 ) ) ( not ( = ?auto_18013 ?auto_18022 ) ) ( not ( = ?auto_18015 ?auto_18024 ) ) ( not ( = ?auto_18015 ?auto_18018 ) ) ( not ( = ?auto_18015 ?auto_18020 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_18006 ?auto_18007 ?auto_18008 ?auto_18009 )
      ( MAKE-1CRATE ?auto_18009 ?auto_18010 )
      ( MAKE-4CRATE-VERIFY ?auto_18006 ?auto_18007 ?auto_18008 ?auto_18009 ?auto_18010 ) )
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
      ?auto_18048 - HOIST
      ?auto_18050 - PLACE
      ?auto_18052 - PLACE
      ?auto_18049 - HOIST
      ?auto_18051 - SURFACE
      ?auto_18059 - PLACE
      ?auto_18054 - HOIST
      ?auto_18055 - SURFACE
      ?auto_18062 - PLACE
      ?auto_18060 - HOIST
      ?auto_18065 - SURFACE
      ?auto_18061 - PLACE
      ?auto_18064 - HOIST
      ?auto_18057 - SURFACE
      ?auto_18063 - PLACE
      ?auto_18058 - HOIST
      ?auto_18056 - SURFACE
      ?auto_18053 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18048 ?auto_18050 ) ( IS-CRATE ?auto_18047 ) ( not ( = ?auto_18052 ?auto_18050 ) ) ( HOIST-AT ?auto_18049 ?auto_18052 ) ( AVAILABLE ?auto_18049 ) ( SURFACE-AT ?auto_18047 ?auto_18052 ) ( ON ?auto_18047 ?auto_18051 ) ( CLEAR ?auto_18047 ) ( not ( = ?auto_18046 ?auto_18047 ) ) ( not ( = ?auto_18046 ?auto_18051 ) ) ( not ( = ?auto_18047 ?auto_18051 ) ) ( not ( = ?auto_18048 ?auto_18049 ) ) ( IS-CRATE ?auto_18046 ) ( not ( = ?auto_18059 ?auto_18050 ) ) ( HOIST-AT ?auto_18054 ?auto_18059 ) ( AVAILABLE ?auto_18054 ) ( SURFACE-AT ?auto_18046 ?auto_18059 ) ( ON ?auto_18046 ?auto_18055 ) ( CLEAR ?auto_18046 ) ( not ( = ?auto_18045 ?auto_18046 ) ) ( not ( = ?auto_18045 ?auto_18055 ) ) ( not ( = ?auto_18046 ?auto_18055 ) ) ( not ( = ?auto_18048 ?auto_18054 ) ) ( IS-CRATE ?auto_18045 ) ( not ( = ?auto_18062 ?auto_18050 ) ) ( HOIST-AT ?auto_18060 ?auto_18062 ) ( AVAILABLE ?auto_18060 ) ( SURFACE-AT ?auto_18045 ?auto_18062 ) ( ON ?auto_18045 ?auto_18065 ) ( CLEAR ?auto_18045 ) ( not ( = ?auto_18044 ?auto_18045 ) ) ( not ( = ?auto_18044 ?auto_18065 ) ) ( not ( = ?auto_18045 ?auto_18065 ) ) ( not ( = ?auto_18048 ?auto_18060 ) ) ( IS-CRATE ?auto_18044 ) ( not ( = ?auto_18061 ?auto_18050 ) ) ( HOIST-AT ?auto_18064 ?auto_18061 ) ( AVAILABLE ?auto_18064 ) ( SURFACE-AT ?auto_18044 ?auto_18061 ) ( ON ?auto_18044 ?auto_18057 ) ( CLEAR ?auto_18044 ) ( not ( = ?auto_18043 ?auto_18044 ) ) ( not ( = ?auto_18043 ?auto_18057 ) ) ( not ( = ?auto_18044 ?auto_18057 ) ) ( not ( = ?auto_18048 ?auto_18064 ) ) ( SURFACE-AT ?auto_18042 ?auto_18050 ) ( CLEAR ?auto_18042 ) ( IS-CRATE ?auto_18043 ) ( AVAILABLE ?auto_18048 ) ( not ( = ?auto_18063 ?auto_18050 ) ) ( HOIST-AT ?auto_18058 ?auto_18063 ) ( AVAILABLE ?auto_18058 ) ( SURFACE-AT ?auto_18043 ?auto_18063 ) ( ON ?auto_18043 ?auto_18056 ) ( CLEAR ?auto_18043 ) ( TRUCK-AT ?auto_18053 ?auto_18050 ) ( not ( = ?auto_18042 ?auto_18043 ) ) ( not ( = ?auto_18042 ?auto_18056 ) ) ( not ( = ?auto_18043 ?auto_18056 ) ) ( not ( = ?auto_18048 ?auto_18058 ) ) ( not ( = ?auto_18042 ?auto_18044 ) ) ( not ( = ?auto_18042 ?auto_18057 ) ) ( not ( = ?auto_18044 ?auto_18056 ) ) ( not ( = ?auto_18061 ?auto_18063 ) ) ( not ( = ?auto_18064 ?auto_18058 ) ) ( not ( = ?auto_18057 ?auto_18056 ) ) ( not ( = ?auto_18042 ?auto_18045 ) ) ( not ( = ?auto_18042 ?auto_18065 ) ) ( not ( = ?auto_18043 ?auto_18045 ) ) ( not ( = ?auto_18043 ?auto_18065 ) ) ( not ( = ?auto_18045 ?auto_18057 ) ) ( not ( = ?auto_18045 ?auto_18056 ) ) ( not ( = ?auto_18062 ?auto_18061 ) ) ( not ( = ?auto_18062 ?auto_18063 ) ) ( not ( = ?auto_18060 ?auto_18064 ) ) ( not ( = ?auto_18060 ?auto_18058 ) ) ( not ( = ?auto_18065 ?auto_18057 ) ) ( not ( = ?auto_18065 ?auto_18056 ) ) ( not ( = ?auto_18042 ?auto_18046 ) ) ( not ( = ?auto_18042 ?auto_18055 ) ) ( not ( = ?auto_18043 ?auto_18046 ) ) ( not ( = ?auto_18043 ?auto_18055 ) ) ( not ( = ?auto_18044 ?auto_18046 ) ) ( not ( = ?auto_18044 ?auto_18055 ) ) ( not ( = ?auto_18046 ?auto_18065 ) ) ( not ( = ?auto_18046 ?auto_18057 ) ) ( not ( = ?auto_18046 ?auto_18056 ) ) ( not ( = ?auto_18059 ?auto_18062 ) ) ( not ( = ?auto_18059 ?auto_18061 ) ) ( not ( = ?auto_18059 ?auto_18063 ) ) ( not ( = ?auto_18054 ?auto_18060 ) ) ( not ( = ?auto_18054 ?auto_18064 ) ) ( not ( = ?auto_18054 ?auto_18058 ) ) ( not ( = ?auto_18055 ?auto_18065 ) ) ( not ( = ?auto_18055 ?auto_18057 ) ) ( not ( = ?auto_18055 ?auto_18056 ) ) ( not ( = ?auto_18042 ?auto_18047 ) ) ( not ( = ?auto_18042 ?auto_18051 ) ) ( not ( = ?auto_18043 ?auto_18047 ) ) ( not ( = ?auto_18043 ?auto_18051 ) ) ( not ( = ?auto_18044 ?auto_18047 ) ) ( not ( = ?auto_18044 ?auto_18051 ) ) ( not ( = ?auto_18045 ?auto_18047 ) ) ( not ( = ?auto_18045 ?auto_18051 ) ) ( not ( = ?auto_18047 ?auto_18055 ) ) ( not ( = ?auto_18047 ?auto_18065 ) ) ( not ( = ?auto_18047 ?auto_18057 ) ) ( not ( = ?auto_18047 ?auto_18056 ) ) ( not ( = ?auto_18052 ?auto_18059 ) ) ( not ( = ?auto_18052 ?auto_18062 ) ) ( not ( = ?auto_18052 ?auto_18061 ) ) ( not ( = ?auto_18052 ?auto_18063 ) ) ( not ( = ?auto_18049 ?auto_18054 ) ) ( not ( = ?auto_18049 ?auto_18060 ) ) ( not ( = ?auto_18049 ?auto_18064 ) ) ( not ( = ?auto_18049 ?auto_18058 ) ) ( not ( = ?auto_18051 ?auto_18055 ) ) ( not ( = ?auto_18051 ?auto_18065 ) ) ( not ( = ?auto_18051 ?auto_18057 ) ) ( not ( = ?auto_18051 ?auto_18056 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_18042 ?auto_18043 ?auto_18044 ?auto_18045 ?auto_18046 )
      ( MAKE-1CRATE ?auto_18046 ?auto_18047 )
      ( MAKE-5CRATE-VERIFY ?auto_18042 ?auto_18043 ?auto_18044 ?auto_18045 ?auto_18046 ?auto_18047 ) )
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
      ?auto_18091 - HOIST
      ?auto_18094 - PLACE
      ?auto_18092 - PLACE
      ?auto_18093 - HOIST
      ?auto_18090 - SURFACE
      ?auto_18103 - PLACE
      ?auto_18109 - HOIST
      ?auto_18110 - SURFACE
      ?auto_18101 - PLACE
      ?auto_18108 - HOIST
      ?auto_18105 - SURFACE
      ?auto_18097 - PLACE
      ?auto_18100 - HOIST
      ?auto_18098 - SURFACE
      ?auto_18099 - PLACE
      ?auto_18107 - HOIST
      ?auto_18102 - SURFACE
      ?auto_18106 - PLACE
      ?auto_18104 - HOIST
      ?auto_18096 - SURFACE
      ?auto_18095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18091 ?auto_18094 ) ( IS-CRATE ?auto_18089 ) ( not ( = ?auto_18092 ?auto_18094 ) ) ( HOIST-AT ?auto_18093 ?auto_18092 ) ( AVAILABLE ?auto_18093 ) ( SURFACE-AT ?auto_18089 ?auto_18092 ) ( ON ?auto_18089 ?auto_18090 ) ( CLEAR ?auto_18089 ) ( not ( = ?auto_18088 ?auto_18089 ) ) ( not ( = ?auto_18088 ?auto_18090 ) ) ( not ( = ?auto_18089 ?auto_18090 ) ) ( not ( = ?auto_18091 ?auto_18093 ) ) ( IS-CRATE ?auto_18088 ) ( not ( = ?auto_18103 ?auto_18094 ) ) ( HOIST-AT ?auto_18109 ?auto_18103 ) ( AVAILABLE ?auto_18109 ) ( SURFACE-AT ?auto_18088 ?auto_18103 ) ( ON ?auto_18088 ?auto_18110 ) ( CLEAR ?auto_18088 ) ( not ( = ?auto_18087 ?auto_18088 ) ) ( not ( = ?auto_18087 ?auto_18110 ) ) ( not ( = ?auto_18088 ?auto_18110 ) ) ( not ( = ?auto_18091 ?auto_18109 ) ) ( IS-CRATE ?auto_18087 ) ( not ( = ?auto_18101 ?auto_18094 ) ) ( HOIST-AT ?auto_18108 ?auto_18101 ) ( AVAILABLE ?auto_18108 ) ( SURFACE-AT ?auto_18087 ?auto_18101 ) ( ON ?auto_18087 ?auto_18105 ) ( CLEAR ?auto_18087 ) ( not ( = ?auto_18086 ?auto_18087 ) ) ( not ( = ?auto_18086 ?auto_18105 ) ) ( not ( = ?auto_18087 ?auto_18105 ) ) ( not ( = ?auto_18091 ?auto_18108 ) ) ( IS-CRATE ?auto_18086 ) ( not ( = ?auto_18097 ?auto_18094 ) ) ( HOIST-AT ?auto_18100 ?auto_18097 ) ( AVAILABLE ?auto_18100 ) ( SURFACE-AT ?auto_18086 ?auto_18097 ) ( ON ?auto_18086 ?auto_18098 ) ( CLEAR ?auto_18086 ) ( not ( = ?auto_18085 ?auto_18086 ) ) ( not ( = ?auto_18085 ?auto_18098 ) ) ( not ( = ?auto_18086 ?auto_18098 ) ) ( not ( = ?auto_18091 ?auto_18100 ) ) ( IS-CRATE ?auto_18085 ) ( not ( = ?auto_18099 ?auto_18094 ) ) ( HOIST-AT ?auto_18107 ?auto_18099 ) ( AVAILABLE ?auto_18107 ) ( SURFACE-AT ?auto_18085 ?auto_18099 ) ( ON ?auto_18085 ?auto_18102 ) ( CLEAR ?auto_18085 ) ( not ( = ?auto_18084 ?auto_18085 ) ) ( not ( = ?auto_18084 ?auto_18102 ) ) ( not ( = ?auto_18085 ?auto_18102 ) ) ( not ( = ?auto_18091 ?auto_18107 ) ) ( SURFACE-AT ?auto_18083 ?auto_18094 ) ( CLEAR ?auto_18083 ) ( IS-CRATE ?auto_18084 ) ( AVAILABLE ?auto_18091 ) ( not ( = ?auto_18106 ?auto_18094 ) ) ( HOIST-AT ?auto_18104 ?auto_18106 ) ( AVAILABLE ?auto_18104 ) ( SURFACE-AT ?auto_18084 ?auto_18106 ) ( ON ?auto_18084 ?auto_18096 ) ( CLEAR ?auto_18084 ) ( TRUCK-AT ?auto_18095 ?auto_18094 ) ( not ( = ?auto_18083 ?auto_18084 ) ) ( not ( = ?auto_18083 ?auto_18096 ) ) ( not ( = ?auto_18084 ?auto_18096 ) ) ( not ( = ?auto_18091 ?auto_18104 ) ) ( not ( = ?auto_18083 ?auto_18085 ) ) ( not ( = ?auto_18083 ?auto_18102 ) ) ( not ( = ?auto_18085 ?auto_18096 ) ) ( not ( = ?auto_18099 ?auto_18106 ) ) ( not ( = ?auto_18107 ?auto_18104 ) ) ( not ( = ?auto_18102 ?auto_18096 ) ) ( not ( = ?auto_18083 ?auto_18086 ) ) ( not ( = ?auto_18083 ?auto_18098 ) ) ( not ( = ?auto_18084 ?auto_18086 ) ) ( not ( = ?auto_18084 ?auto_18098 ) ) ( not ( = ?auto_18086 ?auto_18102 ) ) ( not ( = ?auto_18086 ?auto_18096 ) ) ( not ( = ?auto_18097 ?auto_18099 ) ) ( not ( = ?auto_18097 ?auto_18106 ) ) ( not ( = ?auto_18100 ?auto_18107 ) ) ( not ( = ?auto_18100 ?auto_18104 ) ) ( not ( = ?auto_18098 ?auto_18102 ) ) ( not ( = ?auto_18098 ?auto_18096 ) ) ( not ( = ?auto_18083 ?auto_18087 ) ) ( not ( = ?auto_18083 ?auto_18105 ) ) ( not ( = ?auto_18084 ?auto_18087 ) ) ( not ( = ?auto_18084 ?auto_18105 ) ) ( not ( = ?auto_18085 ?auto_18087 ) ) ( not ( = ?auto_18085 ?auto_18105 ) ) ( not ( = ?auto_18087 ?auto_18098 ) ) ( not ( = ?auto_18087 ?auto_18102 ) ) ( not ( = ?auto_18087 ?auto_18096 ) ) ( not ( = ?auto_18101 ?auto_18097 ) ) ( not ( = ?auto_18101 ?auto_18099 ) ) ( not ( = ?auto_18101 ?auto_18106 ) ) ( not ( = ?auto_18108 ?auto_18100 ) ) ( not ( = ?auto_18108 ?auto_18107 ) ) ( not ( = ?auto_18108 ?auto_18104 ) ) ( not ( = ?auto_18105 ?auto_18098 ) ) ( not ( = ?auto_18105 ?auto_18102 ) ) ( not ( = ?auto_18105 ?auto_18096 ) ) ( not ( = ?auto_18083 ?auto_18088 ) ) ( not ( = ?auto_18083 ?auto_18110 ) ) ( not ( = ?auto_18084 ?auto_18088 ) ) ( not ( = ?auto_18084 ?auto_18110 ) ) ( not ( = ?auto_18085 ?auto_18088 ) ) ( not ( = ?auto_18085 ?auto_18110 ) ) ( not ( = ?auto_18086 ?auto_18088 ) ) ( not ( = ?auto_18086 ?auto_18110 ) ) ( not ( = ?auto_18088 ?auto_18105 ) ) ( not ( = ?auto_18088 ?auto_18098 ) ) ( not ( = ?auto_18088 ?auto_18102 ) ) ( not ( = ?auto_18088 ?auto_18096 ) ) ( not ( = ?auto_18103 ?auto_18101 ) ) ( not ( = ?auto_18103 ?auto_18097 ) ) ( not ( = ?auto_18103 ?auto_18099 ) ) ( not ( = ?auto_18103 ?auto_18106 ) ) ( not ( = ?auto_18109 ?auto_18108 ) ) ( not ( = ?auto_18109 ?auto_18100 ) ) ( not ( = ?auto_18109 ?auto_18107 ) ) ( not ( = ?auto_18109 ?auto_18104 ) ) ( not ( = ?auto_18110 ?auto_18105 ) ) ( not ( = ?auto_18110 ?auto_18098 ) ) ( not ( = ?auto_18110 ?auto_18102 ) ) ( not ( = ?auto_18110 ?auto_18096 ) ) ( not ( = ?auto_18083 ?auto_18089 ) ) ( not ( = ?auto_18083 ?auto_18090 ) ) ( not ( = ?auto_18084 ?auto_18089 ) ) ( not ( = ?auto_18084 ?auto_18090 ) ) ( not ( = ?auto_18085 ?auto_18089 ) ) ( not ( = ?auto_18085 ?auto_18090 ) ) ( not ( = ?auto_18086 ?auto_18089 ) ) ( not ( = ?auto_18086 ?auto_18090 ) ) ( not ( = ?auto_18087 ?auto_18089 ) ) ( not ( = ?auto_18087 ?auto_18090 ) ) ( not ( = ?auto_18089 ?auto_18110 ) ) ( not ( = ?auto_18089 ?auto_18105 ) ) ( not ( = ?auto_18089 ?auto_18098 ) ) ( not ( = ?auto_18089 ?auto_18102 ) ) ( not ( = ?auto_18089 ?auto_18096 ) ) ( not ( = ?auto_18092 ?auto_18103 ) ) ( not ( = ?auto_18092 ?auto_18101 ) ) ( not ( = ?auto_18092 ?auto_18097 ) ) ( not ( = ?auto_18092 ?auto_18099 ) ) ( not ( = ?auto_18092 ?auto_18106 ) ) ( not ( = ?auto_18093 ?auto_18109 ) ) ( not ( = ?auto_18093 ?auto_18108 ) ) ( not ( = ?auto_18093 ?auto_18100 ) ) ( not ( = ?auto_18093 ?auto_18107 ) ) ( not ( = ?auto_18093 ?auto_18104 ) ) ( not ( = ?auto_18090 ?auto_18110 ) ) ( not ( = ?auto_18090 ?auto_18105 ) ) ( not ( = ?auto_18090 ?auto_18098 ) ) ( not ( = ?auto_18090 ?auto_18102 ) ) ( not ( = ?auto_18090 ?auto_18096 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_18083 ?auto_18084 ?auto_18085 ?auto_18086 ?auto_18087 ?auto_18088 )
      ( MAKE-1CRATE ?auto_18088 ?auto_18089 )
      ( MAKE-6CRATE-VERIFY ?auto_18083 ?auto_18084 ?auto_18085 ?auto_18086 ?auto_18087 ?auto_18088 ?auto_18089 ) )
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
      ?auto_18142 - PLACE
      ?auto_18137 - PLACE
      ?auto_18139 - HOIST
      ?auto_18141 - SURFACE
      ?auto_18146 - PLACE
      ?auto_18145 - HOIST
      ?auto_18150 - SURFACE
      ?auto_18153 - PLACE
      ?auto_18152 - HOIST
      ?auto_18143 - SURFACE
      ?auto_18148 - SURFACE
      ?auto_18151 - PLACE
      ?auto_18155 - HOIST
      ?auto_18147 - SURFACE
      ?auto_18144 - PLACE
      ?auto_18149 - HOIST
      ?auto_18154 - SURFACE
      ?auto_18158 - PLACE
      ?auto_18157 - HOIST
      ?auto_18156 - SURFACE
      ?auto_18140 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18138 ?auto_18142 ) ( IS-CRATE ?auto_18136 ) ( not ( = ?auto_18137 ?auto_18142 ) ) ( HOIST-AT ?auto_18139 ?auto_18137 ) ( SURFACE-AT ?auto_18136 ?auto_18137 ) ( ON ?auto_18136 ?auto_18141 ) ( CLEAR ?auto_18136 ) ( not ( = ?auto_18135 ?auto_18136 ) ) ( not ( = ?auto_18135 ?auto_18141 ) ) ( not ( = ?auto_18136 ?auto_18141 ) ) ( not ( = ?auto_18138 ?auto_18139 ) ) ( IS-CRATE ?auto_18135 ) ( not ( = ?auto_18146 ?auto_18142 ) ) ( HOIST-AT ?auto_18145 ?auto_18146 ) ( AVAILABLE ?auto_18145 ) ( SURFACE-AT ?auto_18135 ?auto_18146 ) ( ON ?auto_18135 ?auto_18150 ) ( CLEAR ?auto_18135 ) ( not ( = ?auto_18134 ?auto_18135 ) ) ( not ( = ?auto_18134 ?auto_18150 ) ) ( not ( = ?auto_18135 ?auto_18150 ) ) ( not ( = ?auto_18138 ?auto_18145 ) ) ( IS-CRATE ?auto_18134 ) ( not ( = ?auto_18153 ?auto_18142 ) ) ( HOIST-AT ?auto_18152 ?auto_18153 ) ( AVAILABLE ?auto_18152 ) ( SURFACE-AT ?auto_18134 ?auto_18153 ) ( ON ?auto_18134 ?auto_18143 ) ( CLEAR ?auto_18134 ) ( not ( = ?auto_18133 ?auto_18134 ) ) ( not ( = ?auto_18133 ?auto_18143 ) ) ( not ( = ?auto_18134 ?auto_18143 ) ) ( not ( = ?auto_18138 ?auto_18152 ) ) ( IS-CRATE ?auto_18133 ) ( AVAILABLE ?auto_18139 ) ( SURFACE-AT ?auto_18133 ?auto_18137 ) ( ON ?auto_18133 ?auto_18148 ) ( CLEAR ?auto_18133 ) ( not ( = ?auto_18132 ?auto_18133 ) ) ( not ( = ?auto_18132 ?auto_18148 ) ) ( not ( = ?auto_18133 ?auto_18148 ) ) ( IS-CRATE ?auto_18132 ) ( not ( = ?auto_18151 ?auto_18142 ) ) ( HOIST-AT ?auto_18155 ?auto_18151 ) ( AVAILABLE ?auto_18155 ) ( SURFACE-AT ?auto_18132 ?auto_18151 ) ( ON ?auto_18132 ?auto_18147 ) ( CLEAR ?auto_18132 ) ( not ( = ?auto_18131 ?auto_18132 ) ) ( not ( = ?auto_18131 ?auto_18147 ) ) ( not ( = ?auto_18132 ?auto_18147 ) ) ( not ( = ?auto_18138 ?auto_18155 ) ) ( IS-CRATE ?auto_18131 ) ( not ( = ?auto_18144 ?auto_18142 ) ) ( HOIST-AT ?auto_18149 ?auto_18144 ) ( AVAILABLE ?auto_18149 ) ( SURFACE-AT ?auto_18131 ?auto_18144 ) ( ON ?auto_18131 ?auto_18154 ) ( CLEAR ?auto_18131 ) ( not ( = ?auto_18130 ?auto_18131 ) ) ( not ( = ?auto_18130 ?auto_18154 ) ) ( not ( = ?auto_18131 ?auto_18154 ) ) ( not ( = ?auto_18138 ?auto_18149 ) ) ( SURFACE-AT ?auto_18129 ?auto_18142 ) ( CLEAR ?auto_18129 ) ( IS-CRATE ?auto_18130 ) ( AVAILABLE ?auto_18138 ) ( not ( = ?auto_18158 ?auto_18142 ) ) ( HOIST-AT ?auto_18157 ?auto_18158 ) ( AVAILABLE ?auto_18157 ) ( SURFACE-AT ?auto_18130 ?auto_18158 ) ( ON ?auto_18130 ?auto_18156 ) ( CLEAR ?auto_18130 ) ( TRUCK-AT ?auto_18140 ?auto_18142 ) ( not ( = ?auto_18129 ?auto_18130 ) ) ( not ( = ?auto_18129 ?auto_18156 ) ) ( not ( = ?auto_18130 ?auto_18156 ) ) ( not ( = ?auto_18138 ?auto_18157 ) ) ( not ( = ?auto_18129 ?auto_18131 ) ) ( not ( = ?auto_18129 ?auto_18154 ) ) ( not ( = ?auto_18131 ?auto_18156 ) ) ( not ( = ?auto_18144 ?auto_18158 ) ) ( not ( = ?auto_18149 ?auto_18157 ) ) ( not ( = ?auto_18154 ?auto_18156 ) ) ( not ( = ?auto_18129 ?auto_18132 ) ) ( not ( = ?auto_18129 ?auto_18147 ) ) ( not ( = ?auto_18130 ?auto_18132 ) ) ( not ( = ?auto_18130 ?auto_18147 ) ) ( not ( = ?auto_18132 ?auto_18154 ) ) ( not ( = ?auto_18132 ?auto_18156 ) ) ( not ( = ?auto_18151 ?auto_18144 ) ) ( not ( = ?auto_18151 ?auto_18158 ) ) ( not ( = ?auto_18155 ?auto_18149 ) ) ( not ( = ?auto_18155 ?auto_18157 ) ) ( not ( = ?auto_18147 ?auto_18154 ) ) ( not ( = ?auto_18147 ?auto_18156 ) ) ( not ( = ?auto_18129 ?auto_18133 ) ) ( not ( = ?auto_18129 ?auto_18148 ) ) ( not ( = ?auto_18130 ?auto_18133 ) ) ( not ( = ?auto_18130 ?auto_18148 ) ) ( not ( = ?auto_18131 ?auto_18133 ) ) ( not ( = ?auto_18131 ?auto_18148 ) ) ( not ( = ?auto_18133 ?auto_18147 ) ) ( not ( = ?auto_18133 ?auto_18154 ) ) ( not ( = ?auto_18133 ?auto_18156 ) ) ( not ( = ?auto_18137 ?auto_18151 ) ) ( not ( = ?auto_18137 ?auto_18144 ) ) ( not ( = ?auto_18137 ?auto_18158 ) ) ( not ( = ?auto_18139 ?auto_18155 ) ) ( not ( = ?auto_18139 ?auto_18149 ) ) ( not ( = ?auto_18139 ?auto_18157 ) ) ( not ( = ?auto_18148 ?auto_18147 ) ) ( not ( = ?auto_18148 ?auto_18154 ) ) ( not ( = ?auto_18148 ?auto_18156 ) ) ( not ( = ?auto_18129 ?auto_18134 ) ) ( not ( = ?auto_18129 ?auto_18143 ) ) ( not ( = ?auto_18130 ?auto_18134 ) ) ( not ( = ?auto_18130 ?auto_18143 ) ) ( not ( = ?auto_18131 ?auto_18134 ) ) ( not ( = ?auto_18131 ?auto_18143 ) ) ( not ( = ?auto_18132 ?auto_18134 ) ) ( not ( = ?auto_18132 ?auto_18143 ) ) ( not ( = ?auto_18134 ?auto_18148 ) ) ( not ( = ?auto_18134 ?auto_18147 ) ) ( not ( = ?auto_18134 ?auto_18154 ) ) ( not ( = ?auto_18134 ?auto_18156 ) ) ( not ( = ?auto_18153 ?auto_18137 ) ) ( not ( = ?auto_18153 ?auto_18151 ) ) ( not ( = ?auto_18153 ?auto_18144 ) ) ( not ( = ?auto_18153 ?auto_18158 ) ) ( not ( = ?auto_18152 ?auto_18139 ) ) ( not ( = ?auto_18152 ?auto_18155 ) ) ( not ( = ?auto_18152 ?auto_18149 ) ) ( not ( = ?auto_18152 ?auto_18157 ) ) ( not ( = ?auto_18143 ?auto_18148 ) ) ( not ( = ?auto_18143 ?auto_18147 ) ) ( not ( = ?auto_18143 ?auto_18154 ) ) ( not ( = ?auto_18143 ?auto_18156 ) ) ( not ( = ?auto_18129 ?auto_18135 ) ) ( not ( = ?auto_18129 ?auto_18150 ) ) ( not ( = ?auto_18130 ?auto_18135 ) ) ( not ( = ?auto_18130 ?auto_18150 ) ) ( not ( = ?auto_18131 ?auto_18135 ) ) ( not ( = ?auto_18131 ?auto_18150 ) ) ( not ( = ?auto_18132 ?auto_18135 ) ) ( not ( = ?auto_18132 ?auto_18150 ) ) ( not ( = ?auto_18133 ?auto_18135 ) ) ( not ( = ?auto_18133 ?auto_18150 ) ) ( not ( = ?auto_18135 ?auto_18143 ) ) ( not ( = ?auto_18135 ?auto_18148 ) ) ( not ( = ?auto_18135 ?auto_18147 ) ) ( not ( = ?auto_18135 ?auto_18154 ) ) ( not ( = ?auto_18135 ?auto_18156 ) ) ( not ( = ?auto_18146 ?auto_18153 ) ) ( not ( = ?auto_18146 ?auto_18137 ) ) ( not ( = ?auto_18146 ?auto_18151 ) ) ( not ( = ?auto_18146 ?auto_18144 ) ) ( not ( = ?auto_18146 ?auto_18158 ) ) ( not ( = ?auto_18145 ?auto_18152 ) ) ( not ( = ?auto_18145 ?auto_18139 ) ) ( not ( = ?auto_18145 ?auto_18155 ) ) ( not ( = ?auto_18145 ?auto_18149 ) ) ( not ( = ?auto_18145 ?auto_18157 ) ) ( not ( = ?auto_18150 ?auto_18143 ) ) ( not ( = ?auto_18150 ?auto_18148 ) ) ( not ( = ?auto_18150 ?auto_18147 ) ) ( not ( = ?auto_18150 ?auto_18154 ) ) ( not ( = ?auto_18150 ?auto_18156 ) ) ( not ( = ?auto_18129 ?auto_18136 ) ) ( not ( = ?auto_18129 ?auto_18141 ) ) ( not ( = ?auto_18130 ?auto_18136 ) ) ( not ( = ?auto_18130 ?auto_18141 ) ) ( not ( = ?auto_18131 ?auto_18136 ) ) ( not ( = ?auto_18131 ?auto_18141 ) ) ( not ( = ?auto_18132 ?auto_18136 ) ) ( not ( = ?auto_18132 ?auto_18141 ) ) ( not ( = ?auto_18133 ?auto_18136 ) ) ( not ( = ?auto_18133 ?auto_18141 ) ) ( not ( = ?auto_18134 ?auto_18136 ) ) ( not ( = ?auto_18134 ?auto_18141 ) ) ( not ( = ?auto_18136 ?auto_18150 ) ) ( not ( = ?auto_18136 ?auto_18143 ) ) ( not ( = ?auto_18136 ?auto_18148 ) ) ( not ( = ?auto_18136 ?auto_18147 ) ) ( not ( = ?auto_18136 ?auto_18154 ) ) ( not ( = ?auto_18136 ?auto_18156 ) ) ( not ( = ?auto_18141 ?auto_18150 ) ) ( not ( = ?auto_18141 ?auto_18143 ) ) ( not ( = ?auto_18141 ?auto_18148 ) ) ( not ( = ?auto_18141 ?auto_18147 ) ) ( not ( = ?auto_18141 ?auto_18154 ) ) ( not ( = ?auto_18141 ?auto_18156 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_18129 ?auto_18130 ?auto_18131 ?auto_18132 ?auto_18133 ?auto_18134 ?auto_18135 )
      ( MAKE-1CRATE ?auto_18135 ?auto_18136 )
      ( MAKE-7CRATE-VERIFY ?auto_18129 ?auto_18130 ?auto_18131 ?auto_18132 ?auto_18133 ?auto_18134 ?auto_18135 ?auto_18136 ) )
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
      ?auto_18185 - SURFACE
      ?auto_18186 - SURFACE
    )
    :vars
    (
      ?auto_18189 - HOIST
      ?auto_18187 - PLACE
      ?auto_18191 - PLACE
      ?auto_18192 - HOIST
      ?auto_18190 - SURFACE
      ?auto_18203 - PLACE
      ?auto_18211 - HOIST
      ?auto_18201 - SURFACE
      ?auto_18202 - PLACE
      ?auto_18194 - HOIST
      ?auto_18206 - SURFACE
      ?auto_18199 - PLACE
      ?auto_18200 - HOIST
      ?auto_18196 - SURFACE
      ?auto_18208 - SURFACE
      ?auto_18198 - PLACE
      ?auto_18210 - HOIST
      ?auto_18209 - SURFACE
      ?auto_18193 - PLACE
      ?auto_18207 - HOIST
      ?auto_18204 - SURFACE
      ?auto_18197 - PLACE
      ?auto_18195 - HOIST
      ?auto_18205 - SURFACE
      ?auto_18188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18189 ?auto_18187 ) ( IS-CRATE ?auto_18186 ) ( not ( = ?auto_18191 ?auto_18187 ) ) ( HOIST-AT ?auto_18192 ?auto_18191 ) ( AVAILABLE ?auto_18192 ) ( SURFACE-AT ?auto_18186 ?auto_18191 ) ( ON ?auto_18186 ?auto_18190 ) ( CLEAR ?auto_18186 ) ( not ( = ?auto_18185 ?auto_18186 ) ) ( not ( = ?auto_18185 ?auto_18190 ) ) ( not ( = ?auto_18186 ?auto_18190 ) ) ( not ( = ?auto_18189 ?auto_18192 ) ) ( IS-CRATE ?auto_18185 ) ( not ( = ?auto_18203 ?auto_18187 ) ) ( HOIST-AT ?auto_18211 ?auto_18203 ) ( SURFACE-AT ?auto_18185 ?auto_18203 ) ( ON ?auto_18185 ?auto_18201 ) ( CLEAR ?auto_18185 ) ( not ( = ?auto_18184 ?auto_18185 ) ) ( not ( = ?auto_18184 ?auto_18201 ) ) ( not ( = ?auto_18185 ?auto_18201 ) ) ( not ( = ?auto_18189 ?auto_18211 ) ) ( IS-CRATE ?auto_18184 ) ( not ( = ?auto_18202 ?auto_18187 ) ) ( HOIST-AT ?auto_18194 ?auto_18202 ) ( AVAILABLE ?auto_18194 ) ( SURFACE-AT ?auto_18184 ?auto_18202 ) ( ON ?auto_18184 ?auto_18206 ) ( CLEAR ?auto_18184 ) ( not ( = ?auto_18183 ?auto_18184 ) ) ( not ( = ?auto_18183 ?auto_18206 ) ) ( not ( = ?auto_18184 ?auto_18206 ) ) ( not ( = ?auto_18189 ?auto_18194 ) ) ( IS-CRATE ?auto_18183 ) ( not ( = ?auto_18199 ?auto_18187 ) ) ( HOIST-AT ?auto_18200 ?auto_18199 ) ( AVAILABLE ?auto_18200 ) ( SURFACE-AT ?auto_18183 ?auto_18199 ) ( ON ?auto_18183 ?auto_18196 ) ( CLEAR ?auto_18183 ) ( not ( = ?auto_18182 ?auto_18183 ) ) ( not ( = ?auto_18182 ?auto_18196 ) ) ( not ( = ?auto_18183 ?auto_18196 ) ) ( not ( = ?auto_18189 ?auto_18200 ) ) ( IS-CRATE ?auto_18182 ) ( AVAILABLE ?auto_18211 ) ( SURFACE-AT ?auto_18182 ?auto_18203 ) ( ON ?auto_18182 ?auto_18208 ) ( CLEAR ?auto_18182 ) ( not ( = ?auto_18181 ?auto_18182 ) ) ( not ( = ?auto_18181 ?auto_18208 ) ) ( not ( = ?auto_18182 ?auto_18208 ) ) ( IS-CRATE ?auto_18181 ) ( not ( = ?auto_18198 ?auto_18187 ) ) ( HOIST-AT ?auto_18210 ?auto_18198 ) ( AVAILABLE ?auto_18210 ) ( SURFACE-AT ?auto_18181 ?auto_18198 ) ( ON ?auto_18181 ?auto_18209 ) ( CLEAR ?auto_18181 ) ( not ( = ?auto_18180 ?auto_18181 ) ) ( not ( = ?auto_18180 ?auto_18209 ) ) ( not ( = ?auto_18181 ?auto_18209 ) ) ( not ( = ?auto_18189 ?auto_18210 ) ) ( IS-CRATE ?auto_18180 ) ( not ( = ?auto_18193 ?auto_18187 ) ) ( HOIST-AT ?auto_18207 ?auto_18193 ) ( AVAILABLE ?auto_18207 ) ( SURFACE-AT ?auto_18180 ?auto_18193 ) ( ON ?auto_18180 ?auto_18204 ) ( CLEAR ?auto_18180 ) ( not ( = ?auto_18179 ?auto_18180 ) ) ( not ( = ?auto_18179 ?auto_18204 ) ) ( not ( = ?auto_18180 ?auto_18204 ) ) ( not ( = ?auto_18189 ?auto_18207 ) ) ( SURFACE-AT ?auto_18178 ?auto_18187 ) ( CLEAR ?auto_18178 ) ( IS-CRATE ?auto_18179 ) ( AVAILABLE ?auto_18189 ) ( not ( = ?auto_18197 ?auto_18187 ) ) ( HOIST-AT ?auto_18195 ?auto_18197 ) ( AVAILABLE ?auto_18195 ) ( SURFACE-AT ?auto_18179 ?auto_18197 ) ( ON ?auto_18179 ?auto_18205 ) ( CLEAR ?auto_18179 ) ( TRUCK-AT ?auto_18188 ?auto_18187 ) ( not ( = ?auto_18178 ?auto_18179 ) ) ( not ( = ?auto_18178 ?auto_18205 ) ) ( not ( = ?auto_18179 ?auto_18205 ) ) ( not ( = ?auto_18189 ?auto_18195 ) ) ( not ( = ?auto_18178 ?auto_18180 ) ) ( not ( = ?auto_18178 ?auto_18204 ) ) ( not ( = ?auto_18180 ?auto_18205 ) ) ( not ( = ?auto_18193 ?auto_18197 ) ) ( not ( = ?auto_18207 ?auto_18195 ) ) ( not ( = ?auto_18204 ?auto_18205 ) ) ( not ( = ?auto_18178 ?auto_18181 ) ) ( not ( = ?auto_18178 ?auto_18209 ) ) ( not ( = ?auto_18179 ?auto_18181 ) ) ( not ( = ?auto_18179 ?auto_18209 ) ) ( not ( = ?auto_18181 ?auto_18204 ) ) ( not ( = ?auto_18181 ?auto_18205 ) ) ( not ( = ?auto_18198 ?auto_18193 ) ) ( not ( = ?auto_18198 ?auto_18197 ) ) ( not ( = ?auto_18210 ?auto_18207 ) ) ( not ( = ?auto_18210 ?auto_18195 ) ) ( not ( = ?auto_18209 ?auto_18204 ) ) ( not ( = ?auto_18209 ?auto_18205 ) ) ( not ( = ?auto_18178 ?auto_18182 ) ) ( not ( = ?auto_18178 ?auto_18208 ) ) ( not ( = ?auto_18179 ?auto_18182 ) ) ( not ( = ?auto_18179 ?auto_18208 ) ) ( not ( = ?auto_18180 ?auto_18182 ) ) ( not ( = ?auto_18180 ?auto_18208 ) ) ( not ( = ?auto_18182 ?auto_18209 ) ) ( not ( = ?auto_18182 ?auto_18204 ) ) ( not ( = ?auto_18182 ?auto_18205 ) ) ( not ( = ?auto_18203 ?auto_18198 ) ) ( not ( = ?auto_18203 ?auto_18193 ) ) ( not ( = ?auto_18203 ?auto_18197 ) ) ( not ( = ?auto_18211 ?auto_18210 ) ) ( not ( = ?auto_18211 ?auto_18207 ) ) ( not ( = ?auto_18211 ?auto_18195 ) ) ( not ( = ?auto_18208 ?auto_18209 ) ) ( not ( = ?auto_18208 ?auto_18204 ) ) ( not ( = ?auto_18208 ?auto_18205 ) ) ( not ( = ?auto_18178 ?auto_18183 ) ) ( not ( = ?auto_18178 ?auto_18196 ) ) ( not ( = ?auto_18179 ?auto_18183 ) ) ( not ( = ?auto_18179 ?auto_18196 ) ) ( not ( = ?auto_18180 ?auto_18183 ) ) ( not ( = ?auto_18180 ?auto_18196 ) ) ( not ( = ?auto_18181 ?auto_18183 ) ) ( not ( = ?auto_18181 ?auto_18196 ) ) ( not ( = ?auto_18183 ?auto_18208 ) ) ( not ( = ?auto_18183 ?auto_18209 ) ) ( not ( = ?auto_18183 ?auto_18204 ) ) ( not ( = ?auto_18183 ?auto_18205 ) ) ( not ( = ?auto_18199 ?auto_18203 ) ) ( not ( = ?auto_18199 ?auto_18198 ) ) ( not ( = ?auto_18199 ?auto_18193 ) ) ( not ( = ?auto_18199 ?auto_18197 ) ) ( not ( = ?auto_18200 ?auto_18211 ) ) ( not ( = ?auto_18200 ?auto_18210 ) ) ( not ( = ?auto_18200 ?auto_18207 ) ) ( not ( = ?auto_18200 ?auto_18195 ) ) ( not ( = ?auto_18196 ?auto_18208 ) ) ( not ( = ?auto_18196 ?auto_18209 ) ) ( not ( = ?auto_18196 ?auto_18204 ) ) ( not ( = ?auto_18196 ?auto_18205 ) ) ( not ( = ?auto_18178 ?auto_18184 ) ) ( not ( = ?auto_18178 ?auto_18206 ) ) ( not ( = ?auto_18179 ?auto_18184 ) ) ( not ( = ?auto_18179 ?auto_18206 ) ) ( not ( = ?auto_18180 ?auto_18184 ) ) ( not ( = ?auto_18180 ?auto_18206 ) ) ( not ( = ?auto_18181 ?auto_18184 ) ) ( not ( = ?auto_18181 ?auto_18206 ) ) ( not ( = ?auto_18182 ?auto_18184 ) ) ( not ( = ?auto_18182 ?auto_18206 ) ) ( not ( = ?auto_18184 ?auto_18196 ) ) ( not ( = ?auto_18184 ?auto_18208 ) ) ( not ( = ?auto_18184 ?auto_18209 ) ) ( not ( = ?auto_18184 ?auto_18204 ) ) ( not ( = ?auto_18184 ?auto_18205 ) ) ( not ( = ?auto_18202 ?auto_18199 ) ) ( not ( = ?auto_18202 ?auto_18203 ) ) ( not ( = ?auto_18202 ?auto_18198 ) ) ( not ( = ?auto_18202 ?auto_18193 ) ) ( not ( = ?auto_18202 ?auto_18197 ) ) ( not ( = ?auto_18194 ?auto_18200 ) ) ( not ( = ?auto_18194 ?auto_18211 ) ) ( not ( = ?auto_18194 ?auto_18210 ) ) ( not ( = ?auto_18194 ?auto_18207 ) ) ( not ( = ?auto_18194 ?auto_18195 ) ) ( not ( = ?auto_18206 ?auto_18196 ) ) ( not ( = ?auto_18206 ?auto_18208 ) ) ( not ( = ?auto_18206 ?auto_18209 ) ) ( not ( = ?auto_18206 ?auto_18204 ) ) ( not ( = ?auto_18206 ?auto_18205 ) ) ( not ( = ?auto_18178 ?auto_18185 ) ) ( not ( = ?auto_18178 ?auto_18201 ) ) ( not ( = ?auto_18179 ?auto_18185 ) ) ( not ( = ?auto_18179 ?auto_18201 ) ) ( not ( = ?auto_18180 ?auto_18185 ) ) ( not ( = ?auto_18180 ?auto_18201 ) ) ( not ( = ?auto_18181 ?auto_18185 ) ) ( not ( = ?auto_18181 ?auto_18201 ) ) ( not ( = ?auto_18182 ?auto_18185 ) ) ( not ( = ?auto_18182 ?auto_18201 ) ) ( not ( = ?auto_18183 ?auto_18185 ) ) ( not ( = ?auto_18183 ?auto_18201 ) ) ( not ( = ?auto_18185 ?auto_18206 ) ) ( not ( = ?auto_18185 ?auto_18196 ) ) ( not ( = ?auto_18185 ?auto_18208 ) ) ( not ( = ?auto_18185 ?auto_18209 ) ) ( not ( = ?auto_18185 ?auto_18204 ) ) ( not ( = ?auto_18185 ?auto_18205 ) ) ( not ( = ?auto_18201 ?auto_18206 ) ) ( not ( = ?auto_18201 ?auto_18196 ) ) ( not ( = ?auto_18201 ?auto_18208 ) ) ( not ( = ?auto_18201 ?auto_18209 ) ) ( not ( = ?auto_18201 ?auto_18204 ) ) ( not ( = ?auto_18201 ?auto_18205 ) ) ( not ( = ?auto_18178 ?auto_18186 ) ) ( not ( = ?auto_18178 ?auto_18190 ) ) ( not ( = ?auto_18179 ?auto_18186 ) ) ( not ( = ?auto_18179 ?auto_18190 ) ) ( not ( = ?auto_18180 ?auto_18186 ) ) ( not ( = ?auto_18180 ?auto_18190 ) ) ( not ( = ?auto_18181 ?auto_18186 ) ) ( not ( = ?auto_18181 ?auto_18190 ) ) ( not ( = ?auto_18182 ?auto_18186 ) ) ( not ( = ?auto_18182 ?auto_18190 ) ) ( not ( = ?auto_18183 ?auto_18186 ) ) ( not ( = ?auto_18183 ?auto_18190 ) ) ( not ( = ?auto_18184 ?auto_18186 ) ) ( not ( = ?auto_18184 ?auto_18190 ) ) ( not ( = ?auto_18186 ?auto_18201 ) ) ( not ( = ?auto_18186 ?auto_18206 ) ) ( not ( = ?auto_18186 ?auto_18196 ) ) ( not ( = ?auto_18186 ?auto_18208 ) ) ( not ( = ?auto_18186 ?auto_18209 ) ) ( not ( = ?auto_18186 ?auto_18204 ) ) ( not ( = ?auto_18186 ?auto_18205 ) ) ( not ( = ?auto_18191 ?auto_18203 ) ) ( not ( = ?auto_18191 ?auto_18202 ) ) ( not ( = ?auto_18191 ?auto_18199 ) ) ( not ( = ?auto_18191 ?auto_18198 ) ) ( not ( = ?auto_18191 ?auto_18193 ) ) ( not ( = ?auto_18191 ?auto_18197 ) ) ( not ( = ?auto_18192 ?auto_18211 ) ) ( not ( = ?auto_18192 ?auto_18194 ) ) ( not ( = ?auto_18192 ?auto_18200 ) ) ( not ( = ?auto_18192 ?auto_18210 ) ) ( not ( = ?auto_18192 ?auto_18207 ) ) ( not ( = ?auto_18192 ?auto_18195 ) ) ( not ( = ?auto_18190 ?auto_18201 ) ) ( not ( = ?auto_18190 ?auto_18206 ) ) ( not ( = ?auto_18190 ?auto_18196 ) ) ( not ( = ?auto_18190 ?auto_18208 ) ) ( not ( = ?auto_18190 ?auto_18209 ) ) ( not ( = ?auto_18190 ?auto_18204 ) ) ( not ( = ?auto_18190 ?auto_18205 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_18178 ?auto_18179 ?auto_18180 ?auto_18181 ?auto_18182 ?auto_18183 ?auto_18184 ?auto_18185 )
      ( MAKE-1CRATE ?auto_18185 ?auto_18186 )
      ( MAKE-8CRATE-VERIFY ?auto_18178 ?auto_18179 ?auto_18180 ?auto_18181 ?auto_18182 ?auto_18183 ?auto_18184 ?auto_18185 ?auto_18186 ) )
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
      ?auto_18239 - SURFACE
      ?auto_18240 - SURFACE
      ?auto_18241 - SURFACE
    )
    :vars
    (
      ?auto_18243 - HOIST
      ?auto_18242 - PLACE
      ?auto_18245 - PLACE
      ?auto_18247 - HOIST
      ?auto_18244 - SURFACE
      ?auto_18268 - PLACE
      ?auto_18254 - HOIST
      ?auto_18265 - SURFACE
      ?auto_18250 - PLACE
      ?auto_18256 - HOIST
      ?auto_18252 - SURFACE
      ?auto_18260 - PLACE
      ?auto_18248 - HOIST
      ?auto_18263 - SURFACE
      ?auto_18266 - PLACE
      ?auto_18264 - HOIST
      ?auto_18269 - SURFACE
      ?auto_18257 - SURFACE
      ?auto_18267 - PLACE
      ?auto_18259 - HOIST
      ?auto_18253 - SURFACE
      ?auto_18258 - PLACE
      ?auto_18249 - HOIST
      ?auto_18261 - SURFACE
      ?auto_18255 - PLACE
      ?auto_18251 - HOIST
      ?auto_18262 - SURFACE
      ?auto_18246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18243 ?auto_18242 ) ( IS-CRATE ?auto_18241 ) ( not ( = ?auto_18245 ?auto_18242 ) ) ( HOIST-AT ?auto_18247 ?auto_18245 ) ( AVAILABLE ?auto_18247 ) ( SURFACE-AT ?auto_18241 ?auto_18245 ) ( ON ?auto_18241 ?auto_18244 ) ( CLEAR ?auto_18241 ) ( not ( = ?auto_18240 ?auto_18241 ) ) ( not ( = ?auto_18240 ?auto_18244 ) ) ( not ( = ?auto_18241 ?auto_18244 ) ) ( not ( = ?auto_18243 ?auto_18247 ) ) ( IS-CRATE ?auto_18240 ) ( not ( = ?auto_18268 ?auto_18242 ) ) ( HOIST-AT ?auto_18254 ?auto_18268 ) ( AVAILABLE ?auto_18254 ) ( SURFACE-AT ?auto_18240 ?auto_18268 ) ( ON ?auto_18240 ?auto_18265 ) ( CLEAR ?auto_18240 ) ( not ( = ?auto_18239 ?auto_18240 ) ) ( not ( = ?auto_18239 ?auto_18265 ) ) ( not ( = ?auto_18240 ?auto_18265 ) ) ( not ( = ?auto_18243 ?auto_18254 ) ) ( IS-CRATE ?auto_18239 ) ( not ( = ?auto_18250 ?auto_18242 ) ) ( HOIST-AT ?auto_18256 ?auto_18250 ) ( SURFACE-AT ?auto_18239 ?auto_18250 ) ( ON ?auto_18239 ?auto_18252 ) ( CLEAR ?auto_18239 ) ( not ( = ?auto_18238 ?auto_18239 ) ) ( not ( = ?auto_18238 ?auto_18252 ) ) ( not ( = ?auto_18239 ?auto_18252 ) ) ( not ( = ?auto_18243 ?auto_18256 ) ) ( IS-CRATE ?auto_18238 ) ( not ( = ?auto_18260 ?auto_18242 ) ) ( HOIST-AT ?auto_18248 ?auto_18260 ) ( AVAILABLE ?auto_18248 ) ( SURFACE-AT ?auto_18238 ?auto_18260 ) ( ON ?auto_18238 ?auto_18263 ) ( CLEAR ?auto_18238 ) ( not ( = ?auto_18237 ?auto_18238 ) ) ( not ( = ?auto_18237 ?auto_18263 ) ) ( not ( = ?auto_18238 ?auto_18263 ) ) ( not ( = ?auto_18243 ?auto_18248 ) ) ( IS-CRATE ?auto_18237 ) ( not ( = ?auto_18266 ?auto_18242 ) ) ( HOIST-AT ?auto_18264 ?auto_18266 ) ( AVAILABLE ?auto_18264 ) ( SURFACE-AT ?auto_18237 ?auto_18266 ) ( ON ?auto_18237 ?auto_18269 ) ( CLEAR ?auto_18237 ) ( not ( = ?auto_18236 ?auto_18237 ) ) ( not ( = ?auto_18236 ?auto_18269 ) ) ( not ( = ?auto_18237 ?auto_18269 ) ) ( not ( = ?auto_18243 ?auto_18264 ) ) ( IS-CRATE ?auto_18236 ) ( AVAILABLE ?auto_18256 ) ( SURFACE-AT ?auto_18236 ?auto_18250 ) ( ON ?auto_18236 ?auto_18257 ) ( CLEAR ?auto_18236 ) ( not ( = ?auto_18235 ?auto_18236 ) ) ( not ( = ?auto_18235 ?auto_18257 ) ) ( not ( = ?auto_18236 ?auto_18257 ) ) ( IS-CRATE ?auto_18235 ) ( not ( = ?auto_18267 ?auto_18242 ) ) ( HOIST-AT ?auto_18259 ?auto_18267 ) ( AVAILABLE ?auto_18259 ) ( SURFACE-AT ?auto_18235 ?auto_18267 ) ( ON ?auto_18235 ?auto_18253 ) ( CLEAR ?auto_18235 ) ( not ( = ?auto_18234 ?auto_18235 ) ) ( not ( = ?auto_18234 ?auto_18253 ) ) ( not ( = ?auto_18235 ?auto_18253 ) ) ( not ( = ?auto_18243 ?auto_18259 ) ) ( IS-CRATE ?auto_18234 ) ( not ( = ?auto_18258 ?auto_18242 ) ) ( HOIST-AT ?auto_18249 ?auto_18258 ) ( AVAILABLE ?auto_18249 ) ( SURFACE-AT ?auto_18234 ?auto_18258 ) ( ON ?auto_18234 ?auto_18261 ) ( CLEAR ?auto_18234 ) ( not ( = ?auto_18233 ?auto_18234 ) ) ( not ( = ?auto_18233 ?auto_18261 ) ) ( not ( = ?auto_18234 ?auto_18261 ) ) ( not ( = ?auto_18243 ?auto_18249 ) ) ( SURFACE-AT ?auto_18232 ?auto_18242 ) ( CLEAR ?auto_18232 ) ( IS-CRATE ?auto_18233 ) ( AVAILABLE ?auto_18243 ) ( not ( = ?auto_18255 ?auto_18242 ) ) ( HOIST-AT ?auto_18251 ?auto_18255 ) ( AVAILABLE ?auto_18251 ) ( SURFACE-AT ?auto_18233 ?auto_18255 ) ( ON ?auto_18233 ?auto_18262 ) ( CLEAR ?auto_18233 ) ( TRUCK-AT ?auto_18246 ?auto_18242 ) ( not ( = ?auto_18232 ?auto_18233 ) ) ( not ( = ?auto_18232 ?auto_18262 ) ) ( not ( = ?auto_18233 ?auto_18262 ) ) ( not ( = ?auto_18243 ?auto_18251 ) ) ( not ( = ?auto_18232 ?auto_18234 ) ) ( not ( = ?auto_18232 ?auto_18261 ) ) ( not ( = ?auto_18234 ?auto_18262 ) ) ( not ( = ?auto_18258 ?auto_18255 ) ) ( not ( = ?auto_18249 ?auto_18251 ) ) ( not ( = ?auto_18261 ?auto_18262 ) ) ( not ( = ?auto_18232 ?auto_18235 ) ) ( not ( = ?auto_18232 ?auto_18253 ) ) ( not ( = ?auto_18233 ?auto_18235 ) ) ( not ( = ?auto_18233 ?auto_18253 ) ) ( not ( = ?auto_18235 ?auto_18261 ) ) ( not ( = ?auto_18235 ?auto_18262 ) ) ( not ( = ?auto_18267 ?auto_18258 ) ) ( not ( = ?auto_18267 ?auto_18255 ) ) ( not ( = ?auto_18259 ?auto_18249 ) ) ( not ( = ?auto_18259 ?auto_18251 ) ) ( not ( = ?auto_18253 ?auto_18261 ) ) ( not ( = ?auto_18253 ?auto_18262 ) ) ( not ( = ?auto_18232 ?auto_18236 ) ) ( not ( = ?auto_18232 ?auto_18257 ) ) ( not ( = ?auto_18233 ?auto_18236 ) ) ( not ( = ?auto_18233 ?auto_18257 ) ) ( not ( = ?auto_18234 ?auto_18236 ) ) ( not ( = ?auto_18234 ?auto_18257 ) ) ( not ( = ?auto_18236 ?auto_18253 ) ) ( not ( = ?auto_18236 ?auto_18261 ) ) ( not ( = ?auto_18236 ?auto_18262 ) ) ( not ( = ?auto_18250 ?auto_18267 ) ) ( not ( = ?auto_18250 ?auto_18258 ) ) ( not ( = ?auto_18250 ?auto_18255 ) ) ( not ( = ?auto_18256 ?auto_18259 ) ) ( not ( = ?auto_18256 ?auto_18249 ) ) ( not ( = ?auto_18256 ?auto_18251 ) ) ( not ( = ?auto_18257 ?auto_18253 ) ) ( not ( = ?auto_18257 ?auto_18261 ) ) ( not ( = ?auto_18257 ?auto_18262 ) ) ( not ( = ?auto_18232 ?auto_18237 ) ) ( not ( = ?auto_18232 ?auto_18269 ) ) ( not ( = ?auto_18233 ?auto_18237 ) ) ( not ( = ?auto_18233 ?auto_18269 ) ) ( not ( = ?auto_18234 ?auto_18237 ) ) ( not ( = ?auto_18234 ?auto_18269 ) ) ( not ( = ?auto_18235 ?auto_18237 ) ) ( not ( = ?auto_18235 ?auto_18269 ) ) ( not ( = ?auto_18237 ?auto_18257 ) ) ( not ( = ?auto_18237 ?auto_18253 ) ) ( not ( = ?auto_18237 ?auto_18261 ) ) ( not ( = ?auto_18237 ?auto_18262 ) ) ( not ( = ?auto_18266 ?auto_18250 ) ) ( not ( = ?auto_18266 ?auto_18267 ) ) ( not ( = ?auto_18266 ?auto_18258 ) ) ( not ( = ?auto_18266 ?auto_18255 ) ) ( not ( = ?auto_18264 ?auto_18256 ) ) ( not ( = ?auto_18264 ?auto_18259 ) ) ( not ( = ?auto_18264 ?auto_18249 ) ) ( not ( = ?auto_18264 ?auto_18251 ) ) ( not ( = ?auto_18269 ?auto_18257 ) ) ( not ( = ?auto_18269 ?auto_18253 ) ) ( not ( = ?auto_18269 ?auto_18261 ) ) ( not ( = ?auto_18269 ?auto_18262 ) ) ( not ( = ?auto_18232 ?auto_18238 ) ) ( not ( = ?auto_18232 ?auto_18263 ) ) ( not ( = ?auto_18233 ?auto_18238 ) ) ( not ( = ?auto_18233 ?auto_18263 ) ) ( not ( = ?auto_18234 ?auto_18238 ) ) ( not ( = ?auto_18234 ?auto_18263 ) ) ( not ( = ?auto_18235 ?auto_18238 ) ) ( not ( = ?auto_18235 ?auto_18263 ) ) ( not ( = ?auto_18236 ?auto_18238 ) ) ( not ( = ?auto_18236 ?auto_18263 ) ) ( not ( = ?auto_18238 ?auto_18269 ) ) ( not ( = ?auto_18238 ?auto_18257 ) ) ( not ( = ?auto_18238 ?auto_18253 ) ) ( not ( = ?auto_18238 ?auto_18261 ) ) ( not ( = ?auto_18238 ?auto_18262 ) ) ( not ( = ?auto_18260 ?auto_18266 ) ) ( not ( = ?auto_18260 ?auto_18250 ) ) ( not ( = ?auto_18260 ?auto_18267 ) ) ( not ( = ?auto_18260 ?auto_18258 ) ) ( not ( = ?auto_18260 ?auto_18255 ) ) ( not ( = ?auto_18248 ?auto_18264 ) ) ( not ( = ?auto_18248 ?auto_18256 ) ) ( not ( = ?auto_18248 ?auto_18259 ) ) ( not ( = ?auto_18248 ?auto_18249 ) ) ( not ( = ?auto_18248 ?auto_18251 ) ) ( not ( = ?auto_18263 ?auto_18269 ) ) ( not ( = ?auto_18263 ?auto_18257 ) ) ( not ( = ?auto_18263 ?auto_18253 ) ) ( not ( = ?auto_18263 ?auto_18261 ) ) ( not ( = ?auto_18263 ?auto_18262 ) ) ( not ( = ?auto_18232 ?auto_18239 ) ) ( not ( = ?auto_18232 ?auto_18252 ) ) ( not ( = ?auto_18233 ?auto_18239 ) ) ( not ( = ?auto_18233 ?auto_18252 ) ) ( not ( = ?auto_18234 ?auto_18239 ) ) ( not ( = ?auto_18234 ?auto_18252 ) ) ( not ( = ?auto_18235 ?auto_18239 ) ) ( not ( = ?auto_18235 ?auto_18252 ) ) ( not ( = ?auto_18236 ?auto_18239 ) ) ( not ( = ?auto_18236 ?auto_18252 ) ) ( not ( = ?auto_18237 ?auto_18239 ) ) ( not ( = ?auto_18237 ?auto_18252 ) ) ( not ( = ?auto_18239 ?auto_18263 ) ) ( not ( = ?auto_18239 ?auto_18269 ) ) ( not ( = ?auto_18239 ?auto_18257 ) ) ( not ( = ?auto_18239 ?auto_18253 ) ) ( not ( = ?auto_18239 ?auto_18261 ) ) ( not ( = ?auto_18239 ?auto_18262 ) ) ( not ( = ?auto_18252 ?auto_18263 ) ) ( not ( = ?auto_18252 ?auto_18269 ) ) ( not ( = ?auto_18252 ?auto_18257 ) ) ( not ( = ?auto_18252 ?auto_18253 ) ) ( not ( = ?auto_18252 ?auto_18261 ) ) ( not ( = ?auto_18252 ?auto_18262 ) ) ( not ( = ?auto_18232 ?auto_18240 ) ) ( not ( = ?auto_18232 ?auto_18265 ) ) ( not ( = ?auto_18233 ?auto_18240 ) ) ( not ( = ?auto_18233 ?auto_18265 ) ) ( not ( = ?auto_18234 ?auto_18240 ) ) ( not ( = ?auto_18234 ?auto_18265 ) ) ( not ( = ?auto_18235 ?auto_18240 ) ) ( not ( = ?auto_18235 ?auto_18265 ) ) ( not ( = ?auto_18236 ?auto_18240 ) ) ( not ( = ?auto_18236 ?auto_18265 ) ) ( not ( = ?auto_18237 ?auto_18240 ) ) ( not ( = ?auto_18237 ?auto_18265 ) ) ( not ( = ?auto_18238 ?auto_18240 ) ) ( not ( = ?auto_18238 ?auto_18265 ) ) ( not ( = ?auto_18240 ?auto_18252 ) ) ( not ( = ?auto_18240 ?auto_18263 ) ) ( not ( = ?auto_18240 ?auto_18269 ) ) ( not ( = ?auto_18240 ?auto_18257 ) ) ( not ( = ?auto_18240 ?auto_18253 ) ) ( not ( = ?auto_18240 ?auto_18261 ) ) ( not ( = ?auto_18240 ?auto_18262 ) ) ( not ( = ?auto_18268 ?auto_18250 ) ) ( not ( = ?auto_18268 ?auto_18260 ) ) ( not ( = ?auto_18268 ?auto_18266 ) ) ( not ( = ?auto_18268 ?auto_18267 ) ) ( not ( = ?auto_18268 ?auto_18258 ) ) ( not ( = ?auto_18268 ?auto_18255 ) ) ( not ( = ?auto_18254 ?auto_18256 ) ) ( not ( = ?auto_18254 ?auto_18248 ) ) ( not ( = ?auto_18254 ?auto_18264 ) ) ( not ( = ?auto_18254 ?auto_18259 ) ) ( not ( = ?auto_18254 ?auto_18249 ) ) ( not ( = ?auto_18254 ?auto_18251 ) ) ( not ( = ?auto_18265 ?auto_18252 ) ) ( not ( = ?auto_18265 ?auto_18263 ) ) ( not ( = ?auto_18265 ?auto_18269 ) ) ( not ( = ?auto_18265 ?auto_18257 ) ) ( not ( = ?auto_18265 ?auto_18253 ) ) ( not ( = ?auto_18265 ?auto_18261 ) ) ( not ( = ?auto_18265 ?auto_18262 ) ) ( not ( = ?auto_18232 ?auto_18241 ) ) ( not ( = ?auto_18232 ?auto_18244 ) ) ( not ( = ?auto_18233 ?auto_18241 ) ) ( not ( = ?auto_18233 ?auto_18244 ) ) ( not ( = ?auto_18234 ?auto_18241 ) ) ( not ( = ?auto_18234 ?auto_18244 ) ) ( not ( = ?auto_18235 ?auto_18241 ) ) ( not ( = ?auto_18235 ?auto_18244 ) ) ( not ( = ?auto_18236 ?auto_18241 ) ) ( not ( = ?auto_18236 ?auto_18244 ) ) ( not ( = ?auto_18237 ?auto_18241 ) ) ( not ( = ?auto_18237 ?auto_18244 ) ) ( not ( = ?auto_18238 ?auto_18241 ) ) ( not ( = ?auto_18238 ?auto_18244 ) ) ( not ( = ?auto_18239 ?auto_18241 ) ) ( not ( = ?auto_18239 ?auto_18244 ) ) ( not ( = ?auto_18241 ?auto_18265 ) ) ( not ( = ?auto_18241 ?auto_18252 ) ) ( not ( = ?auto_18241 ?auto_18263 ) ) ( not ( = ?auto_18241 ?auto_18269 ) ) ( not ( = ?auto_18241 ?auto_18257 ) ) ( not ( = ?auto_18241 ?auto_18253 ) ) ( not ( = ?auto_18241 ?auto_18261 ) ) ( not ( = ?auto_18241 ?auto_18262 ) ) ( not ( = ?auto_18245 ?auto_18268 ) ) ( not ( = ?auto_18245 ?auto_18250 ) ) ( not ( = ?auto_18245 ?auto_18260 ) ) ( not ( = ?auto_18245 ?auto_18266 ) ) ( not ( = ?auto_18245 ?auto_18267 ) ) ( not ( = ?auto_18245 ?auto_18258 ) ) ( not ( = ?auto_18245 ?auto_18255 ) ) ( not ( = ?auto_18247 ?auto_18254 ) ) ( not ( = ?auto_18247 ?auto_18256 ) ) ( not ( = ?auto_18247 ?auto_18248 ) ) ( not ( = ?auto_18247 ?auto_18264 ) ) ( not ( = ?auto_18247 ?auto_18259 ) ) ( not ( = ?auto_18247 ?auto_18249 ) ) ( not ( = ?auto_18247 ?auto_18251 ) ) ( not ( = ?auto_18244 ?auto_18265 ) ) ( not ( = ?auto_18244 ?auto_18252 ) ) ( not ( = ?auto_18244 ?auto_18263 ) ) ( not ( = ?auto_18244 ?auto_18269 ) ) ( not ( = ?auto_18244 ?auto_18257 ) ) ( not ( = ?auto_18244 ?auto_18253 ) ) ( not ( = ?auto_18244 ?auto_18261 ) ) ( not ( = ?auto_18244 ?auto_18262 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_18232 ?auto_18233 ?auto_18234 ?auto_18235 ?auto_18236 ?auto_18237 ?auto_18238 ?auto_18239 ?auto_18240 )
      ( MAKE-1CRATE ?auto_18240 ?auto_18241 )
      ( MAKE-9CRATE-VERIFY ?auto_18232 ?auto_18233 ?auto_18234 ?auto_18235 ?auto_18236 ?auto_18237 ?auto_18238 ?auto_18239 ?auto_18240 ?auto_18241 ) )
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
      ?auto_18298 - SURFACE
      ?auto_18299 - SURFACE
      ?auto_18300 - SURFACE
      ?auto_18301 - SURFACE
    )
    :vars
    (
      ?auto_18302 - HOIST
      ?auto_18305 - PLACE
      ?auto_18303 - PLACE
      ?auto_18304 - HOIST
      ?auto_18307 - SURFACE
      ?auto_18318 - PLACE
      ?auto_18328 - HOIST
      ?auto_18317 - SURFACE
      ?auto_18312 - PLACE
      ?auto_18309 - HOIST
      ?auto_18310 - SURFACE
      ?auto_18325 - SURFACE
      ?auto_18330 - PLACE
      ?auto_18314 - HOIST
      ?auto_18329 - SURFACE
      ?auto_18319 - PLACE
      ?auto_18316 - HOIST
      ?auto_18311 - SURFACE
      ?auto_18320 - SURFACE
      ?auto_18313 - PLACE
      ?auto_18322 - HOIST
      ?auto_18321 - SURFACE
      ?auto_18315 - PLACE
      ?auto_18308 - HOIST
      ?auto_18323 - SURFACE
      ?auto_18324 - PLACE
      ?auto_18327 - HOIST
      ?auto_18326 - SURFACE
      ?auto_18306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18302 ?auto_18305 ) ( IS-CRATE ?auto_18301 ) ( not ( = ?auto_18303 ?auto_18305 ) ) ( HOIST-AT ?auto_18304 ?auto_18303 ) ( SURFACE-AT ?auto_18301 ?auto_18303 ) ( ON ?auto_18301 ?auto_18307 ) ( CLEAR ?auto_18301 ) ( not ( = ?auto_18300 ?auto_18301 ) ) ( not ( = ?auto_18300 ?auto_18307 ) ) ( not ( = ?auto_18301 ?auto_18307 ) ) ( not ( = ?auto_18302 ?auto_18304 ) ) ( IS-CRATE ?auto_18300 ) ( not ( = ?auto_18318 ?auto_18305 ) ) ( HOIST-AT ?auto_18328 ?auto_18318 ) ( AVAILABLE ?auto_18328 ) ( SURFACE-AT ?auto_18300 ?auto_18318 ) ( ON ?auto_18300 ?auto_18317 ) ( CLEAR ?auto_18300 ) ( not ( = ?auto_18299 ?auto_18300 ) ) ( not ( = ?auto_18299 ?auto_18317 ) ) ( not ( = ?auto_18300 ?auto_18317 ) ) ( not ( = ?auto_18302 ?auto_18328 ) ) ( IS-CRATE ?auto_18299 ) ( not ( = ?auto_18312 ?auto_18305 ) ) ( HOIST-AT ?auto_18309 ?auto_18312 ) ( AVAILABLE ?auto_18309 ) ( SURFACE-AT ?auto_18299 ?auto_18312 ) ( ON ?auto_18299 ?auto_18310 ) ( CLEAR ?auto_18299 ) ( not ( = ?auto_18298 ?auto_18299 ) ) ( not ( = ?auto_18298 ?auto_18310 ) ) ( not ( = ?auto_18299 ?auto_18310 ) ) ( not ( = ?auto_18302 ?auto_18309 ) ) ( IS-CRATE ?auto_18298 ) ( SURFACE-AT ?auto_18298 ?auto_18303 ) ( ON ?auto_18298 ?auto_18325 ) ( CLEAR ?auto_18298 ) ( not ( = ?auto_18297 ?auto_18298 ) ) ( not ( = ?auto_18297 ?auto_18325 ) ) ( not ( = ?auto_18298 ?auto_18325 ) ) ( IS-CRATE ?auto_18297 ) ( not ( = ?auto_18330 ?auto_18305 ) ) ( HOIST-AT ?auto_18314 ?auto_18330 ) ( AVAILABLE ?auto_18314 ) ( SURFACE-AT ?auto_18297 ?auto_18330 ) ( ON ?auto_18297 ?auto_18329 ) ( CLEAR ?auto_18297 ) ( not ( = ?auto_18296 ?auto_18297 ) ) ( not ( = ?auto_18296 ?auto_18329 ) ) ( not ( = ?auto_18297 ?auto_18329 ) ) ( not ( = ?auto_18302 ?auto_18314 ) ) ( IS-CRATE ?auto_18296 ) ( not ( = ?auto_18319 ?auto_18305 ) ) ( HOIST-AT ?auto_18316 ?auto_18319 ) ( AVAILABLE ?auto_18316 ) ( SURFACE-AT ?auto_18296 ?auto_18319 ) ( ON ?auto_18296 ?auto_18311 ) ( CLEAR ?auto_18296 ) ( not ( = ?auto_18295 ?auto_18296 ) ) ( not ( = ?auto_18295 ?auto_18311 ) ) ( not ( = ?auto_18296 ?auto_18311 ) ) ( not ( = ?auto_18302 ?auto_18316 ) ) ( IS-CRATE ?auto_18295 ) ( AVAILABLE ?auto_18304 ) ( SURFACE-AT ?auto_18295 ?auto_18303 ) ( ON ?auto_18295 ?auto_18320 ) ( CLEAR ?auto_18295 ) ( not ( = ?auto_18294 ?auto_18295 ) ) ( not ( = ?auto_18294 ?auto_18320 ) ) ( not ( = ?auto_18295 ?auto_18320 ) ) ( IS-CRATE ?auto_18294 ) ( not ( = ?auto_18313 ?auto_18305 ) ) ( HOIST-AT ?auto_18322 ?auto_18313 ) ( AVAILABLE ?auto_18322 ) ( SURFACE-AT ?auto_18294 ?auto_18313 ) ( ON ?auto_18294 ?auto_18321 ) ( CLEAR ?auto_18294 ) ( not ( = ?auto_18293 ?auto_18294 ) ) ( not ( = ?auto_18293 ?auto_18321 ) ) ( not ( = ?auto_18294 ?auto_18321 ) ) ( not ( = ?auto_18302 ?auto_18322 ) ) ( IS-CRATE ?auto_18293 ) ( not ( = ?auto_18315 ?auto_18305 ) ) ( HOIST-AT ?auto_18308 ?auto_18315 ) ( AVAILABLE ?auto_18308 ) ( SURFACE-AT ?auto_18293 ?auto_18315 ) ( ON ?auto_18293 ?auto_18323 ) ( CLEAR ?auto_18293 ) ( not ( = ?auto_18292 ?auto_18293 ) ) ( not ( = ?auto_18292 ?auto_18323 ) ) ( not ( = ?auto_18293 ?auto_18323 ) ) ( not ( = ?auto_18302 ?auto_18308 ) ) ( SURFACE-AT ?auto_18291 ?auto_18305 ) ( CLEAR ?auto_18291 ) ( IS-CRATE ?auto_18292 ) ( AVAILABLE ?auto_18302 ) ( not ( = ?auto_18324 ?auto_18305 ) ) ( HOIST-AT ?auto_18327 ?auto_18324 ) ( AVAILABLE ?auto_18327 ) ( SURFACE-AT ?auto_18292 ?auto_18324 ) ( ON ?auto_18292 ?auto_18326 ) ( CLEAR ?auto_18292 ) ( TRUCK-AT ?auto_18306 ?auto_18305 ) ( not ( = ?auto_18291 ?auto_18292 ) ) ( not ( = ?auto_18291 ?auto_18326 ) ) ( not ( = ?auto_18292 ?auto_18326 ) ) ( not ( = ?auto_18302 ?auto_18327 ) ) ( not ( = ?auto_18291 ?auto_18293 ) ) ( not ( = ?auto_18291 ?auto_18323 ) ) ( not ( = ?auto_18293 ?auto_18326 ) ) ( not ( = ?auto_18315 ?auto_18324 ) ) ( not ( = ?auto_18308 ?auto_18327 ) ) ( not ( = ?auto_18323 ?auto_18326 ) ) ( not ( = ?auto_18291 ?auto_18294 ) ) ( not ( = ?auto_18291 ?auto_18321 ) ) ( not ( = ?auto_18292 ?auto_18294 ) ) ( not ( = ?auto_18292 ?auto_18321 ) ) ( not ( = ?auto_18294 ?auto_18323 ) ) ( not ( = ?auto_18294 ?auto_18326 ) ) ( not ( = ?auto_18313 ?auto_18315 ) ) ( not ( = ?auto_18313 ?auto_18324 ) ) ( not ( = ?auto_18322 ?auto_18308 ) ) ( not ( = ?auto_18322 ?auto_18327 ) ) ( not ( = ?auto_18321 ?auto_18323 ) ) ( not ( = ?auto_18321 ?auto_18326 ) ) ( not ( = ?auto_18291 ?auto_18295 ) ) ( not ( = ?auto_18291 ?auto_18320 ) ) ( not ( = ?auto_18292 ?auto_18295 ) ) ( not ( = ?auto_18292 ?auto_18320 ) ) ( not ( = ?auto_18293 ?auto_18295 ) ) ( not ( = ?auto_18293 ?auto_18320 ) ) ( not ( = ?auto_18295 ?auto_18321 ) ) ( not ( = ?auto_18295 ?auto_18323 ) ) ( not ( = ?auto_18295 ?auto_18326 ) ) ( not ( = ?auto_18303 ?auto_18313 ) ) ( not ( = ?auto_18303 ?auto_18315 ) ) ( not ( = ?auto_18303 ?auto_18324 ) ) ( not ( = ?auto_18304 ?auto_18322 ) ) ( not ( = ?auto_18304 ?auto_18308 ) ) ( not ( = ?auto_18304 ?auto_18327 ) ) ( not ( = ?auto_18320 ?auto_18321 ) ) ( not ( = ?auto_18320 ?auto_18323 ) ) ( not ( = ?auto_18320 ?auto_18326 ) ) ( not ( = ?auto_18291 ?auto_18296 ) ) ( not ( = ?auto_18291 ?auto_18311 ) ) ( not ( = ?auto_18292 ?auto_18296 ) ) ( not ( = ?auto_18292 ?auto_18311 ) ) ( not ( = ?auto_18293 ?auto_18296 ) ) ( not ( = ?auto_18293 ?auto_18311 ) ) ( not ( = ?auto_18294 ?auto_18296 ) ) ( not ( = ?auto_18294 ?auto_18311 ) ) ( not ( = ?auto_18296 ?auto_18320 ) ) ( not ( = ?auto_18296 ?auto_18321 ) ) ( not ( = ?auto_18296 ?auto_18323 ) ) ( not ( = ?auto_18296 ?auto_18326 ) ) ( not ( = ?auto_18319 ?auto_18303 ) ) ( not ( = ?auto_18319 ?auto_18313 ) ) ( not ( = ?auto_18319 ?auto_18315 ) ) ( not ( = ?auto_18319 ?auto_18324 ) ) ( not ( = ?auto_18316 ?auto_18304 ) ) ( not ( = ?auto_18316 ?auto_18322 ) ) ( not ( = ?auto_18316 ?auto_18308 ) ) ( not ( = ?auto_18316 ?auto_18327 ) ) ( not ( = ?auto_18311 ?auto_18320 ) ) ( not ( = ?auto_18311 ?auto_18321 ) ) ( not ( = ?auto_18311 ?auto_18323 ) ) ( not ( = ?auto_18311 ?auto_18326 ) ) ( not ( = ?auto_18291 ?auto_18297 ) ) ( not ( = ?auto_18291 ?auto_18329 ) ) ( not ( = ?auto_18292 ?auto_18297 ) ) ( not ( = ?auto_18292 ?auto_18329 ) ) ( not ( = ?auto_18293 ?auto_18297 ) ) ( not ( = ?auto_18293 ?auto_18329 ) ) ( not ( = ?auto_18294 ?auto_18297 ) ) ( not ( = ?auto_18294 ?auto_18329 ) ) ( not ( = ?auto_18295 ?auto_18297 ) ) ( not ( = ?auto_18295 ?auto_18329 ) ) ( not ( = ?auto_18297 ?auto_18311 ) ) ( not ( = ?auto_18297 ?auto_18320 ) ) ( not ( = ?auto_18297 ?auto_18321 ) ) ( not ( = ?auto_18297 ?auto_18323 ) ) ( not ( = ?auto_18297 ?auto_18326 ) ) ( not ( = ?auto_18330 ?auto_18319 ) ) ( not ( = ?auto_18330 ?auto_18303 ) ) ( not ( = ?auto_18330 ?auto_18313 ) ) ( not ( = ?auto_18330 ?auto_18315 ) ) ( not ( = ?auto_18330 ?auto_18324 ) ) ( not ( = ?auto_18314 ?auto_18316 ) ) ( not ( = ?auto_18314 ?auto_18304 ) ) ( not ( = ?auto_18314 ?auto_18322 ) ) ( not ( = ?auto_18314 ?auto_18308 ) ) ( not ( = ?auto_18314 ?auto_18327 ) ) ( not ( = ?auto_18329 ?auto_18311 ) ) ( not ( = ?auto_18329 ?auto_18320 ) ) ( not ( = ?auto_18329 ?auto_18321 ) ) ( not ( = ?auto_18329 ?auto_18323 ) ) ( not ( = ?auto_18329 ?auto_18326 ) ) ( not ( = ?auto_18291 ?auto_18298 ) ) ( not ( = ?auto_18291 ?auto_18325 ) ) ( not ( = ?auto_18292 ?auto_18298 ) ) ( not ( = ?auto_18292 ?auto_18325 ) ) ( not ( = ?auto_18293 ?auto_18298 ) ) ( not ( = ?auto_18293 ?auto_18325 ) ) ( not ( = ?auto_18294 ?auto_18298 ) ) ( not ( = ?auto_18294 ?auto_18325 ) ) ( not ( = ?auto_18295 ?auto_18298 ) ) ( not ( = ?auto_18295 ?auto_18325 ) ) ( not ( = ?auto_18296 ?auto_18298 ) ) ( not ( = ?auto_18296 ?auto_18325 ) ) ( not ( = ?auto_18298 ?auto_18329 ) ) ( not ( = ?auto_18298 ?auto_18311 ) ) ( not ( = ?auto_18298 ?auto_18320 ) ) ( not ( = ?auto_18298 ?auto_18321 ) ) ( not ( = ?auto_18298 ?auto_18323 ) ) ( not ( = ?auto_18298 ?auto_18326 ) ) ( not ( = ?auto_18325 ?auto_18329 ) ) ( not ( = ?auto_18325 ?auto_18311 ) ) ( not ( = ?auto_18325 ?auto_18320 ) ) ( not ( = ?auto_18325 ?auto_18321 ) ) ( not ( = ?auto_18325 ?auto_18323 ) ) ( not ( = ?auto_18325 ?auto_18326 ) ) ( not ( = ?auto_18291 ?auto_18299 ) ) ( not ( = ?auto_18291 ?auto_18310 ) ) ( not ( = ?auto_18292 ?auto_18299 ) ) ( not ( = ?auto_18292 ?auto_18310 ) ) ( not ( = ?auto_18293 ?auto_18299 ) ) ( not ( = ?auto_18293 ?auto_18310 ) ) ( not ( = ?auto_18294 ?auto_18299 ) ) ( not ( = ?auto_18294 ?auto_18310 ) ) ( not ( = ?auto_18295 ?auto_18299 ) ) ( not ( = ?auto_18295 ?auto_18310 ) ) ( not ( = ?auto_18296 ?auto_18299 ) ) ( not ( = ?auto_18296 ?auto_18310 ) ) ( not ( = ?auto_18297 ?auto_18299 ) ) ( not ( = ?auto_18297 ?auto_18310 ) ) ( not ( = ?auto_18299 ?auto_18325 ) ) ( not ( = ?auto_18299 ?auto_18329 ) ) ( not ( = ?auto_18299 ?auto_18311 ) ) ( not ( = ?auto_18299 ?auto_18320 ) ) ( not ( = ?auto_18299 ?auto_18321 ) ) ( not ( = ?auto_18299 ?auto_18323 ) ) ( not ( = ?auto_18299 ?auto_18326 ) ) ( not ( = ?auto_18312 ?auto_18303 ) ) ( not ( = ?auto_18312 ?auto_18330 ) ) ( not ( = ?auto_18312 ?auto_18319 ) ) ( not ( = ?auto_18312 ?auto_18313 ) ) ( not ( = ?auto_18312 ?auto_18315 ) ) ( not ( = ?auto_18312 ?auto_18324 ) ) ( not ( = ?auto_18309 ?auto_18304 ) ) ( not ( = ?auto_18309 ?auto_18314 ) ) ( not ( = ?auto_18309 ?auto_18316 ) ) ( not ( = ?auto_18309 ?auto_18322 ) ) ( not ( = ?auto_18309 ?auto_18308 ) ) ( not ( = ?auto_18309 ?auto_18327 ) ) ( not ( = ?auto_18310 ?auto_18325 ) ) ( not ( = ?auto_18310 ?auto_18329 ) ) ( not ( = ?auto_18310 ?auto_18311 ) ) ( not ( = ?auto_18310 ?auto_18320 ) ) ( not ( = ?auto_18310 ?auto_18321 ) ) ( not ( = ?auto_18310 ?auto_18323 ) ) ( not ( = ?auto_18310 ?auto_18326 ) ) ( not ( = ?auto_18291 ?auto_18300 ) ) ( not ( = ?auto_18291 ?auto_18317 ) ) ( not ( = ?auto_18292 ?auto_18300 ) ) ( not ( = ?auto_18292 ?auto_18317 ) ) ( not ( = ?auto_18293 ?auto_18300 ) ) ( not ( = ?auto_18293 ?auto_18317 ) ) ( not ( = ?auto_18294 ?auto_18300 ) ) ( not ( = ?auto_18294 ?auto_18317 ) ) ( not ( = ?auto_18295 ?auto_18300 ) ) ( not ( = ?auto_18295 ?auto_18317 ) ) ( not ( = ?auto_18296 ?auto_18300 ) ) ( not ( = ?auto_18296 ?auto_18317 ) ) ( not ( = ?auto_18297 ?auto_18300 ) ) ( not ( = ?auto_18297 ?auto_18317 ) ) ( not ( = ?auto_18298 ?auto_18300 ) ) ( not ( = ?auto_18298 ?auto_18317 ) ) ( not ( = ?auto_18300 ?auto_18310 ) ) ( not ( = ?auto_18300 ?auto_18325 ) ) ( not ( = ?auto_18300 ?auto_18329 ) ) ( not ( = ?auto_18300 ?auto_18311 ) ) ( not ( = ?auto_18300 ?auto_18320 ) ) ( not ( = ?auto_18300 ?auto_18321 ) ) ( not ( = ?auto_18300 ?auto_18323 ) ) ( not ( = ?auto_18300 ?auto_18326 ) ) ( not ( = ?auto_18318 ?auto_18312 ) ) ( not ( = ?auto_18318 ?auto_18303 ) ) ( not ( = ?auto_18318 ?auto_18330 ) ) ( not ( = ?auto_18318 ?auto_18319 ) ) ( not ( = ?auto_18318 ?auto_18313 ) ) ( not ( = ?auto_18318 ?auto_18315 ) ) ( not ( = ?auto_18318 ?auto_18324 ) ) ( not ( = ?auto_18328 ?auto_18309 ) ) ( not ( = ?auto_18328 ?auto_18304 ) ) ( not ( = ?auto_18328 ?auto_18314 ) ) ( not ( = ?auto_18328 ?auto_18316 ) ) ( not ( = ?auto_18328 ?auto_18322 ) ) ( not ( = ?auto_18328 ?auto_18308 ) ) ( not ( = ?auto_18328 ?auto_18327 ) ) ( not ( = ?auto_18317 ?auto_18310 ) ) ( not ( = ?auto_18317 ?auto_18325 ) ) ( not ( = ?auto_18317 ?auto_18329 ) ) ( not ( = ?auto_18317 ?auto_18311 ) ) ( not ( = ?auto_18317 ?auto_18320 ) ) ( not ( = ?auto_18317 ?auto_18321 ) ) ( not ( = ?auto_18317 ?auto_18323 ) ) ( not ( = ?auto_18317 ?auto_18326 ) ) ( not ( = ?auto_18291 ?auto_18301 ) ) ( not ( = ?auto_18291 ?auto_18307 ) ) ( not ( = ?auto_18292 ?auto_18301 ) ) ( not ( = ?auto_18292 ?auto_18307 ) ) ( not ( = ?auto_18293 ?auto_18301 ) ) ( not ( = ?auto_18293 ?auto_18307 ) ) ( not ( = ?auto_18294 ?auto_18301 ) ) ( not ( = ?auto_18294 ?auto_18307 ) ) ( not ( = ?auto_18295 ?auto_18301 ) ) ( not ( = ?auto_18295 ?auto_18307 ) ) ( not ( = ?auto_18296 ?auto_18301 ) ) ( not ( = ?auto_18296 ?auto_18307 ) ) ( not ( = ?auto_18297 ?auto_18301 ) ) ( not ( = ?auto_18297 ?auto_18307 ) ) ( not ( = ?auto_18298 ?auto_18301 ) ) ( not ( = ?auto_18298 ?auto_18307 ) ) ( not ( = ?auto_18299 ?auto_18301 ) ) ( not ( = ?auto_18299 ?auto_18307 ) ) ( not ( = ?auto_18301 ?auto_18317 ) ) ( not ( = ?auto_18301 ?auto_18310 ) ) ( not ( = ?auto_18301 ?auto_18325 ) ) ( not ( = ?auto_18301 ?auto_18329 ) ) ( not ( = ?auto_18301 ?auto_18311 ) ) ( not ( = ?auto_18301 ?auto_18320 ) ) ( not ( = ?auto_18301 ?auto_18321 ) ) ( not ( = ?auto_18301 ?auto_18323 ) ) ( not ( = ?auto_18301 ?auto_18326 ) ) ( not ( = ?auto_18307 ?auto_18317 ) ) ( not ( = ?auto_18307 ?auto_18310 ) ) ( not ( = ?auto_18307 ?auto_18325 ) ) ( not ( = ?auto_18307 ?auto_18329 ) ) ( not ( = ?auto_18307 ?auto_18311 ) ) ( not ( = ?auto_18307 ?auto_18320 ) ) ( not ( = ?auto_18307 ?auto_18321 ) ) ( not ( = ?auto_18307 ?auto_18323 ) ) ( not ( = ?auto_18307 ?auto_18326 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_18291 ?auto_18292 ?auto_18293 ?auto_18294 ?auto_18295 ?auto_18296 ?auto_18297 ?auto_18298 ?auto_18299 ?auto_18300 )
      ( MAKE-1CRATE ?auto_18300 ?auto_18301 )
      ( MAKE-10CRATE-VERIFY ?auto_18291 ?auto_18292 ?auto_18293 ?auto_18294 ?auto_18295 ?auto_18296 ?auto_18297 ?auto_18298 ?auto_18299 ?auto_18300 ?auto_18301 ) )
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
      ?auto_18360 - SURFACE
      ?auto_18361 - SURFACE
      ?auto_18362 - SURFACE
      ?auto_18363 - SURFACE
      ?auto_18364 - SURFACE
    )
    :vars
    (
      ?auto_18369 - HOIST
      ?auto_18365 - PLACE
      ?auto_18370 - PLACE
      ?auto_18367 - HOIST
      ?auto_18366 - SURFACE
      ?auto_18386 - PLACE
      ?auto_18377 - HOIST
      ?auto_18393 - SURFACE
      ?auto_18373 - SURFACE
      ?auto_18382 - PLACE
      ?auto_18384 - HOIST
      ?auto_18394 - SURFACE
      ?auto_18390 - SURFACE
      ?auto_18371 - PLACE
      ?auto_18385 - HOIST
      ?auto_18375 - SURFACE
      ?auto_18388 - PLACE
      ?auto_18376 - HOIST
      ?auto_18381 - SURFACE
      ?auto_18374 - SURFACE
      ?auto_18380 - PLACE
      ?auto_18379 - HOIST
      ?auto_18372 - SURFACE
      ?auto_18391 - PLACE
      ?auto_18378 - HOIST
      ?auto_18383 - SURFACE
      ?auto_18387 - PLACE
      ?auto_18392 - HOIST
      ?auto_18389 - SURFACE
      ?auto_18368 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18369 ?auto_18365 ) ( IS-CRATE ?auto_18364 ) ( not ( = ?auto_18370 ?auto_18365 ) ) ( HOIST-AT ?auto_18367 ?auto_18370 ) ( SURFACE-AT ?auto_18364 ?auto_18370 ) ( ON ?auto_18364 ?auto_18366 ) ( CLEAR ?auto_18364 ) ( not ( = ?auto_18363 ?auto_18364 ) ) ( not ( = ?auto_18363 ?auto_18366 ) ) ( not ( = ?auto_18364 ?auto_18366 ) ) ( not ( = ?auto_18369 ?auto_18367 ) ) ( IS-CRATE ?auto_18363 ) ( not ( = ?auto_18386 ?auto_18365 ) ) ( HOIST-AT ?auto_18377 ?auto_18386 ) ( SURFACE-AT ?auto_18363 ?auto_18386 ) ( ON ?auto_18363 ?auto_18393 ) ( CLEAR ?auto_18363 ) ( not ( = ?auto_18362 ?auto_18363 ) ) ( not ( = ?auto_18362 ?auto_18393 ) ) ( not ( = ?auto_18363 ?auto_18393 ) ) ( not ( = ?auto_18369 ?auto_18377 ) ) ( IS-CRATE ?auto_18362 ) ( AVAILABLE ?auto_18367 ) ( SURFACE-AT ?auto_18362 ?auto_18370 ) ( ON ?auto_18362 ?auto_18373 ) ( CLEAR ?auto_18362 ) ( not ( = ?auto_18361 ?auto_18362 ) ) ( not ( = ?auto_18361 ?auto_18373 ) ) ( not ( = ?auto_18362 ?auto_18373 ) ) ( IS-CRATE ?auto_18361 ) ( not ( = ?auto_18382 ?auto_18365 ) ) ( HOIST-AT ?auto_18384 ?auto_18382 ) ( AVAILABLE ?auto_18384 ) ( SURFACE-AT ?auto_18361 ?auto_18382 ) ( ON ?auto_18361 ?auto_18394 ) ( CLEAR ?auto_18361 ) ( not ( = ?auto_18360 ?auto_18361 ) ) ( not ( = ?auto_18360 ?auto_18394 ) ) ( not ( = ?auto_18361 ?auto_18394 ) ) ( not ( = ?auto_18369 ?auto_18384 ) ) ( IS-CRATE ?auto_18360 ) ( SURFACE-AT ?auto_18360 ?auto_18386 ) ( ON ?auto_18360 ?auto_18390 ) ( CLEAR ?auto_18360 ) ( not ( = ?auto_18359 ?auto_18360 ) ) ( not ( = ?auto_18359 ?auto_18390 ) ) ( not ( = ?auto_18360 ?auto_18390 ) ) ( IS-CRATE ?auto_18359 ) ( not ( = ?auto_18371 ?auto_18365 ) ) ( HOIST-AT ?auto_18385 ?auto_18371 ) ( AVAILABLE ?auto_18385 ) ( SURFACE-AT ?auto_18359 ?auto_18371 ) ( ON ?auto_18359 ?auto_18375 ) ( CLEAR ?auto_18359 ) ( not ( = ?auto_18358 ?auto_18359 ) ) ( not ( = ?auto_18358 ?auto_18375 ) ) ( not ( = ?auto_18359 ?auto_18375 ) ) ( not ( = ?auto_18369 ?auto_18385 ) ) ( IS-CRATE ?auto_18358 ) ( not ( = ?auto_18388 ?auto_18365 ) ) ( HOIST-AT ?auto_18376 ?auto_18388 ) ( AVAILABLE ?auto_18376 ) ( SURFACE-AT ?auto_18358 ?auto_18388 ) ( ON ?auto_18358 ?auto_18381 ) ( CLEAR ?auto_18358 ) ( not ( = ?auto_18357 ?auto_18358 ) ) ( not ( = ?auto_18357 ?auto_18381 ) ) ( not ( = ?auto_18358 ?auto_18381 ) ) ( not ( = ?auto_18369 ?auto_18376 ) ) ( IS-CRATE ?auto_18357 ) ( AVAILABLE ?auto_18377 ) ( SURFACE-AT ?auto_18357 ?auto_18386 ) ( ON ?auto_18357 ?auto_18374 ) ( CLEAR ?auto_18357 ) ( not ( = ?auto_18356 ?auto_18357 ) ) ( not ( = ?auto_18356 ?auto_18374 ) ) ( not ( = ?auto_18357 ?auto_18374 ) ) ( IS-CRATE ?auto_18356 ) ( not ( = ?auto_18380 ?auto_18365 ) ) ( HOIST-AT ?auto_18379 ?auto_18380 ) ( AVAILABLE ?auto_18379 ) ( SURFACE-AT ?auto_18356 ?auto_18380 ) ( ON ?auto_18356 ?auto_18372 ) ( CLEAR ?auto_18356 ) ( not ( = ?auto_18355 ?auto_18356 ) ) ( not ( = ?auto_18355 ?auto_18372 ) ) ( not ( = ?auto_18356 ?auto_18372 ) ) ( not ( = ?auto_18369 ?auto_18379 ) ) ( IS-CRATE ?auto_18355 ) ( not ( = ?auto_18391 ?auto_18365 ) ) ( HOIST-AT ?auto_18378 ?auto_18391 ) ( AVAILABLE ?auto_18378 ) ( SURFACE-AT ?auto_18355 ?auto_18391 ) ( ON ?auto_18355 ?auto_18383 ) ( CLEAR ?auto_18355 ) ( not ( = ?auto_18354 ?auto_18355 ) ) ( not ( = ?auto_18354 ?auto_18383 ) ) ( not ( = ?auto_18355 ?auto_18383 ) ) ( not ( = ?auto_18369 ?auto_18378 ) ) ( SURFACE-AT ?auto_18353 ?auto_18365 ) ( CLEAR ?auto_18353 ) ( IS-CRATE ?auto_18354 ) ( AVAILABLE ?auto_18369 ) ( not ( = ?auto_18387 ?auto_18365 ) ) ( HOIST-AT ?auto_18392 ?auto_18387 ) ( AVAILABLE ?auto_18392 ) ( SURFACE-AT ?auto_18354 ?auto_18387 ) ( ON ?auto_18354 ?auto_18389 ) ( CLEAR ?auto_18354 ) ( TRUCK-AT ?auto_18368 ?auto_18365 ) ( not ( = ?auto_18353 ?auto_18354 ) ) ( not ( = ?auto_18353 ?auto_18389 ) ) ( not ( = ?auto_18354 ?auto_18389 ) ) ( not ( = ?auto_18369 ?auto_18392 ) ) ( not ( = ?auto_18353 ?auto_18355 ) ) ( not ( = ?auto_18353 ?auto_18383 ) ) ( not ( = ?auto_18355 ?auto_18389 ) ) ( not ( = ?auto_18391 ?auto_18387 ) ) ( not ( = ?auto_18378 ?auto_18392 ) ) ( not ( = ?auto_18383 ?auto_18389 ) ) ( not ( = ?auto_18353 ?auto_18356 ) ) ( not ( = ?auto_18353 ?auto_18372 ) ) ( not ( = ?auto_18354 ?auto_18356 ) ) ( not ( = ?auto_18354 ?auto_18372 ) ) ( not ( = ?auto_18356 ?auto_18383 ) ) ( not ( = ?auto_18356 ?auto_18389 ) ) ( not ( = ?auto_18380 ?auto_18391 ) ) ( not ( = ?auto_18380 ?auto_18387 ) ) ( not ( = ?auto_18379 ?auto_18378 ) ) ( not ( = ?auto_18379 ?auto_18392 ) ) ( not ( = ?auto_18372 ?auto_18383 ) ) ( not ( = ?auto_18372 ?auto_18389 ) ) ( not ( = ?auto_18353 ?auto_18357 ) ) ( not ( = ?auto_18353 ?auto_18374 ) ) ( not ( = ?auto_18354 ?auto_18357 ) ) ( not ( = ?auto_18354 ?auto_18374 ) ) ( not ( = ?auto_18355 ?auto_18357 ) ) ( not ( = ?auto_18355 ?auto_18374 ) ) ( not ( = ?auto_18357 ?auto_18372 ) ) ( not ( = ?auto_18357 ?auto_18383 ) ) ( not ( = ?auto_18357 ?auto_18389 ) ) ( not ( = ?auto_18386 ?auto_18380 ) ) ( not ( = ?auto_18386 ?auto_18391 ) ) ( not ( = ?auto_18386 ?auto_18387 ) ) ( not ( = ?auto_18377 ?auto_18379 ) ) ( not ( = ?auto_18377 ?auto_18378 ) ) ( not ( = ?auto_18377 ?auto_18392 ) ) ( not ( = ?auto_18374 ?auto_18372 ) ) ( not ( = ?auto_18374 ?auto_18383 ) ) ( not ( = ?auto_18374 ?auto_18389 ) ) ( not ( = ?auto_18353 ?auto_18358 ) ) ( not ( = ?auto_18353 ?auto_18381 ) ) ( not ( = ?auto_18354 ?auto_18358 ) ) ( not ( = ?auto_18354 ?auto_18381 ) ) ( not ( = ?auto_18355 ?auto_18358 ) ) ( not ( = ?auto_18355 ?auto_18381 ) ) ( not ( = ?auto_18356 ?auto_18358 ) ) ( not ( = ?auto_18356 ?auto_18381 ) ) ( not ( = ?auto_18358 ?auto_18374 ) ) ( not ( = ?auto_18358 ?auto_18372 ) ) ( not ( = ?auto_18358 ?auto_18383 ) ) ( not ( = ?auto_18358 ?auto_18389 ) ) ( not ( = ?auto_18388 ?auto_18386 ) ) ( not ( = ?auto_18388 ?auto_18380 ) ) ( not ( = ?auto_18388 ?auto_18391 ) ) ( not ( = ?auto_18388 ?auto_18387 ) ) ( not ( = ?auto_18376 ?auto_18377 ) ) ( not ( = ?auto_18376 ?auto_18379 ) ) ( not ( = ?auto_18376 ?auto_18378 ) ) ( not ( = ?auto_18376 ?auto_18392 ) ) ( not ( = ?auto_18381 ?auto_18374 ) ) ( not ( = ?auto_18381 ?auto_18372 ) ) ( not ( = ?auto_18381 ?auto_18383 ) ) ( not ( = ?auto_18381 ?auto_18389 ) ) ( not ( = ?auto_18353 ?auto_18359 ) ) ( not ( = ?auto_18353 ?auto_18375 ) ) ( not ( = ?auto_18354 ?auto_18359 ) ) ( not ( = ?auto_18354 ?auto_18375 ) ) ( not ( = ?auto_18355 ?auto_18359 ) ) ( not ( = ?auto_18355 ?auto_18375 ) ) ( not ( = ?auto_18356 ?auto_18359 ) ) ( not ( = ?auto_18356 ?auto_18375 ) ) ( not ( = ?auto_18357 ?auto_18359 ) ) ( not ( = ?auto_18357 ?auto_18375 ) ) ( not ( = ?auto_18359 ?auto_18381 ) ) ( not ( = ?auto_18359 ?auto_18374 ) ) ( not ( = ?auto_18359 ?auto_18372 ) ) ( not ( = ?auto_18359 ?auto_18383 ) ) ( not ( = ?auto_18359 ?auto_18389 ) ) ( not ( = ?auto_18371 ?auto_18388 ) ) ( not ( = ?auto_18371 ?auto_18386 ) ) ( not ( = ?auto_18371 ?auto_18380 ) ) ( not ( = ?auto_18371 ?auto_18391 ) ) ( not ( = ?auto_18371 ?auto_18387 ) ) ( not ( = ?auto_18385 ?auto_18376 ) ) ( not ( = ?auto_18385 ?auto_18377 ) ) ( not ( = ?auto_18385 ?auto_18379 ) ) ( not ( = ?auto_18385 ?auto_18378 ) ) ( not ( = ?auto_18385 ?auto_18392 ) ) ( not ( = ?auto_18375 ?auto_18381 ) ) ( not ( = ?auto_18375 ?auto_18374 ) ) ( not ( = ?auto_18375 ?auto_18372 ) ) ( not ( = ?auto_18375 ?auto_18383 ) ) ( not ( = ?auto_18375 ?auto_18389 ) ) ( not ( = ?auto_18353 ?auto_18360 ) ) ( not ( = ?auto_18353 ?auto_18390 ) ) ( not ( = ?auto_18354 ?auto_18360 ) ) ( not ( = ?auto_18354 ?auto_18390 ) ) ( not ( = ?auto_18355 ?auto_18360 ) ) ( not ( = ?auto_18355 ?auto_18390 ) ) ( not ( = ?auto_18356 ?auto_18360 ) ) ( not ( = ?auto_18356 ?auto_18390 ) ) ( not ( = ?auto_18357 ?auto_18360 ) ) ( not ( = ?auto_18357 ?auto_18390 ) ) ( not ( = ?auto_18358 ?auto_18360 ) ) ( not ( = ?auto_18358 ?auto_18390 ) ) ( not ( = ?auto_18360 ?auto_18375 ) ) ( not ( = ?auto_18360 ?auto_18381 ) ) ( not ( = ?auto_18360 ?auto_18374 ) ) ( not ( = ?auto_18360 ?auto_18372 ) ) ( not ( = ?auto_18360 ?auto_18383 ) ) ( not ( = ?auto_18360 ?auto_18389 ) ) ( not ( = ?auto_18390 ?auto_18375 ) ) ( not ( = ?auto_18390 ?auto_18381 ) ) ( not ( = ?auto_18390 ?auto_18374 ) ) ( not ( = ?auto_18390 ?auto_18372 ) ) ( not ( = ?auto_18390 ?auto_18383 ) ) ( not ( = ?auto_18390 ?auto_18389 ) ) ( not ( = ?auto_18353 ?auto_18361 ) ) ( not ( = ?auto_18353 ?auto_18394 ) ) ( not ( = ?auto_18354 ?auto_18361 ) ) ( not ( = ?auto_18354 ?auto_18394 ) ) ( not ( = ?auto_18355 ?auto_18361 ) ) ( not ( = ?auto_18355 ?auto_18394 ) ) ( not ( = ?auto_18356 ?auto_18361 ) ) ( not ( = ?auto_18356 ?auto_18394 ) ) ( not ( = ?auto_18357 ?auto_18361 ) ) ( not ( = ?auto_18357 ?auto_18394 ) ) ( not ( = ?auto_18358 ?auto_18361 ) ) ( not ( = ?auto_18358 ?auto_18394 ) ) ( not ( = ?auto_18359 ?auto_18361 ) ) ( not ( = ?auto_18359 ?auto_18394 ) ) ( not ( = ?auto_18361 ?auto_18390 ) ) ( not ( = ?auto_18361 ?auto_18375 ) ) ( not ( = ?auto_18361 ?auto_18381 ) ) ( not ( = ?auto_18361 ?auto_18374 ) ) ( not ( = ?auto_18361 ?auto_18372 ) ) ( not ( = ?auto_18361 ?auto_18383 ) ) ( not ( = ?auto_18361 ?auto_18389 ) ) ( not ( = ?auto_18382 ?auto_18386 ) ) ( not ( = ?auto_18382 ?auto_18371 ) ) ( not ( = ?auto_18382 ?auto_18388 ) ) ( not ( = ?auto_18382 ?auto_18380 ) ) ( not ( = ?auto_18382 ?auto_18391 ) ) ( not ( = ?auto_18382 ?auto_18387 ) ) ( not ( = ?auto_18384 ?auto_18377 ) ) ( not ( = ?auto_18384 ?auto_18385 ) ) ( not ( = ?auto_18384 ?auto_18376 ) ) ( not ( = ?auto_18384 ?auto_18379 ) ) ( not ( = ?auto_18384 ?auto_18378 ) ) ( not ( = ?auto_18384 ?auto_18392 ) ) ( not ( = ?auto_18394 ?auto_18390 ) ) ( not ( = ?auto_18394 ?auto_18375 ) ) ( not ( = ?auto_18394 ?auto_18381 ) ) ( not ( = ?auto_18394 ?auto_18374 ) ) ( not ( = ?auto_18394 ?auto_18372 ) ) ( not ( = ?auto_18394 ?auto_18383 ) ) ( not ( = ?auto_18394 ?auto_18389 ) ) ( not ( = ?auto_18353 ?auto_18362 ) ) ( not ( = ?auto_18353 ?auto_18373 ) ) ( not ( = ?auto_18354 ?auto_18362 ) ) ( not ( = ?auto_18354 ?auto_18373 ) ) ( not ( = ?auto_18355 ?auto_18362 ) ) ( not ( = ?auto_18355 ?auto_18373 ) ) ( not ( = ?auto_18356 ?auto_18362 ) ) ( not ( = ?auto_18356 ?auto_18373 ) ) ( not ( = ?auto_18357 ?auto_18362 ) ) ( not ( = ?auto_18357 ?auto_18373 ) ) ( not ( = ?auto_18358 ?auto_18362 ) ) ( not ( = ?auto_18358 ?auto_18373 ) ) ( not ( = ?auto_18359 ?auto_18362 ) ) ( not ( = ?auto_18359 ?auto_18373 ) ) ( not ( = ?auto_18360 ?auto_18362 ) ) ( not ( = ?auto_18360 ?auto_18373 ) ) ( not ( = ?auto_18362 ?auto_18394 ) ) ( not ( = ?auto_18362 ?auto_18390 ) ) ( not ( = ?auto_18362 ?auto_18375 ) ) ( not ( = ?auto_18362 ?auto_18381 ) ) ( not ( = ?auto_18362 ?auto_18374 ) ) ( not ( = ?auto_18362 ?auto_18372 ) ) ( not ( = ?auto_18362 ?auto_18383 ) ) ( not ( = ?auto_18362 ?auto_18389 ) ) ( not ( = ?auto_18370 ?auto_18382 ) ) ( not ( = ?auto_18370 ?auto_18386 ) ) ( not ( = ?auto_18370 ?auto_18371 ) ) ( not ( = ?auto_18370 ?auto_18388 ) ) ( not ( = ?auto_18370 ?auto_18380 ) ) ( not ( = ?auto_18370 ?auto_18391 ) ) ( not ( = ?auto_18370 ?auto_18387 ) ) ( not ( = ?auto_18367 ?auto_18384 ) ) ( not ( = ?auto_18367 ?auto_18377 ) ) ( not ( = ?auto_18367 ?auto_18385 ) ) ( not ( = ?auto_18367 ?auto_18376 ) ) ( not ( = ?auto_18367 ?auto_18379 ) ) ( not ( = ?auto_18367 ?auto_18378 ) ) ( not ( = ?auto_18367 ?auto_18392 ) ) ( not ( = ?auto_18373 ?auto_18394 ) ) ( not ( = ?auto_18373 ?auto_18390 ) ) ( not ( = ?auto_18373 ?auto_18375 ) ) ( not ( = ?auto_18373 ?auto_18381 ) ) ( not ( = ?auto_18373 ?auto_18374 ) ) ( not ( = ?auto_18373 ?auto_18372 ) ) ( not ( = ?auto_18373 ?auto_18383 ) ) ( not ( = ?auto_18373 ?auto_18389 ) ) ( not ( = ?auto_18353 ?auto_18363 ) ) ( not ( = ?auto_18353 ?auto_18393 ) ) ( not ( = ?auto_18354 ?auto_18363 ) ) ( not ( = ?auto_18354 ?auto_18393 ) ) ( not ( = ?auto_18355 ?auto_18363 ) ) ( not ( = ?auto_18355 ?auto_18393 ) ) ( not ( = ?auto_18356 ?auto_18363 ) ) ( not ( = ?auto_18356 ?auto_18393 ) ) ( not ( = ?auto_18357 ?auto_18363 ) ) ( not ( = ?auto_18357 ?auto_18393 ) ) ( not ( = ?auto_18358 ?auto_18363 ) ) ( not ( = ?auto_18358 ?auto_18393 ) ) ( not ( = ?auto_18359 ?auto_18363 ) ) ( not ( = ?auto_18359 ?auto_18393 ) ) ( not ( = ?auto_18360 ?auto_18363 ) ) ( not ( = ?auto_18360 ?auto_18393 ) ) ( not ( = ?auto_18361 ?auto_18363 ) ) ( not ( = ?auto_18361 ?auto_18393 ) ) ( not ( = ?auto_18363 ?auto_18373 ) ) ( not ( = ?auto_18363 ?auto_18394 ) ) ( not ( = ?auto_18363 ?auto_18390 ) ) ( not ( = ?auto_18363 ?auto_18375 ) ) ( not ( = ?auto_18363 ?auto_18381 ) ) ( not ( = ?auto_18363 ?auto_18374 ) ) ( not ( = ?auto_18363 ?auto_18372 ) ) ( not ( = ?auto_18363 ?auto_18383 ) ) ( not ( = ?auto_18363 ?auto_18389 ) ) ( not ( = ?auto_18393 ?auto_18373 ) ) ( not ( = ?auto_18393 ?auto_18394 ) ) ( not ( = ?auto_18393 ?auto_18390 ) ) ( not ( = ?auto_18393 ?auto_18375 ) ) ( not ( = ?auto_18393 ?auto_18381 ) ) ( not ( = ?auto_18393 ?auto_18374 ) ) ( not ( = ?auto_18393 ?auto_18372 ) ) ( not ( = ?auto_18393 ?auto_18383 ) ) ( not ( = ?auto_18393 ?auto_18389 ) ) ( not ( = ?auto_18353 ?auto_18364 ) ) ( not ( = ?auto_18353 ?auto_18366 ) ) ( not ( = ?auto_18354 ?auto_18364 ) ) ( not ( = ?auto_18354 ?auto_18366 ) ) ( not ( = ?auto_18355 ?auto_18364 ) ) ( not ( = ?auto_18355 ?auto_18366 ) ) ( not ( = ?auto_18356 ?auto_18364 ) ) ( not ( = ?auto_18356 ?auto_18366 ) ) ( not ( = ?auto_18357 ?auto_18364 ) ) ( not ( = ?auto_18357 ?auto_18366 ) ) ( not ( = ?auto_18358 ?auto_18364 ) ) ( not ( = ?auto_18358 ?auto_18366 ) ) ( not ( = ?auto_18359 ?auto_18364 ) ) ( not ( = ?auto_18359 ?auto_18366 ) ) ( not ( = ?auto_18360 ?auto_18364 ) ) ( not ( = ?auto_18360 ?auto_18366 ) ) ( not ( = ?auto_18361 ?auto_18364 ) ) ( not ( = ?auto_18361 ?auto_18366 ) ) ( not ( = ?auto_18362 ?auto_18364 ) ) ( not ( = ?auto_18362 ?auto_18366 ) ) ( not ( = ?auto_18364 ?auto_18393 ) ) ( not ( = ?auto_18364 ?auto_18373 ) ) ( not ( = ?auto_18364 ?auto_18394 ) ) ( not ( = ?auto_18364 ?auto_18390 ) ) ( not ( = ?auto_18364 ?auto_18375 ) ) ( not ( = ?auto_18364 ?auto_18381 ) ) ( not ( = ?auto_18364 ?auto_18374 ) ) ( not ( = ?auto_18364 ?auto_18372 ) ) ( not ( = ?auto_18364 ?auto_18383 ) ) ( not ( = ?auto_18364 ?auto_18389 ) ) ( not ( = ?auto_18366 ?auto_18393 ) ) ( not ( = ?auto_18366 ?auto_18373 ) ) ( not ( = ?auto_18366 ?auto_18394 ) ) ( not ( = ?auto_18366 ?auto_18390 ) ) ( not ( = ?auto_18366 ?auto_18375 ) ) ( not ( = ?auto_18366 ?auto_18381 ) ) ( not ( = ?auto_18366 ?auto_18374 ) ) ( not ( = ?auto_18366 ?auto_18372 ) ) ( not ( = ?auto_18366 ?auto_18383 ) ) ( not ( = ?auto_18366 ?auto_18389 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_18353 ?auto_18354 ?auto_18355 ?auto_18356 ?auto_18357 ?auto_18358 ?auto_18359 ?auto_18360 ?auto_18361 ?auto_18362 ?auto_18363 )
      ( MAKE-1CRATE ?auto_18363 ?auto_18364 )
      ( MAKE-11CRATE-VERIFY ?auto_18353 ?auto_18354 ?auto_18355 ?auto_18356 ?auto_18357 ?auto_18358 ?auto_18359 ?auto_18360 ?auto_18361 ?auto_18362 ?auto_18363 ?auto_18364 ) )
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
      ?auto_18425 - SURFACE
      ?auto_18426 - SURFACE
      ?auto_18427 - SURFACE
      ?auto_18428 - SURFACE
      ?auto_18429 - SURFACE
      ?auto_18430 - SURFACE
    )
    :vars
    (
      ?auto_18431 - HOIST
      ?auto_18436 - PLACE
      ?auto_18434 - PLACE
      ?auto_18432 - HOIST
      ?auto_18435 - SURFACE
      ?auto_18452 - PLACE
      ?auto_18443 - HOIST
      ?auto_18455 - SURFACE
      ?auto_18440 - PLACE
      ?auto_18446 - HOIST
      ?auto_18437 - SURFACE
      ?auto_18441 - SURFACE
      ?auto_18462 - PLACE
      ?auto_18449 - HOIST
      ?auto_18454 - SURFACE
      ?auto_18442 - SURFACE
      ?auto_18460 - PLACE
      ?auto_18461 - HOIST
      ?auto_18444 - SURFACE
      ?auto_18458 - PLACE
      ?auto_18451 - HOIST
      ?auto_18463 - SURFACE
      ?auto_18459 - SURFACE
      ?auto_18439 - PLACE
      ?auto_18447 - HOIST
      ?auto_18453 - SURFACE
      ?auto_18438 - PLACE
      ?auto_18457 - HOIST
      ?auto_18456 - SURFACE
      ?auto_18445 - PLACE
      ?auto_18450 - HOIST
      ?auto_18448 - SURFACE
      ?auto_18433 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18431 ?auto_18436 ) ( IS-CRATE ?auto_18430 ) ( not ( = ?auto_18434 ?auto_18436 ) ) ( HOIST-AT ?auto_18432 ?auto_18434 ) ( AVAILABLE ?auto_18432 ) ( SURFACE-AT ?auto_18430 ?auto_18434 ) ( ON ?auto_18430 ?auto_18435 ) ( CLEAR ?auto_18430 ) ( not ( = ?auto_18429 ?auto_18430 ) ) ( not ( = ?auto_18429 ?auto_18435 ) ) ( not ( = ?auto_18430 ?auto_18435 ) ) ( not ( = ?auto_18431 ?auto_18432 ) ) ( IS-CRATE ?auto_18429 ) ( not ( = ?auto_18452 ?auto_18436 ) ) ( HOIST-AT ?auto_18443 ?auto_18452 ) ( SURFACE-AT ?auto_18429 ?auto_18452 ) ( ON ?auto_18429 ?auto_18455 ) ( CLEAR ?auto_18429 ) ( not ( = ?auto_18428 ?auto_18429 ) ) ( not ( = ?auto_18428 ?auto_18455 ) ) ( not ( = ?auto_18429 ?auto_18455 ) ) ( not ( = ?auto_18431 ?auto_18443 ) ) ( IS-CRATE ?auto_18428 ) ( not ( = ?auto_18440 ?auto_18436 ) ) ( HOIST-AT ?auto_18446 ?auto_18440 ) ( SURFACE-AT ?auto_18428 ?auto_18440 ) ( ON ?auto_18428 ?auto_18437 ) ( CLEAR ?auto_18428 ) ( not ( = ?auto_18427 ?auto_18428 ) ) ( not ( = ?auto_18427 ?auto_18437 ) ) ( not ( = ?auto_18428 ?auto_18437 ) ) ( not ( = ?auto_18431 ?auto_18446 ) ) ( IS-CRATE ?auto_18427 ) ( AVAILABLE ?auto_18443 ) ( SURFACE-AT ?auto_18427 ?auto_18452 ) ( ON ?auto_18427 ?auto_18441 ) ( CLEAR ?auto_18427 ) ( not ( = ?auto_18426 ?auto_18427 ) ) ( not ( = ?auto_18426 ?auto_18441 ) ) ( not ( = ?auto_18427 ?auto_18441 ) ) ( IS-CRATE ?auto_18426 ) ( not ( = ?auto_18462 ?auto_18436 ) ) ( HOIST-AT ?auto_18449 ?auto_18462 ) ( AVAILABLE ?auto_18449 ) ( SURFACE-AT ?auto_18426 ?auto_18462 ) ( ON ?auto_18426 ?auto_18454 ) ( CLEAR ?auto_18426 ) ( not ( = ?auto_18425 ?auto_18426 ) ) ( not ( = ?auto_18425 ?auto_18454 ) ) ( not ( = ?auto_18426 ?auto_18454 ) ) ( not ( = ?auto_18431 ?auto_18449 ) ) ( IS-CRATE ?auto_18425 ) ( SURFACE-AT ?auto_18425 ?auto_18440 ) ( ON ?auto_18425 ?auto_18442 ) ( CLEAR ?auto_18425 ) ( not ( = ?auto_18424 ?auto_18425 ) ) ( not ( = ?auto_18424 ?auto_18442 ) ) ( not ( = ?auto_18425 ?auto_18442 ) ) ( IS-CRATE ?auto_18424 ) ( not ( = ?auto_18460 ?auto_18436 ) ) ( HOIST-AT ?auto_18461 ?auto_18460 ) ( AVAILABLE ?auto_18461 ) ( SURFACE-AT ?auto_18424 ?auto_18460 ) ( ON ?auto_18424 ?auto_18444 ) ( CLEAR ?auto_18424 ) ( not ( = ?auto_18423 ?auto_18424 ) ) ( not ( = ?auto_18423 ?auto_18444 ) ) ( not ( = ?auto_18424 ?auto_18444 ) ) ( not ( = ?auto_18431 ?auto_18461 ) ) ( IS-CRATE ?auto_18423 ) ( not ( = ?auto_18458 ?auto_18436 ) ) ( HOIST-AT ?auto_18451 ?auto_18458 ) ( AVAILABLE ?auto_18451 ) ( SURFACE-AT ?auto_18423 ?auto_18458 ) ( ON ?auto_18423 ?auto_18463 ) ( CLEAR ?auto_18423 ) ( not ( = ?auto_18422 ?auto_18423 ) ) ( not ( = ?auto_18422 ?auto_18463 ) ) ( not ( = ?auto_18423 ?auto_18463 ) ) ( not ( = ?auto_18431 ?auto_18451 ) ) ( IS-CRATE ?auto_18422 ) ( AVAILABLE ?auto_18446 ) ( SURFACE-AT ?auto_18422 ?auto_18440 ) ( ON ?auto_18422 ?auto_18459 ) ( CLEAR ?auto_18422 ) ( not ( = ?auto_18421 ?auto_18422 ) ) ( not ( = ?auto_18421 ?auto_18459 ) ) ( not ( = ?auto_18422 ?auto_18459 ) ) ( IS-CRATE ?auto_18421 ) ( not ( = ?auto_18439 ?auto_18436 ) ) ( HOIST-AT ?auto_18447 ?auto_18439 ) ( AVAILABLE ?auto_18447 ) ( SURFACE-AT ?auto_18421 ?auto_18439 ) ( ON ?auto_18421 ?auto_18453 ) ( CLEAR ?auto_18421 ) ( not ( = ?auto_18420 ?auto_18421 ) ) ( not ( = ?auto_18420 ?auto_18453 ) ) ( not ( = ?auto_18421 ?auto_18453 ) ) ( not ( = ?auto_18431 ?auto_18447 ) ) ( IS-CRATE ?auto_18420 ) ( not ( = ?auto_18438 ?auto_18436 ) ) ( HOIST-AT ?auto_18457 ?auto_18438 ) ( AVAILABLE ?auto_18457 ) ( SURFACE-AT ?auto_18420 ?auto_18438 ) ( ON ?auto_18420 ?auto_18456 ) ( CLEAR ?auto_18420 ) ( not ( = ?auto_18419 ?auto_18420 ) ) ( not ( = ?auto_18419 ?auto_18456 ) ) ( not ( = ?auto_18420 ?auto_18456 ) ) ( not ( = ?auto_18431 ?auto_18457 ) ) ( SURFACE-AT ?auto_18418 ?auto_18436 ) ( CLEAR ?auto_18418 ) ( IS-CRATE ?auto_18419 ) ( AVAILABLE ?auto_18431 ) ( not ( = ?auto_18445 ?auto_18436 ) ) ( HOIST-AT ?auto_18450 ?auto_18445 ) ( AVAILABLE ?auto_18450 ) ( SURFACE-AT ?auto_18419 ?auto_18445 ) ( ON ?auto_18419 ?auto_18448 ) ( CLEAR ?auto_18419 ) ( TRUCK-AT ?auto_18433 ?auto_18436 ) ( not ( = ?auto_18418 ?auto_18419 ) ) ( not ( = ?auto_18418 ?auto_18448 ) ) ( not ( = ?auto_18419 ?auto_18448 ) ) ( not ( = ?auto_18431 ?auto_18450 ) ) ( not ( = ?auto_18418 ?auto_18420 ) ) ( not ( = ?auto_18418 ?auto_18456 ) ) ( not ( = ?auto_18420 ?auto_18448 ) ) ( not ( = ?auto_18438 ?auto_18445 ) ) ( not ( = ?auto_18457 ?auto_18450 ) ) ( not ( = ?auto_18456 ?auto_18448 ) ) ( not ( = ?auto_18418 ?auto_18421 ) ) ( not ( = ?auto_18418 ?auto_18453 ) ) ( not ( = ?auto_18419 ?auto_18421 ) ) ( not ( = ?auto_18419 ?auto_18453 ) ) ( not ( = ?auto_18421 ?auto_18456 ) ) ( not ( = ?auto_18421 ?auto_18448 ) ) ( not ( = ?auto_18439 ?auto_18438 ) ) ( not ( = ?auto_18439 ?auto_18445 ) ) ( not ( = ?auto_18447 ?auto_18457 ) ) ( not ( = ?auto_18447 ?auto_18450 ) ) ( not ( = ?auto_18453 ?auto_18456 ) ) ( not ( = ?auto_18453 ?auto_18448 ) ) ( not ( = ?auto_18418 ?auto_18422 ) ) ( not ( = ?auto_18418 ?auto_18459 ) ) ( not ( = ?auto_18419 ?auto_18422 ) ) ( not ( = ?auto_18419 ?auto_18459 ) ) ( not ( = ?auto_18420 ?auto_18422 ) ) ( not ( = ?auto_18420 ?auto_18459 ) ) ( not ( = ?auto_18422 ?auto_18453 ) ) ( not ( = ?auto_18422 ?auto_18456 ) ) ( not ( = ?auto_18422 ?auto_18448 ) ) ( not ( = ?auto_18440 ?auto_18439 ) ) ( not ( = ?auto_18440 ?auto_18438 ) ) ( not ( = ?auto_18440 ?auto_18445 ) ) ( not ( = ?auto_18446 ?auto_18447 ) ) ( not ( = ?auto_18446 ?auto_18457 ) ) ( not ( = ?auto_18446 ?auto_18450 ) ) ( not ( = ?auto_18459 ?auto_18453 ) ) ( not ( = ?auto_18459 ?auto_18456 ) ) ( not ( = ?auto_18459 ?auto_18448 ) ) ( not ( = ?auto_18418 ?auto_18423 ) ) ( not ( = ?auto_18418 ?auto_18463 ) ) ( not ( = ?auto_18419 ?auto_18423 ) ) ( not ( = ?auto_18419 ?auto_18463 ) ) ( not ( = ?auto_18420 ?auto_18423 ) ) ( not ( = ?auto_18420 ?auto_18463 ) ) ( not ( = ?auto_18421 ?auto_18423 ) ) ( not ( = ?auto_18421 ?auto_18463 ) ) ( not ( = ?auto_18423 ?auto_18459 ) ) ( not ( = ?auto_18423 ?auto_18453 ) ) ( not ( = ?auto_18423 ?auto_18456 ) ) ( not ( = ?auto_18423 ?auto_18448 ) ) ( not ( = ?auto_18458 ?auto_18440 ) ) ( not ( = ?auto_18458 ?auto_18439 ) ) ( not ( = ?auto_18458 ?auto_18438 ) ) ( not ( = ?auto_18458 ?auto_18445 ) ) ( not ( = ?auto_18451 ?auto_18446 ) ) ( not ( = ?auto_18451 ?auto_18447 ) ) ( not ( = ?auto_18451 ?auto_18457 ) ) ( not ( = ?auto_18451 ?auto_18450 ) ) ( not ( = ?auto_18463 ?auto_18459 ) ) ( not ( = ?auto_18463 ?auto_18453 ) ) ( not ( = ?auto_18463 ?auto_18456 ) ) ( not ( = ?auto_18463 ?auto_18448 ) ) ( not ( = ?auto_18418 ?auto_18424 ) ) ( not ( = ?auto_18418 ?auto_18444 ) ) ( not ( = ?auto_18419 ?auto_18424 ) ) ( not ( = ?auto_18419 ?auto_18444 ) ) ( not ( = ?auto_18420 ?auto_18424 ) ) ( not ( = ?auto_18420 ?auto_18444 ) ) ( not ( = ?auto_18421 ?auto_18424 ) ) ( not ( = ?auto_18421 ?auto_18444 ) ) ( not ( = ?auto_18422 ?auto_18424 ) ) ( not ( = ?auto_18422 ?auto_18444 ) ) ( not ( = ?auto_18424 ?auto_18463 ) ) ( not ( = ?auto_18424 ?auto_18459 ) ) ( not ( = ?auto_18424 ?auto_18453 ) ) ( not ( = ?auto_18424 ?auto_18456 ) ) ( not ( = ?auto_18424 ?auto_18448 ) ) ( not ( = ?auto_18460 ?auto_18458 ) ) ( not ( = ?auto_18460 ?auto_18440 ) ) ( not ( = ?auto_18460 ?auto_18439 ) ) ( not ( = ?auto_18460 ?auto_18438 ) ) ( not ( = ?auto_18460 ?auto_18445 ) ) ( not ( = ?auto_18461 ?auto_18451 ) ) ( not ( = ?auto_18461 ?auto_18446 ) ) ( not ( = ?auto_18461 ?auto_18447 ) ) ( not ( = ?auto_18461 ?auto_18457 ) ) ( not ( = ?auto_18461 ?auto_18450 ) ) ( not ( = ?auto_18444 ?auto_18463 ) ) ( not ( = ?auto_18444 ?auto_18459 ) ) ( not ( = ?auto_18444 ?auto_18453 ) ) ( not ( = ?auto_18444 ?auto_18456 ) ) ( not ( = ?auto_18444 ?auto_18448 ) ) ( not ( = ?auto_18418 ?auto_18425 ) ) ( not ( = ?auto_18418 ?auto_18442 ) ) ( not ( = ?auto_18419 ?auto_18425 ) ) ( not ( = ?auto_18419 ?auto_18442 ) ) ( not ( = ?auto_18420 ?auto_18425 ) ) ( not ( = ?auto_18420 ?auto_18442 ) ) ( not ( = ?auto_18421 ?auto_18425 ) ) ( not ( = ?auto_18421 ?auto_18442 ) ) ( not ( = ?auto_18422 ?auto_18425 ) ) ( not ( = ?auto_18422 ?auto_18442 ) ) ( not ( = ?auto_18423 ?auto_18425 ) ) ( not ( = ?auto_18423 ?auto_18442 ) ) ( not ( = ?auto_18425 ?auto_18444 ) ) ( not ( = ?auto_18425 ?auto_18463 ) ) ( not ( = ?auto_18425 ?auto_18459 ) ) ( not ( = ?auto_18425 ?auto_18453 ) ) ( not ( = ?auto_18425 ?auto_18456 ) ) ( not ( = ?auto_18425 ?auto_18448 ) ) ( not ( = ?auto_18442 ?auto_18444 ) ) ( not ( = ?auto_18442 ?auto_18463 ) ) ( not ( = ?auto_18442 ?auto_18459 ) ) ( not ( = ?auto_18442 ?auto_18453 ) ) ( not ( = ?auto_18442 ?auto_18456 ) ) ( not ( = ?auto_18442 ?auto_18448 ) ) ( not ( = ?auto_18418 ?auto_18426 ) ) ( not ( = ?auto_18418 ?auto_18454 ) ) ( not ( = ?auto_18419 ?auto_18426 ) ) ( not ( = ?auto_18419 ?auto_18454 ) ) ( not ( = ?auto_18420 ?auto_18426 ) ) ( not ( = ?auto_18420 ?auto_18454 ) ) ( not ( = ?auto_18421 ?auto_18426 ) ) ( not ( = ?auto_18421 ?auto_18454 ) ) ( not ( = ?auto_18422 ?auto_18426 ) ) ( not ( = ?auto_18422 ?auto_18454 ) ) ( not ( = ?auto_18423 ?auto_18426 ) ) ( not ( = ?auto_18423 ?auto_18454 ) ) ( not ( = ?auto_18424 ?auto_18426 ) ) ( not ( = ?auto_18424 ?auto_18454 ) ) ( not ( = ?auto_18426 ?auto_18442 ) ) ( not ( = ?auto_18426 ?auto_18444 ) ) ( not ( = ?auto_18426 ?auto_18463 ) ) ( not ( = ?auto_18426 ?auto_18459 ) ) ( not ( = ?auto_18426 ?auto_18453 ) ) ( not ( = ?auto_18426 ?auto_18456 ) ) ( not ( = ?auto_18426 ?auto_18448 ) ) ( not ( = ?auto_18462 ?auto_18440 ) ) ( not ( = ?auto_18462 ?auto_18460 ) ) ( not ( = ?auto_18462 ?auto_18458 ) ) ( not ( = ?auto_18462 ?auto_18439 ) ) ( not ( = ?auto_18462 ?auto_18438 ) ) ( not ( = ?auto_18462 ?auto_18445 ) ) ( not ( = ?auto_18449 ?auto_18446 ) ) ( not ( = ?auto_18449 ?auto_18461 ) ) ( not ( = ?auto_18449 ?auto_18451 ) ) ( not ( = ?auto_18449 ?auto_18447 ) ) ( not ( = ?auto_18449 ?auto_18457 ) ) ( not ( = ?auto_18449 ?auto_18450 ) ) ( not ( = ?auto_18454 ?auto_18442 ) ) ( not ( = ?auto_18454 ?auto_18444 ) ) ( not ( = ?auto_18454 ?auto_18463 ) ) ( not ( = ?auto_18454 ?auto_18459 ) ) ( not ( = ?auto_18454 ?auto_18453 ) ) ( not ( = ?auto_18454 ?auto_18456 ) ) ( not ( = ?auto_18454 ?auto_18448 ) ) ( not ( = ?auto_18418 ?auto_18427 ) ) ( not ( = ?auto_18418 ?auto_18441 ) ) ( not ( = ?auto_18419 ?auto_18427 ) ) ( not ( = ?auto_18419 ?auto_18441 ) ) ( not ( = ?auto_18420 ?auto_18427 ) ) ( not ( = ?auto_18420 ?auto_18441 ) ) ( not ( = ?auto_18421 ?auto_18427 ) ) ( not ( = ?auto_18421 ?auto_18441 ) ) ( not ( = ?auto_18422 ?auto_18427 ) ) ( not ( = ?auto_18422 ?auto_18441 ) ) ( not ( = ?auto_18423 ?auto_18427 ) ) ( not ( = ?auto_18423 ?auto_18441 ) ) ( not ( = ?auto_18424 ?auto_18427 ) ) ( not ( = ?auto_18424 ?auto_18441 ) ) ( not ( = ?auto_18425 ?auto_18427 ) ) ( not ( = ?auto_18425 ?auto_18441 ) ) ( not ( = ?auto_18427 ?auto_18454 ) ) ( not ( = ?auto_18427 ?auto_18442 ) ) ( not ( = ?auto_18427 ?auto_18444 ) ) ( not ( = ?auto_18427 ?auto_18463 ) ) ( not ( = ?auto_18427 ?auto_18459 ) ) ( not ( = ?auto_18427 ?auto_18453 ) ) ( not ( = ?auto_18427 ?auto_18456 ) ) ( not ( = ?auto_18427 ?auto_18448 ) ) ( not ( = ?auto_18452 ?auto_18462 ) ) ( not ( = ?auto_18452 ?auto_18440 ) ) ( not ( = ?auto_18452 ?auto_18460 ) ) ( not ( = ?auto_18452 ?auto_18458 ) ) ( not ( = ?auto_18452 ?auto_18439 ) ) ( not ( = ?auto_18452 ?auto_18438 ) ) ( not ( = ?auto_18452 ?auto_18445 ) ) ( not ( = ?auto_18443 ?auto_18449 ) ) ( not ( = ?auto_18443 ?auto_18446 ) ) ( not ( = ?auto_18443 ?auto_18461 ) ) ( not ( = ?auto_18443 ?auto_18451 ) ) ( not ( = ?auto_18443 ?auto_18447 ) ) ( not ( = ?auto_18443 ?auto_18457 ) ) ( not ( = ?auto_18443 ?auto_18450 ) ) ( not ( = ?auto_18441 ?auto_18454 ) ) ( not ( = ?auto_18441 ?auto_18442 ) ) ( not ( = ?auto_18441 ?auto_18444 ) ) ( not ( = ?auto_18441 ?auto_18463 ) ) ( not ( = ?auto_18441 ?auto_18459 ) ) ( not ( = ?auto_18441 ?auto_18453 ) ) ( not ( = ?auto_18441 ?auto_18456 ) ) ( not ( = ?auto_18441 ?auto_18448 ) ) ( not ( = ?auto_18418 ?auto_18428 ) ) ( not ( = ?auto_18418 ?auto_18437 ) ) ( not ( = ?auto_18419 ?auto_18428 ) ) ( not ( = ?auto_18419 ?auto_18437 ) ) ( not ( = ?auto_18420 ?auto_18428 ) ) ( not ( = ?auto_18420 ?auto_18437 ) ) ( not ( = ?auto_18421 ?auto_18428 ) ) ( not ( = ?auto_18421 ?auto_18437 ) ) ( not ( = ?auto_18422 ?auto_18428 ) ) ( not ( = ?auto_18422 ?auto_18437 ) ) ( not ( = ?auto_18423 ?auto_18428 ) ) ( not ( = ?auto_18423 ?auto_18437 ) ) ( not ( = ?auto_18424 ?auto_18428 ) ) ( not ( = ?auto_18424 ?auto_18437 ) ) ( not ( = ?auto_18425 ?auto_18428 ) ) ( not ( = ?auto_18425 ?auto_18437 ) ) ( not ( = ?auto_18426 ?auto_18428 ) ) ( not ( = ?auto_18426 ?auto_18437 ) ) ( not ( = ?auto_18428 ?auto_18441 ) ) ( not ( = ?auto_18428 ?auto_18454 ) ) ( not ( = ?auto_18428 ?auto_18442 ) ) ( not ( = ?auto_18428 ?auto_18444 ) ) ( not ( = ?auto_18428 ?auto_18463 ) ) ( not ( = ?auto_18428 ?auto_18459 ) ) ( not ( = ?auto_18428 ?auto_18453 ) ) ( not ( = ?auto_18428 ?auto_18456 ) ) ( not ( = ?auto_18428 ?auto_18448 ) ) ( not ( = ?auto_18437 ?auto_18441 ) ) ( not ( = ?auto_18437 ?auto_18454 ) ) ( not ( = ?auto_18437 ?auto_18442 ) ) ( not ( = ?auto_18437 ?auto_18444 ) ) ( not ( = ?auto_18437 ?auto_18463 ) ) ( not ( = ?auto_18437 ?auto_18459 ) ) ( not ( = ?auto_18437 ?auto_18453 ) ) ( not ( = ?auto_18437 ?auto_18456 ) ) ( not ( = ?auto_18437 ?auto_18448 ) ) ( not ( = ?auto_18418 ?auto_18429 ) ) ( not ( = ?auto_18418 ?auto_18455 ) ) ( not ( = ?auto_18419 ?auto_18429 ) ) ( not ( = ?auto_18419 ?auto_18455 ) ) ( not ( = ?auto_18420 ?auto_18429 ) ) ( not ( = ?auto_18420 ?auto_18455 ) ) ( not ( = ?auto_18421 ?auto_18429 ) ) ( not ( = ?auto_18421 ?auto_18455 ) ) ( not ( = ?auto_18422 ?auto_18429 ) ) ( not ( = ?auto_18422 ?auto_18455 ) ) ( not ( = ?auto_18423 ?auto_18429 ) ) ( not ( = ?auto_18423 ?auto_18455 ) ) ( not ( = ?auto_18424 ?auto_18429 ) ) ( not ( = ?auto_18424 ?auto_18455 ) ) ( not ( = ?auto_18425 ?auto_18429 ) ) ( not ( = ?auto_18425 ?auto_18455 ) ) ( not ( = ?auto_18426 ?auto_18429 ) ) ( not ( = ?auto_18426 ?auto_18455 ) ) ( not ( = ?auto_18427 ?auto_18429 ) ) ( not ( = ?auto_18427 ?auto_18455 ) ) ( not ( = ?auto_18429 ?auto_18437 ) ) ( not ( = ?auto_18429 ?auto_18441 ) ) ( not ( = ?auto_18429 ?auto_18454 ) ) ( not ( = ?auto_18429 ?auto_18442 ) ) ( not ( = ?auto_18429 ?auto_18444 ) ) ( not ( = ?auto_18429 ?auto_18463 ) ) ( not ( = ?auto_18429 ?auto_18459 ) ) ( not ( = ?auto_18429 ?auto_18453 ) ) ( not ( = ?auto_18429 ?auto_18456 ) ) ( not ( = ?auto_18429 ?auto_18448 ) ) ( not ( = ?auto_18455 ?auto_18437 ) ) ( not ( = ?auto_18455 ?auto_18441 ) ) ( not ( = ?auto_18455 ?auto_18454 ) ) ( not ( = ?auto_18455 ?auto_18442 ) ) ( not ( = ?auto_18455 ?auto_18444 ) ) ( not ( = ?auto_18455 ?auto_18463 ) ) ( not ( = ?auto_18455 ?auto_18459 ) ) ( not ( = ?auto_18455 ?auto_18453 ) ) ( not ( = ?auto_18455 ?auto_18456 ) ) ( not ( = ?auto_18455 ?auto_18448 ) ) ( not ( = ?auto_18418 ?auto_18430 ) ) ( not ( = ?auto_18418 ?auto_18435 ) ) ( not ( = ?auto_18419 ?auto_18430 ) ) ( not ( = ?auto_18419 ?auto_18435 ) ) ( not ( = ?auto_18420 ?auto_18430 ) ) ( not ( = ?auto_18420 ?auto_18435 ) ) ( not ( = ?auto_18421 ?auto_18430 ) ) ( not ( = ?auto_18421 ?auto_18435 ) ) ( not ( = ?auto_18422 ?auto_18430 ) ) ( not ( = ?auto_18422 ?auto_18435 ) ) ( not ( = ?auto_18423 ?auto_18430 ) ) ( not ( = ?auto_18423 ?auto_18435 ) ) ( not ( = ?auto_18424 ?auto_18430 ) ) ( not ( = ?auto_18424 ?auto_18435 ) ) ( not ( = ?auto_18425 ?auto_18430 ) ) ( not ( = ?auto_18425 ?auto_18435 ) ) ( not ( = ?auto_18426 ?auto_18430 ) ) ( not ( = ?auto_18426 ?auto_18435 ) ) ( not ( = ?auto_18427 ?auto_18430 ) ) ( not ( = ?auto_18427 ?auto_18435 ) ) ( not ( = ?auto_18428 ?auto_18430 ) ) ( not ( = ?auto_18428 ?auto_18435 ) ) ( not ( = ?auto_18430 ?auto_18455 ) ) ( not ( = ?auto_18430 ?auto_18437 ) ) ( not ( = ?auto_18430 ?auto_18441 ) ) ( not ( = ?auto_18430 ?auto_18454 ) ) ( not ( = ?auto_18430 ?auto_18442 ) ) ( not ( = ?auto_18430 ?auto_18444 ) ) ( not ( = ?auto_18430 ?auto_18463 ) ) ( not ( = ?auto_18430 ?auto_18459 ) ) ( not ( = ?auto_18430 ?auto_18453 ) ) ( not ( = ?auto_18430 ?auto_18456 ) ) ( not ( = ?auto_18430 ?auto_18448 ) ) ( not ( = ?auto_18434 ?auto_18452 ) ) ( not ( = ?auto_18434 ?auto_18440 ) ) ( not ( = ?auto_18434 ?auto_18462 ) ) ( not ( = ?auto_18434 ?auto_18460 ) ) ( not ( = ?auto_18434 ?auto_18458 ) ) ( not ( = ?auto_18434 ?auto_18439 ) ) ( not ( = ?auto_18434 ?auto_18438 ) ) ( not ( = ?auto_18434 ?auto_18445 ) ) ( not ( = ?auto_18432 ?auto_18443 ) ) ( not ( = ?auto_18432 ?auto_18446 ) ) ( not ( = ?auto_18432 ?auto_18449 ) ) ( not ( = ?auto_18432 ?auto_18461 ) ) ( not ( = ?auto_18432 ?auto_18451 ) ) ( not ( = ?auto_18432 ?auto_18447 ) ) ( not ( = ?auto_18432 ?auto_18457 ) ) ( not ( = ?auto_18432 ?auto_18450 ) ) ( not ( = ?auto_18435 ?auto_18455 ) ) ( not ( = ?auto_18435 ?auto_18437 ) ) ( not ( = ?auto_18435 ?auto_18441 ) ) ( not ( = ?auto_18435 ?auto_18454 ) ) ( not ( = ?auto_18435 ?auto_18442 ) ) ( not ( = ?auto_18435 ?auto_18444 ) ) ( not ( = ?auto_18435 ?auto_18463 ) ) ( not ( = ?auto_18435 ?auto_18459 ) ) ( not ( = ?auto_18435 ?auto_18453 ) ) ( not ( = ?auto_18435 ?auto_18456 ) ) ( not ( = ?auto_18435 ?auto_18448 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_18418 ?auto_18419 ?auto_18420 ?auto_18421 ?auto_18422 ?auto_18423 ?auto_18424 ?auto_18425 ?auto_18426 ?auto_18427 ?auto_18428 ?auto_18429 )
      ( MAKE-1CRATE ?auto_18429 ?auto_18430 )
      ( MAKE-12CRATE-VERIFY ?auto_18418 ?auto_18419 ?auto_18420 ?auto_18421 ?auto_18422 ?auto_18423 ?auto_18424 ?auto_18425 ?auto_18426 ?auto_18427 ?auto_18428 ?auto_18429 ?auto_18430 ) )
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
      ?auto_18495 - SURFACE
      ?auto_18496 - SURFACE
      ?auto_18497 - SURFACE
      ?auto_18498 - SURFACE
      ?auto_18499 - SURFACE
      ?auto_18500 - SURFACE
      ?auto_18501 - SURFACE
    )
    :vars
    (
      ?auto_18506 - HOIST
      ?auto_18503 - PLACE
      ?auto_18502 - PLACE
      ?auto_18507 - HOIST
      ?auto_18504 - SURFACE
      ?auto_18521 - PLACE
      ?auto_18508 - HOIST
      ?auto_18516 - SURFACE
      ?auto_18519 - PLACE
      ?auto_18537 - HOIST
      ?auto_18534 - SURFACE
      ?auto_18511 - PLACE
      ?auto_18514 - HOIST
      ?auto_18536 - SURFACE
      ?auto_18517 - SURFACE
      ?auto_18528 - PLACE
      ?auto_18512 - HOIST
      ?auto_18529 - SURFACE
      ?auto_18510 - SURFACE
      ?auto_18522 - PLACE
      ?auto_18520 - HOIST
      ?auto_18535 - SURFACE
      ?auto_18515 - PLACE
      ?auto_18526 - HOIST
      ?auto_18524 - SURFACE
      ?auto_18527 - SURFACE
      ?auto_18509 - PLACE
      ?auto_18533 - HOIST
      ?auto_18513 - SURFACE
      ?auto_18532 - PLACE
      ?auto_18530 - HOIST
      ?auto_18523 - SURFACE
      ?auto_18531 - PLACE
      ?auto_18525 - HOIST
      ?auto_18518 - SURFACE
      ?auto_18505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18506 ?auto_18503 ) ( IS-CRATE ?auto_18501 ) ( not ( = ?auto_18502 ?auto_18503 ) ) ( HOIST-AT ?auto_18507 ?auto_18502 ) ( AVAILABLE ?auto_18507 ) ( SURFACE-AT ?auto_18501 ?auto_18502 ) ( ON ?auto_18501 ?auto_18504 ) ( CLEAR ?auto_18501 ) ( not ( = ?auto_18500 ?auto_18501 ) ) ( not ( = ?auto_18500 ?auto_18504 ) ) ( not ( = ?auto_18501 ?auto_18504 ) ) ( not ( = ?auto_18506 ?auto_18507 ) ) ( IS-CRATE ?auto_18500 ) ( not ( = ?auto_18521 ?auto_18503 ) ) ( HOIST-AT ?auto_18508 ?auto_18521 ) ( AVAILABLE ?auto_18508 ) ( SURFACE-AT ?auto_18500 ?auto_18521 ) ( ON ?auto_18500 ?auto_18516 ) ( CLEAR ?auto_18500 ) ( not ( = ?auto_18499 ?auto_18500 ) ) ( not ( = ?auto_18499 ?auto_18516 ) ) ( not ( = ?auto_18500 ?auto_18516 ) ) ( not ( = ?auto_18506 ?auto_18508 ) ) ( IS-CRATE ?auto_18499 ) ( not ( = ?auto_18519 ?auto_18503 ) ) ( HOIST-AT ?auto_18537 ?auto_18519 ) ( SURFACE-AT ?auto_18499 ?auto_18519 ) ( ON ?auto_18499 ?auto_18534 ) ( CLEAR ?auto_18499 ) ( not ( = ?auto_18498 ?auto_18499 ) ) ( not ( = ?auto_18498 ?auto_18534 ) ) ( not ( = ?auto_18499 ?auto_18534 ) ) ( not ( = ?auto_18506 ?auto_18537 ) ) ( IS-CRATE ?auto_18498 ) ( not ( = ?auto_18511 ?auto_18503 ) ) ( HOIST-AT ?auto_18514 ?auto_18511 ) ( SURFACE-AT ?auto_18498 ?auto_18511 ) ( ON ?auto_18498 ?auto_18536 ) ( CLEAR ?auto_18498 ) ( not ( = ?auto_18497 ?auto_18498 ) ) ( not ( = ?auto_18497 ?auto_18536 ) ) ( not ( = ?auto_18498 ?auto_18536 ) ) ( not ( = ?auto_18506 ?auto_18514 ) ) ( IS-CRATE ?auto_18497 ) ( AVAILABLE ?auto_18537 ) ( SURFACE-AT ?auto_18497 ?auto_18519 ) ( ON ?auto_18497 ?auto_18517 ) ( CLEAR ?auto_18497 ) ( not ( = ?auto_18496 ?auto_18497 ) ) ( not ( = ?auto_18496 ?auto_18517 ) ) ( not ( = ?auto_18497 ?auto_18517 ) ) ( IS-CRATE ?auto_18496 ) ( not ( = ?auto_18528 ?auto_18503 ) ) ( HOIST-AT ?auto_18512 ?auto_18528 ) ( AVAILABLE ?auto_18512 ) ( SURFACE-AT ?auto_18496 ?auto_18528 ) ( ON ?auto_18496 ?auto_18529 ) ( CLEAR ?auto_18496 ) ( not ( = ?auto_18495 ?auto_18496 ) ) ( not ( = ?auto_18495 ?auto_18529 ) ) ( not ( = ?auto_18496 ?auto_18529 ) ) ( not ( = ?auto_18506 ?auto_18512 ) ) ( IS-CRATE ?auto_18495 ) ( SURFACE-AT ?auto_18495 ?auto_18511 ) ( ON ?auto_18495 ?auto_18510 ) ( CLEAR ?auto_18495 ) ( not ( = ?auto_18494 ?auto_18495 ) ) ( not ( = ?auto_18494 ?auto_18510 ) ) ( not ( = ?auto_18495 ?auto_18510 ) ) ( IS-CRATE ?auto_18494 ) ( not ( = ?auto_18522 ?auto_18503 ) ) ( HOIST-AT ?auto_18520 ?auto_18522 ) ( AVAILABLE ?auto_18520 ) ( SURFACE-AT ?auto_18494 ?auto_18522 ) ( ON ?auto_18494 ?auto_18535 ) ( CLEAR ?auto_18494 ) ( not ( = ?auto_18493 ?auto_18494 ) ) ( not ( = ?auto_18493 ?auto_18535 ) ) ( not ( = ?auto_18494 ?auto_18535 ) ) ( not ( = ?auto_18506 ?auto_18520 ) ) ( IS-CRATE ?auto_18493 ) ( not ( = ?auto_18515 ?auto_18503 ) ) ( HOIST-AT ?auto_18526 ?auto_18515 ) ( AVAILABLE ?auto_18526 ) ( SURFACE-AT ?auto_18493 ?auto_18515 ) ( ON ?auto_18493 ?auto_18524 ) ( CLEAR ?auto_18493 ) ( not ( = ?auto_18492 ?auto_18493 ) ) ( not ( = ?auto_18492 ?auto_18524 ) ) ( not ( = ?auto_18493 ?auto_18524 ) ) ( not ( = ?auto_18506 ?auto_18526 ) ) ( IS-CRATE ?auto_18492 ) ( AVAILABLE ?auto_18514 ) ( SURFACE-AT ?auto_18492 ?auto_18511 ) ( ON ?auto_18492 ?auto_18527 ) ( CLEAR ?auto_18492 ) ( not ( = ?auto_18491 ?auto_18492 ) ) ( not ( = ?auto_18491 ?auto_18527 ) ) ( not ( = ?auto_18492 ?auto_18527 ) ) ( IS-CRATE ?auto_18491 ) ( not ( = ?auto_18509 ?auto_18503 ) ) ( HOIST-AT ?auto_18533 ?auto_18509 ) ( AVAILABLE ?auto_18533 ) ( SURFACE-AT ?auto_18491 ?auto_18509 ) ( ON ?auto_18491 ?auto_18513 ) ( CLEAR ?auto_18491 ) ( not ( = ?auto_18490 ?auto_18491 ) ) ( not ( = ?auto_18490 ?auto_18513 ) ) ( not ( = ?auto_18491 ?auto_18513 ) ) ( not ( = ?auto_18506 ?auto_18533 ) ) ( IS-CRATE ?auto_18490 ) ( not ( = ?auto_18532 ?auto_18503 ) ) ( HOIST-AT ?auto_18530 ?auto_18532 ) ( AVAILABLE ?auto_18530 ) ( SURFACE-AT ?auto_18490 ?auto_18532 ) ( ON ?auto_18490 ?auto_18523 ) ( CLEAR ?auto_18490 ) ( not ( = ?auto_18489 ?auto_18490 ) ) ( not ( = ?auto_18489 ?auto_18523 ) ) ( not ( = ?auto_18490 ?auto_18523 ) ) ( not ( = ?auto_18506 ?auto_18530 ) ) ( SURFACE-AT ?auto_18488 ?auto_18503 ) ( CLEAR ?auto_18488 ) ( IS-CRATE ?auto_18489 ) ( AVAILABLE ?auto_18506 ) ( not ( = ?auto_18531 ?auto_18503 ) ) ( HOIST-AT ?auto_18525 ?auto_18531 ) ( AVAILABLE ?auto_18525 ) ( SURFACE-AT ?auto_18489 ?auto_18531 ) ( ON ?auto_18489 ?auto_18518 ) ( CLEAR ?auto_18489 ) ( TRUCK-AT ?auto_18505 ?auto_18503 ) ( not ( = ?auto_18488 ?auto_18489 ) ) ( not ( = ?auto_18488 ?auto_18518 ) ) ( not ( = ?auto_18489 ?auto_18518 ) ) ( not ( = ?auto_18506 ?auto_18525 ) ) ( not ( = ?auto_18488 ?auto_18490 ) ) ( not ( = ?auto_18488 ?auto_18523 ) ) ( not ( = ?auto_18490 ?auto_18518 ) ) ( not ( = ?auto_18532 ?auto_18531 ) ) ( not ( = ?auto_18530 ?auto_18525 ) ) ( not ( = ?auto_18523 ?auto_18518 ) ) ( not ( = ?auto_18488 ?auto_18491 ) ) ( not ( = ?auto_18488 ?auto_18513 ) ) ( not ( = ?auto_18489 ?auto_18491 ) ) ( not ( = ?auto_18489 ?auto_18513 ) ) ( not ( = ?auto_18491 ?auto_18523 ) ) ( not ( = ?auto_18491 ?auto_18518 ) ) ( not ( = ?auto_18509 ?auto_18532 ) ) ( not ( = ?auto_18509 ?auto_18531 ) ) ( not ( = ?auto_18533 ?auto_18530 ) ) ( not ( = ?auto_18533 ?auto_18525 ) ) ( not ( = ?auto_18513 ?auto_18523 ) ) ( not ( = ?auto_18513 ?auto_18518 ) ) ( not ( = ?auto_18488 ?auto_18492 ) ) ( not ( = ?auto_18488 ?auto_18527 ) ) ( not ( = ?auto_18489 ?auto_18492 ) ) ( not ( = ?auto_18489 ?auto_18527 ) ) ( not ( = ?auto_18490 ?auto_18492 ) ) ( not ( = ?auto_18490 ?auto_18527 ) ) ( not ( = ?auto_18492 ?auto_18513 ) ) ( not ( = ?auto_18492 ?auto_18523 ) ) ( not ( = ?auto_18492 ?auto_18518 ) ) ( not ( = ?auto_18511 ?auto_18509 ) ) ( not ( = ?auto_18511 ?auto_18532 ) ) ( not ( = ?auto_18511 ?auto_18531 ) ) ( not ( = ?auto_18514 ?auto_18533 ) ) ( not ( = ?auto_18514 ?auto_18530 ) ) ( not ( = ?auto_18514 ?auto_18525 ) ) ( not ( = ?auto_18527 ?auto_18513 ) ) ( not ( = ?auto_18527 ?auto_18523 ) ) ( not ( = ?auto_18527 ?auto_18518 ) ) ( not ( = ?auto_18488 ?auto_18493 ) ) ( not ( = ?auto_18488 ?auto_18524 ) ) ( not ( = ?auto_18489 ?auto_18493 ) ) ( not ( = ?auto_18489 ?auto_18524 ) ) ( not ( = ?auto_18490 ?auto_18493 ) ) ( not ( = ?auto_18490 ?auto_18524 ) ) ( not ( = ?auto_18491 ?auto_18493 ) ) ( not ( = ?auto_18491 ?auto_18524 ) ) ( not ( = ?auto_18493 ?auto_18527 ) ) ( not ( = ?auto_18493 ?auto_18513 ) ) ( not ( = ?auto_18493 ?auto_18523 ) ) ( not ( = ?auto_18493 ?auto_18518 ) ) ( not ( = ?auto_18515 ?auto_18511 ) ) ( not ( = ?auto_18515 ?auto_18509 ) ) ( not ( = ?auto_18515 ?auto_18532 ) ) ( not ( = ?auto_18515 ?auto_18531 ) ) ( not ( = ?auto_18526 ?auto_18514 ) ) ( not ( = ?auto_18526 ?auto_18533 ) ) ( not ( = ?auto_18526 ?auto_18530 ) ) ( not ( = ?auto_18526 ?auto_18525 ) ) ( not ( = ?auto_18524 ?auto_18527 ) ) ( not ( = ?auto_18524 ?auto_18513 ) ) ( not ( = ?auto_18524 ?auto_18523 ) ) ( not ( = ?auto_18524 ?auto_18518 ) ) ( not ( = ?auto_18488 ?auto_18494 ) ) ( not ( = ?auto_18488 ?auto_18535 ) ) ( not ( = ?auto_18489 ?auto_18494 ) ) ( not ( = ?auto_18489 ?auto_18535 ) ) ( not ( = ?auto_18490 ?auto_18494 ) ) ( not ( = ?auto_18490 ?auto_18535 ) ) ( not ( = ?auto_18491 ?auto_18494 ) ) ( not ( = ?auto_18491 ?auto_18535 ) ) ( not ( = ?auto_18492 ?auto_18494 ) ) ( not ( = ?auto_18492 ?auto_18535 ) ) ( not ( = ?auto_18494 ?auto_18524 ) ) ( not ( = ?auto_18494 ?auto_18527 ) ) ( not ( = ?auto_18494 ?auto_18513 ) ) ( not ( = ?auto_18494 ?auto_18523 ) ) ( not ( = ?auto_18494 ?auto_18518 ) ) ( not ( = ?auto_18522 ?auto_18515 ) ) ( not ( = ?auto_18522 ?auto_18511 ) ) ( not ( = ?auto_18522 ?auto_18509 ) ) ( not ( = ?auto_18522 ?auto_18532 ) ) ( not ( = ?auto_18522 ?auto_18531 ) ) ( not ( = ?auto_18520 ?auto_18526 ) ) ( not ( = ?auto_18520 ?auto_18514 ) ) ( not ( = ?auto_18520 ?auto_18533 ) ) ( not ( = ?auto_18520 ?auto_18530 ) ) ( not ( = ?auto_18520 ?auto_18525 ) ) ( not ( = ?auto_18535 ?auto_18524 ) ) ( not ( = ?auto_18535 ?auto_18527 ) ) ( not ( = ?auto_18535 ?auto_18513 ) ) ( not ( = ?auto_18535 ?auto_18523 ) ) ( not ( = ?auto_18535 ?auto_18518 ) ) ( not ( = ?auto_18488 ?auto_18495 ) ) ( not ( = ?auto_18488 ?auto_18510 ) ) ( not ( = ?auto_18489 ?auto_18495 ) ) ( not ( = ?auto_18489 ?auto_18510 ) ) ( not ( = ?auto_18490 ?auto_18495 ) ) ( not ( = ?auto_18490 ?auto_18510 ) ) ( not ( = ?auto_18491 ?auto_18495 ) ) ( not ( = ?auto_18491 ?auto_18510 ) ) ( not ( = ?auto_18492 ?auto_18495 ) ) ( not ( = ?auto_18492 ?auto_18510 ) ) ( not ( = ?auto_18493 ?auto_18495 ) ) ( not ( = ?auto_18493 ?auto_18510 ) ) ( not ( = ?auto_18495 ?auto_18535 ) ) ( not ( = ?auto_18495 ?auto_18524 ) ) ( not ( = ?auto_18495 ?auto_18527 ) ) ( not ( = ?auto_18495 ?auto_18513 ) ) ( not ( = ?auto_18495 ?auto_18523 ) ) ( not ( = ?auto_18495 ?auto_18518 ) ) ( not ( = ?auto_18510 ?auto_18535 ) ) ( not ( = ?auto_18510 ?auto_18524 ) ) ( not ( = ?auto_18510 ?auto_18527 ) ) ( not ( = ?auto_18510 ?auto_18513 ) ) ( not ( = ?auto_18510 ?auto_18523 ) ) ( not ( = ?auto_18510 ?auto_18518 ) ) ( not ( = ?auto_18488 ?auto_18496 ) ) ( not ( = ?auto_18488 ?auto_18529 ) ) ( not ( = ?auto_18489 ?auto_18496 ) ) ( not ( = ?auto_18489 ?auto_18529 ) ) ( not ( = ?auto_18490 ?auto_18496 ) ) ( not ( = ?auto_18490 ?auto_18529 ) ) ( not ( = ?auto_18491 ?auto_18496 ) ) ( not ( = ?auto_18491 ?auto_18529 ) ) ( not ( = ?auto_18492 ?auto_18496 ) ) ( not ( = ?auto_18492 ?auto_18529 ) ) ( not ( = ?auto_18493 ?auto_18496 ) ) ( not ( = ?auto_18493 ?auto_18529 ) ) ( not ( = ?auto_18494 ?auto_18496 ) ) ( not ( = ?auto_18494 ?auto_18529 ) ) ( not ( = ?auto_18496 ?auto_18510 ) ) ( not ( = ?auto_18496 ?auto_18535 ) ) ( not ( = ?auto_18496 ?auto_18524 ) ) ( not ( = ?auto_18496 ?auto_18527 ) ) ( not ( = ?auto_18496 ?auto_18513 ) ) ( not ( = ?auto_18496 ?auto_18523 ) ) ( not ( = ?auto_18496 ?auto_18518 ) ) ( not ( = ?auto_18528 ?auto_18511 ) ) ( not ( = ?auto_18528 ?auto_18522 ) ) ( not ( = ?auto_18528 ?auto_18515 ) ) ( not ( = ?auto_18528 ?auto_18509 ) ) ( not ( = ?auto_18528 ?auto_18532 ) ) ( not ( = ?auto_18528 ?auto_18531 ) ) ( not ( = ?auto_18512 ?auto_18514 ) ) ( not ( = ?auto_18512 ?auto_18520 ) ) ( not ( = ?auto_18512 ?auto_18526 ) ) ( not ( = ?auto_18512 ?auto_18533 ) ) ( not ( = ?auto_18512 ?auto_18530 ) ) ( not ( = ?auto_18512 ?auto_18525 ) ) ( not ( = ?auto_18529 ?auto_18510 ) ) ( not ( = ?auto_18529 ?auto_18535 ) ) ( not ( = ?auto_18529 ?auto_18524 ) ) ( not ( = ?auto_18529 ?auto_18527 ) ) ( not ( = ?auto_18529 ?auto_18513 ) ) ( not ( = ?auto_18529 ?auto_18523 ) ) ( not ( = ?auto_18529 ?auto_18518 ) ) ( not ( = ?auto_18488 ?auto_18497 ) ) ( not ( = ?auto_18488 ?auto_18517 ) ) ( not ( = ?auto_18489 ?auto_18497 ) ) ( not ( = ?auto_18489 ?auto_18517 ) ) ( not ( = ?auto_18490 ?auto_18497 ) ) ( not ( = ?auto_18490 ?auto_18517 ) ) ( not ( = ?auto_18491 ?auto_18497 ) ) ( not ( = ?auto_18491 ?auto_18517 ) ) ( not ( = ?auto_18492 ?auto_18497 ) ) ( not ( = ?auto_18492 ?auto_18517 ) ) ( not ( = ?auto_18493 ?auto_18497 ) ) ( not ( = ?auto_18493 ?auto_18517 ) ) ( not ( = ?auto_18494 ?auto_18497 ) ) ( not ( = ?auto_18494 ?auto_18517 ) ) ( not ( = ?auto_18495 ?auto_18497 ) ) ( not ( = ?auto_18495 ?auto_18517 ) ) ( not ( = ?auto_18497 ?auto_18529 ) ) ( not ( = ?auto_18497 ?auto_18510 ) ) ( not ( = ?auto_18497 ?auto_18535 ) ) ( not ( = ?auto_18497 ?auto_18524 ) ) ( not ( = ?auto_18497 ?auto_18527 ) ) ( not ( = ?auto_18497 ?auto_18513 ) ) ( not ( = ?auto_18497 ?auto_18523 ) ) ( not ( = ?auto_18497 ?auto_18518 ) ) ( not ( = ?auto_18519 ?auto_18528 ) ) ( not ( = ?auto_18519 ?auto_18511 ) ) ( not ( = ?auto_18519 ?auto_18522 ) ) ( not ( = ?auto_18519 ?auto_18515 ) ) ( not ( = ?auto_18519 ?auto_18509 ) ) ( not ( = ?auto_18519 ?auto_18532 ) ) ( not ( = ?auto_18519 ?auto_18531 ) ) ( not ( = ?auto_18537 ?auto_18512 ) ) ( not ( = ?auto_18537 ?auto_18514 ) ) ( not ( = ?auto_18537 ?auto_18520 ) ) ( not ( = ?auto_18537 ?auto_18526 ) ) ( not ( = ?auto_18537 ?auto_18533 ) ) ( not ( = ?auto_18537 ?auto_18530 ) ) ( not ( = ?auto_18537 ?auto_18525 ) ) ( not ( = ?auto_18517 ?auto_18529 ) ) ( not ( = ?auto_18517 ?auto_18510 ) ) ( not ( = ?auto_18517 ?auto_18535 ) ) ( not ( = ?auto_18517 ?auto_18524 ) ) ( not ( = ?auto_18517 ?auto_18527 ) ) ( not ( = ?auto_18517 ?auto_18513 ) ) ( not ( = ?auto_18517 ?auto_18523 ) ) ( not ( = ?auto_18517 ?auto_18518 ) ) ( not ( = ?auto_18488 ?auto_18498 ) ) ( not ( = ?auto_18488 ?auto_18536 ) ) ( not ( = ?auto_18489 ?auto_18498 ) ) ( not ( = ?auto_18489 ?auto_18536 ) ) ( not ( = ?auto_18490 ?auto_18498 ) ) ( not ( = ?auto_18490 ?auto_18536 ) ) ( not ( = ?auto_18491 ?auto_18498 ) ) ( not ( = ?auto_18491 ?auto_18536 ) ) ( not ( = ?auto_18492 ?auto_18498 ) ) ( not ( = ?auto_18492 ?auto_18536 ) ) ( not ( = ?auto_18493 ?auto_18498 ) ) ( not ( = ?auto_18493 ?auto_18536 ) ) ( not ( = ?auto_18494 ?auto_18498 ) ) ( not ( = ?auto_18494 ?auto_18536 ) ) ( not ( = ?auto_18495 ?auto_18498 ) ) ( not ( = ?auto_18495 ?auto_18536 ) ) ( not ( = ?auto_18496 ?auto_18498 ) ) ( not ( = ?auto_18496 ?auto_18536 ) ) ( not ( = ?auto_18498 ?auto_18517 ) ) ( not ( = ?auto_18498 ?auto_18529 ) ) ( not ( = ?auto_18498 ?auto_18510 ) ) ( not ( = ?auto_18498 ?auto_18535 ) ) ( not ( = ?auto_18498 ?auto_18524 ) ) ( not ( = ?auto_18498 ?auto_18527 ) ) ( not ( = ?auto_18498 ?auto_18513 ) ) ( not ( = ?auto_18498 ?auto_18523 ) ) ( not ( = ?auto_18498 ?auto_18518 ) ) ( not ( = ?auto_18536 ?auto_18517 ) ) ( not ( = ?auto_18536 ?auto_18529 ) ) ( not ( = ?auto_18536 ?auto_18510 ) ) ( not ( = ?auto_18536 ?auto_18535 ) ) ( not ( = ?auto_18536 ?auto_18524 ) ) ( not ( = ?auto_18536 ?auto_18527 ) ) ( not ( = ?auto_18536 ?auto_18513 ) ) ( not ( = ?auto_18536 ?auto_18523 ) ) ( not ( = ?auto_18536 ?auto_18518 ) ) ( not ( = ?auto_18488 ?auto_18499 ) ) ( not ( = ?auto_18488 ?auto_18534 ) ) ( not ( = ?auto_18489 ?auto_18499 ) ) ( not ( = ?auto_18489 ?auto_18534 ) ) ( not ( = ?auto_18490 ?auto_18499 ) ) ( not ( = ?auto_18490 ?auto_18534 ) ) ( not ( = ?auto_18491 ?auto_18499 ) ) ( not ( = ?auto_18491 ?auto_18534 ) ) ( not ( = ?auto_18492 ?auto_18499 ) ) ( not ( = ?auto_18492 ?auto_18534 ) ) ( not ( = ?auto_18493 ?auto_18499 ) ) ( not ( = ?auto_18493 ?auto_18534 ) ) ( not ( = ?auto_18494 ?auto_18499 ) ) ( not ( = ?auto_18494 ?auto_18534 ) ) ( not ( = ?auto_18495 ?auto_18499 ) ) ( not ( = ?auto_18495 ?auto_18534 ) ) ( not ( = ?auto_18496 ?auto_18499 ) ) ( not ( = ?auto_18496 ?auto_18534 ) ) ( not ( = ?auto_18497 ?auto_18499 ) ) ( not ( = ?auto_18497 ?auto_18534 ) ) ( not ( = ?auto_18499 ?auto_18536 ) ) ( not ( = ?auto_18499 ?auto_18517 ) ) ( not ( = ?auto_18499 ?auto_18529 ) ) ( not ( = ?auto_18499 ?auto_18510 ) ) ( not ( = ?auto_18499 ?auto_18535 ) ) ( not ( = ?auto_18499 ?auto_18524 ) ) ( not ( = ?auto_18499 ?auto_18527 ) ) ( not ( = ?auto_18499 ?auto_18513 ) ) ( not ( = ?auto_18499 ?auto_18523 ) ) ( not ( = ?auto_18499 ?auto_18518 ) ) ( not ( = ?auto_18534 ?auto_18536 ) ) ( not ( = ?auto_18534 ?auto_18517 ) ) ( not ( = ?auto_18534 ?auto_18529 ) ) ( not ( = ?auto_18534 ?auto_18510 ) ) ( not ( = ?auto_18534 ?auto_18535 ) ) ( not ( = ?auto_18534 ?auto_18524 ) ) ( not ( = ?auto_18534 ?auto_18527 ) ) ( not ( = ?auto_18534 ?auto_18513 ) ) ( not ( = ?auto_18534 ?auto_18523 ) ) ( not ( = ?auto_18534 ?auto_18518 ) ) ( not ( = ?auto_18488 ?auto_18500 ) ) ( not ( = ?auto_18488 ?auto_18516 ) ) ( not ( = ?auto_18489 ?auto_18500 ) ) ( not ( = ?auto_18489 ?auto_18516 ) ) ( not ( = ?auto_18490 ?auto_18500 ) ) ( not ( = ?auto_18490 ?auto_18516 ) ) ( not ( = ?auto_18491 ?auto_18500 ) ) ( not ( = ?auto_18491 ?auto_18516 ) ) ( not ( = ?auto_18492 ?auto_18500 ) ) ( not ( = ?auto_18492 ?auto_18516 ) ) ( not ( = ?auto_18493 ?auto_18500 ) ) ( not ( = ?auto_18493 ?auto_18516 ) ) ( not ( = ?auto_18494 ?auto_18500 ) ) ( not ( = ?auto_18494 ?auto_18516 ) ) ( not ( = ?auto_18495 ?auto_18500 ) ) ( not ( = ?auto_18495 ?auto_18516 ) ) ( not ( = ?auto_18496 ?auto_18500 ) ) ( not ( = ?auto_18496 ?auto_18516 ) ) ( not ( = ?auto_18497 ?auto_18500 ) ) ( not ( = ?auto_18497 ?auto_18516 ) ) ( not ( = ?auto_18498 ?auto_18500 ) ) ( not ( = ?auto_18498 ?auto_18516 ) ) ( not ( = ?auto_18500 ?auto_18534 ) ) ( not ( = ?auto_18500 ?auto_18536 ) ) ( not ( = ?auto_18500 ?auto_18517 ) ) ( not ( = ?auto_18500 ?auto_18529 ) ) ( not ( = ?auto_18500 ?auto_18510 ) ) ( not ( = ?auto_18500 ?auto_18535 ) ) ( not ( = ?auto_18500 ?auto_18524 ) ) ( not ( = ?auto_18500 ?auto_18527 ) ) ( not ( = ?auto_18500 ?auto_18513 ) ) ( not ( = ?auto_18500 ?auto_18523 ) ) ( not ( = ?auto_18500 ?auto_18518 ) ) ( not ( = ?auto_18521 ?auto_18519 ) ) ( not ( = ?auto_18521 ?auto_18511 ) ) ( not ( = ?auto_18521 ?auto_18528 ) ) ( not ( = ?auto_18521 ?auto_18522 ) ) ( not ( = ?auto_18521 ?auto_18515 ) ) ( not ( = ?auto_18521 ?auto_18509 ) ) ( not ( = ?auto_18521 ?auto_18532 ) ) ( not ( = ?auto_18521 ?auto_18531 ) ) ( not ( = ?auto_18508 ?auto_18537 ) ) ( not ( = ?auto_18508 ?auto_18514 ) ) ( not ( = ?auto_18508 ?auto_18512 ) ) ( not ( = ?auto_18508 ?auto_18520 ) ) ( not ( = ?auto_18508 ?auto_18526 ) ) ( not ( = ?auto_18508 ?auto_18533 ) ) ( not ( = ?auto_18508 ?auto_18530 ) ) ( not ( = ?auto_18508 ?auto_18525 ) ) ( not ( = ?auto_18516 ?auto_18534 ) ) ( not ( = ?auto_18516 ?auto_18536 ) ) ( not ( = ?auto_18516 ?auto_18517 ) ) ( not ( = ?auto_18516 ?auto_18529 ) ) ( not ( = ?auto_18516 ?auto_18510 ) ) ( not ( = ?auto_18516 ?auto_18535 ) ) ( not ( = ?auto_18516 ?auto_18524 ) ) ( not ( = ?auto_18516 ?auto_18527 ) ) ( not ( = ?auto_18516 ?auto_18513 ) ) ( not ( = ?auto_18516 ?auto_18523 ) ) ( not ( = ?auto_18516 ?auto_18518 ) ) ( not ( = ?auto_18488 ?auto_18501 ) ) ( not ( = ?auto_18488 ?auto_18504 ) ) ( not ( = ?auto_18489 ?auto_18501 ) ) ( not ( = ?auto_18489 ?auto_18504 ) ) ( not ( = ?auto_18490 ?auto_18501 ) ) ( not ( = ?auto_18490 ?auto_18504 ) ) ( not ( = ?auto_18491 ?auto_18501 ) ) ( not ( = ?auto_18491 ?auto_18504 ) ) ( not ( = ?auto_18492 ?auto_18501 ) ) ( not ( = ?auto_18492 ?auto_18504 ) ) ( not ( = ?auto_18493 ?auto_18501 ) ) ( not ( = ?auto_18493 ?auto_18504 ) ) ( not ( = ?auto_18494 ?auto_18501 ) ) ( not ( = ?auto_18494 ?auto_18504 ) ) ( not ( = ?auto_18495 ?auto_18501 ) ) ( not ( = ?auto_18495 ?auto_18504 ) ) ( not ( = ?auto_18496 ?auto_18501 ) ) ( not ( = ?auto_18496 ?auto_18504 ) ) ( not ( = ?auto_18497 ?auto_18501 ) ) ( not ( = ?auto_18497 ?auto_18504 ) ) ( not ( = ?auto_18498 ?auto_18501 ) ) ( not ( = ?auto_18498 ?auto_18504 ) ) ( not ( = ?auto_18499 ?auto_18501 ) ) ( not ( = ?auto_18499 ?auto_18504 ) ) ( not ( = ?auto_18501 ?auto_18516 ) ) ( not ( = ?auto_18501 ?auto_18534 ) ) ( not ( = ?auto_18501 ?auto_18536 ) ) ( not ( = ?auto_18501 ?auto_18517 ) ) ( not ( = ?auto_18501 ?auto_18529 ) ) ( not ( = ?auto_18501 ?auto_18510 ) ) ( not ( = ?auto_18501 ?auto_18535 ) ) ( not ( = ?auto_18501 ?auto_18524 ) ) ( not ( = ?auto_18501 ?auto_18527 ) ) ( not ( = ?auto_18501 ?auto_18513 ) ) ( not ( = ?auto_18501 ?auto_18523 ) ) ( not ( = ?auto_18501 ?auto_18518 ) ) ( not ( = ?auto_18502 ?auto_18521 ) ) ( not ( = ?auto_18502 ?auto_18519 ) ) ( not ( = ?auto_18502 ?auto_18511 ) ) ( not ( = ?auto_18502 ?auto_18528 ) ) ( not ( = ?auto_18502 ?auto_18522 ) ) ( not ( = ?auto_18502 ?auto_18515 ) ) ( not ( = ?auto_18502 ?auto_18509 ) ) ( not ( = ?auto_18502 ?auto_18532 ) ) ( not ( = ?auto_18502 ?auto_18531 ) ) ( not ( = ?auto_18507 ?auto_18508 ) ) ( not ( = ?auto_18507 ?auto_18537 ) ) ( not ( = ?auto_18507 ?auto_18514 ) ) ( not ( = ?auto_18507 ?auto_18512 ) ) ( not ( = ?auto_18507 ?auto_18520 ) ) ( not ( = ?auto_18507 ?auto_18526 ) ) ( not ( = ?auto_18507 ?auto_18533 ) ) ( not ( = ?auto_18507 ?auto_18530 ) ) ( not ( = ?auto_18507 ?auto_18525 ) ) ( not ( = ?auto_18504 ?auto_18516 ) ) ( not ( = ?auto_18504 ?auto_18534 ) ) ( not ( = ?auto_18504 ?auto_18536 ) ) ( not ( = ?auto_18504 ?auto_18517 ) ) ( not ( = ?auto_18504 ?auto_18529 ) ) ( not ( = ?auto_18504 ?auto_18510 ) ) ( not ( = ?auto_18504 ?auto_18535 ) ) ( not ( = ?auto_18504 ?auto_18524 ) ) ( not ( = ?auto_18504 ?auto_18527 ) ) ( not ( = ?auto_18504 ?auto_18513 ) ) ( not ( = ?auto_18504 ?auto_18523 ) ) ( not ( = ?auto_18504 ?auto_18518 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_18488 ?auto_18489 ?auto_18490 ?auto_18491 ?auto_18492 ?auto_18493 ?auto_18494 ?auto_18495 ?auto_18496 ?auto_18497 ?auto_18498 ?auto_18499 ?auto_18500 )
      ( MAKE-1CRATE ?auto_18500 ?auto_18501 )
      ( MAKE-13CRATE-VERIFY ?auto_18488 ?auto_18489 ?auto_18490 ?auto_18491 ?auto_18492 ?auto_18493 ?auto_18494 ?auto_18495 ?auto_18496 ?auto_18497 ?auto_18498 ?auto_18499 ?auto_18500 ?auto_18501 ) )
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
      ?auto_18570 - SURFACE
      ?auto_18571 - SURFACE
      ?auto_18572 - SURFACE
      ?auto_18573 - SURFACE
      ?auto_18574 - SURFACE
      ?auto_18575 - SURFACE
      ?auto_18577 - SURFACE
      ?auto_18576 - SURFACE
    )
    :vars
    (
      ?auto_18578 - HOIST
      ?auto_18580 - PLACE
      ?auto_18583 - PLACE
      ?auto_18582 - HOIST
      ?auto_18581 - SURFACE
      ?auto_18590 - PLACE
      ?auto_18591 - HOIST
      ?auto_18611 - SURFACE
      ?auto_18586 - PLACE
      ?auto_18589 - HOIST
      ?auto_18596 - SURFACE
      ?auto_18595 - PLACE
      ?auto_18585 - HOIST
      ?auto_18614 - SURFACE
      ?auto_18600 - SURFACE
      ?auto_18592 - SURFACE
      ?auto_18612 - PLACE
      ?auto_18602 - HOIST
      ?auto_18593 - SURFACE
      ?auto_18599 - SURFACE
      ?auto_18607 - PLACE
      ?auto_18604 - HOIST
      ?auto_18587 - SURFACE
      ?auto_18597 - PLACE
      ?auto_18603 - HOIST
      ?auto_18598 - SURFACE
      ?auto_18594 - SURFACE
      ?auto_18601 - PLACE
      ?auto_18610 - HOIST
      ?auto_18588 - SURFACE
      ?auto_18613 - PLACE
      ?auto_18584 - HOIST
      ?auto_18605 - SURFACE
      ?auto_18608 - PLACE
      ?auto_18609 - HOIST
      ?auto_18606 - SURFACE
      ?auto_18579 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18578 ?auto_18580 ) ( IS-CRATE ?auto_18576 ) ( not ( = ?auto_18583 ?auto_18580 ) ) ( HOIST-AT ?auto_18582 ?auto_18583 ) ( SURFACE-AT ?auto_18576 ?auto_18583 ) ( ON ?auto_18576 ?auto_18581 ) ( CLEAR ?auto_18576 ) ( not ( = ?auto_18577 ?auto_18576 ) ) ( not ( = ?auto_18577 ?auto_18581 ) ) ( not ( = ?auto_18576 ?auto_18581 ) ) ( not ( = ?auto_18578 ?auto_18582 ) ) ( IS-CRATE ?auto_18577 ) ( not ( = ?auto_18590 ?auto_18580 ) ) ( HOIST-AT ?auto_18591 ?auto_18590 ) ( AVAILABLE ?auto_18591 ) ( SURFACE-AT ?auto_18577 ?auto_18590 ) ( ON ?auto_18577 ?auto_18611 ) ( CLEAR ?auto_18577 ) ( not ( = ?auto_18575 ?auto_18577 ) ) ( not ( = ?auto_18575 ?auto_18611 ) ) ( not ( = ?auto_18577 ?auto_18611 ) ) ( not ( = ?auto_18578 ?auto_18591 ) ) ( IS-CRATE ?auto_18575 ) ( not ( = ?auto_18586 ?auto_18580 ) ) ( HOIST-AT ?auto_18589 ?auto_18586 ) ( AVAILABLE ?auto_18589 ) ( SURFACE-AT ?auto_18575 ?auto_18586 ) ( ON ?auto_18575 ?auto_18596 ) ( CLEAR ?auto_18575 ) ( not ( = ?auto_18574 ?auto_18575 ) ) ( not ( = ?auto_18574 ?auto_18596 ) ) ( not ( = ?auto_18575 ?auto_18596 ) ) ( not ( = ?auto_18578 ?auto_18589 ) ) ( IS-CRATE ?auto_18574 ) ( not ( = ?auto_18595 ?auto_18580 ) ) ( HOIST-AT ?auto_18585 ?auto_18595 ) ( SURFACE-AT ?auto_18574 ?auto_18595 ) ( ON ?auto_18574 ?auto_18614 ) ( CLEAR ?auto_18574 ) ( not ( = ?auto_18573 ?auto_18574 ) ) ( not ( = ?auto_18573 ?auto_18614 ) ) ( not ( = ?auto_18574 ?auto_18614 ) ) ( not ( = ?auto_18578 ?auto_18585 ) ) ( IS-CRATE ?auto_18573 ) ( SURFACE-AT ?auto_18573 ?auto_18583 ) ( ON ?auto_18573 ?auto_18600 ) ( CLEAR ?auto_18573 ) ( not ( = ?auto_18572 ?auto_18573 ) ) ( not ( = ?auto_18572 ?auto_18600 ) ) ( not ( = ?auto_18573 ?auto_18600 ) ) ( IS-CRATE ?auto_18572 ) ( AVAILABLE ?auto_18585 ) ( SURFACE-AT ?auto_18572 ?auto_18595 ) ( ON ?auto_18572 ?auto_18592 ) ( CLEAR ?auto_18572 ) ( not ( = ?auto_18571 ?auto_18572 ) ) ( not ( = ?auto_18571 ?auto_18592 ) ) ( not ( = ?auto_18572 ?auto_18592 ) ) ( IS-CRATE ?auto_18571 ) ( not ( = ?auto_18612 ?auto_18580 ) ) ( HOIST-AT ?auto_18602 ?auto_18612 ) ( AVAILABLE ?auto_18602 ) ( SURFACE-AT ?auto_18571 ?auto_18612 ) ( ON ?auto_18571 ?auto_18593 ) ( CLEAR ?auto_18571 ) ( not ( = ?auto_18570 ?auto_18571 ) ) ( not ( = ?auto_18570 ?auto_18593 ) ) ( not ( = ?auto_18571 ?auto_18593 ) ) ( not ( = ?auto_18578 ?auto_18602 ) ) ( IS-CRATE ?auto_18570 ) ( SURFACE-AT ?auto_18570 ?auto_18583 ) ( ON ?auto_18570 ?auto_18599 ) ( CLEAR ?auto_18570 ) ( not ( = ?auto_18569 ?auto_18570 ) ) ( not ( = ?auto_18569 ?auto_18599 ) ) ( not ( = ?auto_18570 ?auto_18599 ) ) ( IS-CRATE ?auto_18569 ) ( not ( = ?auto_18607 ?auto_18580 ) ) ( HOIST-AT ?auto_18604 ?auto_18607 ) ( AVAILABLE ?auto_18604 ) ( SURFACE-AT ?auto_18569 ?auto_18607 ) ( ON ?auto_18569 ?auto_18587 ) ( CLEAR ?auto_18569 ) ( not ( = ?auto_18568 ?auto_18569 ) ) ( not ( = ?auto_18568 ?auto_18587 ) ) ( not ( = ?auto_18569 ?auto_18587 ) ) ( not ( = ?auto_18578 ?auto_18604 ) ) ( IS-CRATE ?auto_18568 ) ( not ( = ?auto_18597 ?auto_18580 ) ) ( HOIST-AT ?auto_18603 ?auto_18597 ) ( AVAILABLE ?auto_18603 ) ( SURFACE-AT ?auto_18568 ?auto_18597 ) ( ON ?auto_18568 ?auto_18598 ) ( CLEAR ?auto_18568 ) ( not ( = ?auto_18567 ?auto_18568 ) ) ( not ( = ?auto_18567 ?auto_18598 ) ) ( not ( = ?auto_18568 ?auto_18598 ) ) ( not ( = ?auto_18578 ?auto_18603 ) ) ( IS-CRATE ?auto_18567 ) ( AVAILABLE ?auto_18582 ) ( SURFACE-AT ?auto_18567 ?auto_18583 ) ( ON ?auto_18567 ?auto_18594 ) ( CLEAR ?auto_18567 ) ( not ( = ?auto_18566 ?auto_18567 ) ) ( not ( = ?auto_18566 ?auto_18594 ) ) ( not ( = ?auto_18567 ?auto_18594 ) ) ( IS-CRATE ?auto_18566 ) ( not ( = ?auto_18601 ?auto_18580 ) ) ( HOIST-AT ?auto_18610 ?auto_18601 ) ( AVAILABLE ?auto_18610 ) ( SURFACE-AT ?auto_18566 ?auto_18601 ) ( ON ?auto_18566 ?auto_18588 ) ( CLEAR ?auto_18566 ) ( not ( = ?auto_18565 ?auto_18566 ) ) ( not ( = ?auto_18565 ?auto_18588 ) ) ( not ( = ?auto_18566 ?auto_18588 ) ) ( not ( = ?auto_18578 ?auto_18610 ) ) ( IS-CRATE ?auto_18565 ) ( not ( = ?auto_18613 ?auto_18580 ) ) ( HOIST-AT ?auto_18584 ?auto_18613 ) ( AVAILABLE ?auto_18584 ) ( SURFACE-AT ?auto_18565 ?auto_18613 ) ( ON ?auto_18565 ?auto_18605 ) ( CLEAR ?auto_18565 ) ( not ( = ?auto_18564 ?auto_18565 ) ) ( not ( = ?auto_18564 ?auto_18605 ) ) ( not ( = ?auto_18565 ?auto_18605 ) ) ( not ( = ?auto_18578 ?auto_18584 ) ) ( SURFACE-AT ?auto_18563 ?auto_18580 ) ( CLEAR ?auto_18563 ) ( IS-CRATE ?auto_18564 ) ( AVAILABLE ?auto_18578 ) ( not ( = ?auto_18608 ?auto_18580 ) ) ( HOIST-AT ?auto_18609 ?auto_18608 ) ( AVAILABLE ?auto_18609 ) ( SURFACE-AT ?auto_18564 ?auto_18608 ) ( ON ?auto_18564 ?auto_18606 ) ( CLEAR ?auto_18564 ) ( TRUCK-AT ?auto_18579 ?auto_18580 ) ( not ( = ?auto_18563 ?auto_18564 ) ) ( not ( = ?auto_18563 ?auto_18606 ) ) ( not ( = ?auto_18564 ?auto_18606 ) ) ( not ( = ?auto_18578 ?auto_18609 ) ) ( not ( = ?auto_18563 ?auto_18565 ) ) ( not ( = ?auto_18563 ?auto_18605 ) ) ( not ( = ?auto_18565 ?auto_18606 ) ) ( not ( = ?auto_18613 ?auto_18608 ) ) ( not ( = ?auto_18584 ?auto_18609 ) ) ( not ( = ?auto_18605 ?auto_18606 ) ) ( not ( = ?auto_18563 ?auto_18566 ) ) ( not ( = ?auto_18563 ?auto_18588 ) ) ( not ( = ?auto_18564 ?auto_18566 ) ) ( not ( = ?auto_18564 ?auto_18588 ) ) ( not ( = ?auto_18566 ?auto_18605 ) ) ( not ( = ?auto_18566 ?auto_18606 ) ) ( not ( = ?auto_18601 ?auto_18613 ) ) ( not ( = ?auto_18601 ?auto_18608 ) ) ( not ( = ?auto_18610 ?auto_18584 ) ) ( not ( = ?auto_18610 ?auto_18609 ) ) ( not ( = ?auto_18588 ?auto_18605 ) ) ( not ( = ?auto_18588 ?auto_18606 ) ) ( not ( = ?auto_18563 ?auto_18567 ) ) ( not ( = ?auto_18563 ?auto_18594 ) ) ( not ( = ?auto_18564 ?auto_18567 ) ) ( not ( = ?auto_18564 ?auto_18594 ) ) ( not ( = ?auto_18565 ?auto_18567 ) ) ( not ( = ?auto_18565 ?auto_18594 ) ) ( not ( = ?auto_18567 ?auto_18588 ) ) ( not ( = ?auto_18567 ?auto_18605 ) ) ( not ( = ?auto_18567 ?auto_18606 ) ) ( not ( = ?auto_18583 ?auto_18601 ) ) ( not ( = ?auto_18583 ?auto_18613 ) ) ( not ( = ?auto_18583 ?auto_18608 ) ) ( not ( = ?auto_18582 ?auto_18610 ) ) ( not ( = ?auto_18582 ?auto_18584 ) ) ( not ( = ?auto_18582 ?auto_18609 ) ) ( not ( = ?auto_18594 ?auto_18588 ) ) ( not ( = ?auto_18594 ?auto_18605 ) ) ( not ( = ?auto_18594 ?auto_18606 ) ) ( not ( = ?auto_18563 ?auto_18568 ) ) ( not ( = ?auto_18563 ?auto_18598 ) ) ( not ( = ?auto_18564 ?auto_18568 ) ) ( not ( = ?auto_18564 ?auto_18598 ) ) ( not ( = ?auto_18565 ?auto_18568 ) ) ( not ( = ?auto_18565 ?auto_18598 ) ) ( not ( = ?auto_18566 ?auto_18568 ) ) ( not ( = ?auto_18566 ?auto_18598 ) ) ( not ( = ?auto_18568 ?auto_18594 ) ) ( not ( = ?auto_18568 ?auto_18588 ) ) ( not ( = ?auto_18568 ?auto_18605 ) ) ( not ( = ?auto_18568 ?auto_18606 ) ) ( not ( = ?auto_18597 ?auto_18583 ) ) ( not ( = ?auto_18597 ?auto_18601 ) ) ( not ( = ?auto_18597 ?auto_18613 ) ) ( not ( = ?auto_18597 ?auto_18608 ) ) ( not ( = ?auto_18603 ?auto_18582 ) ) ( not ( = ?auto_18603 ?auto_18610 ) ) ( not ( = ?auto_18603 ?auto_18584 ) ) ( not ( = ?auto_18603 ?auto_18609 ) ) ( not ( = ?auto_18598 ?auto_18594 ) ) ( not ( = ?auto_18598 ?auto_18588 ) ) ( not ( = ?auto_18598 ?auto_18605 ) ) ( not ( = ?auto_18598 ?auto_18606 ) ) ( not ( = ?auto_18563 ?auto_18569 ) ) ( not ( = ?auto_18563 ?auto_18587 ) ) ( not ( = ?auto_18564 ?auto_18569 ) ) ( not ( = ?auto_18564 ?auto_18587 ) ) ( not ( = ?auto_18565 ?auto_18569 ) ) ( not ( = ?auto_18565 ?auto_18587 ) ) ( not ( = ?auto_18566 ?auto_18569 ) ) ( not ( = ?auto_18566 ?auto_18587 ) ) ( not ( = ?auto_18567 ?auto_18569 ) ) ( not ( = ?auto_18567 ?auto_18587 ) ) ( not ( = ?auto_18569 ?auto_18598 ) ) ( not ( = ?auto_18569 ?auto_18594 ) ) ( not ( = ?auto_18569 ?auto_18588 ) ) ( not ( = ?auto_18569 ?auto_18605 ) ) ( not ( = ?auto_18569 ?auto_18606 ) ) ( not ( = ?auto_18607 ?auto_18597 ) ) ( not ( = ?auto_18607 ?auto_18583 ) ) ( not ( = ?auto_18607 ?auto_18601 ) ) ( not ( = ?auto_18607 ?auto_18613 ) ) ( not ( = ?auto_18607 ?auto_18608 ) ) ( not ( = ?auto_18604 ?auto_18603 ) ) ( not ( = ?auto_18604 ?auto_18582 ) ) ( not ( = ?auto_18604 ?auto_18610 ) ) ( not ( = ?auto_18604 ?auto_18584 ) ) ( not ( = ?auto_18604 ?auto_18609 ) ) ( not ( = ?auto_18587 ?auto_18598 ) ) ( not ( = ?auto_18587 ?auto_18594 ) ) ( not ( = ?auto_18587 ?auto_18588 ) ) ( not ( = ?auto_18587 ?auto_18605 ) ) ( not ( = ?auto_18587 ?auto_18606 ) ) ( not ( = ?auto_18563 ?auto_18570 ) ) ( not ( = ?auto_18563 ?auto_18599 ) ) ( not ( = ?auto_18564 ?auto_18570 ) ) ( not ( = ?auto_18564 ?auto_18599 ) ) ( not ( = ?auto_18565 ?auto_18570 ) ) ( not ( = ?auto_18565 ?auto_18599 ) ) ( not ( = ?auto_18566 ?auto_18570 ) ) ( not ( = ?auto_18566 ?auto_18599 ) ) ( not ( = ?auto_18567 ?auto_18570 ) ) ( not ( = ?auto_18567 ?auto_18599 ) ) ( not ( = ?auto_18568 ?auto_18570 ) ) ( not ( = ?auto_18568 ?auto_18599 ) ) ( not ( = ?auto_18570 ?auto_18587 ) ) ( not ( = ?auto_18570 ?auto_18598 ) ) ( not ( = ?auto_18570 ?auto_18594 ) ) ( not ( = ?auto_18570 ?auto_18588 ) ) ( not ( = ?auto_18570 ?auto_18605 ) ) ( not ( = ?auto_18570 ?auto_18606 ) ) ( not ( = ?auto_18599 ?auto_18587 ) ) ( not ( = ?auto_18599 ?auto_18598 ) ) ( not ( = ?auto_18599 ?auto_18594 ) ) ( not ( = ?auto_18599 ?auto_18588 ) ) ( not ( = ?auto_18599 ?auto_18605 ) ) ( not ( = ?auto_18599 ?auto_18606 ) ) ( not ( = ?auto_18563 ?auto_18571 ) ) ( not ( = ?auto_18563 ?auto_18593 ) ) ( not ( = ?auto_18564 ?auto_18571 ) ) ( not ( = ?auto_18564 ?auto_18593 ) ) ( not ( = ?auto_18565 ?auto_18571 ) ) ( not ( = ?auto_18565 ?auto_18593 ) ) ( not ( = ?auto_18566 ?auto_18571 ) ) ( not ( = ?auto_18566 ?auto_18593 ) ) ( not ( = ?auto_18567 ?auto_18571 ) ) ( not ( = ?auto_18567 ?auto_18593 ) ) ( not ( = ?auto_18568 ?auto_18571 ) ) ( not ( = ?auto_18568 ?auto_18593 ) ) ( not ( = ?auto_18569 ?auto_18571 ) ) ( not ( = ?auto_18569 ?auto_18593 ) ) ( not ( = ?auto_18571 ?auto_18599 ) ) ( not ( = ?auto_18571 ?auto_18587 ) ) ( not ( = ?auto_18571 ?auto_18598 ) ) ( not ( = ?auto_18571 ?auto_18594 ) ) ( not ( = ?auto_18571 ?auto_18588 ) ) ( not ( = ?auto_18571 ?auto_18605 ) ) ( not ( = ?auto_18571 ?auto_18606 ) ) ( not ( = ?auto_18612 ?auto_18583 ) ) ( not ( = ?auto_18612 ?auto_18607 ) ) ( not ( = ?auto_18612 ?auto_18597 ) ) ( not ( = ?auto_18612 ?auto_18601 ) ) ( not ( = ?auto_18612 ?auto_18613 ) ) ( not ( = ?auto_18612 ?auto_18608 ) ) ( not ( = ?auto_18602 ?auto_18582 ) ) ( not ( = ?auto_18602 ?auto_18604 ) ) ( not ( = ?auto_18602 ?auto_18603 ) ) ( not ( = ?auto_18602 ?auto_18610 ) ) ( not ( = ?auto_18602 ?auto_18584 ) ) ( not ( = ?auto_18602 ?auto_18609 ) ) ( not ( = ?auto_18593 ?auto_18599 ) ) ( not ( = ?auto_18593 ?auto_18587 ) ) ( not ( = ?auto_18593 ?auto_18598 ) ) ( not ( = ?auto_18593 ?auto_18594 ) ) ( not ( = ?auto_18593 ?auto_18588 ) ) ( not ( = ?auto_18593 ?auto_18605 ) ) ( not ( = ?auto_18593 ?auto_18606 ) ) ( not ( = ?auto_18563 ?auto_18572 ) ) ( not ( = ?auto_18563 ?auto_18592 ) ) ( not ( = ?auto_18564 ?auto_18572 ) ) ( not ( = ?auto_18564 ?auto_18592 ) ) ( not ( = ?auto_18565 ?auto_18572 ) ) ( not ( = ?auto_18565 ?auto_18592 ) ) ( not ( = ?auto_18566 ?auto_18572 ) ) ( not ( = ?auto_18566 ?auto_18592 ) ) ( not ( = ?auto_18567 ?auto_18572 ) ) ( not ( = ?auto_18567 ?auto_18592 ) ) ( not ( = ?auto_18568 ?auto_18572 ) ) ( not ( = ?auto_18568 ?auto_18592 ) ) ( not ( = ?auto_18569 ?auto_18572 ) ) ( not ( = ?auto_18569 ?auto_18592 ) ) ( not ( = ?auto_18570 ?auto_18572 ) ) ( not ( = ?auto_18570 ?auto_18592 ) ) ( not ( = ?auto_18572 ?auto_18593 ) ) ( not ( = ?auto_18572 ?auto_18599 ) ) ( not ( = ?auto_18572 ?auto_18587 ) ) ( not ( = ?auto_18572 ?auto_18598 ) ) ( not ( = ?auto_18572 ?auto_18594 ) ) ( not ( = ?auto_18572 ?auto_18588 ) ) ( not ( = ?auto_18572 ?auto_18605 ) ) ( not ( = ?auto_18572 ?auto_18606 ) ) ( not ( = ?auto_18595 ?auto_18612 ) ) ( not ( = ?auto_18595 ?auto_18583 ) ) ( not ( = ?auto_18595 ?auto_18607 ) ) ( not ( = ?auto_18595 ?auto_18597 ) ) ( not ( = ?auto_18595 ?auto_18601 ) ) ( not ( = ?auto_18595 ?auto_18613 ) ) ( not ( = ?auto_18595 ?auto_18608 ) ) ( not ( = ?auto_18585 ?auto_18602 ) ) ( not ( = ?auto_18585 ?auto_18582 ) ) ( not ( = ?auto_18585 ?auto_18604 ) ) ( not ( = ?auto_18585 ?auto_18603 ) ) ( not ( = ?auto_18585 ?auto_18610 ) ) ( not ( = ?auto_18585 ?auto_18584 ) ) ( not ( = ?auto_18585 ?auto_18609 ) ) ( not ( = ?auto_18592 ?auto_18593 ) ) ( not ( = ?auto_18592 ?auto_18599 ) ) ( not ( = ?auto_18592 ?auto_18587 ) ) ( not ( = ?auto_18592 ?auto_18598 ) ) ( not ( = ?auto_18592 ?auto_18594 ) ) ( not ( = ?auto_18592 ?auto_18588 ) ) ( not ( = ?auto_18592 ?auto_18605 ) ) ( not ( = ?auto_18592 ?auto_18606 ) ) ( not ( = ?auto_18563 ?auto_18573 ) ) ( not ( = ?auto_18563 ?auto_18600 ) ) ( not ( = ?auto_18564 ?auto_18573 ) ) ( not ( = ?auto_18564 ?auto_18600 ) ) ( not ( = ?auto_18565 ?auto_18573 ) ) ( not ( = ?auto_18565 ?auto_18600 ) ) ( not ( = ?auto_18566 ?auto_18573 ) ) ( not ( = ?auto_18566 ?auto_18600 ) ) ( not ( = ?auto_18567 ?auto_18573 ) ) ( not ( = ?auto_18567 ?auto_18600 ) ) ( not ( = ?auto_18568 ?auto_18573 ) ) ( not ( = ?auto_18568 ?auto_18600 ) ) ( not ( = ?auto_18569 ?auto_18573 ) ) ( not ( = ?auto_18569 ?auto_18600 ) ) ( not ( = ?auto_18570 ?auto_18573 ) ) ( not ( = ?auto_18570 ?auto_18600 ) ) ( not ( = ?auto_18571 ?auto_18573 ) ) ( not ( = ?auto_18571 ?auto_18600 ) ) ( not ( = ?auto_18573 ?auto_18592 ) ) ( not ( = ?auto_18573 ?auto_18593 ) ) ( not ( = ?auto_18573 ?auto_18599 ) ) ( not ( = ?auto_18573 ?auto_18587 ) ) ( not ( = ?auto_18573 ?auto_18598 ) ) ( not ( = ?auto_18573 ?auto_18594 ) ) ( not ( = ?auto_18573 ?auto_18588 ) ) ( not ( = ?auto_18573 ?auto_18605 ) ) ( not ( = ?auto_18573 ?auto_18606 ) ) ( not ( = ?auto_18600 ?auto_18592 ) ) ( not ( = ?auto_18600 ?auto_18593 ) ) ( not ( = ?auto_18600 ?auto_18599 ) ) ( not ( = ?auto_18600 ?auto_18587 ) ) ( not ( = ?auto_18600 ?auto_18598 ) ) ( not ( = ?auto_18600 ?auto_18594 ) ) ( not ( = ?auto_18600 ?auto_18588 ) ) ( not ( = ?auto_18600 ?auto_18605 ) ) ( not ( = ?auto_18600 ?auto_18606 ) ) ( not ( = ?auto_18563 ?auto_18574 ) ) ( not ( = ?auto_18563 ?auto_18614 ) ) ( not ( = ?auto_18564 ?auto_18574 ) ) ( not ( = ?auto_18564 ?auto_18614 ) ) ( not ( = ?auto_18565 ?auto_18574 ) ) ( not ( = ?auto_18565 ?auto_18614 ) ) ( not ( = ?auto_18566 ?auto_18574 ) ) ( not ( = ?auto_18566 ?auto_18614 ) ) ( not ( = ?auto_18567 ?auto_18574 ) ) ( not ( = ?auto_18567 ?auto_18614 ) ) ( not ( = ?auto_18568 ?auto_18574 ) ) ( not ( = ?auto_18568 ?auto_18614 ) ) ( not ( = ?auto_18569 ?auto_18574 ) ) ( not ( = ?auto_18569 ?auto_18614 ) ) ( not ( = ?auto_18570 ?auto_18574 ) ) ( not ( = ?auto_18570 ?auto_18614 ) ) ( not ( = ?auto_18571 ?auto_18574 ) ) ( not ( = ?auto_18571 ?auto_18614 ) ) ( not ( = ?auto_18572 ?auto_18574 ) ) ( not ( = ?auto_18572 ?auto_18614 ) ) ( not ( = ?auto_18574 ?auto_18600 ) ) ( not ( = ?auto_18574 ?auto_18592 ) ) ( not ( = ?auto_18574 ?auto_18593 ) ) ( not ( = ?auto_18574 ?auto_18599 ) ) ( not ( = ?auto_18574 ?auto_18587 ) ) ( not ( = ?auto_18574 ?auto_18598 ) ) ( not ( = ?auto_18574 ?auto_18594 ) ) ( not ( = ?auto_18574 ?auto_18588 ) ) ( not ( = ?auto_18574 ?auto_18605 ) ) ( not ( = ?auto_18574 ?auto_18606 ) ) ( not ( = ?auto_18614 ?auto_18600 ) ) ( not ( = ?auto_18614 ?auto_18592 ) ) ( not ( = ?auto_18614 ?auto_18593 ) ) ( not ( = ?auto_18614 ?auto_18599 ) ) ( not ( = ?auto_18614 ?auto_18587 ) ) ( not ( = ?auto_18614 ?auto_18598 ) ) ( not ( = ?auto_18614 ?auto_18594 ) ) ( not ( = ?auto_18614 ?auto_18588 ) ) ( not ( = ?auto_18614 ?auto_18605 ) ) ( not ( = ?auto_18614 ?auto_18606 ) ) ( not ( = ?auto_18563 ?auto_18575 ) ) ( not ( = ?auto_18563 ?auto_18596 ) ) ( not ( = ?auto_18564 ?auto_18575 ) ) ( not ( = ?auto_18564 ?auto_18596 ) ) ( not ( = ?auto_18565 ?auto_18575 ) ) ( not ( = ?auto_18565 ?auto_18596 ) ) ( not ( = ?auto_18566 ?auto_18575 ) ) ( not ( = ?auto_18566 ?auto_18596 ) ) ( not ( = ?auto_18567 ?auto_18575 ) ) ( not ( = ?auto_18567 ?auto_18596 ) ) ( not ( = ?auto_18568 ?auto_18575 ) ) ( not ( = ?auto_18568 ?auto_18596 ) ) ( not ( = ?auto_18569 ?auto_18575 ) ) ( not ( = ?auto_18569 ?auto_18596 ) ) ( not ( = ?auto_18570 ?auto_18575 ) ) ( not ( = ?auto_18570 ?auto_18596 ) ) ( not ( = ?auto_18571 ?auto_18575 ) ) ( not ( = ?auto_18571 ?auto_18596 ) ) ( not ( = ?auto_18572 ?auto_18575 ) ) ( not ( = ?auto_18572 ?auto_18596 ) ) ( not ( = ?auto_18573 ?auto_18575 ) ) ( not ( = ?auto_18573 ?auto_18596 ) ) ( not ( = ?auto_18575 ?auto_18614 ) ) ( not ( = ?auto_18575 ?auto_18600 ) ) ( not ( = ?auto_18575 ?auto_18592 ) ) ( not ( = ?auto_18575 ?auto_18593 ) ) ( not ( = ?auto_18575 ?auto_18599 ) ) ( not ( = ?auto_18575 ?auto_18587 ) ) ( not ( = ?auto_18575 ?auto_18598 ) ) ( not ( = ?auto_18575 ?auto_18594 ) ) ( not ( = ?auto_18575 ?auto_18588 ) ) ( not ( = ?auto_18575 ?auto_18605 ) ) ( not ( = ?auto_18575 ?auto_18606 ) ) ( not ( = ?auto_18586 ?auto_18595 ) ) ( not ( = ?auto_18586 ?auto_18583 ) ) ( not ( = ?auto_18586 ?auto_18612 ) ) ( not ( = ?auto_18586 ?auto_18607 ) ) ( not ( = ?auto_18586 ?auto_18597 ) ) ( not ( = ?auto_18586 ?auto_18601 ) ) ( not ( = ?auto_18586 ?auto_18613 ) ) ( not ( = ?auto_18586 ?auto_18608 ) ) ( not ( = ?auto_18589 ?auto_18585 ) ) ( not ( = ?auto_18589 ?auto_18582 ) ) ( not ( = ?auto_18589 ?auto_18602 ) ) ( not ( = ?auto_18589 ?auto_18604 ) ) ( not ( = ?auto_18589 ?auto_18603 ) ) ( not ( = ?auto_18589 ?auto_18610 ) ) ( not ( = ?auto_18589 ?auto_18584 ) ) ( not ( = ?auto_18589 ?auto_18609 ) ) ( not ( = ?auto_18596 ?auto_18614 ) ) ( not ( = ?auto_18596 ?auto_18600 ) ) ( not ( = ?auto_18596 ?auto_18592 ) ) ( not ( = ?auto_18596 ?auto_18593 ) ) ( not ( = ?auto_18596 ?auto_18599 ) ) ( not ( = ?auto_18596 ?auto_18587 ) ) ( not ( = ?auto_18596 ?auto_18598 ) ) ( not ( = ?auto_18596 ?auto_18594 ) ) ( not ( = ?auto_18596 ?auto_18588 ) ) ( not ( = ?auto_18596 ?auto_18605 ) ) ( not ( = ?auto_18596 ?auto_18606 ) ) ( not ( = ?auto_18563 ?auto_18577 ) ) ( not ( = ?auto_18563 ?auto_18611 ) ) ( not ( = ?auto_18564 ?auto_18577 ) ) ( not ( = ?auto_18564 ?auto_18611 ) ) ( not ( = ?auto_18565 ?auto_18577 ) ) ( not ( = ?auto_18565 ?auto_18611 ) ) ( not ( = ?auto_18566 ?auto_18577 ) ) ( not ( = ?auto_18566 ?auto_18611 ) ) ( not ( = ?auto_18567 ?auto_18577 ) ) ( not ( = ?auto_18567 ?auto_18611 ) ) ( not ( = ?auto_18568 ?auto_18577 ) ) ( not ( = ?auto_18568 ?auto_18611 ) ) ( not ( = ?auto_18569 ?auto_18577 ) ) ( not ( = ?auto_18569 ?auto_18611 ) ) ( not ( = ?auto_18570 ?auto_18577 ) ) ( not ( = ?auto_18570 ?auto_18611 ) ) ( not ( = ?auto_18571 ?auto_18577 ) ) ( not ( = ?auto_18571 ?auto_18611 ) ) ( not ( = ?auto_18572 ?auto_18577 ) ) ( not ( = ?auto_18572 ?auto_18611 ) ) ( not ( = ?auto_18573 ?auto_18577 ) ) ( not ( = ?auto_18573 ?auto_18611 ) ) ( not ( = ?auto_18574 ?auto_18577 ) ) ( not ( = ?auto_18574 ?auto_18611 ) ) ( not ( = ?auto_18577 ?auto_18596 ) ) ( not ( = ?auto_18577 ?auto_18614 ) ) ( not ( = ?auto_18577 ?auto_18600 ) ) ( not ( = ?auto_18577 ?auto_18592 ) ) ( not ( = ?auto_18577 ?auto_18593 ) ) ( not ( = ?auto_18577 ?auto_18599 ) ) ( not ( = ?auto_18577 ?auto_18587 ) ) ( not ( = ?auto_18577 ?auto_18598 ) ) ( not ( = ?auto_18577 ?auto_18594 ) ) ( not ( = ?auto_18577 ?auto_18588 ) ) ( not ( = ?auto_18577 ?auto_18605 ) ) ( not ( = ?auto_18577 ?auto_18606 ) ) ( not ( = ?auto_18590 ?auto_18586 ) ) ( not ( = ?auto_18590 ?auto_18595 ) ) ( not ( = ?auto_18590 ?auto_18583 ) ) ( not ( = ?auto_18590 ?auto_18612 ) ) ( not ( = ?auto_18590 ?auto_18607 ) ) ( not ( = ?auto_18590 ?auto_18597 ) ) ( not ( = ?auto_18590 ?auto_18601 ) ) ( not ( = ?auto_18590 ?auto_18613 ) ) ( not ( = ?auto_18590 ?auto_18608 ) ) ( not ( = ?auto_18591 ?auto_18589 ) ) ( not ( = ?auto_18591 ?auto_18585 ) ) ( not ( = ?auto_18591 ?auto_18582 ) ) ( not ( = ?auto_18591 ?auto_18602 ) ) ( not ( = ?auto_18591 ?auto_18604 ) ) ( not ( = ?auto_18591 ?auto_18603 ) ) ( not ( = ?auto_18591 ?auto_18610 ) ) ( not ( = ?auto_18591 ?auto_18584 ) ) ( not ( = ?auto_18591 ?auto_18609 ) ) ( not ( = ?auto_18611 ?auto_18596 ) ) ( not ( = ?auto_18611 ?auto_18614 ) ) ( not ( = ?auto_18611 ?auto_18600 ) ) ( not ( = ?auto_18611 ?auto_18592 ) ) ( not ( = ?auto_18611 ?auto_18593 ) ) ( not ( = ?auto_18611 ?auto_18599 ) ) ( not ( = ?auto_18611 ?auto_18587 ) ) ( not ( = ?auto_18611 ?auto_18598 ) ) ( not ( = ?auto_18611 ?auto_18594 ) ) ( not ( = ?auto_18611 ?auto_18588 ) ) ( not ( = ?auto_18611 ?auto_18605 ) ) ( not ( = ?auto_18611 ?auto_18606 ) ) ( not ( = ?auto_18563 ?auto_18576 ) ) ( not ( = ?auto_18563 ?auto_18581 ) ) ( not ( = ?auto_18564 ?auto_18576 ) ) ( not ( = ?auto_18564 ?auto_18581 ) ) ( not ( = ?auto_18565 ?auto_18576 ) ) ( not ( = ?auto_18565 ?auto_18581 ) ) ( not ( = ?auto_18566 ?auto_18576 ) ) ( not ( = ?auto_18566 ?auto_18581 ) ) ( not ( = ?auto_18567 ?auto_18576 ) ) ( not ( = ?auto_18567 ?auto_18581 ) ) ( not ( = ?auto_18568 ?auto_18576 ) ) ( not ( = ?auto_18568 ?auto_18581 ) ) ( not ( = ?auto_18569 ?auto_18576 ) ) ( not ( = ?auto_18569 ?auto_18581 ) ) ( not ( = ?auto_18570 ?auto_18576 ) ) ( not ( = ?auto_18570 ?auto_18581 ) ) ( not ( = ?auto_18571 ?auto_18576 ) ) ( not ( = ?auto_18571 ?auto_18581 ) ) ( not ( = ?auto_18572 ?auto_18576 ) ) ( not ( = ?auto_18572 ?auto_18581 ) ) ( not ( = ?auto_18573 ?auto_18576 ) ) ( not ( = ?auto_18573 ?auto_18581 ) ) ( not ( = ?auto_18574 ?auto_18576 ) ) ( not ( = ?auto_18574 ?auto_18581 ) ) ( not ( = ?auto_18575 ?auto_18576 ) ) ( not ( = ?auto_18575 ?auto_18581 ) ) ( not ( = ?auto_18576 ?auto_18611 ) ) ( not ( = ?auto_18576 ?auto_18596 ) ) ( not ( = ?auto_18576 ?auto_18614 ) ) ( not ( = ?auto_18576 ?auto_18600 ) ) ( not ( = ?auto_18576 ?auto_18592 ) ) ( not ( = ?auto_18576 ?auto_18593 ) ) ( not ( = ?auto_18576 ?auto_18599 ) ) ( not ( = ?auto_18576 ?auto_18587 ) ) ( not ( = ?auto_18576 ?auto_18598 ) ) ( not ( = ?auto_18576 ?auto_18594 ) ) ( not ( = ?auto_18576 ?auto_18588 ) ) ( not ( = ?auto_18576 ?auto_18605 ) ) ( not ( = ?auto_18576 ?auto_18606 ) ) ( not ( = ?auto_18581 ?auto_18611 ) ) ( not ( = ?auto_18581 ?auto_18596 ) ) ( not ( = ?auto_18581 ?auto_18614 ) ) ( not ( = ?auto_18581 ?auto_18600 ) ) ( not ( = ?auto_18581 ?auto_18592 ) ) ( not ( = ?auto_18581 ?auto_18593 ) ) ( not ( = ?auto_18581 ?auto_18599 ) ) ( not ( = ?auto_18581 ?auto_18587 ) ) ( not ( = ?auto_18581 ?auto_18598 ) ) ( not ( = ?auto_18581 ?auto_18594 ) ) ( not ( = ?auto_18581 ?auto_18588 ) ) ( not ( = ?auto_18581 ?auto_18605 ) ) ( not ( = ?auto_18581 ?auto_18606 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_18563 ?auto_18564 ?auto_18565 ?auto_18566 ?auto_18567 ?auto_18568 ?auto_18569 ?auto_18570 ?auto_18571 ?auto_18572 ?auto_18573 ?auto_18574 ?auto_18575 ?auto_18577 )
      ( MAKE-1CRATE ?auto_18577 ?auto_18576 )
      ( MAKE-14CRATE-VERIFY ?auto_18563 ?auto_18564 ?auto_18565 ?auto_18566 ?auto_18567 ?auto_18568 ?auto_18569 ?auto_18570 ?auto_18571 ?auto_18572 ?auto_18573 ?auto_18574 ?auto_18575 ?auto_18577 ?auto_18576 ) )
  )

)

