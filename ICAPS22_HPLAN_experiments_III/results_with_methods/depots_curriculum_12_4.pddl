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
      ?auto_12956 - SURFACE
      ?auto_12957 - SURFACE
    )
    :vars
    (
      ?auto_12958 - HOIST
      ?auto_12959 - PLACE
      ?auto_12961 - PLACE
      ?auto_12962 - HOIST
      ?auto_12963 - SURFACE
      ?auto_12960 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12958 ?auto_12959 ) ( SURFACE-AT ?auto_12956 ?auto_12959 ) ( CLEAR ?auto_12956 ) ( IS-CRATE ?auto_12957 ) ( AVAILABLE ?auto_12958 ) ( not ( = ?auto_12961 ?auto_12959 ) ) ( HOIST-AT ?auto_12962 ?auto_12961 ) ( AVAILABLE ?auto_12962 ) ( SURFACE-AT ?auto_12957 ?auto_12961 ) ( ON ?auto_12957 ?auto_12963 ) ( CLEAR ?auto_12957 ) ( TRUCK-AT ?auto_12960 ?auto_12959 ) ( not ( = ?auto_12956 ?auto_12957 ) ) ( not ( = ?auto_12956 ?auto_12963 ) ) ( not ( = ?auto_12957 ?auto_12963 ) ) ( not ( = ?auto_12958 ?auto_12962 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12960 ?auto_12959 ?auto_12961 )
      ( !LIFT ?auto_12962 ?auto_12957 ?auto_12963 ?auto_12961 )
      ( !LOAD ?auto_12962 ?auto_12957 ?auto_12960 ?auto_12961 )
      ( !DRIVE ?auto_12960 ?auto_12961 ?auto_12959 )
      ( !UNLOAD ?auto_12958 ?auto_12957 ?auto_12960 ?auto_12959 )
      ( !DROP ?auto_12958 ?auto_12957 ?auto_12956 ?auto_12959 )
      ( MAKE-1CRATE-VERIFY ?auto_12956 ?auto_12957 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12966 - SURFACE
      ?auto_12967 - SURFACE
    )
    :vars
    (
      ?auto_12968 - HOIST
      ?auto_12969 - PLACE
      ?auto_12971 - PLACE
      ?auto_12972 - HOIST
      ?auto_12973 - SURFACE
      ?auto_12970 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12968 ?auto_12969 ) ( SURFACE-AT ?auto_12966 ?auto_12969 ) ( CLEAR ?auto_12966 ) ( IS-CRATE ?auto_12967 ) ( AVAILABLE ?auto_12968 ) ( not ( = ?auto_12971 ?auto_12969 ) ) ( HOIST-AT ?auto_12972 ?auto_12971 ) ( AVAILABLE ?auto_12972 ) ( SURFACE-AT ?auto_12967 ?auto_12971 ) ( ON ?auto_12967 ?auto_12973 ) ( CLEAR ?auto_12967 ) ( TRUCK-AT ?auto_12970 ?auto_12969 ) ( not ( = ?auto_12966 ?auto_12967 ) ) ( not ( = ?auto_12966 ?auto_12973 ) ) ( not ( = ?auto_12967 ?auto_12973 ) ) ( not ( = ?auto_12968 ?auto_12972 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12970 ?auto_12969 ?auto_12971 )
      ( !LIFT ?auto_12972 ?auto_12967 ?auto_12973 ?auto_12971 )
      ( !LOAD ?auto_12972 ?auto_12967 ?auto_12970 ?auto_12971 )
      ( !DRIVE ?auto_12970 ?auto_12971 ?auto_12969 )
      ( !UNLOAD ?auto_12968 ?auto_12967 ?auto_12970 ?auto_12969 )
      ( !DROP ?auto_12968 ?auto_12967 ?auto_12966 ?auto_12969 )
      ( MAKE-1CRATE-VERIFY ?auto_12966 ?auto_12967 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12977 - SURFACE
      ?auto_12978 - SURFACE
      ?auto_12979 - SURFACE
    )
    :vars
    (
      ?auto_12980 - HOIST
      ?auto_12984 - PLACE
      ?auto_12982 - PLACE
      ?auto_12981 - HOIST
      ?auto_12985 - SURFACE
      ?auto_12987 - PLACE
      ?auto_12986 - HOIST
      ?auto_12988 - SURFACE
      ?auto_12983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12980 ?auto_12984 ) ( IS-CRATE ?auto_12979 ) ( not ( = ?auto_12982 ?auto_12984 ) ) ( HOIST-AT ?auto_12981 ?auto_12982 ) ( AVAILABLE ?auto_12981 ) ( SURFACE-AT ?auto_12979 ?auto_12982 ) ( ON ?auto_12979 ?auto_12985 ) ( CLEAR ?auto_12979 ) ( not ( = ?auto_12978 ?auto_12979 ) ) ( not ( = ?auto_12978 ?auto_12985 ) ) ( not ( = ?auto_12979 ?auto_12985 ) ) ( not ( = ?auto_12980 ?auto_12981 ) ) ( SURFACE-AT ?auto_12977 ?auto_12984 ) ( CLEAR ?auto_12977 ) ( IS-CRATE ?auto_12978 ) ( AVAILABLE ?auto_12980 ) ( not ( = ?auto_12987 ?auto_12984 ) ) ( HOIST-AT ?auto_12986 ?auto_12987 ) ( AVAILABLE ?auto_12986 ) ( SURFACE-AT ?auto_12978 ?auto_12987 ) ( ON ?auto_12978 ?auto_12988 ) ( CLEAR ?auto_12978 ) ( TRUCK-AT ?auto_12983 ?auto_12984 ) ( not ( = ?auto_12977 ?auto_12978 ) ) ( not ( = ?auto_12977 ?auto_12988 ) ) ( not ( = ?auto_12978 ?auto_12988 ) ) ( not ( = ?auto_12980 ?auto_12986 ) ) ( not ( = ?auto_12977 ?auto_12979 ) ) ( not ( = ?auto_12977 ?auto_12985 ) ) ( not ( = ?auto_12979 ?auto_12988 ) ) ( not ( = ?auto_12982 ?auto_12987 ) ) ( not ( = ?auto_12981 ?auto_12986 ) ) ( not ( = ?auto_12985 ?auto_12988 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12977 ?auto_12978 )
      ( MAKE-1CRATE ?auto_12978 ?auto_12979 )
      ( MAKE-2CRATE-VERIFY ?auto_12977 ?auto_12978 ?auto_12979 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12991 - SURFACE
      ?auto_12992 - SURFACE
    )
    :vars
    (
      ?auto_12993 - HOIST
      ?auto_12994 - PLACE
      ?auto_12996 - PLACE
      ?auto_12997 - HOIST
      ?auto_12998 - SURFACE
      ?auto_12995 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12993 ?auto_12994 ) ( SURFACE-AT ?auto_12991 ?auto_12994 ) ( CLEAR ?auto_12991 ) ( IS-CRATE ?auto_12992 ) ( AVAILABLE ?auto_12993 ) ( not ( = ?auto_12996 ?auto_12994 ) ) ( HOIST-AT ?auto_12997 ?auto_12996 ) ( AVAILABLE ?auto_12997 ) ( SURFACE-AT ?auto_12992 ?auto_12996 ) ( ON ?auto_12992 ?auto_12998 ) ( CLEAR ?auto_12992 ) ( TRUCK-AT ?auto_12995 ?auto_12994 ) ( not ( = ?auto_12991 ?auto_12992 ) ) ( not ( = ?auto_12991 ?auto_12998 ) ) ( not ( = ?auto_12992 ?auto_12998 ) ) ( not ( = ?auto_12993 ?auto_12997 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12995 ?auto_12994 ?auto_12996 )
      ( !LIFT ?auto_12997 ?auto_12992 ?auto_12998 ?auto_12996 )
      ( !LOAD ?auto_12997 ?auto_12992 ?auto_12995 ?auto_12996 )
      ( !DRIVE ?auto_12995 ?auto_12996 ?auto_12994 )
      ( !UNLOAD ?auto_12993 ?auto_12992 ?auto_12995 ?auto_12994 )
      ( !DROP ?auto_12993 ?auto_12992 ?auto_12991 ?auto_12994 )
      ( MAKE-1CRATE-VERIFY ?auto_12991 ?auto_12992 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13003 - SURFACE
      ?auto_13004 - SURFACE
      ?auto_13005 - SURFACE
      ?auto_13006 - SURFACE
    )
    :vars
    (
      ?auto_13007 - HOIST
      ?auto_13011 - PLACE
      ?auto_13008 - PLACE
      ?auto_13009 - HOIST
      ?auto_13010 - SURFACE
      ?auto_13013 - PLACE
      ?auto_13015 - HOIST
      ?auto_13014 - SURFACE
      ?auto_13016 - SURFACE
      ?auto_13012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13007 ?auto_13011 ) ( IS-CRATE ?auto_13006 ) ( not ( = ?auto_13008 ?auto_13011 ) ) ( HOIST-AT ?auto_13009 ?auto_13008 ) ( SURFACE-AT ?auto_13006 ?auto_13008 ) ( ON ?auto_13006 ?auto_13010 ) ( CLEAR ?auto_13006 ) ( not ( = ?auto_13005 ?auto_13006 ) ) ( not ( = ?auto_13005 ?auto_13010 ) ) ( not ( = ?auto_13006 ?auto_13010 ) ) ( not ( = ?auto_13007 ?auto_13009 ) ) ( IS-CRATE ?auto_13005 ) ( not ( = ?auto_13013 ?auto_13011 ) ) ( HOIST-AT ?auto_13015 ?auto_13013 ) ( AVAILABLE ?auto_13015 ) ( SURFACE-AT ?auto_13005 ?auto_13013 ) ( ON ?auto_13005 ?auto_13014 ) ( CLEAR ?auto_13005 ) ( not ( = ?auto_13004 ?auto_13005 ) ) ( not ( = ?auto_13004 ?auto_13014 ) ) ( not ( = ?auto_13005 ?auto_13014 ) ) ( not ( = ?auto_13007 ?auto_13015 ) ) ( SURFACE-AT ?auto_13003 ?auto_13011 ) ( CLEAR ?auto_13003 ) ( IS-CRATE ?auto_13004 ) ( AVAILABLE ?auto_13007 ) ( AVAILABLE ?auto_13009 ) ( SURFACE-AT ?auto_13004 ?auto_13008 ) ( ON ?auto_13004 ?auto_13016 ) ( CLEAR ?auto_13004 ) ( TRUCK-AT ?auto_13012 ?auto_13011 ) ( not ( = ?auto_13003 ?auto_13004 ) ) ( not ( = ?auto_13003 ?auto_13016 ) ) ( not ( = ?auto_13004 ?auto_13016 ) ) ( not ( = ?auto_13003 ?auto_13005 ) ) ( not ( = ?auto_13003 ?auto_13014 ) ) ( not ( = ?auto_13005 ?auto_13016 ) ) ( not ( = ?auto_13013 ?auto_13008 ) ) ( not ( = ?auto_13015 ?auto_13009 ) ) ( not ( = ?auto_13014 ?auto_13016 ) ) ( not ( = ?auto_13003 ?auto_13006 ) ) ( not ( = ?auto_13003 ?auto_13010 ) ) ( not ( = ?auto_13004 ?auto_13006 ) ) ( not ( = ?auto_13004 ?auto_13010 ) ) ( not ( = ?auto_13006 ?auto_13014 ) ) ( not ( = ?auto_13006 ?auto_13016 ) ) ( not ( = ?auto_13010 ?auto_13014 ) ) ( not ( = ?auto_13010 ?auto_13016 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13003 ?auto_13004 ?auto_13005 )
      ( MAKE-1CRATE ?auto_13005 ?auto_13006 )
      ( MAKE-3CRATE-VERIFY ?auto_13003 ?auto_13004 ?auto_13005 ?auto_13006 ) )
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
      ?auto_13041 - HOIST
      ?auto_13040 - PLACE
      ?auto_13038 - PLACE
      ?auto_13039 - HOIST
      ?auto_13042 - SURFACE
      ?auto_13048 - PLACE
      ?auto_13043 - HOIST
      ?auto_13049 - SURFACE
      ?auto_13047 - PLACE
      ?auto_13044 - HOIST
      ?auto_13045 - SURFACE
      ?auto_13046 - SURFACE
      ?auto_13037 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13041 ?auto_13040 ) ( IS-CRATE ?auto_13036 ) ( not ( = ?auto_13038 ?auto_13040 ) ) ( HOIST-AT ?auto_13039 ?auto_13038 ) ( AVAILABLE ?auto_13039 ) ( SURFACE-AT ?auto_13036 ?auto_13038 ) ( ON ?auto_13036 ?auto_13042 ) ( CLEAR ?auto_13036 ) ( not ( = ?auto_13035 ?auto_13036 ) ) ( not ( = ?auto_13035 ?auto_13042 ) ) ( not ( = ?auto_13036 ?auto_13042 ) ) ( not ( = ?auto_13041 ?auto_13039 ) ) ( IS-CRATE ?auto_13035 ) ( not ( = ?auto_13048 ?auto_13040 ) ) ( HOIST-AT ?auto_13043 ?auto_13048 ) ( SURFACE-AT ?auto_13035 ?auto_13048 ) ( ON ?auto_13035 ?auto_13049 ) ( CLEAR ?auto_13035 ) ( not ( = ?auto_13034 ?auto_13035 ) ) ( not ( = ?auto_13034 ?auto_13049 ) ) ( not ( = ?auto_13035 ?auto_13049 ) ) ( not ( = ?auto_13041 ?auto_13043 ) ) ( IS-CRATE ?auto_13034 ) ( not ( = ?auto_13047 ?auto_13040 ) ) ( HOIST-AT ?auto_13044 ?auto_13047 ) ( AVAILABLE ?auto_13044 ) ( SURFACE-AT ?auto_13034 ?auto_13047 ) ( ON ?auto_13034 ?auto_13045 ) ( CLEAR ?auto_13034 ) ( not ( = ?auto_13033 ?auto_13034 ) ) ( not ( = ?auto_13033 ?auto_13045 ) ) ( not ( = ?auto_13034 ?auto_13045 ) ) ( not ( = ?auto_13041 ?auto_13044 ) ) ( SURFACE-AT ?auto_13032 ?auto_13040 ) ( CLEAR ?auto_13032 ) ( IS-CRATE ?auto_13033 ) ( AVAILABLE ?auto_13041 ) ( AVAILABLE ?auto_13043 ) ( SURFACE-AT ?auto_13033 ?auto_13048 ) ( ON ?auto_13033 ?auto_13046 ) ( CLEAR ?auto_13033 ) ( TRUCK-AT ?auto_13037 ?auto_13040 ) ( not ( = ?auto_13032 ?auto_13033 ) ) ( not ( = ?auto_13032 ?auto_13046 ) ) ( not ( = ?auto_13033 ?auto_13046 ) ) ( not ( = ?auto_13032 ?auto_13034 ) ) ( not ( = ?auto_13032 ?auto_13045 ) ) ( not ( = ?auto_13034 ?auto_13046 ) ) ( not ( = ?auto_13047 ?auto_13048 ) ) ( not ( = ?auto_13044 ?auto_13043 ) ) ( not ( = ?auto_13045 ?auto_13046 ) ) ( not ( = ?auto_13032 ?auto_13035 ) ) ( not ( = ?auto_13032 ?auto_13049 ) ) ( not ( = ?auto_13033 ?auto_13035 ) ) ( not ( = ?auto_13033 ?auto_13049 ) ) ( not ( = ?auto_13035 ?auto_13045 ) ) ( not ( = ?auto_13035 ?auto_13046 ) ) ( not ( = ?auto_13049 ?auto_13045 ) ) ( not ( = ?auto_13049 ?auto_13046 ) ) ( not ( = ?auto_13032 ?auto_13036 ) ) ( not ( = ?auto_13032 ?auto_13042 ) ) ( not ( = ?auto_13033 ?auto_13036 ) ) ( not ( = ?auto_13033 ?auto_13042 ) ) ( not ( = ?auto_13034 ?auto_13036 ) ) ( not ( = ?auto_13034 ?auto_13042 ) ) ( not ( = ?auto_13036 ?auto_13049 ) ) ( not ( = ?auto_13036 ?auto_13045 ) ) ( not ( = ?auto_13036 ?auto_13046 ) ) ( not ( = ?auto_13038 ?auto_13048 ) ) ( not ( = ?auto_13038 ?auto_13047 ) ) ( not ( = ?auto_13039 ?auto_13043 ) ) ( not ( = ?auto_13039 ?auto_13044 ) ) ( not ( = ?auto_13042 ?auto_13049 ) ) ( not ( = ?auto_13042 ?auto_13045 ) ) ( not ( = ?auto_13042 ?auto_13046 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_13032 ?auto_13033 ?auto_13034 ?auto_13035 )
      ( MAKE-1CRATE ?auto_13035 ?auto_13036 )
      ( MAKE-4CRATE-VERIFY ?auto_13032 ?auto_13033 ?auto_13034 ?auto_13035 ?auto_13036 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13052 - SURFACE
      ?auto_13053 - SURFACE
    )
    :vars
    (
      ?auto_13054 - HOIST
      ?auto_13055 - PLACE
      ?auto_13057 - PLACE
      ?auto_13058 - HOIST
      ?auto_13059 - SURFACE
      ?auto_13056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13054 ?auto_13055 ) ( SURFACE-AT ?auto_13052 ?auto_13055 ) ( CLEAR ?auto_13052 ) ( IS-CRATE ?auto_13053 ) ( AVAILABLE ?auto_13054 ) ( not ( = ?auto_13057 ?auto_13055 ) ) ( HOIST-AT ?auto_13058 ?auto_13057 ) ( AVAILABLE ?auto_13058 ) ( SURFACE-AT ?auto_13053 ?auto_13057 ) ( ON ?auto_13053 ?auto_13059 ) ( CLEAR ?auto_13053 ) ( TRUCK-AT ?auto_13056 ?auto_13055 ) ( not ( = ?auto_13052 ?auto_13053 ) ) ( not ( = ?auto_13052 ?auto_13059 ) ) ( not ( = ?auto_13053 ?auto_13059 ) ) ( not ( = ?auto_13054 ?auto_13058 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13056 ?auto_13055 ?auto_13057 )
      ( !LIFT ?auto_13058 ?auto_13053 ?auto_13059 ?auto_13057 )
      ( !LOAD ?auto_13058 ?auto_13053 ?auto_13056 ?auto_13057 )
      ( !DRIVE ?auto_13056 ?auto_13057 ?auto_13055 )
      ( !UNLOAD ?auto_13054 ?auto_13053 ?auto_13056 ?auto_13055 )
      ( !DROP ?auto_13054 ?auto_13053 ?auto_13052 ?auto_13055 )
      ( MAKE-1CRATE-VERIFY ?auto_13052 ?auto_13053 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_13066 - SURFACE
      ?auto_13067 - SURFACE
      ?auto_13068 - SURFACE
      ?auto_13069 - SURFACE
      ?auto_13070 - SURFACE
      ?auto_13071 - SURFACE
    )
    :vars
    (
      ?auto_13075 - HOIST
      ?auto_13076 - PLACE
      ?auto_13074 - PLACE
      ?auto_13073 - HOIST
      ?auto_13072 - SURFACE
      ?auto_13082 - PLACE
      ?auto_13083 - HOIST
      ?auto_13078 - SURFACE
      ?auto_13086 - PLACE
      ?auto_13085 - HOIST
      ?auto_13080 - SURFACE
      ?auto_13087 - PLACE
      ?auto_13081 - HOIST
      ?auto_13079 - SURFACE
      ?auto_13084 - SURFACE
      ?auto_13077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13075 ?auto_13076 ) ( IS-CRATE ?auto_13071 ) ( not ( = ?auto_13074 ?auto_13076 ) ) ( HOIST-AT ?auto_13073 ?auto_13074 ) ( AVAILABLE ?auto_13073 ) ( SURFACE-AT ?auto_13071 ?auto_13074 ) ( ON ?auto_13071 ?auto_13072 ) ( CLEAR ?auto_13071 ) ( not ( = ?auto_13070 ?auto_13071 ) ) ( not ( = ?auto_13070 ?auto_13072 ) ) ( not ( = ?auto_13071 ?auto_13072 ) ) ( not ( = ?auto_13075 ?auto_13073 ) ) ( IS-CRATE ?auto_13070 ) ( not ( = ?auto_13082 ?auto_13076 ) ) ( HOIST-AT ?auto_13083 ?auto_13082 ) ( AVAILABLE ?auto_13083 ) ( SURFACE-AT ?auto_13070 ?auto_13082 ) ( ON ?auto_13070 ?auto_13078 ) ( CLEAR ?auto_13070 ) ( not ( = ?auto_13069 ?auto_13070 ) ) ( not ( = ?auto_13069 ?auto_13078 ) ) ( not ( = ?auto_13070 ?auto_13078 ) ) ( not ( = ?auto_13075 ?auto_13083 ) ) ( IS-CRATE ?auto_13069 ) ( not ( = ?auto_13086 ?auto_13076 ) ) ( HOIST-AT ?auto_13085 ?auto_13086 ) ( SURFACE-AT ?auto_13069 ?auto_13086 ) ( ON ?auto_13069 ?auto_13080 ) ( CLEAR ?auto_13069 ) ( not ( = ?auto_13068 ?auto_13069 ) ) ( not ( = ?auto_13068 ?auto_13080 ) ) ( not ( = ?auto_13069 ?auto_13080 ) ) ( not ( = ?auto_13075 ?auto_13085 ) ) ( IS-CRATE ?auto_13068 ) ( not ( = ?auto_13087 ?auto_13076 ) ) ( HOIST-AT ?auto_13081 ?auto_13087 ) ( AVAILABLE ?auto_13081 ) ( SURFACE-AT ?auto_13068 ?auto_13087 ) ( ON ?auto_13068 ?auto_13079 ) ( CLEAR ?auto_13068 ) ( not ( = ?auto_13067 ?auto_13068 ) ) ( not ( = ?auto_13067 ?auto_13079 ) ) ( not ( = ?auto_13068 ?auto_13079 ) ) ( not ( = ?auto_13075 ?auto_13081 ) ) ( SURFACE-AT ?auto_13066 ?auto_13076 ) ( CLEAR ?auto_13066 ) ( IS-CRATE ?auto_13067 ) ( AVAILABLE ?auto_13075 ) ( AVAILABLE ?auto_13085 ) ( SURFACE-AT ?auto_13067 ?auto_13086 ) ( ON ?auto_13067 ?auto_13084 ) ( CLEAR ?auto_13067 ) ( TRUCK-AT ?auto_13077 ?auto_13076 ) ( not ( = ?auto_13066 ?auto_13067 ) ) ( not ( = ?auto_13066 ?auto_13084 ) ) ( not ( = ?auto_13067 ?auto_13084 ) ) ( not ( = ?auto_13066 ?auto_13068 ) ) ( not ( = ?auto_13066 ?auto_13079 ) ) ( not ( = ?auto_13068 ?auto_13084 ) ) ( not ( = ?auto_13087 ?auto_13086 ) ) ( not ( = ?auto_13081 ?auto_13085 ) ) ( not ( = ?auto_13079 ?auto_13084 ) ) ( not ( = ?auto_13066 ?auto_13069 ) ) ( not ( = ?auto_13066 ?auto_13080 ) ) ( not ( = ?auto_13067 ?auto_13069 ) ) ( not ( = ?auto_13067 ?auto_13080 ) ) ( not ( = ?auto_13069 ?auto_13079 ) ) ( not ( = ?auto_13069 ?auto_13084 ) ) ( not ( = ?auto_13080 ?auto_13079 ) ) ( not ( = ?auto_13080 ?auto_13084 ) ) ( not ( = ?auto_13066 ?auto_13070 ) ) ( not ( = ?auto_13066 ?auto_13078 ) ) ( not ( = ?auto_13067 ?auto_13070 ) ) ( not ( = ?auto_13067 ?auto_13078 ) ) ( not ( = ?auto_13068 ?auto_13070 ) ) ( not ( = ?auto_13068 ?auto_13078 ) ) ( not ( = ?auto_13070 ?auto_13080 ) ) ( not ( = ?auto_13070 ?auto_13079 ) ) ( not ( = ?auto_13070 ?auto_13084 ) ) ( not ( = ?auto_13082 ?auto_13086 ) ) ( not ( = ?auto_13082 ?auto_13087 ) ) ( not ( = ?auto_13083 ?auto_13085 ) ) ( not ( = ?auto_13083 ?auto_13081 ) ) ( not ( = ?auto_13078 ?auto_13080 ) ) ( not ( = ?auto_13078 ?auto_13079 ) ) ( not ( = ?auto_13078 ?auto_13084 ) ) ( not ( = ?auto_13066 ?auto_13071 ) ) ( not ( = ?auto_13066 ?auto_13072 ) ) ( not ( = ?auto_13067 ?auto_13071 ) ) ( not ( = ?auto_13067 ?auto_13072 ) ) ( not ( = ?auto_13068 ?auto_13071 ) ) ( not ( = ?auto_13068 ?auto_13072 ) ) ( not ( = ?auto_13069 ?auto_13071 ) ) ( not ( = ?auto_13069 ?auto_13072 ) ) ( not ( = ?auto_13071 ?auto_13078 ) ) ( not ( = ?auto_13071 ?auto_13080 ) ) ( not ( = ?auto_13071 ?auto_13079 ) ) ( not ( = ?auto_13071 ?auto_13084 ) ) ( not ( = ?auto_13074 ?auto_13082 ) ) ( not ( = ?auto_13074 ?auto_13086 ) ) ( not ( = ?auto_13074 ?auto_13087 ) ) ( not ( = ?auto_13073 ?auto_13083 ) ) ( not ( = ?auto_13073 ?auto_13085 ) ) ( not ( = ?auto_13073 ?auto_13081 ) ) ( not ( = ?auto_13072 ?auto_13078 ) ) ( not ( = ?auto_13072 ?auto_13080 ) ) ( not ( = ?auto_13072 ?auto_13079 ) ) ( not ( = ?auto_13072 ?auto_13084 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_13066 ?auto_13067 ?auto_13068 ?auto_13069 ?auto_13070 )
      ( MAKE-1CRATE ?auto_13070 ?auto_13071 )
      ( MAKE-5CRATE-VERIFY ?auto_13066 ?auto_13067 ?auto_13068 ?auto_13069 ?auto_13070 ?auto_13071 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13090 - SURFACE
      ?auto_13091 - SURFACE
    )
    :vars
    (
      ?auto_13092 - HOIST
      ?auto_13093 - PLACE
      ?auto_13095 - PLACE
      ?auto_13096 - HOIST
      ?auto_13097 - SURFACE
      ?auto_13094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13092 ?auto_13093 ) ( SURFACE-AT ?auto_13090 ?auto_13093 ) ( CLEAR ?auto_13090 ) ( IS-CRATE ?auto_13091 ) ( AVAILABLE ?auto_13092 ) ( not ( = ?auto_13095 ?auto_13093 ) ) ( HOIST-AT ?auto_13096 ?auto_13095 ) ( AVAILABLE ?auto_13096 ) ( SURFACE-AT ?auto_13091 ?auto_13095 ) ( ON ?auto_13091 ?auto_13097 ) ( CLEAR ?auto_13091 ) ( TRUCK-AT ?auto_13094 ?auto_13093 ) ( not ( = ?auto_13090 ?auto_13091 ) ) ( not ( = ?auto_13090 ?auto_13097 ) ) ( not ( = ?auto_13091 ?auto_13097 ) ) ( not ( = ?auto_13092 ?auto_13096 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13094 ?auto_13093 ?auto_13095 )
      ( !LIFT ?auto_13096 ?auto_13091 ?auto_13097 ?auto_13095 )
      ( !LOAD ?auto_13096 ?auto_13091 ?auto_13094 ?auto_13095 )
      ( !DRIVE ?auto_13094 ?auto_13095 ?auto_13093 )
      ( !UNLOAD ?auto_13092 ?auto_13091 ?auto_13094 ?auto_13093 )
      ( !DROP ?auto_13092 ?auto_13091 ?auto_13090 ?auto_13093 )
      ( MAKE-1CRATE-VERIFY ?auto_13090 ?auto_13091 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_13105 - SURFACE
      ?auto_13106 - SURFACE
      ?auto_13107 - SURFACE
      ?auto_13108 - SURFACE
      ?auto_13109 - SURFACE
      ?auto_13110 - SURFACE
      ?auto_13111 - SURFACE
    )
    :vars
    (
      ?auto_13116 - HOIST
      ?auto_13117 - PLACE
      ?auto_13114 - PLACE
      ?auto_13115 - HOIST
      ?auto_13113 - SURFACE
      ?auto_13128 - PLACE
      ?auto_13120 - HOIST
      ?auto_13121 - SURFACE
      ?auto_13118 - PLACE
      ?auto_13124 - HOIST
      ?auto_13125 - SURFACE
      ?auto_13119 - PLACE
      ?auto_13126 - HOIST
      ?auto_13123 - SURFACE
      ?auto_13122 - SURFACE
      ?auto_13127 - SURFACE
      ?auto_13112 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13116 ?auto_13117 ) ( IS-CRATE ?auto_13111 ) ( not ( = ?auto_13114 ?auto_13117 ) ) ( HOIST-AT ?auto_13115 ?auto_13114 ) ( SURFACE-AT ?auto_13111 ?auto_13114 ) ( ON ?auto_13111 ?auto_13113 ) ( CLEAR ?auto_13111 ) ( not ( = ?auto_13110 ?auto_13111 ) ) ( not ( = ?auto_13110 ?auto_13113 ) ) ( not ( = ?auto_13111 ?auto_13113 ) ) ( not ( = ?auto_13116 ?auto_13115 ) ) ( IS-CRATE ?auto_13110 ) ( not ( = ?auto_13128 ?auto_13117 ) ) ( HOIST-AT ?auto_13120 ?auto_13128 ) ( AVAILABLE ?auto_13120 ) ( SURFACE-AT ?auto_13110 ?auto_13128 ) ( ON ?auto_13110 ?auto_13121 ) ( CLEAR ?auto_13110 ) ( not ( = ?auto_13109 ?auto_13110 ) ) ( not ( = ?auto_13109 ?auto_13121 ) ) ( not ( = ?auto_13110 ?auto_13121 ) ) ( not ( = ?auto_13116 ?auto_13120 ) ) ( IS-CRATE ?auto_13109 ) ( not ( = ?auto_13118 ?auto_13117 ) ) ( HOIST-AT ?auto_13124 ?auto_13118 ) ( AVAILABLE ?auto_13124 ) ( SURFACE-AT ?auto_13109 ?auto_13118 ) ( ON ?auto_13109 ?auto_13125 ) ( CLEAR ?auto_13109 ) ( not ( = ?auto_13108 ?auto_13109 ) ) ( not ( = ?auto_13108 ?auto_13125 ) ) ( not ( = ?auto_13109 ?auto_13125 ) ) ( not ( = ?auto_13116 ?auto_13124 ) ) ( IS-CRATE ?auto_13108 ) ( not ( = ?auto_13119 ?auto_13117 ) ) ( HOIST-AT ?auto_13126 ?auto_13119 ) ( SURFACE-AT ?auto_13108 ?auto_13119 ) ( ON ?auto_13108 ?auto_13123 ) ( CLEAR ?auto_13108 ) ( not ( = ?auto_13107 ?auto_13108 ) ) ( not ( = ?auto_13107 ?auto_13123 ) ) ( not ( = ?auto_13108 ?auto_13123 ) ) ( not ( = ?auto_13116 ?auto_13126 ) ) ( IS-CRATE ?auto_13107 ) ( AVAILABLE ?auto_13115 ) ( SURFACE-AT ?auto_13107 ?auto_13114 ) ( ON ?auto_13107 ?auto_13122 ) ( CLEAR ?auto_13107 ) ( not ( = ?auto_13106 ?auto_13107 ) ) ( not ( = ?auto_13106 ?auto_13122 ) ) ( not ( = ?auto_13107 ?auto_13122 ) ) ( SURFACE-AT ?auto_13105 ?auto_13117 ) ( CLEAR ?auto_13105 ) ( IS-CRATE ?auto_13106 ) ( AVAILABLE ?auto_13116 ) ( AVAILABLE ?auto_13126 ) ( SURFACE-AT ?auto_13106 ?auto_13119 ) ( ON ?auto_13106 ?auto_13127 ) ( CLEAR ?auto_13106 ) ( TRUCK-AT ?auto_13112 ?auto_13117 ) ( not ( = ?auto_13105 ?auto_13106 ) ) ( not ( = ?auto_13105 ?auto_13127 ) ) ( not ( = ?auto_13106 ?auto_13127 ) ) ( not ( = ?auto_13105 ?auto_13107 ) ) ( not ( = ?auto_13105 ?auto_13122 ) ) ( not ( = ?auto_13107 ?auto_13127 ) ) ( not ( = ?auto_13114 ?auto_13119 ) ) ( not ( = ?auto_13115 ?auto_13126 ) ) ( not ( = ?auto_13122 ?auto_13127 ) ) ( not ( = ?auto_13105 ?auto_13108 ) ) ( not ( = ?auto_13105 ?auto_13123 ) ) ( not ( = ?auto_13106 ?auto_13108 ) ) ( not ( = ?auto_13106 ?auto_13123 ) ) ( not ( = ?auto_13108 ?auto_13122 ) ) ( not ( = ?auto_13108 ?auto_13127 ) ) ( not ( = ?auto_13123 ?auto_13122 ) ) ( not ( = ?auto_13123 ?auto_13127 ) ) ( not ( = ?auto_13105 ?auto_13109 ) ) ( not ( = ?auto_13105 ?auto_13125 ) ) ( not ( = ?auto_13106 ?auto_13109 ) ) ( not ( = ?auto_13106 ?auto_13125 ) ) ( not ( = ?auto_13107 ?auto_13109 ) ) ( not ( = ?auto_13107 ?auto_13125 ) ) ( not ( = ?auto_13109 ?auto_13123 ) ) ( not ( = ?auto_13109 ?auto_13122 ) ) ( not ( = ?auto_13109 ?auto_13127 ) ) ( not ( = ?auto_13118 ?auto_13119 ) ) ( not ( = ?auto_13118 ?auto_13114 ) ) ( not ( = ?auto_13124 ?auto_13126 ) ) ( not ( = ?auto_13124 ?auto_13115 ) ) ( not ( = ?auto_13125 ?auto_13123 ) ) ( not ( = ?auto_13125 ?auto_13122 ) ) ( not ( = ?auto_13125 ?auto_13127 ) ) ( not ( = ?auto_13105 ?auto_13110 ) ) ( not ( = ?auto_13105 ?auto_13121 ) ) ( not ( = ?auto_13106 ?auto_13110 ) ) ( not ( = ?auto_13106 ?auto_13121 ) ) ( not ( = ?auto_13107 ?auto_13110 ) ) ( not ( = ?auto_13107 ?auto_13121 ) ) ( not ( = ?auto_13108 ?auto_13110 ) ) ( not ( = ?auto_13108 ?auto_13121 ) ) ( not ( = ?auto_13110 ?auto_13125 ) ) ( not ( = ?auto_13110 ?auto_13123 ) ) ( not ( = ?auto_13110 ?auto_13122 ) ) ( not ( = ?auto_13110 ?auto_13127 ) ) ( not ( = ?auto_13128 ?auto_13118 ) ) ( not ( = ?auto_13128 ?auto_13119 ) ) ( not ( = ?auto_13128 ?auto_13114 ) ) ( not ( = ?auto_13120 ?auto_13124 ) ) ( not ( = ?auto_13120 ?auto_13126 ) ) ( not ( = ?auto_13120 ?auto_13115 ) ) ( not ( = ?auto_13121 ?auto_13125 ) ) ( not ( = ?auto_13121 ?auto_13123 ) ) ( not ( = ?auto_13121 ?auto_13122 ) ) ( not ( = ?auto_13121 ?auto_13127 ) ) ( not ( = ?auto_13105 ?auto_13111 ) ) ( not ( = ?auto_13105 ?auto_13113 ) ) ( not ( = ?auto_13106 ?auto_13111 ) ) ( not ( = ?auto_13106 ?auto_13113 ) ) ( not ( = ?auto_13107 ?auto_13111 ) ) ( not ( = ?auto_13107 ?auto_13113 ) ) ( not ( = ?auto_13108 ?auto_13111 ) ) ( not ( = ?auto_13108 ?auto_13113 ) ) ( not ( = ?auto_13109 ?auto_13111 ) ) ( not ( = ?auto_13109 ?auto_13113 ) ) ( not ( = ?auto_13111 ?auto_13121 ) ) ( not ( = ?auto_13111 ?auto_13125 ) ) ( not ( = ?auto_13111 ?auto_13123 ) ) ( not ( = ?auto_13111 ?auto_13122 ) ) ( not ( = ?auto_13111 ?auto_13127 ) ) ( not ( = ?auto_13113 ?auto_13121 ) ) ( not ( = ?auto_13113 ?auto_13125 ) ) ( not ( = ?auto_13113 ?auto_13123 ) ) ( not ( = ?auto_13113 ?auto_13122 ) ) ( not ( = ?auto_13113 ?auto_13127 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_13105 ?auto_13106 ?auto_13107 ?auto_13108 ?auto_13109 ?auto_13110 )
      ( MAKE-1CRATE ?auto_13110 ?auto_13111 )
      ( MAKE-6CRATE-VERIFY ?auto_13105 ?auto_13106 ?auto_13107 ?auto_13108 ?auto_13109 ?auto_13110 ?auto_13111 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13131 - SURFACE
      ?auto_13132 - SURFACE
    )
    :vars
    (
      ?auto_13133 - HOIST
      ?auto_13134 - PLACE
      ?auto_13136 - PLACE
      ?auto_13137 - HOIST
      ?auto_13138 - SURFACE
      ?auto_13135 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13133 ?auto_13134 ) ( SURFACE-AT ?auto_13131 ?auto_13134 ) ( CLEAR ?auto_13131 ) ( IS-CRATE ?auto_13132 ) ( AVAILABLE ?auto_13133 ) ( not ( = ?auto_13136 ?auto_13134 ) ) ( HOIST-AT ?auto_13137 ?auto_13136 ) ( AVAILABLE ?auto_13137 ) ( SURFACE-AT ?auto_13132 ?auto_13136 ) ( ON ?auto_13132 ?auto_13138 ) ( CLEAR ?auto_13132 ) ( TRUCK-AT ?auto_13135 ?auto_13134 ) ( not ( = ?auto_13131 ?auto_13132 ) ) ( not ( = ?auto_13131 ?auto_13138 ) ) ( not ( = ?auto_13132 ?auto_13138 ) ) ( not ( = ?auto_13133 ?auto_13137 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13135 ?auto_13134 ?auto_13136 )
      ( !LIFT ?auto_13137 ?auto_13132 ?auto_13138 ?auto_13136 )
      ( !LOAD ?auto_13137 ?auto_13132 ?auto_13135 ?auto_13136 )
      ( !DRIVE ?auto_13135 ?auto_13136 ?auto_13134 )
      ( !UNLOAD ?auto_13133 ?auto_13132 ?auto_13135 ?auto_13134 )
      ( !DROP ?auto_13133 ?auto_13132 ?auto_13131 ?auto_13134 )
      ( MAKE-1CRATE-VERIFY ?auto_13131 ?auto_13132 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_13147 - SURFACE
      ?auto_13148 - SURFACE
      ?auto_13149 - SURFACE
      ?auto_13150 - SURFACE
      ?auto_13151 - SURFACE
      ?auto_13152 - SURFACE
      ?auto_13154 - SURFACE
      ?auto_13153 - SURFACE
    )
    :vars
    (
      ?auto_13157 - HOIST
      ?auto_13156 - PLACE
      ?auto_13159 - PLACE
      ?auto_13160 - HOIST
      ?auto_13158 - SURFACE
      ?auto_13172 - PLACE
      ?auto_13162 - HOIST
      ?auto_13163 - SURFACE
      ?auto_13171 - PLACE
      ?auto_13161 - HOIST
      ?auto_13168 - SURFACE
      ?auto_13169 - PLACE
      ?auto_13165 - HOIST
      ?auto_13164 - SURFACE
      ?auto_13166 - SURFACE
      ?auto_13167 - SURFACE
      ?auto_13170 - SURFACE
      ?auto_13155 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13157 ?auto_13156 ) ( IS-CRATE ?auto_13153 ) ( not ( = ?auto_13159 ?auto_13156 ) ) ( HOIST-AT ?auto_13160 ?auto_13159 ) ( SURFACE-AT ?auto_13153 ?auto_13159 ) ( ON ?auto_13153 ?auto_13158 ) ( CLEAR ?auto_13153 ) ( not ( = ?auto_13154 ?auto_13153 ) ) ( not ( = ?auto_13154 ?auto_13158 ) ) ( not ( = ?auto_13153 ?auto_13158 ) ) ( not ( = ?auto_13157 ?auto_13160 ) ) ( IS-CRATE ?auto_13154 ) ( not ( = ?auto_13172 ?auto_13156 ) ) ( HOIST-AT ?auto_13162 ?auto_13172 ) ( SURFACE-AT ?auto_13154 ?auto_13172 ) ( ON ?auto_13154 ?auto_13163 ) ( CLEAR ?auto_13154 ) ( not ( = ?auto_13152 ?auto_13154 ) ) ( not ( = ?auto_13152 ?auto_13163 ) ) ( not ( = ?auto_13154 ?auto_13163 ) ) ( not ( = ?auto_13157 ?auto_13162 ) ) ( IS-CRATE ?auto_13152 ) ( not ( = ?auto_13171 ?auto_13156 ) ) ( HOIST-AT ?auto_13161 ?auto_13171 ) ( AVAILABLE ?auto_13161 ) ( SURFACE-AT ?auto_13152 ?auto_13171 ) ( ON ?auto_13152 ?auto_13168 ) ( CLEAR ?auto_13152 ) ( not ( = ?auto_13151 ?auto_13152 ) ) ( not ( = ?auto_13151 ?auto_13168 ) ) ( not ( = ?auto_13152 ?auto_13168 ) ) ( not ( = ?auto_13157 ?auto_13161 ) ) ( IS-CRATE ?auto_13151 ) ( not ( = ?auto_13169 ?auto_13156 ) ) ( HOIST-AT ?auto_13165 ?auto_13169 ) ( AVAILABLE ?auto_13165 ) ( SURFACE-AT ?auto_13151 ?auto_13169 ) ( ON ?auto_13151 ?auto_13164 ) ( CLEAR ?auto_13151 ) ( not ( = ?auto_13150 ?auto_13151 ) ) ( not ( = ?auto_13150 ?auto_13164 ) ) ( not ( = ?auto_13151 ?auto_13164 ) ) ( not ( = ?auto_13157 ?auto_13165 ) ) ( IS-CRATE ?auto_13150 ) ( SURFACE-AT ?auto_13150 ?auto_13159 ) ( ON ?auto_13150 ?auto_13166 ) ( CLEAR ?auto_13150 ) ( not ( = ?auto_13149 ?auto_13150 ) ) ( not ( = ?auto_13149 ?auto_13166 ) ) ( not ( = ?auto_13150 ?auto_13166 ) ) ( IS-CRATE ?auto_13149 ) ( AVAILABLE ?auto_13162 ) ( SURFACE-AT ?auto_13149 ?auto_13172 ) ( ON ?auto_13149 ?auto_13167 ) ( CLEAR ?auto_13149 ) ( not ( = ?auto_13148 ?auto_13149 ) ) ( not ( = ?auto_13148 ?auto_13167 ) ) ( not ( = ?auto_13149 ?auto_13167 ) ) ( SURFACE-AT ?auto_13147 ?auto_13156 ) ( CLEAR ?auto_13147 ) ( IS-CRATE ?auto_13148 ) ( AVAILABLE ?auto_13157 ) ( AVAILABLE ?auto_13160 ) ( SURFACE-AT ?auto_13148 ?auto_13159 ) ( ON ?auto_13148 ?auto_13170 ) ( CLEAR ?auto_13148 ) ( TRUCK-AT ?auto_13155 ?auto_13156 ) ( not ( = ?auto_13147 ?auto_13148 ) ) ( not ( = ?auto_13147 ?auto_13170 ) ) ( not ( = ?auto_13148 ?auto_13170 ) ) ( not ( = ?auto_13147 ?auto_13149 ) ) ( not ( = ?auto_13147 ?auto_13167 ) ) ( not ( = ?auto_13149 ?auto_13170 ) ) ( not ( = ?auto_13172 ?auto_13159 ) ) ( not ( = ?auto_13162 ?auto_13160 ) ) ( not ( = ?auto_13167 ?auto_13170 ) ) ( not ( = ?auto_13147 ?auto_13150 ) ) ( not ( = ?auto_13147 ?auto_13166 ) ) ( not ( = ?auto_13148 ?auto_13150 ) ) ( not ( = ?auto_13148 ?auto_13166 ) ) ( not ( = ?auto_13150 ?auto_13167 ) ) ( not ( = ?auto_13150 ?auto_13170 ) ) ( not ( = ?auto_13166 ?auto_13167 ) ) ( not ( = ?auto_13166 ?auto_13170 ) ) ( not ( = ?auto_13147 ?auto_13151 ) ) ( not ( = ?auto_13147 ?auto_13164 ) ) ( not ( = ?auto_13148 ?auto_13151 ) ) ( not ( = ?auto_13148 ?auto_13164 ) ) ( not ( = ?auto_13149 ?auto_13151 ) ) ( not ( = ?auto_13149 ?auto_13164 ) ) ( not ( = ?auto_13151 ?auto_13166 ) ) ( not ( = ?auto_13151 ?auto_13167 ) ) ( not ( = ?auto_13151 ?auto_13170 ) ) ( not ( = ?auto_13169 ?auto_13159 ) ) ( not ( = ?auto_13169 ?auto_13172 ) ) ( not ( = ?auto_13165 ?auto_13160 ) ) ( not ( = ?auto_13165 ?auto_13162 ) ) ( not ( = ?auto_13164 ?auto_13166 ) ) ( not ( = ?auto_13164 ?auto_13167 ) ) ( not ( = ?auto_13164 ?auto_13170 ) ) ( not ( = ?auto_13147 ?auto_13152 ) ) ( not ( = ?auto_13147 ?auto_13168 ) ) ( not ( = ?auto_13148 ?auto_13152 ) ) ( not ( = ?auto_13148 ?auto_13168 ) ) ( not ( = ?auto_13149 ?auto_13152 ) ) ( not ( = ?auto_13149 ?auto_13168 ) ) ( not ( = ?auto_13150 ?auto_13152 ) ) ( not ( = ?auto_13150 ?auto_13168 ) ) ( not ( = ?auto_13152 ?auto_13164 ) ) ( not ( = ?auto_13152 ?auto_13166 ) ) ( not ( = ?auto_13152 ?auto_13167 ) ) ( not ( = ?auto_13152 ?auto_13170 ) ) ( not ( = ?auto_13171 ?auto_13169 ) ) ( not ( = ?auto_13171 ?auto_13159 ) ) ( not ( = ?auto_13171 ?auto_13172 ) ) ( not ( = ?auto_13161 ?auto_13165 ) ) ( not ( = ?auto_13161 ?auto_13160 ) ) ( not ( = ?auto_13161 ?auto_13162 ) ) ( not ( = ?auto_13168 ?auto_13164 ) ) ( not ( = ?auto_13168 ?auto_13166 ) ) ( not ( = ?auto_13168 ?auto_13167 ) ) ( not ( = ?auto_13168 ?auto_13170 ) ) ( not ( = ?auto_13147 ?auto_13154 ) ) ( not ( = ?auto_13147 ?auto_13163 ) ) ( not ( = ?auto_13148 ?auto_13154 ) ) ( not ( = ?auto_13148 ?auto_13163 ) ) ( not ( = ?auto_13149 ?auto_13154 ) ) ( not ( = ?auto_13149 ?auto_13163 ) ) ( not ( = ?auto_13150 ?auto_13154 ) ) ( not ( = ?auto_13150 ?auto_13163 ) ) ( not ( = ?auto_13151 ?auto_13154 ) ) ( not ( = ?auto_13151 ?auto_13163 ) ) ( not ( = ?auto_13154 ?auto_13168 ) ) ( not ( = ?auto_13154 ?auto_13164 ) ) ( not ( = ?auto_13154 ?auto_13166 ) ) ( not ( = ?auto_13154 ?auto_13167 ) ) ( not ( = ?auto_13154 ?auto_13170 ) ) ( not ( = ?auto_13163 ?auto_13168 ) ) ( not ( = ?auto_13163 ?auto_13164 ) ) ( not ( = ?auto_13163 ?auto_13166 ) ) ( not ( = ?auto_13163 ?auto_13167 ) ) ( not ( = ?auto_13163 ?auto_13170 ) ) ( not ( = ?auto_13147 ?auto_13153 ) ) ( not ( = ?auto_13147 ?auto_13158 ) ) ( not ( = ?auto_13148 ?auto_13153 ) ) ( not ( = ?auto_13148 ?auto_13158 ) ) ( not ( = ?auto_13149 ?auto_13153 ) ) ( not ( = ?auto_13149 ?auto_13158 ) ) ( not ( = ?auto_13150 ?auto_13153 ) ) ( not ( = ?auto_13150 ?auto_13158 ) ) ( not ( = ?auto_13151 ?auto_13153 ) ) ( not ( = ?auto_13151 ?auto_13158 ) ) ( not ( = ?auto_13152 ?auto_13153 ) ) ( not ( = ?auto_13152 ?auto_13158 ) ) ( not ( = ?auto_13153 ?auto_13163 ) ) ( not ( = ?auto_13153 ?auto_13168 ) ) ( not ( = ?auto_13153 ?auto_13164 ) ) ( not ( = ?auto_13153 ?auto_13166 ) ) ( not ( = ?auto_13153 ?auto_13167 ) ) ( not ( = ?auto_13153 ?auto_13170 ) ) ( not ( = ?auto_13158 ?auto_13163 ) ) ( not ( = ?auto_13158 ?auto_13168 ) ) ( not ( = ?auto_13158 ?auto_13164 ) ) ( not ( = ?auto_13158 ?auto_13166 ) ) ( not ( = ?auto_13158 ?auto_13167 ) ) ( not ( = ?auto_13158 ?auto_13170 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_13147 ?auto_13148 ?auto_13149 ?auto_13150 ?auto_13151 ?auto_13152 ?auto_13154 )
      ( MAKE-1CRATE ?auto_13154 ?auto_13153 )
      ( MAKE-7CRATE-VERIFY ?auto_13147 ?auto_13148 ?auto_13149 ?auto_13150 ?auto_13151 ?auto_13152 ?auto_13154 ?auto_13153 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13175 - SURFACE
      ?auto_13176 - SURFACE
    )
    :vars
    (
      ?auto_13177 - HOIST
      ?auto_13178 - PLACE
      ?auto_13180 - PLACE
      ?auto_13181 - HOIST
      ?auto_13182 - SURFACE
      ?auto_13179 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13177 ?auto_13178 ) ( SURFACE-AT ?auto_13175 ?auto_13178 ) ( CLEAR ?auto_13175 ) ( IS-CRATE ?auto_13176 ) ( AVAILABLE ?auto_13177 ) ( not ( = ?auto_13180 ?auto_13178 ) ) ( HOIST-AT ?auto_13181 ?auto_13180 ) ( AVAILABLE ?auto_13181 ) ( SURFACE-AT ?auto_13176 ?auto_13180 ) ( ON ?auto_13176 ?auto_13182 ) ( CLEAR ?auto_13176 ) ( TRUCK-AT ?auto_13179 ?auto_13178 ) ( not ( = ?auto_13175 ?auto_13176 ) ) ( not ( = ?auto_13175 ?auto_13182 ) ) ( not ( = ?auto_13176 ?auto_13182 ) ) ( not ( = ?auto_13177 ?auto_13181 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13179 ?auto_13178 ?auto_13180 )
      ( !LIFT ?auto_13181 ?auto_13176 ?auto_13182 ?auto_13180 )
      ( !LOAD ?auto_13181 ?auto_13176 ?auto_13179 ?auto_13180 )
      ( !DRIVE ?auto_13179 ?auto_13180 ?auto_13178 )
      ( !UNLOAD ?auto_13177 ?auto_13176 ?auto_13179 ?auto_13178 )
      ( !DROP ?auto_13177 ?auto_13176 ?auto_13175 ?auto_13178 )
      ( MAKE-1CRATE-VERIFY ?auto_13175 ?auto_13176 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_13192 - SURFACE
      ?auto_13193 - SURFACE
      ?auto_13194 - SURFACE
      ?auto_13195 - SURFACE
      ?auto_13196 - SURFACE
      ?auto_13197 - SURFACE
      ?auto_13200 - SURFACE
      ?auto_13199 - SURFACE
      ?auto_13198 - SURFACE
    )
    :vars
    (
      ?auto_13203 - HOIST
      ?auto_13201 - PLACE
      ?auto_13202 - PLACE
      ?auto_13205 - HOIST
      ?auto_13206 - SURFACE
      ?auto_13213 - PLACE
      ?auto_13212 - HOIST
      ?auto_13211 - SURFACE
      ?auto_13219 - PLACE
      ?auto_13215 - HOIST
      ?auto_13214 - SURFACE
      ?auto_13207 - SURFACE
      ?auto_13217 - PLACE
      ?auto_13210 - HOIST
      ?auto_13216 - SURFACE
      ?auto_13209 - SURFACE
      ?auto_13208 - SURFACE
      ?auto_13218 - SURFACE
      ?auto_13204 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13203 ?auto_13201 ) ( IS-CRATE ?auto_13198 ) ( not ( = ?auto_13202 ?auto_13201 ) ) ( HOIST-AT ?auto_13205 ?auto_13202 ) ( SURFACE-AT ?auto_13198 ?auto_13202 ) ( ON ?auto_13198 ?auto_13206 ) ( CLEAR ?auto_13198 ) ( not ( = ?auto_13199 ?auto_13198 ) ) ( not ( = ?auto_13199 ?auto_13206 ) ) ( not ( = ?auto_13198 ?auto_13206 ) ) ( not ( = ?auto_13203 ?auto_13205 ) ) ( IS-CRATE ?auto_13199 ) ( not ( = ?auto_13213 ?auto_13201 ) ) ( HOIST-AT ?auto_13212 ?auto_13213 ) ( SURFACE-AT ?auto_13199 ?auto_13213 ) ( ON ?auto_13199 ?auto_13211 ) ( CLEAR ?auto_13199 ) ( not ( = ?auto_13200 ?auto_13199 ) ) ( not ( = ?auto_13200 ?auto_13211 ) ) ( not ( = ?auto_13199 ?auto_13211 ) ) ( not ( = ?auto_13203 ?auto_13212 ) ) ( IS-CRATE ?auto_13200 ) ( not ( = ?auto_13219 ?auto_13201 ) ) ( HOIST-AT ?auto_13215 ?auto_13219 ) ( SURFACE-AT ?auto_13200 ?auto_13219 ) ( ON ?auto_13200 ?auto_13214 ) ( CLEAR ?auto_13200 ) ( not ( = ?auto_13197 ?auto_13200 ) ) ( not ( = ?auto_13197 ?auto_13214 ) ) ( not ( = ?auto_13200 ?auto_13214 ) ) ( not ( = ?auto_13203 ?auto_13215 ) ) ( IS-CRATE ?auto_13197 ) ( AVAILABLE ?auto_13205 ) ( SURFACE-AT ?auto_13197 ?auto_13202 ) ( ON ?auto_13197 ?auto_13207 ) ( CLEAR ?auto_13197 ) ( not ( = ?auto_13196 ?auto_13197 ) ) ( not ( = ?auto_13196 ?auto_13207 ) ) ( not ( = ?auto_13197 ?auto_13207 ) ) ( IS-CRATE ?auto_13196 ) ( not ( = ?auto_13217 ?auto_13201 ) ) ( HOIST-AT ?auto_13210 ?auto_13217 ) ( AVAILABLE ?auto_13210 ) ( SURFACE-AT ?auto_13196 ?auto_13217 ) ( ON ?auto_13196 ?auto_13216 ) ( CLEAR ?auto_13196 ) ( not ( = ?auto_13195 ?auto_13196 ) ) ( not ( = ?auto_13195 ?auto_13216 ) ) ( not ( = ?auto_13196 ?auto_13216 ) ) ( not ( = ?auto_13203 ?auto_13210 ) ) ( IS-CRATE ?auto_13195 ) ( SURFACE-AT ?auto_13195 ?auto_13213 ) ( ON ?auto_13195 ?auto_13209 ) ( CLEAR ?auto_13195 ) ( not ( = ?auto_13194 ?auto_13195 ) ) ( not ( = ?auto_13194 ?auto_13209 ) ) ( not ( = ?auto_13195 ?auto_13209 ) ) ( IS-CRATE ?auto_13194 ) ( AVAILABLE ?auto_13215 ) ( SURFACE-AT ?auto_13194 ?auto_13219 ) ( ON ?auto_13194 ?auto_13208 ) ( CLEAR ?auto_13194 ) ( not ( = ?auto_13193 ?auto_13194 ) ) ( not ( = ?auto_13193 ?auto_13208 ) ) ( not ( = ?auto_13194 ?auto_13208 ) ) ( SURFACE-AT ?auto_13192 ?auto_13201 ) ( CLEAR ?auto_13192 ) ( IS-CRATE ?auto_13193 ) ( AVAILABLE ?auto_13203 ) ( AVAILABLE ?auto_13212 ) ( SURFACE-AT ?auto_13193 ?auto_13213 ) ( ON ?auto_13193 ?auto_13218 ) ( CLEAR ?auto_13193 ) ( TRUCK-AT ?auto_13204 ?auto_13201 ) ( not ( = ?auto_13192 ?auto_13193 ) ) ( not ( = ?auto_13192 ?auto_13218 ) ) ( not ( = ?auto_13193 ?auto_13218 ) ) ( not ( = ?auto_13192 ?auto_13194 ) ) ( not ( = ?auto_13192 ?auto_13208 ) ) ( not ( = ?auto_13194 ?auto_13218 ) ) ( not ( = ?auto_13219 ?auto_13213 ) ) ( not ( = ?auto_13215 ?auto_13212 ) ) ( not ( = ?auto_13208 ?auto_13218 ) ) ( not ( = ?auto_13192 ?auto_13195 ) ) ( not ( = ?auto_13192 ?auto_13209 ) ) ( not ( = ?auto_13193 ?auto_13195 ) ) ( not ( = ?auto_13193 ?auto_13209 ) ) ( not ( = ?auto_13195 ?auto_13208 ) ) ( not ( = ?auto_13195 ?auto_13218 ) ) ( not ( = ?auto_13209 ?auto_13208 ) ) ( not ( = ?auto_13209 ?auto_13218 ) ) ( not ( = ?auto_13192 ?auto_13196 ) ) ( not ( = ?auto_13192 ?auto_13216 ) ) ( not ( = ?auto_13193 ?auto_13196 ) ) ( not ( = ?auto_13193 ?auto_13216 ) ) ( not ( = ?auto_13194 ?auto_13196 ) ) ( not ( = ?auto_13194 ?auto_13216 ) ) ( not ( = ?auto_13196 ?auto_13209 ) ) ( not ( = ?auto_13196 ?auto_13208 ) ) ( not ( = ?auto_13196 ?auto_13218 ) ) ( not ( = ?auto_13217 ?auto_13213 ) ) ( not ( = ?auto_13217 ?auto_13219 ) ) ( not ( = ?auto_13210 ?auto_13212 ) ) ( not ( = ?auto_13210 ?auto_13215 ) ) ( not ( = ?auto_13216 ?auto_13209 ) ) ( not ( = ?auto_13216 ?auto_13208 ) ) ( not ( = ?auto_13216 ?auto_13218 ) ) ( not ( = ?auto_13192 ?auto_13197 ) ) ( not ( = ?auto_13192 ?auto_13207 ) ) ( not ( = ?auto_13193 ?auto_13197 ) ) ( not ( = ?auto_13193 ?auto_13207 ) ) ( not ( = ?auto_13194 ?auto_13197 ) ) ( not ( = ?auto_13194 ?auto_13207 ) ) ( not ( = ?auto_13195 ?auto_13197 ) ) ( not ( = ?auto_13195 ?auto_13207 ) ) ( not ( = ?auto_13197 ?auto_13216 ) ) ( not ( = ?auto_13197 ?auto_13209 ) ) ( not ( = ?auto_13197 ?auto_13208 ) ) ( not ( = ?auto_13197 ?auto_13218 ) ) ( not ( = ?auto_13202 ?auto_13217 ) ) ( not ( = ?auto_13202 ?auto_13213 ) ) ( not ( = ?auto_13202 ?auto_13219 ) ) ( not ( = ?auto_13205 ?auto_13210 ) ) ( not ( = ?auto_13205 ?auto_13212 ) ) ( not ( = ?auto_13205 ?auto_13215 ) ) ( not ( = ?auto_13207 ?auto_13216 ) ) ( not ( = ?auto_13207 ?auto_13209 ) ) ( not ( = ?auto_13207 ?auto_13208 ) ) ( not ( = ?auto_13207 ?auto_13218 ) ) ( not ( = ?auto_13192 ?auto_13200 ) ) ( not ( = ?auto_13192 ?auto_13214 ) ) ( not ( = ?auto_13193 ?auto_13200 ) ) ( not ( = ?auto_13193 ?auto_13214 ) ) ( not ( = ?auto_13194 ?auto_13200 ) ) ( not ( = ?auto_13194 ?auto_13214 ) ) ( not ( = ?auto_13195 ?auto_13200 ) ) ( not ( = ?auto_13195 ?auto_13214 ) ) ( not ( = ?auto_13196 ?auto_13200 ) ) ( not ( = ?auto_13196 ?auto_13214 ) ) ( not ( = ?auto_13200 ?auto_13207 ) ) ( not ( = ?auto_13200 ?auto_13216 ) ) ( not ( = ?auto_13200 ?auto_13209 ) ) ( not ( = ?auto_13200 ?auto_13208 ) ) ( not ( = ?auto_13200 ?auto_13218 ) ) ( not ( = ?auto_13214 ?auto_13207 ) ) ( not ( = ?auto_13214 ?auto_13216 ) ) ( not ( = ?auto_13214 ?auto_13209 ) ) ( not ( = ?auto_13214 ?auto_13208 ) ) ( not ( = ?auto_13214 ?auto_13218 ) ) ( not ( = ?auto_13192 ?auto_13199 ) ) ( not ( = ?auto_13192 ?auto_13211 ) ) ( not ( = ?auto_13193 ?auto_13199 ) ) ( not ( = ?auto_13193 ?auto_13211 ) ) ( not ( = ?auto_13194 ?auto_13199 ) ) ( not ( = ?auto_13194 ?auto_13211 ) ) ( not ( = ?auto_13195 ?auto_13199 ) ) ( not ( = ?auto_13195 ?auto_13211 ) ) ( not ( = ?auto_13196 ?auto_13199 ) ) ( not ( = ?auto_13196 ?auto_13211 ) ) ( not ( = ?auto_13197 ?auto_13199 ) ) ( not ( = ?auto_13197 ?auto_13211 ) ) ( not ( = ?auto_13199 ?auto_13214 ) ) ( not ( = ?auto_13199 ?auto_13207 ) ) ( not ( = ?auto_13199 ?auto_13216 ) ) ( not ( = ?auto_13199 ?auto_13209 ) ) ( not ( = ?auto_13199 ?auto_13208 ) ) ( not ( = ?auto_13199 ?auto_13218 ) ) ( not ( = ?auto_13211 ?auto_13214 ) ) ( not ( = ?auto_13211 ?auto_13207 ) ) ( not ( = ?auto_13211 ?auto_13216 ) ) ( not ( = ?auto_13211 ?auto_13209 ) ) ( not ( = ?auto_13211 ?auto_13208 ) ) ( not ( = ?auto_13211 ?auto_13218 ) ) ( not ( = ?auto_13192 ?auto_13198 ) ) ( not ( = ?auto_13192 ?auto_13206 ) ) ( not ( = ?auto_13193 ?auto_13198 ) ) ( not ( = ?auto_13193 ?auto_13206 ) ) ( not ( = ?auto_13194 ?auto_13198 ) ) ( not ( = ?auto_13194 ?auto_13206 ) ) ( not ( = ?auto_13195 ?auto_13198 ) ) ( not ( = ?auto_13195 ?auto_13206 ) ) ( not ( = ?auto_13196 ?auto_13198 ) ) ( not ( = ?auto_13196 ?auto_13206 ) ) ( not ( = ?auto_13197 ?auto_13198 ) ) ( not ( = ?auto_13197 ?auto_13206 ) ) ( not ( = ?auto_13200 ?auto_13198 ) ) ( not ( = ?auto_13200 ?auto_13206 ) ) ( not ( = ?auto_13198 ?auto_13211 ) ) ( not ( = ?auto_13198 ?auto_13214 ) ) ( not ( = ?auto_13198 ?auto_13207 ) ) ( not ( = ?auto_13198 ?auto_13216 ) ) ( not ( = ?auto_13198 ?auto_13209 ) ) ( not ( = ?auto_13198 ?auto_13208 ) ) ( not ( = ?auto_13198 ?auto_13218 ) ) ( not ( = ?auto_13206 ?auto_13211 ) ) ( not ( = ?auto_13206 ?auto_13214 ) ) ( not ( = ?auto_13206 ?auto_13207 ) ) ( not ( = ?auto_13206 ?auto_13216 ) ) ( not ( = ?auto_13206 ?auto_13209 ) ) ( not ( = ?auto_13206 ?auto_13208 ) ) ( not ( = ?auto_13206 ?auto_13218 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_13192 ?auto_13193 ?auto_13194 ?auto_13195 ?auto_13196 ?auto_13197 ?auto_13200 ?auto_13199 )
      ( MAKE-1CRATE ?auto_13199 ?auto_13198 )
      ( MAKE-8CRATE-VERIFY ?auto_13192 ?auto_13193 ?auto_13194 ?auto_13195 ?auto_13196 ?auto_13197 ?auto_13200 ?auto_13199 ?auto_13198 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13222 - SURFACE
      ?auto_13223 - SURFACE
    )
    :vars
    (
      ?auto_13224 - HOIST
      ?auto_13225 - PLACE
      ?auto_13227 - PLACE
      ?auto_13228 - HOIST
      ?auto_13229 - SURFACE
      ?auto_13226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13224 ?auto_13225 ) ( SURFACE-AT ?auto_13222 ?auto_13225 ) ( CLEAR ?auto_13222 ) ( IS-CRATE ?auto_13223 ) ( AVAILABLE ?auto_13224 ) ( not ( = ?auto_13227 ?auto_13225 ) ) ( HOIST-AT ?auto_13228 ?auto_13227 ) ( AVAILABLE ?auto_13228 ) ( SURFACE-AT ?auto_13223 ?auto_13227 ) ( ON ?auto_13223 ?auto_13229 ) ( CLEAR ?auto_13223 ) ( TRUCK-AT ?auto_13226 ?auto_13225 ) ( not ( = ?auto_13222 ?auto_13223 ) ) ( not ( = ?auto_13222 ?auto_13229 ) ) ( not ( = ?auto_13223 ?auto_13229 ) ) ( not ( = ?auto_13224 ?auto_13228 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13226 ?auto_13225 ?auto_13227 )
      ( !LIFT ?auto_13228 ?auto_13223 ?auto_13229 ?auto_13227 )
      ( !LOAD ?auto_13228 ?auto_13223 ?auto_13226 ?auto_13227 )
      ( !DRIVE ?auto_13226 ?auto_13227 ?auto_13225 )
      ( !UNLOAD ?auto_13224 ?auto_13223 ?auto_13226 ?auto_13225 )
      ( !DROP ?auto_13224 ?auto_13223 ?auto_13222 ?auto_13225 )
      ( MAKE-1CRATE-VERIFY ?auto_13222 ?auto_13223 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_13240 - SURFACE
      ?auto_13241 - SURFACE
      ?auto_13242 - SURFACE
      ?auto_13243 - SURFACE
      ?auto_13244 - SURFACE
      ?auto_13245 - SURFACE
      ?auto_13248 - SURFACE
      ?auto_13247 - SURFACE
      ?auto_13246 - SURFACE
      ?auto_13249 - SURFACE
    )
    :vars
    (
      ?auto_13251 - HOIST
      ?auto_13253 - PLACE
      ?auto_13254 - PLACE
      ?auto_13252 - HOIST
      ?auto_13250 - SURFACE
      ?auto_13257 - PLACE
      ?auto_13258 - HOIST
      ?auto_13269 - SURFACE
      ?auto_13267 - SURFACE
      ?auto_13265 - PLACE
      ?auto_13261 - HOIST
      ?auto_13266 - SURFACE
      ?auto_13260 - SURFACE
      ?auto_13262 - PLACE
      ?auto_13259 - HOIST
      ?auto_13263 - SURFACE
      ?auto_13256 - SURFACE
      ?auto_13268 - SURFACE
      ?auto_13264 - SURFACE
      ?auto_13255 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13251 ?auto_13253 ) ( IS-CRATE ?auto_13249 ) ( not ( = ?auto_13254 ?auto_13253 ) ) ( HOIST-AT ?auto_13252 ?auto_13254 ) ( SURFACE-AT ?auto_13249 ?auto_13254 ) ( ON ?auto_13249 ?auto_13250 ) ( CLEAR ?auto_13249 ) ( not ( = ?auto_13246 ?auto_13249 ) ) ( not ( = ?auto_13246 ?auto_13250 ) ) ( not ( = ?auto_13249 ?auto_13250 ) ) ( not ( = ?auto_13251 ?auto_13252 ) ) ( IS-CRATE ?auto_13246 ) ( not ( = ?auto_13257 ?auto_13253 ) ) ( HOIST-AT ?auto_13258 ?auto_13257 ) ( SURFACE-AT ?auto_13246 ?auto_13257 ) ( ON ?auto_13246 ?auto_13269 ) ( CLEAR ?auto_13246 ) ( not ( = ?auto_13247 ?auto_13246 ) ) ( not ( = ?auto_13247 ?auto_13269 ) ) ( not ( = ?auto_13246 ?auto_13269 ) ) ( not ( = ?auto_13251 ?auto_13258 ) ) ( IS-CRATE ?auto_13247 ) ( SURFACE-AT ?auto_13247 ?auto_13254 ) ( ON ?auto_13247 ?auto_13267 ) ( CLEAR ?auto_13247 ) ( not ( = ?auto_13248 ?auto_13247 ) ) ( not ( = ?auto_13248 ?auto_13267 ) ) ( not ( = ?auto_13247 ?auto_13267 ) ) ( IS-CRATE ?auto_13248 ) ( not ( = ?auto_13265 ?auto_13253 ) ) ( HOIST-AT ?auto_13261 ?auto_13265 ) ( SURFACE-AT ?auto_13248 ?auto_13265 ) ( ON ?auto_13248 ?auto_13266 ) ( CLEAR ?auto_13248 ) ( not ( = ?auto_13245 ?auto_13248 ) ) ( not ( = ?auto_13245 ?auto_13266 ) ) ( not ( = ?auto_13248 ?auto_13266 ) ) ( not ( = ?auto_13251 ?auto_13261 ) ) ( IS-CRATE ?auto_13245 ) ( AVAILABLE ?auto_13258 ) ( SURFACE-AT ?auto_13245 ?auto_13257 ) ( ON ?auto_13245 ?auto_13260 ) ( CLEAR ?auto_13245 ) ( not ( = ?auto_13244 ?auto_13245 ) ) ( not ( = ?auto_13244 ?auto_13260 ) ) ( not ( = ?auto_13245 ?auto_13260 ) ) ( IS-CRATE ?auto_13244 ) ( not ( = ?auto_13262 ?auto_13253 ) ) ( HOIST-AT ?auto_13259 ?auto_13262 ) ( AVAILABLE ?auto_13259 ) ( SURFACE-AT ?auto_13244 ?auto_13262 ) ( ON ?auto_13244 ?auto_13263 ) ( CLEAR ?auto_13244 ) ( not ( = ?auto_13243 ?auto_13244 ) ) ( not ( = ?auto_13243 ?auto_13263 ) ) ( not ( = ?auto_13244 ?auto_13263 ) ) ( not ( = ?auto_13251 ?auto_13259 ) ) ( IS-CRATE ?auto_13243 ) ( SURFACE-AT ?auto_13243 ?auto_13254 ) ( ON ?auto_13243 ?auto_13256 ) ( CLEAR ?auto_13243 ) ( not ( = ?auto_13242 ?auto_13243 ) ) ( not ( = ?auto_13242 ?auto_13256 ) ) ( not ( = ?auto_13243 ?auto_13256 ) ) ( IS-CRATE ?auto_13242 ) ( AVAILABLE ?auto_13261 ) ( SURFACE-AT ?auto_13242 ?auto_13265 ) ( ON ?auto_13242 ?auto_13268 ) ( CLEAR ?auto_13242 ) ( not ( = ?auto_13241 ?auto_13242 ) ) ( not ( = ?auto_13241 ?auto_13268 ) ) ( not ( = ?auto_13242 ?auto_13268 ) ) ( SURFACE-AT ?auto_13240 ?auto_13253 ) ( CLEAR ?auto_13240 ) ( IS-CRATE ?auto_13241 ) ( AVAILABLE ?auto_13251 ) ( AVAILABLE ?auto_13252 ) ( SURFACE-AT ?auto_13241 ?auto_13254 ) ( ON ?auto_13241 ?auto_13264 ) ( CLEAR ?auto_13241 ) ( TRUCK-AT ?auto_13255 ?auto_13253 ) ( not ( = ?auto_13240 ?auto_13241 ) ) ( not ( = ?auto_13240 ?auto_13264 ) ) ( not ( = ?auto_13241 ?auto_13264 ) ) ( not ( = ?auto_13240 ?auto_13242 ) ) ( not ( = ?auto_13240 ?auto_13268 ) ) ( not ( = ?auto_13242 ?auto_13264 ) ) ( not ( = ?auto_13265 ?auto_13254 ) ) ( not ( = ?auto_13261 ?auto_13252 ) ) ( not ( = ?auto_13268 ?auto_13264 ) ) ( not ( = ?auto_13240 ?auto_13243 ) ) ( not ( = ?auto_13240 ?auto_13256 ) ) ( not ( = ?auto_13241 ?auto_13243 ) ) ( not ( = ?auto_13241 ?auto_13256 ) ) ( not ( = ?auto_13243 ?auto_13268 ) ) ( not ( = ?auto_13243 ?auto_13264 ) ) ( not ( = ?auto_13256 ?auto_13268 ) ) ( not ( = ?auto_13256 ?auto_13264 ) ) ( not ( = ?auto_13240 ?auto_13244 ) ) ( not ( = ?auto_13240 ?auto_13263 ) ) ( not ( = ?auto_13241 ?auto_13244 ) ) ( not ( = ?auto_13241 ?auto_13263 ) ) ( not ( = ?auto_13242 ?auto_13244 ) ) ( not ( = ?auto_13242 ?auto_13263 ) ) ( not ( = ?auto_13244 ?auto_13256 ) ) ( not ( = ?auto_13244 ?auto_13268 ) ) ( not ( = ?auto_13244 ?auto_13264 ) ) ( not ( = ?auto_13262 ?auto_13254 ) ) ( not ( = ?auto_13262 ?auto_13265 ) ) ( not ( = ?auto_13259 ?auto_13252 ) ) ( not ( = ?auto_13259 ?auto_13261 ) ) ( not ( = ?auto_13263 ?auto_13256 ) ) ( not ( = ?auto_13263 ?auto_13268 ) ) ( not ( = ?auto_13263 ?auto_13264 ) ) ( not ( = ?auto_13240 ?auto_13245 ) ) ( not ( = ?auto_13240 ?auto_13260 ) ) ( not ( = ?auto_13241 ?auto_13245 ) ) ( not ( = ?auto_13241 ?auto_13260 ) ) ( not ( = ?auto_13242 ?auto_13245 ) ) ( not ( = ?auto_13242 ?auto_13260 ) ) ( not ( = ?auto_13243 ?auto_13245 ) ) ( not ( = ?auto_13243 ?auto_13260 ) ) ( not ( = ?auto_13245 ?auto_13263 ) ) ( not ( = ?auto_13245 ?auto_13256 ) ) ( not ( = ?auto_13245 ?auto_13268 ) ) ( not ( = ?auto_13245 ?auto_13264 ) ) ( not ( = ?auto_13257 ?auto_13262 ) ) ( not ( = ?auto_13257 ?auto_13254 ) ) ( not ( = ?auto_13257 ?auto_13265 ) ) ( not ( = ?auto_13258 ?auto_13259 ) ) ( not ( = ?auto_13258 ?auto_13252 ) ) ( not ( = ?auto_13258 ?auto_13261 ) ) ( not ( = ?auto_13260 ?auto_13263 ) ) ( not ( = ?auto_13260 ?auto_13256 ) ) ( not ( = ?auto_13260 ?auto_13268 ) ) ( not ( = ?auto_13260 ?auto_13264 ) ) ( not ( = ?auto_13240 ?auto_13248 ) ) ( not ( = ?auto_13240 ?auto_13266 ) ) ( not ( = ?auto_13241 ?auto_13248 ) ) ( not ( = ?auto_13241 ?auto_13266 ) ) ( not ( = ?auto_13242 ?auto_13248 ) ) ( not ( = ?auto_13242 ?auto_13266 ) ) ( not ( = ?auto_13243 ?auto_13248 ) ) ( not ( = ?auto_13243 ?auto_13266 ) ) ( not ( = ?auto_13244 ?auto_13248 ) ) ( not ( = ?auto_13244 ?auto_13266 ) ) ( not ( = ?auto_13248 ?auto_13260 ) ) ( not ( = ?auto_13248 ?auto_13263 ) ) ( not ( = ?auto_13248 ?auto_13256 ) ) ( not ( = ?auto_13248 ?auto_13268 ) ) ( not ( = ?auto_13248 ?auto_13264 ) ) ( not ( = ?auto_13266 ?auto_13260 ) ) ( not ( = ?auto_13266 ?auto_13263 ) ) ( not ( = ?auto_13266 ?auto_13256 ) ) ( not ( = ?auto_13266 ?auto_13268 ) ) ( not ( = ?auto_13266 ?auto_13264 ) ) ( not ( = ?auto_13240 ?auto_13247 ) ) ( not ( = ?auto_13240 ?auto_13267 ) ) ( not ( = ?auto_13241 ?auto_13247 ) ) ( not ( = ?auto_13241 ?auto_13267 ) ) ( not ( = ?auto_13242 ?auto_13247 ) ) ( not ( = ?auto_13242 ?auto_13267 ) ) ( not ( = ?auto_13243 ?auto_13247 ) ) ( not ( = ?auto_13243 ?auto_13267 ) ) ( not ( = ?auto_13244 ?auto_13247 ) ) ( not ( = ?auto_13244 ?auto_13267 ) ) ( not ( = ?auto_13245 ?auto_13247 ) ) ( not ( = ?auto_13245 ?auto_13267 ) ) ( not ( = ?auto_13247 ?auto_13266 ) ) ( not ( = ?auto_13247 ?auto_13260 ) ) ( not ( = ?auto_13247 ?auto_13263 ) ) ( not ( = ?auto_13247 ?auto_13256 ) ) ( not ( = ?auto_13247 ?auto_13268 ) ) ( not ( = ?auto_13247 ?auto_13264 ) ) ( not ( = ?auto_13267 ?auto_13266 ) ) ( not ( = ?auto_13267 ?auto_13260 ) ) ( not ( = ?auto_13267 ?auto_13263 ) ) ( not ( = ?auto_13267 ?auto_13256 ) ) ( not ( = ?auto_13267 ?auto_13268 ) ) ( not ( = ?auto_13267 ?auto_13264 ) ) ( not ( = ?auto_13240 ?auto_13246 ) ) ( not ( = ?auto_13240 ?auto_13269 ) ) ( not ( = ?auto_13241 ?auto_13246 ) ) ( not ( = ?auto_13241 ?auto_13269 ) ) ( not ( = ?auto_13242 ?auto_13246 ) ) ( not ( = ?auto_13242 ?auto_13269 ) ) ( not ( = ?auto_13243 ?auto_13246 ) ) ( not ( = ?auto_13243 ?auto_13269 ) ) ( not ( = ?auto_13244 ?auto_13246 ) ) ( not ( = ?auto_13244 ?auto_13269 ) ) ( not ( = ?auto_13245 ?auto_13246 ) ) ( not ( = ?auto_13245 ?auto_13269 ) ) ( not ( = ?auto_13248 ?auto_13246 ) ) ( not ( = ?auto_13248 ?auto_13269 ) ) ( not ( = ?auto_13246 ?auto_13267 ) ) ( not ( = ?auto_13246 ?auto_13266 ) ) ( not ( = ?auto_13246 ?auto_13260 ) ) ( not ( = ?auto_13246 ?auto_13263 ) ) ( not ( = ?auto_13246 ?auto_13256 ) ) ( not ( = ?auto_13246 ?auto_13268 ) ) ( not ( = ?auto_13246 ?auto_13264 ) ) ( not ( = ?auto_13269 ?auto_13267 ) ) ( not ( = ?auto_13269 ?auto_13266 ) ) ( not ( = ?auto_13269 ?auto_13260 ) ) ( not ( = ?auto_13269 ?auto_13263 ) ) ( not ( = ?auto_13269 ?auto_13256 ) ) ( not ( = ?auto_13269 ?auto_13268 ) ) ( not ( = ?auto_13269 ?auto_13264 ) ) ( not ( = ?auto_13240 ?auto_13249 ) ) ( not ( = ?auto_13240 ?auto_13250 ) ) ( not ( = ?auto_13241 ?auto_13249 ) ) ( not ( = ?auto_13241 ?auto_13250 ) ) ( not ( = ?auto_13242 ?auto_13249 ) ) ( not ( = ?auto_13242 ?auto_13250 ) ) ( not ( = ?auto_13243 ?auto_13249 ) ) ( not ( = ?auto_13243 ?auto_13250 ) ) ( not ( = ?auto_13244 ?auto_13249 ) ) ( not ( = ?auto_13244 ?auto_13250 ) ) ( not ( = ?auto_13245 ?auto_13249 ) ) ( not ( = ?auto_13245 ?auto_13250 ) ) ( not ( = ?auto_13248 ?auto_13249 ) ) ( not ( = ?auto_13248 ?auto_13250 ) ) ( not ( = ?auto_13247 ?auto_13249 ) ) ( not ( = ?auto_13247 ?auto_13250 ) ) ( not ( = ?auto_13249 ?auto_13269 ) ) ( not ( = ?auto_13249 ?auto_13267 ) ) ( not ( = ?auto_13249 ?auto_13266 ) ) ( not ( = ?auto_13249 ?auto_13260 ) ) ( not ( = ?auto_13249 ?auto_13263 ) ) ( not ( = ?auto_13249 ?auto_13256 ) ) ( not ( = ?auto_13249 ?auto_13268 ) ) ( not ( = ?auto_13249 ?auto_13264 ) ) ( not ( = ?auto_13250 ?auto_13269 ) ) ( not ( = ?auto_13250 ?auto_13267 ) ) ( not ( = ?auto_13250 ?auto_13266 ) ) ( not ( = ?auto_13250 ?auto_13260 ) ) ( not ( = ?auto_13250 ?auto_13263 ) ) ( not ( = ?auto_13250 ?auto_13256 ) ) ( not ( = ?auto_13250 ?auto_13268 ) ) ( not ( = ?auto_13250 ?auto_13264 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_13240 ?auto_13241 ?auto_13242 ?auto_13243 ?auto_13244 ?auto_13245 ?auto_13248 ?auto_13247 ?auto_13246 )
      ( MAKE-1CRATE ?auto_13246 ?auto_13249 )
      ( MAKE-9CRATE-VERIFY ?auto_13240 ?auto_13241 ?auto_13242 ?auto_13243 ?auto_13244 ?auto_13245 ?auto_13248 ?auto_13247 ?auto_13246 ?auto_13249 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13272 - SURFACE
      ?auto_13273 - SURFACE
    )
    :vars
    (
      ?auto_13274 - HOIST
      ?auto_13275 - PLACE
      ?auto_13277 - PLACE
      ?auto_13278 - HOIST
      ?auto_13279 - SURFACE
      ?auto_13276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13274 ?auto_13275 ) ( SURFACE-AT ?auto_13272 ?auto_13275 ) ( CLEAR ?auto_13272 ) ( IS-CRATE ?auto_13273 ) ( AVAILABLE ?auto_13274 ) ( not ( = ?auto_13277 ?auto_13275 ) ) ( HOIST-AT ?auto_13278 ?auto_13277 ) ( AVAILABLE ?auto_13278 ) ( SURFACE-AT ?auto_13273 ?auto_13277 ) ( ON ?auto_13273 ?auto_13279 ) ( CLEAR ?auto_13273 ) ( TRUCK-AT ?auto_13276 ?auto_13275 ) ( not ( = ?auto_13272 ?auto_13273 ) ) ( not ( = ?auto_13272 ?auto_13279 ) ) ( not ( = ?auto_13273 ?auto_13279 ) ) ( not ( = ?auto_13274 ?auto_13278 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13276 ?auto_13275 ?auto_13277 )
      ( !LIFT ?auto_13278 ?auto_13273 ?auto_13279 ?auto_13277 )
      ( !LOAD ?auto_13278 ?auto_13273 ?auto_13276 ?auto_13277 )
      ( !DRIVE ?auto_13276 ?auto_13277 ?auto_13275 )
      ( !UNLOAD ?auto_13274 ?auto_13273 ?auto_13276 ?auto_13275 )
      ( !DROP ?auto_13274 ?auto_13273 ?auto_13272 ?auto_13275 )
      ( MAKE-1CRATE-VERIFY ?auto_13272 ?auto_13273 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_13291 - SURFACE
      ?auto_13292 - SURFACE
      ?auto_13293 - SURFACE
      ?auto_13294 - SURFACE
      ?auto_13295 - SURFACE
      ?auto_13296 - SURFACE
      ?auto_13299 - SURFACE
      ?auto_13298 - SURFACE
      ?auto_13297 - SURFACE
      ?auto_13300 - SURFACE
      ?auto_13301 - SURFACE
    )
    :vars
    (
      ?auto_13305 - HOIST
      ?auto_13307 - PLACE
      ?auto_13306 - PLACE
      ?auto_13302 - HOIST
      ?auto_13304 - SURFACE
      ?auto_13310 - PLACE
      ?auto_13308 - HOIST
      ?auto_13319 - SURFACE
      ?auto_13315 - PLACE
      ?auto_13317 - HOIST
      ?auto_13322 - SURFACE
      ?auto_13309 - SURFACE
      ?auto_13321 - PLACE
      ?auto_13311 - HOIST
      ?auto_13318 - SURFACE
      ?auto_13312 - SURFACE
      ?auto_13316 - PLACE
      ?auto_13313 - HOIST
      ?auto_13323 - SURFACE
      ?auto_13314 - SURFACE
      ?auto_13324 - SURFACE
      ?auto_13320 - SURFACE
      ?auto_13303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13305 ?auto_13307 ) ( IS-CRATE ?auto_13301 ) ( not ( = ?auto_13306 ?auto_13307 ) ) ( HOIST-AT ?auto_13302 ?auto_13306 ) ( AVAILABLE ?auto_13302 ) ( SURFACE-AT ?auto_13301 ?auto_13306 ) ( ON ?auto_13301 ?auto_13304 ) ( CLEAR ?auto_13301 ) ( not ( = ?auto_13300 ?auto_13301 ) ) ( not ( = ?auto_13300 ?auto_13304 ) ) ( not ( = ?auto_13301 ?auto_13304 ) ) ( not ( = ?auto_13305 ?auto_13302 ) ) ( IS-CRATE ?auto_13300 ) ( not ( = ?auto_13310 ?auto_13307 ) ) ( HOIST-AT ?auto_13308 ?auto_13310 ) ( SURFACE-AT ?auto_13300 ?auto_13310 ) ( ON ?auto_13300 ?auto_13319 ) ( CLEAR ?auto_13300 ) ( not ( = ?auto_13297 ?auto_13300 ) ) ( not ( = ?auto_13297 ?auto_13319 ) ) ( not ( = ?auto_13300 ?auto_13319 ) ) ( not ( = ?auto_13305 ?auto_13308 ) ) ( IS-CRATE ?auto_13297 ) ( not ( = ?auto_13315 ?auto_13307 ) ) ( HOIST-AT ?auto_13317 ?auto_13315 ) ( SURFACE-AT ?auto_13297 ?auto_13315 ) ( ON ?auto_13297 ?auto_13322 ) ( CLEAR ?auto_13297 ) ( not ( = ?auto_13298 ?auto_13297 ) ) ( not ( = ?auto_13298 ?auto_13322 ) ) ( not ( = ?auto_13297 ?auto_13322 ) ) ( not ( = ?auto_13305 ?auto_13317 ) ) ( IS-CRATE ?auto_13298 ) ( SURFACE-AT ?auto_13298 ?auto_13310 ) ( ON ?auto_13298 ?auto_13309 ) ( CLEAR ?auto_13298 ) ( not ( = ?auto_13299 ?auto_13298 ) ) ( not ( = ?auto_13299 ?auto_13309 ) ) ( not ( = ?auto_13298 ?auto_13309 ) ) ( IS-CRATE ?auto_13299 ) ( not ( = ?auto_13321 ?auto_13307 ) ) ( HOIST-AT ?auto_13311 ?auto_13321 ) ( SURFACE-AT ?auto_13299 ?auto_13321 ) ( ON ?auto_13299 ?auto_13318 ) ( CLEAR ?auto_13299 ) ( not ( = ?auto_13296 ?auto_13299 ) ) ( not ( = ?auto_13296 ?auto_13318 ) ) ( not ( = ?auto_13299 ?auto_13318 ) ) ( not ( = ?auto_13305 ?auto_13311 ) ) ( IS-CRATE ?auto_13296 ) ( AVAILABLE ?auto_13317 ) ( SURFACE-AT ?auto_13296 ?auto_13315 ) ( ON ?auto_13296 ?auto_13312 ) ( CLEAR ?auto_13296 ) ( not ( = ?auto_13295 ?auto_13296 ) ) ( not ( = ?auto_13295 ?auto_13312 ) ) ( not ( = ?auto_13296 ?auto_13312 ) ) ( IS-CRATE ?auto_13295 ) ( not ( = ?auto_13316 ?auto_13307 ) ) ( HOIST-AT ?auto_13313 ?auto_13316 ) ( AVAILABLE ?auto_13313 ) ( SURFACE-AT ?auto_13295 ?auto_13316 ) ( ON ?auto_13295 ?auto_13323 ) ( CLEAR ?auto_13295 ) ( not ( = ?auto_13294 ?auto_13295 ) ) ( not ( = ?auto_13294 ?auto_13323 ) ) ( not ( = ?auto_13295 ?auto_13323 ) ) ( not ( = ?auto_13305 ?auto_13313 ) ) ( IS-CRATE ?auto_13294 ) ( SURFACE-AT ?auto_13294 ?auto_13310 ) ( ON ?auto_13294 ?auto_13314 ) ( CLEAR ?auto_13294 ) ( not ( = ?auto_13293 ?auto_13294 ) ) ( not ( = ?auto_13293 ?auto_13314 ) ) ( not ( = ?auto_13294 ?auto_13314 ) ) ( IS-CRATE ?auto_13293 ) ( AVAILABLE ?auto_13311 ) ( SURFACE-AT ?auto_13293 ?auto_13321 ) ( ON ?auto_13293 ?auto_13324 ) ( CLEAR ?auto_13293 ) ( not ( = ?auto_13292 ?auto_13293 ) ) ( not ( = ?auto_13292 ?auto_13324 ) ) ( not ( = ?auto_13293 ?auto_13324 ) ) ( SURFACE-AT ?auto_13291 ?auto_13307 ) ( CLEAR ?auto_13291 ) ( IS-CRATE ?auto_13292 ) ( AVAILABLE ?auto_13305 ) ( AVAILABLE ?auto_13308 ) ( SURFACE-AT ?auto_13292 ?auto_13310 ) ( ON ?auto_13292 ?auto_13320 ) ( CLEAR ?auto_13292 ) ( TRUCK-AT ?auto_13303 ?auto_13307 ) ( not ( = ?auto_13291 ?auto_13292 ) ) ( not ( = ?auto_13291 ?auto_13320 ) ) ( not ( = ?auto_13292 ?auto_13320 ) ) ( not ( = ?auto_13291 ?auto_13293 ) ) ( not ( = ?auto_13291 ?auto_13324 ) ) ( not ( = ?auto_13293 ?auto_13320 ) ) ( not ( = ?auto_13321 ?auto_13310 ) ) ( not ( = ?auto_13311 ?auto_13308 ) ) ( not ( = ?auto_13324 ?auto_13320 ) ) ( not ( = ?auto_13291 ?auto_13294 ) ) ( not ( = ?auto_13291 ?auto_13314 ) ) ( not ( = ?auto_13292 ?auto_13294 ) ) ( not ( = ?auto_13292 ?auto_13314 ) ) ( not ( = ?auto_13294 ?auto_13324 ) ) ( not ( = ?auto_13294 ?auto_13320 ) ) ( not ( = ?auto_13314 ?auto_13324 ) ) ( not ( = ?auto_13314 ?auto_13320 ) ) ( not ( = ?auto_13291 ?auto_13295 ) ) ( not ( = ?auto_13291 ?auto_13323 ) ) ( not ( = ?auto_13292 ?auto_13295 ) ) ( not ( = ?auto_13292 ?auto_13323 ) ) ( not ( = ?auto_13293 ?auto_13295 ) ) ( not ( = ?auto_13293 ?auto_13323 ) ) ( not ( = ?auto_13295 ?auto_13314 ) ) ( not ( = ?auto_13295 ?auto_13324 ) ) ( not ( = ?auto_13295 ?auto_13320 ) ) ( not ( = ?auto_13316 ?auto_13310 ) ) ( not ( = ?auto_13316 ?auto_13321 ) ) ( not ( = ?auto_13313 ?auto_13308 ) ) ( not ( = ?auto_13313 ?auto_13311 ) ) ( not ( = ?auto_13323 ?auto_13314 ) ) ( not ( = ?auto_13323 ?auto_13324 ) ) ( not ( = ?auto_13323 ?auto_13320 ) ) ( not ( = ?auto_13291 ?auto_13296 ) ) ( not ( = ?auto_13291 ?auto_13312 ) ) ( not ( = ?auto_13292 ?auto_13296 ) ) ( not ( = ?auto_13292 ?auto_13312 ) ) ( not ( = ?auto_13293 ?auto_13296 ) ) ( not ( = ?auto_13293 ?auto_13312 ) ) ( not ( = ?auto_13294 ?auto_13296 ) ) ( not ( = ?auto_13294 ?auto_13312 ) ) ( not ( = ?auto_13296 ?auto_13323 ) ) ( not ( = ?auto_13296 ?auto_13314 ) ) ( not ( = ?auto_13296 ?auto_13324 ) ) ( not ( = ?auto_13296 ?auto_13320 ) ) ( not ( = ?auto_13315 ?auto_13316 ) ) ( not ( = ?auto_13315 ?auto_13310 ) ) ( not ( = ?auto_13315 ?auto_13321 ) ) ( not ( = ?auto_13317 ?auto_13313 ) ) ( not ( = ?auto_13317 ?auto_13308 ) ) ( not ( = ?auto_13317 ?auto_13311 ) ) ( not ( = ?auto_13312 ?auto_13323 ) ) ( not ( = ?auto_13312 ?auto_13314 ) ) ( not ( = ?auto_13312 ?auto_13324 ) ) ( not ( = ?auto_13312 ?auto_13320 ) ) ( not ( = ?auto_13291 ?auto_13299 ) ) ( not ( = ?auto_13291 ?auto_13318 ) ) ( not ( = ?auto_13292 ?auto_13299 ) ) ( not ( = ?auto_13292 ?auto_13318 ) ) ( not ( = ?auto_13293 ?auto_13299 ) ) ( not ( = ?auto_13293 ?auto_13318 ) ) ( not ( = ?auto_13294 ?auto_13299 ) ) ( not ( = ?auto_13294 ?auto_13318 ) ) ( not ( = ?auto_13295 ?auto_13299 ) ) ( not ( = ?auto_13295 ?auto_13318 ) ) ( not ( = ?auto_13299 ?auto_13312 ) ) ( not ( = ?auto_13299 ?auto_13323 ) ) ( not ( = ?auto_13299 ?auto_13314 ) ) ( not ( = ?auto_13299 ?auto_13324 ) ) ( not ( = ?auto_13299 ?auto_13320 ) ) ( not ( = ?auto_13318 ?auto_13312 ) ) ( not ( = ?auto_13318 ?auto_13323 ) ) ( not ( = ?auto_13318 ?auto_13314 ) ) ( not ( = ?auto_13318 ?auto_13324 ) ) ( not ( = ?auto_13318 ?auto_13320 ) ) ( not ( = ?auto_13291 ?auto_13298 ) ) ( not ( = ?auto_13291 ?auto_13309 ) ) ( not ( = ?auto_13292 ?auto_13298 ) ) ( not ( = ?auto_13292 ?auto_13309 ) ) ( not ( = ?auto_13293 ?auto_13298 ) ) ( not ( = ?auto_13293 ?auto_13309 ) ) ( not ( = ?auto_13294 ?auto_13298 ) ) ( not ( = ?auto_13294 ?auto_13309 ) ) ( not ( = ?auto_13295 ?auto_13298 ) ) ( not ( = ?auto_13295 ?auto_13309 ) ) ( not ( = ?auto_13296 ?auto_13298 ) ) ( not ( = ?auto_13296 ?auto_13309 ) ) ( not ( = ?auto_13298 ?auto_13318 ) ) ( not ( = ?auto_13298 ?auto_13312 ) ) ( not ( = ?auto_13298 ?auto_13323 ) ) ( not ( = ?auto_13298 ?auto_13314 ) ) ( not ( = ?auto_13298 ?auto_13324 ) ) ( not ( = ?auto_13298 ?auto_13320 ) ) ( not ( = ?auto_13309 ?auto_13318 ) ) ( not ( = ?auto_13309 ?auto_13312 ) ) ( not ( = ?auto_13309 ?auto_13323 ) ) ( not ( = ?auto_13309 ?auto_13314 ) ) ( not ( = ?auto_13309 ?auto_13324 ) ) ( not ( = ?auto_13309 ?auto_13320 ) ) ( not ( = ?auto_13291 ?auto_13297 ) ) ( not ( = ?auto_13291 ?auto_13322 ) ) ( not ( = ?auto_13292 ?auto_13297 ) ) ( not ( = ?auto_13292 ?auto_13322 ) ) ( not ( = ?auto_13293 ?auto_13297 ) ) ( not ( = ?auto_13293 ?auto_13322 ) ) ( not ( = ?auto_13294 ?auto_13297 ) ) ( not ( = ?auto_13294 ?auto_13322 ) ) ( not ( = ?auto_13295 ?auto_13297 ) ) ( not ( = ?auto_13295 ?auto_13322 ) ) ( not ( = ?auto_13296 ?auto_13297 ) ) ( not ( = ?auto_13296 ?auto_13322 ) ) ( not ( = ?auto_13299 ?auto_13297 ) ) ( not ( = ?auto_13299 ?auto_13322 ) ) ( not ( = ?auto_13297 ?auto_13309 ) ) ( not ( = ?auto_13297 ?auto_13318 ) ) ( not ( = ?auto_13297 ?auto_13312 ) ) ( not ( = ?auto_13297 ?auto_13323 ) ) ( not ( = ?auto_13297 ?auto_13314 ) ) ( not ( = ?auto_13297 ?auto_13324 ) ) ( not ( = ?auto_13297 ?auto_13320 ) ) ( not ( = ?auto_13322 ?auto_13309 ) ) ( not ( = ?auto_13322 ?auto_13318 ) ) ( not ( = ?auto_13322 ?auto_13312 ) ) ( not ( = ?auto_13322 ?auto_13323 ) ) ( not ( = ?auto_13322 ?auto_13314 ) ) ( not ( = ?auto_13322 ?auto_13324 ) ) ( not ( = ?auto_13322 ?auto_13320 ) ) ( not ( = ?auto_13291 ?auto_13300 ) ) ( not ( = ?auto_13291 ?auto_13319 ) ) ( not ( = ?auto_13292 ?auto_13300 ) ) ( not ( = ?auto_13292 ?auto_13319 ) ) ( not ( = ?auto_13293 ?auto_13300 ) ) ( not ( = ?auto_13293 ?auto_13319 ) ) ( not ( = ?auto_13294 ?auto_13300 ) ) ( not ( = ?auto_13294 ?auto_13319 ) ) ( not ( = ?auto_13295 ?auto_13300 ) ) ( not ( = ?auto_13295 ?auto_13319 ) ) ( not ( = ?auto_13296 ?auto_13300 ) ) ( not ( = ?auto_13296 ?auto_13319 ) ) ( not ( = ?auto_13299 ?auto_13300 ) ) ( not ( = ?auto_13299 ?auto_13319 ) ) ( not ( = ?auto_13298 ?auto_13300 ) ) ( not ( = ?auto_13298 ?auto_13319 ) ) ( not ( = ?auto_13300 ?auto_13322 ) ) ( not ( = ?auto_13300 ?auto_13309 ) ) ( not ( = ?auto_13300 ?auto_13318 ) ) ( not ( = ?auto_13300 ?auto_13312 ) ) ( not ( = ?auto_13300 ?auto_13323 ) ) ( not ( = ?auto_13300 ?auto_13314 ) ) ( not ( = ?auto_13300 ?auto_13324 ) ) ( not ( = ?auto_13300 ?auto_13320 ) ) ( not ( = ?auto_13319 ?auto_13322 ) ) ( not ( = ?auto_13319 ?auto_13309 ) ) ( not ( = ?auto_13319 ?auto_13318 ) ) ( not ( = ?auto_13319 ?auto_13312 ) ) ( not ( = ?auto_13319 ?auto_13323 ) ) ( not ( = ?auto_13319 ?auto_13314 ) ) ( not ( = ?auto_13319 ?auto_13324 ) ) ( not ( = ?auto_13319 ?auto_13320 ) ) ( not ( = ?auto_13291 ?auto_13301 ) ) ( not ( = ?auto_13291 ?auto_13304 ) ) ( not ( = ?auto_13292 ?auto_13301 ) ) ( not ( = ?auto_13292 ?auto_13304 ) ) ( not ( = ?auto_13293 ?auto_13301 ) ) ( not ( = ?auto_13293 ?auto_13304 ) ) ( not ( = ?auto_13294 ?auto_13301 ) ) ( not ( = ?auto_13294 ?auto_13304 ) ) ( not ( = ?auto_13295 ?auto_13301 ) ) ( not ( = ?auto_13295 ?auto_13304 ) ) ( not ( = ?auto_13296 ?auto_13301 ) ) ( not ( = ?auto_13296 ?auto_13304 ) ) ( not ( = ?auto_13299 ?auto_13301 ) ) ( not ( = ?auto_13299 ?auto_13304 ) ) ( not ( = ?auto_13298 ?auto_13301 ) ) ( not ( = ?auto_13298 ?auto_13304 ) ) ( not ( = ?auto_13297 ?auto_13301 ) ) ( not ( = ?auto_13297 ?auto_13304 ) ) ( not ( = ?auto_13301 ?auto_13319 ) ) ( not ( = ?auto_13301 ?auto_13322 ) ) ( not ( = ?auto_13301 ?auto_13309 ) ) ( not ( = ?auto_13301 ?auto_13318 ) ) ( not ( = ?auto_13301 ?auto_13312 ) ) ( not ( = ?auto_13301 ?auto_13323 ) ) ( not ( = ?auto_13301 ?auto_13314 ) ) ( not ( = ?auto_13301 ?auto_13324 ) ) ( not ( = ?auto_13301 ?auto_13320 ) ) ( not ( = ?auto_13306 ?auto_13310 ) ) ( not ( = ?auto_13306 ?auto_13315 ) ) ( not ( = ?auto_13306 ?auto_13321 ) ) ( not ( = ?auto_13306 ?auto_13316 ) ) ( not ( = ?auto_13302 ?auto_13308 ) ) ( not ( = ?auto_13302 ?auto_13317 ) ) ( not ( = ?auto_13302 ?auto_13311 ) ) ( not ( = ?auto_13302 ?auto_13313 ) ) ( not ( = ?auto_13304 ?auto_13319 ) ) ( not ( = ?auto_13304 ?auto_13322 ) ) ( not ( = ?auto_13304 ?auto_13309 ) ) ( not ( = ?auto_13304 ?auto_13318 ) ) ( not ( = ?auto_13304 ?auto_13312 ) ) ( not ( = ?auto_13304 ?auto_13323 ) ) ( not ( = ?auto_13304 ?auto_13314 ) ) ( not ( = ?auto_13304 ?auto_13324 ) ) ( not ( = ?auto_13304 ?auto_13320 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_13291 ?auto_13292 ?auto_13293 ?auto_13294 ?auto_13295 ?auto_13296 ?auto_13299 ?auto_13298 ?auto_13297 ?auto_13300 )
      ( MAKE-1CRATE ?auto_13300 ?auto_13301 )
      ( MAKE-10CRATE-VERIFY ?auto_13291 ?auto_13292 ?auto_13293 ?auto_13294 ?auto_13295 ?auto_13296 ?auto_13299 ?auto_13298 ?auto_13297 ?auto_13300 ?auto_13301 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13327 - SURFACE
      ?auto_13328 - SURFACE
    )
    :vars
    (
      ?auto_13329 - HOIST
      ?auto_13330 - PLACE
      ?auto_13332 - PLACE
      ?auto_13333 - HOIST
      ?auto_13334 - SURFACE
      ?auto_13331 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13329 ?auto_13330 ) ( SURFACE-AT ?auto_13327 ?auto_13330 ) ( CLEAR ?auto_13327 ) ( IS-CRATE ?auto_13328 ) ( AVAILABLE ?auto_13329 ) ( not ( = ?auto_13332 ?auto_13330 ) ) ( HOIST-AT ?auto_13333 ?auto_13332 ) ( AVAILABLE ?auto_13333 ) ( SURFACE-AT ?auto_13328 ?auto_13332 ) ( ON ?auto_13328 ?auto_13334 ) ( CLEAR ?auto_13328 ) ( TRUCK-AT ?auto_13331 ?auto_13330 ) ( not ( = ?auto_13327 ?auto_13328 ) ) ( not ( = ?auto_13327 ?auto_13334 ) ) ( not ( = ?auto_13328 ?auto_13334 ) ) ( not ( = ?auto_13329 ?auto_13333 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13331 ?auto_13330 ?auto_13332 )
      ( !LIFT ?auto_13333 ?auto_13328 ?auto_13334 ?auto_13332 )
      ( !LOAD ?auto_13333 ?auto_13328 ?auto_13331 ?auto_13332 )
      ( !DRIVE ?auto_13331 ?auto_13332 ?auto_13330 )
      ( !UNLOAD ?auto_13329 ?auto_13328 ?auto_13331 ?auto_13330 )
      ( !DROP ?auto_13329 ?auto_13328 ?auto_13327 ?auto_13330 )
      ( MAKE-1CRATE-VERIFY ?auto_13327 ?auto_13328 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_13347 - SURFACE
      ?auto_13348 - SURFACE
      ?auto_13349 - SURFACE
      ?auto_13350 - SURFACE
      ?auto_13351 - SURFACE
      ?auto_13352 - SURFACE
      ?auto_13355 - SURFACE
      ?auto_13354 - SURFACE
      ?auto_13353 - SURFACE
      ?auto_13356 - SURFACE
      ?auto_13358 - SURFACE
      ?auto_13357 - SURFACE
    )
    :vars
    (
      ?auto_13360 - HOIST
      ?auto_13359 - PLACE
      ?auto_13361 - PLACE
      ?auto_13362 - HOIST
      ?auto_13363 - SURFACE
      ?auto_13367 - PLACE
      ?auto_13372 - HOIST
      ?auto_13375 - SURFACE
      ?auto_13382 - PLACE
      ?auto_13378 - HOIST
      ?auto_13380 - SURFACE
      ?auto_13373 - SURFACE
      ?auto_13369 - SURFACE
      ?auto_13374 - PLACE
      ?auto_13379 - HOIST
      ?auto_13366 - SURFACE
      ?auto_13368 - SURFACE
      ?auto_13376 - PLACE
      ?auto_13377 - HOIST
      ?auto_13371 - SURFACE
      ?auto_13370 - SURFACE
      ?auto_13381 - SURFACE
      ?auto_13365 - SURFACE
      ?auto_13364 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13360 ?auto_13359 ) ( IS-CRATE ?auto_13357 ) ( not ( = ?auto_13361 ?auto_13359 ) ) ( HOIST-AT ?auto_13362 ?auto_13361 ) ( SURFACE-AT ?auto_13357 ?auto_13361 ) ( ON ?auto_13357 ?auto_13363 ) ( CLEAR ?auto_13357 ) ( not ( = ?auto_13358 ?auto_13357 ) ) ( not ( = ?auto_13358 ?auto_13363 ) ) ( not ( = ?auto_13357 ?auto_13363 ) ) ( not ( = ?auto_13360 ?auto_13362 ) ) ( IS-CRATE ?auto_13358 ) ( not ( = ?auto_13367 ?auto_13359 ) ) ( HOIST-AT ?auto_13372 ?auto_13367 ) ( AVAILABLE ?auto_13372 ) ( SURFACE-AT ?auto_13358 ?auto_13367 ) ( ON ?auto_13358 ?auto_13375 ) ( CLEAR ?auto_13358 ) ( not ( = ?auto_13356 ?auto_13358 ) ) ( not ( = ?auto_13356 ?auto_13375 ) ) ( not ( = ?auto_13358 ?auto_13375 ) ) ( not ( = ?auto_13360 ?auto_13372 ) ) ( IS-CRATE ?auto_13356 ) ( not ( = ?auto_13382 ?auto_13359 ) ) ( HOIST-AT ?auto_13378 ?auto_13382 ) ( SURFACE-AT ?auto_13356 ?auto_13382 ) ( ON ?auto_13356 ?auto_13380 ) ( CLEAR ?auto_13356 ) ( not ( = ?auto_13353 ?auto_13356 ) ) ( not ( = ?auto_13353 ?auto_13380 ) ) ( not ( = ?auto_13356 ?auto_13380 ) ) ( not ( = ?auto_13360 ?auto_13378 ) ) ( IS-CRATE ?auto_13353 ) ( SURFACE-AT ?auto_13353 ?auto_13361 ) ( ON ?auto_13353 ?auto_13373 ) ( CLEAR ?auto_13353 ) ( not ( = ?auto_13354 ?auto_13353 ) ) ( not ( = ?auto_13354 ?auto_13373 ) ) ( not ( = ?auto_13353 ?auto_13373 ) ) ( IS-CRATE ?auto_13354 ) ( SURFACE-AT ?auto_13354 ?auto_13382 ) ( ON ?auto_13354 ?auto_13369 ) ( CLEAR ?auto_13354 ) ( not ( = ?auto_13355 ?auto_13354 ) ) ( not ( = ?auto_13355 ?auto_13369 ) ) ( not ( = ?auto_13354 ?auto_13369 ) ) ( IS-CRATE ?auto_13355 ) ( not ( = ?auto_13374 ?auto_13359 ) ) ( HOIST-AT ?auto_13379 ?auto_13374 ) ( SURFACE-AT ?auto_13355 ?auto_13374 ) ( ON ?auto_13355 ?auto_13366 ) ( CLEAR ?auto_13355 ) ( not ( = ?auto_13352 ?auto_13355 ) ) ( not ( = ?auto_13352 ?auto_13366 ) ) ( not ( = ?auto_13355 ?auto_13366 ) ) ( not ( = ?auto_13360 ?auto_13379 ) ) ( IS-CRATE ?auto_13352 ) ( AVAILABLE ?auto_13362 ) ( SURFACE-AT ?auto_13352 ?auto_13361 ) ( ON ?auto_13352 ?auto_13368 ) ( CLEAR ?auto_13352 ) ( not ( = ?auto_13351 ?auto_13352 ) ) ( not ( = ?auto_13351 ?auto_13368 ) ) ( not ( = ?auto_13352 ?auto_13368 ) ) ( IS-CRATE ?auto_13351 ) ( not ( = ?auto_13376 ?auto_13359 ) ) ( HOIST-AT ?auto_13377 ?auto_13376 ) ( AVAILABLE ?auto_13377 ) ( SURFACE-AT ?auto_13351 ?auto_13376 ) ( ON ?auto_13351 ?auto_13371 ) ( CLEAR ?auto_13351 ) ( not ( = ?auto_13350 ?auto_13351 ) ) ( not ( = ?auto_13350 ?auto_13371 ) ) ( not ( = ?auto_13351 ?auto_13371 ) ) ( not ( = ?auto_13360 ?auto_13377 ) ) ( IS-CRATE ?auto_13350 ) ( SURFACE-AT ?auto_13350 ?auto_13382 ) ( ON ?auto_13350 ?auto_13370 ) ( CLEAR ?auto_13350 ) ( not ( = ?auto_13349 ?auto_13350 ) ) ( not ( = ?auto_13349 ?auto_13370 ) ) ( not ( = ?auto_13350 ?auto_13370 ) ) ( IS-CRATE ?auto_13349 ) ( AVAILABLE ?auto_13379 ) ( SURFACE-AT ?auto_13349 ?auto_13374 ) ( ON ?auto_13349 ?auto_13381 ) ( CLEAR ?auto_13349 ) ( not ( = ?auto_13348 ?auto_13349 ) ) ( not ( = ?auto_13348 ?auto_13381 ) ) ( not ( = ?auto_13349 ?auto_13381 ) ) ( SURFACE-AT ?auto_13347 ?auto_13359 ) ( CLEAR ?auto_13347 ) ( IS-CRATE ?auto_13348 ) ( AVAILABLE ?auto_13360 ) ( AVAILABLE ?auto_13378 ) ( SURFACE-AT ?auto_13348 ?auto_13382 ) ( ON ?auto_13348 ?auto_13365 ) ( CLEAR ?auto_13348 ) ( TRUCK-AT ?auto_13364 ?auto_13359 ) ( not ( = ?auto_13347 ?auto_13348 ) ) ( not ( = ?auto_13347 ?auto_13365 ) ) ( not ( = ?auto_13348 ?auto_13365 ) ) ( not ( = ?auto_13347 ?auto_13349 ) ) ( not ( = ?auto_13347 ?auto_13381 ) ) ( not ( = ?auto_13349 ?auto_13365 ) ) ( not ( = ?auto_13374 ?auto_13382 ) ) ( not ( = ?auto_13379 ?auto_13378 ) ) ( not ( = ?auto_13381 ?auto_13365 ) ) ( not ( = ?auto_13347 ?auto_13350 ) ) ( not ( = ?auto_13347 ?auto_13370 ) ) ( not ( = ?auto_13348 ?auto_13350 ) ) ( not ( = ?auto_13348 ?auto_13370 ) ) ( not ( = ?auto_13350 ?auto_13381 ) ) ( not ( = ?auto_13350 ?auto_13365 ) ) ( not ( = ?auto_13370 ?auto_13381 ) ) ( not ( = ?auto_13370 ?auto_13365 ) ) ( not ( = ?auto_13347 ?auto_13351 ) ) ( not ( = ?auto_13347 ?auto_13371 ) ) ( not ( = ?auto_13348 ?auto_13351 ) ) ( not ( = ?auto_13348 ?auto_13371 ) ) ( not ( = ?auto_13349 ?auto_13351 ) ) ( not ( = ?auto_13349 ?auto_13371 ) ) ( not ( = ?auto_13351 ?auto_13370 ) ) ( not ( = ?auto_13351 ?auto_13381 ) ) ( not ( = ?auto_13351 ?auto_13365 ) ) ( not ( = ?auto_13376 ?auto_13382 ) ) ( not ( = ?auto_13376 ?auto_13374 ) ) ( not ( = ?auto_13377 ?auto_13378 ) ) ( not ( = ?auto_13377 ?auto_13379 ) ) ( not ( = ?auto_13371 ?auto_13370 ) ) ( not ( = ?auto_13371 ?auto_13381 ) ) ( not ( = ?auto_13371 ?auto_13365 ) ) ( not ( = ?auto_13347 ?auto_13352 ) ) ( not ( = ?auto_13347 ?auto_13368 ) ) ( not ( = ?auto_13348 ?auto_13352 ) ) ( not ( = ?auto_13348 ?auto_13368 ) ) ( not ( = ?auto_13349 ?auto_13352 ) ) ( not ( = ?auto_13349 ?auto_13368 ) ) ( not ( = ?auto_13350 ?auto_13352 ) ) ( not ( = ?auto_13350 ?auto_13368 ) ) ( not ( = ?auto_13352 ?auto_13371 ) ) ( not ( = ?auto_13352 ?auto_13370 ) ) ( not ( = ?auto_13352 ?auto_13381 ) ) ( not ( = ?auto_13352 ?auto_13365 ) ) ( not ( = ?auto_13361 ?auto_13376 ) ) ( not ( = ?auto_13361 ?auto_13382 ) ) ( not ( = ?auto_13361 ?auto_13374 ) ) ( not ( = ?auto_13362 ?auto_13377 ) ) ( not ( = ?auto_13362 ?auto_13378 ) ) ( not ( = ?auto_13362 ?auto_13379 ) ) ( not ( = ?auto_13368 ?auto_13371 ) ) ( not ( = ?auto_13368 ?auto_13370 ) ) ( not ( = ?auto_13368 ?auto_13381 ) ) ( not ( = ?auto_13368 ?auto_13365 ) ) ( not ( = ?auto_13347 ?auto_13355 ) ) ( not ( = ?auto_13347 ?auto_13366 ) ) ( not ( = ?auto_13348 ?auto_13355 ) ) ( not ( = ?auto_13348 ?auto_13366 ) ) ( not ( = ?auto_13349 ?auto_13355 ) ) ( not ( = ?auto_13349 ?auto_13366 ) ) ( not ( = ?auto_13350 ?auto_13355 ) ) ( not ( = ?auto_13350 ?auto_13366 ) ) ( not ( = ?auto_13351 ?auto_13355 ) ) ( not ( = ?auto_13351 ?auto_13366 ) ) ( not ( = ?auto_13355 ?auto_13368 ) ) ( not ( = ?auto_13355 ?auto_13371 ) ) ( not ( = ?auto_13355 ?auto_13370 ) ) ( not ( = ?auto_13355 ?auto_13381 ) ) ( not ( = ?auto_13355 ?auto_13365 ) ) ( not ( = ?auto_13366 ?auto_13368 ) ) ( not ( = ?auto_13366 ?auto_13371 ) ) ( not ( = ?auto_13366 ?auto_13370 ) ) ( not ( = ?auto_13366 ?auto_13381 ) ) ( not ( = ?auto_13366 ?auto_13365 ) ) ( not ( = ?auto_13347 ?auto_13354 ) ) ( not ( = ?auto_13347 ?auto_13369 ) ) ( not ( = ?auto_13348 ?auto_13354 ) ) ( not ( = ?auto_13348 ?auto_13369 ) ) ( not ( = ?auto_13349 ?auto_13354 ) ) ( not ( = ?auto_13349 ?auto_13369 ) ) ( not ( = ?auto_13350 ?auto_13354 ) ) ( not ( = ?auto_13350 ?auto_13369 ) ) ( not ( = ?auto_13351 ?auto_13354 ) ) ( not ( = ?auto_13351 ?auto_13369 ) ) ( not ( = ?auto_13352 ?auto_13354 ) ) ( not ( = ?auto_13352 ?auto_13369 ) ) ( not ( = ?auto_13354 ?auto_13366 ) ) ( not ( = ?auto_13354 ?auto_13368 ) ) ( not ( = ?auto_13354 ?auto_13371 ) ) ( not ( = ?auto_13354 ?auto_13370 ) ) ( not ( = ?auto_13354 ?auto_13381 ) ) ( not ( = ?auto_13354 ?auto_13365 ) ) ( not ( = ?auto_13369 ?auto_13366 ) ) ( not ( = ?auto_13369 ?auto_13368 ) ) ( not ( = ?auto_13369 ?auto_13371 ) ) ( not ( = ?auto_13369 ?auto_13370 ) ) ( not ( = ?auto_13369 ?auto_13381 ) ) ( not ( = ?auto_13369 ?auto_13365 ) ) ( not ( = ?auto_13347 ?auto_13353 ) ) ( not ( = ?auto_13347 ?auto_13373 ) ) ( not ( = ?auto_13348 ?auto_13353 ) ) ( not ( = ?auto_13348 ?auto_13373 ) ) ( not ( = ?auto_13349 ?auto_13353 ) ) ( not ( = ?auto_13349 ?auto_13373 ) ) ( not ( = ?auto_13350 ?auto_13353 ) ) ( not ( = ?auto_13350 ?auto_13373 ) ) ( not ( = ?auto_13351 ?auto_13353 ) ) ( not ( = ?auto_13351 ?auto_13373 ) ) ( not ( = ?auto_13352 ?auto_13353 ) ) ( not ( = ?auto_13352 ?auto_13373 ) ) ( not ( = ?auto_13355 ?auto_13353 ) ) ( not ( = ?auto_13355 ?auto_13373 ) ) ( not ( = ?auto_13353 ?auto_13369 ) ) ( not ( = ?auto_13353 ?auto_13366 ) ) ( not ( = ?auto_13353 ?auto_13368 ) ) ( not ( = ?auto_13353 ?auto_13371 ) ) ( not ( = ?auto_13353 ?auto_13370 ) ) ( not ( = ?auto_13353 ?auto_13381 ) ) ( not ( = ?auto_13353 ?auto_13365 ) ) ( not ( = ?auto_13373 ?auto_13369 ) ) ( not ( = ?auto_13373 ?auto_13366 ) ) ( not ( = ?auto_13373 ?auto_13368 ) ) ( not ( = ?auto_13373 ?auto_13371 ) ) ( not ( = ?auto_13373 ?auto_13370 ) ) ( not ( = ?auto_13373 ?auto_13381 ) ) ( not ( = ?auto_13373 ?auto_13365 ) ) ( not ( = ?auto_13347 ?auto_13356 ) ) ( not ( = ?auto_13347 ?auto_13380 ) ) ( not ( = ?auto_13348 ?auto_13356 ) ) ( not ( = ?auto_13348 ?auto_13380 ) ) ( not ( = ?auto_13349 ?auto_13356 ) ) ( not ( = ?auto_13349 ?auto_13380 ) ) ( not ( = ?auto_13350 ?auto_13356 ) ) ( not ( = ?auto_13350 ?auto_13380 ) ) ( not ( = ?auto_13351 ?auto_13356 ) ) ( not ( = ?auto_13351 ?auto_13380 ) ) ( not ( = ?auto_13352 ?auto_13356 ) ) ( not ( = ?auto_13352 ?auto_13380 ) ) ( not ( = ?auto_13355 ?auto_13356 ) ) ( not ( = ?auto_13355 ?auto_13380 ) ) ( not ( = ?auto_13354 ?auto_13356 ) ) ( not ( = ?auto_13354 ?auto_13380 ) ) ( not ( = ?auto_13356 ?auto_13373 ) ) ( not ( = ?auto_13356 ?auto_13369 ) ) ( not ( = ?auto_13356 ?auto_13366 ) ) ( not ( = ?auto_13356 ?auto_13368 ) ) ( not ( = ?auto_13356 ?auto_13371 ) ) ( not ( = ?auto_13356 ?auto_13370 ) ) ( not ( = ?auto_13356 ?auto_13381 ) ) ( not ( = ?auto_13356 ?auto_13365 ) ) ( not ( = ?auto_13380 ?auto_13373 ) ) ( not ( = ?auto_13380 ?auto_13369 ) ) ( not ( = ?auto_13380 ?auto_13366 ) ) ( not ( = ?auto_13380 ?auto_13368 ) ) ( not ( = ?auto_13380 ?auto_13371 ) ) ( not ( = ?auto_13380 ?auto_13370 ) ) ( not ( = ?auto_13380 ?auto_13381 ) ) ( not ( = ?auto_13380 ?auto_13365 ) ) ( not ( = ?auto_13347 ?auto_13358 ) ) ( not ( = ?auto_13347 ?auto_13375 ) ) ( not ( = ?auto_13348 ?auto_13358 ) ) ( not ( = ?auto_13348 ?auto_13375 ) ) ( not ( = ?auto_13349 ?auto_13358 ) ) ( not ( = ?auto_13349 ?auto_13375 ) ) ( not ( = ?auto_13350 ?auto_13358 ) ) ( not ( = ?auto_13350 ?auto_13375 ) ) ( not ( = ?auto_13351 ?auto_13358 ) ) ( not ( = ?auto_13351 ?auto_13375 ) ) ( not ( = ?auto_13352 ?auto_13358 ) ) ( not ( = ?auto_13352 ?auto_13375 ) ) ( not ( = ?auto_13355 ?auto_13358 ) ) ( not ( = ?auto_13355 ?auto_13375 ) ) ( not ( = ?auto_13354 ?auto_13358 ) ) ( not ( = ?auto_13354 ?auto_13375 ) ) ( not ( = ?auto_13353 ?auto_13358 ) ) ( not ( = ?auto_13353 ?auto_13375 ) ) ( not ( = ?auto_13358 ?auto_13380 ) ) ( not ( = ?auto_13358 ?auto_13373 ) ) ( not ( = ?auto_13358 ?auto_13369 ) ) ( not ( = ?auto_13358 ?auto_13366 ) ) ( not ( = ?auto_13358 ?auto_13368 ) ) ( not ( = ?auto_13358 ?auto_13371 ) ) ( not ( = ?auto_13358 ?auto_13370 ) ) ( not ( = ?auto_13358 ?auto_13381 ) ) ( not ( = ?auto_13358 ?auto_13365 ) ) ( not ( = ?auto_13367 ?auto_13382 ) ) ( not ( = ?auto_13367 ?auto_13361 ) ) ( not ( = ?auto_13367 ?auto_13374 ) ) ( not ( = ?auto_13367 ?auto_13376 ) ) ( not ( = ?auto_13372 ?auto_13378 ) ) ( not ( = ?auto_13372 ?auto_13362 ) ) ( not ( = ?auto_13372 ?auto_13379 ) ) ( not ( = ?auto_13372 ?auto_13377 ) ) ( not ( = ?auto_13375 ?auto_13380 ) ) ( not ( = ?auto_13375 ?auto_13373 ) ) ( not ( = ?auto_13375 ?auto_13369 ) ) ( not ( = ?auto_13375 ?auto_13366 ) ) ( not ( = ?auto_13375 ?auto_13368 ) ) ( not ( = ?auto_13375 ?auto_13371 ) ) ( not ( = ?auto_13375 ?auto_13370 ) ) ( not ( = ?auto_13375 ?auto_13381 ) ) ( not ( = ?auto_13375 ?auto_13365 ) ) ( not ( = ?auto_13347 ?auto_13357 ) ) ( not ( = ?auto_13347 ?auto_13363 ) ) ( not ( = ?auto_13348 ?auto_13357 ) ) ( not ( = ?auto_13348 ?auto_13363 ) ) ( not ( = ?auto_13349 ?auto_13357 ) ) ( not ( = ?auto_13349 ?auto_13363 ) ) ( not ( = ?auto_13350 ?auto_13357 ) ) ( not ( = ?auto_13350 ?auto_13363 ) ) ( not ( = ?auto_13351 ?auto_13357 ) ) ( not ( = ?auto_13351 ?auto_13363 ) ) ( not ( = ?auto_13352 ?auto_13357 ) ) ( not ( = ?auto_13352 ?auto_13363 ) ) ( not ( = ?auto_13355 ?auto_13357 ) ) ( not ( = ?auto_13355 ?auto_13363 ) ) ( not ( = ?auto_13354 ?auto_13357 ) ) ( not ( = ?auto_13354 ?auto_13363 ) ) ( not ( = ?auto_13353 ?auto_13357 ) ) ( not ( = ?auto_13353 ?auto_13363 ) ) ( not ( = ?auto_13356 ?auto_13357 ) ) ( not ( = ?auto_13356 ?auto_13363 ) ) ( not ( = ?auto_13357 ?auto_13375 ) ) ( not ( = ?auto_13357 ?auto_13380 ) ) ( not ( = ?auto_13357 ?auto_13373 ) ) ( not ( = ?auto_13357 ?auto_13369 ) ) ( not ( = ?auto_13357 ?auto_13366 ) ) ( not ( = ?auto_13357 ?auto_13368 ) ) ( not ( = ?auto_13357 ?auto_13371 ) ) ( not ( = ?auto_13357 ?auto_13370 ) ) ( not ( = ?auto_13357 ?auto_13381 ) ) ( not ( = ?auto_13357 ?auto_13365 ) ) ( not ( = ?auto_13363 ?auto_13375 ) ) ( not ( = ?auto_13363 ?auto_13380 ) ) ( not ( = ?auto_13363 ?auto_13373 ) ) ( not ( = ?auto_13363 ?auto_13369 ) ) ( not ( = ?auto_13363 ?auto_13366 ) ) ( not ( = ?auto_13363 ?auto_13368 ) ) ( not ( = ?auto_13363 ?auto_13371 ) ) ( not ( = ?auto_13363 ?auto_13370 ) ) ( not ( = ?auto_13363 ?auto_13381 ) ) ( not ( = ?auto_13363 ?auto_13365 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_13347 ?auto_13348 ?auto_13349 ?auto_13350 ?auto_13351 ?auto_13352 ?auto_13355 ?auto_13354 ?auto_13353 ?auto_13356 ?auto_13358 )
      ( MAKE-1CRATE ?auto_13358 ?auto_13357 )
      ( MAKE-11CRATE-VERIFY ?auto_13347 ?auto_13348 ?auto_13349 ?auto_13350 ?auto_13351 ?auto_13352 ?auto_13355 ?auto_13354 ?auto_13353 ?auto_13356 ?auto_13358 ?auto_13357 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13385 - SURFACE
      ?auto_13386 - SURFACE
    )
    :vars
    (
      ?auto_13387 - HOIST
      ?auto_13388 - PLACE
      ?auto_13390 - PLACE
      ?auto_13391 - HOIST
      ?auto_13392 - SURFACE
      ?auto_13389 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13387 ?auto_13388 ) ( SURFACE-AT ?auto_13385 ?auto_13388 ) ( CLEAR ?auto_13385 ) ( IS-CRATE ?auto_13386 ) ( AVAILABLE ?auto_13387 ) ( not ( = ?auto_13390 ?auto_13388 ) ) ( HOIST-AT ?auto_13391 ?auto_13390 ) ( AVAILABLE ?auto_13391 ) ( SURFACE-AT ?auto_13386 ?auto_13390 ) ( ON ?auto_13386 ?auto_13392 ) ( CLEAR ?auto_13386 ) ( TRUCK-AT ?auto_13389 ?auto_13388 ) ( not ( = ?auto_13385 ?auto_13386 ) ) ( not ( = ?auto_13385 ?auto_13392 ) ) ( not ( = ?auto_13386 ?auto_13392 ) ) ( not ( = ?auto_13387 ?auto_13391 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13389 ?auto_13388 ?auto_13390 )
      ( !LIFT ?auto_13391 ?auto_13386 ?auto_13392 ?auto_13390 )
      ( !LOAD ?auto_13391 ?auto_13386 ?auto_13389 ?auto_13390 )
      ( !DRIVE ?auto_13389 ?auto_13390 ?auto_13388 )
      ( !UNLOAD ?auto_13387 ?auto_13386 ?auto_13389 ?auto_13388 )
      ( !DROP ?auto_13387 ?auto_13386 ?auto_13385 ?auto_13388 )
      ( MAKE-1CRATE-VERIFY ?auto_13385 ?auto_13386 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_13406 - SURFACE
      ?auto_13407 - SURFACE
      ?auto_13408 - SURFACE
      ?auto_13409 - SURFACE
      ?auto_13410 - SURFACE
      ?auto_13411 - SURFACE
      ?auto_13414 - SURFACE
      ?auto_13413 - SURFACE
      ?auto_13412 - SURFACE
      ?auto_13415 - SURFACE
      ?auto_13417 - SURFACE
      ?auto_13416 - SURFACE
      ?auto_13418 - SURFACE
    )
    :vars
    (
      ?auto_13421 - HOIST
      ?auto_13424 - PLACE
      ?auto_13423 - PLACE
      ?auto_13419 - HOIST
      ?auto_13422 - SURFACE
      ?auto_13428 - PLACE
      ?auto_13443 - HOIST
      ?auto_13440 - SURFACE
      ?auto_13434 - PLACE
      ?auto_13438 - HOIST
      ?auto_13426 - SURFACE
      ?auto_13437 - PLACE
      ?auto_13441 - HOIST
      ?auto_13429 - SURFACE
      ?auto_13425 - SURFACE
      ?auto_13432 - SURFACE
      ?auto_13433 - SURFACE
      ?auto_13430 - SURFACE
      ?auto_13442 - PLACE
      ?auto_13439 - HOIST
      ?auto_13436 - SURFACE
      ?auto_13427 - SURFACE
      ?auto_13435 - SURFACE
      ?auto_13431 - SURFACE
      ?auto_13420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13421 ?auto_13424 ) ( IS-CRATE ?auto_13418 ) ( not ( = ?auto_13423 ?auto_13424 ) ) ( HOIST-AT ?auto_13419 ?auto_13423 ) ( SURFACE-AT ?auto_13418 ?auto_13423 ) ( ON ?auto_13418 ?auto_13422 ) ( CLEAR ?auto_13418 ) ( not ( = ?auto_13416 ?auto_13418 ) ) ( not ( = ?auto_13416 ?auto_13422 ) ) ( not ( = ?auto_13418 ?auto_13422 ) ) ( not ( = ?auto_13421 ?auto_13419 ) ) ( IS-CRATE ?auto_13416 ) ( not ( = ?auto_13428 ?auto_13424 ) ) ( HOIST-AT ?auto_13443 ?auto_13428 ) ( SURFACE-AT ?auto_13416 ?auto_13428 ) ( ON ?auto_13416 ?auto_13440 ) ( CLEAR ?auto_13416 ) ( not ( = ?auto_13417 ?auto_13416 ) ) ( not ( = ?auto_13417 ?auto_13440 ) ) ( not ( = ?auto_13416 ?auto_13440 ) ) ( not ( = ?auto_13421 ?auto_13443 ) ) ( IS-CRATE ?auto_13417 ) ( not ( = ?auto_13434 ?auto_13424 ) ) ( HOIST-AT ?auto_13438 ?auto_13434 ) ( AVAILABLE ?auto_13438 ) ( SURFACE-AT ?auto_13417 ?auto_13434 ) ( ON ?auto_13417 ?auto_13426 ) ( CLEAR ?auto_13417 ) ( not ( = ?auto_13415 ?auto_13417 ) ) ( not ( = ?auto_13415 ?auto_13426 ) ) ( not ( = ?auto_13417 ?auto_13426 ) ) ( not ( = ?auto_13421 ?auto_13438 ) ) ( IS-CRATE ?auto_13415 ) ( not ( = ?auto_13437 ?auto_13424 ) ) ( HOIST-AT ?auto_13441 ?auto_13437 ) ( SURFACE-AT ?auto_13415 ?auto_13437 ) ( ON ?auto_13415 ?auto_13429 ) ( CLEAR ?auto_13415 ) ( not ( = ?auto_13412 ?auto_13415 ) ) ( not ( = ?auto_13412 ?auto_13429 ) ) ( not ( = ?auto_13415 ?auto_13429 ) ) ( not ( = ?auto_13421 ?auto_13441 ) ) ( IS-CRATE ?auto_13412 ) ( SURFACE-AT ?auto_13412 ?auto_13428 ) ( ON ?auto_13412 ?auto_13425 ) ( CLEAR ?auto_13412 ) ( not ( = ?auto_13413 ?auto_13412 ) ) ( not ( = ?auto_13413 ?auto_13425 ) ) ( not ( = ?auto_13412 ?auto_13425 ) ) ( IS-CRATE ?auto_13413 ) ( SURFACE-AT ?auto_13413 ?auto_13437 ) ( ON ?auto_13413 ?auto_13432 ) ( CLEAR ?auto_13413 ) ( not ( = ?auto_13414 ?auto_13413 ) ) ( not ( = ?auto_13414 ?auto_13432 ) ) ( not ( = ?auto_13413 ?auto_13432 ) ) ( IS-CRATE ?auto_13414 ) ( SURFACE-AT ?auto_13414 ?auto_13423 ) ( ON ?auto_13414 ?auto_13433 ) ( CLEAR ?auto_13414 ) ( not ( = ?auto_13411 ?auto_13414 ) ) ( not ( = ?auto_13411 ?auto_13433 ) ) ( not ( = ?auto_13414 ?auto_13433 ) ) ( IS-CRATE ?auto_13411 ) ( AVAILABLE ?auto_13443 ) ( SURFACE-AT ?auto_13411 ?auto_13428 ) ( ON ?auto_13411 ?auto_13430 ) ( CLEAR ?auto_13411 ) ( not ( = ?auto_13410 ?auto_13411 ) ) ( not ( = ?auto_13410 ?auto_13430 ) ) ( not ( = ?auto_13411 ?auto_13430 ) ) ( IS-CRATE ?auto_13410 ) ( not ( = ?auto_13442 ?auto_13424 ) ) ( HOIST-AT ?auto_13439 ?auto_13442 ) ( AVAILABLE ?auto_13439 ) ( SURFACE-AT ?auto_13410 ?auto_13442 ) ( ON ?auto_13410 ?auto_13436 ) ( CLEAR ?auto_13410 ) ( not ( = ?auto_13409 ?auto_13410 ) ) ( not ( = ?auto_13409 ?auto_13436 ) ) ( not ( = ?auto_13410 ?auto_13436 ) ) ( not ( = ?auto_13421 ?auto_13439 ) ) ( IS-CRATE ?auto_13409 ) ( SURFACE-AT ?auto_13409 ?auto_13437 ) ( ON ?auto_13409 ?auto_13427 ) ( CLEAR ?auto_13409 ) ( not ( = ?auto_13408 ?auto_13409 ) ) ( not ( = ?auto_13408 ?auto_13427 ) ) ( not ( = ?auto_13409 ?auto_13427 ) ) ( IS-CRATE ?auto_13408 ) ( AVAILABLE ?auto_13419 ) ( SURFACE-AT ?auto_13408 ?auto_13423 ) ( ON ?auto_13408 ?auto_13435 ) ( CLEAR ?auto_13408 ) ( not ( = ?auto_13407 ?auto_13408 ) ) ( not ( = ?auto_13407 ?auto_13435 ) ) ( not ( = ?auto_13408 ?auto_13435 ) ) ( SURFACE-AT ?auto_13406 ?auto_13424 ) ( CLEAR ?auto_13406 ) ( IS-CRATE ?auto_13407 ) ( AVAILABLE ?auto_13421 ) ( AVAILABLE ?auto_13441 ) ( SURFACE-AT ?auto_13407 ?auto_13437 ) ( ON ?auto_13407 ?auto_13431 ) ( CLEAR ?auto_13407 ) ( TRUCK-AT ?auto_13420 ?auto_13424 ) ( not ( = ?auto_13406 ?auto_13407 ) ) ( not ( = ?auto_13406 ?auto_13431 ) ) ( not ( = ?auto_13407 ?auto_13431 ) ) ( not ( = ?auto_13406 ?auto_13408 ) ) ( not ( = ?auto_13406 ?auto_13435 ) ) ( not ( = ?auto_13408 ?auto_13431 ) ) ( not ( = ?auto_13423 ?auto_13437 ) ) ( not ( = ?auto_13419 ?auto_13441 ) ) ( not ( = ?auto_13435 ?auto_13431 ) ) ( not ( = ?auto_13406 ?auto_13409 ) ) ( not ( = ?auto_13406 ?auto_13427 ) ) ( not ( = ?auto_13407 ?auto_13409 ) ) ( not ( = ?auto_13407 ?auto_13427 ) ) ( not ( = ?auto_13409 ?auto_13435 ) ) ( not ( = ?auto_13409 ?auto_13431 ) ) ( not ( = ?auto_13427 ?auto_13435 ) ) ( not ( = ?auto_13427 ?auto_13431 ) ) ( not ( = ?auto_13406 ?auto_13410 ) ) ( not ( = ?auto_13406 ?auto_13436 ) ) ( not ( = ?auto_13407 ?auto_13410 ) ) ( not ( = ?auto_13407 ?auto_13436 ) ) ( not ( = ?auto_13408 ?auto_13410 ) ) ( not ( = ?auto_13408 ?auto_13436 ) ) ( not ( = ?auto_13410 ?auto_13427 ) ) ( not ( = ?auto_13410 ?auto_13435 ) ) ( not ( = ?auto_13410 ?auto_13431 ) ) ( not ( = ?auto_13442 ?auto_13437 ) ) ( not ( = ?auto_13442 ?auto_13423 ) ) ( not ( = ?auto_13439 ?auto_13441 ) ) ( not ( = ?auto_13439 ?auto_13419 ) ) ( not ( = ?auto_13436 ?auto_13427 ) ) ( not ( = ?auto_13436 ?auto_13435 ) ) ( not ( = ?auto_13436 ?auto_13431 ) ) ( not ( = ?auto_13406 ?auto_13411 ) ) ( not ( = ?auto_13406 ?auto_13430 ) ) ( not ( = ?auto_13407 ?auto_13411 ) ) ( not ( = ?auto_13407 ?auto_13430 ) ) ( not ( = ?auto_13408 ?auto_13411 ) ) ( not ( = ?auto_13408 ?auto_13430 ) ) ( not ( = ?auto_13409 ?auto_13411 ) ) ( not ( = ?auto_13409 ?auto_13430 ) ) ( not ( = ?auto_13411 ?auto_13436 ) ) ( not ( = ?auto_13411 ?auto_13427 ) ) ( not ( = ?auto_13411 ?auto_13435 ) ) ( not ( = ?auto_13411 ?auto_13431 ) ) ( not ( = ?auto_13428 ?auto_13442 ) ) ( not ( = ?auto_13428 ?auto_13437 ) ) ( not ( = ?auto_13428 ?auto_13423 ) ) ( not ( = ?auto_13443 ?auto_13439 ) ) ( not ( = ?auto_13443 ?auto_13441 ) ) ( not ( = ?auto_13443 ?auto_13419 ) ) ( not ( = ?auto_13430 ?auto_13436 ) ) ( not ( = ?auto_13430 ?auto_13427 ) ) ( not ( = ?auto_13430 ?auto_13435 ) ) ( not ( = ?auto_13430 ?auto_13431 ) ) ( not ( = ?auto_13406 ?auto_13414 ) ) ( not ( = ?auto_13406 ?auto_13433 ) ) ( not ( = ?auto_13407 ?auto_13414 ) ) ( not ( = ?auto_13407 ?auto_13433 ) ) ( not ( = ?auto_13408 ?auto_13414 ) ) ( not ( = ?auto_13408 ?auto_13433 ) ) ( not ( = ?auto_13409 ?auto_13414 ) ) ( not ( = ?auto_13409 ?auto_13433 ) ) ( not ( = ?auto_13410 ?auto_13414 ) ) ( not ( = ?auto_13410 ?auto_13433 ) ) ( not ( = ?auto_13414 ?auto_13430 ) ) ( not ( = ?auto_13414 ?auto_13436 ) ) ( not ( = ?auto_13414 ?auto_13427 ) ) ( not ( = ?auto_13414 ?auto_13435 ) ) ( not ( = ?auto_13414 ?auto_13431 ) ) ( not ( = ?auto_13433 ?auto_13430 ) ) ( not ( = ?auto_13433 ?auto_13436 ) ) ( not ( = ?auto_13433 ?auto_13427 ) ) ( not ( = ?auto_13433 ?auto_13435 ) ) ( not ( = ?auto_13433 ?auto_13431 ) ) ( not ( = ?auto_13406 ?auto_13413 ) ) ( not ( = ?auto_13406 ?auto_13432 ) ) ( not ( = ?auto_13407 ?auto_13413 ) ) ( not ( = ?auto_13407 ?auto_13432 ) ) ( not ( = ?auto_13408 ?auto_13413 ) ) ( not ( = ?auto_13408 ?auto_13432 ) ) ( not ( = ?auto_13409 ?auto_13413 ) ) ( not ( = ?auto_13409 ?auto_13432 ) ) ( not ( = ?auto_13410 ?auto_13413 ) ) ( not ( = ?auto_13410 ?auto_13432 ) ) ( not ( = ?auto_13411 ?auto_13413 ) ) ( not ( = ?auto_13411 ?auto_13432 ) ) ( not ( = ?auto_13413 ?auto_13433 ) ) ( not ( = ?auto_13413 ?auto_13430 ) ) ( not ( = ?auto_13413 ?auto_13436 ) ) ( not ( = ?auto_13413 ?auto_13427 ) ) ( not ( = ?auto_13413 ?auto_13435 ) ) ( not ( = ?auto_13413 ?auto_13431 ) ) ( not ( = ?auto_13432 ?auto_13433 ) ) ( not ( = ?auto_13432 ?auto_13430 ) ) ( not ( = ?auto_13432 ?auto_13436 ) ) ( not ( = ?auto_13432 ?auto_13427 ) ) ( not ( = ?auto_13432 ?auto_13435 ) ) ( not ( = ?auto_13432 ?auto_13431 ) ) ( not ( = ?auto_13406 ?auto_13412 ) ) ( not ( = ?auto_13406 ?auto_13425 ) ) ( not ( = ?auto_13407 ?auto_13412 ) ) ( not ( = ?auto_13407 ?auto_13425 ) ) ( not ( = ?auto_13408 ?auto_13412 ) ) ( not ( = ?auto_13408 ?auto_13425 ) ) ( not ( = ?auto_13409 ?auto_13412 ) ) ( not ( = ?auto_13409 ?auto_13425 ) ) ( not ( = ?auto_13410 ?auto_13412 ) ) ( not ( = ?auto_13410 ?auto_13425 ) ) ( not ( = ?auto_13411 ?auto_13412 ) ) ( not ( = ?auto_13411 ?auto_13425 ) ) ( not ( = ?auto_13414 ?auto_13412 ) ) ( not ( = ?auto_13414 ?auto_13425 ) ) ( not ( = ?auto_13412 ?auto_13432 ) ) ( not ( = ?auto_13412 ?auto_13433 ) ) ( not ( = ?auto_13412 ?auto_13430 ) ) ( not ( = ?auto_13412 ?auto_13436 ) ) ( not ( = ?auto_13412 ?auto_13427 ) ) ( not ( = ?auto_13412 ?auto_13435 ) ) ( not ( = ?auto_13412 ?auto_13431 ) ) ( not ( = ?auto_13425 ?auto_13432 ) ) ( not ( = ?auto_13425 ?auto_13433 ) ) ( not ( = ?auto_13425 ?auto_13430 ) ) ( not ( = ?auto_13425 ?auto_13436 ) ) ( not ( = ?auto_13425 ?auto_13427 ) ) ( not ( = ?auto_13425 ?auto_13435 ) ) ( not ( = ?auto_13425 ?auto_13431 ) ) ( not ( = ?auto_13406 ?auto_13415 ) ) ( not ( = ?auto_13406 ?auto_13429 ) ) ( not ( = ?auto_13407 ?auto_13415 ) ) ( not ( = ?auto_13407 ?auto_13429 ) ) ( not ( = ?auto_13408 ?auto_13415 ) ) ( not ( = ?auto_13408 ?auto_13429 ) ) ( not ( = ?auto_13409 ?auto_13415 ) ) ( not ( = ?auto_13409 ?auto_13429 ) ) ( not ( = ?auto_13410 ?auto_13415 ) ) ( not ( = ?auto_13410 ?auto_13429 ) ) ( not ( = ?auto_13411 ?auto_13415 ) ) ( not ( = ?auto_13411 ?auto_13429 ) ) ( not ( = ?auto_13414 ?auto_13415 ) ) ( not ( = ?auto_13414 ?auto_13429 ) ) ( not ( = ?auto_13413 ?auto_13415 ) ) ( not ( = ?auto_13413 ?auto_13429 ) ) ( not ( = ?auto_13415 ?auto_13425 ) ) ( not ( = ?auto_13415 ?auto_13432 ) ) ( not ( = ?auto_13415 ?auto_13433 ) ) ( not ( = ?auto_13415 ?auto_13430 ) ) ( not ( = ?auto_13415 ?auto_13436 ) ) ( not ( = ?auto_13415 ?auto_13427 ) ) ( not ( = ?auto_13415 ?auto_13435 ) ) ( not ( = ?auto_13415 ?auto_13431 ) ) ( not ( = ?auto_13429 ?auto_13425 ) ) ( not ( = ?auto_13429 ?auto_13432 ) ) ( not ( = ?auto_13429 ?auto_13433 ) ) ( not ( = ?auto_13429 ?auto_13430 ) ) ( not ( = ?auto_13429 ?auto_13436 ) ) ( not ( = ?auto_13429 ?auto_13427 ) ) ( not ( = ?auto_13429 ?auto_13435 ) ) ( not ( = ?auto_13429 ?auto_13431 ) ) ( not ( = ?auto_13406 ?auto_13417 ) ) ( not ( = ?auto_13406 ?auto_13426 ) ) ( not ( = ?auto_13407 ?auto_13417 ) ) ( not ( = ?auto_13407 ?auto_13426 ) ) ( not ( = ?auto_13408 ?auto_13417 ) ) ( not ( = ?auto_13408 ?auto_13426 ) ) ( not ( = ?auto_13409 ?auto_13417 ) ) ( not ( = ?auto_13409 ?auto_13426 ) ) ( not ( = ?auto_13410 ?auto_13417 ) ) ( not ( = ?auto_13410 ?auto_13426 ) ) ( not ( = ?auto_13411 ?auto_13417 ) ) ( not ( = ?auto_13411 ?auto_13426 ) ) ( not ( = ?auto_13414 ?auto_13417 ) ) ( not ( = ?auto_13414 ?auto_13426 ) ) ( not ( = ?auto_13413 ?auto_13417 ) ) ( not ( = ?auto_13413 ?auto_13426 ) ) ( not ( = ?auto_13412 ?auto_13417 ) ) ( not ( = ?auto_13412 ?auto_13426 ) ) ( not ( = ?auto_13417 ?auto_13429 ) ) ( not ( = ?auto_13417 ?auto_13425 ) ) ( not ( = ?auto_13417 ?auto_13432 ) ) ( not ( = ?auto_13417 ?auto_13433 ) ) ( not ( = ?auto_13417 ?auto_13430 ) ) ( not ( = ?auto_13417 ?auto_13436 ) ) ( not ( = ?auto_13417 ?auto_13427 ) ) ( not ( = ?auto_13417 ?auto_13435 ) ) ( not ( = ?auto_13417 ?auto_13431 ) ) ( not ( = ?auto_13434 ?auto_13437 ) ) ( not ( = ?auto_13434 ?auto_13428 ) ) ( not ( = ?auto_13434 ?auto_13423 ) ) ( not ( = ?auto_13434 ?auto_13442 ) ) ( not ( = ?auto_13438 ?auto_13441 ) ) ( not ( = ?auto_13438 ?auto_13443 ) ) ( not ( = ?auto_13438 ?auto_13419 ) ) ( not ( = ?auto_13438 ?auto_13439 ) ) ( not ( = ?auto_13426 ?auto_13429 ) ) ( not ( = ?auto_13426 ?auto_13425 ) ) ( not ( = ?auto_13426 ?auto_13432 ) ) ( not ( = ?auto_13426 ?auto_13433 ) ) ( not ( = ?auto_13426 ?auto_13430 ) ) ( not ( = ?auto_13426 ?auto_13436 ) ) ( not ( = ?auto_13426 ?auto_13427 ) ) ( not ( = ?auto_13426 ?auto_13435 ) ) ( not ( = ?auto_13426 ?auto_13431 ) ) ( not ( = ?auto_13406 ?auto_13416 ) ) ( not ( = ?auto_13406 ?auto_13440 ) ) ( not ( = ?auto_13407 ?auto_13416 ) ) ( not ( = ?auto_13407 ?auto_13440 ) ) ( not ( = ?auto_13408 ?auto_13416 ) ) ( not ( = ?auto_13408 ?auto_13440 ) ) ( not ( = ?auto_13409 ?auto_13416 ) ) ( not ( = ?auto_13409 ?auto_13440 ) ) ( not ( = ?auto_13410 ?auto_13416 ) ) ( not ( = ?auto_13410 ?auto_13440 ) ) ( not ( = ?auto_13411 ?auto_13416 ) ) ( not ( = ?auto_13411 ?auto_13440 ) ) ( not ( = ?auto_13414 ?auto_13416 ) ) ( not ( = ?auto_13414 ?auto_13440 ) ) ( not ( = ?auto_13413 ?auto_13416 ) ) ( not ( = ?auto_13413 ?auto_13440 ) ) ( not ( = ?auto_13412 ?auto_13416 ) ) ( not ( = ?auto_13412 ?auto_13440 ) ) ( not ( = ?auto_13415 ?auto_13416 ) ) ( not ( = ?auto_13415 ?auto_13440 ) ) ( not ( = ?auto_13416 ?auto_13426 ) ) ( not ( = ?auto_13416 ?auto_13429 ) ) ( not ( = ?auto_13416 ?auto_13425 ) ) ( not ( = ?auto_13416 ?auto_13432 ) ) ( not ( = ?auto_13416 ?auto_13433 ) ) ( not ( = ?auto_13416 ?auto_13430 ) ) ( not ( = ?auto_13416 ?auto_13436 ) ) ( not ( = ?auto_13416 ?auto_13427 ) ) ( not ( = ?auto_13416 ?auto_13435 ) ) ( not ( = ?auto_13416 ?auto_13431 ) ) ( not ( = ?auto_13440 ?auto_13426 ) ) ( not ( = ?auto_13440 ?auto_13429 ) ) ( not ( = ?auto_13440 ?auto_13425 ) ) ( not ( = ?auto_13440 ?auto_13432 ) ) ( not ( = ?auto_13440 ?auto_13433 ) ) ( not ( = ?auto_13440 ?auto_13430 ) ) ( not ( = ?auto_13440 ?auto_13436 ) ) ( not ( = ?auto_13440 ?auto_13427 ) ) ( not ( = ?auto_13440 ?auto_13435 ) ) ( not ( = ?auto_13440 ?auto_13431 ) ) ( not ( = ?auto_13406 ?auto_13418 ) ) ( not ( = ?auto_13406 ?auto_13422 ) ) ( not ( = ?auto_13407 ?auto_13418 ) ) ( not ( = ?auto_13407 ?auto_13422 ) ) ( not ( = ?auto_13408 ?auto_13418 ) ) ( not ( = ?auto_13408 ?auto_13422 ) ) ( not ( = ?auto_13409 ?auto_13418 ) ) ( not ( = ?auto_13409 ?auto_13422 ) ) ( not ( = ?auto_13410 ?auto_13418 ) ) ( not ( = ?auto_13410 ?auto_13422 ) ) ( not ( = ?auto_13411 ?auto_13418 ) ) ( not ( = ?auto_13411 ?auto_13422 ) ) ( not ( = ?auto_13414 ?auto_13418 ) ) ( not ( = ?auto_13414 ?auto_13422 ) ) ( not ( = ?auto_13413 ?auto_13418 ) ) ( not ( = ?auto_13413 ?auto_13422 ) ) ( not ( = ?auto_13412 ?auto_13418 ) ) ( not ( = ?auto_13412 ?auto_13422 ) ) ( not ( = ?auto_13415 ?auto_13418 ) ) ( not ( = ?auto_13415 ?auto_13422 ) ) ( not ( = ?auto_13417 ?auto_13418 ) ) ( not ( = ?auto_13417 ?auto_13422 ) ) ( not ( = ?auto_13418 ?auto_13440 ) ) ( not ( = ?auto_13418 ?auto_13426 ) ) ( not ( = ?auto_13418 ?auto_13429 ) ) ( not ( = ?auto_13418 ?auto_13425 ) ) ( not ( = ?auto_13418 ?auto_13432 ) ) ( not ( = ?auto_13418 ?auto_13433 ) ) ( not ( = ?auto_13418 ?auto_13430 ) ) ( not ( = ?auto_13418 ?auto_13436 ) ) ( not ( = ?auto_13418 ?auto_13427 ) ) ( not ( = ?auto_13418 ?auto_13435 ) ) ( not ( = ?auto_13418 ?auto_13431 ) ) ( not ( = ?auto_13422 ?auto_13440 ) ) ( not ( = ?auto_13422 ?auto_13426 ) ) ( not ( = ?auto_13422 ?auto_13429 ) ) ( not ( = ?auto_13422 ?auto_13425 ) ) ( not ( = ?auto_13422 ?auto_13432 ) ) ( not ( = ?auto_13422 ?auto_13433 ) ) ( not ( = ?auto_13422 ?auto_13430 ) ) ( not ( = ?auto_13422 ?auto_13436 ) ) ( not ( = ?auto_13422 ?auto_13427 ) ) ( not ( = ?auto_13422 ?auto_13435 ) ) ( not ( = ?auto_13422 ?auto_13431 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_13406 ?auto_13407 ?auto_13408 ?auto_13409 ?auto_13410 ?auto_13411 ?auto_13414 ?auto_13413 ?auto_13412 ?auto_13415 ?auto_13417 ?auto_13416 )
      ( MAKE-1CRATE ?auto_13416 ?auto_13418 )
      ( MAKE-12CRATE-VERIFY ?auto_13406 ?auto_13407 ?auto_13408 ?auto_13409 ?auto_13410 ?auto_13411 ?auto_13414 ?auto_13413 ?auto_13412 ?auto_13415 ?auto_13417 ?auto_13416 ?auto_13418 ) )
  )

)

