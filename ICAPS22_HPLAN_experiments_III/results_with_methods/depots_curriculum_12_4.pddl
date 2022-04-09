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
      ?auto_12954 - SURFACE
      ?auto_12955 - SURFACE
    )
    :vars
    (
      ?auto_12956 - HOIST
      ?auto_12957 - PLACE
      ?auto_12959 - PLACE
      ?auto_12960 - HOIST
      ?auto_12961 - SURFACE
      ?auto_12958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12956 ?auto_12957 ) ( SURFACE-AT ?auto_12954 ?auto_12957 ) ( CLEAR ?auto_12954 ) ( IS-CRATE ?auto_12955 ) ( AVAILABLE ?auto_12956 ) ( not ( = ?auto_12959 ?auto_12957 ) ) ( HOIST-AT ?auto_12960 ?auto_12959 ) ( AVAILABLE ?auto_12960 ) ( SURFACE-AT ?auto_12955 ?auto_12959 ) ( ON ?auto_12955 ?auto_12961 ) ( CLEAR ?auto_12955 ) ( TRUCK-AT ?auto_12958 ?auto_12957 ) ( not ( = ?auto_12954 ?auto_12955 ) ) ( not ( = ?auto_12954 ?auto_12961 ) ) ( not ( = ?auto_12955 ?auto_12961 ) ) ( not ( = ?auto_12956 ?auto_12960 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12958 ?auto_12957 ?auto_12959 )
      ( !LIFT ?auto_12960 ?auto_12955 ?auto_12961 ?auto_12959 )
      ( !LOAD ?auto_12960 ?auto_12955 ?auto_12958 ?auto_12959 )
      ( !DRIVE ?auto_12958 ?auto_12959 ?auto_12957 )
      ( !UNLOAD ?auto_12956 ?auto_12955 ?auto_12958 ?auto_12957 )
      ( !DROP ?auto_12956 ?auto_12955 ?auto_12954 ?auto_12957 )
      ( MAKE-1CRATE-VERIFY ?auto_12954 ?auto_12955 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12964 - SURFACE
      ?auto_12965 - SURFACE
    )
    :vars
    (
      ?auto_12966 - HOIST
      ?auto_12967 - PLACE
      ?auto_12969 - PLACE
      ?auto_12970 - HOIST
      ?auto_12971 - SURFACE
      ?auto_12968 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12966 ?auto_12967 ) ( SURFACE-AT ?auto_12964 ?auto_12967 ) ( CLEAR ?auto_12964 ) ( IS-CRATE ?auto_12965 ) ( AVAILABLE ?auto_12966 ) ( not ( = ?auto_12969 ?auto_12967 ) ) ( HOIST-AT ?auto_12970 ?auto_12969 ) ( AVAILABLE ?auto_12970 ) ( SURFACE-AT ?auto_12965 ?auto_12969 ) ( ON ?auto_12965 ?auto_12971 ) ( CLEAR ?auto_12965 ) ( TRUCK-AT ?auto_12968 ?auto_12967 ) ( not ( = ?auto_12964 ?auto_12965 ) ) ( not ( = ?auto_12964 ?auto_12971 ) ) ( not ( = ?auto_12965 ?auto_12971 ) ) ( not ( = ?auto_12966 ?auto_12970 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12968 ?auto_12967 ?auto_12969 )
      ( !LIFT ?auto_12970 ?auto_12965 ?auto_12971 ?auto_12969 )
      ( !LOAD ?auto_12970 ?auto_12965 ?auto_12968 ?auto_12969 )
      ( !DRIVE ?auto_12968 ?auto_12969 ?auto_12967 )
      ( !UNLOAD ?auto_12966 ?auto_12965 ?auto_12968 ?auto_12967 )
      ( !DROP ?auto_12966 ?auto_12965 ?auto_12964 ?auto_12967 )
      ( MAKE-1CRATE-VERIFY ?auto_12964 ?auto_12965 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12975 - SURFACE
      ?auto_12976 - SURFACE
      ?auto_12977 - SURFACE
    )
    :vars
    (
      ?auto_12980 - HOIST
      ?auto_12979 - PLACE
      ?auto_12978 - PLACE
      ?auto_12982 - HOIST
      ?auto_12983 - SURFACE
      ?auto_12986 - PLACE
      ?auto_12984 - HOIST
      ?auto_12985 - SURFACE
      ?auto_12981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12980 ?auto_12979 ) ( IS-CRATE ?auto_12977 ) ( not ( = ?auto_12978 ?auto_12979 ) ) ( HOIST-AT ?auto_12982 ?auto_12978 ) ( AVAILABLE ?auto_12982 ) ( SURFACE-AT ?auto_12977 ?auto_12978 ) ( ON ?auto_12977 ?auto_12983 ) ( CLEAR ?auto_12977 ) ( not ( = ?auto_12976 ?auto_12977 ) ) ( not ( = ?auto_12976 ?auto_12983 ) ) ( not ( = ?auto_12977 ?auto_12983 ) ) ( not ( = ?auto_12980 ?auto_12982 ) ) ( SURFACE-AT ?auto_12975 ?auto_12979 ) ( CLEAR ?auto_12975 ) ( IS-CRATE ?auto_12976 ) ( AVAILABLE ?auto_12980 ) ( not ( = ?auto_12986 ?auto_12979 ) ) ( HOIST-AT ?auto_12984 ?auto_12986 ) ( AVAILABLE ?auto_12984 ) ( SURFACE-AT ?auto_12976 ?auto_12986 ) ( ON ?auto_12976 ?auto_12985 ) ( CLEAR ?auto_12976 ) ( TRUCK-AT ?auto_12981 ?auto_12979 ) ( not ( = ?auto_12975 ?auto_12976 ) ) ( not ( = ?auto_12975 ?auto_12985 ) ) ( not ( = ?auto_12976 ?auto_12985 ) ) ( not ( = ?auto_12980 ?auto_12984 ) ) ( not ( = ?auto_12975 ?auto_12977 ) ) ( not ( = ?auto_12975 ?auto_12983 ) ) ( not ( = ?auto_12977 ?auto_12985 ) ) ( not ( = ?auto_12978 ?auto_12986 ) ) ( not ( = ?auto_12982 ?auto_12984 ) ) ( not ( = ?auto_12983 ?auto_12985 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12975 ?auto_12976 )
      ( MAKE-1CRATE ?auto_12976 ?auto_12977 )
      ( MAKE-2CRATE-VERIFY ?auto_12975 ?auto_12976 ?auto_12977 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12989 - SURFACE
      ?auto_12990 - SURFACE
    )
    :vars
    (
      ?auto_12991 - HOIST
      ?auto_12992 - PLACE
      ?auto_12994 - PLACE
      ?auto_12995 - HOIST
      ?auto_12996 - SURFACE
      ?auto_12993 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12991 ?auto_12992 ) ( SURFACE-AT ?auto_12989 ?auto_12992 ) ( CLEAR ?auto_12989 ) ( IS-CRATE ?auto_12990 ) ( AVAILABLE ?auto_12991 ) ( not ( = ?auto_12994 ?auto_12992 ) ) ( HOIST-AT ?auto_12995 ?auto_12994 ) ( AVAILABLE ?auto_12995 ) ( SURFACE-AT ?auto_12990 ?auto_12994 ) ( ON ?auto_12990 ?auto_12996 ) ( CLEAR ?auto_12990 ) ( TRUCK-AT ?auto_12993 ?auto_12992 ) ( not ( = ?auto_12989 ?auto_12990 ) ) ( not ( = ?auto_12989 ?auto_12996 ) ) ( not ( = ?auto_12990 ?auto_12996 ) ) ( not ( = ?auto_12991 ?auto_12995 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12993 ?auto_12992 ?auto_12994 )
      ( !LIFT ?auto_12995 ?auto_12990 ?auto_12996 ?auto_12994 )
      ( !LOAD ?auto_12995 ?auto_12990 ?auto_12993 ?auto_12994 )
      ( !DRIVE ?auto_12993 ?auto_12994 ?auto_12992 )
      ( !UNLOAD ?auto_12991 ?auto_12990 ?auto_12993 ?auto_12992 )
      ( !DROP ?auto_12991 ?auto_12990 ?auto_12989 ?auto_12992 )
      ( MAKE-1CRATE-VERIFY ?auto_12989 ?auto_12990 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13001 - SURFACE
      ?auto_13002 - SURFACE
      ?auto_13003 - SURFACE
      ?auto_13004 - SURFACE
    )
    :vars
    (
      ?auto_13008 - HOIST
      ?auto_13006 - PLACE
      ?auto_13007 - PLACE
      ?auto_13010 - HOIST
      ?auto_13005 - SURFACE
      ?auto_13015 - PLACE
      ?auto_13016 - HOIST
      ?auto_13014 - SURFACE
      ?auto_13012 - PLACE
      ?auto_13011 - HOIST
      ?auto_13013 - SURFACE
      ?auto_13009 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13008 ?auto_13006 ) ( IS-CRATE ?auto_13004 ) ( not ( = ?auto_13007 ?auto_13006 ) ) ( HOIST-AT ?auto_13010 ?auto_13007 ) ( AVAILABLE ?auto_13010 ) ( SURFACE-AT ?auto_13004 ?auto_13007 ) ( ON ?auto_13004 ?auto_13005 ) ( CLEAR ?auto_13004 ) ( not ( = ?auto_13003 ?auto_13004 ) ) ( not ( = ?auto_13003 ?auto_13005 ) ) ( not ( = ?auto_13004 ?auto_13005 ) ) ( not ( = ?auto_13008 ?auto_13010 ) ) ( IS-CRATE ?auto_13003 ) ( not ( = ?auto_13015 ?auto_13006 ) ) ( HOIST-AT ?auto_13016 ?auto_13015 ) ( AVAILABLE ?auto_13016 ) ( SURFACE-AT ?auto_13003 ?auto_13015 ) ( ON ?auto_13003 ?auto_13014 ) ( CLEAR ?auto_13003 ) ( not ( = ?auto_13002 ?auto_13003 ) ) ( not ( = ?auto_13002 ?auto_13014 ) ) ( not ( = ?auto_13003 ?auto_13014 ) ) ( not ( = ?auto_13008 ?auto_13016 ) ) ( SURFACE-AT ?auto_13001 ?auto_13006 ) ( CLEAR ?auto_13001 ) ( IS-CRATE ?auto_13002 ) ( AVAILABLE ?auto_13008 ) ( not ( = ?auto_13012 ?auto_13006 ) ) ( HOIST-AT ?auto_13011 ?auto_13012 ) ( AVAILABLE ?auto_13011 ) ( SURFACE-AT ?auto_13002 ?auto_13012 ) ( ON ?auto_13002 ?auto_13013 ) ( CLEAR ?auto_13002 ) ( TRUCK-AT ?auto_13009 ?auto_13006 ) ( not ( = ?auto_13001 ?auto_13002 ) ) ( not ( = ?auto_13001 ?auto_13013 ) ) ( not ( = ?auto_13002 ?auto_13013 ) ) ( not ( = ?auto_13008 ?auto_13011 ) ) ( not ( = ?auto_13001 ?auto_13003 ) ) ( not ( = ?auto_13001 ?auto_13014 ) ) ( not ( = ?auto_13003 ?auto_13013 ) ) ( not ( = ?auto_13015 ?auto_13012 ) ) ( not ( = ?auto_13016 ?auto_13011 ) ) ( not ( = ?auto_13014 ?auto_13013 ) ) ( not ( = ?auto_13001 ?auto_13004 ) ) ( not ( = ?auto_13001 ?auto_13005 ) ) ( not ( = ?auto_13002 ?auto_13004 ) ) ( not ( = ?auto_13002 ?auto_13005 ) ) ( not ( = ?auto_13004 ?auto_13014 ) ) ( not ( = ?auto_13004 ?auto_13013 ) ) ( not ( = ?auto_13007 ?auto_13015 ) ) ( not ( = ?auto_13007 ?auto_13012 ) ) ( not ( = ?auto_13010 ?auto_13016 ) ) ( not ( = ?auto_13010 ?auto_13011 ) ) ( not ( = ?auto_13005 ?auto_13014 ) ) ( not ( = ?auto_13005 ?auto_13013 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13001 ?auto_13002 ?auto_13003 )
      ( MAKE-1CRATE ?auto_13003 ?auto_13004 )
      ( MAKE-3CRATE-VERIFY ?auto_13001 ?auto_13002 ?auto_13003 ?auto_13004 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13019 - SURFACE
      ?auto_13020 - SURFACE
    )
    :vars
    (
      ?auto_13021 - HOIST
      ?auto_13022 - PLACE
      ?auto_13024 - PLACE
      ?auto_13025 - HOIST
      ?auto_13026 - SURFACE
      ?auto_13023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13021 ?auto_13022 ) ( SURFACE-AT ?auto_13019 ?auto_13022 ) ( CLEAR ?auto_13019 ) ( IS-CRATE ?auto_13020 ) ( AVAILABLE ?auto_13021 ) ( not ( = ?auto_13024 ?auto_13022 ) ) ( HOIST-AT ?auto_13025 ?auto_13024 ) ( AVAILABLE ?auto_13025 ) ( SURFACE-AT ?auto_13020 ?auto_13024 ) ( ON ?auto_13020 ?auto_13026 ) ( CLEAR ?auto_13020 ) ( TRUCK-AT ?auto_13023 ?auto_13022 ) ( not ( = ?auto_13019 ?auto_13020 ) ) ( not ( = ?auto_13019 ?auto_13026 ) ) ( not ( = ?auto_13020 ?auto_13026 ) ) ( not ( = ?auto_13021 ?auto_13025 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13023 ?auto_13022 ?auto_13024 )
      ( !LIFT ?auto_13025 ?auto_13020 ?auto_13026 ?auto_13024 )
      ( !LOAD ?auto_13025 ?auto_13020 ?auto_13023 ?auto_13024 )
      ( !DRIVE ?auto_13023 ?auto_13024 ?auto_13022 )
      ( !UNLOAD ?auto_13021 ?auto_13020 ?auto_13023 ?auto_13022 )
      ( !DROP ?auto_13021 ?auto_13020 ?auto_13019 ?auto_13022 )
      ( MAKE-1CRATE-VERIFY ?auto_13019 ?auto_13020 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13032 - SURFACE
      ?auto_13033 - SURFACE
      ?auto_13034 - SURFACE
      ?auto_13035 - SURFACE
      ?auto_13036 - SURFACE
    )
    :vars
    (
      ?auto_13038 - HOIST
      ?auto_13041 - PLACE
      ?auto_13040 - PLACE
      ?auto_13039 - HOIST
      ?auto_13042 - SURFACE
      ?auto_13043 - PLACE
      ?auto_13051 - HOIST
      ?auto_13044 - SURFACE
      ?auto_13045 - PLACE
      ?auto_13050 - HOIST
      ?auto_13048 - SURFACE
      ?auto_13047 - PLACE
      ?auto_13046 - HOIST
      ?auto_13049 - SURFACE
      ?auto_13037 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13038 ?auto_13041 ) ( IS-CRATE ?auto_13036 ) ( not ( = ?auto_13040 ?auto_13041 ) ) ( HOIST-AT ?auto_13039 ?auto_13040 ) ( AVAILABLE ?auto_13039 ) ( SURFACE-AT ?auto_13036 ?auto_13040 ) ( ON ?auto_13036 ?auto_13042 ) ( CLEAR ?auto_13036 ) ( not ( = ?auto_13035 ?auto_13036 ) ) ( not ( = ?auto_13035 ?auto_13042 ) ) ( not ( = ?auto_13036 ?auto_13042 ) ) ( not ( = ?auto_13038 ?auto_13039 ) ) ( IS-CRATE ?auto_13035 ) ( not ( = ?auto_13043 ?auto_13041 ) ) ( HOIST-AT ?auto_13051 ?auto_13043 ) ( AVAILABLE ?auto_13051 ) ( SURFACE-AT ?auto_13035 ?auto_13043 ) ( ON ?auto_13035 ?auto_13044 ) ( CLEAR ?auto_13035 ) ( not ( = ?auto_13034 ?auto_13035 ) ) ( not ( = ?auto_13034 ?auto_13044 ) ) ( not ( = ?auto_13035 ?auto_13044 ) ) ( not ( = ?auto_13038 ?auto_13051 ) ) ( IS-CRATE ?auto_13034 ) ( not ( = ?auto_13045 ?auto_13041 ) ) ( HOIST-AT ?auto_13050 ?auto_13045 ) ( AVAILABLE ?auto_13050 ) ( SURFACE-AT ?auto_13034 ?auto_13045 ) ( ON ?auto_13034 ?auto_13048 ) ( CLEAR ?auto_13034 ) ( not ( = ?auto_13033 ?auto_13034 ) ) ( not ( = ?auto_13033 ?auto_13048 ) ) ( not ( = ?auto_13034 ?auto_13048 ) ) ( not ( = ?auto_13038 ?auto_13050 ) ) ( SURFACE-AT ?auto_13032 ?auto_13041 ) ( CLEAR ?auto_13032 ) ( IS-CRATE ?auto_13033 ) ( AVAILABLE ?auto_13038 ) ( not ( = ?auto_13047 ?auto_13041 ) ) ( HOIST-AT ?auto_13046 ?auto_13047 ) ( AVAILABLE ?auto_13046 ) ( SURFACE-AT ?auto_13033 ?auto_13047 ) ( ON ?auto_13033 ?auto_13049 ) ( CLEAR ?auto_13033 ) ( TRUCK-AT ?auto_13037 ?auto_13041 ) ( not ( = ?auto_13032 ?auto_13033 ) ) ( not ( = ?auto_13032 ?auto_13049 ) ) ( not ( = ?auto_13033 ?auto_13049 ) ) ( not ( = ?auto_13038 ?auto_13046 ) ) ( not ( = ?auto_13032 ?auto_13034 ) ) ( not ( = ?auto_13032 ?auto_13048 ) ) ( not ( = ?auto_13034 ?auto_13049 ) ) ( not ( = ?auto_13045 ?auto_13047 ) ) ( not ( = ?auto_13050 ?auto_13046 ) ) ( not ( = ?auto_13048 ?auto_13049 ) ) ( not ( = ?auto_13032 ?auto_13035 ) ) ( not ( = ?auto_13032 ?auto_13044 ) ) ( not ( = ?auto_13033 ?auto_13035 ) ) ( not ( = ?auto_13033 ?auto_13044 ) ) ( not ( = ?auto_13035 ?auto_13048 ) ) ( not ( = ?auto_13035 ?auto_13049 ) ) ( not ( = ?auto_13043 ?auto_13045 ) ) ( not ( = ?auto_13043 ?auto_13047 ) ) ( not ( = ?auto_13051 ?auto_13050 ) ) ( not ( = ?auto_13051 ?auto_13046 ) ) ( not ( = ?auto_13044 ?auto_13048 ) ) ( not ( = ?auto_13044 ?auto_13049 ) ) ( not ( = ?auto_13032 ?auto_13036 ) ) ( not ( = ?auto_13032 ?auto_13042 ) ) ( not ( = ?auto_13033 ?auto_13036 ) ) ( not ( = ?auto_13033 ?auto_13042 ) ) ( not ( = ?auto_13034 ?auto_13036 ) ) ( not ( = ?auto_13034 ?auto_13042 ) ) ( not ( = ?auto_13036 ?auto_13044 ) ) ( not ( = ?auto_13036 ?auto_13048 ) ) ( not ( = ?auto_13036 ?auto_13049 ) ) ( not ( = ?auto_13040 ?auto_13043 ) ) ( not ( = ?auto_13040 ?auto_13045 ) ) ( not ( = ?auto_13040 ?auto_13047 ) ) ( not ( = ?auto_13039 ?auto_13051 ) ) ( not ( = ?auto_13039 ?auto_13050 ) ) ( not ( = ?auto_13039 ?auto_13046 ) ) ( not ( = ?auto_13042 ?auto_13044 ) ) ( not ( = ?auto_13042 ?auto_13048 ) ) ( not ( = ?auto_13042 ?auto_13049 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_13032 ?auto_13033 ?auto_13034 ?auto_13035 )
      ( MAKE-1CRATE ?auto_13035 ?auto_13036 )
      ( MAKE-4CRATE-VERIFY ?auto_13032 ?auto_13033 ?auto_13034 ?auto_13035 ?auto_13036 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13054 - SURFACE
      ?auto_13055 - SURFACE
    )
    :vars
    (
      ?auto_13056 - HOIST
      ?auto_13057 - PLACE
      ?auto_13059 - PLACE
      ?auto_13060 - HOIST
      ?auto_13061 - SURFACE
      ?auto_13058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13056 ?auto_13057 ) ( SURFACE-AT ?auto_13054 ?auto_13057 ) ( CLEAR ?auto_13054 ) ( IS-CRATE ?auto_13055 ) ( AVAILABLE ?auto_13056 ) ( not ( = ?auto_13059 ?auto_13057 ) ) ( HOIST-AT ?auto_13060 ?auto_13059 ) ( AVAILABLE ?auto_13060 ) ( SURFACE-AT ?auto_13055 ?auto_13059 ) ( ON ?auto_13055 ?auto_13061 ) ( CLEAR ?auto_13055 ) ( TRUCK-AT ?auto_13058 ?auto_13057 ) ( not ( = ?auto_13054 ?auto_13055 ) ) ( not ( = ?auto_13054 ?auto_13061 ) ) ( not ( = ?auto_13055 ?auto_13061 ) ) ( not ( = ?auto_13056 ?auto_13060 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13058 ?auto_13057 ?auto_13059 )
      ( !LIFT ?auto_13060 ?auto_13055 ?auto_13061 ?auto_13059 )
      ( !LOAD ?auto_13060 ?auto_13055 ?auto_13058 ?auto_13059 )
      ( !DRIVE ?auto_13058 ?auto_13059 ?auto_13057 )
      ( !UNLOAD ?auto_13056 ?auto_13055 ?auto_13058 ?auto_13057 )
      ( !DROP ?auto_13056 ?auto_13055 ?auto_13054 ?auto_13057 )
      ( MAKE-1CRATE-VERIFY ?auto_13054 ?auto_13055 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_13068 - SURFACE
      ?auto_13069 - SURFACE
      ?auto_13070 - SURFACE
      ?auto_13071 - SURFACE
      ?auto_13072 - SURFACE
      ?auto_13073 - SURFACE
    )
    :vars
    (
      ?auto_13079 - HOIST
      ?auto_13075 - PLACE
      ?auto_13078 - PLACE
      ?auto_13076 - HOIST
      ?auto_13074 - SURFACE
      ?auto_13088 - PLACE
      ?auto_13086 - HOIST
      ?auto_13091 - SURFACE
      ?auto_13084 - PLACE
      ?auto_13090 - HOIST
      ?auto_13081 - SURFACE
      ?auto_13083 - PLACE
      ?auto_13085 - HOIST
      ?auto_13089 - SURFACE
      ?auto_13080 - PLACE
      ?auto_13082 - HOIST
      ?auto_13087 - SURFACE
      ?auto_13077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13079 ?auto_13075 ) ( IS-CRATE ?auto_13073 ) ( not ( = ?auto_13078 ?auto_13075 ) ) ( HOIST-AT ?auto_13076 ?auto_13078 ) ( AVAILABLE ?auto_13076 ) ( SURFACE-AT ?auto_13073 ?auto_13078 ) ( ON ?auto_13073 ?auto_13074 ) ( CLEAR ?auto_13073 ) ( not ( = ?auto_13072 ?auto_13073 ) ) ( not ( = ?auto_13072 ?auto_13074 ) ) ( not ( = ?auto_13073 ?auto_13074 ) ) ( not ( = ?auto_13079 ?auto_13076 ) ) ( IS-CRATE ?auto_13072 ) ( not ( = ?auto_13088 ?auto_13075 ) ) ( HOIST-AT ?auto_13086 ?auto_13088 ) ( AVAILABLE ?auto_13086 ) ( SURFACE-AT ?auto_13072 ?auto_13088 ) ( ON ?auto_13072 ?auto_13091 ) ( CLEAR ?auto_13072 ) ( not ( = ?auto_13071 ?auto_13072 ) ) ( not ( = ?auto_13071 ?auto_13091 ) ) ( not ( = ?auto_13072 ?auto_13091 ) ) ( not ( = ?auto_13079 ?auto_13086 ) ) ( IS-CRATE ?auto_13071 ) ( not ( = ?auto_13084 ?auto_13075 ) ) ( HOIST-AT ?auto_13090 ?auto_13084 ) ( AVAILABLE ?auto_13090 ) ( SURFACE-AT ?auto_13071 ?auto_13084 ) ( ON ?auto_13071 ?auto_13081 ) ( CLEAR ?auto_13071 ) ( not ( = ?auto_13070 ?auto_13071 ) ) ( not ( = ?auto_13070 ?auto_13081 ) ) ( not ( = ?auto_13071 ?auto_13081 ) ) ( not ( = ?auto_13079 ?auto_13090 ) ) ( IS-CRATE ?auto_13070 ) ( not ( = ?auto_13083 ?auto_13075 ) ) ( HOIST-AT ?auto_13085 ?auto_13083 ) ( AVAILABLE ?auto_13085 ) ( SURFACE-AT ?auto_13070 ?auto_13083 ) ( ON ?auto_13070 ?auto_13089 ) ( CLEAR ?auto_13070 ) ( not ( = ?auto_13069 ?auto_13070 ) ) ( not ( = ?auto_13069 ?auto_13089 ) ) ( not ( = ?auto_13070 ?auto_13089 ) ) ( not ( = ?auto_13079 ?auto_13085 ) ) ( SURFACE-AT ?auto_13068 ?auto_13075 ) ( CLEAR ?auto_13068 ) ( IS-CRATE ?auto_13069 ) ( AVAILABLE ?auto_13079 ) ( not ( = ?auto_13080 ?auto_13075 ) ) ( HOIST-AT ?auto_13082 ?auto_13080 ) ( AVAILABLE ?auto_13082 ) ( SURFACE-AT ?auto_13069 ?auto_13080 ) ( ON ?auto_13069 ?auto_13087 ) ( CLEAR ?auto_13069 ) ( TRUCK-AT ?auto_13077 ?auto_13075 ) ( not ( = ?auto_13068 ?auto_13069 ) ) ( not ( = ?auto_13068 ?auto_13087 ) ) ( not ( = ?auto_13069 ?auto_13087 ) ) ( not ( = ?auto_13079 ?auto_13082 ) ) ( not ( = ?auto_13068 ?auto_13070 ) ) ( not ( = ?auto_13068 ?auto_13089 ) ) ( not ( = ?auto_13070 ?auto_13087 ) ) ( not ( = ?auto_13083 ?auto_13080 ) ) ( not ( = ?auto_13085 ?auto_13082 ) ) ( not ( = ?auto_13089 ?auto_13087 ) ) ( not ( = ?auto_13068 ?auto_13071 ) ) ( not ( = ?auto_13068 ?auto_13081 ) ) ( not ( = ?auto_13069 ?auto_13071 ) ) ( not ( = ?auto_13069 ?auto_13081 ) ) ( not ( = ?auto_13071 ?auto_13089 ) ) ( not ( = ?auto_13071 ?auto_13087 ) ) ( not ( = ?auto_13084 ?auto_13083 ) ) ( not ( = ?auto_13084 ?auto_13080 ) ) ( not ( = ?auto_13090 ?auto_13085 ) ) ( not ( = ?auto_13090 ?auto_13082 ) ) ( not ( = ?auto_13081 ?auto_13089 ) ) ( not ( = ?auto_13081 ?auto_13087 ) ) ( not ( = ?auto_13068 ?auto_13072 ) ) ( not ( = ?auto_13068 ?auto_13091 ) ) ( not ( = ?auto_13069 ?auto_13072 ) ) ( not ( = ?auto_13069 ?auto_13091 ) ) ( not ( = ?auto_13070 ?auto_13072 ) ) ( not ( = ?auto_13070 ?auto_13091 ) ) ( not ( = ?auto_13072 ?auto_13081 ) ) ( not ( = ?auto_13072 ?auto_13089 ) ) ( not ( = ?auto_13072 ?auto_13087 ) ) ( not ( = ?auto_13088 ?auto_13084 ) ) ( not ( = ?auto_13088 ?auto_13083 ) ) ( not ( = ?auto_13088 ?auto_13080 ) ) ( not ( = ?auto_13086 ?auto_13090 ) ) ( not ( = ?auto_13086 ?auto_13085 ) ) ( not ( = ?auto_13086 ?auto_13082 ) ) ( not ( = ?auto_13091 ?auto_13081 ) ) ( not ( = ?auto_13091 ?auto_13089 ) ) ( not ( = ?auto_13091 ?auto_13087 ) ) ( not ( = ?auto_13068 ?auto_13073 ) ) ( not ( = ?auto_13068 ?auto_13074 ) ) ( not ( = ?auto_13069 ?auto_13073 ) ) ( not ( = ?auto_13069 ?auto_13074 ) ) ( not ( = ?auto_13070 ?auto_13073 ) ) ( not ( = ?auto_13070 ?auto_13074 ) ) ( not ( = ?auto_13071 ?auto_13073 ) ) ( not ( = ?auto_13071 ?auto_13074 ) ) ( not ( = ?auto_13073 ?auto_13091 ) ) ( not ( = ?auto_13073 ?auto_13081 ) ) ( not ( = ?auto_13073 ?auto_13089 ) ) ( not ( = ?auto_13073 ?auto_13087 ) ) ( not ( = ?auto_13078 ?auto_13088 ) ) ( not ( = ?auto_13078 ?auto_13084 ) ) ( not ( = ?auto_13078 ?auto_13083 ) ) ( not ( = ?auto_13078 ?auto_13080 ) ) ( not ( = ?auto_13076 ?auto_13086 ) ) ( not ( = ?auto_13076 ?auto_13090 ) ) ( not ( = ?auto_13076 ?auto_13085 ) ) ( not ( = ?auto_13076 ?auto_13082 ) ) ( not ( = ?auto_13074 ?auto_13091 ) ) ( not ( = ?auto_13074 ?auto_13081 ) ) ( not ( = ?auto_13074 ?auto_13089 ) ) ( not ( = ?auto_13074 ?auto_13087 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_13068 ?auto_13069 ?auto_13070 ?auto_13071 ?auto_13072 )
      ( MAKE-1CRATE ?auto_13072 ?auto_13073 )
      ( MAKE-5CRATE-VERIFY ?auto_13068 ?auto_13069 ?auto_13070 ?auto_13071 ?auto_13072 ?auto_13073 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13094 - SURFACE
      ?auto_13095 - SURFACE
    )
    :vars
    (
      ?auto_13096 - HOIST
      ?auto_13097 - PLACE
      ?auto_13099 - PLACE
      ?auto_13100 - HOIST
      ?auto_13101 - SURFACE
      ?auto_13098 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13096 ?auto_13097 ) ( SURFACE-AT ?auto_13094 ?auto_13097 ) ( CLEAR ?auto_13094 ) ( IS-CRATE ?auto_13095 ) ( AVAILABLE ?auto_13096 ) ( not ( = ?auto_13099 ?auto_13097 ) ) ( HOIST-AT ?auto_13100 ?auto_13099 ) ( AVAILABLE ?auto_13100 ) ( SURFACE-AT ?auto_13095 ?auto_13099 ) ( ON ?auto_13095 ?auto_13101 ) ( CLEAR ?auto_13095 ) ( TRUCK-AT ?auto_13098 ?auto_13097 ) ( not ( = ?auto_13094 ?auto_13095 ) ) ( not ( = ?auto_13094 ?auto_13101 ) ) ( not ( = ?auto_13095 ?auto_13101 ) ) ( not ( = ?auto_13096 ?auto_13100 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13098 ?auto_13097 ?auto_13099 )
      ( !LIFT ?auto_13100 ?auto_13095 ?auto_13101 ?auto_13099 )
      ( !LOAD ?auto_13100 ?auto_13095 ?auto_13098 ?auto_13099 )
      ( !DRIVE ?auto_13098 ?auto_13099 ?auto_13097 )
      ( !UNLOAD ?auto_13096 ?auto_13095 ?auto_13098 ?auto_13097 )
      ( !DROP ?auto_13096 ?auto_13095 ?auto_13094 ?auto_13097 )
      ( MAKE-1CRATE-VERIFY ?auto_13094 ?auto_13095 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_13109 - SURFACE
      ?auto_13110 - SURFACE
      ?auto_13111 - SURFACE
      ?auto_13112 - SURFACE
      ?auto_13113 - SURFACE
      ?auto_13114 - SURFACE
      ?auto_13115 - SURFACE
    )
    :vars
    (
      ?auto_13121 - HOIST
      ?auto_13117 - PLACE
      ?auto_13116 - PLACE
      ?auto_13120 - HOIST
      ?auto_13118 - SURFACE
      ?auto_13134 - SURFACE
      ?auto_13129 - PLACE
      ?auto_13124 - HOIST
      ?auto_13127 - SURFACE
      ?auto_13125 - PLACE
      ?auto_13130 - HOIST
      ?auto_13132 - SURFACE
      ?auto_13128 - PLACE
      ?auto_13123 - HOIST
      ?auto_13133 - SURFACE
      ?auto_13131 - PLACE
      ?auto_13122 - HOIST
      ?auto_13126 - SURFACE
      ?auto_13119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13121 ?auto_13117 ) ( IS-CRATE ?auto_13115 ) ( not ( = ?auto_13116 ?auto_13117 ) ) ( HOIST-AT ?auto_13120 ?auto_13116 ) ( SURFACE-AT ?auto_13115 ?auto_13116 ) ( ON ?auto_13115 ?auto_13118 ) ( CLEAR ?auto_13115 ) ( not ( = ?auto_13114 ?auto_13115 ) ) ( not ( = ?auto_13114 ?auto_13118 ) ) ( not ( = ?auto_13115 ?auto_13118 ) ) ( not ( = ?auto_13121 ?auto_13120 ) ) ( IS-CRATE ?auto_13114 ) ( AVAILABLE ?auto_13120 ) ( SURFACE-AT ?auto_13114 ?auto_13116 ) ( ON ?auto_13114 ?auto_13134 ) ( CLEAR ?auto_13114 ) ( not ( = ?auto_13113 ?auto_13114 ) ) ( not ( = ?auto_13113 ?auto_13134 ) ) ( not ( = ?auto_13114 ?auto_13134 ) ) ( IS-CRATE ?auto_13113 ) ( not ( = ?auto_13129 ?auto_13117 ) ) ( HOIST-AT ?auto_13124 ?auto_13129 ) ( AVAILABLE ?auto_13124 ) ( SURFACE-AT ?auto_13113 ?auto_13129 ) ( ON ?auto_13113 ?auto_13127 ) ( CLEAR ?auto_13113 ) ( not ( = ?auto_13112 ?auto_13113 ) ) ( not ( = ?auto_13112 ?auto_13127 ) ) ( not ( = ?auto_13113 ?auto_13127 ) ) ( not ( = ?auto_13121 ?auto_13124 ) ) ( IS-CRATE ?auto_13112 ) ( not ( = ?auto_13125 ?auto_13117 ) ) ( HOIST-AT ?auto_13130 ?auto_13125 ) ( AVAILABLE ?auto_13130 ) ( SURFACE-AT ?auto_13112 ?auto_13125 ) ( ON ?auto_13112 ?auto_13132 ) ( CLEAR ?auto_13112 ) ( not ( = ?auto_13111 ?auto_13112 ) ) ( not ( = ?auto_13111 ?auto_13132 ) ) ( not ( = ?auto_13112 ?auto_13132 ) ) ( not ( = ?auto_13121 ?auto_13130 ) ) ( IS-CRATE ?auto_13111 ) ( not ( = ?auto_13128 ?auto_13117 ) ) ( HOIST-AT ?auto_13123 ?auto_13128 ) ( AVAILABLE ?auto_13123 ) ( SURFACE-AT ?auto_13111 ?auto_13128 ) ( ON ?auto_13111 ?auto_13133 ) ( CLEAR ?auto_13111 ) ( not ( = ?auto_13110 ?auto_13111 ) ) ( not ( = ?auto_13110 ?auto_13133 ) ) ( not ( = ?auto_13111 ?auto_13133 ) ) ( not ( = ?auto_13121 ?auto_13123 ) ) ( SURFACE-AT ?auto_13109 ?auto_13117 ) ( CLEAR ?auto_13109 ) ( IS-CRATE ?auto_13110 ) ( AVAILABLE ?auto_13121 ) ( not ( = ?auto_13131 ?auto_13117 ) ) ( HOIST-AT ?auto_13122 ?auto_13131 ) ( AVAILABLE ?auto_13122 ) ( SURFACE-AT ?auto_13110 ?auto_13131 ) ( ON ?auto_13110 ?auto_13126 ) ( CLEAR ?auto_13110 ) ( TRUCK-AT ?auto_13119 ?auto_13117 ) ( not ( = ?auto_13109 ?auto_13110 ) ) ( not ( = ?auto_13109 ?auto_13126 ) ) ( not ( = ?auto_13110 ?auto_13126 ) ) ( not ( = ?auto_13121 ?auto_13122 ) ) ( not ( = ?auto_13109 ?auto_13111 ) ) ( not ( = ?auto_13109 ?auto_13133 ) ) ( not ( = ?auto_13111 ?auto_13126 ) ) ( not ( = ?auto_13128 ?auto_13131 ) ) ( not ( = ?auto_13123 ?auto_13122 ) ) ( not ( = ?auto_13133 ?auto_13126 ) ) ( not ( = ?auto_13109 ?auto_13112 ) ) ( not ( = ?auto_13109 ?auto_13132 ) ) ( not ( = ?auto_13110 ?auto_13112 ) ) ( not ( = ?auto_13110 ?auto_13132 ) ) ( not ( = ?auto_13112 ?auto_13133 ) ) ( not ( = ?auto_13112 ?auto_13126 ) ) ( not ( = ?auto_13125 ?auto_13128 ) ) ( not ( = ?auto_13125 ?auto_13131 ) ) ( not ( = ?auto_13130 ?auto_13123 ) ) ( not ( = ?auto_13130 ?auto_13122 ) ) ( not ( = ?auto_13132 ?auto_13133 ) ) ( not ( = ?auto_13132 ?auto_13126 ) ) ( not ( = ?auto_13109 ?auto_13113 ) ) ( not ( = ?auto_13109 ?auto_13127 ) ) ( not ( = ?auto_13110 ?auto_13113 ) ) ( not ( = ?auto_13110 ?auto_13127 ) ) ( not ( = ?auto_13111 ?auto_13113 ) ) ( not ( = ?auto_13111 ?auto_13127 ) ) ( not ( = ?auto_13113 ?auto_13132 ) ) ( not ( = ?auto_13113 ?auto_13133 ) ) ( not ( = ?auto_13113 ?auto_13126 ) ) ( not ( = ?auto_13129 ?auto_13125 ) ) ( not ( = ?auto_13129 ?auto_13128 ) ) ( not ( = ?auto_13129 ?auto_13131 ) ) ( not ( = ?auto_13124 ?auto_13130 ) ) ( not ( = ?auto_13124 ?auto_13123 ) ) ( not ( = ?auto_13124 ?auto_13122 ) ) ( not ( = ?auto_13127 ?auto_13132 ) ) ( not ( = ?auto_13127 ?auto_13133 ) ) ( not ( = ?auto_13127 ?auto_13126 ) ) ( not ( = ?auto_13109 ?auto_13114 ) ) ( not ( = ?auto_13109 ?auto_13134 ) ) ( not ( = ?auto_13110 ?auto_13114 ) ) ( not ( = ?auto_13110 ?auto_13134 ) ) ( not ( = ?auto_13111 ?auto_13114 ) ) ( not ( = ?auto_13111 ?auto_13134 ) ) ( not ( = ?auto_13112 ?auto_13114 ) ) ( not ( = ?auto_13112 ?auto_13134 ) ) ( not ( = ?auto_13114 ?auto_13127 ) ) ( not ( = ?auto_13114 ?auto_13132 ) ) ( not ( = ?auto_13114 ?auto_13133 ) ) ( not ( = ?auto_13114 ?auto_13126 ) ) ( not ( = ?auto_13116 ?auto_13129 ) ) ( not ( = ?auto_13116 ?auto_13125 ) ) ( not ( = ?auto_13116 ?auto_13128 ) ) ( not ( = ?auto_13116 ?auto_13131 ) ) ( not ( = ?auto_13120 ?auto_13124 ) ) ( not ( = ?auto_13120 ?auto_13130 ) ) ( not ( = ?auto_13120 ?auto_13123 ) ) ( not ( = ?auto_13120 ?auto_13122 ) ) ( not ( = ?auto_13134 ?auto_13127 ) ) ( not ( = ?auto_13134 ?auto_13132 ) ) ( not ( = ?auto_13134 ?auto_13133 ) ) ( not ( = ?auto_13134 ?auto_13126 ) ) ( not ( = ?auto_13109 ?auto_13115 ) ) ( not ( = ?auto_13109 ?auto_13118 ) ) ( not ( = ?auto_13110 ?auto_13115 ) ) ( not ( = ?auto_13110 ?auto_13118 ) ) ( not ( = ?auto_13111 ?auto_13115 ) ) ( not ( = ?auto_13111 ?auto_13118 ) ) ( not ( = ?auto_13112 ?auto_13115 ) ) ( not ( = ?auto_13112 ?auto_13118 ) ) ( not ( = ?auto_13113 ?auto_13115 ) ) ( not ( = ?auto_13113 ?auto_13118 ) ) ( not ( = ?auto_13115 ?auto_13134 ) ) ( not ( = ?auto_13115 ?auto_13127 ) ) ( not ( = ?auto_13115 ?auto_13132 ) ) ( not ( = ?auto_13115 ?auto_13133 ) ) ( not ( = ?auto_13115 ?auto_13126 ) ) ( not ( = ?auto_13118 ?auto_13134 ) ) ( not ( = ?auto_13118 ?auto_13127 ) ) ( not ( = ?auto_13118 ?auto_13132 ) ) ( not ( = ?auto_13118 ?auto_13133 ) ) ( not ( = ?auto_13118 ?auto_13126 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_13109 ?auto_13110 ?auto_13111 ?auto_13112 ?auto_13113 ?auto_13114 )
      ( MAKE-1CRATE ?auto_13114 ?auto_13115 )
      ( MAKE-6CRATE-VERIFY ?auto_13109 ?auto_13110 ?auto_13111 ?auto_13112 ?auto_13113 ?auto_13114 ?auto_13115 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13137 - SURFACE
      ?auto_13138 - SURFACE
    )
    :vars
    (
      ?auto_13139 - HOIST
      ?auto_13140 - PLACE
      ?auto_13142 - PLACE
      ?auto_13143 - HOIST
      ?auto_13144 - SURFACE
      ?auto_13141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13139 ?auto_13140 ) ( SURFACE-AT ?auto_13137 ?auto_13140 ) ( CLEAR ?auto_13137 ) ( IS-CRATE ?auto_13138 ) ( AVAILABLE ?auto_13139 ) ( not ( = ?auto_13142 ?auto_13140 ) ) ( HOIST-AT ?auto_13143 ?auto_13142 ) ( AVAILABLE ?auto_13143 ) ( SURFACE-AT ?auto_13138 ?auto_13142 ) ( ON ?auto_13138 ?auto_13144 ) ( CLEAR ?auto_13138 ) ( TRUCK-AT ?auto_13141 ?auto_13140 ) ( not ( = ?auto_13137 ?auto_13138 ) ) ( not ( = ?auto_13137 ?auto_13144 ) ) ( not ( = ?auto_13138 ?auto_13144 ) ) ( not ( = ?auto_13139 ?auto_13143 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13141 ?auto_13140 ?auto_13142 )
      ( !LIFT ?auto_13143 ?auto_13138 ?auto_13144 ?auto_13142 )
      ( !LOAD ?auto_13143 ?auto_13138 ?auto_13141 ?auto_13142 )
      ( !DRIVE ?auto_13141 ?auto_13142 ?auto_13140 )
      ( !UNLOAD ?auto_13139 ?auto_13138 ?auto_13141 ?auto_13140 )
      ( !DROP ?auto_13139 ?auto_13138 ?auto_13137 ?auto_13140 )
      ( MAKE-1CRATE-VERIFY ?auto_13137 ?auto_13138 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_13153 - SURFACE
      ?auto_13154 - SURFACE
      ?auto_13155 - SURFACE
      ?auto_13156 - SURFACE
      ?auto_13157 - SURFACE
      ?auto_13158 - SURFACE
      ?auto_13159 - SURFACE
      ?auto_13160 - SURFACE
    )
    :vars
    (
      ?auto_13161 - HOIST
      ?auto_13165 - PLACE
      ?auto_13164 - PLACE
      ?auto_13166 - HOIST
      ?auto_13163 - SURFACE
      ?auto_13167 - PLACE
      ?auto_13180 - HOIST
      ?auto_13175 - SURFACE
      ?auto_13171 - SURFACE
      ?auto_13173 - SURFACE
      ?auto_13179 - PLACE
      ?auto_13176 - HOIST
      ?auto_13168 - SURFACE
      ?auto_13172 - PLACE
      ?auto_13178 - HOIST
      ?auto_13170 - SURFACE
      ?auto_13169 - PLACE
      ?auto_13174 - HOIST
      ?auto_13177 - SURFACE
      ?auto_13162 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13161 ?auto_13165 ) ( IS-CRATE ?auto_13160 ) ( not ( = ?auto_13164 ?auto_13165 ) ) ( HOIST-AT ?auto_13166 ?auto_13164 ) ( SURFACE-AT ?auto_13160 ?auto_13164 ) ( ON ?auto_13160 ?auto_13163 ) ( CLEAR ?auto_13160 ) ( not ( = ?auto_13159 ?auto_13160 ) ) ( not ( = ?auto_13159 ?auto_13163 ) ) ( not ( = ?auto_13160 ?auto_13163 ) ) ( not ( = ?auto_13161 ?auto_13166 ) ) ( IS-CRATE ?auto_13159 ) ( not ( = ?auto_13167 ?auto_13165 ) ) ( HOIST-AT ?auto_13180 ?auto_13167 ) ( SURFACE-AT ?auto_13159 ?auto_13167 ) ( ON ?auto_13159 ?auto_13175 ) ( CLEAR ?auto_13159 ) ( not ( = ?auto_13158 ?auto_13159 ) ) ( not ( = ?auto_13158 ?auto_13175 ) ) ( not ( = ?auto_13159 ?auto_13175 ) ) ( not ( = ?auto_13161 ?auto_13180 ) ) ( IS-CRATE ?auto_13158 ) ( AVAILABLE ?auto_13180 ) ( SURFACE-AT ?auto_13158 ?auto_13167 ) ( ON ?auto_13158 ?auto_13171 ) ( CLEAR ?auto_13158 ) ( not ( = ?auto_13157 ?auto_13158 ) ) ( not ( = ?auto_13157 ?auto_13171 ) ) ( not ( = ?auto_13158 ?auto_13171 ) ) ( IS-CRATE ?auto_13157 ) ( AVAILABLE ?auto_13166 ) ( SURFACE-AT ?auto_13157 ?auto_13164 ) ( ON ?auto_13157 ?auto_13173 ) ( CLEAR ?auto_13157 ) ( not ( = ?auto_13156 ?auto_13157 ) ) ( not ( = ?auto_13156 ?auto_13173 ) ) ( not ( = ?auto_13157 ?auto_13173 ) ) ( IS-CRATE ?auto_13156 ) ( not ( = ?auto_13179 ?auto_13165 ) ) ( HOIST-AT ?auto_13176 ?auto_13179 ) ( AVAILABLE ?auto_13176 ) ( SURFACE-AT ?auto_13156 ?auto_13179 ) ( ON ?auto_13156 ?auto_13168 ) ( CLEAR ?auto_13156 ) ( not ( = ?auto_13155 ?auto_13156 ) ) ( not ( = ?auto_13155 ?auto_13168 ) ) ( not ( = ?auto_13156 ?auto_13168 ) ) ( not ( = ?auto_13161 ?auto_13176 ) ) ( IS-CRATE ?auto_13155 ) ( not ( = ?auto_13172 ?auto_13165 ) ) ( HOIST-AT ?auto_13178 ?auto_13172 ) ( AVAILABLE ?auto_13178 ) ( SURFACE-AT ?auto_13155 ?auto_13172 ) ( ON ?auto_13155 ?auto_13170 ) ( CLEAR ?auto_13155 ) ( not ( = ?auto_13154 ?auto_13155 ) ) ( not ( = ?auto_13154 ?auto_13170 ) ) ( not ( = ?auto_13155 ?auto_13170 ) ) ( not ( = ?auto_13161 ?auto_13178 ) ) ( SURFACE-AT ?auto_13153 ?auto_13165 ) ( CLEAR ?auto_13153 ) ( IS-CRATE ?auto_13154 ) ( AVAILABLE ?auto_13161 ) ( not ( = ?auto_13169 ?auto_13165 ) ) ( HOIST-AT ?auto_13174 ?auto_13169 ) ( AVAILABLE ?auto_13174 ) ( SURFACE-AT ?auto_13154 ?auto_13169 ) ( ON ?auto_13154 ?auto_13177 ) ( CLEAR ?auto_13154 ) ( TRUCK-AT ?auto_13162 ?auto_13165 ) ( not ( = ?auto_13153 ?auto_13154 ) ) ( not ( = ?auto_13153 ?auto_13177 ) ) ( not ( = ?auto_13154 ?auto_13177 ) ) ( not ( = ?auto_13161 ?auto_13174 ) ) ( not ( = ?auto_13153 ?auto_13155 ) ) ( not ( = ?auto_13153 ?auto_13170 ) ) ( not ( = ?auto_13155 ?auto_13177 ) ) ( not ( = ?auto_13172 ?auto_13169 ) ) ( not ( = ?auto_13178 ?auto_13174 ) ) ( not ( = ?auto_13170 ?auto_13177 ) ) ( not ( = ?auto_13153 ?auto_13156 ) ) ( not ( = ?auto_13153 ?auto_13168 ) ) ( not ( = ?auto_13154 ?auto_13156 ) ) ( not ( = ?auto_13154 ?auto_13168 ) ) ( not ( = ?auto_13156 ?auto_13170 ) ) ( not ( = ?auto_13156 ?auto_13177 ) ) ( not ( = ?auto_13179 ?auto_13172 ) ) ( not ( = ?auto_13179 ?auto_13169 ) ) ( not ( = ?auto_13176 ?auto_13178 ) ) ( not ( = ?auto_13176 ?auto_13174 ) ) ( not ( = ?auto_13168 ?auto_13170 ) ) ( not ( = ?auto_13168 ?auto_13177 ) ) ( not ( = ?auto_13153 ?auto_13157 ) ) ( not ( = ?auto_13153 ?auto_13173 ) ) ( not ( = ?auto_13154 ?auto_13157 ) ) ( not ( = ?auto_13154 ?auto_13173 ) ) ( not ( = ?auto_13155 ?auto_13157 ) ) ( not ( = ?auto_13155 ?auto_13173 ) ) ( not ( = ?auto_13157 ?auto_13168 ) ) ( not ( = ?auto_13157 ?auto_13170 ) ) ( not ( = ?auto_13157 ?auto_13177 ) ) ( not ( = ?auto_13164 ?auto_13179 ) ) ( not ( = ?auto_13164 ?auto_13172 ) ) ( not ( = ?auto_13164 ?auto_13169 ) ) ( not ( = ?auto_13166 ?auto_13176 ) ) ( not ( = ?auto_13166 ?auto_13178 ) ) ( not ( = ?auto_13166 ?auto_13174 ) ) ( not ( = ?auto_13173 ?auto_13168 ) ) ( not ( = ?auto_13173 ?auto_13170 ) ) ( not ( = ?auto_13173 ?auto_13177 ) ) ( not ( = ?auto_13153 ?auto_13158 ) ) ( not ( = ?auto_13153 ?auto_13171 ) ) ( not ( = ?auto_13154 ?auto_13158 ) ) ( not ( = ?auto_13154 ?auto_13171 ) ) ( not ( = ?auto_13155 ?auto_13158 ) ) ( not ( = ?auto_13155 ?auto_13171 ) ) ( not ( = ?auto_13156 ?auto_13158 ) ) ( not ( = ?auto_13156 ?auto_13171 ) ) ( not ( = ?auto_13158 ?auto_13173 ) ) ( not ( = ?auto_13158 ?auto_13168 ) ) ( not ( = ?auto_13158 ?auto_13170 ) ) ( not ( = ?auto_13158 ?auto_13177 ) ) ( not ( = ?auto_13167 ?auto_13164 ) ) ( not ( = ?auto_13167 ?auto_13179 ) ) ( not ( = ?auto_13167 ?auto_13172 ) ) ( not ( = ?auto_13167 ?auto_13169 ) ) ( not ( = ?auto_13180 ?auto_13166 ) ) ( not ( = ?auto_13180 ?auto_13176 ) ) ( not ( = ?auto_13180 ?auto_13178 ) ) ( not ( = ?auto_13180 ?auto_13174 ) ) ( not ( = ?auto_13171 ?auto_13173 ) ) ( not ( = ?auto_13171 ?auto_13168 ) ) ( not ( = ?auto_13171 ?auto_13170 ) ) ( not ( = ?auto_13171 ?auto_13177 ) ) ( not ( = ?auto_13153 ?auto_13159 ) ) ( not ( = ?auto_13153 ?auto_13175 ) ) ( not ( = ?auto_13154 ?auto_13159 ) ) ( not ( = ?auto_13154 ?auto_13175 ) ) ( not ( = ?auto_13155 ?auto_13159 ) ) ( not ( = ?auto_13155 ?auto_13175 ) ) ( not ( = ?auto_13156 ?auto_13159 ) ) ( not ( = ?auto_13156 ?auto_13175 ) ) ( not ( = ?auto_13157 ?auto_13159 ) ) ( not ( = ?auto_13157 ?auto_13175 ) ) ( not ( = ?auto_13159 ?auto_13171 ) ) ( not ( = ?auto_13159 ?auto_13173 ) ) ( not ( = ?auto_13159 ?auto_13168 ) ) ( not ( = ?auto_13159 ?auto_13170 ) ) ( not ( = ?auto_13159 ?auto_13177 ) ) ( not ( = ?auto_13175 ?auto_13171 ) ) ( not ( = ?auto_13175 ?auto_13173 ) ) ( not ( = ?auto_13175 ?auto_13168 ) ) ( not ( = ?auto_13175 ?auto_13170 ) ) ( not ( = ?auto_13175 ?auto_13177 ) ) ( not ( = ?auto_13153 ?auto_13160 ) ) ( not ( = ?auto_13153 ?auto_13163 ) ) ( not ( = ?auto_13154 ?auto_13160 ) ) ( not ( = ?auto_13154 ?auto_13163 ) ) ( not ( = ?auto_13155 ?auto_13160 ) ) ( not ( = ?auto_13155 ?auto_13163 ) ) ( not ( = ?auto_13156 ?auto_13160 ) ) ( not ( = ?auto_13156 ?auto_13163 ) ) ( not ( = ?auto_13157 ?auto_13160 ) ) ( not ( = ?auto_13157 ?auto_13163 ) ) ( not ( = ?auto_13158 ?auto_13160 ) ) ( not ( = ?auto_13158 ?auto_13163 ) ) ( not ( = ?auto_13160 ?auto_13175 ) ) ( not ( = ?auto_13160 ?auto_13171 ) ) ( not ( = ?auto_13160 ?auto_13173 ) ) ( not ( = ?auto_13160 ?auto_13168 ) ) ( not ( = ?auto_13160 ?auto_13170 ) ) ( not ( = ?auto_13160 ?auto_13177 ) ) ( not ( = ?auto_13163 ?auto_13175 ) ) ( not ( = ?auto_13163 ?auto_13171 ) ) ( not ( = ?auto_13163 ?auto_13173 ) ) ( not ( = ?auto_13163 ?auto_13168 ) ) ( not ( = ?auto_13163 ?auto_13170 ) ) ( not ( = ?auto_13163 ?auto_13177 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_13153 ?auto_13154 ?auto_13155 ?auto_13156 ?auto_13157 ?auto_13158 ?auto_13159 )
      ( MAKE-1CRATE ?auto_13159 ?auto_13160 )
      ( MAKE-7CRATE-VERIFY ?auto_13153 ?auto_13154 ?auto_13155 ?auto_13156 ?auto_13157 ?auto_13158 ?auto_13159 ?auto_13160 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13183 - SURFACE
      ?auto_13184 - SURFACE
    )
    :vars
    (
      ?auto_13185 - HOIST
      ?auto_13186 - PLACE
      ?auto_13188 - PLACE
      ?auto_13189 - HOIST
      ?auto_13190 - SURFACE
      ?auto_13187 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13185 ?auto_13186 ) ( SURFACE-AT ?auto_13183 ?auto_13186 ) ( CLEAR ?auto_13183 ) ( IS-CRATE ?auto_13184 ) ( AVAILABLE ?auto_13185 ) ( not ( = ?auto_13188 ?auto_13186 ) ) ( HOIST-AT ?auto_13189 ?auto_13188 ) ( AVAILABLE ?auto_13189 ) ( SURFACE-AT ?auto_13184 ?auto_13188 ) ( ON ?auto_13184 ?auto_13190 ) ( CLEAR ?auto_13184 ) ( TRUCK-AT ?auto_13187 ?auto_13186 ) ( not ( = ?auto_13183 ?auto_13184 ) ) ( not ( = ?auto_13183 ?auto_13190 ) ) ( not ( = ?auto_13184 ?auto_13190 ) ) ( not ( = ?auto_13185 ?auto_13189 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13187 ?auto_13186 ?auto_13188 )
      ( !LIFT ?auto_13189 ?auto_13184 ?auto_13190 ?auto_13188 )
      ( !LOAD ?auto_13189 ?auto_13184 ?auto_13187 ?auto_13188 )
      ( !DRIVE ?auto_13187 ?auto_13188 ?auto_13186 )
      ( !UNLOAD ?auto_13185 ?auto_13184 ?auto_13187 ?auto_13186 )
      ( !DROP ?auto_13185 ?auto_13184 ?auto_13183 ?auto_13186 )
      ( MAKE-1CRATE-VERIFY ?auto_13183 ?auto_13184 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_13200 - SURFACE
      ?auto_13201 - SURFACE
      ?auto_13202 - SURFACE
      ?auto_13203 - SURFACE
      ?auto_13204 - SURFACE
      ?auto_13205 - SURFACE
      ?auto_13206 - SURFACE
      ?auto_13208 - SURFACE
      ?auto_13207 - SURFACE
    )
    :vars
    (
      ?auto_13210 - HOIST
      ?auto_13209 - PLACE
      ?auto_13214 - PLACE
      ?auto_13213 - HOIST
      ?auto_13212 - SURFACE
      ?auto_13225 - PLACE
      ?auto_13227 - HOIST
      ?auto_13226 - SURFACE
      ?auto_13215 - PLACE
      ?auto_13221 - HOIST
      ?auto_13216 - SURFACE
      ?auto_13224 - SURFACE
      ?auto_13222 - SURFACE
      ?auto_13220 - PLACE
      ?auto_13218 - HOIST
      ?auto_13229 - SURFACE
      ?auto_13223 - PLACE
      ?auto_13219 - HOIST
      ?auto_13228 - SURFACE
      ?auto_13217 - SURFACE
      ?auto_13211 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13210 ?auto_13209 ) ( IS-CRATE ?auto_13207 ) ( not ( = ?auto_13214 ?auto_13209 ) ) ( HOIST-AT ?auto_13213 ?auto_13214 ) ( SURFACE-AT ?auto_13207 ?auto_13214 ) ( ON ?auto_13207 ?auto_13212 ) ( CLEAR ?auto_13207 ) ( not ( = ?auto_13208 ?auto_13207 ) ) ( not ( = ?auto_13208 ?auto_13212 ) ) ( not ( = ?auto_13207 ?auto_13212 ) ) ( not ( = ?auto_13210 ?auto_13213 ) ) ( IS-CRATE ?auto_13208 ) ( not ( = ?auto_13225 ?auto_13209 ) ) ( HOIST-AT ?auto_13227 ?auto_13225 ) ( SURFACE-AT ?auto_13208 ?auto_13225 ) ( ON ?auto_13208 ?auto_13226 ) ( CLEAR ?auto_13208 ) ( not ( = ?auto_13206 ?auto_13208 ) ) ( not ( = ?auto_13206 ?auto_13226 ) ) ( not ( = ?auto_13208 ?auto_13226 ) ) ( not ( = ?auto_13210 ?auto_13227 ) ) ( IS-CRATE ?auto_13206 ) ( not ( = ?auto_13215 ?auto_13209 ) ) ( HOIST-AT ?auto_13221 ?auto_13215 ) ( SURFACE-AT ?auto_13206 ?auto_13215 ) ( ON ?auto_13206 ?auto_13216 ) ( CLEAR ?auto_13206 ) ( not ( = ?auto_13205 ?auto_13206 ) ) ( not ( = ?auto_13205 ?auto_13216 ) ) ( not ( = ?auto_13206 ?auto_13216 ) ) ( not ( = ?auto_13210 ?auto_13221 ) ) ( IS-CRATE ?auto_13205 ) ( AVAILABLE ?auto_13221 ) ( SURFACE-AT ?auto_13205 ?auto_13215 ) ( ON ?auto_13205 ?auto_13224 ) ( CLEAR ?auto_13205 ) ( not ( = ?auto_13204 ?auto_13205 ) ) ( not ( = ?auto_13204 ?auto_13224 ) ) ( not ( = ?auto_13205 ?auto_13224 ) ) ( IS-CRATE ?auto_13204 ) ( AVAILABLE ?auto_13227 ) ( SURFACE-AT ?auto_13204 ?auto_13225 ) ( ON ?auto_13204 ?auto_13222 ) ( CLEAR ?auto_13204 ) ( not ( = ?auto_13203 ?auto_13204 ) ) ( not ( = ?auto_13203 ?auto_13222 ) ) ( not ( = ?auto_13204 ?auto_13222 ) ) ( IS-CRATE ?auto_13203 ) ( not ( = ?auto_13220 ?auto_13209 ) ) ( HOIST-AT ?auto_13218 ?auto_13220 ) ( AVAILABLE ?auto_13218 ) ( SURFACE-AT ?auto_13203 ?auto_13220 ) ( ON ?auto_13203 ?auto_13229 ) ( CLEAR ?auto_13203 ) ( not ( = ?auto_13202 ?auto_13203 ) ) ( not ( = ?auto_13202 ?auto_13229 ) ) ( not ( = ?auto_13203 ?auto_13229 ) ) ( not ( = ?auto_13210 ?auto_13218 ) ) ( IS-CRATE ?auto_13202 ) ( not ( = ?auto_13223 ?auto_13209 ) ) ( HOIST-AT ?auto_13219 ?auto_13223 ) ( AVAILABLE ?auto_13219 ) ( SURFACE-AT ?auto_13202 ?auto_13223 ) ( ON ?auto_13202 ?auto_13228 ) ( CLEAR ?auto_13202 ) ( not ( = ?auto_13201 ?auto_13202 ) ) ( not ( = ?auto_13201 ?auto_13228 ) ) ( not ( = ?auto_13202 ?auto_13228 ) ) ( not ( = ?auto_13210 ?auto_13219 ) ) ( SURFACE-AT ?auto_13200 ?auto_13209 ) ( CLEAR ?auto_13200 ) ( IS-CRATE ?auto_13201 ) ( AVAILABLE ?auto_13210 ) ( AVAILABLE ?auto_13213 ) ( SURFACE-AT ?auto_13201 ?auto_13214 ) ( ON ?auto_13201 ?auto_13217 ) ( CLEAR ?auto_13201 ) ( TRUCK-AT ?auto_13211 ?auto_13209 ) ( not ( = ?auto_13200 ?auto_13201 ) ) ( not ( = ?auto_13200 ?auto_13217 ) ) ( not ( = ?auto_13201 ?auto_13217 ) ) ( not ( = ?auto_13200 ?auto_13202 ) ) ( not ( = ?auto_13200 ?auto_13228 ) ) ( not ( = ?auto_13202 ?auto_13217 ) ) ( not ( = ?auto_13223 ?auto_13214 ) ) ( not ( = ?auto_13219 ?auto_13213 ) ) ( not ( = ?auto_13228 ?auto_13217 ) ) ( not ( = ?auto_13200 ?auto_13203 ) ) ( not ( = ?auto_13200 ?auto_13229 ) ) ( not ( = ?auto_13201 ?auto_13203 ) ) ( not ( = ?auto_13201 ?auto_13229 ) ) ( not ( = ?auto_13203 ?auto_13228 ) ) ( not ( = ?auto_13203 ?auto_13217 ) ) ( not ( = ?auto_13220 ?auto_13223 ) ) ( not ( = ?auto_13220 ?auto_13214 ) ) ( not ( = ?auto_13218 ?auto_13219 ) ) ( not ( = ?auto_13218 ?auto_13213 ) ) ( not ( = ?auto_13229 ?auto_13228 ) ) ( not ( = ?auto_13229 ?auto_13217 ) ) ( not ( = ?auto_13200 ?auto_13204 ) ) ( not ( = ?auto_13200 ?auto_13222 ) ) ( not ( = ?auto_13201 ?auto_13204 ) ) ( not ( = ?auto_13201 ?auto_13222 ) ) ( not ( = ?auto_13202 ?auto_13204 ) ) ( not ( = ?auto_13202 ?auto_13222 ) ) ( not ( = ?auto_13204 ?auto_13229 ) ) ( not ( = ?auto_13204 ?auto_13228 ) ) ( not ( = ?auto_13204 ?auto_13217 ) ) ( not ( = ?auto_13225 ?auto_13220 ) ) ( not ( = ?auto_13225 ?auto_13223 ) ) ( not ( = ?auto_13225 ?auto_13214 ) ) ( not ( = ?auto_13227 ?auto_13218 ) ) ( not ( = ?auto_13227 ?auto_13219 ) ) ( not ( = ?auto_13227 ?auto_13213 ) ) ( not ( = ?auto_13222 ?auto_13229 ) ) ( not ( = ?auto_13222 ?auto_13228 ) ) ( not ( = ?auto_13222 ?auto_13217 ) ) ( not ( = ?auto_13200 ?auto_13205 ) ) ( not ( = ?auto_13200 ?auto_13224 ) ) ( not ( = ?auto_13201 ?auto_13205 ) ) ( not ( = ?auto_13201 ?auto_13224 ) ) ( not ( = ?auto_13202 ?auto_13205 ) ) ( not ( = ?auto_13202 ?auto_13224 ) ) ( not ( = ?auto_13203 ?auto_13205 ) ) ( not ( = ?auto_13203 ?auto_13224 ) ) ( not ( = ?auto_13205 ?auto_13222 ) ) ( not ( = ?auto_13205 ?auto_13229 ) ) ( not ( = ?auto_13205 ?auto_13228 ) ) ( not ( = ?auto_13205 ?auto_13217 ) ) ( not ( = ?auto_13215 ?auto_13225 ) ) ( not ( = ?auto_13215 ?auto_13220 ) ) ( not ( = ?auto_13215 ?auto_13223 ) ) ( not ( = ?auto_13215 ?auto_13214 ) ) ( not ( = ?auto_13221 ?auto_13227 ) ) ( not ( = ?auto_13221 ?auto_13218 ) ) ( not ( = ?auto_13221 ?auto_13219 ) ) ( not ( = ?auto_13221 ?auto_13213 ) ) ( not ( = ?auto_13224 ?auto_13222 ) ) ( not ( = ?auto_13224 ?auto_13229 ) ) ( not ( = ?auto_13224 ?auto_13228 ) ) ( not ( = ?auto_13224 ?auto_13217 ) ) ( not ( = ?auto_13200 ?auto_13206 ) ) ( not ( = ?auto_13200 ?auto_13216 ) ) ( not ( = ?auto_13201 ?auto_13206 ) ) ( not ( = ?auto_13201 ?auto_13216 ) ) ( not ( = ?auto_13202 ?auto_13206 ) ) ( not ( = ?auto_13202 ?auto_13216 ) ) ( not ( = ?auto_13203 ?auto_13206 ) ) ( not ( = ?auto_13203 ?auto_13216 ) ) ( not ( = ?auto_13204 ?auto_13206 ) ) ( not ( = ?auto_13204 ?auto_13216 ) ) ( not ( = ?auto_13206 ?auto_13224 ) ) ( not ( = ?auto_13206 ?auto_13222 ) ) ( not ( = ?auto_13206 ?auto_13229 ) ) ( not ( = ?auto_13206 ?auto_13228 ) ) ( not ( = ?auto_13206 ?auto_13217 ) ) ( not ( = ?auto_13216 ?auto_13224 ) ) ( not ( = ?auto_13216 ?auto_13222 ) ) ( not ( = ?auto_13216 ?auto_13229 ) ) ( not ( = ?auto_13216 ?auto_13228 ) ) ( not ( = ?auto_13216 ?auto_13217 ) ) ( not ( = ?auto_13200 ?auto_13208 ) ) ( not ( = ?auto_13200 ?auto_13226 ) ) ( not ( = ?auto_13201 ?auto_13208 ) ) ( not ( = ?auto_13201 ?auto_13226 ) ) ( not ( = ?auto_13202 ?auto_13208 ) ) ( not ( = ?auto_13202 ?auto_13226 ) ) ( not ( = ?auto_13203 ?auto_13208 ) ) ( not ( = ?auto_13203 ?auto_13226 ) ) ( not ( = ?auto_13204 ?auto_13208 ) ) ( not ( = ?auto_13204 ?auto_13226 ) ) ( not ( = ?auto_13205 ?auto_13208 ) ) ( not ( = ?auto_13205 ?auto_13226 ) ) ( not ( = ?auto_13208 ?auto_13216 ) ) ( not ( = ?auto_13208 ?auto_13224 ) ) ( not ( = ?auto_13208 ?auto_13222 ) ) ( not ( = ?auto_13208 ?auto_13229 ) ) ( not ( = ?auto_13208 ?auto_13228 ) ) ( not ( = ?auto_13208 ?auto_13217 ) ) ( not ( = ?auto_13226 ?auto_13216 ) ) ( not ( = ?auto_13226 ?auto_13224 ) ) ( not ( = ?auto_13226 ?auto_13222 ) ) ( not ( = ?auto_13226 ?auto_13229 ) ) ( not ( = ?auto_13226 ?auto_13228 ) ) ( not ( = ?auto_13226 ?auto_13217 ) ) ( not ( = ?auto_13200 ?auto_13207 ) ) ( not ( = ?auto_13200 ?auto_13212 ) ) ( not ( = ?auto_13201 ?auto_13207 ) ) ( not ( = ?auto_13201 ?auto_13212 ) ) ( not ( = ?auto_13202 ?auto_13207 ) ) ( not ( = ?auto_13202 ?auto_13212 ) ) ( not ( = ?auto_13203 ?auto_13207 ) ) ( not ( = ?auto_13203 ?auto_13212 ) ) ( not ( = ?auto_13204 ?auto_13207 ) ) ( not ( = ?auto_13204 ?auto_13212 ) ) ( not ( = ?auto_13205 ?auto_13207 ) ) ( not ( = ?auto_13205 ?auto_13212 ) ) ( not ( = ?auto_13206 ?auto_13207 ) ) ( not ( = ?auto_13206 ?auto_13212 ) ) ( not ( = ?auto_13207 ?auto_13226 ) ) ( not ( = ?auto_13207 ?auto_13216 ) ) ( not ( = ?auto_13207 ?auto_13224 ) ) ( not ( = ?auto_13207 ?auto_13222 ) ) ( not ( = ?auto_13207 ?auto_13229 ) ) ( not ( = ?auto_13207 ?auto_13228 ) ) ( not ( = ?auto_13207 ?auto_13217 ) ) ( not ( = ?auto_13212 ?auto_13226 ) ) ( not ( = ?auto_13212 ?auto_13216 ) ) ( not ( = ?auto_13212 ?auto_13224 ) ) ( not ( = ?auto_13212 ?auto_13222 ) ) ( not ( = ?auto_13212 ?auto_13229 ) ) ( not ( = ?auto_13212 ?auto_13228 ) ) ( not ( = ?auto_13212 ?auto_13217 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_13200 ?auto_13201 ?auto_13202 ?auto_13203 ?auto_13204 ?auto_13205 ?auto_13206 ?auto_13208 )
      ( MAKE-1CRATE ?auto_13208 ?auto_13207 )
      ( MAKE-8CRATE-VERIFY ?auto_13200 ?auto_13201 ?auto_13202 ?auto_13203 ?auto_13204 ?auto_13205 ?auto_13206 ?auto_13208 ?auto_13207 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13232 - SURFACE
      ?auto_13233 - SURFACE
    )
    :vars
    (
      ?auto_13234 - HOIST
      ?auto_13235 - PLACE
      ?auto_13237 - PLACE
      ?auto_13238 - HOIST
      ?auto_13239 - SURFACE
      ?auto_13236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13234 ?auto_13235 ) ( SURFACE-AT ?auto_13232 ?auto_13235 ) ( CLEAR ?auto_13232 ) ( IS-CRATE ?auto_13233 ) ( AVAILABLE ?auto_13234 ) ( not ( = ?auto_13237 ?auto_13235 ) ) ( HOIST-AT ?auto_13238 ?auto_13237 ) ( AVAILABLE ?auto_13238 ) ( SURFACE-AT ?auto_13233 ?auto_13237 ) ( ON ?auto_13233 ?auto_13239 ) ( CLEAR ?auto_13233 ) ( TRUCK-AT ?auto_13236 ?auto_13235 ) ( not ( = ?auto_13232 ?auto_13233 ) ) ( not ( = ?auto_13232 ?auto_13239 ) ) ( not ( = ?auto_13233 ?auto_13239 ) ) ( not ( = ?auto_13234 ?auto_13238 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13236 ?auto_13235 ?auto_13237 )
      ( !LIFT ?auto_13238 ?auto_13233 ?auto_13239 ?auto_13237 )
      ( !LOAD ?auto_13238 ?auto_13233 ?auto_13236 ?auto_13237 )
      ( !DRIVE ?auto_13236 ?auto_13237 ?auto_13235 )
      ( !UNLOAD ?auto_13234 ?auto_13233 ?auto_13236 ?auto_13235 )
      ( !DROP ?auto_13234 ?auto_13233 ?auto_13232 ?auto_13235 )
      ( MAKE-1CRATE-VERIFY ?auto_13232 ?auto_13233 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_13250 - SURFACE
      ?auto_13251 - SURFACE
      ?auto_13252 - SURFACE
      ?auto_13253 - SURFACE
      ?auto_13254 - SURFACE
      ?auto_13255 - SURFACE
      ?auto_13256 - SURFACE
      ?auto_13259 - SURFACE
      ?auto_13258 - SURFACE
      ?auto_13257 - SURFACE
    )
    :vars
    (
      ?auto_13263 - HOIST
      ?auto_13265 - PLACE
      ?auto_13264 - PLACE
      ?auto_13262 - HOIST
      ?auto_13260 - SURFACE
      ?auto_13269 - PLACE
      ?auto_13281 - HOIST
      ?auto_13267 - SURFACE
      ?auto_13279 - PLACE
      ?auto_13280 - HOIST
      ?auto_13278 - SURFACE
      ?auto_13266 - SURFACE
      ?auto_13277 - SURFACE
      ?auto_13272 - SURFACE
      ?auto_13273 - PLACE
      ?auto_13270 - HOIST
      ?auto_13275 - SURFACE
      ?auto_13276 - PLACE
      ?auto_13274 - HOIST
      ?auto_13271 - SURFACE
      ?auto_13268 - SURFACE
      ?auto_13261 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13263 ?auto_13265 ) ( IS-CRATE ?auto_13257 ) ( not ( = ?auto_13264 ?auto_13265 ) ) ( HOIST-AT ?auto_13262 ?auto_13264 ) ( SURFACE-AT ?auto_13257 ?auto_13264 ) ( ON ?auto_13257 ?auto_13260 ) ( CLEAR ?auto_13257 ) ( not ( = ?auto_13258 ?auto_13257 ) ) ( not ( = ?auto_13258 ?auto_13260 ) ) ( not ( = ?auto_13257 ?auto_13260 ) ) ( not ( = ?auto_13263 ?auto_13262 ) ) ( IS-CRATE ?auto_13258 ) ( not ( = ?auto_13269 ?auto_13265 ) ) ( HOIST-AT ?auto_13281 ?auto_13269 ) ( SURFACE-AT ?auto_13258 ?auto_13269 ) ( ON ?auto_13258 ?auto_13267 ) ( CLEAR ?auto_13258 ) ( not ( = ?auto_13259 ?auto_13258 ) ) ( not ( = ?auto_13259 ?auto_13267 ) ) ( not ( = ?auto_13258 ?auto_13267 ) ) ( not ( = ?auto_13263 ?auto_13281 ) ) ( IS-CRATE ?auto_13259 ) ( not ( = ?auto_13279 ?auto_13265 ) ) ( HOIST-AT ?auto_13280 ?auto_13279 ) ( SURFACE-AT ?auto_13259 ?auto_13279 ) ( ON ?auto_13259 ?auto_13278 ) ( CLEAR ?auto_13259 ) ( not ( = ?auto_13256 ?auto_13259 ) ) ( not ( = ?auto_13256 ?auto_13278 ) ) ( not ( = ?auto_13259 ?auto_13278 ) ) ( not ( = ?auto_13263 ?auto_13280 ) ) ( IS-CRATE ?auto_13256 ) ( SURFACE-AT ?auto_13256 ?auto_13264 ) ( ON ?auto_13256 ?auto_13266 ) ( CLEAR ?auto_13256 ) ( not ( = ?auto_13255 ?auto_13256 ) ) ( not ( = ?auto_13255 ?auto_13266 ) ) ( not ( = ?auto_13256 ?auto_13266 ) ) ( IS-CRATE ?auto_13255 ) ( AVAILABLE ?auto_13262 ) ( SURFACE-AT ?auto_13255 ?auto_13264 ) ( ON ?auto_13255 ?auto_13277 ) ( CLEAR ?auto_13255 ) ( not ( = ?auto_13254 ?auto_13255 ) ) ( not ( = ?auto_13254 ?auto_13277 ) ) ( not ( = ?auto_13255 ?auto_13277 ) ) ( IS-CRATE ?auto_13254 ) ( AVAILABLE ?auto_13280 ) ( SURFACE-AT ?auto_13254 ?auto_13279 ) ( ON ?auto_13254 ?auto_13272 ) ( CLEAR ?auto_13254 ) ( not ( = ?auto_13253 ?auto_13254 ) ) ( not ( = ?auto_13253 ?auto_13272 ) ) ( not ( = ?auto_13254 ?auto_13272 ) ) ( IS-CRATE ?auto_13253 ) ( not ( = ?auto_13273 ?auto_13265 ) ) ( HOIST-AT ?auto_13270 ?auto_13273 ) ( AVAILABLE ?auto_13270 ) ( SURFACE-AT ?auto_13253 ?auto_13273 ) ( ON ?auto_13253 ?auto_13275 ) ( CLEAR ?auto_13253 ) ( not ( = ?auto_13252 ?auto_13253 ) ) ( not ( = ?auto_13252 ?auto_13275 ) ) ( not ( = ?auto_13253 ?auto_13275 ) ) ( not ( = ?auto_13263 ?auto_13270 ) ) ( IS-CRATE ?auto_13252 ) ( not ( = ?auto_13276 ?auto_13265 ) ) ( HOIST-AT ?auto_13274 ?auto_13276 ) ( AVAILABLE ?auto_13274 ) ( SURFACE-AT ?auto_13252 ?auto_13276 ) ( ON ?auto_13252 ?auto_13271 ) ( CLEAR ?auto_13252 ) ( not ( = ?auto_13251 ?auto_13252 ) ) ( not ( = ?auto_13251 ?auto_13271 ) ) ( not ( = ?auto_13252 ?auto_13271 ) ) ( not ( = ?auto_13263 ?auto_13274 ) ) ( SURFACE-AT ?auto_13250 ?auto_13265 ) ( CLEAR ?auto_13250 ) ( IS-CRATE ?auto_13251 ) ( AVAILABLE ?auto_13263 ) ( AVAILABLE ?auto_13281 ) ( SURFACE-AT ?auto_13251 ?auto_13269 ) ( ON ?auto_13251 ?auto_13268 ) ( CLEAR ?auto_13251 ) ( TRUCK-AT ?auto_13261 ?auto_13265 ) ( not ( = ?auto_13250 ?auto_13251 ) ) ( not ( = ?auto_13250 ?auto_13268 ) ) ( not ( = ?auto_13251 ?auto_13268 ) ) ( not ( = ?auto_13250 ?auto_13252 ) ) ( not ( = ?auto_13250 ?auto_13271 ) ) ( not ( = ?auto_13252 ?auto_13268 ) ) ( not ( = ?auto_13276 ?auto_13269 ) ) ( not ( = ?auto_13274 ?auto_13281 ) ) ( not ( = ?auto_13271 ?auto_13268 ) ) ( not ( = ?auto_13250 ?auto_13253 ) ) ( not ( = ?auto_13250 ?auto_13275 ) ) ( not ( = ?auto_13251 ?auto_13253 ) ) ( not ( = ?auto_13251 ?auto_13275 ) ) ( not ( = ?auto_13253 ?auto_13271 ) ) ( not ( = ?auto_13253 ?auto_13268 ) ) ( not ( = ?auto_13273 ?auto_13276 ) ) ( not ( = ?auto_13273 ?auto_13269 ) ) ( not ( = ?auto_13270 ?auto_13274 ) ) ( not ( = ?auto_13270 ?auto_13281 ) ) ( not ( = ?auto_13275 ?auto_13271 ) ) ( not ( = ?auto_13275 ?auto_13268 ) ) ( not ( = ?auto_13250 ?auto_13254 ) ) ( not ( = ?auto_13250 ?auto_13272 ) ) ( not ( = ?auto_13251 ?auto_13254 ) ) ( not ( = ?auto_13251 ?auto_13272 ) ) ( not ( = ?auto_13252 ?auto_13254 ) ) ( not ( = ?auto_13252 ?auto_13272 ) ) ( not ( = ?auto_13254 ?auto_13275 ) ) ( not ( = ?auto_13254 ?auto_13271 ) ) ( not ( = ?auto_13254 ?auto_13268 ) ) ( not ( = ?auto_13279 ?auto_13273 ) ) ( not ( = ?auto_13279 ?auto_13276 ) ) ( not ( = ?auto_13279 ?auto_13269 ) ) ( not ( = ?auto_13280 ?auto_13270 ) ) ( not ( = ?auto_13280 ?auto_13274 ) ) ( not ( = ?auto_13280 ?auto_13281 ) ) ( not ( = ?auto_13272 ?auto_13275 ) ) ( not ( = ?auto_13272 ?auto_13271 ) ) ( not ( = ?auto_13272 ?auto_13268 ) ) ( not ( = ?auto_13250 ?auto_13255 ) ) ( not ( = ?auto_13250 ?auto_13277 ) ) ( not ( = ?auto_13251 ?auto_13255 ) ) ( not ( = ?auto_13251 ?auto_13277 ) ) ( not ( = ?auto_13252 ?auto_13255 ) ) ( not ( = ?auto_13252 ?auto_13277 ) ) ( not ( = ?auto_13253 ?auto_13255 ) ) ( not ( = ?auto_13253 ?auto_13277 ) ) ( not ( = ?auto_13255 ?auto_13272 ) ) ( not ( = ?auto_13255 ?auto_13275 ) ) ( not ( = ?auto_13255 ?auto_13271 ) ) ( not ( = ?auto_13255 ?auto_13268 ) ) ( not ( = ?auto_13264 ?auto_13279 ) ) ( not ( = ?auto_13264 ?auto_13273 ) ) ( not ( = ?auto_13264 ?auto_13276 ) ) ( not ( = ?auto_13264 ?auto_13269 ) ) ( not ( = ?auto_13262 ?auto_13280 ) ) ( not ( = ?auto_13262 ?auto_13270 ) ) ( not ( = ?auto_13262 ?auto_13274 ) ) ( not ( = ?auto_13262 ?auto_13281 ) ) ( not ( = ?auto_13277 ?auto_13272 ) ) ( not ( = ?auto_13277 ?auto_13275 ) ) ( not ( = ?auto_13277 ?auto_13271 ) ) ( not ( = ?auto_13277 ?auto_13268 ) ) ( not ( = ?auto_13250 ?auto_13256 ) ) ( not ( = ?auto_13250 ?auto_13266 ) ) ( not ( = ?auto_13251 ?auto_13256 ) ) ( not ( = ?auto_13251 ?auto_13266 ) ) ( not ( = ?auto_13252 ?auto_13256 ) ) ( not ( = ?auto_13252 ?auto_13266 ) ) ( not ( = ?auto_13253 ?auto_13256 ) ) ( not ( = ?auto_13253 ?auto_13266 ) ) ( not ( = ?auto_13254 ?auto_13256 ) ) ( not ( = ?auto_13254 ?auto_13266 ) ) ( not ( = ?auto_13256 ?auto_13277 ) ) ( not ( = ?auto_13256 ?auto_13272 ) ) ( not ( = ?auto_13256 ?auto_13275 ) ) ( not ( = ?auto_13256 ?auto_13271 ) ) ( not ( = ?auto_13256 ?auto_13268 ) ) ( not ( = ?auto_13266 ?auto_13277 ) ) ( not ( = ?auto_13266 ?auto_13272 ) ) ( not ( = ?auto_13266 ?auto_13275 ) ) ( not ( = ?auto_13266 ?auto_13271 ) ) ( not ( = ?auto_13266 ?auto_13268 ) ) ( not ( = ?auto_13250 ?auto_13259 ) ) ( not ( = ?auto_13250 ?auto_13278 ) ) ( not ( = ?auto_13251 ?auto_13259 ) ) ( not ( = ?auto_13251 ?auto_13278 ) ) ( not ( = ?auto_13252 ?auto_13259 ) ) ( not ( = ?auto_13252 ?auto_13278 ) ) ( not ( = ?auto_13253 ?auto_13259 ) ) ( not ( = ?auto_13253 ?auto_13278 ) ) ( not ( = ?auto_13254 ?auto_13259 ) ) ( not ( = ?auto_13254 ?auto_13278 ) ) ( not ( = ?auto_13255 ?auto_13259 ) ) ( not ( = ?auto_13255 ?auto_13278 ) ) ( not ( = ?auto_13259 ?auto_13266 ) ) ( not ( = ?auto_13259 ?auto_13277 ) ) ( not ( = ?auto_13259 ?auto_13272 ) ) ( not ( = ?auto_13259 ?auto_13275 ) ) ( not ( = ?auto_13259 ?auto_13271 ) ) ( not ( = ?auto_13259 ?auto_13268 ) ) ( not ( = ?auto_13278 ?auto_13266 ) ) ( not ( = ?auto_13278 ?auto_13277 ) ) ( not ( = ?auto_13278 ?auto_13272 ) ) ( not ( = ?auto_13278 ?auto_13275 ) ) ( not ( = ?auto_13278 ?auto_13271 ) ) ( not ( = ?auto_13278 ?auto_13268 ) ) ( not ( = ?auto_13250 ?auto_13258 ) ) ( not ( = ?auto_13250 ?auto_13267 ) ) ( not ( = ?auto_13251 ?auto_13258 ) ) ( not ( = ?auto_13251 ?auto_13267 ) ) ( not ( = ?auto_13252 ?auto_13258 ) ) ( not ( = ?auto_13252 ?auto_13267 ) ) ( not ( = ?auto_13253 ?auto_13258 ) ) ( not ( = ?auto_13253 ?auto_13267 ) ) ( not ( = ?auto_13254 ?auto_13258 ) ) ( not ( = ?auto_13254 ?auto_13267 ) ) ( not ( = ?auto_13255 ?auto_13258 ) ) ( not ( = ?auto_13255 ?auto_13267 ) ) ( not ( = ?auto_13256 ?auto_13258 ) ) ( not ( = ?auto_13256 ?auto_13267 ) ) ( not ( = ?auto_13258 ?auto_13278 ) ) ( not ( = ?auto_13258 ?auto_13266 ) ) ( not ( = ?auto_13258 ?auto_13277 ) ) ( not ( = ?auto_13258 ?auto_13272 ) ) ( not ( = ?auto_13258 ?auto_13275 ) ) ( not ( = ?auto_13258 ?auto_13271 ) ) ( not ( = ?auto_13258 ?auto_13268 ) ) ( not ( = ?auto_13267 ?auto_13278 ) ) ( not ( = ?auto_13267 ?auto_13266 ) ) ( not ( = ?auto_13267 ?auto_13277 ) ) ( not ( = ?auto_13267 ?auto_13272 ) ) ( not ( = ?auto_13267 ?auto_13275 ) ) ( not ( = ?auto_13267 ?auto_13271 ) ) ( not ( = ?auto_13267 ?auto_13268 ) ) ( not ( = ?auto_13250 ?auto_13257 ) ) ( not ( = ?auto_13250 ?auto_13260 ) ) ( not ( = ?auto_13251 ?auto_13257 ) ) ( not ( = ?auto_13251 ?auto_13260 ) ) ( not ( = ?auto_13252 ?auto_13257 ) ) ( not ( = ?auto_13252 ?auto_13260 ) ) ( not ( = ?auto_13253 ?auto_13257 ) ) ( not ( = ?auto_13253 ?auto_13260 ) ) ( not ( = ?auto_13254 ?auto_13257 ) ) ( not ( = ?auto_13254 ?auto_13260 ) ) ( not ( = ?auto_13255 ?auto_13257 ) ) ( not ( = ?auto_13255 ?auto_13260 ) ) ( not ( = ?auto_13256 ?auto_13257 ) ) ( not ( = ?auto_13256 ?auto_13260 ) ) ( not ( = ?auto_13259 ?auto_13257 ) ) ( not ( = ?auto_13259 ?auto_13260 ) ) ( not ( = ?auto_13257 ?auto_13267 ) ) ( not ( = ?auto_13257 ?auto_13278 ) ) ( not ( = ?auto_13257 ?auto_13266 ) ) ( not ( = ?auto_13257 ?auto_13277 ) ) ( not ( = ?auto_13257 ?auto_13272 ) ) ( not ( = ?auto_13257 ?auto_13275 ) ) ( not ( = ?auto_13257 ?auto_13271 ) ) ( not ( = ?auto_13257 ?auto_13268 ) ) ( not ( = ?auto_13260 ?auto_13267 ) ) ( not ( = ?auto_13260 ?auto_13278 ) ) ( not ( = ?auto_13260 ?auto_13266 ) ) ( not ( = ?auto_13260 ?auto_13277 ) ) ( not ( = ?auto_13260 ?auto_13272 ) ) ( not ( = ?auto_13260 ?auto_13275 ) ) ( not ( = ?auto_13260 ?auto_13271 ) ) ( not ( = ?auto_13260 ?auto_13268 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_13250 ?auto_13251 ?auto_13252 ?auto_13253 ?auto_13254 ?auto_13255 ?auto_13256 ?auto_13259 ?auto_13258 )
      ( MAKE-1CRATE ?auto_13258 ?auto_13257 )
      ( MAKE-9CRATE-VERIFY ?auto_13250 ?auto_13251 ?auto_13252 ?auto_13253 ?auto_13254 ?auto_13255 ?auto_13256 ?auto_13259 ?auto_13258 ?auto_13257 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13284 - SURFACE
      ?auto_13285 - SURFACE
    )
    :vars
    (
      ?auto_13286 - HOIST
      ?auto_13287 - PLACE
      ?auto_13289 - PLACE
      ?auto_13290 - HOIST
      ?auto_13291 - SURFACE
      ?auto_13288 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13286 ?auto_13287 ) ( SURFACE-AT ?auto_13284 ?auto_13287 ) ( CLEAR ?auto_13284 ) ( IS-CRATE ?auto_13285 ) ( AVAILABLE ?auto_13286 ) ( not ( = ?auto_13289 ?auto_13287 ) ) ( HOIST-AT ?auto_13290 ?auto_13289 ) ( AVAILABLE ?auto_13290 ) ( SURFACE-AT ?auto_13285 ?auto_13289 ) ( ON ?auto_13285 ?auto_13291 ) ( CLEAR ?auto_13285 ) ( TRUCK-AT ?auto_13288 ?auto_13287 ) ( not ( = ?auto_13284 ?auto_13285 ) ) ( not ( = ?auto_13284 ?auto_13291 ) ) ( not ( = ?auto_13285 ?auto_13291 ) ) ( not ( = ?auto_13286 ?auto_13290 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13288 ?auto_13287 ?auto_13289 )
      ( !LIFT ?auto_13290 ?auto_13285 ?auto_13291 ?auto_13289 )
      ( !LOAD ?auto_13290 ?auto_13285 ?auto_13288 ?auto_13289 )
      ( !DRIVE ?auto_13288 ?auto_13289 ?auto_13287 )
      ( !UNLOAD ?auto_13286 ?auto_13285 ?auto_13288 ?auto_13287 )
      ( !DROP ?auto_13286 ?auto_13285 ?auto_13284 ?auto_13287 )
      ( MAKE-1CRATE-VERIFY ?auto_13284 ?auto_13285 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_13303 - SURFACE
      ?auto_13304 - SURFACE
      ?auto_13305 - SURFACE
      ?auto_13306 - SURFACE
      ?auto_13307 - SURFACE
      ?auto_13308 - SURFACE
      ?auto_13309 - SURFACE
      ?auto_13312 - SURFACE
      ?auto_13311 - SURFACE
      ?auto_13310 - SURFACE
      ?auto_13313 - SURFACE
    )
    :vars
    (
      ?auto_13315 - HOIST
      ?auto_13316 - PLACE
      ?auto_13318 - PLACE
      ?auto_13317 - HOIST
      ?auto_13319 - SURFACE
      ?auto_13325 - PLACE
      ?auto_13337 - HOIST
      ?auto_13331 - SURFACE
      ?auto_13336 - PLACE
      ?auto_13338 - HOIST
      ?auto_13327 - SURFACE
      ?auto_13334 - PLACE
      ?auto_13328 - HOIST
      ?auto_13333 - SURFACE
      ?auto_13326 - SURFACE
      ?auto_13321 - SURFACE
      ?auto_13322 - SURFACE
      ?auto_13320 - PLACE
      ?auto_13324 - HOIST
      ?auto_13335 - SURFACE
      ?auto_13330 - PLACE
      ?auto_13332 - HOIST
      ?auto_13323 - SURFACE
      ?auto_13329 - SURFACE
      ?auto_13314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13315 ?auto_13316 ) ( IS-CRATE ?auto_13313 ) ( not ( = ?auto_13318 ?auto_13316 ) ) ( HOIST-AT ?auto_13317 ?auto_13318 ) ( AVAILABLE ?auto_13317 ) ( SURFACE-AT ?auto_13313 ?auto_13318 ) ( ON ?auto_13313 ?auto_13319 ) ( CLEAR ?auto_13313 ) ( not ( = ?auto_13310 ?auto_13313 ) ) ( not ( = ?auto_13310 ?auto_13319 ) ) ( not ( = ?auto_13313 ?auto_13319 ) ) ( not ( = ?auto_13315 ?auto_13317 ) ) ( IS-CRATE ?auto_13310 ) ( not ( = ?auto_13325 ?auto_13316 ) ) ( HOIST-AT ?auto_13337 ?auto_13325 ) ( SURFACE-AT ?auto_13310 ?auto_13325 ) ( ON ?auto_13310 ?auto_13331 ) ( CLEAR ?auto_13310 ) ( not ( = ?auto_13311 ?auto_13310 ) ) ( not ( = ?auto_13311 ?auto_13331 ) ) ( not ( = ?auto_13310 ?auto_13331 ) ) ( not ( = ?auto_13315 ?auto_13337 ) ) ( IS-CRATE ?auto_13311 ) ( not ( = ?auto_13336 ?auto_13316 ) ) ( HOIST-AT ?auto_13338 ?auto_13336 ) ( SURFACE-AT ?auto_13311 ?auto_13336 ) ( ON ?auto_13311 ?auto_13327 ) ( CLEAR ?auto_13311 ) ( not ( = ?auto_13312 ?auto_13311 ) ) ( not ( = ?auto_13312 ?auto_13327 ) ) ( not ( = ?auto_13311 ?auto_13327 ) ) ( not ( = ?auto_13315 ?auto_13338 ) ) ( IS-CRATE ?auto_13312 ) ( not ( = ?auto_13334 ?auto_13316 ) ) ( HOIST-AT ?auto_13328 ?auto_13334 ) ( SURFACE-AT ?auto_13312 ?auto_13334 ) ( ON ?auto_13312 ?auto_13333 ) ( CLEAR ?auto_13312 ) ( not ( = ?auto_13309 ?auto_13312 ) ) ( not ( = ?auto_13309 ?auto_13333 ) ) ( not ( = ?auto_13312 ?auto_13333 ) ) ( not ( = ?auto_13315 ?auto_13328 ) ) ( IS-CRATE ?auto_13309 ) ( SURFACE-AT ?auto_13309 ?auto_13325 ) ( ON ?auto_13309 ?auto_13326 ) ( CLEAR ?auto_13309 ) ( not ( = ?auto_13308 ?auto_13309 ) ) ( not ( = ?auto_13308 ?auto_13326 ) ) ( not ( = ?auto_13309 ?auto_13326 ) ) ( IS-CRATE ?auto_13308 ) ( AVAILABLE ?auto_13337 ) ( SURFACE-AT ?auto_13308 ?auto_13325 ) ( ON ?auto_13308 ?auto_13321 ) ( CLEAR ?auto_13308 ) ( not ( = ?auto_13307 ?auto_13308 ) ) ( not ( = ?auto_13307 ?auto_13321 ) ) ( not ( = ?auto_13308 ?auto_13321 ) ) ( IS-CRATE ?auto_13307 ) ( AVAILABLE ?auto_13328 ) ( SURFACE-AT ?auto_13307 ?auto_13334 ) ( ON ?auto_13307 ?auto_13322 ) ( CLEAR ?auto_13307 ) ( not ( = ?auto_13306 ?auto_13307 ) ) ( not ( = ?auto_13306 ?auto_13322 ) ) ( not ( = ?auto_13307 ?auto_13322 ) ) ( IS-CRATE ?auto_13306 ) ( not ( = ?auto_13320 ?auto_13316 ) ) ( HOIST-AT ?auto_13324 ?auto_13320 ) ( AVAILABLE ?auto_13324 ) ( SURFACE-AT ?auto_13306 ?auto_13320 ) ( ON ?auto_13306 ?auto_13335 ) ( CLEAR ?auto_13306 ) ( not ( = ?auto_13305 ?auto_13306 ) ) ( not ( = ?auto_13305 ?auto_13335 ) ) ( not ( = ?auto_13306 ?auto_13335 ) ) ( not ( = ?auto_13315 ?auto_13324 ) ) ( IS-CRATE ?auto_13305 ) ( not ( = ?auto_13330 ?auto_13316 ) ) ( HOIST-AT ?auto_13332 ?auto_13330 ) ( AVAILABLE ?auto_13332 ) ( SURFACE-AT ?auto_13305 ?auto_13330 ) ( ON ?auto_13305 ?auto_13323 ) ( CLEAR ?auto_13305 ) ( not ( = ?auto_13304 ?auto_13305 ) ) ( not ( = ?auto_13304 ?auto_13323 ) ) ( not ( = ?auto_13305 ?auto_13323 ) ) ( not ( = ?auto_13315 ?auto_13332 ) ) ( SURFACE-AT ?auto_13303 ?auto_13316 ) ( CLEAR ?auto_13303 ) ( IS-CRATE ?auto_13304 ) ( AVAILABLE ?auto_13315 ) ( AVAILABLE ?auto_13338 ) ( SURFACE-AT ?auto_13304 ?auto_13336 ) ( ON ?auto_13304 ?auto_13329 ) ( CLEAR ?auto_13304 ) ( TRUCK-AT ?auto_13314 ?auto_13316 ) ( not ( = ?auto_13303 ?auto_13304 ) ) ( not ( = ?auto_13303 ?auto_13329 ) ) ( not ( = ?auto_13304 ?auto_13329 ) ) ( not ( = ?auto_13303 ?auto_13305 ) ) ( not ( = ?auto_13303 ?auto_13323 ) ) ( not ( = ?auto_13305 ?auto_13329 ) ) ( not ( = ?auto_13330 ?auto_13336 ) ) ( not ( = ?auto_13332 ?auto_13338 ) ) ( not ( = ?auto_13323 ?auto_13329 ) ) ( not ( = ?auto_13303 ?auto_13306 ) ) ( not ( = ?auto_13303 ?auto_13335 ) ) ( not ( = ?auto_13304 ?auto_13306 ) ) ( not ( = ?auto_13304 ?auto_13335 ) ) ( not ( = ?auto_13306 ?auto_13323 ) ) ( not ( = ?auto_13306 ?auto_13329 ) ) ( not ( = ?auto_13320 ?auto_13330 ) ) ( not ( = ?auto_13320 ?auto_13336 ) ) ( not ( = ?auto_13324 ?auto_13332 ) ) ( not ( = ?auto_13324 ?auto_13338 ) ) ( not ( = ?auto_13335 ?auto_13323 ) ) ( not ( = ?auto_13335 ?auto_13329 ) ) ( not ( = ?auto_13303 ?auto_13307 ) ) ( not ( = ?auto_13303 ?auto_13322 ) ) ( not ( = ?auto_13304 ?auto_13307 ) ) ( not ( = ?auto_13304 ?auto_13322 ) ) ( not ( = ?auto_13305 ?auto_13307 ) ) ( not ( = ?auto_13305 ?auto_13322 ) ) ( not ( = ?auto_13307 ?auto_13335 ) ) ( not ( = ?auto_13307 ?auto_13323 ) ) ( not ( = ?auto_13307 ?auto_13329 ) ) ( not ( = ?auto_13334 ?auto_13320 ) ) ( not ( = ?auto_13334 ?auto_13330 ) ) ( not ( = ?auto_13334 ?auto_13336 ) ) ( not ( = ?auto_13328 ?auto_13324 ) ) ( not ( = ?auto_13328 ?auto_13332 ) ) ( not ( = ?auto_13328 ?auto_13338 ) ) ( not ( = ?auto_13322 ?auto_13335 ) ) ( not ( = ?auto_13322 ?auto_13323 ) ) ( not ( = ?auto_13322 ?auto_13329 ) ) ( not ( = ?auto_13303 ?auto_13308 ) ) ( not ( = ?auto_13303 ?auto_13321 ) ) ( not ( = ?auto_13304 ?auto_13308 ) ) ( not ( = ?auto_13304 ?auto_13321 ) ) ( not ( = ?auto_13305 ?auto_13308 ) ) ( not ( = ?auto_13305 ?auto_13321 ) ) ( not ( = ?auto_13306 ?auto_13308 ) ) ( not ( = ?auto_13306 ?auto_13321 ) ) ( not ( = ?auto_13308 ?auto_13322 ) ) ( not ( = ?auto_13308 ?auto_13335 ) ) ( not ( = ?auto_13308 ?auto_13323 ) ) ( not ( = ?auto_13308 ?auto_13329 ) ) ( not ( = ?auto_13325 ?auto_13334 ) ) ( not ( = ?auto_13325 ?auto_13320 ) ) ( not ( = ?auto_13325 ?auto_13330 ) ) ( not ( = ?auto_13325 ?auto_13336 ) ) ( not ( = ?auto_13337 ?auto_13328 ) ) ( not ( = ?auto_13337 ?auto_13324 ) ) ( not ( = ?auto_13337 ?auto_13332 ) ) ( not ( = ?auto_13337 ?auto_13338 ) ) ( not ( = ?auto_13321 ?auto_13322 ) ) ( not ( = ?auto_13321 ?auto_13335 ) ) ( not ( = ?auto_13321 ?auto_13323 ) ) ( not ( = ?auto_13321 ?auto_13329 ) ) ( not ( = ?auto_13303 ?auto_13309 ) ) ( not ( = ?auto_13303 ?auto_13326 ) ) ( not ( = ?auto_13304 ?auto_13309 ) ) ( not ( = ?auto_13304 ?auto_13326 ) ) ( not ( = ?auto_13305 ?auto_13309 ) ) ( not ( = ?auto_13305 ?auto_13326 ) ) ( not ( = ?auto_13306 ?auto_13309 ) ) ( not ( = ?auto_13306 ?auto_13326 ) ) ( not ( = ?auto_13307 ?auto_13309 ) ) ( not ( = ?auto_13307 ?auto_13326 ) ) ( not ( = ?auto_13309 ?auto_13321 ) ) ( not ( = ?auto_13309 ?auto_13322 ) ) ( not ( = ?auto_13309 ?auto_13335 ) ) ( not ( = ?auto_13309 ?auto_13323 ) ) ( not ( = ?auto_13309 ?auto_13329 ) ) ( not ( = ?auto_13326 ?auto_13321 ) ) ( not ( = ?auto_13326 ?auto_13322 ) ) ( not ( = ?auto_13326 ?auto_13335 ) ) ( not ( = ?auto_13326 ?auto_13323 ) ) ( not ( = ?auto_13326 ?auto_13329 ) ) ( not ( = ?auto_13303 ?auto_13312 ) ) ( not ( = ?auto_13303 ?auto_13333 ) ) ( not ( = ?auto_13304 ?auto_13312 ) ) ( not ( = ?auto_13304 ?auto_13333 ) ) ( not ( = ?auto_13305 ?auto_13312 ) ) ( not ( = ?auto_13305 ?auto_13333 ) ) ( not ( = ?auto_13306 ?auto_13312 ) ) ( not ( = ?auto_13306 ?auto_13333 ) ) ( not ( = ?auto_13307 ?auto_13312 ) ) ( not ( = ?auto_13307 ?auto_13333 ) ) ( not ( = ?auto_13308 ?auto_13312 ) ) ( not ( = ?auto_13308 ?auto_13333 ) ) ( not ( = ?auto_13312 ?auto_13326 ) ) ( not ( = ?auto_13312 ?auto_13321 ) ) ( not ( = ?auto_13312 ?auto_13322 ) ) ( not ( = ?auto_13312 ?auto_13335 ) ) ( not ( = ?auto_13312 ?auto_13323 ) ) ( not ( = ?auto_13312 ?auto_13329 ) ) ( not ( = ?auto_13333 ?auto_13326 ) ) ( not ( = ?auto_13333 ?auto_13321 ) ) ( not ( = ?auto_13333 ?auto_13322 ) ) ( not ( = ?auto_13333 ?auto_13335 ) ) ( not ( = ?auto_13333 ?auto_13323 ) ) ( not ( = ?auto_13333 ?auto_13329 ) ) ( not ( = ?auto_13303 ?auto_13311 ) ) ( not ( = ?auto_13303 ?auto_13327 ) ) ( not ( = ?auto_13304 ?auto_13311 ) ) ( not ( = ?auto_13304 ?auto_13327 ) ) ( not ( = ?auto_13305 ?auto_13311 ) ) ( not ( = ?auto_13305 ?auto_13327 ) ) ( not ( = ?auto_13306 ?auto_13311 ) ) ( not ( = ?auto_13306 ?auto_13327 ) ) ( not ( = ?auto_13307 ?auto_13311 ) ) ( not ( = ?auto_13307 ?auto_13327 ) ) ( not ( = ?auto_13308 ?auto_13311 ) ) ( not ( = ?auto_13308 ?auto_13327 ) ) ( not ( = ?auto_13309 ?auto_13311 ) ) ( not ( = ?auto_13309 ?auto_13327 ) ) ( not ( = ?auto_13311 ?auto_13333 ) ) ( not ( = ?auto_13311 ?auto_13326 ) ) ( not ( = ?auto_13311 ?auto_13321 ) ) ( not ( = ?auto_13311 ?auto_13322 ) ) ( not ( = ?auto_13311 ?auto_13335 ) ) ( not ( = ?auto_13311 ?auto_13323 ) ) ( not ( = ?auto_13311 ?auto_13329 ) ) ( not ( = ?auto_13327 ?auto_13333 ) ) ( not ( = ?auto_13327 ?auto_13326 ) ) ( not ( = ?auto_13327 ?auto_13321 ) ) ( not ( = ?auto_13327 ?auto_13322 ) ) ( not ( = ?auto_13327 ?auto_13335 ) ) ( not ( = ?auto_13327 ?auto_13323 ) ) ( not ( = ?auto_13327 ?auto_13329 ) ) ( not ( = ?auto_13303 ?auto_13310 ) ) ( not ( = ?auto_13303 ?auto_13331 ) ) ( not ( = ?auto_13304 ?auto_13310 ) ) ( not ( = ?auto_13304 ?auto_13331 ) ) ( not ( = ?auto_13305 ?auto_13310 ) ) ( not ( = ?auto_13305 ?auto_13331 ) ) ( not ( = ?auto_13306 ?auto_13310 ) ) ( not ( = ?auto_13306 ?auto_13331 ) ) ( not ( = ?auto_13307 ?auto_13310 ) ) ( not ( = ?auto_13307 ?auto_13331 ) ) ( not ( = ?auto_13308 ?auto_13310 ) ) ( not ( = ?auto_13308 ?auto_13331 ) ) ( not ( = ?auto_13309 ?auto_13310 ) ) ( not ( = ?auto_13309 ?auto_13331 ) ) ( not ( = ?auto_13312 ?auto_13310 ) ) ( not ( = ?auto_13312 ?auto_13331 ) ) ( not ( = ?auto_13310 ?auto_13327 ) ) ( not ( = ?auto_13310 ?auto_13333 ) ) ( not ( = ?auto_13310 ?auto_13326 ) ) ( not ( = ?auto_13310 ?auto_13321 ) ) ( not ( = ?auto_13310 ?auto_13322 ) ) ( not ( = ?auto_13310 ?auto_13335 ) ) ( not ( = ?auto_13310 ?auto_13323 ) ) ( not ( = ?auto_13310 ?auto_13329 ) ) ( not ( = ?auto_13331 ?auto_13327 ) ) ( not ( = ?auto_13331 ?auto_13333 ) ) ( not ( = ?auto_13331 ?auto_13326 ) ) ( not ( = ?auto_13331 ?auto_13321 ) ) ( not ( = ?auto_13331 ?auto_13322 ) ) ( not ( = ?auto_13331 ?auto_13335 ) ) ( not ( = ?auto_13331 ?auto_13323 ) ) ( not ( = ?auto_13331 ?auto_13329 ) ) ( not ( = ?auto_13303 ?auto_13313 ) ) ( not ( = ?auto_13303 ?auto_13319 ) ) ( not ( = ?auto_13304 ?auto_13313 ) ) ( not ( = ?auto_13304 ?auto_13319 ) ) ( not ( = ?auto_13305 ?auto_13313 ) ) ( not ( = ?auto_13305 ?auto_13319 ) ) ( not ( = ?auto_13306 ?auto_13313 ) ) ( not ( = ?auto_13306 ?auto_13319 ) ) ( not ( = ?auto_13307 ?auto_13313 ) ) ( not ( = ?auto_13307 ?auto_13319 ) ) ( not ( = ?auto_13308 ?auto_13313 ) ) ( not ( = ?auto_13308 ?auto_13319 ) ) ( not ( = ?auto_13309 ?auto_13313 ) ) ( not ( = ?auto_13309 ?auto_13319 ) ) ( not ( = ?auto_13312 ?auto_13313 ) ) ( not ( = ?auto_13312 ?auto_13319 ) ) ( not ( = ?auto_13311 ?auto_13313 ) ) ( not ( = ?auto_13311 ?auto_13319 ) ) ( not ( = ?auto_13313 ?auto_13331 ) ) ( not ( = ?auto_13313 ?auto_13327 ) ) ( not ( = ?auto_13313 ?auto_13333 ) ) ( not ( = ?auto_13313 ?auto_13326 ) ) ( not ( = ?auto_13313 ?auto_13321 ) ) ( not ( = ?auto_13313 ?auto_13322 ) ) ( not ( = ?auto_13313 ?auto_13335 ) ) ( not ( = ?auto_13313 ?auto_13323 ) ) ( not ( = ?auto_13313 ?auto_13329 ) ) ( not ( = ?auto_13318 ?auto_13325 ) ) ( not ( = ?auto_13318 ?auto_13336 ) ) ( not ( = ?auto_13318 ?auto_13334 ) ) ( not ( = ?auto_13318 ?auto_13320 ) ) ( not ( = ?auto_13318 ?auto_13330 ) ) ( not ( = ?auto_13317 ?auto_13337 ) ) ( not ( = ?auto_13317 ?auto_13338 ) ) ( not ( = ?auto_13317 ?auto_13328 ) ) ( not ( = ?auto_13317 ?auto_13324 ) ) ( not ( = ?auto_13317 ?auto_13332 ) ) ( not ( = ?auto_13319 ?auto_13331 ) ) ( not ( = ?auto_13319 ?auto_13327 ) ) ( not ( = ?auto_13319 ?auto_13333 ) ) ( not ( = ?auto_13319 ?auto_13326 ) ) ( not ( = ?auto_13319 ?auto_13321 ) ) ( not ( = ?auto_13319 ?auto_13322 ) ) ( not ( = ?auto_13319 ?auto_13335 ) ) ( not ( = ?auto_13319 ?auto_13323 ) ) ( not ( = ?auto_13319 ?auto_13329 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_13303 ?auto_13304 ?auto_13305 ?auto_13306 ?auto_13307 ?auto_13308 ?auto_13309 ?auto_13312 ?auto_13311 ?auto_13310 )
      ( MAKE-1CRATE ?auto_13310 ?auto_13313 )
      ( MAKE-10CRATE-VERIFY ?auto_13303 ?auto_13304 ?auto_13305 ?auto_13306 ?auto_13307 ?auto_13308 ?auto_13309 ?auto_13312 ?auto_13311 ?auto_13310 ?auto_13313 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13341 - SURFACE
      ?auto_13342 - SURFACE
    )
    :vars
    (
      ?auto_13343 - HOIST
      ?auto_13344 - PLACE
      ?auto_13346 - PLACE
      ?auto_13347 - HOIST
      ?auto_13348 - SURFACE
      ?auto_13345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13343 ?auto_13344 ) ( SURFACE-AT ?auto_13341 ?auto_13344 ) ( CLEAR ?auto_13341 ) ( IS-CRATE ?auto_13342 ) ( AVAILABLE ?auto_13343 ) ( not ( = ?auto_13346 ?auto_13344 ) ) ( HOIST-AT ?auto_13347 ?auto_13346 ) ( AVAILABLE ?auto_13347 ) ( SURFACE-AT ?auto_13342 ?auto_13346 ) ( ON ?auto_13342 ?auto_13348 ) ( CLEAR ?auto_13342 ) ( TRUCK-AT ?auto_13345 ?auto_13344 ) ( not ( = ?auto_13341 ?auto_13342 ) ) ( not ( = ?auto_13341 ?auto_13348 ) ) ( not ( = ?auto_13342 ?auto_13348 ) ) ( not ( = ?auto_13343 ?auto_13347 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13345 ?auto_13344 ?auto_13346 )
      ( !LIFT ?auto_13347 ?auto_13342 ?auto_13348 ?auto_13346 )
      ( !LOAD ?auto_13347 ?auto_13342 ?auto_13345 ?auto_13346 )
      ( !DRIVE ?auto_13345 ?auto_13346 ?auto_13344 )
      ( !UNLOAD ?auto_13343 ?auto_13342 ?auto_13345 ?auto_13344 )
      ( !DROP ?auto_13343 ?auto_13342 ?auto_13341 ?auto_13344 )
      ( MAKE-1CRATE-VERIFY ?auto_13341 ?auto_13342 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_13361 - SURFACE
      ?auto_13362 - SURFACE
      ?auto_13363 - SURFACE
      ?auto_13364 - SURFACE
      ?auto_13365 - SURFACE
      ?auto_13366 - SURFACE
      ?auto_13367 - SURFACE
      ?auto_13370 - SURFACE
      ?auto_13369 - SURFACE
      ?auto_13368 - SURFACE
      ?auto_13371 - SURFACE
      ?auto_13372 - SURFACE
    )
    :vars
    (
      ?auto_13374 - HOIST
      ?auto_13373 - PLACE
      ?auto_13375 - PLACE
      ?auto_13376 - HOIST
      ?auto_13378 - SURFACE
      ?auto_13386 - PLACE
      ?auto_13391 - HOIST
      ?auto_13390 - SURFACE
      ?auto_13380 - PLACE
      ?auto_13388 - HOIST
      ?auto_13387 - SURFACE
      ?auto_13383 - PLACE
      ?auto_13381 - HOIST
      ?auto_13389 - SURFACE
      ?auto_13397 - PLACE
      ?auto_13379 - HOIST
      ?auto_13394 - SURFACE
      ?auto_13393 - SURFACE
      ?auto_13392 - SURFACE
      ?auto_13384 - SURFACE
      ?auto_13395 - SURFACE
      ?auto_13385 - PLACE
      ?auto_13396 - HOIST
      ?auto_13382 - SURFACE
      ?auto_13398 - SURFACE
      ?auto_13377 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13374 ?auto_13373 ) ( IS-CRATE ?auto_13372 ) ( not ( = ?auto_13375 ?auto_13373 ) ) ( HOIST-AT ?auto_13376 ?auto_13375 ) ( SURFACE-AT ?auto_13372 ?auto_13375 ) ( ON ?auto_13372 ?auto_13378 ) ( CLEAR ?auto_13372 ) ( not ( = ?auto_13371 ?auto_13372 ) ) ( not ( = ?auto_13371 ?auto_13378 ) ) ( not ( = ?auto_13372 ?auto_13378 ) ) ( not ( = ?auto_13374 ?auto_13376 ) ) ( IS-CRATE ?auto_13371 ) ( not ( = ?auto_13386 ?auto_13373 ) ) ( HOIST-AT ?auto_13391 ?auto_13386 ) ( AVAILABLE ?auto_13391 ) ( SURFACE-AT ?auto_13371 ?auto_13386 ) ( ON ?auto_13371 ?auto_13390 ) ( CLEAR ?auto_13371 ) ( not ( = ?auto_13368 ?auto_13371 ) ) ( not ( = ?auto_13368 ?auto_13390 ) ) ( not ( = ?auto_13371 ?auto_13390 ) ) ( not ( = ?auto_13374 ?auto_13391 ) ) ( IS-CRATE ?auto_13368 ) ( not ( = ?auto_13380 ?auto_13373 ) ) ( HOIST-AT ?auto_13388 ?auto_13380 ) ( SURFACE-AT ?auto_13368 ?auto_13380 ) ( ON ?auto_13368 ?auto_13387 ) ( CLEAR ?auto_13368 ) ( not ( = ?auto_13369 ?auto_13368 ) ) ( not ( = ?auto_13369 ?auto_13387 ) ) ( not ( = ?auto_13368 ?auto_13387 ) ) ( not ( = ?auto_13374 ?auto_13388 ) ) ( IS-CRATE ?auto_13369 ) ( not ( = ?auto_13383 ?auto_13373 ) ) ( HOIST-AT ?auto_13381 ?auto_13383 ) ( SURFACE-AT ?auto_13369 ?auto_13383 ) ( ON ?auto_13369 ?auto_13389 ) ( CLEAR ?auto_13369 ) ( not ( = ?auto_13370 ?auto_13369 ) ) ( not ( = ?auto_13370 ?auto_13389 ) ) ( not ( = ?auto_13369 ?auto_13389 ) ) ( not ( = ?auto_13374 ?auto_13381 ) ) ( IS-CRATE ?auto_13370 ) ( not ( = ?auto_13397 ?auto_13373 ) ) ( HOIST-AT ?auto_13379 ?auto_13397 ) ( SURFACE-AT ?auto_13370 ?auto_13397 ) ( ON ?auto_13370 ?auto_13394 ) ( CLEAR ?auto_13370 ) ( not ( = ?auto_13367 ?auto_13370 ) ) ( not ( = ?auto_13367 ?auto_13394 ) ) ( not ( = ?auto_13370 ?auto_13394 ) ) ( not ( = ?auto_13374 ?auto_13379 ) ) ( IS-CRATE ?auto_13367 ) ( SURFACE-AT ?auto_13367 ?auto_13380 ) ( ON ?auto_13367 ?auto_13393 ) ( CLEAR ?auto_13367 ) ( not ( = ?auto_13366 ?auto_13367 ) ) ( not ( = ?auto_13366 ?auto_13393 ) ) ( not ( = ?auto_13367 ?auto_13393 ) ) ( IS-CRATE ?auto_13366 ) ( AVAILABLE ?auto_13388 ) ( SURFACE-AT ?auto_13366 ?auto_13380 ) ( ON ?auto_13366 ?auto_13392 ) ( CLEAR ?auto_13366 ) ( not ( = ?auto_13365 ?auto_13366 ) ) ( not ( = ?auto_13365 ?auto_13392 ) ) ( not ( = ?auto_13366 ?auto_13392 ) ) ( IS-CRATE ?auto_13365 ) ( AVAILABLE ?auto_13379 ) ( SURFACE-AT ?auto_13365 ?auto_13397 ) ( ON ?auto_13365 ?auto_13384 ) ( CLEAR ?auto_13365 ) ( not ( = ?auto_13364 ?auto_13365 ) ) ( not ( = ?auto_13364 ?auto_13384 ) ) ( not ( = ?auto_13365 ?auto_13384 ) ) ( IS-CRATE ?auto_13364 ) ( AVAILABLE ?auto_13376 ) ( SURFACE-AT ?auto_13364 ?auto_13375 ) ( ON ?auto_13364 ?auto_13395 ) ( CLEAR ?auto_13364 ) ( not ( = ?auto_13363 ?auto_13364 ) ) ( not ( = ?auto_13363 ?auto_13395 ) ) ( not ( = ?auto_13364 ?auto_13395 ) ) ( IS-CRATE ?auto_13363 ) ( not ( = ?auto_13385 ?auto_13373 ) ) ( HOIST-AT ?auto_13396 ?auto_13385 ) ( AVAILABLE ?auto_13396 ) ( SURFACE-AT ?auto_13363 ?auto_13385 ) ( ON ?auto_13363 ?auto_13382 ) ( CLEAR ?auto_13363 ) ( not ( = ?auto_13362 ?auto_13363 ) ) ( not ( = ?auto_13362 ?auto_13382 ) ) ( not ( = ?auto_13363 ?auto_13382 ) ) ( not ( = ?auto_13374 ?auto_13396 ) ) ( SURFACE-AT ?auto_13361 ?auto_13373 ) ( CLEAR ?auto_13361 ) ( IS-CRATE ?auto_13362 ) ( AVAILABLE ?auto_13374 ) ( AVAILABLE ?auto_13381 ) ( SURFACE-AT ?auto_13362 ?auto_13383 ) ( ON ?auto_13362 ?auto_13398 ) ( CLEAR ?auto_13362 ) ( TRUCK-AT ?auto_13377 ?auto_13373 ) ( not ( = ?auto_13361 ?auto_13362 ) ) ( not ( = ?auto_13361 ?auto_13398 ) ) ( not ( = ?auto_13362 ?auto_13398 ) ) ( not ( = ?auto_13361 ?auto_13363 ) ) ( not ( = ?auto_13361 ?auto_13382 ) ) ( not ( = ?auto_13363 ?auto_13398 ) ) ( not ( = ?auto_13385 ?auto_13383 ) ) ( not ( = ?auto_13396 ?auto_13381 ) ) ( not ( = ?auto_13382 ?auto_13398 ) ) ( not ( = ?auto_13361 ?auto_13364 ) ) ( not ( = ?auto_13361 ?auto_13395 ) ) ( not ( = ?auto_13362 ?auto_13364 ) ) ( not ( = ?auto_13362 ?auto_13395 ) ) ( not ( = ?auto_13364 ?auto_13382 ) ) ( not ( = ?auto_13364 ?auto_13398 ) ) ( not ( = ?auto_13375 ?auto_13385 ) ) ( not ( = ?auto_13375 ?auto_13383 ) ) ( not ( = ?auto_13376 ?auto_13396 ) ) ( not ( = ?auto_13376 ?auto_13381 ) ) ( not ( = ?auto_13395 ?auto_13382 ) ) ( not ( = ?auto_13395 ?auto_13398 ) ) ( not ( = ?auto_13361 ?auto_13365 ) ) ( not ( = ?auto_13361 ?auto_13384 ) ) ( not ( = ?auto_13362 ?auto_13365 ) ) ( not ( = ?auto_13362 ?auto_13384 ) ) ( not ( = ?auto_13363 ?auto_13365 ) ) ( not ( = ?auto_13363 ?auto_13384 ) ) ( not ( = ?auto_13365 ?auto_13395 ) ) ( not ( = ?auto_13365 ?auto_13382 ) ) ( not ( = ?auto_13365 ?auto_13398 ) ) ( not ( = ?auto_13397 ?auto_13375 ) ) ( not ( = ?auto_13397 ?auto_13385 ) ) ( not ( = ?auto_13397 ?auto_13383 ) ) ( not ( = ?auto_13379 ?auto_13376 ) ) ( not ( = ?auto_13379 ?auto_13396 ) ) ( not ( = ?auto_13379 ?auto_13381 ) ) ( not ( = ?auto_13384 ?auto_13395 ) ) ( not ( = ?auto_13384 ?auto_13382 ) ) ( not ( = ?auto_13384 ?auto_13398 ) ) ( not ( = ?auto_13361 ?auto_13366 ) ) ( not ( = ?auto_13361 ?auto_13392 ) ) ( not ( = ?auto_13362 ?auto_13366 ) ) ( not ( = ?auto_13362 ?auto_13392 ) ) ( not ( = ?auto_13363 ?auto_13366 ) ) ( not ( = ?auto_13363 ?auto_13392 ) ) ( not ( = ?auto_13364 ?auto_13366 ) ) ( not ( = ?auto_13364 ?auto_13392 ) ) ( not ( = ?auto_13366 ?auto_13384 ) ) ( not ( = ?auto_13366 ?auto_13395 ) ) ( not ( = ?auto_13366 ?auto_13382 ) ) ( not ( = ?auto_13366 ?auto_13398 ) ) ( not ( = ?auto_13380 ?auto_13397 ) ) ( not ( = ?auto_13380 ?auto_13375 ) ) ( not ( = ?auto_13380 ?auto_13385 ) ) ( not ( = ?auto_13380 ?auto_13383 ) ) ( not ( = ?auto_13388 ?auto_13379 ) ) ( not ( = ?auto_13388 ?auto_13376 ) ) ( not ( = ?auto_13388 ?auto_13396 ) ) ( not ( = ?auto_13388 ?auto_13381 ) ) ( not ( = ?auto_13392 ?auto_13384 ) ) ( not ( = ?auto_13392 ?auto_13395 ) ) ( not ( = ?auto_13392 ?auto_13382 ) ) ( not ( = ?auto_13392 ?auto_13398 ) ) ( not ( = ?auto_13361 ?auto_13367 ) ) ( not ( = ?auto_13361 ?auto_13393 ) ) ( not ( = ?auto_13362 ?auto_13367 ) ) ( not ( = ?auto_13362 ?auto_13393 ) ) ( not ( = ?auto_13363 ?auto_13367 ) ) ( not ( = ?auto_13363 ?auto_13393 ) ) ( not ( = ?auto_13364 ?auto_13367 ) ) ( not ( = ?auto_13364 ?auto_13393 ) ) ( not ( = ?auto_13365 ?auto_13367 ) ) ( not ( = ?auto_13365 ?auto_13393 ) ) ( not ( = ?auto_13367 ?auto_13392 ) ) ( not ( = ?auto_13367 ?auto_13384 ) ) ( not ( = ?auto_13367 ?auto_13395 ) ) ( not ( = ?auto_13367 ?auto_13382 ) ) ( not ( = ?auto_13367 ?auto_13398 ) ) ( not ( = ?auto_13393 ?auto_13392 ) ) ( not ( = ?auto_13393 ?auto_13384 ) ) ( not ( = ?auto_13393 ?auto_13395 ) ) ( not ( = ?auto_13393 ?auto_13382 ) ) ( not ( = ?auto_13393 ?auto_13398 ) ) ( not ( = ?auto_13361 ?auto_13370 ) ) ( not ( = ?auto_13361 ?auto_13394 ) ) ( not ( = ?auto_13362 ?auto_13370 ) ) ( not ( = ?auto_13362 ?auto_13394 ) ) ( not ( = ?auto_13363 ?auto_13370 ) ) ( not ( = ?auto_13363 ?auto_13394 ) ) ( not ( = ?auto_13364 ?auto_13370 ) ) ( not ( = ?auto_13364 ?auto_13394 ) ) ( not ( = ?auto_13365 ?auto_13370 ) ) ( not ( = ?auto_13365 ?auto_13394 ) ) ( not ( = ?auto_13366 ?auto_13370 ) ) ( not ( = ?auto_13366 ?auto_13394 ) ) ( not ( = ?auto_13370 ?auto_13393 ) ) ( not ( = ?auto_13370 ?auto_13392 ) ) ( not ( = ?auto_13370 ?auto_13384 ) ) ( not ( = ?auto_13370 ?auto_13395 ) ) ( not ( = ?auto_13370 ?auto_13382 ) ) ( not ( = ?auto_13370 ?auto_13398 ) ) ( not ( = ?auto_13394 ?auto_13393 ) ) ( not ( = ?auto_13394 ?auto_13392 ) ) ( not ( = ?auto_13394 ?auto_13384 ) ) ( not ( = ?auto_13394 ?auto_13395 ) ) ( not ( = ?auto_13394 ?auto_13382 ) ) ( not ( = ?auto_13394 ?auto_13398 ) ) ( not ( = ?auto_13361 ?auto_13369 ) ) ( not ( = ?auto_13361 ?auto_13389 ) ) ( not ( = ?auto_13362 ?auto_13369 ) ) ( not ( = ?auto_13362 ?auto_13389 ) ) ( not ( = ?auto_13363 ?auto_13369 ) ) ( not ( = ?auto_13363 ?auto_13389 ) ) ( not ( = ?auto_13364 ?auto_13369 ) ) ( not ( = ?auto_13364 ?auto_13389 ) ) ( not ( = ?auto_13365 ?auto_13369 ) ) ( not ( = ?auto_13365 ?auto_13389 ) ) ( not ( = ?auto_13366 ?auto_13369 ) ) ( not ( = ?auto_13366 ?auto_13389 ) ) ( not ( = ?auto_13367 ?auto_13369 ) ) ( not ( = ?auto_13367 ?auto_13389 ) ) ( not ( = ?auto_13369 ?auto_13394 ) ) ( not ( = ?auto_13369 ?auto_13393 ) ) ( not ( = ?auto_13369 ?auto_13392 ) ) ( not ( = ?auto_13369 ?auto_13384 ) ) ( not ( = ?auto_13369 ?auto_13395 ) ) ( not ( = ?auto_13369 ?auto_13382 ) ) ( not ( = ?auto_13369 ?auto_13398 ) ) ( not ( = ?auto_13389 ?auto_13394 ) ) ( not ( = ?auto_13389 ?auto_13393 ) ) ( not ( = ?auto_13389 ?auto_13392 ) ) ( not ( = ?auto_13389 ?auto_13384 ) ) ( not ( = ?auto_13389 ?auto_13395 ) ) ( not ( = ?auto_13389 ?auto_13382 ) ) ( not ( = ?auto_13389 ?auto_13398 ) ) ( not ( = ?auto_13361 ?auto_13368 ) ) ( not ( = ?auto_13361 ?auto_13387 ) ) ( not ( = ?auto_13362 ?auto_13368 ) ) ( not ( = ?auto_13362 ?auto_13387 ) ) ( not ( = ?auto_13363 ?auto_13368 ) ) ( not ( = ?auto_13363 ?auto_13387 ) ) ( not ( = ?auto_13364 ?auto_13368 ) ) ( not ( = ?auto_13364 ?auto_13387 ) ) ( not ( = ?auto_13365 ?auto_13368 ) ) ( not ( = ?auto_13365 ?auto_13387 ) ) ( not ( = ?auto_13366 ?auto_13368 ) ) ( not ( = ?auto_13366 ?auto_13387 ) ) ( not ( = ?auto_13367 ?auto_13368 ) ) ( not ( = ?auto_13367 ?auto_13387 ) ) ( not ( = ?auto_13370 ?auto_13368 ) ) ( not ( = ?auto_13370 ?auto_13387 ) ) ( not ( = ?auto_13368 ?auto_13389 ) ) ( not ( = ?auto_13368 ?auto_13394 ) ) ( not ( = ?auto_13368 ?auto_13393 ) ) ( not ( = ?auto_13368 ?auto_13392 ) ) ( not ( = ?auto_13368 ?auto_13384 ) ) ( not ( = ?auto_13368 ?auto_13395 ) ) ( not ( = ?auto_13368 ?auto_13382 ) ) ( not ( = ?auto_13368 ?auto_13398 ) ) ( not ( = ?auto_13387 ?auto_13389 ) ) ( not ( = ?auto_13387 ?auto_13394 ) ) ( not ( = ?auto_13387 ?auto_13393 ) ) ( not ( = ?auto_13387 ?auto_13392 ) ) ( not ( = ?auto_13387 ?auto_13384 ) ) ( not ( = ?auto_13387 ?auto_13395 ) ) ( not ( = ?auto_13387 ?auto_13382 ) ) ( not ( = ?auto_13387 ?auto_13398 ) ) ( not ( = ?auto_13361 ?auto_13371 ) ) ( not ( = ?auto_13361 ?auto_13390 ) ) ( not ( = ?auto_13362 ?auto_13371 ) ) ( not ( = ?auto_13362 ?auto_13390 ) ) ( not ( = ?auto_13363 ?auto_13371 ) ) ( not ( = ?auto_13363 ?auto_13390 ) ) ( not ( = ?auto_13364 ?auto_13371 ) ) ( not ( = ?auto_13364 ?auto_13390 ) ) ( not ( = ?auto_13365 ?auto_13371 ) ) ( not ( = ?auto_13365 ?auto_13390 ) ) ( not ( = ?auto_13366 ?auto_13371 ) ) ( not ( = ?auto_13366 ?auto_13390 ) ) ( not ( = ?auto_13367 ?auto_13371 ) ) ( not ( = ?auto_13367 ?auto_13390 ) ) ( not ( = ?auto_13370 ?auto_13371 ) ) ( not ( = ?auto_13370 ?auto_13390 ) ) ( not ( = ?auto_13369 ?auto_13371 ) ) ( not ( = ?auto_13369 ?auto_13390 ) ) ( not ( = ?auto_13371 ?auto_13387 ) ) ( not ( = ?auto_13371 ?auto_13389 ) ) ( not ( = ?auto_13371 ?auto_13394 ) ) ( not ( = ?auto_13371 ?auto_13393 ) ) ( not ( = ?auto_13371 ?auto_13392 ) ) ( not ( = ?auto_13371 ?auto_13384 ) ) ( not ( = ?auto_13371 ?auto_13395 ) ) ( not ( = ?auto_13371 ?auto_13382 ) ) ( not ( = ?auto_13371 ?auto_13398 ) ) ( not ( = ?auto_13386 ?auto_13380 ) ) ( not ( = ?auto_13386 ?auto_13383 ) ) ( not ( = ?auto_13386 ?auto_13397 ) ) ( not ( = ?auto_13386 ?auto_13375 ) ) ( not ( = ?auto_13386 ?auto_13385 ) ) ( not ( = ?auto_13391 ?auto_13388 ) ) ( not ( = ?auto_13391 ?auto_13381 ) ) ( not ( = ?auto_13391 ?auto_13379 ) ) ( not ( = ?auto_13391 ?auto_13376 ) ) ( not ( = ?auto_13391 ?auto_13396 ) ) ( not ( = ?auto_13390 ?auto_13387 ) ) ( not ( = ?auto_13390 ?auto_13389 ) ) ( not ( = ?auto_13390 ?auto_13394 ) ) ( not ( = ?auto_13390 ?auto_13393 ) ) ( not ( = ?auto_13390 ?auto_13392 ) ) ( not ( = ?auto_13390 ?auto_13384 ) ) ( not ( = ?auto_13390 ?auto_13395 ) ) ( not ( = ?auto_13390 ?auto_13382 ) ) ( not ( = ?auto_13390 ?auto_13398 ) ) ( not ( = ?auto_13361 ?auto_13372 ) ) ( not ( = ?auto_13361 ?auto_13378 ) ) ( not ( = ?auto_13362 ?auto_13372 ) ) ( not ( = ?auto_13362 ?auto_13378 ) ) ( not ( = ?auto_13363 ?auto_13372 ) ) ( not ( = ?auto_13363 ?auto_13378 ) ) ( not ( = ?auto_13364 ?auto_13372 ) ) ( not ( = ?auto_13364 ?auto_13378 ) ) ( not ( = ?auto_13365 ?auto_13372 ) ) ( not ( = ?auto_13365 ?auto_13378 ) ) ( not ( = ?auto_13366 ?auto_13372 ) ) ( not ( = ?auto_13366 ?auto_13378 ) ) ( not ( = ?auto_13367 ?auto_13372 ) ) ( not ( = ?auto_13367 ?auto_13378 ) ) ( not ( = ?auto_13370 ?auto_13372 ) ) ( not ( = ?auto_13370 ?auto_13378 ) ) ( not ( = ?auto_13369 ?auto_13372 ) ) ( not ( = ?auto_13369 ?auto_13378 ) ) ( not ( = ?auto_13368 ?auto_13372 ) ) ( not ( = ?auto_13368 ?auto_13378 ) ) ( not ( = ?auto_13372 ?auto_13390 ) ) ( not ( = ?auto_13372 ?auto_13387 ) ) ( not ( = ?auto_13372 ?auto_13389 ) ) ( not ( = ?auto_13372 ?auto_13394 ) ) ( not ( = ?auto_13372 ?auto_13393 ) ) ( not ( = ?auto_13372 ?auto_13392 ) ) ( not ( = ?auto_13372 ?auto_13384 ) ) ( not ( = ?auto_13372 ?auto_13395 ) ) ( not ( = ?auto_13372 ?auto_13382 ) ) ( not ( = ?auto_13372 ?auto_13398 ) ) ( not ( = ?auto_13378 ?auto_13390 ) ) ( not ( = ?auto_13378 ?auto_13387 ) ) ( not ( = ?auto_13378 ?auto_13389 ) ) ( not ( = ?auto_13378 ?auto_13394 ) ) ( not ( = ?auto_13378 ?auto_13393 ) ) ( not ( = ?auto_13378 ?auto_13392 ) ) ( not ( = ?auto_13378 ?auto_13384 ) ) ( not ( = ?auto_13378 ?auto_13395 ) ) ( not ( = ?auto_13378 ?auto_13382 ) ) ( not ( = ?auto_13378 ?auto_13398 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_13361 ?auto_13362 ?auto_13363 ?auto_13364 ?auto_13365 ?auto_13366 ?auto_13367 ?auto_13370 ?auto_13369 ?auto_13368 ?auto_13371 )
      ( MAKE-1CRATE ?auto_13371 ?auto_13372 )
      ( MAKE-11CRATE-VERIFY ?auto_13361 ?auto_13362 ?auto_13363 ?auto_13364 ?auto_13365 ?auto_13366 ?auto_13367 ?auto_13370 ?auto_13369 ?auto_13368 ?auto_13371 ?auto_13372 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13401 - SURFACE
      ?auto_13402 - SURFACE
    )
    :vars
    (
      ?auto_13403 - HOIST
      ?auto_13404 - PLACE
      ?auto_13406 - PLACE
      ?auto_13407 - HOIST
      ?auto_13408 - SURFACE
      ?auto_13405 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13403 ?auto_13404 ) ( SURFACE-AT ?auto_13401 ?auto_13404 ) ( CLEAR ?auto_13401 ) ( IS-CRATE ?auto_13402 ) ( AVAILABLE ?auto_13403 ) ( not ( = ?auto_13406 ?auto_13404 ) ) ( HOIST-AT ?auto_13407 ?auto_13406 ) ( AVAILABLE ?auto_13407 ) ( SURFACE-AT ?auto_13402 ?auto_13406 ) ( ON ?auto_13402 ?auto_13408 ) ( CLEAR ?auto_13402 ) ( TRUCK-AT ?auto_13405 ?auto_13404 ) ( not ( = ?auto_13401 ?auto_13402 ) ) ( not ( = ?auto_13401 ?auto_13408 ) ) ( not ( = ?auto_13402 ?auto_13408 ) ) ( not ( = ?auto_13403 ?auto_13407 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13405 ?auto_13404 ?auto_13406 )
      ( !LIFT ?auto_13407 ?auto_13402 ?auto_13408 ?auto_13406 )
      ( !LOAD ?auto_13407 ?auto_13402 ?auto_13405 ?auto_13406 )
      ( !DRIVE ?auto_13405 ?auto_13406 ?auto_13404 )
      ( !UNLOAD ?auto_13403 ?auto_13402 ?auto_13405 ?auto_13404 )
      ( !DROP ?auto_13403 ?auto_13402 ?auto_13401 ?auto_13404 )
      ( MAKE-1CRATE-VERIFY ?auto_13401 ?auto_13402 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_13422 - SURFACE
      ?auto_13423 - SURFACE
      ?auto_13424 - SURFACE
      ?auto_13425 - SURFACE
      ?auto_13426 - SURFACE
      ?auto_13427 - SURFACE
      ?auto_13428 - SURFACE
      ?auto_13431 - SURFACE
      ?auto_13430 - SURFACE
      ?auto_13429 - SURFACE
      ?auto_13432 - SURFACE
      ?auto_13433 - SURFACE
      ?auto_13434 - SURFACE
    )
    :vars
    (
      ?auto_13435 - HOIST
      ?auto_13438 - PLACE
      ?auto_13439 - PLACE
      ?auto_13437 - HOIST
      ?auto_13436 - SURFACE
      ?auto_13442 - PLACE
      ?auto_13444 - HOIST
      ?auto_13445 - SURFACE
      ?auto_13456 - PLACE
      ?auto_13457 - HOIST
      ?auto_13450 - SURFACE
      ?auto_13448 - PLACE
      ?auto_13453 - HOIST
      ?auto_13458 - SURFACE
      ?auto_13460 - PLACE
      ?auto_13441 - HOIST
      ?auto_13452 - SURFACE
      ?auto_13461 - SURFACE
      ?auto_13446 - SURFACE
      ?auto_13449 - SURFACE
      ?auto_13443 - SURFACE
      ?auto_13459 - SURFACE
      ?auto_13454 - PLACE
      ?auto_13455 - HOIST
      ?auto_13447 - SURFACE
      ?auto_13451 - SURFACE
      ?auto_13440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13435 ?auto_13438 ) ( IS-CRATE ?auto_13434 ) ( not ( = ?auto_13439 ?auto_13438 ) ) ( HOIST-AT ?auto_13437 ?auto_13439 ) ( SURFACE-AT ?auto_13434 ?auto_13439 ) ( ON ?auto_13434 ?auto_13436 ) ( CLEAR ?auto_13434 ) ( not ( = ?auto_13433 ?auto_13434 ) ) ( not ( = ?auto_13433 ?auto_13436 ) ) ( not ( = ?auto_13434 ?auto_13436 ) ) ( not ( = ?auto_13435 ?auto_13437 ) ) ( IS-CRATE ?auto_13433 ) ( not ( = ?auto_13442 ?auto_13438 ) ) ( HOIST-AT ?auto_13444 ?auto_13442 ) ( SURFACE-AT ?auto_13433 ?auto_13442 ) ( ON ?auto_13433 ?auto_13445 ) ( CLEAR ?auto_13433 ) ( not ( = ?auto_13432 ?auto_13433 ) ) ( not ( = ?auto_13432 ?auto_13445 ) ) ( not ( = ?auto_13433 ?auto_13445 ) ) ( not ( = ?auto_13435 ?auto_13444 ) ) ( IS-CRATE ?auto_13432 ) ( not ( = ?auto_13456 ?auto_13438 ) ) ( HOIST-AT ?auto_13457 ?auto_13456 ) ( AVAILABLE ?auto_13457 ) ( SURFACE-AT ?auto_13432 ?auto_13456 ) ( ON ?auto_13432 ?auto_13450 ) ( CLEAR ?auto_13432 ) ( not ( = ?auto_13429 ?auto_13432 ) ) ( not ( = ?auto_13429 ?auto_13450 ) ) ( not ( = ?auto_13432 ?auto_13450 ) ) ( not ( = ?auto_13435 ?auto_13457 ) ) ( IS-CRATE ?auto_13429 ) ( not ( = ?auto_13448 ?auto_13438 ) ) ( HOIST-AT ?auto_13453 ?auto_13448 ) ( SURFACE-AT ?auto_13429 ?auto_13448 ) ( ON ?auto_13429 ?auto_13458 ) ( CLEAR ?auto_13429 ) ( not ( = ?auto_13430 ?auto_13429 ) ) ( not ( = ?auto_13430 ?auto_13458 ) ) ( not ( = ?auto_13429 ?auto_13458 ) ) ( not ( = ?auto_13435 ?auto_13453 ) ) ( IS-CRATE ?auto_13430 ) ( not ( = ?auto_13460 ?auto_13438 ) ) ( HOIST-AT ?auto_13441 ?auto_13460 ) ( SURFACE-AT ?auto_13430 ?auto_13460 ) ( ON ?auto_13430 ?auto_13452 ) ( CLEAR ?auto_13430 ) ( not ( = ?auto_13431 ?auto_13430 ) ) ( not ( = ?auto_13431 ?auto_13452 ) ) ( not ( = ?auto_13430 ?auto_13452 ) ) ( not ( = ?auto_13435 ?auto_13441 ) ) ( IS-CRATE ?auto_13431 ) ( SURFACE-AT ?auto_13431 ?auto_13439 ) ( ON ?auto_13431 ?auto_13461 ) ( CLEAR ?auto_13431 ) ( not ( = ?auto_13428 ?auto_13431 ) ) ( not ( = ?auto_13428 ?auto_13461 ) ) ( not ( = ?auto_13431 ?auto_13461 ) ) ( IS-CRATE ?auto_13428 ) ( SURFACE-AT ?auto_13428 ?auto_13448 ) ( ON ?auto_13428 ?auto_13446 ) ( CLEAR ?auto_13428 ) ( not ( = ?auto_13427 ?auto_13428 ) ) ( not ( = ?auto_13427 ?auto_13446 ) ) ( not ( = ?auto_13428 ?auto_13446 ) ) ( IS-CRATE ?auto_13427 ) ( AVAILABLE ?auto_13453 ) ( SURFACE-AT ?auto_13427 ?auto_13448 ) ( ON ?auto_13427 ?auto_13449 ) ( CLEAR ?auto_13427 ) ( not ( = ?auto_13426 ?auto_13427 ) ) ( not ( = ?auto_13426 ?auto_13449 ) ) ( not ( = ?auto_13427 ?auto_13449 ) ) ( IS-CRATE ?auto_13426 ) ( AVAILABLE ?auto_13437 ) ( SURFACE-AT ?auto_13426 ?auto_13439 ) ( ON ?auto_13426 ?auto_13443 ) ( CLEAR ?auto_13426 ) ( not ( = ?auto_13425 ?auto_13426 ) ) ( not ( = ?auto_13425 ?auto_13443 ) ) ( not ( = ?auto_13426 ?auto_13443 ) ) ( IS-CRATE ?auto_13425 ) ( AVAILABLE ?auto_13444 ) ( SURFACE-AT ?auto_13425 ?auto_13442 ) ( ON ?auto_13425 ?auto_13459 ) ( CLEAR ?auto_13425 ) ( not ( = ?auto_13424 ?auto_13425 ) ) ( not ( = ?auto_13424 ?auto_13459 ) ) ( not ( = ?auto_13425 ?auto_13459 ) ) ( IS-CRATE ?auto_13424 ) ( not ( = ?auto_13454 ?auto_13438 ) ) ( HOIST-AT ?auto_13455 ?auto_13454 ) ( AVAILABLE ?auto_13455 ) ( SURFACE-AT ?auto_13424 ?auto_13454 ) ( ON ?auto_13424 ?auto_13447 ) ( CLEAR ?auto_13424 ) ( not ( = ?auto_13423 ?auto_13424 ) ) ( not ( = ?auto_13423 ?auto_13447 ) ) ( not ( = ?auto_13424 ?auto_13447 ) ) ( not ( = ?auto_13435 ?auto_13455 ) ) ( SURFACE-AT ?auto_13422 ?auto_13438 ) ( CLEAR ?auto_13422 ) ( IS-CRATE ?auto_13423 ) ( AVAILABLE ?auto_13435 ) ( AVAILABLE ?auto_13441 ) ( SURFACE-AT ?auto_13423 ?auto_13460 ) ( ON ?auto_13423 ?auto_13451 ) ( CLEAR ?auto_13423 ) ( TRUCK-AT ?auto_13440 ?auto_13438 ) ( not ( = ?auto_13422 ?auto_13423 ) ) ( not ( = ?auto_13422 ?auto_13451 ) ) ( not ( = ?auto_13423 ?auto_13451 ) ) ( not ( = ?auto_13422 ?auto_13424 ) ) ( not ( = ?auto_13422 ?auto_13447 ) ) ( not ( = ?auto_13424 ?auto_13451 ) ) ( not ( = ?auto_13454 ?auto_13460 ) ) ( not ( = ?auto_13455 ?auto_13441 ) ) ( not ( = ?auto_13447 ?auto_13451 ) ) ( not ( = ?auto_13422 ?auto_13425 ) ) ( not ( = ?auto_13422 ?auto_13459 ) ) ( not ( = ?auto_13423 ?auto_13425 ) ) ( not ( = ?auto_13423 ?auto_13459 ) ) ( not ( = ?auto_13425 ?auto_13447 ) ) ( not ( = ?auto_13425 ?auto_13451 ) ) ( not ( = ?auto_13442 ?auto_13454 ) ) ( not ( = ?auto_13442 ?auto_13460 ) ) ( not ( = ?auto_13444 ?auto_13455 ) ) ( not ( = ?auto_13444 ?auto_13441 ) ) ( not ( = ?auto_13459 ?auto_13447 ) ) ( not ( = ?auto_13459 ?auto_13451 ) ) ( not ( = ?auto_13422 ?auto_13426 ) ) ( not ( = ?auto_13422 ?auto_13443 ) ) ( not ( = ?auto_13423 ?auto_13426 ) ) ( not ( = ?auto_13423 ?auto_13443 ) ) ( not ( = ?auto_13424 ?auto_13426 ) ) ( not ( = ?auto_13424 ?auto_13443 ) ) ( not ( = ?auto_13426 ?auto_13459 ) ) ( not ( = ?auto_13426 ?auto_13447 ) ) ( not ( = ?auto_13426 ?auto_13451 ) ) ( not ( = ?auto_13439 ?auto_13442 ) ) ( not ( = ?auto_13439 ?auto_13454 ) ) ( not ( = ?auto_13439 ?auto_13460 ) ) ( not ( = ?auto_13437 ?auto_13444 ) ) ( not ( = ?auto_13437 ?auto_13455 ) ) ( not ( = ?auto_13437 ?auto_13441 ) ) ( not ( = ?auto_13443 ?auto_13459 ) ) ( not ( = ?auto_13443 ?auto_13447 ) ) ( not ( = ?auto_13443 ?auto_13451 ) ) ( not ( = ?auto_13422 ?auto_13427 ) ) ( not ( = ?auto_13422 ?auto_13449 ) ) ( not ( = ?auto_13423 ?auto_13427 ) ) ( not ( = ?auto_13423 ?auto_13449 ) ) ( not ( = ?auto_13424 ?auto_13427 ) ) ( not ( = ?auto_13424 ?auto_13449 ) ) ( not ( = ?auto_13425 ?auto_13427 ) ) ( not ( = ?auto_13425 ?auto_13449 ) ) ( not ( = ?auto_13427 ?auto_13443 ) ) ( not ( = ?auto_13427 ?auto_13459 ) ) ( not ( = ?auto_13427 ?auto_13447 ) ) ( not ( = ?auto_13427 ?auto_13451 ) ) ( not ( = ?auto_13448 ?auto_13439 ) ) ( not ( = ?auto_13448 ?auto_13442 ) ) ( not ( = ?auto_13448 ?auto_13454 ) ) ( not ( = ?auto_13448 ?auto_13460 ) ) ( not ( = ?auto_13453 ?auto_13437 ) ) ( not ( = ?auto_13453 ?auto_13444 ) ) ( not ( = ?auto_13453 ?auto_13455 ) ) ( not ( = ?auto_13453 ?auto_13441 ) ) ( not ( = ?auto_13449 ?auto_13443 ) ) ( not ( = ?auto_13449 ?auto_13459 ) ) ( not ( = ?auto_13449 ?auto_13447 ) ) ( not ( = ?auto_13449 ?auto_13451 ) ) ( not ( = ?auto_13422 ?auto_13428 ) ) ( not ( = ?auto_13422 ?auto_13446 ) ) ( not ( = ?auto_13423 ?auto_13428 ) ) ( not ( = ?auto_13423 ?auto_13446 ) ) ( not ( = ?auto_13424 ?auto_13428 ) ) ( not ( = ?auto_13424 ?auto_13446 ) ) ( not ( = ?auto_13425 ?auto_13428 ) ) ( not ( = ?auto_13425 ?auto_13446 ) ) ( not ( = ?auto_13426 ?auto_13428 ) ) ( not ( = ?auto_13426 ?auto_13446 ) ) ( not ( = ?auto_13428 ?auto_13449 ) ) ( not ( = ?auto_13428 ?auto_13443 ) ) ( not ( = ?auto_13428 ?auto_13459 ) ) ( not ( = ?auto_13428 ?auto_13447 ) ) ( not ( = ?auto_13428 ?auto_13451 ) ) ( not ( = ?auto_13446 ?auto_13449 ) ) ( not ( = ?auto_13446 ?auto_13443 ) ) ( not ( = ?auto_13446 ?auto_13459 ) ) ( not ( = ?auto_13446 ?auto_13447 ) ) ( not ( = ?auto_13446 ?auto_13451 ) ) ( not ( = ?auto_13422 ?auto_13431 ) ) ( not ( = ?auto_13422 ?auto_13461 ) ) ( not ( = ?auto_13423 ?auto_13431 ) ) ( not ( = ?auto_13423 ?auto_13461 ) ) ( not ( = ?auto_13424 ?auto_13431 ) ) ( not ( = ?auto_13424 ?auto_13461 ) ) ( not ( = ?auto_13425 ?auto_13431 ) ) ( not ( = ?auto_13425 ?auto_13461 ) ) ( not ( = ?auto_13426 ?auto_13431 ) ) ( not ( = ?auto_13426 ?auto_13461 ) ) ( not ( = ?auto_13427 ?auto_13431 ) ) ( not ( = ?auto_13427 ?auto_13461 ) ) ( not ( = ?auto_13431 ?auto_13446 ) ) ( not ( = ?auto_13431 ?auto_13449 ) ) ( not ( = ?auto_13431 ?auto_13443 ) ) ( not ( = ?auto_13431 ?auto_13459 ) ) ( not ( = ?auto_13431 ?auto_13447 ) ) ( not ( = ?auto_13431 ?auto_13451 ) ) ( not ( = ?auto_13461 ?auto_13446 ) ) ( not ( = ?auto_13461 ?auto_13449 ) ) ( not ( = ?auto_13461 ?auto_13443 ) ) ( not ( = ?auto_13461 ?auto_13459 ) ) ( not ( = ?auto_13461 ?auto_13447 ) ) ( not ( = ?auto_13461 ?auto_13451 ) ) ( not ( = ?auto_13422 ?auto_13430 ) ) ( not ( = ?auto_13422 ?auto_13452 ) ) ( not ( = ?auto_13423 ?auto_13430 ) ) ( not ( = ?auto_13423 ?auto_13452 ) ) ( not ( = ?auto_13424 ?auto_13430 ) ) ( not ( = ?auto_13424 ?auto_13452 ) ) ( not ( = ?auto_13425 ?auto_13430 ) ) ( not ( = ?auto_13425 ?auto_13452 ) ) ( not ( = ?auto_13426 ?auto_13430 ) ) ( not ( = ?auto_13426 ?auto_13452 ) ) ( not ( = ?auto_13427 ?auto_13430 ) ) ( not ( = ?auto_13427 ?auto_13452 ) ) ( not ( = ?auto_13428 ?auto_13430 ) ) ( not ( = ?auto_13428 ?auto_13452 ) ) ( not ( = ?auto_13430 ?auto_13461 ) ) ( not ( = ?auto_13430 ?auto_13446 ) ) ( not ( = ?auto_13430 ?auto_13449 ) ) ( not ( = ?auto_13430 ?auto_13443 ) ) ( not ( = ?auto_13430 ?auto_13459 ) ) ( not ( = ?auto_13430 ?auto_13447 ) ) ( not ( = ?auto_13430 ?auto_13451 ) ) ( not ( = ?auto_13452 ?auto_13461 ) ) ( not ( = ?auto_13452 ?auto_13446 ) ) ( not ( = ?auto_13452 ?auto_13449 ) ) ( not ( = ?auto_13452 ?auto_13443 ) ) ( not ( = ?auto_13452 ?auto_13459 ) ) ( not ( = ?auto_13452 ?auto_13447 ) ) ( not ( = ?auto_13452 ?auto_13451 ) ) ( not ( = ?auto_13422 ?auto_13429 ) ) ( not ( = ?auto_13422 ?auto_13458 ) ) ( not ( = ?auto_13423 ?auto_13429 ) ) ( not ( = ?auto_13423 ?auto_13458 ) ) ( not ( = ?auto_13424 ?auto_13429 ) ) ( not ( = ?auto_13424 ?auto_13458 ) ) ( not ( = ?auto_13425 ?auto_13429 ) ) ( not ( = ?auto_13425 ?auto_13458 ) ) ( not ( = ?auto_13426 ?auto_13429 ) ) ( not ( = ?auto_13426 ?auto_13458 ) ) ( not ( = ?auto_13427 ?auto_13429 ) ) ( not ( = ?auto_13427 ?auto_13458 ) ) ( not ( = ?auto_13428 ?auto_13429 ) ) ( not ( = ?auto_13428 ?auto_13458 ) ) ( not ( = ?auto_13431 ?auto_13429 ) ) ( not ( = ?auto_13431 ?auto_13458 ) ) ( not ( = ?auto_13429 ?auto_13452 ) ) ( not ( = ?auto_13429 ?auto_13461 ) ) ( not ( = ?auto_13429 ?auto_13446 ) ) ( not ( = ?auto_13429 ?auto_13449 ) ) ( not ( = ?auto_13429 ?auto_13443 ) ) ( not ( = ?auto_13429 ?auto_13459 ) ) ( not ( = ?auto_13429 ?auto_13447 ) ) ( not ( = ?auto_13429 ?auto_13451 ) ) ( not ( = ?auto_13458 ?auto_13452 ) ) ( not ( = ?auto_13458 ?auto_13461 ) ) ( not ( = ?auto_13458 ?auto_13446 ) ) ( not ( = ?auto_13458 ?auto_13449 ) ) ( not ( = ?auto_13458 ?auto_13443 ) ) ( not ( = ?auto_13458 ?auto_13459 ) ) ( not ( = ?auto_13458 ?auto_13447 ) ) ( not ( = ?auto_13458 ?auto_13451 ) ) ( not ( = ?auto_13422 ?auto_13432 ) ) ( not ( = ?auto_13422 ?auto_13450 ) ) ( not ( = ?auto_13423 ?auto_13432 ) ) ( not ( = ?auto_13423 ?auto_13450 ) ) ( not ( = ?auto_13424 ?auto_13432 ) ) ( not ( = ?auto_13424 ?auto_13450 ) ) ( not ( = ?auto_13425 ?auto_13432 ) ) ( not ( = ?auto_13425 ?auto_13450 ) ) ( not ( = ?auto_13426 ?auto_13432 ) ) ( not ( = ?auto_13426 ?auto_13450 ) ) ( not ( = ?auto_13427 ?auto_13432 ) ) ( not ( = ?auto_13427 ?auto_13450 ) ) ( not ( = ?auto_13428 ?auto_13432 ) ) ( not ( = ?auto_13428 ?auto_13450 ) ) ( not ( = ?auto_13431 ?auto_13432 ) ) ( not ( = ?auto_13431 ?auto_13450 ) ) ( not ( = ?auto_13430 ?auto_13432 ) ) ( not ( = ?auto_13430 ?auto_13450 ) ) ( not ( = ?auto_13432 ?auto_13458 ) ) ( not ( = ?auto_13432 ?auto_13452 ) ) ( not ( = ?auto_13432 ?auto_13461 ) ) ( not ( = ?auto_13432 ?auto_13446 ) ) ( not ( = ?auto_13432 ?auto_13449 ) ) ( not ( = ?auto_13432 ?auto_13443 ) ) ( not ( = ?auto_13432 ?auto_13459 ) ) ( not ( = ?auto_13432 ?auto_13447 ) ) ( not ( = ?auto_13432 ?auto_13451 ) ) ( not ( = ?auto_13456 ?auto_13448 ) ) ( not ( = ?auto_13456 ?auto_13460 ) ) ( not ( = ?auto_13456 ?auto_13439 ) ) ( not ( = ?auto_13456 ?auto_13442 ) ) ( not ( = ?auto_13456 ?auto_13454 ) ) ( not ( = ?auto_13457 ?auto_13453 ) ) ( not ( = ?auto_13457 ?auto_13441 ) ) ( not ( = ?auto_13457 ?auto_13437 ) ) ( not ( = ?auto_13457 ?auto_13444 ) ) ( not ( = ?auto_13457 ?auto_13455 ) ) ( not ( = ?auto_13450 ?auto_13458 ) ) ( not ( = ?auto_13450 ?auto_13452 ) ) ( not ( = ?auto_13450 ?auto_13461 ) ) ( not ( = ?auto_13450 ?auto_13446 ) ) ( not ( = ?auto_13450 ?auto_13449 ) ) ( not ( = ?auto_13450 ?auto_13443 ) ) ( not ( = ?auto_13450 ?auto_13459 ) ) ( not ( = ?auto_13450 ?auto_13447 ) ) ( not ( = ?auto_13450 ?auto_13451 ) ) ( not ( = ?auto_13422 ?auto_13433 ) ) ( not ( = ?auto_13422 ?auto_13445 ) ) ( not ( = ?auto_13423 ?auto_13433 ) ) ( not ( = ?auto_13423 ?auto_13445 ) ) ( not ( = ?auto_13424 ?auto_13433 ) ) ( not ( = ?auto_13424 ?auto_13445 ) ) ( not ( = ?auto_13425 ?auto_13433 ) ) ( not ( = ?auto_13425 ?auto_13445 ) ) ( not ( = ?auto_13426 ?auto_13433 ) ) ( not ( = ?auto_13426 ?auto_13445 ) ) ( not ( = ?auto_13427 ?auto_13433 ) ) ( not ( = ?auto_13427 ?auto_13445 ) ) ( not ( = ?auto_13428 ?auto_13433 ) ) ( not ( = ?auto_13428 ?auto_13445 ) ) ( not ( = ?auto_13431 ?auto_13433 ) ) ( not ( = ?auto_13431 ?auto_13445 ) ) ( not ( = ?auto_13430 ?auto_13433 ) ) ( not ( = ?auto_13430 ?auto_13445 ) ) ( not ( = ?auto_13429 ?auto_13433 ) ) ( not ( = ?auto_13429 ?auto_13445 ) ) ( not ( = ?auto_13433 ?auto_13450 ) ) ( not ( = ?auto_13433 ?auto_13458 ) ) ( not ( = ?auto_13433 ?auto_13452 ) ) ( not ( = ?auto_13433 ?auto_13461 ) ) ( not ( = ?auto_13433 ?auto_13446 ) ) ( not ( = ?auto_13433 ?auto_13449 ) ) ( not ( = ?auto_13433 ?auto_13443 ) ) ( not ( = ?auto_13433 ?auto_13459 ) ) ( not ( = ?auto_13433 ?auto_13447 ) ) ( not ( = ?auto_13433 ?auto_13451 ) ) ( not ( = ?auto_13445 ?auto_13450 ) ) ( not ( = ?auto_13445 ?auto_13458 ) ) ( not ( = ?auto_13445 ?auto_13452 ) ) ( not ( = ?auto_13445 ?auto_13461 ) ) ( not ( = ?auto_13445 ?auto_13446 ) ) ( not ( = ?auto_13445 ?auto_13449 ) ) ( not ( = ?auto_13445 ?auto_13443 ) ) ( not ( = ?auto_13445 ?auto_13459 ) ) ( not ( = ?auto_13445 ?auto_13447 ) ) ( not ( = ?auto_13445 ?auto_13451 ) ) ( not ( = ?auto_13422 ?auto_13434 ) ) ( not ( = ?auto_13422 ?auto_13436 ) ) ( not ( = ?auto_13423 ?auto_13434 ) ) ( not ( = ?auto_13423 ?auto_13436 ) ) ( not ( = ?auto_13424 ?auto_13434 ) ) ( not ( = ?auto_13424 ?auto_13436 ) ) ( not ( = ?auto_13425 ?auto_13434 ) ) ( not ( = ?auto_13425 ?auto_13436 ) ) ( not ( = ?auto_13426 ?auto_13434 ) ) ( not ( = ?auto_13426 ?auto_13436 ) ) ( not ( = ?auto_13427 ?auto_13434 ) ) ( not ( = ?auto_13427 ?auto_13436 ) ) ( not ( = ?auto_13428 ?auto_13434 ) ) ( not ( = ?auto_13428 ?auto_13436 ) ) ( not ( = ?auto_13431 ?auto_13434 ) ) ( not ( = ?auto_13431 ?auto_13436 ) ) ( not ( = ?auto_13430 ?auto_13434 ) ) ( not ( = ?auto_13430 ?auto_13436 ) ) ( not ( = ?auto_13429 ?auto_13434 ) ) ( not ( = ?auto_13429 ?auto_13436 ) ) ( not ( = ?auto_13432 ?auto_13434 ) ) ( not ( = ?auto_13432 ?auto_13436 ) ) ( not ( = ?auto_13434 ?auto_13445 ) ) ( not ( = ?auto_13434 ?auto_13450 ) ) ( not ( = ?auto_13434 ?auto_13458 ) ) ( not ( = ?auto_13434 ?auto_13452 ) ) ( not ( = ?auto_13434 ?auto_13461 ) ) ( not ( = ?auto_13434 ?auto_13446 ) ) ( not ( = ?auto_13434 ?auto_13449 ) ) ( not ( = ?auto_13434 ?auto_13443 ) ) ( not ( = ?auto_13434 ?auto_13459 ) ) ( not ( = ?auto_13434 ?auto_13447 ) ) ( not ( = ?auto_13434 ?auto_13451 ) ) ( not ( = ?auto_13436 ?auto_13445 ) ) ( not ( = ?auto_13436 ?auto_13450 ) ) ( not ( = ?auto_13436 ?auto_13458 ) ) ( not ( = ?auto_13436 ?auto_13452 ) ) ( not ( = ?auto_13436 ?auto_13461 ) ) ( not ( = ?auto_13436 ?auto_13446 ) ) ( not ( = ?auto_13436 ?auto_13449 ) ) ( not ( = ?auto_13436 ?auto_13443 ) ) ( not ( = ?auto_13436 ?auto_13459 ) ) ( not ( = ?auto_13436 ?auto_13447 ) ) ( not ( = ?auto_13436 ?auto_13451 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_13422 ?auto_13423 ?auto_13424 ?auto_13425 ?auto_13426 ?auto_13427 ?auto_13428 ?auto_13431 ?auto_13430 ?auto_13429 ?auto_13432 ?auto_13433 )
      ( MAKE-1CRATE ?auto_13433 ?auto_13434 )
      ( MAKE-12CRATE-VERIFY ?auto_13422 ?auto_13423 ?auto_13424 ?auto_13425 ?auto_13426 ?auto_13427 ?auto_13428 ?auto_13431 ?auto_13430 ?auto_13429 ?auto_13432 ?auto_13433 ?auto_13434 ) )
  )

)

