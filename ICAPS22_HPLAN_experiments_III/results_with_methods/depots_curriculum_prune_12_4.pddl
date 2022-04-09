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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12977 - SURFACE
      ?auto_12978 - SURFACE
      ?auto_12979 - SURFACE
    )
    :vars
    (
      ?auto_12984 - HOIST
      ?auto_12985 - PLACE
      ?auto_12981 - PLACE
      ?auto_12980 - HOIST
      ?auto_12982 - SURFACE
      ?auto_12988 - PLACE
      ?auto_12987 - HOIST
      ?auto_12986 - SURFACE
      ?auto_12983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12984 ?auto_12985 ) ( IS-CRATE ?auto_12979 ) ( not ( = ?auto_12981 ?auto_12985 ) ) ( HOIST-AT ?auto_12980 ?auto_12981 ) ( AVAILABLE ?auto_12980 ) ( SURFACE-AT ?auto_12979 ?auto_12981 ) ( ON ?auto_12979 ?auto_12982 ) ( CLEAR ?auto_12979 ) ( not ( = ?auto_12978 ?auto_12979 ) ) ( not ( = ?auto_12978 ?auto_12982 ) ) ( not ( = ?auto_12979 ?auto_12982 ) ) ( not ( = ?auto_12984 ?auto_12980 ) ) ( SURFACE-AT ?auto_12977 ?auto_12985 ) ( CLEAR ?auto_12977 ) ( IS-CRATE ?auto_12978 ) ( AVAILABLE ?auto_12984 ) ( not ( = ?auto_12988 ?auto_12985 ) ) ( HOIST-AT ?auto_12987 ?auto_12988 ) ( AVAILABLE ?auto_12987 ) ( SURFACE-AT ?auto_12978 ?auto_12988 ) ( ON ?auto_12978 ?auto_12986 ) ( CLEAR ?auto_12978 ) ( TRUCK-AT ?auto_12983 ?auto_12985 ) ( not ( = ?auto_12977 ?auto_12978 ) ) ( not ( = ?auto_12977 ?auto_12986 ) ) ( not ( = ?auto_12978 ?auto_12986 ) ) ( not ( = ?auto_12984 ?auto_12987 ) ) ( not ( = ?auto_12977 ?auto_12979 ) ) ( not ( = ?auto_12977 ?auto_12982 ) ) ( not ( = ?auto_12979 ?auto_12986 ) ) ( not ( = ?auto_12981 ?auto_12988 ) ) ( not ( = ?auto_12980 ?auto_12987 ) ) ( not ( = ?auto_12982 ?auto_12986 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12977 ?auto_12978 )
      ( MAKE-1CRATE ?auto_12978 ?auto_12979 )
      ( MAKE-2CRATE-VERIFY ?auto_12977 ?auto_12978 ?auto_12979 ) )
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
      ?auto_13012 - HOIST
      ?auto_13011 - PLACE
      ?auto_13007 - PLACE
      ?auto_13009 - HOIST
      ?auto_13008 - SURFACE
      ?auto_13015 - PLACE
      ?auto_13014 - HOIST
      ?auto_13013 - SURFACE
      ?auto_13016 - SURFACE
      ?auto_13010 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13012 ?auto_13011 ) ( IS-CRATE ?auto_13006 ) ( not ( = ?auto_13007 ?auto_13011 ) ) ( HOIST-AT ?auto_13009 ?auto_13007 ) ( SURFACE-AT ?auto_13006 ?auto_13007 ) ( ON ?auto_13006 ?auto_13008 ) ( CLEAR ?auto_13006 ) ( not ( = ?auto_13005 ?auto_13006 ) ) ( not ( = ?auto_13005 ?auto_13008 ) ) ( not ( = ?auto_13006 ?auto_13008 ) ) ( not ( = ?auto_13012 ?auto_13009 ) ) ( IS-CRATE ?auto_13005 ) ( not ( = ?auto_13015 ?auto_13011 ) ) ( HOIST-AT ?auto_13014 ?auto_13015 ) ( AVAILABLE ?auto_13014 ) ( SURFACE-AT ?auto_13005 ?auto_13015 ) ( ON ?auto_13005 ?auto_13013 ) ( CLEAR ?auto_13005 ) ( not ( = ?auto_13004 ?auto_13005 ) ) ( not ( = ?auto_13004 ?auto_13013 ) ) ( not ( = ?auto_13005 ?auto_13013 ) ) ( not ( = ?auto_13012 ?auto_13014 ) ) ( SURFACE-AT ?auto_13003 ?auto_13011 ) ( CLEAR ?auto_13003 ) ( IS-CRATE ?auto_13004 ) ( AVAILABLE ?auto_13012 ) ( AVAILABLE ?auto_13009 ) ( SURFACE-AT ?auto_13004 ?auto_13007 ) ( ON ?auto_13004 ?auto_13016 ) ( CLEAR ?auto_13004 ) ( TRUCK-AT ?auto_13010 ?auto_13011 ) ( not ( = ?auto_13003 ?auto_13004 ) ) ( not ( = ?auto_13003 ?auto_13016 ) ) ( not ( = ?auto_13004 ?auto_13016 ) ) ( not ( = ?auto_13003 ?auto_13005 ) ) ( not ( = ?auto_13003 ?auto_13013 ) ) ( not ( = ?auto_13005 ?auto_13016 ) ) ( not ( = ?auto_13015 ?auto_13007 ) ) ( not ( = ?auto_13014 ?auto_13009 ) ) ( not ( = ?auto_13013 ?auto_13016 ) ) ( not ( = ?auto_13003 ?auto_13006 ) ) ( not ( = ?auto_13003 ?auto_13008 ) ) ( not ( = ?auto_13004 ?auto_13006 ) ) ( not ( = ?auto_13004 ?auto_13008 ) ) ( not ( = ?auto_13006 ?auto_13013 ) ) ( not ( = ?auto_13006 ?auto_13016 ) ) ( not ( = ?auto_13008 ?auto_13013 ) ) ( not ( = ?auto_13008 ?auto_13016 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13003 ?auto_13004 ?auto_13005 )
      ( MAKE-1CRATE ?auto_13005 ?auto_13006 )
      ( MAKE-3CRATE-VERIFY ?auto_13003 ?auto_13004 ?auto_13005 ?auto_13006 ) )
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
      ?auto_13040 - HOIST
      ?auto_13039 - PLACE
      ?auto_13038 - PLACE
      ?auto_13037 - HOIST
      ?auto_13041 - SURFACE
      ?auto_13046 - PLACE
      ?auto_13048 - HOIST
      ?auto_13047 - SURFACE
      ?auto_13045 - PLACE
      ?auto_13044 - HOIST
      ?auto_13049 - SURFACE
      ?auto_13043 - SURFACE
      ?auto_13042 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13040 ?auto_13039 ) ( IS-CRATE ?auto_13036 ) ( not ( = ?auto_13038 ?auto_13039 ) ) ( HOIST-AT ?auto_13037 ?auto_13038 ) ( AVAILABLE ?auto_13037 ) ( SURFACE-AT ?auto_13036 ?auto_13038 ) ( ON ?auto_13036 ?auto_13041 ) ( CLEAR ?auto_13036 ) ( not ( = ?auto_13035 ?auto_13036 ) ) ( not ( = ?auto_13035 ?auto_13041 ) ) ( not ( = ?auto_13036 ?auto_13041 ) ) ( not ( = ?auto_13040 ?auto_13037 ) ) ( IS-CRATE ?auto_13035 ) ( not ( = ?auto_13046 ?auto_13039 ) ) ( HOIST-AT ?auto_13048 ?auto_13046 ) ( SURFACE-AT ?auto_13035 ?auto_13046 ) ( ON ?auto_13035 ?auto_13047 ) ( CLEAR ?auto_13035 ) ( not ( = ?auto_13034 ?auto_13035 ) ) ( not ( = ?auto_13034 ?auto_13047 ) ) ( not ( = ?auto_13035 ?auto_13047 ) ) ( not ( = ?auto_13040 ?auto_13048 ) ) ( IS-CRATE ?auto_13034 ) ( not ( = ?auto_13045 ?auto_13039 ) ) ( HOIST-AT ?auto_13044 ?auto_13045 ) ( AVAILABLE ?auto_13044 ) ( SURFACE-AT ?auto_13034 ?auto_13045 ) ( ON ?auto_13034 ?auto_13049 ) ( CLEAR ?auto_13034 ) ( not ( = ?auto_13033 ?auto_13034 ) ) ( not ( = ?auto_13033 ?auto_13049 ) ) ( not ( = ?auto_13034 ?auto_13049 ) ) ( not ( = ?auto_13040 ?auto_13044 ) ) ( SURFACE-AT ?auto_13032 ?auto_13039 ) ( CLEAR ?auto_13032 ) ( IS-CRATE ?auto_13033 ) ( AVAILABLE ?auto_13040 ) ( AVAILABLE ?auto_13048 ) ( SURFACE-AT ?auto_13033 ?auto_13046 ) ( ON ?auto_13033 ?auto_13043 ) ( CLEAR ?auto_13033 ) ( TRUCK-AT ?auto_13042 ?auto_13039 ) ( not ( = ?auto_13032 ?auto_13033 ) ) ( not ( = ?auto_13032 ?auto_13043 ) ) ( not ( = ?auto_13033 ?auto_13043 ) ) ( not ( = ?auto_13032 ?auto_13034 ) ) ( not ( = ?auto_13032 ?auto_13049 ) ) ( not ( = ?auto_13034 ?auto_13043 ) ) ( not ( = ?auto_13045 ?auto_13046 ) ) ( not ( = ?auto_13044 ?auto_13048 ) ) ( not ( = ?auto_13049 ?auto_13043 ) ) ( not ( = ?auto_13032 ?auto_13035 ) ) ( not ( = ?auto_13032 ?auto_13047 ) ) ( not ( = ?auto_13033 ?auto_13035 ) ) ( not ( = ?auto_13033 ?auto_13047 ) ) ( not ( = ?auto_13035 ?auto_13049 ) ) ( not ( = ?auto_13035 ?auto_13043 ) ) ( not ( = ?auto_13047 ?auto_13049 ) ) ( not ( = ?auto_13047 ?auto_13043 ) ) ( not ( = ?auto_13032 ?auto_13036 ) ) ( not ( = ?auto_13032 ?auto_13041 ) ) ( not ( = ?auto_13033 ?auto_13036 ) ) ( not ( = ?auto_13033 ?auto_13041 ) ) ( not ( = ?auto_13034 ?auto_13036 ) ) ( not ( = ?auto_13034 ?auto_13041 ) ) ( not ( = ?auto_13036 ?auto_13047 ) ) ( not ( = ?auto_13036 ?auto_13049 ) ) ( not ( = ?auto_13036 ?auto_13043 ) ) ( not ( = ?auto_13038 ?auto_13046 ) ) ( not ( = ?auto_13038 ?auto_13045 ) ) ( not ( = ?auto_13037 ?auto_13048 ) ) ( not ( = ?auto_13037 ?auto_13044 ) ) ( not ( = ?auto_13041 ?auto_13047 ) ) ( not ( = ?auto_13041 ?auto_13049 ) ) ( not ( = ?auto_13041 ?auto_13043 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_13032 ?auto_13033 ?auto_13034 ?auto_13035 )
      ( MAKE-1CRATE ?auto_13035 ?auto_13036 )
      ( MAKE-4CRATE-VERIFY ?auto_13032 ?auto_13033 ?auto_13034 ?auto_13035 ?auto_13036 ) )
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
      ?auto_13076 - HOIST
      ?auto_13075 - PLACE
      ?auto_13077 - PLACE
      ?auto_13073 - HOIST
      ?auto_13074 - SURFACE
      ?auto_13086 - PLACE
      ?auto_13082 - HOIST
      ?auto_13081 - SURFACE
      ?auto_13079 - PLACE
      ?auto_13084 - HOIST
      ?auto_13080 - SURFACE
      ?auto_13087 - PLACE
      ?auto_13078 - HOIST
      ?auto_13085 - SURFACE
      ?auto_13083 - SURFACE
      ?auto_13072 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13076 ?auto_13075 ) ( IS-CRATE ?auto_13071 ) ( not ( = ?auto_13077 ?auto_13075 ) ) ( HOIST-AT ?auto_13073 ?auto_13077 ) ( AVAILABLE ?auto_13073 ) ( SURFACE-AT ?auto_13071 ?auto_13077 ) ( ON ?auto_13071 ?auto_13074 ) ( CLEAR ?auto_13071 ) ( not ( = ?auto_13070 ?auto_13071 ) ) ( not ( = ?auto_13070 ?auto_13074 ) ) ( not ( = ?auto_13071 ?auto_13074 ) ) ( not ( = ?auto_13076 ?auto_13073 ) ) ( IS-CRATE ?auto_13070 ) ( not ( = ?auto_13086 ?auto_13075 ) ) ( HOIST-AT ?auto_13082 ?auto_13086 ) ( AVAILABLE ?auto_13082 ) ( SURFACE-AT ?auto_13070 ?auto_13086 ) ( ON ?auto_13070 ?auto_13081 ) ( CLEAR ?auto_13070 ) ( not ( = ?auto_13069 ?auto_13070 ) ) ( not ( = ?auto_13069 ?auto_13081 ) ) ( not ( = ?auto_13070 ?auto_13081 ) ) ( not ( = ?auto_13076 ?auto_13082 ) ) ( IS-CRATE ?auto_13069 ) ( not ( = ?auto_13079 ?auto_13075 ) ) ( HOIST-AT ?auto_13084 ?auto_13079 ) ( SURFACE-AT ?auto_13069 ?auto_13079 ) ( ON ?auto_13069 ?auto_13080 ) ( CLEAR ?auto_13069 ) ( not ( = ?auto_13068 ?auto_13069 ) ) ( not ( = ?auto_13068 ?auto_13080 ) ) ( not ( = ?auto_13069 ?auto_13080 ) ) ( not ( = ?auto_13076 ?auto_13084 ) ) ( IS-CRATE ?auto_13068 ) ( not ( = ?auto_13087 ?auto_13075 ) ) ( HOIST-AT ?auto_13078 ?auto_13087 ) ( AVAILABLE ?auto_13078 ) ( SURFACE-AT ?auto_13068 ?auto_13087 ) ( ON ?auto_13068 ?auto_13085 ) ( CLEAR ?auto_13068 ) ( not ( = ?auto_13067 ?auto_13068 ) ) ( not ( = ?auto_13067 ?auto_13085 ) ) ( not ( = ?auto_13068 ?auto_13085 ) ) ( not ( = ?auto_13076 ?auto_13078 ) ) ( SURFACE-AT ?auto_13066 ?auto_13075 ) ( CLEAR ?auto_13066 ) ( IS-CRATE ?auto_13067 ) ( AVAILABLE ?auto_13076 ) ( AVAILABLE ?auto_13084 ) ( SURFACE-AT ?auto_13067 ?auto_13079 ) ( ON ?auto_13067 ?auto_13083 ) ( CLEAR ?auto_13067 ) ( TRUCK-AT ?auto_13072 ?auto_13075 ) ( not ( = ?auto_13066 ?auto_13067 ) ) ( not ( = ?auto_13066 ?auto_13083 ) ) ( not ( = ?auto_13067 ?auto_13083 ) ) ( not ( = ?auto_13066 ?auto_13068 ) ) ( not ( = ?auto_13066 ?auto_13085 ) ) ( not ( = ?auto_13068 ?auto_13083 ) ) ( not ( = ?auto_13087 ?auto_13079 ) ) ( not ( = ?auto_13078 ?auto_13084 ) ) ( not ( = ?auto_13085 ?auto_13083 ) ) ( not ( = ?auto_13066 ?auto_13069 ) ) ( not ( = ?auto_13066 ?auto_13080 ) ) ( not ( = ?auto_13067 ?auto_13069 ) ) ( not ( = ?auto_13067 ?auto_13080 ) ) ( not ( = ?auto_13069 ?auto_13085 ) ) ( not ( = ?auto_13069 ?auto_13083 ) ) ( not ( = ?auto_13080 ?auto_13085 ) ) ( not ( = ?auto_13080 ?auto_13083 ) ) ( not ( = ?auto_13066 ?auto_13070 ) ) ( not ( = ?auto_13066 ?auto_13081 ) ) ( not ( = ?auto_13067 ?auto_13070 ) ) ( not ( = ?auto_13067 ?auto_13081 ) ) ( not ( = ?auto_13068 ?auto_13070 ) ) ( not ( = ?auto_13068 ?auto_13081 ) ) ( not ( = ?auto_13070 ?auto_13080 ) ) ( not ( = ?auto_13070 ?auto_13085 ) ) ( not ( = ?auto_13070 ?auto_13083 ) ) ( not ( = ?auto_13086 ?auto_13079 ) ) ( not ( = ?auto_13086 ?auto_13087 ) ) ( not ( = ?auto_13082 ?auto_13084 ) ) ( not ( = ?auto_13082 ?auto_13078 ) ) ( not ( = ?auto_13081 ?auto_13080 ) ) ( not ( = ?auto_13081 ?auto_13085 ) ) ( not ( = ?auto_13081 ?auto_13083 ) ) ( not ( = ?auto_13066 ?auto_13071 ) ) ( not ( = ?auto_13066 ?auto_13074 ) ) ( not ( = ?auto_13067 ?auto_13071 ) ) ( not ( = ?auto_13067 ?auto_13074 ) ) ( not ( = ?auto_13068 ?auto_13071 ) ) ( not ( = ?auto_13068 ?auto_13074 ) ) ( not ( = ?auto_13069 ?auto_13071 ) ) ( not ( = ?auto_13069 ?auto_13074 ) ) ( not ( = ?auto_13071 ?auto_13081 ) ) ( not ( = ?auto_13071 ?auto_13080 ) ) ( not ( = ?auto_13071 ?auto_13085 ) ) ( not ( = ?auto_13071 ?auto_13083 ) ) ( not ( = ?auto_13077 ?auto_13086 ) ) ( not ( = ?auto_13077 ?auto_13079 ) ) ( not ( = ?auto_13077 ?auto_13087 ) ) ( not ( = ?auto_13073 ?auto_13082 ) ) ( not ( = ?auto_13073 ?auto_13084 ) ) ( not ( = ?auto_13073 ?auto_13078 ) ) ( not ( = ?auto_13074 ?auto_13081 ) ) ( not ( = ?auto_13074 ?auto_13080 ) ) ( not ( = ?auto_13074 ?auto_13085 ) ) ( not ( = ?auto_13074 ?auto_13083 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_13066 ?auto_13067 ?auto_13068 ?auto_13069 ?auto_13070 )
      ( MAKE-1CRATE ?auto_13070 ?auto_13071 )
      ( MAKE-5CRATE-VERIFY ?auto_13066 ?auto_13067 ?auto_13068 ?auto_13069 ?auto_13070 ?auto_13071 ) )
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
      ?auto_13114 - HOIST
      ?auto_13115 - PLACE
      ?auto_13113 - PLACE
      ?auto_13117 - HOIST
      ?auto_13112 - SURFACE
      ?auto_13121 - PLACE
      ?auto_13119 - HOIST
      ?auto_13127 - SURFACE
      ?auto_13126 - PLACE
      ?auto_13123 - HOIST
      ?auto_13118 - SURFACE
      ?auto_13125 - PLACE
      ?auto_13124 - HOIST
      ?auto_13128 - SURFACE
      ?auto_13120 - SURFACE
      ?auto_13122 - SURFACE
      ?auto_13116 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13114 ?auto_13115 ) ( IS-CRATE ?auto_13111 ) ( not ( = ?auto_13113 ?auto_13115 ) ) ( HOIST-AT ?auto_13117 ?auto_13113 ) ( SURFACE-AT ?auto_13111 ?auto_13113 ) ( ON ?auto_13111 ?auto_13112 ) ( CLEAR ?auto_13111 ) ( not ( = ?auto_13110 ?auto_13111 ) ) ( not ( = ?auto_13110 ?auto_13112 ) ) ( not ( = ?auto_13111 ?auto_13112 ) ) ( not ( = ?auto_13114 ?auto_13117 ) ) ( IS-CRATE ?auto_13110 ) ( not ( = ?auto_13121 ?auto_13115 ) ) ( HOIST-AT ?auto_13119 ?auto_13121 ) ( AVAILABLE ?auto_13119 ) ( SURFACE-AT ?auto_13110 ?auto_13121 ) ( ON ?auto_13110 ?auto_13127 ) ( CLEAR ?auto_13110 ) ( not ( = ?auto_13109 ?auto_13110 ) ) ( not ( = ?auto_13109 ?auto_13127 ) ) ( not ( = ?auto_13110 ?auto_13127 ) ) ( not ( = ?auto_13114 ?auto_13119 ) ) ( IS-CRATE ?auto_13109 ) ( not ( = ?auto_13126 ?auto_13115 ) ) ( HOIST-AT ?auto_13123 ?auto_13126 ) ( AVAILABLE ?auto_13123 ) ( SURFACE-AT ?auto_13109 ?auto_13126 ) ( ON ?auto_13109 ?auto_13118 ) ( CLEAR ?auto_13109 ) ( not ( = ?auto_13108 ?auto_13109 ) ) ( not ( = ?auto_13108 ?auto_13118 ) ) ( not ( = ?auto_13109 ?auto_13118 ) ) ( not ( = ?auto_13114 ?auto_13123 ) ) ( IS-CRATE ?auto_13108 ) ( not ( = ?auto_13125 ?auto_13115 ) ) ( HOIST-AT ?auto_13124 ?auto_13125 ) ( SURFACE-AT ?auto_13108 ?auto_13125 ) ( ON ?auto_13108 ?auto_13128 ) ( CLEAR ?auto_13108 ) ( not ( = ?auto_13107 ?auto_13108 ) ) ( not ( = ?auto_13107 ?auto_13128 ) ) ( not ( = ?auto_13108 ?auto_13128 ) ) ( not ( = ?auto_13114 ?auto_13124 ) ) ( IS-CRATE ?auto_13107 ) ( AVAILABLE ?auto_13117 ) ( SURFACE-AT ?auto_13107 ?auto_13113 ) ( ON ?auto_13107 ?auto_13120 ) ( CLEAR ?auto_13107 ) ( not ( = ?auto_13106 ?auto_13107 ) ) ( not ( = ?auto_13106 ?auto_13120 ) ) ( not ( = ?auto_13107 ?auto_13120 ) ) ( SURFACE-AT ?auto_13105 ?auto_13115 ) ( CLEAR ?auto_13105 ) ( IS-CRATE ?auto_13106 ) ( AVAILABLE ?auto_13114 ) ( AVAILABLE ?auto_13124 ) ( SURFACE-AT ?auto_13106 ?auto_13125 ) ( ON ?auto_13106 ?auto_13122 ) ( CLEAR ?auto_13106 ) ( TRUCK-AT ?auto_13116 ?auto_13115 ) ( not ( = ?auto_13105 ?auto_13106 ) ) ( not ( = ?auto_13105 ?auto_13122 ) ) ( not ( = ?auto_13106 ?auto_13122 ) ) ( not ( = ?auto_13105 ?auto_13107 ) ) ( not ( = ?auto_13105 ?auto_13120 ) ) ( not ( = ?auto_13107 ?auto_13122 ) ) ( not ( = ?auto_13113 ?auto_13125 ) ) ( not ( = ?auto_13117 ?auto_13124 ) ) ( not ( = ?auto_13120 ?auto_13122 ) ) ( not ( = ?auto_13105 ?auto_13108 ) ) ( not ( = ?auto_13105 ?auto_13128 ) ) ( not ( = ?auto_13106 ?auto_13108 ) ) ( not ( = ?auto_13106 ?auto_13128 ) ) ( not ( = ?auto_13108 ?auto_13120 ) ) ( not ( = ?auto_13108 ?auto_13122 ) ) ( not ( = ?auto_13128 ?auto_13120 ) ) ( not ( = ?auto_13128 ?auto_13122 ) ) ( not ( = ?auto_13105 ?auto_13109 ) ) ( not ( = ?auto_13105 ?auto_13118 ) ) ( not ( = ?auto_13106 ?auto_13109 ) ) ( not ( = ?auto_13106 ?auto_13118 ) ) ( not ( = ?auto_13107 ?auto_13109 ) ) ( not ( = ?auto_13107 ?auto_13118 ) ) ( not ( = ?auto_13109 ?auto_13128 ) ) ( not ( = ?auto_13109 ?auto_13120 ) ) ( not ( = ?auto_13109 ?auto_13122 ) ) ( not ( = ?auto_13126 ?auto_13125 ) ) ( not ( = ?auto_13126 ?auto_13113 ) ) ( not ( = ?auto_13123 ?auto_13124 ) ) ( not ( = ?auto_13123 ?auto_13117 ) ) ( not ( = ?auto_13118 ?auto_13128 ) ) ( not ( = ?auto_13118 ?auto_13120 ) ) ( not ( = ?auto_13118 ?auto_13122 ) ) ( not ( = ?auto_13105 ?auto_13110 ) ) ( not ( = ?auto_13105 ?auto_13127 ) ) ( not ( = ?auto_13106 ?auto_13110 ) ) ( not ( = ?auto_13106 ?auto_13127 ) ) ( not ( = ?auto_13107 ?auto_13110 ) ) ( not ( = ?auto_13107 ?auto_13127 ) ) ( not ( = ?auto_13108 ?auto_13110 ) ) ( not ( = ?auto_13108 ?auto_13127 ) ) ( not ( = ?auto_13110 ?auto_13118 ) ) ( not ( = ?auto_13110 ?auto_13128 ) ) ( not ( = ?auto_13110 ?auto_13120 ) ) ( not ( = ?auto_13110 ?auto_13122 ) ) ( not ( = ?auto_13121 ?auto_13126 ) ) ( not ( = ?auto_13121 ?auto_13125 ) ) ( not ( = ?auto_13121 ?auto_13113 ) ) ( not ( = ?auto_13119 ?auto_13123 ) ) ( not ( = ?auto_13119 ?auto_13124 ) ) ( not ( = ?auto_13119 ?auto_13117 ) ) ( not ( = ?auto_13127 ?auto_13118 ) ) ( not ( = ?auto_13127 ?auto_13128 ) ) ( not ( = ?auto_13127 ?auto_13120 ) ) ( not ( = ?auto_13127 ?auto_13122 ) ) ( not ( = ?auto_13105 ?auto_13111 ) ) ( not ( = ?auto_13105 ?auto_13112 ) ) ( not ( = ?auto_13106 ?auto_13111 ) ) ( not ( = ?auto_13106 ?auto_13112 ) ) ( not ( = ?auto_13107 ?auto_13111 ) ) ( not ( = ?auto_13107 ?auto_13112 ) ) ( not ( = ?auto_13108 ?auto_13111 ) ) ( not ( = ?auto_13108 ?auto_13112 ) ) ( not ( = ?auto_13109 ?auto_13111 ) ) ( not ( = ?auto_13109 ?auto_13112 ) ) ( not ( = ?auto_13111 ?auto_13127 ) ) ( not ( = ?auto_13111 ?auto_13118 ) ) ( not ( = ?auto_13111 ?auto_13128 ) ) ( not ( = ?auto_13111 ?auto_13120 ) ) ( not ( = ?auto_13111 ?auto_13122 ) ) ( not ( = ?auto_13112 ?auto_13127 ) ) ( not ( = ?auto_13112 ?auto_13118 ) ) ( not ( = ?auto_13112 ?auto_13128 ) ) ( not ( = ?auto_13112 ?auto_13120 ) ) ( not ( = ?auto_13112 ?auto_13122 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_13105 ?auto_13106 ?auto_13107 ?auto_13108 ?auto_13109 ?auto_13110 )
      ( MAKE-1CRATE ?auto_13110 ?auto_13111 )
      ( MAKE-6CRATE-VERIFY ?auto_13105 ?auto_13106 ?auto_13107 ?auto_13108 ?auto_13109 ?auto_13110 ?auto_13111 ) )
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
      ?auto_13153 - SURFACE
      ?auto_13154 - SURFACE
    )
    :vars
    (
      ?auto_13156 - HOIST
      ?auto_13158 - PLACE
      ?auto_13160 - PLACE
      ?auto_13155 - HOIST
      ?auto_13157 - SURFACE
      ?auto_13163 - PLACE
      ?auto_13162 - HOIST
      ?auto_13170 - SURFACE
      ?auto_13172 - PLACE
      ?auto_13167 - HOIST
      ?auto_13166 - SURFACE
      ?auto_13164 - PLACE
      ?auto_13168 - HOIST
      ?auto_13171 - SURFACE
      ?auto_13165 - SURFACE
      ?auto_13169 - SURFACE
      ?auto_13161 - SURFACE
      ?auto_13159 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13156 ?auto_13158 ) ( IS-CRATE ?auto_13154 ) ( not ( = ?auto_13160 ?auto_13158 ) ) ( HOIST-AT ?auto_13155 ?auto_13160 ) ( SURFACE-AT ?auto_13154 ?auto_13160 ) ( ON ?auto_13154 ?auto_13157 ) ( CLEAR ?auto_13154 ) ( not ( = ?auto_13153 ?auto_13154 ) ) ( not ( = ?auto_13153 ?auto_13157 ) ) ( not ( = ?auto_13154 ?auto_13157 ) ) ( not ( = ?auto_13156 ?auto_13155 ) ) ( IS-CRATE ?auto_13153 ) ( not ( = ?auto_13163 ?auto_13158 ) ) ( HOIST-AT ?auto_13162 ?auto_13163 ) ( SURFACE-AT ?auto_13153 ?auto_13163 ) ( ON ?auto_13153 ?auto_13170 ) ( CLEAR ?auto_13153 ) ( not ( = ?auto_13152 ?auto_13153 ) ) ( not ( = ?auto_13152 ?auto_13170 ) ) ( not ( = ?auto_13153 ?auto_13170 ) ) ( not ( = ?auto_13156 ?auto_13162 ) ) ( IS-CRATE ?auto_13152 ) ( not ( = ?auto_13172 ?auto_13158 ) ) ( HOIST-AT ?auto_13167 ?auto_13172 ) ( AVAILABLE ?auto_13167 ) ( SURFACE-AT ?auto_13152 ?auto_13172 ) ( ON ?auto_13152 ?auto_13166 ) ( CLEAR ?auto_13152 ) ( not ( = ?auto_13151 ?auto_13152 ) ) ( not ( = ?auto_13151 ?auto_13166 ) ) ( not ( = ?auto_13152 ?auto_13166 ) ) ( not ( = ?auto_13156 ?auto_13167 ) ) ( IS-CRATE ?auto_13151 ) ( not ( = ?auto_13164 ?auto_13158 ) ) ( HOIST-AT ?auto_13168 ?auto_13164 ) ( AVAILABLE ?auto_13168 ) ( SURFACE-AT ?auto_13151 ?auto_13164 ) ( ON ?auto_13151 ?auto_13171 ) ( CLEAR ?auto_13151 ) ( not ( = ?auto_13150 ?auto_13151 ) ) ( not ( = ?auto_13150 ?auto_13171 ) ) ( not ( = ?auto_13151 ?auto_13171 ) ) ( not ( = ?auto_13156 ?auto_13168 ) ) ( IS-CRATE ?auto_13150 ) ( SURFACE-AT ?auto_13150 ?auto_13160 ) ( ON ?auto_13150 ?auto_13165 ) ( CLEAR ?auto_13150 ) ( not ( = ?auto_13149 ?auto_13150 ) ) ( not ( = ?auto_13149 ?auto_13165 ) ) ( not ( = ?auto_13150 ?auto_13165 ) ) ( IS-CRATE ?auto_13149 ) ( AVAILABLE ?auto_13162 ) ( SURFACE-AT ?auto_13149 ?auto_13163 ) ( ON ?auto_13149 ?auto_13169 ) ( CLEAR ?auto_13149 ) ( not ( = ?auto_13148 ?auto_13149 ) ) ( not ( = ?auto_13148 ?auto_13169 ) ) ( not ( = ?auto_13149 ?auto_13169 ) ) ( SURFACE-AT ?auto_13147 ?auto_13158 ) ( CLEAR ?auto_13147 ) ( IS-CRATE ?auto_13148 ) ( AVAILABLE ?auto_13156 ) ( AVAILABLE ?auto_13155 ) ( SURFACE-AT ?auto_13148 ?auto_13160 ) ( ON ?auto_13148 ?auto_13161 ) ( CLEAR ?auto_13148 ) ( TRUCK-AT ?auto_13159 ?auto_13158 ) ( not ( = ?auto_13147 ?auto_13148 ) ) ( not ( = ?auto_13147 ?auto_13161 ) ) ( not ( = ?auto_13148 ?auto_13161 ) ) ( not ( = ?auto_13147 ?auto_13149 ) ) ( not ( = ?auto_13147 ?auto_13169 ) ) ( not ( = ?auto_13149 ?auto_13161 ) ) ( not ( = ?auto_13163 ?auto_13160 ) ) ( not ( = ?auto_13162 ?auto_13155 ) ) ( not ( = ?auto_13169 ?auto_13161 ) ) ( not ( = ?auto_13147 ?auto_13150 ) ) ( not ( = ?auto_13147 ?auto_13165 ) ) ( not ( = ?auto_13148 ?auto_13150 ) ) ( not ( = ?auto_13148 ?auto_13165 ) ) ( not ( = ?auto_13150 ?auto_13169 ) ) ( not ( = ?auto_13150 ?auto_13161 ) ) ( not ( = ?auto_13165 ?auto_13169 ) ) ( not ( = ?auto_13165 ?auto_13161 ) ) ( not ( = ?auto_13147 ?auto_13151 ) ) ( not ( = ?auto_13147 ?auto_13171 ) ) ( not ( = ?auto_13148 ?auto_13151 ) ) ( not ( = ?auto_13148 ?auto_13171 ) ) ( not ( = ?auto_13149 ?auto_13151 ) ) ( not ( = ?auto_13149 ?auto_13171 ) ) ( not ( = ?auto_13151 ?auto_13165 ) ) ( not ( = ?auto_13151 ?auto_13169 ) ) ( not ( = ?auto_13151 ?auto_13161 ) ) ( not ( = ?auto_13164 ?auto_13160 ) ) ( not ( = ?auto_13164 ?auto_13163 ) ) ( not ( = ?auto_13168 ?auto_13155 ) ) ( not ( = ?auto_13168 ?auto_13162 ) ) ( not ( = ?auto_13171 ?auto_13165 ) ) ( not ( = ?auto_13171 ?auto_13169 ) ) ( not ( = ?auto_13171 ?auto_13161 ) ) ( not ( = ?auto_13147 ?auto_13152 ) ) ( not ( = ?auto_13147 ?auto_13166 ) ) ( not ( = ?auto_13148 ?auto_13152 ) ) ( not ( = ?auto_13148 ?auto_13166 ) ) ( not ( = ?auto_13149 ?auto_13152 ) ) ( not ( = ?auto_13149 ?auto_13166 ) ) ( not ( = ?auto_13150 ?auto_13152 ) ) ( not ( = ?auto_13150 ?auto_13166 ) ) ( not ( = ?auto_13152 ?auto_13171 ) ) ( not ( = ?auto_13152 ?auto_13165 ) ) ( not ( = ?auto_13152 ?auto_13169 ) ) ( not ( = ?auto_13152 ?auto_13161 ) ) ( not ( = ?auto_13172 ?auto_13164 ) ) ( not ( = ?auto_13172 ?auto_13160 ) ) ( not ( = ?auto_13172 ?auto_13163 ) ) ( not ( = ?auto_13167 ?auto_13168 ) ) ( not ( = ?auto_13167 ?auto_13155 ) ) ( not ( = ?auto_13167 ?auto_13162 ) ) ( not ( = ?auto_13166 ?auto_13171 ) ) ( not ( = ?auto_13166 ?auto_13165 ) ) ( not ( = ?auto_13166 ?auto_13169 ) ) ( not ( = ?auto_13166 ?auto_13161 ) ) ( not ( = ?auto_13147 ?auto_13153 ) ) ( not ( = ?auto_13147 ?auto_13170 ) ) ( not ( = ?auto_13148 ?auto_13153 ) ) ( not ( = ?auto_13148 ?auto_13170 ) ) ( not ( = ?auto_13149 ?auto_13153 ) ) ( not ( = ?auto_13149 ?auto_13170 ) ) ( not ( = ?auto_13150 ?auto_13153 ) ) ( not ( = ?auto_13150 ?auto_13170 ) ) ( not ( = ?auto_13151 ?auto_13153 ) ) ( not ( = ?auto_13151 ?auto_13170 ) ) ( not ( = ?auto_13153 ?auto_13166 ) ) ( not ( = ?auto_13153 ?auto_13171 ) ) ( not ( = ?auto_13153 ?auto_13165 ) ) ( not ( = ?auto_13153 ?auto_13169 ) ) ( not ( = ?auto_13153 ?auto_13161 ) ) ( not ( = ?auto_13170 ?auto_13166 ) ) ( not ( = ?auto_13170 ?auto_13171 ) ) ( not ( = ?auto_13170 ?auto_13165 ) ) ( not ( = ?auto_13170 ?auto_13169 ) ) ( not ( = ?auto_13170 ?auto_13161 ) ) ( not ( = ?auto_13147 ?auto_13154 ) ) ( not ( = ?auto_13147 ?auto_13157 ) ) ( not ( = ?auto_13148 ?auto_13154 ) ) ( not ( = ?auto_13148 ?auto_13157 ) ) ( not ( = ?auto_13149 ?auto_13154 ) ) ( not ( = ?auto_13149 ?auto_13157 ) ) ( not ( = ?auto_13150 ?auto_13154 ) ) ( not ( = ?auto_13150 ?auto_13157 ) ) ( not ( = ?auto_13151 ?auto_13154 ) ) ( not ( = ?auto_13151 ?auto_13157 ) ) ( not ( = ?auto_13152 ?auto_13154 ) ) ( not ( = ?auto_13152 ?auto_13157 ) ) ( not ( = ?auto_13154 ?auto_13170 ) ) ( not ( = ?auto_13154 ?auto_13166 ) ) ( not ( = ?auto_13154 ?auto_13171 ) ) ( not ( = ?auto_13154 ?auto_13165 ) ) ( not ( = ?auto_13154 ?auto_13169 ) ) ( not ( = ?auto_13154 ?auto_13161 ) ) ( not ( = ?auto_13157 ?auto_13170 ) ) ( not ( = ?auto_13157 ?auto_13166 ) ) ( not ( = ?auto_13157 ?auto_13171 ) ) ( not ( = ?auto_13157 ?auto_13165 ) ) ( not ( = ?auto_13157 ?auto_13169 ) ) ( not ( = ?auto_13157 ?auto_13161 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_13147 ?auto_13148 ?auto_13149 ?auto_13150 ?auto_13151 ?auto_13152 ?auto_13153 )
      ( MAKE-1CRATE ?auto_13153 ?auto_13154 )
      ( MAKE-7CRATE-VERIFY ?auto_13147 ?auto_13148 ?auto_13149 ?auto_13150 ?auto_13151 ?auto_13152 ?auto_13153 ?auto_13154 ) )
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
      ?auto_13198 - SURFACE
      ?auto_13199 - SURFACE
      ?auto_13200 - SURFACE
    )
    :vars
    (
      ?auto_13205 - HOIST
      ?auto_13203 - PLACE
      ?auto_13201 - PLACE
      ?auto_13206 - HOIST
      ?auto_13202 - SURFACE
      ?auto_13214 - PLACE
      ?auto_13216 - HOIST
      ?auto_13207 - SURFACE
      ?auto_13218 - PLACE
      ?auto_13211 - HOIST
      ?auto_13210 - SURFACE
      ?auto_13212 - SURFACE
      ?auto_13208 - PLACE
      ?auto_13209 - HOIST
      ?auto_13213 - SURFACE
      ?auto_13215 - SURFACE
      ?auto_13217 - SURFACE
      ?auto_13219 - SURFACE
      ?auto_13204 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13205 ?auto_13203 ) ( IS-CRATE ?auto_13200 ) ( not ( = ?auto_13201 ?auto_13203 ) ) ( HOIST-AT ?auto_13206 ?auto_13201 ) ( SURFACE-AT ?auto_13200 ?auto_13201 ) ( ON ?auto_13200 ?auto_13202 ) ( CLEAR ?auto_13200 ) ( not ( = ?auto_13199 ?auto_13200 ) ) ( not ( = ?auto_13199 ?auto_13202 ) ) ( not ( = ?auto_13200 ?auto_13202 ) ) ( not ( = ?auto_13205 ?auto_13206 ) ) ( IS-CRATE ?auto_13199 ) ( not ( = ?auto_13214 ?auto_13203 ) ) ( HOIST-AT ?auto_13216 ?auto_13214 ) ( SURFACE-AT ?auto_13199 ?auto_13214 ) ( ON ?auto_13199 ?auto_13207 ) ( CLEAR ?auto_13199 ) ( not ( = ?auto_13198 ?auto_13199 ) ) ( not ( = ?auto_13198 ?auto_13207 ) ) ( not ( = ?auto_13199 ?auto_13207 ) ) ( not ( = ?auto_13205 ?auto_13216 ) ) ( IS-CRATE ?auto_13198 ) ( not ( = ?auto_13218 ?auto_13203 ) ) ( HOIST-AT ?auto_13211 ?auto_13218 ) ( SURFACE-AT ?auto_13198 ?auto_13218 ) ( ON ?auto_13198 ?auto_13210 ) ( CLEAR ?auto_13198 ) ( not ( = ?auto_13197 ?auto_13198 ) ) ( not ( = ?auto_13197 ?auto_13210 ) ) ( not ( = ?auto_13198 ?auto_13210 ) ) ( not ( = ?auto_13205 ?auto_13211 ) ) ( IS-CRATE ?auto_13197 ) ( AVAILABLE ?auto_13206 ) ( SURFACE-AT ?auto_13197 ?auto_13201 ) ( ON ?auto_13197 ?auto_13212 ) ( CLEAR ?auto_13197 ) ( not ( = ?auto_13196 ?auto_13197 ) ) ( not ( = ?auto_13196 ?auto_13212 ) ) ( not ( = ?auto_13197 ?auto_13212 ) ) ( IS-CRATE ?auto_13196 ) ( not ( = ?auto_13208 ?auto_13203 ) ) ( HOIST-AT ?auto_13209 ?auto_13208 ) ( AVAILABLE ?auto_13209 ) ( SURFACE-AT ?auto_13196 ?auto_13208 ) ( ON ?auto_13196 ?auto_13213 ) ( CLEAR ?auto_13196 ) ( not ( = ?auto_13195 ?auto_13196 ) ) ( not ( = ?auto_13195 ?auto_13213 ) ) ( not ( = ?auto_13196 ?auto_13213 ) ) ( not ( = ?auto_13205 ?auto_13209 ) ) ( IS-CRATE ?auto_13195 ) ( SURFACE-AT ?auto_13195 ?auto_13214 ) ( ON ?auto_13195 ?auto_13215 ) ( CLEAR ?auto_13195 ) ( not ( = ?auto_13194 ?auto_13195 ) ) ( not ( = ?auto_13194 ?auto_13215 ) ) ( not ( = ?auto_13195 ?auto_13215 ) ) ( IS-CRATE ?auto_13194 ) ( AVAILABLE ?auto_13211 ) ( SURFACE-AT ?auto_13194 ?auto_13218 ) ( ON ?auto_13194 ?auto_13217 ) ( CLEAR ?auto_13194 ) ( not ( = ?auto_13193 ?auto_13194 ) ) ( not ( = ?auto_13193 ?auto_13217 ) ) ( not ( = ?auto_13194 ?auto_13217 ) ) ( SURFACE-AT ?auto_13192 ?auto_13203 ) ( CLEAR ?auto_13192 ) ( IS-CRATE ?auto_13193 ) ( AVAILABLE ?auto_13205 ) ( AVAILABLE ?auto_13216 ) ( SURFACE-AT ?auto_13193 ?auto_13214 ) ( ON ?auto_13193 ?auto_13219 ) ( CLEAR ?auto_13193 ) ( TRUCK-AT ?auto_13204 ?auto_13203 ) ( not ( = ?auto_13192 ?auto_13193 ) ) ( not ( = ?auto_13192 ?auto_13219 ) ) ( not ( = ?auto_13193 ?auto_13219 ) ) ( not ( = ?auto_13192 ?auto_13194 ) ) ( not ( = ?auto_13192 ?auto_13217 ) ) ( not ( = ?auto_13194 ?auto_13219 ) ) ( not ( = ?auto_13218 ?auto_13214 ) ) ( not ( = ?auto_13211 ?auto_13216 ) ) ( not ( = ?auto_13217 ?auto_13219 ) ) ( not ( = ?auto_13192 ?auto_13195 ) ) ( not ( = ?auto_13192 ?auto_13215 ) ) ( not ( = ?auto_13193 ?auto_13195 ) ) ( not ( = ?auto_13193 ?auto_13215 ) ) ( not ( = ?auto_13195 ?auto_13217 ) ) ( not ( = ?auto_13195 ?auto_13219 ) ) ( not ( = ?auto_13215 ?auto_13217 ) ) ( not ( = ?auto_13215 ?auto_13219 ) ) ( not ( = ?auto_13192 ?auto_13196 ) ) ( not ( = ?auto_13192 ?auto_13213 ) ) ( not ( = ?auto_13193 ?auto_13196 ) ) ( not ( = ?auto_13193 ?auto_13213 ) ) ( not ( = ?auto_13194 ?auto_13196 ) ) ( not ( = ?auto_13194 ?auto_13213 ) ) ( not ( = ?auto_13196 ?auto_13215 ) ) ( not ( = ?auto_13196 ?auto_13217 ) ) ( not ( = ?auto_13196 ?auto_13219 ) ) ( not ( = ?auto_13208 ?auto_13214 ) ) ( not ( = ?auto_13208 ?auto_13218 ) ) ( not ( = ?auto_13209 ?auto_13216 ) ) ( not ( = ?auto_13209 ?auto_13211 ) ) ( not ( = ?auto_13213 ?auto_13215 ) ) ( not ( = ?auto_13213 ?auto_13217 ) ) ( not ( = ?auto_13213 ?auto_13219 ) ) ( not ( = ?auto_13192 ?auto_13197 ) ) ( not ( = ?auto_13192 ?auto_13212 ) ) ( not ( = ?auto_13193 ?auto_13197 ) ) ( not ( = ?auto_13193 ?auto_13212 ) ) ( not ( = ?auto_13194 ?auto_13197 ) ) ( not ( = ?auto_13194 ?auto_13212 ) ) ( not ( = ?auto_13195 ?auto_13197 ) ) ( not ( = ?auto_13195 ?auto_13212 ) ) ( not ( = ?auto_13197 ?auto_13213 ) ) ( not ( = ?auto_13197 ?auto_13215 ) ) ( not ( = ?auto_13197 ?auto_13217 ) ) ( not ( = ?auto_13197 ?auto_13219 ) ) ( not ( = ?auto_13201 ?auto_13208 ) ) ( not ( = ?auto_13201 ?auto_13214 ) ) ( not ( = ?auto_13201 ?auto_13218 ) ) ( not ( = ?auto_13206 ?auto_13209 ) ) ( not ( = ?auto_13206 ?auto_13216 ) ) ( not ( = ?auto_13206 ?auto_13211 ) ) ( not ( = ?auto_13212 ?auto_13213 ) ) ( not ( = ?auto_13212 ?auto_13215 ) ) ( not ( = ?auto_13212 ?auto_13217 ) ) ( not ( = ?auto_13212 ?auto_13219 ) ) ( not ( = ?auto_13192 ?auto_13198 ) ) ( not ( = ?auto_13192 ?auto_13210 ) ) ( not ( = ?auto_13193 ?auto_13198 ) ) ( not ( = ?auto_13193 ?auto_13210 ) ) ( not ( = ?auto_13194 ?auto_13198 ) ) ( not ( = ?auto_13194 ?auto_13210 ) ) ( not ( = ?auto_13195 ?auto_13198 ) ) ( not ( = ?auto_13195 ?auto_13210 ) ) ( not ( = ?auto_13196 ?auto_13198 ) ) ( not ( = ?auto_13196 ?auto_13210 ) ) ( not ( = ?auto_13198 ?auto_13212 ) ) ( not ( = ?auto_13198 ?auto_13213 ) ) ( not ( = ?auto_13198 ?auto_13215 ) ) ( not ( = ?auto_13198 ?auto_13217 ) ) ( not ( = ?auto_13198 ?auto_13219 ) ) ( not ( = ?auto_13210 ?auto_13212 ) ) ( not ( = ?auto_13210 ?auto_13213 ) ) ( not ( = ?auto_13210 ?auto_13215 ) ) ( not ( = ?auto_13210 ?auto_13217 ) ) ( not ( = ?auto_13210 ?auto_13219 ) ) ( not ( = ?auto_13192 ?auto_13199 ) ) ( not ( = ?auto_13192 ?auto_13207 ) ) ( not ( = ?auto_13193 ?auto_13199 ) ) ( not ( = ?auto_13193 ?auto_13207 ) ) ( not ( = ?auto_13194 ?auto_13199 ) ) ( not ( = ?auto_13194 ?auto_13207 ) ) ( not ( = ?auto_13195 ?auto_13199 ) ) ( not ( = ?auto_13195 ?auto_13207 ) ) ( not ( = ?auto_13196 ?auto_13199 ) ) ( not ( = ?auto_13196 ?auto_13207 ) ) ( not ( = ?auto_13197 ?auto_13199 ) ) ( not ( = ?auto_13197 ?auto_13207 ) ) ( not ( = ?auto_13199 ?auto_13210 ) ) ( not ( = ?auto_13199 ?auto_13212 ) ) ( not ( = ?auto_13199 ?auto_13213 ) ) ( not ( = ?auto_13199 ?auto_13215 ) ) ( not ( = ?auto_13199 ?auto_13217 ) ) ( not ( = ?auto_13199 ?auto_13219 ) ) ( not ( = ?auto_13207 ?auto_13210 ) ) ( not ( = ?auto_13207 ?auto_13212 ) ) ( not ( = ?auto_13207 ?auto_13213 ) ) ( not ( = ?auto_13207 ?auto_13215 ) ) ( not ( = ?auto_13207 ?auto_13217 ) ) ( not ( = ?auto_13207 ?auto_13219 ) ) ( not ( = ?auto_13192 ?auto_13200 ) ) ( not ( = ?auto_13192 ?auto_13202 ) ) ( not ( = ?auto_13193 ?auto_13200 ) ) ( not ( = ?auto_13193 ?auto_13202 ) ) ( not ( = ?auto_13194 ?auto_13200 ) ) ( not ( = ?auto_13194 ?auto_13202 ) ) ( not ( = ?auto_13195 ?auto_13200 ) ) ( not ( = ?auto_13195 ?auto_13202 ) ) ( not ( = ?auto_13196 ?auto_13200 ) ) ( not ( = ?auto_13196 ?auto_13202 ) ) ( not ( = ?auto_13197 ?auto_13200 ) ) ( not ( = ?auto_13197 ?auto_13202 ) ) ( not ( = ?auto_13198 ?auto_13200 ) ) ( not ( = ?auto_13198 ?auto_13202 ) ) ( not ( = ?auto_13200 ?auto_13207 ) ) ( not ( = ?auto_13200 ?auto_13210 ) ) ( not ( = ?auto_13200 ?auto_13212 ) ) ( not ( = ?auto_13200 ?auto_13213 ) ) ( not ( = ?auto_13200 ?auto_13215 ) ) ( not ( = ?auto_13200 ?auto_13217 ) ) ( not ( = ?auto_13200 ?auto_13219 ) ) ( not ( = ?auto_13202 ?auto_13207 ) ) ( not ( = ?auto_13202 ?auto_13210 ) ) ( not ( = ?auto_13202 ?auto_13212 ) ) ( not ( = ?auto_13202 ?auto_13213 ) ) ( not ( = ?auto_13202 ?auto_13215 ) ) ( not ( = ?auto_13202 ?auto_13217 ) ) ( not ( = ?auto_13202 ?auto_13219 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_13192 ?auto_13193 ?auto_13194 ?auto_13195 ?auto_13196 ?auto_13197 ?auto_13198 ?auto_13199 )
      ( MAKE-1CRATE ?auto_13199 ?auto_13200 )
      ( MAKE-8CRATE-VERIFY ?auto_13192 ?auto_13193 ?auto_13194 ?auto_13195 ?auto_13196 ?auto_13197 ?auto_13198 ?auto_13199 ?auto_13200 ) )
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
      ?auto_13246 - SURFACE
      ?auto_13247 - SURFACE
      ?auto_13248 - SURFACE
      ?auto_13249 - SURFACE
    )
    :vars
    (
      ?auto_13253 - HOIST
      ?auto_13255 - PLACE
      ?auto_13254 - PLACE
      ?auto_13250 - HOIST
      ?auto_13252 - SURFACE
      ?auto_13260 - PLACE
      ?auto_13261 - HOIST
      ?auto_13267 - SURFACE
      ?auto_13257 - SURFACE
      ?auto_13256 - PLACE
      ?auto_13263 - HOIST
      ?auto_13269 - SURFACE
      ?auto_13266 - SURFACE
      ?auto_13265 - PLACE
      ?auto_13268 - HOIST
      ?auto_13258 - SURFACE
      ?auto_13259 - SURFACE
      ?auto_13264 - SURFACE
      ?auto_13262 - SURFACE
      ?auto_13251 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13253 ?auto_13255 ) ( IS-CRATE ?auto_13249 ) ( not ( = ?auto_13254 ?auto_13255 ) ) ( HOIST-AT ?auto_13250 ?auto_13254 ) ( SURFACE-AT ?auto_13249 ?auto_13254 ) ( ON ?auto_13249 ?auto_13252 ) ( CLEAR ?auto_13249 ) ( not ( = ?auto_13248 ?auto_13249 ) ) ( not ( = ?auto_13248 ?auto_13252 ) ) ( not ( = ?auto_13249 ?auto_13252 ) ) ( not ( = ?auto_13253 ?auto_13250 ) ) ( IS-CRATE ?auto_13248 ) ( not ( = ?auto_13260 ?auto_13255 ) ) ( HOIST-AT ?auto_13261 ?auto_13260 ) ( SURFACE-AT ?auto_13248 ?auto_13260 ) ( ON ?auto_13248 ?auto_13267 ) ( CLEAR ?auto_13248 ) ( not ( = ?auto_13247 ?auto_13248 ) ) ( not ( = ?auto_13247 ?auto_13267 ) ) ( not ( = ?auto_13248 ?auto_13267 ) ) ( not ( = ?auto_13253 ?auto_13261 ) ) ( IS-CRATE ?auto_13247 ) ( SURFACE-AT ?auto_13247 ?auto_13254 ) ( ON ?auto_13247 ?auto_13257 ) ( CLEAR ?auto_13247 ) ( not ( = ?auto_13246 ?auto_13247 ) ) ( not ( = ?auto_13246 ?auto_13257 ) ) ( not ( = ?auto_13247 ?auto_13257 ) ) ( IS-CRATE ?auto_13246 ) ( not ( = ?auto_13256 ?auto_13255 ) ) ( HOIST-AT ?auto_13263 ?auto_13256 ) ( SURFACE-AT ?auto_13246 ?auto_13256 ) ( ON ?auto_13246 ?auto_13269 ) ( CLEAR ?auto_13246 ) ( not ( = ?auto_13245 ?auto_13246 ) ) ( not ( = ?auto_13245 ?auto_13269 ) ) ( not ( = ?auto_13246 ?auto_13269 ) ) ( not ( = ?auto_13253 ?auto_13263 ) ) ( IS-CRATE ?auto_13245 ) ( AVAILABLE ?auto_13261 ) ( SURFACE-AT ?auto_13245 ?auto_13260 ) ( ON ?auto_13245 ?auto_13266 ) ( CLEAR ?auto_13245 ) ( not ( = ?auto_13244 ?auto_13245 ) ) ( not ( = ?auto_13244 ?auto_13266 ) ) ( not ( = ?auto_13245 ?auto_13266 ) ) ( IS-CRATE ?auto_13244 ) ( not ( = ?auto_13265 ?auto_13255 ) ) ( HOIST-AT ?auto_13268 ?auto_13265 ) ( AVAILABLE ?auto_13268 ) ( SURFACE-AT ?auto_13244 ?auto_13265 ) ( ON ?auto_13244 ?auto_13258 ) ( CLEAR ?auto_13244 ) ( not ( = ?auto_13243 ?auto_13244 ) ) ( not ( = ?auto_13243 ?auto_13258 ) ) ( not ( = ?auto_13244 ?auto_13258 ) ) ( not ( = ?auto_13253 ?auto_13268 ) ) ( IS-CRATE ?auto_13243 ) ( SURFACE-AT ?auto_13243 ?auto_13254 ) ( ON ?auto_13243 ?auto_13259 ) ( CLEAR ?auto_13243 ) ( not ( = ?auto_13242 ?auto_13243 ) ) ( not ( = ?auto_13242 ?auto_13259 ) ) ( not ( = ?auto_13243 ?auto_13259 ) ) ( IS-CRATE ?auto_13242 ) ( AVAILABLE ?auto_13263 ) ( SURFACE-AT ?auto_13242 ?auto_13256 ) ( ON ?auto_13242 ?auto_13264 ) ( CLEAR ?auto_13242 ) ( not ( = ?auto_13241 ?auto_13242 ) ) ( not ( = ?auto_13241 ?auto_13264 ) ) ( not ( = ?auto_13242 ?auto_13264 ) ) ( SURFACE-AT ?auto_13240 ?auto_13255 ) ( CLEAR ?auto_13240 ) ( IS-CRATE ?auto_13241 ) ( AVAILABLE ?auto_13253 ) ( AVAILABLE ?auto_13250 ) ( SURFACE-AT ?auto_13241 ?auto_13254 ) ( ON ?auto_13241 ?auto_13262 ) ( CLEAR ?auto_13241 ) ( TRUCK-AT ?auto_13251 ?auto_13255 ) ( not ( = ?auto_13240 ?auto_13241 ) ) ( not ( = ?auto_13240 ?auto_13262 ) ) ( not ( = ?auto_13241 ?auto_13262 ) ) ( not ( = ?auto_13240 ?auto_13242 ) ) ( not ( = ?auto_13240 ?auto_13264 ) ) ( not ( = ?auto_13242 ?auto_13262 ) ) ( not ( = ?auto_13256 ?auto_13254 ) ) ( not ( = ?auto_13263 ?auto_13250 ) ) ( not ( = ?auto_13264 ?auto_13262 ) ) ( not ( = ?auto_13240 ?auto_13243 ) ) ( not ( = ?auto_13240 ?auto_13259 ) ) ( not ( = ?auto_13241 ?auto_13243 ) ) ( not ( = ?auto_13241 ?auto_13259 ) ) ( not ( = ?auto_13243 ?auto_13264 ) ) ( not ( = ?auto_13243 ?auto_13262 ) ) ( not ( = ?auto_13259 ?auto_13264 ) ) ( not ( = ?auto_13259 ?auto_13262 ) ) ( not ( = ?auto_13240 ?auto_13244 ) ) ( not ( = ?auto_13240 ?auto_13258 ) ) ( not ( = ?auto_13241 ?auto_13244 ) ) ( not ( = ?auto_13241 ?auto_13258 ) ) ( not ( = ?auto_13242 ?auto_13244 ) ) ( not ( = ?auto_13242 ?auto_13258 ) ) ( not ( = ?auto_13244 ?auto_13259 ) ) ( not ( = ?auto_13244 ?auto_13264 ) ) ( not ( = ?auto_13244 ?auto_13262 ) ) ( not ( = ?auto_13265 ?auto_13254 ) ) ( not ( = ?auto_13265 ?auto_13256 ) ) ( not ( = ?auto_13268 ?auto_13250 ) ) ( not ( = ?auto_13268 ?auto_13263 ) ) ( not ( = ?auto_13258 ?auto_13259 ) ) ( not ( = ?auto_13258 ?auto_13264 ) ) ( not ( = ?auto_13258 ?auto_13262 ) ) ( not ( = ?auto_13240 ?auto_13245 ) ) ( not ( = ?auto_13240 ?auto_13266 ) ) ( not ( = ?auto_13241 ?auto_13245 ) ) ( not ( = ?auto_13241 ?auto_13266 ) ) ( not ( = ?auto_13242 ?auto_13245 ) ) ( not ( = ?auto_13242 ?auto_13266 ) ) ( not ( = ?auto_13243 ?auto_13245 ) ) ( not ( = ?auto_13243 ?auto_13266 ) ) ( not ( = ?auto_13245 ?auto_13258 ) ) ( not ( = ?auto_13245 ?auto_13259 ) ) ( not ( = ?auto_13245 ?auto_13264 ) ) ( not ( = ?auto_13245 ?auto_13262 ) ) ( not ( = ?auto_13260 ?auto_13265 ) ) ( not ( = ?auto_13260 ?auto_13254 ) ) ( not ( = ?auto_13260 ?auto_13256 ) ) ( not ( = ?auto_13261 ?auto_13268 ) ) ( not ( = ?auto_13261 ?auto_13250 ) ) ( not ( = ?auto_13261 ?auto_13263 ) ) ( not ( = ?auto_13266 ?auto_13258 ) ) ( not ( = ?auto_13266 ?auto_13259 ) ) ( not ( = ?auto_13266 ?auto_13264 ) ) ( not ( = ?auto_13266 ?auto_13262 ) ) ( not ( = ?auto_13240 ?auto_13246 ) ) ( not ( = ?auto_13240 ?auto_13269 ) ) ( not ( = ?auto_13241 ?auto_13246 ) ) ( not ( = ?auto_13241 ?auto_13269 ) ) ( not ( = ?auto_13242 ?auto_13246 ) ) ( not ( = ?auto_13242 ?auto_13269 ) ) ( not ( = ?auto_13243 ?auto_13246 ) ) ( not ( = ?auto_13243 ?auto_13269 ) ) ( not ( = ?auto_13244 ?auto_13246 ) ) ( not ( = ?auto_13244 ?auto_13269 ) ) ( not ( = ?auto_13246 ?auto_13266 ) ) ( not ( = ?auto_13246 ?auto_13258 ) ) ( not ( = ?auto_13246 ?auto_13259 ) ) ( not ( = ?auto_13246 ?auto_13264 ) ) ( not ( = ?auto_13246 ?auto_13262 ) ) ( not ( = ?auto_13269 ?auto_13266 ) ) ( not ( = ?auto_13269 ?auto_13258 ) ) ( not ( = ?auto_13269 ?auto_13259 ) ) ( not ( = ?auto_13269 ?auto_13264 ) ) ( not ( = ?auto_13269 ?auto_13262 ) ) ( not ( = ?auto_13240 ?auto_13247 ) ) ( not ( = ?auto_13240 ?auto_13257 ) ) ( not ( = ?auto_13241 ?auto_13247 ) ) ( not ( = ?auto_13241 ?auto_13257 ) ) ( not ( = ?auto_13242 ?auto_13247 ) ) ( not ( = ?auto_13242 ?auto_13257 ) ) ( not ( = ?auto_13243 ?auto_13247 ) ) ( not ( = ?auto_13243 ?auto_13257 ) ) ( not ( = ?auto_13244 ?auto_13247 ) ) ( not ( = ?auto_13244 ?auto_13257 ) ) ( not ( = ?auto_13245 ?auto_13247 ) ) ( not ( = ?auto_13245 ?auto_13257 ) ) ( not ( = ?auto_13247 ?auto_13269 ) ) ( not ( = ?auto_13247 ?auto_13266 ) ) ( not ( = ?auto_13247 ?auto_13258 ) ) ( not ( = ?auto_13247 ?auto_13259 ) ) ( not ( = ?auto_13247 ?auto_13264 ) ) ( not ( = ?auto_13247 ?auto_13262 ) ) ( not ( = ?auto_13257 ?auto_13269 ) ) ( not ( = ?auto_13257 ?auto_13266 ) ) ( not ( = ?auto_13257 ?auto_13258 ) ) ( not ( = ?auto_13257 ?auto_13259 ) ) ( not ( = ?auto_13257 ?auto_13264 ) ) ( not ( = ?auto_13257 ?auto_13262 ) ) ( not ( = ?auto_13240 ?auto_13248 ) ) ( not ( = ?auto_13240 ?auto_13267 ) ) ( not ( = ?auto_13241 ?auto_13248 ) ) ( not ( = ?auto_13241 ?auto_13267 ) ) ( not ( = ?auto_13242 ?auto_13248 ) ) ( not ( = ?auto_13242 ?auto_13267 ) ) ( not ( = ?auto_13243 ?auto_13248 ) ) ( not ( = ?auto_13243 ?auto_13267 ) ) ( not ( = ?auto_13244 ?auto_13248 ) ) ( not ( = ?auto_13244 ?auto_13267 ) ) ( not ( = ?auto_13245 ?auto_13248 ) ) ( not ( = ?auto_13245 ?auto_13267 ) ) ( not ( = ?auto_13246 ?auto_13248 ) ) ( not ( = ?auto_13246 ?auto_13267 ) ) ( not ( = ?auto_13248 ?auto_13257 ) ) ( not ( = ?auto_13248 ?auto_13269 ) ) ( not ( = ?auto_13248 ?auto_13266 ) ) ( not ( = ?auto_13248 ?auto_13258 ) ) ( not ( = ?auto_13248 ?auto_13259 ) ) ( not ( = ?auto_13248 ?auto_13264 ) ) ( not ( = ?auto_13248 ?auto_13262 ) ) ( not ( = ?auto_13267 ?auto_13257 ) ) ( not ( = ?auto_13267 ?auto_13269 ) ) ( not ( = ?auto_13267 ?auto_13266 ) ) ( not ( = ?auto_13267 ?auto_13258 ) ) ( not ( = ?auto_13267 ?auto_13259 ) ) ( not ( = ?auto_13267 ?auto_13264 ) ) ( not ( = ?auto_13267 ?auto_13262 ) ) ( not ( = ?auto_13240 ?auto_13249 ) ) ( not ( = ?auto_13240 ?auto_13252 ) ) ( not ( = ?auto_13241 ?auto_13249 ) ) ( not ( = ?auto_13241 ?auto_13252 ) ) ( not ( = ?auto_13242 ?auto_13249 ) ) ( not ( = ?auto_13242 ?auto_13252 ) ) ( not ( = ?auto_13243 ?auto_13249 ) ) ( not ( = ?auto_13243 ?auto_13252 ) ) ( not ( = ?auto_13244 ?auto_13249 ) ) ( not ( = ?auto_13244 ?auto_13252 ) ) ( not ( = ?auto_13245 ?auto_13249 ) ) ( not ( = ?auto_13245 ?auto_13252 ) ) ( not ( = ?auto_13246 ?auto_13249 ) ) ( not ( = ?auto_13246 ?auto_13252 ) ) ( not ( = ?auto_13247 ?auto_13249 ) ) ( not ( = ?auto_13247 ?auto_13252 ) ) ( not ( = ?auto_13249 ?auto_13267 ) ) ( not ( = ?auto_13249 ?auto_13257 ) ) ( not ( = ?auto_13249 ?auto_13269 ) ) ( not ( = ?auto_13249 ?auto_13266 ) ) ( not ( = ?auto_13249 ?auto_13258 ) ) ( not ( = ?auto_13249 ?auto_13259 ) ) ( not ( = ?auto_13249 ?auto_13264 ) ) ( not ( = ?auto_13249 ?auto_13262 ) ) ( not ( = ?auto_13252 ?auto_13267 ) ) ( not ( = ?auto_13252 ?auto_13257 ) ) ( not ( = ?auto_13252 ?auto_13269 ) ) ( not ( = ?auto_13252 ?auto_13266 ) ) ( not ( = ?auto_13252 ?auto_13258 ) ) ( not ( = ?auto_13252 ?auto_13259 ) ) ( not ( = ?auto_13252 ?auto_13264 ) ) ( not ( = ?auto_13252 ?auto_13262 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_13240 ?auto_13241 ?auto_13242 ?auto_13243 ?auto_13244 ?auto_13245 ?auto_13246 ?auto_13247 ?auto_13248 )
      ( MAKE-1CRATE ?auto_13248 ?auto_13249 )
      ( MAKE-9CRATE-VERIFY ?auto_13240 ?auto_13241 ?auto_13242 ?auto_13243 ?auto_13244 ?auto_13245 ?auto_13246 ?auto_13247 ?auto_13248 ?auto_13249 ) )
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
      ?auto_13297 - SURFACE
      ?auto_13298 - SURFACE
      ?auto_13299 - SURFACE
      ?auto_13300 - SURFACE
      ?auto_13301 - SURFACE
    )
    :vars
    (
      ?auto_13304 - HOIST
      ?auto_13302 - PLACE
      ?auto_13305 - PLACE
      ?auto_13307 - HOIST
      ?auto_13306 - SURFACE
      ?auto_13321 - PLACE
      ?auto_13323 - HOIST
      ?auto_13313 - SURFACE
      ?auto_13312 - PLACE
      ?auto_13311 - HOIST
      ?auto_13308 - SURFACE
      ?auto_13317 - SURFACE
      ?auto_13316 - PLACE
      ?auto_13318 - HOIST
      ?auto_13322 - SURFACE
      ?auto_13319 - SURFACE
      ?auto_13320 - PLACE
      ?auto_13314 - HOIST
      ?auto_13315 - SURFACE
      ?auto_13310 - SURFACE
      ?auto_13309 - SURFACE
      ?auto_13324 - SURFACE
      ?auto_13303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13304 ?auto_13302 ) ( IS-CRATE ?auto_13301 ) ( not ( = ?auto_13305 ?auto_13302 ) ) ( HOIST-AT ?auto_13307 ?auto_13305 ) ( AVAILABLE ?auto_13307 ) ( SURFACE-AT ?auto_13301 ?auto_13305 ) ( ON ?auto_13301 ?auto_13306 ) ( CLEAR ?auto_13301 ) ( not ( = ?auto_13300 ?auto_13301 ) ) ( not ( = ?auto_13300 ?auto_13306 ) ) ( not ( = ?auto_13301 ?auto_13306 ) ) ( not ( = ?auto_13304 ?auto_13307 ) ) ( IS-CRATE ?auto_13300 ) ( not ( = ?auto_13321 ?auto_13302 ) ) ( HOIST-AT ?auto_13323 ?auto_13321 ) ( SURFACE-AT ?auto_13300 ?auto_13321 ) ( ON ?auto_13300 ?auto_13313 ) ( CLEAR ?auto_13300 ) ( not ( = ?auto_13299 ?auto_13300 ) ) ( not ( = ?auto_13299 ?auto_13313 ) ) ( not ( = ?auto_13300 ?auto_13313 ) ) ( not ( = ?auto_13304 ?auto_13323 ) ) ( IS-CRATE ?auto_13299 ) ( not ( = ?auto_13312 ?auto_13302 ) ) ( HOIST-AT ?auto_13311 ?auto_13312 ) ( SURFACE-AT ?auto_13299 ?auto_13312 ) ( ON ?auto_13299 ?auto_13308 ) ( CLEAR ?auto_13299 ) ( not ( = ?auto_13298 ?auto_13299 ) ) ( not ( = ?auto_13298 ?auto_13308 ) ) ( not ( = ?auto_13299 ?auto_13308 ) ) ( not ( = ?auto_13304 ?auto_13311 ) ) ( IS-CRATE ?auto_13298 ) ( SURFACE-AT ?auto_13298 ?auto_13321 ) ( ON ?auto_13298 ?auto_13317 ) ( CLEAR ?auto_13298 ) ( not ( = ?auto_13297 ?auto_13298 ) ) ( not ( = ?auto_13297 ?auto_13317 ) ) ( not ( = ?auto_13298 ?auto_13317 ) ) ( IS-CRATE ?auto_13297 ) ( not ( = ?auto_13316 ?auto_13302 ) ) ( HOIST-AT ?auto_13318 ?auto_13316 ) ( SURFACE-AT ?auto_13297 ?auto_13316 ) ( ON ?auto_13297 ?auto_13322 ) ( CLEAR ?auto_13297 ) ( not ( = ?auto_13296 ?auto_13297 ) ) ( not ( = ?auto_13296 ?auto_13322 ) ) ( not ( = ?auto_13297 ?auto_13322 ) ) ( not ( = ?auto_13304 ?auto_13318 ) ) ( IS-CRATE ?auto_13296 ) ( AVAILABLE ?auto_13311 ) ( SURFACE-AT ?auto_13296 ?auto_13312 ) ( ON ?auto_13296 ?auto_13319 ) ( CLEAR ?auto_13296 ) ( not ( = ?auto_13295 ?auto_13296 ) ) ( not ( = ?auto_13295 ?auto_13319 ) ) ( not ( = ?auto_13296 ?auto_13319 ) ) ( IS-CRATE ?auto_13295 ) ( not ( = ?auto_13320 ?auto_13302 ) ) ( HOIST-AT ?auto_13314 ?auto_13320 ) ( AVAILABLE ?auto_13314 ) ( SURFACE-AT ?auto_13295 ?auto_13320 ) ( ON ?auto_13295 ?auto_13315 ) ( CLEAR ?auto_13295 ) ( not ( = ?auto_13294 ?auto_13295 ) ) ( not ( = ?auto_13294 ?auto_13315 ) ) ( not ( = ?auto_13295 ?auto_13315 ) ) ( not ( = ?auto_13304 ?auto_13314 ) ) ( IS-CRATE ?auto_13294 ) ( SURFACE-AT ?auto_13294 ?auto_13321 ) ( ON ?auto_13294 ?auto_13310 ) ( CLEAR ?auto_13294 ) ( not ( = ?auto_13293 ?auto_13294 ) ) ( not ( = ?auto_13293 ?auto_13310 ) ) ( not ( = ?auto_13294 ?auto_13310 ) ) ( IS-CRATE ?auto_13293 ) ( AVAILABLE ?auto_13318 ) ( SURFACE-AT ?auto_13293 ?auto_13316 ) ( ON ?auto_13293 ?auto_13309 ) ( CLEAR ?auto_13293 ) ( not ( = ?auto_13292 ?auto_13293 ) ) ( not ( = ?auto_13292 ?auto_13309 ) ) ( not ( = ?auto_13293 ?auto_13309 ) ) ( SURFACE-AT ?auto_13291 ?auto_13302 ) ( CLEAR ?auto_13291 ) ( IS-CRATE ?auto_13292 ) ( AVAILABLE ?auto_13304 ) ( AVAILABLE ?auto_13323 ) ( SURFACE-AT ?auto_13292 ?auto_13321 ) ( ON ?auto_13292 ?auto_13324 ) ( CLEAR ?auto_13292 ) ( TRUCK-AT ?auto_13303 ?auto_13302 ) ( not ( = ?auto_13291 ?auto_13292 ) ) ( not ( = ?auto_13291 ?auto_13324 ) ) ( not ( = ?auto_13292 ?auto_13324 ) ) ( not ( = ?auto_13291 ?auto_13293 ) ) ( not ( = ?auto_13291 ?auto_13309 ) ) ( not ( = ?auto_13293 ?auto_13324 ) ) ( not ( = ?auto_13316 ?auto_13321 ) ) ( not ( = ?auto_13318 ?auto_13323 ) ) ( not ( = ?auto_13309 ?auto_13324 ) ) ( not ( = ?auto_13291 ?auto_13294 ) ) ( not ( = ?auto_13291 ?auto_13310 ) ) ( not ( = ?auto_13292 ?auto_13294 ) ) ( not ( = ?auto_13292 ?auto_13310 ) ) ( not ( = ?auto_13294 ?auto_13309 ) ) ( not ( = ?auto_13294 ?auto_13324 ) ) ( not ( = ?auto_13310 ?auto_13309 ) ) ( not ( = ?auto_13310 ?auto_13324 ) ) ( not ( = ?auto_13291 ?auto_13295 ) ) ( not ( = ?auto_13291 ?auto_13315 ) ) ( not ( = ?auto_13292 ?auto_13295 ) ) ( not ( = ?auto_13292 ?auto_13315 ) ) ( not ( = ?auto_13293 ?auto_13295 ) ) ( not ( = ?auto_13293 ?auto_13315 ) ) ( not ( = ?auto_13295 ?auto_13310 ) ) ( not ( = ?auto_13295 ?auto_13309 ) ) ( not ( = ?auto_13295 ?auto_13324 ) ) ( not ( = ?auto_13320 ?auto_13321 ) ) ( not ( = ?auto_13320 ?auto_13316 ) ) ( not ( = ?auto_13314 ?auto_13323 ) ) ( not ( = ?auto_13314 ?auto_13318 ) ) ( not ( = ?auto_13315 ?auto_13310 ) ) ( not ( = ?auto_13315 ?auto_13309 ) ) ( not ( = ?auto_13315 ?auto_13324 ) ) ( not ( = ?auto_13291 ?auto_13296 ) ) ( not ( = ?auto_13291 ?auto_13319 ) ) ( not ( = ?auto_13292 ?auto_13296 ) ) ( not ( = ?auto_13292 ?auto_13319 ) ) ( not ( = ?auto_13293 ?auto_13296 ) ) ( not ( = ?auto_13293 ?auto_13319 ) ) ( not ( = ?auto_13294 ?auto_13296 ) ) ( not ( = ?auto_13294 ?auto_13319 ) ) ( not ( = ?auto_13296 ?auto_13315 ) ) ( not ( = ?auto_13296 ?auto_13310 ) ) ( not ( = ?auto_13296 ?auto_13309 ) ) ( not ( = ?auto_13296 ?auto_13324 ) ) ( not ( = ?auto_13312 ?auto_13320 ) ) ( not ( = ?auto_13312 ?auto_13321 ) ) ( not ( = ?auto_13312 ?auto_13316 ) ) ( not ( = ?auto_13311 ?auto_13314 ) ) ( not ( = ?auto_13311 ?auto_13323 ) ) ( not ( = ?auto_13311 ?auto_13318 ) ) ( not ( = ?auto_13319 ?auto_13315 ) ) ( not ( = ?auto_13319 ?auto_13310 ) ) ( not ( = ?auto_13319 ?auto_13309 ) ) ( not ( = ?auto_13319 ?auto_13324 ) ) ( not ( = ?auto_13291 ?auto_13297 ) ) ( not ( = ?auto_13291 ?auto_13322 ) ) ( not ( = ?auto_13292 ?auto_13297 ) ) ( not ( = ?auto_13292 ?auto_13322 ) ) ( not ( = ?auto_13293 ?auto_13297 ) ) ( not ( = ?auto_13293 ?auto_13322 ) ) ( not ( = ?auto_13294 ?auto_13297 ) ) ( not ( = ?auto_13294 ?auto_13322 ) ) ( not ( = ?auto_13295 ?auto_13297 ) ) ( not ( = ?auto_13295 ?auto_13322 ) ) ( not ( = ?auto_13297 ?auto_13319 ) ) ( not ( = ?auto_13297 ?auto_13315 ) ) ( not ( = ?auto_13297 ?auto_13310 ) ) ( not ( = ?auto_13297 ?auto_13309 ) ) ( not ( = ?auto_13297 ?auto_13324 ) ) ( not ( = ?auto_13322 ?auto_13319 ) ) ( not ( = ?auto_13322 ?auto_13315 ) ) ( not ( = ?auto_13322 ?auto_13310 ) ) ( not ( = ?auto_13322 ?auto_13309 ) ) ( not ( = ?auto_13322 ?auto_13324 ) ) ( not ( = ?auto_13291 ?auto_13298 ) ) ( not ( = ?auto_13291 ?auto_13317 ) ) ( not ( = ?auto_13292 ?auto_13298 ) ) ( not ( = ?auto_13292 ?auto_13317 ) ) ( not ( = ?auto_13293 ?auto_13298 ) ) ( not ( = ?auto_13293 ?auto_13317 ) ) ( not ( = ?auto_13294 ?auto_13298 ) ) ( not ( = ?auto_13294 ?auto_13317 ) ) ( not ( = ?auto_13295 ?auto_13298 ) ) ( not ( = ?auto_13295 ?auto_13317 ) ) ( not ( = ?auto_13296 ?auto_13298 ) ) ( not ( = ?auto_13296 ?auto_13317 ) ) ( not ( = ?auto_13298 ?auto_13322 ) ) ( not ( = ?auto_13298 ?auto_13319 ) ) ( not ( = ?auto_13298 ?auto_13315 ) ) ( not ( = ?auto_13298 ?auto_13310 ) ) ( not ( = ?auto_13298 ?auto_13309 ) ) ( not ( = ?auto_13298 ?auto_13324 ) ) ( not ( = ?auto_13317 ?auto_13322 ) ) ( not ( = ?auto_13317 ?auto_13319 ) ) ( not ( = ?auto_13317 ?auto_13315 ) ) ( not ( = ?auto_13317 ?auto_13310 ) ) ( not ( = ?auto_13317 ?auto_13309 ) ) ( not ( = ?auto_13317 ?auto_13324 ) ) ( not ( = ?auto_13291 ?auto_13299 ) ) ( not ( = ?auto_13291 ?auto_13308 ) ) ( not ( = ?auto_13292 ?auto_13299 ) ) ( not ( = ?auto_13292 ?auto_13308 ) ) ( not ( = ?auto_13293 ?auto_13299 ) ) ( not ( = ?auto_13293 ?auto_13308 ) ) ( not ( = ?auto_13294 ?auto_13299 ) ) ( not ( = ?auto_13294 ?auto_13308 ) ) ( not ( = ?auto_13295 ?auto_13299 ) ) ( not ( = ?auto_13295 ?auto_13308 ) ) ( not ( = ?auto_13296 ?auto_13299 ) ) ( not ( = ?auto_13296 ?auto_13308 ) ) ( not ( = ?auto_13297 ?auto_13299 ) ) ( not ( = ?auto_13297 ?auto_13308 ) ) ( not ( = ?auto_13299 ?auto_13317 ) ) ( not ( = ?auto_13299 ?auto_13322 ) ) ( not ( = ?auto_13299 ?auto_13319 ) ) ( not ( = ?auto_13299 ?auto_13315 ) ) ( not ( = ?auto_13299 ?auto_13310 ) ) ( not ( = ?auto_13299 ?auto_13309 ) ) ( not ( = ?auto_13299 ?auto_13324 ) ) ( not ( = ?auto_13308 ?auto_13317 ) ) ( not ( = ?auto_13308 ?auto_13322 ) ) ( not ( = ?auto_13308 ?auto_13319 ) ) ( not ( = ?auto_13308 ?auto_13315 ) ) ( not ( = ?auto_13308 ?auto_13310 ) ) ( not ( = ?auto_13308 ?auto_13309 ) ) ( not ( = ?auto_13308 ?auto_13324 ) ) ( not ( = ?auto_13291 ?auto_13300 ) ) ( not ( = ?auto_13291 ?auto_13313 ) ) ( not ( = ?auto_13292 ?auto_13300 ) ) ( not ( = ?auto_13292 ?auto_13313 ) ) ( not ( = ?auto_13293 ?auto_13300 ) ) ( not ( = ?auto_13293 ?auto_13313 ) ) ( not ( = ?auto_13294 ?auto_13300 ) ) ( not ( = ?auto_13294 ?auto_13313 ) ) ( not ( = ?auto_13295 ?auto_13300 ) ) ( not ( = ?auto_13295 ?auto_13313 ) ) ( not ( = ?auto_13296 ?auto_13300 ) ) ( not ( = ?auto_13296 ?auto_13313 ) ) ( not ( = ?auto_13297 ?auto_13300 ) ) ( not ( = ?auto_13297 ?auto_13313 ) ) ( not ( = ?auto_13298 ?auto_13300 ) ) ( not ( = ?auto_13298 ?auto_13313 ) ) ( not ( = ?auto_13300 ?auto_13308 ) ) ( not ( = ?auto_13300 ?auto_13317 ) ) ( not ( = ?auto_13300 ?auto_13322 ) ) ( not ( = ?auto_13300 ?auto_13319 ) ) ( not ( = ?auto_13300 ?auto_13315 ) ) ( not ( = ?auto_13300 ?auto_13310 ) ) ( not ( = ?auto_13300 ?auto_13309 ) ) ( not ( = ?auto_13300 ?auto_13324 ) ) ( not ( = ?auto_13313 ?auto_13308 ) ) ( not ( = ?auto_13313 ?auto_13317 ) ) ( not ( = ?auto_13313 ?auto_13322 ) ) ( not ( = ?auto_13313 ?auto_13319 ) ) ( not ( = ?auto_13313 ?auto_13315 ) ) ( not ( = ?auto_13313 ?auto_13310 ) ) ( not ( = ?auto_13313 ?auto_13309 ) ) ( not ( = ?auto_13313 ?auto_13324 ) ) ( not ( = ?auto_13291 ?auto_13301 ) ) ( not ( = ?auto_13291 ?auto_13306 ) ) ( not ( = ?auto_13292 ?auto_13301 ) ) ( not ( = ?auto_13292 ?auto_13306 ) ) ( not ( = ?auto_13293 ?auto_13301 ) ) ( not ( = ?auto_13293 ?auto_13306 ) ) ( not ( = ?auto_13294 ?auto_13301 ) ) ( not ( = ?auto_13294 ?auto_13306 ) ) ( not ( = ?auto_13295 ?auto_13301 ) ) ( not ( = ?auto_13295 ?auto_13306 ) ) ( not ( = ?auto_13296 ?auto_13301 ) ) ( not ( = ?auto_13296 ?auto_13306 ) ) ( not ( = ?auto_13297 ?auto_13301 ) ) ( not ( = ?auto_13297 ?auto_13306 ) ) ( not ( = ?auto_13298 ?auto_13301 ) ) ( not ( = ?auto_13298 ?auto_13306 ) ) ( not ( = ?auto_13299 ?auto_13301 ) ) ( not ( = ?auto_13299 ?auto_13306 ) ) ( not ( = ?auto_13301 ?auto_13313 ) ) ( not ( = ?auto_13301 ?auto_13308 ) ) ( not ( = ?auto_13301 ?auto_13317 ) ) ( not ( = ?auto_13301 ?auto_13322 ) ) ( not ( = ?auto_13301 ?auto_13319 ) ) ( not ( = ?auto_13301 ?auto_13315 ) ) ( not ( = ?auto_13301 ?auto_13310 ) ) ( not ( = ?auto_13301 ?auto_13309 ) ) ( not ( = ?auto_13301 ?auto_13324 ) ) ( not ( = ?auto_13305 ?auto_13321 ) ) ( not ( = ?auto_13305 ?auto_13312 ) ) ( not ( = ?auto_13305 ?auto_13316 ) ) ( not ( = ?auto_13305 ?auto_13320 ) ) ( not ( = ?auto_13307 ?auto_13323 ) ) ( not ( = ?auto_13307 ?auto_13311 ) ) ( not ( = ?auto_13307 ?auto_13318 ) ) ( not ( = ?auto_13307 ?auto_13314 ) ) ( not ( = ?auto_13306 ?auto_13313 ) ) ( not ( = ?auto_13306 ?auto_13308 ) ) ( not ( = ?auto_13306 ?auto_13317 ) ) ( not ( = ?auto_13306 ?auto_13322 ) ) ( not ( = ?auto_13306 ?auto_13319 ) ) ( not ( = ?auto_13306 ?auto_13315 ) ) ( not ( = ?auto_13306 ?auto_13310 ) ) ( not ( = ?auto_13306 ?auto_13309 ) ) ( not ( = ?auto_13306 ?auto_13324 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_13291 ?auto_13292 ?auto_13293 ?auto_13294 ?auto_13295 ?auto_13296 ?auto_13297 ?auto_13298 ?auto_13299 ?auto_13300 )
      ( MAKE-1CRATE ?auto_13300 ?auto_13301 )
      ( MAKE-10CRATE-VERIFY ?auto_13291 ?auto_13292 ?auto_13293 ?auto_13294 ?auto_13295 ?auto_13296 ?auto_13297 ?auto_13298 ?auto_13299 ?auto_13300 ?auto_13301 ) )
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
      ?auto_13353 - SURFACE
      ?auto_13354 - SURFACE
      ?auto_13355 - SURFACE
      ?auto_13356 - SURFACE
      ?auto_13357 - SURFACE
      ?auto_13358 - SURFACE
    )
    :vars
    (
      ?auto_13361 - HOIST
      ?auto_13362 - PLACE
      ?auto_13364 - PLACE
      ?auto_13363 - HOIST
      ?auto_13360 - SURFACE
      ?auto_13381 - PLACE
      ?auto_13370 - HOIST
      ?auto_13375 - SURFACE
      ?auto_13378 - PLACE
      ?auto_13373 - HOIST
      ?auto_13369 - SURFACE
      ?auto_13366 - SURFACE
      ?auto_13380 - SURFACE
      ?auto_13374 - PLACE
      ?auto_13379 - HOIST
      ?auto_13371 - SURFACE
      ?auto_13368 - SURFACE
      ?auto_13382 - PLACE
      ?auto_13372 - HOIST
      ?auto_13377 - SURFACE
      ?auto_13376 - SURFACE
      ?auto_13367 - SURFACE
      ?auto_13365 - SURFACE
      ?auto_13359 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13361 ?auto_13362 ) ( IS-CRATE ?auto_13358 ) ( not ( = ?auto_13364 ?auto_13362 ) ) ( HOIST-AT ?auto_13363 ?auto_13364 ) ( SURFACE-AT ?auto_13358 ?auto_13364 ) ( ON ?auto_13358 ?auto_13360 ) ( CLEAR ?auto_13358 ) ( not ( = ?auto_13357 ?auto_13358 ) ) ( not ( = ?auto_13357 ?auto_13360 ) ) ( not ( = ?auto_13358 ?auto_13360 ) ) ( not ( = ?auto_13361 ?auto_13363 ) ) ( IS-CRATE ?auto_13357 ) ( not ( = ?auto_13381 ?auto_13362 ) ) ( HOIST-AT ?auto_13370 ?auto_13381 ) ( AVAILABLE ?auto_13370 ) ( SURFACE-AT ?auto_13357 ?auto_13381 ) ( ON ?auto_13357 ?auto_13375 ) ( CLEAR ?auto_13357 ) ( not ( = ?auto_13356 ?auto_13357 ) ) ( not ( = ?auto_13356 ?auto_13375 ) ) ( not ( = ?auto_13357 ?auto_13375 ) ) ( not ( = ?auto_13361 ?auto_13370 ) ) ( IS-CRATE ?auto_13356 ) ( not ( = ?auto_13378 ?auto_13362 ) ) ( HOIST-AT ?auto_13373 ?auto_13378 ) ( SURFACE-AT ?auto_13356 ?auto_13378 ) ( ON ?auto_13356 ?auto_13369 ) ( CLEAR ?auto_13356 ) ( not ( = ?auto_13355 ?auto_13356 ) ) ( not ( = ?auto_13355 ?auto_13369 ) ) ( not ( = ?auto_13356 ?auto_13369 ) ) ( not ( = ?auto_13361 ?auto_13373 ) ) ( IS-CRATE ?auto_13355 ) ( SURFACE-AT ?auto_13355 ?auto_13364 ) ( ON ?auto_13355 ?auto_13366 ) ( CLEAR ?auto_13355 ) ( not ( = ?auto_13354 ?auto_13355 ) ) ( not ( = ?auto_13354 ?auto_13366 ) ) ( not ( = ?auto_13355 ?auto_13366 ) ) ( IS-CRATE ?auto_13354 ) ( SURFACE-AT ?auto_13354 ?auto_13378 ) ( ON ?auto_13354 ?auto_13380 ) ( CLEAR ?auto_13354 ) ( not ( = ?auto_13353 ?auto_13354 ) ) ( not ( = ?auto_13353 ?auto_13380 ) ) ( not ( = ?auto_13354 ?auto_13380 ) ) ( IS-CRATE ?auto_13353 ) ( not ( = ?auto_13374 ?auto_13362 ) ) ( HOIST-AT ?auto_13379 ?auto_13374 ) ( SURFACE-AT ?auto_13353 ?auto_13374 ) ( ON ?auto_13353 ?auto_13371 ) ( CLEAR ?auto_13353 ) ( not ( = ?auto_13352 ?auto_13353 ) ) ( not ( = ?auto_13352 ?auto_13371 ) ) ( not ( = ?auto_13353 ?auto_13371 ) ) ( not ( = ?auto_13361 ?auto_13379 ) ) ( IS-CRATE ?auto_13352 ) ( AVAILABLE ?auto_13363 ) ( SURFACE-AT ?auto_13352 ?auto_13364 ) ( ON ?auto_13352 ?auto_13368 ) ( CLEAR ?auto_13352 ) ( not ( = ?auto_13351 ?auto_13352 ) ) ( not ( = ?auto_13351 ?auto_13368 ) ) ( not ( = ?auto_13352 ?auto_13368 ) ) ( IS-CRATE ?auto_13351 ) ( not ( = ?auto_13382 ?auto_13362 ) ) ( HOIST-AT ?auto_13372 ?auto_13382 ) ( AVAILABLE ?auto_13372 ) ( SURFACE-AT ?auto_13351 ?auto_13382 ) ( ON ?auto_13351 ?auto_13377 ) ( CLEAR ?auto_13351 ) ( not ( = ?auto_13350 ?auto_13351 ) ) ( not ( = ?auto_13350 ?auto_13377 ) ) ( not ( = ?auto_13351 ?auto_13377 ) ) ( not ( = ?auto_13361 ?auto_13372 ) ) ( IS-CRATE ?auto_13350 ) ( SURFACE-AT ?auto_13350 ?auto_13378 ) ( ON ?auto_13350 ?auto_13376 ) ( CLEAR ?auto_13350 ) ( not ( = ?auto_13349 ?auto_13350 ) ) ( not ( = ?auto_13349 ?auto_13376 ) ) ( not ( = ?auto_13350 ?auto_13376 ) ) ( IS-CRATE ?auto_13349 ) ( AVAILABLE ?auto_13379 ) ( SURFACE-AT ?auto_13349 ?auto_13374 ) ( ON ?auto_13349 ?auto_13367 ) ( CLEAR ?auto_13349 ) ( not ( = ?auto_13348 ?auto_13349 ) ) ( not ( = ?auto_13348 ?auto_13367 ) ) ( not ( = ?auto_13349 ?auto_13367 ) ) ( SURFACE-AT ?auto_13347 ?auto_13362 ) ( CLEAR ?auto_13347 ) ( IS-CRATE ?auto_13348 ) ( AVAILABLE ?auto_13361 ) ( AVAILABLE ?auto_13373 ) ( SURFACE-AT ?auto_13348 ?auto_13378 ) ( ON ?auto_13348 ?auto_13365 ) ( CLEAR ?auto_13348 ) ( TRUCK-AT ?auto_13359 ?auto_13362 ) ( not ( = ?auto_13347 ?auto_13348 ) ) ( not ( = ?auto_13347 ?auto_13365 ) ) ( not ( = ?auto_13348 ?auto_13365 ) ) ( not ( = ?auto_13347 ?auto_13349 ) ) ( not ( = ?auto_13347 ?auto_13367 ) ) ( not ( = ?auto_13349 ?auto_13365 ) ) ( not ( = ?auto_13374 ?auto_13378 ) ) ( not ( = ?auto_13379 ?auto_13373 ) ) ( not ( = ?auto_13367 ?auto_13365 ) ) ( not ( = ?auto_13347 ?auto_13350 ) ) ( not ( = ?auto_13347 ?auto_13376 ) ) ( not ( = ?auto_13348 ?auto_13350 ) ) ( not ( = ?auto_13348 ?auto_13376 ) ) ( not ( = ?auto_13350 ?auto_13367 ) ) ( not ( = ?auto_13350 ?auto_13365 ) ) ( not ( = ?auto_13376 ?auto_13367 ) ) ( not ( = ?auto_13376 ?auto_13365 ) ) ( not ( = ?auto_13347 ?auto_13351 ) ) ( not ( = ?auto_13347 ?auto_13377 ) ) ( not ( = ?auto_13348 ?auto_13351 ) ) ( not ( = ?auto_13348 ?auto_13377 ) ) ( not ( = ?auto_13349 ?auto_13351 ) ) ( not ( = ?auto_13349 ?auto_13377 ) ) ( not ( = ?auto_13351 ?auto_13376 ) ) ( not ( = ?auto_13351 ?auto_13367 ) ) ( not ( = ?auto_13351 ?auto_13365 ) ) ( not ( = ?auto_13382 ?auto_13378 ) ) ( not ( = ?auto_13382 ?auto_13374 ) ) ( not ( = ?auto_13372 ?auto_13373 ) ) ( not ( = ?auto_13372 ?auto_13379 ) ) ( not ( = ?auto_13377 ?auto_13376 ) ) ( not ( = ?auto_13377 ?auto_13367 ) ) ( not ( = ?auto_13377 ?auto_13365 ) ) ( not ( = ?auto_13347 ?auto_13352 ) ) ( not ( = ?auto_13347 ?auto_13368 ) ) ( not ( = ?auto_13348 ?auto_13352 ) ) ( not ( = ?auto_13348 ?auto_13368 ) ) ( not ( = ?auto_13349 ?auto_13352 ) ) ( not ( = ?auto_13349 ?auto_13368 ) ) ( not ( = ?auto_13350 ?auto_13352 ) ) ( not ( = ?auto_13350 ?auto_13368 ) ) ( not ( = ?auto_13352 ?auto_13377 ) ) ( not ( = ?auto_13352 ?auto_13376 ) ) ( not ( = ?auto_13352 ?auto_13367 ) ) ( not ( = ?auto_13352 ?auto_13365 ) ) ( not ( = ?auto_13364 ?auto_13382 ) ) ( not ( = ?auto_13364 ?auto_13378 ) ) ( not ( = ?auto_13364 ?auto_13374 ) ) ( not ( = ?auto_13363 ?auto_13372 ) ) ( not ( = ?auto_13363 ?auto_13373 ) ) ( not ( = ?auto_13363 ?auto_13379 ) ) ( not ( = ?auto_13368 ?auto_13377 ) ) ( not ( = ?auto_13368 ?auto_13376 ) ) ( not ( = ?auto_13368 ?auto_13367 ) ) ( not ( = ?auto_13368 ?auto_13365 ) ) ( not ( = ?auto_13347 ?auto_13353 ) ) ( not ( = ?auto_13347 ?auto_13371 ) ) ( not ( = ?auto_13348 ?auto_13353 ) ) ( not ( = ?auto_13348 ?auto_13371 ) ) ( not ( = ?auto_13349 ?auto_13353 ) ) ( not ( = ?auto_13349 ?auto_13371 ) ) ( not ( = ?auto_13350 ?auto_13353 ) ) ( not ( = ?auto_13350 ?auto_13371 ) ) ( not ( = ?auto_13351 ?auto_13353 ) ) ( not ( = ?auto_13351 ?auto_13371 ) ) ( not ( = ?auto_13353 ?auto_13368 ) ) ( not ( = ?auto_13353 ?auto_13377 ) ) ( not ( = ?auto_13353 ?auto_13376 ) ) ( not ( = ?auto_13353 ?auto_13367 ) ) ( not ( = ?auto_13353 ?auto_13365 ) ) ( not ( = ?auto_13371 ?auto_13368 ) ) ( not ( = ?auto_13371 ?auto_13377 ) ) ( not ( = ?auto_13371 ?auto_13376 ) ) ( not ( = ?auto_13371 ?auto_13367 ) ) ( not ( = ?auto_13371 ?auto_13365 ) ) ( not ( = ?auto_13347 ?auto_13354 ) ) ( not ( = ?auto_13347 ?auto_13380 ) ) ( not ( = ?auto_13348 ?auto_13354 ) ) ( not ( = ?auto_13348 ?auto_13380 ) ) ( not ( = ?auto_13349 ?auto_13354 ) ) ( not ( = ?auto_13349 ?auto_13380 ) ) ( not ( = ?auto_13350 ?auto_13354 ) ) ( not ( = ?auto_13350 ?auto_13380 ) ) ( not ( = ?auto_13351 ?auto_13354 ) ) ( not ( = ?auto_13351 ?auto_13380 ) ) ( not ( = ?auto_13352 ?auto_13354 ) ) ( not ( = ?auto_13352 ?auto_13380 ) ) ( not ( = ?auto_13354 ?auto_13371 ) ) ( not ( = ?auto_13354 ?auto_13368 ) ) ( not ( = ?auto_13354 ?auto_13377 ) ) ( not ( = ?auto_13354 ?auto_13376 ) ) ( not ( = ?auto_13354 ?auto_13367 ) ) ( not ( = ?auto_13354 ?auto_13365 ) ) ( not ( = ?auto_13380 ?auto_13371 ) ) ( not ( = ?auto_13380 ?auto_13368 ) ) ( not ( = ?auto_13380 ?auto_13377 ) ) ( not ( = ?auto_13380 ?auto_13376 ) ) ( not ( = ?auto_13380 ?auto_13367 ) ) ( not ( = ?auto_13380 ?auto_13365 ) ) ( not ( = ?auto_13347 ?auto_13355 ) ) ( not ( = ?auto_13347 ?auto_13366 ) ) ( not ( = ?auto_13348 ?auto_13355 ) ) ( not ( = ?auto_13348 ?auto_13366 ) ) ( not ( = ?auto_13349 ?auto_13355 ) ) ( not ( = ?auto_13349 ?auto_13366 ) ) ( not ( = ?auto_13350 ?auto_13355 ) ) ( not ( = ?auto_13350 ?auto_13366 ) ) ( not ( = ?auto_13351 ?auto_13355 ) ) ( not ( = ?auto_13351 ?auto_13366 ) ) ( not ( = ?auto_13352 ?auto_13355 ) ) ( not ( = ?auto_13352 ?auto_13366 ) ) ( not ( = ?auto_13353 ?auto_13355 ) ) ( not ( = ?auto_13353 ?auto_13366 ) ) ( not ( = ?auto_13355 ?auto_13380 ) ) ( not ( = ?auto_13355 ?auto_13371 ) ) ( not ( = ?auto_13355 ?auto_13368 ) ) ( not ( = ?auto_13355 ?auto_13377 ) ) ( not ( = ?auto_13355 ?auto_13376 ) ) ( not ( = ?auto_13355 ?auto_13367 ) ) ( not ( = ?auto_13355 ?auto_13365 ) ) ( not ( = ?auto_13366 ?auto_13380 ) ) ( not ( = ?auto_13366 ?auto_13371 ) ) ( not ( = ?auto_13366 ?auto_13368 ) ) ( not ( = ?auto_13366 ?auto_13377 ) ) ( not ( = ?auto_13366 ?auto_13376 ) ) ( not ( = ?auto_13366 ?auto_13367 ) ) ( not ( = ?auto_13366 ?auto_13365 ) ) ( not ( = ?auto_13347 ?auto_13356 ) ) ( not ( = ?auto_13347 ?auto_13369 ) ) ( not ( = ?auto_13348 ?auto_13356 ) ) ( not ( = ?auto_13348 ?auto_13369 ) ) ( not ( = ?auto_13349 ?auto_13356 ) ) ( not ( = ?auto_13349 ?auto_13369 ) ) ( not ( = ?auto_13350 ?auto_13356 ) ) ( not ( = ?auto_13350 ?auto_13369 ) ) ( not ( = ?auto_13351 ?auto_13356 ) ) ( not ( = ?auto_13351 ?auto_13369 ) ) ( not ( = ?auto_13352 ?auto_13356 ) ) ( not ( = ?auto_13352 ?auto_13369 ) ) ( not ( = ?auto_13353 ?auto_13356 ) ) ( not ( = ?auto_13353 ?auto_13369 ) ) ( not ( = ?auto_13354 ?auto_13356 ) ) ( not ( = ?auto_13354 ?auto_13369 ) ) ( not ( = ?auto_13356 ?auto_13366 ) ) ( not ( = ?auto_13356 ?auto_13380 ) ) ( not ( = ?auto_13356 ?auto_13371 ) ) ( not ( = ?auto_13356 ?auto_13368 ) ) ( not ( = ?auto_13356 ?auto_13377 ) ) ( not ( = ?auto_13356 ?auto_13376 ) ) ( not ( = ?auto_13356 ?auto_13367 ) ) ( not ( = ?auto_13356 ?auto_13365 ) ) ( not ( = ?auto_13369 ?auto_13366 ) ) ( not ( = ?auto_13369 ?auto_13380 ) ) ( not ( = ?auto_13369 ?auto_13371 ) ) ( not ( = ?auto_13369 ?auto_13368 ) ) ( not ( = ?auto_13369 ?auto_13377 ) ) ( not ( = ?auto_13369 ?auto_13376 ) ) ( not ( = ?auto_13369 ?auto_13367 ) ) ( not ( = ?auto_13369 ?auto_13365 ) ) ( not ( = ?auto_13347 ?auto_13357 ) ) ( not ( = ?auto_13347 ?auto_13375 ) ) ( not ( = ?auto_13348 ?auto_13357 ) ) ( not ( = ?auto_13348 ?auto_13375 ) ) ( not ( = ?auto_13349 ?auto_13357 ) ) ( not ( = ?auto_13349 ?auto_13375 ) ) ( not ( = ?auto_13350 ?auto_13357 ) ) ( not ( = ?auto_13350 ?auto_13375 ) ) ( not ( = ?auto_13351 ?auto_13357 ) ) ( not ( = ?auto_13351 ?auto_13375 ) ) ( not ( = ?auto_13352 ?auto_13357 ) ) ( not ( = ?auto_13352 ?auto_13375 ) ) ( not ( = ?auto_13353 ?auto_13357 ) ) ( not ( = ?auto_13353 ?auto_13375 ) ) ( not ( = ?auto_13354 ?auto_13357 ) ) ( not ( = ?auto_13354 ?auto_13375 ) ) ( not ( = ?auto_13355 ?auto_13357 ) ) ( not ( = ?auto_13355 ?auto_13375 ) ) ( not ( = ?auto_13357 ?auto_13369 ) ) ( not ( = ?auto_13357 ?auto_13366 ) ) ( not ( = ?auto_13357 ?auto_13380 ) ) ( not ( = ?auto_13357 ?auto_13371 ) ) ( not ( = ?auto_13357 ?auto_13368 ) ) ( not ( = ?auto_13357 ?auto_13377 ) ) ( not ( = ?auto_13357 ?auto_13376 ) ) ( not ( = ?auto_13357 ?auto_13367 ) ) ( not ( = ?auto_13357 ?auto_13365 ) ) ( not ( = ?auto_13381 ?auto_13378 ) ) ( not ( = ?auto_13381 ?auto_13364 ) ) ( not ( = ?auto_13381 ?auto_13374 ) ) ( not ( = ?auto_13381 ?auto_13382 ) ) ( not ( = ?auto_13370 ?auto_13373 ) ) ( not ( = ?auto_13370 ?auto_13363 ) ) ( not ( = ?auto_13370 ?auto_13379 ) ) ( not ( = ?auto_13370 ?auto_13372 ) ) ( not ( = ?auto_13375 ?auto_13369 ) ) ( not ( = ?auto_13375 ?auto_13366 ) ) ( not ( = ?auto_13375 ?auto_13380 ) ) ( not ( = ?auto_13375 ?auto_13371 ) ) ( not ( = ?auto_13375 ?auto_13368 ) ) ( not ( = ?auto_13375 ?auto_13377 ) ) ( not ( = ?auto_13375 ?auto_13376 ) ) ( not ( = ?auto_13375 ?auto_13367 ) ) ( not ( = ?auto_13375 ?auto_13365 ) ) ( not ( = ?auto_13347 ?auto_13358 ) ) ( not ( = ?auto_13347 ?auto_13360 ) ) ( not ( = ?auto_13348 ?auto_13358 ) ) ( not ( = ?auto_13348 ?auto_13360 ) ) ( not ( = ?auto_13349 ?auto_13358 ) ) ( not ( = ?auto_13349 ?auto_13360 ) ) ( not ( = ?auto_13350 ?auto_13358 ) ) ( not ( = ?auto_13350 ?auto_13360 ) ) ( not ( = ?auto_13351 ?auto_13358 ) ) ( not ( = ?auto_13351 ?auto_13360 ) ) ( not ( = ?auto_13352 ?auto_13358 ) ) ( not ( = ?auto_13352 ?auto_13360 ) ) ( not ( = ?auto_13353 ?auto_13358 ) ) ( not ( = ?auto_13353 ?auto_13360 ) ) ( not ( = ?auto_13354 ?auto_13358 ) ) ( not ( = ?auto_13354 ?auto_13360 ) ) ( not ( = ?auto_13355 ?auto_13358 ) ) ( not ( = ?auto_13355 ?auto_13360 ) ) ( not ( = ?auto_13356 ?auto_13358 ) ) ( not ( = ?auto_13356 ?auto_13360 ) ) ( not ( = ?auto_13358 ?auto_13375 ) ) ( not ( = ?auto_13358 ?auto_13369 ) ) ( not ( = ?auto_13358 ?auto_13366 ) ) ( not ( = ?auto_13358 ?auto_13380 ) ) ( not ( = ?auto_13358 ?auto_13371 ) ) ( not ( = ?auto_13358 ?auto_13368 ) ) ( not ( = ?auto_13358 ?auto_13377 ) ) ( not ( = ?auto_13358 ?auto_13376 ) ) ( not ( = ?auto_13358 ?auto_13367 ) ) ( not ( = ?auto_13358 ?auto_13365 ) ) ( not ( = ?auto_13360 ?auto_13375 ) ) ( not ( = ?auto_13360 ?auto_13369 ) ) ( not ( = ?auto_13360 ?auto_13366 ) ) ( not ( = ?auto_13360 ?auto_13380 ) ) ( not ( = ?auto_13360 ?auto_13371 ) ) ( not ( = ?auto_13360 ?auto_13368 ) ) ( not ( = ?auto_13360 ?auto_13377 ) ) ( not ( = ?auto_13360 ?auto_13376 ) ) ( not ( = ?auto_13360 ?auto_13367 ) ) ( not ( = ?auto_13360 ?auto_13365 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_13347 ?auto_13348 ?auto_13349 ?auto_13350 ?auto_13351 ?auto_13352 ?auto_13353 ?auto_13354 ?auto_13355 ?auto_13356 ?auto_13357 )
      ( MAKE-1CRATE ?auto_13357 ?auto_13358 )
      ( MAKE-11CRATE-VERIFY ?auto_13347 ?auto_13348 ?auto_13349 ?auto_13350 ?auto_13351 ?auto_13352 ?auto_13353 ?auto_13354 ?auto_13355 ?auto_13356 ?auto_13357 ?auto_13358 ) )
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
      ?auto_13412 - SURFACE
      ?auto_13413 - SURFACE
      ?auto_13414 - SURFACE
      ?auto_13415 - SURFACE
      ?auto_13416 - SURFACE
      ?auto_13417 - SURFACE
      ?auto_13418 - SURFACE
    )
    :vars
    (
      ?auto_13421 - HOIST
      ?auto_13419 - PLACE
      ?auto_13422 - PLACE
      ?auto_13420 - HOIST
      ?auto_13424 - SURFACE
      ?auto_13435 - PLACE
      ?auto_13427 - HOIST
      ?auto_13425 - SURFACE
      ?auto_13429 - PLACE
      ?auto_13438 - HOIST
      ?auto_13434 - SURFACE
      ?auto_13428 - PLACE
      ?auto_13439 - HOIST
      ?auto_13426 - SURFACE
      ?auto_13432 - SURFACE
      ?auto_13430 - SURFACE
      ?auto_13442 - SURFACE
      ?auto_13433 - SURFACE
      ?auto_13443 - PLACE
      ?auto_13441 - HOIST
      ?auto_13431 - SURFACE
      ?auto_13437 - SURFACE
      ?auto_13440 - SURFACE
      ?auto_13436 - SURFACE
      ?auto_13423 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13421 ?auto_13419 ) ( IS-CRATE ?auto_13418 ) ( not ( = ?auto_13422 ?auto_13419 ) ) ( HOIST-AT ?auto_13420 ?auto_13422 ) ( SURFACE-AT ?auto_13418 ?auto_13422 ) ( ON ?auto_13418 ?auto_13424 ) ( CLEAR ?auto_13418 ) ( not ( = ?auto_13417 ?auto_13418 ) ) ( not ( = ?auto_13417 ?auto_13424 ) ) ( not ( = ?auto_13418 ?auto_13424 ) ) ( not ( = ?auto_13421 ?auto_13420 ) ) ( IS-CRATE ?auto_13417 ) ( not ( = ?auto_13435 ?auto_13419 ) ) ( HOIST-AT ?auto_13427 ?auto_13435 ) ( SURFACE-AT ?auto_13417 ?auto_13435 ) ( ON ?auto_13417 ?auto_13425 ) ( CLEAR ?auto_13417 ) ( not ( = ?auto_13416 ?auto_13417 ) ) ( not ( = ?auto_13416 ?auto_13425 ) ) ( not ( = ?auto_13417 ?auto_13425 ) ) ( not ( = ?auto_13421 ?auto_13427 ) ) ( IS-CRATE ?auto_13416 ) ( not ( = ?auto_13429 ?auto_13419 ) ) ( HOIST-AT ?auto_13438 ?auto_13429 ) ( AVAILABLE ?auto_13438 ) ( SURFACE-AT ?auto_13416 ?auto_13429 ) ( ON ?auto_13416 ?auto_13434 ) ( CLEAR ?auto_13416 ) ( not ( = ?auto_13415 ?auto_13416 ) ) ( not ( = ?auto_13415 ?auto_13434 ) ) ( not ( = ?auto_13416 ?auto_13434 ) ) ( not ( = ?auto_13421 ?auto_13438 ) ) ( IS-CRATE ?auto_13415 ) ( not ( = ?auto_13428 ?auto_13419 ) ) ( HOIST-AT ?auto_13439 ?auto_13428 ) ( SURFACE-AT ?auto_13415 ?auto_13428 ) ( ON ?auto_13415 ?auto_13426 ) ( CLEAR ?auto_13415 ) ( not ( = ?auto_13414 ?auto_13415 ) ) ( not ( = ?auto_13414 ?auto_13426 ) ) ( not ( = ?auto_13415 ?auto_13426 ) ) ( not ( = ?auto_13421 ?auto_13439 ) ) ( IS-CRATE ?auto_13414 ) ( SURFACE-AT ?auto_13414 ?auto_13435 ) ( ON ?auto_13414 ?auto_13432 ) ( CLEAR ?auto_13414 ) ( not ( = ?auto_13413 ?auto_13414 ) ) ( not ( = ?auto_13413 ?auto_13432 ) ) ( not ( = ?auto_13414 ?auto_13432 ) ) ( IS-CRATE ?auto_13413 ) ( SURFACE-AT ?auto_13413 ?auto_13428 ) ( ON ?auto_13413 ?auto_13430 ) ( CLEAR ?auto_13413 ) ( not ( = ?auto_13412 ?auto_13413 ) ) ( not ( = ?auto_13412 ?auto_13430 ) ) ( not ( = ?auto_13413 ?auto_13430 ) ) ( IS-CRATE ?auto_13412 ) ( SURFACE-AT ?auto_13412 ?auto_13422 ) ( ON ?auto_13412 ?auto_13442 ) ( CLEAR ?auto_13412 ) ( not ( = ?auto_13411 ?auto_13412 ) ) ( not ( = ?auto_13411 ?auto_13442 ) ) ( not ( = ?auto_13412 ?auto_13442 ) ) ( IS-CRATE ?auto_13411 ) ( AVAILABLE ?auto_13427 ) ( SURFACE-AT ?auto_13411 ?auto_13435 ) ( ON ?auto_13411 ?auto_13433 ) ( CLEAR ?auto_13411 ) ( not ( = ?auto_13410 ?auto_13411 ) ) ( not ( = ?auto_13410 ?auto_13433 ) ) ( not ( = ?auto_13411 ?auto_13433 ) ) ( IS-CRATE ?auto_13410 ) ( not ( = ?auto_13443 ?auto_13419 ) ) ( HOIST-AT ?auto_13441 ?auto_13443 ) ( AVAILABLE ?auto_13441 ) ( SURFACE-AT ?auto_13410 ?auto_13443 ) ( ON ?auto_13410 ?auto_13431 ) ( CLEAR ?auto_13410 ) ( not ( = ?auto_13409 ?auto_13410 ) ) ( not ( = ?auto_13409 ?auto_13431 ) ) ( not ( = ?auto_13410 ?auto_13431 ) ) ( not ( = ?auto_13421 ?auto_13441 ) ) ( IS-CRATE ?auto_13409 ) ( SURFACE-AT ?auto_13409 ?auto_13428 ) ( ON ?auto_13409 ?auto_13437 ) ( CLEAR ?auto_13409 ) ( not ( = ?auto_13408 ?auto_13409 ) ) ( not ( = ?auto_13408 ?auto_13437 ) ) ( not ( = ?auto_13409 ?auto_13437 ) ) ( IS-CRATE ?auto_13408 ) ( AVAILABLE ?auto_13420 ) ( SURFACE-AT ?auto_13408 ?auto_13422 ) ( ON ?auto_13408 ?auto_13440 ) ( CLEAR ?auto_13408 ) ( not ( = ?auto_13407 ?auto_13408 ) ) ( not ( = ?auto_13407 ?auto_13440 ) ) ( not ( = ?auto_13408 ?auto_13440 ) ) ( SURFACE-AT ?auto_13406 ?auto_13419 ) ( CLEAR ?auto_13406 ) ( IS-CRATE ?auto_13407 ) ( AVAILABLE ?auto_13421 ) ( AVAILABLE ?auto_13439 ) ( SURFACE-AT ?auto_13407 ?auto_13428 ) ( ON ?auto_13407 ?auto_13436 ) ( CLEAR ?auto_13407 ) ( TRUCK-AT ?auto_13423 ?auto_13419 ) ( not ( = ?auto_13406 ?auto_13407 ) ) ( not ( = ?auto_13406 ?auto_13436 ) ) ( not ( = ?auto_13407 ?auto_13436 ) ) ( not ( = ?auto_13406 ?auto_13408 ) ) ( not ( = ?auto_13406 ?auto_13440 ) ) ( not ( = ?auto_13408 ?auto_13436 ) ) ( not ( = ?auto_13422 ?auto_13428 ) ) ( not ( = ?auto_13420 ?auto_13439 ) ) ( not ( = ?auto_13440 ?auto_13436 ) ) ( not ( = ?auto_13406 ?auto_13409 ) ) ( not ( = ?auto_13406 ?auto_13437 ) ) ( not ( = ?auto_13407 ?auto_13409 ) ) ( not ( = ?auto_13407 ?auto_13437 ) ) ( not ( = ?auto_13409 ?auto_13440 ) ) ( not ( = ?auto_13409 ?auto_13436 ) ) ( not ( = ?auto_13437 ?auto_13440 ) ) ( not ( = ?auto_13437 ?auto_13436 ) ) ( not ( = ?auto_13406 ?auto_13410 ) ) ( not ( = ?auto_13406 ?auto_13431 ) ) ( not ( = ?auto_13407 ?auto_13410 ) ) ( not ( = ?auto_13407 ?auto_13431 ) ) ( not ( = ?auto_13408 ?auto_13410 ) ) ( not ( = ?auto_13408 ?auto_13431 ) ) ( not ( = ?auto_13410 ?auto_13437 ) ) ( not ( = ?auto_13410 ?auto_13440 ) ) ( not ( = ?auto_13410 ?auto_13436 ) ) ( not ( = ?auto_13443 ?auto_13428 ) ) ( not ( = ?auto_13443 ?auto_13422 ) ) ( not ( = ?auto_13441 ?auto_13439 ) ) ( not ( = ?auto_13441 ?auto_13420 ) ) ( not ( = ?auto_13431 ?auto_13437 ) ) ( not ( = ?auto_13431 ?auto_13440 ) ) ( not ( = ?auto_13431 ?auto_13436 ) ) ( not ( = ?auto_13406 ?auto_13411 ) ) ( not ( = ?auto_13406 ?auto_13433 ) ) ( not ( = ?auto_13407 ?auto_13411 ) ) ( not ( = ?auto_13407 ?auto_13433 ) ) ( not ( = ?auto_13408 ?auto_13411 ) ) ( not ( = ?auto_13408 ?auto_13433 ) ) ( not ( = ?auto_13409 ?auto_13411 ) ) ( not ( = ?auto_13409 ?auto_13433 ) ) ( not ( = ?auto_13411 ?auto_13431 ) ) ( not ( = ?auto_13411 ?auto_13437 ) ) ( not ( = ?auto_13411 ?auto_13440 ) ) ( not ( = ?auto_13411 ?auto_13436 ) ) ( not ( = ?auto_13435 ?auto_13443 ) ) ( not ( = ?auto_13435 ?auto_13428 ) ) ( not ( = ?auto_13435 ?auto_13422 ) ) ( not ( = ?auto_13427 ?auto_13441 ) ) ( not ( = ?auto_13427 ?auto_13439 ) ) ( not ( = ?auto_13427 ?auto_13420 ) ) ( not ( = ?auto_13433 ?auto_13431 ) ) ( not ( = ?auto_13433 ?auto_13437 ) ) ( not ( = ?auto_13433 ?auto_13440 ) ) ( not ( = ?auto_13433 ?auto_13436 ) ) ( not ( = ?auto_13406 ?auto_13412 ) ) ( not ( = ?auto_13406 ?auto_13442 ) ) ( not ( = ?auto_13407 ?auto_13412 ) ) ( not ( = ?auto_13407 ?auto_13442 ) ) ( not ( = ?auto_13408 ?auto_13412 ) ) ( not ( = ?auto_13408 ?auto_13442 ) ) ( not ( = ?auto_13409 ?auto_13412 ) ) ( not ( = ?auto_13409 ?auto_13442 ) ) ( not ( = ?auto_13410 ?auto_13412 ) ) ( not ( = ?auto_13410 ?auto_13442 ) ) ( not ( = ?auto_13412 ?auto_13433 ) ) ( not ( = ?auto_13412 ?auto_13431 ) ) ( not ( = ?auto_13412 ?auto_13437 ) ) ( not ( = ?auto_13412 ?auto_13440 ) ) ( not ( = ?auto_13412 ?auto_13436 ) ) ( not ( = ?auto_13442 ?auto_13433 ) ) ( not ( = ?auto_13442 ?auto_13431 ) ) ( not ( = ?auto_13442 ?auto_13437 ) ) ( not ( = ?auto_13442 ?auto_13440 ) ) ( not ( = ?auto_13442 ?auto_13436 ) ) ( not ( = ?auto_13406 ?auto_13413 ) ) ( not ( = ?auto_13406 ?auto_13430 ) ) ( not ( = ?auto_13407 ?auto_13413 ) ) ( not ( = ?auto_13407 ?auto_13430 ) ) ( not ( = ?auto_13408 ?auto_13413 ) ) ( not ( = ?auto_13408 ?auto_13430 ) ) ( not ( = ?auto_13409 ?auto_13413 ) ) ( not ( = ?auto_13409 ?auto_13430 ) ) ( not ( = ?auto_13410 ?auto_13413 ) ) ( not ( = ?auto_13410 ?auto_13430 ) ) ( not ( = ?auto_13411 ?auto_13413 ) ) ( not ( = ?auto_13411 ?auto_13430 ) ) ( not ( = ?auto_13413 ?auto_13442 ) ) ( not ( = ?auto_13413 ?auto_13433 ) ) ( not ( = ?auto_13413 ?auto_13431 ) ) ( not ( = ?auto_13413 ?auto_13437 ) ) ( not ( = ?auto_13413 ?auto_13440 ) ) ( not ( = ?auto_13413 ?auto_13436 ) ) ( not ( = ?auto_13430 ?auto_13442 ) ) ( not ( = ?auto_13430 ?auto_13433 ) ) ( not ( = ?auto_13430 ?auto_13431 ) ) ( not ( = ?auto_13430 ?auto_13437 ) ) ( not ( = ?auto_13430 ?auto_13440 ) ) ( not ( = ?auto_13430 ?auto_13436 ) ) ( not ( = ?auto_13406 ?auto_13414 ) ) ( not ( = ?auto_13406 ?auto_13432 ) ) ( not ( = ?auto_13407 ?auto_13414 ) ) ( not ( = ?auto_13407 ?auto_13432 ) ) ( not ( = ?auto_13408 ?auto_13414 ) ) ( not ( = ?auto_13408 ?auto_13432 ) ) ( not ( = ?auto_13409 ?auto_13414 ) ) ( not ( = ?auto_13409 ?auto_13432 ) ) ( not ( = ?auto_13410 ?auto_13414 ) ) ( not ( = ?auto_13410 ?auto_13432 ) ) ( not ( = ?auto_13411 ?auto_13414 ) ) ( not ( = ?auto_13411 ?auto_13432 ) ) ( not ( = ?auto_13412 ?auto_13414 ) ) ( not ( = ?auto_13412 ?auto_13432 ) ) ( not ( = ?auto_13414 ?auto_13430 ) ) ( not ( = ?auto_13414 ?auto_13442 ) ) ( not ( = ?auto_13414 ?auto_13433 ) ) ( not ( = ?auto_13414 ?auto_13431 ) ) ( not ( = ?auto_13414 ?auto_13437 ) ) ( not ( = ?auto_13414 ?auto_13440 ) ) ( not ( = ?auto_13414 ?auto_13436 ) ) ( not ( = ?auto_13432 ?auto_13430 ) ) ( not ( = ?auto_13432 ?auto_13442 ) ) ( not ( = ?auto_13432 ?auto_13433 ) ) ( not ( = ?auto_13432 ?auto_13431 ) ) ( not ( = ?auto_13432 ?auto_13437 ) ) ( not ( = ?auto_13432 ?auto_13440 ) ) ( not ( = ?auto_13432 ?auto_13436 ) ) ( not ( = ?auto_13406 ?auto_13415 ) ) ( not ( = ?auto_13406 ?auto_13426 ) ) ( not ( = ?auto_13407 ?auto_13415 ) ) ( not ( = ?auto_13407 ?auto_13426 ) ) ( not ( = ?auto_13408 ?auto_13415 ) ) ( not ( = ?auto_13408 ?auto_13426 ) ) ( not ( = ?auto_13409 ?auto_13415 ) ) ( not ( = ?auto_13409 ?auto_13426 ) ) ( not ( = ?auto_13410 ?auto_13415 ) ) ( not ( = ?auto_13410 ?auto_13426 ) ) ( not ( = ?auto_13411 ?auto_13415 ) ) ( not ( = ?auto_13411 ?auto_13426 ) ) ( not ( = ?auto_13412 ?auto_13415 ) ) ( not ( = ?auto_13412 ?auto_13426 ) ) ( not ( = ?auto_13413 ?auto_13415 ) ) ( not ( = ?auto_13413 ?auto_13426 ) ) ( not ( = ?auto_13415 ?auto_13432 ) ) ( not ( = ?auto_13415 ?auto_13430 ) ) ( not ( = ?auto_13415 ?auto_13442 ) ) ( not ( = ?auto_13415 ?auto_13433 ) ) ( not ( = ?auto_13415 ?auto_13431 ) ) ( not ( = ?auto_13415 ?auto_13437 ) ) ( not ( = ?auto_13415 ?auto_13440 ) ) ( not ( = ?auto_13415 ?auto_13436 ) ) ( not ( = ?auto_13426 ?auto_13432 ) ) ( not ( = ?auto_13426 ?auto_13430 ) ) ( not ( = ?auto_13426 ?auto_13442 ) ) ( not ( = ?auto_13426 ?auto_13433 ) ) ( not ( = ?auto_13426 ?auto_13431 ) ) ( not ( = ?auto_13426 ?auto_13437 ) ) ( not ( = ?auto_13426 ?auto_13440 ) ) ( not ( = ?auto_13426 ?auto_13436 ) ) ( not ( = ?auto_13406 ?auto_13416 ) ) ( not ( = ?auto_13406 ?auto_13434 ) ) ( not ( = ?auto_13407 ?auto_13416 ) ) ( not ( = ?auto_13407 ?auto_13434 ) ) ( not ( = ?auto_13408 ?auto_13416 ) ) ( not ( = ?auto_13408 ?auto_13434 ) ) ( not ( = ?auto_13409 ?auto_13416 ) ) ( not ( = ?auto_13409 ?auto_13434 ) ) ( not ( = ?auto_13410 ?auto_13416 ) ) ( not ( = ?auto_13410 ?auto_13434 ) ) ( not ( = ?auto_13411 ?auto_13416 ) ) ( not ( = ?auto_13411 ?auto_13434 ) ) ( not ( = ?auto_13412 ?auto_13416 ) ) ( not ( = ?auto_13412 ?auto_13434 ) ) ( not ( = ?auto_13413 ?auto_13416 ) ) ( not ( = ?auto_13413 ?auto_13434 ) ) ( not ( = ?auto_13414 ?auto_13416 ) ) ( not ( = ?auto_13414 ?auto_13434 ) ) ( not ( = ?auto_13416 ?auto_13426 ) ) ( not ( = ?auto_13416 ?auto_13432 ) ) ( not ( = ?auto_13416 ?auto_13430 ) ) ( not ( = ?auto_13416 ?auto_13442 ) ) ( not ( = ?auto_13416 ?auto_13433 ) ) ( not ( = ?auto_13416 ?auto_13431 ) ) ( not ( = ?auto_13416 ?auto_13437 ) ) ( not ( = ?auto_13416 ?auto_13440 ) ) ( not ( = ?auto_13416 ?auto_13436 ) ) ( not ( = ?auto_13429 ?auto_13428 ) ) ( not ( = ?auto_13429 ?auto_13435 ) ) ( not ( = ?auto_13429 ?auto_13422 ) ) ( not ( = ?auto_13429 ?auto_13443 ) ) ( not ( = ?auto_13438 ?auto_13439 ) ) ( not ( = ?auto_13438 ?auto_13427 ) ) ( not ( = ?auto_13438 ?auto_13420 ) ) ( not ( = ?auto_13438 ?auto_13441 ) ) ( not ( = ?auto_13434 ?auto_13426 ) ) ( not ( = ?auto_13434 ?auto_13432 ) ) ( not ( = ?auto_13434 ?auto_13430 ) ) ( not ( = ?auto_13434 ?auto_13442 ) ) ( not ( = ?auto_13434 ?auto_13433 ) ) ( not ( = ?auto_13434 ?auto_13431 ) ) ( not ( = ?auto_13434 ?auto_13437 ) ) ( not ( = ?auto_13434 ?auto_13440 ) ) ( not ( = ?auto_13434 ?auto_13436 ) ) ( not ( = ?auto_13406 ?auto_13417 ) ) ( not ( = ?auto_13406 ?auto_13425 ) ) ( not ( = ?auto_13407 ?auto_13417 ) ) ( not ( = ?auto_13407 ?auto_13425 ) ) ( not ( = ?auto_13408 ?auto_13417 ) ) ( not ( = ?auto_13408 ?auto_13425 ) ) ( not ( = ?auto_13409 ?auto_13417 ) ) ( not ( = ?auto_13409 ?auto_13425 ) ) ( not ( = ?auto_13410 ?auto_13417 ) ) ( not ( = ?auto_13410 ?auto_13425 ) ) ( not ( = ?auto_13411 ?auto_13417 ) ) ( not ( = ?auto_13411 ?auto_13425 ) ) ( not ( = ?auto_13412 ?auto_13417 ) ) ( not ( = ?auto_13412 ?auto_13425 ) ) ( not ( = ?auto_13413 ?auto_13417 ) ) ( not ( = ?auto_13413 ?auto_13425 ) ) ( not ( = ?auto_13414 ?auto_13417 ) ) ( not ( = ?auto_13414 ?auto_13425 ) ) ( not ( = ?auto_13415 ?auto_13417 ) ) ( not ( = ?auto_13415 ?auto_13425 ) ) ( not ( = ?auto_13417 ?auto_13434 ) ) ( not ( = ?auto_13417 ?auto_13426 ) ) ( not ( = ?auto_13417 ?auto_13432 ) ) ( not ( = ?auto_13417 ?auto_13430 ) ) ( not ( = ?auto_13417 ?auto_13442 ) ) ( not ( = ?auto_13417 ?auto_13433 ) ) ( not ( = ?auto_13417 ?auto_13431 ) ) ( not ( = ?auto_13417 ?auto_13437 ) ) ( not ( = ?auto_13417 ?auto_13440 ) ) ( not ( = ?auto_13417 ?auto_13436 ) ) ( not ( = ?auto_13425 ?auto_13434 ) ) ( not ( = ?auto_13425 ?auto_13426 ) ) ( not ( = ?auto_13425 ?auto_13432 ) ) ( not ( = ?auto_13425 ?auto_13430 ) ) ( not ( = ?auto_13425 ?auto_13442 ) ) ( not ( = ?auto_13425 ?auto_13433 ) ) ( not ( = ?auto_13425 ?auto_13431 ) ) ( not ( = ?auto_13425 ?auto_13437 ) ) ( not ( = ?auto_13425 ?auto_13440 ) ) ( not ( = ?auto_13425 ?auto_13436 ) ) ( not ( = ?auto_13406 ?auto_13418 ) ) ( not ( = ?auto_13406 ?auto_13424 ) ) ( not ( = ?auto_13407 ?auto_13418 ) ) ( not ( = ?auto_13407 ?auto_13424 ) ) ( not ( = ?auto_13408 ?auto_13418 ) ) ( not ( = ?auto_13408 ?auto_13424 ) ) ( not ( = ?auto_13409 ?auto_13418 ) ) ( not ( = ?auto_13409 ?auto_13424 ) ) ( not ( = ?auto_13410 ?auto_13418 ) ) ( not ( = ?auto_13410 ?auto_13424 ) ) ( not ( = ?auto_13411 ?auto_13418 ) ) ( not ( = ?auto_13411 ?auto_13424 ) ) ( not ( = ?auto_13412 ?auto_13418 ) ) ( not ( = ?auto_13412 ?auto_13424 ) ) ( not ( = ?auto_13413 ?auto_13418 ) ) ( not ( = ?auto_13413 ?auto_13424 ) ) ( not ( = ?auto_13414 ?auto_13418 ) ) ( not ( = ?auto_13414 ?auto_13424 ) ) ( not ( = ?auto_13415 ?auto_13418 ) ) ( not ( = ?auto_13415 ?auto_13424 ) ) ( not ( = ?auto_13416 ?auto_13418 ) ) ( not ( = ?auto_13416 ?auto_13424 ) ) ( not ( = ?auto_13418 ?auto_13425 ) ) ( not ( = ?auto_13418 ?auto_13434 ) ) ( not ( = ?auto_13418 ?auto_13426 ) ) ( not ( = ?auto_13418 ?auto_13432 ) ) ( not ( = ?auto_13418 ?auto_13430 ) ) ( not ( = ?auto_13418 ?auto_13442 ) ) ( not ( = ?auto_13418 ?auto_13433 ) ) ( not ( = ?auto_13418 ?auto_13431 ) ) ( not ( = ?auto_13418 ?auto_13437 ) ) ( not ( = ?auto_13418 ?auto_13440 ) ) ( not ( = ?auto_13418 ?auto_13436 ) ) ( not ( = ?auto_13424 ?auto_13425 ) ) ( not ( = ?auto_13424 ?auto_13434 ) ) ( not ( = ?auto_13424 ?auto_13426 ) ) ( not ( = ?auto_13424 ?auto_13432 ) ) ( not ( = ?auto_13424 ?auto_13430 ) ) ( not ( = ?auto_13424 ?auto_13442 ) ) ( not ( = ?auto_13424 ?auto_13433 ) ) ( not ( = ?auto_13424 ?auto_13431 ) ) ( not ( = ?auto_13424 ?auto_13437 ) ) ( not ( = ?auto_13424 ?auto_13440 ) ) ( not ( = ?auto_13424 ?auto_13436 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_13406 ?auto_13407 ?auto_13408 ?auto_13409 ?auto_13410 ?auto_13411 ?auto_13412 ?auto_13413 ?auto_13414 ?auto_13415 ?auto_13416 ?auto_13417 )
      ( MAKE-1CRATE ?auto_13417 ?auto_13418 )
      ( MAKE-12CRATE-VERIFY ?auto_13406 ?auto_13407 ?auto_13408 ?auto_13409 ?auto_13410 ?auto_13411 ?auto_13412 ?auto_13413 ?auto_13414 ?auto_13415 ?auto_13416 ?auto_13417 ?auto_13418 ) )
  )

)

