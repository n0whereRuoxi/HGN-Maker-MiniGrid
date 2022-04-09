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

  ( :method MAKE-15CRATE-VERIFY
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
      ?c15 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( CLEAR ?c15 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-16CRATE-VERIFY
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
      ?c15 - SURFACE
      ?c16 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( ON ?c16 ?c15 ) ( CLEAR ?c16 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2523035 - SURFACE
      ?auto_2523036 - SURFACE
    )
    :vars
    (
      ?auto_2523037 - HOIST
      ?auto_2523038 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523037 ?auto_2523038 ) ( SURFACE-AT ?auto_2523035 ?auto_2523038 ) ( CLEAR ?auto_2523035 ) ( LIFTING ?auto_2523037 ?auto_2523036 ) ( IS-CRATE ?auto_2523036 ) ( not ( = ?auto_2523035 ?auto_2523036 ) ) )
    :subtasks
    ( ( !DROP ?auto_2523037 ?auto_2523036 ?auto_2523035 ?auto_2523038 )
      ( MAKE-1CRATE-VERIFY ?auto_2523035 ?auto_2523036 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2523039 - SURFACE
      ?auto_2523040 - SURFACE
    )
    :vars
    (
      ?auto_2523041 - HOIST
      ?auto_2523042 - PLACE
      ?auto_2523043 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523041 ?auto_2523042 ) ( SURFACE-AT ?auto_2523039 ?auto_2523042 ) ( CLEAR ?auto_2523039 ) ( IS-CRATE ?auto_2523040 ) ( not ( = ?auto_2523039 ?auto_2523040 ) ) ( TRUCK-AT ?auto_2523043 ?auto_2523042 ) ( AVAILABLE ?auto_2523041 ) ( IN ?auto_2523040 ?auto_2523043 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2523041 ?auto_2523040 ?auto_2523043 ?auto_2523042 )
      ( MAKE-1CRATE ?auto_2523039 ?auto_2523040 )
      ( MAKE-1CRATE-VERIFY ?auto_2523039 ?auto_2523040 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2523044 - SURFACE
      ?auto_2523045 - SURFACE
    )
    :vars
    (
      ?auto_2523047 - HOIST
      ?auto_2523046 - PLACE
      ?auto_2523048 - TRUCK
      ?auto_2523049 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523047 ?auto_2523046 ) ( SURFACE-AT ?auto_2523044 ?auto_2523046 ) ( CLEAR ?auto_2523044 ) ( IS-CRATE ?auto_2523045 ) ( not ( = ?auto_2523044 ?auto_2523045 ) ) ( AVAILABLE ?auto_2523047 ) ( IN ?auto_2523045 ?auto_2523048 ) ( TRUCK-AT ?auto_2523048 ?auto_2523049 ) ( not ( = ?auto_2523049 ?auto_2523046 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2523048 ?auto_2523049 ?auto_2523046 )
      ( MAKE-1CRATE ?auto_2523044 ?auto_2523045 )
      ( MAKE-1CRATE-VERIFY ?auto_2523044 ?auto_2523045 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2523050 - SURFACE
      ?auto_2523051 - SURFACE
    )
    :vars
    (
      ?auto_2523053 - HOIST
      ?auto_2523052 - PLACE
      ?auto_2523055 - TRUCK
      ?auto_2523054 - PLACE
      ?auto_2523056 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523053 ?auto_2523052 ) ( SURFACE-AT ?auto_2523050 ?auto_2523052 ) ( CLEAR ?auto_2523050 ) ( IS-CRATE ?auto_2523051 ) ( not ( = ?auto_2523050 ?auto_2523051 ) ) ( AVAILABLE ?auto_2523053 ) ( TRUCK-AT ?auto_2523055 ?auto_2523054 ) ( not ( = ?auto_2523054 ?auto_2523052 ) ) ( HOIST-AT ?auto_2523056 ?auto_2523054 ) ( LIFTING ?auto_2523056 ?auto_2523051 ) ( not ( = ?auto_2523053 ?auto_2523056 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2523056 ?auto_2523051 ?auto_2523055 ?auto_2523054 )
      ( MAKE-1CRATE ?auto_2523050 ?auto_2523051 )
      ( MAKE-1CRATE-VERIFY ?auto_2523050 ?auto_2523051 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2523057 - SURFACE
      ?auto_2523058 - SURFACE
    )
    :vars
    (
      ?auto_2523062 - HOIST
      ?auto_2523061 - PLACE
      ?auto_2523059 - TRUCK
      ?auto_2523063 - PLACE
      ?auto_2523060 - HOIST
      ?auto_2523064 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523062 ?auto_2523061 ) ( SURFACE-AT ?auto_2523057 ?auto_2523061 ) ( CLEAR ?auto_2523057 ) ( IS-CRATE ?auto_2523058 ) ( not ( = ?auto_2523057 ?auto_2523058 ) ) ( AVAILABLE ?auto_2523062 ) ( TRUCK-AT ?auto_2523059 ?auto_2523063 ) ( not ( = ?auto_2523063 ?auto_2523061 ) ) ( HOIST-AT ?auto_2523060 ?auto_2523063 ) ( not ( = ?auto_2523062 ?auto_2523060 ) ) ( AVAILABLE ?auto_2523060 ) ( SURFACE-AT ?auto_2523058 ?auto_2523063 ) ( ON ?auto_2523058 ?auto_2523064 ) ( CLEAR ?auto_2523058 ) ( not ( = ?auto_2523057 ?auto_2523064 ) ) ( not ( = ?auto_2523058 ?auto_2523064 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2523060 ?auto_2523058 ?auto_2523064 ?auto_2523063 )
      ( MAKE-1CRATE ?auto_2523057 ?auto_2523058 )
      ( MAKE-1CRATE-VERIFY ?auto_2523057 ?auto_2523058 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2523065 - SURFACE
      ?auto_2523066 - SURFACE
    )
    :vars
    (
      ?auto_2523070 - HOIST
      ?auto_2523068 - PLACE
      ?auto_2523071 - PLACE
      ?auto_2523069 - HOIST
      ?auto_2523067 - SURFACE
      ?auto_2523072 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523070 ?auto_2523068 ) ( SURFACE-AT ?auto_2523065 ?auto_2523068 ) ( CLEAR ?auto_2523065 ) ( IS-CRATE ?auto_2523066 ) ( not ( = ?auto_2523065 ?auto_2523066 ) ) ( AVAILABLE ?auto_2523070 ) ( not ( = ?auto_2523071 ?auto_2523068 ) ) ( HOIST-AT ?auto_2523069 ?auto_2523071 ) ( not ( = ?auto_2523070 ?auto_2523069 ) ) ( AVAILABLE ?auto_2523069 ) ( SURFACE-AT ?auto_2523066 ?auto_2523071 ) ( ON ?auto_2523066 ?auto_2523067 ) ( CLEAR ?auto_2523066 ) ( not ( = ?auto_2523065 ?auto_2523067 ) ) ( not ( = ?auto_2523066 ?auto_2523067 ) ) ( TRUCK-AT ?auto_2523072 ?auto_2523068 ) )
    :subtasks
    ( ( !DRIVE ?auto_2523072 ?auto_2523068 ?auto_2523071 )
      ( MAKE-1CRATE ?auto_2523065 ?auto_2523066 )
      ( MAKE-1CRATE-VERIFY ?auto_2523065 ?auto_2523066 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2523082 - SURFACE
      ?auto_2523083 - SURFACE
      ?auto_2523084 - SURFACE
    )
    :vars
    (
      ?auto_2523086 - HOIST
      ?auto_2523085 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523086 ?auto_2523085 ) ( SURFACE-AT ?auto_2523083 ?auto_2523085 ) ( CLEAR ?auto_2523083 ) ( LIFTING ?auto_2523086 ?auto_2523084 ) ( IS-CRATE ?auto_2523084 ) ( not ( = ?auto_2523083 ?auto_2523084 ) ) ( ON ?auto_2523083 ?auto_2523082 ) ( not ( = ?auto_2523082 ?auto_2523083 ) ) ( not ( = ?auto_2523082 ?auto_2523084 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2523083 ?auto_2523084 )
      ( MAKE-2CRATE-VERIFY ?auto_2523082 ?auto_2523083 ?auto_2523084 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2523092 - SURFACE
      ?auto_2523093 - SURFACE
      ?auto_2523094 - SURFACE
    )
    :vars
    (
      ?auto_2523097 - HOIST
      ?auto_2523095 - PLACE
      ?auto_2523096 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523097 ?auto_2523095 ) ( SURFACE-AT ?auto_2523093 ?auto_2523095 ) ( CLEAR ?auto_2523093 ) ( IS-CRATE ?auto_2523094 ) ( not ( = ?auto_2523093 ?auto_2523094 ) ) ( TRUCK-AT ?auto_2523096 ?auto_2523095 ) ( AVAILABLE ?auto_2523097 ) ( IN ?auto_2523094 ?auto_2523096 ) ( ON ?auto_2523093 ?auto_2523092 ) ( not ( = ?auto_2523092 ?auto_2523093 ) ) ( not ( = ?auto_2523092 ?auto_2523094 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2523093 ?auto_2523094 )
      ( MAKE-2CRATE-VERIFY ?auto_2523092 ?auto_2523093 ?auto_2523094 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2523098 - SURFACE
      ?auto_2523099 - SURFACE
    )
    :vars
    (
      ?auto_2523102 - HOIST
      ?auto_2523103 - PLACE
      ?auto_2523100 - TRUCK
      ?auto_2523101 - SURFACE
      ?auto_2523104 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523102 ?auto_2523103 ) ( SURFACE-AT ?auto_2523098 ?auto_2523103 ) ( CLEAR ?auto_2523098 ) ( IS-CRATE ?auto_2523099 ) ( not ( = ?auto_2523098 ?auto_2523099 ) ) ( AVAILABLE ?auto_2523102 ) ( IN ?auto_2523099 ?auto_2523100 ) ( ON ?auto_2523098 ?auto_2523101 ) ( not ( = ?auto_2523101 ?auto_2523098 ) ) ( not ( = ?auto_2523101 ?auto_2523099 ) ) ( TRUCK-AT ?auto_2523100 ?auto_2523104 ) ( not ( = ?auto_2523104 ?auto_2523103 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2523100 ?auto_2523104 ?auto_2523103 )
      ( MAKE-2CRATE ?auto_2523101 ?auto_2523098 ?auto_2523099 )
      ( MAKE-1CRATE-VERIFY ?auto_2523098 ?auto_2523099 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2523105 - SURFACE
      ?auto_2523106 - SURFACE
      ?auto_2523107 - SURFACE
    )
    :vars
    (
      ?auto_2523108 - HOIST
      ?auto_2523110 - PLACE
      ?auto_2523109 - TRUCK
      ?auto_2523111 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523108 ?auto_2523110 ) ( SURFACE-AT ?auto_2523106 ?auto_2523110 ) ( CLEAR ?auto_2523106 ) ( IS-CRATE ?auto_2523107 ) ( not ( = ?auto_2523106 ?auto_2523107 ) ) ( AVAILABLE ?auto_2523108 ) ( IN ?auto_2523107 ?auto_2523109 ) ( ON ?auto_2523106 ?auto_2523105 ) ( not ( = ?auto_2523105 ?auto_2523106 ) ) ( not ( = ?auto_2523105 ?auto_2523107 ) ) ( TRUCK-AT ?auto_2523109 ?auto_2523111 ) ( not ( = ?auto_2523111 ?auto_2523110 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2523106 ?auto_2523107 )
      ( MAKE-2CRATE-VERIFY ?auto_2523105 ?auto_2523106 ?auto_2523107 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2523112 - SURFACE
      ?auto_2523113 - SURFACE
    )
    :vars
    (
      ?auto_2523116 - HOIST
      ?auto_2523115 - PLACE
      ?auto_2523117 - SURFACE
      ?auto_2523114 - TRUCK
      ?auto_2523118 - PLACE
      ?auto_2523119 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523116 ?auto_2523115 ) ( SURFACE-AT ?auto_2523112 ?auto_2523115 ) ( CLEAR ?auto_2523112 ) ( IS-CRATE ?auto_2523113 ) ( not ( = ?auto_2523112 ?auto_2523113 ) ) ( AVAILABLE ?auto_2523116 ) ( ON ?auto_2523112 ?auto_2523117 ) ( not ( = ?auto_2523117 ?auto_2523112 ) ) ( not ( = ?auto_2523117 ?auto_2523113 ) ) ( TRUCK-AT ?auto_2523114 ?auto_2523118 ) ( not ( = ?auto_2523118 ?auto_2523115 ) ) ( HOIST-AT ?auto_2523119 ?auto_2523118 ) ( LIFTING ?auto_2523119 ?auto_2523113 ) ( not ( = ?auto_2523116 ?auto_2523119 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2523119 ?auto_2523113 ?auto_2523114 ?auto_2523118 )
      ( MAKE-2CRATE ?auto_2523117 ?auto_2523112 ?auto_2523113 )
      ( MAKE-1CRATE-VERIFY ?auto_2523112 ?auto_2523113 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2523120 - SURFACE
      ?auto_2523121 - SURFACE
      ?auto_2523122 - SURFACE
    )
    :vars
    (
      ?auto_2523123 - HOIST
      ?auto_2523124 - PLACE
      ?auto_2523125 - TRUCK
      ?auto_2523126 - PLACE
      ?auto_2523127 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523123 ?auto_2523124 ) ( SURFACE-AT ?auto_2523121 ?auto_2523124 ) ( CLEAR ?auto_2523121 ) ( IS-CRATE ?auto_2523122 ) ( not ( = ?auto_2523121 ?auto_2523122 ) ) ( AVAILABLE ?auto_2523123 ) ( ON ?auto_2523121 ?auto_2523120 ) ( not ( = ?auto_2523120 ?auto_2523121 ) ) ( not ( = ?auto_2523120 ?auto_2523122 ) ) ( TRUCK-AT ?auto_2523125 ?auto_2523126 ) ( not ( = ?auto_2523126 ?auto_2523124 ) ) ( HOIST-AT ?auto_2523127 ?auto_2523126 ) ( LIFTING ?auto_2523127 ?auto_2523122 ) ( not ( = ?auto_2523123 ?auto_2523127 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2523121 ?auto_2523122 )
      ( MAKE-2CRATE-VERIFY ?auto_2523120 ?auto_2523121 ?auto_2523122 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2523128 - SURFACE
      ?auto_2523129 - SURFACE
    )
    :vars
    (
      ?auto_2523135 - HOIST
      ?auto_2523131 - PLACE
      ?auto_2523133 - SURFACE
      ?auto_2523130 - TRUCK
      ?auto_2523134 - PLACE
      ?auto_2523132 - HOIST
      ?auto_2523136 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523135 ?auto_2523131 ) ( SURFACE-AT ?auto_2523128 ?auto_2523131 ) ( CLEAR ?auto_2523128 ) ( IS-CRATE ?auto_2523129 ) ( not ( = ?auto_2523128 ?auto_2523129 ) ) ( AVAILABLE ?auto_2523135 ) ( ON ?auto_2523128 ?auto_2523133 ) ( not ( = ?auto_2523133 ?auto_2523128 ) ) ( not ( = ?auto_2523133 ?auto_2523129 ) ) ( TRUCK-AT ?auto_2523130 ?auto_2523134 ) ( not ( = ?auto_2523134 ?auto_2523131 ) ) ( HOIST-AT ?auto_2523132 ?auto_2523134 ) ( not ( = ?auto_2523135 ?auto_2523132 ) ) ( AVAILABLE ?auto_2523132 ) ( SURFACE-AT ?auto_2523129 ?auto_2523134 ) ( ON ?auto_2523129 ?auto_2523136 ) ( CLEAR ?auto_2523129 ) ( not ( = ?auto_2523128 ?auto_2523136 ) ) ( not ( = ?auto_2523129 ?auto_2523136 ) ) ( not ( = ?auto_2523133 ?auto_2523136 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2523132 ?auto_2523129 ?auto_2523136 ?auto_2523134 )
      ( MAKE-2CRATE ?auto_2523133 ?auto_2523128 ?auto_2523129 )
      ( MAKE-1CRATE-VERIFY ?auto_2523128 ?auto_2523129 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2523137 - SURFACE
      ?auto_2523138 - SURFACE
      ?auto_2523139 - SURFACE
    )
    :vars
    (
      ?auto_2523141 - HOIST
      ?auto_2523140 - PLACE
      ?auto_2523143 - TRUCK
      ?auto_2523145 - PLACE
      ?auto_2523142 - HOIST
      ?auto_2523144 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523141 ?auto_2523140 ) ( SURFACE-AT ?auto_2523138 ?auto_2523140 ) ( CLEAR ?auto_2523138 ) ( IS-CRATE ?auto_2523139 ) ( not ( = ?auto_2523138 ?auto_2523139 ) ) ( AVAILABLE ?auto_2523141 ) ( ON ?auto_2523138 ?auto_2523137 ) ( not ( = ?auto_2523137 ?auto_2523138 ) ) ( not ( = ?auto_2523137 ?auto_2523139 ) ) ( TRUCK-AT ?auto_2523143 ?auto_2523145 ) ( not ( = ?auto_2523145 ?auto_2523140 ) ) ( HOIST-AT ?auto_2523142 ?auto_2523145 ) ( not ( = ?auto_2523141 ?auto_2523142 ) ) ( AVAILABLE ?auto_2523142 ) ( SURFACE-AT ?auto_2523139 ?auto_2523145 ) ( ON ?auto_2523139 ?auto_2523144 ) ( CLEAR ?auto_2523139 ) ( not ( = ?auto_2523138 ?auto_2523144 ) ) ( not ( = ?auto_2523139 ?auto_2523144 ) ) ( not ( = ?auto_2523137 ?auto_2523144 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2523138 ?auto_2523139 )
      ( MAKE-2CRATE-VERIFY ?auto_2523137 ?auto_2523138 ?auto_2523139 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2523146 - SURFACE
      ?auto_2523147 - SURFACE
    )
    :vars
    (
      ?auto_2523154 - HOIST
      ?auto_2523150 - PLACE
      ?auto_2523148 - SURFACE
      ?auto_2523151 - PLACE
      ?auto_2523152 - HOIST
      ?auto_2523149 - SURFACE
      ?auto_2523153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523154 ?auto_2523150 ) ( SURFACE-AT ?auto_2523146 ?auto_2523150 ) ( CLEAR ?auto_2523146 ) ( IS-CRATE ?auto_2523147 ) ( not ( = ?auto_2523146 ?auto_2523147 ) ) ( AVAILABLE ?auto_2523154 ) ( ON ?auto_2523146 ?auto_2523148 ) ( not ( = ?auto_2523148 ?auto_2523146 ) ) ( not ( = ?auto_2523148 ?auto_2523147 ) ) ( not ( = ?auto_2523151 ?auto_2523150 ) ) ( HOIST-AT ?auto_2523152 ?auto_2523151 ) ( not ( = ?auto_2523154 ?auto_2523152 ) ) ( AVAILABLE ?auto_2523152 ) ( SURFACE-AT ?auto_2523147 ?auto_2523151 ) ( ON ?auto_2523147 ?auto_2523149 ) ( CLEAR ?auto_2523147 ) ( not ( = ?auto_2523146 ?auto_2523149 ) ) ( not ( = ?auto_2523147 ?auto_2523149 ) ) ( not ( = ?auto_2523148 ?auto_2523149 ) ) ( TRUCK-AT ?auto_2523153 ?auto_2523150 ) )
    :subtasks
    ( ( !DRIVE ?auto_2523153 ?auto_2523150 ?auto_2523151 )
      ( MAKE-2CRATE ?auto_2523148 ?auto_2523146 ?auto_2523147 )
      ( MAKE-1CRATE-VERIFY ?auto_2523146 ?auto_2523147 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2523155 - SURFACE
      ?auto_2523156 - SURFACE
      ?auto_2523157 - SURFACE
    )
    :vars
    (
      ?auto_2523158 - HOIST
      ?auto_2523161 - PLACE
      ?auto_2523163 - PLACE
      ?auto_2523162 - HOIST
      ?auto_2523160 - SURFACE
      ?auto_2523159 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523158 ?auto_2523161 ) ( SURFACE-AT ?auto_2523156 ?auto_2523161 ) ( CLEAR ?auto_2523156 ) ( IS-CRATE ?auto_2523157 ) ( not ( = ?auto_2523156 ?auto_2523157 ) ) ( AVAILABLE ?auto_2523158 ) ( ON ?auto_2523156 ?auto_2523155 ) ( not ( = ?auto_2523155 ?auto_2523156 ) ) ( not ( = ?auto_2523155 ?auto_2523157 ) ) ( not ( = ?auto_2523163 ?auto_2523161 ) ) ( HOIST-AT ?auto_2523162 ?auto_2523163 ) ( not ( = ?auto_2523158 ?auto_2523162 ) ) ( AVAILABLE ?auto_2523162 ) ( SURFACE-AT ?auto_2523157 ?auto_2523163 ) ( ON ?auto_2523157 ?auto_2523160 ) ( CLEAR ?auto_2523157 ) ( not ( = ?auto_2523156 ?auto_2523160 ) ) ( not ( = ?auto_2523157 ?auto_2523160 ) ) ( not ( = ?auto_2523155 ?auto_2523160 ) ) ( TRUCK-AT ?auto_2523159 ?auto_2523161 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2523156 ?auto_2523157 )
      ( MAKE-2CRATE-VERIFY ?auto_2523155 ?auto_2523156 ?auto_2523157 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2523164 - SURFACE
      ?auto_2523165 - SURFACE
    )
    :vars
    (
      ?auto_2523168 - HOIST
      ?auto_2523171 - PLACE
      ?auto_2523167 - SURFACE
      ?auto_2523170 - PLACE
      ?auto_2523166 - HOIST
      ?auto_2523172 - SURFACE
      ?auto_2523169 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523168 ?auto_2523171 ) ( IS-CRATE ?auto_2523165 ) ( not ( = ?auto_2523164 ?auto_2523165 ) ) ( not ( = ?auto_2523167 ?auto_2523164 ) ) ( not ( = ?auto_2523167 ?auto_2523165 ) ) ( not ( = ?auto_2523170 ?auto_2523171 ) ) ( HOIST-AT ?auto_2523166 ?auto_2523170 ) ( not ( = ?auto_2523168 ?auto_2523166 ) ) ( AVAILABLE ?auto_2523166 ) ( SURFACE-AT ?auto_2523165 ?auto_2523170 ) ( ON ?auto_2523165 ?auto_2523172 ) ( CLEAR ?auto_2523165 ) ( not ( = ?auto_2523164 ?auto_2523172 ) ) ( not ( = ?auto_2523165 ?auto_2523172 ) ) ( not ( = ?auto_2523167 ?auto_2523172 ) ) ( TRUCK-AT ?auto_2523169 ?auto_2523171 ) ( SURFACE-AT ?auto_2523167 ?auto_2523171 ) ( CLEAR ?auto_2523167 ) ( LIFTING ?auto_2523168 ?auto_2523164 ) ( IS-CRATE ?auto_2523164 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2523167 ?auto_2523164 )
      ( MAKE-2CRATE ?auto_2523167 ?auto_2523164 ?auto_2523165 )
      ( MAKE-1CRATE-VERIFY ?auto_2523164 ?auto_2523165 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2523173 - SURFACE
      ?auto_2523174 - SURFACE
      ?auto_2523175 - SURFACE
    )
    :vars
    (
      ?auto_2523180 - HOIST
      ?auto_2523181 - PLACE
      ?auto_2523179 - PLACE
      ?auto_2523176 - HOIST
      ?auto_2523178 - SURFACE
      ?auto_2523177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523180 ?auto_2523181 ) ( IS-CRATE ?auto_2523175 ) ( not ( = ?auto_2523174 ?auto_2523175 ) ) ( not ( = ?auto_2523173 ?auto_2523174 ) ) ( not ( = ?auto_2523173 ?auto_2523175 ) ) ( not ( = ?auto_2523179 ?auto_2523181 ) ) ( HOIST-AT ?auto_2523176 ?auto_2523179 ) ( not ( = ?auto_2523180 ?auto_2523176 ) ) ( AVAILABLE ?auto_2523176 ) ( SURFACE-AT ?auto_2523175 ?auto_2523179 ) ( ON ?auto_2523175 ?auto_2523178 ) ( CLEAR ?auto_2523175 ) ( not ( = ?auto_2523174 ?auto_2523178 ) ) ( not ( = ?auto_2523175 ?auto_2523178 ) ) ( not ( = ?auto_2523173 ?auto_2523178 ) ) ( TRUCK-AT ?auto_2523177 ?auto_2523181 ) ( SURFACE-AT ?auto_2523173 ?auto_2523181 ) ( CLEAR ?auto_2523173 ) ( LIFTING ?auto_2523180 ?auto_2523174 ) ( IS-CRATE ?auto_2523174 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2523174 ?auto_2523175 )
      ( MAKE-2CRATE-VERIFY ?auto_2523173 ?auto_2523174 ?auto_2523175 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2523182 - SURFACE
      ?auto_2523183 - SURFACE
    )
    :vars
    (
      ?auto_2523189 - HOIST
      ?auto_2523186 - PLACE
      ?auto_2523188 - SURFACE
      ?auto_2523187 - PLACE
      ?auto_2523184 - HOIST
      ?auto_2523185 - SURFACE
      ?auto_2523190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523189 ?auto_2523186 ) ( IS-CRATE ?auto_2523183 ) ( not ( = ?auto_2523182 ?auto_2523183 ) ) ( not ( = ?auto_2523188 ?auto_2523182 ) ) ( not ( = ?auto_2523188 ?auto_2523183 ) ) ( not ( = ?auto_2523187 ?auto_2523186 ) ) ( HOIST-AT ?auto_2523184 ?auto_2523187 ) ( not ( = ?auto_2523189 ?auto_2523184 ) ) ( AVAILABLE ?auto_2523184 ) ( SURFACE-AT ?auto_2523183 ?auto_2523187 ) ( ON ?auto_2523183 ?auto_2523185 ) ( CLEAR ?auto_2523183 ) ( not ( = ?auto_2523182 ?auto_2523185 ) ) ( not ( = ?auto_2523183 ?auto_2523185 ) ) ( not ( = ?auto_2523188 ?auto_2523185 ) ) ( TRUCK-AT ?auto_2523190 ?auto_2523186 ) ( SURFACE-AT ?auto_2523188 ?auto_2523186 ) ( CLEAR ?auto_2523188 ) ( IS-CRATE ?auto_2523182 ) ( AVAILABLE ?auto_2523189 ) ( IN ?auto_2523182 ?auto_2523190 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2523189 ?auto_2523182 ?auto_2523190 ?auto_2523186 )
      ( MAKE-2CRATE ?auto_2523188 ?auto_2523182 ?auto_2523183 )
      ( MAKE-1CRATE-VERIFY ?auto_2523182 ?auto_2523183 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2523191 - SURFACE
      ?auto_2523192 - SURFACE
      ?auto_2523193 - SURFACE
    )
    :vars
    (
      ?auto_2523194 - HOIST
      ?auto_2523195 - PLACE
      ?auto_2523196 - PLACE
      ?auto_2523198 - HOIST
      ?auto_2523199 - SURFACE
      ?auto_2523197 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523194 ?auto_2523195 ) ( IS-CRATE ?auto_2523193 ) ( not ( = ?auto_2523192 ?auto_2523193 ) ) ( not ( = ?auto_2523191 ?auto_2523192 ) ) ( not ( = ?auto_2523191 ?auto_2523193 ) ) ( not ( = ?auto_2523196 ?auto_2523195 ) ) ( HOIST-AT ?auto_2523198 ?auto_2523196 ) ( not ( = ?auto_2523194 ?auto_2523198 ) ) ( AVAILABLE ?auto_2523198 ) ( SURFACE-AT ?auto_2523193 ?auto_2523196 ) ( ON ?auto_2523193 ?auto_2523199 ) ( CLEAR ?auto_2523193 ) ( not ( = ?auto_2523192 ?auto_2523199 ) ) ( not ( = ?auto_2523193 ?auto_2523199 ) ) ( not ( = ?auto_2523191 ?auto_2523199 ) ) ( TRUCK-AT ?auto_2523197 ?auto_2523195 ) ( SURFACE-AT ?auto_2523191 ?auto_2523195 ) ( CLEAR ?auto_2523191 ) ( IS-CRATE ?auto_2523192 ) ( AVAILABLE ?auto_2523194 ) ( IN ?auto_2523192 ?auto_2523197 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2523192 ?auto_2523193 )
      ( MAKE-2CRATE-VERIFY ?auto_2523191 ?auto_2523192 ?auto_2523193 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2523236 - SURFACE
      ?auto_2523237 - SURFACE
    )
    :vars
    (
      ?auto_2523244 - HOIST
      ?auto_2523238 - PLACE
      ?auto_2523243 - SURFACE
      ?auto_2523240 - PLACE
      ?auto_2523242 - HOIST
      ?auto_2523241 - SURFACE
      ?auto_2523239 - TRUCK
      ?auto_2523245 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523244 ?auto_2523238 ) ( SURFACE-AT ?auto_2523236 ?auto_2523238 ) ( CLEAR ?auto_2523236 ) ( IS-CRATE ?auto_2523237 ) ( not ( = ?auto_2523236 ?auto_2523237 ) ) ( AVAILABLE ?auto_2523244 ) ( ON ?auto_2523236 ?auto_2523243 ) ( not ( = ?auto_2523243 ?auto_2523236 ) ) ( not ( = ?auto_2523243 ?auto_2523237 ) ) ( not ( = ?auto_2523240 ?auto_2523238 ) ) ( HOIST-AT ?auto_2523242 ?auto_2523240 ) ( not ( = ?auto_2523244 ?auto_2523242 ) ) ( AVAILABLE ?auto_2523242 ) ( SURFACE-AT ?auto_2523237 ?auto_2523240 ) ( ON ?auto_2523237 ?auto_2523241 ) ( CLEAR ?auto_2523237 ) ( not ( = ?auto_2523236 ?auto_2523241 ) ) ( not ( = ?auto_2523237 ?auto_2523241 ) ) ( not ( = ?auto_2523243 ?auto_2523241 ) ) ( TRUCK-AT ?auto_2523239 ?auto_2523245 ) ( not ( = ?auto_2523245 ?auto_2523238 ) ) ( not ( = ?auto_2523240 ?auto_2523245 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2523239 ?auto_2523245 ?auto_2523238 )
      ( MAKE-1CRATE ?auto_2523236 ?auto_2523237 )
      ( MAKE-1CRATE-VERIFY ?auto_2523236 ?auto_2523237 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2523275 - SURFACE
      ?auto_2523276 - SURFACE
      ?auto_2523277 - SURFACE
      ?auto_2523278 - SURFACE
    )
    :vars
    (
      ?auto_2523279 - HOIST
      ?auto_2523280 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523279 ?auto_2523280 ) ( SURFACE-AT ?auto_2523277 ?auto_2523280 ) ( CLEAR ?auto_2523277 ) ( LIFTING ?auto_2523279 ?auto_2523278 ) ( IS-CRATE ?auto_2523278 ) ( not ( = ?auto_2523277 ?auto_2523278 ) ) ( ON ?auto_2523276 ?auto_2523275 ) ( ON ?auto_2523277 ?auto_2523276 ) ( not ( = ?auto_2523275 ?auto_2523276 ) ) ( not ( = ?auto_2523275 ?auto_2523277 ) ) ( not ( = ?auto_2523275 ?auto_2523278 ) ) ( not ( = ?auto_2523276 ?auto_2523277 ) ) ( not ( = ?auto_2523276 ?auto_2523278 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2523277 ?auto_2523278 )
      ( MAKE-3CRATE-VERIFY ?auto_2523275 ?auto_2523276 ?auto_2523277 ?auto_2523278 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2523292 - SURFACE
      ?auto_2523293 - SURFACE
      ?auto_2523294 - SURFACE
      ?auto_2523295 - SURFACE
    )
    :vars
    (
      ?auto_2523297 - HOIST
      ?auto_2523298 - PLACE
      ?auto_2523296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523297 ?auto_2523298 ) ( SURFACE-AT ?auto_2523294 ?auto_2523298 ) ( CLEAR ?auto_2523294 ) ( IS-CRATE ?auto_2523295 ) ( not ( = ?auto_2523294 ?auto_2523295 ) ) ( TRUCK-AT ?auto_2523296 ?auto_2523298 ) ( AVAILABLE ?auto_2523297 ) ( IN ?auto_2523295 ?auto_2523296 ) ( ON ?auto_2523294 ?auto_2523293 ) ( not ( = ?auto_2523293 ?auto_2523294 ) ) ( not ( = ?auto_2523293 ?auto_2523295 ) ) ( ON ?auto_2523293 ?auto_2523292 ) ( not ( = ?auto_2523292 ?auto_2523293 ) ) ( not ( = ?auto_2523292 ?auto_2523294 ) ) ( not ( = ?auto_2523292 ?auto_2523295 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2523293 ?auto_2523294 ?auto_2523295 )
      ( MAKE-3CRATE-VERIFY ?auto_2523292 ?auto_2523293 ?auto_2523294 ?auto_2523295 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2523313 - SURFACE
      ?auto_2523314 - SURFACE
      ?auto_2523315 - SURFACE
      ?auto_2523316 - SURFACE
    )
    :vars
    (
      ?auto_2523317 - HOIST
      ?auto_2523320 - PLACE
      ?auto_2523319 - TRUCK
      ?auto_2523318 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523317 ?auto_2523320 ) ( SURFACE-AT ?auto_2523315 ?auto_2523320 ) ( CLEAR ?auto_2523315 ) ( IS-CRATE ?auto_2523316 ) ( not ( = ?auto_2523315 ?auto_2523316 ) ) ( AVAILABLE ?auto_2523317 ) ( IN ?auto_2523316 ?auto_2523319 ) ( ON ?auto_2523315 ?auto_2523314 ) ( not ( = ?auto_2523314 ?auto_2523315 ) ) ( not ( = ?auto_2523314 ?auto_2523316 ) ) ( TRUCK-AT ?auto_2523319 ?auto_2523318 ) ( not ( = ?auto_2523318 ?auto_2523320 ) ) ( ON ?auto_2523314 ?auto_2523313 ) ( not ( = ?auto_2523313 ?auto_2523314 ) ) ( not ( = ?auto_2523313 ?auto_2523315 ) ) ( not ( = ?auto_2523313 ?auto_2523316 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2523314 ?auto_2523315 ?auto_2523316 )
      ( MAKE-3CRATE-VERIFY ?auto_2523313 ?auto_2523314 ?auto_2523315 ?auto_2523316 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2523337 - SURFACE
      ?auto_2523338 - SURFACE
      ?auto_2523339 - SURFACE
      ?auto_2523340 - SURFACE
    )
    :vars
    (
      ?auto_2523343 - HOIST
      ?auto_2523345 - PLACE
      ?auto_2523342 - TRUCK
      ?auto_2523344 - PLACE
      ?auto_2523341 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523343 ?auto_2523345 ) ( SURFACE-AT ?auto_2523339 ?auto_2523345 ) ( CLEAR ?auto_2523339 ) ( IS-CRATE ?auto_2523340 ) ( not ( = ?auto_2523339 ?auto_2523340 ) ) ( AVAILABLE ?auto_2523343 ) ( ON ?auto_2523339 ?auto_2523338 ) ( not ( = ?auto_2523338 ?auto_2523339 ) ) ( not ( = ?auto_2523338 ?auto_2523340 ) ) ( TRUCK-AT ?auto_2523342 ?auto_2523344 ) ( not ( = ?auto_2523344 ?auto_2523345 ) ) ( HOIST-AT ?auto_2523341 ?auto_2523344 ) ( LIFTING ?auto_2523341 ?auto_2523340 ) ( not ( = ?auto_2523343 ?auto_2523341 ) ) ( ON ?auto_2523338 ?auto_2523337 ) ( not ( = ?auto_2523337 ?auto_2523338 ) ) ( not ( = ?auto_2523337 ?auto_2523339 ) ) ( not ( = ?auto_2523337 ?auto_2523340 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2523338 ?auto_2523339 ?auto_2523340 )
      ( MAKE-3CRATE-VERIFY ?auto_2523337 ?auto_2523338 ?auto_2523339 ?auto_2523340 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2523364 - SURFACE
      ?auto_2523365 - SURFACE
      ?auto_2523366 - SURFACE
      ?auto_2523367 - SURFACE
    )
    :vars
    (
      ?auto_2523373 - HOIST
      ?auto_2523369 - PLACE
      ?auto_2523371 - TRUCK
      ?auto_2523372 - PLACE
      ?auto_2523368 - HOIST
      ?auto_2523370 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523373 ?auto_2523369 ) ( SURFACE-AT ?auto_2523366 ?auto_2523369 ) ( CLEAR ?auto_2523366 ) ( IS-CRATE ?auto_2523367 ) ( not ( = ?auto_2523366 ?auto_2523367 ) ) ( AVAILABLE ?auto_2523373 ) ( ON ?auto_2523366 ?auto_2523365 ) ( not ( = ?auto_2523365 ?auto_2523366 ) ) ( not ( = ?auto_2523365 ?auto_2523367 ) ) ( TRUCK-AT ?auto_2523371 ?auto_2523372 ) ( not ( = ?auto_2523372 ?auto_2523369 ) ) ( HOIST-AT ?auto_2523368 ?auto_2523372 ) ( not ( = ?auto_2523373 ?auto_2523368 ) ) ( AVAILABLE ?auto_2523368 ) ( SURFACE-AT ?auto_2523367 ?auto_2523372 ) ( ON ?auto_2523367 ?auto_2523370 ) ( CLEAR ?auto_2523367 ) ( not ( = ?auto_2523366 ?auto_2523370 ) ) ( not ( = ?auto_2523367 ?auto_2523370 ) ) ( not ( = ?auto_2523365 ?auto_2523370 ) ) ( ON ?auto_2523365 ?auto_2523364 ) ( not ( = ?auto_2523364 ?auto_2523365 ) ) ( not ( = ?auto_2523364 ?auto_2523366 ) ) ( not ( = ?auto_2523364 ?auto_2523367 ) ) ( not ( = ?auto_2523364 ?auto_2523370 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2523365 ?auto_2523366 ?auto_2523367 )
      ( MAKE-3CRATE-VERIFY ?auto_2523364 ?auto_2523365 ?auto_2523366 ?auto_2523367 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2523392 - SURFACE
      ?auto_2523393 - SURFACE
      ?auto_2523394 - SURFACE
      ?auto_2523395 - SURFACE
    )
    :vars
    (
      ?auto_2523400 - HOIST
      ?auto_2523401 - PLACE
      ?auto_2523396 - PLACE
      ?auto_2523399 - HOIST
      ?auto_2523398 - SURFACE
      ?auto_2523397 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523400 ?auto_2523401 ) ( SURFACE-AT ?auto_2523394 ?auto_2523401 ) ( CLEAR ?auto_2523394 ) ( IS-CRATE ?auto_2523395 ) ( not ( = ?auto_2523394 ?auto_2523395 ) ) ( AVAILABLE ?auto_2523400 ) ( ON ?auto_2523394 ?auto_2523393 ) ( not ( = ?auto_2523393 ?auto_2523394 ) ) ( not ( = ?auto_2523393 ?auto_2523395 ) ) ( not ( = ?auto_2523396 ?auto_2523401 ) ) ( HOIST-AT ?auto_2523399 ?auto_2523396 ) ( not ( = ?auto_2523400 ?auto_2523399 ) ) ( AVAILABLE ?auto_2523399 ) ( SURFACE-AT ?auto_2523395 ?auto_2523396 ) ( ON ?auto_2523395 ?auto_2523398 ) ( CLEAR ?auto_2523395 ) ( not ( = ?auto_2523394 ?auto_2523398 ) ) ( not ( = ?auto_2523395 ?auto_2523398 ) ) ( not ( = ?auto_2523393 ?auto_2523398 ) ) ( TRUCK-AT ?auto_2523397 ?auto_2523401 ) ( ON ?auto_2523393 ?auto_2523392 ) ( not ( = ?auto_2523392 ?auto_2523393 ) ) ( not ( = ?auto_2523392 ?auto_2523394 ) ) ( not ( = ?auto_2523392 ?auto_2523395 ) ) ( not ( = ?auto_2523392 ?auto_2523398 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2523393 ?auto_2523394 ?auto_2523395 )
      ( MAKE-3CRATE-VERIFY ?auto_2523392 ?auto_2523393 ?auto_2523394 ?auto_2523395 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2523420 - SURFACE
      ?auto_2523421 - SURFACE
      ?auto_2523422 - SURFACE
      ?auto_2523423 - SURFACE
    )
    :vars
    (
      ?auto_2523424 - HOIST
      ?auto_2523425 - PLACE
      ?auto_2523428 - PLACE
      ?auto_2523427 - HOIST
      ?auto_2523429 - SURFACE
      ?auto_2523426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523424 ?auto_2523425 ) ( IS-CRATE ?auto_2523423 ) ( not ( = ?auto_2523422 ?auto_2523423 ) ) ( not ( = ?auto_2523421 ?auto_2523422 ) ) ( not ( = ?auto_2523421 ?auto_2523423 ) ) ( not ( = ?auto_2523428 ?auto_2523425 ) ) ( HOIST-AT ?auto_2523427 ?auto_2523428 ) ( not ( = ?auto_2523424 ?auto_2523427 ) ) ( AVAILABLE ?auto_2523427 ) ( SURFACE-AT ?auto_2523423 ?auto_2523428 ) ( ON ?auto_2523423 ?auto_2523429 ) ( CLEAR ?auto_2523423 ) ( not ( = ?auto_2523422 ?auto_2523429 ) ) ( not ( = ?auto_2523423 ?auto_2523429 ) ) ( not ( = ?auto_2523421 ?auto_2523429 ) ) ( TRUCK-AT ?auto_2523426 ?auto_2523425 ) ( SURFACE-AT ?auto_2523421 ?auto_2523425 ) ( CLEAR ?auto_2523421 ) ( LIFTING ?auto_2523424 ?auto_2523422 ) ( IS-CRATE ?auto_2523422 ) ( ON ?auto_2523421 ?auto_2523420 ) ( not ( = ?auto_2523420 ?auto_2523421 ) ) ( not ( = ?auto_2523420 ?auto_2523422 ) ) ( not ( = ?auto_2523420 ?auto_2523423 ) ) ( not ( = ?auto_2523420 ?auto_2523429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2523421 ?auto_2523422 ?auto_2523423 )
      ( MAKE-3CRATE-VERIFY ?auto_2523420 ?auto_2523421 ?auto_2523422 ?auto_2523423 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2523448 - SURFACE
      ?auto_2523449 - SURFACE
      ?auto_2523450 - SURFACE
      ?auto_2523451 - SURFACE
    )
    :vars
    (
      ?auto_2523455 - HOIST
      ?auto_2523454 - PLACE
      ?auto_2523457 - PLACE
      ?auto_2523453 - HOIST
      ?auto_2523452 - SURFACE
      ?auto_2523456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523455 ?auto_2523454 ) ( IS-CRATE ?auto_2523451 ) ( not ( = ?auto_2523450 ?auto_2523451 ) ) ( not ( = ?auto_2523449 ?auto_2523450 ) ) ( not ( = ?auto_2523449 ?auto_2523451 ) ) ( not ( = ?auto_2523457 ?auto_2523454 ) ) ( HOIST-AT ?auto_2523453 ?auto_2523457 ) ( not ( = ?auto_2523455 ?auto_2523453 ) ) ( AVAILABLE ?auto_2523453 ) ( SURFACE-AT ?auto_2523451 ?auto_2523457 ) ( ON ?auto_2523451 ?auto_2523452 ) ( CLEAR ?auto_2523451 ) ( not ( = ?auto_2523450 ?auto_2523452 ) ) ( not ( = ?auto_2523451 ?auto_2523452 ) ) ( not ( = ?auto_2523449 ?auto_2523452 ) ) ( TRUCK-AT ?auto_2523456 ?auto_2523454 ) ( SURFACE-AT ?auto_2523449 ?auto_2523454 ) ( CLEAR ?auto_2523449 ) ( IS-CRATE ?auto_2523450 ) ( AVAILABLE ?auto_2523455 ) ( IN ?auto_2523450 ?auto_2523456 ) ( ON ?auto_2523449 ?auto_2523448 ) ( not ( = ?auto_2523448 ?auto_2523449 ) ) ( not ( = ?auto_2523448 ?auto_2523450 ) ) ( not ( = ?auto_2523448 ?auto_2523451 ) ) ( not ( = ?auto_2523448 ?auto_2523452 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2523449 ?auto_2523450 ?auto_2523451 )
      ( MAKE-3CRATE-VERIFY ?auto_2523448 ?auto_2523449 ?auto_2523450 ?auto_2523451 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2523739 - SURFACE
      ?auto_2523740 - SURFACE
      ?auto_2523741 - SURFACE
      ?auto_2523743 - SURFACE
      ?auto_2523742 - SURFACE
    )
    :vars
    (
      ?auto_2523745 - HOIST
      ?auto_2523744 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523745 ?auto_2523744 ) ( SURFACE-AT ?auto_2523743 ?auto_2523744 ) ( CLEAR ?auto_2523743 ) ( LIFTING ?auto_2523745 ?auto_2523742 ) ( IS-CRATE ?auto_2523742 ) ( not ( = ?auto_2523743 ?auto_2523742 ) ) ( ON ?auto_2523740 ?auto_2523739 ) ( ON ?auto_2523741 ?auto_2523740 ) ( ON ?auto_2523743 ?auto_2523741 ) ( not ( = ?auto_2523739 ?auto_2523740 ) ) ( not ( = ?auto_2523739 ?auto_2523741 ) ) ( not ( = ?auto_2523739 ?auto_2523743 ) ) ( not ( = ?auto_2523739 ?auto_2523742 ) ) ( not ( = ?auto_2523740 ?auto_2523741 ) ) ( not ( = ?auto_2523740 ?auto_2523743 ) ) ( not ( = ?auto_2523740 ?auto_2523742 ) ) ( not ( = ?auto_2523741 ?auto_2523743 ) ) ( not ( = ?auto_2523741 ?auto_2523742 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2523743 ?auto_2523742 )
      ( MAKE-4CRATE-VERIFY ?auto_2523739 ?auto_2523740 ?auto_2523741 ?auto_2523743 ?auto_2523742 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2523764 - SURFACE
      ?auto_2523765 - SURFACE
      ?auto_2523766 - SURFACE
      ?auto_2523768 - SURFACE
      ?auto_2523767 - SURFACE
    )
    :vars
    (
      ?auto_2523770 - HOIST
      ?auto_2523771 - PLACE
      ?auto_2523769 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523770 ?auto_2523771 ) ( SURFACE-AT ?auto_2523768 ?auto_2523771 ) ( CLEAR ?auto_2523768 ) ( IS-CRATE ?auto_2523767 ) ( not ( = ?auto_2523768 ?auto_2523767 ) ) ( TRUCK-AT ?auto_2523769 ?auto_2523771 ) ( AVAILABLE ?auto_2523770 ) ( IN ?auto_2523767 ?auto_2523769 ) ( ON ?auto_2523768 ?auto_2523766 ) ( not ( = ?auto_2523766 ?auto_2523768 ) ) ( not ( = ?auto_2523766 ?auto_2523767 ) ) ( ON ?auto_2523765 ?auto_2523764 ) ( ON ?auto_2523766 ?auto_2523765 ) ( not ( = ?auto_2523764 ?auto_2523765 ) ) ( not ( = ?auto_2523764 ?auto_2523766 ) ) ( not ( = ?auto_2523764 ?auto_2523768 ) ) ( not ( = ?auto_2523764 ?auto_2523767 ) ) ( not ( = ?auto_2523765 ?auto_2523766 ) ) ( not ( = ?auto_2523765 ?auto_2523768 ) ) ( not ( = ?auto_2523765 ?auto_2523767 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2523766 ?auto_2523768 ?auto_2523767 )
      ( MAKE-4CRATE-VERIFY ?auto_2523764 ?auto_2523765 ?auto_2523766 ?auto_2523768 ?auto_2523767 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2523794 - SURFACE
      ?auto_2523795 - SURFACE
      ?auto_2523796 - SURFACE
      ?auto_2523798 - SURFACE
      ?auto_2523797 - SURFACE
    )
    :vars
    (
      ?auto_2523800 - HOIST
      ?auto_2523801 - PLACE
      ?auto_2523799 - TRUCK
      ?auto_2523802 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523800 ?auto_2523801 ) ( SURFACE-AT ?auto_2523798 ?auto_2523801 ) ( CLEAR ?auto_2523798 ) ( IS-CRATE ?auto_2523797 ) ( not ( = ?auto_2523798 ?auto_2523797 ) ) ( AVAILABLE ?auto_2523800 ) ( IN ?auto_2523797 ?auto_2523799 ) ( ON ?auto_2523798 ?auto_2523796 ) ( not ( = ?auto_2523796 ?auto_2523798 ) ) ( not ( = ?auto_2523796 ?auto_2523797 ) ) ( TRUCK-AT ?auto_2523799 ?auto_2523802 ) ( not ( = ?auto_2523802 ?auto_2523801 ) ) ( ON ?auto_2523795 ?auto_2523794 ) ( ON ?auto_2523796 ?auto_2523795 ) ( not ( = ?auto_2523794 ?auto_2523795 ) ) ( not ( = ?auto_2523794 ?auto_2523796 ) ) ( not ( = ?auto_2523794 ?auto_2523798 ) ) ( not ( = ?auto_2523794 ?auto_2523797 ) ) ( not ( = ?auto_2523795 ?auto_2523796 ) ) ( not ( = ?auto_2523795 ?auto_2523798 ) ) ( not ( = ?auto_2523795 ?auto_2523797 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2523796 ?auto_2523798 ?auto_2523797 )
      ( MAKE-4CRATE-VERIFY ?auto_2523794 ?auto_2523795 ?auto_2523796 ?auto_2523798 ?auto_2523797 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2523828 - SURFACE
      ?auto_2523829 - SURFACE
      ?auto_2523830 - SURFACE
      ?auto_2523832 - SURFACE
      ?auto_2523831 - SURFACE
    )
    :vars
    (
      ?auto_2523837 - HOIST
      ?auto_2523836 - PLACE
      ?auto_2523833 - TRUCK
      ?auto_2523835 - PLACE
      ?auto_2523834 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523837 ?auto_2523836 ) ( SURFACE-AT ?auto_2523832 ?auto_2523836 ) ( CLEAR ?auto_2523832 ) ( IS-CRATE ?auto_2523831 ) ( not ( = ?auto_2523832 ?auto_2523831 ) ) ( AVAILABLE ?auto_2523837 ) ( ON ?auto_2523832 ?auto_2523830 ) ( not ( = ?auto_2523830 ?auto_2523832 ) ) ( not ( = ?auto_2523830 ?auto_2523831 ) ) ( TRUCK-AT ?auto_2523833 ?auto_2523835 ) ( not ( = ?auto_2523835 ?auto_2523836 ) ) ( HOIST-AT ?auto_2523834 ?auto_2523835 ) ( LIFTING ?auto_2523834 ?auto_2523831 ) ( not ( = ?auto_2523837 ?auto_2523834 ) ) ( ON ?auto_2523829 ?auto_2523828 ) ( ON ?auto_2523830 ?auto_2523829 ) ( not ( = ?auto_2523828 ?auto_2523829 ) ) ( not ( = ?auto_2523828 ?auto_2523830 ) ) ( not ( = ?auto_2523828 ?auto_2523832 ) ) ( not ( = ?auto_2523828 ?auto_2523831 ) ) ( not ( = ?auto_2523829 ?auto_2523830 ) ) ( not ( = ?auto_2523829 ?auto_2523832 ) ) ( not ( = ?auto_2523829 ?auto_2523831 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2523830 ?auto_2523832 ?auto_2523831 )
      ( MAKE-4CRATE-VERIFY ?auto_2523828 ?auto_2523829 ?auto_2523830 ?auto_2523832 ?auto_2523831 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2523866 - SURFACE
      ?auto_2523867 - SURFACE
      ?auto_2523868 - SURFACE
      ?auto_2523870 - SURFACE
      ?auto_2523869 - SURFACE
    )
    :vars
    (
      ?auto_2523874 - HOIST
      ?auto_2523871 - PLACE
      ?auto_2523873 - TRUCK
      ?auto_2523876 - PLACE
      ?auto_2523875 - HOIST
      ?auto_2523872 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523874 ?auto_2523871 ) ( SURFACE-AT ?auto_2523870 ?auto_2523871 ) ( CLEAR ?auto_2523870 ) ( IS-CRATE ?auto_2523869 ) ( not ( = ?auto_2523870 ?auto_2523869 ) ) ( AVAILABLE ?auto_2523874 ) ( ON ?auto_2523870 ?auto_2523868 ) ( not ( = ?auto_2523868 ?auto_2523870 ) ) ( not ( = ?auto_2523868 ?auto_2523869 ) ) ( TRUCK-AT ?auto_2523873 ?auto_2523876 ) ( not ( = ?auto_2523876 ?auto_2523871 ) ) ( HOIST-AT ?auto_2523875 ?auto_2523876 ) ( not ( = ?auto_2523874 ?auto_2523875 ) ) ( AVAILABLE ?auto_2523875 ) ( SURFACE-AT ?auto_2523869 ?auto_2523876 ) ( ON ?auto_2523869 ?auto_2523872 ) ( CLEAR ?auto_2523869 ) ( not ( = ?auto_2523870 ?auto_2523872 ) ) ( not ( = ?auto_2523869 ?auto_2523872 ) ) ( not ( = ?auto_2523868 ?auto_2523872 ) ) ( ON ?auto_2523867 ?auto_2523866 ) ( ON ?auto_2523868 ?auto_2523867 ) ( not ( = ?auto_2523866 ?auto_2523867 ) ) ( not ( = ?auto_2523866 ?auto_2523868 ) ) ( not ( = ?auto_2523866 ?auto_2523870 ) ) ( not ( = ?auto_2523866 ?auto_2523869 ) ) ( not ( = ?auto_2523866 ?auto_2523872 ) ) ( not ( = ?auto_2523867 ?auto_2523868 ) ) ( not ( = ?auto_2523867 ?auto_2523870 ) ) ( not ( = ?auto_2523867 ?auto_2523869 ) ) ( not ( = ?auto_2523867 ?auto_2523872 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2523868 ?auto_2523870 ?auto_2523869 )
      ( MAKE-4CRATE-VERIFY ?auto_2523866 ?auto_2523867 ?auto_2523868 ?auto_2523870 ?auto_2523869 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2523905 - SURFACE
      ?auto_2523906 - SURFACE
      ?auto_2523907 - SURFACE
      ?auto_2523909 - SURFACE
      ?auto_2523908 - SURFACE
    )
    :vars
    (
      ?auto_2523914 - HOIST
      ?auto_2523915 - PLACE
      ?auto_2523911 - PLACE
      ?auto_2523910 - HOIST
      ?auto_2523913 - SURFACE
      ?auto_2523912 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523914 ?auto_2523915 ) ( SURFACE-AT ?auto_2523909 ?auto_2523915 ) ( CLEAR ?auto_2523909 ) ( IS-CRATE ?auto_2523908 ) ( not ( = ?auto_2523909 ?auto_2523908 ) ) ( AVAILABLE ?auto_2523914 ) ( ON ?auto_2523909 ?auto_2523907 ) ( not ( = ?auto_2523907 ?auto_2523909 ) ) ( not ( = ?auto_2523907 ?auto_2523908 ) ) ( not ( = ?auto_2523911 ?auto_2523915 ) ) ( HOIST-AT ?auto_2523910 ?auto_2523911 ) ( not ( = ?auto_2523914 ?auto_2523910 ) ) ( AVAILABLE ?auto_2523910 ) ( SURFACE-AT ?auto_2523908 ?auto_2523911 ) ( ON ?auto_2523908 ?auto_2523913 ) ( CLEAR ?auto_2523908 ) ( not ( = ?auto_2523909 ?auto_2523913 ) ) ( not ( = ?auto_2523908 ?auto_2523913 ) ) ( not ( = ?auto_2523907 ?auto_2523913 ) ) ( TRUCK-AT ?auto_2523912 ?auto_2523915 ) ( ON ?auto_2523906 ?auto_2523905 ) ( ON ?auto_2523907 ?auto_2523906 ) ( not ( = ?auto_2523905 ?auto_2523906 ) ) ( not ( = ?auto_2523905 ?auto_2523907 ) ) ( not ( = ?auto_2523905 ?auto_2523909 ) ) ( not ( = ?auto_2523905 ?auto_2523908 ) ) ( not ( = ?auto_2523905 ?auto_2523913 ) ) ( not ( = ?auto_2523906 ?auto_2523907 ) ) ( not ( = ?auto_2523906 ?auto_2523909 ) ) ( not ( = ?auto_2523906 ?auto_2523908 ) ) ( not ( = ?auto_2523906 ?auto_2523913 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2523907 ?auto_2523909 ?auto_2523908 )
      ( MAKE-4CRATE-VERIFY ?auto_2523905 ?auto_2523906 ?auto_2523907 ?auto_2523909 ?auto_2523908 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2523944 - SURFACE
      ?auto_2523945 - SURFACE
      ?auto_2523946 - SURFACE
      ?auto_2523948 - SURFACE
      ?auto_2523947 - SURFACE
    )
    :vars
    (
      ?auto_2523950 - HOIST
      ?auto_2523953 - PLACE
      ?auto_2523954 - PLACE
      ?auto_2523952 - HOIST
      ?auto_2523949 - SURFACE
      ?auto_2523951 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523950 ?auto_2523953 ) ( IS-CRATE ?auto_2523947 ) ( not ( = ?auto_2523948 ?auto_2523947 ) ) ( not ( = ?auto_2523946 ?auto_2523948 ) ) ( not ( = ?auto_2523946 ?auto_2523947 ) ) ( not ( = ?auto_2523954 ?auto_2523953 ) ) ( HOIST-AT ?auto_2523952 ?auto_2523954 ) ( not ( = ?auto_2523950 ?auto_2523952 ) ) ( AVAILABLE ?auto_2523952 ) ( SURFACE-AT ?auto_2523947 ?auto_2523954 ) ( ON ?auto_2523947 ?auto_2523949 ) ( CLEAR ?auto_2523947 ) ( not ( = ?auto_2523948 ?auto_2523949 ) ) ( not ( = ?auto_2523947 ?auto_2523949 ) ) ( not ( = ?auto_2523946 ?auto_2523949 ) ) ( TRUCK-AT ?auto_2523951 ?auto_2523953 ) ( SURFACE-AT ?auto_2523946 ?auto_2523953 ) ( CLEAR ?auto_2523946 ) ( LIFTING ?auto_2523950 ?auto_2523948 ) ( IS-CRATE ?auto_2523948 ) ( ON ?auto_2523945 ?auto_2523944 ) ( ON ?auto_2523946 ?auto_2523945 ) ( not ( = ?auto_2523944 ?auto_2523945 ) ) ( not ( = ?auto_2523944 ?auto_2523946 ) ) ( not ( = ?auto_2523944 ?auto_2523948 ) ) ( not ( = ?auto_2523944 ?auto_2523947 ) ) ( not ( = ?auto_2523944 ?auto_2523949 ) ) ( not ( = ?auto_2523945 ?auto_2523946 ) ) ( not ( = ?auto_2523945 ?auto_2523948 ) ) ( not ( = ?auto_2523945 ?auto_2523947 ) ) ( not ( = ?auto_2523945 ?auto_2523949 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2523946 ?auto_2523948 ?auto_2523947 )
      ( MAKE-4CRATE-VERIFY ?auto_2523944 ?auto_2523945 ?auto_2523946 ?auto_2523948 ?auto_2523947 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2523983 - SURFACE
      ?auto_2523984 - SURFACE
      ?auto_2523985 - SURFACE
      ?auto_2523987 - SURFACE
      ?auto_2523986 - SURFACE
    )
    :vars
    (
      ?auto_2523988 - HOIST
      ?auto_2523993 - PLACE
      ?auto_2523989 - PLACE
      ?auto_2523990 - HOIST
      ?auto_2523991 - SURFACE
      ?auto_2523992 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523988 ?auto_2523993 ) ( IS-CRATE ?auto_2523986 ) ( not ( = ?auto_2523987 ?auto_2523986 ) ) ( not ( = ?auto_2523985 ?auto_2523987 ) ) ( not ( = ?auto_2523985 ?auto_2523986 ) ) ( not ( = ?auto_2523989 ?auto_2523993 ) ) ( HOIST-AT ?auto_2523990 ?auto_2523989 ) ( not ( = ?auto_2523988 ?auto_2523990 ) ) ( AVAILABLE ?auto_2523990 ) ( SURFACE-AT ?auto_2523986 ?auto_2523989 ) ( ON ?auto_2523986 ?auto_2523991 ) ( CLEAR ?auto_2523986 ) ( not ( = ?auto_2523987 ?auto_2523991 ) ) ( not ( = ?auto_2523986 ?auto_2523991 ) ) ( not ( = ?auto_2523985 ?auto_2523991 ) ) ( TRUCK-AT ?auto_2523992 ?auto_2523993 ) ( SURFACE-AT ?auto_2523985 ?auto_2523993 ) ( CLEAR ?auto_2523985 ) ( IS-CRATE ?auto_2523987 ) ( AVAILABLE ?auto_2523988 ) ( IN ?auto_2523987 ?auto_2523992 ) ( ON ?auto_2523984 ?auto_2523983 ) ( ON ?auto_2523985 ?auto_2523984 ) ( not ( = ?auto_2523983 ?auto_2523984 ) ) ( not ( = ?auto_2523983 ?auto_2523985 ) ) ( not ( = ?auto_2523983 ?auto_2523987 ) ) ( not ( = ?auto_2523983 ?auto_2523986 ) ) ( not ( = ?auto_2523983 ?auto_2523991 ) ) ( not ( = ?auto_2523984 ?auto_2523985 ) ) ( not ( = ?auto_2523984 ?auto_2523987 ) ) ( not ( = ?auto_2523984 ?auto_2523986 ) ) ( not ( = ?auto_2523984 ?auto_2523991 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2523985 ?auto_2523987 ?auto_2523986 )
      ( MAKE-4CRATE-VERIFY ?auto_2523983 ?auto_2523984 ?auto_2523985 ?auto_2523987 ?auto_2523986 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2524643 - SURFACE
      ?auto_2524644 - SURFACE
      ?auto_2524645 - SURFACE
      ?auto_2524647 - SURFACE
      ?auto_2524646 - SURFACE
      ?auto_2524648 - SURFACE
    )
    :vars
    (
      ?auto_2524649 - HOIST
      ?auto_2524650 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524649 ?auto_2524650 ) ( SURFACE-AT ?auto_2524646 ?auto_2524650 ) ( CLEAR ?auto_2524646 ) ( LIFTING ?auto_2524649 ?auto_2524648 ) ( IS-CRATE ?auto_2524648 ) ( not ( = ?auto_2524646 ?auto_2524648 ) ) ( ON ?auto_2524644 ?auto_2524643 ) ( ON ?auto_2524645 ?auto_2524644 ) ( ON ?auto_2524647 ?auto_2524645 ) ( ON ?auto_2524646 ?auto_2524647 ) ( not ( = ?auto_2524643 ?auto_2524644 ) ) ( not ( = ?auto_2524643 ?auto_2524645 ) ) ( not ( = ?auto_2524643 ?auto_2524647 ) ) ( not ( = ?auto_2524643 ?auto_2524646 ) ) ( not ( = ?auto_2524643 ?auto_2524648 ) ) ( not ( = ?auto_2524644 ?auto_2524645 ) ) ( not ( = ?auto_2524644 ?auto_2524647 ) ) ( not ( = ?auto_2524644 ?auto_2524646 ) ) ( not ( = ?auto_2524644 ?auto_2524648 ) ) ( not ( = ?auto_2524645 ?auto_2524647 ) ) ( not ( = ?auto_2524645 ?auto_2524646 ) ) ( not ( = ?auto_2524645 ?auto_2524648 ) ) ( not ( = ?auto_2524647 ?auto_2524646 ) ) ( not ( = ?auto_2524647 ?auto_2524648 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2524646 ?auto_2524648 )
      ( MAKE-5CRATE-VERIFY ?auto_2524643 ?auto_2524644 ?auto_2524645 ?auto_2524647 ?auto_2524646 ?auto_2524648 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2524677 - SURFACE
      ?auto_2524678 - SURFACE
      ?auto_2524679 - SURFACE
      ?auto_2524681 - SURFACE
      ?auto_2524680 - SURFACE
      ?auto_2524682 - SURFACE
    )
    :vars
    (
      ?auto_2524684 - HOIST
      ?auto_2524685 - PLACE
      ?auto_2524683 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524684 ?auto_2524685 ) ( SURFACE-AT ?auto_2524680 ?auto_2524685 ) ( CLEAR ?auto_2524680 ) ( IS-CRATE ?auto_2524682 ) ( not ( = ?auto_2524680 ?auto_2524682 ) ) ( TRUCK-AT ?auto_2524683 ?auto_2524685 ) ( AVAILABLE ?auto_2524684 ) ( IN ?auto_2524682 ?auto_2524683 ) ( ON ?auto_2524680 ?auto_2524681 ) ( not ( = ?auto_2524681 ?auto_2524680 ) ) ( not ( = ?auto_2524681 ?auto_2524682 ) ) ( ON ?auto_2524678 ?auto_2524677 ) ( ON ?auto_2524679 ?auto_2524678 ) ( ON ?auto_2524681 ?auto_2524679 ) ( not ( = ?auto_2524677 ?auto_2524678 ) ) ( not ( = ?auto_2524677 ?auto_2524679 ) ) ( not ( = ?auto_2524677 ?auto_2524681 ) ) ( not ( = ?auto_2524677 ?auto_2524680 ) ) ( not ( = ?auto_2524677 ?auto_2524682 ) ) ( not ( = ?auto_2524678 ?auto_2524679 ) ) ( not ( = ?auto_2524678 ?auto_2524681 ) ) ( not ( = ?auto_2524678 ?auto_2524680 ) ) ( not ( = ?auto_2524678 ?auto_2524682 ) ) ( not ( = ?auto_2524679 ?auto_2524681 ) ) ( not ( = ?auto_2524679 ?auto_2524680 ) ) ( not ( = ?auto_2524679 ?auto_2524682 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2524681 ?auto_2524680 ?auto_2524682 )
      ( MAKE-5CRATE-VERIFY ?auto_2524677 ?auto_2524678 ?auto_2524679 ?auto_2524681 ?auto_2524680 ?auto_2524682 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2524717 - SURFACE
      ?auto_2524718 - SURFACE
      ?auto_2524719 - SURFACE
      ?auto_2524721 - SURFACE
      ?auto_2524720 - SURFACE
      ?auto_2524722 - SURFACE
    )
    :vars
    (
      ?auto_2524723 - HOIST
      ?auto_2524725 - PLACE
      ?auto_2524726 - TRUCK
      ?auto_2524724 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524723 ?auto_2524725 ) ( SURFACE-AT ?auto_2524720 ?auto_2524725 ) ( CLEAR ?auto_2524720 ) ( IS-CRATE ?auto_2524722 ) ( not ( = ?auto_2524720 ?auto_2524722 ) ) ( AVAILABLE ?auto_2524723 ) ( IN ?auto_2524722 ?auto_2524726 ) ( ON ?auto_2524720 ?auto_2524721 ) ( not ( = ?auto_2524721 ?auto_2524720 ) ) ( not ( = ?auto_2524721 ?auto_2524722 ) ) ( TRUCK-AT ?auto_2524726 ?auto_2524724 ) ( not ( = ?auto_2524724 ?auto_2524725 ) ) ( ON ?auto_2524718 ?auto_2524717 ) ( ON ?auto_2524719 ?auto_2524718 ) ( ON ?auto_2524721 ?auto_2524719 ) ( not ( = ?auto_2524717 ?auto_2524718 ) ) ( not ( = ?auto_2524717 ?auto_2524719 ) ) ( not ( = ?auto_2524717 ?auto_2524721 ) ) ( not ( = ?auto_2524717 ?auto_2524720 ) ) ( not ( = ?auto_2524717 ?auto_2524722 ) ) ( not ( = ?auto_2524718 ?auto_2524719 ) ) ( not ( = ?auto_2524718 ?auto_2524721 ) ) ( not ( = ?auto_2524718 ?auto_2524720 ) ) ( not ( = ?auto_2524718 ?auto_2524722 ) ) ( not ( = ?auto_2524719 ?auto_2524721 ) ) ( not ( = ?auto_2524719 ?auto_2524720 ) ) ( not ( = ?auto_2524719 ?auto_2524722 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2524721 ?auto_2524720 ?auto_2524722 )
      ( MAKE-5CRATE-VERIFY ?auto_2524717 ?auto_2524718 ?auto_2524719 ?auto_2524721 ?auto_2524720 ?auto_2524722 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2524762 - SURFACE
      ?auto_2524763 - SURFACE
      ?auto_2524764 - SURFACE
      ?auto_2524766 - SURFACE
      ?auto_2524765 - SURFACE
      ?auto_2524767 - SURFACE
    )
    :vars
    (
      ?auto_2524772 - HOIST
      ?auto_2524770 - PLACE
      ?auto_2524768 - TRUCK
      ?auto_2524771 - PLACE
      ?auto_2524769 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524772 ?auto_2524770 ) ( SURFACE-AT ?auto_2524765 ?auto_2524770 ) ( CLEAR ?auto_2524765 ) ( IS-CRATE ?auto_2524767 ) ( not ( = ?auto_2524765 ?auto_2524767 ) ) ( AVAILABLE ?auto_2524772 ) ( ON ?auto_2524765 ?auto_2524766 ) ( not ( = ?auto_2524766 ?auto_2524765 ) ) ( not ( = ?auto_2524766 ?auto_2524767 ) ) ( TRUCK-AT ?auto_2524768 ?auto_2524771 ) ( not ( = ?auto_2524771 ?auto_2524770 ) ) ( HOIST-AT ?auto_2524769 ?auto_2524771 ) ( LIFTING ?auto_2524769 ?auto_2524767 ) ( not ( = ?auto_2524772 ?auto_2524769 ) ) ( ON ?auto_2524763 ?auto_2524762 ) ( ON ?auto_2524764 ?auto_2524763 ) ( ON ?auto_2524766 ?auto_2524764 ) ( not ( = ?auto_2524762 ?auto_2524763 ) ) ( not ( = ?auto_2524762 ?auto_2524764 ) ) ( not ( = ?auto_2524762 ?auto_2524766 ) ) ( not ( = ?auto_2524762 ?auto_2524765 ) ) ( not ( = ?auto_2524762 ?auto_2524767 ) ) ( not ( = ?auto_2524763 ?auto_2524764 ) ) ( not ( = ?auto_2524763 ?auto_2524766 ) ) ( not ( = ?auto_2524763 ?auto_2524765 ) ) ( not ( = ?auto_2524763 ?auto_2524767 ) ) ( not ( = ?auto_2524764 ?auto_2524766 ) ) ( not ( = ?auto_2524764 ?auto_2524765 ) ) ( not ( = ?auto_2524764 ?auto_2524767 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2524766 ?auto_2524765 ?auto_2524767 )
      ( MAKE-5CRATE-VERIFY ?auto_2524762 ?auto_2524763 ?auto_2524764 ?auto_2524766 ?auto_2524765 ?auto_2524767 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2524812 - SURFACE
      ?auto_2524813 - SURFACE
      ?auto_2524814 - SURFACE
      ?auto_2524816 - SURFACE
      ?auto_2524815 - SURFACE
      ?auto_2524817 - SURFACE
    )
    :vars
    (
      ?auto_2524820 - HOIST
      ?auto_2524821 - PLACE
      ?auto_2524818 - TRUCK
      ?auto_2524823 - PLACE
      ?auto_2524819 - HOIST
      ?auto_2524822 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524820 ?auto_2524821 ) ( SURFACE-AT ?auto_2524815 ?auto_2524821 ) ( CLEAR ?auto_2524815 ) ( IS-CRATE ?auto_2524817 ) ( not ( = ?auto_2524815 ?auto_2524817 ) ) ( AVAILABLE ?auto_2524820 ) ( ON ?auto_2524815 ?auto_2524816 ) ( not ( = ?auto_2524816 ?auto_2524815 ) ) ( not ( = ?auto_2524816 ?auto_2524817 ) ) ( TRUCK-AT ?auto_2524818 ?auto_2524823 ) ( not ( = ?auto_2524823 ?auto_2524821 ) ) ( HOIST-AT ?auto_2524819 ?auto_2524823 ) ( not ( = ?auto_2524820 ?auto_2524819 ) ) ( AVAILABLE ?auto_2524819 ) ( SURFACE-AT ?auto_2524817 ?auto_2524823 ) ( ON ?auto_2524817 ?auto_2524822 ) ( CLEAR ?auto_2524817 ) ( not ( = ?auto_2524815 ?auto_2524822 ) ) ( not ( = ?auto_2524817 ?auto_2524822 ) ) ( not ( = ?auto_2524816 ?auto_2524822 ) ) ( ON ?auto_2524813 ?auto_2524812 ) ( ON ?auto_2524814 ?auto_2524813 ) ( ON ?auto_2524816 ?auto_2524814 ) ( not ( = ?auto_2524812 ?auto_2524813 ) ) ( not ( = ?auto_2524812 ?auto_2524814 ) ) ( not ( = ?auto_2524812 ?auto_2524816 ) ) ( not ( = ?auto_2524812 ?auto_2524815 ) ) ( not ( = ?auto_2524812 ?auto_2524817 ) ) ( not ( = ?auto_2524812 ?auto_2524822 ) ) ( not ( = ?auto_2524813 ?auto_2524814 ) ) ( not ( = ?auto_2524813 ?auto_2524816 ) ) ( not ( = ?auto_2524813 ?auto_2524815 ) ) ( not ( = ?auto_2524813 ?auto_2524817 ) ) ( not ( = ?auto_2524813 ?auto_2524822 ) ) ( not ( = ?auto_2524814 ?auto_2524816 ) ) ( not ( = ?auto_2524814 ?auto_2524815 ) ) ( not ( = ?auto_2524814 ?auto_2524817 ) ) ( not ( = ?auto_2524814 ?auto_2524822 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2524816 ?auto_2524815 ?auto_2524817 )
      ( MAKE-5CRATE-VERIFY ?auto_2524812 ?auto_2524813 ?auto_2524814 ?auto_2524816 ?auto_2524815 ?auto_2524817 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2524863 - SURFACE
      ?auto_2524864 - SURFACE
      ?auto_2524865 - SURFACE
      ?auto_2524867 - SURFACE
      ?auto_2524866 - SURFACE
      ?auto_2524868 - SURFACE
    )
    :vars
    (
      ?auto_2524872 - HOIST
      ?auto_2524871 - PLACE
      ?auto_2524869 - PLACE
      ?auto_2524870 - HOIST
      ?auto_2524874 - SURFACE
      ?auto_2524873 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524872 ?auto_2524871 ) ( SURFACE-AT ?auto_2524866 ?auto_2524871 ) ( CLEAR ?auto_2524866 ) ( IS-CRATE ?auto_2524868 ) ( not ( = ?auto_2524866 ?auto_2524868 ) ) ( AVAILABLE ?auto_2524872 ) ( ON ?auto_2524866 ?auto_2524867 ) ( not ( = ?auto_2524867 ?auto_2524866 ) ) ( not ( = ?auto_2524867 ?auto_2524868 ) ) ( not ( = ?auto_2524869 ?auto_2524871 ) ) ( HOIST-AT ?auto_2524870 ?auto_2524869 ) ( not ( = ?auto_2524872 ?auto_2524870 ) ) ( AVAILABLE ?auto_2524870 ) ( SURFACE-AT ?auto_2524868 ?auto_2524869 ) ( ON ?auto_2524868 ?auto_2524874 ) ( CLEAR ?auto_2524868 ) ( not ( = ?auto_2524866 ?auto_2524874 ) ) ( not ( = ?auto_2524868 ?auto_2524874 ) ) ( not ( = ?auto_2524867 ?auto_2524874 ) ) ( TRUCK-AT ?auto_2524873 ?auto_2524871 ) ( ON ?auto_2524864 ?auto_2524863 ) ( ON ?auto_2524865 ?auto_2524864 ) ( ON ?auto_2524867 ?auto_2524865 ) ( not ( = ?auto_2524863 ?auto_2524864 ) ) ( not ( = ?auto_2524863 ?auto_2524865 ) ) ( not ( = ?auto_2524863 ?auto_2524867 ) ) ( not ( = ?auto_2524863 ?auto_2524866 ) ) ( not ( = ?auto_2524863 ?auto_2524868 ) ) ( not ( = ?auto_2524863 ?auto_2524874 ) ) ( not ( = ?auto_2524864 ?auto_2524865 ) ) ( not ( = ?auto_2524864 ?auto_2524867 ) ) ( not ( = ?auto_2524864 ?auto_2524866 ) ) ( not ( = ?auto_2524864 ?auto_2524868 ) ) ( not ( = ?auto_2524864 ?auto_2524874 ) ) ( not ( = ?auto_2524865 ?auto_2524867 ) ) ( not ( = ?auto_2524865 ?auto_2524866 ) ) ( not ( = ?auto_2524865 ?auto_2524868 ) ) ( not ( = ?auto_2524865 ?auto_2524874 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2524867 ?auto_2524866 ?auto_2524868 )
      ( MAKE-5CRATE-VERIFY ?auto_2524863 ?auto_2524864 ?auto_2524865 ?auto_2524867 ?auto_2524866 ?auto_2524868 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2524914 - SURFACE
      ?auto_2524915 - SURFACE
      ?auto_2524916 - SURFACE
      ?auto_2524918 - SURFACE
      ?auto_2524917 - SURFACE
      ?auto_2524919 - SURFACE
    )
    :vars
    (
      ?auto_2524920 - HOIST
      ?auto_2524923 - PLACE
      ?auto_2524924 - PLACE
      ?auto_2524925 - HOIST
      ?auto_2524921 - SURFACE
      ?auto_2524922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524920 ?auto_2524923 ) ( IS-CRATE ?auto_2524919 ) ( not ( = ?auto_2524917 ?auto_2524919 ) ) ( not ( = ?auto_2524918 ?auto_2524917 ) ) ( not ( = ?auto_2524918 ?auto_2524919 ) ) ( not ( = ?auto_2524924 ?auto_2524923 ) ) ( HOIST-AT ?auto_2524925 ?auto_2524924 ) ( not ( = ?auto_2524920 ?auto_2524925 ) ) ( AVAILABLE ?auto_2524925 ) ( SURFACE-AT ?auto_2524919 ?auto_2524924 ) ( ON ?auto_2524919 ?auto_2524921 ) ( CLEAR ?auto_2524919 ) ( not ( = ?auto_2524917 ?auto_2524921 ) ) ( not ( = ?auto_2524919 ?auto_2524921 ) ) ( not ( = ?auto_2524918 ?auto_2524921 ) ) ( TRUCK-AT ?auto_2524922 ?auto_2524923 ) ( SURFACE-AT ?auto_2524918 ?auto_2524923 ) ( CLEAR ?auto_2524918 ) ( LIFTING ?auto_2524920 ?auto_2524917 ) ( IS-CRATE ?auto_2524917 ) ( ON ?auto_2524915 ?auto_2524914 ) ( ON ?auto_2524916 ?auto_2524915 ) ( ON ?auto_2524918 ?auto_2524916 ) ( not ( = ?auto_2524914 ?auto_2524915 ) ) ( not ( = ?auto_2524914 ?auto_2524916 ) ) ( not ( = ?auto_2524914 ?auto_2524918 ) ) ( not ( = ?auto_2524914 ?auto_2524917 ) ) ( not ( = ?auto_2524914 ?auto_2524919 ) ) ( not ( = ?auto_2524914 ?auto_2524921 ) ) ( not ( = ?auto_2524915 ?auto_2524916 ) ) ( not ( = ?auto_2524915 ?auto_2524918 ) ) ( not ( = ?auto_2524915 ?auto_2524917 ) ) ( not ( = ?auto_2524915 ?auto_2524919 ) ) ( not ( = ?auto_2524915 ?auto_2524921 ) ) ( not ( = ?auto_2524916 ?auto_2524918 ) ) ( not ( = ?auto_2524916 ?auto_2524917 ) ) ( not ( = ?auto_2524916 ?auto_2524919 ) ) ( not ( = ?auto_2524916 ?auto_2524921 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2524918 ?auto_2524917 ?auto_2524919 )
      ( MAKE-5CRATE-VERIFY ?auto_2524914 ?auto_2524915 ?auto_2524916 ?auto_2524918 ?auto_2524917 ?auto_2524919 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2524965 - SURFACE
      ?auto_2524966 - SURFACE
      ?auto_2524967 - SURFACE
      ?auto_2524969 - SURFACE
      ?auto_2524968 - SURFACE
      ?auto_2524970 - SURFACE
    )
    :vars
    (
      ?auto_2524971 - HOIST
      ?auto_2524976 - PLACE
      ?auto_2524975 - PLACE
      ?auto_2524973 - HOIST
      ?auto_2524972 - SURFACE
      ?auto_2524974 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524971 ?auto_2524976 ) ( IS-CRATE ?auto_2524970 ) ( not ( = ?auto_2524968 ?auto_2524970 ) ) ( not ( = ?auto_2524969 ?auto_2524968 ) ) ( not ( = ?auto_2524969 ?auto_2524970 ) ) ( not ( = ?auto_2524975 ?auto_2524976 ) ) ( HOIST-AT ?auto_2524973 ?auto_2524975 ) ( not ( = ?auto_2524971 ?auto_2524973 ) ) ( AVAILABLE ?auto_2524973 ) ( SURFACE-AT ?auto_2524970 ?auto_2524975 ) ( ON ?auto_2524970 ?auto_2524972 ) ( CLEAR ?auto_2524970 ) ( not ( = ?auto_2524968 ?auto_2524972 ) ) ( not ( = ?auto_2524970 ?auto_2524972 ) ) ( not ( = ?auto_2524969 ?auto_2524972 ) ) ( TRUCK-AT ?auto_2524974 ?auto_2524976 ) ( SURFACE-AT ?auto_2524969 ?auto_2524976 ) ( CLEAR ?auto_2524969 ) ( IS-CRATE ?auto_2524968 ) ( AVAILABLE ?auto_2524971 ) ( IN ?auto_2524968 ?auto_2524974 ) ( ON ?auto_2524966 ?auto_2524965 ) ( ON ?auto_2524967 ?auto_2524966 ) ( ON ?auto_2524969 ?auto_2524967 ) ( not ( = ?auto_2524965 ?auto_2524966 ) ) ( not ( = ?auto_2524965 ?auto_2524967 ) ) ( not ( = ?auto_2524965 ?auto_2524969 ) ) ( not ( = ?auto_2524965 ?auto_2524968 ) ) ( not ( = ?auto_2524965 ?auto_2524970 ) ) ( not ( = ?auto_2524965 ?auto_2524972 ) ) ( not ( = ?auto_2524966 ?auto_2524967 ) ) ( not ( = ?auto_2524966 ?auto_2524969 ) ) ( not ( = ?auto_2524966 ?auto_2524968 ) ) ( not ( = ?auto_2524966 ?auto_2524970 ) ) ( not ( = ?auto_2524966 ?auto_2524972 ) ) ( not ( = ?auto_2524967 ?auto_2524969 ) ) ( not ( = ?auto_2524967 ?auto_2524968 ) ) ( not ( = ?auto_2524967 ?auto_2524970 ) ) ( not ( = ?auto_2524967 ?auto_2524972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2524969 ?auto_2524968 ?auto_2524970 )
      ( MAKE-5CRATE-VERIFY ?auto_2524965 ?auto_2524966 ?auto_2524967 ?auto_2524969 ?auto_2524968 ?auto_2524970 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2526174 - SURFACE
      ?auto_2526175 - SURFACE
      ?auto_2526176 - SURFACE
      ?auto_2526178 - SURFACE
      ?auto_2526177 - SURFACE
      ?auto_2526179 - SURFACE
      ?auto_2526180 - SURFACE
    )
    :vars
    (
      ?auto_2526181 - HOIST
      ?auto_2526182 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526181 ?auto_2526182 ) ( SURFACE-AT ?auto_2526179 ?auto_2526182 ) ( CLEAR ?auto_2526179 ) ( LIFTING ?auto_2526181 ?auto_2526180 ) ( IS-CRATE ?auto_2526180 ) ( not ( = ?auto_2526179 ?auto_2526180 ) ) ( ON ?auto_2526175 ?auto_2526174 ) ( ON ?auto_2526176 ?auto_2526175 ) ( ON ?auto_2526178 ?auto_2526176 ) ( ON ?auto_2526177 ?auto_2526178 ) ( ON ?auto_2526179 ?auto_2526177 ) ( not ( = ?auto_2526174 ?auto_2526175 ) ) ( not ( = ?auto_2526174 ?auto_2526176 ) ) ( not ( = ?auto_2526174 ?auto_2526178 ) ) ( not ( = ?auto_2526174 ?auto_2526177 ) ) ( not ( = ?auto_2526174 ?auto_2526179 ) ) ( not ( = ?auto_2526174 ?auto_2526180 ) ) ( not ( = ?auto_2526175 ?auto_2526176 ) ) ( not ( = ?auto_2526175 ?auto_2526178 ) ) ( not ( = ?auto_2526175 ?auto_2526177 ) ) ( not ( = ?auto_2526175 ?auto_2526179 ) ) ( not ( = ?auto_2526175 ?auto_2526180 ) ) ( not ( = ?auto_2526176 ?auto_2526178 ) ) ( not ( = ?auto_2526176 ?auto_2526177 ) ) ( not ( = ?auto_2526176 ?auto_2526179 ) ) ( not ( = ?auto_2526176 ?auto_2526180 ) ) ( not ( = ?auto_2526178 ?auto_2526177 ) ) ( not ( = ?auto_2526178 ?auto_2526179 ) ) ( not ( = ?auto_2526178 ?auto_2526180 ) ) ( not ( = ?auto_2526177 ?auto_2526179 ) ) ( not ( = ?auto_2526177 ?auto_2526180 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2526179 ?auto_2526180 )
      ( MAKE-6CRATE-VERIFY ?auto_2526174 ?auto_2526175 ?auto_2526176 ?auto_2526178 ?auto_2526177 ?auto_2526179 ?auto_2526180 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2526218 - SURFACE
      ?auto_2526219 - SURFACE
      ?auto_2526220 - SURFACE
      ?auto_2526222 - SURFACE
      ?auto_2526221 - SURFACE
      ?auto_2526223 - SURFACE
      ?auto_2526224 - SURFACE
    )
    :vars
    (
      ?auto_2526226 - HOIST
      ?auto_2526225 - PLACE
      ?auto_2526227 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526226 ?auto_2526225 ) ( SURFACE-AT ?auto_2526223 ?auto_2526225 ) ( CLEAR ?auto_2526223 ) ( IS-CRATE ?auto_2526224 ) ( not ( = ?auto_2526223 ?auto_2526224 ) ) ( TRUCK-AT ?auto_2526227 ?auto_2526225 ) ( AVAILABLE ?auto_2526226 ) ( IN ?auto_2526224 ?auto_2526227 ) ( ON ?auto_2526223 ?auto_2526221 ) ( not ( = ?auto_2526221 ?auto_2526223 ) ) ( not ( = ?auto_2526221 ?auto_2526224 ) ) ( ON ?auto_2526219 ?auto_2526218 ) ( ON ?auto_2526220 ?auto_2526219 ) ( ON ?auto_2526222 ?auto_2526220 ) ( ON ?auto_2526221 ?auto_2526222 ) ( not ( = ?auto_2526218 ?auto_2526219 ) ) ( not ( = ?auto_2526218 ?auto_2526220 ) ) ( not ( = ?auto_2526218 ?auto_2526222 ) ) ( not ( = ?auto_2526218 ?auto_2526221 ) ) ( not ( = ?auto_2526218 ?auto_2526223 ) ) ( not ( = ?auto_2526218 ?auto_2526224 ) ) ( not ( = ?auto_2526219 ?auto_2526220 ) ) ( not ( = ?auto_2526219 ?auto_2526222 ) ) ( not ( = ?auto_2526219 ?auto_2526221 ) ) ( not ( = ?auto_2526219 ?auto_2526223 ) ) ( not ( = ?auto_2526219 ?auto_2526224 ) ) ( not ( = ?auto_2526220 ?auto_2526222 ) ) ( not ( = ?auto_2526220 ?auto_2526221 ) ) ( not ( = ?auto_2526220 ?auto_2526223 ) ) ( not ( = ?auto_2526220 ?auto_2526224 ) ) ( not ( = ?auto_2526222 ?auto_2526221 ) ) ( not ( = ?auto_2526222 ?auto_2526223 ) ) ( not ( = ?auto_2526222 ?auto_2526224 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2526221 ?auto_2526223 ?auto_2526224 )
      ( MAKE-6CRATE-VERIFY ?auto_2526218 ?auto_2526219 ?auto_2526220 ?auto_2526222 ?auto_2526221 ?auto_2526223 ?auto_2526224 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2526269 - SURFACE
      ?auto_2526270 - SURFACE
      ?auto_2526271 - SURFACE
      ?auto_2526273 - SURFACE
      ?auto_2526272 - SURFACE
      ?auto_2526274 - SURFACE
      ?auto_2526275 - SURFACE
    )
    :vars
    (
      ?auto_2526279 - HOIST
      ?auto_2526276 - PLACE
      ?auto_2526278 - TRUCK
      ?auto_2526277 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526279 ?auto_2526276 ) ( SURFACE-AT ?auto_2526274 ?auto_2526276 ) ( CLEAR ?auto_2526274 ) ( IS-CRATE ?auto_2526275 ) ( not ( = ?auto_2526274 ?auto_2526275 ) ) ( AVAILABLE ?auto_2526279 ) ( IN ?auto_2526275 ?auto_2526278 ) ( ON ?auto_2526274 ?auto_2526272 ) ( not ( = ?auto_2526272 ?auto_2526274 ) ) ( not ( = ?auto_2526272 ?auto_2526275 ) ) ( TRUCK-AT ?auto_2526278 ?auto_2526277 ) ( not ( = ?auto_2526277 ?auto_2526276 ) ) ( ON ?auto_2526270 ?auto_2526269 ) ( ON ?auto_2526271 ?auto_2526270 ) ( ON ?auto_2526273 ?auto_2526271 ) ( ON ?auto_2526272 ?auto_2526273 ) ( not ( = ?auto_2526269 ?auto_2526270 ) ) ( not ( = ?auto_2526269 ?auto_2526271 ) ) ( not ( = ?auto_2526269 ?auto_2526273 ) ) ( not ( = ?auto_2526269 ?auto_2526272 ) ) ( not ( = ?auto_2526269 ?auto_2526274 ) ) ( not ( = ?auto_2526269 ?auto_2526275 ) ) ( not ( = ?auto_2526270 ?auto_2526271 ) ) ( not ( = ?auto_2526270 ?auto_2526273 ) ) ( not ( = ?auto_2526270 ?auto_2526272 ) ) ( not ( = ?auto_2526270 ?auto_2526274 ) ) ( not ( = ?auto_2526270 ?auto_2526275 ) ) ( not ( = ?auto_2526271 ?auto_2526273 ) ) ( not ( = ?auto_2526271 ?auto_2526272 ) ) ( not ( = ?auto_2526271 ?auto_2526274 ) ) ( not ( = ?auto_2526271 ?auto_2526275 ) ) ( not ( = ?auto_2526273 ?auto_2526272 ) ) ( not ( = ?auto_2526273 ?auto_2526274 ) ) ( not ( = ?auto_2526273 ?auto_2526275 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2526272 ?auto_2526274 ?auto_2526275 )
      ( MAKE-6CRATE-VERIFY ?auto_2526269 ?auto_2526270 ?auto_2526271 ?auto_2526273 ?auto_2526272 ?auto_2526274 ?auto_2526275 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2526326 - SURFACE
      ?auto_2526327 - SURFACE
      ?auto_2526328 - SURFACE
      ?auto_2526330 - SURFACE
      ?auto_2526329 - SURFACE
      ?auto_2526331 - SURFACE
      ?auto_2526332 - SURFACE
    )
    :vars
    (
      ?auto_2526337 - HOIST
      ?auto_2526336 - PLACE
      ?auto_2526333 - TRUCK
      ?auto_2526335 - PLACE
      ?auto_2526334 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526337 ?auto_2526336 ) ( SURFACE-AT ?auto_2526331 ?auto_2526336 ) ( CLEAR ?auto_2526331 ) ( IS-CRATE ?auto_2526332 ) ( not ( = ?auto_2526331 ?auto_2526332 ) ) ( AVAILABLE ?auto_2526337 ) ( ON ?auto_2526331 ?auto_2526329 ) ( not ( = ?auto_2526329 ?auto_2526331 ) ) ( not ( = ?auto_2526329 ?auto_2526332 ) ) ( TRUCK-AT ?auto_2526333 ?auto_2526335 ) ( not ( = ?auto_2526335 ?auto_2526336 ) ) ( HOIST-AT ?auto_2526334 ?auto_2526335 ) ( LIFTING ?auto_2526334 ?auto_2526332 ) ( not ( = ?auto_2526337 ?auto_2526334 ) ) ( ON ?auto_2526327 ?auto_2526326 ) ( ON ?auto_2526328 ?auto_2526327 ) ( ON ?auto_2526330 ?auto_2526328 ) ( ON ?auto_2526329 ?auto_2526330 ) ( not ( = ?auto_2526326 ?auto_2526327 ) ) ( not ( = ?auto_2526326 ?auto_2526328 ) ) ( not ( = ?auto_2526326 ?auto_2526330 ) ) ( not ( = ?auto_2526326 ?auto_2526329 ) ) ( not ( = ?auto_2526326 ?auto_2526331 ) ) ( not ( = ?auto_2526326 ?auto_2526332 ) ) ( not ( = ?auto_2526327 ?auto_2526328 ) ) ( not ( = ?auto_2526327 ?auto_2526330 ) ) ( not ( = ?auto_2526327 ?auto_2526329 ) ) ( not ( = ?auto_2526327 ?auto_2526331 ) ) ( not ( = ?auto_2526327 ?auto_2526332 ) ) ( not ( = ?auto_2526328 ?auto_2526330 ) ) ( not ( = ?auto_2526328 ?auto_2526329 ) ) ( not ( = ?auto_2526328 ?auto_2526331 ) ) ( not ( = ?auto_2526328 ?auto_2526332 ) ) ( not ( = ?auto_2526330 ?auto_2526329 ) ) ( not ( = ?auto_2526330 ?auto_2526331 ) ) ( not ( = ?auto_2526330 ?auto_2526332 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2526329 ?auto_2526331 ?auto_2526332 )
      ( MAKE-6CRATE-VERIFY ?auto_2526326 ?auto_2526327 ?auto_2526328 ?auto_2526330 ?auto_2526329 ?auto_2526331 ?auto_2526332 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2526389 - SURFACE
      ?auto_2526390 - SURFACE
      ?auto_2526391 - SURFACE
      ?auto_2526393 - SURFACE
      ?auto_2526392 - SURFACE
      ?auto_2526394 - SURFACE
      ?auto_2526395 - SURFACE
    )
    :vars
    (
      ?auto_2526398 - HOIST
      ?auto_2526396 - PLACE
      ?auto_2526399 - TRUCK
      ?auto_2526397 - PLACE
      ?auto_2526401 - HOIST
      ?auto_2526400 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526398 ?auto_2526396 ) ( SURFACE-AT ?auto_2526394 ?auto_2526396 ) ( CLEAR ?auto_2526394 ) ( IS-CRATE ?auto_2526395 ) ( not ( = ?auto_2526394 ?auto_2526395 ) ) ( AVAILABLE ?auto_2526398 ) ( ON ?auto_2526394 ?auto_2526392 ) ( not ( = ?auto_2526392 ?auto_2526394 ) ) ( not ( = ?auto_2526392 ?auto_2526395 ) ) ( TRUCK-AT ?auto_2526399 ?auto_2526397 ) ( not ( = ?auto_2526397 ?auto_2526396 ) ) ( HOIST-AT ?auto_2526401 ?auto_2526397 ) ( not ( = ?auto_2526398 ?auto_2526401 ) ) ( AVAILABLE ?auto_2526401 ) ( SURFACE-AT ?auto_2526395 ?auto_2526397 ) ( ON ?auto_2526395 ?auto_2526400 ) ( CLEAR ?auto_2526395 ) ( not ( = ?auto_2526394 ?auto_2526400 ) ) ( not ( = ?auto_2526395 ?auto_2526400 ) ) ( not ( = ?auto_2526392 ?auto_2526400 ) ) ( ON ?auto_2526390 ?auto_2526389 ) ( ON ?auto_2526391 ?auto_2526390 ) ( ON ?auto_2526393 ?auto_2526391 ) ( ON ?auto_2526392 ?auto_2526393 ) ( not ( = ?auto_2526389 ?auto_2526390 ) ) ( not ( = ?auto_2526389 ?auto_2526391 ) ) ( not ( = ?auto_2526389 ?auto_2526393 ) ) ( not ( = ?auto_2526389 ?auto_2526392 ) ) ( not ( = ?auto_2526389 ?auto_2526394 ) ) ( not ( = ?auto_2526389 ?auto_2526395 ) ) ( not ( = ?auto_2526389 ?auto_2526400 ) ) ( not ( = ?auto_2526390 ?auto_2526391 ) ) ( not ( = ?auto_2526390 ?auto_2526393 ) ) ( not ( = ?auto_2526390 ?auto_2526392 ) ) ( not ( = ?auto_2526390 ?auto_2526394 ) ) ( not ( = ?auto_2526390 ?auto_2526395 ) ) ( not ( = ?auto_2526390 ?auto_2526400 ) ) ( not ( = ?auto_2526391 ?auto_2526393 ) ) ( not ( = ?auto_2526391 ?auto_2526392 ) ) ( not ( = ?auto_2526391 ?auto_2526394 ) ) ( not ( = ?auto_2526391 ?auto_2526395 ) ) ( not ( = ?auto_2526391 ?auto_2526400 ) ) ( not ( = ?auto_2526393 ?auto_2526392 ) ) ( not ( = ?auto_2526393 ?auto_2526394 ) ) ( not ( = ?auto_2526393 ?auto_2526395 ) ) ( not ( = ?auto_2526393 ?auto_2526400 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2526392 ?auto_2526394 ?auto_2526395 )
      ( MAKE-6CRATE-VERIFY ?auto_2526389 ?auto_2526390 ?auto_2526391 ?auto_2526393 ?auto_2526392 ?auto_2526394 ?auto_2526395 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2526453 - SURFACE
      ?auto_2526454 - SURFACE
      ?auto_2526455 - SURFACE
      ?auto_2526457 - SURFACE
      ?auto_2526456 - SURFACE
      ?auto_2526458 - SURFACE
      ?auto_2526459 - SURFACE
    )
    :vars
    (
      ?auto_2526460 - HOIST
      ?auto_2526461 - PLACE
      ?auto_2526463 - PLACE
      ?auto_2526462 - HOIST
      ?auto_2526464 - SURFACE
      ?auto_2526465 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526460 ?auto_2526461 ) ( SURFACE-AT ?auto_2526458 ?auto_2526461 ) ( CLEAR ?auto_2526458 ) ( IS-CRATE ?auto_2526459 ) ( not ( = ?auto_2526458 ?auto_2526459 ) ) ( AVAILABLE ?auto_2526460 ) ( ON ?auto_2526458 ?auto_2526456 ) ( not ( = ?auto_2526456 ?auto_2526458 ) ) ( not ( = ?auto_2526456 ?auto_2526459 ) ) ( not ( = ?auto_2526463 ?auto_2526461 ) ) ( HOIST-AT ?auto_2526462 ?auto_2526463 ) ( not ( = ?auto_2526460 ?auto_2526462 ) ) ( AVAILABLE ?auto_2526462 ) ( SURFACE-AT ?auto_2526459 ?auto_2526463 ) ( ON ?auto_2526459 ?auto_2526464 ) ( CLEAR ?auto_2526459 ) ( not ( = ?auto_2526458 ?auto_2526464 ) ) ( not ( = ?auto_2526459 ?auto_2526464 ) ) ( not ( = ?auto_2526456 ?auto_2526464 ) ) ( TRUCK-AT ?auto_2526465 ?auto_2526461 ) ( ON ?auto_2526454 ?auto_2526453 ) ( ON ?auto_2526455 ?auto_2526454 ) ( ON ?auto_2526457 ?auto_2526455 ) ( ON ?auto_2526456 ?auto_2526457 ) ( not ( = ?auto_2526453 ?auto_2526454 ) ) ( not ( = ?auto_2526453 ?auto_2526455 ) ) ( not ( = ?auto_2526453 ?auto_2526457 ) ) ( not ( = ?auto_2526453 ?auto_2526456 ) ) ( not ( = ?auto_2526453 ?auto_2526458 ) ) ( not ( = ?auto_2526453 ?auto_2526459 ) ) ( not ( = ?auto_2526453 ?auto_2526464 ) ) ( not ( = ?auto_2526454 ?auto_2526455 ) ) ( not ( = ?auto_2526454 ?auto_2526457 ) ) ( not ( = ?auto_2526454 ?auto_2526456 ) ) ( not ( = ?auto_2526454 ?auto_2526458 ) ) ( not ( = ?auto_2526454 ?auto_2526459 ) ) ( not ( = ?auto_2526454 ?auto_2526464 ) ) ( not ( = ?auto_2526455 ?auto_2526457 ) ) ( not ( = ?auto_2526455 ?auto_2526456 ) ) ( not ( = ?auto_2526455 ?auto_2526458 ) ) ( not ( = ?auto_2526455 ?auto_2526459 ) ) ( not ( = ?auto_2526455 ?auto_2526464 ) ) ( not ( = ?auto_2526457 ?auto_2526456 ) ) ( not ( = ?auto_2526457 ?auto_2526458 ) ) ( not ( = ?auto_2526457 ?auto_2526459 ) ) ( not ( = ?auto_2526457 ?auto_2526464 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2526456 ?auto_2526458 ?auto_2526459 )
      ( MAKE-6CRATE-VERIFY ?auto_2526453 ?auto_2526454 ?auto_2526455 ?auto_2526457 ?auto_2526456 ?auto_2526458 ?auto_2526459 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2526517 - SURFACE
      ?auto_2526518 - SURFACE
      ?auto_2526519 - SURFACE
      ?auto_2526521 - SURFACE
      ?auto_2526520 - SURFACE
      ?auto_2526522 - SURFACE
      ?auto_2526523 - SURFACE
    )
    :vars
    (
      ?auto_2526524 - HOIST
      ?auto_2526525 - PLACE
      ?auto_2526527 - PLACE
      ?auto_2526529 - HOIST
      ?auto_2526528 - SURFACE
      ?auto_2526526 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526524 ?auto_2526525 ) ( IS-CRATE ?auto_2526523 ) ( not ( = ?auto_2526522 ?auto_2526523 ) ) ( not ( = ?auto_2526520 ?auto_2526522 ) ) ( not ( = ?auto_2526520 ?auto_2526523 ) ) ( not ( = ?auto_2526527 ?auto_2526525 ) ) ( HOIST-AT ?auto_2526529 ?auto_2526527 ) ( not ( = ?auto_2526524 ?auto_2526529 ) ) ( AVAILABLE ?auto_2526529 ) ( SURFACE-AT ?auto_2526523 ?auto_2526527 ) ( ON ?auto_2526523 ?auto_2526528 ) ( CLEAR ?auto_2526523 ) ( not ( = ?auto_2526522 ?auto_2526528 ) ) ( not ( = ?auto_2526523 ?auto_2526528 ) ) ( not ( = ?auto_2526520 ?auto_2526528 ) ) ( TRUCK-AT ?auto_2526526 ?auto_2526525 ) ( SURFACE-AT ?auto_2526520 ?auto_2526525 ) ( CLEAR ?auto_2526520 ) ( LIFTING ?auto_2526524 ?auto_2526522 ) ( IS-CRATE ?auto_2526522 ) ( ON ?auto_2526518 ?auto_2526517 ) ( ON ?auto_2526519 ?auto_2526518 ) ( ON ?auto_2526521 ?auto_2526519 ) ( ON ?auto_2526520 ?auto_2526521 ) ( not ( = ?auto_2526517 ?auto_2526518 ) ) ( not ( = ?auto_2526517 ?auto_2526519 ) ) ( not ( = ?auto_2526517 ?auto_2526521 ) ) ( not ( = ?auto_2526517 ?auto_2526520 ) ) ( not ( = ?auto_2526517 ?auto_2526522 ) ) ( not ( = ?auto_2526517 ?auto_2526523 ) ) ( not ( = ?auto_2526517 ?auto_2526528 ) ) ( not ( = ?auto_2526518 ?auto_2526519 ) ) ( not ( = ?auto_2526518 ?auto_2526521 ) ) ( not ( = ?auto_2526518 ?auto_2526520 ) ) ( not ( = ?auto_2526518 ?auto_2526522 ) ) ( not ( = ?auto_2526518 ?auto_2526523 ) ) ( not ( = ?auto_2526518 ?auto_2526528 ) ) ( not ( = ?auto_2526519 ?auto_2526521 ) ) ( not ( = ?auto_2526519 ?auto_2526520 ) ) ( not ( = ?auto_2526519 ?auto_2526522 ) ) ( not ( = ?auto_2526519 ?auto_2526523 ) ) ( not ( = ?auto_2526519 ?auto_2526528 ) ) ( not ( = ?auto_2526521 ?auto_2526520 ) ) ( not ( = ?auto_2526521 ?auto_2526522 ) ) ( not ( = ?auto_2526521 ?auto_2526523 ) ) ( not ( = ?auto_2526521 ?auto_2526528 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2526520 ?auto_2526522 ?auto_2526523 )
      ( MAKE-6CRATE-VERIFY ?auto_2526517 ?auto_2526518 ?auto_2526519 ?auto_2526521 ?auto_2526520 ?auto_2526522 ?auto_2526523 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2526581 - SURFACE
      ?auto_2526582 - SURFACE
      ?auto_2526583 - SURFACE
      ?auto_2526585 - SURFACE
      ?auto_2526584 - SURFACE
      ?auto_2526586 - SURFACE
      ?auto_2526587 - SURFACE
    )
    :vars
    (
      ?auto_2526588 - HOIST
      ?auto_2526592 - PLACE
      ?auto_2526590 - PLACE
      ?auto_2526589 - HOIST
      ?auto_2526591 - SURFACE
      ?auto_2526593 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526588 ?auto_2526592 ) ( IS-CRATE ?auto_2526587 ) ( not ( = ?auto_2526586 ?auto_2526587 ) ) ( not ( = ?auto_2526584 ?auto_2526586 ) ) ( not ( = ?auto_2526584 ?auto_2526587 ) ) ( not ( = ?auto_2526590 ?auto_2526592 ) ) ( HOIST-AT ?auto_2526589 ?auto_2526590 ) ( not ( = ?auto_2526588 ?auto_2526589 ) ) ( AVAILABLE ?auto_2526589 ) ( SURFACE-AT ?auto_2526587 ?auto_2526590 ) ( ON ?auto_2526587 ?auto_2526591 ) ( CLEAR ?auto_2526587 ) ( not ( = ?auto_2526586 ?auto_2526591 ) ) ( not ( = ?auto_2526587 ?auto_2526591 ) ) ( not ( = ?auto_2526584 ?auto_2526591 ) ) ( TRUCK-AT ?auto_2526593 ?auto_2526592 ) ( SURFACE-AT ?auto_2526584 ?auto_2526592 ) ( CLEAR ?auto_2526584 ) ( IS-CRATE ?auto_2526586 ) ( AVAILABLE ?auto_2526588 ) ( IN ?auto_2526586 ?auto_2526593 ) ( ON ?auto_2526582 ?auto_2526581 ) ( ON ?auto_2526583 ?auto_2526582 ) ( ON ?auto_2526585 ?auto_2526583 ) ( ON ?auto_2526584 ?auto_2526585 ) ( not ( = ?auto_2526581 ?auto_2526582 ) ) ( not ( = ?auto_2526581 ?auto_2526583 ) ) ( not ( = ?auto_2526581 ?auto_2526585 ) ) ( not ( = ?auto_2526581 ?auto_2526584 ) ) ( not ( = ?auto_2526581 ?auto_2526586 ) ) ( not ( = ?auto_2526581 ?auto_2526587 ) ) ( not ( = ?auto_2526581 ?auto_2526591 ) ) ( not ( = ?auto_2526582 ?auto_2526583 ) ) ( not ( = ?auto_2526582 ?auto_2526585 ) ) ( not ( = ?auto_2526582 ?auto_2526584 ) ) ( not ( = ?auto_2526582 ?auto_2526586 ) ) ( not ( = ?auto_2526582 ?auto_2526587 ) ) ( not ( = ?auto_2526582 ?auto_2526591 ) ) ( not ( = ?auto_2526583 ?auto_2526585 ) ) ( not ( = ?auto_2526583 ?auto_2526584 ) ) ( not ( = ?auto_2526583 ?auto_2526586 ) ) ( not ( = ?auto_2526583 ?auto_2526587 ) ) ( not ( = ?auto_2526583 ?auto_2526591 ) ) ( not ( = ?auto_2526585 ?auto_2526584 ) ) ( not ( = ?auto_2526585 ?auto_2526586 ) ) ( not ( = ?auto_2526585 ?auto_2526587 ) ) ( not ( = ?auto_2526585 ?auto_2526591 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2526584 ?auto_2526586 ?auto_2526587 )
      ( MAKE-6CRATE-VERIFY ?auto_2526581 ?auto_2526582 ?auto_2526583 ?auto_2526585 ?auto_2526584 ?auto_2526586 ?auto_2526587 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2528537 - SURFACE
      ?auto_2528538 - SURFACE
      ?auto_2528539 - SURFACE
      ?auto_2528541 - SURFACE
      ?auto_2528540 - SURFACE
      ?auto_2528542 - SURFACE
      ?auto_2528543 - SURFACE
      ?auto_2528544 - SURFACE
    )
    :vars
    (
      ?auto_2528546 - HOIST
      ?auto_2528545 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2528546 ?auto_2528545 ) ( SURFACE-AT ?auto_2528543 ?auto_2528545 ) ( CLEAR ?auto_2528543 ) ( LIFTING ?auto_2528546 ?auto_2528544 ) ( IS-CRATE ?auto_2528544 ) ( not ( = ?auto_2528543 ?auto_2528544 ) ) ( ON ?auto_2528538 ?auto_2528537 ) ( ON ?auto_2528539 ?auto_2528538 ) ( ON ?auto_2528541 ?auto_2528539 ) ( ON ?auto_2528540 ?auto_2528541 ) ( ON ?auto_2528542 ?auto_2528540 ) ( ON ?auto_2528543 ?auto_2528542 ) ( not ( = ?auto_2528537 ?auto_2528538 ) ) ( not ( = ?auto_2528537 ?auto_2528539 ) ) ( not ( = ?auto_2528537 ?auto_2528541 ) ) ( not ( = ?auto_2528537 ?auto_2528540 ) ) ( not ( = ?auto_2528537 ?auto_2528542 ) ) ( not ( = ?auto_2528537 ?auto_2528543 ) ) ( not ( = ?auto_2528537 ?auto_2528544 ) ) ( not ( = ?auto_2528538 ?auto_2528539 ) ) ( not ( = ?auto_2528538 ?auto_2528541 ) ) ( not ( = ?auto_2528538 ?auto_2528540 ) ) ( not ( = ?auto_2528538 ?auto_2528542 ) ) ( not ( = ?auto_2528538 ?auto_2528543 ) ) ( not ( = ?auto_2528538 ?auto_2528544 ) ) ( not ( = ?auto_2528539 ?auto_2528541 ) ) ( not ( = ?auto_2528539 ?auto_2528540 ) ) ( not ( = ?auto_2528539 ?auto_2528542 ) ) ( not ( = ?auto_2528539 ?auto_2528543 ) ) ( not ( = ?auto_2528539 ?auto_2528544 ) ) ( not ( = ?auto_2528541 ?auto_2528540 ) ) ( not ( = ?auto_2528541 ?auto_2528542 ) ) ( not ( = ?auto_2528541 ?auto_2528543 ) ) ( not ( = ?auto_2528541 ?auto_2528544 ) ) ( not ( = ?auto_2528540 ?auto_2528542 ) ) ( not ( = ?auto_2528540 ?auto_2528543 ) ) ( not ( = ?auto_2528540 ?auto_2528544 ) ) ( not ( = ?auto_2528542 ?auto_2528543 ) ) ( not ( = ?auto_2528542 ?auto_2528544 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2528543 ?auto_2528544 )
      ( MAKE-7CRATE-VERIFY ?auto_2528537 ?auto_2528538 ?auto_2528539 ?auto_2528541 ?auto_2528540 ?auto_2528542 ?auto_2528543 ?auto_2528544 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2528592 - SURFACE
      ?auto_2528593 - SURFACE
      ?auto_2528594 - SURFACE
      ?auto_2528596 - SURFACE
      ?auto_2528595 - SURFACE
      ?auto_2528597 - SURFACE
      ?auto_2528598 - SURFACE
      ?auto_2528599 - SURFACE
    )
    :vars
    (
      ?auto_2528600 - HOIST
      ?auto_2528602 - PLACE
      ?auto_2528601 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2528600 ?auto_2528602 ) ( SURFACE-AT ?auto_2528598 ?auto_2528602 ) ( CLEAR ?auto_2528598 ) ( IS-CRATE ?auto_2528599 ) ( not ( = ?auto_2528598 ?auto_2528599 ) ) ( TRUCK-AT ?auto_2528601 ?auto_2528602 ) ( AVAILABLE ?auto_2528600 ) ( IN ?auto_2528599 ?auto_2528601 ) ( ON ?auto_2528598 ?auto_2528597 ) ( not ( = ?auto_2528597 ?auto_2528598 ) ) ( not ( = ?auto_2528597 ?auto_2528599 ) ) ( ON ?auto_2528593 ?auto_2528592 ) ( ON ?auto_2528594 ?auto_2528593 ) ( ON ?auto_2528596 ?auto_2528594 ) ( ON ?auto_2528595 ?auto_2528596 ) ( ON ?auto_2528597 ?auto_2528595 ) ( not ( = ?auto_2528592 ?auto_2528593 ) ) ( not ( = ?auto_2528592 ?auto_2528594 ) ) ( not ( = ?auto_2528592 ?auto_2528596 ) ) ( not ( = ?auto_2528592 ?auto_2528595 ) ) ( not ( = ?auto_2528592 ?auto_2528597 ) ) ( not ( = ?auto_2528592 ?auto_2528598 ) ) ( not ( = ?auto_2528592 ?auto_2528599 ) ) ( not ( = ?auto_2528593 ?auto_2528594 ) ) ( not ( = ?auto_2528593 ?auto_2528596 ) ) ( not ( = ?auto_2528593 ?auto_2528595 ) ) ( not ( = ?auto_2528593 ?auto_2528597 ) ) ( not ( = ?auto_2528593 ?auto_2528598 ) ) ( not ( = ?auto_2528593 ?auto_2528599 ) ) ( not ( = ?auto_2528594 ?auto_2528596 ) ) ( not ( = ?auto_2528594 ?auto_2528595 ) ) ( not ( = ?auto_2528594 ?auto_2528597 ) ) ( not ( = ?auto_2528594 ?auto_2528598 ) ) ( not ( = ?auto_2528594 ?auto_2528599 ) ) ( not ( = ?auto_2528596 ?auto_2528595 ) ) ( not ( = ?auto_2528596 ?auto_2528597 ) ) ( not ( = ?auto_2528596 ?auto_2528598 ) ) ( not ( = ?auto_2528596 ?auto_2528599 ) ) ( not ( = ?auto_2528595 ?auto_2528597 ) ) ( not ( = ?auto_2528595 ?auto_2528598 ) ) ( not ( = ?auto_2528595 ?auto_2528599 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2528597 ?auto_2528598 ?auto_2528599 )
      ( MAKE-7CRATE-VERIFY ?auto_2528592 ?auto_2528593 ?auto_2528594 ?auto_2528596 ?auto_2528595 ?auto_2528597 ?auto_2528598 ?auto_2528599 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2528655 - SURFACE
      ?auto_2528656 - SURFACE
      ?auto_2528657 - SURFACE
      ?auto_2528659 - SURFACE
      ?auto_2528658 - SURFACE
      ?auto_2528660 - SURFACE
      ?auto_2528661 - SURFACE
      ?auto_2528662 - SURFACE
    )
    :vars
    (
      ?auto_2528663 - HOIST
      ?auto_2528666 - PLACE
      ?auto_2528664 - TRUCK
      ?auto_2528665 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2528663 ?auto_2528666 ) ( SURFACE-AT ?auto_2528661 ?auto_2528666 ) ( CLEAR ?auto_2528661 ) ( IS-CRATE ?auto_2528662 ) ( not ( = ?auto_2528661 ?auto_2528662 ) ) ( AVAILABLE ?auto_2528663 ) ( IN ?auto_2528662 ?auto_2528664 ) ( ON ?auto_2528661 ?auto_2528660 ) ( not ( = ?auto_2528660 ?auto_2528661 ) ) ( not ( = ?auto_2528660 ?auto_2528662 ) ) ( TRUCK-AT ?auto_2528664 ?auto_2528665 ) ( not ( = ?auto_2528665 ?auto_2528666 ) ) ( ON ?auto_2528656 ?auto_2528655 ) ( ON ?auto_2528657 ?auto_2528656 ) ( ON ?auto_2528659 ?auto_2528657 ) ( ON ?auto_2528658 ?auto_2528659 ) ( ON ?auto_2528660 ?auto_2528658 ) ( not ( = ?auto_2528655 ?auto_2528656 ) ) ( not ( = ?auto_2528655 ?auto_2528657 ) ) ( not ( = ?auto_2528655 ?auto_2528659 ) ) ( not ( = ?auto_2528655 ?auto_2528658 ) ) ( not ( = ?auto_2528655 ?auto_2528660 ) ) ( not ( = ?auto_2528655 ?auto_2528661 ) ) ( not ( = ?auto_2528655 ?auto_2528662 ) ) ( not ( = ?auto_2528656 ?auto_2528657 ) ) ( not ( = ?auto_2528656 ?auto_2528659 ) ) ( not ( = ?auto_2528656 ?auto_2528658 ) ) ( not ( = ?auto_2528656 ?auto_2528660 ) ) ( not ( = ?auto_2528656 ?auto_2528661 ) ) ( not ( = ?auto_2528656 ?auto_2528662 ) ) ( not ( = ?auto_2528657 ?auto_2528659 ) ) ( not ( = ?auto_2528657 ?auto_2528658 ) ) ( not ( = ?auto_2528657 ?auto_2528660 ) ) ( not ( = ?auto_2528657 ?auto_2528661 ) ) ( not ( = ?auto_2528657 ?auto_2528662 ) ) ( not ( = ?auto_2528659 ?auto_2528658 ) ) ( not ( = ?auto_2528659 ?auto_2528660 ) ) ( not ( = ?auto_2528659 ?auto_2528661 ) ) ( not ( = ?auto_2528659 ?auto_2528662 ) ) ( not ( = ?auto_2528658 ?auto_2528660 ) ) ( not ( = ?auto_2528658 ?auto_2528661 ) ) ( not ( = ?auto_2528658 ?auto_2528662 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2528660 ?auto_2528661 ?auto_2528662 )
      ( MAKE-7CRATE-VERIFY ?auto_2528655 ?auto_2528656 ?auto_2528657 ?auto_2528659 ?auto_2528658 ?auto_2528660 ?auto_2528661 ?auto_2528662 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2528725 - SURFACE
      ?auto_2528726 - SURFACE
      ?auto_2528727 - SURFACE
      ?auto_2528729 - SURFACE
      ?auto_2528728 - SURFACE
      ?auto_2528730 - SURFACE
      ?auto_2528731 - SURFACE
      ?auto_2528732 - SURFACE
    )
    :vars
    (
      ?auto_2528733 - HOIST
      ?auto_2528735 - PLACE
      ?auto_2528736 - TRUCK
      ?auto_2528734 - PLACE
      ?auto_2528737 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2528733 ?auto_2528735 ) ( SURFACE-AT ?auto_2528731 ?auto_2528735 ) ( CLEAR ?auto_2528731 ) ( IS-CRATE ?auto_2528732 ) ( not ( = ?auto_2528731 ?auto_2528732 ) ) ( AVAILABLE ?auto_2528733 ) ( ON ?auto_2528731 ?auto_2528730 ) ( not ( = ?auto_2528730 ?auto_2528731 ) ) ( not ( = ?auto_2528730 ?auto_2528732 ) ) ( TRUCK-AT ?auto_2528736 ?auto_2528734 ) ( not ( = ?auto_2528734 ?auto_2528735 ) ) ( HOIST-AT ?auto_2528737 ?auto_2528734 ) ( LIFTING ?auto_2528737 ?auto_2528732 ) ( not ( = ?auto_2528733 ?auto_2528737 ) ) ( ON ?auto_2528726 ?auto_2528725 ) ( ON ?auto_2528727 ?auto_2528726 ) ( ON ?auto_2528729 ?auto_2528727 ) ( ON ?auto_2528728 ?auto_2528729 ) ( ON ?auto_2528730 ?auto_2528728 ) ( not ( = ?auto_2528725 ?auto_2528726 ) ) ( not ( = ?auto_2528725 ?auto_2528727 ) ) ( not ( = ?auto_2528725 ?auto_2528729 ) ) ( not ( = ?auto_2528725 ?auto_2528728 ) ) ( not ( = ?auto_2528725 ?auto_2528730 ) ) ( not ( = ?auto_2528725 ?auto_2528731 ) ) ( not ( = ?auto_2528725 ?auto_2528732 ) ) ( not ( = ?auto_2528726 ?auto_2528727 ) ) ( not ( = ?auto_2528726 ?auto_2528729 ) ) ( not ( = ?auto_2528726 ?auto_2528728 ) ) ( not ( = ?auto_2528726 ?auto_2528730 ) ) ( not ( = ?auto_2528726 ?auto_2528731 ) ) ( not ( = ?auto_2528726 ?auto_2528732 ) ) ( not ( = ?auto_2528727 ?auto_2528729 ) ) ( not ( = ?auto_2528727 ?auto_2528728 ) ) ( not ( = ?auto_2528727 ?auto_2528730 ) ) ( not ( = ?auto_2528727 ?auto_2528731 ) ) ( not ( = ?auto_2528727 ?auto_2528732 ) ) ( not ( = ?auto_2528729 ?auto_2528728 ) ) ( not ( = ?auto_2528729 ?auto_2528730 ) ) ( not ( = ?auto_2528729 ?auto_2528731 ) ) ( not ( = ?auto_2528729 ?auto_2528732 ) ) ( not ( = ?auto_2528728 ?auto_2528730 ) ) ( not ( = ?auto_2528728 ?auto_2528731 ) ) ( not ( = ?auto_2528728 ?auto_2528732 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2528730 ?auto_2528731 ?auto_2528732 )
      ( MAKE-7CRATE-VERIFY ?auto_2528725 ?auto_2528726 ?auto_2528727 ?auto_2528729 ?auto_2528728 ?auto_2528730 ?auto_2528731 ?auto_2528732 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2528802 - SURFACE
      ?auto_2528803 - SURFACE
      ?auto_2528804 - SURFACE
      ?auto_2528806 - SURFACE
      ?auto_2528805 - SURFACE
      ?auto_2528807 - SURFACE
      ?auto_2528808 - SURFACE
      ?auto_2528809 - SURFACE
    )
    :vars
    (
      ?auto_2528814 - HOIST
      ?auto_2528813 - PLACE
      ?auto_2528812 - TRUCK
      ?auto_2528815 - PLACE
      ?auto_2528811 - HOIST
      ?auto_2528810 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2528814 ?auto_2528813 ) ( SURFACE-AT ?auto_2528808 ?auto_2528813 ) ( CLEAR ?auto_2528808 ) ( IS-CRATE ?auto_2528809 ) ( not ( = ?auto_2528808 ?auto_2528809 ) ) ( AVAILABLE ?auto_2528814 ) ( ON ?auto_2528808 ?auto_2528807 ) ( not ( = ?auto_2528807 ?auto_2528808 ) ) ( not ( = ?auto_2528807 ?auto_2528809 ) ) ( TRUCK-AT ?auto_2528812 ?auto_2528815 ) ( not ( = ?auto_2528815 ?auto_2528813 ) ) ( HOIST-AT ?auto_2528811 ?auto_2528815 ) ( not ( = ?auto_2528814 ?auto_2528811 ) ) ( AVAILABLE ?auto_2528811 ) ( SURFACE-AT ?auto_2528809 ?auto_2528815 ) ( ON ?auto_2528809 ?auto_2528810 ) ( CLEAR ?auto_2528809 ) ( not ( = ?auto_2528808 ?auto_2528810 ) ) ( not ( = ?auto_2528809 ?auto_2528810 ) ) ( not ( = ?auto_2528807 ?auto_2528810 ) ) ( ON ?auto_2528803 ?auto_2528802 ) ( ON ?auto_2528804 ?auto_2528803 ) ( ON ?auto_2528806 ?auto_2528804 ) ( ON ?auto_2528805 ?auto_2528806 ) ( ON ?auto_2528807 ?auto_2528805 ) ( not ( = ?auto_2528802 ?auto_2528803 ) ) ( not ( = ?auto_2528802 ?auto_2528804 ) ) ( not ( = ?auto_2528802 ?auto_2528806 ) ) ( not ( = ?auto_2528802 ?auto_2528805 ) ) ( not ( = ?auto_2528802 ?auto_2528807 ) ) ( not ( = ?auto_2528802 ?auto_2528808 ) ) ( not ( = ?auto_2528802 ?auto_2528809 ) ) ( not ( = ?auto_2528802 ?auto_2528810 ) ) ( not ( = ?auto_2528803 ?auto_2528804 ) ) ( not ( = ?auto_2528803 ?auto_2528806 ) ) ( not ( = ?auto_2528803 ?auto_2528805 ) ) ( not ( = ?auto_2528803 ?auto_2528807 ) ) ( not ( = ?auto_2528803 ?auto_2528808 ) ) ( not ( = ?auto_2528803 ?auto_2528809 ) ) ( not ( = ?auto_2528803 ?auto_2528810 ) ) ( not ( = ?auto_2528804 ?auto_2528806 ) ) ( not ( = ?auto_2528804 ?auto_2528805 ) ) ( not ( = ?auto_2528804 ?auto_2528807 ) ) ( not ( = ?auto_2528804 ?auto_2528808 ) ) ( not ( = ?auto_2528804 ?auto_2528809 ) ) ( not ( = ?auto_2528804 ?auto_2528810 ) ) ( not ( = ?auto_2528806 ?auto_2528805 ) ) ( not ( = ?auto_2528806 ?auto_2528807 ) ) ( not ( = ?auto_2528806 ?auto_2528808 ) ) ( not ( = ?auto_2528806 ?auto_2528809 ) ) ( not ( = ?auto_2528806 ?auto_2528810 ) ) ( not ( = ?auto_2528805 ?auto_2528807 ) ) ( not ( = ?auto_2528805 ?auto_2528808 ) ) ( not ( = ?auto_2528805 ?auto_2528809 ) ) ( not ( = ?auto_2528805 ?auto_2528810 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2528807 ?auto_2528808 ?auto_2528809 )
      ( MAKE-7CRATE-VERIFY ?auto_2528802 ?auto_2528803 ?auto_2528804 ?auto_2528806 ?auto_2528805 ?auto_2528807 ?auto_2528808 ?auto_2528809 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2528880 - SURFACE
      ?auto_2528881 - SURFACE
      ?auto_2528882 - SURFACE
      ?auto_2528884 - SURFACE
      ?auto_2528883 - SURFACE
      ?auto_2528885 - SURFACE
      ?auto_2528886 - SURFACE
      ?auto_2528887 - SURFACE
    )
    :vars
    (
      ?auto_2528890 - HOIST
      ?auto_2528888 - PLACE
      ?auto_2528892 - PLACE
      ?auto_2528893 - HOIST
      ?auto_2528889 - SURFACE
      ?auto_2528891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2528890 ?auto_2528888 ) ( SURFACE-AT ?auto_2528886 ?auto_2528888 ) ( CLEAR ?auto_2528886 ) ( IS-CRATE ?auto_2528887 ) ( not ( = ?auto_2528886 ?auto_2528887 ) ) ( AVAILABLE ?auto_2528890 ) ( ON ?auto_2528886 ?auto_2528885 ) ( not ( = ?auto_2528885 ?auto_2528886 ) ) ( not ( = ?auto_2528885 ?auto_2528887 ) ) ( not ( = ?auto_2528892 ?auto_2528888 ) ) ( HOIST-AT ?auto_2528893 ?auto_2528892 ) ( not ( = ?auto_2528890 ?auto_2528893 ) ) ( AVAILABLE ?auto_2528893 ) ( SURFACE-AT ?auto_2528887 ?auto_2528892 ) ( ON ?auto_2528887 ?auto_2528889 ) ( CLEAR ?auto_2528887 ) ( not ( = ?auto_2528886 ?auto_2528889 ) ) ( not ( = ?auto_2528887 ?auto_2528889 ) ) ( not ( = ?auto_2528885 ?auto_2528889 ) ) ( TRUCK-AT ?auto_2528891 ?auto_2528888 ) ( ON ?auto_2528881 ?auto_2528880 ) ( ON ?auto_2528882 ?auto_2528881 ) ( ON ?auto_2528884 ?auto_2528882 ) ( ON ?auto_2528883 ?auto_2528884 ) ( ON ?auto_2528885 ?auto_2528883 ) ( not ( = ?auto_2528880 ?auto_2528881 ) ) ( not ( = ?auto_2528880 ?auto_2528882 ) ) ( not ( = ?auto_2528880 ?auto_2528884 ) ) ( not ( = ?auto_2528880 ?auto_2528883 ) ) ( not ( = ?auto_2528880 ?auto_2528885 ) ) ( not ( = ?auto_2528880 ?auto_2528886 ) ) ( not ( = ?auto_2528880 ?auto_2528887 ) ) ( not ( = ?auto_2528880 ?auto_2528889 ) ) ( not ( = ?auto_2528881 ?auto_2528882 ) ) ( not ( = ?auto_2528881 ?auto_2528884 ) ) ( not ( = ?auto_2528881 ?auto_2528883 ) ) ( not ( = ?auto_2528881 ?auto_2528885 ) ) ( not ( = ?auto_2528881 ?auto_2528886 ) ) ( not ( = ?auto_2528881 ?auto_2528887 ) ) ( not ( = ?auto_2528881 ?auto_2528889 ) ) ( not ( = ?auto_2528882 ?auto_2528884 ) ) ( not ( = ?auto_2528882 ?auto_2528883 ) ) ( not ( = ?auto_2528882 ?auto_2528885 ) ) ( not ( = ?auto_2528882 ?auto_2528886 ) ) ( not ( = ?auto_2528882 ?auto_2528887 ) ) ( not ( = ?auto_2528882 ?auto_2528889 ) ) ( not ( = ?auto_2528884 ?auto_2528883 ) ) ( not ( = ?auto_2528884 ?auto_2528885 ) ) ( not ( = ?auto_2528884 ?auto_2528886 ) ) ( not ( = ?auto_2528884 ?auto_2528887 ) ) ( not ( = ?auto_2528884 ?auto_2528889 ) ) ( not ( = ?auto_2528883 ?auto_2528885 ) ) ( not ( = ?auto_2528883 ?auto_2528886 ) ) ( not ( = ?auto_2528883 ?auto_2528887 ) ) ( not ( = ?auto_2528883 ?auto_2528889 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2528885 ?auto_2528886 ?auto_2528887 )
      ( MAKE-7CRATE-VERIFY ?auto_2528880 ?auto_2528881 ?auto_2528882 ?auto_2528884 ?auto_2528883 ?auto_2528885 ?auto_2528886 ?auto_2528887 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2528958 - SURFACE
      ?auto_2528959 - SURFACE
      ?auto_2528960 - SURFACE
      ?auto_2528962 - SURFACE
      ?auto_2528961 - SURFACE
      ?auto_2528963 - SURFACE
      ?auto_2528964 - SURFACE
      ?auto_2528965 - SURFACE
    )
    :vars
    (
      ?auto_2528967 - HOIST
      ?auto_2528971 - PLACE
      ?auto_2528966 - PLACE
      ?auto_2528968 - HOIST
      ?auto_2528969 - SURFACE
      ?auto_2528970 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2528967 ?auto_2528971 ) ( IS-CRATE ?auto_2528965 ) ( not ( = ?auto_2528964 ?auto_2528965 ) ) ( not ( = ?auto_2528963 ?auto_2528964 ) ) ( not ( = ?auto_2528963 ?auto_2528965 ) ) ( not ( = ?auto_2528966 ?auto_2528971 ) ) ( HOIST-AT ?auto_2528968 ?auto_2528966 ) ( not ( = ?auto_2528967 ?auto_2528968 ) ) ( AVAILABLE ?auto_2528968 ) ( SURFACE-AT ?auto_2528965 ?auto_2528966 ) ( ON ?auto_2528965 ?auto_2528969 ) ( CLEAR ?auto_2528965 ) ( not ( = ?auto_2528964 ?auto_2528969 ) ) ( not ( = ?auto_2528965 ?auto_2528969 ) ) ( not ( = ?auto_2528963 ?auto_2528969 ) ) ( TRUCK-AT ?auto_2528970 ?auto_2528971 ) ( SURFACE-AT ?auto_2528963 ?auto_2528971 ) ( CLEAR ?auto_2528963 ) ( LIFTING ?auto_2528967 ?auto_2528964 ) ( IS-CRATE ?auto_2528964 ) ( ON ?auto_2528959 ?auto_2528958 ) ( ON ?auto_2528960 ?auto_2528959 ) ( ON ?auto_2528962 ?auto_2528960 ) ( ON ?auto_2528961 ?auto_2528962 ) ( ON ?auto_2528963 ?auto_2528961 ) ( not ( = ?auto_2528958 ?auto_2528959 ) ) ( not ( = ?auto_2528958 ?auto_2528960 ) ) ( not ( = ?auto_2528958 ?auto_2528962 ) ) ( not ( = ?auto_2528958 ?auto_2528961 ) ) ( not ( = ?auto_2528958 ?auto_2528963 ) ) ( not ( = ?auto_2528958 ?auto_2528964 ) ) ( not ( = ?auto_2528958 ?auto_2528965 ) ) ( not ( = ?auto_2528958 ?auto_2528969 ) ) ( not ( = ?auto_2528959 ?auto_2528960 ) ) ( not ( = ?auto_2528959 ?auto_2528962 ) ) ( not ( = ?auto_2528959 ?auto_2528961 ) ) ( not ( = ?auto_2528959 ?auto_2528963 ) ) ( not ( = ?auto_2528959 ?auto_2528964 ) ) ( not ( = ?auto_2528959 ?auto_2528965 ) ) ( not ( = ?auto_2528959 ?auto_2528969 ) ) ( not ( = ?auto_2528960 ?auto_2528962 ) ) ( not ( = ?auto_2528960 ?auto_2528961 ) ) ( not ( = ?auto_2528960 ?auto_2528963 ) ) ( not ( = ?auto_2528960 ?auto_2528964 ) ) ( not ( = ?auto_2528960 ?auto_2528965 ) ) ( not ( = ?auto_2528960 ?auto_2528969 ) ) ( not ( = ?auto_2528962 ?auto_2528961 ) ) ( not ( = ?auto_2528962 ?auto_2528963 ) ) ( not ( = ?auto_2528962 ?auto_2528964 ) ) ( not ( = ?auto_2528962 ?auto_2528965 ) ) ( not ( = ?auto_2528962 ?auto_2528969 ) ) ( not ( = ?auto_2528961 ?auto_2528963 ) ) ( not ( = ?auto_2528961 ?auto_2528964 ) ) ( not ( = ?auto_2528961 ?auto_2528965 ) ) ( not ( = ?auto_2528961 ?auto_2528969 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2528963 ?auto_2528964 ?auto_2528965 )
      ( MAKE-7CRATE-VERIFY ?auto_2528958 ?auto_2528959 ?auto_2528960 ?auto_2528962 ?auto_2528961 ?auto_2528963 ?auto_2528964 ?auto_2528965 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2529036 - SURFACE
      ?auto_2529037 - SURFACE
      ?auto_2529038 - SURFACE
      ?auto_2529040 - SURFACE
      ?auto_2529039 - SURFACE
      ?auto_2529041 - SURFACE
      ?auto_2529042 - SURFACE
      ?auto_2529043 - SURFACE
    )
    :vars
    (
      ?auto_2529046 - HOIST
      ?auto_2529044 - PLACE
      ?auto_2529045 - PLACE
      ?auto_2529048 - HOIST
      ?auto_2529047 - SURFACE
      ?auto_2529049 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2529046 ?auto_2529044 ) ( IS-CRATE ?auto_2529043 ) ( not ( = ?auto_2529042 ?auto_2529043 ) ) ( not ( = ?auto_2529041 ?auto_2529042 ) ) ( not ( = ?auto_2529041 ?auto_2529043 ) ) ( not ( = ?auto_2529045 ?auto_2529044 ) ) ( HOIST-AT ?auto_2529048 ?auto_2529045 ) ( not ( = ?auto_2529046 ?auto_2529048 ) ) ( AVAILABLE ?auto_2529048 ) ( SURFACE-AT ?auto_2529043 ?auto_2529045 ) ( ON ?auto_2529043 ?auto_2529047 ) ( CLEAR ?auto_2529043 ) ( not ( = ?auto_2529042 ?auto_2529047 ) ) ( not ( = ?auto_2529043 ?auto_2529047 ) ) ( not ( = ?auto_2529041 ?auto_2529047 ) ) ( TRUCK-AT ?auto_2529049 ?auto_2529044 ) ( SURFACE-AT ?auto_2529041 ?auto_2529044 ) ( CLEAR ?auto_2529041 ) ( IS-CRATE ?auto_2529042 ) ( AVAILABLE ?auto_2529046 ) ( IN ?auto_2529042 ?auto_2529049 ) ( ON ?auto_2529037 ?auto_2529036 ) ( ON ?auto_2529038 ?auto_2529037 ) ( ON ?auto_2529040 ?auto_2529038 ) ( ON ?auto_2529039 ?auto_2529040 ) ( ON ?auto_2529041 ?auto_2529039 ) ( not ( = ?auto_2529036 ?auto_2529037 ) ) ( not ( = ?auto_2529036 ?auto_2529038 ) ) ( not ( = ?auto_2529036 ?auto_2529040 ) ) ( not ( = ?auto_2529036 ?auto_2529039 ) ) ( not ( = ?auto_2529036 ?auto_2529041 ) ) ( not ( = ?auto_2529036 ?auto_2529042 ) ) ( not ( = ?auto_2529036 ?auto_2529043 ) ) ( not ( = ?auto_2529036 ?auto_2529047 ) ) ( not ( = ?auto_2529037 ?auto_2529038 ) ) ( not ( = ?auto_2529037 ?auto_2529040 ) ) ( not ( = ?auto_2529037 ?auto_2529039 ) ) ( not ( = ?auto_2529037 ?auto_2529041 ) ) ( not ( = ?auto_2529037 ?auto_2529042 ) ) ( not ( = ?auto_2529037 ?auto_2529043 ) ) ( not ( = ?auto_2529037 ?auto_2529047 ) ) ( not ( = ?auto_2529038 ?auto_2529040 ) ) ( not ( = ?auto_2529038 ?auto_2529039 ) ) ( not ( = ?auto_2529038 ?auto_2529041 ) ) ( not ( = ?auto_2529038 ?auto_2529042 ) ) ( not ( = ?auto_2529038 ?auto_2529043 ) ) ( not ( = ?auto_2529038 ?auto_2529047 ) ) ( not ( = ?auto_2529040 ?auto_2529039 ) ) ( not ( = ?auto_2529040 ?auto_2529041 ) ) ( not ( = ?auto_2529040 ?auto_2529042 ) ) ( not ( = ?auto_2529040 ?auto_2529043 ) ) ( not ( = ?auto_2529040 ?auto_2529047 ) ) ( not ( = ?auto_2529039 ?auto_2529041 ) ) ( not ( = ?auto_2529039 ?auto_2529042 ) ) ( not ( = ?auto_2529039 ?auto_2529043 ) ) ( not ( = ?auto_2529039 ?auto_2529047 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2529041 ?auto_2529042 ?auto_2529043 )
      ( MAKE-7CRATE-VERIFY ?auto_2529036 ?auto_2529037 ?auto_2529038 ?auto_2529040 ?auto_2529039 ?auto_2529041 ?auto_2529042 ?auto_2529043 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2531955 - SURFACE
      ?auto_2531956 - SURFACE
      ?auto_2531957 - SURFACE
      ?auto_2531959 - SURFACE
      ?auto_2531958 - SURFACE
      ?auto_2531960 - SURFACE
      ?auto_2531961 - SURFACE
      ?auto_2531962 - SURFACE
      ?auto_2531963 - SURFACE
    )
    :vars
    (
      ?auto_2531965 - HOIST
      ?auto_2531964 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2531965 ?auto_2531964 ) ( SURFACE-AT ?auto_2531962 ?auto_2531964 ) ( CLEAR ?auto_2531962 ) ( LIFTING ?auto_2531965 ?auto_2531963 ) ( IS-CRATE ?auto_2531963 ) ( not ( = ?auto_2531962 ?auto_2531963 ) ) ( ON ?auto_2531956 ?auto_2531955 ) ( ON ?auto_2531957 ?auto_2531956 ) ( ON ?auto_2531959 ?auto_2531957 ) ( ON ?auto_2531958 ?auto_2531959 ) ( ON ?auto_2531960 ?auto_2531958 ) ( ON ?auto_2531961 ?auto_2531960 ) ( ON ?auto_2531962 ?auto_2531961 ) ( not ( = ?auto_2531955 ?auto_2531956 ) ) ( not ( = ?auto_2531955 ?auto_2531957 ) ) ( not ( = ?auto_2531955 ?auto_2531959 ) ) ( not ( = ?auto_2531955 ?auto_2531958 ) ) ( not ( = ?auto_2531955 ?auto_2531960 ) ) ( not ( = ?auto_2531955 ?auto_2531961 ) ) ( not ( = ?auto_2531955 ?auto_2531962 ) ) ( not ( = ?auto_2531955 ?auto_2531963 ) ) ( not ( = ?auto_2531956 ?auto_2531957 ) ) ( not ( = ?auto_2531956 ?auto_2531959 ) ) ( not ( = ?auto_2531956 ?auto_2531958 ) ) ( not ( = ?auto_2531956 ?auto_2531960 ) ) ( not ( = ?auto_2531956 ?auto_2531961 ) ) ( not ( = ?auto_2531956 ?auto_2531962 ) ) ( not ( = ?auto_2531956 ?auto_2531963 ) ) ( not ( = ?auto_2531957 ?auto_2531959 ) ) ( not ( = ?auto_2531957 ?auto_2531958 ) ) ( not ( = ?auto_2531957 ?auto_2531960 ) ) ( not ( = ?auto_2531957 ?auto_2531961 ) ) ( not ( = ?auto_2531957 ?auto_2531962 ) ) ( not ( = ?auto_2531957 ?auto_2531963 ) ) ( not ( = ?auto_2531959 ?auto_2531958 ) ) ( not ( = ?auto_2531959 ?auto_2531960 ) ) ( not ( = ?auto_2531959 ?auto_2531961 ) ) ( not ( = ?auto_2531959 ?auto_2531962 ) ) ( not ( = ?auto_2531959 ?auto_2531963 ) ) ( not ( = ?auto_2531958 ?auto_2531960 ) ) ( not ( = ?auto_2531958 ?auto_2531961 ) ) ( not ( = ?auto_2531958 ?auto_2531962 ) ) ( not ( = ?auto_2531958 ?auto_2531963 ) ) ( not ( = ?auto_2531960 ?auto_2531961 ) ) ( not ( = ?auto_2531960 ?auto_2531962 ) ) ( not ( = ?auto_2531960 ?auto_2531963 ) ) ( not ( = ?auto_2531961 ?auto_2531962 ) ) ( not ( = ?auto_2531961 ?auto_2531963 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2531962 ?auto_2531963 )
      ( MAKE-8CRATE-VERIFY ?auto_2531955 ?auto_2531956 ?auto_2531957 ?auto_2531959 ?auto_2531958 ?auto_2531960 ?auto_2531961 ?auto_2531962 ?auto_2531963 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2532022 - SURFACE
      ?auto_2532023 - SURFACE
      ?auto_2532024 - SURFACE
      ?auto_2532026 - SURFACE
      ?auto_2532025 - SURFACE
      ?auto_2532027 - SURFACE
      ?auto_2532028 - SURFACE
      ?auto_2532029 - SURFACE
      ?auto_2532030 - SURFACE
    )
    :vars
    (
      ?auto_2532033 - HOIST
      ?auto_2532032 - PLACE
      ?auto_2532031 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2532033 ?auto_2532032 ) ( SURFACE-AT ?auto_2532029 ?auto_2532032 ) ( CLEAR ?auto_2532029 ) ( IS-CRATE ?auto_2532030 ) ( not ( = ?auto_2532029 ?auto_2532030 ) ) ( TRUCK-AT ?auto_2532031 ?auto_2532032 ) ( AVAILABLE ?auto_2532033 ) ( IN ?auto_2532030 ?auto_2532031 ) ( ON ?auto_2532029 ?auto_2532028 ) ( not ( = ?auto_2532028 ?auto_2532029 ) ) ( not ( = ?auto_2532028 ?auto_2532030 ) ) ( ON ?auto_2532023 ?auto_2532022 ) ( ON ?auto_2532024 ?auto_2532023 ) ( ON ?auto_2532026 ?auto_2532024 ) ( ON ?auto_2532025 ?auto_2532026 ) ( ON ?auto_2532027 ?auto_2532025 ) ( ON ?auto_2532028 ?auto_2532027 ) ( not ( = ?auto_2532022 ?auto_2532023 ) ) ( not ( = ?auto_2532022 ?auto_2532024 ) ) ( not ( = ?auto_2532022 ?auto_2532026 ) ) ( not ( = ?auto_2532022 ?auto_2532025 ) ) ( not ( = ?auto_2532022 ?auto_2532027 ) ) ( not ( = ?auto_2532022 ?auto_2532028 ) ) ( not ( = ?auto_2532022 ?auto_2532029 ) ) ( not ( = ?auto_2532022 ?auto_2532030 ) ) ( not ( = ?auto_2532023 ?auto_2532024 ) ) ( not ( = ?auto_2532023 ?auto_2532026 ) ) ( not ( = ?auto_2532023 ?auto_2532025 ) ) ( not ( = ?auto_2532023 ?auto_2532027 ) ) ( not ( = ?auto_2532023 ?auto_2532028 ) ) ( not ( = ?auto_2532023 ?auto_2532029 ) ) ( not ( = ?auto_2532023 ?auto_2532030 ) ) ( not ( = ?auto_2532024 ?auto_2532026 ) ) ( not ( = ?auto_2532024 ?auto_2532025 ) ) ( not ( = ?auto_2532024 ?auto_2532027 ) ) ( not ( = ?auto_2532024 ?auto_2532028 ) ) ( not ( = ?auto_2532024 ?auto_2532029 ) ) ( not ( = ?auto_2532024 ?auto_2532030 ) ) ( not ( = ?auto_2532026 ?auto_2532025 ) ) ( not ( = ?auto_2532026 ?auto_2532027 ) ) ( not ( = ?auto_2532026 ?auto_2532028 ) ) ( not ( = ?auto_2532026 ?auto_2532029 ) ) ( not ( = ?auto_2532026 ?auto_2532030 ) ) ( not ( = ?auto_2532025 ?auto_2532027 ) ) ( not ( = ?auto_2532025 ?auto_2532028 ) ) ( not ( = ?auto_2532025 ?auto_2532029 ) ) ( not ( = ?auto_2532025 ?auto_2532030 ) ) ( not ( = ?auto_2532027 ?auto_2532028 ) ) ( not ( = ?auto_2532027 ?auto_2532029 ) ) ( not ( = ?auto_2532027 ?auto_2532030 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2532028 ?auto_2532029 ?auto_2532030 )
      ( MAKE-8CRATE-VERIFY ?auto_2532022 ?auto_2532023 ?auto_2532024 ?auto_2532026 ?auto_2532025 ?auto_2532027 ?auto_2532028 ?auto_2532029 ?auto_2532030 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2532098 - SURFACE
      ?auto_2532099 - SURFACE
      ?auto_2532100 - SURFACE
      ?auto_2532102 - SURFACE
      ?auto_2532101 - SURFACE
      ?auto_2532103 - SURFACE
      ?auto_2532104 - SURFACE
      ?auto_2532105 - SURFACE
      ?auto_2532106 - SURFACE
    )
    :vars
    (
      ?auto_2532110 - HOIST
      ?auto_2532109 - PLACE
      ?auto_2532107 - TRUCK
      ?auto_2532108 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2532110 ?auto_2532109 ) ( SURFACE-AT ?auto_2532105 ?auto_2532109 ) ( CLEAR ?auto_2532105 ) ( IS-CRATE ?auto_2532106 ) ( not ( = ?auto_2532105 ?auto_2532106 ) ) ( AVAILABLE ?auto_2532110 ) ( IN ?auto_2532106 ?auto_2532107 ) ( ON ?auto_2532105 ?auto_2532104 ) ( not ( = ?auto_2532104 ?auto_2532105 ) ) ( not ( = ?auto_2532104 ?auto_2532106 ) ) ( TRUCK-AT ?auto_2532107 ?auto_2532108 ) ( not ( = ?auto_2532108 ?auto_2532109 ) ) ( ON ?auto_2532099 ?auto_2532098 ) ( ON ?auto_2532100 ?auto_2532099 ) ( ON ?auto_2532102 ?auto_2532100 ) ( ON ?auto_2532101 ?auto_2532102 ) ( ON ?auto_2532103 ?auto_2532101 ) ( ON ?auto_2532104 ?auto_2532103 ) ( not ( = ?auto_2532098 ?auto_2532099 ) ) ( not ( = ?auto_2532098 ?auto_2532100 ) ) ( not ( = ?auto_2532098 ?auto_2532102 ) ) ( not ( = ?auto_2532098 ?auto_2532101 ) ) ( not ( = ?auto_2532098 ?auto_2532103 ) ) ( not ( = ?auto_2532098 ?auto_2532104 ) ) ( not ( = ?auto_2532098 ?auto_2532105 ) ) ( not ( = ?auto_2532098 ?auto_2532106 ) ) ( not ( = ?auto_2532099 ?auto_2532100 ) ) ( not ( = ?auto_2532099 ?auto_2532102 ) ) ( not ( = ?auto_2532099 ?auto_2532101 ) ) ( not ( = ?auto_2532099 ?auto_2532103 ) ) ( not ( = ?auto_2532099 ?auto_2532104 ) ) ( not ( = ?auto_2532099 ?auto_2532105 ) ) ( not ( = ?auto_2532099 ?auto_2532106 ) ) ( not ( = ?auto_2532100 ?auto_2532102 ) ) ( not ( = ?auto_2532100 ?auto_2532101 ) ) ( not ( = ?auto_2532100 ?auto_2532103 ) ) ( not ( = ?auto_2532100 ?auto_2532104 ) ) ( not ( = ?auto_2532100 ?auto_2532105 ) ) ( not ( = ?auto_2532100 ?auto_2532106 ) ) ( not ( = ?auto_2532102 ?auto_2532101 ) ) ( not ( = ?auto_2532102 ?auto_2532103 ) ) ( not ( = ?auto_2532102 ?auto_2532104 ) ) ( not ( = ?auto_2532102 ?auto_2532105 ) ) ( not ( = ?auto_2532102 ?auto_2532106 ) ) ( not ( = ?auto_2532101 ?auto_2532103 ) ) ( not ( = ?auto_2532101 ?auto_2532104 ) ) ( not ( = ?auto_2532101 ?auto_2532105 ) ) ( not ( = ?auto_2532101 ?auto_2532106 ) ) ( not ( = ?auto_2532103 ?auto_2532104 ) ) ( not ( = ?auto_2532103 ?auto_2532105 ) ) ( not ( = ?auto_2532103 ?auto_2532106 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2532104 ?auto_2532105 ?auto_2532106 )
      ( MAKE-8CRATE-VERIFY ?auto_2532098 ?auto_2532099 ?auto_2532100 ?auto_2532102 ?auto_2532101 ?auto_2532103 ?auto_2532104 ?auto_2532105 ?auto_2532106 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2532182 - SURFACE
      ?auto_2532183 - SURFACE
      ?auto_2532184 - SURFACE
      ?auto_2532186 - SURFACE
      ?auto_2532185 - SURFACE
      ?auto_2532187 - SURFACE
      ?auto_2532188 - SURFACE
      ?auto_2532189 - SURFACE
      ?auto_2532190 - SURFACE
    )
    :vars
    (
      ?auto_2532191 - HOIST
      ?auto_2532194 - PLACE
      ?auto_2532193 - TRUCK
      ?auto_2532192 - PLACE
      ?auto_2532195 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2532191 ?auto_2532194 ) ( SURFACE-AT ?auto_2532189 ?auto_2532194 ) ( CLEAR ?auto_2532189 ) ( IS-CRATE ?auto_2532190 ) ( not ( = ?auto_2532189 ?auto_2532190 ) ) ( AVAILABLE ?auto_2532191 ) ( ON ?auto_2532189 ?auto_2532188 ) ( not ( = ?auto_2532188 ?auto_2532189 ) ) ( not ( = ?auto_2532188 ?auto_2532190 ) ) ( TRUCK-AT ?auto_2532193 ?auto_2532192 ) ( not ( = ?auto_2532192 ?auto_2532194 ) ) ( HOIST-AT ?auto_2532195 ?auto_2532192 ) ( LIFTING ?auto_2532195 ?auto_2532190 ) ( not ( = ?auto_2532191 ?auto_2532195 ) ) ( ON ?auto_2532183 ?auto_2532182 ) ( ON ?auto_2532184 ?auto_2532183 ) ( ON ?auto_2532186 ?auto_2532184 ) ( ON ?auto_2532185 ?auto_2532186 ) ( ON ?auto_2532187 ?auto_2532185 ) ( ON ?auto_2532188 ?auto_2532187 ) ( not ( = ?auto_2532182 ?auto_2532183 ) ) ( not ( = ?auto_2532182 ?auto_2532184 ) ) ( not ( = ?auto_2532182 ?auto_2532186 ) ) ( not ( = ?auto_2532182 ?auto_2532185 ) ) ( not ( = ?auto_2532182 ?auto_2532187 ) ) ( not ( = ?auto_2532182 ?auto_2532188 ) ) ( not ( = ?auto_2532182 ?auto_2532189 ) ) ( not ( = ?auto_2532182 ?auto_2532190 ) ) ( not ( = ?auto_2532183 ?auto_2532184 ) ) ( not ( = ?auto_2532183 ?auto_2532186 ) ) ( not ( = ?auto_2532183 ?auto_2532185 ) ) ( not ( = ?auto_2532183 ?auto_2532187 ) ) ( not ( = ?auto_2532183 ?auto_2532188 ) ) ( not ( = ?auto_2532183 ?auto_2532189 ) ) ( not ( = ?auto_2532183 ?auto_2532190 ) ) ( not ( = ?auto_2532184 ?auto_2532186 ) ) ( not ( = ?auto_2532184 ?auto_2532185 ) ) ( not ( = ?auto_2532184 ?auto_2532187 ) ) ( not ( = ?auto_2532184 ?auto_2532188 ) ) ( not ( = ?auto_2532184 ?auto_2532189 ) ) ( not ( = ?auto_2532184 ?auto_2532190 ) ) ( not ( = ?auto_2532186 ?auto_2532185 ) ) ( not ( = ?auto_2532186 ?auto_2532187 ) ) ( not ( = ?auto_2532186 ?auto_2532188 ) ) ( not ( = ?auto_2532186 ?auto_2532189 ) ) ( not ( = ?auto_2532186 ?auto_2532190 ) ) ( not ( = ?auto_2532185 ?auto_2532187 ) ) ( not ( = ?auto_2532185 ?auto_2532188 ) ) ( not ( = ?auto_2532185 ?auto_2532189 ) ) ( not ( = ?auto_2532185 ?auto_2532190 ) ) ( not ( = ?auto_2532187 ?auto_2532188 ) ) ( not ( = ?auto_2532187 ?auto_2532189 ) ) ( not ( = ?auto_2532187 ?auto_2532190 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2532188 ?auto_2532189 ?auto_2532190 )
      ( MAKE-8CRATE-VERIFY ?auto_2532182 ?auto_2532183 ?auto_2532184 ?auto_2532186 ?auto_2532185 ?auto_2532187 ?auto_2532188 ?auto_2532189 ?auto_2532190 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2532274 - SURFACE
      ?auto_2532275 - SURFACE
      ?auto_2532276 - SURFACE
      ?auto_2532278 - SURFACE
      ?auto_2532277 - SURFACE
      ?auto_2532279 - SURFACE
      ?auto_2532280 - SURFACE
      ?auto_2532281 - SURFACE
      ?auto_2532282 - SURFACE
    )
    :vars
    (
      ?auto_2532285 - HOIST
      ?auto_2532287 - PLACE
      ?auto_2532284 - TRUCK
      ?auto_2532283 - PLACE
      ?auto_2532288 - HOIST
      ?auto_2532286 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2532285 ?auto_2532287 ) ( SURFACE-AT ?auto_2532281 ?auto_2532287 ) ( CLEAR ?auto_2532281 ) ( IS-CRATE ?auto_2532282 ) ( not ( = ?auto_2532281 ?auto_2532282 ) ) ( AVAILABLE ?auto_2532285 ) ( ON ?auto_2532281 ?auto_2532280 ) ( not ( = ?auto_2532280 ?auto_2532281 ) ) ( not ( = ?auto_2532280 ?auto_2532282 ) ) ( TRUCK-AT ?auto_2532284 ?auto_2532283 ) ( not ( = ?auto_2532283 ?auto_2532287 ) ) ( HOIST-AT ?auto_2532288 ?auto_2532283 ) ( not ( = ?auto_2532285 ?auto_2532288 ) ) ( AVAILABLE ?auto_2532288 ) ( SURFACE-AT ?auto_2532282 ?auto_2532283 ) ( ON ?auto_2532282 ?auto_2532286 ) ( CLEAR ?auto_2532282 ) ( not ( = ?auto_2532281 ?auto_2532286 ) ) ( not ( = ?auto_2532282 ?auto_2532286 ) ) ( not ( = ?auto_2532280 ?auto_2532286 ) ) ( ON ?auto_2532275 ?auto_2532274 ) ( ON ?auto_2532276 ?auto_2532275 ) ( ON ?auto_2532278 ?auto_2532276 ) ( ON ?auto_2532277 ?auto_2532278 ) ( ON ?auto_2532279 ?auto_2532277 ) ( ON ?auto_2532280 ?auto_2532279 ) ( not ( = ?auto_2532274 ?auto_2532275 ) ) ( not ( = ?auto_2532274 ?auto_2532276 ) ) ( not ( = ?auto_2532274 ?auto_2532278 ) ) ( not ( = ?auto_2532274 ?auto_2532277 ) ) ( not ( = ?auto_2532274 ?auto_2532279 ) ) ( not ( = ?auto_2532274 ?auto_2532280 ) ) ( not ( = ?auto_2532274 ?auto_2532281 ) ) ( not ( = ?auto_2532274 ?auto_2532282 ) ) ( not ( = ?auto_2532274 ?auto_2532286 ) ) ( not ( = ?auto_2532275 ?auto_2532276 ) ) ( not ( = ?auto_2532275 ?auto_2532278 ) ) ( not ( = ?auto_2532275 ?auto_2532277 ) ) ( not ( = ?auto_2532275 ?auto_2532279 ) ) ( not ( = ?auto_2532275 ?auto_2532280 ) ) ( not ( = ?auto_2532275 ?auto_2532281 ) ) ( not ( = ?auto_2532275 ?auto_2532282 ) ) ( not ( = ?auto_2532275 ?auto_2532286 ) ) ( not ( = ?auto_2532276 ?auto_2532278 ) ) ( not ( = ?auto_2532276 ?auto_2532277 ) ) ( not ( = ?auto_2532276 ?auto_2532279 ) ) ( not ( = ?auto_2532276 ?auto_2532280 ) ) ( not ( = ?auto_2532276 ?auto_2532281 ) ) ( not ( = ?auto_2532276 ?auto_2532282 ) ) ( not ( = ?auto_2532276 ?auto_2532286 ) ) ( not ( = ?auto_2532278 ?auto_2532277 ) ) ( not ( = ?auto_2532278 ?auto_2532279 ) ) ( not ( = ?auto_2532278 ?auto_2532280 ) ) ( not ( = ?auto_2532278 ?auto_2532281 ) ) ( not ( = ?auto_2532278 ?auto_2532282 ) ) ( not ( = ?auto_2532278 ?auto_2532286 ) ) ( not ( = ?auto_2532277 ?auto_2532279 ) ) ( not ( = ?auto_2532277 ?auto_2532280 ) ) ( not ( = ?auto_2532277 ?auto_2532281 ) ) ( not ( = ?auto_2532277 ?auto_2532282 ) ) ( not ( = ?auto_2532277 ?auto_2532286 ) ) ( not ( = ?auto_2532279 ?auto_2532280 ) ) ( not ( = ?auto_2532279 ?auto_2532281 ) ) ( not ( = ?auto_2532279 ?auto_2532282 ) ) ( not ( = ?auto_2532279 ?auto_2532286 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2532280 ?auto_2532281 ?auto_2532282 )
      ( MAKE-8CRATE-VERIFY ?auto_2532274 ?auto_2532275 ?auto_2532276 ?auto_2532278 ?auto_2532277 ?auto_2532279 ?auto_2532280 ?auto_2532281 ?auto_2532282 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2532367 - SURFACE
      ?auto_2532368 - SURFACE
      ?auto_2532369 - SURFACE
      ?auto_2532371 - SURFACE
      ?auto_2532370 - SURFACE
      ?auto_2532372 - SURFACE
      ?auto_2532373 - SURFACE
      ?auto_2532374 - SURFACE
      ?auto_2532375 - SURFACE
    )
    :vars
    (
      ?auto_2532380 - HOIST
      ?auto_2532377 - PLACE
      ?auto_2532376 - PLACE
      ?auto_2532378 - HOIST
      ?auto_2532379 - SURFACE
      ?auto_2532381 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2532380 ?auto_2532377 ) ( SURFACE-AT ?auto_2532374 ?auto_2532377 ) ( CLEAR ?auto_2532374 ) ( IS-CRATE ?auto_2532375 ) ( not ( = ?auto_2532374 ?auto_2532375 ) ) ( AVAILABLE ?auto_2532380 ) ( ON ?auto_2532374 ?auto_2532373 ) ( not ( = ?auto_2532373 ?auto_2532374 ) ) ( not ( = ?auto_2532373 ?auto_2532375 ) ) ( not ( = ?auto_2532376 ?auto_2532377 ) ) ( HOIST-AT ?auto_2532378 ?auto_2532376 ) ( not ( = ?auto_2532380 ?auto_2532378 ) ) ( AVAILABLE ?auto_2532378 ) ( SURFACE-AT ?auto_2532375 ?auto_2532376 ) ( ON ?auto_2532375 ?auto_2532379 ) ( CLEAR ?auto_2532375 ) ( not ( = ?auto_2532374 ?auto_2532379 ) ) ( not ( = ?auto_2532375 ?auto_2532379 ) ) ( not ( = ?auto_2532373 ?auto_2532379 ) ) ( TRUCK-AT ?auto_2532381 ?auto_2532377 ) ( ON ?auto_2532368 ?auto_2532367 ) ( ON ?auto_2532369 ?auto_2532368 ) ( ON ?auto_2532371 ?auto_2532369 ) ( ON ?auto_2532370 ?auto_2532371 ) ( ON ?auto_2532372 ?auto_2532370 ) ( ON ?auto_2532373 ?auto_2532372 ) ( not ( = ?auto_2532367 ?auto_2532368 ) ) ( not ( = ?auto_2532367 ?auto_2532369 ) ) ( not ( = ?auto_2532367 ?auto_2532371 ) ) ( not ( = ?auto_2532367 ?auto_2532370 ) ) ( not ( = ?auto_2532367 ?auto_2532372 ) ) ( not ( = ?auto_2532367 ?auto_2532373 ) ) ( not ( = ?auto_2532367 ?auto_2532374 ) ) ( not ( = ?auto_2532367 ?auto_2532375 ) ) ( not ( = ?auto_2532367 ?auto_2532379 ) ) ( not ( = ?auto_2532368 ?auto_2532369 ) ) ( not ( = ?auto_2532368 ?auto_2532371 ) ) ( not ( = ?auto_2532368 ?auto_2532370 ) ) ( not ( = ?auto_2532368 ?auto_2532372 ) ) ( not ( = ?auto_2532368 ?auto_2532373 ) ) ( not ( = ?auto_2532368 ?auto_2532374 ) ) ( not ( = ?auto_2532368 ?auto_2532375 ) ) ( not ( = ?auto_2532368 ?auto_2532379 ) ) ( not ( = ?auto_2532369 ?auto_2532371 ) ) ( not ( = ?auto_2532369 ?auto_2532370 ) ) ( not ( = ?auto_2532369 ?auto_2532372 ) ) ( not ( = ?auto_2532369 ?auto_2532373 ) ) ( not ( = ?auto_2532369 ?auto_2532374 ) ) ( not ( = ?auto_2532369 ?auto_2532375 ) ) ( not ( = ?auto_2532369 ?auto_2532379 ) ) ( not ( = ?auto_2532371 ?auto_2532370 ) ) ( not ( = ?auto_2532371 ?auto_2532372 ) ) ( not ( = ?auto_2532371 ?auto_2532373 ) ) ( not ( = ?auto_2532371 ?auto_2532374 ) ) ( not ( = ?auto_2532371 ?auto_2532375 ) ) ( not ( = ?auto_2532371 ?auto_2532379 ) ) ( not ( = ?auto_2532370 ?auto_2532372 ) ) ( not ( = ?auto_2532370 ?auto_2532373 ) ) ( not ( = ?auto_2532370 ?auto_2532374 ) ) ( not ( = ?auto_2532370 ?auto_2532375 ) ) ( not ( = ?auto_2532370 ?auto_2532379 ) ) ( not ( = ?auto_2532372 ?auto_2532373 ) ) ( not ( = ?auto_2532372 ?auto_2532374 ) ) ( not ( = ?auto_2532372 ?auto_2532375 ) ) ( not ( = ?auto_2532372 ?auto_2532379 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2532373 ?auto_2532374 ?auto_2532375 )
      ( MAKE-8CRATE-VERIFY ?auto_2532367 ?auto_2532368 ?auto_2532369 ?auto_2532371 ?auto_2532370 ?auto_2532372 ?auto_2532373 ?auto_2532374 ?auto_2532375 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2532460 - SURFACE
      ?auto_2532461 - SURFACE
      ?auto_2532462 - SURFACE
      ?auto_2532464 - SURFACE
      ?auto_2532463 - SURFACE
      ?auto_2532465 - SURFACE
      ?auto_2532466 - SURFACE
      ?auto_2532467 - SURFACE
      ?auto_2532468 - SURFACE
    )
    :vars
    (
      ?auto_2532472 - HOIST
      ?auto_2532470 - PLACE
      ?auto_2532471 - PLACE
      ?auto_2532473 - HOIST
      ?auto_2532469 - SURFACE
      ?auto_2532474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2532472 ?auto_2532470 ) ( IS-CRATE ?auto_2532468 ) ( not ( = ?auto_2532467 ?auto_2532468 ) ) ( not ( = ?auto_2532466 ?auto_2532467 ) ) ( not ( = ?auto_2532466 ?auto_2532468 ) ) ( not ( = ?auto_2532471 ?auto_2532470 ) ) ( HOIST-AT ?auto_2532473 ?auto_2532471 ) ( not ( = ?auto_2532472 ?auto_2532473 ) ) ( AVAILABLE ?auto_2532473 ) ( SURFACE-AT ?auto_2532468 ?auto_2532471 ) ( ON ?auto_2532468 ?auto_2532469 ) ( CLEAR ?auto_2532468 ) ( not ( = ?auto_2532467 ?auto_2532469 ) ) ( not ( = ?auto_2532468 ?auto_2532469 ) ) ( not ( = ?auto_2532466 ?auto_2532469 ) ) ( TRUCK-AT ?auto_2532474 ?auto_2532470 ) ( SURFACE-AT ?auto_2532466 ?auto_2532470 ) ( CLEAR ?auto_2532466 ) ( LIFTING ?auto_2532472 ?auto_2532467 ) ( IS-CRATE ?auto_2532467 ) ( ON ?auto_2532461 ?auto_2532460 ) ( ON ?auto_2532462 ?auto_2532461 ) ( ON ?auto_2532464 ?auto_2532462 ) ( ON ?auto_2532463 ?auto_2532464 ) ( ON ?auto_2532465 ?auto_2532463 ) ( ON ?auto_2532466 ?auto_2532465 ) ( not ( = ?auto_2532460 ?auto_2532461 ) ) ( not ( = ?auto_2532460 ?auto_2532462 ) ) ( not ( = ?auto_2532460 ?auto_2532464 ) ) ( not ( = ?auto_2532460 ?auto_2532463 ) ) ( not ( = ?auto_2532460 ?auto_2532465 ) ) ( not ( = ?auto_2532460 ?auto_2532466 ) ) ( not ( = ?auto_2532460 ?auto_2532467 ) ) ( not ( = ?auto_2532460 ?auto_2532468 ) ) ( not ( = ?auto_2532460 ?auto_2532469 ) ) ( not ( = ?auto_2532461 ?auto_2532462 ) ) ( not ( = ?auto_2532461 ?auto_2532464 ) ) ( not ( = ?auto_2532461 ?auto_2532463 ) ) ( not ( = ?auto_2532461 ?auto_2532465 ) ) ( not ( = ?auto_2532461 ?auto_2532466 ) ) ( not ( = ?auto_2532461 ?auto_2532467 ) ) ( not ( = ?auto_2532461 ?auto_2532468 ) ) ( not ( = ?auto_2532461 ?auto_2532469 ) ) ( not ( = ?auto_2532462 ?auto_2532464 ) ) ( not ( = ?auto_2532462 ?auto_2532463 ) ) ( not ( = ?auto_2532462 ?auto_2532465 ) ) ( not ( = ?auto_2532462 ?auto_2532466 ) ) ( not ( = ?auto_2532462 ?auto_2532467 ) ) ( not ( = ?auto_2532462 ?auto_2532468 ) ) ( not ( = ?auto_2532462 ?auto_2532469 ) ) ( not ( = ?auto_2532464 ?auto_2532463 ) ) ( not ( = ?auto_2532464 ?auto_2532465 ) ) ( not ( = ?auto_2532464 ?auto_2532466 ) ) ( not ( = ?auto_2532464 ?auto_2532467 ) ) ( not ( = ?auto_2532464 ?auto_2532468 ) ) ( not ( = ?auto_2532464 ?auto_2532469 ) ) ( not ( = ?auto_2532463 ?auto_2532465 ) ) ( not ( = ?auto_2532463 ?auto_2532466 ) ) ( not ( = ?auto_2532463 ?auto_2532467 ) ) ( not ( = ?auto_2532463 ?auto_2532468 ) ) ( not ( = ?auto_2532463 ?auto_2532469 ) ) ( not ( = ?auto_2532465 ?auto_2532466 ) ) ( not ( = ?auto_2532465 ?auto_2532467 ) ) ( not ( = ?auto_2532465 ?auto_2532468 ) ) ( not ( = ?auto_2532465 ?auto_2532469 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2532466 ?auto_2532467 ?auto_2532468 )
      ( MAKE-8CRATE-VERIFY ?auto_2532460 ?auto_2532461 ?auto_2532462 ?auto_2532464 ?auto_2532463 ?auto_2532465 ?auto_2532466 ?auto_2532467 ?auto_2532468 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2532553 - SURFACE
      ?auto_2532554 - SURFACE
      ?auto_2532555 - SURFACE
      ?auto_2532557 - SURFACE
      ?auto_2532556 - SURFACE
      ?auto_2532558 - SURFACE
      ?auto_2532559 - SURFACE
      ?auto_2532560 - SURFACE
      ?auto_2532561 - SURFACE
    )
    :vars
    (
      ?auto_2532567 - HOIST
      ?auto_2532562 - PLACE
      ?auto_2532565 - PLACE
      ?auto_2532563 - HOIST
      ?auto_2532566 - SURFACE
      ?auto_2532564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2532567 ?auto_2532562 ) ( IS-CRATE ?auto_2532561 ) ( not ( = ?auto_2532560 ?auto_2532561 ) ) ( not ( = ?auto_2532559 ?auto_2532560 ) ) ( not ( = ?auto_2532559 ?auto_2532561 ) ) ( not ( = ?auto_2532565 ?auto_2532562 ) ) ( HOIST-AT ?auto_2532563 ?auto_2532565 ) ( not ( = ?auto_2532567 ?auto_2532563 ) ) ( AVAILABLE ?auto_2532563 ) ( SURFACE-AT ?auto_2532561 ?auto_2532565 ) ( ON ?auto_2532561 ?auto_2532566 ) ( CLEAR ?auto_2532561 ) ( not ( = ?auto_2532560 ?auto_2532566 ) ) ( not ( = ?auto_2532561 ?auto_2532566 ) ) ( not ( = ?auto_2532559 ?auto_2532566 ) ) ( TRUCK-AT ?auto_2532564 ?auto_2532562 ) ( SURFACE-AT ?auto_2532559 ?auto_2532562 ) ( CLEAR ?auto_2532559 ) ( IS-CRATE ?auto_2532560 ) ( AVAILABLE ?auto_2532567 ) ( IN ?auto_2532560 ?auto_2532564 ) ( ON ?auto_2532554 ?auto_2532553 ) ( ON ?auto_2532555 ?auto_2532554 ) ( ON ?auto_2532557 ?auto_2532555 ) ( ON ?auto_2532556 ?auto_2532557 ) ( ON ?auto_2532558 ?auto_2532556 ) ( ON ?auto_2532559 ?auto_2532558 ) ( not ( = ?auto_2532553 ?auto_2532554 ) ) ( not ( = ?auto_2532553 ?auto_2532555 ) ) ( not ( = ?auto_2532553 ?auto_2532557 ) ) ( not ( = ?auto_2532553 ?auto_2532556 ) ) ( not ( = ?auto_2532553 ?auto_2532558 ) ) ( not ( = ?auto_2532553 ?auto_2532559 ) ) ( not ( = ?auto_2532553 ?auto_2532560 ) ) ( not ( = ?auto_2532553 ?auto_2532561 ) ) ( not ( = ?auto_2532553 ?auto_2532566 ) ) ( not ( = ?auto_2532554 ?auto_2532555 ) ) ( not ( = ?auto_2532554 ?auto_2532557 ) ) ( not ( = ?auto_2532554 ?auto_2532556 ) ) ( not ( = ?auto_2532554 ?auto_2532558 ) ) ( not ( = ?auto_2532554 ?auto_2532559 ) ) ( not ( = ?auto_2532554 ?auto_2532560 ) ) ( not ( = ?auto_2532554 ?auto_2532561 ) ) ( not ( = ?auto_2532554 ?auto_2532566 ) ) ( not ( = ?auto_2532555 ?auto_2532557 ) ) ( not ( = ?auto_2532555 ?auto_2532556 ) ) ( not ( = ?auto_2532555 ?auto_2532558 ) ) ( not ( = ?auto_2532555 ?auto_2532559 ) ) ( not ( = ?auto_2532555 ?auto_2532560 ) ) ( not ( = ?auto_2532555 ?auto_2532561 ) ) ( not ( = ?auto_2532555 ?auto_2532566 ) ) ( not ( = ?auto_2532557 ?auto_2532556 ) ) ( not ( = ?auto_2532557 ?auto_2532558 ) ) ( not ( = ?auto_2532557 ?auto_2532559 ) ) ( not ( = ?auto_2532557 ?auto_2532560 ) ) ( not ( = ?auto_2532557 ?auto_2532561 ) ) ( not ( = ?auto_2532557 ?auto_2532566 ) ) ( not ( = ?auto_2532556 ?auto_2532558 ) ) ( not ( = ?auto_2532556 ?auto_2532559 ) ) ( not ( = ?auto_2532556 ?auto_2532560 ) ) ( not ( = ?auto_2532556 ?auto_2532561 ) ) ( not ( = ?auto_2532556 ?auto_2532566 ) ) ( not ( = ?auto_2532558 ?auto_2532559 ) ) ( not ( = ?auto_2532558 ?auto_2532560 ) ) ( not ( = ?auto_2532558 ?auto_2532561 ) ) ( not ( = ?auto_2532558 ?auto_2532566 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2532559 ?auto_2532560 ?auto_2532561 )
      ( MAKE-8CRATE-VERIFY ?auto_2532553 ?auto_2532554 ?auto_2532555 ?auto_2532557 ?auto_2532556 ?auto_2532558 ?auto_2532559 ?auto_2532560 ?auto_2532561 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2535648 - SURFACE
      ?auto_2535649 - SURFACE
    )
    :vars
    (
      ?auto_2535653 - HOIST
      ?auto_2535652 - PLACE
      ?auto_2535651 - SURFACE
      ?auto_2535650 - TRUCK
      ?auto_2535656 - PLACE
      ?auto_2535654 - HOIST
      ?auto_2535655 - SURFACE
      ?auto_2535657 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2535653 ?auto_2535652 ) ( SURFACE-AT ?auto_2535648 ?auto_2535652 ) ( CLEAR ?auto_2535648 ) ( IS-CRATE ?auto_2535649 ) ( not ( = ?auto_2535648 ?auto_2535649 ) ) ( AVAILABLE ?auto_2535653 ) ( ON ?auto_2535648 ?auto_2535651 ) ( not ( = ?auto_2535651 ?auto_2535648 ) ) ( not ( = ?auto_2535651 ?auto_2535649 ) ) ( TRUCK-AT ?auto_2535650 ?auto_2535656 ) ( not ( = ?auto_2535656 ?auto_2535652 ) ) ( HOIST-AT ?auto_2535654 ?auto_2535656 ) ( not ( = ?auto_2535653 ?auto_2535654 ) ) ( SURFACE-AT ?auto_2535649 ?auto_2535656 ) ( ON ?auto_2535649 ?auto_2535655 ) ( CLEAR ?auto_2535649 ) ( not ( = ?auto_2535648 ?auto_2535655 ) ) ( not ( = ?auto_2535649 ?auto_2535655 ) ) ( not ( = ?auto_2535651 ?auto_2535655 ) ) ( LIFTING ?auto_2535654 ?auto_2535657 ) ( IS-CRATE ?auto_2535657 ) ( not ( = ?auto_2535648 ?auto_2535657 ) ) ( not ( = ?auto_2535649 ?auto_2535657 ) ) ( not ( = ?auto_2535651 ?auto_2535657 ) ) ( not ( = ?auto_2535655 ?auto_2535657 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2535654 ?auto_2535657 ?auto_2535650 ?auto_2535656 )
      ( MAKE-1CRATE ?auto_2535648 ?auto_2535649 )
      ( MAKE-1CRATE-VERIFY ?auto_2535648 ?auto_2535649 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2536660 - SURFACE
      ?auto_2536661 - SURFACE
      ?auto_2536662 - SURFACE
      ?auto_2536664 - SURFACE
      ?auto_2536663 - SURFACE
      ?auto_2536665 - SURFACE
      ?auto_2536666 - SURFACE
      ?auto_2536667 - SURFACE
      ?auto_2536668 - SURFACE
      ?auto_2536669 - SURFACE
    )
    :vars
    (
      ?auto_2536670 - HOIST
      ?auto_2536671 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2536670 ?auto_2536671 ) ( SURFACE-AT ?auto_2536668 ?auto_2536671 ) ( CLEAR ?auto_2536668 ) ( LIFTING ?auto_2536670 ?auto_2536669 ) ( IS-CRATE ?auto_2536669 ) ( not ( = ?auto_2536668 ?auto_2536669 ) ) ( ON ?auto_2536661 ?auto_2536660 ) ( ON ?auto_2536662 ?auto_2536661 ) ( ON ?auto_2536664 ?auto_2536662 ) ( ON ?auto_2536663 ?auto_2536664 ) ( ON ?auto_2536665 ?auto_2536663 ) ( ON ?auto_2536666 ?auto_2536665 ) ( ON ?auto_2536667 ?auto_2536666 ) ( ON ?auto_2536668 ?auto_2536667 ) ( not ( = ?auto_2536660 ?auto_2536661 ) ) ( not ( = ?auto_2536660 ?auto_2536662 ) ) ( not ( = ?auto_2536660 ?auto_2536664 ) ) ( not ( = ?auto_2536660 ?auto_2536663 ) ) ( not ( = ?auto_2536660 ?auto_2536665 ) ) ( not ( = ?auto_2536660 ?auto_2536666 ) ) ( not ( = ?auto_2536660 ?auto_2536667 ) ) ( not ( = ?auto_2536660 ?auto_2536668 ) ) ( not ( = ?auto_2536660 ?auto_2536669 ) ) ( not ( = ?auto_2536661 ?auto_2536662 ) ) ( not ( = ?auto_2536661 ?auto_2536664 ) ) ( not ( = ?auto_2536661 ?auto_2536663 ) ) ( not ( = ?auto_2536661 ?auto_2536665 ) ) ( not ( = ?auto_2536661 ?auto_2536666 ) ) ( not ( = ?auto_2536661 ?auto_2536667 ) ) ( not ( = ?auto_2536661 ?auto_2536668 ) ) ( not ( = ?auto_2536661 ?auto_2536669 ) ) ( not ( = ?auto_2536662 ?auto_2536664 ) ) ( not ( = ?auto_2536662 ?auto_2536663 ) ) ( not ( = ?auto_2536662 ?auto_2536665 ) ) ( not ( = ?auto_2536662 ?auto_2536666 ) ) ( not ( = ?auto_2536662 ?auto_2536667 ) ) ( not ( = ?auto_2536662 ?auto_2536668 ) ) ( not ( = ?auto_2536662 ?auto_2536669 ) ) ( not ( = ?auto_2536664 ?auto_2536663 ) ) ( not ( = ?auto_2536664 ?auto_2536665 ) ) ( not ( = ?auto_2536664 ?auto_2536666 ) ) ( not ( = ?auto_2536664 ?auto_2536667 ) ) ( not ( = ?auto_2536664 ?auto_2536668 ) ) ( not ( = ?auto_2536664 ?auto_2536669 ) ) ( not ( = ?auto_2536663 ?auto_2536665 ) ) ( not ( = ?auto_2536663 ?auto_2536666 ) ) ( not ( = ?auto_2536663 ?auto_2536667 ) ) ( not ( = ?auto_2536663 ?auto_2536668 ) ) ( not ( = ?auto_2536663 ?auto_2536669 ) ) ( not ( = ?auto_2536665 ?auto_2536666 ) ) ( not ( = ?auto_2536665 ?auto_2536667 ) ) ( not ( = ?auto_2536665 ?auto_2536668 ) ) ( not ( = ?auto_2536665 ?auto_2536669 ) ) ( not ( = ?auto_2536666 ?auto_2536667 ) ) ( not ( = ?auto_2536666 ?auto_2536668 ) ) ( not ( = ?auto_2536666 ?auto_2536669 ) ) ( not ( = ?auto_2536667 ?auto_2536668 ) ) ( not ( = ?auto_2536667 ?auto_2536669 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2536668 ?auto_2536669 )
      ( MAKE-9CRATE-VERIFY ?auto_2536660 ?auto_2536661 ?auto_2536662 ?auto_2536664 ?auto_2536663 ?auto_2536665 ?auto_2536666 ?auto_2536667 ?auto_2536668 ?auto_2536669 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2536740 - SURFACE
      ?auto_2536741 - SURFACE
      ?auto_2536742 - SURFACE
      ?auto_2536744 - SURFACE
      ?auto_2536743 - SURFACE
      ?auto_2536745 - SURFACE
      ?auto_2536746 - SURFACE
      ?auto_2536747 - SURFACE
      ?auto_2536748 - SURFACE
      ?auto_2536749 - SURFACE
    )
    :vars
    (
      ?auto_2536752 - HOIST
      ?auto_2536751 - PLACE
      ?auto_2536750 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2536752 ?auto_2536751 ) ( SURFACE-AT ?auto_2536748 ?auto_2536751 ) ( CLEAR ?auto_2536748 ) ( IS-CRATE ?auto_2536749 ) ( not ( = ?auto_2536748 ?auto_2536749 ) ) ( TRUCK-AT ?auto_2536750 ?auto_2536751 ) ( AVAILABLE ?auto_2536752 ) ( IN ?auto_2536749 ?auto_2536750 ) ( ON ?auto_2536748 ?auto_2536747 ) ( not ( = ?auto_2536747 ?auto_2536748 ) ) ( not ( = ?auto_2536747 ?auto_2536749 ) ) ( ON ?auto_2536741 ?auto_2536740 ) ( ON ?auto_2536742 ?auto_2536741 ) ( ON ?auto_2536744 ?auto_2536742 ) ( ON ?auto_2536743 ?auto_2536744 ) ( ON ?auto_2536745 ?auto_2536743 ) ( ON ?auto_2536746 ?auto_2536745 ) ( ON ?auto_2536747 ?auto_2536746 ) ( not ( = ?auto_2536740 ?auto_2536741 ) ) ( not ( = ?auto_2536740 ?auto_2536742 ) ) ( not ( = ?auto_2536740 ?auto_2536744 ) ) ( not ( = ?auto_2536740 ?auto_2536743 ) ) ( not ( = ?auto_2536740 ?auto_2536745 ) ) ( not ( = ?auto_2536740 ?auto_2536746 ) ) ( not ( = ?auto_2536740 ?auto_2536747 ) ) ( not ( = ?auto_2536740 ?auto_2536748 ) ) ( not ( = ?auto_2536740 ?auto_2536749 ) ) ( not ( = ?auto_2536741 ?auto_2536742 ) ) ( not ( = ?auto_2536741 ?auto_2536744 ) ) ( not ( = ?auto_2536741 ?auto_2536743 ) ) ( not ( = ?auto_2536741 ?auto_2536745 ) ) ( not ( = ?auto_2536741 ?auto_2536746 ) ) ( not ( = ?auto_2536741 ?auto_2536747 ) ) ( not ( = ?auto_2536741 ?auto_2536748 ) ) ( not ( = ?auto_2536741 ?auto_2536749 ) ) ( not ( = ?auto_2536742 ?auto_2536744 ) ) ( not ( = ?auto_2536742 ?auto_2536743 ) ) ( not ( = ?auto_2536742 ?auto_2536745 ) ) ( not ( = ?auto_2536742 ?auto_2536746 ) ) ( not ( = ?auto_2536742 ?auto_2536747 ) ) ( not ( = ?auto_2536742 ?auto_2536748 ) ) ( not ( = ?auto_2536742 ?auto_2536749 ) ) ( not ( = ?auto_2536744 ?auto_2536743 ) ) ( not ( = ?auto_2536744 ?auto_2536745 ) ) ( not ( = ?auto_2536744 ?auto_2536746 ) ) ( not ( = ?auto_2536744 ?auto_2536747 ) ) ( not ( = ?auto_2536744 ?auto_2536748 ) ) ( not ( = ?auto_2536744 ?auto_2536749 ) ) ( not ( = ?auto_2536743 ?auto_2536745 ) ) ( not ( = ?auto_2536743 ?auto_2536746 ) ) ( not ( = ?auto_2536743 ?auto_2536747 ) ) ( not ( = ?auto_2536743 ?auto_2536748 ) ) ( not ( = ?auto_2536743 ?auto_2536749 ) ) ( not ( = ?auto_2536745 ?auto_2536746 ) ) ( not ( = ?auto_2536745 ?auto_2536747 ) ) ( not ( = ?auto_2536745 ?auto_2536748 ) ) ( not ( = ?auto_2536745 ?auto_2536749 ) ) ( not ( = ?auto_2536746 ?auto_2536747 ) ) ( not ( = ?auto_2536746 ?auto_2536748 ) ) ( not ( = ?auto_2536746 ?auto_2536749 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2536747 ?auto_2536748 ?auto_2536749 )
      ( MAKE-9CRATE-VERIFY ?auto_2536740 ?auto_2536741 ?auto_2536742 ?auto_2536744 ?auto_2536743 ?auto_2536745 ?auto_2536746 ?auto_2536747 ?auto_2536748 ?auto_2536749 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2536830 - SURFACE
      ?auto_2536831 - SURFACE
      ?auto_2536832 - SURFACE
      ?auto_2536834 - SURFACE
      ?auto_2536833 - SURFACE
      ?auto_2536835 - SURFACE
      ?auto_2536836 - SURFACE
      ?auto_2536837 - SURFACE
      ?auto_2536838 - SURFACE
      ?auto_2536839 - SURFACE
    )
    :vars
    (
      ?auto_2536843 - HOIST
      ?auto_2536842 - PLACE
      ?auto_2536841 - TRUCK
      ?auto_2536840 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2536843 ?auto_2536842 ) ( SURFACE-AT ?auto_2536838 ?auto_2536842 ) ( CLEAR ?auto_2536838 ) ( IS-CRATE ?auto_2536839 ) ( not ( = ?auto_2536838 ?auto_2536839 ) ) ( AVAILABLE ?auto_2536843 ) ( IN ?auto_2536839 ?auto_2536841 ) ( ON ?auto_2536838 ?auto_2536837 ) ( not ( = ?auto_2536837 ?auto_2536838 ) ) ( not ( = ?auto_2536837 ?auto_2536839 ) ) ( TRUCK-AT ?auto_2536841 ?auto_2536840 ) ( not ( = ?auto_2536840 ?auto_2536842 ) ) ( ON ?auto_2536831 ?auto_2536830 ) ( ON ?auto_2536832 ?auto_2536831 ) ( ON ?auto_2536834 ?auto_2536832 ) ( ON ?auto_2536833 ?auto_2536834 ) ( ON ?auto_2536835 ?auto_2536833 ) ( ON ?auto_2536836 ?auto_2536835 ) ( ON ?auto_2536837 ?auto_2536836 ) ( not ( = ?auto_2536830 ?auto_2536831 ) ) ( not ( = ?auto_2536830 ?auto_2536832 ) ) ( not ( = ?auto_2536830 ?auto_2536834 ) ) ( not ( = ?auto_2536830 ?auto_2536833 ) ) ( not ( = ?auto_2536830 ?auto_2536835 ) ) ( not ( = ?auto_2536830 ?auto_2536836 ) ) ( not ( = ?auto_2536830 ?auto_2536837 ) ) ( not ( = ?auto_2536830 ?auto_2536838 ) ) ( not ( = ?auto_2536830 ?auto_2536839 ) ) ( not ( = ?auto_2536831 ?auto_2536832 ) ) ( not ( = ?auto_2536831 ?auto_2536834 ) ) ( not ( = ?auto_2536831 ?auto_2536833 ) ) ( not ( = ?auto_2536831 ?auto_2536835 ) ) ( not ( = ?auto_2536831 ?auto_2536836 ) ) ( not ( = ?auto_2536831 ?auto_2536837 ) ) ( not ( = ?auto_2536831 ?auto_2536838 ) ) ( not ( = ?auto_2536831 ?auto_2536839 ) ) ( not ( = ?auto_2536832 ?auto_2536834 ) ) ( not ( = ?auto_2536832 ?auto_2536833 ) ) ( not ( = ?auto_2536832 ?auto_2536835 ) ) ( not ( = ?auto_2536832 ?auto_2536836 ) ) ( not ( = ?auto_2536832 ?auto_2536837 ) ) ( not ( = ?auto_2536832 ?auto_2536838 ) ) ( not ( = ?auto_2536832 ?auto_2536839 ) ) ( not ( = ?auto_2536834 ?auto_2536833 ) ) ( not ( = ?auto_2536834 ?auto_2536835 ) ) ( not ( = ?auto_2536834 ?auto_2536836 ) ) ( not ( = ?auto_2536834 ?auto_2536837 ) ) ( not ( = ?auto_2536834 ?auto_2536838 ) ) ( not ( = ?auto_2536834 ?auto_2536839 ) ) ( not ( = ?auto_2536833 ?auto_2536835 ) ) ( not ( = ?auto_2536833 ?auto_2536836 ) ) ( not ( = ?auto_2536833 ?auto_2536837 ) ) ( not ( = ?auto_2536833 ?auto_2536838 ) ) ( not ( = ?auto_2536833 ?auto_2536839 ) ) ( not ( = ?auto_2536835 ?auto_2536836 ) ) ( not ( = ?auto_2536835 ?auto_2536837 ) ) ( not ( = ?auto_2536835 ?auto_2536838 ) ) ( not ( = ?auto_2536835 ?auto_2536839 ) ) ( not ( = ?auto_2536836 ?auto_2536837 ) ) ( not ( = ?auto_2536836 ?auto_2536838 ) ) ( not ( = ?auto_2536836 ?auto_2536839 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2536837 ?auto_2536838 ?auto_2536839 )
      ( MAKE-9CRATE-VERIFY ?auto_2536830 ?auto_2536831 ?auto_2536832 ?auto_2536834 ?auto_2536833 ?auto_2536835 ?auto_2536836 ?auto_2536837 ?auto_2536838 ?auto_2536839 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2536929 - SURFACE
      ?auto_2536930 - SURFACE
      ?auto_2536931 - SURFACE
      ?auto_2536933 - SURFACE
      ?auto_2536932 - SURFACE
      ?auto_2536934 - SURFACE
      ?auto_2536935 - SURFACE
      ?auto_2536936 - SURFACE
      ?auto_2536937 - SURFACE
      ?auto_2536938 - SURFACE
    )
    :vars
    (
      ?auto_2536941 - HOIST
      ?auto_2536939 - PLACE
      ?auto_2536940 - TRUCK
      ?auto_2536942 - PLACE
      ?auto_2536943 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2536941 ?auto_2536939 ) ( SURFACE-AT ?auto_2536937 ?auto_2536939 ) ( CLEAR ?auto_2536937 ) ( IS-CRATE ?auto_2536938 ) ( not ( = ?auto_2536937 ?auto_2536938 ) ) ( AVAILABLE ?auto_2536941 ) ( ON ?auto_2536937 ?auto_2536936 ) ( not ( = ?auto_2536936 ?auto_2536937 ) ) ( not ( = ?auto_2536936 ?auto_2536938 ) ) ( TRUCK-AT ?auto_2536940 ?auto_2536942 ) ( not ( = ?auto_2536942 ?auto_2536939 ) ) ( HOIST-AT ?auto_2536943 ?auto_2536942 ) ( LIFTING ?auto_2536943 ?auto_2536938 ) ( not ( = ?auto_2536941 ?auto_2536943 ) ) ( ON ?auto_2536930 ?auto_2536929 ) ( ON ?auto_2536931 ?auto_2536930 ) ( ON ?auto_2536933 ?auto_2536931 ) ( ON ?auto_2536932 ?auto_2536933 ) ( ON ?auto_2536934 ?auto_2536932 ) ( ON ?auto_2536935 ?auto_2536934 ) ( ON ?auto_2536936 ?auto_2536935 ) ( not ( = ?auto_2536929 ?auto_2536930 ) ) ( not ( = ?auto_2536929 ?auto_2536931 ) ) ( not ( = ?auto_2536929 ?auto_2536933 ) ) ( not ( = ?auto_2536929 ?auto_2536932 ) ) ( not ( = ?auto_2536929 ?auto_2536934 ) ) ( not ( = ?auto_2536929 ?auto_2536935 ) ) ( not ( = ?auto_2536929 ?auto_2536936 ) ) ( not ( = ?auto_2536929 ?auto_2536937 ) ) ( not ( = ?auto_2536929 ?auto_2536938 ) ) ( not ( = ?auto_2536930 ?auto_2536931 ) ) ( not ( = ?auto_2536930 ?auto_2536933 ) ) ( not ( = ?auto_2536930 ?auto_2536932 ) ) ( not ( = ?auto_2536930 ?auto_2536934 ) ) ( not ( = ?auto_2536930 ?auto_2536935 ) ) ( not ( = ?auto_2536930 ?auto_2536936 ) ) ( not ( = ?auto_2536930 ?auto_2536937 ) ) ( not ( = ?auto_2536930 ?auto_2536938 ) ) ( not ( = ?auto_2536931 ?auto_2536933 ) ) ( not ( = ?auto_2536931 ?auto_2536932 ) ) ( not ( = ?auto_2536931 ?auto_2536934 ) ) ( not ( = ?auto_2536931 ?auto_2536935 ) ) ( not ( = ?auto_2536931 ?auto_2536936 ) ) ( not ( = ?auto_2536931 ?auto_2536937 ) ) ( not ( = ?auto_2536931 ?auto_2536938 ) ) ( not ( = ?auto_2536933 ?auto_2536932 ) ) ( not ( = ?auto_2536933 ?auto_2536934 ) ) ( not ( = ?auto_2536933 ?auto_2536935 ) ) ( not ( = ?auto_2536933 ?auto_2536936 ) ) ( not ( = ?auto_2536933 ?auto_2536937 ) ) ( not ( = ?auto_2536933 ?auto_2536938 ) ) ( not ( = ?auto_2536932 ?auto_2536934 ) ) ( not ( = ?auto_2536932 ?auto_2536935 ) ) ( not ( = ?auto_2536932 ?auto_2536936 ) ) ( not ( = ?auto_2536932 ?auto_2536937 ) ) ( not ( = ?auto_2536932 ?auto_2536938 ) ) ( not ( = ?auto_2536934 ?auto_2536935 ) ) ( not ( = ?auto_2536934 ?auto_2536936 ) ) ( not ( = ?auto_2536934 ?auto_2536937 ) ) ( not ( = ?auto_2536934 ?auto_2536938 ) ) ( not ( = ?auto_2536935 ?auto_2536936 ) ) ( not ( = ?auto_2536935 ?auto_2536937 ) ) ( not ( = ?auto_2536935 ?auto_2536938 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2536936 ?auto_2536937 ?auto_2536938 )
      ( MAKE-9CRATE-VERIFY ?auto_2536929 ?auto_2536930 ?auto_2536931 ?auto_2536933 ?auto_2536932 ?auto_2536934 ?auto_2536935 ?auto_2536936 ?auto_2536937 ?auto_2536938 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2537037 - SURFACE
      ?auto_2537038 - SURFACE
      ?auto_2537039 - SURFACE
      ?auto_2537041 - SURFACE
      ?auto_2537040 - SURFACE
      ?auto_2537042 - SURFACE
      ?auto_2537043 - SURFACE
      ?auto_2537044 - SURFACE
      ?auto_2537045 - SURFACE
      ?auto_2537046 - SURFACE
    )
    :vars
    (
      ?auto_2537047 - HOIST
      ?auto_2537050 - PLACE
      ?auto_2537052 - TRUCK
      ?auto_2537051 - PLACE
      ?auto_2537048 - HOIST
      ?auto_2537049 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2537047 ?auto_2537050 ) ( SURFACE-AT ?auto_2537045 ?auto_2537050 ) ( CLEAR ?auto_2537045 ) ( IS-CRATE ?auto_2537046 ) ( not ( = ?auto_2537045 ?auto_2537046 ) ) ( AVAILABLE ?auto_2537047 ) ( ON ?auto_2537045 ?auto_2537044 ) ( not ( = ?auto_2537044 ?auto_2537045 ) ) ( not ( = ?auto_2537044 ?auto_2537046 ) ) ( TRUCK-AT ?auto_2537052 ?auto_2537051 ) ( not ( = ?auto_2537051 ?auto_2537050 ) ) ( HOIST-AT ?auto_2537048 ?auto_2537051 ) ( not ( = ?auto_2537047 ?auto_2537048 ) ) ( AVAILABLE ?auto_2537048 ) ( SURFACE-AT ?auto_2537046 ?auto_2537051 ) ( ON ?auto_2537046 ?auto_2537049 ) ( CLEAR ?auto_2537046 ) ( not ( = ?auto_2537045 ?auto_2537049 ) ) ( not ( = ?auto_2537046 ?auto_2537049 ) ) ( not ( = ?auto_2537044 ?auto_2537049 ) ) ( ON ?auto_2537038 ?auto_2537037 ) ( ON ?auto_2537039 ?auto_2537038 ) ( ON ?auto_2537041 ?auto_2537039 ) ( ON ?auto_2537040 ?auto_2537041 ) ( ON ?auto_2537042 ?auto_2537040 ) ( ON ?auto_2537043 ?auto_2537042 ) ( ON ?auto_2537044 ?auto_2537043 ) ( not ( = ?auto_2537037 ?auto_2537038 ) ) ( not ( = ?auto_2537037 ?auto_2537039 ) ) ( not ( = ?auto_2537037 ?auto_2537041 ) ) ( not ( = ?auto_2537037 ?auto_2537040 ) ) ( not ( = ?auto_2537037 ?auto_2537042 ) ) ( not ( = ?auto_2537037 ?auto_2537043 ) ) ( not ( = ?auto_2537037 ?auto_2537044 ) ) ( not ( = ?auto_2537037 ?auto_2537045 ) ) ( not ( = ?auto_2537037 ?auto_2537046 ) ) ( not ( = ?auto_2537037 ?auto_2537049 ) ) ( not ( = ?auto_2537038 ?auto_2537039 ) ) ( not ( = ?auto_2537038 ?auto_2537041 ) ) ( not ( = ?auto_2537038 ?auto_2537040 ) ) ( not ( = ?auto_2537038 ?auto_2537042 ) ) ( not ( = ?auto_2537038 ?auto_2537043 ) ) ( not ( = ?auto_2537038 ?auto_2537044 ) ) ( not ( = ?auto_2537038 ?auto_2537045 ) ) ( not ( = ?auto_2537038 ?auto_2537046 ) ) ( not ( = ?auto_2537038 ?auto_2537049 ) ) ( not ( = ?auto_2537039 ?auto_2537041 ) ) ( not ( = ?auto_2537039 ?auto_2537040 ) ) ( not ( = ?auto_2537039 ?auto_2537042 ) ) ( not ( = ?auto_2537039 ?auto_2537043 ) ) ( not ( = ?auto_2537039 ?auto_2537044 ) ) ( not ( = ?auto_2537039 ?auto_2537045 ) ) ( not ( = ?auto_2537039 ?auto_2537046 ) ) ( not ( = ?auto_2537039 ?auto_2537049 ) ) ( not ( = ?auto_2537041 ?auto_2537040 ) ) ( not ( = ?auto_2537041 ?auto_2537042 ) ) ( not ( = ?auto_2537041 ?auto_2537043 ) ) ( not ( = ?auto_2537041 ?auto_2537044 ) ) ( not ( = ?auto_2537041 ?auto_2537045 ) ) ( not ( = ?auto_2537041 ?auto_2537046 ) ) ( not ( = ?auto_2537041 ?auto_2537049 ) ) ( not ( = ?auto_2537040 ?auto_2537042 ) ) ( not ( = ?auto_2537040 ?auto_2537043 ) ) ( not ( = ?auto_2537040 ?auto_2537044 ) ) ( not ( = ?auto_2537040 ?auto_2537045 ) ) ( not ( = ?auto_2537040 ?auto_2537046 ) ) ( not ( = ?auto_2537040 ?auto_2537049 ) ) ( not ( = ?auto_2537042 ?auto_2537043 ) ) ( not ( = ?auto_2537042 ?auto_2537044 ) ) ( not ( = ?auto_2537042 ?auto_2537045 ) ) ( not ( = ?auto_2537042 ?auto_2537046 ) ) ( not ( = ?auto_2537042 ?auto_2537049 ) ) ( not ( = ?auto_2537043 ?auto_2537044 ) ) ( not ( = ?auto_2537043 ?auto_2537045 ) ) ( not ( = ?auto_2537043 ?auto_2537046 ) ) ( not ( = ?auto_2537043 ?auto_2537049 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2537044 ?auto_2537045 ?auto_2537046 )
      ( MAKE-9CRATE-VERIFY ?auto_2537037 ?auto_2537038 ?auto_2537039 ?auto_2537041 ?auto_2537040 ?auto_2537042 ?auto_2537043 ?auto_2537044 ?auto_2537045 ?auto_2537046 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2537146 - SURFACE
      ?auto_2537147 - SURFACE
      ?auto_2537148 - SURFACE
      ?auto_2537150 - SURFACE
      ?auto_2537149 - SURFACE
      ?auto_2537151 - SURFACE
      ?auto_2537152 - SURFACE
      ?auto_2537153 - SURFACE
      ?auto_2537154 - SURFACE
      ?auto_2537155 - SURFACE
    )
    :vars
    (
      ?auto_2537161 - HOIST
      ?auto_2537158 - PLACE
      ?auto_2537157 - PLACE
      ?auto_2537156 - HOIST
      ?auto_2537159 - SURFACE
      ?auto_2537160 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2537161 ?auto_2537158 ) ( SURFACE-AT ?auto_2537154 ?auto_2537158 ) ( CLEAR ?auto_2537154 ) ( IS-CRATE ?auto_2537155 ) ( not ( = ?auto_2537154 ?auto_2537155 ) ) ( AVAILABLE ?auto_2537161 ) ( ON ?auto_2537154 ?auto_2537153 ) ( not ( = ?auto_2537153 ?auto_2537154 ) ) ( not ( = ?auto_2537153 ?auto_2537155 ) ) ( not ( = ?auto_2537157 ?auto_2537158 ) ) ( HOIST-AT ?auto_2537156 ?auto_2537157 ) ( not ( = ?auto_2537161 ?auto_2537156 ) ) ( AVAILABLE ?auto_2537156 ) ( SURFACE-AT ?auto_2537155 ?auto_2537157 ) ( ON ?auto_2537155 ?auto_2537159 ) ( CLEAR ?auto_2537155 ) ( not ( = ?auto_2537154 ?auto_2537159 ) ) ( not ( = ?auto_2537155 ?auto_2537159 ) ) ( not ( = ?auto_2537153 ?auto_2537159 ) ) ( TRUCK-AT ?auto_2537160 ?auto_2537158 ) ( ON ?auto_2537147 ?auto_2537146 ) ( ON ?auto_2537148 ?auto_2537147 ) ( ON ?auto_2537150 ?auto_2537148 ) ( ON ?auto_2537149 ?auto_2537150 ) ( ON ?auto_2537151 ?auto_2537149 ) ( ON ?auto_2537152 ?auto_2537151 ) ( ON ?auto_2537153 ?auto_2537152 ) ( not ( = ?auto_2537146 ?auto_2537147 ) ) ( not ( = ?auto_2537146 ?auto_2537148 ) ) ( not ( = ?auto_2537146 ?auto_2537150 ) ) ( not ( = ?auto_2537146 ?auto_2537149 ) ) ( not ( = ?auto_2537146 ?auto_2537151 ) ) ( not ( = ?auto_2537146 ?auto_2537152 ) ) ( not ( = ?auto_2537146 ?auto_2537153 ) ) ( not ( = ?auto_2537146 ?auto_2537154 ) ) ( not ( = ?auto_2537146 ?auto_2537155 ) ) ( not ( = ?auto_2537146 ?auto_2537159 ) ) ( not ( = ?auto_2537147 ?auto_2537148 ) ) ( not ( = ?auto_2537147 ?auto_2537150 ) ) ( not ( = ?auto_2537147 ?auto_2537149 ) ) ( not ( = ?auto_2537147 ?auto_2537151 ) ) ( not ( = ?auto_2537147 ?auto_2537152 ) ) ( not ( = ?auto_2537147 ?auto_2537153 ) ) ( not ( = ?auto_2537147 ?auto_2537154 ) ) ( not ( = ?auto_2537147 ?auto_2537155 ) ) ( not ( = ?auto_2537147 ?auto_2537159 ) ) ( not ( = ?auto_2537148 ?auto_2537150 ) ) ( not ( = ?auto_2537148 ?auto_2537149 ) ) ( not ( = ?auto_2537148 ?auto_2537151 ) ) ( not ( = ?auto_2537148 ?auto_2537152 ) ) ( not ( = ?auto_2537148 ?auto_2537153 ) ) ( not ( = ?auto_2537148 ?auto_2537154 ) ) ( not ( = ?auto_2537148 ?auto_2537155 ) ) ( not ( = ?auto_2537148 ?auto_2537159 ) ) ( not ( = ?auto_2537150 ?auto_2537149 ) ) ( not ( = ?auto_2537150 ?auto_2537151 ) ) ( not ( = ?auto_2537150 ?auto_2537152 ) ) ( not ( = ?auto_2537150 ?auto_2537153 ) ) ( not ( = ?auto_2537150 ?auto_2537154 ) ) ( not ( = ?auto_2537150 ?auto_2537155 ) ) ( not ( = ?auto_2537150 ?auto_2537159 ) ) ( not ( = ?auto_2537149 ?auto_2537151 ) ) ( not ( = ?auto_2537149 ?auto_2537152 ) ) ( not ( = ?auto_2537149 ?auto_2537153 ) ) ( not ( = ?auto_2537149 ?auto_2537154 ) ) ( not ( = ?auto_2537149 ?auto_2537155 ) ) ( not ( = ?auto_2537149 ?auto_2537159 ) ) ( not ( = ?auto_2537151 ?auto_2537152 ) ) ( not ( = ?auto_2537151 ?auto_2537153 ) ) ( not ( = ?auto_2537151 ?auto_2537154 ) ) ( not ( = ?auto_2537151 ?auto_2537155 ) ) ( not ( = ?auto_2537151 ?auto_2537159 ) ) ( not ( = ?auto_2537152 ?auto_2537153 ) ) ( not ( = ?auto_2537152 ?auto_2537154 ) ) ( not ( = ?auto_2537152 ?auto_2537155 ) ) ( not ( = ?auto_2537152 ?auto_2537159 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2537153 ?auto_2537154 ?auto_2537155 )
      ( MAKE-9CRATE-VERIFY ?auto_2537146 ?auto_2537147 ?auto_2537148 ?auto_2537150 ?auto_2537149 ?auto_2537151 ?auto_2537152 ?auto_2537153 ?auto_2537154 ?auto_2537155 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2537255 - SURFACE
      ?auto_2537256 - SURFACE
      ?auto_2537257 - SURFACE
      ?auto_2537259 - SURFACE
      ?auto_2537258 - SURFACE
      ?auto_2537260 - SURFACE
      ?auto_2537261 - SURFACE
      ?auto_2537262 - SURFACE
      ?auto_2537263 - SURFACE
      ?auto_2537264 - SURFACE
    )
    :vars
    (
      ?auto_2537268 - HOIST
      ?auto_2537266 - PLACE
      ?auto_2537265 - PLACE
      ?auto_2537269 - HOIST
      ?auto_2537267 - SURFACE
      ?auto_2537270 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2537268 ?auto_2537266 ) ( IS-CRATE ?auto_2537264 ) ( not ( = ?auto_2537263 ?auto_2537264 ) ) ( not ( = ?auto_2537262 ?auto_2537263 ) ) ( not ( = ?auto_2537262 ?auto_2537264 ) ) ( not ( = ?auto_2537265 ?auto_2537266 ) ) ( HOIST-AT ?auto_2537269 ?auto_2537265 ) ( not ( = ?auto_2537268 ?auto_2537269 ) ) ( AVAILABLE ?auto_2537269 ) ( SURFACE-AT ?auto_2537264 ?auto_2537265 ) ( ON ?auto_2537264 ?auto_2537267 ) ( CLEAR ?auto_2537264 ) ( not ( = ?auto_2537263 ?auto_2537267 ) ) ( not ( = ?auto_2537264 ?auto_2537267 ) ) ( not ( = ?auto_2537262 ?auto_2537267 ) ) ( TRUCK-AT ?auto_2537270 ?auto_2537266 ) ( SURFACE-AT ?auto_2537262 ?auto_2537266 ) ( CLEAR ?auto_2537262 ) ( LIFTING ?auto_2537268 ?auto_2537263 ) ( IS-CRATE ?auto_2537263 ) ( ON ?auto_2537256 ?auto_2537255 ) ( ON ?auto_2537257 ?auto_2537256 ) ( ON ?auto_2537259 ?auto_2537257 ) ( ON ?auto_2537258 ?auto_2537259 ) ( ON ?auto_2537260 ?auto_2537258 ) ( ON ?auto_2537261 ?auto_2537260 ) ( ON ?auto_2537262 ?auto_2537261 ) ( not ( = ?auto_2537255 ?auto_2537256 ) ) ( not ( = ?auto_2537255 ?auto_2537257 ) ) ( not ( = ?auto_2537255 ?auto_2537259 ) ) ( not ( = ?auto_2537255 ?auto_2537258 ) ) ( not ( = ?auto_2537255 ?auto_2537260 ) ) ( not ( = ?auto_2537255 ?auto_2537261 ) ) ( not ( = ?auto_2537255 ?auto_2537262 ) ) ( not ( = ?auto_2537255 ?auto_2537263 ) ) ( not ( = ?auto_2537255 ?auto_2537264 ) ) ( not ( = ?auto_2537255 ?auto_2537267 ) ) ( not ( = ?auto_2537256 ?auto_2537257 ) ) ( not ( = ?auto_2537256 ?auto_2537259 ) ) ( not ( = ?auto_2537256 ?auto_2537258 ) ) ( not ( = ?auto_2537256 ?auto_2537260 ) ) ( not ( = ?auto_2537256 ?auto_2537261 ) ) ( not ( = ?auto_2537256 ?auto_2537262 ) ) ( not ( = ?auto_2537256 ?auto_2537263 ) ) ( not ( = ?auto_2537256 ?auto_2537264 ) ) ( not ( = ?auto_2537256 ?auto_2537267 ) ) ( not ( = ?auto_2537257 ?auto_2537259 ) ) ( not ( = ?auto_2537257 ?auto_2537258 ) ) ( not ( = ?auto_2537257 ?auto_2537260 ) ) ( not ( = ?auto_2537257 ?auto_2537261 ) ) ( not ( = ?auto_2537257 ?auto_2537262 ) ) ( not ( = ?auto_2537257 ?auto_2537263 ) ) ( not ( = ?auto_2537257 ?auto_2537264 ) ) ( not ( = ?auto_2537257 ?auto_2537267 ) ) ( not ( = ?auto_2537259 ?auto_2537258 ) ) ( not ( = ?auto_2537259 ?auto_2537260 ) ) ( not ( = ?auto_2537259 ?auto_2537261 ) ) ( not ( = ?auto_2537259 ?auto_2537262 ) ) ( not ( = ?auto_2537259 ?auto_2537263 ) ) ( not ( = ?auto_2537259 ?auto_2537264 ) ) ( not ( = ?auto_2537259 ?auto_2537267 ) ) ( not ( = ?auto_2537258 ?auto_2537260 ) ) ( not ( = ?auto_2537258 ?auto_2537261 ) ) ( not ( = ?auto_2537258 ?auto_2537262 ) ) ( not ( = ?auto_2537258 ?auto_2537263 ) ) ( not ( = ?auto_2537258 ?auto_2537264 ) ) ( not ( = ?auto_2537258 ?auto_2537267 ) ) ( not ( = ?auto_2537260 ?auto_2537261 ) ) ( not ( = ?auto_2537260 ?auto_2537262 ) ) ( not ( = ?auto_2537260 ?auto_2537263 ) ) ( not ( = ?auto_2537260 ?auto_2537264 ) ) ( not ( = ?auto_2537260 ?auto_2537267 ) ) ( not ( = ?auto_2537261 ?auto_2537262 ) ) ( not ( = ?auto_2537261 ?auto_2537263 ) ) ( not ( = ?auto_2537261 ?auto_2537264 ) ) ( not ( = ?auto_2537261 ?auto_2537267 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2537262 ?auto_2537263 ?auto_2537264 )
      ( MAKE-9CRATE-VERIFY ?auto_2537255 ?auto_2537256 ?auto_2537257 ?auto_2537259 ?auto_2537258 ?auto_2537260 ?auto_2537261 ?auto_2537262 ?auto_2537263 ?auto_2537264 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2537364 - SURFACE
      ?auto_2537365 - SURFACE
      ?auto_2537366 - SURFACE
      ?auto_2537368 - SURFACE
      ?auto_2537367 - SURFACE
      ?auto_2537369 - SURFACE
      ?auto_2537370 - SURFACE
      ?auto_2537371 - SURFACE
      ?auto_2537372 - SURFACE
      ?auto_2537373 - SURFACE
    )
    :vars
    (
      ?auto_2537374 - HOIST
      ?auto_2537379 - PLACE
      ?auto_2537375 - PLACE
      ?auto_2537378 - HOIST
      ?auto_2537376 - SURFACE
      ?auto_2537377 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2537374 ?auto_2537379 ) ( IS-CRATE ?auto_2537373 ) ( not ( = ?auto_2537372 ?auto_2537373 ) ) ( not ( = ?auto_2537371 ?auto_2537372 ) ) ( not ( = ?auto_2537371 ?auto_2537373 ) ) ( not ( = ?auto_2537375 ?auto_2537379 ) ) ( HOIST-AT ?auto_2537378 ?auto_2537375 ) ( not ( = ?auto_2537374 ?auto_2537378 ) ) ( AVAILABLE ?auto_2537378 ) ( SURFACE-AT ?auto_2537373 ?auto_2537375 ) ( ON ?auto_2537373 ?auto_2537376 ) ( CLEAR ?auto_2537373 ) ( not ( = ?auto_2537372 ?auto_2537376 ) ) ( not ( = ?auto_2537373 ?auto_2537376 ) ) ( not ( = ?auto_2537371 ?auto_2537376 ) ) ( TRUCK-AT ?auto_2537377 ?auto_2537379 ) ( SURFACE-AT ?auto_2537371 ?auto_2537379 ) ( CLEAR ?auto_2537371 ) ( IS-CRATE ?auto_2537372 ) ( AVAILABLE ?auto_2537374 ) ( IN ?auto_2537372 ?auto_2537377 ) ( ON ?auto_2537365 ?auto_2537364 ) ( ON ?auto_2537366 ?auto_2537365 ) ( ON ?auto_2537368 ?auto_2537366 ) ( ON ?auto_2537367 ?auto_2537368 ) ( ON ?auto_2537369 ?auto_2537367 ) ( ON ?auto_2537370 ?auto_2537369 ) ( ON ?auto_2537371 ?auto_2537370 ) ( not ( = ?auto_2537364 ?auto_2537365 ) ) ( not ( = ?auto_2537364 ?auto_2537366 ) ) ( not ( = ?auto_2537364 ?auto_2537368 ) ) ( not ( = ?auto_2537364 ?auto_2537367 ) ) ( not ( = ?auto_2537364 ?auto_2537369 ) ) ( not ( = ?auto_2537364 ?auto_2537370 ) ) ( not ( = ?auto_2537364 ?auto_2537371 ) ) ( not ( = ?auto_2537364 ?auto_2537372 ) ) ( not ( = ?auto_2537364 ?auto_2537373 ) ) ( not ( = ?auto_2537364 ?auto_2537376 ) ) ( not ( = ?auto_2537365 ?auto_2537366 ) ) ( not ( = ?auto_2537365 ?auto_2537368 ) ) ( not ( = ?auto_2537365 ?auto_2537367 ) ) ( not ( = ?auto_2537365 ?auto_2537369 ) ) ( not ( = ?auto_2537365 ?auto_2537370 ) ) ( not ( = ?auto_2537365 ?auto_2537371 ) ) ( not ( = ?auto_2537365 ?auto_2537372 ) ) ( not ( = ?auto_2537365 ?auto_2537373 ) ) ( not ( = ?auto_2537365 ?auto_2537376 ) ) ( not ( = ?auto_2537366 ?auto_2537368 ) ) ( not ( = ?auto_2537366 ?auto_2537367 ) ) ( not ( = ?auto_2537366 ?auto_2537369 ) ) ( not ( = ?auto_2537366 ?auto_2537370 ) ) ( not ( = ?auto_2537366 ?auto_2537371 ) ) ( not ( = ?auto_2537366 ?auto_2537372 ) ) ( not ( = ?auto_2537366 ?auto_2537373 ) ) ( not ( = ?auto_2537366 ?auto_2537376 ) ) ( not ( = ?auto_2537368 ?auto_2537367 ) ) ( not ( = ?auto_2537368 ?auto_2537369 ) ) ( not ( = ?auto_2537368 ?auto_2537370 ) ) ( not ( = ?auto_2537368 ?auto_2537371 ) ) ( not ( = ?auto_2537368 ?auto_2537372 ) ) ( not ( = ?auto_2537368 ?auto_2537373 ) ) ( not ( = ?auto_2537368 ?auto_2537376 ) ) ( not ( = ?auto_2537367 ?auto_2537369 ) ) ( not ( = ?auto_2537367 ?auto_2537370 ) ) ( not ( = ?auto_2537367 ?auto_2537371 ) ) ( not ( = ?auto_2537367 ?auto_2537372 ) ) ( not ( = ?auto_2537367 ?auto_2537373 ) ) ( not ( = ?auto_2537367 ?auto_2537376 ) ) ( not ( = ?auto_2537369 ?auto_2537370 ) ) ( not ( = ?auto_2537369 ?auto_2537371 ) ) ( not ( = ?auto_2537369 ?auto_2537372 ) ) ( not ( = ?auto_2537369 ?auto_2537373 ) ) ( not ( = ?auto_2537369 ?auto_2537376 ) ) ( not ( = ?auto_2537370 ?auto_2537371 ) ) ( not ( = ?auto_2537370 ?auto_2537372 ) ) ( not ( = ?auto_2537370 ?auto_2537373 ) ) ( not ( = ?auto_2537370 ?auto_2537376 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2537371 ?auto_2537372 ?auto_2537373 )
      ( MAKE-9CRATE-VERIFY ?auto_2537364 ?auto_2537365 ?auto_2537366 ?auto_2537368 ?auto_2537367 ?auto_2537369 ?auto_2537370 ?auto_2537371 ?auto_2537372 ?auto_2537373 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2541710 - SURFACE
      ?auto_2541711 - SURFACE
    )
    :vars
    (
      ?auto_2541712 - HOIST
      ?auto_2541716 - PLACE
      ?auto_2541714 - SURFACE
      ?auto_2541715 - PLACE
      ?auto_2541713 - HOIST
      ?auto_2541718 - SURFACE
      ?auto_2541717 - TRUCK
      ?auto_2541719 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2541712 ?auto_2541716 ) ( SURFACE-AT ?auto_2541710 ?auto_2541716 ) ( CLEAR ?auto_2541710 ) ( IS-CRATE ?auto_2541711 ) ( not ( = ?auto_2541710 ?auto_2541711 ) ) ( ON ?auto_2541710 ?auto_2541714 ) ( not ( = ?auto_2541714 ?auto_2541710 ) ) ( not ( = ?auto_2541714 ?auto_2541711 ) ) ( not ( = ?auto_2541715 ?auto_2541716 ) ) ( HOIST-AT ?auto_2541713 ?auto_2541715 ) ( not ( = ?auto_2541712 ?auto_2541713 ) ) ( AVAILABLE ?auto_2541713 ) ( SURFACE-AT ?auto_2541711 ?auto_2541715 ) ( ON ?auto_2541711 ?auto_2541718 ) ( CLEAR ?auto_2541711 ) ( not ( = ?auto_2541710 ?auto_2541718 ) ) ( not ( = ?auto_2541711 ?auto_2541718 ) ) ( not ( = ?auto_2541714 ?auto_2541718 ) ) ( TRUCK-AT ?auto_2541717 ?auto_2541716 ) ( LIFTING ?auto_2541712 ?auto_2541719 ) ( IS-CRATE ?auto_2541719 ) ( not ( = ?auto_2541710 ?auto_2541719 ) ) ( not ( = ?auto_2541711 ?auto_2541719 ) ) ( not ( = ?auto_2541714 ?auto_2541719 ) ) ( not ( = ?auto_2541718 ?auto_2541719 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2541712 ?auto_2541719 ?auto_2541717 ?auto_2541716 )
      ( MAKE-1CRATE ?auto_2541710 ?auto_2541711 )
      ( MAKE-1CRATE-VERIFY ?auto_2541710 ?auto_2541711 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2542906 - SURFACE
      ?auto_2542907 - SURFACE
      ?auto_2542908 - SURFACE
      ?auto_2542910 - SURFACE
      ?auto_2542909 - SURFACE
      ?auto_2542911 - SURFACE
      ?auto_2542912 - SURFACE
      ?auto_2542913 - SURFACE
      ?auto_2542914 - SURFACE
      ?auto_2542915 - SURFACE
      ?auto_2542916 - SURFACE
    )
    :vars
    (
      ?auto_2542918 - HOIST
      ?auto_2542917 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2542918 ?auto_2542917 ) ( SURFACE-AT ?auto_2542915 ?auto_2542917 ) ( CLEAR ?auto_2542915 ) ( LIFTING ?auto_2542918 ?auto_2542916 ) ( IS-CRATE ?auto_2542916 ) ( not ( = ?auto_2542915 ?auto_2542916 ) ) ( ON ?auto_2542907 ?auto_2542906 ) ( ON ?auto_2542908 ?auto_2542907 ) ( ON ?auto_2542910 ?auto_2542908 ) ( ON ?auto_2542909 ?auto_2542910 ) ( ON ?auto_2542911 ?auto_2542909 ) ( ON ?auto_2542912 ?auto_2542911 ) ( ON ?auto_2542913 ?auto_2542912 ) ( ON ?auto_2542914 ?auto_2542913 ) ( ON ?auto_2542915 ?auto_2542914 ) ( not ( = ?auto_2542906 ?auto_2542907 ) ) ( not ( = ?auto_2542906 ?auto_2542908 ) ) ( not ( = ?auto_2542906 ?auto_2542910 ) ) ( not ( = ?auto_2542906 ?auto_2542909 ) ) ( not ( = ?auto_2542906 ?auto_2542911 ) ) ( not ( = ?auto_2542906 ?auto_2542912 ) ) ( not ( = ?auto_2542906 ?auto_2542913 ) ) ( not ( = ?auto_2542906 ?auto_2542914 ) ) ( not ( = ?auto_2542906 ?auto_2542915 ) ) ( not ( = ?auto_2542906 ?auto_2542916 ) ) ( not ( = ?auto_2542907 ?auto_2542908 ) ) ( not ( = ?auto_2542907 ?auto_2542910 ) ) ( not ( = ?auto_2542907 ?auto_2542909 ) ) ( not ( = ?auto_2542907 ?auto_2542911 ) ) ( not ( = ?auto_2542907 ?auto_2542912 ) ) ( not ( = ?auto_2542907 ?auto_2542913 ) ) ( not ( = ?auto_2542907 ?auto_2542914 ) ) ( not ( = ?auto_2542907 ?auto_2542915 ) ) ( not ( = ?auto_2542907 ?auto_2542916 ) ) ( not ( = ?auto_2542908 ?auto_2542910 ) ) ( not ( = ?auto_2542908 ?auto_2542909 ) ) ( not ( = ?auto_2542908 ?auto_2542911 ) ) ( not ( = ?auto_2542908 ?auto_2542912 ) ) ( not ( = ?auto_2542908 ?auto_2542913 ) ) ( not ( = ?auto_2542908 ?auto_2542914 ) ) ( not ( = ?auto_2542908 ?auto_2542915 ) ) ( not ( = ?auto_2542908 ?auto_2542916 ) ) ( not ( = ?auto_2542910 ?auto_2542909 ) ) ( not ( = ?auto_2542910 ?auto_2542911 ) ) ( not ( = ?auto_2542910 ?auto_2542912 ) ) ( not ( = ?auto_2542910 ?auto_2542913 ) ) ( not ( = ?auto_2542910 ?auto_2542914 ) ) ( not ( = ?auto_2542910 ?auto_2542915 ) ) ( not ( = ?auto_2542910 ?auto_2542916 ) ) ( not ( = ?auto_2542909 ?auto_2542911 ) ) ( not ( = ?auto_2542909 ?auto_2542912 ) ) ( not ( = ?auto_2542909 ?auto_2542913 ) ) ( not ( = ?auto_2542909 ?auto_2542914 ) ) ( not ( = ?auto_2542909 ?auto_2542915 ) ) ( not ( = ?auto_2542909 ?auto_2542916 ) ) ( not ( = ?auto_2542911 ?auto_2542912 ) ) ( not ( = ?auto_2542911 ?auto_2542913 ) ) ( not ( = ?auto_2542911 ?auto_2542914 ) ) ( not ( = ?auto_2542911 ?auto_2542915 ) ) ( not ( = ?auto_2542911 ?auto_2542916 ) ) ( not ( = ?auto_2542912 ?auto_2542913 ) ) ( not ( = ?auto_2542912 ?auto_2542914 ) ) ( not ( = ?auto_2542912 ?auto_2542915 ) ) ( not ( = ?auto_2542912 ?auto_2542916 ) ) ( not ( = ?auto_2542913 ?auto_2542914 ) ) ( not ( = ?auto_2542913 ?auto_2542915 ) ) ( not ( = ?auto_2542913 ?auto_2542916 ) ) ( not ( = ?auto_2542914 ?auto_2542915 ) ) ( not ( = ?auto_2542914 ?auto_2542916 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2542915 ?auto_2542916 )
      ( MAKE-10CRATE-VERIFY ?auto_2542906 ?auto_2542907 ?auto_2542908 ?auto_2542910 ?auto_2542909 ?auto_2542911 ?auto_2542912 ?auto_2542913 ?auto_2542914 ?auto_2542915 ?auto_2542916 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2543000 - SURFACE
      ?auto_2543001 - SURFACE
      ?auto_2543002 - SURFACE
      ?auto_2543004 - SURFACE
      ?auto_2543003 - SURFACE
      ?auto_2543005 - SURFACE
      ?auto_2543006 - SURFACE
      ?auto_2543007 - SURFACE
      ?auto_2543008 - SURFACE
      ?auto_2543009 - SURFACE
      ?auto_2543010 - SURFACE
    )
    :vars
    (
      ?auto_2543012 - HOIST
      ?auto_2543013 - PLACE
      ?auto_2543011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2543012 ?auto_2543013 ) ( SURFACE-AT ?auto_2543009 ?auto_2543013 ) ( CLEAR ?auto_2543009 ) ( IS-CRATE ?auto_2543010 ) ( not ( = ?auto_2543009 ?auto_2543010 ) ) ( TRUCK-AT ?auto_2543011 ?auto_2543013 ) ( AVAILABLE ?auto_2543012 ) ( IN ?auto_2543010 ?auto_2543011 ) ( ON ?auto_2543009 ?auto_2543008 ) ( not ( = ?auto_2543008 ?auto_2543009 ) ) ( not ( = ?auto_2543008 ?auto_2543010 ) ) ( ON ?auto_2543001 ?auto_2543000 ) ( ON ?auto_2543002 ?auto_2543001 ) ( ON ?auto_2543004 ?auto_2543002 ) ( ON ?auto_2543003 ?auto_2543004 ) ( ON ?auto_2543005 ?auto_2543003 ) ( ON ?auto_2543006 ?auto_2543005 ) ( ON ?auto_2543007 ?auto_2543006 ) ( ON ?auto_2543008 ?auto_2543007 ) ( not ( = ?auto_2543000 ?auto_2543001 ) ) ( not ( = ?auto_2543000 ?auto_2543002 ) ) ( not ( = ?auto_2543000 ?auto_2543004 ) ) ( not ( = ?auto_2543000 ?auto_2543003 ) ) ( not ( = ?auto_2543000 ?auto_2543005 ) ) ( not ( = ?auto_2543000 ?auto_2543006 ) ) ( not ( = ?auto_2543000 ?auto_2543007 ) ) ( not ( = ?auto_2543000 ?auto_2543008 ) ) ( not ( = ?auto_2543000 ?auto_2543009 ) ) ( not ( = ?auto_2543000 ?auto_2543010 ) ) ( not ( = ?auto_2543001 ?auto_2543002 ) ) ( not ( = ?auto_2543001 ?auto_2543004 ) ) ( not ( = ?auto_2543001 ?auto_2543003 ) ) ( not ( = ?auto_2543001 ?auto_2543005 ) ) ( not ( = ?auto_2543001 ?auto_2543006 ) ) ( not ( = ?auto_2543001 ?auto_2543007 ) ) ( not ( = ?auto_2543001 ?auto_2543008 ) ) ( not ( = ?auto_2543001 ?auto_2543009 ) ) ( not ( = ?auto_2543001 ?auto_2543010 ) ) ( not ( = ?auto_2543002 ?auto_2543004 ) ) ( not ( = ?auto_2543002 ?auto_2543003 ) ) ( not ( = ?auto_2543002 ?auto_2543005 ) ) ( not ( = ?auto_2543002 ?auto_2543006 ) ) ( not ( = ?auto_2543002 ?auto_2543007 ) ) ( not ( = ?auto_2543002 ?auto_2543008 ) ) ( not ( = ?auto_2543002 ?auto_2543009 ) ) ( not ( = ?auto_2543002 ?auto_2543010 ) ) ( not ( = ?auto_2543004 ?auto_2543003 ) ) ( not ( = ?auto_2543004 ?auto_2543005 ) ) ( not ( = ?auto_2543004 ?auto_2543006 ) ) ( not ( = ?auto_2543004 ?auto_2543007 ) ) ( not ( = ?auto_2543004 ?auto_2543008 ) ) ( not ( = ?auto_2543004 ?auto_2543009 ) ) ( not ( = ?auto_2543004 ?auto_2543010 ) ) ( not ( = ?auto_2543003 ?auto_2543005 ) ) ( not ( = ?auto_2543003 ?auto_2543006 ) ) ( not ( = ?auto_2543003 ?auto_2543007 ) ) ( not ( = ?auto_2543003 ?auto_2543008 ) ) ( not ( = ?auto_2543003 ?auto_2543009 ) ) ( not ( = ?auto_2543003 ?auto_2543010 ) ) ( not ( = ?auto_2543005 ?auto_2543006 ) ) ( not ( = ?auto_2543005 ?auto_2543007 ) ) ( not ( = ?auto_2543005 ?auto_2543008 ) ) ( not ( = ?auto_2543005 ?auto_2543009 ) ) ( not ( = ?auto_2543005 ?auto_2543010 ) ) ( not ( = ?auto_2543006 ?auto_2543007 ) ) ( not ( = ?auto_2543006 ?auto_2543008 ) ) ( not ( = ?auto_2543006 ?auto_2543009 ) ) ( not ( = ?auto_2543006 ?auto_2543010 ) ) ( not ( = ?auto_2543007 ?auto_2543008 ) ) ( not ( = ?auto_2543007 ?auto_2543009 ) ) ( not ( = ?auto_2543007 ?auto_2543010 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2543008 ?auto_2543009 ?auto_2543010 )
      ( MAKE-10CRATE-VERIFY ?auto_2543000 ?auto_2543001 ?auto_2543002 ?auto_2543004 ?auto_2543003 ?auto_2543005 ?auto_2543006 ?auto_2543007 ?auto_2543008 ?auto_2543009 ?auto_2543010 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2543105 - SURFACE
      ?auto_2543106 - SURFACE
      ?auto_2543107 - SURFACE
      ?auto_2543109 - SURFACE
      ?auto_2543108 - SURFACE
      ?auto_2543110 - SURFACE
      ?auto_2543111 - SURFACE
      ?auto_2543112 - SURFACE
      ?auto_2543113 - SURFACE
      ?auto_2543114 - SURFACE
      ?auto_2543115 - SURFACE
    )
    :vars
    (
      ?auto_2543119 - HOIST
      ?auto_2543118 - PLACE
      ?auto_2543116 - TRUCK
      ?auto_2543117 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2543119 ?auto_2543118 ) ( SURFACE-AT ?auto_2543114 ?auto_2543118 ) ( CLEAR ?auto_2543114 ) ( IS-CRATE ?auto_2543115 ) ( not ( = ?auto_2543114 ?auto_2543115 ) ) ( AVAILABLE ?auto_2543119 ) ( IN ?auto_2543115 ?auto_2543116 ) ( ON ?auto_2543114 ?auto_2543113 ) ( not ( = ?auto_2543113 ?auto_2543114 ) ) ( not ( = ?auto_2543113 ?auto_2543115 ) ) ( TRUCK-AT ?auto_2543116 ?auto_2543117 ) ( not ( = ?auto_2543117 ?auto_2543118 ) ) ( ON ?auto_2543106 ?auto_2543105 ) ( ON ?auto_2543107 ?auto_2543106 ) ( ON ?auto_2543109 ?auto_2543107 ) ( ON ?auto_2543108 ?auto_2543109 ) ( ON ?auto_2543110 ?auto_2543108 ) ( ON ?auto_2543111 ?auto_2543110 ) ( ON ?auto_2543112 ?auto_2543111 ) ( ON ?auto_2543113 ?auto_2543112 ) ( not ( = ?auto_2543105 ?auto_2543106 ) ) ( not ( = ?auto_2543105 ?auto_2543107 ) ) ( not ( = ?auto_2543105 ?auto_2543109 ) ) ( not ( = ?auto_2543105 ?auto_2543108 ) ) ( not ( = ?auto_2543105 ?auto_2543110 ) ) ( not ( = ?auto_2543105 ?auto_2543111 ) ) ( not ( = ?auto_2543105 ?auto_2543112 ) ) ( not ( = ?auto_2543105 ?auto_2543113 ) ) ( not ( = ?auto_2543105 ?auto_2543114 ) ) ( not ( = ?auto_2543105 ?auto_2543115 ) ) ( not ( = ?auto_2543106 ?auto_2543107 ) ) ( not ( = ?auto_2543106 ?auto_2543109 ) ) ( not ( = ?auto_2543106 ?auto_2543108 ) ) ( not ( = ?auto_2543106 ?auto_2543110 ) ) ( not ( = ?auto_2543106 ?auto_2543111 ) ) ( not ( = ?auto_2543106 ?auto_2543112 ) ) ( not ( = ?auto_2543106 ?auto_2543113 ) ) ( not ( = ?auto_2543106 ?auto_2543114 ) ) ( not ( = ?auto_2543106 ?auto_2543115 ) ) ( not ( = ?auto_2543107 ?auto_2543109 ) ) ( not ( = ?auto_2543107 ?auto_2543108 ) ) ( not ( = ?auto_2543107 ?auto_2543110 ) ) ( not ( = ?auto_2543107 ?auto_2543111 ) ) ( not ( = ?auto_2543107 ?auto_2543112 ) ) ( not ( = ?auto_2543107 ?auto_2543113 ) ) ( not ( = ?auto_2543107 ?auto_2543114 ) ) ( not ( = ?auto_2543107 ?auto_2543115 ) ) ( not ( = ?auto_2543109 ?auto_2543108 ) ) ( not ( = ?auto_2543109 ?auto_2543110 ) ) ( not ( = ?auto_2543109 ?auto_2543111 ) ) ( not ( = ?auto_2543109 ?auto_2543112 ) ) ( not ( = ?auto_2543109 ?auto_2543113 ) ) ( not ( = ?auto_2543109 ?auto_2543114 ) ) ( not ( = ?auto_2543109 ?auto_2543115 ) ) ( not ( = ?auto_2543108 ?auto_2543110 ) ) ( not ( = ?auto_2543108 ?auto_2543111 ) ) ( not ( = ?auto_2543108 ?auto_2543112 ) ) ( not ( = ?auto_2543108 ?auto_2543113 ) ) ( not ( = ?auto_2543108 ?auto_2543114 ) ) ( not ( = ?auto_2543108 ?auto_2543115 ) ) ( not ( = ?auto_2543110 ?auto_2543111 ) ) ( not ( = ?auto_2543110 ?auto_2543112 ) ) ( not ( = ?auto_2543110 ?auto_2543113 ) ) ( not ( = ?auto_2543110 ?auto_2543114 ) ) ( not ( = ?auto_2543110 ?auto_2543115 ) ) ( not ( = ?auto_2543111 ?auto_2543112 ) ) ( not ( = ?auto_2543111 ?auto_2543113 ) ) ( not ( = ?auto_2543111 ?auto_2543114 ) ) ( not ( = ?auto_2543111 ?auto_2543115 ) ) ( not ( = ?auto_2543112 ?auto_2543113 ) ) ( not ( = ?auto_2543112 ?auto_2543114 ) ) ( not ( = ?auto_2543112 ?auto_2543115 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2543113 ?auto_2543114 ?auto_2543115 )
      ( MAKE-10CRATE-VERIFY ?auto_2543105 ?auto_2543106 ?auto_2543107 ?auto_2543109 ?auto_2543108 ?auto_2543110 ?auto_2543111 ?auto_2543112 ?auto_2543113 ?auto_2543114 ?auto_2543115 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2543220 - SURFACE
      ?auto_2543221 - SURFACE
      ?auto_2543222 - SURFACE
      ?auto_2543224 - SURFACE
      ?auto_2543223 - SURFACE
      ?auto_2543225 - SURFACE
      ?auto_2543226 - SURFACE
      ?auto_2543227 - SURFACE
      ?auto_2543228 - SURFACE
      ?auto_2543229 - SURFACE
      ?auto_2543230 - SURFACE
    )
    :vars
    (
      ?auto_2543233 - HOIST
      ?auto_2543231 - PLACE
      ?auto_2543232 - TRUCK
      ?auto_2543235 - PLACE
      ?auto_2543234 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2543233 ?auto_2543231 ) ( SURFACE-AT ?auto_2543229 ?auto_2543231 ) ( CLEAR ?auto_2543229 ) ( IS-CRATE ?auto_2543230 ) ( not ( = ?auto_2543229 ?auto_2543230 ) ) ( AVAILABLE ?auto_2543233 ) ( ON ?auto_2543229 ?auto_2543228 ) ( not ( = ?auto_2543228 ?auto_2543229 ) ) ( not ( = ?auto_2543228 ?auto_2543230 ) ) ( TRUCK-AT ?auto_2543232 ?auto_2543235 ) ( not ( = ?auto_2543235 ?auto_2543231 ) ) ( HOIST-AT ?auto_2543234 ?auto_2543235 ) ( LIFTING ?auto_2543234 ?auto_2543230 ) ( not ( = ?auto_2543233 ?auto_2543234 ) ) ( ON ?auto_2543221 ?auto_2543220 ) ( ON ?auto_2543222 ?auto_2543221 ) ( ON ?auto_2543224 ?auto_2543222 ) ( ON ?auto_2543223 ?auto_2543224 ) ( ON ?auto_2543225 ?auto_2543223 ) ( ON ?auto_2543226 ?auto_2543225 ) ( ON ?auto_2543227 ?auto_2543226 ) ( ON ?auto_2543228 ?auto_2543227 ) ( not ( = ?auto_2543220 ?auto_2543221 ) ) ( not ( = ?auto_2543220 ?auto_2543222 ) ) ( not ( = ?auto_2543220 ?auto_2543224 ) ) ( not ( = ?auto_2543220 ?auto_2543223 ) ) ( not ( = ?auto_2543220 ?auto_2543225 ) ) ( not ( = ?auto_2543220 ?auto_2543226 ) ) ( not ( = ?auto_2543220 ?auto_2543227 ) ) ( not ( = ?auto_2543220 ?auto_2543228 ) ) ( not ( = ?auto_2543220 ?auto_2543229 ) ) ( not ( = ?auto_2543220 ?auto_2543230 ) ) ( not ( = ?auto_2543221 ?auto_2543222 ) ) ( not ( = ?auto_2543221 ?auto_2543224 ) ) ( not ( = ?auto_2543221 ?auto_2543223 ) ) ( not ( = ?auto_2543221 ?auto_2543225 ) ) ( not ( = ?auto_2543221 ?auto_2543226 ) ) ( not ( = ?auto_2543221 ?auto_2543227 ) ) ( not ( = ?auto_2543221 ?auto_2543228 ) ) ( not ( = ?auto_2543221 ?auto_2543229 ) ) ( not ( = ?auto_2543221 ?auto_2543230 ) ) ( not ( = ?auto_2543222 ?auto_2543224 ) ) ( not ( = ?auto_2543222 ?auto_2543223 ) ) ( not ( = ?auto_2543222 ?auto_2543225 ) ) ( not ( = ?auto_2543222 ?auto_2543226 ) ) ( not ( = ?auto_2543222 ?auto_2543227 ) ) ( not ( = ?auto_2543222 ?auto_2543228 ) ) ( not ( = ?auto_2543222 ?auto_2543229 ) ) ( not ( = ?auto_2543222 ?auto_2543230 ) ) ( not ( = ?auto_2543224 ?auto_2543223 ) ) ( not ( = ?auto_2543224 ?auto_2543225 ) ) ( not ( = ?auto_2543224 ?auto_2543226 ) ) ( not ( = ?auto_2543224 ?auto_2543227 ) ) ( not ( = ?auto_2543224 ?auto_2543228 ) ) ( not ( = ?auto_2543224 ?auto_2543229 ) ) ( not ( = ?auto_2543224 ?auto_2543230 ) ) ( not ( = ?auto_2543223 ?auto_2543225 ) ) ( not ( = ?auto_2543223 ?auto_2543226 ) ) ( not ( = ?auto_2543223 ?auto_2543227 ) ) ( not ( = ?auto_2543223 ?auto_2543228 ) ) ( not ( = ?auto_2543223 ?auto_2543229 ) ) ( not ( = ?auto_2543223 ?auto_2543230 ) ) ( not ( = ?auto_2543225 ?auto_2543226 ) ) ( not ( = ?auto_2543225 ?auto_2543227 ) ) ( not ( = ?auto_2543225 ?auto_2543228 ) ) ( not ( = ?auto_2543225 ?auto_2543229 ) ) ( not ( = ?auto_2543225 ?auto_2543230 ) ) ( not ( = ?auto_2543226 ?auto_2543227 ) ) ( not ( = ?auto_2543226 ?auto_2543228 ) ) ( not ( = ?auto_2543226 ?auto_2543229 ) ) ( not ( = ?auto_2543226 ?auto_2543230 ) ) ( not ( = ?auto_2543227 ?auto_2543228 ) ) ( not ( = ?auto_2543227 ?auto_2543229 ) ) ( not ( = ?auto_2543227 ?auto_2543230 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2543228 ?auto_2543229 ?auto_2543230 )
      ( MAKE-10CRATE-VERIFY ?auto_2543220 ?auto_2543221 ?auto_2543222 ?auto_2543224 ?auto_2543223 ?auto_2543225 ?auto_2543226 ?auto_2543227 ?auto_2543228 ?auto_2543229 ?auto_2543230 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2543345 - SURFACE
      ?auto_2543346 - SURFACE
      ?auto_2543347 - SURFACE
      ?auto_2543349 - SURFACE
      ?auto_2543348 - SURFACE
      ?auto_2543350 - SURFACE
      ?auto_2543351 - SURFACE
      ?auto_2543352 - SURFACE
      ?auto_2543353 - SURFACE
      ?auto_2543354 - SURFACE
      ?auto_2543355 - SURFACE
    )
    :vars
    (
      ?auto_2543358 - HOIST
      ?auto_2543360 - PLACE
      ?auto_2543361 - TRUCK
      ?auto_2543359 - PLACE
      ?auto_2543356 - HOIST
      ?auto_2543357 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2543358 ?auto_2543360 ) ( SURFACE-AT ?auto_2543354 ?auto_2543360 ) ( CLEAR ?auto_2543354 ) ( IS-CRATE ?auto_2543355 ) ( not ( = ?auto_2543354 ?auto_2543355 ) ) ( AVAILABLE ?auto_2543358 ) ( ON ?auto_2543354 ?auto_2543353 ) ( not ( = ?auto_2543353 ?auto_2543354 ) ) ( not ( = ?auto_2543353 ?auto_2543355 ) ) ( TRUCK-AT ?auto_2543361 ?auto_2543359 ) ( not ( = ?auto_2543359 ?auto_2543360 ) ) ( HOIST-AT ?auto_2543356 ?auto_2543359 ) ( not ( = ?auto_2543358 ?auto_2543356 ) ) ( AVAILABLE ?auto_2543356 ) ( SURFACE-AT ?auto_2543355 ?auto_2543359 ) ( ON ?auto_2543355 ?auto_2543357 ) ( CLEAR ?auto_2543355 ) ( not ( = ?auto_2543354 ?auto_2543357 ) ) ( not ( = ?auto_2543355 ?auto_2543357 ) ) ( not ( = ?auto_2543353 ?auto_2543357 ) ) ( ON ?auto_2543346 ?auto_2543345 ) ( ON ?auto_2543347 ?auto_2543346 ) ( ON ?auto_2543349 ?auto_2543347 ) ( ON ?auto_2543348 ?auto_2543349 ) ( ON ?auto_2543350 ?auto_2543348 ) ( ON ?auto_2543351 ?auto_2543350 ) ( ON ?auto_2543352 ?auto_2543351 ) ( ON ?auto_2543353 ?auto_2543352 ) ( not ( = ?auto_2543345 ?auto_2543346 ) ) ( not ( = ?auto_2543345 ?auto_2543347 ) ) ( not ( = ?auto_2543345 ?auto_2543349 ) ) ( not ( = ?auto_2543345 ?auto_2543348 ) ) ( not ( = ?auto_2543345 ?auto_2543350 ) ) ( not ( = ?auto_2543345 ?auto_2543351 ) ) ( not ( = ?auto_2543345 ?auto_2543352 ) ) ( not ( = ?auto_2543345 ?auto_2543353 ) ) ( not ( = ?auto_2543345 ?auto_2543354 ) ) ( not ( = ?auto_2543345 ?auto_2543355 ) ) ( not ( = ?auto_2543345 ?auto_2543357 ) ) ( not ( = ?auto_2543346 ?auto_2543347 ) ) ( not ( = ?auto_2543346 ?auto_2543349 ) ) ( not ( = ?auto_2543346 ?auto_2543348 ) ) ( not ( = ?auto_2543346 ?auto_2543350 ) ) ( not ( = ?auto_2543346 ?auto_2543351 ) ) ( not ( = ?auto_2543346 ?auto_2543352 ) ) ( not ( = ?auto_2543346 ?auto_2543353 ) ) ( not ( = ?auto_2543346 ?auto_2543354 ) ) ( not ( = ?auto_2543346 ?auto_2543355 ) ) ( not ( = ?auto_2543346 ?auto_2543357 ) ) ( not ( = ?auto_2543347 ?auto_2543349 ) ) ( not ( = ?auto_2543347 ?auto_2543348 ) ) ( not ( = ?auto_2543347 ?auto_2543350 ) ) ( not ( = ?auto_2543347 ?auto_2543351 ) ) ( not ( = ?auto_2543347 ?auto_2543352 ) ) ( not ( = ?auto_2543347 ?auto_2543353 ) ) ( not ( = ?auto_2543347 ?auto_2543354 ) ) ( not ( = ?auto_2543347 ?auto_2543355 ) ) ( not ( = ?auto_2543347 ?auto_2543357 ) ) ( not ( = ?auto_2543349 ?auto_2543348 ) ) ( not ( = ?auto_2543349 ?auto_2543350 ) ) ( not ( = ?auto_2543349 ?auto_2543351 ) ) ( not ( = ?auto_2543349 ?auto_2543352 ) ) ( not ( = ?auto_2543349 ?auto_2543353 ) ) ( not ( = ?auto_2543349 ?auto_2543354 ) ) ( not ( = ?auto_2543349 ?auto_2543355 ) ) ( not ( = ?auto_2543349 ?auto_2543357 ) ) ( not ( = ?auto_2543348 ?auto_2543350 ) ) ( not ( = ?auto_2543348 ?auto_2543351 ) ) ( not ( = ?auto_2543348 ?auto_2543352 ) ) ( not ( = ?auto_2543348 ?auto_2543353 ) ) ( not ( = ?auto_2543348 ?auto_2543354 ) ) ( not ( = ?auto_2543348 ?auto_2543355 ) ) ( not ( = ?auto_2543348 ?auto_2543357 ) ) ( not ( = ?auto_2543350 ?auto_2543351 ) ) ( not ( = ?auto_2543350 ?auto_2543352 ) ) ( not ( = ?auto_2543350 ?auto_2543353 ) ) ( not ( = ?auto_2543350 ?auto_2543354 ) ) ( not ( = ?auto_2543350 ?auto_2543355 ) ) ( not ( = ?auto_2543350 ?auto_2543357 ) ) ( not ( = ?auto_2543351 ?auto_2543352 ) ) ( not ( = ?auto_2543351 ?auto_2543353 ) ) ( not ( = ?auto_2543351 ?auto_2543354 ) ) ( not ( = ?auto_2543351 ?auto_2543355 ) ) ( not ( = ?auto_2543351 ?auto_2543357 ) ) ( not ( = ?auto_2543352 ?auto_2543353 ) ) ( not ( = ?auto_2543352 ?auto_2543354 ) ) ( not ( = ?auto_2543352 ?auto_2543355 ) ) ( not ( = ?auto_2543352 ?auto_2543357 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2543353 ?auto_2543354 ?auto_2543355 )
      ( MAKE-10CRATE-VERIFY ?auto_2543345 ?auto_2543346 ?auto_2543347 ?auto_2543349 ?auto_2543348 ?auto_2543350 ?auto_2543351 ?auto_2543352 ?auto_2543353 ?auto_2543354 ?auto_2543355 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2543471 - SURFACE
      ?auto_2543472 - SURFACE
      ?auto_2543473 - SURFACE
      ?auto_2543475 - SURFACE
      ?auto_2543474 - SURFACE
      ?auto_2543476 - SURFACE
      ?auto_2543477 - SURFACE
      ?auto_2543478 - SURFACE
      ?auto_2543479 - SURFACE
      ?auto_2543480 - SURFACE
      ?auto_2543481 - SURFACE
    )
    :vars
    (
      ?auto_2543483 - HOIST
      ?auto_2543487 - PLACE
      ?auto_2543482 - PLACE
      ?auto_2543484 - HOIST
      ?auto_2543485 - SURFACE
      ?auto_2543486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2543483 ?auto_2543487 ) ( SURFACE-AT ?auto_2543480 ?auto_2543487 ) ( CLEAR ?auto_2543480 ) ( IS-CRATE ?auto_2543481 ) ( not ( = ?auto_2543480 ?auto_2543481 ) ) ( AVAILABLE ?auto_2543483 ) ( ON ?auto_2543480 ?auto_2543479 ) ( not ( = ?auto_2543479 ?auto_2543480 ) ) ( not ( = ?auto_2543479 ?auto_2543481 ) ) ( not ( = ?auto_2543482 ?auto_2543487 ) ) ( HOIST-AT ?auto_2543484 ?auto_2543482 ) ( not ( = ?auto_2543483 ?auto_2543484 ) ) ( AVAILABLE ?auto_2543484 ) ( SURFACE-AT ?auto_2543481 ?auto_2543482 ) ( ON ?auto_2543481 ?auto_2543485 ) ( CLEAR ?auto_2543481 ) ( not ( = ?auto_2543480 ?auto_2543485 ) ) ( not ( = ?auto_2543481 ?auto_2543485 ) ) ( not ( = ?auto_2543479 ?auto_2543485 ) ) ( TRUCK-AT ?auto_2543486 ?auto_2543487 ) ( ON ?auto_2543472 ?auto_2543471 ) ( ON ?auto_2543473 ?auto_2543472 ) ( ON ?auto_2543475 ?auto_2543473 ) ( ON ?auto_2543474 ?auto_2543475 ) ( ON ?auto_2543476 ?auto_2543474 ) ( ON ?auto_2543477 ?auto_2543476 ) ( ON ?auto_2543478 ?auto_2543477 ) ( ON ?auto_2543479 ?auto_2543478 ) ( not ( = ?auto_2543471 ?auto_2543472 ) ) ( not ( = ?auto_2543471 ?auto_2543473 ) ) ( not ( = ?auto_2543471 ?auto_2543475 ) ) ( not ( = ?auto_2543471 ?auto_2543474 ) ) ( not ( = ?auto_2543471 ?auto_2543476 ) ) ( not ( = ?auto_2543471 ?auto_2543477 ) ) ( not ( = ?auto_2543471 ?auto_2543478 ) ) ( not ( = ?auto_2543471 ?auto_2543479 ) ) ( not ( = ?auto_2543471 ?auto_2543480 ) ) ( not ( = ?auto_2543471 ?auto_2543481 ) ) ( not ( = ?auto_2543471 ?auto_2543485 ) ) ( not ( = ?auto_2543472 ?auto_2543473 ) ) ( not ( = ?auto_2543472 ?auto_2543475 ) ) ( not ( = ?auto_2543472 ?auto_2543474 ) ) ( not ( = ?auto_2543472 ?auto_2543476 ) ) ( not ( = ?auto_2543472 ?auto_2543477 ) ) ( not ( = ?auto_2543472 ?auto_2543478 ) ) ( not ( = ?auto_2543472 ?auto_2543479 ) ) ( not ( = ?auto_2543472 ?auto_2543480 ) ) ( not ( = ?auto_2543472 ?auto_2543481 ) ) ( not ( = ?auto_2543472 ?auto_2543485 ) ) ( not ( = ?auto_2543473 ?auto_2543475 ) ) ( not ( = ?auto_2543473 ?auto_2543474 ) ) ( not ( = ?auto_2543473 ?auto_2543476 ) ) ( not ( = ?auto_2543473 ?auto_2543477 ) ) ( not ( = ?auto_2543473 ?auto_2543478 ) ) ( not ( = ?auto_2543473 ?auto_2543479 ) ) ( not ( = ?auto_2543473 ?auto_2543480 ) ) ( not ( = ?auto_2543473 ?auto_2543481 ) ) ( not ( = ?auto_2543473 ?auto_2543485 ) ) ( not ( = ?auto_2543475 ?auto_2543474 ) ) ( not ( = ?auto_2543475 ?auto_2543476 ) ) ( not ( = ?auto_2543475 ?auto_2543477 ) ) ( not ( = ?auto_2543475 ?auto_2543478 ) ) ( not ( = ?auto_2543475 ?auto_2543479 ) ) ( not ( = ?auto_2543475 ?auto_2543480 ) ) ( not ( = ?auto_2543475 ?auto_2543481 ) ) ( not ( = ?auto_2543475 ?auto_2543485 ) ) ( not ( = ?auto_2543474 ?auto_2543476 ) ) ( not ( = ?auto_2543474 ?auto_2543477 ) ) ( not ( = ?auto_2543474 ?auto_2543478 ) ) ( not ( = ?auto_2543474 ?auto_2543479 ) ) ( not ( = ?auto_2543474 ?auto_2543480 ) ) ( not ( = ?auto_2543474 ?auto_2543481 ) ) ( not ( = ?auto_2543474 ?auto_2543485 ) ) ( not ( = ?auto_2543476 ?auto_2543477 ) ) ( not ( = ?auto_2543476 ?auto_2543478 ) ) ( not ( = ?auto_2543476 ?auto_2543479 ) ) ( not ( = ?auto_2543476 ?auto_2543480 ) ) ( not ( = ?auto_2543476 ?auto_2543481 ) ) ( not ( = ?auto_2543476 ?auto_2543485 ) ) ( not ( = ?auto_2543477 ?auto_2543478 ) ) ( not ( = ?auto_2543477 ?auto_2543479 ) ) ( not ( = ?auto_2543477 ?auto_2543480 ) ) ( not ( = ?auto_2543477 ?auto_2543481 ) ) ( not ( = ?auto_2543477 ?auto_2543485 ) ) ( not ( = ?auto_2543478 ?auto_2543479 ) ) ( not ( = ?auto_2543478 ?auto_2543480 ) ) ( not ( = ?auto_2543478 ?auto_2543481 ) ) ( not ( = ?auto_2543478 ?auto_2543485 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2543479 ?auto_2543480 ?auto_2543481 )
      ( MAKE-10CRATE-VERIFY ?auto_2543471 ?auto_2543472 ?auto_2543473 ?auto_2543475 ?auto_2543474 ?auto_2543476 ?auto_2543477 ?auto_2543478 ?auto_2543479 ?auto_2543480 ?auto_2543481 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2543597 - SURFACE
      ?auto_2543598 - SURFACE
      ?auto_2543599 - SURFACE
      ?auto_2543601 - SURFACE
      ?auto_2543600 - SURFACE
      ?auto_2543602 - SURFACE
      ?auto_2543603 - SURFACE
      ?auto_2543604 - SURFACE
      ?auto_2543605 - SURFACE
      ?auto_2543606 - SURFACE
      ?auto_2543607 - SURFACE
    )
    :vars
    (
      ?auto_2543610 - HOIST
      ?auto_2543611 - PLACE
      ?auto_2543613 - PLACE
      ?auto_2543608 - HOIST
      ?auto_2543609 - SURFACE
      ?auto_2543612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2543610 ?auto_2543611 ) ( IS-CRATE ?auto_2543607 ) ( not ( = ?auto_2543606 ?auto_2543607 ) ) ( not ( = ?auto_2543605 ?auto_2543606 ) ) ( not ( = ?auto_2543605 ?auto_2543607 ) ) ( not ( = ?auto_2543613 ?auto_2543611 ) ) ( HOIST-AT ?auto_2543608 ?auto_2543613 ) ( not ( = ?auto_2543610 ?auto_2543608 ) ) ( AVAILABLE ?auto_2543608 ) ( SURFACE-AT ?auto_2543607 ?auto_2543613 ) ( ON ?auto_2543607 ?auto_2543609 ) ( CLEAR ?auto_2543607 ) ( not ( = ?auto_2543606 ?auto_2543609 ) ) ( not ( = ?auto_2543607 ?auto_2543609 ) ) ( not ( = ?auto_2543605 ?auto_2543609 ) ) ( TRUCK-AT ?auto_2543612 ?auto_2543611 ) ( SURFACE-AT ?auto_2543605 ?auto_2543611 ) ( CLEAR ?auto_2543605 ) ( LIFTING ?auto_2543610 ?auto_2543606 ) ( IS-CRATE ?auto_2543606 ) ( ON ?auto_2543598 ?auto_2543597 ) ( ON ?auto_2543599 ?auto_2543598 ) ( ON ?auto_2543601 ?auto_2543599 ) ( ON ?auto_2543600 ?auto_2543601 ) ( ON ?auto_2543602 ?auto_2543600 ) ( ON ?auto_2543603 ?auto_2543602 ) ( ON ?auto_2543604 ?auto_2543603 ) ( ON ?auto_2543605 ?auto_2543604 ) ( not ( = ?auto_2543597 ?auto_2543598 ) ) ( not ( = ?auto_2543597 ?auto_2543599 ) ) ( not ( = ?auto_2543597 ?auto_2543601 ) ) ( not ( = ?auto_2543597 ?auto_2543600 ) ) ( not ( = ?auto_2543597 ?auto_2543602 ) ) ( not ( = ?auto_2543597 ?auto_2543603 ) ) ( not ( = ?auto_2543597 ?auto_2543604 ) ) ( not ( = ?auto_2543597 ?auto_2543605 ) ) ( not ( = ?auto_2543597 ?auto_2543606 ) ) ( not ( = ?auto_2543597 ?auto_2543607 ) ) ( not ( = ?auto_2543597 ?auto_2543609 ) ) ( not ( = ?auto_2543598 ?auto_2543599 ) ) ( not ( = ?auto_2543598 ?auto_2543601 ) ) ( not ( = ?auto_2543598 ?auto_2543600 ) ) ( not ( = ?auto_2543598 ?auto_2543602 ) ) ( not ( = ?auto_2543598 ?auto_2543603 ) ) ( not ( = ?auto_2543598 ?auto_2543604 ) ) ( not ( = ?auto_2543598 ?auto_2543605 ) ) ( not ( = ?auto_2543598 ?auto_2543606 ) ) ( not ( = ?auto_2543598 ?auto_2543607 ) ) ( not ( = ?auto_2543598 ?auto_2543609 ) ) ( not ( = ?auto_2543599 ?auto_2543601 ) ) ( not ( = ?auto_2543599 ?auto_2543600 ) ) ( not ( = ?auto_2543599 ?auto_2543602 ) ) ( not ( = ?auto_2543599 ?auto_2543603 ) ) ( not ( = ?auto_2543599 ?auto_2543604 ) ) ( not ( = ?auto_2543599 ?auto_2543605 ) ) ( not ( = ?auto_2543599 ?auto_2543606 ) ) ( not ( = ?auto_2543599 ?auto_2543607 ) ) ( not ( = ?auto_2543599 ?auto_2543609 ) ) ( not ( = ?auto_2543601 ?auto_2543600 ) ) ( not ( = ?auto_2543601 ?auto_2543602 ) ) ( not ( = ?auto_2543601 ?auto_2543603 ) ) ( not ( = ?auto_2543601 ?auto_2543604 ) ) ( not ( = ?auto_2543601 ?auto_2543605 ) ) ( not ( = ?auto_2543601 ?auto_2543606 ) ) ( not ( = ?auto_2543601 ?auto_2543607 ) ) ( not ( = ?auto_2543601 ?auto_2543609 ) ) ( not ( = ?auto_2543600 ?auto_2543602 ) ) ( not ( = ?auto_2543600 ?auto_2543603 ) ) ( not ( = ?auto_2543600 ?auto_2543604 ) ) ( not ( = ?auto_2543600 ?auto_2543605 ) ) ( not ( = ?auto_2543600 ?auto_2543606 ) ) ( not ( = ?auto_2543600 ?auto_2543607 ) ) ( not ( = ?auto_2543600 ?auto_2543609 ) ) ( not ( = ?auto_2543602 ?auto_2543603 ) ) ( not ( = ?auto_2543602 ?auto_2543604 ) ) ( not ( = ?auto_2543602 ?auto_2543605 ) ) ( not ( = ?auto_2543602 ?auto_2543606 ) ) ( not ( = ?auto_2543602 ?auto_2543607 ) ) ( not ( = ?auto_2543602 ?auto_2543609 ) ) ( not ( = ?auto_2543603 ?auto_2543604 ) ) ( not ( = ?auto_2543603 ?auto_2543605 ) ) ( not ( = ?auto_2543603 ?auto_2543606 ) ) ( not ( = ?auto_2543603 ?auto_2543607 ) ) ( not ( = ?auto_2543603 ?auto_2543609 ) ) ( not ( = ?auto_2543604 ?auto_2543605 ) ) ( not ( = ?auto_2543604 ?auto_2543606 ) ) ( not ( = ?auto_2543604 ?auto_2543607 ) ) ( not ( = ?auto_2543604 ?auto_2543609 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2543605 ?auto_2543606 ?auto_2543607 )
      ( MAKE-10CRATE-VERIFY ?auto_2543597 ?auto_2543598 ?auto_2543599 ?auto_2543601 ?auto_2543600 ?auto_2543602 ?auto_2543603 ?auto_2543604 ?auto_2543605 ?auto_2543606 ?auto_2543607 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2543723 - SURFACE
      ?auto_2543724 - SURFACE
      ?auto_2543725 - SURFACE
      ?auto_2543727 - SURFACE
      ?auto_2543726 - SURFACE
      ?auto_2543728 - SURFACE
      ?auto_2543729 - SURFACE
      ?auto_2543730 - SURFACE
      ?auto_2543731 - SURFACE
      ?auto_2543732 - SURFACE
      ?auto_2543733 - SURFACE
    )
    :vars
    (
      ?auto_2543737 - HOIST
      ?auto_2543736 - PLACE
      ?auto_2543739 - PLACE
      ?auto_2543738 - HOIST
      ?auto_2543734 - SURFACE
      ?auto_2543735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2543737 ?auto_2543736 ) ( IS-CRATE ?auto_2543733 ) ( not ( = ?auto_2543732 ?auto_2543733 ) ) ( not ( = ?auto_2543731 ?auto_2543732 ) ) ( not ( = ?auto_2543731 ?auto_2543733 ) ) ( not ( = ?auto_2543739 ?auto_2543736 ) ) ( HOIST-AT ?auto_2543738 ?auto_2543739 ) ( not ( = ?auto_2543737 ?auto_2543738 ) ) ( AVAILABLE ?auto_2543738 ) ( SURFACE-AT ?auto_2543733 ?auto_2543739 ) ( ON ?auto_2543733 ?auto_2543734 ) ( CLEAR ?auto_2543733 ) ( not ( = ?auto_2543732 ?auto_2543734 ) ) ( not ( = ?auto_2543733 ?auto_2543734 ) ) ( not ( = ?auto_2543731 ?auto_2543734 ) ) ( TRUCK-AT ?auto_2543735 ?auto_2543736 ) ( SURFACE-AT ?auto_2543731 ?auto_2543736 ) ( CLEAR ?auto_2543731 ) ( IS-CRATE ?auto_2543732 ) ( AVAILABLE ?auto_2543737 ) ( IN ?auto_2543732 ?auto_2543735 ) ( ON ?auto_2543724 ?auto_2543723 ) ( ON ?auto_2543725 ?auto_2543724 ) ( ON ?auto_2543727 ?auto_2543725 ) ( ON ?auto_2543726 ?auto_2543727 ) ( ON ?auto_2543728 ?auto_2543726 ) ( ON ?auto_2543729 ?auto_2543728 ) ( ON ?auto_2543730 ?auto_2543729 ) ( ON ?auto_2543731 ?auto_2543730 ) ( not ( = ?auto_2543723 ?auto_2543724 ) ) ( not ( = ?auto_2543723 ?auto_2543725 ) ) ( not ( = ?auto_2543723 ?auto_2543727 ) ) ( not ( = ?auto_2543723 ?auto_2543726 ) ) ( not ( = ?auto_2543723 ?auto_2543728 ) ) ( not ( = ?auto_2543723 ?auto_2543729 ) ) ( not ( = ?auto_2543723 ?auto_2543730 ) ) ( not ( = ?auto_2543723 ?auto_2543731 ) ) ( not ( = ?auto_2543723 ?auto_2543732 ) ) ( not ( = ?auto_2543723 ?auto_2543733 ) ) ( not ( = ?auto_2543723 ?auto_2543734 ) ) ( not ( = ?auto_2543724 ?auto_2543725 ) ) ( not ( = ?auto_2543724 ?auto_2543727 ) ) ( not ( = ?auto_2543724 ?auto_2543726 ) ) ( not ( = ?auto_2543724 ?auto_2543728 ) ) ( not ( = ?auto_2543724 ?auto_2543729 ) ) ( not ( = ?auto_2543724 ?auto_2543730 ) ) ( not ( = ?auto_2543724 ?auto_2543731 ) ) ( not ( = ?auto_2543724 ?auto_2543732 ) ) ( not ( = ?auto_2543724 ?auto_2543733 ) ) ( not ( = ?auto_2543724 ?auto_2543734 ) ) ( not ( = ?auto_2543725 ?auto_2543727 ) ) ( not ( = ?auto_2543725 ?auto_2543726 ) ) ( not ( = ?auto_2543725 ?auto_2543728 ) ) ( not ( = ?auto_2543725 ?auto_2543729 ) ) ( not ( = ?auto_2543725 ?auto_2543730 ) ) ( not ( = ?auto_2543725 ?auto_2543731 ) ) ( not ( = ?auto_2543725 ?auto_2543732 ) ) ( not ( = ?auto_2543725 ?auto_2543733 ) ) ( not ( = ?auto_2543725 ?auto_2543734 ) ) ( not ( = ?auto_2543727 ?auto_2543726 ) ) ( not ( = ?auto_2543727 ?auto_2543728 ) ) ( not ( = ?auto_2543727 ?auto_2543729 ) ) ( not ( = ?auto_2543727 ?auto_2543730 ) ) ( not ( = ?auto_2543727 ?auto_2543731 ) ) ( not ( = ?auto_2543727 ?auto_2543732 ) ) ( not ( = ?auto_2543727 ?auto_2543733 ) ) ( not ( = ?auto_2543727 ?auto_2543734 ) ) ( not ( = ?auto_2543726 ?auto_2543728 ) ) ( not ( = ?auto_2543726 ?auto_2543729 ) ) ( not ( = ?auto_2543726 ?auto_2543730 ) ) ( not ( = ?auto_2543726 ?auto_2543731 ) ) ( not ( = ?auto_2543726 ?auto_2543732 ) ) ( not ( = ?auto_2543726 ?auto_2543733 ) ) ( not ( = ?auto_2543726 ?auto_2543734 ) ) ( not ( = ?auto_2543728 ?auto_2543729 ) ) ( not ( = ?auto_2543728 ?auto_2543730 ) ) ( not ( = ?auto_2543728 ?auto_2543731 ) ) ( not ( = ?auto_2543728 ?auto_2543732 ) ) ( not ( = ?auto_2543728 ?auto_2543733 ) ) ( not ( = ?auto_2543728 ?auto_2543734 ) ) ( not ( = ?auto_2543729 ?auto_2543730 ) ) ( not ( = ?auto_2543729 ?auto_2543731 ) ) ( not ( = ?auto_2543729 ?auto_2543732 ) ) ( not ( = ?auto_2543729 ?auto_2543733 ) ) ( not ( = ?auto_2543729 ?auto_2543734 ) ) ( not ( = ?auto_2543730 ?auto_2543731 ) ) ( not ( = ?auto_2543730 ?auto_2543732 ) ) ( not ( = ?auto_2543730 ?auto_2543733 ) ) ( not ( = ?auto_2543730 ?auto_2543734 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2543731 ?auto_2543732 ?auto_2543733 )
      ( MAKE-10CRATE-VERIFY ?auto_2543723 ?auto_2543724 ?auto_2543725 ?auto_2543727 ?auto_2543726 ?auto_2543728 ?auto_2543729 ?auto_2543730 ?auto_2543731 ?auto_2543732 ?auto_2543733 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2550993 - SURFACE
      ?auto_2550994 - SURFACE
      ?auto_2550995 - SURFACE
      ?auto_2550997 - SURFACE
      ?auto_2550996 - SURFACE
      ?auto_2550998 - SURFACE
      ?auto_2550999 - SURFACE
      ?auto_2551000 - SURFACE
      ?auto_2551001 - SURFACE
      ?auto_2551002 - SURFACE
      ?auto_2551003 - SURFACE
      ?auto_2551004 - SURFACE
    )
    :vars
    (
      ?auto_2551005 - HOIST
      ?auto_2551006 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2551005 ?auto_2551006 ) ( SURFACE-AT ?auto_2551003 ?auto_2551006 ) ( CLEAR ?auto_2551003 ) ( LIFTING ?auto_2551005 ?auto_2551004 ) ( IS-CRATE ?auto_2551004 ) ( not ( = ?auto_2551003 ?auto_2551004 ) ) ( ON ?auto_2550994 ?auto_2550993 ) ( ON ?auto_2550995 ?auto_2550994 ) ( ON ?auto_2550997 ?auto_2550995 ) ( ON ?auto_2550996 ?auto_2550997 ) ( ON ?auto_2550998 ?auto_2550996 ) ( ON ?auto_2550999 ?auto_2550998 ) ( ON ?auto_2551000 ?auto_2550999 ) ( ON ?auto_2551001 ?auto_2551000 ) ( ON ?auto_2551002 ?auto_2551001 ) ( ON ?auto_2551003 ?auto_2551002 ) ( not ( = ?auto_2550993 ?auto_2550994 ) ) ( not ( = ?auto_2550993 ?auto_2550995 ) ) ( not ( = ?auto_2550993 ?auto_2550997 ) ) ( not ( = ?auto_2550993 ?auto_2550996 ) ) ( not ( = ?auto_2550993 ?auto_2550998 ) ) ( not ( = ?auto_2550993 ?auto_2550999 ) ) ( not ( = ?auto_2550993 ?auto_2551000 ) ) ( not ( = ?auto_2550993 ?auto_2551001 ) ) ( not ( = ?auto_2550993 ?auto_2551002 ) ) ( not ( = ?auto_2550993 ?auto_2551003 ) ) ( not ( = ?auto_2550993 ?auto_2551004 ) ) ( not ( = ?auto_2550994 ?auto_2550995 ) ) ( not ( = ?auto_2550994 ?auto_2550997 ) ) ( not ( = ?auto_2550994 ?auto_2550996 ) ) ( not ( = ?auto_2550994 ?auto_2550998 ) ) ( not ( = ?auto_2550994 ?auto_2550999 ) ) ( not ( = ?auto_2550994 ?auto_2551000 ) ) ( not ( = ?auto_2550994 ?auto_2551001 ) ) ( not ( = ?auto_2550994 ?auto_2551002 ) ) ( not ( = ?auto_2550994 ?auto_2551003 ) ) ( not ( = ?auto_2550994 ?auto_2551004 ) ) ( not ( = ?auto_2550995 ?auto_2550997 ) ) ( not ( = ?auto_2550995 ?auto_2550996 ) ) ( not ( = ?auto_2550995 ?auto_2550998 ) ) ( not ( = ?auto_2550995 ?auto_2550999 ) ) ( not ( = ?auto_2550995 ?auto_2551000 ) ) ( not ( = ?auto_2550995 ?auto_2551001 ) ) ( not ( = ?auto_2550995 ?auto_2551002 ) ) ( not ( = ?auto_2550995 ?auto_2551003 ) ) ( not ( = ?auto_2550995 ?auto_2551004 ) ) ( not ( = ?auto_2550997 ?auto_2550996 ) ) ( not ( = ?auto_2550997 ?auto_2550998 ) ) ( not ( = ?auto_2550997 ?auto_2550999 ) ) ( not ( = ?auto_2550997 ?auto_2551000 ) ) ( not ( = ?auto_2550997 ?auto_2551001 ) ) ( not ( = ?auto_2550997 ?auto_2551002 ) ) ( not ( = ?auto_2550997 ?auto_2551003 ) ) ( not ( = ?auto_2550997 ?auto_2551004 ) ) ( not ( = ?auto_2550996 ?auto_2550998 ) ) ( not ( = ?auto_2550996 ?auto_2550999 ) ) ( not ( = ?auto_2550996 ?auto_2551000 ) ) ( not ( = ?auto_2550996 ?auto_2551001 ) ) ( not ( = ?auto_2550996 ?auto_2551002 ) ) ( not ( = ?auto_2550996 ?auto_2551003 ) ) ( not ( = ?auto_2550996 ?auto_2551004 ) ) ( not ( = ?auto_2550998 ?auto_2550999 ) ) ( not ( = ?auto_2550998 ?auto_2551000 ) ) ( not ( = ?auto_2550998 ?auto_2551001 ) ) ( not ( = ?auto_2550998 ?auto_2551002 ) ) ( not ( = ?auto_2550998 ?auto_2551003 ) ) ( not ( = ?auto_2550998 ?auto_2551004 ) ) ( not ( = ?auto_2550999 ?auto_2551000 ) ) ( not ( = ?auto_2550999 ?auto_2551001 ) ) ( not ( = ?auto_2550999 ?auto_2551002 ) ) ( not ( = ?auto_2550999 ?auto_2551003 ) ) ( not ( = ?auto_2550999 ?auto_2551004 ) ) ( not ( = ?auto_2551000 ?auto_2551001 ) ) ( not ( = ?auto_2551000 ?auto_2551002 ) ) ( not ( = ?auto_2551000 ?auto_2551003 ) ) ( not ( = ?auto_2551000 ?auto_2551004 ) ) ( not ( = ?auto_2551001 ?auto_2551002 ) ) ( not ( = ?auto_2551001 ?auto_2551003 ) ) ( not ( = ?auto_2551001 ?auto_2551004 ) ) ( not ( = ?auto_2551002 ?auto_2551003 ) ) ( not ( = ?auto_2551002 ?auto_2551004 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2551003 ?auto_2551004 )
      ( MAKE-11CRATE-VERIFY ?auto_2550993 ?auto_2550994 ?auto_2550995 ?auto_2550997 ?auto_2550996 ?auto_2550998 ?auto_2550999 ?auto_2551000 ?auto_2551001 ?auto_2551002 ?auto_2551003 ?auto_2551004 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2551102 - SURFACE
      ?auto_2551103 - SURFACE
      ?auto_2551104 - SURFACE
      ?auto_2551106 - SURFACE
      ?auto_2551105 - SURFACE
      ?auto_2551107 - SURFACE
      ?auto_2551108 - SURFACE
      ?auto_2551109 - SURFACE
      ?auto_2551110 - SURFACE
      ?auto_2551111 - SURFACE
      ?auto_2551112 - SURFACE
      ?auto_2551113 - SURFACE
    )
    :vars
    (
      ?auto_2551116 - HOIST
      ?auto_2551114 - PLACE
      ?auto_2551115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2551116 ?auto_2551114 ) ( SURFACE-AT ?auto_2551112 ?auto_2551114 ) ( CLEAR ?auto_2551112 ) ( IS-CRATE ?auto_2551113 ) ( not ( = ?auto_2551112 ?auto_2551113 ) ) ( TRUCK-AT ?auto_2551115 ?auto_2551114 ) ( AVAILABLE ?auto_2551116 ) ( IN ?auto_2551113 ?auto_2551115 ) ( ON ?auto_2551112 ?auto_2551111 ) ( not ( = ?auto_2551111 ?auto_2551112 ) ) ( not ( = ?auto_2551111 ?auto_2551113 ) ) ( ON ?auto_2551103 ?auto_2551102 ) ( ON ?auto_2551104 ?auto_2551103 ) ( ON ?auto_2551106 ?auto_2551104 ) ( ON ?auto_2551105 ?auto_2551106 ) ( ON ?auto_2551107 ?auto_2551105 ) ( ON ?auto_2551108 ?auto_2551107 ) ( ON ?auto_2551109 ?auto_2551108 ) ( ON ?auto_2551110 ?auto_2551109 ) ( ON ?auto_2551111 ?auto_2551110 ) ( not ( = ?auto_2551102 ?auto_2551103 ) ) ( not ( = ?auto_2551102 ?auto_2551104 ) ) ( not ( = ?auto_2551102 ?auto_2551106 ) ) ( not ( = ?auto_2551102 ?auto_2551105 ) ) ( not ( = ?auto_2551102 ?auto_2551107 ) ) ( not ( = ?auto_2551102 ?auto_2551108 ) ) ( not ( = ?auto_2551102 ?auto_2551109 ) ) ( not ( = ?auto_2551102 ?auto_2551110 ) ) ( not ( = ?auto_2551102 ?auto_2551111 ) ) ( not ( = ?auto_2551102 ?auto_2551112 ) ) ( not ( = ?auto_2551102 ?auto_2551113 ) ) ( not ( = ?auto_2551103 ?auto_2551104 ) ) ( not ( = ?auto_2551103 ?auto_2551106 ) ) ( not ( = ?auto_2551103 ?auto_2551105 ) ) ( not ( = ?auto_2551103 ?auto_2551107 ) ) ( not ( = ?auto_2551103 ?auto_2551108 ) ) ( not ( = ?auto_2551103 ?auto_2551109 ) ) ( not ( = ?auto_2551103 ?auto_2551110 ) ) ( not ( = ?auto_2551103 ?auto_2551111 ) ) ( not ( = ?auto_2551103 ?auto_2551112 ) ) ( not ( = ?auto_2551103 ?auto_2551113 ) ) ( not ( = ?auto_2551104 ?auto_2551106 ) ) ( not ( = ?auto_2551104 ?auto_2551105 ) ) ( not ( = ?auto_2551104 ?auto_2551107 ) ) ( not ( = ?auto_2551104 ?auto_2551108 ) ) ( not ( = ?auto_2551104 ?auto_2551109 ) ) ( not ( = ?auto_2551104 ?auto_2551110 ) ) ( not ( = ?auto_2551104 ?auto_2551111 ) ) ( not ( = ?auto_2551104 ?auto_2551112 ) ) ( not ( = ?auto_2551104 ?auto_2551113 ) ) ( not ( = ?auto_2551106 ?auto_2551105 ) ) ( not ( = ?auto_2551106 ?auto_2551107 ) ) ( not ( = ?auto_2551106 ?auto_2551108 ) ) ( not ( = ?auto_2551106 ?auto_2551109 ) ) ( not ( = ?auto_2551106 ?auto_2551110 ) ) ( not ( = ?auto_2551106 ?auto_2551111 ) ) ( not ( = ?auto_2551106 ?auto_2551112 ) ) ( not ( = ?auto_2551106 ?auto_2551113 ) ) ( not ( = ?auto_2551105 ?auto_2551107 ) ) ( not ( = ?auto_2551105 ?auto_2551108 ) ) ( not ( = ?auto_2551105 ?auto_2551109 ) ) ( not ( = ?auto_2551105 ?auto_2551110 ) ) ( not ( = ?auto_2551105 ?auto_2551111 ) ) ( not ( = ?auto_2551105 ?auto_2551112 ) ) ( not ( = ?auto_2551105 ?auto_2551113 ) ) ( not ( = ?auto_2551107 ?auto_2551108 ) ) ( not ( = ?auto_2551107 ?auto_2551109 ) ) ( not ( = ?auto_2551107 ?auto_2551110 ) ) ( not ( = ?auto_2551107 ?auto_2551111 ) ) ( not ( = ?auto_2551107 ?auto_2551112 ) ) ( not ( = ?auto_2551107 ?auto_2551113 ) ) ( not ( = ?auto_2551108 ?auto_2551109 ) ) ( not ( = ?auto_2551108 ?auto_2551110 ) ) ( not ( = ?auto_2551108 ?auto_2551111 ) ) ( not ( = ?auto_2551108 ?auto_2551112 ) ) ( not ( = ?auto_2551108 ?auto_2551113 ) ) ( not ( = ?auto_2551109 ?auto_2551110 ) ) ( not ( = ?auto_2551109 ?auto_2551111 ) ) ( not ( = ?auto_2551109 ?auto_2551112 ) ) ( not ( = ?auto_2551109 ?auto_2551113 ) ) ( not ( = ?auto_2551110 ?auto_2551111 ) ) ( not ( = ?auto_2551110 ?auto_2551112 ) ) ( not ( = ?auto_2551110 ?auto_2551113 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2551111 ?auto_2551112 ?auto_2551113 )
      ( MAKE-11CRATE-VERIFY ?auto_2551102 ?auto_2551103 ?auto_2551104 ?auto_2551106 ?auto_2551105 ?auto_2551107 ?auto_2551108 ?auto_2551109 ?auto_2551110 ?auto_2551111 ?auto_2551112 ?auto_2551113 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2551223 - SURFACE
      ?auto_2551224 - SURFACE
      ?auto_2551225 - SURFACE
      ?auto_2551227 - SURFACE
      ?auto_2551226 - SURFACE
      ?auto_2551228 - SURFACE
      ?auto_2551229 - SURFACE
      ?auto_2551230 - SURFACE
      ?auto_2551231 - SURFACE
      ?auto_2551232 - SURFACE
      ?auto_2551233 - SURFACE
      ?auto_2551234 - SURFACE
    )
    :vars
    (
      ?auto_2551235 - HOIST
      ?auto_2551238 - PLACE
      ?auto_2551237 - TRUCK
      ?auto_2551236 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2551235 ?auto_2551238 ) ( SURFACE-AT ?auto_2551233 ?auto_2551238 ) ( CLEAR ?auto_2551233 ) ( IS-CRATE ?auto_2551234 ) ( not ( = ?auto_2551233 ?auto_2551234 ) ) ( AVAILABLE ?auto_2551235 ) ( IN ?auto_2551234 ?auto_2551237 ) ( ON ?auto_2551233 ?auto_2551232 ) ( not ( = ?auto_2551232 ?auto_2551233 ) ) ( not ( = ?auto_2551232 ?auto_2551234 ) ) ( TRUCK-AT ?auto_2551237 ?auto_2551236 ) ( not ( = ?auto_2551236 ?auto_2551238 ) ) ( ON ?auto_2551224 ?auto_2551223 ) ( ON ?auto_2551225 ?auto_2551224 ) ( ON ?auto_2551227 ?auto_2551225 ) ( ON ?auto_2551226 ?auto_2551227 ) ( ON ?auto_2551228 ?auto_2551226 ) ( ON ?auto_2551229 ?auto_2551228 ) ( ON ?auto_2551230 ?auto_2551229 ) ( ON ?auto_2551231 ?auto_2551230 ) ( ON ?auto_2551232 ?auto_2551231 ) ( not ( = ?auto_2551223 ?auto_2551224 ) ) ( not ( = ?auto_2551223 ?auto_2551225 ) ) ( not ( = ?auto_2551223 ?auto_2551227 ) ) ( not ( = ?auto_2551223 ?auto_2551226 ) ) ( not ( = ?auto_2551223 ?auto_2551228 ) ) ( not ( = ?auto_2551223 ?auto_2551229 ) ) ( not ( = ?auto_2551223 ?auto_2551230 ) ) ( not ( = ?auto_2551223 ?auto_2551231 ) ) ( not ( = ?auto_2551223 ?auto_2551232 ) ) ( not ( = ?auto_2551223 ?auto_2551233 ) ) ( not ( = ?auto_2551223 ?auto_2551234 ) ) ( not ( = ?auto_2551224 ?auto_2551225 ) ) ( not ( = ?auto_2551224 ?auto_2551227 ) ) ( not ( = ?auto_2551224 ?auto_2551226 ) ) ( not ( = ?auto_2551224 ?auto_2551228 ) ) ( not ( = ?auto_2551224 ?auto_2551229 ) ) ( not ( = ?auto_2551224 ?auto_2551230 ) ) ( not ( = ?auto_2551224 ?auto_2551231 ) ) ( not ( = ?auto_2551224 ?auto_2551232 ) ) ( not ( = ?auto_2551224 ?auto_2551233 ) ) ( not ( = ?auto_2551224 ?auto_2551234 ) ) ( not ( = ?auto_2551225 ?auto_2551227 ) ) ( not ( = ?auto_2551225 ?auto_2551226 ) ) ( not ( = ?auto_2551225 ?auto_2551228 ) ) ( not ( = ?auto_2551225 ?auto_2551229 ) ) ( not ( = ?auto_2551225 ?auto_2551230 ) ) ( not ( = ?auto_2551225 ?auto_2551231 ) ) ( not ( = ?auto_2551225 ?auto_2551232 ) ) ( not ( = ?auto_2551225 ?auto_2551233 ) ) ( not ( = ?auto_2551225 ?auto_2551234 ) ) ( not ( = ?auto_2551227 ?auto_2551226 ) ) ( not ( = ?auto_2551227 ?auto_2551228 ) ) ( not ( = ?auto_2551227 ?auto_2551229 ) ) ( not ( = ?auto_2551227 ?auto_2551230 ) ) ( not ( = ?auto_2551227 ?auto_2551231 ) ) ( not ( = ?auto_2551227 ?auto_2551232 ) ) ( not ( = ?auto_2551227 ?auto_2551233 ) ) ( not ( = ?auto_2551227 ?auto_2551234 ) ) ( not ( = ?auto_2551226 ?auto_2551228 ) ) ( not ( = ?auto_2551226 ?auto_2551229 ) ) ( not ( = ?auto_2551226 ?auto_2551230 ) ) ( not ( = ?auto_2551226 ?auto_2551231 ) ) ( not ( = ?auto_2551226 ?auto_2551232 ) ) ( not ( = ?auto_2551226 ?auto_2551233 ) ) ( not ( = ?auto_2551226 ?auto_2551234 ) ) ( not ( = ?auto_2551228 ?auto_2551229 ) ) ( not ( = ?auto_2551228 ?auto_2551230 ) ) ( not ( = ?auto_2551228 ?auto_2551231 ) ) ( not ( = ?auto_2551228 ?auto_2551232 ) ) ( not ( = ?auto_2551228 ?auto_2551233 ) ) ( not ( = ?auto_2551228 ?auto_2551234 ) ) ( not ( = ?auto_2551229 ?auto_2551230 ) ) ( not ( = ?auto_2551229 ?auto_2551231 ) ) ( not ( = ?auto_2551229 ?auto_2551232 ) ) ( not ( = ?auto_2551229 ?auto_2551233 ) ) ( not ( = ?auto_2551229 ?auto_2551234 ) ) ( not ( = ?auto_2551230 ?auto_2551231 ) ) ( not ( = ?auto_2551230 ?auto_2551232 ) ) ( not ( = ?auto_2551230 ?auto_2551233 ) ) ( not ( = ?auto_2551230 ?auto_2551234 ) ) ( not ( = ?auto_2551231 ?auto_2551232 ) ) ( not ( = ?auto_2551231 ?auto_2551233 ) ) ( not ( = ?auto_2551231 ?auto_2551234 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2551232 ?auto_2551233 ?auto_2551234 )
      ( MAKE-11CRATE-VERIFY ?auto_2551223 ?auto_2551224 ?auto_2551225 ?auto_2551227 ?auto_2551226 ?auto_2551228 ?auto_2551229 ?auto_2551230 ?auto_2551231 ?auto_2551232 ?auto_2551233 ?auto_2551234 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2551355 - SURFACE
      ?auto_2551356 - SURFACE
      ?auto_2551357 - SURFACE
      ?auto_2551359 - SURFACE
      ?auto_2551358 - SURFACE
      ?auto_2551360 - SURFACE
      ?auto_2551361 - SURFACE
      ?auto_2551362 - SURFACE
      ?auto_2551363 - SURFACE
      ?auto_2551364 - SURFACE
      ?auto_2551365 - SURFACE
      ?auto_2551366 - SURFACE
    )
    :vars
    (
      ?auto_2551370 - HOIST
      ?auto_2551368 - PLACE
      ?auto_2551371 - TRUCK
      ?auto_2551367 - PLACE
      ?auto_2551369 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2551370 ?auto_2551368 ) ( SURFACE-AT ?auto_2551365 ?auto_2551368 ) ( CLEAR ?auto_2551365 ) ( IS-CRATE ?auto_2551366 ) ( not ( = ?auto_2551365 ?auto_2551366 ) ) ( AVAILABLE ?auto_2551370 ) ( ON ?auto_2551365 ?auto_2551364 ) ( not ( = ?auto_2551364 ?auto_2551365 ) ) ( not ( = ?auto_2551364 ?auto_2551366 ) ) ( TRUCK-AT ?auto_2551371 ?auto_2551367 ) ( not ( = ?auto_2551367 ?auto_2551368 ) ) ( HOIST-AT ?auto_2551369 ?auto_2551367 ) ( LIFTING ?auto_2551369 ?auto_2551366 ) ( not ( = ?auto_2551370 ?auto_2551369 ) ) ( ON ?auto_2551356 ?auto_2551355 ) ( ON ?auto_2551357 ?auto_2551356 ) ( ON ?auto_2551359 ?auto_2551357 ) ( ON ?auto_2551358 ?auto_2551359 ) ( ON ?auto_2551360 ?auto_2551358 ) ( ON ?auto_2551361 ?auto_2551360 ) ( ON ?auto_2551362 ?auto_2551361 ) ( ON ?auto_2551363 ?auto_2551362 ) ( ON ?auto_2551364 ?auto_2551363 ) ( not ( = ?auto_2551355 ?auto_2551356 ) ) ( not ( = ?auto_2551355 ?auto_2551357 ) ) ( not ( = ?auto_2551355 ?auto_2551359 ) ) ( not ( = ?auto_2551355 ?auto_2551358 ) ) ( not ( = ?auto_2551355 ?auto_2551360 ) ) ( not ( = ?auto_2551355 ?auto_2551361 ) ) ( not ( = ?auto_2551355 ?auto_2551362 ) ) ( not ( = ?auto_2551355 ?auto_2551363 ) ) ( not ( = ?auto_2551355 ?auto_2551364 ) ) ( not ( = ?auto_2551355 ?auto_2551365 ) ) ( not ( = ?auto_2551355 ?auto_2551366 ) ) ( not ( = ?auto_2551356 ?auto_2551357 ) ) ( not ( = ?auto_2551356 ?auto_2551359 ) ) ( not ( = ?auto_2551356 ?auto_2551358 ) ) ( not ( = ?auto_2551356 ?auto_2551360 ) ) ( not ( = ?auto_2551356 ?auto_2551361 ) ) ( not ( = ?auto_2551356 ?auto_2551362 ) ) ( not ( = ?auto_2551356 ?auto_2551363 ) ) ( not ( = ?auto_2551356 ?auto_2551364 ) ) ( not ( = ?auto_2551356 ?auto_2551365 ) ) ( not ( = ?auto_2551356 ?auto_2551366 ) ) ( not ( = ?auto_2551357 ?auto_2551359 ) ) ( not ( = ?auto_2551357 ?auto_2551358 ) ) ( not ( = ?auto_2551357 ?auto_2551360 ) ) ( not ( = ?auto_2551357 ?auto_2551361 ) ) ( not ( = ?auto_2551357 ?auto_2551362 ) ) ( not ( = ?auto_2551357 ?auto_2551363 ) ) ( not ( = ?auto_2551357 ?auto_2551364 ) ) ( not ( = ?auto_2551357 ?auto_2551365 ) ) ( not ( = ?auto_2551357 ?auto_2551366 ) ) ( not ( = ?auto_2551359 ?auto_2551358 ) ) ( not ( = ?auto_2551359 ?auto_2551360 ) ) ( not ( = ?auto_2551359 ?auto_2551361 ) ) ( not ( = ?auto_2551359 ?auto_2551362 ) ) ( not ( = ?auto_2551359 ?auto_2551363 ) ) ( not ( = ?auto_2551359 ?auto_2551364 ) ) ( not ( = ?auto_2551359 ?auto_2551365 ) ) ( not ( = ?auto_2551359 ?auto_2551366 ) ) ( not ( = ?auto_2551358 ?auto_2551360 ) ) ( not ( = ?auto_2551358 ?auto_2551361 ) ) ( not ( = ?auto_2551358 ?auto_2551362 ) ) ( not ( = ?auto_2551358 ?auto_2551363 ) ) ( not ( = ?auto_2551358 ?auto_2551364 ) ) ( not ( = ?auto_2551358 ?auto_2551365 ) ) ( not ( = ?auto_2551358 ?auto_2551366 ) ) ( not ( = ?auto_2551360 ?auto_2551361 ) ) ( not ( = ?auto_2551360 ?auto_2551362 ) ) ( not ( = ?auto_2551360 ?auto_2551363 ) ) ( not ( = ?auto_2551360 ?auto_2551364 ) ) ( not ( = ?auto_2551360 ?auto_2551365 ) ) ( not ( = ?auto_2551360 ?auto_2551366 ) ) ( not ( = ?auto_2551361 ?auto_2551362 ) ) ( not ( = ?auto_2551361 ?auto_2551363 ) ) ( not ( = ?auto_2551361 ?auto_2551364 ) ) ( not ( = ?auto_2551361 ?auto_2551365 ) ) ( not ( = ?auto_2551361 ?auto_2551366 ) ) ( not ( = ?auto_2551362 ?auto_2551363 ) ) ( not ( = ?auto_2551362 ?auto_2551364 ) ) ( not ( = ?auto_2551362 ?auto_2551365 ) ) ( not ( = ?auto_2551362 ?auto_2551366 ) ) ( not ( = ?auto_2551363 ?auto_2551364 ) ) ( not ( = ?auto_2551363 ?auto_2551365 ) ) ( not ( = ?auto_2551363 ?auto_2551366 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2551364 ?auto_2551365 ?auto_2551366 )
      ( MAKE-11CRATE-VERIFY ?auto_2551355 ?auto_2551356 ?auto_2551357 ?auto_2551359 ?auto_2551358 ?auto_2551360 ?auto_2551361 ?auto_2551362 ?auto_2551363 ?auto_2551364 ?auto_2551365 ?auto_2551366 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2551498 - SURFACE
      ?auto_2551499 - SURFACE
      ?auto_2551500 - SURFACE
      ?auto_2551502 - SURFACE
      ?auto_2551501 - SURFACE
      ?auto_2551503 - SURFACE
      ?auto_2551504 - SURFACE
      ?auto_2551505 - SURFACE
      ?auto_2551506 - SURFACE
      ?auto_2551507 - SURFACE
      ?auto_2551508 - SURFACE
      ?auto_2551509 - SURFACE
    )
    :vars
    (
      ?auto_2551515 - HOIST
      ?auto_2551514 - PLACE
      ?auto_2551512 - TRUCK
      ?auto_2551511 - PLACE
      ?auto_2551510 - HOIST
      ?auto_2551513 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2551515 ?auto_2551514 ) ( SURFACE-AT ?auto_2551508 ?auto_2551514 ) ( CLEAR ?auto_2551508 ) ( IS-CRATE ?auto_2551509 ) ( not ( = ?auto_2551508 ?auto_2551509 ) ) ( AVAILABLE ?auto_2551515 ) ( ON ?auto_2551508 ?auto_2551507 ) ( not ( = ?auto_2551507 ?auto_2551508 ) ) ( not ( = ?auto_2551507 ?auto_2551509 ) ) ( TRUCK-AT ?auto_2551512 ?auto_2551511 ) ( not ( = ?auto_2551511 ?auto_2551514 ) ) ( HOIST-AT ?auto_2551510 ?auto_2551511 ) ( not ( = ?auto_2551515 ?auto_2551510 ) ) ( AVAILABLE ?auto_2551510 ) ( SURFACE-AT ?auto_2551509 ?auto_2551511 ) ( ON ?auto_2551509 ?auto_2551513 ) ( CLEAR ?auto_2551509 ) ( not ( = ?auto_2551508 ?auto_2551513 ) ) ( not ( = ?auto_2551509 ?auto_2551513 ) ) ( not ( = ?auto_2551507 ?auto_2551513 ) ) ( ON ?auto_2551499 ?auto_2551498 ) ( ON ?auto_2551500 ?auto_2551499 ) ( ON ?auto_2551502 ?auto_2551500 ) ( ON ?auto_2551501 ?auto_2551502 ) ( ON ?auto_2551503 ?auto_2551501 ) ( ON ?auto_2551504 ?auto_2551503 ) ( ON ?auto_2551505 ?auto_2551504 ) ( ON ?auto_2551506 ?auto_2551505 ) ( ON ?auto_2551507 ?auto_2551506 ) ( not ( = ?auto_2551498 ?auto_2551499 ) ) ( not ( = ?auto_2551498 ?auto_2551500 ) ) ( not ( = ?auto_2551498 ?auto_2551502 ) ) ( not ( = ?auto_2551498 ?auto_2551501 ) ) ( not ( = ?auto_2551498 ?auto_2551503 ) ) ( not ( = ?auto_2551498 ?auto_2551504 ) ) ( not ( = ?auto_2551498 ?auto_2551505 ) ) ( not ( = ?auto_2551498 ?auto_2551506 ) ) ( not ( = ?auto_2551498 ?auto_2551507 ) ) ( not ( = ?auto_2551498 ?auto_2551508 ) ) ( not ( = ?auto_2551498 ?auto_2551509 ) ) ( not ( = ?auto_2551498 ?auto_2551513 ) ) ( not ( = ?auto_2551499 ?auto_2551500 ) ) ( not ( = ?auto_2551499 ?auto_2551502 ) ) ( not ( = ?auto_2551499 ?auto_2551501 ) ) ( not ( = ?auto_2551499 ?auto_2551503 ) ) ( not ( = ?auto_2551499 ?auto_2551504 ) ) ( not ( = ?auto_2551499 ?auto_2551505 ) ) ( not ( = ?auto_2551499 ?auto_2551506 ) ) ( not ( = ?auto_2551499 ?auto_2551507 ) ) ( not ( = ?auto_2551499 ?auto_2551508 ) ) ( not ( = ?auto_2551499 ?auto_2551509 ) ) ( not ( = ?auto_2551499 ?auto_2551513 ) ) ( not ( = ?auto_2551500 ?auto_2551502 ) ) ( not ( = ?auto_2551500 ?auto_2551501 ) ) ( not ( = ?auto_2551500 ?auto_2551503 ) ) ( not ( = ?auto_2551500 ?auto_2551504 ) ) ( not ( = ?auto_2551500 ?auto_2551505 ) ) ( not ( = ?auto_2551500 ?auto_2551506 ) ) ( not ( = ?auto_2551500 ?auto_2551507 ) ) ( not ( = ?auto_2551500 ?auto_2551508 ) ) ( not ( = ?auto_2551500 ?auto_2551509 ) ) ( not ( = ?auto_2551500 ?auto_2551513 ) ) ( not ( = ?auto_2551502 ?auto_2551501 ) ) ( not ( = ?auto_2551502 ?auto_2551503 ) ) ( not ( = ?auto_2551502 ?auto_2551504 ) ) ( not ( = ?auto_2551502 ?auto_2551505 ) ) ( not ( = ?auto_2551502 ?auto_2551506 ) ) ( not ( = ?auto_2551502 ?auto_2551507 ) ) ( not ( = ?auto_2551502 ?auto_2551508 ) ) ( not ( = ?auto_2551502 ?auto_2551509 ) ) ( not ( = ?auto_2551502 ?auto_2551513 ) ) ( not ( = ?auto_2551501 ?auto_2551503 ) ) ( not ( = ?auto_2551501 ?auto_2551504 ) ) ( not ( = ?auto_2551501 ?auto_2551505 ) ) ( not ( = ?auto_2551501 ?auto_2551506 ) ) ( not ( = ?auto_2551501 ?auto_2551507 ) ) ( not ( = ?auto_2551501 ?auto_2551508 ) ) ( not ( = ?auto_2551501 ?auto_2551509 ) ) ( not ( = ?auto_2551501 ?auto_2551513 ) ) ( not ( = ?auto_2551503 ?auto_2551504 ) ) ( not ( = ?auto_2551503 ?auto_2551505 ) ) ( not ( = ?auto_2551503 ?auto_2551506 ) ) ( not ( = ?auto_2551503 ?auto_2551507 ) ) ( not ( = ?auto_2551503 ?auto_2551508 ) ) ( not ( = ?auto_2551503 ?auto_2551509 ) ) ( not ( = ?auto_2551503 ?auto_2551513 ) ) ( not ( = ?auto_2551504 ?auto_2551505 ) ) ( not ( = ?auto_2551504 ?auto_2551506 ) ) ( not ( = ?auto_2551504 ?auto_2551507 ) ) ( not ( = ?auto_2551504 ?auto_2551508 ) ) ( not ( = ?auto_2551504 ?auto_2551509 ) ) ( not ( = ?auto_2551504 ?auto_2551513 ) ) ( not ( = ?auto_2551505 ?auto_2551506 ) ) ( not ( = ?auto_2551505 ?auto_2551507 ) ) ( not ( = ?auto_2551505 ?auto_2551508 ) ) ( not ( = ?auto_2551505 ?auto_2551509 ) ) ( not ( = ?auto_2551505 ?auto_2551513 ) ) ( not ( = ?auto_2551506 ?auto_2551507 ) ) ( not ( = ?auto_2551506 ?auto_2551508 ) ) ( not ( = ?auto_2551506 ?auto_2551509 ) ) ( not ( = ?auto_2551506 ?auto_2551513 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2551507 ?auto_2551508 ?auto_2551509 )
      ( MAKE-11CRATE-VERIFY ?auto_2551498 ?auto_2551499 ?auto_2551500 ?auto_2551502 ?auto_2551501 ?auto_2551503 ?auto_2551504 ?auto_2551505 ?auto_2551506 ?auto_2551507 ?auto_2551508 ?auto_2551509 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2551642 - SURFACE
      ?auto_2551643 - SURFACE
      ?auto_2551644 - SURFACE
      ?auto_2551646 - SURFACE
      ?auto_2551645 - SURFACE
      ?auto_2551647 - SURFACE
      ?auto_2551648 - SURFACE
      ?auto_2551649 - SURFACE
      ?auto_2551650 - SURFACE
      ?auto_2551651 - SURFACE
      ?auto_2551652 - SURFACE
      ?auto_2551653 - SURFACE
    )
    :vars
    (
      ?auto_2551659 - HOIST
      ?auto_2551655 - PLACE
      ?auto_2551657 - PLACE
      ?auto_2551654 - HOIST
      ?auto_2551656 - SURFACE
      ?auto_2551658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2551659 ?auto_2551655 ) ( SURFACE-AT ?auto_2551652 ?auto_2551655 ) ( CLEAR ?auto_2551652 ) ( IS-CRATE ?auto_2551653 ) ( not ( = ?auto_2551652 ?auto_2551653 ) ) ( AVAILABLE ?auto_2551659 ) ( ON ?auto_2551652 ?auto_2551651 ) ( not ( = ?auto_2551651 ?auto_2551652 ) ) ( not ( = ?auto_2551651 ?auto_2551653 ) ) ( not ( = ?auto_2551657 ?auto_2551655 ) ) ( HOIST-AT ?auto_2551654 ?auto_2551657 ) ( not ( = ?auto_2551659 ?auto_2551654 ) ) ( AVAILABLE ?auto_2551654 ) ( SURFACE-AT ?auto_2551653 ?auto_2551657 ) ( ON ?auto_2551653 ?auto_2551656 ) ( CLEAR ?auto_2551653 ) ( not ( = ?auto_2551652 ?auto_2551656 ) ) ( not ( = ?auto_2551653 ?auto_2551656 ) ) ( not ( = ?auto_2551651 ?auto_2551656 ) ) ( TRUCK-AT ?auto_2551658 ?auto_2551655 ) ( ON ?auto_2551643 ?auto_2551642 ) ( ON ?auto_2551644 ?auto_2551643 ) ( ON ?auto_2551646 ?auto_2551644 ) ( ON ?auto_2551645 ?auto_2551646 ) ( ON ?auto_2551647 ?auto_2551645 ) ( ON ?auto_2551648 ?auto_2551647 ) ( ON ?auto_2551649 ?auto_2551648 ) ( ON ?auto_2551650 ?auto_2551649 ) ( ON ?auto_2551651 ?auto_2551650 ) ( not ( = ?auto_2551642 ?auto_2551643 ) ) ( not ( = ?auto_2551642 ?auto_2551644 ) ) ( not ( = ?auto_2551642 ?auto_2551646 ) ) ( not ( = ?auto_2551642 ?auto_2551645 ) ) ( not ( = ?auto_2551642 ?auto_2551647 ) ) ( not ( = ?auto_2551642 ?auto_2551648 ) ) ( not ( = ?auto_2551642 ?auto_2551649 ) ) ( not ( = ?auto_2551642 ?auto_2551650 ) ) ( not ( = ?auto_2551642 ?auto_2551651 ) ) ( not ( = ?auto_2551642 ?auto_2551652 ) ) ( not ( = ?auto_2551642 ?auto_2551653 ) ) ( not ( = ?auto_2551642 ?auto_2551656 ) ) ( not ( = ?auto_2551643 ?auto_2551644 ) ) ( not ( = ?auto_2551643 ?auto_2551646 ) ) ( not ( = ?auto_2551643 ?auto_2551645 ) ) ( not ( = ?auto_2551643 ?auto_2551647 ) ) ( not ( = ?auto_2551643 ?auto_2551648 ) ) ( not ( = ?auto_2551643 ?auto_2551649 ) ) ( not ( = ?auto_2551643 ?auto_2551650 ) ) ( not ( = ?auto_2551643 ?auto_2551651 ) ) ( not ( = ?auto_2551643 ?auto_2551652 ) ) ( not ( = ?auto_2551643 ?auto_2551653 ) ) ( not ( = ?auto_2551643 ?auto_2551656 ) ) ( not ( = ?auto_2551644 ?auto_2551646 ) ) ( not ( = ?auto_2551644 ?auto_2551645 ) ) ( not ( = ?auto_2551644 ?auto_2551647 ) ) ( not ( = ?auto_2551644 ?auto_2551648 ) ) ( not ( = ?auto_2551644 ?auto_2551649 ) ) ( not ( = ?auto_2551644 ?auto_2551650 ) ) ( not ( = ?auto_2551644 ?auto_2551651 ) ) ( not ( = ?auto_2551644 ?auto_2551652 ) ) ( not ( = ?auto_2551644 ?auto_2551653 ) ) ( not ( = ?auto_2551644 ?auto_2551656 ) ) ( not ( = ?auto_2551646 ?auto_2551645 ) ) ( not ( = ?auto_2551646 ?auto_2551647 ) ) ( not ( = ?auto_2551646 ?auto_2551648 ) ) ( not ( = ?auto_2551646 ?auto_2551649 ) ) ( not ( = ?auto_2551646 ?auto_2551650 ) ) ( not ( = ?auto_2551646 ?auto_2551651 ) ) ( not ( = ?auto_2551646 ?auto_2551652 ) ) ( not ( = ?auto_2551646 ?auto_2551653 ) ) ( not ( = ?auto_2551646 ?auto_2551656 ) ) ( not ( = ?auto_2551645 ?auto_2551647 ) ) ( not ( = ?auto_2551645 ?auto_2551648 ) ) ( not ( = ?auto_2551645 ?auto_2551649 ) ) ( not ( = ?auto_2551645 ?auto_2551650 ) ) ( not ( = ?auto_2551645 ?auto_2551651 ) ) ( not ( = ?auto_2551645 ?auto_2551652 ) ) ( not ( = ?auto_2551645 ?auto_2551653 ) ) ( not ( = ?auto_2551645 ?auto_2551656 ) ) ( not ( = ?auto_2551647 ?auto_2551648 ) ) ( not ( = ?auto_2551647 ?auto_2551649 ) ) ( not ( = ?auto_2551647 ?auto_2551650 ) ) ( not ( = ?auto_2551647 ?auto_2551651 ) ) ( not ( = ?auto_2551647 ?auto_2551652 ) ) ( not ( = ?auto_2551647 ?auto_2551653 ) ) ( not ( = ?auto_2551647 ?auto_2551656 ) ) ( not ( = ?auto_2551648 ?auto_2551649 ) ) ( not ( = ?auto_2551648 ?auto_2551650 ) ) ( not ( = ?auto_2551648 ?auto_2551651 ) ) ( not ( = ?auto_2551648 ?auto_2551652 ) ) ( not ( = ?auto_2551648 ?auto_2551653 ) ) ( not ( = ?auto_2551648 ?auto_2551656 ) ) ( not ( = ?auto_2551649 ?auto_2551650 ) ) ( not ( = ?auto_2551649 ?auto_2551651 ) ) ( not ( = ?auto_2551649 ?auto_2551652 ) ) ( not ( = ?auto_2551649 ?auto_2551653 ) ) ( not ( = ?auto_2551649 ?auto_2551656 ) ) ( not ( = ?auto_2551650 ?auto_2551651 ) ) ( not ( = ?auto_2551650 ?auto_2551652 ) ) ( not ( = ?auto_2551650 ?auto_2551653 ) ) ( not ( = ?auto_2551650 ?auto_2551656 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2551651 ?auto_2551652 ?auto_2551653 )
      ( MAKE-11CRATE-VERIFY ?auto_2551642 ?auto_2551643 ?auto_2551644 ?auto_2551646 ?auto_2551645 ?auto_2551647 ?auto_2551648 ?auto_2551649 ?auto_2551650 ?auto_2551651 ?auto_2551652 ?auto_2551653 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2551786 - SURFACE
      ?auto_2551787 - SURFACE
      ?auto_2551788 - SURFACE
      ?auto_2551790 - SURFACE
      ?auto_2551789 - SURFACE
      ?auto_2551791 - SURFACE
      ?auto_2551792 - SURFACE
      ?auto_2551793 - SURFACE
      ?auto_2551794 - SURFACE
      ?auto_2551795 - SURFACE
      ?auto_2551796 - SURFACE
      ?auto_2551797 - SURFACE
    )
    :vars
    (
      ?auto_2551798 - HOIST
      ?auto_2551799 - PLACE
      ?auto_2551803 - PLACE
      ?auto_2551802 - HOIST
      ?auto_2551800 - SURFACE
      ?auto_2551801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2551798 ?auto_2551799 ) ( IS-CRATE ?auto_2551797 ) ( not ( = ?auto_2551796 ?auto_2551797 ) ) ( not ( = ?auto_2551795 ?auto_2551796 ) ) ( not ( = ?auto_2551795 ?auto_2551797 ) ) ( not ( = ?auto_2551803 ?auto_2551799 ) ) ( HOIST-AT ?auto_2551802 ?auto_2551803 ) ( not ( = ?auto_2551798 ?auto_2551802 ) ) ( AVAILABLE ?auto_2551802 ) ( SURFACE-AT ?auto_2551797 ?auto_2551803 ) ( ON ?auto_2551797 ?auto_2551800 ) ( CLEAR ?auto_2551797 ) ( not ( = ?auto_2551796 ?auto_2551800 ) ) ( not ( = ?auto_2551797 ?auto_2551800 ) ) ( not ( = ?auto_2551795 ?auto_2551800 ) ) ( TRUCK-AT ?auto_2551801 ?auto_2551799 ) ( SURFACE-AT ?auto_2551795 ?auto_2551799 ) ( CLEAR ?auto_2551795 ) ( LIFTING ?auto_2551798 ?auto_2551796 ) ( IS-CRATE ?auto_2551796 ) ( ON ?auto_2551787 ?auto_2551786 ) ( ON ?auto_2551788 ?auto_2551787 ) ( ON ?auto_2551790 ?auto_2551788 ) ( ON ?auto_2551789 ?auto_2551790 ) ( ON ?auto_2551791 ?auto_2551789 ) ( ON ?auto_2551792 ?auto_2551791 ) ( ON ?auto_2551793 ?auto_2551792 ) ( ON ?auto_2551794 ?auto_2551793 ) ( ON ?auto_2551795 ?auto_2551794 ) ( not ( = ?auto_2551786 ?auto_2551787 ) ) ( not ( = ?auto_2551786 ?auto_2551788 ) ) ( not ( = ?auto_2551786 ?auto_2551790 ) ) ( not ( = ?auto_2551786 ?auto_2551789 ) ) ( not ( = ?auto_2551786 ?auto_2551791 ) ) ( not ( = ?auto_2551786 ?auto_2551792 ) ) ( not ( = ?auto_2551786 ?auto_2551793 ) ) ( not ( = ?auto_2551786 ?auto_2551794 ) ) ( not ( = ?auto_2551786 ?auto_2551795 ) ) ( not ( = ?auto_2551786 ?auto_2551796 ) ) ( not ( = ?auto_2551786 ?auto_2551797 ) ) ( not ( = ?auto_2551786 ?auto_2551800 ) ) ( not ( = ?auto_2551787 ?auto_2551788 ) ) ( not ( = ?auto_2551787 ?auto_2551790 ) ) ( not ( = ?auto_2551787 ?auto_2551789 ) ) ( not ( = ?auto_2551787 ?auto_2551791 ) ) ( not ( = ?auto_2551787 ?auto_2551792 ) ) ( not ( = ?auto_2551787 ?auto_2551793 ) ) ( not ( = ?auto_2551787 ?auto_2551794 ) ) ( not ( = ?auto_2551787 ?auto_2551795 ) ) ( not ( = ?auto_2551787 ?auto_2551796 ) ) ( not ( = ?auto_2551787 ?auto_2551797 ) ) ( not ( = ?auto_2551787 ?auto_2551800 ) ) ( not ( = ?auto_2551788 ?auto_2551790 ) ) ( not ( = ?auto_2551788 ?auto_2551789 ) ) ( not ( = ?auto_2551788 ?auto_2551791 ) ) ( not ( = ?auto_2551788 ?auto_2551792 ) ) ( not ( = ?auto_2551788 ?auto_2551793 ) ) ( not ( = ?auto_2551788 ?auto_2551794 ) ) ( not ( = ?auto_2551788 ?auto_2551795 ) ) ( not ( = ?auto_2551788 ?auto_2551796 ) ) ( not ( = ?auto_2551788 ?auto_2551797 ) ) ( not ( = ?auto_2551788 ?auto_2551800 ) ) ( not ( = ?auto_2551790 ?auto_2551789 ) ) ( not ( = ?auto_2551790 ?auto_2551791 ) ) ( not ( = ?auto_2551790 ?auto_2551792 ) ) ( not ( = ?auto_2551790 ?auto_2551793 ) ) ( not ( = ?auto_2551790 ?auto_2551794 ) ) ( not ( = ?auto_2551790 ?auto_2551795 ) ) ( not ( = ?auto_2551790 ?auto_2551796 ) ) ( not ( = ?auto_2551790 ?auto_2551797 ) ) ( not ( = ?auto_2551790 ?auto_2551800 ) ) ( not ( = ?auto_2551789 ?auto_2551791 ) ) ( not ( = ?auto_2551789 ?auto_2551792 ) ) ( not ( = ?auto_2551789 ?auto_2551793 ) ) ( not ( = ?auto_2551789 ?auto_2551794 ) ) ( not ( = ?auto_2551789 ?auto_2551795 ) ) ( not ( = ?auto_2551789 ?auto_2551796 ) ) ( not ( = ?auto_2551789 ?auto_2551797 ) ) ( not ( = ?auto_2551789 ?auto_2551800 ) ) ( not ( = ?auto_2551791 ?auto_2551792 ) ) ( not ( = ?auto_2551791 ?auto_2551793 ) ) ( not ( = ?auto_2551791 ?auto_2551794 ) ) ( not ( = ?auto_2551791 ?auto_2551795 ) ) ( not ( = ?auto_2551791 ?auto_2551796 ) ) ( not ( = ?auto_2551791 ?auto_2551797 ) ) ( not ( = ?auto_2551791 ?auto_2551800 ) ) ( not ( = ?auto_2551792 ?auto_2551793 ) ) ( not ( = ?auto_2551792 ?auto_2551794 ) ) ( not ( = ?auto_2551792 ?auto_2551795 ) ) ( not ( = ?auto_2551792 ?auto_2551796 ) ) ( not ( = ?auto_2551792 ?auto_2551797 ) ) ( not ( = ?auto_2551792 ?auto_2551800 ) ) ( not ( = ?auto_2551793 ?auto_2551794 ) ) ( not ( = ?auto_2551793 ?auto_2551795 ) ) ( not ( = ?auto_2551793 ?auto_2551796 ) ) ( not ( = ?auto_2551793 ?auto_2551797 ) ) ( not ( = ?auto_2551793 ?auto_2551800 ) ) ( not ( = ?auto_2551794 ?auto_2551795 ) ) ( not ( = ?auto_2551794 ?auto_2551796 ) ) ( not ( = ?auto_2551794 ?auto_2551797 ) ) ( not ( = ?auto_2551794 ?auto_2551800 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2551795 ?auto_2551796 ?auto_2551797 )
      ( MAKE-11CRATE-VERIFY ?auto_2551786 ?auto_2551787 ?auto_2551788 ?auto_2551790 ?auto_2551789 ?auto_2551791 ?auto_2551792 ?auto_2551793 ?auto_2551794 ?auto_2551795 ?auto_2551796 ?auto_2551797 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2551930 - SURFACE
      ?auto_2551931 - SURFACE
      ?auto_2551932 - SURFACE
      ?auto_2551934 - SURFACE
      ?auto_2551933 - SURFACE
      ?auto_2551935 - SURFACE
      ?auto_2551936 - SURFACE
      ?auto_2551937 - SURFACE
      ?auto_2551938 - SURFACE
      ?auto_2551939 - SURFACE
      ?auto_2551940 - SURFACE
      ?auto_2551941 - SURFACE
    )
    :vars
    (
      ?auto_2551947 - HOIST
      ?auto_2551943 - PLACE
      ?auto_2551946 - PLACE
      ?auto_2551944 - HOIST
      ?auto_2551942 - SURFACE
      ?auto_2551945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2551947 ?auto_2551943 ) ( IS-CRATE ?auto_2551941 ) ( not ( = ?auto_2551940 ?auto_2551941 ) ) ( not ( = ?auto_2551939 ?auto_2551940 ) ) ( not ( = ?auto_2551939 ?auto_2551941 ) ) ( not ( = ?auto_2551946 ?auto_2551943 ) ) ( HOIST-AT ?auto_2551944 ?auto_2551946 ) ( not ( = ?auto_2551947 ?auto_2551944 ) ) ( AVAILABLE ?auto_2551944 ) ( SURFACE-AT ?auto_2551941 ?auto_2551946 ) ( ON ?auto_2551941 ?auto_2551942 ) ( CLEAR ?auto_2551941 ) ( not ( = ?auto_2551940 ?auto_2551942 ) ) ( not ( = ?auto_2551941 ?auto_2551942 ) ) ( not ( = ?auto_2551939 ?auto_2551942 ) ) ( TRUCK-AT ?auto_2551945 ?auto_2551943 ) ( SURFACE-AT ?auto_2551939 ?auto_2551943 ) ( CLEAR ?auto_2551939 ) ( IS-CRATE ?auto_2551940 ) ( AVAILABLE ?auto_2551947 ) ( IN ?auto_2551940 ?auto_2551945 ) ( ON ?auto_2551931 ?auto_2551930 ) ( ON ?auto_2551932 ?auto_2551931 ) ( ON ?auto_2551934 ?auto_2551932 ) ( ON ?auto_2551933 ?auto_2551934 ) ( ON ?auto_2551935 ?auto_2551933 ) ( ON ?auto_2551936 ?auto_2551935 ) ( ON ?auto_2551937 ?auto_2551936 ) ( ON ?auto_2551938 ?auto_2551937 ) ( ON ?auto_2551939 ?auto_2551938 ) ( not ( = ?auto_2551930 ?auto_2551931 ) ) ( not ( = ?auto_2551930 ?auto_2551932 ) ) ( not ( = ?auto_2551930 ?auto_2551934 ) ) ( not ( = ?auto_2551930 ?auto_2551933 ) ) ( not ( = ?auto_2551930 ?auto_2551935 ) ) ( not ( = ?auto_2551930 ?auto_2551936 ) ) ( not ( = ?auto_2551930 ?auto_2551937 ) ) ( not ( = ?auto_2551930 ?auto_2551938 ) ) ( not ( = ?auto_2551930 ?auto_2551939 ) ) ( not ( = ?auto_2551930 ?auto_2551940 ) ) ( not ( = ?auto_2551930 ?auto_2551941 ) ) ( not ( = ?auto_2551930 ?auto_2551942 ) ) ( not ( = ?auto_2551931 ?auto_2551932 ) ) ( not ( = ?auto_2551931 ?auto_2551934 ) ) ( not ( = ?auto_2551931 ?auto_2551933 ) ) ( not ( = ?auto_2551931 ?auto_2551935 ) ) ( not ( = ?auto_2551931 ?auto_2551936 ) ) ( not ( = ?auto_2551931 ?auto_2551937 ) ) ( not ( = ?auto_2551931 ?auto_2551938 ) ) ( not ( = ?auto_2551931 ?auto_2551939 ) ) ( not ( = ?auto_2551931 ?auto_2551940 ) ) ( not ( = ?auto_2551931 ?auto_2551941 ) ) ( not ( = ?auto_2551931 ?auto_2551942 ) ) ( not ( = ?auto_2551932 ?auto_2551934 ) ) ( not ( = ?auto_2551932 ?auto_2551933 ) ) ( not ( = ?auto_2551932 ?auto_2551935 ) ) ( not ( = ?auto_2551932 ?auto_2551936 ) ) ( not ( = ?auto_2551932 ?auto_2551937 ) ) ( not ( = ?auto_2551932 ?auto_2551938 ) ) ( not ( = ?auto_2551932 ?auto_2551939 ) ) ( not ( = ?auto_2551932 ?auto_2551940 ) ) ( not ( = ?auto_2551932 ?auto_2551941 ) ) ( not ( = ?auto_2551932 ?auto_2551942 ) ) ( not ( = ?auto_2551934 ?auto_2551933 ) ) ( not ( = ?auto_2551934 ?auto_2551935 ) ) ( not ( = ?auto_2551934 ?auto_2551936 ) ) ( not ( = ?auto_2551934 ?auto_2551937 ) ) ( not ( = ?auto_2551934 ?auto_2551938 ) ) ( not ( = ?auto_2551934 ?auto_2551939 ) ) ( not ( = ?auto_2551934 ?auto_2551940 ) ) ( not ( = ?auto_2551934 ?auto_2551941 ) ) ( not ( = ?auto_2551934 ?auto_2551942 ) ) ( not ( = ?auto_2551933 ?auto_2551935 ) ) ( not ( = ?auto_2551933 ?auto_2551936 ) ) ( not ( = ?auto_2551933 ?auto_2551937 ) ) ( not ( = ?auto_2551933 ?auto_2551938 ) ) ( not ( = ?auto_2551933 ?auto_2551939 ) ) ( not ( = ?auto_2551933 ?auto_2551940 ) ) ( not ( = ?auto_2551933 ?auto_2551941 ) ) ( not ( = ?auto_2551933 ?auto_2551942 ) ) ( not ( = ?auto_2551935 ?auto_2551936 ) ) ( not ( = ?auto_2551935 ?auto_2551937 ) ) ( not ( = ?auto_2551935 ?auto_2551938 ) ) ( not ( = ?auto_2551935 ?auto_2551939 ) ) ( not ( = ?auto_2551935 ?auto_2551940 ) ) ( not ( = ?auto_2551935 ?auto_2551941 ) ) ( not ( = ?auto_2551935 ?auto_2551942 ) ) ( not ( = ?auto_2551936 ?auto_2551937 ) ) ( not ( = ?auto_2551936 ?auto_2551938 ) ) ( not ( = ?auto_2551936 ?auto_2551939 ) ) ( not ( = ?auto_2551936 ?auto_2551940 ) ) ( not ( = ?auto_2551936 ?auto_2551941 ) ) ( not ( = ?auto_2551936 ?auto_2551942 ) ) ( not ( = ?auto_2551937 ?auto_2551938 ) ) ( not ( = ?auto_2551937 ?auto_2551939 ) ) ( not ( = ?auto_2551937 ?auto_2551940 ) ) ( not ( = ?auto_2551937 ?auto_2551941 ) ) ( not ( = ?auto_2551937 ?auto_2551942 ) ) ( not ( = ?auto_2551938 ?auto_2551939 ) ) ( not ( = ?auto_2551938 ?auto_2551940 ) ) ( not ( = ?auto_2551938 ?auto_2551941 ) ) ( not ( = ?auto_2551938 ?auto_2551942 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2551939 ?auto_2551940 ?auto_2551941 )
      ( MAKE-11CRATE-VERIFY ?auto_2551930 ?auto_2551931 ?auto_2551932 ?auto_2551934 ?auto_2551933 ?auto_2551935 ?auto_2551936 ?auto_2551937 ?auto_2551938 ?auto_2551939 ?auto_2551940 ?auto_2551941 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2561221 - SURFACE
      ?auto_2561222 - SURFACE
      ?auto_2561223 - SURFACE
      ?auto_2561225 - SURFACE
      ?auto_2561224 - SURFACE
      ?auto_2561226 - SURFACE
      ?auto_2561227 - SURFACE
      ?auto_2561228 - SURFACE
      ?auto_2561229 - SURFACE
      ?auto_2561230 - SURFACE
      ?auto_2561231 - SURFACE
      ?auto_2561232 - SURFACE
      ?auto_2561233 - SURFACE
    )
    :vars
    (
      ?auto_2561235 - HOIST
      ?auto_2561234 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2561235 ?auto_2561234 ) ( SURFACE-AT ?auto_2561232 ?auto_2561234 ) ( CLEAR ?auto_2561232 ) ( LIFTING ?auto_2561235 ?auto_2561233 ) ( IS-CRATE ?auto_2561233 ) ( not ( = ?auto_2561232 ?auto_2561233 ) ) ( ON ?auto_2561222 ?auto_2561221 ) ( ON ?auto_2561223 ?auto_2561222 ) ( ON ?auto_2561225 ?auto_2561223 ) ( ON ?auto_2561224 ?auto_2561225 ) ( ON ?auto_2561226 ?auto_2561224 ) ( ON ?auto_2561227 ?auto_2561226 ) ( ON ?auto_2561228 ?auto_2561227 ) ( ON ?auto_2561229 ?auto_2561228 ) ( ON ?auto_2561230 ?auto_2561229 ) ( ON ?auto_2561231 ?auto_2561230 ) ( ON ?auto_2561232 ?auto_2561231 ) ( not ( = ?auto_2561221 ?auto_2561222 ) ) ( not ( = ?auto_2561221 ?auto_2561223 ) ) ( not ( = ?auto_2561221 ?auto_2561225 ) ) ( not ( = ?auto_2561221 ?auto_2561224 ) ) ( not ( = ?auto_2561221 ?auto_2561226 ) ) ( not ( = ?auto_2561221 ?auto_2561227 ) ) ( not ( = ?auto_2561221 ?auto_2561228 ) ) ( not ( = ?auto_2561221 ?auto_2561229 ) ) ( not ( = ?auto_2561221 ?auto_2561230 ) ) ( not ( = ?auto_2561221 ?auto_2561231 ) ) ( not ( = ?auto_2561221 ?auto_2561232 ) ) ( not ( = ?auto_2561221 ?auto_2561233 ) ) ( not ( = ?auto_2561222 ?auto_2561223 ) ) ( not ( = ?auto_2561222 ?auto_2561225 ) ) ( not ( = ?auto_2561222 ?auto_2561224 ) ) ( not ( = ?auto_2561222 ?auto_2561226 ) ) ( not ( = ?auto_2561222 ?auto_2561227 ) ) ( not ( = ?auto_2561222 ?auto_2561228 ) ) ( not ( = ?auto_2561222 ?auto_2561229 ) ) ( not ( = ?auto_2561222 ?auto_2561230 ) ) ( not ( = ?auto_2561222 ?auto_2561231 ) ) ( not ( = ?auto_2561222 ?auto_2561232 ) ) ( not ( = ?auto_2561222 ?auto_2561233 ) ) ( not ( = ?auto_2561223 ?auto_2561225 ) ) ( not ( = ?auto_2561223 ?auto_2561224 ) ) ( not ( = ?auto_2561223 ?auto_2561226 ) ) ( not ( = ?auto_2561223 ?auto_2561227 ) ) ( not ( = ?auto_2561223 ?auto_2561228 ) ) ( not ( = ?auto_2561223 ?auto_2561229 ) ) ( not ( = ?auto_2561223 ?auto_2561230 ) ) ( not ( = ?auto_2561223 ?auto_2561231 ) ) ( not ( = ?auto_2561223 ?auto_2561232 ) ) ( not ( = ?auto_2561223 ?auto_2561233 ) ) ( not ( = ?auto_2561225 ?auto_2561224 ) ) ( not ( = ?auto_2561225 ?auto_2561226 ) ) ( not ( = ?auto_2561225 ?auto_2561227 ) ) ( not ( = ?auto_2561225 ?auto_2561228 ) ) ( not ( = ?auto_2561225 ?auto_2561229 ) ) ( not ( = ?auto_2561225 ?auto_2561230 ) ) ( not ( = ?auto_2561225 ?auto_2561231 ) ) ( not ( = ?auto_2561225 ?auto_2561232 ) ) ( not ( = ?auto_2561225 ?auto_2561233 ) ) ( not ( = ?auto_2561224 ?auto_2561226 ) ) ( not ( = ?auto_2561224 ?auto_2561227 ) ) ( not ( = ?auto_2561224 ?auto_2561228 ) ) ( not ( = ?auto_2561224 ?auto_2561229 ) ) ( not ( = ?auto_2561224 ?auto_2561230 ) ) ( not ( = ?auto_2561224 ?auto_2561231 ) ) ( not ( = ?auto_2561224 ?auto_2561232 ) ) ( not ( = ?auto_2561224 ?auto_2561233 ) ) ( not ( = ?auto_2561226 ?auto_2561227 ) ) ( not ( = ?auto_2561226 ?auto_2561228 ) ) ( not ( = ?auto_2561226 ?auto_2561229 ) ) ( not ( = ?auto_2561226 ?auto_2561230 ) ) ( not ( = ?auto_2561226 ?auto_2561231 ) ) ( not ( = ?auto_2561226 ?auto_2561232 ) ) ( not ( = ?auto_2561226 ?auto_2561233 ) ) ( not ( = ?auto_2561227 ?auto_2561228 ) ) ( not ( = ?auto_2561227 ?auto_2561229 ) ) ( not ( = ?auto_2561227 ?auto_2561230 ) ) ( not ( = ?auto_2561227 ?auto_2561231 ) ) ( not ( = ?auto_2561227 ?auto_2561232 ) ) ( not ( = ?auto_2561227 ?auto_2561233 ) ) ( not ( = ?auto_2561228 ?auto_2561229 ) ) ( not ( = ?auto_2561228 ?auto_2561230 ) ) ( not ( = ?auto_2561228 ?auto_2561231 ) ) ( not ( = ?auto_2561228 ?auto_2561232 ) ) ( not ( = ?auto_2561228 ?auto_2561233 ) ) ( not ( = ?auto_2561229 ?auto_2561230 ) ) ( not ( = ?auto_2561229 ?auto_2561231 ) ) ( not ( = ?auto_2561229 ?auto_2561232 ) ) ( not ( = ?auto_2561229 ?auto_2561233 ) ) ( not ( = ?auto_2561230 ?auto_2561231 ) ) ( not ( = ?auto_2561230 ?auto_2561232 ) ) ( not ( = ?auto_2561230 ?auto_2561233 ) ) ( not ( = ?auto_2561231 ?auto_2561232 ) ) ( not ( = ?auto_2561231 ?auto_2561233 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2561232 ?auto_2561233 )
      ( MAKE-12CRATE-VERIFY ?auto_2561221 ?auto_2561222 ?auto_2561223 ?auto_2561225 ?auto_2561224 ?auto_2561226 ?auto_2561227 ?auto_2561228 ?auto_2561229 ?auto_2561230 ?auto_2561231 ?auto_2561232 ?auto_2561233 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2561346 - SURFACE
      ?auto_2561347 - SURFACE
      ?auto_2561348 - SURFACE
      ?auto_2561350 - SURFACE
      ?auto_2561349 - SURFACE
      ?auto_2561351 - SURFACE
      ?auto_2561352 - SURFACE
      ?auto_2561353 - SURFACE
      ?auto_2561354 - SURFACE
      ?auto_2561355 - SURFACE
      ?auto_2561356 - SURFACE
      ?auto_2561357 - SURFACE
      ?auto_2561358 - SURFACE
    )
    :vars
    (
      ?auto_2561361 - HOIST
      ?auto_2561360 - PLACE
      ?auto_2561359 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2561361 ?auto_2561360 ) ( SURFACE-AT ?auto_2561357 ?auto_2561360 ) ( CLEAR ?auto_2561357 ) ( IS-CRATE ?auto_2561358 ) ( not ( = ?auto_2561357 ?auto_2561358 ) ) ( TRUCK-AT ?auto_2561359 ?auto_2561360 ) ( AVAILABLE ?auto_2561361 ) ( IN ?auto_2561358 ?auto_2561359 ) ( ON ?auto_2561357 ?auto_2561356 ) ( not ( = ?auto_2561356 ?auto_2561357 ) ) ( not ( = ?auto_2561356 ?auto_2561358 ) ) ( ON ?auto_2561347 ?auto_2561346 ) ( ON ?auto_2561348 ?auto_2561347 ) ( ON ?auto_2561350 ?auto_2561348 ) ( ON ?auto_2561349 ?auto_2561350 ) ( ON ?auto_2561351 ?auto_2561349 ) ( ON ?auto_2561352 ?auto_2561351 ) ( ON ?auto_2561353 ?auto_2561352 ) ( ON ?auto_2561354 ?auto_2561353 ) ( ON ?auto_2561355 ?auto_2561354 ) ( ON ?auto_2561356 ?auto_2561355 ) ( not ( = ?auto_2561346 ?auto_2561347 ) ) ( not ( = ?auto_2561346 ?auto_2561348 ) ) ( not ( = ?auto_2561346 ?auto_2561350 ) ) ( not ( = ?auto_2561346 ?auto_2561349 ) ) ( not ( = ?auto_2561346 ?auto_2561351 ) ) ( not ( = ?auto_2561346 ?auto_2561352 ) ) ( not ( = ?auto_2561346 ?auto_2561353 ) ) ( not ( = ?auto_2561346 ?auto_2561354 ) ) ( not ( = ?auto_2561346 ?auto_2561355 ) ) ( not ( = ?auto_2561346 ?auto_2561356 ) ) ( not ( = ?auto_2561346 ?auto_2561357 ) ) ( not ( = ?auto_2561346 ?auto_2561358 ) ) ( not ( = ?auto_2561347 ?auto_2561348 ) ) ( not ( = ?auto_2561347 ?auto_2561350 ) ) ( not ( = ?auto_2561347 ?auto_2561349 ) ) ( not ( = ?auto_2561347 ?auto_2561351 ) ) ( not ( = ?auto_2561347 ?auto_2561352 ) ) ( not ( = ?auto_2561347 ?auto_2561353 ) ) ( not ( = ?auto_2561347 ?auto_2561354 ) ) ( not ( = ?auto_2561347 ?auto_2561355 ) ) ( not ( = ?auto_2561347 ?auto_2561356 ) ) ( not ( = ?auto_2561347 ?auto_2561357 ) ) ( not ( = ?auto_2561347 ?auto_2561358 ) ) ( not ( = ?auto_2561348 ?auto_2561350 ) ) ( not ( = ?auto_2561348 ?auto_2561349 ) ) ( not ( = ?auto_2561348 ?auto_2561351 ) ) ( not ( = ?auto_2561348 ?auto_2561352 ) ) ( not ( = ?auto_2561348 ?auto_2561353 ) ) ( not ( = ?auto_2561348 ?auto_2561354 ) ) ( not ( = ?auto_2561348 ?auto_2561355 ) ) ( not ( = ?auto_2561348 ?auto_2561356 ) ) ( not ( = ?auto_2561348 ?auto_2561357 ) ) ( not ( = ?auto_2561348 ?auto_2561358 ) ) ( not ( = ?auto_2561350 ?auto_2561349 ) ) ( not ( = ?auto_2561350 ?auto_2561351 ) ) ( not ( = ?auto_2561350 ?auto_2561352 ) ) ( not ( = ?auto_2561350 ?auto_2561353 ) ) ( not ( = ?auto_2561350 ?auto_2561354 ) ) ( not ( = ?auto_2561350 ?auto_2561355 ) ) ( not ( = ?auto_2561350 ?auto_2561356 ) ) ( not ( = ?auto_2561350 ?auto_2561357 ) ) ( not ( = ?auto_2561350 ?auto_2561358 ) ) ( not ( = ?auto_2561349 ?auto_2561351 ) ) ( not ( = ?auto_2561349 ?auto_2561352 ) ) ( not ( = ?auto_2561349 ?auto_2561353 ) ) ( not ( = ?auto_2561349 ?auto_2561354 ) ) ( not ( = ?auto_2561349 ?auto_2561355 ) ) ( not ( = ?auto_2561349 ?auto_2561356 ) ) ( not ( = ?auto_2561349 ?auto_2561357 ) ) ( not ( = ?auto_2561349 ?auto_2561358 ) ) ( not ( = ?auto_2561351 ?auto_2561352 ) ) ( not ( = ?auto_2561351 ?auto_2561353 ) ) ( not ( = ?auto_2561351 ?auto_2561354 ) ) ( not ( = ?auto_2561351 ?auto_2561355 ) ) ( not ( = ?auto_2561351 ?auto_2561356 ) ) ( not ( = ?auto_2561351 ?auto_2561357 ) ) ( not ( = ?auto_2561351 ?auto_2561358 ) ) ( not ( = ?auto_2561352 ?auto_2561353 ) ) ( not ( = ?auto_2561352 ?auto_2561354 ) ) ( not ( = ?auto_2561352 ?auto_2561355 ) ) ( not ( = ?auto_2561352 ?auto_2561356 ) ) ( not ( = ?auto_2561352 ?auto_2561357 ) ) ( not ( = ?auto_2561352 ?auto_2561358 ) ) ( not ( = ?auto_2561353 ?auto_2561354 ) ) ( not ( = ?auto_2561353 ?auto_2561355 ) ) ( not ( = ?auto_2561353 ?auto_2561356 ) ) ( not ( = ?auto_2561353 ?auto_2561357 ) ) ( not ( = ?auto_2561353 ?auto_2561358 ) ) ( not ( = ?auto_2561354 ?auto_2561355 ) ) ( not ( = ?auto_2561354 ?auto_2561356 ) ) ( not ( = ?auto_2561354 ?auto_2561357 ) ) ( not ( = ?auto_2561354 ?auto_2561358 ) ) ( not ( = ?auto_2561355 ?auto_2561356 ) ) ( not ( = ?auto_2561355 ?auto_2561357 ) ) ( not ( = ?auto_2561355 ?auto_2561358 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2561356 ?auto_2561357 ?auto_2561358 )
      ( MAKE-12CRATE-VERIFY ?auto_2561346 ?auto_2561347 ?auto_2561348 ?auto_2561350 ?auto_2561349 ?auto_2561351 ?auto_2561352 ?auto_2561353 ?auto_2561354 ?auto_2561355 ?auto_2561356 ?auto_2561357 ?auto_2561358 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2561484 - SURFACE
      ?auto_2561485 - SURFACE
      ?auto_2561486 - SURFACE
      ?auto_2561488 - SURFACE
      ?auto_2561487 - SURFACE
      ?auto_2561489 - SURFACE
      ?auto_2561490 - SURFACE
      ?auto_2561491 - SURFACE
      ?auto_2561492 - SURFACE
      ?auto_2561493 - SURFACE
      ?auto_2561494 - SURFACE
      ?auto_2561495 - SURFACE
      ?auto_2561496 - SURFACE
    )
    :vars
    (
      ?auto_2561498 - HOIST
      ?auto_2561497 - PLACE
      ?auto_2561500 - TRUCK
      ?auto_2561499 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2561498 ?auto_2561497 ) ( SURFACE-AT ?auto_2561495 ?auto_2561497 ) ( CLEAR ?auto_2561495 ) ( IS-CRATE ?auto_2561496 ) ( not ( = ?auto_2561495 ?auto_2561496 ) ) ( AVAILABLE ?auto_2561498 ) ( IN ?auto_2561496 ?auto_2561500 ) ( ON ?auto_2561495 ?auto_2561494 ) ( not ( = ?auto_2561494 ?auto_2561495 ) ) ( not ( = ?auto_2561494 ?auto_2561496 ) ) ( TRUCK-AT ?auto_2561500 ?auto_2561499 ) ( not ( = ?auto_2561499 ?auto_2561497 ) ) ( ON ?auto_2561485 ?auto_2561484 ) ( ON ?auto_2561486 ?auto_2561485 ) ( ON ?auto_2561488 ?auto_2561486 ) ( ON ?auto_2561487 ?auto_2561488 ) ( ON ?auto_2561489 ?auto_2561487 ) ( ON ?auto_2561490 ?auto_2561489 ) ( ON ?auto_2561491 ?auto_2561490 ) ( ON ?auto_2561492 ?auto_2561491 ) ( ON ?auto_2561493 ?auto_2561492 ) ( ON ?auto_2561494 ?auto_2561493 ) ( not ( = ?auto_2561484 ?auto_2561485 ) ) ( not ( = ?auto_2561484 ?auto_2561486 ) ) ( not ( = ?auto_2561484 ?auto_2561488 ) ) ( not ( = ?auto_2561484 ?auto_2561487 ) ) ( not ( = ?auto_2561484 ?auto_2561489 ) ) ( not ( = ?auto_2561484 ?auto_2561490 ) ) ( not ( = ?auto_2561484 ?auto_2561491 ) ) ( not ( = ?auto_2561484 ?auto_2561492 ) ) ( not ( = ?auto_2561484 ?auto_2561493 ) ) ( not ( = ?auto_2561484 ?auto_2561494 ) ) ( not ( = ?auto_2561484 ?auto_2561495 ) ) ( not ( = ?auto_2561484 ?auto_2561496 ) ) ( not ( = ?auto_2561485 ?auto_2561486 ) ) ( not ( = ?auto_2561485 ?auto_2561488 ) ) ( not ( = ?auto_2561485 ?auto_2561487 ) ) ( not ( = ?auto_2561485 ?auto_2561489 ) ) ( not ( = ?auto_2561485 ?auto_2561490 ) ) ( not ( = ?auto_2561485 ?auto_2561491 ) ) ( not ( = ?auto_2561485 ?auto_2561492 ) ) ( not ( = ?auto_2561485 ?auto_2561493 ) ) ( not ( = ?auto_2561485 ?auto_2561494 ) ) ( not ( = ?auto_2561485 ?auto_2561495 ) ) ( not ( = ?auto_2561485 ?auto_2561496 ) ) ( not ( = ?auto_2561486 ?auto_2561488 ) ) ( not ( = ?auto_2561486 ?auto_2561487 ) ) ( not ( = ?auto_2561486 ?auto_2561489 ) ) ( not ( = ?auto_2561486 ?auto_2561490 ) ) ( not ( = ?auto_2561486 ?auto_2561491 ) ) ( not ( = ?auto_2561486 ?auto_2561492 ) ) ( not ( = ?auto_2561486 ?auto_2561493 ) ) ( not ( = ?auto_2561486 ?auto_2561494 ) ) ( not ( = ?auto_2561486 ?auto_2561495 ) ) ( not ( = ?auto_2561486 ?auto_2561496 ) ) ( not ( = ?auto_2561488 ?auto_2561487 ) ) ( not ( = ?auto_2561488 ?auto_2561489 ) ) ( not ( = ?auto_2561488 ?auto_2561490 ) ) ( not ( = ?auto_2561488 ?auto_2561491 ) ) ( not ( = ?auto_2561488 ?auto_2561492 ) ) ( not ( = ?auto_2561488 ?auto_2561493 ) ) ( not ( = ?auto_2561488 ?auto_2561494 ) ) ( not ( = ?auto_2561488 ?auto_2561495 ) ) ( not ( = ?auto_2561488 ?auto_2561496 ) ) ( not ( = ?auto_2561487 ?auto_2561489 ) ) ( not ( = ?auto_2561487 ?auto_2561490 ) ) ( not ( = ?auto_2561487 ?auto_2561491 ) ) ( not ( = ?auto_2561487 ?auto_2561492 ) ) ( not ( = ?auto_2561487 ?auto_2561493 ) ) ( not ( = ?auto_2561487 ?auto_2561494 ) ) ( not ( = ?auto_2561487 ?auto_2561495 ) ) ( not ( = ?auto_2561487 ?auto_2561496 ) ) ( not ( = ?auto_2561489 ?auto_2561490 ) ) ( not ( = ?auto_2561489 ?auto_2561491 ) ) ( not ( = ?auto_2561489 ?auto_2561492 ) ) ( not ( = ?auto_2561489 ?auto_2561493 ) ) ( not ( = ?auto_2561489 ?auto_2561494 ) ) ( not ( = ?auto_2561489 ?auto_2561495 ) ) ( not ( = ?auto_2561489 ?auto_2561496 ) ) ( not ( = ?auto_2561490 ?auto_2561491 ) ) ( not ( = ?auto_2561490 ?auto_2561492 ) ) ( not ( = ?auto_2561490 ?auto_2561493 ) ) ( not ( = ?auto_2561490 ?auto_2561494 ) ) ( not ( = ?auto_2561490 ?auto_2561495 ) ) ( not ( = ?auto_2561490 ?auto_2561496 ) ) ( not ( = ?auto_2561491 ?auto_2561492 ) ) ( not ( = ?auto_2561491 ?auto_2561493 ) ) ( not ( = ?auto_2561491 ?auto_2561494 ) ) ( not ( = ?auto_2561491 ?auto_2561495 ) ) ( not ( = ?auto_2561491 ?auto_2561496 ) ) ( not ( = ?auto_2561492 ?auto_2561493 ) ) ( not ( = ?auto_2561492 ?auto_2561494 ) ) ( not ( = ?auto_2561492 ?auto_2561495 ) ) ( not ( = ?auto_2561492 ?auto_2561496 ) ) ( not ( = ?auto_2561493 ?auto_2561494 ) ) ( not ( = ?auto_2561493 ?auto_2561495 ) ) ( not ( = ?auto_2561493 ?auto_2561496 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2561494 ?auto_2561495 ?auto_2561496 )
      ( MAKE-12CRATE-VERIFY ?auto_2561484 ?auto_2561485 ?auto_2561486 ?auto_2561488 ?auto_2561487 ?auto_2561489 ?auto_2561490 ?auto_2561491 ?auto_2561492 ?auto_2561493 ?auto_2561494 ?auto_2561495 ?auto_2561496 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2561634 - SURFACE
      ?auto_2561635 - SURFACE
      ?auto_2561636 - SURFACE
      ?auto_2561638 - SURFACE
      ?auto_2561637 - SURFACE
      ?auto_2561639 - SURFACE
      ?auto_2561640 - SURFACE
      ?auto_2561641 - SURFACE
      ?auto_2561642 - SURFACE
      ?auto_2561643 - SURFACE
      ?auto_2561644 - SURFACE
      ?auto_2561645 - SURFACE
      ?auto_2561646 - SURFACE
    )
    :vars
    (
      ?auto_2561651 - HOIST
      ?auto_2561648 - PLACE
      ?auto_2561649 - TRUCK
      ?auto_2561650 - PLACE
      ?auto_2561647 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2561651 ?auto_2561648 ) ( SURFACE-AT ?auto_2561645 ?auto_2561648 ) ( CLEAR ?auto_2561645 ) ( IS-CRATE ?auto_2561646 ) ( not ( = ?auto_2561645 ?auto_2561646 ) ) ( AVAILABLE ?auto_2561651 ) ( ON ?auto_2561645 ?auto_2561644 ) ( not ( = ?auto_2561644 ?auto_2561645 ) ) ( not ( = ?auto_2561644 ?auto_2561646 ) ) ( TRUCK-AT ?auto_2561649 ?auto_2561650 ) ( not ( = ?auto_2561650 ?auto_2561648 ) ) ( HOIST-AT ?auto_2561647 ?auto_2561650 ) ( LIFTING ?auto_2561647 ?auto_2561646 ) ( not ( = ?auto_2561651 ?auto_2561647 ) ) ( ON ?auto_2561635 ?auto_2561634 ) ( ON ?auto_2561636 ?auto_2561635 ) ( ON ?auto_2561638 ?auto_2561636 ) ( ON ?auto_2561637 ?auto_2561638 ) ( ON ?auto_2561639 ?auto_2561637 ) ( ON ?auto_2561640 ?auto_2561639 ) ( ON ?auto_2561641 ?auto_2561640 ) ( ON ?auto_2561642 ?auto_2561641 ) ( ON ?auto_2561643 ?auto_2561642 ) ( ON ?auto_2561644 ?auto_2561643 ) ( not ( = ?auto_2561634 ?auto_2561635 ) ) ( not ( = ?auto_2561634 ?auto_2561636 ) ) ( not ( = ?auto_2561634 ?auto_2561638 ) ) ( not ( = ?auto_2561634 ?auto_2561637 ) ) ( not ( = ?auto_2561634 ?auto_2561639 ) ) ( not ( = ?auto_2561634 ?auto_2561640 ) ) ( not ( = ?auto_2561634 ?auto_2561641 ) ) ( not ( = ?auto_2561634 ?auto_2561642 ) ) ( not ( = ?auto_2561634 ?auto_2561643 ) ) ( not ( = ?auto_2561634 ?auto_2561644 ) ) ( not ( = ?auto_2561634 ?auto_2561645 ) ) ( not ( = ?auto_2561634 ?auto_2561646 ) ) ( not ( = ?auto_2561635 ?auto_2561636 ) ) ( not ( = ?auto_2561635 ?auto_2561638 ) ) ( not ( = ?auto_2561635 ?auto_2561637 ) ) ( not ( = ?auto_2561635 ?auto_2561639 ) ) ( not ( = ?auto_2561635 ?auto_2561640 ) ) ( not ( = ?auto_2561635 ?auto_2561641 ) ) ( not ( = ?auto_2561635 ?auto_2561642 ) ) ( not ( = ?auto_2561635 ?auto_2561643 ) ) ( not ( = ?auto_2561635 ?auto_2561644 ) ) ( not ( = ?auto_2561635 ?auto_2561645 ) ) ( not ( = ?auto_2561635 ?auto_2561646 ) ) ( not ( = ?auto_2561636 ?auto_2561638 ) ) ( not ( = ?auto_2561636 ?auto_2561637 ) ) ( not ( = ?auto_2561636 ?auto_2561639 ) ) ( not ( = ?auto_2561636 ?auto_2561640 ) ) ( not ( = ?auto_2561636 ?auto_2561641 ) ) ( not ( = ?auto_2561636 ?auto_2561642 ) ) ( not ( = ?auto_2561636 ?auto_2561643 ) ) ( not ( = ?auto_2561636 ?auto_2561644 ) ) ( not ( = ?auto_2561636 ?auto_2561645 ) ) ( not ( = ?auto_2561636 ?auto_2561646 ) ) ( not ( = ?auto_2561638 ?auto_2561637 ) ) ( not ( = ?auto_2561638 ?auto_2561639 ) ) ( not ( = ?auto_2561638 ?auto_2561640 ) ) ( not ( = ?auto_2561638 ?auto_2561641 ) ) ( not ( = ?auto_2561638 ?auto_2561642 ) ) ( not ( = ?auto_2561638 ?auto_2561643 ) ) ( not ( = ?auto_2561638 ?auto_2561644 ) ) ( not ( = ?auto_2561638 ?auto_2561645 ) ) ( not ( = ?auto_2561638 ?auto_2561646 ) ) ( not ( = ?auto_2561637 ?auto_2561639 ) ) ( not ( = ?auto_2561637 ?auto_2561640 ) ) ( not ( = ?auto_2561637 ?auto_2561641 ) ) ( not ( = ?auto_2561637 ?auto_2561642 ) ) ( not ( = ?auto_2561637 ?auto_2561643 ) ) ( not ( = ?auto_2561637 ?auto_2561644 ) ) ( not ( = ?auto_2561637 ?auto_2561645 ) ) ( not ( = ?auto_2561637 ?auto_2561646 ) ) ( not ( = ?auto_2561639 ?auto_2561640 ) ) ( not ( = ?auto_2561639 ?auto_2561641 ) ) ( not ( = ?auto_2561639 ?auto_2561642 ) ) ( not ( = ?auto_2561639 ?auto_2561643 ) ) ( not ( = ?auto_2561639 ?auto_2561644 ) ) ( not ( = ?auto_2561639 ?auto_2561645 ) ) ( not ( = ?auto_2561639 ?auto_2561646 ) ) ( not ( = ?auto_2561640 ?auto_2561641 ) ) ( not ( = ?auto_2561640 ?auto_2561642 ) ) ( not ( = ?auto_2561640 ?auto_2561643 ) ) ( not ( = ?auto_2561640 ?auto_2561644 ) ) ( not ( = ?auto_2561640 ?auto_2561645 ) ) ( not ( = ?auto_2561640 ?auto_2561646 ) ) ( not ( = ?auto_2561641 ?auto_2561642 ) ) ( not ( = ?auto_2561641 ?auto_2561643 ) ) ( not ( = ?auto_2561641 ?auto_2561644 ) ) ( not ( = ?auto_2561641 ?auto_2561645 ) ) ( not ( = ?auto_2561641 ?auto_2561646 ) ) ( not ( = ?auto_2561642 ?auto_2561643 ) ) ( not ( = ?auto_2561642 ?auto_2561644 ) ) ( not ( = ?auto_2561642 ?auto_2561645 ) ) ( not ( = ?auto_2561642 ?auto_2561646 ) ) ( not ( = ?auto_2561643 ?auto_2561644 ) ) ( not ( = ?auto_2561643 ?auto_2561645 ) ) ( not ( = ?auto_2561643 ?auto_2561646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2561644 ?auto_2561645 ?auto_2561646 )
      ( MAKE-12CRATE-VERIFY ?auto_2561634 ?auto_2561635 ?auto_2561636 ?auto_2561638 ?auto_2561637 ?auto_2561639 ?auto_2561640 ?auto_2561641 ?auto_2561642 ?auto_2561643 ?auto_2561644 ?auto_2561645 ?auto_2561646 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2561796 - SURFACE
      ?auto_2561797 - SURFACE
      ?auto_2561798 - SURFACE
      ?auto_2561800 - SURFACE
      ?auto_2561799 - SURFACE
      ?auto_2561801 - SURFACE
      ?auto_2561802 - SURFACE
      ?auto_2561803 - SURFACE
      ?auto_2561804 - SURFACE
      ?auto_2561805 - SURFACE
      ?auto_2561806 - SURFACE
      ?auto_2561807 - SURFACE
      ?auto_2561808 - SURFACE
    )
    :vars
    (
      ?auto_2561810 - HOIST
      ?auto_2561811 - PLACE
      ?auto_2561814 - TRUCK
      ?auto_2561809 - PLACE
      ?auto_2561813 - HOIST
      ?auto_2561812 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2561810 ?auto_2561811 ) ( SURFACE-AT ?auto_2561807 ?auto_2561811 ) ( CLEAR ?auto_2561807 ) ( IS-CRATE ?auto_2561808 ) ( not ( = ?auto_2561807 ?auto_2561808 ) ) ( AVAILABLE ?auto_2561810 ) ( ON ?auto_2561807 ?auto_2561806 ) ( not ( = ?auto_2561806 ?auto_2561807 ) ) ( not ( = ?auto_2561806 ?auto_2561808 ) ) ( TRUCK-AT ?auto_2561814 ?auto_2561809 ) ( not ( = ?auto_2561809 ?auto_2561811 ) ) ( HOIST-AT ?auto_2561813 ?auto_2561809 ) ( not ( = ?auto_2561810 ?auto_2561813 ) ) ( AVAILABLE ?auto_2561813 ) ( SURFACE-AT ?auto_2561808 ?auto_2561809 ) ( ON ?auto_2561808 ?auto_2561812 ) ( CLEAR ?auto_2561808 ) ( not ( = ?auto_2561807 ?auto_2561812 ) ) ( not ( = ?auto_2561808 ?auto_2561812 ) ) ( not ( = ?auto_2561806 ?auto_2561812 ) ) ( ON ?auto_2561797 ?auto_2561796 ) ( ON ?auto_2561798 ?auto_2561797 ) ( ON ?auto_2561800 ?auto_2561798 ) ( ON ?auto_2561799 ?auto_2561800 ) ( ON ?auto_2561801 ?auto_2561799 ) ( ON ?auto_2561802 ?auto_2561801 ) ( ON ?auto_2561803 ?auto_2561802 ) ( ON ?auto_2561804 ?auto_2561803 ) ( ON ?auto_2561805 ?auto_2561804 ) ( ON ?auto_2561806 ?auto_2561805 ) ( not ( = ?auto_2561796 ?auto_2561797 ) ) ( not ( = ?auto_2561796 ?auto_2561798 ) ) ( not ( = ?auto_2561796 ?auto_2561800 ) ) ( not ( = ?auto_2561796 ?auto_2561799 ) ) ( not ( = ?auto_2561796 ?auto_2561801 ) ) ( not ( = ?auto_2561796 ?auto_2561802 ) ) ( not ( = ?auto_2561796 ?auto_2561803 ) ) ( not ( = ?auto_2561796 ?auto_2561804 ) ) ( not ( = ?auto_2561796 ?auto_2561805 ) ) ( not ( = ?auto_2561796 ?auto_2561806 ) ) ( not ( = ?auto_2561796 ?auto_2561807 ) ) ( not ( = ?auto_2561796 ?auto_2561808 ) ) ( not ( = ?auto_2561796 ?auto_2561812 ) ) ( not ( = ?auto_2561797 ?auto_2561798 ) ) ( not ( = ?auto_2561797 ?auto_2561800 ) ) ( not ( = ?auto_2561797 ?auto_2561799 ) ) ( not ( = ?auto_2561797 ?auto_2561801 ) ) ( not ( = ?auto_2561797 ?auto_2561802 ) ) ( not ( = ?auto_2561797 ?auto_2561803 ) ) ( not ( = ?auto_2561797 ?auto_2561804 ) ) ( not ( = ?auto_2561797 ?auto_2561805 ) ) ( not ( = ?auto_2561797 ?auto_2561806 ) ) ( not ( = ?auto_2561797 ?auto_2561807 ) ) ( not ( = ?auto_2561797 ?auto_2561808 ) ) ( not ( = ?auto_2561797 ?auto_2561812 ) ) ( not ( = ?auto_2561798 ?auto_2561800 ) ) ( not ( = ?auto_2561798 ?auto_2561799 ) ) ( not ( = ?auto_2561798 ?auto_2561801 ) ) ( not ( = ?auto_2561798 ?auto_2561802 ) ) ( not ( = ?auto_2561798 ?auto_2561803 ) ) ( not ( = ?auto_2561798 ?auto_2561804 ) ) ( not ( = ?auto_2561798 ?auto_2561805 ) ) ( not ( = ?auto_2561798 ?auto_2561806 ) ) ( not ( = ?auto_2561798 ?auto_2561807 ) ) ( not ( = ?auto_2561798 ?auto_2561808 ) ) ( not ( = ?auto_2561798 ?auto_2561812 ) ) ( not ( = ?auto_2561800 ?auto_2561799 ) ) ( not ( = ?auto_2561800 ?auto_2561801 ) ) ( not ( = ?auto_2561800 ?auto_2561802 ) ) ( not ( = ?auto_2561800 ?auto_2561803 ) ) ( not ( = ?auto_2561800 ?auto_2561804 ) ) ( not ( = ?auto_2561800 ?auto_2561805 ) ) ( not ( = ?auto_2561800 ?auto_2561806 ) ) ( not ( = ?auto_2561800 ?auto_2561807 ) ) ( not ( = ?auto_2561800 ?auto_2561808 ) ) ( not ( = ?auto_2561800 ?auto_2561812 ) ) ( not ( = ?auto_2561799 ?auto_2561801 ) ) ( not ( = ?auto_2561799 ?auto_2561802 ) ) ( not ( = ?auto_2561799 ?auto_2561803 ) ) ( not ( = ?auto_2561799 ?auto_2561804 ) ) ( not ( = ?auto_2561799 ?auto_2561805 ) ) ( not ( = ?auto_2561799 ?auto_2561806 ) ) ( not ( = ?auto_2561799 ?auto_2561807 ) ) ( not ( = ?auto_2561799 ?auto_2561808 ) ) ( not ( = ?auto_2561799 ?auto_2561812 ) ) ( not ( = ?auto_2561801 ?auto_2561802 ) ) ( not ( = ?auto_2561801 ?auto_2561803 ) ) ( not ( = ?auto_2561801 ?auto_2561804 ) ) ( not ( = ?auto_2561801 ?auto_2561805 ) ) ( not ( = ?auto_2561801 ?auto_2561806 ) ) ( not ( = ?auto_2561801 ?auto_2561807 ) ) ( not ( = ?auto_2561801 ?auto_2561808 ) ) ( not ( = ?auto_2561801 ?auto_2561812 ) ) ( not ( = ?auto_2561802 ?auto_2561803 ) ) ( not ( = ?auto_2561802 ?auto_2561804 ) ) ( not ( = ?auto_2561802 ?auto_2561805 ) ) ( not ( = ?auto_2561802 ?auto_2561806 ) ) ( not ( = ?auto_2561802 ?auto_2561807 ) ) ( not ( = ?auto_2561802 ?auto_2561808 ) ) ( not ( = ?auto_2561802 ?auto_2561812 ) ) ( not ( = ?auto_2561803 ?auto_2561804 ) ) ( not ( = ?auto_2561803 ?auto_2561805 ) ) ( not ( = ?auto_2561803 ?auto_2561806 ) ) ( not ( = ?auto_2561803 ?auto_2561807 ) ) ( not ( = ?auto_2561803 ?auto_2561808 ) ) ( not ( = ?auto_2561803 ?auto_2561812 ) ) ( not ( = ?auto_2561804 ?auto_2561805 ) ) ( not ( = ?auto_2561804 ?auto_2561806 ) ) ( not ( = ?auto_2561804 ?auto_2561807 ) ) ( not ( = ?auto_2561804 ?auto_2561808 ) ) ( not ( = ?auto_2561804 ?auto_2561812 ) ) ( not ( = ?auto_2561805 ?auto_2561806 ) ) ( not ( = ?auto_2561805 ?auto_2561807 ) ) ( not ( = ?auto_2561805 ?auto_2561808 ) ) ( not ( = ?auto_2561805 ?auto_2561812 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2561806 ?auto_2561807 ?auto_2561808 )
      ( MAKE-12CRATE-VERIFY ?auto_2561796 ?auto_2561797 ?auto_2561798 ?auto_2561800 ?auto_2561799 ?auto_2561801 ?auto_2561802 ?auto_2561803 ?auto_2561804 ?auto_2561805 ?auto_2561806 ?auto_2561807 ?auto_2561808 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2561959 - SURFACE
      ?auto_2561960 - SURFACE
      ?auto_2561961 - SURFACE
      ?auto_2561963 - SURFACE
      ?auto_2561962 - SURFACE
      ?auto_2561964 - SURFACE
      ?auto_2561965 - SURFACE
      ?auto_2561966 - SURFACE
      ?auto_2561967 - SURFACE
      ?auto_2561968 - SURFACE
      ?auto_2561969 - SURFACE
      ?auto_2561970 - SURFACE
      ?auto_2561971 - SURFACE
    )
    :vars
    (
      ?auto_2561976 - HOIST
      ?auto_2561974 - PLACE
      ?auto_2561972 - PLACE
      ?auto_2561973 - HOIST
      ?auto_2561975 - SURFACE
      ?auto_2561977 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2561976 ?auto_2561974 ) ( SURFACE-AT ?auto_2561970 ?auto_2561974 ) ( CLEAR ?auto_2561970 ) ( IS-CRATE ?auto_2561971 ) ( not ( = ?auto_2561970 ?auto_2561971 ) ) ( AVAILABLE ?auto_2561976 ) ( ON ?auto_2561970 ?auto_2561969 ) ( not ( = ?auto_2561969 ?auto_2561970 ) ) ( not ( = ?auto_2561969 ?auto_2561971 ) ) ( not ( = ?auto_2561972 ?auto_2561974 ) ) ( HOIST-AT ?auto_2561973 ?auto_2561972 ) ( not ( = ?auto_2561976 ?auto_2561973 ) ) ( AVAILABLE ?auto_2561973 ) ( SURFACE-AT ?auto_2561971 ?auto_2561972 ) ( ON ?auto_2561971 ?auto_2561975 ) ( CLEAR ?auto_2561971 ) ( not ( = ?auto_2561970 ?auto_2561975 ) ) ( not ( = ?auto_2561971 ?auto_2561975 ) ) ( not ( = ?auto_2561969 ?auto_2561975 ) ) ( TRUCK-AT ?auto_2561977 ?auto_2561974 ) ( ON ?auto_2561960 ?auto_2561959 ) ( ON ?auto_2561961 ?auto_2561960 ) ( ON ?auto_2561963 ?auto_2561961 ) ( ON ?auto_2561962 ?auto_2561963 ) ( ON ?auto_2561964 ?auto_2561962 ) ( ON ?auto_2561965 ?auto_2561964 ) ( ON ?auto_2561966 ?auto_2561965 ) ( ON ?auto_2561967 ?auto_2561966 ) ( ON ?auto_2561968 ?auto_2561967 ) ( ON ?auto_2561969 ?auto_2561968 ) ( not ( = ?auto_2561959 ?auto_2561960 ) ) ( not ( = ?auto_2561959 ?auto_2561961 ) ) ( not ( = ?auto_2561959 ?auto_2561963 ) ) ( not ( = ?auto_2561959 ?auto_2561962 ) ) ( not ( = ?auto_2561959 ?auto_2561964 ) ) ( not ( = ?auto_2561959 ?auto_2561965 ) ) ( not ( = ?auto_2561959 ?auto_2561966 ) ) ( not ( = ?auto_2561959 ?auto_2561967 ) ) ( not ( = ?auto_2561959 ?auto_2561968 ) ) ( not ( = ?auto_2561959 ?auto_2561969 ) ) ( not ( = ?auto_2561959 ?auto_2561970 ) ) ( not ( = ?auto_2561959 ?auto_2561971 ) ) ( not ( = ?auto_2561959 ?auto_2561975 ) ) ( not ( = ?auto_2561960 ?auto_2561961 ) ) ( not ( = ?auto_2561960 ?auto_2561963 ) ) ( not ( = ?auto_2561960 ?auto_2561962 ) ) ( not ( = ?auto_2561960 ?auto_2561964 ) ) ( not ( = ?auto_2561960 ?auto_2561965 ) ) ( not ( = ?auto_2561960 ?auto_2561966 ) ) ( not ( = ?auto_2561960 ?auto_2561967 ) ) ( not ( = ?auto_2561960 ?auto_2561968 ) ) ( not ( = ?auto_2561960 ?auto_2561969 ) ) ( not ( = ?auto_2561960 ?auto_2561970 ) ) ( not ( = ?auto_2561960 ?auto_2561971 ) ) ( not ( = ?auto_2561960 ?auto_2561975 ) ) ( not ( = ?auto_2561961 ?auto_2561963 ) ) ( not ( = ?auto_2561961 ?auto_2561962 ) ) ( not ( = ?auto_2561961 ?auto_2561964 ) ) ( not ( = ?auto_2561961 ?auto_2561965 ) ) ( not ( = ?auto_2561961 ?auto_2561966 ) ) ( not ( = ?auto_2561961 ?auto_2561967 ) ) ( not ( = ?auto_2561961 ?auto_2561968 ) ) ( not ( = ?auto_2561961 ?auto_2561969 ) ) ( not ( = ?auto_2561961 ?auto_2561970 ) ) ( not ( = ?auto_2561961 ?auto_2561971 ) ) ( not ( = ?auto_2561961 ?auto_2561975 ) ) ( not ( = ?auto_2561963 ?auto_2561962 ) ) ( not ( = ?auto_2561963 ?auto_2561964 ) ) ( not ( = ?auto_2561963 ?auto_2561965 ) ) ( not ( = ?auto_2561963 ?auto_2561966 ) ) ( not ( = ?auto_2561963 ?auto_2561967 ) ) ( not ( = ?auto_2561963 ?auto_2561968 ) ) ( not ( = ?auto_2561963 ?auto_2561969 ) ) ( not ( = ?auto_2561963 ?auto_2561970 ) ) ( not ( = ?auto_2561963 ?auto_2561971 ) ) ( not ( = ?auto_2561963 ?auto_2561975 ) ) ( not ( = ?auto_2561962 ?auto_2561964 ) ) ( not ( = ?auto_2561962 ?auto_2561965 ) ) ( not ( = ?auto_2561962 ?auto_2561966 ) ) ( not ( = ?auto_2561962 ?auto_2561967 ) ) ( not ( = ?auto_2561962 ?auto_2561968 ) ) ( not ( = ?auto_2561962 ?auto_2561969 ) ) ( not ( = ?auto_2561962 ?auto_2561970 ) ) ( not ( = ?auto_2561962 ?auto_2561971 ) ) ( not ( = ?auto_2561962 ?auto_2561975 ) ) ( not ( = ?auto_2561964 ?auto_2561965 ) ) ( not ( = ?auto_2561964 ?auto_2561966 ) ) ( not ( = ?auto_2561964 ?auto_2561967 ) ) ( not ( = ?auto_2561964 ?auto_2561968 ) ) ( not ( = ?auto_2561964 ?auto_2561969 ) ) ( not ( = ?auto_2561964 ?auto_2561970 ) ) ( not ( = ?auto_2561964 ?auto_2561971 ) ) ( not ( = ?auto_2561964 ?auto_2561975 ) ) ( not ( = ?auto_2561965 ?auto_2561966 ) ) ( not ( = ?auto_2561965 ?auto_2561967 ) ) ( not ( = ?auto_2561965 ?auto_2561968 ) ) ( not ( = ?auto_2561965 ?auto_2561969 ) ) ( not ( = ?auto_2561965 ?auto_2561970 ) ) ( not ( = ?auto_2561965 ?auto_2561971 ) ) ( not ( = ?auto_2561965 ?auto_2561975 ) ) ( not ( = ?auto_2561966 ?auto_2561967 ) ) ( not ( = ?auto_2561966 ?auto_2561968 ) ) ( not ( = ?auto_2561966 ?auto_2561969 ) ) ( not ( = ?auto_2561966 ?auto_2561970 ) ) ( not ( = ?auto_2561966 ?auto_2561971 ) ) ( not ( = ?auto_2561966 ?auto_2561975 ) ) ( not ( = ?auto_2561967 ?auto_2561968 ) ) ( not ( = ?auto_2561967 ?auto_2561969 ) ) ( not ( = ?auto_2561967 ?auto_2561970 ) ) ( not ( = ?auto_2561967 ?auto_2561971 ) ) ( not ( = ?auto_2561967 ?auto_2561975 ) ) ( not ( = ?auto_2561968 ?auto_2561969 ) ) ( not ( = ?auto_2561968 ?auto_2561970 ) ) ( not ( = ?auto_2561968 ?auto_2561971 ) ) ( not ( = ?auto_2561968 ?auto_2561975 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2561969 ?auto_2561970 ?auto_2561971 )
      ( MAKE-12CRATE-VERIFY ?auto_2561959 ?auto_2561960 ?auto_2561961 ?auto_2561963 ?auto_2561962 ?auto_2561964 ?auto_2561965 ?auto_2561966 ?auto_2561967 ?auto_2561968 ?auto_2561969 ?auto_2561970 ?auto_2561971 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2562122 - SURFACE
      ?auto_2562123 - SURFACE
      ?auto_2562124 - SURFACE
      ?auto_2562126 - SURFACE
      ?auto_2562125 - SURFACE
      ?auto_2562127 - SURFACE
      ?auto_2562128 - SURFACE
      ?auto_2562129 - SURFACE
      ?auto_2562130 - SURFACE
      ?auto_2562131 - SURFACE
      ?auto_2562132 - SURFACE
      ?auto_2562133 - SURFACE
      ?auto_2562134 - SURFACE
    )
    :vars
    (
      ?auto_2562135 - HOIST
      ?auto_2562137 - PLACE
      ?auto_2562138 - PLACE
      ?auto_2562140 - HOIST
      ?auto_2562136 - SURFACE
      ?auto_2562139 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2562135 ?auto_2562137 ) ( IS-CRATE ?auto_2562134 ) ( not ( = ?auto_2562133 ?auto_2562134 ) ) ( not ( = ?auto_2562132 ?auto_2562133 ) ) ( not ( = ?auto_2562132 ?auto_2562134 ) ) ( not ( = ?auto_2562138 ?auto_2562137 ) ) ( HOIST-AT ?auto_2562140 ?auto_2562138 ) ( not ( = ?auto_2562135 ?auto_2562140 ) ) ( AVAILABLE ?auto_2562140 ) ( SURFACE-AT ?auto_2562134 ?auto_2562138 ) ( ON ?auto_2562134 ?auto_2562136 ) ( CLEAR ?auto_2562134 ) ( not ( = ?auto_2562133 ?auto_2562136 ) ) ( not ( = ?auto_2562134 ?auto_2562136 ) ) ( not ( = ?auto_2562132 ?auto_2562136 ) ) ( TRUCK-AT ?auto_2562139 ?auto_2562137 ) ( SURFACE-AT ?auto_2562132 ?auto_2562137 ) ( CLEAR ?auto_2562132 ) ( LIFTING ?auto_2562135 ?auto_2562133 ) ( IS-CRATE ?auto_2562133 ) ( ON ?auto_2562123 ?auto_2562122 ) ( ON ?auto_2562124 ?auto_2562123 ) ( ON ?auto_2562126 ?auto_2562124 ) ( ON ?auto_2562125 ?auto_2562126 ) ( ON ?auto_2562127 ?auto_2562125 ) ( ON ?auto_2562128 ?auto_2562127 ) ( ON ?auto_2562129 ?auto_2562128 ) ( ON ?auto_2562130 ?auto_2562129 ) ( ON ?auto_2562131 ?auto_2562130 ) ( ON ?auto_2562132 ?auto_2562131 ) ( not ( = ?auto_2562122 ?auto_2562123 ) ) ( not ( = ?auto_2562122 ?auto_2562124 ) ) ( not ( = ?auto_2562122 ?auto_2562126 ) ) ( not ( = ?auto_2562122 ?auto_2562125 ) ) ( not ( = ?auto_2562122 ?auto_2562127 ) ) ( not ( = ?auto_2562122 ?auto_2562128 ) ) ( not ( = ?auto_2562122 ?auto_2562129 ) ) ( not ( = ?auto_2562122 ?auto_2562130 ) ) ( not ( = ?auto_2562122 ?auto_2562131 ) ) ( not ( = ?auto_2562122 ?auto_2562132 ) ) ( not ( = ?auto_2562122 ?auto_2562133 ) ) ( not ( = ?auto_2562122 ?auto_2562134 ) ) ( not ( = ?auto_2562122 ?auto_2562136 ) ) ( not ( = ?auto_2562123 ?auto_2562124 ) ) ( not ( = ?auto_2562123 ?auto_2562126 ) ) ( not ( = ?auto_2562123 ?auto_2562125 ) ) ( not ( = ?auto_2562123 ?auto_2562127 ) ) ( not ( = ?auto_2562123 ?auto_2562128 ) ) ( not ( = ?auto_2562123 ?auto_2562129 ) ) ( not ( = ?auto_2562123 ?auto_2562130 ) ) ( not ( = ?auto_2562123 ?auto_2562131 ) ) ( not ( = ?auto_2562123 ?auto_2562132 ) ) ( not ( = ?auto_2562123 ?auto_2562133 ) ) ( not ( = ?auto_2562123 ?auto_2562134 ) ) ( not ( = ?auto_2562123 ?auto_2562136 ) ) ( not ( = ?auto_2562124 ?auto_2562126 ) ) ( not ( = ?auto_2562124 ?auto_2562125 ) ) ( not ( = ?auto_2562124 ?auto_2562127 ) ) ( not ( = ?auto_2562124 ?auto_2562128 ) ) ( not ( = ?auto_2562124 ?auto_2562129 ) ) ( not ( = ?auto_2562124 ?auto_2562130 ) ) ( not ( = ?auto_2562124 ?auto_2562131 ) ) ( not ( = ?auto_2562124 ?auto_2562132 ) ) ( not ( = ?auto_2562124 ?auto_2562133 ) ) ( not ( = ?auto_2562124 ?auto_2562134 ) ) ( not ( = ?auto_2562124 ?auto_2562136 ) ) ( not ( = ?auto_2562126 ?auto_2562125 ) ) ( not ( = ?auto_2562126 ?auto_2562127 ) ) ( not ( = ?auto_2562126 ?auto_2562128 ) ) ( not ( = ?auto_2562126 ?auto_2562129 ) ) ( not ( = ?auto_2562126 ?auto_2562130 ) ) ( not ( = ?auto_2562126 ?auto_2562131 ) ) ( not ( = ?auto_2562126 ?auto_2562132 ) ) ( not ( = ?auto_2562126 ?auto_2562133 ) ) ( not ( = ?auto_2562126 ?auto_2562134 ) ) ( not ( = ?auto_2562126 ?auto_2562136 ) ) ( not ( = ?auto_2562125 ?auto_2562127 ) ) ( not ( = ?auto_2562125 ?auto_2562128 ) ) ( not ( = ?auto_2562125 ?auto_2562129 ) ) ( not ( = ?auto_2562125 ?auto_2562130 ) ) ( not ( = ?auto_2562125 ?auto_2562131 ) ) ( not ( = ?auto_2562125 ?auto_2562132 ) ) ( not ( = ?auto_2562125 ?auto_2562133 ) ) ( not ( = ?auto_2562125 ?auto_2562134 ) ) ( not ( = ?auto_2562125 ?auto_2562136 ) ) ( not ( = ?auto_2562127 ?auto_2562128 ) ) ( not ( = ?auto_2562127 ?auto_2562129 ) ) ( not ( = ?auto_2562127 ?auto_2562130 ) ) ( not ( = ?auto_2562127 ?auto_2562131 ) ) ( not ( = ?auto_2562127 ?auto_2562132 ) ) ( not ( = ?auto_2562127 ?auto_2562133 ) ) ( not ( = ?auto_2562127 ?auto_2562134 ) ) ( not ( = ?auto_2562127 ?auto_2562136 ) ) ( not ( = ?auto_2562128 ?auto_2562129 ) ) ( not ( = ?auto_2562128 ?auto_2562130 ) ) ( not ( = ?auto_2562128 ?auto_2562131 ) ) ( not ( = ?auto_2562128 ?auto_2562132 ) ) ( not ( = ?auto_2562128 ?auto_2562133 ) ) ( not ( = ?auto_2562128 ?auto_2562134 ) ) ( not ( = ?auto_2562128 ?auto_2562136 ) ) ( not ( = ?auto_2562129 ?auto_2562130 ) ) ( not ( = ?auto_2562129 ?auto_2562131 ) ) ( not ( = ?auto_2562129 ?auto_2562132 ) ) ( not ( = ?auto_2562129 ?auto_2562133 ) ) ( not ( = ?auto_2562129 ?auto_2562134 ) ) ( not ( = ?auto_2562129 ?auto_2562136 ) ) ( not ( = ?auto_2562130 ?auto_2562131 ) ) ( not ( = ?auto_2562130 ?auto_2562132 ) ) ( not ( = ?auto_2562130 ?auto_2562133 ) ) ( not ( = ?auto_2562130 ?auto_2562134 ) ) ( not ( = ?auto_2562130 ?auto_2562136 ) ) ( not ( = ?auto_2562131 ?auto_2562132 ) ) ( not ( = ?auto_2562131 ?auto_2562133 ) ) ( not ( = ?auto_2562131 ?auto_2562134 ) ) ( not ( = ?auto_2562131 ?auto_2562136 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2562132 ?auto_2562133 ?auto_2562134 )
      ( MAKE-12CRATE-VERIFY ?auto_2562122 ?auto_2562123 ?auto_2562124 ?auto_2562126 ?auto_2562125 ?auto_2562127 ?auto_2562128 ?auto_2562129 ?auto_2562130 ?auto_2562131 ?auto_2562132 ?auto_2562133 ?auto_2562134 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2562285 - SURFACE
      ?auto_2562286 - SURFACE
      ?auto_2562287 - SURFACE
      ?auto_2562289 - SURFACE
      ?auto_2562288 - SURFACE
      ?auto_2562290 - SURFACE
      ?auto_2562291 - SURFACE
      ?auto_2562292 - SURFACE
      ?auto_2562293 - SURFACE
      ?auto_2562294 - SURFACE
      ?auto_2562295 - SURFACE
      ?auto_2562296 - SURFACE
      ?auto_2562297 - SURFACE
    )
    :vars
    (
      ?auto_2562298 - HOIST
      ?auto_2562302 - PLACE
      ?auto_2562301 - PLACE
      ?auto_2562299 - HOIST
      ?auto_2562300 - SURFACE
      ?auto_2562303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2562298 ?auto_2562302 ) ( IS-CRATE ?auto_2562297 ) ( not ( = ?auto_2562296 ?auto_2562297 ) ) ( not ( = ?auto_2562295 ?auto_2562296 ) ) ( not ( = ?auto_2562295 ?auto_2562297 ) ) ( not ( = ?auto_2562301 ?auto_2562302 ) ) ( HOIST-AT ?auto_2562299 ?auto_2562301 ) ( not ( = ?auto_2562298 ?auto_2562299 ) ) ( AVAILABLE ?auto_2562299 ) ( SURFACE-AT ?auto_2562297 ?auto_2562301 ) ( ON ?auto_2562297 ?auto_2562300 ) ( CLEAR ?auto_2562297 ) ( not ( = ?auto_2562296 ?auto_2562300 ) ) ( not ( = ?auto_2562297 ?auto_2562300 ) ) ( not ( = ?auto_2562295 ?auto_2562300 ) ) ( TRUCK-AT ?auto_2562303 ?auto_2562302 ) ( SURFACE-AT ?auto_2562295 ?auto_2562302 ) ( CLEAR ?auto_2562295 ) ( IS-CRATE ?auto_2562296 ) ( AVAILABLE ?auto_2562298 ) ( IN ?auto_2562296 ?auto_2562303 ) ( ON ?auto_2562286 ?auto_2562285 ) ( ON ?auto_2562287 ?auto_2562286 ) ( ON ?auto_2562289 ?auto_2562287 ) ( ON ?auto_2562288 ?auto_2562289 ) ( ON ?auto_2562290 ?auto_2562288 ) ( ON ?auto_2562291 ?auto_2562290 ) ( ON ?auto_2562292 ?auto_2562291 ) ( ON ?auto_2562293 ?auto_2562292 ) ( ON ?auto_2562294 ?auto_2562293 ) ( ON ?auto_2562295 ?auto_2562294 ) ( not ( = ?auto_2562285 ?auto_2562286 ) ) ( not ( = ?auto_2562285 ?auto_2562287 ) ) ( not ( = ?auto_2562285 ?auto_2562289 ) ) ( not ( = ?auto_2562285 ?auto_2562288 ) ) ( not ( = ?auto_2562285 ?auto_2562290 ) ) ( not ( = ?auto_2562285 ?auto_2562291 ) ) ( not ( = ?auto_2562285 ?auto_2562292 ) ) ( not ( = ?auto_2562285 ?auto_2562293 ) ) ( not ( = ?auto_2562285 ?auto_2562294 ) ) ( not ( = ?auto_2562285 ?auto_2562295 ) ) ( not ( = ?auto_2562285 ?auto_2562296 ) ) ( not ( = ?auto_2562285 ?auto_2562297 ) ) ( not ( = ?auto_2562285 ?auto_2562300 ) ) ( not ( = ?auto_2562286 ?auto_2562287 ) ) ( not ( = ?auto_2562286 ?auto_2562289 ) ) ( not ( = ?auto_2562286 ?auto_2562288 ) ) ( not ( = ?auto_2562286 ?auto_2562290 ) ) ( not ( = ?auto_2562286 ?auto_2562291 ) ) ( not ( = ?auto_2562286 ?auto_2562292 ) ) ( not ( = ?auto_2562286 ?auto_2562293 ) ) ( not ( = ?auto_2562286 ?auto_2562294 ) ) ( not ( = ?auto_2562286 ?auto_2562295 ) ) ( not ( = ?auto_2562286 ?auto_2562296 ) ) ( not ( = ?auto_2562286 ?auto_2562297 ) ) ( not ( = ?auto_2562286 ?auto_2562300 ) ) ( not ( = ?auto_2562287 ?auto_2562289 ) ) ( not ( = ?auto_2562287 ?auto_2562288 ) ) ( not ( = ?auto_2562287 ?auto_2562290 ) ) ( not ( = ?auto_2562287 ?auto_2562291 ) ) ( not ( = ?auto_2562287 ?auto_2562292 ) ) ( not ( = ?auto_2562287 ?auto_2562293 ) ) ( not ( = ?auto_2562287 ?auto_2562294 ) ) ( not ( = ?auto_2562287 ?auto_2562295 ) ) ( not ( = ?auto_2562287 ?auto_2562296 ) ) ( not ( = ?auto_2562287 ?auto_2562297 ) ) ( not ( = ?auto_2562287 ?auto_2562300 ) ) ( not ( = ?auto_2562289 ?auto_2562288 ) ) ( not ( = ?auto_2562289 ?auto_2562290 ) ) ( not ( = ?auto_2562289 ?auto_2562291 ) ) ( not ( = ?auto_2562289 ?auto_2562292 ) ) ( not ( = ?auto_2562289 ?auto_2562293 ) ) ( not ( = ?auto_2562289 ?auto_2562294 ) ) ( not ( = ?auto_2562289 ?auto_2562295 ) ) ( not ( = ?auto_2562289 ?auto_2562296 ) ) ( not ( = ?auto_2562289 ?auto_2562297 ) ) ( not ( = ?auto_2562289 ?auto_2562300 ) ) ( not ( = ?auto_2562288 ?auto_2562290 ) ) ( not ( = ?auto_2562288 ?auto_2562291 ) ) ( not ( = ?auto_2562288 ?auto_2562292 ) ) ( not ( = ?auto_2562288 ?auto_2562293 ) ) ( not ( = ?auto_2562288 ?auto_2562294 ) ) ( not ( = ?auto_2562288 ?auto_2562295 ) ) ( not ( = ?auto_2562288 ?auto_2562296 ) ) ( not ( = ?auto_2562288 ?auto_2562297 ) ) ( not ( = ?auto_2562288 ?auto_2562300 ) ) ( not ( = ?auto_2562290 ?auto_2562291 ) ) ( not ( = ?auto_2562290 ?auto_2562292 ) ) ( not ( = ?auto_2562290 ?auto_2562293 ) ) ( not ( = ?auto_2562290 ?auto_2562294 ) ) ( not ( = ?auto_2562290 ?auto_2562295 ) ) ( not ( = ?auto_2562290 ?auto_2562296 ) ) ( not ( = ?auto_2562290 ?auto_2562297 ) ) ( not ( = ?auto_2562290 ?auto_2562300 ) ) ( not ( = ?auto_2562291 ?auto_2562292 ) ) ( not ( = ?auto_2562291 ?auto_2562293 ) ) ( not ( = ?auto_2562291 ?auto_2562294 ) ) ( not ( = ?auto_2562291 ?auto_2562295 ) ) ( not ( = ?auto_2562291 ?auto_2562296 ) ) ( not ( = ?auto_2562291 ?auto_2562297 ) ) ( not ( = ?auto_2562291 ?auto_2562300 ) ) ( not ( = ?auto_2562292 ?auto_2562293 ) ) ( not ( = ?auto_2562292 ?auto_2562294 ) ) ( not ( = ?auto_2562292 ?auto_2562295 ) ) ( not ( = ?auto_2562292 ?auto_2562296 ) ) ( not ( = ?auto_2562292 ?auto_2562297 ) ) ( not ( = ?auto_2562292 ?auto_2562300 ) ) ( not ( = ?auto_2562293 ?auto_2562294 ) ) ( not ( = ?auto_2562293 ?auto_2562295 ) ) ( not ( = ?auto_2562293 ?auto_2562296 ) ) ( not ( = ?auto_2562293 ?auto_2562297 ) ) ( not ( = ?auto_2562293 ?auto_2562300 ) ) ( not ( = ?auto_2562294 ?auto_2562295 ) ) ( not ( = ?auto_2562294 ?auto_2562296 ) ) ( not ( = ?auto_2562294 ?auto_2562297 ) ) ( not ( = ?auto_2562294 ?auto_2562300 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2562295 ?auto_2562296 ?auto_2562297 )
      ( MAKE-12CRATE-VERIFY ?auto_2562285 ?auto_2562286 ?auto_2562287 ?auto_2562289 ?auto_2562288 ?auto_2562290 ?auto_2562291 ?auto_2562292 ?auto_2562293 ?auto_2562294 ?auto_2562295 ?auto_2562296 ?auto_2562297 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2573889 - SURFACE
      ?auto_2573890 - SURFACE
      ?auto_2573891 - SURFACE
      ?auto_2573893 - SURFACE
      ?auto_2573892 - SURFACE
      ?auto_2573894 - SURFACE
      ?auto_2573895 - SURFACE
      ?auto_2573896 - SURFACE
      ?auto_2573897 - SURFACE
      ?auto_2573898 - SURFACE
      ?auto_2573899 - SURFACE
      ?auto_2573900 - SURFACE
      ?auto_2573901 - SURFACE
      ?auto_2573902 - SURFACE
    )
    :vars
    (
      ?auto_2573903 - HOIST
      ?auto_2573904 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2573903 ?auto_2573904 ) ( SURFACE-AT ?auto_2573901 ?auto_2573904 ) ( CLEAR ?auto_2573901 ) ( LIFTING ?auto_2573903 ?auto_2573902 ) ( IS-CRATE ?auto_2573902 ) ( not ( = ?auto_2573901 ?auto_2573902 ) ) ( ON ?auto_2573890 ?auto_2573889 ) ( ON ?auto_2573891 ?auto_2573890 ) ( ON ?auto_2573893 ?auto_2573891 ) ( ON ?auto_2573892 ?auto_2573893 ) ( ON ?auto_2573894 ?auto_2573892 ) ( ON ?auto_2573895 ?auto_2573894 ) ( ON ?auto_2573896 ?auto_2573895 ) ( ON ?auto_2573897 ?auto_2573896 ) ( ON ?auto_2573898 ?auto_2573897 ) ( ON ?auto_2573899 ?auto_2573898 ) ( ON ?auto_2573900 ?auto_2573899 ) ( ON ?auto_2573901 ?auto_2573900 ) ( not ( = ?auto_2573889 ?auto_2573890 ) ) ( not ( = ?auto_2573889 ?auto_2573891 ) ) ( not ( = ?auto_2573889 ?auto_2573893 ) ) ( not ( = ?auto_2573889 ?auto_2573892 ) ) ( not ( = ?auto_2573889 ?auto_2573894 ) ) ( not ( = ?auto_2573889 ?auto_2573895 ) ) ( not ( = ?auto_2573889 ?auto_2573896 ) ) ( not ( = ?auto_2573889 ?auto_2573897 ) ) ( not ( = ?auto_2573889 ?auto_2573898 ) ) ( not ( = ?auto_2573889 ?auto_2573899 ) ) ( not ( = ?auto_2573889 ?auto_2573900 ) ) ( not ( = ?auto_2573889 ?auto_2573901 ) ) ( not ( = ?auto_2573889 ?auto_2573902 ) ) ( not ( = ?auto_2573890 ?auto_2573891 ) ) ( not ( = ?auto_2573890 ?auto_2573893 ) ) ( not ( = ?auto_2573890 ?auto_2573892 ) ) ( not ( = ?auto_2573890 ?auto_2573894 ) ) ( not ( = ?auto_2573890 ?auto_2573895 ) ) ( not ( = ?auto_2573890 ?auto_2573896 ) ) ( not ( = ?auto_2573890 ?auto_2573897 ) ) ( not ( = ?auto_2573890 ?auto_2573898 ) ) ( not ( = ?auto_2573890 ?auto_2573899 ) ) ( not ( = ?auto_2573890 ?auto_2573900 ) ) ( not ( = ?auto_2573890 ?auto_2573901 ) ) ( not ( = ?auto_2573890 ?auto_2573902 ) ) ( not ( = ?auto_2573891 ?auto_2573893 ) ) ( not ( = ?auto_2573891 ?auto_2573892 ) ) ( not ( = ?auto_2573891 ?auto_2573894 ) ) ( not ( = ?auto_2573891 ?auto_2573895 ) ) ( not ( = ?auto_2573891 ?auto_2573896 ) ) ( not ( = ?auto_2573891 ?auto_2573897 ) ) ( not ( = ?auto_2573891 ?auto_2573898 ) ) ( not ( = ?auto_2573891 ?auto_2573899 ) ) ( not ( = ?auto_2573891 ?auto_2573900 ) ) ( not ( = ?auto_2573891 ?auto_2573901 ) ) ( not ( = ?auto_2573891 ?auto_2573902 ) ) ( not ( = ?auto_2573893 ?auto_2573892 ) ) ( not ( = ?auto_2573893 ?auto_2573894 ) ) ( not ( = ?auto_2573893 ?auto_2573895 ) ) ( not ( = ?auto_2573893 ?auto_2573896 ) ) ( not ( = ?auto_2573893 ?auto_2573897 ) ) ( not ( = ?auto_2573893 ?auto_2573898 ) ) ( not ( = ?auto_2573893 ?auto_2573899 ) ) ( not ( = ?auto_2573893 ?auto_2573900 ) ) ( not ( = ?auto_2573893 ?auto_2573901 ) ) ( not ( = ?auto_2573893 ?auto_2573902 ) ) ( not ( = ?auto_2573892 ?auto_2573894 ) ) ( not ( = ?auto_2573892 ?auto_2573895 ) ) ( not ( = ?auto_2573892 ?auto_2573896 ) ) ( not ( = ?auto_2573892 ?auto_2573897 ) ) ( not ( = ?auto_2573892 ?auto_2573898 ) ) ( not ( = ?auto_2573892 ?auto_2573899 ) ) ( not ( = ?auto_2573892 ?auto_2573900 ) ) ( not ( = ?auto_2573892 ?auto_2573901 ) ) ( not ( = ?auto_2573892 ?auto_2573902 ) ) ( not ( = ?auto_2573894 ?auto_2573895 ) ) ( not ( = ?auto_2573894 ?auto_2573896 ) ) ( not ( = ?auto_2573894 ?auto_2573897 ) ) ( not ( = ?auto_2573894 ?auto_2573898 ) ) ( not ( = ?auto_2573894 ?auto_2573899 ) ) ( not ( = ?auto_2573894 ?auto_2573900 ) ) ( not ( = ?auto_2573894 ?auto_2573901 ) ) ( not ( = ?auto_2573894 ?auto_2573902 ) ) ( not ( = ?auto_2573895 ?auto_2573896 ) ) ( not ( = ?auto_2573895 ?auto_2573897 ) ) ( not ( = ?auto_2573895 ?auto_2573898 ) ) ( not ( = ?auto_2573895 ?auto_2573899 ) ) ( not ( = ?auto_2573895 ?auto_2573900 ) ) ( not ( = ?auto_2573895 ?auto_2573901 ) ) ( not ( = ?auto_2573895 ?auto_2573902 ) ) ( not ( = ?auto_2573896 ?auto_2573897 ) ) ( not ( = ?auto_2573896 ?auto_2573898 ) ) ( not ( = ?auto_2573896 ?auto_2573899 ) ) ( not ( = ?auto_2573896 ?auto_2573900 ) ) ( not ( = ?auto_2573896 ?auto_2573901 ) ) ( not ( = ?auto_2573896 ?auto_2573902 ) ) ( not ( = ?auto_2573897 ?auto_2573898 ) ) ( not ( = ?auto_2573897 ?auto_2573899 ) ) ( not ( = ?auto_2573897 ?auto_2573900 ) ) ( not ( = ?auto_2573897 ?auto_2573901 ) ) ( not ( = ?auto_2573897 ?auto_2573902 ) ) ( not ( = ?auto_2573898 ?auto_2573899 ) ) ( not ( = ?auto_2573898 ?auto_2573900 ) ) ( not ( = ?auto_2573898 ?auto_2573901 ) ) ( not ( = ?auto_2573898 ?auto_2573902 ) ) ( not ( = ?auto_2573899 ?auto_2573900 ) ) ( not ( = ?auto_2573899 ?auto_2573901 ) ) ( not ( = ?auto_2573899 ?auto_2573902 ) ) ( not ( = ?auto_2573900 ?auto_2573901 ) ) ( not ( = ?auto_2573900 ?auto_2573902 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2573901 ?auto_2573902 )
      ( MAKE-13CRATE-VERIFY ?auto_2573889 ?auto_2573890 ?auto_2573891 ?auto_2573893 ?auto_2573892 ?auto_2573894 ?auto_2573895 ?auto_2573896 ?auto_2573897 ?auto_2573898 ?auto_2573899 ?auto_2573900 ?auto_2573901 ?auto_2573902 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2574031 - SURFACE
      ?auto_2574032 - SURFACE
      ?auto_2574033 - SURFACE
      ?auto_2574035 - SURFACE
      ?auto_2574034 - SURFACE
      ?auto_2574036 - SURFACE
      ?auto_2574037 - SURFACE
      ?auto_2574038 - SURFACE
      ?auto_2574039 - SURFACE
      ?auto_2574040 - SURFACE
      ?auto_2574041 - SURFACE
      ?auto_2574042 - SURFACE
      ?auto_2574043 - SURFACE
      ?auto_2574044 - SURFACE
    )
    :vars
    (
      ?auto_2574047 - HOIST
      ?auto_2574046 - PLACE
      ?auto_2574045 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2574047 ?auto_2574046 ) ( SURFACE-AT ?auto_2574043 ?auto_2574046 ) ( CLEAR ?auto_2574043 ) ( IS-CRATE ?auto_2574044 ) ( not ( = ?auto_2574043 ?auto_2574044 ) ) ( TRUCK-AT ?auto_2574045 ?auto_2574046 ) ( AVAILABLE ?auto_2574047 ) ( IN ?auto_2574044 ?auto_2574045 ) ( ON ?auto_2574043 ?auto_2574042 ) ( not ( = ?auto_2574042 ?auto_2574043 ) ) ( not ( = ?auto_2574042 ?auto_2574044 ) ) ( ON ?auto_2574032 ?auto_2574031 ) ( ON ?auto_2574033 ?auto_2574032 ) ( ON ?auto_2574035 ?auto_2574033 ) ( ON ?auto_2574034 ?auto_2574035 ) ( ON ?auto_2574036 ?auto_2574034 ) ( ON ?auto_2574037 ?auto_2574036 ) ( ON ?auto_2574038 ?auto_2574037 ) ( ON ?auto_2574039 ?auto_2574038 ) ( ON ?auto_2574040 ?auto_2574039 ) ( ON ?auto_2574041 ?auto_2574040 ) ( ON ?auto_2574042 ?auto_2574041 ) ( not ( = ?auto_2574031 ?auto_2574032 ) ) ( not ( = ?auto_2574031 ?auto_2574033 ) ) ( not ( = ?auto_2574031 ?auto_2574035 ) ) ( not ( = ?auto_2574031 ?auto_2574034 ) ) ( not ( = ?auto_2574031 ?auto_2574036 ) ) ( not ( = ?auto_2574031 ?auto_2574037 ) ) ( not ( = ?auto_2574031 ?auto_2574038 ) ) ( not ( = ?auto_2574031 ?auto_2574039 ) ) ( not ( = ?auto_2574031 ?auto_2574040 ) ) ( not ( = ?auto_2574031 ?auto_2574041 ) ) ( not ( = ?auto_2574031 ?auto_2574042 ) ) ( not ( = ?auto_2574031 ?auto_2574043 ) ) ( not ( = ?auto_2574031 ?auto_2574044 ) ) ( not ( = ?auto_2574032 ?auto_2574033 ) ) ( not ( = ?auto_2574032 ?auto_2574035 ) ) ( not ( = ?auto_2574032 ?auto_2574034 ) ) ( not ( = ?auto_2574032 ?auto_2574036 ) ) ( not ( = ?auto_2574032 ?auto_2574037 ) ) ( not ( = ?auto_2574032 ?auto_2574038 ) ) ( not ( = ?auto_2574032 ?auto_2574039 ) ) ( not ( = ?auto_2574032 ?auto_2574040 ) ) ( not ( = ?auto_2574032 ?auto_2574041 ) ) ( not ( = ?auto_2574032 ?auto_2574042 ) ) ( not ( = ?auto_2574032 ?auto_2574043 ) ) ( not ( = ?auto_2574032 ?auto_2574044 ) ) ( not ( = ?auto_2574033 ?auto_2574035 ) ) ( not ( = ?auto_2574033 ?auto_2574034 ) ) ( not ( = ?auto_2574033 ?auto_2574036 ) ) ( not ( = ?auto_2574033 ?auto_2574037 ) ) ( not ( = ?auto_2574033 ?auto_2574038 ) ) ( not ( = ?auto_2574033 ?auto_2574039 ) ) ( not ( = ?auto_2574033 ?auto_2574040 ) ) ( not ( = ?auto_2574033 ?auto_2574041 ) ) ( not ( = ?auto_2574033 ?auto_2574042 ) ) ( not ( = ?auto_2574033 ?auto_2574043 ) ) ( not ( = ?auto_2574033 ?auto_2574044 ) ) ( not ( = ?auto_2574035 ?auto_2574034 ) ) ( not ( = ?auto_2574035 ?auto_2574036 ) ) ( not ( = ?auto_2574035 ?auto_2574037 ) ) ( not ( = ?auto_2574035 ?auto_2574038 ) ) ( not ( = ?auto_2574035 ?auto_2574039 ) ) ( not ( = ?auto_2574035 ?auto_2574040 ) ) ( not ( = ?auto_2574035 ?auto_2574041 ) ) ( not ( = ?auto_2574035 ?auto_2574042 ) ) ( not ( = ?auto_2574035 ?auto_2574043 ) ) ( not ( = ?auto_2574035 ?auto_2574044 ) ) ( not ( = ?auto_2574034 ?auto_2574036 ) ) ( not ( = ?auto_2574034 ?auto_2574037 ) ) ( not ( = ?auto_2574034 ?auto_2574038 ) ) ( not ( = ?auto_2574034 ?auto_2574039 ) ) ( not ( = ?auto_2574034 ?auto_2574040 ) ) ( not ( = ?auto_2574034 ?auto_2574041 ) ) ( not ( = ?auto_2574034 ?auto_2574042 ) ) ( not ( = ?auto_2574034 ?auto_2574043 ) ) ( not ( = ?auto_2574034 ?auto_2574044 ) ) ( not ( = ?auto_2574036 ?auto_2574037 ) ) ( not ( = ?auto_2574036 ?auto_2574038 ) ) ( not ( = ?auto_2574036 ?auto_2574039 ) ) ( not ( = ?auto_2574036 ?auto_2574040 ) ) ( not ( = ?auto_2574036 ?auto_2574041 ) ) ( not ( = ?auto_2574036 ?auto_2574042 ) ) ( not ( = ?auto_2574036 ?auto_2574043 ) ) ( not ( = ?auto_2574036 ?auto_2574044 ) ) ( not ( = ?auto_2574037 ?auto_2574038 ) ) ( not ( = ?auto_2574037 ?auto_2574039 ) ) ( not ( = ?auto_2574037 ?auto_2574040 ) ) ( not ( = ?auto_2574037 ?auto_2574041 ) ) ( not ( = ?auto_2574037 ?auto_2574042 ) ) ( not ( = ?auto_2574037 ?auto_2574043 ) ) ( not ( = ?auto_2574037 ?auto_2574044 ) ) ( not ( = ?auto_2574038 ?auto_2574039 ) ) ( not ( = ?auto_2574038 ?auto_2574040 ) ) ( not ( = ?auto_2574038 ?auto_2574041 ) ) ( not ( = ?auto_2574038 ?auto_2574042 ) ) ( not ( = ?auto_2574038 ?auto_2574043 ) ) ( not ( = ?auto_2574038 ?auto_2574044 ) ) ( not ( = ?auto_2574039 ?auto_2574040 ) ) ( not ( = ?auto_2574039 ?auto_2574041 ) ) ( not ( = ?auto_2574039 ?auto_2574042 ) ) ( not ( = ?auto_2574039 ?auto_2574043 ) ) ( not ( = ?auto_2574039 ?auto_2574044 ) ) ( not ( = ?auto_2574040 ?auto_2574041 ) ) ( not ( = ?auto_2574040 ?auto_2574042 ) ) ( not ( = ?auto_2574040 ?auto_2574043 ) ) ( not ( = ?auto_2574040 ?auto_2574044 ) ) ( not ( = ?auto_2574041 ?auto_2574042 ) ) ( not ( = ?auto_2574041 ?auto_2574043 ) ) ( not ( = ?auto_2574041 ?auto_2574044 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2574042 ?auto_2574043 ?auto_2574044 )
      ( MAKE-13CRATE-VERIFY ?auto_2574031 ?auto_2574032 ?auto_2574033 ?auto_2574035 ?auto_2574034 ?auto_2574036 ?auto_2574037 ?auto_2574038 ?auto_2574039 ?auto_2574040 ?auto_2574041 ?auto_2574042 ?auto_2574043 ?auto_2574044 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2574187 - SURFACE
      ?auto_2574188 - SURFACE
      ?auto_2574189 - SURFACE
      ?auto_2574191 - SURFACE
      ?auto_2574190 - SURFACE
      ?auto_2574192 - SURFACE
      ?auto_2574193 - SURFACE
      ?auto_2574194 - SURFACE
      ?auto_2574195 - SURFACE
      ?auto_2574196 - SURFACE
      ?auto_2574197 - SURFACE
      ?auto_2574198 - SURFACE
      ?auto_2574199 - SURFACE
      ?auto_2574200 - SURFACE
    )
    :vars
    (
      ?auto_2574202 - HOIST
      ?auto_2574203 - PLACE
      ?auto_2574201 - TRUCK
      ?auto_2574204 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2574202 ?auto_2574203 ) ( SURFACE-AT ?auto_2574199 ?auto_2574203 ) ( CLEAR ?auto_2574199 ) ( IS-CRATE ?auto_2574200 ) ( not ( = ?auto_2574199 ?auto_2574200 ) ) ( AVAILABLE ?auto_2574202 ) ( IN ?auto_2574200 ?auto_2574201 ) ( ON ?auto_2574199 ?auto_2574198 ) ( not ( = ?auto_2574198 ?auto_2574199 ) ) ( not ( = ?auto_2574198 ?auto_2574200 ) ) ( TRUCK-AT ?auto_2574201 ?auto_2574204 ) ( not ( = ?auto_2574204 ?auto_2574203 ) ) ( ON ?auto_2574188 ?auto_2574187 ) ( ON ?auto_2574189 ?auto_2574188 ) ( ON ?auto_2574191 ?auto_2574189 ) ( ON ?auto_2574190 ?auto_2574191 ) ( ON ?auto_2574192 ?auto_2574190 ) ( ON ?auto_2574193 ?auto_2574192 ) ( ON ?auto_2574194 ?auto_2574193 ) ( ON ?auto_2574195 ?auto_2574194 ) ( ON ?auto_2574196 ?auto_2574195 ) ( ON ?auto_2574197 ?auto_2574196 ) ( ON ?auto_2574198 ?auto_2574197 ) ( not ( = ?auto_2574187 ?auto_2574188 ) ) ( not ( = ?auto_2574187 ?auto_2574189 ) ) ( not ( = ?auto_2574187 ?auto_2574191 ) ) ( not ( = ?auto_2574187 ?auto_2574190 ) ) ( not ( = ?auto_2574187 ?auto_2574192 ) ) ( not ( = ?auto_2574187 ?auto_2574193 ) ) ( not ( = ?auto_2574187 ?auto_2574194 ) ) ( not ( = ?auto_2574187 ?auto_2574195 ) ) ( not ( = ?auto_2574187 ?auto_2574196 ) ) ( not ( = ?auto_2574187 ?auto_2574197 ) ) ( not ( = ?auto_2574187 ?auto_2574198 ) ) ( not ( = ?auto_2574187 ?auto_2574199 ) ) ( not ( = ?auto_2574187 ?auto_2574200 ) ) ( not ( = ?auto_2574188 ?auto_2574189 ) ) ( not ( = ?auto_2574188 ?auto_2574191 ) ) ( not ( = ?auto_2574188 ?auto_2574190 ) ) ( not ( = ?auto_2574188 ?auto_2574192 ) ) ( not ( = ?auto_2574188 ?auto_2574193 ) ) ( not ( = ?auto_2574188 ?auto_2574194 ) ) ( not ( = ?auto_2574188 ?auto_2574195 ) ) ( not ( = ?auto_2574188 ?auto_2574196 ) ) ( not ( = ?auto_2574188 ?auto_2574197 ) ) ( not ( = ?auto_2574188 ?auto_2574198 ) ) ( not ( = ?auto_2574188 ?auto_2574199 ) ) ( not ( = ?auto_2574188 ?auto_2574200 ) ) ( not ( = ?auto_2574189 ?auto_2574191 ) ) ( not ( = ?auto_2574189 ?auto_2574190 ) ) ( not ( = ?auto_2574189 ?auto_2574192 ) ) ( not ( = ?auto_2574189 ?auto_2574193 ) ) ( not ( = ?auto_2574189 ?auto_2574194 ) ) ( not ( = ?auto_2574189 ?auto_2574195 ) ) ( not ( = ?auto_2574189 ?auto_2574196 ) ) ( not ( = ?auto_2574189 ?auto_2574197 ) ) ( not ( = ?auto_2574189 ?auto_2574198 ) ) ( not ( = ?auto_2574189 ?auto_2574199 ) ) ( not ( = ?auto_2574189 ?auto_2574200 ) ) ( not ( = ?auto_2574191 ?auto_2574190 ) ) ( not ( = ?auto_2574191 ?auto_2574192 ) ) ( not ( = ?auto_2574191 ?auto_2574193 ) ) ( not ( = ?auto_2574191 ?auto_2574194 ) ) ( not ( = ?auto_2574191 ?auto_2574195 ) ) ( not ( = ?auto_2574191 ?auto_2574196 ) ) ( not ( = ?auto_2574191 ?auto_2574197 ) ) ( not ( = ?auto_2574191 ?auto_2574198 ) ) ( not ( = ?auto_2574191 ?auto_2574199 ) ) ( not ( = ?auto_2574191 ?auto_2574200 ) ) ( not ( = ?auto_2574190 ?auto_2574192 ) ) ( not ( = ?auto_2574190 ?auto_2574193 ) ) ( not ( = ?auto_2574190 ?auto_2574194 ) ) ( not ( = ?auto_2574190 ?auto_2574195 ) ) ( not ( = ?auto_2574190 ?auto_2574196 ) ) ( not ( = ?auto_2574190 ?auto_2574197 ) ) ( not ( = ?auto_2574190 ?auto_2574198 ) ) ( not ( = ?auto_2574190 ?auto_2574199 ) ) ( not ( = ?auto_2574190 ?auto_2574200 ) ) ( not ( = ?auto_2574192 ?auto_2574193 ) ) ( not ( = ?auto_2574192 ?auto_2574194 ) ) ( not ( = ?auto_2574192 ?auto_2574195 ) ) ( not ( = ?auto_2574192 ?auto_2574196 ) ) ( not ( = ?auto_2574192 ?auto_2574197 ) ) ( not ( = ?auto_2574192 ?auto_2574198 ) ) ( not ( = ?auto_2574192 ?auto_2574199 ) ) ( not ( = ?auto_2574192 ?auto_2574200 ) ) ( not ( = ?auto_2574193 ?auto_2574194 ) ) ( not ( = ?auto_2574193 ?auto_2574195 ) ) ( not ( = ?auto_2574193 ?auto_2574196 ) ) ( not ( = ?auto_2574193 ?auto_2574197 ) ) ( not ( = ?auto_2574193 ?auto_2574198 ) ) ( not ( = ?auto_2574193 ?auto_2574199 ) ) ( not ( = ?auto_2574193 ?auto_2574200 ) ) ( not ( = ?auto_2574194 ?auto_2574195 ) ) ( not ( = ?auto_2574194 ?auto_2574196 ) ) ( not ( = ?auto_2574194 ?auto_2574197 ) ) ( not ( = ?auto_2574194 ?auto_2574198 ) ) ( not ( = ?auto_2574194 ?auto_2574199 ) ) ( not ( = ?auto_2574194 ?auto_2574200 ) ) ( not ( = ?auto_2574195 ?auto_2574196 ) ) ( not ( = ?auto_2574195 ?auto_2574197 ) ) ( not ( = ?auto_2574195 ?auto_2574198 ) ) ( not ( = ?auto_2574195 ?auto_2574199 ) ) ( not ( = ?auto_2574195 ?auto_2574200 ) ) ( not ( = ?auto_2574196 ?auto_2574197 ) ) ( not ( = ?auto_2574196 ?auto_2574198 ) ) ( not ( = ?auto_2574196 ?auto_2574199 ) ) ( not ( = ?auto_2574196 ?auto_2574200 ) ) ( not ( = ?auto_2574197 ?auto_2574198 ) ) ( not ( = ?auto_2574197 ?auto_2574199 ) ) ( not ( = ?auto_2574197 ?auto_2574200 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2574198 ?auto_2574199 ?auto_2574200 )
      ( MAKE-13CRATE-VERIFY ?auto_2574187 ?auto_2574188 ?auto_2574189 ?auto_2574191 ?auto_2574190 ?auto_2574192 ?auto_2574193 ?auto_2574194 ?auto_2574195 ?auto_2574196 ?auto_2574197 ?auto_2574198 ?auto_2574199 ?auto_2574200 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2574356 - SURFACE
      ?auto_2574357 - SURFACE
      ?auto_2574358 - SURFACE
      ?auto_2574360 - SURFACE
      ?auto_2574359 - SURFACE
      ?auto_2574361 - SURFACE
      ?auto_2574362 - SURFACE
      ?auto_2574363 - SURFACE
      ?auto_2574364 - SURFACE
      ?auto_2574365 - SURFACE
      ?auto_2574366 - SURFACE
      ?auto_2574367 - SURFACE
      ?auto_2574368 - SURFACE
      ?auto_2574369 - SURFACE
    )
    :vars
    (
      ?auto_2574373 - HOIST
      ?auto_2574371 - PLACE
      ?auto_2574374 - TRUCK
      ?auto_2574372 - PLACE
      ?auto_2574370 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2574373 ?auto_2574371 ) ( SURFACE-AT ?auto_2574368 ?auto_2574371 ) ( CLEAR ?auto_2574368 ) ( IS-CRATE ?auto_2574369 ) ( not ( = ?auto_2574368 ?auto_2574369 ) ) ( AVAILABLE ?auto_2574373 ) ( ON ?auto_2574368 ?auto_2574367 ) ( not ( = ?auto_2574367 ?auto_2574368 ) ) ( not ( = ?auto_2574367 ?auto_2574369 ) ) ( TRUCK-AT ?auto_2574374 ?auto_2574372 ) ( not ( = ?auto_2574372 ?auto_2574371 ) ) ( HOIST-AT ?auto_2574370 ?auto_2574372 ) ( LIFTING ?auto_2574370 ?auto_2574369 ) ( not ( = ?auto_2574373 ?auto_2574370 ) ) ( ON ?auto_2574357 ?auto_2574356 ) ( ON ?auto_2574358 ?auto_2574357 ) ( ON ?auto_2574360 ?auto_2574358 ) ( ON ?auto_2574359 ?auto_2574360 ) ( ON ?auto_2574361 ?auto_2574359 ) ( ON ?auto_2574362 ?auto_2574361 ) ( ON ?auto_2574363 ?auto_2574362 ) ( ON ?auto_2574364 ?auto_2574363 ) ( ON ?auto_2574365 ?auto_2574364 ) ( ON ?auto_2574366 ?auto_2574365 ) ( ON ?auto_2574367 ?auto_2574366 ) ( not ( = ?auto_2574356 ?auto_2574357 ) ) ( not ( = ?auto_2574356 ?auto_2574358 ) ) ( not ( = ?auto_2574356 ?auto_2574360 ) ) ( not ( = ?auto_2574356 ?auto_2574359 ) ) ( not ( = ?auto_2574356 ?auto_2574361 ) ) ( not ( = ?auto_2574356 ?auto_2574362 ) ) ( not ( = ?auto_2574356 ?auto_2574363 ) ) ( not ( = ?auto_2574356 ?auto_2574364 ) ) ( not ( = ?auto_2574356 ?auto_2574365 ) ) ( not ( = ?auto_2574356 ?auto_2574366 ) ) ( not ( = ?auto_2574356 ?auto_2574367 ) ) ( not ( = ?auto_2574356 ?auto_2574368 ) ) ( not ( = ?auto_2574356 ?auto_2574369 ) ) ( not ( = ?auto_2574357 ?auto_2574358 ) ) ( not ( = ?auto_2574357 ?auto_2574360 ) ) ( not ( = ?auto_2574357 ?auto_2574359 ) ) ( not ( = ?auto_2574357 ?auto_2574361 ) ) ( not ( = ?auto_2574357 ?auto_2574362 ) ) ( not ( = ?auto_2574357 ?auto_2574363 ) ) ( not ( = ?auto_2574357 ?auto_2574364 ) ) ( not ( = ?auto_2574357 ?auto_2574365 ) ) ( not ( = ?auto_2574357 ?auto_2574366 ) ) ( not ( = ?auto_2574357 ?auto_2574367 ) ) ( not ( = ?auto_2574357 ?auto_2574368 ) ) ( not ( = ?auto_2574357 ?auto_2574369 ) ) ( not ( = ?auto_2574358 ?auto_2574360 ) ) ( not ( = ?auto_2574358 ?auto_2574359 ) ) ( not ( = ?auto_2574358 ?auto_2574361 ) ) ( not ( = ?auto_2574358 ?auto_2574362 ) ) ( not ( = ?auto_2574358 ?auto_2574363 ) ) ( not ( = ?auto_2574358 ?auto_2574364 ) ) ( not ( = ?auto_2574358 ?auto_2574365 ) ) ( not ( = ?auto_2574358 ?auto_2574366 ) ) ( not ( = ?auto_2574358 ?auto_2574367 ) ) ( not ( = ?auto_2574358 ?auto_2574368 ) ) ( not ( = ?auto_2574358 ?auto_2574369 ) ) ( not ( = ?auto_2574360 ?auto_2574359 ) ) ( not ( = ?auto_2574360 ?auto_2574361 ) ) ( not ( = ?auto_2574360 ?auto_2574362 ) ) ( not ( = ?auto_2574360 ?auto_2574363 ) ) ( not ( = ?auto_2574360 ?auto_2574364 ) ) ( not ( = ?auto_2574360 ?auto_2574365 ) ) ( not ( = ?auto_2574360 ?auto_2574366 ) ) ( not ( = ?auto_2574360 ?auto_2574367 ) ) ( not ( = ?auto_2574360 ?auto_2574368 ) ) ( not ( = ?auto_2574360 ?auto_2574369 ) ) ( not ( = ?auto_2574359 ?auto_2574361 ) ) ( not ( = ?auto_2574359 ?auto_2574362 ) ) ( not ( = ?auto_2574359 ?auto_2574363 ) ) ( not ( = ?auto_2574359 ?auto_2574364 ) ) ( not ( = ?auto_2574359 ?auto_2574365 ) ) ( not ( = ?auto_2574359 ?auto_2574366 ) ) ( not ( = ?auto_2574359 ?auto_2574367 ) ) ( not ( = ?auto_2574359 ?auto_2574368 ) ) ( not ( = ?auto_2574359 ?auto_2574369 ) ) ( not ( = ?auto_2574361 ?auto_2574362 ) ) ( not ( = ?auto_2574361 ?auto_2574363 ) ) ( not ( = ?auto_2574361 ?auto_2574364 ) ) ( not ( = ?auto_2574361 ?auto_2574365 ) ) ( not ( = ?auto_2574361 ?auto_2574366 ) ) ( not ( = ?auto_2574361 ?auto_2574367 ) ) ( not ( = ?auto_2574361 ?auto_2574368 ) ) ( not ( = ?auto_2574361 ?auto_2574369 ) ) ( not ( = ?auto_2574362 ?auto_2574363 ) ) ( not ( = ?auto_2574362 ?auto_2574364 ) ) ( not ( = ?auto_2574362 ?auto_2574365 ) ) ( not ( = ?auto_2574362 ?auto_2574366 ) ) ( not ( = ?auto_2574362 ?auto_2574367 ) ) ( not ( = ?auto_2574362 ?auto_2574368 ) ) ( not ( = ?auto_2574362 ?auto_2574369 ) ) ( not ( = ?auto_2574363 ?auto_2574364 ) ) ( not ( = ?auto_2574363 ?auto_2574365 ) ) ( not ( = ?auto_2574363 ?auto_2574366 ) ) ( not ( = ?auto_2574363 ?auto_2574367 ) ) ( not ( = ?auto_2574363 ?auto_2574368 ) ) ( not ( = ?auto_2574363 ?auto_2574369 ) ) ( not ( = ?auto_2574364 ?auto_2574365 ) ) ( not ( = ?auto_2574364 ?auto_2574366 ) ) ( not ( = ?auto_2574364 ?auto_2574367 ) ) ( not ( = ?auto_2574364 ?auto_2574368 ) ) ( not ( = ?auto_2574364 ?auto_2574369 ) ) ( not ( = ?auto_2574365 ?auto_2574366 ) ) ( not ( = ?auto_2574365 ?auto_2574367 ) ) ( not ( = ?auto_2574365 ?auto_2574368 ) ) ( not ( = ?auto_2574365 ?auto_2574369 ) ) ( not ( = ?auto_2574366 ?auto_2574367 ) ) ( not ( = ?auto_2574366 ?auto_2574368 ) ) ( not ( = ?auto_2574366 ?auto_2574369 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2574367 ?auto_2574368 ?auto_2574369 )
      ( MAKE-13CRATE-VERIFY ?auto_2574356 ?auto_2574357 ?auto_2574358 ?auto_2574360 ?auto_2574359 ?auto_2574361 ?auto_2574362 ?auto_2574363 ?auto_2574364 ?auto_2574365 ?auto_2574366 ?auto_2574367 ?auto_2574368 ?auto_2574369 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2574538 - SURFACE
      ?auto_2574539 - SURFACE
      ?auto_2574540 - SURFACE
      ?auto_2574542 - SURFACE
      ?auto_2574541 - SURFACE
      ?auto_2574543 - SURFACE
      ?auto_2574544 - SURFACE
      ?auto_2574545 - SURFACE
      ?auto_2574546 - SURFACE
      ?auto_2574547 - SURFACE
      ?auto_2574548 - SURFACE
      ?auto_2574549 - SURFACE
      ?auto_2574550 - SURFACE
      ?auto_2574551 - SURFACE
    )
    :vars
    (
      ?auto_2574553 - HOIST
      ?auto_2574555 - PLACE
      ?auto_2574554 - TRUCK
      ?auto_2574556 - PLACE
      ?auto_2574557 - HOIST
      ?auto_2574552 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2574553 ?auto_2574555 ) ( SURFACE-AT ?auto_2574550 ?auto_2574555 ) ( CLEAR ?auto_2574550 ) ( IS-CRATE ?auto_2574551 ) ( not ( = ?auto_2574550 ?auto_2574551 ) ) ( AVAILABLE ?auto_2574553 ) ( ON ?auto_2574550 ?auto_2574549 ) ( not ( = ?auto_2574549 ?auto_2574550 ) ) ( not ( = ?auto_2574549 ?auto_2574551 ) ) ( TRUCK-AT ?auto_2574554 ?auto_2574556 ) ( not ( = ?auto_2574556 ?auto_2574555 ) ) ( HOIST-AT ?auto_2574557 ?auto_2574556 ) ( not ( = ?auto_2574553 ?auto_2574557 ) ) ( AVAILABLE ?auto_2574557 ) ( SURFACE-AT ?auto_2574551 ?auto_2574556 ) ( ON ?auto_2574551 ?auto_2574552 ) ( CLEAR ?auto_2574551 ) ( not ( = ?auto_2574550 ?auto_2574552 ) ) ( not ( = ?auto_2574551 ?auto_2574552 ) ) ( not ( = ?auto_2574549 ?auto_2574552 ) ) ( ON ?auto_2574539 ?auto_2574538 ) ( ON ?auto_2574540 ?auto_2574539 ) ( ON ?auto_2574542 ?auto_2574540 ) ( ON ?auto_2574541 ?auto_2574542 ) ( ON ?auto_2574543 ?auto_2574541 ) ( ON ?auto_2574544 ?auto_2574543 ) ( ON ?auto_2574545 ?auto_2574544 ) ( ON ?auto_2574546 ?auto_2574545 ) ( ON ?auto_2574547 ?auto_2574546 ) ( ON ?auto_2574548 ?auto_2574547 ) ( ON ?auto_2574549 ?auto_2574548 ) ( not ( = ?auto_2574538 ?auto_2574539 ) ) ( not ( = ?auto_2574538 ?auto_2574540 ) ) ( not ( = ?auto_2574538 ?auto_2574542 ) ) ( not ( = ?auto_2574538 ?auto_2574541 ) ) ( not ( = ?auto_2574538 ?auto_2574543 ) ) ( not ( = ?auto_2574538 ?auto_2574544 ) ) ( not ( = ?auto_2574538 ?auto_2574545 ) ) ( not ( = ?auto_2574538 ?auto_2574546 ) ) ( not ( = ?auto_2574538 ?auto_2574547 ) ) ( not ( = ?auto_2574538 ?auto_2574548 ) ) ( not ( = ?auto_2574538 ?auto_2574549 ) ) ( not ( = ?auto_2574538 ?auto_2574550 ) ) ( not ( = ?auto_2574538 ?auto_2574551 ) ) ( not ( = ?auto_2574538 ?auto_2574552 ) ) ( not ( = ?auto_2574539 ?auto_2574540 ) ) ( not ( = ?auto_2574539 ?auto_2574542 ) ) ( not ( = ?auto_2574539 ?auto_2574541 ) ) ( not ( = ?auto_2574539 ?auto_2574543 ) ) ( not ( = ?auto_2574539 ?auto_2574544 ) ) ( not ( = ?auto_2574539 ?auto_2574545 ) ) ( not ( = ?auto_2574539 ?auto_2574546 ) ) ( not ( = ?auto_2574539 ?auto_2574547 ) ) ( not ( = ?auto_2574539 ?auto_2574548 ) ) ( not ( = ?auto_2574539 ?auto_2574549 ) ) ( not ( = ?auto_2574539 ?auto_2574550 ) ) ( not ( = ?auto_2574539 ?auto_2574551 ) ) ( not ( = ?auto_2574539 ?auto_2574552 ) ) ( not ( = ?auto_2574540 ?auto_2574542 ) ) ( not ( = ?auto_2574540 ?auto_2574541 ) ) ( not ( = ?auto_2574540 ?auto_2574543 ) ) ( not ( = ?auto_2574540 ?auto_2574544 ) ) ( not ( = ?auto_2574540 ?auto_2574545 ) ) ( not ( = ?auto_2574540 ?auto_2574546 ) ) ( not ( = ?auto_2574540 ?auto_2574547 ) ) ( not ( = ?auto_2574540 ?auto_2574548 ) ) ( not ( = ?auto_2574540 ?auto_2574549 ) ) ( not ( = ?auto_2574540 ?auto_2574550 ) ) ( not ( = ?auto_2574540 ?auto_2574551 ) ) ( not ( = ?auto_2574540 ?auto_2574552 ) ) ( not ( = ?auto_2574542 ?auto_2574541 ) ) ( not ( = ?auto_2574542 ?auto_2574543 ) ) ( not ( = ?auto_2574542 ?auto_2574544 ) ) ( not ( = ?auto_2574542 ?auto_2574545 ) ) ( not ( = ?auto_2574542 ?auto_2574546 ) ) ( not ( = ?auto_2574542 ?auto_2574547 ) ) ( not ( = ?auto_2574542 ?auto_2574548 ) ) ( not ( = ?auto_2574542 ?auto_2574549 ) ) ( not ( = ?auto_2574542 ?auto_2574550 ) ) ( not ( = ?auto_2574542 ?auto_2574551 ) ) ( not ( = ?auto_2574542 ?auto_2574552 ) ) ( not ( = ?auto_2574541 ?auto_2574543 ) ) ( not ( = ?auto_2574541 ?auto_2574544 ) ) ( not ( = ?auto_2574541 ?auto_2574545 ) ) ( not ( = ?auto_2574541 ?auto_2574546 ) ) ( not ( = ?auto_2574541 ?auto_2574547 ) ) ( not ( = ?auto_2574541 ?auto_2574548 ) ) ( not ( = ?auto_2574541 ?auto_2574549 ) ) ( not ( = ?auto_2574541 ?auto_2574550 ) ) ( not ( = ?auto_2574541 ?auto_2574551 ) ) ( not ( = ?auto_2574541 ?auto_2574552 ) ) ( not ( = ?auto_2574543 ?auto_2574544 ) ) ( not ( = ?auto_2574543 ?auto_2574545 ) ) ( not ( = ?auto_2574543 ?auto_2574546 ) ) ( not ( = ?auto_2574543 ?auto_2574547 ) ) ( not ( = ?auto_2574543 ?auto_2574548 ) ) ( not ( = ?auto_2574543 ?auto_2574549 ) ) ( not ( = ?auto_2574543 ?auto_2574550 ) ) ( not ( = ?auto_2574543 ?auto_2574551 ) ) ( not ( = ?auto_2574543 ?auto_2574552 ) ) ( not ( = ?auto_2574544 ?auto_2574545 ) ) ( not ( = ?auto_2574544 ?auto_2574546 ) ) ( not ( = ?auto_2574544 ?auto_2574547 ) ) ( not ( = ?auto_2574544 ?auto_2574548 ) ) ( not ( = ?auto_2574544 ?auto_2574549 ) ) ( not ( = ?auto_2574544 ?auto_2574550 ) ) ( not ( = ?auto_2574544 ?auto_2574551 ) ) ( not ( = ?auto_2574544 ?auto_2574552 ) ) ( not ( = ?auto_2574545 ?auto_2574546 ) ) ( not ( = ?auto_2574545 ?auto_2574547 ) ) ( not ( = ?auto_2574545 ?auto_2574548 ) ) ( not ( = ?auto_2574545 ?auto_2574549 ) ) ( not ( = ?auto_2574545 ?auto_2574550 ) ) ( not ( = ?auto_2574545 ?auto_2574551 ) ) ( not ( = ?auto_2574545 ?auto_2574552 ) ) ( not ( = ?auto_2574546 ?auto_2574547 ) ) ( not ( = ?auto_2574546 ?auto_2574548 ) ) ( not ( = ?auto_2574546 ?auto_2574549 ) ) ( not ( = ?auto_2574546 ?auto_2574550 ) ) ( not ( = ?auto_2574546 ?auto_2574551 ) ) ( not ( = ?auto_2574546 ?auto_2574552 ) ) ( not ( = ?auto_2574547 ?auto_2574548 ) ) ( not ( = ?auto_2574547 ?auto_2574549 ) ) ( not ( = ?auto_2574547 ?auto_2574550 ) ) ( not ( = ?auto_2574547 ?auto_2574551 ) ) ( not ( = ?auto_2574547 ?auto_2574552 ) ) ( not ( = ?auto_2574548 ?auto_2574549 ) ) ( not ( = ?auto_2574548 ?auto_2574550 ) ) ( not ( = ?auto_2574548 ?auto_2574551 ) ) ( not ( = ?auto_2574548 ?auto_2574552 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2574549 ?auto_2574550 ?auto_2574551 )
      ( MAKE-13CRATE-VERIFY ?auto_2574538 ?auto_2574539 ?auto_2574540 ?auto_2574542 ?auto_2574541 ?auto_2574543 ?auto_2574544 ?auto_2574545 ?auto_2574546 ?auto_2574547 ?auto_2574548 ?auto_2574549 ?auto_2574550 ?auto_2574551 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2574721 - SURFACE
      ?auto_2574722 - SURFACE
      ?auto_2574723 - SURFACE
      ?auto_2574725 - SURFACE
      ?auto_2574724 - SURFACE
      ?auto_2574726 - SURFACE
      ?auto_2574727 - SURFACE
      ?auto_2574728 - SURFACE
      ?auto_2574729 - SURFACE
      ?auto_2574730 - SURFACE
      ?auto_2574731 - SURFACE
      ?auto_2574732 - SURFACE
      ?auto_2574733 - SURFACE
      ?auto_2574734 - SURFACE
    )
    :vars
    (
      ?auto_2574736 - HOIST
      ?auto_2574737 - PLACE
      ?auto_2574735 - PLACE
      ?auto_2574740 - HOIST
      ?auto_2574739 - SURFACE
      ?auto_2574738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2574736 ?auto_2574737 ) ( SURFACE-AT ?auto_2574733 ?auto_2574737 ) ( CLEAR ?auto_2574733 ) ( IS-CRATE ?auto_2574734 ) ( not ( = ?auto_2574733 ?auto_2574734 ) ) ( AVAILABLE ?auto_2574736 ) ( ON ?auto_2574733 ?auto_2574732 ) ( not ( = ?auto_2574732 ?auto_2574733 ) ) ( not ( = ?auto_2574732 ?auto_2574734 ) ) ( not ( = ?auto_2574735 ?auto_2574737 ) ) ( HOIST-AT ?auto_2574740 ?auto_2574735 ) ( not ( = ?auto_2574736 ?auto_2574740 ) ) ( AVAILABLE ?auto_2574740 ) ( SURFACE-AT ?auto_2574734 ?auto_2574735 ) ( ON ?auto_2574734 ?auto_2574739 ) ( CLEAR ?auto_2574734 ) ( not ( = ?auto_2574733 ?auto_2574739 ) ) ( not ( = ?auto_2574734 ?auto_2574739 ) ) ( not ( = ?auto_2574732 ?auto_2574739 ) ) ( TRUCK-AT ?auto_2574738 ?auto_2574737 ) ( ON ?auto_2574722 ?auto_2574721 ) ( ON ?auto_2574723 ?auto_2574722 ) ( ON ?auto_2574725 ?auto_2574723 ) ( ON ?auto_2574724 ?auto_2574725 ) ( ON ?auto_2574726 ?auto_2574724 ) ( ON ?auto_2574727 ?auto_2574726 ) ( ON ?auto_2574728 ?auto_2574727 ) ( ON ?auto_2574729 ?auto_2574728 ) ( ON ?auto_2574730 ?auto_2574729 ) ( ON ?auto_2574731 ?auto_2574730 ) ( ON ?auto_2574732 ?auto_2574731 ) ( not ( = ?auto_2574721 ?auto_2574722 ) ) ( not ( = ?auto_2574721 ?auto_2574723 ) ) ( not ( = ?auto_2574721 ?auto_2574725 ) ) ( not ( = ?auto_2574721 ?auto_2574724 ) ) ( not ( = ?auto_2574721 ?auto_2574726 ) ) ( not ( = ?auto_2574721 ?auto_2574727 ) ) ( not ( = ?auto_2574721 ?auto_2574728 ) ) ( not ( = ?auto_2574721 ?auto_2574729 ) ) ( not ( = ?auto_2574721 ?auto_2574730 ) ) ( not ( = ?auto_2574721 ?auto_2574731 ) ) ( not ( = ?auto_2574721 ?auto_2574732 ) ) ( not ( = ?auto_2574721 ?auto_2574733 ) ) ( not ( = ?auto_2574721 ?auto_2574734 ) ) ( not ( = ?auto_2574721 ?auto_2574739 ) ) ( not ( = ?auto_2574722 ?auto_2574723 ) ) ( not ( = ?auto_2574722 ?auto_2574725 ) ) ( not ( = ?auto_2574722 ?auto_2574724 ) ) ( not ( = ?auto_2574722 ?auto_2574726 ) ) ( not ( = ?auto_2574722 ?auto_2574727 ) ) ( not ( = ?auto_2574722 ?auto_2574728 ) ) ( not ( = ?auto_2574722 ?auto_2574729 ) ) ( not ( = ?auto_2574722 ?auto_2574730 ) ) ( not ( = ?auto_2574722 ?auto_2574731 ) ) ( not ( = ?auto_2574722 ?auto_2574732 ) ) ( not ( = ?auto_2574722 ?auto_2574733 ) ) ( not ( = ?auto_2574722 ?auto_2574734 ) ) ( not ( = ?auto_2574722 ?auto_2574739 ) ) ( not ( = ?auto_2574723 ?auto_2574725 ) ) ( not ( = ?auto_2574723 ?auto_2574724 ) ) ( not ( = ?auto_2574723 ?auto_2574726 ) ) ( not ( = ?auto_2574723 ?auto_2574727 ) ) ( not ( = ?auto_2574723 ?auto_2574728 ) ) ( not ( = ?auto_2574723 ?auto_2574729 ) ) ( not ( = ?auto_2574723 ?auto_2574730 ) ) ( not ( = ?auto_2574723 ?auto_2574731 ) ) ( not ( = ?auto_2574723 ?auto_2574732 ) ) ( not ( = ?auto_2574723 ?auto_2574733 ) ) ( not ( = ?auto_2574723 ?auto_2574734 ) ) ( not ( = ?auto_2574723 ?auto_2574739 ) ) ( not ( = ?auto_2574725 ?auto_2574724 ) ) ( not ( = ?auto_2574725 ?auto_2574726 ) ) ( not ( = ?auto_2574725 ?auto_2574727 ) ) ( not ( = ?auto_2574725 ?auto_2574728 ) ) ( not ( = ?auto_2574725 ?auto_2574729 ) ) ( not ( = ?auto_2574725 ?auto_2574730 ) ) ( not ( = ?auto_2574725 ?auto_2574731 ) ) ( not ( = ?auto_2574725 ?auto_2574732 ) ) ( not ( = ?auto_2574725 ?auto_2574733 ) ) ( not ( = ?auto_2574725 ?auto_2574734 ) ) ( not ( = ?auto_2574725 ?auto_2574739 ) ) ( not ( = ?auto_2574724 ?auto_2574726 ) ) ( not ( = ?auto_2574724 ?auto_2574727 ) ) ( not ( = ?auto_2574724 ?auto_2574728 ) ) ( not ( = ?auto_2574724 ?auto_2574729 ) ) ( not ( = ?auto_2574724 ?auto_2574730 ) ) ( not ( = ?auto_2574724 ?auto_2574731 ) ) ( not ( = ?auto_2574724 ?auto_2574732 ) ) ( not ( = ?auto_2574724 ?auto_2574733 ) ) ( not ( = ?auto_2574724 ?auto_2574734 ) ) ( not ( = ?auto_2574724 ?auto_2574739 ) ) ( not ( = ?auto_2574726 ?auto_2574727 ) ) ( not ( = ?auto_2574726 ?auto_2574728 ) ) ( not ( = ?auto_2574726 ?auto_2574729 ) ) ( not ( = ?auto_2574726 ?auto_2574730 ) ) ( not ( = ?auto_2574726 ?auto_2574731 ) ) ( not ( = ?auto_2574726 ?auto_2574732 ) ) ( not ( = ?auto_2574726 ?auto_2574733 ) ) ( not ( = ?auto_2574726 ?auto_2574734 ) ) ( not ( = ?auto_2574726 ?auto_2574739 ) ) ( not ( = ?auto_2574727 ?auto_2574728 ) ) ( not ( = ?auto_2574727 ?auto_2574729 ) ) ( not ( = ?auto_2574727 ?auto_2574730 ) ) ( not ( = ?auto_2574727 ?auto_2574731 ) ) ( not ( = ?auto_2574727 ?auto_2574732 ) ) ( not ( = ?auto_2574727 ?auto_2574733 ) ) ( not ( = ?auto_2574727 ?auto_2574734 ) ) ( not ( = ?auto_2574727 ?auto_2574739 ) ) ( not ( = ?auto_2574728 ?auto_2574729 ) ) ( not ( = ?auto_2574728 ?auto_2574730 ) ) ( not ( = ?auto_2574728 ?auto_2574731 ) ) ( not ( = ?auto_2574728 ?auto_2574732 ) ) ( not ( = ?auto_2574728 ?auto_2574733 ) ) ( not ( = ?auto_2574728 ?auto_2574734 ) ) ( not ( = ?auto_2574728 ?auto_2574739 ) ) ( not ( = ?auto_2574729 ?auto_2574730 ) ) ( not ( = ?auto_2574729 ?auto_2574731 ) ) ( not ( = ?auto_2574729 ?auto_2574732 ) ) ( not ( = ?auto_2574729 ?auto_2574733 ) ) ( not ( = ?auto_2574729 ?auto_2574734 ) ) ( not ( = ?auto_2574729 ?auto_2574739 ) ) ( not ( = ?auto_2574730 ?auto_2574731 ) ) ( not ( = ?auto_2574730 ?auto_2574732 ) ) ( not ( = ?auto_2574730 ?auto_2574733 ) ) ( not ( = ?auto_2574730 ?auto_2574734 ) ) ( not ( = ?auto_2574730 ?auto_2574739 ) ) ( not ( = ?auto_2574731 ?auto_2574732 ) ) ( not ( = ?auto_2574731 ?auto_2574733 ) ) ( not ( = ?auto_2574731 ?auto_2574734 ) ) ( not ( = ?auto_2574731 ?auto_2574739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2574732 ?auto_2574733 ?auto_2574734 )
      ( MAKE-13CRATE-VERIFY ?auto_2574721 ?auto_2574722 ?auto_2574723 ?auto_2574725 ?auto_2574724 ?auto_2574726 ?auto_2574727 ?auto_2574728 ?auto_2574729 ?auto_2574730 ?auto_2574731 ?auto_2574732 ?auto_2574733 ?auto_2574734 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2574904 - SURFACE
      ?auto_2574905 - SURFACE
      ?auto_2574906 - SURFACE
      ?auto_2574908 - SURFACE
      ?auto_2574907 - SURFACE
      ?auto_2574909 - SURFACE
      ?auto_2574910 - SURFACE
      ?auto_2574911 - SURFACE
      ?auto_2574912 - SURFACE
      ?auto_2574913 - SURFACE
      ?auto_2574914 - SURFACE
      ?auto_2574915 - SURFACE
      ?auto_2574916 - SURFACE
      ?auto_2574917 - SURFACE
    )
    :vars
    (
      ?auto_2574918 - HOIST
      ?auto_2574921 - PLACE
      ?auto_2574922 - PLACE
      ?auto_2574923 - HOIST
      ?auto_2574920 - SURFACE
      ?auto_2574919 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2574918 ?auto_2574921 ) ( IS-CRATE ?auto_2574917 ) ( not ( = ?auto_2574916 ?auto_2574917 ) ) ( not ( = ?auto_2574915 ?auto_2574916 ) ) ( not ( = ?auto_2574915 ?auto_2574917 ) ) ( not ( = ?auto_2574922 ?auto_2574921 ) ) ( HOIST-AT ?auto_2574923 ?auto_2574922 ) ( not ( = ?auto_2574918 ?auto_2574923 ) ) ( AVAILABLE ?auto_2574923 ) ( SURFACE-AT ?auto_2574917 ?auto_2574922 ) ( ON ?auto_2574917 ?auto_2574920 ) ( CLEAR ?auto_2574917 ) ( not ( = ?auto_2574916 ?auto_2574920 ) ) ( not ( = ?auto_2574917 ?auto_2574920 ) ) ( not ( = ?auto_2574915 ?auto_2574920 ) ) ( TRUCK-AT ?auto_2574919 ?auto_2574921 ) ( SURFACE-AT ?auto_2574915 ?auto_2574921 ) ( CLEAR ?auto_2574915 ) ( LIFTING ?auto_2574918 ?auto_2574916 ) ( IS-CRATE ?auto_2574916 ) ( ON ?auto_2574905 ?auto_2574904 ) ( ON ?auto_2574906 ?auto_2574905 ) ( ON ?auto_2574908 ?auto_2574906 ) ( ON ?auto_2574907 ?auto_2574908 ) ( ON ?auto_2574909 ?auto_2574907 ) ( ON ?auto_2574910 ?auto_2574909 ) ( ON ?auto_2574911 ?auto_2574910 ) ( ON ?auto_2574912 ?auto_2574911 ) ( ON ?auto_2574913 ?auto_2574912 ) ( ON ?auto_2574914 ?auto_2574913 ) ( ON ?auto_2574915 ?auto_2574914 ) ( not ( = ?auto_2574904 ?auto_2574905 ) ) ( not ( = ?auto_2574904 ?auto_2574906 ) ) ( not ( = ?auto_2574904 ?auto_2574908 ) ) ( not ( = ?auto_2574904 ?auto_2574907 ) ) ( not ( = ?auto_2574904 ?auto_2574909 ) ) ( not ( = ?auto_2574904 ?auto_2574910 ) ) ( not ( = ?auto_2574904 ?auto_2574911 ) ) ( not ( = ?auto_2574904 ?auto_2574912 ) ) ( not ( = ?auto_2574904 ?auto_2574913 ) ) ( not ( = ?auto_2574904 ?auto_2574914 ) ) ( not ( = ?auto_2574904 ?auto_2574915 ) ) ( not ( = ?auto_2574904 ?auto_2574916 ) ) ( not ( = ?auto_2574904 ?auto_2574917 ) ) ( not ( = ?auto_2574904 ?auto_2574920 ) ) ( not ( = ?auto_2574905 ?auto_2574906 ) ) ( not ( = ?auto_2574905 ?auto_2574908 ) ) ( not ( = ?auto_2574905 ?auto_2574907 ) ) ( not ( = ?auto_2574905 ?auto_2574909 ) ) ( not ( = ?auto_2574905 ?auto_2574910 ) ) ( not ( = ?auto_2574905 ?auto_2574911 ) ) ( not ( = ?auto_2574905 ?auto_2574912 ) ) ( not ( = ?auto_2574905 ?auto_2574913 ) ) ( not ( = ?auto_2574905 ?auto_2574914 ) ) ( not ( = ?auto_2574905 ?auto_2574915 ) ) ( not ( = ?auto_2574905 ?auto_2574916 ) ) ( not ( = ?auto_2574905 ?auto_2574917 ) ) ( not ( = ?auto_2574905 ?auto_2574920 ) ) ( not ( = ?auto_2574906 ?auto_2574908 ) ) ( not ( = ?auto_2574906 ?auto_2574907 ) ) ( not ( = ?auto_2574906 ?auto_2574909 ) ) ( not ( = ?auto_2574906 ?auto_2574910 ) ) ( not ( = ?auto_2574906 ?auto_2574911 ) ) ( not ( = ?auto_2574906 ?auto_2574912 ) ) ( not ( = ?auto_2574906 ?auto_2574913 ) ) ( not ( = ?auto_2574906 ?auto_2574914 ) ) ( not ( = ?auto_2574906 ?auto_2574915 ) ) ( not ( = ?auto_2574906 ?auto_2574916 ) ) ( not ( = ?auto_2574906 ?auto_2574917 ) ) ( not ( = ?auto_2574906 ?auto_2574920 ) ) ( not ( = ?auto_2574908 ?auto_2574907 ) ) ( not ( = ?auto_2574908 ?auto_2574909 ) ) ( not ( = ?auto_2574908 ?auto_2574910 ) ) ( not ( = ?auto_2574908 ?auto_2574911 ) ) ( not ( = ?auto_2574908 ?auto_2574912 ) ) ( not ( = ?auto_2574908 ?auto_2574913 ) ) ( not ( = ?auto_2574908 ?auto_2574914 ) ) ( not ( = ?auto_2574908 ?auto_2574915 ) ) ( not ( = ?auto_2574908 ?auto_2574916 ) ) ( not ( = ?auto_2574908 ?auto_2574917 ) ) ( not ( = ?auto_2574908 ?auto_2574920 ) ) ( not ( = ?auto_2574907 ?auto_2574909 ) ) ( not ( = ?auto_2574907 ?auto_2574910 ) ) ( not ( = ?auto_2574907 ?auto_2574911 ) ) ( not ( = ?auto_2574907 ?auto_2574912 ) ) ( not ( = ?auto_2574907 ?auto_2574913 ) ) ( not ( = ?auto_2574907 ?auto_2574914 ) ) ( not ( = ?auto_2574907 ?auto_2574915 ) ) ( not ( = ?auto_2574907 ?auto_2574916 ) ) ( not ( = ?auto_2574907 ?auto_2574917 ) ) ( not ( = ?auto_2574907 ?auto_2574920 ) ) ( not ( = ?auto_2574909 ?auto_2574910 ) ) ( not ( = ?auto_2574909 ?auto_2574911 ) ) ( not ( = ?auto_2574909 ?auto_2574912 ) ) ( not ( = ?auto_2574909 ?auto_2574913 ) ) ( not ( = ?auto_2574909 ?auto_2574914 ) ) ( not ( = ?auto_2574909 ?auto_2574915 ) ) ( not ( = ?auto_2574909 ?auto_2574916 ) ) ( not ( = ?auto_2574909 ?auto_2574917 ) ) ( not ( = ?auto_2574909 ?auto_2574920 ) ) ( not ( = ?auto_2574910 ?auto_2574911 ) ) ( not ( = ?auto_2574910 ?auto_2574912 ) ) ( not ( = ?auto_2574910 ?auto_2574913 ) ) ( not ( = ?auto_2574910 ?auto_2574914 ) ) ( not ( = ?auto_2574910 ?auto_2574915 ) ) ( not ( = ?auto_2574910 ?auto_2574916 ) ) ( not ( = ?auto_2574910 ?auto_2574917 ) ) ( not ( = ?auto_2574910 ?auto_2574920 ) ) ( not ( = ?auto_2574911 ?auto_2574912 ) ) ( not ( = ?auto_2574911 ?auto_2574913 ) ) ( not ( = ?auto_2574911 ?auto_2574914 ) ) ( not ( = ?auto_2574911 ?auto_2574915 ) ) ( not ( = ?auto_2574911 ?auto_2574916 ) ) ( not ( = ?auto_2574911 ?auto_2574917 ) ) ( not ( = ?auto_2574911 ?auto_2574920 ) ) ( not ( = ?auto_2574912 ?auto_2574913 ) ) ( not ( = ?auto_2574912 ?auto_2574914 ) ) ( not ( = ?auto_2574912 ?auto_2574915 ) ) ( not ( = ?auto_2574912 ?auto_2574916 ) ) ( not ( = ?auto_2574912 ?auto_2574917 ) ) ( not ( = ?auto_2574912 ?auto_2574920 ) ) ( not ( = ?auto_2574913 ?auto_2574914 ) ) ( not ( = ?auto_2574913 ?auto_2574915 ) ) ( not ( = ?auto_2574913 ?auto_2574916 ) ) ( not ( = ?auto_2574913 ?auto_2574917 ) ) ( not ( = ?auto_2574913 ?auto_2574920 ) ) ( not ( = ?auto_2574914 ?auto_2574915 ) ) ( not ( = ?auto_2574914 ?auto_2574916 ) ) ( not ( = ?auto_2574914 ?auto_2574917 ) ) ( not ( = ?auto_2574914 ?auto_2574920 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2574915 ?auto_2574916 ?auto_2574917 )
      ( MAKE-13CRATE-VERIFY ?auto_2574904 ?auto_2574905 ?auto_2574906 ?auto_2574908 ?auto_2574907 ?auto_2574909 ?auto_2574910 ?auto_2574911 ?auto_2574912 ?auto_2574913 ?auto_2574914 ?auto_2574915 ?auto_2574916 ?auto_2574917 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2575087 - SURFACE
      ?auto_2575088 - SURFACE
      ?auto_2575089 - SURFACE
      ?auto_2575091 - SURFACE
      ?auto_2575090 - SURFACE
      ?auto_2575092 - SURFACE
      ?auto_2575093 - SURFACE
      ?auto_2575094 - SURFACE
      ?auto_2575095 - SURFACE
      ?auto_2575096 - SURFACE
      ?auto_2575097 - SURFACE
      ?auto_2575098 - SURFACE
      ?auto_2575099 - SURFACE
      ?auto_2575100 - SURFACE
    )
    :vars
    (
      ?auto_2575105 - HOIST
      ?auto_2575102 - PLACE
      ?auto_2575103 - PLACE
      ?auto_2575106 - HOIST
      ?auto_2575104 - SURFACE
      ?auto_2575101 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2575105 ?auto_2575102 ) ( IS-CRATE ?auto_2575100 ) ( not ( = ?auto_2575099 ?auto_2575100 ) ) ( not ( = ?auto_2575098 ?auto_2575099 ) ) ( not ( = ?auto_2575098 ?auto_2575100 ) ) ( not ( = ?auto_2575103 ?auto_2575102 ) ) ( HOIST-AT ?auto_2575106 ?auto_2575103 ) ( not ( = ?auto_2575105 ?auto_2575106 ) ) ( AVAILABLE ?auto_2575106 ) ( SURFACE-AT ?auto_2575100 ?auto_2575103 ) ( ON ?auto_2575100 ?auto_2575104 ) ( CLEAR ?auto_2575100 ) ( not ( = ?auto_2575099 ?auto_2575104 ) ) ( not ( = ?auto_2575100 ?auto_2575104 ) ) ( not ( = ?auto_2575098 ?auto_2575104 ) ) ( TRUCK-AT ?auto_2575101 ?auto_2575102 ) ( SURFACE-AT ?auto_2575098 ?auto_2575102 ) ( CLEAR ?auto_2575098 ) ( IS-CRATE ?auto_2575099 ) ( AVAILABLE ?auto_2575105 ) ( IN ?auto_2575099 ?auto_2575101 ) ( ON ?auto_2575088 ?auto_2575087 ) ( ON ?auto_2575089 ?auto_2575088 ) ( ON ?auto_2575091 ?auto_2575089 ) ( ON ?auto_2575090 ?auto_2575091 ) ( ON ?auto_2575092 ?auto_2575090 ) ( ON ?auto_2575093 ?auto_2575092 ) ( ON ?auto_2575094 ?auto_2575093 ) ( ON ?auto_2575095 ?auto_2575094 ) ( ON ?auto_2575096 ?auto_2575095 ) ( ON ?auto_2575097 ?auto_2575096 ) ( ON ?auto_2575098 ?auto_2575097 ) ( not ( = ?auto_2575087 ?auto_2575088 ) ) ( not ( = ?auto_2575087 ?auto_2575089 ) ) ( not ( = ?auto_2575087 ?auto_2575091 ) ) ( not ( = ?auto_2575087 ?auto_2575090 ) ) ( not ( = ?auto_2575087 ?auto_2575092 ) ) ( not ( = ?auto_2575087 ?auto_2575093 ) ) ( not ( = ?auto_2575087 ?auto_2575094 ) ) ( not ( = ?auto_2575087 ?auto_2575095 ) ) ( not ( = ?auto_2575087 ?auto_2575096 ) ) ( not ( = ?auto_2575087 ?auto_2575097 ) ) ( not ( = ?auto_2575087 ?auto_2575098 ) ) ( not ( = ?auto_2575087 ?auto_2575099 ) ) ( not ( = ?auto_2575087 ?auto_2575100 ) ) ( not ( = ?auto_2575087 ?auto_2575104 ) ) ( not ( = ?auto_2575088 ?auto_2575089 ) ) ( not ( = ?auto_2575088 ?auto_2575091 ) ) ( not ( = ?auto_2575088 ?auto_2575090 ) ) ( not ( = ?auto_2575088 ?auto_2575092 ) ) ( not ( = ?auto_2575088 ?auto_2575093 ) ) ( not ( = ?auto_2575088 ?auto_2575094 ) ) ( not ( = ?auto_2575088 ?auto_2575095 ) ) ( not ( = ?auto_2575088 ?auto_2575096 ) ) ( not ( = ?auto_2575088 ?auto_2575097 ) ) ( not ( = ?auto_2575088 ?auto_2575098 ) ) ( not ( = ?auto_2575088 ?auto_2575099 ) ) ( not ( = ?auto_2575088 ?auto_2575100 ) ) ( not ( = ?auto_2575088 ?auto_2575104 ) ) ( not ( = ?auto_2575089 ?auto_2575091 ) ) ( not ( = ?auto_2575089 ?auto_2575090 ) ) ( not ( = ?auto_2575089 ?auto_2575092 ) ) ( not ( = ?auto_2575089 ?auto_2575093 ) ) ( not ( = ?auto_2575089 ?auto_2575094 ) ) ( not ( = ?auto_2575089 ?auto_2575095 ) ) ( not ( = ?auto_2575089 ?auto_2575096 ) ) ( not ( = ?auto_2575089 ?auto_2575097 ) ) ( not ( = ?auto_2575089 ?auto_2575098 ) ) ( not ( = ?auto_2575089 ?auto_2575099 ) ) ( not ( = ?auto_2575089 ?auto_2575100 ) ) ( not ( = ?auto_2575089 ?auto_2575104 ) ) ( not ( = ?auto_2575091 ?auto_2575090 ) ) ( not ( = ?auto_2575091 ?auto_2575092 ) ) ( not ( = ?auto_2575091 ?auto_2575093 ) ) ( not ( = ?auto_2575091 ?auto_2575094 ) ) ( not ( = ?auto_2575091 ?auto_2575095 ) ) ( not ( = ?auto_2575091 ?auto_2575096 ) ) ( not ( = ?auto_2575091 ?auto_2575097 ) ) ( not ( = ?auto_2575091 ?auto_2575098 ) ) ( not ( = ?auto_2575091 ?auto_2575099 ) ) ( not ( = ?auto_2575091 ?auto_2575100 ) ) ( not ( = ?auto_2575091 ?auto_2575104 ) ) ( not ( = ?auto_2575090 ?auto_2575092 ) ) ( not ( = ?auto_2575090 ?auto_2575093 ) ) ( not ( = ?auto_2575090 ?auto_2575094 ) ) ( not ( = ?auto_2575090 ?auto_2575095 ) ) ( not ( = ?auto_2575090 ?auto_2575096 ) ) ( not ( = ?auto_2575090 ?auto_2575097 ) ) ( not ( = ?auto_2575090 ?auto_2575098 ) ) ( not ( = ?auto_2575090 ?auto_2575099 ) ) ( not ( = ?auto_2575090 ?auto_2575100 ) ) ( not ( = ?auto_2575090 ?auto_2575104 ) ) ( not ( = ?auto_2575092 ?auto_2575093 ) ) ( not ( = ?auto_2575092 ?auto_2575094 ) ) ( not ( = ?auto_2575092 ?auto_2575095 ) ) ( not ( = ?auto_2575092 ?auto_2575096 ) ) ( not ( = ?auto_2575092 ?auto_2575097 ) ) ( not ( = ?auto_2575092 ?auto_2575098 ) ) ( not ( = ?auto_2575092 ?auto_2575099 ) ) ( not ( = ?auto_2575092 ?auto_2575100 ) ) ( not ( = ?auto_2575092 ?auto_2575104 ) ) ( not ( = ?auto_2575093 ?auto_2575094 ) ) ( not ( = ?auto_2575093 ?auto_2575095 ) ) ( not ( = ?auto_2575093 ?auto_2575096 ) ) ( not ( = ?auto_2575093 ?auto_2575097 ) ) ( not ( = ?auto_2575093 ?auto_2575098 ) ) ( not ( = ?auto_2575093 ?auto_2575099 ) ) ( not ( = ?auto_2575093 ?auto_2575100 ) ) ( not ( = ?auto_2575093 ?auto_2575104 ) ) ( not ( = ?auto_2575094 ?auto_2575095 ) ) ( not ( = ?auto_2575094 ?auto_2575096 ) ) ( not ( = ?auto_2575094 ?auto_2575097 ) ) ( not ( = ?auto_2575094 ?auto_2575098 ) ) ( not ( = ?auto_2575094 ?auto_2575099 ) ) ( not ( = ?auto_2575094 ?auto_2575100 ) ) ( not ( = ?auto_2575094 ?auto_2575104 ) ) ( not ( = ?auto_2575095 ?auto_2575096 ) ) ( not ( = ?auto_2575095 ?auto_2575097 ) ) ( not ( = ?auto_2575095 ?auto_2575098 ) ) ( not ( = ?auto_2575095 ?auto_2575099 ) ) ( not ( = ?auto_2575095 ?auto_2575100 ) ) ( not ( = ?auto_2575095 ?auto_2575104 ) ) ( not ( = ?auto_2575096 ?auto_2575097 ) ) ( not ( = ?auto_2575096 ?auto_2575098 ) ) ( not ( = ?auto_2575096 ?auto_2575099 ) ) ( not ( = ?auto_2575096 ?auto_2575100 ) ) ( not ( = ?auto_2575096 ?auto_2575104 ) ) ( not ( = ?auto_2575097 ?auto_2575098 ) ) ( not ( = ?auto_2575097 ?auto_2575099 ) ) ( not ( = ?auto_2575097 ?auto_2575100 ) ) ( not ( = ?auto_2575097 ?auto_2575104 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2575098 ?auto_2575099 ?auto_2575100 )
      ( MAKE-13CRATE-VERIFY ?auto_2575087 ?auto_2575088 ?auto_2575089 ?auto_2575091 ?auto_2575090 ?auto_2575092 ?auto_2575093 ?auto_2575094 ?auto_2575095 ?auto_2575096 ?auto_2575097 ?auto_2575098 ?auto_2575099 ?auto_2575100 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2589328 - SURFACE
      ?auto_2589329 - SURFACE
      ?auto_2589330 - SURFACE
      ?auto_2589332 - SURFACE
      ?auto_2589331 - SURFACE
      ?auto_2589333 - SURFACE
      ?auto_2589334 - SURFACE
      ?auto_2589335 - SURFACE
      ?auto_2589336 - SURFACE
      ?auto_2589337 - SURFACE
      ?auto_2589338 - SURFACE
      ?auto_2589339 - SURFACE
      ?auto_2589340 - SURFACE
      ?auto_2589341 - SURFACE
      ?auto_2589342 - SURFACE
    )
    :vars
    (
      ?auto_2589344 - HOIST
      ?auto_2589343 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2589344 ?auto_2589343 ) ( SURFACE-AT ?auto_2589341 ?auto_2589343 ) ( CLEAR ?auto_2589341 ) ( LIFTING ?auto_2589344 ?auto_2589342 ) ( IS-CRATE ?auto_2589342 ) ( not ( = ?auto_2589341 ?auto_2589342 ) ) ( ON ?auto_2589329 ?auto_2589328 ) ( ON ?auto_2589330 ?auto_2589329 ) ( ON ?auto_2589332 ?auto_2589330 ) ( ON ?auto_2589331 ?auto_2589332 ) ( ON ?auto_2589333 ?auto_2589331 ) ( ON ?auto_2589334 ?auto_2589333 ) ( ON ?auto_2589335 ?auto_2589334 ) ( ON ?auto_2589336 ?auto_2589335 ) ( ON ?auto_2589337 ?auto_2589336 ) ( ON ?auto_2589338 ?auto_2589337 ) ( ON ?auto_2589339 ?auto_2589338 ) ( ON ?auto_2589340 ?auto_2589339 ) ( ON ?auto_2589341 ?auto_2589340 ) ( not ( = ?auto_2589328 ?auto_2589329 ) ) ( not ( = ?auto_2589328 ?auto_2589330 ) ) ( not ( = ?auto_2589328 ?auto_2589332 ) ) ( not ( = ?auto_2589328 ?auto_2589331 ) ) ( not ( = ?auto_2589328 ?auto_2589333 ) ) ( not ( = ?auto_2589328 ?auto_2589334 ) ) ( not ( = ?auto_2589328 ?auto_2589335 ) ) ( not ( = ?auto_2589328 ?auto_2589336 ) ) ( not ( = ?auto_2589328 ?auto_2589337 ) ) ( not ( = ?auto_2589328 ?auto_2589338 ) ) ( not ( = ?auto_2589328 ?auto_2589339 ) ) ( not ( = ?auto_2589328 ?auto_2589340 ) ) ( not ( = ?auto_2589328 ?auto_2589341 ) ) ( not ( = ?auto_2589328 ?auto_2589342 ) ) ( not ( = ?auto_2589329 ?auto_2589330 ) ) ( not ( = ?auto_2589329 ?auto_2589332 ) ) ( not ( = ?auto_2589329 ?auto_2589331 ) ) ( not ( = ?auto_2589329 ?auto_2589333 ) ) ( not ( = ?auto_2589329 ?auto_2589334 ) ) ( not ( = ?auto_2589329 ?auto_2589335 ) ) ( not ( = ?auto_2589329 ?auto_2589336 ) ) ( not ( = ?auto_2589329 ?auto_2589337 ) ) ( not ( = ?auto_2589329 ?auto_2589338 ) ) ( not ( = ?auto_2589329 ?auto_2589339 ) ) ( not ( = ?auto_2589329 ?auto_2589340 ) ) ( not ( = ?auto_2589329 ?auto_2589341 ) ) ( not ( = ?auto_2589329 ?auto_2589342 ) ) ( not ( = ?auto_2589330 ?auto_2589332 ) ) ( not ( = ?auto_2589330 ?auto_2589331 ) ) ( not ( = ?auto_2589330 ?auto_2589333 ) ) ( not ( = ?auto_2589330 ?auto_2589334 ) ) ( not ( = ?auto_2589330 ?auto_2589335 ) ) ( not ( = ?auto_2589330 ?auto_2589336 ) ) ( not ( = ?auto_2589330 ?auto_2589337 ) ) ( not ( = ?auto_2589330 ?auto_2589338 ) ) ( not ( = ?auto_2589330 ?auto_2589339 ) ) ( not ( = ?auto_2589330 ?auto_2589340 ) ) ( not ( = ?auto_2589330 ?auto_2589341 ) ) ( not ( = ?auto_2589330 ?auto_2589342 ) ) ( not ( = ?auto_2589332 ?auto_2589331 ) ) ( not ( = ?auto_2589332 ?auto_2589333 ) ) ( not ( = ?auto_2589332 ?auto_2589334 ) ) ( not ( = ?auto_2589332 ?auto_2589335 ) ) ( not ( = ?auto_2589332 ?auto_2589336 ) ) ( not ( = ?auto_2589332 ?auto_2589337 ) ) ( not ( = ?auto_2589332 ?auto_2589338 ) ) ( not ( = ?auto_2589332 ?auto_2589339 ) ) ( not ( = ?auto_2589332 ?auto_2589340 ) ) ( not ( = ?auto_2589332 ?auto_2589341 ) ) ( not ( = ?auto_2589332 ?auto_2589342 ) ) ( not ( = ?auto_2589331 ?auto_2589333 ) ) ( not ( = ?auto_2589331 ?auto_2589334 ) ) ( not ( = ?auto_2589331 ?auto_2589335 ) ) ( not ( = ?auto_2589331 ?auto_2589336 ) ) ( not ( = ?auto_2589331 ?auto_2589337 ) ) ( not ( = ?auto_2589331 ?auto_2589338 ) ) ( not ( = ?auto_2589331 ?auto_2589339 ) ) ( not ( = ?auto_2589331 ?auto_2589340 ) ) ( not ( = ?auto_2589331 ?auto_2589341 ) ) ( not ( = ?auto_2589331 ?auto_2589342 ) ) ( not ( = ?auto_2589333 ?auto_2589334 ) ) ( not ( = ?auto_2589333 ?auto_2589335 ) ) ( not ( = ?auto_2589333 ?auto_2589336 ) ) ( not ( = ?auto_2589333 ?auto_2589337 ) ) ( not ( = ?auto_2589333 ?auto_2589338 ) ) ( not ( = ?auto_2589333 ?auto_2589339 ) ) ( not ( = ?auto_2589333 ?auto_2589340 ) ) ( not ( = ?auto_2589333 ?auto_2589341 ) ) ( not ( = ?auto_2589333 ?auto_2589342 ) ) ( not ( = ?auto_2589334 ?auto_2589335 ) ) ( not ( = ?auto_2589334 ?auto_2589336 ) ) ( not ( = ?auto_2589334 ?auto_2589337 ) ) ( not ( = ?auto_2589334 ?auto_2589338 ) ) ( not ( = ?auto_2589334 ?auto_2589339 ) ) ( not ( = ?auto_2589334 ?auto_2589340 ) ) ( not ( = ?auto_2589334 ?auto_2589341 ) ) ( not ( = ?auto_2589334 ?auto_2589342 ) ) ( not ( = ?auto_2589335 ?auto_2589336 ) ) ( not ( = ?auto_2589335 ?auto_2589337 ) ) ( not ( = ?auto_2589335 ?auto_2589338 ) ) ( not ( = ?auto_2589335 ?auto_2589339 ) ) ( not ( = ?auto_2589335 ?auto_2589340 ) ) ( not ( = ?auto_2589335 ?auto_2589341 ) ) ( not ( = ?auto_2589335 ?auto_2589342 ) ) ( not ( = ?auto_2589336 ?auto_2589337 ) ) ( not ( = ?auto_2589336 ?auto_2589338 ) ) ( not ( = ?auto_2589336 ?auto_2589339 ) ) ( not ( = ?auto_2589336 ?auto_2589340 ) ) ( not ( = ?auto_2589336 ?auto_2589341 ) ) ( not ( = ?auto_2589336 ?auto_2589342 ) ) ( not ( = ?auto_2589337 ?auto_2589338 ) ) ( not ( = ?auto_2589337 ?auto_2589339 ) ) ( not ( = ?auto_2589337 ?auto_2589340 ) ) ( not ( = ?auto_2589337 ?auto_2589341 ) ) ( not ( = ?auto_2589337 ?auto_2589342 ) ) ( not ( = ?auto_2589338 ?auto_2589339 ) ) ( not ( = ?auto_2589338 ?auto_2589340 ) ) ( not ( = ?auto_2589338 ?auto_2589341 ) ) ( not ( = ?auto_2589338 ?auto_2589342 ) ) ( not ( = ?auto_2589339 ?auto_2589340 ) ) ( not ( = ?auto_2589339 ?auto_2589341 ) ) ( not ( = ?auto_2589339 ?auto_2589342 ) ) ( not ( = ?auto_2589340 ?auto_2589341 ) ) ( not ( = ?auto_2589340 ?auto_2589342 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2589341 ?auto_2589342 )
      ( MAKE-14CRATE-VERIFY ?auto_2589328 ?auto_2589329 ?auto_2589330 ?auto_2589332 ?auto_2589331 ?auto_2589333 ?auto_2589334 ?auto_2589335 ?auto_2589336 ?auto_2589337 ?auto_2589338 ?auto_2589339 ?auto_2589340 ?auto_2589341 ?auto_2589342 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2589488 - SURFACE
      ?auto_2589489 - SURFACE
      ?auto_2589490 - SURFACE
      ?auto_2589492 - SURFACE
      ?auto_2589491 - SURFACE
      ?auto_2589493 - SURFACE
      ?auto_2589494 - SURFACE
      ?auto_2589495 - SURFACE
      ?auto_2589496 - SURFACE
      ?auto_2589497 - SURFACE
      ?auto_2589498 - SURFACE
      ?auto_2589499 - SURFACE
      ?auto_2589500 - SURFACE
      ?auto_2589501 - SURFACE
      ?auto_2589502 - SURFACE
    )
    :vars
    (
      ?auto_2589503 - HOIST
      ?auto_2589504 - PLACE
      ?auto_2589505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2589503 ?auto_2589504 ) ( SURFACE-AT ?auto_2589501 ?auto_2589504 ) ( CLEAR ?auto_2589501 ) ( IS-CRATE ?auto_2589502 ) ( not ( = ?auto_2589501 ?auto_2589502 ) ) ( TRUCK-AT ?auto_2589505 ?auto_2589504 ) ( AVAILABLE ?auto_2589503 ) ( IN ?auto_2589502 ?auto_2589505 ) ( ON ?auto_2589501 ?auto_2589500 ) ( not ( = ?auto_2589500 ?auto_2589501 ) ) ( not ( = ?auto_2589500 ?auto_2589502 ) ) ( ON ?auto_2589489 ?auto_2589488 ) ( ON ?auto_2589490 ?auto_2589489 ) ( ON ?auto_2589492 ?auto_2589490 ) ( ON ?auto_2589491 ?auto_2589492 ) ( ON ?auto_2589493 ?auto_2589491 ) ( ON ?auto_2589494 ?auto_2589493 ) ( ON ?auto_2589495 ?auto_2589494 ) ( ON ?auto_2589496 ?auto_2589495 ) ( ON ?auto_2589497 ?auto_2589496 ) ( ON ?auto_2589498 ?auto_2589497 ) ( ON ?auto_2589499 ?auto_2589498 ) ( ON ?auto_2589500 ?auto_2589499 ) ( not ( = ?auto_2589488 ?auto_2589489 ) ) ( not ( = ?auto_2589488 ?auto_2589490 ) ) ( not ( = ?auto_2589488 ?auto_2589492 ) ) ( not ( = ?auto_2589488 ?auto_2589491 ) ) ( not ( = ?auto_2589488 ?auto_2589493 ) ) ( not ( = ?auto_2589488 ?auto_2589494 ) ) ( not ( = ?auto_2589488 ?auto_2589495 ) ) ( not ( = ?auto_2589488 ?auto_2589496 ) ) ( not ( = ?auto_2589488 ?auto_2589497 ) ) ( not ( = ?auto_2589488 ?auto_2589498 ) ) ( not ( = ?auto_2589488 ?auto_2589499 ) ) ( not ( = ?auto_2589488 ?auto_2589500 ) ) ( not ( = ?auto_2589488 ?auto_2589501 ) ) ( not ( = ?auto_2589488 ?auto_2589502 ) ) ( not ( = ?auto_2589489 ?auto_2589490 ) ) ( not ( = ?auto_2589489 ?auto_2589492 ) ) ( not ( = ?auto_2589489 ?auto_2589491 ) ) ( not ( = ?auto_2589489 ?auto_2589493 ) ) ( not ( = ?auto_2589489 ?auto_2589494 ) ) ( not ( = ?auto_2589489 ?auto_2589495 ) ) ( not ( = ?auto_2589489 ?auto_2589496 ) ) ( not ( = ?auto_2589489 ?auto_2589497 ) ) ( not ( = ?auto_2589489 ?auto_2589498 ) ) ( not ( = ?auto_2589489 ?auto_2589499 ) ) ( not ( = ?auto_2589489 ?auto_2589500 ) ) ( not ( = ?auto_2589489 ?auto_2589501 ) ) ( not ( = ?auto_2589489 ?auto_2589502 ) ) ( not ( = ?auto_2589490 ?auto_2589492 ) ) ( not ( = ?auto_2589490 ?auto_2589491 ) ) ( not ( = ?auto_2589490 ?auto_2589493 ) ) ( not ( = ?auto_2589490 ?auto_2589494 ) ) ( not ( = ?auto_2589490 ?auto_2589495 ) ) ( not ( = ?auto_2589490 ?auto_2589496 ) ) ( not ( = ?auto_2589490 ?auto_2589497 ) ) ( not ( = ?auto_2589490 ?auto_2589498 ) ) ( not ( = ?auto_2589490 ?auto_2589499 ) ) ( not ( = ?auto_2589490 ?auto_2589500 ) ) ( not ( = ?auto_2589490 ?auto_2589501 ) ) ( not ( = ?auto_2589490 ?auto_2589502 ) ) ( not ( = ?auto_2589492 ?auto_2589491 ) ) ( not ( = ?auto_2589492 ?auto_2589493 ) ) ( not ( = ?auto_2589492 ?auto_2589494 ) ) ( not ( = ?auto_2589492 ?auto_2589495 ) ) ( not ( = ?auto_2589492 ?auto_2589496 ) ) ( not ( = ?auto_2589492 ?auto_2589497 ) ) ( not ( = ?auto_2589492 ?auto_2589498 ) ) ( not ( = ?auto_2589492 ?auto_2589499 ) ) ( not ( = ?auto_2589492 ?auto_2589500 ) ) ( not ( = ?auto_2589492 ?auto_2589501 ) ) ( not ( = ?auto_2589492 ?auto_2589502 ) ) ( not ( = ?auto_2589491 ?auto_2589493 ) ) ( not ( = ?auto_2589491 ?auto_2589494 ) ) ( not ( = ?auto_2589491 ?auto_2589495 ) ) ( not ( = ?auto_2589491 ?auto_2589496 ) ) ( not ( = ?auto_2589491 ?auto_2589497 ) ) ( not ( = ?auto_2589491 ?auto_2589498 ) ) ( not ( = ?auto_2589491 ?auto_2589499 ) ) ( not ( = ?auto_2589491 ?auto_2589500 ) ) ( not ( = ?auto_2589491 ?auto_2589501 ) ) ( not ( = ?auto_2589491 ?auto_2589502 ) ) ( not ( = ?auto_2589493 ?auto_2589494 ) ) ( not ( = ?auto_2589493 ?auto_2589495 ) ) ( not ( = ?auto_2589493 ?auto_2589496 ) ) ( not ( = ?auto_2589493 ?auto_2589497 ) ) ( not ( = ?auto_2589493 ?auto_2589498 ) ) ( not ( = ?auto_2589493 ?auto_2589499 ) ) ( not ( = ?auto_2589493 ?auto_2589500 ) ) ( not ( = ?auto_2589493 ?auto_2589501 ) ) ( not ( = ?auto_2589493 ?auto_2589502 ) ) ( not ( = ?auto_2589494 ?auto_2589495 ) ) ( not ( = ?auto_2589494 ?auto_2589496 ) ) ( not ( = ?auto_2589494 ?auto_2589497 ) ) ( not ( = ?auto_2589494 ?auto_2589498 ) ) ( not ( = ?auto_2589494 ?auto_2589499 ) ) ( not ( = ?auto_2589494 ?auto_2589500 ) ) ( not ( = ?auto_2589494 ?auto_2589501 ) ) ( not ( = ?auto_2589494 ?auto_2589502 ) ) ( not ( = ?auto_2589495 ?auto_2589496 ) ) ( not ( = ?auto_2589495 ?auto_2589497 ) ) ( not ( = ?auto_2589495 ?auto_2589498 ) ) ( not ( = ?auto_2589495 ?auto_2589499 ) ) ( not ( = ?auto_2589495 ?auto_2589500 ) ) ( not ( = ?auto_2589495 ?auto_2589501 ) ) ( not ( = ?auto_2589495 ?auto_2589502 ) ) ( not ( = ?auto_2589496 ?auto_2589497 ) ) ( not ( = ?auto_2589496 ?auto_2589498 ) ) ( not ( = ?auto_2589496 ?auto_2589499 ) ) ( not ( = ?auto_2589496 ?auto_2589500 ) ) ( not ( = ?auto_2589496 ?auto_2589501 ) ) ( not ( = ?auto_2589496 ?auto_2589502 ) ) ( not ( = ?auto_2589497 ?auto_2589498 ) ) ( not ( = ?auto_2589497 ?auto_2589499 ) ) ( not ( = ?auto_2589497 ?auto_2589500 ) ) ( not ( = ?auto_2589497 ?auto_2589501 ) ) ( not ( = ?auto_2589497 ?auto_2589502 ) ) ( not ( = ?auto_2589498 ?auto_2589499 ) ) ( not ( = ?auto_2589498 ?auto_2589500 ) ) ( not ( = ?auto_2589498 ?auto_2589501 ) ) ( not ( = ?auto_2589498 ?auto_2589502 ) ) ( not ( = ?auto_2589499 ?auto_2589500 ) ) ( not ( = ?auto_2589499 ?auto_2589501 ) ) ( not ( = ?auto_2589499 ?auto_2589502 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2589500 ?auto_2589501 ?auto_2589502 )
      ( MAKE-14CRATE-VERIFY ?auto_2589488 ?auto_2589489 ?auto_2589490 ?auto_2589492 ?auto_2589491 ?auto_2589493 ?auto_2589494 ?auto_2589495 ?auto_2589496 ?auto_2589497 ?auto_2589498 ?auto_2589499 ?auto_2589500 ?auto_2589501 ?auto_2589502 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2589663 - SURFACE
      ?auto_2589664 - SURFACE
      ?auto_2589665 - SURFACE
      ?auto_2589667 - SURFACE
      ?auto_2589666 - SURFACE
      ?auto_2589668 - SURFACE
      ?auto_2589669 - SURFACE
      ?auto_2589670 - SURFACE
      ?auto_2589671 - SURFACE
      ?auto_2589672 - SURFACE
      ?auto_2589673 - SURFACE
      ?auto_2589674 - SURFACE
      ?auto_2589675 - SURFACE
      ?auto_2589676 - SURFACE
      ?auto_2589677 - SURFACE
    )
    :vars
    (
      ?auto_2589681 - HOIST
      ?auto_2589680 - PLACE
      ?auto_2589679 - TRUCK
      ?auto_2589678 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2589681 ?auto_2589680 ) ( SURFACE-AT ?auto_2589676 ?auto_2589680 ) ( CLEAR ?auto_2589676 ) ( IS-CRATE ?auto_2589677 ) ( not ( = ?auto_2589676 ?auto_2589677 ) ) ( AVAILABLE ?auto_2589681 ) ( IN ?auto_2589677 ?auto_2589679 ) ( ON ?auto_2589676 ?auto_2589675 ) ( not ( = ?auto_2589675 ?auto_2589676 ) ) ( not ( = ?auto_2589675 ?auto_2589677 ) ) ( TRUCK-AT ?auto_2589679 ?auto_2589678 ) ( not ( = ?auto_2589678 ?auto_2589680 ) ) ( ON ?auto_2589664 ?auto_2589663 ) ( ON ?auto_2589665 ?auto_2589664 ) ( ON ?auto_2589667 ?auto_2589665 ) ( ON ?auto_2589666 ?auto_2589667 ) ( ON ?auto_2589668 ?auto_2589666 ) ( ON ?auto_2589669 ?auto_2589668 ) ( ON ?auto_2589670 ?auto_2589669 ) ( ON ?auto_2589671 ?auto_2589670 ) ( ON ?auto_2589672 ?auto_2589671 ) ( ON ?auto_2589673 ?auto_2589672 ) ( ON ?auto_2589674 ?auto_2589673 ) ( ON ?auto_2589675 ?auto_2589674 ) ( not ( = ?auto_2589663 ?auto_2589664 ) ) ( not ( = ?auto_2589663 ?auto_2589665 ) ) ( not ( = ?auto_2589663 ?auto_2589667 ) ) ( not ( = ?auto_2589663 ?auto_2589666 ) ) ( not ( = ?auto_2589663 ?auto_2589668 ) ) ( not ( = ?auto_2589663 ?auto_2589669 ) ) ( not ( = ?auto_2589663 ?auto_2589670 ) ) ( not ( = ?auto_2589663 ?auto_2589671 ) ) ( not ( = ?auto_2589663 ?auto_2589672 ) ) ( not ( = ?auto_2589663 ?auto_2589673 ) ) ( not ( = ?auto_2589663 ?auto_2589674 ) ) ( not ( = ?auto_2589663 ?auto_2589675 ) ) ( not ( = ?auto_2589663 ?auto_2589676 ) ) ( not ( = ?auto_2589663 ?auto_2589677 ) ) ( not ( = ?auto_2589664 ?auto_2589665 ) ) ( not ( = ?auto_2589664 ?auto_2589667 ) ) ( not ( = ?auto_2589664 ?auto_2589666 ) ) ( not ( = ?auto_2589664 ?auto_2589668 ) ) ( not ( = ?auto_2589664 ?auto_2589669 ) ) ( not ( = ?auto_2589664 ?auto_2589670 ) ) ( not ( = ?auto_2589664 ?auto_2589671 ) ) ( not ( = ?auto_2589664 ?auto_2589672 ) ) ( not ( = ?auto_2589664 ?auto_2589673 ) ) ( not ( = ?auto_2589664 ?auto_2589674 ) ) ( not ( = ?auto_2589664 ?auto_2589675 ) ) ( not ( = ?auto_2589664 ?auto_2589676 ) ) ( not ( = ?auto_2589664 ?auto_2589677 ) ) ( not ( = ?auto_2589665 ?auto_2589667 ) ) ( not ( = ?auto_2589665 ?auto_2589666 ) ) ( not ( = ?auto_2589665 ?auto_2589668 ) ) ( not ( = ?auto_2589665 ?auto_2589669 ) ) ( not ( = ?auto_2589665 ?auto_2589670 ) ) ( not ( = ?auto_2589665 ?auto_2589671 ) ) ( not ( = ?auto_2589665 ?auto_2589672 ) ) ( not ( = ?auto_2589665 ?auto_2589673 ) ) ( not ( = ?auto_2589665 ?auto_2589674 ) ) ( not ( = ?auto_2589665 ?auto_2589675 ) ) ( not ( = ?auto_2589665 ?auto_2589676 ) ) ( not ( = ?auto_2589665 ?auto_2589677 ) ) ( not ( = ?auto_2589667 ?auto_2589666 ) ) ( not ( = ?auto_2589667 ?auto_2589668 ) ) ( not ( = ?auto_2589667 ?auto_2589669 ) ) ( not ( = ?auto_2589667 ?auto_2589670 ) ) ( not ( = ?auto_2589667 ?auto_2589671 ) ) ( not ( = ?auto_2589667 ?auto_2589672 ) ) ( not ( = ?auto_2589667 ?auto_2589673 ) ) ( not ( = ?auto_2589667 ?auto_2589674 ) ) ( not ( = ?auto_2589667 ?auto_2589675 ) ) ( not ( = ?auto_2589667 ?auto_2589676 ) ) ( not ( = ?auto_2589667 ?auto_2589677 ) ) ( not ( = ?auto_2589666 ?auto_2589668 ) ) ( not ( = ?auto_2589666 ?auto_2589669 ) ) ( not ( = ?auto_2589666 ?auto_2589670 ) ) ( not ( = ?auto_2589666 ?auto_2589671 ) ) ( not ( = ?auto_2589666 ?auto_2589672 ) ) ( not ( = ?auto_2589666 ?auto_2589673 ) ) ( not ( = ?auto_2589666 ?auto_2589674 ) ) ( not ( = ?auto_2589666 ?auto_2589675 ) ) ( not ( = ?auto_2589666 ?auto_2589676 ) ) ( not ( = ?auto_2589666 ?auto_2589677 ) ) ( not ( = ?auto_2589668 ?auto_2589669 ) ) ( not ( = ?auto_2589668 ?auto_2589670 ) ) ( not ( = ?auto_2589668 ?auto_2589671 ) ) ( not ( = ?auto_2589668 ?auto_2589672 ) ) ( not ( = ?auto_2589668 ?auto_2589673 ) ) ( not ( = ?auto_2589668 ?auto_2589674 ) ) ( not ( = ?auto_2589668 ?auto_2589675 ) ) ( not ( = ?auto_2589668 ?auto_2589676 ) ) ( not ( = ?auto_2589668 ?auto_2589677 ) ) ( not ( = ?auto_2589669 ?auto_2589670 ) ) ( not ( = ?auto_2589669 ?auto_2589671 ) ) ( not ( = ?auto_2589669 ?auto_2589672 ) ) ( not ( = ?auto_2589669 ?auto_2589673 ) ) ( not ( = ?auto_2589669 ?auto_2589674 ) ) ( not ( = ?auto_2589669 ?auto_2589675 ) ) ( not ( = ?auto_2589669 ?auto_2589676 ) ) ( not ( = ?auto_2589669 ?auto_2589677 ) ) ( not ( = ?auto_2589670 ?auto_2589671 ) ) ( not ( = ?auto_2589670 ?auto_2589672 ) ) ( not ( = ?auto_2589670 ?auto_2589673 ) ) ( not ( = ?auto_2589670 ?auto_2589674 ) ) ( not ( = ?auto_2589670 ?auto_2589675 ) ) ( not ( = ?auto_2589670 ?auto_2589676 ) ) ( not ( = ?auto_2589670 ?auto_2589677 ) ) ( not ( = ?auto_2589671 ?auto_2589672 ) ) ( not ( = ?auto_2589671 ?auto_2589673 ) ) ( not ( = ?auto_2589671 ?auto_2589674 ) ) ( not ( = ?auto_2589671 ?auto_2589675 ) ) ( not ( = ?auto_2589671 ?auto_2589676 ) ) ( not ( = ?auto_2589671 ?auto_2589677 ) ) ( not ( = ?auto_2589672 ?auto_2589673 ) ) ( not ( = ?auto_2589672 ?auto_2589674 ) ) ( not ( = ?auto_2589672 ?auto_2589675 ) ) ( not ( = ?auto_2589672 ?auto_2589676 ) ) ( not ( = ?auto_2589672 ?auto_2589677 ) ) ( not ( = ?auto_2589673 ?auto_2589674 ) ) ( not ( = ?auto_2589673 ?auto_2589675 ) ) ( not ( = ?auto_2589673 ?auto_2589676 ) ) ( not ( = ?auto_2589673 ?auto_2589677 ) ) ( not ( = ?auto_2589674 ?auto_2589675 ) ) ( not ( = ?auto_2589674 ?auto_2589676 ) ) ( not ( = ?auto_2589674 ?auto_2589677 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2589675 ?auto_2589676 ?auto_2589677 )
      ( MAKE-14CRATE-VERIFY ?auto_2589663 ?auto_2589664 ?auto_2589665 ?auto_2589667 ?auto_2589666 ?auto_2589668 ?auto_2589669 ?auto_2589670 ?auto_2589671 ?auto_2589672 ?auto_2589673 ?auto_2589674 ?auto_2589675 ?auto_2589676 ?auto_2589677 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2589852 - SURFACE
      ?auto_2589853 - SURFACE
      ?auto_2589854 - SURFACE
      ?auto_2589856 - SURFACE
      ?auto_2589855 - SURFACE
      ?auto_2589857 - SURFACE
      ?auto_2589858 - SURFACE
      ?auto_2589859 - SURFACE
      ?auto_2589860 - SURFACE
      ?auto_2589861 - SURFACE
      ?auto_2589862 - SURFACE
      ?auto_2589863 - SURFACE
      ?auto_2589864 - SURFACE
      ?auto_2589865 - SURFACE
      ?auto_2589866 - SURFACE
    )
    :vars
    (
      ?auto_2589867 - HOIST
      ?auto_2589871 - PLACE
      ?auto_2589869 - TRUCK
      ?auto_2589870 - PLACE
      ?auto_2589868 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2589867 ?auto_2589871 ) ( SURFACE-AT ?auto_2589865 ?auto_2589871 ) ( CLEAR ?auto_2589865 ) ( IS-CRATE ?auto_2589866 ) ( not ( = ?auto_2589865 ?auto_2589866 ) ) ( AVAILABLE ?auto_2589867 ) ( ON ?auto_2589865 ?auto_2589864 ) ( not ( = ?auto_2589864 ?auto_2589865 ) ) ( not ( = ?auto_2589864 ?auto_2589866 ) ) ( TRUCK-AT ?auto_2589869 ?auto_2589870 ) ( not ( = ?auto_2589870 ?auto_2589871 ) ) ( HOIST-AT ?auto_2589868 ?auto_2589870 ) ( LIFTING ?auto_2589868 ?auto_2589866 ) ( not ( = ?auto_2589867 ?auto_2589868 ) ) ( ON ?auto_2589853 ?auto_2589852 ) ( ON ?auto_2589854 ?auto_2589853 ) ( ON ?auto_2589856 ?auto_2589854 ) ( ON ?auto_2589855 ?auto_2589856 ) ( ON ?auto_2589857 ?auto_2589855 ) ( ON ?auto_2589858 ?auto_2589857 ) ( ON ?auto_2589859 ?auto_2589858 ) ( ON ?auto_2589860 ?auto_2589859 ) ( ON ?auto_2589861 ?auto_2589860 ) ( ON ?auto_2589862 ?auto_2589861 ) ( ON ?auto_2589863 ?auto_2589862 ) ( ON ?auto_2589864 ?auto_2589863 ) ( not ( = ?auto_2589852 ?auto_2589853 ) ) ( not ( = ?auto_2589852 ?auto_2589854 ) ) ( not ( = ?auto_2589852 ?auto_2589856 ) ) ( not ( = ?auto_2589852 ?auto_2589855 ) ) ( not ( = ?auto_2589852 ?auto_2589857 ) ) ( not ( = ?auto_2589852 ?auto_2589858 ) ) ( not ( = ?auto_2589852 ?auto_2589859 ) ) ( not ( = ?auto_2589852 ?auto_2589860 ) ) ( not ( = ?auto_2589852 ?auto_2589861 ) ) ( not ( = ?auto_2589852 ?auto_2589862 ) ) ( not ( = ?auto_2589852 ?auto_2589863 ) ) ( not ( = ?auto_2589852 ?auto_2589864 ) ) ( not ( = ?auto_2589852 ?auto_2589865 ) ) ( not ( = ?auto_2589852 ?auto_2589866 ) ) ( not ( = ?auto_2589853 ?auto_2589854 ) ) ( not ( = ?auto_2589853 ?auto_2589856 ) ) ( not ( = ?auto_2589853 ?auto_2589855 ) ) ( not ( = ?auto_2589853 ?auto_2589857 ) ) ( not ( = ?auto_2589853 ?auto_2589858 ) ) ( not ( = ?auto_2589853 ?auto_2589859 ) ) ( not ( = ?auto_2589853 ?auto_2589860 ) ) ( not ( = ?auto_2589853 ?auto_2589861 ) ) ( not ( = ?auto_2589853 ?auto_2589862 ) ) ( not ( = ?auto_2589853 ?auto_2589863 ) ) ( not ( = ?auto_2589853 ?auto_2589864 ) ) ( not ( = ?auto_2589853 ?auto_2589865 ) ) ( not ( = ?auto_2589853 ?auto_2589866 ) ) ( not ( = ?auto_2589854 ?auto_2589856 ) ) ( not ( = ?auto_2589854 ?auto_2589855 ) ) ( not ( = ?auto_2589854 ?auto_2589857 ) ) ( not ( = ?auto_2589854 ?auto_2589858 ) ) ( not ( = ?auto_2589854 ?auto_2589859 ) ) ( not ( = ?auto_2589854 ?auto_2589860 ) ) ( not ( = ?auto_2589854 ?auto_2589861 ) ) ( not ( = ?auto_2589854 ?auto_2589862 ) ) ( not ( = ?auto_2589854 ?auto_2589863 ) ) ( not ( = ?auto_2589854 ?auto_2589864 ) ) ( not ( = ?auto_2589854 ?auto_2589865 ) ) ( not ( = ?auto_2589854 ?auto_2589866 ) ) ( not ( = ?auto_2589856 ?auto_2589855 ) ) ( not ( = ?auto_2589856 ?auto_2589857 ) ) ( not ( = ?auto_2589856 ?auto_2589858 ) ) ( not ( = ?auto_2589856 ?auto_2589859 ) ) ( not ( = ?auto_2589856 ?auto_2589860 ) ) ( not ( = ?auto_2589856 ?auto_2589861 ) ) ( not ( = ?auto_2589856 ?auto_2589862 ) ) ( not ( = ?auto_2589856 ?auto_2589863 ) ) ( not ( = ?auto_2589856 ?auto_2589864 ) ) ( not ( = ?auto_2589856 ?auto_2589865 ) ) ( not ( = ?auto_2589856 ?auto_2589866 ) ) ( not ( = ?auto_2589855 ?auto_2589857 ) ) ( not ( = ?auto_2589855 ?auto_2589858 ) ) ( not ( = ?auto_2589855 ?auto_2589859 ) ) ( not ( = ?auto_2589855 ?auto_2589860 ) ) ( not ( = ?auto_2589855 ?auto_2589861 ) ) ( not ( = ?auto_2589855 ?auto_2589862 ) ) ( not ( = ?auto_2589855 ?auto_2589863 ) ) ( not ( = ?auto_2589855 ?auto_2589864 ) ) ( not ( = ?auto_2589855 ?auto_2589865 ) ) ( not ( = ?auto_2589855 ?auto_2589866 ) ) ( not ( = ?auto_2589857 ?auto_2589858 ) ) ( not ( = ?auto_2589857 ?auto_2589859 ) ) ( not ( = ?auto_2589857 ?auto_2589860 ) ) ( not ( = ?auto_2589857 ?auto_2589861 ) ) ( not ( = ?auto_2589857 ?auto_2589862 ) ) ( not ( = ?auto_2589857 ?auto_2589863 ) ) ( not ( = ?auto_2589857 ?auto_2589864 ) ) ( not ( = ?auto_2589857 ?auto_2589865 ) ) ( not ( = ?auto_2589857 ?auto_2589866 ) ) ( not ( = ?auto_2589858 ?auto_2589859 ) ) ( not ( = ?auto_2589858 ?auto_2589860 ) ) ( not ( = ?auto_2589858 ?auto_2589861 ) ) ( not ( = ?auto_2589858 ?auto_2589862 ) ) ( not ( = ?auto_2589858 ?auto_2589863 ) ) ( not ( = ?auto_2589858 ?auto_2589864 ) ) ( not ( = ?auto_2589858 ?auto_2589865 ) ) ( not ( = ?auto_2589858 ?auto_2589866 ) ) ( not ( = ?auto_2589859 ?auto_2589860 ) ) ( not ( = ?auto_2589859 ?auto_2589861 ) ) ( not ( = ?auto_2589859 ?auto_2589862 ) ) ( not ( = ?auto_2589859 ?auto_2589863 ) ) ( not ( = ?auto_2589859 ?auto_2589864 ) ) ( not ( = ?auto_2589859 ?auto_2589865 ) ) ( not ( = ?auto_2589859 ?auto_2589866 ) ) ( not ( = ?auto_2589860 ?auto_2589861 ) ) ( not ( = ?auto_2589860 ?auto_2589862 ) ) ( not ( = ?auto_2589860 ?auto_2589863 ) ) ( not ( = ?auto_2589860 ?auto_2589864 ) ) ( not ( = ?auto_2589860 ?auto_2589865 ) ) ( not ( = ?auto_2589860 ?auto_2589866 ) ) ( not ( = ?auto_2589861 ?auto_2589862 ) ) ( not ( = ?auto_2589861 ?auto_2589863 ) ) ( not ( = ?auto_2589861 ?auto_2589864 ) ) ( not ( = ?auto_2589861 ?auto_2589865 ) ) ( not ( = ?auto_2589861 ?auto_2589866 ) ) ( not ( = ?auto_2589862 ?auto_2589863 ) ) ( not ( = ?auto_2589862 ?auto_2589864 ) ) ( not ( = ?auto_2589862 ?auto_2589865 ) ) ( not ( = ?auto_2589862 ?auto_2589866 ) ) ( not ( = ?auto_2589863 ?auto_2589864 ) ) ( not ( = ?auto_2589863 ?auto_2589865 ) ) ( not ( = ?auto_2589863 ?auto_2589866 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2589864 ?auto_2589865 ?auto_2589866 )
      ( MAKE-14CRATE-VERIFY ?auto_2589852 ?auto_2589853 ?auto_2589854 ?auto_2589856 ?auto_2589855 ?auto_2589857 ?auto_2589858 ?auto_2589859 ?auto_2589860 ?auto_2589861 ?auto_2589862 ?auto_2589863 ?auto_2589864 ?auto_2589865 ?auto_2589866 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2590055 - SURFACE
      ?auto_2590056 - SURFACE
      ?auto_2590057 - SURFACE
      ?auto_2590059 - SURFACE
      ?auto_2590058 - SURFACE
      ?auto_2590060 - SURFACE
      ?auto_2590061 - SURFACE
      ?auto_2590062 - SURFACE
      ?auto_2590063 - SURFACE
      ?auto_2590064 - SURFACE
      ?auto_2590065 - SURFACE
      ?auto_2590066 - SURFACE
      ?auto_2590067 - SURFACE
      ?auto_2590068 - SURFACE
      ?auto_2590069 - SURFACE
    )
    :vars
    (
      ?auto_2590074 - HOIST
      ?auto_2590073 - PLACE
      ?auto_2590070 - TRUCK
      ?auto_2590071 - PLACE
      ?auto_2590072 - HOIST
      ?auto_2590075 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2590074 ?auto_2590073 ) ( SURFACE-AT ?auto_2590068 ?auto_2590073 ) ( CLEAR ?auto_2590068 ) ( IS-CRATE ?auto_2590069 ) ( not ( = ?auto_2590068 ?auto_2590069 ) ) ( AVAILABLE ?auto_2590074 ) ( ON ?auto_2590068 ?auto_2590067 ) ( not ( = ?auto_2590067 ?auto_2590068 ) ) ( not ( = ?auto_2590067 ?auto_2590069 ) ) ( TRUCK-AT ?auto_2590070 ?auto_2590071 ) ( not ( = ?auto_2590071 ?auto_2590073 ) ) ( HOIST-AT ?auto_2590072 ?auto_2590071 ) ( not ( = ?auto_2590074 ?auto_2590072 ) ) ( AVAILABLE ?auto_2590072 ) ( SURFACE-AT ?auto_2590069 ?auto_2590071 ) ( ON ?auto_2590069 ?auto_2590075 ) ( CLEAR ?auto_2590069 ) ( not ( = ?auto_2590068 ?auto_2590075 ) ) ( not ( = ?auto_2590069 ?auto_2590075 ) ) ( not ( = ?auto_2590067 ?auto_2590075 ) ) ( ON ?auto_2590056 ?auto_2590055 ) ( ON ?auto_2590057 ?auto_2590056 ) ( ON ?auto_2590059 ?auto_2590057 ) ( ON ?auto_2590058 ?auto_2590059 ) ( ON ?auto_2590060 ?auto_2590058 ) ( ON ?auto_2590061 ?auto_2590060 ) ( ON ?auto_2590062 ?auto_2590061 ) ( ON ?auto_2590063 ?auto_2590062 ) ( ON ?auto_2590064 ?auto_2590063 ) ( ON ?auto_2590065 ?auto_2590064 ) ( ON ?auto_2590066 ?auto_2590065 ) ( ON ?auto_2590067 ?auto_2590066 ) ( not ( = ?auto_2590055 ?auto_2590056 ) ) ( not ( = ?auto_2590055 ?auto_2590057 ) ) ( not ( = ?auto_2590055 ?auto_2590059 ) ) ( not ( = ?auto_2590055 ?auto_2590058 ) ) ( not ( = ?auto_2590055 ?auto_2590060 ) ) ( not ( = ?auto_2590055 ?auto_2590061 ) ) ( not ( = ?auto_2590055 ?auto_2590062 ) ) ( not ( = ?auto_2590055 ?auto_2590063 ) ) ( not ( = ?auto_2590055 ?auto_2590064 ) ) ( not ( = ?auto_2590055 ?auto_2590065 ) ) ( not ( = ?auto_2590055 ?auto_2590066 ) ) ( not ( = ?auto_2590055 ?auto_2590067 ) ) ( not ( = ?auto_2590055 ?auto_2590068 ) ) ( not ( = ?auto_2590055 ?auto_2590069 ) ) ( not ( = ?auto_2590055 ?auto_2590075 ) ) ( not ( = ?auto_2590056 ?auto_2590057 ) ) ( not ( = ?auto_2590056 ?auto_2590059 ) ) ( not ( = ?auto_2590056 ?auto_2590058 ) ) ( not ( = ?auto_2590056 ?auto_2590060 ) ) ( not ( = ?auto_2590056 ?auto_2590061 ) ) ( not ( = ?auto_2590056 ?auto_2590062 ) ) ( not ( = ?auto_2590056 ?auto_2590063 ) ) ( not ( = ?auto_2590056 ?auto_2590064 ) ) ( not ( = ?auto_2590056 ?auto_2590065 ) ) ( not ( = ?auto_2590056 ?auto_2590066 ) ) ( not ( = ?auto_2590056 ?auto_2590067 ) ) ( not ( = ?auto_2590056 ?auto_2590068 ) ) ( not ( = ?auto_2590056 ?auto_2590069 ) ) ( not ( = ?auto_2590056 ?auto_2590075 ) ) ( not ( = ?auto_2590057 ?auto_2590059 ) ) ( not ( = ?auto_2590057 ?auto_2590058 ) ) ( not ( = ?auto_2590057 ?auto_2590060 ) ) ( not ( = ?auto_2590057 ?auto_2590061 ) ) ( not ( = ?auto_2590057 ?auto_2590062 ) ) ( not ( = ?auto_2590057 ?auto_2590063 ) ) ( not ( = ?auto_2590057 ?auto_2590064 ) ) ( not ( = ?auto_2590057 ?auto_2590065 ) ) ( not ( = ?auto_2590057 ?auto_2590066 ) ) ( not ( = ?auto_2590057 ?auto_2590067 ) ) ( not ( = ?auto_2590057 ?auto_2590068 ) ) ( not ( = ?auto_2590057 ?auto_2590069 ) ) ( not ( = ?auto_2590057 ?auto_2590075 ) ) ( not ( = ?auto_2590059 ?auto_2590058 ) ) ( not ( = ?auto_2590059 ?auto_2590060 ) ) ( not ( = ?auto_2590059 ?auto_2590061 ) ) ( not ( = ?auto_2590059 ?auto_2590062 ) ) ( not ( = ?auto_2590059 ?auto_2590063 ) ) ( not ( = ?auto_2590059 ?auto_2590064 ) ) ( not ( = ?auto_2590059 ?auto_2590065 ) ) ( not ( = ?auto_2590059 ?auto_2590066 ) ) ( not ( = ?auto_2590059 ?auto_2590067 ) ) ( not ( = ?auto_2590059 ?auto_2590068 ) ) ( not ( = ?auto_2590059 ?auto_2590069 ) ) ( not ( = ?auto_2590059 ?auto_2590075 ) ) ( not ( = ?auto_2590058 ?auto_2590060 ) ) ( not ( = ?auto_2590058 ?auto_2590061 ) ) ( not ( = ?auto_2590058 ?auto_2590062 ) ) ( not ( = ?auto_2590058 ?auto_2590063 ) ) ( not ( = ?auto_2590058 ?auto_2590064 ) ) ( not ( = ?auto_2590058 ?auto_2590065 ) ) ( not ( = ?auto_2590058 ?auto_2590066 ) ) ( not ( = ?auto_2590058 ?auto_2590067 ) ) ( not ( = ?auto_2590058 ?auto_2590068 ) ) ( not ( = ?auto_2590058 ?auto_2590069 ) ) ( not ( = ?auto_2590058 ?auto_2590075 ) ) ( not ( = ?auto_2590060 ?auto_2590061 ) ) ( not ( = ?auto_2590060 ?auto_2590062 ) ) ( not ( = ?auto_2590060 ?auto_2590063 ) ) ( not ( = ?auto_2590060 ?auto_2590064 ) ) ( not ( = ?auto_2590060 ?auto_2590065 ) ) ( not ( = ?auto_2590060 ?auto_2590066 ) ) ( not ( = ?auto_2590060 ?auto_2590067 ) ) ( not ( = ?auto_2590060 ?auto_2590068 ) ) ( not ( = ?auto_2590060 ?auto_2590069 ) ) ( not ( = ?auto_2590060 ?auto_2590075 ) ) ( not ( = ?auto_2590061 ?auto_2590062 ) ) ( not ( = ?auto_2590061 ?auto_2590063 ) ) ( not ( = ?auto_2590061 ?auto_2590064 ) ) ( not ( = ?auto_2590061 ?auto_2590065 ) ) ( not ( = ?auto_2590061 ?auto_2590066 ) ) ( not ( = ?auto_2590061 ?auto_2590067 ) ) ( not ( = ?auto_2590061 ?auto_2590068 ) ) ( not ( = ?auto_2590061 ?auto_2590069 ) ) ( not ( = ?auto_2590061 ?auto_2590075 ) ) ( not ( = ?auto_2590062 ?auto_2590063 ) ) ( not ( = ?auto_2590062 ?auto_2590064 ) ) ( not ( = ?auto_2590062 ?auto_2590065 ) ) ( not ( = ?auto_2590062 ?auto_2590066 ) ) ( not ( = ?auto_2590062 ?auto_2590067 ) ) ( not ( = ?auto_2590062 ?auto_2590068 ) ) ( not ( = ?auto_2590062 ?auto_2590069 ) ) ( not ( = ?auto_2590062 ?auto_2590075 ) ) ( not ( = ?auto_2590063 ?auto_2590064 ) ) ( not ( = ?auto_2590063 ?auto_2590065 ) ) ( not ( = ?auto_2590063 ?auto_2590066 ) ) ( not ( = ?auto_2590063 ?auto_2590067 ) ) ( not ( = ?auto_2590063 ?auto_2590068 ) ) ( not ( = ?auto_2590063 ?auto_2590069 ) ) ( not ( = ?auto_2590063 ?auto_2590075 ) ) ( not ( = ?auto_2590064 ?auto_2590065 ) ) ( not ( = ?auto_2590064 ?auto_2590066 ) ) ( not ( = ?auto_2590064 ?auto_2590067 ) ) ( not ( = ?auto_2590064 ?auto_2590068 ) ) ( not ( = ?auto_2590064 ?auto_2590069 ) ) ( not ( = ?auto_2590064 ?auto_2590075 ) ) ( not ( = ?auto_2590065 ?auto_2590066 ) ) ( not ( = ?auto_2590065 ?auto_2590067 ) ) ( not ( = ?auto_2590065 ?auto_2590068 ) ) ( not ( = ?auto_2590065 ?auto_2590069 ) ) ( not ( = ?auto_2590065 ?auto_2590075 ) ) ( not ( = ?auto_2590066 ?auto_2590067 ) ) ( not ( = ?auto_2590066 ?auto_2590068 ) ) ( not ( = ?auto_2590066 ?auto_2590069 ) ) ( not ( = ?auto_2590066 ?auto_2590075 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2590067 ?auto_2590068 ?auto_2590069 )
      ( MAKE-14CRATE-VERIFY ?auto_2590055 ?auto_2590056 ?auto_2590057 ?auto_2590059 ?auto_2590058 ?auto_2590060 ?auto_2590061 ?auto_2590062 ?auto_2590063 ?auto_2590064 ?auto_2590065 ?auto_2590066 ?auto_2590067 ?auto_2590068 ?auto_2590069 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2590259 - SURFACE
      ?auto_2590260 - SURFACE
      ?auto_2590261 - SURFACE
      ?auto_2590263 - SURFACE
      ?auto_2590262 - SURFACE
      ?auto_2590264 - SURFACE
      ?auto_2590265 - SURFACE
      ?auto_2590266 - SURFACE
      ?auto_2590267 - SURFACE
      ?auto_2590268 - SURFACE
      ?auto_2590269 - SURFACE
      ?auto_2590270 - SURFACE
      ?auto_2590271 - SURFACE
      ?auto_2590272 - SURFACE
      ?auto_2590273 - SURFACE
    )
    :vars
    (
      ?auto_2590274 - HOIST
      ?auto_2590276 - PLACE
      ?auto_2590275 - PLACE
      ?auto_2590279 - HOIST
      ?auto_2590278 - SURFACE
      ?auto_2590277 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2590274 ?auto_2590276 ) ( SURFACE-AT ?auto_2590272 ?auto_2590276 ) ( CLEAR ?auto_2590272 ) ( IS-CRATE ?auto_2590273 ) ( not ( = ?auto_2590272 ?auto_2590273 ) ) ( AVAILABLE ?auto_2590274 ) ( ON ?auto_2590272 ?auto_2590271 ) ( not ( = ?auto_2590271 ?auto_2590272 ) ) ( not ( = ?auto_2590271 ?auto_2590273 ) ) ( not ( = ?auto_2590275 ?auto_2590276 ) ) ( HOIST-AT ?auto_2590279 ?auto_2590275 ) ( not ( = ?auto_2590274 ?auto_2590279 ) ) ( AVAILABLE ?auto_2590279 ) ( SURFACE-AT ?auto_2590273 ?auto_2590275 ) ( ON ?auto_2590273 ?auto_2590278 ) ( CLEAR ?auto_2590273 ) ( not ( = ?auto_2590272 ?auto_2590278 ) ) ( not ( = ?auto_2590273 ?auto_2590278 ) ) ( not ( = ?auto_2590271 ?auto_2590278 ) ) ( TRUCK-AT ?auto_2590277 ?auto_2590276 ) ( ON ?auto_2590260 ?auto_2590259 ) ( ON ?auto_2590261 ?auto_2590260 ) ( ON ?auto_2590263 ?auto_2590261 ) ( ON ?auto_2590262 ?auto_2590263 ) ( ON ?auto_2590264 ?auto_2590262 ) ( ON ?auto_2590265 ?auto_2590264 ) ( ON ?auto_2590266 ?auto_2590265 ) ( ON ?auto_2590267 ?auto_2590266 ) ( ON ?auto_2590268 ?auto_2590267 ) ( ON ?auto_2590269 ?auto_2590268 ) ( ON ?auto_2590270 ?auto_2590269 ) ( ON ?auto_2590271 ?auto_2590270 ) ( not ( = ?auto_2590259 ?auto_2590260 ) ) ( not ( = ?auto_2590259 ?auto_2590261 ) ) ( not ( = ?auto_2590259 ?auto_2590263 ) ) ( not ( = ?auto_2590259 ?auto_2590262 ) ) ( not ( = ?auto_2590259 ?auto_2590264 ) ) ( not ( = ?auto_2590259 ?auto_2590265 ) ) ( not ( = ?auto_2590259 ?auto_2590266 ) ) ( not ( = ?auto_2590259 ?auto_2590267 ) ) ( not ( = ?auto_2590259 ?auto_2590268 ) ) ( not ( = ?auto_2590259 ?auto_2590269 ) ) ( not ( = ?auto_2590259 ?auto_2590270 ) ) ( not ( = ?auto_2590259 ?auto_2590271 ) ) ( not ( = ?auto_2590259 ?auto_2590272 ) ) ( not ( = ?auto_2590259 ?auto_2590273 ) ) ( not ( = ?auto_2590259 ?auto_2590278 ) ) ( not ( = ?auto_2590260 ?auto_2590261 ) ) ( not ( = ?auto_2590260 ?auto_2590263 ) ) ( not ( = ?auto_2590260 ?auto_2590262 ) ) ( not ( = ?auto_2590260 ?auto_2590264 ) ) ( not ( = ?auto_2590260 ?auto_2590265 ) ) ( not ( = ?auto_2590260 ?auto_2590266 ) ) ( not ( = ?auto_2590260 ?auto_2590267 ) ) ( not ( = ?auto_2590260 ?auto_2590268 ) ) ( not ( = ?auto_2590260 ?auto_2590269 ) ) ( not ( = ?auto_2590260 ?auto_2590270 ) ) ( not ( = ?auto_2590260 ?auto_2590271 ) ) ( not ( = ?auto_2590260 ?auto_2590272 ) ) ( not ( = ?auto_2590260 ?auto_2590273 ) ) ( not ( = ?auto_2590260 ?auto_2590278 ) ) ( not ( = ?auto_2590261 ?auto_2590263 ) ) ( not ( = ?auto_2590261 ?auto_2590262 ) ) ( not ( = ?auto_2590261 ?auto_2590264 ) ) ( not ( = ?auto_2590261 ?auto_2590265 ) ) ( not ( = ?auto_2590261 ?auto_2590266 ) ) ( not ( = ?auto_2590261 ?auto_2590267 ) ) ( not ( = ?auto_2590261 ?auto_2590268 ) ) ( not ( = ?auto_2590261 ?auto_2590269 ) ) ( not ( = ?auto_2590261 ?auto_2590270 ) ) ( not ( = ?auto_2590261 ?auto_2590271 ) ) ( not ( = ?auto_2590261 ?auto_2590272 ) ) ( not ( = ?auto_2590261 ?auto_2590273 ) ) ( not ( = ?auto_2590261 ?auto_2590278 ) ) ( not ( = ?auto_2590263 ?auto_2590262 ) ) ( not ( = ?auto_2590263 ?auto_2590264 ) ) ( not ( = ?auto_2590263 ?auto_2590265 ) ) ( not ( = ?auto_2590263 ?auto_2590266 ) ) ( not ( = ?auto_2590263 ?auto_2590267 ) ) ( not ( = ?auto_2590263 ?auto_2590268 ) ) ( not ( = ?auto_2590263 ?auto_2590269 ) ) ( not ( = ?auto_2590263 ?auto_2590270 ) ) ( not ( = ?auto_2590263 ?auto_2590271 ) ) ( not ( = ?auto_2590263 ?auto_2590272 ) ) ( not ( = ?auto_2590263 ?auto_2590273 ) ) ( not ( = ?auto_2590263 ?auto_2590278 ) ) ( not ( = ?auto_2590262 ?auto_2590264 ) ) ( not ( = ?auto_2590262 ?auto_2590265 ) ) ( not ( = ?auto_2590262 ?auto_2590266 ) ) ( not ( = ?auto_2590262 ?auto_2590267 ) ) ( not ( = ?auto_2590262 ?auto_2590268 ) ) ( not ( = ?auto_2590262 ?auto_2590269 ) ) ( not ( = ?auto_2590262 ?auto_2590270 ) ) ( not ( = ?auto_2590262 ?auto_2590271 ) ) ( not ( = ?auto_2590262 ?auto_2590272 ) ) ( not ( = ?auto_2590262 ?auto_2590273 ) ) ( not ( = ?auto_2590262 ?auto_2590278 ) ) ( not ( = ?auto_2590264 ?auto_2590265 ) ) ( not ( = ?auto_2590264 ?auto_2590266 ) ) ( not ( = ?auto_2590264 ?auto_2590267 ) ) ( not ( = ?auto_2590264 ?auto_2590268 ) ) ( not ( = ?auto_2590264 ?auto_2590269 ) ) ( not ( = ?auto_2590264 ?auto_2590270 ) ) ( not ( = ?auto_2590264 ?auto_2590271 ) ) ( not ( = ?auto_2590264 ?auto_2590272 ) ) ( not ( = ?auto_2590264 ?auto_2590273 ) ) ( not ( = ?auto_2590264 ?auto_2590278 ) ) ( not ( = ?auto_2590265 ?auto_2590266 ) ) ( not ( = ?auto_2590265 ?auto_2590267 ) ) ( not ( = ?auto_2590265 ?auto_2590268 ) ) ( not ( = ?auto_2590265 ?auto_2590269 ) ) ( not ( = ?auto_2590265 ?auto_2590270 ) ) ( not ( = ?auto_2590265 ?auto_2590271 ) ) ( not ( = ?auto_2590265 ?auto_2590272 ) ) ( not ( = ?auto_2590265 ?auto_2590273 ) ) ( not ( = ?auto_2590265 ?auto_2590278 ) ) ( not ( = ?auto_2590266 ?auto_2590267 ) ) ( not ( = ?auto_2590266 ?auto_2590268 ) ) ( not ( = ?auto_2590266 ?auto_2590269 ) ) ( not ( = ?auto_2590266 ?auto_2590270 ) ) ( not ( = ?auto_2590266 ?auto_2590271 ) ) ( not ( = ?auto_2590266 ?auto_2590272 ) ) ( not ( = ?auto_2590266 ?auto_2590273 ) ) ( not ( = ?auto_2590266 ?auto_2590278 ) ) ( not ( = ?auto_2590267 ?auto_2590268 ) ) ( not ( = ?auto_2590267 ?auto_2590269 ) ) ( not ( = ?auto_2590267 ?auto_2590270 ) ) ( not ( = ?auto_2590267 ?auto_2590271 ) ) ( not ( = ?auto_2590267 ?auto_2590272 ) ) ( not ( = ?auto_2590267 ?auto_2590273 ) ) ( not ( = ?auto_2590267 ?auto_2590278 ) ) ( not ( = ?auto_2590268 ?auto_2590269 ) ) ( not ( = ?auto_2590268 ?auto_2590270 ) ) ( not ( = ?auto_2590268 ?auto_2590271 ) ) ( not ( = ?auto_2590268 ?auto_2590272 ) ) ( not ( = ?auto_2590268 ?auto_2590273 ) ) ( not ( = ?auto_2590268 ?auto_2590278 ) ) ( not ( = ?auto_2590269 ?auto_2590270 ) ) ( not ( = ?auto_2590269 ?auto_2590271 ) ) ( not ( = ?auto_2590269 ?auto_2590272 ) ) ( not ( = ?auto_2590269 ?auto_2590273 ) ) ( not ( = ?auto_2590269 ?auto_2590278 ) ) ( not ( = ?auto_2590270 ?auto_2590271 ) ) ( not ( = ?auto_2590270 ?auto_2590272 ) ) ( not ( = ?auto_2590270 ?auto_2590273 ) ) ( not ( = ?auto_2590270 ?auto_2590278 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2590271 ?auto_2590272 ?auto_2590273 )
      ( MAKE-14CRATE-VERIFY ?auto_2590259 ?auto_2590260 ?auto_2590261 ?auto_2590263 ?auto_2590262 ?auto_2590264 ?auto_2590265 ?auto_2590266 ?auto_2590267 ?auto_2590268 ?auto_2590269 ?auto_2590270 ?auto_2590271 ?auto_2590272 ?auto_2590273 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2590463 - SURFACE
      ?auto_2590464 - SURFACE
      ?auto_2590465 - SURFACE
      ?auto_2590467 - SURFACE
      ?auto_2590466 - SURFACE
      ?auto_2590468 - SURFACE
      ?auto_2590469 - SURFACE
      ?auto_2590470 - SURFACE
      ?auto_2590471 - SURFACE
      ?auto_2590472 - SURFACE
      ?auto_2590473 - SURFACE
      ?auto_2590474 - SURFACE
      ?auto_2590475 - SURFACE
      ?auto_2590476 - SURFACE
      ?auto_2590477 - SURFACE
    )
    :vars
    (
      ?auto_2590482 - HOIST
      ?auto_2590480 - PLACE
      ?auto_2590478 - PLACE
      ?auto_2590483 - HOIST
      ?auto_2590479 - SURFACE
      ?auto_2590481 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2590482 ?auto_2590480 ) ( IS-CRATE ?auto_2590477 ) ( not ( = ?auto_2590476 ?auto_2590477 ) ) ( not ( = ?auto_2590475 ?auto_2590476 ) ) ( not ( = ?auto_2590475 ?auto_2590477 ) ) ( not ( = ?auto_2590478 ?auto_2590480 ) ) ( HOIST-AT ?auto_2590483 ?auto_2590478 ) ( not ( = ?auto_2590482 ?auto_2590483 ) ) ( AVAILABLE ?auto_2590483 ) ( SURFACE-AT ?auto_2590477 ?auto_2590478 ) ( ON ?auto_2590477 ?auto_2590479 ) ( CLEAR ?auto_2590477 ) ( not ( = ?auto_2590476 ?auto_2590479 ) ) ( not ( = ?auto_2590477 ?auto_2590479 ) ) ( not ( = ?auto_2590475 ?auto_2590479 ) ) ( TRUCK-AT ?auto_2590481 ?auto_2590480 ) ( SURFACE-AT ?auto_2590475 ?auto_2590480 ) ( CLEAR ?auto_2590475 ) ( LIFTING ?auto_2590482 ?auto_2590476 ) ( IS-CRATE ?auto_2590476 ) ( ON ?auto_2590464 ?auto_2590463 ) ( ON ?auto_2590465 ?auto_2590464 ) ( ON ?auto_2590467 ?auto_2590465 ) ( ON ?auto_2590466 ?auto_2590467 ) ( ON ?auto_2590468 ?auto_2590466 ) ( ON ?auto_2590469 ?auto_2590468 ) ( ON ?auto_2590470 ?auto_2590469 ) ( ON ?auto_2590471 ?auto_2590470 ) ( ON ?auto_2590472 ?auto_2590471 ) ( ON ?auto_2590473 ?auto_2590472 ) ( ON ?auto_2590474 ?auto_2590473 ) ( ON ?auto_2590475 ?auto_2590474 ) ( not ( = ?auto_2590463 ?auto_2590464 ) ) ( not ( = ?auto_2590463 ?auto_2590465 ) ) ( not ( = ?auto_2590463 ?auto_2590467 ) ) ( not ( = ?auto_2590463 ?auto_2590466 ) ) ( not ( = ?auto_2590463 ?auto_2590468 ) ) ( not ( = ?auto_2590463 ?auto_2590469 ) ) ( not ( = ?auto_2590463 ?auto_2590470 ) ) ( not ( = ?auto_2590463 ?auto_2590471 ) ) ( not ( = ?auto_2590463 ?auto_2590472 ) ) ( not ( = ?auto_2590463 ?auto_2590473 ) ) ( not ( = ?auto_2590463 ?auto_2590474 ) ) ( not ( = ?auto_2590463 ?auto_2590475 ) ) ( not ( = ?auto_2590463 ?auto_2590476 ) ) ( not ( = ?auto_2590463 ?auto_2590477 ) ) ( not ( = ?auto_2590463 ?auto_2590479 ) ) ( not ( = ?auto_2590464 ?auto_2590465 ) ) ( not ( = ?auto_2590464 ?auto_2590467 ) ) ( not ( = ?auto_2590464 ?auto_2590466 ) ) ( not ( = ?auto_2590464 ?auto_2590468 ) ) ( not ( = ?auto_2590464 ?auto_2590469 ) ) ( not ( = ?auto_2590464 ?auto_2590470 ) ) ( not ( = ?auto_2590464 ?auto_2590471 ) ) ( not ( = ?auto_2590464 ?auto_2590472 ) ) ( not ( = ?auto_2590464 ?auto_2590473 ) ) ( not ( = ?auto_2590464 ?auto_2590474 ) ) ( not ( = ?auto_2590464 ?auto_2590475 ) ) ( not ( = ?auto_2590464 ?auto_2590476 ) ) ( not ( = ?auto_2590464 ?auto_2590477 ) ) ( not ( = ?auto_2590464 ?auto_2590479 ) ) ( not ( = ?auto_2590465 ?auto_2590467 ) ) ( not ( = ?auto_2590465 ?auto_2590466 ) ) ( not ( = ?auto_2590465 ?auto_2590468 ) ) ( not ( = ?auto_2590465 ?auto_2590469 ) ) ( not ( = ?auto_2590465 ?auto_2590470 ) ) ( not ( = ?auto_2590465 ?auto_2590471 ) ) ( not ( = ?auto_2590465 ?auto_2590472 ) ) ( not ( = ?auto_2590465 ?auto_2590473 ) ) ( not ( = ?auto_2590465 ?auto_2590474 ) ) ( not ( = ?auto_2590465 ?auto_2590475 ) ) ( not ( = ?auto_2590465 ?auto_2590476 ) ) ( not ( = ?auto_2590465 ?auto_2590477 ) ) ( not ( = ?auto_2590465 ?auto_2590479 ) ) ( not ( = ?auto_2590467 ?auto_2590466 ) ) ( not ( = ?auto_2590467 ?auto_2590468 ) ) ( not ( = ?auto_2590467 ?auto_2590469 ) ) ( not ( = ?auto_2590467 ?auto_2590470 ) ) ( not ( = ?auto_2590467 ?auto_2590471 ) ) ( not ( = ?auto_2590467 ?auto_2590472 ) ) ( not ( = ?auto_2590467 ?auto_2590473 ) ) ( not ( = ?auto_2590467 ?auto_2590474 ) ) ( not ( = ?auto_2590467 ?auto_2590475 ) ) ( not ( = ?auto_2590467 ?auto_2590476 ) ) ( not ( = ?auto_2590467 ?auto_2590477 ) ) ( not ( = ?auto_2590467 ?auto_2590479 ) ) ( not ( = ?auto_2590466 ?auto_2590468 ) ) ( not ( = ?auto_2590466 ?auto_2590469 ) ) ( not ( = ?auto_2590466 ?auto_2590470 ) ) ( not ( = ?auto_2590466 ?auto_2590471 ) ) ( not ( = ?auto_2590466 ?auto_2590472 ) ) ( not ( = ?auto_2590466 ?auto_2590473 ) ) ( not ( = ?auto_2590466 ?auto_2590474 ) ) ( not ( = ?auto_2590466 ?auto_2590475 ) ) ( not ( = ?auto_2590466 ?auto_2590476 ) ) ( not ( = ?auto_2590466 ?auto_2590477 ) ) ( not ( = ?auto_2590466 ?auto_2590479 ) ) ( not ( = ?auto_2590468 ?auto_2590469 ) ) ( not ( = ?auto_2590468 ?auto_2590470 ) ) ( not ( = ?auto_2590468 ?auto_2590471 ) ) ( not ( = ?auto_2590468 ?auto_2590472 ) ) ( not ( = ?auto_2590468 ?auto_2590473 ) ) ( not ( = ?auto_2590468 ?auto_2590474 ) ) ( not ( = ?auto_2590468 ?auto_2590475 ) ) ( not ( = ?auto_2590468 ?auto_2590476 ) ) ( not ( = ?auto_2590468 ?auto_2590477 ) ) ( not ( = ?auto_2590468 ?auto_2590479 ) ) ( not ( = ?auto_2590469 ?auto_2590470 ) ) ( not ( = ?auto_2590469 ?auto_2590471 ) ) ( not ( = ?auto_2590469 ?auto_2590472 ) ) ( not ( = ?auto_2590469 ?auto_2590473 ) ) ( not ( = ?auto_2590469 ?auto_2590474 ) ) ( not ( = ?auto_2590469 ?auto_2590475 ) ) ( not ( = ?auto_2590469 ?auto_2590476 ) ) ( not ( = ?auto_2590469 ?auto_2590477 ) ) ( not ( = ?auto_2590469 ?auto_2590479 ) ) ( not ( = ?auto_2590470 ?auto_2590471 ) ) ( not ( = ?auto_2590470 ?auto_2590472 ) ) ( not ( = ?auto_2590470 ?auto_2590473 ) ) ( not ( = ?auto_2590470 ?auto_2590474 ) ) ( not ( = ?auto_2590470 ?auto_2590475 ) ) ( not ( = ?auto_2590470 ?auto_2590476 ) ) ( not ( = ?auto_2590470 ?auto_2590477 ) ) ( not ( = ?auto_2590470 ?auto_2590479 ) ) ( not ( = ?auto_2590471 ?auto_2590472 ) ) ( not ( = ?auto_2590471 ?auto_2590473 ) ) ( not ( = ?auto_2590471 ?auto_2590474 ) ) ( not ( = ?auto_2590471 ?auto_2590475 ) ) ( not ( = ?auto_2590471 ?auto_2590476 ) ) ( not ( = ?auto_2590471 ?auto_2590477 ) ) ( not ( = ?auto_2590471 ?auto_2590479 ) ) ( not ( = ?auto_2590472 ?auto_2590473 ) ) ( not ( = ?auto_2590472 ?auto_2590474 ) ) ( not ( = ?auto_2590472 ?auto_2590475 ) ) ( not ( = ?auto_2590472 ?auto_2590476 ) ) ( not ( = ?auto_2590472 ?auto_2590477 ) ) ( not ( = ?auto_2590472 ?auto_2590479 ) ) ( not ( = ?auto_2590473 ?auto_2590474 ) ) ( not ( = ?auto_2590473 ?auto_2590475 ) ) ( not ( = ?auto_2590473 ?auto_2590476 ) ) ( not ( = ?auto_2590473 ?auto_2590477 ) ) ( not ( = ?auto_2590473 ?auto_2590479 ) ) ( not ( = ?auto_2590474 ?auto_2590475 ) ) ( not ( = ?auto_2590474 ?auto_2590476 ) ) ( not ( = ?auto_2590474 ?auto_2590477 ) ) ( not ( = ?auto_2590474 ?auto_2590479 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2590475 ?auto_2590476 ?auto_2590477 )
      ( MAKE-14CRATE-VERIFY ?auto_2590463 ?auto_2590464 ?auto_2590465 ?auto_2590467 ?auto_2590466 ?auto_2590468 ?auto_2590469 ?auto_2590470 ?auto_2590471 ?auto_2590472 ?auto_2590473 ?auto_2590474 ?auto_2590475 ?auto_2590476 ?auto_2590477 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2590667 - SURFACE
      ?auto_2590668 - SURFACE
      ?auto_2590669 - SURFACE
      ?auto_2590671 - SURFACE
      ?auto_2590670 - SURFACE
      ?auto_2590672 - SURFACE
      ?auto_2590673 - SURFACE
      ?auto_2590674 - SURFACE
      ?auto_2590675 - SURFACE
      ?auto_2590676 - SURFACE
      ?auto_2590677 - SURFACE
      ?auto_2590678 - SURFACE
      ?auto_2590679 - SURFACE
      ?auto_2590680 - SURFACE
      ?auto_2590681 - SURFACE
    )
    :vars
    (
      ?auto_2590684 - HOIST
      ?auto_2590683 - PLACE
      ?auto_2590686 - PLACE
      ?auto_2590685 - HOIST
      ?auto_2590687 - SURFACE
      ?auto_2590682 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2590684 ?auto_2590683 ) ( IS-CRATE ?auto_2590681 ) ( not ( = ?auto_2590680 ?auto_2590681 ) ) ( not ( = ?auto_2590679 ?auto_2590680 ) ) ( not ( = ?auto_2590679 ?auto_2590681 ) ) ( not ( = ?auto_2590686 ?auto_2590683 ) ) ( HOIST-AT ?auto_2590685 ?auto_2590686 ) ( not ( = ?auto_2590684 ?auto_2590685 ) ) ( AVAILABLE ?auto_2590685 ) ( SURFACE-AT ?auto_2590681 ?auto_2590686 ) ( ON ?auto_2590681 ?auto_2590687 ) ( CLEAR ?auto_2590681 ) ( not ( = ?auto_2590680 ?auto_2590687 ) ) ( not ( = ?auto_2590681 ?auto_2590687 ) ) ( not ( = ?auto_2590679 ?auto_2590687 ) ) ( TRUCK-AT ?auto_2590682 ?auto_2590683 ) ( SURFACE-AT ?auto_2590679 ?auto_2590683 ) ( CLEAR ?auto_2590679 ) ( IS-CRATE ?auto_2590680 ) ( AVAILABLE ?auto_2590684 ) ( IN ?auto_2590680 ?auto_2590682 ) ( ON ?auto_2590668 ?auto_2590667 ) ( ON ?auto_2590669 ?auto_2590668 ) ( ON ?auto_2590671 ?auto_2590669 ) ( ON ?auto_2590670 ?auto_2590671 ) ( ON ?auto_2590672 ?auto_2590670 ) ( ON ?auto_2590673 ?auto_2590672 ) ( ON ?auto_2590674 ?auto_2590673 ) ( ON ?auto_2590675 ?auto_2590674 ) ( ON ?auto_2590676 ?auto_2590675 ) ( ON ?auto_2590677 ?auto_2590676 ) ( ON ?auto_2590678 ?auto_2590677 ) ( ON ?auto_2590679 ?auto_2590678 ) ( not ( = ?auto_2590667 ?auto_2590668 ) ) ( not ( = ?auto_2590667 ?auto_2590669 ) ) ( not ( = ?auto_2590667 ?auto_2590671 ) ) ( not ( = ?auto_2590667 ?auto_2590670 ) ) ( not ( = ?auto_2590667 ?auto_2590672 ) ) ( not ( = ?auto_2590667 ?auto_2590673 ) ) ( not ( = ?auto_2590667 ?auto_2590674 ) ) ( not ( = ?auto_2590667 ?auto_2590675 ) ) ( not ( = ?auto_2590667 ?auto_2590676 ) ) ( not ( = ?auto_2590667 ?auto_2590677 ) ) ( not ( = ?auto_2590667 ?auto_2590678 ) ) ( not ( = ?auto_2590667 ?auto_2590679 ) ) ( not ( = ?auto_2590667 ?auto_2590680 ) ) ( not ( = ?auto_2590667 ?auto_2590681 ) ) ( not ( = ?auto_2590667 ?auto_2590687 ) ) ( not ( = ?auto_2590668 ?auto_2590669 ) ) ( not ( = ?auto_2590668 ?auto_2590671 ) ) ( not ( = ?auto_2590668 ?auto_2590670 ) ) ( not ( = ?auto_2590668 ?auto_2590672 ) ) ( not ( = ?auto_2590668 ?auto_2590673 ) ) ( not ( = ?auto_2590668 ?auto_2590674 ) ) ( not ( = ?auto_2590668 ?auto_2590675 ) ) ( not ( = ?auto_2590668 ?auto_2590676 ) ) ( not ( = ?auto_2590668 ?auto_2590677 ) ) ( not ( = ?auto_2590668 ?auto_2590678 ) ) ( not ( = ?auto_2590668 ?auto_2590679 ) ) ( not ( = ?auto_2590668 ?auto_2590680 ) ) ( not ( = ?auto_2590668 ?auto_2590681 ) ) ( not ( = ?auto_2590668 ?auto_2590687 ) ) ( not ( = ?auto_2590669 ?auto_2590671 ) ) ( not ( = ?auto_2590669 ?auto_2590670 ) ) ( not ( = ?auto_2590669 ?auto_2590672 ) ) ( not ( = ?auto_2590669 ?auto_2590673 ) ) ( not ( = ?auto_2590669 ?auto_2590674 ) ) ( not ( = ?auto_2590669 ?auto_2590675 ) ) ( not ( = ?auto_2590669 ?auto_2590676 ) ) ( not ( = ?auto_2590669 ?auto_2590677 ) ) ( not ( = ?auto_2590669 ?auto_2590678 ) ) ( not ( = ?auto_2590669 ?auto_2590679 ) ) ( not ( = ?auto_2590669 ?auto_2590680 ) ) ( not ( = ?auto_2590669 ?auto_2590681 ) ) ( not ( = ?auto_2590669 ?auto_2590687 ) ) ( not ( = ?auto_2590671 ?auto_2590670 ) ) ( not ( = ?auto_2590671 ?auto_2590672 ) ) ( not ( = ?auto_2590671 ?auto_2590673 ) ) ( not ( = ?auto_2590671 ?auto_2590674 ) ) ( not ( = ?auto_2590671 ?auto_2590675 ) ) ( not ( = ?auto_2590671 ?auto_2590676 ) ) ( not ( = ?auto_2590671 ?auto_2590677 ) ) ( not ( = ?auto_2590671 ?auto_2590678 ) ) ( not ( = ?auto_2590671 ?auto_2590679 ) ) ( not ( = ?auto_2590671 ?auto_2590680 ) ) ( not ( = ?auto_2590671 ?auto_2590681 ) ) ( not ( = ?auto_2590671 ?auto_2590687 ) ) ( not ( = ?auto_2590670 ?auto_2590672 ) ) ( not ( = ?auto_2590670 ?auto_2590673 ) ) ( not ( = ?auto_2590670 ?auto_2590674 ) ) ( not ( = ?auto_2590670 ?auto_2590675 ) ) ( not ( = ?auto_2590670 ?auto_2590676 ) ) ( not ( = ?auto_2590670 ?auto_2590677 ) ) ( not ( = ?auto_2590670 ?auto_2590678 ) ) ( not ( = ?auto_2590670 ?auto_2590679 ) ) ( not ( = ?auto_2590670 ?auto_2590680 ) ) ( not ( = ?auto_2590670 ?auto_2590681 ) ) ( not ( = ?auto_2590670 ?auto_2590687 ) ) ( not ( = ?auto_2590672 ?auto_2590673 ) ) ( not ( = ?auto_2590672 ?auto_2590674 ) ) ( not ( = ?auto_2590672 ?auto_2590675 ) ) ( not ( = ?auto_2590672 ?auto_2590676 ) ) ( not ( = ?auto_2590672 ?auto_2590677 ) ) ( not ( = ?auto_2590672 ?auto_2590678 ) ) ( not ( = ?auto_2590672 ?auto_2590679 ) ) ( not ( = ?auto_2590672 ?auto_2590680 ) ) ( not ( = ?auto_2590672 ?auto_2590681 ) ) ( not ( = ?auto_2590672 ?auto_2590687 ) ) ( not ( = ?auto_2590673 ?auto_2590674 ) ) ( not ( = ?auto_2590673 ?auto_2590675 ) ) ( not ( = ?auto_2590673 ?auto_2590676 ) ) ( not ( = ?auto_2590673 ?auto_2590677 ) ) ( not ( = ?auto_2590673 ?auto_2590678 ) ) ( not ( = ?auto_2590673 ?auto_2590679 ) ) ( not ( = ?auto_2590673 ?auto_2590680 ) ) ( not ( = ?auto_2590673 ?auto_2590681 ) ) ( not ( = ?auto_2590673 ?auto_2590687 ) ) ( not ( = ?auto_2590674 ?auto_2590675 ) ) ( not ( = ?auto_2590674 ?auto_2590676 ) ) ( not ( = ?auto_2590674 ?auto_2590677 ) ) ( not ( = ?auto_2590674 ?auto_2590678 ) ) ( not ( = ?auto_2590674 ?auto_2590679 ) ) ( not ( = ?auto_2590674 ?auto_2590680 ) ) ( not ( = ?auto_2590674 ?auto_2590681 ) ) ( not ( = ?auto_2590674 ?auto_2590687 ) ) ( not ( = ?auto_2590675 ?auto_2590676 ) ) ( not ( = ?auto_2590675 ?auto_2590677 ) ) ( not ( = ?auto_2590675 ?auto_2590678 ) ) ( not ( = ?auto_2590675 ?auto_2590679 ) ) ( not ( = ?auto_2590675 ?auto_2590680 ) ) ( not ( = ?auto_2590675 ?auto_2590681 ) ) ( not ( = ?auto_2590675 ?auto_2590687 ) ) ( not ( = ?auto_2590676 ?auto_2590677 ) ) ( not ( = ?auto_2590676 ?auto_2590678 ) ) ( not ( = ?auto_2590676 ?auto_2590679 ) ) ( not ( = ?auto_2590676 ?auto_2590680 ) ) ( not ( = ?auto_2590676 ?auto_2590681 ) ) ( not ( = ?auto_2590676 ?auto_2590687 ) ) ( not ( = ?auto_2590677 ?auto_2590678 ) ) ( not ( = ?auto_2590677 ?auto_2590679 ) ) ( not ( = ?auto_2590677 ?auto_2590680 ) ) ( not ( = ?auto_2590677 ?auto_2590681 ) ) ( not ( = ?auto_2590677 ?auto_2590687 ) ) ( not ( = ?auto_2590678 ?auto_2590679 ) ) ( not ( = ?auto_2590678 ?auto_2590680 ) ) ( not ( = ?auto_2590678 ?auto_2590681 ) ) ( not ( = ?auto_2590678 ?auto_2590687 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2590679 ?auto_2590680 ?auto_2590681 )
      ( MAKE-14CRATE-VERIFY ?auto_2590667 ?auto_2590668 ?auto_2590669 ?auto_2590671 ?auto_2590670 ?auto_2590672 ?auto_2590673 ?auto_2590674 ?auto_2590675 ?auto_2590676 ?auto_2590677 ?auto_2590678 ?auto_2590679 ?auto_2590680 ?auto_2590681 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2607831 - SURFACE
      ?auto_2607832 - SURFACE
      ?auto_2607833 - SURFACE
      ?auto_2607835 - SURFACE
      ?auto_2607834 - SURFACE
      ?auto_2607836 - SURFACE
      ?auto_2607837 - SURFACE
      ?auto_2607838 - SURFACE
      ?auto_2607839 - SURFACE
      ?auto_2607840 - SURFACE
      ?auto_2607841 - SURFACE
      ?auto_2607842 - SURFACE
      ?auto_2607843 - SURFACE
      ?auto_2607844 - SURFACE
      ?auto_2607845 - SURFACE
      ?auto_2607846 - SURFACE
    )
    :vars
    (
      ?auto_2607847 - HOIST
      ?auto_2607848 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2607847 ?auto_2607848 ) ( SURFACE-AT ?auto_2607845 ?auto_2607848 ) ( CLEAR ?auto_2607845 ) ( LIFTING ?auto_2607847 ?auto_2607846 ) ( IS-CRATE ?auto_2607846 ) ( not ( = ?auto_2607845 ?auto_2607846 ) ) ( ON ?auto_2607832 ?auto_2607831 ) ( ON ?auto_2607833 ?auto_2607832 ) ( ON ?auto_2607835 ?auto_2607833 ) ( ON ?auto_2607834 ?auto_2607835 ) ( ON ?auto_2607836 ?auto_2607834 ) ( ON ?auto_2607837 ?auto_2607836 ) ( ON ?auto_2607838 ?auto_2607837 ) ( ON ?auto_2607839 ?auto_2607838 ) ( ON ?auto_2607840 ?auto_2607839 ) ( ON ?auto_2607841 ?auto_2607840 ) ( ON ?auto_2607842 ?auto_2607841 ) ( ON ?auto_2607843 ?auto_2607842 ) ( ON ?auto_2607844 ?auto_2607843 ) ( ON ?auto_2607845 ?auto_2607844 ) ( not ( = ?auto_2607831 ?auto_2607832 ) ) ( not ( = ?auto_2607831 ?auto_2607833 ) ) ( not ( = ?auto_2607831 ?auto_2607835 ) ) ( not ( = ?auto_2607831 ?auto_2607834 ) ) ( not ( = ?auto_2607831 ?auto_2607836 ) ) ( not ( = ?auto_2607831 ?auto_2607837 ) ) ( not ( = ?auto_2607831 ?auto_2607838 ) ) ( not ( = ?auto_2607831 ?auto_2607839 ) ) ( not ( = ?auto_2607831 ?auto_2607840 ) ) ( not ( = ?auto_2607831 ?auto_2607841 ) ) ( not ( = ?auto_2607831 ?auto_2607842 ) ) ( not ( = ?auto_2607831 ?auto_2607843 ) ) ( not ( = ?auto_2607831 ?auto_2607844 ) ) ( not ( = ?auto_2607831 ?auto_2607845 ) ) ( not ( = ?auto_2607831 ?auto_2607846 ) ) ( not ( = ?auto_2607832 ?auto_2607833 ) ) ( not ( = ?auto_2607832 ?auto_2607835 ) ) ( not ( = ?auto_2607832 ?auto_2607834 ) ) ( not ( = ?auto_2607832 ?auto_2607836 ) ) ( not ( = ?auto_2607832 ?auto_2607837 ) ) ( not ( = ?auto_2607832 ?auto_2607838 ) ) ( not ( = ?auto_2607832 ?auto_2607839 ) ) ( not ( = ?auto_2607832 ?auto_2607840 ) ) ( not ( = ?auto_2607832 ?auto_2607841 ) ) ( not ( = ?auto_2607832 ?auto_2607842 ) ) ( not ( = ?auto_2607832 ?auto_2607843 ) ) ( not ( = ?auto_2607832 ?auto_2607844 ) ) ( not ( = ?auto_2607832 ?auto_2607845 ) ) ( not ( = ?auto_2607832 ?auto_2607846 ) ) ( not ( = ?auto_2607833 ?auto_2607835 ) ) ( not ( = ?auto_2607833 ?auto_2607834 ) ) ( not ( = ?auto_2607833 ?auto_2607836 ) ) ( not ( = ?auto_2607833 ?auto_2607837 ) ) ( not ( = ?auto_2607833 ?auto_2607838 ) ) ( not ( = ?auto_2607833 ?auto_2607839 ) ) ( not ( = ?auto_2607833 ?auto_2607840 ) ) ( not ( = ?auto_2607833 ?auto_2607841 ) ) ( not ( = ?auto_2607833 ?auto_2607842 ) ) ( not ( = ?auto_2607833 ?auto_2607843 ) ) ( not ( = ?auto_2607833 ?auto_2607844 ) ) ( not ( = ?auto_2607833 ?auto_2607845 ) ) ( not ( = ?auto_2607833 ?auto_2607846 ) ) ( not ( = ?auto_2607835 ?auto_2607834 ) ) ( not ( = ?auto_2607835 ?auto_2607836 ) ) ( not ( = ?auto_2607835 ?auto_2607837 ) ) ( not ( = ?auto_2607835 ?auto_2607838 ) ) ( not ( = ?auto_2607835 ?auto_2607839 ) ) ( not ( = ?auto_2607835 ?auto_2607840 ) ) ( not ( = ?auto_2607835 ?auto_2607841 ) ) ( not ( = ?auto_2607835 ?auto_2607842 ) ) ( not ( = ?auto_2607835 ?auto_2607843 ) ) ( not ( = ?auto_2607835 ?auto_2607844 ) ) ( not ( = ?auto_2607835 ?auto_2607845 ) ) ( not ( = ?auto_2607835 ?auto_2607846 ) ) ( not ( = ?auto_2607834 ?auto_2607836 ) ) ( not ( = ?auto_2607834 ?auto_2607837 ) ) ( not ( = ?auto_2607834 ?auto_2607838 ) ) ( not ( = ?auto_2607834 ?auto_2607839 ) ) ( not ( = ?auto_2607834 ?auto_2607840 ) ) ( not ( = ?auto_2607834 ?auto_2607841 ) ) ( not ( = ?auto_2607834 ?auto_2607842 ) ) ( not ( = ?auto_2607834 ?auto_2607843 ) ) ( not ( = ?auto_2607834 ?auto_2607844 ) ) ( not ( = ?auto_2607834 ?auto_2607845 ) ) ( not ( = ?auto_2607834 ?auto_2607846 ) ) ( not ( = ?auto_2607836 ?auto_2607837 ) ) ( not ( = ?auto_2607836 ?auto_2607838 ) ) ( not ( = ?auto_2607836 ?auto_2607839 ) ) ( not ( = ?auto_2607836 ?auto_2607840 ) ) ( not ( = ?auto_2607836 ?auto_2607841 ) ) ( not ( = ?auto_2607836 ?auto_2607842 ) ) ( not ( = ?auto_2607836 ?auto_2607843 ) ) ( not ( = ?auto_2607836 ?auto_2607844 ) ) ( not ( = ?auto_2607836 ?auto_2607845 ) ) ( not ( = ?auto_2607836 ?auto_2607846 ) ) ( not ( = ?auto_2607837 ?auto_2607838 ) ) ( not ( = ?auto_2607837 ?auto_2607839 ) ) ( not ( = ?auto_2607837 ?auto_2607840 ) ) ( not ( = ?auto_2607837 ?auto_2607841 ) ) ( not ( = ?auto_2607837 ?auto_2607842 ) ) ( not ( = ?auto_2607837 ?auto_2607843 ) ) ( not ( = ?auto_2607837 ?auto_2607844 ) ) ( not ( = ?auto_2607837 ?auto_2607845 ) ) ( not ( = ?auto_2607837 ?auto_2607846 ) ) ( not ( = ?auto_2607838 ?auto_2607839 ) ) ( not ( = ?auto_2607838 ?auto_2607840 ) ) ( not ( = ?auto_2607838 ?auto_2607841 ) ) ( not ( = ?auto_2607838 ?auto_2607842 ) ) ( not ( = ?auto_2607838 ?auto_2607843 ) ) ( not ( = ?auto_2607838 ?auto_2607844 ) ) ( not ( = ?auto_2607838 ?auto_2607845 ) ) ( not ( = ?auto_2607838 ?auto_2607846 ) ) ( not ( = ?auto_2607839 ?auto_2607840 ) ) ( not ( = ?auto_2607839 ?auto_2607841 ) ) ( not ( = ?auto_2607839 ?auto_2607842 ) ) ( not ( = ?auto_2607839 ?auto_2607843 ) ) ( not ( = ?auto_2607839 ?auto_2607844 ) ) ( not ( = ?auto_2607839 ?auto_2607845 ) ) ( not ( = ?auto_2607839 ?auto_2607846 ) ) ( not ( = ?auto_2607840 ?auto_2607841 ) ) ( not ( = ?auto_2607840 ?auto_2607842 ) ) ( not ( = ?auto_2607840 ?auto_2607843 ) ) ( not ( = ?auto_2607840 ?auto_2607844 ) ) ( not ( = ?auto_2607840 ?auto_2607845 ) ) ( not ( = ?auto_2607840 ?auto_2607846 ) ) ( not ( = ?auto_2607841 ?auto_2607842 ) ) ( not ( = ?auto_2607841 ?auto_2607843 ) ) ( not ( = ?auto_2607841 ?auto_2607844 ) ) ( not ( = ?auto_2607841 ?auto_2607845 ) ) ( not ( = ?auto_2607841 ?auto_2607846 ) ) ( not ( = ?auto_2607842 ?auto_2607843 ) ) ( not ( = ?auto_2607842 ?auto_2607844 ) ) ( not ( = ?auto_2607842 ?auto_2607845 ) ) ( not ( = ?auto_2607842 ?auto_2607846 ) ) ( not ( = ?auto_2607843 ?auto_2607844 ) ) ( not ( = ?auto_2607843 ?auto_2607845 ) ) ( not ( = ?auto_2607843 ?auto_2607846 ) ) ( not ( = ?auto_2607844 ?auto_2607845 ) ) ( not ( = ?auto_2607844 ?auto_2607846 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2607845 ?auto_2607846 )
      ( MAKE-15CRATE-VERIFY ?auto_2607831 ?auto_2607832 ?auto_2607833 ?auto_2607835 ?auto_2607834 ?auto_2607836 ?auto_2607837 ?auto_2607838 ?auto_2607839 ?auto_2607840 ?auto_2607841 ?auto_2607842 ?auto_2607843 ?auto_2607844 ?auto_2607845 ?auto_2607846 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2608010 - SURFACE
      ?auto_2608011 - SURFACE
      ?auto_2608012 - SURFACE
      ?auto_2608014 - SURFACE
      ?auto_2608013 - SURFACE
      ?auto_2608015 - SURFACE
      ?auto_2608016 - SURFACE
      ?auto_2608017 - SURFACE
      ?auto_2608018 - SURFACE
      ?auto_2608019 - SURFACE
      ?auto_2608020 - SURFACE
      ?auto_2608021 - SURFACE
      ?auto_2608022 - SURFACE
      ?auto_2608023 - SURFACE
      ?auto_2608024 - SURFACE
      ?auto_2608025 - SURFACE
    )
    :vars
    (
      ?auto_2608026 - HOIST
      ?auto_2608027 - PLACE
      ?auto_2608028 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2608026 ?auto_2608027 ) ( SURFACE-AT ?auto_2608024 ?auto_2608027 ) ( CLEAR ?auto_2608024 ) ( IS-CRATE ?auto_2608025 ) ( not ( = ?auto_2608024 ?auto_2608025 ) ) ( TRUCK-AT ?auto_2608028 ?auto_2608027 ) ( AVAILABLE ?auto_2608026 ) ( IN ?auto_2608025 ?auto_2608028 ) ( ON ?auto_2608024 ?auto_2608023 ) ( not ( = ?auto_2608023 ?auto_2608024 ) ) ( not ( = ?auto_2608023 ?auto_2608025 ) ) ( ON ?auto_2608011 ?auto_2608010 ) ( ON ?auto_2608012 ?auto_2608011 ) ( ON ?auto_2608014 ?auto_2608012 ) ( ON ?auto_2608013 ?auto_2608014 ) ( ON ?auto_2608015 ?auto_2608013 ) ( ON ?auto_2608016 ?auto_2608015 ) ( ON ?auto_2608017 ?auto_2608016 ) ( ON ?auto_2608018 ?auto_2608017 ) ( ON ?auto_2608019 ?auto_2608018 ) ( ON ?auto_2608020 ?auto_2608019 ) ( ON ?auto_2608021 ?auto_2608020 ) ( ON ?auto_2608022 ?auto_2608021 ) ( ON ?auto_2608023 ?auto_2608022 ) ( not ( = ?auto_2608010 ?auto_2608011 ) ) ( not ( = ?auto_2608010 ?auto_2608012 ) ) ( not ( = ?auto_2608010 ?auto_2608014 ) ) ( not ( = ?auto_2608010 ?auto_2608013 ) ) ( not ( = ?auto_2608010 ?auto_2608015 ) ) ( not ( = ?auto_2608010 ?auto_2608016 ) ) ( not ( = ?auto_2608010 ?auto_2608017 ) ) ( not ( = ?auto_2608010 ?auto_2608018 ) ) ( not ( = ?auto_2608010 ?auto_2608019 ) ) ( not ( = ?auto_2608010 ?auto_2608020 ) ) ( not ( = ?auto_2608010 ?auto_2608021 ) ) ( not ( = ?auto_2608010 ?auto_2608022 ) ) ( not ( = ?auto_2608010 ?auto_2608023 ) ) ( not ( = ?auto_2608010 ?auto_2608024 ) ) ( not ( = ?auto_2608010 ?auto_2608025 ) ) ( not ( = ?auto_2608011 ?auto_2608012 ) ) ( not ( = ?auto_2608011 ?auto_2608014 ) ) ( not ( = ?auto_2608011 ?auto_2608013 ) ) ( not ( = ?auto_2608011 ?auto_2608015 ) ) ( not ( = ?auto_2608011 ?auto_2608016 ) ) ( not ( = ?auto_2608011 ?auto_2608017 ) ) ( not ( = ?auto_2608011 ?auto_2608018 ) ) ( not ( = ?auto_2608011 ?auto_2608019 ) ) ( not ( = ?auto_2608011 ?auto_2608020 ) ) ( not ( = ?auto_2608011 ?auto_2608021 ) ) ( not ( = ?auto_2608011 ?auto_2608022 ) ) ( not ( = ?auto_2608011 ?auto_2608023 ) ) ( not ( = ?auto_2608011 ?auto_2608024 ) ) ( not ( = ?auto_2608011 ?auto_2608025 ) ) ( not ( = ?auto_2608012 ?auto_2608014 ) ) ( not ( = ?auto_2608012 ?auto_2608013 ) ) ( not ( = ?auto_2608012 ?auto_2608015 ) ) ( not ( = ?auto_2608012 ?auto_2608016 ) ) ( not ( = ?auto_2608012 ?auto_2608017 ) ) ( not ( = ?auto_2608012 ?auto_2608018 ) ) ( not ( = ?auto_2608012 ?auto_2608019 ) ) ( not ( = ?auto_2608012 ?auto_2608020 ) ) ( not ( = ?auto_2608012 ?auto_2608021 ) ) ( not ( = ?auto_2608012 ?auto_2608022 ) ) ( not ( = ?auto_2608012 ?auto_2608023 ) ) ( not ( = ?auto_2608012 ?auto_2608024 ) ) ( not ( = ?auto_2608012 ?auto_2608025 ) ) ( not ( = ?auto_2608014 ?auto_2608013 ) ) ( not ( = ?auto_2608014 ?auto_2608015 ) ) ( not ( = ?auto_2608014 ?auto_2608016 ) ) ( not ( = ?auto_2608014 ?auto_2608017 ) ) ( not ( = ?auto_2608014 ?auto_2608018 ) ) ( not ( = ?auto_2608014 ?auto_2608019 ) ) ( not ( = ?auto_2608014 ?auto_2608020 ) ) ( not ( = ?auto_2608014 ?auto_2608021 ) ) ( not ( = ?auto_2608014 ?auto_2608022 ) ) ( not ( = ?auto_2608014 ?auto_2608023 ) ) ( not ( = ?auto_2608014 ?auto_2608024 ) ) ( not ( = ?auto_2608014 ?auto_2608025 ) ) ( not ( = ?auto_2608013 ?auto_2608015 ) ) ( not ( = ?auto_2608013 ?auto_2608016 ) ) ( not ( = ?auto_2608013 ?auto_2608017 ) ) ( not ( = ?auto_2608013 ?auto_2608018 ) ) ( not ( = ?auto_2608013 ?auto_2608019 ) ) ( not ( = ?auto_2608013 ?auto_2608020 ) ) ( not ( = ?auto_2608013 ?auto_2608021 ) ) ( not ( = ?auto_2608013 ?auto_2608022 ) ) ( not ( = ?auto_2608013 ?auto_2608023 ) ) ( not ( = ?auto_2608013 ?auto_2608024 ) ) ( not ( = ?auto_2608013 ?auto_2608025 ) ) ( not ( = ?auto_2608015 ?auto_2608016 ) ) ( not ( = ?auto_2608015 ?auto_2608017 ) ) ( not ( = ?auto_2608015 ?auto_2608018 ) ) ( not ( = ?auto_2608015 ?auto_2608019 ) ) ( not ( = ?auto_2608015 ?auto_2608020 ) ) ( not ( = ?auto_2608015 ?auto_2608021 ) ) ( not ( = ?auto_2608015 ?auto_2608022 ) ) ( not ( = ?auto_2608015 ?auto_2608023 ) ) ( not ( = ?auto_2608015 ?auto_2608024 ) ) ( not ( = ?auto_2608015 ?auto_2608025 ) ) ( not ( = ?auto_2608016 ?auto_2608017 ) ) ( not ( = ?auto_2608016 ?auto_2608018 ) ) ( not ( = ?auto_2608016 ?auto_2608019 ) ) ( not ( = ?auto_2608016 ?auto_2608020 ) ) ( not ( = ?auto_2608016 ?auto_2608021 ) ) ( not ( = ?auto_2608016 ?auto_2608022 ) ) ( not ( = ?auto_2608016 ?auto_2608023 ) ) ( not ( = ?auto_2608016 ?auto_2608024 ) ) ( not ( = ?auto_2608016 ?auto_2608025 ) ) ( not ( = ?auto_2608017 ?auto_2608018 ) ) ( not ( = ?auto_2608017 ?auto_2608019 ) ) ( not ( = ?auto_2608017 ?auto_2608020 ) ) ( not ( = ?auto_2608017 ?auto_2608021 ) ) ( not ( = ?auto_2608017 ?auto_2608022 ) ) ( not ( = ?auto_2608017 ?auto_2608023 ) ) ( not ( = ?auto_2608017 ?auto_2608024 ) ) ( not ( = ?auto_2608017 ?auto_2608025 ) ) ( not ( = ?auto_2608018 ?auto_2608019 ) ) ( not ( = ?auto_2608018 ?auto_2608020 ) ) ( not ( = ?auto_2608018 ?auto_2608021 ) ) ( not ( = ?auto_2608018 ?auto_2608022 ) ) ( not ( = ?auto_2608018 ?auto_2608023 ) ) ( not ( = ?auto_2608018 ?auto_2608024 ) ) ( not ( = ?auto_2608018 ?auto_2608025 ) ) ( not ( = ?auto_2608019 ?auto_2608020 ) ) ( not ( = ?auto_2608019 ?auto_2608021 ) ) ( not ( = ?auto_2608019 ?auto_2608022 ) ) ( not ( = ?auto_2608019 ?auto_2608023 ) ) ( not ( = ?auto_2608019 ?auto_2608024 ) ) ( not ( = ?auto_2608019 ?auto_2608025 ) ) ( not ( = ?auto_2608020 ?auto_2608021 ) ) ( not ( = ?auto_2608020 ?auto_2608022 ) ) ( not ( = ?auto_2608020 ?auto_2608023 ) ) ( not ( = ?auto_2608020 ?auto_2608024 ) ) ( not ( = ?auto_2608020 ?auto_2608025 ) ) ( not ( = ?auto_2608021 ?auto_2608022 ) ) ( not ( = ?auto_2608021 ?auto_2608023 ) ) ( not ( = ?auto_2608021 ?auto_2608024 ) ) ( not ( = ?auto_2608021 ?auto_2608025 ) ) ( not ( = ?auto_2608022 ?auto_2608023 ) ) ( not ( = ?auto_2608022 ?auto_2608024 ) ) ( not ( = ?auto_2608022 ?auto_2608025 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2608023 ?auto_2608024 ?auto_2608025 )
      ( MAKE-15CRATE-VERIFY ?auto_2608010 ?auto_2608011 ?auto_2608012 ?auto_2608014 ?auto_2608013 ?auto_2608015 ?auto_2608016 ?auto_2608017 ?auto_2608018 ?auto_2608019 ?auto_2608020 ?auto_2608021 ?auto_2608022 ?auto_2608023 ?auto_2608024 ?auto_2608025 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2608205 - SURFACE
      ?auto_2608206 - SURFACE
      ?auto_2608207 - SURFACE
      ?auto_2608209 - SURFACE
      ?auto_2608208 - SURFACE
      ?auto_2608210 - SURFACE
      ?auto_2608211 - SURFACE
      ?auto_2608212 - SURFACE
      ?auto_2608213 - SURFACE
      ?auto_2608214 - SURFACE
      ?auto_2608215 - SURFACE
      ?auto_2608216 - SURFACE
      ?auto_2608217 - SURFACE
      ?auto_2608218 - SURFACE
      ?auto_2608219 - SURFACE
      ?auto_2608220 - SURFACE
    )
    :vars
    (
      ?auto_2608221 - HOIST
      ?auto_2608224 - PLACE
      ?auto_2608222 - TRUCK
      ?auto_2608223 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2608221 ?auto_2608224 ) ( SURFACE-AT ?auto_2608219 ?auto_2608224 ) ( CLEAR ?auto_2608219 ) ( IS-CRATE ?auto_2608220 ) ( not ( = ?auto_2608219 ?auto_2608220 ) ) ( AVAILABLE ?auto_2608221 ) ( IN ?auto_2608220 ?auto_2608222 ) ( ON ?auto_2608219 ?auto_2608218 ) ( not ( = ?auto_2608218 ?auto_2608219 ) ) ( not ( = ?auto_2608218 ?auto_2608220 ) ) ( TRUCK-AT ?auto_2608222 ?auto_2608223 ) ( not ( = ?auto_2608223 ?auto_2608224 ) ) ( ON ?auto_2608206 ?auto_2608205 ) ( ON ?auto_2608207 ?auto_2608206 ) ( ON ?auto_2608209 ?auto_2608207 ) ( ON ?auto_2608208 ?auto_2608209 ) ( ON ?auto_2608210 ?auto_2608208 ) ( ON ?auto_2608211 ?auto_2608210 ) ( ON ?auto_2608212 ?auto_2608211 ) ( ON ?auto_2608213 ?auto_2608212 ) ( ON ?auto_2608214 ?auto_2608213 ) ( ON ?auto_2608215 ?auto_2608214 ) ( ON ?auto_2608216 ?auto_2608215 ) ( ON ?auto_2608217 ?auto_2608216 ) ( ON ?auto_2608218 ?auto_2608217 ) ( not ( = ?auto_2608205 ?auto_2608206 ) ) ( not ( = ?auto_2608205 ?auto_2608207 ) ) ( not ( = ?auto_2608205 ?auto_2608209 ) ) ( not ( = ?auto_2608205 ?auto_2608208 ) ) ( not ( = ?auto_2608205 ?auto_2608210 ) ) ( not ( = ?auto_2608205 ?auto_2608211 ) ) ( not ( = ?auto_2608205 ?auto_2608212 ) ) ( not ( = ?auto_2608205 ?auto_2608213 ) ) ( not ( = ?auto_2608205 ?auto_2608214 ) ) ( not ( = ?auto_2608205 ?auto_2608215 ) ) ( not ( = ?auto_2608205 ?auto_2608216 ) ) ( not ( = ?auto_2608205 ?auto_2608217 ) ) ( not ( = ?auto_2608205 ?auto_2608218 ) ) ( not ( = ?auto_2608205 ?auto_2608219 ) ) ( not ( = ?auto_2608205 ?auto_2608220 ) ) ( not ( = ?auto_2608206 ?auto_2608207 ) ) ( not ( = ?auto_2608206 ?auto_2608209 ) ) ( not ( = ?auto_2608206 ?auto_2608208 ) ) ( not ( = ?auto_2608206 ?auto_2608210 ) ) ( not ( = ?auto_2608206 ?auto_2608211 ) ) ( not ( = ?auto_2608206 ?auto_2608212 ) ) ( not ( = ?auto_2608206 ?auto_2608213 ) ) ( not ( = ?auto_2608206 ?auto_2608214 ) ) ( not ( = ?auto_2608206 ?auto_2608215 ) ) ( not ( = ?auto_2608206 ?auto_2608216 ) ) ( not ( = ?auto_2608206 ?auto_2608217 ) ) ( not ( = ?auto_2608206 ?auto_2608218 ) ) ( not ( = ?auto_2608206 ?auto_2608219 ) ) ( not ( = ?auto_2608206 ?auto_2608220 ) ) ( not ( = ?auto_2608207 ?auto_2608209 ) ) ( not ( = ?auto_2608207 ?auto_2608208 ) ) ( not ( = ?auto_2608207 ?auto_2608210 ) ) ( not ( = ?auto_2608207 ?auto_2608211 ) ) ( not ( = ?auto_2608207 ?auto_2608212 ) ) ( not ( = ?auto_2608207 ?auto_2608213 ) ) ( not ( = ?auto_2608207 ?auto_2608214 ) ) ( not ( = ?auto_2608207 ?auto_2608215 ) ) ( not ( = ?auto_2608207 ?auto_2608216 ) ) ( not ( = ?auto_2608207 ?auto_2608217 ) ) ( not ( = ?auto_2608207 ?auto_2608218 ) ) ( not ( = ?auto_2608207 ?auto_2608219 ) ) ( not ( = ?auto_2608207 ?auto_2608220 ) ) ( not ( = ?auto_2608209 ?auto_2608208 ) ) ( not ( = ?auto_2608209 ?auto_2608210 ) ) ( not ( = ?auto_2608209 ?auto_2608211 ) ) ( not ( = ?auto_2608209 ?auto_2608212 ) ) ( not ( = ?auto_2608209 ?auto_2608213 ) ) ( not ( = ?auto_2608209 ?auto_2608214 ) ) ( not ( = ?auto_2608209 ?auto_2608215 ) ) ( not ( = ?auto_2608209 ?auto_2608216 ) ) ( not ( = ?auto_2608209 ?auto_2608217 ) ) ( not ( = ?auto_2608209 ?auto_2608218 ) ) ( not ( = ?auto_2608209 ?auto_2608219 ) ) ( not ( = ?auto_2608209 ?auto_2608220 ) ) ( not ( = ?auto_2608208 ?auto_2608210 ) ) ( not ( = ?auto_2608208 ?auto_2608211 ) ) ( not ( = ?auto_2608208 ?auto_2608212 ) ) ( not ( = ?auto_2608208 ?auto_2608213 ) ) ( not ( = ?auto_2608208 ?auto_2608214 ) ) ( not ( = ?auto_2608208 ?auto_2608215 ) ) ( not ( = ?auto_2608208 ?auto_2608216 ) ) ( not ( = ?auto_2608208 ?auto_2608217 ) ) ( not ( = ?auto_2608208 ?auto_2608218 ) ) ( not ( = ?auto_2608208 ?auto_2608219 ) ) ( not ( = ?auto_2608208 ?auto_2608220 ) ) ( not ( = ?auto_2608210 ?auto_2608211 ) ) ( not ( = ?auto_2608210 ?auto_2608212 ) ) ( not ( = ?auto_2608210 ?auto_2608213 ) ) ( not ( = ?auto_2608210 ?auto_2608214 ) ) ( not ( = ?auto_2608210 ?auto_2608215 ) ) ( not ( = ?auto_2608210 ?auto_2608216 ) ) ( not ( = ?auto_2608210 ?auto_2608217 ) ) ( not ( = ?auto_2608210 ?auto_2608218 ) ) ( not ( = ?auto_2608210 ?auto_2608219 ) ) ( not ( = ?auto_2608210 ?auto_2608220 ) ) ( not ( = ?auto_2608211 ?auto_2608212 ) ) ( not ( = ?auto_2608211 ?auto_2608213 ) ) ( not ( = ?auto_2608211 ?auto_2608214 ) ) ( not ( = ?auto_2608211 ?auto_2608215 ) ) ( not ( = ?auto_2608211 ?auto_2608216 ) ) ( not ( = ?auto_2608211 ?auto_2608217 ) ) ( not ( = ?auto_2608211 ?auto_2608218 ) ) ( not ( = ?auto_2608211 ?auto_2608219 ) ) ( not ( = ?auto_2608211 ?auto_2608220 ) ) ( not ( = ?auto_2608212 ?auto_2608213 ) ) ( not ( = ?auto_2608212 ?auto_2608214 ) ) ( not ( = ?auto_2608212 ?auto_2608215 ) ) ( not ( = ?auto_2608212 ?auto_2608216 ) ) ( not ( = ?auto_2608212 ?auto_2608217 ) ) ( not ( = ?auto_2608212 ?auto_2608218 ) ) ( not ( = ?auto_2608212 ?auto_2608219 ) ) ( not ( = ?auto_2608212 ?auto_2608220 ) ) ( not ( = ?auto_2608213 ?auto_2608214 ) ) ( not ( = ?auto_2608213 ?auto_2608215 ) ) ( not ( = ?auto_2608213 ?auto_2608216 ) ) ( not ( = ?auto_2608213 ?auto_2608217 ) ) ( not ( = ?auto_2608213 ?auto_2608218 ) ) ( not ( = ?auto_2608213 ?auto_2608219 ) ) ( not ( = ?auto_2608213 ?auto_2608220 ) ) ( not ( = ?auto_2608214 ?auto_2608215 ) ) ( not ( = ?auto_2608214 ?auto_2608216 ) ) ( not ( = ?auto_2608214 ?auto_2608217 ) ) ( not ( = ?auto_2608214 ?auto_2608218 ) ) ( not ( = ?auto_2608214 ?auto_2608219 ) ) ( not ( = ?auto_2608214 ?auto_2608220 ) ) ( not ( = ?auto_2608215 ?auto_2608216 ) ) ( not ( = ?auto_2608215 ?auto_2608217 ) ) ( not ( = ?auto_2608215 ?auto_2608218 ) ) ( not ( = ?auto_2608215 ?auto_2608219 ) ) ( not ( = ?auto_2608215 ?auto_2608220 ) ) ( not ( = ?auto_2608216 ?auto_2608217 ) ) ( not ( = ?auto_2608216 ?auto_2608218 ) ) ( not ( = ?auto_2608216 ?auto_2608219 ) ) ( not ( = ?auto_2608216 ?auto_2608220 ) ) ( not ( = ?auto_2608217 ?auto_2608218 ) ) ( not ( = ?auto_2608217 ?auto_2608219 ) ) ( not ( = ?auto_2608217 ?auto_2608220 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2608218 ?auto_2608219 ?auto_2608220 )
      ( MAKE-15CRATE-VERIFY ?auto_2608205 ?auto_2608206 ?auto_2608207 ?auto_2608209 ?auto_2608208 ?auto_2608210 ?auto_2608211 ?auto_2608212 ?auto_2608213 ?auto_2608214 ?auto_2608215 ?auto_2608216 ?auto_2608217 ?auto_2608218 ?auto_2608219 ?auto_2608220 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2608415 - SURFACE
      ?auto_2608416 - SURFACE
      ?auto_2608417 - SURFACE
      ?auto_2608419 - SURFACE
      ?auto_2608418 - SURFACE
      ?auto_2608420 - SURFACE
      ?auto_2608421 - SURFACE
      ?auto_2608422 - SURFACE
      ?auto_2608423 - SURFACE
      ?auto_2608424 - SURFACE
      ?auto_2608425 - SURFACE
      ?auto_2608426 - SURFACE
      ?auto_2608427 - SURFACE
      ?auto_2608428 - SURFACE
      ?auto_2608429 - SURFACE
      ?auto_2608430 - SURFACE
    )
    :vars
    (
      ?auto_2608435 - HOIST
      ?auto_2608434 - PLACE
      ?auto_2608431 - TRUCK
      ?auto_2608433 - PLACE
      ?auto_2608432 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2608435 ?auto_2608434 ) ( SURFACE-AT ?auto_2608429 ?auto_2608434 ) ( CLEAR ?auto_2608429 ) ( IS-CRATE ?auto_2608430 ) ( not ( = ?auto_2608429 ?auto_2608430 ) ) ( AVAILABLE ?auto_2608435 ) ( ON ?auto_2608429 ?auto_2608428 ) ( not ( = ?auto_2608428 ?auto_2608429 ) ) ( not ( = ?auto_2608428 ?auto_2608430 ) ) ( TRUCK-AT ?auto_2608431 ?auto_2608433 ) ( not ( = ?auto_2608433 ?auto_2608434 ) ) ( HOIST-AT ?auto_2608432 ?auto_2608433 ) ( LIFTING ?auto_2608432 ?auto_2608430 ) ( not ( = ?auto_2608435 ?auto_2608432 ) ) ( ON ?auto_2608416 ?auto_2608415 ) ( ON ?auto_2608417 ?auto_2608416 ) ( ON ?auto_2608419 ?auto_2608417 ) ( ON ?auto_2608418 ?auto_2608419 ) ( ON ?auto_2608420 ?auto_2608418 ) ( ON ?auto_2608421 ?auto_2608420 ) ( ON ?auto_2608422 ?auto_2608421 ) ( ON ?auto_2608423 ?auto_2608422 ) ( ON ?auto_2608424 ?auto_2608423 ) ( ON ?auto_2608425 ?auto_2608424 ) ( ON ?auto_2608426 ?auto_2608425 ) ( ON ?auto_2608427 ?auto_2608426 ) ( ON ?auto_2608428 ?auto_2608427 ) ( not ( = ?auto_2608415 ?auto_2608416 ) ) ( not ( = ?auto_2608415 ?auto_2608417 ) ) ( not ( = ?auto_2608415 ?auto_2608419 ) ) ( not ( = ?auto_2608415 ?auto_2608418 ) ) ( not ( = ?auto_2608415 ?auto_2608420 ) ) ( not ( = ?auto_2608415 ?auto_2608421 ) ) ( not ( = ?auto_2608415 ?auto_2608422 ) ) ( not ( = ?auto_2608415 ?auto_2608423 ) ) ( not ( = ?auto_2608415 ?auto_2608424 ) ) ( not ( = ?auto_2608415 ?auto_2608425 ) ) ( not ( = ?auto_2608415 ?auto_2608426 ) ) ( not ( = ?auto_2608415 ?auto_2608427 ) ) ( not ( = ?auto_2608415 ?auto_2608428 ) ) ( not ( = ?auto_2608415 ?auto_2608429 ) ) ( not ( = ?auto_2608415 ?auto_2608430 ) ) ( not ( = ?auto_2608416 ?auto_2608417 ) ) ( not ( = ?auto_2608416 ?auto_2608419 ) ) ( not ( = ?auto_2608416 ?auto_2608418 ) ) ( not ( = ?auto_2608416 ?auto_2608420 ) ) ( not ( = ?auto_2608416 ?auto_2608421 ) ) ( not ( = ?auto_2608416 ?auto_2608422 ) ) ( not ( = ?auto_2608416 ?auto_2608423 ) ) ( not ( = ?auto_2608416 ?auto_2608424 ) ) ( not ( = ?auto_2608416 ?auto_2608425 ) ) ( not ( = ?auto_2608416 ?auto_2608426 ) ) ( not ( = ?auto_2608416 ?auto_2608427 ) ) ( not ( = ?auto_2608416 ?auto_2608428 ) ) ( not ( = ?auto_2608416 ?auto_2608429 ) ) ( not ( = ?auto_2608416 ?auto_2608430 ) ) ( not ( = ?auto_2608417 ?auto_2608419 ) ) ( not ( = ?auto_2608417 ?auto_2608418 ) ) ( not ( = ?auto_2608417 ?auto_2608420 ) ) ( not ( = ?auto_2608417 ?auto_2608421 ) ) ( not ( = ?auto_2608417 ?auto_2608422 ) ) ( not ( = ?auto_2608417 ?auto_2608423 ) ) ( not ( = ?auto_2608417 ?auto_2608424 ) ) ( not ( = ?auto_2608417 ?auto_2608425 ) ) ( not ( = ?auto_2608417 ?auto_2608426 ) ) ( not ( = ?auto_2608417 ?auto_2608427 ) ) ( not ( = ?auto_2608417 ?auto_2608428 ) ) ( not ( = ?auto_2608417 ?auto_2608429 ) ) ( not ( = ?auto_2608417 ?auto_2608430 ) ) ( not ( = ?auto_2608419 ?auto_2608418 ) ) ( not ( = ?auto_2608419 ?auto_2608420 ) ) ( not ( = ?auto_2608419 ?auto_2608421 ) ) ( not ( = ?auto_2608419 ?auto_2608422 ) ) ( not ( = ?auto_2608419 ?auto_2608423 ) ) ( not ( = ?auto_2608419 ?auto_2608424 ) ) ( not ( = ?auto_2608419 ?auto_2608425 ) ) ( not ( = ?auto_2608419 ?auto_2608426 ) ) ( not ( = ?auto_2608419 ?auto_2608427 ) ) ( not ( = ?auto_2608419 ?auto_2608428 ) ) ( not ( = ?auto_2608419 ?auto_2608429 ) ) ( not ( = ?auto_2608419 ?auto_2608430 ) ) ( not ( = ?auto_2608418 ?auto_2608420 ) ) ( not ( = ?auto_2608418 ?auto_2608421 ) ) ( not ( = ?auto_2608418 ?auto_2608422 ) ) ( not ( = ?auto_2608418 ?auto_2608423 ) ) ( not ( = ?auto_2608418 ?auto_2608424 ) ) ( not ( = ?auto_2608418 ?auto_2608425 ) ) ( not ( = ?auto_2608418 ?auto_2608426 ) ) ( not ( = ?auto_2608418 ?auto_2608427 ) ) ( not ( = ?auto_2608418 ?auto_2608428 ) ) ( not ( = ?auto_2608418 ?auto_2608429 ) ) ( not ( = ?auto_2608418 ?auto_2608430 ) ) ( not ( = ?auto_2608420 ?auto_2608421 ) ) ( not ( = ?auto_2608420 ?auto_2608422 ) ) ( not ( = ?auto_2608420 ?auto_2608423 ) ) ( not ( = ?auto_2608420 ?auto_2608424 ) ) ( not ( = ?auto_2608420 ?auto_2608425 ) ) ( not ( = ?auto_2608420 ?auto_2608426 ) ) ( not ( = ?auto_2608420 ?auto_2608427 ) ) ( not ( = ?auto_2608420 ?auto_2608428 ) ) ( not ( = ?auto_2608420 ?auto_2608429 ) ) ( not ( = ?auto_2608420 ?auto_2608430 ) ) ( not ( = ?auto_2608421 ?auto_2608422 ) ) ( not ( = ?auto_2608421 ?auto_2608423 ) ) ( not ( = ?auto_2608421 ?auto_2608424 ) ) ( not ( = ?auto_2608421 ?auto_2608425 ) ) ( not ( = ?auto_2608421 ?auto_2608426 ) ) ( not ( = ?auto_2608421 ?auto_2608427 ) ) ( not ( = ?auto_2608421 ?auto_2608428 ) ) ( not ( = ?auto_2608421 ?auto_2608429 ) ) ( not ( = ?auto_2608421 ?auto_2608430 ) ) ( not ( = ?auto_2608422 ?auto_2608423 ) ) ( not ( = ?auto_2608422 ?auto_2608424 ) ) ( not ( = ?auto_2608422 ?auto_2608425 ) ) ( not ( = ?auto_2608422 ?auto_2608426 ) ) ( not ( = ?auto_2608422 ?auto_2608427 ) ) ( not ( = ?auto_2608422 ?auto_2608428 ) ) ( not ( = ?auto_2608422 ?auto_2608429 ) ) ( not ( = ?auto_2608422 ?auto_2608430 ) ) ( not ( = ?auto_2608423 ?auto_2608424 ) ) ( not ( = ?auto_2608423 ?auto_2608425 ) ) ( not ( = ?auto_2608423 ?auto_2608426 ) ) ( not ( = ?auto_2608423 ?auto_2608427 ) ) ( not ( = ?auto_2608423 ?auto_2608428 ) ) ( not ( = ?auto_2608423 ?auto_2608429 ) ) ( not ( = ?auto_2608423 ?auto_2608430 ) ) ( not ( = ?auto_2608424 ?auto_2608425 ) ) ( not ( = ?auto_2608424 ?auto_2608426 ) ) ( not ( = ?auto_2608424 ?auto_2608427 ) ) ( not ( = ?auto_2608424 ?auto_2608428 ) ) ( not ( = ?auto_2608424 ?auto_2608429 ) ) ( not ( = ?auto_2608424 ?auto_2608430 ) ) ( not ( = ?auto_2608425 ?auto_2608426 ) ) ( not ( = ?auto_2608425 ?auto_2608427 ) ) ( not ( = ?auto_2608425 ?auto_2608428 ) ) ( not ( = ?auto_2608425 ?auto_2608429 ) ) ( not ( = ?auto_2608425 ?auto_2608430 ) ) ( not ( = ?auto_2608426 ?auto_2608427 ) ) ( not ( = ?auto_2608426 ?auto_2608428 ) ) ( not ( = ?auto_2608426 ?auto_2608429 ) ) ( not ( = ?auto_2608426 ?auto_2608430 ) ) ( not ( = ?auto_2608427 ?auto_2608428 ) ) ( not ( = ?auto_2608427 ?auto_2608429 ) ) ( not ( = ?auto_2608427 ?auto_2608430 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2608428 ?auto_2608429 ?auto_2608430 )
      ( MAKE-15CRATE-VERIFY ?auto_2608415 ?auto_2608416 ?auto_2608417 ?auto_2608419 ?auto_2608418 ?auto_2608420 ?auto_2608421 ?auto_2608422 ?auto_2608423 ?auto_2608424 ?auto_2608425 ?auto_2608426 ?auto_2608427 ?auto_2608428 ?auto_2608429 ?auto_2608430 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2608640 - SURFACE
      ?auto_2608641 - SURFACE
      ?auto_2608642 - SURFACE
      ?auto_2608644 - SURFACE
      ?auto_2608643 - SURFACE
      ?auto_2608645 - SURFACE
      ?auto_2608646 - SURFACE
      ?auto_2608647 - SURFACE
      ?auto_2608648 - SURFACE
      ?auto_2608649 - SURFACE
      ?auto_2608650 - SURFACE
      ?auto_2608651 - SURFACE
      ?auto_2608652 - SURFACE
      ?auto_2608653 - SURFACE
      ?auto_2608654 - SURFACE
      ?auto_2608655 - SURFACE
    )
    :vars
    (
      ?auto_2608657 - HOIST
      ?auto_2608659 - PLACE
      ?auto_2608658 - TRUCK
      ?auto_2608660 - PLACE
      ?auto_2608656 - HOIST
      ?auto_2608661 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2608657 ?auto_2608659 ) ( SURFACE-AT ?auto_2608654 ?auto_2608659 ) ( CLEAR ?auto_2608654 ) ( IS-CRATE ?auto_2608655 ) ( not ( = ?auto_2608654 ?auto_2608655 ) ) ( AVAILABLE ?auto_2608657 ) ( ON ?auto_2608654 ?auto_2608653 ) ( not ( = ?auto_2608653 ?auto_2608654 ) ) ( not ( = ?auto_2608653 ?auto_2608655 ) ) ( TRUCK-AT ?auto_2608658 ?auto_2608660 ) ( not ( = ?auto_2608660 ?auto_2608659 ) ) ( HOIST-AT ?auto_2608656 ?auto_2608660 ) ( not ( = ?auto_2608657 ?auto_2608656 ) ) ( AVAILABLE ?auto_2608656 ) ( SURFACE-AT ?auto_2608655 ?auto_2608660 ) ( ON ?auto_2608655 ?auto_2608661 ) ( CLEAR ?auto_2608655 ) ( not ( = ?auto_2608654 ?auto_2608661 ) ) ( not ( = ?auto_2608655 ?auto_2608661 ) ) ( not ( = ?auto_2608653 ?auto_2608661 ) ) ( ON ?auto_2608641 ?auto_2608640 ) ( ON ?auto_2608642 ?auto_2608641 ) ( ON ?auto_2608644 ?auto_2608642 ) ( ON ?auto_2608643 ?auto_2608644 ) ( ON ?auto_2608645 ?auto_2608643 ) ( ON ?auto_2608646 ?auto_2608645 ) ( ON ?auto_2608647 ?auto_2608646 ) ( ON ?auto_2608648 ?auto_2608647 ) ( ON ?auto_2608649 ?auto_2608648 ) ( ON ?auto_2608650 ?auto_2608649 ) ( ON ?auto_2608651 ?auto_2608650 ) ( ON ?auto_2608652 ?auto_2608651 ) ( ON ?auto_2608653 ?auto_2608652 ) ( not ( = ?auto_2608640 ?auto_2608641 ) ) ( not ( = ?auto_2608640 ?auto_2608642 ) ) ( not ( = ?auto_2608640 ?auto_2608644 ) ) ( not ( = ?auto_2608640 ?auto_2608643 ) ) ( not ( = ?auto_2608640 ?auto_2608645 ) ) ( not ( = ?auto_2608640 ?auto_2608646 ) ) ( not ( = ?auto_2608640 ?auto_2608647 ) ) ( not ( = ?auto_2608640 ?auto_2608648 ) ) ( not ( = ?auto_2608640 ?auto_2608649 ) ) ( not ( = ?auto_2608640 ?auto_2608650 ) ) ( not ( = ?auto_2608640 ?auto_2608651 ) ) ( not ( = ?auto_2608640 ?auto_2608652 ) ) ( not ( = ?auto_2608640 ?auto_2608653 ) ) ( not ( = ?auto_2608640 ?auto_2608654 ) ) ( not ( = ?auto_2608640 ?auto_2608655 ) ) ( not ( = ?auto_2608640 ?auto_2608661 ) ) ( not ( = ?auto_2608641 ?auto_2608642 ) ) ( not ( = ?auto_2608641 ?auto_2608644 ) ) ( not ( = ?auto_2608641 ?auto_2608643 ) ) ( not ( = ?auto_2608641 ?auto_2608645 ) ) ( not ( = ?auto_2608641 ?auto_2608646 ) ) ( not ( = ?auto_2608641 ?auto_2608647 ) ) ( not ( = ?auto_2608641 ?auto_2608648 ) ) ( not ( = ?auto_2608641 ?auto_2608649 ) ) ( not ( = ?auto_2608641 ?auto_2608650 ) ) ( not ( = ?auto_2608641 ?auto_2608651 ) ) ( not ( = ?auto_2608641 ?auto_2608652 ) ) ( not ( = ?auto_2608641 ?auto_2608653 ) ) ( not ( = ?auto_2608641 ?auto_2608654 ) ) ( not ( = ?auto_2608641 ?auto_2608655 ) ) ( not ( = ?auto_2608641 ?auto_2608661 ) ) ( not ( = ?auto_2608642 ?auto_2608644 ) ) ( not ( = ?auto_2608642 ?auto_2608643 ) ) ( not ( = ?auto_2608642 ?auto_2608645 ) ) ( not ( = ?auto_2608642 ?auto_2608646 ) ) ( not ( = ?auto_2608642 ?auto_2608647 ) ) ( not ( = ?auto_2608642 ?auto_2608648 ) ) ( not ( = ?auto_2608642 ?auto_2608649 ) ) ( not ( = ?auto_2608642 ?auto_2608650 ) ) ( not ( = ?auto_2608642 ?auto_2608651 ) ) ( not ( = ?auto_2608642 ?auto_2608652 ) ) ( not ( = ?auto_2608642 ?auto_2608653 ) ) ( not ( = ?auto_2608642 ?auto_2608654 ) ) ( not ( = ?auto_2608642 ?auto_2608655 ) ) ( not ( = ?auto_2608642 ?auto_2608661 ) ) ( not ( = ?auto_2608644 ?auto_2608643 ) ) ( not ( = ?auto_2608644 ?auto_2608645 ) ) ( not ( = ?auto_2608644 ?auto_2608646 ) ) ( not ( = ?auto_2608644 ?auto_2608647 ) ) ( not ( = ?auto_2608644 ?auto_2608648 ) ) ( not ( = ?auto_2608644 ?auto_2608649 ) ) ( not ( = ?auto_2608644 ?auto_2608650 ) ) ( not ( = ?auto_2608644 ?auto_2608651 ) ) ( not ( = ?auto_2608644 ?auto_2608652 ) ) ( not ( = ?auto_2608644 ?auto_2608653 ) ) ( not ( = ?auto_2608644 ?auto_2608654 ) ) ( not ( = ?auto_2608644 ?auto_2608655 ) ) ( not ( = ?auto_2608644 ?auto_2608661 ) ) ( not ( = ?auto_2608643 ?auto_2608645 ) ) ( not ( = ?auto_2608643 ?auto_2608646 ) ) ( not ( = ?auto_2608643 ?auto_2608647 ) ) ( not ( = ?auto_2608643 ?auto_2608648 ) ) ( not ( = ?auto_2608643 ?auto_2608649 ) ) ( not ( = ?auto_2608643 ?auto_2608650 ) ) ( not ( = ?auto_2608643 ?auto_2608651 ) ) ( not ( = ?auto_2608643 ?auto_2608652 ) ) ( not ( = ?auto_2608643 ?auto_2608653 ) ) ( not ( = ?auto_2608643 ?auto_2608654 ) ) ( not ( = ?auto_2608643 ?auto_2608655 ) ) ( not ( = ?auto_2608643 ?auto_2608661 ) ) ( not ( = ?auto_2608645 ?auto_2608646 ) ) ( not ( = ?auto_2608645 ?auto_2608647 ) ) ( not ( = ?auto_2608645 ?auto_2608648 ) ) ( not ( = ?auto_2608645 ?auto_2608649 ) ) ( not ( = ?auto_2608645 ?auto_2608650 ) ) ( not ( = ?auto_2608645 ?auto_2608651 ) ) ( not ( = ?auto_2608645 ?auto_2608652 ) ) ( not ( = ?auto_2608645 ?auto_2608653 ) ) ( not ( = ?auto_2608645 ?auto_2608654 ) ) ( not ( = ?auto_2608645 ?auto_2608655 ) ) ( not ( = ?auto_2608645 ?auto_2608661 ) ) ( not ( = ?auto_2608646 ?auto_2608647 ) ) ( not ( = ?auto_2608646 ?auto_2608648 ) ) ( not ( = ?auto_2608646 ?auto_2608649 ) ) ( not ( = ?auto_2608646 ?auto_2608650 ) ) ( not ( = ?auto_2608646 ?auto_2608651 ) ) ( not ( = ?auto_2608646 ?auto_2608652 ) ) ( not ( = ?auto_2608646 ?auto_2608653 ) ) ( not ( = ?auto_2608646 ?auto_2608654 ) ) ( not ( = ?auto_2608646 ?auto_2608655 ) ) ( not ( = ?auto_2608646 ?auto_2608661 ) ) ( not ( = ?auto_2608647 ?auto_2608648 ) ) ( not ( = ?auto_2608647 ?auto_2608649 ) ) ( not ( = ?auto_2608647 ?auto_2608650 ) ) ( not ( = ?auto_2608647 ?auto_2608651 ) ) ( not ( = ?auto_2608647 ?auto_2608652 ) ) ( not ( = ?auto_2608647 ?auto_2608653 ) ) ( not ( = ?auto_2608647 ?auto_2608654 ) ) ( not ( = ?auto_2608647 ?auto_2608655 ) ) ( not ( = ?auto_2608647 ?auto_2608661 ) ) ( not ( = ?auto_2608648 ?auto_2608649 ) ) ( not ( = ?auto_2608648 ?auto_2608650 ) ) ( not ( = ?auto_2608648 ?auto_2608651 ) ) ( not ( = ?auto_2608648 ?auto_2608652 ) ) ( not ( = ?auto_2608648 ?auto_2608653 ) ) ( not ( = ?auto_2608648 ?auto_2608654 ) ) ( not ( = ?auto_2608648 ?auto_2608655 ) ) ( not ( = ?auto_2608648 ?auto_2608661 ) ) ( not ( = ?auto_2608649 ?auto_2608650 ) ) ( not ( = ?auto_2608649 ?auto_2608651 ) ) ( not ( = ?auto_2608649 ?auto_2608652 ) ) ( not ( = ?auto_2608649 ?auto_2608653 ) ) ( not ( = ?auto_2608649 ?auto_2608654 ) ) ( not ( = ?auto_2608649 ?auto_2608655 ) ) ( not ( = ?auto_2608649 ?auto_2608661 ) ) ( not ( = ?auto_2608650 ?auto_2608651 ) ) ( not ( = ?auto_2608650 ?auto_2608652 ) ) ( not ( = ?auto_2608650 ?auto_2608653 ) ) ( not ( = ?auto_2608650 ?auto_2608654 ) ) ( not ( = ?auto_2608650 ?auto_2608655 ) ) ( not ( = ?auto_2608650 ?auto_2608661 ) ) ( not ( = ?auto_2608651 ?auto_2608652 ) ) ( not ( = ?auto_2608651 ?auto_2608653 ) ) ( not ( = ?auto_2608651 ?auto_2608654 ) ) ( not ( = ?auto_2608651 ?auto_2608655 ) ) ( not ( = ?auto_2608651 ?auto_2608661 ) ) ( not ( = ?auto_2608652 ?auto_2608653 ) ) ( not ( = ?auto_2608652 ?auto_2608654 ) ) ( not ( = ?auto_2608652 ?auto_2608655 ) ) ( not ( = ?auto_2608652 ?auto_2608661 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2608653 ?auto_2608654 ?auto_2608655 )
      ( MAKE-15CRATE-VERIFY ?auto_2608640 ?auto_2608641 ?auto_2608642 ?auto_2608644 ?auto_2608643 ?auto_2608645 ?auto_2608646 ?auto_2608647 ?auto_2608648 ?auto_2608649 ?auto_2608650 ?auto_2608651 ?auto_2608652 ?auto_2608653 ?auto_2608654 ?auto_2608655 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2608866 - SURFACE
      ?auto_2608867 - SURFACE
      ?auto_2608868 - SURFACE
      ?auto_2608870 - SURFACE
      ?auto_2608869 - SURFACE
      ?auto_2608871 - SURFACE
      ?auto_2608872 - SURFACE
      ?auto_2608873 - SURFACE
      ?auto_2608874 - SURFACE
      ?auto_2608875 - SURFACE
      ?auto_2608876 - SURFACE
      ?auto_2608877 - SURFACE
      ?auto_2608878 - SURFACE
      ?auto_2608879 - SURFACE
      ?auto_2608880 - SURFACE
      ?auto_2608881 - SURFACE
    )
    :vars
    (
      ?auto_2608886 - HOIST
      ?auto_2608883 - PLACE
      ?auto_2608882 - PLACE
      ?auto_2608884 - HOIST
      ?auto_2608885 - SURFACE
      ?auto_2608887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2608886 ?auto_2608883 ) ( SURFACE-AT ?auto_2608880 ?auto_2608883 ) ( CLEAR ?auto_2608880 ) ( IS-CRATE ?auto_2608881 ) ( not ( = ?auto_2608880 ?auto_2608881 ) ) ( AVAILABLE ?auto_2608886 ) ( ON ?auto_2608880 ?auto_2608879 ) ( not ( = ?auto_2608879 ?auto_2608880 ) ) ( not ( = ?auto_2608879 ?auto_2608881 ) ) ( not ( = ?auto_2608882 ?auto_2608883 ) ) ( HOIST-AT ?auto_2608884 ?auto_2608882 ) ( not ( = ?auto_2608886 ?auto_2608884 ) ) ( AVAILABLE ?auto_2608884 ) ( SURFACE-AT ?auto_2608881 ?auto_2608882 ) ( ON ?auto_2608881 ?auto_2608885 ) ( CLEAR ?auto_2608881 ) ( not ( = ?auto_2608880 ?auto_2608885 ) ) ( not ( = ?auto_2608881 ?auto_2608885 ) ) ( not ( = ?auto_2608879 ?auto_2608885 ) ) ( TRUCK-AT ?auto_2608887 ?auto_2608883 ) ( ON ?auto_2608867 ?auto_2608866 ) ( ON ?auto_2608868 ?auto_2608867 ) ( ON ?auto_2608870 ?auto_2608868 ) ( ON ?auto_2608869 ?auto_2608870 ) ( ON ?auto_2608871 ?auto_2608869 ) ( ON ?auto_2608872 ?auto_2608871 ) ( ON ?auto_2608873 ?auto_2608872 ) ( ON ?auto_2608874 ?auto_2608873 ) ( ON ?auto_2608875 ?auto_2608874 ) ( ON ?auto_2608876 ?auto_2608875 ) ( ON ?auto_2608877 ?auto_2608876 ) ( ON ?auto_2608878 ?auto_2608877 ) ( ON ?auto_2608879 ?auto_2608878 ) ( not ( = ?auto_2608866 ?auto_2608867 ) ) ( not ( = ?auto_2608866 ?auto_2608868 ) ) ( not ( = ?auto_2608866 ?auto_2608870 ) ) ( not ( = ?auto_2608866 ?auto_2608869 ) ) ( not ( = ?auto_2608866 ?auto_2608871 ) ) ( not ( = ?auto_2608866 ?auto_2608872 ) ) ( not ( = ?auto_2608866 ?auto_2608873 ) ) ( not ( = ?auto_2608866 ?auto_2608874 ) ) ( not ( = ?auto_2608866 ?auto_2608875 ) ) ( not ( = ?auto_2608866 ?auto_2608876 ) ) ( not ( = ?auto_2608866 ?auto_2608877 ) ) ( not ( = ?auto_2608866 ?auto_2608878 ) ) ( not ( = ?auto_2608866 ?auto_2608879 ) ) ( not ( = ?auto_2608866 ?auto_2608880 ) ) ( not ( = ?auto_2608866 ?auto_2608881 ) ) ( not ( = ?auto_2608866 ?auto_2608885 ) ) ( not ( = ?auto_2608867 ?auto_2608868 ) ) ( not ( = ?auto_2608867 ?auto_2608870 ) ) ( not ( = ?auto_2608867 ?auto_2608869 ) ) ( not ( = ?auto_2608867 ?auto_2608871 ) ) ( not ( = ?auto_2608867 ?auto_2608872 ) ) ( not ( = ?auto_2608867 ?auto_2608873 ) ) ( not ( = ?auto_2608867 ?auto_2608874 ) ) ( not ( = ?auto_2608867 ?auto_2608875 ) ) ( not ( = ?auto_2608867 ?auto_2608876 ) ) ( not ( = ?auto_2608867 ?auto_2608877 ) ) ( not ( = ?auto_2608867 ?auto_2608878 ) ) ( not ( = ?auto_2608867 ?auto_2608879 ) ) ( not ( = ?auto_2608867 ?auto_2608880 ) ) ( not ( = ?auto_2608867 ?auto_2608881 ) ) ( not ( = ?auto_2608867 ?auto_2608885 ) ) ( not ( = ?auto_2608868 ?auto_2608870 ) ) ( not ( = ?auto_2608868 ?auto_2608869 ) ) ( not ( = ?auto_2608868 ?auto_2608871 ) ) ( not ( = ?auto_2608868 ?auto_2608872 ) ) ( not ( = ?auto_2608868 ?auto_2608873 ) ) ( not ( = ?auto_2608868 ?auto_2608874 ) ) ( not ( = ?auto_2608868 ?auto_2608875 ) ) ( not ( = ?auto_2608868 ?auto_2608876 ) ) ( not ( = ?auto_2608868 ?auto_2608877 ) ) ( not ( = ?auto_2608868 ?auto_2608878 ) ) ( not ( = ?auto_2608868 ?auto_2608879 ) ) ( not ( = ?auto_2608868 ?auto_2608880 ) ) ( not ( = ?auto_2608868 ?auto_2608881 ) ) ( not ( = ?auto_2608868 ?auto_2608885 ) ) ( not ( = ?auto_2608870 ?auto_2608869 ) ) ( not ( = ?auto_2608870 ?auto_2608871 ) ) ( not ( = ?auto_2608870 ?auto_2608872 ) ) ( not ( = ?auto_2608870 ?auto_2608873 ) ) ( not ( = ?auto_2608870 ?auto_2608874 ) ) ( not ( = ?auto_2608870 ?auto_2608875 ) ) ( not ( = ?auto_2608870 ?auto_2608876 ) ) ( not ( = ?auto_2608870 ?auto_2608877 ) ) ( not ( = ?auto_2608870 ?auto_2608878 ) ) ( not ( = ?auto_2608870 ?auto_2608879 ) ) ( not ( = ?auto_2608870 ?auto_2608880 ) ) ( not ( = ?auto_2608870 ?auto_2608881 ) ) ( not ( = ?auto_2608870 ?auto_2608885 ) ) ( not ( = ?auto_2608869 ?auto_2608871 ) ) ( not ( = ?auto_2608869 ?auto_2608872 ) ) ( not ( = ?auto_2608869 ?auto_2608873 ) ) ( not ( = ?auto_2608869 ?auto_2608874 ) ) ( not ( = ?auto_2608869 ?auto_2608875 ) ) ( not ( = ?auto_2608869 ?auto_2608876 ) ) ( not ( = ?auto_2608869 ?auto_2608877 ) ) ( not ( = ?auto_2608869 ?auto_2608878 ) ) ( not ( = ?auto_2608869 ?auto_2608879 ) ) ( not ( = ?auto_2608869 ?auto_2608880 ) ) ( not ( = ?auto_2608869 ?auto_2608881 ) ) ( not ( = ?auto_2608869 ?auto_2608885 ) ) ( not ( = ?auto_2608871 ?auto_2608872 ) ) ( not ( = ?auto_2608871 ?auto_2608873 ) ) ( not ( = ?auto_2608871 ?auto_2608874 ) ) ( not ( = ?auto_2608871 ?auto_2608875 ) ) ( not ( = ?auto_2608871 ?auto_2608876 ) ) ( not ( = ?auto_2608871 ?auto_2608877 ) ) ( not ( = ?auto_2608871 ?auto_2608878 ) ) ( not ( = ?auto_2608871 ?auto_2608879 ) ) ( not ( = ?auto_2608871 ?auto_2608880 ) ) ( not ( = ?auto_2608871 ?auto_2608881 ) ) ( not ( = ?auto_2608871 ?auto_2608885 ) ) ( not ( = ?auto_2608872 ?auto_2608873 ) ) ( not ( = ?auto_2608872 ?auto_2608874 ) ) ( not ( = ?auto_2608872 ?auto_2608875 ) ) ( not ( = ?auto_2608872 ?auto_2608876 ) ) ( not ( = ?auto_2608872 ?auto_2608877 ) ) ( not ( = ?auto_2608872 ?auto_2608878 ) ) ( not ( = ?auto_2608872 ?auto_2608879 ) ) ( not ( = ?auto_2608872 ?auto_2608880 ) ) ( not ( = ?auto_2608872 ?auto_2608881 ) ) ( not ( = ?auto_2608872 ?auto_2608885 ) ) ( not ( = ?auto_2608873 ?auto_2608874 ) ) ( not ( = ?auto_2608873 ?auto_2608875 ) ) ( not ( = ?auto_2608873 ?auto_2608876 ) ) ( not ( = ?auto_2608873 ?auto_2608877 ) ) ( not ( = ?auto_2608873 ?auto_2608878 ) ) ( not ( = ?auto_2608873 ?auto_2608879 ) ) ( not ( = ?auto_2608873 ?auto_2608880 ) ) ( not ( = ?auto_2608873 ?auto_2608881 ) ) ( not ( = ?auto_2608873 ?auto_2608885 ) ) ( not ( = ?auto_2608874 ?auto_2608875 ) ) ( not ( = ?auto_2608874 ?auto_2608876 ) ) ( not ( = ?auto_2608874 ?auto_2608877 ) ) ( not ( = ?auto_2608874 ?auto_2608878 ) ) ( not ( = ?auto_2608874 ?auto_2608879 ) ) ( not ( = ?auto_2608874 ?auto_2608880 ) ) ( not ( = ?auto_2608874 ?auto_2608881 ) ) ( not ( = ?auto_2608874 ?auto_2608885 ) ) ( not ( = ?auto_2608875 ?auto_2608876 ) ) ( not ( = ?auto_2608875 ?auto_2608877 ) ) ( not ( = ?auto_2608875 ?auto_2608878 ) ) ( not ( = ?auto_2608875 ?auto_2608879 ) ) ( not ( = ?auto_2608875 ?auto_2608880 ) ) ( not ( = ?auto_2608875 ?auto_2608881 ) ) ( not ( = ?auto_2608875 ?auto_2608885 ) ) ( not ( = ?auto_2608876 ?auto_2608877 ) ) ( not ( = ?auto_2608876 ?auto_2608878 ) ) ( not ( = ?auto_2608876 ?auto_2608879 ) ) ( not ( = ?auto_2608876 ?auto_2608880 ) ) ( not ( = ?auto_2608876 ?auto_2608881 ) ) ( not ( = ?auto_2608876 ?auto_2608885 ) ) ( not ( = ?auto_2608877 ?auto_2608878 ) ) ( not ( = ?auto_2608877 ?auto_2608879 ) ) ( not ( = ?auto_2608877 ?auto_2608880 ) ) ( not ( = ?auto_2608877 ?auto_2608881 ) ) ( not ( = ?auto_2608877 ?auto_2608885 ) ) ( not ( = ?auto_2608878 ?auto_2608879 ) ) ( not ( = ?auto_2608878 ?auto_2608880 ) ) ( not ( = ?auto_2608878 ?auto_2608881 ) ) ( not ( = ?auto_2608878 ?auto_2608885 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2608879 ?auto_2608880 ?auto_2608881 )
      ( MAKE-15CRATE-VERIFY ?auto_2608866 ?auto_2608867 ?auto_2608868 ?auto_2608870 ?auto_2608869 ?auto_2608871 ?auto_2608872 ?auto_2608873 ?auto_2608874 ?auto_2608875 ?auto_2608876 ?auto_2608877 ?auto_2608878 ?auto_2608879 ?auto_2608880 ?auto_2608881 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2609092 - SURFACE
      ?auto_2609093 - SURFACE
      ?auto_2609094 - SURFACE
      ?auto_2609096 - SURFACE
      ?auto_2609095 - SURFACE
      ?auto_2609097 - SURFACE
      ?auto_2609098 - SURFACE
      ?auto_2609099 - SURFACE
      ?auto_2609100 - SURFACE
      ?auto_2609101 - SURFACE
      ?auto_2609102 - SURFACE
      ?auto_2609103 - SURFACE
      ?auto_2609104 - SURFACE
      ?auto_2609105 - SURFACE
      ?auto_2609106 - SURFACE
      ?auto_2609107 - SURFACE
    )
    :vars
    (
      ?auto_2609109 - HOIST
      ?auto_2609111 - PLACE
      ?auto_2609113 - PLACE
      ?auto_2609108 - HOIST
      ?auto_2609112 - SURFACE
      ?auto_2609110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2609109 ?auto_2609111 ) ( IS-CRATE ?auto_2609107 ) ( not ( = ?auto_2609106 ?auto_2609107 ) ) ( not ( = ?auto_2609105 ?auto_2609106 ) ) ( not ( = ?auto_2609105 ?auto_2609107 ) ) ( not ( = ?auto_2609113 ?auto_2609111 ) ) ( HOIST-AT ?auto_2609108 ?auto_2609113 ) ( not ( = ?auto_2609109 ?auto_2609108 ) ) ( AVAILABLE ?auto_2609108 ) ( SURFACE-AT ?auto_2609107 ?auto_2609113 ) ( ON ?auto_2609107 ?auto_2609112 ) ( CLEAR ?auto_2609107 ) ( not ( = ?auto_2609106 ?auto_2609112 ) ) ( not ( = ?auto_2609107 ?auto_2609112 ) ) ( not ( = ?auto_2609105 ?auto_2609112 ) ) ( TRUCK-AT ?auto_2609110 ?auto_2609111 ) ( SURFACE-AT ?auto_2609105 ?auto_2609111 ) ( CLEAR ?auto_2609105 ) ( LIFTING ?auto_2609109 ?auto_2609106 ) ( IS-CRATE ?auto_2609106 ) ( ON ?auto_2609093 ?auto_2609092 ) ( ON ?auto_2609094 ?auto_2609093 ) ( ON ?auto_2609096 ?auto_2609094 ) ( ON ?auto_2609095 ?auto_2609096 ) ( ON ?auto_2609097 ?auto_2609095 ) ( ON ?auto_2609098 ?auto_2609097 ) ( ON ?auto_2609099 ?auto_2609098 ) ( ON ?auto_2609100 ?auto_2609099 ) ( ON ?auto_2609101 ?auto_2609100 ) ( ON ?auto_2609102 ?auto_2609101 ) ( ON ?auto_2609103 ?auto_2609102 ) ( ON ?auto_2609104 ?auto_2609103 ) ( ON ?auto_2609105 ?auto_2609104 ) ( not ( = ?auto_2609092 ?auto_2609093 ) ) ( not ( = ?auto_2609092 ?auto_2609094 ) ) ( not ( = ?auto_2609092 ?auto_2609096 ) ) ( not ( = ?auto_2609092 ?auto_2609095 ) ) ( not ( = ?auto_2609092 ?auto_2609097 ) ) ( not ( = ?auto_2609092 ?auto_2609098 ) ) ( not ( = ?auto_2609092 ?auto_2609099 ) ) ( not ( = ?auto_2609092 ?auto_2609100 ) ) ( not ( = ?auto_2609092 ?auto_2609101 ) ) ( not ( = ?auto_2609092 ?auto_2609102 ) ) ( not ( = ?auto_2609092 ?auto_2609103 ) ) ( not ( = ?auto_2609092 ?auto_2609104 ) ) ( not ( = ?auto_2609092 ?auto_2609105 ) ) ( not ( = ?auto_2609092 ?auto_2609106 ) ) ( not ( = ?auto_2609092 ?auto_2609107 ) ) ( not ( = ?auto_2609092 ?auto_2609112 ) ) ( not ( = ?auto_2609093 ?auto_2609094 ) ) ( not ( = ?auto_2609093 ?auto_2609096 ) ) ( not ( = ?auto_2609093 ?auto_2609095 ) ) ( not ( = ?auto_2609093 ?auto_2609097 ) ) ( not ( = ?auto_2609093 ?auto_2609098 ) ) ( not ( = ?auto_2609093 ?auto_2609099 ) ) ( not ( = ?auto_2609093 ?auto_2609100 ) ) ( not ( = ?auto_2609093 ?auto_2609101 ) ) ( not ( = ?auto_2609093 ?auto_2609102 ) ) ( not ( = ?auto_2609093 ?auto_2609103 ) ) ( not ( = ?auto_2609093 ?auto_2609104 ) ) ( not ( = ?auto_2609093 ?auto_2609105 ) ) ( not ( = ?auto_2609093 ?auto_2609106 ) ) ( not ( = ?auto_2609093 ?auto_2609107 ) ) ( not ( = ?auto_2609093 ?auto_2609112 ) ) ( not ( = ?auto_2609094 ?auto_2609096 ) ) ( not ( = ?auto_2609094 ?auto_2609095 ) ) ( not ( = ?auto_2609094 ?auto_2609097 ) ) ( not ( = ?auto_2609094 ?auto_2609098 ) ) ( not ( = ?auto_2609094 ?auto_2609099 ) ) ( not ( = ?auto_2609094 ?auto_2609100 ) ) ( not ( = ?auto_2609094 ?auto_2609101 ) ) ( not ( = ?auto_2609094 ?auto_2609102 ) ) ( not ( = ?auto_2609094 ?auto_2609103 ) ) ( not ( = ?auto_2609094 ?auto_2609104 ) ) ( not ( = ?auto_2609094 ?auto_2609105 ) ) ( not ( = ?auto_2609094 ?auto_2609106 ) ) ( not ( = ?auto_2609094 ?auto_2609107 ) ) ( not ( = ?auto_2609094 ?auto_2609112 ) ) ( not ( = ?auto_2609096 ?auto_2609095 ) ) ( not ( = ?auto_2609096 ?auto_2609097 ) ) ( not ( = ?auto_2609096 ?auto_2609098 ) ) ( not ( = ?auto_2609096 ?auto_2609099 ) ) ( not ( = ?auto_2609096 ?auto_2609100 ) ) ( not ( = ?auto_2609096 ?auto_2609101 ) ) ( not ( = ?auto_2609096 ?auto_2609102 ) ) ( not ( = ?auto_2609096 ?auto_2609103 ) ) ( not ( = ?auto_2609096 ?auto_2609104 ) ) ( not ( = ?auto_2609096 ?auto_2609105 ) ) ( not ( = ?auto_2609096 ?auto_2609106 ) ) ( not ( = ?auto_2609096 ?auto_2609107 ) ) ( not ( = ?auto_2609096 ?auto_2609112 ) ) ( not ( = ?auto_2609095 ?auto_2609097 ) ) ( not ( = ?auto_2609095 ?auto_2609098 ) ) ( not ( = ?auto_2609095 ?auto_2609099 ) ) ( not ( = ?auto_2609095 ?auto_2609100 ) ) ( not ( = ?auto_2609095 ?auto_2609101 ) ) ( not ( = ?auto_2609095 ?auto_2609102 ) ) ( not ( = ?auto_2609095 ?auto_2609103 ) ) ( not ( = ?auto_2609095 ?auto_2609104 ) ) ( not ( = ?auto_2609095 ?auto_2609105 ) ) ( not ( = ?auto_2609095 ?auto_2609106 ) ) ( not ( = ?auto_2609095 ?auto_2609107 ) ) ( not ( = ?auto_2609095 ?auto_2609112 ) ) ( not ( = ?auto_2609097 ?auto_2609098 ) ) ( not ( = ?auto_2609097 ?auto_2609099 ) ) ( not ( = ?auto_2609097 ?auto_2609100 ) ) ( not ( = ?auto_2609097 ?auto_2609101 ) ) ( not ( = ?auto_2609097 ?auto_2609102 ) ) ( not ( = ?auto_2609097 ?auto_2609103 ) ) ( not ( = ?auto_2609097 ?auto_2609104 ) ) ( not ( = ?auto_2609097 ?auto_2609105 ) ) ( not ( = ?auto_2609097 ?auto_2609106 ) ) ( not ( = ?auto_2609097 ?auto_2609107 ) ) ( not ( = ?auto_2609097 ?auto_2609112 ) ) ( not ( = ?auto_2609098 ?auto_2609099 ) ) ( not ( = ?auto_2609098 ?auto_2609100 ) ) ( not ( = ?auto_2609098 ?auto_2609101 ) ) ( not ( = ?auto_2609098 ?auto_2609102 ) ) ( not ( = ?auto_2609098 ?auto_2609103 ) ) ( not ( = ?auto_2609098 ?auto_2609104 ) ) ( not ( = ?auto_2609098 ?auto_2609105 ) ) ( not ( = ?auto_2609098 ?auto_2609106 ) ) ( not ( = ?auto_2609098 ?auto_2609107 ) ) ( not ( = ?auto_2609098 ?auto_2609112 ) ) ( not ( = ?auto_2609099 ?auto_2609100 ) ) ( not ( = ?auto_2609099 ?auto_2609101 ) ) ( not ( = ?auto_2609099 ?auto_2609102 ) ) ( not ( = ?auto_2609099 ?auto_2609103 ) ) ( not ( = ?auto_2609099 ?auto_2609104 ) ) ( not ( = ?auto_2609099 ?auto_2609105 ) ) ( not ( = ?auto_2609099 ?auto_2609106 ) ) ( not ( = ?auto_2609099 ?auto_2609107 ) ) ( not ( = ?auto_2609099 ?auto_2609112 ) ) ( not ( = ?auto_2609100 ?auto_2609101 ) ) ( not ( = ?auto_2609100 ?auto_2609102 ) ) ( not ( = ?auto_2609100 ?auto_2609103 ) ) ( not ( = ?auto_2609100 ?auto_2609104 ) ) ( not ( = ?auto_2609100 ?auto_2609105 ) ) ( not ( = ?auto_2609100 ?auto_2609106 ) ) ( not ( = ?auto_2609100 ?auto_2609107 ) ) ( not ( = ?auto_2609100 ?auto_2609112 ) ) ( not ( = ?auto_2609101 ?auto_2609102 ) ) ( not ( = ?auto_2609101 ?auto_2609103 ) ) ( not ( = ?auto_2609101 ?auto_2609104 ) ) ( not ( = ?auto_2609101 ?auto_2609105 ) ) ( not ( = ?auto_2609101 ?auto_2609106 ) ) ( not ( = ?auto_2609101 ?auto_2609107 ) ) ( not ( = ?auto_2609101 ?auto_2609112 ) ) ( not ( = ?auto_2609102 ?auto_2609103 ) ) ( not ( = ?auto_2609102 ?auto_2609104 ) ) ( not ( = ?auto_2609102 ?auto_2609105 ) ) ( not ( = ?auto_2609102 ?auto_2609106 ) ) ( not ( = ?auto_2609102 ?auto_2609107 ) ) ( not ( = ?auto_2609102 ?auto_2609112 ) ) ( not ( = ?auto_2609103 ?auto_2609104 ) ) ( not ( = ?auto_2609103 ?auto_2609105 ) ) ( not ( = ?auto_2609103 ?auto_2609106 ) ) ( not ( = ?auto_2609103 ?auto_2609107 ) ) ( not ( = ?auto_2609103 ?auto_2609112 ) ) ( not ( = ?auto_2609104 ?auto_2609105 ) ) ( not ( = ?auto_2609104 ?auto_2609106 ) ) ( not ( = ?auto_2609104 ?auto_2609107 ) ) ( not ( = ?auto_2609104 ?auto_2609112 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2609105 ?auto_2609106 ?auto_2609107 )
      ( MAKE-15CRATE-VERIFY ?auto_2609092 ?auto_2609093 ?auto_2609094 ?auto_2609096 ?auto_2609095 ?auto_2609097 ?auto_2609098 ?auto_2609099 ?auto_2609100 ?auto_2609101 ?auto_2609102 ?auto_2609103 ?auto_2609104 ?auto_2609105 ?auto_2609106 ?auto_2609107 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2609318 - SURFACE
      ?auto_2609319 - SURFACE
      ?auto_2609320 - SURFACE
      ?auto_2609322 - SURFACE
      ?auto_2609321 - SURFACE
      ?auto_2609323 - SURFACE
      ?auto_2609324 - SURFACE
      ?auto_2609325 - SURFACE
      ?auto_2609326 - SURFACE
      ?auto_2609327 - SURFACE
      ?auto_2609328 - SURFACE
      ?auto_2609329 - SURFACE
      ?auto_2609330 - SURFACE
      ?auto_2609331 - SURFACE
      ?auto_2609332 - SURFACE
      ?auto_2609333 - SURFACE
    )
    :vars
    (
      ?auto_2609338 - HOIST
      ?auto_2609334 - PLACE
      ?auto_2609339 - PLACE
      ?auto_2609337 - HOIST
      ?auto_2609336 - SURFACE
      ?auto_2609335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2609338 ?auto_2609334 ) ( IS-CRATE ?auto_2609333 ) ( not ( = ?auto_2609332 ?auto_2609333 ) ) ( not ( = ?auto_2609331 ?auto_2609332 ) ) ( not ( = ?auto_2609331 ?auto_2609333 ) ) ( not ( = ?auto_2609339 ?auto_2609334 ) ) ( HOIST-AT ?auto_2609337 ?auto_2609339 ) ( not ( = ?auto_2609338 ?auto_2609337 ) ) ( AVAILABLE ?auto_2609337 ) ( SURFACE-AT ?auto_2609333 ?auto_2609339 ) ( ON ?auto_2609333 ?auto_2609336 ) ( CLEAR ?auto_2609333 ) ( not ( = ?auto_2609332 ?auto_2609336 ) ) ( not ( = ?auto_2609333 ?auto_2609336 ) ) ( not ( = ?auto_2609331 ?auto_2609336 ) ) ( TRUCK-AT ?auto_2609335 ?auto_2609334 ) ( SURFACE-AT ?auto_2609331 ?auto_2609334 ) ( CLEAR ?auto_2609331 ) ( IS-CRATE ?auto_2609332 ) ( AVAILABLE ?auto_2609338 ) ( IN ?auto_2609332 ?auto_2609335 ) ( ON ?auto_2609319 ?auto_2609318 ) ( ON ?auto_2609320 ?auto_2609319 ) ( ON ?auto_2609322 ?auto_2609320 ) ( ON ?auto_2609321 ?auto_2609322 ) ( ON ?auto_2609323 ?auto_2609321 ) ( ON ?auto_2609324 ?auto_2609323 ) ( ON ?auto_2609325 ?auto_2609324 ) ( ON ?auto_2609326 ?auto_2609325 ) ( ON ?auto_2609327 ?auto_2609326 ) ( ON ?auto_2609328 ?auto_2609327 ) ( ON ?auto_2609329 ?auto_2609328 ) ( ON ?auto_2609330 ?auto_2609329 ) ( ON ?auto_2609331 ?auto_2609330 ) ( not ( = ?auto_2609318 ?auto_2609319 ) ) ( not ( = ?auto_2609318 ?auto_2609320 ) ) ( not ( = ?auto_2609318 ?auto_2609322 ) ) ( not ( = ?auto_2609318 ?auto_2609321 ) ) ( not ( = ?auto_2609318 ?auto_2609323 ) ) ( not ( = ?auto_2609318 ?auto_2609324 ) ) ( not ( = ?auto_2609318 ?auto_2609325 ) ) ( not ( = ?auto_2609318 ?auto_2609326 ) ) ( not ( = ?auto_2609318 ?auto_2609327 ) ) ( not ( = ?auto_2609318 ?auto_2609328 ) ) ( not ( = ?auto_2609318 ?auto_2609329 ) ) ( not ( = ?auto_2609318 ?auto_2609330 ) ) ( not ( = ?auto_2609318 ?auto_2609331 ) ) ( not ( = ?auto_2609318 ?auto_2609332 ) ) ( not ( = ?auto_2609318 ?auto_2609333 ) ) ( not ( = ?auto_2609318 ?auto_2609336 ) ) ( not ( = ?auto_2609319 ?auto_2609320 ) ) ( not ( = ?auto_2609319 ?auto_2609322 ) ) ( not ( = ?auto_2609319 ?auto_2609321 ) ) ( not ( = ?auto_2609319 ?auto_2609323 ) ) ( not ( = ?auto_2609319 ?auto_2609324 ) ) ( not ( = ?auto_2609319 ?auto_2609325 ) ) ( not ( = ?auto_2609319 ?auto_2609326 ) ) ( not ( = ?auto_2609319 ?auto_2609327 ) ) ( not ( = ?auto_2609319 ?auto_2609328 ) ) ( not ( = ?auto_2609319 ?auto_2609329 ) ) ( not ( = ?auto_2609319 ?auto_2609330 ) ) ( not ( = ?auto_2609319 ?auto_2609331 ) ) ( not ( = ?auto_2609319 ?auto_2609332 ) ) ( not ( = ?auto_2609319 ?auto_2609333 ) ) ( not ( = ?auto_2609319 ?auto_2609336 ) ) ( not ( = ?auto_2609320 ?auto_2609322 ) ) ( not ( = ?auto_2609320 ?auto_2609321 ) ) ( not ( = ?auto_2609320 ?auto_2609323 ) ) ( not ( = ?auto_2609320 ?auto_2609324 ) ) ( not ( = ?auto_2609320 ?auto_2609325 ) ) ( not ( = ?auto_2609320 ?auto_2609326 ) ) ( not ( = ?auto_2609320 ?auto_2609327 ) ) ( not ( = ?auto_2609320 ?auto_2609328 ) ) ( not ( = ?auto_2609320 ?auto_2609329 ) ) ( not ( = ?auto_2609320 ?auto_2609330 ) ) ( not ( = ?auto_2609320 ?auto_2609331 ) ) ( not ( = ?auto_2609320 ?auto_2609332 ) ) ( not ( = ?auto_2609320 ?auto_2609333 ) ) ( not ( = ?auto_2609320 ?auto_2609336 ) ) ( not ( = ?auto_2609322 ?auto_2609321 ) ) ( not ( = ?auto_2609322 ?auto_2609323 ) ) ( not ( = ?auto_2609322 ?auto_2609324 ) ) ( not ( = ?auto_2609322 ?auto_2609325 ) ) ( not ( = ?auto_2609322 ?auto_2609326 ) ) ( not ( = ?auto_2609322 ?auto_2609327 ) ) ( not ( = ?auto_2609322 ?auto_2609328 ) ) ( not ( = ?auto_2609322 ?auto_2609329 ) ) ( not ( = ?auto_2609322 ?auto_2609330 ) ) ( not ( = ?auto_2609322 ?auto_2609331 ) ) ( not ( = ?auto_2609322 ?auto_2609332 ) ) ( not ( = ?auto_2609322 ?auto_2609333 ) ) ( not ( = ?auto_2609322 ?auto_2609336 ) ) ( not ( = ?auto_2609321 ?auto_2609323 ) ) ( not ( = ?auto_2609321 ?auto_2609324 ) ) ( not ( = ?auto_2609321 ?auto_2609325 ) ) ( not ( = ?auto_2609321 ?auto_2609326 ) ) ( not ( = ?auto_2609321 ?auto_2609327 ) ) ( not ( = ?auto_2609321 ?auto_2609328 ) ) ( not ( = ?auto_2609321 ?auto_2609329 ) ) ( not ( = ?auto_2609321 ?auto_2609330 ) ) ( not ( = ?auto_2609321 ?auto_2609331 ) ) ( not ( = ?auto_2609321 ?auto_2609332 ) ) ( not ( = ?auto_2609321 ?auto_2609333 ) ) ( not ( = ?auto_2609321 ?auto_2609336 ) ) ( not ( = ?auto_2609323 ?auto_2609324 ) ) ( not ( = ?auto_2609323 ?auto_2609325 ) ) ( not ( = ?auto_2609323 ?auto_2609326 ) ) ( not ( = ?auto_2609323 ?auto_2609327 ) ) ( not ( = ?auto_2609323 ?auto_2609328 ) ) ( not ( = ?auto_2609323 ?auto_2609329 ) ) ( not ( = ?auto_2609323 ?auto_2609330 ) ) ( not ( = ?auto_2609323 ?auto_2609331 ) ) ( not ( = ?auto_2609323 ?auto_2609332 ) ) ( not ( = ?auto_2609323 ?auto_2609333 ) ) ( not ( = ?auto_2609323 ?auto_2609336 ) ) ( not ( = ?auto_2609324 ?auto_2609325 ) ) ( not ( = ?auto_2609324 ?auto_2609326 ) ) ( not ( = ?auto_2609324 ?auto_2609327 ) ) ( not ( = ?auto_2609324 ?auto_2609328 ) ) ( not ( = ?auto_2609324 ?auto_2609329 ) ) ( not ( = ?auto_2609324 ?auto_2609330 ) ) ( not ( = ?auto_2609324 ?auto_2609331 ) ) ( not ( = ?auto_2609324 ?auto_2609332 ) ) ( not ( = ?auto_2609324 ?auto_2609333 ) ) ( not ( = ?auto_2609324 ?auto_2609336 ) ) ( not ( = ?auto_2609325 ?auto_2609326 ) ) ( not ( = ?auto_2609325 ?auto_2609327 ) ) ( not ( = ?auto_2609325 ?auto_2609328 ) ) ( not ( = ?auto_2609325 ?auto_2609329 ) ) ( not ( = ?auto_2609325 ?auto_2609330 ) ) ( not ( = ?auto_2609325 ?auto_2609331 ) ) ( not ( = ?auto_2609325 ?auto_2609332 ) ) ( not ( = ?auto_2609325 ?auto_2609333 ) ) ( not ( = ?auto_2609325 ?auto_2609336 ) ) ( not ( = ?auto_2609326 ?auto_2609327 ) ) ( not ( = ?auto_2609326 ?auto_2609328 ) ) ( not ( = ?auto_2609326 ?auto_2609329 ) ) ( not ( = ?auto_2609326 ?auto_2609330 ) ) ( not ( = ?auto_2609326 ?auto_2609331 ) ) ( not ( = ?auto_2609326 ?auto_2609332 ) ) ( not ( = ?auto_2609326 ?auto_2609333 ) ) ( not ( = ?auto_2609326 ?auto_2609336 ) ) ( not ( = ?auto_2609327 ?auto_2609328 ) ) ( not ( = ?auto_2609327 ?auto_2609329 ) ) ( not ( = ?auto_2609327 ?auto_2609330 ) ) ( not ( = ?auto_2609327 ?auto_2609331 ) ) ( not ( = ?auto_2609327 ?auto_2609332 ) ) ( not ( = ?auto_2609327 ?auto_2609333 ) ) ( not ( = ?auto_2609327 ?auto_2609336 ) ) ( not ( = ?auto_2609328 ?auto_2609329 ) ) ( not ( = ?auto_2609328 ?auto_2609330 ) ) ( not ( = ?auto_2609328 ?auto_2609331 ) ) ( not ( = ?auto_2609328 ?auto_2609332 ) ) ( not ( = ?auto_2609328 ?auto_2609333 ) ) ( not ( = ?auto_2609328 ?auto_2609336 ) ) ( not ( = ?auto_2609329 ?auto_2609330 ) ) ( not ( = ?auto_2609329 ?auto_2609331 ) ) ( not ( = ?auto_2609329 ?auto_2609332 ) ) ( not ( = ?auto_2609329 ?auto_2609333 ) ) ( not ( = ?auto_2609329 ?auto_2609336 ) ) ( not ( = ?auto_2609330 ?auto_2609331 ) ) ( not ( = ?auto_2609330 ?auto_2609332 ) ) ( not ( = ?auto_2609330 ?auto_2609333 ) ) ( not ( = ?auto_2609330 ?auto_2609336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2609331 ?auto_2609332 ?auto_2609333 )
      ( MAKE-15CRATE-VERIFY ?auto_2609318 ?auto_2609319 ?auto_2609320 ?auto_2609322 ?auto_2609321 ?auto_2609323 ?auto_2609324 ?auto_2609325 ?auto_2609326 ?auto_2609327 ?auto_2609328 ?auto_2609329 ?auto_2609330 ?auto_2609331 ?auto_2609332 ?auto_2609333 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2629817 - SURFACE
      ?auto_2629818 - SURFACE
      ?auto_2629819 - SURFACE
      ?auto_2629821 - SURFACE
      ?auto_2629820 - SURFACE
      ?auto_2629822 - SURFACE
      ?auto_2629823 - SURFACE
      ?auto_2629824 - SURFACE
      ?auto_2629825 - SURFACE
      ?auto_2629826 - SURFACE
      ?auto_2629827 - SURFACE
      ?auto_2629828 - SURFACE
      ?auto_2629829 - SURFACE
      ?auto_2629830 - SURFACE
      ?auto_2629831 - SURFACE
      ?auto_2629832 - SURFACE
      ?auto_2629833 - SURFACE
    )
    :vars
    (
      ?auto_2629835 - HOIST
      ?auto_2629834 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2629835 ?auto_2629834 ) ( SURFACE-AT ?auto_2629832 ?auto_2629834 ) ( CLEAR ?auto_2629832 ) ( LIFTING ?auto_2629835 ?auto_2629833 ) ( IS-CRATE ?auto_2629833 ) ( not ( = ?auto_2629832 ?auto_2629833 ) ) ( ON ?auto_2629818 ?auto_2629817 ) ( ON ?auto_2629819 ?auto_2629818 ) ( ON ?auto_2629821 ?auto_2629819 ) ( ON ?auto_2629820 ?auto_2629821 ) ( ON ?auto_2629822 ?auto_2629820 ) ( ON ?auto_2629823 ?auto_2629822 ) ( ON ?auto_2629824 ?auto_2629823 ) ( ON ?auto_2629825 ?auto_2629824 ) ( ON ?auto_2629826 ?auto_2629825 ) ( ON ?auto_2629827 ?auto_2629826 ) ( ON ?auto_2629828 ?auto_2629827 ) ( ON ?auto_2629829 ?auto_2629828 ) ( ON ?auto_2629830 ?auto_2629829 ) ( ON ?auto_2629831 ?auto_2629830 ) ( ON ?auto_2629832 ?auto_2629831 ) ( not ( = ?auto_2629817 ?auto_2629818 ) ) ( not ( = ?auto_2629817 ?auto_2629819 ) ) ( not ( = ?auto_2629817 ?auto_2629821 ) ) ( not ( = ?auto_2629817 ?auto_2629820 ) ) ( not ( = ?auto_2629817 ?auto_2629822 ) ) ( not ( = ?auto_2629817 ?auto_2629823 ) ) ( not ( = ?auto_2629817 ?auto_2629824 ) ) ( not ( = ?auto_2629817 ?auto_2629825 ) ) ( not ( = ?auto_2629817 ?auto_2629826 ) ) ( not ( = ?auto_2629817 ?auto_2629827 ) ) ( not ( = ?auto_2629817 ?auto_2629828 ) ) ( not ( = ?auto_2629817 ?auto_2629829 ) ) ( not ( = ?auto_2629817 ?auto_2629830 ) ) ( not ( = ?auto_2629817 ?auto_2629831 ) ) ( not ( = ?auto_2629817 ?auto_2629832 ) ) ( not ( = ?auto_2629817 ?auto_2629833 ) ) ( not ( = ?auto_2629818 ?auto_2629819 ) ) ( not ( = ?auto_2629818 ?auto_2629821 ) ) ( not ( = ?auto_2629818 ?auto_2629820 ) ) ( not ( = ?auto_2629818 ?auto_2629822 ) ) ( not ( = ?auto_2629818 ?auto_2629823 ) ) ( not ( = ?auto_2629818 ?auto_2629824 ) ) ( not ( = ?auto_2629818 ?auto_2629825 ) ) ( not ( = ?auto_2629818 ?auto_2629826 ) ) ( not ( = ?auto_2629818 ?auto_2629827 ) ) ( not ( = ?auto_2629818 ?auto_2629828 ) ) ( not ( = ?auto_2629818 ?auto_2629829 ) ) ( not ( = ?auto_2629818 ?auto_2629830 ) ) ( not ( = ?auto_2629818 ?auto_2629831 ) ) ( not ( = ?auto_2629818 ?auto_2629832 ) ) ( not ( = ?auto_2629818 ?auto_2629833 ) ) ( not ( = ?auto_2629819 ?auto_2629821 ) ) ( not ( = ?auto_2629819 ?auto_2629820 ) ) ( not ( = ?auto_2629819 ?auto_2629822 ) ) ( not ( = ?auto_2629819 ?auto_2629823 ) ) ( not ( = ?auto_2629819 ?auto_2629824 ) ) ( not ( = ?auto_2629819 ?auto_2629825 ) ) ( not ( = ?auto_2629819 ?auto_2629826 ) ) ( not ( = ?auto_2629819 ?auto_2629827 ) ) ( not ( = ?auto_2629819 ?auto_2629828 ) ) ( not ( = ?auto_2629819 ?auto_2629829 ) ) ( not ( = ?auto_2629819 ?auto_2629830 ) ) ( not ( = ?auto_2629819 ?auto_2629831 ) ) ( not ( = ?auto_2629819 ?auto_2629832 ) ) ( not ( = ?auto_2629819 ?auto_2629833 ) ) ( not ( = ?auto_2629821 ?auto_2629820 ) ) ( not ( = ?auto_2629821 ?auto_2629822 ) ) ( not ( = ?auto_2629821 ?auto_2629823 ) ) ( not ( = ?auto_2629821 ?auto_2629824 ) ) ( not ( = ?auto_2629821 ?auto_2629825 ) ) ( not ( = ?auto_2629821 ?auto_2629826 ) ) ( not ( = ?auto_2629821 ?auto_2629827 ) ) ( not ( = ?auto_2629821 ?auto_2629828 ) ) ( not ( = ?auto_2629821 ?auto_2629829 ) ) ( not ( = ?auto_2629821 ?auto_2629830 ) ) ( not ( = ?auto_2629821 ?auto_2629831 ) ) ( not ( = ?auto_2629821 ?auto_2629832 ) ) ( not ( = ?auto_2629821 ?auto_2629833 ) ) ( not ( = ?auto_2629820 ?auto_2629822 ) ) ( not ( = ?auto_2629820 ?auto_2629823 ) ) ( not ( = ?auto_2629820 ?auto_2629824 ) ) ( not ( = ?auto_2629820 ?auto_2629825 ) ) ( not ( = ?auto_2629820 ?auto_2629826 ) ) ( not ( = ?auto_2629820 ?auto_2629827 ) ) ( not ( = ?auto_2629820 ?auto_2629828 ) ) ( not ( = ?auto_2629820 ?auto_2629829 ) ) ( not ( = ?auto_2629820 ?auto_2629830 ) ) ( not ( = ?auto_2629820 ?auto_2629831 ) ) ( not ( = ?auto_2629820 ?auto_2629832 ) ) ( not ( = ?auto_2629820 ?auto_2629833 ) ) ( not ( = ?auto_2629822 ?auto_2629823 ) ) ( not ( = ?auto_2629822 ?auto_2629824 ) ) ( not ( = ?auto_2629822 ?auto_2629825 ) ) ( not ( = ?auto_2629822 ?auto_2629826 ) ) ( not ( = ?auto_2629822 ?auto_2629827 ) ) ( not ( = ?auto_2629822 ?auto_2629828 ) ) ( not ( = ?auto_2629822 ?auto_2629829 ) ) ( not ( = ?auto_2629822 ?auto_2629830 ) ) ( not ( = ?auto_2629822 ?auto_2629831 ) ) ( not ( = ?auto_2629822 ?auto_2629832 ) ) ( not ( = ?auto_2629822 ?auto_2629833 ) ) ( not ( = ?auto_2629823 ?auto_2629824 ) ) ( not ( = ?auto_2629823 ?auto_2629825 ) ) ( not ( = ?auto_2629823 ?auto_2629826 ) ) ( not ( = ?auto_2629823 ?auto_2629827 ) ) ( not ( = ?auto_2629823 ?auto_2629828 ) ) ( not ( = ?auto_2629823 ?auto_2629829 ) ) ( not ( = ?auto_2629823 ?auto_2629830 ) ) ( not ( = ?auto_2629823 ?auto_2629831 ) ) ( not ( = ?auto_2629823 ?auto_2629832 ) ) ( not ( = ?auto_2629823 ?auto_2629833 ) ) ( not ( = ?auto_2629824 ?auto_2629825 ) ) ( not ( = ?auto_2629824 ?auto_2629826 ) ) ( not ( = ?auto_2629824 ?auto_2629827 ) ) ( not ( = ?auto_2629824 ?auto_2629828 ) ) ( not ( = ?auto_2629824 ?auto_2629829 ) ) ( not ( = ?auto_2629824 ?auto_2629830 ) ) ( not ( = ?auto_2629824 ?auto_2629831 ) ) ( not ( = ?auto_2629824 ?auto_2629832 ) ) ( not ( = ?auto_2629824 ?auto_2629833 ) ) ( not ( = ?auto_2629825 ?auto_2629826 ) ) ( not ( = ?auto_2629825 ?auto_2629827 ) ) ( not ( = ?auto_2629825 ?auto_2629828 ) ) ( not ( = ?auto_2629825 ?auto_2629829 ) ) ( not ( = ?auto_2629825 ?auto_2629830 ) ) ( not ( = ?auto_2629825 ?auto_2629831 ) ) ( not ( = ?auto_2629825 ?auto_2629832 ) ) ( not ( = ?auto_2629825 ?auto_2629833 ) ) ( not ( = ?auto_2629826 ?auto_2629827 ) ) ( not ( = ?auto_2629826 ?auto_2629828 ) ) ( not ( = ?auto_2629826 ?auto_2629829 ) ) ( not ( = ?auto_2629826 ?auto_2629830 ) ) ( not ( = ?auto_2629826 ?auto_2629831 ) ) ( not ( = ?auto_2629826 ?auto_2629832 ) ) ( not ( = ?auto_2629826 ?auto_2629833 ) ) ( not ( = ?auto_2629827 ?auto_2629828 ) ) ( not ( = ?auto_2629827 ?auto_2629829 ) ) ( not ( = ?auto_2629827 ?auto_2629830 ) ) ( not ( = ?auto_2629827 ?auto_2629831 ) ) ( not ( = ?auto_2629827 ?auto_2629832 ) ) ( not ( = ?auto_2629827 ?auto_2629833 ) ) ( not ( = ?auto_2629828 ?auto_2629829 ) ) ( not ( = ?auto_2629828 ?auto_2629830 ) ) ( not ( = ?auto_2629828 ?auto_2629831 ) ) ( not ( = ?auto_2629828 ?auto_2629832 ) ) ( not ( = ?auto_2629828 ?auto_2629833 ) ) ( not ( = ?auto_2629829 ?auto_2629830 ) ) ( not ( = ?auto_2629829 ?auto_2629831 ) ) ( not ( = ?auto_2629829 ?auto_2629832 ) ) ( not ( = ?auto_2629829 ?auto_2629833 ) ) ( not ( = ?auto_2629830 ?auto_2629831 ) ) ( not ( = ?auto_2629830 ?auto_2629832 ) ) ( not ( = ?auto_2629830 ?auto_2629833 ) ) ( not ( = ?auto_2629831 ?auto_2629832 ) ) ( not ( = ?auto_2629831 ?auto_2629833 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2629832 ?auto_2629833 )
      ( MAKE-16CRATE-VERIFY ?auto_2629817 ?auto_2629818 ?auto_2629819 ?auto_2629821 ?auto_2629820 ?auto_2629822 ?auto_2629823 ?auto_2629824 ?auto_2629825 ?auto_2629826 ?auto_2629827 ?auto_2629828 ?auto_2629829 ?auto_2629830 ?auto_2629831 ?auto_2629832 ?auto_2629833 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2630016 - SURFACE
      ?auto_2630017 - SURFACE
      ?auto_2630018 - SURFACE
      ?auto_2630020 - SURFACE
      ?auto_2630019 - SURFACE
      ?auto_2630021 - SURFACE
      ?auto_2630022 - SURFACE
      ?auto_2630023 - SURFACE
      ?auto_2630024 - SURFACE
      ?auto_2630025 - SURFACE
      ?auto_2630026 - SURFACE
      ?auto_2630027 - SURFACE
      ?auto_2630028 - SURFACE
      ?auto_2630029 - SURFACE
      ?auto_2630030 - SURFACE
      ?auto_2630031 - SURFACE
      ?auto_2630032 - SURFACE
    )
    :vars
    (
      ?auto_2630034 - HOIST
      ?auto_2630033 - PLACE
      ?auto_2630035 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2630034 ?auto_2630033 ) ( SURFACE-AT ?auto_2630031 ?auto_2630033 ) ( CLEAR ?auto_2630031 ) ( IS-CRATE ?auto_2630032 ) ( not ( = ?auto_2630031 ?auto_2630032 ) ) ( TRUCK-AT ?auto_2630035 ?auto_2630033 ) ( AVAILABLE ?auto_2630034 ) ( IN ?auto_2630032 ?auto_2630035 ) ( ON ?auto_2630031 ?auto_2630030 ) ( not ( = ?auto_2630030 ?auto_2630031 ) ) ( not ( = ?auto_2630030 ?auto_2630032 ) ) ( ON ?auto_2630017 ?auto_2630016 ) ( ON ?auto_2630018 ?auto_2630017 ) ( ON ?auto_2630020 ?auto_2630018 ) ( ON ?auto_2630019 ?auto_2630020 ) ( ON ?auto_2630021 ?auto_2630019 ) ( ON ?auto_2630022 ?auto_2630021 ) ( ON ?auto_2630023 ?auto_2630022 ) ( ON ?auto_2630024 ?auto_2630023 ) ( ON ?auto_2630025 ?auto_2630024 ) ( ON ?auto_2630026 ?auto_2630025 ) ( ON ?auto_2630027 ?auto_2630026 ) ( ON ?auto_2630028 ?auto_2630027 ) ( ON ?auto_2630029 ?auto_2630028 ) ( ON ?auto_2630030 ?auto_2630029 ) ( not ( = ?auto_2630016 ?auto_2630017 ) ) ( not ( = ?auto_2630016 ?auto_2630018 ) ) ( not ( = ?auto_2630016 ?auto_2630020 ) ) ( not ( = ?auto_2630016 ?auto_2630019 ) ) ( not ( = ?auto_2630016 ?auto_2630021 ) ) ( not ( = ?auto_2630016 ?auto_2630022 ) ) ( not ( = ?auto_2630016 ?auto_2630023 ) ) ( not ( = ?auto_2630016 ?auto_2630024 ) ) ( not ( = ?auto_2630016 ?auto_2630025 ) ) ( not ( = ?auto_2630016 ?auto_2630026 ) ) ( not ( = ?auto_2630016 ?auto_2630027 ) ) ( not ( = ?auto_2630016 ?auto_2630028 ) ) ( not ( = ?auto_2630016 ?auto_2630029 ) ) ( not ( = ?auto_2630016 ?auto_2630030 ) ) ( not ( = ?auto_2630016 ?auto_2630031 ) ) ( not ( = ?auto_2630016 ?auto_2630032 ) ) ( not ( = ?auto_2630017 ?auto_2630018 ) ) ( not ( = ?auto_2630017 ?auto_2630020 ) ) ( not ( = ?auto_2630017 ?auto_2630019 ) ) ( not ( = ?auto_2630017 ?auto_2630021 ) ) ( not ( = ?auto_2630017 ?auto_2630022 ) ) ( not ( = ?auto_2630017 ?auto_2630023 ) ) ( not ( = ?auto_2630017 ?auto_2630024 ) ) ( not ( = ?auto_2630017 ?auto_2630025 ) ) ( not ( = ?auto_2630017 ?auto_2630026 ) ) ( not ( = ?auto_2630017 ?auto_2630027 ) ) ( not ( = ?auto_2630017 ?auto_2630028 ) ) ( not ( = ?auto_2630017 ?auto_2630029 ) ) ( not ( = ?auto_2630017 ?auto_2630030 ) ) ( not ( = ?auto_2630017 ?auto_2630031 ) ) ( not ( = ?auto_2630017 ?auto_2630032 ) ) ( not ( = ?auto_2630018 ?auto_2630020 ) ) ( not ( = ?auto_2630018 ?auto_2630019 ) ) ( not ( = ?auto_2630018 ?auto_2630021 ) ) ( not ( = ?auto_2630018 ?auto_2630022 ) ) ( not ( = ?auto_2630018 ?auto_2630023 ) ) ( not ( = ?auto_2630018 ?auto_2630024 ) ) ( not ( = ?auto_2630018 ?auto_2630025 ) ) ( not ( = ?auto_2630018 ?auto_2630026 ) ) ( not ( = ?auto_2630018 ?auto_2630027 ) ) ( not ( = ?auto_2630018 ?auto_2630028 ) ) ( not ( = ?auto_2630018 ?auto_2630029 ) ) ( not ( = ?auto_2630018 ?auto_2630030 ) ) ( not ( = ?auto_2630018 ?auto_2630031 ) ) ( not ( = ?auto_2630018 ?auto_2630032 ) ) ( not ( = ?auto_2630020 ?auto_2630019 ) ) ( not ( = ?auto_2630020 ?auto_2630021 ) ) ( not ( = ?auto_2630020 ?auto_2630022 ) ) ( not ( = ?auto_2630020 ?auto_2630023 ) ) ( not ( = ?auto_2630020 ?auto_2630024 ) ) ( not ( = ?auto_2630020 ?auto_2630025 ) ) ( not ( = ?auto_2630020 ?auto_2630026 ) ) ( not ( = ?auto_2630020 ?auto_2630027 ) ) ( not ( = ?auto_2630020 ?auto_2630028 ) ) ( not ( = ?auto_2630020 ?auto_2630029 ) ) ( not ( = ?auto_2630020 ?auto_2630030 ) ) ( not ( = ?auto_2630020 ?auto_2630031 ) ) ( not ( = ?auto_2630020 ?auto_2630032 ) ) ( not ( = ?auto_2630019 ?auto_2630021 ) ) ( not ( = ?auto_2630019 ?auto_2630022 ) ) ( not ( = ?auto_2630019 ?auto_2630023 ) ) ( not ( = ?auto_2630019 ?auto_2630024 ) ) ( not ( = ?auto_2630019 ?auto_2630025 ) ) ( not ( = ?auto_2630019 ?auto_2630026 ) ) ( not ( = ?auto_2630019 ?auto_2630027 ) ) ( not ( = ?auto_2630019 ?auto_2630028 ) ) ( not ( = ?auto_2630019 ?auto_2630029 ) ) ( not ( = ?auto_2630019 ?auto_2630030 ) ) ( not ( = ?auto_2630019 ?auto_2630031 ) ) ( not ( = ?auto_2630019 ?auto_2630032 ) ) ( not ( = ?auto_2630021 ?auto_2630022 ) ) ( not ( = ?auto_2630021 ?auto_2630023 ) ) ( not ( = ?auto_2630021 ?auto_2630024 ) ) ( not ( = ?auto_2630021 ?auto_2630025 ) ) ( not ( = ?auto_2630021 ?auto_2630026 ) ) ( not ( = ?auto_2630021 ?auto_2630027 ) ) ( not ( = ?auto_2630021 ?auto_2630028 ) ) ( not ( = ?auto_2630021 ?auto_2630029 ) ) ( not ( = ?auto_2630021 ?auto_2630030 ) ) ( not ( = ?auto_2630021 ?auto_2630031 ) ) ( not ( = ?auto_2630021 ?auto_2630032 ) ) ( not ( = ?auto_2630022 ?auto_2630023 ) ) ( not ( = ?auto_2630022 ?auto_2630024 ) ) ( not ( = ?auto_2630022 ?auto_2630025 ) ) ( not ( = ?auto_2630022 ?auto_2630026 ) ) ( not ( = ?auto_2630022 ?auto_2630027 ) ) ( not ( = ?auto_2630022 ?auto_2630028 ) ) ( not ( = ?auto_2630022 ?auto_2630029 ) ) ( not ( = ?auto_2630022 ?auto_2630030 ) ) ( not ( = ?auto_2630022 ?auto_2630031 ) ) ( not ( = ?auto_2630022 ?auto_2630032 ) ) ( not ( = ?auto_2630023 ?auto_2630024 ) ) ( not ( = ?auto_2630023 ?auto_2630025 ) ) ( not ( = ?auto_2630023 ?auto_2630026 ) ) ( not ( = ?auto_2630023 ?auto_2630027 ) ) ( not ( = ?auto_2630023 ?auto_2630028 ) ) ( not ( = ?auto_2630023 ?auto_2630029 ) ) ( not ( = ?auto_2630023 ?auto_2630030 ) ) ( not ( = ?auto_2630023 ?auto_2630031 ) ) ( not ( = ?auto_2630023 ?auto_2630032 ) ) ( not ( = ?auto_2630024 ?auto_2630025 ) ) ( not ( = ?auto_2630024 ?auto_2630026 ) ) ( not ( = ?auto_2630024 ?auto_2630027 ) ) ( not ( = ?auto_2630024 ?auto_2630028 ) ) ( not ( = ?auto_2630024 ?auto_2630029 ) ) ( not ( = ?auto_2630024 ?auto_2630030 ) ) ( not ( = ?auto_2630024 ?auto_2630031 ) ) ( not ( = ?auto_2630024 ?auto_2630032 ) ) ( not ( = ?auto_2630025 ?auto_2630026 ) ) ( not ( = ?auto_2630025 ?auto_2630027 ) ) ( not ( = ?auto_2630025 ?auto_2630028 ) ) ( not ( = ?auto_2630025 ?auto_2630029 ) ) ( not ( = ?auto_2630025 ?auto_2630030 ) ) ( not ( = ?auto_2630025 ?auto_2630031 ) ) ( not ( = ?auto_2630025 ?auto_2630032 ) ) ( not ( = ?auto_2630026 ?auto_2630027 ) ) ( not ( = ?auto_2630026 ?auto_2630028 ) ) ( not ( = ?auto_2630026 ?auto_2630029 ) ) ( not ( = ?auto_2630026 ?auto_2630030 ) ) ( not ( = ?auto_2630026 ?auto_2630031 ) ) ( not ( = ?auto_2630026 ?auto_2630032 ) ) ( not ( = ?auto_2630027 ?auto_2630028 ) ) ( not ( = ?auto_2630027 ?auto_2630029 ) ) ( not ( = ?auto_2630027 ?auto_2630030 ) ) ( not ( = ?auto_2630027 ?auto_2630031 ) ) ( not ( = ?auto_2630027 ?auto_2630032 ) ) ( not ( = ?auto_2630028 ?auto_2630029 ) ) ( not ( = ?auto_2630028 ?auto_2630030 ) ) ( not ( = ?auto_2630028 ?auto_2630031 ) ) ( not ( = ?auto_2630028 ?auto_2630032 ) ) ( not ( = ?auto_2630029 ?auto_2630030 ) ) ( not ( = ?auto_2630029 ?auto_2630031 ) ) ( not ( = ?auto_2630029 ?auto_2630032 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2630030 ?auto_2630031 ?auto_2630032 )
      ( MAKE-16CRATE-VERIFY ?auto_2630016 ?auto_2630017 ?auto_2630018 ?auto_2630020 ?auto_2630019 ?auto_2630021 ?auto_2630022 ?auto_2630023 ?auto_2630024 ?auto_2630025 ?auto_2630026 ?auto_2630027 ?auto_2630028 ?auto_2630029 ?auto_2630030 ?auto_2630031 ?auto_2630032 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2630232 - SURFACE
      ?auto_2630233 - SURFACE
      ?auto_2630234 - SURFACE
      ?auto_2630236 - SURFACE
      ?auto_2630235 - SURFACE
      ?auto_2630237 - SURFACE
      ?auto_2630238 - SURFACE
      ?auto_2630239 - SURFACE
      ?auto_2630240 - SURFACE
      ?auto_2630241 - SURFACE
      ?auto_2630242 - SURFACE
      ?auto_2630243 - SURFACE
      ?auto_2630244 - SURFACE
      ?auto_2630245 - SURFACE
      ?auto_2630246 - SURFACE
      ?auto_2630247 - SURFACE
      ?auto_2630248 - SURFACE
    )
    :vars
    (
      ?auto_2630249 - HOIST
      ?auto_2630250 - PLACE
      ?auto_2630252 - TRUCK
      ?auto_2630251 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2630249 ?auto_2630250 ) ( SURFACE-AT ?auto_2630247 ?auto_2630250 ) ( CLEAR ?auto_2630247 ) ( IS-CRATE ?auto_2630248 ) ( not ( = ?auto_2630247 ?auto_2630248 ) ) ( AVAILABLE ?auto_2630249 ) ( IN ?auto_2630248 ?auto_2630252 ) ( ON ?auto_2630247 ?auto_2630246 ) ( not ( = ?auto_2630246 ?auto_2630247 ) ) ( not ( = ?auto_2630246 ?auto_2630248 ) ) ( TRUCK-AT ?auto_2630252 ?auto_2630251 ) ( not ( = ?auto_2630251 ?auto_2630250 ) ) ( ON ?auto_2630233 ?auto_2630232 ) ( ON ?auto_2630234 ?auto_2630233 ) ( ON ?auto_2630236 ?auto_2630234 ) ( ON ?auto_2630235 ?auto_2630236 ) ( ON ?auto_2630237 ?auto_2630235 ) ( ON ?auto_2630238 ?auto_2630237 ) ( ON ?auto_2630239 ?auto_2630238 ) ( ON ?auto_2630240 ?auto_2630239 ) ( ON ?auto_2630241 ?auto_2630240 ) ( ON ?auto_2630242 ?auto_2630241 ) ( ON ?auto_2630243 ?auto_2630242 ) ( ON ?auto_2630244 ?auto_2630243 ) ( ON ?auto_2630245 ?auto_2630244 ) ( ON ?auto_2630246 ?auto_2630245 ) ( not ( = ?auto_2630232 ?auto_2630233 ) ) ( not ( = ?auto_2630232 ?auto_2630234 ) ) ( not ( = ?auto_2630232 ?auto_2630236 ) ) ( not ( = ?auto_2630232 ?auto_2630235 ) ) ( not ( = ?auto_2630232 ?auto_2630237 ) ) ( not ( = ?auto_2630232 ?auto_2630238 ) ) ( not ( = ?auto_2630232 ?auto_2630239 ) ) ( not ( = ?auto_2630232 ?auto_2630240 ) ) ( not ( = ?auto_2630232 ?auto_2630241 ) ) ( not ( = ?auto_2630232 ?auto_2630242 ) ) ( not ( = ?auto_2630232 ?auto_2630243 ) ) ( not ( = ?auto_2630232 ?auto_2630244 ) ) ( not ( = ?auto_2630232 ?auto_2630245 ) ) ( not ( = ?auto_2630232 ?auto_2630246 ) ) ( not ( = ?auto_2630232 ?auto_2630247 ) ) ( not ( = ?auto_2630232 ?auto_2630248 ) ) ( not ( = ?auto_2630233 ?auto_2630234 ) ) ( not ( = ?auto_2630233 ?auto_2630236 ) ) ( not ( = ?auto_2630233 ?auto_2630235 ) ) ( not ( = ?auto_2630233 ?auto_2630237 ) ) ( not ( = ?auto_2630233 ?auto_2630238 ) ) ( not ( = ?auto_2630233 ?auto_2630239 ) ) ( not ( = ?auto_2630233 ?auto_2630240 ) ) ( not ( = ?auto_2630233 ?auto_2630241 ) ) ( not ( = ?auto_2630233 ?auto_2630242 ) ) ( not ( = ?auto_2630233 ?auto_2630243 ) ) ( not ( = ?auto_2630233 ?auto_2630244 ) ) ( not ( = ?auto_2630233 ?auto_2630245 ) ) ( not ( = ?auto_2630233 ?auto_2630246 ) ) ( not ( = ?auto_2630233 ?auto_2630247 ) ) ( not ( = ?auto_2630233 ?auto_2630248 ) ) ( not ( = ?auto_2630234 ?auto_2630236 ) ) ( not ( = ?auto_2630234 ?auto_2630235 ) ) ( not ( = ?auto_2630234 ?auto_2630237 ) ) ( not ( = ?auto_2630234 ?auto_2630238 ) ) ( not ( = ?auto_2630234 ?auto_2630239 ) ) ( not ( = ?auto_2630234 ?auto_2630240 ) ) ( not ( = ?auto_2630234 ?auto_2630241 ) ) ( not ( = ?auto_2630234 ?auto_2630242 ) ) ( not ( = ?auto_2630234 ?auto_2630243 ) ) ( not ( = ?auto_2630234 ?auto_2630244 ) ) ( not ( = ?auto_2630234 ?auto_2630245 ) ) ( not ( = ?auto_2630234 ?auto_2630246 ) ) ( not ( = ?auto_2630234 ?auto_2630247 ) ) ( not ( = ?auto_2630234 ?auto_2630248 ) ) ( not ( = ?auto_2630236 ?auto_2630235 ) ) ( not ( = ?auto_2630236 ?auto_2630237 ) ) ( not ( = ?auto_2630236 ?auto_2630238 ) ) ( not ( = ?auto_2630236 ?auto_2630239 ) ) ( not ( = ?auto_2630236 ?auto_2630240 ) ) ( not ( = ?auto_2630236 ?auto_2630241 ) ) ( not ( = ?auto_2630236 ?auto_2630242 ) ) ( not ( = ?auto_2630236 ?auto_2630243 ) ) ( not ( = ?auto_2630236 ?auto_2630244 ) ) ( not ( = ?auto_2630236 ?auto_2630245 ) ) ( not ( = ?auto_2630236 ?auto_2630246 ) ) ( not ( = ?auto_2630236 ?auto_2630247 ) ) ( not ( = ?auto_2630236 ?auto_2630248 ) ) ( not ( = ?auto_2630235 ?auto_2630237 ) ) ( not ( = ?auto_2630235 ?auto_2630238 ) ) ( not ( = ?auto_2630235 ?auto_2630239 ) ) ( not ( = ?auto_2630235 ?auto_2630240 ) ) ( not ( = ?auto_2630235 ?auto_2630241 ) ) ( not ( = ?auto_2630235 ?auto_2630242 ) ) ( not ( = ?auto_2630235 ?auto_2630243 ) ) ( not ( = ?auto_2630235 ?auto_2630244 ) ) ( not ( = ?auto_2630235 ?auto_2630245 ) ) ( not ( = ?auto_2630235 ?auto_2630246 ) ) ( not ( = ?auto_2630235 ?auto_2630247 ) ) ( not ( = ?auto_2630235 ?auto_2630248 ) ) ( not ( = ?auto_2630237 ?auto_2630238 ) ) ( not ( = ?auto_2630237 ?auto_2630239 ) ) ( not ( = ?auto_2630237 ?auto_2630240 ) ) ( not ( = ?auto_2630237 ?auto_2630241 ) ) ( not ( = ?auto_2630237 ?auto_2630242 ) ) ( not ( = ?auto_2630237 ?auto_2630243 ) ) ( not ( = ?auto_2630237 ?auto_2630244 ) ) ( not ( = ?auto_2630237 ?auto_2630245 ) ) ( not ( = ?auto_2630237 ?auto_2630246 ) ) ( not ( = ?auto_2630237 ?auto_2630247 ) ) ( not ( = ?auto_2630237 ?auto_2630248 ) ) ( not ( = ?auto_2630238 ?auto_2630239 ) ) ( not ( = ?auto_2630238 ?auto_2630240 ) ) ( not ( = ?auto_2630238 ?auto_2630241 ) ) ( not ( = ?auto_2630238 ?auto_2630242 ) ) ( not ( = ?auto_2630238 ?auto_2630243 ) ) ( not ( = ?auto_2630238 ?auto_2630244 ) ) ( not ( = ?auto_2630238 ?auto_2630245 ) ) ( not ( = ?auto_2630238 ?auto_2630246 ) ) ( not ( = ?auto_2630238 ?auto_2630247 ) ) ( not ( = ?auto_2630238 ?auto_2630248 ) ) ( not ( = ?auto_2630239 ?auto_2630240 ) ) ( not ( = ?auto_2630239 ?auto_2630241 ) ) ( not ( = ?auto_2630239 ?auto_2630242 ) ) ( not ( = ?auto_2630239 ?auto_2630243 ) ) ( not ( = ?auto_2630239 ?auto_2630244 ) ) ( not ( = ?auto_2630239 ?auto_2630245 ) ) ( not ( = ?auto_2630239 ?auto_2630246 ) ) ( not ( = ?auto_2630239 ?auto_2630247 ) ) ( not ( = ?auto_2630239 ?auto_2630248 ) ) ( not ( = ?auto_2630240 ?auto_2630241 ) ) ( not ( = ?auto_2630240 ?auto_2630242 ) ) ( not ( = ?auto_2630240 ?auto_2630243 ) ) ( not ( = ?auto_2630240 ?auto_2630244 ) ) ( not ( = ?auto_2630240 ?auto_2630245 ) ) ( not ( = ?auto_2630240 ?auto_2630246 ) ) ( not ( = ?auto_2630240 ?auto_2630247 ) ) ( not ( = ?auto_2630240 ?auto_2630248 ) ) ( not ( = ?auto_2630241 ?auto_2630242 ) ) ( not ( = ?auto_2630241 ?auto_2630243 ) ) ( not ( = ?auto_2630241 ?auto_2630244 ) ) ( not ( = ?auto_2630241 ?auto_2630245 ) ) ( not ( = ?auto_2630241 ?auto_2630246 ) ) ( not ( = ?auto_2630241 ?auto_2630247 ) ) ( not ( = ?auto_2630241 ?auto_2630248 ) ) ( not ( = ?auto_2630242 ?auto_2630243 ) ) ( not ( = ?auto_2630242 ?auto_2630244 ) ) ( not ( = ?auto_2630242 ?auto_2630245 ) ) ( not ( = ?auto_2630242 ?auto_2630246 ) ) ( not ( = ?auto_2630242 ?auto_2630247 ) ) ( not ( = ?auto_2630242 ?auto_2630248 ) ) ( not ( = ?auto_2630243 ?auto_2630244 ) ) ( not ( = ?auto_2630243 ?auto_2630245 ) ) ( not ( = ?auto_2630243 ?auto_2630246 ) ) ( not ( = ?auto_2630243 ?auto_2630247 ) ) ( not ( = ?auto_2630243 ?auto_2630248 ) ) ( not ( = ?auto_2630244 ?auto_2630245 ) ) ( not ( = ?auto_2630244 ?auto_2630246 ) ) ( not ( = ?auto_2630244 ?auto_2630247 ) ) ( not ( = ?auto_2630244 ?auto_2630248 ) ) ( not ( = ?auto_2630245 ?auto_2630246 ) ) ( not ( = ?auto_2630245 ?auto_2630247 ) ) ( not ( = ?auto_2630245 ?auto_2630248 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2630246 ?auto_2630247 ?auto_2630248 )
      ( MAKE-16CRATE-VERIFY ?auto_2630232 ?auto_2630233 ?auto_2630234 ?auto_2630236 ?auto_2630235 ?auto_2630237 ?auto_2630238 ?auto_2630239 ?auto_2630240 ?auto_2630241 ?auto_2630242 ?auto_2630243 ?auto_2630244 ?auto_2630245 ?auto_2630246 ?auto_2630247 ?auto_2630248 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2630464 - SURFACE
      ?auto_2630465 - SURFACE
      ?auto_2630466 - SURFACE
      ?auto_2630468 - SURFACE
      ?auto_2630467 - SURFACE
      ?auto_2630469 - SURFACE
      ?auto_2630470 - SURFACE
      ?auto_2630471 - SURFACE
      ?auto_2630472 - SURFACE
      ?auto_2630473 - SURFACE
      ?auto_2630474 - SURFACE
      ?auto_2630475 - SURFACE
      ?auto_2630476 - SURFACE
      ?auto_2630477 - SURFACE
      ?auto_2630478 - SURFACE
      ?auto_2630479 - SURFACE
      ?auto_2630480 - SURFACE
    )
    :vars
    (
      ?auto_2630481 - HOIST
      ?auto_2630484 - PLACE
      ?auto_2630483 - TRUCK
      ?auto_2630482 - PLACE
      ?auto_2630485 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2630481 ?auto_2630484 ) ( SURFACE-AT ?auto_2630479 ?auto_2630484 ) ( CLEAR ?auto_2630479 ) ( IS-CRATE ?auto_2630480 ) ( not ( = ?auto_2630479 ?auto_2630480 ) ) ( AVAILABLE ?auto_2630481 ) ( ON ?auto_2630479 ?auto_2630478 ) ( not ( = ?auto_2630478 ?auto_2630479 ) ) ( not ( = ?auto_2630478 ?auto_2630480 ) ) ( TRUCK-AT ?auto_2630483 ?auto_2630482 ) ( not ( = ?auto_2630482 ?auto_2630484 ) ) ( HOIST-AT ?auto_2630485 ?auto_2630482 ) ( LIFTING ?auto_2630485 ?auto_2630480 ) ( not ( = ?auto_2630481 ?auto_2630485 ) ) ( ON ?auto_2630465 ?auto_2630464 ) ( ON ?auto_2630466 ?auto_2630465 ) ( ON ?auto_2630468 ?auto_2630466 ) ( ON ?auto_2630467 ?auto_2630468 ) ( ON ?auto_2630469 ?auto_2630467 ) ( ON ?auto_2630470 ?auto_2630469 ) ( ON ?auto_2630471 ?auto_2630470 ) ( ON ?auto_2630472 ?auto_2630471 ) ( ON ?auto_2630473 ?auto_2630472 ) ( ON ?auto_2630474 ?auto_2630473 ) ( ON ?auto_2630475 ?auto_2630474 ) ( ON ?auto_2630476 ?auto_2630475 ) ( ON ?auto_2630477 ?auto_2630476 ) ( ON ?auto_2630478 ?auto_2630477 ) ( not ( = ?auto_2630464 ?auto_2630465 ) ) ( not ( = ?auto_2630464 ?auto_2630466 ) ) ( not ( = ?auto_2630464 ?auto_2630468 ) ) ( not ( = ?auto_2630464 ?auto_2630467 ) ) ( not ( = ?auto_2630464 ?auto_2630469 ) ) ( not ( = ?auto_2630464 ?auto_2630470 ) ) ( not ( = ?auto_2630464 ?auto_2630471 ) ) ( not ( = ?auto_2630464 ?auto_2630472 ) ) ( not ( = ?auto_2630464 ?auto_2630473 ) ) ( not ( = ?auto_2630464 ?auto_2630474 ) ) ( not ( = ?auto_2630464 ?auto_2630475 ) ) ( not ( = ?auto_2630464 ?auto_2630476 ) ) ( not ( = ?auto_2630464 ?auto_2630477 ) ) ( not ( = ?auto_2630464 ?auto_2630478 ) ) ( not ( = ?auto_2630464 ?auto_2630479 ) ) ( not ( = ?auto_2630464 ?auto_2630480 ) ) ( not ( = ?auto_2630465 ?auto_2630466 ) ) ( not ( = ?auto_2630465 ?auto_2630468 ) ) ( not ( = ?auto_2630465 ?auto_2630467 ) ) ( not ( = ?auto_2630465 ?auto_2630469 ) ) ( not ( = ?auto_2630465 ?auto_2630470 ) ) ( not ( = ?auto_2630465 ?auto_2630471 ) ) ( not ( = ?auto_2630465 ?auto_2630472 ) ) ( not ( = ?auto_2630465 ?auto_2630473 ) ) ( not ( = ?auto_2630465 ?auto_2630474 ) ) ( not ( = ?auto_2630465 ?auto_2630475 ) ) ( not ( = ?auto_2630465 ?auto_2630476 ) ) ( not ( = ?auto_2630465 ?auto_2630477 ) ) ( not ( = ?auto_2630465 ?auto_2630478 ) ) ( not ( = ?auto_2630465 ?auto_2630479 ) ) ( not ( = ?auto_2630465 ?auto_2630480 ) ) ( not ( = ?auto_2630466 ?auto_2630468 ) ) ( not ( = ?auto_2630466 ?auto_2630467 ) ) ( not ( = ?auto_2630466 ?auto_2630469 ) ) ( not ( = ?auto_2630466 ?auto_2630470 ) ) ( not ( = ?auto_2630466 ?auto_2630471 ) ) ( not ( = ?auto_2630466 ?auto_2630472 ) ) ( not ( = ?auto_2630466 ?auto_2630473 ) ) ( not ( = ?auto_2630466 ?auto_2630474 ) ) ( not ( = ?auto_2630466 ?auto_2630475 ) ) ( not ( = ?auto_2630466 ?auto_2630476 ) ) ( not ( = ?auto_2630466 ?auto_2630477 ) ) ( not ( = ?auto_2630466 ?auto_2630478 ) ) ( not ( = ?auto_2630466 ?auto_2630479 ) ) ( not ( = ?auto_2630466 ?auto_2630480 ) ) ( not ( = ?auto_2630468 ?auto_2630467 ) ) ( not ( = ?auto_2630468 ?auto_2630469 ) ) ( not ( = ?auto_2630468 ?auto_2630470 ) ) ( not ( = ?auto_2630468 ?auto_2630471 ) ) ( not ( = ?auto_2630468 ?auto_2630472 ) ) ( not ( = ?auto_2630468 ?auto_2630473 ) ) ( not ( = ?auto_2630468 ?auto_2630474 ) ) ( not ( = ?auto_2630468 ?auto_2630475 ) ) ( not ( = ?auto_2630468 ?auto_2630476 ) ) ( not ( = ?auto_2630468 ?auto_2630477 ) ) ( not ( = ?auto_2630468 ?auto_2630478 ) ) ( not ( = ?auto_2630468 ?auto_2630479 ) ) ( not ( = ?auto_2630468 ?auto_2630480 ) ) ( not ( = ?auto_2630467 ?auto_2630469 ) ) ( not ( = ?auto_2630467 ?auto_2630470 ) ) ( not ( = ?auto_2630467 ?auto_2630471 ) ) ( not ( = ?auto_2630467 ?auto_2630472 ) ) ( not ( = ?auto_2630467 ?auto_2630473 ) ) ( not ( = ?auto_2630467 ?auto_2630474 ) ) ( not ( = ?auto_2630467 ?auto_2630475 ) ) ( not ( = ?auto_2630467 ?auto_2630476 ) ) ( not ( = ?auto_2630467 ?auto_2630477 ) ) ( not ( = ?auto_2630467 ?auto_2630478 ) ) ( not ( = ?auto_2630467 ?auto_2630479 ) ) ( not ( = ?auto_2630467 ?auto_2630480 ) ) ( not ( = ?auto_2630469 ?auto_2630470 ) ) ( not ( = ?auto_2630469 ?auto_2630471 ) ) ( not ( = ?auto_2630469 ?auto_2630472 ) ) ( not ( = ?auto_2630469 ?auto_2630473 ) ) ( not ( = ?auto_2630469 ?auto_2630474 ) ) ( not ( = ?auto_2630469 ?auto_2630475 ) ) ( not ( = ?auto_2630469 ?auto_2630476 ) ) ( not ( = ?auto_2630469 ?auto_2630477 ) ) ( not ( = ?auto_2630469 ?auto_2630478 ) ) ( not ( = ?auto_2630469 ?auto_2630479 ) ) ( not ( = ?auto_2630469 ?auto_2630480 ) ) ( not ( = ?auto_2630470 ?auto_2630471 ) ) ( not ( = ?auto_2630470 ?auto_2630472 ) ) ( not ( = ?auto_2630470 ?auto_2630473 ) ) ( not ( = ?auto_2630470 ?auto_2630474 ) ) ( not ( = ?auto_2630470 ?auto_2630475 ) ) ( not ( = ?auto_2630470 ?auto_2630476 ) ) ( not ( = ?auto_2630470 ?auto_2630477 ) ) ( not ( = ?auto_2630470 ?auto_2630478 ) ) ( not ( = ?auto_2630470 ?auto_2630479 ) ) ( not ( = ?auto_2630470 ?auto_2630480 ) ) ( not ( = ?auto_2630471 ?auto_2630472 ) ) ( not ( = ?auto_2630471 ?auto_2630473 ) ) ( not ( = ?auto_2630471 ?auto_2630474 ) ) ( not ( = ?auto_2630471 ?auto_2630475 ) ) ( not ( = ?auto_2630471 ?auto_2630476 ) ) ( not ( = ?auto_2630471 ?auto_2630477 ) ) ( not ( = ?auto_2630471 ?auto_2630478 ) ) ( not ( = ?auto_2630471 ?auto_2630479 ) ) ( not ( = ?auto_2630471 ?auto_2630480 ) ) ( not ( = ?auto_2630472 ?auto_2630473 ) ) ( not ( = ?auto_2630472 ?auto_2630474 ) ) ( not ( = ?auto_2630472 ?auto_2630475 ) ) ( not ( = ?auto_2630472 ?auto_2630476 ) ) ( not ( = ?auto_2630472 ?auto_2630477 ) ) ( not ( = ?auto_2630472 ?auto_2630478 ) ) ( not ( = ?auto_2630472 ?auto_2630479 ) ) ( not ( = ?auto_2630472 ?auto_2630480 ) ) ( not ( = ?auto_2630473 ?auto_2630474 ) ) ( not ( = ?auto_2630473 ?auto_2630475 ) ) ( not ( = ?auto_2630473 ?auto_2630476 ) ) ( not ( = ?auto_2630473 ?auto_2630477 ) ) ( not ( = ?auto_2630473 ?auto_2630478 ) ) ( not ( = ?auto_2630473 ?auto_2630479 ) ) ( not ( = ?auto_2630473 ?auto_2630480 ) ) ( not ( = ?auto_2630474 ?auto_2630475 ) ) ( not ( = ?auto_2630474 ?auto_2630476 ) ) ( not ( = ?auto_2630474 ?auto_2630477 ) ) ( not ( = ?auto_2630474 ?auto_2630478 ) ) ( not ( = ?auto_2630474 ?auto_2630479 ) ) ( not ( = ?auto_2630474 ?auto_2630480 ) ) ( not ( = ?auto_2630475 ?auto_2630476 ) ) ( not ( = ?auto_2630475 ?auto_2630477 ) ) ( not ( = ?auto_2630475 ?auto_2630478 ) ) ( not ( = ?auto_2630475 ?auto_2630479 ) ) ( not ( = ?auto_2630475 ?auto_2630480 ) ) ( not ( = ?auto_2630476 ?auto_2630477 ) ) ( not ( = ?auto_2630476 ?auto_2630478 ) ) ( not ( = ?auto_2630476 ?auto_2630479 ) ) ( not ( = ?auto_2630476 ?auto_2630480 ) ) ( not ( = ?auto_2630477 ?auto_2630478 ) ) ( not ( = ?auto_2630477 ?auto_2630479 ) ) ( not ( = ?auto_2630477 ?auto_2630480 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2630478 ?auto_2630479 ?auto_2630480 )
      ( MAKE-16CRATE-VERIFY ?auto_2630464 ?auto_2630465 ?auto_2630466 ?auto_2630468 ?auto_2630467 ?auto_2630469 ?auto_2630470 ?auto_2630471 ?auto_2630472 ?auto_2630473 ?auto_2630474 ?auto_2630475 ?auto_2630476 ?auto_2630477 ?auto_2630478 ?auto_2630479 ?auto_2630480 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2630712 - SURFACE
      ?auto_2630713 - SURFACE
      ?auto_2630714 - SURFACE
      ?auto_2630716 - SURFACE
      ?auto_2630715 - SURFACE
      ?auto_2630717 - SURFACE
      ?auto_2630718 - SURFACE
      ?auto_2630719 - SURFACE
      ?auto_2630720 - SURFACE
      ?auto_2630721 - SURFACE
      ?auto_2630722 - SURFACE
      ?auto_2630723 - SURFACE
      ?auto_2630724 - SURFACE
      ?auto_2630725 - SURFACE
      ?auto_2630726 - SURFACE
      ?auto_2630727 - SURFACE
      ?auto_2630728 - SURFACE
    )
    :vars
    (
      ?auto_2630733 - HOIST
      ?auto_2630729 - PLACE
      ?auto_2630732 - TRUCK
      ?auto_2630731 - PLACE
      ?auto_2630730 - HOIST
      ?auto_2630734 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2630733 ?auto_2630729 ) ( SURFACE-AT ?auto_2630727 ?auto_2630729 ) ( CLEAR ?auto_2630727 ) ( IS-CRATE ?auto_2630728 ) ( not ( = ?auto_2630727 ?auto_2630728 ) ) ( AVAILABLE ?auto_2630733 ) ( ON ?auto_2630727 ?auto_2630726 ) ( not ( = ?auto_2630726 ?auto_2630727 ) ) ( not ( = ?auto_2630726 ?auto_2630728 ) ) ( TRUCK-AT ?auto_2630732 ?auto_2630731 ) ( not ( = ?auto_2630731 ?auto_2630729 ) ) ( HOIST-AT ?auto_2630730 ?auto_2630731 ) ( not ( = ?auto_2630733 ?auto_2630730 ) ) ( AVAILABLE ?auto_2630730 ) ( SURFACE-AT ?auto_2630728 ?auto_2630731 ) ( ON ?auto_2630728 ?auto_2630734 ) ( CLEAR ?auto_2630728 ) ( not ( = ?auto_2630727 ?auto_2630734 ) ) ( not ( = ?auto_2630728 ?auto_2630734 ) ) ( not ( = ?auto_2630726 ?auto_2630734 ) ) ( ON ?auto_2630713 ?auto_2630712 ) ( ON ?auto_2630714 ?auto_2630713 ) ( ON ?auto_2630716 ?auto_2630714 ) ( ON ?auto_2630715 ?auto_2630716 ) ( ON ?auto_2630717 ?auto_2630715 ) ( ON ?auto_2630718 ?auto_2630717 ) ( ON ?auto_2630719 ?auto_2630718 ) ( ON ?auto_2630720 ?auto_2630719 ) ( ON ?auto_2630721 ?auto_2630720 ) ( ON ?auto_2630722 ?auto_2630721 ) ( ON ?auto_2630723 ?auto_2630722 ) ( ON ?auto_2630724 ?auto_2630723 ) ( ON ?auto_2630725 ?auto_2630724 ) ( ON ?auto_2630726 ?auto_2630725 ) ( not ( = ?auto_2630712 ?auto_2630713 ) ) ( not ( = ?auto_2630712 ?auto_2630714 ) ) ( not ( = ?auto_2630712 ?auto_2630716 ) ) ( not ( = ?auto_2630712 ?auto_2630715 ) ) ( not ( = ?auto_2630712 ?auto_2630717 ) ) ( not ( = ?auto_2630712 ?auto_2630718 ) ) ( not ( = ?auto_2630712 ?auto_2630719 ) ) ( not ( = ?auto_2630712 ?auto_2630720 ) ) ( not ( = ?auto_2630712 ?auto_2630721 ) ) ( not ( = ?auto_2630712 ?auto_2630722 ) ) ( not ( = ?auto_2630712 ?auto_2630723 ) ) ( not ( = ?auto_2630712 ?auto_2630724 ) ) ( not ( = ?auto_2630712 ?auto_2630725 ) ) ( not ( = ?auto_2630712 ?auto_2630726 ) ) ( not ( = ?auto_2630712 ?auto_2630727 ) ) ( not ( = ?auto_2630712 ?auto_2630728 ) ) ( not ( = ?auto_2630712 ?auto_2630734 ) ) ( not ( = ?auto_2630713 ?auto_2630714 ) ) ( not ( = ?auto_2630713 ?auto_2630716 ) ) ( not ( = ?auto_2630713 ?auto_2630715 ) ) ( not ( = ?auto_2630713 ?auto_2630717 ) ) ( not ( = ?auto_2630713 ?auto_2630718 ) ) ( not ( = ?auto_2630713 ?auto_2630719 ) ) ( not ( = ?auto_2630713 ?auto_2630720 ) ) ( not ( = ?auto_2630713 ?auto_2630721 ) ) ( not ( = ?auto_2630713 ?auto_2630722 ) ) ( not ( = ?auto_2630713 ?auto_2630723 ) ) ( not ( = ?auto_2630713 ?auto_2630724 ) ) ( not ( = ?auto_2630713 ?auto_2630725 ) ) ( not ( = ?auto_2630713 ?auto_2630726 ) ) ( not ( = ?auto_2630713 ?auto_2630727 ) ) ( not ( = ?auto_2630713 ?auto_2630728 ) ) ( not ( = ?auto_2630713 ?auto_2630734 ) ) ( not ( = ?auto_2630714 ?auto_2630716 ) ) ( not ( = ?auto_2630714 ?auto_2630715 ) ) ( not ( = ?auto_2630714 ?auto_2630717 ) ) ( not ( = ?auto_2630714 ?auto_2630718 ) ) ( not ( = ?auto_2630714 ?auto_2630719 ) ) ( not ( = ?auto_2630714 ?auto_2630720 ) ) ( not ( = ?auto_2630714 ?auto_2630721 ) ) ( not ( = ?auto_2630714 ?auto_2630722 ) ) ( not ( = ?auto_2630714 ?auto_2630723 ) ) ( not ( = ?auto_2630714 ?auto_2630724 ) ) ( not ( = ?auto_2630714 ?auto_2630725 ) ) ( not ( = ?auto_2630714 ?auto_2630726 ) ) ( not ( = ?auto_2630714 ?auto_2630727 ) ) ( not ( = ?auto_2630714 ?auto_2630728 ) ) ( not ( = ?auto_2630714 ?auto_2630734 ) ) ( not ( = ?auto_2630716 ?auto_2630715 ) ) ( not ( = ?auto_2630716 ?auto_2630717 ) ) ( not ( = ?auto_2630716 ?auto_2630718 ) ) ( not ( = ?auto_2630716 ?auto_2630719 ) ) ( not ( = ?auto_2630716 ?auto_2630720 ) ) ( not ( = ?auto_2630716 ?auto_2630721 ) ) ( not ( = ?auto_2630716 ?auto_2630722 ) ) ( not ( = ?auto_2630716 ?auto_2630723 ) ) ( not ( = ?auto_2630716 ?auto_2630724 ) ) ( not ( = ?auto_2630716 ?auto_2630725 ) ) ( not ( = ?auto_2630716 ?auto_2630726 ) ) ( not ( = ?auto_2630716 ?auto_2630727 ) ) ( not ( = ?auto_2630716 ?auto_2630728 ) ) ( not ( = ?auto_2630716 ?auto_2630734 ) ) ( not ( = ?auto_2630715 ?auto_2630717 ) ) ( not ( = ?auto_2630715 ?auto_2630718 ) ) ( not ( = ?auto_2630715 ?auto_2630719 ) ) ( not ( = ?auto_2630715 ?auto_2630720 ) ) ( not ( = ?auto_2630715 ?auto_2630721 ) ) ( not ( = ?auto_2630715 ?auto_2630722 ) ) ( not ( = ?auto_2630715 ?auto_2630723 ) ) ( not ( = ?auto_2630715 ?auto_2630724 ) ) ( not ( = ?auto_2630715 ?auto_2630725 ) ) ( not ( = ?auto_2630715 ?auto_2630726 ) ) ( not ( = ?auto_2630715 ?auto_2630727 ) ) ( not ( = ?auto_2630715 ?auto_2630728 ) ) ( not ( = ?auto_2630715 ?auto_2630734 ) ) ( not ( = ?auto_2630717 ?auto_2630718 ) ) ( not ( = ?auto_2630717 ?auto_2630719 ) ) ( not ( = ?auto_2630717 ?auto_2630720 ) ) ( not ( = ?auto_2630717 ?auto_2630721 ) ) ( not ( = ?auto_2630717 ?auto_2630722 ) ) ( not ( = ?auto_2630717 ?auto_2630723 ) ) ( not ( = ?auto_2630717 ?auto_2630724 ) ) ( not ( = ?auto_2630717 ?auto_2630725 ) ) ( not ( = ?auto_2630717 ?auto_2630726 ) ) ( not ( = ?auto_2630717 ?auto_2630727 ) ) ( not ( = ?auto_2630717 ?auto_2630728 ) ) ( not ( = ?auto_2630717 ?auto_2630734 ) ) ( not ( = ?auto_2630718 ?auto_2630719 ) ) ( not ( = ?auto_2630718 ?auto_2630720 ) ) ( not ( = ?auto_2630718 ?auto_2630721 ) ) ( not ( = ?auto_2630718 ?auto_2630722 ) ) ( not ( = ?auto_2630718 ?auto_2630723 ) ) ( not ( = ?auto_2630718 ?auto_2630724 ) ) ( not ( = ?auto_2630718 ?auto_2630725 ) ) ( not ( = ?auto_2630718 ?auto_2630726 ) ) ( not ( = ?auto_2630718 ?auto_2630727 ) ) ( not ( = ?auto_2630718 ?auto_2630728 ) ) ( not ( = ?auto_2630718 ?auto_2630734 ) ) ( not ( = ?auto_2630719 ?auto_2630720 ) ) ( not ( = ?auto_2630719 ?auto_2630721 ) ) ( not ( = ?auto_2630719 ?auto_2630722 ) ) ( not ( = ?auto_2630719 ?auto_2630723 ) ) ( not ( = ?auto_2630719 ?auto_2630724 ) ) ( not ( = ?auto_2630719 ?auto_2630725 ) ) ( not ( = ?auto_2630719 ?auto_2630726 ) ) ( not ( = ?auto_2630719 ?auto_2630727 ) ) ( not ( = ?auto_2630719 ?auto_2630728 ) ) ( not ( = ?auto_2630719 ?auto_2630734 ) ) ( not ( = ?auto_2630720 ?auto_2630721 ) ) ( not ( = ?auto_2630720 ?auto_2630722 ) ) ( not ( = ?auto_2630720 ?auto_2630723 ) ) ( not ( = ?auto_2630720 ?auto_2630724 ) ) ( not ( = ?auto_2630720 ?auto_2630725 ) ) ( not ( = ?auto_2630720 ?auto_2630726 ) ) ( not ( = ?auto_2630720 ?auto_2630727 ) ) ( not ( = ?auto_2630720 ?auto_2630728 ) ) ( not ( = ?auto_2630720 ?auto_2630734 ) ) ( not ( = ?auto_2630721 ?auto_2630722 ) ) ( not ( = ?auto_2630721 ?auto_2630723 ) ) ( not ( = ?auto_2630721 ?auto_2630724 ) ) ( not ( = ?auto_2630721 ?auto_2630725 ) ) ( not ( = ?auto_2630721 ?auto_2630726 ) ) ( not ( = ?auto_2630721 ?auto_2630727 ) ) ( not ( = ?auto_2630721 ?auto_2630728 ) ) ( not ( = ?auto_2630721 ?auto_2630734 ) ) ( not ( = ?auto_2630722 ?auto_2630723 ) ) ( not ( = ?auto_2630722 ?auto_2630724 ) ) ( not ( = ?auto_2630722 ?auto_2630725 ) ) ( not ( = ?auto_2630722 ?auto_2630726 ) ) ( not ( = ?auto_2630722 ?auto_2630727 ) ) ( not ( = ?auto_2630722 ?auto_2630728 ) ) ( not ( = ?auto_2630722 ?auto_2630734 ) ) ( not ( = ?auto_2630723 ?auto_2630724 ) ) ( not ( = ?auto_2630723 ?auto_2630725 ) ) ( not ( = ?auto_2630723 ?auto_2630726 ) ) ( not ( = ?auto_2630723 ?auto_2630727 ) ) ( not ( = ?auto_2630723 ?auto_2630728 ) ) ( not ( = ?auto_2630723 ?auto_2630734 ) ) ( not ( = ?auto_2630724 ?auto_2630725 ) ) ( not ( = ?auto_2630724 ?auto_2630726 ) ) ( not ( = ?auto_2630724 ?auto_2630727 ) ) ( not ( = ?auto_2630724 ?auto_2630728 ) ) ( not ( = ?auto_2630724 ?auto_2630734 ) ) ( not ( = ?auto_2630725 ?auto_2630726 ) ) ( not ( = ?auto_2630725 ?auto_2630727 ) ) ( not ( = ?auto_2630725 ?auto_2630728 ) ) ( not ( = ?auto_2630725 ?auto_2630734 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2630726 ?auto_2630727 ?auto_2630728 )
      ( MAKE-16CRATE-VERIFY ?auto_2630712 ?auto_2630713 ?auto_2630714 ?auto_2630716 ?auto_2630715 ?auto_2630717 ?auto_2630718 ?auto_2630719 ?auto_2630720 ?auto_2630721 ?auto_2630722 ?auto_2630723 ?auto_2630724 ?auto_2630725 ?auto_2630726 ?auto_2630727 ?auto_2630728 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2630961 - SURFACE
      ?auto_2630962 - SURFACE
      ?auto_2630963 - SURFACE
      ?auto_2630965 - SURFACE
      ?auto_2630964 - SURFACE
      ?auto_2630966 - SURFACE
      ?auto_2630967 - SURFACE
      ?auto_2630968 - SURFACE
      ?auto_2630969 - SURFACE
      ?auto_2630970 - SURFACE
      ?auto_2630971 - SURFACE
      ?auto_2630972 - SURFACE
      ?auto_2630973 - SURFACE
      ?auto_2630974 - SURFACE
      ?auto_2630975 - SURFACE
      ?auto_2630976 - SURFACE
      ?auto_2630977 - SURFACE
    )
    :vars
    (
      ?auto_2630979 - HOIST
      ?auto_2630981 - PLACE
      ?auto_2630983 - PLACE
      ?auto_2630982 - HOIST
      ?auto_2630980 - SURFACE
      ?auto_2630978 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2630979 ?auto_2630981 ) ( SURFACE-AT ?auto_2630976 ?auto_2630981 ) ( CLEAR ?auto_2630976 ) ( IS-CRATE ?auto_2630977 ) ( not ( = ?auto_2630976 ?auto_2630977 ) ) ( AVAILABLE ?auto_2630979 ) ( ON ?auto_2630976 ?auto_2630975 ) ( not ( = ?auto_2630975 ?auto_2630976 ) ) ( not ( = ?auto_2630975 ?auto_2630977 ) ) ( not ( = ?auto_2630983 ?auto_2630981 ) ) ( HOIST-AT ?auto_2630982 ?auto_2630983 ) ( not ( = ?auto_2630979 ?auto_2630982 ) ) ( AVAILABLE ?auto_2630982 ) ( SURFACE-AT ?auto_2630977 ?auto_2630983 ) ( ON ?auto_2630977 ?auto_2630980 ) ( CLEAR ?auto_2630977 ) ( not ( = ?auto_2630976 ?auto_2630980 ) ) ( not ( = ?auto_2630977 ?auto_2630980 ) ) ( not ( = ?auto_2630975 ?auto_2630980 ) ) ( TRUCK-AT ?auto_2630978 ?auto_2630981 ) ( ON ?auto_2630962 ?auto_2630961 ) ( ON ?auto_2630963 ?auto_2630962 ) ( ON ?auto_2630965 ?auto_2630963 ) ( ON ?auto_2630964 ?auto_2630965 ) ( ON ?auto_2630966 ?auto_2630964 ) ( ON ?auto_2630967 ?auto_2630966 ) ( ON ?auto_2630968 ?auto_2630967 ) ( ON ?auto_2630969 ?auto_2630968 ) ( ON ?auto_2630970 ?auto_2630969 ) ( ON ?auto_2630971 ?auto_2630970 ) ( ON ?auto_2630972 ?auto_2630971 ) ( ON ?auto_2630973 ?auto_2630972 ) ( ON ?auto_2630974 ?auto_2630973 ) ( ON ?auto_2630975 ?auto_2630974 ) ( not ( = ?auto_2630961 ?auto_2630962 ) ) ( not ( = ?auto_2630961 ?auto_2630963 ) ) ( not ( = ?auto_2630961 ?auto_2630965 ) ) ( not ( = ?auto_2630961 ?auto_2630964 ) ) ( not ( = ?auto_2630961 ?auto_2630966 ) ) ( not ( = ?auto_2630961 ?auto_2630967 ) ) ( not ( = ?auto_2630961 ?auto_2630968 ) ) ( not ( = ?auto_2630961 ?auto_2630969 ) ) ( not ( = ?auto_2630961 ?auto_2630970 ) ) ( not ( = ?auto_2630961 ?auto_2630971 ) ) ( not ( = ?auto_2630961 ?auto_2630972 ) ) ( not ( = ?auto_2630961 ?auto_2630973 ) ) ( not ( = ?auto_2630961 ?auto_2630974 ) ) ( not ( = ?auto_2630961 ?auto_2630975 ) ) ( not ( = ?auto_2630961 ?auto_2630976 ) ) ( not ( = ?auto_2630961 ?auto_2630977 ) ) ( not ( = ?auto_2630961 ?auto_2630980 ) ) ( not ( = ?auto_2630962 ?auto_2630963 ) ) ( not ( = ?auto_2630962 ?auto_2630965 ) ) ( not ( = ?auto_2630962 ?auto_2630964 ) ) ( not ( = ?auto_2630962 ?auto_2630966 ) ) ( not ( = ?auto_2630962 ?auto_2630967 ) ) ( not ( = ?auto_2630962 ?auto_2630968 ) ) ( not ( = ?auto_2630962 ?auto_2630969 ) ) ( not ( = ?auto_2630962 ?auto_2630970 ) ) ( not ( = ?auto_2630962 ?auto_2630971 ) ) ( not ( = ?auto_2630962 ?auto_2630972 ) ) ( not ( = ?auto_2630962 ?auto_2630973 ) ) ( not ( = ?auto_2630962 ?auto_2630974 ) ) ( not ( = ?auto_2630962 ?auto_2630975 ) ) ( not ( = ?auto_2630962 ?auto_2630976 ) ) ( not ( = ?auto_2630962 ?auto_2630977 ) ) ( not ( = ?auto_2630962 ?auto_2630980 ) ) ( not ( = ?auto_2630963 ?auto_2630965 ) ) ( not ( = ?auto_2630963 ?auto_2630964 ) ) ( not ( = ?auto_2630963 ?auto_2630966 ) ) ( not ( = ?auto_2630963 ?auto_2630967 ) ) ( not ( = ?auto_2630963 ?auto_2630968 ) ) ( not ( = ?auto_2630963 ?auto_2630969 ) ) ( not ( = ?auto_2630963 ?auto_2630970 ) ) ( not ( = ?auto_2630963 ?auto_2630971 ) ) ( not ( = ?auto_2630963 ?auto_2630972 ) ) ( not ( = ?auto_2630963 ?auto_2630973 ) ) ( not ( = ?auto_2630963 ?auto_2630974 ) ) ( not ( = ?auto_2630963 ?auto_2630975 ) ) ( not ( = ?auto_2630963 ?auto_2630976 ) ) ( not ( = ?auto_2630963 ?auto_2630977 ) ) ( not ( = ?auto_2630963 ?auto_2630980 ) ) ( not ( = ?auto_2630965 ?auto_2630964 ) ) ( not ( = ?auto_2630965 ?auto_2630966 ) ) ( not ( = ?auto_2630965 ?auto_2630967 ) ) ( not ( = ?auto_2630965 ?auto_2630968 ) ) ( not ( = ?auto_2630965 ?auto_2630969 ) ) ( not ( = ?auto_2630965 ?auto_2630970 ) ) ( not ( = ?auto_2630965 ?auto_2630971 ) ) ( not ( = ?auto_2630965 ?auto_2630972 ) ) ( not ( = ?auto_2630965 ?auto_2630973 ) ) ( not ( = ?auto_2630965 ?auto_2630974 ) ) ( not ( = ?auto_2630965 ?auto_2630975 ) ) ( not ( = ?auto_2630965 ?auto_2630976 ) ) ( not ( = ?auto_2630965 ?auto_2630977 ) ) ( not ( = ?auto_2630965 ?auto_2630980 ) ) ( not ( = ?auto_2630964 ?auto_2630966 ) ) ( not ( = ?auto_2630964 ?auto_2630967 ) ) ( not ( = ?auto_2630964 ?auto_2630968 ) ) ( not ( = ?auto_2630964 ?auto_2630969 ) ) ( not ( = ?auto_2630964 ?auto_2630970 ) ) ( not ( = ?auto_2630964 ?auto_2630971 ) ) ( not ( = ?auto_2630964 ?auto_2630972 ) ) ( not ( = ?auto_2630964 ?auto_2630973 ) ) ( not ( = ?auto_2630964 ?auto_2630974 ) ) ( not ( = ?auto_2630964 ?auto_2630975 ) ) ( not ( = ?auto_2630964 ?auto_2630976 ) ) ( not ( = ?auto_2630964 ?auto_2630977 ) ) ( not ( = ?auto_2630964 ?auto_2630980 ) ) ( not ( = ?auto_2630966 ?auto_2630967 ) ) ( not ( = ?auto_2630966 ?auto_2630968 ) ) ( not ( = ?auto_2630966 ?auto_2630969 ) ) ( not ( = ?auto_2630966 ?auto_2630970 ) ) ( not ( = ?auto_2630966 ?auto_2630971 ) ) ( not ( = ?auto_2630966 ?auto_2630972 ) ) ( not ( = ?auto_2630966 ?auto_2630973 ) ) ( not ( = ?auto_2630966 ?auto_2630974 ) ) ( not ( = ?auto_2630966 ?auto_2630975 ) ) ( not ( = ?auto_2630966 ?auto_2630976 ) ) ( not ( = ?auto_2630966 ?auto_2630977 ) ) ( not ( = ?auto_2630966 ?auto_2630980 ) ) ( not ( = ?auto_2630967 ?auto_2630968 ) ) ( not ( = ?auto_2630967 ?auto_2630969 ) ) ( not ( = ?auto_2630967 ?auto_2630970 ) ) ( not ( = ?auto_2630967 ?auto_2630971 ) ) ( not ( = ?auto_2630967 ?auto_2630972 ) ) ( not ( = ?auto_2630967 ?auto_2630973 ) ) ( not ( = ?auto_2630967 ?auto_2630974 ) ) ( not ( = ?auto_2630967 ?auto_2630975 ) ) ( not ( = ?auto_2630967 ?auto_2630976 ) ) ( not ( = ?auto_2630967 ?auto_2630977 ) ) ( not ( = ?auto_2630967 ?auto_2630980 ) ) ( not ( = ?auto_2630968 ?auto_2630969 ) ) ( not ( = ?auto_2630968 ?auto_2630970 ) ) ( not ( = ?auto_2630968 ?auto_2630971 ) ) ( not ( = ?auto_2630968 ?auto_2630972 ) ) ( not ( = ?auto_2630968 ?auto_2630973 ) ) ( not ( = ?auto_2630968 ?auto_2630974 ) ) ( not ( = ?auto_2630968 ?auto_2630975 ) ) ( not ( = ?auto_2630968 ?auto_2630976 ) ) ( not ( = ?auto_2630968 ?auto_2630977 ) ) ( not ( = ?auto_2630968 ?auto_2630980 ) ) ( not ( = ?auto_2630969 ?auto_2630970 ) ) ( not ( = ?auto_2630969 ?auto_2630971 ) ) ( not ( = ?auto_2630969 ?auto_2630972 ) ) ( not ( = ?auto_2630969 ?auto_2630973 ) ) ( not ( = ?auto_2630969 ?auto_2630974 ) ) ( not ( = ?auto_2630969 ?auto_2630975 ) ) ( not ( = ?auto_2630969 ?auto_2630976 ) ) ( not ( = ?auto_2630969 ?auto_2630977 ) ) ( not ( = ?auto_2630969 ?auto_2630980 ) ) ( not ( = ?auto_2630970 ?auto_2630971 ) ) ( not ( = ?auto_2630970 ?auto_2630972 ) ) ( not ( = ?auto_2630970 ?auto_2630973 ) ) ( not ( = ?auto_2630970 ?auto_2630974 ) ) ( not ( = ?auto_2630970 ?auto_2630975 ) ) ( not ( = ?auto_2630970 ?auto_2630976 ) ) ( not ( = ?auto_2630970 ?auto_2630977 ) ) ( not ( = ?auto_2630970 ?auto_2630980 ) ) ( not ( = ?auto_2630971 ?auto_2630972 ) ) ( not ( = ?auto_2630971 ?auto_2630973 ) ) ( not ( = ?auto_2630971 ?auto_2630974 ) ) ( not ( = ?auto_2630971 ?auto_2630975 ) ) ( not ( = ?auto_2630971 ?auto_2630976 ) ) ( not ( = ?auto_2630971 ?auto_2630977 ) ) ( not ( = ?auto_2630971 ?auto_2630980 ) ) ( not ( = ?auto_2630972 ?auto_2630973 ) ) ( not ( = ?auto_2630972 ?auto_2630974 ) ) ( not ( = ?auto_2630972 ?auto_2630975 ) ) ( not ( = ?auto_2630972 ?auto_2630976 ) ) ( not ( = ?auto_2630972 ?auto_2630977 ) ) ( not ( = ?auto_2630972 ?auto_2630980 ) ) ( not ( = ?auto_2630973 ?auto_2630974 ) ) ( not ( = ?auto_2630973 ?auto_2630975 ) ) ( not ( = ?auto_2630973 ?auto_2630976 ) ) ( not ( = ?auto_2630973 ?auto_2630977 ) ) ( not ( = ?auto_2630973 ?auto_2630980 ) ) ( not ( = ?auto_2630974 ?auto_2630975 ) ) ( not ( = ?auto_2630974 ?auto_2630976 ) ) ( not ( = ?auto_2630974 ?auto_2630977 ) ) ( not ( = ?auto_2630974 ?auto_2630980 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2630975 ?auto_2630976 ?auto_2630977 )
      ( MAKE-16CRATE-VERIFY ?auto_2630961 ?auto_2630962 ?auto_2630963 ?auto_2630965 ?auto_2630964 ?auto_2630966 ?auto_2630967 ?auto_2630968 ?auto_2630969 ?auto_2630970 ?auto_2630971 ?auto_2630972 ?auto_2630973 ?auto_2630974 ?auto_2630975 ?auto_2630976 ?auto_2630977 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2631210 - SURFACE
      ?auto_2631211 - SURFACE
      ?auto_2631212 - SURFACE
      ?auto_2631214 - SURFACE
      ?auto_2631213 - SURFACE
      ?auto_2631215 - SURFACE
      ?auto_2631216 - SURFACE
      ?auto_2631217 - SURFACE
      ?auto_2631218 - SURFACE
      ?auto_2631219 - SURFACE
      ?auto_2631220 - SURFACE
      ?auto_2631221 - SURFACE
      ?auto_2631222 - SURFACE
      ?auto_2631223 - SURFACE
      ?auto_2631224 - SURFACE
      ?auto_2631225 - SURFACE
      ?auto_2631226 - SURFACE
    )
    :vars
    (
      ?auto_2631231 - HOIST
      ?auto_2631227 - PLACE
      ?auto_2631229 - PLACE
      ?auto_2631228 - HOIST
      ?auto_2631232 - SURFACE
      ?auto_2631230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2631231 ?auto_2631227 ) ( IS-CRATE ?auto_2631226 ) ( not ( = ?auto_2631225 ?auto_2631226 ) ) ( not ( = ?auto_2631224 ?auto_2631225 ) ) ( not ( = ?auto_2631224 ?auto_2631226 ) ) ( not ( = ?auto_2631229 ?auto_2631227 ) ) ( HOIST-AT ?auto_2631228 ?auto_2631229 ) ( not ( = ?auto_2631231 ?auto_2631228 ) ) ( AVAILABLE ?auto_2631228 ) ( SURFACE-AT ?auto_2631226 ?auto_2631229 ) ( ON ?auto_2631226 ?auto_2631232 ) ( CLEAR ?auto_2631226 ) ( not ( = ?auto_2631225 ?auto_2631232 ) ) ( not ( = ?auto_2631226 ?auto_2631232 ) ) ( not ( = ?auto_2631224 ?auto_2631232 ) ) ( TRUCK-AT ?auto_2631230 ?auto_2631227 ) ( SURFACE-AT ?auto_2631224 ?auto_2631227 ) ( CLEAR ?auto_2631224 ) ( LIFTING ?auto_2631231 ?auto_2631225 ) ( IS-CRATE ?auto_2631225 ) ( ON ?auto_2631211 ?auto_2631210 ) ( ON ?auto_2631212 ?auto_2631211 ) ( ON ?auto_2631214 ?auto_2631212 ) ( ON ?auto_2631213 ?auto_2631214 ) ( ON ?auto_2631215 ?auto_2631213 ) ( ON ?auto_2631216 ?auto_2631215 ) ( ON ?auto_2631217 ?auto_2631216 ) ( ON ?auto_2631218 ?auto_2631217 ) ( ON ?auto_2631219 ?auto_2631218 ) ( ON ?auto_2631220 ?auto_2631219 ) ( ON ?auto_2631221 ?auto_2631220 ) ( ON ?auto_2631222 ?auto_2631221 ) ( ON ?auto_2631223 ?auto_2631222 ) ( ON ?auto_2631224 ?auto_2631223 ) ( not ( = ?auto_2631210 ?auto_2631211 ) ) ( not ( = ?auto_2631210 ?auto_2631212 ) ) ( not ( = ?auto_2631210 ?auto_2631214 ) ) ( not ( = ?auto_2631210 ?auto_2631213 ) ) ( not ( = ?auto_2631210 ?auto_2631215 ) ) ( not ( = ?auto_2631210 ?auto_2631216 ) ) ( not ( = ?auto_2631210 ?auto_2631217 ) ) ( not ( = ?auto_2631210 ?auto_2631218 ) ) ( not ( = ?auto_2631210 ?auto_2631219 ) ) ( not ( = ?auto_2631210 ?auto_2631220 ) ) ( not ( = ?auto_2631210 ?auto_2631221 ) ) ( not ( = ?auto_2631210 ?auto_2631222 ) ) ( not ( = ?auto_2631210 ?auto_2631223 ) ) ( not ( = ?auto_2631210 ?auto_2631224 ) ) ( not ( = ?auto_2631210 ?auto_2631225 ) ) ( not ( = ?auto_2631210 ?auto_2631226 ) ) ( not ( = ?auto_2631210 ?auto_2631232 ) ) ( not ( = ?auto_2631211 ?auto_2631212 ) ) ( not ( = ?auto_2631211 ?auto_2631214 ) ) ( not ( = ?auto_2631211 ?auto_2631213 ) ) ( not ( = ?auto_2631211 ?auto_2631215 ) ) ( not ( = ?auto_2631211 ?auto_2631216 ) ) ( not ( = ?auto_2631211 ?auto_2631217 ) ) ( not ( = ?auto_2631211 ?auto_2631218 ) ) ( not ( = ?auto_2631211 ?auto_2631219 ) ) ( not ( = ?auto_2631211 ?auto_2631220 ) ) ( not ( = ?auto_2631211 ?auto_2631221 ) ) ( not ( = ?auto_2631211 ?auto_2631222 ) ) ( not ( = ?auto_2631211 ?auto_2631223 ) ) ( not ( = ?auto_2631211 ?auto_2631224 ) ) ( not ( = ?auto_2631211 ?auto_2631225 ) ) ( not ( = ?auto_2631211 ?auto_2631226 ) ) ( not ( = ?auto_2631211 ?auto_2631232 ) ) ( not ( = ?auto_2631212 ?auto_2631214 ) ) ( not ( = ?auto_2631212 ?auto_2631213 ) ) ( not ( = ?auto_2631212 ?auto_2631215 ) ) ( not ( = ?auto_2631212 ?auto_2631216 ) ) ( not ( = ?auto_2631212 ?auto_2631217 ) ) ( not ( = ?auto_2631212 ?auto_2631218 ) ) ( not ( = ?auto_2631212 ?auto_2631219 ) ) ( not ( = ?auto_2631212 ?auto_2631220 ) ) ( not ( = ?auto_2631212 ?auto_2631221 ) ) ( not ( = ?auto_2631212 ?auto_2631222 ) ) ( not ( = ?auto_2631212 ?auto_2631223 ) ) ( not ( = ?auto_2631212 ?auto_2631224 ) ) ( not ( = ?auto_2631212 ?auto_2631225 ) ) ( not ( = ?auto_2631212 ?auto_2631226 ) ) ( not ( = ?auto_2631212 ?auto_2631232 ) ) ( not ( = ?auto_2631214 ?auto_2631213 ) ) ( not ( = ?auto_2631214 ?auto_2631215 ) ) ( not ( = ?auto_2631214 ?auto_2631216 ) ) ( not ( = ?auto_2631214 ?auto_2631217 ) ) ( not ( = ?auto_2631214 ?auto_2631218 ) ) ( not ( = ?auto_2631214 ?auto_2631219 ) ) ( not ( = ?auto_2631214 ?auto_2631220 ) ) ( not ( = ?auto_2631214 ?auto_2631221 ) ) ( not ( = ?auto_2631214 ?auto_2631222 ) ) ( not ( = ?auto_2631214 ?auto_2631223 ) ) ( not ( = ?auto_2631214 ?auto_2631224 ) ) ( not ( = ?auto_2631214 ?auto_2631225 ) ) ( not ( = ?auto_2631214 ?auto_2631226 ) ) ( not ( = ?auto_2631214 ?auto_2631232 ) ) ( not ( = ?auto_2631213 ?auto_2631215 ) ) ( not ( = ?auto_2631213 ?auto_2631216 ) ) ( not ( = ?auto_2631213 ?auto_2631217 ) ) ( not ( = ?auto_2631213 ?auto_2631218 ) ) ( not ( = ?auto_2631213 ?auto_2631219 ) ) ( not ( = ?auto_2631213 ?auto_2631220 ) ) ( not ( = ?auto_2631213 ?auto_2631221 ) ) ( not ( = ?auto_2631213 ?auto_2631222 ) ) ( not ( = ?auto_2631213 ?auto_2631223 ) ) ( not ( = ?auto_2631213 ?auto_2631224 ) ) ( not ( = ?auto_2631213 ?auto_2631225 ) ) ( not ( = ?auto_2631213 ?auto_2631226 ) ) ( not ( = ?auto_2631213 ?auto_2631232 ) ) ( not ( = ?auto_2631215 ?auto_2631216 ) ) ( not ( = ?auto_2631215 ?auto_2631217 ) ) ( not ( = ?auto_2631215 ?auto_2631218 ) ) ( not ( = ?auto_2631215 ?auto_2631219 ) ) ( not ( = ?auto_2631215 ?auto_2631220 ) ) ( not ( = ?auto_2631215 ?auto_2631221 ) ) ( not ( = ?auto_2631215 ?auto_2631222 ) ) ( not ( = ?auto_2631215 ?auto_2631223 ) ) ( not ( = ?auto_2631215 ?auto_2631224 ) ) ( not ( = ?auto_2631215 ?auto_2631225 ) ) ( not ( = ?auto_2631215 ?auto_2631226 ) ) ( not ( = ?auto_2631215 ?auto_2631232 ) ) ( not ( = ?auto_2631216 ?auto_2631217 ) ) ( not ( = ?auto_2631216 ?auto_2631218 ) ) ( not ( = ?auto_2631216 ?auto_2631219 ) ) ( not ( = ?auto_2631216 ?auto_2631220 ) ) ( not ( = ?auto_2631216 ?auto_2631221 ) ) ( not ( = ?auto_2631216 ?auto_2631222 ) ) ( not ( = ?auto_2631216 ?auto_2631223 ) ) ( not ( = ?auto_2631216 ?auto_2631224 ) ) ( not ( = ?auto_2631216 ?auto_2631225 ) ) ( not ( = ?auto_2631216 ?auto_2631226 ) ) ( not ( = ?auto_2631216 ?auto_2631232 ) ) ( not ( = ?auto_2631217 ?auto_2631218 ) ) ( not ( = ?auto_2631217 ?auto_2631219 ) ) ( not ( = ?auto_2631217 ?auto_2631220 ) ) ( not ( = ?auto_2631217 ?auto_2631221 ) ) ( not ( = ?auto_2631217 ?auto_2631222 ) ) ( not ( = ?auto_2631217 ?auto_2631223 ) ) ( not ( = ?auto_2631217 ?auto_2631224 ) ) ( not ( = ?auto_2631217 ?auto_2631225 ) ) ( not ( = ?auto_2631217 ?auto_2631226 ) ) ( not ( = ?auto_2631217 ?auto_2631232 ) ) ( not ( = ?auto_2631218 ?auto_2631219 ) ) ( not ( = ?auto_2631218 ?auto_2631220 ) ) ( not ( = ?auto_2631218 ?auto_2631221 ) ) ( not ( = ?auto_2631218 ?auto_2631222 ) ) ( not ( = ?auto_2631218 ?auto_2631223 ) ) ( not ( = ?auto_2631218 ?auto_2631224 ) ) ( not ( = ?auto_2631218 ?auto_2631225 ) ) ( not ( = ?auto_2631218 ?auto_2631226 ) ) ( not ( = ?auto_2631218 ?auto_2631232 ) ) ( not ( = ?auto_2631219 ?auto_2631220 ) ) ( not ( = ?auto_2631219 ?auto_2631221 ) ) ( not ( = ?auto_2631219 ?auto_2631222 ) ) ( not ( = ?auto_2631219 ?auto_2631223 ) ) ( not ( = ?auto_2631219 ?auto_2631224 ) ) ( not ( = ?auto_2631219 ?auto_2631225 ) ) ( not ( = ?auto_2631219 ?auto_2631226 ) ) ( not ( = ?auto_2631219 ?auto_2631232 ) ) ( not ( = ?auto_2631220 ?auto_2631221 ) ) ( not ( = ?auto_2631220 ?auto_2631222 ) ) ( not ( = ?auto_2631220 ?auto_2631223 ) ) ( not ( = ?auto_2631220 ?auto_2631224 ) ) ( not ( = ?auto_2631220 ?auto_2631225 ) ) ( not ( = ?auto_2631220 ?auto_2631226 ) ) ( not ( = ?auto_2631220 ?auto_2631232 ) ) ( not ( = ?auto_2631221 ?auto_2631222 ) ) ( not ( = ?auto_2631221 ?auto_2631223 ) ) ( not ( = ?auto_2631221 ?auto_2631224 ) ) ( not ( = ?auto_2631221 ?auto_2631225 ) ) ( not ( = ?auto_2631221 ?auto_2631226 ) ) ( not ( = ?auto_2631221 ?auto_2631232 ) ) ( not ( = ?auto_2631222 ?auto_2631223 ) ) ( not ( = ?auto_2631222 ?auto_2631224 ) ) ( not ( = ?auto_2631222 ?auto_2631225 ) ) ( not ( = ?auto_2631222 ?auto_2631226 ) ) ( not ( = ?auto_2631222 ?auto_2631232 ) ) ( not ( = ?auto_2631223 ?auto_2631224 ) ) ( not ( = ?auto_2631223 ?auto_2631225 ) ) ( not ( = ?auto_2631223 ?auto_2631226 ) ) ( not ( = ?auto_2631223 ?auto_2631232 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2631224 ?auto_2631225 ?auto_2631226 )
      ( MAKE-16CRATE-VERIFY ?auto_2631210 ?auto_2631211 ?auto_2631212 ?auto_2631214 ?auto_2631213 ?auto_2631215 ?auto_2631216 ?auto_2631217 ?auto_2631218 ?auto_2631219 ?auto_2631220 ?auto_2631221 ?auto_2631222 ?auto_2631223 ?auto_2631224 ?auto_2631225 ?auto_2631226 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2631459 - SURFACE
      ?auto_2631460 - SURFACE
      ?auto_2631461 - SURFACE
      ?auto_2631463 - SURFACE
      ?auto_2631462 - SURFACE
      ?auto_2631464 - SURFACE
      ?auto_2631465 - SURFACE
      ?auto_2631466 - SURFACE
      ?auto_2631467 - SURFACE
      ?auto_2631468 - SURFACE
      ?auto_2631469 - SURFACE
      ?auto_2631470 - SURFACE
      ?auto_2631471 - SURFACE
      ?auto_2631472 - SURFACE
      ?auto_2631473 - SURFACE
      ?auto_2631474 - SURFACE
      ?auto_2631475 - SURFACE
    )
    :vars
    (
      ?auto_2631480 - HOIST
      ?auto_2631481 - PLACE
      ?auto_2631479 - PLACE
      ?auto_2631476 - HOIST
      ?auto_2631478 - SURFACE
      ?auto_2631477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2631480 ?auto_2631481 ) ( IS-CRATE ?auto_2631475 ) ( not ( = ?auto_2631474 ?auto_2631475 ) ) ( not ( = ?auto_2631473 ?auto_2631474 ) ) ( not ( = ?auto_2631473 ?auto_2631475 ) ) ( not ( = ?auto_2631479 ?auto_2631481 ) ) ( HOIST-AT ?auto_2631476 ?auto_2631479 ) ( not ( = ?auto_2631480 ?auto_2631476 ) ) ( AVAILABLE ?auto_2631476 ) ( SURFACE-AT ?auto_2631475 ?auto_2631479 ) ( ON ?auto_2631475 ?auto_2631478 ) ( CLEAR ?auto_2631475 ) ( not ( = ?auto_2631474 ?auto_2631478 ) ) ( not ( = ?auto_2631475 ?auto_2631478 ) ) ( not ( = ?auto_2631473 ?auto_2631478 ) ) ( TRUCK-AT ?auto_2631477 ?auto_2631481 ) ( SURFACE-AT ?auto_2631473 ?auto_2631481 ) ( CLEAR ?auto_2631473 ) ( IS-CRATE ?auto_2631474 ) ( AVAILABLE ?auto_2631480 ) ( IN ?auto_2631474 ?auto_2631477 ) ( ON ?auto_2631460 ?auto_2631459 ) ( ON ?auto_2631461 ?auto_2631460 ) ( ON ?auto_2631463 ?auto_2631461 ) ( ON ?auto_2631462 ?auto_2631463 ) ( ON ?auto_2631464 ?auto_2631462 ) ( ON ?auto_2631465 ?auto_2631464 ) ( ON ?auto_2631466 ?auto_2631465 ) ( ON ?auto_2631467 ?auto_2631466 ) ( ON ?auto_2631468 ?auto_2631467 ) ( ON ?auto_2631469 ?auto_2631468 ) ( ON ?auto_2631470 ?auto_2631469 ) ( ON ?auto_2631471 ?auto_2631470 ) ( ON ?auto_2631472 ?auto_2631471 ) ( ON ?auto_2631473 ?auto_2631472 ) ( not ( = ?auto_2631459 ?auto_2631460 ) ) ( not ( = ?auto_2631459 ?auto_2631461 ) ) ( not ( = ?auto_2631459 ?auto_2631463 ) ) ( not ( = ?auto_2631459 ?auto_2631462 ) ) ( not ( = ?auto_2631459 ?auto_2631464 ) ) ( not ( = ?auto_2631459 ?auto_2631465 ) ) ( not ( = ?auto_2631459 ?auto_2631466 ) ) ( not ( = ?auto_2631459 ?auto_2631467 ) ) ( not ( = ?auto_2631459 ?auto_2631468 ) ) ( not ( = ?auto_2631459 ?auto_2631469 ) ) ( not ( = ?auto_2631459 ?auto_2631470 ) ) ( not ( = ?auto_2631459 ?auto_2631471 ) ) ( not ( = ?auto_2631459 ?auto_2631472 ) ) ( not ( = ?auto_2631459 ?auto_2631473 ) ) ( not ( = ?auto_2631459 ?auto_2631474 ) ) ( not ( = ?auto_2631459 ?auto_2631475 ) ) ( not ( = ?auto_2631459 ?auto_2631478 ) ) ( not ( = ?auto_2631460 ?auto_2631461 ) ) ( not ( = ?auto_2631460 ?auto_2631463 ) ) ( not ( = ?auto_2631460 ?auto_2631462 ) ) ( not ( = ?auto_2631460 ?auto_2631464 ) ) ( not ( = ?auto_2631460 ?auto_2631465 ) ) ( not ( = ?auto_2631460 ?auto_2631466 ) ) ( not ( = ?auto_2631460 ?auto_2631467 ) ) ( not ( = ?auto_2631460 ?auto_2631468 ) ) ( not ( = ?auto_2631460 ?auto_2631469 ) ) ( not ( = ?auto_2631460 ?auto_2631470 ) ) ( not ( = ?auto_2631460 ?auto_2631471 ) ) ( not ( = ?auto_2631460 ?auto_2631472 ) ) ( not ( = ?auto_2631460 ?auto_2631473 ) ) ( not ( = ?auto_2631460 ?auto_2631474 ) ) ( not ( = ?auto_2631460 ?auto_2631475 ) ) ( not ( = ?auto_2631460 ?auto_2631478 ) ) ( not ( = ?auto_2631461 ?auto_2631463 ) ) ( not ( = ?auto_2631461 ?auto_2631462 ) ) ( not ( = ?auto_2631461 ?auto_2631464 ) ) ( not ( = ?auto_2631461 ?auto_2631465 ) ) ( not ( = ?auto_2631461 ?auto_2631466 ) ) ( not ( = ?auto_2631461 ?auto_2631467 ) ) ( not ( = ?auto_2631461 ?auto_2631468 ) ) ( not ( = ?auto_2631461 ?auto_2631469 ) ) ( not ( = ?auto_2631461 ?auto_2631470 ) ) ( not ( = ?auto_2631461 ?auto_2631471 ) ) ( not ( = ?auto_2631461 ?auto_2631472 ) ) ( not ( = ?auto_2631461 ?auto_2631473 ) ) ( not ( = ?auto_2631461 ?auto_2631474 ) ) ( not ( = ?auto_2631461 ?auto_2631475 ) ) ( not ( = ?auto_2631461 ?auto_2631478 ) ) ( not ( = ?auto_2631463 ?auto_2631462 ) ) ( not ( = ?auto_2631463 ?auto_2631464 ) ) ( not ( = ?auto_2631463 ?auto_2631465 ) ) ( not ( = ?auto_2631463 ?auto_2631466 ) ) ( not ( = ?auto_2631463 ?auto_2631467 ) ) ( not ( = ?auto_2631463 ?auto_2631468 ) ) ( not ( = ?auto_2631463 ?auto_2631469 ) ) ( not ( = ?auto_2631463 ?auto_2631470 ) ) ( not ( = ?auto_2631463 ?auto_2631471 ) ) ( not ( = ?auto_2631463 ?auto_2631472 ) ) ( not ( = ?auto_2631463 ?auto_2631473 ) ) ( not ( = ?auto_2631463 ?auto_2631474 ) ) ( not ( = ?auto_2631463 ?auto_2631475 ) ) ( not ( = ?auto_2631463 ?auto_2631478 ) ) ( not ( = ?auto_2631462 ?auto_2631464 ) ) ( not ( = ?auto_2631462 ?auto_2631465 ) ) ( not ( = ?auto_2631462 ?auto_2631466 ) ) ( not ( = ?auto_2631462 ?auto_2631467 ) ) ( not ( = ?auto_2631462 ?auto_2631468 ) ) ( not ( = ?auto_2631462 ?auto_2631469 ) ) ( not ( = ?auto_2631462 ?auto_2631470 ) ) ( not ( = ?auto_2631462 ?auto_2631471 ) ) ( not ( = ?auto_2631462 ?auto_2631472 ) ) ( not ( = ?auto_2631462 ?auto_2631473 ) ) ( not ( = ?auto_2631462 ?auto_2631474 ) ) ( not ( = ?auto_2631462 ?auto_2631475 ) ) ( not ( = ?auto_2631462 ?auto_2631478 ) ) ( not ( = ?auto_2631464 ?auto_2631465 ) ) ( not ( = ?auto_2631464 ?auto_2631466 ) ) ( not ( = ?auto_2631464 ?auto_2631467 ) ) ( not ( = ?auto_2631464 ?auto_2631468 ) ) ( not ( = ?auto_2631464 ?auto_2631469 ) ) ( not ( = ?auto_2631464 ?auto_2631470 ) ) ( not ( = ?auto_2631464 ?auto_2631471 ) ) ( not ( = ?auto_2631464 ?auto_2631472 ) ) ( not ( = ?auto_2631464 ?auto_2631473 ) ) ( not ( = ?auto_2631464 ?auto_2631474 ) ) ( not ( = ?auto_2631464 ?auto_2631475 ) ) ( not ( = ?auto_2631464 ?auto_2631478 ) ) ( not ( = ?auto_2631465 ?auto_2631466 ) ) ( not ( = ?auto_2631465 ?auto_2631467 ) ) ( not ( = ?auto_2631465 ?auto_2631468 ) ) ( not ( = ?auto_2631465 ?auto_2631469 ) ) ( not ( = ?auto_2631465 ?auto_2631470 ) ) ( not ( = ?auto_2631465 ?auto_2631471 ) ) ( not ( = ?auto_2631465 ?auto_2631472 ) ) ( not ( = ?auto_2631465 ?auto_2631473 ) ) ( not ( = ?auto_2631465 ?auto_2631474 ) ) ( not ( = ?auto_2631465 ?auto_2631475 ) ) ( not ( = ?auto_2631465 ?auto_2631478 ) ) ( not ( = ?auto_2631466 ?auto_2631467 ) ) ( not ( = ?auto_2631466 ?auto_2631468 ) ) ( not ( = ?auto_2631466 ?auto_2631469 ) ) ( not ( = ?auto_2631466 ?auto_2631470 ) ) ( not ( = ?auto_2631466 ?auto_2631471 ) ) ( not ( = ?auto_2631466 ?auto_2631472 ) ) ( not ( = ?auto_2631466 ?auto_2631473 ) ) ( not ( = ?auto_2631466 ?auto_2631474 ) ) ( not ( = ?auto_2631466 ?auto_2631475 ) ) ( not ( = ?auto_2631466 ?auto_2631478 ) ) ( not ( = ?auto_2631467 ?auto_2631468 ) ) ( not ( = ?auto_2631467 ?auto_2631469 ) ) ( not ( = ?auto_2631467 ?auto_2631470 ) ) ( not ( = ?auto_2631467 ?auto_2631471 ) ) ( not ( = ?auto_2631467 ?auto_2631472 ) ) ( not ( = ?auto_2631467 ?auto_2631473 ) ) ( not ( = ?auto_2631467 ?auto_2631474 ) ) ( not ( = ?auto_2631467 ?auto_2631475 ) ) ( not ( = ?auto_2631467 ?auto_2631478 ) ) ( not ( = ?auto_2631468 ?auto_2631469 ) ) ( not ( = ?auto_2631468 ?auto_2631470 ) ) ( not ( = ?auto_2631468 ?auto_2631471 ) ) ( not ( = ?auto_2631468 ?auto_2631472 ) ) ( not ( = ?auto_2631468 ?auto_2631473 ) ) ( not ( = ?auto_2631468 ?auto_2631474 ) ) ( not ( = ?auto_2631468 ?auto_2631475 ) ) ( not ( = ?auto_2631468 ?auto_2631478 ) ) ( not ( = ?auto_2631469 ?auto_2631470 ) ) ( not ( = ?auto_2631469 ?auto_2631471 ) ) ( not ( = ?auto_2631469 ?auto_2631472 ) ) ( not ( = ?auto_2631469 ?auto_2631473 ) ) ( not ( = ?auto_2631469 ?auto_2631474 ) ) ( not ( = ?auto_2631469 ?auto_2631475 ) ) ( not ( = ?auto_2631469 ?auto_2631478 ) ) ( not ( = ?auto_2631470 ?auto_2631471 ) ) ( not ( = ?auto_2631470 ?auto_2631472 ) ) ( not ( = ?auto_2631470 ?auto_2631473 ) ) ( not ( = ?auto_2631470 ?auto_2631474 ) ) ( not ( = ?auto_2631470 ?auto_2631475 ) ) ( not ( = ?auto_2631470 ?auto_2631478 ) ) ( not ( = ?auto_2631471 ?auto_2631472 ) ) ( not ( = ?auto_2631471 ?auto_2631473 ) ) ( not ( = ?auto_2631471 ?auto_2631474 ) ) ( not ( = ?auto_2631471 ?auto_2631475 ) ) ( not ( = ?auto_2631471 ?auto_2631478 ) ) ( not ( = ?auto_2631472 ?auto_2631473 ) ) ( not ( = ?auto_2631472 ?auto_2631474 ) ) ( not ( = ?auto_2631472 ?auto_2631475 ) ) ( not ( = ?auto_2631472 ?auto_2631478 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2631473 ?auto_2631474 ?auto_2631475 )
      ( MAKE-16CRATE-VERIFY ?auto_2631459 ?auto_2631460 ?auto_2631461 ?auto_2631463 ?auto_2631462 ?auto_2631464 ?auto_2631465 ?auto_2631466 ?auto_2631467 ?auto_2631468 ?auto_2631469 ?auto_2631470 ?auto_2631471 ?auto_2631472 ?auto_2631473 ?auto_2631474 ?auto_2631475 ) )
  )

)

