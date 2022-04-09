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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915071 - SURFACE
      ?auto_1915072 - SURFACE
    )
    :vars
    (
      ?auto_1915073 - HOIST
      ?auto_1915074 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915073 ?auto_1915074 ) ( SURFACE-AT ?auto_1915071 ?auto_1915074 ) ( CLEAR ?auto_1915071 ) ( LIFTING ?auto_1915073 ?auto_1915072 ) ( IS-CRATE ?auto_1915072 ) ( not ( = ?auto_1915071 ?auto_1915072 ) ) )
    :subtasks
    ( ( !DROP ?auto_1915073 ?auto_1915072 ?auto_1915071 ?auto_1915074 )
      ( MAKE-1CRATE-VERIFY ?auto_1915071 ?auto_1915072 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915075 - SURFACE
      ?auto_1915076 - SURFACE
    )
    :vars
    (
      ?auto_1915078 - HOIST
      ?auto_1915077 - PLACE
      ?auto_1915079 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915078 ?auto_1915077 ) ( SURFACE-AT ?auto_1915075 ?auto_1915077 ) ( CLEAR ?auto_1915075 ) ( IS-CRATE ?auto_1915076 ) ( not ( = ?auto_1915075 ?auto_1915076 ) ) ( TRUCK-AT ?auto_1915079 ?auto_1915077 ) ( AVAILABLE ?auto_1915078 ) ( IN ?auto_1915076 ?auto_1915079 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1915078 ?auto_1915076 ?auto_1915079 ?auto_1915077 )
      ( MAKE-1CRATE ?auto_1915075 ?auto_1915076 )
      ( MAKE-1CRATE-VERIFY ?auto_1915075 ?auto_1915076 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915080 - SURFACE
      ?auto_1915081 - SURFACE
    )
    :vars
    (
      ?auto_1915083 - HOIST
      ?auto_1915084 - PLACE
      ?auto_1915082 - TRUCK
      ?auto_1915085 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915083 ?auto_1915084 ) ( SURFACE-AT ?auto_1915080 ?auto_1915084 ) ( CLEAR ?auto_1915080 ) ( IS-CRATE ?auto_1915081 ) ( not ( = ?auto_1915080 ?auto_1915081 ) ) ( AVAILABLE ?auto_1915083 ) ( IN ?auto_1915081 ?auto_1915082 ) ( TRUCK-AT ?auto_1915082 ?auto_1915085 ) ( not ( = ?auto_1915085 ?auto_1915084 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1915082 ?auto_1915085 ?auto_1915084 )
      ( MAKE-1CRATE ?auto_1915080 ?auto_1915081 )
      ( MAKE-1CRATE-VERIFY ?auto_1915080 ?auto_1915081 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915086 - SURFACE
      ?auto_1915087 - SURFACE
    )
    :vars
    (
      ?auto_1915091 - HOIST
      ?auto_1915088 - PLACE
      ?auto_1915090 - TRUCK
      ?auto_1915089 - PLACE
      ?auto_1915092 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915091 ?auto_1915088 ) ( SURFACE-AT ?auto_1915086 ?auto_1915088 ) ( CLEAR ?auto_1915086 ) ( IS-CRATE ?auto_1915087 ) ( not ( = ?auto_1915086 ?auto_1915087 ) ) ( AVAILABLE ?auto_1915091 ) ( TRUCK-AT ?auto_1915090 ?auto_1915089 ) ( not ( = ?auto_1915089 ?auto_1915088 ) ) ( HOIST-AT ?auto_1915092 ?auto_1915089 ) ( LIFTING ?auto_1915092 ?auto_1915087 ) ( not ( = ?auto_1915091 ?auto_1915092 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1915092 ?auto_1915087 ?auto_1915090 ?auto_1915089 )
      ( MAKE-1CRATE ?auto_1915086 ?auto_1915087 )
      ( MAKE-1CRATE-VERIFY ?auto_1915086 ?auto_1915087 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915093 - SURFACE
      ?auto_1915094 - SURFACE
    )
    :vars
    (
      ?auto_1915098 - HOIST
      ?auto_1915095 - PLACE
      ?auto_1915097 - TRUCK
      ?auto_1915096 - PLACE
      ?auto_1915099 - HOIST
      ?auto_1915100 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915098 ?auto_1915095 ) ( SURFACE-AT ?auto_1915093 ?auto_1915095 ) ( CLEAR ?auto_1915093 ) ( IS-CRATE ?auto_1915094 ) ( not ( = ?auto_1915093 ?auto_1915094 ) ) ( AVAILABLE ?auto_1915098 ) ( TRUCK-AT ?auto_1915097 ?auto_1915096 ) ( not ( = ?auto_1915096 ?auto_1915095 ) ) ( HOIST-AT ?auto_1915099 ?auto_1915096 ) ( not ( = ?auto_1915098 ?auto_1915099 ) ) ( AVAILABLE ?auto_1915099 ) ( SURFACE-AT ?auto_1915094 ?auto_1915096 ) ( ON ?auto_1915094 ?auto_1915100 ) ( CLEAR ?auto_1915094 ) ( not ( = ?auto_1915093 ?auto_1915100 ) ) ( not ( = ?auto_1915094 ?auto_1915100 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1915099 ?auto_1915094 ?auto_1915100 ?auto_1915096 )
      ( MAKE-1CRATE ?auto_1915093 ?auto_1915094 )
      ( MAKE-1CRATE-VERIFY ?auto_1915093 ?auto_1915094 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915101 - SURFACE
      ?auto_1915102 - SURFACE
    )
    :vars
    (
      ?auto_1915106 - HOIST
      ?auto_1915104 - PLACE
      ?auto_1915105 - PLACE
      ?auto_1915103 - HOIST
      ?auto_1915108 - SURFACE
      ?auto_1915107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915106 ?auto_1915104 ) ( SURFACE-AT ?auto_1915101 ?auto_1915104 ) ( CLEAR ?auto_1915101 ) ( IS-CRATE ?auto_1915102 ) ( not ( = ?auto_1915101 ?auto_1915102 ) ) ( AVAILABLE ?auto_1915106 ) ( not ( = ?auto_1915105 ?auto_1915104 ) ) ( HOIST-AT ?auto_1915103 ?auto_1915105 ) ( not ( = ?auto_1915106 ?auto_1915103 ) ) ( AVAILABLE ?auto_1915103 ) ( SURFACE-AT ?auto_1915102 ?auto_1915105 ) ( ON ?auto_1915102 ?auto_1915108 ) ( CLEAR ?auto_1915102 ) ( not ( = ?auto_1915101 ?auto_1915108 ) ) ( not ( = ?auto_1915102 ?auto_1915108 ) ) ( TRUCK-AT ?auto_1915107 ?auto_1915104 ) )
    :subtasks
    ( ( !DRIVE ?auto_1915107 ?auto_1915104 ?auto_1915105 )
      ( MAKE-1CRATE ?auto_1915101 ?auto_1915102 )
      ( MAKE-1CRATE-VERIFY ?auto_1915101 ?auto_1915102 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915118 - SURFACE
      ?auto_1915119 - SURFACE
      ?auto_1915120 - SURFACE
    )
    :vars
    (
      ?auto_1915121 - HOIST
      ?auto_1915122 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915121 ?auto_1915122 ) ( SURFACE-AT ?auto_1915119 ?auto_1915122 ) ( CLEAR ?auto_1915119 ) ( LIFTING ?auto_1915121 ?auto_1915120 ) ( IS-CRATE ?auto_1915120 ) ( not ( = ?auto_1915119 ?auto_1915120 ) ) ( ON ?auto_1915119 ?auto_1915118 ) ( not ( = ?auto_1915118 ?auto_1915119 ) ) ( not ( = ?auto_1915118 ?auto_1915120 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915119 ?auto_1915120 )
      ( MAKE-2CRATE-VERIFY ?auto_1915118 ?auto_1915119 ?auto_1915120 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915128 - SURFACE
      ?auto_1915129 - SURFACE
      ?auto_1915130 - SURFACE
    )
    :vars
    (
      ?auto_1915133 - HOIST
      ?auto_1915132 - PLACE
      ?auto_1915131 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915133 ?auto_1915132 ) ( SURFACE-AT ?auto_1915129 ?auto_1915132 ) ( CLEAR ?auto_1915129 ) ( IS-CRATE ?auto_1915130 ) ( not ( = ?auto_1915129 ?auto_1915130 ) ) ( TRUCK-AT ?auto_1915131 ?auto_1915132 ) ( AVAILABLE ?auto_1915133 ) ( IN ?auto_1915130 ?auto_1915131 ) ( ON ?auto_1915129 ?auto_1915128 ) ( not ( = ?auto_1915128 ?auto_1915129 ) ) ( not ( = ?auto_1915128 ?auto_1915130 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915129 ?auto_1915130 )
      ( MAKE-2CRATE-VERIFY ?auto_1915128 ?auto_1915129 ?auto_1915130 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915134 - SURFACE
      ?auto_1915135 - SURFACE
    )
    :vars
    (
      ?auto_1915136 - HOIST
      ?auto_1915139 - PLACE
      ?auto_1915138 - TRUCK
      ?auto_1915137 - SURFACE
      ?auto_1915140 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915136 ?auto_1915139 ) ( SURFACE-AT ?auto_1915134 ?auto_1915139 ) ( CLEAR ?auto_1915134 ) ( IS-CRATE ?auto_1915135 ) ( not ( = ?auto_1915134 ?auto_1915135 ) ) ( AVAILABLE ?auto_1915136 ) ( IN ?auto_1915135 ?auto_1915138 ) ( ON ?auto_1915134 ?auto_1915137 ) ( not ( = ?auto_1915137 ?auto_1915134 ) ) ( not ( = ?auto_1915137 ?auto_1915135 ) ) ( TRUCK-AT ?auto_1915138 ?auto_1915140 ) ( not ( = ?auto_1915140 ?auto_1915139 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1915138 ?auto_1915140 ?auto_1915139 )
      ( MAKE-2CRATE ?auto_1915137 ?auto_1915134 ?auto_1915135 )
      ( MAKE-1CRATE-VERIFY ?auto_1915134 ?auto_1915135 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915141 - SURFACE
      ?auto_1915142 - SURFACE
      ?auto_1915143 - SURFACE
    )
    :vars
    (
      ?auto_1915147 - HOIST
      ?auto_1915144 - PLACE
      ?auto_1915146 - TRUCK
      ?auto_1915145 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915147 ?auto_1915144 ) ( SURFACE-AT ?auto_1915142 ?auto_1915144 ) ( CLEAR ?auto_1915142 ) ( IS-CRATE ?auto_1915143 ) ( not ( = ?auto_1915142 ?auto_1915143 ) ) ( AVAILABLE ?auto_1915147 ) ( IN ?auto_1915143 ?auto_1915146 ) ( ON ?auto_1915142 ?auto_1915141 ) ( not ( = ?auto_1915141 ?auto_1915142 ) ) ( not ( = ?auto_1915141 ?auto_1915143 ) ) ( TRUCK-AT ?auto_1915146 ?auto_1915145 ) ( not ( = ?auto_1915145 ?auto_1915144 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915142 ?auto_1915143 )
      ( MAKE-2CRATE-VERIFY ?auto_1915141 ?auto_1915142 ?auto_1915143 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915148 - SURFACE
      ?auto_1915149 - SURFACE
    )
    :vars
    (
      ?auto_1915151 - HOIST
      ?auto_1915152 - PLACE
      ?auto_1915153 - SURFACE
      ?auto_1915154 - TRUCK
      ?auto_1915150 - PLACE
      ?auto_1915155 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915151 ?auto_1915152 ) ( SURFACE-AT ?auto_1915148 ?auto_1915152 ) ( CLEAR ?auto_1915148 ) ( IS-CRATE ?auto_1915149 ) ( not ( = ?auto_1915148 ?auto_1915149 ) ) ( AVAILABLE ?auto_1915151 ) ( ON ?auto_1915148 ?auto_1915153 ) ( not ( = ?auto_1915153 ?auto_1915148 ) ) ( not ( = ?auto_1915153 ?auto_1915149 ) ) ( TRUCK-AT ?auto_1915154 ?auto_1915150 ) ( not ( = ?auto_1915150 ?auto_1915152 ) ) ( HOIST-AT ?auto_1915155 ?auto_1915150 ) ( LIFTING ?auto_1915155 ?auto_1915149 ) ( not ( = ?auto_1915151 ?auto_1915155 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1915155 ?auto_1915149 ?auto_1915154 ?auto_1915150 )
      ( MAKE-2CRATE ?auto_1915153 ?auto_1915148 ?auto_1915149 )
      ( MAKE-1CRATE-VERIFY ?auto_1915148 ?auto_1915149 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915156 - SURFACE
      ?auto_1915157 - SURFACE
      ?auto_1915158 - SURFACE
    )
    :vars
    (
      ?auto_1915159 - HOIST
      ?auto_1915161 - PLACE
      ?auto_1915160 - TRUCK
      ?auto_1915163 - PLACE
      ?auto_1915162 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915159 ?auto_1915161 ) ( SURFACE-AT ?auto_1915157 ?auto_1915161 ) ( CLEAR ?auto_1915157 ) ( IS-CRATE ?auto_1915158 ) ( not ( = ?auto_1915157 ?auto_1915158 ) ) ( AVAILABLE ?auto_1915159 ) ( ON ?auto_1915157 ?auto_1915156 ) ( not ( = ?auto_1915156 ?auto_1915157 ) ) ( not ( = ?auto_1915156 ?auto_1915158 ) ) ( TRUCK-AT ?auto_1915160 ?auto_1915163 ) ( not ( = ?auto_1915163 ?auto_1915161 ) ) ( HOIST-AT ?auto_1915162 ?auto_1915163 ) ( LIFTING ?auto_1915162 ?auto_1915158 ) ( not ( = ?auto_1915159 ?auto_1915162 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915157 ?auto_1915158 )
      ( MAKE-2CRATE-VERIFY ?auto_1915156 ?auto_1915157 ?auto_1915158 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915164 - SURFACE
      ?auto_1915165 - SURFACE
    )
    :vars
    (
      ?auto_1915169 - HOIST
      ?auto_1915168 - PLACE
      ?auto_1915170 - SURFACE
      ?auto_1915166 - TRUCK
      ?auto_1915171 - PLACE
      ?auto_1915167 - HOIST
      ?auto_1915172 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915169 ?auto_1915168 ) ( SURFACE-AT ?auto_1915164 ?auto_1915168 ) ( CLEAR ?auto_1915164 ) ( IS-CRATE ?auto_1915165 ) ( not ( = ?auto_1915164 ?auto_1915165 ) ) ( AVAILABLE ?auto_1915169 ) ( ON ?auto_1915164 ?auto_1915170 ) ( not ( = ?auto_1915170 ?auto_1915164 ) ) ( not ( = ?auto_1915170 ?auto_1915165 ) ) ( TRUCK-AT ?auto_1915166 ?auto_1915171 ) ( not ( = ?auto_1915171 ?auto_1915168 ) ) ( HOIST-AT ?auto_1915167 ?auto_1915171 ) ( not ( = ?auto_1915169 ?auto_1915167 ) ) ( AVAILABLE ?auto_1915167 ) ( SURFACE-AT ?auto_1915165 ?auto_1915171 ) ( ON ?auto_1915165 ?auto_1915172 ) ( CLEAR ?auto_1915165 ) ( not ( = ?auto_1915164 ?auto_1915172 ) ) ( not ( = ?auto_1915165 ?auto_1915172 ) ) ( not ( = ?auto_1915170 ?auto_1915172 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1915167 ?auto_1915165 ?auto_1915172 ?auto_1915171 )
      ( MAKE-2CRATE ?auto_1915170 ?auto_1915164 ?auto_1915165 )
      ( MAKE-1CRATE-VERIFY ?auto_1915164 ?auto_1915165 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915173 - SURFACE
      ?auto_1915174 - SURFACE
      ?auto_1915175 - SURFACE
    )
    :vars
    (
      ?auto_1915176 - HOIST
      ?auto_1915177 - PLACE
      ?auto_1915179 - TRUCK
      ?auto_1915180 - PLACE
      ?auto_1915178 - HOIST
      ?auto_1915181 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915176 ?auto_1915177 ) ( SURFACE-AT ?auto_1915174 ?auto_1915177 ) ( CLEAR ?auto_1915174 ) ( IS-CRATE ?auto_1915175 ) ( not ( = ?auto_1915174 ?auto_1915175 ) ) ( AVAILABLE ?auto_1915176 ) ( ON ?auto_1915174 ?auto_1915173 ) ( not ( = ?auto_1915173 ?auto_1915174 ) ) ( not ( = ?auto_1915173 ?auto_1915175 ) ) ( TRUCK-AT ?auto_1915179 ?auto_1915180 ) ( not ( = ?auto_1915180 ?auto_1915177 ) ) ( HOIST-AT ?auto_1915178 ?auto_1915180 ) ( not ( = ?auto_1915176 ?auto_1915178 ) ) ( AVAILABLE ?auto_1915178 ) ( SURFACE-AT ?auto_1915175 ?auto_1915180 ) ( ON ?auto_1915175 ?auto_1915181 ) ( CLEAR ?auto_1915175 ) ( not ( = ?auto_1915174 ?auto_1915181 ) ) ( not ( = ?auto_1915175 ?auto_1915181 ) ) ( not ( = ?auto_1915173 ?auto_1915181 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915174 ?auto_1915175 )
      ( MAKE-2CRATE-VERIFY ?auto_1915173 ?auto_1915174 ?auto_1915175 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915182 - SURFACE
      ?auto_1915183 - SURFACE
    )
    :vars
    (
      ?auto_1915189 - HOIST
      ?auto_1915185 - PLACE
      ?auto_1915190 - SURFACE
      ?auto_1915184 - PLACE
      ?auto_1915188 - HOIST
      ?auto_1915187 - SURFACE
      ?auto_1915186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915189 ?auto_1915185 ) ( SURFACE-AT ?auto_1915182 ?auto_1915185 ) ( CLEAR ?auto_1915182 ) ( IS-CRATE ?auto_1915183 ) ( not ( = ?auto_1915182 ?auto_1915183 ) ) ( AVAILABLE ?auto_1915189 ) ( ON ?auto_1915182 ?auto_1915190 ) ( not ( = ?auto_1915190 ?auto_1915182 ) ) ( not ( = ?auto_1915190 ?auto_1915183 ) ) ( not ( = ?auto_1915184 ?auto_1915185 ) ) ( HOIST-AT ?auto_1915188 ?auto_1915184 ) ( not ( = ?auto_1915189 ?auto_1915188 ) ) ( AVAILABLE ?auto_1915188 ) ( SURFACE-AT ?auto_1915183 ?auto_1915184 ) ( ON ?auto_1915183 ?auto_1915187 ) ( CLEAR ?auto_1915183 ) ( not ( = ?auto_1915182 ?auto_1915187 ) ) ( not ( = ?auto_1915183 ?auto_1915187 ) ) ( not ( = ?auto_1915190 ?auto_1915187 ) ) ( TRUCK-AT ?auto_1915186 ?auto_1915185 ) )
    :subtasks
    ( ( !DRIVE ?auto_1915186 ?auto_1915185 ?auto_1915184 )
      ( MAKE-2CRATE ?auto_1915190 ?auto_1915182 ?auto_1915183 )
      ( MAKE-1CRATE-VERIFY ?auto_1915182 ?auto_1915183 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915191 - SURFACE
      ?auto_1915192 - SURFACE
      ?auto_1915193 - SURFACE
    )
    :vars
    (
      ?auto_1915199 - HOIST
      ?auto_1915195 - PLACE
      ?auto_1915197 - PLACE
      ?auto_1915198 - HOIST
      ?auto_1915194 - SURFACE
      ?auto_1915196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915199 ?auto_1915195 ) ( SURFACE-AT ?auto_1915192 ?auto_1915195 ) ( CLEAR ?auto_1915192 ) ( IS-CRATE ?auto_1915193 ) ( not ( = ?auto_1915192 ?auto_1915193 ) ) ( AVAILABLE ?auto_1915199 ) ( ON ?auto_1915192 ?auto_1915191 ) ( not ( = ?auto_1915191 ?auto_1915192 ) ) ( not ( = ?auto_1915191 ?auto_1915193 ) ) ( not ( = ?auto_1915197 ?auto_1915195 ) ) ( HOIST-AT ?auto_1915198 ?auto_1915197 ) ( not ( = ?auto_1915199 ?auto_1915198 ) ) ( AVAILABLE ?auto_1915198 ) ( SURFACE-AT ?auto_1915193 ?auto_1915197 ) ( ON ?auto_1915193 ?auto_1915194 ) ( CLEAR ?auto_1915193 ) ( not ( = ?auto_1915192 ?auto_1915194 ) ) ( not ( = ?auto_1915193 ?auto_1915194 ) ) ( not ( = ?auto_1915191 ?auto_1915194 ) ) ( TRUCK-AT ?auto_1915196 ?auto_1915195 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915192 ?auto_1915193 )
      ( MAKE-2CRATE-VERIFY ?auto_1915191 ?auto_1915192 ?auto_1915193 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915200 - SURFACE
      ?auto_1915201 - SURFACE
    )
    :vars
    (
      ?auto_1915208 - HOIST
      ?auto_1915204 - PLACE
      ?auto_1915202 - SURFACE
      ?auto_1915207 - PLACE
      ?auto_1915203 - HOIST
      ?auto_1915206 - SURFACE
      ?auto_1915205 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915208 ?auto_1915204 ) ( IS-CRATE ?auto_1915201 ) ( not ( = ?auto_1915200 ?auto_1915201 ) ) ( not ( = ?auto_1915202 ?auto_1915200 ) ) ( not ( = ?auto_1915202 ?auto_1915201 ) ) ( not ( = ?auto_1915207 ?auto_1915204 ) ) ( HOIST-AT ?auto_1915203 ?auto_1915207 ) ( not ( = ?auto_1915208 ?auto_1915203 ) ) ( AVAILABLE ?auto_1915203 ) ( SURFACE-AT ?auto_1915201 ?auto_1915207 ) ( ON ?auto_1915201 ?auto_1915206 ) ( CLEAR ?auto_1915201 ) ( not ( = ?auto_1915200 ?auto_1915206 ) ) ( not ( = ?auto_1915201 ?auto_1915206 ) ) ( not ( = ?auto_1915202 ?auto_1915206 ) ) ( TRUCK-AT ?auto_1915205 ?auto_1915204 ) ( SURFACE-AT ?auto_1915202 ?auto_1915204 ) ( CLEAR ?auto_1915202 ) ( LIFTING ?auto_1915208 ?auto_1915200 ) ( IS-CRATE ?auto_1915200 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915202 ?auto_1915200 )
      ( MAKE-2CRATE ?auto_1915202 ?auto_1915200 ?auto_1915201 )
      ( MAKE-1CRATE-VERIFY ?auto_1915200 ?auto_1915201 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915209 - SURFACE
      ?auto_1915210 - SURFACE
      ?auto_1915211 - SURFACE
    )
    :vars
    (
      ?auto_1915217 - HOIST
      ?auto_1915212 - PLACE
      ?auto_1915214 - PLACE
      ?auto_1915216 - HOIST
      ?auto_1915215 - SURFACE
      ?auto_1915213 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915217 ?auto_1915212 ) ( IS-CRATE ?auto_1915211 ) ( not ( = ?auto_1915210 ?auto_1915211 ) ) ( not ( = ?auto_1915209 ?auto_1915210 ) ) ( not ( = ?auto_1915209 ?auto_1915211 ) ) ( not ( = ?auto_1915214 ?auto_1915212 ) ) ( HOIST-AT ?auto_1915216 ?auto_1915214 ) ( not ( = ?auto_1915217 ?auto_1915216 ) ) ( AVAILABLE ?auto_1915216 ) ( SURFACE-AT ?auto_1915211 ?auto_1915214 ) ( ON ?auto_1915211 ?auto_1915215 ) ( CLEAR ?auto_1915211 ) ( not ( = ?auto_1915210 ?auto_1915215 ) ) ( not ( = ?auto_1915211 ?auto_1915215 ) ) ( not ( = ?auto_1915209 ?auto_1915215 ) ) ( TRUCK-AT ?auto_1915213 ?auto_1915212 ) ( SURFACE-AT ?auto_1915209 ?auto_1915212 ) ( CLEAR ?auto_1915209 ) ( LIFTING ?auto_1915217 ?auto_1915210 ) ( IS-CRATE ?auto_1915210 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915210 ?auto_1915211 )
      ( MAKE-2CRATE-VERIFY ?auto_1915209 ?auto_1915210 ?auto_1915211 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915218 - SURFACE
      ?auto_1915219 - SURFACE
    )
    :vars
    (
      ?auto_1915222 - HOIST
      ?auto_1915220 - PLACE
      ?auto_1915225 - SURFACE
      ?auto_1915226 - PLACE
      ?auto_1915221 - HOIST
      ?auto_1915223 - SURFACE
      ?auto_1915224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915222 ?auto_1915220 ) ( IS-CRATE ?auto_1915219 ) ( not ( = ?auto_1915218 ?auto_1915219 ) ) ( not ( = ?auto_1915225 ?auto_1915218 ) ) ( not ( = ?auto_1915225 ?auto_1915219 ) ) ( not ( = ?auto_1915226 ?auto_1915220 ) ) ( HOIST-AT ?auto_1915221 ?auto_1915226 ) ( not ( = ?auto_1915222 ?auto_1915221 ) ) ( AVAILABLE ?auto_1915221 ) ( SURFACE-AT ?auto_1915219 ?auto_1915226 ) ( ON ?auto_1915219 ?auto_1915223 ) ( CLEAR ?auto_1915219 ) ( not ( = ?auto_1915218 ?auto_1915223 ) ) ( not ( = ?auto_1915219 ?auto_1915223 ) ) ( not ( = ?auto_1915225 ?auto_1915223 ) ) ( TRUCK-AT ?auto_1915224 ?auto_1915220 ) ( SURFACE-AT ?auto_1915225 ?auto_1915220 ) ( CLEAR ?auto_1915225 ) ( IS-CRATE ?auto_1915218 ) ( AVAILABLE ?auto_1915222 ) ( IN ?auto_1915218 ?auto_1915224 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1915222 ?auto_1915218 ?auto_1915224 ?auto_1915220 )
      ( MAKE-2CRATE ?auto_1915225 ?auto_1915218 ?auto_1915219 )
      ( MAKE-1CRATE-VERIFY ?auto_1915218 ?auto_1915219 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915227 - SURFACE
      ?auto_1915228 - SURFACE
      ?auto_1915229 - SURFACE
    )
    :vars
    (
      ?auto_1915234 - HOIST
      ?auto_1915235 - PLACE
      ?auto_1915232 - PLACE
      ?auto_1915233 - HOIST
      ?auto_1915231 - SURFACE
      ?auto_1915230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915234 ?auto_1915235 ) ( IS-CRATE ?auto_1915229 ) ( not ( = ?auto_1915228 ?auto_1915229 ) ) ( not ( = ?auto_1915227 ?auto_1915228 ) ) ( not ( = ?auto_1915227 ?auto_1915229 ) ) ( not ( = ?auto_1915232 ?auto_1915235 ) ) ( HOIST-AT ?auto_1915233 ?auto_1915232 ) ( not ( = ?auto_1915234 ?auto_1915233 ) ) ( AVAILABLE ?auto_1915233 ) ( SURFACE-AT ?auto_1915229 ?auto_1915232 ) ( ON ?auto_1915229 ?auto_1915231 ) ( CLEAR ?auto_1915229 ) ( not ( = ?auto_1915228 ?auto_1915231 ) ) ( not ( = ?auto_1915229 ?auto_1915231 ) ) ( not ( = ?auto_1915227 ?auto_1915231 ) ) ( TRUCK-AT ?auto_1915230 ?auto_1915235 ) ( SURFACE-AT ?auto_1915227 ?auto_1915235 ) ( CLEAR ?auto_1915227 ) ( IS-CRATE ?auto_1915228 ) ( AVAILABLE ?auto_1915234 ) ( IN ?auto_1915228 ?auto_1915230 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915228 ?auto_1915229 )
      ( MAKE-2CRATE-VERIFY ?auto_1915227 ?auto_1915228 ?auto_1915229 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915272 - SURFACE
      ?auto_1915273 - SURFACE
    )
    :vars
    (
      ?auto_1915280 - HOIST
      ?auto_1915277 - PLACE
      ?auto_1915279 - SURFACE
      ?auto_1915276 - PLACE
      ?auto_1915278 - HOIST
      ?auto_1915275 - SURFACE
      ?auto_1915274 - TRUCK
      ?auto_1915281 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915280 ?auto_1915277 ) ( SURFACE-AT ?auto_1915272 ?auto_1915277 ) ( CLEAR ?auto_1915272 ) ( IS-CRATE ?auto_1915273 ) ( not ( = ?auto_1915272 ?auto_1915273 ) ) ( AVAILABLE ?auto_1915280 ) ( ON ?auto_1915272 ?auto_1915279 ) ( not ( = ?auto_1915279 ?auto_1915272 ) ) ( not ( = ?auto_1915279 ?auto_1915273 ) ) ( not ( = ?auto_1915276 ?auto_1915277 ) ) ( HOIST-AT ?auto_1915278 ?auto_1915276 ) ( not ( = ?auto_1915280 ?auto_1915278 ) ) ( AVAILABLE ?auto_1915278 ) ( SURFACE-AT ?auto_1915273 ?auto_1915276 ) ( ON ?auto_1915273 ?auto_1915275 ) ( CLEAR ?auto_1915273 ) ( not ( = ?auto_1915272 ?auto_1915275 ) ) ( not ( = ?auto_1915273 ?auto_1915275 ) ) ( not ( = ?auto_1915279 ?auto_1915275 ) ) ( TRUCK-AT ?auto_1915274 ?auto_1915281 ) ( not ( = ?auto_1915281 ?auto_1915277 ) ) ( not ( = ?auto_1915276 ?auto_1915281 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1915274 ?auto_1915281 ?auto_1915277 )
      ( MAKE-1CRATE ?auto_1915272 ?auto_1915273 )
      ( MAKE-1CRATE-VERIFY ?auto_1915272 ?auto_1915273 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1915311 - SURFACE
      ?auto_1915312 - SURFACE
      ?auto_1915313 - SURFACE
      ?auto_1915314 - SURFACE
    )
    :vars
    (
      ?auto_1915316 - HOIST
      ?auto_1915315 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915316 ?auto_1915315 ) ( SURFACE-AT ?auto_1915313 ?auto_1915315 ) ( CLEAR ?auto_1915313 ) ( LIFTING ?auto_1915316 ?auto_1915314 ) ( IS-CRATE ?auto_1915314 ) ( not ( = ?auto_1915313 ?auto_1915314 ) ) ( ON ?auto_1915312 ?auto_1915311 ) ( ON ?auto_1915313 ?auto_1915312 ) ( not ( = ?auto_1915311 ?auto_1915312 ) ) ( not ( = ?auto_1915311 ?auto_1915313 ) ) ( not ( = ?auto_1915311 ?auto_1915314 ) ) ( not ( = ?auto_1915312 ?auto_1915313 ) ) ( not ( = ?auto_1915312 ?auto_1915314 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915313 ?auto_1915314 )
      ( MAKE-3CRATE-VERIFY ?auto_1915311 ?auto_1915312 ?auto_1915313 ?auto_1915314 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1915328 - SURFACE
      ?auto_1915329 - SURFACE
      ?auto_1915330 - SURFACE
      ?auto_1915331 - SURFACE
    )
    :vars
    (
      ?auto_1915332 - HOIST
      ?auto_1915333 - PLACE
      ?auto_1915334 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915332 ?auto_1915333 ) ( SURFACE-AT ?auto_1915330 ?auto_1915333 ) ( CLEAR ?auto_1915330 ) ( IS-CRATE ?auto_1915331 ) ( not ( = ?auto_1915330 ?auto_1915331 ) ) ( TRUCK-AT ?auto_1915334 ?auto_1915333 ) ( AVAILABLE ?auto_1915332 ) ( IN ?auto_1915331 ?auto_1915334 ) ( ON ?auto_1915330 ?auto_1915329 ) ( not ( = ?auto_1915329 ?auto_1915330 ) ) ( not ( = ?auto_1915329 ?auto_1915331 ) ) ( ON ?auto_1915329 ?auto_1915328 ) ( not ( = ?auto_1915328 ?auto_1915329 ) ) ( not ( = ?auto_1915328 ?auto_1915330 ) ) ( not ( = ?auto_1915328 ?auto_1915331 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915329 ?auto_1915330 ?auto_1915331 )
      ( MAKE-3CRATE-VERIFY ?auto_1915328 ?auto_1915329 ?auto_1915330 ?auto_1915331 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1915349 - SURFACE
      ?auto_1915350 - SURFACE
      ?auto_1915351 - SURFACE
      ?auto_1915352 - SURFACE
    )
    :vars
    (
      ?auto_1915353 - HOIST
      ?auto_1915354 - PLACE
      ?auto_1915355 - TRUCK
      ?auto_1915356 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915353 ?auto_1915354 ) ( SURFACE-AT ?auto_1915351 ?auto_1915354 ) ( CLEAR ?auto_1915351 ) ( IS-CRATE ?auto_1915352 ) ( not ( = ?auto_1915351 ?auto_1915352 ) ) ( AVAILABLE ?auto_1915353 ) ( IN ?auto_1915352 ?auto_1915355 ) ( ON ?auto_1915351 ?auto_1915350 ) ( not ( = ?auto_1915350 ?auto_1915351 ) ) ( not ( = ?auto_1915350 ?auto_1915352 ) ) ( TRUCK-AT ?auto_1915355 ?auto_1915356 ) ( not ( = ?auto_1915356 ?auto_1915354 ) ) ( ON ?auto_1915350 ?auto_1915349 ) ( not ( = ?auto_1915349 ?auto_1915350 ) ) ( not ( = ?auto_1915349 ?auto_1915351 ) ) ( not ( = ?auto_1915349 ?auto_1915352 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915350 ?auto_1915351 ?auto_1915352 )
      ( MAKE-3CRATE-VERIFY ?auto_1915349 ?auto_1915350 ?auto_1915351 ?auto_1915352 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1915373 - SURFACE
      ?auto_1915374 - SURFACE
      ?auto_1915375 - SURFACE
      ?auto_1915376 - SURFACE
    )
    :vars
    (
      ?auto_1915377 - HOIST
      ?auto_1915379 - PLACE
      ?auto_1915381 - TRUCK
      ?auto_1915378 - PLACE
      ?auto_1915380 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915377 ?auto_1915379 ) ( SURFACE-AT ?auto_1915375 ?auto_1915379 ) ( CLEAR ?auto_1915375 ) ( IS-CRATE ?auto_1915376 ) ( not ( = ?auto_1915375 ?auto_1915376 ) ) ( AVAILABLE ?auto_1915377 ) ( ON ?auto_1915375 ?auto_1915374 ) ( not ( = ?auto_1915374 ?auto_1915375 ) ) ( not ( = ?auto_1915374 ?auto_1915376 ) ) ( TRUCK-AT ?auto_1915381 ?auto_1915378 ) ( not ( = ?auto_1915378 ?auto_1915379 ) ) ( HOIST-AT ?auto_1915380 ?auto_1915378 ) ( LIFTING ?auto_1915380 ?auto_1915376 ) ( not ( = ?auto_1915377 ?auto_1915380 ) ) ( ON ?auto_1915374 ?auto_1915373 ) ( not ( = ?auto_1915373 ?auto_1915374 ) ) ( not ( = ?auto_1915373 ?auto_1915375 ) ) ( not ( = ?auto_1915373 ?auto_1915376 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915374 ?auto_1915375 ?auto_1915376 )
      ( MAKE-3CRATE-VERIFY ?auto_1915373 ?auto_1915374 ?auto_1915375 ?auto_1915376 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1915400 - SURFACE
      ?auto_1915401 - SURFACE
      ?auto_1915402 - SURFACE
      ?auto_1915403 - SURFACE
    )
    :vars
    (
      ?auto_1915404 - HOIST
      ?auto_1915407 - PLACE
      ?auto_1915408 - TRUCK
      ?auto_1915409 - PLACE
      ?auto_1915405 - HOIST
      ?auto_1915406 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915404 ?auto_1915407 ) ( SURFACE-AT ?auto_1915402 ?auto_1915407 ) ( CLEAR ?auto_1915402 ) ( IS-CRATE ?auto_1915403 ) ( not ( = ?auto_1915402 ?auto_1915403 ) ) ( AVAILABLE ?auto_1915404 ) ( ON ?auto_1915402 ?auto_1915401 ) ( not ( = ?auto_1915401 ?auto_1915402 ) ) ( not ( = ?auto_1915401 ?auto_1915403 ) ) ( TRUCK-AT ?auto_1915408 ?auto_1915409 ) ( not ( = ?auto_1915409 ?auto_1915407 ) ) ( HOIST-AT ?auto_1915405 ?auto_1915409 ) ( not ( = ?auto_1915404 ?auto_1915405 ) ) ( AVAILABLE ?auto_1915405 ) ( SURFACE-AT ?auto_1915403 ?auto_1915409 ) ( ON ?auto_1915403 ?auto_1915406 ) ( CLEAR ?auto_1915403 ) ( not ( = ?auto_1915402 ?auto_1915406 ) ) ( not ( = ?auto_1915403 ?auto_1915406 ) ) ( not ( = ?auto_1915401 ?auto_1915406 ) ) ( ON ?auto_1915401 ?auto_1915400 ) ( not ( = ?auto_1915400 ?auto_1915401 ) ) ( not ( = ?auto_1915400 ?auto_1915402 ) ) ( not ( = ?auto_1915400 ?auto_1915403 ) ) ( not ( = ?auto_1915400 ?auto_1915406 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915401 ?auto_1915402 ?auto_1915403 )
      ( MAKE-3CRATE-VERIFY ?auto_1915400 ?auto_1915401 ?auto_1915402 ?auto_1915403 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1915428 - SURFACE
      ?auto_1915429 - SURFACE
      ?auto_1915430 - SURFACE
      ?auto_1915431 - SURFACE
    )
    :vars
    (
      ?auto_1915432 - HOIST
      ?auto_1915437 - PLACE
      ?auto_1915433 - PLACE
      ?auto_1915435 - HOIST
      ?auto_1915436 - SURFACE
      ?auto_1915434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915432 ?auto_1915437 ) ( SURFACE-AT ?auto_1915430 ?auto_1915437 ) ( CLEAR ?auto_1915430 ) ( IS-CRATE ?auto_1915431 ) ( not ( = ?auto_1915430 ?auto_1915431 ) ) ( AVAILABLE ?auto_1915432 ) ( ON ?auto_1915430 ?auto_1915429 ) ( not ( = ?auto_1915429 ?auto_1915430 ) ) ( not ( = ?auto_1915429 ?auto_1915431 ) ) ( not ( = ?auto_1915433 ?auto_1915437 ) ) ( HOIST-AT ?auto_1915435 ?auto_1915433 ) ( not ( = ?auto_1915432 ?auto_1915435 ) ) ( AVAILABLE ?auto_1915435 ) ( SURFACE-AT ?auto_1915431 ?auto_1915433 ) ( ON ?auto_1915431 ?auto_1915436 ) ( CLEAR ?auto_1915431 ) ( not ( = ?auto_1915430 ?auto_1915436 ) ) ( not ( = ?auto_1915431 ?auto_1915436 ) ) ( not ( = ?auto_1915429 ?auto_1915436 ) ) ( TRUCK-AT ?auto_1915434 ?auto_1915437 ) ( ON ?auto_1915429 ?auto_1915428 ) ( not ( = ?auto_1915428 ?auto_1915429 ) ) ( not ( = ?auto_1915428 ?auto_1915430 ) ) ( not ( = ?auto_1915428 ?auto_1915431 ) ) ( not ( = ?auto_1915428 ?auto_1915436 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915429 ?auto_1915430 ?auto_1915431 )
      ( MAKE-3CRATE-VERIFY ?auto_1915428 ?auto_1915429 ?auto_1915430 ?auto_1915431 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1915456 - SURFACE
      ?auto_1915457 - SURFACE
      ?auto_1915458 - SURFACE
      ?auto_1915459 - SURFACE
    )
    :vars
    (
      ?auto_1915460 - HOIST
      ?auto_1915465 - PLACE
      ?auto_1915461 - PLACE
      ?auto_1915463 - HOIST
      ?auto_1915464 - SURFACE
      ?auto_1915462 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915460 ?auto_1915465 ) ( IS-CRATE ?auto_1915459 ) ( not ( = ?auto_1915458 ?auto_1915459 ) ) ( not ( = ?auto_1915457 ?auto_1915458 ) ) ( not ( = ?auto_1915457 ?auto_1915459 ) ) ( not ( = ?auto_1915461 ?auto_1915465 ) ) ( HOIST-AT ?auto_1915463 ?auto_1915461 ) ( not ( = ?auto_1915460 ?auto_1915463 ) ) ( AVAILABLE ?auto_1915463 ) ( SURFACE-AT ?auto_1915459 ?auto_1915461 ) ( ON ?auto_1915459 ?auto_1915464 ) ( CLEAR ?auto_1915459 ) ( not ( = ?auto_1915458 ?auto_1915464 ) ) ( not ( = ?auto_1915459 ?auto_1915464 ) ) ( not ( = ?auto_1915457 ?auto_1915464 ) ) ( TRUCK-AT ?auto_1915462 ?auto_1915465 ) ( SURFACE-AT ?auto_1915457 ?auto_1915465 ) ( CLEAR ?auto_1915457 ) ( LIFTING ?auto_1915460 ?auto_1915458 ) ( IS-CRATE ?auto_1915458 ) ( ON ?auto_1915457 ?auto_1915456 ) ( not ( = ?auto_1915456 ?auto_1915457 ) ) ( not ( = ?auto_1915456 ?auto_1915458 ) ) ( not ( = ?auto_1915456 ?auto_1915459 ) ) ( not ( = ?auto_1915456 ?auto_1915464 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915457 ?auto_1915458 ?auto_1915459 )
      ( MAKE-3CRATE-VERIFY ?auto_1915456 ?auto_1915457 ?auto_1915458 ?auto_1915459 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1915484 - SURFACE
      ?auto_1915485 - SURFACE
      ?auto_1915486 - SURFACE
      ?auto_1915487 - SURFACE
    )
    :vars
    (
      ?auto_1915488 - HOIST
      ?auto_1915493 - PLACE
      ?auto_1915492 - PLACE
      ?auto_1915489 - HOIST
      ?auto_1915491 - SURFACE
      ?auto_1915490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915488 ?auto_1915493 ) ( IS-CRATE ?auto_1915487 ) ( not ( = ?auto_1915486 ?auto_1915487 ) ) ( not ( = ?auto_1915485 ?auto_1915486 ) ) ( not ( = ?auto_1915485 ?auto_1915487 ) ) ( not ( = ?auto_1915492 ?auto_1915493 ) ) ( HOIST-AT ?auto_1915489 ?auto_1915492 ) ( not ( = ?auto_1915488 ?auto_1915489 ) ) ( AVAILABLE ?auto_1915489 ) ( SURFACE-AT ?auto_1915487 ?auto_1915492 ) ( ON ?auto_1915487 ?auto_1915491 ) ( CLEAR ?auto_1915487 ) ( not ( = ?auto_1915486 ?auto_1915491 ) ) ( not ( = ?auto_1915487 ?auto_1915491 ) ) ( not ( = ?auto_1915485 ?auto_1915491 ) ) ( TRUCK-AT ?auto_1915490 ?auto_1915493 ) ( SURFACE-AT ?auto_1915485 ?auto_1915493 ) ( CLEAR ?auto_1915485 ) ( IS-CRATE ?auto_1915486 ) ( AVAILABLE ?auto_1915488 ) ( IN ?auto_1915486 ?auto_1915490 ) ( ON ?auto_1915485 ?auto_1915484 ) ( not ( = ?auto_1915484 ?auto_1915485 ) ) ( not ( = ?auto_1915484 ?auto_1915486 ) ) ( not ( = ?auto_1915484 ?auto_1915487 ) ) ( not ( = ?auto_1915484 ?auto_1915491 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915485 ?auto_1915486 ?auto_1915487 )
      ( MAKE-3CRATE-VERIFY ?auto_1915484 ?auto_1915485 ?auto_1915486 ?auto_1915487 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1915775 - SURFACE
      ?auto_1915776 - SURFACE
      ?auto_1915777 - SURFACE
      ?auto_1915779 - SURFACE
      ?auto_1915778 - SURFACE
    )
    :vars
    (
      ?auto_1915780 - HOIST
      ?auto_1915781 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915780 ?auto_1915781 ) ( SURFACE-AT ?auto_1915779 ?auto_1915781 ) ( CLEAR ?auto_1915779 ) ( LIFTING ?auto_1915780 ?auto_1915778 ) ( IS-CRATE ?auto_1915778 ) ( not ( = ?auto_1915779 ?auto_1915778 ) ) ( ON ?auto_1915776 ?auto_1915775 ) ( ON ?auto_1915777 ?auto_1915776 ) ( ON ?auto_1915779 ?auto_1915777 ) ( not ( = ?auto_1915775 ?auto_1915776 ) ) ( not ( = ?auto_1915775 ?auto_1915777 ) ) ( not ( = ?auto_1915775 ?auto_1915779 ) ) ( not ( = ?auto_1915775 ?auto_1915778 ) ) ( not ( = ?auto_1915776 ?auto_1915777 ) ) ( not ( = ?auto_1915776 ?auto_1915779 ) ) ( not ( = ?auto_1915776 ?auto_1915778 ) ) ( not ( = ?auto_1915777 ?auto_1915779 ) ) ( not ( = ?auto_1915777 ?auto_1915778 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915779 ?auto_1915778 )
      ( MAKE-4CRATE-VERIFY ?auto_1915775 ?auto_1915776 ?auto_1915777 ?auto_1915779 ?auto_1915778 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1915800 - SURFACE
      ?auto_1915801 - SURFACE
      ?auto_1915802 - SURFACE
      ?auto_1915804 - SURFACE
      ?auto_1915803 - SURFACE
    )
    :vars
    (
      ?auto_1915806 - HOIST
      ?auto_1915805 - PLACE
      ?auto_1915807 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915806 ?auto_1915805 ) ( SURFACE-AT ?auto_1915804 ?auto_1915805 ) ( CLEAR ?auto_1915804 ) ( IS-CRATE ?auto_1915803 ) ( not ( = ?auto_1915804 ?auto_1915803 ) ) ( TRUCK-AT ?auto_1915807 ?auto_1915805 ) ( AVAILABLE ?auto_1915806 ) ( IN ?auto_1915803 ?auto_1915807 ) ( ON ?auto_1915804 ?auto_1915802 ) ( not ( = ?auto_1915802 ?auto_1915804 ) ) ( not ( = ?auto_1915802 ?auto_1915803 ) ) ( ON ?auto_1915801 ?auto_1915800 ) ( ON ?auto_1915802 ?auto_1915801 ) ( not ( = ?auto_1915800 ?auto_1915801 ) ) ( not ( = ?auto_1915800 ?auto_1915802 ) ) ( not ( = ?auto_1915800 ?auto_1915804 ) ) ( not ( = ?auto_1915800 ?auto_1915803 ) ) ( not ( = ?auto_1915801 ?auto_1915802 ) ) ( not ( = ?auto_1915801 ?auto_1915804 ) ) ( not ( = ?auto_1915801 ?auto_1915803 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915802 ?auto_1915804 ?auto_1915803 )
      ( MAKE-4CRATE-VERIFY ?auto_1915800 ?auto_1915801 ?auto_1915802 ?auto_1915804 ?auto_1915803 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1915830 - SURFACE
      ?auto_1915831 - SURFACE
      ?auto_1915832 - SURFACE
      ?auto_1915834 - SURFACE
      ?auto_1915833 - SURFACE
    )
    :vars
    (
      ?auto_1915838 - HOIST
      ?auto_1915836 - PLACE
      ?auto_1915837 - TRUCK
      ?auto_1915835 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915838 ?auto_1915836 ) ( SURFACE-AT ?auto_1915834 ?auto_1915836 ) ( CLEAR ?auto_1915834 ) ( IS-CRATE ?auto_1915833 ) ( not ( = ?auto_1915834 ?auto_1915833 ) ) ( AVAILABLE ?auto_1915838 ) ( IN ?auto_1915833 ?auto_1915837 ) ( ON ?auto_1915834 ?auto_1915832 ) ( not ( = ?auto_1915832 ?auto_1915834 ) ) ( not ( = ?auto_1915832 ?auto_1915833 ) ) ( TRUCK-AT ?auto_1915837 ?auto_1915835 ) ( not ( = ?auto_1915835 ?auto_1915836 ) ) ( ON ?auto_1915831 ?auto_1915830 ) ( ON ?auto_1915832 ?auto_1915831 ) ( not ( = ?auto_1915830 ?auto_1915831 ) ) ( not ( = ?auto_1915830 ?auto_1915832 ) ) ( not ( = ?auto_1915830 ?auto_1915834 ) ) ( not ( = ?auto_1915830 ?auto_1915833 ) ) ( not ( = ?auto_1915831 ?auto_1915832 ) ) ( not ( = ?auto_1915831 ?auto_1915834 ) ) ( not ( = ?auto_1915831 ?auto_1915833 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915832 ?auto_1915834 ?auto_1915833 )
      ( MAKE-4CRATE-VERIFY ?auto_1915830 ?auto_1915831 ?auto_1915832 ?auto_1915834 ?auto_1915833 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1915864 - SURFACE
      ?auto_1915865 - SURFACE
      ?auto_1915866 - SURFACE
      ?auto_1915868 - SURFACE
      ?auto_1915867 - SURFACE
    )
    :vars
    (
      ?auto_1915869 - HOIST
      ?auto_1915872 - PLACE
      ?auto_1915873 - TRUCK
      ?auto_1915870 - PLACE
      ?auto_1915871 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915869 ?auto_1915872 ) ( SURFACE-AT ?auto_1915868 ?auto_1915872 ) ( CLEAR ?auto_1915868 ) ( IS-CRATE ?auto_1915867 ) ( not ( = ?auto_1915868 ?auto_1915867 ) ) ( AVAILABLE ?auto_1915869 ) ( ON ?auto_1915868 ?auto_1915866 ) ( not ( = ?auto_1915866 ?auto_1915868 ) ) ( not ( = ?auto_1915866 ?auto_1915867 ) ) ( TRUCK-AT ?auto_1915873 ?auto_1915870 ) ( not ( = ?auto_1915870 ?auto_1915872 ) ) ( HOIST-AT ?auto_1915871 ?auto_1915870 ) ( LIFTING ?auto_1915871 ?auto_1915867 ) ( not ( = ?auto_1915869 ?auto_1915871 ) ) ( ON ?auto_1915865 ?auto_1915864 ) ( ON ?auto_1915866 ?auto_1915865 ) ( not ( = ?auto_1915864 ?auto_1915865 ) ) ( not ( = ?auto_1915864 ?auto_1915866 ) ) ( not ( = ?auto_1915864 ?auto_1915868 ) ) ( not ( = ?auto_1915864 ?auto_1915867 ) ) ( not ( = ?auto_1915865 ?auto_1915866 ) ) ( not ( = ?auto_1915865 ?auto_1915868 ) ) ( not ( = ?auto_1915865 ?auto_1915867 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915866 ?auto_1915868 ?auto_1915867 )
      ( MAKE-4CRATE-VERIFY ?auto_1915864 ?auto_1915865 ?auto_1915866 ?auto_1915868 ?auto_1915867 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1915902 - SURFACE
      ?auto_1915903 - SURFACE
      ?auto_1915904 - SURFACE
      ?auto_1915906 - SURFACE
      ?auto_1915905 - SURFACE
    )
    :vars
    (
      ?auto_1915908 - HOIST
      ?auto_1915912 - PLACE
      ?auto_1915907 - TRUCK
      ?auto_1915911 - PLACE
      ?auto_1915910 - HOIST
      ?auto_1915909 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915908 ?auto_1915912 ) ( SURFACE-AT ?auto_1915906 ?auto_1915912 ) ( CLEAR ?auto_1915906 ) ( IS-CRATE ?auto_1915905 ) ( not ( = ?auto_1915906 ?auto_1915905 ) ) ( AVAILABLE ?auto_1915908 ) ( ON ?auto_1915906 ?auto_1915904 ) ( not ( = ?auto_1915904 ?auto_1915906 ) ) ( not ( = ?auto_1915904 ?auto_1915905 ) ) ( TRUCK-AT ?auto_1915907 ?auto_1915911 ) ( not ( = ?auto_1915911 ?auto_1915912 ) ) ( HOIST-AT ?auto_1915910 ?auto_1915911 ) ( not ( = ?auto_1915908 ?auto_1915910 ) ) ( AVAILABLE ?auto_1915910 ) ( SURFACE-AT ?auto_1915905 ?auto_1915911 ) ( ON ?auto_1915905 ?auto_1915909 ) ( CLEAR ?auto_1915905 ) ( not ( = ?auto_1915906 ?auto_1915909 ) ) ( not ( = ?auto_1915905 ?auto_1915909 ) ) ( not ( = ?auto_1915904 ?auto_1915909 ) ) ( ON ?auto_1915903 ?auto_1915902 ) ( ON ?auto_1915904 ?auto_1915903 ) ( not ( = ?auto_1915902 ?auto_1915903 ) ) ( not ( = ?auto_1915902 ?auto_1915904 ) ) ( not ( = ?auto_1915902 ?auto_1915906 ) ) ( not ( = ?auto_1915902 ?auto_1915905 ) ) ( not ( = ?auto_1915902 ?auto_1915909 ) ) ( not ( = ?auto_1915903 ?auto_1915904 ) ) ( not ( = ?auto_1915903 ?auto_1915906 ) ) ( not ( = ?auto_1915903 ?auto_1915905 ) ) ( not ( = ?auto_1915903 ?auto_1915909 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915904 ?auto_1915906 ?auto_1915905 )
      ( MAKE-4CRATE-VERIFY ?auto_1915902 ?auto_1915903 ?auto_1915904 ?auto_1915906 ?auto_1915905 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1915941 - SURFACE
      ?auto_1915942 - SURFACE
      ?auto_1915943 - SURFACE
      ?auto_1915945 - SURFACE
      ?auto_1915944 - SURFACE
    )
    :vars
    (
      ?auto_1915947 - HOIST
      ?auto_1915949 - PLACE
      ?auto_1915948 - PLACE
      ?auto_1915950 - HOIST
      ?auto_1915946 - SURFACE
      ?auto_1915951 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915947 ?auto_1915949 ) ( SURFACE-AT ?auto_1915945 ?auto_1915949 ) ( CLEAR ?auto_1915945 ) ( IS-CRATE ?auto_1915944 ) ( not ( = ?auto_1915945 ?auto_1915944 ) ) ( AVAILABLE ?auto_1915947 ) ( ON ?auto_1915945 ?auto_1915943 ) ( not ( = ?auto_1915943 ?auto_1915945 ) ) ( not ( = ?auto_1915943 ?auto_1915944 ) ) ( not ( = ?auto_1915948 ?auto_1915949 ) ) ( HOIST-AT ?auto_1915950 ?auto_1915948 ) ( not ( = ?auto_1915947 ?auto_1915950 ) ) ( AVAILABLE ?auto_1915950 ) ( SURFACE-AT ?auto_1915944 ?auto_1915948 ) ( ON ?auto_1915944 ?auto_1915946 ) ( CLEAR ?auto_1915944 ) ( not ( = ?auto_1915945 ?auto_1915946 ) ) ( not ( = ?auto_1915944 ?auto_1915946 ) ) ( not ( = ?auto_1915943 ?auto_1915946 ) ) ( TRUCK-AT ?auto_1915951 ?auto_1915949 ) ( ON ?auto_1915942 ?auto_1915941 ) ( ON ?auto_1915943 ?auto_1915942 ) ( not ( = ?auto_1915941 ?auto_1915942 ) ) ( not ( = ?auto_1915941 ?auto_1915943 ) ) ( not ( = ?auto_1915941 ?auto_1915945 ) ) ( not ( = ?auto_1915941 ?auto_1915944 ) ) ( not ( = ?auto_1915941 ?auto_1915946 ) ) ( not ( = ?auto_1915942 ?auto_1915943 ) ) ( not ( = ?auto_1915942 ?auto_1915945 ) ) ( not ( = ?auto_1915942 ?auto_1915944 ) ) ( not ( = ?auto_1915942 ?auto_1915946 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915943 ?auto_1915945 ?auto_1915944 )
      ( MAKE-4CRATE-VERIFY ?auto_1915941 ?auto_1915942 ?auto_1915943 ?auto_1915945 ?auto_1915944 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1915980 - SURFACE
      ?auto_1915981 - SURFACE
      ?auto_1915982 - SURFACE
      ?auto_1915984 - SURFACE
      ?auto_1915983 - SURFACE
    )
    :vars
    (
      ?auto_1915990 - HOIST
      ?auto_1915985 - PLACE
      ?auto_1915987 - PLACE
      ?auto_1915988 - HOIST
      ?auto_1915986 - SURFACE
      ?auto_1915989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915990 ?auto_1915985 ) ( IS-CRATE ?auto_1915983 ) ( not ( = ?auto_1915984 ?auto_1915983 ) ) ( not ( = ?auto_1915982 ?auto_1915984 ) ) ( not ( = ?auto_1915982 ?auto_1915983 ) ) ( not ( = ?auto_1915987 ?auto_1915985 ) ) ( HOIST-AT ?auto_1915988 ?auto_1915987 ) ( not ( = ?auto_1915990 ?auto_1915988 ) ) ( AVAILABLE ?auto_1915988 ) ( SURFACE-AT ?auto_1915983 ?auto_1915987 ) ( ON ?auto_1915983 ?auto_1915986 ) ( CLEAR ?auto_1915983 ) ( not ( = ?auto_1915984 ?auto_1915986 ) ) ( not ( = ?auto_1915983 ?auto_1915986 ) ) ( not ( = ?auto_1915982 ?auto_1915986 ) ) ( TRUCK-AT ?auto_1915989 ?auto_1915985 ) ( SURFACE-AT ?auto_1915982 ?auto_1915985 ) ( CLEAR ?auto_1915982 ) ( LIFTING ?auto_1915990 ?auto_1915984 ) ( IS-CRATE ?auto_1915984 ) ( ON ?auto_1915981 ?auto_1915980 ) ( ON ?auto_1915982 ?auto_1915981 ) ( not ( = ?auto_1915980 ?auto_1915981 ) ) ( not ( = ?auto_1915980 ?auto_1915982 ) ) ( not ( = ?auto_1915980 ?auto_1915984 ) ) ( not ( = ?auto_1915980 ?auto_1915983 ) ) ( not ( = ?auto_1915980 ?auto_1915986 ) ) ( not ( = ?auto_1915981 ?auto_1915982 ) ) ( not ( = ?auto_1915981 ?auto_1915984 ) ) ( not ( = ?auto_1915981 ?auto_1915983 ) ) ( not ( = ?auto_1915981 ?auto_1915986 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915982 ?auto_1915984 ?auto_1915983 )
      ( MAKE-4CRATE-VERIFY ?auto_1915980 ?auto_1915981 ?auto_1915982 ?auto_1915984 ?auto_1915983 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1916019 - SURFACE
      ?auto_1916020 - SURFACE
      ?auto_1916021 - SURFACE
      ?auto_1916023 - SURFACE
      ?auto_1916022 - SURFACE
    )
    :vars
    (
      ?auto_1916027 - HOIST
      ?auto_1916025 - PLACE
      ?auto_1916029 - PLACE
      ?auto_1916028 - HOIST
      ?auto_1916024 - SURFACE
      ?auto_1916026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916027 ?auto_1916025 ) ( IS-CRATE ?auto_1916022 ) ( not ( = ?auto_1916023 ?auto_1916022 ) ) ( not ( = ?auto_1916021 ?auto_1916023 ) ) ( not ( = ?auto_1916021 ?auto_1916022 ) ) ( not ( = ?auto_1916029 ?auto_1916025 ) ) ( HOIST-AT ?auto_1916028 ?auto_1916029 ) ( not ( = ?auto_1916027 ?auto_1916028 ) ) ( AVAILABLE ?auto_1916028 ) ( SURFACE-AT ?auto_1916022 ?auto_1916029 ) ( ON ?auto_1916022 ?auto_1916024 ) ( CLEAR ?auto_1916022 ) ( not ( = ?auto_1916023 ?auto_1916024 ) ) ( not ( = ?auto_1916022 ?auto_1916024 ) ) ( not ( = ?auto_1916021 ?auto_1916024 ) ) ( TRUCK-AT ?auto_1916026 ?auto_1916025 ) ( SURFACE-AT ?auto_1916021 ?auto_1916025 ) ( CLEAR ?auto_1916021 ) ( IS-CRATE ?auto_1916023 ) ( AVAILABLE ?auto_1916027 ) ( IN ?auto_1916023 ?auto_1916026 ) ( ON ?auto_1916020 ?auto_1916019 ) ( ON ?auto_1916021 ?auto_1916020 ) ( not ( = ?auto_1916019 ?auto_1916020 ) ) ( not ( = ?auto_1916019 ?auto_1916021 ) ) ( not ( = ?auto_1916019 ?auto_1916023 ) ) ( not ( = ?auto_1916019 ?auto_1916022 ) ) ( not ( = ?auto_1916019 ?auto_1916024 ) ) ( not ( = ?auto_1916020 ?auto_1916021 ) ) ( not ( = ?auto_1916020 ?auto_1916023 ) ) ( not ( = ?auto_1916020 ?auto_1916022 ) ) ( not ( = ?auto_1916020 ?auto_1916024 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1916021 ?auto_1916023 ?auto_1916022 )
      ( MAKE-4CRATE-VERIFY ?auto_1916019 ?auto_1916020 ?auto_1916021 ?auto_1916023 ?auto_1916022 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1916679 - SURFACE
      ?auto_1916680 - SURFACE
      ?auto_1916681 - SURFACE
      ?auto_1916683 - SURFACE
      ?auto_1916682 - SURFACE
      ?auto_1916684 - SURFACE
    )
    :vars
    (
      ?auto_1916686 - HOIST
      ?auto_1916685 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916686 ?auto_1916685 ) ( SURFACE-AT ?auto_1916682 ?auto_1916685 ) ( CLEAR ?auto_1916682 ) ( LIFTING ?auto_1916686 ?auto_1916684 ) ( IS-CRATE ?auto_1916684 ) ( not ( = ?auto_1916682 ?auto_1916684 ) ) ( ON ?auto_1916680 ?auto_1916679 ) ( ON ?auto_1916681 ?auto_1916680 ) ( ON ?auto_1916683 ?auto_1916681 ) ( ON ?auto_1916682 ?auto_1916683 ) ( not ( = ?auto_1916679 ?auto_1916680 ) ) ( not ( = ?auto_1916679 ?auto_1916681 ) ) ( not ( = ?auto_1916679 ?auto_1916683 ) ) ( not ( = ?auto_1916679 ?auto_1916682 ) ) ( not ( = ?auto_1916679 ?auto_1916684 ) ) ( not ( = ?auto_1916680 ?auto_1916681 ) ) ( not ( = ?auto_1916680 ?auto_1916683 ) ) ( not ( = ?auto_1916680 ?auto_1916682 ) ) ( not ( = ?auto_1916680 ?auto_1916684 ) ) ( not ( = ?auto_1916681 ?auto_1916683 ) ) ( not ( = ?auto_1916681 ?auto_1916682 ) ) ( not ( = ?auto_1916681 ?auto_1916684 ) ) ( not ( = ?auto_1916683 ?auto_1916682 ) ) ( not ( = ?auto_1916683 ?auto_1916684 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1916682 ?auto_1916684 )
      ( MAKE-5CRATE-VERIFY ?auto_1916679 ?auto_1916680 ?auto_1916681 ?auto_1916683 ?auto_1916682 ?auto_1916684 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1916713 - SURFACE
      ?auto_1916714 - SURFACE
      ?auto_1916715 - SURFACE
      ?auto_1916717 - SURFACE
      ?auto_1916716 - SURFACE
      ?auto_1916718 - SURFACE
    )
    :vars
    (
      ?auto_1916719 - HOIST
      ?auto_1916720 - PLACE
      ?auto_1916721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916719 ?auto_1916720 ) ( SURFACE-AT ?auto_1916716 ?auto_1916720 ) ( CLEAR ?auto_1916716 ) ( IS-CRATE ?auto_1916718 ) ( not ( = ?auto_1916716 ?auto_1916718 ) ) ( TRUCK-AT ?auto_1916721 ?auto_1916720 ) ( AVAILABLE ?auto_1916719 ) ( IN ?auto_1916718 ?auto_1916721 ) ( ON ?auto_1916716 ?auto_1916717 ) ( not ( = ?auto_1916717 ?auto_1916716 ) ) ( not ( = ?auto_1916717 ?auto_1916718 ) ) ( ON ?auto_1916714 ?auto_1916713 ) ( ON ?auto_1916715 ?auto_1916714 ) ( ON ?auto_1916717 ?auto_1916715 ) ( not ( = ?auto_1916713 ?auto_1916714 ) ) ( not ( = ?auto_1916713 ?auto_1916715 ) ) ( not ( = ?auto_1916713 ?auto_1916717 ) ) ( not ( = ?auto_1916713 ?auto_1916716 ) ) ( not ( = ?auto_1916713 ?auto_1916718 ) ) ( not ( = ?auto_1916714 ?auto_1916715 ) ) ( not ( = ?auto_1916714 ?auto_1916717 ) ) ( not ( = ?auto_1916714 ?auto_1916716 ) ) ( not ( = ?auto_1916714 ?auto_1916718 ) ) ( not ( = ?auto_1916715 ?auto_1916717 ) ) ( not ( = ?auto_1916715 ?auto_1916716 ) ) ( not ( = ?auto_1916715 ?auto_1916718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1916717 ?auto_1916716 ?auto_1916718 )
      ( MAKE-5CRATE-VERIFY ?auto_1916713 ?auto_1916714 ?auto_1916715 ?auto_1916717 ?auto_1916716 ?auto_1916718 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1916753 - SURFACE
      ?auto_1916754 - SURFACE
      ?auto_1916755 - SURFACE
      ?auto_1916757 - SURFACE
      ?auto_1916756 - SURFACE
      ?auto_1916758 - SURFACE
    )
    :vars
    (
      ?auto_1916759 - HOIST
      ?auto_1916762 - PLACE
      ?auto_1916761 - TRUCK
      ?auto_1916760 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916759 ?auto_1916762 ) ( SURFACE-AT ?auto_1916756 ?auto_1916762 ) ( CLEAR ?auto_1916756 ) ( IS-CRATE ?auto_1916758 ) ( not ( = ?auto_1916756 ?auto_1916758 ) ) ( AVAILABLE ?auto_1916759 ) ( IN ?auto_1916758 ?auto_1916761 ) ( ON ?auto_1916756 ?auto_1916757 ) ( not ( = ?auto_1916757 ?auto_1916756 ) ) ( not ( = ?auto_1916757 ?auto_1916758 ) ) ( TRUCK-AT ?auto_1916761 ?auto_1916760 ) ( not ( = ?auto_1916760 ?auto_1916762 ) ) ( ON ?auto_1916754 ?auto_1916753 ) ( ON ?auto_1916755 ?auto_1916754 ) ( ON ?auto_1916757 ?auto_1916755 ) ( not ( = ?auto_1916753 ?auto_1916754 ) ) ( not ( = ?auto_1916753 ?auto_1916755 ) ) ( not ( = ?auto_1916753 ?auto_1916757 ) ) ( not ( = ?auto_1916753 ?auto_1916756 ) ) ( not ( = ?auto_1916753 ?auto_1916758 ) ) ( not ( = ?auto_1916754 ?auto_1916755 ) ) ( not ( = ?auto_1916754 ?auto_1916757 ) ) ( not ( = ?auto_1916754 ?auto_1916756 ) ) ( not ( = ?auto_1916754 ?auto_1916758 ) ) ( not ( = ?auto_1916755 ?auto_1916757 ) ) ( not ( = ?auto_1916755 ?auto_1916756 ) ) ( not ( = ?auto_1916755 ?auto_1916758 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1916757 ?auto_1916756 ?auto_1916758 )
      ( MAKE-5CRATE-VERIFY ?auto_1916753 ?auto_1916754 ?auto_1916755 ?auto_1916757 ?auto_1916756 ?auto_1916758 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1916798 - SURFACE
      ?auto_1916799 - SURFACE
      ?auto_1916800 - SURFACE
      ?auto_1916802 - SURFACE
      ?auto_1916801 - SURFACE
      ?auto_1916803 - SURFACE
    )
    :vars
    (
      ?auto_1916808 - HOIST
      ?auto_1916807 - PLACE
      ?auto_1916806 - TRUCK
      ?auto_1916804 - PLACE
      ?auto_1916805 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916808 ?auto_1916807 ) ( SURFACE-AT ?auto_1916801 ?auto_1916807 ) ( CLEAR ?auto_1916801 ) ( IS-CRATE ?auto_1916803 ) ( not ( = ?auto_1916801 ?auto_1916803 ) ) ( AVAILABLE ?auto_1916808 ) ( ON ?auto_1916801 ?auto_1916802 ) ( not ( = ?auto_1916802 ?auto_1916801 ) ) ( not ( = ?auto_1916802 ?auto_1916803 ) ) ( TRUCK-AT ?auto_1916806 ?auto_1916804 ) ( not ( = ?auto_1916804 ?auto_1916807 ) ) ( HOIST-AT ?auto_1916805 ?auto_1916804 ) ( LIFTING ?auto_1916805 ?auto_1916803 ) ( not ( = ?auto_1916808 ?auto_1916805 ) ) ( ON ?auto_1916799 ?auto_1916798 ) ( ON ?auto_1916800 ?auto_1916799 ) ( ON ?auto_1916802 ?auto_1916800 ) ( not ( = ?auto_1916798 ?auto_1916799 ) ) ( not ( = ?auto_1916798 ?auto_1916800 ) ) ( not ( = ?auto_1916798 ?auto_1916802 ) ) ( not ( = ?auto_1916798 ?auto_1916801 ) ) ( not ( = ?auto_1916798 ?auto_1916803 ) ) ( not ( = ?auto_1916799 ?auto_1916800 ) ) ( not ( = ?auto_1916799 ?auto_1916802 ) ) ( not ( = ?auto_1916799 ?auto_1916801 ) ) ( not ( = ?auto_1916799 ?auto_1916803 ) ) ( not ( = ?auto_1916800 ?auto_1916802 ) ) ( not ( = ?auto_1916800 ?auto_1916801 ) ) ( not ( = ?auto_1916800 ?auto_1916803 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1916802 ?auto_1916801 ?auto_1916803 )
      ( MAKE-5CRATE-VERIFY ?auto_1916798 ?auto_1916799 ?auto_1916800 ?auto_1916802 ?auto_1916801 ?auto_1916803 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1916848 - SURFACE
      ?auto_1916849 - SURFACE
      ?auto_1916850 - SURFACE
      ?auto_1916852 - SURFACE
      ?auto_1916851 - SURFACE
      ?auto_1916853 - SURFACE
    )
    :vars
    (
      ?auto_1916854 - HOIST
      ?auto_1916857 - PLACE
      ?auto_1916858 - TRUCK
      ?auto_1916859 - PLACE
      ?auto_1916856 - HOIST
      ?auto_1916855 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916854 ?auto_1916857 ) ( SURFACE-AT ?auto_1916851 ?auto_1916857 ) ( CLEAR ?auto_1916851 ) ( IS-CRATE ?auto_1916853 ) ( not ( = ?auto_1916851 ?auto_1916853 ) ) ( AVAILABLE ?auto_1916854 ) ( ON ?auto_1916851 ?auto_1916852 ) ( not ( = ?auto_1916852 ?auto_1916851 ) ) ( not ( = ?auto_1916852 ?auto_1916853 ) ) ( TRUCK-AT ?auto_1916858 ?auto_1916859 ) ( not ( = ?auto_1916859 ?auto_1916857 ) ) ( HOIST-AT ?auto_1916856 ?auto_1916859 ) ( not ( = ?auto_1916854 ?auto_1916856 ) ) ( AVAILABLE ?auto_1916856 ) ( SURFACE-AT ?auto_1916853 ?auto_1916859 ) ( ON ?auto_1916853 ?auto_1916855 ) ( CLEAR ?auto_1916853 ) ( not ( = ?auto_1916851 ?auto_1916855 ) ) ( not ( = ?auto_1916853 ?auto_1916855 ) ) ( not ( = ?auto_1916852 ?auto_1916855 ) ) ( ON ?auto_1916849 ?auto_1916848 ) ( ON ?auto_1916850 ?auto_1916849 ) ( ON ?auto_1916852 ?auto_1916850 ) ( not ( = ?auto_1916848 ?auto_1916849 ) ) ( not ( = ?auto_1916848 ?auto_1916850 ) ) ( not ( = ?auto_1916848 ?auto_1916852 ) ) ( not ( = ?auto_1916848 ?auto_1916851 ) ) ( not ( = ?auto_1916848 ?auto_1916853 ) ) ( not ( = ?auto_1916848 ?auto_1916855 ) ) ( not ( = ?auto_1916849 ?auto_1916850 ) ) ( not ( = ?auto_1916849 ?auto_1916852 ) ) ( not ( = ?auto_1916849 ?auto_1916851 ) ) ( not ( = ?auto_1916849 ?auto_1916853 ) ) ( not ( = ?auto_1916849 ?auto_1916855 ) ) ( not ( = ?auto_1916850 ?auto_1916852 ) ) ( not ( = ?auto_1916850 ?auto_1916851 ) ) ( not ( = ?auto_1916850 ?auto_1916853 ) ) ( not ( = ?auto_1916850 ?auto_1916855 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1916852 ?auto_1916851 ?auto_1916853 )
      ( MAKE-5CRATE-VERIFY ?auto_1916848 ?auto_1916849 ?auto_1916850 ?auto_1916852 ?auto_1916851 ?auto_1916853 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1916899 - SURFACE
      ?auto_1916900 - SURFACE
      ?auto_1916901 - SURFACE
      ?auto_1916903 - SURFACE
      ?auto_1916902 - SURFACE
      ?auto_1916904 - SURFACE
    )
    :vars
    (
      ?auto_1916905 - HOIST
      ?auto_1916910 - PLACE
      ?auto_1916906 - PLACE
      ?auto_1916909 - HOIST
      ?auto_1916908 - SURFACE
      ?auto_1916907 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916905 ?auto_1916910 ) ( SURFACE-AT ?auto_1916902 ?auto_1916910 ) ( CLEAR ?auto_1916902 ) ( IS-CRATE ?auto_1916904 ) ( not ( = ?auto_1916902 ?auto_1916904 ) ) ( AVAILABLE ?auto_1916905 ) ( ON ?auto_1916902 ?auto_1916903 ) ( not ( = ?auto_1916903 ?auto_1916902 ) ) ( not ( = ?auto_1916903 ?auto_1916904 ) ) ( not ( = ?auto_1916906 ?auto_1916910 ) ) ( HOIST-AT ?auto_1916909 ?auto_1916906 ) ( not ( = ?auto_1916905 ?auto_1916909 ) ) ( AVAILABLE ?auto_1916909 ) ( SURFACE-AT ?auto_1916904 ?auto_1916906 ) ( ON ?auto_1916904 ?auto_1916908 ) ( CLEAR ?auto_1916904 ) ( not ( = ?auto_1916902 ?auto_1916908 ) ) ( not ( = ?auto_1916904 ?auto_1916908 ) ) ( not ( = ?auto_1916903 ?auto_1916908 ) ) ( TRUCK-AT ?auto_1916907 ?auto_1916910 ) ( ON ?auto_1916900 ?auto_1916899 ) ( ON ?auto_1916901 ?auto_1916900 ) ( ON ?auto_1916903 ?auto_1916901 ) ( not ( = ?auto_1916899 ?auto_1916900 ) ) ( not ( = ?auto_1916899 ?auto_1916901 ) ) ( not ( = ?auto_1916899 ?auto_1916903 ) ) ( not ( = ?auto_1916899 ?auto_1916902 ) ) ( not ( = ?auto_1916899 ?auto_1916904 ) ) ( not ( = ?auto_1916899 ?auto_1916908 ) ) ( not ( = ?auto_1916900 ?auto_1916901 ) ) ( not ( = ?auto_1916900 ?auto_1916903 ) ) ( not ( = ?auto_1916900 ?auto_1916902 ) ) ( not ( = ?auto_1916900 ?auto_1916904 ) ) ( not ( = ?auto_1916900 ?auto_1916908 ) ) ( not ( = ?auto_1916901 ?auto_1916903 ) ) ( not ( = ?auto_1916901 ?auto_1916902 ) ) ( not ( = ?auto_1916901 ?auto_1916904 ) ) ( not ( = ?auto_1916901 ?auto_1916908 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1916903 ?auto_1916902 ?auto_1916904 )
      ( MAKE-5CRATE-VERIFY ?auto_1916899 ?auto_1916900 ?auto_1916901 ?auto_1916903 ?auto_1916902 ?auto_1916904 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1916950 - SURFACE
      ?auto_1916951 - SURFACE
      ?auto_1916952 - SURFACE
      ?auto_1916954 - SURFACE
      ?auto_1916953 - SURFACE
      ?auto_1916955 - SURFACE
    )
    :vars
    (
      ?auto_1916956 - HOIST
      ?auto_1916958 - PLACE
      ?auto_1916960 - PLACE
      ?auto_1916957 - HOIST
      ?auto_1916959 - SURFACE
      ?auto_1916961 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916956 ?auto_1916958 ) ( IS-CRATE ?auto_1916955 ) ( not ( = ?auto_1916953 ?auto_1916955 ) ) ( not ( = ?auto_1916954 ?auto_1916953 ) ) ( not ( = ?auto_1916954 ?auto_1916955 ) ) ( not ( = ?auto_1916960 ?auto_1916958 ) ) ( HOIST-AT ?auto_1916957 ?auto_1916960 ) ( not ( = ?auto_1916956 ?auto_1916957 ) ) ( AVAILABLE ?auto_1916957 ) ( SURFACE-AT ?auto_1916955 ?auto_1916960 ) ( ON ?auto_1916955 ?auto_1916959 ) ( CLEAR ?auto_1916955 ) ( not ( = ?auto_1916953 ?auto_1916959 ) ) ( not ( = ?auto_1916955 ?auto_1916959 ) ) ( not ( = ?auto_1916954 ?auto_1916959 ) ) ( TRUCK-AT ?auto_1916961 ?auto_1916958 ) ( SURFACE-AT ?auto_1916954 ?auto_1916958 ) ( CLEAR ?auto_1916954 ) ( LIFTING ?auto_1916956 ?auto_1916953 ) ( IS-CRATE ?auto_1916953 ) ( ON ?auto_1916951 ?auto_1916950 ) ( ON ?auto_1916952 ?auto_1916951 ) ( ON ?auto_1916954 ?auto_1916952 ) ( not ( = ?auto_1916950 ?auto_1916951 ) ) ( not ( = ?auto_1916950 ?auto_1916952 ) ) ( not ( = ?auto_1916950 ?auto_1916954 ) ) ( not ( = ?auto_1916950 ?auto_1916953 ) ) ( not ( = ?auto_1916950 ?auto_1916955 ) ) ( not ( = ?auto_1916950 ?auto_1916959 ) ) ( not ( = ?auto_1916951 ?auto_1916952 ) ) ( not ( = ?auto_1916951 ?auto_1916954 ) ) ( not ( = ?auto_1916951 ?auto_1916953 ) ) ( not ( = ?auto_1916951 ?auto_1916955 ) ) ( not ( = ?auto_1916951 ?auto_1916959 ) ) ( not ( = ?auto_1916952 ?auto_1916954 ) ) ( not ( = ?auto_1916952 ?auto_1916953 ) ) ( not ( = ?auto_1916952 ?auto_1916955 ) ) ( not ( = ?auto_1916952 ?auto_1916959 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1916954 ?auto_1916953 ?auto_1916955 )
      ( MAKE-5CRATE-VERIFY ?auto_1916950 ?auto_1916951 ?auto_1916952 ?auto_1916954 ?auto_1916953 ?auto_1916955 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1917001 - SURFACE
      ?auto_1917002 - SURFACE
      ?auto_1917003 - SURFACE
      ?auto_1917005 - SURFACE
      ?auto_1917004 - SURFACE
      ?auto_1917006 - SURFACE
    )
    :vars
    (
      ?auto_1917012 - HOIST
      ?auto_1917011 - PLACE
      ?auto_1917010 - PLACE
      ?auto_1917009 - HOIST
      ?auto_1917008 - SURFACE
      ?auto_1917007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917012 ?auto_1917011 ) ( IS-CRATE ?auto_1917006 ) ( not ( = ?auto_1917004 ?auto_1917006 ) ) ( not ( = ?auto_1917005 ?auto_1917004 ) ) ( not ( = ?auto_1917005 ?auto_1917006 ) ) ( not ( = ?auto_1917010 ?auto_1917011 ) ) ( HOIST-AT ?auto_1917009 ?auto_1917010 ) ( not ( = ?auto_1917012 ?auto_1917009 ) ) ( AVAILABLE ?auto_1917009 ) ( SURFACE-AT ?auto_1917006 ?auto_1917010 ) ( ON ?auto_1917006 ?auto_1917008 ) ( CLEAR ?auto_1917006 ) ( not ( = ?auto_1917004 ?auto_1917008 ) ) ( not ( = ?auto_1917006 ?auto_1917008 ) ) ( not ( = ?auto_1917005 ?auto_1917008 ) ) ( TRUCK-AT ?auto_1917007 ?auto_1917011 ) ( SURFACE-AT ?auto_1917005 ?auto_1917011 ) ( CLEAR ?auto_1917005 ) ( IS-CRATE ?auto_1917004 ) ( AVAILABLE ?auto_1917012 ) ( IN ?auto_1917004 ?auto_1917007 ) ( ON ?auto_1917002 ?auto_1917001 ) ( ON ?auto_1917003 ?auto_1917002 ) ( ON ?auto_1917005 ?auto_1917003 ) ( not ( = ?auto_1917001 ?auto_1917002 ) ) ( not ( = ?auto_1917001 ?auto_1917003 ) ) ( not ( = ?auto_1917001 ?auto_1917005 ) ) ( not ( = ?auto_1917001 ?auto_1917004 ) ) ( not ( = ?auto_1917001 ?auto_1917006 ) ) ( not ( = ?auto_1917001 ?auto_1917008 ) ) ( not ( = ?auto_1917002 ?auto_1917003 ) ) ( not ( = ?auto_1917002 ?auto_1917005 ) ) ( not ( = ?auto_1917002 ?auto_1917004 ) ) ( not ( = ?auto_1917002 ?auto_1917006 ) ) ( not ( = ?auto_1917002 ?auto_1917008 ) ) ( not ( = ?auto_1917003 ?auto_1917005 ) ) ( not ( = ?auto_1917003 ?auto_1917004 ) ) ( not ( = ?auto_1917003 ?auto_1917006 ) ) ( not ( = ?auto_1917003 ?auto_1917008 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917005 ?auto_1917004 ?auto_1917006 )
      ( MAKE-5CRATE-VERIFY ?auto_1917001 ?auto_1917002 ?auto_1917003 ?auto_1917005 ?auto_1917004 ?auto_1917006 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1918210 - SURFACE
      ?auto_1918211 - SURFACE
      ?auto_1918212 - SURFACE
      ?auto_1918214 - SURFACE
      ?auto_1918213 - SURFACE
      ?auto_1918215 - SURFACE
      ?auto_1918216 - SURFACE
    )
    :vars
    (
      ?auto_1918217 - HOIST
      ?auto_1918218 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918217 ?auto_1918218 ) ( SURFACE-AT ?auto_1918215 ?auto_1918218 ) ( CLEAR ?auto_1918215 ) ( LIFTING ?auto_1918217 ?auto_1918216 ) ( IS-CRATE ?auto_1918216 ) ( not ( = ?auto_1918215 ?auto_1918216 ) ) ( ON ?auto_1918211 ?auto_1918210 ) ( ON ?auto_1918212 ?auto_1918211 ) ( ON ?auto_1918214 ?auto_1918212 ) ( ON ?auto_1918213 ?auto_1918214 ) ( ON ?auto_1918215 ?auto_1918213 ) ( not ( = ?auto_1918210 ?auto_1918211 ) ) ( not ( = ?auto_1918210 ?auto_1918212 ) ) ( not ( = ?auto_1918210 ?auto_1918214 ) ) ( not ( = ?auto_1918210 ?auto_1918213 ) ) ( not ( = ?auto_1918210 ?auto_1918215 ) ) ( not ( = ?auto_1918210 ?auto_1918216 ) ) ( not ( = ?auto_1918211 ?auto_1918212 ) ) ( not ( = ?auto_1918211 ?auto_1918214 ) ) ( not ( = ?auto_1918211 ?auto_1918213 ) ) ( not ( = ?auto_1918211 ?auto_1918215 ) ) ( not ( = ?auto_1918211 ?auto_1918216 ) ) ( not ( = ?auto_1918212 ?auto_1918214 ) ) ( not ( = ?auto_1918212 ?auto_1918213 ) ) ( not ( = ?auto_1918212 ?auto_1918215 ) ) ( not ( = ?auto_1918212 ?auto_1918216 ) ) ( not ( = ?auto_1918214 ?auto_1918213 ) ) ( not ( = ?auto_1918214 ?auto_1918215 ) ) ( not ( = ?auto_1918214 ?auto_1918216 ) ) ( not ( = ?auto_1918213 ?auto_1918215 ) ) ( not ( = ?auto_1918213 ?auto_1918216 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1918215 ?auto_1918216 )
      ( MAKE-6CRATE-VERIFY ?auto_1918210 ?auto_1918211 ?auto_1918212 ?auto_1918214 ?auto_1918213 ?auto_1918215 ?auto_1918216 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1918254 - SURFACE
      ?auto_1918255 - SURFACE
      ?auto_1918256 - SURFACE
      ?auto_1918258 - SURFACE
      ?auto_1918257 - SURFACE
      ?auto_1918259 - SURFACE
      ?auto_1918260 - SURFACE
    )
    :vars
    (
      ?auto_1918261 - HOIST
      ?auto_1918263 - PLACE
      ?auto_1918262 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918261 ?auto_1918263 ) ( SURFACE-AT ?auto_1918259 ?auto_1918263 ) ( CLEAR ?auto_1918259 ) ( IS-CRATE ?auto_1918260 ) ( not ( = ?auto_1918259 ?auto_1918260 ) ) ( TRUCK-AT ?auto_1918262 ?auto_1918263 ) ( AVAILABLE ?auto_1918261 ) ( IN ?auto_1918260 ?auto_1918262 ) ( ON ?auto_1918259 ?auto_1918257 ) ( not ( = ?auto_1918257 ?auto_1918259 ) ) ( not ( = ?auto_1918257 ?auto_1918260 ) ) ( ON ?auto_1918255 ?auto_1918254 ) ( ON ?auto_1918256 ?auto_1918255 ) ( ON ?auto_1918258 ?auto_1918256 ) ( ON ?auto_1918257 ?auto_1918258 ) ( not ( = ?auto_1918254 ?auto_1918255 ) ) ( not ( = ?auto_1918254 ?auto_1918256 ) ) ( not ( = ?auto_1918254 ?auto_1918258 ) ) ( not ( = ?auto_1918254 ?auto_1918257 ) ) ( not ( = ?auto_1918254 ?auto_1918259 ) ) ( not ( = ?auto_1918254 ?auto_1918260 ) ) ( not ( = ?auto_1918255 ?auto_1918256 ) ) ( not ( = ?auto_1918255 ?auto_1918258 ) ) ( not ( = ?auto_1918255 ?auto_1918257 ) ) ( not ( = ?auto_1918255 ?auto_1918259 ) ) ( not ( = ?auto_1918255 ?auto_1918260 ) ) ( not ( = ?auto_1918256 ?auto_1918258 ) ) ( not ( = ?auto_1918256 ?auto_1918257 ) ) ( not ( = ?auto_1918256 ?auto_1918259 ) ) ( not ( = ?auto_1918256 ?auto_1918260 ) ) ( not ( = ?auto_1918258 ?auto_1918257 ) ) ( not ( = ?auto_1918258 ?auto_1918259 ) ) ( not ( = ?auto_1918258 ?auto_1918260 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1918257 ?auto_1918259 ?auto_1918260 )
      ( MAKE-6CRATE-VERIFY ?auto_1918254 ?auto_1918255 ?auto_1918256 ?auto_1918258 ?auto_1918257 ?auto_1918259 ?auto_1918260 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1918305 - SURFACE
      ?auto_1918306 - SURFACE
      ?auto_1918307 - SURFACE
      ?auto_1918309 - SURFACE
      ?auto_1918308 - SURFACE
      ?auto_1918310 - SURFACE
      ?auto_1918311 - SURFACE
    )
    :vars
    (
      ?auto_1918313 - HOIST
      ?auto_1918312 - PLACE
      ?auto_1918315 - TRUCK
      ?auto_1918314 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918313 ?auto_1918312 ) ( SURFACE-AT ?auto_1918310 ?auto_1918312 ) ( CLEAR ?auto_1918310 ) ( IS-CRATE ?auto_1918311 ) ( not ( = ?auto_1918310 ?auto_1918311 ) ) ( AVAILABLE ?auto_1918313 ) ( IN ?auto_1918311 ?auto_1918315 ) ( ON ?auto_1918310 ?auto_1918308 ) ( not ( = ?auto_1918308 ?auto_1918310 ) ) ( not ( = ?auto_1918308 ?auto_1918311 ) ) ( TRUCK-AT ?auto_1918315 ?auto_1918314 ) ( not ( = ?auto_1918314 ?auto_1918312 ) ) ( ON ?auto_1918306 ?auto_1918305 ) ( ON ?auto_1918307 ?auto_1918306 ) ( ON ?auto_1918309 ?auto_1918307 ) ( ON ?auto_1918308 ?auto_1918309 ) ( not ( = ?auto_1918305 ?auto_1918306 ) ) ( not ( = ?auto_1918305 ?auto_1918307 ) ) ( not ( = ?auto_1918305 ?auto_1918309 ) ) ( not ( = ?auto_1918305 ?auto_1918308 ) ) ( not ( = ?auto_1918305 ?auto_1918310 ) ) ( not ( = ?auto_1918305 ?auto_1918311 ) ) ( not ( = ?auto_1918306 ?auto_1918307 ) ) ( not ( = ?auto_1918306 ?auto_1918309 ) ) ( not ( = ?auto_1918306 ?auto_1918308 ) ) ( not ( = ?auto_1918306 ?auto_1918310 ) ) ( not ( = ?auto_1918306 ?auto_1918311 ) ) ( not ( = ?auto_1918307 ?auto_1918309 ) ) ( not ( = ?auto_1918307 ?auto_1918308 ) ) ( not ( = ?auto_1918307 ?auto_1918310 ) ) ( not ( = ?auto_1918307 ?auto_1918311 ) ) ( not ( = ?auto_1918309 ?auto_1918308 ) ) ( not ( = ?auto_1918309 ?auto_1918310 ) ) ( not ( = ?auto_1918309 ?auto_1918311 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1918308 ?auto_1918310 ?auto_1918311 )
      ( MAKE-6CRATE-VERIFY ?auto_1918305 ?auto_1918306 ?auto_1918307 ?auto_1918309 ?auto_1918308 ?auto_1918310 ?auto_1918311 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1918362 - SURFACE
      ?auto_1918363 - SURFACE
      ?auto_1918364 - SURFACE
      ?auto_1918366 - SURFACE
      ?auto_1918365 - SURFACE
      ?auto_1918367 - SURFACE
      ?auto_1918368 - SURFACE
    )
    :vars
    (
      ?auto_1918372 - HOIST
      ?auto_1918371 - PLACE
      ?auto_1918369 - TRUCK
      ?auto_1918373 - PLACE
      ?auto_1918370 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918372 ?auto_1918371 ) ( SURFACE-AT ?auto_1918367 ?auto_1918371 ) ( CLEAR ?auto_1918367 ) ( IS-CRATE ?auto_1918368 ) ( not ( = ?auto_1918367 ?auto_1918368 ) ) ( AVAILABLE ?auto_1918372 ) ( ON ?auto_1918367 ?auto_1918365 ) ( not ( = ?auto_1918365 ?auto_1918367 ) ) ( not ( = ?auto_1918365 ?auto_1918368 ) ) ( TRUCK-AT ?auto_1918369 ?auto_1918373 ) ( not ( = ?auto_1918373 ?auto_1918371 ) ) ( HOIST-AT ?auto_1918370 ?auto_1918373 ) ( LIFTING ?auto_1918370 ?auto_1918368 ) ( not ( = ?auto_1918372 ?auto_1918370 ) ) ( ON ?auto_1918363 ?auto_1918362 ) ( ON ?auto_1918364 ?auto_1918363 ) ( ON ?auto_1918366 ?auto_1918364 ) ( ON ?auto_1918365 ?auto_1918366 ) ( not ( = ?auto_1918362 ?auto_1918363 ) ) ( not ( = ?auto_1918362 ?auto_1918364 ) ) ( not ( = ?auto_1918362 ?auto_1918366 ) ) ( not ( = ?auto_1918362 ?auto_1918365 ) ) ( not ( = ?auto_1918362 ?auto_1918367 ) ) ( not ( = ?auto_1918362 ?auto_1918368 ) ) ( not ( = ?auto_1918363 ?auto_1918364 ) ) ( not ( = ?auto_1918363 ?auto_1918366 ) ) ( not ( = ?auto_1918363 ?auto_1918365 ) ) ( not ( = ?auto_1918363 ?auto_1918367 ) ) ( not ( = ?auto_1918363 ?auto_1918368 ) ) ( not ( = ?auto_1918364 ?auto_1918366 ) ) ( not ( = ?auto_1918364 ?auto_1918365 ) ) ( not ( = ?auto_1918364 ?auto_1918367 ) ) ( not ( = ?auto_1918364 ?auto_1918368 ) ) ( not ( = ?auto_1918366 ?auto_1918365 ) ) ( not ( = ?auto_1918366 ?auto_1918367 ) ) ( not ( = ?auto_1918366 ?auto_1918368 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1918365 ?auto_1918367 ?auto_1918368 )
      ( MAKE-6CRATE-VERIFY ?auto_1918362 ?auto_1918363 ?auto_1918364 ?auto_1918366 ?auto_1918365 ?auto_1918367 ?auto_1918368 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1918425 - SURFACE
      ?auto_1918426 - SURFACE
      ?auto_1918427 - SURFACE
      ?auto_1918429 - SURFACE
      ?auto_1918428 - SURFACE
      ?auto_1918430 - SURFACE
      ?auto_1918431 - SURFACE
    )
    :vars
    (
      ?auto_1918434 - HOIST
      ?auto_1918436 - PLACE
      ?auto_1918432 - TRUCK
      ?auto_1918437 - PLACE
      ?auto_1918435 - HOIST
      ?auto_1918433 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918434 ?auto_1918436 ) ( SURFACE-AT ?auto_1918430 ?auto_1918436 ) ( CLEAR ?auto_1918430 ) ( IS-CRATE ?auto_1918431 ) ( not ( = ?auto_1918430 ?auto_1918431 ) ) ( AVAILABLE ?auto_1918434 ) ( ON ?auto_1918430 ?auto_1918428 ) ( not ( = ?auto_1918428 ?auto_1918430 ) ) ( not ( = ?auto_1918428 ?auto_1918431 ) ) ( TRUCK-AT ?auto_1918432 ?auto_1918437 ) ( not ( = ?auto_1918437 ?auto_1918436 ) ) ( HOIST-AT ?auto_1918435 ?auto_1918437 ) ( not ( = ?auto_1918434 ?auto_1918435 ) ) ( AVAILABLE ?auto_1918435 ) ( SURFACE-AT ?auto_1918431 ?auto_1918437 ) ( ON ?auto_1918431 ?auto_1918433 ) ( CLEAR ?auto_1918431 ) ( not ( = ?auto_1918430 ?auto_1918433 ) ) ( not ( = ?auto_1918431 ?auto_1918433 ) ) ( not ( = ?auto_1918428 ?auto_1918433 ) ) ( ON ?auto_1918426 ?auto_1918425 ) ( ON ?auto_1918427 ?auto_1918426 ) ( ON ?auto_1918429 ?auto_1918427 ) ( ON ?auto_1918428 ?auto_1918429 ) ( not ( = ?auto_1918425 ?auto_1918426 ) ) ( not ( = ?auto_1918425 ?auto_1918427 ) ) ( not ( = ?auto_1918425 ?auto_1918429 ) ) ( not ( = ?auto_1918425 ?auto_1918428 ) ) ( not ( = ?auto_1918425 ?auto_1918430 ) ) ( not ( = ?auto_1918425 ?auto_1918431 ) ) ( not ( = ?auto_1918425 ?auto_1918433 ) ) ( not ( = ?auto_1918426 ?auto_1918427 ) ) ( not ( = ?auto_1918426 ?auto_1918429 ) ) ( not ( = ?auto_1918426 ?auto_1918428 ) ) ( not ( = ?auto_1918426 ?auto_1918430 ) ) ( not ( = ?auto_1918426 ?auto_1918431 ) ) ( not ( = ?auto_1918426 ?auto_1918433 ) ) ( not ( = ?auto_1918427 ?auto_1918429 ) ) ( not ( = ?auto_1918427 ?auto_1918428 ) ) ( not ( = ?auto_1918427 ?auto_1918430 ) ) ( not ( = ?auto_1918427 ?auto_1918431 ) ) ( not ( = ?auto_1918427 ?auto_1918433 ) ) ( not ( = ?auto_1918429 ?auto_1918428 ) ) ( not ( = ?auto_1918429 ?auto_1918430 ) ) ( not ( = ?auto_1918429 ?auto_1918431 ) ) ( not ( = ?auto_1918429 ?auto_1918433 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1918428 ?auto_1918430 ?auto_1918431 )
      ( MAKE-6CRATE-VERIFY ?auto_1918425 ?auto_1918426 ?auto_1918427 ?auto_1918429 ?auto_1918428 ?auto_1918430 ?auto_1918431 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1918489 - SURFACE
      ?auto_1918490 - SURFACE
      ?auto_1918491 - SURFACE
      ?auto_1918493 - SURFACE
      ?auto_1918492 - SURFACE
      ?auto_1918494 - SURFACE
      ?auto_1918495 - SURFACE
    )
    :vars
    (
      ?auto_1918501 - HOIST
      ?auto_1918500 - PLACE
      ?auto_1918497 - PLACE
      ?auto_1918496 - HOIST
      ?auto_1918498 - SURFACE
      ?auto_1918499 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918501 ?auto_1918500 ) ( SURFACE-AT ?auto_1918494 ?auto_1918500 ) ( CLEAR ?auto_1918494 ) ( IS-CRATE ?auto_1918495 ) ( not ( = ?auto_1918494 ?auto_1918495 ) ) ( AVAILABLE ?auto_1918501 ) ( ON ?auto_1918494 ?auto_1918492 ) ( not ( = ?auto_1918492 ?auto_1918494 ) ) ( not ( = ?auto_1918492 ?auto_1918495 ) ) ( not ( = ?auto_1918497 ?auto_1918500 ) ) ( HOIST-AT ?auto_1918496 ?auto_1918497 ) ( not ( = ?auto_1918501 ?auto_1918496 ) ) ( AVAILABLE ?auto_1918496 ) ( SURFACE-AT ?auto_1918495 ?auto_1918497 ) ( ON ?auto_1918495 ?auto_1918498 ) ( CLEAR ?auto_1918495 ) ( not ( = ?auto_1918494 ?auto_1918498 ) ) ( not ( = ?auto_1918495 ?auto_1918498 ) ) ( not ( = ?auto_1918492 ?auto_1918498 ) ) ( TRUCK-AT ?auto_1918499 ?auto_1918500 ) ( ON ?auto_1918490 ?auto_1918489 ) ( ON ?auto_1918491 ?auto_1918490 ) ( ON ?auto_1918493 ?auto_1918491 ) ( ON ?auto_1918492 ?auto_1918493 ) ( not ( = ?auto_1918489 ?auto_1918490 ) ) ( not ( = ?auto_1918489 ?auto_1918491 ) ) ( not ( = ?auto_1918489 ?auto_1918493 ) ) ( not ( = ?auto_1918489 ?auto_1918492 ) ) ( not ( = ?auto_1918489 ?auto_1918494 ) ) ( not ( = ?auto_1918489 ?auto_1918495 ) ) ( not ( = ?auto_1918489 ?auto_1918498 ) ) ( not ( = ?auto_1918490 ?auto_1918491 ) ) ( not ( = ?auto_1918490 ?auto_1918493 ) ) ( not ( = ?auto_1918490 ?auto_1918492 ) ) ( not ( = ?auto_1918490 ?auto_1918494 ) ) ( not ( = ?auto_1918490 ?auto_1918495 ) ) ( not ( = ?auto_1918490 ?auto_1918498 ) ) ( not ( = ?auto_1918491 ?auto_1918493 ) ) ( not ( = ?auto_1918491 ?auto_1918492 ) ) ( not ( = ?auto_1918491 ?auto_1918494 ) ) ( not ( = ?auto_1918491 ?auto_1918495 ) ) ( not ( = ?auto_1918491 ?auto_1918498 ) ) ( not ( = ?auto_1918493 ?auto_1918492 ) ) ( not ( = ?auto_1918493 ?auto_1918494 ) ) ( not ( = ?auto_1918493 ?auto_1918495 ) ) ( not ( = ?auto_1918493 ?auto_1918498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1918492 ?auto_1918494 ?auto_1918495 )
      ( MAKE-6CRATE-VERIFY ?auto_1918489 ?auto_1918490 ?auto_1918491 ?auto_1918493 ?auto_1918492 ?auto_1918494 ?auto_1918495 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1918553 - SURFACE
      ?auto_1918554 - SURFACE
      ?auto_1918555 - SURFACE
      ?auto_1918557 - SURFACE
      ?auto_1918556 - SURFACE
      ?auto_1918558 - SURFACE
      ?auto_1918559 - SURFACE
    )
    :vars
    (
      ?auto_1918561 - HOIST
      ?auto_1918565 - PLACE
      ?auto_1918563 - PLACE
      ?auto_1918562 - HOIST
      ?auto_1918564 - SURFACE
      ?auto_1918560 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918561 ?auto_1918565 ) ( IS-CRATE ?auto_1918559 ) ( not ( = ?auto_1918558 ?auto_1918559 ) ) ( not ( = ?auto_1918556 ?auto_1918558 ) ) ( not ( = ?auto_1918556 ?auto_1918559 ) ) ( not ( = ?auto_1918563 ?auto_1918565 ) ) ( HOIST-AT ?auto_1918562 ?auto_1918563 ) ( not ( = ?auto_1918561 ?auto_1918562 ) ) ( AVAILABLE ?auto_1918562 ) ( SURFACE-AT ?auto_1918559 ?auto_1918563 ) ( ON ?auto_1918559 ?auto_1918564 ) ( CLEAR ?auto_1918559 ) ( not ( = ?auto_1918558 ?auto_1918564 ) ) ( not ( = ?auto_1918559 ?auto_1918564 ) ) ( not ( = ?auto_1918556 ?auto_1918564 ) ) ( TRUCK-AT ?auto_1918560 ?auto_1918565 ) ( SURFACE-AT ?auto_1918556 ?auto_1918565 ) ( CLEAR ?auto_1918556 ) ( LIFTING ?auto_1918561 ?auto_1918558 ) ( IS-CRATE ?auto_1918558 ) ( ON ?auto_1918554 ?auto_1918553 ) ( ON ?auto_1918555 ?auto_1918554 ) ( ON ?auto_1918557 ?auto_1918555 ) ( ON ?auto_1918556 ?auto_1918557 ) ( not ( = ?auto_1918553 ?auto_1918554 ) ) ( not ( = ?auto_1918553 ?auto_1918555 ) ) ( not ( = ?auto_1918553 ?auto_1918557 ) ) ( not ( = ?auto_1918553 ?auto_1918556 ) ) ( not ( = ?auto_1918553 ?auto_1918558 ) ) ( not ( = ?auto_1918553 ?auto_1918559 ) ) ( not ( = ?auto_1918553 ?auto_1918564 ) ) ( not ( = ?auto_1918554 ?auto_1918555 ) ) ( not ( = ?auto_1918554 ?auto_1918557 ) ) ( not ( = ?auto_1918554 ?auto_1918556 ) ) ( not ( = ?auto_1918554 ?auto_1918558 ) ) ( not ( = ?auto_1918554 ?auto_1918559 ) ) ( not ( = ?auto_1918554 ?auto_1918564 ) ) ( not ( = ?auto_1918555 ?auto_1918557 ) ) ( not ( = ?auto_1918555 ?auto_1918556 ) ) ( not ( = ?auto_1918555 ?auto_1918558 ) ) ( not ( = ?auto_1918555 ?auto_1918559 ) ) ( not ( = ?auto_1918555 ?auto_1918564 ) ) ( not ( = ?auto_1918557 ?auto_1918556 ) ) ( not ( = ?auto_1918557 ?auto_1918558 ) ) ( not ( = ?auto_1918557 ?auto_1918559 ) ) ( not ( = ?auto_1918557 ?auto_1918564 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1918556 ?auto_1918558 ?auto_1918559 )
      ( MAKE-6CRATE-VERIFY ?auto_1918553 ?auto_1918554 ?auto_1918555 ?auto_1918557 ?auto_1918556 ?auto_1918558 ?auto_1918559 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1918617 - SURFACE
      ?auto_1918618 - SURFACE
      ?auto_1918619 - SURFACE
      ?auto_1918621 - SURFACE
      ?auto_1918620 - SURFACE
      ?auto_1918622 - SURFACE
      ?auto_1918623 - SURFACE
    )
    :vars
    (
      ?auto_1918626 - HOIST
      ?auto_1918624 - PLACE
      ?auto_1918627 - PLACE
      ?auto_1918629 - HOIST
      ?auto_1918628 - SURFACE
      ?auto_1918625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918626 ?auto_1918624 ) ( IS-CRATE ?auto_1918623 ) ( not ( = ?auto_1918622 ?auto_1918623 ) ) ( not ( = ?auto_1918620 ?auto_1918622 ) ) ( not ( = ?auto_1918620 ?auto_1918623 ) ) ( not ( = ?auto_1918627 ?auto_1918624 ) ) ( HOIST-AT ?auto_1918629 ?auto_1918627 ) ( not ( = ?auto_1918626 ?auto_1918629 ) ) ( AVAILABLE ?auto_1918629 ) ( SURFACE-AT ?auto_1918623 ?auto_1918627 ) ( ON ?auto_1918623 ?auto_1918628 ) ( CLEAR ?auto_1918623 ) ( not ( = ?auto_1918622 ?auto_1918628 ) ) ( not ( = ?auto_1918623 ?auto_1918628 ) ) ( not ( = ?auto_1918620 ?auto_1918628 ) ) ( TRUCK-AT ?auto_1918625 ?auto_1918624 ) ( SURFACE-AT ?auto_1918620 ?auto_1918624 ) ( CLEAR ?auto_1918620 ) ( IS-CRATE ?auto_1918622 ) ( AVAILABLE ?auto_1918626 ) ( IN ?auto_1918622 ?auto_1918625 ) ( ON ?auto_1918618 ?auto_1918617 ) ( ON ?auto_1918619 ?auto_1918618 ) ( ON ?auto_1918621 ?auto_1918619 ) ( ON ?auto_1918620 ?auto_1918621 ) ( not ( = ?auto_1918617 ?auto_1918618 ) ) ( not ( = ?auto_1918617 ?auto_1918619 ) ) ( not ( = ?auto_1918617 ?auto_1918621 ) ) ( not ( = ?auto_1918617 ?auto_1918620 ) ) ( not ( = ?auto_1918617 ?auto_1918622 ) ) ( not ( = ?auto_1918617 ?auto_1918623 ) ) ( not ( = ?auto_1918617 ?auto_1918628 ) ) ( not ( = ?auto_1918618 ?auto_1918619 ) ) ( not ( = ?auto_1918618 ?auto_1918621 ) ) ( not ( = ?auto_1918618 ?auto_1918620 ) ) ( not ( = ?auto_1918618 ?auto_1918622 ) ) ( not ( = ?auto_1918618 ?auto_1918623 ) ) ( not ( = ?auto_1918618 ?auto_1918628 ) ) ( not ( = ?auto_1918619 ?auto_1918621 ) ) ( not ( = ?auto_1918619 ?auto_1918620 ) ) ( not ( = ?auto_1918619 ?auto_1918622 ) ) ( not ( = ?auto_1918619 ?auto_1918623 ) ) ( not ( = ?auto_1918619 ?auto_1918628 ) ) ( not ( = ?auto_1918621 ?auto_1918620 ) ) ( not ( = ?auto_1918621 ?auto_1918622 ) ) ( not ( = ?auto_1918621 ?auto_1918623 ) ) ( not ( = ?auto_1918621 ?auto_1918628 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1918620 ?auto_1918622 ?auto_1918623 )
      ( MAKE-6CRATE-VERIFY ?auto_1918617 ?auto_1918618 ?auto_1918619 ?auto_1918621 ?auto_1918620 ?auto_1918622 ?auto_1918623 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1920573 - SURFACE
      ?auto_1920574 - SURFACE
      ?auto_1920575 - SURFACE
      ?auto_1920577 - SURFACE
      ?auto_1920576 - SURFACE
      ?auto_1920578 - SURFACE
      ?auto_1920579 - SURFACE
      ?auto_1920580 - SURFACE
    )
    :vars
    (
      ?auto_1920581 - HOIST
      ?auto_1920582 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1920581 ?auto_1920582 ) ( SURFACE-AT ?auto_1920579 ?auto_1920582 ) ( CLEAR ?auto_1920579 ) ( LIFTING ?auto_1920581 ?auto_1920580 ) ( IS-CRATE ?auto_1920580 ) ( not ( = ?auto_1920579 ?auto_1920580 ) ) ( ON ?auto_1920574 ?auto_1920573 ) ( ON ?auto_1920575 ?auto_1920574 ) ( ON ?auto_1920577 ?auto_1920575 ) ( ON ?auto_1920576 ?auto_1920577 ) ( ON ?auto_1920578 ?auto_1920576 ) ( ON ?auto_1920579 ?auto_1920578 ) ( not ( = ?auto_1920573 ?auto_1920574 ) ) ( not ( = ?auto_1920573 ?auto_1920575 ) ) ( not ( = ?auto_1920573 ?auto_1920577 ) ) ( not ( = ?auto_1920573 ?auto_1920576 ) ) ( not ( = ?auto_1920573 ?auto_1920578 ) ) ( not ( = ?auto_1920573 ?auto_1920579 ) ) ( not ( = ?auto_1920573 ?auto_1920580 ) ) ( not ( = ?auto_1920574 ?auto_1920575 ) ) ( not ( = ?auto_1920574 ?auto_1920577 ) ) ( not ( = ?auto_1920574 ?auto_1920576 ) ) ( not ( = ?auto_1920574 ?auto_1920578 ) ) ( not ( = ?auto_1920574 ?auto_1920579 ) ) ( not ( = ?auto_1920574 ?auto_1920580 ) ) ( not ( = ?auto_1920575 ?auto_1920577 ) ) ( not ( = ?auto_1920575 ?auto_1920576 ) ) ( not ( = ?auto_1920575 ?auto_1920578 ) ) ( not ( = ?auto_1920575 ?auto_1920579 ) ) ( not ( = ?auto_1920575 ?auto_1920580 ) ) ( not ( = ?auto_1920577 ?auto_1920576 ) ) ( not ( = ?auto_1920577 ?auto_1920578 ) ) ( not ( = ?auto_1920577 ?auto_1920579 ) ) ( not ( = ?auto_1920577 ?auto_1920580 ) ) ( not ( = ?auto_1920576 ?auto_1920578 ) ) ( not ( = ?auto_1920576 ?auto_1920579 ) ) ( not ( = ?auto_1920576 ?auto_1920580 ) ) ( not ( = ?auto_1920578 ?auto_1920579 ) ) ( not ( = ?auto_1920578 ?auto_1920580 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1920579 ?auto_1920580 )
      ( MAKE-7CRATE-VERIFY ?auto_1920573 ?auto_1920574 ?auto_1920575 ?auto_1920577 ?auto_1920576 ?auto_1920578 ?auto_1920579 ?auto_1920580 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1920628 - SURFACE
      ?auto_1920629 - SURFACE
      ?auto_1920630 - SURFACE
      ?auto_1920632 - SURFACE
      ?auto_1920631 - SURFACE
      ?auto_1920633 - SURFACE
      ?auto_1920634 - SURFACE
      ?auto_1920635 - SURFACE
    )
    :vars
    (
      ?auto_1920636 - HOIST
      ?auto_1920638 - PLACE
      ?auto_1920637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1920636 ?auto_1920638 ) ( SURFACE-AT ?auto_1920634 ?auto_1920638 ) ( CLEAR ?auto_1920634 ) ( IS-CRATE ?auto_1920635 ) ( not ( = ?auto_1920634 ?auto_1920635 ) ) ( TRUCK-AT ?auto_1920637 ?auto_1920638 ) ( AVAILABLE ?auto_1920636 ) ( IN ?auto_1920635 ?auto_1920637 ) ( ON ?auto_1920634 ?auto_1920633 ) ( not ( = ?auto_1920633 ?auto_1920634 ) ) ( not ( = ?auto_1920633 ?auto_1920635 ) ) ( ON ?auto_1920629 ?auto_1920628 ) ( ON ?auto_1920630 ?auto_1920629 ) ( ON ?auto_1920632 ?auto_1920630 ) ( ON ?auto_1920631 ?auto_1920632 ) ( ON ?auto_1920633 ?auto_1920631 ) ( not ( = ?auto_1920628 ?auto_1920629 ) ) ( not ( = ?auto_1920628 ?auto_1920630 ) ) ( not ( = ?auto_1920628 ?auto_1920632 ) ) ( not ( = ?auto_1920628 ?auto_1920631 ) ) ( not ( = ?auto_1920628 ?auto_1920633 ) ) ( not ( = ?auto_1920628 ?auto_1920634 ) ) ( not ( = ?auto_1920628 ?auto_1920635 ) ) ( not ( = ?auto_1920629 ?auto_1920630 ) ) ( not ( = ?auto_1920629 ?auto_1920632 ) ) ( not ( = ?auto_1920629 ?auto_1920631 ) ) ( not ( = ?auto_1920629 ?auto_1920633 ) ) ( not ( = ?auto_1920629 ?auto_1920634 ) ) ( not ( = ?auto_1920629 ?auto_1920635 ) ) ( not ( = ?auto_1920630 ?auto_1920632 ) ) ( not ( = ?auto_1920630 ?auto_1920631 ) ) ( not ( = ?auto_1920630 ?auto_1920633 ) ) ( not ( = ?auto_1920630 ?auto_1920634 ) ) ( not ( = ?auto_1920630 ?auto_1920635 ) ) ( not ( = ?auto_1920632 ?auto_1920631 ) ) ( not ( = ?auto_1920632 ?auto_1920633 ) ) ( not ( = ?auto_1920632 ?auto_1920634 ) ) ( not ( = ?auto_1920632 ?auto_1920635 ) ) ( not ( = ?auto_1920631 ?auto_1920633 ) ) ( not ( = ?auto_1920631 ?auto_1920634 ) ) ( not ( = ?auto_1920631 ?auto_1920635 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1920633 ?auto_1920634 ?auto_1920635 )
      ( MAKE-7CRATE-VERIFY ?auto_1920628 ?auto_1920629 ?auto_1920630 ?auto_1920632 ?auto_1920631 ?auto_1920633 ?auto_1920634 ?auto_1920635 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1920691 - SURFACE
      ?auto_1920692 - SURFACE
      ?auto_1920693 - SURFACE
      ?auto_1920695 - SURFACE
      ?auto_1920694 - SURFACE
      ?auto_1920696 - SURFACE
      ?auto_1920697 - SURFACE
      ?auto_1920698 - SURFACE
    )
    :vars
    (
      ?auto_1920702 - HOIST
      ?auto_1920699 - PLACE
      ?auto_1920701 - TRUCK
      ?auto_1920700 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1920702 ?auto_1920699 ) ( SURFACE-AT ?auto_1920697 ?auto_1920699 ) ( CLEAR ?auto_1920697 ) ( IS-CRATE ?auto_1920698 ) ( not ( = ?auto_1920697 ?auto_1920698 ) ) ( AVAILABLE ?auto_1920702 ) ( IN ?auto_1920698 ?auto_1920701 ) ( ON ?auto_1920697 ?auto_1920696 ) ( not ( = ?auto_1920696 ?auto_1920697 ) ) ( not ( = ?auto_1920696 ?auto_1920698 ) ) ( TRUCK-AT ?auto_1920701 ?auto_1920700 ) ( not ( = ?auto_1920700 ?auto_1920699 ) ) ( ON ?auto_1920692 ?auto_1920691 ) ( ON ?auto_1920693 ?auto_1920692 ) ( ON ?auto_1920695 ?auto_1920693 ) ( ON ?auto_1920694 ?auto_1920695 ) ( ON ?auto_1920696 ?auto_1920694 ) ( not ( = ?auto_1920691 ?auto_1920692 ) ) ( not ( = ?auto_1920691 ?auto_1920693 ) ) ( not ( = ?auto_1920691 ?auto_1920695 ) ) ( not ( = ?auto_1920691 ?auto_1920694 ) ) ( not ( = ?auto_1920691 ?auto_1920696 ) ) ( not ( = ?auto_1920691 ?auto_1920697 ) ) ( not ( = ?auto_1920691 ?auto_1920698 ) ) ( not ( = ?auto_1920692 ?auto_1920693 ) ) ( not ( = ?auto_1920692 ?auto_1920695 ) ) ( not ( = ?auto_1920692 ?auto_1920694 ) ) ( not ( = ?auto_1920692 ?auto_1920696 ) ) ( not ( = ?auto_1920692 ?auto_1920697 ) ) ( not ( = ?auto_1920692 ?auto_1920698 ) ) ( not ( = ?auto_1920693 ?auto_1920695 ) ) ( not ( = ?auto_1920693 ?auto_1920694 ) ) ( not ( = ?auto_1920693 ?auto_1920696 ) ) ( not ( = ?auto_1920693 ?auto_1920697 ) ) ( not ( = ?auto_1920693 ?auto_1920698 ) ) ( not ( = ?auto_1920695 ?auto_1920694 ) ) ( not ( = ?auto_1920695 ?auto_1920696 ) ) ( not ( = ?auto_1920695 ?auto_1920697 ) ) ( not ( = ?auto_1920695 ?auto_1920698 ) ) ( not ( = ?auto_1920694 ?auto_1920696 ) ) ( not ( = ?auto_1920694 ?auto_1920697 ) ) ( not ( = ?auto_1920694 ?auto_1920698 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1920696 ?auto_1920697 ?auto_1920698 )
      ( MAKE-7CRATE-VERIFY ?auto_1920691 ?auto_1920692 ?auto_1920693 ?auto_1920695 ?auto_1920694 ?auto_1920696 ?auto_1920697 ?auto_1920698 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1920761 - SURFACE
      ?auto_1920762 - SURFACE
      ?auto_1920763 - SURFACE
      ?auto_1920765 - SURFACE
      ?auto_1920764 - SURFACE
      ?auto_1920766 - SURFACE
      ?auto_1920767 - SURFACE
      ?auto_1920768 - SURFACE
    )
    :vars
    (
      ?auto_1920769 - HOIST
      ?auto_1920772 - PLACE
      ?auto_1920771 - TRUCK
      ?auto_1920770 - PLACE
      ?auto_1920773 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1920769 ?auto_1920772 ) ( SURFACE-AT ?auto_1920767 ?auto_1920772 ) ( CLEAR ?auto_1920767 ) ( IS-CRATE ?auto_1920768 ) ( not ( = ?auto_1920767 ?auto_1920768 ) ) ( AVAILABLE ?auto_1920769 ) ( ON ?auto_1920767 ?auto_1920766 ) ( not ( = ?auto_1920766 ?auto_1920767 ) ) ( not ( = ?auto_1920766 ?auto_1920768 ) ) ( TRUCK-AT ?auto_1920771 ?auto_1920770 ) ( not ( = ?auto_1920770 ?auto_1920772 ) ) ( HOIST-AT ?auto_1920773 ?auto_1920770 ) ( LIFTING ?auto_1920773 ?auto_1920768 ) ( not ( = ?auto_1920769 ?auto_1920773 ) ) ( ON ?auto_1920762 ?auto_1920761 ) ( ON ?auto_1920763 ?auto_1920762 ) ( ON ?auto_1920765 ?auto_1920763 ) ( ON ?auto_1920764 ?auto_1920765 ) ( ON ?auto_1920766 ?auto_1920764 ) ( not ( = ?auto_1920761 ?auto_1920762 ) ) ( not ( = ?auto_1920761 ?auto_1920763 ) ) ( not ( = ?auto_1920761 ?auto_1920765 ) ) ( not ( = ?auto_1920761 ?auto_1920764 ) ) ( not ( = ?auto_1920761 ?auto_1920766 ) ) ( not ( = ?auto_1920761 ?auto_1920767 ) ) ( not ( = ?auto_1920761 ?auto_1920768 ) ) ( not ( = ?auto_1920762 ?auto_1920763 ) ) ( not ( = ?auto_1920762 ?auto_1920765 ) ) ( not ( = ?auto_1920762 ?auto_1920764 ) ) ( not ( = ?auto_1920762 ?auto_1920766 ) ) ( not ( = ?auto_1920762 ?auto_1920767 ) ) ( not ( = ?auto_1920762 ?auto_1920768 ) ) ( not ( = ?auto_1920763 ?auto_1920765 ) ) ( not ( = ?auto_1920763 ?auto_1920764 ) ) ( not ( = ?auto_1920763 ?auto_1920766 ) ) ( not ( = ?auto_1920763 ?auto_1920767 ) ) ( not ( = ?auto_1920763 ?auto_1920768 ) ) ( not ( = ?auto_1920765 ?auto_1920764 ) ) ( not ( = ?auto_1920765 ?auto_1920766 ) ) ( not ( = ?auto_1920765 ?auto_1920767 ) ) ( not ( = ?auto_1920765 ?auto_1920768 ) ) ( not ( = ?auto_1920764 ?auto_1920766 ) ) ( not ( = ?auto_1920764 ?auto_1920767 ) ) ( not ( = ?auto_1920764 ?auto_1920768 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1920766 ?auto_1920767 ?auto_1920768 )
      ( MAKE-7CRATE-VERIFY ?auto_1920761 ?auto_1920762 ?auto_1920763 ?auto_1920765 ?auto_1920764 ?auto_1920766 ?auto_1920767 ?auto_1920768 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1920838 - SURFACE
      ?auto_1920839 - SURFACE
      ?auto_1920840 - SURFACE
      ?auto_1920842 - SURFACE
      ?auto_1920841 - SURFACE
      ?auto_1920843 - SURFACE
      ?auto_1920844 - SURFACE
      ?auto_1920845 - SURFACE
    )
    :vars
    (
      ?auto_1920849 - HOIST
      ?auto_1920847 - PLACE
      ?auto_1920850 - TRUCK
      ?auto_1920851 - PLACE
      ?auto_1920846 - HOIST
      ?auto_1920848 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1920849 ?auto_1920847 ) ( SURFACE-AT ?auto_1920844 ?auto_1920847 ) ( CLEAR ?auto_1920844 ) ( IS-CRATE ?auto_1920845 ) ( not ( = ?auto_1920844 ?auto_1920845 ) ) ( AVAILABLE ?auto_1920849 ) ( ON ?auto_1920844 ?auto_1920843 ) ( not ( = ?auto_1920843 ?auto_1920844 ) ) ( not ( = ?auto_1920843 ?auto_1920845 ) ) ( TRUCK-AT ?auto_1920850 ?auto_1920851 ) ( not ( = ?auto_1920851 ?auto_1920847 ) ) ( HOIST-AT ?auto_1920846 ?auto_1920851 ) ( not ( = ?auto_1920849 ?auto_1920846 ) ) ( AVAILABLE ?auto_1920846 ) ( SURFACE-AT ?auto_1920845 ?auto_1920851 ) ( ON ?auto_1920845 ?auto_1920848 ) ( CLEAR ?auto_1920845 ) ( not ( = ?auto_1920844 ?auto_1920848 ) ) ( not ( = ?auto_1920845 ?auto_1920848 ) ) ( not ( = ?auto_1920843 ?auto_1920848 ) ) ( ON ?auto_1920839 ?auto_1920838 ) ( ON ?auto_1920840 ?auto_1920839 ) ( ON ?auto_1920842 ?auto_1920840 ) ( ON ?auto_1920841 ?auto_1920842 ) ( ON ?auto_1920843 ?auto_1920841 ) ( not ( = ?auto_1920838 ?auto_1920839 ) ) ( not ( = ?auto_1920838 ?auto_1920840 ) ) ( not ( = ?auto_1920838 ?auto_1920842 ) ) ( not ( = ?auto_1920838 ?auto_1920841 ) ) ( not ( = ?auto_1920838 ?auto_1920843 ) ) ( not ( = ?auto_1920838 ?auto_1920844 ) ) ( not ( = ?auto_1920838 ?auto_1920845 ) ) ( not ( = ?auto_1920838 ?auto_1920848 ) ) ( not ( = ?auto_1920839 ?auto_1920840 ) ) ( not ( = ?auto_1920839 ?auto_1920842 ) ) ( not ( = ?auto_1920839 ?auto_1920841 ) ) ( not ( = ?auto_1920839 ?auto_1920843 ) ) ( not ( = ?auto_1920839 ?auto_1920844 ) ) ( not ( = ?auto_1920839 ?auto_1920845 ) ) ( not ( = ?auto_1920839 ?auto_1920848 ) ) ( not ( = ?auto_1920840 ?auto_1920842 ) ) ( not ( = ?auto_1920840 ?auto_1920841 ) ) ( not ( = ?auto_1920840 ?auto_1920843 ) ) ( not ( = ?auto_1920840 ?auto_1920844 ) ) ( not ( = ?auto_1920840 ?auto_1920845 ) ) ( not ( = ?auto_1920840 ?auto_1920848 ) ) ( not ( = ?auto_1920842 ?auto_1920841 ) ) ( not ( = ?auto_1920842 ?auto_1920843 ) ) ( not ( = ?auto_1920842 ?auto_1920844 ) ) ( not ( = ?auto_1920842 ?auto_1920845 ) ) ( not ( = ?auto_1920842 ?auto_1920848 ) ) ( not ( = ?auto_1920841 ?auto_1920843 ) ) ( not ( = ?auto_1920841 ?auto_1920844 ) ) ( not ( = ?auto_1920841 ?auto_1920845 ) ) ( not ( = ?auto_1920841 ?auto_1920848 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1920843 ?auto_1920844 ?auto_1920845 )
      ( MAKE-7CRATE-VERIFY ?auto_1920838 ?auto_1920839 ?auto_1920840 ?auto_1920842 ?auto_1920841 ?auto_1920843 ?auto_1920844 ?auto_1920845 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1920916 - SURFACE
      ?auto_1920917 - SURFACE
      ?auto_1920918 - SURFACE
      ?auto_1920920 - SURFACE
      ?auto_1920919 - SURFACE
      ?auto_1920921 - SURFACE
      ?auto_1920922 - SURFACE
      ?auto_1920923 - SURFACE
    )
    :vars
    (
      ?auto_1920924 - HOIST
      ?auto_1920928 - PLACE
      ?auto_1920926 - PLACE
      ?auto_1920929 - HOIST
      ?auto_1920925 - SURFACE
      ?auto_1920927 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1920924 ?auto_1920928 ) ( SURFACE-AT ?auto_1920922 ?auto_1920928 ) ( CLEAR ?auto_1920922 ) ( IS-CRATE ?auto_1920923 ) ( not ( = ?auto_1920922 ?auto_1920923 ) ) ( AVAILABLE ?auto_1920924 ) ( ON ?auto_1920922 ?auto_1920921 ) ( not ( = ?auto_1920921 ?auto_1920922 ) ) ( not ( = ?auto_1920921 ?auto_1920923 ) ) ( not ( = ?auto_1920926 ?auto_1920928 ) ) ( HOIST-AT ?auto_1920929 ?auto_1920926 ) ( not ( = ?auto_1920924 ?auto_1920929 ) ) ( AVAILABLE ?auto_1920929 ) ( SURFACE-AT ?auto_1920923 ?auto_1920926 ) ( ON ?auto_1920923 ?auto_1920925 ) ( CLEAR ?auto_1920923 ) ( not ( = ?auto_1920922 ?auto_1920925 ) ) ( not ( = ?auto_1920923 ?auto_1920925 ) ) ( not ( = ?auto_1920921 ?auto_1920925 ) ) ( TRUCK-AT ?auto_1920927 ?auto_1920928 ) ( ON ?auto_1920917 ?auto_1920916 ) ( ON ?auto_1920918 ?auto_1920917 ) ( ON ?auto_1920920 ?auto_1920918 ) ( ON ?auto_1920919 ?auto_1920920 ) ( ON ?auto_1920921 ?auto_1920919 ) ( not ( = ?auto_1920916 ?auto_1920917 ) ) ( not ( = ?auto_1920916 ?auto_1920918 ) ) ( not ( = ?auto_1920916 ?auto_1920920 ) ) ( not ( = ?auto_1920916 ?auto_1920919 ) ) ( not ( = ?auto_1920916 ?auto_1920921 ) ) ( not ( = ?auto_1920916 ?auto_1920922 ) ) ( not ( = ?auto_1920916 ?auto_1920923 ) ) ( not ( = ?auto_1920916 ?auto_1920925 ) ) ( not ( = ?auto_1920917 ?auto_1920918 ) ) ( not ( = ?auto_1920917 ?auto_1920920 ) ) ( not ( = ?auto_1920917 ?auto_1920919 ) ) ( not ( = ?auto_1920917 ?auto_1920921 ) ) ( not ( = ?auto_1920917 ?auto_1920922 ) ) ( not ( = ?auto_1920917 ?auto_1920923 ) ) ( not ( = ?auto_1920917 ?auto_1920925 ) ) ( not ( = ?auto_1920918 ?auto_1920920 ) ) ( not ( = ?auto_1920918 ?auto_1920919 ) ) ( not ( = ?auto_1920918 ?auto_1920921 ) ) ( not ( = ?auto_1920918 ?auto_1920922 ) ) ( not ( = ?auto_1920918 ?auto_1920923 ) ) ( not ( = ?auto_1920918 ?auto_1920925 ) ) ( not ( = ?auto_1920920 ?auto_1920919 ) ) ( not ( = ?auto_1920920 ?auto_1920921 ) ) ( not ( = ?auto_1920920 ?auto_1920922 ) ) ( not ( = ?auto_1920920 ?auto_1920923 ) ) ( not ( = ?auto_1920920 ?auto_1920925 ) ) ( not ( = ?auto_1920919 ?auto_1920921 ) ) ( not ( = ?auto_1920919 ?auto_1920922 ) ) ( not ( = ?auto_1920919 ?auto_1920923 ) ) ( not ( = ?auto_1920919 ?auto_1920925 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1920921 ?auto_1920922 ?auto_1920923 )
      ( MAKE-7CRATE-VERIFY ?auto_1920916 ?auto_1920917 ?auto_1920918 ?auto_1920920 ?auto_1920919 ?auto_1920921 ?auto_1920922 ?auto_1920923 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1920994 - SURFACE
      ?auto_1920995 - SURFACE
      ?auto_1920996 - SURFACE
      ?auto_1920998 - SURFACE
      ?auto_1920997 - SURFACE
      ?auto_1920999 - SURFACE
      ?auto_1921000 - SURFACE
      ?auto_1921001 - SURFACE
    )
    :vars
    (
      ?auto_1921007 - HOIST
      ?auto_1921005 - PLACE
      ?auto_1921006 - PLACE
      ?auto_1921002 - HOIST
      ?auto_1921004 - SURFACE
      ?auto_1921003 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1921007 ?auto_1921005 ) ( IS-CRATE ?auto_1921001 ) ( not ( = ?auto_1921000 ?auto_1921001 ) ) ( not ( = ?auto_1920999 ?auto_1921000 ) ) ( not ( = ?auto_1920999 ?auto_1921001 ) ) ( not ( = ?auto_1921006 ?auto_1921005 ) ) ( HOIST-AT ?auto_1921002 ?auto_1921006 ) ( not ( = ?auto_1921007 ?auto_1921002 ) ) ( AVAILABLE ?auto_1921002 ) ( SURFACE-AT ?auto_1921001 ?auto_1921006 ) ( ON ?auto_1921001 ?auto_1921004 ) ( CLEAR ?auto_1921001 ) ( not ( = ?auto_1921000 ?auto_1921004 ) ) ( not ( = ?auto_1921001 ?auto_1921004 ) ) ( not ( = ?auto_1920999 ?auto_1921004 ) ) ( TRUCK-AT ?auto_1921003 ?auto_1921005 ) ( SURFACE-AT ?auto_1920999 ?auto_1921005 ) ( CLEAR ?auto_1920999 ) ( LIFTING ?auto_1921007 ?auto_1921000 ) ( IS-CRATE ?auto_1921000 ) ( ON ?auto_1920995 ?auto_1920994 ) ( ON ?auto_1920996 ?auto_1920995 ) ( ON ?auto_1920998 ?auto_1920996 ) ( ON ?auto_1920997 ?auto_1920998 ) ( ON ?auto_1920999 ?auto_1920997 ) ( not ( = ?auto_1920994 ?auto_1920995 ) ) ( not ( = ?auto_1920994 ?auto_1920996 ) ) ( not ( = ?auto_1920994 ?auto_1920998 ) ) ( not ( = ?auto_1920994 ?auto_1920997 ) ) ( not ( = ?auto_1920994 ?auto_1920999 ) ) ( not ( = ?auto_1920994 ?auto_1921000 ) ) ( not ( = ?auto_1920994 ?auto_1921001 ) ) ( not ( = ?auto_1920994 ?auto_1921004 ) ) ( not ( = ?auto_1920995 ?auto_1920996 ) ) ( not ( = ?auto_1920995 ?auto_1920998 ) ) ( not ( = ?auto_1920995 ?auto_1920997 ) ) ( not ( = ?auto_1920995 ?auto_1920999 ) ) ( not ( = ?auto_1920995 ?auto_1921000 ) ) ( not ( = ?auto_1920995 ?auto_1921001 ) ) ( not ( = ?auto_1920995 ?auto_1921004 ) ) ( not ( = ?auto_1920996 ?auto_1920998 ) ) ( not ( = ?auto_1920996 ?auto_1920997 ) ) ( not ( = ?auto_1920996 ?auto_1920999 ) ) ( not ( = ?auto_1920996 ?auto_1921000 ) ) ( not ( = ?auto_1920996 ?auto_1921001 ) ) ( not ( = ?auto_1920996 ?auto_1921004 ) ) ( not ( = ?auto_1920998 ?auto_1920997 ) ) ( not ( = ?auto_1920998 ?auto_1920999 ) ) ( not ( = ?auto_1920998 ?auto_1921000 ) ) ( not ( = ?auto_1920998 ?auto_1921001 ) ) ( not ( = ?auto_1920998 ?auto_1921004 ) ) ( not ( = ?auto_1920997 ?auto_1920999 ) ) ( not ( = ?auto_1920997 ?auto_1921000 ) ) ( not ( = ?auto_1920997 ?auto_1921001 ) ) ( not ( = ?auto_1920997 ?auto_1921004 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1920999 ?auto_1921000 ?auto_1921001 )
      ( MAKE-7CRATE-VERIFY ?auto_1920994 ?auto_1920995 ?auto_1920996 ?auto_1920998 ?auto_1920997 ?auto_1920999 ?auto_1921000 ?auto_1921001 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1921072 - SURFACE
      ?auto_1921073 - SURFACE
      ?auto_1921074 - SURFACE
      ?auto_1921076 - SURFACE
      ?auto_1921075 - SURFACE
      ?auto_1921077 - SURFACE
      ?auto_1921078 - SURFACE
      ?auto_1921079 - SURFACE
    )
    :vars
    (
      ?auto_1921082 - HOIST
      ?auto_1921081 - PLACE
      ?auto_1921084 - PLACE
      ?auto_1921080 - HOIST
      ?auto_1921085 - SURFACE
      ?auto_1921083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1921082 ?auto_1921081 ) ( IS-CRATE ?auto_1921079 ) ( not ( = ?auto_1921078 ?auto_1921079 ) ) ( not ( = ?auto_1921077 ?auto_1921078 ) ) ( not ( = ?auto_1921077 ?auto_1921079 ) ) ( not ( = ?auto_1921084 ?auto_1921081 ) ) ( HOIST-AT ?auto_1921080 ?auto_1921084 ) ( not ( = ?auto_1921082 ?auto_1921080 ) ) ( AVAILABLE ?auto_1921080 ) ( SURFACE-AT ?auto_1921079 ?auto_1921084 ) ( ON ?auto_1921079 ?auto_1921085 ) ( CLEAR ?auto_1921079 ) ( not ( = ?auto_1921078 ?auto_1921085 ) ) ( not ( = ?auto_1921079 ?auto_1921085 ) ) ( not ( = ?auto_1921077 ?auto_1921085 ) ) ( TRUCK-AT ?auto_1921083 ?auto_1921081 ) ( SURFACE-AT ?auto_1921077 ?auto_1921081 ) ( CLEAR ?auto_1921077 ) ( IS-CRATE ?auto_1921078 ) ( AVAILABLE ?auto_1921082 ) ( IN ?auto_1921078 ?auto_1921083 ) ( ON ?auto_1921073 ?auto_1921072 ) ( ON ?auto_1921074 ?auto_1921073 ) ( ON ?auto_1921076 ?auto_1921074 ) ( ON ?auto_1921075 ?auto_1921076 ) ( ON ?auto_1921077 ?auto_1921075 ) ( not ( = ?auto_1921072 ?auto_1921073 ) ) ( not ( = ?auto_1921072 ?auto_1921074 ) ) ( not ( = ?auto_1921072 ?auto_1921076 ) ) ( not ( = ?auto_1921072 ?auto_1921075 ) ) ( not ( = ?auto_1921072 ?auto_1921077 ) ) ( not ( = ?auto_1921072 ?auto_1921078 ) ) ( not ( = ?auto_1921072 ?auto_1921079 ) ) ( not ( = ?auto_1921072 ?auto_1921085 ) ) ( not ( = ?auto_1921073 ?auto_1921074 ) ) ( not ( = ?auto_1921073 ?auto_1921076 ) ) ( not ( = ?auto_1921073 ?auto_1921075 ) ) ( not ( = ?auto_1921073 ?auto_1921077 ) ) ( not ( = ?auto_1921073 ?auto_1921078 ) ) ( not ( = ?auto_1921073 ?auto_1921079 ) ) ( not ( = ?auto_1921073 ?auto_1921085 ) ) ( not ( = ?auto_1921074 ?auto_1921076 ) ) ( not ( = ?auto_1921074 ?auto_1921075 ) ) ( not ( = ?auto_1921074 ?auto_1921077 ) ) ( not ( = ?auto_1921074 ?auto_1921078 ) ) ( not ( = ?auto_1921074 ?auto_1921079 ) ) ( not ( = ?auto_1921074 ?auto_1921085 ) ) ( not ( = ?auto_1921076 ?auto_1921075 ) ) ( not ( = ?auto_1921076 ?auto_1921077 ) ) ( not ( = ?auto_1921076 ?auto_1921078 ) ) ( not ( = ?auto_1921076 ?auto_1921079 ) ) ( not ( = ?auto_1921076 ?auto_1921085 ) ) ( not ( = ?auto_1921075 ?auto_1921077 ) ) ( not ( = ?auto_1921075 ?auto_1921078 ) ) ( not ( = ?auto_1921075 ?auto_1921079 ) ) ( not ( = ?auto_1921075 ?auto_1921085 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1921077 ?auto_1921078 ?auto_1921079 )
      ( MAKE-7CRATE-VERIFY ?auto_1921072 ?auto_1921073 ?auto_1921074 ?auto_1921076 ?auto_1921075 ?auto_1921077 ?auto_1921078 ?auto_1921079 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1923991 - SURFACE
      ?auto_1923992 - SURFACE
      ?auto_1923993 - SURFACE
      ?auto_1923995 - SURFACE
      ?auto_1923994 - SURFACE
      ?auto_1923996 - SURFACE
      ?auto_1923997 - SURFACE
      ?auto_1923998 - SURFACE
      ?auto_1923999 - SURFACE
    )
    :vars
    (
      ?auto_1924000 - HOIST
      ?auto_1924001 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924000 ?auto_1924001 ) ( SURFACE-AT ?auto_1923998 ?auto_1924001 ) ( CLEAR ?auto_1923998 ) ( LIFTING ?auto_1924000 ?auto_1923999 ) ( IS-CRATE ?auto_1923999 ) ( not ( = ?auto_1923998 ?auto_1923999 ) ) ( ON ?auto_1923992 ?auto_1923991 ) ( ON ?auto_1923993 ?auto_1923992 ) ( ON ?auto_1923995 ?auto_1923993 ) ( ON ?auto_1923994 ?auto_1923995 ) ( ON ?auto_1923996 ?auto_1923994 ) ( ON ?auto_1923997 ?auto_1923996 ) ( ON ?auto_1923998 ?auto_1923997 ) ( not ( = ?auto_1923991 ?auto_1923992 ) ) ( not ( = ?auto_1923991 ?auto_1923993 ) ) ( not ( = ?auto_1923991 ?auto_1923995 ) ) ( not ( = ?auto_1923991 ?auto_1923994 ) ) ( not ( = ?auto_1923991 ?auto_1923996 ) ) ( not ( = ?auto_1923991 ?auto_1923997 ) ) ( not ( = ?auto_1923991 ?auto_1923998 ) ) ( not ( = ?auto_1923991 ?auto_1923999 ) ) ( not ( = ?auto_1923992 ?auto_1923993 ) ) ( not ( = ?auto_1923992 ?auto_1923995 ) ) ( not ( = ?auto_1923992 ?auto_1923994 ) ) ( not ( = ?auto_1923992 ?auto_1923996 ) ) ( not ( = ?auto_1923992 ?auto_1923997 ) ) ( not ( = ?auto_1923992 ?auto_1923998 ) ) ( not ( = ?auto_1923992 ?auto_1923999 ) ) ( not ( = ?auto_1923993 ?auto_1923995 ) ) ( not ( = ?auto_1923993 ?auto_1923994 ) ) ( not ( = ?auto_1923993 ?auto_1923996 ) ) ( not ( = ?auto_1923993 ?auto_1923997 ) ) ( not ( = ?auto_1923993 ?auto_1923998 ) ) ( not ( = ?auto_1923993 ?auto_1923999 ) ) ( not ( = ?auto_1923995 ?auto_1923994 ) ) ( not ( = ?auto_1923995 ?auto_1923996 ) ) ( not ( = ?auto_1923995 ?auto_1923997 ) ) ( not ( = ?auto_1923995 ?auto_1923998 ) ) ( not ( = ?auto_1923995 ?auto_1923999 ) ) ( not ( = ?auto_1923994 ?auto_1923996 ) ) ( not ( = ?auto_1923994 ?auto_1923997 ) ) ( not ( = ?auto_1923994 ?auto_1923998 ) ) ( not ( = ?auto_1923994 ?auto_1923999 ) ) ( not ( = ?auto_1923996 ?auto_1923997 ) ) ( not ( = ?auto_1923996 ?auto_1923998 ) ) ( not ( = ?auto_1923996 ?auto_1923999 ) ) ( not ( = ?auto_1923997 ?auto_1923998 ) ) ( not ( = ?auto_1923997 ?auto_1923999 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1923998 ?auto_1923999 )
      ( MAKE-8CRATE-VERIFY ?auto_1923991 ?auto_1923992 ?auto_1923993 ?auto_1923995 ?auto_1923994 ?auto_1923996 ?auto_1923997 ?auto_1923998 ?auto_1923999 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1924058 - SURFACE
      ?auto_1924059 - SURFACE
      ?auto_1924060 - SURFACE
      ?auto_1924062 - SURFACE
      ?auto_1924061 - SURFACE
      ?auto_1924063 - SURFACE
      ?auto_1924064 - SURFACE
      ?auto_1924065 - SURFACE
      ?auto_1924066 - SURFACE
    )
    :vars
    (
      ?auto_1924068 - HOIST
      ?auto_1924067 - PLACE
      ?auto_1924069 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924068 ?auto_1924067 ) ( SURFACE-AT ?auto_1924065 ?auto_1924067 ) ( CLEAR ?auto_1924065 ) ( IS-CRATE ?auto_1924066 ) ( not ( = ?auto_1924065 ?auto_1924066 ) ) ( TRUCK-AT ?auto_1924069 ?auto_1924067 ) ( AVAILABLE ?auto_1924068 ) ( IN ?auto_1924066 ?auto_1924069 ) ( ON ?auto_1924065 ?auto_1924064 ) ( not ( = ?auto_1924064 ?auto_1924065 ) ) ( not ( = ?auto_1924064 ?auto_1924066 ) ) ( ON ?auto_1924059 ?auto_1924058 ) ( ON ?auto_1924060 ?auto_1924059 ) ( ON ?auto_1924062 ?auto_1924060 ) ( ON ?auto_1924061 ?auto_1924062 ) ( ON ?auto_1924063 ?auto_1924061 ) ( ON ?auto_1924064 ?auto_1924063 ) ( not ( = ?auto_1924058 ?auto_1924059 ) ) ( not ( = ?auto_1924058 ?auto_1924060 ) ) ( not ( = ?auto_1924058 ?auto_1924062 ) ) ( not ( = ?auto_1924058 ?auto_1924061 ) ) ( not ( = ?auto_1924058 ?auto_1924063 ) ) ( not ( = ?auto_1924058 ?auto_1924064 ) ) ( not ( = ?auto_1924058 ?auto_1924065 ) ) ( not ( = ?auto_1924058 ?auto_1924066 ) ) ( not ( = ?auto_1924059 ?auto_1924060 ) ) ( not ( = ?auto_1924059 ?auto_1924062 ) ) ( not ( = ?auto_1924059 ?auto_1924061 ) ) ( not ( = ?auto_1924059 ?auto_1924063 ) ) ( not ( = ?auto_1924059 ?auto_1924064 ) ) ( not ( = ?auto_1924059 ?auto_1924065 ) ) ( not ( = ?auto_1924059 ?auto_1924066 ) ) ( not ( = ?auto_1924060 ?auto_1924062 ) ) ( not ( = ?auto_1924060 ?auto_1924061 ) ) ( not ( = ?auto_1924060 ?auto_1924063 ) ) ( not ( = ?auto_1924060 ?auto_1924064 ) ) ( not ( = ?auto_1924060 ?auto_1924065 ) ) ( not ( = ?auto_1924060 ?auto_1924066 ) ) ( not ( = ?auto_1924062 ?auto_1924061 ) ) ( not ( = ?auto_1924062 ?auto_1924063 ) ) ( not ( = ?auto_1924062 ?auto_1924064 ) ) ( not ( = ?auto_1924062 ?auto_1924065 ) ) ( not ( = ?auto_1924062 ?auto_1924066 ) ) ( not ( = ?auto_1924061 ?auto_1924063 ) ) ( not ( = ?auto_1924061 ?auto_1924064 ) ) ( not ( = ?auto_1924061 ?auto_1924065 ) ) ( not ( = ?auto_1924061 ?auto_1924066 ) ) ( not ( = ?auto_1924063 ?auto_1924064 ) ) ( not ( = ?auto_1924063 ?auto_1924065 ) ) ( not ( = ?auto_1924063 ?auto_1924066 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1924064 ?auto_1924065 ?auto_1924066 )
      ( MAKE-8CRATE-VERIFY ?auto_1924058 ?auto_1924059 ?auto_1924060 ?auto_1924062 ?auto_1924061 ?auto_1924063 ?auto_1924064 ?auto_1924065 ?auto_1924066 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1924134 - SURFACE
      ?auto_1924135 - SURFACE
      ?auto_1924136 - SURFACE
      ?auto_1924138 - SURFACE
      ?auto_1924137 - SURFACE
      ?auto_1924139 - SURFACE
      ?auto_1924140 - SURFACE
      ?auto_1924141 - SURFACE
      ?auto_1924142 - SURFACE
    )
    :vars
    (
      ?auto_1924145 - HOIST
      ?auto_1924146 - PLACE
      ?auto_1924144 - TRUCK
      ?auto_1924143 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924145 ?auto_1924146 ) ( SURFACE-AT ?auto_1924141 ?auto_1924146 ) ( CLEAR ?auto_1924141 ) ( IS-CRATE ?auto_1924142 ) ( not ( = ?auto_1924141 ?auto_1924142 ) ) ( AVAILABLE ?auto_1924145 ) ( IN ?auto_1924142 ?auto_1924144 ) ( ON ?auto_1924141 ?auto_1924140 ) ( not ( = ?auto_1924140 ?auto_1924141 ) ) ( not ( = ?auto_1924140 ?auto_1924142 ) ) ( TRUCK-AT ?auto_1924144 ?auto_1924143 ) ( not ( = ?auto_1924143 ?auto_1924146 ) ) ( ON ?auto_1924135 ?auto_1924134 ) ( ON ?auto_1924136 ?auto_1924135 ) ( ON ?auto_1924138 ?auto_1924136 ) ( ON ?auto_1924137 ?auto_1924138 ) ( ON ?auto_1924139 ?auto_1924137 ) ( ON ?auto_1924140 ?auto_1924139 ) ( not ( = ?auto_1924134 ?auto_1924135 ) ) ( not ( = ?auto_1924134 ?auto_1924136 ) ) ( not ( = ?auto_1924134 ?auto_1924138 ) ) ( not ( = ?auto_1924134 ?auto_1924137 ) ) ( not ( = ?auto_1924134 ?auto_1924139 ) ) ( not ( = ?auto_1924134 ?auto_1924140 ) ) ( not ( = ?auto_1924134 ?auto_1924141 ) ) ( not ( = ?auto_1924134 ?auto_1924142 ) ) ( not ( = ?auto_1924135 ?auto_1924136 ) ) ( not ( = ?auto_1924135 ?auto_1924138 ) ) ( not ( = ?auto_1924135 ?auto_1924137 ) ) ( not ( = ?auto_1924135 ?auto_1924139 ) ) ( not ( = ?auto_1924135 ?auto_1924140 ) ) ( not ( = ?auto_1924135 ?auto_1924141 ) ) ( not ( = ?auto_1924135 ?auto_1924142 ) ) ( not ( = ?auto_1924136 ?auto_1924138 ) ) ( not ( = ?auto_1924136 ?auto_1924137 ) ) ( not ( = ?auto_1924136 ?auto_1924139 ) ) ( not ( = ?auto_1924136 ?auto_1924140 ) ) ( not ( = ?auto_1924136 ?auto_1924141 ) ) ( not ( = ?auto_1924136 ?auto_1924142 ) ) ( not ( = ?auto_1924138 ?auto_1924137 ) ) ( not ( = ?auto_1924138 ?auto_1924139 ) ) ( not ( = ?auto_1924138 ?auto_1924140 ) ) ( not ( = ?auto_1924138 ?auto_1924141 ) ) ( not ( = ?auto_1924138 ?auto_1924142 ) ) ( not ( = ?auto_1924137 ?auto_1924139 ) ) ( not ( = ?auto_1924137 ?auto_1924140 ) ) ( not ( = ?auto_1924137 ?auto_1924141 ) ) ( not ( = ?auto_1924137 ?auto_1924142 ) ) ( not ( = ?auto_1924139 ?auto_1924140 ) ) ( not ( = ?auto_1924139 ?auto_1924141 ) ) ( not ( = ?auto_1924139 ?auto_1924142 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1924140 ?auto_1924141 ?auto_1924142 )
      ( MAKE-8CRATE-VERIFY ?auto_1924134 ?auto_1924135 ?auto_1924136 ?auto_1924138 ?auto_1924137 ?auto_1924139 ?auto_1924140 ?auto_1924141 ?auto_1924142 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1924218 - SURFACE
      ?auto_1924219 - SURFACE
      ?auto_1924220 - SURFACE
      ?auto_1924222 - SURFACE
      ?auto_1924221 - SURFACE
      ?auto_1924223 - SURFACE
      ?auto_1924224 - SURFACE
      ?auto_1924225 - SURFACE
      ?auto_1924226 - SURFACE
    )
    :vars
    (
      ?auto_1924230 - HOIST
      ?auto_1924228 - PLACE
      ?auto_1924229 - TRUCK
      ?auto_1924227 - PLACE
      ?auto_1924231 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924230 ?auto_1924228 ) ( SURFACE-AT ?auto_1924225 ?auto_1924228 ) ( CLEAR ?auto_1924225 ) ( IS-CRATE ?auto_1924226 ) ( not ( = ?auto_1924225 ?auto_1924226 ) ) ( AVAILABLE ?auto_1924230 ) ( ON ?auto_1924225 ?auto_1924224 ) ( not ( = ?auto_1924224 ?auto_1924225 ) ) ( not ( = ?auto_1924224 ?auto_1924226 ) ) ( TRUCK-AT ?auto_1924229 ?auto_1924227 ) ( not ( = ?auto_1924227 ?auto_1924228 ) ) ( HOIST-AT ?auto_1924231 ?auto_1924227 ) ( LIFTING ?auto_1924231 ?auto_1924226 ) ( not ( = ?auto_1924230 ?auto_1924231 ) ) ( ON ?auto_1924219 ?auto_1924218 ) ( ON ?auto_1924220 ?auto_1924219 ) ( ON ?auto_1924222 ?auto_1924220 ) ( ON ?auto_1924221 ?auto_1924222 ) ( ON ?auto_1924223 ?auto_1924221 ) ( ON ?auto_1924224 ?auto_1924223 ) ( not ( = ?auto_1924218 ?auto_1924219 ) ) ( not ( = ?auto_1924218 ?auto_1924220 ) ) ( not ( = ?auto_1924218 ?auto_1924222 ) ) ( not ( = ?auto_1924218 ?auto_1924221 ) ) ( not ( = ?auto_1924218 ?auto_1924223 ) ) ( not ( = ?auto_1924218 ?auto_1924224 ) ) ( not ( = ?auto_1924218 ?auto_1924225 ) ) ( not ( = ?auto_1924218 ?auto_1924226 ) ) ( not ( = ?auto_1924219 ?auto_1924220 ) ) ( not ( = ?auto_1924219 ?auto_1924222 ) ) ( not ( = ?auto_1924219 ?auto_1924221 ) ) ( not ( = ?auto_1924219 ?auto_1924223 ) ) ( not ( = ?auto_1924219 ?auto_1924224 ) ) ( not ( = ?auto_1924219 ?auto_1924225 ) ) ( not ( = ?auto_1924219 ?auto_1924226 ) ) ( not ( = ?auto_1924220 ?auto_1924222 ) ) ( not ( = ?auto_1924220 ?auto_1924221 ) ) ( not ( = ?auto_1924220 ?auto_1924223 ) ) ( not ( = ?auto_1924220 ?auto_1924224 ) ) ( not ( = ?auto_1924220 ?auto_1924225 ) ) ( not ( = ?auto_1924220 ?auto_1924226 ) ) ( not ( = ?auto_1924222 ?auto_1924221 ) ) ( not ( = ?auto_1924222 ?auto_1924223 ) ) ( not ( = ?auto_1924222 ?auto_1924224 ) ) ( not ( = ?auto_1924222 ?auto_1924225 ) ) ( not ( = ?auto_1924222 ?auto_1924226 ) ) ( not ( = ?auto_1924221 ?auto_1924223 ) ) ( not ( = ?auto_1924221 ?auto_1924224 ) ) ( not ( = ?auto_1924221 ?auto_1924225 ) ) ( not ( = ?auto_1924221 ?auto_1924226 ) ) ( not ( = ?auto_1924223 ?auto_1924224 ) ) ( not ( = ?auto_1924223 ?auto_1924225 ) ) ( not ( = ?auto_1924223 ?auto_1924226 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1924224 ?auto_1924225 ?auto_1924226 )
      ( MAKE-8CRATE-VERIFY ?auto_1924218 ?auto_1924219 ?auto_1924220 ?auto_1924222 ?auto_1924221 ?auto_1924223 ?auto_1924224 ?auto_1924225 ?auto_1924226 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1924310 - SURFACE
      ?auto_1924311 - SURFACE
      ?auto_1924312 - SURFACE
      ?auto_1924314 - SURFACE
      ?auto_1924313 - SURFACE
      ?auto_1924315 - SURFACE
      ?auto_1924316 - SURFACE
      ?auto_1924317 - SURFACE
      ?auto_1924318 - SURFACE
    )
    :vars
    (
      ?auto_1924321 - HOIST
      ?auto_1924319 - PLACE
      ?auto_1924323 - TRUCK
      ?auto_1924320 - PLACE
      ?auto_1924324 - HOIST
      ?auto_1924322 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924321 ?auto_1924319 ) ( SURFACE-AT ?auto_1924317 ?auto_1924319 ) ( CLEAR ?auto_1924317 ) ( IS-CRATE ?auto_1924318 ) ( not ( = ?auto_1924317 ?auto_1924318 ) ) ( AVAILABLE ?auto_1924321 ) ( ON ?auto_1924317 ?auto_1924316 ) ( not ( = ?auto_1924316 ?auto_1924317 ) ) ( not ( = ?auto_1924316 ?auto_1924318 ) ) ( TRUCK-AT ?auto_1924323 ?auto_1924320 ) ( not ( = ?auto_1924320 ?auto_1924319 ) ) ( HOIST-AT ?auto_1924324 ?auto_1924320 ) ( not ( = ?auto_1924321 ?auto_1924324 ) ) ( AVAILABLE ?auto_1924324 ) ( SURFACE-AT ?auto_1924318 ?auto_1924320 ) ( ON ?auto_1924318 ?auto_1924322 ) ( CLEAR ?auto_1924318 ) ( not ( = ?auto_1924317 ?auto_1924322 ) ) ( not ( = ?auto_1924318 ?auto_1924322 ) ) ( not ( = ?auto_1924316 ?auto_1924322 ) ) ( ON ?auto_1924311 ?auto_1924310 ) ( ON ?auto_1924312 ?auto_1924311 ) ( ON ?auto_1924314 ?auto_1924312 ) ( ON ?auto_1924313 ?auto_1924314 ) ( ON ?auto_1924315 ?auto_1924313 ) ( ON ?auto_1924316 ?auto_1924315 ) ( not ( = ?auto_1924310 ?auto_1924311 ) ) ( not ( = ?auto_1924310 ?auto_1924312 ) ) ( not ( = ?auto_1924310 ?auto_1924314 ) ) ( not ( = ?auto_1924310 ?auto_1924313 ) ) ( not ( = ?auto_1924310 ?auto_1924315 ) ) ( not ( = ?auto_1924310 ?auto_1924316 ) ) ( not ( = ?auto_1924310 ?auto_1924317 ) ) ( not ( = ?auto_1924310 ?auto_1924318 ) ) ( not ( = ?auto_1924310 ?auto_1924322 ) ) ( not ( = ?auto_1924311 ?auto_1924312 ) ) ( not ( = ?auto_1924311 ?auto_1924314 ) ) ( not ( = ?auto_1924311 ?auto_1924313 ) ) ( not ( = ?auto_1924311 ?auto_1924315 ) ) ( not ( = ?auto_1924311 ?auto_1924316 ) ) ( not ( = ?auto_1924311 ?auto_1924317 ) ) ( not ( = ?auto_1924311 ?auto_1924318 ) ) ( not ( = ?auto_1924311 ?auto_1924322 ) ) ( not ( = ?auto_1924312 ?auto_1924314 ) ) ( not ( = ?auto_1924312 ?auto_1924313 ) ) ( not ( = ?auto_1924312 ?auto_1924315 ) ) ( not ( = ?auto_1924312 ?auto_1924316 ) ) ( not ( = ?auto_1924312 ?auto_1924317 ) ) ( not ( = ?auto_1924312 ?auto_1924318 ) ) ( not ( = ?auto_1924312 ?auto_1924322 ) ) ( not ( = ?auto_1924314 ?auto_1924313 ) ) ( not ( = ?auto_1924314 ?auto_1924315 ) ) ( not ( = ?auto_1924314 ?auto_1924316 ) ) ( not ( = ?auto_1924314 ?auto_1924317 ) ) ( not ( = ?auto_1924314 ?auto_1924318 ) ) ( not ( = ?auto_1924314 ?auto_1924322 ) ) ( not ( = ?auto_1924313 ?auto_1924315 ) ) ( not ( = ?auto_1924313 ?auto_1924316 ) ) ( not ( = ?auto_1924313 ?auto_1924317 ) ) ( not ( = ?auto_1924313 ?auto_1924318 ) ) ( not ( = ?auto_1924313 ?auto_1924322 ) ) ( not ( = ?auto_1924315 ?auto_1924316 ) ) ( not ( = ?auto_1924315 ?auto_1924317 ) ) ( not ( = ?auto_1924315 ?auto_1924318 ) ) ( not ( = ?auto_1924315 ?auto_1924322 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1924316 ?auto_1924317 ?auto_1924318 )
      ( MAKE-8CRATE-VERIFY ?auto_1924310 ?auto_1924311 ?auto_1924312 ?auto_1924314 ?auto_1924313 ?auto_1924315 ?auto_1924316 ?auto_1924317 ?auto_1924318 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1924403 - SURFACE
      ?auto_1924404 - SURFACE
      ?auto_1924405 - SURFACE
      ?auto_1924407 - SURFACE
      ?auto_1924406 - SURFACE
      ?auto_1924408 - SURFACE
      ?auto_1924409 - SURFACE
      ?auto_1924410 - SURFACE
      ?auto_1924411 - SURFACE
    )
    :vars
    (
      ?auto_1924416 - HOIST
      ?auto_1924412 - PLACE
      ?auto_1924415 - PLACE
      ?auto_1924414 - HOIST
      ?auto_1924413 - SURFACE
      ?auto_1924417 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924416 ?auto_1924412 ) ( SURFACE-AT ?auto_1924410 ?auto_1924412 ) ( CLEAR ?auto_1924410 ) ( IS-CRATE ?auto_1924411 ) ( not ( = ?auto_1924410 ?auto_1924411 ) ) ( AVAILABLE ?auto_1924416 ) ( ON ?auto_1924410 ?auto_1924409 ) ( not ( = ?auto_1924409 ?auto_1924410 ) ) ( not ( = ?auto_1924409 ?auto_1924411 ) ) ( not ( = ?auto_1924415 ?auto_1924412 ) ) ( HOIST-AT ?auto_1924414 ?auto_1924415 ) ( not ( = ?auto_1924416 ?auto_1924414 ) ) ( AVAILABLE ?auto_1924414 ) ( SURFACE-AT ?auto_1924411 ?auto_1924415 ) ( ON ?auto_1924411 ?auto_1924413 ) ( CLEAR ?auto_1924411 ) ( not ( = ?auto_1924410 ?auto_1924413 ) ) ( not ( = ?auto_1924411 ?auto_1924413 ) ) ( not ( = ?auto_1924409 ?auto_1924413 ) ) ( TRUCK-AT ?auto_1924417 ?auto_1924412 ) ( ON ?auto_1924404 ?auto_1924403 ) ( ON ?auto_1924405 ?auto_1924404 ) ( ON ?auto_1924407 ?auto_1924405 ) ( ON ?auto_1924406 ?auto_1924407 ) ( ON ?auto_1924408 ?auto_1924406 ) ( ON ?auto_1924409 ?auto_1924408 ) ( not ( = ?auto_1924403 ?auto_1924404 ) ) ( not ( = ?auto_1924403 ?auto_1924405 ) ) ( not ( = ?auto_1924403 ?auto_1924407 ) ) ( not ( = ?auto_1924403 ?auto_1924406 ) ) ( not ( = ?auto_1924403 ?auto_1924408 ) ) ( not ( = ?auto_1924403 ?auto_1924409 ) ) ( not ( = ?auto_1924403 ?auto_1924410 ) ) ( not ( = ?auto_1924403 ?auto_1924411 ) ) ( not ( = ?auto_1924403 ?auto_1924413 ) ) ( not ( = ?auto_1924404 ?auto_1924405 ) ) ( not ( = ?auto_1924404 ?auto_1924407 ) ) ( not ( = ?auto_1924404 ?auto_1924406 ) ) ( not ( = ?auto_1924404 ?auto_1924408 ) ) ( not ( = ?auto_1924404 ?auto_1924409 ) ) ( not ( = ?auto_1924404 ?auto_1924410 ) ) ( not ( = ?auto_1924404 ?auto_1924411 ) ) ( not ( = ?auto_1924404 ?auto_1924413 ) ) ( not ( = ?auto_1924405 ?auto_1924407 ) ) ( not ( = ?auto_1924405 ?auto_1924406 ) ) ( not ( = ?auto_1924405 ?auto_1924408 ) ) ( not ( = ?auto_1924405 ?auto_1924409 ) ) ( not ( = ?auto_1924405 ?auto_1924410 ) ) ( not ( = ?auto_1924405 ?auto_1924411 ) ) ( not ( = ?auto_1924405 ?auto_1924413 ) ) ( not ( = ?auto_1924407 ?auto_1924406 ) ) ( not ( = ?auto_1924407 ?auto_1924408 ) ) ( not ( = ?auto_1924407 ?auto_1924409 ) ) ( not ( = ?auto_1924407 ?auto_1924410 ) ) ( not ( = ?auto_1924407 ?auto_1924411 ) ) ( not ( = ?auto_1924407 ?auto_1924413 ) ) ( not ( = ?auto_1924406 ?auto_1924408 ) ) ( not ( = ?auto_1924406 ?auto_1924409 ) ) ( not ( = ?auto_1924406 ?auto_1924410 ) ) ( not ( = ?auto_1924406 ?auto_1924411 ) ) ( not ( = ?auto_1924406 ?auto_1924413 ) ) ( not ( = ?auto_1924408 ?auto_1924409 ) ) ( not ( = ?auto_1924408 ?auto_1924410 ) ) ( not ( = ?auto_1924408 ?auto_1924411 ) ) ( not ( = ?auto_1924408 ?auto_1924413 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1924409 ?auto_1924410 ?auto_1924411 )
      ( MAKE-8CRATE-VERIFY ?auto_1924403 ?auto_1924404 ?auto_1924405 ?auto_1924407 ?auto_1924406 ?auto_1924408 ?auto_1924409 ?auto_1924410 ?auto_1924411 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1924496 - SURFACE
      ?auto_1924497 - SURFACE
      ?auto_1924498 - SURFACE
      ?auto_1924500 - SURFACE
      ?auto_1924499 - SURFACE
      ?auto_1924501 - SURFACE
      ?auto_1924502 - SURFACE
      ?auto_1924503 - SURFACE
      ?auto_1924504 - SURFACE
    )
    :vars
    (
      ?auto_1924507 - HOIST
      ?auto_1924509 - PLACE
      ?auto_1924510 - PLACE
      ?auto_1924505 - HOIST
      ?auto_1924506 - SURFACE
      ?auto_1924508 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924507 ?auto_1924509 ) ( IS-CRATE ?auto_1924504 ) ( not ( = ?auto_1924503 ?auto_1924504 ) ) ( not ( = ?auto_1924502 ?auto_1924503 ) ) ( not ( = ?auto_1924502 ?auto_1924504 ) ) ( not ( = ?auto_1924510 ?auto_1924509 ) ) ( HOIST-AT ?auto_1924505 ?auto_1924510 ) ( not ( = ?auto_1924507 ?auto_1924505 ) ) ( AVAILABLE ?auto_1924505 ) ( SURFACE-AT ?auto_1924504 ?auto_1924510 ) ( ON ?auto_1924504 ?auto_1924506 ) ( CLEAR ?auto_1924504 ) ( not ( = ?auto_1924503 ?auto_1924506 ) ) ( not ( = ?auto_1924504 ?auto_1924506 ) ) ( not ( = ?auto_1924502 ?auto_1924506 ) ) ( TRUCK-AT ?auto_1924508 ?auto_1924509 ) ( SURFACE-AT ?auto_1924502 ?auto_1924509 ) ( CLEAR ?auto_1924502 ) ( LIFTING ?auto_1924507 ?auto_1924503 ) ( IS-CRATE ?auto_1924503 ) ( ON ?auto_1924497 ?auto_1924496 ) ( ON ?auto_1924498 ?auto_1924497 ) ( ON ?auto_1924500 ?auto_1924498 ) ( ON ?auto_1924499 ?auto_1924500 ) ( ON ?auto_1924501 ?auto_1924499 ) ( ON ?auto_1924502 ?auto_1924501 ) ( not ( = ?auto_1924496 ?auto_1924497 ) ) ( not ( = ?auto_1924496 ?auto_1924498 ) ) ( not ( = ?auto_1924496 ?auto_1924500 ) ) ( not ( = ?auto_1924496 ?auto_1924499 ) ) ( not ( = ?auto_1924496 ?auto_1924501 ) ) ( not ( = ?auto_1924496 ?auto_1924502 ) ) ( not ( = ?auto_1924496 ?auto_1924503 ) ) ( not ( = ?auto_1924496 ?auto_1924504 ) ) ( not ( = ?auto_1924496 ?auto_1924506 ) ) ( not ( = ?auto_1924497 ?auto_1924498 ) ) ( not ( = ?auto_1924497 ?auto_1924500 ) ) ( not ( = ?auto_1924497 ?auto_1924499 ) ) ( not ( = ?auto_1924497 ?auto_1924501 ) ) ( not ( = ?auto_1924497 ?auto_1924502 ) ) ( not ( = ?auto_1924497 ?auto_1924503 ) ) ( not ( = ?auto_1924497 ?auto_1924504 ) ) ( not ( = ?auto_1924497 ?auto_1924506 ) ) ( not ( = ?auto_1924498 ?auto_1924500 ) ) ( not ( = ?auto_1924498 ?auto_1924499 ) ) ( not ( = ?auto_1924498 ?auto_1924501 ) ) ( not ( = ?auto_1924498 ?auto_1924502 ) ) ( not ( = ?auto_1924498 ?auto_1924503 ) ) ( not ( = ?auto_1924498 ?auto_1924504 ) ) ( not ( = ?auto_1924498 ?auto_1924506 ) ) ( not ( = ?auto_1924500 ?auto_1924499 ) ) ( not ( = ?auto_1924500 ?auto_1924501 ) ) ( not ( = ?auto_1924500 ?auto_1924502 ) ) ( not ( = ?auto_1924500 ?auto_1924503 ) ) ( not ( = ?auto_1924500 ?auto_1924504 ) ) ( not ( = ?auto_1924500 ?auto_1924506 ) ) ( not ( = ?auto_1924499 ?auto_1924501 ) ) ( not ( = ?auto_1924499 ?auto_1924502 ) ) ( not ( = ?auto_1924499 ?auto_1924503 ) ) ( not ( = ?auto_1924499 ?auto_1924504 ) ) ( not ( = ?auto_1924499 ?auto_1924506 ) ) ( not ( = ?auto_1924501 ?auto_1924502 ) ) ( not ( = ?auto_1924501 ?auto_1924503 ) ) ( not ( = ?auto_1924501 ?auto_1924504 ) ) ( not ( = ?auto_1924501 ?auto_1924506 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1924502 ?auto_1924503 ?auto_1924504 )
      ( MAKE-8CRATE-VERIFY ?auto_1924496 ?auto_1924497 ?auto_1924498 ?auto_1924500 ?auto_1924499 ?auto_1924501 ?auto_1924502 ?auto_1924503 ?auto_1924504 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1924589 - SURFACE
      ?auto_1924590 - SURFACE
      ?auto_1924591 - SURFACE
      ?auto_1924593 - SURFACE
      ?auto_1924592 - SURFACE
      ?auto_1924594 - SURFACE
      ?auto_1924595 - SURFACE
      ?auto_1924596 - SURFACE
      ?auto_1924597 - SURFACE
    )
    :vars
    (
      ?auto_1924598 - HOIST
      ?auto_1924601 - PLACE
      ?auto_1924600 - PLACE
      ?auto_1924602 - HOIST
      ?auto_1924599 - SURFACE
      ?auto_1924603 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924598 ?auto_1924601 ) ( IS-CRATE ?auto_1924597 ) ( not ( = ?auto_1924596 ?auto_1924597 ) ) ( not ( = ?auto_1924595 ?auto_1924596 ) ) ( not ( = ?auto_1924595 ?auto_1924597 ) ) ( not ( = ?auto_1924600 ?auto_1924601 ) ) ( HOIST-AT ?auto_1924602 ?auto_1924600 ) ( not ( = ?auto_1924598 ?auto_1924602 ) ) ( AVAILABLE ?auto_1924602 ) ( SURFACE-AT ?auto_1924597 ?auto_1924600 ) ( ON ?auto_1924597 ?auto_1924599 ) ( CLEAR ?auto_1924597 ) ( not ( = ?auto_1924596 ?auto_1924599 ) ) ( not ( = ?auto_1924597 ?auto_1924599 ) ) ( not ( = ?auto_1924595 ?auto_1924599 ) ) ( TRUCK-AT ?auto_1924603 ?auto_1924601 ) ( SURFACE-AT ?auto_1924595 ?auto_1924601 ) ( CLEAR ?auto_1924595 ) ( IS-CRATE ?auto_1924596 ) ( AVAILABLE ?auto_1924598 ) ( IN ?auto_1924596 ?auto_1924603 ) ( ON ?auto_1924590 ?auto_1924589 ) ( ON ?auto_1924591 ?auto_1924590 ) ( ON ?auto_1924593 ?auto_1924591 ) ( ON ?auto_1924592 ?auto_1924593 ) ( ON ?auto_1924594 ?auto_1924592 ) ( ON ?auto_1924595 ?auto_1924594 ) ( not ( = ?auto_1924589 ?auto_1924590 ) ) ( not ( = ?auto_1924589 ?auto_1924591 ) ) ( not ( = ?auto_1924589 ?auto_1924593 ) ) ( not ( = ?auto_1924589 ?auto_1924592 ) ) ( not ( = ?auto_1924589 ?auto_1924594 ) ) ( not ( = ?auto_1924589 ?auto_1924595 ) ) ( not ( = ?auto_1924589 ?auto_1924596 ) ) ( not ( = ?auto_1924589 ?auto_1924597 ) ) ( not ( = ?auto_1924589 ?auto_1924599 ) ) ( not ( = ?auto_1924590 ?auto_1924591 ) ) ( not ( = ?auto_1924590 ?auto_1924593 ) ) ( not ( = ?auto_1924590 ?auto_1924592 ) ) ( not ( = ?auto_1924590 ?auto_1924594 ) ) ( not ( = ?auto_1924590 ?auto_1924595 ) ) ( not ( = ?auto_1924590 ?auto_1924596 ) ) ( not ( = ?auto_1924590 ?auto_1924597 ) ) ( not ( = ?auto_1924590 ?auto_1924599 ) ) ( not ( = ?auto_1924591 ?auto_1924593 ) ) ( not ( = ?auto_1924591 ?auto_1924592 ) ) ( not ( = ?auto_1924591 ?auto_1924594 ) ) ( not ( = ?auto_1924591 ?auto_1924595 ) ) ( not ( = ?auto_1924591 ?auto_1924596 ) ) ( not ( = ?auto_1924591 ?auto_1924597 ) ) ( not ( = ?auto_1924591 ?auto_1924599 ) ) ( not ( = ?auto_1924593 ?auto_1924592 ) ) ( not ( = ?auto_1924593 ?auto_1924594 ) ) ( not ( = ?auto_1924593 ?auto_1924595 ) ) ( not ( = ?auto_1924593 ?auto_1924596 ) ) ( not ( = ?auto_1924593 ?auto_1924597 ) ) ( not ( = ?auto_1924593 ?auto_1924599 ) ) ( not ( = ?auto_1924592 ?auto_1924594 ) ) ( not ( = ?auto_1924592 ?auto_1924595 ) ) ( not ( = ?auto_1924592 ?auto_1924596 ) ) ( not ( = ?auto_1924592 ?auto_1924597 ) ) ( not ( = ?auto_1924592 ?auto_1924599 ) ) ( not ( = ?auto_1924594 ?auto_1924595 ) ) ( not ( = ?auto_1924594 ?auto_1924596 ) ) ( not ( = ?auto_1924594 ?auto_1924597 ) ) ( not ( = ?auto_1924594 ?auto_1924599 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1924595 ?auto_1924596 ?auto_1924597 )
      ( MAKE-8CRATE-VERIFY ?auto_1924589 ?auto_1924590 ?auto_1924591 ?auto_1924593 ?auto_1924592 ?auto_1924594 ?auto_1924595 ?auto_1924596 ?auto_1924597 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1926484 - SURFACE
      ?auto_1926485 - SURFACE
    )
    :vars
    (
      ?auto_1926490 - HOIST
      ?auto_1926488 - PLACE
      ?auto_1926491 - SURFACE
      ?auto_1926489 - TRUCK
      ?auto_1926487 - PLACE
      ?auto_1926486 - HOIST
      ?auto_1926492 - SURFACE
      ?auto_1926493 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1926490 ?auto_1926488 ) ( SURFACE-AT ?auto_1926484 ?auto_1926488 ) ( CLEAR ?auto_1926484 ) ( IS-CRATE ?auto_1926485 ) ( not ( = ?auto_1926484 ?auto_1926485 ) ) ( AVAILABLE ?auto_1926490 ) ( ON ?auto_1926484 ?auto_1926491 ) ( not ( = ?auto_1926491 ?auto_1926484 ) ) ( not ( = ?auto_1926491 ?auto_1926485 ) ) ( TRUCK-AT ?auto_1926489 ?auto_1926487 ) ( not ( = ?auto_1926487 ?auto_1926488 ) ) ( HOIST-AT ?auto_1926486 ?auto_1926487 ) ( not ( = ?auto_1926490 ?auto_1926486 ) ) ( SURFACE-AT ?auto_1926485 ?auto_1926487 ) ( ON ?auto_1926485 ?auto_1926492 ) ( CLEAR ?auto_1926485 ) ( not ( = ?auto_1926484 ?auto_1926492 ) ) ( not ( = ?auto_1926485 ?auto_1926492 ) ) ( not ( = ?auto_1926491 ?auto_1926492 ) ) ( LIFTING ?auto_1926486 ?auto_1926493 ) ( IS-CRATE ?auto_1926493 ) ( not ( = ?auto_1926484 ?auto_1926493 ) ) ( not ( = ?auto_1926485 ?auto_1926493 ) ) ( not ( = ?auto_1926491 ?auto_1926493 ) ) ( not ( = ?auto_1926492 ?auto_1926493 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1926486 ?auto_1926493 ?auto_1926489 ?auto_1926487 )
      ( MAKE-1CRATE ?auto_1926484 ?auto_1926485 )
      ( MAKE-1CRATE-VERIFY ?auto_1926484 ?auto_1926485 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1928694 - SURFACE
      ?auto_1928695 - SURFACE
      ?auto_1928696 - SURFACE
      ?auto_1928698 - SURFACE
      ?auto_1928697 - SURFACE
      ?auto_1928699 - SURFACE
      ?auto_1928700 - SURFACE
      ?auto_1928701 - SURFACE
      ?auto_1928702 - SURFACE
      ?auto_1928703 - SURFACE
    )
    :vars
    (
      ?auto_1928704 - HOIST
      ?auto_1928705 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1928704 ?auto_1928705 ) ( SURFACE-AT ?auto_1928702 ?auto_1928705 ) ( CLEAR ?auto_1928702 ) ( LIFTING ?auto_1928704 ?auto_1928703 ) ( IS-CRATE ?auto_1928703 ) ( not ( = ?auto_1928702 ?auto_1928703 ) ) ( ON ?auto_1928695 ?auto_1928694 ) ( ON ?auto_1928696 ?auto_1928695 ) ( ON ?auto_1928698 ?auto_1928696 ) ( ON ?auto_1928697 ?auto_1928698 ) ( ON ?auto_1928699 ?auto_1928697 ) ( ON ?auto_1928700 ?auto_1928699 ) ( ON ?auto_1928701 ?auto_1928700 ) ( ON ?auto_1928702 ?auto_1928701 ) ( not ( = ?auto_1928694 ?auto_1928695 ) ) ( not ( = ?auto_1928694 ?auto_1928696 ) ) ( not ( = ?auto_1928694 ?auto_1928698 ) ) ( not ( = ?auto_1928694 ?auto_1928697 ) ) ( not ( = ?auto_1928694 ?auto_1928699 ) ) ( not ( = ?auto_1928694 ?auto_1928700 ) ) ( not ( = ?auto_1928694 ?auto_1928701 ) ) ( not ( = ?auto_1928694 ?auto_1928702 ) ) ( not ( = ?auto_1928694 ?auto_1928703 ) ) ( not ( = ?auto_1928695 ?auto_1928696 ) ) ( not ( = ?auto_1928695 ?auto_1928698 ) ) ( not ( = ?auto_1928695 ?auto_1928697 ) ) ( not ( = ?auto_1928695 ?auto_1928699 ) ) ( not ( = ?auto_1928695 ?auto_1928700 ) ) ( not ( = ?auto_1928695 ?auto_1928701 ) ) ( not ( = ?auto_1928695 ?auto_1928702 ) ) ( not ( = ?auto_1928695 ?auto_1928703 ) ) ( not ( = ?auto_1928696 ?auto_1928698 ) ) ( not ( = ?auto_1928696 ?auto_1928697 ) ) ( not ( = ?auto_1928696 ?auto_1928699 ) ) ( not ( = ?auto_1928696 ?auto_1928700 ) ) ( not ( = ?auto_1928696 ?auto_1928701 ) ) ( not ( = ?auto_1928696 ?auto_1928702 ) ) ( not ( = ?auto_1928696 ?auto_1928703 ) ) ( not ( = ?auto_1928698 ?auto_1928697 ) ) ( not ( = ?auto_1928698 ?auto_1928699 ) ) ( not ( = ?auto_1928698 ?auto_1928700 ) ) ( not ( = ?auto_1928698 ?auto_1928701 ) ) ( not ( = ?auto_1928698 ?auto_1928702 ) ) ( not ( = ?auto_1928698 ?auto_1928703 ) ) ( not ( = ?auto_1928697 ?auto_1928699 ) ) ( not ( = ?auto_1928697 ?auto_1928700 ) ) ( not ( = ?auto_1928697 ?auto_1928701 ) ) ( not ( = ?auto_1928697 ?auto_1928702 ) ) ( not ( = ?auto_1928697 ?auto_1928703 ) ) ( not ( = ?auto_1928699 ?auto_1928700 ) ) ( not ( = ?auto_1928699 ?auto_1928701 ) ) ( not ( = ?auto_1928699 ?auto_1928702 ) ) ( not ( = ?auto_1928699 ?auto_1928703 ) ) ( not ( = ?auto_1928700 ?auto_1928701 ) ) ( not ( = ?auto_1928700 ?auto_1928702 ) ) ( not ( = ?auto_1928700 ?auto_1928703 ) ) ( not ( = ?auto_1928701 ?auto_1928702 ) ) ( not ( = ?auto_1928701 ?auto_1928703 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1928702 ?auto_1928703 )
      ( MAKE-9CRATE-VERIFY ?auto_1928694 ?auto_1928695 ?auto_1928696 ?auto_1928698 ?auto_1928697 ?auto_1928699 ?auto_1928700 ?auto_1928701 ?auto_1928702 ?auto_1928703 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1928774 - SURFACE
      ?auto_1928775 - SURFACE
      ?auto_1928776 - SURFACE
      ?auto_1928778 - SURFACE
      ?auto_1928777 - SURFACE
      ?auto_1928779 - SURFACE
      ?auto_1928780 - SURFACE
      ?auto_1928781 - SURFACE
      ?auto_1928782 - SURFACE
      ?auto_1928783 - SURFACE
    )
    :vars
    (
      ?auto_1928784 - HOIST
      ?auto_1928785 - PLACE
      ?auto_1928786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1928784 ?auto_1928785 ) ( SURFACE-AT ?auto_1928782 ?auto_1928785 ) ( CLEAR ?auto_1928782 ) ( IS-CRATE ?auto_1928783 ) ( not ( = ?auto_1928782 ?auto_1928783 ) ) ( TRUCK-AT ?auto_1928786 ?auto_1928785 ) ( AVAILABLE ?auto_1928784 ) ( IN ?auto_1928783 ?auto_1928786 ) ( ON ?auto_1928782 ?auto_1928781 ) ( not ( = ?auto_1928781 ?auto_1928782 ) ) ( not ( = ?auto_1928781 ?auto_1928783 ) ) ( ON ?auto_1928775 ?auto_1928774 ) ( ON ?auto_1928776 ?auto_1928775 ) ( ON ?auto_1928778 ?auto_1928776 ) ( ON ?auto_1928777 ?auto_1928778 ) ( ON ?auto_1928779 ?auto_1928777 ) ( ON ?auto_1928780 ?auto_1928779 ) ( ON ?auto_1928781 ?auto_1928780 ) ( not ( = ?auto_1928774 ?auto_1928775 ) ) ( not ( = ?auto_1928774 ?auto_1928776 ) ) ( not ( = ?auto_1928774 ?auto_1928778 ) ) ( not ( = ?auto_1928774 ?auto_1928777 ) ) ( not ( = ?auto_1928774 ?auto_1928779 ) ) ( not ( = ?auto_1928774 ?auto_1928780 ) ) ( not ( = ?auto_1928774 ?auto_1928781 ) ) ( not ( = ?auto_1928774 ?auto_1928782 ) ) ( not ( = ?auto_1928774 ?auto_1928783 ) ) ( not ( = ?auto_1928775 ?auto_1928776 ) ) ( not ( = ?auto_1928775 ?auto_1928778 ) ) ( not ( = ?auto_1928775 ?auto_1928777 ) ) ( not ( = ?auto_1928775 ?auto_1928779 ) ) ( not ( = ?auto_1928775 ?auto_1928780 ) ) ( not ( = ?auto_1928775 ?auto_1928781 ) ) ( not ( = ?auto_1928775 ?auto_1928782 ) ) ( not ( = ?auto_1928775 ?auto_1928783 ) ) ( not ( = ?auto_1928776 ?auto_1928778 ) ) ( not ( = ?auto_1928776 ?auto_1928777 ) ) ( not ( = ?auto_1928776 ?auto_1928779 ) ) ( not ( = ?auto_1928776 ?auto_1928780 ) ) ( not ( = ?auto_1928776 ?auto_1928781 ) ) ( not ( = ?auto_1928776 ?auto_1928782 ) ) ( not ( = ?auto_1928776 ?auto_1928783 ) ) ( not ( = ?auto_1928778 ?auto_1928777 ) ) ( not ( = ?auto_1928778 ?auto_1928779 ) ) ( not ( = ?auto_1928778 ?auto_1928780 ) ) ( not ( = ?auto_1928778 ?auto_1928781 ) ) ( not ( = ?auto_1928778 ?auto_1928782 ) ) ( not ( = ?auto_1928778 ?auto_1928783 ) ) ( not ( = ?auto_1928777 ?auto_1928779 ) ) ( not ( = ?auto_1928777 ?auto_1928780 ) ) ( not ( = ?auto_1928777 ?auto_1928781 ) ) ( not ( = ?auto_1928777 ?auto_1928782 ) ) ( not ( = ?auto_1928777 ?auto_1928783 ) ) ( not ( = ?auto_1928779 ?auto_1928780 ) ) ( not ( = ?auto_1928779 ?auto_1928781 ) ) ( not ( = ?auto_1928779 ?auto_1928782 ) ) ( not ( = ?auto_1928779 ?auto_1928783 ) ) ( not ( = ?auto_1928780 ?auto_1928781 ) ) ( not ( = ?auto_1928780 ?auto_1928782 ) ) ( not ( = ?auto_1928780 ?auto_1928783 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1928781 ?auto_1928782 ?auto_1928783 )
      ( MAKE-9CRATE-VERIFY ?auto_1928774 ?auto_1928775 ?auto_1928776 ?auto_1928778 ?auto_1928777 ?auto_1928779 ?auto_1928780 ?auto_1928781 ?auto_1928782 ?auto_1928783 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1928864 - SURFACE
      ?auto_1928865 - SURFACE
      ?auto_1928866 - SURFACE
      ?auto_1928868 - SURFACE
      ?auto_1928867 - SURFACE
      ?auto_1928869 - SURFACE
      ?auto_1928870 - SURFACE
      ?auto_1928871 - SURFACE
      ?auto_1928872 - SURFACE
      ?auto_1928873 - SURFACE
    )
    :vars
    (
      ?auto_1928877 - HOIST
      ?auto_1928874 - PLACE
      ?auto_1928875 - TRUCK
      ?auto_1928876 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1928877 ?auto_1928874 ) ( SURFACE-AT ?auto_1928872 ?auto_1928874 ) ( CLEAR ?auto_1928872 ) ( IS-CRATE ?auto_1928873 ) ( not ( = ?auto_1928872 ?auto_1928873 ) ) ( AVAILABLE ?auto_1928877 ) ( IN ?auto_1928873 ?auto_1928875 ) ( ON ?auto_1928872 ?auto_1928871 ) ( not ( = ?auto_1928871 ?auto_1928872 ) ) ( not ( = ?auto_1928871 ?auto_1928873 ) ) ( TRUCK-AT ?auto_1928875 ?auto_1928876 ) ( not ( = ?auto_1928876 ?auto_1928874 ) ) ( ON ?auto_1928865 ?auto_1928864 ) ( ON ?auto_1928866 ?auto_1928865 ) ( ON ?auto_1928868 ?auto_1928866 ) ( ON ?auto_1928867 ?auto_1928868 ) ( ON ?auto_1928869 ?auto_1928867 ) ( ON ?auto_1928870 ?auto_1928869 ) ( ON ?auto_1928871 ?auto_1928870 ) ( not ( = ?auto_1928864 ?auto_1928865 ) ) ( not ( = ?auto_1928864 ?auto_1928866 ) ) ( not ( = ?auto_1928864 ?auto_1928868 ) ) ( not ( = ?auto_1928864 ?auto_1928867 ) ) ( not ( = ?auto_1928864 ?auto_1928869 ) ) ( not ( = ?auto_1928864 ?auto_1928870 ) ) ( not ( = ?auto_1928864 ?auto_1928871 ) ) ( not ( = ?auto_1928864 ?auto_1928872 ) ) ( not ( = ?auto_1928864 ?auto_1928873 ) ) ( not ( = ?auto_1928865 ?auto_1928866 ) ) ( not ( = ?auto_1928865 ?auto_1928868 ) ) ( not ( = ?auto_1928865 ?auto_1928867 ) ) ( not ( = ?auto_1928865 ?auto_1928869 ) ) ( not ( = ?auto_1928865 ?auto_1928870 ) ) ( not ( = ?auto_1928865 ?auto_1928871 ) ) ( not ( = ?auto_1928865 ?auto_1928872 ) ) ( not ( = ?auto_1928865 ?auto_1928873 ) ) ( not ( = ?auto_1928866 ?auto_1928868 ) ) ( not ( = ?auto_1928866 ?auto_1928867 ) ) ( not ( = ?auto_1928866 ?auto_1928869 ) ) ( not ( = ?auto_1928866 ?auto_1928870 ) ) ( not ( = ?auto_1928866 ?auto_1928871 ) ) ( not ( = ?auto_1928866 ?auto_1928872 ) ) ( not ( = ?auto_1928866 ?auto_1928873 ) ) ( not ( = ?auto_1928868 ?auto_1928867 ) ) ( not ( = ?auto_1928868 ?auto_1928869 ) ) ( not ( = ?auto_1928868 ?auto_1928870 ) ) ( not ( = ?auto_1928868 ?auto_1928871 ) ) ( not ( = ?auto_1928868 ?auto_1928872 ) ) ( not ( = ?auto_1928868 ?auto_1928873 ) ) ( not ( = ?auto_1928867 ?auto_1928869 ) ) ( not ( = ?auto_1928867 ?auto_1928870 ) ) ( not ( = ?auto_1928867 ?auto_1928871 ) ) ( not ( = ?auto_1928867 ?auto_1928872 ) ) ( not ( = ?auto_1928867 ?auto_1928873 ) ) ( not ( = ?auto_1928869 ?auto_1928870 ) ) ( not ( = ?auto_1928869 ?auto_1928871 ) ) ( not ( = ?auto_1928869 ?auto_1928872 ) ) ( not ( = ?auto_1928869 ?auto_1928873 ) ) ( not ( = ?auto_1928870 ?auto_1928871 ) ) ( not ( = ?auto_1928870 ?auto_1928872 ) ) ( not ( = ?auto_1928870 ?auto_1928873 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1928871 ?auto_1928872 ?auto_1928873 )
      ( MAKE-9CRATE-VERIFY ?auto_1928864 ?auto_1928865 ?auto_1928866 ?auto_1928868 ?auto_1928867 ?auto_1928869 ?auto_1928870 ?auto_1928871 ?auto_1928872 ?auto_1928873 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1928963 - SURFACE
      ?auto_1928964 - SURFACE
      ?auto_1928965 - SURFACE
      ?auto_1928967 - SURFACE
      ?auto_1928966 - SURFACE
      ?auto_1928968 - SURFACE
      ?auto_1928969 - SURFACE
      ?auto_1928970 - SURFACE
      ?auto_1928971 - SURFACE
      ?auto_1928972 - SURFACE
    )
    :vars
    (
      ?auto_1928973 - HOIST
      ?auto_1928974 - PLACE
      ?auto_1928975 - TRUCK
      ?auto_1928977 - PLACE
      ?auto_1928976 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1928973 ?auto_1928974 ) ( SURFACE-AT ?auto_1928971 ?auto_1928974 ) ( CLEAR ?auto_1928971 ) ( IS-CRATE ?auto_1928972 ) ( not ( = ?auto_1928971 ?auto_1928972 ) ) ( AVAILABLE ?auto_1928973 ) ( ON ?auto_1928971 ?auto_1928970 ) ( not ( = ?auto_1928970 ?auto_1928971 ) ) ( not ( = ?auto_1928970 ?auto_1928972 ) ) ( TRUCK-AT ?auto_1928975 ?auto_1928977 ) ( not ( = ?auto_1928977 ?auto_1928974 ) ) ( HOIST-AT ?auto_1928976 ?auto_1928977 ) ( LIFTING ?auto_1928976 ?auto_1928972 ) ( not ( = ?auto_1928973 ?auto_1928976 ) ) ( ON ?auto_1928964 ?auto_1928963 ) ( ON ?auto_1928965 ?auto_1928964 ) ( ON ?auto_1928967 ?auto_1928965 ) ( ON ?auto_1928966 ?auto_1928967 ) ( ON ?auto_1928968 ?auto_1928966 ) ( ON ?auto_1928969 ?auto_1928968 ) ( ON ?auto_1928970 ?auto_1928969 ) ( not ( = ?auto_1928963 ?auto_1928964 ) ) ( not ( = ?auto_1928963 ?auto_1928965 ) ) ( not ( = ?auto_1928963 ?auto_1928967 ) ) ( not ( = ?auto_1928963 ?auto_1928966 ) ) ( not ( = ?auto_1928963 ?auto_1928968 ) ) ( not ( = ?auto_1928963 ?auto_1928969 ) ) ( not ( = ?auto_1928963 ?auto_1928970 ) ) ( not ( = ?auto_1928963 ?auto_1928971 ) ) ( not ( = ?auto_1928963 ?auto_1928972 ) ) ( not ( = ?auto_1928964 ?auto_1928965 ) ) ( not ( = ?auto_1928964 ?auto_1928967 ) ) ( not ( = ?auto_1928964 ?auto_1928966 ) ) ( not ( = ?auto_1928964 ?auto_1928968 ) ) ( not ( = ?auto_1928964 ?auto_1928969 ) ) ( not ( = ?auto_1928964 ?auto_1928970 ) ) ( not ( = ?auto_1928964 ?auto_1928971 ) ) ( not ( = ?auto_1928964 ?auto_1928972 ) ) ( not ( = ?auto_1928965 ?auto_1928967 ) ) ( not ( = ?auto_1928965 ?auto_1928966 ) ) ( not ( = ?auto_1928965 ?auto_1928968 ) ) ( not ( = ?auto_1928965 ?auto_1928969 ) ) ( not ( = ?auto_1928965 ?auto_1928970 ) ) ( not ( = ?auto_1928965 ?auto_1928971 ) ) ( not ( = ?auto_1928965 ?auto_1928972 ) ) ( not ( = ?auto_1928967 ?auto_1928966 ) ) ( not ( = ?auto_1928967 ?auto_1928968 ) ) ( not ( = ?auto_1928967 ?auto_1928969 ) ) ( not ( = ?auto_1928967 ?auto_1928970 ) ) ( not ( = ?auto_1928967 ?auto_1928971 ) ) ( not ( = ?auto_1928967 ?auto_1928972 ) ) ( not ( = ?auto_1928966 ?auto_1928968 ) ) ( not ( = ?auto_1928966 ?auto_1928969 ) ) ( not ( = ?auto_1928966 ?auto_1928970 ) ) ( not ( = ?auto_1928966 ?auto_1928971 ) ) ( not ( = ?auto_1928966 ?auto_1928972 ) ) ( not ( = ?auto_1928968 ?auto_1928969 ) ) ( not ( = ?auto_1928968 ?auto_1928970 ) ) ( not ( = ?auto_1928968 ?auto_1928971 ) ) ( not ( = ?auto_1928968 ?auto_1928972 ) ) ( not ( = ?auto_1928969 ?auto_1928970 ) ) ( not ( = ?auto_1928969 ?auto_1928971 ) ) ( not ( = ?auto_1928969 ?auto_1928972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1928970 ?auto_1928971 ?auto_1928972 )
      ( MAKE-9CRATE-VERIFY ?auto_1928963 ?auto_1928964 ?auto_1928965 ?auto_1928967 ?auto_1928966 ?auto_1928968 ?auto_1928969 ?auto_1928970 ?auto_1928971 ?auto_1928972 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1929071 - SURFACE
      ?auto_1929072 - SURFACE
      ?auto_1929073 - SURFACE
      ?auto_1929075 - SURFACE
      ?auto_1929074 - SURFACE
      ?auto_1929076 - SURFACE
      ?auto_1929077 - SURFACE
      ?auto_1929078 - SURFACE
      ?auto_1929079 - SURFACE
      ?auto_1929080 - SURFACE
    )
    :vars
    (
      ?auto_1929083 - HOIST
      ?auto_1929084 - PLACE
      ?auto_1929081 - TRUCK
      ?auto_1929082 - PLACE
      ?auto_1929086 - HOIST
      ?auto_1929085 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1929083 ?auto_1929084 ) ( SURFACE-AT ?auto_1929079 ?auto_1929084 ) ( CLEAR ?auto_1929079 ) ( IS-CRATE ?auto_1929080 ) ( not ( = ?auto_1929079 ?auto_1929080 ) ) ( AVAILABLE ?auto_1929083 ) ( ON ?auto_1929079 ?auto_1929078 ) ( not ( = ?auto_1929078 ?auto_1929079 ) ) ( not ( = ?auto_1929078 ?auto_1929080 ) ) ( TRUCK-AT ?auto_1929081 ?auto_1929082 ) ( not ( = ?auto_1929082 ?auto_1929084 ) ) ( HOIST-AT ?auto_1929086 ?auto_1929082 ) ( not ( = ?auto_1929083 ?auto_1929086 ) ) ( AVAILABLE ?auto_1929086 ) ( SURFACE-AT ?auto_1929080 ?auto_1929082 ) ( ON ?auto_1929080 ?auto_1929085 ) ( CLEAR ?auto_1929080 ) ( not ( = ?auto_1929079 ?auto_1929085 ) ) ( not ( = ?auto_1929080 ?auto_1929085 ) ) ( not ( = ?auto_1929078 ?auto_1929085 ) ) ( ON ?auto_1929072 ?auto_1929071 ) ( ON ?auto_1929073 ?auto_1929072 ) ( ON ?auto_1929075 ?auto_1929073 ) ( ON ?auto_1929074 ?auto_1929075 ) ( ON ?auto_1929076 ?auto_1929074 ) ( ON ?auto_1929077 ?auto_1929076 ) ( ON ?auto_1929078 ?auto_1929077 ) ( not ( = ?auto_1929071 ?auto_1929072 ) ) ( not ( = ?auto_1929071 ?auto_1929073 ) ) ( not ( = ?auto_1929071 ?auto_1929075 ) ) ( not ( = ?auto_1929071 ?auto_1929074 ) ) ( not ( = ?auto_1929071 ?auto_1929076 ) ) ( not ( = ?auto_1929071 ?auto_1929077 ) ) ( not ( = ?auto_1929071 ?auto_1929078 ) ) ( not ( = ?auto_1929071 ?auto_1929079 ) ) ( not ( = ?auto_1929071 ?auto_1929080 ) ) ( not ( = ?auto_1929071 ?auto_1929085 ) ) ( not ( = ?auto_1929072 ?auto_1929073 ) ) ( not ( = ?auto_1929072 ?auto_1929075 ) ) ( not ( = ?auto_1929072 ?auto_1929074 ) ) ( not ( = ?auto_1929072 ?auto_1929076 ) ) ( not ( = ?auto_1929072 ?auto_1929077 ) ) ( not ( = ?auto_1929072 ?auto_1929078 ) ) ( not ( = ?auto_1929072 ?auto_1929079 ) ) ( not ( = ?auto_1929072 ?auto_1929080 ) ) ( not ( = ?auto_1929072 ?auto_1929085 ) ) ( not ( = ?auto_1929073 ?auto_1929075 ) ) ( not ( = ?auto_1929073 ?auto_1929074 ) ) ( not ( = ?auto_1929073 ?auto_1929076 ) ) ( not ( = ?auto_1929073 ?auto_1929077 ) ) ( not ( = ?auto_1929073 ?auto_1929078 ) ) ( not ( = ?auto_1929073 ?auto_1929079 ) ) ( not ( = ?auto_1929073 ?auto_1929080 ) ) ( not ( = ?auto_1929073 ?auto_1929085 ) ) ( not ( = ?auto_1929075 ?auto_1929074 ) ) ( not ( = ?auto_1929075 ?auto_1929076 ) ) ( not ( = ?auto_1929075 ?auto_1929077 ) ) ( not ( = ?auto_1929075 ?auto_1929078 ) ) ( not ( = ?auto_1929075 ?auto_1929079 ) ) ( not ( = ?auto_1929075 ?auto_1929080 ) ) ( not ( = ?auto_1929075 ?auto_1929085 ) ) ( not ( = ?auto_1929074 ?auto_1929076 ) ) ( not ( = ?auto_1929074 ?auto_1929077 ) ) ( not ( = ?auto_1929074 ?auto_1929078 ) ) ( not ( = ?auto_1929074 ?auto_1929079 ) ) ( not ( = ?auto_1929074 ?auto_1929080 ) ) ( not ( = ?auto_1929074 ?auto_1929085 ) ) ( not ( = ?auto_1929076 ?auto_1929077 ) ) ( not ( = ?auto_1929076 ?auto_1929078 ) ) ( not ( = ?auto_1929076 ?auto_1929079 ) ) ( not ( = ?auto_1929076 ?auto_1929080 ) ) ( not ( = ?auto_1929076 ?auto_1929085 ) ) ( not ( = ?auto_1929077 ?auto_1929078 ) ) ( not ( = ?auto_1929077 ?auto_1929079 ) ) ( not ( = ?auto_1929077 ?auto_1929080 ) ) ( not ( = ?auto_1929077 ?auto_1929085 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1929078 ?auto_1929079 ?auto_1929080 )
      ( MAKE-9CRATE-VERIFY ?auto_1929071 ?auto_1929072 ?auto_1929073 ?auto_1929075 ?auto_1929074 ?auto_1929076 ?auto_1929077 ?auto_1929078 ?auto_1929079 ?auto_1929080 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1929180 - SURFACE
      ?auto_1929181 - SURFACE
      ?auto_1929182 - SURFACE
      ?auto_1929184 - SURFACE
      ?auto_1929183 - SURFACE
      ?auto_1929185 - SURFACE
      ?auto_1929186 - SURFACE
      ?auto_1929187 - SURFACE
      ?auto_1929188 - SURFACE
      ?auto_1929189 - SURFACE
    )
    :vars
    (
      ?auto_1929193 - HOIST
      ?auto_1929192 - PLACE
      ?auto_1929190 - PLACE
      ?auto_1929191 - HOIST
      ?auto_1929195 - SURFACE
      ?auto_1929194 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1929193 ?auto_1929192 ) ( SURFACE-AT ?auto_1929188 ?auto_1929192 ) ( CLEAR ?auto_1929188 ) ( IS-CRATE ?auto_1929189 ) ( not ( = ?auto_1929188 ?auto_1929189 ) ) ( AVAILABLE ?auto_1929193 ) ( ON ?auto_1929188 ?auto_1929187 ) ( not ( = ?auto_1929187 ?auto_1929188 ) ) ( not ( = ?auto_1929187 ?auto_1929189 ) ) ( not ( = ?auto_1929190 ?auto_1929192 ) ) ( HOIST-AT ?auto_1929191 ?auto_1929190 ) ( not ( = ?auto_1929193 ?auto_1929191 ) ) ( AVAILABLE ?auto_1929191 ) ( SURFACE-AT ?auto_1929189 ?auto_1929190 ) ( ON ?auto_1929189 ?auto_1929195 ) ( CLEAR ?auto_1929189 ) ( not ( = ?auto_1929188 ?auto_1929195 ) ) ( not ( = ?auto_1929189 ?auto_1929195 ) ) ( not ( = ?auto_1929187 ?auto_1929195 ) ) ( TRUCK-AT ?auto_1929194 ?auto_1929192 ) ( ON ?auto_1929181 ?auto_1929180 ) ( ON ?auto_1929182 ?auto_1929181 ) ( ON ?auto_1929184 ?auto_1929182 ) ( ON ?auto_1929183 ?auto_1929184 ) ( ON ?auto_1929185 ?auto_1929183 ) ( ON ?auto_1929186 ?auto_1929185 ) ( ON ?auto_1929187 ?auto_1929186 ) ( not ( = ?auto_1929180 ?auto_1929181 ) ) ( not ( = ?auto_1929180 ?auto_1929182 ) ) ( not ( = ?auto_1929180 ?auto_1929184 ) ) ( not ( = ?auto_1929180 ?auto_1929183 ) ) ( not ( = ?auto_1929180 ?auto_1929185 ) ) ( not ( = ?auto_1929180 ?auto_1929186 ) ) ( not ( = ?auto_1929180 ?auto_1929187 ) ) ( not ( = ?auto_1929180 ?auto_1929188 ) ) ( not ( = ?auto_1929180 ?auto_1929189 ) ) ( not ( = ?auto_1929180 ?auto_1929195 ) ) ( not ( = ?auto_1929181 ?auto_1929182 ) ) ( not ( = ?auto_1929181 ?auto_1929184 ) ) ( not ( = ?auto_1929181 ?auto_1929183 ) ) ( not ( = ?auto_1929181 ?auto_1929185 ) ) ( not ( = ?auto_1929181 ?auto_1929186 ) ) ( not ( = ?auto_1929181 ?auto_1929187 ) ) ( not ( = ?auto_1929181 ?auto_1929188 ) ) ( not ( = ?auto_1929181 ?auto_1929189 ) ) ( not ( = ?auto_1929181 ?auto_1929195 ) ) ( not ( = ?auto_1929182 ?auto_1929184 ) ) ( not ( = ?auto_1929182 ?auto_1929183 ) ) ( not ( = ?auto_1929182 ?auto_1929185 ) ) ( not ( = ?auto_1929182 ?auto_1929186 ) ) ( not ( = ?auto_1929182 ?auto_1929187 ) ) ( not ( = ?auto_1929182 ?auto_1929188 ) ) ( not ( = ?auto_1929182 ?auto_1929189 ) ) ( not ( = ?auto_1929182 ?auto_1929195 ) ) ( not ( = ?auto_1929184 ?auto_1929183 ) ) ( not ( = ?auto_1929184 ?auto_1929185 ) ) ( not ( = ?auto_1929184 ?auto_1929186 ) ) ( not ( = ?auto_1929184 ?auto_1929187 ) ) ( not ( = ?auto_1929184 ?auto_1929188 ) ) ( not ( = ?auto_1929184 ?auto_1929189 ) ) ( not ( = ?auto_1929184 ?auto_1929195 ) ) ( not ( = ?auto_1929183 ?auto_1929185 ) ) ( not ( = ?auto_1929183 ?auto_1929186 ) ) ( not ( = ?auto_1929183 ?auto_1929187 ) ) ( not ( = ?auto_1929183 ?auto_1929188 ) ) ( not ( = ?auto_1929183 ?auto_1929189 ) ) ( not ( = ?auto_1929183 ?auto_1929195 ) ) ( not ( = ?auto_1929185 ?auto_1929186 ) ) ( not ( = ?auto_1929185 ?auto_1929187 ) ) ( not ( = ?auto_1929185 ?auto_1929188 ) ) ( not ( = ?auto_1929185 ?auto_1929189 ) ) ( not ( = ?auto_1929185 ?auto_1929195 ) ) ( not ( = ?auto_1929186 ?auto_1929187 ) ) ( not ( = ?auto_1929186 ?auto_1929188 ) ) ( not ( = ?auto_1929186 ?auto_1929189 ) ) ( not ( = ?auto_1929186 ?auto_1929195 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1929187 ?auto_1929188 ?auto_1929189 )
      ( MAKE-9CRATE-VERIFY ?auto_1929180 ?auto_1929181 ?auto_1929182 ?auto_1929184 ?auto_1929183 ?auto_1929185 ?auto_1929186 ?auto_1929187 ?auto_1929188 ?auto_1929189 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1929289 - SURFACE
      ?auto_1929290 - SURFACE
      ?auto_1929291 - SURFACE
      ?auto_1929293 - SURFACE
      ?auto_1929292 - SURFACE
      ?auto_1929294 - SURFACE
      ?auto_1929295 - SURFACE
      ?auto_1929296 - SURFACE
      ?auto_1929297 - SURFACE
      ?auto_1929298 - SURFACE
    )
    :vars
    (
      ?auto_1929304 - HOIST
      ?auto_1929299 - PLACE
      ?auto_1929302 - PLACE
      ?auto_1929301 - HOIST
      ?auto_1929303 - SURFACE
      ?auto_1929300 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1929304 ?auto_1929299 ) ( IS-CRATE ?auto_1929298 ) ( not ( = ?auto_1929297 ?auto_1929298 ) ) ( not ( = ?auto_1929296 ?auto_1929297 ) ) ( not ( = ?auto_1929296 ?auto_1929298 ) ) ( not ( = ?auto_1929302 ?auto_1929299 ) ) ( HOIST-AT ?auto_1929301 ?auto_1929302 ) ( not ( = ?auto_1929304 ?auto_1929301 ) ) ( AVAILABLE ?auto_1929301 ) ( SURFACE-AT ?auto_1929298 ?auto_1929302 ) ( ON ?auto_1929298 ?auto_1929303 ) ( CLEAR ?auto_1929298 ) ( not ( = ?auto_1929297 ?auto_1929303 ) ) ( not ( = ?auto_1929298 ?auto_1929303 ) ) ( not ( = ?auto_1929296 ?auto_1929303 ) ) ( TRUCK-AT ?auto_1929300 ?auto_1929299 ) ( SURFACE-AT ?auto_1929296 ?auto_1929299 ) ( CLEAR ?auto_1929296 ) ( LIFTING ?auto_1929304 ?auto_1929297 ) ( IS-CRATE ?auto_1929297 ) ( ON ?auto_1929290 ?auto_1929289 ) ( ON ?auto_1929291 ?auto_1929290 ) ( ON ?auto_1929293 ?auto_1929291 ) ( ON ?auto_1929292 ?auto_1929293 ) ( ON ?auto_1929294 ?auto_1929292 ) ( ON ?auto_1929295 ?auto_1929294 ) ( ON ?auto_1929296 ?auto_1929295 ) ( not ( = ?auto_1929289 ?auto_1929290 ) ) ( not ( = ?auto_1929289 ?auto_1929291 ) ) ( not ( = ?auto_1929289 ?auto_1929293 ) ) ( not ( = ?auto_1929289 ?auto_1929292 ) ) ( not ( = ?auto_1929289 ?auto_1929294 ) ) ( not ( = ?auto_1929289 ?auto_1929295 ) ) ( not ( = ?auto_1929289 ?auto_1929296 ) ) ( not ( = ?auto_1929289 ?auto_1929297 ) ) ( not ( = ?auto_1929289 ?auto_1929298 ) ) ( not ( = ?auto_1929289 ?auto_1929303 ) ) ( not ( = ?auto_1929290 ?auto_1929291 ) ) ( not ( = ?auto_1929290 ?auto_1929293 ) ) ( not ( = ?auto_1929290 ?auto_1929292 ) ) ( not ( = ?auto_1929290 ?auto_1929294 ) ) ( not ( = ?auto_1929290 ?auto_1929295 ) ) ( not ( = ?auto_1929290 ?auto_1929296 ) ) ( not ( = ?auto_1929290 ?auto_1929297 ) ) ( not ( = ?auto_1929290 ?auto_1929298 ) ) ( not ( = ?auto_1929290 ?auto_1929303 ) ) ( not ( = ?auto_1929291 ?auto_1929293 ) ) ( not ( = ?auto_1929291 ?auto_1929292 ) ) ( not ( = ?auto_1929291 ?auto_1929294 ) ) ( not ( = ?auto_1929291 ?auto_1929295 ) ) ( not ( = ?auto_1929291 ?auto_1929296 ) ) ( not ( = ?auto_1929291 ?auto_1929297 ) ) ( not ( = ?auto_1929291 ?auto_1929298 ) ) ( not ( = ?auto_1929291 ?auto_1929303 ) ) ( not ( = ?auto_1929293 ?auto_1929292 ) ) ( not ( = ?auto_1929293 ?auto_1929294 ) ) ( not ( = ?auto_1929293 ?auto_1929295 ) ) ( not ( = ?auto_1929293 ?auto_1929296 ) ) ( not ( = ?auto_1929293 ?auto_1929297 ) ) ( not ( = ?auto_1929293 ?auto_1929298 ) ) ( not ( = ?auto_1929293 ?auto_1929303 ) ) ( not ( = ?auto_1929292 ?auto_1929294 ) ) ( not ( = ?auto_1929292 ?auto_1929295 ) ) ( not ( = ?auto_1929292 ?auto_1929296 ) ) ( not ( = ?auto_1929292 ?auto_1929297 ) ) ( not ( = ?auto_1929292 ?auto_1929298 ) ) ( not ( = ?auto_1929292 ?auto_1929303 ) ) ( not ( = ?auto_1929294 ?auto_1929295 ) ) ( not ( = ?auto_1929294 ?auto_1929296 ) ) ( not ( = ?auto_1929294 ?auto_1929297 ) ) ( not ( = ?auto_1929294 ?auto_1929298 ) ) ( not ( = ?auto_1929294 ?auto_1929303 ) ) ( not ( = ?auto_1929295 ?auto_1929296 ) ) ( not ( = ?auto_1929295 ?auto_1929297 ) ) ( not ( = ?auto_1929295 ?auto_1929298 ) ) ( not ( = ?auto_1929295 ?auto_1929303 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1929296 ?auto_1929297 ?auto_1929298 )
      ( MAKE-9CRATE-VERIFY ?auto_1929289 ?auto_1929290 ?auto_1929291 ?auto_1929293 ?auto_1929292 ?auto_1929294 ?auto_1929295 ?auto_1929296 ?auto_1929297 ?auto_1929298 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1929398 - SURFACE
      ?auto_1929399 - SURFACE
      ?auto_1929400 - SURFACE
      ?auto_1929402 - SURFACE
      ?auto_1929401 - SURFACE
      ?auto_1929403 - SURFACE
      ?auto_1929404 - SURFACE
      ?auto_1929405 - SURFACE
      ?auto_1929406 - SURFACE
      ?auto_1929407 - SURFACE
    )
    :vars
    (
      ?auto_1929410 - HOIST
      ?auto_1929408 - PLACE
      ?auto_1929413 - PLACE
      ?auto_1929409 - HOIST
      ?auto_1929411 - SURFACE
      ?auto_1929412 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1929410 ?auto_1929408 ) ( IS-CRATE ?auto_1929407 ) ( not ( = ?auto_1929406 ?auto_1929407 ) ) ( not ( = ?auto_1929405 ?auto_1929406 ) ) ( not ( = ?auto_1929405 ?auto_1929407 ) ) ( not ( = ?auto_1929413 ?auto_1929408 ) ) ( HOIST-AT ?auto_1929409 ?auto_1929413 ) ( not ( = ?auto_1929410 ?auto_1929409 ) ) ( AVAILABLE ?auto_1929409 ) ( SURFACE-AT ?auto_1929407 ?auto_1929413 ) ( ON ?auto_1929407 ?auto_1929411 ) ( CLEAR ?auto_1929407 ) ( not ( = ?auto_1929406 ?auto_1929411 ) ) ( not ( = ?auto_1929407 ?auto_1929411 ) ) ( not ( = ?auto_1929405 ?auto_1929411 ) ) ( TRUCK-AT ?auto_1929412 ?auto_1929408 ) ( SURFACE-AT ?auto_1929405 ?auto_1929408 ) ( CLEAR ?auto_1929405 ) ( IS-CRATE ?auto_1929406 ) ( AVAILABLE ?auto_1929410 ) ( IN ?auto_1929406 ?auto_1929412 ) ( ON ?auto_1929399 ?auto_1929398 ) ( ON ?auto_1929400 ?auto_1929399 ) ( ON ?auto_1929402 ?auto_1929400 ) ( ON ?auto_1929401 ?auto_1929402 ) ( ON ?auto_1929403 ?auto_1929401 ) ( ON ?auto_1929404 ?auto_1929403 ) ( ON ?auto_1929405 ?auto_1929404 ) ( not ( = ?auto_1929398 ?auto_1929399 ) ) ( not ( = ?auto_1929398 ?auto_1929400 ) ) ( not ( = ?auto_1929398 ?auto_1929402 ) ) ( not ( = ?auto_1929398 ?auto_1929401 ) ) ( not ( = ?auto_1929398 ?auto_1929403 ) ) ( not ( = ?auto_1929398 ?auto_1929404 ) ) ( not ( = ?auto_1929398 ?auto_1929405 ) ) ( not ( = ?auto_1929398 ?auto_1929406 ) ) ( not ( = ?auto_1929398 ?auto_1929407 ) ) ( not ( = ?auto_1929398 ?auto_1929411 ) ) ( not ( = ?auto_1929399 ?auto_1929400 ) ) ( not ( = ?auto_1929399 ?auto_1929402 ) ) ( not ( = ?auto_1929399 ?auto_1929401 ) ) ( not ( = ?auto_1929399 ?auto_1929403 ) ) ( not ( = ?auto_1929399 ?auto_1929404 ) ) ( not ( = ?auto_1929399 ?auto_1929405 ) ) ( not ( = ?auto_1929399 ?auto_1929406 ) ) ( not ( = ?auto_1929399 ?auto_1929407 ) ) ( not ( = ?auto_1929399 ?auto_1929411 ) ) ( not ( = ?auto_1929400 ?auto_1929402 ) ) ( not ( = ?auto_1929400 ?auto_1929401 ) ) ( not ( = ?auto_1929400 ?auto_1929403 ) ) ( not ( = ?auto_1929400 ?auto_1929404 ) ) ( not ( = ?auto_1929400 ?auto_1929405 ) ) ( not ( = ?auto_1929400 ?auto_1929406 ) ) ( not ( = ?auto_1929400 ?auto_1929407 ) ) ( not ( = ?auto_1929400 ?auto_1929411 ) ) ( not ( = ?auto_1929402 ?auto_1929401 ) ) ( not ( = ?auto_1929402 ?auto_1929403 ) ) ( not ( = ?auto_1929402 ?auto_1929404 ) ) ( not ( = ?auto_1929402 ?auto_1929405 ) ) ( not ( = ?auto_1929402 ?auto_1929406 ) ) ( not ( = ?auto_1929402 ?auto_1929407 ) ) ( not ( = ?auto_1929402 ?auto_1929411 ) ) ( not ( = ?auto_1929401 ?auto_1929403 ) ) ( not ( = ?auto_1929401 ?auto_1929404 ) ) ( not ( = ?auto_1929401 ?auto_1929405 ) ) ( not ( = ?auto_1929401 ?auto_1929406 ) ) ( not ( = ?auto_1929401 ?auto_1929407 ) ) ( not ( = ?auto_1929401 ?auto_1929411 ) ) ( not ( = ?auto_1929403 ?auto_1929404 ) ) ( not ( = ?auto_1929403 ?auto_1929405 ) ) ( not ( = ?auto_1929403 ?auto_1929406 ) ) ( not ( = ?auto_1929403 ?auto_1929407 ) ) ( not ( = ?auto_1929403 ?auto_1929411 ) ) ( not ( = ?auto_1929404 ?auto_1929405 ) ) ( not ( = ?auto_1929404 ?auto_1929406 ) ) ( not ( = ?auto_1929404 ?auto_1929407 ) ) ( not ( = ?auto_1929404 ?auto_1929411 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1929405 ?auto_1929406 ?auto_1929407 )
      ( MAKE-9CRATE-VERIFY ?auto_1929398 ?auto_1929399 ?auto_1929400 ?auto_1929402 ?auto_1929401 ?auto_1929403 ?auto_1929404 ?auto_1929405 ?auto_1929406 ?auto_1929407 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1932340 - SURFACE
      ?auto_1932341 - SURFACE
    )
    :vars
    (
      ?auto_1932347 - HOIST
      ?auto_1932343 - PLACE
      ?auto_1932344 - SURFACE
      ?auto_1932348 - PLACE
      ?auto_1932346 - HOIST
      ?auto_1932345 - SURFACE
      ?auto_1932342 - TRUCK
      ?auto_1932349 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1932347 ?auto_1932343 ) ( SURFACE-AT ?auto_1932340 ?auto_1932343 ) ( CLEAR ?auto_1932340 ) ( IS-CRATE ?auto_1932341 ) ( not ( = ?auto_1932340 ?auto_1932341 ) ) ( ON ?auto_1932340 ?auto_1932344 ) ( not ( = ?auto_1932344 ?auto_1932340 ) ) ( not ( = ?auto_1932344 ?auto_1932341 ) ) ( not ( = ?auto_1932348 ?auto_1932343 ) ) ( HOIST-AT ?auto_1932346 ?auto_1932348 ) ( not ( = ?auto_1932347 ?auto_1932346 ) ) ( AVAILABLE ?auto_1932346 ) ( SURFACE-AT ?auto_1932341 ?auto_1932348 ) ( ON ?auto_1932341 ?auto_1932345 ) ( CLEAR ?auto_1932341 ) ( not ( = ?auto_1932340 ?auto_1932345 ) ) ( not ( = ?auto_1932341 ?auto_1932345 ) ) ( not ( = ?auto_1932344 ?auto_1932345 ) ) ( TRUCK-AT ?auto_1932342 ?auto_1932343 ) ( LIFTING ?auto_1932347 ?auto_1932349 ) ( IS-CRATE ?auto_1932349 ) ( not ( = ?auto_1932340 ?auto_1932349 ) ) ( not ( = ?auto_1932341 ?auto_1932349 ) ) ( not ( = ?auto_1932344 ?auto_1932349 ) ) ( not ( = ?auto_1932345 ?auto_1932349 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1932347 ?auto_1932349 ?auto_1932342 ?auto_1932343 )
      ( MAKE-1CRATE ?auto_1932340 ?auto_1932341 )
      ( MAKE-1CRATE-VERIFY ?auto_1932340 ?auto_1932341 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1934950 - SURFACE
      ?auto_1934951 - SURFACE
      ?auto_1934952 - SURFACE
      ?auto_1934954 - SURFACE
      ?auto_1934953 - SURFACE
      ?auto_1934955 - SURFACE
      ?auto_1934956 - SURFACE
      ?auto_1934957 - SURFACE
      ?auto_1934958 - SURFACE
      ?auto_1934959 - SURFACE
      ?auto_1934960 - SURFACE
    )
    :vars
    (
      ?auto_1934961 - HOIST
      ?auto_1934962 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1934961 ?auto_1934962 ) ( SURFACE-AT ?auto_1934959 ?auto_1934962 ) ( CLEAR ?auto_1934959 ) ( LIFTING ?auto_1934961 ?auto_1934960 ) ( IS-CRATE ?auto_1934960 ) ( not ( = ?auto_1934959 ?auto_1934960 ) ) ( ON ?auto_1934951 ?auto_1934950 ) ( ON ?auto_1934952 ?auto_1934951 ) ( ON ?auto_1934954 ?auto_1934952 ) ( ON ?auto_1934953 ?auto_1934954 ) ( ON ?auto_1934955 ?auto_1934953 ) ( ON ?auto_1934956 ?auto_1934955 ) ( ON ?auto_1934957 ?auto_1934956 ) ( ON ?auto_1934958 ?auto_1934957 ) ( ON ?auto_1934959 ?auto_1934958 ) ( not ( = ?auto_1934950 ?auto_1934951 ) ) ( not ( = ?auto_1934950 ?auto_1934952 ) ) ( not ( = ?auto_1934950 ?auto_1934954 ) ) ( not ( = ?auto_1934950 ?auto_1934953 ) ) ( not ( = ?auto_1934950 ?auto_1934955 ) ) ( not ( = ?auto_1934950 ?auto_1934956 ) ) ( not ( = ?auto_1934950 ?auto_1934957 ) ) ( not ( = ?auto_1934950 ?auto_1934958 ) ) ( not ( = ?auto_1934950 ?auto_1934959 ) ) ( not ( = ?auto_1934950 ?auto_1934960 ) ) ( not ( = ?auto_1934951 ?auto_1934952 ) ) ( not ( = ?auto_1934951 ?auto_1934954 ) ) ( not ( = ?auto_1934951 ?auto_1934953 ) ) ( not ( = ?auto_1934951 ?auto_1934955 ) ) ( not ( = ?auto_1934951 ?auto_1934956 ) ) ( not ( = ?auto_1934951 ?auto_1934957 ) ) ( not ( = ?auto_1934951 ?auto_1934958 ) ) ( not ( = ?auto_1934951 ?auto_1934959 ) ) ( not ( = ?auto_1934951 ?auto_1934960 ) ) ( not ( = ?auto_1934952 ?auto_1934954 ) ) ( not ( = ?auto_1934952 ?auto_1934953 ) ) ( not ( = ?auto_1934952 ?auto_1934955 ) ) ( not ( = ?auto_1934952 ?auto_1934956 ) ) ( not ( = ?auto_1934952 ?auto_1934957 ) ) ( not ( = ?auto_1934952 ?auto_1934958 ) ) ( not ( = ?auto_1934952 ?auto_1934959 ) ) ( not ( = ?auto_1934952 ?auto_1934960 ) ) ( not ( = ?auto_1934954 ?auto_1934953 ) ) ( not ( = ?auto_1934954 ?auto_1934955 ) ) ( not ( = ?auto_1934954 ?auto_1934956 ) ) ( not ( = ?auto_1934954 ?auto_1934957 ) ) ( not ( = ?auto_1934954 ?auto_1934958 ) ) ( not ( = ?auto_1934954 ?auto_1934959 ) ) ( not ( = ?auto_1934954 ?auto_1934960 ) ) ( not ( = ?auto_1934953 ?auto_1934955 ) ) ( not ( = ?auto_1934953 ?auto_1934956 ) ) ( not ( = ?auto_1934953 ?auto_1934957 ) ) ( not ( = ?auto_1934953 ?auto_1934958 ) ) ( not ( = ?auto_1934953 ?auto_1934959 ) ) ( not ( = ?auto_1934953 ?auto_1934960 ) ) ( not ( = ?auto_1934955 ?auto_1934956 ) ) ( not ( = ?auto_1934955 ?auto_1934957 ) ) ( not ( = ?auto_1934955 ?auto_1934958 ) ) ( not ( = ?auto_1934955 ?auto_1934959 ) ) ( not ( = ?auto_1934955 ?auto_1934960 ) ) ( not ( = ?auto_1934956 ?auto_1934957 ) ) ( not ( = ?auto_1934956 ?auto_1934958 ) ) ( not ( = ?auto_1934956 ?auto_1934959 ) ) ( not ( = ?auto_1934956 ?auto_1934960 ) ) ( not ( = ?auto_1934957 ?auto_1934958 ) ) ( not ( = ?auto_1934957 ?auto_1934959 ) ) ( not ( = ?auto_1934957 ?auto_1934960 ) ) ( not ( = ?auto_1934958 ?auto_1934959 ) ) ( not ( = ?auto_1934958 ?auto_1934960 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1934959 ?auto_1934960 )
      ( MAKE-10CRATE-VERIFY ?auto_1934950 ?auto_1934951 ?auto_1934952 ?auto_1934954 ?auto_1934953 ?auto_1934955 ?auto_1934956 ?auto_1934957 ?auto_1934958 ?auto_1934959 ?auto_1934960 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1935044 - SURFACE
      ?auto_1935045 - SURFACE
      ?auto_1935046 - SURFACE
      ?auto_1935048 - SURFACE
      ?auto_1935047 - SURFACE
      ?auto_1935049 - SURFACE
      ?auto_1935050 - SURFACE
      ?auto_1935051 - SURFACE
      ?auto_1935052 - SURFACE
      ?auto_1935053 - SURFACE
      ?auto_1935054 - SURFACE
    )
    :vars
    (
      ?auto_1935055 - HOIST
      ?auto_1935056 - PLACE
      ?auto_1935057 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1935055 ?auto_1935056 ) ( SURFACE-AT ?auto_1935053 ?auto_1935056 ) ( CLEAR ?auto_1935053 ) ( IS-CRATE ?auto_1935054 ) ( not ( = ?auto_1935053 ?auto_1935054 ) ) ( TRUCK-AT ?auto_1935057 ?auto_1935056 ) ( AVAILABLE ?auto_1935055 ) ( IN ?auto_1935054 ?auto_1935057 ) ( ON ?auto_1935053 ?auto_1935052 ) ( not ( = ?auto_1935052 ?auto_1935053 ) ) ( not ( = ?auto_1935052 ?auto_1935054 ) ) ( ON ?auto_1935045 ?auto_1935044 ) ( ON ?auto_1935046 ?auto_1935045 ) ( ON ?auto_1935048 ?auto_1935046 ) ( ON ?auto_1935047 ?auto_1935048 ) ( ON ?auto_1935049 ?auto_1935047 ) ( ON ?auto_1935050 ?auto_1935049 ) ( ON ?auto_1935051 ?auto_1935050 ) ( ON ?auto_1935052 ?auto_1935051 ) ( not ( = ?auto_1935044 ?auto_1935045 ) ) ( not ( = ?auto_1935044 ?auto_1935046 ) ) ( not ( = ?auto_1935044 ?auto_1935048 ) ) ( not ( = ?auto_1935044 ?auto_1935047 ) ) ( not ( = ?auto_1935044 ?auto_1935049 ) ) ( not ( = ?auto_1935044 ?auto_1935050 ) ) ( not ( = ?auto_1935044 ?auto_1935051 ) ) ( not ( = ?auto_1935044 ?auto_1935052 ) ) ( not ( = ?auto_1935044 ?auto_1935053 ) ) ( not ( = ?auto_1935044 ?auto_1935054 ) ) ( not ( = ?auto_1935045 ?auto_1935046 ) ) ( not ( = ?auto_1935045 ?auto_1935048 ) ) ( not ( = ?auto_1935045 ?auto_1935047 ) ) ( not ( = ?auto_1935045 ?auto_1935049 ) ) ( not ( = ?auto_1935045 ?auto_1935050 ) ) ( not ( = ?auto_1935045 ?auto_1935051 ) ) ( not ( = ?auto_1935045 ?auto_1935052 ) ) ( not ( = ?auto_1935045 ?auto_1935053 ) ) ( not ( = ?auto_1935045 ?auto_1935054 ) ) ( not ( = ?auto_1935046 ?auto_1935048 ) ) ( not ( = ?auto_1935046 ?auto_1935047 ) ) ( not ( = ?auto_1935046 ?auto_1935049 ) ) ( not ( = ?auto_1935046 ?auto_1935050 ) ) ( not ( = ?auto_1935046 ?auto_1935051 ) ) ( not ( = ?auto_1935046 ?auto_1935052 ) ) ( not ( = ?auto_1935046 ?auto_1935053 ) ) ( not ( = ?auto_1935046 ?auto_1935054 ) ) ( not ( = ?auto_1935048 ?auto_1935047 ) ) ( not ( = ?auto_1935048 ?auto_1935049 ) ) ( not ( = ?auto_1935048 ?auto_1935050 ) ) ( not ( = ?auto_1935048 ?auto_1935051 ) ) ( not ( = ?auto_1935048 ?auto_1935052 ) ) ( not ( = ?auto_1935048 ?auto_1935053 ) ) ( not ( = ?auto_1935048 ?auto_1935054 ) ) ( not ( = ?auto_1935047 ?auto_1935049 ) ) ( not ( = ?auto_1935047 ?auto_1935050 ) ) ( not ( = ?auto_1935047 ?auto_1935051 ) ) ( not ( = ?auto_1935047 ?auto_1935052 ) ) ( not ( = ?auto_1935047 ?auto_1935053 ) ) ( not ( = ?auto_1935047 ?auto_1935054 ) ) ( not ( = ?auto_1935049 ?auto_1935050 ) ) ( not ( = ?auto_1935049 ?auto_1935051 ) ) ( not ( = ?auto_1935049 ?auto_1935052 ) ) ( not ( = ?auto_1935049 ?auto_1935053 ) ) ( not ( = ?auto_1935049 ?auto_1935054 ) ) ( not ( = ?auto_1935050 ?auto_1935051 ) ) ( not ( = ?auto_1935050 ?auto_1935052 ) ) ( not ( = ?auto_1935050 ?auto_1935053 ) ) ( not ( = ?auto_1935050 ?auto_1935054 ) ) ( not ( = ?auto_1935051 ?auto_1935052 ) ) ( not ( = ?auto_1935051 ?auto_1935053 ) ) ( not ( = ?auto_1935051 ?auto_1935054 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1935052 ?auto_1935053 ?auto_1935054 )
      ( MAKE-10CRATE-VERIFY ?auto_1935044 ?auto_1935045 ?auto_1935046 ?auto_1935048 ?auto_1935047 ?auto_1935049 ?auto_1935050 ?auto_1935051 ?auto_1935052 ?auto_1935053 ?auto_1935054 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1935149 - SURFACE
      ?auto_1935150 - SURFACE
      ?auto_1935151 - SURFACE
      ?auto_1935153 - SURFACE
      ?auto_1935152 - SURFACE
      ?auto_1935154 - SURFACE
      ?auto_1935155 - SURFACE
      ?auto_1935156 - SURFACE
      ?auto_1935157 - SURFACE
      ?auto_1935158 - SURFACE
      ?auto_1935159 - SURFACE
    )
    :vars
    (
      ?auto_1935160 - HOIST
      ?auto_1935163 - PLACE
      ?auto_1935162 - TRUCK
      ?auto_1935161 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1935160 ?auto_1935163 ) ( SURFACE-AT ?auto_1935158 ?auto_1935163 ) ( CLEAR ?auto_1935158 ) ( IS-CRATE ?auto_1935159 ) ( not ( = ?auto_1935158 ?auto_1935159 ) ) ( AVAILABLE ?auto_1935160 ) ( IN ?auto_1935159 ?auto_1935162 ) ( ON ?auto_1935158 ?auto_1935157 ) ( not ( = ?auto_1935157 ?auto_1935158 ) ) ( not ( = ?auto_1935157 ?auto_1935159 ) ) ( TRUCK-AT ?auto_1935162 ?auto_1935161 ) ( not ( = ?auto_1935161 ?auto_1935163 ) ) ( ON ?auto_1935150 ?auto_1935149 ) ( ON ?auto_1935151 ?auto_1935150 ) ( ON ?auto_1935153 ?auto_1935151 ) ( ON ?auto_1935152 ?auto_1935153 ) ( ON ?auto_1935154 ?auto_1935152 ) ( ON ?auto_1935155 ?auto_1935154 ) ( ON ?auto_1935156 ?auto_1935155 ) ( ON ?auto_1935157 ?auto_1935156 ) ( not ( = ?auto_1935149 ?auto_1935150 ) ) ( not ( = ?auto_1935149 ?auto_1935151 ) ) ( not ( = ?auto_1935149 ?auto_1935153 ) ) ( not ( = ?auto_1935149 ?auto_1935152 ) ) ( not ( = ?auto_1935149 ?auto_1935154 ) ) ( not ( = ?auto_1935149 ?auto_1935155 ) ) ( not ( = ?auto_1935149 ?auto_1935156 ) ) ( not ( = ?auto_1935149 ?auto_1935157 ) ) ( not ( = ?auto_1935149 ?auto_1935158 ) ) ( not ( = ?auto_1935149 ?auto_1935159 ) ) ( not ( = ?auto_1935150 ?auto_1935151 ) ) ( not ( = ?auto_1935150 ?auto_1935153 ) ) ( not ( = ?auto_1935150 ?auto_1935152 ) ) ( not ( = ?auto_1935150 ?auto_1935154 ) ) ( not ( = ?auto_1935150 ?auto_1935155 ) ) ( not ( = ?auto_1935150 ?auto_1935156 ) ) ( not ( = ?auto_1935150 ?auto_1935157 ) ) ( not ( = ?auto_1935150 ?auto_1935158 ) ) ( not ( = ?auto_1935150 ?auto_1935159 ) ) ( not ( = ?auto_1935151 ?auto_1935153 ) ) ( not ( = ?auto_1935151 ?auto_1935152 ) ) ( not ( = ?auto_1935151 ?auto_1935154 ) ) ( not ( = ?auto_1935151 ?auto_1935155 ) ) ( not ( = ?auto_1935151 ?auto_1935156 ) ) ( not ( = ?auto_1935151 ?auto_1935157 ) ) ( not ( = ?auto_1935151 ?auto_1935158 ) ) ( not ( = ?auto_1935151 ?auto_1935159 ) ) ( not ( = ?auto_1935153 ?auto_1935152 ) ) ( not ( = ?auto_1935153 ?auto_1935154 ) ) ( not ( = ?auto_1935153 ?auto_1935155 ) ) ( not ( = ?auto_1935153 ?auto_1935156 ) ) ( not ( = ?auto_1935153 ?auto_1935157 ) ) ( not ( = ?auto_1935153 ?auto_1935158 ) ) ( not ( = ?auto_1935153 ?auto_1935159 ) ) ( not ( = ?auto_1935152 ?auto_1935154 ) ) ( not ( = ?auto_1935152 ?auto_1935155 ) ) ( not ( = ?auto_1935152 ?auto_1935156 ) ) ( not ( = ?auto_1935152 ?auto_1935157 ) ) ( not ( = ?auto_1935152 ?auto_1935158 ) ) ( not ( = ?auto_1935152 ?auto_1935159 ) ) ( not ( = ?auto_1935154 ?auto_1935155 ) ) ( not ( = ?auto_1935154 ?auto_1935156 ) ) ( not ( = ?auto_1935154 ?auto_1935157 ) ) ( not ( = ?auto_1935154 ?auto_1935158 ) ) ( not ( = ?auto_1935154 ?auto_1935159 ) ) ( not ( = ?auto_1935155 ?auto_1935156 ) ) ( not ( = ?auto_1935155 ?auto_1935157 ) ) ( not ( = ?auto_1935155 ?auto_1935158 ) ) ( not ( = ?auto_1935155 ?auto_1935159 ) ) ( not ( = ?auto_1935156 ?auto_1935157 ) ) ( not ( = ?auto_1935156 ?auto_1935158 ) ) ( not ( = ?auto_1935156 ?auto_1935159 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1935157 ?auto_1935158 ?auto_1935159 )
      ( MAKE-10CRATE-VERIFY ?auto_1935149 ?auto_1935150 ?auto_1935151 ?auto_1935153 ?auto_1935152 ?auto_1935154 ?auto_1935155 ?auto_1935156 ?auto_1935157 ?auto_1935158 ?auto_1935159 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1935264 - SURFACE
      ?auto_1935265 - SURFACE
      ?auto_1935266 - SURFACE
      ?auto_1935268 - SURFACE
      ?auto_1935267 - SURFACE
      ?auto_1935269 - SURFACE
      ?auto_1935270 - SURFACE
      ?auto_1935271 - SURFACE
      ?auto_1935272 - SURFACE
      ?auto_1935273 - SURFACE
      ?auto_1935274 - SURFACE
    )
    :vars
    (
      ?auto_1935279 - HOIST
      ?auto_1935275 - PLACE
      ?auto_1935277 - TRUCK
      ?auto_1935278 - PLACE
      ?auto_1935276 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1935279 ?auto_1935275 ) ( SURFACE-AT ?auto_1935273 ?auto_1935275 ) ( CLEAR ?auto_1935273 ) ( IS-CRATE ?auto_1935274 ) ( not ( = ?auto_1935273 ?auto_1935274 ) ) ( AVAILABLE ?auto_1935279 ) ( ON ?auto_1935273 ?auto_1935272 ) ( not ( = ?auto_1935272 ?auto_1935273 ) ) ( not ( = ?auto_1935272 ?auto_1935274 ) ) ( TRUCK-AT ?auto_1935277 ?auto_1935278 ) ( not ( = ?auto_1935278 ?auto_1935275 ) ) ( HOIST-AT ?auto_1935276 ?auto_1935278 ) ( LIFTING ?auto_1935276 ?auto_1935274 ) ( not ( = ?auto_1935279 ?auto_1935276 ) ) ( ON ?auto_1935265 ?auto_1935264 ) ( ON ?auto_1935266 ?auto_1935265 ) ( ON ?auto_1935268 ?auto_1935266 ) ( ON ?auto_1935267 ?auto_1935268 ) ( ON ?auto_1935269 ?auto_1935267 ) ( ON ?auto_1935270 ?auto_1935269 ) ( ON ?auto_1935271 ?auto_1935270 ) ( ON ?auto_1935272 ?auto_1935271 ) ( not ( = ?auto_1935264 ?auto_1935265 ) ) ( not ( = ?auto_1935264 ?auto_1935266 ) ) ( not ( = ?auto_1935264 ?auto_1935268 ) ) ( not ( = ?auto_1935264 ?auto_1935267 ) ) ( not ( = ?auto_1935264 ?auto_1935269 ) ) ( not ( = ?auto_1935264 ?auto_1935270 ) ) ( not ( = ?auto_1935264 ?auto_1935271 ) ) ( not ( = ?auto_1935264 ?auto_1935272 ) ) ( not ( = ?auto_1935264 ?auto_1935273 ) ) ( not ( = ?auto_1935264 ?auto_1935274 ) ) ( not ( = ?auto_1935265 ?auto_1935266 ) ) ( not ( = ?auto_1935265 ?auto_1935268 ) ) ( not ( = ?auto_1935265 ?auto_1935267 ) ) ( not ( = ?auto_1935265 ?auto_1935269 ) ) ( not ( = ?auto_1935265 ?auto_1935270 ) ) ( not ( = ?auto_1935265 ?auto_1935271 ) ) ( not ( = ?auto_1935265 ?auto_1935272 ) ) ( not ( = ?auto_1935265 ?auto_1935273 ) ) ( not ( = ?auto_1935265 ?auto_1935274 ) ) ( not ( = ?auto_1935266 ?auto_1935268 ) ) ( not ( = ?auto_1935266 ?auto_1935267 ) ) ( not ( = ?auto_1935266 ?auto_1935269 ) ) ( not ( = ?auto_1935266 ?auto_1935270 ) ) ( not ( = ?auto_1935266 ?auto_1935271 ) ) ( not ( = ?auto_1935266 ?auto_1935272 ) ) ( not ( = ?auto_1935266 ?auto_1935273 ) ) ( not ( = ?auto_1935266 ?auto_1935274 ) ) ( not ( = ?auto_1935268 ?auto_1935267 ) ) ( not ( = ?auto_1935268 ?auto_1935269 ) ) ( not ( = ?auto_1935268 ?auto_1935270 ) ) ( not ( = ?auto_1935268 ?auto_1935271 ) ) ( not ( = ?auto_1935268 ?auto_1935272 ) ) ( not ( = ?auto_1935268 ?auto_1935273 ) ) ( not ( = ?auto_1935268 ?auto_1935274 ) ) ( not ( = ?auto_1935267 ?auto_1935269 ) ) ( not ( = ?auto_1935267 ?auto_1935270 ) ) ( not ( = ?auto_1935267 ?auto_1935271 ) ) ( not ( = ?auto_1935267 ?auto_1935272 ) ) ( not ( = ?auto_1935267 ?auto_1935273 ) ) ( not ( = ?auto_1935267 ?auto_1935274 ) ) ( not ( = ?auto_1935269 ?auto_1935270 ) ) ( not ( = ?auto_1935269 ?auto_1935271 ) ) ( not ( = ?auto_1935269 ?auto_1935272 ) ) ( not ( = ?auto_1935269 ?auto_1935273 ) ) ( not ( = ?auto_1935269 ?auto_1935274 ) ) ( not ( = ?auto_1935270 ?auto_1935271 ) ) ( not ( = ?auto_1935270 ?auto_1935272 ) ) ( not ( = ?auto_1935270 ?auto_1935273 ) ) ( not ( = ?auto_1935270 ?auto_1935274 ) ) ( not ( = ?auto_1935271 ?auto_1935272 ) ) ( not ( = ?auto_1935271 ?auto_1935273 ) ) ( not ( = ?auto_1935271 ?auto_1935274 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1935272 ?auto_1935273 ?auto_1935274 )
      ( MAKE-10CRATE-VERIFY ?auto_1935264 ?auto_1935265 ?auto_1935266 ?auto_1935268 ?auto_1935267 ?auto_1935269 ?auto_1935270 ?auto_1935271 ?auto_1935272 ?auto_1935273 ?auto_1935274 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1935389 - SURFACE
      ?auto_1935390 - SURFACE
      ?auto_1935391 - SURFACE
      ?auto_1935393 - SURFACE
      ?auto_1935392 - SURFACE
      ?auto_1935394 - SURFACE
      ?auto_1935395 - SURFACE
      ?auto_1935396 - SURFACE
      ?auto_1935397 - SURFACE
      ?auto_1935398 - SURFACE
      ?auto_1935399 - SURFACE
    )
    :vars
    (
      ?auto_1935404 - HOIST
      ?auto_1935405 - PLACE
      ?auto_1935402 - TRUCK
      ?auto_1935403 - PLACE
      ?auto_1935400 - HOIST
      ?auto_1935401 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1935404 ?auto_1935405 ) ( SURFACE-AT ?auto_1935398 ?auto_1935405 ) ( CLEAR ?auto_1935398 ) ( IS-CRATE ?auto_1935399 ) ( not ( = ?auto_1935398 ?auto_1935399 ) ) ( AVAILABLE ?auto_1935404 ) ( ON ?auto_1935398 ?auto_1935397 ) ( not ( = ?auto_1935397 ?auto_1935398 ) ) ( not ( = ?auto_1935397 ?auto_1935399 ) ) ( TRUCK-AT ?auto_1935402 ?auto_1935403 ) ( not ( = ?auto_1935403 ?auto_1935405 ) ) ( HOIST-AT ?auto_1935400 ?auto_1935403 ) ( not ( = ?auto_1935404 ?auto_1935400 ) ) ( AVAILABLE ?auto_1935400 ) ( SURFACE-AT ?auto_1935399 ?auto_1935403 ) ( ON ?auto_1935399 ?auto_1935401 ) ( CLEAR ?auto_1935399 ) ( not ( = ?auto_1935398 ?auto_1935401 ) ) ( not ( = ?auto_1935399 ?auto_1935401 ) ) ( not ( = ?auto_1935397 ?auto_1935401 ) ) ( ON ?auto_1935390 ?auto_1935389 ) ( ON ?auto_1935391 ?auto_1935390 ) ( ON ?auto_1935393 ?auto_1935391 ) ( ON ?auto_1935392 ?auto_1935393 ) ( ON ?auto_1935394 ?auto_1935392 ) ( ON ?auto_1935395 ?auto_1935394 ) ( ON ?auto_1935396 ?auto_1935395 ) ( ON ?auto_1935397 ?auto_1935396 ) ( not ( = ?auto_1935389 ?auto_1935390 ) ) ( not ( = ?auto_1935389 ?auto_1935391 ) ) ( not ( = ?auto_1935389 ?auto_1935393 ) ) ( not ( = ?auto_1935389 ?auto_1935392 ) ) ( not ( = ?auto_1935389 ?auto_1935394 ) ) ( not ( = ?auto_1935389 ?auto_1935395 ) ) ( not ( = ?auto_1935389 ?auto_1935396 ) ) ( not ( = ?auto_1935389 ?auto_1935397 ) ) ( not ( = ?auto_1935389 ?auto_1935398 ) ) ( not ( = ?auto_1935389 ?auto_1935399 ) ) ( not ( = ?auto_1935389 ?auto_1935401 ) ) ( not ( = ?auto_1935390 ?auto_1935391 ) ) ( not ( = ?auto_1935390 ?auto_1935393 ) ) ( not ( = ?auto_1935390 ?auto_1935392 ) ) ( not ( = ?auto_1935390 ?auto_1935394 ) ) ( not ( = ?auto_1935390 ?auto_1935395 ) ) ( not ( = ?auto_1935390 ?auto_1935396 ) ) ( not ( = ?auto_1935390 ?auto_1935397 ) ) ( not ( = ?auto_1935390 ?auto_1935398 ) ) ( not ( = ?auto_1935390 ?auto_1935399 ) ) ( not ( = ?auto_1935390 ?auto_1935401 ) ) ( not ( = ?auto_1935391 ?auto_1935393 ) ) ( not ( = ?auto_1935391 ?auto_1935392 ) ) ( not ( = ?auto_1935391 ?auto_1935394 ) ) ( not ( = ?auto_1935391 ?auto_1935395 ) ) ( not ( = ?auto_1935391 ?auto_1935396 ) ) ( not ( = ?auto_1935391 ?auto_1935397 ) ) ( not ( = ?auto_1935391 ?auto_1935398 ) ) ( not ( = ?auto_1935391 ?auto_1935399 ) ) ( not ( = ?auto_1935391 ?auto_1935401 ) ) ( not ( = ?auto_1935393 ?auto_1935392 ) ) ( not ( = ?auto_1935393 ?auto_1935394 ) ) ( not ( = ?auto_1935393 ?auto_1935395 ) ) ( not ( = ?auto_1935393 ?auto_1935396 ) ) ( not ( = ?auto_1935393 ?auto_1935397 ) ) ( not ( = ?auto_1935393 ?auto_1935398 ) ) ( not ( = ?auto_1935393 ?auto_1935399 ) ) ( not ( = ?auto_1935393 ?auto_1935401 ) ) ( not ( = ?auto_1935392 ?auto_1935394 ) ) ( not ( = ?auto_1935392 ?auto_1935395 ) ) ( not ( = ?auto_1935392 ?auto_1935396 ) ) ( not ( = ?auto_1935392 ?auto_1935397 ) ) ( not ( = ?auto_1935392 ?auto_1935398 ) ) ( not ( = ?auto_1935392 ?auto_1935399 ) ) ( not ( = ?auto_1935392 ?auto_1935401 ) ) ( not ( = ?auto_1935394 ?auto_1935395 ) ) ( not ( = ?auto_1935394 ?auto_1935396 ) ) ( not ( = ?auto_1935394 ?auto_1935397 ) ) ( not ( = ?auto_1935394 ?auto_1935398 ) ) ( not ( = ?auto_1935394 ?auto_1935399 ) ) ( not ( = ?auto_1935394 ?auto_1935401 ) ) ( not ( = ?auto_1935395 ?auto_1935396 ) ) ( not ( = ?auto_1935395 ?auto_1935397 ) ) ( not ( = ?auto_1935395 ?auto_1935398 ) ) ( not ( = ?auto_1935395 ?auto_1935399 ) ) ( not ( = ?auto_1935395 ?auto_1935401 ) ) ( not ( = ?auto_1935396 ?auto_1935397 ) ) ( not ( = ?auto_1935396 ?auto_1935398 ) ) ( not ( = ?auto_1935396 ?auto_1935399 ) ) ( not ( = ?auto_1935396 ?auto_1935401 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1935397 ?auto_1935398 ?auto_1935399 )
      ( MAKE-10CRATE-VERIFY ?auto_1935389 ?auto_1935390 ?auto_1935391 ?auto_1935393 ?auto_1935392 ?auto_1935394 ?auto_1935395 ?auto_1935396 ?auto_1935397 ?auto_1935398 ?auto_1935399 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1935515 - SURFACE
      ?auto_1935516 - SURFACE
      ?auto_1935517 - SURFACE
      ?auto_1935519 - SURFACE
      ?auto_1935518 - SURFACE
      ?auto_1935520 - SURFACE
      ?auto_1935521 - SURFACE
      ?auto_1935522 - SURFACE
      ?auto_1935523 - SURFACE
      ?auto_1935524 - SURFACE
      ?auto_1935525 - SURFACE
    )
    :vars
    (
      ?auto_1935529 - HOIST
      ?auto_1935530 - PLACE
      ?auto_1935527 - PLACE
      ?auto_1935531 - HOIST
      ?auto_1935526 - SURFACE
      ?auto_1935528 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1935529 ?auto_1935530 ) ( SURFACE-AT ?auto_1935524 ?auto_1935530 ) ( CLEAR ?auto_1935524 ) ( IS-CRATE ?auto_1935525 ) ( not ( = ?auto_1935524 ?auto_1935525 ) ) ( AVAILABLE ?auto_1935529 ) ( ON ?auto_1935524 ?auto_1935523 ) ( not ( = ?auto_1935523 ?auto_1935524 ) ) ( not ( = ?auto_1935523 ?auto_1935525 ) ) ( not ( = ?auto_1935527 ?auto_1935530 ) ) ( HOIST-AT ?auto_1935531 ?auto_1935527 ) ( not ( = ?auto_1935529 ?auto_1935531 ) ) ( AVAILABLE ?auto_1935531 ) ( SURFACE-AT ?auto_1935525 ?auto_1935527 ) ( ON ?auto_1935525 ?auto_1935526 ) ( CLEAR ?auto_1935525 ) ( not ( = ?auto_1935524 ?auto_1935526 ) ) ( not ( = ?auto_1935525 ?auto_1935526 ) ) ( not ( = ?auto_1935523 ?auto_1935526 ) ) ( TRUCK-AT ?auto_1935528 ?auto_1935530 ) ( ON ?auto_1935516 ?auto_1935515 ) ( ON ?auto_1935517 ?auto_1935516 ) ( ON ?auto_1935519 ?auto_1935517 ) ( ON ?auto_1935518 ?auto_1935519 ) ( ON ?auto_1935520 ?auto_1935518 ) ( ON ?auto_1935521 ?auto_1935520 ) ( ON ?auto_1935522 ?auto_1935521 ) ( ON ?auto_1935523 ?auto_1935522 ) ( not ( = ?auto_1935515 ?auto_1935516 ) ) ( not ( = ?auto_1935515 ?auto_1935517 ) ) ( not ( = ?auto_1935515 ?auto_1935519 ) ) ( not ( = ?auto_1935515 ?auto_1935518 ) ) ( not ( = ?auto_1935515 ?auto_1935520 ) ) ( not ( = ?auto_1935515 ?auto_1935521 ) ) ( not ( = ?auto_1935515 ?auto_1935522 ) ) ( not ( = ?auto_1935515 ?auto_1935523 ) ) ( not ( = ?auto_1935515 ?auto_1935524 ) ) ( not ( = ?auto_1935515 ?auto_1935525 ) ) ( not ( = ?auto_1935515 ?auto_1935526 ) ) ( not ( = ?auto_1935516 ?auto_1935517 ) ) ( not ( = ?auto_1935516 ?auto_1935519 ) ) ( not ( = ?auto_1935516 ?auto_1935518 ) ) ( not ( = ?auto_1935516 ?auto_1935520 ) ) ( not ( = ?auto_1935516 ?auto_1935521 ) ) ( not ( = ?auto_1935516 ?auto_1935522 ) ) ( not ( = ?auto_1935516 ?auto_1935523 ) ) ( not ( = ?auto_1935516 ?auto_1935524 ) ) ( not ( = ?auto_1935516 ?auto_1935525 ) ) ( not ( = ?auto_1935516 ?auto_1935526 ) ) ( not ( = ?auto_1935517 ?auto_1935519 ) ) ( not ( = ?auto_1935517 ?auto_1935518 ) ) ( not ( = ?auto_1935517 ?auto_1935520 ) ) ( not ( = ?auto_1935517 ?auto_1935521 ) ) ( not ( = ?auto_1935517 ?auto_1935522 ) ) ( not ( = ?auto_1935517 ?auto_1935523 ) ) ( not ( = ?auto_1935517 ?auto_1935524 ) ) ( not ( = ?auto_1935517 ?auto_1935525 ) ) ( not ( = ?auto_1935517 ?auto_1935526 ) ) ( not ( = ?auto_1935519 ?auto_1935518 ) ) ( not ( = ?auto_1935519 ?auto_1935520 ) ) ( not ( = ?auto_1935519 ?auto_1935521 ) ) ( not ( = ?auto_1935519 ?auto_1935522 ) ) ( not ( = ?auto_1935519 ?auto_1935523 ) ) ( not ( = ?auto_1935519 ?auto_1935524 ) ) ( not ( = ?auto_1935519 ?auto_1935525 ) ) ( not ( = ?auto_1935519 ?auto_1935526 ) ) ( not ( = ?auto_1935518 ?auto_1935520 ) ) ( not ( = ?auto_1935518 ?auto_1935521 ) ) ( not ( = ?auto_1935518 ?auto_1935522 ) ) ( not ( = ?auto_1935518 ?auto_1935523 ) ) ( not ( = ?auto_1935518 ?auto_1935524 ) ) ( not ( = ?auto_1935518 ?auto_1935525 ) ) ( not ( = ?auto_1935518 ?auto_1935526 ) ) ( not ( = ?auto_1935520 ?auto_1935521 ) ) ( not ( = ?auto_1935520 ?auto_1935522 ) ) ( not ( = ?auto_1935520 ?auto_1935523 ) ) ( not ( = ?auto_1935520 ?auto_1935524 ) ) ( not ( = ?auto_1935520 ?auto_1935525 ) ) ( not ( = ?auto_1935520 ?auto_1935526 ) ) ( not ( = ?auto_1935521 ?auto_1935522 ) ) ( not ( = ?auto_1935521 ?auto_1935523 ) ) ( not ( = ?auto_1935521 ?auto_1935524 ) ) ( not ( = ?auto_1935521 ?auto_1935525 ) ) ( not ( = ?auto_1935521 ?auto_1935526 ) ) ( not ( = ?auto_1935522 ?auto_1935523 ) ) ( not ( = ?auto_1935522 ?auto_1935524 ) ) ( not ( = ?auto_1935522 ?auto_1935525 ) ) ( not ( = ?auto_1935522 ?auto_1935526 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1935523 ?auto_1935524 ?auto_1935525 )
      ( MAKE-10CRATE-VERIFY ?auto_1935515 ?auto_1935516 ?auto_1935517 ?auto_1935519 ?auto_1935518 ?auto_1935520 ?auto_1935521 ?auto_1935522 ?auto_1935523 ?auto_1935524 ?auto_1935525 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1935641 - SURFACE
      ?auto_1935642 - SURFACE
      ?auto_1935643 - SURFACE
      ?auto_1935645 - SURFACE
      ?auto_1935644 - SURFACE
      ?auto_1935646 - SURFACE
      ?auto_1935647 - SURFACE
      ?auto_1935648 - SURFACE
      ?auto_1935649 - SURFACE
      ?auto_1935650 - SURFACE
      ?auto_1935651 - SURFACE
    )
    :vars
    (
      ?auto_1935654 - HOIST
      ?auto_1935655 - PLACE
      ?auto_1935656 - PLACE
      ?auto_1935653 - HOIST
      ?auto_1935652 - SURFACE
      ?auto_1935657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1935654 ?auto_1935655 ) ( IS-CRATE ?auto_1935651 ) ( not ( = ?auto_1935650 ?auto_1935651 ) ) ( not ( = ?auto_1935649 ?auto_1935650 ) ) ( not ( = ?auto_1935649 ?auto_1935651 ) ) ( not ( = ?auto_1935656 ?auto_1935655 ) ) ( HOIST-AT ?auto_1935653 ?auto_1935656 ) ( not ( = ?auto_1935654 ?auto_1935653 ) ) ( AVAILABLE ?auto_1935653 ) ( SURFACE-AT ?auto_1935651 ?auto_1935656 ) ( ON ?auto_1935651 ?auto_1935652 ) ( CLEAR ?auto_1935651 ) ( not ( = ?auto_1935650 ?auto_1935652 ) ) ( not ( = ?auto_1935651 ?auto_1935652 ) ) ( not ( = ?auto_1935649 ?auto_1935652 ) ) ( TRUCK-AT ?auto_1935657 ?auto_1935655 ) ( SURFACE-AT ?auto_1935649 ?auto_1935655 ) ( CLEAR ?auto_1935649 ) ( LIFTING ?auto_1935654 ?auto_1935650 ) ( IS-CRATE ?auto_1935650 ) ( ON ?auto_1935642 ?auto_1935641 ) ( ON ?auto_1935643 ?auto_1935642 ) ( ON ?auto_1935645 ?auto_1935643 ) ( ON ?auto_1935644 ?auto_1935645 ) ( ON ?auto_1935646 ?auto_1935644 ) ( ON ?auto_1935647 ?auto_1935646 ) ( ON ?auto_1935648 ?auto_1935647 ) ( ON ?auto_1935649 ?auto_1935648 ) ( not ( = ?auto_1935641 ?auto_1935642 ) ) ( not ( = ?auto_1935641 ?auto_1935643 ) ) ( not ( = ?auto_1935641 ?auto_1935645 ) ) ( not ( = ?auto_1935641 ?auto_1935644 ) ) ( not ( = ?auto_1935641 ?auto_1935646 ) ) ( not ( = ?auto_1935641 ?auto_1935647 ) ) ( not ( = ?auto_1935641 ?auto_1935648 ) ) ( not ( = ?auto_1935641 ?auto_1935649 ) ) ( not ( = ?auto_1935641 ?auto_1935650 ) ) ( not ( = ?auto_1935641 ?auto_1935651 ) ) ( not ( = ?auto_1935641 ?auto_1935652 ) ) ( not ( = ?auto_1935642 ?auto_1935643 ) ) ( not ( = ?auto_1935642 ?auto_1935645 ) ) ( not ( = ?auto_1935642 ?auto_1935644 ) ) ( not ( = ?auto_1935642 ?auto_1935646 ) ) ( not ( = ?auto_1935642 ?auto_1935647 ) ) ( not ( = ?auto_1935642 ?auto_1935648 ) ) ( not ( = ?auto_1935642 ?auto_1935649 ) ) ( not ( = ?auto_1935642 ?auto_1935650 ) ) ( not ( = ?auto_1935642 ?auto_1935651 ) ) ( not ( = ?auto_1935642 ?auto_1935652 ) ) ( not ( = ?auto_1935643 ?auto_1935645 ) ) ( not ( = ?auto_1935643 ?auto_1935644 ) ) ( not ( = ?auto_1935643 ?auto_1935646 ) ) ( not ( = ?auto_1935643 ?auto_1935647 ) ) ( not ( = ?auto_1935643 ?auto_1935648 ) ) ( not ( = ?auto_1935643 ?auto_1935649 ) ) ( not ( = ?auto_1935643 ?auto_1935650 ) ) ( not ( = ?auto_1935643 ?auto_1935651 ) ) ( not ( = ?auto_1935643 ?auto_1935652 ) ) ( not ( = ?auto_1935645 ?auto_1935644 ) ) ( not ( = ?auto_1935645 ?auto_1935646 ) ) ( not ( = ?auto_1935645 ?auto_1935647 ) ) ( not ( = ?auto_1935645 ?auto_1935648 ) ) ( not ( = ?auto_1935645 ?auto_1935649 ) ) ( not ( = ?auto_1935645 ?auto_1935650 ) ) ( not ( = ?auto_1935645 ?auto_1935651 ) ) ( not ( = ?auto_1935645 ?auto_1935652 ) ) ( not ( = ?auto_1935644 ?auto_1935646 ) ) ( not ( = ?auto_1935644 ?auto_1935647 ) ) ( not ( = ?auto_1935644 ?auto_1935648 ) ) ( not ( = ?auto_1935644 ?auto_1935649 ) ) ( not ( = ?auto_1935644 ?auto_1935650 ) ) ( not ( = ?auto_1935644 ?auto_1935651 ) ) ( not ( = ?auto_1935644 ?auto_1935652 ) ) ( not ( = ?auto_1935646 ?auto_1935647 ) ) ( not ( = ?auto_1935646 ?auto_1935648 ) ) ( not ( = ?auto_1935646 ?auto_1935649 ) ) ( not ( = ?auto_1935646 ?auto_1935650 ) ) ( not ( = ?auto_1935646 ?auto_1935651 ) ) ( not ( = ?auto_1935646 ?auto_1935652 ) ) ( not ( = ?auto_1935647 ?auto_1935648 ) ) ( not ( = ?auto_1935647 ?auto_1935649 ) ) ( not ( = ?auto_1935647 ?auto_1935650 ) ) ( not ( = ?auto_1935647 ?auto_1935651 ) ) ( not ( = ?auto_1935647 ?auto_1935652 ) ) ( not ( = ?auto_1935648 ?auto_1935649 ) ) ( not ( = ?auto_1935648 ?auto_1935650 ) ) ( not ( = ?auto_1935648 ?auto_1935651 ) ) ( not ( = ?auto_1935648 ?auto_1935652 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1935649 ?auto_1935650 ?auto_1935651 )
      ( MAKE-10CRATE-VERIFY ?auto_1935641 ?auto_1935642 ?auto_1935643 ?auto_1935645 ?auto_1935644 ?auto_1935646 ?auto_1935647 ?auto_1935648 ?auto_1935649 ?auto_1935650 ?auto_1935651 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1935767 - SURFACE
      ?auto_1935768 - SURFACE
      ?auto_1935769 - SURFACE
      ?auto_1935771 - SURFACE
      ?auto_1935770 - SURFACE
      ?auto_1935772 - SURFACE
      ?auto_1935773 - SURFACE
      ?auto_1935774 - SURFACE
      ?auto_1935775 - SURFACE
      ?auto_1935776 - SURFACE
      ?auto_1935777 - SURFACE
    )
    :vars
    (
      ?auto_1935779 - HOIST
      ?auto_1935783 - PLACE
      ?auto_1935778 - PLACE
      ?auto_1935782 - HOIST
      ?auto_1935781 - SURFACE
      ?auto_1935780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1935779 ?auto_1935783 ) ( IS-CRATE ?auto_1935777 ) ( not ( = ?auto_1935776 ?auto_1935777 ) ) ( not ( = ?auto_1935775 ?auto_1935776 ) ) ( not ( = ?auto_1935775 ?auto_1935777 ) ) ( not ( = ?auto_1935778 ?auto_1935783 ) ) ( HOIST-AT ?auto_1935782 ?auto_1935778 ) ( not ( = ?auto_1935779 ?auto_1935782 ) ) ( AVAILABLE ?auto_1935782 ) ( SURFACE-AT ?auto_1935777 ?auto_1935778 ) ( ON ?auto_1935777 ?auto_1935781 ) ( CLEAR ?auto_1935777 ) ( not ( = ?auto_1935776 ?auto_1935781 ) ) ( not ( = ?auto_1935777 ?auto_1935781 ) ) ( not ( = ?auto_1935775 ?auto_1935781 ) ) ( TRUCK-AT ?auto_1935780 ?auto_1935783 ) ( SURFACE-AT ?auto_1935775 ?auto_1935783 ) ( CLEAR ?auto_1935775 ) ( IS-CRATE ?auto_1935776 ) ( AVAILABLE ?auto_1935779 ) ( IN ?auto_1935776 ?auto_1935780 ) ( ON ?auto_1935768 ?auto_1935767 ) ( ON ?auto_1935769 ?auto_1935768 ) ( ON ?auto_1935771 ?auto_1935769 ) ( ON ?auto_1935770 ?auto_1935771 ) ( ON ?auto_1935772 ?auto_1935770 ) ( ON ?auto_1935773 ?auto_1935772 ) ( ON ?auto_1935774 ?auto_1935773 ) ( ON ?auto_1935775 ?auto_1935774 ) ( not ( = ?auto_1935767 ?auto_1935768 ) ) ( not ( = ?auto_1935767 ?auto_1935769 ) ) ( not ( = ?auto_1935767 ?auto_1935771 ) ) ( not ( = ?auto_1935767 ?auto_1935770 ) ) ( not ( = ?auto_1935767 ?auto_1935772 ) ) ( not ( = ?auto_1935767 ?auto_1935773 ) ) ( not ( = ?auto_1935767 ?auto_1935774 ) ) ( not ( = ?auto_1935767 ?auto_1935775 ) ) ( not ( = ?auto_1935767 ?auto_1935776 ) ) ( not ( = ?auto_1935767 ?auto_1935777 ) ) ( not ( = ?auto_1935767 ?auto_1935781 ) ) ( not ( = ?auto_1935768 ?auto_1935769 ) ) ( not ( = ?auto_1935768 ?auto_1935771 ) ) ( not ( = ?auto_1935768 ?auto_1935770 ) ) ( not ( = ?auto_1935768 ?auto_1935772 ) ) ( not ( = ?auto_1935768 ?auto_1935773 ) ) ( not ( = ?auto_1935768 ?auto_1935774 ) ) ( not ( = ?auto_1935768 ?auto_1935775 ) ) ( not ( = ?auto_1935768 ?auto_1935776 ) ) ( not ( = ?auto_1935768 ?auto_1935777 ) ) ( not ( = ?auto_1935768 ?auto_1935781 ) ) ( not ( = ?auto_1935769 ?auto_1935771 ) ) ( not ( = ?auto_1935769 ?auto_1935770 ) ) ( not ( = ?auto_1935769 ?auto_1935772 ) ) ( not ( = ?auto_1935769 ?auto_1935773 ) ) ( not ( = ?auto_1935769 ?auto_1935774 ) ) ( not ( = ?auto_1935769 ?auto_1935775 ) ) ( not ( = ?auto_1935769 ?auto_1935776 ) ) ( not ( = ?auto_1935769 ?auto_1935777 ) ) ( not ( = ?auto_1935769 ?auto_1935781 ) ) ( not ( = ?auto_1935771 ?auto_1935770 ) ) ( not ( = ?auto_1935771 ?auto_1935772 ) ) ( not ( = ?auto_1935771 ?auto_1935773 ) ) ( not ( = ?auto_1935771 ?auto_1935774 ) ) ( not ( = ?auto_1935771 ?auto_1935775 ) ) ( not ( = ?auto_1935771 ?auto_1935776 ) ) ( not ( = ?auto_1935771 ?auto_1935777 ) ) ( not ( = ?auto_1935771 ?auto_1935781 ) ) ( not ( = ?auto_1935770 ?auto_1935772 ) ) ( not ( = ?auto_1935770 ?auto_1935773 ) ) ( not ( = ?auto_1935770 ?auto_1935774 ) ) ( not ( = ?auto_1935770 ?auto_1935775 ) ) ( not ( = ?auto_1935770 ?auto_1935776 ) ) ( not ( = ?auto_1935770 ?auto_1935777 ) ) ( not ( = ?auto_1935770 ?auto_1935781 ) ) ( not ( = ?auto_1935772 ?auto_1935773 ) ) ( not ( = ?auto_1935772 ?auto_1935774 ) ) ( not ( = ?auto_1935772 ?auto_1935775 ) ) ( not ( = ?auto_1935772 ?auto_1935776 ) ) ( not ( = ?auto_1935772 ?auto_1935777 ) ) ( not ( = ?auto_1935772 ?auto_1935781 ) ) ( not ( = ?auto_1935773 ?auto_1935774 ) ) ( not ( = ?auto_1935773 ?auto_1935775 ) ) ( not ( = ?auto_1935773 ?auto_1935776 ) ) ( not ( = ?auto_1935773 ?auto_1935777 ) ) ( not ( = ?auto_1935773 ?auto_1935781 ) ) ( not ( = ?auto_1935774 ?auto_1935775 ) ) ( not ( = ?auto_1935774 ?auto_1935776 ) ) ( not ( = ?auto_1935774 ?auto_1935777 ) ) ( not ( = ?auto_1935774 ?auto_1935781 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1935775 ?auto_1935776 ?auto_1935777 )
      ( MAKE-10CRATE-VERIFY ?auto_1935767 ?auto_1935768 ?auto_1935769 ?auto_1935771 ?auto_1935770 ?auto_1935772 ?auto_1935773 ?auto_1935774 ?auto_1935775 ?auto_1935776 ?auto_1935777 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1943009 - SURFACE
      ?auto_1943010 - SURFACE
      ?auto_1943011 - SURFACE
      ?auto_1943013 - SURFACE
      ?auto_1943012 - SURFACE
      ?auto_1943014 - SURFACE
      ?auto_1943015 - SURFACE
      ?auto_1943016 - SURFACE
      ?auto_1943017 - SURFACE
      ?auto_1943018 - SURFACE
      ?auto_1943019 - SURFACE
      ?auto_1943020 - SURFACE
    )
    :vars
    (
      ?auto_1943021 - HOIST
      ?auto_1943022 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1943021 ?auto_1943022 ) ( SURFACE-AT ?auto_1943019 ?auto_1943022 ) ( CLEAR ?auto_1943019 ) ( LIFTING ?auto_1943021 ?auto_1943020 ) ( IS-CRATE ?auto_1943020 ) ( not ( = ?auto_1943019 ?auto_1943020 ) ) ( ON ?auto_1943010 ?auto_1943009 ) ( ON ?auto_1943011 ?auto_1943010 ) ( ON ?auto_1943013 ?auto_1943011 ) ( ON ?auto_1943012 ?auto_1943013 ) ( ON ?auto_1943014 ?auto_1943012 ) ( ON ?auto_1943015 ?auto_1943014 ) ( ON ?auto_1943016 ?auto_1943015 ) ( ON ?auto_1943017 ?auto_1943016 ) ( ON ?auto_1943018 ?auto_1943017 ) ( ON ?auto_1943019 ?auto_1943018 ) ( not ( = ?auto_1943009 ?auto_1943010 ) ) ( not ( = ?auto_1943009 ?auto_1943011 ) ) ( not ( = ?auto_1943009 ?auto_1943013 ) ) ( not ( = ?auto_1943009 ?auto_1943012 ) ) ( not ( = ?auto_1943009 ?auto_1943014 ) ) ( not ( = ?auto_1943009 ?auto_1943015 ) ) ( not ( = ?auto_1943009 ?auto_1943016 ) ) ( not ( = ?auto_1943009 ?auto_1943017 ) ) ( not ( = ?auto_1943009 ?auto_1943018 ) ) ( not ( = ?auto_1943009 ?auto_1943019 ) ) ( not ( = ?auto_1943009 ?auto_1943020 ) ) ( not ( = ?auto_1943010 ?auto_1943011 ) ) ( not ( = ?auto_1943010 ?auto_1943013 ) ) ( not ( = ?auto_1943010 ?auto_1943012 ) ) ( not ( = ?auto_1943010 ?auto_1943014 ) ) ( not ( = ?auto_1943010 ?auto_1943015 ) ) ( not ( = ?auto_1943010 ?auto_1943016 ) ) ( not ( = ?auto_1943010 ?auto_1943017 ) ) ( not ( = ?auto_1943010 ?auto_1943018 ) ) ( not ( = ?auto_1943010 ?auto_1943019 ) ) ( not ( = ?auto_1943010 ?auto_1943020 ) ) ( not ( = ?auto_1943011 ?auto_1943013 ) ) ( not ( = ?auto_1943011 ?auto_1943012 ) ) ( not ( = ?auto_1943011 ?auto_1943014 ) ) ( not ( = ?auto_1943011 ?auto_1943015 ) ) ( not ( = ?auto_1943011 ?auto_1943016 ) ) ( not ( = ?auto_1943011 ?auto_1943017 ) ) ( not ( = ?auto_1943011 ?auto_1943018 ) ) ( not ( = ?auto_1943011 ?auto_1943019 ) ) ( not ( = ?auto_1943011 ?auto_1943020 ) ) ( not ( = ?auto_1943013 ?auto_1943012 ) ) ( not ( = ?auto_1943013 ?auto_1943014 ) ) ( not ( = ?auto_1943013 ?auto_1943015 ) ) ( not ( = ?auto_1943013 ?auto_1943016 ) ) ( not ( = ?auto_1943013 ?auto_1943017 ) ) ( not ( = ?auto_1943013 ?auto_1943018 ) ) ( not ( = ?auto_1943013 ?auto_1943019 ) ) ( not ( = ?auto_1943013 ?auto_1943020 ) ) ( not ( = ?auto_1943012 ?auto_1943014 ) ) ( not ( = ?auto_1943012 ?auto_1943015 ) ) ( not ( = ?auto_1943012 ?auto_1943016 ) ) ( not ( = ?auto_1943012 ?auto_1943017 ) ) ( not ( = ?auto_1943012 ?auto_1943018 ) ) ( not ( = ?auto_1943012 ?auto_1943019 ) ) ( not ( = ?auto_1943012 ?auto_1943020 ) ) ( not ( = ?auto_1943014 ?auto_1943015 ) ) ( not ( = ?auto_1943014 ?auto_1943016 ) ) ( not ( = ?auto_1943014 ?auto_1943017 ) ) ( not ( = ?auto_1943014 ?auto_1943018 ) ) ( not ( = ?auto_1943014 ?auto_1943019 ) ) ( not ( = ?auto_1943014 ?auto_1943020 ) ) ( not ( = ?auto_1943015 ?auto_1943016 ) ) ( not ( = ?auto_1943015 ?auto_1943017 ) ) ( not ( = ?auto_1943015 ?auto_1943018 ) ) ( not ( = ?auto_1943015 ?auto_1943019 ) ) ( not ( = ?auto_1943015 ?auto_1943020 ) ) ( not ( = ?auto_1943016 ?auto_1943017 ) ) ( not ( = ?auto_1943016 ?auto_1943018 ) ) ( not ( = ?auto_1943016 ?auto_1943019 ) ) ( not ( = ?auto_1943016 ?auto_1943020 ) ) ( not ( = ?auto_1943017 ?auto_1943018 ) ) ( not ( = ?auto_1943017 ?auto_1943019 ) ) ( not ( = ?auto_1943017 ?auto_1943020 ) ) ( not ( = ?auto_1943018 ?auto_1943019 ) ) ( not ( = ?auto_1943018 ?auto_1943020 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1943019 ?auto_1943020 )
      ( MAKE-11CRATE-VERIFY ?auto_1943009 ?auto_1943010 ?auto_1943011 ?auto_1943013 ?auto_1943012 ?auto_1943014 ?auto_1943015 ?auto_1943016 ?auto_1943017 ?auto_1943018 ?auto_1943019 ?auto_1943020 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1943118 - SURFACE
      ?auto_1943119 - SURFACE
      ?auto_1943120 - SURFACE
      ?auto_1943122 - SURFACE
      ?auto_1943121 - SURFACE
      ?auto_1943123 - SURFACE
      ?auto_1943124 - SURFACE
      ?auto_1943125 - SURFACE
      ?auto_1943126 - SURFACE
      ?auto_1943127 - SURFACE
      ?auto_1943128 - SURFACE
      ?auto_1943129 - SURFACE
    )
    :vars
    (
      ?auto_1943131 - HOIST
      ?auto_1943130 - PLACE
      ?auto_1943132 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1943131 ?auto_1943130 ) ( SURFACE-AT ?auto_1943128 ?auto_1943130 ) ( CLEAR ?auto_1943128 ) ( IS-CRATE ?auto_1943129 ) ( not ( = ?auto_1943128 ?auto_1943129 ) ) ( TRUCK-AT ?auto_1943132 ?auto_1943130 ) ( AVAILABLE ?auto_1943131 ) ( IN ?auto_1943129 ?auto_1943132 ) ( ON ?auto_1943128 ?auto_1943127 ) ( not ( = ?auto_1943127 ?auto_1943128 ) ) ( not ( = ?auto_1943127 ?auto_1943129 ) ) ( ON ?auto_1943119 ?auto_1943118 ) ( ON ?auto_1943120 ?auto_1943119 ) ( ON ?auto_1943122 ?auto_1943120 ) ( ON ?auto_1943121 ?auto_1943122 ) ( ON ?auto_1943123 ?auto_1943121 ) ( ON ?auto_1943124 ?auto_1943123 ) ( ON ?auto_1943125 ?auto_1943124 ) ( ON ?auto_1943126 ?auto_1943125 ) ( ON ?auto_1943127 ?auto_1943126 ) ( not ( = ?auto_1943118 ?auto_1943119 ) ) ( not ( = ?auto_1943118 ?auto_1943120 ) ) ( not ( = ?auto_1943118 ?auto_1943122 ) ) ( not ( = ?auto_1943118 ?auto_1943121 ) ) ( not ( = ?auto_1943118 ?auto_1943123 ) ) ( not ( = ?auto_1943118 ?auto_1943124 ) ) ( not ( = ?auto_1943118 ?auto_1943125 ) ) ( not ( = ?auto_1943118 ?auto_1943126 ) ) ( not ( = ?auto_1943118 ?auto_1943127 ) ) ( not ( = ?auto_1943118 ?auto_1943128 ) ) ( not ( = ?auto_1943118 ?auto_1943129 ) ) ( not ( = ?auto_1943119 ?auto_1943120 ) ) ( not ( = ?auto_1943119 ?auto_1943122 ) ) ( not ( = ?auto_1943119 ?auto_1943121 ) ) ( not ( = ?auto_1943119 ?auto_1943123 ) ) ( not ( = ?auto_1943119 ?auto_1943124 ) ) ( not ( = ?auto_1943119 ?auto_1943125 ) ) ( not ( = ?auto_1943119 ?auto_1943126 ) ) ( not ( = ?auto_1943119 ?auto_1943127 ) ) ( not ( = ?auto_1943119 ?auto_1943128 ) ) ( not ( = ?auto_1943119 ?auto_1943129 ) ) ( not ( = ?auto_1943120 ?auto_1943122 ) ) ( not ( = ?auto_1943120 ?auto_1943121 ) ) ( not ( = ?auto_1943120 ?auto_1943123 ) ) ( not ( = ?auto_1943120 ?auto_1943124 ) ) ( not ( = ?auto_1943120 ?auto_1943125 ) ) ( not ( = ?auto_1943120 ?auto_1943126 ) ) ( not ( = ?auto_1943120 ?auto_1943127 ) ) ( not ( = ?auto_1943120 ?auto_1943128 ) ) ( not ( = ?auto_1943120 ?auto_1943129 ) ) ( not ( = ?auto_1943122 ?auto_1943121 ) ) ( not ( = ?auto_1943122 ?auto_1943123 ) ) ( not ( = ?auto_1943122 ?auto_1943124 ) ) ( not ( = ?auto_1943122 ?auto_1943125 ) ) ( not ( = ?auto_1943122 ?auto_1943126 ) ) ( not ( = ?auto_1943122 ?auto_1943127 ) ) ( not ( = ?auto_1943122 ?auto_1943128 ) ) ( not ( = ?auto_1943122 ?auto_1943129 ) ) ( not ( = ?auto_1943121 ?auto_1943123 ) ) ( not ( = ?auto_1943121 ?auto_1943124 ) ) ( not ( = ?auto_1943121 ?auto_1943125 ) ) ( not ( = ?auto_1943121 ?auto_1943126 ) ) ( not ( = ?auto_1943121 ?auto_1943127 ) ) ( not ( = ?auto_1943121 ?auto_1943128 ) ) ( not ( = ?auto_1943121 ?auto_1943129 ) ) ( not ( = ?auto_1943123 ?auto_1943124 ) ) ( not ( = ?auto_1943123 ?auto_1943125 ) ) ( not ( = ?auto_1943123 ?auto_1943126 ) ) ( not ( = ?auto_1943123 ?auto_1943127 ) ) ( not ( = ?auto_1943123 ?auto_1943128 ) ) ( not ( = ?auto_1943123 ?auto_1943129 ) ) ( not ( = ?auto_1943124 ?auto_1943125 ) ) ( not ( = ?auto_1943124 ?auto_1943126 ) ) ( not ( = ?auto_1943124 ?auto_1943127 ) ) ( not ( = ?auto_1943124 ?auto_1943128 ) ) ( not ( = ?auto_1943124 ?auto_1943129 ) ) ( not ( = ?auto_1943125 ?auto_1943126 ) ) ( not ( = ?auto_1943125 ?auto_1943127 ) ) ( not ( = ?auto_1943125 ?auto_1943128 ) ) ( not ( = ?auto_1943125 ?auto_1943129 ) ) ( not ( = ?auto_1943126 ?auto_1943127 ) ) ( not ( = ?auto_1943126 ?auto_1943128 ) ) ( not ( = ?auto_1943126 ?auto_1943129 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1943127 ?auto_1943128 ?auto_1943129 )
      ( MAKE-11CRATE-VERIFY ?auto_1943118 ?auto_1943119 ?auto_1943120 ?auto_1943122 ?auto_1943121 ?auto_1943123 ?auto_1943124 ?auto_1943125 ?auto_1943126 ?auto_1943127 ?auto_1943128 ?auto_1943129 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1943239 - SURFACE
      ?auto_1943240 - SURFACE
      ?auto_1943241 - SURFACE
      ?auto_1943243 - SURFACE
      ?auto_1943242 - SURFACE
      ?auto_1943244 - SURFACE
      ?auto_1943245 - SURFACE
      ?auto_1943246 - SURFACE
      ?auto_1943247 - SURFACE
      ?auto_1943248 - SURFACE
      ?auto_1943249 - SURFACE
      ?auto_1943250 - SURFACE
    )
    :vars
    (
      ?auto_1943253 - HOIST
      ?auto_1943252 - PLACE
      ?auto_1943254 - TRUCK
      ?auto_1943251 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1943253 ?auto_1943252 ) ( SURFACE-AT ?auto_1943249 ?auto_1943252 ) ( CLEAR ?auto_1943249 ) ( IS-CRATE ?auto_1943250 ) ( not ( = ?auto_1943249 ?auto_1943250 ) ) ( AVAILABLE ?auto_1943253 ) ( IN ?auto_1943250 ?auto_1943254 ) ( ON ?auto_1943249 ?auto_1943248 ) ( not ( = ?auto_1943248 ?auto_1943249 ) ) ( not ( = ?auto_1943248 ?auto_1943250 ) ) ( TRUCK-AT ?auto_1943254 ?auto_1943251 ) ( not ( = ?auto_1943251 ?auto_1943252 ) ) ( ON ?auto_1943240 ?auto_1943239 ) ( ON ?auto_1943241 ?auto_1943240 ) ( ON ?auto_1943243 ?auto_1943241 ) ( ON ?auto_1943242 ?auto_1943243 ) ( ON ?auto_1943244 ?auto_1943242 ) ( ON ?auto_1943245 ?auto_1943244 ) ( ON ?auto_1943246 ?auto_1943245 ) ( ON ?auto_1943247 ?auto_1943246 ) ( ON ?auto_1943248 ?auto_1943247 ) ( not ( = ?auto_1943239 ?auto_1943240 ) ) ( not ( = ?auto_1943239 ?auto_1943241 ) ) ( not ( = ?auto_1943239 ?auto_1943243 ) ) ( not ( = ?auto_1943239 ?auto_1943242 ) ) ( not ( = ?auto_1943239 ?auto_1943244 ) ) ( not ( = ?auto_1943239 ?auto_1943245 ) ) ( not ( = ?auto_1943239 ?auto_1943246 ) ) ( not ( = ?auto_1943239 ?auto_1943247 ) ) ( not ( = ?auto_1943239 ?auto_1943248 ) ) ( not ( = ?auto_1943239 ?auto_1943249 ) ) ( not ( = ?auto_1943239 ?auto_1943250 ) ) ( not ( = ?auto_1943240 ?auto_1943241 ) ) ( not ( = ?auto_1943240 ?auto_1943243 ) ) ( not ( = ?auto_1943240 ?auto_1943242 ) ) ( not ( = ?auto_1943240 ?auto_1943244 ) ) ( not ( = ?auto_1943240 ?auto_1943245 ) ) ( not ( = ?auto_1943240 ?auto_1943246 ) ) ( not ( = ?auto_1943240 ?auto_1943247 ) ) ( not ( = ?auto_1943240 ?auto_1943248 ) ) ( not ( = ?auto_1943240 ?auto_1943249 ) ) ( not ( = ?auto_1943240 ?auto_1943250 ) ) ( not ( = ?auto_1943241 ?auto_1943243 ) ) ( not ( = ?auto_1943241 ?auto_1943242 ) ) ( not ( = ?auto_1943241 ?auto_1943244 ) ) ( not ( = ?auto_1943241 ?auto_1943245 ) ) ( not ( = ?auto_1943241 ?auto_1943246 ) ) ( not ( = ?auto_1943241 ?auto_1943247 ) ) ( not ( = ?auto_1943241 ?auto_1943248 ) ) ( not ( = ?auto_1943241 ?auto_1943249 ) ) ( not ( = ?auto_1943241 ?auto_1943250 ) ) ( not ( = ?auto_1943243 ?auto_1943242 ) ) ( not ( = ?auto_1943243 ?auto_1943244 ) ) ( not ( = ?auto_1943243 ?auto_1943245 ) ) ( not ( = ?auto_1943243 ?auto_1943246 ) ) ( not ( = ?auto_1943243 ?auto_1943247 ) ) ( not ( = ?auto_1943243 ?auto_1943248 ) ) ( not ( = ?auto_1943243 ?auto_1943249 ) ) ( not ( = ?auto_1943243 ?auto_1943250 ) ) ( not ( = ?auto_1943242 ?auto_1943244 ) ) ( not ( = ?auto_1943242 ?auto_1943245 ) ) ( not ( = ?auto_1943242 ?auto_1943246 ) ) ( not ( = ?auto_1943242 ?auto_1943247 ) ) ( not ( = ?auto_1943242 ?auto_1943248 ) ) ( not ( = ?auto_1943242 ?auto_1943249 ) ) ( not ( = ?auto_1943242 ?auto_1943250 ) ) ( not ( = ?auto_1943244 ?auto_1943245 ) ) ( not ( = ?auto_1943244 ?auto_1943246 ) ) ( not ( = ?auto_1943244 ?auto_1943247 ) ) ( not ( = ?auto_1943244 ?auto_1943248 ) ) ( not ( = ?auto_1943244 ?auto_1943249 ) ) ( not ( = ?auto_1943244 ?auto_1943250 ) ) ( not ( = ?auto_1943245 ?auto_1943246 ) ) ( not ( = ?auto_1943245 ?auto_1943247 ) ) ( not ( = ?auto_1943245 ?auto_1943248 ) ) ( not ( = ?auto_1943245 ?auto_1943249 ) ) ( not ( = ?auto_1943245 ?auto_1943250 ) ) ( not ( = ?auto_1943246 ?auto_1943247 ) ) ( not ( = ?auto_1943246 ?auto_1943248 ) ) ( not ( = ?auto_1943246 ?auto_1943249 ) ) ( not ( = ?auto_1943246 ?auto_1943250 ) ) ( not ( = ?auto_1943247 ?auto_1943248 ) ) ( not ( = ?auto_1943247 ?auto_1943249 ) ) ( not ( = ?auto_1943247 ?auto_1943250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1943248 ?auto_1943249 ?auto_1943250 )
      ( MAKE-11CRATE-VERIFY ?auto_1943239 ?auto_1943240 ?auto_1943241 ?auto_1943243 ?auto_1943242 ?auto_1943244 ?auto_1943245 ?auto_1943246 ?auto_1943247 ?auto_1943248 ?auto_1943249 ?auto_1943250 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1943371 - SURFACE
      ?auto_1943372 - SURFACE
      ?auto_1943373 - SURFACE
      ?auto_1943375 - SURFACE
      ?auto_1943374 - SURFACE
      ?auto_1943376 - SURFACE
      ?auto_1943377 - SURFACE
      ?auto_1943378 - SURFACE
      ?auto_1943379 - SURFACE
      ?auto_1943380 - SURFACE
      ?auto_1943381 - SURFACE
      ?auto_1943382 - SURFACE
    )
    :vars
    (
      ?auto_1943386 - HOIST
      ?auto_1943387 - PLACE
      ?auto_1943384 - TRUCK
      ?auto_1943385 - PLACE
      ?auto_1943383 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1943386 ?auto_1943387 ) ( SURFACE-AT ?auto_1943381 ?auto_1943387 ) ( CLEAR ?auto_1943381 ) ( IS-CRATE ?auto_1943382 ) ( not ( = ?auto_1943381 ?auto_1943382 ) ) ( AVAILABLE ?auto_1943386 ) ( ON ?auto_1943381 ?auto_1943380 ) ( not ( = ?auto_1943380 ?auto_1943381 ) ) ( not ( = ?auto_1943380 ?auto_1943382 ) ) ( TRUCK-AT ?auto_1943384 ?auto_1943385 ) ( not ( = ?auto_1943385 ?auto_1943387 ) ) ( HOIST-AT ?auto_1943383 ?auto_1943385 ) ( LIFTING ?auto_1943383 ?auto_1943382 ) ( not ( = ?auto_1943386 ?auto_1943383 ) ) ( ON ?auto_1943372 ?auto_1943371 ) ( ON ?auto_1943373 ?auto_1943372 ) ( ON ?auto_1943375 ?auto_1943373 ) ( ON ?auto_1943374 ?auto_1943375 ) ( ON ?auto_1943376 ?auto_1943374 ) ( ON ?auto_1943377 ?auto_1943376 ) ( ON ?auto_1943378 ?auto_1943377 ) ( ON ?auto_1943379 ?auto_1943378 ) ( ON ?auto_1943380 ?auto_1943379 ) ( not ( = ?auto_1943371 ?auto_1943372 ) ) ( not ( = ?auto_1943371 ?auto_1943373 ) ) ( not ( = ?auto_1943371 ?auto_1943375 ) ) ( not ( = ?auto_1943371 ?auto_1943374 ) ) ( not ( = ?auto_1943371 ?auto_1943376 ) ) ( not ( = ?auto_1943371 ?auto_1943377 ) ) ( not ( = ?auto_1943371 ?auto_1943378 ) ) ( not ( = ?auto_1943371 ?auto_1943379 ) ) ( not ( = ?auto_1943371 ?auto_1943380 ) ) ( not ( = ?auto_1943371 ?auto_1943381 ) ) ( not ( = ?auto_1943371 ?auto_1943382 ) ) ( not ( = ?auto_1943372 ?auto_1943373 ) ) ( not ( = ?auto_1943372 ?auto_1943375 ) ) ( not ( = ?auto_1943372 ?auto_1943374 ) ) ( not ( = ?auto_1943372 ?auto_1943376 ) ) ( not ( = ?auto_1943372 ?auto_1943377 ) ) ( not ( = ?auto_1943372 ?auto_1943378 ) ) ( not ( = ?auto_1943372 ?auto_1943379 ) ) ( not ( = ?auto_1943372 ?auto_1943380 ) ) ( not ( = ?auto_1943372 ?auto_1943381 ) ) ( not ( = ?auto_1943372 ?auto_1943382 ) ) ( not ( = ?auto_1943373 ?auto_1943375 ) ) ( not ( = ?auto_1943373 ?auto_1943374 ) ) ( not ( = ?auto_1943373 ?auto_1943376 ) ) ( not ( = ?auto_1943373 ?auto_1943377 ) ) ( not ( = ?auto_1943373 ?auto_1943378 ) ) ( not ( = ?auto_1943373 ?auto_1943379 ) ) ( not ( = ?auto_1943373 ?auto_1943380 ) ) ( not ( = ?auto_1943373 ?auto_1943381 ) ) ( not ( = ?auto_1943373 ?auto_1943382 ) ) ( not ( = ?auto_1943375 ?auto_1943374 ) ) ( not ( = ?auto_1943375 ?auto_1943376 ) ) ( not ( = ?auto_1943375 ?auto_1943377 ) ) ( not ( = ?auto_1943375 ?auto_1943378 ) ) ( not ( = ?auto_1943375 ?auto_1943379 ) ) ( not ( = ?auto_1943375 ?auto_1943380 ) ) ( not ( = ?auto_1943375 ?auto_1943381 ) ) ( not ( = ?auto_1943375 ?auto_1943382 ) ) ( not ( = ?auto_1943374 ?auto_1943376 ) ) ( not ( = ?auto_1943374 ?auto_1943377 ) ) ( not ( = ?auto_1943374 ?auto_1943378 ) ) ( not ( = ?auto_1943374 ?auto_1943379 ) ) ( not ( = ?auto_1943374 ?auto_1943380 ) ) ( not ( = ?auto_1943374 ?auto_1943381 ) ) ( not ( = ?auto_1943374 ?auto_1943382 ) ) ( not ( = ?auto_1943376 ?auto_1943377 ) ) ( not ( = ?auto_1943376 ?auto_1943378 ) ) ( not ( = ?auto_1943376 ?auto_1943379 ) ) ( not ( = ?auto_1943376 ?auto_1943380 ) ) ( not ( = ?auto_1943376 ?auto_1943381 ) ) ( not ( = ?auto_1943376 ?auto_1943382 ) ) ( not ( = ?auto_1943377 ?auto_1943378 ) ) ( not ( = ?auto_1943377 ?auto_1943379 ) ) ( not ( = ?auto_1943377 ?auto_1943380 ) ) ( not ( = ?auto_1943377 ?auto_1943381 ) ) ( not ( = ?auto_1943377 ?auto_1943382 ) ) ( not ( = ?auto_1943378 ?auto_1943379 ) ) ( not ( = ?auto_1943378 ?auto_1943380 ) ) ( not ( = ?auto_1943378 ?auto_1943381 ) ) ( not ( = ?auto_1943378 ?auto_1943382 ) ) ( not ( = ?auto_1943379 ?auto_1943380 ) ) ( not ( = ?auto_1943379 ?auto_1943381 ) ) ( not ( = ?auto_1943379 ?auto_1943382 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1943380 ?auto_1943381 ?auto_1943382 )
      ( MAKE-11CRATE-VERIFY ?auto_1943371 ?auto_1943372 ?auto_1943373 ?auto_1943375 ?auto_1943374 ?auto_1943376 ?auto_1943377 ?auto_1943378 ?auto_1943379 ?auto_1943380 ?auto_1943381 ?auto_1943382 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1943514 - SURFACE
      ?auto_1943515 - SURFACE
      ?auto_1943516 - SURFACE
      ?auto_1943518 - SURFACE
      ?auto_1943517 - SURFACE
      ?auto_1943519 - SURFACE
      ?auto_1943520 - SURFACE
      ?auto_1943521 - SURFACE
      ?auto_1943522 - SURFACE
      ?auto_1943523 - SURFACE
      ?auto_1943524 - SURFACE
      ?auto_1943525 - SURFACE
    )
    :vars
    (
      ?auto_1943527 - HOIST
      ?auto_1943530 - PLACE
      ?auto_1943526 - TRUCK
      ?auto_1943529 - PLACE
      ?auto_1943531 - HOIST
      ?auto_1943528 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1943527 ?auto_1943530 ) ( SURFACE-AT ?auto_1943524 ?auto_1943530 ) ( CLEAR ?auto_1943524 ) ( IS-CRATE ?auto_1943525 ) ( not ( = ?auto_1943524 ?auto_1943525 ) ) ( AVAILABLE ?auto_1943527 ) ( ON ?auto_1943524 ?auto_1943523 ) ( not ( = ?auto_1943523 ?auto_1943524 ) ) ( not ( = ?auto_1943523 ?auto_1943525 ) ) ( TRUCK-AT ?auto_1943526 ?auto_1943529 ) ( not ( = ?auto_1943529 ?auto_1943530 ) ) ( HOIST-AT ?auto_1943531 ?auto_1943529 ) ( not ( = ?auto_1943527 ?auto_1943531 ) ) ( AVAILABLE ?auto_1943531 ) ( SURFACE-AT ?auto_1943525 ?auto_1943529 ) ( ON ?auto_1943525 ?auto_1943528 ) ( CLEAR ?auto_1943525 ) ( not ( = ?auto_1943524 ?auto_1943528 ) ) ( not ( = ?auto_1943525 ?auto_1943528 ) ) ( not ( = ?auto_1943523 ?auto_1943528 ) ) ( ON ?auto_1943515 ?auto_1943514 ) ( ON ?auto_1943516 ?auto_1943515 ) ( ON ?auto_1943518 ?auto_1943516 ) ( ON ?auto_1943517 ?auto_1943518 ) ( ON ?auto_1943519 ?auto_1943517 ) ( ON ?auto_1943520 ?auto_1943519 ) ( ON ?auto_1943521 ?auto_1943520 ) ( ON ?auto_1943522 ?auto_1943521 ) ( ON ?auto_1943523 ?auto_1943522 ) ( not ( = ?auto_1943514 ?auto_1943515 ) ) ( not ( = ?auto_1943514 ?auto_1943516 ) ) ( not ( = ?auto_1943514 ?auto_1943518 ) ) ( not ( = ?auto_1943514 ?auto_1943517 ) ) ( not ( = ?auto_1943514 ?auto_1943519 ) ) ( not ( = ?auto_1943514 ?auto_1943520 ) ) ( not ( = ?auto_1943514 ?auto_1943521 ) ) ( not ( = ?auto_1943514 ?auto_1943522 ) ) ( not ( = ?auto_1943514 ?auto_1943523 ) ) ( not ( = ?auto_1943514 ?auto_1943524 ) ) ( not ( = ?auto_1943514 ?auto_1943525 ) ) ( not ( = ?auto_1943514 ?auto_1943528 ) ) ( not ( = ?auto_1943515 ?auto_1943516 ) ) ( not ( = ?auto_1943515 ?auto_1943518 ) ) ( not ( = ?auto_1943515 ?auto_1943517 ) ) ( not ( = ?auto_1943515 ?auto_1943519 ) ) ( not ( = ?auto_1943515 ?auto_1943520 ) ) ( not ( = ?auto_1943515 ?auto_1943521 ) ) ( not ( = ?auto_1943515 ?auto_1943522 ) ) ( not ( = ?auto_1943515 ?auto_1943523 ) ) ( not ( = ?auto_1943515 ?auto_1943524 ) ) ( not ( = ?auto_1943515 ?auto_1943525 ) ) ( not ( = ?auto_1943515 ?auto_1943528 ) ) ( not ( = ?auto_1943516 ?auto_1943518 ) ) ( not ( = ?auto_1943516 ?auto_1943517 ) ) ( not ( = ?auto_1943516 ?auto_1943519 ) ) ( not ( = ?auto_1943516 ?auto_1943520 ) ) ( not ( = ?auto_1943516 ?auto_1943521 ) ) ( not ( = ?auto_1943516 ?auto_1943522 ) ) ( not ( = ?auto_1943516 ?auto_1943523 ) ) ( not ( = ?auto_1943516 ?auto_1943524 ) ) ( not ( = ?auto_1943516 ?auto_1943525 ) ) ( not ( = ?auto_1943516 ?auto_1943528 ) ) ( not ( = ?auto_1943518 ?auto_1943517 ) ) ( not ( = ?auto_1943518 ?auto_1943519 ) ) ( not ( = ?auto_1943518 ?auto_1943520 ) ) ( not ( = ?auto_1943518 ?auto_1943521 ) ) ( not ( = ?auto_1943518 ?auto_1943522 ) ) ( not ( = ?auto_1943518 ?auto_1943523 ) ) ( not ( = ?auto_1943518 ?auto_1943524 ) ) ( not ( = ?auto_1943518 ?auto_1943525 ) ) ( not ( = ?auto_1943518 ?auto_1943528 ) ) ( not ( = ?auto_1943517 ?auto_1943519 ) ) ( not ( = ?auto_1943517 ?auto_1943520 ) ) ( not ( = ?auto_1943517 ?auto_1943521 ) ) ( not ( = ?auto_1943517 ?auto_1943522 ) ) ( not ( = ?auto_1943517 ?auto_1943523 ) ) ( not ( = ?auto_1943517 ?auto_1943524 ) ) ( not ( = ?auto_1943517 ?auto_1943525 ) ) ( not ( = ?auto_1943517 ?auto_1943528 ) ) ( not ( = ?auto_1943519 ?auto_1943520 ) ) ( not ( = ?auto_1943519 ?auto_1943521 ) ) ( not ( = ?auto_1943519 ?auto_1943522 ) ) ( not ( = ?auto_1943519 ?auto_1943523 ) ) ( not ( = ?auto_1943519 ?auto_1943524 ) ) ( not ( = ?auto_1943519 ?auto_1943525 ) ) ( not ( = ?auto_1943519 ?auto_1943528 ) ) ( not ( = ?auto_1943520 ?auto_1943521 ) ) ( not ( = ?auto_1943520 ?auto_1943522 ) ) ( not ( = ?auto_1943520 ?auto_1943523 ) ) ( not ( = ?auto_1943520 ?auto_1943524 ) ) ( not ( = ?auto_1943520 ?auto_1943525 ) ) ( not ( = ?auto_1943520 ?auto_1943528 ) ) ( not ( = ?auto_1943521 ?auto_1943522 ) ) ( not ( = ?auto_1943521 ?auto_1943523 ) ) ( not ( = ?auto_1943521 ?auto_1943524 ) ) ( not ( = ?auto_1943521 ?auto_1943525 ) ) ( not ( = ?auto_1943521 ?auto_1943528 ) ) ( not ( = ?auto_1943522 ?auto_1943523 ) ) ( not ( = ?auto_1943522 ?auto_1943524 ) ) ( not ( = ?auto_1943522 ?auto_1943525 ) ) ( not ( = ?auto_1943522 ?auto_1943528 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1943523 ?auto_1943524 ?auto_1943525 )
      ( MAKE-11CRATE-VERIFY ?auto_1943514 ?auto_1943515 ?auto_1943516 ?auto_1943518 ?auto_1943517 ?auto_1943519 ?auto_1943520 ?auto_1943521 ?auto_1943522 ?auto_1943523 ?auto_1943524 ?auto_1943525 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1943658 - SURFACE
      ?auto_1943659 - SURFACE
      ?auto_1943660 - SURFACE
      ?auto_1943662 - SURFACE
      ?auto_1943661 - SURFACE
      ?auto_1943663 - SURFACE
      ?auto_1943664 - SURFACE
      ?auto_1943665 - SURFACE
      ?auto_1943666 - SURFACE
      ?auto_1943667 - SURFACE
      ?auto_1943668 - SURFACE
      ?auto_1943669 - SURFACE
    )
    :vars
    (
      ?auto_1943674 - HOIST
      ?auto_1943675 - PLACE
      ?auto_1943670 - PLACE
      ?auto_1943672 - HOIST
      ?auto_1943671 - SURFACE
      ?auto_1943673 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1943674 ?auto_1943675 ) ( SURFACE-AT ?auto_1943668 ?auto_1943675 ) ( CLEAR ?auto_1943668 ) ( IS-CRATE ?auto_1943669 ) ( not ( = ?auto_1943668 ?auto_1943669 ) ) ( AVAILABLE ?auto_1943674 ) ( ON ?auto_1943668 ?auto_1943667 ) ( not ( = ?auto_1943667 ?auto_1943668 ) ) ( not ( = ?auto_1943667 ?auto_1943669 ) ) ( not ( = ?auto_1943670 ?auto_1943675 ) ) ( HOIST-AT ?auto_1943672 ?auto_1943670 ) ( not ( = ?auto_1943674 ?auto_1943672 ) ) ( AVAILABLE ?auto_1943672 ) ( SURFACE-AT ?auto_1943669 ?auto_1943670 ) ( ON ?auto_1943669 ?auto_1943671 ) ( CLEAR ?auto_1943669 ) ( not ( = ?auto_1943668 ?auto_1943671 ) ) ( not ( = ?auto_1943669 ?auto_1943671 ) ) ( not ( = ?auto_1943667 ?auto_1943671 ) ) ( TRUCK-AT ?auto_1943673 ?auto_1943675 ) ( ON ?auto_1943659 ?auto_1943658 ) ( ON ?auto_1943660 ?auto_1943659 ) ( ON ?auto_1943662 ?auto_1943660 ) ( ON ?auto_1943661 ?auto_1943662 ) ( ON ?auto_1943663 ?auto_1943661 ) ( ON ?auto_1943664 ?auto_1943663 ) ( ON ?auto_1943665 ?auto_1943664 ) ( ON ?auto_1943666 ?auto_1943665 ) ( ON ?auto_1943667 ?auto_1943666 ) ( not ( = ?auto_1943658 ?auto_1943659 ) ) ( not ( = ?auto_1943658 ?auto_1943660 ) ) ( not ( = ?auto_1943658 ?auto_1943662 ) ) ( not ( = ?auto_1943658 ?auto_1943661 ) ) ( not ( = ?auto_1943658 ?auto_1943663 ) ) ( not ( = ?auto_1943658 ?auto_1943664 ) ) ( not ( = ?auto_1943658 ?auto_1943665 ) ) ( not ( = ?auto_1943658 ?auto_1943666 ) ) ( not ( = ?auto_1943658 ?auto_1943667 ) ) ( not ( = ?auto_1943658 ?auto_1943668 ) ) ( not ( = ?auto_1943658 ?auto_1943669 ) ) ( not ( = ?auto_1943658 ?auto_1943671 ) ) ( not ( = ?auto_1943659 ?auto_1943660 ) ) ( not ( = ?auto_1943659 ?auto_1943662 ) ) ( not ( = ?auto_1943659 ?auto_1943661 ) ) ( not ( = ?auto_1943659 ?auto_1943663 ) ) ( not ( = ?auto_1943659 ?auto_1943664 ) ) ( not ( = ?auto_1943659 ?auto_1943665 ) ) ( not ( = ?auto_1943659 ?auto_1943666 ) ) ( not ( = ?auto_1943659 ?auto_1943667 ) ) ( not ( = ?auto_1943659 ?auto_1943668 ) ) ( not ( = ?auto_1943659 ?auto_1943669 ) ) ( not ( = ?auto_1943659 ?auto_1943671 ) ) ( not ( = ?auto_1943660 ?auto_1943662 ) ) ( not ( = ?auto_1943660 ?auto_1943661 ) ) ( not ( = ?auto_1943660 ?auto_1943663 ) ) ( not ( = ?auto_1943660 ?auto_1943664 ) ) ( not ( = ?auto_1943660 ?auto_1943665 ) ) ( not ( = ?auto_1943660 ?auto_1943666 ) ) ( not ( = ?auto_1943660 ?auto_1943667 ) ) ( not ( = ?auto_1943660 ?auto_1943668 ) ) ( not ( = ?auto_1943660 ?auto_1943669 ) ) ( not ( = ?auto_1943660 ?auto_1943671 ) ) ( not ( = ?auto_1943662 ?auto_1943661 ) ) ( not ( = ?auto_1943662 ?auto_1943663 ) ) ( not ( = ?auto_1943662 ?auto_1943664 ) ) ( not ( = ?auto_1943662 ?auto_1943665 ) ) ( not ( = ?auto_1943662 ?auto_1943666 ) ) ( not ( = ?auto_1943662 ?auto_1943667 ) ) ( not ( = ?auto_1943662 ?auto_1943668 ) ) ( not ( = ?auto_1943662 ?auto_1943669 ) ) ( not ( = ?auto_1943662 ?auto_1943671 ) ) ( not ( = ?auto_1943661 ?auto_1943663 ) ) ( not ( = ?auto_1943661 ?auto_1943664 ) ) ( not ( = ?auto_1943661 ?auto_1943665 ) ) ( not ( = ?auto_1943661 ?auto_1943666 ) ) ( not ( = ?auto_1943661 ?auto_1943667 ) ) ( not ( = ?auto_1943661 ?auto_1943668 ) ) ( not ( = ?auto_1943661 ?auto_1943669 ) ) ( not ( = ?auto_1943661 ?auto_1943671 ) ) ( not ( = ?auto_1943663 ?auto_1943664 ) ) ( not ( = ?auto_1943663 ?auto_1943665 ) ) ( not ( = ?auto_1943663 ?auto_1943666 ) ) ( not ( = ?auto_1943663 ?auto_1943667 ) ) ( not ( = ?auto_1943663 ?auto_1943668 ) ) ( not ( = ?auto_1943663 ?auto_1943669 ) ) ( not ( = ?auto_1943663 ?auto_1943671 ) ) ( not ( = ?auto_1943664 ?auto_1943665 ) ) ( not ( = ?auto_1943664 ?auto_1943666 ) ) ( not ( = ?auto_1943664 ?auto_1943667 ) ) ( not ( = ?auto_1943664 ?auto_1943668 ) ) ( not ( = ?auto_1943664 ?auto_1943669 ) ) ( not ( = ?auto_1943664 ?auto_1943671 ) ) ( not ( = ?auto_1943665 ?auto_1943666 ) ) ( not ( = ?auto_1943665 ?auto_1943667 ) ) ( not ( = ?auto_1943665 ?auto_1943668 ) ) ( not ( = ?auto_1943665 ?auto_1943669 ) ) ( not ( = ?auto_1943665 ?auto_1943671 ) ) ( not ( = ?auto_1943666 ?auto_1943667 ) ) ( not ( = ?auto_1943666 ?auto_1943668 ) ) ( not ( = ?auto_1943666 ?auto_1943669 ) ) ( not ( = ?auto_1943666 ?auto_1943671 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1943667 ?auto_1943668 ?auto_1943669 )
      ( MAKE-11CRATE-VERIFY ?auto_1943658 ?auto_1943659 ?auto_1943660 ?auto_1943662 ?auto_1943661 ?auto_1943663 ?auto_1943664 ?auto_1943665 ?auto_1943666 ?auto_1943667 ?auto_1943668 ?auto_1943669 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1943802 - SURFACE
      ?auto_1943803 - SURFACE
      ?auto_1943804 - SURFACE
      ?auto_1943806 - SURFACE
      ?auto_1943805 - SURFACE
      ?auto_1943807 - SURFACE
      ?auto_1943808 - SURFACE
      ?auto_1943809 - SURFACE
      ?auto_1943810 - SURFACE
      ?auto_1943811 - SURFACE
      ?auto_1943812 - SURFACE
      ?auto_1943813 - SURFACE
    )
    :vars
    (
      ?auto_1943816 - HOIST
      ?auto_1943818 - PLACE
      ?auto_1943817 - PLACE
      ?auto_1943819 - HOIST
      ?auto_1943815 - SURFACE
      ?auto_1943814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1943816 ?auto_1943818 ) ( IS-CRATE ?auto_1943813 ) ( not ( = ?auto_1943812 ?auto_1943813 ) ) ( not ( = ?auto_1943811 ?auto_1943812 ) ) ( not ( = ?auto_1943811 ?auto_1943813 ) ) ( not ( = ?auto_1943817 ?auto_1943818 ) ) ( HOIST-AT ?auto_1943819 ?auto_1943817 ) ( not ( = ?auto_1943816 ?auto_1943819 ) ) ( AVAILABLE ?auto_1943819 ) ( SURFACE-AT ?auto_1943813 ?auto_1943817 ) ( ON ?auto_1943813 ?auto_1943815 ) ( CLEAR ?auto_1943813 ) ( not ( = ?auto_1943812 ?auto_1943815 ) ) ( not ( = ?auto_1943813 ?auto_1943815 ) ) ( not ( = ?auto_1943811 ?auto_1943815 ) ) ( TRUCK-AT ?auto_1943814 ?auto_1943818 ) ( SURFACE-AT ?auto_1943811 ?auto_1943818 ) ( CLEAR ?auto_1943811 ) ( LIFTING ?auto_1943816 ?auto_1943812 ) ( IS-CRATE ?auto_1943812 ) ( ON ?auto_1943803 ?auto_1943802 ) ( ON ?auto_1943804 ?auto_1943803 ) ( ON ?auto_1943806 ?auto_1943804 ) ( ON ?auto_1943805 ?auto_1943806 ) ( ON ?auto_1943807 ?auto_1943805 ) ( ON ?auto_1943808 ?auto_1943807 ) ( ON ?auto_1943809 ?auto_1943808 ) ( ON ?auto_1943810 ?auto_1943809 ) ( ON ?auto_1943811 ?auto_1943810 ) ( not ( = ?auto_1943802 ?auto_1943803 ) ) ( not ( = ?auto_1943802 ?auto_1943804 ) ) ( not ( = ?auto_1943802 ?auto_1943806 ) ) ( not ( = ?auto_1943802 ?auto_1943805 ) ) ( not ( = ?auto_1943802 ?auto_1943807 ) ) ( not ( = ?auto_1943802 ?auto_1943808 ) ) ( not ( = ?auto_1943802 ?auto_1943809 ) ) ( not ( = ?auto_1943802 ?auto_1943810 ) ) ( not ( = ?auto_1943802 ?auto_1943811 ) ) ( not ( = ?auto_1943802 ?auto_1943812 ) ) ( not ( = ?auto_1943802 ?auto_1943813 ) ) ( not ( = ?auto_1943802 ?auto_1943815 ) ) ( not ( = ?auto_1943803 ?auto_1943804 ) ) ( not ( = ?auto_1943803 ?auto_1943806 ) ) ( not ( = ?auto_1943803 ?auto_1943805 ) ) ( not ( = ?auto_1943803 ?auto_1943807 ) ) ( not ( = ?auto_1943803 ?auto_1943808 ) ) ( not ( = ?auto_1943803 ?auto_1943809 ) ) ( not ( = ?auto_1943803 ?auto_1943810 ) ) ( not ( = ?auto_1943803 ?auto_1943811 ) ) ( not ( = ?auto_1943803 ?auto_1943812 ) ) ( not ( = ?auto_1943803 ?auto_1943813 ) ) ( not ( = ?auto_1943803 ?auto_1943815 ) ) ( not ( = ?auto_1943804 ?auto_1943806 ) ) ( not ( = ?auto_1943804 ?auto_1943805 ) ) ( not ( = ?auto_1943804 ?auto_1943807 ) ) ( not ( = ?auto_1943804 ?auto_1943808 ) ) ( not ( = ?auto_1943804 ?auto_1943809 ) ) ( not ( = ?auto_1943804 ?auto_1943810 ) ) ( not ( = ?auto_1943804 ?auto_1943811 ) ) ( not ( = ?auto_1943804 ?auto_1943812 ) ) ( not ( = ?auto_1943804 ?auto_1943813 ) ) ( not ( = ?auto_1943804 ?auto_1943815 ) ) ( not ( = ?auto_1943806 ?auto_1943805 ) ) ( not ( = ?auto_1943806 ?auto_1943807 ) ) ( not ( = ?auto_1943806 ?auto_1943808 ) ) ( not ( = ?auto_1943806 ?auto_1943809 ) ) ( not ( = ?auto_1943806 ?auto_1943810 ) ) ( not ( = ?auto_1943806 ?auto_1943811 ) ) ( not ( = ?auto_1943806 ?auto_1943812 ) ) ( not ( = ?auto_1943806 ?auto_1943813 ) ) ( not ( = ?auto_1943806 ?auto_1943815 ) ) ( not ( = ?auto_1943805 ?auto_1943807 ) ) ( not ( = ?auto_1943805 ?auto_1943808 ) ) ( not ( = ?auto_1943805 ?auto_1943809 ) ) ( not ( = ?auto_1943805 ?auto_1943810 ) ) ( not ( = ?auto_1943805 ?auto_1943811 ) ) ( not ( = ?auto_1943805 ?auto_1943812 ) ) ( not ( = ?auto_1943805 ?auto_1943813 ) ) ( not ( = ?auto_1943805 ?auto_1943815 ) ) ( not ( = ?auto_1943807 ?auto_1943808 ) ) ( not ( = ?auto_1943807 ?auto_1943809 ) ) ( not ( = ?auto_1943807 ?auto_1943810 ) ) ( not ( = ?auto_1943807 ?auto_1943811 ) ) ( not ( = ?auto_1943807 ?auto_1943812 ) ) ( not ( = ?auto_1943807 ?auto_1943813 ) ) ( not ( = ?auto_1943807 ?auto_1943815 ) ) ( not ( = ?auto_1943808 ?auto_1943809 ) ) ( not ( = ?auto_1943808 ?auto_1943810 ) ) ( not ( = ?auto_1943808 ?auto_1943811 ) ) ( not ( = ?auto_1943808 ?auto_1943812 ) ) ( not ( = ?auto_1943808 ?auto_1943813 ) ) ( not ( = ?auto_1943808 ?auto_1943815 ) ) ( not ( = ?auto_1943809 ?auto_1943810 ) ) ( not ( = ?auto_1943809 ?auto_1943811 ) ) ( not ( = ?auto_1943809 ?auto_1943812 ) ) ( not ( = ?auto_1943809 ?auto_1943813 ) ) ( not ( = ?auto_1943809 ?auto_1943815 ) ) ( not ( = ?auto_1943810 ?auto_1943811 ) ) ( not ( = ?auto_1943810 ?auto_1943812 ) ) ( not ( = ?auto_1943810 ?auto_1943813 ) ) ( not ( = ?auto_1943810 ?auto_1943815 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1943811 ?auto_1943812 ?auto_1943813 )
      ( MAKE-11CRATE-VERIFY ?auto_1943802 ?auto_1943803 ?auto_1943804 ?auto_1943806 ?auto_1943805 ?auto_1943807 ?auto_1943808 ?auto_1943809 ?auto_1943810 ?auto_1943811 ?auto_1943812 ?auto_1943813 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1943946 - SURFACE
      ?auto_1943947 - SURFACE
      ?auto_1943948 - SURFACE
      ?auto_1943950 - SURFACE
      ?auto_1943949 - SURFACE
      ?auto_1943951 - SURFACE
      ?auto_1943952 - SURFACE
      ?auto_1943953 - SURFACE
      ?auto_1943954 - SURFACE
      ?auto_1943955 - SURFACE
      ?auto_1943956 - SURFACE
      ?auto_1943957 - SURFACE
    )
    :vars
    (
      ?auto_1943961 - HOIST
      ?auto_1943962 - PLACE
      ?auto_1943958 - PLACE
      ?auto_1943963 - HOIST
      ?auto_1943960 - SURFACE
      ?auto_1943959 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1943961 ?auto_1943962 ) ( IS-CRATE ?auto_1943957 ) ( not ( = ?auto_1943956 ?auto_1943957 ) ) ( not ( = ?auto_1943955 ?auto_1943956 ) ) ( not ( = ?auto_1943955 ?auto_1943957 ) ) ( not ( = ?auto_1943958 ?auto_1943962 ) ) ( HOIST-AT ?auto_1943963 ?auto_1943958 ) ( not ( = ?auto_1943961 ?auto_1943963 ) ) ( AVAILABLE ?auto_1943963 ) ( SURFACE-AT ?auto_1943957 ?auto_1943958 ) ( ON ?auto_1943957 ?auto_1943960 ) ( CLEAR ?auto_1943957 ) ( not ( = ?auto_1943956 ?auto_1943960 ) ) ( not ( = ?auto_1943957 ?auto_1943960 ) ) ( not ( = ?auto_1943955 ?auto_1943960 ) ) ( TRUCK-AT ?auto_1943959 ?auto_1943962 ) ( SURFACE-AT ?auto_1943955 ?auto_1943962 ) ( CLEAR ?auto_1943955 ) ( IS-CRATE ?auto_1943956 ) ( AVAILABLE ?auto_1943961 ) ( IN ?auto_1943956 ?auto_1943959 ) ( ON ?auto_1943947 ?auto_1943946 ) ( ON ?auto_1943948 ?auto_1943947 ) ( ON ?auto_1943950 ?auto_1943948 ) ( ON ?auto_1943949 ?auto_1943950 ) ( ON ?auto_1943951 ?auto_1943949 ) ( ON ?auto_1943952 ?auto_1943951 ) ( ON ?auto_1943953 ?auto_1943952 ) ( ON ?auto_1943954 ?auto_1943953 ) ( ON ?auto_1943955 ?auto_1943954 ) ( not ( = ?auto_1943946 ?auto_1943947 ) ) ( not ( = ?auto_1943946 ?auto_1943948 ) ) ( not ( = ?auto_1943946 ?auto_1943950 ) ) ( not ( = ?auto_1943946 ?auto_1943949 ) ) ( not ( = ?auto_1943946 ?auto_1943951 ) ) ( not ( = ?auto_1943946 ?auto_1943952 ) ) ( not ( = ?auto_1943946 ?auto_1943953 ) ) ( not ( = ?auto_1943946 ?auto_1943954 ) ) ( not ( = ?auto_1943946 ?auto_1943955 ) ) ( not ( = ?auto_1943946 ?auto_1943956 ) ) ( not ( = ?auto_1943946 ?auto_1943957 ) ) ( not ( = ?auto_1943946 ?auto_1943960 ) ) ( not ( = ?auto_1943947 ?auto_1943948 ) ) ( not ( = ?auto_1943947 ?auto_1943950 ) ) ( not ( = ?auto_1943947 ?auto_1943949 ) ) ( not ( = ?auto_1943947 ?auto_1943951 ) ) ( not ( = ?auto_1943947 ?auto_1943952 ) ) ( not ( = ?auto_1943947 ?auto_1943953 ) ) ( not ( = ?auto_1943947 ?auto_1943954 ) ) ( not ( = ?auto_1943947 ?auto_1943955 ) ) ( not ( = ?auto_1943947 ?auto_1943956 ) ) ( not ( = ?auto_1943947 ?auto_1943957 ) ) ( not ( = ?auto_1943947 ?auto_1943960 ) ) ( not ( = ?auto_1943948 ?auto_1943950 ) ) ( not ( = ?auto_1943948 ?auto_1943949 ) ) ( not ( = ?auto_1943948 ?auto_1943951 ) ) ( not ( = ?auto_1943948 ?auto_1943952 ) ) ( not ( = ?auto_1943948 ?auto_1943953 ) ) ( not ( = ?auto_1943948 ?auto_1943954 ) ) ( not ( = ?auto_1943948 ?auto_1943955 ) ) ( not ( = ?auto_1943948 ?auto_1943956 ) ) ( not ( = ?auto_1943948 ?auto_1943957 ) ) ( not ( = ?auto_1943948 ?auto_1943960 ) ) ( not ( = ?auto_1943950 ?auto_1943949 ) ) ( not ( = ?auto_1943950 ?auto_1943951 ) ) ( not ( = ?auto_1943950 ?auto_1943952 ) ) ( not ( = ?auto_1943950 ?auto_1943953 ) ) ( not ( = ?auto_1943950 ?auto_1943954 ) ) ( not ( = ?auto_1943950 ?auto_1943955 ) ) ( not ( = ?auto_1943950 ?auto_1943956 ) ) ( not ( = ?auto_1943950 ?auto_1943957 ) ) ( not ( = ?auto_1943950 ?auto_1943960 ) ) ( not ( = ?auto_1943949 ?auto_1943951 ) ) ( not ( = ?auto_1943949 ?auto_1943952 ) ) ( not ( = ?auto_1943949 ?auto_1943953 ) ) ( not ( = ?auto_1943949 ?auto_1943954 ) ) ( not ( = ?auto_1943949 ?auto_1943955 ) ) ( not ( = ?auto_1943949 ?auto_1943956 ) ) ( not ( = ?auto_1943949 ?auto_1943957 ) ) ( not ( = ?auto_1943949 ?auto_1943960 ) ) ( not ( = ?auto_1943951 ?auto_1943952 ) ) ( not ( = ?auto_1943951 ?auto_1943953 ) ) ( not ( = ?auto_1943951 ?auto_1943954 ) ) ( not ( = ?auto_1943951 ?auto_1943955 ) ) ( not ( = ?auto_1943951 ?auto_1943956 ) ) ( not ( = ?auto_1943951 ?auto_1943957 ) ) ( not ( = ?auto_1943951 ?auto_1943960 ) ) ( not ( = ?auto_1943952 ?auto_1943953 ) ) ( not ( = ?auto_1943952 ?auto_1943954 ) ) ( not ( = ?auto_1943952 ?auto_1943955 ) ) ( not ( = ?auto_1943952 ?auto_1943956 ) ) ( not ( = ?auto_1943952 ?auto_1943957 ) ) ( not ( = ?auto_1943952 ?auto_1943960 ) ) ( not ( = ?auto_1943953 ?auto_1943954 ) ) ( not ( = ?auto_1943953 ?auto_1943955 ) ) ( not ( = ?auto_1943953 ?auto_1943956 ) ) ( not ( = ?auto_1943953 ?auto_1943957 ) ) ( not ( = ?auto_1943953 ?auto_1943960 ) ) ( not ( = ?auto_1943954 ?auto_1943955 ) ) ( not ( = ?auto_1943954 ?auto_1943956 ) ) ( not ( = ?auto_1943954 ?auto_1943957 ) ) ( not ( = ?auto_1943954 ?auto_1943960 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1943955 ?auto_1943956 ?auto_1943957 )
      ( MAKE-11CRATE-VERIFY ?auto_1943946 ?auto_1943947 ?auto_1943948 ?auto_1943950 ?auto_1943949 ?auto_1943951 ?auto_1943952 ?auto_1943953 ?auto_1943954 ?auto_1943955 ?auto_1943956 ?auto_1943957 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1953191 - SURFACE
      ?auto_1953192 - SURFACE
      ?auto_1953193 - SURFACE
      ?auto_1953195 - SURFACE
      ?auto_1953194 - SURFACE
      ?auto_1953196 - SURFACE
      ?auto_1953197 - SURFACE
      ?auto_1953198 - SURFACE
      ?auto_1953199 - SURFACE
      ?auto_1953200 - SURFACE
      ?auto_1953201 - SURFACE
      ?auto_1953202 - SURFACE
      ?auto_1953203 - SURFACE
    )
    :vars
    (
      ?auto_1953205 - HOIST
      ?auto_1953204 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1953205 ?auto_1953204 ) ( SURFACE-AT ?auto_1953202 ?auto_1953204 ) ( CLEAR ?auto_1953202 ) ( LIFTING ?auto_1953205 ?auto_1953203 ) ( IS-CRATE ?auto_1953203 ) ( not ( = ?auto_1953202 ?auto_1953203 ) ) ( ON ?auto_1953192 ?auto_1953191 ) ( ON ?auto_1953193 ?auto_1953192 ) ( ON ?auto_1953195 ?auto_1953193 ) ( ON ?auto_1953194 ?auto_1953195 ) ( ON ?auto_1953196 ?auto_1953194 ) ( ON ?auto_1953197 ?auto_1953196 ) ( ON ?auto_1953198 ?auto_1953197 ) ( ON ?auto_1953199 ?auto_1953198 ) ( ON ?auto_1953200 ?auto_1953199 ) ( ON ?auto_1953201 ?auto_1953200 ) ( ON ?auto_1953202 ?auto_1953201 ) ( not ( = ?auto_1953191 ?auto_1953192 ) ) ( not ( = ?auto_1953191 ?auto_1953193 ) ) ( not ( = ?auto_1953191 ?auto_1953195 ) ) ( not ( = ?auto_1953191 ?auto_1953194 ) ) ( not ( = ?auto_1953191 ?auto_1953196 ) ) ( not ( = ?auto_1953191 ?auto_1953197 ) ) ( not ( = ?auto_1953191 ?auto_1953198 ) ) ( not ( = ?auto_1953191 ?auto_1953199 ) ) ( not ( = ?auto_1953191 ?auto_1953200 ) ) ( not ( = ?auto_1953191 ?auto_1953201 ) ) ( not ( = ?auto_1953191 ?auto_1953202 ) ) ( not ( = ?auto_1953191 ?auto_1953203 ) ) ( not ( = ?auto_1953192 ?auto_1953193 ) ) ( not ( = ?auto_1953192 ?auto_1953195 ) ) ( not ( = ?auto_1953192 ?auto_1953194 ) ) ( not ( = ?auto_1953192 ?auto_1953196 ) ) ( not ( = ?auto_1953192 ?auto_1953197 ) ) ( not ( = ?auto_1953192 ?auto_1953198 ) ) ( not ( = ?auto_1953192 ?auto_1953199 ) ) ( not ( = ?auto_1953192 ?auto_1953200 ) ) ( not ( = ?auto_1953192 ?auto_1953201 ) ) ( not ( = ?auto_1953192 ?auto_1953202 ) ) ( not ( = ?auto_1953192 ?auto_1953203 ) ) ( not ( = ?auto_1953193 ?auto_1953195 ) ) ( not ( = ?auto_1953193 ?auto_1953194 ) ) ( not ( = ?auto_1953193 ?auto_1953196 ) ) ( not ( = ?auto_1953193 ?auto_1953197 ) ) ( not ( = ?auto_1953193 ?auto_1953198 ) ) ( not ( = ?auto_1953193 ?auto_1953199 ) ) ( not ( = ?auto_1953193 ?auto_1953200 ) ) ( not ( = ?auto_1953193 ?auto_1953201 ) ) ( not ( = ?auto_1953193 ?auto_1953202 ) ) ( not ( = ?auto_1953193 ?auto_1953203 ) ) ( not ( = ?auto_1953195 ?auto_1953194 ) ) ( not ( = ?auto_1953195 ?auto_1953196 ) ) ( not ( = ?auto_1953195 ?auto_1953197 ) ) ( not ( = ?auto_1953195 ?auto_1953198 ) ) ( not ( = ?auto_1953195 ?auto_1953199 ) ) ( not ( = ?auto_1953195 ?auto_1953200 ) ) ( not ( = ?auto_1953195 ?auto_1953201 ) ) ( not ( = ?auto_1953195 ?auto_1953202 ) ) ( not ( = ?auto_1953195 ?auto_1953203 ) ) ( not ( = ?auto_1953194 ?auto_1953196 ) ) ( not ( = ?auto_1953194 ?auto_1953197 ) ) ( not ( = ?auto_1953194 ?auto_1953198 ) ) ( not ( = ?auto_1953194 ?auto_1953199 ) ) ( not ( = ?auto_1953194 ?auto_1953200 ) ) ( not ( = ?auto_1953194 ?auto_1953201 ) ) ( not ( = ?auto_1953194 ?auto_1953202 ) ) ( not ( = ?auto_1953194 ?auto_1953203 ) ) ( not ( = ?auto_1953196 ?auto_1953197 ) ) ( not ( = ?auto_1953196 ?auto_1953198 ) ) ( not ( = ?auto_1953196 ?auto_1953199 ) ) ( not ( = ?auto_1953196 ?auto_1953200 ) ) ( not ( = ?auto_1953196 ?auto_1953201 ) ) ( not ( = ?auto_1953196 ?auto_1953202 ) ) ( not ( = ?auto_1953196 ?auto_1953203 ) ) ( not ( = ?auto_1953197 ?auto_1953198 ) ) ( not ( = ?auto_1953197 ?auto_1953199 ) ) ( not ( = ?auto_1953197 ?auto_1953200 ) ) ( not ( = ?auto_1953197 ?auto_1953201 ) ) ( not ( = ?auto_1953197 ?auto_1953202 ) ) ( not ( = ?auto_1953197 ?auto_1953203 ) ) ( not ( = ?auto_1953198 ?auto_1953199 ) ) ( not ( = ?auto_1953198 ?auto_1953200 ) ) ( not ( = ?auto_1953198 ?auto_1953201 ) ) ( not ( = ?auto_1953198 ?auto_1953202 ) ) ( not ( = ?auto_1953198 ?auto_1953203 ) ) ( not ( = ?auto_1953199 ?auto_1953200 ) ) ( not ( = ?auto_1953199 ?auto_1953201 ) ) ( not ( = ?auto_1953199 ?auto_1953202 ) ) ( not ( = ?auto_1953199 ?auto_1953203 ) ) ( not ( = ?auto_1953200 ?auto_1953201 ) ) ( not ( = ?auto_1953200 ?auto_1953202 ) ) ( not ( = ?auto_1953200 ?auto_1953203 ) ) ( not ( = ?auto_1953201 ?auto_1953202 ) ) ( not ( = ?auto_1953201 ?auto_1953203 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1953202 ?auto_1953203 )
      ( MAKE-12CRATE-VERIFY ?auto_1953191 ?auto_1953192 ?auto_1953193 ?auto_1953195 ?auto_1953194 ?auto_1953196 ?auto_1953197 ?auto_1953198 ?auto_1953199 ?auto_1953200 ?auto_1953201 ?auto_1953202 ?auto_1953203 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1953316 - SURFACE
      ?auto_1953317 - SURFACE
      ?auto_1953318 - SURFACE
      ?auto_1953320 - SURFACE
      ?auto_1953319 - SURFACE
      ?auto_1953321 - SURFACE
      ?auto_1953322 - SURFACE
      ?auto_1953323 - SURFACE
      ?auto_1953324 - SURFACE
      ?auto_1953325 - SURFACE
      ?auto_1953326 - SURFACE
      ?auto_1953327 - SURFACE
      ?auto_1953328 - SURFACE
    )
    :vars
    (
      ?auto_1953329 - HOIST
      ?auto_1953330 - PLACE
      ?auto_1953331 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1953329 ?auto_1953330 ) ( SURFACE-AT ?auto_1953327 ?auto_1953330 ) ( CLEAR ?auto_1953327 ) ( IS-CRATE ?auto_1953328 ) ( not ( = ?auto_1953327 ?auto_1953328 ) ) ( TRUCK-AT ?auto_1953331 ?auto_1953330 ) ( AVAILABLE ?auto_1953329 ) ( IN ?auto_1953328 ?auto_1953331 ) ( ON ?auto_1953327 ?auto_1953326 ) ( not ( = ?auto_1953326 ?auto_1953327 ) ) ( not ( = ?auto_1953326 ?auto_1953328 ) ) ( ON ?auto_1953317 ?auto_1953316 ) ( ON ?auto_1953318 ?auto_1953317 ) ( ON ?auto_1953320 ?auto_1953318 ) ( ON ?auto_1953319 ?auto_1953320 ) ( ON ?auto_1953321 ?auto_1953319 ) ( ON ?auto_1953322 ?auto_1953321 ) ( ON ?auto_1953323 ?auto_1953322 ) ( ON ?auto_1953324 ?auto_1953323 ) ( ON ?auto_1953325 ?auto_1953324 ) ( ON ?auto_1953326 ?auto_1953325 ) ( not ( = ?auto_1953316 ?auto_1953317 ) ) ( not ( = ?auto_1953316 ?auto_1953318 ) ) ( not ( = ?auto_1953316 ?auto_1953320 ) ) ( not ( = ?auto_1953316 ?auto_1953319 ) ) ( not ( = ?auto_1953316 ?auto_1953321 ) ) ( not ( = ?auto_1953316 ?auto_1953322 ) ) ( not ( = ?auto_1953316 ?auto_1953323 ) ) ( not ( = ?auto_1953316 ?auto_1953324 ) ) ( not ( = ?auto_1953316 ?auto_1953325 ) ) ( not ( = ?auto_1953316 ?auto_1953326 ) ) ( not ( = ?auto_1953316 ?auto_1953327 ) ) ( not ( = ?auto_1953316 ?auto_1953328 ) ) ( not ( = ?auto_1953317 ?auto_1953318 ) ) ( not ( = ?auto_1953317 ?auto_1953320 ) ) ( not ( = ?auto_1953317 ?auto_1953319 ) ) ( not ( = ?auto_1953317 ?auto_1953321 ) ) ( not ( = ?auto_1953317 ?auto_1953322 ) ) ( not ( = ?auto_1953317 ?auto_1953323 ) ) ( not ( = ?auto_1953317 ?auto_1953324 ) ) ( not ( = ?auto_1953317 ?auto_1953325 ) ) ( not ( = ?auto_1953317 ?auto_1953326 ) ) ( not ( = ?auto_1953317 ?auto_1953327 ) ) ( not ( = ?auto_1953317 ?auto_1953328 ) ) ( not ( = ?auto_1953318 ?auto_1953320 ) ) ( not ( = ?auto_1953318 ?auto_1953319 ) ) ( not ( = ?auto_1953318 ?auto_1953321 ) ) ( not ( = ?auto_1953318 ?auto_1953322 ) ) ( not ( = ?auto_1953318 ?auto_1953323 ) ) ( not ( = ?auto_1953318 ?auto_1953324 ) ) ( not ( = ?auto_1953318 ?auto_1953325 ) ) ( not ( = ?auto_1953318 ?auto_1953326 ) ) ( not ( = ?auto_1953318 ?auto_1953327 ) ) ( not ( = ?auto_1953318 ?auto_1953328 ) ) ( not ( = ?auto_1953320 ?auto_1953319 ) ) ( not ( = ?auto_1953320 ?auto_1953321 ) ) ( not ( = ?auto_1953320 ?auto_1953322 ) ) ( not ( = ?auto_1953320 ?auto_1953323 ) ) ( not ( = ?auto_1953320 ?auto_1953324 ) ) ( not ( = ?auto_1953320 ?auto_1953325 ) ) ( not ( = ?auto_1953320 ?auto_1953326 ) ) ( not ( = ?auto_1953320 ?auto_1953327 ) ) ( not ( = ?auto_1953320 ?auto_1953328 ) ) ( not ( = ?auto_1953319 ?auto_1953321 ) ) ( not ( = ?auto_1953319 ?auto_1953322 ) ) ( not ( = ?auto_1953319 ?auto_1953323 ) ) ( not ( = ?auto_1953319 ?auto_1953324 ) ) ( not ( = ?auto_1953319 ?auto_1953325 ) ) ( not ( = ?auto_1953319 ?auto_1953326 ) ) ( not ( = ?auto_1953319 ?auto_1953327 ) ) ( not ( = ?auto_1953319 ?auto_1953328 ) ) ( not ( = ?auto_1953321 ?auto_1953322 ) ) ( not ( = ?auto_1953321 ?auto_1953323 ) ) ( not ( = ?auto_1953321 ?auto_1953324 ) ) ( not ( = ?auto_1953321 ?auto_1953325 ) ) ( not ( = ?auto_1953321 ?auto_1953326 ) ) ( not ( = ?auto_1953321 ?auto_1953327 ) ) ( not ( = ?auto_1953321 ?auto_1953328 ) ) ( not ( = ?auto_1953322 ?auto_1953323 ) ) ( not ( = ?auto_1953322 ?auto_1953324 ) ) ( not ( = ?auto_1953322 ?auto_1953325 ) ) ( not ( = ?auto_1953322 ?auto_1953326 ) ) ( not ( = ?auto_1953322 ?auto_1953327 ) ) ( not ( = ?auto_1953322 ?auto_1953328 ) ) ( not ( = ?auto_1953323 ?auto_1953324 ) ) ( not ( = ?auto_1953323 ?auto_1953325 ) ) ( not ( = ?auto_1953323 ?auto_1953326 ) ) ( not ( = ?auto_1953323 ?auto_1953327 ) ) ( not ( = ?auto_1953323 ?auto_1953328 ) ) ( not ( = ?auto_1953324 ?auto_1953325 ) ) ( not ( = ?auto_1953324 ?auto_1953326 ) ) ( not ( = ?auto_1953324 ?auto_1953327 ) ) ( not ( = ?auto_1953324 ?auto_1953328 ) ) ( not ( = ?auto_1953325 ?auto_1953326 ) ) ( not ( = ?auto_1953325 ?auto_1953327 ) ) ( not ( = ?auto_1953325 ?auto_1953328 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1953326 ?auto_1953327 ?auto_1953328 )
      ( MAKE-12CRATE-VERIFY ?auto_1953316 ?auto_1953317 ?auto_1953318 ?auto_1953320 ?auto_1953319 ?auto_1953321 ?auto_1953322 ?auto_1953323 ?auto_1953324 ?auto_1953325 ?auto_1953326 ?auto_1953327 ?auto_1953328 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1953454 - SURFACE
      ?auto_1953455 - SURFACE
      ?auto_1953456 - SURFACE
      ?auto_1953458 - SURFACE
      ?auto_1953457 - SURFACE
      ?auto_1953459 - SURFACE
      ?auto_1953460 - SURFACE
      ?auto_1953461 - SURFACE
      ?auto_1953462 - SURFACE
      ?auto_1953463 - SURFACE
      ?auto_1953464 - SURFACE
      ?auto_1953465 - SURFACE
      ?auto_1953466 - SURFACE
    )
    :vars
    (
      ?auto_1953470 - HOIST
      ?auto_1953468 - PLACE
      ?auto_1953467 - TRUCK
      ?auto_1953469 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1953470 ?auto_1953468 ) ( SURFACE-AT ?auto_1953465 ?auto_1953468 ) ( CLEAR ?auto_1953465 ) ( IS-CRATE ?auto_1953466 ) ( not ( = ?auto_1953465 ?auto_1953466 ) ) ( AVAILABLE ?auto_1953470 ) ( IN ?auto_1953466 ?auto_1953467 ) ( ON ?auto_1953465 ?auto_1953464 ) ( not ( = ?auto_1953464 ?auto_1953465 ) ) ( not ( = ?auto_1953464 ?auto_1953466 ) ) ( TRUCK-AT ?auto_1953467 ?auto_1953469 ) ( not ( = ?auto_1953469 ?auto_1953468 ) ) ( ON ?auto_1953455 ?auto_1953454 ) ( ON ?auto_1953456 ?auto_1953455 ) ( ON ?auto_1953458 ?auto_1953456 ) ( ON ?auto_1953457 ?auto_1953458 ) ( ON ?auto_1953459 ?auto_1953457 ) ( ON ?auto_1953460 ?auto_1953459 ) ( ON ?auto_1953461 ?auto_1953460 ) ( ON ?auto_1953462 ?auto_1953461 ) ( ON ?auto_1953463 ?auto_1953462 ) ( ON ?auto_1953464 ?auto_1953463 ) ( not ( = ?auto_1953454 ?auto_1953455 ) ) ( not ( = ?auto_1953454 ?auto_1953456 ) ) ( not ( = ?auto_1953454 ?auto_1953458 ) ) ( not ( = ?auto_1953454 ?auto_1953457 ) ) ( not ( = ?auto_1953454 ?auto_1953459 ) ) ( not ( = ?auto_1953454 ?auto_1953460 ) ) ( not ( = ?auto_1953454 ?auto_1953461 ) ) ( not ( = ?auto_1953454 ?auto_1953462 ) ) ( not ( = ?auto_1953454 ?auto_1953463 ) ) ( not ( = ?auto_1953454 ?auto_1953464 ) ) ( not ( = ?auto_1953454 ?auto_1953465 ) ) ( not ( = ?auto_1953454 ?auto_1953466 ) ) ( not ( = ?auto_1953455 ?auto_1953456 ) ) ( not ( = ?auto_1953455 ?auto_1953458 ) ) ( not ( = ?auto_1953455 ?auto_1953457 ) ) ( not ( = ?auto_1953455 ?auto_1953459 ) ) ( not ( = ?auto_1953455 ?auto_1953460 ) ) ( not ( = ?auto_1953455 ?auto_1953461 ) ) ( not ( = ?auto_1953455 ?auto_1953462 ) ) ( not ( = ?auto_1953455 ?auto_1953463 ) ) ( not ( = ?auto_1953455 ?auto_1953464 ) ) ( not ( = ?auto_1953455 ?auto_1953465 ) ) ( not ( = ?auto_1953455 ?auto_1953466 ) ) ( not ( = ?auto_1953456 ?auto_1953458 ) ) ( not ( = ?auto_1953456 ?auto_1953457 ) ) ( not ( = ?auto_1953456 ?auto_1953459 ) ) ( not ( = ?auto_1953456 ?auto_1953460 ) ) ( not ( = ?auto_1953456 ?auto_1953461 ) ) ( not ( = ?auto_1953456 ?auto_1953462 ) ) ( not ( = ?auto_1953456 ?auto_1953463 ) ) ( not ( = ?auto_1953456 ?auto_1953464 ) ) ( not ( = ?auto_1953456 ?auto_1953465 ) ) ( not ( = ?auto_1953456 ?auto_1953466 ) ) ( not ( = ?auto_1953458 ?auto_1953457 ) ) ( not ( = ?auto_1953458 ?auto_1953459 ) ) ( not ( = ?auto_1953458 ?auto_1953460 ) ) ( not ( = ?auto_1953458 ?auto_1953461 ) ) ( not ( = ?auto_1953458 ?auto_1953462 ) ) ( not ( = ?auto_1953458 ?auto_1953463 ) ) ( not ( = ?auto_1953458 ?auto_1953464 ) ) ( not ( = ?auto_1953458 ?auto_1953465 ) ) ( not ( = ?auto_1953458 ?auto_1953466 ) ) ( not ( = ?auto_1953457 ?auto_1953459 ) ) ( not ( = ?auto_1953457 ?auto_1953460 ) ) ( not ( = ?auto_1953457 ?auto_1953461 ) ) ( not ( = ?auto_1953457 ?auto_1953462 ) ) ( not ( = ?auto_1953457 ?auto_1953463 ) ) ( not ( = ?auto_1953457 ?auto_1953464 ) ) ( not ( = ?auto_1953457 ?auto_1953465 ) ) ( not ( = ?auto_1953457 ?auto_1953466 ) ) ( not ( = ?auto_1953459 ?auto_1953460 ) ) ( not ( = ?auto_1953459 ?auto_1953461 ) ) ( not ( = ?auto_1953459 ?auto_1953462 ) ) ( not ( = ?auto_1953459 ?auto_1953463 ) ) ( not ( = ?auto_1953459 ?auto_1953464 ) ) ( not ( = ?auto_1953459 ?auto_1953465 ) ) ( not ( = ?auto_1953459 ?auto_1953466 ) ) ( not ( = ?auto_1953460 ?auto_1953461 ) ) ( not ( = ?auto_1953460 ?auto_1953462 ) ) ( not ( = ?auto_1953460 ?auto_1953463 ) ) ( not ( = ?auto_1953460 ?auto_1953464 ) ) ( not ( = ?auto_1953460 ?auto_1953465 ) ) ( not ( = ?auto_1953460 ?auto_1953466 ) ) ( not ( = ?auto_1953461 ?auto_1953462 ) ) ( not ( = ?auto_1953461 ?auto_1953463 ) ) ( not ( = ?auto_1953461 ?auto_1953464 ) ) ( not ( = ?auto_1953461 ?auto_1953465 ) ) ( not ( = ?auto_1953461 ?auto_1953466 ) ) ( not ( = ?auto_1953462 ?auto_1953463 ) ) ( not ( = ?auto_1953462 ?auto_1953464 ) ) ( not ( = ?auto_1953462 ?auto_1953465 ) ) ( not ( = ?auto_1953462 ?auto_1953466 ) ) ( not ( = ?auto_1953463 ?auto_1953464 ) ) ( not ( = ?auto_1953463 ?auto_1953465 ) ) ( not ( = ?auto_1953463 ?auto_1953466 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1953464 ?auto_1953465 ?auto_1953466 )
      ( MAKE-12CRATE-VERIFY ?auto_1953454 ?auto_1953455 ?auto_1953456 ?auto_1953458 ?auto_1953457 ?auto_1953459 ?auto_1953460 ?auto_1953461 ?auto_1953462 ?auto_1953463 ?auto_1953464 ?auto_1953465 ?auto_1953466 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1953604 - SURFACE
      ?auto_1953605 - SURFACE
      ?auto_1953606 - SURFACE
      ?auto_1953608 - SURFACE
      ?auto_1953607 - SURFACE
      ?auto_1953609 - SURFACE
      ?auto_1953610 - SURFACE
      ?auto_1953611 - SURFACE
      ?auto_1953612 - SURFACE
      ?auto_1953613 - SURFACE
      ?auto_1953614 - SURFACE
      ?auto_1953615 - SURFACE
      ?auto_1953616 - SURFACE
    )
    :vars
    (
      ?auto_1953620 - HOIST
      ?auto_1953619 - PLACE
      ?auto_1953617 - TRUCK
      ?auto_1953618 - PLACE
      ?auto_1953621 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1953620 ?auto_1953619 ) ( SURFACE-AT ?auto_1953615 ?auto_1953619 ) ( CLEAR ?auto_1953615 ) ( IS-CRATE ?auto_1953616 ) ( not ( = ?auto_1953615 ?auto_1953616 ) ) ( AVAILABLE ?auto_1953620 ) ( ON ?auto_1953615 ?auto_1953614 ) ( not ( = ?auto_1953614 ?auto_1953615 ) ) ( not ( = ?auto_1953614 ?auto_1953616 ) ) ( TRUCK-AT ?auto_1953617 ?auto_1953618 ) ( not ( = ?auto_1953618 ?auto_1953619 ) ) ( HOIST-AT ?auto_1953621 ?auto_1953618 ) ( LIFTING ?auto_1953621 ?auto_1953616 ) ( not ( = ?auto_1953620 ?auto_1953621 ) ) ( ON ?auto_1953605 ?auto_1953604 ) ( ON ?auto_1953606 ?auto_1953605 ) ( ON ?auto_1953608 ?auto_1953606 ) ( ON ?auto_1953607 ?auto_1953608 ) ( ON ?auto_1953609 ?auto_1953607 ) ( ON ?auto_1953610 ?auto_1953609 ) ( ON ?auto_1953611 ?auto_1953610 ) ( ON ?auto_1953612 ?auto_1953611 ) ( ON ?auto_1953613 ?auto_1953612 ) ( ON ?auto_1953614 ?auto_1953613 ) ( not ( = ?auto_1953604 ?auto_1953605 ) ) ( not ( = ?auto_1953604 ?auto_1953606 ) ) ( not ( = ?auto_1953604 ?auto_1953608 ) ) ( not ( = ?auto_1953604 ?auto_1953607 ) ) ( not ( = ?auto_1953604 ?auto_1953609 ) ) ( not ( = ?auto_1953604 ?auto_1953610 ) ) ( not ( = ?auto_1953604 ?auto_1953611 ) ) ( not ( = ?auto_1953604 ?auto_1953612 ) ) ( not ( = ?auto_1953604 ?auto_1953613 ) ) ( not ( = ?auto_1953604 ?auto_1953614 ) ) ( not ( = ?auto_1953604 ?auto_1953615 ) ) ( not ( = ?auto_1953604 ?auto_1953616 ) ) ( not ( = ?auto_1953605 ?auto_1953606 ) ) ( not ( = ?auto_1953605 ?auto_1953608 ) ) ( not ( = ?auto_1953605 ?auto_1953607 ) ) ( not ( = ?auto_1953605 ?auto_1953609 ) ) ( not ( = ?auto_1953605 ?auto_1953610 ) ) ( not ( = ?auto_1953605 ?auto_1953611 ) ) ( not ( = ?auto_1953605 ?auto_1953612 ) ) ( not ( = ?auto_1953605 ?auto_1953613 ) ) ( not ( = ?auto_1953605 ?auto_1953614 ) ) ( not ( = ?auto_1953605 ?auto_1953615 ) ) ( not ( = ?auto_1953605 ?auto_1953616 ) ) ( not ( = ?auto_1953606 ?auto_1953608 ) ) ( not ( = ?auto_1953606 ?auto_1953607 ) ) ( not ( = ?auto_1953606 ?auto_1953609 ) ) ( not ( = ?auto_1953606 ?auto_1953610 ) ) ( not ( = ?auto_1953606 ?auto_1953611 ) ) ( not ( = ?auto_1953606 ?auto_1953612 ) ) ( not ( = ?auto_1953606 ?auto_1953613 ) ) ( not ( = ?auto_1953606 ?auto_1953614 ) ) ( not ( = ?auto_1953606 ?auto_1953615 ) ) ( not ( = ?auto_1953606 ?auto_1953616 ) ) ( not ( = ?auto_1953608 ?auto_1953607 ) ) ( not ( = ?auto_1953608 ?auto_1953609 ) ) ( not ( = ?auto_1953608 ?auto_1953610 ) ) ( not ( = ?auto_1953608 ?auto_1953611 ) ) ( not ( = ?auto_1953608 ?auto_1953612 ) ) ( not ( = ?auto_1953608 ?auto_1953613 ) ) ( not ( = ?auto_1953608 ?auto_1953614 ) ) ( not ( = ?auto_1953608 ?auto_1953615 ) ) ( not ( = ?auto_1953608 ?auto_1953616 ) ) ( not ( = ?auto_1953607 ?auto_1953609 ) ) ( not ( = ?auto_1953607 ?auto_1953610 ) ) ( not ( = ?auto_1953607 ?auto_1953611 ) ) ( not ( = ?auto_1953607 ?auto_1953612 ) ) ( not ( = ?auto_1953607 ?auto_1953613 ) ) ( not ( = ?auto_1953607 ?auto_1953614 ) ) ( not ( = ?auto_1953607 ?auto_1953615 ) ) ( not ( = ?auto_1953607 ?auto_1953616 ) ) ( not ( = ?auto_1953609 ?auto_1953610 ) ) ( not ( = ?auto_1953609 ?auto_1953611 ) ) ( not ( = ?auto_1953609 ?auto_1953612 ) ) ( not ( = ?auto_1953609 ?auto_1953613 ) ) ( not ( = ?auto_1953609 ?auto_1953614 ) ) ( not ( = ?auto_1953609 ?auto_1953615 ) ) ( not ( = ?auto_1953609 ?auto_1953616 ) ) ( not ( = ?auto_1953610 ?auto_1953611 ) ) ( not ( = ?auto_1953610 ?auto_1953612 ) ) ( not ( = ?auto_1953610 ?auto_1953613 ) ) ( not ( = ?auto_1953610 ?auto_1953614 ) ) ( not ( = ?auto_1953610 ?auto_1953615 ) ) ( not ( = ?auto_1953610 ?auto_1953616 ) ) ( not ( = ?auto_1953611 ?auto_1953612 ) ) ( not ( = ?auto_1953611 ?auto_1953613 ) ) ( not ( = ?auto_1953611 ?auto_1953614 ) ) ( not ( = ?auto_1953611 ?auto_1953615 ) ) ( not ( = ?auto_1953611 ?auto_1953616 ) ) ( not ( = ?auto_1953612 ?auto_1953613 ) ) ( not ( = ?auto_1953612 ?auto_1953614 ) ) ( not ( = ?auto_1953612 ?auto_1953615 ) ) ( not ( = ?auto_1953612 ?auto_1953616 ) ) ( not ( = ?auto_1953613 ?auto_1953614 ) ) ( not ( = ?auto_1953613 ?auto_1953615 ) ) ( not ( = ?auto_1953613 ?auto_1953616 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1953614 ?auto_1953615 ?auto_1953616 )
      ( MAKE-12CRATE-VERIFY ?auto_1953604 ?auto_1953605 ?auto_1953606 ?auto_1953608 ?auto_1953607 ?auto_1953609 ?auto_1953610 ?auto_1953611 ?auto_1953612 ?auto_1953613 ?auto_1953614 ?auto_1953615 ?auto_1953616 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1953766 - SURFACE
      ?auto_1953767 - SURFACE
      ?auto_1953768 - SURFACE
      ?auto_1953770 - SURFACE
      ?auto_1953769 - SURFACE
      ?auto_1953771 - SURFACE
      ?auto_1953772 - SURFACE
      ?auto_1953773 - SURFACE
      ?auto_1953774 - SURFACE
      ?auto_1953775 - SURFACE
      ?auto_1953776 - SURFACE
      ?auto_1953777 - SURFACE
      ?auto_1953778 - SURFACE
    )
    :vars
    (
      ?auto_1953782 - HOIST
      ?auto_1953779 - PLACE
      ?auto_1953781 - TRUCK
      ?auto_1953783 - PLACE
      ?auto_1953780 - HOIST
      ?auto_1953784 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1953782 ?auto_1953779 ) ( SURFACE-AT ?auto_1953777 ?auto_1953779 ) ( CLEAR ?auto_1953777 ) ( IS-CRATE ?auto_1953778 ) ( not ( = ?auto_1953777 ?auto_1953778 ) ) ( AVAILABLE ?auto_1953782 ) ( ON ?auto_1953777 ?auto_1953776 ) ( not ( = ?auto_1953776 ?auto_1953777 ) ) ( not ( = ?auto_1953776 ?auto_1953778 ) ) ( TRUCK-AT ?auto_1953781 ?auto_1953783 ) ( not ( = ?auto_1953783 ?auto_1953779 ) ) ( HOIST-AT ?auto_1953780 ?auto_1953783 ) ( not ( = ?auto_1953782 ?auto_1953780 ) ) ( AVAILABLE ?auto_1953780 ) ( SURFACE-AT ?auto_1953778 ?auto_1953783 ) ( ON ?auto_1953778 ?auto_1953784 ) ( CLEAR ?auto_1953778 ) ( not ( = ?auto_1953777 ?auto_1953784 ) ) ( not ( = ?auto_1953778 ?auto_1953784 ) ) ( not ( = ?auto_1953776 ?auto_1953784 ) ) ( ON ?auto_1953767 ?auto_1953766 ) ( ON ?auto_1953768 ?auto_1953767 ) ( ON ?auto_1953770 ?auto_1953768 ) ( ON ?auto_1953769 ?auto_1953770 ) ( ON ?auto_1953771 ?auto_1953769 ) ( ON ?auto_1953772 ?auto_1953771 ) ( ON ?auto_1953773 ?auto_1953772 ) ( ON ?auto_1953774 ?auto_1953773 ) ( ON ?auto_1953775 ?auto_1953774 ) ( ON ?auto_1953776 ?auto_1953775 ) ( not ( = ?auto_1953766 ?auto_1953767 ) ) ( not ( = ?auto_1953766 ?auto_1953768 ) ) ( not ( = ?auto_1953766 ?auto_1953770 ) ) ( not ( = ?auto_1953766 ?auto_1953769 ) ) ( not ( = ?auto_1953766 ?auto_1953771 ) ) ( not ( = ?auto_1953766 ?auto_1953772 ) ) ( not ( = ?auto_1953766 ?auto_1953773 ) ) ( not ( = ?auto_1953766 ?auto_1953774 ) ) ( not ( = ?auto_1953766 ?auto_1953775 ) ) ( not ( = ?auto_1953766 ?auto_1953776 ) ) ( not ( = ?auto_1953766 ?auto_1953777 ) ) ( not ( = ?auto_1953766 ?auto_1953778 ) ) ( not ( = ?auto_1953766 ?auto_1953784 ) ) ( not ( = ?auto_1953767 ?auto_1953768 ) ) ( not ( = ?auto_1953767 ?auto_1953770 ) ) ( not ( = ?auto_1953767 ?auto_1953769 ) ) ( not ( = ?auto_1953767 ?auto_1953771 ) ) ( not ( = ?auto_1953767 ?auto_1953772 ) ) ( not ( = ?auto_1953767 ?auto_1953773 ) ) ( not ( = ?auto_1953767 ?auto_1953774 ) ) ( not ( = ?auto_1953767 ?auto_1953775 ) ) ( not ( = ?auto_1953767 ?auto_1953776 ) ) ( not ( = ?auto_1953767 ?auto_1953777 ) ) ( not ( = ?auto_1953767 ?auto_1953778 ) ) ( not ( = ?auto_1953767 ?auto_1953784 ) ) ( not ( = ?auto_1953768 ?auto_1953770 ) ) ( not ( = ?auto_1953768 ?auto_1953769 ) ) ( not ( = ?auto_1953768 ?auto_1953771 ) ) ( not ( = ?auto_1953768 ?auto_1953772 ) ) ( not ( = ?auto_1953768 ?auto_1953773 ) ) ( not ( = ?auto_1953768 ?auto_1953774 ) ) ( not ( = ?auto_1953768 ?auto_1953775 ) ) ( not ( = ?auto_1953768 ?auto_1953776 ) ) ( not ( = ?auto_1953768 ?auto_1953777 ) ) ( not ( = ?auto_1953768 ?auto_1953778 ) ) ( not ( = ?auto_1953768 ?auto_1953784 ) ) ( not ( = ?auto_1953770 ?auto_1953769 ) ) ( not ( = ?auto_1953770 ?auto_1953771 ) ) ( not ( = ?auto_1953770 ?auto_1953772 ) ) ( not ( = ?auto_1953770 ?auto_1953773 ) ) ( not ( = ?auto_1953770 ?auto_1953774 ) ) ( not ( = ?auto_1953770 ?auto_1953775 ) ) ( not ( = ?auto_1953770 ?auto_1953776 ) ) ( not ( = ?auto_1953770 ?auto_1953777 ) ) ( not ( = ?auto_1953770 ?auto_1953778 ) ) ( not ( = ?auto_1953770 ?auto_1953784 ) ) ( not ( = ?auto_1953769 ?auto_1953771 ) ) ( not ( = ?auto_1953769 ?auto_1953772 ) ) ( not ( = ?auto_1953769 ?auto_1953773 ) ) ( not ( = ?auto_1953769 ?auto_1953774 ) ) ( not ( = ?auto_1953769 ?auto_1953775 ) ) ( not ( = ?auto_1953769 ?auto_1953776 ) ) ( not ( = ?auto_1953769 ?auto_1953777 ) ) ( not ( = ?auto_1953769 ?auto_1953778 ) ) ( not ( = ?auto_1953769 ?auto_1953784 ) ) ( not ( = ?auto_1953771 ?auto_1953772 ) ) ( not ( = ?auto_1953771 ?auto_1953773 ) ) ( not ( = ?auto_1953771 ?auto_1953774 ) ) ( not ( = ?auto_1953771 ?auto_1953775 ) ) ( not ( = ?auto_1953771 ?auto_1953776 ) ) ( not ( = ?auto_1953771 ?auto_1953777 ) ) ( not ( = ?auto_1953771 ?auto_1953778 ) ) ( not ( = ?auto_1953771 ?auto_1953784 ) ) ( not ( = ?auto_1953772 ?auto_1953773 ) ) ( not ( = ?auto_1953772 ?auto_1953774 ) ) ( not ( = ?auto_1953772 ?auto_1953775 ) ) ( not ( = ?auto_1953772 ?auto_1953776 ) ) ( not ( = ?auto_1953772 ?auto_1953777 ) ) ( not ( = ?auto_1953772 ?auto_1953778 ) ) ( not ( = ?auto_1953772 ?auto_1953784 ) ) ( not ( = ?auto_1953773 ?auto_1953774 ) ) ( not ( = ?auto_1953773 ?auto_1953775 ) ) ( not ( = ?auto_1953773 ?auto_1953776 ) ) ( not ( = ?auto_1953773 ?auto_1953777 ) ) ( not ( = ?auto_1953773 ?auto_1953778 ) ) ( not ( = ?auto_1953773 ?auto_1953784 ) ) ( not ( = ?auto_1953774 ?auto_1953775 ) ) ( not ( = ?auto_1953774 ?auto_1953776 ) ) ( not ( = ?auto_1953774 ?auto_1953777 ) ) ( not ( = ?auto_1953774 ?auto_1953778 ) ) ( not ( = ?auto_1953774 ?auto_1953784 ) ) ( not ( = ?auto_1953775 ?auto_1953776 ) ) ( not ( = ?auto_1953775 ?auto_1953777 ) ) ( not ( = ?auto_1953775 ?auto_1953778 ) ) ( not ( = ?auto_1953775 ?auto_1953784 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1953776 ?auto_1953777 ?auto_1953778 )
      ( MAKE-12CRATE-VERIFY ?auto_1953766 ?auto_1953767 ?auto_1953768 ?auto_1953770 ?auto_1953769 ?auto_1953771 ?auto_1953772 ?auto_1953773 ?auto_1953774 ?auto_1953775 ?auto_1953776 ?auto_1953777 ?auto_1953778 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1953929 - SURFACE
      ?auto_1953930 - SURFACE
      ?auto_1953931 - SURFACE
      ?auto_1953933 - SURFACE
      ?auto_1953932 - SURFACE
      ?auto_1953934 - SURFACE
      ?auto_1953935 - SURFACE
      ?auto_1953936 - SURFACE
      ?auto_1953937 - SURFACE
      ?auto_1953938 - SURFACE
      ?auto_1953939 - SURFACE
      ?auto_1953940 - SURFACE
      ?auto_1953941 - SURFACE
    )
    :vars
    (
      ?auto_1953946 - HOIST
      ?auto_1953943 - PLACE
      ?auto_1953942 - PLACE
      ?auto_1953945 - HOIST
      ?auto_1953947 - SURFACE
      ?auto_1953944 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1953946 ?auto_1953943 ) ( SURFACE-AT ?auto_1953940 ?auto_1953943 ) ( CLEAR ?auto_1953940 ) ( IS-CRATE ?auto_1953941 ) ( not ( = ?auto_1953940 ?auto_1953941 ) ) ( AVAILABLE ?auto_1953946 ) ( ON ?auto_1953940 ?auto_1953939 ) ( not ( = ?auto_1953939 ?auto_1953940 ) ) ( not ( = ?auto_1953939 ?auto_1953941 ) ) ( not ( = ?auto_1953942 ?auto_1953943 ) ) ( HOIST-AT ?auto_1953945 ?auto_1953942 ) ( not ( = ?auto_1953946 ?auto_1953945 ) ) ( AVAILABLE ?auto_1953945 ) ( SURFACE-AT ?auto_1953941 ?auto_1953942 ) ( ON ?auto_1953941 ?auto_1953947 ) ( CLEAR ?auto_1953941 ) ( not ( = ?auto_1953940 ?auto_1953947 ) ) ( not ( = ?auto_1953941 ?auto_1953947 ) ) ( not ( = ?auto_1953939 ?auto_1953947 ) ) ( TRUCK-AT ?auto_1953944 ?auto_1953943 ) ( ON ?auto_1953930 ?auto_1953929 ) ( ON ?auto_1953931 ?auto_1953930 ) ( ON ?auto_1953933 ?auto_1953931 ) ( ON ?auto_1953932 ?auto_1953933 ) ( ON ?auto_1953934 ?auto_1953932 ) ( ON ?auto_1953935 ?auto_1953934 ) ( ON ?auto_1953936 ?auto_1953935 ) ( ON ?auto_1953937 ?auto_1953936 ) ( ON ?auto_1953938 ?auto_1953937 ) ( ON ?auto_1953939 ?auto_1953938 ) ( not ( = ?auto_1953929 ?auto_1953930 ) ) ( not ( = ?auto_1953929 ?auto_1953931 ) ) ( not ( = ?auto_1953929 ?auto_1953933 ) ) ( not ( = ?auto_1953929 ?auto_1953932 ) ) ( not ( = ?auto_1953929 ?auto_1953934 ) ) ( not ( = ?auto_1953929 ?auto_1953935 ) ) ( not ( = ?auto_1953929 ?auto_1953936 ) ) ( not ( = ?auto_1953929 ?auto_1953937 ) ) ( not ( = ?auto_1953929 ?auto_1953938 ) ) ( not ( = ?auto_1953929 ?auto_1953939 ) ) ( not ( = ?auto_1953929 ?auto_1953940 ) ) ( not ( = ?auto_1953929 ?auto_1953941 ) ) ( not ( = ?auto_1953929 ?auto_1953947 ) ) ( not ( = ?auto_1953930 ?auto_1953931 ) ) ( not ( = ?auto_1953930 ?auto_1953933 ) ) ( not ( = ?auto_1953930 ?auto_1953932 ) ) ( not ( = ?auto_1953930 ?auto_1953934 ) ) ( not ( = ?auto_1953930 ?auto_1953935 ) ) ( not ( = ?auto_1953930 ?auto_1953936 ) ) ( not ( = ?auto_1953930 ?auto_1953937 ) ) ( not ( = ?auto_1953930 ?auto_1953938 ) ) ( not ( = ?auto_1953930 ?auto_1953939 ) ) ( not ( = ?auto_1953930 ?auto_1953940 ) ) ( not ( = ?auto_1953930 ?auto_1953941 ) ) ( not ( = ?auto_1953930 ?auto_1953947 ) ) ( not ( = ?auto_1953931 ?auto_1953933 ) ) ( not ( = ?auto_1953931 ?auto_1953932 ) ) ( not ( = ?auto_1953931 ?auto_1953934 ) ) ( not ( = ?auto_1953931 ?auto_1953935 ) ) ( not ( = ?auto_1953931 ?auto_1953936 ) ) ( not ( = ?auto_1953931 ?auto_1953937 ) ) ( not ( = ?auto_1953931 ?auto_1953938 ) ) ( not ( = ?auto_1953931 ?auto_1953939 ) ) ( not ( = ?auto_1953931 ?auto_1953940 ) ) ( not ( = ?auto_1953931 ?auto_1953941 ) ) ( not ( = ?auto_1953931 ?auto_1953947 ) ) ( not ( = ?auto_1953933 ?auto_1953932 ) ) ( not ( = ?auto_1953933 ?auto_1953934 ) ) ( not ( = ?auto_1953933 ?auto_1953935 ) ) ( not ( = ?auto_1953933 ?auto_1953936 ) ) ( not ( = ?auto_1953933 ?auto_1953937 ) ) ( not ( = ?auto_1953933 ?auto_1953938 ) ) ( not ( = ?auto_1953933 ?auto_1953939 ) ) ( not ( = ?auto_1953933 ?auto_1953940 ) ) ( not ( = ?auto_1953933 ?auto_1953941 ) ) ( not ( = ?auto_1953933 ?auto_1953947 ) ) ( not ( = ?auto_1953932 ?auto_1953934 ) ) ( not ( = ?auto_1953932 ?auto_1953935 ) ) ( not ( = ?auto_1953932 ?auto_1953936 ) ) ( not ( = ?auto_1953932 ?auto_1953937 ) ) ( not ( = ?auto_1953932 ?auto_1953938 ) ) ( not ( = ?auto_1953932 ?auto_1953939 ) ) ( not ( = ?auto_1953932 ?auto_1953940 ) ) ( not ( = ?auto_1953932 ?auto_1953941 ) ) ( not ( = ?auto_1953932 ?auto_1953947 ) ) ( not ( = ?auto_1953934 ?auto_1953935 ) ) ( not ( = ?auto_1953934 ?auto_1953936 ) ) ( not ( = ?auto_1953934 ?auto_1953937 ) ) ( not ( = ?auto_1953934 ?auto_1953938 ) ) ( not ( = ?auto_1953934 ?auto_1953939 ) ) ( not ( = ?auto_1953934 ?auto_1953940 ) ) ( not ( = ?auto_1953934 ?auto_1953941 ) ) ( not ( = ?auto_1953934 ?auto_1953947 ) ) ( not ( = ?auto_1953935 ?auto_1953936 ) ) ( not ( = ?auto_1953935 ?auto_1953937 ) ) ( not ( = ?auto_1953935 ?auto_1953938 ) ) ( not ( = ?auto_1953935 ?auto_1953939 ) ) ( not ( = ?auto_1953935 ?auto_1953940 ) ) ( not ( = ?auto_1953935 ?auto_1953941 ) ) ( not ( = ?auto_1953935 ?auto_1953947 ) ) ( not ( = ?auto_1953936 ?auto_1953937 ) ) ( not ( = ?auto_1953936 ?auto_1953938 ) ) ( not ( = ?auto_1953936 ?auto_1953939 ) ) ( not ( = ?auto_1953936 ?auto_1953940 ) ) ( not ( = ?auto_1953936 ?auto_1953941 ) ) ( not ( = ?auto_1953936 ?auto_1953947 ) ) ( not ( = ?auto_1953937 ?auto_1953938 ) ) ( not ( = ?auto_1953937 ?auto_1953939 ) ) ( not ( = ?auto_1953937 ?auto_1953940 ) ) ( not ( = ?auto_1953937 ?auto_1953941 ) ) ( not ( = ?auto_1953937 ?auto_1953947 ) ) ( not ( = ?auto_1953938 ?auto_1953939 ) ) ( not ( = ?auto_1953938 ?auto_1953940 ) ) ( not ( = ?auto_1953938 ?auto_1953941 ) ) ( not ( = ?auto_1953938 ?auto_1953947 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1953939 ?auto_1953940 ?auto_1953941 )
      ( MAKE-12CRATE-VERIFY ?auto_1953929 ?auto_1953930 ?auto_1953931 ?auto_1953933 ?auto_1953932 ?auto_1953934 ?auto_1953935 ?auto_1953936 ?auto_1953937 ?auto_1953938 ?auto_1953939 ?auto_1953940 ?auto_1953941 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1954092 - SURFACE
      ?auto_1954093 - SURFACE
      ?auto_1954094 - SURFACE
      ?auto_1954096 - SURFACE
      ?auto_1954095 - SURFACE
      ?auto_1954097 - SURFACE
      ?auto_1954098 - SURFACE
      ?auto_1954099 - SURFACE
      ?auto_1954100 - SURFACE
      ?auto_1954101 - SURFACE
      ?auto_1954102 - SURFACE
      ?auto_1954103 - SURFACE
      ?auto_1954104 - SURFACE
    )
    :vars
    (
      ?auto_1954105 - HOIST
      ?auto_1954106 - PLACE
      ?auto_1954107 - PLACE
      ?auto_1954109 - HOIST
      ?auto_1954110 - SURFACE
      ?auto_1954108 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1954105 ?auto_1954106 ) ( IS-CRATE ?auto_1954104 ) ( not ( = ?auto_1954103 ?auto_1954104 ) ) ( not ( = ?auto_1954102 ?auto_1954103 ) ) ( not ( = ?auto_1954102 ?auto_1954104 ) ) ( not ( = ?auto_1954107 ?auto_1954106 ) ) ( HOIST-AT ?auto_1954109 ?auto_1954107 ) ( not ( = ?auto_1954105 ?auto_1954109 ) ) ( AVAILABLE ?auto_1954109 ) ( SURFACE-AT ?auto_1954104 ?auto_1954107 ) ( ON ?auto_1954104 ?auto_1954110 ) ( CLEAR ?auto_1954104 ) ( not ( = ?auto_1954103 ?auto_1954110 ) ) ( not ( = ?auto_1954104 ?auto_1954110 ) ) ( not ( = ?auto_1954102 ?auto_1954110 ) ) ( TRUCK-AT ?auto_1954108 ?auto_1954106 ) ( SURFACE-AT ?auto_1954102 ?auto_1954106 ) ( CLEAR ?auto_1954102 ) ( LIFTING ?auto_1954105 ?auto_1954103 ) ( IS-CRATE ?auto_1954103 ) ( ON ?auto_1954093 ?auto_1954092 ) ( ON ?auto_1954094 ?auto_1954093 ) ( ON ?auto_1954096 ?auto_1954094 ) ( ON ?auto_1954095 ?auto_1954096 ) ( ON ?auto_1954097 ?auto_1954095 ) ( ON ?auto_1954098 ?auto_1954097 ) ( ON ?auto_1954099 ?auto_1954098 ) ( ON ?auto_1954100 ?auto_1954099 ) ( ON ?auto_1954101 ?auto_1954100 ) ( ON ?auto_1954102 ?auto_1954101 ) ( not ( = ?auto_1954092 ?auto_1954093 ) ) ( not ( = ?auto_1954092 ?auto_1954094 ) ) ( not ( = ?auto_1954092 ?auto_1954096 ) ) ( not ( = ?auto_1954092 ?auto_1954095 ) ) ( not ( = ?auto_1954092 ?auto_1954097 ) ) ( not ( = ?auto_1954092 ?auto_1954098 ) ) ( not ( = ?auto_1954092 ?auto_1954099 ) ) ( not ( = ?auto_1954092 ?auto_1954100 ) ) ( not ( = ?auto_1954092 ?auto_1954101 ) ) ( not ( = ?auto_1954092 ?auto_1954102 ) ) ( not ( = ?auto_1954092 ?auto_1954103 ) ) ( not ( = ?auto_1954092 ?auto_1954104 ) ) ( not ( = ?auto_1954092 ?auto_1954110 ) ) ( not ( = ?auto_1954093 ?auto_1954094 ) ) ( not ( = ?auto_1954093 ?auto_1954096 ) ) ( not ( = ?auto_1954093 ?auto_1954095 ) ) ( not ( = ?auto_1954093 ?auto_1954097 ) ) ( not ( = ?auto_1954093 ?auto_1954098 ) ) ( not ( = ?auto_1954093 ?auto_1954099 ) ) ( not ( = ?auto_1954093 ?auto_1954100 ) ) ( not ( = ?auto_1954093 ?auto_1954101 ) ) ( not ( = ?auto_1954093 ?auto_1954102 ) ) ( not ( = ?auto_1954093 ?auto_1954103 ) ) ( not ( = ?auto_1954093 ?auto_1954104 ) ) ( not ( = ?auto_1954093 ?auto_1954110 ) ) ( not ( = ?auto_1954094 ?auto_1954096 ) ) ( not ( = ?auto_1954094 ?auto_1954095 ) ) ( not ( = ?auto_1954094 ?auto_1954097 ) ) ( not ( = ?auto_1954094 ?auto_1954098 ) ) ( not ( = ?auto_1954094 ?auto_1954099 ) ) ( not ( = ?auto_1954094 ?auto_1954100 ) ) ( not ( = ?auto_1954094 ?auto_1954101 ) ) ( not ( = ?auto_1954094 ?auto_1954102 ) ) ( not ( = ?auto_1954094 ?auto_1954103 ) ) ( not ( = ?auto_1954094 ?auto_1954104 ) ) ( not ( = ?auto_1954094 ?auto_1954110 ) ) ( not ( = ?auto_1954096 ?auto_1954095 ) ) ( not ( = ?auto_1954096 ?auto_1954097 ) ) ( not ( = ?auto_1954096 ?auto_1954098 ) ) ( not ( = ?auto_1954096 ?auto_1954099 ) ) ( not ( = ?auto_1954096 ?auto_1954100 ) ) ( not ( = ?auto_1954096 ?auto_1954101 ) ) ( not ( = ?auto_1954096 ?auto_1954102 ) ) ( not ( = ?auto_1954096 ?auto_1954103 ) ) ( not ( = ?auto_1954096 ?auto_1954104 ) ) ( not ( = ?auto_1954096 ?auto_1954110 ) ) ( not ( = ?auto_1954095 ?auto_1954097 ) ) ( not ( = ?auto_1954095 ?auto_1954098 ) ) ( not ( = ?auto_1954095 ?auto_1954099 ) ) ( not ( = ?auto_1954095 ?auto_1954100 ) ) ( not ( = ?auto_1954095 ?auto_1954101 ) ) ( not ( = ?auto_1954095 ?auto_1954102 ) ) ( not ( = ?auto_1954095 ?auto_1954103 ) ) ( not ( = ?auto_1954095 ?auto_1954104 ) ) ( not ( = ?auto_1954095 ?auto_1954110 ) ) ( not ( = ?auto_1954097 ?auto_1954098 ) ) ( not ( = ?auto_1954097 ?auto_1954099 ) ) ( not ( = ?auto_1954097 ?auto_1954100 ) ) ( not ( = ?auto_1954097 ?auto_1954101 ) ) ( not ( = ?auto_1954097 ?auto_1954102 ) ) ( not ( = ?auto_1954097 ?auto_1954103 ) ) ( not ( = ?auto_1954097 ?auto_1954104 ) ) ( not ( = ?auto_1954097 ?auto_1954110 ) ) ( not ( = ?auto_1954098 ?auto_1954099 ) ) ( not ( = ?auto_1954098 ?auto_1954100 ) ) ( not ( = ?auto_1954098 ?auto_1954101 ) ) ( not ( = ?auto_1954098 ?auto_1954102 ) ) ( not ( = ?auto_1954098 ?auto_1954103 ) ) ( not ( = ?auto_1954098 ?auto_1954104 ) ) ( not ( = ?auto_1954098 ?auto_1954110 ) ) ( not ( = ?auto_1954099 ?auto_1954100 ) ) ( not ( = ?auto_1954099 ?auto_1954101 ) ) ( not ( = ?auto_1954099 ?auto_1954102 ) ) ( not ( = ?auto_1954099 ?auto_1954103 ) ) ( not ( = ?auto_1954099 ?auto_1954104 ) ) ( not ( = ?auto_1954099 ?auto_1954110 ) ) ( not ( = ?auto_1954100 ?auto_1954101 ) ) ( not ( = ?auto_1954100 ?auto_1954102 ) ) ( not ( = ?auto_1954100 ?auto_1954103 ) ) ( not ( = ?auto_1954100 ?auto_1954104 ) ) ( not ( = ?auto_1954100 ?auto_1954110 ) ) ( not ( = ?auto_1954101 ?auto_1954102 ) ) ( not ( = ?auto_1954101 ?auto_1954103 ) ) ( not ( = ?auto_1954101 ?auto_1954104 ) ) ( not ( = ?auto_1954101 ?auto_1954110 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1954102 ?auto_1954103 ?auto_1954104 )
      ( MAKE-12CRATE-VERIFY ?auto_1954092 ?auto_1954093 ?auto_1954094 ?auto_1954096 ?auto_1954095 ?auto_1954097 ?auto_1954098 ?auto_1954099 ?auto_1954100 ?auto_1954101 ?auto_1954102 ?auto_1954103 ?auto_1954104 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1954255 - SURFACE
      ?auto_1954256 - SURFACE
      ?auto_1954257 - SURFACE
      ?auto_1954259 - SURFACE
      ?auto_1954258 - SURFACE
      ?auto_1954260 - SURFACE
      ?auto_1954261 - SURFACE
      ?auto_1954262 - SURFACE
      ?auto_1954263 - SURFACE
      ?auto_1954264 - SURFACE
      ?auto_1954265 - SURFACE
      ?auto_1954266 - SURFACE
      ?auto_1954267 - SURFACE
    )
    :vars
    (
      ?auto_1954269 - HOIST
      ?auto_1954268 - PLACE
      ?auto_1954273 - PLACE
      ?auto_1954272 - HOIST
      ?auto_1954270 - SURFACE
      ?auto_1954271 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1954269 ?auto_1954268 ) ( IS-CRATE ?auto_1954267 ) ( not ( = ?auto_1954266 ?auto_1954267 ) ) ( not ( = ?auto_1954265 ?auto_1954266 ) ) ( not ( = ?auto_1954265 ?auto_1954267 ) ) ( not ( = ?auto_1954273 ?auto_1954268 ) ) ( HOIST-AT ?auto_1954272 ?auto_1954273 ) ( not ( = ?auto_1954269 ?auto_1954272 ) ) ( AVAILABLE ?auto_1954272 ) ( SURFACE-AT ?auto_1954267 ?auto_1954273 ) ( ON ?auto_1954267 ?auto_1954270 ) ( CLEAR ?auto_1954267 ) ( not ( = ?auto_1954266 ?auto_1954270 ) ) ( not ( = ?auto_1954267 ?auto_1954270 ) ) ( not ( = ?auto_1954265 ?auto_1954270 ) ) ( TRUCK-AT ?auto_1954271 ?auto_1954268 ) ( SURFACE-AT ?auto_1954265 ?auto_1954268 ) ( CLEAR ?auto_1954265 ) ( IS-CRATE ?auto_1954266 ) ( AVAILABLE ?auto_1954269 ) ( IN ?auto_1954266 ?auto_1954271 ) ( ON ?auto_1954256 ?auto_1954255 ) ( ON ?auto_1954257 ?auto_1954256 ) ( ON ?auto_1954259 ?auto_1954257 ) ( ON ?auto_1954258 ?auto_1954259 ) ( ON ?auto_1954260 ?auto_1954258 ) ( ON ?auto_1954261 ?auto_1954260 ) ( ON ?auto_1954262 ?auto_1954261 ) ( ON ?auto_1954263 ?auto_1954262 ) ( ON ?auto_1954264 ?auto_1954263 ) ( ON ?auto_1954265 ?auto_1954264 ) ( not ( = ?auto_1954255 ?auto_1954256 ) ) ( not ( = ?auto_1954255 ?auto_1954257 ) ) ( not ( = ?auto_1954255 ?auto_1954259 ) ) ( not ( = ?auto_1954255 ?auto_1954258 ) ) ( not ( = ?auto_1954255 ?auto_1954260 ) ) ( not ( = ?auto_1954255 ?auto_1954261 ) ) ( not ( = ?auto_1954255 ?auto_1954262 ) ) ( not ( = ?auto_1954255 ?auto_1954263 ) ) ( not ( = ?auto_1954255 ?auto_1954264 ) ) ( not ( = ?auto_1954255 ?auto_1954265 ) ) ( not ( = ?auto_1954255 ?auto_1954266 ) ) ( not ( = ?auto_1954255 ?auto_1954267 ) ) ( not ( = ?auto_1954255 ?auto_1954270 ) ) ( not ( = ?auto_1954256 ?auto_1954257 ) ) ( not ( = ?auto_1954256 ?auto_1954259 ) ) ( not ( = ?auto_1954256 ?auto_1954258 ) ) ( not ( = ?auto_1954256 ?auto_1954260 ) ) ( not ( = ?auto_1954256 ?auto_1954261 ) ) ( not ( = ?auto_1954256 ?auto_1954262 ) ) ( not ( = ?auto_1954256 ?auto_1954263 ) ) ( not ( = ?auto_1954256 ?auto_1954264 ) ) ( not ( = ?auto_1954256 ?auto_1954265 ) ) ( not ( = ?auto_1954256 ?auto_1954266 ) ) ( not ( = ?auto_1954256 ?auto_1954267 ) ) ( not ( = ?auto_1954256 ?auto_1954270 ) ) ( not ( = ?auto_1954257 ?auto_1954259 ) ) ( not ( = ?auto_1954257 ?auto_1954258 ) ) ( not ( = ?auto_1954257 ?auto_1954260 ) ) ( not ( = ?auto_1954257 ?auto_1954261 ) ) ( not ( = ?auto_1954257 ?auto_1954262 ) ) ( not ( = ?auto_1954257 ?auto_1954263 ) ) ( not ( = ?auto_1954257 ?auto_1954264 ) ) ( not ( = ?auto_1954257 ?auto_1954265 ) ) ( not ( = ?auto_1954257 ?auto_1954266 ) ) ( not ( = ?auto_1954257 ?auto_1954267 ) ) ( not ( = ?auto_1954257 ?auto_1954270 ) ) ( not ( = ?auto_1954259 ?auto_1954258 ) ) ( not ( = ?auto_1954259 ?auto_1954260 ) ) ( not ( = ?auto_1954259 ?auto_1954261 ) ) ( not ( = ?auto_1954259 ?auto_1954262 ) ) ( not ( = ?auto_1954259 ?auto_1954263 ) ) ( not ( = ?auto_1954259 ?auto_1954264 ) ) ( not ( = ?auto_1954259 ?auto_1954265 ) ) ( not ( = ?auto_1954259 ?auto_1954266 ) ) ( not ( = ?auto_1954259 ?auto_1954267 ) ) ( not ( = ?auto_1954259 ?auto_1954270 ) ) ( not ( = ?auto_1954258 ?auto_1954260 ) ) ( not ( = ?auto_1954258 ?auto_1954261 ) ) ( not ( = ?auto_1954258 ?auto_1954262 ) ) ( not ( = ?auto_1954258 ?auto_1954263 ) ) ( not ( = ?auto_1954258 ?auto_1954264 ) ) ( not ( = ?auto_1954258 ?auto_1954265 ) ) ( not ( = ?auto_1954258 ?auto_1954266 ) ) ( not ( = ?auto_1954258 ?auto_1954267 ) ) ( not ( = ?auto_1954258 ?auto_1954270 ) ) ( not ( = ?auto_1954260 ?auto_1954261 ) ) ( not ( = ?auto_1954260 ?auto_1954262 ) ) ( not ( = ?auto_1954260 ?auto_1954263 ) ) ( not ( = ?auto_1954260 ?auto_1954264 ) ) ( not ( = ?auto_1954260 ?auto_1954265 ) ) ( not ( = ?auto_1954260 ?auto_1954266 ) ) ( not ( = ?auto_1954260 ?auto_1954267 ) ) ( not ( = ?auto_1954260 ?auto_1954270 ) ) ( not ( = ?auto_1954261 ?auto_1954262 ) ) ( not ( = ?auto_1954261 ?auto_1954263 ) ) ( not ( = ?auto_1954261 ?auto_1954264 ) ) ( not ( = ?auto_1954261 ?auto_1954265 ) ) ( not ( = ?auto_1954261 ?auto_1954266 ) ) ( not ( = ?auto_1954261 ?auto_1954267 ) ) ( not ( = ?auto_1954261 ?auto_1954270 ) ) ( not ( = ?auto_1954262 ?auto_1954263 ) ) ( not ( = ?auto_1954262 ?auto_1954264 ) ) ( not ( = ?auto_1954262 ?auto_1954265 ) ) ( not ( = ?auto_1954262 ?auto_1954266 ) ) ( not ( = ?auto_1954262 ?auto_1954267 ) ) ( not ( = ?auto_1954262 ?auto_1954270 ) ) ( not ( = ?auto_1954263 ?auto_1954264 ) ) ( not ( = ?auto_1954263 ?auto_1954265 ) ) ( not ( = ?auto_1954263 ?auto_1954266 ) ) ( not ( = ?auto_1954263 ?auto_1954267 ) ) ( not ( = ?auto_1954263 ?auto_1954270 ) ) ( not ( = ?auto_1954264 ?auto_1954265 ) ) ( not ( = ?auto_1954264 ?auto_1954266 ) ) ( not ( = ?auto_1954264 ?auto_1954267 ) ) ( not ( = ?auto_1954264 ?auto_1954270 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1954265 ?auto_1954266 ?auto_1954267 )
      ( MAKE-12CRATE-VERIFY ?auto_1954255 ?auto_1954256 ?auto_1954257 ?auto_1954259 ?auto_1954258 ?auto_1954260 ?auto_1954261 ?auto_1954262 ?auto_1954263 ?auto_1954264 ?auto_1954265 ?auto_1954266 ?auto_1954267 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1965834 - SURFACE
      ?auto_1965835 - SURFACE
      ?auto_1965836 - SURFACE
      ?auto_1965838 - SURFACE
      ?auto_1965837 - SURFACE
      ?auto_1965839 - SURFACE
      ?auto_1965840 - SURFACE
      ?auto_1965841 - SURFACE
      ?auto_1965842 - SURFACE
      ?auto_1965843 - SURFACE
      ?auto_1965844 - SURFACE
      ?auto_1965845 - SURFACE
      ?auto_1965846 - SURFACE
      ?auto_1965847 - SURFACE
    )
    :vars
    (
      ?auto_1965848 - HOIST
      ?auto_1965849 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1965848 ?auto_1965849 ) ( SURFACE-AT ?auto_1965846 ?auto_1965849 ) ( CLEAR ?auto_1965846 ) ( LIFTING ?auto_1965848 ?auto_1965847 ) ( IS-CRATE ?auto_1965847 ) ( not ( = ?auto_1965846 ?auto_1965847 ) ) ( ON ?auto_1965835 ?auto_1965834 ) ( ON ?auto_1965836 ?auto_1965835 ) ( ON ?auto_1965838 ?auto_1965836 ) ( ON ?auto_1965837 ?auto_1965838 ) ( ON ?auto_1965839 ?auto_1965837 ) ( ON ?auto_1965840 ?auto_1965839 ) ( ON ?auto_1965841 ?auto_1965840 ) ( ON ?auto_1965842 ?auto_1965841 ) ( ON ?auto_1965843 ?auto_1965842 ) ( ON ?auto_1965844 ?auto_1965843 ) ( ON ?auto_1965845 ?auto_1965844 ) ( ON ?auto_1965846 ?auto_1965845 ) ( not ( = ?auto_1965834 ?auto_1965835 ) ) ( not ( = ?auto_1965834 ?auto_1965836 ) ) ( not ( = ?auto_1965834 ?auto_1965838 ) ) ( not ( = ?auto_1965834 ?auto_1965837 ) ) ( not ( = ?auto_1965834 ?auto_1965839 ) ) ( not ( = ?auto_1965834 ?auto_1965840 ) ) ( not ( = ?auto_1965834 ?auto_1965841 ) ) ( not ( = ?auto_1965834 ?auto_1965842 ) ) ( not ( = ?auto_1965834 ?auto_1965843 ) ) ( not ( = ?auto_1965834 ?auto_1965844 ) ) ( not ( = ?auto_1965834 ?auto_1965845 ) ) ( not ( = ?auto_1965834 ?auto_1965846 ) ) ( not ( = ?auto_1965834 ?auto_1965847 ) ) ( not ( = ?auto_1965835 ?auto_1965836 ) ) ( not ( = ?auto_1965835 ?auto_1965838 ) ) ( not ( = ?auto_1965835 ?auto_1965837 ) ) ( not ( = ?auto_1965835 ?auto_1965839 ) ) ( not ( = ?auto_1965835 ?auto_1965840 ) ) ( not ( = ?auto_1965835 ?auto_1965841 ) ) ( not ( = ?auto_1965835 ?auto_1965842 ) ) ( not ( = ?auto_1965835 ?auto_1965843 ) ) ( not ( = ?auto_1965835 ?auto_1965844 ) ) ( not ( = ?auto_1965835 ?auto_1965845 ) ) ( not ( = ?auto_1965835 ?auto_1965846 ) ) ( not ( = ?auto_1965835 ?auto_1965847 ) ) ( not ( = ?auto_1965836 ?auto_1965838 ) ) ( not ( = ?auto_1965836 ?auto_1965837 ) ) ( not ( = ?auto_1965836 ?auto_1965839 ) ) ( not ( = ?auto_1965836 ?auto_1965840 ) ) ( not ( = ?auto_1965836 ?auto_1965841 ) ) ( not ( = ?auto_1965836 ?auto_1965842 ) ) ( not ( = ?auto_1965836 ?auto_1965843 ) ) ( not ( = ?auto_1965836 ?auto_1965844 ) ) ( not ( = ?auto_1965836 ?auto_1965845 ) ) ( not ( = ?auto_1965836 ?auto_1965846 ) ) ( not ( = ?auto_1965836 ?auto_1965847 ) ) ( not ( = ?auto_1965838 ?auto_1965837 ) ) ( not ( = ?auto_1965838 ?auto_1965839 ) ) ( not ( = ?auto_1965838 ?auto_1965840 ) ) ( not ( = ?auto_1965838 ?auto_1965841 ) ) ( not ( = ?auto_1965838 ?auto_1965842 ) ) ( not ( = ?auto_1965838 ?auto_1965843 ) ) ( not ( = ?auto_1965838 ?auto_1965844 ) ) ( not ( = ?auto_1965838 ?auto_1965845 ) ) ( not ( = ?auto_1965838 ?auto_1965846 ) ) ( not ( = ?auto_1965838 ?auto_1965847 ) ) ( not ( = ?auto_1965837 ?auto_1965839 ) ) ( not ( = ?auto_1965837 ?auto_1965840 ) ) ( not ( = ?auto_1965837 ?auto_1965841 ) ) ( not ( = ?auto_1965837 ?auto_1965842 ) ) ( not ( = ?auto_1965837 ?auto_1965843 ) ) ( not ( = ?auto_1965837 ?auto_1965844 ) ) ( not ( = ?auto_1965837 ?auto_1965845 ) ) ( not ( = ?auto_1965837 ?auto_1965846 ) ) ( not ( = ?auto_1965837 ?auto_1965847 ) ) ( not ( = ?auto_1965839 ?auto_1965840 ) ) ( not ( = ?auto_1965839 ?auto_1965841 ) ) ( not ( = ?auto_1965839 ?auto_1965842 ) ) ( not ( = ?auto_1965839 ?auto_1965843 ) ) ( not ( = ?auto_1965839 ?auto_1965844 ) ) ( not ( = ?auto_1965839 ?auto_1965845 ) ) ( not ( = ?auto_1965839 ?auto_1965846 ) ) ( not ( = ?auto_1965839 ?auto_1965847 ) ) ( not ( = ?auto_1965840 ?auto_1965841 ) ) ( not ( = ?auto_1965840 ?auto_1965842 ) ) ( not ( = ?auto_1965840 ?auto_1965843 ) ) ( not ( = ?auto_1965840 ?auto_1965844 ) ) ( not ( = ?auto_1965840 ?auto_1965845 ) ) ( not ( = ?auto_1965840 ?auto_1965846 ) ) ( not ( = ?auto_1965840 ?auto_1965847 ) ) ( not ( = ?auto_1965841 ?auto_1965842 ) ) ( not ( = ?auto_1965841 ?auto_1965843 ) ) ( not ( = ?auto_1965841 ?auto_1965844 ) ) ( not ( = ?auto_1965841 ?auto_1965845 ) ) ( not ( = ?auto_1965841 ?auto_1965846 ) ) ( not ( = ?auto_1965841 ?auto_1965847 ) ) ( not ( = ?auto_1965842 ?auto_1965843 ) ) ( not ( = ?auto_1965842 ?auto_1965844 ) ) ( not ( = ?auto_1965842 ?auto_1965845 ) ) ( not ( = ?auto_1965842 ?auto_1965846 ) ) ( not ( = ?auto_1965842 ?auto_1965847 ) ) ( not ( = ?auto_1965843 ?auto_1965844 ) ) ( not ( = ?auto_1965843 ?auto_1965845 ) ) ( not ( = ?auto_1965843 ?auto_1965846 ) ) ( not ( = ?auto_1965843 ?auto_1965847 ) ) ( not ( = ?auto_1965844 ?auto_1965845 ) ) ( not ( = ?auto_1965844 ?auto_1965846 ) ) ( not ( = ?auto_1965844 ?auto_1965847 ) ) ( not ( = ?auto_1965845 ?auto_1965846 ) ) ( not ( = ?auto_1965845 ?auto_1965847 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1965846 ?auto_1965847 )
      ( MAKE-13CRATE-VERIFY ?auto_1965834 ?auto_1965835 ?auto_1965836 ?auto_1965838 ?auto_1965837 ?auto_1965839 ?auto_1965840 ?auto_1965841 ?auto_1965842 ?auto_1965843 ?auto_1965844 ?auto_1965845 ?auto_1965846 ?auto_1965847 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1965976 - SURFACE
      ?auto_1965977 - SURFACE
      ?auto_1965978 - SURFACE
      ?auto_1965980 - SURFACE
      ?auto_1965979 - SURFACE
      ?auto_1965981 - SURFACE
      ?auto_1965982 - SURFACE
      ?auto_1965983 - SURFACE
      ?auto_1965984 - SURFACE
      ?auto_1965985 - SURFACE
      ?auto_1965986 - SURFACE
      ?auto_1965987 - SURFACE
      ?auto_1965988 - SURFACE
      ?auto_1965989 - SURFACE
    )
    :vars
    (
      ?auto_1965990 - HOIST
      ?auto_1965991 - PLACE
      ?auto_1965992 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1965990 ?auto_1965991 ) ( SURFACE-AT ?auto_1965988 ?auto_1965991 ) ( CLEAR ?auto_1965988 ) ( IS-CRATE ?auto_1965989 ) ( not ( = ?auto_1965988 ?auto_1965989 ) ) ( TRUCK-AT ?auto_1965992 ?auto_1965991 ) ( AVAILABLE ?auto_1965990 ) ( IN ?auto_1965989 ?auto_1965992 ) ( ON ?auto_1965988 ?auto_1965987 ) ( not ( = ?auto_1965987 ?auto_1965988 ) ) ( not ( = ?auto_1965987 ?auto_1965989 ) ) ( ON ?auto_1965977 ?auto_1965976 ) ( ON ?auto_1965978 ?auto_1965977 ) ( ON ?auto_1965980 ?auto_1965978 ) ( ON ?auto_1965979 ?auto_1965980 ) ( ON ?auto_1965981 ?auto_1965979 ) ( ON ?auto_1965982 ?auto_1965981 ) ( ON ?auto_1965983 ?auto_1965982 ) ( ON ?auto_1965984 ?auto_1965983 ) ( ON ?auto_1965985 ?auto_1965984 ) ( ON ?auto_1965986 ?auto_1965985 ) ( ON ?auto_1965987 ?auto_1965986 ) ( not ( = ?auto_1965976 ?auto_1965977 ) ) ( not ( = ?auto_1965976 ?auto_1965978 ) ) ( not ( = ?auto_1965976 ?auto_1965980 ) ) ( not ( = ?auto_1965976 ?auto_1965979 ) ) ( not ( = ?auto_1965976 ?auto_1965981 ) ) ( not ( = ?auto_1965976 ?auto_1965982 ) ) ( not ( = ?auto_1965976 ?auto_1965983 ) ) ( not ( = ?auto_1965976 ?auto_1965984 ) ) ( not ( = ?auto_1965976 ?auto_1965985 ) ) ( not ( = ?auto_1965976 ?auto_1965986 ) ) ( not ( = ?auto_1965976 ?auto_1965987 ) ) ( not ( = ?auto_1965976 ?auto_1965988 ) ) ( not ( = ?auto_1965976 ?auto_1965989 ) ) ( not ( = ?auto_1965977 ?auto_1965978 ) ) ( not ( = ?auto_1965977 ?auto_1965980 ) ) ( not ( = ?auto_1965977 ?auto_1965979 ) ) ( not ( = ?auto_1965977 ?auto_1965981 ) ) ( not ( = ?auto_1965977 ?auto_1965982 ) ) ( not ( = ?auto_1965977 ?auto_1965983 ) ) ( not ( = ?auto_1965977 ?auto_1965984 ) ) ( not ( = ?auto_1965977 ?auto_1965985 ) ) ( not ( = ?auto_1965977 ?auto_1965986 ) ) ( not ( = ?auto_1965977 ?auto_1965987 ) ) ( not ( = ?auto_1965977 ?auto_1965988 ) ) ( not ( = ?auto_1965977 ?auto_1965989 ) ) ( not ( = ?auto_1965978 ?auto_1965980 ) ) ( not ( = ?auto_1965978 ?auto_1965979 ) ) ( not ( = ?auto_1965978 ?auto_1965981 ) ) ( not ( = ?auto_1965978 ?auto_1965982 ) ) ( not ( = ?auto_1965978 ?auto_1965983 ) ) ( not ( = ?auto_1965978 ?auto_1965984 ) ) ( not ( = ?auto_1965978 ?auto_1965985 ) ) ( not ( = ?auto_1965978 ?auto_1965986 ) ) ( not ( = ?auto_1965978 ?auto_1965987 ) ) ( not ( = ?auto_1965978 ?auto_1965988 ) ) ( not ( = ?auto_1965978 ?auto_1965989 ) ) ( not ( = ?auto_1965980 ?auto_1965979 ) ) ( not ( = ?auto_1965980 ?auto_1965981 ) ) ( not ( = ?auto_1965980 ?auto_1965982 ) ) ( not ( = ?auto_1965980 ?auto_1965983 ) ) ( not ( = ?auto_1965980 ?auto_1965984 ) ) ( not ( = ?auto_1965980 ?auto_1965985 ) ) ( not ( = ?auto_1965980 ?auto_1965986 ) ) ( not ( = ?auto_1965980 ?auto_1965987 ) ) ( not ( = ?auto_1965980 ?auto_1965988 ) ) ( not ( = ?auto_1965980 ?auto_1965989 ) ) ( not ( = ?auto_1965979 ?auto_1965981 ) ) ( not ( = ?auto_1965979 ?auto_1965982 ) ) ( not ( = ?auto_1965979 ?auto_1965983 ) ) ( not ( = ?auto_1965979 ?auto_1965984 ) ) ( not ( = ?auto_1965979 ?auto_1965985 ) ) ( not ( = ?auto_1965979 ?auto_1965986 ) ) ( not ( = ?auto_1965979 ?auto_1965987 ) ) ( not ( = ?auto_1965979 ?auto_1965988 ) ) ( not ( = ?auto_1965979 ?auto_1965989 ) ) ( not ( = ?auto_1965981 ?auto_1965982 ) ) ( not ( = ?auto_1965981 ?auto_1965983 ) ) ( not ( = ?auto_1965981 ?auto_1965984 ) ) ( not ( = ?auto_1965981 ?auto_1965985 ) ) ( not ( = ?auto_1965981 ?auto_1965986 ) ) ( not ( = ?auto_1965981 ?auto_1965987 ) ) ( not ( = ?auto_1965981 ?auto_1965988 ) ) ( not ( = ?auto_1965981 ?auto_1965989 ) ) ( not ( = ?auto_1965982 ?auto_1965983 ) ) ( not ( = ?auto_1965982 ?auto_1965984 ) ) ( not ( = ?auto_1965982 ?auto_1965985 ) ) ( not ( = ?auto_1965982 ?auto_1965986 ) ) ( not ( = ?auto_1965982 ?auto_1965987 ) ) ( not ( = ?auto_1965982 ?auto_1965988 ) ) ( not ( = ?auto_1965982 ?auto_1965989 ) ) ( not ( = ?auto_1965983 ?auto_1965984 ) ) ( not ( = ?auto_1965983 ?auto_1965985 ) ) ( not ( = ?auto_1965983 ?auto_1965986 ) ) ( not ( = ?auto_1965983 ?auto_1965987 ) ) ( not ( = ?auto_1965983 ?auto_1965988 ) ) ( not ( = ?auto_1965983 ?auto_1965989 ) ) ( not ( = ?auto_1965984 ?auto_1965985 ) ) ( not ( = ?auto_1965984 ?auto_1965986 ) ) ( not ( = ?auto_1965984 ?auto_1965987 ) ) ( not ( = ?auto_1965984 ?auto_1965988 ) ) ( not ( = ?auto_1965984 ?auto_1965989 ) ) ( not ( = ?auto_1965985 ?auto_1965986 ) ) ( not ( = ?auto_1965985 ?auto_1965987 ) ) ( not ( = ?auto_1965985 ?auto_1965988 ) ) ( not ( = ?auto_1965985 ?auto_1965989 ) ) ( not ( = ?auto_1965986 ?auto_1965987 ) ) ( not ( = ?auto_1965986 ?auto_1965988 ) ) ( not ( = ?auto_1965986 ?auto_1965989 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1965987 ?auto_1965988 ?auto_1965989 )
      ( MAKE-13CRATE-VERIFY ?auto_1965976 ?auto_1965977 ?auto_1965978 ?auto_1965980 ?auto_1965979 ?auto_1965981 ?auto_1965982 ?auto_1965983 ?auto_1965984 ?auto_1965985 ?auto_1965986 ?auto_1965987 ?auto_1965988 ?auto_1965989 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1966132 - SURFACE
      ?auto_1966133 - SURFACE
      ?auto_1966134 - SURFACE
      ?auto_1966136 - SURFACE
      ?auto_1966135 - SURFACE
      ?auto_1966137 - SURFACE
      ?auto_1966138 - SURFACE
      ?auto_1966139 - SURFACE
      ?auto_1966140 - SURFACE
      ?auto_1966141 - SURFACE
      ?auto_1966142 - SURFACE
      ?auto_1966143 - SURFACE
      ?auto_1966144 - SURFACE
      ?auto_1966145 - SURFACE
    )
    :vars
    (
      ?auto_1966146 - HOIST
      ?auto_1966148 - PLACE
      ?auto_1966147 - TRUCK
      ?auto_1966149 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1966146 ?auto_1966148 ) ( SURFACE-AT ?auto_1966144 ?auto_1966148 ) ( CLEAR ?auto_1966144 ) ( IS-CRATE ?auto_1966145 ) ( not ( = ?auto_1966144 ?auto_1966145 ) ) ( AVAILABLE ?auto_1966146 ) ( IN ?auto_1966145 ?auto_1966147 ) ( ON ?auto_1966144 ?auto_1966143 ) ( not ( = ?auto_1966143 ?auto_1966144 ) ) ( not ( = ?auto_1966143 ?auto_1966145 ) ) ( TRUCK-AT ?auto_1966147 ?auto_1966149 ) ( not ( = ?auto_1966149 ?auto_1966148 ) ) ( ON ?auto_1966133 ?auto_1966132 ) ( ON ?auto_1966134 ?auto_1966133 ) ( ON ?auto_1966136 ?auto_1966134 ) ( ON ?auto_1966135 ?auto_1966136 ) ( ON ?auto_1966137 ?auto_1966135 ) ( ON ?auto_1966138 ?auto_1966137 ) ( ON ?auto_1966139 ?auto_1966138 ) ( ON ?auto_1966140 ?auto_1966139 ) ( ON ?auto_1966141 ?auto_1966140 ) ( ON ?auto_1966142 ?auto_1966141 ) ( ON ?auto_1966143 ?auto_1966142 ) ( not ( = ?auto_1966132 ?auto_1966133 ) ) ( not ( = ?auto_1966132 ?auto_1966134 ) ) ( not ( = ?auto_1966132 ?auto_1966136 ) ) ( not ( = ?auto_1966132 ?auto_1966135 ) ) ( not ( = ?auto_1966132 ?auto_1966137 ) ) ( not ( = ?auto_1966132 ?auto_1966138 ) ) ( not ( = ?auto_1966132 ?auto_1966139 ) ) ( not ( = ?auto_1966132 ?auto_1966140 ) ) ( not ( = ?auto_1966132 ?auto_1966141 ) ) ( not ( = ?auto_1966132 ?auto_1966142 ) ) ( not ( = ?auto_1966132 ?auto_1966143 ) ) ( not ( = ?auto_1966132 ?auto_1966144 ) ) ( not ( = ?auto_1966132 ?auto_1966145 ) ) ( not ( = ?auto_1966133 ?auto_1966134 ) ) ( not ( = ?auto_1966133 ?auto_1966136 ) ) ( not ( = ?auto_1966133 ?auto_1966135 ) ) ( not ( = ?auto_1966133 ?auto_1966137 ) ) ( not ( = ?auto_1966133 ?auto_1966138 ) ) ( not ( = ?auto_1966133 ?auto_1966139 ) ) ( not ( = ?auto_1966133 ?auto_1966140 ) ) ( not ( = ?auto_1966133 ?auto_1966141 ) ) ( not ( = ?auto_1966133 ?auto_1966142 ) ) ( not ( = ?auto_1966133 ?auto_1966143 ) ) ( not ( = ?auto_1966133 ?auto_1966144 ) ) ( not ( = ?auto_1966133 ?auto_1966145 ) ) ( not ( = ?auto_1966134 ?auto_1966136 ) ) ( not ( = ?auto_1966134 ?auto_1966135 ) ) ( not ( = ?auto_1966134 ?auto_1966137 ) ) ( not ( = ?auto_1966134 ?auto_1966138 ) ) ( not ( = ?auto_1966134 ?auto_1966139 ) ) ( not ( = ?auto_1966134 ?auto_1966140 ) ) ( not ( = ?auto_1966134 ?auto_1966141 ) ) ( not ( = ?auto_1966134 ?auto_1966142 ) ) ( not ( = ?auto_1966134 ?auto_1966143 ) ) ( not ( = ?auto_1966134 ?auto_1966144 ) ) ( not ( = ?auto_1966134 ?auto_1966145 ) ) ( not ( = ?auto_1966136 ?auto_1966135 ) ) ( not ( = ?auto_1966136 ?auto_1966137 ) ) ( not ( = ?auto_1966136 ?auto_1966138 ) ) ( not ( = ?auto_1966136 ?auto_1966139 ) ) ( not ( = ?auto_1966136 ?auto_1966140 ) ) ( not ( = ?auto_1966136 ?auto_1966141 ) ) ( not ( = ?auto_1966136 ?auto_1966142 ) ) ( not ( = ?auto_1966136 ?auto_1966143 ) ) ( not ( = ?auto_1966136 ?auto_1966144 ) ) ( not ( = ?auto_1966136 ?auto_1966145 ) ) ( not ( = ?auto_1966135 ?auto_1966137 ) ) ( not ( = ?auto_1966135 ?auto_1966138 ) ) ( not ( = ?auto_1966135 ?auto_1966139 ) ) ( not ( = ?auto_1966135 ?auto_1966140 ) ) ( not ( = ?auto_1966135 ?auto_1966141 ) ) ( not ( = ?auto_1966135 ?auto_1966142 ) ) ( not ( = ?auto_1966135 ?auto_1966143 ) ) ( not ( = ?auto_1966135 ?auto_1966144 ) ) ( not ( = ?auto_1966135 ?auto_1966145 ) ) ( not ( = ?auto_1966137 ?auto_1966138 ) ) ( not ( = ?auto_1966137 ?auto_1966139 ) ) ( not ( = ?auto_1966137 ?auto_1966140 ) ) ( not ( = ?auto_1966137 ?auto_1966141 ) ) ( not ( = ?auto_1966137 ?auto_1966142 ) ) ( not ( = ?auto_1966137 ?auto_1966143 ) ) ( not ( = ?auto_1966137 ?auto_1966144 ) ) ( not ( = ?auto_1966137 ?auto_1966145 ) ) ( not ( = ?auto_1966138 ?auto_1966139 ) ) ( not ( = ?auto_1966138 ?auto_1966140 ) ) ( not ( = ?auto_1966138 ?auto_1966141 ) ) ( not ( = ?auto_1966138 ?auto_1966142 ) ) ( not ( = ?auto_1966138 ?auto_1966143 ) ) ( not ( = ?auto_1966138 ?auto_1966144 ) ) ( not ( = ?auto_1966138 ?auto_1966145 ) ) ( not ( = ?auto_1966139 ?auto_1966140 ) ) ( not ( = ?auto_1966139 ?auto_1966141 ) ) ( not ( = ?auto_1966139 ?auto_1966142 ) ) ( not ( = ?auto_1966139 ?auto_1966143 ) ) ( not ( = ?auto_1966139 ?auto_1966144 ) ) ( not ( = ?auto_1966139 ?auto_1966145 ) ) ( not ( = ?auto_1966140 ?auto_1966141 ) ) ( not ( = ?auto_1966140 ?auto_1966142 ) ) ( not ( = ?auto_1966140 ?auto_1966143 ) ) ( not ( = ?auto_1966140 ?auto_1966144 ) ) ( not ( = ?auto_1966140 ?auto_1966145 ) ) ( not ( = ?auto_1966141 ?auto_1966142 ) ) ( not ( = ?auto_1966141 ?auto_1966143 ) ) ( not ( = ?auto_1966141 ?auto_1966144 ) ) ( not ( = ?auto_1966141 ?auto_1966145 ) ) ( not ( = ?auto_1966142 ?auto_1966143 ) ) ( not ( = ?auto_1966142 ?auto_1966144 ) ) ( not ( = ?auto_1966142 ?auto_1966145 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1966143 ?auto_1966144 ?auto_1966145 )
      ( MAKE-13CRATE-VERIFY ?auto_1966132 ?auto_1966133 ?auto_1966134 ?auto_1966136 ?auto_1966135 ?auto_1966137 ?auto_1966138 ?auto_1966139 ?auto_1966140 ?auto_1966141 ?auto_1966142 ?auto_1966143 ?auto_1966144 ?auto_1966145 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1966301 - SURFACE
      ?auto_1966302 - SURFACE
      ?auto_1966303 - SURFACE
      ?auto_1966305 - SURFACE
      ?auto_1966304 - SURFACE
      ?auto_1966306 - SURFACE
      ?auto_1966307 - SURFACE
      ?auto_1966308 - SURFACE
      ?auto_1966309 - SURFACE
      ?auto_1966310 - SURFACE
      ?auto_1966311 - SURFACE
      ?auto_1966312 - SURFACE
      ?auto_1966313 - SURFACE
      ?auto_1966314 - SURFACE
    )
    :vars
    (
      ?auto_1966315 - HOIST
      ?auto_1966319 - PLACE
      ?auto_1966318 - TRUCK
      ?auto_1966316 - PLACE
      ?auto_1966317 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1966315 ?auto_1966319 ) ( SURFACE-AT ?auto_1966313 ?auto_1966319 ) ( CLEAR ?auto_1966313 ) ( IS-CRATE ?auto_1966314 ) ( not ( = ?auto_1966313 ?auto_1966314 ) ) ( AVAILABLE ?auto_1966315 ) ( ON ?auto_1966313 ?auto_1966312 ) ( not ( = ?auto_1966312 ?auto_1966313 ) ) ( not ( = ?auto_1966312 ?auto_1966314 ) ) ( TRUCK-AT ?auto_1966318 ?auto_1966316 ) ( not ( = ?auto_1966316 ?auto_1966319 ) ) ( HOIST-AT ?auto_1966317 ?auto_1966316 ) ( LIFTING ?auto_1966317 ?auto_1966314 ) ( not ( = ?auto_1966315 ?auto_1966317 ) ) ( ON ?auto_1966302 ?auto_1966301 ) ( ON ?auto_1966303 ?auto_1966302 ) ( ON ?auto_1966305 ?auto_1966303 ) ( ON ?auto_1966304 ?auto_1966305 ) ( ON ?auto_1966306 ?auto_1966304 ) ( ON ?auto_1966307 ?auto_1966306 ) ( ON ?auto_1966308 ?auto_1966307 ) ( ON ?auto_1966309 ?auto_1966308 ) ( ON ?auto_1966310 ?auto_1966309 ) ( ON ?auto_1966311 ?auto_1966310 ) ( ON ?auto_1966312 ?auto_1966311 ) ( not ( = ?auto_1966301 ?auto_1966302 ) ) ( not ( = ?auto_1966301 ?auto_1966303 ) ) ( not ( = ?auto_1966301 ?auto_1966305 ) ) ( not ( = ?auto_1966301 ?auto_1966304 ) ) ( not ( = ?auto_1966301 ?auto_1966306 ) ) ( not ( = ?auto_1966301 ?auto_1966307 ) ) ( not ( = ?auto_1966301 ?auto_1966308 ) ) ( not ( = ?auto_1966301 ?auto_1966309 ) ) ( not ( = ?auto_1966301 ?auto_1966310 ) ) ( not ( = ?auto_1966301 ?auto_1966311 ) ) ( not ( = ?auto_1966301 ?auto_1966312 ) ) ( not ( = ?auto_1966301 ?auto_1966313 ) ) ( not ( = ?auto_1966301 ?auto_1966314 ) ) ( not ( = ?auto_1966302 ?auto_1966303 ) ) ( not ( = ?auto_1966302 ?auto_1966305 ) ) ( not ( = ?auto_1966302 ?auto_1966304 ) ) ( not ( = ?auto_1966302 ?auto_1966306 ) ) ( not ( = ?auto_1966302 ?auto_1966307 ) ) ( not ( = ?auto_1966302 ?auto_1966308 ) ) ( not ( = ?auto_1966302 ?auto_1966309 ) ) ( not ( = ?auto_1966302 ?auto_1966310 ) ) ( not ( = ?auto_1966302 ?auto_1966311 ) ) ( not ( = ?auto_1966302 ?auto_1966312 ) ) ( not ( = ?auto_1966302 ?auto_1966313 ) ) ( not ( = ?auto_1966302 ?auto_1966314 ) ) ( not ( = ?auto_1966303 ?auto_1966305 ) ) ( not ( = ?auto_1966303 ?auto_1966304 ) ) ( not ( = ?auto_1966303 ?auto_1966306 ) ) ( not ( = ?auto_1966303 ?auto_1966307 ) ) ( not ( = ?auto_1966303 ?auto_1966308 ) ) ( not ( = ?auto_1966303 ?auto_1966309 ) ) ( not ( = ?auto_1966303 ?auto_1966310 ) ) ( not ( = ?auto_1966303 ?auto_1966311 ) ) ( not ( = ?auto_1966303 ?auto_1966312 ) ) ( not ( = ?auto_1966303 ?auto_1966313 ) ) ( not ( = ?auto_1966303 ?auto_1966314 ) ) ( not ( = ?auto_1966305 ?auto_1966304 ) ) ( not ( = ?auto_1966305 ?auto_1966306 ) ) ( not ( = ?auto_1966305 ?auto_1966307 ) ) ( not ( = ?auto_1966305 ?auto_1966308 ) ) ( not ( = ?auto_1966305 ?auto_1966309 ) ) ( not ( = ?auto_1966305 ?auto_1966310 ) ) ( not ( = ?auto_1966305 ?auto_1966311 ) ) ( not ( = ?auto_1966305 ?auto_1966312 ) ) ( not ( = ?auto_1966305 ?auto_1966313 ) ) ( not ( = ?auto_1966305 ?auto_1966314 ) ) ( not ( = ?auto_1966304 ?auto_1966306 ) ) ( not ( = ?auto_1966304 ?auto_1966307 ) ) ( not ( = ?auto_1966304 ?auto_1966308 ) ) ( not ( = ?auto_1966304 ?auto_1966309 ) ) ( not ( = ?auto_1966304 ?auto_1966310 ) ) ( not ( = ?auto_1966304 ?auto_1966311 ) ) ( not ( = ?auto_1966304 ?auto_1966312 ) ) ( not ( = ?auto_1966304 ?auto_1966313 ) ) ( not ( = ?auto_1966304 ?auto_1966314 ) ) ( not ( = ?auto_1966306 ?auto_1966307 ) ) ( not ( = ?auto_1966306 ?auto_1966308 ) ) ( not ( = ?auto_1966306 ?auto_1966309 ) ) ( not ( = ?auto_1966306 ?auto_1966310 ) ) ( not ( = ?auto_1966306 ?auto_1966311 ) ) ( not ( = ?auto_1966306 ?auto_1966312 ) ) ( not ( = ?auto_1966306 ?auto_1966313 ) ) ( not ( = ?auto_1966306 ?auto_1966314 ) ) ( not ( = ?auto_1966307 ?auto_1966308 ) ) ( not ( = ?auto_1966307 ?auto_1966309 ) ) ( not ( = ?auto_1966307 ?auto_1966310 ) ) ( not ( = ?auto_1966307 ?auto_1966311 ) ) ( not ( = ?auto_1966307 ?auto_1966312 ) ) ( not ( = ?auto_1966307 ?auto_1966313 ) ) ( not ( = ?auto_1966307 ?auto_1966314 ) ) ( not ( = ?auto_1966308 ?auto_1966309 ) ) ( not ( = ?auto_1966308 ?auto_1966310 ) ) ( not ( = ?auto_1966308 ?auto_1966311 ) ) ( not ( = ?auto_1966308 ?auto_1966312 ) ) ( not ( = ?auto_1966308 ?auto_1966313 ) ) ( not ( = ?auto_1966308 ?auto_1966314 ) ) ( not ( = ?auto_1966309 ?auto_1966310 ) ) ( not ( = ?auto_1966309 ?auto_1966311 ) ) ( not ( = ?auto_1966309 ?auto_1966312 ) ) ( not ( = ?auto_1966309 ?auto_1966313 ) ) ( not ( = ?auto_1966309 ?auto_1966314 ) ) ( not ( = ?auto_1966310 ?auto_1966311 ) ) ( not ( = ?auto_1966310 ?auto_1966312 ) ) ( not ( = ?auto_1966310 ?auto_1966313 ) ) ( not ( = ?auto_1966310 ?auto_1966314 ) ) ( not ( = ?auto_1966311 ?auto_1966312 ) ) ( not ( = ?auto_1966311 ?auto_1966313 ) ) ( not ( = ?auto_1966311 ?auto_1966314 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1966312 ?auto_1966313 ?auto_1966314 )
      ( MAKE-13CRATE-VERIFY ?auto_1966301 ?auto_1966302 ?auto_1966303 ?auto_1966305 ?auto_1966304 ?auto_1966306 ?auto_1966307 ?auto_1966308 ?auto_1966309 ?auto_1966310 ?auto_1966311 ?auto_1966312 ?auto_1966313 ?auto_1966314 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1966483 - SURFACE
      ?auto_1966484 - SURFACE
      ?auto_1966485 - SURFACE
      ?auto_1966487 - SURFACE
      ?auto_1966486 - SURFACE
      ?auto_1966488 - SURFACE
      ?auto_1966489 - SURFACE
      ?auto_1966490 - SURFACE
      ?auto_1966491 - SURFACE
      ?auto_1966492 - SURFACE
      ?auto_1966493 - SURFACE
      ?auto_1966494 - SURFACE
      ?auto_1966495 - SURFACE
      ?auto_1966496 - SURFACE
    )
    :vars
    (
      ?auto_1966497 - HOIST
      ?auto_1966501 - PLACE
      ?auto_1966502 - TRUCK
      ?auto_1966500 - PLACE
      ?auto_1966498 - HOIST
      ?auto_1966499 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1966497 ?auto_1966501 ) ( SURFACE-AT ?auto_1966495 ?auto_1966501 ) ( CLEAR ?auto_1966495 ) ( IS-CRATE ?auto_1966496 ) ( not ( = ?auto_1966495 ?auto_1966496 ) ) ( AVAILABLE ?auto_1966497 ) ( ON ?auto_1966495 ?auto_1966494 ) ( not ( = ?auto_1966494 ?auto_1966495 ) ) ( not ( = ?auto_1966494 ?auto_1966496 ) ) ( TRUCK-AT ?auto_1966502 ?auto_1966500 ) ( not ( = ?auto_1966500 ?auto_1966501 ) ) ( HOIST-AT ?auto_1966498 ?auto_1966500 ) ( not ( = ?auto_1966497 ?auto_1966498 ) ) ( AVAILABLE ?auto_1966498 ) ( SURFACE-AT ?auto_1966496 ?auto_1966500 ) ( ON ?auto_1966496 ?auto_1966499 ) ( CLEAR ?auto_1966496 ) ( not ( = ?auto_1966495 ?auto_1966499 ) ) ( not ( = ?auto_1966496 ?auto_1966499 ) ) ( not ( = ?auto_1966494 ?auto_1966499 ) ) ( ON ?auto_1966484 ?auto_1966483 ) ( ON ?auto_1966485 ?auto_1966484 ) ( ON ?auto_1966487 ?auto_1966485 ) ( ON ?auto_1966486 ?auto_1966487 ) ( ON ?auto_1966488 ?auto_1966486 ) ( ON ?auto_1966489 ?auto_1966488 ) ( ON ?auto_1966490 ?auto_1966489 ) ( ON ?auto_1966491 ?auto_1966490 ) ( ON ?auto_1966492 ?auto_1966491 ) ( ON ?auto_1966493 ?auto_1966492 ) ( ON ?auto_1966494 ?auto_1966493 ) ( not ( = ?auto_1966483 ?auto_1966484 ) ) ( not ( = ?auto_1966483 ?auto_1966485 ) ) ( not ( = ?auto_1966483 ?auto_1966487 ) ) ( not ( = ?auto_1966483 ?auto_1966486 ) ) ( not ( = ?auto_1966483 ?auto_1966488 ) ) ( not ( = ?auto_1966483 ?auto_1966489 ) ) ( not ( = ?auto_1966483 ?auto_1966490 ) ) ( not ( = ?auto_1966483 ?auto_1966491 ) ) ( not ( = ?auto_1966483 ?auto_1966492 ) ) ( not ( = ?auto_1966483 ?auto_1966493 ) ) ( not ( = ?auto_1966483 ?auto_1966494 ) ) ( not ( = ?auto_1966483 ?auto_1966495 ) ) ( not ( = ?auto_1966483 ?auto_1966496 ) ) ( not ( = ?auto_1966483 ?auto_1966499 ) ) ( not ( = ?auto_1966484 ?auto_1966485 ) ) ( not ( = ?auto_1966484 ?auto_1966487 ) ) ( not ( = ?auto_1966484 ?auto_1966486 ) ) ( not ( = ?auto_1966484 ?auto_1966488 ) ) ( not ( = ?auto_1966484 ?auto_1966489 ) ) ( not ( = ?auto_1966484 ?auto_1966490 ) ) ( not ( = ?auto_1966484 ?auto_1966491 ) ) ( not ( = ?auto_1966484 ?auto_1966492 ) ) ( not ( = ?auto_1966484 ?auto_1966493 ) ) ( not ( = ?auto_1966484 ?auto_1966494 ) ) ( not ( = ?auto_1966484 ?auto_1966495 ) ) ( not ( = ?auto_1966484 ?auto_1966496 ) ) ( not ( = ?auto_1966484 ?auto_1966499 ) ) ( not ( = ?auto_1966485 ?auto_1966487 ) ) ( not ( = ?auto_1966485 ?auto_1966486 ) ) ( not ( = ?auto_1966485 ?auto_1966488 ) ) ( not ( = ?auto_1966485 ?auto_1966489 ) ) ( not ( = ?auto_1966485 ?auto_1966490 ) ) ( not ( = ?auto_1966485 ?auto_1966491 ) ) ( not ( = ?auto_1966485 ?auto_1966492 ) ) ( not ( = ?auto_1966485 ?auto_1966493 ) ) ( not ( = ?auto_1966485 ?auto_1966494 ) ) ( not ( = ?auto_1966485 ?auto_1966495 ) ) ( not ( = ?auto_1966485 ?auto_1966496 ) ) ( not ( = ?auto_1966485 ?auto_1966499 ) ) ( not ( = ?auto_1966487 ?auto_1966486 ) ) ( not ( = ?auto_1966487 ?auto_1966488 ) ) ( not ( = ?auto_1966487 ?auto_1966489 ) ) ( not ( = ?auto_1966487 ?auto_1966490 ) ) ( not ( = ?auto_1966487 ?auto_1966491 ) ) ( not ( = ?auto_1966487 ?auto_1966492 ) ) ( not ( = ?auto_1966487 ?auto_1966493 ) ) ( not ( = ?auto_1966487 ?auto_1966494 ) ) ( not ( = ?auto_1966487 ?auto_1966495 ) ) ( not ( = ?auto_1966487 ?auto_1966496 ) ) ( not ( = ?auto_1966487 ?auto_1966499 ) ) ( not ( = ?auto_1966486 ?auto_1966488 ) ) ( not ( = ?auto_1966486 ?auto_1966489 ) ) ( not ( = ?auto_1966486 ?auto_1966490 ) ) ( not ( = ?auto_1966486 ?auto_1966491 ) ) ( not ( = ?auto_1966486 ?auto_1966492 ) ) ( not ( = ?auto_1966486 ?auto_1966493 ) ) ( not ( = ?auto_1966486 ?auto_1966494 ) ) ( not ( = ?auto_1966486 ?auto_1966495 ) ) ( not ( = ?auto_1966486 ?auto_1966496 ) ) ( not ( = ?auto_1966486 ?auto_1966499 ) ) ( not ( = ?auto_1966488 ?auto_1966489 ) ) ( not ( = ?auto_1966488 ?auto_1966490 ) ) ( not ( = ?auto_1966488 ?auto_1966491 ) ) ( not ( = ?auto_1966488 ?auto_1966492 ) ) ( not ( = ?auto_1966488 ?auto_1966493 ) ) ( not ( = ?auto_1966488 ?auto_1966494 ) ) ( not ( = ?auto_1966488 ?auto_1966495 ) ) ( not ( = ?auto_1966488 ?auto_1966496 ) ) ( not ( = ?auto_1966488 ?auto_1966499 ) ) ( not ( = ?auto_1966489 ?auto_1966490 ) ) ( not ( = ?auto_1966489 ?auto_1966491 ) ) ( not ( = ?auto_1966489 ?auto_1966492 ) ) ( not ( = ?auto_1966489 ?auto_1966493 ) ) ( not ( = ?auto_1966489 ?auto_1966494 ) ) ( not ( = ?auto_1966489 ?auto_1966495 ) ) ( not ( = ?auto_1966489 ?auto_1966496 ) ) ( not ( = ?auto_1966489 ?auto_1966499 ) ) ( not ( = ?auto_1966490 ?auto_1966491 ) ) ( not ( = ?auto_1966490 ?auto_1966492 ) ) ( not ( = ?auto_1966490 ?auto_1966493 ) ) ( not ( = ?auto_1966490 ?auto_1966494 ) ) ( not ( = ?auto_1966490 ?auto_1966495 ) ) ( not ( = ?auto_1966490 ?auto_1966496 ) ) ( not ( = ?auto_1966490 ?auto_1966499 ) ) ( not ( = ?auto_1966491 ?auto_1966492 ) ) ( not ( = ?auto_1966491 ?auto_1966493 ) ) ( not ( = ?auto_1966491 ?auto_1966494 ) ) ( not ( = ?auto_1966491 ?auto_1966495 ) ) ( not ( = ?auto_1966491 ?auto_1966496 ) ) ( not ( = ?auto_1966491 ?auto_1966499 ) ) ( not ( = ?auto_1966492 ?auto_1966493 ) ) ( not ( = ?auto_1966492 ?auto_1966494 ) ) ( not ( = ?auto_1966492 ?auto_1966495 ) ) ( not ( = ?auto_1966492 ?auto_1966496 ) ) ( not ( = ?auto_1966492 ?auto_1966499 ) ) ( not ( = ?auto_1966493 ?auto_1966494 ) ) ( not ( = ?auto_1966493 ?auto_1966495 ) ) ( not ( = ?auto_1966493 ?auto_1966496 ) ) ( not ( = ?auto_1966493 ?auto_1966499 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1966494 ?auto_1966495 ?auto_1966496 )
      ( MAKE-13CRATE-VERIFY ?auto_1966483 ?auto_1966484 ?auto_1966485 ?auto_1966487 ?auto_1966486 ?auto_1966488 ?auto_1966489 ?auto_1966490 ?auto_1966491 ?auto_1966492 ?auto_1966493 ?auto_1966494 ?auto_1966495 ?auto_1966496 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1966666 - SURFACE
      ?auto_1966667 - SURFACE
      ?auto_1966668 - SURFACE
      ?auto_1966670 - SURFACE
      ?auto_1966669 - SURFACE
      ?auto_1966671 - SURFACE
      ?auto_1966672 - SURFACE
      ?auto_1966673 - SURFACE
      ?auto_1966674 - SURFACE
      ?auto_1966675 - SURFACE
      ?auto_1966676 - SURFACE
      ?auto_1966677 - SURFACE
      ?auto_1966678 - SURFACE
      ?auto_1966679 - SURFACE
    )
    :vars
    (
      ?auto_1966681 - HOIST
      ?auto_1966683 - PLACE
      ?auto_1966684 - PLACE
      ?auto_1966680 - HOIST
      ?auto_1966682 - SURFACE
      ?auto_1966685 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1966681 ?auto_1966683 ) ( SURFACE-AT ?auto_1966678 ?auto_1966683 ) ( CLEAR ?auto_1966678 ) ( IS-CRATE ?auto_1966679 ) ( not ( = ?auto_1966678 ?auto_1966679 ) ) ( AVAILABLE ?auto_1966681 ) ( ON ?auto_1966678 ?auto_1966677 ) ( not ( = ?auto_1966677 ?auto_1966678 ) ) ( not ( = ?auto_1966677 ?auto_1966679 ) ) ( not ( = ?auto_1966684 ?auto_1966683 ) ) ( HOIST-AT ?auto_1966680 ?auto_1966684 ) ( not ( = ?auto_1966681 ?auto_1966680 ) ) ( AVAILABLE ?auto_1966680 ) ( SURFACE-AT ?auto_1966679 ?auto_1966684 ) ( ON ?auto_1966679 ?auto_1966682 ) ( CLEAR ?auto_1966679 ) ( not ( = ?auto_1966678 ?auto_1966682 ) ) ( not ( = ?auto_1966679 ?auto_1966682 ) ) ( not ( = ?auto_1966677 ?auto_1966682 ) ) ( TRUCK-AT ?auto_1966685 ?auto_1966683 ) ( ON ?auto_1966667 ?auto_1966666 ) ( ON ?auto_1966668 ?auto_1966667 ) ( ON ?auto_1966670 ?auto_1966668 ) ( ON ?auto_1966669 ?auto_1966670 ) ( ON ?auto_1966671 ?auto_1966669 ) ( ON ?auto_1966672 ?auto_1966671 ) ( ON ?auto_1966673 ?auto_1966672 ) ( ON ?auto_1966674 ?auto_1966673 ) ( ON ?auto_1966675 ?auto_1966674 ) ( ON ?auto_1966676 ?auto_1966675 ) ( ON ?auto_1966677 ?auto_1966676 ) ( not ( = ?auto_1966666 ?auto_1966667 ) ) ( not ( = ?auto_1966666 ?auto_1966668 ) ) ( not ( = ?auto_1966666 ?auto_1966670 ) ) ( not ( = ?auto_1966666 ?auto_1966669 ) ) ( not ( = ?auto_1966666 ?auto_1966671 ) ) ( not ( = ?auto_1966666 ?auto_1966672 ) ) ( not ( = ?auto_1966666 ?auto_1966673 ) ) ( not ( = ?auto_1966666 ?auto_1966674 ) ) ( not ( = ?auto_1966666 ?auto_1966675 ) ) ( not ( = ?auto_1966666 ?auto_1966676 ) ) ( not ( = ?auto_1966666 ?auto_1966677 ) ) ( not ( = ?auto_1966666 ?auto_1966678 ) ) ( not ( = ?auto_1966666 ?auto_1966679 ) ) ( not ( = ?auto_1966666 ?auto_1966682 ) ) ( not ( = ?auto_1966667 ?auto_1966668 ) ) ( not ( = ?auto_1966667 ?auto_1966670 ) ) ( not ( = ?auto_1966667 ?auto_1966669 ) ) ( not ( = ?auto_1966667 ?auto_1966671 ) ) ( not ( = ?auto_1966667 ?auto_1966672 ) ) ( not ( = ?auto_1966667 ?auto_1966673 ) ) ( not ( = ?auto_1966667 ?auto_1966674 ) ) ( not ( = ?auto_1966667 ?auto_1966675 ) ) ( not ( = ?auto_1966667 ?auto_1966676 ) ) ( not ( = ?auto_1966667 ?auto_1966677 ) ) ( not ( = ?auto_1966667 ?auto_1966678 ) ) ( not ( = ?auto_1966667 ?auto_1966679 ) ) ( not ( = ?auto_1966667 ?auto_1966682 ) ) ( not ( = ?auto_1966668 ?auto_1966670 ) ) ( not ( = ?auto_1966668 ?auto_1966669 ) ) ( not ( = ?auto_1966668 ?auto_1966671 ) ) ( not ( = ?auto_1966668 ?auto_1966672 ) ) ( not ( = ?auto_1966668 ?auto_1966673 ) ) ( not ( = ?auto_1966668 ?auto_1966674 ) ) ( not ( = ?auto_1966668 ?auto_1966675 ) ) ( not ( = ?auto_1966668 ?auto_1966676 ) ) ( not ( = ?auto_1966668 ?auto_1966677 ) ) ( not ( = ?auto_1966668 ?auto_1966678 ) ) ( not ( = ?auto_1966668 ?auto_1966679 ) ) ( not ( = ?auto_1966668 ?auto_1966682 ) ) ( not ( = ?auto_1966670 ?auto_1966669 ) ) ( not ( = ?auto_1966670 ?auto_1966671 ) ) ( not ( = ?auto_1966670 ?auto_1966672 ) ) ( not ( = ?auto_1966670 ?auto_1966673 ) ) ( not ( = ?auto_1966670 ?auto_1966674 ) ) ( not ( = ?auto_1966670 ?auto_1966675 ) ) ( not ( = ?auto_1966670 ?auto_1966676 ) ) ( not ( = ?auto_1966670 ?auto_1966677 ) ) ( not ( = ?auto_1966670 ?auto_1966678 ) ) ( not ( = ?auto_1966670 ?auto_1966679 ) ) ( not ( = ?auto_1966670 ?auto_1966682 ) ) ( not ( = ?auto_1966669 ?auto_1966671 ) ) ( not ( = ?auto_1966669 ?auto_1966672 ) ) ( not ( = ?auto_1966669 ?auto_1966673 ) ) ( not ( = ?auto_1966669 ?auto_1966674 ) ) ( not ( = ?auto_1966669 ?auto_1966675 ) ) ( not ( = ?auto_1966669 ?auto_1966676 ) ) ( not ( = ?auto_1966669 ?auto_1966677 ) ) ( not ( = ?auto_1966669 ?auto_1966678 ) ) ( not ( = ?auto_1966669 ?auto_1966679 ) ) ( not ( = ?auto_1966669 ?auto_1966682 ) ) ( not ( = ?auto_1966671 ?auto_1966672 ) ) ( not ( = ?auto_1966671 ?auto_1966673 ) ) ( not ( = ?auto_1966671 ?auto_1966674 ) ) ( not ( = ?auto_1966671 ?auto_1966675 ) ) ( not ( = ?auto_1966671 ?auto_1966676 ) ) ( not ( = ?auto_1966671 ?auto_1966677 ) ) ( not ( = ?auto_1966671 ?auto_1966678 ) ) ( not ( = ?auto_1966671 ?auto_1966679 ) ) ( not ( = ?auto_1966671 ?auto_1966682 ) ) ( not ( = ?auto_1966672 ?auto_1966673 ) ) ( not ( = ?auto_1966672 ?auto_1966674 ) ) ( not ( = ?auto_1966672 ?auto_1966675 ) ) ( not ( = ?auto_1966672 ?auto_1966676 ) ) ( not ( = ?auto_1966672 ?auto_1966677 ) ) ( not ( = ?auto_1966672 ?auto_1966678 ) ) ( not ( = ?auto_1966672 ?auto_1966679 ) ) ( not ( = ?auto_1966672 ?auto_1966682 ) ) ( not ( = ?auto_1966673 ?auto_1966674 ) ) ( not ( = ?auto_1966673 ?auto_1966675 ) ) ( not ( = ?auto_1966673 ?auto_1966676 ) ) ( not ( = ?auto_1966673 ?auto_1966677 ) ) ( not ( = ?auto_1966673 ?auto_1966678 ) ) ( not ( = ?auto_1966673 ?auto_1966679 ) ) ( not ( = ?auto_1966673 ?auto_1966682 ) ) ( not ( = ?auto_1966674 ?auto_1966675 ) ) ( not ( = ?auto_1966674 ?auto_1966676 ) ) ( not ( = ?auto_1966674 ?auto_1966677 ) ) ( not ( = ?auto_1966674 ?auto_1966678 ) ) ( not ( = ?auto_1966674 ?auto_1966679 ) ) ( not ( = ?auto_1966674 ?auto_1966682 ) ) ( not ( = ?auto_1966675 ?auto_1966676 ) ) ( not ( = ?auto_1966675 ?auto_1966677 ) ) ( not ( = ?auto_1966675 ?auto_1966678 ) ) ( not ( = ?auto_1966675 ?auto_1966679 ) ) ( not ( = ?auto_1966675 ?auto_1966682 ) ) ( not ( = ?auto_1966676 ?auto_1966677 ) ) ( not ( = ?auto_1966676 ?auto_1966678 ) ) ( not ( = ?auto_1966676 ?auto_1966679 ) ) ( not ( = ?auto_1966676 ?auto_1966682 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1966677 ?auto_1966678 ?auto_1966679 )
      ( MAKE-13CRATE-VERIFY ?auto_1966666 ?auto_1966667 ?auto_1966668 ?auto_1966670 ?auto_1966669 ?auto_1966671 ?auto_1966672 ?auto_1966673 ?auto_1966674 ?auto_1966675 ?auto_1966676 ?auto_1966677 ?auto_1966678 ?auto_1966679 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1966849 - SURFACE
      ?auto_1966850 - SURFACE
      ?auto_1966851 - SURFACE
      ?auto_1966853 - SURFACE
      ?auto_1966852 - SURFACE
      ?auto_1966854 - SURFACE
      ?auto_1966855 - SURFACE
      ?auto_1966856 - SURFACE
      ?auto_1966857 - SURFACE
      ?auto_1966858 - SURFACE
      ?auto_1966859 - SURFACE
      ?auto_1966860 - SURFACE
      ?auto_1966861 - SURFACE
      ?auto_1966862 - SURFACE
    )
    :vars
    (
      ?auto_1966867 - HOIST
      ?auto_1966864 - PLACE
      ?auto_1966863 - PLACE
      ?auto_1966866 - HOIST
      ?auto_1966868 - SURFACE
      ?auto_1966865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1966867 ?auto_1966864 ) ( IS-CRATE ?auto_1966862 ) ( not ( = ?auto_1966861 ?auto_1966862 ) ) ( not ( = ?auto_1966860 ?auto_1966861 ) ) ( not ( = ?auto_1966860 ?auto_1966862 ) ) ( not ( = ?auto_1966863 ?auto_1966864 ) ) ( HOIST-AT ?auto_1966866 ?auto_1966863 ) ( not ( = ?auto_1966867 ?auto_1966866 ) ) ( AVAILABLE ?auto_1966866 ) ( SURFACE-AT ?auto_1966862 ?auto_1966863 ) ( ON ?auto_1966862 ?auto_1966868 ) ( CLEAR ?auto_1966862 ) ( not ( = ?auto_1966861 ?auto_1966868 ) ) ( not ( = ?auto_1966862 ?auto_1966868 ) ) ( not ( = ?auto_1966860 ?auto_1966868 ) ) ( TRUCK-AT ?auto_1966865 ?auto_1966864 ) ( SURFACE-AT ?auto_1966860 ?auto_1966864 ) ( CLEAR ?auto_1966860 ) ( LIFTING ?auto_1966867 ?auto_1966861 ) ( IS-CRATE ?auto_1966861 ) ( ON ?auto_1966850 ?auto_1966849 ) ( ON ?auto_1966851 ?auto_1966850 ) ( ON ?auto_1966853 ?auto_1966851 ) ( ON ?auto_1966852 ?auto_1966853 ) ( ON ?auto_1966854 ?auto_1966852 ) ( ON ?auto_1966855 ?auto_1966854 ) ( ON ?auto_1966856 ?auto_1966855 ) ( ON ?auto_1966857 ?auto_1966856 ) ( ON ?auto_1966858 ?auto_1966857 ) ( ON ?auto_1966859 ?auto_1966858 ) ( ON ?auto_1966860 ?auto_1966859 ) ( not ( = ?auto_1966849 ?auto_1966850 ) ) ( not ( = ?auto_1966849 ?auto_1966851 ) ) ( not ( = ?auto_1966849 ?auto_1966853 ) ) ( not ( = ?auto_1966849 ?auto_1966852 ) ) ( not ( = ?auto_1966849 ?auto_1966854 ) ) ( not ( = ?auto_1966849 ?auto_1966855 ) ) ( not ( = ?auto_1966849 ?auto_1966856 ) ) ( not ( = ?auto_1966849 ?auto_1966857 ) ) ( not ( = ?auto_1966849 ?auto_1966858 ) ) ( not ( = ?auto_1966849 ?auto_1966859 ) ) ( not ( = ?auto_1966849 ?auto_1966860 ) ) ( not ( = ?auto_1966849 ?auto_1966861 ) ) ( not ( = ?auto_1966849 ?auto_1966862 ) ) ( not ( = ?auto_1966849 ?auto_1966868 ) ) ( not ( = ?auto_1966850 ?auto_1966851 ) ) ( not ( = ?auto_1966850 ?auto_1966853 ) ) ( not ( = ?auto_1966850 ?auto_1966852 ) ) ( not ( = ?auto_1966850 ?auto_1966854 ) ) ( not ( = ?auto_1966850 ?auto_1966855 ) ) ( not ( = ?auto_1966850 ?auto_1966856 ) ) ( not ( = ?auto_1966850 ?auto_1966857 ) ) ( not ( = ?auto_1966850 ?auto_1966858 ) ) ( not ( = ?auto_1966850 ?auto_1966859 ) ) ( not ( = ?auto_1966850 ?auto_1966860 ) ) ( not ( = ?auto_1966850 ?auto_1966861 ) ) ( not ( = ?auto_1966850 ?auto_1966862 ) ) ( not ( = ?auto_1966850 ?auto_1966868 ) ) ( not ( = ?auto_1966851 ?auto_1966853 ) ) ( not ( = ?auto_1966851 ?auto_1966852 ) ) ( not ( = ?auto_1966851 ?auto_1966854 ) ) ( not ( = ?auto_1966851 ?auto_1966855 ) ) ( not ( = ?auto_1966851 ?auto_1966856 ) ) ( not ( = ?auto_1966851 ?auto_1966857 ) ) ( not ( = ?auto_1966851 ?auto_1966858 ) ) ( not ( = ?auto_1966851 ?auto_1966859 ) ) ( not ( = ?auto_1966851 ?auto_1966860 ) ) ( not ( = ?auto_1966851 ?auto_1966861 ) ) ( not ( = ?auto_1966851 ?auto_1966862 ) ) ( not ( = ?auto_1966851 ?auto_1966868 ) ) ( not ( = ?auto_1966853 ?auto_1966852 ) ) ( not ( = ?auto_1966853 ?auto_1966854 ) ) ( not ( = ?auto_1966853 ?auto_1966855 ) ) ( not ( = ?auto_1966853 ?auto_1966856 ) ) ( not ( = ?auto_1966853 ?auto_1966857 ) ) ( not ( = ?auto_1966853 ?auto_1966858 ) ) ( not ( = ?auto_1966853 ?auto_1966859 ) ) ( not ( = ?auto_1966853 ?auto_1966860 ) ) ( not ( = ?auto_1966853 ?auto_1966861 ) ) ( not ( = ?auto_1966853 ?auto_1966862 ) ) ( not ( = ?auto_1966853 ?auto_1966868 ) ) ( not ( = ?auto_1966852 ?auto_1966854 ) ) ( not ( = ?auto_1966852 ?auto_1966855 ) ) ( not ( = ?auto_1966852 ?auto_1966856 ) ) ( not ( = ?auto_1966852 ?auto_1966857 ) ) ( not ( = ?auto_1966852 ?auto_1966858 ) ) ( not ( = ?auto_1966852 ?auto_1966859 ) ) ( not ( = ?auto_1966852 ?auto_1966860 ) ) ( not ( = ?auto_1966852 ?auto_1966861 ) ) ( not ( = ?auto_1966852 ?auto_1966862 ) ) ( not ( = ?auto_1966852 ?auto_1966868 ) ) ( not ( = ?auto_1966854 ?auto_1966855 ) ) ( not ( = ?auto_1966854 ?auto_1966856 ) ) ( not ( = ?auto_1966854 ?auto_1966857 ) ) ( not ( = ?auto_1966854 ?auto_1966858 ) ) ( not ( = ?auto_1966854 ?auto_1966859 ) ) ( not ( = ?auto_1966854 ?auto_1966860 ) ) ( not ( = ?auto_1966854 ?auto_1966861 ) ) ( not ( = ?auto_1966854 ?auto_1966862 ) ) ( not ( = ?auto_1966854 ?auto_1966868 ) ) ( not ( = ?auto_1966855 ?auto_1966856 ) ) ( not ( = ?auto_1966855 ?auto_1966857 ) ) ( not ( = ?auto_1966855 ?auto_1966858 ) ) ( not ( = ?auto_1966855 ?auto_1966859 ) ) ( not ( = ?auto_1966855 ?auto_1966860 ) ) ( not ( = ?auto_1966855 ?auto_1966861 ) ) ( not ( = ?auto_1966855 ?auto_1966862 ) ) ( not ( = ?auto_1966855 ?auto_1966868 ) ) ( not ( = ?auto_1966856 ?auto_1966857 ) ) ( not ( = ?auto_1966856 ?auto_1966858 ) ) ( not ( = ?auto_1966856 ?auto_1966859 ) ) ( not ( = ?auto_1966856 ?auto_1966860 ) ) ( not ( = ?auto_1966856 ?auto_1966861 ) ) ( not ( = ?auto_1966856 ?auto_1966862 ) ) ( not ( = ?auto_1966856 ?auto_1966868 ) ) ( not ( = ?auto_1966857 ?auto_1966858 ) ) ( not ( = ?auto_1966857 ?auto_1966859 ) ) ( not ( = ?auto_1966857 ?auto_1966860 ) ) ( not ( = ?auto_1966857 ?auto_1966861 ) ) ( not ( = ?auto_1966857 ?auto_1966862 ) ) ( not ( = ?auto_1966857 ?auto_1966868 ) ) ( not ( = ?auto_1966858 ?auto_1966859 ) ) ( not ( = ?auto_1966858 ?auto_1966860 ) ) ( not ( = ?auto_1966858 ?auto_1966861 ) ) ( not ( = ?auto_1966858 ?auto_1966862 ) ) ( not ( = ?auto_1966858 ?auto_1966868 ) ) ( not ( = ?auto_1966859 ?auto_1966860 ) ) ( not ( = ?auto_1966859 ?auto_1966861 ) ) ( not ( = ?auto_1966859 ?auto_1966862 ) ) ( not ( = ?auto_1966859 ?auto_1966868 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1966860 ?auto_1966861 ?auto_1966862 )
      ( MAKE-13CRATE-VERIFY ?auto_1966849 ?auto_1966850 ?auto_1966851 ?auto_1966853 ?auto_1966852 ?auto_1966854 ?auto_1966855 ?auto_1966856 ?auto_1966857 ?auto_1966858 ?auto_1966859 ?auto_1966860 ?auto_1966861 ?auto_1966862 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1967032 - SURFACE
      ?auto_1967033 - SURFACE
      ?auto_1967034 - SURFACE
      ?auto_1967036 - SURFACE
      ?auto_1967035 - SURFACE
      ?auto_1967037 - SURFACE
      ?auto_1967038 - SURFACE
      ?auto_1967039 - SURFACE
      ?auto_1967040 - SURFACE
      ?auto_1967041 - SURFACE
      ?auto_1967042 - SURFACE
      ?auto_1967043 - SURFACE
      ?auto_1967044 - SURFACE
      ?auto_1967045 - SURFACE
    )
    :vars
    (
      ?auto_1967046 - HOIST
      ?auto_1967047 - PLACE
      ?auto_1967050 - PLACE
      ?auto_1967048 - HOIST
      ?auto_1967051 - SURFACE
      ?auto_1967049 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1967046 ?auto_1967047 ) ( IS-CRATE ?auto_1967045 ) ( not ( = ?auto_1967044 ?auto_1967045 ) ) ( not ( = ?auto_1967043 ?auto_1967044 ) ) ( not ( = ?auto_1967043 ?auto_1967045 ) ) ( not ( = ?auto_1967050 ?auto_1967047 ) ) ( HOIST-AT ?auto_1967048 ?auto_1967050 ) ( not ( = ?auto_1967046 ?auto_1967048 ) ) ( AVAILABLE ?auto_1967048 ) ( SURFACE-AT ?auto_1967045 ?auto_1967050 ) ( ON ?auto_1967045 ?auto_1967051 ) ( CLEAR ?auto_1967045 ) ( not ( = ?auto_1967044 ?auto_1967051 ) ) ( not ( = ?auto_1967045 ?auto_1967051 ) ) ( not ( = ?auto_1967043 ?auto_1967051 ) ) ( TRUCK-AT ?auto_1967049 ?auto_1967047 ) ( SURFACE-AT ?auto_1967043 ?auto_1967047 ) ( CLEAR ?auto_1967043 ) ( IS-CRATE ?auto_1967044 ) ( AVAILABLE ?auto_1967046 ) ( IN ?auto_1967044 ?auto_1967049 ) ( ON ?auto_1967033 ?auto_1967032 ) ( ON ?auto_1967034 ?auto_1967033 ) ( ON ?auto_1967036 ?auto_1967034 ) ( ON ?auto_1967035 ?auto_1967036 ) ( ON ?auto_1967037 ?auto_1967035 ) ( ON ?auto_1967038 ?auto_1967037 ) ( ON ?auto_1967039 ?auto_1967038 ) ( ON ?auto_1967040 ?auto_1967039 ) ( ON ?auto_1967041 ?auto_1967040 ) ( ON ?auto_1967042 ?auto_1967041 ) ( ON ?auto_1967043 ?auto_1967042 ) ( not ( = ?auto_1967032 ?auto_1967033 ) ) ( not ( = ?auto_1967032 ?auto_1967034 ) ) ( not ( = ?auto_1967032 ?auto_1967036 ) ) ( not ( = ?auto_1967032 ?auto_1967035 ) ) ( not ( = ?auto_1967032 ?auto_1967037 ) ) ( not ( = ?auto_1967032 ?auto_1967038 ) ) ( not ( = ?auto_1967032 ?auto_1967039 ) ) ( not ( = ?auto_1967032 ?auto_1967040 ) ) ( not ( = ?auto_1967032 ?auto_1967041 ) ) ( not ( = ?auto_1967032 ?auto_1967042 ) ) ( not ( = ?auto_1967032 ?auto_1967043 ) ) ( not ( = ?auto_1967032 ?auto_1967044 ) ) ( not ( = ?auto_1967032 ?auto_1967045 ) ) ( not ( = ?auto_1967032 ?auto_1967051 ) ) ( not ( = ?auto_1967033 ?auto_1967034 ) ) ( not ( = ?auto_1967033 ?auto_1967036 ) ) ( not ( = ?auto_1967033 ?auto_1967035 ) ) ( not ( = ?auto_1967033 ?auto_1967037 ) ) ( not ( = ?auto_1967033 ?auto_1967038 ) ) ( not ( = ?auto_1967033 ?auto_1967039 ) ) ( not ( = ?auto_1967033 ?auto_1967040 ) ) ( not ( = ?auto_1967033 ?auto_1967041 ) ) ( not ( = ?auto_1967033 ?auto_1967042 ) ) ( not ( = ?auto_1967033 ?auto_1967043 ) ) ( not ( = ?auto_1967033 ?auto_1967044 ) ) ( not ( = ?auto_1967033 ?auto_1967045 ) ) ( not ( = ?auto_1967033 ?auto_1967051 ) ) ( not ( = ?auto_1967034 ?auto_1967036 ) ) ( not ( = ?auto_1967034 ?auto_1967035 ) ) ( not ( = ?auto_1967034 ?auto_1967037 ) ) ( not ( = ?auto_1967034 ?auto_1967038 ) ) ( not ( = ?auto_1967034 ?auto_1967039 ) ) ( not ( = ?auto_1967034 ?auto_1967040 ) ) ( not ( = ?auto_1967034 ?auto_1967041 ) ) ( not ( = ?auto_1967034 ?auto_1967042 ) ) ( not ( = ?auto_1967034 ?auto_1967043 ) ) ( not ( = ?auto_1967034 ?auto_1967044 ) ) ( not ( = ?auto_1967034 ?auto_1967045 ) ) ( not ( = ?auto_1967034 ?auto_1967051 ) ) ( not ( = ?auto_1967036 ?auto_1967035 ) ) ( not ( = ?auto_1967036 ?auto_1967037 ) ) ( not ( = ?auto_1967036 ?auto_1967038 ) ) ( not ( = ?auto_1967036 ?auto_1967039 ) ) ( not ( = ?auto_1967036 ?auto_1967040 ) ) ( not ( = ?auto_1967036 ?auto_1967041 ) ) ( not ( = ?auto_1967036 ?auto_1967042 ) ) ( not ( = ?auto_1967036 ?auto_1967043 ) ) ( not ( = ?auto_1967036 ?auto_1967044 ) ) ( not ( = ?auto_1967036 ?auto_1967045 ) ) ( not ( = ?auto_1967036 ?auto_1967051 ) ) ( not ( = ?auto_1967035 ?auto_1967037 ) ) ( not ( = ?auto_1967035 ?auto_1967038 ) ) ( not ( = ?auto_1967035 ?auto_1967039 ) ) ( not ( = ?auto_1967035 ?auto_1967040 ) ) ( not ( = ?auto_1967035 ?auto_1967041 ) ) ( not ( = ?auto_1967035 ?auto_1967042 ) ) ( not ( = ?auto_1967035 ?auto_1967043 ) ) ( not ( = ?auto_1967035 ?auto_1967044 ) ) ( not ( = ?auto_1967035 ?auto_1967045 ) ) ( not ( = ?auto_1967035 ?auto_1967051 ) ) ( not ( = ?auto_1967037 ?auto_1967038 ) ) ( not ( = ?auto_1967037 ?auto_1967039 ) ) ( not ( = ?auto_1967037 ?auto_1967040 ) ) ( not ( = ?auto_1967037 ?auto_1967041 ) ) ( not ( = ?auto_1967037 ?auto_1967042 ) ) ( not ( = ?auto_1967037 ?auto_1967043 ) ) ( not ( = ?auto_1967037 ?auto_1967044 ) ) ( not ( = ?auto_1967037 ?auto_1967045 ) ) ( not ( = ?auto_1967037 ?auto_1967051 ) ) ( not ( = ?auto_1967038 ?auto_1967039 ) ) ( not ( = ?auto_1967038 ?auto_1967040 ) ) ( not ( = ?auto_1967038 ?auto_1967041 ) ) ( not ( = ?auto_1967038 ?auto_1967042 ) ) ( not ( = ?auto_1967038 ?auto_1967043 ) ) ( not ( = ?auto_1967038 ?auto_1967044 ) ) ( not ( = ?auto_1967038 ?auto_1967045 ) ) ( not ( = ?auto_1967038 ?auto_1967051 ) ) ( not ( = ?auto_1967039 ?auto_1967040 ) ) ( not ( = ?auto_1967039 ?auto_1967041 ) ) ( not ( = ?auto_1967039 ?auto_1967042 ) ) ( not ( = ?auto_1967039 ?auto_1967043 ) ) ( not ( = ?auto_1967039 ?auto_1967044 ) ) ( not ( = ?auto_1967039 ?auto_1967045 ) ) ( not ( = ?auto_1967039 ?auto_1967051 ) ) ( not ( = ?auto_1967040 ?auto_1967041 ) ) ( not ( = ?auto_1967040 ?auto_1967042 ) ) ( not ( = ?auto_1967040 ?auto_1967043 ) ) ( not ( = ?auto_1967040 ?auto_1967044 ) ) ( not ( = ?auto_1967040 ?auto_1967045 ) ) ( not ( = ?auto_1967040 ?auto_1967051 ) ) ( not ( = ?auto_1967041 ?auto_1967042 ) ) ( not ( = ?auto_1967041 ?auto_1967043 ) ) ( not ( = ?auto_1967041 ?auto_1967044 ) ) ( not ( = ?auto_1967041 ?auto_1967045 ) ) ( not ( = ?auto_1967041 ?auto_1967051 ) ) ( not ( = ?auto_1967042 ?auto_1967043 ) ) ( not ( = ?auto_1967042 ?auto_1967044 ) ) ( not ( = ?auto_1967042 ?auto_1967045 ) ) ( not ( = ?auto_1967042 ?auto_1967051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1967043 ?auto_1967044 ?auto_1967045 )
      ( MAKE-13CRATE-VERIFY ?auto_1967032 ?auto_1967033 ?auto_1967034 ?auto_1967036 ?auto_1967035 ?auto_1967037 ?auto_1967038 ?auto_1967039 ?auto_1967040 ?auto_1967041 ?auto_1967042 ?auto_1967043 ?auto_1967044 ?auto_1967045 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1981246 - SURFACE
      ?auto_1981247 - SURFACE
      ?auto_1981248 - SURFACE
      ?auto_1981250 - SURFACE
      ?auto_1981249 - SURFACE
      ?auto_1981251 - SURFACE
      ?auto_1981252 - SURFACE
      ?auto_1981253 - SURFACE
      ?auto_1981254 - SURFACE
      ?auto_1981255 - SURFACE
      ?auto_1981256 - SURFACE
      ?auto_1981257 - SURFACE
      ?auto_1981258 - SURFACE
      ?auto_1981259 - SURFACE
      ?auto_1981260 - SURFACE
    )
    :vars
    (
      ?auto_1981262 - HOIST
      ?auto_1981261 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1981262 ?auto_1981261 ) ( SURFACE-AT ?auto_1981259 ?auto_1981261 ) ( CLEAR ?auto_1981259 ) ( LIFTING ?auto_1981262 ?auto_1981260 ) ( IS-CRATE ?auto_1981260 ) ( not ( = ?auto_1981259 ?auto_1981260 ) ) ( ON ?auto_1981247 ?auto_1981246 ) ( ON ?auto_1981248 ?auto_1981247 ) ( ON ?auto_1981250 ?auto_1981248 ) ( ON ?auto_1981249 ?auto_1981250 ) ( ON ?auto_1981251 ?auto_1981249 ) ( ON ?auto_1981252 ?auto_1981251 ) ( ON ?auto_1981253 ?auto_1981252 ) ( ON ?auto_1981254 ?auto_1981253 ) ( ON ?auto_1981255 ?auto_1981254 ) ( ON ?auto_1981256 ?auto_1981255 ) ( ON ?auto_1981257 ?auto_1981256 ) ( ON ?auto_1981258 ?auto_1981257 ) ( ON ?auto_1981259 ?auto_1981258 ) ( not ( = ?auto_1981246 ?auto_1981247 ) ) ( not ( = ?auto_1981246 ?auto_1981248 ) ) ( not ( = ?auto_1981246 ?auto_1981250 ) ) ( not ( = ?auto_1981246 ?auto_1981249 ) ) ( not ( = ?auto_1981246 ?auto_1981251 ) ) ( not ( = ?auto_1981246 ?auto_1981252 ) ) ( not ( = ?auto_1981246 ?auto_1981253 ) ) ( not ( = ?auto_1981246 ?auto_1981254 ) ) ( not ( = ?auto_1981246 ?auto_1981255 ) ) ( not ( = ?auto_1981246 ?auto_1981256 ) ) ( not ( = ?auto_1981246 ?auto_1981257 ) ) ( not ( = ?auto_1981246 ?auto_1981258 ) ) ( not ( = ?auto_1981246 ?auto_1981259 ) ) ( not ( = ?auto_1981246 ?auto_1981260 ) ) ( not ( = ?auto_1981247 ?auto_1981248 ) ) ( not ( = ?auto_1981247 ?auto_1981250 ) ) ( not ( = ?auto_1981247 ?auto_1981249 ) ) ( not ( = ?auto_1981247 ?auto_1981251 ) ) ( not ( = ?auto_1981247 ?auto_1981252 ) ) ( not ( = ?auto_1981247 ?auto_1981253 ) ) ( not ( = ?auto_1981247 ?auto_1981254 ) ) ( not ( = ?auto_1981247 ?auto_1981255 ) ) ( not ( = ?auto_1981247 ?auto_1981256 ) ) ( not ( = ?auto_1981247 ?auto_1981257 ) ) ( not ( = ?auto_1981247 ?auto_1981258 ) ) ( not ( = ?auto_1981247 ?auto_1981259 ) ) ( not ( = ?auto_1981247 ?auto_1981260 ) ) ( not ( = ?auto_1981248 ?auto_1981250 ) ) ( not ( = ?auto_1981248 ?auto_1981249 ) ) ( not ( = ?auto_1981248 ?auto_1981251 ) ) ( not ( = ?auto_1981248 ?auto_1981252 ) ) ( not ( = ?auto_1981248 ?auto_1981253 ) ) ( not ( = ?auto_1981248 ?auto_1981254 ) ) ( not ( = ?auto_1981248 ?auto_1981255 ) ) ( not ( = ?auto_1981248 ?auto_1981256 ) ) ( not ( = ?auto_1981248 ?auto_1981257 ) ) ( not ( = ?auto_1981248 ?auto_1981258 ) ) ( not ( = ?auto_1981248 ?auto_1981259 ) ) ( not ( = ?auto_1981248 ?auto_1981260 ) ) ( not ( = ?auto_1981250 ?auto_1981249 ) ) ( not ( = ?auto_1981250 ?auto_1981251 ) ) ( not ( = ?auto_1981250 ?auto_1981252 ) ) ( not ( = ?auto_1981250 ?auto_1981253 ) ) ( not ( = ?auto_1981250 ?auto_1981254 ) ) ( not ( = ?auto_1981250 ?auto_1981255 ) ) ( not ( = ?auto_1981250 ?auto_1981256 ) ) ( not ( = ?auto_1981250 ?auto_1981257 ) ) ( not ( = ?auto_1981250 ?auto_1981258 ) ) ( not ( = ?auto_1981250 ?auto_1981259 ) ) ( not ( = ?auto_1981250 ?auto_1981260 ) ) ( not ( = ?auto_1981249 ?auto_1981251 ) ) ( not ( = ?auto_1981249 ?auto_1981252 ) ) ( not ( = ?auto_1981249 ?auto_1981253 ) ) ( not ( = ?auto_1981249 ?auto_1981254 ) ) ( not ( = ?auto_1981249 ?auto_1981255 ) ) ( not ( = ?auto_1981249 ?auto_1981256 ) ) ( not ( = ?auto_1981249 ?auto_1981257 ) ) ( not ( = ?auto_1981249 ?auto_1981258 ) ) ( not ( = ?auto_1981249 ?auto_1981259 ) ) ( not ( = ?auto_1981249 ?auto_1981260 ) ) ( not ( = ?auto_1981251 ?auto_1981252 ) ) ( not ( = ?auto_1981251 ?auto_1981253 ) ) ( not ( = ?auto_1981251 ?auto_1981254 ) ) ( not ( = ?auto_1981251 ?auto_1981255 ) ) ( not ( = ?auto_1981251 ?auto_1981256 ) ) ( not ( = ?auto_1981251 ?auto_1981257 ) ) ( not ( = ?auto_1981251 ?auto_1981258 ) ) ( not ( = ?auto_1981251 ?auto_1981259 ) ) ( not ( = ?auto_1981251 ?auto_1981260 ) ) ( not ( = ?auto_1981252 ?auto_1981253 ) ) ( not ( = ?auto_1981252 ?auto_1981254 ) ) ( not ( = ?auto_1981252 ?auto_1981255 ) ) ( not ( = ?auto_1981252 ?auto_1981256 ) ) ( not ( = ?auto_1981252 ?auto_1981257 ) ) ( not ( = ?auto_1981252 ?auto_1981258 ) ) ( not ( = ?auto_1981252 ?auto_1981259 ) ) ( not ( = ?auto_1981252 ?auto_1981260 ) ) ( not ( = ?auto_1981253 ?auto_1981254 ) ) ( not ( = ?auto_1981253 ?auto_1981255 ) ) ( not ( = ?auto_1981253 ?auto_1981256 ) ) ( not ( = ?auto_1981253 ?auto_1981257 ) ) ( not ( = ?auto_1981253 ?auto_1981258 ) ) ( not ( = ?auto_1981253 ?auto_1981259 ) ) ( not ( = ?auto_1981253 ?auto_1981260 ) ) ( not ( = ?auto_1981254 ?auto_1981255 ) ) ( not ( = ?auto_1981254 ?auto_1981256 ) ) ( not ( = ?auto_1981254 ?auto_1981257 ) ) ( not ( = ?auto_1981254 ?auto_1981258 ) ) ( not ( = ?auto_1981254 ?auto_1981259 ) ) ( not ( = ?auto_1981254 ?auto_1981260 ) ) ( not ( = ?auto_1981255 ?auto_1981256 ) ) ( not ( = ?auto_1981255 ?auto_1981257 ) ) ( not ( = ?auto_1981255 ?auto_1981258 ) ) ( not ( = ?auto_1981255 ?auto_1981259 ) ) ( not ( = ?auto_1981255 ?auto_1981260 ) ) ( not ( = ?auto_1981256 ?auto_1981257 ) ) ( not ( = ?auto_1981256 ?auto_1981258 ) ) ( not ( = ?auto_1981256 ?auto_1981259 ) ) ( not ( = ?auto_1981256 ?auto_1981260 ) ) ( not ( = ?auto_1981257 ?auto_1981258 ) ) ( not ( = ?auto_1981257 ?auto_1981259 ) ) ( not ( = ?auto_1981257 ?auto_1981260 ) ) ( not ( = ?auto_1981258 ?auto_1981259 ) ) ( not ( = ?auto_1981258 ?auto_1981260 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1981259 ?auto_1981260 )
      ( MAKE-14CRATE-VERIFY ?auto_1981246 ?auto_1981247 ?auto_1981248 ?auto_1981250 ?auto_1981249 ?auto_1981251 ?auto_1981252 ?auto_1981253 ?auto_1981254 ?auto_1981255 ?auto_1981256 ?auto_1981257 ?auto_1981258 ?auto_1981259 ?auto_1981260 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1981406 - SURFACE
      ?auto_1981407 - SURFACE
      ?auto_1981408 - SURFACE
      ?auto_1981410 - SURFACE
      ?auto_1981409 - SURFACE
      ?auto_1981411 - SURFACE
      ?auto_1981412 - SURFACE
      ?auto_1981413 - SURFACE
      ?auto_1981414 - SURFACE
      ?auto_1981415 - SURFACE
      ?auto_1981416 - SURFACE
      ?auto_1981417 - SURFACE
      ?auto_1981418 - SURFACE
      ?auto_1981419 - SURFACE
      ?auto_1981420 - SURFACE
    )
    :vars
    (
      ?auto_1981423 - HOIST
      ?auto_1981422 - PLACE
      ?auto_1981421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1981423 ?auto_1981422 ) ( SURFACE-AT ?auto_1981419 ?auto_1981422 ) ( CLEAR ?auto_1981419 ) ( IS-CRATE ?auto_1981420 ) ( not ( = ?auto_1981419 ?auto_1981420 ) ) ( TRUCK-AT ?auto_1981421 ?auto_1981422 ) ( AVAILABLE ?auto_1981423 ) ( IN ?auto_1981420 ?auto_1981421 ) ( ON ?auto_1981419 ?auto_1981418 ) ( not ( = ?auto_1981418 ?auto_1981419 ) ) ( not ( = ?auto_1981418 ?auto_1981420 ) ) ( ON ?auto_1981407 ?auto_1981406 ) ( ON ?auto_1981408 ?auto_1981407 ) ( ON ?auto_1981410 ?auto_1981408 ) ( ON ?auto_1981409 ?auto_1981410 ) ( ON ?auto_1981411 ?auto_1981409 ) ( ON ?auto_1981412 ?auto_1981411 ) ( ON ?auto_1981413 ?auto_1981412 ) ( ON ?auto_1981414 ?auto_1981413 ) ( ON ?auto_1981415 ?auto_1981414 ) ( ON ?auto_1981416 ?auto_1981415 ) ( ON ?auto_1981417 ?auto_1981416 ) ( ON ?auto_1981418 ?auto_1981417 ) ( not ( = ?auto_1981406 ?auto_1981407 ) ) ( not ( = ?auto_1981406 ?auto_1981408 ) ) ( not ( = ?auto_1981406 ?auto_1981410 ) ) ( not ( = ?auto_1981406 ?auto_1981409 ) ) ( not ( = ?auto_1981406 ?auto_1981411 ) ) ( not ( = ?auto_1981406 ?auto_1981412 ) ) ( not ( = ?auto_1981406 ?auto_1981413 ) ) ( not ( = ?auto_1981406 ?auto_1981414 ) ) ( not ( = ?auto_1981406 ?auto_1981415 ) ) ( not ( = ?auto_1981406 ?auto_1981416 ) ) ( not ( = ?auto_1981406 ?auto_1981417 ) ) ( not ( = ?auto_1981406 ?auto_1981418 ) ) ( not ( = ?auto_1981406 ?auto_1981419 ) ) ( not ( = ?auto_1981406 ?auto_1981420 ) ) ( not ( = ?auto_1981407 ?auto_1981408 ) ) ( not ( = ?auto_1981407 ?auto_1981410 ) ) ( not ( = ?auto_1981407 ?auto_1981409 ) ) ( not ( = ?auto_1981407 ?auto_1981411 ) ) ( not ( = ?auto_1981407 ?auto_1981412 ) ) ( not ( = ?auto_1981407 ?auto_1981413 ) ) ( not ( = ?auto_1981407 ?auto_1981414 ) ) ( not ( = ?auto_1981407 ?auto_1981415 ) ) ( not ( = ?auto_1981407 ?auto_1981416 ) ) ( not ( = ?auto_1981407 ?auto_1981417 ) ) ( not ( = ?auto_1981407 ?auto_1981418 ) ) ( not ( = ?auto_1981407 ?auto_1981419 ) ) ( not ( = ?auto_1981407 ?auto_1981420 ) ) ( not ( = ?auto_1981408 ?auto_1981410 ) ) ( not ( = ?auto_1981408 ?auto_1981409 ) ) ( not ( = ?auto_1981408 ?auto_1981411 ) ) ( not ( = ?auto_1981408 ?auto_1981412 ) ) ( not ( = ?auto_1981408 ?auto_1981413 ) ) ( not ( = ?auto_1981408 ?auto_1981414 ) ) ( not ( = ?auto_1981408 ?auto_1981415 ) ) ( not ( = ?auto_1981408 ?auto_1981416 ) ) ( not ( = ?auto_1981408 ?auto_1981417 ) ) ( not ( = ?auto_1981408 ?auto_1981418 ) ) ( not ( = ?auto_1981408 ?auto_1981419 ) ) ( not ( = ?auto_1981408 ?auto_1981420 ) ) ( not ( = ?auto_1981410 ?auto_1981409 ) ) ( not ( = ?auto_1981410 ?auto_1981411 ) ) ( not ( = ?auto_1981410 ?auto_1981412 ) ) ( not ( = ?auto_1981410 ?auto_1981413 ) ) ( not ( = ?auto_1981410 ?auto_1981414 ) ) ( not ( = ?auto_1981410 ?auto_1981415 ) ) ( not ( = ?auto_1981410 ?auto_1981416 ) ) ( not ( = ?auto_1981410 ?auto_1981417 ) ) ( not ( = ?auto_1981410 ?auto_1981418 ) ) ( not ( = ?auto_1981410 ?auto_1981419 ) ) ( not ( = ?auto_1981410 ?auto_1981420 ) ) ( not ( = ?auto_1981409 ?auto_1981411 ) ) ( not ( = ?auto_1981409 ?auto_1981412 ) ) ( not ( = ?auto_1981409 ?auto_1981413 ) ) ( not ( = ?auto_1981409 ?auto_1981414 ) ) ( not ( = ?auto_1981409 ?auto_1981415 ) ) ( not ( = ?auto_1981409 ?auto_1981416 ) ) ( not ( = ?auto_1981409 ?auto_1981417 ) ) ( not ( = ?auto_1981409 ?auto_1981418 ) ) ( not ( = ?auto_1981409 ?auto_1981419 ) ) ( not ( = ?auto_1981409 ?auto_1981420 ) ) ( not ( = ?auto_1981411 ?auto_1981412 ) ) ( not ( = ?auto_1981411 ?auto_1981413 ) ) ( not ( = ?auto_1981411 ?auto_1981414 ) ) ( not ( = ?auto_1981411 ?auto_1981415 ) ) ( not ( = ?auto_1981411 ?auto_1981416 ) ) ( not ( = ?auto_1981411 ?auto_1981417 ) ) ( not ( = ?auto_1981411 ?auto_1981418 ) ) ( not ( = ?auto_1981411 ?auto_1981419 ) ) ( not ( = ?auto_1981411 ?auto_1981420 ) ) ( not ( = ?auto_1981412 ?auto_1981413 ) ) ( not ( = ?auto_1981412 ?auto_1981414 ) ) ( not ( = ?auto_1981412 ?auto_1981415 ) ) ( not ( = ?auto_1981412 ?auto_1981416 ) ) ( not ( = ?auto_1981412 ?auto_1981417 ) ) ( not ( = ?auto_1981412 ?auto_1981418 ) ) ( not ( = ?auto_1981412 ?auto_1981419 ) ) ( not ( = ?auto_1981412 ?auto_1981420 ) ) ( not ( = ?auto_1981413 ?auto_1981414 ) ) ( not ( = ?auto_1981413 ?auto_1981415 ) ) ( not ( = ?auto_1981413 ?auto_1981416 ) ) ( not ( = ?auto_1981413 ?auto_1981417 ) ) ( not ( = ?auto_1981413 ?auto_1981418 ) ) ( not ( = ?auto_1981413 ?auto_1981419 ) ) ( not ( = ?auto_1981413 ?auto_1981420 ) ) ( not ( = ?auto_1981414 ?auto_1981415 ) ) ( not ( = ?auto_1981414 ?auto_1981416 ) ) ( not ( = ?auto_1981414 ?auto_1981417 ) ) ( not ( = ?auto_1981414 ?auto_1981418 ) ) ( not ( = ?auto_1981414 ?auto_1981419 ) ) ( not ( = ?auto_1981414 ?auto_1981420 ) ) ( not ( = ?auto_1981415 ?auto_1981416 ) ) ( not ( = ?auto_1981415 ?auto_1981417 ) ) ( not ( = ?auto_1981415 ?auto_1981418 ) ) ( not ( = ?auto_1981415 ?auto_1981419 ) ) ( not ( = ?auto_1981415 ?auto_1981420 ) ) ( not ( = ?auto_1981416 ?auto_1981417 ) ) ( not ( = ?auto_1981416 ?auto_1981418 ) ) ( not ( = ?auto_1981416 ?auto_1981419 ) ) ( not ( = ?auto_1981416 ?auto_1981420 ) ) ( not ( = ?auto_1981417 ?auto_1981418 ) ) ( not ( = ?auto_1981417 ?auto_1981419 ) ) ( not ( = ?auto_1981417 ?auto_1981420 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1981418 ?auto_1981419 ?auto_1981420 )
      ( MAKE-14CRATE-VERIFY ?auto_1981406 ?auto_1981407 ?auto_1981408 ?auto_1981410 ?auto_1981409 ?auto_1981411 ?auto_1981412 ?auto_1981413 ?auto_1981414 ?auto_1981415 ?auto_1981416 ?auto_1981417 ?auto_1981418 ?auto_1981419 ?auto_1981420 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1981581 - SURFACE
      ?auto_1981582 - SURFACE
      ?auto_1981583 - SURFACE
      ?auto_1981585 - SURFACE
      ?auto_1981584 - SURFACE
      ?auto_1981586 - SURFACE
      ?auto_1981587 - SURFACE
      ?auto_1981588 - SURFACE
      ?auto_1981589 - SURFACE
      ?auto_1981590 - SURFACE
      ?auto_1981591 - SURFACE
      ?auto_1981592 - SURFACE
      ?auto_1981593 - SURFACE
      ?auto_1981594 - SURFACE
      ?auto_1981595 - SURFACE
    )
    :vars
    (
      ?auto_1981598 - HOIST
      ?auto_1981599 - PLACE
      ?auto_1981597 - TRUCK
      ?auto_1981596 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1981598 ?auto_1981599 ) ( SURFACE-AT ?auto_1981594 ?auto_1981599 ) ( CLEAR ?auto_1981594 ) ( IS-CRATE ?auto_1981595 ) ( not ( = ?auto_1981594 ?auto_1981595 ) ) ( AVAILABLE ?auto_1981598 ) ( IN ?auto_1981595 ?auto_1981597 ) ( ON ?auto_1981594 ?auto_1981593 ) ( not ( = ?auto_1981593 ?auto_1981594 ) ) ( not ( = ?auto_1981593 ?auto_1981595 ) ) ( TRUCK-AT ?auto_1981597 ?auto_1981596 ) ( not ( = ?auto_1981596 ?auto_1981599 ) ) ( ON ?auto_1981582 ?auto_1981581 ) ( ON ?auto_1981583 ?auto_1981582 ) ( ON ?auto_1981585 ?auto_1981583 ) ( ON ?auto_1981584 ?auto_1981585 ) ( ON ?auto_1981586 ?auto_1981584 ) ( ON ?auto_1981587 ?auto_1981586 ) ( ON ?auto_1981588 ?auto_1981587 ) ( ON ?auto_1981589 ?auto_1981588 ) ( ON ?auto_1981590 ?auto_1981589 ) ( ON ?auto_1981591 ?auto_1981590 ) ( ON ?auto_1981592 ?auto_1981591 ) ( ON ?auto_1981593 ?auto_1981592 ) ( not ( = ?auto_1981581 ?auto_1981582 ) ) ( not ( = ?auto_1981581 ?auto_1981583 ) ) ( not ( = ?auto_1981581 ?auto_1981585 ) ) ( not ( = ?auto_1981581 ?auto_1981584 ) ) ( not ( = ?auto_1981581 ?auto_1981586 ) ) ( not ( = ?auto_1981581 ?auto_1981587 ) ) ( not ( = ?auto_1981581 ?auto_1981588 ) ) ( not ( = ?auto_1981581 ?auto_1981589 ) ) ( not ( = ?auto_1981581 ?auto_1981590 ) ) ( not ( = ?auto_1981581 ?auto_1981591 ) ) ( not ( = ?auto_1981581 ?auto_1981592 ) ) ( not ( = ?auto_1981581 ?auto_1981593 ) ) ( not ( = ?auto_1981581 ?auto_1981594 ) ) ( not ( = ?auto_1981581 ?auto_1981595 ) ) ( not ( = ?auto_1981582 ?auto_1981583 ) ) ( not ( = ?auto_1981582 ?auto_1981585 ) ) ( not ( = ?auto_1981582 ?auto_1981584 ) ) ( not ( = ?auto_1981582 ?auto_1981586 ) ) ( not ( = ?auto_1981582 ?auto_1981587 ) ) ( not ( = ?auto_1981582 ?auto_1981588 ) ) ( not ( = ?auto_1981582 ?auto_1981589 ) ) ( not ( = ?auto_1981582 ?auto_1981590 ) ) ( not ( = ?auto_1981582 ?auto_1981591 ) ) ( not ( = ?auto_1981582 ?auto_1981592 ) ) ( not ( = ?auto_1981582 ?auto_1981593 ) ) ( not ( = ?auto_1981582 ?auto_1981594 ) ) ( not ( = ?auto_1981582 ?auto_1981595 ) ) ( not ( = ?auto_1981583 ?auto_1981585 ) ) ( not ( = ?auto_1981583 ?auto_1981584 ) ) ( not ( = ?auto_1981583 ?auto_1981586 ) ) ( not ( = ?auto_1981583 ?auto_1981587 ) ) ( not ( = ?auto_1981583 ?auto_1981588 ) ) ( not ( = ?auto_1981583 ?auto_1981589 ) ) ( not ( = ?auto_1981583 ?auto_1981590 ) ) ( not ( = ?auto_1981583 ?auto_1981591 ) ) ( not ( = ?auto_1981583 ?auto_1981592 ) ) ( not ( = ?auto_1981583 ?auto_1981593 ) ) ( not ( = ?auto_1981583 ?auto_1981594 ) ) ( not ( = ?auto_1981583 ?auto_1981595 ) ) ( not ( = ?auto_1981585 ?auto_1981584 ) ) ( not ( = ?auto_1981585 ?auto_1981586 ) ) ( not ( = ?auto_1981585 ?auto_1981587 ) ) ( not ( = ?auto_1981585 ?auto_1981588 ) ) ( not ( = ?auto_1981585 ?auto_1981589 ) ) ( not ( = ?auto_1981585 ?auto_1981590 ) ) ( not ( = ?auto_1981585 ?auto_1981591 ) ) ( not ( = ?auto_1981585 ?auto_1981592 ) ) ( not ( = ?auto_1981585 ?auto_1981593 ) ) ( not ( = ?auto_1981585 ?auto_1981594 ) ) ( not ( = ?auto_1981585 ?auto_1981595 ) ) ( not ( = ?auto_1981584 ?auto_1981586 ) ) ( not ( = ?auto_1981584 ?auto_1981587 ) ) ( not ( = ?auto_1981584 ?auto_1981588 ) ) ( not ( = ?auto_1981584 ?auto_1981589 ) ) ( not ( = ?auto_1981584 ?auto_1981590 ) ) ( not ( = ?auto_1981584 ?auto_1981591 ) ) ( not ( = ?auto_1981584 ?auto_1981592 ) ) ( not ( = ?auto_1981584 ?auto_1981593 ) ) ( not ( = ?auto_1981584 ?auto_1981594 ) ) ( not ( = ?auto_1981584 ?auto_1981595 ) ) ( not ( = ?auto_1981586 ?auto_1981587 ) ) ( not ( = ?auto_1981586 ?auto_1981588 ) ) ( not ( = ?auto_1981586 ?auto_1981589 ) ) ( not ( = ?auto_1981586 ?auto_1981590 ) ) ( not ( = ?auto_1981586 ?auto_1981591 ) ) ( not ( = ?auto_1981586 ?auto_1981592 ) ) ( not ( = ?auto_1981586 ?auto_1981593 ) ) ( not ( = ?auto_1981586 ?auto_1981594 ) ) ( not ( = ?auto_1981586 ?auto_1981595 ) ) ( not ( = ?auto_1981587 ?auto_1981588 ) ) ( not ( = ?auto_1981587 ?auto_1981589 ) ) ( not ( = ?auto_1981587 ?auto_1981590 ) ) ( not ( = ?auto_1981587 ?auto_1981591 ) ) ( not ( = ?auto_1981587 ?auto_1981592 ) ) ( not ( = ?auto_1981587 ?auto_1981593 ) ) ( not ( = ?auto_1981587 ?auto_1981594 ) ) ( not ( = ?auto_1981587 ?auto_1981595 ) ) ( not ( = ?auto_1981588 ?auto_1981589 ) ) ( not ( = ?auto_1981588 ?auto_1981590 ) ) ( not ( = ?auto_1981588 ?auto_1981591 ) ) ( not ( = ?auto_1981588 ?auto_1981592 ) ) ( not ( = ?auto_1981588 ?auto_1981593 ) ) ( not ( = ?auto_1981588 ?auto_1981594 ) ) ( not ( = ?auto_1981588 ?auto_1981595 ) ) ( not ( = ?auto_1981589 ?auto_1981590 ) ) ( not ( = ?auto_1981589 ?auto_1981591 ) ) ( not ( = ?auto_1981589 ?auto_1981592 ) ) ( not ( = ?auto_1981589 ?auto_1981593 ) ) ( not ( = ?auto_1981589 ?auto_1981594 ) ) ( not ( = ?auto_1981589 ?auto_1981595 ) ) ( not ( = ?auto_1981590 ?auto_1981591 ) ) ( not ( = ?auto_1981590 ?auto_1981592 ) ) ( not ( = ?auto_1981590 ?auto_1981593 ) ) ( not ( = ?auto_1981590 ?auto_1981594 ) ) ( not ( = ?auto_1981590 ?auto_1981595 ) ) ( not ( = ?auto_1981591 ?auto_1981592 ) ) ( not ( = ?auto_1981591 ?auto_1981593 ) ) ( not ( = ?auto_1981591 ?auto_1981594 ) ) ( not ( = ?auto_1981591 ?auto_1981595 ) ) ( not ( = ?auto_1981592 ?auto_1981593 ) ) ( not ( = ?auto_1981592 ?auto_1981594 ) ) ( not ( = ?auto_1981592 ?auto_1981595 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1981593 ?auto_1981594 ?auto_1981595 )
      ( MAKE-14CRATE-VERIFY ?auto_1981581 ?auto_1981582 ?auto_1981583 ?auto_1981585 ?auto_1981584 ?auto_1981586 ?auto_1981587 ?auto_1981588 ?auto_1981589 ?auto_1981590 ?auto_1981591 ?auto_1981592 ?auto_1981593 ?auto_1981594 ?auto_1981595 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1981770 - SURFACE
      ?auto_1981771 - SURFACE
      ?auto_1981772 - SURFACE
      ?auto_1981774 - SURFACE
      ?auto_1981773 - SURFACE
      ?auto_1981775 - SURFACE
      ?auto_1981776 - SURFACE
      ?auto_1981777 - SURFACE
      ?auto_1981778 - SURFACE
      ?auto_1981779 - SURFACE
      ?auto_1981780 - SURFACE
      ?auto_1981781 - SURFACE
      ?auto_1981782 - SURFACE
      ?auto_1981783 - SURFACE
      ?auto_1981784 - SURFACE
    )
    :vars
    (
      ?auto_1981788 - HOIST
      ?auto_1981787 - PLACE
      ?auto_1981789 - TRUCK
      ?auto_1981785 - PLACE
      ?auto_1981786 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1981788 ?auto_1981787 ) ( SURFACE-AT ?auto_1981783 ?auto_1981787 ) ( CLEAR ?auto_1981783 ) ( IS-CRATE ?auto_1981784 ) ( not ( = ?auto_1981783 ?auto_1981784 ) ) ( AVAILABLE ?auto_1981788 ) ( ON ?auto_1981783 ?auto_1981782 ) ( not ( = ?auto_1981782 ?auto_1981783 ) ) ( not ( = ?auto_1981782 ?auto_1981784 ) ) ( TRUCK-AT ?auto_1981789 ?auto_1981785 ) ( not ( = ?auto_1981785 ?auto_1981787 ) ) ( HOIST-AT ?auto_1981786 ?auto_1981785 ) ( LIFTING ?auto_1981786 ?auto_1981784 ) ( not ( = ?auto_1981788 ?auto_1981786 ) ) ( ON ?auto_1981771 ?auto_1981770 ) ( ON ?auto_1981772 ?auto_1981771 ) ( ON ?auto_1981774 ?auto_1981772 ) ( ON ?auto_1981773 ?auto_1981774 ) ( ON ?auto_1981775 ?auto_1981773 ) ( ON ?auto_1981776 ?auto_1981775 ) ( ON ?auto_1981777 ?auto_1981776 ) ( ON ?auto_1981778 ?auto_1981777 ) ( ON ?auto_1981779 ?auto_1981778 ) ( ON ?auto_1981780 ?auto_1981779 ) ( ON ?auto_1981781 ?auto_1981780 ) ( ON ?auto_1981782 ?auto_1981781 ) ( not ( = ?auto_1981770 ?auto_1981771 ) ) ( not ( = ?auto_1981770 ?auto_1981772 ) ) ( not ( = ?auto_1981770 ?auto_1981774 ) ) ( not ( = ?auto_1981770 ?auto_1981773 ) ) ( not ( = ?auto_1981770 ?auto_1981775 ) ) ( not ( = ?auto_1981770 ?auto_1981776 ) ) ( not ( = ?auto_1981770 ?auto_1981777 ) ) ( not ( = ?auto_1981770 ?auto_1981778 ) ) ( not ( = ?auto_1981770 ?auto_1981779 ) ) ( not ( = ?auto_1981770 ?auto_1981780 ) ) ( not ( = ?auto_1981770 ?auto_1981781 ) ) ( not ( = ?auto_1981770 ?auto_1981782 ) ) ( not ( = ?auto_1981770 ?auto_1981783 ) ) ( not ( = ?auto_1981770 ?auto_1981784 ) ) ( not ( = ?auto_1981771 ?auto_1981772 ) ) ( not ( = ?auto_1981771 ?auto_1981774 ) ) ( not ( = ?auto_1981771 ?auto_1981773 ) ) ( not ( = ?auto_1981771 ?auto_1981775 ) ) ( not ( = ?auto_1981771 ?auto_1981776 ) ) ( not ( = ?auto_1981771 ?auto_1981777 ) ) ( not ( = ?auto_1981771 ?auto_1981778 ) ) ( not ( = ?auto_1981771 ?auto_1981779 ) ) ( not ( = ?auto_1981771 ?auto_1981780 ) ) ( not ( = ?auto_1981771 ?auto_1981781 ) ) ( not ( = ?auto_1981771 ?auto_1981782 ) ) ( not ( = ?auto_1981771 ?auto_1981783 ) ) ( not ( = ?auto_1981771 ?auto_1981784 ) ) ( not ( = ?auto_1981772 ?auto_1981774 ) ) ( not ( = ?auto_1981772 ?auto_1981773 ) ) ( not ( = ?auto_1981772 ?auto_1981775 ) ) ( not ( = ?auto_1981772 ?auto_1981776 ) ) ( not ( = ?auto_1981772 ?auto_1981777 ) ) ( not ( = ?auto_1981772 ?auto_1981778 ) ) ( not ( = ?auto_1981772 ?auto_1981779 ) ) ( not ( = ?auto_1981772 ?auto_1981780 ) ) ( not ( = ?auto_1981772 ?auto_1981781 ) ) ( not ( = ?auto_1981772 ?auto_1981782 ) ) ( not ( = ?auto_1981772 ?auto_1981783 ) ) ( not ( = ?auto_1981772 ?auto_1981784 ) ) ( not ( = ?auto_1981774 ?auto_1981773 ) ) ( not ( = ?auto_1981774 ?auto_1981775 ) ) ( not ( = ?auto_1981774 ?auto_1981776 ) ) ( not ( = ?auto_1981774 ?auto_1981777 ) ) ( not ( = ?auto_1981774 ?auto_1981778 ) ) ( not ( = ?auto_1981774 ?auto_1981779 ) ) ( not ( = ?auto_1981774 ?auto_1981780 ) ) ( not ( = ?auto_1981774 ?auto_1981781 ) ) ( not ( = ?auto_1981774 ?auto_1981782 ) ) ( not ( = ?auto_1981774 ?auto_1981783 ) ) ( not ( = ?auto_1981774 ?auto_1981784 ) ) ( not ( = ?auto_1981773 ?auto_1981775 ) ) ( not ( = ?auto_1981773 ?auto_1981776 ) ) ( not ( = ?auto_1981773 ?auto_1981777 ) ) ( not ( = ?auto_1981773 ?auto_1981778 ) ) ( not ( = ?auto_1981773 ?auto_1981779 ) ) ( not ( = ?auto_1981773 ?auto_1981780 ) ) ( not ( = ?auto_1981773 ?auto_1981781 ) ) ( not ( = ?auto_1981773 ?auto_1981782 ) ) ( not ( = ?auto_1981773 ?auto_1981783 ) ) ( not ( = ?auto_1981773 ?auto_1981784 ) ) ( not ( = ?auto_1981775 ?auto_1981776 ) ) ( not ( = ?auto_1981775 ?auto_1981777 ) ) ( not ( = ?auto_1981775 ?auto_1981778 ) ) ( not ( = ?auto_1981775 ?auto_1981779 ) ) ( not ( = ?auto_1981775 ?auto_1981780 ) ) ( not ( = ?auto_1981775 ?auto_1981781 ) ) ( not ( = ?auto_1981775 ?auto_1981782 ) ) ( not ( = ?auto_1981775 ?auto_1981783 ) ) ( not ( = ?auto_1981775 ?auto_1981784 ) ) ( not ( = ?auto_1981776 ?auto_1981777 ) ) ( not ( = ?auto_1981776 ?auto_1981778 ) ) ( not ( = ?auto_1981776 ?auto_1981779 ) ) ( not ( = ?auto_1981776 ?auto_1981780 ) ) ( not ( = ?auto_1981776 ?auto_1981781 ) ) ( not ( = ?auto_1981776 ?auto_1981782 ) ) ( not ( = ?auto_1981776 ?auto_1981783 ) ) ( not ( = ?auto_1981776 ?auto_1981784 ) ) ( not ( = ?auto_1981777 ?auto_1981778 ) ) ( not ( = ?auto_1981777 ?auto_1981779 ) ) ( not ( = ?auto_1981777 ?auto_1981780 ) ) ( not ( = ?auto_1981777 ?auto_1981781 ) ) ( not ( = ?auto_1981777 ?auto_1981782 ) ) ( not ( = ?auto_1981777 ?auto_1981783 ) ) ( not ( = ?auto_1981777 ?auto_1981784 ) ) ( not ( = ?auto_1981778 ?auto_1981779 ) ) ( not ( = ?auto_1981778 ?auto_1981780 ) ) ( not ( = ?auto_1981778 ?auto_1981781 ) ) ( not ( = ?auto_1981778 ?auto_1981782 ) ) ( not ( = ?auto_1981778 ?auto_1981783 ) ) ( not ( = ?auto_1981778 ?auto_1981784 ) ) ( not ( = ?auto_1981779 ?auto_1981780 ) ) ( not ( = ?auto_1981779 ?auto_1981781 ) ) ( not ( = ?auto_1981779 ?auto_1981782 ) ) ( not ( = ?auto_1981779 ?auto_1981783 ) ) ( not ( = ?auto_1981779 ?auto_1981784 ) ) ( not ( = ?auto_1981780 ?auto_1981781 ) ) ( not ( = ?auto_1981780 ?auto_1981782 ) ) ( not ( = ?auto_1981780 ?auto_1981783 ) ) ( not ( = ?auto_1981780 ?auto_1981784 ) ) ( not ( = ?auto_1981781 ?auto_1981782 ) ) ( not ( = ?auto_1981781 ?auto_1981783 ) ) ( not ( = ?auto_1981781 ?auto_1981784 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1981782 ?auto_1981783 ?auto_1981784 )
      ( MAKE-14CRATE-VERIFY ?auto_1981770 ?auto_1981771 ?auto_1981772 ?auto_1981774 ?auto_1981773 ?auto_1981775 ?auto_1981776 ?auto_1981777 ?auto_1981778 ?auto_1981779 ?auto_1981780 ?auto_1981781 ?auto_1981782 ?auto_1981783 ?auto_1981784 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1981973 - SURFACE
      ?auto_1981974 - SURFACE
      ?auto_1981975 - SURFACE
      ?auto_1981977 - SURFACE
      ?auto_1981976 - SURFACE
      ?auto_1981978 - SURFACE
      ?auto_1981979 - SURFACE
      ?auto_1981980 - SURFACE
      ?auto_1981981 - SURFACE
      ?auto_1981982 - SURFACE
      ?auto_1981983 - SURFACE
      ?auto_1981984 - SURFACE
      ?auto_1981985 - SURFACE
      ?auto_1981986 - SURFACE
      ?auto_1981987 - SURFACE
    )
    :vars
    (
      ?auto_1981990 - HOIST
      ?auto_1981991 - PLACE
      ?auto_1981993 - TRUCK
      ?auto_1981989 - PLACE
      ?auto_1981988 - HOIST
      ?auto_1981992 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1981990 ?auto_1981991 ) ( SURFACE-AT ?auto_1981986 ?auto_1981991 ) ( CLEAR ?auto_1981986 ) ( IS-CRATE ?auto_1981987 ) ( not ( = ?auto_1981986 ?auto_1981987 ) ) ( AVAILABLE ?auto_1981990 ) ( ON ?auto_1981986 ?auto_1981985 ) ( not ( = ?auto_1981985 ?auto_1981986 ) ) ( not ( = ?auto_1981985 ?auto_1981987 ) ) ( TRUCK-AT ?auto_1981993 ?auto_1981989 ) ( not ( = ?auto_1981989 ?auto_1981991 ) ) ( HOIST-AT ?auto_1981988 ?auto_1981989 ) ( not ( = ?auto_1981990 ?auto_1981988 ) ) ( AVAILABLE ?auto_1981988 ) ( SURFACE-AT ?auto_1981987 ?auto_1981989 ) ( ON ?auto_1981987 ?auto_1981992 ) ( CLEAR ?auto_1981987 ) ( not ( = ?auto_1981986 ?auto_1981992 ) ) ( not ( = ?auto_1981987 ?auto_1981992 ) ) ( not ( = ?auto_1981985 ?auto_1981992 ) ) ( ON ?auto_1981974 ?auto_1981973 ) ( ON ?auto_1981975 ?auto_1981974 ) ( ON ?auto_1981977 ?auto_1981975 ) ( ON ?auto_1981976 ?auto_1981977 ) ( ON ?auto_1981978 ?auto_1981976 ) ( ON ?auto_1981979 ?auto_1981978 ) ( ON ?auto_1981980 ?auto_1981979 ) ( ON ?auto_1981981 ?auto_1981980 ) ( ON ?auto_1981982 ?auto_1981981 ) ( ON ?auto_1981983 ?auto_1981982 ) ( ON ?auto_1981984 ?auto_1981983 ) ( ON ?auto_1981985 ?auto_1981984 ) ( not ( = ?auto_1981973 ?auto_1981974 ) ) ( not ( = ?auto_1981973 ?auto_1981975 ) ) ( not ( = ?auto_1981973 ?auto_1981977 ) ) ( not ( = ?auto_1981973 ?auto_1981976 ) ) ( not ( = ?auto_1981973 ?auto_1981978 ) ) ( not ( = ?auto_1981973 ?auto_1981979 ) ) ( not ( = ?auto_1981973 ?auto_1981980 ) ) ( not ( = ?auto_1981973 ?auto_1981981 ) ) ( not ( = ?auto_1981973 ?auto_1981982 ) ) ( not ( = ?auto_1981973 ?auto_1981983 ) ) ( not ( = ?auto_1981973 ?auto_1981984 ) ) ( not ( = ?auto_1981973 ?auto_1981985 ) ) ( not ( = ?auto_1981973 ?auto_1981986 ) ) ( not ( = ?auto_1981973 ?auto_1981987 ) ) ( not ( = ?auto_1981973 ?auto_1981992 ) ) ( not ( = ?auto_1981974 ?auto_1981975 ) ) ( not ( = ?auto_1981974 ?auto_1981977 ) ) ( not ( = ?auto_1981974 ?auto_1981976 ) ) ( not ( = ?auto_1981974 ?auto_1981978 ) ) ( not ( = ?auto_1981974 ?auto_1981979 ) ) ( not ( = ?auto_1981974 ?auto_1981980 ) ) ( not ( = ?auto_1981974 ?auto_1981981 ) ) ( not ( = ?auto_1981974 ?auto_1981982 ) ) ( not ( = ?auto_1981974 ?auto_1981983 ) ) ( not ( = ?auto_1981974 ?auto_1981984 ) ) ( not ( = ?auto_1981974 ?auto_1981985 ) ) ( not ( = ?auto_1981974 ?auto_1981986 ) ) ( not ( = ?auto_1981974 ?auto_1981987 ) ) ( not ( = ?auto_1981974 ?auto_1981992 ) ) ( not ( = ?auto_1981975 ?auto_1981977 ) ) ( not ( = ?auto_1981975 ?auto_1981976 ) ) ( not ( = ?auto_1981975 ?auto_1981978 ) ) ( not ( = ?auto_1981975 ?auto_1981979 ) ) ( not ( = ?auto_1981975 ?auto_1981980 ) ) ( not ( = ?auto_1981975 ?auto_1981981 ) ) ( not ( = ?auto_1981975 ?auto_1981982 ) ) ( not ( = ?auto_1981975 ?auto_1981983 ) ) ( not ( = ?auto_1981975 ?auto_1981984 ) ) ( not ( = ?auto_1981975 ?auto_1981985 ) ) ( not ( = ?auto_1981975 ?auto_1981986 ) ) ( not ( = ?auto_1981975 ?auto_1981987 ) ) ( not ( = ?auto_1981975 ?auto_1981992 ) ) ( not ( = ?auto_1981977 ?auto_1981976 ) ) ( not ( = ?auto_1981977 ?auto_1981978 ) ) ( not ( = ?auto_1981977 ?auto_1981979 ) ) ( not ( = ?auto_1981977 ?auto_1981980 ) ) ( not ( = ?auto_1981977 ?auto_1981981 ) ) ( not ( = ?auto_1981977 ?auto_1981982 ) ) ( not ( = ?auto_1981977 ?auto_1981983 ) ) ( not ( = ?auto_1981977 ?auto_1981984 ) ) ( not ( = ?auto_1981977 ?auto_1981985 ) ) ( not ( = ?auto_1981977 ?auto_1981986 ) ) ( not ( = ?auto_1981977 ?auto_1981987 ) ) ( not ( = ?auto_1981977 ?auto_1981992 ) ) ( not ( = ?auto_1981976 ?auto_1981978 ) ) ( not ( = ?auto_1981976 ?auto_1981979 ) ) ( not ( = ?auto_1981976 ?auto_1981980 ) ) ( not ( = ?auto_1981976 ?auto_1981981 ) ) ( not ( = ?auto_1981976 ?auto_1981982 ) ) ( not ( = ?auto_1981976 ?auto_1981983 ) ) ( not ( = ?auto_1981976 ?auto_1981984 ) ) ( not ( = ?auto_1981976 ?auto_1981985 ) ) ( not ( = ?auto_1981976 ?auto_1981986 ) ) ( not ( = ?auto_1981976 ?auto_1981987 ) ) ( not ( = ?auto_1981976 ?auto_1981992 ) ) ( not ( = ?auto_1981978 ?auto_1981979 ) ) ( not ( = ?auto_1981978 ?auto_1981980 ) ) ( not ( = ?auto_1981978 ?auto_1981981 ) ) ( not ( = ?auto_1981978 ?auto_1981982 ) ) ( not ( = ?auto_1981978 ?auto_1981983 ) ) ( not ( = ?auto_1981978 ?auto_1981984 ) ) ( not ( = ?auto_1981978 ?auto_1981985 ) ) ( not ( = ?auto_1981978 ?auto_1981986 ) ) ( not ( = ?auto_1981978 ?auto_1981987 ) ) ( not ( = ?auto_1981978 ?auto_1981992 ) ) ( not ( = ?auto_1981979 ?auto_1981980 ) ) ( not ( = ?auto_1981979 ?auto_1981981 ) ) ( not ( = ?auto_1981979 ?auto_1981982 ) ) ( not ( = ?auto_1981979 ?auto_1981983 ) ) ( not ( = ?auto_1981979 ?auto_1981984 ) ) ( not ( = ?auto_1981979 ?auto_1981985 ) ) ( not ( = ?auto_1981979 ?auto_1981986 ) ) ( not ( = ?auto_1981979 ?auto_1981987 ) ) ( not ( = ?auto_1981979 ?auto_1981992 ) ) ( not ( = ?auto_1981980 ?auto_1981981 ) ) ( not ( = ?auto_1981980 ?auto_1981982 ) ) ( not ( = ?auto_1981980 ?auto_1981983 ) ) ( not ( = ?auto_1981980 ?auto_1981984 ) ) ( not ( = ?auto_1981980 ?auto_1981985 ) ) ( not ( = ?auto_1981980 ?auto_1981986 ) ) ( not ( = ?auto_1981980 ?auto_1981987 ) ) ( not ( = ?auto_1981980 ?auto_1981992 ) ) ( not ( = ?auto_1981981 ?auto_1981982 ) ) ( not ( = ?auto_1981981 ?auto_1981983 ) ) ( not ( = ?auto_1981981 ?auto_1981984 ) ) ( not ( = ?auto_1981981 ?auto_1981985 ) ) ( not ( = ?auto_1981981 ?auto_1981986 ) ) ( not ( = ?auto_1981981 ?auto_1981987 ) ) ( not ( = ?auto_1981981 ?auto_1981992 ) ) ( not ( = ?auto_1981982 ?auto_1981983 ) ) ( not ( = ?auto_1981982 ?auto_1981984 ) ) ( not ( = ?auto_1981982 ?auto_1981985 ) ) ( not ( = ?auto_1981982 ?auto_1981986 ) ) ( not ( = ?auto_1981982 ?auto_1981987 ) ) ( not ( = ?auto_1981982 ?auto_1981992 ) ) ( not ( = ?auto_1981983 ?auto_1981984 ) ) ( not ( = ?auto_1981983 ?auto_1981985 ) ) ( not ( = ?auto_1981983 ?auto_1981986 ) ) ( not ( = ?auto_1981983 ?auto_1981987 ) ) ( not ( = ?auto_1981983 ?auto_1981992 ) ) ( not ( = ?auto_1981984 ?auto_1981985 ) ) ( not ( = ?auto_1981984 ?auto_1981986 ) ) ( not ( = ?auto_1981984 ?auto_1981987 ) ) ( not ( = ?auto_1981984 ?auto_1981992 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1981985 ?auto_1981986 ?auto_1981987 )
      ( MAKE-14CRATE-VERIFY ?auto_1981973 ?auto_1981974 ?auto_1981975 ?auto_1981977 ?auto_1981976 ?auto_1981978 ?auto_1981979 ?auto_1981980 ?auto_1981981 ?auto_1981982 ?auto_1981983 ?auto_1981984 ?auto_1981985 ?auto_1981986 ?auto_1981987 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1982177 - SURFACE
      ?auto_1982178 - SURFACE
      ?auto_1982179 - SURFACE
      ?auto_1982181 - SURFACE
      ?auto_1982180 - SURFACE
      ?auto_1982182 - SURFACE
      ?auto_1982183 - SURFACE
      ?auto_1982184 - SURFACE
      ?auto_1982185 - SURFACE
      ?auto_1982186 - SURFACE
      ?auto_1982187 - SURFACE
      ?auto_1982188 - SURFACE
      ?auto_1982189 - SURFACE
      ?auto_1982190 - SURFACE
      ?auto_1982191 - SURFACE
    )
    :vars
    (
      ?auto_1982192 - HOIST
      ?auto_1982197 - PLACE
      ?auto_1982195 - PLACE
      ?auto_1982193 - HOIST
      ?auto_1982196 - SURFACE
      ?auto_1982194 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1982192 ?auto_1982197 ) ( SURFACE-AT ?auto_1982190 ?auto_1982197 ) ( CLEAR ?auto_1982190 ) ( IS-CRATE ?auto_1982191 ) ( not ( = ?auto_1982190 ?auto_1982191 ) ) ( AVAILABLE ?auto_1982192 ) ( ON ?auto_1982190 ?auto_1982189 ) ( not ( = ?auto_1982189 ?auto_1982190 ) ) ( not ( = ?auto_1982189 ?auto_1982191 ) ) ( not ( = ?auto_1982195 ?auto_1982197 ) ) ( HOIST-AT ?auto_1982193 ?auto_1982195 ) ( not ( = ?auto_1982192 ?auto_1982193 ) ) ( AVAILABLE ?auto_1982193 ) ( SURFACE-AT ?auto_1982191 ?auto_1982195 ) ( ON ?auto_1982191 ?auto_1982196 ) ( CLEAR ?auto_1982191 ) ( not ( = ?auto_1982190 ?auto_1982196 ) ) ( not ( = ?auto_1982191 ?auto_1982196 ) ) ( not ( = ?auto_1982189 ?auto_1982196 ) ) ( TRUCK-AT ?auto_1982194 ?auto_1982197 ) ( ON ?auto_1982178 ?auto_1982177 ) ( ON ?auto_1982179 ?auto_1982178 ) ( ON ?auto_1982181 ?auto_1982179 ) ( ON ?auto_1982180 ?auto_1982181 ) ( ON ?auto_1982182 ?auto_1982180 ) ( ON ?auto_1982183 ?auto_1982182 ) ( ON ?auto_1982184 ?auto_1982183 ) ( ON ?auto_1982185 ?auto_1982184 ) ( ON ?auto_1982186 ?auto_1982185 ) ( ON ?auto_1982187 ?auto_1982186 ) ( ON ?auto_1982188 ?auto_1982187 ) ( ON ?auto_1982189 ?auto_1982188 ) ( not ( = ?auto_1982177 ?auto_1982178 ) ) ( not ( = ?auto_1982177 ?auto_1982179 ) ) ( not ( = ?auto_1982177 ?auto_1982181 ) ) ( not ( = ?auto_1982177 ?auto_1982180 ) ) ( not ( = ?auto_1982177 ?auto_1982182 ) ) ( not ( = ?auto_1982177 ?auto_1982183 ) ) ( not ( = ?auto_1982177 ?auto_1982184 ) ) ( not ( = ?auto_1982177 ?auto_1982185 ) ) ( not ( = ?auto_1982177 ?auto_1982186 ) ) ( not ( = ?auto_1982177 ?auto_1982187 ) ) ( not ( = ?auto_1982177 ?auto_1982188 ) ) ( not ( = ?auto_1982177 ?auto_1982189 ) ) ( not ( = ?auto_1982177 ?auto_1982190 ) ) ( not ( = ?auto_1982177 ?auto_1982191 ) ) ( not ( = ?auto_1982177 ?auto_1982196 ) ) ( not ( = ?auto_1982178 ?auto_1982179 ) ) ( not ( = ?auto_1982178 ?auto_1982181 ) ) ( not ( = ?auto_1982178 ?auto_1982180 ) ) ( not ( = ?auto_1982178 ?auto_1982182 ) ) ( not ( = ?auto_1982178 ?auto_1982183 ) ) ( not ( = ?auto_1982178 ?auto_1982184 ) ) ( not ( = ?auto_1982178 ?auto_1982185 ) ) ( not ( = ?auto_1982178 ?auto_1982186 ) ) ( not ( = ?auto_1982178 ?auto_1982187 ) ) ( not ( = ?auto_1982178 ?auto_1982188 ) ) ( not ( = ?auto_1982178 ?auto_1982189 ) ) ( not ( = ?auto_1982178 ?auto_1982190 ) ) ( not ( = ?auto_1982178 ?auto_1982191 ) ) ( not ( = ?auto_1982178 ?auto_1982196 ) ) ( not ( = ?auto_1982179 ?auto_1982181 ) ) ( not ( = ?auto_1982179 ?auto_1982180 ) ) ( not ( = ?auto_1982179 ?auto_1982182 ) ) ( not ( = ?auto_1982179 ?auto_1982183 ) ) ( not ( = ?auto_1982179 ?auto_1982184 ) ) ( not ( = ?auto_1982179 ?auto_1982185 ) ) ( not ( = ?auto_1982179 ?auto_1982186 ) ) ( not ( = ?auto_1982179 ?auto_1982187 ) ) ( not ( = ?auto_1982179 ?auto_1982188 ) ) ( not ( = ?auto_1982179 ?auto_1982189 ) ) ( not ( = ?auto_1982179 ?auto_1982190 ) ) ( not ( = ?auto_1982179 ?auto_1982191 ) ) ( not ( = ?auto_1982179 ?auto_1982196 ) ) ( not ( = ?auto_1982181 ?auto_1982180 ) ) ( not ( = ?auto_1982181 ?auto_1982182 ) ) ( not ( = ?auto_1982181 ?auto_1982183 ) ) ( not ( = ?auto_1982181 ?auto_1982184 ) ) ( not ( = ?auto_1982181 ?auto_1982185 ) ) ( not ( = ?auto_1982181 ?auto_1982186 ) ) ( not ( = ?auto_1982181 ?auto_1982187 ) ) ( not ( = ?auto_1982181 ?auto_1982188 ) ) ( not ( = ?auto_1982181 ?auto_1982189 ) ) ( not ( = ?auto_1982181 ?auto_1982190 ) ) ( not ( = ?auto_1982181 ?auto_1982191 ) ) ( not ( = ?auto_1982181 ?auto_1982196 ) ) ( not ( = ?auto_1982180 ?auto_1982182 ) ) ( not ( = ?auto_1982180 ?auto_1982183 ) ) ( not ( = ?auto_1982180 ?auto_1982184 ) ) ( not ( = ?auto_1982180 ?auto_1982185 ) ) ( not ( = ?auto_1982180 ?auto_1982186 ) ) ( not ( = ?auto_1982180 ?auto_1982187 ) ) ( not ( = ?auto_1982180 ?auto_1982188 ) ) ( not ( = ?auto_1982180 ?auto_1982189 ) ) ( not ( = ?auto_1982180 ?auto_1982190 ) ) ( not ( = ?auto_1982180 ?auto_1982191 ) ) ( not ( = ?auto_1982180 ?auto_1982196 ) ) ( not ( = ?auto_1982182 ?auto_1982183 ) ) ( not ( = ?auto_1982182 ?auto_1982184 ) ) ( not ( = ?auto_1982182 ?auto_1982185 ) ) ( not ( = ?auto_1982182 ?auto_1982186 ) ) ( not ( = ?auto_1982182 ?auto_1982187 ) ) ( not ( = ?auto_1982182 ?auto_1982188 ) ) ( not ( = ?auto_1982182 ?auto_1982189 ) ) ( not ( = ?auto_1982182 ?auto_1982190 ) ) ( not ( = ?auto_1982182 ?auto_1982191 ) ) ( not ( = ?auto_1982182 ?auto_1982196 ) ) ( not ( = ?auto_1982183 ?auto_1982184 ) ) ( not ( = ?auto_1982183 ?auto_1982185 ) ) ( not ( = ?auto_1982183 ?auto_1982186 ) ) ( not ( = ?auto_1982183 ?auto_1982187 ) ) ( not ( = ?auto_1982183 ?auto_1982188 ) ) ( not ( = ?auto_1982183 ?auto_1982189 ) ) ( not ( = ?auto_1982183 ?auto_1982190 ) ) ( not ( = ?auto_1982183 ?auto_1982191 ) ) ( not ( = ?auto_1982183 ?auto_1982196 ) ) ( not ( = ?auto_1982184 ?auto_1982185 ) ) ( not ( = ?auto_1982184 ?auto_1982186 ) ) ( not ( = ?auto_1982184 ?auto_1982187 ) ) ( not ( = ?auto_1982184 ?auto_1982188 ) ) ( not ( = ?auto_1982184 ?auto_1982189 ) ) ( not ( = ?auto_1982184 ?auto_1982190 ) ) ( not ( = ?auto_1982184 ?auto_1982191 ) ) ( not ( = ?auto_1982184 ?auto_1982196 ) ) ( not ( = ?auto_1982185 ?auto_1982186 ) ) ( not ( = ?auto_1982185 ?auto_1982187 ) ) ( not ( = ?auto_1982185 ?auto_1982188 ) ) ( not ( = ?auto_1982185 ?auto_1982189 ) ) ( not ( = ?auto_1982185 ?auto_1982190 ) ) ( not ( = ?auto_1982185 ?auto_1982191 ) ) ( not ( = ?auto_1982185 ?auto_1982196 ) ) ( not ( = ?auto_1982186 ?auto_1982187 ) ) ( not ( = ?auto_1982186 ?auto_1982188 ) ) ( not ( = ?auto_1982186 ?auto_1982189 ) ) ( not ( = ?auto_1982186 ?auto_1982190 ) ) ( not ( = ?auto_1982186 ?auto_1982191 ) ) ( not ( = ?auto_1982186 ?auto_1982196 ) ) ( not ( = ?auto_1982187 ?auto_1982188 ) ) ( not ( = ?auto_1982187 ?auto_1982189 ) ) ( not ( = ?auto_1982187 ?auto_1982190 ) ) ( not ( = ?auto_1982187 ?auto_1982191 ) ) ( not ( = ?auto_1982187 ?auto_1982196 ) ) ( not ( = ?auto_1982188 ?auto_1982189 ) ) ( not ( = ?auto_1982188 ?auto_1982190 ) ) ( not ( = ?auto_1982188 ?auto_1982191 ) ) ( not ( = ?auto_1982188 ?auto_1982196 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1982189 ?auto_1982190 ?auto_1982191 )
      ( MAKE-14CRATE-VERIFY ?auto_1982177 ?auto_1982178 ?auto_1982179 ?auto_1982181 ?auto_1982180 ?auto_1982182 ?auto_1982183 ?auto_1982184 ?auto_1982185 ?auto_1982186 ?auto_1982187 ?auto_1982188 ?auto_1982189 ?auto_1982190 ?auto_1982191 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1982381 - SURFACE
      ?auto_1982382 - SURFACE
      ?auto_1982383 - SURFACE
      ?auto_1982385 - SURFACE
      ?auto_1982384 - SURFACE
      ?auto_1982386 - SURFACE
      ?auto_1982387 - SURFACE
      ?auto_1982388 - SURFACE
      ?auto_1982389 - SURFACE
      ?auto_1982390 - SURFACE
      ?auto_1982391 - SURFACE
      ?auto_1982392 - SURFACE
      ?auto_1982393 - SURFACE
      ?auto_1982394 - SURFACE
      ?auto_1982395 - SURFACE
    )
    :vars
    (
      ?auto_1982400 - HOIST
      ?auto_1982399 - PLACE
      ?auto_1982401 - PLACE
      ?auto_1982398 - HOIST
      ?auto_1982396 - SURFACE
      ?auto_1982397 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1982400 ?auto_1982399 ) ( IS-CRATE ?auto_1982395 ) ( not ( = ?auto_1982394 ?auto_1982395 ) ) ( not ( = ?auto_1982393 ?auto_1982394 ) ) ( not ( = ?auto_1982393 ?auto_1982395 ) ) ( not ( = ?auto_1982401 ?auto_1982399 ) ) ( HOIST-AT ?auto_1982398 ?auto_1982401 ) ( not ( = ?auto_1982400 ?auto_1982398 ) ) ( AVAILABLE ?auto_1982398 ) ( SURFACE-AT ?auto_1982395 ?auto_1982401 ) ( ON ?auto_1982395 ?auto_1982396 ) ( CLEAR ?auto_1982395 ) ( not ( = ?auto_1982394 ?auto_1982396 ) ) ( not ( = ?auto_1982395 ?auto_1982396 ) ) ( not ( = ?auto_1982393 ?auto_1982396 ) ) ( TRUCK-AT ?auto_1982397 ?auto_1982399 ) ( SURFACE-AT ?auto_1982393 ?auto_1982399 ) ( CLEAR ?auto_1982393 ) ( LIFTING ?auto_1982400 ?auto_1982394 ) ( IS-CRATE ?auto_1982394 ) ( ON ?auto_1982382 ?auto_1982381 ) ( ON ?auto_1982383 ?auto_1982382 ) ( ON ?auto_1982385 ?auto_1982383 ) ( ON ?auto_1982384 ?auto_1982385 ) ( ON ?auto_1982386 ?auto_1982384 ) ( ON ?auto_1982387 ?auto_1982386 ) ( ON ?auto_1982388 ?auto_1982387 ) ( ON ?auto_1982389 ?auto_1982388 ) ( ON ?auto_1982390 ?auto_1982389 ) ( ON ?auto_1982391 ?auto_1982390 ) ( ON ?auto_1982392 ?auto_1982391 ) ( ON ?auto_1982393 ?auto_1982392 ) ( not ( = ?auto_1982381 ?auto_1982382 ) ) ( not ( = ?auto_1982381 ?auto_1982383 ) ) ( not ( = ?auto_1982381 ?auto_1982385 ) ) ( not ( = ?auto_1982381 ?auto_1982384 ) ) ( not ( = ?auto_1982381 ?auto_1982386 ) ) ( not ( = ?auto_1982381 ?auto_1982387 ) ) ( not ( = ?auto_1982381 ?auto_1982388 ) ) ( not ( = ?auto_1982381 ?auto_1982389 ) ) ( not ( = ?auto_1982381 ?auto_1982390 ) ) ( not ( = ?auto_1982381 ?auto_1982391 ) ) ( not ( = ?auto_1982381 ?auto_1982392 ) ) ( not ( = ?auto_1982381 ?auto_1982393 ) ) ( not ( = ?auto_1982381 ?auto_1982394 ) ) ( not ( = ?auto_1982381 ?auto_1982395 ) ) ( not ( = ?auto_1982381 ?auto_1982396 ) ) ( not ( = ?auto_1982382 ?auto_1982383 ) ) ( not ( = ?auto_1982382 ?auto_1982385 ) ) ( not ( = ?auto_1982382 ?auto_1982384 ) ) ( not ( = ?auto_1982382 ?auto_1982386 ) ) ( not ( = ?auto_1982382 ?auto_1982387 ) ) ( not ( = ?auto_1982382 ?auto_1982388 ) ) ( not ( = ?auto_1982382 ?auto_1982389 ) ) ( not ( = ?auto_1982382 ?auto_1982390 ) ) ( not ( = ?auto_1982382 ?auto_1982391 ) ) ( not ( = ?auto_1982382 ?auto_1982392 ) ) ( not ( = ?auto_1982382 ?auto_1982393 ) ) ( not ( = ?auto_1982382 ?auto_1982394 ) ) ( not ( = ?auto_1982382 ?auto_1982395 ) ) ( not ( = ?auto_1982382 ?auto_1982396 ) ) ( not ( = ?auto_1982383 ?auto_1982385 ) ) ( not ( = ?auto_1982383 ?auto_1982384 ) ) ( not ( = ?auto_1982383 ?auto_1982386 ) ) ( not ( = ?auto_1982383 ?auto_1982387 ) ) ( not ( = ?auto_1982383 ?auto_1982388 ) ) ( not ( = ?auto_1982383 ?auto_1982389 ) ) ( not ( = ?auto_1982383 ?auto_1982390 ) ) ( not ( = ?auto_1982383 ?auto_1982391 ) ) ( not ( = ?auto_1982383 ?auto_1982392 ) ) ( not ( = ?auto_1982383 ?auto_1982393 ) ) ( not ( = ?auto_1982383 ?auto_1982394 ) ) ( not ( = ?auto_1982383 ?auto_1982395 ) ) ( not ( = ?auto_1982383 ?auto_1982396 ) ) ( not ( = ?auto_1982385 ?auto_1982384 ) ) ( not ( = ?auto_1982385 ?auto_1982386 ) ) ( not ( = ?auto_1982385 ?auto_1982387 ) ) ( not ( = ?auto_1982385 ?auto_1982388 ) ) ( not ( = ?auto_1982385 ?auto_1982389 ) ) ( not ( = ?auto_1982385 ?auto_1982390 ) ) ( not ( = ?auto_1982385 ?auto_1982391 ) ) ( not ( = ?auto_1982385 ?auto_1982392 ) ) ( not ( = ?auto_1982385 ?auto_1982393 ) ) ( not ( = ?auto_1982385 ?auto_1982394 ) ) ( not ( = ?auto_1982385 ?auto_1982395 ) ) ( not ( = ?auto_1982385 ?auto_1982396 ) ) ( not ( = ?auto_1982384 ?auto_1982386 ) ) ( not ( = ?auto_1982384 ?auto_1982387 ) ) ( not ( = ?auto_1982384 ?auto_1982388 ) ) ( not ( = ?auto_1982384 ?auto_1982389 ) ) ( not ( = ?auto_1982384 ?auto_1982390 ) ) ( not ( = ?auto_1982384 ?auto_1982391 ) ) ( not ( = ?auto_1982384 ?auto_1982392 ) ) ( not ( = ?auto_1982384 ?auto_1982393 ) ) ( not ( = ?auto_1982384 ?auto_1982394 ) ) ( not ( = ?auto_1982384 ?auto_1982395 ) ) ( not ( = ?auto_1982384 ?auto_1982396 ) ) ( not ( = ?auto_1982386 ?auto_1982387 ) ) ( not ( = ?auto_1982386 ?auto_1982388 ) ) ( not ( = ?auto_1982386 ?auto_1982389 ) ) ( not ( = ?auto_1982386 ?auto_1982390 ) ) ( not ( = ?auto_1982386 ?auto_1982391 ) ) ( not ( = ?auto_1982386 ?auto_1982392 ) ) ( not ( = ?auto_1982386 ?auto_1982393 ) ) ( not ( = ?auto_1982386 ?auto_1982394 ) ) ( not ( = ?auto_1982386 ?auto_1982395 ) ) ( not ( = ?auto_1982386 ?auto_1982396 ) ) ( not ( = ?auto_1982387 ?auto_1982388 ) ) ( not ( = ?auto_1982387 ?auto_1982389 ) ) ( not ( = ?auto_1982387 ?auto_1982390 ) ) ( not ( = ?auto_1982387 ?auto_1982391 ) ) ( not ( = ?auto_1982387 ?auto_1982392 ) ) ( not ( = ?auto_1982387 ?auto_1982393 ) ) ( not ( = ?auto_1982387 ?auto_1982394 ) ) ( not ( = ?auto_1982387 ?auto_1982395 ) ) ( not ( = ?auto_1982387 ?auto_1982396 ) ) ( not ( = ?auto_1982388 ?auto_1982389 ) ) ( not ( = ?auto_1982388 ?auto_1982390 ) ) ( not ( = ?auto_1982388 ?auto_1982391 ) ) ( not ( = ?auto_1982388 ?auto_1982392 ) ) ( not ( = ?auto_1982388 ?auto_1982393 ) ) ( not ( = ?auto_1982388 ?auto_1982394 ) ) ( not ( = ?auto_1982388 ?auto_1982395 ) ) ( not ( = ?auto_1982388 ?auto_1982396 ) ) ( not ( = ?auto_1982389 ?auto_1982390 ) ) ( not ( = ?auto_1982389 ?auto_1982391 ) ) ( not ( = ?auto_1982389 ?auto_1982392 ) ) ( not ( = ?auto_1982389 ?auto_1982393 ) ) ( not ( = ?auto_1982389 ?auto_1982394 ) ) ( not ( = ?auto_1982389 ?auto_1982395 ) ) ( not ( = ?auto_1982389 ?auto_1982396 ) ) ( not ( = ?auto_1982390 ?auto_1982391 ) ) ( not ( = ?auto_1982390 ?auto_1982392 ) ) ( not ( = ?auto_1982390 ?auto_1982393 ) ) ( not ( = ?auto_1982390 ?auto_1982394 ) ) ( not ( = ?auto_1982390 ?auto_1982395 ) ) ( not ( = ?auto_1982390 ?auto_1982396 ) ) ( not ( = ?auto_1982391 ?auto_1982392 ) ) ( not ( = ?auto_1982391 ?auto_1982393 ) ) ( not ( = ?auto_1982391 ?auto_1982394 ) ) ( not ( = ?auto_1982391 ?auto_1982395 ) ) ( not ( = ?auto_1982391 ?auto_1982396 ) ) ( not ( = ?auto_1982392 ?auto_1982393 ) ) ( not ( = ?auto_1982392 ?auto_1982394 ) ) ( not ( = ?auto_1982392 ?auto_1982395 ) ) ( not ( = ?auto_1982392 ?auto_1982396 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1982393 ?auto_1982394 ?auto_1982395 )
      ( MAKE-14CRATE-VERIFY ?auto_1982381 ?auto_1982382 ?auto_1982383 ?auto_1982385 ?auto_1982384 ?auto_1982386 ?auto_1982387 ?auto_1982388 ?auto_1982389 ?auto_1982390 ?auto_1982391 ?auto_1982392 ?auto_1982393 ?auto_1982394 ?auto_1982395 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1982585 - SURFACE
      ?auto_1982586 - SURFACE
      ?auto_1982587 - SURFACE
      ?auto_1982589 - SURFACE
      ?auto_1982588 - SURFACE
      ?auto_1982590 - SURFACE
      ?auto_1982591 - SURFACE
      ?auto_1982592 - SURFACE
      ?auto_1982593 - SURFACE
      ?auto_1982594 - SURFACE
      ?auto_1982595 - SURFACE
      ?auto_1982596 - SURFACE
      ?auto_1982597 - SURFACE
      ?auto_1982598 - SURFACE
      ?auto_1982599 - SURFACE
    )
    :vars
    (
      ?auto_1982605 - HOIST
      ?auto_1982601 - PLACE
      ?auto_1982602 - PLACE
      ?auto_1982604 - HOIST
      ?auto_1982603 - SURFACE
      ?auto_1982600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1982605 ?auto_1982601 ) ( IS-CRATE ?auto_1982599 ) ( not ( = ?auto_1982598 ?auto_1982599 ) ) ( not ( = ?auto_1982597 ?auto_1982598 ) ) ( not ( = ?auto_1982597 ?auto_1982599 ) ) ( not ( = ?auto_1982602 ?auto_1982601 ) ) ( HOIST-AT ?auto_1982604 ?auto_1982602 ) ( not ( = ?auto_1982605 ?auto_1982604 ) ) ( AVAILABLE ?auto_1982604 ) ( SURFACE-AT ?auto_1982599 ?auto_1982602 ) ( ON ?auto_1982599 ?auto_1982603 ) ( CLEAR ?auto_1982599 ) ( not ( = ?auto_1982598 ?auto_1982603 ) ) ( not ( = ?auto_1982599 ?auto_1982603 ) ) ( not ( = ?auto_1982597 ?auto_1982603 ) ) ( TRUCK-AT ?auto_1982600 ?auto_1982601 ) ( SURFACE-AT ?auto_1982597 ?auto_1982601 ) ( CLEAR ?auto_1982597 ) ( IS-CRATE ?auto_1982598 ) ( AVAILABLE ?auto_1982605 ) ( IN ?auto_1982598 ?auto_1982600 ) ( ON ?auto_1982586 ?auto_1982585 ) ( ON ?auto_1982587 ?auto_1982586 ) ( ON ?auto_1982589 ?auto_1982587 ) ( ON ?auto_1982588 ?auto_1982589 ) ( ON ?auto_1982590 ?auto_1982588 ) ( ON ?auto_1982591 ?auto_1982590 ) ( ON ?auto_1982592 ?auto_1982591 ) ( ON ?auto_1982593 ?auto_1982592 ) ( ON ?auto_1982594 ?auto_1982593 ) ( ON ?auto_1982595 ?auto_1982594 ) ( ON ?auto_1982596 ?auto_1982595 ) ( ON ?auto_1982597 ?auto_1982596 ) ( not ( = ?auto_1982585 ?auto_1982586 ) ) ( not ( = ?auto_1982585 ?auto_1982587 ) ) ( not ( = ?auto_1982585 ?auto_1982589 ) ) ( not ( = ?auto_1982585 ?auto_1982588 ) ) ( not ( = ?auto_1982585 ?auto_1982590 ) ) ( not ( = ?auto_1982585 ?auto_1982591 ) ) ( not ( = ?auto_1982585 ?auto_1982592 ) ) ( not ( = ?auto_1982585 ?auto_1982593 ) ) ( not ( = ?auto_1982585 ?auto_1982594 ) ) ( not ( = ?auto_1982585 ?auto_1982595 ) ) ( not ( = ?auto_1982585 ?auto_1982596 ) ) ( not ( = ?auto_1982585 ?auto_1982597 ) ) ( not ( = ?auto_1982585 ?auto_1982598 ) ) ( not ( = ?auto_1982585 ?auto_1982599 ) ) ( not ( = ?auto_1982585 ?auto_1982603 ) ) ( not ( = ?auto_1982586 ?auto_1982587 ) ) ( not ( = ?auto_1982586 ?auto_1982589 ) ) ( not ( = ?auto_1982586 ?auto_1982588 ) ) ( not ( = ?auto_1982586 ?auto_1982590 ) ) ( not ( = ?auto_1982586 ?auto_1982591 ) ) ( not ( = ?auto_1982586 ?auto_1982592 ) ) ( not ( = ?auto_1982586 ?auto_1982593 ) ) ( not ( = ?auto_1982586 ?auto_1982594 ) ) ( not ( = ?auto_1982586 ?auto_1982595 ) ) ( not ( = ?auto_1982586 ?auto_1982596 ) ) ( not ( = ?auto_1982586 ?auto_1982597 ) ) ( not ( = ?auto_1982586 ?auto_1982598 ) ) ( not ( = ?auto_1982586 ?auto_1982599 ) ) ( not ( = ?auto_1982586 ?auto_1982603 ) ) ( not ( = ?auto_1982587 ?auto_1982589 ) ) ( not ( = ?auto_1982587 ?auto_1982588 ) ) ( not ( = ?auto_1982587 ?auto_1982590 ) ) ( not ( = ?auto_1982587 ?auto_1982591 ) ) ( not ( = ?auto_1982587 ?auto_1982592 ) ) ( not ( = ?auto_1982587 ?auto_1982593 ) ) ( not ( = ?auto_1982587 ?auto_1982594 ) ) ( not ( = ?auto_1982587 ?auto_1982595 ) ) ( not ( = ?auto_1982587 ?auto_1982596 ) ) ( not ( = ?auto_1982587 ?auto_1982597 ) ) ( not ( = ?auto_1982587 ?auto_1982598 ) ) ( not ( = ?auto_1982587 ?auto_1982599 ) ) ( not ( = ?auto_1982587 ?auto_1982603 ) ) ( not ( = ?auto_1982589 ?auto_1982588 ) ) ( not ( = ?auto_1982589 ?auto_1982590 ) ) ( not ( = ?auto_1982589 ?auto_1982591 ) ) ( not ( = ?auto_1982589 ?auto_1982592 ) ) ( not ( = ?auto_1982589 ?auto_1982593 ) ) ( not ( = ?auto_1982589 ?auto_1982594 ) ) ( not ( = ?auto_1982589 ?auto_1982595 ) ) ( not ( = ?auto_1982589 ?auto_1982596 ) ) ( not ( = ?auto_1982589 ?auto_1982597 ) ) ( not ( = ?auto_1982589 ?auto_1982598 ) ) ( not ( = ?auto_1982589 ?auto_1982599 ) ) ( not ( = ?auto_1982589 ?auto_1982603 ) ) ( not ( = ?auto_1982588 ?auto_1982590 ) ) ( not ( = ?auto_1982588 ?auto_1982591 ) ) ( not ( = ?auto_1982588 ?auto_1982592 ) ) ( not ( = ?auto_1982588 ?auto_1982593 ) ) ( not ( = ?auto_1982588 ?auto_1982594 ) ) ( not ( = ?auto_1982588 ?auto_1982595 ) ) ( not ( = ?auto_1982588 ?auto_1982596 ) ) ( not ( = ?auto_1982588 ?auto_1982597 ) ) ( not ( = ?auto_1982588 ?auto_1982598 ) ) ( not ( = ?auto_1982588 ?auto_1982599 ) ) ( not ( = ?auto_1982588 ?auto_1982603 ) ) ( not ( = ?auto_1982590 ?auto_1982591 ) ) ( not ( = ?auto_1982590 ?auto_1982592 ) ) ( not ( = ?auto_1982590 ?auto_1982593 ) ) ( not ( = ?auto_1982590 ?auto_1982594 ) ) ( not ( = ?auto_1982590 ?auto_1982595 ) ) ( not ( = ?auto_1982590 ?auto_1982596 ) ) ( not ( = ?auto_1982590 ?auto_1982597 ) ) ( not ( = ?auto_1982590 ?auto_1982598 ) ) ( not ( = ?auto_1982590 ?auto_1982599 ) ) ( not ( = ?auto_1982590 ?auto_1982603 ) ) ( not ( = ?auto_1982591 ?auto_1982592 ) ) ( not ( = ?auto_1982591 ?auto_1982593 ) ) ( not ( = ?auto_1982591 ?auto_1982594 ) ) ( not ( = ?auto_1982591 ?auto_1982595 ) ) ( not ( = ?auto_1982591 ?auto_1982596 ) ) ( not ( = ?auto_1982591 ?auto_1982597 ) ) ( not ( = ?auto_1982591 ?auto_1982598 ) ) ( not ( = ?auto_1982591 ?auto_1982599 ) ) ( not ( = ?auto_1982591 ?auto_1982603 ) ) ( not ( = ?auto_1982592 ?auto_1982593 ) ) ( not ( = ?auto_1982592 ?auto_1982594 ) ) ( not ( = ?auto_1982592 ?auto_1982595 ) ) ( not ( = ?auto_1982592 ?auto_1982596 ) ) ( not ( = ?auto_1982592 ?auto_1982597 ) ) ( not ( = ?auto_1982592 ?auto_1982598 ) ) ( not ( = ?auto_1982592 ?auto_1982599 ) ) ( not ( = ?auto_1982592 ?auto_1982603 ) ) ( not ( = ?auto_1982593 ?auto_1982594 ) ) ( not ( = ?auto_1982593 ?auto_1982595 ) ) ( not ( = ?auto_1982593 ?auto_1982596 ) ) ( not ( = ?auto_1982593 ?auto_1982597 ) ) ( not ( = ?auto_1982593 ?auto_1982598 ) ) ( not ( = ?auto_1982593 ?auto_1982599 ) ) ( not ( = ?auto_1982593 ?auto_1982603 ) ) ( not ( = ?auto_1982594 ?auto_1982595 ) ) ( not ( = ?auto_1982594 ?auto_1982596 ) ) ( not ( = ?auto_1982594 ?auto_1982597 ) ) ( not ( = ?auto_1982594 ?auto_1982598 ) ) ( not ( = ?auto_1982594 ?auto_1982599 ) ) ( not ( = ?auto_1982594 ?auto_1982603 ) ) ( not ( = ?auto_1982595 ?auto_1982596 ) ) ( not ( = ?auto_1982595 ?auto_1982597 ) ) ( not ( = ?auto_1982595 ?auto_1982598 ) ) ( not ( = ?auto_1982595 ?auto_1982599 ) ) ( not ( = ?auto_1982595 ?auto_1982603 ) ) ( not ( = ?auto_1982596 ?auto_1982597 ) ) ( not ( = ?auto_1982596 ?auto_1982598 ) ) ( not ( = ?auto_1982596 ?auto_1982599 ) ) ( not ( = ?auto_1982596 ?auto_1982603 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1982597 ?auto_1982598 ?auto_1982599 )
      ( MAKE-14CRATE-VERIFY ?auto_1982585 ?auto_1982586 ?auto_1982587 ?auto_1982589 ?auto_1982588 ?auto_1982590 ?auto_1982591 ?auto_1982592 ?auto_1982593 ?auto_1982594 ?auto_1982595 ?auto_1982596 ?auto_1982597 ?auto_1982598 ?auto_1982599 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1999805 - SURFACE
      ?auto_1999806 - SURFACE
      ?auto_1999807 - SURFACE
      ?auto_1999809 - SURFACE
      ?auto_1999808 - SURFACE
      ?auto_1999810 - SURFACE
      ?auto_1999811 - SURFACE
      ?auto_1999812 - SURFACE
      ?auto_1999813 - SURFACE
      ?auto_1999814 - SURFACE
      ?auto_1999815 - SURFACE
      ?auto_1999816 - SURFACE
      ?auto_1999817 - SURFACE
      ?auto_1999818 - SURFACE
      ?auto_1999819 - SURFACE
      ?auto_1999820 - SURFACE
    )
    :vars
    (
      ?auto_1999822 - HOIST
      ?auto_1999821 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1999822 ?auto_1999821 ) ( SURFACE-AT ?auto_1999819 ?auto_1999821 ) ( CLEAR ?auto_1999819 ) ( LIFTING ?auto_1999822 ?auto_1999820 ) ( IS-CRATE ?auto_1999820 ) ( not ( = ?auto_1999819 ?auto_1999820 ) ) ( ON ?auto_1999806 ?auto_1999805 ) ( ON ?auto_1999807 ?auto_1999806 ) ( ON ?auto_1999809 ?auto_1999807 ) ( ON ?auto_1999808 ?auto_1999809 ) ( ON ?auto_1999810 ?auto_1999808 ) ( ON ?auto_1999811 ?auto_1999810 ) ( ON ?auto_1999812 ?auto_1999811 ) ( ON ?auto_1999813 ?auto_1999812 ) ( ON ?auto_1999814 ?auto_1999813 ) ( ON ?auto_1999815 ?auto_1999814 ) ( ON ?auto_1999816 ?auto_1999815 ) ( ON ?auto_1999817 ?auto_1999816 ) ( ON ?auto_1999818 ?auto_1999817 ) ( ON ?auto_1999819 ?auto_1999818 ) ( not ( = ?auto_1999805 ?auto_1999806 ) ) ( not ( = ?auto_1999805 ?auto_1999807 ) ) ( not ( = ?auto_1999805 ?auto_1999809 ) ) ( not ( = ?auto_1999805 ?auto_1999808 ) ) ( not ( = ?auto_1999805 ?auto_1999810 ) ) ( not ( = ?auto_1999805 ?auto_1999811 ) ) ( not ( = ?auto_1999805 ?auto_1999812 ) ) ( not ( = ?auto_1999805 ?auto_1999813 ) ) ( not ( = ?auto_1999805 ?auto_1999814 ) ) ( not ( = ?auto_1999805 ?auto_1999815 ) ) ( not ( = ?auto_1999805 ?auto_1999816 ) ) ( not ( = ?auto_1999805 ?auto_1999817 ) ) ( not ( = ?auto_1999805 ?auto_1999818 ) ) ( not ( = ?auto_1999805 ?auto_1999819 ) ) ( not ( = ?auto_1999805 ?auto_1999820 ) ) ( not ( = ?auto_1999806 ?auto_1999807 ) ) ( not ( = ?auto_1999806 ?auto_1999809 ) ) ( not ( = ?auto_1999806 ?auto_1999808 ) ) ( not ( = ?auto_1999806 ?auto_1999810 ) ) ( not ( = ?auto_1999806 ?auto_1999811 ) ) ( not ( = ?auto_1999806 ?auto_1999812 ) ) ( not ( = ?auto_1999806 ?auto_1999813 ) ) ( not ( = ?auto_1999806 ?auto_1999814 ) ) ( not ( = ?auto_1999806 ?auto_1999815 ) ) ( not ( = ?auto_1999806 ?auto_1999816 ) ) ( not ( = ?auto_1999806 ?auto_1999817 ) ) ( not ( = ?auto_1999806 ?auto_1999818 ) ) ( not ( = ?auto_1999806 ?auto_1999819 ) ) ( not ( = ?auto_1999806 ?auto_1999820 ) ) ( not ( = ?auto_1999807 ?auto_1999809 ) ) ( not ( = ?auto_1999807 ?auto_1999808 ) ) ( not ( = ?auto_1999807 ?auto_1999810 ) ) ( not ( = ?auto_1999807 ?auto_1999811 ) ) ( not ( = ?auto_1999807 ?auto_1999812 ) ) ( not ( = ?auto_1999807 ?auto_1999813 ) ) ( not ( = ?auto_1999807 ?auto_1999814 ) ) ( not ( = ?auto_1999807 ?auto_1999815 ) ) ( not ( = ?auto_1999807 ?auto_1999816 ) ) ( not ( = ?auto_1999807 ?auto_1999817 ) ) ( not ( = ?auto_1999807 ?auto_1999818 ) ) ( not ( = ?auto_1999807 ?auto_1999819 ) ) ( not ( = ?auto_1999807 ?auto_1999820 ) ) ( not ( = ?auto_1999809 ?auto_1999808 ) ) ( not ( = ?auto_1999809 ?auto_1999810 ) ) ( not ( = ?auto_1999809 ?auto_1999811 ) ) ( not ( = ?auto_1999809 ?auto_1999812 ) ) ( not ( = ?auto_1999809 ?auto_1999813 ) ) ( not ( = ?auto_1999809 ?auto_1999814 ) ) ( not ( = ?auto_1999809 ?auto_1999815 ) ) ( not ( = ?auto_1999809 ?auto_1999816 ) ) ( not ( = ?auto_1999809 ?auto_1999817 ) ) ( not ( = ?auto_1999809 ?auto_1999818 ) ) ( not ( = ?auto_1999809 ?auto_1999819 ) ) ( not ( = ?auto_1999809 ?auto_1999820 ) ) ( not ( = ?auto_1999808 ?auto_1999810 ) ) ( not ( = ?auto_1999808 ?auto_1999811 ) ) ( not ( = ?auto_1999808 ?auto_1999812 ) ) ( not ( = ?auto_1999808 ?auto_1999813 ) ) ( not ( = ?auto_1999808 ?auto_1999814 ) ) ( not ( = ?auto_1999808 ?auto_1999815 ) ) ( not ( = ?auto_1999808 ?auto_1999816 ) ) ( not ( = ?auto_1999808 ?auto_1999817 ) ) ( not ( = ?auto_1999808 ?auto_1999818 ) ) ( not ( = ?auto_1999808 ?auto_1999819 ) ) ( not ( = ?auto_1999808 ?auto_1999820 ) ) ( not ( = ?auto_1999810 ?auto_1999811 ) ) ( not ( = ?auto_1999810 ?auto_1999812 ) ) ( not ( = ?auto_1999810 ?auto_1999813 ) ) ( not ( = ?auto_1999810 ?auto_1999814 ) ) ( not ( = ?auto_1999810 ?auto_1999815 ) ) ( not ( = ?auto_1999810 ?auto_1999816 ) ) ( not ( = ?auto_1999810 ?auto_1999817 ) ) ( not ( = ?auto_1999810 ?auto_1999818 ) ) ( not ( = ?auto_1999810 ?auto_1999819 ) ) ( not ( = ?auto_1999810 ?auto_1999820 ) ) ( not ( = ?auto_1999811 ?auto_1999812 ) ) ( not ( = ?auto_1999811 ?auto_1999813 ) ) ( not ( = ?auto_1999811 ?auto_1999814 ) ) ( not ( = ?auto_1999811 ?auto_1999815 ) ) ( not ( = ?auto_1999811 ?auto_1999816 ) ) ( not ( = ?auto_1999811 ?auto_1999817 ) ) ( not ( = ?auto_1999811 ?auto_1999818 ) ) ( not ( = ?auto_1999811 ?auto_1999819 ) ) ( not ( = ?auto_1999811 ?auto_1999820 ) ) ( not ( = ?auto_1999812 ?auto_1999813 ) ) ( not ( = ?auto_1999812 ?auto_1999814 ) ) ( not ( = ?auto_1999812 ?auto_1999815 ) ) ( not ( = ?auto_1999812 ?auto_1999816 ) ) ( not ( = ?auto_1999812 ?auto_1999817 ) ) ( not ( = ?auto_1999812 ?auto_1999818 ) ) ( not ( = ?auto_1999812 ?auto_1999819 ) ) ( not ( = ?auto_1999812 ?auto_1999820 ) ) ( not ( = ?auto_1999813 ?auto_1999814 ) ) ( not ( = ?auto_1999813 ?auto_1999815 ) ) ( not ( = ?auto_1999813 ?auto_1999816 ) ) ( not ( = ?auto_1999813 ?auto_1999817 ) ) ( not ( = ?auto_1999813 ?auto_1999818 ) ) ( not ( = ?auto_1999813 ?auto_1999819 ) ) ( not ( = ?auto_1999813 ?auto_1999820 ) ) ( not ( = ?auto_1999814 ?auto_1999815 ) ) ( not ( = ?auto_1999814 ?auto_1999816 ) ) ( not ( = ?auto_1999814 ?auto_1999817 ) ) ( not ( = ?auto_1999814 ?auto_1999818 ) ) ( not ( = ?auto_1999814 ?auto_1999819 ) ) ( not ( = ?auto_1999814 ?auto_1999820 ) ) ( not ( = ?auto_1999815 ?auto_1999816 ) ) ( not ( = ?auto_1999815 ?auto_1999817 ) ) ( not ( = ?auto_1999815 ?auto_1999818 ) ) ( not ( = ?auto_1999815 ?auto_1999819 ) ) ( not ( = ?auto_1999815 ?auto_1999820 ) ) ( not ( = ?auto_1999816 ?auto_1999817 ) ) ( not ( = ?auto_1999816 ?auto_1999818 ) ) ( not ( = ?auto_1999816 ?auto_1999819 ) ) ( not ( = ?auto_1999816 ?auto_1999820 ) ) ( not ( = ?auto_1999817 ?auto_1999818 ) ) ( not ( = ?auto_1999817 ?auto_1999819 ) ) ( not ( = ?auto_1999817 ?auto_1999820 ) ) ( not ( = ?auto_1999818 ?auto_1999819 ) ) ( not ( = ?auto_1999818 ?auto_1999820 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1999819 ?auto_1999820 )
      ( MAKE-15CRATE-VERIFY ?auto_1999805 ?auto_1999806 ?auto_1999807 ?auto_1999809 ?auto_1999808 ?auto_1999810 ?auto_1999811 ?auto_1999812 ?auto_1999813 ?auto_1999814 ?auto_1999815 ?auto_1999816 ?auto_1999817 ?auto_1999818 ?auto_1999819 ?auto_1999820 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1999984 - SURFACE
      ?auto_1999985 - SURFACE
      ?auto_1999986 - SURFACE
      ?auto_1999988 - SURFACE
      ?auto_1999987 - SURFACE
      ?auto_1999989 - SURFACE
      ?auto_1999990 - SURFACE
      ?auto_1999991 - SURFACE
      ?auto_1999992 - SURFACE
      ?auto_1999993 - SURFACE
      ?auto_1999994 - SURFACE
      ?auto_1999995 - SURFACE
      ?auto_1999996 - SURFACE
      ?auto_1999997 - SURFACE
      ?auto_1999998 - SURFACE
      ?auto_1999999 - SURFACE
    )
    :vars
    (
      ?auto_2000001 - HOIST
      ?auto_2000002 - PLACE
      ?auto_2000000 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2000001 ?auto_2000002 ) ( SURFACE-AT ?auto_1999998 ?auto_2000002 ) ( CLEAR ?auto_1999998 ) ( IS-CRATE ?auto_1999999 ) ( not ( = ?auto_1999998 ?auto_1999999 ) ) ( TRUCK-AT ?auto_2000000 ?auto_2000002 ) ( AVAILABLE ?auto_2000001 ) ( IN ?auto_1999999 ?auto_2000000 ) ( ON ?auto_1999998 ?auto_1999997 ) ( not ( = ?auto_1999997 ?auto_1999998 ) ) ( not ( = ?auto_1999997 ?auto_1999999 ) ) ( ON ?auto_1999985 ?auto_1999984 ) ( ON ?auto_1999986 ?auto_1999985 ) ( ON ?auto_1999988 ?auto_1999986 ) ( ON ?auto_1999987 ?auto_1999988 ) ( ON ?auto_1999989 ?auto_1999987 ) ( ON ?auto_1999990 ?auto_1999989 ) ( ON ?auto_1999991 ?auto_1999990 ) ( ON ?auto_1999992 ?auto_1999991 ) ( ON ?auto_1999993 ?auto_1999992 ) ( ON ?auto_1999994 ?auto_1999993 ) ( ON ?auto_1999995 ?auto_1999994 ) ( ON ?auto_1999996 ?auto_1999995 ) ( ON ?auto_1999997 ?auto_1999996 ) ( not ( = ?auto_1999984 ?auto_1999985 ) ) ( not ( = ?auto_1999984 ?auto_1999986 ) ) ( not ( = ?auto_1999984 ?auto_1999988 ) ) ( not ( = ?auto_1999984 ?auto_1999987 ) ) ( not ( = ?auto_1999984 ?auto_1999989 ) ) ( not ( = ?auto_1999984 ?auto_1999990 ) ) ( not ( = ?auto_1999984 ?auto_1999991 ) ) ( not ( = ?auto_1999984 ?auto_1999992 ) ) ( not ( = ?auto_1999984 ?auto_1999993 ) ) ( not ( = ?auto_1999984 ?auto_1999994 ) ) ( not ( = ?auto_1999984 ?auto_1999995 ) ) ( not ( = ?auto_1999984 ?auto_1999996 ) ) ( not ( = ?auto_1999984 ?auto_1999997 ) ) ( not ( = ?auto_1999984 ?auto_1999998 ) ) ( not ( = ?auto_1999984 ?auto_1999999 ) ) ( not ( = ?auto_1999985 ?auto_1999986 ) ) ( not ( = ?auto_1999985 ?auto_1999988 ) ) ( not ( = ?auto_1999985 ?auto_1999987 ) ) ( not ( = ?auto_1999985 ?auto_1999989 ) ) ( not ( = ?auto_1999985 ?auto_1999990 ) ) ( not ( = ?auto_1999985 ?auto_1999991 ) ) ( not ( = ?auto_1999985 ?auto_1999992 ) ) ( not ( = ?auto_1999985 ?auto_1999993 ) ) ( not ( = ?auto_1999985 ?auto_1999994 ) ) ( not ( = ?auto_1999985 ?auto_1999995 ) ) ( not ( = ?auto_1999985 ?auto_1999996 ) ) ( not ( = ?auto_1999985 ?auto_1999997 ) ) ( not ( = ?auto_1999985 ?auto_1999998 ) ) ( not ( = ?auto_1999985 ?auto_1999999 ) ) ( not ( = ?auto_1999986 ?auto_1999988 ) ) ( not ( = ?auto_1999986 ?auto_1999987 ) ) ( not ( = ?auto_1999986 ?auto_1999989 ) ) ( not ( = ?auto_1999986 ?auto_1999990 ) ) ( not ( = ?auto_1999986 ?auto_1999991 ) ) ( not ( = ?auto_1999986 ?auto_1999992 ) ) ( not ( = ?auto_1999986 ?auto_1999993 ) ) ( not ( = ?auto_1999986 ?auto_1999994 ) ) ( not ( = ?auto_1999986 ?auto_1999995 ) ) ( not ( = ?auto_1999986 ?auto_1999996 ) ) ( not ( = ?auto_1999986 ?auto_1999997 ) ) ( not ( = ?auto_1999986 ?auto_1999998 ) ) ( not ( = ?auto_1999986 ?auto_1999999 ) ) ( not ( = ?auto_1999988 ?auto_1999987 ) ) ( not ( = ?auto_1999988 ?auto_1999989 ) ) ( not ( = ?auto_1999988 ?auto_1999990 ) ) ( not ( = ?auto_1999988 ?auto_1999991 ) ) ( not ( = ?auto_1999988 ?auto_1999992 ) ) ( not ( = ?auto_1999988 ?auto_1999993 ) ) ( not ( = ?auto_1999988 ?auto_1999994 ) ) ( not ( = ?auto_1999988 ?auto_1999995 ) ) ( not ( = ?auto_1999988 ?auto_1999996 ) ) ( not ( = ?auto_1999988 ?auto_1999997 ) ) ( not ( = ?auto_1999988 ?auto_1999998 ) ) ( not ( = ?auto_1999988 ?auto_1999999 ) ) ( not ( = ?auto_1999987 ?auto_1999989 ) ) ( not ( = ?auto_1999987 ?auto_1999990 ) ) ( not ( = ?auto_1999987 ?auto_1999991 ) ) ( not ( = ?auto_1999987 ?auto_1999992 ) ) ( not ( = ?auto_1999987 ?auto_1999993 ) ) ( not ( = ?auto_1999987 ?auto_1999994 ) ) ( not ( = ?auto_1999987 ?auto_1999995 ) ) ( not ( = ?auto_1999987 ?auto_1999996 ) ) ( not ( = ?auto_1999987 ?auto_1999997 ) ) ( not ( = ?auto_1999987 ?auto_1999998 ) ) ( not ( = ?auto_1999987 ?auto_1999999 ) ) ( not ( = ?auto_1999989 ?auto_1999990 ) ) ( not ( = ?auto_1999989 ?auto_1999991 ) ) ( not ( = ?auto_1999989 ?auto_1999992 ) ) ( not ( = ?auto_1999989 ?auto_1999993 ) ) ( not ( = ?auto_1999989 ?auto_1999994 ) ) ( not ( = ?auto_1999989 ?auto_1999995 ) ) ( not ( = ?auto_1999989 ?auto_1999996 ) ) ( not ( = ?auto_1999989 ?auto_1999997 ) ) ( not ( = ?auto_1999989 ?auto_1999998 ) ) ( not ( = ?auto_1999989 ?auto_1999999 ) ) ( not ( = ?auto_1999990 ?auto_1999991 ) ) ( not ( = ?auto_1999990 ?auto_1999992 ) ) ( not ( = ?auto_1999990 ?auto_1999993 ) ) ( not ( = ?auto_1999990 ?auto_1999994 ) ) ( not ( = ?auto_1999990 ?auto_1999995 ) ) ( not ( = ?auto_1999990 ?auto_1999996 ) ) ( not ( = ?auto_1999990 ?auto_1999997 ) ) ( not ( = ?auto_1999990 ?auto_1999998 ) ) ( not ( = ?auto_1999990 ?auto_1999999 ) ) ( not ( = ?auto_1999991 ?auto_1999992 ) ) ( not ( = ?auto_1999991 ?auto_1999993 ) ) ( not ( = ?auto_1999991 ?auto_1999994 ) ) ( not ( = ?auto_1999991 ?auto_1999995 ) ) ( not ( = ?auto_1999991 ?auto_1999996 ) ) ( not ( = ?auto_1999991 ?auto_1999997 ) ) ( not ( = ?auto_1999991 ?auto_1999998 ) ) ( not ( = ?auto_1999991 ?auto_1999999 ) ) ( not ( = ?auto_1999992 ?auto_1999993 ) ) ( not ( = ?auto_1999992 ?auto_1999994 ) ) ( not ( = ?auto_1999992 ?auto_1999995 ) ) ( not ( = ?auto_1999992 ?auto_1999996 ) ) ( not ( = ?auto_1999992 ?auto_1999997 ) ) ( not ( = ?auto_1999992 ?auto_1999998 ) ) ( not ( = ?auto_1999992 ?auto_1999999 ) ) ( not ( = ?auto_1999993 ?auto_1999994 ) ) ( not ( = ?auto_1999993 ?auto_1999995 ) ) ( not ( = ?auto_1999993 ?auto_1999996 ) ) ( not ( = ?auto_1999993 ?auto_1999997 ) ) ( not ( = ?auto_1999993 ?auto_1999998 ) ) ( not ( = ?auto_1999993 ?auto_1999999 ) ) ( not ( = ?auto_1999994 ?auto_1999995 ) ) ( not ( = ?auto_1999994 ?auto_1999996 ) ) ( not ( = ?auto_1999994 ?auto_1999997 ) ) ( not ( = ?auto_1999994 ?auto_1999998 ) ) ( not ( = ?auto_1999994 ?auto_1999999 ) ) ( not ( = ?auto_1999995 ?auto_1999996 ) ) ( not ( = ?auto_1999995 ?auto_1999997 ) ) ( not ( = ?auto_1999995 ?auto_1999998 ) ) ( not ( = ?auto_1999995 ?auto_1999999 ) ) ( not ( = ?auto_1999996 ?auto_1999997 ) ) ( not ( = ?auto_1999996 ?auto_1999998 ) ) ( not ( = ?auto_1999996 ?auto_1999999 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1999997 ?auto_1999998 ?auto_1999999 )
      ( MAKE-15CRATE-VERIFY ?auto_1999984 ?auto_1999985 ?auto_1999986 ?auto_1999988 ?auto_1999987 ?auto_1999989 ?auto_1999990 ?auto_1999991 ?auto_1999992 ?auto_1999993 ?auto_1999994 ?auto_1999995 ?auto_1999996 ?auto_1999997 ?auto_1999998 ?auto_1999999 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2000179 - SURFACE
      ?auto_2000180 - SURFACE
      ?auto_2000181 - SURFACE
      ?auto_2000183 - SURFACE
      ?auto_2000182 - SURFACE
      ?auto_2000184 - SURFACE
      ?auto_2000185 - SURFACE
      ?auto_2000186 - SURFACE
      ?auto_2000187 - SURFACE
      ?auto_2000188 - SURFACE
      ?auto_2000189 - SURFACE
      ?auto_2000190 - SURFACE
      ?auto_2000191 - SURFACE
      ?auto_2000192 - SURFACE
      ?auto_2000193 - SURFACE
      ?auto_2000194 - SURFACE
    )
    :vars
    (
      ?auto_2000195 - HOIST
      ?auto_2000197 - PLACE
      ?auto_2000196 - TRUCK
      ?auto_2000198 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2000195 ?auto_2000197 ) ( SURFACE-AT ?auto_2000193 ?auto_2000197 ) ( CLEAR ?auto_2000193 ) ( IS-CRATE ?auto_2000194 ) ( not ( = ?auto_2000193 ?auto_2000194 ) ) ( AVAILABLE ?auto_2000195 ) ( IN ?auto_2000194 ?auto_2000196 ) ( ON ?auto_2000193 ?auto_2000192 ) ( not ( = ?auto_2000192 ?auto_2000193 ) ) ( not ( = ?auto_2000192 ?auto_2000194 ) ) ( TRUCK-AT ?auto_2000196 ?auto_2000198 ) ( not ( = ?auto_2000198 ?auto_2000197 ) ) ( ON ?auto_2000180 ?auto_2000179 ) ( ON ?auto_2000181 ?auto_2000180 ) ( ON ?auto_2000183 ?auto_2000181 ) ( ON ?auto_2000182 ?auto_2000183 ) ( ON ?auto_2000184 ?auto_2000182 ) ( ON ?auto_2000185 ?auto_2000184 ) ( ON ?auto_2000186 ?auto_2000185 ) ( ON ?auto_2000187 ?auto_2000186 ) ( ON ?auto_2000188 ?auto_2000187 ) ( ON ?auto_2000189 ?auto_2000188 ) ( ON ?auto_2000190 ?auto_2000189 ) ( ON ?auto_2000191 ?auto_2000190 ) ( ON ?auto_2000192 ?auto_2000191 ) ( not ( = ?auto_2000179 ?auto_2000180 ) ) ( not ( = ?auto_2000179 ?auto_2000181 ) ) ( not ( = ?auto_2000179 ?auto_2000183 ) ) ( not ( = ?auto_2000179 ?auto_2000182 ) ) ( not ( = ?auto_2000179 ?auto_2000184 ) ) ( not ( = ?auto_2000179 ?auto_2000185 ) ) ( not ( = ?auto_2000179 ?auto_2000186 ) ) ( not ( = ?auto_2000179 ?auto_2000187 ) ) ( not ( = ?auto_2000179 ?auto_2000188 ) ) ( not ( = ?auto_2000179 ?auto_2000189 ) ) ( not ( = ?auto_2000179 ?auto_2000190 ) ) ( not ( = ?auto_2000179 ?auto_2000191 ) ) ( not ( = ?auto_2000179 ?auto_2000192 ) ) ( not ( = ?auto_2000179 ?auto_2000193 ) ) ( not ( = ?auto_2000179 ?auto_2000194 ) ) ( not ( = ?auto_2000180 ?auto_2000181 ) ) ( not ( = ?auto_2000180 ?auto_2000183 ) ) ( not ( = ?auto_2000180 ?auto_2000182 ) ) ( not ( = ?auto_2000180 ?auto_2000184 ) ) ( not ( = ?auto_2000180 ?auto_2000185 ) ) ( not ( = ?auto_2000180 ?auto_2000186 ) ) ( not ( = ?auto_2000180 ?auto_2000187 ) ) ( not ( = ?auto_2000180 ?auto_2000188 ) ) ( not ( = ?auto_2000180 ?auto_2000189 ) ) ( not ( = ?auto_2000180 ?auto_2000190 ) ) ( not ( = ?auto_2000180 ?auto_2000191 ) ) ( not ( = ?auto_2000180 ?auto_2000192 ) ) ( not ( = ?auto_2000180 ?auto_2000193 ) ) ( not ( = ?auto_2000180 ?auto_2000194 ) ) ( not ( = ?auto_2000181 ?auto_2000183 ) ) ( not ( = ?auto_2000181 ?auto_2000182 ) ) ( not ( = ?auto_2000181 ?auto_2000184 ) ) ( not ( = ?auto_2000181 ?auto_2000185 ) ) ( not ( = ?auto_2000181 ?auto_2000186 ) ) ( not ( = ?auto_2000181 ?auto_2000187 ) ) ( not ( = ?auto_2000181 ?auto_2000188 ) ) ( not ( = ?auto_2000181 ?auto_2000189 ) ) ( not ( = ?auto_2000181 ?auto_2000190 ) ) ( not ( = ?auto_2000181 ?auto_2000191 ) ) ( not ( = ?auto_2000181 ?auto_2000192 ) ) ( not ( = ?auto_2000181 ?auto_2000193 ) ) ( not ( = ?auto_2000181 ?auto_2000194 ) ) ( not ( = ?auto_2000183 ?auto_2000182 ) ) ( not ( = ?auto_2000183 ?auto_2000184 ) ) ( not ( = ?auto_2000183 ?auto_2000185 ) ) ( not ( = ?auto_2000183 ?auto_2000186 ) ) ( not ( = ?auto_2000183 ?auto_2000187 ) ) ( not ( = ?auto_2000183 ?auto_2000188 ) ) ( not ( = ?auto_2000183 ?auto_2000189 ) ) ( not ( = ?auto_2000183 ?auto_2000190 ) ) ( not ( = ?auto_2000183 ?auto_2000191 ) ) ( not ( = ?auto_2000183 ?auto_2000192 ) ) ( not ( = ?auto_2000183 ?auto_2000193 ) ) ( not ( = ?auto_2000183 ?auto_2000194 ) ) ( not ( = ?auto_2000182 ?auto_2000184 ) ) ( not ( = ?auto_2000182 ?auto_2000185 ) ) ( not ( = ?auto_2000182 ?auto_2000186 ) ) ( not ( = ?auto_2000182 ?auto_2000187 ) ) ( not ( = ?auto_2000182 ?auto_2000188 ) ) ( not ( = ?auto_2000182 ?auto_2000189 ) ) ( not ( = ?auto_2000182 ?auto_2000190 ) ) ( not ( = ?auto_2000182 ?auto_2000191 ) ) ( not ( = ?auto_2000182 ?auto_2000192 ) ) ( not ( = ?auto_2000182 ?auto_2000193 ) ) ( not ( = ?auto_2000182 ?auto_2000194 ) ) ( not ( = ?auto_2000184 ?auto_2000185 ) ) ( not ( = ?auto_2000184 ?auto_2000186 ) ) ( not ( = ?auto_2000184 ?auto_2000187 ) ) ( not ( = ?auto_2000184 ?auto_2000188 ) ) ( not ( = ?auto_2000184 ?auto_2000189 ) ) ( not ( = ?auto_2000184 ?auto_2000190 ) ) ( not ( = ?auto_2000184 ?auto_2000191 ) ) ( not ( = ?auto_2000184 ?auto_2000192 ) ) ( not ( = ?auto_2000184 ?auto_2000193 ) ) ( not ( = ?auto_2000184 ?auto_2000194 ) ) ( not ( = ?auto_2000185 ?auto_2000186 ) ) ( not ( = ?auto_2000185 ?auto_2000187 ) ) ( not ( = ?auto_2000185 ?auto_2000188 ) ) ( not ( = ?auto_2000185 ?auto_2000189 ) ) ( not ( = ?auto_2000185 ?auto_2000190 ) ) ( not ( = ?auto_2000185 ?auto_2000191 ) ) ( not ( = ?auto_2000185 ?auto_2000192 ) ) ( not ( = ?auto_2000185 ?auto_2000193 ) ) ( not ( = ?auto_2000185 ?auto_2000194 ) ) ( not ( = ?auto_2000186 ?auto_2000187 ) ) ( not ( = ?auto_2000186 ?auto_2000188 ) ) ( not ( = ?auto_2000186 ?auto_2000189 ) ) ( not ( = ?auto_2000186 ?auto_2000190 ) ) ( not ( = ?auto_2000186 ?auto_2000191 ) ) ( not ( = ?auto_2000186 ?auto_2000192 ) ) ( not ( = ?auto_2000186 ?auto_2000193 ) ) ( not ( = ?auto_2000186 ?auto_2000194 ) ) ( not ( = ?auto_2000187 ?auto_2000188 ) ) ( not ( = ?auto_2000187 ?auto_2000189 ) ) ( not ( = ?auto_2000187 ?auto_2000190 ) ) ( not ( = ?auto_2000187 ?auto_2000191 ) ) ( not ( = ?auto_2000187 ?auto_2000192 ) ) ( not ( = ?auto_2000187 ?auto_2000193 ) ) ( not ( = ?auto_2000187 ?auto_2000194 ) ) ( not ( = ?auto_2000188 ?auto_2000189 ) ) ( not ( = ?auto_2000188 ?auto_2000190 ) ) ( not ( = ?auto_2000188 ?auto_2000191 ) ) ( not ( = ?auto_2000188 ?auto_2000192 ) ) ( not ( = ?auto_2000188 ?auto_2000193 ) ) ( not ( = ?auto_2000188 ?auto_2000194 ) ) ( not ( = ?auto_2000189 ?auto_2000190 ) ) ( not ( = ?auto_2000189 ?auto_2000191 ) ) ( not ( = ?auto_2000189 ?auto_2000192 ) ) ( not ( = ?auto_2000189 ?auto_2000193 ) ) ( not ( = ?auto_2000189 ?auto_2000194 ) ) ( not ( = ?auto_2000190 ?auto_2000191 ) ) ( not ( = ?auto_2000190 ?auto_2000192 ) ) ( not ( = ?auto_2000190 ?auto_2000193 ) ) ( not ( = ?auto_2000190 ?auto_2000194 ) ) ( not ( = ?auto_2000191 ?auto_2000192 ) ) ( not ( = ?auto_2000191 ?auto_2000193 ) ) ( not ( = ?auto_2000191 ?auto_2000194 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2000192 ?auto_2000193 ?auto_2000194 )
      ( MAKE-15CRATE-VERIFY ?auto_2000179 ?auto_2000180 ?auto_2000181 ?auto_2000183 ?auto_2000182 ?auto_2000184 ?auto_2000185 ?auto_2000186 ?auto_2000187 ?auto_2000188 ?auto_2000189 ?auto_2000190 ?auto_2000191 ?auto_2000192 ?auto_2000193 ?auto_2000194 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2000389 - SURFACE
      ?auto_2000390 - SURFACE
      ?auto_2000391 - SURFACE
      ?auto_2000393 - SURFACE
      ?auto_2000392 - SURFACE
      ?auto_2000394 - SURFACE
      ?auto_2000395 - SURFACE
      ?auto_2000396 - SURFACE
      ?auto_2000397 - SURFACE
      ?auto_2000398 - SURFACE
      ?auto_2000399 - SURFACE
      ?auto_2000400 - SURFACE
      ?auto_2000401 - SURFACE
      ?auto_2000402 - SURFACE
      ?auto_2000403 - SURFACE
      ?auto_2000404 - SURFACE
    )
    :vars
    (
      ?auto_2000407 - HOIST
      ?auto_2000408 - PLACE
      ?auto_2000406 - TRUCK
      ?auto_2000405 - PLACE
      ?auto_2000409 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2000407 ?auto_2000408 ) ( SURFACE-AT ?auto_2000403 ?auto_2000408 ) ( CLEAR ?auto_2000403 ) ( IS-CRATE ?auto_2000404 ) ( not ( = ?auto_2000403 ?auto_2000404 ) ) ( AVAILABLE ?auto_2000407 ) ( ON ?auto_2000403 ?auto_2000402 ) ( not ( = ?auto_2000402 ?auto_2000403 ) ) ( not ( = ?auto_2000402 ?auto_2000404 ) ) ( TRUCK-AT ?auto_2000406 ?auto_2000405 ) ( not ( = ?auto_2000405 ?auto_2000408 ) ) ( HOIST-AT ?auto_2000409 ?auto_2000405 ) ( LIFTING ?auto_2000409 ?auto_2000404 ) ( not ( = ?auto_2000407 ?auto_2000409 ) ) ( ON ?auto_2000390 ?auto_2000389 ) ( ON ?auto_2000391 ?auto_2000390 ) ( ON ?auto_2000393 ?auto_2000391 ) ( ON ?auto_2000392 ?auto_2000393 ) ( ON ?auto_2000394 ?auto_2000392 ) ( ON ?auto_2000395 ?auto_2000394 ) ( ON ?auto_2000396 ?auto_2000395 ) ( ON ?auto_2000397 ?auto_2000396 ) ( ON ?auto_2000398 ?auto_2000397 ) ( ON ?auto_2000399 ?auto_2000398 ) ( ON ?auto_2000400 ?auto_2000399 ) ( ON ?auto_2000401 ?auto_2000400 ) ( ON ?auto_2000402 ?auto_2000401 ) ( not ( = ?auto_2000389 ?auto_2000390 ) ) ( not ( = ?auto_2000389 ?auto_2000391 ) ) ( not ( = ?auto_2000389 ?auto_2000393 ) ) ( not ( = ?auto_2000389 ?auto_2000392 ) ) ( not ( = ?auto_2000389 ?auto_2000394 ) ) ( not ( = ?auto_2000389 ?auto_2000395 ) ) ( not ( = ?auto_2000389 ?auto_2000396 ) ) ( not ( = ?auto_2000389 ?auto_2000397 ) ) ( not ( = ?auto_2000389 ?auto_2000398 ) ) ( not ( = ?auto_2000389 ?auto_2000399 ) ) ( not ( = ?auto_2000389 ?auto_2000400 ) ) ( not ( = ?auto_2000389 ?auto_2000401 ) ) ( not ( = ?auto_2000389 ?auto_2000402 ) ) ( not ( = ?auto_2000389 ?auto_2000403 ) ) ( not ( = ?auto_2000389 ?auto_2000404 ) ) ( not ( = ?auto_2000390 ?auto_2000391 ) ) ( not ( = ?auto_2000390 ?auto_2000393 ) ) ( not ( = ?auto_2000390 ?auto_2000392 ) ) ( not ( = ?auto_2000390 ?auto_2000394 ) ) ( not ( = ?auto_2000390 ?auto_2000395 ) ) ( not ( = ?auto_2000390 ?auto_2000396 ) ) ( not ( = ?auto_2000390 ?auto_2000397 ) ) ( not ( = ?auto_2000390 ?auto_2000398 ) ) ( not ( = ?auto_2000390 ?auto_2000399 ) ) ( not ( = ?auto_2000390 ?auto_2000400 ) ) ( not ( = ?auto_2000390 ?auto_2000401 ) ) ( not ( = ?auto_2000390 ?auto_2000402 ) ) ( not ( = ?auto_2000390 ?auto_2000403 ) ) ( not ( = ?auto_2000390 ?auto_2000404 ) ) ( not ( = ?auto_2000391 ?auto_2000393 ) ) ( not ( = ?auto_2000391 ?auto_2000392 ) ) ( not ( = ?auto_2000391 ?auto_2000394 ) ) ( not ( = ?auto_2000391 ?auto_2000395 ) ) ( not ( = ?auto_2000391 ?auto_2000396 ) ) ( not ( = ?auto_2000391 ?auto_2000397 ) ) ( not ( = ?auto_2000391 ?auto_2000398 ) ) ( not ( = ?auto_2000391 ?auto_2000399 ) ) ( not ( = ?auto_2000391 ?auto_2000400 ) ) ( not ( = ?auto_2000391 ?auto_2000401 ) ) ( not ( = ?auto_2000391 ?auto_2000402 ) ) ( not ( = ?auto_2000391 ?auto_2000403 ) ) ( not ( = ?auto_2000391 ?auto_2000404 ) ) ( not ( = ?auto_2000393 ?auto_2000392 ) ) ( not ( = ?auto_2000393 ?auto_2000394 ) ) ( not ( = ?auto_2000393 ?auto_2000395 ) ) ( not ( = ?auto_2000393 ?auto_2000396 ) ) ( not ( = ?auto_2000393 ?auto_2000397 ) ) ( not ( = ?auto_2000393 ?auto_2000398 ) ) ( not ( = ?auto_2000393 ?auto_2000399 ) ) ( not ( = ?auto_2000393 ?auto_2000400 ) ) ( not ( = ?auto_2000393 ?auto_2000401 ) ) ( not ( = ?auto_2000393 ?auto_2000402 ) ) ( not ( = ?auto_2000393 ?auto_2000403 ) ) ( not ( = ?auto_2000393 ?auto_2000404 ) ) ( not ( = ?auto_2000392 ?auto_2000394 ) ) ( not ( = ?auto_2000392 ?auto_2000395 ) ) ( not ( = ?auto_2000392 ?auto_2000396 ) ) ( not ( = ?auto_2000392 ?auto_2000397 ) ) ( not ( = ?auto_2000392 ?auto_2000398 ) ) ( not ( = ?auto_2000392 ?auto_2000399 ) ) ( not ( = ?auto_2000392 ?auto_2000400 ) ) ( not ( = ?auto_2000392 ?auto_2000401 ) ) ( not ( = ?auto_2000392 ?auto_2000402 ) ) ( not ( = ?auto_2000392 ?auto_2000403 ) ) ( not ( = ?auto_2000392 ?auto_2000404 ) ) ( not ( = ?auto_2000394 ?auto_2000395 ) ) ( not ( = ?auto_2000394 ?auto_2000396 ) ) ( not ( = ?auto_2000394 ?auto_2000397 ) ) ( not ( = ?auto_2000394 ?auto_2000398 ) ) ( not ( = ?auto_2000394 ?auto_2000399 ) ) ( not ( = ?auto_2000394 ?auto_2000400 ) ) ( not ( = ?auto_2000394 ?auto_2000401 ) ) ( not ( = ?auto_2000394 ?auto_2000402 ) ) ( not ( = ?auto_2000394 ?auto_2000403 ) ) ( not ( = ?auto_2000394 ?auto_2000404 ) ) ( not ( = ?auto_2000395 ?auto_2000396 ) ) ( not ( = ?auto_2000395 ?auto_2000397 ) ) ( not ( = ?auto_2000395 ?auto_2000398 ) ) ( not ( = ?auto_2000395 ?auto_2000399 ) ) ( not ( = ?auto_2000395 ?auto_2000400 ) ) ( not ( = ?auto_2000395 ?auto_2000401 ) ) ( not ( = ?auto_2000395 ?auto_2000402 ) ) ( not ( = ?auto_2000395 ?auto_2000403 ) ) ( not ( = ?auto_2000395 ?auto_2000404 ) ) ( not ( = ?auto_2000396 ?auto_2000397 ) ) ( not ( = ?auto_2000396 ?auto_2000398 ) ) ( not ( = ?auto_2000396 ?auto_2000399 ) ) ( not ( = ?auto_2000396 ?auto_2000400 ) ) ( not ( = ?auto_2000396 ?auto_2000401 ) ) ( not ( = ?auto_2000396 ?auto_2000402 ) ) ( not ( = ?auto_2000396 ?auto_2000403 ) ) ( not ( = ?auto_2000396 ?auto_2000404 ) ) ( not ( = ?auto_2000397 ?auto_2000398 ) ) ( not ( = ?auto_2000397 ?auto_2000399 ) ) ( not ( = ?auto_2000397 ?auto_2000400 ) ) ( not ( = ?auto_2000397 ?auto_2000401 ) ) ( not ( = ?auto_2000397 ?auto_2000402 ) ) ( not ( = ?auto_2000397 ?auto_2000403 ) ) ( not ( = ?auto_2000397 ?auto_2000404 ) ) ( not ( = ?auto_2000398 ?auto_2000399 ) ) ( not ( = ?auto_2000398 ?auto_2000400 ) ) ( not ( = ?auto_2000398 ?auto_2000401 ) ) ( not ( = ?auto_2000398 ?auto_2000402 ) ) ( not ( = ?auto_2000398 ?auto_2000403 ) ) ( not ( = ?auto_2000398 ?auto_2000404 ) ) ( not ( = ?auto_2000399 ?auto_2000400 ) ) ( not ( = ?auto_2000399 ?auto_2000401 ) ) ( not ( = ?auto_2000399 ?auto_2000402 ) ) ( not ( = ?auto_2000399 ?auto_2000403 ) ) ( not ( = ?auto_2000399 ?auto_2000404 ) ) ( not ( = ?auto_2000400 ?auto_2000401 ) ) ( not ( = ?auto_2000400 ?auto_2000402 ) ) ( not ( = ?auto_2000400 ?auto_2000403 ) ) ( not ( = ?auto_2000400 ?auto_2000404 ) ) ( not ( = ?auto_2000401 ?auto_2000402 ) ) ( not ( = ?auto_2000401 ?auto_2000403 ) ) ( not ( = ?auto_2000401 ?auto_2000404 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2000402 ?auto_2000403 ?auto_2000404 )
      ( MAKE-15CRATE-VERIFY ?auto_2000389 ?auto_2000390 ?auto_2000391 ?auto_2000393 ?auto_2000392 ?auto_2000394 ?auto_2000395 ?auto_2000396 ?auto_2000397 ?auto_2000398 ?auto_2000399 ?auto_2000400 ?auto_2000401 ?auto_2000402 ?auto_2000403 ?auto_2000404 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2000614 - SURFACE
      ?auto_2000615 - SURFACE
      ?auto_2000616 - SURFACE
      ?auto_2000618 - SURFACE
      ?auto_2000617 - SURFACE
      ?auto_2000619 - SURFACE
      ?auto_2000620 - SURFACE
      ?auto_2000621 - SURFACE
      ?auto_2000622 - SURFACE
      ?auto_2000623 - SURFACE
      ?auto_2000624 - SURFACE
      ?auto_2000625 - SURFACE
      ?auto_2000626 - SURFACE
      ?auto_2000627 - SURFACE
      ?auto_2000628 - SURFACE
      ?auto_2000629 - SURFACE
    )
    :vars
    (
      ?auto_2000632 - HOIST
      ?auto_2000630 - PLACE
      ?auto_2000633 - TRUCK
      ?auto_2000631 - PLACE
      ?auto_2000635 - HOIST
      ?auto_2000634 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2000632 ?auto_2000630 ) ( SURFACE-AT ?auto_2000628 ?auto_2000630 ) ( CLEAR ?auto_2000628 ) ( IS-CRATE ?auto_2000629 ) ( not ( = ?auto_2000628 ?auto_2000629 ) ) ( AVAILABLE ?auto_2000632 ) ( ON ?auto_2000628 ?auto_2000627 ) ( not ( = ?auto_2000627 ?auto_2000628 ) ) ( not ( = ?auto_2000627 ?auto_2000629 ) ) ( TRUCK-AT ?auto_2000633 ?auto_2000631 ) ( not ( = ?auto_2000631 ?auto_2000630 ) ) ( HOIST-AT ?auto_2000635 ?auto_2000631 ) ( not ( = ?auto_2000632 ?auto_2000635 ) ) ( AVAILABLE ?auto_2000635 ) ( SURFACE-AT ?auto_2000629 ?auto_2000631 ) ( ON ?auto_2000629 ?auto_2000634 ) ( CLEAR ?auto_2000629 ) ( not ( = ?auto_2000628 ?auto_2000634 ) ) ( not ( = ?auto_2000629 ?auto_2000634 ) ) ( not ( = ?auto_2000627 ?auto_2000634 ) ) ( ON ?auto_2000615 ?auto_2000614 ) ( ON ?auto_2000616 ?auto_2000615 ) ( ON ?auto_2000618 ?auto_2000616 ) ( ON ?auto_2000617 ?auto_2000618 ) ( ON ?auto_2000619 ?auto_2000617 ) ( ON ?auto_2000620 ?auto_2000619 ) ( ON ?auto_2000621 ?auto_2000620 ) ( ON ?auto_2000622 ?auto_2000621 ) ( ON ?auto_2000623 ?auto_2000622 ) ( ON ?auto_2000624 ?auto_2000623 ) ( ON ?auto_2000625 ?auto_2000624 ) ( ON ?auto_2000626 ?auto_2000625 ) ( ON ?auto_2000627 ?auto_2000626 ) ( not ( = ?auto_2000614 ?auto_2000615 ) ) ( not ( = ?auto_2000614 ?auto_2000616 ) ) ( not ( = ?auto_2000614 ?auto_2000618 ) ) ( not ( = ?auto_2000614 ?auto_2000617 ) ) ( not ( = ?auto_2000614 ?auto_2000619 ) ) ( not ( = ?auto_2000614 ?auto_2000620 ) ) ( not ( = ?auto_2000614 ?auto_2000621 ) ) ( not ( = ?auto_2000614 ?auto_2000622 ) ) ( not ( = ?auto_2000614 ?auto_2000623 ) ) ( not ( = ?auto_2000614 ?auto_2000624 ) ) ( not ( = ?auto_2000614 ?auto_2000625 ) ) ( not ( = ?auto_2000614 ?auto_2000626 ) ) ( not ( = ?auto_2000614 ?auto_2000627 ) ) ( not ( = ?auto_2000614 ?auto_2000628 ) ) ( not ( = ?auto_2000614 ?auto_2000629 ) ) ( not ( = ?auto_2000614 ?auto_2000634 ) ) ( not ( = ?auto_2000615 ?auto_2000616 ) ) ( not ( = ?auto_2000615 ?auto_2000618 ) ) ( not ( = ?auto_2000615 ?auto_2000617 ) ) ( not ( = ?auto_2000615 ?auto_2000619 ) ) ( not ( = ?auto_2000615 ?auto_2000620 ) ) ( not ( = ?auto_2000615 ?auto_2000621 ) ) ( not ( = ?auto_2000615 ?auto_2000622 ) ) ( not ( = ?auto_2000615 ?auto_2000623 ) ) ( not ( = ?auto_2000615 ?auto_2000624 ) ) ( not ( = ?auto_2000615 ?auto_2000625 ) ) ( not ( = ?auto_2000615 ?auto_2000626 ) ) ( not ( = ?auto_2000615 ?auto_2000627 ) ) ( not ( = ?auto_2000615 ?auto_2000628 ) ) ( not ( = ?auto_2000615 ?auto_2000629 ) ) ( not ( = ?auto_2000615 ?auto_2000634 ) ) ( not ( = ?auto_2000616 ?auto_2000618 ) ) ( not ( = ?auto_2000616 ?auto_2000617 ) ) ( not ( = ?auto_2000616 ?auto_2000619 ) ) ( not ( = ?auto_2000616 ?auto_2000620 ) ) ( not ( = ?auto_2000616 ?auto_2000621 ) ) ( not ( = ?auto_2000616 ?auto_2000622 ) ) ( not ( = ?auto_2000616 ?auto_2000623 ) ) ( not ( = ?auto_2000616 ?auto_2000624 ) ) ( not ( = ?auto_2000616 ?auto_2000625 ) ) ( not ( = ?auto_2000616 ?auto_2000626 ) ) ( not ( = ?auto_2000616 ?auto_2000627 ) ) ( not ( = ?auto_2000616 ?auto_2000628 ) ) ( not ( = ?auto_2000616 ?auto_2000629 ) ) ( not ( = ?auto_2000616 ?auto_2000634 ) ) ( not ( = ?auto_2000618 ?auto_2000617 ) ) ( not ( = ?auto_2000618 ?auto_2000619 ) ) ( not ( = ?auto_2000618 ?auto_2000620 ) ) ( not ( = ?auto_2000618 ?auto_2000621 ) ) ( not ( = ?auto_2000618 ?auto_2000622 ) ) ( not ( = ?auto_2000618 ?auto_2000623 ) ) ( not ( = ?auto_2000618 ?auto_2000624 ) ) ( not ( = ?auto_2000618 ?auto_2000625 ) ) ( not ( = ?auto_2000618 ?auto_2000626 ) ) ( not ( = ?auto_2000618 ?auto_2000627 ) ) ( not ( = ?auto_2000618 ?auto_2000628 ) ) ( not ( = ?auto_2000618 ?auto_2000629 ) ) ( not ( = ?auto_2000618 ?auto_2000634 ) ) ( not ( = ?auto_2000617 ?auto_2000619 ) ) ( not ( = ?auto_2000617 ?auto_2000620 ) ) ( not ( = ?auto_2000617 ?auto_2000621 ) ) ( not ( = ?auto_2000617 ?auto_2000622 ) ) ( not ( = ?auto_2000617 ?auto_2000623 ) ) ( not ( = ?auto_2000617 ?auto_2000624 ) ) ( not ( = ?auto_2000617 ?auto_2000625 ) ) ( not ( = ?auto_2000617 ?auto_2000626 ) ) ( not ( = ?auto_2000617 ?auto_2000627 ) ) ( not ( = ?auto_2000617 ?auto_2000628 ) ) ( not ( = ?auto_2000617 ?auto_2000629 ) ) ( not ( = ?auto_2000617 ?auto_2000634 ) ) ( not ( = ?auto_2000619 ?auto_2000620 ) ) ( not ( = ?auto_2000619 ?auto_2000621 ) ) ( not ( = ?auto_2000619 ?auto_2000622 ) ) ( not ( = ?auto_2000619 ?auto_2000623 ) ) ( not ( = ?auto_2000619 ?auto_2000624 ) ) ( not ( = ?auto_2000619 ?auto_2000625 ) ) ( not ( = ?auto_2000619 ?auto_2000626 ) ) ( not ( = ?auto_2000619 ?auto_2000627 ) ) ( not ( = ?auto_2000619 ?auto_2000628 ) ) ( not ( = ?auto_2000619 ?auto_2000629 ) ) ( not ( = ?auto_2000619 ?auto_2000634 ) ) ( not ( = ?auto_2000620 ?auto_2000621 ) ) ( not ( = ?auto_2000620 ?auto_2000622 ) ) ( not ( = ?auto_2000620 ?auto_2000623 ) ) ( not ( = ?auto_2000620 ?auto_2000624 ) ) ( not ( = ?auto_2000620 ?auto_2000625 ) ) ( not ( = ?auto_2000620 ?auto_2000626 ) ) ( not ( = ?auto_2000620 ?auto_2000627 ) ) ( not ( = ?auto_2000620 ?auto_2000628 ) ) ( not ( = ?auto_2000620 ?auto_2000629 ) ) ( not ( = ?auto_2000620 ?auto_2000634 ) ) ( not ( = ?auto_2000621 ?auto_2000622 ) ) ( not ( = ?auto_2000621 ?auto_2000623 ) ) ( not ( = ?auto_2000621 ?auto_2000624 ) ) ( not ( = ?auto_2000621 ?auto_2000625 ) ) ( not ( = ?auto_2000621 ?auto_2000626 ) ) ( not ( = ?auto_2000621 ?auto_2000627 ) ) ( not ( = ?auto_2000621 ?auto_2000628 ) ) ( not ( = ?auto_2000621 ?auto_2000629 ) ) ( not ( = ?auto_2000621 ?auto_2000634 ) ) ( not ( = ?auto_2000622 ?auto_2000623 ) ) ( not ( = ?auto_2000622 ?auto_2000624 ) ) ( not ( = ?auto_2000622 ?auto_2000625 ) ) ( not ( = ?auto_2000622 ?auto_2000626 ) ) ( not ( = ?auto_2000622 ?auto_2000627 ) ) ( not ( = ?auto_2000622 ?auto_2000628 ) ) ( not ( = ?auto_2000622 ?auto_2000629 ) ) ( not ( = ?auto_2000622 ?auto_2000634 ) ) ( not ( = ?auto_2000623 ?auto_2000624 ) ) ( not ( = ?auto_2000623 ?auto_2000625 ) ) ( not ( = ?auto_2000623 ?auto_2000626 ) ) ( not ( = ?auto_2000623 ?auto_2000627 ) ) ( not ( = ?auto_2000623 ?auto_2000628 ) ) ( not ( = ?auto_2000623 ?auto_2000629 ) ) ( not ( = ?auto_2000623 ?auto_2000634 ) ) ( not ( = ?auto_2000624 ?auto_2000625 ) ) ( not ( = ?auto_2000624 ?auto_2000626 ) ) ( not ( = ?auto_2000624 ?auto_2000627 ) ) ( not ( = ?auto_2000624 ?auto_2000628 ) ) ( not ( = ?auto_2000624 ?auto_2000629 ) ) ( not ( = ?auto_2000624 ?auto_2000634 ) ) ( not ( = ?auto_2000625 ?auto_2000626 ) ) ( not ( = ?auto_2000625 ?auto_2000627 ) ) ( not ( = ?auto_2000625 ?auto_2000628 ) ) ( not ( = ?auto_2000625 ?auto_2000629 ) ) ( not ( = ?auto_2000625 ?auto_2000634 ) ) ( not ( = ?auto_2000626 ?auto_2000627 ) ) ( not ( = ?auto_2000626 ?auto_2000628 ) ) ( not ( = ?auto_2000626 ?auto_2000629 ) ) ( not ( = ?auto_2000626 ?auto_2000634 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2000627 ?auto_2000628 ?auto_2000629 )
      ( MAKE-15CRATE-VERIFY ?auto_2000614 ?auto_2000615 ?auto_2000616 ?auto_2000618 ?auto_2000617 ?auto_2000619 ?auto_2000620 ?auto_2000621 ?auto_2000622 ?auto_2000623 ?auto_2000624 ?auto_2000625 ?auto_2000626 ?auto_2000627 ?auto_2000628 ?auto_2000629 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2000840 - SURFACE
      ?auto_2000841 - SURFACE
      ?auto_2000842 - SURFACE
      ?auto_2000844 - SURFACE
      ?auto_2000843 - SURFACE
      ?auto_2000845 - SURFACE
      ?auto_2000846 - SURFACE
      ?auto_2000847 - SURFACE
      ?auto_2000848 - SURFACE
      ?auto_2000849 - SURFACE
      ?auto_2000850 - SURFACE
      ?auto_2000851 - SURFACE
      ?auto_2000852 - SURFACE
      ?auto_2000853 - SURFACE
      ?auto_2000854 - SURFACE
      ?auto_2000855 - SURFACE
    )
    :vars
    (
      ?auto_2000857 - HOIST
      ?auto_2000858 - PLACE
      ?auto_2000861 - PLACE
      ?auto_2000859 - HOIST
      ?auto_2000860 - SURFACE
      ?auto_2000856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2000857 ?auto_2000858 ) ( SURFACE-AT ?auto_2000854 ?auto_2000858 ) ( CLEAR ?auto_2000854 ) ( IS-CRATE ?auto_2000855 ) ( not ( = ?auto_2000854 ?auto_2000855 ) ) ( AVAILABLE ?auto_2000857 ) ( ON ?auto_2000854 ?auto_2000853 ) ( not ( = ?auto_2000853 ?auto_2000854 ) ) ( not ( = ?auto_2000853 ?auto_2000855 ) ) ( not ( = ?auto_2000861 ?auto_2000858 ) ) ( HOIST-AT ?auto_2000859 ?auto_2000861 ) ( not ( = ?auto_2000857 ?auto_2000859 ) ) ( AVAILABLE ?auto_2000859 ) ( SURFACE-AT ?auto_2000855 ?auto_2000861 ) ( ON ?auto_2000855 ?auto_2000860 ) ( CLEAR ?auto_2000855 ) ( not ( = ?auto_2000854 ?auto_2000860 ) ) ( not ( = ?auto_2000855 ?auto_2000860 ) ) ( not ( = ?auto_2000853 ?auto_2000860 ) ) ( TRUCK-AT ?auto_2000856 ?auto_2000858 ) ( ON ?auto_2000841 ?auto_2000840 ) ( ON ?auto_2000842 ?auto_2000841 ) ( ON ?auto_2000844 ?auto_2000842 ) ( ON ?auto_2000843 ?auto_2000844 ) ( ON ?auto_2000845 ?auto_2000843 ) ( ON ?auto_2000846 ?auto_2000845 ) ( ON ?auto_2000847 ?auto_2000846 ) ( ON ?auto_2000848 ?auto_2000847 ) ( ON ?auto_2000849 ?auto_2000848 ) ( ON ?auto_2000850 ?auto_2000849 ) ( ON ?auto_2000851 ?auto_2000850 ) ( ON ?auto_2000852 ?auto_2000851 ) ( ON ?auto_2000853 ?auto_2000852 ) ( not ( = ?auto_2000840 ?auto_2000841 ) ) ( not ( = ?auto_2000840 ?auto_2000842 ) ) ( not ( = ?auto_2000840 ?auto_2000844 ) ) ( not ( = ?auto_2000840 ?auto_2000843 ) ) ( not ( = ?auto_2000840 ?auto_2000845 ) ) ( not ( = ?auto_2000840 ?auto_2000846 ) ) ( not ( = ?auto_2000840 ?auto_2000847 ) ) ( not ( = ?auto_2000840 ?auto_2000848 ) ) ( not ( = ?auto_2000840 ?auto_2000849 ) ) ( not ( = ?auto_2000840 ?auto_2000850 ) ) ( not ( = ?auto_2000840 ?auto_2000851 ) ) ( not ( = ?auto_2000840 ?auto_2000852 ) ) ( not ( = ?auto_2000840 ?auto_2000853 ) ) ( not ( = ?auto_2000840 ?auto_2000854 ) ) ( not ( = ?auto_2000840 ?auto_2000855 ) ) ( not ( = ?auto_2000840 ?auto_2000860 ) ) ( not ( = ?auto_2000841 ?auto_2000842 ) ) ( not ( = ?auto_2000841 ?auto_2000844 ) ) ( not ( = ?auto_2000841 ?auto_2000843 ) ) ( not ( = ?auto_2000841 ?auto_2000845 ) ) ( not ( = ?auto_2000841 ?auto_2000846 ) ) ( not ( = ?auto_2000841 ?auto_2000847 ) ) ( not ( = ?auto_2000841 ?auto_2000848 ) ) ( not ( = ?auto_2000841 ?auto_2000849 ) ) ( not ( = ?auto_2000841 ?auto_2000850 ) ) ( not ( = ?auto_2000841 ?auto_2000851 ) ) ( not ( = ?auto_2000841 ?auto_2000852 ) ) ( not ( = ?auto_2000841 ?auto_2000853 ) ) ( not ( = ?auto_2000841 ?auto_2000854 ) ) ( not ( = ?auto_2000841 ?auto_2000855 ) ) ( not ( = ?auto_2000841 ?auto_2000860 ) ) ( not ( = ?auto_2000842 ?auto_2000844 ) ) ( not ( = ?auto_2000842 ?auto_2000843 ) ) ( not ( = ?auto_2000842 ?auto_2000845 ) ) ( not ( = ?auto_2000842 ?auto_2000846 ) ) ( not ( = ?auto_2000842 ?auto_2000847 ) ) ( not ( = ?auto_2000842 ?auto_2000848 ) ) ( not ( = ?auto_2000842 ?auto_2000849 ) ) ( not ( = ?auto_2000842 ?auto_2000850 ) ) ( not ( = ?auto_2000842 ?auto_2000851 ) ) ( not ( = ?auto_2000842 ?auto_2000852 ) ) ( not ( = ?auto_2000842 ?auto_2000853 ) ) ( not ( = ?auto_2000842 ?auto_2000854 ) ) ( not ( = ?auto_2000842 ?auto_2000855 ) ) ( not ( = ?auto_2000842 ?auto_2000860 ) ) ( not ( = ?auto_2000844 ?auto_2000843 ) ) ( not ( = ?auto_2000844 ?auto_2000845 ) ) ( not ( = ?auto_2000844 ?auto_2000846 ) ) ( not ( = ?auto_2000844 ?auto_2000847 ) ) ( not ( = ?auto_2000844 ?auto_2000848 ) ) ( not ( = ?auto_2000844 ?auto_2000849 ) ) ( not ( = ?auto_2000844 ?auto_2000850 ) ) ( not ( = ?auto_2000844 ?auto_2000851 ) ) ( not ( = ?auto_2000844 ?auto_2000852 ) ) ( not ( = ?auto_2000844 ?auto_2000853 ) ) ( not ( = ?auto_2000844 ?auto_2000854 ) ) ( not ( = ?auto_2000844 ?auto_2000855 ) ) ( not ( = ?auto_2000844 ?auto_2000860 ) ) ( not ( = ?auto_2000843 ?auto_2000845 ) ) ( not ( = ?auto_2000843 ?auto_2000846 ) ) ( not ( = ?auto_2000843 ?auto_2000847 ) ) ( not ( = ?auto_2000843 ?auto_2000848 ) ) ( not ( = ?auto_2000843 ?auto_2000849 ) ) ( not ( = ?auto_2000843 ?auto_2000850 ) ) ( not ( = ?auto_2000843 ?auto_2000851 ) ) ( not ( = ?auto_2000843 ?auto_2000852 ) ) ( not ( = ?auto_2000843 ?auto_2000853 ) ) ( not ( = ?auto_2000843 ?auto_2000854 ) ) ( not ( = ?auto_2000843 ?auto_2000855 ) ) ( not ( = ?auto_2000843 ?auto_2000860 ) ) ( not ( = ?auto_2000845 ?auto_2000846 ) ) ( not ( = ?auto_2000845 ?auto_2000847 ) ) ( not ( = ?auto_2000845 ?auto_2000848 ) ) ( not ( = ?auto_2000845 ?auto_2000849 ) ) ( not ( = ?auto_2000845 ?auto_2000850 ) ) ( not ( = ?auto_2000845 ?auto_2000851 ) ) ( not ( = ?auto_2000845 ?auto_2000852 ) ) ( not ( = ?auto_2000845 ?auto_2000853 ) ) ( not ( = ?auto_2000845 ?auto_2000854 ) ) ( not ( = ?auto_2000845 ?auto_2000855 ) ) ( not ( = ?auto_2000845 ?auto_2000860 ) ) ( not ( = ?auto_2000846 ?auto_2000847 ) ) ( not ( = ?auto_2000846 ?auto_2000848 ) ) ( not ( = ?auto_2000846 ?auto_2000849 ) ) ( not ( = ?auto_2000846 ?auto_2000850 ) ) ( not ( = ?auto_2000846 ?auto_2000851 ) ) ( not ( = ?auto_2000846 ?auto_2000852 ) ) ( not ( = ?auto_2000846 ?auto_2000853 ) ) ( not ( = ?auto_2000846 ?auto_2000854 ) ) ( not ( = ?auto_2000846 ?auto_2000855 ) ) ( not ( = ?auto_2000846 ?auto_2000860 ) ) ( not ( = ?auto_2000847 ?auto_2000848 ) ) ( not ( = ?auto_2000847 ?auto_2000849 ) ) ( not ( = ?auto_2000847 ?auto_2000850 ) ) ( not ( = ?auto_2000847 ?auto_2000851 ) ) ( not ( = ?auto_2000847 ?auto_2000852 ) ) ( not ( = ?auto_2000847 ?auto_2000853 ) ) ( not ( = ?auto_2000847 ?auto_2000854 ) ) ( not ( = ?auto_2000847 ?auto_2000855 ) ) ( not ( = ?auto_2000847 ?auto_2000860 ) ) ( not ( = ?auto_2000848 ?auto_2000849 ) ) ( not ( = ?auto_2000848 ?auto_2000850 ) ) ( not ( = ?auto_2000848 ?auto_2000851 ) ) ( not ( = ?auto_2000848 ?auto_2000852 ) ) ( not ( = ?auto_2000848 ?auto_2000853 ) ) ( not ( = ?auto_2000848 ?auto_2000854 ) ) ( not ( = ?auto_2000848 ?auto_2000855 ) ) ( not ( = ?auto_2000848 ?auto_2000860 ) ) ( not ( = ?auto_2000849 ?auto_2000850 ) ) ( not ( = ?auto_2000849 ?auto_2000851 ) ) ( not ( = ?auto_2000849 ?auto_2000852 ) ) ( not ( = ?auto_2000849 ?auto_2000853 ) ) ( not ( = ?auto_2000849 ?auto_2000854 ) ) ( not ( = ?auto_2000849 ?auto_2000855 ) ) ( not ( = ?auto_2000849 ?auto_2000860 ) ) ( not ( = ?auto_2000850 ?auto_2000851 ) ) ( not ( = ?auto_2000850 ?auto_2000852 ) ) ( not ( = ?auto_2000850 ?auto_2000853 ) ) ( not ( = ?auto_2000850 ?auto_2000854 ) ) ( not ( = ?auto_2000850 ?auto_2000855 ) ) ( not ( = ?auto_2000850 ?auto_2000860 ) ) ( not ( = ?auto_2000851 ?auto_2000852 ) ) ( not ( = ?auto_2000851 ?auto_2000853 ) ) ( not ( = ?auto_2000851 ?auto_2000854 ) ) ( not ( = ?auto_2000851 ?auto_2000855 ) ) ( not ( = ?auto_2000851 ?auto_2000860 ) ) ( not ( = ?auto_2000852 ?auto_2000853 ) ) ( not ( = ?auto_2000852 ?auto_2000854 ) ) ( not ( = ?auto_2000852 ?auto_2000855 ) ) ( not ( = ?auto_2000852 ?auto_2000860 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2000853 ?auto_2000854 ?auto_2000855 )
      ( MAKE-15CRATE-VERIFY ?auto_2000840 ?auto_2000841 ?auto_2000842 ?auto_2000844 ?auto_2000843 ?auto_2000845 ?auto_2000846 ?auto_2000847 ?auto_2000848 ?auto_2000849 ?auto_2000850 ?auto_2000851 ?auto_2000852 ?auto_2000853 ?auto_2000854 ?auto_2000855 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2001066 - SURFACE
      ?auto_2001067 - SURFACE
      ?auto_2001068 - SURFACE
      ?auto_2001070 - SURFACE
      ?auto_2001069 - SURFACE
      ?auto_2001071 - SURFACE
      ?auto_2001072 - SURFACE
      ?auto_2001073 - SURFACE
      ?auto_2001074 - SURFACE
      ?auto_2001075 - SURFACE
      ?auto_2001076 - SURFACE
      ?auto_2001077 - SURFACE
      ?auto_2001078 - SURFACE
      ?auto_2001079 - SURFACE
      ?auto_2001080 - SURFACE
      ?auto_2001081 - SURFACE
    )
    :vars
    (
      ?auto_2001087 - HOIST
      ?auto_2001086 - PLACE
      ?auto_2001085 - PLACE
      ?auto_2001084 - HOIST
      ?auto_2001082 - SURFACE
      ?auto_2001083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001087 ?auto_2001086 ) ( IS-CRATE ?auto_2001081 ) ( not ( = ?auto_2001080 ?auto_2001081 ) ) ( not ( = ?auto_2001079 ?auto_2001080 ) ) ( not ( = ?auto_2001079 ?auto_2001081 ) ) ( not ( = ?auto_2001085 ?auto_2001086 ) ) ( HOIST-AT ?auto_2001084 ?auto_2001085 ) ( not ( = ?auto_2001087 ?auto_2001084 ) ) ( AVAILABLE ?auto_2001084 ) ( SURFACE-AT ?auto_2001081 ?auto_2001085 ) ( ON ?auto_2001081 ?auto_2001082 ) ( CLEAR ?auto_2001081 ) ( not ( = ?auto_2001080 ?auto_2001082 ) ) ( not ( = ?auto_2001081 ?auto_2001082 ) ) ( not ( = ?auto_2001079 ?auto_2001082 ) ) ( TRUCK-AT ?auto_2001083 ?auto_2001086 ) ( SURFACE-AT ?auto_2001079 ?auto_2001086 ) ( CLEAR ?auto_2001079 ) ( LIFTING ?auto_2001087 ?auto_2001080 ) ( IS-CRATE ?auto_2001080 ) ( ON ?auto_2001067 ?auto_2001066 ) ( ON ?auto_2001068 ?auto_2001067 ) ( ON ?auto_2001070 ?auto_2001068 ) ( ON ?auto_2001069 ?auto_2001070 ) ( ON ?auto_2001071 ?auto_2001069 ) ( ON ?auto_2001072 ?auto_2001071 ) ( ON ?auto_2001073 ?auto_2001072 ) ( ON ?auto_2001074 ?auto_2001073 ) ( ON ?auto_2001075 ?auto_2001074 ) ( ON ?auto_2001076 ?auto_2001075 ) ( ON ?auto_2001077 ?auto_2001076 ) ( ON ?auto_2001078 ?auto_2001077 ) ( ON ?auto_2001079 ?auto_2001078 ) ( not ( = ?auto_2001066 ?auto_2001067 ) ) ( not ( = ?auto_2001066 ?auto_2001068 ) ) ( not ( = ?auto_2001066 ?auto_2001070 ) ) ( not ( = ?auto_2001066 ?auto_2001069 ) ) ( not ( = ?auto_2001066 ?auto_2001071 ) ) ( not ( = ?auto_2001066 ?auto_2001072 ) ) ( not ( = ?auto_2001066 ?auto_2001073 ) ) ( not ( = ?auto_2001066 ?auto_2001074 ) ) ( not ( = ?auto_2001066 ?auto_2001075 ) ) ( not ( = ?auto_2001066 ?auto_2001076 ) ) ( not ( = ?auto_2001066 ?auto_2001077 ) ) ( not ( = ?auto_2001066 ?auto_2001078 ) ) ( not ( = ?auto_2001066 ?auto_2001079 ) ) ( not ( = ?auto_2001066 ?auto_2001080 ) ) ( not ( = ?auto_2001066 ?auto_2001081 ) ) ( not ( = ?auto_2001066 ?auto_2001082 ) ) ( not ( = ?auto_2001067 ?auto_2001068 ) ) ( not ( = ?auto_2001067 ?auto_2001070 ) ) ( not ( = ?auto_2001067 ?auto_2001069 ) ) ( not ( = ?auto_2001067 ?auto_2001071 ) ) ( not ( = ?auto_2001067 ?auto_2001072 ) ) ( not ( = ?auto_2001067 ?auto_2001073 ) ) ( not ( = ?auto_2001067 ?auto_2001074 ) ) ( not ( = ?auto_2001067 ?auto_2001075 ) ) ( not ( = ?auto_2001067 ?auto_2001076 ) ) ( not ( = ?auto_2001067 ?auto_2001077 ) ) ( not ( = ?auto_2001067 ?auto_2001078 ) ) ( not ( = ?auto_2001067 ?auto_2001079 ) ) ( not ( = ?auto_2001067 ?auto_2001080 ) ) ( not ( = ?auto_2001067 ?auto_2001081 ) ) ( not ( = ?auto_2001067 ?auto_2001082 ) ) ( not ( = ?auto_2001068 ?auto_2001070 ) ) ( not ( = ?auto_2001068 ?auto_2001069 ) ) ( not ( = ?auto_2001068 ?auto_2001071 ) ) ( not ( = ?auto_2001068 ?auto_2001072 ) ) ( not ( = ?auto_2001068 ?auto_2001073 ) ) ( not ( = ?auto_2001068 ?auto_2001074 ) ) ( not ( = ?auto_2001068 ?auto_2001075 ) ) ( not ( = ?auto_2001068 ?auto_2001076 ) ) ( not ( = ?auto_2001068 ?auto_2001077 ) ) ( not ( = ?auto_2001068 ?auto_2001078 ) ) ( not ( = ?auto_2001068 ?auto_2001079 ) ) ( not ( = ?auto_2001068 ?auto_2001080 ) ) ( not ( = ?auto_2001068 ?auto_2001081 ) ) ( not ( = ?auto_2001068 ?auto_2001082 ) ) ( not ( = ?auto_2001070 ?auto_2001069 ) ) ( not ( = ?auto_2001070 ?auto_2001071 ) ) ( not ( = ?auto_2001070 ?auto_2001072 ) ) ( not ( = ?auto_2001070 ?auto_2001073 ) ) ( not ( = ?auto_2001070 ?auto_2001074 ) ) ( not ( = ?auto_2001070 ?auto_2001075 ) ) ( not ( = ?auto_2001070 ?auto_2001076 ) ) ( not ( = ?auto_2001070 ?auto_2001077 ) ) ( not ( = ?auto_2001070 ?auto_2001078 ) ) ( not ( = ?auto_2001070 ?auto_2001079 ) ) ( not ( = ?auto_2001070 ?auto_2001080 ) ) ( not ( = ?auto_2001070 ?auto_2001081 ) ) ( not ( = ?auto_2001070 ?auto_2001082 ) ) ( not ( = ?auto_2001069 ?auto_2001071 ) ) ( not ( = ?auto_2001069 ?auto_2001072 ) ) ( not ( = ?auto_2001069 ?auto_2001073 ) ) ( not ( = ?auto_2001069 ?auto_2001074 ) ) ( not ( = ?auto_2001069 ?auto_2001075 ) ) ( not ( = ?auto_2001069 ?auto_2001076 ) ) ( not ( = ?auto_2001069 ?auto_2001077 ) ) ( not ( = ?auto_2001069 ?auto_2001078 ) ) ( not ( = ?auto_2001069 ?auto_2001079 ) ) ( not ( = ?auto_2001069 ?auto_2001080 ) ) ( not ( = ?auto_2001069 ?auto_2001081 ) ) ( not ( = ?auto_2001069 ?auto_2001082 ) ) ( not ( = ?auto_2001071 ?auto_2001072 ) ) ( not ( = ?auto_2001071 ?auto_2001073 ) ) ( not ( = ?auto_2001071 ?auto_2001074 ) ) ( not ( = ?auto_2001071 ?auto_2001075 ) ) ( not ( = ?auto_2001071 ?auto_2001076 ) ) ( not ( = ?auto_2001071 ?auto_2001077 ) ) ( not ( = ?auto_2001071 ?auto_2001078 ) ) ( not ( = ?auto_2001071 ?auto_2001079 ) ) ( not ( = ?auto_2001071 ?auto_2001080 ) ) ( not ( = ?auto_2001071 ?auto_2001081 ) ) ( not ( = ?auto_2001071 ?auto_2001082 ) ) ( not ( = ?auto_2001072 ?auto_2001073 ) ) ( not ( = ?auto_2001072 ?auto_2001074 ) ) ( not ( = ?auto_2001072 ?auto_2001075 ) ) ( not ( = ?auto_2001072 ?auto_2001076 ) ) ( not ( = ?auto_2001072 ?auto_2001077 ) ) ( not ( = ?auto_2001072 ?auto_2001078 ) ) ( not ( = ?auto_2001072 ?auto_2001079 ) ) ( not ( = ?auto_2001072 ?auto_2001080 ) ) ( not ( = ?auto_2001072 ?auto_2001081 ) ) ( not ( = ?auto_2001072 ?auto_2001082 ) ) ( not ( = ?auto_2001073 ?auto_2001074 ) ) ( not ( = ?auto_2001073 ?auto_2001075 ) ) ( not ( = ?auto_2001073 ?auto_2001076 ) ) ( not ( = ?auto_2001073 ?auto_2001077 ) ) ( not ( = ?auto_2001073 ?auto_2001078 ) ) ( not ( = ?auto_2001073 ?auto_2001079 ) ) ( not ( = ?auto_2001073 ?auto_2001080 ) ) ( not ( = ?auto_2001073 ?auto_2001081 ) ) ( not ( = ?auto_2001073 ?auto_2001082 ) ) ( not ( = ?auto_2001074 ?auto_2001075 ) ) ( not ( = ?auto_2001074 ?auto_2001076 ) ) ( not ( = ?auto_2001074 ?auto_2001077 ) ) ( not ( = ?auto_2001074 ?auto_2001078 ) ) ( not ( = ?auto_2001074 ?auto_2001079 ) ) ( not ( = ?auto_2001074 ?auto_2001080 ) ) ( not ( = ?auto_2001074 ?auto_2001081 ) ) ( not ( = ?auto_2001074 ?auto_2001082 ) ) ( not ( = ?auto_2001075 ?auto_2001076 ) ) ( not ( = ?auto_2001075 ?auto_2001077 ) ) ( not ( = ?auto_2001075 ?auto_2001078 ) ) ( not ( = ?auto_2001075 ?auto_2001079 ) ) ( not ( = ?auto_2001075 ?auto_2001080 ) ) ( not ( = ?auto_2001075 ?auto_2001081 ) ) ( not ( = ?auto_2001075 ?auto_2001082 ) ) ( not ( = ?auto_2001076 ?auto_2001077 ) ) ( not ( = ?auto_2001076 ?auto_2001078 ) ) ( not ( = ?auto_2001076 ?auto_2001079 ) ) ( not ( = ?auto_2001076 ?auto_2001080 ) ) ( not ( = ?auto_2001076 ?auto_2001081 ) ) ( not ( = ?auto_2001076 ?auto_2001082 ) ) ( not ( = ?auto_2001077 ?auto_2001078 ) ) ( not ( = ?auto_2001077 ?auto_2001079 ) ) ( not ( = ?auto_2001077 ?auto_2001080 ) ) ( not ( = ?auto_2001077 ?auto_2001081 ) ) ( not ( = ?auto_2001077 ?auto_2001082 ) ) ( not ( = ?auto_2001078 ?auto_2001079 ) ) ( not ( = ?auto_2001078 ?auto_2001080 ) ) ( not ( = ?auto_2001078 ?auto_2001081 ) ) ( not ( = ?auto_2001078 ?auto_2001082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001079 ?auto_2001080 ?auto_2001081 )
      ( MAKE-15CRATE-VERIFY ?auto_2001066 ?auto_2001067 ?auto_2001068 ?auto_2001070 ?auto_2001069 ?auto_2001071 ?auto_2001072 ?auto_2001073 ?auto_2001074 ?auto_2001075 ?auto_2001076 ?auto_2001077 ?auto_2001078 ?auto_2001079 ?auto_2001080 ?auto_2001081 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2001292 - SURFACE
      ?auto_2001293 - SURFACE
      ?auto_2001294 - SURFACE
      ?auto_2001296 - SURFACE
      ?auto_2001295 - SURFACE
      ?auto_2001297 - SURFACE
      ?auto_2001298 - SURFACE
      ?auto_2001299 - SURFACE
      ?auto_2001300 - SURFACE
      ?auto_2001301 - SURFACE
      ?auto_2001302 - SURFACE
      ?auto_2001303 - SURFACE
      ?auto_2001304 - SURFACE
      ?auto_2001305 - SURFACE
      ?auto_2001306 - SURFACE
      ?auto_2001307 - SURFACE
    )
    :vars
    (
      ?auto_2001313 - HOIST
      ?auto_2001310 - PLACE
      ?auto_2001308 - PLACE
      ?auto_2001312 - HOIST
      ?auto_2001311 - SURFACE
      ?auto_2001309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001313 ?auto_2001310 ) ( IS-CRATE ?auto_2001307 ) ( not ( = ?auto_2001306 ?auto_2001307 ) ) ( not ( = ?auto_2001305 ?auto_2001306 ) ) ( not ( = ?auto_2001305 ?auto_2001307 ) ) ( not ( = ?auto_2001308 ?auto_2001310 ) ) ( HOIST-AT ?auto_2001312 ?auto_2001308 ) ( not ( = ?auto_2001313 ?auto_2001312 ) ) ( AVAILABLE ?auto_2001312 ) ( SURFACE-AT ?auto_2001307 ?auto_2001308 ) ( ON ?auto_2001307 ?auto_2001311 ) ( CLEAR ?auto_2001307 ) ( not ( = ?auto_2001306 ?auto_2001311 ) ) ( not ( = ?auto_2001307 ?auto_2001311 ) ) ( not ( = ?auto_2001305 ?auto_2001311 ) ) ( TRUCK-AT ?auto_2001309 ?auto_2001310 ) ( SURFACE-AT ?auto_2001305 ?auto_2001310 ) ( CLEAR ?auto_2001305 ) ( IS-CRATE ?auto_2001306 ) ( AVAILABLE ?auto_2001313 ) ( IN ?auto_2001306 ?auto_2001309 ) ( ON ?auto_2001293 ?auto_2001292 ) ( ON ?auto_2001294 ?auto_2001293 ) ( ON ?auto_2001296 ?auto_2001294 ) ( ON ?auto_2001295 ?auto_2001296 ) ( ON ?auto_2001297 ?auto_2001295 ) ( ON ?auto_2001298 ?auto_2001297 ) ( ON ?auto_2001299 ?auto_2001298 ) ( ON ?auto_2001300 ?auto_2001299 ) ( ON ?auto_2001301 ?auto_2001300 ) ( ON ?auto_2001302 ?auto_2001301 ) ( ON ?auto_2001303 ?auto_2001302 ) ( ON ?auto_2001304 ?auto_2001303 ) ( ON ?auto_2001305 ?auto_2001304 ) ( not ( = ?auto_2001292 ?auto_2001293 ) ) ( not ( = ?auto_2001292 ?auto_2001294 ) ) ( not ( = ?auto_2001292 ?auto_2001296 ) ) ( not ( = ?auto_2001292 ?auto_2001295 ) ) ( not ( = ?auto_2001292 ?auto_2001297 ) ) ( not ( = ?auto_2001292 ?auto_2001298 ) ) ( not ( = ?auto_2001292 ?auto_2001299 ) ) ( not ( = ?auto_2001292 ?auto_2001300 ) ) ( not ( = ?auto_2001292 ?auto_2001301 ) ) ( not ( = ?auto_2001292 ?auto_2001302 ) ) ( not ( = ?auto_2001292 ?auto_2001303 ) ) ( not ( = ?auto_2001292 ?auto_2001304 ) ) ( not ( = ?auto_2001292 ?auto_2001305 ) ) ( not ( = ?auto_2001292 ?auto_2001306 ) ) ( not ( = ?auto_2001292 ?auto_2001307 ) ) ( not ( = ?auto_2001292 ?auto_2001311 ) ) ( not ( = ?auto_2001293 ?auto_2001294 ) ) ( not ( = ?auto_2001293 ?auto_2001296 ) ) ( not ( = ?auto_2001293 ?auto_2001295 ) ) ( not ( = ?auto_2001293 ?auto_2001297 ) ) ( not ( = ?auto_2001293 ?auto_2001298 ) ) ( not ( = ?auto_2001293 ?auto_2001299 ) ) ( not ( = ?auto_2001293 ?auto_2001300 ) ) ( not ( = ?auto_2001293 ?auto_2001301 ) ) ( not ( = ?auto_2001293 ?auto_2001302 ) ) ( not ( = ?auto_2001293 ?auto_2001303 ) ) ( not ( = ?auto_2001293 ?auto_2001304 ) ) ( not ( = ?auto_2001293 ?auto_2001305 ) ) ( not ( = ?auto_2001293 ?auto_2001306 ) ) ( not ( = ?auto_2001293 ?auto_2001307 ) ) ( not ( = ?auto_2001293 ?auto_2001311 ) ) ( not ( = ?auto_2001294 ?auto_2001296 ) ) ( not ( = ?auto_2001294 ?auto_2001295 ) ) ( not ( = ?auto_2001294 ?auto_2001297 ) ) ( not ( = ?auto_2001294 ?auto_2001298 ) ) ( not ( = ?auto_2001294 ?auto_2001299 ) ) ( not ( = ?auto_2001294 ?auto_2001300 ) ) ( not ( = ?auto_2001294 ?auto_2001301 ) ) ( not ( = ?auto_2001294 ?auto_2001302 ) ) ( not ( = ?auto_2001294 ?auto_2001303 ) ) ( not ( = ?auto_2001294 ?auto_2001304 ) ) ( not ( = ?auto_2001294 ?auto_2001305 ) ) ( not ( = ?auto_2001294 ?auto_2001306 ) ) ( not ( = ?auto_2001294 ?auto_2001307 ) ) ( not ( = ?auto_2001294 ?auto_2001311 ) ) ( not ( = ?auto_2001296 ?auto_2001295 ) ) ( not ( = ?auto_2001296 ?auto_2001297 ) ) ( not ( = ?auto_2001296 ?auto_2001298 ) ) ( not ( = ?auto_2001296 ?auto_2001299 ) ) ( not ( = ?auto_2001296 ?auto_2001300 ) ) ( not ( = ?auto_2001296 ?auto_2001301 ) ) ( not ( = ?auto_2001296 ?auto_2001302 ) ) ( not ( = ?auto_2001296 ?auto_2001303 ) ) ( not ( = ?auto_2001296 ?auto_2001304 ) ) ( not ( = ?auto_2001296 ?auto_2001305 ) ) ( not ( = ?auto_2001296 ?auto_2001306 ) ) ( not ( = ?auto_2001296 ?auto_2001307 ) ) ( not ( = ?auto_2001296 ?auto_2001311 ) ) ( not ( = ?auto_2001295 ?auto_2001297 ) ) ( not ( = ?auto_2001295 ?auto_2001298 ) ) ( not ( = ?auto_2001295 ?auto_2001299 ) ) ( not ( = ?auto_2001295 ?auto_2001300 ) ) ( not ( = ?auto_2001295 ?auto_2001301 ) ) ( not ( = ?auto_2001295 ?auto_2001302 ) ) ( not ( = ?auto_2001295 ?auto_2001303 ) ) ( not ( = ?auto_2001295 ?auto_2001304 ) ) ( not ( = ?auto_2001295 ?auto_2001305 ) ) ( not ( = ?auto_2001295 ?auto_2001306 ) ) ( not ( = ?auto_2001295 ?auto_2001307 ) ) ( not ( = ?auto_2001295 ?auto_2001311 ) ) ( not ( = ?auto_2001297 ?auto_2001298 ) ) ( not ( = ?auto_2001297 ?auto_2001299 ) ) ( not ( = ?auto_2001297 ?auto_2001300 ) ) ( not ( = ?auto_2001297 ?auto_2001301 ) ) ( not ( = ?auto_2001297 ?auto_2001302 ) ) ( not ( = ?auto_2001297 ?auto_2001303 ) ) ( not ( = ?auto_2001297 ?auto_2001304 ) ) ( not ( = ?auto_2001297 ?auto_2001305 ) ) ( not ( = ?auto_2001297 ?auto_2001306 ) ) ( not ( = ?auto_2001297 ?auto_2001307 ) ) ( not ( = ?auto_2001297 ?auto_2001311 ) ) ( not ( = ?auto_2001298 ?auto_2001299 ) ) ( not ( = ?auto_2001298 ?auto_2001300 ) ) ( not ( = ?auto_2001298 ?auto_2001301 ) ) ( not ( = ?auto_2001298 ?auto_2001302 ) ) ( not ( = ?auto_2001298 ?auto_2001303 ) ) ( not ( = ?auto_2001298 ?auto_2001304 ) ) ( not ( = ?auto_2001298 ?auto_2001305 ) ) ( not ( = ?auto_2001298 ?auto_2001306 ) ) ( not ( = ?auto_2001298 ?auto_2001307 ) ) ( not ( = ?auto_2001298 ?auto_2001311 ) ) ( not ( = ?auto_2001299 ?auto_2001300 ) ) ( not ( = ?auto_2001299 ?auto_2001301 ) ) ( not ( = ?auto_2001299 ?auto_2001302 ) ) ( not ( = ?auto_2001299 ?auto_2001303 ) ) ( not ( = ?auto_2001299 ?auto_2001304 ) ) ( not ( = ?auto_2001299 ?auto_2001305 ) ) ( not ( = ?auto_2001299 ?auto_2001306 ) ) ( not ( = ?auto_2001299 ?auto_2001307 ) ) ( not ( = ?auto_2001299 ?auto_2001311 ) ) ( not ( = ?auto_2001300 ?auto_2001301 ) ) ( not ( = ?auto_2001300 ?auto_2001302 ) ) ( not ( = ?auto_2001300 ?auto_2001303 ) ) ( not ( = ?auto_2001300 ?auto_2001304 ) ) ( not ( = ?auto_2001300 ?auto_2001305 ) ) ( not ( = ?auto_2001300 ?auto_2001306 ) ) ( not ( = ?auto_2001300 ?auto_2001307 ) ) ( not ( = ?auto_2001300 ?auto_2001311 ) ) ( not ( = ?auto_2001301 ?auto_2001302 ) ) ( not ( = ?auto_2001301 ?auto_2001303 ) ) ( not ( = ?auto_2001301 ?auto_2001304 ) ) ( not ( = ?auto_2001301 ?auto_2001305 ) ) ( not ( = ?auto_2001301 ?auto_2001306 ) ) ( not ( = ?auto_2001301 ?auto_2001307 ) ) ( not ( = ?auto_2001301 ?auto_2001311 ) ) ( not ( = ?auto_2001302 ?auto_2001303 ) ) ( not ( = ?auto_2001302 ?auto_2001304 ) ) ( not ( = ?auto_2001302 ?auto_2001305 ) ) ( not ( = ?auto_2001302 ?auto_2001306 ) ) ( not ( = ?auto_2001302 ?auto_2001307 ) ) ( not ( = ?auto_2001302 ?auto_2001311 ) ) ( not ( = ?auto_2001303 ?auto_2001304 ) ) ( not ( = ?auto_2001303 ?auto_2001305 ) ) ( not ( = ?auto_2001303 ?auto_2001306 ) ) ( not ( = ?auto_2001303 ?auto_2001307 ) ) ( not ( = ?auto_2001303 ?auto_2001311 ) ) ( not ( = ?auto_2001304 ?auto_2001305 ) ) ( not ( = ?auto_2001304 ?auto_2001306 ) ) ( not ( = ?auto_2001304 ?auto_2001307 ) ) ( not ( = ?auto_2001304 ?auto_2001311 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001305 ?auto_2001306 ?auto_2001307 )
      ( MAKE-15CRATE-VERIFY ?auto_2001292 ?auto_2001293 ?auto_2001294 ?auto_2001296 ?auto_2001295 ?auto_2001297 ?auto_2001298 ?auto_2001299 ?auto_2001300 ?auto_2001301 ?auto_2001302 ?auto_2001303 ?auto_2001304 ?auto_2001305 ?auto_2001306 ?auto_2001307 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2001314 - SURFACE
      ?auto_2001315 - SURFACE
    )
    :vars
    (
      ?auto_2001322 - HOIST
      ?auto_2001319 - PLACE
      ?auto_2001316 - SURFACE
      ?auto_2001317 - PLACE
      ?auto_2001321 - HOIST
      ?auto_2001320 - SURFACE
      ?auto_2001318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001322 ?auto_2001319 ) ( IS-CRATE ?auto_2001315 ) ( not ( = ?auto_2001314 ?auto_2001315 ) ) ( not ( = ?auto_2001316 ?auto_2001314 ) ) ( not ( = ?auto_2001316 ?auto_2001315 ) ) ( not ( = ?auto_2001317 ?auto_2001319 ) ) ( HOIST-AT ?auto_2001321 ?auto_2001317 ) ( not ( = ?auto_2001322 ?auto_2001321 ) ) ( AVAILABLE ?auto_2001321 ) ( SURFACE-AT ?auto_2001315 ?auto_2001317 ) ( ON ?auto_2001315 ?auto_2001320 ) ( CLEAR ?auto_2001315 ) ( not ( = ?auto_2001314 ?auto_2001320 ) ) ( not ( = ?auto_2001315 ?auto_2001320 ) ) ( not ( = ?auto_2001316 ?auto_2001320 ) ) ( SURFACE-AT ?auto_2001316 ?auto_2001319 ) ( CLEAR ?auto_2001316 ) ( IS-CRATE ?auto_2001314 ) ( AVAILABLE ?auto_2001322 ) ( IN ?auto_2001314 ?auto_2001318 ) ( TRUCK-AT ?auto_2001318 ?auto_2001317 ) )
    :subtasks
    ( ( !DRIVE ?auto_2001318 ?auto_2001317 ?auto_2001319 )
      ( MAKE-2CRATE ?auto_2001316 ?auto_2001314 ?auto_2001315 )
      ( MAKE-1CRATE-VERIFY ?auto_2001314 ?auto_2001315 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2001323 - SURFACE
      ?auto_2001324 - SURFACE
      ?auto_2001325 - SURFACE
    )
    :vars
    (
      ?auto_2001326 - HOIST
      ?auto_2001327 - PLACE
      ?auto_2001331 - PLACE
      ?auto_2001329 - HOIST
      ?auto_2001330 - SURFACE
      ?auto_2001328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001326 ?auto_2001327 ) ( IS-CRATE ?auto_2001325 ) ( not ( = ?auto_2001324 ?auto_2001325 ) ) ( not ( = ?auto_2001323 ?auto_2001324 ) ) ( not ( = ?auto_2001323 ?auto_2001325 ) ) ( not ( = ?auto_2001331 ?auto_2001327 ) ) ( HOIST-AT ?auto_2001329 ?auto_2001331 ) ( not ( = ?auto_2001326 ?auto_2001329 ) ) ( AVAILABLE ?auto_2001329 ) ( SURFACE-AT ?auto_2001325 ?auto_2001331 ) ( ON ?auto_2001325 ?auto_2001330 ) ( CLEAR ?auto_2001325 ) ( not ( = ?auto_2001324 ?auto_2001330 ) ) ( not ( = ?auto_2001325 ?auto_2001330 ) ) ( not ( = ?auto_2001323 ?auto_2001330 ) ) ( SURFACE-AT ?auto_2001323 ?auto_2001327 ) ( CLEAR ?auto_2001323 ) ( IS-CRATE ?auto_2001324 ) ( AVAILABLE ?auto_2001326 ) ( IN ?auto_2001324 ?auto_2001328 ) ( TRUCK-AT ?auto_2001328 ?auto_2001331 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2001324 ?auto_2001325 )
      ( MAKE-2CRATE-VERIFY ?auto_2001323 ?auto_2001324 ?auto_2001325 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2001332 - SURFACE
      ?auto_2001333 - SURFACE
      ?auto_2001334 - SURFACE
      ?auto_2001335 - SURFACE
    )
    :vars
    (
      ?auto_2001337 - HOIST
      ?auto_2001341 - PLACE
      ?auto_2001340 - PLACE
      ?auto_2001338 - HOIST
      ?auto_2001339 - SURFACE
      ?auto_2001336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001337 ?auto_2001341 ) ( IS-CRATE ?auto_2001335 ) ( not ( = ?auto_2001334 ?auto_2001335 ) ) ( not ( = ?auto_2001333 ?auto_2001334 ) ) ( not ( = ?auto_2001333 ?auto_2001335 ) ) ( not ( = ?auto_2001340 ?auto_2001341 ) ) ( HOIST-AT ?auto_2001338 ?auto_2001340 ) ( not ( = ?auto_2001337 ?auto_2001338 ) ) ( AVAILABLE ?auto_2001338 ) ( SURFACE-AT ?auto_2001335 ?auto_2001340 ) ( ON ?auto_2001335 ?auto_2001339 ) ( CLEAR ?auto_2001335 ) ( not ( = ?auto_2001334 ?auto_2001339 ) ) ( not ( = ?auto_2001335 ?auto_2001339 ) ) ( not ( = ?auto_2001333 ?auto_2001339 ) ) ( SURFACE-AT ?auto_2001333 ?auto_2001341 ) ( CLEAR ?auto_2001333 ) ( IS-CRATE ?auto_2001334 ) ( AVAILABLE ?auto_2001337 ) ( IN ?auto_2001334 ?auto_2001336 ) ( TRUCK-AT ?auto_2001336 ?auto_2001340 ) ( ON ?auto_2001333 ?auto_2001332 ) ( not ( = ?auto_2001332 ?auto_2001333 ) ) ( not ( = ?auto_2001332 ?auto_2001334 ) ) ( not ( = ?auto_2001332 ?auto_2001335 ) ) ( not ( = ?auto_2001332 ?auto_2001339 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001333 ?auto_2001334 ?auto_2001335 )
      ( MAKE-3CRATE-VERIFY ?auto_2001332 ?auto_2001333 ?auto_2001334 ?auto_2001335 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2001342 - SURFACE
      ?auto_2001343 - SURFACE
      ?auto_2001344 - SURFACE
      ?auto_2001346 - SURFACE
      ?auto_2001345 - SURFACE
    )
    :vars
    (
      ?auto_2001348 - HOIST
      ?auto_2001352 - PLACE
      ?auto_2001351 - PLACE
      ?auto_2001349 - HOIST
      ?auto_2001350 - SURFACE
      ?auto_2001347 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001348 ?auto_2001352 ) ( IS-CRATE ?auto_2001345 ) ( not ( = ?auto_2001346 ?auto_2001345 ) ) ( not ( = ?auto_2001344 ?auto_2001346 ) ) ( not ( = ?auto_2001344 ?auto_2001345 ) ) ( not ( = ?auto_2001351 ?auto_2001352 ) ) ( HOIST-AT ?auto_2001349 ?auto_2001351 ) ( not ( = ?auto_2001348 ?auto_2001349 ) ) ( AVAILABLE ?auto_2001349 ) ( SURFACE-AT ?auto_2001345 ?auto_2001351 ) ( ON ?auto_2001345 ?auto_2001350 ) ( CLEAR ?auto_2001345 ) ( not ( = ?auto_2001346 ?auto_2001350 ) ) ( not ( = ?auto_2001345 ?auto_2001350 ) ) ( not ( = ?auto_2001344 ?auto_2001350 ) ) ( SURFACE-AT ?auto_2001344 ?auto_2001352 ) ( CLEAR ?auto_2001344 ) ( IS-CRATE ?auto_2001346 ) ( AVAILABLE ?auto_2001348 ) ( IN ?auto_2001346 ?auto_2001347 ) ( TRUCK-AT ?auto_2001347 ?auto_2001351 ) ( ON ?auto_2001343 ?auto_2001342 ) ( ON ?auto_2001344 ?auto_2001343 ) ( not ( = ?auto_2001342 ?auto_2001343 ) ) ( not ( = ?auto_2001342 ?auto_2001344 ) ) ( not ( = ?auto_2001342 ?auto_2001346 ) ) ( not ( = ?auto_2001342 ?auto_2001345 ) ) ( not ( = ?auto_2001342 ?auto_2001350 ) ) ( not ( = ?auto_2001343 ?auto_2001344 ) ) ( not ( = ?auto_2001343 ?auto_2001346 ) ) ( not ( = ?auto_2001343 ?auto_2001345 ) ) ( not ( = ?auto_2001343 ?auto_2001350 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001344 ?auto_2001346 ?auto_2001345 )
      ( MAKE-4CRATE-VERIFY ?auto_2001342 ?auto_2001343 ?auto_2001344 ?auto_2001346 ?auto_2001345 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2001353 - SURFACE
      ?auto_2001354 - SURFACE
      ?auto_2001355 - SURFACE
      ?auto_2001357 - SURFACE
      ?auto_2001356 - SURFACE
      ?auto_2001358 - SURFACE
    )
    :vars
    (
      ?auto_2001360 - HOIST
      ?auto_2001364 - PLACE
      ?auto_2001363 - PLACE
      ?auto_2001361 - HOIST
      ?auto_2001362 - SURFACE
      ?auto_2001359 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001360 ?auto_2001364 ) ( IS-CRATE ?auto_2001358 ) ( not ( = ?auto_2001356 ?auto_2001358 ) ) ( not ( = ?auto_2001357 ?auto_2001356 ) ) ( not ( = ?auto_2001357 ?auto_2001358 ) ) ( not ( = ?auto_2001363 ?auto_2001364 ) ) ( HOIST-AT ?auto_2001361 ?auto_2001363 ) ( not ( = ?auto_2001360 ?auto_2001361 ) ) ( AVAILABLE ?auto_2001361 ) ( SURFACE-AT ?auto_2001358 ?auto_2001363 ) ( ON ?auto_2001358 ?auto_2001362 ) ( CLEAR ?auto_2001358 ) ( not ( = ?auto_2001356 ?auto_2001362 ) ) ( not ( = ?auto_2001358 ?auto_2001362 ) ) ( not ( = ?auto_2001357 ?auto_2001362 ) ) ( SURFACE-AT ?auto_2001357 ?auto_2001364 ) ( CLEAR ?auto_2001357 ) ( IS-CRATE ?auto_2001356 ) ( AVAILABLE ?auto_2001360 ) ( IN ?auto_2001356 ?auto_2001359 ) ( TRUCK-AT ?auto_2001359 ?auto_2001363 ) ( ON ?auto_2001354 ?auto_2001353 ) ( ON ?auto_2001355 ?auto_2001354 ) ( ON ?auto_2001357 ?auto_2001355 ) ( not ( = ?auto_2001353 ?auto_2001354 ) ) ( not ( = ?auto_2001353 ?auto_2001355 ) ) ( not ( = ?auto_2001353 ?auto_2001357 ) ) ( not ( = ?auto_2001353 ?auto_2001356 ) ) ( not ( = ?auto_2001353 ?auto_2001358 ) ) ( not ( = ?auto_2001353 ?auto_2001362 ) ) ( not ( = ?auto_2001354 ?auto_2001355 ) ) ( not ( = ?auto_2001354 ?auto_2001357 ) ) ( not ( = ?auto_2001354 ?auto_2001356 ) ) ( not ( = ?auto_2001354 ?auto_2001358 ) ) ( not ( = ?auto_2001354 ?auto_2001362 ) ) ( not ( = ?auto_2001355 ?auto_2001357 ) ) ( not ( = ?auto_2001355 ?auto_2001356 ) ) ( not ( = ?auto_2001355 ?auto_2001358 ) ) ( not ( = ?auto_2001355 ?auto_2001362 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001357 ?auto_2001356 ?auto_2001358 )
      ( MAKE-5CRATE-VERIFY ?auto_2001353 ?auto_2001354 ?auto_2001355 ?auto_2001357 ?auto_2001356 ?auto_2001358 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2001365 - SURFACE
      ?auto_2001366 - SURFACE
      ?auto_2001367 - SURFACE
      ?auto_2001369 - SURFACE
      ?auto_2001368 - SURFACE
      ?auto_2001370 - SURFACE
      ?auto_2001371 - SURFACE
    )
    :vars
    (
      ?auto_2001373 - HOIST
      ?auto_2001377 - PLACE
      ?auto_2001376 - PLACE
      ?auto_2001374 - HOIST
      ?auto_2001375 - SURFACE
      ?auto_2001372 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001373 ?auto_2001377 ) ( IS-CRATE ?auto_2001371 ) ( not ( = ?auto_2001370 ?auto_2001371 ) ) ( not ( = ?auto_2001368 ?auto_2001370 ) ) ( not ( = ?auto_2001368 ?auto_2001371 ) ) ( not ( = ?auto_2001376 ?auto_2001377 ) ) ( HOIST-AT ?auto_2001374 ?auto_2001376 ) ( not ( = ?auto_2001373 ?auto_2001374 ) ) ( AVAILABLE ?auto_2001374 ) ( SURFACE-AT ?auto_2001371 ?auto_2001376 ) ( ON ?auto_2001371 ?auto_2001375 ) ( CLEAR ?auto_2001371 ) ( not ( = ?auto_2001370 ?auto_2001375 ) ) ( not ( = ?auto_2001371 ?auto_2001375 ) ) ( not ( = ?auto_2001368 ?auto_2001375 ) ) ( SURFACE-AT ?auto_2001368 ?auto_2001377 ) ( CLEAR ?auto_2001368 ) ( IS-CRATE ?auto_2001370 ) ( AVAILABLE ?auto_2001373 ) ( IN ?auto_2001370 ?auto_2001372 ) ( TRUCK-AT ?auto_2001372 ?auto_2001376 ) ( ON ?auto_2001366 ?auto_2001365 ) ( ON ?auto_2001367 ?auto_2001366 ) ( ON ?auto_2001369 ?auto_2001367 ) ( ON ?auto_2001368 ?auto_2001369 ) ( not ( = ?auto_2001365 ?auto_2001366 ) ) ( not ( = ?auto_2001365 ?auto_2001367 ) ) ( not ( = ?auto_2001365 ?auto_2001369 ) ) ( not ( = ?auto_2001365 ?auto_2001368 ) ) ( not ( = ?auto_2001365 ?auto_2001370 ) ) ( not ( = ?auto_2001365 ?auto_2001371 ) ) ( not ( = ?auto_2001365 ?auto_2001375 ) ) ( not ( = ?auto_2001366 ?auto_2001367 ) ) ( not ( = ?auto_2001366 ?auto_2001369 ) ) ( not ( = ?auto_2001366 ?auto_2001368 ) ) ( not ( = ?auto_2001366 ?auto_2001370 ) ) ( not ( = ?auto_2001366 ?auto_2001371 ) ) ( not ( = ?auto_2001366 ?auto_2001375 ) ) ( not ( = ?auto_2001367 ?auto_2001369 ) ) ( not ( = ?auto_2001367 ?auto_2001368 ) ) ( not ( = ?auto_2001367 ?auto_2001370 ) ) ( not ( = ?auto_2001367 ?auto_2001371 ) ) ( not ( = ?auto_2001367 ?auto_2001375 ) ) ( not ( = ?auto_2001369 ?auto_2001368 ) ) ( not ( = ?auto_2001369 ?auto_2001370 ) ) ( not ( = ?auto_2001369 ?auto_2001371 ) ) ( not ( = ?auto_2001369 ?auto_2001375 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001368 ?auto_2001370 ?auto_2001371 )
      ( MAKE-6CRATE-VERIFY ?auto_2001365 ?auto_2001366 ?auto_2001367 ?auto_2001369 ?auto_2001368 ?auto_2001370 ?auto_2001371 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2001378 - SURFACE
      ?auto_2001379 - SURFACE
      ?auto_2001380 - SURFACE
      ?auto_2001382 - SURFACE
      ?auto_2001381 - SURFACE
      ?auto_2001383 - SURFACE
      ?auto_2001384 - SURFACE
      ?auto_2001385 - SURFACE
    )
    :vars
    (
      ?auto_2001387 - HOIST
      ?auto_2001391 - PLACE
      ?auto_2001390 - PLACE
      ?auto_2001388 - HOIST
      ?auto_2001389 - SURFACE
      ?auto_2001386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001387 ?auto_2001391 ) ( IS-CRATE ?auto_2001385 ) ( not ( = ?auto_2001384 ?auto_2001385 ) ) ( not ( = ?auto_2001383 ?auto_2001384 ) ) ( not ( = ?auto_2001383 ?auto_2001385 ) ) ( not ( = ?auto_2001390 ?auto_2001391 ) ) ( HOIST-AT ?auto_2001388 ?auto_2001390 ) ( not ( = ?auto_2001387 ?auto_2001388 ) ) ( AVAILABLE ?auto_2001388 ) ( SURFACE-AT ?auto_2001385 ?auto_2001390 ) ( ON ?auto_2001385 ?auto_2001389 ) ( CLEAR ?auto_2001385 ) ( not ( = ?auto_2001384 ?auto_2001389 ) ) ( not ( = ?auto_2001385 ?auto_2001389 ) ) ( not ( = ?auto_2001383 ?auto_2001389 ) ) ( SURFACE-AT ?auto_2001383 ?auto_2001391 ) ( CLEAR ?auto_2001383 ) ( IS-CRATE ?auto_2001384 ) ( AVAILABLE ?auto_2001387 ) ( IN ?auto_2001384 ?auto_2001386 ) ( TRUCK-AT ?auto_2001386 ?auto_2001390 ) ( ON ?auto_2001379 ?auto_2001378 ) ( ON ?auto_2001380 ?auto_2001379 ) ( ON ?auto_2001382 ?auto_2001380 ) ( ON ?auto_2001381 ?auto_2001382 ) ( ON ?auto_2001383 ?auto_2001381 ) ( not ( = ?auto_2001378 ?auto_2001379 ) ) ( not ( = ?auto_2001378 ?auto_2001380 ) ) ( not ( = ?auto_2001378 ?auto_2001382 ) ) ( not ( = ?auto_2001378 ?auto_2001381 ) ) ( not ( = ?auto_2001378 ?auto_2001383 ) ) ( not ( = ?auto_2001378 ?auto_2001384 ) ) ( not ( = ?auto_2001378 ?auto_2001385 ) ) ( not ( = ?auto_2001378 ?auto_2001389 ) ) ( not ( = ?auto_2001379 ?auto_2001380 ) ) ( not ( = ?auto_2001379 ?auto_2001382 ) ) ( not ( = ?auto_2001379 ?auto_2001381 ) ) ( not ( = ?auto_2001379 ?auto_2001383 ) ) ( not ( = ?auto_2001379 ?auto_2001384 ) ) ( not ( = ?auto_2001379 ?auto_2001385 ) ) ( not ( = ?auto_2001379 ?auto_2001389 ) ) ( not ( = ?auto_2001380 ?auto_2001382 ) ) ( not ( = ?auto_2001380 ?auto_2001381 ) ) ( not ( = ?auto_2001380 ?auto_2001383 ) ) ( not ( = ?auto_2001380 ?auto_2001384 ) ) ( not ( = ?auto_2001380 ?auto_2001385 ) ) ( not ( = ?auto_2001380 ?auto_2001389 ) ) ( not ( = ?auto_2001382 ?auto_2001381 ) ) ( not ( = ?auto_2001382 ?auto_2001383 ) ) ( not ( = ?auto_2001382 ?auto_2001384 ) ) ( not ( = ?auto_2001382 ?auto_2001385 ) ) ( not ( = ?auto_2001382 ?auto_2001389 ) ) ( not ( = ?auto_2001381 ?auto_2001383 ) ) ( not ( = ?auto_2001381 ?auto_2001384 ) ) ( not ( = ?auto_2001381 ?auto_2001385 ) ) ( not ( = ?auto_2001381 ?auto_2001389 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001383 ?auto_2001384 ?auto_2001385 )
      ( MAKE-7CRATE-VERIFY ?auto_2001378 ?auto_2001379 ?auto_2001380 ?auto_2001382 ?auto_2001381 ?auto_2001383 ?auto_2001384 ?auto_2001385 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2001392 - SURFACE
      ?auto_2001393 - SURFACE
      ?auto_2001394 - SURFACE
      ?auto_2001396 - SURFACE
      ?auto_2001395 - SURFACE
      ?auto_2001397 - SURFACE
      ?auto_2001398 - SURFACE
      ?auto_2001399 - SURFACE
      ?auto_2001400 - SURFACE
    )
    :vars
    (
      ?auto_2001402 - HOIST
      ?auto_2001406 - PLACE
      ?auto_2001405 - PLACE
      ?auto_2001403 - HOIST
      ?auto_2001404 - SURFACE
      ?auto_2001401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001402 ?auto_2001406 ) ( IS-CRATE ?auto_2001400 ) ( not ( = ?auto_2001399 ?auto_2001400 ) ) ( not ( = ?auto_2001398 ?auto_2001399 ) ) ( not ( = ?auto_2001398 ?auto_2001400 ) ) ( not ( = ?auto_2001405 ?auto_2001406 ) ) ( HOIST-AT ?auto_2001403 ?auto_2001405 ) ( not ( = ?auto_2001402 ?auto_2001403 ) ) ( AVAILABLE ?auto_2001403 ) ( SURFACE-AT ?auto_2001400 ?auto_2001405 ) ( ON ?auto_2001400 ?auto_2001404 ) ( CLEAR ?auto_2001400 ) ( not ( = ?auto_2001399 ?auto_2001404 ) ) ( not ( = ?auto_2001400 ?auto_2001404 ) ) ( not ( = ?auto_2001398 ?auto_2001404 ) ) ( SURFACE-AT ?auto_2001398 ?auto_2001406 ) ( CLEAR ?auto_2001398 ) ( IS-CRATE ?auto_2001399 ) ( AVAILABLE ?auto_2001402 ) ( IN ?auto_2001399 ?auto_2001401 ) ( TRUCK-AT ?auto_2001401 ?auto_2001405 ) ( ON ?auto_2001393 ?auto_2001392 ) ( ON ?auto_2001394 ?auto_2001393 ) ( ON ?auto_2001396 ?auto_2001394 ) ( ON ?auto_2001395 ?auto_2001396 ) ( ON ?auto_2001397 ?auto_2001395 ) ( ON ?auto_2001398 ?auto_2001397 ) ( not ( = ?auto_2001392 ?auto_2001393 ) ) ( not ( = ?auto_2001392 ?auto_2001394 ) ) ( not ( = ?auto_2001392 ?auto_2001396 ) ) ( not ( = ?auto_2001392 ?auto_2001395 ) ) ( not ( = ?auto_2001392 ?auto_2001397 ) ) ( not ( = ?auto_2001392 ?auto_2001398 ) ) ( not ( = ?auto_2001392 ?auto_2001399 ) ) ( not ( = ?auto_2001392 ?auto_2001400 ) ) ( not ( = ?auto_2001392 ?auto_2001404 ) ) ( not ( = ?auto_2001393 ?auto_2001394 ) ) ( not ( = ?auto_2001393 ?auto_2001396 ) ) ( not ( = ?auto_2001393 ?auto_2001395 ) ) ( not ( = ?auto_2001393 ?auto_2001397 ) ) ( not ( = ?auto_2001393 ?auto_2001398 ) ) ( not ( = ?auto_2001393 ?auto_2001399 ) ) ( not ( = ?auto_2001393 ?auto_2001400 ) ) ( not ( = ?auto_2001393 ?auto_2001404 ) ) ( not ( = ?auto_2001394 ?auto_2001396 ) ) ( not ( = ?auto_2001394 ?auto_2001395 ) ) ( not ( = ?auto_2001394 ?auto_2001397 ) ) ( not ( = ?auto_2001394 ?auto_2001398 ) ) ( not ( = ?auto_2001394 ?auto_2001399 ) ) ( not ( = ?auto_2001394 ?auto_2001400 ) ) ( not ( = ?auto_2001394 ?auto_2001404 ) ) ( not ( = ?auto_2001396 ?auto_2001395 ) ) ( not ( = ?auto_2001396 ?auto_2001397 ) ) ( not ( = ?auto_2001396 ?auto_2001398 ) ) ( not ( = ?auto_2001396 ?auto_2001399 ) ) ( not ( = ?auto_2001396 ?auto_2001400 ) ) ( not ( = ?auto_2001396 ?auto_2001404 ) ) ( not ( = ?auto_2001395 ?auto_2001397 ) ) ( not ( = ?auto_2001395 ?auto_2001398 ) ) ( not ( = ?auto_2001395 ?auto_2001399 ) ) ( not ( = ?auto_2001395 ?auto_2001400 ) ) ( not ( = ?auto_2001395 ?auto_2001404 ) ) ( not ( = ?auto_2001397 ?auto_2001398 ) ) ( not ( = ?auto_2001397 ?auto_2001399 ) ) ( not ( = ?auto_2001397 ?auto_2001400 ) ) ( not ( = ?auto_2001397 ?auto_2001404 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001398 ?auto_2001399 ?auto_2001400 )
      ( MAKE-8CRATE-VERIFY ?auto_2001392 ?auto_2001393 ?auto_2001394 ?auto_2001396 ?auto_2001395 ?auto_2001397 ?auto_2001398 ?auto_2001399 ?auto_2001400 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2001407 - SURFACE
      ?auto_2001408 - SURFACE
      ?auto_2001409 - SURFACE
      ?auto_2001411 - SURFACE
      ?auto_2001410 - SURFACE
      ?auto_2001412 - SURFACE
      ?auto_2001413 - SURFACE
      ?auto_2001414 - SURFACE
      ?auto_2001415 - SURFACE
      ?auto_2001416 - SURFACE
    )
    :vars
    (
      ?auto_2001418 - HOIST
      ?auto_2001422 - PLACE
      ?auto_2001421 - PLACE
      ?auto_2001419 - HOIST
      ?auto_2001420 - SURFACE
      ?auto_2001417 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001418 ?auto_2001422 ) ( IS-CRATE ?auto_2001416 ) ( not ( = ?auto_2001415 ?auto_2001416 ) ) ( not ( = ?auto_2001414 ?auto_2001415 ) ) ( not ( = ?auto_2001414 ?auto_2001416 ) ) ( not ( = ?auto_2001421 ?auto_2001422 ) ) ( HOIST-AT ?auto_2001419 ?auto_2001421 ) ( not ( = ?auto_2001418 ?auto_2001419 ) ) ( AVAILABLE ?auto_2001419 ) ( SURFACE-AT ?auto_2001416 ?auto_2001421 ) ( ON ?auto_2001416 ?auto_2001420 ) ( CLEAR ?auto_2001416 ) ( not ( = ?auto_2001415 ?auto_2001420 ) ) ( not ( = ?auto_2001416 ?auto_2001420 ) ) ( not ( = ?auto_2001414 ?auto_2001420 ) ) ( SURFACE-AT ?auto_2001414 ?auto_2001422 ) ( CLEAR ?auto_2001414 ) ( IS-CRATE ?auto_2001415 ) ( AVAILABLE ?auto_2001418 ) ( IN ?auto_2001415 ?auto_2001417 ) ( TRUCK-AT ?auto_2001417 ?auto_2001421 ) ( ON ?auto_2001408 ?auto_2001407 ) ( ON ?auto_2001409 ?auto_2001408 ) ( ON ?auto_2001411 ?auto_2001409 ) ( ON ?auto_2001410 ?auto_2001411 ) ( ON ?auto_2001412 ?auto_2001410 ) ( ON ?auto_2001413 ?auto_2001412 ) ( ON ?auto_2001414 ?auto_2001413 ) ( not ( = ?auto_2001407 ?auto_2001408 ) ) ( not ( = ?auto_2001407 ?auto_2001409 ) ) ( not ( = ?auto_2001407 ?auto_2001411 ) ) ( not ( = ?auto_2001407 ?auto_2001410 ) ) ( not ( = ?auto_2001407 ?auto_2001412 ) ) ( not ( = ?auto_2001407 ?auto_2001413 ) ) ( not ( = ?auto_2001407 ?auto_2001414 ) ) ( not ( = ?auto_2001407 ?auto_2001415 ) ) ( not ( = ?auto_2001407 ?auto_2001416 ) ) ( not ( = ?auto_2001407 ?auto_2001420 ) ) ( not ( = ?auto_2001408 ?auto_2001409 ) ) ( not ( = ?auto_2001408 ?auto_2001411 ) ) ( not ( = ?auto_2001408 ?auto_2001410 ) ) ( not ( = ?auto_2001408 ?auto_2001412 ) ) ( not ( = ?auto_2001408 ?auto_2001413 ) ) ( not ( = ?auto_2001408 ?auto_2001414 ) ) ( not ( = ?auto_2001408 ?auto_2001415 ) ) ( not ( = ?auto_2001408 ?auto_2001416 ) ) ( not ( = ?auto_2001408 ?auto_2001420 ) ) ( not ( = ?auto_2001409 ?auto_2001411 ) ) ( not ( = ?auto_2001409 ?auto_2001410 ) ) ( not ( = ?auto_2001409 ?auto_2001412 ) ) ( not ( = ?auto_2001409 ?auto_2001413 ) ) ( not ( = ?auto_2001409 ?auto_2001414 ) ) ( not ( = ?auto_2001409 ?auto_2001415 ) ) ( not ( = ?auto_2001409 ?auto_2001416 ) ) ( not ( = ?auto_2001409 ?auto_2001420 ) ) ( not ( = ?auto_2001411 ?auto_2001410 ) ) ( not ( = ?auto_2001411 ?auto_2001412 ) ) ( not ( = ?auto_2001411 ?auto_2001413 ) ) ( not ( = ?auto_2001411 ?auto_2001414 ) ) ( not ( = ?auto_2001411 ?auto_2001415 ) ) ( not ( = ?auto_2001411 ?auto_2001416 ) ) ( not ( = ?auto_2001411 ?auto_2001420 ) ) ( not ( = ?auto_2001410 ?auto_2001412 ) ) ( not ( = ?auto_2001410 ?auto_2001413 ) ) ( not ( = ?auto_2001410 ?auto_2001414 ) ) ( not ( = ?auto_2001410 ?auto_2001415 ) ) ( not ( = ?auto_2001410 ?auto_2001416 ) ) ( not ( = ?auto_2001410 ?auto_2001420 ) ) ( not ( = ?auto_2001412 ?auto_2001413 ) ) ( not ( = ?auto_2001412 ?auto_2001414 ) ) ( not ( = ?auto_2001412 ?auto_2001415 ) ) ( not ( = ?auto_2001412 ?auto_2001416 ) ) ( not ( = ?auto_2001412 ?auto_2001420 ) ) ( not ( = ?auto_2001413 ?auto_2001414 ) ) ( not ( = ?auto_2001413 ?auto_2001415 ) ) ( not ( = ?auto_2001413 ?auto_2001416 ) ) ( not ( = ?auto_2001413 ?auto_2001420 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001414 ?auto_2001415 ?auto_2001416 )
      ( MAKE-9CRATE-VERIFY ?auto_2001407 ?auto_2001408 ?auto_2001409 ?auto_2001411 ?auto_2001410 ?auto_2001412 ?auto_2001413 ?auto_2001414 ?auto_2001415 ?auto_2001416 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2001423 - SURFACE
      ?auto_2001424 - SURFACE
      ?auto_2001425 - SURFACE
      ?auto_2001427 - SURFACE
      ?auto_2001426 - SURFACE
      ?auto_2001428 - SURFACE
      ?auto_2001429 - SURFACE
      ?auto_2001430 - SURFACE
      ?auto_2001431 - SURFACE
      ?auto_2001432 - SURFACE
      ?auto_2001433 - SURFACE
    )
    :vars
    (
      ?auto_2001435 - HOIST
      ?auto_2001439 - PLACE
      ?auto_2001438 - PLACE
      ?auto_2001436 - HOIST
      ?auto_2001437 - SURFACE
      ?auto_2001434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001435 ?auto_2001439 ) ( IS-CRATE ?auto_2001433 ) ( not ( = ?auto_2001432 ?auto_2001433 ) ) ( not ( = ?auto_2001431 ?auto_2001432 ) ) ( not ( = ?auto_2001431 ?auto_2001433 ) ) ( not ( = ?auto_2001438 ?auto_2001439 ) ) ( HOIST-AT ?auto_2001436 ?auto_2001438 ) ( not ( = ?auto_2001435 ?auto_2001436 ) ) ( AVAILABLE ?auto_2001436 ) ( SURFACE-AT ?auto_2001433 ?auto_2001438 ) ( ON ?auto_2001433 ?auto_2001437 ) ( CLEAR ?auto_2001433 ) ( not ( = ?auto_2001432 ?auto_2001437 ) ) ( not ( = ?auto_2001433 ?auto_2001437 ) ) ( not ( = ?auto_2001431 ?auto_2001437 ) ) ( SURFACE-AT ?auto_2001431 ?auto_2001439 ) ( CLEAR ?auto_2001431 ) ( IS-CRATE ?auto_2001432 ) ( AVAILABLE ?auto_2001435 ) ( IN ?auto_2001432 ?auto_2001434 ) ( TRUCK-AT ?auto_2001434 ?auto_2001438 ) ( ON ?auto_2001424 ?auto_2001423 ) ( ON ?auto_2001425 ?auto_2001424 ) ( ON ?auto_2001427 ?auto_2001425 ) ( ON ?auto_2001426 ?auto_2001427 ) ( ON ?auto_2001428 ?auto_2001426 ) ( ON ?auto_2001429 ?auto_2001428 ) ( ON ?auto_2001430 ?auto_2001429 ) ( ON ?auto_2001431 ?auto_2001430 ) ( not ( = ?auto_2001423 ?auto_2001424 ) ) ( not ( = ?auto_2001423 ?auto_2001425 ) ) ( not ( = ?auto_2001423 ?auto_2001427 ) ) ( not ( = ?auto_2001423 ?auto_2001426 ) ) ( not ( = ?auto_2001423 ?auto_2001428 ) ) ( not ( = ?auto_2001423 ?auto_2001429 ) ) ( not ( = ?auto_2001423 ?auto_2001430 ) ) ( not ( = ?auto_2001423 ?auto_2001431 ) ) ( not ( = ?auto_2001423 ?auto_2001432 ) ) ( not ( = ?auto_2001423 ?auto_2001433 ) ) ( not ( = ?auto_2001423 ?auto_2001437 ) ) ( not ( = ?auto_2001424 ?auto_2001425 ) ) ( not ( = ?auto_2001424 ?auto_2001427 ) ) ( not ( = ?auto_2001424 ?auto_2001426 ) ) ( not ( = ?auto_2001424 ?auto_2001428 ) ) ( not ( = ?auto_2001424 ?auto_2001429 ) ) ( not ( = ?auto_2001424 ?auto_2001430 ) ) ( not ( = ?auto_2001424 ?auto_2001431 ) ) ( not ( = ?auto_2001424 ?auto_2001432 ) ) ( not ( = ?auto_2001424 ?auto_2001433 ) ) ( not ( = ?auto_2001424 ?auto_2001437 ) ) ( not ( = ?auto_2001425 ?auto_2001427 ) ) ( not ( = ?auto_2001425 ?auto_2001426 ) ) ( not ( = ?auto_2001425 ?auto_2001428 ) ) ( not ( = ?auto_2001425 ?auto_2001429 ) ) ( not ( = ?auto_2001425 ?auto_2001430 ) ) ( not ( = ?auto_2001425 ?auto_2001431 ) ) ( not ( = ?auto_2001425 ?auto_2001432 ) ) ( not ( = ?auto_2001425 ?auto_2001433 ) ) ( not ( = ?auto_2001425 ?auto_2001437 ) ) ( not ( = ?auto_2001427 ?auto_2001426 ) ) ( not ( = ?auto_2001427 ?auto_2001428 ) ) ( not ( = ?auto_2001427 ?auto_2001429 ) ) ( not ( = ?auto_2001427 ?auto_2001430 ) ) ( not ( = ?auto_2001427 ?auto_2001431 ) ) ( not ( = ?auto_2001427 ?auto_2001432 ) ) ( not ( = ?auto_2001427 ?auto_2001433 ) ) ( not ( = ?auto_2001427 ?auto_2001437 ) ) ( not ( = ?auto_2001426 ?auto_2001428 ) ) ( not ( = ?auto_2001426 ?auto_2001429 ) ) ( not ( = ?auto_2001426 ?auto_2001430 ) ) ( not ( = ?auto_2001426 ?auto_2001431 ) ) ( not ( = ?auto_2001426 ?auto_2001432 ) ) ( not ( = ?auto_2001426 ?auto_2001433 ) ) ( not ( = ?auto_2001426 ?auto_2001437 ) ) ( not ( = ?auto_2001428 ?auto_2001429 ) ) ( not ( = ?auto_2001428 ?auto_2001430 ) ) ( not ( = ?auto_2001428 ?auto_2001431 ) ) ( not ( = ?auto_2001428 ?auto_2001432 ) ) ( not ( = ?auto_2001428 ?auto_2001433 ) ) ( not ( = ?auto_2001428 ?auto_2001437 ) ) ( not ( = ?auto_2001429 ?auto_2001430 ) ) ( not ( = ?auto_2001429 ?auto_2001431 ) ) ( not ( = ?auto_2001429 ?auto_2001432 ) ) ( not ( = ?auto_2001429 ?auto_2001433 ) ) ( not ( = ?auto_2001429 ?auto_2001437 ) ) ( not ( = ?auto_2001430 ?auto_2001431 ) ) ( not ( = ?auto_2001430 ?auto_2001432 ) ) ( not ( = ?auto_2001430 ?auto_2001433 ) ) ( not ( = ?auto_2001430 ?auto_2001437 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001431 ?auto_2001432 ?auto_2001433 )
      ( MAKE-10CRATE-VERIFY ?auto_2001423 ?auto_2001424 ?auto_2001425 ?auto_2001427 ?auto_2001426 ?auto_2001428 ?auto_2001429 ?auto_2001430 ?auto_2001431 ?auto_2001432 ?auto_2001433 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2001440 - SURFACE
      ?auto_2001441 - SURFACE
      ?auto_2001442 - SURFACE
      ?auto_2001444 - SURFACE
      ?auto_2001443 - SURFACE
      ?auto_2001445 - SURFACE
      ?auto_2001446 - SURFACE
      ?auto_2001447 - SURFACE
      ?auto_2001448 - SURFACE
      ?auto_2001449 - SURFACE
      ?auto_2001450 - SURFACE
      ?auto_2001451 - SURFACE
    )
    :vars
    (
      ?auto_2001453 - HOIST
      ?auto_2001457 - PLACE
      ?auto_2001456 - PLACE
      ?auto_2001454 - HOIST
      ?auto_2001455 - SURFACE
      ?auto_2001452 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001453 ?auto_2001457 ) ( IS-CRATE ?auto_2001451 ) ( not ( = ?auto_2001450 ?auto_2001451 ) ) ( not ( = ?auto_2001449 ?auto_2001450 ) ) ( not ( = ?auto_2001449 ?auto_2001451 ) ) ( not ( = ?auto_2001456 ?auto_2001457 ) ) ( HOIST-AT ?auto_2001454 ?auto_2001456 ) ( not ( = ?auto_2001453 ?auto_2001454 ) ) ( AVAILABLE ?auto_2001454 ) ( SURFACE-AT ?auto_2001451 ?auto_2001456 ) ( ON ?auto_2001451 ?auto_2001455 ) ( CLEAR ?auto_2001451 ) ( not ( = ?auto_2001450 ?auto_2001455 ) ) ( not ( = ?auto_2001451 ?auto_2001455 ) ) ( not ( = ?auto_2001449 ?auto_2001455 ) ) ( SURFACE-AT ?auto_2001449 ?auto_2001457 ) ( CLEAR ?auto_2001449 ) ( IS-CRATE ?auto_2001450 ) ( AVAILABLE ?auto_2001453 ) ( IN ?auto_2001450 ?auto_2001452 ) ( TRUCK-AT ?auto_2001452 ?auto_2001456 ) ( ON ?auto_2001441 ?auto_2001440 ) ( ON ?auto_2001442 ?auto_2001441 ) ( ON ?auto_2001444 ?auto_2001442 ) ( ON ?auto_2001443 ?auto_2001444 ) ( ON ?auto_2001445 ?auto_2001443 ) ( ON ?auto_2001446 ?auto_2001445 ) ( ON ?auto_2001447 ?auto_2001446 ) ( ON ?auto_2001448 ?auto_2001447 ) ( ON ?auto_2001449 ?auto_2001448 ) ( not ( = ?auto_2001440 ?auto_2001441 ) ) ( not ( = ?auto_2001440 ?auto_2001442 ) ) ( not ( = ?auto_2001440 ?auto_2001444 ) ) ( not ( = ?auto_2001440 ?auto_2001443 ) ) ( not ( = ?auto_2001440 ?auto_2001445 ) ) ( not ( = ?auto_2001440 ?auto_2001446 ) ) ( not ( = ?auto_2001440 ?auto_2001447 ) ) ( not ( = ?auto_2001440 ?auto_2001448 ) ) ( not ( = ?auto_2001440 ?auto_2001449 ) ) ( not ( = ?auto_2001440 ?auto_2001450 ) ) ( not ( = ?auto_2001440 ?auto_2001451 ) ) ( not ( = ?auto_2001440 ?auto_2001455 ) ) ( not ( = ?auto_2001441 ?auto_2001442 ) ) ( not ( = ?auto_2001441 ?auto_2001444 ) ) ( not ( = ?auto_2001441 ?auto_2001443 ) ) ( not ( = ?auto_2001441 ?auto_2001445 ) ) ( not ( = ?auto_2001441 ?auto_2001446 ) ) ( not ( = ?auto_2001441 ?auto_2001447 ) ) ( not ( = ?auto_2001441 ?auto_2001448 ) ) ( not ( = ?auto_2001441 ?auto_2001449 ) ) ( not ( = ?auto_2001441 ?auto_2001450 ) ) ( not ( = ?auto_2001441 ?auto_2001451 ) ) ( not ( = ?auto_2001441 ?auto_2001455 ) ) ( not ( = ?auto_2001442 ?auto_2001444 ) ) ( not ( = ?auto_2001442 ?auto_2001443 ) ) ( not ( = ?auto_2001442 ?auto_2001445 ) ) ( not ( = ?auto_2001442 ?auto_2001446 ) ) ( not ( = ?auto_2001442 ?auto_2001447 ) ) ( not ( = ?auto_2001442 ?auto_2001448 ) ) ( not ( = ?auto_2001442 ?auto_2001449 ) ) ( not ( = ?auto_2001442 ?auto_2001450 ) ) ( not ( = ?auto_2001442 ?auto_2001451 ) ) ( not ( = ?auto_2001442 ?auto_2001455 ) ) ( not ( = ?auto_2001444 ?auto_2001443 ) ) ( not ( = ?auto_2001444 ?auto_2001445 ) ) ( not ( = ?auto_2001444 ?auto_2001446 ) ) ( not ( = ?auto_2001444 ?auto_2001447 ) ) ( not ( = ?auto_2001444 ?auto_2001448 ) ) ( not ( = ?auto_2001444 ?auto_2001449 ) ) ( not ( = ?auto_2001444 ?auto_2001450 ) ) ( not ( = ?auto_2001444 ?auto_2001451 ) ) ( not ( = ?auto_2001444 ?auto_2001455 ) ) ( not ( = ?auto_2001443 ?auto_2001445 ) ) ( not ( = ?auto_2001443 ?auto_2001446 ) ) ( not ( = ?auto_2001443 ?auto_2001447 ) ) ( not ( = ?auto_2001443 ?auto_2001448 ) ) ( not ( = ?auto_2001443 ?auto_2001449 ) ) ( not ( = ?auto_2001443 ?auto_2001450 ) ) ( not ( = ?auto_2001443 ?auto_2001451 ) ) ( not ( = ?auto_2001443 ?auto_2001455 ) ) ( not ( = ?auto_2001445 ?auto_2001446 ) ) ( not ( = ?auto_2001445 ?auto_2001447 ) ) ( not ( = ?auto_2001445 ?auto_2001448 ) ) ( not ( = ?auto_2001445 ?auto_2001449 ) ) ( not ( = ?auto_2001445 ?auto_2001450 ) ) ( not ( = ?auto_2001445 ?auto_2001451 ) ) ( not ( = ?auto_2001445 ?auto_2001455 ) ) ( not ( = ?auto_2001446 ?auto_2001447 ) ) ( not ( = ?auto_2001446 ?auto_2001448 ) ) ( not ( = ?auto_2001446 ?auto_2001449 ) ) ( not ( = ?auto_2001446 ?auto_2001450 ) ) ( not ( = ?auto_2001446 ?auto_2001451 ) ) ( not ( = ?auto_2001446 ?auto_2001455 ) ) ( not ( = ?auto_2001447 ?auto_2001448 ) ) ( not ( = ?auto_2001447 ?auto_2001449 ) ) ( not ( = ?auto_2001447 ?auto_2001450 ) ) ( not ( = ?auto_2001447 ?auto_2001451 ) ) ( not ( = ?auto_2001447 ?auto_2001455 ) ) ( not ( = ?auto_2001448 ?auto_2001449 ) ) ( not ( = ?auto_2001448 ?auto_2001450 ) ) ( not ( = ?auto_2001448 ?auto_2001451 ) ) ( not ( = ?auto_2001448 ?auto_2001455 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001449 ?auto_2001450 ?auto_2001451 )
      ( MAKE-11CRATE-VERIFY ?auto_2001440 ?auto_2001441 ?auto_2001442 ?auto_2001444 ?auto_2001443 ?auto_2001445 ?auto_2001446 ?auto_2001447 ?auto_2001448 ?auto_2001449 ?auto_2001450 ?auto_2001451 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2001458 - SURFACE
      ?auto_2001459 - SURFACE
      ?auto_2001460 - SURFACE
      ?auto_2001462 - SURFACE
      ?auto_2001461 - SURFACE
      ?auto_2001463 - SURFACE
      ?auto_2001464 - SURFACE
      ?auto_2001465 - SURFACE
      ?auto_2001466 - SURFACE
      ?auto_2001467 - SURFACE
      ?auto_2001468 - SURFACE
      ?auto_2001469 - SURFACE
      ?auto_2001470 - SURFACE
    )
    :vars
    (
      ?auto_2001472 - HOIST
      ?auto_2001476 - PLACE
      ?auto_2001475 - PLACE
      ?auto_2001473 - HOIST
      ?auto_2001474 - SURFACE
      ?auto_2001471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001472 ?auto_2001476 ) ( IS-CRATE ?auto_2001470 ) ( not ( = ?auto_2001469 ?auto_2001470 ) ) ( not ( = ?auto_2001468 ?auto_2001469 ) ) ( not ( = ?auto_2001468 ?auto_2001470 ) ) ( not ( = ?auto_2001475 ?auto_2001476 ) ) ( HOIST-AT ?auto_2001473 ?auto_2001475 ) ( not ( = ?auto_2001472 ?auto_2001473 ) ) ( AVAILABLE ?auto_2001473 ) ( SURFACE-AT ?auto_2001470 ?auto_2001475 ) ( ON ?auto_2001470 ?auto_2001474 ) ( CLEAR ?auto_2001470 ) ( not ( = ?auto_2001469 ?auto_2001474 ) ) ( not ( = ?auto_2001470 ?auto_2001474 ) ) ( not ( = ?auto_2001468 ?auto_2001474 ) ) ( SURFACE-AT ?auto_2001468 ?auto_2001476 ) ( CLEAR ?auto_2001468 ) ( IS-CRATE ?auto_2001469 ) ( AVAILABLE ?auto_2001472 ) ( IN ?auto_2001469 ?auto_2001471 ) ( TRUCK-AT ?auto_2001471 ?auto_2001475 ) ( ON ?auto_2001459 ?auto_2001458 ) ( ON ?auto_2001460 ?auto_2001459 ) ( ON ?auto_2001462 ?auto_2001460 ) ( ON ?auto_2001461 ?auto_2001462 ) ( ON ?auto_2001463 ?auto_2001461 ) ( ON ?auto_2001464 ?auto_2001463 ) ( ON ?auto_2001465 ?auto_2001464 ) ( ON ?auto_2001466 ?auto_2001465 ) ( ON ?auto_2001467 ?auto_2001466 ) ( ON ?auto_2001468 ?auto_2001467 ) ( not ( = ?auto_2001458 ?auto_2001459 ) ) ( not ( = ?auto_2001458 ?auto_2001460 ) ) ( not ( = ?auto_2001458 ?auto_2001462 ) ) ( not ( = ?auto_2001458 ?auto_2001461 ) ) ( not ( = ?auto_2001458 ?auto_2001463 ) ) ( not ( = ?auto_2001458 ?auto_2001464 ) ) ( not ( = ?auto_2001458 ?auto_2001465 ) ) ( not ( = ?auto_2001458 ?auto_2001466 ) ) ( not ( = ?auto_2001458 ?auto_2001467 ) ) ( not ( = ?auto_2001458 ?auto_2001468 ) ) ( not ( = ?auto_2001458 ?auto_2001469 ) ) ( not ( = ?auto_2001458 ?auto_2001470 ) ) ( not ( = ?auto_2001458 ?auto_2001474 ) ) ( not ( = ?auto_2001459 ?auto_2001460 ) ) ( not ( = ?auto_2001459 ?auto_2001462 ) ) ( not ( = ?auto_2001459 ?auto_2001461 ) ) ( not ( = ?auto_2001459 ?auto_2001463 ) ) ( not ( = ?auto_2001459 ?auto_2001464 ) ) ( not ( = ?auto_2001459 ?auto_2001465 ) ) ( not ( = ?auto_2001459 ?auto_2001466 ) ) ( not ( = ?auto_2001459 ?auto_2001467 ) ) ( not ( = ?auto_2001459 ?auto_2001468 ) ) ( not ( = ?auto_2001459 ?auto_2001469 ) ) ( not ( = ?auto_2001459 ?auto_2001470 ) ) ( not ( = ?auto_2001459 ?auto_2001474 ) ) ( not ( = ?auto_2001460 ?auto_2001462 ) ) ( not ( = ?auto_2001460 ?auto_2001461 ) ) ( not ( = ?auto_2001460 ?auto_2001463 ) ) ( not ( = ?auto_2001460 ?auto_2001464 ) ) ( not ( = ?auto_2001460 ?auto_2001465 ) ) ( not ( = ?auto_2001460 ?auto_2001466 ) ) ( not ( = ?auto_2001460 ?auto_2001467 ) ) ( not ( = ?auto_2001460 ?auto_2001468 ) ) ( not ( = ?auto_2001460 ?auto_2001469 ) ) ( not ( = ?auto_2001460 ?auto_2001470 ) ) ( not ( = ?auto_2001460 ?auto_2001474 ) ) ( not ( = ?auto_2001462 ?auto_2001461 ) ) ( not ( = ?auto_2001462 ?auto_2001463 ) ) ( not ( = ?auto_2001462 ?auto_2001464 ) ) ( not ( = ?auto_2001462 ?auto_2001465 ) ) ( not ( = ?auto_2001462 ?auto_2001466 ) ) ( not ( = ?auto_2001462 ?auto_2001467 ) ) ( not ( = ?auto_2001462 ?auto_2001468 ) ) ( not ( = ?auto_2001462 ?auto_2001469 ) ) ( not ( = ?auto_2001462 ?auto_2001470 ) ) ( not ( = ?auto_2001462 ?auto_2001474 ) ) ( not ( = ?auto_2001461 ?auto_2001463 ) ) ( not ( = ?auto_2001461 ?auto_2001464 ) ) ( not ( = ?auto_2001461 ?auto_2001465 ) ) ( not ( = ?auto_2001461 ?auto_2001466 ) ) ( not ( = ?auto_2001461 ?auto_2001467 ) ) ( not ( = ?auto_2001461 ?auto_2001468 ) ) ( not ( = ?auto_2001461 ?auto_2001469 ) ) ( not ( = ?auto_2001461 ?auto_2001470 ) ) ( not ( = ?auto_2001461 ?auto_2001474 ) ) ( not ( = ?auto_2001463 ?auto_2001464 ) ) ( not ( = ?auto_2001463 ?auto_2001465 ) ) ( not ( = ?auto_2001463 ?auto_2001466 ) ) ( not ( = ?auto_2001463 ?auto_2001467 ) ) ( not ( = ?auto_2001463 ?auto_2001468 ) ) ( not ( = ?auto_2001463 ?auto_2001469 ) ) ( not ( = ?auto_2001463 ?auto_2001470 ) ) ( not ( = ?auto_2001463 ?auto_2001474 ) ) ( not ( = ?auto_2001464 ?auto_2001465 ) ) ( not ( = ?auto_2001464 ?auto_2001466 ) ) ( not ( = ?auto_2001464 ?auto_2001467 ) ) ( not ( = ?auto_2001464 ?auto_2001468 ) ) ( not ( = ?auto_2001464 ?auto_2001469 ) ) ( not ( = ?auto_2001464 ?auto_2001470 ) ) ( not ( = ?auto_2001464 ?auto_2001474 ) ) ( not ( = ?auto_2001465 ?auto_2001466 ) ) ( not ( = ?auto_2001465 ?auto_2001467 ) ) ( not ( = ?auto_2001465 ?auto_2001468 ) ) ( not ( = ?auto_2001465 ?auto_2001469 ) ) ( not ( = ?auto_2001465 ?auto_2001470 ) ) ( not ( = ?auto_2001465 ?auto_2001474 ) ) ( not ( = ?auto_2001466 ?auto_2001467 ) ) ( not ( = ?auto_2001466 ?auto_2001468 ) ) ( not ( = ?auto_2001466 ?auto_2001469 ) ) ( not ( = ?auto_2001466 ?auto_2001470 ) ) ( not ( = ?auto_2001466 ?auto_2001474 ) ) ( not ( = ?auto_2001467 ?auto_2001468 ) ) ( not ( = ?auto_2001467 ?auto_2001469 ) ) ( not ( = ?auto_2001467 ?auto_2001470 ) ) ( not ( = ?auto_2001467 ?auto_2001474 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001468 ?auto_2001469 ?auto_2001470 )
      ( MAKE-12CRATE-VERIFY ?auto_2001458 ?auto_2001459 ?auto_2001460 ?auto_2001462 ?auto_2001461 ?auto_2001463 ?auto_2001464 ?auto_2001465 ?auto_2001466 ?auto_2001467 ?auto_2001468 ?auto_2001469 ?auto_2001470 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2001477 - SURFACE
      ?auto_2001478 - SURFACE
      ?auto_2001479 - SURFACE
      ?auto_2001481 - SURFACE
      ?auto_2001480 - SURFACE
      ?auto_2001482 - SURFACE
      ?auto_2001483 - SURFACE
      ?auto_2001484 - SURFACE
      ?auto_2001485 - SURFACE
      ?auto_2001486 - SURFACE
      ?auto_2001487 - SURFACE
      ?auto_2001488 - SURFACE
      ?auto_2001489 - SURFACE
      ?auto_2001490 - SURFACE
    )
    :vars
    (
      ?auto_2001492 - HOIST
      ?auto_2001496 - PLACE
      ?auto_2001495 - PLACE
      ?auto_2001493 - HOIST
      ?auto_2001494 - SURFACE
      ?auto_2001491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001492 ?auto_2001496 ) ( IS-CRATE ?auto_2001490 ) ( not ( = ?auto_2001489 ?auto_2001490 ) ) ( not ( = ?auto_2001488 ?auto_2001489 ) ) ( not ( = ?auto_2001488 ?auto_2001490 ) ) ( not ( = ?auto_2001495 ?auto_2001496 ) ) ( HOIST-AT ?auto_2001493 ?auto_2001495 ) ( not ( = ?auto_2001492 ?auto_2001493 ) ) ( AVAILABLE ?auto_2001493 ) ( SURFACE-AT ?auto_2001490 ?auto_2001495 ) ( ON ?auto_2001490 ?auto_2001494 ) ( CLEAR ?auto_2001490 ) ( not ( = ?auto_2001489 ?auto_2001494 ) ) ( not ( = ?auto_2001490 ?auto_2001494 ) ) ( not ( = ?auto_2001488 ?auto_2001494 ) ) ( SURFACE-AT ?auto_2001488 ?auto_2001496 ) ( CLEAR ?auto_2001488 ) ( IS-CRATE ?auto_2001489 ) ( AVAILABLE ?auto_2001492 ) ( IN ?auto_2001489 ?auto_2001491 ) ( TRUCK-AT ?auto_2001491 ?auto_2001495 ) ( ON ?auto_2001478 ?auto_2001477 ) ( ON ?auto_2001479 ?auto_2001478 ) ( ON ?auto_2001481 ?auto_2001479 ) ( ON ?auto_2001480 ?auto_2001481 ) ( ON ?auto_2001482 ?auto_2001480 ) ( ON ?auto_2001483 ?auto_2001482 ) ( ON ?auto_2001484 ?auto_2001483 ) ( ON ?auto_2001485 ?auto_2001484 ) ( ON ?auto_2001486 ?auto_2001485 ) ( ON ?auto_2001487 ?auto_2001486 ) ( ON ?auto_2001488 ?auto_2001487 ) ( not ( = ?auto_2001477 ?auto_2001478 ) ) ( not ( = ?auto_2001477 ?auto_2001479 ) ) ( not ( = ?auto_2001477 ?auto_2001481 ) ) ( not ( = ?auto_2001477 ?auto_2001480 ) ) ( not ( = ?auto_2001477 ?auto_2001482 ) ) ( not ( = ?auto_2001477 ?auto_2001483 ) ) ( not ( = ?auto_2001477 ?auto_2001484 ) ) ( not ( = ?auto_2001477 ?auto_2001485 ) ) ( not ( = ?auto_2001477 ?auto_2001486 ) ) ( not ( = ?auto_2001477 ?auto_2001487 ) ) ( not ( = ?auto_2001477 ?auto_2001488 ) ) ( not ( = ?auto_2001477 ?auto_2001489 ) ) ( not ( = ?auto_2001477 ?auto_2001490 ) ) ( not ( = ?auto_2001477 ?auto_2001494 ) ) ( not ( = ?auto_2001478 ?auto_2001479 ) ) ( not ( = ?auto_2001478 ?auto_2001481 ) ) ( not ( = ?auto_2001478 ?auto_2001480 ) ) ( not ( = ?auto_2001478 ?auto_2001482 ) ) ( not ( = ?auto_2001478 ?auto_2001483 ) ) ( not ( = ?auto_2001478 ?auto_2001484 ) ) ( not ( = ?auto_2001478 ?auto_2001485 ) ) ( not ( = ?auto_2001478 ?auto_2001486 ) ) ( not ( = ?auto_2001478 ?auto_2001487 ) ) ( not ( = ?auto_2001478 ?auto_2001488 ) ) ( not ( = ?auto_2001478 ?auto_2001489 ) ) ( not ( = ?auto_2001478 ?auto_2001490 ) ) ( not ( = ?auto_2001478 ?auto_2001494 ) ) ( not ( = ?auto_2001479 ?auto_2001481 ) ) ( not ( = ?auto_2001479 ?auto_2001480 ) ) ( not ( = ?auto_2001479 ?auto_2001482 ) ) ( not ( = ?auto_2001479 ?auto_2001483 ) ) ( not ( = ?auto_2001479 ?auto_2001484 ) ) ( not ( = ?auto_2001479 ?auto_2001485 ) ) ( not ( = ?auto_2001479 ?auto_2001486 ) ) ( not ( = ?auto_2001479 ?auto_2001487 ) ) ( not ( = ?auto_2001479 ?auto_2001488 ) ) ( not ( = ?auto_2001479 ?auto_2001489 ) ) ( not ( = ?auto_2001479 ?auto_2001490 ) ) ( not ( = ?auto_2001479 ?auto_2001494 ) ) ( not ( = ?auto_2001481 ?auto_2001480 ) ) ( not ( = ?auto_2001481 ?auto_2001482 ) ) ( not ( = ?auto_2001481 ?auto_2001483 ) ) ( not ( = ?auto_2001481 ?auto_2001484 ) ) ( not ( = ?auto_2001481 ?auto_2001485 ) ) ( not ( = ?auto_2001481 ?auto_2001486 ) ) ( not ( = ?auto_2001481 ?auto_2001487 ) ) ( not ( = ?auto_2001481 ?auto_2001488 ) ) ( not ( = ?auto_2001481 ?auto_2001489 ) ) ( not ( = ?auto_2001481 ?auto_2001490 ) ) ( not ( = ?auto_2001481 ?auto_2001494 ) ) ( not ( = ?auto_2001480 ?auto_2001482 ) ) ( not ( = ?auto_2001480 ?auto_2001483 ) ) ( not ( = ?auto_2001480 ?auto_2001484 ) ) ( not ( = ?auto_2001480 ?auto_2001485 ) ) ( not ( = ?auto_2001480 ?auto_2001486 ) ) ( not ( = ?auto_2001480 ?auto_2001487 ) ) ( not ( = ?auto_2001480 ?auto_2001488 ) ) ( not ( = ?auto_2001480 ?auto_2001489 ) ) ( not ( = ?auto_2001480 ?auto_2001490 ) ) ( not ( = ?auto_2001480 ?auto_2001494 ) ) ( not ( = ?auto_2001482 ?auto_2001483 ) ) ( not ( = ?auto_2001482 ?auto_2001484 ) ) ( not ( = ?auto_2001482 ?auto_2001485 ) ) ( not ( = ?auto_2001482 ?auto_2001486 ) ) ( not ( = ?auto_2001482 ?auto_2001487 ) ) ( not ( = ?auto_2001482 ?auto_2001488 ) ) ( not ( = ?auto_2001482 ?auto_2001489 ) ) ( not ( = ?auto_2001482 ?auto_2001490 ) ) ( not ( = ?auto_2001482 ?auto_2001494 ) ) ( not ( = ?auto_2001483 ?auto_2001484 ) ) ( not ( = ?auto_2001483 ?auto_2001485 ) ) ( not ( = ?auto_2001483 ?auto_2001486 ) ) ( not ( = ?auto_2001483 ?auto_2001487 ) ) ( not ( = ?auto_2001483 ?auto_2001488 ) ) ( not ( = ?auto_2001483 ?auto_2001489 ) ) ( not ( = ?auto_2001483 ?auto_2001490 ) ) ( not ( = ?auto_2001483 ?auto_2001494 ) ) ( not ( = ?auto_2001484 ?auto_2001485 ) ) ( not ( = ?auto_2001484 ?auto_2001486 ) ) ( not ( = ?auto_2001484 ?auto_2001487 ) ) ( not ( = ?auto_2001484 ?auto_2001488 ) ) ( not ( = ?auto_2001484 ?auto_2001489 ) ) ( not ( = ?auto_2001484 ?auto_2001490 ) ) ( not ( = ?auto_2001484 ?auto_2001494 ) ) ( not ( = ?auto_2001485 ?auto_2001486 ) ) ( not ( = ?auto_2001485 ?auto_2001487 ) ) ( not ( = ?auto_2001485 ?auto_2001488 ) ) ( not ( = ?auto_2001485 ?auto_2001489 ) ) ( not ( = ?auto_2001485 ?auto_2001490 ) ) ( not ( = ?auto_2001485 ?auto_2001494 ) ) ( not ( = ?auto_2001486 ?auto_2001487 ) ) ( not ( = ?auto_2001486 ?auto_2001488 ) ) ( not ( = ?auto_2001486 ?auto_2001489 ) ) ( not ( = ?auto_2001486 ?auto_2001490 ) ) ( not ( = ?auto_2001486 ?auto_2001494 ) ) ( not ( = ?auto_2001487 ?auto_2001488 ) ) ( not ( = ?auto_2001487 ?auto_2001489 ) ) ( not ( = ?auto_2001487 ?auto_2001490 ) ) ( not ( = ?auto_2001487 ?auto_2001494 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001488 ?auto_2001489 ?auto_2001490 )
      ( MAKE-13CRATE-VERIFY ?auto_2001477 ?auto_2001478 ?auto_2001479 ?auto_2001481 ?auto_2001480 ?auto_2001482 ?auto_2001483 ?auto_2001484 ?auto_2001485 ?auto_2001486 ?auto_2001487 ?auto_2001488 ?auto_2001489 ?auto_2001490 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2001497 - SURFACE
      ?auto_2001498 - SURFACE
      ?auto_2001499 - SURFACE
      ?auto_2001501 - SURFACE
      ?auto_2001500 - SURFACE
      ?auto_2001502 - SURFACE
      ?auto_2001503 - SURFACE
      ?auto_2001504 - SURFACE
      ?auto_2001505 - SURFACE
      ?auto_2001506 - SURFACE
      ?auto_2001507 - SURFACE
      ?auto_2001508 - SURFACE
      ?auto_2001509 - SURFACE
      ?auto_2001510 - SURFACE
      ?auto_2001511 - SURFACE
    )
    :vars
    (
      ?auto_2001513 - HOIST
      ?auto_2001517 - PLACE
      ?auto_2001516 - PLACE
      ?auto_2001514 - HOIST
      ?auto_2001515 - SURFACE
      ?auto_2001512 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001513 ?auto_2001517 ) ( IS-CRATE ?auto_2001511 ) ( not ( = ?auto_2001510 ?auto_2001511 ) ) ( not ( = ?auto_2001509 ?auto_2001510 ) ) ( not ( = ?auto_2001509 ?auto_2001511 ) ) ( not ( = ?auto_2001516 ?auto_2001517 ) ) ( HOIST-AT ?auto_2001514 ?auto_2001516 ) ( not ( = ?auto_2001513 ?auto_2001514 ) ) ( AVAILABLE ?auto_2001514 ) ( SURFACE-AT ?auto_2001511 ?auto_2001516 ) ( ON ?auto_2001511 ?auto_2001515 ) ( CLEAR ?auto_2001511 ) ( not ( = ?auto_2001510 ?auto_2001515 ) ) ( not ( = ?auto_2001511 ?auto_2001515 ) ) ( not ( = ?auto_2001509 ?auto_2001515 ) ) ( SURFACE-AT ?auto_2001509 ?auto_2001517 ) ( CLEAR ?auto_2001509 ) ( IS-CRATE ?auto_2001510 ) ( AVAILABLE ?auto_2001513 ) ( IN ?auto_2001510 ?auto_2001512 ) ( TRUCK-AT ?auto_2001512 ?auto_2001516 ) ( ON ?auto_2001498 ?auto_2001497 ) ( ON ?auto_2001499 ?auto_2001498 ) ( ON ?auto_2001501 ?auto_2001499 ) ( ON ?auto_2001500 ?auto_2001501 ) ( ON ?auto_2001502 ?auto_2001500 ) ( ON ?auto_2001503 ?auto_2001502 ) ( ON ?auto_2001504 ?auto_2001503 ) ( ON ?auto_2001505 ?auto_2001504 ) ( ON ?auto_2001506 ?auto_2001505 ) ( ON ?auto_2001507 ?auto_2001506 ) ( ON ?auto_2001508 ?auto_2001507 ) ( ON ?auto_2001509 ?auto_2001508 ) ( not ( = ?auto_2001497 ?auto_2001498 ) ) ( not ( = ?auto_2001497 ?auto_2001499 ) ) ( not ( = ?auto_2001497 ?auto_2001501 ) ) ( not ( = ?auto_2001497 ?auto_2001500 ) ) ( not ( = ?auto_2001497 ?auto_2001502 ) ) ( not ( = ?auto_2001497 ?auto_2001503 ) ) ( not ( = ?auto_2001497 ?auto_2001504 ) ) ( not ( = ?auto_2001497 ?auto_2001505 ) ) ( not ( = ?auto_2001497 ?auto_2001506 ) ) ( not ( = ?auto_2001497 ?auto_2001507 ) ) ( not ( = ?auto_2001497 ?auto_2001508 ) ) ( not ( = ?auto_2001497 ?auto_2001509 ) ) ( not ( = ?auto_2001497 ?auto_2001510 ) ) ( not ( = ?auto_2001497 ?auto_2001511 ) ) ( not ( = ?auto_2001497 ?auto_2001515 ) ) ( not ( = ?auto_2001498 ?auto_2001499 ) ) ( not ( = ?auto_2001498 ?auto_2001501 ) ) ( not ( = ?auto_2001498 ?auto_2001500 ) ) ( not ( = ?auto_2001498 ?auto_2001502 ) ) ( not ( = ?auto_2001498 ?auto_2001503 ) ) ( not ( = ?auto_2001498 ?auto_2001504 ) ) ( not ( = ?auto_2001498 ?auto_2001505 ) ) ( not ( = ?auto_2001498 ?auto_2001506 ) ) ( not ( = ?auto_2001498 ?auto_2001507 ) ) ( not ( = ?auto_2001498 ?auto_2001508 ) ) ( not ( = ?auto_2001498 ?auto_2001509 ) ) ( not ( = ?auto_2001498 ?auto_2001510 ) ) ( not ( = ?auto_2001498 ?auto_2001511 ) ) ( not ( = ?auto_2001498 ?auto_2001515 ) ) ( not ( = ?auto_2001499 ?auto_2001501 ) ) ( not ( = ?auto_2001499 ?auto_2001500 ) ) ( not ( = ?auto_2001499 ?auto_2001502 ) ) ( not ( = ?auto_2001499 ?auto_2001503 ) ) ( not ( = ?auto_2001499 ?auto_2001504 ) ) ( not ( = ?auto_2001499 ?auto_2001505 ) ) ( not ( = ?auto_2001499 ?auto_2001506 ) ) ( not ( = ?auto_2001499 ?auto_2001507 ) ) ( not ( = ?auto_2001499 ?auto_2001508 ) ) ( not ( = ?auto_2001499 ?auto_2001509 ) ) ( not ( = ?auto_2001499 ?auto_2001510 ) ) ( not ( = ?auto_2001499 ?auto_2001511 ) ) ( not ( = ?auto_2001499 ?auto_2001515 ) ) ( not ( = ?auto_2001501 ?auto_2001500 ) ) ( not ( = ?auto_2001501 ?auto_2001502 ) ) ( not ( = ?auto_2001501 ?auto_2001503 ) ) ( not ( = ?auto_2001501 ?auto_2001504 ) ) ( not ( = ?auto_2001501 ?auto_2001505 ) ) ( not ( = ?auto_2001501 ?auto_2001506 ) ) ( not ( = ?auto_2001501 ?auto_2001507 ) ) ( not ( = ?auto_2001501 ?auto_2001508 ) ) ( not ( = ?auto_2001501 ?auto_2001509 ) ) ( not ( = ?auto_2001501 ?auto_2001510 ) ) ( not ( = ?auto_2001501 ?auto_2001511 ) ) ( not ( = ?auto_2001501 ?auto_2001515 ) ) ( not ( = ?auto_2001500 ?auto_2001502 ) ) ( not ( = ?auto_2001500 ?auto_2001503 ) ) ( not ( = ?auto_2001500 ?auto_2001504 ) ) ( not ( = ?auto_2001500 ?auto_2001505 ) ) ( not ( = ?auto_2001500 ?auto_2001506 ) ) ( not ( = ?auto_2001500 ?auto_2001507 ) ) ( not ( = ?auto_2001500 ?auto_2001508 ) ) ( not ( = ?auto_2001500 ?auto_2001509 ) ) ( not ( = ?auto_2001500 ?auto_2001510 ) ) ( not ( = ?auto_2001500 ?auto_2001511 ) ) ( not ( = ?auto_2001500 ?auto_2001515 ) ) ( not ( = ?auto_2001502 ?auto_2001503 ) ) ( not ( = ?auto_2001502 ?auto_2001504 ) ) ( not ( = ?auto_2001502 ?auto_2001505 ) ) ( not ( = ?auto_2001502 ?auto_2001506 ) ) ( not ( = ?auto_2001502 ?auto_2001507 ) ) ( not ( = ?auto_2001502 ?auto_2001508 ) ) ( not ( = ?auto_2001502 ?auto_2001509 ) ) ( not ( = ?auto_2001502 ?auto_2001510 ) ) ( not ( = ?auto_2001502 ?auto_2001511 ) ) ( not ( = ?auto_2001502 ?auto_2001515 ) ) ( not ( = ?auto_2001503 ?auto_2001504 ) ) ( not ( = ?auto_2001503 ?auto_2001505 ) ) ( not ( = ?auto_2001503 ?auto_2001506 ) ) ( not ( = ?auto_2001503 ?auto_2001507 ) ) ( not ( = ?auto_2001503 ?auto_2001508 ) ) ( not ( = ?auto_2001503 ?auto_2001509 ) ) ( not ( = ?auto_2001503 ?auto_2001510 ) ) ( not ( = ?auto_2001503 ?auto_2001511 ) ) ( not ( = ?auto_2001503 ?auto_2001515 ) ) ( not ( = ?auto_2001504 ?auto_2001505 ) ) ( not ( = ?auto_2001504 ?auto_2001506 ) ) ( not ( = ?auto_2001504 ?auto_2001507 ) ) ( not ( = ?auto_2001504 ?auto_2001508 ) ) ( not ( = ?auto_2001504 ?auto_2001509 ) ) ( not ( = ?auto_2001504 ?auto_2001510 ) ) ( not ( = ?auto_2001504 ?auto_2001511 ) ) ( not ( = ?auto_2001504 ?auto_2001515 ) ) ( not ( = ?auto_2001505 ?auto_2001506 ) ) ( not ( = ?auto_2001505 ?auto_2001507 ) ) ( not ( = ?auto_2001505 ?auto_2001508 ) ) ( not ( = ?auto_2001505 ?auto_2001509 ) ) ( not ( = ?auto_2001505 ?auto_2001510 ) ) ( not ( = ?auto_2001505 ?auto_2001511 ) ) ( not ( = ?auto_2001505 ?auto_2001515 ) ) ( not ( = ?auto_2001506 ?auto_2001507 ) ) ( not ( = ?auto_2001506 ?auto_2001508 ) ) ( not ( = ?auto_2001506 ?auto_2001509 ) ) ( not ( = ?auto_2001506 ?auto_2001510 ) ) ( not ( = ?auto_2001506 ?auto_2001511 ) ) ( not ( = ?auto_2001506 ?auto_2001515 ) ) ( not ( = ?auto_2001507 ?auto_2001508 ) ) ( not ( = ?auto_2001507 ?auto_2001509 ) ) ( not ( = ?auto_2001507 ?auto_2001510 ) ) ( not ( = ?auto_2001507 ?auto_2001511 ) ) ( not ( = ?auto_2001507 ?auto_2001515 ) ) ( not ( = ?auto_2001508 ?auto_2001509 ) ) ( not ( = ?auto_2001508 ?auto_2001510 ) ) ( not ( = ?auto_2001508 ?auto_2001511 ) ) ( not ( = ?auto_2001508 ?auto_2001515 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001509 ?auto_2001510 ?auto_2001511 )
      ( MAKE-14CRATE-VERIFY ?auto_2001497 ?auto_2001498 ?auto_2001499 ?auto_2001501 ?auto_2001500 ?auto_2001502 ?auto_2001503 ?auto_2001504 ?auto_2001505 ?auto_2001506 ?auto_2001507 ?auto_2001508 ?auto_2001509 ?auto_2001510 ?auto_2001511 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2001518 - SURFACE
      ?auto_2001519 - SURFACE
      ?auto_2001520 - SURFACE
      ?auto_2001522 - SURFACE
      ?auto_2001521 - SURFACE
      ?auto_2001523 - SURFACE
      ?auto_2001524 - SURFACE
      ?auto_2001525 - SURFACE
      ?auto_2001526 - SURFACE
      ?auto_2001527 - SURFACE
      ?auto_2001528 - SURFACE
      ?auto_2001529 - SURFACE
      ?auto_2001530 - SURFACE
      ?auto_2001531 - SURFACE
      ?auto_2001532 - SURFACE
      ?auto_2001533 - SURFACE
    )
    :vars
    (
      ?auto_2001535 - HOIST
      ?auto_2001539 - PLACE
      ?auto_2001538 - PLACE
      ?auto_2001536 - HOIST
      ?auto_2001537 - SURFACE
      ?auto_2001534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001535 ?auto_2001539 ) ( IS-CRATE ?auto_2001533 ) ( not ( = ?auto_2001532 ?auto_2001533 ) ) ( not ( = ?auto_2001531 ?auto_2001532 ) ) ( not ( = ?auto_2001531 ?auto_2001533 ) ) ( not ( = ?auto_2001538 ?auto_2001539 ) ) ( HOIST-AT ?auto_2001536 ?auto_2001538 ) ( not ( = ?auto_2001535 ?auto_2001536 ) ) ( AVAILABLE ?auto_2001536 ) ( SURFACE-AT ?auto_2001533 ?auto_2001538 ) ( ON ?auto_2001533 ?auto_2001537 ) ( CLEAR ?auto_2001533 ) ( not ( = ?auto_2001532 ?auto_2001537 ) ) ( not ( = ?auto_2001533 ?auto_2001537 ) ) ( not ( = ?auto_2001531 ?auto_2001537 ) ) ( SURFACE-AT ?auto_2001531 ?auto_2001539 ) ( CLEAR ?auto_2001531 ) ( IS-CRATE ?auto_2001532 ) ( AVAILABLE ?auto_2001535 ) ( IN ?auto_2001532 ?auto_2001534 ) ( TRUCK-AT ?auto_2001534 ?auto_2001538 ) ( ON ?auto_2001519 ?auto_2001518 ) ( ON ?auto_2001520 ?auto_2001519 ) ( ON ?auto_2001522 ?auto_2001520 ) ( ON ?auto_2001521 ?auto_2001522 ) ( ON ?auto_2001523 ?auto_2001521 ) ( ON ?auto_2001524 ?auto_2001523 ) ( ON ?auto_2001525 ?auto_2001524 ) ( ON ?auto_2001526 ?auto_2001525 ) ( ON ?auto_2001527 ?auto_2001526 ) ( ON ?auto_2001528 ?auto_2001527 ) ( ON ?auto_2001529 ?auto_2001528 ) ( ON ?auto_2001530 ?auto_2001529 ) ( ON ?auto_2001531 ?auto_2001530 ) ( not ( = ?auto_2001518 ?auto_2001519 ) ) ( not ( = ?auto_2001518 ?auto_2001520 ) ) ( not ( = ?auto_2001518 ?auto_2001522 ) ) ( not ( = ?auto_2001518 ?auto_2001521 ) ) ( not ( = ?auto_2001518 ?auto_2001523 ) ) ( not ( = ?auto_2001518 ?auto_2001524 ) ) ( not ( = ?auto_2001518 ?auto_2001525 ) ) ( not ( = ?auto_2001518 ?auto_2001526 ) ) ( not ( = ?auto_2001518 ?auto_2001527 ) ) ( not ( = ?auto_2001518 ?auto_2001528 ) ) ( not ( = ?auto_2001518 ?auto_2001529 ) ) ( not ( = ?auto_2001518 ?auto_2001530 ) ) ( not ( = ?auto_2001518 ?auto_2001531 ) ) ( not ( = ?auto_2001518 ?auto_2001532 ) ) ( not ( = ?auto_2001518 ?auto_2001533 ) ) ( not ( = ?auto_2001518 ?auto_2001537 ) ) ( not ( = ?auto_2001519 ?auto_2001520 ) ) ( not ( = ?auto_2001519 ?auto_2001522 ) ) ( not ( = ?auto_2001519 ?auto_2001521 ) ) ( not ( = ?auto_2001519 ?auto_2001523 ) ) ( not ( = ?auto_2001519 ?auto_2001524 ) ) ( not ( = ?auto_2001519 ?auto_2001525 ) ) ( not ( = ?auto_2001519 ?auto_2001526 ) ) ( not ( = ?auto_2001519 ?auto_2001527 ) ) ( not ( = ?auto_2001519 ?auto_2001528 ) ) ( not ( = ?auto_2001519 ?auto_2001529 ) ) ( not ( = ?auto_2001519 ?auto_2001530 ) ) ( not ( = ?auto_2001519 ?auto_2001531 ) ) ( not ( = ?auto_2001519 ?auto_2001532 ) ) ( not ( = ?auto_2001519 ?auto_2001533 ) ) ( not ( = ?auto_2001519 ?auto_2001537 ) ) ( not ( = ?auto_2001520 ?auto_2001522 ) ) ( not ( = ?auto_2001520 ?auto_2001521 ) ) ( not ( = ?auto_2001520 ?auto_2001523 ) ) ( not ( = ?auto_2001520 ?auto_2001524 ) ) ( not ( = ?auto_2001520 ?auto_2001525 ) ) ( not ( = ?auto_2001520 ?auto_2001526 ) ) ( not ( = ?auto_2001520 ?auto_2001527 ) ) ( not ( = ?auto_2001520 ?auto_2001528 ) ) ( not ( = ?auto_2001520 ?auto_2001529 ) ) ( not ( = ?auto_2001520 ?auto_2001530 ) ) ( not ( = ?auto_2001520 ?auto_2001531 ) ) ( not ( = ?auto_2001520 ?auto_2001532 ) ) ( not ( = ?auto_2001520 ?auto_2001533 ) ) ( not ( = ?auto_2001520 ?auto_2001537 ) ) ( not ( = ?auto_2001522 ?auto_2001521 ) ) ( not ( = ?auto_2001522 ?auto_2001523 ) ) ( not ( = ?auto_2001522 ?auto_2001524 ) ) ( not ( = ?auto_2001522 ?auto_2001525 ) ) ( not ( = ?auto_2001522 ?auto_2001526 ) ) ( not ( = ?auto_2001522 ?auto_2001527 ) ) ( not ( = ?auto_2001522 ?auto_2001528 ) ) ( not ( = ?auto_2001522 ?auto_2001529 ) ) ( not ( = ?auto_2001522 ?auto_2001530 ) ) ( not ( = ?auto_2001522 ?auto_2001531 ) ) ( not ( = ?auto_2001522 ?auto_2001532 ) ) ( not ( = ?auto_2001522 ?auto_2001533 ) ) ( not ( = ?auto_2001522 ?auto_2001537 ) ) ( not ( = ?auto_2001521 ?auto_2001523 ) ) ( not ( = ?auto_2001521 ?auto_2001524 ) ) ( not ( = ?auto_2001521 ?auto_2001525 ) ) ( not ( = ?auto_2001521 ?auto_2001526 ) ) ( not ( = ?auto_2001521 ?auto_2001527 ) ) ( not ( = ?auto_2001521 ?auto_2001528 ) ) ( not ( = ?auto_2001521 ?auto_2001529 ) ) ( not ( = ?auto_2001521 ?auto_2001530 ) ) ( not ( = ?auto_2001521 ?auto_2001531 ) ) ( not ( = ?auto_2001521 ?auto_2001532 ) ) ( not ( = ?auto_2001521 ?auto_2001533 ) ) ( not ( = ?auto_2001521 ?auto_2001537 ) ) ( not ( = ?auto_2001523 ?auto_2001524 ) ) ( not ( = ?auto_2001523 ?auto_2001525 ) ) ( not ( = ?auto_2001523 ?auto_2001526 ) ) ( not ( = ?auto_2001523 ?auto_2001527 ) ) ( not ( = ?auto_2001523 ?auto_2001528 ) ) ( not ( = ?auto_2001523 ?auto_2001529 ) ) ( not ( = ?auto_2001523 ?auto_2001530 ) ) ( not ( = ?auto_2001523 ?auto_2001531 ) ) ( not ( = ?auto_2001523 ?auto_2001532 ) ) ( not ( = ?auto_2001523 ?auto_2001533 ) ) ( not ( = ?auto_2001523 ?auto_2001537 ) ) ( not ( = ?auto_2001524 ?auto_2001525 ) ) ( not ( = ?auto_2001524 ?auto_2001526 ) ) ( not ( = ?auto_2001524 ?auto_2001527 ) ) ( not ( = ?auto_2001524 ?auto_2001528 ) ) ( not ( = ?auto_2001524 ?auto_2001529 ) ) ( not ( = ?auto_2001524 ?auto_2001530 ) ) ( not ( = ?auto_2001524 ?auto_2001531 ) ) ( not ( = ?auto_2001524 ?auto_2001532 ) ) ( not ( = ?auto_2001524 ?auto_2001533 ) ) ( not ( = ?auto_2001524 ?auto_2001537 ) ) ( not ( = ?auto_2001525 ?auto_2001526 ) ) ( not ( = ?auto_2001525 ?auto_2001527 ) ) ( not ( = ?auto_2001525 ?auto_2001528 ) ) ( not ( = ?auto_2001525 ?auto_2001529 ) ) ( not ( = ?auto_2001525 ?auto_2001530 ) ) ( not ( = ?auto_2001525 ?auto_2001531 ) ) ( not ( = ?auto_2001525 ?auto_2001532 ) ) ( not ( = ?auto_2001525 ?auto_2001533 ) ) ( not ( = ?auto_2001525 ?auto_2001537 ) ) ( not ( = ?auto_2001526 ?auto_2001527 ) ) ( not ( = ?auto_2001526 ?auto_2001528 ) ) ( not ( = ?auto_2001526 ?auto_2001529 ) ) ( not ( = ?auto_2001526 ?auto_2001530 ) ) ( not ( = ?auto_2001526 ?auto_2001531 ) ) ( not ( = ?auto_2001526 ?auto_2001532 ) ) ( not ( = ?auto_2001526 ?auto_2001533 ) ) ( not ( = ?auto_2001526 ?auto_2001537 ) ) ( not ( = ?auto_2001527 ?auto_2001528 ) ) ( not ( = ?auto_2001527 ?auto_2001529 ) ) ( not ( = ?auto_2001527 ?auto_2001530 ) ) ( not ( = ?auto_2001527 ?auto_2001531 ) ) ( not ( = ?auto_2001527 ?auto_2001532 ) ) ( not ( = ?auto_2001527 ?auto_2001533 ) ) ( not ( = ?auto_2001527 ?auto_2001537 ) ) ( not ( = ?auto_2001528 ?auto_2001529 ) ) ( not ( = ?auto_2001528 ?auto_2001530 ) ) ( not ( = ?auto_2001528 ?auto_2001531 ) ) ( not ( = ?auto_2001528 ?auto_2001532 ) ) ( not ( = ?auto_2001528 ?auto_2001533 ) ) ( not ( = ?auto_2001528 ?auto_2001537 ) ) ( not ( = ?auto_2001529 ?auto_2001530 ) ) ( not ( = ?auto_2001529 ?auto_2001531 ) ) ( not ( = ?auto_2001529 ?auto_2001532 ) ) ( not ( = ?auto_2001529 ?auto_2001533 ) ) ( not ( = ?auto_2001529 ?auto_2001537 ) ) ( not ( = ?auto_2001530 ?auto_2001531 ) ) ( not ( = ?auto_2001530 ?auto_2001532 ) ) ( not ( = ?auto_2001530 ?auto_2001533 ) ) ( not ( = ?auto_2001530 ?auto_2001537 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001531 ?auto_2001532 ?auto_2001533 )
      ( MAKE-15CRATE-VERIFY ?auto_2001518 ?auto_2001519 ?auto_2001520 ?auto_2001522 ?auto_2001521 ?auto_2001523 ?auto_2001524 ?auto_2001525 ?auto_2001526 ?auto_2001527 ?auto_2001528 ?auto_2001529 ?auto_2001530 ?auto_2001531 ?auto_2001532 ?auto_2001533 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2001540 - SURFACE
      ?auto_2001541 - SURFACE
    )
    :vars
    (
      ?auto_2001544 - HOIST
      ?auto_2001548 - PLACE
      ?auto_2001542 - SURFACE
      ?auto_2001547 - PLACE
      ?auto_2001545 - HOIST
      ?auto_2001546 - SURFACE
      ?auto_2001543 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001544 ?auto_2001548 ) ( IS-CRATE ?auto_2001541 ) ( not ( = ?auto_2001540 ?auto_2001541 ) ) ( not ( = ?auto_2001542 ?auto_2001540 ) ) ( not ( = ?auto_2001542 ?auto_2001541 ) ) ( not ( = ?auto_2001547 ?auto_2001548 ) ) ( HOIST-AT ?auto_2001545 ?auto_2001547 ) ( not ( = ?auto_2001544 ?auto_2001545 ) ) ( SURFACE-AT ?auto_2001541 ?auto_2001547 ) ( ON ?auto_2001541 ?auto_2001546 ) ( CLEAR ?auto_2001541 ) ( not ( = ?auto_2001540 ?auto_2001546 ) ) ( not ( = ?auto_2001541 ?auto_2001546 ) ) ( not ( = ?auto_2001542 ?auto_2001546 ) ) ( SURFACE-AT ?auto_2001542 ?auto_2001548 ) ( CLEAR ?auto_2001542 ) ( IS-CRATE ?auto_2001540 ) ( AVAILABLE ?auto_2001544 ) ( TRUCK-AT ?auto_2001543 ?auto_2001547 ) ( LIFTING ?auto_2001545 ?auto_2001540 ) )
    :subtasks
    ( ( !LOAD ?auto_2001545 ?auto_2001540 ?auto_2001543 ?auto_2001547 )
      ( MAKE-2CRATE ?auto_2001542 ?auto_2001540 ?auto_2001541 )
      ( MAKE-1CRATE-VERIFY ?auto_2001540 ?auto_2001541 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2001549 - SURFACE
      ?auto_2001550 - SURFACE
      ?auto_2001551 - SURFACE
    )
    :vars
    (
      ?auto_2001554 - HOIST
      ?auto_2001555 - PLACE
      ?auto_2001556 - PLACE
      ?auto_2001553 - HOIST
      ?auto_2001552 - SURFACE
      ?auto_2001557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001554 ?auto_2001555 ) ( IS-CRATE ?auto_2001551 ) ( not ( = ?auto_2001550 ?auto_2001551 ) ) ( not ( = ?auto_2001549 ?auto_2001550 ) ) ( not ( = ?auto_2001549 ?auto_2001551 ) ) ( not ( = ?auto_2001556 ?auto_2001555 ) ) ( HOIST-AT ?auto_2001553 ?auto_2001556 ) ( not ( = ?auto_2001554 ?auto_2001553 ) ) ( SURFACE-AT ?auto_2001551 ?auto_2001556 ) ( ON ?auto_2001551 ?auto_2001552 ) ( CLEAR ?auto_2001551 ) ( not ( = ?auto_2001550 ?auto_2001552 ) ) ( not ( = ?auto_2001551 ?auto_2001552 ) ) ( not ( = ?auto_2001549 ?auto_2001552 ) ) ( SURFACE-AT ?auto_2001549 ?auto_2001555 ) ( CLEAR ?auto_2001549 ) ( IS-CRATE ?auto_2001550 ) ( AVAILABLE ?auto_2001554 ) ( TRUCK-AT ?auto_2001557 ?auto_2001556 ) ( LIFTING ?auto_2001553 ?auto_2001550 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2001550 ?auto_2001551 )
      ( MAKE-2CRATE-VERIFY ?auto_2001549 ?auto_2001550 ?auto_2001551 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2001558 - SURFACE
      ?auto_2001559 - SURFACE
      ?auto_2001560 - SURFACE
      ?auto_2001561 - SURFACE
    )
    :vars
    (
      ?auto_2001566 - HOIST
      ?auto_2001562 - PLACE
      ?auto_2001567 - PLACE
      ?auto_2001563 - HOIST
      ?auto_2001565 - SURFACE
      ?auto_2001564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001566 ?auto_2001562 ) ( IS-CRATE ?auto_2001561 ) ( not ( = ?auto_2001560 ?auto_2001561 ) ) ( not ( = ?auto_2001559 ?auto_2001560 ) ) ( not ( = ?auto_2001559 ?auto_2001561 ) ) ( not ( = ?auto_2001567 ?auto_2001562 ) ) ( HOIST-AT ?auto_2001563 ?auto_2001567 ) ( not ( = ?auto_2001566 ?auto_2001563 ) ) ( SURFACE-AT ?auto_2001561 ?auto_2001567 ) ( ON ?auto_2001561 ?auto_2001565 ) ( CLEAR ?auto_2001561 ) ( not ( = ?auto_2001560 ?auto_2001565 ) ) ( not ( = ?auto_2001561 ?auto_2001565 ) ) ( not ( = ?auto_2001559 ?auto_2001565 ) ) ( SURFACE-AT ?auto_2001559 ?auto_2001562 ) ( CLEAR ?auto_2001559 ) ( IS-CRATE ?auto_2001560 ) ( AVAILABLE ?auto_2001566 ) ( TRUCK-AT ?auto_2001564 ?auto_2001567 ) ( LIFTING ?auto_2001563 ?auto_2001560 ) ( ON ?auto_2001559 ?auto_2001558 ) ( not ( = ?auto_2001558 ?auto_2001559 ) ) ( not ( = ?auto_2001558 ?auto_2001560 ) ) ( not ( = ?auto_2001558 ?auto_2001561 ) ) ( not ( = ?auto_2001558 ?auto_2001565 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001559 ?auto_2001560 ?auto_2001561 )
      ( MAKE-3CRATE-VERIFY ?auto_2001558 ?auto_2001559 ?auto_2001560 ?auto_2001561 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2001568 - SURFACE
      ?auto_2001569 - SURFACE
      ?auto_2001570 - SURFACE
      ?auto_2001572 - SURFACE
      ?auto_2001571 - SURFACE
    )
    :vars
    (
      ?auto_2001577 - HOIST
      ?auto_2001573 - PLACE
      ?auto_2001578 - PLACE
      ?auto_2001574 - HOIST
      ?auto_2001576 - SURFACE
      ?auto_2001575 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001577 ?auto_2001573 ) ( IS-CRATE ?auto_2001571 ) ( not ( = ?auto_2001572 ?auto_2001571 ) ) ( not ( = ?auto_2001570 ?auto_2001572 ) ) ( not ( = ?auto_2001570 ?auto_2001571 ) ) ( not ( = ?auto_2001578 ?auto_2001573 ) ) ( HOIST-AT ?auto_2001574 ?auto_2001578 ) ( not ( = ?auto_2001577 ?auto_2001574 ) ) ( SURFACE-AT ?auto_2001571 ?auto_2001578 ) ( ON ?auto_2001571 ?auto_2001576 ) ( CLEAR ?auto_2001571 ) ( not ( = ?auto_2001572 ?auto_2001576 ) ) ( not ( = ?auto_2001571 ?auto_2001576 ) ) ( not ( = ?auto_2001570 ?auto_2001576 ) ) ( SURFACE-AT ?auto_2001570 ?auto_2001573 ) ( CLEAR ?auto_2001570 ) ( IS-CRATE ?auto_2001572 ) ( AVAILABLE ?auto_2001577 ) ( TRUCK-AT ?auto_2001575 ?auto_2001578 ) ( LIFTING ?auto_2001574 ?auto_2001572 ) ( ON ?auto_2001569 ?auto_2001568 ) ( ON ?auto_2001570 ?auto_2001569 ) ( not ( = ?auto_2001568 ?auto_2001569 ) ) ( not ( = ?auto_2001568 ?auto_2001570 ) ) ( not ( = ?auto_2001568 ?auto_2001572 ) ) ( not ( = ?auto_2001568 ?auto_2001571 ) ) ( not ( = ?auto_2001568 ?auto_2001576 ) ) ( not ( = ?auto_2001569 ?auto_2001570 ) ) ( not ( = ?auto_2001569 ?auto_2001572 ) ) ( not ( = ?auto_2001569 ?auto_2001571 ) ) ( not ( = ?auto_2001569 ?auto_2001576 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001570 ?auto_2001572 ?auto_2001571 )
      ( MAKE-4CRATE-VERIFY ?auto_2001568 ?auto_2001569 ?auto_2001570 ?auto_2001572 ?auto_2001571 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2001579 - SURFACE
      ?auto_2001580 - SURFACE
      ?auto_2001581 - SURFACE
      ?auto_2001583 - SURFACE
      ?auto_2001582 - SURFACE
      ?auto_2001584 - SURFACE
    )
    :vars
    (
      ?auto_2001589 - HOIST
      ?auto_2001585 - PLACE
      ?auto_2001590 - PLACE
      ?auto_2001586 - HOIST
      ?auto_2001588 - SURFACE
      ?auto_2001587 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001589 ?auto_2001585 ) ( IS-CRATE ?auto_2001584 ) ( not ( = ?auto_2001582 ?auto_2001584 ) ) ( not ( = ?auto_2001583 ?auto_2001582 ) ) ( not ( = ?auto_2001583 ?auto_2001584 ) ) ( not ( = ?auto_2001590 ?auto_2001585 ) ) ( HOIST-AT ?auto_2001586 ?auto_2001590 ) ( not ( = ?auto_2001589 ?auto_2001586 ) ) ( SURFACE-AT ?auto_2001584 ?auto_2001590 ) ( ON ?auto_2001584 ?auto_2001588 ) ( CLEAR ?auto_2001584 ) ( not ( = ?auto_2001582 ?auto_2001588 ) ) ( not ( = ?auto_2001584 ?auto_2001588 ) ) ( not ( = ?auto_2001583 ?auto_2001588 ) ) ( SURFACE-AT ?auto_2001583 ?auto_2001585 ) ( CLEAR ?auto_2001583 ) ( IS-CRATE ?auto_2001582 ) ( AVAILABLE ?auto_2001589 ) ( TRUCK-AT ?auto_2001587 ?auto_2001590 ) ( LIFTING ?auto_2001586 ?auto_2001582 ) ( ON ?auto_2001580 ?auto_2001579 ) ( ON ?auto_2001581 ?auto_2001580 ) ( ON ?auto_2001583 ?auto_2001581 ) ( not ( = ?auto_2001579 ?auto_2001580 ) ) ( not ( = ?auto_2001579 ?auto_2001581 ) ) ( not ( = ?auto_2001579 ?auto_2001583 ) ) ( not ( = ?auto_2001579 ?auto_2001582 ) ) ( not ( = ?auto_2001579 ?auto_2001584 ) ) ( not ( = ?auto_2001579 ?auto_2001588 ) ) ( not ( = ?auto_2001580 ?auto_2001581 ) ) ( not ( = ?auto_2001580 ?auto_2001583 ) ) ( not ( = ?auto_2001580 ?auto_2001582 ) ) ( not ( = ?auto_2001580 ?auto_2001584 ) ) ( not ( = ?auto_2001580 ?auto_2001588 ) ) ( not ( = ?auto_2001581 ?auto_2001583 ) ) ( not ( = ?auto_2001581 ?auto_2001582 ) ) ( not ( = ?auto_2001581 ?auto_2001584 ) ) ( not ( = ?auto_2001581 ?auto_2001588 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001583 ?auto_2001582 ?auto_2001584 )
      ( MAKE-5CRATE-VERIFY ?auto_2001579 ?auto_2001580 ?auto_2001581 ?auto_2001583 ?auto_2001582 ?auto_2001584 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2001591 - SURFACE
      ?auto_2001592 - SURFACE
      ?auto_2001593 - SURFACE
      ?auto_2001595 - SURFACE
      ?auto_2001594 - SURFACE
      ?auto_2001596 - SURFACE
      ?auto_2001597 - SURFACE
    )
    :vars
    (
      ?auto_2001602 - HOIST
      ?auto_2001598 - PLACE
      ?auto_2001603 - PLACE
      ?auto_2001599 - HOIST
      ?auto_2001601 - SURFACE
      ?auto_2001600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001602 ?auto_2001598 ) ( IS-CRATE ?auto_2001597 ) ( not ( = ?auto_2001596 ?auto_2001597 ) ) ( not ( = ?auto_2001594 ?auto_2001596 ) ) ( not ( = ?auto_2001594 ?auto_2001597 ) ) ( not ( = ?auto_2001603 ?auto_2001598 ) ) ( HOIST-AT ?auto_2001599 ?auto_2001603 ) ( not ( = ?auto_2001602 ?auto_2001599 ) ) ( SURFACE-AT ?auto_2001597 ?auto_2001603 ) ( ON ?auto_2001597 ?auto_2001601 ) ( CLEAR ?auto_2001597 ) ( not ( = ?auto_2001596 ?auto_2001601 ) ) ( not ( = ?auto_2001597 ?auto_2001601 ) ) ( not ( = ?auto_2001594 ?auto_2001601 ) ) ( SURFACE-AT ?auto_2001594 ?auto_2001598 ) ( CLEAR ?auto_2001594 ) ( IS-CRATE ?auto_2001596 ) ( AVAILABLE ?auto_2001602 ) ( TRUCK-AT ?auto_2001600 ?auto_2001603 ) ( LIFTING ?auto_2001599 ?auto_2001596 ) ( ON ?auto_2001592 ?auto_2001591 ) ( ON ?auto_2001593 ?auto_2001592 ) ( ON ?auto_2001595 ?auto_2001593 ) ( ON ?auto_2001594 ?auto_2001595 ) ( not ( = ?auto_2001591 ?auto_2001592 ) ) ( not ( = ?auto_2001591 ?auto_2001593 ) ) ( not ( = ?auto_2001591 ?auto_2001595 ) ) ( not ( = ?auto_2001591 ?auto_2001594 ) ) ( not ( = ?auto_2001591 ?auto_2001596 ) ) ( not ( = ?auto_2001591 ?auto_2001597 ) ) ( not ( = ?auto_2001591 ?auto_2001601 ) ) ( not ( = ?auto_2001592 ?auto_2001593 ) ) ( not ( = ?auto_2001592 ?auto_2001595 ) ) ( not ( = ?auto_2001592 ?auto_2001594 ) ) ( not ( = ?auto_2001592 ?auto_2001596 ) ) ( not ( = ?auto_2001592 ?auto_2001597 ) ) ( not ( = ?auto_2001592 ?auto_2001601 ) ) ( not ( = ?auto_2001593 ?auto_2001595 ) ) ( not ( = ?auto_2001593 ?auto_2001594 ) ) ( not ( = ?auto_2001593 ?auto_2001596 ) ) ( not ( = ?auto_2001593 ?auto_2001597 ) ) ( not ( = ?auto_2001593 ?auto_2001601 ) ) ( not ( = ?auto_2001595 ?auto_2001594 ) ) ( not ( = ?auto_2001595 ?auto_2001596 ) ) ( not ( = ?auto_2001595 ?auto_2001597 ) ) ( not ( = ?auto_2001595 ?auto_2001601 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001594 ?auto_2001596 ?auto_2001597 )
      ( MAKE-6CRATE-VERIFY ?auto_2001591 ?auto_2001592 ?auto_2001593 ?auto_2001595 ?auto_2001594 ?auto_2001596 ?auto_2001597 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2001604 - SURFACE
      ?auto_2001605 - SURFACE
      ?auto_2001606 - SURFACE
      ?auto_2001608 - SURFACE
      ?auto_2001607 - SURFACE
      ?auto_2001609 - SURFACE
      ?auto_2001610 - SURFACE
      ?auto_2001611 - SURFACE
    )
    :vars
    (
      ?auto_2001616 - HOIST
      ?auto_2001612 - PLACE
      ?auto_2001617 - PLACE
      ?auto_2001613 - HOIST
      ?auto_2001615 - SURFACE
      ?auto_2001614 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001616 ?auto_2001612 ) ( IS-CRATE ?auto_2001611 ) ( not ( = ?auto_2001610 ?auto_2001611 ) ) ( not ( = ?auto_2001609 ?auto_2001610 ) ) ( not ( = ?auto_2001609 ?auto_2001611 ) ) ( not ( = ?auto_2001617 ?auto_2001612 ) ) ( HOIST-AT ?auto_2001613 ?auto_2001617 ) ( not ( = ?auto_2001616 ?auto_2001613 ) ) ( SURFACE-AT ?auto_2001611 ?auto_2001617 ) ( ON ?auto_2001611 ?auto_2001615 ) ( CLEAR ?auto_2001611 ) ( not ( = ?auto_2001610 ?auto_2001615 ) ) ( not ( = ?auto_2001611 ?auto_2001615 ) ) ( not ( = ?auto_2001609 ?auto_2001615 ) ) ( SURFACE-AT ?auto_2001609 ?auto_2001612 ) ( CLEAR ?auto_2001609 ) ( IS-CRATE ?auto_2001610 ) ( AVAILABLE ?auto_2001616 ) ( TRUCK-AT ?auto_2001614 ?auto_2001617 ) ( LIFTING ?auto_2001613 ?auto_2001610 ) ( ON ?auto_2001605 ?auto_2001604 ) ( ON ?auto_2001606 ?auto_2001605 ) ( ON ?auto_2001608 ?auto_2001606 ) ( ON ?auto_2001607 ?auto_2001608 ) ( ON ?auto_2001609 ?auto_2001607 ) ( not ( = ?auto_2001604 ?auto_2001605 ) ) ( not ( = ?auto_2001604 ?auto_2001606 ) ) ( not ( = ?auto_2001604 ?auto_2001608 ) ) ( not ( = ?auto_2001604 ?auto_2001607 ) ) ( not ( = ?auto_2001604 ?auto_2001609 ) ) ( not ( = ?auto_2001604 ?auto_2001610 ) ) ( not ( = ?auto_2001604 ?auto_2001611 ) ) ( not ( = ?auto_2001604 ?auto_2001615 ) ) ( not ( = ?auto_2001605 ?auto_2001606 ) ) ( not ( = ?auto_2001605 ?auto_2001608 ) ) ( not ( = ?auto_2001605 ?auto_2001607 ) ) ( not ( = ?auto_2001605 ?auto_2001609 ) ) ( not ( = ?auto_2001605 ?auto_2001610 ) ) ( not ( = ?auto_2001605 ?auto_2001611 ) ) ( not ( = ?auto_2001605 ?auto_2001615 ) ) ( not ( = ?auto_2001606 ?auto_2001608 ) ) ( not ( = ?auto_2001606 ?auto_2001607 ) ) ( not ( = ?auto_2001606 ?auto_2001609 ) ) ( not ( = ?auto_2001606 ?auto_2001610 ) ) ( not ( = ?auto_2001606 ?auto_2001611 ) ) ( not ( = ?auto_2001606 ?auto_2001615 ) ) ( not ( = ?auto_2001608 ?auto_2001607 ) ) ( not ( = ?auto_2001608 ?auto_2001609 ) ) ( not ( = ?auto_2001608 ?auto_2001610 ) ) ( not ( = ?auto_2001608 ?auto_2001611 ) ) ( not ( = ?auto_2001608 ?auto_2001615 ) ) ( not ( = ?auto_2001607 ?auto_2001609 ) ) ( not ( = ?auto_2001607 ?auto_2001610 ) ) ( not ( = ?auto_2001607 ?auto_2001611 ) ) ( not ( = ?auto_2001607 ?auto_2001615 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001609 ?auto_2001610 ?auto_2001611 )
      ( MAKE-7CRATE-VERIFY ?auto_2001604 ?auto_2001605 ?auto_2001606 ?auto_2001608 ?auto_2001607 ?auto_2001609 ?auto_2001610 ?auto_2001611 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2001618 - SURFACE
      ?auto_2001619 - SURFACE
      ?auto_2001620 - SURFACE
      ?auto_2001622 - SURFACE
      ?auto_2001621 - SURFACE
      ?auto_2001623 - SURFACE
      ?auto_2001624 - SURFACE
      ?auto_2001625 - SURFACE
      ?auto_2001626 - SURFACE
    )
    :vars
    (
      ?auto_2001631 - HOIST
      ?auto_2001627 - PLACE
      ?auto_2001632 - PLACE
      ?auto_2001628 - HOIST
      ?auto_2001630 - SURFACE
      ?auto_2001629 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001631 ?auto_2001627 ) ( IS-CRATE ?auto_2001626 ) ( not ( = ?auto_2001625 ?auto_2001626 ) ) ( not ( = ?auto_2001624 ?auto_2001625 ) ) ( not ( = ?auto_2001624 ?auto_2001626 ) ) ( not ( = ?auto_2001632 ?auto_2001627 ) ) ( HOIST-AT ?auto_2001628 ?auto_2001632 ) ( not ( = ?auto_2001631 ?auto_2001628 ) ) ( SURFACE-AT ?auto_2001626 ?auto_2001632 ) ( ON ?auto_2001626 ?auto_2001630 ) ( CLEAR ?auto_2001626 ) ( not ( = ?auto_2001625 ?auto_2001630 ) ) ( not ( = ?auto_2001626 ?auto_2001630 ) ) ( not ( = ?auto_2001624 ?auto_2001630 ) ) ( SURFACE-AT ?auto_2001624 ?auto_2001627 ) ( CLEAR ?auto_2001624 ) ( IS-CRATE ?auto_2001625 ) ( AVAILABLE ?auto_2001631 ) ( TRUCK-AT ?auto_2001629 ?auto_2001632 ) ( LIFTING ?auto_2001628 ?auto_2001625 ) ( ON ?auto_2001619 ?auto_2001618 ) ( ON ?auto_2001620 ?auto_2001619 ) ( ON ?auto_2001622 ?auto_2001620 ) ( ON ?auto_2001621 ?auto_2001622 ) ( ON ?auto_2001623 ?auto_2001621 ) ( ON ?auto_2001624 ?auto_2001623 ) ( not ( = ?auto_2001618 ?auto_2001619 ) ) ( not ( = ?auto_2001618 ?auto_2001620 ) ) ( not ( = ?auto_2001618 ?auto_2001622 ) ) ( not ( = ?auto_2001618 ?auto_2001621 ) ) ( not ( = ?auto_2001618 ?auto_2001623 ) ) ( not ( = ?auto_2001618 ?auto_2001624 ) ) ( not ( = ?auto_2001618 ?auto_2001625 ) ) ( not ( = ?auto_2001618 ?auto_2001626 ) ) ( not ( = ?auto_2001618 ?auto_2001630 ) ) ( not ( = ?auto_2001619 ?auto_2001620 ) ) ( not ( = ?auto_2001619 ?auto_2001622 ) ) ( not ( = ?auto_2001619 ?auto_2001621 ) ) ( not ( = ?auto_2001619 ?auto_2001623 ) ) ( not ( = ?auto_2001619 ?auto_2001624 ) ) ( not ( = ?auto_2001619 ?auto_2001625 ) ) ( not ( = ?auto_2001619 ?auto_2001626 ) ) ( not ( = ?auto_2001619 ?auto_2001630 ) ) ( not ( = ?auto_2001620 ?auto_2001622 ) ) ( not ( = ?auto_2001620 ?auto_2001621 ) ) ( not ( = ?auto_2001620 ?auto_2001623 ) ) ( not ( = ?auto_2001620 ?auto_2001624 ) ) ( not ( = ?auto_2001620 ?auto_2001625 ) ) ( not ( = ?auto_2001620 ?auto_2001626 ) ) ( not ( = ?auto_2001620 ?auto_2001630 ) ) ( not ( = ?auto_2001622 ?auto_2001621 ) ) ( not ( = ?auto_2001622 ?auto_2001623 ) ) ( not ( = ?auto_2001622 ?auto_2001624 ) ) ( not ( = ?auto_2001622 ?auto_2001625 ) ) ( not ( = ?auto_2001622 ?auto_2001626 ) ) ( not ( = ?auto_2001622 ?auto_2001630 ) ) ( not ( = ?auto_2001621 ?auto_2001623 ) ) ( not ( = ?auto_2001621 ?auto_2001624 ) ) ( not ( = ?auto_2001621 ?auto_2001625 ) ) ( not ( = ?auto_2001621 ?auto_2001626 ) ) ( not ( = ?auto_2001621 ?auto_2001630 ) ) ( not ( = ?auto_2001623 ?auto_2001624 ) ) ( not ( = ?auto_2001623 ?auto_2001625 ) ) ( not ( = ?auto_2001623 ?auto_2001626 ) ) ( not ( = ?auto_2001623 ?auto_2001630 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001624 ?auto_2001625 ?auto_2001626 )
      ( MAKE-8CRATE-VERIFY ?auto_2001618 ?auto_2001619 ?auto_2001620 ?auto_2001622 ?auto_2001621 ?auto_2001623 ?auto_2001624 ?auto_2001625 ?auto_2001626 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2001633 - SURFACE
      ?auto_2001634 - SURFACE
      ?auto_2001635 - SURFACE
      ?auto_2001637 - SURFACE
      ?auto_2001636 - SURFACE
      ?auto_2001638 - SURFACE
      ?auto_2001639 - SURFACE
      ?auto_2001640 - SURFACE
      ?auto_2001641 - SURFACE
      ?auto_2001642 - SURFACE
    )
    :vars
    (
      ?auto_2001647 - HOIST
      ?auto_2001643 - PLACE
      ?auto_2001648 - PLACE
      ?auto_2001644 - HOIST
      ?auto_2001646 - SURFACE
      ?auto_2001645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001647 ?auto_2001643 ) ( IS-CRATE ?auto_2001642 ) ( not ( = ?auto_2001641 ?auto_2001642 ) ) ( not ( = ?auto_2001640 ?auto_2001641 ) ) ( not ( = ?auto_2001640 ?auto_2001642 ) ) ( not ( = ?auto_2001648 ?auto_2001643 ) ) ( HOIST-AT ?auto_2001644 ?auto_2001648 ) ( not ( = ?auto_2001647 ?auto_2001644 ) ) ( SURFACE-AT ?auto_2001642 ?auto_2001648 ) ( ON ?auto_2001642 ?auto_2001646 ) ( CLEAR ?auto_2001642 ) ( not ( = ?auto_2001641 ?auto_2001646 ) ) ( not ( = ?auto_2001642 ?auto_2001646 ) ) ( not ( = ?auto_2001640 ?auto_2001646 ) ) ( SURFACE-AT ?auto_2001640 ?auto_2001643 ) ( CLEAR ?auto_2001640 ) ( IS-CRATE ?auto_2001641 ) ( AVAILABLE ?auto_2001647 ) ( TRUCK-AT ?auto_2001645 ?auto_2001648 ) ( LIFTING ?auto_2001644 ?auto_2001641 ) ( ON ?auto_2001634 ?auto_2001633 ) ( ON ?auto_2001635 ?auto_2001634 ) ( ON ?auto_2001637 ?auto_2001635 ) ( ON ?auto_2001636 ?auto_2001637 ) ( ON ?auto_2001638 ?auto_2001636 ) ( ON ?auto_2001639 ?auto_2001638 ) ( ON ?auto_2001640 ?auto_2001639 ) ( not ( = ?auto_2001633 ?auto_2001634 ) ) ( not ( = ?auto_2001633 ?auto_2001635 ) ) ( not ( = ?auto_2001633 ?auto_2001637 ) ) ( not ( = ?auto_2001633 ?auto_2001636 ) ) ( not ( = ?auto_2001633 ?auto_2001638 ) ) ( not ( = ?auto_2001633 ?auto_2001639 ) ) ( not ( = ?auto_2001633 ?auto_2001640 ) ) ( not ( = ?auto_2001633 ?auto_2001641 ) ) ( not ( = ?auto_2001633 ?auto_2001642 ) ) ( not ( = ?auto_2001633 ?auto_2001646 ) ) ( not ( = ?auto_2001634 ?auto_2001635 ) ) ( not ( = ?auto_2001634 ?auto_2001637 ) ) ( not ( = ?auto_2001634 ?auto_2001636 ) ) ( not ( = ?auto_2001634 ?auto_2001638 ) ) ( not ( = ?auto_2001634 ?auto_2001639 ) ) ( not ( = ?auto_2001634 ?auto_2001640 ) ) ( not ( = ?auto_2001634 ?auto_2001641 ) ) ( not ( = ?auto_2001634 ?auto_2001642 ) ) ( not ( = ?auto_2001634 ?auto_2001646 ) ) ( not ( = ?auto_2001635 ?auto_2001637 ) ) ( not ( = ?auto_2001635 ?auto_2001636 ) ) ( not ( = ?auto_2001635 ?auto_2001638 ) ) ( not ( = ?auto_2001635 ?auto_2001639 ) ) ( not ( = ?auto_2001635 ?auto_2001640 ) ) ( not ( = ?auto_2001635 ?auto_2001641 ) ) ( not ( = ?auto_2001635 ?auto_2001642 ) ) ( not ( = ?auto_2001635 ?auto_2001646 ) ) ( not ( = ?auto_2001637 ?auto_2001636 ) ) ( not ( = ?auto_2001637 ?auto_2001638 ) ) ( not ( = ?auto_2001637 ?auto_2001639 ) ) ( not ( = ?auto_2001637 ?auto_2001640 ) ) ( not ( = ?auto_2001637 ?auto_2001641 ) ) ( not ( = ?auto_2001637 ?auto_2001642 ) ) ( not ( = ?auto_2001637 ?auto_2001646 ) ) ( not ( = ?auto_2001636 ?auto_2001638 ) ) ( not ( = ?auto_2001636 ?auto_2001639 ) ) ( not ( = ?auto_2001636 ?auto_2001640 ) ) ( not ( = ?auto_2001636 ?auto_2001641 ) ) ( not ( = ?auto_2001636 ?auto_2001642 ) ) ( not ( = ?auto_2001636 ?auto_2001646 ) ) ( not ( = ?auto_2001638 ?auto_2001639 ) ) ( not ( = ?auto_2001638 ?auto_2001640 ) ) ( not ( = ?auto_2001638 ?auto_2001641 ) ) ( not ( = ?auto_2001638 ?auto_2001642 ) ) ( not ( = ?auto_2001638 ?auto_2001646 ) ) ( not ( = ?auto_2001639 ?auto_2001640 ) ) ( not ( = ?auto_2001639 ?auto_2001641 ) ) ( not ( = ?auto_2001639 ?auto_2001642 ) ) ( not ( = ?auto_2001639 ?auto_2001646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001640 ?auto_2001641 ?auto_2001642 )
      ( MAKE-9CRATE-VERIFY ?auto_2001633 ?auto_2001634 ?auto_2001635 ?auto_2001637 ?auto_2001636 ?auto_2001638 ?auto_2001639 ?auto_2001640 ?auto_2001641 ?auto_2001642 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2001649 - SURFACE
      ?auto_2001650 - SURFACE
      ?auto_2001651 - SURFACE
      ?auto_2001653 - SURFACE
      ?auto_2001652 - SURFACE
      ?auto_2001654 - SURFACE
      ?auto_2001655 - SURFACE
      ?auto_2001656 - SURFACE
      ?auto_2001657 - SURFACE
      ?auto_2001658 - SURFACE
      ?auto_2001659 - SURFACE
    )
    :vars
    (
      ?auto_2001664 - HOIST
      ?auto_2001660 - PLACE
      ?auto_2001665 - PLACE
      ?auto_2001661 - HOIST
      ?auto_2001663 - SURFACE
      ?auto_2001662 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001664 ?auto_2001660 ) ( IS-CRATE ?auto_2001659 ) ( not ( = ?auto_2001658 ?auto_2001659 ) ) ( not ( = ?auto_2001657 ?auto_2001658 ) ) ( not ( = ?auto_2001657 ?auto_2001659 ) ) ( not ( = ?auto_2001665 ?auto_2001660 ) ) ( HOIST-AT ?auto_2001661 ?auto_2001665 ) ( not ( = ?auto_2001664 ?auto_2001661 ) ) ( SURFACE-AT ?auto_2001659 ?auto_2001665 ) ( ON ?auto_2001659 ?auto_2001663 ) ( CLEAR ?auto_2001659 ) ( not ( = ?auto_2001658 ?auto_2001663 ) ) ( not ( = ?auto_2001659 ?auto_2001663 ) ) ( not ( = ?auto_2001657 ?auto_2001663 ) ) ( SURFACE-AT ?auto_2001657 ?auto_2001660 ) ( CLEAR ?auto_2001657 ) ( IS-CRATE ?auto_2001658 ) ( AVAILABLE ?auto_2001664 ) ( TRUCK-AT ?auto_2001662 ?auto_2001665 ) ( LIFTING ?auto_2001661 ?auto_2001658 ) ( ON ?auto_2001650 ?auto_2001649 ) ( ON ?auto_2001651 ?auto_2001650 ) ( ON ?auto_2001653 ?auto_2001651 ) ( ON ?auto_2001652 ?auto_2001653 ) ( ON ?auto_2001654 ?auto_2001652 ) ( ON ?auto_2001655 ?auto_2001654 ) ( ON ?auto_2001656 ?auto_2001655 ) ( ON ?auto_2001657 ?auto_2001656 ) ( not ( = ?auto_2001649 ?auto_2001650 ) ) ( not ( = ?auto_2001649 ?auto_2001651 ) ) ( not ( = ?auto_2001649 ?auto_2001653 ) ) ( not ( = ?auto_2001649 ?auto_2001652 ) ) ( not ( = ?auto_2001649 ?auto_2001654 ) ) ( not ( = ?auto_2001649 ?auto_2001655 ) ) ( not ( = ?auto_2001649 ?auto_2001656 ) ) ( not ( = ?auto_2001649 ?auto_2001657 ) ) ( not ( = ?auto_2001649 ?auto_2001658 ) ) ( not ( = ?auto_2001649 ?auto_2001659 ) ) ( not ( = ?auto_2001649 ?auto_2001663 ) ) ( not ( = ?auto_2001650 ?auto_2001651 ) ) ( not ( = ?auto_2001650 ?auto_2001653 ) ) ( not ( = ?auto_2001650 ?auto_2001652 ) ) ( not ( = ?auto_2001650 ?auto_2001654 ) ) ( not ( = ?auto_2001650 ?auto_2001655 ) ) ( not ( = ?auto_2001650 ?auto_2001656 ) ) ( not ( = ?auto_2001650 ?auto_2001657 ) ) ( not ( = ?auto_2001650 ?auto_2001658 ) ) ( not ( = ?auto_2001650 ?auto_2001659 ) ) ( not ( = ?auto_2001650 ?auto_2001663 ) ) ( not ( = ?auto_2001651 ?auto_2001653 ) ) ( not ( = ?auto_2001651 ?auto_2001652 ) ) ( not ( = ?auto_2001651 ?auto_2001654 ) ) ( not ( = ?auto_2001651 ?auto_2001655 ) ) ( not ( = ?auto_2001651 ?auto_2001656 ) ) ( not ( = ?auto_2001651 ?auto_2001657 ) ) ( not ( = ?auto_2001651 ?auto_2001658 ) ) ( not ( = ?auto_2001651 ?auto_2001659 ) ) ( not ( = ?auto_2001651 ?auto_2001663 ) ) ( not ( = ?auto_2001653 ?auto_2001652 ) ) ( not ( = ?auto_2001653 ?auto_2001654 ) ) ( not ( = ?auto_2001653 ?auto_2001655 ) ) ( not ( = ?auto_2001653 ?auto_2001656 ) ) ( not ( = ?auto_2001653 ?auto_2001657 ) ) ( not ( = ?auto_2001653 ?auto_2001658 ) ) ( not ( = ?auto_2001653 ?auto_2001659 ) ) ( not ( = ?auto_2001653 ?auto_2001663 ) ) ( not ( = ?auto_2001652 ?auto_2001654 ) ) ( not ( = ?auto_2001652 ?auto_2001655 ) ) ( not ( = ?auto_2001652 ?auto_2001656 ) ) ( not ( = ?auto_2001652 ?auto_2001657 ) ) ( not ( = ?auto_2001652 ?auto_2001658 ) ) ( not ( = ?auto_2001652 ?auto_2001659 ) ) ( not ( = ?auto_2001652 ?auto_2001663 ) ) ( not ( = ?auto_2001654 ?auto_2001655 ) ) ( not ( = ?auto_2001654 ?auto_2001656 ) ) ( not ( = ?auto_2001654 ?auto_2001657 ) ) ( not ( = ?auto_2001654 ?auto_2001658 ) ) ( not ( = ?auto_2001654 ?auto_2001659 ) ) ( not ( = ?auto_2001654 ?auto_2001663 ) ) ( not ( = ?auto_2001655 ?auto_2001656 ) ) ( not ( = ?auto_2001655 ?auto_2001657 ) ) ( not ( = ?auto_2001655 ?auto_2001658 ) ) ( not ( = ?auto_2001655 ?auto_2001659 ) ) ( not ( = ?auto_2001655 ?auto_2001663 ) ) ( not ( = ?auto_2001656 ?auto_2001657 ) ) ( not ( = ?auto_2001656 ?auto_2001658 ) ) ( not ( = ?auto_2001656 ?auto_2001659 ) ) ( not ( = ?auto_2001656 ?auto_2001663 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001657 ?auto_2001658 ?auto_2001659 )
      ( MAKE-10CRATE-VERIFY ?auto_2001649 ?auto_2001650 ?auto_2001651 ?auto_2001653 ?auto_2001652 ?auto_2001654 ?auto_2001655 ?auto_2001656 ?auto_2001657 ?auto_2001658 ?auto_2001659 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2001666 - SURFACE
      ?auto_2001667 - SURFACE
      ?auto_2001668 - SURFACE
      ?auto_2001670 - SURFACE
      ?auto_2001669 - SURFACE
      ?auto_2001671 - SURFACE
      ?auto_2001672 - SURFACE
      ?auto_2001673 - SURFACE
      ?auto_2001674 - SURFACE
      ?auto_2001675 - SURFACE
      ?auto_2001676 - SURFACE
      ?auto_2001677 - SURFACE
    )
    :vars
    (
      ?auto_2001682 - HOIST
      ?auto_2001678 - PLACE
      ?auto_2001683 - PLACE
      ?auto_2001679 - HOIST
      ?auto_2001681 - SURFACE
      ?auto_2001680 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001682 ?auto_2001678 ) ( IS-CRATE ?auto_2001677 ) ( not ( = ?auto_2001676 ?auto_2001677 ) ) ( not ( = ?auto_2001675 ?auto_2001676 ) ) ( not ( = ?auto_2001675 ?auto_2001677 ) ) ( not ( = ?auto_2001683 ?auto_2001678 ) ) ( HOIST-AT ?auto_2001679 ?auto_2001683 ) ( not ( = ?auto_2001682 ?auto_2001679 ) ) ( SURFACE-AT ?auto_2001677 ?auto_2001683 ) ( ON ?auto_2001677 ?auto_2001681 ) ( CLEAR ?auto_2001677 ) ( not ( = ?auto_2001676 ?auto_2001681 ) ) ( not ( = ?auto_2001677 ?auto_2001681 ) ) ( not ( = ?auto_2001675 ?auto_2001681 ) ) ( SURFACE-AT ?auto_2001675 ?auto_2001678 ) ( CLEAR ?auto_2001675 ) ( IS-CRATE ?auto_2001676 ) ( AVAILABLE ?auto_2001682 ) ( TRUCK-AT ?auto_2001680 ?auto_2001683 ) ( LIFTING ?auto_2001679 ?auto_2001676 ) ( ON ?auto_2001667 ?auto_2001666 ) ( ON ?auto_2001668 ?auto_2001667 ) ( ON ?auto_2001670 ?auto_2001668 ) ( ON ?auto_2001669 ?auto_2001670 ) ( ON ?auto_2001671 ?auto_2001669 ) ( ON ?auto_2001672 ?auto_2001671 ) ( ON ?auto_2001673 ?auto_2001672 ) ( ON ?auto_2001674 ?auto_2001673 ) ( ON ?auto_2001675 ?auto_2001674 ) ( not ( = ?auto_2001666 ?auto_2001667 ) ) ( not ( = ?auto_2001666 ?auto_2001668 ) ) ( not ( = ?auto_2001666 ?auto_2001670 ) ) ( not ( = ?auto_2001666 ?auto_2001669 ) ) ( not ( = ?auto_2001666 ?auto_2001671 ) ) ( not ( = ?auto_2001666 ?auto_2001672 ) ) ( not ( = ?auto_2001666 ?auto_2001673 ) ) ( not ( = ?auto_2001666 ?auto_2001674 ) ) ( not ( = ?auto_2001666 ?auto_2001675 ) ) ( not ( = ?auto_2001666 ?auto_2001676 ) ) ( not ( = ?auto_2001666 ?auto_2001677 ) ) ( not ( = ?auto_2001666 ?auto_2001681 ) ) ( not ( = ?auto_2001667 ?auto_2001668 ) ) ( not ( = ?auto_2001667 ?auto_2001670 ) ) ( not ( = ?auto_2001667 ?auto_2001669 ) ) ( not ( = ?auto_2001667 ?auto_2001671 ) ) ( not ( = ?auto_2001667 ?auto_2001672 ) ) ( not ( = ?auto_2001667 ?auto_2001673 ) ) ( not ( = ?auto_2001667 ?auto_2001674 ) ) ( not ( = ?auto_2001667 ?auto_2001675 ) ) ( not ( = ?auto_2001667 ?auto_2001676 ) ) ( not ( = ?auto_2001667 ?auto_2001677 ) ) ( not ( = ?auto_2001667 ?auto_2001681 ) ) ( not ( = ?auto_2001668 ?auto_2001670 ) ) ( not ( = ?auto_2001668 ?auto_2001669 ) ) ( not ( = ?auto_2001668 ?auto_2001671 ) ) ( not ( = ?auto_2001668 ?auto_2001672 ) ) ( not ( = ?auto_2001668 ?auto_2001673 ) ) ( not ( = ?auto_2001668 ?auto_2001674 ) ) ( not ( = ?auto_2001668 ?auto_2001675 ) ) ( not ( = ?auto_2001668 ?auto_2001676 ) ) ( not ( = ?auto_2001668 ?auto_2001677 ) ) ( not ( = ?auto_2001668 ?auto_2001681 ) ) ( not ( = ?auto_2001670 ?auto_2001669 ) ) ( not ( = ?auto_2001670 ?auto_2001671 ) ) ( not ( = ?auto_2001670 ?auto_2001672 ) ) ( not ( = ?auto_2001670 ?auto_2001673 ) ) ( not ( = ?auto_2001670 ?auto_2001674 ) ) ( not ( = ?auto_2001670 ?auto_2001675 ) ) ( not ( = ?auto_2001670 ?auto_2001676 ) ) ( not ( = ?auto_2001670 ?auto_2001677 ) ) ( not ( = ?auto_2001670 ?auto_2001681 ) ) ( not ( = ?auto_2001669 ?auto_2001671 ) ) ( not ( = ?auto_2001669 ?auto_2001672 ) ) ( not ( = ?auto_2001669 ?auto_2001673 ) ) ( not ( = ?auto_2001669 ?auto_2001674 ) ) ( not ( = ?auto_2001669 ?auto_2001675 ) ) ( not ( = ?auto_2001669 ?auto_2001676 ) ) ( not ( = ?auto_2001669 ?auto_2001677 ) ) ( not ( = ?auto_2001669 ?auto_2001681 ) ) ( not ( = ?auto_2001671 ?auto_2001672 ) ) ( not ( = ?auto_2001671 ?auto_2001673 ) ) ( not ( = ?auto_2001671 ?auto_2001674 ) ) ( not ( = ?auto_2001671 ?auto_2001675 ) ) ( not ( = ?auto_2001671 ?auto_2001676 ) ) ( not ( = ?auto_2001671 ?auto_2001677 ) ) ( not ( = ?auto_2001671 ?auto_2001681 ) ) ( not ( = ?auto_2001672 ?auto_2001673 ) ) ( not ( = ?auto_2001672 ?auto_2001674 ) ) ( not ( = ?auto_2001672 ?auto_2001675 ) ) ( not ( = ?auto_2001672 ?auto_2001676 ) ) ( not ( = ?auto_2001672 ?auto_2001677 ) ) ( not ( = ?auto_2001672 ?auto_2001681 ) ) ( not ( = ?auto_2001673 ?auto_2001674 ) ) ( not ( = ?auto_2001673 ?auto_2001675 ) ) ( not ( = ?auto_2001673 ?auto_2001676 ) ) ( not ( = ?auto_2001673 ?auto_2001677 ) ) ( not ( = ?auto_2001673 ?auto_2001681 ) ) ( not ( = ?auto_2001674 ?auto_2001675 ) ) ( not ( = ?auto_2001674 ?auto_2001676 ) ) ( not ( = ?auto_2001674 ?auto_2001677 ) ) ( not ( = ?auto_2001674 ?auto_2001681 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001675 ?auto_2001676 ?auto_2001677 )
      ( MAKE-11CRATE-VERIFY ?auto_2001666 ?auto_2001667 ?auto_2001668 ?auto_2001670 ?auto_2001669 ?auto_2001671 ?auto_2001672 ?auto_2001673 ?auto_2001674 ?auto_2001675 ?auto_2001676 ?auto_2001677 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2001684 - SURFACE
      ?auto_2001685 - SURFACE
      ?auto_2001686 - SURFACE
      ?auto_2001688 - SURFACE
      ?auto_2001687 - SURFACE
      ?auto_2001689 - SURFACE
      ?auto_2001690 - SURFACE
      ?auto_2001691 - SURFACE
      ?auto_2001692 - SURFACE
      ?auto_2001693 - SURFACE
      ?auto_2001694 - SURFACE
      ?auto_2001695 - SURFACE
      ?auto_2001696 - SURFACE
    )
    :vars
    (
      ?auto_2001701 - HOIST
      ?auto_2001697 - PLACE
      ?auto_2001702 - PLACE
      ?auto_2001698 - HOIST
      ?auto_2001700 - SURFACE
      ?auto_2001699 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001701 ?auto_2001697 ) ( IS-CRATE ?auto_2001696 ) ( not ( = ?auto_2001695 ?auto_2001696 ) ) ( not ( = ?auto_2001694 ?auto_2001695 ) ) ( not ( = ?auto_2001694 ?auto_2001696 ) ) ( not ( = ?auto_2001702 ?auto_2001697 ) ) ( HOIST-AT ?auto_2001698 ?auto_2001702 ) ( not ( = ?auto_2001701 ?auto_2001698 ) ) ( SURFACE-AT ?auto_2001696 ?auto_2001702 ) ( ON ?auto_2001696 ?auto_2001700 ) ( CLEAR ?auto_2001696 ) ( not ( = ?auto_2001695 ?auto_2001700 ) ) ( not ( = ?auto_2001696 ?auto_2001700 ) ) ( not ( = ?auto_2001694 ?auto_2001700 ) ) ( SURFACE-AT ?auto_2001694 ?auto_2001697 ) ( CLEAR ?auto_2001694 ) ( IS-CRATE ?auto_2001695 ) ( AVAILABLE ?auto_2001701 ) ( TRUCK-AT ?auto_2001699 ?auto_2001702 ) ( LIFTING ?auto_2001698 ?auto_2001695 ) ( ON ?auto_2001685 ?auto_2001684 ) ( ON ?auto_2001686 ?auto_2001685 ) ( ON ?auto_2001688 ?auto_2001686 ) ( ON ?auto_2001687 ?auto_2001688 ) ( ON ?auto_2001689 ?auto_2001687 ) ( ON ?auto_2001690 ?auto_2001689 ) ( ON ?auto_2001691 ?auto_2001690 ) ( ON ?auto_2001692 ?auto_2001691 ) ( ON ?auto_2001693 ?auto_2001692 ) ( ON ?auto_2001694 ?auto_2001693 ) ( not ( = ?auto_2001684 ?auto_2001685 ) ) ( not ( = ?auto_2001684 ?auto_2001686 ) ) ( not ( = ?auto_2001684 ?auto_2001688 ) ) ( not ( = ?auto_2001684 ?auto_2001687 ) ) ( not ( = ?auto_2001684 ?auto_2001689 ) ) ( not ( = ?auto_2001684 ?auto_2001690 ) ) ( not ( = ?auto_2001684 ?auto_2001691 ) ) ( not ( = ?auto_2001684 ?auto_2001692 ) ) ( not ( = ?auto_2001684 ?auto_2001693 ) ) ( not ( = ?auto_2001684 ?auto_2001694 ) ) ( not ( = ?auto_2001684 ?auto_2001695 ) ) ( not ( = ?auto_2001684 ?auto_2001696 ) ) ( not ( = ?auto_2001684 ?auto_2001700 ) ) ( not ( = ?auto_2001685 ?auto_2001686 ) ) ( not ( = ?auto_2001685 ?auto_2001688 ) ) ( not ( = ?auto_2001685 ?auto_2001687 ) ) ( not ( = ?auto_2001685 ?auto_2001689 ) ) ( not ( = ?auto_2001685 ?auto_2001690 ) ) ( not ( = ?auto_2001685 ?auto_2001691 ) ) ( not ( = ?auto_2001685 ?auto_2001692 ) ) ( not ( = ?auto_2001685 ?auto_2001693 ) ) ( not ( = ?auto_2001685 ?auto_2001694 ) ) ( not ( = ?auto_2001685 ?auto_2001695 ) ) ( not ( = ?auto_2001685 ?auto_2001696 ) ) ( not ( = ?auto_2001685 ?auto_2001700 ) ) ( not ( = ?auto_2001686 ?auto_2001688 ) ) ( not ( = ?auto_2001686 ?auto_2001687 ) ) ( not ( = ?auto_2001686 ?auto_2001689 ) ) ( not ( = ?auto_2001686 ?auto_2001690 ) ) ( not ( = ?auto_2001686 ?auto_2001691 ) ) ( not ( = ?auto_2001686 ?auto_2001692 ) ) ( not ( = ?auto_2001686 ?auto_2001693 ) ) ( not ( = ?auto_2001686 ?auto_2001694 ) ) ( not ( = ?auto_2001686 ?auto_2001695 ) ) ( not ( = ?auto_2001686 ?auto_2001696 ) ) ( not ( = ?auto_2001686 ?auto_2001700 ) ) ( not ( = ?auto_2001688 ?auto_2001687 ) ) ( not ( = ?auto_2001688 ?auto_2001689 ) ) ( not ( = ?auto_2001688 ?auto_2001690 ) ) ( not ( = ?auto_2001688 ?auto_2001691 ) ) ( not ( = ?auto_2001688 ?auto_2001692 ) ) ( not ( = ?auto_2001688 ?auto_2001693 ) ) ( not ( = ?auto_2001688 ?auto_2001694 ) ) ( not ( = ?auto_2001688 ?auto_2001695 ) ) ( not ( = ?auto_2001688 ?auto_2001696 ) ) ( not ( = ?auto_2001688 ?auto_2001700 ) ) ( not ( = ?auto_2001687 ?auto_2001689 ) ) ( not ( = ?auto_2001687 ?auto_2001690 ) ) ( not ( = ?auto_2001687 ?auto_2001691 ) ) ( not ( = ?auto_2001687 ?auto_2001692 ) ) ( not ( = ?auto_2001687 ?auto_2001693 ) ) ( not ( = ?auto_2001687 ?auto_2001694 ) ) ( not ( = ?auto_2001687 ?auto_2001695 ) ) ( not ( = ?auto_2001687 ?auto_2001696 ) ) ( not ( = ?auto_2001687 ?auto_2001700 ) ) ( not ( = ?auto_2001689 ?auto_2001690 ) ) ( not ( = ?auto_2001689 ?auto_2001691 ) ) ( not ( = ?auto_2001689 ?auto_2001692 ) ) ( not ( = ?auto_2001689 ?auto_2001693 ) ) ( not ( = ?auto_2001689 ?auto_2001694 ) ) ( not ( = ?auto_2001689 ?auto_2001695 ) ) ( not ( = ?auto_2001689 ?auto_2001696 ) ) ( not ( = ?auto_2001689 ?auto_2001700 ) ) ( not ( = ?auto_2001690 ?auto_2001691 ) ) ( not ( = ?auto_2001690 ?auto_2001692 ) ) ( not ( = ?auto_2001690 ?auto_2001693 ) ) ( not ( = ?auto_2001690 ?auto_2001694 ) ) ( not ( = ?auto_2001690 ?auto_2001695 ) ) ( not ( = ?auto_2001690 ?auto_2001696 ) ) ( not ( = ?auto_2001690 ?auto_2001700 ) ) ( not ( = ?auto_2001691 ?auto_2001692 ) ) ( not ( = ?auto_2001691 ?auto_2001693 ) ) ( not ( = ?auto_2001691 ?auto_2001694 ) ) ( not ( = ?auto_2001691 ?auto_2001695 ) ) ( not ( = ?auto_2001691 ?auto_2001696 ) ) ( not ( = ?auto_2001691 ?auto_2001700 ) ) ( not ( = ?auto_2001692 ?auto_2001693 ) ) ( not ( = ?auto_2001692 ?auto_2001694 ) ) ( not ( = ?auto_2001692 ?auto_2001695 ) ) ( not ( = ?auto_2001692 ?auto_2001696 ) ) ( not ( = ?auto_2001692 ?auto_2001700 ) ) ( not ( = ?auto_2001693 ?auto_2001694 ) ) ( not ( = ?auto_2001693 ?auto_2001695 ) ) ( not ( = ?auto_2001693 ?auto_2001696 ) ) ( not ( = ?auto_2001693 ?auto_2001700 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001694 ?auto_2001695 ?auto_2001696 )
      ( MAKE-12CRATE-VERIFY ?auto_2001684 ?auto_2001685 ?auto_2001686 ?auto_2001688 ?auto_2001687 ?auto_2001689 ?auto_2001690 ?auto_2001691 ?auto_2001692 ?auto_2001693 ?auto_2001694 ?auto_2001695 ?auto_2001696 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2001703 - SURFACE
      ?auto_2001704 - SURFACE
      ?auto_2001705 - SURFACE
      ?auto_2001707 - SURFACE
      ?auto_2001706 - SURFACE
      ?auto_2001708 - SURFACE
      ?auto_2001709 - SURFACE
      ?auto_2001710 - SURFACE
      ?auto_2001711 - SURFACE
      ?auto_2001712 - SURFACE
      ?auto_2001713 - SURFACE
      ?auto_2001714 - SURFACE
      ?auto_2001715 - SURFACE
      ?auto_2001716 - SURFACE
    )
    :vars
    (
      ?auto_2001721 - HOIST
      ?auto_2001717 - PLACE
      ?auto_2001722 - PLACE
      ?auto_2001718 - HOIST
      ?auto_2001720 - SURFACE
      ?auto_2001719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001721 ?auto_2001717 ) ( IS-CRATE ?auto_2001716 ) ( not ( = ?auto_2001715 ?auto_2001716 ) ) ( not ( = ?auto_2001714 ?auto_2001715 ) ) ( not ( = ?auto_2001714 ?auto_2001716 ) ) ( not ( = ?auto_2001722 ?auto_2001717 ) ) ( HOIST-AT ?auto_2001718 ?auto_2001722 ) ( not ( = ?auto_2001721 ?auto_2001718 ) ) ( SURFACE-AT ?auto_2001716 ?auto_2001722 ) ( ON ?auto_2001716 ?auto_2001720 ) ( CLEAR ?auto_2001716 ) ( not ( = ?auto_2001715 ?auto_2001720 ) ) ( not ( = ?auto_2001716 ?auto_2001720 ) ) ( not ( = ?auto_2001714 ?auto_2001720 ) ) ( SURFACE-AT ?auto_2001714 ?auto_2001717 ) ( CLEAR ?auto_2001714 ) ( IS-CRATE ?auto_2001715 ) ( AVAILABLE ?auto_2001721 ) ( TRUCK-AT ?auto_2001719 ?auto_2001722 ) ( LIFTING ?auto_2001718 ?auto_2001715 ) ( ON ?auto_2001704 ?auto_2001703 ) ( ON ?auto_2001705 ?auto_2001704 ) ( ON ?auto_2001707 ?auto_2001705 ) ( ON ?auto_2001706 ?auto_2001707 ) ( ON ?auto_2001708 ?auto_2001706 ) ( ON ?auto_2001709 ?auto_2001708 ) ( ON ?auto_2001710 ?auto_2001709 ) ( ON ?auto_2001711 ?auto_2001710 ) ( ON ?auto_2001712 ?auto_2001711 ) ( ON ?auto_2001713 ?auto_2001712 ) ( ON ?auto_2001714 ?auto_2001713 ) ( not ( = ?auto_2001703 ?auto_2001704 ) ) ( not ( = ?auto_2001703 ?auto_2001705 ) ) ( not ( = ?auto_2001703 ?auto_2001707 ) ) ( not ( = ?auto_2001703 ?auto_2001706 ) ) ( not ( = ?auto_2001703 ?auto_2001708 ) ) ( not ( = ?auto_2001703 ?auto_2001709 ) ) ( not ( = ?auto_2001703 ?auto_2001710 ) ) ( not ( = ?auto_2001703 ?auto_2001711 ) ) ( not ( = ?auto_2001703 ?auto_2001712 ) ) ( not ( = ?auto_2001703 ?auto_2001713 ) ) ( not ( = ?auto_2001703 ?auto_2001714 ) ) ( not ( = ?auto_2001703 ?auto_2001715 ) ) ( not ( = ?auto_2001703 ?auto_2001716 ) ) ( not ( = ?auto_2001703 ?auto_2001720 ) ) ( not ( = ?auto_2001704 ?auto_2001705 ) ) ( not ( = ?auto_2001704 ?auto_2001707 ) ) ( not ( = ?auto_2001704 ?auto_2001706 ) ) ( not ( = ?auto_2001704 ?auto_2001708 ) ) ( not ( = ?auto_2001704 ?auto_2001709 ) ) ( not ( = ?auto_2001704 ?auto_2001710 ) ) ( not ( = ?auto_2001704 ?auto_2001711 ) ) ( not ( = ?auto_2001704 ?auto_2001712 ) ) ( not ( = ?auto_2001704 ?auto_2001713 ) ) ( not ( = ?auto_2001704 ?auto_2001714 ) ) ( not ( = ?auto_2001704 ?auto_2001715 ) ) ( not ( = ?auto_2001704 ?auto_2001716 ) ) ( not ( = ?auto_2001704 ?auto_2001720 ) ) ( not ( = ?auto_2001705 ?auto_2001707 ) ) ( not ( = ?auto_2001705 ?auto_2001706 ) ) ( not ( = ?auto_2001705 ?auto_2001708 ) ) ( not ( = ?auto_2001705 ?auto_2001709 ) ) ( not ( = ?auto_2001705 ?auto_2001710 ) ) ( not ( = ?auto_2001705 ?auto_2001711 ) ) ( not ( = ?auto_2001705 ?auto_2001712 ) ) ( not ( = ?auto_2001705 ?auto_2001713 ) ) ( not ( = ?auto_2001705 ?auto_2001714 ) ) ( not ( = ?auto_2001705 ?auto_2001715 ) ) ( not ( = ?auto_2001705 ?auto_2001716 ) ) ( not ( = ?auto_2001705 ?auto_2001720 ) ) ( not ( = ?auto_2001707 ?auto_2001706 ) ) ( not ( = ?auto_2001707 ?auto_2001708 ) ) ( not ( = ?auto_2001707 ?auto_2001709 ) ) ( not ( = ?auto_2001707 ?auto_2001710 ) ) ( not ( = ?auto_2001707 ?auto_2001711 ) ) ( not ( = ?auto_2001707 ?auto_2001712 ) ) ( not ( = ?auto_2001707 ?auto_2001713 ) ) ( not ( = ?auto_2001707 ?auto_2001714 ) ) ( not ( = ?auto_2001707 ?auto_2001715 ) ) ( not ( = ?auto_2001707 ?auto_2001716 ) ) ( not ( = ?auto_2001707 ?auto_2001720 ) ) ( not ( = ?auto_2001706 ?auto_2001708 ) ) ( not ( = ?auto_2001706 ?auto_2001709 ) ) ( not ( = ?auto_2001706 ?auto_2001710 ) ) ( not ( = ?auto_2001706 ?auto_2001711 ) ) ( not ( = ?auto_2001706 ?auto_2001712 ) ) ( not ( = ?auto_2001706 ?auto_2001713 ) ) ( not ( = ?auto_2001706 ?auto_2001714 ) ) ( not ( = ?auto_2001706 ?auto_2001715 ) ) ( not ( = ?auto_2001706 ?auto_2001716 ) ) ( not ( = ?auto_2001706 ?auto_2001720 ) ) ( not ( = ?auto_2001708 ?auto_2001709 ) ) ( not ( = ?auto_2001708 ?auto_2001710 ) ) ( not ( = ?auto_2001708 ?auto_2001711 ) ) ( not ( = ?auto_2001708 ?auto_2001712 ) ) ( not ( = ?auto_2001708 ?auto_2001713 ) ) ( not ( = ?auto_2001708 ?auto_2001714 ) ) ( not ( = ?auto_2001708 ?auto_2001715 ) ) ( not ( = ?auto_2001708 ?auto_2001716 ) ) ( not ( = ?auto_2001708 ?auto_2001720 ) ) ( not ( = ?auto_2001709 ?auto_2001710 ) ) ( not ( = ?auto_2001709 ?auto_2001711 ) ) ( not ( = ?auto_2001709 ?auto_2001712 ) ) ( not ( = ?auto_2001709 ?auto_2001713 ) ) ( not ( = ?auto_2001709 ?auto_2001714 ) ) ( not ( = ?auto_2001709 ?auto_2001715 ) ) ( not ( = ?auto_2001709 ?auto_2001716 ) ) ( not ( = ?auto_2001709 ?auto_2001720 ) ) ( not ( = ?auto_2001710 ?auto_2001711 ) ) ( not ( = ?auto_2001710 ?auto_2001712 ) ) ( not ( = ?auto_2001710 ?auto_2001713 ) ) ( not ( = ?auto_2001710 ?auto_2001714 ) ) ( not ( = ?auto_2001710 ?auto_2001715 ) ) ( not ( = ?auto_2001710 ?auto_2001716 ) ) ( not ( = ?auto_2001710 ?auto_2001720 ) ) ( not ( = ?auto_2001711 ?auto_2001712 ) ) ( not ( = ?auto_2001711 ?auto_2001713 ) ) ( not ( = ?auto_2001711 ?auto_2001714 ) ) ( not ( = ?auto_2001711 ?auto_2001715 ) ) ( not ( = ?auto_2001711 ?auto_2001716 ) ) ( not ( = ?auto_2001711 ?auto_2001720 ) ) ( not ( = ?auto_2001712 ?auto_2001713 ) ) ( not ( = ?auto_2001712 ?auto_2001714 ) ) ( not ( = ?auto_2001712 ?auto_2001715 ) ) ( not ( = ?auto_2001712 ?auto_2001716 ) ) ( not ( = ?auto_2001712 ?auto_2001720 ) ) ( not ( = ?auto_2001713 ?auto_2001714 ) ) ( not ( = ?auto_2001713 ?auto_2001715 ) ) ( not ( = ?auto_2001713 ?auto_2001716 ) ) ( not ( = ?auto_2001713 ?auto_2001720 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001714 ?auto_2001715 ?auto_2001716 )
      ( MAKE-13CRATE-VERIFY ?auto_2001703 ?auto_2001704 ?auto_2001705 ?auto_2001707 ?auto_2001706 ?auto_2001708 ?auto_2001709 ?auto_2001710 ?auto_2001711 ?auto_2001712 ?auto_2001713 ?auto_2001714 ?auto_2001715 ?auto_2001716 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2001723 - SURFACE
      ?auto_2001724 - SURFACE
      ?auto_2001725 - SURFACE
      ?auto_2001727 - SURFACE
      ?auto_2001726 - SURFACE
      ?auto_2001728 - SURFACE
      ?auto_2001729 - SURFACE
      ?auto_2001730 - SURFACE
      ?auto_2001731 - SURFACE
      ?auto_2001732 - SURFACE
      ?auto_2001733 - SURFACE
      ?auto_2001734 - SURFACE
      ?auto_2001735 - SURFACE
      ?auto_2001736 - SURFACE
      ?auto_2001737 - SURFACE
    )
    :vars
    (
      ?auto_2001742 - HOIST
      ?auto_2001738 - PLACE
      ?auto_2001743 - PLACE
      ?auto_2001739 - HOIST
      ?auto_2001741 - SURFACE
      ?auto_2001740 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001742 ?auto_2001738 ) ( IS-CRATE ?auto_2001737 ) ( not ( = ?auto_2001736 ?auto_2001737 ) ) ( not ( = ?auto_2001735 ?auto_2001736 ) ) ( not ( = ?auto_2001735 ?auto_2001737 ) ) ( not ( = ?auto_2001743 ?auto_2001738 ) ) ( HOIST-AT ?auto_2001739 ?auto_2001743 ) ( not ( = ?auto_2001742 ?auto_2001739 ) ) ( SURFACE-AT ?auto_2001737 ?auto_2001743 ) ( ON ?auto_2001737 ?auto_2001741 ) ( CLEAR ?auto_2001737 ) ( not ( = ?auto_2001736 ?auto_2001741 ) ) ( not ( = ?auto_2001737 ?auto_2001741 ) ) ( not ( = ?auto_2001735 ?auto_2001741 ) ) ( SURFACE-AT ?auto_2001735 ?auto_2001738 ) ( CLEAR ?auto_2001735 ) ( IS-CRATE ?auto_2001736 ) ( AVAILABLE ?auto_2001742 ) ( TRUCK-AT ?auto_2001740 ?auto_2001743 ) ( LIFTING ?auto_2001739 ?auto_2001736 ) ( ON ?auto_2001724 ?auto_2001723 ) ( ON ?auto_2001725 ?auto_2001724 ) ( ON ?auto_2001727 ?auto_2001725 ) ( ON ?auto_2001726 ?auto_2001727 ) ( ON ?auto_2001728 ?auto_2001726 ) ( ON ?auto_2001729 ?auto_2001728 ) ( ON ?auto_2001730 ?auto_2001729 ) ( ON ?auto_2001731 ?auto_2001730 ) ( ON ?auto_2001732 ?auto_2001731 ) ( ON ?auto_2001733 ?auto_2001732 ) ( ON ?auto_2001734 ?auto_2001733 ) ( ON ?auto_2001735 ?auto_2001734 ) ( not ( = ?auto_2001723 ?auto_2001724 ) ) ( not ( = ?auto_2001723 ?auto_2001725 ) ) ( not ( = ?auto_2001723 ?auto_2001727 ) ) ( not ( = ?auto_2001723 ?auto_2001726 ) ) ( not ( = ?auto_2001723 ?auto_2001728 ) ) ( not ( = ?auto_2001723 ?auto_2001729 ) ) ( not ( = ?auto_2001723 ?auto_2001730 ) ) ( not ( = ?auto_2001723 ?auto_2001731 ) ) ( not ( = ?auto_2001723 ?auto_2001732 ) ) ( not ( = ?auto_2001723 ?auto_2001733 ) ) ( not ( = ?auto_2001723 ?auto_2001734 ) ) ( not ( = ?auto_2001723 ?auto_2001735 ) ) ( not ( = ?auto_2001723 ?auto_2001736 ) ) ( not ( = ?auto_2001723 ?auto_2001737 ) ) ( not ( = ?auto_2001723 ?auto_2001741 ) ) ( not ( = ?auto_2001724 ?auto_2001725 ) ) ( not ( = ?auto_2001724 ?auto_2001727 ) ) ( not ( = ?auto_2001724 ?auto_2001726 ) ) ( not ( = ?auto_2001724 ?auto_2001728 ) ) ( not ( = ?auto_2001724 ?auto_2001729 ) ) ( not ( = ?auto_2001724 ?auto_2001730 ) ) ( not ( = ?auto_2001724 ?auto_2001731 ) ) ( not ( = ?auto_2001724 ?auto_2001732 ) ) ( not ( = ?auto_2001724 ?auto_2001733 ) ) ( not ( = ?auto_2001724 ?auto_2001734 ) ) ( not ( = ?auto_2001724 ?auto_2001735 ) ) ( not ( = ?auto_2001724 ?auto_2001736 ) ) ( not ( = ?auto_2001724 ?auto_2001737 ) ) ( not ( = ?auto_2001724 ?auto_2001741 ) ) ( not ( = ?auto_2001725 ?auto_2001727 ) ) ( not ( = ?auto_2001725 ?auto_2001726 ) ) ( not ( = ?auto_2001725 ?auto_2001728 ) ) ( not ( = ?auto_2001725 ?auto_2001729 ) ) ( not ( = ?auto_2001725 ?auto_2001730 ) ) ( not ( = ?auto_2001725 ?auto_2001731 ) ) ( not ( = ?auto_2001725 ?auto_2001732 ) ) ( not ( = ?auto_2001725 ?auto_2001733 ) ) ( not ( = ?auto_2001725 ?auto_2001734 ) ) ( not ( = ?auto_2001725 ?auto_2001735 ) ) ( not ( = ?auto_2001725 ?auto_2001736 ) ) ( not ( = ?auto_2001725 ?auto_2001737 ) ) ( not ( = ?auto_2001725 ?auto_2001741 ) ) ( not ( = ?auto_2001727 ?auto_2001726 ) ) ( not ( = ?auto_2001727 ?auto_2001728 ) ) ( not ( = ?auto_2001727 ?auto_2001729 ) ) ( not ( = ?auto_2001727 ?auto_2001730 ) ) ( not ( = ?auto_2001727 ?auto_2001731 ) ) ( not ( = ?auto_2001727 ?auto_2001732 ) ) ( not ( = ?auto_2001727 ?auto_2001733 ) ) ( not ( = ?auto_2001727 ?auto_2001734 ) ) ( not ( = ?auto_2001727 ?auto_2001735 ) ) ( not ( = ?auto_2001727 ?auto_2001736 ) ) ( not ( = ?auto_2001727 ?auto_2001737 ) ) ( not ( = ?auto_2001727 ?auto_2001741 ) ) ( not ( = ?auto_2001726 ?auto_2001728 ) ) ( not ( = ?auto_2001726 ?auto_2001729 ) ) ( not ( = ?auto_2001726 ?auto_2001730 ) ) ( not ( = ?auto_2001726 ?auto_2001731 ) ) ( not ( = ?auto_2001726 ?auto_2001732 ) ) ( not ( = ?auto_2001726 ?auto_2001733 ) ) ( not ( = ?auto_2001726 ?auto_2001734 ) ) ( not ( = ?auto_2001726 ?auto_2001735 ) ) ( not ( = ?auto_2001726 ?auto_2001736 ) ) ( not ( = ?auto_2001726 ?auto_2001737 ) ) ( not ( = ?auto_2001726 ?auto_2001741 ) ) ( not ( = ?auto_2001728 ?auto_2001729 ) ) ( not ( = ?auto_2001728 ?auto_2001730 ) ) ( not ( = ?auto_2001728 ?auto_2001731 ) ) ( not ( = ?auto_2001728 ?auto_2001732 ) ) ( not ( = ?auto_2001728 ?auto_2001733 ) ) ( not ( = ?auto_2001728 ?auto_2001734 ) ) ( not ( = ?auto_2001728 ?auto_2001735 ) ) ( not ( = ?auto_2001728 ?auto_2001736 ) ) ( not ( = ?auto_2001728 ?auto_2001737 ) ) ( not ( = ?auto_2001728 ?auto_2001741 ) ) ( not ( = ?auto_2001729 ?auto_2001730 ) ) ( not ( = ?auto_2001729 ?auto_2001731 ) ) ( not ( = ?auto_2001729 ?auto_2001732 ) ) ( not ( = ?auto_2001729 ?auto_2001733 ) ) ( not ( = ?auto_2001729 ?auto_2001734 ) ) ( not ( = ?auto_2001729 ?auto_2001735 ) ) ( not ( = ?auto_2001729 ?auto_2001736 ) ) ( not ( = ?auto_2001729 ?auto_2001737 ) ) ( not ( = ?auto_2001729 ?auto_2001741 ) ) ( not ( = ?auto_2001730 ?auto_2001731 ) ) ( not ( = ?auto_2001730 ?auto_2001732 ) ) ( not ( = ?auto_2001730 ?auto_2001733 ) ) ( not ( = ?auto_2001730 ?auto_2001734 ) ) ( not ( = ?auto_2001730 ?auto_2001735 ) ) ( not ( = ?auto_2001730 ?auto_2001736 ) ) ( not ( = ?auto_2001730 ?auto_2001737 ) ) ( not ( = ?auto_2001730 ?auto_2001741 ) ) ( not ( = ?auto_2001731 ?auto_2001732 ) ) ( not ( = ?auto_2001731 ?auto_2001733 ) ) ( not ( = ?auto_2001731 ?auto_2001734 ) ) ( not ( = ?auto_2001731 ?auto_2001735 ) ) ( not ( = ?auto_2001731 ?auto_2001736 ) ) ( not ( = ?auto_2001731 ?auto_2001737 ) ) ( not ( = ?auto_2001731 ?auto_2001741 ) ) ( not ( = ?auto_2001732 ?auto_2001733 ) ) ( not ( = ?auto_2001732 ?auto_2001734 ) ) ( not ( = ?auto_2001732 ?auto_2001735 ) ) ( not ( = ?auto_2001732 ?auto_2001736 ) ) ( not ( = ?auto_2001732 ?auto_2001737 ) ) ( not ( = ?auto_2001732 ?auto_2001741 ) ) ( not ( = ?auto_2001733 ?auto_2001734 ) ) ( not ( = ?auto_2001733 ?auto_2001735 ) ) ( not ( = ?auto_2001733 ?auto_2001736 ) ) ( not ( = ?auto_2001733 ?auto_2001737 ) ) ( not ( = ?auto_2001733 ?auto_2001741 ) ) ( not ( = ?auto_2001734 ?auto_2001735 ) ) ( not ( = ?auto_2001734 ?auto_2001736 ) ) ( not ( = ?auto_2001734 ?auto_2001737 ) ) ( not ( = ?auto_2001734 ?auto_2001741 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001735 ?auto_2001736 ?auto_2001737 )
      ( MAKE-14CRATE-VERIFY ?auto_2001723 ?auto_2001724 ?auto_2001725 ?auto_2001727 ?auto_2001726 ?auto_2001728 ?auto_2001729 ?auto_2001730 ?auto_2001731 ?auto_2001732 ?auto_2001733 ?auto_2001734 ?auto_2001735 ?auto_2001736 ?auto_2001737 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2001744 - SURFACE
      ?auto_2001745 - SURFACE
      ?auto_2001746 - SURFACE
      ?auto_2001748 - SURFACE
      ?auto_2001747 - SURFACE
      ?auto_2001749 - SURFACE
      ?auto_2001750 - SURFACE
      ?auto_2001751 - SURFACE
      ?auto_2001752 - SURFACE
      ?auto_2001753 - SURFACE
      ?auto_2001754 - SURFACE
      ?auto_2001755 - SURFACE
      ?auto_2001756 - SURFACE
      ?auto_2001757 - SURFACE
      ?auto_2001758 - SURFACE
      ?auto_2001759 - SURFACE
    )
    :vars
    (
      ?auto_2001764 - HOIST
      ?auto_2001760 - PLACE
      ?auto_2001765 - PLACE
      ?auto_2001761 - HOIST
      ?auto_2001763 - SURFACE
      ?auto_2001762 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001764 ?auto_2001760 ) ( IS-CRATE ?auto_2001759 ) ( not ( = ?auto_2001758 ?auto_2001759 ) ) ( not ( = ?auto_2001757 ?auto_2001758 ) ) ( not ( = ?auto_2001757 ?auto_2001759 ) ) ( not ( = ?auto_2001765 ?auto_2001760 ) ) ( HOIST-AT ?auto_2001761 ?auto_2001765 ) ( not ( = ?auto_2001764 ?auto_2001761 ) ) ( SURFACE-AT ?auto_2001759 ?auto_2001765 ) ( ON ?auto_2001759 ?auto_2001763 ) ( CLEAR ?auto_2001759 ) ( not ( = ?auto_2001758 ?auto_2001763 ) ) ( not ( = ?auto_2001759 ?auto_2001763 ) ) ( not ( = ?auto_2001757 ?auto_2001763 ) ) ( SURFACE-AT ?auto_2001757 ?auto_2001760 ) ( CLEAR ?auto_2001757 ) ( IS-CRATE ?auto_2001758 ) ( AVAILABLE ?auto_2001764 ) ( TRUCK-AT ?auto_2001762 ?auto_2001765 ) ( LIFTING ?auto_2001761 ?auto_2001758 ) ( ON ?auto_2001745 ?auto_2001744 ) ( ON ?auto_2001746 ?auto_2001745 ) ( ON ?auto_2001748 ?auto_2001746 ) ( ON ?auto_2001747 ?auto_2001748 ) ( ON ?auto_2001749 ?auto_2001747 ) ( ON ?auto_2001750 ?auto_2001749 ) ( ON ?auto_2001751 ?auto_2001750 ) ( ON ?auto_2001752 ?auto_2001751 ) ( ON ?auto_2001753 ?auto_2001752 ) ( ON ?auto_2001754 ?auto_2001753 ) ( ON ?auto_2001755 ?auto_2001754 ) ( ON ?auto_2001756 ?auto_2001755 ) ( ON ?auto_2001757 ?auto_2001756 ) ( not ( = ?auto_2001744 ?auto_2001745 ) ) ( not ( = ?auto_2001744 ?auto_2001746 ) ) ( not ( = ?auto_2001744 ?auto_2001748 ) ) ( not ( = ?auto_2001744 ?auto_2001747 ) ) ( not ( = ?auto_2001744 ?auto_2001749 ) ) ( not ( = ?auto_2001744 ?auto_2001750 ) ) ( not ( = ?auto_2001744 ?auto_2001751 ) ) ( not ( = ?auto_2001744 ?auto_2001752 ) ) ( not ( = ?auto_2001744 ?auto_2001753 ) ) ( not ( = ?auto_2001744 ?auto_2001754 ) ) ( not ( = ?auto_2001744 ?auto_2001755 ) ) ( not ( = ?auto_2001744 ?auto_2001756 ) ) ( not ( = ?auto_2001744 ?auto_2001757 ) ) ( not ( = ?auto_2001744 ?auto_2001758 ) ) ( not ( = ?auto_2001744 ?auto_2001759 ) ) ( not ( = ?auto_2001744 ?auto_2001763 ) ) ( not ( = ?auto_2001745 ?auto_2001746 ) ) ( not ( = ?auto_2001745 ?auto_2001748 ) ) ( not ( = ?auto_2001745 ?auto_2001747 ) ) ( not ( = ?auto_2001745 ?auto_2001749 ) ) ( not ( = ?auto_2001745 ?auto_2001750 ) ) ( not ( = ?auto_2001745 ?auto_2001751 ) ) ( not ( = ?auto_2001745 ?auto_2001752 ) ) ( not ( = ?auto_2001745 ?auto_2001753 ) ) ( not ( = ?auto_2001745 ?auto_2001754 ) ) ( not ( = ?auto_2001745 ?auto_2001755 ) ) ( not ( = ?auto_2001745 ?auto_2001756 ) ) ( not ( = ?auto_2001745 ?auto_2001757 ) ) ( not ( = ?auto_2001745 ?auto_2001758 ) ) ( not ( = ?auto_2001745 ?auto_2001759 ) ) ( not ( = ?auto_2001745 ?auto_2001763 ) ) ( not ( = ?auto_2001746 ?auto_2001748 ) ) ( not ( = ?auto_2001746 ?auto_2001747 ) ) ( not ( = ?auto_2001746 ?auto_2001749 ) ) ( not ( = ?auto_2001746 ?auto_2001750 ) ) ( not ( = ?auto_2001746 ?auto_2001751 ) ) ( not ( = ?auto_2001746 ?auto_2001752 ) ) ( not ( = ?auto_2001746 ?auto_2001753 ) ) ( not ( = ?auto_2001746 ?auto_2001754 ) ) ( not ( = ?auto_2001746 ?auto_2001755 ) ) ( not ( = ?auto_2001746 ?auto_2001756 ) ) ( not ( = ?auto_2001746 ?auto_2001757 ) ) ( not ( = ?auto_2001746 ?auto_2001758 ) ) ( not ( = ?auto_2001746 ?auto_2001759 ) ) ( not ( = ?auto_2001746 ?auto_2001763 ) ) ( not ( = ?auto_2001748 ?auto_2001747 ) ) ( not ( = ?auto_2001748 ?auto_2001749 ) ) ( not ( = ?auto_2001748 ?auto_2001750 ) ) ( not ( = ?auto_2001748 ?auto_2001751 ) ) ( not ( = ?auto_2001748 ?auto_2001752 ) ) ( not ( = ?auto_2001748 ?auto_2001753 ) ) ( not ( = ?auto_2001748 ?auto_2001754 ) ) ( not ( = ?auto_2001748 ?auto_2001755 ) ) ( not ( = ?auto_2001748 ?auto_2001756 ) ) ( not ( = ?auto_2001748 ?auto_2001757 ) ) ( not ( = ?auto_2001748 ?auto_2001758 ) ) ( not ( = ?auto_2001748 ?auto_2001759 ) ) ( not ( = ?auto_2001748 ?auto_2001763 ) ) ( not ( = ?auto_2001747 ?auto_2001749 ) ) ( not ( = ?auto_2001747 ?auto_2001750 ) ) ( not ( = ?auto_2001747 ?auto_2001751 ) ) ( not ( = ?auto_2001747 ?auto_2001752 ) ) ( not ( = ?auto_2001747 ?auto_2001753 ) ) ( not ( = ?auto_2001747 ?auto_2001754 ) ) ( not ( = ?auto_2001747 ?auto_2001755 ) ) ( not ( = ?auto_2001747 ?auto_2001756 ) ) ( not ( = ?auto_2001747 ?auto_2001757 ) ) ( not ( = ?auto_2001747 ?auto_2001758 ) ) ( not ( = ?auto_2001747 ?auto_2001759 ) ) ( not ( = ?auto_2001747 ?auto_2001763 ) ) ( not ( = ?auto_2001749 ?auto_2001750 ) ) ( not ( = ?auto_2001749 ?auto_2001751 ) ) ( not ( = ?auto_2001749 ?auto_2001752 ) ) ( not ( = ?auto_2001749 ?auto_2001753 ) ) ( not ( = ?auto_2001749 ?auto_2001754 ) ) ( not ( = ?auto_2001749 ?auto_2001755 ) ) ( not ( = ?auto_2001749 ?auto_2001756 ) ) ( not ( = ?auto_2001749 ?auto_2001757 ) ) ( not ( = ?auto_2001749 ?auto_2001758 ) ) ( not ( = ?auto_2001749 ?auto_2001759 ) ) ( not ( = ?auto_2001749 ?auto_2001763 ) ) ( not ( = ?auto_2001750 ?auto_2001751 ) ) ( not ( = ?auto_2001750 ?auto_2001752 ) ) ( not ( = ?auto_2001750 ?auto_2001753 ) ) ( not ( = ?auto_2001750 ?auto_2001754 ) ) ( not ( = ?auto_2001750 ?auto_2001755 ) ) ( not ( = ?auto_2001750 ?auto_2001756 ) ) ( not ( = ?auto_2001750 ?auto_2001757 ) ) ( not ( = ?auto_2001750 ?auto_2001758 ) ) ( not ( = ?auto_2001750 ?auto_2001759 ) ) ( not ( = ?auto_2001750 ?auto_2001763 ) ) ( not ( = ?auto_2001751 ?auto_2001752 ) ) ( not ( = ?auto_2001751 ?auto_2001753 ) ) ( not ( = ?auto_2001751 ?auto_2001754 ) ) ( not ( = ?auto_2001751 ?auto_2001755 ) ) ( not ( = ?auto_2001751 ?auto_2001756 ) ) ( not ( = ?auto_2001751 ?auto_2001757 ) ) ( not ( = ?auto_2001751 ?auto_2001758 ) ) ( not ( = ?auto_2001751 ?auto_2001759 ) ) ( not ( = ?auto_2001751 ?auto_2001763 ) ) ( not ( = ?auto_2001752 ?auto_2001753 ) ) ( not ( = ?auto_2001752 ?auto_2001754 ) ) ( not ( = ?auto_2001752 ?auto_2001755 ) ) ( not ( = ?auto_2001752 ?auto_2001756 ) ) ( not ( = ?auto_2001752 ?auto_2001757 ) ) ( not ( = ?auto_2001752 ?auto_2001758 ) ) ( not ( = ?auto_2001752 ?auto_2001759 ) ) ( not ( = ?auto_2001752 ?auto_2001763 ) ) ( not ( = ?auto_2001753 ?auto_2001754 ) ) ( not ( = ?auto_2001753 ?auto_2001755 ) ) ( not ( = ?auto_2001753 ?auto_2001756 ) ) ( not ( = ?auto_2001753 ?auto_2001757 ) ) ( not ( = ?auto_2001753 ?auto_2001758 ) ) ( not ( = ?auto_2001753 ?auto_2001759 ) ) ( not ( = ?auto_2001753 ?auto_2001763 ) ) ( not ( = ?auto_2001754 ?auto_2001755 ) ) ( not ( = ?auto_2001754 ?auto_2001756 ) ) ( not ( = ?auto_2001754 ?auto_2001757 ) ) ( not ( = ?auto_2001754 ?auto_2001758 ) ) ( not ( = ?auto_2001754 ?auto_2001759 ) ) ( not ( = ?auto_2001754 ?auto_2001763 ) ) ( not ( = ?auto_2001755 ?auto_2001756 ) ) ( not ( = ?auto_2001755 ?auto_2001757 ) ) ( not ( = ?auto_2001755 ?auto_2001758 ) ) ( not ( = ?auto_2001755 ?auto_2001759 ) ) ( not ( = ?auto_2001755 ?auto_2001763 ) ) ( not ( = ?auto_2001756 ?auto_2001757 ) ) ( not ( = ?auto_2001756 ?auto_2001758 ) ) ( not ( = ?auto_2001756 ?auto_2001759 ) ) ( not ( = ?auto_2001756 ?auto_2001763 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001757 ?auto_2001758 ?auto_2001759 )
      ( MAKE-15CRATE-VERIFY ?auto_2001744 ?auto_2001745 ?auto_2001746 ?auto_2001748 ?auto_2001747 ?auto_2001749 ?auto_2001750 ?auto_2001751 ?auto_2001752 ?auto_2001753 ?auto_2001754 ?auto_2001755 ?auto_2001756 ?auto_2001757 ?auto_2001758 ?auto_2001759 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2001766 - SURFACE
      ?auto_2001767 - SURFACE
    )
    :vars
    (
      ?auto_2001773 - HOIST
      ?auto_2001768 - PLACE
      ?auto_2001772 - SURFACE
      ?auto_2001774 - PLACE
      ?auto_2001769 - HOIST
      ?auto_2001771 - SURFACE
      ?auto_2001770 - TRUCK
      ?auto_2001775 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001773 ?auto_2001768 ) ( IS-CRATE ?auto_2001767 ) ( not ( = ?auto_2001766 ?auto_2001767 ) ) ( not ( = ?auto_2001772 ?auto_2001766 ) ) ( not ( = ?auto_2001772 ?auto_2001767 ) ) ( not ( = ?auto_2001774 ?auto_2001768 ) ) ( HOIST-AT ?auto_2001769 ?auto_2001774 ) ( not ( = ?auto_2001773 ?auto_2001769 ) ) ( SURFACE-AT ?auto_2001767 ?auto_2001774 ) ( ON ?auto_2001767 ?auto_2001771 ) ( CLEAR ?auto_2001767 ) ( not ( = ?auto_2001766 ?auto_2001771 ) ) ( not ( = ?auto_2001767 ?auto_2001771 ) ) ( not ( = ?auto_2001772 ?auto_2001771 ) ) ( SURFACE-AT ?auto_2001772 ?auto_2001768 ) ( CLEAR ?auto_2001772 ) ( IS-CRATE ?auto_2001766 ) ( AVAILABLE ?auto_2001773 ) ( TRUCK-AT ?auto_2001770 ?auto_2001774 ) ( AVAILABLE ?auto_2001769 ) ( SURFACE-AT ?auto_2001766 ?auto_2001774 ) ( ON ?auto_2001766 ?auto_2001775 ) ( CLEAR ?auto_2001766 ) ( not ( = ?auto_2001766 ?auto_2001775 ) ) ( not ( = ?auto_2001767 ?auto_2001775 ) ) ( not ( = ?auto_2001772 ?auto_2001775 ) ) ( not ( = ?auto_2001771 ?auto_2001775 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2001769 ?auto_2001766 ?auto_2001775 ?auto_2001774 )
      ( MAKE-2CRATE ?auto_2001772 ?auto_2001766 ?auto_2001767 )
      ( MAKE-1CRATE-VERIFY ?auto_2001766 ?auto_2001767 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2001776 - SURFACE
      ?auto_2001777 - SURFACE
      ?auto_2001778 - SURFACE
    )
    :vars
    (
      ?auto_2001784 - HOIST
      ?auto_2001781 - PLACE
      ?auto_2001780 - PLACE
      ?auto_2001783 - HOIST
      ?auto_2001779 - SURFACE
      ?auto_2001782 - TRUCK
      ?auto_2001785 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001784 ?auto_2001781 ) ( IS-CRATE ?auto_2001778 ) ( not ( = ?auto_2001777 ?auto_2001778 ) ) ( not ( = ?auto_2001776 ?auto_2001777 ) ) ( not ( = ?auto_2001776 ?auto_2001778 ) ) ( not ( = ?auto_2001780 ?auto_2001781 ) ) ( HOIST-AT ?auto_2001783 ?auto_2001780 ) ( not ( = ?auto_2001784 ?auto_2001783 ) ) ( SURFACE-AT ?auto_2001778 ?auto_2001780 ) ( ON ?auto_2001778 ?auto_2001779 ) ( CLEAR ?auto_2001778 ) ( not ( = ?auto_2001777 ?auto_2001779 ) ) ( not ( = ?auto_2001778 ?auto_2001779 ) ) ( not ( = ?auto_2001776 ?auto_2001779 ) ) ( SURFACE-AT ?auto_2001776 ?auto_2001781 ) ( CLEAR ?auto_2001776 ) ( IS-CRATE ?auto_2001777 ) ( AVAILABLE ?auto_2001784 ) ( TRUCK-AT ?auto_2001782 ?auto_2001780 ) ( AVAILABLE ?auto_2001783 ) ( SURFACE-AT ?auto_2001777 ?auto_2001780 ) ( ON ?auto_2001777 ?auto_2001785 ) ( CLEAR ?auto_2001777 ) ( not ( = ?auto_2001777 ?auto_2001785 ) ) ( not ( = ?auto_2001778 ?auto_2001785 ) ) ( not ( = ?auto_2001776 ?auto_2001785 ) ) ( not ( = ?auto_2001779 ?auto_2001785 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2001777 ?auto_2001778 )
      ( MAKE-2CRATE-VERIFY ?auto_2001776 ?auto_2001777 ?auto_2001778 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2001786 - SURFACE
      ?auto_2001787 - SURFACE
      ?auto_2001788 - SURFACE
      ?auto_2001789 - SURFACE
    )
    :vars
    (
      ?auto_2001795 - HOIST
      ?auto_2001791 - PLACE
      ?auto_2001790 - PLACE
      ?auto_2001794 - HOIST
      ?auto_2001793 - SURFACE
      ?auto_2001792 - TRUCK
      ?auto_2001796 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001795 ?auto_2001791 ) ( IS-CRATE ?auto_2001789 ) ( not ( = ?auto_2001788 ?auto_2001789 ) ) ( not ( = ?auto_2001787 ?auto_2001788 ) ) ( not ( = ?auto_2001787 ?auto_2001789 ) ) ( not ( = ?auto_2001790 ?auto_2001791 ) ) ( HOIST-AT ?auto_2001794 ?auto_2001790 ) ( not ( = ?auto_2001795 ?auto_2001794 ) ) ( SURFACE-AT ?auto_2001789 ?auto_2001790 ) ( ON ?auto_2001789 ?auto_2001793 ) ( CLEAR ?auto_2001789 ) ( not ( = ?auto_2001788 ?auto_2001793 ) ) ( not ( = ?auto_2001789 ?auto_2001793 ) ) ( not ( = ?auto_2001787 ?auto_2001793 ) ) ( SURFACE-AT ?auto_2001787 ?auto_2001791 ) ( CLEAR ?auto_2001787 ) ( IS-CRATE ?auto_2001788 ) ( AVAILABLE ?auto_2001795 ) ( TRUCK-AT ?auto_2001792 ?auto_2001790 ) ( AVAILABLE ?auto_2001794 ) ( SURFACE-AT ?auto_2001788 ?auto_2001790 ) ( ON ?auto_2001788 ?auto_2001796 ) ( CLEAR ?auto_2001788 ) ( not ( = ?auto_2001788 ?auto_2001796 ) ) ( not ( = ?auto_2001789 ?auto_2001796 ) ) ( not ( = ?auto_2001787 ?auto_2001796 ) ) ( not ( = ?auto_2001793 ?auto_2001796 ) ) ( ON ?auto_2001787 ?auto_2001786 ) ( not ( = ?auto_2001786 ?auto_2001787 ) ) ( not ( = ?auto_2001786 ?auto_2001788 ) ) ( not ( = ?auto_2001786 ?auto_2001789 ) ) ( not ( = ?auto_2001786 ?auto_2001793 ) ) ( not ( = ?auto_2001786 ?auto_2001796 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001787 ?auto_2001788 ?auto_2001789 )
      ( MAKE-3CRATE-VERIFY ?auto_2001786 ?auto_2001787 ?auto_2001788 ?auto_2001789 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2001797 - SURFACE
      ?auto_2001798 - SURFACE
      ?auto_2001799 - SURFACE
      ?auto_2001801 - SURFACE
      ?auto_2001800 - SURFACE
    )
    :vars
    (
      ?auto_2001807 - HOIST
      ?auto_2001803 - PLACE
      ?auto_2001802 - PLACE
      ?auto_2001806 - HOIST
      ?auto_2001805 - SURFACE
      ?auto_2001804 - TRUCK
      ?auto_2001808 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001807 ?auto_2001803 ) ( IS-CRATE ?auto_2001800 ) ( not ( = ?auto_2001801 ?auto_2001800 ) ) ( not ( = ?auto_2001799 ?auto_2001801 ) ) ( not ( = ?auto_2001799 ?auto_2001800 ) ) ( not ( = ?auto_2001802 ?auto_2001803 ) ) ( HOIST-AT ?auto_2001806 ?auto_2001802 ) ( not ( = ?auto_2001807 ?auto_2001806 ) ) ( SURFACE-AT ?auto_2001800 ?auto_2001802 ) ( ON ?auto_2001800 ?auto_2001805 ) ( CLEAR ?auto_2001800 ) ( not ( = ?auto_2001801 ?auto_2001805 ) ) ( not ( = ?auto_2001800 ?auto_2001805 ) ) ( not ( = ?auto_2001799 ?auto_2001805 ) ) ( SURFACE-AT ?auto_2001799 ?auto_2001803 ) ( CLEAR ?auto_2001799 ) ( IS-CRATE ?auto_2001801 ) ( AVAILABLE ?auto_2001807 ) ( TRUCK-AT ?auto_2001804 ?auto_2001802 ) ( AVAILABLE ?auto_2001806 ) ( SURFACE-AT ?auto_2001801 ?auto_2001802 ) ( ON ?auto_2001801 ?auto_2001808 ) ( CLEAR ?auto_2001801 ) ( not ( = ?auto_2001801 ?auto_2001808 ) ) ( not ( = ?auto_2001800 ?auto_2001808 ) ) ( not ( = ?auto_2001799 ?auto_2001808 ) ) ( not ( = ?auto_2001805 ?auto_2001808 ) ) ( ON ?auto_2001798 ?auto_2001797 ) ( ON ?auto_2001799 ?auto_2001798 ) ( not ( = ?auto_2001797 ?auto_2001798 ) ) ( not ( = ?auto_2001797 ?auto_2001799 ) ) ( not ( = ?auto_2001797 ?auto_2001801 ) ) ( not ( = ?auto_2001797 ?auto_2001800 ) ) ( not ( = ?auto_2001797 ?auto_2001805 ) ) ( not ( = ?auto_2001797 ?auto_2001808 ) ) ( not ( = ?auto_2001798 ?auto_2001799 ) ) ( not ( = ?auto_2001798 ?auto_2001801 ) ) ( not ( = ?auto_2001798 ?auto_2001800 ) ) ( not ( = ?auto_2001798 ?auto_2001805 ) ) ( not ( = ?auto_2001798 ?auto_2001808 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001799 ?auto_2001801 ?auto_2001800 )
      ( MAKE-4CRATE-VERIFY ?auto_2001797 ?auto_2001798 ?auto_2001799 ?auto_2001801 ?auto_2001800 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2001809 - SURFACE
      ?auto_2001810 - SURFACE
      ?auto_2001811 - SURFACE
      ?auto_2001813 - SURFACE
      ?auto_2001812 - SURFACE
      ?auto_2001814 - SURFACE
    )
    :vars
    (
      ?auto_2001820 - HOIST
      ?auto_2001816 - PLACE
      ?auto_2001815 - PLACE
      ?auto_2001819 - HOIST
      ?auto_2001818 - SURFACE
      ?auto_2001817 - TRUCK
      ?auto_2001821 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001820 ?auto_2001816 ) ( IS-CRATE ?auto_2001814 ) ( not ( = ?auto_2001812 ?auto_2001814 ) ) ( not ( = ?auto_2001813 ?auto_2001812 ) ) ( not ( = ?auto_2001813 ?auto_2001814 ) ) ( not ( = ?auto_2001815 ?auto_2001816 ) ) ( HOIST-AT ?auto_2001819 ?auto_2001815 ) ( not ( = ?auto_2001820 ?auto_2001819 ) ) ( SURFACE-AT ?auto_2001814 ?auto_2001815 ) ( ON ?auto_2001814 ?auto_2001818 ) ( CLEAR ?auto_2001814 ) ( not ( = ?auto_2001812 ?auto_2001818 ) ) ( not ( = ?auto_2001814 ?auto_2001818 ) ) ( not ( = ?auto_2001813 ?auto_2001818 ) ) ( SURFACE-AT ?auto_2001813 ?auto_2001816 ) ( CLEAR ?auto_2001813 ) ( IS-CRATE ?auto_2001812 ) ( AVAILABLE ?auto_2001820 ) ( TRUCK-AT ?auto_2001817 ?auto_2001815 ) ( AVAILABLE ?auto_2001819 ) ( SURFACE-AT ?auto_2001812 ?auto_2001815 ) ( ON ?auto_2001812 ?auto_2001821 ) ( CLEAR ?auto_2001812 ) ( not ( = ?auto_2001812 ?auto_2001821 ) ) ( not ( = ?auto_2001814 ?auto_2001821 ) ) ( not ( = ?auto_2001813 ?auto_2001821 ) ) ( not ( = ?auto_2001818 ?auto_2001821 ) ) ( ON ?auto_2001810 ?auto_2001809 ) ( ON ?auto_2001811 ?auto_2001810 ) ( ON ?auto_2001813 ?auto_2001811 ) ( not ( = ?auto_2001809 ?auto_2001810 ) ) ( not ( = ?auto_2001809 ?auto_2001811 ) ) ( not ( = ?auto_2001809 ?auto_2001813 ) ) ( not ( = ?auto_2001809 ?auto_2001812 ) ) ( not ( = ?auto_2001809 ?auto_2001814 ) ) ( not ( = ?auto_2001809 ?auto_2001818 ) ) ( not ( = ?auto_2001809 ?auto_2001821 ) ) ( not ( = ?auto_2001810 ?auto_2001811 ) ) ( not ( = ?auto_2001810 ?auto_2001813 ) ) ( not ( = ?auto_2001810 ?auto_2001812 ) ) ( not ( = ?auto_2001810 ?auto_2001814 ) ) ( not ( = ?auto_2001810 ?auto_2001818 ) ) ( not ( = ?auto_2001810 ?auto_2001821 ) ) ( not ( = ?auto_2001811 ?auto_2001813 ) ) ( not ( = ?auto_2001811 ?auto_2001812 ) ) ( not ( = ?auto_2001811 ?auto_2001814 ) ) ( not ( = ?auto_2001811 ?auto_2001818 ) ) ( not ( = ?auto_2001811 ?auto_2001821 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001813 ?auto_2001812 ?auto_2001814 )
      ( MAKE-5CRATE-VERIFY ?auto_2001809 ?auto_2001810 ?auto_2001811 ?auto_2001813 ?auto_2001812 ?auto_2001814 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2001822 - SURFACE
      ?auto_2001823 - SURFACE
      ?auto_2001824 - SURFACE
      ?auto_2001826 - SURFACE
      ?auto_2001825 - SURFACE
      ?auto_2001827 - SURFACE
      ?auto_2001828 - SURFACE
    )
    :vars
    (
      ?auto_2001834 - HOIST
      ?auto_2001830 - PLACE
      ?auto_2001829 - PLACE
      ?auto_2001833 - HOIST
      ?auto_2001832 - SURFACE
      ?auto_2001831 - TRUCK
      ?auto_2001835 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001834 ?auto_2001830 ) ( IS-CRATE ?auto_2001828 ) ( not ( = ?auto_2001827 ?auto_2001828 ) ) ( not ( = ?auto_2001825 ?auto_2001827 ) ) ( not ( = ?auto_2001825 ?auto_2001828 ) ) ( not ( = ?auto_2001829 ?auto_2001830 ) ) ( HOIST-AT ?auto_2001833 ?auto_2001829 ) ( not ( = ?auto_2001834 ?auto_2001833 ) ) ( SURFACE-AT ?auto_2001828 ?auto_2001829 ) ( ON ?auto_2001828 ?auto_2001832 ) ( CLEAR ?auto_2001828 ) ( not ( = ?auto_2001827 ?auto_2001832 ) ) ( not ( = ?auto_2001828 ?auto_2001832 ) ) ( not ( = ?auto_2001825 ?auto_2001832 ) ) ( SURFACE-AT ?auto_2001825 ?auto_2001830 ) ( CLEAR ?auto_2001825 ) ( IS-CRATE ?auto_2001827 ) ( AVAILABLE ?auto_2001834 ) ( TRUCK-AT ?auto_2001831 ?auto_2001829 ) ( AVAILABLE ?auto_2001833 ) ( SURFACE-AT ?auto_2001827 ?auto_2001829 ) ( ON ?auto_2001827 ?auto_2001835 ) ( CLEAR ?auto_2001827 ) ( not ( = ?auto_2001827 ?auto_2001835 ) ) ( not ( = ?auto_2001828 ?auto_2001835 ) ) ( not ( = ?auto_2001825 ?auto_2001835 ) ) ( not ( = ?auto_2001832 ?auto_2001835 ) ) ( ON ?auto_2001823 ?auto_2001822 ) ( ON ?auto_2001824 ?auto_2001823 ) ( ON ?auto_2001826 ?auto_2001824 ) ( ON ?auto_2001825 ?auto_2001826 ) ( not ( = ?auto_2001822 ?auto_2001823 ) ) ( not ( = ?auto_2001822 ?auto_2001824 ) ) ( not ( = ?auto_2001822 ?auto_2001826 ) ) ( not ( = ?auto_2001822 ?auto_2001825 ) ) ( not ( = ?auto_2001822 ?auto_2001827 ) ) ( not ( = ?auto_2001822 ?auto_2001828 ) ) ( not ( = ?auto_2001822 ?auto_2001832 ) ) ( not ( = ?auto_2001822 ?auto_2001835 ) ) ( not ( = ?auto_2001823 ?auto_2001824 ) ) ( not ( = ?auto_2001823 ?auto_2001826 ) ) ( not ( = ?auto_2001823 ?auto_2001825 ) ) ( not ( = ?auto_2001823 ?auto_2001827 ) ) ( not ( = ?auto_2001823 ?auto_2001828 ) ) ( not ( = ?auto_2001823 ?auto_2001832 ) ) ( not ( = ?auto_2001823 ?auto_2001835 ) ) ( not ( = ?auto_2001824 ?auto_2001826 ) ) ( not ( = ?auto_2001824 ?auto_2001825 ) ) ( not ( = ?auto_2001824 ?auto_2001827 ) ) ( not ( = ?auto_2001824 ?auto_2001828 ) ) ( not ( = ?auto_2001824 ?auto_2001832 ) ) ( not ( = ?auto_2001824 ?auto_2001835 ) ) ( not ( = ?auto_2001826 ?auto_2001825 ) ) ( not ( = ?auto_2001826 ?auto_2001827 ) ) ( not ( = ?auto_2001826 ?auto_2001828 ) ) ( not ( = ?auto_2001826 ?auto_2001832 ) ) ( not ( = ?auto_2001826 ?auto_2001835 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001825 ?auto_2001827 ?auto_2001828 )
      ( MAKE-6CRATE-VERIFY ?auto_2001822 ?auto_2001823 ?auto_2001824 ?auto_2001826 ?auto_2001825 ?auto_2001827 ?auto_2001828 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2001836 - SURFACE
      ?auto_2001837 - SURFACE
      ?auto_2001838 - SURFACE
      ?auto_2001840 - SURFACE
      ?auto_2001839 - SURFACE
      ?auto_2001841 - SURFACE
      ?auto_2001842 - SURFACE
      ?auto_2001843 - SURFACE
    )
    :vars
    (
      ?auto_2001849 - HOIST
      ?auto_2001845 - PLACE
      ?auto_2001844 - PLACE
      ?auto_2001848 - HOIST
      ?auto_2001847 - SURFACE
      ?auto_2001846 - TRUCK
      ?auto_2001850 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001849 ?auto_2001845 ) ( IS-CRATE ?auto_2001843 ) ( not ( = ?auto_2001842 ?auto_2001843 ) ) ( not ( = ?auto_2001841 ?auto_2001842 ) ) ( not ( = ?auto_2001841 ?auto_2001843 ) ) ( not ( = ?auto_2001844 ?auto_2001845 ) ) ( HOIST-AT ?auto_2001848 ?auto_2001844 ) ( not ( = ?auto_2001849 ?auto_2001848 ) ) ( SURFACE-AT ?auto_2001843 ?auto_2001844 ) ( ON ?auto_2001843 ?auto_2001847 ) ( CLEAR ?auto_2001843 ) ( not ( = ?auto_2001842 ?auto_2001847 ) ) ( not ( = ?auto_2001843 ?auto_2001847 ) ) ( not ( = ?auto_2001841 ?auto_2001847 ) ) ( SURFACE-AT ?auto_2001841 ?auto_2001845 ) ( CLEAR ?auto_2001841 ) ( IS-CRATE ?auto_2001842 ) ( AVAILABLE ?auto_2001849 ) ( TRUCK-AT ?auto_2001846 ?auto_2001844 ) ( AVAILABLE ?auto_2001848 ) ( SURFACE-AT ?auto_2001842 ?auto_2001844 ) ( ON ?auto_2001842 ?auto_2001850 ) ( CLEAR ?auto_2001842 ) ( not ( = ?auto_2001842 ?auto_2001850 ) ) ( not ( = ?auto_2001843 ?auto_2001850 ) ) ( not ( = ?auto_2001841 ?auto_2001850 ) ) ( not ( = ?auto_2001847 ?auto_2001850 ) ) ( ON ?auto_2001837 ?auto_2001836 ) ( ON ?auto_2001838 ?auto_2001837 ) ( ON ?auto_2001840 ?auto_2001838 ) ( ON ?auto_2001839 ?auto_2001840 ) ( ON ?auto_2001841 ?auto_2001839 ) ( not ( = ?auto_2001836 ?auto_2001837 ) ) ( not ( = ?auto_2001836 ?auto_2001838 ) ) ( not ( = ?auto_2001836 ?auto_2001840 ) ) ( not ( = ?auto_2001836 ?auto_2001839 ) ) ( not ( = ?auto_2001836 ?auto_2001841 ) ) ( not ( = ?auto_2001836 ?auto_2001842 ) ) ( not ( = ?auto_2001836 ?auto_2001843 ) ) ( not ( = ?auto_2001836 ?auto_2001847 ) ) ( not ( = ?auto_2001836 ?auto_2001850 ) ) ( not ( = ?auto_2001837 ?auto_2001838 ) ) ( not ( = ?auto_2001837 ?auto_2001840 ) ) ( not ( = ?auto_2001837 ?auto_2001839 ) ) ( not ( = ?auto_2001837 ?auto_2001841 ) ) ( not ( = ?auto_2001837 ?auto_2001842 ) ) ( not ( = ?auto_2001837 ?auto_2001843 ) ) ( not ( = ?auto_2001837 ?auto_2001847 ) ) ( not ( = ?auto_2001837 ?auto_2001850 ) ) ( not ( = ?auto_2001838 ?auto_2001840 ) ) ( not ( = ?auto_2001838 ?auto_2001839 ) ) ( not ( = ?auto_2001838 ?auto_2001841 ) ) ( not ( = ?auto_2001838 ?auto_2001842 ) ) ( not ( = ?auto_2001838 ?auto_2001843 ) ) ( not ( = ?auto_2001838 ?auto_2001847 ) ) ( not ( = ?auto_2001838 ?auto_2001850 ) ) ( not ( = ?auto_2001840 ?auto_2001839 ) ) ( not ( = ?auto_2001840 ?auto_2001841 ) ) ( not ( = ?auto_2001840 ?auto_2001842 ) ) ( not ( = ?auto_2001840 ?auto_2001843 ) ) ( not ( = ?auto_2001840 ?auto_2001847 ) ) ( not ( = ?auto_2001840 ?auto_2001850 ) ) ( not ( = ?auto_2001839 ?auto_2001841 ) ) ( not ( = ?auto_2001839 ?auto_2001842 ) ) ( not ( = ?auto_2001839 ?auto_2001843 ) ) ( not ( = ?auto_2001839 ?auto_2001847 ) ) ( not ( = ?auto_2001839 ?auto_2001850 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001841 ?auto_2001842 ?auto_2001843 )
      ( MAKE-7CRATE-VERIFY ?auto_2001836 ?auto_2001837 ?auto_2001838 ?auto_2001840 ?auto_2001839 ?auto_2001841 ?auto_2001842 ?auto_2001843 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2001851 - SURFACE
      ?auto_2001852 - SURFACE
      ?auto_2001853 - SURFACE
      ?auto_2001855 - SURFACE
      ?auto_2001854 - SURFACE
      ?auto_2001856 - SURFACE
      ?auto_2001857 - SURFACE
      ?auto_2001858 - SURFACE
      ?auto_2001859 - SURFACE
    )
    :vars
    (
      ?auto_2001865 - HOIST
      ?auto_2001861 - PLACE
      ?auto_2001860 - PLACE
      ?auto_2001864 - HOIST
      ?auto_2001863 - SURFACE
      ?auto_2001862 - TRUCK
      ?auto_2001866 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001865 ?auto_2001861 ) ( IS-CRATE ?auto_2001859 ) ( not ( = ?auto_2001858 ?auto_2001859 ) ) ( not ( = ?auto_2001857 ?auto_2001858 ) ) ( not ( = ?auto_2001857 ?auto_2001859 ) ) ( not ( = ?auto_2001860 ?auto_2001861 ) ) ( HOIST-AT ?auto_2001864 ?auto_2001860 ) ( not ( = ?auto_2001865 ?auto_2001864 ) ) ( SURFACE-AT ?auto_2001859 ?auto_2001860 ) ( ON ?auto_2001859 ?auto_2001863 ) ( CLEAR ?auto_2001859 ) ( not ( = ?auto_2001858 ?auto_2001863 ) ) ( not ( = ?auto_2001859 ?auto_2001863 ) ) ( not ( = ?auto_2001857 ?auto_2001863 ) ) ( SURFACE-AT ?auto_2001857 ?auto_2001861 ) ( CLEAR ?auto_2001857 ) ( IS-CRATE ?auto_2001858 ) ( AVAILABLE ?auto_2001865 ) ( TRUCK-AT ?auto_2001862 ?auto_2001860 ) ( AVAILABLE ?auto_2001864 ) ( SURFACE-AT ?auto_2001858 ?auto_2001860 ) ( ON ?auto_2001858 ?auto_2001866 ) ( CLEAR ?auto_2001858 ) ( not ( = ?auto_2001858 ?auto_2001866 ) ) ( not ( = ?auto_2001859 ?auto_2001866 ) ) ( not ( = ?auto_2001857 ?auto_2001866 ) ) ( not ( = ?auto_2001863 ?auto_2001866 ) ) ( ON ?auto_2001852 ?auto_2001851 ) ( ON ?auto_2001853 ?auto_2001852 ) ( ON ?auto_2001855 ?auto_2001853 ) ( ON ?auto_2001854 ?auto_2001855 ) ( ON ?auto_2001856 ?auto_2001854 ) ( ON ?auto_2001857 ?auto_2001856 ) ( not ( = ?auto_2001851 ?auto_2001852 ) ) ( not ( = ?auto_2001851 ?auto_2001853 ) ) ( not ( = ?auto_2001851 ?auto_2001855 ) ) ( not ( = ?auto_2001851 ?auto_2001854 ) ) ( not ( = ?auto_2001851 ?auto_2001856 ) ) ( not ( = ?auto_2001851 ?auto_2001857 ) ) ( not ( = ?auto_2001851 ?auto_2001858 ) ) ( not ( = ?auto_2001851 ?auto_2001859 ) ) ( not ( = ?auto_2001851 ?auto_2001863 ) ) ( not ( = ?auto_2001851 ?auto_2001866 ) ) ( not ( = ?auto_2001852 ?auto_2001853 ) ) ( not ( = ?auto_2001852 ?auto_2001855 ) ) ( not ( = ?auto_2001852 ?auto_2001854 ) ) ( not ( = ?auto_2001852 ?auto_2001856 ) ) ( not ( = ?auto_2001852 ?auto_2001857 ) ) ( not ( = ?auto_2001852 ?auto_2001858 ) ) ( not ( = ?auto_2001852 ?auto_2001859 ) ) ( not ( = ?auto_2001852 ?auto_2001863 ) ) ( not ( = ?auto_2001852 ?auto_2001866 ) ) ( not ( = ?auto_2001853 ?auto_2001855 ) ) ( not ( = ?auto_2001853 ?auto_2001854 ) ) ( not ( = ?auto_2001853 ?auto_2001856 ) ) ( not ( = ?auto_2001853 ?auto_2001857 ) ) ( not ( = ?auto_2001853 ?auto_2001858 ) ) ( not ( = ?auto_2001853 ?auto_2001859 ) ) ( not ( = ?auto_2001853 ?auto_2001863 ) ) ( not ( = ?auto_2001853 ?auto_2001866 ) ) ( not ( = ?auto_2001855 ?auto_2001854 ) ) ( not ( = ?auto_2001855 ?auto_2001856 ) ) ( not ( = ?auto_2001855 ?auto_2001857 ) ) ( not ( = ?auto_2001855 ?auto_2001858 ) ) ( not ( = ?auto_2001855 ?auto_2001859 ) ) ( not ( = ?auto_2001855 ?auto_2001863 ) ) ( not ( = ?auto_2001855 ?auto_2001866 ) ) ( not ( = ?auto_2001854 ?auto_2001856 ) ) ( not ( = ?auto_2001854 ?auto_2001857 ) ) ( not ( = ?auto_2001854 ?auto_2001858 ) ) ( not ( = ?auto_2001854 ?auto_2001859 ) ) ( not ( = ?auto_2001854 ?auto_2001863 ) ) ( not ( = ?auto_2001854 ?auto_2001866 ) ) ( not ( = ?auto_2001856 ?auto_2001857 ) ) ( not ( = ?auto_2001856 ?auto_2001858 ) ) ( not ( = ?auto_2001856 ?auto_2001859 ) ) ( not ( = ?auto_2001856 ?auto_2001863 ) ) ( not ( = ?auto_2001856 ?auto_2001866 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001857 ?auto_2001858 ?auto_2001859 )
      ( MAKE-8CRATE-VERIFY ?auto_2001851 ?auto_2001852 ?auto_2001853 ?auto_2001855 ?auto_2001854 ?auto_2001856 ?auto_2001857 ?auto_2001858 ?auto_2001859 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2001867 - SURFACE
      ?auto_2001868 - SURFACE
      ?auto_2001869 - SURFACE
      ?auto_2001871 - SURFACE
      ?auto_2001870 - SURFACE
      ?auto_2001872 - SURFACE
      ?auto_2001873 - SURFACE
      ?auto_2001874 - SURFACE
      ?auto_2001875 - SURFACE
      ?auto_2001876 - SURFACE
    )
    :vars
    (
      ?auto_2001882 - HOIST
      ?auto_2001878 - PLACE
      ?auto_2001877 - PLACE
      ?auto_2001881 - HOIST
      ?auto_2001880 - SURFACE
      ?auto_2001879 - TRUCK
      ?auto_2001883 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001882 ?auto_2001878 ) ( IS-CRATE ?auto_2001876 ) ( not ( = ?auto_2001875 ?auto_2001876 ) ) ( not ( = ?auto_2001874 ?auto_2001875 ) ) ( not ( = ?auto_2001874 ?auto_2001876 ) ) ( not ( = ?auto_2001877 ?auto_2001878 ) ) ( HOIST-AT ?auto_2001881 ?auto_2001877 ) ( not ( = ?auto_2001882 ?auto_2001881 ) ) ( SURFACE-AT ?auto_2001876 ?auto_2001877 ) ( ON ?auto_2001876 ?auto_2001880 ) ( CLEAR ?auto_2001876 ) ( not ( = ?auto_2001875 ?auto_2001880 ) ) ( not ( = ?auto_2001876 ?auto_2001880 ) ) ( not ( = ?auto_2001874 ?auto_2001880 ) ) ( SURFACE-AT ?auto_2001874 ?auto_2001878 ) ( CLEAR ?auto_2001874 ) ( IS-CRATE ?auto_2001875 ) ( AVAILABLE ?auto_2001882 ) ( TRUCK-AT ?auto_2001879 ?auto_2001877 ) ( AVAILABLE ?auto_2001881 ) ( SURFACE-AT ?auto_2001875 ?auto_2001877 ) ( ON ?auto_2001875 ?auto_2001883 ) ( CLEAR ?auto_2001875 ) ( not ( = ?auto_2001875 ?auto_2001883 ) ) ( not ( = ?auto_2001876 ?auto_2001883 ) ) ( not ( = ?auto_2001874 ?auto_2001883 ) ) ( not ( = ?auto_2001880 ?auto_2001883 ) ) ( ON ?auto_2001868 ?auto_2001867 ) ( ON ?auto_2001869 ?auto_2001868 ) ( ON ?auto_2001871 ?auto_2001869 ) ( ON ?auto_2001870 ?auto_2001871 ) ( ON ?auto_2001872 ?auto_2001870 ) ( ON ?auto_2001873 ?auto_2001872 ) ( ON ?auto_2001874 ?auto_2001873 ) ( not ( = ?auto_2001867 ?auto_2001868 ) ) ( not ( = ?auto_2001867 ?auto_2001869 ) ) ( not ( = ?auto_2001867 ?auto_2001871 ) ) ( not ( = ?auto_2001867 ?auto_2001870 ) ) ( not ( = ?auto_2001867 ?auto_2001872 ) ) ( not ( = ?auto_2001867 ?auto_2001873 ) ) ( not ( = ?auto_2001867 ?auto_2001874 ) ) ( not ( = ?auto_2001867 ?auto_2001875 ) ) ( not ( = ?auto_2001867 ?auto_2001876 ) ) ( not ( = ?auto_2001867 ?auto_2001880 ) ) ( not ( = ?auto_2001867 ?auto_2001883 ) ) ( not ( = ?auto_2001868 ?auto_2001869 ) ) ( not ( = ?auto_2001868 ?auto_2001871 ) ) ( not ( = ?auto_2001868 ?auto_2001870 ) ) ( not ( = ?auto_2001868 ?auto_2001872 ) ) ( not ( = ?auto_2001868 ?auto_2001873 ) ) ( not ( = ?auto_2001868 ?auto_2001874 ) ) ( not ( = ?auto_2001868 ?auto_2001875 ) ) ( not ( = ?auto_2001868 ?auto_2001876 ) ) ( not ( = ?auto_2001868 ?auto_2001880 ) ) ( not ( = ?auto_2001868 ?auto_2001883 ) ) ( not ( = ?auto_2001869 ?auto_2001871 ) ) ( not ( = ?auto_2001869 ?auto_2001870 ) ) ( not ( = ?auto_2001869 ?auto_2001872 ) ) ( not ( = ?auto_2001869 ?auto_2001873 ) ) ( not ( = ?auto_2001869 ?auto_2001874 ) ) ( not ( = ?auto_2001869 ?auto_2001875 ) ) ( not ( = ?auto_2001869 ?auto_2001876 ) ) ( not ( = ?auto_2001869 ?auto_2001880 ) ) ( not ( = ?auto_2001869 ?auto_2001883 ) ) ( not ( = ?auto_2001871 ?auto_2001870 ) ) ( not ( = ?auto_2001871 ?auto_2001872 ) ) ( not ( = ?auto_2001871 ?auto_2001873 ) ) ( not ( = ?auto_2001871 ?auto_2001874 ) ) ( not ( = ?auto_2001871 ?auto_2001875 ) ) ( not ( = ?auto_2001871 ?auto_2001876 ) ) ( not ( = ?auto_2001871 ?auto_2001880 ) ) ( not ( = ?auto_2001871 ?auto_2001883 ) ) ( not ( = ?auto_2001870 ?auto_2001872 ) ) ( not ( = ?auto_2001870 ?auto_2001873 ) ) ( not ( = ?auto_2001870 ?auto_2001874 ) ) ( not ( = ?auto_2001870 ?auto_2001875 ) ) ( not ( = ?auto_2001870 ?auto_2001876 ) ) ( not ( = ?auto_2001870 ?auto_2001880 ) ) ( not ( = ?auto_2001870 ?auto_2001883 ) ) ( not ( = ?auto_2001872 ?auto_2001873 ) ) ( not ( = ?auto_2001872 ?auto_2001874 ) ) ( not ( = ?auto_2001872 ?auto_2001875 ) ) ( not ( = ?auto_2001872 ?auto_2001876 ) ) ( not ( = ?auto_2001872 ?auto_2001880 ) ) ( not ( = ?auto_2001872 ?auto_2001883 ) ) ( not ( = ?auto_2001873 ?auto_2001874 ) ) ( not ( = ?auto_2001873 ?auto_2001875 ) ) ( not ( = ?auto_2001873 ?auto_2001876 ) ) ( not ( = ?auto_2001873 ?auto_2001880 ) ) ( not ( = ?auto_2001873 ?auto_2001883 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001874 ?auto_2001875 ?auto_2001876 )
      ( MAKE-9CRATE-VERIFY ?auto_2001867 ?auto_2001868 ?auto_2001869 ?auto_2001871 ?auto_2001870 ?auto_2001872 ?auto_2001873 ?auto_2001874 ?auto_2001875 ?auto_2001876 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2001884 - SURFACE
      ?auto_2001885 - SURFACE
      ?auto_2001886 - SURFACE
      ?auto_2001888 - SURFACE
      ?auto_2001887 - SURFACE
      ?auto_2001889 - SURFACE
      ?auto_2001890 - SURFACE
      ?auto_2001891 - SURFACE
      ?auto_2001892 - SURFACE
      ?auto_2001893 - SURFACE
      ?auto_2001894 - SURFACE
    )
    :vars
    (
      ?auto_2001900 - HOIST
      ?auto_2001896 - PLACE
      ?auto_2001895 - PLACE
      ?auto_2001899 - HOIST
      ?auto_2001898 - SURFACE
      ?auto_2001897 - TRUCK
      ?auto_2001901 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001900 ?auto_2001896 ) ( IS-CRATE ?auto_2001894 ) ( not ( = ?auto_2001893 ?auto_2001894 ) ) ( not ( = ?auto_2001892 ?auto_2001893 ) ) ( not ( = ?auto_2001892 ?auto_2001894 ) ) ( not ( = ?auto_2001895 ?auto_2001896 ) ) ( HOIST-AT ?auto_2001899 ?auto_2001895 ) ( not ( = ?auto_2001900 ?auto_2001899 ) ) ( SURFACE-AT ?auto_2001894 ?auto_2001895 ) ( ON ?auto_2001894 ?auto_2001898 ) ( CLEAR ?auto_2001894 ) ( not ( = ?auto_2001893 ?auto_2001898 ) ) ( not ( = ?auto_2001894 ?auto_2001898 ) ) ( not ( = ?auto_2001892 ?auto_2001898 ) ) ( SURFACE-AT ?auto_2001892 ?auto_2001896 ) ( CLEAR ?auto_2001892 ) ( IS-CRATE ?auto_2001893 ) ( AVAILABLE ?auto_2001900 ) ( TRUCK-AT ?auto_2001897 ?auto_2001895 ) ( AVAILABLE ?auto_2001899 ) ( SURFACE-AT ?auto_2001893 ?auto_2001895 ) ( ON ?auto_2001893 ?auto_2001901 ) ( CLEAR ?auto_2001893 ) ( not ( = ?auto_2001893 ?auto_2001901 ) ) ( not ( = ?auto_2001894 ?auto_2001901 ) ) ( not ( = ?auto_2001892 ?auto_2001901 ) ) ( not ( = ?auto_2001898 ?auto_2001901 ) ) ( ON ?auto_2001885 ?auto_2001884 ) ( ON ?auto_2001886 ?auto_2001885 ) ( ON ?auto_2001888 ?auto_2001886 ) ( ON ?auto_2001887 ?auto_2001888 ) ( ON ?auto_2001889 ?auto_2001887 ) ( ON ?auto_2001890 ?auto_2001889 ) ( ON ?auto_2001891 ?auto_2001890 ) ( ON ?auto_2001892 ?auto_2001891 ) ( not ( = ?auto_2001884 ?auto_2001885 ) ) ( not ( = ?auto_2001884 ?auto_2001886 ) ) ( not ( = ?auto_2001884 ?auto_2001888 ) ) ( not ( = ?auto_2001884 ?auto_2001887 ) ) ( not ( = ?auto_2001884 ?auto_2001889 ) ) ( not ( = ?auto_2001884 ?auto_2001890 ) ) ( not ( = ?auto_2001884 ?auto_2001891 ) ) ( not ( = ?auto_2001884 ?auto_2001892 ) ) ( not ( = ?auto_2001884 ?auto_2001893 ) ) ( not ( = ?auto_2001884 ?auto_2001894 ) ) ( not ( = ?auto_2001884 ?auto_2001898 ) ) ( not ( = ?auto_2001884 ?auto_2001901 ) ) ( not ( = ?auto_2001885 ?auto_2001886 ) ) ( not ( = ?auto_2001885 ?auto_2001888 ) ) ( not ( = ?auto_2001885 ?auto_2001887 ) ) ( not ( = ?auto_2001885 ?auto_2001889 ) ) ( not ( = ?auto_2001885 ?auto_2001890 ) ) ( not ( = ?auto_2001885 ?auto_2001891 ) ) ( not ( = ?auto_2001885 ?auto_2001892 ) ) ( not ( = ?auto_2001885 ?auto_2001893 ) ) ( not ( = ?auto_2001885 ?auto_2001894 ) ) ( not ( = ?auto_2001885 ?auto_2001898 ) ) ( not ( = ?auto_2001885 ?auto_2001901 ) ) ( not ( = ?auto_2001886 ?auto_2001888 ) ) ( not ( = ?auto_2001886 ?auto_2001887 ) ) ( not ( = ?auto_2001886 ?auto_2001889 ) ) ( not ( = ?auto_2001886 ?auto_2001890 ) ) ( not ( = ?auto_2001886 ?auto_2001891 ) ) ( not ( = ?auto_2001886 ?auto_2001892 ) ) ( not ( = ?auto_2001886 ?auto_2001893 ) ) ( not ( = ?auto_2001886 ?auto_2001894 ) ) ( not ( = ?auto_2001886 ?auto_2001898 ) ) ( not ( = ?auto_2001886 ?auto_2001901 ) ) ( not ( = ?auto_2001888 ?auto_2001887 ) ) ( not ( = ?auto_2001888 ?auto_2001889 ) ) ( not ( = ?auto_2001888 ?auto_2001890 ) ) ( not ( = ?auto_2001888 ?auto_2001891 ) ) ( not ( = ?auto_2001888 ?auto_2001892 ) ) ( not ( = ?auto_2001888 ?auto_2001893 ) ) ( not ( = ?auto_2001888 ?auto_2001894 ) ) ( not ( = ?auto_2001888 ?auto_2001898 ) ) ( not ( = ?auto_2001888 ?auto_2001901 ) ) ( not ( = ?auto_2001887 ?auto_2001889 ) ) ( not ( = ?auto_2001887 ?auto_2001890 ) ) ( not ( = ?auto_2001887 ?auto_2001891 ) ) ( not ( = ?auto_2001887 ?auto_2001892 ) ) ( not ( = ?auto_2001887 ?auto_2001893 ) ) ( not ( = ?auto_2001887 ?auto_2001894 ) ) ( not ( = ?auto_2001887 ?auto_2001898 ) ) ( not ( = ?auto_2001887 ?auto_2001901 ) ) ( not ( = ?auto_2001889 ?auto_2001890 ) ) ( not ( = ?auto_2001889 ?auto_2001891 ) ) ( not ( = ?auto_2001889 ?auto_2001892 ) ) ( not ( = ?auto_2001889 ?auto_2001893 ) ) ( not ( = ?auto_2001889 ?auto_2001894 ) ) ( not ( = ?auto_2001889 ?auto_2001898 ) ) ( not ( = ?auto_2001889 ?auto_2001901 ) ) ( not ( = ?auto_2001890 ?auto_2001891 ) ) ( not ( = ?auto_2001890 ?auto_2001892 ) ) ( not ( = ?auto_2001890 ?auto_2001893 ) ) ( not ( = ?auto_2001890 ?auto_2001894 ) ) ( not ( = ?auto_2001890 ?auto_2001898 ) ) ( not ( = ?auto_2001890 ?auto_2001901 ) ) ( not ( = ?auto_2001891 ?auto_2001892 ) ) ( not ( = ?auto_2001891 ?auto_2001893 ) ) ( not ( = ?auto_2001891 ?auto_2001894 ) ) ( not ( = ?auto_2001891 ?auto_2001898 ) ) ( not ( = ?auto_2001891 ?auto_2001901 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001892 ?auto_2001893 ?auto_2001894 )
      ( MAKE-10CRATE-VERIFY ?auto_2001884 ?auto_2001885 ?auto_2001886 ?auto_2001888 ?auto_2001887 ?auto_2001889 ?auto_2001890 ?auto_2001891 ?auto_2001892 ?auto_2001893 ?auto_2001894 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2001902 - SURFACE
      ?auto_2001903 - SURFACE
      ?auto_2001904 - SURFACE
      ?auto_2001906 - SURFACE
      ?auto_2001905 - SURFACE
      ?auto_2001907 - SURFACE
      ?auto_2001908 - SURFACE
      ?auto_2001909 - SURFACE
      ?auto_2001910 - SURFACE
      ?auto_2001911 - SURFACE
      ?auto_2001912 - SURFACE
      ?auto_2001913 - SURFACE
    )
    :vars
    (
      ?auto_2001919 - HOIST
      ?auto_2001915 - PLACE
      ?auto_2001914 - PLACE
      ?auto_2001918 - HOIST
      ?auto_2001917 - SURFACE
      ?auto_2001916 - TRUCK
      ?auto_2001920 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001919 ?auto_2001915 ) ( IS-CRATE ?auto_2001913 ) ( not ( = ?auto_2001912 ?auto_2001913 ) ) ( not ( = ?auto_2001911 ?auto_2001912 ) ) ( not ( = ?auto_2001911 ?auto_2001913 ) ) ( not ( = ?auto_2001914 ?auto_2001915 ) ) ( HOIST-AT ?auto_2001918 ?auto_2001914 ) ( not ( = ?auto_2001919 ?auto_2001918 ) ) ( SURFACE-AT ?auto_2001913 ?auto_2001914 ) ( ON ?auto_2001913 ?auto_2001917 ) ( CLEAR ?auto_2001913 ) ( not ( = ?auto_2001912 ?auto_2001917 ) ) ( not ( = ?auto_2001913 ?auto_2001917 ) ) ( not ( = ?auto_2001911 ?auto_2001917 ) ) ( SURFACE-AT ?auto_2001911 ?auto_2001915 ) ( CLEAR ?auto_2001911 ) ( IS-CRATE ?auto_2001912 ) ( AVAILABLE ?auto_2001919 ) ( TRUCK-AT ?auto_2001916 ?auto_2001914 ) ( AVAILABLE ?auto_2001918 ) ( SURFACE-AT ?auto_2001912 ?auto_2001914 ) ( ON ?auto_2001912 ?auto_2001920 ) ( CLEAR ?auto_2001912 ) ( not ( = ?auto_2001912 ?auto_2001920 ) ) ( not ( = ?auto_2001913 ?auto_2001920 ) ) ( not ( = ?auto_2001911 ?auto_2001920 ) ) ( not ( = ?auto_2001917 ?auto_2001920 ) ) ( ON ?auto_2001903 ?auto_2001902 ) ( ON ?auto_2001904 ?auto_2001903 ) ( ON ?auto_2001906 ?auto_2001904 ) ( ON ?auto_2001905 ?auto_2001906 ) ( ON ?auto_2001907 ?auto_2001905 ) ( ON ?auto_2001908 ?auto_2001907 ) ( ON ?auto_2001909 ?auto_2001908 ) ( ON ?auto_2001910 ?auto_2001909 ) ( ON ?auto_2001911 ?auto_2001910 ) ( not ( = ?auto_2001902 ?auto_2001903 ) ) ( not ( = ?auto_2001902 ?auto_2001904 ) ) ( not ( = ?auto_2001902 ?auto_2001906 ) ) ( not ( = ?auto_2001902 ?auto_2001905 ) ) ( not ( = ?auto_2001902 ?auto_2001907 ) ) ( not ( = ?auto_2001902 ?auto_2001908 ) ) ( not ( = ?auto_2001902 ?auto_2001909 ) ) ( not ( = ?auto_2001902 ?auto_2001910 ) ) ( not ( = ?auto_2001902 ?auto_2001911 ) ) ( not ( = ?auto_2001902 ?auto_2001912 ) ) ( not ( = ?auto_2001902 ?auto_2001913 ) ) ( not ( = ?auto_2001902 ?auto_2001917 ) ) ( not ( = ?auto_2001902 ?auto_2001920 ) ) ( not ( = ?auto_2001903 ?auto_2001904 ) ) ( not ( = ?auto_2001903 ?auto_2001906 ) ) ( not ( = ?auto_2001903 ?auto_2001905 ) ) ( not ( = ?auto_2001903 ?auto_2001907 ) ) ( not ( = ?auto_2001903 ?auto_2001908 ) ) ( not ( = ?auto_2001903 ?auto_2001909 ) ) ( not ( = ?auto_2001903 ?auto_2001910 ) ) ( not ( = ?auto_2001903 ?auto_2001911 ) ) ( not ( = ?auto_2001903 ?auto_2001912 ) ) ( not ( = ?auto_2001903 ?auto_2001913 ) ) ( not ( = ?auto_2001903 ?auto_2001917 ) ) ( not ( = ?auto_2001903 ?auto_2001920 ) ) ( not ( = ?auto_2001904 ?auto_2001906 ) ) ( not ( = ?auto_2001904 ?auto_2001905 ) ) ( not ( = ?auto_2001904 ?auto_2001907 ) ) ( not ( = ?auto_2001904 ?auto_2001908 ) ) ( not ( = ?auto_2001904 ?auto_2001909 ) ) ( not ( = ?auto_2001904 ?auto_2001910 ) ) ( not ( = ?auto_2001904 ?auto_2001911 ) ) ( not ( = ?auto_2001904 ?auto_2001912 ) ) ( not ( = ?auto_2001904 ?auto_2001913 ) ) ( not ( = ?auto_2001904 ?auto_2001917 ) ) ( not ( = ?auto_2001904 ?auto_2001920 ) ) ( not ( = ?auto_2001906 ?auto_2001905 ) ) ( not ( = ?auto_2001906 ?auto_2001907 ) ) ( not ( = ?auto_2001906 ?auto_2001908 ) ) ( not ( = ?auto_2001906 ?auto_2001909 ) ) ( not ( = ?auto_2001906 ?auto_2001910 ) ) ( not ( = ?auto_2001906 ?auto_2001911 ) ) ( not ( = ?auto_2001906 ?auto_2001912 ) ) ( not ( = ?auto_2001906 ?auto_2001913 ) ) ( not ( = ?auto_2001906 ?auto_2001917 ) ) ( not ( = ?auto_2001906 ?auto_2001920 ) ) ( not ( = ?auto_2001905 ?auto_2001907 ) ) ( not ( = ?auto_2001905 ?auto_2001908 ) ) ( not ( = ?auto_2001905 ?auto_2001909 ) ) ( not ( = ?auto_2001905 ?auto_2001910 ) ) ( not ( = ?auto_2001905 ?auto_2001911 ) ) ( not ( = ?auto_2001905 ?auto_2001912 ) ) ( not ( = ?auto_2001905 ?auto_2001913 ) ) ( not ( = ?auto_2001905 ?auto_2001917 ) ) ( not ( = ?auto_2001905 ?auto_2001920 ) ) ( not ( = ?auto_2001907 ?auto_2001908 ) ) ( not ( = ?auto_2001907 ?auto_2001909 ) ) ( not ( = ?auto_2001907 ?auto_2001910 ) ) ( not ( = ?auto_2001907 ?auto_2001911 ) ) ( not ( = ?auto_2001907 ?auto_2001912 ) ) ( not ( = ?auto_2001907 ?auto_2001913 ) ) ( not ( = ?auto_2001907 ?auto_2001917 ) ) ( not ( = ?auto_2001907 ?auto_2001920 ) ) ( not ( = ?auto_2001908 ?auto_2001909 ) ) ( not ( = ?auto_2001908 ?auto_2001910 ) ) ( not ( = ?auto_2001908 ?auto_2001911 ) ) ( not ( = ?auto_2001908 ?auto_2001912 ) ) ( not ( = ?auto_2001908 ?auto_2001913 ) ) ( not ( = ?auto_2001908 ?auto_2001917 ) ) ( not ( = ?auto_2001908 ?auto_2001920 ) ) ( not ( = ?auto_2001909 ?auto_2001910 ) ) ( not ( = ?auto_2001909 ?auto_2001911 ) ) ( not ( = ?auto_2001909 ?auto_2001912 ) ) ( not ( = ?auto_2001909 ?auto_2001913 ) ) ( not ( = ?auto_2001909 ?auto_2001917 ) ) ( not ( = ?auto_2001909 ?auto_2001920 ) ) ( not ( = ?auto_2001910 ?auto_2001911 ) ) ( not ( = ?auto_2001910 ?auto_2001912 ) ) ( not ( = ?auto_2001910 ?auto_2001913 ) ) ( not ( = ?auto_2001910 ?auto_2001917 ) ) ( not ( = ?auto_2001910 ?auto_2001920 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001911 ?auto_2001912 ?auto_2001913 )
      ( MAKE-11CRATE-VERIFY ?auto_2001902 ?auto_2001903 ?auto_2001904 ?auto_2001906 ?auto_2001905 ?auto_2001907 ?auto_2001908 ?auto_2001909 ?auto_2001910 ?auto_2001911 ?auto_2001912 ?auto_2001913 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2001921 - SURFACE
      ?auto_2001922 - SURFACE
      ?auto_2001923 - SURFACE
      ?auto_2001925 - SURFACE
      ?auto_2001924 - SURFACE
      ?auto_2001926 - SURFACE
      ?auto_2001927 - SURFACE
      ?auto_2001928 - SURFACE
      ?auto_2001929 - SURFACE
      ?auto_2001930 - SURFACE
      ?auto_2001931 - SURFACE
      ?auto_2001932 - SURFACE
      ?auto_2001933 - SURFACE
    )
    :vars
    (
      ?auto_2001939 - HOIST
      ?auto_2001935 - PLACE
      ?auto_2001934 - PLACE
      ?auto_2001938 - HOIST
      ?auto_2001937 - SURFACE
      ?auto_2001936 - TRUCK
      ?auto_2001940 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001939 ?auto_2001935 ) ( IS-CRATE ?auto_2001933 ) ( not ( = ?auto_2001932 ?auto_2001933 ) ) ( not ( = ?auto_2001931 ?auto_2001932 ) ) ( not ( = ?auto_2001931 ?auto_2001933 ) ) ( not ( = ?auto_2001934 ?auto_2001935 ) ) ( HOIST-AT ?auto_2001938 ?auto_2001934 ) ( not ( = ?auto_2001939 ?auto_2001938 ) ) ( SURFACE-AT ?auto_2001933 ?auto_2001934 ) ( ON ?auto_2001933 ?auto_2001937 ) ( CLEAR ?auto_2001933 ) ( not ( = ?auto_2001932 ?auto_2001937 ) ) ( not ( = ?auto_2001933 ?auto_2001937 ) ) ( not ( = ?auto_2001931 ?auto_2001937 ) ) ( SURFACE-AT ?auto_2001931 ?auto_2001935 ) ( CLEAR ?auto_2001931 ) ( IS-CRATE ?auto_2001932 ) ( AVAILABLE ?auto_2001939 ) ( TRUCK-AT ?auto_2001936 ?auto_2001934 ) ( AVAILABLE ?auto_2001938 ) ( SURFACE-AT ?auto_2001932 ?auto_2001934 ) ( ON ?auto_2001932 ?auto_2001940 ) ( CLEAR ?auto_2001932 ) ( not ( = ?auto_2001932 ?auto_2001940 ) ) ( not ( = ?auto_2001933 ?auto_2001940 ) ) ( not ( = ?auto_2001931 ?auto_2001940 ) ) ( not ( = ?auto_2001937 ?auto_2001940 ) ) ( ON ?auto_2001922 ?auto_2001921 ) ( ON ?auto_2001923 ?auto_2001922 ) ( ON ?auto_2001925 ?auto_2001923 ) ( ON ?auto_2001924 ?auto_2001925 ) ( ON ?auto_2001926 ?auto_2001924 ) ( ON ?auto_2001927 ?auto_2001926 ) ( ON ?auto_2001928 ?auto_2001927 ) ( ON ?auto_2001929 ?auto_2001928 ) ( ON ?auto_2001930 ?auto_2001929 ) ( ON ?auto_2001931 ?auto_2001930 ) ( not ( = ?auto_2001921 ?auto_2001922 ) ) ( not ( = ?auto_2001921 ?auto_2001923 ) ) ( not ( = ?auto_2001921 ?auto_2001925 ) ) ( not ( = ?auto_2001921 ?auto_2001924 ) ) ( not ( = ?auto_2001921 ?auto_2001926 ) ) ( not ( = ?auto_2001921 ?auto_2001927 ) ) ( not ( = ?auto_2001921 ?auto_2001928 ) ) ( not ( = ?auto_2001921 ?auto_2001929 ) ) ( not ( = ?auto_2001921 ?auto_2001930 ) ) ( not ( = ?auto_2001921 ?auto_2001931 ) ) ( not ( = ?auto_2001921 ?auto_2001932 ) ) ( not ( = ?auto_2001921 ?auto_2001933 ) ) ( not ( = ?auto_2001921 ?auto_2001937 ) ) ( not ( = ?auto_2001921 ?auto_2001940 ) ) ( not ( = ?auto_2001922 ?auto_2001923 ) ) ( not ( = ?auto_2001922 ?auto_2001925 ) ) ( not ( = ?auto_2001922 ?auto_2001924 ) ) ( not ( = ?auto_2001922 ?auto_2001926 ) ) ( not ( = ?auto_2001922 ?auto_2001927 ) ) ( not ( = ?auto_2001922 ?auto_2001928 ) ) ( not ( = ?auto_2001922 ?auto_2001929 ) ) ( not ( = ?auto_2001922 ?auto_2001930 ) ) ( not ( = ?auto_2001922 ?auto_2001931 ) ) ( not ( = ?auto_2001922 ?auto_2001932 ) ) ( not ( = ?auto_2001922 ?auto_2001933 ) ) ( not ( = ?auto_2001922 ?auto_2001937 ) ) ( not ( = ?auto_2001922 ?auto_2001940 ) ) ( not ( = ?auto_2001923 ?auto_2001925 ) ) ( not ( = ?auto_2001923 ?auto_2001924 ) ) ( not ( = ?auto_2001923 ?auto_2001926 ) ) ( not ( = ?auto_2001923 ?auto_2001927 ) ) ( not ( = ?auto_2001923 ?auto_2001928 ) ) ( not ( = ?auto_2001923 ?auto_2001929 ) ) ( not ( = ?auto_2001923 ?auto_2001930 ) ) ( not ( = ?auto_2001923 ?auto_2001931 ) ) ( not ( = ?auto_2001923 ?auto_2001932 ) ) ( not ( = ?auto_2001923 ?auto_2001933 ) ) ( not ( = ?auto_2001923 ?auto_2001937 ) ) ( not ( = ?auto_2001923 ?auto_2001940 ) ) ( not ( = ?auto_2001925 ?auto_2001924 ) ) ( not ( = ?auto_2001925 ?auto_2001926 ) ) ( not ( = ?auto_2001925 ?auto_2001927 ) ) ( not ( = ?auto_2001925 ?auto_2001928 ) ) ( not ( = ?auto_2001925 ?auto_2001929 ) ) ( not ( = ?auto_2001925 ?auto_2001930 ) ) ( not ( = ?auto_2001925 ?auto_2001931 ) ) ( not ( = ?auto_2001925 ?auto_2001932 ) ) ( not ( = ?auto_2001925 ?auto_2001933 ) ) ( not ( = ?auto_2001925 ?auto_2001937 ) ) ( not ( = ?auto_2001925 ?auto_2001940 ) ) ( not ( = ?auto_2001924 ?auto_2001926 ) ) ( not ( = ?auto_2001924 ?auto_2001927 ) ) ( not ( = ?auto_2001924 ?auto_2001928 ) ) ( not ( = ?auto_2001924 ?auto_2001929 ) ) ( not ( = ?auto_2001924 ?auto_2001930 ) ) ( not ( = ?auto_2001924 ?auto_2001931 ) ) ( not ( = ?auto_2001924 ?auto_2001932 ) ) ( not ( = ?auto_2001924 ?auto_2001933 ) ) ( not ( = ?auto_2001924 ?auto_2001937 ) ) ( not ( = ?auto_2001924 ?auto_2001940 ) ) ( not ( = ?auto_2001926 ?auto_2001927 ) ) ( not ( = ?auto_2001926 ?auto_2001928 ) ) ( not ( = ?auto_2001926 ?auto_2001929 ) ) ( not ( = ?auto_2001926 ?auto_2001930 ) ) ( not ( = ?auto_2001926 ?auto_2001931 ) ) ( not ( = ?auto_2001926 ?auto_2001932 ) ) ( not ( = ?auto_2001926 ?auto_2001933 ) ) ( not ( = ?auto_2001926 ?auto_2001937 ) ) ( not ( = ?auto_2001926 ?auto_2001940 ) ) ( not ( = ?auto_2001927 ?auto_2001928 ) ) ( not ( = ?auto_2001927 ?auto_2001929 ) ) ( not ( = ?auto_2001927 ?auto_2001930 ) ) ( not ( = ?auto_2001927 ?auto_2001931 ) ) ( not ( = ?auto_2001927 ?auto_2001932 ) ) ( not ( = ?auto_2001927 ?auto_2001933 ) ) ( not ( = ?auto_2001927 ?auto_2001937 ) ) ( not ( = ?auto_2001927 ?auto_2001940 ) ) ( not ( = ?auto_2001928 ?auto_2001929 ) ) ( not ( = ?auto_2001928 ?auto_2001930 ) ) ( not ( = ?auto_2001928 ?auto_2001931 ) ) ( not ( = ?auto_2001928 ?auto_2001932 ) ) ( not ( = ?auto_2001928 ?auto_2001933 ) ) ( not ( = ?auto_2001928 ?auto_2001937 ) ) ( not ( = ?auto_2001928 ?auto_2001940 ) ) ( not ( = ?auto_2001929 ?auto_2001930 ) ) ( not ( = ?auto_2001929 ?auto_2001931 ) ) ( not ( = ?auto_2001929 ?auto_2001932 ) ) ( not ( = ?auto_2001929 ?auto_2001933 ) ) ( not ( = ?auto_2001929 ?auto_2001937 ) ) ( not ( = ?auto_2001929 ?auto_2001940 ) ) ( not ( = ?auto_2001930 ?auto_2001931 ) ) ( not ( = ?auto_2001930 ?auto_2001932 ) ) ( not ( = ?auto_2001930 ?auto_2001933 ) ) ( not ( = ?auto_2001930 ?auto_2001937 ) ) ( not ( = ?auto_2001930 ?auto_2001940 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001931 ?auto_2001932 ?auto_2001933 )
      ( MAKE-12CRATE-VERIFY ?auto_2001921 ?auto_2001922 ?auto_2001923 ?auto_2001925 ?auto_2001924 ?auto_2001926 ?auto_2001927 ?auto_2001928 ?auto_2001929 ?auto_2001930 ?auto_2001931 ?auto_2001932 ?auto_2001933 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2001941 - SURFACE
      ?auto_2001942 - SURFACE
      ?auto_2001943 - SURFACE
      ?auto_2001945 - SURFACE
      ?auto_2001944 - SURFACE
      ?auto_2001946 - SURFACE
      ?auto_2001947 - SURFACE
      ?auto_2001948 - SURFACE
      ?auto_2001949 - SURFACE
      ?auto_2001950 - SURFACE
      ?auto_2001951 - SURFACE
      ?auto_2001952 - SURFACE
      ?auto_2001953 - SURFACE
      ?auto_2001954 - SURFACE
    )
    :vars
    (
      ?auto_2001960 - HOIST
      ?auto_2001956 - PLACE
      ?auto_2001955 - PLACE
      ?auto_2001959 - HOIST
      ?auto_2001958 - SURFACE
      ?auto_2001957 - TRUCK
      ?auto_2001961 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001960 ?auto_2001956 ) ( IS-CRATE ?auto_2001954 ) ( not ( = ?auto_2001953 ?auto_2001954 ) ) ( not ( = ?auto_2001952 ?auto_2001953 ) ) ( not ( = ?auto_2001952 ?auto_2001954 ) ) ( not ( = ?auto_2001955 ?auto_2001956 ) ) ( HOIST-AT ?auto_2001959 ?auto_2001955 ) ( not ( = ?auto_2001960 ?auto_2001959 ) ) ( SURFACE-AT ?auto_2001954 ?auto_2001955 ) ( ON ?auto_2001954 ?auto_2001958 ) ( CLEAR ?auto_2001954 ) ( not ( = ?auto_2001953 ?auto_2001958 ) ) ( not ( = ?auto_2001954 ?auto_2001958 ) ) ( not ( = ?auto_2001952 ?auto_2001958 ) ) ( SURFACE-AT ?auto_2001952 ?auto_2001956 ) ( CLEAR ?auto_2001952 ) ( IS-CRATE ?auto_2001953 ) ( AVAILABLE ?auto_2001960 ) ( TRUCK-AT ?auto_2001957 ?auto_2001955 ) ( AVAILABLE ?auto_2001959 ) ( SURFACE-AT ?auto_2001953 ?auto_2001955 ) ( ON ?auto_2001953 ?auto_2001961 ) ( CLEAR ?auto_2001953 ) ( not ( = ?auto_2001953 ?auto_2001961 ) ) ( not ( = ?auto_2001954 ?auto_2001961 ) ) ( not ( = ?auto_2001952 ?auto_2001961 ) ) ( not ( = ?auto_2001958 ?auto_2001961 ) ) ( ON ?auto_2001942 ?auto_2001941 ) ( ON ?auto_2001943 ?auto_2001942 ) ( ON ?auto_2001945 ?auto_2001943 ) ( ON ?auto_2001944 ?auto_2001945 ) ( ON ?auto_2001946 ?auto_2001944 ) ( ON ?auto_2001947 ?auto_2001946 ) ( ON ?auto_2001948 ?auto_2001947 ) ( ON ?auto_2001949 ?auto_2001948 ) ( ON ?auto_2001950 ?auto_2001949 ) ( ON ?auto_2001951 ?auto_2001950 ) ( ON ?auto_2001952 ?auto_2001951 ) ( not ( = ?auto_2001941 ?auto_2001942 ) ) ( not ( = ?auto_2001941 ?auto_2001943 ) ) ( not ( = ?auto_2001941 ?auto_2001945 ) ) ( not ( = ?auto_2001941 ?auto_2001944 ) ) ( not ( = ?auto_2001941 ?auto_2001946 ) ) ( not ( = ?auto_2001941 ?auto_2001947 ) ) ( not ( = ?auto_2001941 ?auto_2001948 ) ) ( not ( = ?auto_2001941 ?auto_2001949 ) ) ( not ( = ?auto_2001941 ?auto_2001950 ) ) ( not ( = ?auto_2001941 ?auto_2001951 ) ) ( not ( = ?auto_2001941 ?auto_2001952 ) ) ( not ( = ?auto_2001941 ?auto_2001953 ) ) ( not ( = ?auto_2001941 ?auto_2001954 ) ) ( not ( = ?auto_2001941 ?auto_2001958 ) ) ( not ( = ?auto_2001941 ?auto_2001961 ) ) ( not ( = ?auto_2001942 ?auto_2001943 ) ) ( not ( = ?auto_2001942 ?auto_2001945 ) ) ( not ( = ?auto_2001942 ?auto_2001944 ) ) ( not ( = ?auto_2001942 ?auto_2001946 ) ) ( not ( = ?auto_2001942 ?auto_2001947 ) ) ( not ( = ?auto_2001942 ?auto_2001948 ) ) ( not ( = ?auto_2001942 ?auto_2001949 ) ) ( not ( = ?auto_2001942 ?auto_2001950 ) ) ( not ( = ?auto_2001942 ?auto_2001951 ) ) ( not ( = ?auto_2001942 ?auto_2001952 ) ) ( not ( = ?auto_2001942 ?auto_2001953 ) ) ( not ( = ?auto_2001942 ?auto_2001954 ) ) ( not ( = ?auto_2001942 ?auto_2001958 ) ) ( not ( = ?auto_2001942 ?auto_2001961 ) ) ( not ( = ?auto_2001943 ?auto_2001945 ) ) ( not ( = ?auto_2001943 ?auto_2001944 ) ) ( not ( = ?auto_2001943 ?auto_2001946 ) ) ( not ( = ?auto_2001943 ?auto_2001947 ) ) ( not ( = ?auto_2001943 ?auto_2001948 ) ) ( not ( = ?auto_2001943 ?auto_2001949 ) ) ( not ( = ?auto_2001943 ?auto_2001950 ) ) ( not ( = ?auto_2001943 ?auto_2001951 ) ) ( not ( = ?auto_2001943 ?auto_2001952 ) ) ( not ( = ?auto_2001943 ?auto_2001953 ) ) ( not ( = ?auto_2001943 ?auto_2001954 ) ) ( not ( = ?auto_2001943 ?auto_2001958 ) ) ( not ( = ?auto_2001943 ?auto_2001961 ) ) ( not ( = ?auto_2001945 ?auto_2001944 ) ) ( not ( = ?auto_2001945 ?auto_2001946 ) ) ( not ( = ?auto_2001945 ?auto_2001947 ) ) ( not ( = ?auto_2001945 ?auto_2001948 ) ) ( not ( = ?auto_2001945 ?auto_2001949 ) ) ( not ( = ?auto_2001945 ?auto_2001950 ) ) ( not ( = ?auto_2001945 ?auto_2001951 ) ) ( not ( = ?auto_2001945 ?auto_2001952 ) ) ( not ( = ?auto_2001945 ?auto_2001953 ) ) ( not ( = ?auto_2001945 ?auto_2001954 ) ) ( not ( = ?auto_2001945 ?auto_2001958 ) ) ( not ( = ?auto_2001945 ?auto_2001961 ) ) ( not ( = ?auto_2001944 ?auto_2001946 ) ) ( not ( = ?auto_2001944 ?auto_2001947 ) ) ( not ( = ?auto_2001944 ?auto_2001948 ) ) ( not ( = ?auto_2001944 ?auto_2001949 ) ) ( not ( = ?auto_2001944 ?auto_2001950 ) ) ( not ( = ?auto_2001944 ?auto_2001951 ) ) ( not ( = ?auto_2001944 ?auto_2001952 ) ) ( not ( = ?auto_2001944 ?auto_2001953 ) ) ( not ( = ?auto_2001944 ?auto_2001954 ) ) ( not ( = ?auto_2001944 ?auto_2001958 ) ) ( not ( = ?auto_2001944 ?auto_2001961 ) ) ( not ( = ?auto_2001946 ?auto_2001947 ) ) ( not ( = ?auto_2001946 ?auto_2001948 ) ) ( not ( = ?auto_2001946 ?auto_2001949 ) ) ( not ( = ?auto_2001946 ?auto_2001950 ) ) ( not ( = ?auto_2001946 ?auto_2001951 ) ) ( not ( = ?auto_2001946 ?auto_2001952 ) ) ( not ( = ?auto_2001946 ?auto_2001953 ) ) ( not ( = ?auto_2001946 ?auto_2001954 ) ) ( not ( = ?auto_2001946 ?auto_2001958 ) ) ( not ( = ?auto_2001946 ?auto_2001961 ) ) ( not ( = ?auto_2001947 ?auto_2001948 ) ) ( not ( = ?auto_2001947 ?auto_2001949 ) ) ( not ( = ?auto_2001947 ?auto_2001950 ) ) ( not ( = ?auto_2001947 ?auto_2001951 ) ) ( not ( = ?auto_2001947 ?auto_2001952 ) ) ( not ( = ?auto_2001947 ?auto_2001953 ) ) ( not ( = ?auto_2001947 ?auto_2001954 ) ) ( not ( = ?auto_2001947 ?auto_2001958 ) ) ( not ( = ?auto_2001947 ?auto_2001961 ) ) ( not ( = ?auto_2001948 ?auto_2001949 ) ) ( not ( = ?auto_2001948 ?auto_2001950 ) ) ( not ( = ?auto_2001948 ?auto_2001951 ) ) ( not ( = ?auto_2001948 ?auto_2001952 ) ) ( not ( = ?auto_2001948 ?auto_2001953 ) ) ( not ( = ?auto_2001948 ?auto_2001954 ) ) ( not ( = ?auto_2001948 ?auto_2001958 ) ) ( not ( = ?auto_2001948 ?auto_2001961 ) ) ( not ( = ?auto_2001949 ?auto_2001950 ) ) ( not ( = ?auto_2001949 ?auto_2001951 ) ) ( not ( = ?auto_2001949 ?auto_2001952 ) ) ( not ( = ?auto_2001949 ?auto_2001953 ) ) ( not ( = ?auto_2001949 ?auto_2001954 ) ) ( not ( = ?auto_2001949 ?auto_2001958 ) ) ( not ( = ?auto_2001949 ?auto_2001961 ) ) ( not ( = ?auto_2001950 ?auto_2001951 ) ) ( not ( = ?auto_2001950 ?auto_2001952 ) ) ( not ( = ?auto_2001950 ?auto_2001953 ) ) ( not ( = ?auto_2001950 ?auto_2001954 ) ) ( not ( = ?auto_2001950 ?auto_2001958 ) ) ( not ( = ?auto_2001950 ?auto_2001961 ) ) ( not ( = ?auto_2001951 ?auto_2001952 ) ) ( not ( = ?auto_2001951 ?auto_2001953 ) ) ( not ( = ?auto_2001951 ?auto_2001954 ) ) ( not ( = ?auto_2001951 ?auto_2001958 ) ) ( not ( = ?auto_2001951 ?auto_2001961 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001952 ?auto_2001953 ?auto_2001954 )
      ( MAKE-13CRATE-VERIFY ?auto_2001941 ?auto_2001942 ?auto_2001943 ?auto_2001945 ?auto_2001944 ?auto_2001946 ?auto_2001947 ?auto_2001948 ?auto_2001949 ?auto_2001950 ?auto_2001951 ?auto_2001952 ?auto_2001953 ?auto_2001954 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2001962 - SURFACE
      ?auto_2001963 - SURFACE
      ?auto_2001964 - SURFACE
      ?auto_2001966 - SURFACE
      ?auto_2001965 - SURFACE
      ?auto_2001967 - SURFACE
      ?auto_2001968 - SURFACE
      ?auto_2001969 - SURFACE
      ?auto_2001970 - SURFACE
      ?auto_2001971 - SURFACE
      ?auto_2001972 - SURFACE
      ?auto_2001973 - SURFACE
      ?auto_2001974 - SURFACE
      ?auto_2001975 - SURFACE
      ?auto_2001976 - SURFACE
    )
    :vars
    (
      ?auto_2001982 - HOIST
      ?auto_2001978 - PLACE
      ?auto_2001977 - PLACE
      ?auto_2001981 - HOIST
      ?auto_2001980 - SURFACE
      ?auto_2001979 - TRUCK
      ?auto_2001983 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001982 ?auto_2001978 ) ( IS-CRATE ?auto_2001976 ) ( not ( = ?auto_2001975 ?auto_2001976 ) ) ( not ( = ?auto_2001974 ?auto_2001975 ) ) ( not ( = ?auto_2001974 ?auto_2001976 ) ) ( not ( = ?auto_2001977 ?auto_2001978 ) ) ( HOIST-AT ?auto_2001981 ?auto_2001977 ) ( not ( = ?auto_2001982 ?auto_2001981 ) ) ( SURFACE-AT ?auto_2001976 ?auto_2001977 ) ( ON ?auto_2001976 ?auto_2001980 ) ( CLEAR ?auto_2001976 ) ( not ( = ?auto_2001975 ?auto_2001980 ) ) ( not ( = ?auto_2001976 ?auto_2001980 ) ) ( not ( = ?auto_2001974 ?auto_2001980 ) ) ( SURFACE-AT ?auto_2001974 ?auto_2001978 ) ( CLEAR ?auto_2001974 ) ( IS-CRATE ?auto_2001975 ) ( AVAILABLE ?auto_2001982 ) ( TRUCK-AT ?auto_2001979 ?auto_2001977 ) ( AVAILABLE ?auto_2001981 ) ( SURFACE-AT ?auto_2001975 ?auto_2001977 ) ( ON ?auto_2001975 ?auto_2001983 ) ( CLEAR ?auto_2001975 ) ( not ( = ?auto_2001975 ?auto_2001983 ) ) ( not ( = ?auto_2001976 ?auto_2001983 ) ) ( not ( = ?auto_2001974 ?auto_2001983 ) ) ( not ( = ?auto_2001980 ?auto_2001983 ) ) ( ON ?auto_2001963 ?auto_2001962 ) ( ON ?auto_2001964 ?auto_2001963 ) ( ON ?auto_2001966 ?auto_2001964 ) ( ON ?auto_2001965 ?auto_2001966 ) ( ON ?auto_2001967 ?auto_2001965 ) ( ON ?auto_2001968 ?auto_2001967 ) ( ON ?auto_2001969 ?auto_2001968 ) ( ON ?auto_2001970 ?auto_2001969 ) ( ON ?auto_2001971 ?auto_2001970 ) ( ON ?auto_2001972 ?auto_2001971 ) ( ON ?auto_2001973 ?auto_2001972 ) ( ON ?auto_2001974 ?auto_2001973 ) ( not ( = ?auto_2001962 ?auto_2001963 ) ) ( not ( = ?auto_2001962 ?auto_2001964 ) ) ( not ( = ?auto_2001962 ?auto_2001966 ) ) ( not ( = ?auto_2001962 ?auto_2001965 ) ) ( not ( = ?auto_2001962 ?auto_2001967 ) ) ( not ( = ?auto_2001962 ?auto_2001968 ) ) ( not ( = ?auto_2001962 ?auto_2001969 ) ) ( not ( = ?auto_2001962 ?auto_2001970 ) ) ( not ( = ?auto_2001962 ?auto_2001971 ) ) ( not ( = ?auto_2001962 ?auto_2001972 ) ) ( not ( = ?auto_2001962 ?auto_2001973 ) ) ( not ( = ?auto_2001962 ?auto_2001974 ) ) ( not ( = ?auto_2001962 ?auto_2001975 ) ) ( not ( = ?auto_2001962 ?auto_2001976 ) ) ( not ( = ?auto_2001962 ?auto_2001980 ) ) ( not ( = ?auto_2001962 ?auto_2001983 ) ) ( not ( = ?auto_2001963 ?auto_2001964 ) ) ( not ( = ?auto_2001963 ?auto_2001966 ) ) ( not ( = ?auto_2001963 ?auto_2001965 ) ) ( not ( = ?auto_2001963 ?auto_2001967 ) ) ( not ( = ?auto_2001963 ?auto_2001968 ) ) ( not ( = ?auto_2001963 ?auto_2001969 ) ) ( not ( = ?auto_2001963 ?auto_2001970 ) ) ( not ( = ?auto_2001963 ?auto_2001971 ) ) ( not ( = ?auto_2001963 ?auto_2001972 ) ) ( not ( = ?auto_2001963 ?auto_2001973 ) ) ( not ( = ?auto_2001963 ?auto_2001974 ) ) ( not ( = ?auto_2001963 ?auto_2001975 ) ) ( not ( = ?auto_2001963 ?auto_2001976 ) ) ( not ( = ?auto_2001963 ?auto_2001980 ) ) ( not ( = ?auto_2001963 ?auto_2001983 ) ) ( not ( = ?auto_2001964 ?auto_2001966 ) ) ( not ( = ?auto_2001964 ?auto_2001965 ) ) ( not ( = ?auto_2001964 ?auto_2001967 ) ) ( not ( = ?auto_2001964 ?auto_2001968 ) ) ( not ( = ?auto_2001964 ?auto_2001969 ) ) ( not ( = ?auto_2001964 ?auto_2001970 ) ) ( not ( = ?auto_2001964 ?auto_2001971 ) ) ( not ( = ?auto_2001964 ?auto_2001972 ) ) ( not ( = ?auto_2001964 ?auto_2001973 ) ) ( not ( = ?auto_2001964 ?auto_2001974 ) ) ( not ( = ?auto_2001964 ?auto_2001975 ) ) ( not ( = ?auto_2001964 ?auto_2001976 ) ) ( not ( = ?auto_2001964 ?auto_2001980 ) ) ( not ( = ?auto_2001964 ?auto_2001983 ) ) ( not ( = ?auto_2001966 ?auto_2001965 ) ) ( not ( = ?auto_2001966 ?auto_2001967 ) ) ( not ( = ?auto_2001966 ?auto_2001968 ) ) ( not ( = ?auto_2001966 ?auto_2001969 ) ) ( not ( = ?auto_2001966 ?auto_2001970 ) ) ( not ( = ?auto_2001966 ?auto_2001971 ) ) ( not ( = ?auto_2001966 ?auto_2001972 ) ) ( not ( = ?auto_2001966 ?auto_2001973 ) ) ( not ( = ?auto_2001966 ?auto_2001974 ) ) ( not ( = ?auto_2001966 ?auto_2001975 ) ) ( not ( = ?auto_2001966 ?auto_2001976 ) ) ( not ( = ?auto_2001966 ?auto_2001980 ) ) ( not ( = ?auto_2001966 ?auto_2001983 ) ) ( not ( = ?auto_2001965 ?auto_2001967 ) ) ( not ( = ?auto_2001965 ?auto_2001968 ) ) ( not ( = ?auto_2001965 ?auto_2001969 ) ) ( not ( = ?auto_2001965 ?auto_2001970 ) ) ( not ( = ?auto_2001965 ?auto_2001971 ) ) ( not ( = ?auto_2001965 ?auto_2001972 ) ) ( not ( = ?auto_2001965 ?auto_2001973 ) ) ( not ( = ?auto_2001965 ?auto_2001974 ) ) ( not ( = ?auto_2001965 ?auto_2001975 ) ) ( not ( = ?auto_2001965 ?auto_2001976 ) ) ( not ( = ?auto_2001965 ?auto_2001980 ) ) ( not ( = ?auto_2001965 ?auto_2001983 ) ) ( not ( = ?auto_2001967 ?auto_2001968 ) ) ( not ( = ?auto_2001967 ?auto_2001969 ) ) ( not ( = ?auto_2001967 ?auto_2001970 ) ) ( not ( = ?auto_2001967 ?auto_2001971 ) ) ( not ( = ?auto_2001967 ?auto_2001972 ) ) ( not ( = ?auto_2001967 ?auto_2001973 ) ) ( not ( = ?auto_2001967 ?auto_2001974 ) ) ( not ( = ?auto_2001967 ?auto_2001975 ) ) ( not ( = ?auto_2001967 ?auto_2001976 ) ) ( not ( = ?auto_2001967 ?auto_2001980 ) ) ( not ( = ?auto_2001967 ?auto_2001983 ) ) ( not ( = ?auto_2001968 ?auto_2001969 ) ) ( not ( = ?auto_2001968 ?auto_2001970 ) ) ( not ( = ?auto_2001968 ?auto_2001971 ) ) ( not ( = ?auto_2001968 ?auto_2001972 ) ) ( not ( = ?auto_2001968 ?auto_2001973 ) ) ( not ( = ?auto_2001968 ?auto_2001974 ) ) ( not ( = ?auto_2001968 ?auto_2001975 ) ) ( not ( = ?auto_2001968 ?auto_2001976 ) ) ( not ( = ?auto_2001968 ?auto_2001980 ) ) ( not ( = ?auto_2001968 ?auto_2001983 ) ) ( not ( = ?auto_2001969 ?auto_2001970 ) ) ( not ( = ?auto_2001969 ?auto_2001971 ) ) ( not ( = ?auto_2001969 ?auto_2001972 ) ) ( not ( = ?auto_2001969 ?auto_2001973 ) ) ( not ( = ?auto_2001969 ?auto_2001974 ) ) ( not ( = ?auto_2001969 ?auto_2001975 ) ) ( not ( = ?auto_2001969 ?auto_2001976 ) ) ( not ( = ?auto_2001969 ?auto_2001980 ) ) ( not ( = ?auto_2001969 ?auto_2001983 ) ) ( not ( = ?auto_2001970 ?auto_2001971 ) ) ( not ( = ?auto_2001970 ?auto_2001972 ) ) ( not ( = ?auto_2001970 ?auto_2001973 ) ) ( not ( = ?auto_2001970 ?auto_2001974 ) ) ( not ( = ?auto_2001970 ?auto_2001975 ) ) ( not ( = ?auto_2001970 ?auto_2001976 ) ) ( not ( = ?auto_2001970 ?auto_2001980 ) ) ( not ( = ?auto_2001970 ?auto_2001983 ) ) ( not ( = ?auto_2001971 ?auto_2001972 ) ) ( not ( = ?auto_2001971 ?auto_2001973 ) ) ( not ( = ?auto_2001971 ?auto_2001974 ) ) ( not ( = ?auto_2001971 ?auto_2001975 ) ) ( not ( = ?auto_2001971 ?auto_2001976 ) ) ( not ( = ?auto_2001971 ?auto_2001980 ) ) ( not ( = ?auto_2001971 ?auto_2001983 ) ) ( not ( = ?auto_2001972 ?auto_2001973 ) ) ( not ( = ?auto_2001972 ?auto_2001974 ) ) ( not ( = ?auto_2001972 ?auto_2001975 ) ) ( not ( = ?auto_2001972 ?auto_2001976 ) ) ( not ( = ?auto_2001972 ?auto_2001980 ) ) ( not ( = ?auto_2001972 ?auto_2001983 ) ) ( not ( = ?auto_2001973 ?auto_2001974 ) ) ( not ( = ?auto_2001973 ?auto_2001975 ) ) ( not ( = ?auto_2001973 ?auto_2001976 ) ) ( not ( = ?auto_2001973 ?auto_2001980 ) ) ( not ( = ?auto_2001973 ?auto_2001983 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001974 ?auto_2001975 ?auto_2001976 )
      ( MAKE-14CRATE-VERIFY ?auto_2001962 ?auto_2001963 ?auto_2001964 ?auto_2001966 ?auto_2001965 ?auto_2001967 ?auto_2001968 ?auto_2001969 ?auto_2001970 ?auto_2001971 ?auto_2001972 ?auto_2001973 ?auto_2001974 ?auto_2001975 ?auto_2001976 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2001984 - SURFACE
      ?auto_2001985 - SURFACE
      ?auto_2001986 - SURFACE
      ?auto_2001988 - SURFACE
      ?auto_2001987 - SURFACE
      ?auto_2001989 - SURFACE
      ?auto_2001990 - SURFACE
      ?auto_2001991 - SURFACE
      ?auto_2001992 - SURFACE
      ?auto_2001993 - SURFACE
      ?auto_2001994 - SURFACE
      ?auto_2001995 - SURFACE
      ?auto_2001996 - SURFACE
      ?auto_2001997 - SURFACE
      ?auto_2001998 - SURFACE
      ?auto_2001999 - SURFACE
    )
    :vars
    (
      ?auto_2002005 - HOIST
      ?auto_2002001 - PLACE
      ?auto_2002000 - PLACE
      ?auto_2002004 - HOIST
      ?auto_2002003 - SURFACE
      ?auto_2002002 - TRUCK
      ?auto_2002006 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002005 ?auto_2002001 ) ( IS-CRATE ?auto_2001999 ) ( not ( = ?auto_2001998 ?auto_2001999 ) ) ( not ( = ?auto_2001997 ?auto_2001998 ) ) ( not ( = ?auto_2001997 ?auto_2001999 ) ) ( not ( = ?auto_2002000 ?auto_2002001 ) ) ( HOIST-AT ?auto_2002004 ?auto_2002000 ) ( not ( = ?auto_2002005 ?auto_2002004 ) ) ( SURFACE-AT ?auto_2001999 ?auto_2002000 ) ( ON ?auto_2001999 ?auto_2002003 ) ( CLEAR ?auto_2001999 ) ( not ( = ?auto_2001998 ?auto_2002003 ) ) ( not ( = ?auto_2001999 ?auto_2002003 ) ) ( not ( = ?auto_2001997 ?auto_2002003 ) ) ( SURFACE-AT ?auto_2001997 ?auto_2002001 ) ( CLEAR ?auto_2001997 ) ( IS-CRATE ?auto_2001998 ) ( AVAILABLE ?auto_2002005 ) ( TRUCK-AT ?auto_2002002 ?auto_2002000 ) ( AVAILABLE ?auto_2002004 ) ( SURFACE-AT ?auto_2001998 ?auto_2002000 ) ( ON ?auto_2001998 ?auto_2002006 ) ( CLEAR ?auto_2001998 ) ( not ( = ?auto_2001998 ?auto_2002006 ) ) ( not ( = ?auto_2001999 ?auto_2002006 ) ) ( not ( = ?auto_2001997 ?auto_2002006 ) ) ( not ( = ?auto_2002003 ?auto_2002006 ) ) ( ON ?auto_2001985 ?auto_2001984 ) ( ON ?auto_2001986 ?auto_2001985 ) ( ON ?auto_2001988 ?auto_2001986 ) ( ON ?auto_2001987 ?auto_2001988 ) ( ON ?auto_2001989 ?auto_2001987 ) ( ON ?auto_2001990 ?auto_2001989 ) ( ON ?auto_2001991 ?auto_2001990 ) ( ON ?auto_2001992 ?auto_2001991 ) ( ON ?auto_2001993 ?auto_2001992 ) ( ON ?auto_2001994 ?auto_2001993 ) ( ON ?auto_2001995 ?auto_2001994 ) ( ON ?auto_2001996 ?auto_2001995 ) ( ON ?auto_2001997 ?auto_2001996 ) ( not ( = ?auto_2001984 ?auto_2001985 ) ) ( not ( = ?auto_2001984 ?auto_2001986 ) ) ( not ( = ?auto_2001984 ?auto_2001988 ) ) ( not ( = ?auto_2001984 ?auto_2001987 ) ) ( not ( = ?auto_2001984 ?auto_2001989 ) ) ( not ( = ?auto_2001984 ?auto_2001990 ) ) ( not ( = ?auto_2001984 ?auto_2001991 ) ) ( not ( = ?auto_2001984 ?auto_2001992 ) ) ( not ( = ?auto_2001984 ?auto_2001993 ) ) ( not ( = ?auto_2001984 ?auto_2001994 ) ) ( not ( = ?auto_2001984 ?auto_2001995 ) ) ( not ( = ?auto_2001984 ?auto_2001996 ) ) ( not ( = ?auto_2001984 ?auto_2001997 ) ) ( not ( = ?auto_2001984 ?auto_2001998 ) ) ( not ( = ?auto_2001984 ?auto_2001999 ) ) ( not ( = ?auto_2001984 ?auto_2002003 ) ) ( not ( = ?auto_2001984 ?auto_2002006 ) ) ( not ( = ?auto_2001985 ?auto_2001986 ) ) ( not ( = ?auto_2001985 ?auto_2001988 ) ) ( not ( = ?auto_2001985 ?auto_2001987 ) ) ( not ( = ?auto_2001985 ?auto_2001989 ) ) ( not ( = ?auto_2001985 ?auto_2001990 ) ) ( not ( = ?auto_2001985 ?auto_2001991 ) ) ( not ( = ?auto_2001985 ?auto_2001992 ) ) ( not ( = ?auto_2001985 ?auto_2001993 ) ) ( not ( = ?auto_2001985 ?auto_2001994 ) ) ( not ( = ?auto_2001985 ?auto_2001995 ) ) ( not ( = ?auto_2001985 ?auto_2001996 ) ) ( not ( = ?auto_2001985 ?auto_2001997 ) ) ( not ( = ?auto_2001985 ?auto_2001998 ) ) ( not ( = ?auto_2001985 ?auto_2001999 ) ) ( not ( = ?auto_2001985 ?auto_2002003 ) ) ( not ( = ?auto_2001985 ?auto_2002006 ) ) ( not ( = ?auto_2001986 ?auto_2001988 ) ) ( not ( = ?auto_2001986 ?auto_2001987 ) ) ( not ( = ?auto_2001986 ?auto_2001989 ) ) ( not ( = ?auto_2001986 ?auto_2001990 ) ) ( not ( = ?auto_2001986 ?auto_2001991 ) ) ( not ( = ?auto_2001986 ?auto_2001992 ) ) ( not ( = ?auto_2001986 ?auto_2001993 ) ) ( not ( = ?auto_2001986 ?auto_2001994 ) ) ( not ( = ?auto_2001986 ?auto_2001995 ) ) ( not ( = ?auto_2001986 ?auto_2001996 ) ) ( not ( = ?auto_2001986 ?auto_2001997 ) ) ( not ( = ?auto_2001986 ?auto_2001998 ) ) ( not ( = ?auto_2001986 ?auto_2001999 ) ) ( not ( = ?auto_2001986 ?auto_2002003 ) ) ( not ( = ?auto_2001986 ?auto_2002006 ) ) ( not ( = ?auto_2001988 ?auto_2001987 ) ) ( not ( = ?auto_2001988 ?auto_2001989 ) ) ( not ( = ?auto_2001988 ?auto_2001990 ) ) ( not ( = ?auto_2001988 ?auto_2001991 ) ) ( not ( = ?auto_2001988 ?auto_2001992 ) ) ( not ( = ?auto_2001988 ?auto_2001993 ) ) ( not ( = ?auto_2001988 ?auto_2001994 ) ) ( not ( = ?auto_2001988 ?auto_2001995 ) ) ( not ( = ?auto_2001988 ?auto_2001996 ) ) ( not ( = ?auto_2001988 ?auto_2001997 ) ) ( not ( = ?auto_2001988 ?auto_2001998 ) ) ( not ( = ?auto_2001988 ?auto_2001999 ) ) ( not ( = ?auto_2001988 ?auto_2002003 ) ) ( not ( = ?auto_2001988 ?auto_2002006 ) ) ( not ( = ?auto_2001987 ?auto_2001989 ) ) ( not ( = ?auto_2001987 ?auto_2001990 ) ) ( not ( = ?auto_2001987 ?auto_2001991 ) ) ( not ( = ?auto_2001987 ?auto_2001992 ) ) ( not ( = ?auto_2001987 ?auto_2001993 ) ) ( not ( = ?auto_2001987 ?auto_2001994 ) ) ( not ( = ?auto_2001987 ?auto_2001995 ) ) ( not ( = ?auto_2001987 ?auto_2001996 ) ) ( not ( = ?auto_2001987 ?auto_2001997 ) ) ( not ( = ?auto_2001987 ?auto_2001998 ) ) ( not ( = ?auto_2001987 ?auto_2001999 ) ) ( not ( = ?auto_2001987 ?auto_2002003 ) ) ( not ( = ?auto_2001987 ?auto_2002006 ) ) ( not ( = ?auto_2001989 ?auto_2001990 ) ) ( not ( = ?auto_2001989 ?auto_2001991 ) ) ( not ( = ?auto_2001989 ?auto_2001992 ) ) ( not ( = ?auto_2001989 ?auto_2001993 ) ) ( not ( = ?auto_2001989 ?auto_2001994 ) ) ( not ( = ?auto_2001989 ?auto_2001995 ) ) ( not ( = ?auto_2001989 ?auto_2001996 ) ) ( not ( = ?auto_2001989 ?auto_2001997 ) ) ( not ( = ?auto_2001989 ?auto_2001998 ) ) ( not ( = ?auto_2001989 ?auto_2001999 ) ) ( not ( = ?auto_2001989 ?auto_2002003 ) ) ( not ( = ?auto_2001989 ?auto_2002006 ) ) ( not ( = ?auto_2001990 ?auto_2001991 ) ) ( not ( = ?auto_2001990 ?auto_2001992 ) ) ( not ( = ?auto_2001990 ?auto_2001993 ) ) ( not ( = ?auto_2001990 ?auto_2001994 ) ) ( not ( = ?auto_2001990 ?auto_2001995 ) ) ( not ( = ?auto_2001990 ?auto_2001996 ) ) ( not ( = ?auto_2001990 ?auto_2001997 ) ) ( not ( = ?auto_2001990 ?auto_2001998 ) ) ( not ( = ?auto_2001990 ?auto_2001999 ) ) ( not ( = ?auto_2001990 ?auto_2002003 ) ) ( not ( = ?auto_2001990 ?auto_2002006 ) ) ( not ( = ?auto_2001991 ?auto_2001992 ) ) ( not ( = ?auto_2001991 ?auto_2001993 ) ) ( not ( = ?auto_2001991 ?auto_2001994 ) ) ( not ( = ?auto_2001991 ?auto_2001995 ) ) ( not ( = ?auto_2001991 ?auto_2001996 ) ) ( not ( = ?auto_2001991 ?auto_2001997 ) ) ( not ( = ?auto_2001991 ?auto_2001998 ) ) ( not ( = ?auto_2001991 ?auto_2001999 ) ) ( not ( = ?auto_2001991 ?auto_2002003 ) ) ( not ( = ?auto_2001991 ?auto_2002006 ) ) ( not ( = ?auto_2001992 ?auto_2001993 ) ) ( not ( = ?auto_2001992 ?auto_2001994 ) ) ( not ( = ?auto_2001992 ?auto_2001995 ) ) ( not ( = ?auto_2001992 ?auto_2001996 ) ) ( not ( = ?auto_2001992 ?auto_2001997 ) ) ( not ( = ?auto_2001992 ?auto_2001998 ) ) ( not ( = ?auto_2001992 ?auto_2001999 ) ) ( not ( = ?auto_2001992 ?auto_2002003 ) ) ( not ( = ?auto_2001992 ?auto_2002006 ) ) ( not ( = ?auto_2001993 ?auto_2001994 ) ) ( not ( = ?auto_2001993 ?auto_2001995 ) ) ( not ( = ?auto_2001993 ?auto_2001996 ) ) ( not ( = ?auto_2001993 ?auto_2001997 ) ) ( not ( = ?auto_2001993 ?auto_2001998 ) ) ( not ( = ?auto_2001993 ?auto_2001999 ) ) ( not ( = ?auto_2001993 ?auto_2002003 ) ) ( not ( = ?auto_2001993 ?auto_2002006 ) ) ( not ( = ?auto_2001994 ?auto_2001995 ) ) ( not ( = ?auto_2001994 ?auto_2001996 ) ) ( not ( = ?auto_2001994 ?auto_2001997 ) ) ( not ( = ?auto_2001994 ?auto_2001998 ) ) ( not ( = ?auto_2001994 ?auto_2001999 ) ) ( not ( = ?auto_2001994 ?auto_2002003 ) ) ( not ( = ?auto_2001994 ?auto_2002006 ) ) ( not ( = ?auto_2001995 ?auto_2001996 ) ) ( not ( = ?auto_2001995 ?auto_2001997 ) ) ( not ( = ?auto_2001995 ?auto_2001998 ) ) ( not ( = ?auto_2001995 ?auto_2001999 ) ) ( not ( = ?auto_2001995 ?auto_2002003 ) ) ( not ( = ?auto_2001995 ?auto_2002006 ) ) ( not ( = ?auto_2001996 ?auto_2001997 ) ) ( not ( = ?auto_2001996 ?auto_2001998 ) ) ( not ( = ?auto_2001996 ?auto_2001999 ) ) ( not ( = ?auto_2001996 ?auto_2002003 ) ) ( not ( = ?auto_2001996 ?auto_2002006 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001997 ?auto_2001998 ?auto_2001999 )
      ( MAKE-15CRATE-VERIFY ?auto_2001984 ?auto_2001985 ?auto_2001986 ?auto_2001988 ?auto_2001987 ?auto_2001989 ?auto_2001990 ?auto_2001991 ?auto_2001992 ?auto_2001993 ?auto_2001994 ?auto_2001995 ?auto_2001996 ?auto_2001997 ?auto_2001998 ?auto_2001999 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2002007 - SURFACE
      ?auto_2002008 - SURFACE
    )
    :vars
    (
      ?auto_2002015 - HOIST
      ?auto_2002011 - PLACE
      ?auto_2002009 - SURFACE
      ?auto_2002010 - PLACE
      ?auto_2002014 - HOIST
      ?auto_2002013 - SURFACE
      ?auto_2002016 - SURFACE
      ?auto_2002012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002015 ?auto_2002011 ) ( IS-CRATE ?auto_2002008 ) ( not ( = ?auto_2002007 ?auto_2002008 ) ) ( not ( = ?auto_2002009 ?auto_2002007 ) ) ( not ( = ?auto_2002009 ?auto_2002008 ) ) ( not ( = ?auto_2002010 ?auto_2002011 ) ) ( HOIST-AT ?auto_2002014 ?auto_2002010 ) ( not ( = ?auto_2002015 ?auto_2002014 ) ) ( SURFACE-AT ?auto_2002008 ?auto_2002010 ) ( ON ?auto_2002008 ?auto_2002013 ) ( CLEAR ?auto_2002008 ) ( not ( = ?auto_2002007 ?auto_2002013 ) ) ( not ( = ?auto_2002008 ?auto_2002013 ) ) ( not ( = ?auto_2002009 ?auto_2002013 ) ) ( SURFACE-AT ?auto_2002009 ?auto_2002011 ) ( CLEAR ?auto_2002009 ) ( IS-CRATE ?auto_2002007 ) ( AVAILABLE ?auto_2002015 ) ( AVAILABLE ?auto_2002014 ) ( SURFACE-AT ?auto_2002007 ?auto_2002010 ) ( ON ?auto_2002007 ?auto_2002016 ) ( CLEAR ?auto_2002007 ) ( not ( = ?auto_2002007 ?auto_2002016 ) ) ( not ( = ?auto_2002008 ?auto_2002016 ) ) ( not ( = ?auto_2002009 ?auto_2002016 ) ) ( not ( = ?auto_2002013 ?auto_2002016 ) ) ( TRUCK-AT ?auto_2002012 ?auto_2002011 ) )
    :subtasks
    ( ( !DRIVE ?auto_2002012 ?auto_2002011 ?auto_2002010 )
      ( MAKE-2CRATE ?auto_2002009 ?auto_2002007 ?auto_2002008 )
      ( MAKE-1CRATE-VERIFY ?auto_2002007 ?auto_2002008 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2002017 - SURFACE
      ?auto_2002018 - SURFACE
      ?auto_2002019 - SURFACE
    )
    :vars
    (
      ?auto_2002023 - HOIST
      ?auto_2002024 - PLACE
      ?auto_2002026 - PLACE
      ?auto_2002020 - HOIST
      ?auto_2002021 - SURFACE
      ?auto_2002022 - SURFACE
      ?auto_2002025 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002023 ?auto_2002024 ) ( IS-CRATE ?auto_2002019 ) ( not ( = ?auto_2002018 ?auto_2002019 ) ) ( not ( = ?auto_2002017 ?auto_2002018 ) ) ( not ( = ?auto_2002017 ?auto_2002019 ) ) ( not ( = ?auto_2002026 ?auto_2002024 ) ) ( HOIST-AT ?auto_2002020 ?auto_2002026 ) ( not ( = ?auto_2002023 ?auto_2002020 ) ) ( SURFACE-AT ?auto_2002019 ?auto_2002026 ) ( ON ?auto_2002019 ?auto_2002021 ) ( CLEAR ?auto_2002019 ) ( not ( = ?auto_2002018 ?auto_2002021 ) ) ( not ( = ?auto_2002019 ?auto_2002021 ) ) ( not ( = ?auto_2002017 ?auto_2002021 ) ) ( SURFACE-AT ?auto_2002017 ?auto_2002024 ) ( CLEAR ?auto_2002017 ) ( IS-CRATE ?auto_2002018 ) ( AVAILABLE ?auto_2002023 ) ( AVAILABLE ?auto_2002020 ) ( SURFACE-AT ?auto_2002018 ?auto_2002026 ) ( ON ?auto_2002018 ?auto_2002022 ) ( CLEAR ?auto_2002018 ) ( not ( = ?auto_2002018 ?auto_2002022 ) ) ( not ( = ?auto_2002019 ?auto_2002022 ) ) ( not ( = ?auto_2002017 ?auto_2002022 ) ) ( not ( = ?auto_2002021 ?auto_2002022 ) ) ( TRUCK-AT ?auto_2002025 ?auto_2002024 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2002018 ?auto_2002019 )
      ( MAKE-2CRATE-VERIFY ?auto_2002017 ?auto_2002018 ?auto_2002019 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2002027 - SURFACE
      ?auto_2002028 - SURFACE
      ?auto_2002029 - SURFACE
      ?auto_2002030 - SURFACE
    )
    :vars
    (
      ?auto_2002034 - HOIST
      ?auto_2002035 - PLACE
      ?auto_2002031 - PLACE
      ?auto_2002037 - HOIST
      ?auto_2002036 - SURFACE
      ?auto_2002032 - SURFACE
      ?auto_2002033 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002034 ?auto_2002035 ) ( IS-CRATE ?auto_2002030 ) ( not ( = ?auto_2002029 ?auto_2002030 ) ) ( not ( = ?auto_2002028 ?auto_2002029 ) ) ( not ( = ?auto_2002028 ?auto_2002030 ) ) ( not ( = ?auto_2002031 ?auto_2002035 ) ) ( HOIST-AT ?auto_2002037 ?auto_2002031 ) ( not ( = ?auto_2002034 ?auto_2002037 ) ) ( SURFACE-AT ?auto_2002030 ?auto_2002031 ) ( ON ?auto_2002030 ?auto_2002036 ) ( CLEAR ?auto_2002030 ) ( not ( = ?auto_2002029 ?auto_2002036 ) ) ( not ( = ?auto_2002030 ?auto_2002036 ) ) ( not ( = ?auto_2002028 ?auto_2002036 ) ) ( SURFACE-AT ?auto_2002028 ?auto_2002035 ) ( CLEAR ?auto_2002028 ) ( IS-CRATE ?auto_2002029 ) ( AVAILABLE ?auto_2002034 ) ( AVAILABLE ?auto_2002037 ) ( SURFACE-AT ?auto_2002029 ?auto_2002031 ) ( ON ?auto_2002029 ?auto_2002032 ) ( CLEAR ?auto_2002029 ) ( not ( = ?auto_2002029 ?auto_2002032 ) ) ( not ( = ?auto_2002030 ?auto_2002032 ) ) ( not ( = ?auto_2002028 ?auto_2002032 ) ) ( not ( = ?auto_2002036 ?auto_2002032 ) ) ( TRUCK-AT ?auto_2002033 ?auto_2002035 ) ( ON ?auto_2002028 ?auto_2002027 ) ( not ( = ?auto_2002027 ?auto_2002028 ) ) ( not ( = ?auto_2002027 ?auto_2002029 ) ) ( not ( = ?auto_2002027 ?auto_2002030 ) ) ( not ( = ?auto_2002027 ?auto_2002036 ) ) ( not ( = ?auto_2002027 ?auto_2002032 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002028 ?auto_2002029 ?auto_2002030 )
      ( MAKE-3CRATE-VERIFY ?auto_2002027 ?auto_2002028 ?auto_2002029 ?auto_2002030 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2002038 - SURFACE
      ?auto_2002039 - SURFACE
      ?auto_2002040 - SURFACE
      ?auto_2002042 - SURFACE
      ?auto_2002041 - SURFACE
    )
    :vars
    (
      ?auto_2002046 - HOIST
      ?auto_2002047 - PLACE
      ?auto_2002043 - PLACE
      ?auto_2002049 - HOIST
      ?auto_2002048 - SURFACE
      ?auto_2002044 - SURFACE
      ?auto_2002045 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002046 ?auto_2002047 ) ( IS-CRATE ?auto_2002041 ) ( not ( = ?auto_2002042 ?auto_2002041 ) ) ( not ( = ?auto_2002040 ?auto_2002042 ) ) ( not ( = ?auto_2002040 ?auto_2002041 ) ) ( not ( = ?auto_2002043 ?auto_2002047 ) ) ( HOIST-AT ?auto_2002049 ?auto_2002043 ) ( not ( = ?auto_2002046 ?auto_2002049 ) ) ( SURFACE-AT ?auto_2002041 ?auto_2002043 ) ( ON ?auto_2002041 ?auto_2002048 ) ( CLEAR ?auto_2002041 ) ( not ( = ?auto_2002042 ?auto_2002048 ) ) ( not ( = ?auto_2002041 ?auto_2002048 ) ) ( not ( = ?auto_2002040 ?auto_2002048 ) ) ( SURFACE-AT ?auto_2002040 ?auto_2002047 ) ( CLEAR ?auto_2002040 ) ( IS-CRATE ?auto_2002042 ) ( AVAILABLE ?auto_2002046 ) ( AVAILABLE ?auto_2002049 ) ( SURFACE-AT ?auto_2002042 ?auto_2002043 ) ( ON ?auto_2002042 ?auto_2002044 ) ( CLEAR ?auto_2002042 ) ( not ( = ?auto_2002042 ?auto_2002044 ) ) ( not ( = ?auto_2002041 ?auto_2002044 ) ) ( not ( = ?auto_2002040 ?auto_2002044 ) ) ( not ( = ?auto_2002048 ?auto_2002044 ) ) ( TRUCK-AT ?auto_2002045 ?auto_2002047 ) ( ON ?auto_2002039 ?auto_2002038 ) ( ON ?auto_2002040 ?auto_2002039 ) ( not ( = ?auto_2002038 ?auto_2002039 ) ) ( not ( = ?auto_2002038 ?auto_2002040 ) ) ( not ( = ?auto_2002038 ?auto_2002042 ) ) ( not ( = ?auto_2002038 ?auto_2002041 ) ) ( not ( = ?auto_2002038 ?auto_2002048 ) ) ( not ( = ?auto_2002038 ?auto_2002044 ) ) ( not ( = ?auto_2002039 ?auto_2002040 ) ) ( not ( = ?auto_2002039 ?auto_2002042 ) ) ( not ( = ?auto_2002039 ?auto_2002041 ) ) ( not ( = ?auto_2002039 ?auto_2002048 ) ) ( not ( = ?auto_2002039 ?auto_2002044 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002040 ?auto_2002042 ?auto_2002041 )
      ( MAKE-4CRATE-VERIFY ?auto_2002038 ?auto_2002039 ?auto_2002040 ?auto_2002042 ?auto_2002041 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2002050 - SURFACE
      ?auto_2002051 - SURFACE
      ?auto_2002052 - SURFACE
      ?auto_2002054 - SURFACE
      ?auto_2002053 - SURFACE
      ?auto_2002055 - SURFACE
    )
    :vars
    (
      ?auto_2002059 - HOIST
      ?auto_2002060 - PLACE
      ?auto_2002056 - PLACE
      ?auto_2002062 - HOIST
      ?auto_2002061 - SURFACE
      ?auto_2002057 - SURFACE
      ?auto_2002058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002059 ?auto_2002060 ) ( IS-CRATE ?auto_2002055 ) ( not ( = ?auto_2002053 ?auto_2002055 ) ) ( not ( = ?auto_2002054 ?auto_2002053 ) ) ( not ( = ?auto_2002054 ?auto_2002055 ) ) ( not ( = ?auto_2002056 ?auto_2002060 ) ) ( HOIST-AT ?auto_2002062 ?auto_2002056 ) ( not ( = ?auto_2002059 ?auto_2002062 ) ) ( SURFACE-AT ?auto_2002055 ?auto_2002056 ) ( ON ?auto_2002055 ?auto_2002061 ) ( CLEAR ?auto_2002055 ) ( not ( = ?auto_2002053 ?auto_2002061 ) ) ( not ( = ?auto_2002055 ?auto_2002061 ) ) ( not ( = ?auto_2002054 ?auto_2002061 ) ) ( SURFACE-AT ?auto_2002054 ?auto_2002060 ) ( CLEAR ?auto_2002054 ) ( IS-CRATE ?auto_2002053 ) ( AVAILABLE ?auto_2002059 ) ( AVAILABLE ?auto_2002062 ) ( SURFACE-AT ?auto_2002053 ?auto_2002056 ) ( ON ?auto_2002053 ?auto_2002057 ) ( CLEAR ?auto_2002053 ) ( not ( = ?auto_2002053 ?auto_2002057 ) ) ( not ( = ?auto_2002055 ?auto_2002057 ) ) ( not ( = ?auto_2002054 ?auto_2002057 ) ) ( not ( = ?auto_2002061 ?auto_2002057 ) ) ( TRUCK-AT ?auto_2002058 ?auto_2002060 ) ( ON ?auto_2002051 ?auto_2002050 ) ( ON ?auto_2002052 ?auto_2002051 ) ( ON ?auto_2002054 ?auto_2002052 ) ( not ( = ?auto_2002050 ?auto_2002051 ) ) ( not ( = ?auto_2002050 ?auto_2002052 ) ) ( not ( = ?auto_2002050 ?auto_2002054 ) ) ( not ( = ?auto_2002050 ?auto_2002053 ) ) ( not ( = ?auto_2002050 ?auto_2002055 ) ) ( not ( = ?auto_2002050 ?auto_2002061 ) ) ( not ( = ?auto_2002050 ?auto_2002057 ) ) ( not ( = ?auto_2002051 ?auto_2002052 ) ) ( not ( = ?auto_2002051 ?auto_2002054 ) ) ( not ( = ?auto_2002051 ?auto_2002053 ) ) ( not ( = ?auto_2002051 ?auto_2002055 ) ) ( not ( = ?auto_2002051 ?auto_2002061 ) ) ( not ( = ?auto_2002051 ?auto_2002057 ) ) ( not ( = ?auto_2002052 ?auto_2002054 ) ) ( not ( = ?auto_2002052 ?auto_2002053 ) ) ( not ( = ?auto_2002052 ?auto_2002055 ) ) ( not ( = ?auto_2002052 ?auto_2002061 ) ) ( not ( = ?auto_2002052 ?auto_2002057 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002054 ?auto_2002053 ?auto_2002055 )
      ( MAKE-5CRATE-VERIFY ?auto_2002050 ?auto_2002051 ?auto_2002052 ?auto_2002054 ?auto_2002053 ?auto_2002055 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2002063 - SURFACE
      ?auto_2002064 - SURFACE
      ?auto_2002065 - SURFACE
      ?auto_2002067 - SURFACE
      ?auto_2002066 - SURFACE
      ?auto_2002068 - SURFACE
      ?auto_2002069 - SURFACE
    )
    :vars
    (
      ?auto_2002073 - HOIST
      ?auto_2002074 - PLACE
      ?auto_2002070 - PLACE
      ?auto_2002076 - HOIST
      ?auto_2002075 - SURFACE
      ?auto_2002071 - SURFACE
      ?auto_2002072 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002073 ?auto_2002074 ) ( IS-CRATE ?auto_2002069 ) ( not ( = ?auto_2002068 ?auto_2002069 ) ) ( not ( = ?auto_2002066 ?auto_2002068 ) ) ( not ( = ?auto_2002066 ?auto_2002069 ) ) ( not ( = ?auto_2002070 ?auto_2002074 ) ) ( HOIST-AT ?auto_2002076 ?auto_2002070 ) ( not ( = ?auto_2002073 ?auto_2002076 ) ) ( SURFACE-AT ?auto_2002069 ?auto_2002070 ) ( ON ?auto_2002069 ?auto_2002075 ) ( CLEAR ?auto_2002069 ) ( not ( = ?auto_2002068 ?auto_2002075 ) ) ( not ( = ?auto_2002069 ?auto_2002075 ) ) ( not ( = ?auto_2002066 ?auto_2002075 ) ) ( SURFACE-AT ?auto_2002066 ?auto_2002074 ) ( CLEAR ?auto_2002066 ) ( IS-CRATE ?auto_2002068 ) ( AVAILABLE ?auto_2002073 ) ( AVAILABLE ?auto_2002076 ) ( SURFACE-AT ?auto_2002068 ?auto_2002070 ) ( ON ?auto_2002068 ?auto_2002071 ) ( CLEAR ?auto_2002068 ) ( not ( = ?auto_2002068 ?auto_2002071 ) ) ( not ( = ?auto_2002069 ?auto_2002071 ) ) ( not ( = ?auto_2002066 ?auto_2002071 ) ) ( not ( = ?auto_2002075 ?auto_2002071 ) ) ( TRUCK-AT ?auto_2002072 ?auto_2002074 ) ( ON ?auto_2002064 ?auto_2002063 ) ( ON ?auto_2002065 ?auto_2002064 ) ( ON ?auto_2002067 ?auto_2002065 ) ( ON ?auto_2002066 ?auto_2002067 ) ( not ( = ?auto_2002063 ?auto_2002064 ) ) ( not ( = ?auto_2002063 ?auto_2002065 ) ) ( not ( = ?auto_2002063 ?auto_2002067 ) ) ( not ( = ?auto_2002063 ?auto_2002066 ) ) ( not ( = ?auto_2002063 ?auto_2002068 ) ) ( not ( = ?auto_2002063 ?auto_2002069 ) ) ( not ( = ?auto_2002063 ?auto_2002075 ) ) ( not ( = ?auto_2002063 ?auto_2002071 ) ) ( not ( = ?auto_2002064 ?auto_2002065 ) ) ( not ( = ?auto_2002064 ?auto_2002067 ) ) ( not ( = ?auto_2002064 ?auto_2002066 ) ) ( not ( = ?auto_2002064 ?auto_2002068 ) ) ( not ( = ?auto_2002064 ?auto_2002069 ) ) ( not ( = ?auto_2002064 ?auto_2002075 ) ) ( not ( = ?auto_2002064 ?auto_2002071 ) ) ( not ( = ?auto_2002065 ?auto_2002067 ) ) ( not ( = ?auto_2002065 ?auto_2002066 ) ) ( not ( = ?auto_2002065 ?auto_2002068 ) ) ( not ( = ?auto_2002065 ?auto_2002069 ) ) ( not ( = ?auto_2002065 ?auto_2002075 ) ) ( not ( = ?auto_2002065 ?auto_2002071 ) ) ( not ( = ?auto_2002067 ?auto_2002066 ) ) ( not ( = ?auto_2002067 ?auto_2002068 ) ) ( not ( = ?auto_2002067 ?auto_2002069 ) ) ( not ( = ?auto_2002067 ?auto_2002075 ) ) ( not ( = ?auto_2002067 ?auto_2002071 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002066 ?auto_2002068 ?auto_2002069 )
      ( MAKE-6CRATE-VERIFY ?auto_2002063 ?auto_2002064 ?auto_2002065 ?auto_2002067 ?auto_2002066 ?auto_2002068 ?auto_2002069 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2002077 - SURFACE
      ?auto_2002078 - SURFACE
      ?auto_2002079 - SURFACE
      ?auto_2002081 - SURFACE
      ?auto_2002080 - SURFACE
      ?auto_2002082 - SURFACE
      ?auto_2002083 - SURFACE
      ?auto_2002084 - SURFACE
    )
    :vars
    (
      ?auto_2002088 - HOIST
      ?auto_2002089 - PLACE
      ?auto_2002085 - PLACE
      ?auto_2002091 - HOIST
      ?auto_2002090 - SURFACE
      ?auto_2002086 - SURFACE
      ?auto_2002087 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002088 ?auto_2002089 ) ( IS-CRATE ?auto_2002084 ) ( not ( = ?auto_2002083 ?auto_2002084 ) ) ( not ( = ?auto_2002082 ?auto_2002083 ) ) ( not ( = ?auto_2002082 ?auto_2002084 ) ) ( not ( = ?auto_2002085 ?auto_2002089 ) ) ( HOIST-AT ?auto_2002091 ?auto_2002085 ) ( not ( = ?auto_2002088 ?auto_2002091 ) ) ( SURFACE-AT ?auto_2002084 ?auto_2002085 ) ( ON ?auto_2002084 ?auto_2002090 ) ( CLEAR ?auto_2002084 ) ( not ( = ?auto_2002083 ?auto_2002090 ) ) ( not ( = ?auto_2002084 ?auto_2002090 ) ) ( not ( = ?auto_2002082 ?auto_2002090 ) ) ( SURFACE-AT ?auto_2002082 ?auto_2002089 ) ( CLEAR ?auto_2002082 ) ( IS-CRATE ?auto_2002083 ) ( AVAILABLE ?auto_2002088 ) ( AVAILABLE ?auto_2002091 ) ( SURFACE-AT ?auto_2002083 ?auto_2002085 ) ( ON ?auto_2002083 ?auto_2002086 ) ( CLEAR ?auto_2002083 ) ( not ( = ?auto_2002083 ?auto_2002086 ) ) ( not ( = ?auto_2002084 ?auto_2002086 ) ) ( not ( = ?auto_2002082 ?auto_2002086 ) ) ( not ( = ?auto_2002090 ?auto_2002086 ) ) ( TRUCK-AT ?auto_2002087 ?auto_2002089 ) ( ON ?auto_2002078 ?auto_2002077 ) ( ON ?auto_2002079 ?auto_2002078 ) ( ON ?auto_2002081 ?auto_2002079 ) ( ON ?auto_2002080 ?auto_2002081 ) ( ON ?auto_2002082 ?auto_2002080 ) ( not ( = ?auto_2002077 ?auto_2002078 ) ) ( not ( = ?auto_2002077 ?auto_2002079 ) ) ( not ( = ?auto_2002077 ?auto_2002081 ) ) ( not ( = ?auto_2002077 ?auto_2002080 ) ) ( not ( = ?auto_2002077 ?auto_2002082 ) ) ( not ( = ?auto_2002077 ?auto_2002083 ) ) ( not ( = ?auto_2002077 ?auto_2002084 ) ) ( not ( = ?auto_2002077 ?auto_2002090 ) ) ( not ( = ?auto_2002077 ?auto_2002086 ) ) ( not ( = ?auto_2002078 ?auto_2002079 ) ) ( not ( = ?auto_2002078 ?auto_2002081 ) ) ( not ( = ?auto_2002078 ?auto_2002080 ) ) ( not ( = ?auto_2002078 ?auto_2002082 ) ) ( not ( = ?auto_2002078 ?auto_2002083 ) ) ( not ( = ?auto_2002078 ?auto_2002084 ) ) ( not ( = ?auto_2002078 ?auto_2002090 ) ) ( not ( = ?auto_2002078 ?auto_2002086 ) ) ( not ( = ?auto_2002079 ?auto_2002081 ) ) ( not ( = ?auto_2002079 ?auto_2002080 ) ) ( not ( = ?auto_2002079 ?auto_2002082 ) ) ( not ( = ?auto_2002079 ?auto_2002083 ) ) ( not ( = ?auto_2002079 ?auto_2002084 ) ) ( not ( = ?auto_2002079 ?auto_2002090 ) ) ( not ( = ?auto_2002079 ?auto_2002086 ) ) ( not ( = ?auto_2002081 ?auto_2002080 ) ) ( not ( = ?auto_2002081 ?auto_2002082 ) ) ( not ( = ?auto_2002081 ?auto_2002083 ) ) ( not ( = ?auto_2002081 ?auto_2002084 ) ) ( not ( = ?auto_2002081 ?auto_2002090 ) ) ( not ( = ?auto_2002081 ?auto_2002086 ) ) ( not ( = ?auto_2002080 ?auto_2002082 ) ) ( not ( = ?auto_2002080 ?auto_2002083 ) ) ( not ( = ?auto_2002080 ?auto_2002084 ) ) ( not ( = ?auto_2002080 ?auto_2002090 ) ) ( not ( = ?auto_2002080 ?auto_2002086 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002082 ?auto_2002083 ?auto_2002084 )
      ( MAKE-7CRATE-VERIFY ?auto_2002077 ?auto_2002078 ?auto_2002079 ?auto_2002081 ?auto_2002080 ?auto_2002082 ?auto_2002083 ?auto_2002084 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2002092 - SURFACE
      ?auto_2002093 - SURFACE
      ?auto_2002094 - SURFACE
      ?auto_2002096 - SURFACE
      ?auto_2002095 - SURFACE
      ?auto_2002097 - SURFACE
      ?auto_2002098 - SURFACE
      ?auto_2002099 - SURFACE
      ?auto_2002100 - SURFACE
    )
    :vars
    (
      ?auto_2002104 - HOIST
      ?auto_2002105 - PLACE
      ?auto_2002101 - PLACE
      ?auto_2002107 - HOIST
      ?auto_2002106 - SURFACE
      ?auto_2002102 - SURFACE
      ?auto_2002103 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002104 ?auto_2002105 ) ( IS-CRATE ?auto_2002100 ) ( not ( = ?auto_2002099 ?auto_2002100 ) ) ( not ( = ?auto_2002098 ?auto_2002099 ) ) ( not ( = ?auto_2002098 ?auto_2002100 ) ) ( not ( = ?auto_2002101 ?auto_2002105 ) ) ( HOIST-AT ?auto_2002107 ?auto_2002101 ) ( not ( = ?auto_2002104 ?auto_2002107 ) ) ( SURFACE-AT ?auto_2002100 ?auto_2002101 ) ( ON ?auto_2002100 ?auto_2002106 ) ( CLEAR ?auto_2002100 ) ( not ( = ?auto_2002099 ?auto_2002106 ) ) ( not ( = ?auto_2002100 ?auto_2002106 ) ) ( not ( = ?auto_2002098 ?auto_2002106 ) ) ( SURFACE-AT ?auto_2002098 ?auto_2002105 ) ( CLEAR ?auto_2002098 ) ( IS-CRATE ?auto_2002099 ) ( AVAILABLE ?auto_2002104 ) ( AVAILABLE ?auto_2002107 ) ( SURFACE-AT ?auto_2002099 ?auto_2002101 ) ( ON ?auto_2002099 ?auto_2002102 ) ( CLEAR ?auto_2002099 ) ( not ( = ?auto_2002099 ?auto_2002102 ) ) ( not ( = ?auto_2002100 ?auto_2002102 ) ) ( not ( = ?auto_2002098 ?auto_2002102 ) ) ( not ( = ?auto_2002106 ?auto_2002102 ) ) ( TRUCK-AT ?auto_2002103 ?auto_2002105 ) ( ON ?auto_2002093 ?auto_2002092 ) ( ON ?auto_2002094 ?auto_2002093 ) ( ON ?auto_2002096 ?auto_2002094 ) ( ON ?auto_2002095 ?auto_2002096 ) ( ON ?auto_2002097 ?auto_2002095 ) ( ON ?auto_2002098 ?auto_2002097 ) ( not ( = ?auto_2002092 ?auto_2002093 ) ) ( not ( = ?auto_2002092 ?auto_2002094 ) ) ( not ( = ?auto_2002092 ?auto_2002096 ) ) ( not ( = ?auto_2002092 ?auto_2002095 ) ) ( not ( = ?auto_2002092 ?auto_2002097 ) ) ( not ( = ?auto_2002092 ?auto_2002098 ) ) ( not ( = ?auto_2002092 ?auto_2002099 ) ) ( not ( = ?auto_2002092 ?auto_2002100 ) ) ( not ( = ?auto_2002092 ?auto_2002106 ) ) ( not ( = ?auto_2002092 ?auto_2002102 ) ) ( not ( = ?auto_2002093 ?auto_2002094 ) ) ( not ( = ?auto_2002093 ?auto_2002096 ) ) ( not ( = ?auto_2002093 ?auto_2002095 ) ) ( not ( = ?auto_2002093 ?auto_2002097 ) ) ( not ( = ?auto_2002093 ?auto_2002098 ) ) ( not ( = ?auto_2002093 ?auto_2002099 ) ) ( not ( = ?auto_2002093 ?auto_2002100 ) ) ( not ( = ?auto_2002093 ?auto_2002106 ) ) ( not ( = ?auto_2002093 ?auto_2002102 ) ) ( not ( = ?auto_2002094 ?auto_2002096 ) ) ( not ( = ?auto_2002094 ?auto_2002095 ) ) ( not ( = ?auto_2002094 ?auto_2002097 ) ) ( not ( = ?auto_2002094 ?auto_2002098 ) ) ( not ( = ?auto_2002094 ?auto_2002099 ) ) ( not ( = ?auto_2002094 ?auto_2002100 ) ) ( not ( = ?auto_2002094 ?auto_2002106 ) ) ( not ( = ?auto_2002094 ?auto_2002102 ) ) ( not ( = ?auto_2002096 ?auto_2002095 ) ) ( not ( = ?auto_2002096 ?auto_2002097 ) ) ( not ( = ?auto_2002096 ?auto_2002098 ) ) ( not ( = ?auto_2002096 ?auto_2002099 ) ) ( not ( = ?auto_2002096 ?auto_2002100 ) ) ( not ( = ?auto_2002096 ?auto_2002106 ) ) ( not ( = ?auto_2002096 ?auto_2002102 ) ) ( not ( = ?auto_2002095 ?auto_2002097 ) ) ( not ( = ?auto_2002095 ?auto_2002098 ) ) ( not ( = ?auto_2002095 ?auto_2002099 ) ) ( not ( = ?auto_2002095 ?auto_2002100 ) ) ( not ( = ?auto_2002095 ?auto_2002106 ) ) ( not ( = ?auto_2002095 ?auto_2002102 ) ) ( not ( = ?auto_2002097 ?auto_2002098 ) ) ( not ( = ?auto_2002097 ?auto_2002099 ) ) ( not ( = ?auto_2002097 ?auto_2002100 ) ) ( not ( = ?auto_2002097 ?auto_2002106 ) ) ( not ( = ?auto_2002097 ?auto_2002102 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002098 ?auto_2002099 ?auto_2002100 )
      ( MAKE-8CRATE-VERIFY ?auto_2002092 ?auto_2002093 ?auto_2002094 ?auto_2002096 ?auto_2002095 ?auto_2002097 ?auto_2002098 ?auto_2002099 ?auto_2002100 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2002108 - SURFACE
      ?auto_2002109 - SURFACE
      ?auto_2002110 - SURFACE
      ?auto_2002112 - SURFACE
      ?auto_2002111 - SURFACE
      ?auto_2002113 - SURFACE
      ?auto_2002114 - SURFACE
      ?auto_2002115 - SURFACE
      ?auto_2002116 - SURFACE
      ?auto_2002117 - SURFACE
    )
    :vars
    (
      ?auto_2002121 - HOIST
      ?auto_2002122 - PLACE
      ?auto_2002118 - PLACE
      ?auto_2002124 - HOIST
      ?auto_2002123 - SURFACE
      ?auto_2002119 - SURFACE
      ?auto_2002120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002121 ?auto_2002122 ) ( IS-CRATE ?auto_2002117 ) ( not ( = ?auto_2002116 ?auto_2002117 ) ) ( not ( = ?auto_2002115 ?auto_2002116 ) ) ( not ( = ?auto_2002115 ?auto_2002117 ) ) ( not ( = ?auto_2002118 ?auto_2002122 ) ) ( HOIST-AT ?auto_2002124 ?auto_2002118 ) ( not ( = ?auto_2002121 ?auto_2002124 ) ) ( SURFACE-AT ?auto_2002117 ?auto_2002118 ) ( ON ?auto_2002117 ?auto_2002123 ) ( CLEAR ?auto_2002117 ) ( not ( = ?auto_2002116 ?auto_2002123 ) ) ( not ( = ?auto_2002117 ?auto_2002123 ) ) ( not ( = ?auto_2002115 ?auto_2002123 ) ) ( SURFACE-AT ?auto_2002115 ?auto_2002122 ) ( CLEAR ?auto_2002115 ) ( IS-CRATE ?auto_2002116 ) ( AVAILABLE ?auto_2002121 ) ( AVAILABLE ?auto_2002124 ) ( SURFACE-AT ?auto_2002116 ?auto_2002118 ) ( ON ?auto_2002116 ?auto_2002119 ) ( CLEAR ?auto_2002116 ) ( not ( = ?auto_2002116 ?auto_2002119 ) ) ( not ( = ?auto_2002117 ?auto_2002119 ) ) ( not ( = ?auto_2002115 ?auto_2002119 ) ) ( not ( = ?auto_2002123 ?auto_2002119 ) ) ( TRUCK-AT ?auto_2002120 ?auto_2002122 ) ( ON ?auto_2002109 ?auto_2002108 ) ( ON ?auto_2002110 ?auto_2002109 ) ( ON ?auto_2002112 ?auto_2002110 ) ( ON ?auto_2002111 ?auto_2002112 ) ( ON ?auto_2002113 ?auto_2002111 ) ( ON ?auto_2002114 ?auto_2002113 ) ( ON ?auto_2002115 ?auto_2002114 ) ( not ( = ?auto_2002108 ?auto_2002109 ) ) ( not ( = ?auto_2002108 ?auto_2002110 ) ) ( not ( = ?auto_2002108 ?auto_2002112 ) ) ( not ( = ?auto_2002108 ?auto_2002111 ) ) ( not ( = ?auto_2002108 ?auto_2002113 ) ) ( not ( = ?auto_2002108 ?auto_2002114 ) ) ( not ( = ?auto_2002108 ?auto_2002115 ) ) ( not ( = ?auto_2002108 ?auto_2002116 ) ) ( not ( = ?auto_2002108 ?auto_2002117 ) ) ( not ( = ?auto_2002108 ?auto_2002123 ) ) ( not ( = ?auto_2002108 ?auto_2002119 ) ) ( not ( = ?auto_2002109 ?auto_2002110 ) ) ( not ( = ?auto_2002109 ?auto_2002112 ) ) ( not ( = ?auto_2002109 ?auto_2002111 ) ) ( not ( = ?auto_2002109 ?auto_2002113 ) ) ( not ( = ?auto_2002109 ?auto_2002114 ) ) ( not ( = ?auto_2002109 ?auto_2002115 ) ) ( not ( = ?auto_2002109 ?auto_2002116 ) ) ( not ( = ?auto_2002109 ?auto_2002117 ) ) ( not ( = ?auto_2002109 ?auto_2002123 ) ) ( not ( = ?auto_2002109 ?auto_2002119 ) ) ( not ( = ?auto_2002110 ?auto_2002112 ) ) ( not ( = ?auto_2002110 ?auto_2002111 ) ) ( not ( = ?auto_2002110 ?auto_2002113 ) ) ( not ( = ?auto_2002110 ?auto_2002114 ) ) ( not ( = ?auto_2002110 ?auto_2002115 ) ) ( not ( = ?auto_2002110 ?auto_2002116 ) ) ( not ( = ?auto_2002110 ?auto_2002117 ) ) ( not ( = ?auto_2002110 ?auto_2002123 ) ) ( not ( = ?auto_2002110 ?auto_2002119 ) ) ( not ( = ?auto_2002112 ?auto_2002111 ) ) ( not ( = ?auto_2002112 ?auto_2002113 ) ) ( not ( = ?auto_2002112 ?auto_2002114 ) ) ( not ( = ?auto_2002112 ?auto_2002115 ) ) ( not ( = ?auto_2002112 ?auto_2002116 ) ) ( not ( = ?auto_2002112 ?auto_2002117 ) ) ( not ( = ?auto_2002112 ?auto_2002123 ) ) ( not ( = ?auto_2002112 ?auto_2002119 ) ) ( not ( = ?auto_2002111 ?auto_2002113 ) ) ( not ( = ?auto_2002111 ?auto_2002114 ) ) ( not ( = ?auto_2002111 ?auto_2002115 ) ) ( not ( = ?auto_2002111 ?auto_2002116 ) ) ( not ( = ?auto_2002111 ?auto_2002117 ) ) ( not ( = ?auto_2002111 ?auto_2002123 ) ) ( not ( = ?auto_2002111 ?auto_2002119 ) ) ( not ( = ?auto_2002113 ?auto_2002114 ) ) ( not ( = ?auto_2002113 ?auto_2002115 ) ) ( not ( = ?auto_2002113 ?auto_2002116 ) ) ( not ( = ?auto_2002113 ?auto_2002117 ) ) ( not ( = ?auto_2002113 ?auto_2002123 ) ) ( not ( = ?auto_2002113 ?auto_2002119 ) ) ( not ( = ?auto_2002114 ?auto_2002115 ) ) ( not ( = ?auto_2002114 ?auto_2002116 ) ) ( not ( = ?auto_2002114 ?auto_2002117 ) ) ( not ( = ?auto_2002114 ?auto_2002123 ) ) ( not ( = ?auto_2002114 ?auto_2002119 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002115 ?auto_2002116 ?auto_2002117 )
      ( MAKE-9CRATE-VERIFY ?auto_2002108 ?auto_2002109 ?auto_2002110 ?auto_2002112 ?auto_2002111 ?auto_2002113 ?auto_2002114 ?auto_2002115 ?auto_2002116 ?auto_2002117 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2002125 - SURFACE
      ?auto_2002126 - SURFACE
      ?auto_2002127 - SURFACE
      ?auto_2002129 - SURFACE
      ?auto_2002128 - SURFACE
      ?auto_2002130 - SURFACE
      ?auto_2002131 - SURFACE
      ?auto_2002132 - SURFACE
      ?auto_2002133 - SURFACE
      ?auto_2002134 - SURFACE
      ?auto_2002135 - SURFACE
    )
    :vars
    (
      ?auto_2002139 - HOIST
      ?auto_2002140 - PLACE
      ?auto_2002136 - PLACE
      ?auto_2002142 - HOIST
      ?auto_2002141 - SURFACE
      ?auto_2002137 - SURFACE
      ?auto_2002138 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002139 ?auto_2002140 ) ( IS-CRATE ?auto_2002135 ) ( not ( = ?auto_2002134 ?auto_2002135 ) ) ( not ( = ?auto_2002133 ?auto_2002134 ) ) ( not ( = ?auto_2002133 ?auto_2002135 ) ) ( not ( = ?auto_2002136 ?auto_2002140 ) ) ( HOIST-AT ?auto_2002142 ?auto_2002136 ) ( not ( = ?auto_2002139 ?auto_2002142 ) ) ( SURFACE-AT ?auto_2002135 ?auto_2002136 ) ( ON ?auto_2002135 ?auto_2002141 ) ( CLEAR ?auto_2002135 ) ( not ( = ?auto_2002134 ?auto_2002141 ) ) ( not ( = ?auto_2002135 ?auto_2002141 ) ) ( not ( = ?auto_2002133 ?auto_2002141 ) ) ( SURFACE-AT ?auto_2002133 ?auto_2002140 ) ( CLEAR ?auto_2002133 ) ( IS-CRATE ?auto_2002134 ) ( AVAILABLE ?auto_2002139 ) ( AVAILABLE ?auto_2002142 ) ( SURFACE-AT ?auto_2002134 ?auto_2002136 ) ( ON ?auto_2002134 ?auto_2002137 ) ( CLEAR ?auto_2002134 ) ( not ( = ?auto_2002134 ?auto_2002137 ) ) ( not ( = ?auto_2002135 ?auto_2002137 ) ) ( not ( = ?auto_2002133 ?auto_2002137 ) ) ( not ( = ?auto_2002141 ?auto_2002137 ) ) ( TRUCK-AT ?auto_2002138 ?auto_2002140 ) ( ON ?auto_2002126 ?auto_2002125 ) ( ON ?auto_2002127 ?auto_2002126 ) ( ON ?auto_2002129 ?auto_2002127 ) ( ON ?auto_2002128 ?auto_2002129 ) ( ON ?auto_2002130 ?auto_2002128 ) ( ON ?auto_2002131 ?auto_2002130 ) ( ON ?auto_2002132 ?auto_2002131 ) ( ON ?auto_2002133 ?auto_2002132 ) ( not ( = ?auto_2002125 ?auto_2002126 ) ) ( not ( = ?auto_2002125 ?auto_2002127 ) ) ( not ( = ?auto_2002125 ?auto_2002129 ) ) ( not ( = ?auto_2002125 ?auto_2002128 ) ) ( not ( = ?auto_2002125 ?auto_2002130 ) ) ( not ( = ?auto_2002125 ?auto_2002131 ) ) ( not ( = ?auto_2002125 ?auto_2002132 ) ) ( not ( = ?auto_2002125 ?auto_2002133 ) ) ( not ( = ?auto_2002125 ?auto_2002134 ) ) ( not ( = ?auto_2002125 ?auto_2002135 ) ) ( not ( = ?auto_2002125 ?auto_2002141 ) ) ( not ( = ?auto_2002125 ?auto_2002137 ) ) ( not ( = ?auto_2002126 ?auto_2002127 ) ) ( not ( = ?auto_2002126 ?auto_2002129 ) ) ( not ( = ?auto_2002126 ?auto_2002128 ) ) ( not ( = ?auto_2002126 ?auto_2002130 ) ) ( not ( = ?auto_2002126 ?auto_2002131 ) ) ( not ( = ?auto_2002126 ?auto_2002132 ) ) ( not ( = ?auto_2002126 ?auto_2002133 ) ) ( not ( = ?auto_2002126 ?auto_2002134 ) ) ( not ( = ?auto_2002126 ?auto_2002135 ) ) ( not ( = ?auto_2002126 ?auto_2002141 ) ) ( not ( = ?auto_2002126 ?auto_2002137 ) ) ( not ( = ?auto_2002127 ?auto_2002129 ) ) ( not ( = ?auto_2002127 ?auto_2002128 ) ) ( not ( = ?auto_2002127 ?auto_2002130 ) ) ( not ( = ?auto_2002127 ?auto_2002131 ) ) ( not ( = ?auto_2002127 ?auto_2002132 ) ) ( not ( = ?auto_2002127 ?auto_2002133 ) ) ( not ( = ?auto_2002127 ?auto_2002134 ) ) ( not ( = ?auto_2002127 ?auto_2002135 ) ) ( not ( = ?auto_2002127 ?auto_2002141 ) ) ( not ( = ?auto_2002127 ?auto_2002137 ) ) ( not ( = ?auto_2002129 ?auto_2002128 ) ) ( not ( = ?auto_2002129 ?auto_2002130 ) ) ( not ( = ?auto_2002129 ?auto_2002131 ) ) ( not ( = ?auto_2002129 ?auto_2002132 ) ) ( not ( = ?auto_2002129 ?auto_2002133 ) ) ( not ( = ?auto_2002129 ?auto_2002134 ) ) ( not ( = ?auto_2002129 ?auto_2002135 ) ) ( not ( = ?auto_2002129 ?auto_2002141 ) ) ( not ( = ?auto_2002129 ?auto_2002137 ) ) ( not ( = ?auto_2002128 ?auto_2002130 ) ) ( not ( = ?auto_2002128 ?auto_2002131 ) ) ( not ( = ?auto_2002128 ?auto_2002132 ) ) ( not ( = ?auto_2002128 ?auto_2002133 ) ) ( not ( = ?auto_2002128 ?auto_2002134 ) ) ( not ( = ?auto_2002128 ?auto_2002135 ) ) ( not ( = ?auto_2002128 ?auto_2002141 ) ) ( not ( = ?auto_2002128 ?auto_2002137 ) ) ( not ( = ?auto_2002130 ?auto_2002131 ) ) ( not ( = ?auto_2002130 ?auto_2002132 ) ) ( not ( = ?auto_2002130 ?auto_2002133 ) ) ( not ( = ?auto_2002130 ?auto_2002134 ) ) ( not ( = ?auto_2002130 ?auto_2002135 ) ) ( not ( = ?auto_2002130 ?auto_2002141 ) ) ( not ( = ?auto_2002130 ?auto_2002137 ) ) ( not ( = ?auto_2002131 ?auto_2002132 ) ) ( not ( = ?auto_2002131 ?auto_2002133 ) ) ( not ( = ?auto_2002131 ?auto_2002134 ) ) ( not ( = ?auto_2002131 ?auto_2002135 ) ) ( not ( = ?auto_2002131 ?auto_2002141 ) ) ( not ( = ?auto_2002131 ?auto_2002137 ) ) ( not ( = ?auto_2002132 ?auto_2002133 ) ) ( not ( = ?auto_2002132 ?auto_2002134 ) ) ( not ( = ?auto_2002132 ?auto_2002135 ) ) ( not ( = ?auto_2002132 ?auto_2002141 ) ) ( not ( = ?auto_2002132 ?auto_2002137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002133 ?auto_2002134 ?auto_2002135 )
      ( MAKE-10CRATE-VERIFY ?auto_2002125 ?auto_2002126 ?auto_2002127 ?auto_2002129 ?auto_2002128 ?auto_2002130 ?auto_2002131 ?auto_2002132 ?auto_2002133 ?auto_2002134 ?auto_2002135 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2002143 - SURFACE
      ?auto_2002144 - SURFACE
      ?auto_2002145 - SURFACE
      ?auto_2002147 - SURFACE
      ?auto_2002146 - SURFACE
      ?auto_2002148 - SURFACE
      ?auto_2002149 - SURFACE
      ?auto_2002150 - SURFACE
      ?auto_2002151 - SURFACE
      ?auto_2002152 - SURFACE
      ?auto_2002153 - SURFACE
      ?auto_2002154 - SURFACE
    )
    :vars
    (
      ?auto_2002158 - HOIST
      ?auto_2002159 - PLACE
      ?auto_2002155 - PLACE
      ?auto_2002161 - HOIST
      ?auto_2002160 - SURFACE
      ?auto_2002156 - SURFACE
      ?auto_2002157 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002158 ?auto_2002159 ) ( IS-CRATE ?auto_2002154 ) ( not ( = ?auto_2002153 ?auto_2002154 ) ) ( not ( = ?auto_2002152 ?auto_2002153 ) ) ( not ( = ?auto_2002152 ?auto_2002154 ) ) ( not ( = ?auto_2002155 ?auto_2002159 ) ) ( HOIST-AT ?auto_2002161 ?auto_2002155 ) ( not ( = ?auto_2002158 ?auto_2002161 ) ) ( SURFACE-AT ?auto_2002154 ?auto_2002155 ) ( ON ?auto_2002154 ?auto_2002160 ) ( CLEAR ?auto_2002154 ) ( not ( = ?auto_2002153 ?auto_2002160 ) ) ( not ( = ?auto_2002154 ?auto_2002160 ) ) ( not ( = ?auto_2002152 ?auto_2002160 ) ) ( SURFACE-AT ?auto_2002152 ?auto_2002159 ) ( CLEAR ?auto_2002152 ) ( IS-CRATE ?auto_2002153 ) ( AVAILABLE ?auto_2002158 ) ( AVAILABLE ?auto_2002161 ) ( SURFACE-AT ?auto_2002153 ?auto_2002155 ) ( ON ?auto_2002153 ?auto_2002156 ) ( CLEAR ?auto_2002153 ) ( not ( = ?auto_2002153 ?auto_2002156 ) ) ( not ( = ?auto_2002154 ?auto_2002156 ) ) ( not ( = ?auto_2002152 ?auto_2002156 ) ) ( not ( = ?auto_2002160 ?auto_2002156 ) ) ( TRUCK-AT ?auto_2002157 ?auto_2002159 ) ( ON ?auto_2002144 ?auto_2002143 ) ( ON ?auto_2002145 ?auto_2002144 ) ( ON ?auto_2002147 ?auto_2002145 ) ( ON ?auto_2002146 ?auto_2002147 ) ( ON ?auto_2002148 ?auto_2002146 ) ( ON ?auto_2002149 ?auto_2002148 ) ( ON ?auto_2002150 ?auto_2002149 ) ( ON ?auto_2002151 ?auto_2002150 ) ( ON ?auto_2002152 ?auto_2002151 ) ( not ( = ?auto_2002143 ?auto_2002144 ) ) ( not ( = ?auto_2002143 ?auto_2002145 ) ) ( not ( = ?auto_2002143 ?auto_2002147 ) ) ( not ( = ?auto_2002143 ?auto_2002146 ) ) ( not ( = ?auto_2002143 ?auto_2002148 ) ) ( not ( = ?auto_2002143 ?auto_2002149 ) ) ( not ( = ?auto_2002143 ?auto_2002150 ) ) ( not ( = ?auto_2002143 ?auto_2002151 ) ) ( not ( = ?auto_2002143 ?auto_2002152 ) ) ( not ( = ?auto_2002143 ?auto_2002153 ) ) ( not ( = ?auto_2002143 ?auto_2002154 ) ) ( not ( = ?auto_2002143 ?auto_2002160 ) ) ( not ( = ?auto_2002143 ?auto_2002156 ) ) ( not ( = ?auto_2002144 ?auto_2002145 ) ) ( not ( = ?auto_2002144 ?auto_2002147 ) ) ( not ( = ?auto_2002144 ?auto_2002146 ) ) ( not ( = ?auto_2002144 ?auto_2002148 ) ) ( not ( = ?auto_2002144 ?auto_2002149 ) ) ( not ( = ?auto_2002144 ?auto_2002150 ) ) ( not ( = ?auto_2002144 ?auto_2002151 ) ) ( not ( = ?auto_2002144 ?auto_2002152 ) ) ( not ( = ?auto_2002144 ?auto_2002153 ) ) ( not ( = ?auto_2002144 ?auto_2002154 ) ) ( not ( = ?auto_2002144 ?auto_2002160 ) ) ( not ( = ?auto_2002144 ?auto_2002156 ) ) ( not ( = ?auto_2002145 ?auto_2002147 ) ) ( not ( = ?auto_2002145 ?auto_2002146 ) ) ( not ( = ?auto_2002145 ?auto_2002148 ) ) ( not ( = ?auto_2002145 ?auto_2002149 ) ) ( not ( = ?auto_2002145 ?auto_2002150 ) ) ( not ( = ?auto_2002145 ?auto_2002151 ) ) ( not ( = ?auto_2002145 ?auto_2002152 ) ) ( not ( = ?auto_2002145 ?auto_2002153 ) ) ( not ( = ?auto_2002145 ?auto_2002154 ) ) ( not ( = ?auto_2002145 ?auto_2002160 ) ) ( not ( = ?auto_2002145 ?auto_2002156 ) ) ( not ( = ?auto_2002147 ?auto_2002146 ) ) ( not ( = ?auto_2002147 ?auto_2002148 ) ) ( not ( = ?auto_2002147 ?auto_2002149 ) ) ( not ( = ?auto_2002147 ?auto_2002150 ) ) ( not ( = ?auto_2002147 ?auto_2002151 ) ) ( not ( = ?auto_2002147 ?auto_2002152 ) ) ( not ( = ?auto_2002147 ?auto_2002153 ) ) ( not ( = ?auto_2002147 ?auto_2002154 ) ) ( not ( = ?auto_2002147 ?auto_2002160 ) ) ( not ( = ?auto_2002147 ?auto_2002156 ) ) ( not ( = ?auto_2002146 ?auto_2002148 ) ) ( not ( = ?auto_2002146 ?auto_2002149 ) ) ( not ( = ?auto_2002146 ?auto_2002150 ) ) ( not ( = ?auto_2002146 ?auto_2002151 ) ) ( not ( = ?auto_2002146 ?auto_2002152 ) ) ( not ( = ?auto_2002146 ?auto_2002153 ) ) ( not ( = ?auto_2002146 ?auto_2002154 ) ) ( not ( = ?auto_2002146 ?auto_2002160 ) ) ( not ( = ?auto_2002146 ?auto_2002156 ) ) ( not ( = ?auto_2002148 ?auto_2002149 ) ) ( not ( = ?auto_2002148 ?auto_2002150 ) ) ( not ( = ?auto_2002148 ?auto_2002151 ) ) ( not ( = ?auto_2002148 ?auto_2002152 ) ) ( not ( = ?auto_2002148 ?auto_2002153 ) ) ( not ( = ?auto_2002148 ?auto_2002154 ) ) ( not ( = ?auto_2002148 ?auto_2002160 ) ) ( not ( = ?auto_2002148 ?auto_2002156 ) ) ( not ( = ?auto_2002149 ?auto_2002150 ) ) ( not ( = ?auto_2002149 ?auto_2002151 ) ) ( not ( = ?auto_2002149 ?auto_2002152 ) ) ( not ( = ?auto_2002149 ?auto_2002153 ) ) ( not ( = ?auto_2002149 ?auto_2002154 ) ) ( not ( = ?auto_2002149 ?auto_2002160 ) ) ( not ( = ?auto_2002149 ?auto_2002156 ) ) ( not ( = ?auto_2002150 ?auto_2002151 ) ) ( not ( = ?auto_2002150 ?auto_2002152 ) ) ( not ( = ?auto_2002150 ?auto_2002153 ) ) ( not ( = ?auto_2002150 ?auto_2002154 ) ) ( not ( = ?auto_2002150 ?auto_2002160 ) ) ( not ( = ?auto_2002150 ?auto_2002156 ) ) ( not ( = ?auto_2002151 ?auto_2002152 ) ) ( not ( = ?auto_2002151 ?auto_2002153 ) ) ( not ( = ?auto_2002151 ?auto_2002154 ) ) ( not ( = ?auto_2002151 ?auto_2002160 ) ) ( not ( = ?auto_2002151 ?auto_2002156 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002152 ?auto_2002153 ?auto_2002154 )
      ( MAKE-11CRATE-VERIFY ?auto_2002143 ?auto_2002144 ?auto_2002145 ?auto_2002147 ?auto_2002146 ?auto_2002148 ?auto_2002149 ?auto_2002150 ?auto_2002151 ?auto_2002152 ?auto_2002153 ?auto_2002154 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2002162 - SURFACE
      ?auto_2002163 - SURFACE
      ?auto_2002164 - SURFACE
      ?auto_2002166 - SURFACE
      ?auto_2002165 - SURFACE
      ?auto_2002167 - SURFACE
      ?auto_2002168 - SURFACE
      ?auto_2002169 - SURFACE
      ?auto_2002170 - SURFACE
      ?auto_2002171 - SURFACE
      ?auto_2002172 - SURFACE
      ?auto_2002173 - SURFACE
      ?auto_2002174 - SURFACE
    )
    :vars
    (
      ?auto_2002178 - HOIST
      ?auto_2002179 - PLACE
      ?auto_2002175 - PLACE
      ?auto_2002181 - HOIST
      ?auto_2002180 - SURFACE
      ?auto_2002176 - SURFACE
      ?auto_2002177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002178 ?auto_2002179 ) ( IS-CRATE ?auto_2002174 ) ( not ( = ?auto_2002173 ?auto_2002174 ) ) ( not ( = ?auto_2002172 ?auto_2002173 ) ) ( not ( = ?auto_2002172 ?auto_2002174 ) ) ( not ( = ?auto_2002175 ?auto_2002179 ) ) ( HOIST-AT ?auto_2002181 ?auto_2002175 ) ( not ( = ?auto_2002178 ?auto_2002181 ) ) ( SURFACE-AT ?auto_2002174 ?auto_2002175 ) ( ON ?auto_2002174 ?auto_2002180 ) ( CLEAR ?auto_2002174 ) ( not ( = ?auto_2002173 ?auto_2002180 ) ) ( not ( = ?auto_2002174 ?auto_2002180 ) ) ( not ( = ?auto_2002172 ?auto_2002180 ) ) ( SURFACE-AT ?auto_2002172 ?auto_2002179 ) ( CLEAR ?auto_2002172 ) ( IS-CRATE ?auto_2002173 ) ( AVAILABLE ?auto_2002178 ) ( AVAILABLE ?auto_2002181 ) ( SURFACE-AT ?auto_2002173 ?auto_2002175 ) ( ON ?auto_2002173 ?auto_2002176 ) ( CLEAR ?auto_2002173 ) ( not ( = ?auto_2002173 ?auto_2002176 ) ) ( not ( = ?auto_2002174 ?auto_2002176 ) ) ( not ( = ?auto_2002172 ?auto_2002176 ) ) ( not ( = ?auto_2002180 ?auto_2002176 ) ) ( TRUCK-AT ?auto_2002177 ?auto_2002179 ) ( ON ?auto_2002163 ?auto_2002162 ) ( ON ?auto_2002164 ?auto_2002163 ) ( ON ?auto_2002166 ?auto_2002164 ) ( ON ?auto_2002165 ?auto_2002166 ) ( ON ?auto_2002167 ?auto_2002165 ) ( ON ?auto_2002168 ?auto_2002167 ) ( ON ?auto_2002169 ?auto_2002168 ) ( ON ?auto_2002170 ?auto_2002169 ) ( ON ?auto_2002171 ?auto_2002170 ) ( ON ?auto_2002172 ?auto_2002171 ) ( not ( = ?auto_2002162 ?auto_2002163 ) ) ( not ( = ?auto_2002162 ?auto_2002164 ) ) ( not ( = ?auto_2002162 ?auto_2002166 ) ) ( not ( = ?auto_2002162 ?auto_2002165 ) ) ( not ( = ?auto_2002162 ?auto_2002167 ) ) ( not ( = ?auto_2002162 ?auto_2002168 ) ) ( not ( = ?auto_2002162 ?auto_2002169 ) ) ( not ( = ?auto_2002162 ?auto_2002170 ) ) ( not ( = ?auto_2002162 ?auto_2002171 ) ) ( not ( = ?auto_2002162 ?auto_2002172 ) ) ( not ( = ?auto_2002162 ?auto_2002173 ) ) ( not ( = ?auto_2002162 ?auto_2002174 ) ) ( not ( = ?auto_2002162 ?auto_2002180 ) ) ( not ( = ?auto_2002162 ?auto_2002176 ) ) ( not ( = ?auto_2002163 ?auto_2002164 ) ) ( not ( = ?auto_2002163 ?auto_2002166 ) ) ( not ( = ?auto_2002163 ?auto_2002165 ) ) ( not ( = ?auto_2002163 ?auto_2002167 ) ) ( not ( = ?auto_2002163 ?auto_2002168 ) ) ( not ( = ?auto_2002163 ?auto_2002169 ) ) ( not ( = ?auto_2002163 ?auto_2002170 ) ) ( not ( = ?auto_2002163 ?auto_2002171 ) ) ( not ( = ?auto_2002163 ?auto_2002172 ) ) ( not ( = ?auto_2002163 ?auto_2002173 ) ) ( not ( = ?auto_2002163 ?auto_2002174 ) ) ( not ( = ?auto_2002163 ?auto_2002180 ) ) ( not ( = ?auto_2002163 ?auto_2002176 ) ) ( not ( = ?auto_2002164 ?auto_2002166 ) ) ( not ( = ?auto_2002164 ?auto_2002165 ) ) ( not ( = ?auto_2002164 ?auto_2002167 ) ) ( not ( = ?auto_2002164 ?auto_2002168 ) ) ( not ( = ?auto_2002164 ?auto_2002169 ) ) ( not ( = ?auto_2002164 ?auto_2002170 ) ) ( not ( = ?auto_2002164 ?auto_2002171 ) ) ( not ( = ?auto_2002164 ?auto_2002172 ) ) ( not ( = ?auto_2002164 ?auto_2002173 ) ) ( not ( = ?auto_2002164 ?auto_2002174 ) ) ( not ( = ?auto_2002164 ?auto_2002180 ) ) ( not ( = ?auto_2002164 ?auto_2002176 ) ) ( not ( = ?auto_2002166 ?auto_2002165 ) ) ( not ( = ?auto_2002166 ?auto_2002167 ) ) ( not ( = ?auto_2002166 ?auto_2002168 ) ) ( not ( = ?auto_2002166 ?auto_2002169 ) ) ( not ( = ?auto_2002166 ?auto_2002170 ) ) ( not ( = ?auto_2002166 ?auto_2002171 ) ) ( not ( = ?auto_2002166 ?auto_2002172 ) ) ( not ( = ?auto_2002166 ?auto_2002173 ) ) ( not ( = ?auto_2002166 ?auto_2002174 ) ) ( not ( = ?auto_2002166 ?auto_2002180 ) ) ( not ( = ?auto_2002166 ?auto_2002176 ) ) ( not ( = ?auto_2002165 ?auto_2002167 ) ) ( not ( = ?auto_2002165 ?auto_2002168 ) ) ( not ( = ?auto_2002165 ?auto_2002169 ) ) ( not ( = ?auto_2002165 ?auto_2002170 ) ) ( not ( = ?auto_2002165 ?auto_2002171 ) ) ( not ( = ?auto_2002165 ?auto_2002172 ) ) ( not ( = ?auto_2002165 ?auto_2002173 ) ) ( not ( = ?auto_2002165 ?auto_2002174 ) ) ( not ( = ?auto_2002165 ?auto_2002180 ) ) ( not ( = ?auto_2002165 ?auto_2002176 ) ) ( not ( = ?auto_2002167 ?auto_2002168 ) ) ( not ( = ?auto_2002167 ?auto_2002169 ) ) ( not ( = ?auto_2002167 ?auto_2002170 ) ) ( not ( = ?auto_2002167 ?auto_2002171 ) ) ( not ( = ?auto_2002167 ?auto_2002172 ) ) ( not ( = ?auto_2002167 ?auto_2002173 ) ) ( not ( = ?auto_2002167 ?auto_2002174 ) ) ( not ( = ?auto_2002167 ?auto_2002180 ) ) ( not ( = ?auto_2002167 ?auto_2002176 ) ) ( not ( = ?auto_2002168 ?auto_2002169 ) ) ( not ( = ?auto_2002168 ?auto_2002170 ) ) ( not ( = ?auto_2002168 ?auto_2002171 ) ) ( not ( = ?auto_2002168 ?auto_2002172 ) ) ( not ( = ?auto_2002168 ?auto_2002173 ) ) ( not ( = ?auto_2002168 ?auto_2002174 ) ) ( not ( = ?auto_2002168 ?auto_2002180 ) ) ( not ( = ?auto_2002168 ?auto_2002176 ) ) ( not ( = ?auto_2002169 ?auto_2002170 ) ) ( not ( = ?auto_2002169 ?auto_2002171 ) ) ( not ( = ?auto_2002169 ?auto_2002172 ) ) ( not ( = ?auto_2002169 ?auto_2002173 ) ) ( not ( = ?auto_2002169 ?auto_2002174 ) ) ( not ( = ?auto_2002169 ?auto_2002180 ) ) ( not ( = ?auto_2002169 ?auto_2002176 ) ) ( not ( = ?auto_2002170 ?auto_2002171 ) ) ( not ( = ?auto_2002170 ?auto_2002172 ) ) ( not ( = ?auto_2002170 ?auto_2002173 ) ) ( not ( = ?auto_2002170 ?auto_2002174 ) ) ( not ( = ?auto_2002170 ?auto_2002180 ) ) ( not ( = ?auto_2002170 ?auto_2002176 ) ) ( not ( = ?auto_2002171 ?auto_2002172 ) ) ( not ( = ?auto_2002171 ?auto_2002173 ) ) ( not ( = ?auto_2002171 ?auto_2002174 ) ) ( not ( = ?auto_2002171 ?auto_2002180 ) ) ( not ( = ?auto_2002171 ?auto_2002176 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002172 ?auto_2002173 ?auto_2002174 )
      ( MAKE-12CRATE-VERIFY ?auto_2002162 ?auto_2002163 ?auto_2002164 ?auto_2002166 ?auto_2002165 ?auto_2002167 ?auto_2002168 ?auto_2002169 ?auto_2002170 ?auto_2002171 ?auto_2002172 ?auto_2002173 ?auto_2002174 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2002182 - SURFACE
      ?auto_2002183 - SURFACE
      ?auto_2002184 - SURFACE
      ?auto_2002186 - SURFACE
      ?auto_2002185 - SURFACE
      ?auto_2002187 - SURFACE
      ?auto_2002188 - SURFACE
      ?auto_2002189 - SURFACE
      ?auto_2002190 - SURFACE
      ?auto_2002191 - SURFACE
      ?auto_2002192 - SURFACE
      ?auto_2002193 - SURFACE
      ?auto_2002194 - SURFACE
      ?auto_2002195 - SURFACE
    )
    :vars
    (
      ?auto_2002199 - HOIST
      ?auto_2002200 - PLACE
      ?auto_2002196 - PLACE
      ?auto_2002202 - HOIST
      ?auto_2002201 - SURFACE
      ?auto_2002197 - SURFACE
      ?auto_2002198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002199 ?auto_2002200 ) ( IS-CRATE ?auto_2002195 ) ( not ( = ?auto_2002194 ?auto_2002195 ) ) ( not ( = ?auto_2002193 ?auto_2002194 ) ) ( not ( = ?auto_2002193 ?auto_2002195 ) ) ( not ( = ?auto_2002196 ?auto_2002200 ) ) ( HOIST-AT ?auto_2002202 ?auto_2002196 ) ( not ( = ?auto_2002199 ?auto_2002202 ) ) ( SURFACE-AT ?auto_2002195 ?auto_2002196 ) ( ON ?auto_2002195 ?auto_2002201 ) ( CLEAR ?auto_2002195 ) ( not ( = ?auto_2002194 ?auto_2002201 ) ) ( not ( = ?auto_2002195 ?auto_2002201 ) ) ( not ( = ?auto_2002193 ?auto_2002201 ) ) ( SURFACE-AT ?auto_2002193 ?auto_2002200 ) ( CLEAR ?auto_2002193 ) ( IS-CRATE ?auto_2002194 ) ( AVAILABLE ?auto_2002199 ) ( AVAILABLE ?auto_2002202 ) ( SURFACE-AT ?auto_2002194 ?auto_2002196 ) ( ON ?auto_2002194 ?auto_2002197 ) ( CLEAR ?auto_2002194 ) ( not ( = ?auto_2002194 ?auto_2002197 ) ) ( not ( = ?auto_2002195 ?auto_2002197 ) ) ( not ( = ?auto_2002193 ?auto_2002197 ) ) ( not ( = ?auto_2002201 ?auto_2002197 ) ) ( TRUCK-AT ?auto_2002198 ?auto_2002200 ) ( ON ?auto_2002183 ?auto_2002182 ) ( ON ?auto_2002184 ?auto_2002183 ) ( ON ?auto_2002186 ?auto_2002184 ) ( ON ?auto_2002185 ?auto_2002186 ) ( ON ?auto_2002187 ?auto_2002185 ) ( ON ?auto_2002188 ?auto_2002187 ) ( ON ?auto_2002189 ?auto_2002188 ) ( ON ?auto_2002190 ?auto_2002189 ) ( ON ?auto_2002191 ?auto_2002190 ) ( ON ?auto_2002192 ?auto_2002191 ) ( ON ?auto_2002193 ?auto_2002192 ) ( not ( = ?auto_2002182 ?auto_2002183 ) ) ( not ( = ?auto_2002182 ?auto_2002184 ) ) ( not ( = ?auto_2002182 ?auto_2002186 ) ) ( not ( = ?auto_2002182 ?auto_2002185 ) ) ( not ( = ?auto_2002182 ?auto_2002187 ) ) ( not ( = ?auto_2002182 ?auto_2002188 ) ) ( not ( = ?auto_2002182 ?auto_2002189 ) ) ( not ( = ?auto_2002182 ?auto_2002190 ) ) ( not ( = ?auto_2002182 ?auto_2002191 ) ) ( not ( = ?auto_2002182 ?auto_2002192 ) ) ( not ( = ?auto_2002182 ?auto_2002193 ) ) ( not ( = ?auto_2002182 ?auto_2002194 ) ) ( not ( = ?auto_2002182 ?auto_2002195 ) ) ( not ( = ?auto_2002182 ?auto_2002201 ) ) ( not ( = ?auto_2002182 ?auto_2002197 ) ) ( not ( = ?auto_2002183 ?auto_2002184 ) ) ( not ( = ?auto_2002183 ?auto_2002186 ) ) ( not ( = ?auto_2002183 ?auto_2002185 ) ) ( not ( = ?auto_2002183 ?auto_2002187 ) ) ( not ( = ?auto_2002183 ?auto_2002188 ) ) ( not ( = ?auto_2002183 ?auto_2002189 ) ) ( not ( = ?auto_2002183 ?auto_2002190 ) ) ( not ( = ?auto_2002183 ?auto_2002191 ) ) ( not ( = ?auto_2002183 ?auto_2002192 ) ) ( not ( = ?auto_2002183 ?auto_2002193 ) ) ( not ( = ?auto_2002183 ?auto_2002194 ) ) ( not ( = ?auto_2002183 ?auto_2002195 ) ) ( not ( = ?auto_2002183 ?auto_2002201 ) ) ( not ( = ?auto_2002183 ?auto_2002197 ) ) ( not ( = ?auto_2002184 ?auto_2002186 ) ) ( not ( = ?auto_2002184 ?auto_2002185 ) ) ( not ( = ?auto_2002184 ?auto_2002187 ) ) ( not ( = ?auto_2002184 ?auto_2002188 ) ) ( not ( = ?auto_2002184 ?auto_2002189 ) ) ( not ( = ?auto_2002184 ?auto_2002190 ) ) ( not ( = ?auto_2002184 ?auto_2002191 ) ) ( not ( = ?auto_2002184 ?auto_2002192 ) ) ( not ( = ?auto_2002184 ?auto_2002193 ) ) ( not ( = ?auto_2002184 ?auto_2002194 ) ) ( not ( = ?auto_2002184 ?auto_2002195 ) ) ( not ( = ?auto_2002184 ?auto_2002201 ) ) ( not ( = ?auto_2002184 ?auto_2002197 ) ) ( not ( = ?auto_2002186 ?auto_2002185 ) ) ( not ( = ?auto_2002186 ?auto_2002187 ) ) ( not ( = ?auto_2002186 ?auto_2002188 ) ) ( not ( = ?auto_2002186 ?auto_2002189 ) ) ( not ( = ?auto_2002186 ?auto_2002190 ) ) ( not ( = ?auto_2002186 ?auto_2002191 ) ) ( not ( = ?auto_2002186 ?auto_2002192 ) ) ( not ( = ?auto_2002186 ?auto_2002193 ) ) ( not ( = ?auto_2002186 ?auto_2002194 ) ) ( not ( = ?auto_2002186 ?auto_2002195 ) ) ( not ( = ?auto_2002186 ?auto_2002201 ) ) ( not ( = ?auto_2002186 ?auto_2002197 ) ) ( not ( = ?auto_2002185 ?auto_2002187 ) ) ( not ( = ?auto_2002185 ?auto_2002188 ) ) ( not ( = ?auto_2002185 ?auto_2002189 ) ) ( not ( = ?auto_2002185 ?auto_2002190 ) ) ( not ( = ?auto_2002185 ?auto_2002191 ) ) ( not ( = ?auto_2002185 ?auto_2002192 ) ) ( not ( = ?auto_2002185 ?auto_2002193 ) ) ( not ( = ?auto_2002185 ?auto_2002194 ) ) ( not ( = ?auto_2002185 ?auto_2002195 ) ) ( not ( = ?auto_2002185 ?auto_2002201 ) ) ( not ( = ?auto_2002185 ?auto_2002197 ) ) ( not ( = ?auto_2002187 ?auto_2002188 ) ) ( not ( = ?auto_2002187 ?auto_2002189 ) ) ( not ( = ?auto_2002187 ?auto_2002190 ) ) ( not ( = ?auto_2002187 ?auto_2002191 ) ) ( not ( = ?auto_2002187 ?auto_2002192 ) ) ( not ( = ?auto_2002187 ?auto_2002193 ) ) ( not ( = ?auto_2002187 ?auto_2002194 ) ) ( not ( = ?auto_2002187 ?auto_2002195 ) ) ( not ( = ?auto_2002187 ?auto_2002201 ) ) ( not ( = ?auto_2002187 ?auto_2002197 ) ) ( not ( = ?auto_2002188 ?auto_2002189 ) ) ( not ( = ?auto_2002188 ?auto_2002190 ) ) ( not ( = ?auto_2002188 ?auto_2002191 ) ) ( not ( = ?auto_2002188 ?auto_2002192 ) ) ( not ( = ?auto_2002188 ?auto_2002193 ) ) ( not ( = ?auto_2002188 ?auto_2002194 ) ) ( not ( = ?auto_2002188 ?auto_2002195 ) ) ( not ( = ?auto_2002188 ?auto_2002201 ) ) ( not ( = ?auto_2002188 ?auto_2002197 ) ) ( not ( = ?auto_2002189 ?auto_2002190 ) ) ( not ( = ?auto_2002189 ?auto_2002191 ) ) ( not ( = ?auto_2002189 ?auto_2002192 ) ) ( not ( = ?auto_2002189 ?auto_2002193 ) ) ( not ( = ?auto_2002189 ?auto_2002194 ) ) ( not ( = ?auto_2002189 ?auto_2002195 ) ) ( not ( = ?auto_2002189 ?auto_2002201 ) ) ( not ( = ?auto_2002189 ?auto_2002197 ) ) ( not ( = ?auto_2002190 ?auto_2002191 ) ) ( not ( = ?auto_2002190 ?auto_2002192 ) ) ( not ( = ?auto_2002190 ?auto_2002193 ) ) ( not ( = ?auto_2002190 ?auto_2002194 ) ) ( not ( = ?auto_2002190 ?auto_2002195 ) ) ( not ( = ?auto_2002190 ?auto_2002201 ) ) ( not ( = ?auto_2002190 ?auto_2002197 ) ) ( not ( = ?auto_2002191 ?auto_2002192 ) ) ( not ( = ?auto_2002191 ?auto_2002193 ) ) ( not ( = ?auto_2002191 ?auto_2002194 ) ) ( not ( = ?auto_2002191 ?auto_2002195 ) ) ( not ( = ?auto_2002191 ?auto_2002201 ) ) ( not ( = ?auto_2002191 ?auto_2002197 ) ) ( not ( = ?auto_2002192 ?auto_2002193 ) ) ( not ( = ?auto_2002192 ?auto_2002194 ) ) ( not ( = ?auto_2002192 ?auto_2002195 ) ) ( not ( = ?auto_2002192 ?auto_2002201 ) ) ( not ( = ?auto_2002192 ?auto_2002197 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002193 ?auto_2002194 ?auto_2002195 )
      ( MAKE-13CRATE-VERIFY ?auto_2002182 ?auto_2002183 ?auto_2002184 ?auto_2002186 ?auto_2002185 ?auto_2002187 ?auto_2002188 ?auto_2002189 ?auto_2002190 ?auto_2002191 ?auto_2002192 ?auto_2002193 ?auto_2002194 ?auto_2002195 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2002203 - SURFACE
      ?auto_2002204 - SURFACE
      ?auto_2002205 - SURFACE
      ?auto_2002207 - SURFACE
      ?auto_2002206 - SURFACE
      ?auto_2002208 - SURFACE
      ?auto_2002209 - SURFACE
      ?auto_2002210 - SURFACE
      ?auto_2002211 - SURFACE
      ?auto_2002212 - SURFACE
      ?auto_2002213 - SURFACE
      ?auto_2002214 - SURFACE
      ?auto_2002215 - SURFACE
      ?auto_2002216 - SURFACE
      ?auto_2002217 - SURFACE
    )
    :vars
    (
      ?auto_2002221 - HOIST
      ?auto_2002222 - PLACE
      ?auto_2002218 - PLACE
      ?auto_2002224 - HOIST
      ?auto_2002223 - SURFACE
      ?auto_2002219 - SURFACE
      ?auto_2002220 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002221 ?auto_2002222 ) ( IS-CRATE ?auto_2002217 ) ( not ( = ?auto_2002216 ?auto_2002217 ) ) ( not ( = ?auto_2002215 ?auto_2002216 ) ) ( not ( = ?auto_2002215 ?auto_2002217 ) ) ( not ( = ?auto_2002218 ?auto_2002222 ) ) ( HOIST-AT ?auto_2002224 ?auto_2002218 ) ( not ( = ?auto_2002221 ?auto_2002224 ) ) ( SURFACE-AT ?auto_2002217 ?auto_2002218 ) ( ON ?auto_2002217 ?auto_2002223 ) ( CLEAR ?auto_2002217 ) ( not ( = ?auto_2002216 ?auto_2002223 ) ) ( not ( = ?auto_2002217 ?auto_2002223 ) ) ( not ( = ?auto_2002215 ?auto_2002223 ) ) ( SURFACE-AT ?auto_2002215 ?auto_2002222 ) ( CLEAR ?auto_2002215 ) ( IS-CRATE ?auto_2002216 ) ( AVAILABLE ?auto_2002221 ) ( AVAILABLE ?auto_2002224 ) ( SURFACE-AT ?auto_2002216 ?auto_2002218 ) ( ON ?auto_2002216 ?auto_2002219 ) ( CLEAR ?auto_2002216 ) ( not ( = ?auto_2002216 ?auto_2002219 ) ) ( not ( = ?auto_2002217 ?auto_2002219 ) ) ( not ( = ?auto_2002215 ?auto_2002219 ) ) ( not ( = ?auto_2002223 ?auto_2002219 ) ) ( TRUCK-AT ?auto_2002220 ?auto_2002222 ) ( ON ?auto_2002204 ?auto_2002203 ) ( ON ?auto_2002205 ?auto_2002204 ) ( ON ?auto_2002207 ?auto_2002205 ) ( ON ?auto_2002206 ?auto_2002207 ) ( ON ?auto_2002208 ?auto_2002206 ) ( ON ?auto_2002209 ?auto_2002208 ) ( ON ?auto_2002210 ?auto_2002209 ) ( ON ?auto_2002211 ?auto_2002210 ) ( ON ?auto_2002212 ?auto_2002211 ) ( ON ?auto_2002213 ?auto_2002212 ) ( ON ?auto_2002214 ?auto_2002213 ) ( ON ?auto_2002215 ?auto_2002214 ) ( not ( = ?auto_2002203 ?auto_2002204 ) ) ( not ( = ?auto_2002203 ?auto_2002205 ) ) ( not ( = ?auto_2002203 ?auto_2002207 ) ) ( not ( = ?auto_2002203 ?auto_2002206 ) ) ( not ( = ?auto_2002203 ?auto_2002208 ) ) ( not ( = ?auto_2002203 ?auto_2002209 ) ) ( not ( = ?auto_2002203 ?auto_2002210 ) ) ( not ( = ?auto_2002203 ?auto_2002211 ) ) ( not ( = ?auto_2002203 ?auto_2002212 ) ) ( not ( = ?auto_2002203 ?auto_2002213 ) ) ( not ( = ?auto_2002203 ?auto_2002214 ) ) ( not ( = ?auto_2002203 ?auto_2002215 ) ) ( not ( = ?auto_2002203 ?auto_2002216 ) ) ( not ( = ?auto_2002203 ?auto_2002217 ) ) ( not ( = ?auto_2002203 ?auto_2002223 ) ) ( not ( = ?auto_2002203 ?auto_2002219 ) ) ( not ( = ?auto_2002204 ?auto_2002205 ) ) ( not ( = ?auto_2002204 ?auto_2002207 ) ) ( not ( = ?auto_2002204 ?auto_2002206 ) ) ( not ( = ?auto_2002204 ?auto_2002208 ) ) ( not ( = ?auto_2002204 ?auto_2002209 ) ) ( not ( = ?auto_2002204 ?auto_2002210 ) ) ( not ( = ?auto_2002204 ?auto_2002211 ) ) ( not ( = ?auto_2002204 ?auto_2002212 ) ) ( not ( = ?auto_2002204 ?auto_2002213 ) ) ( not ( = ?auto_2002204 ?auto_2002214 ) ) ( not ( = ?auto_2002204 ?auto_2002215 ) ) ( not ( = ?auto_2002204 ?auto_2002216 ) ) ( not ( = ?auto_2002204 ?auto_2002217 ) ) ( not ( = ?auto_2002204 ?auto_2002223 ) ) ( not ( = ?auto_2002204 ?auto_2002219 ) ) ( not ( = ?auto_2002205 ?auto_2002207 ) ) ( not ( = ?auto_2002205 ?auto_2002206 ) ) ( not ( = ?auto_2002205 ?auto_2002208 ) ) ( not ( = ?auto_2002205 ?auto_2002209 ) ) ( not ( = ?auto_2002205 ?auto_2002210 ) ) ( not ( = ?auto_2002205 ?auto_2002211 ) ) ( not ( = ?auto_2002205 ?auto_2002212 ) ) ( not ( = ?auto_2002205 ?auto_2002213 ) ) ( not ( = ?auto_2002205 ?auto_2002214 ) ) ( not ( = ?auto_2002205 ?auto_2002215 ) ) ( not ( = ?auto_2002205 ?auto_2002216 ) ) ( not ( = ?auto_2002205 ?auto_2002217 ) ) ( not ( = ?auto_2002205 ?auto_2002223 ) ) ( not ( = ?auto_2002205 ?auto_2002219 ) ) ( not ( = ?auto_2002207 ?auto_2002206 ) ) ( not ( = ?auto_2002207 ?auto_2002208 ) ) ( not ( = ?auto_2002207 ?auto_2002209 ) ) ( not ( = ?auto_2002207 ?auto_2002210 ) ) ( not ( = ?auto_2002207 ?auto_2002211 ) ) ( not ( = ?auto_2002207 ?auto_2002212 ) ) ( not ( = ?auto_2002207 ?auto_2002213 ) ) ( not ( = ?auto_2002207 ?auto_2002214 ) ) ( not ( = ?auto_2002207 ?auto_2002215 ) ) ( not ( = ?auto_2002207 ?auto_2002216 ) ) ( not ( = ?auto_2002207 ?auto_2002217 ) ) ( not ( = ?auto_2002207 ?auto_2002223 ) ) ( not ( = ?auto_2002207 ?auto_2002219 ) ) ( not ( = ?auto_2002206 ?auto_2002208 ) ) ( not ( = ?auto_2002206 ?auto_2002209 ) ) ( not ( = ?auto_2002206 ?auto_2002210 ) ) ( not ( = ?auto_2002206 ?auto_2002211 ) ) ( not ( = ?auto_2002206 ?auto_2002212 ) ) ( not ( = ?auto_2002206 ?auto_2002213 ) ) ( not ( = ?auto_2002206 ?auto_2002214 ) ) ( not ( = ?auto_2002206 ?auto_2002215 ) ) ( not ( = ?auto_2002206 ?auto_2002216 ) ) ( not ( = ?auto_2002206 ?auto_2002217 ) ) ( not ( = ?auto_2002206 ?auto_2002223 ) ) ( not ( = ?auto_2002206 ?auto_2002219 ) ) ( not ( = ?auto_2002208 ?auto_2002209 ) ) ( not ( = ?auto_2002208 ?auto_2002210 ) ) ( not ( = ?auto_2002208 ?auto_2002211 ) ) ( not ( = ?auto_2002208 ?auto_2002212 ) ) ( not ( = ?auto_2002208 ?auto_2002213 ) ) ( not ( = ?auto_2002208 ?auto_2002214 ) ) ( not ( = ?auto_2002208 ?auto_2002215 ) ) ( not ( = ?auto_2002208 ?auto_2002216 ) ) ( not ( = ?auto_2002208 ?auto_2002217 ) ) ( not ( = ?auto_2002208 ?auto_2002223 ) ) ( not ( = ?auto_2002208 ?auto_2002219 ) ) ( not ( = ?auto_2002209 ?auto_2002210 ) ) ( not ( = ?auto_2002209 ?auto_2002211 ) ) ( not ( = ?auto_2002209 ?auto_2002212 ) ) ( not ( = ?auto_2002209 ?auto_2002213 ) ) ( not ( = ?auto_2002209 ?auto_2002214 ) ) ( not ( = ?auto_2002209 ?auto_2002215 ) ) ( not ( = ?auto_2002209 ?auto_2002216 ) ) ( not ( = ?auto_2002209 ?auto_2002217 ) ) ( not ( = ?auto_2002209 ?auto_2002223 ) ) ( not ( = ?auto_2002209 ?auto_2002219 ) ) ( not ( = ?auto_2002210 ?auto_2002211 ) ) ( not ( = ?auto_2002210 ?auto_2002212 ) ) ( not ( = ?auto_2002210 ?auto_2002213 ) ) ( not ( = ?auto_2002210 ?auto_2002214 ) ) ( not ( = ?auto_2002210 ?auto_2002215 ) ) ( not ( = ?auto_2002210 ?auto_2002216 ) ) ( not ( = ?auto_2002210 ?auto_2002217 ) ) ( not ( = ?auto_2002210 ?auto_2002223 ) ) ( not ( = ?auto_2002210 ?auto_2002219 ) ) ( not ( = ?auto_2002211 ?auto_2002212 ) ) ( not ( = ?auto_2002211 ?auto_2002213 ) ) ( not ( = ?auto_2002211 ?auto_2002214 ) ) ( not ( = ?auto_2002211 ?auto_2002215 ) ) ( not ( = ?auto_2002211 ?auto_2002216 ) ) ( not ( = ?auto_2002211 ?auto_2002217 ) ) ( not ( = ?auto_2002211 ?auto_2002223 ) ) ( not ( = ?auto_2002211 ?auto_2002219 ) ) ( not ( = ?auto_2002212 ?auto_2002213 ) ) ( not ( = ?auto_2002212 ?auto_2002214 ) ) ( not ( = ?auto_2002212 ?auto_2002215 ) ) ( not ( = ?auto_2002212 ?auto_2002216 ) ) ( not ( = ?auto_2002212 ?auto_2002217 ) ) ( not ( = ?auto_2002212 ?auto_2002223 ) ) ( not ( = ?auto_2002212 ?auto_2002219 ) ) ( not ( = ?auto_2002213 ?auto_2002214 ) ) ( not ( = ?auto_2002213 ?auto_2002215 ) ) ( not ( = ?auto_2002213 ?auto_2002216 ) ) ( not ( = ?auto_2002213 ?auto_2002217 ) ) ( not ( = ?auto_2002213 ?auto_2002223 ) ) ( not ( = ?auto_2002213 ?auto_2002219 ) ) ( not ( = ?auto_2002214 ?auto_2002215 ) ) ( not ( = ?auto_2002214 ?auto_2002216 ) ) ( not ( = ?auto_2002214 ?auto_2002217 ) ) ( not ( = ?auto_2002214 ?auto_2002223 ) ) ( not ( = ?auto_2002214 ?auto_2002219 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002215 ?auto_2002216 ?auto_2002217 )
      ( MAKE-14CRATE-VERIFY ?auto_2002203 ?auto_2002204 ?auto_2002205 ?auto_2002207 ?auto_2002206 ?auto_2002208 ?auto_2002209 ?auto_2002210 ?auto_2002211 ?auto_2002212 ?auto_2002213 ?auto_2002214 ?auto_2002215 ?auto_2002216 ?auto_2002217 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2002225 - SURFACE
      ?auto_2002226 - SURFACE
      ?auto_2002227 - SURFACE
      ?auto_2002229 - SURFACE
      ?auto_2002228 - SURFACE
      ?auto_2002230 - SURFACE
      ?auto_2002231 - SURFACE
      ?auto_2002232 - SURFACE
      ?auto_2002233 - SURFACE
      ?auto_2002234 - SURFACE
      ?auto_2002235 - SURFACE
      ?auto_2002236 - SURFACE
      ?auto_2002237 - SURFACE
      ?auto_2002238 - SURFACE
      ?auto_2002239 - SURFACE
      ?auto_2002240 - SURFACE
    )
    :vars
    (
      ?auto_2002244 - HOIST
      ?auto_2002245 - PLACE
      ?auto_2002241 - PLACE
      ?auto_2002247 - HOIST
      ?auto_2002246 - SURFACE
      ?auto_2002242 - SURFACE
      ?auto_2002243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002244 ?auto_2002245 ) ( IS-CRATE ?auto_2002240 ) ( not ( = ?auto_2002239 ?auto_2002240 ) ) ( not ( = ?auto_2002238 ?auto_2002239 ) ) ( not ( = ?auto_2002238 ?auto_2002240 ) ) ( not ( = ?auto_2002241 ?auto_2002245 ) ) ( HOIST-AT ?auto_2002247 ?auto_2002241 ) ( not ( = ?auto_2002244 ?auto_2002247 ) ) ( SURFACE-AT ?auto_2002240 ?auto_2002241 ) ( ON ?auto_2002240 ?auto_2002246 ) ( CLEAR ?auto_2002240 ) ( not ( = ?auto_2002239 ?auto_2002246 ) ) ( not ( = ?auto_2002240 ?auto_2002246 ) ) ( not ( = ?auto_2002238 ?auto_2002246 ) ) ( SURFACE-AT ?auto_2002238 ?auto_2002245 ) ( CLEAR ?auto_2002238 ) ( IS-CRATE ?auto_2002239 ) ( AVAILABLE ?auto_2002244 ) ( AVAILABLE ?auto_2002247 ) ( SURFACE-AT ?auto_2002239 ?auto_2002241 ) ( ON ?auto_2002239 ?auto_2002242 ) ( CLEAR ?auto_2002239 ) ( not ( = ?auto_2002239 ?auto_2002242 ) ) ( not ( = ?auto_2002240 ?auto_2002242 ) ) ( not ( = ?auto_2002238 ?auto_2002242 ) ) ( not ( = ?auto_2002246 ?auto_2002242 ) ) ( TRUCK-AT ?auto_2002243 ?auto_2002245 ) ( ON ?auto_2002226 ?auto_2002225 ) ( ON ?auto_2002227 ?auto_2002226 ) ( ON ?auto_2002229 ?auto_2002227 ) ( ON ?auto_2002228 ?auto_2002229 ) ( ON ?auto_2002230 ?auto_2002228 ) ( ON ?auto_2002231 ?auto_2002230 ) ( ON ?auto_2002232 ?auto_2002231 ) ( ON ?auto_2002233 ?auto_2002232 ) ( ON ?auto_2002234 ?auto_2002233 ) ( ON ?auto_2002235 ?auto_2002234 ) ( ON ?auto_2002236 ?auto_2002235 ) ( ON ?auto_2002237 ?auto_2002236 ) ( ON ?auto_2002238 ?auto_2002237 ) ( not ( = ?auto_2002225 ?auto_2002226 ) ) ( not ( = ?auto_2002225 ?auto_2002227 ) ) ( not ( = ?auto_2002225 ?auto_2002229 ) ) ( not ( = ?auto_2002225 ?auto_2002228 ) ) ( not ( = ?auto_2002225 ?auto_2002230 ) ) ( not ( = ?auto_2002225 ?auto_2002231 ) ) ( not ( = ?auto_2002225 ?auto_2002232 ) ) ( not ( = ?auto_2002225 ?auto_2002233 ) ) ( not ( = ?auto_2002225 ?auto_2002234 ) ) ( not ( = ?auto_2002225 ?auto_2002235 ) ) ( not ( = ?auto_2002225 ?auto_2002236 ) ) ( not ( = ?auto_2002225 ?auto_2002237 ) ) ( not ( = ?auto_2002225 ?auto_2002238 ) ) ( not ( = ?auto_2002225 ?auto_2002239 ) ) ( not ( = ?auto_2002225 ?auto_2002240 ) ) ( not ( = ?auto_2002225 ?auto_2002246 ) ) ( not ( = ?auto_2002225 ?auto_2002242 ) ) ( not ( = ?auto_2002226 ?auto_2002227 ) ) ( not ( = ?auto_2002226 ?auto_2002229 ) ) ( not ( = ?auto_2002226 ?auto_2002228 ) ) ( not ( = ?auto_2002226 ?auto_2002230 ) ) ( not ( = ?auto_2002226 ?auto_2002231 ) ) ( not ( = ?auto_2002226 ?auto_2002232 ) ) ( not ( = ?auto_2002226 ?auto_2002233 ) ) ( not ( = ?auto_2002226 ?auto_2002234 ) ) ( not ( = ?auto_2002226 ?auto_2002235 ) ) ( not ( = ?auto_2002226 ?auto_2002236 ) ) ( not ( = ?auto_2002226 ?auto_2002237 ) ) ( not ( = ?auto_2002226 ?auto_2002238 ) ) ( not ( = ?auto_2002226 ?auto_2002239 ) ) ( not ( = ?auto_2002226 ?auto_2002240 ) ) ( not ( = ?auto_2002226 ?auto_2002246 ) ) ( not ( = ?auto_2002226 ?auto_2002242 ) ) ( not ( = ?auto_2002227 ?auto_2002229 ) ) ( not ( = ?auto_2002227 ?auto_2002228 ) ) ( not ( = ?auto_2002227 ?auto_2002230 ) ) ( not ( = ?auto_2002227 ?auto_2002231 ) ) ( not ( = ?auto_2002227 ?auto_2002232 ) ) ( not ( = ?auto_2002227 ?auto_2002233 ) ) ( not ( = ?auto_2002227 ?auto_2002234 ) ) ( not ( = ?auto_2002227 ?auto_2002235 ) ) ( not ( = ?auto_2002227 ?auto_2002236 ) ) ( not ( = ?auto_2002227 ?auto_2002237 ) ) ( not ( = ?auto_2002227 ?auto_2002238 ) ) ( not ( = ?auto_2002227 ?auto_2002239 ) ) ( not ( = ?auto_2002227 ?auto_2002240 ) ) ( not ( = ?auto_2002227 ?auto_2002246 ) ) ( not ( = ?auto_2002227 ?auto_2002242 ) ) ( not ( = ?auto_2002229 ?auto_2002228 ) ) ( not ( = ?auto_2002229 ?auto_2002230 ) ) ( not ( = ?auto_2002229 ?auto_2002231 ) ) ( not ( = ?auto_2002229 ?auto_2002232 ) ) ( not ( = ?auto_2002229 ?auto_2002233 ) ) ( not ( = ?auto_2002229 ?auto_2002234 ) ) ( not ( = ?auto_2002229 ?auto_2002235 ) ) ( not ( = ?auto_2002229 ?auto_2002236 ) ) ( not ( = ?auto_2002229 ?auto_2002237 ) ) ( not ( = ?auto_2002229 ?auto_2002238 ) ) ( not ( = ?auto_2002229 ?auto_2002239 ) ) ( not ( = ?auto_2002229 ?auto_2002240 ) ) ( not ( = ?auto_2002229 ?auto_2002246 ) ) ( not ( = ?auto_2002229 ?auto_2002242 ) ) ( not ( = ?auto_2002228 ?auto_2002230 ) ) ( not ( = ?auto_2002228 ?auto_2002231 ) ) ( not ( = ?auto_2002228 ?auto_2002232 ) ) ( not ( = ?auto_2002228 ?auto_2002233 ) ) ( not ( = ?auto_2002228 ?auto_2002234 ) ) ( not ( = ?auto_2002228 ?auto_2002235 ) ) ( not ( = ?auto_2002228 ?auto_2002236 ) ) ( not ( = ?auto_2002228 ?auto_2002237 ) ) ( not ( = ?auto_2002228 ?auto_2002238 ) ) ( not ( = ?auto_2002228 ?auto_2002239 ) ) ( not ( = ?auto_2002228 ?auto_2002240 ) ) ( not ( = ?auto_2002228 ?auto_2002246 ) ) ( not ( = ?auto_2002228 ?auto_2002242 ) ) ( not ( = ?auto_2002230 ?auto_2002231 ) ) ( not ( = ?auto_2002230 ?auto_2002232 ) ) ( not ( = ?auto_2002230 ?auto_2002233 ) ) ( not ( = ?auto_2002230 ?auto_2002234 ) ) ( not ( = ?auto_2002230 ?auto_2002235 ) ) ( not ( = ?auto_2002230 ?auto_2002236 ) ) ( not ( = ?auto_2002230 ?auto_2002237 ) ) ( not ( = ?auto_2002230 ?auto_2002238 ) ) ( not ( = ?auto_2002230 ?auto_2002239 ) ) ( not ( = ?auto_2002230 ?auto_2002240 ) ) ( not ( = ?auto_2002230 ?auto_2002246 ) ) ( not ( = ?auto_2002230 ?auto_2002242 ) ) ( not ( = ?auto_2002231 ?auto_2002232 ) ) ( not ( = ?auto_2002231 ?auto_2002233 ) ) ( not ( = ?auto_2002231 ?auto_2002234 ) ) ( not ( = ?auto_2002231 ?auto_2002235 ) ) ( not ( = ?auto_2002231 ?auto_2002236 ) ) ( not ( = ?auto_2002231 ?auto_2002237 ) ) ( not ( = ?auto_2002231 ?auto_2002238 ) ) ( not ( = ?auto_2002231 ?auto_2002239 ) ) ( not ( = ?auto_2002231 ?auto_2002240 ) ) ( not ( = ?auto_2002231 ?auto_2002246 ) ) ( not ( = ?auto_2002231 ?auto_2002242 ) ) ( not ( = ?auto_2002232 ?auto_2002233 ) ) ( not ( = ?auto_2002232 ?auto_2002234 ) ) ( not ( = ?auto_2002232 ?auto_2002235 ) ) ( not ( = ?auto_2002232 ?auto_2002236 ) ) ( not ( = ?auto_2002232 ?auto_2002237 ) ) ( not ( = ?auto_2002232 ?auto_2002238 ) ) ( not ( = ?auto_2002232 ?auto_2002239 ) ) ( not ( = ?auto_2002232 ?auto_2002240 ) ) ( not ( = ?auto_2002232 ?auto_2002246 ) ) ( not ( = ?auto_2002232 ?auto_2002242 ) ) ( not ( = ?auto_2002233 ?auto_2002234 ) ) ( not ( = ?auto_2002233 ?auto_2002235 ) ) ( not ( = ?auto_2002233 ?auto_2002236 ) ) ( not ( = ?auto_2002233 ?auto_2002237 ) ) ( not ( = ?auto_2002233 ?auto_2002238 ) ) ( not ( = ?auto_2002233 ?auto_2002239 ) ) ( not ( = ?auto_2002233 ?auto_2002240 ) ) ( not ( = ?auto_2002233 ?auto_2002246 ) ) ( not ( = ?auto_2002233 ?auto_2002242 ) ) ( not ( = ?auto_2002234 ?auto_2002235 ) ) ( not ( = ?auto_2002234 ?auto_2002236 ) ) ( not ( = ?auto_2002234 ?auto_2002237 ) ) ( not ( = ?auto_2002234 ?auto_2002238 ) ) ( not ( = ?auto_2002234 ?auto_2002239 ) ) ( not ( = ?auto_2002234 ?auto_2002240 ) ) ( not ( = ?auto_2002234 ?auto_2002246 ) ) ( not ( = ?auto_2002234 ?auto_2002242 ) ) ( not ( = ?auto_2002235 ?auto_2002236 ) ) ( not ( = ?auto_2002235 ?auto_2002237 ) ) ( not ( = ?auto_2002235 ?auto_2002238 ) ) ( not ( = ?auto_2002235 ?auto_2002239 ) ) ( not ( = ?auto_2002235 ?auto_2002240 ) ) ( not ( = ?auto_2002235 ?auto_2002246 ) ) ( not ( = ?auto_2002235 ?auto_2002242 ) ) ( not ( = ?auto_2002236 ?auto_2002237 ) ) ( not ( = ?auto_2002236 ?auto_2002238 ) ) ( not ( = ?auto_2002236 ?auto_2002239 ) ) ( not ( = ?auto_2002236 ?auto_2002240 ) ) ( not ( = ?auto_2002236 ?auto_2002246 ) ) ( not ( = ?auto_2002236 ?auto_2002242 ) ) ( not ( = ?auto_2002237 ?auto_2002238 ) ) ( not ( = ?auto_2002237 ?auto_2002239 ) ) ( not ( = ?auto_2002237 ?auto_2002240 ) ) ( not ( = ?auto_2002237 ?auto_2002246 ) ) ( not ( = ?auto_2002237 ?auto_2002242 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002238 ?auto_2002239 ?auto_2002240 )
      ( MAKE-15CRATE-VERIFY ?auto_2002225 ?auto_2002226 ?auto_2002227 ?auto_2002229 ?auto_2002228 ?auto_2002230 ?auto_2002231 ?auto_2002232 ?auto_2002233 ?auto_2002234 ?auto_2002235 ?auto_2002236 ?auto_2002237 ?auto_2002238 ?auto_2002239 ?auto_2002240 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2002248 - SURFACE
      ?auto_2002249 - SURFACE
    )
    :vars
    (
      ?auto_2002253 - HOIST
      ?auto_2002254 - PLACE
      ?auto_2002255 - SURFACE
      ?auto_2002250 - PLACE
      ?auto_2002257 - HOIST
      ?auto_2002256 - SURFACE
      ?auto_2002251 - SURFACE
      ?auto_2002252 - TRUCK
      ?auto_2002258 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002253 ?auto_2002254 ) ( IS-CRATE ?auto_2002249 ) ( not ( = ?auto_2002248 ?auto_2002249 ) ) ( not ( = ?auto_2002255 ?auto_2002248 ) ) ( not ( = ?auto_2002255 ?auto_2002249 ) ) ( not ( = ?auto_2002250 ?auto_2002254 ) ) ( HOIST-AT ?auto_2002257 ?auto_2002250 ) ( not ( = ?auto_2002253 ?auto_2002257 ) ) ( SURFACE-AT ?auto_2002249 ?auto_2002250 ) ( ON ?auto_2002249 ?auto_2002256 ) ( CLEAR ?auto_2002249 ) ( not ( = ?auto_2002248 ?auto_2002256 ) ) ( not ( = ?auto_2002249 ?auto_2002256 ) ) ( not ( = ?auto_2002255 ?auto_2002256 ) ) ( IS-CRATE ?auto_2002248 ) ( AVAILABLE ?auto_2002257 ) ( SURFACE-AT ?auto_2002248 ?auto_2002250 ) ( ON ?auto_2002248 ?auto_2002251 ) ( CLEAR ?auto_2002248 ) ( not ( = ?auto_2002248 ?auto_2002251 ) ) ( not ( = ?auto_2002249 ?auto_2002251 ) ) ( not ( = ?auto_2002255 ?auto_2002251 ) ) ( not ( = ?auto_2002256 ?auto_2002251 ) ) ( TRUCK-AT ?auto_2002252 ?auto_2002254 ) ( SURFACE-AT ?auto_2002258 ?auto_2002254 ) ( CLEAR ?auto_2002258 ) ( LIFTING ?auto_2002253 ?auto_2002255 ) ( IS-CRATE ?auto_2002255 ) ( not ( = ?auto_2002258 ?auto_2002255 ) ) ( not ( = ?auto_2002248 ?auto_2002258 ) ) ( not ( = ?auto_2002249 ?auto_2002258 ) ) ( not ( = ?auto_2002256 ?auto_2002258 ) ) ( not ( = ?auto_2002251 ?auto_2002258 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2002258 ?auto_2002255 )
      ( MAKE-2CRATE ?auto_2002255 ?auto_2002248 ?auto_2002249 )
      ( MAKE-1CRATE-VERIFY ?auto_2002248 ?auto_2002249 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2002259 - SURFACE
      ?auto_2002260 - SURFACE
      ?auto_2002261 - SURFACE
    )
    :vars
    (
      ?auto_2002265 - HOIST
      ?auto_2002264 - PLACE
      ?auto_2002262 - PLACE
      ?auto_2002269 - HOIST
      ?auto_2002267 - SURFACE
      ?auto_2002268 - SURFACE
      ?auto_2002266 - TRUCK
      ?auto_2002263 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002265 ?auto_2002264 ) ( IS-CRATE ?auto_2002261 ) ( not ( = ?auto_2002260 ?auto_2002261 ) ) ( not ( = ?auto_2002259 ?auto_2002260 ) ) ( not ( = ?auto_2002259 ?auto_2002261 ) ) ( not ( = ?auto_2002262 ?auto_2002264 ) ) ( HOIST-AT ?auto_2002269 ?auto_2002262 ) ( not ( = ?auto_2002265 ?auto_2002269 ) ) ( SURFACE-AT ?auto_2002261 ?auto_2002262 ) ( ON ?auto_2002261 ?auto_2002267 ) ( CLEAR ?auto_2002261 ) ( not ( = ?auto_2002260 ?auto_2002267 ) ) ( not ( = ?auto_2002261 ?auto_2002267 ) ) ( not ( = ?auto_2002259 ?auto_2002267 ) ) ( IS-CRATE ?auto_2002260 ) ( AVAILABLE ?auto_2002269 ) ( SURFACE-AT ?auto_2002260 ?auto_2002262 ) ( ON ?auto_2002260 ?auto_2002268 ) ( CLEAR ?auto_2002260 ) ( not ( = ?auto_2002260 ?auto_2002268 ) ) ( not ( = ?auto_2002261 ?auto_2002268 ) ) ( not ( = ?auto_2002259 ?auto_2002268 ) ) ( not ( = ?auto_2002267 ?auto_2002268 ) ) ( TRUCK-AT ?auto_2002266 ?auto_2002264 ) ( SURFACE-AT ?auto_2002263 ?auto_2002264 ) ( CLEAR ?auto_2002263 ) ( LIFTING ?auto_2002265 ?auto_2002259 ) ( IS-CRATE ?auto_2002259 ) ( not ( = ?auto_2002263 ?auto_2002259 ) ) ( not ( = ?auto_2002260 ?auto_2002263 ) ) ( not ( = ?auto_2002261 ?auto_2002263 ) ) ( not ( = ?auto_2002267 ?auto_2002263 ) ) ( not ( = ?auto_2002268 ?auto_2002263 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2002260 ?auto_2002261 )
      ( MAKE-2CRATE-VERIFY ?auto_2002259 ?auto_2002260 ?auto_2002261 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2002270 - SURFACE
      ?auto_2002271 - SURFACE
      ?auto_2002272 - SURFACE
      ?auto_2002273 - SURFACE
    )
    :vars
    (
      ?auto_2002276 - HOIST
      ?auto_2002280 - PLACE
      ?auto_2002275 - PLACE
      ?auto_2002274 - HOIST
      ?auto_2002277 - SURFACE
      ?auto_2002278 - SURFACE
      ?auto_2002279 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002276 ?auto_2002280 ) ( IS-CRATE ?auto_2002273 ) ( not ( = ?auto_2002272 ?auto_2002273 ) ) ( not ( = ?auto_2002271 ?auto_2002272 ) ) ( not ( = ?auto_2002271 ?auto_2002273 ) ) ( not ( = ?auto_2002275 ?auto_2002280 ) ) ( HOIST-AT ?auto_2002274 ?auto_2002275 ) ( not ( = ?auto_2002276 ?auto_2002274 ) ) ( SURFACE-AT ?auto_2002273 ?auto_2002275 ) ( ON ?auto_2002273 ?auto_2002277 ) ( CLEAR ?auto_2002273 ) ( not ( = ?auto_2002272 ?auto_2002277 ) ) ( not ( = ?auto_2002273 ?auto_2002277 ) ) ( not ( = ?auto_2002271 ?auto_2002277 ) ) ( IS-CRATE ?auto_2002272 ) ( AVAILABLE ?auto_2002274 ) ( SURFACE-AT ?auto_2002272 ?auto_2002275 ) ( ON ?auto_2002272 ?auto_2002278 ) ( CLEAR ?auto_2002272 ) ( not ( = ?auto_2002272 ?auto_2002278 ) ) ( not ( = ?auto_2002273 ?auto_2002278 ) ) ( not ( = ?auto_2002271 ?auto_2002278 ) ) ( not ( = ?auto_2002277 ?auto_2002278 ) ) ( TRUCK-AT ?auto_2002279 ?auto_2002280 ) ( SURFACE-AT ?auto_2002270 ?auto_2002280 ) ( CLEAR ?auto_2002270 ) ( LIFTING ?auto_2002276 ?auto_2002271 ) ( IS-CRATE ?auto_2002271 ) ( not ( = ?auto_2002270 ?auto_2002271 ) ) ( not ( = ?auto_2002272 ?auto_2002270 ) ) ( not ( = ?auto_2002273 ?auto_2002270 ) ) ( not ( = ?auto_2002277 ?auto_2002270 ) ) ( not ( = ?auto_2002278 ?auto_2002270 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002271 ?auto_2002272 ?auto_2002273 )
      ( MAKE-3CRATE-VERIFY ?auto_2002270 ?auto_2002271 ?auto_2002272 ?auto_2002273 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2002281 - SURFACE
      ?auto_2002282 - SURFACE
      ?auto_2002283 - SURFACE
      ?auto_2002285 - SURFACE
      ?auto_2002284 - SURFACE
    )
    :vars
    (
      ?auto_2002288 - HOIST
      ?auto_2002292 - PLACE
      ?auto_2002287 - PLACE
      ?auto_2002286 - HOIST
      ?auto_2002289 - SURFACE
      ?auto_2002290 - SURFACE
      ?auto_2002291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002288 ?auto_2002292 ) ( IS-CRATE ?auto_2002284 ) ( not ( = ?auto_2002285 ?auto_2002284 ) ) ( not ( = ?auto_2002283 ?auto_2002285 ) ) ( not ( = ?auto_2002283 ?auto_2002284 ) ) ( not ( = ?auto_2002287 ?auto_2002292 ) ) ( HOIST-AT ?auto_2002286 ?auto_2002287 ) ( not ( = ?auto_2002288 ?auto_2002286 ) ) ( SURFACE-AT ?auto_2002284 ?auto_2002287 ) ( ON ?auto_2002284 ?auto_2002289 ) ( CLEAR ?auto_2002284 ) ( not ( = ?auto_2002285 ?auto_2002289 ) ) ( not ( = ?auto_2002284 ?auto_2002289 ) ) ( not ( = ?auto_2002283 ?auto_2002289 ) ) ( IS-CRATE ?auto_2002285 ) ( AVAILABLE ?auto_2002286 ) ( SURFACE-AT ?auto_2002285 ?auto_2002287 ) ( ON ?auto_2002285 ?auto_2002290 ) ( CLEAR ?auto_2002285 ) ( not ( = ?auto_2002285 ?auto_2002290 ) ) ( not ( = ?auto_2002284 ?auto_2002290 ) ) ( not ( = ?auto_2002283 ?auto_2002290 ) ) ( not ( = ?auto_2002289 ?auto_2002290 ) ) ( TRUCK-AT ?auto_2002291 ?auto_2002292 ) ( SURFACE-AT ?auto_2002282 ?auto_2002292 ) ( CLEAR ?auto_2002282 ) ( LIFTING ?auto_2002288 ?auto_2002283 ) ( IS-CRATE ?auto_2002283 ) ( not ( = ?auto_2002282 ?auto_2002283 ) ) ( not ( = ?auto_2002285 ?auto_2002282 ) ) ( not ( = ?auto_2002284 ?auto_2002282 ) ) ( not ( = ?auto_2002289 ?auto_2002282 ) ) ( not ( = ?auto_2002290 ?auto_2002282 ) ) ( ON ?auto_2002282 ?auto_2002281 ) ( not ( = ?auto_2002281 ?auto_2002282 ) ) ( not ( = ?auto_2002281 ?auto_2002283 ) ) ( not ( = ?auto_2002281 ?auto_2002285 ) ) ( not ( = ?auto_2002281 ?auto_2002284 ) ) ( not ( = ?auto_2002281 ?auto_2002289 ) ) ( not ( = ?auto_2002281 ?auto_2002290 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002283 ?auto_2002285 ?auto_2002284 )
      ( MAKE-4CRATE-VERIFY ?auto_2002281 ?auto_2002282 ?auto_2002283 ?auto_2002285 ?auto_2002284 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2002293 - SURFACE
      ?auto_2002294 - SURFACE
      ?auto_2002295 - SURFACE
      ?auto_2002297 - SURFACE
      ?auto_2002296 - SURFACE
      ?auto_2002298 - SURFACE
    )
    :vars
    (
      ?auto_2002301 - HOIST
      ?auto_2002305 - PLACE
      ?auto_2002300 - PLACE
      ?auto_2002299 - HOIST
      ?auto_2002302 - SURFACE
      ?auto_2002303 - SURFACE
      ?auto_2002304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002301 ?auto_2002305 ) ( IS-CRATE ?auto_2002298 ) ( not ( = ?auto_2002296 ?auto_2002298 ) ) ( not ( = ?auto_2002297 ?auto_2002296 ) ) ( not ( = ?auto_2002297 ?auto_2002298 ) ) ( not ( = ?auto_2002300 ?auto_2002305 ) ) ( HOIST-AT ?auto_2002299 ?auto_2002300 ) ( not ( = ?auto_2002301 ?auto_2002299 ) ) ( SURFACE-AT ?auto_2002298 ?auto_2002300 ) ( ON ?auto_2002298 ?auto_2002302 ) ( CLEAR ?auto_2002298 ) ( not ( = ?auto_2002296 ?auto_2002302 ) ) ( not ( = ?auto_2002298 ?auto_2002302 ) ) ( not ( = ?auto_2002297 ?auto_2002302 ) ) ( IS-CRATE ?auto_2002296 ) ( AVAILABLE ?auto_2002299 ) ( SURFACE-AT ?auto_2002296 ?auto_2002300 ) ( ON ?auto_2002296 ?auto_2002303 ) ( CLEAR ?auto_2002296 ) ( not ( = ?auto_2002296 ?auto_2002303 ) ) ( not ( = ?auto_2002298 ?auto_2002303 ) ) ( not ( = ?auto_2002297 ?auto_2002303 ) ) ( not ( = ?auto_2002302 ?auto_2002303 ) ) ( TRUCK-AT ?auto_2002304 ?auto_2002305 ) ( SURFACE-AT ?auto_2002295 ?auto_2002305 ) ( CLEAR ?auto_2002295 ) ( LIFTING ?auto_2002301 ?auto_2002297 ) ( IS-CRATE ?auto_2002297 ) ( not ( = ?auto_2002295 ?auto_2002297 ) ) ( not ( = ?auto_2002296 ?auto_2002295 ) ) ( not ( = ?auto_2002298 ?auto_2002295 ) ) ( not ( = ?auto_2002302 ?auto_2002295 ) ) ( not ( = ?auto_2002303 ?auto_2002295 ) ) ( ON ?auto_2002294 ?auto_2002293 ) ( ON ?auto_2002295 ?auto_2002294 ) ( not ( = ?auto_2002293 ?auto_2002294 ) ) ( not ( = ?auto_2002293 ?auto_2002295 ) ) ( not ( = ?auto_2002293 ?auto_2002297 ) ) ( not ( = ?auto_2002293 ?auto_2002296 ) ) ( not ( = ?auto_2002293 ?auto_2002298 ) ) ( not ( = ?auto_2002293 ?auto_2002302 ) ) ( not ( = ?auto_2002293 ?auto_2002303 ) ) ( not ( = ?auto_2002294 ?auto_2002295 ) ) ( not ( = ?auto_2002294 ?auto_2002297 ) ) ( not ( = ?auto_2002294 ?auto_2002296 ) ) ( not ( = ?auto_2002294 ?auto_2002298 ) ) ( not ( = ?auto_2002294 ?auto_2002302 ) ) ( not ( = ?auto_2002294 ?auto_2002303 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002297 ?auto_2002296 ?auto_2002298 )
      ( MAKE-5CRATE-VERIFY ?auto_2002293 ?auto_2002294 ?auto_2002295 ?auto_2002297 ?auto_2002296 ?auto_2002298 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2002306 - SURFACE
      ?auto_2002307 - SURFACE
      ?auto_2002308 - SURFACE
      ?auto_2002310 - SURFACE
      ?auto_2002309 - SURFACE
      ?auto_2002311 - SURFACE
      ?auto_2002312 - SURFACE
    )
    :vars
    (
      ?auto_2002315 - HOIST
      ?auto_2002319 - PLACE
      ?auto_2002314 - PLACE
      ?auto_2002313 - HOIST
      ?auto_2002316 - SURFACE
      ?auto_2002317 - SURFACE
      ?auto_2002318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002315 ?auto_2002319 ) ( IS-CRATE ?auto_2002312 ) ( not ( = ?auto_2002311 ?auto_2002312 ) ) ( not ( = ?auto_2002309 ?auto_2002311 ) ) ( not ( = ?auto_2002309 ?auto_2002312 ) ) ( not ( = ?auto_2002314 ?auto_2002319 ) ) ( HOIST-AT ?auto_2002313 ?auto_2002314 ) ( not ( = ?auto_2002315 ?auto_2002313 ) ) ( SURFACE-AT ?auto_2002312 ?auto_2002314 ) ( ON ?auto_2002312 ?auto_2002316 ) ( CLEAR ?auto_2002312 ) ( not ( = ?auto_2002311 ?auto_2002316 ) ) ( not ( = ?auto_2002312 ?auto_2002316 ) ) ( not ( = ?auto_2002309 ?auto_2002316 ) ) ( IS-CRATE ?auto_2002311 ) ( AVAILABLE ?auto_2002313 ) ( SURFACE-AT ?auto_2002311 ?auto_2002314 ) ( ON ?auto_2002311 ?auto_2002317 ) ( CLEAR ?auto_2002311 ) ( not ( = ?auto_2002311 ?auto_2002317 ) ) ( not ( = ?auto_2002312 ?auto_2002317 ) ) ( not ( = ?auto_2002309 ?auto_2002317 ) ) ( not ( = ?auto_2002316 ?auto_2002317 ) ) ( TRUCK-AT ?auto_2002318 ?auto_2002319 ) ( SURFACE-AT ?auto_2002310 ?auto_2002319 ) ( CLEAR ?auto_2002310 ) ( LIFTING ?auto_2002315 ?auto_2002309 ) ( IS-CRATE ?auto_2002309 ) ( not ( = ?auto_2002310 ?auto_2002309 ) ) ( not ( = ?auto_2002311 ?auto_2002310 ) ) ( not ( = ?auto_2002312 ?auto_2002310 ) ) ( not ( = ?auto_2002316 ?auto_2002310 ) ) ( not ( = ?auto_2002317 ?auto_2002310 ) ) ( ON ?auto_2002307 ?auto_2002306 ) ( ON ?auto_2002308 ?auto_2002307 ) ( ON ?auto_2002310 ?auto_2002308 ) ( not ( = ?auto_2002306 ?auto_2002307 ) ) ( not ( = ?auto_2002306 ?auto_2002308 ) ) ( not ( = ?auto_2002306 ?auto_2002310 ) ) ( not ( = ?auto_2002306 ?auto_2002309 ) ) ( not ( = ?auto_2002306 ?auto_2002311 ) ) ( not ( = ?auto_2002306 ?auto_2002312 ) ) ( not ( = ?auto_2002306 ?auto_2002316 ) ) ( not ( = ?auto_2002306 ?auto_2002317 ) ) ( not ( = ?auto_2002307 ?auto_2002308 ) ) ( not ( = ?auto_2002307 ?auto_2002310 ) ) ( not ( = ?auto_2002307 ?auto_2002309 ) ) ( not ( = ?auto_2002307 ?auto_2002311 ) ) ( not ( = ?auto_2002307 ?auto_2002312 ) ) ( not ( = ?auto_2002307 ?auto_2002316 ) ) ( not ( = ?auto_2002307 ?auto_2002317 ) ) ( not ( = ?auto_2002308 ?auto_2002310 ) ) ( not ( = ?auto_2002308 ?auto_2002309 ) ) ( not ( = ?auto_2002308 ?auto_2002311 ) ) ( not ( = ?auto_2002308 ?auto_2002312 ) ) ( not ( = ?auto_2002308 ?auto_2002316 ) ) ( not ( = ?auto_2002308 ?auto_2002317 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002309 ?auto_2002311 ?auto_2002312 )
      ( MAKE-6CRATE-VERIFY ?auto_2002306 ?auto_2002307 ?auto_2002308 ?auto_2002310 ?auto_2002309 ?auto_2002311 ?auto_2002312 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2002320 - SURFACE
      ?auto_2002321 - SURFACE
      ?auto_2002322 - SURFACE
      ?auto_2002324 - SURFACE
      ?auto_2002323 - SURFACE
      ?auto_2002325 - SURFACE
      ?auto_2002326 - SURFACE
      ?auto_2002327 - SURFACE
    )
    :vars
    (
      ?auto_2002330 - HOIST
      ?auto_2002334 - PLACE
      ?auto_2002329 - PLACE
      ?auto_2002328 - HOIST
      ?auto_2002331 - SURFACE
      ?auto_2002332 - SURFACE
      ?auto_2002333 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002330 ?auto_2002334 ) ( IS-CRATE ?auto_2002327 ) ( not ( = ?auto_2002326 ?auto_2002327 ) ) ( not ( = ?auto_2002325 ?auto_2002326 ) ) ( not ( = ?auto_2002325 ?auto_2002327 ) ) ( not ( = ?auto_2002329 ?auto_2002334 ) ) ( HOIST-AT ?auto_2002328 ?auto_2002329 ) ( not ( = ?auto_2002330 ?auto_2002328 ) ) ( SURFACE-AT ?auto_2002327 ?auto_2002329 ) ( ON ?auto_2002327 ?auto_2002331 ) ( CLEAR ?auto_2002327 ) ( not ( = ?auto_2002326 ?auto_2002331 ) ) ( not ( = ?auto_2002327 ?auto_2002331 ) ) ( not ( = ?auto_2002325 ?auto_2002331 ) ) ( IS-CRATE ?auto_2002326 ) ( AVAILABLE ?auto_2002328 ) ( SURFACE-AT ?auto_2002326 ?auto_2002329 ) ( ON ?auto_2002326 ?auto_2002332 ) ( CLEAR ?auto_2002326 ) ( not ( = ?auto_2002326 ?auto_2002332 ) ) ( not ( = ?auto_2002327 ?auto_2002332 ) ) ( not ( = ?auto_2002325 ?auto_2002332 ) ) ( not ( = ?auto_2002331 ?auto_2002332 ) ) ( TRUCK-AT ?auto_2002333 ?auto_2002334 ) ( SURFACE-AT ?auto_2002323 ?auto_2002334 ) ( CLEAR ?auto_2002323 ) ( LIFTING ?auto_2002330 ?auto_2002325 ) ( IS-CRATE ?auto_2002325 ) ( not ( = ?auto_2002323 ?auto_2002325 ) ) ( not ( = ?auto_2002326 ?auto_2002323 ) ) ( not ( = ?auto_2002327 ?auto_2002323 ) ) ( not ( = ?auto_2002331 ?auto_2002323 ) ) ( not ( = ?auto_2002332 ?auto_2002323 ) ) ( ON ?auto_2002321 ?auto_2002320 ) ( ON ?auto_2002322 ?auto_2002321 ) ( ON ?auto_2002324 ?auto_2002322 ) ( ON ?auto_2002323 ?auto_2002324 ) ( not ( = ?auto_2002320 ?auto_2002321 ) ) ( not ( = ?auto_2002320 ?auto_2002322 ) ) ( not ( = ?auto_2002320 ?auto_2002324 ) ) ( not ( = ?auto_2002320 ?auto_2002323 ) ) ( not ( = ?auto_2002320 ?auto_2002325 ) ) ( not ( = ?auto_2002320 ?auto_2002326 ) ) ( not ( = ?auto_2002320 ?auto_2002327 ) ) ( not ( = ?auto_2002320 ?auto_2002331 ) ) ( not ( = ?auto_2002320 ?auto_2002332 ) ) ( not ( = ?auto_2002321 ?auto_2002322 ) ) ( not ( = ?auto_2002321 ?auto_2002324 ) ) ( not ( = ?auto_2002321 ?auto_2002323 ) ) ( not ( = ?auto_2002321 ?auto_2002325 ) ) ( not ( = ?auto_2002321 ?auto_2002326 ) ) ( not ( = ?auto_2002321 ?auto_2002327 ) ) ( not ( = ?auto_2002321 ?auto_2002331 ) ) ( not ( = ?auto_2002321 ?auto_2002332 ) ) ( not ( = ?auto_2002322 ?auto_2002324 ) ) ( not ( = ?auto_2002322 ?auto_2002323 ) ) ( not ( = ?auto_2002322 ?auto_2002325 ) ) ( not ( = ?auto_2002322 ?auto_2002326 ) ) ( not ( = ?auto_2002322 ?auto_2002327 ) ) ( not ( = ?auto_2002322 ?auto_2002331 ) ) ( not ( = ?auto_2002322 ?auto_2002332 ) ) ( not ( = ?auto_2002324 ?auto_2002323 ) ) ( not ( = ?auto_2002324 ?auto_2002325 ) ) ( not ( = ?auto_2002324 ?auto_2002326 ) ) ( not ( = ?auto_2002324 ?auto_2002327 ) ) ( not ( = ?auto_2002324 ?auto_2002331 ) ) ( not ( = ?auto_2002324 ?auto_2002332 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002325 ?auto_2002326 ?auto_2002327 )
      ( MAKE-7CRATE-VERIFY ?auto_2002320 ?auto_2002321 ?auto_2002322 ?auto_2002324 ?auto_2002323 ?auto_2002325 ?auto_2002326 ?auto_2002327 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2002335 - SURFACE
      ?auto_2002336 - SURFACE
      ?auto_2002337 - SURFACE
      ?auto_2002339 - SURFACE
      ?auto_2002338 - SURFACE
      ?auto_2002340 - SURFACE
      ?auto_2002341 - SURFACE
      ?auto_2002342 - SURFACE
      ?auto_2002343 - SURFACE
    )
    :vars
    (
      ?auto_2002346 - HOIST
      ?auto_2002350 - PLACE
      ?auto_2002345 - PLACE
      ?auto_2002344 - HOIST
      ?auto_2002347 - SURFACE
      ?auto_2002348 - SURFACE
      ?auto_2002349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002346 ?auto_2002350 ) ( IS-CRATE ?auto_2002343 ) ( not ( = ?auto_2002342 ?auto_2002343 ) ) ( not ( = ?auto_2002341 ?auto_2002342 ) ) ( not ( = ?auto_2002341 ?auto_2002343 ) ) ( not ( = ?auto_2002345 ?auto_2002350 ) ) ( HOIST-AT ?auto_2002344 ?auto_2002345 ) ( not ( = ?auto_2002346 ?auto_2002344 ) ) ( SURFACE-AT ?auto_2002343 ?auto_2002345 ) ( ON ?auto_2002343 ?auto_2002347 ) ( CLEAR ?auto_2002343 ) ( not ( = ?auto_2002342 ?auto_2002347 ) ) ( not ( = ?auto_2002343 ?auto_2002347 ) ) ( not ( = ?auto_2002341 ?auto_2002347 ) ) ( IS-CRATE ?auto_2002342 ) ( AVAILABLE ?auto_2002344 ) ( SURFACE-AT ?auto_2002342 ?auto_2002345 ) ( ON ?auto_2002342 ?auto_2002348 ) ( CLEAR ?auto_2002342 ) ( not ( = ?auto_2002342 ?auto_2002348 ) ) ( not ( = ?auto_2002343 ?auto_2002348 ) ) ( not ( = ?auto_2002341 ?auto_2002348 ) ) ( not ( = ?auto_2002347 ?auto_2002348 ) ) ( TRUCK-AT ?auto_2002349 ?auto_2002350 ) ( SURFACE-AT ?auto_2002340 ?auto_2002350 ) ( CLEAR ?auto_2002340 ) ( LIFTING ?auto_2002346 ?auto_2002341 ) ( IS-CRATE ?auto_2002341 ) ( not ( = ?auto_2002340 ?auto_2002341 ) ) ( not ( = ?auto_2002342 ?auto_2002340 ) ) ( not ( = ?auto_2002343 ?auto_2002340 ) ) ( not ( = ?auto_2002347 ?auto_2002340 ) ) ( not ( = ?auto_2002348 ?auto_2002340 ) ) ( ON ?auto_2002336 ?auto_2002335 ) ( ON ?auto_2002337 ?auto_2002336 ) ( ON ?auto_2002339 ?auto_2002337 ) ( ON ?auto_2002338 ?auto_2002339 ) ( ON ?auto_2002340 ?auto_2002338 ) ( not ( = ?auto_2002335 ?auto_2002336 ) ) ( not ( = ?auto_2002335 ?auto_2002337 ) ) ( not ( = ?auto_2002335 ?auto_2002339 ) ) ( not ( = ?auto_2002335 ?auto_2002338 ) ) ( not ( = ?auto_2002335 ?auto_2002340 ) ) ( not ( = ?auto_2002335 ?auto_2002341 ) ) ( not ( = ?auto_2002335 ?auto_2002342 ) ) ( not ( = ?auto_2002335 ?auto_2002343 ) ) ( not ( = ?auto_2002335 ?auto_2002347 ) ) ( not ( = ?auto_2002335 ?auto_2002348 ) ) ( not ( = ?auto_2002336 ?auto_2002337 ) ) ( not ( = ?auto_2002336 ?auto_2002339 ) ) ( not ( = ?auto_2002336 ?auto_2002338 ) ) ( not ( = ?auto_2002336 ?auto_2002340 ) ) ( not ( = ?auto_2002336 ?auto_2002341 ) ) ( not ( = ?auto_2002336 ?auto_2002342 ) ) ( not ( = ?auto_2002336 ?auto_2002343 ) ) ( not ( = ?auto_2002336 ?auto_2002347 ) ) ( not ( = ?auto_2002336 ?auto_2002348 ) ) ( not ( = ?auto_2002337 ?auto_2002339 ) ) ( not ( = ?auto_2002337 ?auto_2002338 ) ) ( not ( = ?auto_2002337 ?auto_2002340 ) ) ( not ( = ?auto_2002337 ?auto_2002341 ) ) ( not ( = ?auto_2002337 ?auto_2002342 ) ) ( not ( = ?auto_2002337 ?auto_2002343 ) ) ( not ( = ?auto_2002337 ?auto_2002347 ) ) ( not ( = ?auto_2002337 ?auto_2002348 ) ) ( not ( = ?auto_2002339 ?auto_2002338 ) ) ( not ( = ?auto_2002339 ?auto_2002340 ) ) ( not ( = ?auto_2002339 ?auto_2002341 ) ) ( not ( = ?auto_2002339 ?auto_2002342 ) ) ( not ( = ?auto_2002339 ?auto_2002343 ) ) ( not ( = ?auto_2002339 ?auto_2002347 ) ) ( not ( = ?auto_2002339 ?auto_2002348 ) ) ( not ( = ?auto_2002338 ?auto_2002340 ) ) ( not ( = ?auto_2002338 ?auto_2002341 ) ) ( not ( = ?auto_2002338 ?auto_2002342 ) ) ( not ( = ?auto_2002338 ?auto_2002343 ) ) ( not ( = ?auto_2002338 ?auto_2002347 ) ) ( not ( = ?auto_2002338 ?auto_2002348 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002341 ?auto_2002342 ?auto_2002343 )
      ( MAKE-8CRATE-VERIFY ?auto_2002335 ?auto_2002336 ?auto_2002337 ?auto_2002339 ?auto_2002338 ?auto_2002340 ?auto_2002341 ?auto_2002342 ?auto_2002343 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2002351 - SURFACE
      ?auto_2002352 - SURFACE
      ?auto_2002353 - SURFACE
      ?auto_2002355 - SURFACE
      ?auto_2002354 - SURFACE
      ?auto_2002356 - SURFACE
      ?auto_2002357 - SURFACE
      ?auto_2002358 - SURFACE
      ?auto_2002359 - SURFACE
      ?auto_2002360 - SURFACE
    )
    :vars
    (
      ?auto_2002363 - HOIST
      ?auto_2002367 - PLACE
      ?auto_2002362 - PLACE
      ?auto_2002361 - HOIST
      ?auto_2002364 - SURFACE
      ?auto_2002365 - SURFACE
      ?auto_2002366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002363 ?auto_2002367 ) ( IS-CRATE ?auto_2002360 ) ( not ( = ?auto_2002359 ?auto_2002360 ) ) ( not ( = ?auto_2002358 ?auto_2002359 ) ) ( not ( = ?auto_2002358 ?auto_2002360 ) ) ( not ( = ?auto_2002362 ?auto_2002367 ) ) ( HOIST-AT ?auto_2002361 ?auto_2002362 ) ( not ( = ?auto_2002363 ?auto_2002361 ) ) ( SURFACE-AT ?auto_2002360 ?auto_2002362 ) ( ON ?auto_2002360 ?auto_2002364 ) ( CLEAR ?auto_2002360 ) ( not ( = ?auto_2002359 ?auto_2002364 ) ) ( not ( = ?auto_2002360 ?auto_2002364 ) ) ( not ( = ?auto_2002358 ?auto_2002364 ) ) ( IS-CRATE ?auto_2002359 ) ( AVAILABLE ?auto_2002361 ) ( SURFACE-AT ?auto_2002359 ?auto_2002362 ) ( ON ?auto_2002359 ?auto_2002365 ) ( CLEAR ?auto_2002359 ) ( not ( = ?auto_2002359 ?auto_2002365 ) ) ( not ( = ?auto_2002360 ?auto_2002365 ) ) ( not ( = ?auto_2002358 ?auto_2002365 ) ) ( not ( = ?auto_2002364 ?auto_2002365 ) ) ( TRUCK-AT ?auto_2002366 ?auto_2002367 ) ( SURFACE-AT ?auto_2002357 ?auto_2002367 ) ( CLEAR ?auto_2002357 ) ( LIFTING ?auto_2002363 ?auto_2002358 ) ( IS-CRATE ?auto_2002358 ) ( not ( = ?auto_2002357 ?auto_2002358 ) ) ( not ( = ?auto_2002359 ?auto_2002357 ) ) ( not ( = ?auto_2002360 ?auto_2002357 ) ) ( not ( = ?auto_2002364 ?auto_2002357 ) ) ( not ( = ?auto_2002365 ?auto_2002357 ) ) ( ON ?auto_2002352 ?auto_2002351 ) ( ON ?auto_2002353 ?auto_2002352 ) ( ON ?auto_2002355 ?auto_2002353 ) ( ON ?auto_2002354 ?auto_2002355 ) ( ON ?auto_2002356 ?auto_2002354 ) ( ON ?auto_2002357 ?auto_2002356 ) ( not ( = ?auto_2002351 ?auto_2002352 ) ) ( not ( = ?auto_2002351 ?auto_2002353 ) ) ( not ( = ?auto_2002351 ?auto_2002355 ) ) ( not ( = ?auto_2002351 ?auto_2002354 ) ) ( not ( = ?auto_2002351 ?auto_2002356 ) ) ( not ( = ?auto_2002351 ?auto_2002357 ) ) ( not ( = ?auto_2002351 ?auto_2002358 ) ) ( not ( = ?auto_2002351 ?auto_2002359 ) ) ( not ( = ?auto_2002351 ?auto_2002360 ) ) ( not ( = ?auto_2002351 ?auto_2002364 ) ) ( not ( = ?auto_2002351 ?auto_2002365 ) ) ( not ( = ?auto_2002352 ?auto_2002353 ) ) ( not ( = ?auto_2002352 ?auto_2002355 ) ) ( not ( = ?auto_2002352 ?auto_2002354 ) ) ( not ( = ?auto_2002352 ?auto_2002356 ) ) ( not ( = ?auto_2002352 ?auto_2002357 ) ) ( not ( = ?auto_2002352 ?auto_2002358 ) ) ( not ( = ?auto_2002352 ?auto_2002359 ) ) ( not ( = ?auto_2002352 ?auto_2002360 ) ) ( not ( = ?auto_2002352 ?auto_2002364 ) ) ( not ( = ?auto_2002352 ?auto_2002365 ) ) ( not ( = ?auto_2002353 ?auto_2002355 ) ) ( not ( = ?auto_2002353 ?auto_2002354 ) ) ( not ( = ?auto_2002353 ?auto_2002356 ) ) ( not ( = ?auto_2002353 ?auto_2002357 ) ) ( not ( = ?auto_2002353 ?auto_2002358 ) ) ( not ( = ?auto_2002353 ?auto_2002359 ) ) ( not ( = ?auto_2002353 ?auto_2002360 ) ) ( not ( = ?auto_2002353 ?auto_2002364 ) ) ( not ( = ?auto_2002353 ?auto_2002365 ) ) ( not ( = ?auto_2002355 ?auto_2002354 ) ) ( not ( = ?auto_2002355 ?auto_2002356 ) ) ( not ( = ?auto_2002355 ?auto_2002357 ) ) ( not ( = ?auto_2002355 ?auto_2002358 ) ) ( not ( = ?auto_2002355 ?auto_2002359 ) ) ( not ( = ?auto_2002355 ?auto_2002360 ) ) ( not ( = ?auto_2002355 ?auto_2002364 ) ) ( not ( = ?auto_2002355 ?auto_2002365 ) ) ( not ( = ?auto_2002354 ?auto_2002356 ) ) ( not ( = ?auto_2002354 ?auto_2002357 ) ) ( not ( = ?auto_2002354 ?auto_2002358 ) ) ( not ( = ?auto_2002354 ?auto_2002359 ) ) ( not ( = ?auto_2002354 ?auto_2002360 ) ) ( not ( = ?auto_2002354 ?auto_2002364 ) ) ( not ( = ?auto_2002354 ?auto_2002365 ) ) ( not ( = ?auto_2002356 ?auto_2002357 ) ) ( not ( = ?auto_2002356 ?auto_2002358 ) ) ( not ( = ?auto_2002356 ?auto_2002359 ) ) ( not ( = ?auto_2002356 ?auto_2002360 ) ) ( not ( = ?auto_2002356 ?auto_2002364 ) ) ( not ( = ?auto_2002356 ?auto_2002365 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002358 ?auto_2002359 ?auto_2002360 )
      ( MAKE-9CRATE-VERIFY ?auto_2002351 ?auto_2002352 ?auto_2002353 ?auto_2002355 ?auto_2002354 ?auto_2002356 ?auto_2002357 ?auto_2002358 ?auto_2002359 ?auto_2002360 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2002368 - SURFACE
      ?auto_2002369 - SURFACE
      ?auto_2002370 - SURFACE
      ?auto_2002372 - SURFACE
      ?auto_2002371 - SURFACE
      ?auto_2002373 - SURFACE
      ?auto_2002374 - SURFACE
      ?auto_2002375 - SURFACE
      ?auto_2002376 - SURFACE
      ?auto_2002377 - SURFACE
      ?auto_2002378 - SURFACE
    )
    :vars
    (
      ?auto_2002381 - HOIST
      ?auto_2002385 - PLACE
      ?auto_2002380 - PLACE
      ?auto_2002379 - HOIST
      ?auto_2002382 - SURFACE
      ?auto_2002383 - SURFACE
      ?auto_2002384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002381 ?auto_2002385 ) ( IS-CRATE ?auto_2002378 ) ( not ( = ?auto_2002377 ?auto_2002378 ) ) ( not ( = ?auto_2002376 ?auto_2002377 ) ) ( not ( = ?auto_2002376 ?auto_2002378 ) ) ( not ( = ?auto_2002380 ?auto_2002385 ) ) ( HOIST-AT ?auto_2002379 ?auto_2002380 ) ( not ( = ?auto_2002381 ?auto_2002379 ) ) ( SURFACE-AT ?auto_2002378 ?auto_2002380 ) ( ON ?auto_2002378 ?auto_2002382 ) ( CLEAR ?auto_2002378 ) ( not ( = ?auto_2002377 ?auto_2002382 ) ) ( not ( = ?auto_2002378 ?auto_2002382 ) ) ( not ( = ?auto_2002376 ?auto_2002382 ) ) ( IS-CRATE ?auto_2002377 ) ( AVAILABLE ?auto_2002379 ) ( SURFACE-AT ?auto_2002377 ?auto_2002380 ) ( ON ?auto_2002377 ?auto_2002383 ) ( CLEAR ?auto_2002377 ) ( not ( = ?auto_2002377 ?auto_2002383 ) ) ( not ( = ?auto_2002378 ?auto_2002383 ) ) ( not ( = ?auto_2002376 ?auto_2002383 ) ) ( not ( = ?auto_2002382 ?auto_2002383 ) ) ( TRUCK-AT ?auto_2002384 ?auto_2002385 ) ( SURFACE-AT ?auto_2002375 ?auto_2002385 ) ( CLEAR ?auto_2002375 ) ( LIFTING ?auto_2002381 ?auto_2002376 ) ( IS-CRATE ?auto_2002376 ) ( not ( = ?auto_2002375 ?auto_2002376 ) ) ( not ( = ?auto_2002377 ?auto_2002375 ) ) ( not ( = ?auto_2002378 ?auto_2002375 ) ) ( not ( = ?auto_2002382 ?auto_2002375 ) ) ( not ( = ?auto_2002383 ?auto_2002375 ) ) ( ON ?auto_2002369 ?auto_2002368 ) ( ON ?auto_2002370 ?auto_2002369 ) ( ON ?auto_2002372 ?auto_2002370 ) ( ON ?auto_2002371 ?auto_2002372 ) ( ON ?auto_2002373 ?auto_2002371 ) ( ON ?auto_2002374 ?auto_2002373 ) ( ON ?auto_2002375 ?auto_2002374 ) ( not ( = ?auto_2002368 ?auto_2002369 ) ) ( not ( = ?auto_2002368 ?auto_2002370 ) ) ( not ( = ?auto_2002368 ?auto_2002372 ) ) ( not ( = ?auto_2002368 ?auto_2002371 ) ) ( not ( = ?auto_2002368 ?auto_2002373 ) ) ( not ( = ?auto_2002368 ?auto_2002374 ) ) ( not ( = ?auto_2002368 ?auto_2002375 ) ) ( not ( = ?auto_2002368 ?auto_2002376 ) ) ( not ( = ?auto_2002368 ?auto_2002377 ) ) ( not ( = ?auto_2002368 ?auto_2002378 ) ) ( not ( = ?auto_2002368 ?auto_2002382 ) ) ( not ( = ?auto_2002368 ?auto_2002383 ) ) ( not ( = ?auto_2002369 ?auto_2002370 ) ) ( not ( = ?auto_2002369 ?auto_2002372 ) ) ( not ( = ?auto_2002369 ?auto_2002371 ) ) ( not ( = ?auto_2002369 ?auto_2002373 ) ) ( not ( = ?auto_2002369 ?auto_2002374 ) ) ( not ( = ?auto_2002369 ?auto_2002375 ) ) ( not ( = ?auto_2002369 ?auto_2002376 ) ) ( not ( = ?auto_2002369 ?auto_2002377 ) ) ( not ( = ?auto_2002369 ?auto_2002378 ) ) ( not ( = ?auto_2002369 ?auto_2002382 ) ) ( not ( = ?auto_2002369 ?auto_2002383 ) ) ( not ( = ?auto_2002370 ?auto_2002372 ) ) ( not ( = ?auto_2002370 ?auto_2002371 ) ) ( not ( = ?auto_2002370 ?auto_2002373 ) ) ( not ( = ?auto_2002370 ?auto_2002374 ) ) ( not ( = ?auto_2002370 ?auto_2002375 ) ) ( not ( = ?auto_2002370 ?auto_2002376 ) ) ( not ( = ?auto_2002370 ?auto_2002377 ) ) ( not ( = ?auto_2002370 ?auto_2002378 ) ) ( not ( = ?auto_2002370 ?auto_2002382 ) ) ( not ( = ?auto_2002370 ?auto_2002383 ) ) ( not ( = ?auto_2002372 ?auto_2002371 ) ) ( not ( = ?auto_2002372 ?auto_2002373 ) ) ( not ( = ?auto_2002372 ?auto_2002374 ) ) ( not ( = ?auto_2002372 ?auto_2002375 ) ) ( not ( = ?auto_2002372 ?auto_2002376 ) ) ( not ( = ?auto_2002372 ?auto_2002377 ) ) ( not ( = ?auto_2002372 ?auto_2002378 ) ) ( not ( = ?auto_2002372 ?auto_2002382 ) ) ( not ( = ?auto_2002372 ?auto_2002383 ) ) ( not ( = ?auto_2002371 ?auto_2002373 ) ) ( not ( = ?auto_2002371 ?auto_2002374 ) ) ( not ( = ?auto_2002371 ?auto_2002375 ) ) ( not ( = ?auto_2002371 ?auto_2002376 ) ) ( not ( = ?auto_2002371 ?auto_2002377 ) ) ( not ( = ?auto_2002371 ?auto_2002378 ) ) ( not ( = ?auto_2002371 ?auto_2002382 ) ) ( not ( = ?auto_2002371 ?auto_2002383 ) ) ( not ( = ?auto_2002373 ?auto_2002374 ) ) ( not ( = ?auto_2002373 ?auto_2002375 ) ) ( not ( = ?auto_2002373 ?auto_2002376 ) ) ( not ( = ?auto_2002373 ?auto_2002377 ) ) ( not ( = ?auto_2002373 ?auto_2002378 ) ) ( not ( = ?auto_2002373 ?auto_2002382 ) ) ( not ( = ?auto_2002373 ?auto_2002383 ) ) ( not ( = ?auto_2002374 ?auto_2002375 ) ) ( not ( = ?auto_2002374 ?auto_2002376 ) ) ( not ( = ?auto_2002374 ?auto_2002377 ) ) ( not ( = ?auto_2002374 ?auto_2002378 ) ) ( not ( = ?auto_2002374 ?auto_2002382 ) ) ( not ( = ?auto_2002374 ?auto_2002383 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002376 ?auto_2002377 ?auto_2002378 )
      ( MAKE-10CRATE-VERIFY ?auto_2002368 ?auto_2002369 ?auto_2002370 ?auto_2002372 ?auto_2002371 ?auto_2002373 ?auto_2002374 ?auto_2002375 ?auto_2002376 ?auto_2002377 ?auto_2002378 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2002386 - SURFACE
      ?auto_2002387 - SURFACE
      ?auto_2002388 - SURFACE
      ?auto_2002390 - SURFACE
      ?auto_2002389 - SURFACE
      ?auto_2002391 - SURFACE
      ?auto_2002392 - SURFACE
      ?auto_2002393 - SURFACE
      ?auto_2002394 - SURFACE
      ?auto_2002395 - SURFACE
      ?auto_2002396 - SURFACE
      ?auto_2002397 - SURFACE
    )
    :vars
    (
      ?auto_2002400 - HOIST
      ?auto_2002404 - PLACE
      ?auto_2002399 - PLACE
      ?auto_2002398 - HOIST
      ?auto_2002401 - SURFACE
      ?auto_2002402 - SURFACE
      ?auto_2002403 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002400 ?auto_2002404 ) ( IS-CRATE ?auto_2002397 ) ( not ( = ?auto_2002396 ?auto_2002397 ) ) ( not ( = ?auto_2002395 ?auto_2002396 ) ) ( not ( = ?auto_2002395 ?auto_2002397 ) ) ( not ( = ?auto_2002399 ?auto_2002404 ) ) ( HOIST-AT ?auto_2002398 ?auto_2002399 ) ( not ( = ?auto_2002400 ?auto_2002398 ) ) ( SURFACE-AT ?auto_2002397 ?auto_2002399 ) ( ON ?auto_2002397 ?auto_2002401 ) ( CLEAR ?auto_2002397 ) ( not ( = ?auto_2002396 ?auto_2002401 ) ) ( not ( = ?auto_2002397 ?auto_2002401 ) ) ( not ( = ?auto_2002395 ?auto_2002401 ) ) ( IS-CRATE ?auto_2002396 ) ( AVAILABLE ?auto_2002398 ) ( SURFACE-AT ?auto_2002396 ?auto_2002399 ) ( ON ?auto_2002396 ?auto_2002402 ) ( CLEAR ?auto_2002396 ) ( not ( = ?auto_2002396 ?auto_2002402 ) ) ( not ( = ?auto_2002397 ?auto_2002402 ) ) ( not ( = ?auto_2002395 ?auto_2002402 ) ) ( not ( = ?auto_2002401 ?auto_2002402 ) ) ( TRUCK-AT ?auto_2002403 ?auto_2002404 ) ( SURFACE-AT ?auto_2002394 ?auto_2002404 ) ( CLEAR ?auto_2002394 ) ( LIFTING ?auto_2002400 ?auto_2002395 ) ( IS-CRATE ?auto_2002395 ) ( not ( = ?auto_2002394 ?auto_2002395 ) ) ( not ( = ?auto_2002396 ?auto_2002394 ) ) ( not ( = ?auto_2002397 ?auto_2002394 ) ) ( not ( = ?auto_2002401 ?auto_2002394 ) ) ( not ( = ?auto_2002402 ?auto_2002394 ) ) ( ON ?auto_2002387 ?auto_2002386 ) ( ON ?auto_2002388 ?auto_2002387 ) ( ON ?auto_2002390 ?auto_2002388 ) ( ON ?auto_2002389 ?auto_2002390 ) ( ON ?auto_2002391 ?auto_2002389 ) ( ON ?auto_2002392 ?auto_2002391 ) ( ON ?auto_2002393 ?auto_2002392 ) ( ON ?auto_2002394 ?auto_2002393 ) ( not ( = ?auto_2002386 ?auto_2002387 ) ) ( not ( = ?auto_2002386 ?auto_2002388 ) ) ( not ( = ?auto_2002386 ?auto_2002390 ) ) ( not ( = ?auto_2002386 ?auto_2002389 ) ) ( not ( = ?auto_2002386 ?auto_2002391 ) ) ( not ( = ?auto_2002386 ?auto_2002392 ) ) ( not ( = ?auto_2002386 ?auto_2002393 ) ) ( not ( = ?auto_2002386 ?auto_2002394 ) ) ( not ( = ?auto_2002386 ?auto_2002395 ) ) ( not ( = ?auto_2002386 ?auto_2002396 ) ) ( not ( = ?auto_2002386 ?auto_2002397 ) ) ( not ( = ?auto_2002386 ?auto_2002401 ) ) ( not ( = ?auto_2002386 ?auto_2002402 ) ) ( not ( = ?auto_2002387 ?auto_2002388 ) ) ( not ( = ?auto_2002387 ?auto_2002390 ) ) ( not ( = ?auto_2002387 ?auto_2002389 ) ) ( not ( = ?auto_2002387 ?auto_2002391 ) ) ( not ( = ?auto_2002387 ?auto_2002392 ) ) ( not ( = ?auto_2002387 ?auto_2002393 ) ) ( not ( = ?auto_2002387 ?auto_2002394 ) ) ( not ( = ?auto_2002387 ?auto_2002395 ) ) ( not ( = ?auto_2002387 ?auto_2002396 ) ) ( not ( = ?auto_2002387 ?auto_2002397 ) ) ( not ( = ?auto_2002387 ?auto_2002401 ) ) ( not ( = ?auto_2002387 ?auto_2002402 ) ) ( not ( = ?auto_2002388 ?auto_2002390 ) ) ( not ( = ?auto_2002388 ?auto_2002389 ) ) ( not ( = ?auto_2002388 ?auto_2002391 ) ) ( not ( = ?auto_2002388 ?auto_2002392 ) ) ( not ( = ?auto_2002388 ?auto_2002393 ) ) ( not ( = ?auto_2002388 ?auto_2002394 ) ) ( not ( = ?auto_2002388 ?auto_2002395 ) ) ( not ( = ?auto_2002388 ?auto_2002396 ) ) ( not ( = ?auto_2002388 ?auto_2002397 ) ) ( not ( = ?auto_2002388 ?auto_2002401 ) ) ( not ( = ?auto_2002388 ?auto_2002402 ) ) ( not ( = ?auto_2002390 ?auto_2002389 ) ) ( not ( = ?auto_2002390 ?auto_2002391 ) ) ( not ( = ?auto_2002390 ?auto_2002392 ) ) ( not ( = ?auto_2002390 ?auto_2002393 ) ) ( not ( = ?auto_2002390 ?auto_2002394 ) ) ( not ( = ?auto_2002390 ?auto_2002395 ) ) ( not ( = ?auto_2002390 ?auto_2002396 ) ) ( not ( = ?auto_2002390 ?auto_2002397 ) ) ( not ( = ?auto_2002390 ?auto_2002401 ) ) ( not ( = ?auto_2002390 ?auto_2002402 ) ) ( not ( = ?auto_2002389 ?auto_2002391 ) ) ( not ( = ?auto_2002389 ?auto_2002392 ) ) ( not ( = ?auto_2002389 ?auto_2002393 ) ) ( not ( = ?auto_2002389 ?auto_2002394 ) ) ( not ( = ?auto_2002389 ?auto_2002395 ) ) ( not ( = ?auto_2002389 ?auto_2002396 ) ) ( not ( = ?auto_2002389 ?auto_2002397 ) ) ( not ( = ?auto_2002389 ?auto_2002401 ) ) ( not ( = ?auto_2002389 ?auto_2002402 ) ) ( not ( = ?auto_2002391 ?auto_2002392 ) ) ( not ( = ?auto_2002391 ?auto_2002393 ) ) ( not ( = ?auto_2002391 ?auto_2002394 ) ) ( not ( = ?auto_2002391 ?auto_2002395 ) ) ( not ( = ?auto_2002391 ?auto_2002396 ) ) ( not ( = ?auto_2002391 ?auto_2002397 ) ) ( not ( = ?auto_2002391 ?auto_2002401 ) ) ( not ( = ?auto_2002391 ?auto_2002402 ) ) ( not ( = ?auto_2002392 ?auto_2002393 ) ) ( not ( = ?auto_2002392 ?auto_2002394 ) ) ( not ( = ?auto_2002392 ?auto_2002395 ) ) ( not ( = ?auto_2002392 ?auto_2002396 ) ) ( not ( = ?auto_2002392 ?auto_2002397 ) ) ( not ( = ?auto_2002392 ?auto_2002401 ) ) ( not ( = ?auto_2002392 ?auto_2002402 ) ) ( not ( = ?auto_2002393 ?auto_2002394 ) ) ( not ( = ?auto_2002393 ?auto_2002395 ) ) ( not ( = ?auto_2002393 ?auto_2002396 ) ) ( not ( = ?auto_2002393 ?auto_2002397 ) ) ( not ( = ?auto_2002393 ?auto_2002401 ) ) ( not ( = ?auto_2002393 ?auto_2002402 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002395 ?auto_2002396 ?auto_2002397 )
      ( MAKE-11CRATE-VERIFY ?auto_2002386 ?auto_2002387 ?auto_2002388 ?auto_2002390 ?auto_2002389 ?auto_2002391 ?auto_2002392 ?auto_2002393 ?auto_2002394 ?auto_2002395 ?auto_2002396 ?auto_2002397 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2002405 - SURFACE
      ?auto_2002406 - SURFACE
      ?auto_2002407 - SURFACE
      ?auto_2002409 - SURFACE
      ?auto_2002408 - SURFACE
      ?auto_2002410 - SURFACE
      ?auto_2002411 - SURFACE
      ?auto_2002412 - SURFACE
      ?auto_2002413 - SURFACE
      ?auto_2002414 - SURFACE
      ?auto_2002415 - SURFACE
      ?auto_2002416 - SURFACE
      ?auto_2002417 - SURFACE
    )
    :vars
    (
      ?auto_2002420 - HOIST
      ?auto_2002424 - PLACE
      ?auto_2002419 - PLACE
      ?auto_2002418 - HOIST
      ?auto_2002421 - SURFACE
      ?auto_2002422 - SURFACE
      ?auto_2002423 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002420 ?auto_2002424 ) ( IS-CRATE ?auto_2002417 ) ( not ( = ?auto_2002416 ?auto_2002417 ) ) ( not ( = ?auto_2002415 ?auto_2002416 ) ) ( not ( = ?auto_2002415 ?auto_2002417 ) ) ( not ( = ?auto_2002419 ?auto_2002424 ) ) ( HOIST-AT ?auto_2002418 ?auto_2002419 ) ( not ( = ?auto_2002420 ?auto_2002418 ) ) ( SURFACE-AT ?auto_2002417 ?auto_2002419 ) ( ON ?auto_2002417 ?auto_2002421 ) ( CLEAR ?auto_2002417 ) ( not ( = ?auto_2002416 ?auto_2002421 ) ) ( not ( = ?auto_2002417 ?auto_2002421 ) ) ( not ( = ?auto_2002415 ?auto_2002421 ) ) ( IS-CRATE ?auto_2002416 ) ( AVAILABLE ?auto_2002418 ) ( SURFACE-AT ?auto_2002416 ?auto_2002419 ) ( ON ?auto_2002416 ?auto_2002422 ) ( CLEAR ?auto_2002416 ) ( not ( = ?auto_2002416 ?auto_2002422 ) ) ( not ( = ?auto_2002417 ?auto_2002422 ) ) ( not ( = ?auto_2002415 ?auto_2002422 ) ) ( not ( = ?auto_2002421 ?auto_2002422 ) ) ( TRUCK-AT ?auto_2002423 ?auto_2002424 ) ( SURFACE-AT ?auto_2002414 ?auto_2002424 ) ( CLEAR ?auto_2002414 ) ( LIFTING ?auto_2002420 ?auto_2002415 ) ( IS-CRATE ?auto_2002415 ) ( not ( = ?auto_2002414 ?auto_2002415 ) ) ( not ( = ?auto_2002416 ?auto_2002414 ) ) ( not ( = ?auto_2002417 ?auto_2002414 ) ) ( not ( = ?auto_2002421 ?auto_2002414 ) ) ( not ( = ?auto_2002422 ?auto_2002414 ) ) ( ON ?auto_2002406 ?auto_2002405 ) ( ON ?auto_2002407 ?auto_2002406 ) ( ON ?auto_2002409 ?auto_2002407 ) ( ON ?auto_2002408 ?auto_2002409 ) ( ON ?auto_2002410 ?auto_2002408 ) ( ON ?auto_2002411 ?auto_2002410 ) ( ON ?auto_2002412 ?auto_2002411 ) ( ON ?auto_2002413 ?auto_2002412 ) ( ON ?auto_2002414 ?auto_2002413 ) ( not ( = ?auto_2002405 ?auto_2002406 ) ) ( not ( = ?auto_2002405 ?auto_2002407 ) ) ( not ( = ?auto_2002405 ?auto_2002409 ) ) ( not ( = ?auto_2002405 ?auto_2002408 ) ) ( not ( = ?auto_2002405 ?auto_2002410 ) ) ( not ( = ?auto_2002405 ?auto_2002411 ) ) ( not ( = ?auto_2002405 ?auto_2002412 ) ) ( not ( = ?auto_2002405 ?auto_2002413 ) ) ( not ( = ?auto_2002405 ?auto_2002414 ) ) ( not ( = ?auto_2002405 ?auto_2002415 ) ) ( not ( = ?auto_2002405 ?auto_2002416 ) ) ( not ( = ?auto_2002405 ?auto_2002417 ) ) ( not ( = ?auto_2002405 ?auto_2002421 ) ) ( not ( = ?auto_2002405 ?auto_2002422 ) ) ( not ( = ?auto_2002406 ?auto_2002407 ) ) ( not ( = ?auto_2002406 ?auto_2002409 ) ) ( not ( = ?auto_2002406 ?auto_2002408 ) ) ( not ( = ?auto_2002406 ?auto_2002410 ) ) ( not ( = ?auto_2002406 ?auto_2002411 ) ) ( not ( = ?auto_2002406 ?auto_2002412 ) ) ( not ( = ?auto_2002406 ?auto_2002413 ) ) ( not ( = ?auto_2002406 ?auto_2002414 ) ) ( not ( = ?auto_2002406 ?auto_2002415 ) ) ( not ( = ?auto_2002406 ?auto_2002416 ) ) ( not ( = ?auto_2002406 ?auto_2002417 ) ) ( not ( = ?auto_2002406 ?auto_2002421 ) ) ( not ( = ?auto_2002406 ?auto_2002422 ) ) ( not ( = ?auto_2002407 ?auto_2002409 ) ) ( not ( = ?auto_2002407 ?auto_2002408 ) ) ( not ( = ?auto_2002407 ?auto_2002410 ) ) ( not ( = ?auto_2002407 ?auto_2002411 ) ) ( not ( = ?auto_2002407 ?auto_2002412 ) ) ( not ( = ?auto_2002407 ?auto_2002413 ) ) ( not ( = ?auto_2002407 ?auto_2002414 ) ) ( not ( = ?auto_2002407 ?auto_2002415 ) ) ( not ( = ?auto_2002407 ?auto_2002416 ) ) ( not ( = ?auto_2002407 ?auto_2002417 ) ) ( not ( = ?auto_2002407 ?auto_2002421 ) ) ( not ( = ?auto_2002407 ?auto_2002422 ) ) ( not ( = ?auto_2002409 ?auto_2002408 ) ) ( not ( = ?auto_2002409 ?auto_2002410 ) ) ( not ( = ?auto_2002409 ?auto_2002411 ) ) ( not ( = ?auto_2002409 ?auto_2002412 ) ) ( not ( = ?auto_2002409 ?auto_2002413 ) ) ( not ( = ?auto_2002409 ?auto_2002414 ) ) ( not ( = ?auto_2002409 ?auto_2002415 ) ) ( not ( = ?auto_2002409 ?auto_2002416 ) ) ( not ( = ?auto_2002409 ?auto_2002417 ) ) ( not ( = ?auto_2002409 ?auto_2002421 ) ) ( not ( = ?auto_2002409 ?auto_2002422 ) ) ( not ( = ?auto_2002408 ?auto_2002410 ) ) ( not ( = ?auto_2002408 ?auto_2002411 ) ) ( not ( = ?auto_2002408 ?auto_2002412 ) ) ( not ( = ?auto_2002408 ?auto_2002413 ) ) ( not ( = ?auto_2002408 ?auto_2002414 ) ) ( not ( = ?auto_2002408 ?auto_2002415 ) ) ( not ( = ?auto_2002408 ?auto_2002416 ) ) ( not ( = ?auto_2002408 ?auto_2002417 ) ) ( not ( = ?auto_2002408 ?auto_2002421 ) ) ( not ( = ?auto_2002408 ?auto_2002422 ) ) ( not ( = ?auto_2002410 ?auto_2002411 ) ) ( not ( = ?auto_2002410 ?auto_2002412 ) ) ( not ( = ?auto_2002410 ?auto_2002413 ) ) ( not ( = ?auto_2002410 ?auto_2002414 ) ) ( not ( = ?auto_2002410 ?auto_2002415 ) ) ( not ( = ?auto_2002410 ?auto_2002416 ) ) ( not ( = ?auto_2002410 ?auto_2002417 ) ) ( not ( = ?auto_2002410 ?auto_2002421 ) ) ( not ( = ?auto_2002410 ?auto_2002422 ) ) ( not ( = ?auto_2002411 ?auto_2002412 ) ) ( not ( = ?auto_2002411 ?auto_2002413 ) ) ( not ( = ?auto_2002411 ?auto_2002414 ) ) ( not ( = ?auto_2002411 ?auto_2002415 ) ) ( not ( = ?auto_2002411 ?auto_2002416 ) ) ( not ( = ?auto_2002411 ?auto_2002417 ) ) ( not ( = ?auto_2002411 ?auto_2002421 ) ) ( not ( = ?auto_2002411 ?auto_2002422 ) ) ( not ( = ?auto_2002412 ?auto_2002413 ) ) ( not ( = ?auto_2002412 ?auto_2002414 ) ) ( not ( = ?auto_2002412 ?auto_2002415 ) ) ( not ( = ?auto_2002412 ?auto_2002416 ) ) ( not ( = ?auto_2002412 ?auto_2002417 ) ) ( not ( = ?auto_2002412 ?auto_2002421 ) ) ( not ( = ?auto_2002412 ?auto_2002422 ) ) ( not ( = ?auto_2002413 ?auto_2002414 ) ) ( not ( = ?auto_2002413 ?auto_2002415 ) ) ( not ( = ?auto_2002413 ?auto_2002416 ) ) ( not ( = ?auto_2002413 ?auto_2002417 ) ) ( not ( = ?auto_2002413 ?auto_2002421 ) ) ( not ( = ?auto_2002413 ?auto_2002422 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002415 ?auto_2002416 ?auto_2002417 )
      ( MAKE-12CRATE-VERIFY ?auto_2002405 ?auto_2002406 ?auto_2002407 ?auto_2002409 ?auto_2002408 ?auto_2002410 ?auto_2002411 ?auto_2002412 ?auto_2002413 ?auto_2002414 ?auto_2002415 ?auto_2002416 ?auto_2002417 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2002425 - SURFACE
      ?auto_2002426 - SURFACE
      ?auto_2002427 - SURFACE
      ?auto_2002429 - SURFACE
      ?auto_2002428 - SURFACE
      ?auto_2002430 - SURFACE
      ?auto_2002431 - SURFACE
      ?auto_2002432 - SURFACE
      ?auto_2002433 - SURFACE
      ?auto_2002434 - SURFACE
      ?auto_2002435 - SURFACE
      ?auto_2002436 - SURFACE
      ?auto_2002437 - SURFACE
      ?auto_2002438 - SURFACE
    )
    :vars
    (
      ?auto_2002441 - HOIST
      ?auto_2002445 - PLACE
      ?auto_2002440 - PLACE
      ?auto_2002439 - HOIST
      ?auto_2002442 - SURFACE
      ?auto_2002443 - SURFACE
      ?auto_2002444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002441 ?auto_2002445 ) ( IS-CRATE ?auto_2002438 ) ( not ( = ?auto_2002437 ?auto_2002438 ) ) ( not ( = ?auto_2002436 ?auto_2002437 ) ) ( not ( = ?auto_2002436 ?auto_2002438 ) ) ( not ( = ?auto_2002440 ?auto_2002445 ) ) ( HOIST-AT ?auto_2002439 ?auto_2002440 ) ( not ( = ?auto_2002441 ?auto_2002439 ) ) ( SURFACE-AT ?auto_2002438 ?auto_2002440 ) ( ON ?auto_2002438 ?auto_2002442 ) ( CLEAR ?auto_2002438 ) ( not ( = ?auto_2002437 ?auto_2002442 ) ) ( not ( = ?auto_2002438 ?auto_2002442 ) ) ( not ( = ?auto_2002436 ?auto_2002442 ) ) ( IS-CRATE ?auto_2002437 ) ( AVAILABLE ?auto_2002439 ) ( SURFACE-AT ?auto_2002437 ?auto_2002440 ) ( ON ?auto_2002437 ?auto_2002443 ) ( CLEAR ?auto_2002437 ) ( not ( = ?auto_2002437 ?auto_2002443 ) ) ( not ( = ?auto_2002438 ?auto_2002443 ) ) ( not ( = ?auto_2002436 ?auto_2002443 ) ) ( not ( = ?auto_2002442 ?auto_2002443 ) ) ( TRUCK-AT ?auto_2002444 ?auto_2002445 ) ( SURFACE-AT ?auto_2002435 ?auto_2002445 ) ( CLEAR ?auto_2002435 ) ( LIFTING ?auto_2002441 ?auto_2002436 ) ( IS-CRATE ?auto_2002436 ) ( not ( = ?auto_2002435 ?auto_2002436 ) ) ( not ( = ?auto_2002437 ?auto_2002435 ) ) ( not ( = ?auto_2002438 ?auto_2002435 ) ) ( not ( = ?auto_2002442 ?auto_2002435 ) ) ( not ( = ?auto_2002443 ?auto_2002435 ) ) ( ON ?auto_2002426 ?auto_2002425 ) ( ON ?auto_2002427 ?auto_2002426 ) ( ON ?auto_2002429 ?auto_2002427 ) ( ON ?auto_2002428 ?auto_2002429 ) ( ON ?auto_2002430 ?auto_2002428 ) ( ON ?auto_2002431 ?auto_2002430 ) ( ON ?auto_2002432 ?auto_2002431 ) ( ON ?auto_2002433 ?auto_2002432 ) ( ON ?auto_2002434 ?auto_2002433 ) ( ON ?auto_2002435 ?auto_2002434 ) ( not ( = ?auto_2002425 ?auto_2002426 ) ) ( not ( = ?auto_2002425 ?auto_2002427 ) ) ( not ( = ?auto_2002425 ?auto_2002429 ) ) ( not ( = ?auto_2002425 ?auto_2002428 ) ) ( not ( = ?auto_2002425 ?auto_2002430 ) ) ( not ( = ?auto_2002425 ?auto_2002431 ) ) ( not ( = ?auto_2002425 ?auto_2002432 ) ) ( not ( = ?auto_2002425 ?auto_2002433 ) ) ( not ( = ?auto_2002425 ?auto_2002434 ) ) ( not ( = ?auto_2002425 ?auto_2002435 ) ) ( not ( = ?auto_2002425 ?auto_2002436 ) ) ( not ( = ?auto_2002425 ?auto_2002437 ) ) ( not ( = ?auto_2002425 ?auto_2002438 ) ) ( not ( = ?auto_2002425 ?auto_2002442 ) ) ( not ( = ?auto_2002425 ?auto_2002443 ) ) ( not ( = ?auto_2002426 ?auto_2002427 ) ) ( not ( = ?auto_2002426 ?auto_2002429 ) ) ( not ( = ?auto_2002426 ?auto_2002428 ) ) ( not ( = ?auto_2002426 ?auto_2002430 ) ) ( not ( = ?auto_2002426 ?auto_2002431 ) ) ( not ( = ?auto_2002426 ?auto_2002432 ) ) ( not ( = ?auto_2002426 ?auto_2002433 ) ) ( not ( = ?auto_2002426 ?auto_2002434 ) ) ( not ( = ?auto_2002426 ?auto_2002435 ) ) ( not ( = ?auto_2002426 ?auto_2002436 ) ) ( not ( = ?auto_2002426 ?auto_2002437 ) ) ( not ( = ?auto_2002426 ?auto_2002438 ) ) ( not ( = ?auto_2002426 ?auto_2002442 ) ) ( not ( = ?auto_2002426 ?auto_2002443 ) ) ( not ( = ?auto_2002427 ?auto_2002429 ) ) ( not ( = ?auto_2002427 ?auto_2002428 ) ) ( not ( = ?auto_2002427 ?auto_2002430 ) ) ( not ( = ?auto_2002427 ?auto_2002431 ) ) ( not ( = ?auto_2002427 ?auto_2002432 ) ) ( not ( = ?auto_2002427 ?auto_2002433 ) ) ( not ( = ?auto_2002427 ?auto_2002434 ) ) ( not ( = ?auto_2002427 ?auto_2002435 ) ) ( not ( = ?auto_2002427 ?auto_2002436 ) ) ( not ( = ?auto_2002427 ?auto_2002437 ) ) ( not ( = ?auto_2002427 ?auto_2002438 ) ) ( not ( = ?auto_2002427 ?auto_2002442 ) ) ( not ( = ?auto_2002427 ?auto_2002443 ) ) ( not ( = ?auto_2002429 ?auto_2002428 ) ) ( not ( = ?auto_2002429 ?auto_2002430 ) ) ( not ( = ?auto_2002429 ?auto_2002431 ) ) ( not ( = ?auto_2002429 ?auto_2002432 ) ) ( not ( = ?auto_2002429 ?auto_2002433 ) ) ( not ( = ?auto_2002429 ?auto_2002434 ) ) ( not ( = ?auto_2002429 ?auto_2002435 ) ) ( not ( = ?auto_2002429 ?auto_2002436 ) ) ( not ( = ?auto_2002429 ?auto_2002437 ) ) ( not ( = ?auto_2002429 ?auto_2002438 ) ) ( not ( = ?auto_2002429 ?auto_2002442 ) ) ( not ( = ?auto_2002429 ?auto_2002443 ) ) ( not ( = ?auto_2002428 ?auto_2002430 ) ) ( not ( = ?auto_2002428 ?auto_2002431 ) ) ( not ( = ?auto_2002428 ?auto_2002432 ) ) ( not ( = ?auto_2002428 ?auto_2002433 ) ) ( not ( = ?auto_2002428 ?auto_2002434 ) ) ( not ( = ?auto_2002428 ?auto_2002435 ) ) ( not ( = ?auto_2002428 ?auto_2002436 ) ) ( not ( = ?auto_2002428 ?auto_2002437 ) ) ( not ( = ?auto_2002428 ?auto_2002438 ) ) ( not ( = ?auto_2002428 ?auto_2002442 ) ) ( not ( = ?auto_2002428 ?auto_2002443 ) ) ( not ( = ?auto_2002430 ?auto_2002431 ) ) ( not ( = ?auto_2002430 ?auto_2002432 ) ) ( not ( = ?auto_2002430 ?auto_2002433 ) ) ( not ( = ?auto_2002430 ?auto_2002434 ) ) ( not ( = ?auto_2002430 ?auto_2002435 ) ) ( not ( = ?auto_2002430 ?auto_2002436 ) ) ( not ( = ?auto_2002430 ?auto_2002437 ) ) ( not ( = ?auto_2002430 ?auto_2002438 ) ) ( not ( = ?auto_2002430 ?auto_2002442 ) ) ( not ( = ?auto_2002430 ?auto_2002443 ) ) ( not ( = ?auto_2002431 ?auto_2002432 ) ) ( not ( = ?auto_2002431 ?auto_2002433 ) ) ( not ( = ?auto_2002431 ?auto_2002434 ) ) ( not ( = ?auto_2002431 ?auto_2002435 ) ) ( not ( = ?auto_2002431 ?auto_2002436 ) ) ( not ( = ?auto_2002431 ?auto_2002437 ) ) ( not ( = ?auto_2002431 ?auto_2002438 ) ) ( not ( = ?auto_2002431 ?auto_2002442 ) ) ( not ( = ?auto_2002431 ?auto_2002443 ) ) ( not ( = ?auto_2002432 ?auto_2002433 ) ) ( not ( = ?auto_2002432 ?auto_2002434 ) ) ( not ( = ?auto_2002432 ?auto_2002435 ) ) ( not ( = ?auto_2002432 ?auto_2002436 ) ) ( not ( = ?auto_2002432 ?auto_2002437 ) ) ( not ( = ?auto_2002432 ?auto_2002438 ) ) ( not ( = ?auto_2002432 ?auto_2002442 ) ) ( not ( = ?auto_2002432 ?auto_2002443 ) ) ( not ( = ?auto_2002433 ?auto_2002434 ) ) ( not ( = ?auto_2002433 ?auto_2002435 ) ) ( not ( = ?auto_2002433 ?auto_2002436 ) ) ( not ( = ?auto_2002433 ?auto_2002437 ) ) ( not ( = ?auto_2002433 ?auto_2002438 ) ) ( not ( = ?auto_2002433 ?auto_2002442 ) ) ( not ( = ?auto_2002433 ?auto_2002443 ) ) ( not ( = ?auto_2002434 ?auto_2002435 ) ) ( not ( = ?auto_2002434 ?auto_2002436 ) ) ( not ( = ?auto_2002434 ?auto_2002437 ) ) ( not ( = ?auto_2002434 ?auto_2002438 ) ) ( not ( = ?auto_2002434 ?auto_2002442 ) ) ( not ( = ?auto_2002434 ?auto_2002443 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002436 ?auto_2002437 ?auto_2002438 )
      ( MAKE-13CRATE-VERIFY ?auto_2002425 ?auto_2002426 ?auto_2002427 ?auto_2002429 ?auto_2002428 ?auto_2002430 ?auto_2002431 ?auto_2002432 ?auto_2002433 ?auto_2002434 ?auto_2002435 ?auto_2002436 ?auto_2002437 ?auto_2002438 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2002446 - SURFACE
      ?auto_2002447 - SURFACE
      ?auto_2002448 - SURFACE
      ?auto_2002450 - SURFACE
      ?auto_2002449 - SURFACE
      ?auto_2002451 - SURFACE
      ?auto_2002452 - SURFACE
      ?auto_2002453 - SURFACE
      ?auto_2002454 - SURFACE
      ?auto_2002455 - SURFACE
      ?auto_2002456 - SURFACE
      ?auto_2002457 - SURFACE
      ?auto_2002458 - SURFACE
      ?auto_2002459 - SURFACE
      ?auto_2002460 - SURFACE
    )
    :vars
    (
      ?auto_2002463 - HOIST
      ?auto_2002467 - PLACE
      ?auto_2002462 - PLACE
      ?auto_2002461 - HOIST
      ?auto_2002464 - SURFACE
      ?auto_2002465 - SURFACE
      ?auto_2002466 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002463 ?auto_2002467 ) ( IS-CRATE ?auto_2002460 ) ( not ( = ?auto_2002459 ?auto_2002460 ) ) ( not ( = ?auto_2002458 ?auto_2002459 ) ) ( not ( = ?auto_2002458 ?auto_2002460 ) ) ( not ( = ?auto_2002462 ?auto_2002467 ) ) ( HOIST-AT ?auto_2002461 ?auto_2002462 ) ( not ( = ?auto_2002463 ?auto_2002461 ) ) ( SURFACE-AT ?auto_2002460 ?auto_2002462 ) ( ON ?auto_2002460 ?auto_2002464 ) ( CLEAR ?auto_2002460 ) ( not ( = ?auto_2002459 ?auto_2002464 ) ) ( not ( = ?auto_2002460 ?auto_2002464 ) ) ( not ( = ?auto_2002458 ?auto_2002464 ) ) ( IS-CRATE ?auto_2002459 ) ( AVAILABLE ?auto_2002461 ) ( SURFACE-AT ?auto_2002459 ?auto_2002462 ) ( ON ?auto_2002459 ?auto_2002465 ) ( CLEAR ?auto_2002459 ) ( not ( = ?auto_2002459 ?auto_2002465 ) ) ( not ( = ?auto_2002460 ?auto_2002465 ) ) ( not ( = ?auto_2002458 ?auto_2002465 ) ) ( not ( = ?auto_2002464 ?auto_2002465 ) ) ( TRUCK-AT ?auto_2002466 ?auto_2002467 ) ( SURFACE-AT ?auto_2002457 ?auto_2002467 ) ( CLEAR ?auto_2002457 ) ( LIFTING ?auto_2002463 ?auto_2002458 ) ( IS-CRATE ?auto_2002458 ) ( not ( = ?auto_2002457 ?auto_2002458 ) ) ( not ( = ?auto_2002459 ?auto_2002457 ) ) ( not ( = ?auto_2002460 ?auto_2002457 ) ) ( not ( = ?auto_2002464 ?auto_2002457 ) ) ( not ( = ?auto_2002465 ?auto_2002457 ) ) ( ON ?auto_2002447 ?auto_2002446 ) ( ON ?auto_2002448 ?auto_2002447 ) ( ON ?auto_2002450 ?auto_2002448 ) ( ON ?auto_2002449 ?auto_2002450 ) ( ON ?auto_2002451 ?auto_2002449 ) ( ON ?auto_2002452 ?auto_2002451 ) ( ON ?auto_2002453 ?auto_2002452 ) ( ON ?auto_2002454 ?auto_2002453 ) ( ON ?auto_2002455 ?auto_2002454 ) ( ON ?auto_2002456 ?auto_2002455 ) ( ON ?auto_2002457 ?auto_2002456 ) ( not ( = ?auto_2002446 ?auto_2002447 ) ) ( not ( = ?auto_2002446 ?auto_2002448 ) ) ( not ( = ?auto_2002446 ?auto_2002450 ) ) ( not ( = ?auto_2002446 ?auto_2002449 ) ) ( not ( = ?auto_2002446 ?auto_2002451 ) ) ( not ( = ?auto_2002446 ?auto_2002452 ) ) ( not ( = ?auto_2002446 ?auto_2002453 ) ) ( not ( = ?auto_2002446 ?auto_2002454 ) ) ( not ( = ?auto_2002446 ?auto_2002455 ) ) ( not ( = ?auto_2002446 ?auto_2002456 ) ) ( not ( = ?auto_2002446 ?auto_2002457 ) ) ( not ( = ?auto_2002446 ?auto_2002458 ) ) ( not ( = ?auto_2002446 ?auto_2002459 ) ) ( not ( = ?auto_2002446 ?auto_2002460 ) ) ( not ( = ?auto_2002446 ?auto_2002464 ) ) ( not ( = ?auto_2002446 ?auto_2002465 ) ) ( not ( = ?auto_2002447 ?auto_2002448 ) ) ( not ( = ?auto_2002447 ?auto_2002450 ) ) ( not ( = ?auto_2002447 ?auto_2002449 ) ) ( not ( = ?auto_2002447 ?auto_2002451 ) ) ( not ( = ?auto_2002447 ?auto_2002452 ) ) ( not ( = ?auto_2002447 ?auto_2002453 ) ) ( not ( = ?auto_2002447 ?auto_2002454 ) ) ( not ( = ?auto_2002447 ?auto_2002455 ) ) ( not ( = ?auto_2002447 ?auto_2002456 ) ) ( not ( = ?auto_2002447 ?auto_2002457 ) ) ( not ( = ?auto_2002447 ?auto_2002458 ) ) ( not ( = ?auto_2002447 ?auto_2002459 ) ) ( not ( = ?auto_2002447 ?auto_2002460 ) ) ( not ( = ?auto_2002447 ?auto_2002464 ) ) ( not ( = ?auto_2002447 ?auto_2002465 ) ) ( not ( = ?auto_2002448 ?auto_2002450 ) ) ( not ( = ?auto_2002448 ?auto_2002449 ) ) ( not ( = ?auto_2002448 ?auto_2002451 ) ) ( not ( = ?auto_2002448 ?auto_2002452 ) ) ( not ( = ?auto_2002448 ?auto_2002453 ) ) ( not ( = ?auto_2002448 ?auto_2002454 ) ) ( not ( = ?auto_2002448 ?auto_2002455 ) ) ( not ( = ?auto_2002448 ?auto_2002456 ) ) ( not ( = ?auto_2002448 ?auto_2002457 ) ) ( not ( = ?auto_2002448 ?auto_2002458 ) ) ( not ( = ?auto_2002448 ?auto_2002459 ) ) ( not ( = ?auto_2002448 ?auto_2002460 ) ) ( not ( = ?auto_2002448 ?auto_2002464 ) ) ( not ( = ?auto_2002448 ?auto_2002465 ) ) ( not ( = ?auto_2002450 ?auto_2002449 ) ) ( not ( = ?auto_2002450 ?auto_2002451 ) ) ( not ( = ?auto_2002450 ?auto_2002452 ) ) ( not ( = ?auto_2002450 ?auto_2002453 ) ) ( not ( = ?auto_2002450 ?auto_2002454 ) ) ( not ( = ?auto_2002450 ?auto_2002455 ) ) ( not ( = ?auto_2002450 ?auto_2002456 ) ) ( not ( = ?auto_2002450 ?auto_2002457 ) ) ( not ( = ?auto_2002450 ?auto_2002458 ) ) ( not ( = ?auto_2002450 ?auto_2002459 ) ) ( not ( = ?auto_2002450 ?auto_2002460 ) ) ( not ( = ?auto_2002450 ?auto_2002464 ) ) ( not ( = ?auto_2002450 ?auto_2002465 ) ) ( not ( = ?auto_2002449 ?auto_2002451 ) ) ( not ( = ?auto_2002449 ?auto_2002452 ) ) ( not ( = ?auto_2002449 ?auto_2002453 ) ) ( not ( = ?auto_2002449 ?auto_2002454 ) ) ( not ( = ?auto_2002449 ?auto_2002455 ) ) ( not ( = ?auto_2002449 ?auto_2002456 ) ) ( not ( = ?auto_2002449 ?auto_2002457 ) ) ( not ( = ?auto_2002449 ?auto_2002458 ) ) ( not ( = ?auto_2002449 ?auto_2002459 ) ) ( not ( = ?auto_2002449 ?auto_2002460 ) ) ( not ( = ?auto_2002449 ?auto_2002464 ) ) ( not ( = ?auto_2002449 ?auto_2002465 ) ) ( not ( = ?auto_2002451 ?auto_2002452 ) ) ( not ( = ?auto_2002451 ?auto_2002453 ) ) ( not ( = ?auto_2002451 ?auto_2002454 ) ) ( not ( = ?auto_2002451 ?auto_2002455 ) ) ( not ( = ?auto_2002451 ?auto_2002456 ) ) ( not ( = ?auto_2002451 ?auto_2002457 ) ) ( not ( = ?auto_2002451 ?auto_2002458 ) ) ( not ( = ?auto_2002451 ?auto_2002459 ) ) ( not ( = ?auto_2002451 ?auto_2002460 ) ) ( not ( = ?auto_2002451 ?auto_2002464 ) ) ( not ( = ?auto_2002451 ?auto_2002465 ) ) ( not ( = ?auto_2002452 ?auto_2002453 ) ) ( not ( = ?auto_2002452 ?auto_2002454 ) ) ( not ( = ?auto_2002452 ?auto_2002455 ) ) ( not ( = ?auto_2002452 ?auto_2002456 ) ) ( not ( = ?auto_2002452 ?auto_2002457 ) ) ( not ( = ?auto_2002452 ?auto_2002458 ) ) ( not ( = ?auto_2002452 ?auto_2002459 ) ) ( not ( = ?auto_2002452 ?auto_2002460 ) ) ( not ( = ?auto_2002452 ?auto_2002464 ) ) ( not ( = ?auto_2002452 ?auto_2002465 ) ) ( not ( = ?auto_2002453 ?auto_2002454 ) ) ( not ( = ?auto_2002453 ?auto_2002455 ) ) ( not ( = ?auto_2002453 ?auto_2002456 ) ) ( not ( = ?auto_2002453 ?auto_2002457 ) ) ( not ( = ?auto_2002453 ?auto_2002458 ) ) ( not ( = ?auto_2002453 ?auto_2002459 ) ) ( not ( = ?auto_2002453 ?auto_2002460 ) ) ( not ( = ?auto_2002453 ?auto_2002464 ) ) ( not ( = ?auto_2002453 ?auto_2002465 ) ) ( not ( = ?auto_2002454 ?auto_2002455 ) ) ( not ( = ?auto_2002454 ?auto_2002456 ) ) ( not ( = ?auto_2002454 ?auto_2002457 ) ) ( not ( = ?auto_2002454 ?auto_2002458 ) ) ( not ( = ?auto_2002454 ?auto_2002459 ) ) ( not ( = ?auto_2002454 ?auto_2002460 ) ) ( not ( = ?auto_2002454 ?auto_2002464 ) ) ( not ( = ?auto_2002454 ?auto_2002465 ) ) ( not ( = ?auto_2002455 ?auto_2002456 ) ) ( not ( = ?auto_2002455 ?auto_2002457 ) ) ( not ( = ?auto_2002455 ?auto_2002458 ) ) ( not ( = ?auto_2002455 ?auto_2002459 ) ) ( not ( = ?auto_2002455 ?auto_2002460 ) ) ( not ( = ?auto_2002455 ?auto_2002464 ) ) ( not ( = ?auto_2002455 ?auto_2002465 ) ) ( not ( = ?auto_2002456 ?auto_2002457 ) ) ( not ( = ?auto_2002456 ?auto_2002458 ) ) ( not ( = ?auto_2002456 ?auto_2002459 ) ) ( not ( = ?auto_2002456 ?auto_2002460 ) ) ( not ( = ?auto_2002456 ?auto_2002464 ) ) ( not ( = ?auto_2002456 ?auto_2002465 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002458 ?auto_2002459 ?auto_2002460 )
      ( MAKE-14CRATE-VERIFY ?auto_2002446 ?auto_2002447 ?auto_2002448 ?auto_2002450 ?auto_2002449 ?auto_2002451 ?auto_2002452 ?auto_2002453 ?auto_2002454 ?auto_2002455 ?auto_2002456 ?auto_2002457 ?auto_2002458 ?auto_2002459 ?auto_2002460 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2002468 - SURFACE
      ?auto_2002469 - SURFACE
      ?auto_2002470 - SURFACE
      ?auto_2002472 - SURFACE
      ?auto_2002471 - SURFACE
      ?auto_2002473 - SURFACE
      ?auto_2002474 - SURFACE
      ?auto_2002475 - SURFACE
      ?auto_2002476 - SURFACE
      ?auto_2002477 - SURFACE
      ?auto_2002478 - SURFACE
      ?auto_2002479 - SURFACE
      ?auto_2002480 - SURFACE
      ?auto_2002481 - SURFACE
      ?auto_2002482 - SURFACE
      ?auto_2002483 - SURFACE
    )
    :vars
    (
      ?auto_2002486 - HOIST
      ?auto_2002490 - PLACE
      ?auto_2002485 - PLACE
      ?auto_2002484 - HOIST
      ?auto_2002487 - SURFACE
      ?auto_2002488 - SURFACE
      ?auto_2002489 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002486 ?auto_2002490 ) ( IS-CRATE ?auto_2002483 ) ( not ( = ?auto_2002482 ?auto_2002483 ) ) ( not ( = ?auto_2002481 ?auto_2002482 ) ) ( not ( = ?auto_2002481 ?auto_2002483 ) ) ( not ( = ?auto_2002485 ?auto_2002490 ) ) ( HOIST-AT ?auto_2002484 ?auto_2002485 ) ( not ( = ?auto_2002486 ?auto_2002484 ) ) ( SURFACE-AT ?auto_2002483 ?auto_2002485 ) ( ON ?auto_2002483 ?auto_2002487 ) ( CLEAR ?auto_2002483 ) ( not ( = ?auto_2002482 ?auto_2002487 ) ) ( not ( = ?auto_2002483 ?auto_2002487 ) ) ( not ( = ?auto_2002481 ?auto_2002487 ) ) ( IS-CRATE ?auto_2002482 ) ( AVAILABLE ?auto_2002484 ) ( SURFACE-AT ?auto_2002482 ?auto_2002485 ) ( ON ?auto_2002482 ?auto_2002488 ) ( CLEAR ?auto_2002482 ) ( not ( = ?auto_2002482 ?auto_2002488 ) ) ( not ( = ?auto_2002483 ?auto_2002488 ) ) ( not ( = ?auto_2002481 ?auto_2002488 ) ) ( not ( = ?auto_2002487 ?auto_2002488 ) ) ( TRUCK-AT ?auto_2002489 ?auto_2002490 ) ( SURFACE-AT ?auto_2002480 ?auto_2002490 ) ( CLEAR ?auto_2002480 ) ( LIFTING ?auto_2002486 ?auto_2002481 ) ( IS-CRATE ?auto_2002481 ) ( not ( = ?auto_2002480 ?auto_2002481 ) ) ( not ( = ?auto_2002482 ?auto_2002480 ) ) ( not ( = ?auto_2002483 ?auto_2002480 ) ) ( not ( = ?auto_2002487 ?auto_2002480 ) ) ( not ( = ?auto_2002488 ?auto_2002480 ) ) ( ON ?auto_2002469 ?auto_2002468 ) ( ON ?auto_2002470 ?auto_2002469 ) ( ON ?auto_2002472 ?auto_2002470 ) ( ON ?auto_2002471 ?auto_2002472 ) ( ON ?auto_2002473 ?auto_2002471 ) ( ON ?auto_2002474 ?auto_2002473 ) ( ON ?auto_2002475 ?auto_2002474 ) ( ON ?auto_2002476 ?auto_2002475 ) ( ON ?auto_2002477 ?auto_2002476 ) ( ON ?auto_2002478 ?auto_2002477 ) ( ON ?auto_2002479 ?auto_2002478 ) ( ON ?auto_2002480 ?auto_2002479 ) ( not ( = ?auto_2002468 ?auto_2002469 ) ) ( not ( = ?auto_2002468 ?auto_2002470 ) ) ( not ( = ?auto_2002468 ?auto_2002472 ) ) ( not ( = ?auto_2002468 ?auto_2002471 ) ) ( not ( = ?auto_2002468 ?auto_2002473 ) ) ( not ( = ?auto_2002468 ?auto_2002474 ) ) ( not ( = ?auto_2002468 ?auto_2002475 ) ) ( not ( = ?auto_2002468 ?auto_2002476 ) ) ( not ( = ?auto_2002468 ?auto_2002477 ) ) ( not ( = ?auto_2002468 ?auto_2002478 ) ) ( not ( = ?auto_2002468 ?auto_2002479 ) ) ( not ( = ?auto_2002468 ?auto_2002480 ) ) ( not ( = ?auto_2002468 ?auto_2002481 ) ) ( not ( = ?auto_2002468 ?auto_2002482 ) ) ( not ( = ?auto_2002468 ?auto_2002483 ) ) ( not ( = ?auto_2002468 ?auto_2002487 ) ) ( not ( = ?auto_2002468 ?auto_2002488 ) ) ( not ( = ?auto_2002469 ?auto_2002470 ) ) ( not ( = ?auto_2002469 ?auto_2002472 ) ) ( not ( = ?auto_2002469 ?auto_2002471 ) ) ( not ( = ?auto_2002469 ?auto_2002473 ) ) ( not ( = ?auto_2002469 ?auto_2002474 ) ) ( not ( = ?auto_2002469 ?auto_2002475 ) ) ( not ( = ?auto_2002469 ?auto_2002476 ) ) ( not ( = ?auto_2002469 ?auto_2002477 ) ) ( not ( = ?auto_2002469 ?auto_2002478 ) ) ( not ( = ?auto_2002469 ?auto_2002479 ) ) ( not ( = ?auto_2002469 ?auto_2002480 ) ) ( not ( = ?auto_2002469 ?auto_2002481 ) ) ( not ( = ?auto_2002469 ?auto_2002482 ) ) ( not ( = ?auto_2002469 ?auto_2002483 ) ) ( not ( = ?auto_2002469 ?auto_2002487 ) ) ( not ( = ?auto_2002469 ?auto_2002488 ) ) ( not ( = ?auto_2002470 ?auto_2002472 ) ) ( not ( = ?auto_2002470 ?auto_2002471 ) ) ( not ( = ?auto_2002470 ?auto_2002473 ) ) ( not ( = ?auto_2002470 ?auto_2002474 ) ) ( not ( = ?auto_2002470 ?auto_2002475 ) ) ( not ( = ?auto_2002470 ?auto_2002476 ) ) ( not ( = ?auto_2002470 ?auto_2002477 ) ) ( not ( = ?auto_2002470 ?auto_2002478 ) ) ( not ( = ?auto_2002470 ?auto_2002479 ) ) ( not ( = ?auto_2002470 ?auto_2002480 ) ) ( not ( = ?auto_2002470 ?auto_2002481 ) ) ( not ( = ?auto_2002470 ?auto_2002482 ) ) ( not ( = ?auto_2002470 ?auto_2002483 ) ) ( not ( = ?auto_2002470 ?auto_2002487 ) ) ( not ( = ?auto_2002470 ?auto_2002488 ) ) ( not ( = ?auto_2002472 ?auto_2002471 ) ) ( not ( = ?auto_2002472 ?auto_2002473 ) ) ( not ( = ?auto_2002472 ?auto_2002474 ) ) ( not ( = ?auto_2002472 ?auto_2002475 ) ) ( not ( = ?auto_2002472 ?auto_2002476 ) ) ( not ( = ?auto_2002472 ?auto_2002477 ) ) ( not ( = ?auto_2002472 ?auto_2002478 ) ) ( not ( = ?auto_2002472 ?auto_2002479 ) ) ( not ( = ?auto_2002472 ?auto_2002480 ) ) ( not ( = ?auto_2002472 ?auto_2002481 ) ) ( not ( = ?auto_2002472 ?auto_2002482 ) ) ( not ( = ?auto_2002472 ?auto_2002483 ) ) ( not ( = ?auto_2002472 ?auto_2002487 ) ) ( not ( = ?auto_2002472 ?auto_2002488 ) ) ( not ( = ?auto_2002471 ?auto_2002473 ) ) ( not ( = ?auto_2002471 ?auto_2002474 ) ) ( not ( = ?auto_2002471 ?auto_2002475 ) ) ( not ( = ?auto_2002471 ?auto_2002476 ) ) ( not ( = ?auto_2002471 ?auto_2002477 ) ) ( not ( = ?auto_2002471 ?auto_2002478 ) ) ( not ( = ?auto_2002471 ?auto_2002479 ) ) ( not ( = ?auto_2002471 ?auto_2002480 ) ) ( not ( = ?auto_2002471 ?auto_2002481 ) ) ( not ( = ?auto_2002471 ?auto_2002482 ) ) ( not ( = ?auto_2002471 ?auto_2002483 ) ) ( not ( = ?auto_2002471 ?auto_2002487 ) ) ( not ( = ?auto_2002471 ?auto_2002488 ) ) ( not ( = ?auto_2002473 ?auto_2002474 ) ) ( not ( = ?auto_2002473 ?auto_2002475 ) ) ( not ( = ?auto_2002473 ?auto_2002476 ) ) ( not ( = ?auto_2002473 ?auto_2002477 ) ) ( not ( = ?auto_2002473 ?auto_2002478 ) ) ( not ( = ?auto_2002473 ?auto_2002479 ) ) ( not ( = ?auto_2002473 ?auto_2002480 ) ) ( not ( = ?auto_2002473 ?auto_2002481 ) ) ( not ( = ?auto_2002473 ?auto_2002482 ) ) ( not ( = ?auto_2002473 ?auto_2002483 ) ) ( not ( = ?auto_2002473 ?auto_2002487 ) ) ( not ( = ?auto_2002473 ?auto_2002488 ) ) ( not ( = ?auto_2002474 ?auto_2002475 ) ) ( not ( = ?auto_2002474 ?auto_2002476 ) ) ( not ( = ?auto_2002474 ?auto_2002477 ) ) ( not ( = ?auto_2002474 ?auto_2002478 ) ) ( not ( = ?auto_2002474 ?auto_2002479 ) ) ( not ( = ?auto_2002474 ?auto_2002480 ) ) ( not ( = ?auto_2002474 ?auto_2002481 ) ) ( not ( = ?auto_2002474 ?auto_2002482 ) ) ( not ( = ?auto_2002474 ?auto_2002483 ) ) ( not ( = ?auto_2002474 ?auto_2002487 ) ) ( not ( = ?auto_2002474 ?auto_2002488 ) ) ( not ( = ?auto_2002475 ?auto_2002476 ) ) ( not ( = ?auto_2002475 ?auto_2002477 ) ) ( not ( = ?auto_2002475 ?auto_2002478 ) ) ( not ( = ?auto_2002475 ?auto_2002479 ) ) ( not ( = ?auto_2002475 ?auto_2002480 ) ) ( not ( = ?auto_2002475 ?auto_2002481 ) ) ( not ( = ?auto_2002475 ?auto_2002482 ) ) ( not ( = ?auto_2002475 ?auto_2002483 ) ) ( not ( = ?auto_2002475 ?auto_2002487 ) ) ( not ( = ?auto_2002475 ?auto_2002488 ) ) ( not ( = ?auto_2002476 ?auto_2002477 ) ) ( not ( = ?auto_2002476 ?auto_2002478 ) ) ( not ( = ?auto_2002476 ?auto_2002479 ) ) ( not ( = ?auto_2002476 ?auto_2002480 ) ) ( not ( = ?auto_2002476 ?auto_2002481 ) ) ( not ( = ?auto_2002476 ?auto_2002482 ) ) ( not ( = ?auto_2002476 ?auto_2002483 ) ) ( not ( = ?auto_2002476 ?auto_2002487 ) ) ( not ( = ?auto_2002476 ?auto_2002488 ) ) ( not ( = ?auto_2002477 ?auto_2002478 ) ) ( not ( = ?auto_2002477 ?auto_2002479 ) ) ( not ( = ?auto_2002477 ?auto_2002480 ) ) ( not ( = ?auto_2002477 ?auto_2002481 ) ) ( not ( = ?auto_2002477 ?auto_2002482 ) ) ( not ( = ?auto_2002477 ?auto_2002483 ) ) ( not ( = ?auto_2002477 ?auto_2002487 ) ) ( not ( = ?auto_2002477 ?auto_2002488 ) ) ( not ( = ?auto_2002478 ?auto_2002479 ) ) ( not ( = ?auto_2002478 ?auto_2002480 ) ) ( not ( = ?auto_2002478 ?auto_2002481 ) ) ( not ( = ?auto_2002478 ?auto_2002482 ) ) ( not ( = ?auto_2002478 ?auto_2002483 ) ) ( not ( = ?auto_2002478 ?auto_2002487 ) ) ( not ( = ?auto_2002478 ?auto_2002488 ) ) ( not ( = ?auto_2002479 ?auto_2002480 ) ) ( not ( = ?auto_2002479 ?auto_2002481 ) ) ( not ( = ?auto_2002479 ?auto_2002482 ) ) ( not ( = ?auto_2002479 ?auto_2002483 ) ) ( not ( = ?auto_2002479 ?auto_2002487 ) ) ( not ( = ?auto_2002479 ?auto_2002488 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2002481 ?auto_2002482 ?auto_2002483 )
      ( MAKE-15CRATE-VERIFY ?auto_2002468 ?auto_2002469 ?auto_2002470 ?auto_2002472 ?auto_2002471 ?auto_2002473 ?auto_2002474 ?auto_2002475 ?auto_2002476 ?auto_2002477 ?auto_2002478 ?auto_2002479 ?auto_2002480 ?auto_2002481 ?auto_2002482 ?auto_2002483 ) )
  )

)

