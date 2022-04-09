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
      ?auto_2127018 - SURFACE
      ?auto_2127019 - SURFACE
    )
    :vars
    (
      ?auto_2127020 - HOIST
      ?auto_2127021 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127020 ?auto_2127021 ) ( SURFACE-AT ?auto_2127018 ?auto_2127021 ) ( CLEAR ?auto_2127018 ) ( LIFTING ?auto_2127020 ?auto_2127019 ) ( IS-CRATE ?auto_2127019 ) ( not ( = ?auto_2127018 ?auto_2127019 ) ) )
    :subtasks
    ( ( !DROP ?auto_2127020 ?auto_2127019 ?auto_2127018 ?auto_2127021 )
      ( MAKE-1CRATE-VERIFY ?auto_2127018 ?auto_2127019 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2127022 - SURFACE
      ?auto_2127023 - SURFACE
    )
    :vars
    (
      ?auto_2127024 - HOIST
      ?auto_2127025 - PLACE
      ?auto_2127026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127024 ?auto_2127025 ) ( SURFACE-AT ?auto_2127022 ?auto_2127025 ) ( CLEAR ?auto_2127022 ) ( IS-CRATE ?auto_2127023 ) ( not ( = ?auto_2127022 ?auto_2127023 ) ) ( TRUCK-AT ?auto_2127026 ?auto_2127025 ) ( AVAILABLE ?auto_2127024 ) ( IN ?auto_2127023 ?auto_2127026 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2127024 ?auto_2127023 ?auto_2127026 ?auto_2127025 )
      ( MAKE-1CRATE ?auto_2127022 ?auto_2127023 )
      ( MAKE-1CRATE-VERIFY ?auto_2127022 ?auto_2127023 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2127027 - SURFACE
      ?auto_2127028 - SURFACE
    )
    :vars
    (
      ?auto_2127030 - HOIST
      ?auto_2127029 - PLACE
      ?auto_2127031 - TRUCK
      ?auto_2127032 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127030 ?auto_2127029 ) ( SURFACE-AT ?auto_2127027 ?auto_2127029 ) ( CLEAR ?auto_2127027 ) ( IS-CRATE ?auto_2127028 ) ( not ( = ?auto_2127027 ?auto_2127028 ) ) ( AVAILABLE ?auto_2127030 ) ( IN ?auto_2127028 ?auto_2127031 ) ( TRUCK-AT ?auto_2127031 ?auto_2127032 ) ( not ( = ?auto_2127032 ?auto_2127029 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2127031 ?auto_2127032 ?auto_2127029 )
      ( MAKE-1CRATE ?auto_2127027 ?auto_2127028 )
      ( MAKE-1CRATE-VERIFY ?auto_2127027 ?auto_2127028 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2127033 - SURFACE
      ?auto_2127034 - SURFACE
    )
    :vars
    (
      ?auto_2127036 - HOIST
      ?auto_2127037 - PLACE
      ?auto_2127038 - TRUCK
      ?auto_2127035 - PLACE
      ?auto_2127039 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127036 ?auto_2127037 ) ( SURFACE-AT ?auto_2127033 ?auto_2127037 ) ( CLEAR ?auto_2127033 ) ( IS-CRATE ?auto_2127034 ) ( not ( = ?auto_2127033 ?auto_2127034 ) ) ( AVAILABLE ?auto_2127036 ) ( TRUCK-AT ?auto_2127038 ?auto_2127035 ) ( not ( = ?auto_2127035 ?auto_2127037 ) ) ( HOIST-AT ?auto_2127039 ?auto_2127035 ) ( LIFTING ?auto_2127039 ?auto_2127034 ) ( not ( = ?auto_2127036 ?auto_2127039 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2127039 ?auto_2127034 ?auto_2127038 ?auto_2127035 )
      ( MAKE-1CRATE ?auto_2127033 ?auto_2127034 )
      ( MAKE-1CRATE-VERIFY ?auto_2127033 ?auto_2127034 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2127040 - SURFACE
      ?auto_2127041 - SURFACE
    )
    :vars
    (
      ?auto_2127045 - HOIST
      ?auto_2127046 - PLACE
      ?auto_2127042 - TRUCK
      ?auto_2127044 - PLACE
      ?auto_2127043 - HOIST
      ?auto_2127047 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127045 ?auto_2127046 ) ( SURFACE-AT ?auto_2127040 ?auto_2127046 ) ( CLEAR ?auto_2127040 ) ( IS-CRATE ?auto_2127041 ) ( not ( = ?auto_2127040 ?auto_2127041 ) ) ( AVAILABLE ?auto_2127045 ) ( TRUCK-AT ?auto_2127042 ?auto_2127044 ) ( not ( = ?auto_2127044 ?auto_2127046 ) ) ( HOIST-AT ?auto_2127043 ?auto_2127044 ) ( not ( = ?auto_2127045 ?auto_2127043 ) ) ( AVAILABLE ?auto_2127043 ) ( SURFACE-AT ?auto_2127041 ?auto_2127044 ) ( ON ?auto_2127041 ?auto_2127047 ) ( CLEAR ?auto_2127041 ) ( not ( = ?auto_2127040 ?auto_2127047 ) ) ( not ( = ?auto_2127041 ?auto_2127047 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2127043 ?auto_2127041 ?auto_2127047 ?auto_2127044 )
      ( MAKE-1CRATE ?auto_2127040 ?auto_2127041 )
      ( MAKE-1CRATE-VERIFY ?auto_2127040 ?auto_2127041 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2127048 - SURFACE
      ?auto_2127049 - SURFACE
    )
    :vars
    (
      ?auto_2127052 - HOIST
      ?auto_2127055 - PLACE
      ?auto_2127050 - PLACE
      ?auto_2127054 - HOIST
      ?auto_2127051 - SURFACE
      ?auto_2127053 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127052 ?auto_2127055 ) ( SURFACE-AT ?auto_2127048 ?auto_2127055 ) ( CLEAR ?auto_2127048 ) ( IS-CRATE ?auto_2127049 ) ( not ( = ?auto_2127048 ?auto_2127049 ) ) ( AVAILABLE ?auto_2127052 ) ( not ( = ?auto_2127050 ?auto_2127055 ) ) ( HOIST-AT ?auto_2127054 ?auto_2127050 ) ( not ( = ?auto_2127052 ?auto_2127054 ) ) ( AVAILABLE ?auto_2127054 ) ( SURFACE-AT ?auto_2127049 ?auto_2127050 ) ( ON ?auto_2127049 ?auto_2127051 ) ( CLEAR ?auto_2127049 ) ( not ( = ?auto_2127048 ?auto_2127051 ) ) ( not ( = ?auto_2127049 ?auto_2127051 ) ) ( TRUCK-AT ?auto_2127053 ?auto_2127055 ) )
    :subtasks
    ( ( !DRIVE ?auto_2127053 ?auto_2127055 ?auto_2127050 )
      ( MAKE-1CRATE ?auto_2127048 ?auto_2127049 )
      ( MAKE-1CRATE-VERIFY ?auto_2127048 ?auto_2127049 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2127065 - SURFACE
      ?auto_2127066 - SURFACE
      ?auto_2127067 - SURFACE
    )
    :vars
    (
      ?auto_2127068 - HOIST
      ?auto_2127069 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127068 ?auto_2127069 ) ( SURFACE-AT ?auto_2127066 ?auto_2127069 ) ( CLEAR ?auto_2127066 ) ( LIFTING ?auto_2127068 ?auto_2127067 ) ( IS-CRATE ?auto_2127067 ) ( not ( = ?auto_2127066 ?auto_2127067 ) ) ( ON ?auto_2127066 ?auto_2127065 ) ( not ( = ?auto_2127065 ?auto_2127066 ) ) ( not ( = ?auto_2127065 ?auto_2127067 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2127066 ?auto_2127067 )
      ( MAKE-2CRATE-VERIFY ?auto_2127065 ?auto_2127066 ?auto_2127067 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2127075 - SURFACE
      ?auto_2127076 - SURFACE
      ?auto_2127077 - SURFACE
    )
    :vars
    (
      ?auto_2127080 - HOIST
      ?auto_2127078 - PLACE
      ?auto_2127079 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127080 ?auto_2127078 ) ( SURFACE-AT ?auto_2127076 ?auto_2127078 ) ( CLEAR ?auto_2127076 ) ( IS-CRATE ?auto_2127077 ) ( not ( = ?auto_2127076 ?auto_2127077 ) ) ( TRUCK-AT ?auto_2127079 ?auto_2127078 ) ( AVAILABLE ?auto_2127080 ) ( IN ?auto_2127077 ?auto_2127079 ) ( ON ?auto_2127076 ?auto_2127075 ) ( not ( = ?auto_2127075 ?auto_2127076 ) ) ( not ( = ?auto_2127075 ?auto_2127077 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2127076 ?auto_2127077 )
      ( MAKE-2CRATE-VERIFY ?auto_2127075 ?auto_2127076 ?auto_2127077 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2127081 - SURFACE
      ?auto_2127082 - SURFACE
    )
    :vars
    (
      ?auto_2127083 - HOIST
      ?auto_2127084 - PLACE
      ?auto_2127085 - TRUCK
      ?auto_2127086 - SURFACE
      ?auto_2127087 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127083 ?auto_2127084 ) ( SURFACE-AT ?auto_2127081 ?auto_2127084 ) ( CLEAR ?auto_2127081 ) ( IS-CRATE ?auto_2127082 ) ( not ( = ?auto_2127081 ?auto_2127082 ) ) ( AVAILABLE ?auto_2127083 ) ( IN ?auto_2127082 ?auto_2127085 ) ( ON ?auto_2127081 ?auto_2127086 ) ( not ( = ?auto_2127086 ?auto_2127081 ) ) ( not ( = ?auto_2127086 ?auto_2127082 ) ) ( TRUCK-AT ?auto_2127085 ?auto_2127087 ) ( not ( = ?auto_2127087 ?auto_2127084 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2127085 ?auto_2127087 ?auto_2127084 )
      ( MAKE-2CRATE ?auto_2127086 ?auto_2127081 ?auto_2127082 )
      ( MAKE-1CRATE-VERIFY ?auto_2127081 ?auto_2127082 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2127088 - SURFACE
      ?auto_2127089 - SURFACE
      ?auto_2127090 - SURFACE
    )
    :vars
    (
      ?auto_2127092 - HOIST
      ?auto_2127094 - PLACE
      ?auto_2127091 - TRUCK
      ?auto_2127093 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127092 ?auto_2127094 ) ( SURFACE-AT ?auto_2127089 ?auto_2127094 ) ( CLEAR ?auto_2127089 ) ( IS-CRATE ?auto_2127090 ) ( not ( = ?auto_2127089 ?auto_2127090 ) ) ( AVAILABLE ?auto_2127092 ) ( IN ?auto_2127090 ?auto_2127091 ) ( ON ?auto_2127089 ?auto_2127088 ) ( not ( = ?auto_2127088 ?auto_2127089 ) ) ( not ( = ?auto_2127088 ?auto_2127090 ) ) ( TRUCK-AT ?auto_2127091 ?auto_2127093 ) ( not ( = ?auto_2127093 ?auto_2127094 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2127089 ?auto_2127090 )
      ( MAKE-2CRATE-VERIFY ?auto_2127088 ?auto_2127089 ?auto_2127090 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2127095 - SURFACE
      ?auto_2127096 - SURFACE
    )
    :vars
    (
      ?auto_2127099 - HOIST
      ?auto_2127100 - PLACE
      ?auto_2127098 - SURFACE
      ?auto_2127101 - TRUCK
      ?auto_2127097 - PLACE
      ?auto_2127102 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127099 ?auto_2127100 ) ( SURFACE-AT ?auto_2127095 ?auto_2127100 ) ( CLEAR ?auto_2127095 ) ( IS-CRATE ?auto_2127096 ) ( not ( = ?auto_2127095 ?auto_2127096 ) ) ( AVAILABLE ?auto_2127099 ) ( ON ?auto_2127095 ?auto_2127098 ) ( not ( = ?auto_2127098 ?auto_2127095 ) ) ( not ( = ?auto_2127098 ?auto_2127096 ) ) ( TRUCK-AT ?auto_2127101 ?auto_2127097 ) ( not ( = ?auto_2127097 ?auto_2127100 ) ) ( HOIST-AT ?auto_2127102 ?auto_2127097 ) ( LIFTING ?auto_2127102 ?auto_2127096 ) ( not ( = ?auto_2127099 ?auto_2127102 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2127102 ?auto_2127096 ?auto_2127101 ?auto_2127097 )
      ( MAKE-2CRATE ?auto_2127098 ?auto_2127095 ?auto_2127096 )
      ( MAKE-1CRATE-VERIFY ?auto_2127095 ?auto_2127096 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2127103 - SURFACE
      ?auto_2127104 - SURFACE
      ?auto_2127105 - SURFACE
    )
    :vars
    (
      ?auto_2127106 - HOIST
      ?auto_2127110 - PLACE
      ?auto_2127109 - TRUCK
      ?auto_2127107 - PLACE
      ?auto_2127108 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127106 ?auto_2127110 ) ( SURFACE-AT ?auto_2127104 ?auto_2127110 ) ( CLEAR ?auto_2127104 ) ( IS-CRATE ?auto_2127105 ) ( not ( = ?auto_2127104 ?auto_2127105 ) ) ( AVAILABLE ?auto_2127106 ) ( ON ?auto_2127104 ?auto_2127103 ) ( not ( = ?auto_2127103 ?auto_2127104 ) ) ( not ( = ?auto_2127103 ?auto_2127105 ) ) ( TRUCK-AT ?auto_2127109 ?auto_2127107 ) ( not ( = ?auto_2127107 ?auto_2127110 ) ) ( HOIST-AT ?auto_2127108 ?auto_2127107 ) ( LIFTING ?auto_2127108 ?auto_2127105 ) ( not ( = ?auto_2127106 ?auto_2127108 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2127104 ?auto_2127105 )
      ( MAKE-2CRATE-VERIFY ?auto_2127103 ?auto_2127104 ?auto_2127105 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2127111 - SURFACE
      ?auto_2127112 - SURFACE
    )
    :vars
    (
      ?auto_2127117 - HOIST
      ?auto_2127116 - PLACE
      ?auto_2127118 - SURFACE
      ?auto_2127114 - TRUCK
      ?auto_2127113 - PLACE
      ?auto_2127115 - HOIST
      ?auto_2127119 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127117 ?auto_2127116 ) ( SURFACE-AT ?auto_2127111 ?auto_2127116 ) ( CLEAR ?auto_2127111 ) ( IS-CRATE ?auto_2127112 ) ( not ( = ?auto_2127111 ?auto_2127112 ) ) ( AVAILABLE ?auto_2127117 ) ( ON ?auto_2127111 ?auto_2127118 ) ( not ( = ?auto_2127118 ?auto_2127111 ) ) ( not ( = ?auto_2127118 ?auto_2127112 ) ) ( TRUCK-AT ?auto_2127114 ?auto_2127113 ) ( not ( = ?auto_2127113 ?auto_2127116 ) ) ( HOIST-AT ?auto_2127115 ?auto_2127113 ) ( not ( = ?auto_2127117 ?auto_2127115 ) ) ( AVAILABLE ?auto_2127115 ) ( SURFACE-AT ?auto_2127112 ?auto_2127113 ) ( ON ?auto_2127112 ?auto_2127119 ) ( CLEAR ?auto_2127112 ) ( not ( = ?auto_2127111 ?auto_2127119 ) ) ( not ( = ?auto_2127112 ?auto_2127119 ) ) ( not ( = ?auto_2127118 ?auto_2127119 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2127115 ?auto_2127112 ?auto_2127119 ?auto_2127113 )
      ( MAKE-2CRATE ?auto_2127118 ?auto_2127111 ?auto_2127112 )
      ( MAKE-1CRATE-VERIFY ?auto_2127111 ?auto_2127112 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2127120 - SURFACE
      ?auto_2127121 - SURFACE
      ?auto_2127122 - SURFACE
    )
    :vars
    (
      ?auto_2127124 - HOIST
      ?auto_2127126 - PLACE
      ?auto_2127127 - TRUCK
      ?auto_2127123 - PLACE
      ?auto_2127128 - HOIST
      ?auto_2127125 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127124 ?auto_2127126 ) ( SURFACE-AT ?auto_2127121 ?auto_2127126 ) ( CLEAR ?auto_2127121 ) ( IS-CRATE ?auto_2127122 ) ( not ( = ?auto_2127121 ?auto_2127122 ) ) ( AVAILABLE ?auto_2127124 ) ( ON ?auto_2127121 ?auto_2127120 ) ( not ( = ?auto_2127120 ?auto_2127121 ) ) ( not ( = ?auto_2127120 ?auto_2127122 ) ) ( TRUCK-AT ?auto_2127127 ?auto_2127123 ) ( not ( = ?auto_2127123 ?auto_2127126 ) ) ( HOIST-AT ?auto_2127128 ?auto_2127123 ) ( not ( = ?auto_2127124 ?auto_2127128 ) ) ( AVAILABLE ?auto_2127128 ) ( SURFACE-AT ?auto_2127122 ?auto_2127123 ) ( ON ?auto_2127122 ?auto_2127125 ) ( CLEAR ?auto_2127122 ) ( not ( = ?auto_2127121 ?auto_2127125 ) ) ( not ( = ?auto_2127122 ?auto_2127125 ) ) ( not ( = ?auto_2127120 ?auto_2127125 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2127121 ?auto_2127122 )
      ( MAKE-2CRATE-VERIFY ?auto_2127120 ?auto_2127121 ?auto_2127122 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2127129 - SURFACE
      ?auto_2127130 - SURFACE
    )
    :vars
    (
      ?auto_2127135 - HOIST
      ?auto_2127131 - PLACE
      ?auto_2127132 - SURFACE
      ?auto_2127133 - PLACE
      ?auto_2127134 - HOIST
      ?auto_2127136 - SURFACE
      ?auto_2127137 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127135 ?auto_2127131 ) ( SURFACE-AT ?auto_2127129 ?auto_2127131 ) ( CLEAR ?auto_2127129 ) ( IS-CRATE ?auto_2127130 ) ( not ( = ?auto_2127129 ?auto_2127130 ) ) ( AVAILABLE ?auto_2127135 ) ( ON ?auto_2127129 ?auto_2127132 ) ( not ( = ?auto_2127132 ?auto_2127129 ) ) ( not ( = ?auto_2127132 ?auto_2127130 ) ) ( not ( = ?auto_2127133 ?auto_2127131 ) ) ( HOIST-AT ?auto_2127134 ?auto_2127133 ) ( not ( = ?auto_2127135 ?auto_2127134 ) ) ( AVAILABLE ?auto_2127134 ) ( SURFACE-AT ?auto_2127130 ?auto_2127133 ) ( ON ?auto_2127130 ?auto_2127136 ) ( CLEAR ?auto_2127130 ) ( not ( = ?auto_2127129 ?auto_2127136 ) ) ( not ( = ?auto_2127130 ?auto_2127136 ) ) ( not ( = ?auto_2127132 ?auto_2127136 ) ) ( TRUCK-AT ?auto_2127137 ?auto_2127131 ) )
    :subtasks
    ( ( !DRIVE ?auto_2127137 ?auto_2127131 ?auto_2127133 )
      ( MAKE-2CRATE ?auto_2127132 ?auto_2127129 ?auto_2127130 )
      ( MAKE-1CRATE-VERIFY ?auto_2127129 ?auto_2127130 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2127138 - SURFACE
      ?auto_2127139 - SURFACE
      ?auto_2127140 - SURFACE
    )
    :vars
    (
      ?auto_2127143 - HOIST
      ?auto_2127142 - PLACE
      ?auto_2127141 - PLACE
      ?auto_2127144 - HOIST
      ?auto_2127146 - SURFACE
      ?auto_2127145 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127143 ?auto_2127142 ) ( SURFACE-AT ?auto_2127139 ?auto_2127142 ) ( CLEAR ?auto_2127139 ) ( IS-CRATE ?auto_2127140 ) ( not ( = ?auto_2127139 ?auto_2127140 ) ) ( AVAILABLE ?auto_2127143 ) ( ON ?auto_2127139 ?auto_2127138 ) ( not ( = ?auto_2127138 ?auto_2127139 ) ) ( not ( = ?auto_2127138 ?auto_2127140 ) ) ( not ( = ?auto_2127141 ?auto_2127142 ) ) ( HOIST-AT ?auto_2127144 ?auto_2127141 ) ( not ( = ?auto_2127143 ?auto_2127144 ) ) ( AVAILABLE ?auto_2127144 ) ( SURFACE-AT ?auto_2127140 ?auto_2127141 ) ( ON ?auto_2127140 ?auto_2127146 ) ( CLEAR ?auto_2127140 ) ( not ( = ?auto_2127139 ?auto_2127146 ) ) ( not ( = ?auto_2127140 ?auto_2127146 ) ) ( not ( = ?auto_2127138 ?auto_2127146 ) ) ( TRUCK-AT ?auto_2127145 ?auto_2127142 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2127139 ?auto_2127140 )
      ( MAKE-2CRATE-VERIFY ?auto_2127138 ?auto_2127139 ?auto_2127140 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2127147 - SURFACE
      ?auto_2127148 - SURFACE
    )
    :vars
    (
      ?auto_2127154 - HOIST
      ?auto_2127151 - PLACE
      ?auto_2127149 - SURFACE
      ?auto_2127155 - PLACE
      ?auto_2127152 - HOIST
      ?auto_2127153 - SURFACE
      ?auto_2127150 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127154 ?auto_2127151 ) ( IS-CRATE ?auto_2127148 ) ( not ( = ?auto_2127147 ?auto_2127148 ) ) ( not ( = ?auto_2127149 ?auto_2127147 ) ) ( not ( = ?auto_2127149 ?auto_2127148 ) ) ( not ( = ?auto_2127155 ?auto_2127151 ) ) ( HOIST-AT ?auto_2127152 ?auto_2127155 ) ( not ( = ?auto_2127154 ?auto_2127152 ) ) ( AVAILABLE ?auto_2127152 ) ( SURFACE-AT ?auto_2127148 ?auto_2127155 ) ( ON ?auto_2127148 ?auto_2127153 ) ( CLEAR ?auto_2127148 ) ( not ( = ?auto_2127147 ?auto_2127153 ) ) ( not ( = ?auto_2127148 ?auto_2127153 ) ) ( not ( = ?auto_2127149 ?auto_2127153 ) ) ( TRUCK-AT ?auto_2127150 ?auto_2127151 ) ( SURFACE-AT ?auto_2127149 ?auto_2127151 ) ( CLEAR ?auto_2127149 ) ( LIFTING ?auto_2127154 ?auto_2127147 ) ( IS-CRATE ?auto_2127147 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2127149 ?auto_2127147 )
      ( MAKE-2CRATE ?auto_2127149 ?auto_2127147 ?auto_2127148 )
      ( MAKE-1CRATE-VERIFY ?auto_2127147 ?auto_2127148 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2127156 - SURFACE
      ?auto_2127157 - SURFACE
      ?auto_2127158 - SURFACE
    )
    :vars
    (
      ?auto_2127161 - HOIST
      ?auto_2127162 - PLACE
      ?auto_2127159 - PLACE
      ?auto_2127163 - HOIST
      ?auto_2127160 - SURFACE
      ?auto_2127164 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127161 ?auto_2127162 ) ( IS-CRATE ?auto_2127158 ) ( not ( = ?auto_2127157 ?auto_2127158 ) ) ( not ( = ?auto_2127156 ?auto_2127157 ) ) ( not ( = ?auto_2127156 ?auto_2127158 ) ) ( not ( = ?auto_2127159 ?auto_2127162 ) ) ( HOIST-AT ?auto_2127163 ?auto_2127159 ) ( not ( = ?auto_2127161 ?auto_2127163 ) ) ( AVAILABLE ?auto_2127163 ) ( SURFACE-AT ?auto_2127158 ?auto_2127159 ) ( ON ?auto_2127158 ?auto_2127160 ) ( CLEAR ?auto_2127158 ) ( not ( = ?auto_2127157 ?auto_2127160 ) ) ( not ( = ?auto_2127158 ?auto_2127160 ) ) ( not ( = ?auto_2127156 ?auto_2127160 ) ) ( TRUCK-AT ?auto_2127164 ?auto_2127162 ) ( SURFACE-AT ?auto_2127156 ?auto_2127162 ) ( CLEAR ?auto_2127156 ) ( LIFTING ?auto_2127161 ?auto_2127157 ) ( IS-CRATE ?auto_2127157 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2127157 ?auto_2127158 )
      ( MAKE-2CRATE-VERIFY ?auto_2127156 ?auto_2127157 ?auto_2127158 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2127165 - SURFACE
      ?auto_2127166 - SURFACE
    )
    :vars
    (
      ?auto_2127173 - HOIST
      ?auto_2127167 - PLACE
      ?auto_2127169 - SURFACE
      ?auto_2127168 - PLACE
      ?auto_2127172 - HOIST
      ?auto_2127170 - SURFACE
      ?auto_2127171 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127173 ?auto_2127167 ) ( IS-CRATE ?auto_2127166 ) ( not ( = ?auto_2127165 ?auto_2127166 ) ) ( not ( = ?auto_2127169 ?auto_2127165 ) ) ( not ( = ?auto_2127169 ?auto_2127166 ) ) ( not ( = ?auto_2127168 ?auto_2127167 ) ) ( HOIST-AT ?auto_2127172 ?auto_2127168 ) ( not ( = ?auto_2127173 ?auto_2127172 ) ) ( AVAILABLE ?auto_2127172 ) ( SURFACE-AT ?auto_2127166 ?auto_2127168 ) ( ON ?auto_2127166 ?auto_2127170 ) ( CLEAR ?auto_2127166 ) ( not ( = ?auto_2127165 ?auto_2127170 ) ) ( not ( = ?auto_2127166 ?auto_2127170 ) ) ( not ( = ?auto_2127169 ?auto_2127170 ) ) ( TRUCK-AT ?auto_2127171 ?auto_2127167 ) ( SURFACE-AT ?auto_2127169 ?auto_2127167 ) ( CLEAR ?auto_2127169 ) ( IS-CRATE ?auto_2127165 ) ( AVAILABLE ?auto_2127173 ) ( IN ?auto_2127165 ?auto_2127171 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2127173 ?auto_2127165 ?auto_2127171 ?auto_2127167 )
      ( MAKE-2CRATE ?auto_2127169 ?auto_2127165 ?auto_2127166 )
      ( MAKE-1CRATE-VERIFY ?auto_2127165 ?auto_2127166 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2127174 - SURFACE
      ?auto_2127175 - SURFACE
      ?auto_2127176 - SURFACE
    )
    :vars
    (
      ?auto_2127182 - HOIST
      ?auto_2127180 - PLACE
      ?auto_2127178 - PLACE
      ?auto_2127181 - HOIST
      ?auto_2127179 - SURFACE
      ?auto_2127177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127182 ?auto_2127180 ) ( IS-CRATE ?auto_2127176 ) ( not ( = ?auto_2127175 ?auto_2127176 ) ) ( not ( = ?auto_2127174 ?auto_2127175 ) ) ( not ( = ?auto_2127174 ?auto_2127176 ) ) ( not ( = ?auto_2127178 ?auto_2127180 ) ) ( HOIST-AT ?auto_2127181 ?auto_2127178 ) ( not ( = ?auto_2127182 ?auto_2127181 ) ) ( AVAILABLE ?auto_2127181 ) ( SURFACE-AT ?auto_2127176 ?auto_2127178 ) ( ON ?auto_2127176 ?auto_2127179 ) ( CLEAR ?auto_2127176 ) ( not ( = ?auto_2127175 ?auto_2127179 ) ) ( not ( = ?auto_2127176 ?auto_2127179 ) ) ( not ( = ?auto_2127174 ?auto_2127179 ) ) ( TRUCK-AT ?auto_2127177 ?auto_2127180 ) ( SURFACE-AT ?auto_2127174 ?auto_2127180 ) ( CLEAR ?auto_2127174 ) ( IS-CRATE ?auto_2127175 ) ( AVAILABLE ?auto_2127182 ) ( IN ?auto_2127175 ?auto_2127177 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2127175 ?auto_2127176 )
      ( MAKE-2CRATE-VERIFY ?auto_2127174 ?auto_2127175 ?auto_2127176 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2127219 - SURFACE
      ?auto_2127220 - SURFACE
    )
    :vars
    (
      ?auto_2127221 - HOIST
      ?auto_2127226 - PLACE
      ?auto_2127225 - SURFACE
      ?auto_2127227 - PLACE
      ?auto_2127223 - HOIST
      ?auto_2127224 - SURFACE
      ?auto_2127222 - TRUCK
      ?auto_2127228 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127221 ?auto_2127226 ) ( SURFACE-AT ?auto_2127219 ?auto_2127226 ) ( CLEAR ?auto_2127219 ) ( IS-CRATE ?auto_2127220 ) ( not ( = ?auto_2127219 ?auto_2127220 ) ) ( AVAILABLE ?auto_2127221 ) ( ON ?auto_2127219 ?auto_2127225 ) ( not ( = ?auto_2127225 ?auto_2127219 ) ) ( not ( = ?auto_2127225 ?auto_2127220 ) ) ( not ( = ?auto_2127227 ?auto_2127226 ) ) ( HOIST-AT ?auto_2127223 ?auto_2127227 ) ( not ( = ?auto_2127221 ?auto_2127223 ) ) ( AVAILABLE ?auto_2127223 ) ( SURFACE-AT ?auto_2127220 ?auto_2127227 ) ( ON ?auto_2127220 ?auto_2127224 ) ( CLEAR ?auto_2127220 ) ( not ( = ?auto_2127219 ?auto_2127224 ) ) ( not ( = ?auto_2127220 ?auto_2127224 ) ) ( not ( = ?auto_2127225 ?auto_2127224 ) ) ( TRUCK-AT ?auto_2127222 ?auto_2127228 ) ( not ( = ?auto_2127228 ?auto_2127226 ) ) ( not ( = ?auto_2127227 ?auto_2127228 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2127222 ?auto_2127228 ?auto_2127226 )
      ( MAKE-1CRATE ?auto_2127219 ?auto_2127220 )
      ( MAKE-1CRATE-VERIFY ?auto_2127219 ?auto_2127220 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2127258 - SURFACE
      ?auto_2127259 - SURFACE
      ?auto_2127260 - SURFACE
      ?auto_2127261 - SURFACE
    )
    :vars
    (
      ?auto_2127262 - HOIST
      ?auto_2127263 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127262 ?auto_2127263 ) ( SURFACE-AT ?auto_2127260 ?auto_2127263 ) ( CLEAR ?auto_2127260 ) ( LIFTING ?auto_2127262 ?auto_2127261 ) ( IS-CRATE ?auto_2127261 ) ( not ( = ?auto_2127260 ?auto_2127261 ) ) ( ON ?auto_2127259 ?auto_2127258 ) ( ON ?auto_2127260 ?auto_2127259 ) ( not ( = ?auto_2127258 ?auto_2127259 ) ) ( not ( = ?auto_2127258 ?auto_2127260 ) ) ( not ( = ?auto_2127258 ?auto_2127261 ) ) ( not ( = ?auto_2127259 ?auto_2127260 ) ) ( not ( = ?auto_2127259 ?auto_2127261 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2127260 ?auto_2127261 )
      ( MAKE-3CRATE-VERIFY ?auto_2127258 ?auto_2127259 ?auto_2127260 ?auto_2127261 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2127275 - SURFACE
      ?auto_2127276 - SURFACE
      ?auto_2127277 - SURFACE
      ?auto_2127278 - SURFACE
    )
    :vars
    (
      ?auto_2127279 - HOIST
      ?auto_2127281 - PLACE
      ?auto_2127280 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127279 ?auto_2127281 ) ( SURFACE-AT ?auto_2127277 ?auto_2127281 ) ( CLEAR ?auto_2127277 ) ( IS-CRATE ?auto_2127278 ) ( not ( = ?auto_2127277 ?auto_2127278 ) ) ( TRUCK-AT ?auto_2127280 ?auto_2127281 ) ( AVAILABLE ?auto_2127279 ) ( IN ?auto_2127278 ?auto_2127280 ) ( ON ?auto_2127277 ?auto_2127276 ) ( not ( = ?auto_2127276 ?auto_2127277 ) ) ( not ( = ?auto_2127276 ?auto_2127278 ) ) ( ON ?auto_2127276 ?auto_2127275 ) ( not ( = ?auto_2127275 ?auto_2127276 ) ) ( not ( = ?auto_2127275 ?auto_2127277 ) ) ( not ( = ?auto_2127275 ?auto_2127278 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2127276 ?auto_2127277 ?auto_2127278 )
      ( MAKE-3CRATE-VERIFY ?auto_2127275 ?auto_2127276 ?auto_2127277 ?auto_2127278 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2127296 - SURFACE
      ?auto_2127297 - SURFACE
      ?auto_2127298 - SURFACE
      ?auto_2127299 - SURFACE
    )
    :vars
    (
      ?auto_2127303 - HOIST
      ?auto_2127300 - PLACE
      ?auto_2127301 - TRUCK
      ?auto_2127302 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127303 ?auto_2127300 ) ( SURFACE-AT ?auto_2127298 ?auto_2127300 ) ( CLEAR ?auto_2127298 ) ( IS-CRATE ?auto_2127299 ) ( not ( = ?auto_2127298 ?auto_2127299 ) ) ( AVAILABLE ?auto_2127303 ) ( IN ?auto_2127299 ?auto_2127301 ) ( ON ?auto_2127298 ?auto_2127297 ) ( not ( = ?auto_2127297 ?auto_2127298 ) ) ( not ( = ?auto_2127297 ?auto_2127299 ) ) ( TRUCK-AT ?auto_2127301 ?auto_2127302 ) ( not ( = ?auto_2127302 ?auto_2127300 ) ) ( ON ?auto_2127297 ?auto_2127296 ) ( not ( = ?auto_2127296 ?auto_2127297 ) ) ( not ( = ?auto_2127296 ?auto_2127298 ) ) ( not ( = ?auto_2127296 ?auto_2127299 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2127297 ?auto_2127298 ?auto_2127299 )
      ( MAKE-3CRATE-VERIFY ?auto_2127296 ?auto_2127297 ?auto_2127298 ?auto_2127299 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2127320 - SURFACE
      ?auto_2127321 - SURFACE
      ?auto_2127322 - SURFACE
      ?auto_2127323 - SURFACE
    )
    :vars
    (
      ?auto_2127324 - HOIST
      ?auto_2127325 - PLACE
      ?auto_2127327 - TRUCK
      ?auto_2127326 - PLACE
      ?auto_2127328 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127324 ?auto_2127325 ) ( SURFACE-AT ?auto_2127322 ?auto_2127325 ) ( CLEAR ?auto_2127322 ) ( IS-CRATE ?auto_2127323 ) ( not ( = ?auto_2127322 ?auto_2127323 ) ) ( AVAILABLE ?auto_2127324 ) ( ON ?auto_2127322 ?auto_2127321 ) ( not ( = ?auto_2127321 ?auto_2127322 ) ) ( not ( = ?auto_2127321 ?auto_2127323 ) ) ( TRUCK-AT ?auto_2127327 ?auto_2127326 ) ( not ( = ?auto_2127326 ?auto_2127325 ) ) ( HOIST-AT ?auto_2127328 ?auto_2127326 ) ( LIFTING ?auto_2127328 ?auto_2127323 ) ( not ( = ?auto_2127324 ?auto_2127328 ) ) ( ON ?auto_2127321 ?auto_2127320 ) ( not ( = ?auto_2127320 ?auto_2127321 ) ) ( not ( = ?auto_2127320 ?auto_2127322 ) ) ( not ( = ?auto_2127320 ?auto_2127323 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2127321 ?auto_2127322 ?auto_2127323 )
      ( MAKE-3CRATE-VERIFY ?auto_2127320 ?auto_2127321 ?auto_2127322 ?auto_2127323 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2127347 - SURFACE
      ?auto_2127348 - SURFACE
      ?auto_2127349 - SURFACE
      ?auto_2127350 - SURFACE
    )
    :vars
    (
      ?auto_2127352 - HOIST
      ?auto_2127354 - PLACE
      ?auto_2127353 - TRUCK
      ?auto_2127356 - PLACE
      ?auto_2127355 - HOIST
      ?auto_2127351 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127352 ?auto_2127354 ) ( SURFACE-AT ?auto_2127349 ?auto_2127354 ) ( CLEAR ?auto_2127349 ) ( IS-CRATE ?auto_2127350 ) ( not ( = ?auto_2127349 ?auto_2127350 ) ) ( AVAILABLE ?auto_2127352 ) ( ON ?auto_2127349 ?auto_2127348 ) ( not ( = ?auto_2127348 ?auto_2127349 ) ) ( not ( = ?auto_2127348 ?auto_2127350 ) ) ( TRUCK-AT ?auto_2127353 ?auto_2127356 ) ( not ( = ?auto_2127356 ?auto_2127354 ) ) ( HOIST-AT ?auto_2127355 ?auto_2127356 ) ( not ( = ?auto_2127352 ?auto_2127355 ) ) ( AVAILABLE ?auto_2127355 ) ( SURFACE-AT ?auto_2127350 ?auto_2127356 ) ( ON ?auto_2127350 ?auto_2127351 ) ( CLEAR ?auto_2127350 ) ( not ( = ?auto_2127349 ?auto_2127351 ) ) ( not ( = ?auto_2127350 ?auto_2127351 ) ) ( not ( = ?auto_2127348 ?auto_2127351 ) ) ( ON ?auto_2127348 ?auto_2127347 ) ( not ( = ?auto_2127347 ?auto_2127348 ) ) ( not ( = ?auto_2127347 ?auto_2127349 ) ) ( not ( = ?auto_2127347 ?auto_2127350 ) ) ( not ( = ?auto_2127347 ?auto_2127351 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2127348 ?auto_2127349 ?auto_2127350 )
      ( MAKE-3CRATE-VERIFY ?auto_2127347 ?auto_2127348 ?auto_2127349 ?auto_2127350 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2127375 - SURFACE
      ?auto_2127376 - SURFACE
      ?auto_2127377 - SURFACE
      ?auto_2127378 - SURFACE
    )
    :vars
    (
      ?auto_2127384 - HOIST
      ?auto_2127379 - PLACE
      ?auto_2127380 - PLACE
      ?auto_2127381 - HOIST
      ?auto_2127383 - SURFACE
      ?auto_2127382 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127384 ?auto_2127379 ) ( SURFACE-AT ?auto_2127377 ?auto_2127379 ) ( CLEAR ?auto_2127377 ) ( IS-CRATE ?auto_2127378 ) ( not ( = ?auto_2127377 ?auto_2127378 ) ) ( AVAILABLE ?auto_2127384 ) ( ON ?auto_2127377 ?auto_2127376 ) ( not ( = ?auto_2127376 ?auto_2127377 ) ) ( not ( = ?auto_2127376 ?auto_2127378 ) ) ( not ( = ?auto_2127380 ?auto_2127379 ) ) ( HOIST-AT ?auto_2127381 ?auto_2127380 ) ( not ( = ?auto_2127384 ?auto_2127381 ) ) ( AVAILABLE ?auto_2127381 ) ( SURFACE-AT ?auto_2127378 ?auto_2127380 ) ( ON ?auto_2127378 ?auto_2127383 ) ( CLEAR ?auto_2127378 ) ( not ( = ?auto_2127377 ?auto_2127383 ) ) ( not ( = ?auto_2127378 ?auto_2127383 ) ) ( not ( = ?auto_2127376 ?auto_2127383 ) ) ( TRUCK-AT ?auto_2127382 ?auto_2127379 ) ( ON ?auto_2127376 ?auto_2127375 ) ( not ( = ?auto_2127375 ?auto_2127376 ) ) ( not ( = ?auto_2127375 ?auto_2127377 ) ) ( not ( = ?auto_2127375 ?auto_2127378 ) ) ( not ( = ?auto_2127375 ?auto_2127383 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2127376 ?auto_2127377 ?auto_2127378 )
      ( MAKE-3CRATE-VERIFY ?auto_2127375 ?auto_2127376 ?auto_2127377 ?auto_2127378 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2127403 - SURFACE
      ?auto_2127404 - SURFACE
      ?auto_2127405 - SURFACE
      ?auto_2127406 - SURFACE
    )
    :vars
    (
      ?auto_2127409 - HOIST
      ?auto_2127407 - PLACE
      ?auto_2127410 - PLACE
      ?auto_2127411 - HOIST
      ?auto_2127412 - SURFACE
      ?auto_2127408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127409 ?auto_2127407 ) ( IS-CRATE ?auto_2127406 ) ( not ( = ?auto_2127405 ?auto_2127406 ) ) ( not ( = ?auto_2127404 ?auto_2127405 ) ) ( not ( = ?auto_2127404 ?auto_2127406 ) ) ( not ( = ?auto_2127410 ?auto_2127407 ) ) ( HOIST-AT ?auto_2127411 ?auto_2127410 ) ( not ( = ?auto_2127409 ?auto_2127411 ) ) ( AVAILABLE ?auto_2127411 ) ( SURFACE-AT ?auto_2127406 ?auto_2127410 ) ( ON ?auto_2127406 ?auto_2127412 ) ( CLEAR ?auto_2127406 ) ( not ( = ?auto_2127405 ?auto_2127412 ) ) ( not ( = ?auto_2127406 ?auto_2127412 ) ) ( not ( = ?auto_2127404 ?auto_2127412 ) ) ( TRUCK-AT ?auto_2127408 ?auto_2127407 ) ( SURFACE-AT ?auto_2127404 ?auto_2127407 ) ( CLEAR ?auto_2127404 ) ( LIFTING ?auto_2127409 ?auto_2127405 ) ( IS-CRATE ?auto_2127405 ) ( ON ?auto_2127404 ?auto_2127403 ) ( not ( = ?auto_2127403 ?auto_2127404 ) ) ( not ( = ?auto_2127403 ?auto_2127405 ) ) ( not ( = ?auto_2127403 ?auto_2127406 ) ) ( not ( = ?auto_2127403 ?auto_2127412 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2127404 ?auto_2127405 ?auto_2127406 )
      ( MAKE-3CRATE-VERIFY ?auto_2127403 ?auto_2127404 ?auto_2127405 ?auto_2127406 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2127431 - SURFACE
      ?auto_2127432 - SURFACE
      ?auto_2127433 - SURFACE
      ?auto_2127434 - SURFACE
    )
    :vars
    (
      ?auto_2127439 - HOIST
      ?auto_2127436 - PLACE
      ?auto_2127437 - PLACE
      ?auto_2127438 - HOIST
      ?auto_2127440 - SURFACE
      ?auto_2127435 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127439 ?auto_2127436 ) ( IS-CRATE ?auto_2127434 ) ( not ( = ?auto_2127433 ?auto_2127434 ) ) ( not ( = ?auto_2127432 ?auto_2127433 ) ) ( not ( = ?auto_2127432 ?auto_2127434 ) ) ( not ( = ?auto_2127437 ?auto_2127436 ) ) ( HOIST-AT ?auto_2127438 ?auto_2127437 ) ( not ( = ?auto_2127439 ?auto_2127438 ) ) ( AVAILABLE ?auto_2127438 ) ( SURFACE-AT ?auto_2127434 ?auto_2127437 ) ( ON ?auto_2127434 ?auto_2127440 ) ( CLEAR ?auto_2127434 ) ( not ( = ?auto_2127433 ?auto_2127440 ) ) ( not ( = ?auto_2127434 ?auto_2127440 ) ) ( not ( = ?auto_2127432 ?auto_2127440 ) ) ( TRUCK-AT ?auto_2127435 ?auto_2127436 ) ( SURFACE-AT ?auto_2127432 ?auto_2127436 ) ( CLEAR ?auto_2127432 ) ( IS-CRATE ?auto_2127433 ) ( AVAILABLE ?auto_2127439 ) ( IN ?auto_2127433 ?auto_2127435 ) ( ON ?auto_2127432 ?auto_2127431 ) ( not ( = ?auto_2127431 ?auto_2127432 ) ) ( not ( = ?auto_2127431 ?auto_2127433 ) ) ( not ( = ?auto_2127431 ?auto_2127434 ) ) ( not ( = ?auto_2127431 ?auto_2127440 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2127432 ?auto_2127433 ?auto_2127434 )
      ( MAKE-3CRATE-VERIFY ?auto_2127431 ?auto_2127432 ?auto_2127433 ?auto_2127434 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2127722 - SURFACE
      ?auto_2127723 - SURFACE
      ?auto_2127724 - SURFACE
      ?auto_2127726 - SURFACE
      ?auto_2127725 - SURFACE
    )
    :vars
    (
      ?auto_2127728 - HOIST
      ?auto_2127727 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127728 ?auto_2127727 ) ( SURFACE-AT ?auto_2127726 ?auto_2127727 ) ( CLEAR ?auto_2127726 ) ( LIFTING ?auto_2127728 ?auto_2127725 ) ( IS-CRATE ?auto_2127725 ) ( not ( = ?auto_2127726 ?auto_2127725 ) ) ( ON ?auto_2127723 ?auto_2127722 ) ( ON ?auto_2127724 ?auto_2127723 ) ( ON ?auto_2127726 ?auto_2127724 ) ( not ( = ?auto_2127722 ?auto_2127723 ) ) ( not ( = ?auto_2127722 ?auto_2127724 ) ) ( not ( = ?auto_2127722 ?auto_2127726 ) ) ( not ( = ?auto_2127722 ?auto_2127725 ) ) ( not ( = ?auto_2127723 ?auto_2127724 ) ) ( not ( = ?auto_2127723 ?auto_2127726 ) ) ( not ( = ?auto_2127723 ?auto_2127725 ) ) ( not ( = ?auto_2127724 ?auto_2127726 ) ) ( not ( = ?auto_2127724 ?auto_2127725 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2127726 ?auto_2127725 )
      ( MAKE-4CRATE-VERIFY ?auto_2127722 ?auto_2127723 ?auto_2127724 ?auto_2127726 ?auto_2127725 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2127747 - SURFACE
      ?auto_2127748 - SURFACE
      ?auto_2127749 - SURFACE
      ?auto_2127751 - SURFACE
      ?auto_2127750 - SURFACE
    )
    :vars
    (
      ?auto_2127753 - HOIST
      ?auto_2127752 - PLACE
      ?auto_2127754 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127753 ?auto_2127752 ) ( SURFACE-AT ?auto_2127751 ?auto_2127752 ) ( CLEAR ?auto_2127751 ) ( IS-CRATE ?auto_2127750 ) ( not ( = ?auto_2127751 ?auto_2127750 ) ) ( TRUCK-AT ?auto_2127754 ?auto_2127752 ) ( AVAILABLE ?auto_2127753 ) ( IN ?auto_2127750 ?auto_2127754 ) ( ON ?auto_2127751 ?auto_2127749 ) ( not ( = ?auto_2127749 ?auto_2127751 ) ) ( not ( = ?auto_2127749 ?auto_2127750 ) ) ( ON ?auto_2127748 ?auto_2127747 ) ( ON ?auto_2127749 ?auto_2127748 ) ( not ( = ?auto_2127747 ?auto_2127748 ) ) ( not ( = ?auto_2127747 ?auto_2127749 ) ) ( not ( = ?auto_2127747 ?auto_2127751 ) ) ( not ( = ?auto_2127747 ?auto_2127750 ) ) ( not ( = ?auto_2127748 ?auto_2127749 ) ) ( not ( = ?auto_2127748 ?auto_2127751 ) ) ( not ( = ?auto_2127748 ?auto_2127750 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2127749 ?auto_2127751 ?auto_2127750 )
      ( MAKE-4CRATE-VERIFY ?auto_2127747 ?auto_2127748 ?auto_2127749 ?auto_2127751 ?auto_2127750 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2127777 - SURFACE
      ?auto_2127778 - SURFACE
      ?auto_2127779 - SURFACE
      ?auto_2127781 - SURFACE
      ?auto_2127780 - SURFACE
    )
    :vars
    (
      ?auto_2127782 - HOIST
      ?auto_2127783 - PLACE
      ?auto_2127784 - TRUCK
      ?auto_2127785 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127782 ?auto_2127783 ) ( SURFACE-AT ?auto_2127781 ?auto_2127783 ) ( CLEAR ?auto_2127781 ) ( IS-CRATE ?auto_2127780 ) ( not ( = ?auto_2127781 ?auto_2127780 ) ) ( AVAILABLE ?auto_2127782 ) ( IN ?auto_2127780 ?auto_2127784 ) ( ON ?auto_2127781 ?auto_2127779 ) ( not ( = ?auto_2127779 ?auto_2127781 ) ) ( not ( = ?auto_2127779 ?auto_2127780 ) ) ( TRUCK-AT ?auto_2127784 ?auto_2127785 ) ( not ( = ?auto_2127785 ?auto_2127783 ) ) ( ON ?auto_2127778 ?auto_2127777 ) ( ON ?auto_2127779 ?auto_2127778 ) ( not ( = ?auto_2127777 ?auto_2127778 ) ) ( not ( = ?auto_2127777 ?auto_2127779 ) ) ( not ( = ?auto_2127777 ?auto_2127781 ) ) ( not ( = ?auto_2127777 ?auto_2127780 ) ) ( not ( = ?auto_2127778 ?auto_2127779 ) ) ( not ( = ?auto_2127778 ?auto_2127781 ) ) ( not ( = ?auto_2127778 ?auto_2127780 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2127779 ?auto_2127781 ?auto_2127780 )
      ( MAKE-4CRATE-VERIFY ?auto_2127777 ?auto_2127778 ?auto_2127779 ?auto_2127781 ?auto_2127780 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2127811 - SURFACE
      ?auto_2127812 - SURFACE
      ?auto_2127813 - SURFACE
      ?auto_2127815 - SURFACE
      ?auto_2127814 - SURFACE
    )
    :vars
    (
      ?auto_2127819 - HOIST
      ?auto_2127816 - PLACE
      ?auto_2127817 - TRUCK
      ?auto_2127818 - PLACE
      ?auto_2127820 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127819 ?auto_2127816 ) ( SURFACE-AT ?auto_2127815 ?auto_2127816 ) ( CLEAR ?auto_2127815 ) ( IS-CRATE ?auto_2127814 ) ( not ( = ?auto_2127815 ?auto_2127814 ) ) ( AVAILABLE ?auto_2127819 ) ( ON ?auto_2127815 ?auto_2127813 ) ( not ( = ?auto_2127813 ?auto_2127815 ) ) ( not ( = ?auto_2127813 ?auto_2127814 ) ) ( TRUCK-AT ?auto_2127817 ?auto_2127818 ) ( not ( = ?auto_2127818 ?auto_2127816 ) ) ( HOIST-AT ?auto_2127820 ?auto_2127818 ) ( LIFTING ?auto_2127820 ?auto_2127814 ) ( not ( = ?auto_2127819 ?auto_2127820 ) ) ( ON ?auto_2127812 ?auto_2127811 ) ( ON ?auto_2127813 ?auto_2127812 ) ( not ( = ?auto_2127811 ?auto_2127812 ) ) ( not ( = ?auto_2127811 ?auto_2127813 ) ) ( not ( = ?auto_2127811 ?auto_2127815 ) ) ( not ( = ?auto_2127811 ?auto_2127814 ) ) ( not ( = ?auto_2127812 ?auto_2127813 ) ) ( not ( = ?auto_2127812 ?auto_2127815 ) ) ( not ( = ?auto_2127812 ?auto_2127814 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2127813 ?auto_2127815 ?auto_2127814 )
      ( MAKE-4CRATE-VERIFY ?auto_2127811 ?auto_2127812 ?auto_2127813 ?auto_2127815 ?auto_2127814 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2127849 - SURFACE
      ?auto_2127850 - SURFACE
      ?auto_2127851 - SURFACE
      ?auto_2127853 - SURFACE
      ?auto_2127852 - SURFACE
    )
    :vars
    (
      ?auto_2127855 - HOIST
      ?auto_2127859 - PLACE
      ?auto_2127858 - TRUCK
      ?auto_2127856 - PLACE
      ?auto_2127854 - HOIST
      ?auto_2127857 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127855 ?auto_2127859 ) ( SURFACE-AT ?auto_2127853 ?auto_2127859 ) ( CLEAR ?auto_2127853 ) ( IS-CRATE ?auto_2127852 ) ( not ( = ?auto_2127853 ?auto_2127852 ) ) ( AVAILABLE ?auto_2127855 ) ( ON ?auto_2127853 ?auto_2127851 ) ( not ( = ?auto_2127851 ?auto_2127853 ) ) ( not ( = ?auto_2127851 ?auto_2127852 ) ) ( TRUCK-AT ?auto_2127858 ?auto_2127856 ) ( not ( = ?auto_2127856 ?auto_2127859 ) ) ( HOIST-AT ?auto_2127854 ?auto_2127856 ) ( not ( = ?auto_2127855 ?auto_2127854 ) ) ( AVAILABLE ?auto_2127854 ) ( SURFACE-AT ?auto_2127852 ?auto_2127856 ) ( ON ?auto_2127852 ?auto_2127857 ) ( CLEAR ?auto_2127852 ) ( not ( = ?auto_2127853 ?auto_2127857 ) ) ( not ( = ?auto_2127852 ?auto_2127857 ) ) ( not ( = ?auto_2127851 ?auto_2127857 ) ) ( ON ?auto_2127850 ?auto_2127849 ) ( ON ?auto_2127851 ?auto_2127850 ) ( not ( = ?auto_2127849 ?auto_2127850 ) ) ( not ( = ?auto_2127849 ?auto_2127851 ) ) ( not ( = ?auto_2127849 ?auto_2127853 ) ) ( not ( = ?auto_2127849 ?auto_2127852 ) ) ( not ( = ?auto_2127849 ?auto_2127857 ) ) ( not ( = ?auto_2127850 ?auto_2127851 ) ) ( not ( = ?auto_2127850 ?auto_2127853 ) ) ( not ( = ?auto_2127850 ?auto_2127852 ) ) ( not ( = ?auto_2127850 ?auto_2127857 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2127851 ?auto_2127853 ?auto_2127852 )
      ( MAKE-4CRATE-VERIFY ?auto_2127849 ?auto_2127850 ?auto_2127851 ?auto_2127853 ?auto_2127852 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2127888 - SURFACE
      ?auto_2127889 - SURFACE
      ?auto_2127890 - SURFACE
      ?auto_2127892 - SURFACE
      ?auto_2127891 - SURFACE
    )
    :vars
    (
      ?auto_2127895 - HOIST
      ?auto_2127897 - PLACE
      ?auto_2127898 - PLACE
      ?auto_2127896 - HOIST
      ?auto_2127893 - SURFACE
      ?auto_2127894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127895 ?auto_2127897 ) ( SURFACE-AT ?auto_2127892 ?auto_2127897 ) ( CLEAR ?auto_2127892 ) ( IS-CRATE ?auto_2127891 ) ( not ( = ?auto_2127892 ?auto_2127891 ) ) ( AVAILABLE ?auto_2127895 ) ( ON ?auto_2127892 ?auto_2127890 ) ( not ( = ?auto_2127890 ?auto_2127892 ) ) ( not ( = ?auto_2127890 ?auto_2127891 ) ) ( not ( = ?auto_2127898 ?auto_2127897 ) ) ( HOIST-AT ?auto_2127896 ?auto_2127898 ) ( not ( = ?auto_2127895 ?auto_2127896 ) ) ( AVAILABLE ?auto_2127896 ) ( SURFACE-AT ?auto_2127891 ?auto_2127898 ) ( ON ?auto_2127891 ?auto_2127893 ) ( CLEAR ?auto_2127891 ) ( not ( = ?auto_2127892 ?auto_2127893 ) ) ( not ( = ?auto_2127891 ?auto_2127893 ) ) ( not ( = ?auto_2127890 ?auto_2127893 ) ) ( TRUCK-AT ?auto_2127894 ?auto_2127897 ) ( ON ?auto_2127889 ?auto_2127888 ) ( ON ?auto_2127890 ?auto_2127889 ) ( not ( = ?auto_2127888 ?auto_2127889 ) ) ( not ( = ?auto_2127888 ?auto_2127890 ) ) ( not ( = ?auto_2127888 ?auto_2127892 ) ) ( not ( = ?auto_2127888 ?auto_2127891 ) ) ( not ( = ?auto_2127888 ?auto_2127893 ) ) ( not ( = ?auto_2127889 ?auto_2127890 ) ) ( not ( = ?auto_2127889 ?auto_2127892 ) ) ( not ( = ?auto_2127889 ?auto_2127891 ) ) ( not ( = ?auto_2127889 ?auto_2127893 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2127890 ?auto_2127892 ?auto_2127891 )
      ( MAKE-4CRATE-VERIFY ?auto_2127888 ?auto_2127889 ?auto_2127890 ?auto_2127892 ?auto_2127891 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2127927 - SURFACE
      ?auto_2127928 - SURFACE
      ?auto_2127929 - SURFACE
      ?auto_2127931 - SURFACE
      ?auto_2127930 - SURFACE
    )
    :vars
    (
      ?auto_2127932 - HOIST
      ?auto_2127933 - PLACE
      ?auto_2127936 - PLACE
      ?auto_2127937 - HOIST
      ?auto_2127934 - SURFACE
      ?auto_2127935 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127932 ?auto_2127933 ) ( IS-CRATE ?auto_2127930 ) ( not ( = ?auto_2127931 ?auto_2127930 ) ) ( not ( = ?auto_2127929 ?auto_2127931 ) ) ( not ( = ?auto_2127929 ?auto_2127930 ) ) ( not ( = ?auto_2127936 ?auto_2127933 ) ) ( HOIST-AT ?auto_2127937 ?auto_2127936 ) ( not ( = ?auto_2127932 ?auto_2127937 ) ) ( AVAILABLE ?auto_2127937 ) ( SURFACE-AT ?auto_2127930 ?auto_2127936 ) ( ON ?auto_2127930 ?auto_2127934 ) ( CLEAR ?auto_2127930 ) ( not ( = ?auto_2127931 ?auto_2127934 ) ) ( not ( = ?auto_2127930 ?auto_2127934 ) ) ( not ( = ?auto_2127929 ?auto_2127934 ) ) ( TRUCK-AT ?auto_2127935 ?auto_2127933 ) ( SURFACE-AT ?auto_2127929 ?auto_2127933 ) ( CLEAR ?auto_2127929 ) ( LIFTING ?auto_2127932 ?auto_2127931 ) ( IS-CRATE ?auto_2127931 ) ( ON ?auto_2127928 ?auto_2127927 ) ( ON ?auto_2127929 ?auto_2127928 ) ( not ( = ?auto_2127927 ?auto_2127928 ) ) ( not ( = ?auto_2127927 ?auto_2127929 ) ) ( not ( = ?auto_2127927 ?auto_2127931 ) ) ( not ( = ?auto_2127927 ?auto_2127930 ) ) ( not ( = ?auto_2127927 ?auto_2127934 ) ) ( not ( = ?auto_2127928 ?auto_2127929 ) ) ( not ( = ?auto_2127928 ?auto_2127931 ) ) ( not ( = ?auto_2127928 ?auto_2127930 ) ) ( not ( = ?auto_2127928 ?auto_2127934 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2127929 ?auto_2127931 ?auto_2127930 )
      ( MAKE-4CRATE-VERIFY ?auto_2127927 ?auto_2127928 ?auto_2127929 ?auto_2127931 ?auto_2127930 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2127966 - SURFACE
      ?auto_2127967 - SURFACE
      ?auto_2127968 - SURFACE
      ?auto_2127970 - SURFACE
      ?auto_2127969 - SURFACE
    )
    :vars
    (
      ?auto_2127976 - HOIST
      ?auto_2127974 - PLACE
      ?auto_2127972 - PLACE
      ?auto_2127973 - HOIST
      ?auto_2127975 - SURFACE
      ?auto_2127971 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2127976 ?auto_2127974 ) ( IS-CRATE ?auto_2127969 ) ( not ( = ?auto_2127970 ?auto_2127969 ) ) ( not ( = ?auto_2127968 ?auto_2127970 ) ) ( not ( = ?auto_2127968 ?auto_2127969 ) ) ( not ( = ?auto_2127972 ?auto_2127974 ) ) ( HOIST-AT ?auto_2127973 ?auto_2127972 ) ( not ( = ?auto_2127976 ?auto_2127973 ) ) ( AVAILABLE ?auto_2127973 ) ( SURFACE-AT ?auto_2127969 ?auto_2127972 ) ( ON ?auto_2127969 ?auto_2127975 ) ( CLEAR ?auto_2127969 ) ( not ( = ?auto_2127970 ?auto_2127975 ) ) ( not ( = ?auto_2127969 ?auto_2127975 ) ) ( not ( = ?auto_2127968 ?auto_2127975 ) ) ( TRUCK-AT ?auto_2127971 ?auto_2127974 ) ( SURFACE-AT ?auto_2127968 ?auto_2127974 ) ( CLEAR ?auto_2127968 ) ( IS-CRATE ?auto_2127970 ) ( AVAILABLE ?auto_2127976 ) ( IN ?auto_2127970 ?auto_2127971 ) ( ON ?auto_2127967 ?auto_2127966 ) ( ON ?auto_2127968 ?auto_2127967 ) ( not ( = ?auto_2127966 ?auto_2127967 ) ) ( not ( = ?auto_2127966 ?auto_2127968 ) ) ( not ( = ?auto_2127966 ?auto_2127970 ) ) ( not ( = ?auto_2127966 ?auto_2127969 ) ) ( not ( = ?auto_2127966 ?auto_2127975 ) ) ( not ( = ?auto_2127967 ?auto_2127968 ) ) ( not ( = ?auto_2127967 ?auto_2127970 ) ) ( not ( = ?auto_2127967 ?auto_2127969 ) ) ( not ( = ?auto_2127967 ?auto_2127975 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2127968 ?auto_2127970 ?auto_2127969 )
      ( MAKE-4CRATE-VERIFY ?auto_2127966 ?auto_2127967 ?auto_2127968 ?auto_2127970 ?auto_2127969 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2128626 - SURFACE
      ?auto_2128627 - SURFACE
      ?auto_2128628 - SURFACE
      ?auto_2128630 - SURFACE
      ?auto_2128629 - SURFACE
      ?auto_2128631 - SURFACE
    )
    :vars
    (
      ?auto_2128632 - HOIST
      ?auto_2128633 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128632 ?auto_2128633 ) ( SURFACE-AT ?auto_2128629 ?auto_2128633 ) ( CLEAR ?auto_2128629 ) ( LIFTING ?auto_2128632 ?auto_2128631 ) ( IS-CRATE ?auto_2128631 ) ( not ( = ?auto_2128629 ?auto_2128631 ) ) ( ON ?auto_2128627 ?auto_2128626 ) ( ON ?auto_2128628 ?auto_2128627 ) ( ON ?auto_2128630 ?auto_2128628 ) ( ON ?auto_2128629 ?auto_2128630 ) ( not ( = ?auto_2128626 ?auto_2128627 ) ) ( not ( = ?auto_2128626 ?auto_2128628 ) ) ( not ( = ?auto_2128626 ?auto_2128630 ) ) ( not ( = ?auto_2128626 ?auto_2128629 ) ) ( not ( = ?auto_2128626 ?auto_2128631 ) ) ( not ( = ?auto_2128627 ?auto_2128628 ) ) ( not ( = ?auto_2128627 ?auto_2128630 ) ) ( not ( = ?auto_2128627 ?auto_2128629 ) ) ( not ( = ?auto_2128627 ?auto_2128631 ) ) ( not ( = ?auto_2128628 ?auto_2128630 ) ) ( not ( = ?auto_2128628 ?auto_2128629 ) ) ( not ( = ?auto_2128628 ?auto_2128631 ) ) ( not ( = ?auto_2128630 ?auto_2128629 ) ) ( not ( = ?auto_2128630 ?auto_2128631 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2128629 ?auto_2128631 )
      ( MAKE-5CRATE-VERIFY ?auto_2128626 ?auto_2128627 ?auto_2128628 ?auto_2128630 ?auto_2128629 ?auto_2128631 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2128660 - SURFACE
      ?auto_2128661 - SURFACE
      ?auto_2128662 - SURFACE
      ?auto_2128664 - SURFACE
      ?auto_2128663 - SURFACE
      ?auto_2128665 - SURFACE
    )
    :vars
    (
      ?auto_2128667 - HOIST
      ?auto_2128666 - PLACE
      ?auto_2128668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128667 ?auto_2128666 ) ( SURFACE-AT ?auto_2128663 ?auto_2128666 ) ( CLEAR ?auto_2128663 ) ( IS-CRATE ?auto_2128665 ) ( not ( = ?auto_2128663 ?auto_2128665 ) ) ( TRUCK-AT ?auto_2128668 ?auto_2128666 ) ( AVAILABLE ?auto_2128667 ) ( IN ?auto_2128665 ?auto_2128668 ) ( ON ?auto_2128663 ?auto_2128664 ) ( not ( = ?auto_2128664 ?auto_2128663 ) ) ( not ( = ?auto_2128664 ?auto_2128665 ) ) ( ON ?auto_2128661 ?auto_2128660 ) ( ON ?auto_2128662 ?auto_2128661 ) ( ON ?auto_2128664 ?auto_2128662 ) ( not ( = ?auto_2128660 ?auto_2128661 ) ) ( not ( = ?auto_2128660 ?auto_2128662 ) ) ( not ( = ?auto_2128660 ?auto_2128664 ) ) ( not ( = ?auto_2128660 ?auto_2128663 ) ) ( not ( = ?auto_2128660 ?auto_2128665 ) ) ( not ( = ?auto_2128661 ?auto_2128662 ) ) ( not ( = ?auto_2128661 ?auto_2128664 ) ) ( not ( = ?auto_2128661 ?auto_2128663 ) ) ( not ( = ?auto_2128661 ?auto_2128665 ) ) ( not ( = ?auto_2128662 ?auto_2128664 ) ) ( not ( = ?auto_2128662 ?auto_2128663 ) ) ( not ( = ?auto_2128662 ?auto_2128665 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128664 ?auto_2128663 ?auto_2128665 )
      ( MAKE-5CRATE-VERIFY ?auto_2128660 ?auto_2128661 ?auto_2128662 ?auto_2128664 ?auto_2128663 ?auto_2128665 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2128700 - SURFACE
      ?auto_2128701 - SURFACE
      ?auto_2128702 - SURFACE
      ?auto_2128704 - SURFACE
      ?auto_2128703 - SURFACE
      ?auto_2128705 - SURFACE
    )
    :vars
    (
      ?auto_2128708 - HOIST
      ?auto_2128707 - PLACE
      ?auto_2128709 - TRUCK
      ?auto_2128706 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128708 ?auto_2128707 ) ( SURFACE-AT ?auto_2128703 ?auto_2128707 ) ( CLEAR ?auto_2128703 ) ( IS-CRATE ?auto_2128705 ) ( not ( = ?auto_2128703 ?auto_2128705 ) ) ( AVAILABLE ?auto_2128708 ) ( IN ?auto_2128705 ?auto_2128709 ) ( ON ?auto_2128703 ?auto_2128704 ) ( not ( = ?auto_2128704 ?auto_2128703 ) ) ( not ( = ?auto_2128704 ?auto_2128705 ) ) ( TRUCK-AT ?auto_2128709 ?auto_2128706 ) ( not ( = ?auto_2128706 ?auto_2128707 ) ) ( ON ?auto_2128701 ?auto_2128700 ) ( ON ?auto_2128702 ?auto_2128701 ) ( ON ?auto_2128704 ?auto_2128702 ) ( not ( = ?auto_2128700 ?auto_2128701 ) ) ( not ( = ?auto_2128700 ?auto_2128702 ) ) ( not ( = ?auto_2128700 ?auto_2128704 ) ) ( not ( = ?auto_2128700 ?auto_2128703 ) ) ( not ( = ?auto_2128700 ?auto_2128705 ) ) ( not ( = ?auto_2128701 ?auto_2128702 ) ) ( not ( = ?auto_2128701 ?auto_2128704 ) ) ( not ( = ?auto_2128701 ?auto_2128703 ) ) ( not ( = ?auto_2128701 ?auto_2128705 ) ) ( not ( = ?auto_2128702 ?auto_2128704 ) ) ( not ( = ?auto_2128702 ?auto_2128703 ) ) ( not ( = ?auto_2128702 ?auto_2128705 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128704 ?auto_2128703 ?auto_2128705 )
      ( MAKE-5CRATE-VERIFY ?auto_2128700 ?auto_2128701 ?auto_2128702 ?auto_2128704 ?auto_2128703 ?auto_2128705 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2128745 - SURFACE
      ?auto_2128746 - SURFACE
      ?auto_2128747 - SURFACE
      ?auto_2128749 - SURFACE
      ?auto_2128748 - SURFACE
      ?auto_2128750 - SURFACE
    )
    :vars
    (
      ?auto_2128751 - HOIST
      ?auto_2128754 - PLACE
      ?auto_2128755 - TRUCK
      ?auto_2128752 - PLACE
      ?auto_2128753 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128751 ?auto_2128754 ) ( SURFACE-AT ?auto_2128748 ?auto_2128754 ) ( CLEAR ?auto_2128748 ) ( IS-CRATE ?auto_2128750 ) ( not ( = ?auto_2128748 ?auto_2128750 ) ) ( AVAILABLE ?auto_2128751 ) ( ON ?auto_2128748 ?auto_2128749 ) ( not ( = ?auto_2128749 ?auto_2128748 ) ) ( not ( = ?auto_2128749 ?auto_2128750 ) ) ( TRUCK-AT ?auto_2128755 ?auto_2128752 ) ( not ( = ?auto_2128752 ?auto_2128754 ) ) ( HOIST-AT ?auto_2128753 ?auto_2128752 ) ( LIFTING ?auto_2128753 ?auto_2128750 ) ( not ( = ?auto_2128751 ?auto_2128753 ) ) ( ON ?auto_2128746 ?auto_2128745 ) ( ON ?auto_2128747 ?auto_2128746 ) ( ON ?auto_2128749 ?auto_2128747 ) ( not ( = ?auto_2128745 ?auto_2128746 ) ) ( not ( = ?auto_2128745 ?auto_2128747 ) ) ( not ( = ?auto_2128745 ?auto_2128749 ) ) ( not ( = ?auto_2128745 ?auto_2128748 ) ) ( not ( = ?auto_2128745 ?auto_2128750 ) ) ( not ( = ?auto_2128746 ?auto_2128747 ) ) ( not ( = ?auto_2128746 ?auto_2128749 ) ) ( not ( = ?auto_2128746 ?auto_2128748 ) ) ( not ( = ?auto_2128746 ?auto_2128750 ) ) ( not ( = ?auto_2128747 ?auto_2128749 ) ) ( not ( = ?auto_2128747 ?auto_2128748 ) ) ( not ( = ?auto_2128747 ?auto_2128750 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128749 ?auto_2128748 ?auto_2128750 )
      ( MAKE-5CRATE-VERIFY ?auto_2128745 ?auto_2128746 ?auto_2128747 ?auto_2128749 ?auto_2128748 ?auto_2128750 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2128795 - SURFACE
      ?auto_2128796 - SURFACE
      ?auto_2128797 - SURFACE
      ?auto_2128799 - SURFACE
      ?auto_2128798 - SURFACE
      ?auto_2128800 - SURFACE
    )
    :vars
    (
      ?auto_2128803 - HOIST
      ?auto_2128805 - PLACE
      ?auto_2128806 - TRUCK
      ?auto_2128802 - PLACE
      ?auto_2128801 - HOIST
      ?auto_2128804 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128803 ?auto_2128805 ) ( SURFACE-AT ?auto_2128798 ?auto_2128805 ) ( CLEAR ?auto_2128798 ) ( IS-CRATE ?auto_2128800 ) ( not ( = ?auto_2128798 ?auto_2128800 ) ) ( AVAILABLE ?auto_2128803 ) ( ON ?auto_2128798 ?auto_2128799 ) ( not ( = ?auto_2128799 ?auto_2128798 ) ) ( not ( = ?auto_2128799 ?auto_2128800 ) ) ( TRUCK-AT ?auto_2128806 ?auto_2128802 ) ( not ( = ?auto_2128802 ?auto_2128805 ) ) ( HOIST-AT ?auto_2128801 ?auto_2128802 ) ( not ( = ?auto_2128803 ?auto_2128801 ) ) ( AVAILABLE ?auto_2128801 ) ( SURFACE-AT ?auto_2128800 ?auto_2128802 ) ( ON ?auto_2128800 ?auto_2128804 ) ( CLEAR ?auto_2128800 ) ( not ( = ?auto_2128798 ?auto_2128804 ) ) ( not ( = ?auto_2128800 ?auto_2128804 ) ) ( not ( = ?auto_2128799 ?auto_2128804 ) ) ( ON ?auto_2128796 ?auto_2128795 ) ( ON ?auto_2128797 ?auto_2128796 ) ( ON ?auto_2128799 ?auto_2128797 ) ( not ( = ?auto_2128795 ?auto_2128796 ) ) ( not ( = ?auto_2128795 ?auto_2128797 ) ) ( not ( = ?auto_2128795 ?auto_2128799 ) ) ( not ( = ?auto_2128795 ?auto_2128798 ) ) ( not ( = ?auto_2128795 ?auto_2128800 ) ) ( not ( = ?auto_2128795 ?auto_2128804 ) ) ( not ( = ?auto_2128796 ?auto_2128797 ) ) ( not ( = ?auto_2128796 ?auto_2128799 ) ) ( not ( = ?auto_2128796 ?auto_2128798 ) ) ( not ( = ?auto_2128796 ?auto_2128800 ) ) ( not ( = ?auto_2128796 ?auto_2128804 ) ) ( not ( = ?auto_2128797 ?auto_2128799 ) ) ( not ( = ?auto_2128797 ?auto_2128798 ) ) ( not ( = ?auto_2128797 ?auto_2128800 ) ) ( not ( = ?auto_2128797 ?auto_2128804 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128799 ?auto_2128798 ?auto_2128800 )
      ( MAKE-5CRATE-VERIFY ?auto_2128795 ?auto_2128796 ?auto_2128797 ?auto_2128799 ?auto_2128798 ?auto_2128800 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2128846 - SURFACE
      ?auto_2128847 - SURFACE
      ?auto_2128848 - SURFACE
      ?auto_2128850 - SURFACE
      ?auto_2128849 - SURFACE
      ?auto_2128851 - SURFACE
    )
    :vars
    (
      ?auto_2128857 - HOIST
      ?auto_2128853 - PLACE
      ?auto_2128856 - PLACE
      ?auto_2128855 - HOIST
      ?auto_2128854 - SURFACE
      ?auto_2128852 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128857 ?auto_2128853 ) ( SURFACE-AT ?auto_2128849 ?auto_2128853 ) ( CLEAR ?auto_2128849 ) ( IS-CRATE ?auto_2128851 ) ( not ( = ?auto_2128849 ?auto_2128851 ) ) ( AVAILABLE ?auto_2128857 ) ( ON ?auto_2128849 ?auto_2128850 ) ( not ( = ?auto_2128850 ?auto_2128849 ) ) ( not ( = ?auto_2128850 ?auto_2128851 ) ) ( not ( = ?auto_2128856 ?auto_2128853 ) ) ( HOIST-AT ?auto_2128855 ?auto_2128856 ) ( not ( = ?auto_2128857 ?auto_2128855 ) ) ( AVAILABLE ?auto_2128855 ) ( SURFACE-AT ?auto_2128851 ?auto_2128856 ) ( ON ?auto_2128851 ?auto_2128854 ) ( CLEAR ?auto_2128851 ) ( not ( = ?auto_2128849 ?auto_2128854 ) ) ( not ( = ?auto_2128851 ?auto_2128854 ) ) ( not ( = ?auto_2128850 ?auto_2128854 ) ) ( TRUCK-AT ?auto_2128852 ?auto_2128853 ) ( ON ?auto_2128847 ?auto_2128846 ) ( ON ?auto_2128848 ?auto_2128847 ) ( ON ?auto_2128850 ?auto_2128848 ) ( not ( = ?auto_2128846 ?auto_2128847 ) ) ( not ( = ?auto_2128846 ?auto_2128848 ) ) ( not ( = ?auto_2128846 ?auto_2128850 ) ) ( not ( = ?auto_2128846 ?auto_2128849 ) ) ( not ( = ?auto_2128846 ?auto_2128851 ) ) ( not ( = ?auto_2128846 ?auto_2128854 ) ) ( not ( = ?auto_2128847 ?auto_2128848 ) ) ( not ( = ?auto_2128847 ?auto_2128850 ) ) ( not ( = ?auto_2128847 ?auto_2128849 ) ) ( not ( = ?auto_2128847 ?auto_2128851 ) ) ( not ( = ?auto_2128847 ?auto_2128854 ) ) ( not ( = ?auto_2128848 ?auto_2128850 ) ) ( not ( = ?auto_2128848 ?auto_2128849 ) ) ( not ( = ?auto_2128848 ?auto_2128851 ) ) ( not ( = ?auto_2128848 ?auto_2128854 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128850 ?auto_2128849 ?auto_2128851 )
      ( MAKE-5CRATE-VERIFY ?auto_2128846 ?auto_2128847 ?auto_2128848 ?auto_2128850 ?auto_2128849 ?auto_2128851 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2128897 - SURFACE
      ?auto_2128898 - SURFACE
      ?auto_2128899 - SURFACE
      ?auto_2128901 - SURFACE
      ?auto_2128900 - SURFACE
      ?auto_2128902 - SURFACE
    )
    :vars
    (
      ?auto_2128903 - HOIST
      ?auto_2128904 - PLACE
      ?auto_2128905 - PLACE
      ?auto_2128908 - HOIST
      ?auto_2128907 - SURFACE
      ?auto_2128906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128903 ?auto_2128904 ) ( IS-CRATE ?auto_2128902 ) ( not ( = ?auto_2128900 ?auto_2128902 ) ) ( not ( = ?auto_2128901 ?auto_2128900 ) ) ( not ( = ?auto_2128901 ?auto_2128902 ) ) ( not ( = ?auto_2128905 ?auto_2128904 ) ) ( HOIST-AT ?auto_2128908 ?auto_2128905 ) ( not ( = ?auto_2128903 ?auto_2128908 ) ) ( AVAILABLE ?auto_2128908 ) ( SURFACE-AT ?auto_2128902 ?auto_2128905 ) ( ON ?auto_2128902 ?auto_2128907 ) ( CLEAR ?auto_2128902 ) ( not ( = ?auto_2128900 ?auto_2128907 ) ) ( not ( = ?auto_2128902 ?auto_2128907 ) ) ( not ( = ?auto_2128901 ?auto_2128907 ) ) ( TRUCK-AT ?auto_2128906 ?auto_2128904 ) ( SURFACE-AT ?auto_2128901 ?auto_2128904 ) ( CLEAR ?auto_2128901 ) ( LIFTING ?auto_2128903 ?auto_2128900 ) ( IS-CRATE ?auto_2128900 ) ( ON ?auto_2128898 ?auto_2128897 ) ( ON ?auto_2128899 ?auto_2128898 ) ( ON ?auto_2128901 ?auto_2128899 ) ( not ( = ?auto_2128897 ?auto_2128898 ) ) ( not ( = ?auto_2128897 ?auto_2128899 ) ) ( not ( = ?auto_2128897 ?auto_2128901 ) ) ( not ( = ?auto_2128897 ?auto_2128900 ) ) ( not ( = ?auto_2128897 ?auto_2128902 ) ) ( not ( = ?auto_2128897 ?auto_2128907 ) ) ( not ( = ?auto_2128898 ?auto_2128899 ) ) ( not ( = ?auto_2128898 ?auto_2128901 ) ) ( not ( = ?auto_2128898 ?auto_2128900 ) ) ( not ( = ?auto_2128898 ?auto_2128902 ) ) ( not ( = ?auto_2128898 ?auto_2128907 ) ) ( not ( = ?auto_2128899 ?auto_2128901 ) ) ( not ( = ?auto_2128899 ?auto_2128900 ) ) ( not ( = ?auto_2128899 ?auto_2128902 ) ) ( not ( = ?auto_2128899 ?auto_2128907 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128901 ?auto_2128900 ?auto_2128902 )
      ( MAKE-5CRATE-VERIFY ?auto_2128897 ?auto_2128898 ?auto_2128899 ?auto_2128901 ?auto_2128900 ?auto_2128902 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2128948 - SURFACE
      ?auto_2128949 - SURFACE
      ?auto_2128950 - SURFACE
      ?auto_2128952 - SURFACE
      ?auto_2128951 - SURFACE
      ?auto_2128953 - SURFACE
    )
    :vars
    (
      ?auto_2128954 - HOIST
      ?auto_2128957 - PLACE
      ?auto_2128955 - PLACE
      ?auto_2128956 - HOIST
      ?auto_2128959 - SURFACE
      ?auto_2128958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128954 ?auto_2128957 ) ( IS-CRATE ?auto_2128953 ) ( not ( = ?auto_2128951 ?auto_2128953 ) ) ( not ( = ?auto_2128952 ?auto_2128951 ) ) ( not ( = ?auto_2128952 ?auto_2128953 ) ) ( not ( = ?auto_2128955 ?auto_2128957 ) ) ( HOIST-AT ?auto_2128956 ?auto_2128955 ) ( not ( = ?auto_2128954 ?auto_2128956 ) ) ( AVAILABLE ?auto_2128956 ) ( SURFACE-AT ?auto_2128953 ?auto_2128955 ) ( ON ?auto_2128953 ?auto_2128959 ) ( CLEAR ?auto_2128953 ) ( not ( = ?auto_2128951 ?auto_2128959 ) ) ( not ( = ?auto_2128953 ?auto_2128959 ) ) ( not ( = ?auto_2128952 ?auto_2128959 ) ) ( TRUCK-AT ?auto_2128958 ?auto_2128957 ) ( SURFACE-AT ?auto_2128952 ?auto_2128957 ) ( CLEAR ?auto_2128952 ) ( IS-CRATE ?auto_2128951 ) ( AVAILABLE ?auto_2128954 ) ( IN ?auto_2128951 ?auto_2128958 ) ( ON ?auto_2128949 ?auto_2128948 ) ( ON ?auto_2128950 ?auto_2128949 ) ( ON ?auto_2128952 ?auto_2128950 ) ( not ( = ?auto_2128948 ?auto_2128949 ) ) ( not ( = ?auto_2128948 ?auto_2128950 ) ) ( not ( = ?auto_2128948 ?auto_2128952 ) ) ( not ( = ?auto_2128948 ?auto_2128951 ) ) ( not ( = ?auto_2128948 ?auto_2128953 ) ) ( not ( = ?auto_2128948 ?auto_2128959 ) ) ( not ( = ?auto_2128949 ?auto_2128950 ) ) ( not ( = ?auto_2128949 ?auto_2128952 ) ) ( not ( = ?auto_2128949 ?auto_2128951 ) ) ( not ( = ?auto_2128949 ?auto_2128953 ) ) ( not ( = ?auto_2128949 ?auto_2128959 ) ) ( not ( = ?auto_2128950 ?auto_2128952 ) ) ( not ( = ?auto_2128950 ?auto_2128951 ) ) ( not ( = ?auto_2128950 ?auto_2128953 ) ) ( not ( = ?auto_2128950 ?auto_2128959 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128952 ?auto_2128951 ?auto_2128953 )
      ( MAKE-5CRATE-VERIFY ?auto_2128948 ?auto_2128949 ?auto_2128950 ?auto_2128952 ?auto_2128951 ?auto_2128953 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2129316 - SURFACE
      ?auto_2129317 - SURFACE
    )
    :vars
    (
      ?auto_2129319 - HOIST
      ?auto_2129324 - PLACE
      ?auto_2129320 - SURFACE
      ?auto_2129323 - TRUCK
      ?auto_2129318 - PLACE
      ?auto_2129321 - HOIST
      ?auto_2129322 - SURFACE
      ?auto_2129325 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2129319 ?auto_2129324 ) ( SURFACE-AT ?auto_2129316 ?auto_2129324 ) ( CLEAR ?auto_2129316 ) ( IS-CRATE ?auto_2129317 ) ( not ( = ?auto_2129316 ?auto_2129317 ) ) ( AVAILABLE ?auto_2129319 ) ( ON ?auto_2129316 ?auto_2129320 ) ( not ( = ?auto_2129320 ?auto_2129316 ) ) ( not ( = ?auto_2129320 ?auto_2129317 ) ) ( TRUCK-AT ?auto_2129323 ?auto_2129318 ) ( not ( = ?auto_2129318 ?auto_2129324 ) ) ( HOIST-AT ?auto_2129321 ?auto_2129318 ) ( not ( = ?auto_2129319 ?auto_2129321 ) ) ( SURFACE-AT ?auto_2129317 ?auto_2129318 ) ( ON ?auto_2129317 ?auto_2129322 ) ( CLEAR ?auto_2129317 ) ( not ( = ?auto_2129316 ?auto_2129322 ) ) ( not ( = ?auto_2129317 ?auto_2129322 ) ) ( not ( = ?auto_2129320 ?auto_2129322 ) ) ( LIFTING ?auto_2129321 ?auto_2129325 ) ( IS-CRATE ?auto_2129325 ) ( not ( = ?auto_2129316 ?auto_2129325 ) ) ( not ( = ?auto_2129317 ?auto_2129325 ) ) ( not ( = ?auto_2129320 ?auto_2129325 ) ) ( not ( = ?auto_2129322 ?auto_2129325 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2129321 ?auto_2129325 ?auto_2129323 ?auto_2129318 )
      ( MAKE-1CRATE ?auto_2129316 ?auto_2129317 )
      ( MAKE-1CRATE-VERIFY ?auto_2129316 ?auto_2129317 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2130153 - SURFACE
      ?auto_2130154 - SURFACE
      ?auto_2130155 - SURFACE
      ?auto_2130157 - SURFACE
      ?auto_2130156 - SURFACE
      ?auto_2130158 - SURFACE
      ?auto_2130159 - SURFACE
    )
    :vars
    (
      ?auto_2130161 - HOIST
      ?auto_2130160 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2130161 ?auto_2130160 ) ( SURFACE-AT ?auto_2130158 ?auto_2130160 ) ( CLEAR ?auto_2130158 ) ( LIFTING ?auto_2130161 ?auto_2130159 ) ( IS-CRATE ?auto_2130159 ) ( not ( = ?auto_2130158 ?auto_2130159 ) ) ( ON ?auto_2130154 ?auto_2130153 ) ( ON ?auto_2130155 ?auto_2130154 ) ( ON ?auto_2130157 ?auto_2130155 ) ( ON ?auto_2130156 ?auto_2130157 ) ( ON ?auto_2130158 ?auto_2130156 ) ( not ( = ?auto_2130153 ?auto_2130154 ) ) ( not ( = ?auto_2130153 ?auto_2130155 ) ) ( not ( = ?auto_2130153 ?auto_2130157 ) ) ( not ( = ?auto_2130153 ?auto_2130156 ) ) ( not ( = ?auto_2130153 ?auto_2130158 ) ) ( not ( = ?auto_2130153 ?auto_2130159 ) ) ( not ( = ?auto_2130154 ?auto_2130155 ) ) ( not ( = ?auto_2130154 ?auto_2130157 ) ) ( not ( = ?auto_2130154 ?auto_2130156 ) ) ( not ( = ?auto_2130154 ?auto_2130158 ) ) ( not ( = ?auto_2130154 ?auto_2130159 ) ) ( not ( = ?auto_2130155 ?auto_2130157 ) ) ( not ( = ?auto_2130155 ?auto_2130156 ) ) ( not ( = ?auto_2130155 ?auto_2130158 ) ) ( not ( = ?auto_2130155 ?auto_2130159 ) ) ( not ( = ?auto_2130157 ?auto_2130156 ) ) ( not ( = ?auto_2130157 ?auto_2130158 ) ) ( not ( = ?auto_2130157 ?auto_2130159 ) ) ( not ( = ?auto_2130156 ?auto_2130158 ) ) ( not ( = ?auto_2130156 ?auto_2130159 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2130158 ?auto_2130159 )
      ( MAKE-6CRATE-VERIFY ?auto_2130153 ?auto_2130154 ?auto_2130155 ?auto_2130157 ?auto_2130156 ?auto_2130158 ?auto_2130159 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2130197 - SURFACE
      ?auto_2130198 - SURFACE
      ?auto_2130199 - SURFACE
      ?auto_2130201 - SURFACE
      ?auto_2130200 - SURFACE
      ?auto_2130202 - SURFACE
      ?auto_2130203 - SURFACE
    )
    :vars
    (
      ?auto_2130205 - HOIST
      ?auto_2130206 - PLACE
      ?auto_2130204 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2130205 ?auto_2130206 ) ( SURFACE-AT ?auto_2130202 ?auto_2130206 ) ( CLEAR ?auto_2130202 ) ( IS-CRATE ?auto_2130203 ) ( not ( = ?auto_2130202 ?auto_2130203 ) ) ( TRUCK-AT ?auto_2130204 ?auto_2130206 ) ( AVAILABLE ?auto_2130205 ) ( IN ?auto_2130203 ?auto_2130204 ) ( ON ?auto_2130202 ?auto_2130200 ) ( not ( = ?auto_2130200 ?auto_2130202 ) ) ( not ( = ?auto_2130200 ?auto_2130203 ) ) ( ON ?auto_2130198 ?auto_2130197 ) ( ON ?auto_2130199 ?auto_2130198 ) ( ON ?auto_2130201 ?auto_2130199 ) ( ON ?auto_2130200 ?auto_2130201 ) ( not ( = ?auto_2130197 ?auto_2130198 ) ) ( not ( = ?auto_2130197 ?auto_2130199 ) ) ( not ( = ?auto_2130197 ?auto_2130201 ) ) ( not ( = ?auto_2130197 ?auto_2130200 ) ) ( not ( = ?auto_2130197 ?auto_2130202 ) ) ( not ( = ?auto_2130197 ?auto_2130203 ) ) ( not ( = ?auto_2130198 ?auto_2130199 ) ) ( not ( = ?auto_2130198 ?auto_2130201 ) ) ( not ( = ?auto_2130198 ?auto_2130200 ) ) ( not ( = ?auto_2130198 ?auto_2130202 ) ) ( not ( = ?auto_2130198 ?auto_2130203 ) ) ( not ( = ?auto_2130199 ?auto_2130201 ) ) ( not ( = ?auto_2130199 ?auto_2130200 ) ) ( not ( = ?auto_2130199 ?auto_2130202 ) ) ( not ( = ?auto_2130199 ?auto_2130203 ) ) ( not ( = ?auto_2130201 ?auto_2130200 ) ) ( not ( = ?auto_2130201 ?auto_2130202 ) ) ( not ( = ?auto_2130201 ?auto_2130203 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2130200 ?auto_2130202 ?auto_2130203 )
      ( MAKE-6CRATE-VERIFY ?auto_2130197 ?auto_2130198 ?auto_2130199 ?auto_2130201 ?auto_2130200 ?auto_2130202 ?auto_2130203 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2130248 - SURFACE
      ?auto_2130249 - SURFACE
      ?auto_2130250 - SURFACE
      ?auto_2130252 - SURFACE
      ?auto_2130251 - SURFACE
      ?auto_2130253 - SURFACE
      ?auto_2130254 - SURFACE
    )
    :vars
    (
      ?auto_2130257 - HOIST
      ?auto_2130255 - PLACE
      ?auto_2130258 - TRUCK
      ?auto_2130256 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2130257 ?auto_2130255 ) ( SURFACE-AT ?auto_2130253 ?auto_2130255 ) ( CLEAR ?auto_2130253 ) ( IS-CRATE ?auto_2130254 ) ( not ( = ?auto_2130253 ?auto_2130254 ) ) ( AVAILABLE ?auto_2130257 ) ( IN ?auto_2130254 ?auto_2130258 ) ( ON ?auto_2130253 ?auto_2130251 ) ( not ( = ?auto_2130251 ?auto_2130253 ) ) ( not ( = ?auto_2130251 ?auto_2130254 ) ) ( TRUCK-AT ?auto_2130258 ?auto_2130256 ) ( not ( = ?auto_2130256 ?auto_2130255 ) ) ( ON ?auto_2130249 ?auto_2130248 ) ( ON ?auto_2130250 ?auto_2130249 ) ( ON ?auto_2130252 ?auto_2130250 ) ( ON ?auto_2130251 ?auto_2130252 ) ( not ( = ?auto_2130248 ?auto_2130249 ) ) ( not ( = ?auto_2130248 ?auto_2130250 ) ) ( not ( = ?auto_2130248 ?auto_2130252 ) ) ( not ( = ?auto_2130248 ?auto_2130251 ) ) ( not ( = ?auto_2130248 ?auto_2130253 ) ) ( not ( = ?auto_2130248 ?auto_2130254 ) ) ( not ( = ?auto_2130249 ?auto_2130250 ) ) ( not ( = ?auto_2130249 ?auto_2130252 ) ) ( not ( = ?auto_2130249 ?auto_2130251 ) ) ( not ( = ?auto_2130249 ?auto_2130253 ) ) ( not ( = ?auto_2130249 ?auto_2130254 ) ) ( not ( = ?auto_2130250 ?auto_2130252 ) ) ( not ( = ?auto_2130250 ?auto_2130251 ) ) ( not ( = ?auto_2130250 ?auto_2130253 ) ) ( not ( = ?auto_2130250 ?auto_2130254 ) ) ( not ( = ?auto_2130252 ?auto_2130251 ) ) ( not ( = ?auto_2130252 ?auto_2130253 ) ) ( not ( = ?auto_2130252 ?auto_2130254 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2130251 ?auto_2130253 ?auto_2130254 )
      ( MAKE-6CRATE-VERIFY ?auto_2130248 ?auto_2130249 ?auto_2130250 ?auto_2130252 ?auto_2130251 ?auto_2130253 ?auto_2130254 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2130305 - SURFACE
      ?auto_2130306 - SURFACE
      ?auto_2130307 - SURFACE
      ?auto_2130309 - SURFACE
      ?auto_2130308 - SURFACE
      ?auto_2130310 - SURFACE
      ?auto_2130311 - SURFACE
    )
    :vars
    (
      ?auto_2130314 - HOIST
      ?auto_2130315 - PLACE
      ?auto_2130313 - TRUCK
      ?auto_2130316 - PLACE
      ?auto_2130312 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2130314 ?auto_2130315 ) ( SURFACE-AT ?auto_2130310 ?auto_2130315 ) ( CLEAR ?auto_2130310 ) ( IS-CRATE ?auto_2130311 ) ( not ( = ?auto_2130310 ?auto_2130311 ) ) ( AVAILABLE ?auto_2130314 ) ( ON ?auto_2130310 ?auto_2130308 ) ( not ( = ?auto_2130308 ?auto_2130310 ) ) ( not ( = ?auto_2130308 ?auto_2130311 ) ) ( TRUCK-AT ?auto_2130313 ?auto_2130316 ) ( not ( = ?auto_2130316 ?auto_2130315 ) ) ( HOIST-AT ?auto_2130312 ?auto_2130316 ) ( LIFTING ?auto_2130312 ?auto_2130311 ) ( not ( = ?auto_2130314 ?auto_2130312 ) ) ( ON ?auto_2130306 ?auto_2130305 ) ( ON ?auto_2130307 ?auto_2130306 ) ( ON ?auto_2130309 ?auto_2130307 ) ( ON ?auto_2130308 ?auto_2130309 ) ( not ( = ?auto_2130305 ?auto_2130306 ) ) ( not ( = ?auto_2130305 ?auto_2130307 ) ) ( not ( = ?auto_2130305 ?auto_2130309 ) ) ( not ( = ?auto_2130305 ?auto_2130308 ) ) ( not ( = ?auto_2130305 ?auto_2130310 ) ) ( not ( = ?auto_2130305 ?auto_2130311 ) ) ( not ( = ?auto_2130306 ?auto_2130307 ) ) ( not ( = ?auto_2130306 ?auto_2130309 ) ) ( not ( = ?auto_2130306 ?auto_2130308 ) ) ( not ( = ?auto_2130306 ?auto_2130310 ) ) ( not ( = ?auto_2130306 ?auto_2130311 ) ) ( not ( = ?auto_2130307 ?auto_2130309 ) ) ( not ( = ?auto_2130307 ?auto_2130308 ) ) ( not ( = ?auto_2130307 ?auto_2130310 ) ) ( not ( = ?auto_2130307 ?auto_2130311 ) ) ( not ( = ?auto_2130309 ?auto_2130308 ) ) ( not ( = ?auto_2130309 ?auto_2130310 ) ) ( not ( = ?auto_2130309 ?auto_2130311 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2130308 ?auto_2130310 ?auto_2130311 )
      ( MAKE-6CRATE-VERIFY ?auto_2130305 ?auto_2130306 ?auto_2130307 ?auto_2130309 ?auto_2130308 ?auto_2130310 ?auto_2130311 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2130368 - SURFACE
      ?auto_2130369 - SURFACE
      ?auto_2130370 - SURFACE
      ?auto_2130372 - SURFACE
      ?auto_2130371 - SURFACE
      ?auto_2130373 - SURFACE
      ?auto_2130374 - SURFACE
    )
    :vars
    (
      ?auto_2130375 - HOIST
      ?auto_2130380 - PLACE
      ?auto_2130378 - TRUCK
      ?auto_2130376 - PLACE
      ?auto_2130379 - HOIST
      ?auto_2130377 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2130375 ?auto_2130380 ) ( SURFACE-AT ?auto_2130373 ?auto_2130380 ) ( CLEAR ?auto_2130373 ) ( IS-CRATE ?auto_2130374 ) ( not ( = ?auto_2130373 ?auto_2130374 ) ) ( AVAILABLE ?auto_2130375 ) ( ON ?auto_2130373 ?auto_2130371 ) ( not ( = ?auto_2130371 ?auto_2130373 ) ) ( not ( = ?auto_2130371 ?auto_2130374 ) ) ( TRUCK-AT ?auto_2130378 ?auto_2130376 ) ( not ( = ?auto_2130376 ?auto_2130380 ) ) ( HOIST-AT ?auto_2130379 ?auto_2130376 ) ( not ( = ?auto_2130375 ?auto_2130379 ) ) ( AVAILABLE ?auto_2130379 ) ( SURFACE-AT ?auto_2130374 ?auto_2130376 ) ( ON ?auto_2130374 ?auto_2130377 ) ( CLEAR ?auto_2130374 ) ( not ( = ?auto_2130373 ?auto_2130377 ) ) ( not ( = ?auto_2130374 ?auto_2130377 ) ) ( not ( = ?auto_2130371 ?auto_2130377 ) ) ( ON ?auto_2130369 ?auto_2130368 ) ( ON ?auto_2130370 ?auto_2130369 ) ( ON ?auto_2130372 ?auto_2130370 ) ( ON ?auto_2130371 ?auto_2130372 ) ( not ( = ?auto_2130368 ?auto_2130369 ) ) ( not ( = ?auto_2130368 ?auto_2130370 ) ) ( not ( = ?auto_2130368 ?auto_2130372 ) ) ( not ( = ?auto_2130368 ?auto_2130371 ) ) ( not ( = ?auto_2130368 ?auto_2130373 ) ) ( not ( = ?auto_2130368 ?auto_2130374 ) ) ( not ( = ?auto_2130368 ?auto_2130377 ) ) ( not ( = ?auto_2130369 ?auto_2130370 ) ) ( not ( = ?auto_2130369 ?auto_2130372 ) ) ( not ( = ?auto_2130369 ?auto_2130371 ) ) ( not ( = ?auto_2130369 ?auto_2130373 ) ) ( not ( = ?auto_2130369 ?auto_2130374 ) ) ( not ( = ?auto_2130369 ?auto_2130377 ) ) ( not ( = ?auto_2130370 ?auto_2130372 ) ) ( not ( = ?auto_2130370 ?auto_2130371 ) ) ( not ( = ?auto_2130370 ?auto_2130373 ) ) ( not ( = ?auto_2130370 ?auto_2130374 ) ) ( not ( = ?auto_2130370 ?auto_2130377 ) ) ( not ( = ?auto_2130372 ?auto_2130371 ) ) ( not ( = ?auto_2130372 ?auto_2130373 ) ) ( not ( = ?auto_2130372 ?auto_2130374 ) ) ( not ( = ?auto_2130372 ?auto_2130377 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2130371 ?auto_2130373 ?auto_2130374 )
      ( MAKE-6CRATE-VERIFY ?auto_2130368 ?auto_2130369 ?auto_2130370 ?auto_2130372 ?auto_2130371 ?auto_2130373 ?auto_2130374 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2130432 - SURFACE
      ?auto_2130433 - SURFACE
      ?auto_2130434 - SURFACE
      ?auto_2130436 - SURFACE
      ?auto_2130435 - SURFACE
      ?auto_2130437 - SURFACE
      ?auto_2130438 - SURFACE
    )
    :vars
    (
      ?auto_2130440 - HOIST
      ?auto_2130441 - PLACE
      ?auto_2130444 - PLACE
      ?auto_2130439 - HOIST
      ?auto_2130443 - SURFACE
      ?auto_2130442 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2130440 ?auto_2130441 ) ( SURFACE-AT ?auto_2130437 ?auto_2130441 ) ( CLEAR ?auto_2130437 ) ( IS-CRATE ?auto_2130438 ) ( not ( = ?auto_2130437 ?auto_2130438 ) ) ( AVAILABLE ?auto_2130440 ) ( ON ?auto_2130437 ?auto_2130435 ) ( not ( = ?auto_2130435 ?auto_2130437 ) ) ( not ( = ?auto_2130435 ?auto_2130438 ) ) ( not ( = ?auto_2130444 ?auto_2130441 ) ) ( HOIST-AT ?auto_2130439 ?auto_2130444 ) ( not ( = ?auto_2130440 ?auto_2130439 ) ) ( AVAILABLE ?auto_2130439 ) ( SURFACE-AT ?auto_2130438 ?auto_2130444 ) ( ON ?auto_2130438 ?auto_2130443 ) ( CLEAR ?auto_2130438 ) ( not ( = ?auto_2130437 ?auto_2130443 ) ) ( not ( = ?auto_2130438 ?auto_2130443 ) ) ( not ( = ?auto_2130435 ?auto_2130443 ) ) ( TRUCK-AT ?auto_2130442 ?auto_2130441 ) ( ON ?auto_2130433 ?auto_2130432 ) ( ON ?auto_2130434 ?auto_2130433 ) ( ON ?auto_2130436 ?auto_2130434 ) ( ON ?auto_2130435 ?auto_2130436 ) ( not ( = ?auto_2130432 ?auto_2130433 ) ) ( not ( = ?auto_2130432 ?auto_2130434 ) ) ( not ( = ?auto_2130432 ?auto_2130436 ) ) ( not ( = ?auto_2130432 ?auto_2130435 ) ) ( not ( = ?auto_2130432 ?auto_2130437 ) ) ( not ( = ?auto_2130432 ?auto_2130438 ) ) ( not ( = ?auto_2130432 ?auto_2130443 ) ) ( not ( = ?auto_2130433 ?auto_2130434 ) ) ( not ( = ?auto_2130433 ?auto_2130436 ) ) ( not ( = ?auto_2130433 ?auto_2130435 ) ) ( not ( = ?auto_2130433 ?auto_2130437 ) ) ( not ( = ?auto_2130433 ?auto_2130438 ) ) ( not ( = ?auto_2130433 ?auto_2130443 ) ) ( not ( = ?auto_2130434 ?auto_2130436 ) ) ( not ( = ?auto_2130434 ?auto_2130435 ) ) ( not ( = ?auto_2130434 ?auto_2130437 ) ) ( not ( = ?auto_2130434 ?auto_2130438 ) ) ( not ( = ?auto_2130434 ?auto_2130443 ) ) ( not ( = ?auto_2130436 ?auto_2130435 ) ) ( not ( = ?auto_2130436 ?auto_2130437 ) ) ( not ( = ?auto_2130436 ?auto_2130438 ) ) ( not ( = ?auto_2130436 ?auto_2130443 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2130435 ?auto_2130437 ?auto_2130438 )
      ( MAKE-6CRATE-VERIFY ?auto_2130432 ?auto_2130433 ?auto_2130434 ?auto_2130436 ?auto_2130435 ?auto_2130437 ?auto_2130438 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2130496 - SURFACE
      ?auto_2130497 - SURFACE
      ?auto_2130498 - SURFACE
      ?auto_2130500 - SURFACE
      ?auto_2130499 - SURFACE
      ?auto_2130501 - SURFACE
      ?auto_2130502 - SURFACE
    )
    :vars
    (
      ?auto_2130506 - HOIST
      ?auto_2130508 - PLACE
      ?auto_2130505 - PLACE
      ?auto_2130504 - HOIST
      ?auto_2130503 - SURFACE
      ?auto_2130507 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2130506 ?auto_2130508 ) ( IS-CRATE ?auto_2130502 ) ( not ( = ?auto_2130501 ?auto_2130502 ) ) ( not ( = ?auto_2130499 ?auto_2130501 ) ) ( not ( = ?auto_2130499 ?auto_2130502 ) ) ( not ( = ?auto_2130505 ?auto_2130508 ) ) ( HOIST-AT ?auto_2130504 ?auto_2130505 ) ( not ( = ?auto_2130506 ?auto_2130504 ) ) ( AVAILABLE ?auto_2130504 ) ( SURFACE-AT ?auto_2130502 ?auto_2130505 ) ( ON ?auto_2130502 ?auto_2130503 ) ( CLEAR ?auto_2130502 ) ( not ( = ?auto_2130501 ?auto_2130503 ) ) ( not ( = ?auto_2130502 ?auto_2130503 ) ) ( not ( = ?auto_2130499 ?auto_2130503 ) ) ( TRUCK-AT ?auto_2130507 ?auto_2130508 ) ( SURFACE-AT ?auto_2130499 ?auto_2130508 ) ( CLEAR ?auto_2130499 ) ( LIFTING ?auto_2130506 ?auto_2130501 ) ( IS-CRATE ?auto_2130501 ) ( ON ?auto_2130497 ?auto_2130496 ) ( ON ?auto_2130498 ?auto_2130497 ) ( ON ?auto_2130500 ?auto_2130498 ) ( ON ?auto_2130499 ?auto_2130500 ) ( not ( = ?auto_2130496 ?auto_2130497 ) ) ( not ( = ?auto_2130496 ?auto_2130498 ) ) ( not ( = ?auto_2130496 ?auto_2130500 ) ) ( not ( = ?auto_2130496 ?auto_2130499 ) ) ( not ( = ?auto_2130496 ?auto_2130501 ) ) ( not ( = ?auto_2130496 ?auto_2130502 ) ) ( not ( = ?auto_2130496 ?auto_2130503 ) ) ( not ( = ?auto_2130497 ?auto_2130498 ) ) ( not ( = ?auto_2130497 ?auto_2130500 ) ) ( not ( = ?auto_2130497 ?auto_2130499 ) ) ( not ( = ?auto_2130497 ?auto_2130501 ) ) ( not ( = ?auto_2130497 ?auto_2130502 ) ) ( not ( = ?auto_2130497 ?auto_2130503 ) ) ( not ( = ?auto_2130498 ?auto_2130500 ) ) ( not ( = ?auto_2130498 ?auto_2130499 ) ) ( not ( = ?auto_2130498 ?auto_2130501 ) ) ( not ( = ?auto_2130498 ?auto_2130502 ) ) ( not ( = ?auto_2130498 ?auto_2130503 ) ) ( not ( = ?auto_2130500 ?auto_2130499 ) ) ( not ( = ?auto_2130500 ?auto_2130501 ) ) ( not ( = ?auto_2130500 ?auto_2130502 ) ) ( not ( = ?auto_2130500 ?auto_2130503 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2130499 ?auto_2130501 ?auto_2130502 )
      ( MAKE-6CRATE-VERIFY ?auto_2130496 ?auto_2130497 ?auto_2130498 ?auto_2130500 ?auto_2130499 ?auto_2130501 ?auto_2130502 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2130560 - SURFACE
      ?auto_2130561 - SURFACE
      ?auto_2130562 - SURFACE
      ?auto_2130564 - SURFACE
      ?auto_2130563 - SURFACE
      ?auto_2130565 - SURFACE
      ?auto_2130566 - SURFACE
    )
    :vars
    (
      ?auto_2130572 - HOIST
      ?auto_2130569 - PLACE
      ?auto_2130567 - PLACE
      ?auto_2130568 - HOIST
      ?auto_2130571 - SURFACE
      ?auto_2130570 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2130572 ?auto_2130569 ) ( IS-CRATE ?auto_2130566 ) ( not ( = ?auto_2130565 ?auto_2130566 ) ) ( not ( = ?auto_2130563 ?auto_2130565 ) ) ( not ( = ?auto_2130563 ?auto_2130566 ) ) ( not ( = ?auto_2130567 ?auto_2130569 ) ) ( HOIST-AT ?auto_2130568 ?auto_2130567 ) ( not ( = ?auto_2130572 ?auto_2130568 ) ) ( AVAILABLE ?auto_2130568 ) ( SURFACE-AT ?auto_2130566 ?auto_2130567 ) ( ON ?auto_2130566 ?auto_2130571 ) ( CLEAR ?auto_2130566 ) ( not ( = ?auto_2130565 ?auto_2130571 ) ) ( not ( = ?auto_2130566 ?auto_2130571 ) ) ( not ( = ?auto_2130563 ?auto_2130571 ) ) ( TRUCK-AT ?auto_2130570 ?auto_2130569 ) ( SURFACE-AT ?auto_2130563 ?auto_2130569 ) ( CLEAR ?auto_2130563 ) ( IS-CRATE ?auto_2130565 ) ( AVAILABLE ?auto_2130572 ) ( IN ?auto_2130565 ?auto_2130570 ) ( ON ?auto_2130561 ?auto_2130560 ) ( ON ?auto_2130562 ?auto_2130561 ) ( ON ?auto_2130564 ?auto_2130562 ) ( ON ?auto_2130563 ?auto_2130564 ) ( not ( = ?auto_2130560 ?auto_2130561 ) ) ( not ( = ?auto_2130560 ?auto_2130562 ) ) ( not ( = ?auto_2130560 ?auto_2130564 ) ) ( not ( = ?auto_2130560 ?auto_2130563 ) ) ( not ( = ?auto_2130560 ?auto_2130565 ) ) ( not ( = ?auto_2130560 ?auto_2130566 ) ) ( not ( = ?auto_2130560 ?auto_2130571 ) ) ( not ( = ?auto_2130561 ?auto_2130562 ) ) ( not ( = ?auto_2130561 ?auto_2130564 ) ) ( not ( = ?auto_2130561 ?auto_2130563 ) ) ( not ( = ?auto_2130561 ?auto_2130565 ) ) ( not ( = ?auto_2130561 ?auto_2130566 ) ) ( not ( = ?auto_2130561 ?auto_2130571 ) ) ( not ( = ?auto_2130562 ?auto_2130564 ) ) ( not ( = ?auto_2130562 ?auto_2130563 ) ) ( not ( = ?auto_2130562 ?auto_2130565 ) ) ( not ( = ?auto_2130562 ?auto_2130566 ) ) ( not ( = ?auto_2130562 ?auto_2130571 ) ) ( not ( = ?auto_2130564 ?auto_2130563 ) ) ( not ( = ?auto_2130564 ?auto_2130565 ) ) ( not ( = ?auto_2130564 ?auto_2130566 ) ) ( not ( = ?auto_2130564 ?auto_2130571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2130563 ?auto_2130565 ?auto_2130566 )
      ( MAKE-6CRATE-VERIFY ?auto_2130560 ?auto_2130561 ?auto_2130562 ?auto_2130564 ?auto_2130563 ?auto_2130565 ?auto_2130566 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2131432 - SURFACE
      ?auto_2131433 - SURFACE
    )
    :vars
    (
      ?auto_2131438 - HOIST
      ?auto_2131435 - PLACE
      ?auto_2131440 - SURFACE
      ?auto_2131436 - PLACE
      ?auto_2131434 - HOIST
      ?auto_2131437 - SURFACE
      ?auto_2131439 - TRUCK
      ?auto_2131441 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2131438 ?auto_2131435 ) ( SURFACE-AT ?auto_2131432 ?auto_2131435 ) ( CLEAR ?auto_2131432 ) ( IS-CRATE ?auto_2131433 ) ( not ( = ?auto_2131432 ?auto_2131433 ) ) ( ON ?auto_2131432 ?auto_2131440 ) ( not ( = ?auto_2131440 ?auto_2131432 ) ) ( not ( = ?auto_2131440 ?auto_2131433 ) ) ( not ( = ?auto_2131436 ?auto_2131435 ) ) ( HOIST-AT ?auto_2131434 ?auto_2131436 ) ( not ( = ?auto_2131438 ?auto_2131434 ) ) ( AVAILABLE ?auto_2131434 ) ( SURFACE-AT ?auto_2131433 ?auto_2131436 ) ( ON ?auto_2131433 ?auto_2131437 ) ( CLEAR ?auto_2131433 ) ( not ( = ?auto_2131432 ?auto_2131437 ) ) ( not ( = ?auto_2131433 ?auto_2131437 ) ) ( not ( = ?auto_2131440 ?auto_2131437 ) ) ( TRUCK-AT ?auto_2131439 ?auto_2131435 ) ( LIFTING ?auto_2131438 ?auto_2131441 ) ( IS-CRATE ?auto_2131441 ) ( not ( = ?auto_2131432 ?auto_2131441 ) ) ( not ( = ?auto_2131433 ?auto_2131441 ) ) ( not ( = ?auto_2131440 ?auto_2131441 ) ) ( not ( = ?auto_2131437 ?auto_2131441 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2131438 ?auto_2131441 ?auto_2131439 ?auto_2131435 )
      ( MAKE-1CRATE ?auto_2131432 ?auto_2131433 )
      ( MAKE-1CRATE-VERIFY ?auto_2131432 ?auto_2131433 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2132510 - SURFACE
      ?auto_2132511 - SURFACE
      ?auto_2132512 - SURFACE
      ?auto_2132514 - SURFACE
      ?auto_2132513 - SURFACE
      ?auto_2132515 - SURFACE
      ?auto_2132516 - SURFACE
      ?auto_2132517 - SURFACE
    )
    :vars
    (
      ?auto_2132518 - HOIST
      ?auto_2132519 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2132518 ?auto_2132519 ) ( SURFACE-AT ?auto_2132516 ?auto_2132519 ) ( CLEAR ?auto_2132516 ) ( LIFTING ?auto_2132518 ?auto_2132517 ) ( IS-CRATE ?auto_2132517 ) ( not ( = ?auto_2132516 ?auto_2132517 ) ) ( ON ?auto_2132511 ?auto_2132510 ) ( ON ?auto_2132512 ?auto_2132511 ) ( ON ?auto_2132514 ?auto_2132512 ) ( ON ?auto_2132513 ?auto_2132514 ) ( ON ?auto_2132515 ?auto_2132513 ) ( ON ?auto_2132516 ?auto_2132515 ) ( not ( = ?auto_2132510 ?auto_2132511 ) ) ( not ( = ?auto_2132510 ?auto_2132512 ) ) ( not ( = ?auto_2132510 ?auto_2132514 ) ) ( not ( = ?auto_2132510 ?auto_2132513 ) ) ( not ( = ?auto_2132510 ?auto_2132515 ) ) ( not ( = ?auto_2132510 ?auto_2132516 ) ) ( not ( = ?auto_2132510 ?auto_2132517 ) ) ( not ( = ?auto_2132511 ?auto_2132512 ) ) ( not ( = ?auto_2132511 ?auto_2132514 ) ) ( not ( = ?auto_2132511 ?auto_2132513 ) ) ( not ( = ?auto_2132511 ?auto_2132515 ) ) ( not ( = ?auto_2132511 ?auto_2132516 ) ) ( not ( = ?auto_2132511 ?auto_2132517 ) ) ( not ( = ?auto_2132512 ?auto_2132514 ) ) ( not ( = ?auto_2132512 ?auto_2132513 ) ) ( not ( = ?auto_2132512 ?auto_2132515 ) ) ( not ( = ?auto_2132512 ?auto_2132516 ) ) ( not ( = ?auto_2132512 ?auto_2132517 ) ) ( not ( = ?auto_2132514 ?auto_2132513 ) ) ( not ( = ?auto_2132514 ?auto_2132515 ) ) ( not ( = ?auto_2132514 ?auto_2132516 ) ) ( not ( = ?auto_2132514 ?auto_2132517 ) ) ( not ( = ?auto_2132513 ?auto_2132515 ) ) ( not ( = ?auto_2132513 ?auto_2132516 ) ) ( not ( = ?auto_2132513 ?auto_2132517 ) ) ( not ( = ?auto_2132515 ?auto_2132516 ) ) ( not ( = ?auto_2132515 ?auto_2132517 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2132516 ?auto_2132517 )
      ( MAKE-7CRATE-VERIFY ?auto_2132510 ?auto_2132511 ?auto_2132512 ?auto_2132514 ?auto_2132513 ?auto_2132515 ?auto_2132516 ?auto_2132517 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2132565 - SURFACE
      ?auto_2132566 - SURFACE
      ?auto_2132567 - SURFACE
      ?auto_2132569 - SURFACE
      ?auto_2132568 - SURFACE
      ?auto_2132570 - SURFACE
      ?auto_2132571 - SURFACE
      ?auto_2132572 - SURFACE
    )
    :vars
    (
      ?auto_2132575 - HOIST
      ?auto_2132574 - PLACE
      ?auto_2132573 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2132575 ?auto_2132574 ) ( SURFACE-AT ?auto_2132571 ?auto_2132574 ) ( CLEAR ?auto_2132571 ) ( IS-CRATE ?auto_2132572 ) ( not ( = ?auto_2132571 ?auto_2132572 ) ) ( TRUCK-AT ?auto_2132573 ?auto_2132574 ) ( AVAILABLE ?auto_2132575 ) ( IN ?auto_2132572 ?auto_2132573 ) ( ON ?auto_2132571 ?auto_2132570 ) ( not ( = ?auto_2132570 ?auto_2132571 ) ) ( not ( = ?auto_2132570 ?auto_2132572 ) ) ( ON ?auto_2132566 ?auto_2132565 ) ( ON ?auto_2132567 ?auto_2132566 ) ( ON ?auto_2132569 ?auto_2132567 ) ( ON ?auto_2132568 ?auto_2132569 ) ( ON ?auto_2132570 ?auto_2132568 ) ( not ( = ?auto_2132565 ?auto_2132566 ) ) ( not ( = ?auto_2132565 ?auto_2132567 ) ) ( not ( = ?auto_2132565 ?auto_2132569 ) ) ( not ( = ?auto_2132565 ?auto_2132568 ) ) ( not ( = ?auto_2132565 ?auto_2132570 ) ) ( not ( = ?auto_2132565 ?auto_2132571 ) ) ( not ( = ?auto_2132565 ?auto_2132572 ) ) ( not ( = ?auto_2132566 ?auto_2132567 ) ) ( not ( = ?auto_2132566 ?auto_2132569 ) ) ( not ( = ?auto_2132566 ?auto_2132568 ) ) ( not ( = ?auto_2132566 ?auto_2132570 ) ) ( not ( = ?auto_2132566 ?auto_2132571 ) ) ( not ( = ?auto_2132566 ?auto_2132572 ) ) ( not ( = ?auto_2132567 ?auto_2132569 ) ) ( not ( = ?auto_2132567 ?auto_2132568 ) ) ( not ( = ?auto_2132567 ?auto_2132570 ) ) ( not ( = ?auto_2132567 ?auto_2132571 ) ) ( not ( = ?auto_2132567 ?auto_2132572 ) ) ( not ( = ?auto_2132569 ?auto_2132568 ) ) ( not ( = ?auto_2132569 ?auto_2132570 ) ) ( not ( = ?auto_2132569 ?auto_2132571 ) ) ( not ( = ?auto_2132569 ?auto_2132572 ) ) ( not ( = ?auto_2132568 ?auto_2132570 ) ) ( not ( = ?auto_2132568 ?auto_2132571 ) ) ( not ( = ?auto_2132568 ?auto_2132572 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2132570 ?auto_2132571 ?auto_2132572 )
      ( MAKE-7CRATE-VERIFY ?auto_2132565 ?auto_2132566 ?auto_2132567 ?auto_2132569 ?auto_2132568 ?auto_2132570 ?auto_2132571 ?auto_2132572 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2132628 - SURFACE
      ?auto_2132629 - SURFACE
      ?auto_2132630 - SURFACE
      ?auto_2132632 - SURFACE
      ?auto_2132631 - SURFACE
      ?auto_2132633 - SURFACE
      ?auto_2132634 - SURFACE
      ?auto_2132635 - SURFACE
    )
    :vars
    (
      ?auto_2132638 - HOIST
      ?auto_2132636 - PLACE
      ?auto_2132637 - TRUCK
      ?auto_2132639 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2132638 ?auto_2132636 ) ( SURFACE-AT ?auto_2132634 ?auto_2132636 ) ( CLEAR ?auto_2132634 ) ( IS-CRATE ?auto_2132635 ) ( not ( = ?auto_2132634 ?auto_2132635 ) ) ( AVAILABLE ?auto_2132638 ) ( IN ?auto_2132635 ?auto_2132637 ) ( ON ?auto_2132634 ?auto_2132633 ) ( not ( = ?auto_2132633 ?auto_2132634 ) ) ( not ( = ?auto_2132633 ?auto_2132635 ) ) ( TRUCK-AT ?auto_2132637 ?auto_2132639 ) ( not ( = ?auto_2132639 ?auto_2132636 ) ) ( ON ?auto_2132629 ?auto_2132628 ) ( ON ?auto_2132630 ?auto_2132629 ) ( ON ?auto_2132632 ?auto_2132630 ) ( ON ?auto_2132631 ?auto_2132632 ) ( ON ?auto_2132633 ?auto_2132631 ) ( not ( = ?auto_2132628 ?auto_2132629 ) ) ( not ( = ?auto_2132628 ?auto_2132630 ) ) ( not ( = ?auto_2132628 ?auto_2132632 ) ) ( not ( = ?auto_2132628 ?auto_2132631 ) ) ( not ( = ?auto_2132628 ?auto_2132633 ) ) ( not ( = ?auto_2132628 ?auto_2132634 ) ) ( not ( = ?auto_2132628 ?auto_2132635 ) ) ( not ( = ?auto_2132629 ?auto_2132630 ) ) ( not ( = ?auto_2132629 ?auto_2132632 ) ) ( not ( = ?auto_2132629 ?auto_2132631 ) ) ( not ( = ?auto_2132629 ?auto_2132633 ) ) ( not ( = ?auto_2132629 ?auto_2132634 ) ) ( not ( = ?auto_2132629 ?auto_2132635 ) ) ( not ( = ?auto_2132630 ?auto_2132632 ) ) ( not ( = ?auto_2132630 ?auto_2132631 ) ) ( not ( = ?auto_2132630 ?auto_2132633 ) ) ( not ( = ?auto_2132630 ?auto_2132634 ) ) ( not ( = ?auto_2132630 ?auto_2132635 ) ) ( not ( = ?auto_2132632 ?auto_2132631 ) ) ( not ( = ?auto_2132632 ?auto_2132633 ) ) ( not ( = ?auto_2132632 ?auto_2132634 ) ) ( not ( = ?auto_2132632 ?auto_2132635 ) ) ( not ( = ?auto_2132631 ?auto_2132633 ) ) ( not ( = ?auto_2132631 ?auto_2132634 ) ) ( not ( = ?auto_2132631 ?auto_2132635 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2132633 ?auto_2132634 ?auto_2132635 )
      ( MAKE-7CRATE-VERIFY ?auto_2132628 ?auto_2132629 ?auto_2132630 ?auto_2132632 ?auto_2132631 ?auto_2132633 ?auto_2132634 ?auto_2132635 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2132698 - SURFACE
      ?auto_2132699 - SURFACE
      ?auto_2132700 - SURFACE
      ?auto_2132702 - SURFACE
      ?auto_2132701 - SURFACE
      ?auto_2132703 - SURFACE
      ?auto_2132704 - SURFACE
      ?auto_2132705 - SURFACE
    )
    :vars
    (
      ?auto_2132706 - HOIST
      ?auto_2132708 - PLACE
      ?auto_2132709 - TRUCK
      ?auto_2132707 - PLACE
      ?auto_2132710 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2132706 ?auto_2132708 ) ( SURFACE-AT ?auto_2132704 ?auto_2132708 ) ( CLEAR ?auto_2132704 ) ( IS-CRATE ?auto_2132705 ) ( not ( = ?auto_2132704 ?auto_2132705 ) ) ( AVAILABLE ?auto_2132706 ) ( ON ?auto_2132704 ?auto_2132703 ) ( not ( = ?auto_2132703 ?auto_2132704 ) ) ( not ( = ?auto_2132703 ?auto_2132705 ) ) ( TRUCK-AT ?auto_2132709 ?auto_2132707 ) ( not ( = ?auto_2132707 ?auto_2132708 ) ) ( HOIST-AT ?auto_2132710 ?auto_2132707 ) ( LIFTING ?auto_2132710 ?auto_2132705 ) ( not ( = ?auto_2132706 ?auto_2132710 ) ) ( ON ?auto_2132699 ?auto_2132698 ) ( ON ?auto_2132700 ?auto_2132699 ) ( ON ?auto_2132702 ?auto_2132700 ) ( ON ?auto_2132701 ?auto_2132702 ) ( ON ?auto_2132703 ?auto_2132701 ) ( not ( = ?auto_2132698 ?auto_2132699 ) ) ( not ( = ?auto_2132698 ?auto_2132700 ) ) ( not ( = ?auto_2132698 ?auto_2132702 ) ) ( not ( = ?auto_2132698 ?auto_2132701 ) ) ( not ( = ?auto_2132698 ?auto_2132703 ) ) ( not ( = ?auto_2132698 ?auto_2132704 ) ) ( not ( = ?auto_2132698 ?auto_2132705 ) ) ( not ( = ?auto_2132699 ?auto_2132700 ) ) ( not ( = ?auto_2132699 ?auto_2132702 ) ) ( not ( = ?auto_2132699 ?auto_2132701 ) ) ( not ( = ?auto_2132699 ?auto_2132703 ) ) ( not ( = ?auto_2132699 ?auto_2132704 ) ) ( not ( = ?auto_2132699 ?auto_2132705 ) ) ( not ( = ?auto_2132700 ?auto_2132702 ) ) ( not ( = ?auto_2132700 ?auto_2132701 ) ) ( not ( = ?auto_2132700 ?auto_2132703 ) ) ( not ( = ?auto_2132700 ?auto_2132704 ) ) ( not ( = ?auto_2132700 ?auto_2132705 ) ) ( not ( = ?auto_2132702 ?auto_2132701 ) ) ( not ( = ?auto_2132702 ?auto_2132703 ) ) ( not ( = ?auto_2132702 ?auto_2132704 ) ) ( not ( = ?auto_2132702 ?auto_2132705 ) ) ( not ( = ?auto_2132701 ?auto_2132703 ) ) ( not ( = ?auto_2132701 ?auto_2132704 ) ) ( not ( = ?auto_2132701 ?auto_2132705 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2132703 ?auto_2132704 ?auto_2132705 )
      ( MAKE-7CRATE-VERIFY ?auto_2132698 ?auto_2132699 ?auto_2132700 ?auto_2132702 ?auto_2132701 ?auto_2132703 ?auto_2132704 ?auto_2132705 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2132775 - SURFACE
      ?auto_2132776 - SURFACE
      ?auto_2132777 - SURFACE
      ?auto_2132779 - SURFACE
      ?auto_2132778 - SURFACE
      ?auto_2132780 - SURFACE
      ?auto_2132781 - SURFACE
      ?auto_2132782 - SURFACE
    )
    :vars
    (
      ?auto_2132786 - HOIST
      ?auto_2132788 - PLACE
      ?auto_2132783 - TRUCK
      ?auto_2132787 - PLACE
      ?auto_2132785 - HOIST
      ?auto_2132784 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2132786 ?auto_2132788 ) ( SURFACE-AT ?auto_2132781 ?auto_2132788 ) ( CLEAR ?auto_2132781 ) ( IS-CRATE ?auto_2132782 ) ( not ( = ?auto_2132781 ?auto_2132782 ) ) ( AVAILABLE ?auto_2132786 ) ( ON ?auto_2132781 ?auto_2132780 ) ( not ( = ?auto_2132780 ?auto_2132781 ) ) ( not ( = ?auto_2132780 ?auto_2132782 ) ) ( TRUCK-AT ?auto_2132783 ?auto_2132787 ) ( not ( = ?auto_2132787 ?auto_2132788 ) ) ( HOIST-AT ?auto_2132785 ?auto_2132787 ) ( not ( = ?auto_2132786 ?auto_2132785 ) ) ( AVAILABLE ?auto_2132785 ) ( SURFACE-AT ?auto_2132782 ?auto_2132787 ) ( ON ?auto_2132782 ?auto_2132784 ) ( CLEAR ?auto_2132782 ) ( not ( = ?auto_2132781 ?auto_2132784 ) ) ( not ( = ?auto_2132782 ?auto_2132784 ) ) ( not ( = ?auto_2132780 ?auto_2132784 ) ) ( ON ?auto_2132776 ?auto_2132775 ) ( ON ?auto_2132777 ?auto_2132776 ) ( ON ?auto_2132779 ?auto_2132777 ) ( ON ?auto_2132778 ?auto_2132779 ) ( ON ?auto_2132780 ?auto_2132778 ) ( not ( = ?auto_2132775 ?auto_2132776 ) ) ( not ( = ?auto_2132775 ?auto_2132777 ) ) ( not ( = ?auto_2132775 ?auto_2132779 ) ) ( not ( = ?auto_2132775 ?auto_2132778 ) ) ( not ( = ?auto_2132775 ?auto_2132780 ) ) ( not ( = ?auto_2132775 ?auto_2132781 ) ) ( not ( = ?auto_2132775 ?auto_2132782 ) ) ( not ( = ?auto_2132775 ?auto_2132784 ) ) ( not ( = ?auto_2132776 ?auto_2132777 ) ) ( not ( = ?auto_2132776 ?auto_2132779 ) ) ( not ( = ?auto_2132776 ?auto_2132778 ) ) ( not ( = ?auto_2132776 ?auto_2132780 ) ) ( not ( = ?auto_2132776 ?auto_2132781 ) ) ( not ( = ?auto_2132776 ?auto_2132782 ) ) ( not ( = ?auto_2132776 ?auto_2132784 ) ) ( not ( = ?auto_2132777 ?auto_2132779 ) ) ( not ( = ?auto_2132777 ?auto_2132778 ) ) ( not ( = ?auto_2132777 ?auto_2132780 ) ) ( not ( = ?auto_2132777 ?auto_2132781 ) ) ( not ( = ?auto_2132777 ?auto_2132782 ) ) ( not ( = ?auto_2132777 ?auto_2132784 ) ) ( not ( = ?auto_2132779 ?auto_2132778 ) ) ( not ( = ?auto_2132779 ?auto_2132780 ) ) ( not ( = ?auto_2132779 ?auto_2132781 ) ) ( not ( = ?auto_2132779 ?auto_2132782 ) ) ( not ( = ?auto_2132779 ?auto_2132784 ) ) ( not ( = ?auto_2132778 ?auto_2132780 ) ) ( not ( = ?auto_2132778 ?auto_2132781 ) ) ( not ( = ?auto_2132778 ?auto_2132782 ) ) ( not ( = ?auto_2132778 ?auto_2132784 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2132780 ?auto_2132781 ?auto_2132782 )
      ( MAKE-7CRATE-VERIFY ?auto_2132775 ?auto_2132776 ?auto_2132777 ?auto_2132779 ?auto_2132778 ?auto_2132780 ?auto_2132781 ?auto_2132782 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2132853 - SURFACE
      ?auto_2132854 - SURFACE
      ?auto_2132855 - SURFACE
      ?auto_2132857 - SURFACE
      ?auto_2132856 - SURFACE
      ?auto_2132858 - SURFACE
      ?auto_2132859 - SURFACE
      ?auto_2132860 - SURFACE
    )
    :vars
    (
      ?auto_2132865 - HOIST
      ?auto_2132861 - PLACE
      ?auto_2132863 - PLACE
      ?auto_2132862 - HOIST
      ?auto_2132866 - SURFACE
      ?auto_2132864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2132865 ?auto_2132861 ) ( SURFACE-AT ?auto_2132859 ?auto_2132861 ) ( CLEAR ?auto_2132859 ) ( IS-CRATE ?auto_2132860 ) ( not ( = ?auto_2132859 ?auto_2132860 ) ) ( AVAILABLE ?auto_2132865 ) ( ON ?auto_2132859 ?auto_2132858 ) ( not ( = ?auto_2132858 ?auto_2132859 ) ) ( not ( = ?auto_2132858 ?auto_2132860 ) ) ( not ( = ?auto_2132863 ?auto_2132861 ) ) ( HOIST-AT ?auto_2132862 ?auto_2132863 ) ( not ( = ?auto_2132865 ?auto_2132862 ) ) ( AVAILABLE ?auto_2132862 ) ( SURFACE-AT ?auto_2132860 ?auto_2132863 ) ( ON ?auto_2132860 ?auto_2132866 ) ( CLEAR ?auto_2132860 ) ( not ( = ?auto_2132859 ?auto_2132866 ) ) ( not ( = ?auto_2132860 ?auto_2132866 ) ) ( not ( = ?auto_2132858 ?auto_2132866 ) ) ( TRUCK-AT ?auto_2132864 ?auto_2132861 ) ( ON ?auto_2132854 ?auto_2132853 ) ( ON ?auto_2132855 ?auto_2132854 ) ( ON ?auto_2132857 ?auto_2132855 ) ( ON ?auto_2132856 ?auto_2132857 ) ( ON ?auto_2132858 ?auto_2132856 ) ( not ( = ?auto_2132853 ?auto_2132854 ) ) ( not ( = ?auto_2132853 ?auto_2132855 ) ) ( not ( = ?auto_2132853 ?auto_2132857 ) ) ( not ( = ?auto_2132853 ?auto_2132856 ) ) ( not ( = ?auto_2132853 ?auto_2132858 ) ) ( not ( = ?auto_2132853 ?auto_2132859 ) ) ( not ( = ?auto_2132853 ?auto_2132860 ) ) ( not ( = ?auto_2132853 ?auto_2132866 ) ) ( not ( = ?auto_2132854 ?auto_2132855 ) ) ( not ( = ?auto_2132854 ?auto_2132857 ) ) ( not ( = ?auto_2132854 ?auto_2132856 ) ) ( not ( = ?auto_2132854 ?auto_2132858 ) ) ( not ( = ?auto_2132854 ?auto_2132859 ) ) ( not ( = ?auto_2132854 ?auto_2132860 ) ) ( not ( = ?auto_2132854 ?auto_2132866 ) ) ( not ( = ?auto_2132855 ?auto_2132857 ) ) ( not ( = ?auto_2132855 ?auto_2132856 ) ) ( not ( = ?auto_2132855 ?auto_2132858 ) ) ( not ( = ?auto_2132855 ?auto_2132859 ) ) ( not ( = ?auto_2132855 ?auto_2132860 ) ) ( not ( = ?auto_2132855 ?auto_2132866 ) ) ( not ( = ?auto_2132857 ?auto_2132856 ) ) ( not ( = ?auto_2132857 ?auto_2132858 ) ) ( not ( = ?auto_2132857 ?auto_2132859 ) ) ( not ( = ?auto_2132857 ?auto_2132860 ) ) ( not ( = ?auto_2132857 ?auto_2132866 ) ) ( not ( = ?auto_2132856 ?auto_2132858 ) ) ( not ( = ?auto_2132856 ?auto_2132859 ) ) ( not ( = ?auto_2132856 ?auto_2132860 ) ) ( not ( = ?auto_2132856 ?auto_2132866 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2132858 ?auto_2132859 ?auto_2132860 )
      ( MAKE-7CRATE-VERIFY ?auto_2132853 ?auto_2132854 ?auto_2132855 ?auto_2132857 ?auto_2132856 ?auto_2132858 ?auto_2132859 ?auto_2132860 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2132931 - SURFACE
      ?auto_2132932 - SURFACE
      ?auto_2132933 - SURFACE
      ?auto_2132935 - SURFACE
      ?auto_2132934 - SURFACE
      ?auto_2132936 - SURFACE
      ?auto_2132937 - SURFACE
      ?auto_2132938 - SURFACE
    )
    :vars
    (
      ?auto_2132941 - HOIST
      ?auto_2132939 - PLACE
      ?auto_2132942 - PLACE
      ?auto_2132943 - HOIST
      ?auto_2132940 - SURFACE
      ?auto_2132944 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2132941 ?auto_2132939 ) ( IS-CRATE ?auto_2132938 ) ( not ( = ?auto_2132937 ?auto_2132938 ) ) ( not ( = ?auto_2132936 ?auto_2132937 ) ) ( not ( = ?auto_2132936 ?auto_2132938 ) ) ( not ( = ?auto_2132942 ?auto_2132939 ) ) ( HOIST-AT ?auto_2132943 ?auto_2132942 ) ( not ( = ?auto_2132941 ?auto_2132943 ) ) ( AVAILABLE ?auto_2132943 ) ( SURFACE-AT ?auto_2132938 ?auto_2132942 ) ( ON ?auto_2132938 ?auto_2132940 ) ( CLEAR ?auto_2132938 ) ( not ( = ?auto_2132937 ?auto_2132940 ) ) ( not ( = ?auto_2132938 ?auto_2132940 ) ) ( not ( = ?auto_2132936 ?auto_2132940 ) ) ( TRUCK-AT ?auto_2132944 ?auto_2132939 ) ( SURFACE-AT ?auto_2132936 ?auto_2132939 ) ( CLEAR ?auto_2132936 ) ( LIFTING ?auto_2132941 ?auto_2132937 ) ( IS-CRATE ?auto_2132937 ) ( ON ?auto_2132932 ?auto_2132931 ) ( ON ?auto_2132933 ?auto_2132932 ) ( ON ?auto_2132935 ?auto_2132933 ) ( ON ?auto_2132934 ?auto_2132935 ) ( ON ?auto_2132936 ?auto_2132934 ) ( not ( = ?auto_2132931 ?auto_2132932 ) ) ( not ( = ?auto_2132931 ?auto_2132933 ) ) ( not ( = ?auto_2132931 ?auto_2132935 ) ) ( not ( = ?auto_2132931 ?auto_2132934 ) ) ( not ( = ?auto_2132931 ?auto_2132936 ) ) ( not ( = ?auto_2132931 ?auto_2132937 ) ) ( not ( = ?auto_2132931 ?auto_2132938 ) ) ( not ( = ?auto_2132931 ?auto_2132940 ) ) ( not ( = ?auto_2132932 ?auto_2132933 ) ) ( not ( = ?auto_2132932 ?auto_2132935 ) ) ( not ( = ?auto_2132932 ?auto_2132934 ) ) ( not ( = ?auto_2132932 ?auto_2132936 ) ) ( not ( = ?auto_2132932 ?auto_2132937 ) ) ( not ( = ?auto_2132932 ?auto_2132938 ) ) ( not ( = ?auto_2132932 ?auto_2132940 ) ) ( not ( = ?auto_2132933 ?auto_2132935 ) ) ( not ( = ?auto_2132933 ?auto_2132934 ) ) ( not ( = ?auto_2132933 ?auto_2132936 ) ) ( not ( = ?auto_2132933 ?auto_2132937 ) ) ( not ( = ?auto_2132933 ?auto_2132938 ) ) ( not ( = ?auto_2132933 ?auto_2132940 ) ) ( not ( = ?auto_2132935 ?auto_2132934 ) ) ( not ( = ?auto_2132935 ?auto_2132936 ) ) ( not ( = ?auto_2132935 ?auto_2132937 ) ) ( not ( = ?auto_2132935 ?auto_2132938 ) ) ( not ( = ?auto_2132935 ?auto_2132940 ) ) ( not ( = ?auto_2132934 ?auto_2132936 ) ) ( not ( = ?auto_2132934 ?auto_2132937 ) ) ( not ( = ?auto_2132934 ?auto_2132938 ) ) ( not ( = ?auto_2132934 ?auto_2132940 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2132936 ?auto_2132937 ?auto_2132938 )
      ( MAKE-7CRATE-VERIFY ?auto_2132931 ?auto_2132932 ?auto_2132933 ?auto_2132935 ?auto_2132934 ?auto_2132936 ?auto_2132937 ?auto_2132938 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2133009 - SURFACE
      ?auto_2133010 - SURFACE
      ?auto_2133011 - SURFACE
      ?auto_2133013 - SURFACE
      ?auto_2133012 - SURFACE
      ?auto_2133014 - SURFACE
      ?auto_2133015 - SURFACE
      ?auto_2133016 - SURFACE
    )
    :vars
    (
      ?auto_2133019 - HOIST
      ?auto_2133017 - PLACE
      ?auto_2133018 - PLACE
      ?auto_2133020 - HOIST
      ?auto_2133022 - SURFACE
      ?auto_2133021 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2133019 ?auto_2133017 ) ( IS-CRATE ?auto_2133016 ) ( not ( = ?auto_2133015 ?auto_2133016 ) ) ( not ( = ?auto_2133014 ?auto_2133015 ) ) ( not ( = ?auto_2133014 ?auto_2133016 ) ) ( not ( = ?auto_2133018 ?auto_2133017 ) ) ( HOIST-AT ?auto_2133020 ?auto_2133018 ) ( not ( = ?auto_2133019 ?auto_2133020 ) ) ( AVAILABLE ?auto_2133020 ) ( SURFACE-AT ?auto_2133016 ?auto_2133018 ) ( ON ?auto_2133016 ?auto_2133022 ) ( CLEAR ?auto_2133016 ) ( not ( = ?auto_2133015 ?auto_2133022 ) ) ( not ( = ?auto_2133016 ?auto_2133022 ) ) ( not ( = ?auto_2133014 ?auto_2133022 ) ) ( TRUCK-AT ?auto_2133021 ?auto_2133017 ) ( SURFACE-AT ?auto_2133014 ?auto_2133017 ) ( CLEAR ?auto_2133014 ) ( IS-CRATE ?auto_2133015 ) ( AVAILABLE ?auto_2133019 ) ( IN ?auto_2133015 ?auto_2133021 ) ( ON ?auto_2133010 ?auto_2133009 ) ( ON ?auto_2133011 ?auto_2133010 ) ( ON ?auto_2133013 ?auto_2133011 ) ( ON ?auto_2133012 ?auto_2133013 ) ( ON ?auto_2133014 ?auto_2133012 ) ( not ( = ?auto_2133009 ?auto_2133010 ) ) ( not ( = ?auto_2133009 ?auto_2133011 ) ) ( not ( = ?auto_2133009 ?auto_2133013 ) ) ( not ( = ?auto_2133009 ?auto_2133012 ) ) ( not ( = ?auto_2133009 ?auto_2133014 ) ) ( not ( = ?auto_2133009 ?auto_2133015 ) ) ( not ( = ?auto_2133009 ?auto_2133016 ) ) ( not ( = ?auto_2133009 ?auto_2133022 ) ) ( not ( = ?auto_2133010 ?auto_2133011 ) ) ( not ( = ?auto_2133010 ?auto_2133013 ) ) ( not ( = ?auto_2133010 ?auto_2133012 ) ) ( not ( = ?auto_2133010 ?auto_2133014 ) ) ( not ( = ?auto_2133010 ?auto_2133015 ) ) ( not ( = ?auto_2133010 ?auto_2133016 ) ) ( not ( = ?auto_2133010 ?auto_2133022 ) ) ( not ( = ?auto_2133011 ?auto_2133013 ) ) ( not ( = ?auto_2133011 ?auto_2133012 ) ) ( not ( = ?auto_2133011 ?auto_2133014 ) ) ( not ( = ?auto_2133011 ?auto_2133015 ) ) ( not ( = ?auto_2133011 ?auto_2133016 ) ) ( not ( = ?auto_2133011 ?auto_2133022 ) ) ( not ( = ?auto_2133013 ?auto_2133012 ) ) ( not ( = ?auto_2133013 ?auto_2133014 ) ) ( not ( = ?auto_2133013 ?auto_2133015 ) ) ( not ( = ?auto_2133013 ?auto_2133016 ) ) ( not ( = ?auto_2133013 ?auto_2133022 ) ) ( not ( = ?auto_2133012 ?auto_2133014 ) ) ( not ( = ?auto_2133012 ?auto_2133015 ) ) ( not ( = ?auto_2133012 ?auto_2133016 ) ) ( not ( = ?auto_2133012 ?auto_2133022 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2133014 ?auto_2133015 ?auto_2133016 )
      ( MAKE-7CRATE-VERIFY ?auto_2133009 ?auto_2133010 ?auto_2133011 ?auto_2133013 ?auto_2133012 ?auto_2133014 ?auto_2133015 ?auto_2133016 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2135913 - SURFACE
      ?auto_2135914 - SURFACE
      ?auto_2135915 - SURFACE
      ?auto_2135917 - SURFACE
      ?auto_2135916 - SURFACE
      ?auto_2135918 - SURFACE
      ?auto_2135919 - SURFACE
      ?auto_2135920 - SURFACE
      ?auto_2135921 - SURFACE
    )
    :vars
    (
      ?auto_2135923 - HOIST
      ?auto_2135922 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2135923 ?auto_2135922 ) ( SURFACE-AT ?auto_2135920 ?auto_2135922 ) ( CLEAR ?auto_2135920 ) ( LIFTING ?auto_2135923 ?auto_2135921 ) ( IS-CRATE ?auto_2135921 ) ( not ( = ?auto_2135920 ?auto_2135921 ) ) ( ON ?auto_2135914 ?auto_2135913 ) ( ON ?auto_2135915 ?auto_2135914 ) ( ON ?auto_2135917 ?auto_2135915 ) ( ON ?auto_2135916 ?auto_2135917 ) ( ON ?auto_2135918 ?auto_2135916 ) ( ON ?auto_2135919 ?auto_2135918 ) ( ON ?auto_2135920 ?auto_2135919 ) ( not ( = ?auto_2135913 ?auto_2135914 ) ) ( not ( = ?auto_2135913 ?auto_2135915 ) ) ( not ( = ?auto_2135913 ?auto_2135917 ) ) ( not ( = ?auto_2135913 ?auto_2135916 ) ) ( not ( = ?auto_2135913 ?auto_2135918 ) ) ( not ( = ?auto_2135913 ?auto_2135919 ) ) ( not ( = ?auto_2135913 ?auto_2135920 ) ) ( not ( = ?auto_2135913 ?auto_2135921 ) ) ( not ( = ?auto_2135914 ?auto_2135915 ) ) ( not ( = ?auto_2135914 ?auto_2135917 ) ) ( not ( = ?auto_2135914 ?auto_2135916 ) ) ( not ( = ?auto_2135914 ?auto_2135918 ) ) ( not ( = ?auto_2135914 ?auto_2135919 ) ) ( not ( = ?auto_2135914 ?auto_2135920 ) ) ( not ( = ?auto_2135914 ?auto_2135921 ) ) ( not ( = ?auto_2135915 ?auto_2135917 ) ) ( not ( = ?auto_2135915 ?auto_2135916 ) ) ( not ( = ?auto_2135915 ?auto_2135918 ) ) ( not ( = ?auto_2135915 ?auto_2135919 ) ) ( not ( = ?auto_2135915 ?auto_2135920 ) ) ( not ( = ?auto_2135915 ?auto_2135921 ) ) ( not ( = ?auto_2135917 ?auto_2135916 ) ) ( not ( = ?auto_2135917 ?auto_2135918 ) ) ( not ( = ?auto_2135917 ?auto_2135919 ) ) ( not ( = ?auto_2135917 ?auto_2135920 ) ) ( not ( = ?auto_2135917 ?auto_2135921 ) ) ( not ( = ?auto_2135916 ?auto_2135918 ) ) ( not ( = ?auto_2135916 ?auto_2135919 ) ) ( not ( = ?auto_2135916 ?auto_2135920 ) ) ( not ( = ?auto_2135916 ?auto_2135921 ) ) ( not ( = ?auto_2135918 ?auto_2135919 ) ) ( not ( = ?auto_2135918 ?auto_2135920 ) ) ( not ( = ?auto_2135918 ?auto_2135921 ) ) ( not ( = ?auto_2135919 ?auto_2135920 ) ) ( not ( = ?auto_2135919 ?auto_2135921 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2135920 ?auto_2135921 )
      ( MAKE-8CRATE-VERIFY ?auto_2135913 ?auto_2135914 ?auto_2135915 ?auto_2135917 ?auto_2135916 ?auto_2135918 ?auto_2135919 ?auto_2135920 ?auto_2135921 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2135980 - SURFACE
      ?auto_2135981 - SURFACE
      ?auto_2135982 - SURFACE
      ?auto_2135984 - SURFACE
      ?auto_2135983 - SURFACE
      ?auto_2135985 - SURFACE
      ?auto_2135986 - SURFACE
      ?auto_2135987 - SURFACE
      ?auto_2135988 - SURFACE
    )
    :vars
    (
      ?auto_2135991 - HOIST
      ?auto_2135989 - PLACE
      ?auto_2135990 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2135991 ?auto_2135989 ) ( SURFACE-AT ?auto_2135987 ?auto_2135989 ) ( CLEAR ?auto_2135987 ) ( IS-CRATE ?auto_2135988 ) ( not ( = ?auto_2135987 ?auto_2135988 ) ) ( TRUCK-AT ?auto_2135990 ?auto_2135989 ) ( AVAILABLE ?auto_2135991 ) ( IN ?auto_2135988 ?auto_2135990 ) ( ON ?auto_2135987 ?auto_2135986 ) ( not ( = ?auto_2135986 ?auto_2135987 ) ) ( not ( = ?auto_2135986 ?auto_2135988 ) ) ( ON ?auto_2135981 ?auto_2135980 ) ( ON ?auto_2135982 ?auto_2135981 ) ( ON ?auto_2135984 ?auto_2135982 ) ( ON ?auto_2135983 ?auto_2135984 ) ( ON ?auto_2135985 ?auto_2135983 ) ( ON ?auto_2135986 ?auto_2135985 ) ( not ( = ?auto_2135980 ?auto_2135981 ) ) ( not ( = ?auto_2135980 ?auto_2135982 ) ) ( not ( = ?auto_2135980 ?auto_2135984 ) ) ( not ( = ?auto_2135980 ?auto_2135983 ) ) ( not ( = ?auto_2135980 ?auto_2135985 ) ) ( not ( = ?auto_2135980 ?auto_2135986 ) ) ( not ( = ?auto_2135980 ?auto_2135987 ) ) ( not ( = ?auto_2135980 ?auto_2135988 ) ) ( not ( = ?auto_2135981 ?auto_2135982 ) ) ( not ( = ?auto_2135981 ?auto_2135984 ) ) ( not ( = ?auto_2135981 ?auto_2135983 ) ) ( not ( = ?auto_2135981 ?auto_2135985 ) ) ( not ( = ?auto_2135981 ?auto_2135986 ) ) ( not ( = ?auto_2135981 ?auto_2135987 ) ) ( not ( = ?auto_2135981 ?auto_2135988 ) ) ( not ( = ?auto_2135982 ?auto_2135984 ) ) ( not ( = ?auto_2135982 ?auto_2135983 ) ) ( not ( = ?auto_2135982 ?auto_2135985 ) ) ( not ( = ?auto_2135982 ?auto_2135986 ) ) ( not ( = ?auto_2135982 ?auto_2135987 ) ) ( not ( = ?auto_2135982 ?auto_2135988 ) ) ( not ( = ?auto_2135984 ?auto_2135983 ) ) ( not ( = ?auto_2135984 ?auto_2135985 ) ) ( not ( = ?auto_2135984 ?auto_2135986 ) ) ( not ( = ?auto_2135984 ?auto_2135987 ) ) ( not ( = ?auto_2135984 ?auto_2135988 ) ) ( not ( = ?auto_2135983 ?auto_2135985 ) ) ( not ( = ?auto_2135983 ?auto_2135986 ) ) ( not ( = ?auto_2135983 ?auto_2135987 ) ) ( not ( = ?auto_2135983 ?auto_2135988 ) ) ( not ( = ?auto_2135985 ?auto_2135986 ) ) ( not ( = ?auto_2135985 ?auto_2135987 ) ) ( not ( = ?auto_2135985 ?auto_2135988 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2135986 ?auto_2135987 ?auto_2135988 )
      ( MAKE-8CRATE-VERIFY ?auto_2135980 ?auto_2135981 ?auto_2135982 ?auto_2135984 ?auto_2135983 ?auto_2135985 ?auto_2135986 ?auto_2135987 ?auto_2135988 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2136056 - SURFACE
      ?auto_2136057 - SURFACE
      ?auto_2136058 - SURFACE
      ?auto_2136060 - SURFACE
      ?auto_2136059 - SURFACE
      ?auto_2136061 - SURFACE
      ?auto_2136062 - SURFACE
      ?auto_2136063 - SURFACE
      ?auto_2136064 - SURFACE
    )
    :vars
    (
      ?auto_2136066 - HOIST
      ?auto_2136067 - PLACE
      ?auto_2136068 - TRUCK
      ?auto_2136065 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2136066 ?auto_2136067 ) ( SURFACE-AT ?auto_2136063 ?auto_2136067 ) ( CLEAR ?auto_2136063 ) ( IS-CRATE ?auto_2136064 ) ( not ( = ?auto_2136063 ?auto_2136064 ) ) ( AVAILABLE ?auto_2136066 ) ( IN ?auto_2136064 ?auto_2136068 ) ( ON ?auto_2136063 ?auto_2136062 ) ( not ( = ?auto_2136062 ?auto_2136063 ) ) ( not ( = ?auto_2136062 ?auto_2136064 ) ) ( TRUCK-AT ?auto_2136068 ?auto_2136065 ) ( not ( = ?auto_2136065 ?auto_2136067 ) ) ( ON ?auto_2136057 ?auto_2136056 ) ( ON ?auto_2136058 ?auto_2136057 ) ( ON ?auto_2136060 ?auto_2136058 ) ( ON ?auto_2136059 ?auto_2136060 ) ( ON ?auto_2136061 ?auto_2136059 ) ( ON ?auto_2136062 ?auto_2136061 ) ( not ( = ?auto_2136056 ?auto_2136057 ) ) ( not ( = ?auto_2136056 ?auto_2136058 ) ) ( not ( = ?auto_2136056 ?auto_2136060 ) ) ( not ( = ?auto_2136056 ?auto_2136059 ) ) ( not ( = ?auto_2136056 ?auto_2136061 ) ) ( not ( = ?auto_2136056 ?auto_2136062 ) ) ( not ( = ?auto_2136056 ?auto_2136063 ) ) ( not ( = ?auto_2136056 ?auto_2136064 ) ) ( not ( = ?auto_2136057 ?auto_2136058 ) ) ( not ( = ?auto_2136057 ?auto_2136060 ) ) ( not ( = ?auto_2136057 ?auto_2136059 ) ) ( not ( = ?auto_2136057 ?auto_2136061 ) ) ( not ( = ?auto_2136057 ?auto_2136062 ) ) ( not ( = ?auto_2136057 ?auto_2136063 ) ) ( not ( = ?auto_2136057 ?auto_2136064 ) ) ( not ( = ?auto_2136058 ?auto_2136060 ) ) ( not ( = ?auto_2136058 ?auto_2136059 ) ) ( not ( = ?auto_2136058 ?auto_2136061 ) ) ( not ( = ?auto_2136058 ?auto_2136062 ) ) ( not ( = ?auto_2136058 ?auto_2136063 ) ) ( not ( = ?auto_2136058 ?auto_2136064 ) ) ( not ( = ?auto_2136060 ?auto_2136059 ) ) ( not ( = ?auto_2136060 ?auto_2136061 ) ) ( not ( = ?auto_2136060 ?auto_2136062 ) ) ( not ( = ?auto_2136060 ?auto_2136063 ) ) ( not ( = ?auto_2136060 ?auto_2136064 ) ) ( not ( = ?auto_2136059 ?auto_2136061 ) ) ( not ( = ?auto_2136059 ?auto_2136062 ) ) ( not ( = ?auto_2136059 ?auto_2136063 ) ) ( not ( = ?auto_2136059 ?auto_2136064 ) ) ( not ( = ?auto_2136061 ?auto_2136062 ) ) ( not ( = ?auto_2136061 ?auto_2136063 ) ) ( not ( = ?auto_2136061 ?auto_2136064 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2136062 ?auto_2136063 ?auto_2136064 )
      ( MAKE-8CRATE-VERIFY ?auto_2136056 ?auto_2136057 ?auto_2136058 ?auto_2136060 ?auto_2136059 ?auto_2136061 ?auto_2136062 ?auto_2136063 ?auto_2136064 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2136140 - SURFACE
      ?auto_2136141 - SURFACE
      ?auto_2136142 - SURFACE
      ?auto_2136144 - SURFACE
      ?auto_2136143 - SURFACE
      ?auto_2136145 - SURFACE
      ?auto_2136146 - SURFACE
      ?auto_2136147 - SURFACE
      ?auto_2136148 - SURFACE
    )
    :vars
    (
      ?auto_2136150 - HOIST
      ?auto_2136152 - PLACE
      ?auto_2136151 - TRUCK
      ?auto_2136153 - PLACE
      ?auto_2136149 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2136150 ?auto_2136152 ) ( SURFACE-AT ?auto_2136147 ?auto_2136152 ) ( CLEAR ?auto_2136147 ) ( IS-CRATE ?auto_2136148 ) ( not ( = ?auto_2136147 ?auto_2136148 ) ) ( AVAILABLE ?auto_2136150 ) ( ON ?auto_2136147 ?auto_2136146 ) ( not ( = ?auto_2136146 ?auto_2136147 ) ) ( not ( = ?auto_2136146 ?auto_2136148 ) ) ( TRUCK-AT ?auto_2136151 ?auto_2136153 ) ( not ( = ?auto_2136153 ?auto_2136152 ) ) ( HOIST-AT ?auto_2136149 ?auto_2136153 ) ( LIFTING ?auto_2136149 ?auto_2136148 ) ( not ( = ?auto_2136150 ?auto_2136149 ) ) ( ON ?auto_2136141 ?auto_2136140 ) ( ON ?auto_2136142 ?auto_2136141 ) ( ON ?auto_2136144 ?auto_2136142 ) ( ON ?auto_2136143 ?auto_2136144 ) ( ON ?auto_2136145 ?auto_2136143 ) ( ON ?auto_2136146 ?auto_2136145 ) ( not ( = ?auto_2136140 ?auto_2136141 ) ) ( not ( = ?auto_2136140 ?auto_2136142 ) ) ( not ( = ?auto_2136140 ?auto_2136144 ) ) ( not ( = ?auto_2136140 ?auto_2136143 ) ) ( not ( = ?auto_2136140 ?auto_2136145 ) ) ( not ( = ?auto_2136140 ?auto_2136146 ) ) ( not ( = ?auto_2136140 ?auto_2136147 ) ) ( not ( = ?auto_2136140 ?auto_2136148 ) ) ( not ( = ?auto_2136141 ?auto_2136142 ) ) ( not ( = ?auto_2136141 ?auto_2136144 ) ) ( not ( = ?auto_2136141 ?auto_2136143 ) ) ( not ( = ?auto_2136141 ?auto_2136145 ) ) ( not ( = ?auto_2136141 ?auto_2136146 ) ) ( not ( = ?auto_2136141 ?auto_2136147 ) ) ( not ( = ?auto_2136141 ?auto_2136148 ) ) ( not ( = ?auto_2136142 ?auto_2136144 ) ) ( not ( = ?auto_2136142 ?auto_2136143 ) ) ( not ( = ?auto_2136142 ?auto_2136145 ) ) ( not ( = ?auto_2136142 ?auto_2136146 ) ) ( not ( = ?auto_2136142 ?auto_2136147 ) ) ( not ( = ?auto_2136142 ?auto_2136148 ) ) ( not ( = ?auto_2136144 ?auto_2136143 ) ) ( not ( = ?auto_2136144 ?auto_2136145 ) ) ( not ( = ?auto_2136144 ?auto_2136146 ) ) ( not ( = ?auto_2136144 ?auto_2136147 ) ) ( not ( = ?auto_2136144 ?auto_2136148 ) ) ( not ( = ?auto_2136143 ?auto_2136145 ) ) ( not ( = ?auto_2136143 ?auto_2136146 ) ) ( not ( = ?auto_2136143 ?auto_2136147 ) ) ( not ( = ?auto_2136143 ?auto_2136148 ) ) ( not ( = ?auto_2136145 ?auto_2136146 ) ) ( not ( = ?auto_2136145 ?auto_2136147 ) ) ( not ( = ?auto_2136145 ?auto_2136148 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2136146 ?auto_2136147 ?auto_2136148 )
      ( MAKE-8CRATE-VERIFY ?auto_2136140 ?auto_2136141 ?auto_2136142 ?auto_2136144 ?auto_2136143 ?auto_2136145 ?auto_2136146 ?auto_2136147 ?auto_2136148 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2136232 - SURFACE
      ?auto_2136233 - SURFACE
      ?auto_2136234 - SURFACE
      ?auto_2136236 - SURFACE
      ?auto_2136235 - SURFACE
      ?auto_2136237 - SURFACE
      ?auto_2136238 - SURFACE
      ?auto_2136239 - SURFACE
      ?auto_2136240 - SURFACE
    )
    :vars
    (
      ?auto_2136241 - HOIST
      ?auto_2136243 - PLACE
      ?auto_2136246 - TRUCK
      ?auto_2136245 - PLACE
      ?auto_2136242 - HOIST
      ?auto_2136244 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2136241 ?auto_2136243 ) ( SURFACE-AT ?auto_2136239 ?auto_2136243 ) ( CLEAR ?auto_2136239 ) ( IS-CRATE ?auto_2136240 ) ( not ( = ?auto_2136239 ?auto_2136240 ) ) ( AVAILABLE ?auto_2136241 ) ( ON ?auto_2136239 ?auto_2136238 ) ( not ( = ?auto_2136238 ?auto_2136239 ) ) ( not ( = ?auto_2136238 ?auto_2136240 ) ) ( TRUCK-AT ?auto_2136246 ?auto_2136245 ) ( not ( = ?auto_2136245 ?auto_2136243 ) ) ( HOIST-AT ?auto_2136242 ?auto_2136245 ) ( not ( = ?auto_2136241 ?auto_2136242 ) ) ( AVAILABLE ?auto_2136242 ) ( SURFACE-AT ?auto_2136240 ?auto_2136245 ) ( ON ?auto_2136240 ?auto_2136244 ) ( CLEAR ?auto_2136240 ) ( not ( = ?auto_2136239 ?auto_2136244 ) ) ( not ( = ?auto_2136240 ?auto_2136244 ) ) ( not ( = ?auto_2136238 ?auto_2136244 ) ) ( ON ?auto_2136233 ?auto_2136232 ) ( ON ?auto_2136234 ?auto_2136233 ) ( ON ?auto_2136236 ?auto_2136234 ) ( ON ?auto_2136235 ?auto_2136236 ) ( ON ?auto_2136237 ?auto_2136235 ) ( ON ?auto_2136238 ?auto_2136237 ) ( not ( = ?auto_2136232 ?auto_2136233 ) ) ( not ( = ?auto_2136232 ?auto_2136234 ) ) ( not ( = ?auto_2136232 ?auto_2136236 ) ) ( not ( = ?auto_2136232 ?auto_2136235 ) ) ( not ( = ?auto_2136232 ?auto_2136237 ) ) ( not ( = ?auto_2136232 ?auto_2136238 ) ) ( not ( = ?auto_2136232 ?auto_2136239 ) ) ( not ( = ?auto_2136232 ?auto_2136240 ) ) ( not ( = ?auto_2136232 ?auto_2136244 ) ) ( not ( = ?auto_2136233 ?auto_2136234 ) ) ( not ( = ?auto_2136233 ?auto_2136236 ) ) ( not ( = ?auto_2136233 ?auto_2136235 ) ) ( not ( = ?auto_2136233 ?auto_2136237 ) ) ( not ( = ?auto_2136233 ?auto_2136238 ) ) ( not ( = ?auto_2136233 ?auto_2136239 ) ) ( not ( = ?auto_2136233 ?auto_2136240 ) ) ( not ( = ?auto_2136233 ?auto_2136244 ) ) ( not ( = ?auto_2136234 ?auto_2136236 ) ) ( not ( = ?auto_2136234 ?auto_2136235 ) ) ( not ( = ?auto_2136234 ?auto_2136237 ) ) ( not ( = ?auto_2136234 ?auto_2136238 ) ) ( not ( = ?auto_2136234 ?auto_2136239 ) ) ( not ( = ?auto_2136234 ?auto_2136240 ) ) ( not ( = ?auto_2136234 ?auto_2136244 ) ) ( not ( = ?auto_2136236 ?auto_2136235 ) ) ( not ( = ?auto_2136236 ?auto_2136237 ) ) ( not ( = ?auto_2136236 ?auto_2136238 ) ) ( not ( = ?auto_2136236 ?auto_2136239 ) ) ( not ( = ?auto_2136236 ?auto_2136240 ) ) ( not ( = ?auto_2136236 ?auto_2136244 ) ) ( not ( = ?auto_2136235 ?auto_2136237 ) ) ( not ( = ?auto_2136235 ?auto_2136238 ) ) ( not ( = ?auto_2136235 ?auto_2136239 ) ) ( not ( = ?auto_2136235 ?auto_2136240 ) ) ( not ( = ?auto_2136235 ?auto_2136244 ) ) ( not ( = ?auto_2136237 ?auto_2136238 ) ) ( not ( = ?auto_2136237 ?auto_2136239 ) ) ( not ( = ?auto_2136237 ?auto_2136240 ) ) ( not ( = ?auto_2136237 ?auto_2136244 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2136238 ?auto_2136239 ?auto_2136240 )
      ( MAKE-8CRATE-VERIFY ?auto_2136232 ?auto_2136233 ?auto_2136234 ?auto_2136236 ?auto_2136235 ?auto_2136237 ?auto_2136238 ?auto_2136239 ?auto_2136240 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2136325 - SURFACE
      ?auto_2136326 - SURFACE
      ?auto_2136327 - SURFACE
      ?auto_2136329 - SURFACE
      ?auto_2136328 - SURFACE
      ?auto_2136330 - SURFACE
      ?auto_2136331 - SURFACE
      ?auto_2136332 - SURFACE
      ?auto_2136333 - SURFACE
    )
    :vars
    (
      ?auto_2136334 - HOIST
      ?auto_2136337 - PLACE
      ?auto_2136338 - PLACE
      ?auto_2136335 - HOIST
      ?auto_2136339 - SURFACE
      ?auto_2136336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2136334 ?auto_2136337 ) ( SURFACE-AT ?auto_2136332 ?auto_2136337 ) ( CLEAR ?auto_2136332 ) ( IS-CRATE ?auto_2136333 ) ( not ( = ?auto_2136332 ?auto_2136333 ) ) ( AVAILABLE ?auto_2136334 ) ( ON ?auto_2136332 ?auto_2136331 ) ( not ( = ?auto_2136331 ?auto_2136332 ) ) ( not ( = ?auto_2136331 ?auto_2136333 ) ) ( not ( = ?auto_2136338 ?auto_2136337 ) ) ( HOIST-AT ?auto_2136335 ?auto_2136338 ) ( not ( = ?auto_2136334 ?auto_2136335 ) ) ( AVAILABLE ?auto_2136335 ) ( SURFACE-AT ?auto_2136333 ?auto_2136338 ) ( ON ?auto_2136333 ?auto_2136339 ) ( CLEAR ?auto_2136333 ) ( not ( = ?auto_2136332 ?auto_2136339 ) ) ( not ( = ?auto_2136333 ?auto_2136339 ) ) ( not ( = ?auto_2136331 ?auto_2136339 ) ) ( TRUCK-AT ?auto_2136336 ?auto_2136337 ) ( ON ?auto_2136326 ?auto_2136325 ) ( ON ?auto_2136327 ?auto_2136326 ) ( ON ?auto_2136329 ?auto_2136327 ) ( ON ?auto_2136328 ?auto_2136329 ) ( ON ?auto_2136330 ?auto_2136328 ) ( ON ?auto_2136331 ?auto_2136330 ) ( not ( = ?auto_2136325 ?auto_2136326 ) ) ( not ( = ?auto_2136325 ?auto_2136327 ) ) ( not ( = ?auto_2136325 ?auto_2136329 ) ) ( not ( = ?auto_2136325 ?auto_2136328 ) ) ( not ( = ?auto_2136325 ?auto_2136330 ) ) ( not ( = ?auto_2136325 ?auto_2136331 ) ) ( not ( = ?auto_2136325 ?auto_2136332 ) ) ( not ( = ?auto_2136325 ?auto_2136333 ) ) ( not ( = ?auto_2136325 ?auto_2136339 ) ) ( not ( = ?auto_2136326 ?auto_2136327 ) ) ( not ( = ?auto_2136326 ?auto_2136329 ) ) ( not ( = ?auto_2136326 ?auto_2136328 ) ) ( not ( = ?auto_2136326 ?auto_2136330 ) ) ( not ( = ?auto_2136326 ?auto_2136331 ) ) ( not ( = ?auto_2136326 ?auto_2136332 ) ) ( not ( = ?auto_2136326 ?auto_2136333 ) ) ( not ( = ?auto_2136326 ?auto_2136339 ) ) ( not ( = ?auto_2136327 ?auto_2136329 ) ) ( not ( = ?auto_2136327 ?auto_2136328 ) ) ( not ( = ?auto_2136327 ?auto_2136330 ) ) ( not ( = ?auto_2136327 ?auto_2136331 ) ) ( not ( = ?auto_2136327 ?auto_2136332 ) ) ( not ( = ?auto_2136327 ?auto_2136333 ) ) ( not ( = ?auto_2136327 ?auto_2136339 ) ) ( not ( = ?auto_2136329 ?auto_2136328 ) ) ( not ( = ?auto_2136329 ?auto_2136330 ) ) ( not ( = ?auto_2136329 ?auto_2136331 ) ) ( not ( = ?auto_2136329 ?auto_2136332 ) ) ( not ( = ?auto_2136329 ?auto_2136333 ) ) ( not ( = ?auto_2136329 ?auto_2136339 ) ) ( not ( = ?auto_2136328 ?auto_2136330 ) ) ( not ( = ?auto_2136328 ?auto_2136331 ) ) ( not ( = ?auto_2136328 ?auto_2136332 ) ) ( not ( = ?auto_2136328 ?auto_2136333 ) ) ( not ( = ?auto_2136328 ?auto_2136339 ) ) ( not ( = ?auto_2136330 ?auto_2136331 ) ) ( not ( = ?auto_2136330 ?auto_2136332 ) ) ( not ( = ?auto_2136330 ?auto_2136333 ) ) ( not ( = ?auto_2136330 ?auto_2136339 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2136331 ?auto_2136332 ?auto_2136333 )
      ( MAKE-8CRATE-VERIFY ?auto_2136325 ?auto_2136326 ?auto_2136327 ?auto_2136329 ?auto_2136328 ?auto_2136330 ?auto_2136331 ?auto_2136332 ?auto_2136333 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2136418 - SURFACE
      ?auto_2136419 - SURFACE
      ?auto_2136420 - SURFACE
      ?auto_2136422 - SURFACE
      ?auto_2136421 - SURFACE
      ?auto_2136423 - SURFACE
      ?auto_2136424 - SURFACE
      ?auto_2136425 - SURFACE
      ?auto_2136426 - SURFACE
    )
    :vars
    (
      ?auto_2136431 - HOIST
      ?auto_2136427 - PLACE
      ?auto_2136428 - PLACE
      ?auto_2136429 - HOIST
      ?auto_2136430 - SURFACE
      ?auto_2136432 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2136431 ?auto_2136427 ) ( IS-CRATE ?auto_2136426 ) ( not ( = ?auto_2136425 ?auto_2136426 ) ) ( not ( = ?auto_2136424 ?auto_2136425 ) ) ( not ( = ?auto_2136424 ?auto_2136426 ) ) ( not ( = ?auto_2136428 ?auto_2136427 ) ) ( HOIST-AT ?auto_2136429 ?auto_2136428 ) ( not ( = ?auto_2136431 ?auto_2136429 ) ) ( AVAILABLE ?auto_2136429 ) ( SURFACE-AT ?auto_2136426 ?auto_2136428 ) ( ON ?auto_2136426 ?auto_2136430 ) ( CLEAR ?auto_2136426 ) ( not ( = ?auto_2136425 ?auto_2136430 ) ) ( not ( = ?auto_2136426 ?auto_2136430 ) ) ( not ( = ?auto_2136424 ?auto_2136430 ) ) ( TRUCK-AT ?auto_2136432 ?auto_2136427 ) ( SURFACE-AT ?auto_2136424 ?auto_2136427 ) ( CLEAR ?auto_2136424 ) ( LIFTING ?auto_2136431 ?auto_2136425 ) ( IS-CRATE ?auto_2136425 ) ( ON ?auto_2136419 ?auto_2136418 ) ( ON ?auto_2136420 ?auto_2136419 ) ( ON ?auto_2136422 ?auto_2136420 ) ( ON ?auto_2136421 ?auto_2136422 ) ( ON ?auto_2136423 ?auto_2136421 ) ( ON ?auto_2136424 ?auto_2136423 ) ( not ( = ?auto_2136418 ?auto_2136419 ) ) ( not ( = ?auto_2136418 ?auto_2136420 ) ) ( not ( = ?auto_2136418 ?auto_2136422 ) ) ( not ( = ?auto_2136418 ?auto_2136421 ) ) ( not ( = ?auto_2136418 ?auto_2136423 ) ) ( not ( = ?auto_2136418 ?auto_2136424 ) ) ( not ( = ?auto_2136418 ?auto_2136425 ) ) ( not ( = ?auto_2136418 ?auto_2136426 ) ) ( not ( = ?auto_2136418 ?auto_2136430 ) ) ( not ( = ?auto_2136419 ?auto_2136420 ) ) ( not ( = ?auto_2136419 ?auto_2136422 ) ) ( not ( = ?auto_2136419 ?auto_2136421 ) ) ( not ( = ?auto_2136419 ?auto_2136423 ) ) ( not ( = ?auto_2136419 ?auto_2136424 ) ) ( not ( = ?auto_2136419 ?auto_2136425 ) ) ( not ( = ?auto_2136419 ?auto_2136426 ) ) ( not ( = ?auto_2136419 ?auto_2136430 ) ) ( not ( = ?auto_2136420 ?auto_2136422 ) ) ( not ( = ?auto_2136420 ?auto_2136421 ) ) ( not ( = ?auto_2136420 ?auto_2136423 ) ) ( not ( = ?auto_2136420 ?auto_2136424 ) ) ( not ( = ?auto_2136420 ?auto_2136425 ) ) ( not ( = ?auto_2136420 ?auto_2136426 ) ) ( not ( = ?auto_2136420 ?auto_2136430 ) ) ( not ( = ?auto_2136422 ?auto_2136421 ) ) ( not ( = ?auto_2136422 ?auto_2136423 ) ) ( not ( = ?auto_2136422 ?auto_2136424 ) ) ( not ( = ?auto_2136422 ?auto_2136425 ) ) ( not ( = ?auto_2136422 ?auto_2136426 ) ) ( not ( = ?auto_2136422 ?auto_2136430 ) ) ( not ( = ?auto_2136421 ?auto_2136423 ) ) ( not ( = ?auto_2136421 ?auto_2136424 ) ) ( not ( = ?auto_2136421 ?auto_2136425 ) ) ( not ( = ?auto_2136421 ?auto_2136426 ) ) ( not ( = ?auto_2136421 ?auto_2136430 ) ) ( not ( = ?auto_2136423 ?auto_2136424 ) ) ( not ( = ?auto_2136423 ?auto_2136425 ) ) ( not ( = ?auto_2136423 ?auto_2136426 ) ) ( not ( = ?auto_2136423 ?auto_2136430 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2136424 ?auto_2136425 ?auto_2136426 )
      ( MAKE-8CRATE-VERIFY ?auto_2136418 ?auto_2136419 ?auto_2136420 ?auto_2136422 ?auto_2136421 ?auto_2136423 ?auto_2136424 ?auto_2136425 ?auto_2136426 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2136511 - SURFACE
      ?auto_2136512 - SURFACE
      ?auto_2136513 - SURFACE
      ?auto_2136515 - SURFACE
      ?auto_2136514 - SURFACE
      ?auto_2136516 - SURFACE
      ?auto_2136517 - SURFACE
      ?auto_2136518 - SURFACE
      ?auto_2136519 - SURFACE
    )
    :vars
    (
      ?auto_2136521 - HOIST
      ?auto_2136524 - PLACE
      ?auto_2136520 - PLACE
      ?auto_2136522 - HOIST
      ?auto_2136525 - SURFACE
      ?auto_2136523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2136521 ?auto_2136524 ) ( IS-CRATE ?auto_2136519 ) ( not ( = ?auto_2136518 ?auto_2136519 ) ) ( not ( = ?auto_2136517 ?auto_2136518 ) ) ( not ( = ?auto_2136517 ?auto_2136519 ) ) ( not ( = ?auto_2136520 ?auto_2136524 ) ) ( HOIST-AT ?auto_2136522 ?auto_2136520 ) ( not ( = ?auto_2136521 ?auto_2136522 ) ) ( AVAILABLE ?auto_2136522 ) ( SURFACE-AT ?auto_2136519 ?auto_2136520 ) ( ON ?auto_2136519 ?auto_2136525 ) ( CLEAR ?auto_2136519 ) ( not ( = ?auto_2136518 ?auto_2136525 ) ) ( not ( = ?auto_2136519 ?auto_2136525 ) ) ( not ( = ?auto_2136517 ?auto_2136525 ) ) ( TRUCK-AT ?auto_2136523 ?auto_2136524 ) ( SURFACE-AT ?auto_2136517 ?auto_2136524 ) ( CLEAR ?auto_2136517 ) ( IS-CRATE ?auto_2136518 ) ( AVAILABLE ?auto_2136521 ) ( IN ?auto_2136518 ?auto_2136523 ) ( ON ?auto_2136512 ?auto_2136511 ) ( ON ?auto_2136513 ?auto_2136512 ) ( ON ?auto_2136515 ?auto_2136513 ) ( ON ?auto_2136514 ?auto_2136515 ) ( ON ?auto_2136516 ?auto_2136514 ) ( ON ?auto_2136517 ?auto_2136516 ) ( not ( = ?auto_2136511 ?auto_2136512 ) ) ( not ( = ?auto_2136511 ?auto_2136513 ) ) ( not ( = ?auto_2136511 ?auto_2136515 ) ) ( not ( = ?auto_2136511 ?auto_2136514 ) ) ( not ( = ?auto_2136511 ?auto_2136516 ) ) ( not ( = ?auto_2136511 ?auto_2136517 ) ) ( not ( = ?auto_2136511 ?auto_2136518 ) ) ( not ( = ?auto_2136511 ?auto_2136519 ) ) ( not ( = ?auto_2136511 ?auto_2136525 ) ) ( not ( = ?auto_2136512 ?auto_2136513 ) ) ( not ( = ?auto_2136512 ?auto_2136515 ) ) ( not ( = ?auto_2136512 ?auto_2136514 ) ) ( not ( = ?auto_2136512 ?auto_2136516 ) ) ( not ( = ?auto_2136512 ?auto_2136517 ) ) ( not ( = ?auto_2136512 ?auto_2136518 ) ) ( not ( = ?auto_2136512 ?auto_2136519 ) ) ( not ( = ?auto_2136512 ?auto_2136525 ) ) ( not ( = ?auto_2136513 ?auto_2136515 ) ) ( not ( = ?auto_2136513 ?auto_2136514 ) ) ( not ( = ?auto_2136513 ?auto_2136516 ) ) ( not ( = ?auto_2136513 ?auto_2136517 ) ) ( not ( = ?auto_2136513 ?auto_2136518 ) ) ( not ( = ?auto_2136513 ?auto_2136519 ) ) ( not ( = ?auto_2136513 ?auto_2136525 ) ) ( not ( = ?auto_2136515 ?auto_2136514 ) ) ( not ( = ?auto_2136515 ?auto_2136516 ) ) ( not ( = ?auto_2136515 ?auto_2136517 ) ) ( not ( = ?auto_2136515 ?auto_2136518 ) ) ( not ( = ?auto_2136515 ?auto_2136519 ) ) ( not ( = ?auto_2136515 ?auto_2136525 ) ) ( not ( = ?auto_2136514 ?auto_2136516 ) ) ( not ( = ?auto_2136514 ?auto_2136517 ) ) ( not ( = ?auto_2136514 ?auto_2136518 ) ) ( not ( = ?auto_2136514 ?auto_2136519 ) ) ( not ( = ?auto_2136514 ?auto_2136525 ) ) ( not ( = ?auto_2136516 ?auto_2136517 ) ) ( not ( = ?auto_2136516 ?auto_2136518 ) ) ( not ( = ?auto_2136516 ?auto_2136519 ) ) ( not ( = ?auto_2136516 ?auto_2136525 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2136517 ?auto_2136518 ?auto_2136519 )
      ( MAKE-8CRATE-VERIFY ?auto_2136511 ?auto_2136512 ?auto_2136513 ?auto_2136515 ?auto_2136514 ?auto_2136516 ?auto_2136517 ?auto_2136518 ?auto_2136519 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2140597 - SURFACE
      ?auto_2140598 - SURFACE
      ?auto_2140599 - SURFACE
      ?auto_2140601 - SURFACE
      ?auto_2140600 - SURFACE
      ?auto_2140602 - SURFACE
      ?auto_2140603 - SURFACE
      ?auto_2140604 - SURFACE
      ?auto_2140605 - SURFACE
      ?auto_2140606 - SURFACE
    )
    :vars
    (
      ?auto_2140608 - HOIST
      ?auto_2140607 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2140608 ?auto_2140607 ) ( SURFACE-AT ?auto_2140605 ?auto_2140607 ) ( CLEAR ?auto_2140605 ) ( LIFTING ?auto_2140608 ?auto_2140606 ) ( IS-CRATE ?auto_2140606 ) ( not ( = ?auto_2140605 ?auto_2140606 ) ) ( ON ?auto_2140598 ?auto_2140597 ) ( ON ?auto_2140599 ?auto_2140598 ) ( ON ?auto_2140601 ?auto_2140599 ) ( ON ?auto_2140600 ?auto_2140601 ) ( ON ?auto_2140602 ?auto_2140600 ) ( ON ?auto_2140603 ?auto_2140602 ) ( ON ?auto_2140604 ?auto_2140603 ) ( ON ?auto_2140605 ?auto_2140604 ) ( not ( = ?auto_2140597 ?auto_2140598 ) ) ( not ( = ?auto_2140597 ?auto_2140599 ) ) ( not ( = ?auto_2140597 ?auto_2140601 ) ) ( not ( = ?auto_2140597 ?auto_2140600 ) ) ( not ( = ?auto_2140597 ?auto_2140602 ) ) ( not ( = ?auto_2140597 ?auto_2140603 ) ) ( not ( = ?auto_2140597 ?auto_2140604 ) ) ( not ( = ?auto_2140597 ?auto_2140605 ) ) ( not ( = ?auto_2140597 ?auto_2140606 ) ) ( not ( = ?auto_2140598 ?auto_2140599 ) ) ( not ( = ?auto_2140598 ?auto_2140601 ) ) ( not ( = ?auto_2140598 ?auto_2140600 ) ) ( not ( = ?auto_2140598 ?auto_2140602 ) ) ( not ( = ?auto_2140598 ?auto_2140603 ) ) ( not ( = ?auto_2140598 ?auto_2140604 ) ) ( not ( = ?auto_2140598 ?auto_2140605 ) ) ( not ( = ?auto_2140598 ?auto_2140606 ) ) ( not ( = ?auto_2140599 ?auto_2140601 ) ) ( not ( = ?auto_2140599 ?auto_2140600 ) ) ( not ( = ?auto_2140599 ?auto_2140602 ) ) ( not ( = ?auto_2140599 ?auto_2140603 ) ) ( not ( = ?auto_2140599 ?auto_2140604 ) ) ( not ( = ?auto_2140599 ?auto_2140605 ) ) ( not ( = ?auto_2140599 ?auto_2140606 ) ) ( not ( = ?auto_2140601 ?auto_2140600 ) ) ( not ( = ?auto_2140601 ?auto_2140602 ) ) ( not ( = ?auto_2140601 ?auto_2140603 ) ) ( not ( = ?auto_2140601 ?auto_2140604 ) ) ( not ( = ?auto_2140601 ?auto_2140605 ) ) ( not ( = ?auto_2140601 ?auto_2140606 ) ) ( not ( = ?auto_2140600 ?auto_2140602 ) ) ( not ( = ?auto_2140600 ?auto_2140603 ) ) ( not ( = ?auto_2140600 ?auto_2140604 ) ) ( not ( = ?auto_2140600 ?auto_2140605 ) ) ( not ( = ?auto_2140600 ?auto_2140606 ) ) ( not ( = ?auto_2140602 ?auto_2140603 ) ) ( not ( = ?auto_2140602 ?auto_2140604 ) ) ( not ( = ?auto_2140602 ?auto_2140605 ) ) ( not ( = ?auto_2140602 ?auto_2140606 ) ) ( not ( = ?auto_2140603 ?auto_2140604 ) ) ( not ( = ?auto_2140603 ?auto_2140605 ) ) ( not ( = ?auto_2140603 ?auto_2140606 ) ) ( not ( = ?auto_2140604 ?auto_2140605 ) ) ( not ( = ?auto_2140604 ?auto_2140606 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2140605 ?auto_2140606 )
      ( MAKE-9CRATE-VERIFY ?auto_2140597 ?auto_2140598 ?auto_2140599 ?auto_2140601 ?auto_2140600 ?auto_2140602 ?auto_2140603 ?auto_2140604 ?auto_2140605 ?auto_2140606 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2140677 - SURFACE
      ?auto_2140678 - SURFACE
      ?auto_2140679 - SURFACE
      ?auto_2140681 - SURFACE
      ?auto_2140680 - SURFACE
      ?auto_2140682 - SURFACE
      ?auto_2140683 - SURFACE
      ?auto_2140684 - SURFACE
      ?auto_2140685 - SURFACE
      ?auto_2140686 - SURFACE
    )
    :vars
    (
      ?auto_2140687 - HOIST
      ?auto_2140689 - PLACE
      ?auto_2140688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2140687 ?auto_2140689 ) ( SURFACE-AT ?auto_2140685 ?auto_2140689 ) ( CLEAR ?auto_2140685 ) ( IS-CRATE ?auto_2140686 ) ( not ( = ?auto_2140685 ?auto_2140686 ) ) ( TRUCK-AT ?auto_2140688 ?auto_2140689 ) ( AVAILABLE ?auto_2140687 ) ( IN ?auto_2140686 ?auto_2140688 ) ( ON ?auto_2140685 ?auto_2140684 ) ( not ( = ?auto_2140684 ?auto_2140685 ) ) ( not ( = ?auto_2140684 ?auto_2140686 ) ) ( ON ?auto_2140678 ?auto_2140677 ) ( ON ?auto_2140679 ?auto_2140678 ) ( ON ?auto_2140681 ?auto_2140679 ) ( ON ?auto_2140680 ?auto_2140681 ) ( ON ?auto_2140682 ?auto_2140680 ) ( ON ?auto_2140683 ?auto_2140682 ) ( ON ?auto_2140684 ?auto_2140683 ) ( not ( = ?auto_2140677 ?auto_2140678 ) ) ( not ( = ?auto_2140677 ?auto_2140679 ) ) ( not ( = ?auto_2140677 ?auto_2140681 ) ) ( not ( = ?auto_2140677 ?auto_2140680 ) ) ( not ( = ?auto_2140677 ?auto_2140682 ) ) ( not ( = ?auto_2140677 ?auto_2140683 ) ) ( not ( = ?auto_2140677 ?auto_2140684 ) ) ( not ( = ?auto_2140677 ?auto_2140685 ) ) ( not ( = ?auto_2140677 ?auto_2140686 ) ) ( not ( = ?auto_2140678 ?auto_2140679 ) ) ( not ( = ?auto_2140678 ?auto_2140681 ) ) ( not ( = ?auto_2140678 ?auto_2140680 ) ) ( not ( = ?auto_2140678 ?auto_2140682 ) ) ( not ( = ?auto_2140678 ?auto_2140683 ) ) ( not ( = ?auto_2140678 ?auto_2140684 ) ) ( not ( = ?auto_2140678 ?auto_2140685 ) ) ( not ( = ?auto_2140678 ?auto_2140686 ) ) ( not ( = ?auto_2140679 ?auto_2140681 ) ) ( not ( = ?auto_2140679 ?auto_2140680 ) ) ( not ( = ?auto_2140679 ?auto_2140682 ) ) ( not ( = ?auto_2140679 ?auto_2140683 ) ) ( not ( = ?auto_2140679 ?auto_2140684 ) ) ( not ( = ?auto_2140679 ?auto_2140685 ) ) ( not ( = ?auto_2140679 ?auto_2140686 ) ) ( not ( = ?auto_2140681 ?auto_2140680 ) ) ( not ( = ?auto_2140681 ?auto_2140682 ) ) ( not ( = ?auto_2140681 ?auto_2140683 ) ) ( not ( = ?auto_2140681 ?auto_2140684 ) ) ( not ( = ?auto_2140681 ?auto_2140685 ) ) ( not ( = ?auto_2140681 ?auto_2140686 ) ) ( not ( = ?auto_2140680 ?auto_2140682 ) ) ( not ( = ?auto_2140680 ?auto_2140683 ) ) ( not ( = ?auto_2140680 ?auto_2140684 ) ) ( not ( = ?auto_2140680 ?auto_2140685 ) ) ( not ( = ?auto_2140680 ?auto_2140686 ) ) ( not ( = ?auto_2140682 ?auto_2140683 ) ) ( not ( = ?auto_2140682 ?auto_2140684 ) ) ( not ( = ?auto_2140682 ?auto_2140685 ) ) ( not ( = ?auto_2140682 ?auto_2140686 ) ) ( not ( = ?auto_2140683 ?auto_2140684 ) ) ( not ( = ?auto_2140683 ?auto_2140685 ) ) ( not ( = ?auto_2140683 ?auto_2140686 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2140684 ?auto_2140685 ?auto_2140686 )
      ( MAKE-9CRATE-VERIFY ?auto_2140677 ?auto_2140678 ?auto_2140679 ?auto_2140681 ?auto_2140680 ?auto_2140682 ?auto_2140683 ?auto_2140684 ?auto_2140685 ?auto_2140686 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2140767 - SURFACE
      ?auto_2140768 - SURFACE
      ?auto_2140769 - SURFACE
      ?auto_2140771 - SURFACE
      ?auto_2140770 - SURFACE
      ?auto_2140772 - SURFACE
      ?auto_2140773 - SURFACE
      ?auto_2140774 - SURFACE
      ?auto_2140775 - SURFACE
      ?auto_2140776 - SURFACE
    )
    :vars
    (
      ?auto_2140780 - HOIST
      ?auto_2140779 - PLACE
      ?auto_2140778 - TRUCK
      ?auto_2140777 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2140780 ?auto_2140779 ) ( SURFACE-AT ?auto_2140775 ?auto_2140779 ) ( CLEAR ?auto_2140775 ) ( IS-CRATE ?auto_2140776 ) ( not ( = ?auto_2140775 ?auto_2140776 ) ) ( AVAILABLE ?auto_2140780 ) ( IN ?auto_2140776 ?auto_2140778 ) ( ON ?auto_2140775 ?auto_2140774 ) ( not ( = ?auto_2140774 ?auto_2140775 ) ) ( not ( = ?auto_2140774 ?auto_2140776 ) ) ( TRUCK-AT ?auto_2140778 ?auto_2140777 ) ( not ( = ?auto_2140777 ?auto_2140779 ) ) ( ON ?auto_2140768 ?auto_2140767 ) ( ON ?auto_2140769 ?auto_2140768 ) ( ON ?auto_2140771 ?auto_2140769 ) ( ON ?auto_2140770 ?auto_2140771 ) ( ON ?auto_2140772 ?auto_2140770 ) ( ON ?auto_2140773 ?auto_2140772 ) ( ON ?auto_2140774 ?auto_2140773 ) ( not ( = ?auto_2140767 ?auto_2140768 ) ) ( not ( = ?auto_2140767 ?auto_2140769 ) ) ( not ( = ?auto_2140767 ?auto_2140771 ) ) ( not ( = ?auto_2140767 ?auto_2140770 ) ) ( not ( = ?auto_2140767 ?auto_2140772 ) ) ( not ( = ?auto_2140767 ?auto_2140773 ) ) ( not ( = ?auto_2140767 ?auto_2140774 ) ) ( not ( = ?auto_2140767 ?auto_2140775 ) ) ( not ( = ?auto_2140767 ?auto_2140776 ) ) ( not ( = ?auto_2140768 ?auto_2140769 ) ) ( not ( = ?auto_2140768 ?auto_2140771 ) ) ( not ( = ?auto_2140768 ?auto_2140770 ) ) ( not ( = ?auto_2140768 ?auto_2140772 ) ) ( not ( = ?auto_2140768 ?auto_2140773 ) ) ( not ( = ?auto_2140768 ?auto_2140774 ) ) ( not ( = ?auto_2140768 ?auto_2140775 ) ) ( not ( = ?auto_2140768 ?auto_2140776 ) ) ( not ( = ?auto_2140769 ?auto_2140771 ) ) ( not ( = ?auto_2140769 ?auto_2140770 ) ) ( not ( = ?auto_2140769 ?auto_2140772 ) ) ( not ( = ?auto_2140769 ?auto_2140773 ) ) ( not ( = ?auto_2140769 ?auto_2140774 ) ) ( not ( = ?auto_2140769 ?auto_2140775 ) ) ( not ( = ?auto_2140769 ?auto_2140776 ) ) ( not ( = ?auto_2140771 ?auto_2140770 ) ) ( not ( = ?auto_2140771 ?auto_2140772 ) ) ( not ( = ?auto_2140771 ?auto_2140773 ) ) ( not ( = ?auto_2140771 ?auto_2140774 ) ) ( not ( = ?auto_2140771 ?auto_2140775 ) ) ( not ( = ?auto_2140771 ?auto_2140776 ) ) ( not ( = ?auto_2140770 ?auto_2140772 ) ) ( not ( = ?auto_2140770 ?auto_2140773 ) ) ( not ( = ?auto_2140770 ?auto_2140774 ) ) ( not ( = ?auto_2140770 ?auto_2140775 ) ) ( not ( = ?auto_2140770 ?auto_2140776 ) ) ( not ( = ?auto_2140772 ?auto_2140773 ) ) ( not ( = ?auto_2140772 ?auto_2140774 ) ) ( not ( = ?auto_2140772 ?auto_2140775 ) ) ( not ( = ?auto_2140772 ?auto_2140776 ) ) ( not ( = ?auto_2140773 ?auto_2140774 ) ) ( not ( = ?auto_2140773 ?auto_2140775 ) ) ( not ( = ?auto_2140773 ?auto_2140776 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2140774 ?auto_2140775 ?auto_2140776 )
      ( MAKE-9CRATE-VERIFY ?auto_2140767 ?auto_2140768 ?auto_2140769 ?auto_2140771 ?auto_2140770 ?auto_2140772 ?auto_2140773 ?auto_2140774 ?auto_2140775 ?auto_2140776 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2140866 - SURFACE
      ?auto_2140867 - SURFACE
      ?auto_2140868 - SURFACE
      ?auto_2140870 - SURFACE
      ?auto_2140869 - SURFACE
      ?auto_2140871 - SURFACE
      ?auto_2140872 - SURFACE
      ?auto_2140873 - SURFACE
      ?auto_2140874 - SURFACE
      ?auto_2140875 - SURFACE
    )
    :vars
    (
      ?auto_2140879 - HOIST
      ?auto_2140877 - PLACE
      ?auto_2140878 - TRUCK
      ?auto_2140876 - PLACE
      ?auto_2140880 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2140879 ?auto_2140877 ) ( SURFACE-AT ?auto_2140874 ?auto_2140877 ) ( CLEAR ?auto_2140874 ) ( IS-CRATE ?auto_2140875 ) ( not ( = ?auto_2140874 ?auto_2140875 ) ) ( AVAILABLE ?auto_2140879 ) ( ON ?auto_2140874 ?auto_2140873 ) ( not ( = ?auto_2140873 ?auto_2140874 ) ) ( not ( = ?auto_2140873 ?auto_2140875 ) ) ( TRUCK-AT ?auto_2140878 ?auto_2140876 ) ( not ( = ?auto_2140876 ?auto_2140877 ) ) ( HOIST-AT ?auto_2140880 ?auto_2140876 ) ( LIFTING ?auto_2140880 ?auto_2140875 ) ( not ( = ?auto_2140879 ?auto_2140880 ) ) ( ON ?auto_2140867 ?auto_2140866 ) ( ON ?auto_2140868 ?auto_2140867 ) ( ON ?auto_2140870 ?auto_2140868 ) ( ON ?auto_2140869 ?auto_2140870 ) ( ON ?auto_2140871 ?auto_2140869 ) ( ON ?auto_2140872 ?auto_2140871 ) ( ON ?auto_2140873 ?auto_2140872 ) ( not ( = ?auto_2140866 ?auto_2140867 ) ) ( not ( = ?auto_2140866 ?auto_2140868 ) ) ( not ( = ?auto_2140866 ?auto_2140870 ) ) ( not ( = ?auto_2140866 ?auto_2140869 ) ) ( not ( = ?auto_2140866 ?auto_2140871 ) ) ( not ( = ?auto_2140866 ?auto_2140872 ) ) ( not ( = ?auto_2140866 ?auto_2140873 ) ) ( not ( = ?auto_2140866 ?auto_2140874 ) ) ( not ( = ?auto_2140866 ?auto_2140875 ) ) ( not ( = ?auto_2140867 ?auto_2140868 ) ) ( not ( = ?auto_2140867 ?auto_2140870 ) ) ( not ( = ?auto_2140867 ?auto_2140869 ) ) ( not ( = ?auto_2140867 ?auto_2140871 ) ) ( not ( = ?auto_2140867 ?auto_2140872 ) ) ( not ( = ?auto_2140867 ?auto_2140873 ) ) ( not ( = ?auto_2140867 ?auto_2140874 ) ) ( not ( = ?auto_2140867 ?auto_2140875 ) ) ( not ( = ?auto_2140868 ?auto_2140870 ) ) ( not ( = ?auto_2140868 ?auto_2140869 ) ) ( not ( = ?auto_2140868 ?auto_2140871 ) ) ( not ( = ?auto_2140868 ?auto_2140872 ) ) ( not ( = ?auto_2140868 ?auto_2140873 ) ) ( not ( = ?auto_2140868 ?auto_2140874 ) ) ( not ( = ?auto_2140868 ?auto_2140875 ) ) ( not ( = ?auto_2140870 ?auto_2140869 ) ) ( not ( = ?auto_2140870 ?auto_2140871 ) ) ( not ( = ?auto_2140870 ?auto_2140872 ) ) ( not ( = ?auto_2140870 ?auto_2140873 ) ) ( not ( = ?auto_2140870 ?auto_2140874 ) ) ( not ( = ?auto_2140870 ?auto_2140875 ) ) ( not ( = ?auto_2140869 ?auto_2140871 ) ) ( not ( = ?auto_2140869 ?auto_2140872 ) ) ( not ( = ?auto_2140869 ?auto_2140873 ) ) ( not ( = ?auto_2140869 ?auto_2140874 ) ) ( not ( = ?auto_2140869 ?auto_2140875 ) ) ( not ( = ?auto_2140871 ?auto_2140872 ) ) ( not ( = ?auto_2140871 ?auto_2140873 ) ) ( not ( = ?auto_2140871 ?auto_2140874 ) ) ( not ( = ?auto_2140871 ?auto_2140875 ) ) ( not ( = ?auto_2140872 ?auto_2140873 ) ) ( not ( = ?auto_2140872 ?auto_2140874 ) ) ( not ( = ?auto_2140872 ?auto_2140875 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2140873 ?auto_2140874 ?auto_2140875 )
      ( MAKE-9CRATE-VERIFY ?auto_2140866 ?auto_2140867 ?auto_2140868 ?auto_2140870 ?auto_2140869 ?auto_2140871 ?auto_2140872 ?auto_2140873 ?auto_2140874 ?auto_2140875 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2140974 - SURFACE
      ?auto_2140975 - SURFACE
      ?auto_2140976 - SURFACE
      ?auto_2140978 - SURFACE
      ?auto_2140977 - SURFACE
      ?auto_2140979 - SURFACE
      ?auto_2140980 - SURFACE
      ?auto_2140981 - SURFACE
      ?auto_2140982 - SURFACE
      ?auto_2140983 - SURFACE
    )
    :vars
    (
      ?auto_2140987 - HOIST
      ?auto_2140984 - PLACE
      ?auto_2140985 - TRUCK
      ?auto_2140988 - PLACE
      ?auto_2140989 - HOIST
      ?auto_2140986 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2140987 ?auto_2140984 ) ( SURFACE-AT ?auto_2140982 ?auto_2140984 ) ( CLEAR ?auto_2140982 ) ( IS-CRATE ?auto_2140983 ) ( not ( = ?auto_2140982 ?auto_2140983 ) ) ( AVAILABLE ?auto_2140987 ) ( ON ?auto_2140982 ?auto_2140981 ) ( not ( = ?auto_2140981 ?auto_2140982 ) ) ( not ( = ?auto_2140981 ?auto_2140983 ) ) ( TRUCK-AT ?auto_2140985 ?auto_2140988 ) ( not ( = ?auto_2140988 ?auto_2140984 ) ) ( HOIST-AT ?auto_2140989 ?auto_2140988 ) ( not ( = ?auto_2140987 ?auto_2140989 ) ) ( AVAILABLE ?auto_2140989 ) ( SURFACE-AT ?auto_2140983 ?auto_2140988 ) ( ON ?auto_2140983 ?auto_2140986 ) ( CLEAR ?auto_2140983 ) ( not ( = ?auto_2140982 ?auto_2140986 ) ) ( not ( = ?auto_2140983 ?auto_2140986 ) ) ( not ( = ?auto_2140981 ?auto_2140986 ) ) ( ON ?auto_2140975 ?auto_2140974 ) ( ON ?auto_2140976 ?auto_2140975 ) ( ON ?auto_2140978 ?auto_2140976 ) ( ON ?auto_2140977 ?auto_2140978 ) ( ON ?auto_2140979 ?auto_2140977 ) ( ON ?auto_2140980 ?auto_2140979 ) ( ON ?auto_2140981 ?auto_2140980 ) ( not ( = ?auto_2140974 ?auto_2140975 ) ) ( not ( = ?auto_2140974 ?auto_2140976 ) ) ( not ( = ?auto_2140974 ?auto_2140978 ) ) ( not ( = ?auto_2140974 ?auto_2140977 ) ) ( not ( = ?auto_2140974 ?auto_2140979 ) ) ( not ( = ?auto_2140974 ?auto_2140980 ) ) ( not ( = ?auto_2140974 ?auto_2140981 ) ) ( not ( = ?auto_2140974 ?auto_2140982 ) ) ( not ( = ?auto_2140974 ?auto_2140983 ) ) ( not ( = ?auto_2140974 ?auto_2140986 ) ) ( not ( = ?auto_2140975 ?auto_2140976 ) ) ( not ( = ?auto_2140975 ?auto_2140978 ) ) ( not ( = ?auto_2140975 ?auto_2140977 ) ) ( not ( = ?auto_2140975 ?auto_2140979 ) ) ( not ( = ?auto_2140975 ?auto_2140980 ) ) ( not ( = ?auto_2140975 ?auto_2140981 ) ) ( not ( = ?auto_2140975 ?auto_2140982 ) ) ( not ( = ?auto_2140975 ?auto_2140983 ) ) ( not ( = ?auto_2140975 ?auto_2140986 ) ) ( not ( = ?auto_2140976 ?auto_2140978 ) ) ( not ( = ?auto_2140976 ?auto_2140977 ) ) ( not ( = ?auto_2140976 ?auto_2140979 ) ) ( not ( = ?auto_2140976 ?auto_2140980 ) ) ( not ( = ?auto_2140976 ?auto_2140981 ) ) ( not ( = ?auto_2140976 ?auto_2140982 ) ) ( not ( = ?auto_2140976 ?auto_2140983 ) ) ( not ( = ?auto_2140976 ?auto_2140986 ) ) ( not ( = ?auto_2140978 ?auto_2140977 ) ) ( not ( = ?auto_2140978 ?auto_2140979 ) ) ( not ( = ?auto_2140978 ?auto_2140980 ) ) ( not ( = ?auto_2140978 ?auto_2140981 ) ) ( not ( = ?auto_2140978 ?auto_2140982 ) ) ( not ( = ?auto_2140978 ?auto_2140983 ) ) ( not ( = ?auto_2140978 ?auto_2140986 ) ) ( not ( = ?auto_2140977 ?auto_2140979 ) ) ( not ( = ?auto_2140977 ?auto_2140980 ) ) ( not ( = ?auto_2140977 ?auto_2140981 ) ) ( not ( = ?auto_2140977 ?auto_2140982 ) ) ( not ( = ?auto_2140977 ?auto_2140983 ) ) ( not ( = ?auto_2140977 ?auto_2140986 ) ) ( not ( = ?auto_2140979 ?auto_2140980 ) ) ( not ( = ?auto_2140979 ?auto_2140981 ) ) ( not ( = ?auto_2140979 ?auto_2140982 ) ) ( not ( = ?auto_2140979 ?auto_2140983 ) ) ( not ( = ?auto_2140979 ?auto_2140986 ) ) ( not ( = ?auto_2140980 ?auto_2140981 ) ) ( not ( = ?auto_2140980 ?auto_2140982 ) ) ( not ( = ?auto_2140980 ?auto_2140983 ) ) ( not ( = ?auto_2140980 ?auto_2140986 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2140981 ?auto_2140982 ?auto_2140983 )
      ( MAKE-9CRATE-VERIFY ?auto_2140974 ?auto_2140975 ?auto_2140976 ?auto_2140978 ?auto_2140977 ?auto_2140979 ?auto_2140980 ?auto_2140981 ?auto_2140982 ?auto_2140983 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2141083 - SURFACE
      ?auto_2141084 - SURFACE
      ?auto_2141085 - SURFACE
      ?auto_2141087 - SURFACE
      ?auto_2141086 - SURFACE
      ?auto_2141088 - SURFACE
      ?auto_2141089 - SURFACE
      ?auto_2141090 - SURFACE
      ?auto_2141091 - SURFACE
      ?auto_2141092 - SURFACE
    )
    :vars
    (
      ?auto_2141095 - HOIST
      ?auto_2141098 - PLACE
      ?auto_2141097 - PLACE
      ?auto_2141093 - HOIST
      ?auto_2141096 - SURFACE
      ?auto_2141094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2141095 ?auto_2141098 ) ( SURFACE-AT ?auto_2141091 ?auto_2141098 ) ( CLEAR ?auto_2141091 ) ( IS-CRATE ?auto_2141092 ) ( not ( = ?auto_2141091 ?auto_2141092 ) ) ( AVAILABLE ?auto_2141095 ) ( ON ?auto_2141091 ?auto_2141090 ) ( not ( = ?auto_2141090 ?auto_2141091 ) ) ( not ( = ?auto_2141090 ?auto_2141092 ) ) ( not ( = ?auto_2141097 ?auto_2141098 ) ) ( HOIST-AT ?auto_2141093 ?auto_2141097 ) ( not ( = ?auto_2141095 ?auto_2141093 ) ) ( AVAILABLE ?auto_2141093 ) ( SURFACE-AT ?auto_2141092 ?auto_2141097 ) ( ON ?auto_2141092 ?auto_2141096 ) ( CLEAR ?auto_2141092 ) ( not ( = ?auto_2141091 ?auto_2141096 ) ) ( not ( = ?auto_2141092 ?auto_2141096 ) ) ( not ( = ?auto_2141090 ?auto_2141096 ) ) ( TRUCK-AT ?auto_2141094 ?auto_2141098 ) ( ON ?auto_2141084 ?auto_2141083 ) ( ON ?auto_2141085 ?auto_2141084 ) ( ON ?auto_2141087 ?auto_2141085 ) ( ON ?auto_2141086 ?auto_2141087 ) ( ON ?auto_2141088 ?auto_2141086 ) ( ON ?auto_2141089 ?auto_2141088 ) ( ON ?auto_2141090 ?auto_2141089 ) ( not ( = ?auto_2141083 ?auto_2141084 ) ) ( not ( = ?auto_2141083 ?auto_2141085 ) ) ( not ( = ?auto_2141083 ?auto_2141087 ) ) ( not ( = ?auto_2141083 ?auto_2141086 ) ) ( not ( = ?auto_2141083 ?auto_2141088 ) ) ( not ( = ?auto_2141083 ?auto_2141089 ) ) ( not ( = ?auto_2141083 ?auto_2141090 ) ) ( not ( = ?auto_2141083 ?auto_2141091 ) ) ( not ( = ?auto_2141083 ?auto_2141092 ) ) ( not ( = ?auto_2141083 ?auto_2141096 ) ) ( not ( = ?auto_2141084 ?auto_2141085 ) ) ( not ( = ?auto_2141084 ?auto_2141087 ) ) ( not ( = ?auto_2141084 ?auto_2141086 ) ) ( not ( = ?auto_2141084 ?auto_2141088 ) ) ( not ( = ?auto_2141084 ?auto_2141089 ) ) ( not ( = ?auto_2141084 ?auto_2141090 ) ) ( not ( = ?auto_2141084 ?auto_2141091 ) ) ( not ( = ?auto_2141084 ?auto_2141092 ) ) ( not ( = ?auto_2141084 ?auto_2141096 ) ) ( not ( = ?auto_2141085 ?auto_2141087 ) ) ( not ( = ?auto_2141085 ?auto_2141086 ) ) ( not ( = ?auto_2141085 ?auto_2141088 ) ) ( not ( = ?auto_2141085 ?auto_2141089 ) ) ( not ( = ?auto_2141085 ?auto_2141090 ) ) ( not ( = ?auto_2141085 ?auto_2141091 ) ) ( not ( = ?auto_2141085 ?auto_2141092 ) ) ( not ( = ?auto_2141085 ?auto_2141096 ) ) ( not ( = ?auto_2141087 ?auto_2141086 ) ) ( not ( = ?auto_2141087 ?auto_2141088 ) ) ( not ( = ?auto_2141087 ?auto_2141089 ) ) ( not ( = ?auto_2141087 ?auto_2141090 ) ) ( not ( = ?auto_2141087 ?auto_2141091 ) ) ( not ( = ?auto_2141087 ?auto_2141092 ) ) ( not ( = ?auto_2141087 ?auto_2141096 ) ) ( not ( = ?auto_2141086 ?auto_2141088 ) ) ( not ( = ?auto_2141086 ?auto_2141089 ) ) ( not ( = ?auto_2141086 ?auto_2141090 ) ) ( not ( = ?auto_2141086 ?auto_2141091 ) ) ( not ( = ?auto_2141086 ?auto_2141092 ) ) ( not ( = ?auto_2141086 ?auto_2141096 ) ) ( not ( = ?auto_2141088 ?auto_2141089 ) ) ( not ( = ?auto_2141088 ?auto_2141090 ) ) ( not ( = ?auto_2141088 ?auto_2141091 ) ) ( not ( = ?auto_2141088 ?auto_2141092 ) ) ( not ( = ?auto_2141088 ?auto_2141096 ) ) ( not ( = ?auto_2141089 ?auto_2141090 ) ) ( not ( = ?auto_2141089 ?auto_2141091 ) ) ( not ( = ?auto_2141089 ?auto_2141092 ) ) ( not ( = ?auto_2141089 ?auto_2141096 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2141090 ?auto_2141091 ?auto_2141092 )
      ( MAKE-9CRATE-VERIFY ?auto_2141083 ?auto_2141084 ?auto_2141085 ?auto_2141087 ?auto_2141086 ?auto_2141088 ?auto_2141089 ?auto_2141090 ?auto_2141091 ?auto_2141092 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2141192 - SURFACE
      ?auto_2141193 - SURFACE
      ?auto_2141194 - SURFACE
      ?auto_2141196 - SURFACE
      ?auto_2141195 - SURFACE
      ?auto_2141197 - SURFACE
      ?auto_2141198 - SURFACE
      ?auto_2141199 - SURFACE
      ?auto_2141200 - SURFACE
      ?auto_2141201 - SURFACE
    )
    :vars
    (
      ?auto_2141203 - HOIST
      ?auto_2141205 - PLACE
      ?auto_2141206 - PLACE
      ?auto_2141202 - HOIST
      ?auto_2141204 - SURFACE
      ?auto_2141207 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2141203 ?auto_2141205 ) ( IS-CRATE ?auto_2141201 ) ( not ( = ?auto_2141200 ?auto_2141201 ) ) ( not ( = ?auto_2141199 ?auto_2141200 ) ) ( not ( = ?auto_2141199 ?auto_2141201 ) ) ( not ( = ?auto_2141206 ?auto_2141205 ) ) ( HOIST-AT ?auto_2141202 ?auto_2141206 ) ( not ( = ?auto_2141203 ?auto_2141202 ) ) ( AVAILABLE ?auto_2141202 ) ( SURFACE-AT ?auto_2141201 ?auto_2141206 ) ( ON ?auto_2141201 ?auto_2141204 ) ( CLEAR ?auto_2141201 ) ( not ( = ?auto_2141200 ?auto_2141204 ) ) ( not ( = ?auto_2141201 ?auto_2141204 ) ) ( not ( = ?auto_2141199 ?auto_2141204 ) ) ( TRUCK-AT ?auto_2141207 ?auto_2141205 ) ( SURFACE-AT ?auto_2141199 ?auto_2141205 ) ( CLEAR ?auto_2141199 ) ( LIFTING ?auto_2141203 ?auto_2141200 ) ( IS-CRATE ?auto_2141200 ) ( ON ?auto_2141193 ?auto_2141192 ) ( ON ?auto_2141194 ?auto_2141193 ) ( ON ?auto_2141196 ?auto_2141194 ) ( ON ?auto_2141195 ?auto_2141196 ) ( ON ?auto_2141197 ?auto_2141195 ) ( ON ?auto_2141198 ?auto_2141197 ) ( ON ?auto_2141199 ?auto_2141198 ) ( not ( = ?auto_2141192 ?auto_2141193 ) ) ( not ( = ?auto_2141192 ?auto_2141194 ) ) ( not ( = ?auto_2141192 ?auto_2141196 ) ) ( not ( = ?auto_2141192 ?auto_2141195 ) ) ( not ( = ?auto_2141192 ?auto_2141197 ) ) ( not ( = ?auto_2141192 ?auto_2141198 ) ) ( not ( = ?auto_2141192 ?auto_2141199 ) ) ( not ( = ?auto_2141192 ?auto_2141200 ) ) ( not ( = ?auto_2141192 ?auto_2141201 ) ) ( not ( = ?auto_2141192 ?auto_2141204 ) ) ( not ( = ?auto_2141193 ?auto_2141194 ) ) ( not ( = ?auto_2141193 ?auto_2141196 ) ) ( not ( = ?auto_2141193 ?auto_2141195 ) ) ( not ( = ?auto_2141193 ?auto_2141197 ) ) ( not ( = ?auto_2141193 ?auto_2141198 ) ) ( not ( = ?auto_2141193 ?auto_2141199 ) ) ( not ( = ?auto_2141193 ?auto_2141200 ) ) ( not ( = ?auto_2141193 ?auto_2141201 ) ) ( not ( = ?auto_2141193 ?auto_2141204 ) ) ( not ( = ?auto_2141194 ?auto_2141196 ) ) ( not ( = ?auto_2141194 ?auto_2141195 ) ) ( not ( = ?auto_2141194 ?auto_2141197 ) ) ( not ( = ?auto_2141194 ?auto_2141198 ) ) ( not ( = ?auto_2141194 ?auto_2141199 ) ) ( not ( = ?auto_2141194 ?auto_2141200 ) ) ( not ( = ?auto_2141194 ?auto_2141201 ) ) ( not ( = ?auto_2141194 ?auto_2141204 ) ) ( not ( = ?auto_2141196 ?auto_2141195 ) ) ( not ( = ?auto_2141196 ?auto_2141197 ) ) ( not ( = ?auto_2141196 ?auto_2141198 ) ) ( not ( = ?auto_2141196 ?auto_2141199 ) ) ( not ( = ?auto_2141196 ?auto_2141200 ) ) ( not ( = ?auto_2141196 ?auto_2141201 ) ) ( not ( = ?auto_2141196 ?auto_2141204 ) ) ( not ( = ?auto_2141195 ?auto_2141197 ) ) ( not ( = ?auto_2141195 ?auto_2141198 ) ) ( not ( = ?auto_2141195 ?auto_2141199 ) ) ( not ( = ?auto_2141195 ?auto_2141200 ) ) ( not ( = ?auto_2141195 ?auto_2141201 ) ) ( not ( = ?auto_2141195 ?auto_2141204 ) ) ( not ( = ?auto_2141197 ?auto_2141198 ) ) ( not ( = ?auto_2141197 ?auto_2141199 ) ) ( not ( = ?auto_2141197 ?auto_2141200 ) ) ( not ( = ?auto_2141197 ?auto_2141201 ) ) ( not ( = ?auto_2141197 ?auto_2141204 ) ) ( not ( = ?auto_2141198 ?auto_2141199 ) ) ( not ( = ?auto_2141198 ?auto_2141200 ) ) ( not ( = ?auto_2141198 ?auto_2141201 ) ) ( not ( = ?auto_2141198 ?auto_2141204 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2141199 ?auto_2141200 ?auto_2141201 )
      ( MAKE-9CRATE-VERIFY ?auto_2141192 ?auto_2141193 ?auto_2141194 ?auto_2141196 ?auto_2141195 ?auto_2141197 ?auto_2141198 ?auto_2141199 ?auto_2141200 ?auto_2141201 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2141301 - SURFACE
      ?auto_2141302 - SURFACE
      ?auto_2141303 - SURFACE
      ?auto_2141305 - SURFACE
      ?auto_2141304 - SURFACE
      ?auto_2141306 - SURFACE
      ?auto_2141307 - SURFACE
      ?auto_2141308 - SURFACE
      ?auto_2141309 - SURFACE
      ?auto_2141310 - SURFACE
    )
    :vars
    (
      ?auto_2141315 - HOIST
      ?auto_2141312 - PLACE
      ?auto_2141314 - PLACE
      ?auto_2141316 - HOIST
      ?auto_2141311 - SURFACE
      ?auto_2141313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2141315 ?auto_2141312 ) ( IS-CRATE ?auto_2141310 ) ( not ( = ?auto_2141309 ?auto_2141310 ) ) ( not ( = ?auto_2141308 ?auto_2141309 ) ) ( not ( = ?auto_2141308 ?auto_2141310 ) ) ( not ( = ?auto_2141314 ?auto_2141312 ) ) ( HOIST-AT ?auto_2141316 ?auto_2141314 ) ( not ( = ?auto_2141315 ?auto_2141316 ) ) ( AVAILABLE ?auto_2141316 ) ( SURFACE-AT ?auto_2141310 ?auto_2141314 ) ( ON ?auto_2141310 ?auto_2141311 ) ( CLEAR ?auto_2141310 ) ( not ( = ?auto_2141309 ?auto_2141311 ) ) ( not ( = ?auto_2141310 ?auto_2141311 ) ) ( not ( = ?auto_2141308 ?auto_2141311 ) ) ( TRUCK-AT ?auto_2141313 ?auto_2141312 ) ( SURFACE-AT ?auto_2141308 ?auto_2141312 ) ( CLEAR ?auto_2141308 ) ( IS-CRATE ?auto_2141309 ) ( AVAILABLE ?auto_2141315 ) ( IN ?auto_2141309 ?auto_2141313 ) ( ON ?auto_2141302 ?auto_2141301 ) ( ON ?auto_2141303 ?auto_2141302 ) ( ON ?auto_2141305 ?auto_2141303 ) ( ON ?auto_2141304 ?auto_2141305 ) ( ON ?auto_2141306 ?auto_2141304 ) ( ON ?auto_2141307 ?auto_2141306 ) ( ON ?auto_2141308 ?auto_2141307 ) ( not ( = ?auto_2141301 ?auto_2141302 ) ) ( not ( = ?auto_2141301 ?auto_2141303 ) ) ( not ( = ?auto_2141301 ?auto_2141305 ) ) ( not ( = ?auto_2141301 ?auto_2141304 ) ) ( not ( = ?auto_2141301 ?auto_2141306 ) ) ( not ( = ?auto_2141301 ?auto_2141307 ) ) ( not ( = ?auto_2141301 ?auto_2141308 ) ) ( not ( = ?auto_2141301 ?auto_2141309 ) ) ( not ( = ?auto_2141301 ?auto_2141310 ) ) ( not ( = ?auto_2141301 ?auto_2141311 ) ) ( not ( = ?auto_2141302 ?auto_2141303 ) ) ( not ( = ?auto_2141302 ?auto_2141305 ) ) ( not ( = ?auto_2141302 ?auto_2141304 ) ) ( not ( = ?auto_2141302 ?auto_2141306 ) ) ( not ( = ?auto_2141302 ?auto_2141307 ) ) ( not ( = ?auto_2141302 ?auto_2141308 ) ) ( not ( = ?auto_2141302 ?auto_2141309 ) ) ( not ( = ?auto_2141302 ?auto_2141310 ) ) ( not ( = ?auto_2141302 ?auto_2141311 ) ) ( not ( = ?auto_2141303 ?auto_2141305 ) ) ( not ( = ?auto_2141303 ?auto_2141304 ) ) ( not ( = ?auto_2141303 ?auto_2141306 ) ) ( not ( = ?auto_2141303 ?auto_2141307 ) ) ( not ( = ?auto_2141303 ?auto_2141308 ) ) ( not ( = ?auto_2141303 ?auto_2141309 ) ) ( not ( = ?auto_2141303 ?auto_2141310 ) ) ( not ( = ?auto_2141303 ?auto_2141311 ) ) ( not ( = ?auto_2141305 ?auto_2141304 ) ) ( not ( = ?auto_2141305 ?auto_2141306 ) ) ( not ( = ?auto_2141305 ?auto_2141307 ) ) ( not ( = ?auto_2141305 ?auto_2141308 ) ) ( not ( = ?auto_2141305 ?auto_2141309 ) ) ( not ( = ?auto_2141305 ?auto_2141310 ) ) ( not ( = ?auto_2141305 ?auto_2141311 ) ) ( not ( = ?auto_2141304 ?auto_2141306 ) ) ( not ( = ?auto_2141304 ?auto_2141307 ) ) ( not ( = ?auto_2141304 ?auto_2141308 ) ) ( not ( = ?auto_2141304 ?auto_2141309 ) ) ( not ( = ?auto_2141304 ?auto_2141310 ) ) ( not ( = ?auto_2141304 ?auto_2141311 ) ) ( not ( = ?auto_2141306 ?auto_2141307 ) ) ( not ( = ?auto_2141306 ?auto_2141308 ) ) ( not ( = ?auto_2141306 ?auto_2141309 ) ) ( not ( = ?auto_2141306 ?auto_2141310 ) ) ( not ( = ?auto_2141306 ?auto_2141311 ) ) ( not ( = ?auto_2141307 ?auto_2141308 ) ) ( not ( = ?auto_2141307 ?auto_2141309 ) ) ( not ( = ?auto_2141307 ?auto_2141310 ) ) ( not ( = ?auto_2141307 ?auto_2141311 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2141308 ?auto_2141309 ?auto_2141310 )
      ( MAKE-9CRATE-VERIFY ?auto_2141301 ?auto_2141302 ?auto_2141303 ?auto_2141305 ?auto_2141304 ?auto_2141306 ?auto_2141307 ?auto_2141308 ?auto_2141309 ?auto_2141310 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2146830 - SURFACE
      ?auto_2146831 - SURFACE
      ?auto_2146832 - SURFACE
      ?auto_2146834 - SURFACE
      ?auto_2146833 - SURFACE
      ?auto_2146835 - SURFACE
      ?auto_2146836 - SURFACE
      ?auto_2146837 - SURFACE
      ?auto_2146838 - SURFACE
      ?auto_2146839 - SURFACE
      ?auto_2146840 - SURFACE
    )
    :vars
    (
      ?auto_2146841 - HOIST
      ?auto_2146842 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2146841 ?auto_2146842 ) ( SURFACE-AT ?auto_2146839 ?auto_2146842 ) ( CLEAR ?auto_2146839 ) ( LIFTING ?auto_2146841 ?auto_2146840 ) ( IS-CRATE ?auto_2146840 ) ( not ( = ?auto_2146839 ?auto_2146840 ) ) ( ON ?auto_2146831 ?auto_2146830 ) ( ON ?auto_2146832 ?auto_2146831 ) ( ON ?auto_2146834 ?auto_2146832 ) ( ON ?auto_2146833 ?auto_2146834 ) ( ON ?auto_2146835 ?auto_2146833 ) ( ON ?auto_2146836 ?auto_2146835 ) ( ON ?auto_2146837 ?auto_2146836 ) ( ON ?auto_2146838 ?auto_2146837 ) ( ON ?auto_2146839 ?auto_2146838 ) ( not ( = ?auto_2146830 ?auto_2146831 ) ) ( not ( = ?auto_2146830 ?auto_2146832 ) ) ( not ( = ?auto_2146830 ?auto_2146834 ) ) ( not ( = ?auto_2146830 ?auto_2146833 ) ) ( not ( = ?auto_2146830 ?auto_2146835 ) ) ( not ( = ?auto_2146830 ?auto_2146836 ) ) ( not ( = ?auto_2146830 ?auto_2146837 ) ) ( not ( = ?auto_2146830 ?auto_2146838 ) ) ( not ( = ?auto_2146830 ?auto_2146839 ) ) ( not ( = ?auto_2146830 ?auto_2146840 ) ) ( not ( = ?auto_2146831 ?auto_2146832 ) ) ( not ( = ?auto_2146831 ?auto_2146834 ) ) ( not ( = ?auto_2146831 ?auto_2146833 ) ) ( not ( = ?auto_2146831 ?auto_2146835 ) ) ( not ( = ?auto_2146831 ?auto_2146836 ) ) ( not ( = ?auto_2146831 ?auto_2146837 ) ) ( not ( = ?auto_2146831 ?auto_2146838 ) ) ( not ( = ?auto_2146831 ?auto_2146839 ) ) ( not ( = ?auto_2146831 ?auto_2146840 ) ) ( not ( = ?auto_2146832 ?auto_2146834 ) ) ( not ( = ?auto_2146832 ?auto_2146833 ) ) ( not ( = ?auto_2146832 ?auto_2146835 ) ) ( not ( = ?auto_2146832 ?auto_2146836 ) ) ( not ( = ?auto_2146832 ?auto_2146837 ) ) ( not ( = ?auto_2146832 ?auto_2146838 ) ) ( not ( = ?auto_2146832 ?auto_2146839 ) ) ( not ( = ?auto_2146832 ?auto_2146840 ) ) ( not ( = ?auto_2146834 ?auto_2146833 ) ) ( not ( = ?auto_2146834 ?auto_2146835 ) ) ( not ( = ?auto_2146834 ?auto_2146836 ) ) ( not ( = ?auto_2146834 ?auto_2146837 ) ) ( not ( = ?auto_2146834 ?auto_2146838 ) ) ( not ( = ?auto_2146834 ?auto_2146839 ) ) ( not ( = ?auto_2146834 ?auto_2146840 ) ) ( not ( = ?auto_2146833 ?auto_2146835 ) ) ( not ( = ?auto_2146833 ?auto_2146836 ) ) ( not ( = ?auto_2146833 ?auto_2146837 ) ) ( not ( = ?auto_2146833 ?auto_2146838 ) ) ( not ( = ?auto_2146833 ?auto_2146839 ) ) ( not ( = ?auto_2146833 ?auto_2146840 ) ) ( not ( = ?auto_2146835 ?auto_2146836 ) ) ( not ( = ?auto_2146835 ?auto_2146837 ) ) ( not ( = ?auto_2146835 ?auto_2146838 ) ) ( not ( = ?auto_2146835 ?auto_2146839 ) ) ( not ( = ?auto_2146835 ?auto_2146840 ) ) ( not ( = ?auto_2146836 ?auto_2146837 ) ) ( not ( = ?auto_2146836 ?auto_2146838 ) ) ( not ( = ?auto_2146836 ?auto_2146839 ) ) ( not ( = ?auto_2146836 ?auto_2146840 ) ) ( not ( = ?auto_2146837 ?auto_2146838 ) ) ( not ( = ?auto_2146837 ?auto_2146839 ) ) ( not ( = ?auto_2146837 ?auto_2146840 ) ) ( not ( = ?auto_2146838 ?auto_2146839 ) ) ( not ( = ?auto_2146838 ?auto_2146840 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2146839 ?auto_2146840 )
      ( MAKE-10CRATE-VERIFY ?auto_2146830 ?auto_2146831 ?auto_2146832 ?auto_2146834 ?auto_2146833 ?auto_2146835 ?auto_2146836 ?auto_2146837 ?auto_2146838 ?auto_2146839 ?auto_2146840 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2146924 - SURFACE
      ?auto_2146925 - SURFACE
      ?auto_2146926 - SURFACE
      ?auto_2146928 - SURFACE
      ?auto_2146927 - SURFACE
      ?auto_2146929 - SURFACE
      ?auto_2146930 - SURFACE
      ?auto_2146931 - SURFACE
      ?auto_2146932 - SURFACE
      ?auto_2146933 - SURFACE
      ?auto_2146934 - SURFACE
    )
    :vars
    (
      ?auto_2146937 - HOIST
      ?auto_2146935 - PLACE
      ?auto_2146936 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2146937 ?auto_2146935 ) ( SURFACE-AT ?auto_2146933 ?auto_2146935 ) ( CLEAR ?auto_2146933 ) ( IS-CRATE ?auto_2146934 ) ( not ( = ?auto_2146933 ?auto_2146934 ) ) ( TRUCK-AT ?auto_2146936 ?auto_2146935 ) ( AVAILABLE ?auto_2146937 ) ( IN ?auto_2146934 ?auto_2146936 ) ( ON ?auto_2146933 ?auto_2146932 ) ( not ( = ?auto_2146932 ?auto_2146933 ) ) ( not ( = ?auto_2146932 ?auto_2146934 ) ) ( ON ?auto_2146925 ?auto_2146924 ) ( ON ?auto_2146926 ?auto_2146925 ) ( ON ?auto_2146928 ?auto_2146926 ) ( ON ?auto_2146927 ?auto_2146928 ) ( ON ?auto_2146929 ?auto_2146927 ) ( ON ?auto_2146930 ?auto_2146929 ) ( ON ?auto_2146931 ?auto_2146930 ) ( ON ?auto_2146932 ?auto_2146931 ) ( not ( = ?auto_2146924 ?auto_2146925 ) ) ( not ( = ?auto_2146924 ?auto_2146926 ) ) ( not ( = ?auto_2146924 ?auto_2146928 ) ) ( not ( = ?auto_2146924 ?auto_2146927 ) ) ( not ( = ?auto_2146924 ?auto_2146929 ) ) ( not ( = ?auto_2146924 ?auto_2146930 ) ) ( not ( = ?auto_2146924 ?auto_2146931 ) ) ( not ( = ?auto_2146924 ?auto_2146932 ) ) ( not ( = ?auto_2146924 ?auto_2146933 ) ) ( not ( = ?auto_2146924 ?auto_2146934 ) ) ( not ( = ?auto_2146925 ?auto_2146926 ) ) ( not ( = ?auto_2146925 ?auto_2146928 ) ) ( not ( = ?auto_2146925 ?auto_2146927 ) ) ( not ( = ?auto_2146925 ?auto_2146929 ) ) ( not ( = ?auto_2146925 ?auto_2146930 ) ) ( not ( = ?auto_2146925 ?auto_2146931 ) ) ( not ( = ?auto_2146925 ?auto_2146932 ) ) ( not ( = ?auto_2146925 ?auto_2146933 ) ) ( not ( = ?auto_2146925 ?auto_2146934 ) ) ( not ( = ?auto_2146926 ?auto_2146928 ) ) ( not ( = ?auto_2146926 ?auto_2146927 ) ) ( not ( = ?auto_2146926 ?auto_2146929 ) ) ( not ( = ?auto_2146926 ?auto_2146930 ) ) ( not ( = ?auto_2146926 ?auto_2146931 ) ) ( not ( = ?auto_2146926 ?auto_2146932 ) ) ( not ( = ?auto_2146926 ?auto_2146933 ) ) ( not ( = ?auto_2146926 ?auto_2146934 ) ) ( not ( = ?auto_2146928 ?auto_2146927 ) ) ( not ( = ?auto_2146928 ?auto_2146929 ) ) ( not ( = ?auto_2146928 ?auto_2146930 ) ) ( not ( = ?auto_2146928 ?auto_2146931 ) ) ( not ( = ?auto_2146928 ?auto_2146932 ) ) ( not ( = ?auto_2146928 ?auto_2146933 ) ) ( not ( = ?auto_2146928 ?auto_2146934 ) ) ( not ( = ?auto_2146927 ?auto_2146929 ) ) ( not ( = ?auto_2146927 ?auto_2146930 ) ) ( not ( = ?auto_2146927 ?auto_2146931 ) ) ( not ( = ?auto_2146927 ?auto_2146932 ) ) ( not ( = ?auto_2146927 ?auto_2146933 ) ) ( not ( = ?auto_2146927 ?auto_2146934 ) ) ( not ( = ?auto_2146929 ?auto_2146930 ) ) ( not ( = ?auto_2146929 ?auto_2146931 ) ) ( not ( = ?auto_2146929 ?auto_2146932 ) ) ( not ( = ?auto_2146929 ?auto_2146933 ) ) ( not ( = ?auto_2146929 ?auto_2146934 ) ) ( not ( = ?auto_2146930 ?auto_2146931 ) ) ( not ( = ?auto_2146930 ?auto_2146932 ) ) ( not ( = ?auto_2146930 ?auto_2146933 ) ) ( not ( = ?auto_2146930 ?auto_2146934 ) ) ( not ( = ?auto_2146931 ?auto_2146932 ) ) ( not ( = ?auto_2146931 ?auto_2146933 ) ) ( not ( = ?auto_2146931 ?auto_2146934 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2146932 ?auto_2146933 ?auto_2146934 )
      ( MAKE-10CRATE-VERIFY ?auto_2146924 ?auto_2146925 ?auto_2146926 ?auto_2146928 ?auto_2146927 ?auto_2146929 ?auto_2146930 ?auto_2146931 ?auto_2146932 ?auto_2146933 ?auto_2146934 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2147029 - SURFACE
      ?auto_2147030 - SURFACE
      ?auto_2147031 - SURFACE
      ?auto_2147033 - SURFACE
      ?auto_2147032 - SURFACE
      ?auto_2147034 - SURFACE
      ?auto_2147035 - SURFACE
      ?auto_2147036 - SURFACE
      ?auto_2147037 - SURFACE
      ?auto_2147038 - SURFACE
      ?auto_2147039 - SURFACE
    )
    :vars
    (
      ?auto_2147041 - HOIST
      ?auto_2147042 - PLACE
      ?auto_2147040 - TRUCK
      ?auto_2147043 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2147041 ?auto_2147042 ) ( SURFACE-AT ?auto_2147038 ?auto_2147042 ) ( CLEAR ?auto_2147038 ) ( IS-CRATE ?auto_2147039 ) ( not ( = ?auto_2147038 ?auto_2147039 ) ) ( AVAILABLE ?auto_2147041 ) ( IN ?auto_2147039 ?auto_2147040 ) ( ON ?auto_2147038 ?auto_2147037 ) ( not ( = ?auto_2147037 ?auto_2147038 ) ) ( not ( = ?auto_2147037 ?auto_2147039 ) ) ( TRUCK-AT ?auto_2147040 ?auto_2147043 ) ( not ( = ?auto_2147043 ?auto_2147042 ) ) ( ON ?auto_2147030 ?auto_2147029 ) ( ON ?auto_2147031 ?auto_2147030 ) ( ON ?auto_2147033 ?auto_2147031 ) ( ON ?auto_2147032 ?auto_2147033 ) ( ON ?auto_2147034 ?auto_2147032 ) ( ON ?auto_2147035 ?auto_2147034 ) ( ON ?auto_2147036 ?auto_2147035 ) ( ON ?auto_2147037 ?auto_2147036 ) ( not ( = ?auto_2147029 ?auto_2147030 ) ) ( not ( = ?auto_2147029 ?auto_2147031 ) ) ( not ( = ?auto_2147029 ?auto_2147033 ) ) ( not ( = ?auto_2147029 ?auto_2147032 ) ) ( not ( = ?auto_2147029 ?auto_2147034 ) ) ( not ( = ?auto_2147029 ?auto_2147035 ) ) ( not ( = ?auto_2147029 ?auto_2147036 ) ) ( not ( = ?auto_2147029 ?auto_2147037 ) ) ( not ( = ?auto_2147029 ?auto_2147038 ) ) ( not ( = ?auto_2147029 ?auto_2147039 ) ) ( not ( = ?auto_2147030 ?auto_2147031 ) ) ( not ( = ?auto_2147030 ?auto_2147033 ) ) ( not ( = ?auto_2147030 ?auto_2147032 ) ) ( not ( = ?auto_2147030 ?auto_2147034 ) ) ( not ( = ?auto_2147030 ?auto_2147035 ) ) ( not ( = ?auto_2147030 ?auto_2147036 ) ) ( not ( = ?auto_2147030 ?auto_2147037 ) ) ( not ( = ?auto_2147030 ?auto_2147038 ) ) ( not ( = ?auto_2147030 ?auto_2147039 ) ) ( not ( = ?auto_2147031 ?auto_2147033 ) ) ( not ( = ?auto_2147031 ?auto_2147032 ) ) ( not ( = ?auto_2147031 ?auto_2147034 ) ) ( not ( = ?auto_2147031 ?auto_2147035 ) ) ( not ( = ?auto_2147031 ?auto_2147036 ) ) ( not ( = ?auto_2147031 ?auto_2147037 ) ) ( not ( = ?auto_2147031 ?auto_2147038 ) ) ( not ( = ?auto_2147031 ?auto_2147039 ) ) ( not ( = ?auto_2147033 ?auto_2147032 ) ) ( not ( = ?auto_2147033 ?auto_2147034 ) ) ( not ( = ?auto_2147033 ?auto_2147035 ) ) ( not ( = ?auto_2147033 ?auto_2147036 ) ) ( not ( = ?auto_2147033 ?auto_2147037 ) ) ( not ( = ?auto_2147033 ?auto_2147038 ) ) ( not ( = ?auto_2147033 ?auto_2147039 ) ) ( not ( = ?auto_2147032 ?auto_2147034 ) ) ( not ( = ?auto_2147032 ?auto_2147035 ) ) ( not ( = ?auto_2147032 ?auto_2147036 ) ) ( not ( = ?auto_2147032 ?auto_2147037 ) ) ( not ( = ?auto_2147032 ?auto_2147038 ) ) ( not ( = ?auto_2147032 ?auto_2147039 ) ) ( not ( = ?auto_2147034 ?auto_2147035 ) ) ( not ( = ?auto_2147034 ?auto_2147036 ) ) ( not ( = ?auto_2147034 ?auto_2147037 ) ) ( not ( = ?auto_2147034 ?auto_2147038 ) ) ( not ( = ?auto_2147034 ?auto_2147039 ) ) ( not ( = ?auto_2147035 ?auto_2147036 ) ) ( not ( = ?auto_2147035 ?auto_2147037 ) ) ( not ( = ?auto_2147035 ?auto_2147038 ) ) ( not ( = ?auto_2147035 ?auto_2147039 ) ) ( not ( = ?auto_2147036 ?auto_2147037 ) ) ( not ( = ?auto_2147036 ?auto_2147038 ) ) ( not ( = ?auto_2147036 ?auto_2147039 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2147037 ?auto_2147038 ?auto_2147039 )
      ( MAKE-10CRATE-VERIFY ?auto_2147029 ?auto_2147030 ?auto_2147031 ?auto_2147033 ?auto_2147032 ?auto_2147034 ?auto_2147035 ?auto_2147036 ?auto_2147037 ?auto_2147038 ?auto_2147039 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2147144 - SURFACE
      ?auto_2147145 - SURFACE
      ?auto_2147146 - SURFACE
      ?auto_2147148 - SURFACE
      ?auto_2147147 - SURFACE
      ?auto_2147149 - SURFACE
      ?auto_2147150 - SURFACE
      ?auto_2147151 - SURFACE
      ?auto_2147152 - SURFACE
      ?auto_2147153 - SURFACE
      ?auto_2147154 - SURFACE
    )
    :vars
    (
      ?auto_2147157 - HOIST
      ?auto_2147159 - PLACE
      ?auto_2147158 - TRUCK
      ?auto_2147156 - PLACE
      ?auto_2147155 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2147157 ?auto_2147159 ) ( SURFACE-AT ?auto_2147153 ?auto_2147159 ) ( CLEAR ?auto_2147153 ) ( IS-CRATE ?auto_2147154 ) ( not ( = ?auto_2147153 ?auto_2147154 ) ) ( AVAILABLE ?auto_2147157 ) ( ON ?auto_2147153 ?auto_2147152 ) ( not ( = ?auto_2147152 ?auto_2147153 ) ) ( not ( = ?auto_2147152 ?auto_2147154 ) ) ( TRUCK-AT ?auto_2147158 ?auto_2147156 ) ( not ( = ?auto_2147156 ?auto_2147159 ) ) ( HOIST-AT ?auto_2147155 ?auto_2147156 ) ( LIFTING ?auto_2147155 ?auto_2147154 ) ( not ( = ?auto_2147157 ?auto_2147155 ) ) ( ON ?auto_2147145 ?auto_2147144 ) ( ON ?auto_2147146 ?auto_2147145 ) ( ON ?auto_2147148 ?auto_2147146 ) ( ON ?auto_2147147 ?auto_2147148 ) ( ON ?auto_2147149 ?auto_2147147 ) ( ON ?auto_2147150 ?auto_2147149 ) ( ON ?auto_2147151 ?auto_2147150 ) ( ON ?auto_2147152 ?auto_2147151 ) ( not ( = ?auto_2147144 ?auto_2147145 ) ) ( not ( = ?auto_2147144 ?auto_2147146 ) ) ( not ( = ?auto_2147144 ?auto_2147148 ) ) ( not ( = ?auto_2147144 ?auto_2147147 ) ) ( not ( = ?auto_2147144 ?auto_2147149 ) ) ( not ( = ?auto_2147144 ?auto_2147150 ) ) ( not ( = ?auto_2147144 ?auto_2147151 ) ) ( not ( = ?auto_2147144 ?auto_2147152 ) ) ( not ( = ?auto_2147144 ?auto_2147153 ) ) ( not ( = ?auto_2147144 ?auto_2147154 ) ) ( not ( = ?auto_2147145 ?auto_2147146 ) ) ( not ( = ?auto_2147145 ?auto_2147148 ) ) ( not ( = ?auto_2147145 ?auto_2147147 ) ) ( not ( = ?auto_2147145 ?auto_2147149 ) ) ( not ( = ?auto_2147145 ?auto_2147150 ) ) ( not ( = ?auto_2147145 ?auto_2147151 ) ) ( not ( = ?auto_2147145 ?auto_2147152 ) ) ( not ( = ?auto_2147145 ?auto_2147153 ) ) ( not ( = ?auto_2147145 ?auto_2147154 ) ) ( not ( = ?auto_2147146 ?auto_2147148 ) ) ( not ( = ?auto_2147146 ?auto_2147147 ) ) ( not ( = ?auto_2147146 ?auto_2147149 ) ) ( not ( = ?auto_2147146 ?auto_2147150 ) ) ( not ( = ?auto_2147146 ?auto_2147151 ) ) ( not ( = ?auto_2147146 ?auto_2147152 ) ) ( not ( = ?auto_2147146 ?auto_2147153 ) ) ( not ( = ?auto_2147146 ?auto_2147154 ) ) ( not ( = ?auto_2147148 ?auto_2147147 ) ) ( not ( = ?auto_2147148 ?auto_2147149 ) ) ( not ( = ?auto_2147148 ?auto_2147150 ) ) ( not ( = ?auto_2147148 ?auto_2147151 ) ) ( not ( = ?auto_2147148 ?auto_2147152 ) ) ( not ( = ?auto_2147148 ?auto_2147153 ) ) ( not ( = ?auto_2147148 ?auto_2147154 ) ) ( not ( = ?auto_2147147 ?auto_2147149 ) ) ( not ( = ?auto_2147147 ?auto_2147150 ) ) ( not ( = ?auto_2147147 ?auto_2147151 ) ) ( not ( = ?auto_2147147 ?auto_2147152 ) ) ( not ( = ?auto_2147147 ?auto_2147153 ) ) ( not ( = ?auto_2147147 ?auto_2147154 ) ) ( not ( = ?auto_2147149 ?auto_2147150 ) ) ( not ( = ?auto_2147149 ?auto_2147151 ) ) ( not ( = ?auto_2147149 ?auto_2147152 ) ) ( not ( = ?auto_2147149 ?auto_2147153 ) ) ( not ( = ?auto_2147149 ?auto_2147154 ) ) ( not ( = ?auto_2147150 ?auto_2147151 ) ) ( not ( = ?auto_2147150 ?auto_2147152 ) ) ( not ( = ?auto_2147150 ?auto_2147153 ) ) ( not ( = ?auto_2147150 ?auto_2147154 ) ) ( not ( = ?auto_2147151 ?auto_2147152 ) ) ( not ( = ?auto_2147151 ?auto_2147153 ) ) ( not ( = ?auto_2147151 ?auto_2147154 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2147152 ?auto_2147153 ?auto_2147154 )
      ( MAKE-10CRATE-VERIFY ?auto_2147144 ?auto_2147145 ?auto_2147146 ?auto_2147148 ?auto_2147147 ?auto_2147149 ?auto_2147150 ?auto_2147151 ?auto_2147152 ?auto_2147153 ?auto_2147154 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2147269 - SURFACE
      ?auto_2147270 - SURFACE
      ?auto_2147271 - SURFACE
      ?auto_2147273 - SURFACE
      ?auto_2147272 - SURFACE
      ?auto_2147274 - SURFACE
      ?auto_2147275 - SURFACE
      ?auto_2147276 - SURFACE
      ?auto_2147277 - SURFACE
      ?auto_2147278 - SURFACE
      ?auto_2147279 - SURFACE
    )
    :vars
    (
      ?auto_2147283 - HOIST
      ?auto_2147281 - PLACE
      ?auto_2147282 - TRUCK
      ?auto_2147284 - PLACE
      ?auto_2147280 - HOIST
      ?auto_2147285 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2147283 ?auto_2147281 ) ( SURFACE-AT ?auto_2147278 ?auto_2147281 ) ( CLEAR ?auto_2147278 ) ( IS-CRATE ?auto_2147279 ) ( not ( = ?auto_2147278 ?auto_2147279 ) ) ( AVAILABLE ?auto_2147283 ) ( ON ?auto_2147278 ?auto_2147277 ) ( not ( = ?auto_2147277 ?auto_2147278 ) ) ( not ( = ?auto_2147277 ?auto_2147279 ) ) ( TRUCK-AT ?auto_2147282 ?auto_2147284 ) ( not ( = ?auto_2147284 ?auto_2147281 ) ) ( HOIST-AT ?auto_2147280 ?auto_2147284 ) ( not ( = ?auto_2147283 ?auto_2147280 ) ) ( AVAILABLE ?auto_2147280 ) ( SURFACE-AT ?auto_2147279 ?auto_2147284 ) ( ON ?auto_2147279 ?auto_2147285 ) ( CLEAR ?auto_2147279 ) ( not ( = ?auto_2147278 ?auto_2147285 ) ) ( not ( = ?auto_2147279 ?auto_2147285 ) ) ( not ( = ?auto_2147277 ?auto_2147285 ) ) ( ON ?auto_2147270 ?auto_2147269 ) ( ON ?auto_2147271 ?auto_2147270 ) ( ON ?auto_2147273 ?auto_2147271 ) ( ON ?auto_2147272 ?auto_2147273 ) ( ON ?auto_2147274 ?auto_2147272 ) ( ON ?auto_2147275 ?auto_2147274 ) ( ON ?auto_2147276 ?auto_2147275 ) ( ON ?auto_2147277 ?auto_2147276 ) ( not ( = ?auto_2147269 ?auto_2147270 ) ) ( not ( = ?auto_2147269 ?auto_2147271 ) ) ( not ( = ?auto_2147269 ?auto_2147273 ) ) ( not ( = ?auto_2147269 ?auto_2147272 ) ) ( not ( = ?auto_2147269 ?auto_2147274 ) ) ( not ( = ?auto_2147269 ?auto_2147275 ) ) ( not ( = ?auto_2147269 ?auto_2147276 ) ) ( not ( = ?auto_2147269 ?auto_2147277 ) ) ( not ( = ?auto_2147269 ?auto_2147278 ) ) ( not ( = ?auto_2147269 ?auto_2147279 ) ) ( not ( = ?auto_2147269 ?auto_2147285 ) ) ( not ( = ?auto_2147270 ?auto_2147271 ) ) ( not ( = ?auto_2147270 ?auto_2147273 ) ) ( not ( = ?auto_2147270 ?auto_2147272 ) ) ( not ( = ?auto_2147270 ?auto_2147274 ) ) ( not ( = ?auto_2147270 ?auto_2147275 ) ) ( not ( = ?auto_2147270 ?auto_2147276 ) ) ( not ( = ?auto_2147270 ?auto_2147277 ) ) ( not ( = ?auto_2147270 ?auto_2147278 ) ) ( not ( = ?auto_2147270 ?auto_2147279 ) ) ( not ( = ?auto_2147270 ?auto_2147285 ) ) ( not ( = ?auto_2147271 ?auto_2147273 ) ) ( not ( = ?auto_2147271 ?auto_2147272 ) ) ( not ( = ?auto_2147271 ?auto_2147274 ) ) ( not ( = ?auto_2147271 ?auto_2147275 ) ) ( not ( = ?auto_2147271 ?auto_2147276 ) ) ( not ( = ?auto_2147271 ?auto_2147277 ) ) ( not ( = ?auto_2147271 ?auto_2147278 ) ) ( not ( = ?auto_2147271 ?auto_2147279 ) ) ( not ( = ?auto_2147271 ?auto_2147285 ) ) ( not ( = ?auto_2147273 ?auto_2147272 ) ) ( not ( = ?auto_2147273 ?auto_2147274 ) ) ( not ( = ?auto_2147273 ?auto_2147275 ) ) ( not ( = ?auto_2147273 ?auto_2147276 ) ) ( not ( = ?auto_2147273 ?auto_2147277 ) ) ( not ( = ?auto_2147273 ?auto_2147278 ) ) ( not ( = ?auto_2147273 ?auto_2147279 ) ) ( not ( = ?auto_2147273 ?auto_2147285 ) ) ( not ( = ?auto_2147272 ?auto_2147274 ) ) ( not ( = ?auto_2147272 ?auto_2147275 ) ) ( not ( = ?auto_2147272 ?auto_2147276 ) ) ( not ( = ?auto_2147272 ?auto_2147277 ) ) ( not ( = ?auto_2147272 ?auto_2147278 ) ) ( not ( = ?auto_2147272 ?auto_2147279 ) ) ( not ( = ?auto_2147272 ?auto_2147285 ) ) ( not ( = ?auto_2147274 ?auto_2147275 ) ) ( not ( = ?auto_2147274 ?auto_2147276 ) ) ( not ( = ?auto_2147274 ?auto_2147277 ) ) ( not ( = ?auto_2147274 ?auto_2147278 ) ) ( not ( = ?auto_2147274 ?auto_2147279 ) ) ( not ( = ?auto_2147274 ?auto_2147285 ) ) ( not ( = ?auto_2147275 ?auto_2147276 ) ) ( not ( = ?auto_2147275 ?auto_2147277 ) ) ( not ( = ?auto_2147275 ?auto_2147278 ) ) ( not ( = ?auto_2147275 ?auto_2147279 ) ) ( not ( = ?auto_2147275 ?auto_2147285 ) ) ( not ( = ?auto_2147276 ?auto_2147277 ) ) ( not ( = ?auto_2147276 ?auto_2147278 ) ) ( not ( = ?auto_2147276 ?auto_2147279 ) ) ( not ( = ?auto_2147276 ?auto_2147285 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2147277 ?auto_2147278 ?auto_2147279 )
      ( MAKE-10CRATE-VERIFY ?auto_2147269 ?auto_2147270 ?auto_2147271 ?auto_2147273 ?auto_2147272 ?auto_2147274 ?auto_2147275 ?auto_2147276 ?auto_2147277 ?auto_2147278 ?auto_2147279 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2147395 - SURFACE
      ?auto_2147396 - SURFACE
      ?auto_2147397 - SURFACE
      ?auto_2147399 - SURFACE
      ?auto_2147398 - SURFACE
      ?auto_2147400 - SURFACE
      ?auto_2147401 - SURFACE
      ?auto_2147402 - SURFACE
      ?auto_2147403 - SURFACE
      ?auto_2147404 - SURFACE
      ?auto_2147405 - SURFACE
    )
    :vars
    (
      ?auto_2147407 - HOIST
      ?auto_2147406 - PLACE
      ?auto_2147411 - PLACE
      ?auto_2147409 - HOIST
      ?auto_2147410 - SURFACE
      ?auto_2147408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2147407 ?auto_2147406 ) ( SURFACE-AT ?auto_2147404 ?auto_2147406 ) ( CLEAR ?auto_2147404 ) ( IS-CRATE ?auto_2147405 ) ( not ( = ?auto_2147404 ?auto_2147405 ) ) ( AVAILABLE ?auto_2147407 ) ( ON ?auto_2147404 ?auto_2147403 ) ( not ( = ?auto_2147403 ?auto_2147404 ) ) ( not ( = ?auto_2147403 ?auto_2147405 ) ) ( not ( = ?auto_2147411 ?auto_2147406 ) ) ( HOIST-AT ?auto_2147409 ?auto_2147411 ) ( not ( = ?auto_2147407 ?auto_2147409 ) ) ( AVAILABLE ?auto_2147409 ) ( SURFACE-AT ?auto_2147405 ?auto_2147411 ) ( ON ?auto_2147405 ?auto_2147410 ) ( CLEAR ?auto_2147405 ) ( not ( = ?auto_2147404 ?auto_2147410 ) ) ( not ( = ?auto_2147405 ?auto_2147410 ) ) ( not ( = ?auto_2147403 ?auto_2147410 ) ) ( TRUCK-AT ?auto_2147408 ?auto_2147406 ) ( ON ?auto_2147396 ?auto_2147395 ) ( ON ?auto_2147397 ?auto_2147396 ) ( ON ?auto_2147399 ?auto_2147397 ) ( ON ?auto_2147398 ?auto_2147399 ) ( ON ?auto_2147400 ?auto_2147398 ) ( ON ?auto_2147401 ?auto_2147400 ) ( ON ?auto_2147402 ?auto_2147401 ) ( ON ?auto_2147403 ?auto_2147402 ) ( not ( = ?auto_2147395 ?auto_2147396 ) ) ( not ( = ?auto_2147395 ?auto_2147397 ) ) ( not ( = ?auto_2147395 ?auto_2147399 ) ) ( not ( = ?auto_2147395 ?auto_2147398 ) ) ( not ( = ?auto_2147395 ?auto_2147400 ) ) ( not ( = ?auto_2147395 ?auto_2147401 ) ) ( not ( = ?auto_2147395 ?auto_2147402 ) ) ( not ( = ?auto_2147395 ?auto_2147403 ) ) ( not ( = ?auto_2147395 ?auto_2147404 ) ) ( not ( = ?auto_2147395 ?auto_2147405 ) ) ( not ( = ?auto_2147395 ?auto_2147410 ) ) ( not ( = ?auto_2147396 ?auto_2147397 ) ) ( not ( = ?auto_2147396 ?auto_2147399 ) ) ( not ( = ?auto_2147396 ?auto_2147398 ) ) ( not ( = ?auto_2147396 ?auto_2147400 ) ) ( not ( = ?auto_2147396 ?auto_2147401 ) ) ( not ( = ?auto_2147396 ?auto_2147402 ) ) ( not ( = ?auto_2147396 ?auto_2147403 ) ) ( not ( = ?auto_2147396 ?auto_2147404 ) ) ( not ( = ?auto_2147396 ?auto_2147405 ) ) ( not ( = ?auto_2147396 ?auto_2147410 ) ) ( not ( = ?auto_2147397 ?auto_2147399 ) ) ( not ( = ?auto_2147397 ?auto_2147398 ) ) ( not ( = ?auto_2147397 ?auto_2147400 ) ) ( not ( = ?auto_2147397 ?auto_2147401 ) ) ( not ( = ?auto_2147397 ?auto_2147402 ) ) ( not ( = ?auto_2147397 ?auto_2147403 ) ) ( not ( = ?auto_2147397 ?auto_2147404 ) ) ( not ( = ?auto_2147397 ?auto_2147405 ) ) ( not ( = ?auto_2147397 ?auto_2147410 ) ) ( not ( = ?auto_2147399 ?auto_2147398 ) ) ( not ( = ?auto_2147399 ?auto_2147400 ) ) ( not ( = ?auto_2147399 ?auto_2147401 ) ) ( not ( = ?auto_2147399 ?auto_2147402 ) ) ( not ( = ?auto_2147399 ?auto_2147403 ) ) ( not ( = ?auto_2147399 ?auto_2147404 ) ) ( not ( = ?auto_2147399 ?auto_2147405 ) ) ( not ( = ?auto_2147399 ?auto_2147410 ) ) ( not ( = ?auto_2147398 ?auto_2147400 ) ) ( not ( = ?auto_2147398 ?auto_2147401 ) ) ( not ( = ?auto_2147398 ?auto_2147402 ) ) ( not ( = ?auto_2147398 ?auto_2147403 ) ) ( not ( = ?auto_2147398 ?auto_2147404 ) ) ( not ( = ?auto_2147398 ?auto_2147405 ) ) ( not ( = ?auto_2147398 ?auto_2147410 ) ) ( not ( = ?auto_2147400 ?auto_2147401 ) ) ( not ( = ?auto_2147400 ?auto_2147402 ) ) ( not ( = ?auto_2147400 ?auto_2147403 ) ) ( not ( = ?auto_2147400 ?auto_2147404 ) ) ( not ( = ?auto_2147400 ?auto_2147405 ) ) ( not ( = ?auto_2147400 ?auto_2147410 ) ) ( not ( = ?auto_2147401 ?auto_2147402 ) ) ( not ( = ?auto_2147401 ?auto_2147403 ) ) ( not ( = ?auto_2147401 ?auto_2147404 ) ) ( not ( = ?auto_2147401 ?auto_2147405 ) ) ( not ( = ?auto_2147401 ?auto_2147410 ) ) ( not ( = ?auto_2147402 ?auto_2147403 ) ) ( not ( = ?auto_2147402 ?auto_2147404 ) ) ( not ( = ?auto_2147402 ?auto_2147405 ) ) ( not ( = ?auto_2147402 ?auto_2147410 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2147403 ?auto_2147404 ?auto_2147405 )
      ( MAKE-10CRATE-VERIFY ?auto_2147395 ?auto_2147396 ?auto_2147397 ?auto_2147399 ?auto_2147398 ?auto_2147400 ?auto_2147401 ?auto_2147402 ?auto_2147403 ?auto_2147404 ?auto_2147405 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2147521 - SURFACE
      ?auto_2147522 - SURFACE
      ?auto_2147523 - SURFACE
      ?auto_2147525 - SURFACE
      ?auto_2147524 - SURFACE
      ?auto_2147526 - SURFACE
      ?auto_2147527 - SURFACE
      ?auto_2147528 - SURFACE
      ?auto_2147529 - SURFACE
      ?auto_2147530 - SURFACE
      ?auto_2147531 - SURFACE
    )
    :vars
    (
      ?auto_2147532 - HOIST
      ?auto_2147536 - PLACE
      ?auto_2147533 - PLACE
      ?auto_2147537 - HOIST
      ?auto_2147535 - SURFACE
      ?auto_2147534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2147532 ?auto_2147536 ) ( IS-CRATE ?auto_2147531 ) ( not ( = ?auto_2147530 ?auto_2147531 ) ) ( not ( = ?auto_2147529 ?auto_2147530 ) ) ( not ( = ?auto_2147529 ?auto_2147531 ) ) ( not ( = ?auto_2147533 ?auto_2147536 ) ) ( HOIST-AT ?auto_2147537 ?auto_2147533 ) ( not ( = ?auto_2147532 ?auto_2147537 ) ) ( AVAILABLE ?auto_2147537 ) ( SURFACE-AT ?auto_2147531 ?auto_2147533 ) ( ON ?auto_2147531 ?auto_2147535 ) ( CLEAR ?auto_2147531 ) ( not ( = ?auto_2147530 ?auto_2147535 ) ) ( not ( = ?auto_2147531 ?auto_2147535 ) ) ( not ( = ?auto_2147529 ?auto_2147535 ) ) ( TRUCK-AT ?auto_2147534 ?auto_2147536 ) ( SURFACE-AT ?auto_2147529 ?auto_2147536 ) ( CLEAR ?auto_2147529 ) ( LIFTING ?auto_2147532 ?auto_2147530 ) ( IS-CRATE ?auto_2147530 ) ( ON ?auto_2147522 ?auto_2147521 ) ( ON ?auto_2147523 ?auto_2147522 ) ( ON ?auto_2147525 ?auto_2147523 ) ( ON ?auto_2147524 ?auto_2147525 ) ( ON ?auto_2147526 ?auto_2147524 ) ( ON ?auto_2147527 ?auto_2147526 ) ( ON ?auto_2147528 ?auto_2147527 ) ( ON ?auto_2147529 ?auto_2147528 ) ( not ( = ?auto_2147521 ?auto_2147522 ) ) ( not ( = ?auto_2147521 ?auto_2147523 ) ) ( not ( = ?auto_2147521 ?auto_2147525 ) ) ( not ( = ?auto_2147521 ?auto_2147524 ) ) ( not ( = ?auto_2147521 ?auto_2147526 ) ) ( not ( = ?auto_2147521 ?auto_2147527 ) ) ( not ( = ?auto_2147521 ?auto_2147528 ) ) ( not ( = ?auto_2147521 ?auto_2147529 ) ) ( not ( = ?auto_2147521 ?auto_2147530 ) ) ( not ( = ?auto_2147521 ?auto_2147531 ) ) ( not ( = ?auto_2147521 ?auto_2147535 ) ) ( not ( = ?auto_2147522 ?auto_2147523 ) ) ( not ( = ?auto_2147522 ?auto_2147525 ) ) ( not ( = ?auto_2147522 ?auto_2147524 ) ) ( not ( = ?auto_2147522 ?auto_2147526 ) ) ( not ( = ?auto_2147522 ?auto_2147527 ) ) ( not ( = ?auto_2147522 ?auto_2147528 ) ) ( not ( = ?auto_2147522 ?auto_2147529 ) ) ( not ( = ?auto_2147522 ?auto_2147530 ) ) ( not ( = ?auto_2147522 ?auto_2147531 ) ) ( not ( = ?auto_2147522 ?auto_2147535 ) ) ( not ( = ?auto_2147523 ?auto_2147525 ) ) ( not ( = ?auto_2147523 ?auto_2147524 ) ) ( not ( = ?auto_2147523 ?auto_2147526 ) ) ( not ( = ?auto_2147523 ?auto_2147527 ) ) ( not ( = ?auto_2147523 ?auto_2147528 ) ) ( not ( = ?auto_2147523 ?auto_2147529 ) ) ( not ( = ?auto_2147523 ?auto_2147530 ) ) ( not ( = ?auto_2147523 ?auto_2147531 ) ) ( not ( = ?auto_2147523 ?auto_2147535 ) ) ( not ( = ?auto_2147525 ?auto_2147524 ) ) ( not ( = ?auto_2147525 ?auto_2147526 ) ) ( not ( = ?auto_2147525 ?auto_2147527 ) ) ( not ( = ?auto_2147525 ?auto_2147528 ) ) ( not ( = ?auto_2147525 ?auto_2147529 ) ) ( not ( = ?auto_2147525 ?auto_2147530 ) ) ( not ( = ?auto_2147525 ?auto_2147531 ) ) ( not ( = ?auto_2147525 ?auto_2147535 ) ) ( not ( = ?auto_2147524 ?auto_2147526 ) ) ( not ( = ?auto_2147524 ?auto_2147527 ) ) ( not ( = ?auto_2147524 ?auto_2147528 ) ) ( not ( = ?auto_2147524 ?auto_2147529 ) ) ( not ( = ?auto_2147524 ?auto_2147530 ) ) ( not ( = ?auto_2147524 ?auto_2147531 ) ) ( not ( = ?auto_2147524 ?auto_2147535 ) ) ( not ( = ?auto_2147526 ?auto_2147527 ) ) ( not ( = ?auto_2147526 ?auto_2147528 ) ) ( not ( = ?auto_2147526 ?auto_2147529 ) ) ( not ( = ?auto_2147526 ?auto_2147530 ) ) ( not ( = ?auto_2147526 ?auto_2147531 ) ) ( not ( = ?auto_2147526 ?auto_2147535 ) ) ( not ( = ?auto_2147527 ?auto_2147528 ) ) ( not ( = ?auto_2147527 ?auto_2147529 ) ) ( not ( = ?auto_2147527 ?auto_2147530 ) ) ( not ( = ?auto_2147527 ?auto_2147531 ) ) ( not ( = ?auto_2147527 ?auto_2147535 ) ) ( not ( = ?auto_2147528 ?auto_2147529 ) ) ( not ( = ?auto_2147528 ?auto_2147530 ) ) ( not ( = ?auto_2147528 ?auto_2147531 ) ) ( not ( = ?auto_2147528 ?auto_2147535 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2147529 ?auto_2147530 ?auto_2147531 )
      ( MAKE-10CRATE-VERIFY ?auto_2147521 ?auto_2147522 ?auto_2147523 ?auto_2147525 ?auto_2147524 ?auto_2147526 ?auto_2147527 ?auto_2147528 ?auto_2147529 ?auto_2147530 ?auto_2147531 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2147647 - SURFACE
      ?auto_2147648 - SURFACE
      ?auto_2147649 - SURFACE
      ?auto_2147651 - SURFACE
      ?auto_2147650 - SURFACE
      ?auto_2147652 - SURFACE
      ?auto_2147653 - SURFACE
      ?auto_2147654 - SURFACE
      ?auto_2147655 - SURFACE
      ?auto_2147656 - SURFACE
      ?auto_2147657 - SURFACE
    )
    :vars
    (
      ?auto_2147659 - HOIST
      ?auto_2147662 - PLACE
      ?auto_2147663 - PLACE
      ?auto_2147660 - HOIST
      ?auto_2147658 - SURFACE
      ?auto_2147661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2147659 ?auto_2147662 ) ( IS-CRATE ?auto_2147657 ) ( not ( = ?auto_2147656 ?auto_2147657 ) ) ( not ( = ?auto_2147655 ?auto_2147656 ) ) ( not ( = ?auto_2147655 ?auto_2147657 ) ) ( not ( = ?auto_2147663 ?auto_2147662 ) ) ( HOIST-AT ?auto_2147660 ?auto_2147663 ) ( not ( = ?auto_2147659 ?auto_2147660 ) ) ( AVAILABLE ?auto_2147660 ) ( SURFACE-AT ?auto_2147657 ?auto_2147663 ) ( ON ?auto_2147657 ?auto_2147658 ) ( CLEAR ?auto_2147657 ) ( not ( = ?auto_2147656 ?auto_2147658 ) ) ( not ( = ?auto_2147657 ?auto_2147658 ) ) ( not ( = ?auto_2147655 ?auto_2147658 ) ) ( TRUCK-AT ?auto_2147661 ?auto_2147662 ) ( SURFACE-AT ?auto_2147655 ?auto_2147662 ) ( CLEAR ?auto_2147655 ) ( IS-CRATE ?auto_2147656 ) ( AVAILABLE ?auto_2147659 ) ( IN ?auto_2147656 ?auto_2147661 ) ( ON ?auto_2147648 ?auto_2147647 ) ( ON ?auto_2147649 ?auto_2147648 ) ( ON ?auto_2147651 ?auto_2147649 ) ( ON ?auto_2147650 ?auto_2147651 ) ( ON ?auto_2147652 ?auto_2147650 ) ( ON ?auto_2147653 ?auto_2147652 ) ( ON ?auto_2147654 ?auto_2147653 ) ( ON ?auto_2147655 ?auto_2147654 ) ( not ( = ?auto_2147647 ?auto_2147648 ) ) ( not ( = ?auto_2147647 ?auto_2147649 ) ) ( not ( = ?auto_2147647 ?auto_2147651 ) ) ( not ( = ?auto_2147647 ?auto_2147650 ) ) ( not ( = ?auto_2147647 ?auto_2147652 ) ) ( not ( = ?auto_2147647 ?auto_2147653 ) ) ( not ( = ?auto_2147647 ?auto_2147654 ) ) ( not ( = ?auto_2147647 ?auto_2147655 ) ) ( not ( = ?auto_2147647 ?auto_2147656 ) ) ( not ( = ?auto_2147647 ?auto_2147657 ) ) ( not ( = ?auto_2147647 ?auto_2147658 ) ) ( not ( = ?auto_2147648 ?auto_2147649 ) ) ( not ( = ?auto_2147648 ?auto_2147651 ) ) ( not ( = ?auto_2147648 ?auto_2147650 ) ) ( not ( = ?auto_2147648 ?auto_2147652 ) ) ( not ( = ?auto_2147648 ?auto_2147653 ) ) ( not ( = ?auto_2147648 ?auto_2147654 ) ) ( not ( = ?auto_2147648 ?auto_2147655 ) ) ( not ( = ?auto_2147648 ?auto_2147656 ) ) ( not ( = ?auto_2147648 ?auto_2147657 ) ) ( not ( = ?auto_2147648 ?auto_2147658 ) ) ( not ( = ?auto_2147649 ?auto_2147651 ) ) ( not ( = ?auto_2147649 ?auto_2147650 ) ) ( not ( = ?auto_2147649 ?auto_2147652 ) ) ( not ( = ?auto_2147649 ?auto_2147653 ) ) ( not ( = ?auto_2147649 ?auto_2147654 ) ) ( not ( = ?auto_2147649 ?auto_2147655 ) ) ( not ( = ?auto_2147649 ?auto_2147656 ) ) ( not ( = ?auto_2147649 ?auto_2147657 ) ) ( not ( = ?auto_2147649 ?auto_2147658 ) ) ( not ( = ?auto_2147651 ?auto_2147650 ) ) ( not ( = ?auto_2147651 ?auto_2147652 ) ) ( not ( = ?auto_2147651 ?auto_2147653 ) ) ( not ( = ?auto_2147651 ?auto_2147654 ) ) ( not ( = ?auto_2147651 ?auto_2147655 ) ) ( not ( = ?auto_2147651 ?auto_2147656 ) ) ( not ( = ?auto_2147651 ?auto_2147657 ) ) ( not ( = ?auto_2147651 ?auto_2147658 ) ) ( not ( = ?auto_2147650 ?auto_2147652 ) ) ( not ( = ?auto_2147650 ?auto_2147653 ) ) ( not ( = ?auto_2147650 ?auto_2147654 ) ) ( not ( = ?auto_2147650 ?auto_2147655 ) ) ( not ( = ?auto_2147650 ?auto_2147656 ) ) ( not ( = ?auto_2147650 ?auto_2147657 ) ) ( not ( = ?auto_2147650 ?auto_2147658 ) ) ( not ( = ?auto_2147652 ?auto_2147653 ) ) ( not ( = ?auto_2147652 ?auto_2147654 ) ) ( not ( = ?auto_2147652 ?auto_2147655 ) ) ( not ( = ?auto_2147652 ?auto_2147656 ) ) ( not ( = ?auto_2147652 ?auto_2147657 ) ) ( not ( = ?auto_2147652 ?auto_2147658 ) ) ( not ( = ?auto_2147653 ?auto_2147654 ) ) ( not ( = ?auto_2147653 ?auto_2147655 ) ) ( not ( = ?auto_2147653 ?auto_2147656 ) ) ( not ( = ?auto_2147653 ?auto_2147657 ) ) ( not ( = ?auto_2147653 ?auto_2147658 ) ) ( not ( = ?auto_2147654 ?auto_2147655 ) ) ( not ( = ?auto_2147654 ?auto_2147656 ) ) ( not ( = ?auto_2147654 ?auto_2147657 ) ) ( not ( = ?auto_2147654 ?auto_2147658 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2147655 ?auto_2147656 ?auto_2147657 )
      ( MAKE-10CRATE-VERIFY ?auto_2147647 ?auto_2147648 ?auto_2147649 ?auto_2147651 ?auto_2147650 ?auto_2147652 ?auto_2147653 ?auto_2147654 ?auto_2147655 ?auto_2147656 ?auto_2147657 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2154908 - SURFACE
      ?auto_2154909 - SURFACE
      ?auto_2154910 - SURFACE
      ?auto_2154912 - SURFACE
      ?auto_2154911 - SURFACE
      ?auto_2154913 - SURFACE
      ?auto_2154914 - SURFACE
      ?auto_2154915 - SURFACE
      ?auto_2154916 - SURFACE
      ?auto_2154917 - SURFACE
      ?auto_2154918 - SURFACE
      ?auto_2154919 - SURFACE
    )
    :vars
    (
      ?auto_2154920 - HOIST
      ?auto_2154921 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2154920 ?auto_2154921 ) ( SURFACE-AT ?auto_2154918 ?auto_2154921 ) ( CLEAR ?auto_2154918 ) ( LIFTING ?auto_2154920 ?auto_2154919 ) ( IS-CRATE ?auto_2154919 ) ( not ( = ?auto_2154918 ?auto_2154919 ) ) ( ON ?auto_2154909 ?auto_2154908 ) ( ON ?auto_2154910 ?auto_2154909 ) ( ON ?auto_2154912 ?auto_2154910 ) ( ON ?auto_2154911 ?auto_2154912 ) ( ON ?auto_2154913 ?auto_2154911 ) ( ON ?auto_2154914 ?auto_2154913 ) ( ON ?auto_2154915 ?auto_2154914 ) ( ON ?auto_2154916 ?auto_2154915 ) ( ON ?auto_2154917 ?auto_2154916 ) ( ON ?auto_2154918 ?auto_2154917 ) ( not ( = ?auto_2154908 ?auto_2154909 ) ) ( not ( = ?auto_2154908 ?auto_2154910 ) ) ( not ( = ?auto_2154908 ?auto_2154912 ) ) ( not ( = ?auto_2154908 ?auto_2154911 ) ) ( not ( = ?auto_2154908 ?auto_2154913 ) ) ( not ( = ?auto_2154908 ?auto_2154914 ) ) ( not ( = ?auto_2154908 ?auto_2154915 ) ) ( not ( = ?auto_2154908 ?auto_2154916 ) ) ( not ( = ?auto_2154908 ?auto_2154917 ) ) ( not ( = ?auto_2154908 ?auto_2154918 ) ) ( not ( = ?auto_2154908 ?auto_2154919 ) ) ( not ( = ?auto_2154909 ?auto_2154910 ) ) ( not ( = ?auto_2154909 ?auto_2154912 ) ) ( not ( = ?auto_2154909 ?auto_2154911 ) ) ( not ( = ?auto_2154909 ?auto_2154913 ) ) ( not ( = ?auto_2154909 ?auto_2154914 ) ) ( not ( = ?auto_2154909 ?auto_2154915 ) ) ( not ( = ?auto_2154909 ?auto_2154916 ) ) ( not ( = ?auto_2154909 ?auto_2154917 ) ) ( not ( = ?auto_2154909 ?auto_2154918 ) ) ( not ( = ?auto_2154909 ?auto_2154919 ) ) ( not ( = ?auto_2154910 ?auto_2154912 ) ) ( not ( = ?auto_2154910 ?auto_2154911 ) ) ( not ( = ?auto_2154910 ?auto_2154913 ) ) ( not ( = ?auto_2154910 ?auto_2154914 ) ) ( not ( = ?auto_2154910 ?auto_2154915 ) ) ( not ( = ?auto_2154910 ?auto_2154916 ) ) ( not ( = ?auto_2154910 ?auto_2154917 ) ) ( not ( = ?auto_2154910 ?auto_2154918 ) ) ( not ( = ?auto_2154910 ?auto_2154919 ) ) ( not ( = ?auto_2154912 ?auto_2154911 ) ) ( not ( = ?auto_2154912 ?auto_2154913 ) ) ( not ( = ?auto_2154912 ?auto_2154914 ) ) ( not ( = ?auto_2154912 ?auto_2154915 ) ) ( not ( = ?auto_2154912 ?auto_2154916 ) ) ( not ( = ?auto_2154912 ?auto_2154917 ) ) ( not ( = ?auto_2154912 ?auto_2154918 ) ) ( not ( = ?auto_2154912 ?auto_2154919 ) ) ( not ( = ?auto_2154911 ?auto_2154913 ) ) ( not ( = ?auto_2154911 ?auto_2154914 ) ) ( not ( = ?auto_2154911 ?auto_2154915 ) ) ( not ( = ?auto_2154911 ?auto_2154916 ) ) ( not ( = ?auto_2154911 ?auto_2154917 ) ) ( not ( = ?auto_2154911 ?auto_2154918 ) ) ( not ( = ?auto_2154911 ?auto_2154919 ) ) ( not ( = ?auto_2154913 ?auto_2154914 ) ) ( not ( = ?auto_2154913 ?auto_2154915 ) ) ( not ( = ?auto_2154913 ?auto_2154916 ) ) ( not ( = ?auto_2154913 ?auto_2154917 ) ) ( not ( = ?auto_2154913 ?auto_2154918 ) ) ( not ( = ?auto_2154913 ?auto_2154919 ) ) ( not ( = ?auto_2154914 ?auto_2154915 ) ) ( not ( = ?auto_2154914 ?auto_2154916 ) ) ( not ( = ?auto_2154914 ?auto_2154917 ) ) ( not ( = ?auto_2154914 ?auto_2154918 ) ) ( not ( = ?auto_2154914 ?auto_2154919 ) ) ( not ( = ?auto_2154915 ?auto_2154916 ) ) ( not ( = ?auto_2154915 ?auto_2154917 ) ) ( not ( = ?auto_2154915 ?auto_2154918 ) ) ( not ( = ?auto_2154915 ?auto_2154919 ) ) ( not ( = ?auto_2154916 ?auto_2154917 ) ) ( not ( = ?auto_2154916 ?auto_2154918 ) ) ( not ( = ?auto_2154916 ?auto_2154919 ) ) ( not ( = ?auto_2154917 ?auto_2154918 ) ) ( not ( = ?auto_2154917 ?auto_2154919 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2154918 ?auto_2154919 )
      ( MAKE-11CRATE-VERIFY ?auto_2154908 ?auto_2154909 ?auto_2154910 ?auto_2154912 ?auto_2154911 ?auto_2154913 ?auto_2154914 ?auto_2154915 ?auto_2154916 ?auto_2154917 ?auto_2154918 ?auto_2154919 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2155017 - SURFACE
      ?auto_2155018 - SURFACE
      ?auto_2155019 - SURFACE
      ?auto_2155021 - SURFACE
      ?auto_2155020 - SURFACE
      ?auto_2155022 - SURFACE
      ?auto_2155023 - SURFACE
      ?auto_2155024 - SURFACE
      ?auto_2155025 - SURFACE
      ?auto_2155026 - SURFACE
      ?auto_2155027 - SURFACE
      ?auto_2155028 - SURFACE
    )
    :vars
    (
      ?auto_2155031 - HOIST
      ?auto_2155030 - PLACE
      ?auto_2155029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2155031 ?auto_2155030 ) ( SURFACE-AT ?auto_2155027 ?auto_2155030 ) ( CLEAR ?auto_2155027 ) ( IS-CRATE ?auto_2155028 ) ( not ( = ?auto_2155027 ?auto_2155028 ) ) ( TRUCK-AT ?auto_2155029 ?auto_2155030 ) ( AVAILABLE ?auto_2155031 ) ( IN ?auto_2155028 ?auto_2155029 ) ( ON ?auto_2155027 ?auto_2155026 ) ( not ( = ?auto_2155026 ?auto_2155027 ) ) ( not ( = ?auto_2155026 ?auto_2155028 ) ) ( ON ?auto_2155018 ?auto_2155017 ) ( ON ?auto_2155019 ?auto_2155018 ) ( ON ?auto_2155021 ?auto_2155019 ) ( ON ?auto_2155020 ?auto_2155021 ) ( ON ?auto_2155022 ?auto_2155020 ) ( ON ?auto_2155023 ?auto_2155022 ) ( ON ?auto_2155024 ?auto_2155023 ) ( ON ?auto_2155025 ?auto_2155024 ) ( ON ?auto_2155026 ?auto_2155025 ) ( not ( = ?auto_2155017 ?auto_2155018 ) ) ( not ( = ?auto_2155017 ?auto_2155019 ) ) ( not ( = ?auto_2155017 ?auto_2155021 ) ) ( not ( = ?auto_2155017 ?auto_2155020 ) ) ( not ( = ?auto_2155017 ?auto_2155022 ) ) ( not ( = ?auto_2155017 ?auto_2155023 ) ) ( not ( = ?auto_2155017 ?auto_2155024 ) ) ( not ( = ?auto_2155017 ?auto_2155025 ) ) ( not ( = ?auto_2155017 ?auto_2155026 ) ) ( not ( = ?auto_2155017 ?auto_2155027 ) ) ( not ( = ?auto_2155017 ?auto_2155028 ) ) ( not ( = ?auto_2155018 ?auto_2155019 ) ) ( not ( = ?auto_2155018 ?auto_2155021 ) ) ( not ( = ?auto_2155018 ?auto_2155020 ) ) ( not ( = ?auto_2155018 ?auto_2155022 ) ) ( not ( = ?auto_2155018 ?auto_2155023 ) ) ( not ( = ?auto_2155018 ?auto_2155024 ) ) ( not ( = ?auto_2155018 ?auto_2155025 ) ) ( not ( = ?auto_2155018 ?auto_2155026 ) ) ( not ( = ?auto_2155018 ?auto_2155027 ) ) ( not ( = ?auto_2155018 ?auto_2155028 ) ) ( not ( = ?auto_2155019 ?auto_2155021 ) ) ( not ( = ?auto_2155019 ?auto_2155020 ) ) ( not ( = ?auto_2155019 ?auto_2155022 ) ) ( not ( = ?auto_2155019 ?auto_2155023 ) ) ( not ( = ?auto_2155019 ?auto_2155024 ) ) ( not ( = ?auto_2155019 ?auto_2155025 ) ) ( not ( = ?auto_2155019 ?auto_2155026 ) ) ( not ( = ?auto_2155019 ?auto_2155027 ) ) ( not ( = ?auto_2155019 ?auto_2155028 ) ) ( not ( = ?auto_2155021 ?auto_2155020 ) ) ( not ( = ?auto_2155021 ?auto_2155022 ) ) ( not ( = ?auto_2155021 ?auto_2155023 ) ) ( not ( = ?auto_2155021 ?auto_2155024 ) ) ( not ( = ?auto_2155021 ?auto_2155025 ) ) ( not ( = ?auto_2155021 ?auto_2155026 ) ) ( not ( = ?auto_2155021 ?auto_2155027 ) ) ( not ( = ?auto_2155021 ?auto_2155028 ) ) ( not ( = ?auto_2155020 ?auto_2155022 ) ) ( not ( = ?auto_2155020 ?auto_2155023 ) ) ( not ( = ?auto_2155020 ?auto_2155024 ) ) ( not ( = ?auto_2155020 ?auto_2155025 ) ) ( not ( = ?auto_2155020 ?auto_2155026 ) ) ( not ( = ?auto_2155020 ?auto_2155027 ) ) ( not ( = ?auto_2155020 ?auto_2155028 ) ) ( not ( = ?auto_2155022 ?auto_2155023 ) ) ( not ( = ?auto_2155022 ?auto_2155024 ) ) ( not ( = ?auto_2155022 ?auto_2155025 ) ) ( not ( = ?auto_2155022 ?auto_2155026 ) ) ( not ( = ?auto_2155022 ?auto_2155027 ) ) ( not ( = ?auto_2155022 ?auto_2155028 ) ) ( not ( = ?auto_2155023 ?auto_2155024 ) ) ( not ( = ?auto_2155023 ?auto_2155025 ) ) ( not ( = ?auto_2155023 ?auto_2155026 ) ) ( not ( = ?auto_2155023 ?auto_2155027 ) ) ( not ( = ?auto_2155023 ?auto_2155028 ) ) ( not ( = ?auto_2155024 ?auto_2155025 ) ) ( not ( = ?auto_2155024 ?auto_2155026 ) ) ( not ( = ?auto_2155024 ?auto_2155027 ) ) ( not ( = ?auto_2155024 ?auto_2155028 ) ) ( not ( = ?auto_2155025 ?auto_2155026 ) ) ( not ( = ?auto_2155025 ?auto_2155027 ) ) ( not ( = ?auto_2155025 ?auto_2155028 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2155026 ?auto_2155027 ?auto_2155028 )
      ( MAKE-11CRATE-VERIFY ?auto_2155017 ?auto_2155018 ?auto_2155019 ?auto_2155021 ?auto_2155020 ?auto_2155022 ?auto_2155023 ?auto_2155024 ?auto_2155025 ?auto_2155026 ?auto_2155027 ?auto_2155028 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2155138 - SURFACE
      ?auto_2155139 - SURFACE
      ?auto_2155140 - SURFACE
      ?auto_2155142 - SURFACE
      ?auto_2155141 - SURFACE
      ?auto_2155143 - SURFACE
      ?auto_2155144 - SURFACE
      ?auto_2155145 - SURFACE
      ?auto_2155146 - SURFACE
      ?auto_2155147 - SURFACE
      ?auto_2155148 - SURFACE
      ?auto_2155149 - SURFACE
    )
    :vars
    (
      ?auto_2155153 - HOIST
      ?auto_2155152 - PLACE
      ?auto_2155151 - TRUCK
      ?auto_2155150 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2155153 ?auto_2155152 ) ( SURFACE-AT ?auto_2155148 ?auto_2155152 ) ( CLEAR ?auto_2155148 ) ( IS-CRATE ?auto_2155149 ) ( not ( = ?auto_2155148 ?auto_2155149 ) ) ( AVAILABLE ?auto_2155153 ) ( IN ?auto_2155149 ?auto_2155151 ) ( ON ?auto_2155148 ?auto_2155147 ) ( not ( = ?auto_2155147 ?auto_2155148 ) ) ( not ( = ?auto_2155147 ?auto_2155149 ) ) ( TRUCK-AT ?auto_2155151 ?auto_2155150 ) ( not ( = ?auto_2155150 ?auto_2155152 ) ) ( ON ?auto_2155139 ?auto_2155138 ) ( ON ?auto_2155140 ?auto_2155139 ) ( ON ?auto_2155142 ?auto_2155140 ) ( ON ?auto_2155141 ?auto_2155142 ) ( ON ?auto_2155143 ?auto_2155141 ) ( ON ?auto_2155144 ?auto_2155143 ) ( ON ?auto_2155145 ?auto_2155144 ) ( ON ?auto_2155146 ?auto_2155145 ) ( ON ?auto_2155147 ?auto_2155146 ) ( not ( = ?auto_2155138 ?auto_2155139 ) ) ( not ( = ?auto_2155138 ?auto_2155140 ) ) ( not ( = ?auto_2155138 ?auto_2155142 ) ) ( not ( = ?auto_2155138 ?auto_2155141 ) ) ( not ( = ?auto_2155138 ?auto_2155143 ) ) ( not ( = ?auto_2155138 ?auto_2155144 ) ) ( not ( = ?auto_2155138 ?auto_2155145 ) ) ( not ( = ?auto_2155138 ?auto_2155146 ) ) ( not ( = ?auto_2155138 ?auto_2155147 ) ) ( not ( = ?auto_2155138 ?auto_2155148 ) ) ( not ( = ?auto_2155138 ?auto_2155149 ) ) ( not ( = ?auto_2155139 ?auto_2155140 ) ) ( not ( = ?auto_2155139 ?auto_2155142 ) ) ( not ( = ?auto_2155139 ?auto_2155141 ) ) ( not ( = ?auto_2155139 ?auto_2155143 ) ) ( not ( = ?auto_2155139 ?auto_2155144 ) ) ( not ( = ?auto_2155139 ?auto_2155145 ) ) ( not ( = ?auto_2155139 ?auto_2155146 ) ) ( not ( = ?auto_2155139 ?auto_2155147 ) ) ( not ( = ?auto_2155139 ?auto_2155148 ) ) ( not ( = ?auto_2155139 ?auto_2155149 ) ) ( not ( = ?auto_2155140 ?auto_2155142 ) ) ( not ( = ?auto_2155140 ?auto_2155141 ) ) ( not ( = ?auto_2155140 ?auto_2155143 ) ) ( not ( = ?auto_2155140 ?auto_2155144 ) ) ( not ( = ?auto_2155140 ?auto_2155145 ) ) ( not ( = ?auto_2155140 ?auto_2155146 ) ) ( not ( = ?auto_2155140 ?auto_2155147 ) ) ( not ( = ?auto_2155140 ?auto_2155148 ) ) ( not ( = ?auto_2155140 ?auto_2155149 ) ) ( not ( = ?auto_2155142 ?auto_2155141 ) ) ( not ( = ?auto_2155142 ?auto_2155143 ) ) ( not ( = ?auto_2155142 ?auto_2155144 ) ) ( not ( = ?auto_2155142 ?auto_2155145 ) ) ( not ( = ?auto_2155142 ?auto_2155146 ) ) ( not ( = ?auto_2155142 ?auto_2155147 ) ) ( not ( = ?auto_2155142 ?auto_2155148 ) ) ( not ( = ?auto_2155142 ?auto_2155149 ) ) ( not ( = ?auto_2155141 ?auto_2155143 ) ) ( not ( = ?auto_2155141 ?auto_2155144 ) ) ( not ( = ?auto_2155141 ?auto_2155145 ) ) ( not ( = ?auto_2155141 ?auto_2155146 ) ) ( not ( = ?auto_2155141 ?auto_2155147 ) ) ( not ( = ?auto_2155141 ?auto_2155148 ) ) ( not ( = ?auto_2155141 ?auto_2155149 ) ) ( not ( = ?auto_2155143 ?auto_2155144 ) ) ( not ( = ?auto_2155143 ?auto_2155145 ) ) ( not ( = ?auto_2155143 ?auto_2155146 ) ) ( not ( = ?auto_2155143 ?auto_2155147 ) ) ( not ( = ?auto_2155143 ?auto_2155148 ) ) ( not ( = ?auto_2155143 ?auto_2155149 ) ) ( not ( = ?auto_2155144 ?auto_2155145 ) ) ( not ( = ?auto_2155144 ?auto_2155146 ) ) ( not ( = ?auto_2155144 ?auto_2155147 ) ) ( not ( = ?auto_2155144 ?auto_2155148 ) ) ( not ( = ?auto_2155144 ?auto_2155149 ) ) ( not ( = ?auto_2155145 ?auto_2155146 ) ) ( not ( = ?auto_2155145 ?auto_2155147 ) ) ( not ( = ?auto_2155145 ?auto_2155148 ) ) ( not ( = ?auto_2155145 ?auto_2155149 ) ) ( not ( = ?auto_2155146 ?auto_2155147 ) ) ( not ( = ?auto_2155146 ?auto_2155148 ) ) ( not ( = ?auto_2155146 ?auto_2155149 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2155147 ?auto_2155148 ?auto_2155149 )
      ( MAKE-11CRATE-VERIFY ?auto_2155138 ?auto_2155139 ?auto_2155140 ?auto_2155142 ?auto_2155141 ?auto_2155143 ?auto_2155144 ?auto_2155145 ?auto_2155146 ?auto_2155147 ?auto_2155148 ?auto_2155149 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2155270 - SURFACE
      ?auto_2155271 - SURFACE
      ?auto_2155272 - SURFACE
      ?auto_2155274 - SURFACE
      ?auto_2155273 - SURFACE
      ?auto_2155275 - SURFACE
      ?auto_2155276 - SURFACE
      ?auto_2155277 - SURFACE
      ?auto_2155278 - SURFACE
      ?auto_2155279 - SURFACE
      ?auto_2155280 - SURFACE
      ?auto_2155281 - SURFACE
    )
    :vars
    (
      ?auto_2155285 - HOIST
      ?auto_2155283 - PLACE
      ?auto_2155286 - TRUCK
      ?auto_2155282 - PLACE
      ?auto_2155284 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2155285 ?auto_2155283 ) ( SURFACE-AT ?auto_2155280 ?auto_2155283 ) ( CLEAR ?auto_2155280 ) ( IS-CRATE ?auto_2155281 ) ( not ( = ?auto_2155280 ?auto_2155281 ) ) ( AVAILABLE ?auto_2155285 ) ( ON ?auto_2155280 ?auto_2155279 ) ( not ( = ?auto_2155279 ?auto_2155280 ) ) ( not ( = ?auto_2155279 ?auto_2155281 ) ) ( TRUCK-AT ?auto_2155286 ?auto_2155282 ) ( not ( = ?auto_2155282 ?auto_2155283 ) ) ( HOIST-AT ?auto_2155284 ?auto_2155282 ) ( LIFTING ?auto_2155284 ?auto_2155281 ) ( not ( = ?auto_2155285 ?auto_2155284 ) ) ( ON ?auto_2155271 ?auto_2155270 ) ( ON ?auto_2155272 ?auto_2155271 ) ( ON ?auto_2155274 ?auto_2155272 ) ( ON ?auto_2155273 ?auto_2155274 ) ( ON ?auto_2155275 ?auto_2155273 ) ( ON ?auto_2155276 ?auto_2155275 ) ( ON ?auto_2155277 ?auto_2155276 ) ( ON ?auto_2155278 ?auto_2155277 ) ( ON ?auto_2155279 ?auto_2155278 ) ( not ( = ?auto_2155270 ?auto_2155271 ) ) ( not ( = ?auto_2155270 ?auto_2155272 ) ) ( not ( = ?auto_2155270 ?auto_2155274 ) ) ( not ( = ?auto_2155270 ?auto_2155273 ) ) ( not ( = ?auto_2155270 ?auto_2155275 ) ) ( not ( = ?auto_2155270 ?auto_2155276 ) ) ( not ( = ?auto_2155270 ?auto_2155277 ) ) ( not ( = ?auto_2155270 ?auto_2155278 ) ) ( not ( = ?auto_2155270 ?auto_2155279 ) ) ( not ( = ?auto_2155270 ?auto_2155280 ) ) ( not ( = ?auto_2155270 ?auto_2155281 ) ) ( not ( = ?auto_2155271 ?auto_2155272 ) ) ( not ( = ?auto_2155271 ?auto_2155274 ) ) ( not ( = ?auto_2155271 ?auto_2155273 ) ) ( not ( = ?auto_2155271 ?auto_2155275 ) ) ( not ( = ?auto_2155271 ?auto_2155276 ) ) ( not ( = ?auto_2155271 ?auto_2155277 ) ) ( not ( = ?auto_2155271 ?auto_2155278 ) ) ( not ( = ?auto_2155271 ?auto_2155279 ) ) ( not ( = ?auto_2155271 ?auto_2155280 ) ) ( not ( = ?auto_2155271 ?auto_2155281 ) ) ( not ( = ?auto_2155272 ?auto_2155274 ) ) ( not ( = ?auto_2155272 ?auto_2155273 ) ) ( not ( = ?auto_2155272 ?auto_2155275 ) ) ( not ( = ?auto_2155272 ?auto_2155276 ) ) ( not ( = ?auto_2155272 ?auto_2155277 ) ) ( not ( = ?auto_2155272 ?auto_2155278 ) ) ( not ( = ?auto_2155272 ?auto_2155279 ) ) ( not ( = ?auto_2155272 ?auto_2155280 ) ) ( not ( = ?auto_2155272 ?auto_2155281 ) ) ( not ( = ?auto_2155274 ?auto_2155273 ) ) ( not ( = ?auto_2155274 ?auto_2155275 ) ) ( not ( = ?auto_2155274 ?auto_2155276 ) ) ( not ( = ?auto_2155274 ?auto_2155277 ) ) ( not ( = ?auto_2155274 ?auto_2155278 ) ) ( not ( = ?auto_2155274 ?auto_2155279 ) ) ( not ( = ?auto_2155274 ?auto_2155280 ) ) ( not ( = ?auto_2155274 ?auto_2155281 ) ) ( not ( = ?auto_2155273 ?auto_2155275 ) ) ( not ( = ?auto_2155273 ?auto_2155276 ) ) ( not ( = ?auto_2155273 ?auto_2155277 ) ) ( not ( = ?auto_2155273 ?auto_2155278 ) ) ( not ( = ?auto_2155273 ?auto_2155279 ) ) ( not ( = ?auto_2155273 ?auto_2155280 ) ) ( not ( = ?auto_2155273 ?auto_2155281 ) ) ( not ( = ?auto_2155275 ?auto_2155276 ) ) ( not ( = ?auto_2155275 ?auto_2155277 ) ) ( not ( = ?auto_2155275 ?auto_2155278 ) ) ( not ( = ?auto_2155275 ?auto_2155279 ) ) ( not ( = ?auto_2155275 ?auto_2155280 ) ) ( not ( = ?auto_2155275 ?auto_2155281 ) ) ( not ( = ?auto_2155276 ?auto_2155277 ) ) ( not ( = ?auto_2155276 ?auto_2155278 ) ) ( not ( = ?auto_2155276 ?auto_2155279 ) ) ( not ( = ?auto_2155276 ?auto_2155280 ) ) ( not ( = ?auto_2155276 ?auto_2155281 ) ) ( not ( = ?auto_2155277 ?auto_2155278 ) ) ( not ( = ?auto_2155277 ?auto_2155279 ) ) ( not ( = ?auto_2155277 ?auto_2155280 ) ) ( not ( = ?auto_2155277 ?auto_2155281 ) ) ( not ( = ?auto_2155278 ?auto_2155279 ) ) ( not ( = ?auto_2155278 ?auto_2155280 ) ) ( not ( = ?auto_2155278 ?auto_2155281 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2155279 ?auto_2155280 ?auto_2155281 )
      ( MAKE-11CRATE-VERIFY ?auto_2155270 ?auto_2155271 ?auto_2155272 ?auto_2155274 ?auto_2155273 ?auto_2155275 ?auto_2155276 ?auto_2155277 ?auto_2155278 ?auto_2155279 ?auto_2155280 ?auto_2155281 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2155413 - SURFACE
      ?auto_2155414 - SURFACE
      ?auto_2155415 - SURFACE
      ?auto_2155417 - SURFACE
      ?auto_2155416 - SURFACE
      ?auto_2155418 - SURFACE
      ?auto_2155419 - SURFACE
      ?auto_2155420 - SURFACE
      ?auto_2155421 - SURFACE
      ?auto_2155422 - SURFACE
      ?auto_2155423 - SURFACE
      ?auto_2155424 - SURFACE
    )
    :vars
    (
      ?auto_2155430 - HOIST
      ?auto_2155429 - PLACE
      ?auto_2155426 - TRUCK
      ?auto_2155425 - PLACE
      ?auto_2155427 - HOIST
      ?auto_2155428 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2155430 ?auto_2155429 ) ( SURFACE-AT ?auto_2155423 ?auto_2155429 ) ( CLEAR ?auto_2155423 ) ( IS-CRATE ?auto_2155424 ) ( not ( = ?auto_2155423 ?auto_2155424 ) ) ( AVAILABLE ?auto_2155430 ) ( ON ?auto_2155423 ?auto_2155422 ) ( not ( = ?auto_2155422 ?auto_2155423 ) ) ( not ( = ?auto_2155422 ?auto_2155424 ) ) ( TRUCK-AT ?auto_2155426 ?auto_2155425 ) ( not ( = ?auto_2155425 ?auto_2155429 ) ) ( HOIST-AT ?auto_2155427 ?auto_2155425 ) ( not ( = ?auto_2155430 ?auto_2155427 ) ) ( AVAILABLE ?auto_2155427 ) ( SURFACE-AT ?auto_2155424 ?auto_2155425 ) ( ON ?auto_2155424 ?auto_2155428 ) ( CLEAR ?auto_2155424 ) ( not ( = ?auto_2155423 ?auto_2155428 ) ) ( not ( = ?auto_2155424 ?auto_2155428 ) ) ( not ( = ?auto_2155422 ?auto_2155428 ) ) ( ON ?auto_2155414 ?auto_2155413 ) ( ON ?auto_2155415 ?auto_2155414 ) ( ON ?auto_2155417 ?auto_2155415 ) ( ON ?auto_2155416 ?auto_2155417 ) ( ON ?auto_2155418 ?auto_2155416 ) ( ON ?auto_2155419 ?auto_2155418 ) ( ON ?auto_2155420 ?auto_2155419 ) ( ON ?auto_2155421 ?auto_2155420 ) ( ON ?auto_2155422 ?auto_2155421 ) ( not ( = ?auto_2155413 ?auto_2155414 ) ) ( not ( = ?auto_2155413 ?auto_2155415 ) ) ( not ( = ?auto_2155413 ?auto_2155417 ) ) ( not ( = ?auto_2155413 ?auto_2155416 ) ) ( not ( = ?auto_2155413 ?auto_2155418 ) ) ( not ( = ?auto_2155413 ?auto_2155419 ) ) ( not ( = ?auto_2155413 ?auto_2155420 ) ) ( not ( = ?auto_2155413 ?auto_2155421 ) ) ( not ( = ?auto_2155413 ?auto_2155422 ) ) ( not ( = ?auto_2155413 ?auto_2155423 ) ) ( not ( = ?auto_2155413 ?auto_2155424 ) ) ( not ( = ?auto_2155413 ?auto_2155428 ) ) ( not ( = ?auto_2155414 ?auto_2155415 ) ) ( not ( = ?auto_2155414 ?auto_2155417 ) ) ( not ( = ?auto_2155414 ?auto_2155416 ) ) ( not ( = ?auto_2155414 ?auto_2155418 ) ) ( not ( = ?auto_2155414 ?auto_2155419 ) ) ( not ( = ?auto_2155414 ?auto_2155420 ) ) ( not ( = ?auto_2155414 ?auto_2155421 ) ) ( not ( = ?auto_2155414 ?auto_2155422 ) ) ( not ( = ?auto_2155414 ?auto_2155423 ) ) ( not ( = ?auto_2155414 ?auto_2155424 ) ) ( not ( = ?auto_2155414 ?auto_2155428 ) ) ( not ( = ?auto_2155415 ?auto_2155417 ) ) ( not ( = ?auto_2155415 ?auto_2155416 ) ) ( not ( = ?auto_2155415 ?auto_2155418 ) ) ( not ( = ?auto_2155415 ?auto_2155419 ) ) ( not ( = ?auto_2155415 ?auto_2155420 ) ) ( not ( = ?auto_2155415 ?auto_2155421 ) ) ( not ( = ?auto_2155415 ?auto_2155422 ) ) ( not ( = ?auto_2155415 ?auto_2155423 ) ) ( not ( = ?auto_2155415 ?auto_2155424 ) ) ( not ( = ?auto_2155415 ?auto_2155428 ) ) ( not ( = ?auto_2155417 ?auto_2155416 ) ) ( not ( = ?auto_2155417 ?auto_2155418 ) ) ( not ( = ?auto_2155417 ?auto_2155419 ) ) ( not ( = ?auto_2155417 ?auto_2155420 ) ) ( not ( = ?auto_2155417 ?auto_2155421 ) ) ( not ( = ?auto_2155417 ?auto_2155422 ) ) ( not ( = ?auto_2155417 ?auto_2155423 ) ) ( not ( = ?auto_2155417 ?auto_2155424 ) ) ( not ( = ?auto_2155417 ?auto_2155428 ) ) ( not ( = ?auto_2155416 ?auto_2155418 ) ) ( not ( = ?auto_2155416 ?auto_2155419 ) ) ( not ( = ?auto_2155416 ?auto_2155420 ) ) ( not ( = ?auto_2155416 ?auto_2155421 ) ) ( not ( = ?auto_2155416 ?auto_2155422 ) ) ( not ( = ?auto_2155416 ?auto_2155423 ) ) ( not ( = ?auto_2155416 ?auto_2155424 ) ) ( not ( = ?auto_2155416 ?auto_2155428 ) ) ( not ( = ?auto_2155418 ?auto_2155419 ) ) ( not ( = ?auto_2155418 ?auto_2155420 ) ) ( not ( = ?auto_2155418 ?auto_2155421 ) ) ( not ( = ?auto_2155418 ?auto_2155422 ) ) ( not ( = ?auto_2155418 ?auto_2155423 ) ) ( not ( = ?auto_2155418 ?auto_2155424 ) ) ( not ( = ?auto_2155418 ?auto_2155428 ) ) ( not ( = ?auto_2155419 ?auto_2155420 ) ) ( not ( = ?auto_2155419 ?auto_2155421 ) ) ( not ( = ?auto_2155419 ?auto_2155422 ) ) ( not ( = ?auto_2155419 ?auto_2155423 ) ) ( not ( = ?auto_2155419 ?auto_2155424 ) ) ( not ( = ?auto_2155419 ?auto_2155428 ) ) ( not ( = ?auto_2155420 ?auto_2155421 ) ) ( not ( = ?auto_2155420 ?auto_2155422 ) ) ( not ( = ?auto_2155420 ?auto_2155423 ) ) ( not ( = ?auto_2155420 ?auto_2155424 ) ) ( not ( = ?auto_2155420 ?auto_2155428 ) ) ( not ( = ?auto_2155421 ?auto_2155422 ) ) ( not ( = ?auto_2155421 ?auto_2155423 ) ) ( not ( = ?auto_2155421 ?auto_2155424 ) ) ( not ( = ?auto_2155421 ?auto_2155428 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2155422 ?auto_2155423 ?auto_2155424 )
      ( MAKE-11CRATE-VERIFY ?auto_2155413 ?auto_2155414 ?auto_2155415 ?auto_2155417 ?auto_2155416 ?auto_2155418 ?auto_2155419 ?auto_2155420 ?auto_2155421 ?auto_2155422 ?auto_2155423 ?auto_2155424 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2155557 - SURFACE
      ?auto_2155558 - SURFACE
      ?auto_2155559 - SURFACE
      ?auto_2155561 - SURFACE
      ?auto_2155560 - SURFACE
      ?auto_2155562 - SURFACE
      ?auto_2155563 - SURFACE
      ?auto_2155564 - SURFACE
      ?auto_2155565 - SURFACE
      ?auto_2155566 - SURFACE
      ?auto_2155567 - SURFACE
      ?auto_2155568 - SURFACE
    )
    :vars
    (
      ?auto_2155571 - HOIST
      ?auto_2155573 - PLACE
      ?auto_2155570 - PLACE
      ?auto_2155572 - HOIST
      ?auto_2155569 - SURFACE
      ?auto_2155574 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2155571 ?auto_2155573 ) ( SURFACE-AT ?auto_2155567 ?auto_2155573 ) ( CLEAR ?auto_2155567 ) ( IS-CRATE ?auto_2155568 ) ( not ( = ?auto_2155567 ?auto_2155568 ) ) ( AVAILABLE ?auto_2155571 ) ( ON ?auto_2155567 ?auto_2155566 ) ( not ( = ?auto_2155566 ?auto_2155567 ) ) ( not ( = ?auto_2155566 ?auto_2155568 ) ) ( not ( = ?auto_2155570 ?auto_2155573 ) ) ( HOIST-AT ?auto_2155572 ?auto_2155570 ) ( not ( = ?auto_2155571 ?auto_2155572 ) ) ( AVAILABLE ?auto_2155572 ) ( SURFACE-AT ?auto_2155568 ?auto_2155570 ) ( ON ?auto_2155568 ?auto_2155569 ) ( CLEAR ?auto_2155568 ) ( not ( = ?auto_2155567 ?auto_2155569 ) ) ( not ( = ?auto_2155568 ?auto_2155569 ) ) ( not ( = ?auto_2155566 ?auto_2155569 ) ) ( TRUCK-AT ?auto_2155574 ?auto_2155573 ) ( ON ?auto_2155558 ?auto_2155557 ) ( ON ?auto_2155559 ?auto_2155558 ) ( ON ?auto_2155561 ?auto_2155559 ) ( ON ?auto_2155560 ?auto_2155561 ) ( ON ?auto_2155562 ?auto_2155560 ) ( ON ?auto_2155563 ?auto_2155562 ) ( ON ?auto_2155564 ?auto_2155563 ) ( ON ?auto_2155565 ?auto_2155564 ) ( ON ?auto_2155566 ?auto_2155565 ) ( not ( = ?auto_2155557 ?auto_2155558 ) ) ( not ( = ?auto_2155557 ?auto_2155559 ) ) ( not ( = ?auto_2155557 ?auto_2155561 ) ) ( not ( = ?auto_2155557 ?auto_2155560 ) ) ( not ( = ?auto_2155557 ?auto_2155562 ) ) ( not ( = ?auto_2155557 ?auto_2155563 ) ) ( not ( = ?auto_2155557 ?auto_2155564 ) ) ( not ( = ?auto_2155557 ?auto_2155565 ) ) ( not ( = ?auto_2155557 ?auto_2155566 ) ) ( not ( = ?auto_2155557 ?auto_2155567 ) ) ( not ( = ?auto_2155557 ?auto_2155568 ) ) ( not ( = ?auto_2155557 ?auto_2155569 ) ) ( not ( = ?auto_2155558 ?auto_2155559 ) ) ( not ( = ?auto_2155558 ?auto_2155561 ) ) ( not ( = ?auto_2155558 ?auto_2155560 ) ) ( not ( = ?auto_2155558 ?auto_2155562 ) ) ( not ( = ?auto_2155558 ?auto_2155563 ) ) ( not ( = ?auto_2155558 ?auto_2155564 ) ) ( not ( = ?auto_2155558 ?auto_2155565 ) ) ( not ( = ?auto_2155558 ?auto_2155566 ) ) ( not ( = ?auto_2155558 ?auto_2155567 ) ) ( not ( = ?auto_2155558 ?auto_2155568 ) ) ( not ( = ?auto_2155558 ?auto_2155569 ) ) ( not ( = ?auto_2155559 ?auto_2155561 ) ) ( not ( = ?auto_2155559 ?auto_2155560 ) ) ( not ( = ?auto_2155559 ?auto_2155562 ) ) ( not ( = ?auto_2155559 ?auto_2155563 ) ) ( not ( = ?auto_2155559 ?auto_2155564 ) ) ( not ( = ?auto_2155559 ?auto_2155565 ) ) ( not ( = ?auto_2155559 ?auto_2155566 ) ) ( not ( = ?auto_2155559 ?auto_2155567 ) ) ( not ( = ?auto_2155559 ?auto_2155568 ) ) ( not ( = ?auto_2155559 ?auto_2155569 ) ) ( not ( = ?auto_2155561 ?auto_2155560 ) ) ( not ( = ?auto_2155561 ?auto_2155562 ) ) ( not ( = ?auto_2155561 ?auto_2155563 ) ) ( not ( = ?auto_2155561 ?auto_2155564 ) ) ( not ( = ?auto_2155561 ?auto_2155565 ) ) ( not ( = ?auto_2155561 ?auto_2155566 ) ) ( not ( = ?auto_2155561 ?auto_2155567 ) ) ( not ( = ?auto_2155561 ?auto_2155568 ) ) ( not ( = ?auto_2155561 ?auto_2155569 ) ) ( not ( = ?auto_2155560 ?auto_2155562 ) ) ( not ( = ?auto_2155560 ?auto_2155563 ) ) ( not ( = ?auto_2155560 ?auto_2155564 ) ) ( not ( = ?auto_2155560 ?auto_2155565 ) ) ( not ( = ?auto_2155560 ?auto_2155566 ) ) ( not ( = ?auto_2155560 ?auto_2155567 ) ) ( not ( = ?auto_2155560 ?auto_2155568 ) ) ( not ( = ?auto_2155560 ?auto_2155569 ) ) ( not ( = ?auto_2155562 ?auto_2155563 ) ) ( not ( = ?auto_2155562 ?auto_2155564 ) ) ( not ( = ?auto_2155562 ?auto_2155565 ) ) ( not ( = ?auto_2155562 ?auto_2155566 ) ) ( not ( = ?auto_2155562 ?auto_2155567 ) ) ( not ( = ?auto_2155562 ?auto_2155568 ) ) ( not ( = ?auto_2155562 ?auto_2155569 ) ) ( not ( = ?auto_2155563 ?auto_2155564 ) ) ( not ( = ?auto_2155563 ?auto_2155565 ) ) ( not ( = ?auto_2155563 ?auto_2155566 ) ) ( not ( = ?auto_2155563 ?auto_2155567 ) ) ( not ( = ?auto_2155563 ?auto_2155568 ) ) ( not ( = ?auto_2155563 ?auto_2155569 ) ) ( not ( = ?auto_2155564 ?auto_2155565 ) ) ( not ( = ?auto_2155564 ?auto_2155566 ) ) ( not ( = ?auto_2155564 ?auto_2155567 ) ) ( not ( = ?auto_2155564 ?auto_2155568 ) ) ( not ( = ?auto_2155564 ?auto_2155569 ) ) ( not ( = ?auto_2155565 ?auto_2155566 ) ) ( not ( = ?auto_2155565 ?auto_2155567 ) ) ( not ( = ?auto_2155565 ?auto_2155568 ) ) ( not ( = ?auto_2155565 ?auto_2155569 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2155566 ?auto_2155567 ?auto_2155568 )
      ( MAKE-11CRATE-VERIFY ?auto_2155557 ?auto_2155558 ?auto_2155559 ?auto_2155561 ?auto_2155560 ?auto_2155562 ?auto_2155563 ?auto_2155564 ?auto_2155565 ?auto_2155566 ?auto_2155567 ?auto_2155568 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2155701 - SURFACE
      ?auto_2155702 - SURFACE
      ?auto_2155703 - SURFACE
      ?auto_2155705 - SURFACE
      ?auto_2155704 - SURFACE
      ?auto_2155706 - SURFACE
      ?auto_2155707 - SURFACE
      ?auto_2155708 - SURFACE
      ?auto_2155709 - SURFACE
      ?auto_2155710 - SURFACE
      ?auto_2155711 - SURFACE
      ?auto_2155712 - SURFACE
    )
    :vars
    (
      ?auto_2155714 - HOIST
      ?auto_2155717 - PLACE
      ?auto_2155715 - PLACE
      ?auto_2155713 - HOIST
      ?auto_2155718 - SURFACE
      ?auto_2155716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2155714 ?auto_2155717 ) ( IS-CRATE ?auto_2155712 ) ( not ( = ?auto_2155711 ?auto_2155712 ) ) ( not ( = ?auto_2155710 ?auto_2155711 ) ) ( not ( = ?auto_2155710 ?auto_2155712 ) ) ( not ( = ?auto_2155715 ?auto_2155717 ) ) ( HOIST-AT ?auto_2155713 ?auto_2155715 ) ( not ( = ?auto_2155714 ?auto_2155713 ) ) ( AVAILABLE ?auto_2155713 ) ( SURFACE-AT ?auto_2155712 ?auto_2155715 ) ( ON ?auto_2155712 ?auto_2155718 ) ( CLEAR ?auto_2155712 ) ( not ( = ?auto_2155711 ?auto_2155718 ) ) ( not ( = ?auto_2155712 ?auto_2155718 ) ) ( not ( = ?auto_2155710 ?auto_2155718 ) ) ( TRUCK-AT ?auto_2155716 ?auto_2155717 ) ( SURFACE-AT ?auto_2155710 ?auto_2155717 ) ( CLEAR ?auto_2155710 ) ( LIFTING ?auto_2155714 ?auto_2155711 ) ( IS-CRATE ?auto_2155711 ) ( ON ?auto_2155702 ?auto_2155701 ) ( ON ?auto_2155703 ?auto_2155702 ) ( ON ?auto_2155705 ?auto_2155703 ) ( ON ?auto_2155704 ?auto_2155705 ) ( ON ?auto_2155706 ?auto_2155704 ) ( ON ?auto_2155707 ?auto_2155706 ) ( ON ?auto_2155708 ?auto_2155707 ) ( ON ?auto_2155709 ?auto_2155708 ) ( ON ?auto_2155710 ?auto_2155709 ) ( not ( = ?auto_2155701 ?auto_2155702 ) ) ( not ( = ?auto_2155701 ?auto_2155703 ) ) ( not ( = ?auto_2155701 ?auto_2155705 ) ) ( not ( = ?auto_2155701 ?auto_2155704 ) ) ( not ( = ?auto_2155701 ?auto_2155706 ) ) ( not ( = ?auto_2155701 ?auto_2155707 ) ) ( not ( = ?auto_2155701 ?auto_2155708 ) ) ( not ( = ?auto_2155701 ?auto_2155709 ) ) ( not ( = ?auto_2155701 ?auto_2155710 ) ) ( not ( = ?auto_2155701 ?auto_2155711 ) ) ( not ( = ?auto_2155701 ?auto_2155712 ) ) ( not ( = ?auto_2155701 ?auto_2155718 ) ) ( not ( = ?auto_2155702 ?auto_2155703 ) ) ( not ( = ?auto_2155702 ?auto_2155705 ) ) ( not ( = ?auto_2155702 ?auto_2155704 ) ) ( not ( = ?auto_2155702 ?auto_2155706 ) ) ( not ( = ?auto_2155702 ?auto_2155707 ) ) ( not ( = ?auto_2155702 ?auto_2155708 ) ) ( not ( = ?auto_2155702 ?auto_2155709 ) ) ( not ( = ?auto_2155702 ?auto_2155710 ) ) ( not ( = ?auto_2155702 ?auto_2155711 ) ) ( not ( = ?auto_2155702 ?auto_2155712 ) ) ( not ( = ?auto_2155702 ?auto_2155718 ) ) ( not ( = ?auto_2155703 ?auto_2155705 ) ) ( not ( = ?auto_2155703 ?auto_2155704 ) ) ( not ( = ?auto_2155703 ?auto_2155706 ) ) ( not ( = ?auto_2155703 ?auto_2155707 ) ) ( not ( = ?auto_2155703 ?auto_2155708 ) ) ( not ( = ?auto_2155703 ?auto_2155709 ) ) ( not ( = ?auto_2155703 ?auto_2155710 ) ) ( not ( = ?auto_2155703 ?auto_2155711 ) ) ( not ( = ?auto_2155703 ?auto_2155712 ) ) ( not ( = ?auto_2155703 ?auto_2155718 ) ) ( not ( = ?auto_2155705 ?auto_2155704 ) ) ( not ( = ?auto_2155705 ?auto_2155706 ) ) ( not ( = ?auto_2155705 ?auto_2155707 ) ) ( not ( = ?auto_2155705 ?auto_2155708 ) ) ( not ( = ?auto_2155705 ?auto_2155709 ) ) ( not ( = ?auto_2155705 ?auto_2155710 ) ) ( not ( = ?auto_2155705 ?auto_2155711 ) ) ( not ( = ?auto_2155705 ?auto_2155712 ) ) ( not ( = ?auto_2155705 ?auto_2155718 ) ) ( not ( = ?auto_2155704 ?auto_2155706 ) ) ( not ( = ?auto_2155704 ?auto_2155707 ) ) ( not ( = ?auto_2155704 ?auto_2155708 ) ) ( not ( = ?auto_2155704 ?auto_2155709 ) ) ( not ( = ?auto_2155704 ?auto_2155710 ) ) ( not ( = ?auto_2155704 ?auto_2155711 ) ) ( not ( = ?auto_2155704 ?auto_2155712 ) ) ( not ( = ?auto_2155704 ?auto_2155718 ) ) ( not ( = ?auto_2155706 ?auto_2155707 ) ) ( not ( = ?auto_2155706 ?auto_2155708 ) ) ( not ( = ?auto_2155706 ?auto_2155709 ) ) ( not ( = ?auto_2155706 ?auto_2155710 ) ) ( not ( = ?auto_2155706 ?auto_2155711 ) ) ( not ( = ?auto_2155706 ?auto_2155712 ) ) ( not ( = ?auto_2155706 ?auto_2155718 ) ) ( not ( = ?auto_2155707 ?auto_2155708 ) ) ( not ( = ?auto_2155707 ?auto_2155709 ) ) ( not ( = ?auto_2155707 ?auto_2155710 ) ) ( not ( = ?auto_2155707 ?auto_2155711 ) ) ( not ( = ?auto_2155707 ?auto_2155712 ) ) ( not ( = ?auto_2155707 ?auto_2155718 ) ) ( not ( = ?auto_2155708 ?auto_2155709 ) ) ( not ( = ?auto_2155708 ?auto_2155710 ) ) ( not ( = ?auto_2155708 ?auto_2155711 ) ) ( not ( = ?auto_2155708 ?auto_2155712 ) ) ( not ( = ?auto_2155708 ?auto_2155718 ) ) ( not ( = ?auto_2155709 ?auto_2155710 ) ) ( not ( = ?auto_2155709 ?auto_2155711 ) ) ( not ( = ?auto_2155709 ?auto_2155712 ) ) ( not ( = ?auto_2155709 ?auto_2155718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2155710 ?auto_2155711 ?auto_2155712 )
      ( MAKE-11CRATE-VERIFY ?auto_2155701 ?auto_2155702 ?auto_2155703 ?auto_2155705 ?auto_2155704 ?auto_2155706 ?auto_2155707 ?auto_2155708 ?auto_2155709 ?auto_2155710 ?auto_2155711 ?auto_2155712 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2155845 - SURFACE
      ?auto_2155846 - SURFACE
      ?auto_2155847 - SURFACE
      ?auto_2155849 - SURFACE
      ?auto_2155848 - SURFACE
      ?auto_2155850 - SURFACE
      ?auto_2155851 - SURFACE
      ?auto_2155852 - SURFACE
      ?auto_2155853 - SURFACE
      ?auto_2155854 - SURFACE
      ?auto_2155855 - SURFACE
      ?auto_2155856 - SURFACE
    )
    :vars
    (
      ?auto_2155861 - HOIST
      ?auto_2155860 - PLACE
      ?auto_2155858 - PLACE
      ?auto_2155857 - HOIST
      ?auto_2155859 - SURFACE
      ?auto_2155862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2155861 ?auto_2155860 ) ( IS-CRATE ?auto_2155856 ) ( not ( = ?auto_2155855 ?auto_2155856 ) ) ( not ( = ?auto_2155854 ?auto_2155855 ) ) ( not ( = ?auto_2155854 ?auto_2155856 ) ) ( not ( = ?auto_2155858 ?auto_2155860 ) ) ( HOIST-AT ?auto_2155857 ?auto_2155858 ) ( not ( = ?auto_2155861 ?auto_2155857 ) ) ( AVAILABLE ?auto_2155857 ) ( SURFACE-AT ?auto_2155856 ?auto_2155858 ) ( ON ?auto_2155856 ?auto_2155859 ) ( CLEAR ?auto_2155856 ) ( not ( = ?auto_2155855 ?auto_2155859 ) ) ( not ( = ?auto_2155856 ?auto_2155859 ) ) ( not ( = ?auto_2155854 ?auto_2155859 ) ) ( TRUCK-AT ?auto_2155862 ?auto_2155860 ) ( SURFACE-AT ?auto_2155854 ?auto_2155860 ) ( CLEAR ?auto_2155854 ) ( IS-CRATE ?auto_2155855 ) ( AVAILABLE ?auto_2155861 ) ( IN ?auto_2155855 ?auto_2155862 ) ( ON ?auto_2155846 ?auto_2155845 ) ( ON ?auto_2155847 ?auto_2155846 ) ( ON ?auto_2155849 ?auto_2155847 ) ( ON ?auto_2155848 ?auto_2155849 ) ( ON ?auto_2155850 ?auto_2155848 ) ( ON ?auto_2155851 ?auto_2155850 ) ( ON ?auto_2155852 ?auto_2155851 ) ( ON ?auto_2155853 ?auto_2155852 ) ( ON ?auto_2155854 ?auto_2155853 ) ( not ( = ?auto_2155845 ?auto_2155846 ) ) ( not ( = ?auto_2155845 ?auto_2155847 ) ) ( not ( = ?auto_2155845 ?auto_2155849 ) ) ( not ( = ?auto_2155845 ?auto_2155848 ) ) ( not ( = ?auto_2155845 ?auto_2155850 ) ) ( not ( = ?auto_2155845 ?auto_2155851 ) ) ( not ( = ?auto_2155845 ?auto_2155852 ) ) ( not ( = ?auto_2155845 ?auto_2155853 ) ) ( not ( = ?auto_2155845 ?auto_2155854 ) ) ( not ( = ?auto_2155845 ?auto_2155855 ) ) ( not ( = ?auto_2155845 ?auto_2155856 ) ) ( not ( = ?auto_2155845 ?auto_2155859 ) ) ( not ( = ?auto_2155846 ?auto_2155847 ) ) ( not ( = ?auto_2155846 ?auto_2155849 ) ) ( not ( = ?auto_2155846 ?auto_2155848 ) ) ( not ( = ?auto_2155846 ?auto_2155850 ) ) ( not ( = ?auto_2155846 ?auto_2155851 ) ) ( not ( = ?auto_2155846 ?auto_2155852 ) ) ( not ( = ?auto_2155846 ?auto_2155853 ) ) ( not ( = ?auto_2155846 ?auto_2155854 ) ) ( not ( = ?auto_2155846 ?auto_2155855 ) ) ( not ( = ?auto_2155846 ?auto_2155856 ) ) ( not ( = ?auto_2155846 ?auto_2155859 ) ) ( not ( = ?auto_2155847 ?auto_2155849 ) ) ( not ( = ?auto_2155847 ?auto_2155848 ) ) ( not ( = ?auto_2155847 ?auto_2155850 ) ) ( not ( = ?auto_2155847 ?auto_2155851 ) ) ( not ( = ?auto_2155847 ?auto_2155852 ) ) ( not ( = ?auto_2155847 ?auto_2155853 ) ) ( not ( = ?auto_2155847 ?auto_2155854 ) ) ( not ( = ?auto_2155847 ?auto_2155855 ) ) ( not ( = ?auto_2155847 ?auto_2155856 ) ) ( not ( = ?auto_2155847 ?auto_2155859 ) ) ( not ( = ?auto_2155849 ?auto_2155848 ) ) ( not ( = ?auto_2155849 ?auto_2155850 ) ) ( not ( = ?auto_2155849 ?auto_2155851 ) ) ( not ( = ?auto_2155849 ?auto_2155852 ) ) ( not ( = ?auto_2155849 ?auto_2155853 ) ) ( not ( = ?auto_2155849 ?auto_2155854 ) ) ( not ( = ?auto_2155849 ?auto_2155855 ) ) ( not ( = ?auto_2155849 ?auto_2155856 ) ) ( not ( = ?auto_2155849 ?auto_2155859 ) ) ( not ( = ?auto_2155848 ?auto_2155850 ) ) ( not ( = ?auto_2155848 ?auto_2155851 ) ) ( not ( = ?auto_2155848 ?auto_2155852 ) ) ( not ( = ?auto_2155848 ?auto_2155853 ) ) ( not ( = ?auto_2155848 ?auto_2155854 ) ) ( not ( = ?auto_2155848 ?auto_2155855 ) ) ( not ( = ?auto_2155848 ?auto_2155856 ) ) ( not ( = ?auto_2155848 ?auto_2155859 ) ) ( not ( = ?auto_2155850 ?auto_2155851 ) ) ( not ( = ?auto_2155850 ?auto_2155852 ) ) ( not ( = ?auto_2155850 ?auto_2155853 ) ) ( not ( = ?auto_2155850 ?auto_2155854 ) ) ( not ( = ?auto_2155850 ?auto_2155855 ) ) ( not ( = ?auto_2155850 ?auto_2155856 ) ) ( not ( = ?auto_2155850 ?auto_2155859 ) ) ( not ( = ?auto_2155851 ?auto_2155852 ) ) ( not ( = ?auto_2155851 ?auto_2155853 ) ) ( not ( = ?auto_2155851 ?auto_2155854 ) ) ( not ( = ?auto_2155851 ?auto_2155855 ) ) ( not ( = ?auto_2155851 ?auto_2155856 ) ) ( not ( = ?auto_2155851 ?auto_2155859 ) ) ( not ( = ?auto_2155852 ?auto_2155853 ) ) ( not ( = ?auto_2155852 ?auto_2155854 ) ) ( not ( = ?auto_2155852 ?auto_2155855 ) ) ( not ( = ?auto_2155852 ?auto_2155856 ) ) ( not ( = ?auto_2155852 ?auto_2155859 ) ) ( not ( = ?auto_2155853 ?auto_2155854 ) ) ( not ( = ?auto_2155853 ?auto_2155855 ) ) ( not ( = ?auto_2155853 ?auto_2155856 ) ) ( not ( = ?auto_2155853 ?auto_2155859 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2155854 ?auto_2155855 ?auto_2155856 )
      ( MAKE-11CRATE-VERIFY ?auto_2155845 ?auto_2155846 ?auto_2155847 ?auto_2155849 ?auto_2155848 ?auto_2155850 ?auto_2155851 ?auto_2155852 ?auto_2155853 ?auto_2155854 ?auto_2155855 ?auto_2155856 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2165093 - SURFACE
      ?auto_2165094 - SURFACE
      ?auto_2165095 - SURFACE
      ?auto_2165097 - SURFACE
      ?auto_2165096 - SURFACE
      ?auto_2165098 - SURFACE
      ?auto_2165099 - SURFACE
      ?auto_2165100 - SURFACE
      ?auto_2165101 - SURFACE
      ?auto_2165102 - SURFACE
      ?auto_2165103 - SURFACE
      ?auto_2165104 - SURFACE
      ?auto_2165105 - SURFACE
    )
    :vars
    (
      ?auto_2165107 - HOIST
      ?auto_2165106 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2165107 ?auto_2165106 ) ( SURFACE-AT ?auto_2165104 ?auto_2165106 ) ( CLEAR ?auto_2165104 ) ( LIFTING ?auto_2165107 ?auto_2165105 ) ( IS-CRATE ?auto_2165105 ) ( not ( = ?auto_2165104 ?auto_2165105 ) ) ( ON ?auto_2165094 ?auto_2165093 ) ( ON ?auto_2165095 ?auto_2165094 ) ( ON ?auto_2165097 ?auto_2165095 ) ( ON ?auto_2165096 ?auto_2165097 ) ( ON ?auto_2165098 ?auto_2165096 ) ( ON ?auto_2165099 ?auto_2165098 ) ( ON ?auto_2165100 ?auto_2165099 ) ( ON ?auto_2165101 ?auto_2165100 ) ( ON ?auto_2165102 ?auto_2165101 ) ( ON ?auto_2165103 ?auto_2165102 ) ( ON ?auto_2165104 ?auto_2165103 ) ( not ( = ?auto_2165093 ?auto_2165094 ) ) ( not ( = ?auto_2165093 ?auto_2165095 ) ) ( not ( = ?auto_2165093 ?auto_2165097 ) ) ( not ( = ?auto_2165093 ?auto_2165096 ) ) ( not ( = ?auto_2165093 ?auto_2165098 ) ) ( not ( = ?auto_2165093 ?auto_2165099 ) ) ( not ( = ?auto_2165093 ?auto_2165100 ) ) ( not ( = ?auto_2165093 ?auto_2165101 ) ) ( not ( = ?auto_2165093 ?auto_2165102 ) ) ( not ( = ?auto_2165093 ?auto_2165103 ) ) ( not ( = ?auto_2165093 ?auto_2165104 ) ) ( not ( = ?auto_2165093 ?auto_2165105 ) ) ( not ( = ?auto_2165094 ?auto_2165095 ) ) ( not ( = ?auto_2165094 ?auto_2165097 ) ) ( not ( = ?auto_2165094 ?auto_2165096 ) ) ( not ( = ?auto_2165094 ?auto_2165098 ) ) ( not ( = ?auto_2165094 ?auto_2165099 ) ) ( not ( = ?auto_2165094 ?auto_2165100 ) ) ( not ( = ?auto_2165094 ?auto_2165101 ) ) ( not ( = ?auto_2165094 ?auto_2165102 ) ) ( not ( = ?auto_2165094 ?auto_2165103 ) ) ( not ( = ?auto_2165094 ?auto_2165104 ) ) ( not ( = ?auto_2165094 ?auto_2165105 ) ) ( not ( = ?auto_2165095 ?auto_2165097 ) ) ( not ( = ?auto_2165095 ?auto_2165096 ) ) ( not ( = ?auto_2165095 ?auto_2165098 ) ) ( not ( = ?auto_2165095 ?auto_2165099 ) ) ( not ( = ?auto_2165095 ?auto_2165100 ) ) ( not ( = ?auto_2165095 ?auto_2165101 ) ) ( not ( = ?auto_2165095 ?auto_2165102 ) ) ( not ( = ?auto_2165095 ?auto_2165103 ) ) ( not ( = ?auto_2165095 ?auto_2165104 ) ) ( not ( = ?auto_2165095 ?auto_2165105 ) ) ( not ( = ?auto_2165097 ?auto_2165096 ) ) ( not ( = ?auto_2165097 ?auto_2165098 ) ) ( not ( = ?auto_2165097 ?auto_2165099 ) ) ( not ( = ?auto_2165097 ?auto_2165100 ) ) ( not ( = ?auto_2165097 ?auto_2165101 ) ) ( not ( = ?auto_2165097 ?auto_2165102 ) ) ( not ( = ?auto_2165097 ?auto_2165103 ) ) ( not ( = ?auto_2165097 ?auto_2165104 ) ) ( not ( = ?auto_2165097 ?auto_2165105 ) ) ( not ( = ?auto_2165096 ?auto_2165098 ) ) ( not ( = ?auto_2165096 ?auto_2165099 ) ) ( not ( = ?auto_2165096 ?auto_2165100 ) ) ( not ( = ?auto_2165096 ?auto_2165101 ) ) ( not ( = ?auto_2165096 ?auto_2165102 ) ) ( not ( = ?auto_2165096 ?auto_2165103 ) ) ( not ( = ?auto_2165096 ?auto_2165104 ) ) ( not ( = ?auto_2165096 ?auto_2165105 ) ) ( not ( = ?auto_2165098 ?auto_2165099 ) ) ( not ( = ?auto_2165098 ?auto_2165100 ) ) ( not ( = ?auto_2165098 ?auto_2165101 ) ) ( not ( = ?auto_2165098 ?auto_2165102 ) ) ( not ( = ?auto_2165098 ?auto_2165103 ) ) ( not ( = ?auto_2165098 ?auto_2165104 ) ) ( not ( = ?auto_2165098 ?auto_2165105 ) ) ( not ( = ?auto_2165099 ?auto_2165100 ) ) ( not ( = ?auto_2165099 ?auto_2165101 ) ) ( not ( = ?auto_2165099 ?auto_2165102 ) ) ( not ( = ?auto_2165099 ?auto_2165103 ) ) ( not ( = ?auto_2165099 ?auto_2165104 ) ) ( not ( = ?auto_2165099 ?auto_2165105 ) ) ( not ( = ?auto_2165100 ?auto_2165101 ) ) ( not ( = ?auto_2165100 ?auto_2165102 ) ) ( not ( = ?auto_2165100 ?auto_2165103 ) ) ( not ( = ?auto_2165100 ?auto_2165104 ) ) ( not ( = ?auto_2165100 ?auto_2165105 ) ) ( not ( = ?auto_2165101 ?auto_2165102 ) ) ( not ( = ?auto_2165101 ?auto_2165103 ) ) ( not ( = ?auto_2165101 ?auto_2165104 ) ) ( not ( = ?auto_2165101 ?auto_2165105 ) ) ( not ( = ?auto_2165102 ?auto_2165103 ) ) ( not ( = ?auto_2165102 ?auto_2165104 ) ) ( not ( = ?auto_2165102 ?auto_2165105 ) ) ( not ( = ?auto_2165103 ?auto_2165104 ) ) ( not ( = ?auto_2165103 ?auto_2165105 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2165104 ?auto_2165105 )
      ( MAKE-12CRATE-VERIFY ?auto_2165093 ?auto_2165094 ?auto_2165095 ?auto_2165097 ?auto_2165096 ?auto_2165098 ?auto_2165099 ?auto_2165100 ?auto_2165101 ?auto_2165102 ?auto_2165103 ?auto_2165104 ?auto_2165105 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2165218 - SURFACE
      ?auto_2165219 - SURFACE
      ?auto_2165220 - SURFACE
      ?auto_2165222 - SURFACE
      ?auto_2165221 - SURFACE
      ?auto_2165223 - SURFACE
      ?auto_2165224 - SURFACE
      ?auto_2165225 - SURFACE
      ?auto_2165226 - SURFACE
      ?auto_2165227 - SURFACE
      ?auto_2165228 - SURFACE
      ?auto_2165229 - SURFACE
      ?auto_2165230 - SURFACE
    )
    :vars
    (
      ?auto_2165233 - HOIST
      ?auto_2165232 - PLACE
      ?auto_2165231 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2165233 ?auto_2165232 ) ( SURFACE-AT ?auto_2165229 ?auto_2165232 ) ( CLEAR ?auto_2165229 ) ( IS-CRATE ?auto_2165230 ) ( not ( = ?auto_2165229 ?auto_2165230 ) ) ( TRUCK-AT ?auto_2165231 ?auto_2165232 ) ( AVAILABLE ?auto_2165233 ) ( IN ?auto_2165230 ?auto_2165231 ) ( ON ?auto_2165229 ?auto_2165228 ) ( not ( = ?auto_2165228 ?auto_2165229 ) ) ( not ( = ?auto_2165228 ?auto_2165230 ) ) ( ON ?auto_2165219 ?auto_2165218 ) ( ON ?auto_2165220 ?auto_2165219 ) ( ON ?auto_2165222 ?auto_2165220 ) ( ON ?auto_2165221 ?auto_2165222 ) ( ON ?auto_2165223 ?auto_2165221 ) ( ON ?auto_2165224 ?auto_2165223 ) ( ON ?auto_2165225 ?auto_2165224 ) ( ON ?auto_2165226 ?auto_2165225 ) ( ON ?auto_2165227 ?auto_2165226 ) ( ON ?auto_2165228 ?auto_2165227 ) ( not ( = ?auto_2165218 ?auto_2165219 ) ) ( not ( = ?auto_2165218 ?auto_2165220 ) ) ( not ( = ?auto_2165218 ?auto_2165222 ) ) ( not ( = ?auto_2165218 ?auto_2165221 ) ) ( not ( = ?auto_2165218 ?auto_2165223 ) ) ( not ( = ?auto_2165218 ?auto_2165224 ) ) ( not ( = ?auto_2165218 ?auto_2165225 ) ) ( not ( = ?auto_2165218 ?auto_2165226 ) ) ( not ( = ?auto_2165218 ?auto_2165227 ) ) ( not ( = ?auto_2165218 ?auto_2165228 ) ) ( not ( = ?auto_2165218 ?auto_2165229 ) ) ( not ( = ?auto_2165218 ?auto_2165230 ) ) ( not ( = ?auto_2165219 ?auto_2165220 ) ) ( not ( = ?auto_2165219 ?auto_2165222 ) ) ( not ( = ?auto_2165219 ?auto_2165221 ) ) ( not ( = ?auto_2165219 ?auto_2165223 ) ) ( not ( = ?auto_2165219 ?auto_2165224 ) ) ( not ( = ?auto_2165219 ?auto_2165225 ) ) ( not ( = ?auto_2165219 ?auto_2165226 ) ) ( not ( = ?auto_2165219 ?auto_2165227 ) ) ( not ( = ?auto_2165219 ?auto_2165228 ) ) ( not ( = ?auto_2165219 ?auto_2165229 ) ) ( not ( = ?auto_2165219 ?auto_2165230 ) ) ( not ( = ?auto_2165220 ?auto_2165222 ) ) ( not ( = ?auto_2165220 ?auto_2165221 ) ) ( not ( = ?auto_2165220 ?auto_2165223 ) ) ( not ( = ?auto_2165220 ?auto_2165224 ) ) ( not ( = ?auto_2165220 ?auto_2165225 ) ) ( not ( = ?auto_2165220 ?auto_2165226 ) ) ( not ( = ?auto_2165220 ?auto_2165227 ) ) ( not ( = ?auto_2165220 ?auto_2165228 ) ) ( not ( = ?auto_2165220 ?auto_2165229 ) ) ( not ( = ?auto_2165220 ?auto_2165230 ) ) ( not ( = ?auto_2165222 ?auto_2165221 ) ) ( not ( = ?auto_2165222 ?auto_2165223 ) ) ( not ( = ?auto_2165222 ?auto_2165224 ) ) ( not ( = ?auto_2165222 ?auto_2165225 ) ) ( not ( = ?auto_2165222 ?auto_2165226 ) ) ( not ( = ?auto_2165222 ?auto_2165227 ) ) ( not ( = ?auto_2165222 ?auto_2165228 ) ) ( not ( = ?auto_2165222 ?auto_2165229 ) ) ( not ( = ?auto_2165222 ?auto_2165230 ) ) ( not ( = ?auto_2165221 ?auto_2165223 ) ) ( not ( = ?auto_2165221 ?auto_2165224 ) ) ( not ( = ?auto_2165221 ?auto_2165225 ) ) ( not ( = ?auto_2165221 ?auto_2165226 ) ) ( not ( = ?auto_2165221 ?auto_2165227 ) ) ( not ( = ?auto_2165221 ?auto_2165228 ) ) ( not ( = ?auto_2165221 ?auto_2165229 ) ) ( not ( = ?auto_2165221 ?auto_2165230 ) ) ( not ( = ?auto_2165223 ?auto_2165224 ) ) ( not ( = ?auto_2165223 ?auto_2165225 ) ) ( not ( = ?auto_2165223 ?auto_2165226 ) ) ( not ( = ?auto_2165223 ?auto_2165227 ) ) ( not ( = ?auto_2165223 ?auto_2165228 ) ) ( not ( = ?auto_2165223 ?auto_2165229 ) ) ( not ( = ?auto_2165223 ?auto_2165230 ) ) ( not ( = ?auto_2165224 ?auto_2165225 ) ) ( not ( = ?auto_2165224 ?auto_2165226 ) ) ( not ( = ?auto_2165224 ?auto_2165227 ) ) ( not ( = ?auto_2165224 ?auto_2165228 ) ) ( not ( = ?auto_2165224 ?auto_2165229 ) ) ( not ( = ?auto_2165224 ?auto_2165230 ) ) ( not ( = ?auto_2165225 ?auto_2165226 ) ) ( not ( = ?auto_2165225 ?auto_2165227 ) ) ( not ( = ?auto_2165225 ?auto_2165228 ) ) ( not ( = ?auto_2165225 ?auto_2165229 ) ) ( not ( = ?auto_2165225 ?auto_2165230 ) ) ( not ( = ?auto_2165226 ?auto_2165227 ) ) ( not ( = ?auto_2165226 ?auto_2165228 ) ) ( not ( = ?auto_2165226 ?auto_2165229 ) ) ( not ( = ?auto_2165226 ?auto_2165230 ) ) ( not ( = ?auto_2165227 ?auto_2165228 ) ) ( not ( = ?auto_2165227 ?auto_2165229 ) ) ( not ( = ?auto_2165227 ?auto_2165230 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2165228 ?auto_2165229 ?auto_2165230 )
      ( MAKE-12CRATE-VERIFY ?auto_2165218 ?auto_2165219 ?auto_2165220 ?auto_2165222 ?auto_2165221 ?auto_2165223 ?auto_2165224 ?auto_2165225 ?auto_2165226 ?auto_2165227 ?auto_2165228 ?auto_2165229 ?auto_2165230 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2165356 - SURFACE
      ?auto_2165357 - SURFACE
      ?auto_2165358 - SURFACE
      ?auto_2165360 - SURFACE
      ?auto_2165359 - SURFACE
      ?auto_2165361 - SURFACE
      ?auto_2165362 - SURFACE
      ?auto_2165363 - SURFACE
      ?auto_2165364 - SURFACE
      ?auto_2165365 - SURFACE
      ?auto_2165366 - SURFACE
      ?auto_2165367 - SURFACE
      ?auto_2165368 - SURFACE
    )
    :vars
    (
      ?auto_2165371 - HOIST
      ?auto_2165369 - PLACE
      ?auto_2165372 - TRUCK
      ?auto_2165370 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2165371 ?auto_2165369 ) ( SURFACE-AT ?auto_2165367 ?auto_2165369 ) ( CLEAR ?auto_2165367 ) ( IS-CRATE ?auto_2165368 ) ( not ( = ?auto_2165367 ?auto_2165368 ) ) ( AVAILABLE ?auto_2165371 ) ( IN ?auto_2165368 ?auto_2165372 ) ( ON ?auto_2165367 ?auto_2165366 ) ( not ( = ?auto_2165366 ?auto_2165367 ) ) ( not ( = ?auto_2165366 ?auto_2165368 ) ) ( TRUCK-AT ?auto_2165372 ?auto_2165370 ) ( not ( = ?auto_2165370 ?auto_2165369 ) ) ( ON ?auto_2165357 ?auto_2165356 ) ( ON ?auto_2165358 ?auto_2165357 ) ( ON ?auto_2165360 ?auto_2165358 ) ( ON ?auto_2165359 ?auto_2165360 ) ( ON ?auto_2165361 ?auto_2165359 ) ( ON ?auto_2165362 ?auto_2165361 ) ( ON ?auto_2165363 ?auto_2165362 ) ( ON ?auto_2165364 ?auto_2165363 ) ( ON ?auto_2165365 ?auto_2165364 ) ( ON ?auto_2165366 ?auto_2165365 ) ( not ( = ?auto_2165356 ?auto_2165357 ) ) ( not ( = ?auto_2165356 ?auto_2165358 ) ) ( not ( = ?auto_2165356 ?auto_2165360 ) ) ( not ( = ?auto_2165356 ?auto_2165359 ) ) ( not ( = ?auto_2165356 ?auto_2165361 ) ) ( not ( = ?auto_2165356 ?auto_2165362 ) ) ( not ( = ?auto_2165356 ?auto_2165363 ) ) ( not ( = ?auto_2165356 ?auto_2165364 ) ) ( not ( = ?auto_2165356 ?auto_2165365 ) ) ( not ( = ?auto_2165356 ?auto_2165366 ) ) ( not ( = ?auto_2165356 ?auto_2165367 ) ) ( not ( = ?auto_2165356 ?auto_2165368 ) ) ( not ( = ?auto_2165357 ?auto_2165358 ) ) ( not ( = ?auto_2165357 ?auto_2165360 ) ) ( not ( = ?auto_2165357 ?auto_2165359 ) ) ( not ( = ?auto_2165357 ?auto_2165361 ) ) ( not ( = ?auto_2165357 ?auto_2165362 ) ) ( not ( = ?auto_2165357 ?auto_2165363 ) ) ( not ( = ?auto_2165357 ?auto_2165364 ) ) ( not ( = ?auto_2165357 ?auto_2165365 ) ) ( not ( = ?auto_2165357 ?auto_2165366 ) ) ( not ( = ?auto_2165357 ?auto_2165367 ) ) ( not ( = ?auto_2165357 ?auto_2165368 ) ) ( not ( = ?auto_2165358 ?auto_2165360 ) ) ( not ( = ?auto_2165358 ?auto_2165359 ) ) ( not ( = ?auto_2165358 ?auto_2165361 ) ) ( not ( = ?auto_2165358 ?auto_2165362 ) ) ( not ( = ?auto_2165358 ?auto_2165363 ) ) ( not ( = ?auto_2165358 ?auto_2165364 ) ) ( not ( = ?auto_2165358 ?auto_2165365 ) ) ( not ( = ?auto_2165358 ?auto_2165366 ) ) ( not ( = ?auto_2165358 ?auto_2165367 ) ) ( not ( = ?auto_2165358 ?auto_2165368 ) ) ( not ( = ?auto_2165360 ?auto_2165359 ) ) ( not ( = ?auto_2165360 ?auto_2165361 ) ) ( not ( = ?auto_2165360 ?auto_2165362 ) ) ( not ( = ?auto_2165360 ?auto_2165363 ) ) ( not ( = ?auto_2165360 ?auto_2165364 ) ) ( not ( = ?auto_2165360 ?auto_2165365 ) ) ( not ( = ?auto_2165360 ?auto_2165366 ) ) ( not ( = ?auto_2165360 ?auto_2165367 ) ) ( not ( = ?auto_2165360 ?auto_2165368 ) ) ( not ( = ?auto_2165359 ?auto_2165361 ) ) ( not ( = ?auto_2165359 ?auto_2165362 ) ) ( not ( = ?auto_2165359 ?auto_2165363 ) ) ( not ( = ?auto_2165359 ?auto_2165364 ) ) ( not ( = ?auto_2165359 ?auto_2165365 ) ) ( not ( = ?auto_2165359 ?auto_2165366 ) ) ( not ( = ?auto_2165359 ?auto_2165367 ) ) ( not ( = ?auto_2165359 ?auto_2165368 ) ) ( not ( = ?auto_2165361 ?auto_2165362 ) ) ( not ( = ?auto_2165361 ?auto_2165363 ) ) ( not ( = ?auto_2165361 ?auto_2165364 ) ) ( not ( = ?auto_2165361 ?auto_2165365 ) ) ( not ( = ?auto_2165361 ?auto_2165366 ) ) ( not ( = ?auto_2165361 ?auto_2165367 ) ) ( not ( = ?auto_2165361 ?auto_2165368 ) ) ( not ( = ?auto_2165362 ?auto_2165363 ) ) ( not ( = ?auto_2165362 ?auto_2165364 ) ) ( not ( = ?auto_2165362 ?auto_2165365 ) ) ( not ( = ?auto_2165362 ?auto_2165366 ) ) ( not ( = ?auto_2165362 ?auto_2165367 ) ) ( not ( = ?auto_2165362 ?auto_2165368 ) ) ( not ( = ?auto_2165363 ?auto_2165364 ) ) ( not ( = ?auto_2165363 ?auto_2165365 ) ) ( not ( = ?auto_2165363 ?auto_2165366 ) ) ( not ( = ?auto_2165363 ?auto_2165367 ) ) ( not ( = ?auto_2165363 ?auto_2165368 ) ) ( not ( = ?auto_2165364 ?auto_2165365 ) ) ( not ( = ?auto_2165364 ?auto_2165366 ) ) ( not ( = ?auto_2165364 ?auto_2165367 ) ) ( not ( = ?auto_2165364 ?auto_2165368 ) ) ( not ( = ?auto_2165365 ?auto_2165366 ) ) ( not ( = ?auto_2165365 ?auto_2165367 ) ) ( not ( = ?auto_2165365 ?auto_2165368 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2165366 ?auto_2165367 ?auto_2165368 )
      ( MAKE-12CRATE-VERIFY ?auto_2165356 ?auto_2165357 ?auto_2165358 ?auto_2165360 ?auto_2165359 ?auto_2165361 ?auto_2165362 ?auto_2165363 ?auto_2165364 ?auto_2165365 ?auto_2165366 ?auto_2165367 ?auto_2165368 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2165506 - SURFACE
      ?auto_2165507 - SURFACE
      ?auto_2165508 - SURFACE
      ?auto_2165510 - SURFACE
      ?auto_2165509 - SURFACE
      ?auto_2165511 - SURFACE
      ?auto_2165512 - SURFACE
      ?auto_2165513 - SURFACE
      ?auto_2165514 - SURFACE
      ?auto_2165515 - SURFACE
      ?auto_2165516 - SURFACE
      ?auto_2165517 - SURFACE
      ?auto_2165518 - SURFACE
    )
    :vars
    (
      ?auto_2165520 - HOIST
      ?auto_2165519 - PLACE
      ?auto_2165523 - TRUCK
      ?auto_2165521 - PLACE
      ?auto_2165522 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2165520 ?auto_2165519 ) ( SURFACE-AT ?auto_2165517 ?auto_2165519 ) ( CLEAR ?auto_2165517 ) ( IS-CRATE ?auto_2165518 ) ( not ( = ?auto_2165517 ?auto_2165518 ) ) ( AVAILABLE ?auto_2165520 ) ( ON ?auto_2165517 ?auto_2165516 ) ( not ( = ?auto_2165516 ?auto_2165517 ) ) ( not ( = ?auto_2165516 ?auto_2165518 ) ) ( TRUCK-AT ?auto_2165523 ?auto_2165521 ) ( not ( = ?auto_2165521 ?auto_2165519 ) ) ( HOIST-AT ?auto_2165522 ?auto_2165521 ) ( LIFTING ?auto_2165522 ?auto_2165518 ) ( not ( = ?auto_2165520 ?auto_2165522 ) ) ( ON ?auto_2165507 ?auto_2165506 ) ( ON ?auto_2165508 ?auto_2165507 ) ( ON ?auto_2165510 ?auto_2165508 ) ( ON ?auto_2165509 ?auto_2165510 ) ( ON ?auto_2165511 ?auto_2165509 ) ( ON ?auto_2165512 ?auto_2165511 ) ( ON ?auto_2165513 ?auto_2165512 ) ( ON ?auto_2165514 ?auto_2165513 ) ( ON ?auto_2165515 ?auto_2165514 ) ( ON ?auto_2165516 ?auto_2165515 ) ( not ( = ?auto_2165506 ?auto_2165507 ) ) ( not ( = ?auto_2165506 ?auto_2165508 ) ) ( not ( = ?auto_2165506 ?auto_2165510 ) ) ( not ( = ?auto_2165506 ?auto_2165509 ) ) ( not ( = ?auto_2165506 ?auto_2165511 ) ) ( not ( = ?auto_2165506 ?auto_2165512 ) ) ( not ( = ?auto_2165506 ?auto_2165513 ) ) ( not ( = ?auto_2165506 ?auto_2165514 ) ) ( not ( = ?auto_2165506 ?auto_2165515 ) ) ( not ( = ?auto_2165506 ?auto_2165516 ) ) ( not ( = ?auto_2165506 ?auto_2165517 ) ) ( not ( = ?auto_2165506 ?auto_2165518 ) ) ( not ( = ?auto_2165507 ?auto_2165508 ) ) ( not ( = ?auto_2165507 ?auto_2165510 ) ) ( not ( = ?auto_2165507 ?auto_2165509 ) ) ( not ( = ?auto_2165507 ?auto_2165511 ) ) ( not ( = ?auto_2165507 ?auto_2165512 ) ) ( not ( = ?auto_2165507 ?auto_2165513 ) ) ( not ( = ?auto_2165507 ?auto_2165514 ) ) ( not ( = ?auto_2165507 ?auto_2165515 ) ) ( not ( = ?auto_2165507 ?auto_2165516 ) ) ( not ( = ?auto_2165507 ?auto_2165517 ) ) ( not ( = ?auto_2165507 ?auto_2165518 ) ) ( not ( = ?auto_2165508 ?auto_2165510 ) ) ( not ( = ?auto_2165508 ?auto_2165509 ) ) ( not ( = ?auto_2165508 ?auto_2165511 ) ) ( not ( = ?auto_2165508 ?auto_2165512 ) ) ( not ( = ?auto_2165508 ?auto_2165513 ) ) ( not ( = ?auto_2165508 ?auto_2165514 ) ) ( not ( = ?auto_2165508 ?auto_2165515 ) ) ( not ( = ?auto_2165508 ?auto_2165516 ) ) ( not ( = ?auto_2165508 ?auto_2165517 ) ) ( not ( = ?auto_2165508 ?auto_2165518 ) ) ( not ( = ?auto_2165510 ?auto_2165509 ) ) ( not ( = ?auto_2165510 ?auto_2165511 ) ) ( not ( = ?auto_2165510 ?auto_2165512 ) ) ( not ( = ?auto_2165510 ?auto_2165513 ) ) ( not ( = ?auto_2165510 ?auto_2165514 ) ) ( not ( = ?auto_2165510 ?auto_2165515 ) ) ( not ( = ?auto_2165510 ?auto_2165516 ) ) ( not ( = ?auto_2165510 ?auto_2165517 ) ) ( not ( = ?auto_2165510 ?auto_2165518 ) ) ( not ( = ?auto_2165509 ?auto_2165511 ) ) ( not ( = ?auto_2165509 ?auto_2165512 ) ) ( not ( = ?auto_2165509 ?auto_2165513 ) ) ( not ( = ?auto_2165509 ?auto_2165514 ) ) ( not ( = ?auto_2165509 ?auto_2165515 ) ) ( not ( = ?auto_2165509 ?auto_2165516 ) ) ( not ( = ?auto_2165509 ?auto_2165517 ) ) ( not ( = ?auto_2165509 ?auto_2165518 ) ) ( not ( = ?auto_2165511 ?auto_2165512 ) ) ( not ( = ?auto_2165511 ?auto_2165513 ) ) ( not ( = ?auto_2165511 ?auto_2165514 ) ) ( not ( = ?auto_2165511 ?auto_2165515 ) ) ( not ( = ?auto_2165511 ?auto_2165516 ) ) ( not ( = ?auto_2165511 ?auto_2165517 ) ) ( not ( = ?auto_2165511 ?auto_2165518 ) ) ( not ( = ?auto_2165512 ?auto_2165513 ) ) ( not ( = ?auto_2165512 ?auto_2165514 ) ) ( not ( = ?auto_2165512 ?auto_2165515 ) ) ( not ( = ?auto_2165512 ?auto_2165516 ) ) ( not ( = ?auto_2165512 ?auto_2165517 ) ) ( not ( = ?auto_2165512 ?auto_2165518 ) ) ( not ( = ?auto_2165513 ?auto_2165514 ) ) ( not ( = ?auto_2165513 ?auto_2165515 ) ) ( not ( = ?auto_2165513 ?auto_2165516 ) ) ( not ( = ?auto_2165513 ?auto_2165517 ) ) ( not ( = ?auto_2165513 ?auto_2165518 ) ) ( not ( = ?auto_2165514 ?auto_2165515 ) ) ( not ( = ?auto_2165514 ?auto_2165516 ) ) ( not ( = ?auto_2165514 ?auto_2165517 ) ) ( not ( = ?auto_2165514 ?auto_2165518 ) ) ( not ( = ?auto_2165515 ?auto_2165516 ) ) ( not ( = ?auto_2165515 ?auto_2165517 ) ) ( not ( = ?auto_2165515 ?auto_2165518 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2165516 ?auto_2165517 ?auto_2165518 )
      ( MAKE-12CRATE-VERIFY ?auto_2165506 ?auto_2165507 ?auto_2165508 ?auto_2165510 ?auto_2165509 ?auto_2165511 ?auto_2165512 ?auto_2165513 ?auto_2165514 ?auto_2165515 ?auto_2165516 ?auto_2165517 ?auto_2165518 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2165668 - SURFACE
      ?auto_2165669 - SURFACE
      ?auto_2165670 - SURFACE
      ?auto_2165672 - SURFACE
      ?auto_2165671 - SURFACE
      ?auto_2165673 - SURFACE
      ?auto_2165674 - SURFACE
      ?auto_2165675 - SURFACE
      ?auto_2165676 - SURFACE
      ?auto_2165677 - SURFACE
      ?auto_2165678 - SURFACE
      ?auto_2165679 - SURFACE
      ?auto_2165680 - SURFACE
    )
    :vars
    (
      ?auto_2165686 - HOIST
      ?auto_2165683 - PLACE
      ?auto_2165685 - TRUCK
      ?auto_2165682 - PLACE
      ?auto_2165681 - HOIST
      ?auto_2165684 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2165686 ?auto_2165683 ) ( SURFACE-AT ?auto_2165679 ?auto_2165683 ) ( CLEAR ?auto_2165679 ) ( IS-CRATE ?auto_2165680 ) ( not ( = ?auto_2165679 ?auto_2165680 ) ) ( AVAILABLE ?auto_2165686 ) ( ON ?auto_2165679 ?auto_2165678 ) ( not ( = ?auto_2165678 ?auto_2165679 ) ) ( not ( = ?auto_2165678 ?auto_2165680 ) ) ( TRUCK-AT ?auto_2165685 ?auto_2165682 ) ( not ( = ?auto_2165682 ?auto_2165683 ) ) ( HOIST-AT ?auto_2165681 ?auto_2165682 ) ( not ( = ?auto_2165686 ?auto_2165681 ) ) ( AVAILABLE ?auto_2165681 ) ( SURFACE-AT ?auto_2165680 ?auto_2165682 ) ( ON ?auto_2165680 ?auto_2165684 ) ( CLEAR ?auto_2165680 ) ( not ( = ?auto_2165679 ?auto_2165684 ) ) ( not ( = ?auto_2165680 ?auto_2165684 ) ) ( not ( = ?auto_2165678 ?auto_2165684 ) ) ( ON ?auto_2165669 ?auto_2165668 ) ( ON ?auto_2165670 ?auto_2165669 ) ( ON ?auto_2165672 ?auto_2165670 ) ( ON ?auto_2165671 ?auto_2165672 ) ( ON ?auto_2165673 ?auto_2165671 ) ( ON ?auto_2165674 ?auto_2165673 ) ( ON ?auto_2165675 ?auto_2165674 ) ( ON ?auto_2165676 ?auto_2165675 ) ( ON ?auto_2165677 ?auto_2165676 ) ( ON ?auto_2165678 ?auto_2165677 ) ( not ( = ?auto_2165668 ?auto_2165669 ) ) ( not ( = ?auto_2165668 ?auto_2165670 ) ) ( not ( = ?auto_2165668 ?auto_2165672 ) ) ( not ( = ?auto_2165668 ?auto_2165671 ) ) ( not ( = ?auto_2165668 ?auto_2165673 ) ) ( not ( = ?auto_2165668 ?auto_2165674 ) ) ( not ( = ?auto_2165668 ?auto_2165675 ) ) ( not ( = ?auto_2165668 ?auto_2165676 ) ) ( not ( = ?auto_2165668 ?auto_2165677 ) ) ( not ( = ?auto_2165668 ?auto_2165678 ) ) ( not ( = ?auto_2165668 ?auto_2165679 ) ) ( not ( = ?auto_2165668 ?auto_2165680 ) ) ( not ( = ?auto_2165668 ?auto_2165684 ) ) ( not ( = ?auto_2165669 ?auto_2165670 ) ) ( not ( = ?auto_2165669 ?auto_2165672 ) ) ( not ( = ?auto_2165669 ?auto_2165671 ) ) ( not ( = ?auto_2165669 ?auto_2165673 ) ) ( not ( = ?auto_2165669 ?auto_2165674 ) ) ( not ( = ?auto_2165669 ?auto_2165675 ) ) ( not ( = ?auto_2165669 ?auto_2165676 ) ) ( not ( = ?auto_2165669 ?auto_2165677 ) ) ( not ( = ?auto_2165669 ?auto_2165678 ) ) ( not ( = ?auto_2165669 ?auto_2165679 ) ) ( not ( = ?auto_2165669 ?auto_2165680 ) ) ( not ( = ?auto_2165669 ?auto_2165684 ) ) ( not ( = ?auto_2165670 ?auto_2165672 ) ) ( not ( = ?auto_2165670 ?auto_2165671 ) ) ( not ( = ?auto_2165670 ?auto_2165673 ) ) ( not ( = ?auto_2165670 ?auto_2165674 ) ) ( not ( = ?auto_2165670 ?auto_2165675 ) ) ( not ( = ?auto_2165670 ?auto_2165676 ) ) ( not ( = ?auto_2165670 ?auto_2165677 ) ) ( not ( = ?auto_2165670 ?auto_2165678 ) ) ( not ( = ?auto_2165670 ?auto_2165679 ) ) ( not ( = ?auto_2165670 ?auto_2165680 ) ) ( not ( = ?auto_2165670 ?auto_2165684 ) ) ( not ( = ?auto_2165672 ?auto_2165671 ) ) ( not ( = ?auto_2165672 ?auto_2165673 ) ) ( not ( = ?auto_2165672 ?auto_2165674 ) ) ( not ( = ?auto_2165672 ?auto_2165675 ) ) ( not ( = ?auto_2165672 ?auto_2165676 ) ) ( not ( = ?auto_2165672 ?auto_2165677 ) ) ( not ( = ?auto_2165672 ?auto_2165678 ) ) ( not ( = ?auto_2165672 ?auto_2165679 ) ) ( not ( = ?auto_2165672 ?auto_2165680 ) ) ( not ( = ?auto_2165672 ?auto_2165684 ) ) ( not ( = ?auto_2165671 ?auto_2165673 ) ) ( not ( = ?auto_2165671 ?auto_2165674 ) ) ( not ( = ?auto_2165671 ?auto_2165675 ) ) ( not ( = ?auto_2165671 ?auto_2165676 ) ) ( not ( = ?auto_2165671 ?auto_2165677 ) ) ( not ( = ?auto_2165671 ?auto_2165678 ) ) ( not ( = ?auto_2165671 ?auto_2165679 ) ) ( not ( = ?auto_2165671 ?auto_2165680 ) ) ( not ( = ?auto_2165671 ?auto_2165684 ) ) ( not ( = ?auto_2165673 ?auto_2165674 ) ) ( not ( = ?auto_2165673 ?auto_2165675 ) ) ( not ( = ?auto_2165673 ?auto_2165676 ) ) ( not ( = ?auto_2165673 ?auto_2165677 ) ) ( not ( = ?auto_2165673 ?auto_2165678 ) ) ( not ( = ?auto_2165673 ?auto_2165679 ) ) ( not ( = ?auto_2165673 ?auto_2165680 ) ) ( not ( = ?auto_2165673 ?auto_2165684 ) ) ( not ( = ?auto_2165674 ?auto_2165675 ) ) ( not ( = ?auto_2165674 ?auto_2165676 ) ) ( not ( = ?auto_2165674 ?auto_2165677 ) ) ( not ( = ?auto_2165674 ?auto_2165678 ) ) ( not ( = ?auto_2165674 ?auto_2165679 ) ) ( not ( = ?auto_2165674 ?auto_2165680 ) ) ( not ( = ?auto_2165674 ?auto_2165684 ) ) ( not ( = ?auto_2165675 ?auto_2165676 ) ) ( not ( = ?auto_2165675 ?auto_2165677 ) ) ( not ( = ?auto_2165675 ?auto_2165678 ) ) ( not ( = ?auto_2165675 ?auto_2165679 ) ) ( not ( = ?auto_2165675 ?auto_2165680 ) ) ( not ( = ?auto_2165675 ?auto_2165684 ) ) ( not ( = ?auto_2165676 ?auto_2165677 ) ) ( not ( = ?auto_2165676 ?auto_2165678 ) ) ( not ( = ?auto_2165676 ?auto_2165679 ) ) ( not ( = ?auto_2165676 ?auto_2165680 ) ) ( not ( = ?auto_2165676 ?auto_2165684 ) ) ( not ( = ?auto_2165677 ?auto_2165678 ) ) ( not ( = ?auto_2165677 ?auto_2165679 ) ) ( not ( = ?auto_2165677 ?auto_2165680 ) ) ( not ( = ?auto_2165677 ?auto_2165684 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2165678 ?auto_2165679 ?auto_2165680 )
      ( MAKE-12CRATE-VERIFY ?auto_2165668 ?auto_2165669 ?auto_2165670 ?auto_2165672 ?auto_2165671 ?auto_2165673 ?auto_2165674 ?auto_2165675 ?auto_2165676 ?auto_2165677 ?auto_2165678 ?auto_2165679 ?auto_2165680 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2165831 - SURFACE
      ?auto_2165832 - SURFACE
      ?auto_2165833 - SURFACE
      ?auto_2165835 - SURFACE
      ?auto_2165834 - SURFACE
      ?auto_2165836 - SURFACE
      ?auto_2165837 - SURFACE
      ?auto_2165838 - SURFACE
      ?auto_2165839 - SURFACE
      ?auto_2165840 - SURFACE
      ?auto_2165841 - SURFACE
      ?auto_2165842 - SURFACE
      ?auto_2165843 - SURFACE
    )
    :vars
    (
      ?auto_2165846 - HOIST
      ?auto_2165849 - PLACE
      ?auto_2165844 - PLACE
      ?auto_2165848 - HOIST
      ?auto_2165847 - SURFACE
      ?auto_2165845 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2165846 ?auto_2165849 ) ( SURFACE-AT ?auto_2165842 ?auto_2165849 ) ( CLEAR ?auto_2165842 ) ( IS-CRATE ?auto_2165843 ) ( not ( = ?auto_2165842 ?auto_2165843 ) ) ( AVAILABLE ?auto_2165846 ) ( ON ?auto_2165842 ?auto_2165841 ) ( not ( = ?auto_2165841 ?auto_2165842 ) ) ( not ( = ?auto_2165841 ?auto_2165843 ) ) ( not ( = ?auto_2165844 ?auto_2165849 ) ) ( HOIST-AT ?auto_2165848 ?auto_2165844 ) ( not ( = ?auto_2165846 ?auto_2165848 ) ) ( AVAILABLE ?auto_2165848 ) ( SURFACE-AT ?auto_2165843 ?auto_2165844 ) ( ON ?auto_2165843 ?auto_2165847 ) ( CLEAR ?auto_2165843 ) ( not ( = ?auto_2165842 ?auto_2165847 ) ) ( not ( = ?auto_2165843 ?auto_2165847 ) ) ( not ( = ?auto_2165841 ?auto_2165847 ) ) ( TRUCK-AT ?auto_2165845 ?auto_2165849 ) ( ON ?auto_2165832 ?auto_2165831 ) ( ON ?auto_2165833 ?auto_2165832 ) ( ON ?auto_2165835 ?auto_2165833 ) ( ON ?auto_2165834 ?auto_2165835 ) ( ON ?auto_2165836 ?auto_2165834 ) ( ON ?auto_2165837 ?auto_2165836 ) ( ON ?auto_2165838 ?auto_2165837 ) ( ON ?auto_2165839 ?auto_2165838 ) ( ON ?auto_2165840 ?auto_2165839 ) ( ON ?auto_2165841 ?auto_2165840 ) ( not ( = ?auto_2165831 ?auto_2165832 ) ) ( not ( = ?auto_2165831 ?auto_2165833 ) ) ( not ( = ?auto_2165831 ?auto_2165835 ) ) ( not ( = ?auto_2165831 ?auto_2165834 ) ) ( not ( = ?auto_2165831 ?auto_2165836 ) ) ( not ( = ?auto_2165831 ?auto_2165837 ) ) ( not ( = ?auto_2165831 ?auto_2165838 ) ) ( not ( = ?auto_2165831 ?auto_2165839 ) ) ( not ( = ?auto_2165831 ?auto_2165840 ) ) ( not ( = ?auto_2165831 ?auto_2165841 ) ) ( not ( = ?auto_2165831 ?auto_2165842 ) ) ( not ( = ?auto_2165831 ?auto_2165843 ) ) ( not ( = ?auto_2165831 ?auto_2165847 ) ) ( not ( = ?auto_2165832 ?auto_2165833 ) ) ( not ( = ?auto_2165832 ?auto_2165835 ) ) ( not ( = ?auto_2165832 ?auto_2165834 ) ) ( not ( = ?auto_2165832 ?auto_2165836 ) ) ( not ( = ?auto_2165832 ?auto_2165837 ) ) ( not ( = ?auto_2165832 ?auto_2165838 ) ) ( not ( = ?auto_2165832 ?auto_2165839 ) ) ( not ( = ?auto_2165832 ?auto_2165840 ) ) ( not ( = ?auto_2165832 ?auto_2165841 ) ) ( not ( = ?auto_2165832 ?auto_2165842 ) ) ( not ( = ?auto_2165832 ?auto_2165843 ) ) ( not ( = ?auto_2165832 ?auto_2165847 ) ) ( not ( = ?auto_2165833 ?auto_2165835 ) ) ( not ( = ?auto_2165833 ?auto_2165834 ) ) ( not ( = ?auto_2165833 ?auto_2165836 ) ) ( not ( = ?auto_2165833 ?auto_2165837 ) ) ( not ( = ?auto_2165833 ?auto_2165838 ) ) ( not ( = ?auto_2165833 ?auto_2165839 ) ) ( not ( = ?auto_2165833 ?auto_2165840 ) ) ( not ( = ?auto_2165833 ?auto_2165841 ) ) ( not ( = ?auto_2165833 ?auto_2165842 ) ) ( not ( = ?auto_2165833 ?auto_2165843 ) ) ( not ( = ?auto_2165833 ?auto_2165847 ) ) ( not ( = ?auto_2165835 ?auto_2165834 ) ) ( not ( = ?auto_2165835 ?auto_2165836 ) ) ( not ( = ?auto_2165835 ?auto_2165837 ) ) ( not ( = ?auto_2165835 ?auto_2165838 ) ) ( not ( = ?auto_2165835 ?auto_2165839 ) ) ( not ( = ?auto_2165835 ?auto_2165840 ) ) ( not ( = ?auto_2165835 ?auto_2165841 ) ) ( not ( = ?auto_2165835 ?auto_2165842 ) ) ( not ( = ?auto_2165835 ?auto_2165843 ) ) ( not ( = ?auto_2165835 ?auto_2165847 ) ) ( not ( = ?auto_2165834 ?auto_2165836 ) ) ( not ( = ?auto_2165834 ?auto_2165837 ) ) ( not ( = ?auto_2165834 ?auto_2165838 ) ) ( not ( = ?auto_2165834 ?auto_2165839 ) ) ( not ( = ?auto_2165834 ?auto_2165840 ) ) ( not ( = ?auto_2165834 ?auto_2165841 ) ) ( not ( = ?auto_2165834 ?auto_2165842 ) ) ( not ( = ?auto_2165834 ?auto_2165843 ) ) ( not ( = ?auto_2165834 ?auto_2165847 ) ) ( not ( = ?auto_2165836 ?auto_2165837 ) ) ( not ( = ?auto_2165836 ?auto_2165838 ) ) ( not ( = ?auto_2165836 ?auto_2165839 ) ) ( not ( = ?auto_2165836 ?auto_2165840 ) ) ( not ( = ?auto_2165836 ?auto_2165841 ) ) ( not ( = ?auto_2165836 ?auto_2165842 ) ) ( not ( = ?auto_2165836 ?auto_2165843 ) ) ( not ( = ?auto_2165836 ?auto_2165847 ) ) ( not ( = ?auto_2165837 ?auto_2165838 ) ) ( not ( = ?auto_2165837 ?auto_2165839 ) ) ( not ( = ?auto_2165837 ?auto_2165840 ) ) ( not ( = ?auto_2165837 ?auto_2165841 ) ) ( not ( = ?auto_2165837 ?auto_2165842 ) ) ( not ( = ?auto_2165837 ?auto_2165843 ) ) ( not ( = ?auto_2165837 ?auto_2165847 ) ) ( not ( = ?auto_2165838 ?auto_2165839 ) ) ( not ( = ?auto_2165838 ?auto_2165840 ) ) ( not ( = ?auto_2165838 ?auto_2165841 ) ) ( not ( = ?auto_2165838 ?auto_2165842 ) ) ( not ( = ?auto_2165838 ?auto_2165843 ) ) ( not ( = ?auto_2165838 ?auto_2165847 ) ) ( not ( = ?auto_2165839 ?auto_2165840 ) ) ( not ( = ?auto_2165839 ?auto_2165841 ) ) ( not ( = ?auto_2165839 ?auto_2165842 ) ) ( not ( = ?auto_2165839 ?auto_2165843 ) ) ( not ( = ?auto_2165839 ?auto_2165847 ) ) ( not ( = ?auto_2165840 ?auto_2165841 ) ) ( not ( = ?auto_2165840 ?auto_2165842 ) ) ( not ( = ?auto_2165840 ?auto_2165843 ) ) ( not ( = ?auto_2165840 ?auto_2165847 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2165841 ?auto_2165842 ?auto_2165843 )
      ( MAKE-12CRATE-VERIFY ?auto_2165831 ?auto_2165832 ?auto_2165833 ?auto_2165835 ?auto_2165834 ?auto_2165836 ?auto_2165837 ?auto_2165838 ?auto_2165839 ?auto_2165840 ?auto_2165841 ?auto_2165842 ?auto_2165843 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2165994 - SURFACE
      ?auto_2165995 - SURFACE
      ?auto_2165996 - SURFACE
      ?auto_2165998 - SURFACE
      ?auto_2165997 - SURFACE
      ?auto_2165999 - SURFACE
      ?auto_2166000 - SURFACE
      ?auto_2166001 - SURFACE
      ?auto_2166002 - SURFACE
      ?auto_2166003 - SURFACE
      ?auto_2166004 - SURFACE
      ?auto_2166005 - SURFACE
      ?auto_2166006 - SURFACE
    )
    :vars
    (
      ?auto_2166007 - HOIST
      ?auto_2166012 - PLACE
      ?auto_2166009 - PLACE
      ?auto_2166011 - HOIST
      ?auto_2166010 - SURFACE
      ?auto_2166008 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2166007 ?auto_2166012 ) ( IS-CRATE ?auto_2166006 ) ( not ( = ?auto_2166005 ?auto_2166006 ) ) ( not ( = ?auto_2166004 ?auto_2166005 ) ) ( not ( = ?auto_2166004 ?auto_2166006 ) ) ( not ( = ?auto_2166009 ?auto_2166012 ) ) ( HOIST-AT ?auto_2166011 ?auto_2166009 ) ( not ( = ?auto_2166007 ?auto_2166011 ) ) ( AVAILABLE ?auto_2166011 ) ( SURFACE-AT ?auto_2166006 ?auto_2166009 ) ( ON ?auto_2166006 ?auto_2166010 ) ( CLEAR ?auto_2166006 ) ( not ( = ?auto_2166005 ?auto_2166010 ) ) ( not ( = ?auto_2166006 ?auto_2166010 ) ) ( not ( = ?auto_2166004 ?auto_2166010 ) ) ( TRUCK-AT ?auto_2166008 ?auto_2166012 ) ( SURFACE-AT ?auto_2166004 ?auto_2166012 ) ( CLEAR ?auto_2166004 ) ( LIFTING ?auto_2166007 ?auto_2166005 ) ( IS-CRATE ?auto_2166005 ) ( ON ?auto_2165995 ?auto_2165994 ) ( ON ?auto_2165996 ?auto_2165995 ) ( ON ?auto_2165998 ?auto_2165996 ) ( ON ?auto_2165997 ?auto_2165998 ) ( ON ?auto_2165999 ?auto_2165997 ) ( ON ?auto_2166000 ?auto_2165999 ) ( ON ?auto_2166001 ?auto_2166000 ) ( ON ?auto_2166002 ?auto_2166001 ) ( ON ?auto_2166003 ?auto_2166002 ) ( ON ?auto_2166004 ?auto_2166003 ) ( not ( = ?auto_2165994 ?auto_2165995 ) ) ( not ( = ?auto_2165994 ?auto_2165996 ) ) ( not ( = ?auto_2165994 ?auto_2165998 ) ) ( not ( = ?auto_2165994 ?auto_2165997 ) ) ( not ( = ?auto_2165994 ?auto_2165999 ) ) ( not ( = ?auto_2165994 ?auto_2166000 ) ) ( not ( = ?auto_2165994 ?auto_2166001 ) ) ( not ( = ?auto_2165994 ?auto_2166002 ) ) ( not ( = ?auto_2165994 ?auto_2166003 ) ) ( not ( = ?auto_2165994 ?auto_2166004 ) ) ( not ( = ?auto_2165994 ?auto_2166005 ) ) ( not ( = ?auto_2165994 ?auto_2166006 ) ) ( not ( = ?auto_2165994 ?auto_2166010 ) ) ( not ( = ?auto_2165995 ?auto_2165996 ) ) ( not ( = ?auto_2165995 ?auto_2165998 ) ) ( not ( = ?auto_2165995 ?auto_2165997 ) ) ( not ( = ?auto_2165995 ?auto_2165999 ) ) ( not ( = ?auto_2165995 ?auto_2166000 ) ) ( not ( = ?auto_2165995 ?auto_2166001 ) ) ( not ( = ?auto_2165995 ?auto_2166002 ) ) ( not ( = ?auto_2165995 ?auto_2166003 ) ) ( not ( = ?auto_2165995 ?auto_2166004 ) ) ( not ( = ?auto_2165995 ?auto_2166005 ) ) ( not ( = ?auto_2165995 ?auto_2166006 ) ) ( not ( = ?auto_2165995 ?auto_2166010 ) ) ( not ( = ?auto_2165996 ?auto_2165998 ) ) ( not ( = ?auto_2165996 ?auto_2165997 ) ) ( not ( = ?auto_2165996 ?auto_2165999 ) ) ( not ( = ?auto_2165996 ?auto_2166000 ) ) ( not ( = ?auto_2165996 ?auto_2166001 ) ) ( not ( = ?auto_2165996 ?auto_2166002 ) ) ( not ( = ?auto_2165996 ?auto_2166003 ) ) ( not ( = ?auto_2165996 ?auto_2166004 ) ) ( not ( = ?auto_2165996 ?auto_2166005 ) ) ( not ( = ?auto_2165996 ?auto_2166006 ) ) ( not ( = ?auto_2165996 ?auto_2166010 ) ) ( not ( = ?auto_2165998 ?auto_2165997 ) ) ( not ( = ?auto_2165998 ?auto_2165999 ) ) ( not ( = ?auto_2165998 ?auto_2166000 ) ) ( not ( = ?auto_2165998 ?auto_2166001 ) ) ( not ( = ?auto_2165998 ?auto_2166002 ) ) ( not ( = ?auto_2165998 ?auto_2166003 ) ) ( not ( = ?auto_2165998 ?auto_2166004 ) ) ( not ( = ?auto_2165998 ?auto_2166005 ) ) ( not ( = ?auto_2165998 ?auto_2166006 ) ) ( not ( = ?auto_2165998 ?auto_2166010 ) ) ( not ( = ?auto_2165997 ?auto_2165999 ) ) ( not ( = ?auto_2165997 ?auto_2166000 ) ) ( not ( = ?auto_2165997 ?auto_2166001 ) ) ( not ( = ?auto_2165997 ?auto_2166002 ) ) ( not ( = ?auto_2165997 ?auto_2166003 ) ) ( not ( = ?auto_2165997 ?auto_2166004 ) ) ( not ( = ?auto_2165997 ?auto_2166005 ) ) ( not ( = ?auto_2165997 ?auto_2166006 ) ) ( not ( = ?auto_2165997 ?auto_2166010 ) ) ( not ( = ?auto_2165999 ?auto_2166000 ) ) ( not ( = ?auto_2165999 ?auto_2166001 ) ) ( not ( = ?auto_2165999 ?auto_2166002 ) ) ( not ( = ?auto_2165999 ?auto_2166003 ) ) ( not ( = ?auto_2165999 ?auto_2166004 ) ) ( not ( = ?auto_2165999 ?auto_2166005 ) ) ( not ( = ?auto_2165999 ?auto_2166006 ) ) ( not ( = ?auto_2165999 ?auto_2166010 ) ) ( not ( = ?auto_2166000 ?auto_2166001 ) ) ( not ( = ?auto_2166000 ?auto_2166002 ) ) ( not ( = ?auto_2166000 ?auto_2166003 ) ) ( not ( = ?auto_2166000 ?auto_2166004 ) ) ( not ( = ?auto_2166000 ?auto_2166005 ) ) ( not ( = ?auto_2166000 ?auto_2166006 ) ) ( not ( = ?auto_2166000 ?auto_2166010 ) ) ( not ( = ?auto_2166001 ?auto_2166002 ) ) ( not ( = ?auto_2166001 ?auto_2166003 ) ) ( not ( = ?auto_2166001 ?auto_2166004 ) ) ( not ( = ?auto_2166001 ?auto_2166005 ) ) ( not ( = ?auto_2166001 ?auto_2166006 ) ) ( not ( = ?auto_2166001 ?auto_2166010 ) ) ( not ( = ?auto_2166002 ?auto_2166003 ) ) ( not ( = ?auto_2166002 ?auto_2166004 ) ) ( not ( = ?auto_2166002 ?auto_2166005 ) ) ( not ( = ?auto_2166002 ?auto_2166006 ) ) ( not ( = ?auto_2166002 ?auto_2166010 ) ) ( not ( = ?auto_2166003 ?auto_2166004 ) ) ( not ( = ?auto_2166003 ?auto_2166005 ) ) ( not ( = ?auto_2166003 ?auto_2166006 ) ) ( not ( = ?auto_2166003 ?auto_2166010 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2166004 ?auto_2166005 ?auto_2166006 )
      ( MAKE-12CRATE-VERIFY ?auto_2165994 ?auto_2165995 ?auto_2165996 ?auto_2165998 ?auto_2165997 ?auto_2165999 ?auto_2166000 ?auto_2166001 ?auto_2166002 ?auto_2166003 ?auto_2166004 ?auto_2166005 ?auto_2166006 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2166157 - SURFACE
      ?auto_2166158 - SURFACE
      ?auto_2166159 - SURFACE
      ?auto_2166161 - SURFACE
      ?auto_2166160 - SURFACE
      ?auto_2166162 - SURFACE
      ?auto_2166163 - SURFACE
      ?auto_2166164 - SURFACE
      ?auto_2166165 - SURFACE
      ?auto_2166166 - SURFACE
      ?auto_2166167 - SURFACE
      ?auto_2166168 - SURFACE
      ?auto_2166169 - SURFACE
    )
    :vars
    (
      ?auto_2166171 - HOIST
      ?auto_2166174 - PLACE
      ?auto_2166175 - PLACE
      ?auto_2166173 - HOIST
      ?auto_2166170 - SURFACE
      ?auto_2166172 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2166171 ?auto_2166174 ) ( IS-CRATE ?auto_2166169 ) ( not ( = ?auto_2166168 ?auto_2166169 ) ) ( not ( = ?auto_2166167 ?auto_2166168 ) ) ( not ( = ?auto_2166167 ?auto_2166169 ) ) ( not ( = ?auto_2166175 ?auto_2166174 ) ) ( HOIST-AT ?auto_2166173 ?auto_2166175 ) ( not ( = ?auto_2166171 ?auto_2166173 ) ) ( AVAILABLE ?auto_2166173 ) ( SURFACE-AT ?auto_2166169 ?auto_2166175 ) ( ON ?auto_2166169 ?auto_2166170 ) ( CLEAR ?auto_2166169 ) ( not ( = ?auto_2166168 ?auto_2166170 ) ) ( not ( = ?auto_2166169 ?auto_2166170 ) ) ( not ( = ?auto_2166167 ?auto_2166170 ) ) ( TRUCK-AT ?auto_2166172 ?auto_2166174 ) ( SURFACE-AT ?auto_2166167 ?auto_2166174 ) ( CLEAR ?auto_2166167 ) ( IS-CRATE ?auto_2166168 ) ( AVAILABLE ?auto_2166171 ) ( IN ?auto_2166168 ?auto_2166172 ) ( ON ?auto_2166158 ?auto_2166157 ) ( ON ?auto_2166159 ?auto_2166158 ) ( ON ?auto_2166161 ?auto_2166159 ) ( ON ?auto_2166160 ?auto_2166161 ) ( ON ?auto_2166162 ?auto_2166160 ) ( ON ?auto_2166163 ?auto_2166162 ) ( ON ?auto_2166164 ?auto_2166163 ) ( ON ?auto_2166165 ?auto_2166164 ) ( ON ?auto_2166166 ?auto_2166165 ) ( ON ?auto_2166167 ?auto_2166166 ) ( not ( = ?auto_2166157 ?auto_2166158 ) ) ( not ( = ?auto_2166157 ?auto_2166159 ) ) ( not ( = ?auto_2166157 ?auto_2166161 ) ) ( not ( = ?auto_2166157 ?auto_2166160 ) ) ( not ( = ?auto_2166157 ?auto_2166162 ) ) ( not ( = ?auto_2166157 ?auto_2166163 ) ) ( not ( = ?auto_2166157 ?auto_2166164 ) ) ( not ( = ?auto_2166157 ?auto_2166165 ) ) ( not ( = ?auto_2166157 ?auto_2166166 ) ) ( not ( = ?auto_2166157 ?auto_2166167 ) ) ( not ( = ?auto_2166157 ?auto_2166168 ) ) ( not ( = ?auto_2166157 ?auto_2166169 ) ) ( not ( = ?auto_2166157 ?auto_2166170 ) ) ( not ( = ?auto_2166158 ?auto_2166159 ) ) ( not ( = ?auto_2166158 ?auto_2166161 ) ) ( not ( = ?auto_2166158 ?auto_2166160 ) ) ( not ( = ?auto_2166158 ?auto_2166162 ) ) ( not ( = ?auto_2166158 ?auto_2166163 ) ) ( not ( = ?auto_2166158 ?auto_2166164 ) ) ( not ( = ?auto_2166158 ?auto_2166165 ) ) ( not ( = ?auto_2166158 ?auto_2166166 ) ) ( not ( = ?auto_2166158 ?auto_2166167 ) ) ( not ( = ?auto_2166158 ?auto_2166168 ) ) ( not ( = ?auto_2166158 ?auto_2166169 ) ) ( not ( = ?auto_2166158 ?auto_2166170 ) ) ( not ( = ?auto_2166159 ?auto_2166161 ) ) ( not ( = ?auto_2166159 ?auto_2166160 ) ) ( not ( = ?auto_2166159 ?auto_2166162 ) ) ( not ( = ?auto_2166159 ?auto_2166163 ) ) ( not ( = ?auto_2166159 ?auto_2166164 ) ) ( not ( = ?auto_2166159 ?auto_2166165 ) ) ( not ( = ?auto_2166159 ?auto_2166166 ) ) ( not ( = ?auto_2166159 ?auto_2166167 ) ) ( not ( = ?auto_2166159 ?auto_2166168 ) ) ( not ( = ?auto_2166159 ?auto_2166169 ) ) ( not ( = ?auto_2166159 ?auto_2166170 ) ) ( not ( = ?auto_2166161 ?auto_2166160 ) ) ( not ( = ?auto_2166161 ?auto_2166162 ) ) ( not ( = ?auto_2166161 ?auto_2166163 ) ) ( not ( = ?auto_2166161 ?auto_2166164 ) ) ( not ( = ?auto_2166161 ?auto_2166165 ) ) ( not ( = ?auto_2166161 ?auto_2166166 ) ) ( not ( = ?auto_2166161 ?auto_2166167 ) ) ( not ( = ?auto_2166161 ?auto_2166168 ) ) ( not ( = ?auto_2166161 ?auto_2166169 ) ) ( not ( = ?auto_2166161 ?auto_2166170 ) ) ( not ( = ?auto_2166160 ?auto_2166162 ) ) ( not ( = ?auto_2166160 ?auto_2166163 ) ) ( not ( = ?auto_2166160 ?auto_2166164 ) ) ( not ( = ?auto_2166160 ?auto_2166165 ) ) ( not ( = ?auto_2166160 ?auto_2166166 ) ) ( not ( = ?auto_2166160 ?auto_2166167 ) ) ( not ( = ?auto_2166160 ?auto_2166168 ) ) ( not ( = ?auto_2166160 ?auto_2166169 ) ) ( not ( = ?auto_2166160 ?auto_2166170 ) ) ( not ( = ?auto_2166162 ?auto_2166163 ) ) ( not ( = ?auto_2166162 ?auto_2166164 ) ) ( not ( = ?auto_2166162 ?auto_2166165 ) ) ( not ( = ?auto_2166162 ?auto_2166166 ) ) ( not ( = ?auto_2166162 ?auto_2166167 ) ) ( not ( = ?auto_2166162 ?auto_2166168 ) ) ( not ( = ?auto_2166162 ?auto_2166169 ) ) ( not ( = ?auto_2166162 ?auto_2166170 ) ) ( not ( = ?auto_2166163 ?auto_2166164 ) ) ( not ( = ?auto_2166163 ?auto_2166165 ) ) ( not ( = ?auto_2166163 ?auto_2166166 ) ) ( not ( = ?auto_2166163 ?auto_2166167 ) ) ( not ( = ?auto_2166163 ?auto_2166168 ) ) ( not ( = ?auto_2166163 ?auto_2166169 ) ) ( not ( = ?auto_2166163 ?auto_2166170 ) ) ( not ( = ?auto_2166164 ?auto_2166165 ) ) ( not ( = ?auto_2166164 ?auto_2166166 ) ) ( not ( = ?auto_2166164 ?auto_2166167 ) ) ( not ( = ?auto_2166164 ?auto_2166168 ) ) ( not ( = ?auto_2166164 ?auto_2166169 ) ) ( not ( = ?auto_2166164 ?auto_2166170 ) ) ( not ( = ?auto_2166165 ?auto_2166166 ) ) ( not ( = ?auto_2166165 ?auto_2166167 ) ) ( not ( = ?auto_2166165 ?auto_2166168 ) ) ( not ( = ?auto_2166165 ?auto_2166169 ) ) ( not ( = ?auto_2166165 ?auto_2166170 ) ) ( not ( = ?auto_2166166 ?auto_2166167 ) ) ( not ( = ?auto_2166166 ?auto_2166168 ) ) ( not ( = ?auto_2166166 ?auto_2166169 ) ) ( not ( = ?auto_2166166 ?auto_2166170 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2166167 ?auto_2166168 ?auto_2166169 )
      ( MAKE-12CRATE-VERIFY ?auto_2166157 ?auto_2166158 ?auto_2166159 ?auto_2166161 ?auto_2166160 ?auto_2166162 ?auto_2166163 ?auto_2166164 ?auto_2166165 ?auto_2166166 ?auto_2166167 ?auto_2166168 ?auto_2166169 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2177714 - SURFACE
      ?auto_2177715 - SURFACE
      ?auto_2177716 - SURFACE
      ?auto_2177718 - SURFACE
      ?auto_2177717 - SURFACE
      ?auto_2177719 - SURFACE
      ?auto_2177720 - SURFACE
      ?auto_2177721 - SURFACE
      ?auto_2177722 - SURFACE
      ?auto_2177723 - SURFACE
      ?auto_2177724 - SURFACE
      ?auto_2177725 - SURFACE
      ?auto_2177726 - SURFACE
      ?auto_2177727 - SURFACE
    )
    :vars
    (
      ?auto_2177728 - HOIST
      ?auto_2177729 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2177728 ?auto_2177729 ) ( SURFACE-AT ?auto_2177726 ?auto_2177729 ) ( CLEAR ?auto_2177726 ) ( LIFTING ?auto_2177728 ?auto_2177727 ) ( IS-CRATE ?auto_2177727 ) ( not ( = ?auto_2177726 ?auto_2177727 ) ) ( ON ?auto_2177715 ?auto_2177714 ) ( ON ?auto_2177716 ?auto_2177715 ) ( ON ?auto_2177718 ?auto_2177716 ) ( ON ?auto_2177717 ?auto_2177718 ) ( ON ?auto_2177719 ?auto_2177717 ) ( ON ?auto_2177720 ?auto_2177719 ) ( ON ?auto_2177721 ?auto_2177720 ) ( ON ?auto_2177722 ?auto_2177721 ) ( ON ?auto_2177723 ?auto_2177722 ) ( ON ?auto_2177724 ?auto_2177723 ) ( ON ?auto_2177725 ?auto_2177724 ) ( ON ?auto_2177726 ?auto_2177725 ) ( not ( = ?auto_2177714 ?auto_2177715 ) ) ( not ( = ?auto_2177714 ?auto_2177716 ) ) ( not ( = ?auto_2177714 ?auto_2177718 ) ) ( not ( = ?auto_2177714 ?auto_2177717 ) ) ( not ( = ?auto_2177714 ?auto_2177719 ) ) ( not ( = ?auto_2177714 ?auto_2177720 ) ) ( not ( = ?auto_2177714 ?auto_2177721 ) ) ( not ( = ?auto_2177714 ?auto_2177722 ) ) ( not ( = ?auto_2177714 ?auto_2177723 ) ) ( not ( = ?auto_2177714 ?auto_2177724 ) ) ( not ( = ?auto_2177714 ?auto_2177725 ) ) ( not ( = ?auto_2177714 ?auto_2177726 ) ) ( not ( = ?auto_2177714 ?auto_2177727 ) ) ( not ( = ?auto_2177715 ?auto_2177716 ) ) ( not ( = ?auto_2177715 ?auto_2177718 ) ) ( not ( = ?auto_2177715 ?auto_2177717 ) ) ( not ( = ?auto_2177715 ?auto_2177719 ) ) ( not ( = ?auto_2177715 ?auto_2177720 ) ) ( not ( = ?auto_2177715 ?auto_2177721 ) ) ( not ( = ?auto_2177715 ?auto_2177722 ) ) ( not ( = ?auto_2177715 ?auto_2177723 ) ) ( not ( = ?auto_2177715 ?auto_2177724 ) ) ( not ( = ?auto_2177715 ?auto_2177725 ) ) ( not ( = ?auto_2177715 ?auto_2177726 ) ) ( not ( = ?auto_2177715 ?auto_2177727 ) ) ( not ( = ?auto_2177716 ?auto_2177718 ) ) ( not ( = ?auto_2177716 ?auto_2177717 ) ) ( not ( = ?auto_2177716 ?auto_2177719 ) ) ( not ( = ?auto_2177716 ?auto_2177720 ) ) ( not ( = ?auto_2177716 ?auto_2177721 ) ) ( not ( = ?auto_2177716 ?auto_2177722 ) ) ( not ( = ?auto_2177716 ?auto_2177723 ) ) ( not ( = ?auto_2177716 ?auto_2177724 ) ) ( not ( = ?auto_2177716 ?auto_2177725 ) ) ( not ( = ?auto_2177716 ?auto_2177726 ) ) ( not ( = ?auto_2177716 ?auto_2177727 ) ) ( not ( = ?auto_2177718 ?auto_2177717 ) ) ( not ( = ?auto_2177718 ?auto_2177719 ) ) ( not ( = ?auto_2177718 ?auto_2177720 ) ) ( not ( = ?auto_2177718 ?auto_2177721 ) ) ( not ( = ?auto_2177718 ?auto_2177722 ) ) ( not ( = ?auto_2177718 ?auto_2177723 ) ) ( not ( = ?auto_2177718 ?auto_2177724 ) ) ( not ( = ?auto_2177718 ?auto_2177725 ) ) ( not ( = ?auto_2177718 ?auto_2177726 ) ) ( not ( = ?auto_2177718 ?auto_2177727 ) ) ( not ( = ?auto_2177717 ?auto_2177719 ) ) ( not ( = ?auto_2177717 ?auto_2177720 ) ) ( not ( = ?auto_2177717 ?auto_2177721 ) ) ( not ( = ?auto_2177717 ?auto_2177722 ) ) ( not ( = ?auto_2177717 ?auto_2177723 ) ) ( not ( = ?auto_2177717 ?auto_2177724 ) ) ( not ( = ?auto_2177717 ?auto_2177725 ) ) ( not ( = ?auto_2177717 ?auto_2177726 ) ) ( not ( = ?auto_2177717 ?auto_2177727 ) ) ( not ( = ?auto_2177719 ?auto_2177720 ) ) ( not ( = ?auto_2177719 ?auto_2177721 ) ) ( not ( = ?auto_2177719 ?auto_2177722 ) ) ( not ( = ?auto_2177719 ?auto_2177723 ) ) ( not ( = ?auto_2177719 ?auto_2177724 ) ) ( not ( = ?auto_2177719 ?auto_2177725 ) ) ( not ( = ?auto_2177719 ?auto_2177726 ) ) ( not ( = ?auto_2177719 ?auto_2177727 ) ) ( not ( = ?auto_2177720 ?auto_2177721 ) ) ( not ( = ?auto_2177720 ?auto_2177722 ) ) ( not ( = ?auto_2177720 ?auto_2177723 ) ) ( not ( = ?auto_2177720 ?auto_2177724 ) ) ( not ( = ?auto_2177720 ?auto_2177725 ) ) ( not ( = ?auto_2177720 ?auto_2177726 ) ) ( not ( = ?auto_2177720 ?auto_2177727 ) ) ( not ( = ?auto_2177721 ?auto_2177722 ) ) ( not ( = ?auto_2177721 ?auto_2177723 ) ) ( not ( = ?auto_2177721 ?auto_2177724 ) ) ( not ( = ?auto_2177721 ?auto_2177725 ) ) ( not ( = ?auto_2177721 ?auto_2177726 ) ) ( not ( = ?auto_2177721 ?auto_2177727 ) ) ( not ( = ?auto_2177722 ?auto_2177723 ) ) ( not ( = ?auto_2177722 ?auto_2177724 ) ) ( not ( = ?auto_2177722 ?auto_2177725 ) ) ( not ( = ?auto_2177722 ?auto_2177726 ) ) ( not ( = ?auto_2177722 ?auto_2177727 ) ) ( not ( = ?auto_2177723 ?auto_2177724 ) ) ( not ( = ?auto_2177723 ?auto_2177725 ) ) ( not ( = ?auto_2177723 ?auto_2177726 ) ) ( not ( = ?auto_2177723 ?auto_2177727 ) ) ( not ( = ?auto_2177724 ?auto_2177725 ) ) ( not ( = ?auto_2177724 ?auto_2177726 ) ) ( not ( = ?auto_2177724 ?auto_2177727 ) ) ( not ( = ?auto_2177725 ?auto_2177726 ) ) ( not ( = ?auto_2177725 ?auto_2177727 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2177726 ?auto_2177727 )
      ( MAKE-13CRATE-VERIFY ?auto_2177714 ?auto_2177715 ?auto_2177716 ?auto_2177718 ?auto_2177717 ?auto_2177719 ?auto_2177720 ?auto_2177721 ?auto_2177722 ?auto_2177723 ?auto_2177724 ?auto_2177725 ?auto_2177726 ?auto_2177727 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2177856 - SURFACE
      ?auto_2177857 - SURFACE
      ?auto_2177858 - SURFACE
      ?auto_2177860 - SURFACE
      ?auto_2177859 - SURFACE
      ?auto_2177861 - SURFACE
      ?auto_2177862 - SURFACE
      ?auto_2177863 - SURFACE
      ?auto_2177864 - SURFACE
      ?auto_2177865 - SURFACE
      ?auto_2177866 - SURFACE
      ?auto_2177867 - SURFACE
      ?auto_2177868 - SURFACE
      ?auto_2177869 - SURFACE
    )
    :vars
    (
      ?auto_2177870 - HOIST
      ?auto_2177872 - PLACE
      ?auto_2177871 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2177870 ?auto_2177872 ) ( SURFACE-AT ?auto_2177868 ?auto_2177872 ) ( CLEAR ?auto_2177868 ) ( IS-CRATE ?auto_2177869 ) ( not ( = ?auto_2177868 ?auto_2177869 ) ) ( TRUCK-AT ?auto_2177871 ?auto_2177872 ) ( AVAILABLE ?auto_2177870 ) ( IN ?auto_2177869 ?auto_2177871 ) ( ON ?auto_2177868 ?auto_2177867 ) ( not ( = ?auto_2177867 ?auto_2177868 ) ) ( not ( = ?auto_2177867 ?auto_2177869 ) ) ( ON ?auto_2177857 ?auto_2177856 ) ( ON ?auto_2177858 ?auto_2177857 ) ( ON ?auto_2177860 ?auto_2177858 ) ( ON ?auto_2177859 ?auto_2177860 ) ( ON ?auto_2177861 ?auto_2177859 ) ( ON ?auto_2177862 ?auto_2177861 ) ( ON ?auto_2177863 ?auto_2177862 ) ( ON ?auto_2177864 ?auto_2177863 ) ( ON ?auto_2177865 ?auto_2177864 ) ( ON ?auto_2177866 ?auto_2177865 ) ( ON ?auto_2177867 ?auto_2177866 ) ( not ( = ?auto_2177856 ?auto_2177857 ) ) ( not ( = ?auto_2177856 ?auto_2177858 ) ) ( not ( = ?auto_2177856 ?auto_2177860 ) ) ( not ( = ?auto_2177856 ?auto_2177859 ) ) ( not ( = ?auto_2177856 ?auto_2177861 ) ) ( not ( = ?auto_2177856 ?auto_2177862 ) ) ( not ( = ?auto_2177856 ?auto_2177863 ) ) ( not ( = ?auto_2177856 ?auto_2177864 ) ) ( not ( = ?auto_2177856 ?auto_2177865 ) ) ( not ( = ?auto_2177856 ?auto_2177866 ) ) ( not ( = ?auto_2177856 ?auto_2177867 ) ) ( not ( = ?auto_2177856 ?auto_2177868 ) ) ( not ( = ?auto_2177856 ?auto_2177869 ) ) ( not ( = ?auto_2177857 ?auto_2177858 ) ) ( not ( = ?auto_2177857 ?auto_2177860 ) ) ( not ( = ?auto_2177857 ?auto_2177859 ) ) ( not ( = ?auto_2177857 ?auto_2177861 ) ) ( not ( = ?auto_2177857 ?auto_2177862 ) ) ( not ( = ?auto_2177857 ?auto_2177863 ) ) ( not ( = ?auto_2177857 ?auto_2177864 ) ) ( not ( = ?auto_2177857 ?auto_2177865 ) ) ( not ( = ?auto_2177857 ?auto_2177866 ) ) ( not ( = ?auto_2177857 ?auto_2177867 ) ) ( not ( = ?auto_2177857 ?auto_2177868 ) ) ( not ( = ?auto_2177857 ?auto_2177869 ) ) ( not ( = ?auto_2177858 ?auto_2177860 ) ) ( not ( = ?auto_2177858 ?auto_2177859 ) ) ( not ( = ?auto_2177858 ?auto_2177861 ) ) ( not ( = ?auto_2177858 ?auto_2177862 ) ) ( not ( = ?auto_2177858 ?auto_2177863 ) ) ( not ( = ?auto_2177858 ?auto_2177864 ) ) ( not ( = ?auto_2177858 ?auto_2177865 ) ) ( not ( = ?auto_2177858 ?auto_2177866 ) ) ( not ( = ?auto_2177858 ?auto_2177867 ) ) ( not ( = ?auto_2177858 ?auto_2177868 ) ) ( not ( = ?auto_2177858 ?auto_2177869 ) ) ( not ( = ?auto_2177860 ?auto_2177859 ) ) ( not ( = ?auto_2177860 ?auto_2177861 ) ) ( not ( = ?auto_2177860 ?auto_2177862 ) ) ( not ( = ?auto_2177860 ?auto_2177863 ) ) ( not ( = ?auto_2177860 ?auto_2177864 ) ) ( not ( = ?auto_2177860 ?auto_2177865 ) ) ( not ( = ?auto_2177860 ?auto_2177866 ) ) ( not ( = ?auto_2177860 ?auto_2177867 ) ) ( not ( = ?auto_2177860 ?auto_2177868 ) ) ( not ( = ?auto_2177860 ?auto_2177869 ) ) ( not ( = ?auto_2177859 ?auto_2177861 ) ) ( not ( = ?auto_2177859 ?auto_2177862 ) ) ( not ( = ?auto_2177859 ?auto_2177863 ) ) ( not ( = ?auto_2177859 ?auto_2177864 ) ) ( not ( = ?auto_2177859 ?auto_2177865 ) ) ( not ( = ?auto_2177859 ?auto_2177866 ) ) ( not ( = ?auto_2177859 ?auto_2177867 ) ) ( not ( = ?auto_2177859 ?auto_2177868 ) ) ( not ( = ?auto_2177859 ?auto_2177869 ) ) ( not ( = ?auto_2177861 ?auto_2177862 ) ) ( not ( = ?auto_2177861 ?auto_2177863 ) ) ( not ( = ?auto_2177861 ?auto_2177864 ) ) ( not ( = ?auto_2177861 ?auto_2177865 ) ) ( not ( = ?auto_2177861 ?auto_2177866 ) ) ( not ( = ?auto_2177861 ?auto_2177867 ) ) ( not ( = ?auto_2177861 ?auto_2177868 ) ) ( not ( = ?auto_2177861 ?auto_2177869 ) ) ( not ( = ?auto_2177862 ?auto_2177863 ) ) ( not ( = ?auto_2177862 ?auto_2177864 ) ) ( not ( = ?auto_2177862 ?auto_2177865 ) ) ( not ( = ?auto_2177862 ?auto_2177866 ) ) ( not ( = ?auto_2177862 ?auto_2177867 ) ) ( not ( = ?auto_2177862 ?auto_2177868 ) ) ( not ( = ?auto_2177862 ?auto_2177869 ) ) ( not ( = ?auto_2177863 ?auto_2177864 ) ) ( not ( = ?auto_2177863 ?auto_2177865 ) ) ( not ( = ?auto_2177863 ?auto_2177866 ) ) ( not ( = ?auto_2177863 ?auto_2177867 ) ) ( not ( = ?auto_2177863 ?auto_2177868 ) ) ( not ( = ?auto_2177863 ?auto_2177869 ) ) ( not ( = ?auto_2177864 ?auto_2177865 ) ) ( not ( = ?auto_2177864 ?auto_2177866 ) ) ( not ( = ?auto_2177864 ?auto_2177867 ) ) ( not ( = ?auto_2177864 ?auto_2177868 ) ) ( not ( = ?auto_2177864 ?auto_2177869 ) ) ( not ( = ?auto_2177865 ?auto_2177866 ) ) ( not ( = ?auto_2177865 ?auto_2177867 ) ) ( not ( = ?auto_2177865 ?auto_2177868 ) ) ( not ( = ?auto_2177865 ?auto_2177869 ) ) ( not ( = ?auto_2177866 ?auto_2177867 ) ) ( not ( = ?auto_2177866 ?auto_2177868 ) ) ( not ( = ?auto_2177866 ?auto_2177869 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2177867 ?auto_2177868 ?auto_2177869 )
      ( MAKE-13CRATE-VERIFY ?auto_2177856 ?auto_2177857 ?auto_2177858 ?auto_2177860 ?auto_2177859 ?auto_2177861 ?auto_2177862 ?auto_2177863 ?auto_2177864 ?auto_2177865 ?auto_2177866 ?auto_2177867 ?auto_2177868 ?auto_2177869 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2178012 - SURFACE
      ?auto_2178013 - SURFACE
      ?auto_2178014 - SURFACE
      ?auto_2178016 - SURFACE
      ?auto_2178015 - SURFACE
      ?auto_2178017 - SURFACE
      ?auto_2178018 - SURFACE
      ?auto_2178019 - SURFACE
      ?auto_2178020 - SURFACE
      ?auto_2178021 - SURFACE
      ?auto_2178022 - SURFACE
      ?auto_2178023 - SURFACE
      ?auto_2178024 - SURFACE
      ?auto_2178025 - SURFACE
    )
    :vars
    (
      ?auto_2178026 - HOIST
      ?auto_2178028 - PLACE
      ?auto_2178027 - TRUCK
      ?auto_2178029 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2178026 ?auto_2178028 ) ( SURFACE-AT ?auto_2178024 ?auto_2178028 ) ( CLEAR ?auto_2178024 ) ( IS-CRATE ?auto_2178025 ) ( not ( = ?auto_2178024 ?auto_2178025 ) ) ( AVAILABLE ?auto_2178026 ) ( IN ?auto_2178025 ?auto_2178027 ) ( ON ?auto_2178024 ?auto_2178023 ) ( not ( = ?auto_2178023 ?auto_2178024 ) ) ( not ( = ?auto_2178023 ?auto_2178025 ) ) ( TRUCK-AT ?auto_2178027 ?auto_2178029 ) ( not ( = ?auto_2178029 ?auto_2178028 ) ) ( ON ?auto_2178013 ?auto_2178012 ) ( ON ?auto_2178014 ?auto_2178013 ) ( ON ?auto_2178016 ?auto_2178014 ) ( ON ?auto_2178015 ?auto_2178016 ) ( ON ?auto_2178017 ?auto_2178015 ) ( ON ?auto_2178018 ?auto_2178017 ) ( ON ?auto_2178019 ?auto_2178018 ) ( ON ?auto_2178020 ?auto_2178019 ) ( ON ?auto_2178021 ?auto_2178020 ) ( ON ?auto_2178022 ?auto_2178021 ) ( ON ?auto_2178023 ?auto_2178022 ) ( not ( = ?auto_2178012 ?auto_2178013 ) ) ( not ( = ?auto_2178012 ?auto_2178014 ) ) ( not ( = ?auto_2178012 ?auto_2178016 ) ) ( not ( = ?auto_2178012 ?auto_2178015 ) ) ( not ( = ?auto_2178012 ?auto_2178017 ) ) ( not ( = ?auto_2178012 ?auto_2178018 ) ) ( not ( = ?auto_2178012 ?auto_2178019 ) ) ( not ( = ?auto_2178012 ?auto_2178020 ) ) ( not ( = ?auto_2178012 ?auto_2178021 ) ) ( not ( = ?auto_2178012 ?auto_2178022 ) ) ( not ( = ?auto_2178012 ?auto_2178023 ) ) ( not ( = ?auto_2178012 ?auto_2178024 ) ) ( not ( = ?auto_2178012 ?auto_2178025 ) ) ( not ( = ?auto_2178013 ?auto_2178014 ) ) ( not ( = ?auto_2178013 ?auto_2178016 ) ) ( not ( = ?auto_2178013 ?auto_2178015 ) ) ( not ( = ?auto_2178013 ?auto_2178017 ) ) ( not ( = ?auto_2178013 ?auto_2178018 ) ) ( not ( = ?auto_2178013 ?auto_2178019 ) ) ( not ( = ?auto_2178013 ?auto_2178020 ) ) ( not ( = ?auto_2178013 ?auto_2178021 ) ) ( not ( = ?auto_2178013 ?auto_2178022 ) ) ( not ( = ?auto_2178013 ?auto_2178023 ) ) ( not ( = ?auto_2178013 ?auto_2178024 ) ) ( not ( = ?auto_2178013 ?auto_2178025 ) ) ( not ( = ?auto_2178014 ?auto_2178016 ) ) ( not ( = ?auto_2178014 ?auto_2178015 ) ) ( not ( = ?auto_2178014 ?auto_2178017 ) ) ( not ( = ?auto_2178014 ?auto_2178018 ) ) ( not ( = ?auto_2178014 ?auto_2178019 ) ) ( not ( = ?auto_2178014 ?auto_2178020 ) ) ( not ( = ?auto_2178014 ?auto_2178021 ) ) ( not ( = ?auto_2178014 ?auto_2178022 ) ) ( not ( = ?auto_2178014 ?auto_2178023 ) ) ( not ( = ?auto_2178014 ?auto_2178024 ) ) ( not ( = ?auto_2178014 ?auto_2178025 ) ) ( not ( = ?auto_2178016 ?auto_2178015 ) ) ( not ( = ?auto_2178016 ?auto_2178017 ) ) ( not ( = ?auto_2178016 ?auto_2178018 ) ) ( not ( = ?auto_2178016 ?auto_2178019 ) ) ( not ( = ?auto_2178016 ?auto_2178020 ) ) ( not ( = ?auto_2178016 ?auto_2178021 ) ) ( not ( = ?auto_2178016 ?auto_2178022 ) ) ( not ( = ?auto_2178016 ?auto_2178023 ) ) ( not ( = ?auto_2178016 ?auto_2178024 ) ) ( not ( = ?auto_2178016 ?auto_2178025 ) ) ( not ( = ?auto_2178015 ?auto_2178017 ) ) ( not ( = ?auto_2178015 ?auto_2178018 ) ) ( not ( = ?auto_2178015 ?auto_2178019 ) ) ( not ( = ?auto_2178015 ?auto_2178020 ) ) ( not ( = ?auto_2178015 ?auto_2178021 ) ) ( not ( = ?auto_2178015 ?auto_2178022 ) ) ( not ( = ?auto_2178015 ?auto_2178023 ) ) ( not ( = ?auto_2178015 ?auto_2178024 ) ) ( not ( = ?auto_2178015 ?auto_2178025 ) ) ( not ( = ?auto_2178017 ?auto_2178018 ) ) ( not ( = ?auto_2178017 ?auto_2178019 ) ) ( not ( = ?auto_2178017 ?auto_2178020 ) ) ( not ( = ?auto_2178017 ?auto_2178021 ) ) ( not ( = ?auto_2178017 ?auto_2178022 ) ) ( not ( = ?auto_2178017 ?auto_2178023 ) ) ( not ( = ?auto_2178017 ?auto_2178024 ) ) ( not ( = ?auto_2178017 ?auto_2178025 ) ) ( not ( = ?auto_2178018 ?auto_2178019 ) ) ( not ( = ?auto_2178018 ?auto_2178020 ) ) ( not ( = ?auto_2178018 ?auto_2178021 ) ) ( not ( = ?auto_2178018 ?auto_2178022 ) ) ( not ( = ?auto_2178018 ?auto_2178023 ) ) ( not ( = ?auto_2178018 ?auto_2178024 ) ) ( not ( = ?auto_2178018 ?auto_2178025 ) ) ( not ( = ?auto_2178019 ?auto_2178020 ) ) ( not ( = ?auto_2178019 ?auto_2178021 ) ) ( not ( = ?auto_2178019 ?auto_2178022 ) ) ( not ( = ?auto_2178019 ?auto_2178023 ) ) ( not ( = ?auto_2178019 ?auto_2178024 ) ) ( not ( = ?auto_2178019 ?auto_2178025 ) ) ( not ( = ?auto_2178020 ?auto_2178021 ) ) ( not ( = ?auto_2178020 ?auto_2178022 ) ) ( not ( = ?auto_2178020 ?auto_2178023 ) ) ( not ( = ?auto_2178020 ?auto_2178024 ) ) ( not ( = ?auto_2178020 ?auto_2178025 ) ) ( not ( = ?auto_2178021 ?auto_2178022 ) ) ( not ( = ?auto_2178021 ?auto_2178023 ) ) ( not ( = ?auto_2178021 ?auto_2178024 ) ) ( not ( = ?auto_2178021 ?auto_2178025 ) ) ( not ( = ?auto_2178022 ?auto_2178023 ) ) ( not ( = ?auto_2178022 ?auto_2178024 ) ) ( not ( = ?auto_2178022 ?auto_2178025 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2178023 ?auto_2178024 ?auto_2178025 )
      ( MAKE-13CRATE-VERIFY ?auto_2178012 ?auto_2178013 ?auto_2178014 ?auto_2178016 ?auto_2178015 ?auto_2178017 ?auto_2178018 ?auto_2178019 ?auto_2178020 ?auto_2178021 ?auto_2178022 ?auto_2178023 ?auto_2178024 ?auto_2178025 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2178181 - SURFACE
      ?auto_2178182 - SURFACE
      ?auto_2178183 - SURFACE
      ?auto_2178185 - SURFACE
      ?auto_2178184 - SURFACE
      ?auto_2178186 - SURFACE
      ?auto_2178187 - SURFACE
      ?auto_2178188 - SURFACE
      ?auto_2178189 - SURFACE
      ?auto_2178190 - SURFACE
      ?auto_2178191 - SURFACE
      ?auto_2178192 - SURFACE
      ?auto_2178193 - SURFACE
      ?auto_2178194 - SURFACE
    )
    :vars
    (
      ?auto_2178197 - HOIST
      ?auto_2178199 - PLACE
      ?auto_2178195 - TRUCK
      ?auto_2178198 - PLACE
      ?auto_2178196 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2178197 ?auto_2178199 ) ( SURFACE-AT ?auto_2178193 ?auto_2178199 ) ( CLEAR ?auto_2178193 ) ( IS-CRATE ?auto_2178194 ) ( not ( = ?auto_2178193 ?auto_2178194 ) ) ( AVAILABLE ?auto_2178197 ) ( ON ?auto_2178193 ?auto_2178192 ) ( not ( = ?auto_2178192 ?auto_2178193 ) ) ( not ( = ?auto_2178192 ?auto_2178194 ) ) ( TRUCK-AT ?auto_2178195 ?auto_2178198 ) ( not ( = ?auto_2178198 ?auto_2178199 ) ) ( HOIST-AT ?auto_2178196 ?auto_2178198 ) ( LIFTING ?auto_2178196 ?auto_2178194 ) ( not ( = ?auto_2178197 ?auto_2178196 ) ) ( ON ?auto_2178182 ?auto_2178181 ) ( ON ?auto_2178183 ?auto_2178182 ) ( ON ?auto_2178185 ?auto_2178183 ) ( ON ?auto_2178184 ?auto_2178185 ) ( ON ?auto_2178186 ?auto_2178184 ) ( ON ?auto_2178187 ?auto_2178186 ) ( ON ?auto_2178188 ?auto_2178187 ) ( ON ?auto_2178189 ?auto_2178188 ) ( ON ?auto_2178190 ?auto_2178189 ) ( ON ?auto_2178191 ?auto_2178190 ) ( ON ?auto_2178192 ?auto_2178191 ) ( not ( = ?auto_2178181 ?auto_2178182 ) ) ( not ( = ?auto_2178181 ?auto_2178183 ) ) ( not ( = ?auto_2178181 ?auto_2178185 ) ) ( not ( = ?auto_2178181 ?auto_2178184 ) ) ( not ( = ?auto_2178181 ?auto_2178186 ) ) ( not ( = ?auto_2178181 ?auto_2178187 ) ) ( not ( = ?auto_2178181 ?auto_2178188 ) ) ( not ( = ?auto_2178181 ?auto_2178189 ) ) ( not ( = ?auto_2178181 ?auto_2178190 ) ) ( not ( = ?auto_2178181 ?auto_2178191 ) ) ( not ( = ?auto_2178181 ?auto_2178192 ) ) ( not ( = ?auto_2178181 ?auto_2178193 ) ) ( not ( = ?auto_2178181 ?auto_2178194 ) ) ( not ( = ?auto_2178182 ?auto_2178183 ) ) ( not ( = ?auto_2178182 ?auto_2178185 ) ) ( not ( = ?auto_2178182 ?auto_2178184 ) ) ( not ( = ?auto_2178182 ?auto_2178186 ) ) ( not ( = ?auto_2178182 ?auto_2178187 ) ) ( not ( = ?auto_2178182 ?auto_2178188 ) ) ( not ( = ?auto_2178182 ?auto_2178189 ) ) ( not ( = ?auto_2178182 ?auto_2178190 ) ) ( not ( = ?auto_2178182 ?auto_2178191 ) ) ( not ( = ?auto_2178182 ?auto_2178192 ) ) ( not ( = ?auto_2178182 ?auto_2178193 ) ) ( not ( = ?auto_2178182 ?auto_2178194 ) ) ( not ( = ?auto_2178183 ?auto_2178185 ) ) ( not ( = ?auto_2178183 ?auto_2178184 ) ) ( not ( = ?auto_2178183 ?auto_2178186 ) ) ( not ( = ?auto_2178183 ?auto_2178187 ) ) ( not ( = ?auto_2178183 ?auto_2178188 ) ) ( not ( = ?auto_2178183 ?auto_2178189 ) ) ( not ( = ?auto_2178183 ?auto_2178190 ) ) ( not ( = ?auto_2178183 ?auto_2178191 ) ) ( not ( = ?auto_2178183 ?auto_2178192 ) ) ( not ( = ?auto_2178183 ?auto_2178193 ) ) ( not ( = ?auto_2178183 ?auto_2178194 ) ) ( not ( = ?auto_2178185 ?auto_2178184 ) ) ( not ( = ?auto_2178185 ?auto_2178186 ) ) ( not ( = ?auto_2178185 ?auto_2178187 ) ) ( not ( = ?auto_2178185 ?auto_2178188 ) ) ( not ( = ?auto_2178185 ?auto_2178189 ) ) ( not ( = ?auto_2178185 ?auto_2178190 ) ) ( not ( = ?auto_2178185 ?auto_2178191 ) ) ( not ( = ?auto_2178185 ?auto_2178192 ) ) ( not ( = ?auto_2178185 ?auto_2178193 ) ) ( not ( = ?auto_2178185 ?auto_2178194 ) ) ( not ( = ?auto_2178184 ?auto_2178186 ) ) ( not ( = ?auto_2178184 ?auto_2178187 ) ) ( not ( = ?auto_2178184 ?auto_2178188 ) ) ( not ( = ?auto_2178184 ?auto_2178189 ) ) ( not ( = ?auto_2178184 ?auto_2178190 ) ) ( not ( = ?auto_2178184 ?auto_2178191 ) ) ( not ( = ?auto_2178184 ?auto_2178192 ) ) ( not ( = ?auto_2178184 ?auto_2178193 ) ) ( not ( = ?auto_2178184 ?auto_2178194 ) ) ( not ( = ?auto_2178186 ?auto_2178187 ) ) ( not ( = ?auto_2178186 ?auto_2178188 ) ) ( not ( = ?auto_2178186 ?auto_2178189 ) ) ( not ( = ?auto_2178186 ?auto_2178190 ) ) ( not ( = ?auto_2178186 ?auto_2178191 ) ) ( not ( = ?auto_2178186 ?auto_2178192 ) ) ( not ( = ?auto_2178186 ?auto_2178193 ) ) ( not ( = ?auto_2178186 ?auto_2178194 ) ) ( not ( = ?auto_2178187 ?auto_2178188 ) ) ( not ( = ?auto_2178187 ?auto_2178189 ) ) ( not ( = ?auto_2178187 ?auto_2178190 ) ) ( not ( = ?auto_2178187 ?auto_2178191 ) ) ( not ( = ?auto_2178187 ?auto_2178192 ) ) ( not ( = ?auto_2178187 ?auto_2178193 ) ) ( not ( = ?auto_2178187 ?auto_2178194 ) ) ( not ( = ?auto_2178188 ?auto_2178189 ) ) ( not ( = ?auto_2178188 ?auto_2178190 ) ) ( not ( = ?auto_2178188 ?auto_2178191 ) ) ( not ( = ?auto_2178188 ?auto_2178192 ) ) ( not ( = ?auto_2178188 ?auto_2178193 ) ) ( not ( = ?auto_2178188 ?auto_2178194 ) ) ( not ( = ?auto_2178189 ?auto_2178190 ) ) ( not ( = ?auto_2178189 ?auto_2178191 ) ) ( not ( = ?auto_2178189 ?auto_2178192 ) ) ( not ( = ?auto_2178189 ?auto_2178193 ) ) ( not ( = ?auto_2178189 ?auto_2178194 ) ) ( not ( = ?auto_2178190 ?auto_2178191 ) ) ( not ( = ?auto_2178190 ?auto_2178192 ) ) ( not ( = ?auto_2178190 ?auto_2178193 ) ) ( not ( = ?auto_2178190 ?auto_2178194 ) ) ( not ( = ?auto_2178191 ?auto_2178192 ) ) ( not ( = ?auto_2178191 ?auto_2178193 ) ) ( not ( = ?auto_2178191 ?auto_2178194 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2178192 ?auto_2178193 ?auto_2178194 )
      ( MAKE-13CRATE-VERIFY ?auto_2178181 ?auto_2178182 ?auto_2178183 ?auto_2178185 ?auto_2178184 ?auto_2178186 ?auto_2178187 ?auto_2178188 ?auto_2178189 ?auto_2178190 ?auto_2178191 ?auto_2178192 ?auto_2178193 ?auto_2178194 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2178363 - SURFACE
      ?auto_2178364 - SURFACE
      ?auto_2178365 - SURFACE
      ?auto_2178367 - SURFACE
      ?auto_2178366 - SURFACE
      ?auto_2178368 - SURFACE
      ?auto_2178369 - SURFACE
      ?auto_2178370 - SURFACE
      ?auto_2178371 - SURFACE
      ?auto_2178372 - SURFACE
      ?auto_2178373 - SURFACE
      ?auto_2178374 - SURFACE
      ?auto_2178375 - SURFACE
      ?auto_2178376 - SURFACE
    )
    :vars
    (
      ?auto_2178380 - HOIST
      ?auto_2178377 - PLACE
      ?auto_2178378 - TRUCK
      ?auto_2178382 - PLACE
      ?auto_2178379 - HOIST
      ?auto_2178381 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2178380 ?auto_2178377 ) ( SURFACE-AT ?auto_2178375 ?auto_2178377 ) ( CLEAR ?auto_2178375 ) ( IS-CRATE ?auto_2178376 ) ( not ( = ?auto_2178375 ?auto_2178376 ) ) ( AVAILABLE ?auto_2178380 ) ( ON ?auto_2178375 ?auto_2178374 ) ( not ( = ?auto_2178374 ?auto_2178375 ) ) ( not ( = ?auto_2178374 ?auto_2178376 ) ) ( TRUCK-AT ?auto_2178378 ?auto_2178382 ) ( not ( = ?auto_2178382 ?auto_2178377 ) ) ( HOIST-AT ?auto_2178379 ?auto_2178382 ) ( not ( = ?auto_2178380 ?auto_2178379 ) ) ( AVAILABLE ?auto_2178379 ) ( SURFACE-AT ?auto_2178376 ?auto_2178382 ) ( ON ?auto_2178376 ?auto_2178381 ) ( CLEAR ?auto_2178376 ) ( not ( = ?auto_2178375 ?auto_2178381 ) ) ( not ( = ?auto_2178376 ?auto_2178381 ) ) ( not ( = ?auto_2178374 ?auto_2178381 ) ) ( ON ?auto_2178364 ?auto_2178363 ) ( ON ?auto_2178365 ?auto_2178364 ) ( ON ?auto_2178367 ?auto_2178365 ) ( ON ?auto_2178366 ?auto_2178367 ) ( ON ?auto_2178368 ?auto_2178366 ) ( ON ?auto_2178369 ?auto_2178368 ) ( ON ?auto_2178370 ?auto_2178369 ) ( ON ?auto_2178371 ?auto_2178370 ) ( ON ?auto_2178372 ?auto_2178371 ) ( ON ?auto_2178373 ?auto_2178372 ) ( ON ?auto_2178374 ?auto_2178373 ) ( not ( = ?auto_2178363 ?auto_2178364 ) ) ( not ( = ?auto_2178363 ?auto_2178365 ) ) ( not ( = ?auto_2178363 ?auto_2178367 ) ) ( not ( = ?auto_2178363 ?auto_2178366 ) ) ( not ( = ?auto_2178363 ?auto_2178368 ) ) ( not ( = ?auto_2178363 ?auto_2178369 ) ) ( not ( = ?auto_2178363 ?auto_2178370 ) ) ( not ( = ?auto_2178363 ?auto_2178371 ) ) ( not ( = ?auto_2178363 ?auto_2178372 ) ) ( not ( = ?auto_2178363 ?auto_2178373 ) ) ( not ( = ?auto_2178363 ?auto_2178374 ) ) ( not ( = ?auto_2178363 ?auto_2178375 ) ) ( not ( = ?auto_2178363 ?auto_2178376 ) ) ( not ( = ?auto_2178363 ?auto_2178381 ) ) ( not ( = ?auto_2178364 ?auto_2178365 ) ) ( not ( = ?auto_2178364 ?auto_2178367 ) ) ( not ( = ?auto_2178364 ?auto_2178366 ) ) ( not ( = ?auto_2178364 ?auto_2178368 ) ) ( not ( = ?auto_2178364 ?auto_2178369 ) ) ( not ( = ?auto_2178364 ?auto_2178370 ) ) ( not ( = ?auto_2178364 ?auto_2178371 ) ) ( not ( = ?auto_2178364 ?auto_2178372 ) ) ( not ( = ?auto_2178364 ?auto_2178373 ) ) ( not ( = ?auto_2178364 ?auto_2178374 ) ) ( not ( = ?auto_2178364 ?auto_2178375 ) ) ( not ( = ?auto_2178364 ?auto_2178376 ) ) ( not ( = ?auto_2178364 ?auto_2178381 ) ) ( not ( = ?auto_2178365 ?auto_2178367 ) ) ( not ( = ?auto_2178365 ?auto_2178366 ) ) ( not ( = ?auto_2178365 ?auto_2178368 ) ) ( not ( = ?auto_2178365 ?auto_2178369 ) ) ( not ( = ?auto_2178365 ?auto_2178370 ) ) ( not ( = ?auto_2178365 ?auto_2178371 ) ) ( not ( = ?auto_2178365 ?auto_2178372 ) ) ( not ( = ?auto_2178365 ?auto_2178373 ) ) ( not ( = ?auto_2178365 ?auto_2178374 ) ) ( not ( = ?auto_2178365 ?auto_2178375 ) ) ( not ( = ?auto_2178365 ?auto_2178376 ) ) ( not ( = ?auto_2178365 ?auto_2178381 ) ) ( not ( = ?auto_2178367 ?auto_2178366 ) ) ( not ( = ?auto_2178367 ?auto_2178368 ) ) ( not ( = ?auto_2178367 ?auto_2178369 ) ) ( not ( = ?auto_2178367 ?auto_2178370 ) ) ( not ( = ?auto_2178367 ?auto_2178371 ) ) ( not ( = ?auto_2178367 ?auto_2178372 ) ) ( not ( = ?auto_2178367 ?auto_2178373 ) ) ( not ( = ?auto_2178367 ?auto_2178374 ) ) ( not ( = ?auto_2178367 ?auto_2178375 ) ) ( not ( = ?auto_2178367 ?auto_2178376 ) ) ( not ( = ?auto_2178367 ?auto_2178381 ) ) ( not ( = ?auto_2178366 ?auto_2178368 ) ) ( not ( = ?auto_2178366 ?auto_2178369 ) ) ( not ( = ?auto_2178366 ?auto_2178370 ) ) ( not ( = ?auto_2178366 ?auto_2178371 ) ) ( not ( = ?auto_2178366 ?auto_2178372 ) ) ( not ( = ?auto_2178366 ?auto_2178373 ) ) ( not ( = ?auto_2178366 ?auto_2178374 ) ) ( not ( = ?auto_2178366 ?auto_2178375 ) ) ( not ( = ?auto_2178366 ?auto_2178376 ) ) ( not ( = ?auto_2178366 ?auto_2178381 ) ) ( not ( = ?auto_2178368 ?auto_2178369 ) ) ( not ( = ?auto_2178368 ?auto_2178370 ) ) ( not ( = ?auto_2178368 ?auto_2178371 ) ) ( not ( = ?auto_2178368 ?auto_2178372 ) ) ( not ( = ?auto_2178368 ?auto_2178373 ) ) ( not ( = ?auto_2178368 ?auto_2178374 ) ) ( not ( = ?auto_2178368 ?auto_2178375 ) ) ( not ( = ?auto_2178368 ?auto_2178376 ) ) ( not ( = ?auto_2178368 ?auto_2178381 ) ) ( not ( = ?auto_2178369 ?auto_2178370 ) ) ( not ( = ?auto_2178369 ?auto_2178371 ) ) ( not ( = ?auto_2178369 ?auto_2178372 ) ) ( not ( = ?auto_2178369 ?auto_2178373 ) ) ( not ( = ?auto_2178369 ?auto_2178374 ) ) ( not ( = ?auto_2178369 ?auto_2178375 ) ) ( not ( = ?auto_2178369 ?auto_2178376 ) ) ( not ( = ?auto_2178369 ?auto_2178381 ) ) ( not ( = ?auto_2178370 ?auto_2178371 ) ) ( not ( = ?auto_2178370 ?auto_2178372 ) ) ( not ( = ?auto_2178370 ?auto_2178373 ) ) ( not ( = ?auto_2178370 ?auto_2178374 ) ) ( not ( = ?auto_2178370 ?auto_2178375 ) ) ( not ( = ?auto_2178370 ?auto_2178376 ) ) ( not ( = ?auto_2178370 ?auto_2178381 ) ) ( not ( = ?auto_2178371 ?auto_2178372 ) ) ( not ( = ?auto_2178371 ?auto_2178373 ) ) ( not ( = ?auto_2178371 ?auto_2178374 ) ) ( not ( = ?auto_2178371 ?auto_2178375 ) ) ( not ( = ?auto_2178371 ?auto_2178376 ) ) ( not ( = ?auto_2178371 ?auto_2178381 ) ) ( not ( = ?auto_2178372 ?auto_2178373 ) ) ( not ( = ?auto_2178372 ?auto_2178374 ) ) ( not ( = ?auto_2178372 ?auto_2178375 ) ) ( not ( = ?auto_2178372 ?auto_2178376 ) ) ( not ( = ?auto_2178372 ?auto_2178381 ) ) ( not ( = ?auto_2178373 ?auto_2178374 ) ) ( not ( = ?auto_2178373 ?auto_2178375 ) ) ( not ( = ?auto_2178373 ?auto_2178376 ) ) ( not ( = ?auto_2178373 ?auto_2178381 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2178374 ?auto_2178375 ?auto_2178376 )
      ( MAKE-13CRATE-VERIFY ?auto_2178363 ?auto_2178364 ?auto_2178365 ?auto_2178367 ?auto_2178366 ?auto_2178368 ?auto_2178369 ?auto_2178370 ?auto_2178371 ?auto_2178372 ?auto_2178373 ?auto_2178374 ?auto_2178375 ?auto_2178376 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2178546 - SURFACE
      ?auto_2178547 - SURFACE
      ?auto_2178548 - SURFACE
      ?auto_2178550 - SURFACE
      ?auto_2178549 - SURFACE
      ?auto_2178551 - SURFACE
      ?auto_2178552 - SURFACE
      ?auto_2178553 - SURFACE
      ?auto_2178554 - SURFACE
      ?auto_2178555 - SURFACE
      ?auto_2178556 - SURFACE
      ?auto_2178557 - SURFACE
      ?auto_2178558 - SURFACE
      ?auto_2178559 - SURFACE
    )
    :vars
    (
      ?auto_2178565 - HOIST
      ?auto_2178561 - PLACE
      ?auto_2178564 - PLACE
      ?auto_2178563 - HOIST
      ?auto_2178562 - SURFACE
      ?auto_2178560 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2178565 ?auto_2178561 ) ( SURFACE-AT ?auto_2178558 ?auto_2178561 ) ( CLEAR ?auto_2178558 ) ( IS-CRATE ?auto_2178559 ) ( not ( = ?auto_2178558 ?auto_2178559 ) ) ( AVAILABLE ?auto_2178565 ) ( ON ?auto_2178558 ?auto_2178557 ) ( not ( = ?auto_2178557 ?auto_2178558 ) ) ( not ( = ?auto_2178557 ?auto_2178559 ) ) ( not ( = ?auto_2178564 ?auto_2178561 ) ) ( HOIST-AT ?auto_2178563 ?auto_2178564 ) ( not ( = ?auto_2178565 ?auto_2178563 ) ) ( AVAILABLE ?auto_2178563 ) ( SURFACE-AT ?auto_2178559 ?auto_2178564 ) ( ON ?auto_2178559 ?auto_2178562 ) ( CLEAR ?auto_2178559 ) ( not ( = ?auto_2178558 ?auto_2178562 ) ) ( not ( = ?auto_2178559 ?auto_2178562 ) ) ( not ( = ?auto_2178557 ?auto_2178562 ) ) ( TRUCK-AT ?auto_2178560 ?auto_2178561 ) ( ON ?auto_2178547 ?auto_2178546 ) ( ON ?auto_2178548 ?auto_2178547 ) ( ON ?auto_2178550 ?auto_2178548 ) ( ON ?auto_2178549 ?auto_2178550 ) ( ON ?auto_2178551 ?auto_2178549 ) ( ON ?auto_2178552 ?auto_2178551 ) ( ON ?auto_2178553 ?auto_2178552 ) ( ON ?auto_2178554 ?auto_2178553 ) ( ON ?auto_2178555 ?auto_2178554 ) ( ON ?auto_2178556 ?auto_2178555 ) ( ON ?auto_2178557 ?auto_2178556 ) ( not ( = ?auto_2178546 ?auto_2178547 ) ) ( not ( = ?auto_2178546 ?auto_2178548 ) ) ( not ( = ?auto_2178546 ?auto_2178550 ) ) ( not ( = ?auto_2178546 ?auto_2178549 ) ) ( not ( = ?auto_2178546 ?auto_2178551 ) ) ( not ( = ?auto_2178546 ?auto_2178552 ) ) ( not ( = ?auto_2178546 ?auto_2178553 ) ) ( not ( = ?auto_2178546 ?auto_2178554 ) ) ( not ( = ?auto_2178546 ?auto_2178555 ) ) ( not ( = ?auto_2178546 ?auto_2178556 ) ) ( not ( = ?auto_2178546 ?auto_2178557 ) ) ( not ( = ?auto_2178546 ?auto_2178558 ) ) ( not ( = ?auto_2178546 ?auto_2178559 ) ) ( not ( = ?auto_2178546 ?auto_2178562 ) ) ( not ( = ?auto_2178547 ?auto_2178548 ) ) ( not ( = ?auto_2178547 ?auto_2178550 ) ) ( not ( = ?auto_2178547 ?auto_2178549 ) ) ( not ( = ?auto_2178547 ?auto_2178551 ) ) ( not ( = ?auto_2178547 ?auto_2178552 ) ) ( not ( = ?auto_2178547 ?auto_2178553 ) ) ( not ( = ?auto_2178547 ?auto_2178554 ) ) ( not ( = ?auto_2178547 ?auto_2178555 ) ) ( not ( = ?auto_2178547 ?auto_2178556 ) ) ( not ( = ?auto_2178547 ?auto_2178557 ) ) ( not ( = ?auto_2178547 ?auto_2178558 ) ) ( not ( = ?auto_2178547 ?auto_2178559 ) ) ( not ( = ?auto_2178547 ?auto_2178562 ) ) ( not ( = ?auto_2178548 ?auto_2178550 ) ) ( not ( = ?auto_2178548 ?auto_2178549 ) ) ( not ( = ?auto_2178548 ?auto_2178551 ) ) ( not ( = ?auto_2178548 ?auto_2178552 ) ) ( not ( = ?auto_2178548 ?auto_2178553 ) ) ( not ( = ?auto_2178548 ?auto_2178554 ) ) ( not ( = ?auto_2178548 ?auto_2178555 ) ) ( not ( = ?auto_2178548 ?auto_2178556 ) ) ( not ( = ?auto_2178548 ?auto_2178557 ) ) ( not ( = ?auto_2178548 ?auto_2178558 ) ) ( not ( = ?auto_2178548 ?auto_2178559 ) ) ( not ( = ?auto_2178548 ?auto_2178562 ) ) ( not ( = ?auto_2178550 ?auto_2178549 ) ) ( not ( = ?auto_2178550 ?auto_2178551 ) ) ( not ( = ?auto_2178550 ?auto_2178552 ) ) ( not ( = ?auto_2178550 ?auto_2178553 ) ) ( not ( = ?auto_2178550 ?auto_2178554 ) ) ( not ( = ?auto_2178550 ?auto_2178555 ) ) ( not ( = ?auto_2178550 ?auto_2178556 ) ) ( not ( = ?auto_2178550 ?auto_2178557 ) ) ( not ( = ?auto_2178550 ?auto_2178558 ) ) ( not ( = ?auto_2178550 ?auto_2178559 ) ) ( not ( = ?auto_2178550 ?auto_2178562 ) ) ( not ( = ?auto_2178549 ?auto_2178551 ) ) ( not ( = ?auto_2178549 ?auto_2178552 ) ) ( not ( = ?auto_2178549 ?auto_2178553 ) ) ( not ( = ?auto_2178549 ?auto_2178554 ) ) ( not ( = ?auto_2178549 ?auto_2178555 ) ) ( not ( = ?auto_2178549 ?auto_2178556 ) ) ( not ( = ?auto_2178549 ?auto_2178557 ) ) ( not ( = ?auto_2178549 ?auto_2178558 ) ) ( not ( = ?auto_2178549 ?auto_2178559 ) ) ( not ( = ?auto_2178549 ?auto_2178562 ) ) ( not ( = ?auto_2178551 ?auto_2178552 ) ) ( not ( = ?auto_2178551 ?auto_2178553 ) ) ( not ( = ?auto_2178551 ?auto_2178554 ) ) ( not ( = ?auto_2178551 ?auto_2178555 ) ) ( not ( = ?auto_2178551 ?auto_2178556 ) ) ( not ( = ?auto_2178551 ?auto_2178557 ) ) ( not ( = ?auto_2178551 ?auto_2178558 ) ) ( not ( = ?auto_2178551 ?auto_2178559 ) ) ( not ( = ?auto_2178551 ?auto_2178562 ) ) ( not ( = ?auto_2178552 ?auto_2178553 ) ) ( not ( = ?auto_2178552 ?auto_2178554 ) ) ( not ( = ?auto_2178552 ?auto_2178555 ) ) ( not ( = ?auto_2178552 ?auto_2178556 ) ) ( not ( = ?auto_2178552 ?auto_2178557 ) ) ( not ( = ?auto_2178552 ?auto_2178558 ) ) ( not ( = ?auto_2178552 ?auto_2178559 ) ) ( not ( = ?auto_2178552 ?auto_2178562 ) ) ( not ( = ?auto_2178553 ?auto_2178554 ) ) ( not ( = ?auto_2178553 ?auto_2178555 ) ) ( not ( = ?auto_2178553 ?auto_2178556 ) ) ( not ( = ?auto_2178553 ?auto_2178557 ) ) ( not ( = ?auto_2178553 ?auto_2178558 ) ) ( not ( = ?auto_2178553 ?auto_2178559 ) ) ( not ( = ?auto_2178553 ?auto_2178562 ) ) ( not ( = ?auto_2178554 ?auto_2178555 ) ) ( not ( = ?auto_2178554 ?auto_2178556 ) ) ( not ( = ?auto_2178554 ?auto_2178557 ) ) ( not ( = ?auto_2178554 ?auto_2178558 ) ) ( not ( = ?auto_2178554 ?auto_2178559 ) ) ( not ( = ?auto_2178554 ?auto_2178562 ) ) ( not ( = ?auto_2178555 ?auto_2178556 ) ) ( not ( = ?auto_2178555 ?auto_2178557 ) ) ( not ( = ?auto_2178555 ?auto_2178558 ) ) ( not ( = ?auto_2178555 ?auto_2178559 ) ) ( not ( = ?auto_2178555 ?auto_2178562 ) ) ( not ( = ?auto_2178556 ?auto_2178557 ) ) ( not ( = ?auto_2178556 ?auto_2178558 ) ) ( not ( = ?auto_2178556 ?auto_2178559 ) ) ( not ( = ?auto_2178556 ?auto_2178562 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2178557 ?auto_2178558 ?auto_2178559 )
      ( MAKE-13CRATE-VERIFY ?auto_2178546 ?auto_2178547 ?auto_2178548 ?auto_2178550 ?auto_2178549 ?auto_2178551 ?auto_2178552 ?auto_2178553 ?auto_2178554 ?auto_2178555 ?auto_2178556 ?auto_2178557 ?auto_2178558 ?auto_2178559 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2178729 - SURFACE
      ?auto_2178730 - SURFACE
      ?auto_2178731 - SURFACE
      ?auto_2178733 - SURFACE
      ?auto_2178732 - SURFACE
      ?auto_2178734 - SURFACE
      ?auto_2178735 - SURFACE
      ?auto_2178736 - SURFACE
      ?auto_2178737 - SURFACE
      ?auto_2178738 - SURFACE
      ?auto_2178739 - SURFACE
      ?auto_2178740 - SURFACE
      ?auto_2178741 - SURFACE
      ?auto_2178742 - SURFACE
    )
    :vars
    (
      ?auto_2178744 - HOIST
      ?auto_2178747 - PLACE
      ?auto_2178743 - PLACE
      ?auto_2178746 - HOIST
      ?auto_2178745 - SURFACE
      ?auto_2178748 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2178744 ?auto_2178747 ) ( IS-CRATE ?auto_2178742 ) ( not ( = ?auto_2178741 ?auto_2178742 ) ) ( not ( = ?auto_2178740 ?auto_2178741 ) ) ( not ( = ?auto_2178740 ?auto_2178742 ) ) ( not ( = ?auto_2178743 ?auto_2178747 ) ) ( HOIST-AT ?auto_2178746 ?auto_2178743 ) ( not ( = ?auto_2178744 ?auto_2178746 ) ) ( AVAILABLE ?auto_2178746 ) ( SURFACE-AT ?auto_2178742 ?auto_2178743 ) ( ON ?auto_2178742 ?auto_2178745 ) ( CLEAR ?auto_2178742 ) ( not ( = ?auto_2178741 ?auto_2178745 ) ) ( not ( = ?auto_2178742 ?auto_2178745 ) ) ( not ( = ?auto_2178740 ?auto_2178745 ) ) ( TRUCK-AT ?auto_2178748 ?auto_2178747 ) ( SURFACE-AT ?auto_2178740 ?auto_2178747 ) ( CLEAR ?auto_2178740 ) ( LIFTING ?auto_2178744 ?auto_2178741 ) ( IS-CRATE ?auto_2178741 ) ( ON ?auto_2178730 ?auto_2178729 ) ( ON ?auto_2178731 ?auto_2178730 ) ( ON ?auto_2178733 ?auto_2178731 ) ( ON ?auto_2178732 ?auto_2178733 ) ( ON ?auto_2178734 ?auto_2178732 ) ( ON ?auto_2178735 ?auto_2178734 ) ( ON ?auto_2178736 ?auto_2178735 ) ( ON ?auto_2178737 ?auto_2178736 ) ( ON ?auto_2178738 ?auto_2178737 ) ( ON ?auto_2178739 ?auto_2178738 ) ( ON ?auto_2178740 ?auto_2178739 ) ( not ( = ?auto_2178729 ?auto_2178730 ) ) ( not ( = ?auto_2178729 ?auto_2178731 ) ) ( not ( = ?auto_2178729 ?auto_2178733 ) ) ( not ( = ?auto_2178729 ?auto_2178732 ) ) ( not ( = ?auto_2178729 ?auto_2178734 ) ) ( not ( = ?auto_2178729 ?auto_2178735 ) ) ( not ( = ?auto_2178729 ?auto_2178736 ) ) ( not ( = ?auto_2178729 ?auto_2178737 ) ) ( not ( = ?auto_2178729 ?auto_2178738 ) ) ( not ( = ?auto_2178729 ?auto_2178739 ) ) ( not ( = ?auto_2178729 ?auto_2178740 ) ) ( not ( = ?auto_2178729 ?auto_2178741 ) ) ( not ( = ?auto_2178729 ?auto_2178742 ) ) ( not ( = ?auto_2178729 ?auto_2178745 ) ) ( not ( = ?auto_2178730 ?auto_2178731 ) ) ( not ( = ?auto_2178730 ?auto_2178733 ) ) ( not ( = ?auto_2178730 ?auto_2178732 ) ) ( not ( = ?auto_2178730 ?auto_2178734 ) ) ( not ( = ?auto_2178730 ?auto_2178735 ) ) ( not ( = ?auto_2178730 ?auto_2178736 ) ) ( not ( = ?auto_2178730 ?auto_2178737 ) ) ( not ( = ?auto_2178730 ?auto_2178738 ) ) ( not ( = ?auto_2178730 ?auto_2178739 ) ) ( not ( = ?auto_2178730 ?auto_2178740 ) ) ( not ( = ?auto_2178730 ?auto_2178741 ) ) ( not ( = ?auto_2178730 ?auto_2178742 ) ) ( not ( = ?auto_2178730 ?auto_2178745 ) ) ( not ( = ?auto_2178731 ?auto_2178733 ) ) ( not ( = ?auto_2178731 ?auto_2178732 ) ) ( not ( = ?auto_2178731 ?auto_2178734 ) ) ( not ( = ?auto_2178731 ?auto_2178735 ) ) ( not ( = ?auto_2178731 ?auto_2178736 ) ) ( not ( = ?auto_2178731 ?auto_2178737 ) ) ( not ( = ?auto_2178731 ?auto_2178738 ) ) ( not ( = ?auto_2178731 ?auto_2178739 ) ) ( not ( = ?auto_2178731 ?auto_2178740 ) ) ( not ( = ?auto_2178731 ?auto_2178741 ) ) ( not ( = ?auto_2178731 ?auto_2178742 ) ) ( not ( = ?auto_2178731 ?auto_2178745 ) ) ( not ( = ?auto_2178733 ?auto_2178732 ) ) ( not ( = ?auto_2178733 ?auto_2178734 ) ) ( not ( = ?auto_2178733 ?auto_2178735 ) ) ( not ( = ?auto_2178733 ?auto_2178736 ) ) ( not ( = ?auto_2178733 ?auto_2178737 ) ) ( not ( = ?auto_2178733 ?auto_2178738 ) ) ( not ( = ?auto_2178733 ?auto_2178739 ) ) ( not ( = ?auto_2178733 ?auto_2178740 ) ) ( not ( = ?auto_2178733 ?auto_2178741 ) ) ( not ( = ?auto_2178733 ?auto_2178742 ) ) ( not ( = ?auto_2178733 ?auto_2178745 ) ) ( not ( = ?auto_2178732 ?auto_2178734 ) ) ( not ( = ?auto_2178732 ?auto_2178735 ) ) ( not ( = ?auto_2178732 ?auto_2178736 ) ) ( not ( = ?auto_2178732 ?auto_2178737 ) ) ( not ( = ?auto_2178732 ?auto_2178738 ) ) ( not ( = ?auto_2178732 ?auto_2178739 ) ) ( not ( = ?auto_2178732 ?auto_2178740 ) ) ( not ( = ?auto_2178732 ?auto_2178741 ) ) ( not ( = ?auto_2178732 ?auto_2178742 ) ) ( not ( = ?auto_2178732 ?auto_2178745 ) ) ( not ( = ?auto_2178734 ?auto_2178735 ) ) ( not ( = ?auto_2178734 ?auto_2178736 ) ) ( not ( = ?auto_2178734 ?auto_2178737 ) ) ( not ( = ?auto_2178734 ?auto_2178738 ) ) ( not ( = ?auto_2178734 ?auto_2178739 ) ) ( not ( = ?auto_2178734 ?auto_2178740 ) ) ( not ( = ?auto_2178734 ?auto_2178741 ) ) ( not ( = ?auto_2178734 ?auto_2178742 ) ) ( not ( = ?auto_2178734 ?auto_2178745 ) ) ( not ( = ?auto_2178735 ?auto_2178736 ) ) ( not ( = ?auto_2178735 ?auto_2178737 ) ) ( not ( = ?auto_2178735 ?auto_2178738 ) ) ( not ( = ?auto_2178735 ?auto_2178739 ) ) ( not ( = ?auto_2178735 ?auto_2178740 ) ) ( not ( = ?auto_2178735 ?auto_2178741 ) ) ( not ( = ?auto_2178735 ?auto_2178742 ) ) ( not ( = ?auto_2178735 ?auto_2178745 ) ) ( not ( = ?auto_2178736 ?auto_2178737 ) ) ( not ( = ?auto_2178736 ?auto_2178738 ) ) ( not ( = ?auto_2178736 ?auto_2178739 ) ) ( not ( = ?auto_2178736 ?auto_2178740 ) ) ( not ( = ?auto_2178736 ?auto_2178741 ) ) ( not ( = ?auto_2178736 ?auto_2178742 ) ) ( not ( = ?auto_2178736 ?auto_2178745 ) ) ( not ( = ?auto_2178737 ?auto_2178738 ) ) ( not ( = ?auto_2178737 ?auto_2178739 ) ) ( not ( = ?auto_2178737 ?auto_2178740 ) ) ( not ( = ?auto_2178737 ?auto_2178741 ) ) ( not ( = ?auto_2178737 ?auto_2178742 ) ) ( not ( = ?auto_2178737 ?auto_2178745 ) ) ( not ( = ?auto_2178738 ?auto_2178739 ) ) ( not ( = ?auto_2178738 ?auto_2178740 ) ) ( not ( = ?auto_2178738 ?auto_2178741 ) ) ( not ( = ?auto_2178738 ?auto_2178742 ) ) ( not ( = ?auto_2178738 ?auto_2178745 ) ) ( not ( = ?auto_2178739 ?auto_2178740 ) ) ( not ( = ?auto_2178739 ?auto_2178741 ) ) ( not ( = ?auto_2178739 ?auto_2178742 ) ) ( not ( = ?auto_2178739 ?auto_2178745 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2178740 ?auto_2178741 ?auto_2178742 )
      ( MAKE-13CRATE-VERIFY ?auto_2178729 ?auto_2178730 ?auto_2178731 ?auto_2178733 ?auto_2178732 ?auto_2178734 ?auto_2178735 ?auto_2178736 ?auto_2178737 ?auto_2178738 ?auto_2178739 ?auto_2178740 ?auto_2178741 ?auto_2178742 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2178912 - SURFACE
      ?auto_2178913 - SURFACE
      ?auto_2178914 - SURFACE
      ?auto_2178916 - SURFACE
      ?auto_2178915 - SURFACE
      ?auto_2178917 - SURFACE
      ?auto_2178918 - SURFACE
      ?auto_2178919 - SURFACE
      ?auto_2178920 - SURFACE
      ?auto_2178921 - SURFACE
      ?auto_2178922 - SURFACE
      ?auto_2178923 - SURFACE
      ?auto_2178924 - SURFACE
      ?auto_2178925 - SURFACE
    )
    :vars
    (
      ?auto_2178931 - HOIST
      ?auto_2178927 - PLACE
      ?auto_2178930 - PLACE
      ?auto_2178929 - HOIST
      ?auto_2178928 - SURFACE
      ?auto_2178926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2178931 ?auto_2178927 ) ( IS-CRATE ?auto_2178925 ) ( not ( = ?auto_2178924 ?auto_2178925 ) ) ( not ( = ?auto_2178923 ?auto_2178924 ) ) ( not ( = ?auto_2178923 ?auto_2178925 ) ) ( not ( = ?auto_2178930 ?auto_2178927 ) ) ( HOIST-AT ?auto_2178929 ?auto_2178930 ) ( not ( = ?auto_2178931 ?auto_2178929 ) ) ( AVAILABLE ?auto_2178929 ) ( SURFACE-AT ?auto_2178925 ?auto_2178930 ) ( ON ?auto_2178925 ?auto_2178928 ) ( CLEAR ?auto_2178925 ) ( not ( = ?auto_2178924 ?auto_2178928 ) ) ( not ( = ?auto_2178925 ?auto_2178928 ) ) ( not ( = ?auto_2178923 ?auto_2178928 ) ) ( TRUCK-AT ?auto_2178926 ?auto_2178927 ) ( SURFACE-AT ?auto_2178923 ?auto_2178927 ) ( CLEAR ?auto_2178923 ) ( IS-CRATE ?auto_2178924 ) ( AVAILABLE ?auto_2178931 ) ( IN ?auto_2178924 ?auto_2178926 ) ( ON ?auto_2178913 ?auto_2178912 ) ( ON ?auto_2178914 ?auto_2178913 ) ( ON ?auto_2178916 ?auto_2178914 ) ( ON ?auto_2178915 ?auto_2178916 ) ( ON ?auto_2178917 ?auto_2178915 ) ( ON ?auto_2178918 ?auto_2178917 ) ( ON ?auto_2178919 ?auto_2178918 ) ( ON ?auto_2178920 ?auto_2178919 ) ( ON ?auto_2178921 ?auto_2178920 ) ( ON ?auto_2178922 ?auto_2178921 ) ( ON ?auto_2178923 ?auto_2178922 ) ( not ( = ?auto_2178912 ?auto_2178913 ) ) ( not ( = ?auto_2178912 ?auto_2178914 ) ) ( not ( = ?auto_2178912 ?auto_2178916 ) ) ( not ( = ?auto_2178912 ?auto_2178915 ) ) ( not ( = ?auto_2178912 ?auto_2178917 ) ) ( not ( = ?auto_2178912 ?auto_2178918 ) ) ( not ( = ?auto_2178912 ?auto_2178919 ) ) ( not ( = ?auto_2178912 ?auto_2178920 ) ) ( not ( = ?auto_2178912 ?auto_2178921 ) ) ( not ( = ?auto_2178912 ?auto_2178922 ) ) ( not ( = ?auto_2178912 ?auto_2178923 ) ) ( not ( = ?auto_2178912 ?auto_2178924 ) ) ( not ( = ?auto_2178912 ?auto_2178925 ) ) ( not ( = ?auto_2178912 ?auto_2178928 ) ) ( not ( = ?auto_2178913 ?auto_2178914 ) ) ( not ( = ?auto_2178913 ?auto_2178916 ) ) ( not ( = ?auto_2178913 ?auto_2178915 ) ) ( not ( = ?auto_2178913 ?auto_2178917 ) ) ( not ( = ?auto_2178913 ?auto_2178918 ) ) ( not ( = ?auto_2178913 ?auto_2178919 ) ) ( not ( = ?auto_2178913 ?auto_2178920 ) ) ( not ( = ?auto_2178913 ?auto_2178921 ) ) ( not ( = ?auto_2178913 ?auto_2178922 ) ) ( not ( = ?auto_2178913 ?auto_2178923 ) ) ( not ( = ?auto_2178913 ?auto_2178924 ) ) ( not ( = ?auto_2178913 ?auto_2178925 ) ) ( not ( = ?auto_2178913 ?auto_2178928 ) ) ( not ( = ?auto_2178914 ?auto_2178916 ) ) ( not ( = ?auto_2178914 ?auto_2178915 ) ) ( not ( = ?auto_2178914 ?auto_2178917 ) ) ( not ( = ?auto_2178914 ?auto_2178918 ) ) ( not ( = ?auto_2178914 ?auto_2178919 ) ) ( not ( = ?auto_2178914 ?auto_2178920 ) ) ( not ( = ?auto_2178914 ?auto_2178921 ) ) ( not ( = ?auto_2178914 ?auto_2178922 ) ) ( not ( = ?auto_2178914 ?auto_2178923 ) ) ( not ( = ?auto_2178914 ?auto_2178924 ) ) ( not ( = ?auto_2178914 ?auto_2178925 ) ) ( not ( = ?auto_2178914 ?auto_2178928 ) ) ( not ( = ?auto_2178916 ?auto_2178915 ) ) ( not ( = ?auto_2178916 ?auto_2178917 ) ) ( not ( = ?auto_2178916 ?auto_2178918 ) ) ( not ( = ?auto_2178916 ?auto_2178919 ) ) ( not ( = ?auto_2178916 ?auto_2178920 ) ) ( not ( = ?auto_2178916 ?auto_2178921 ) ) ( not ( = ?auto_2178916 ?auto_2178922 ) ) ( not ( = ?auto_2178916 ?auto_2178923 ) ) ( not ( = ?auto_2178916 ?auto_2178924 ) ) ( not ( = ?auto_2178916 ?auto_2178925 ) ) ( not ( = ?auto_2178916 ?auto_2178928 ) ) ( not ( = ?auto_2178915 ?auto_2178917 ) ) ( not ( = ?auto_2178915 ?auto_2178918 ) ) ( not ( = ?auto_2178915 ?auto_2178919 ) ) ( not ( = ?auto_2178915 ?auto_2178920 ) ) ( not ( = ?auto_2178915 ?auto_2178921 ) ) ( not ( = ?auto_2178915 ?auto_2178922 ) ) ( not ( = ?auto_2178915 ?auto_2178923 ) ) ( not ( = ?auto_2178915 ?auto_2178924 ) ) ( not ( = ?auto_2178915 ?auto_2178925 ) ) ( not ( = ?auto_2178915 ?auto_2178928 ) ) ( not ( = ?auto_2178917 ?auto_2178918 ) ) ( not ( = ?auto_2178917 ?auto_2178919 ) ) ( not ( = ?auto_2178917 ?auto_2178920 ) ) ( not ( = ?auto_2178917 ?auto_2178921 ) ) ( not ( = ?auto_2178917 ?auto_2178922 ) ) ( not ( = ?auto_2178917 ?auto_2178923 ) ) ( not ( = ?auto_2178917 ?auto_2178924 ) ) ( not ( = ?auto_2178917 ?auto_2178925 ) ) ( not ( = ?auto_2178917 ?auto_2178928 ) ) ( not ( = ?auto_2178918 ?auto_2178919 ) ) ( not ( = ?auto_2178918 ?auto_2178920 ) ) ( not ( = ?auto_2178918 ?auto_2178921 ) ) ( not ( = ?auto_2178918 ?auto_2178922 ) ) ( not ( = ?auto_2178918 ?auto_2178923 ) ) ( not ( = ?auto_2178918 ?auto_2178924 ) ) ( not ( = ?auto_2178918 ?auto_2178925 ) ) ( not ( = ?auto_2178918 ?auto_2178928 ) ) ( not ( = ?auto_2178919 ?auto_2178920 ) ) ( not ( = ?auto_2178919 ?auto_2178921 ) ) ( not ( = ?auto_2178919 ?auto_2178922 ) ) ( not ( = ?auto_2178919 ?auto_2178923 ) ) ( not ( = ?auto_2178919 ?auto_2178924 ) ) ( not ( = ?auto_2178919 ?auto_2178925 ) ) ( not ( = ?auto_2178919 ?auto_2178928 ) ) ( not ( = ?auto_2178920 ?auto_2178921 ) ) ( not ( = ?auto_2178920 ?auto_2178922 ) ) ( not ( = ?auto_2178920 ?auto_2178923 ) ) ( not ( = ?auto_2178920 ?auto_2178924 ) ) ( not ( = ?auto_2178920 ?auto_2178925 ) ) ( not ( = ?auto_2178920 ?auto_2178928 ) ) ( not ( = ?auto_2178921 ?auto_2178922 ) ) ( not ( = ?auto_2178921 ?auto_2178923 ) ) ( not ( = ?auto_2178921 ?auto_2178924 ) ) ( not ( = ?auto_2178921 ?auto_2178925 ) ) ( not ( = ?auto_2178921 ?auto_2178928 ) ) ( not ( = ?auto_2178922 ?auto_2178923 ) ) ( not ( = ?auto_2178922 ?auto_2178924 ) ) ( not ( = ?auto_2178922 ?auto_2178925 ) ) ( not ( = ?auto_2178922 ?auto_2178928 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2178923 ?auto_2178924 ?auto_2178925 )
      ( MAKE-13CRATE-VERIFY ?auto_2178912 ?auto_2178913 ?auto_2178914 ?auto_2178916 ?auto_2178915 ?auto_2178917 ?auto_2178918 ?auto_2178919 ?auto_2178920 ?auto_2178921 ?auto_2178922 ?auto_2178923 ?auto_2178924 ?auto_2178925 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2193098 - SURFACE
      ?auto_2193099 - SURFACE
      ?auto_2193100 - SURFACE
      ?auto_2193102 - SURFACE
      ?auto_2193101 - SURFACE
      ?auto_2193103 - SURFACE
      ?auto_2193104 - SURFACE
      ?auto_2193105 - SURFACE
      ?auto_2193106 - SURFACE
      ?auto_2193107 - SURFACE
      ?auto_2193108 - SURFACE
      ?auto_2193109 - SURFACE
      ?auto_2193110 - SURFACE
      ?auto_2193111 - SURFACE
      ?auto_2193112 - SURFACE
    )
    :vars
    (
      ?auto_2193113 - HOIST
      ?auto_2193114 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2193113 ?auto_2193114 ) ( SURFACE-AT ?auto_2193111 ?auto_2193114 ) ( CLEAR ?auto_2193111 ) ( LIFTING ?auto_2193113 ?auto_2193112 ) ( IS-CRATE ?auto_2193112 ) ( not ( = ?auto_2193111 ?auto_2193112 ) ) ( ON ?auto_2193099 ?auto_2193098 ) ( ON ?auto_2193100 ?auto_2193099 ) ( ON ?auto_2193102 ?auto_2193100 ) ( ON ?auto_2193101 ?auto_2193102 ) ( ON ?auto_2193103 ?auto_2193101 ) ( ON ?auto_2193104 ?auto_2193103 ) ( ON ?auto_2193105 ?auto_2193104 ) ( ON ?auto_2193106 ?auto_2193105 ) ( ON ?auto_2193107 ?auto_2193106 ) ( ON ?auto_2193108 ?auto_2193107 ) ( ON ?auto_2193109 ?auto_2193108 ) ( ON ?auto_2193110 ?auto_2193109 ) ( ON ?auto_2193111 ?auto_2193110 ) ( not ( = ?auto_2193098 ?auto_2193099 ) ) ( not ( = ?auto_2193098 ?auto_2193100 ) ) ( not ( = ?auto_2193098 ?auto_2193102 ) ) ( not ( = ?auto_2193098 ?auto_2193101 ) ) ( not ( = ?auto_2193098 ?auto_2193103 ) ) ( not ( = ?auto_2193098 ?auto_2193104 ) ) ( not ( = ?auto_2193098 ?auto_2193105 ) ) ( not ( = ?auto_2193098 ?auto_2193106 ) ) ( not ( = ?auto_2193098 ?auto_2193107 ) ) ( not ( = ?auto_2193098 ?auto_2193108 ) ) ( not ( = ?auto_2193098 ?auto_2193109 ) ) ( not ( = ?auto_2193098 ?auto_2193110 ) ) ( not ( = ?auto_2193098 ?auto_2193111 ) ) ( not ( = ?auto_2193098 ?auto_2193112 ) ) ( not ( = ?auto_2193099 ?auto_2193100 ) ) ( not ( = ?auto_2193099 ?auto_2193102 ) ) ( not ( = ?auto_2193099 ?auto_2193101 ) ) ( not ( = ?auto_2193099 ?auto_2193103 ) ) ( not ( = ?auto_2193099 ?auto_2193104 ) ) ( not ( = ?auto_2193099 ?auto_2193105 ) ) ( not ( = ?auto_2193099 ?auto_2193106 ) ) ( not ( = ?auto_2193099 ?auto_2193107 ) ) ( not ( = ?auto_2193099 ?auto_2193108 ) ) ( not ( = ?auto_2193099 ?auto_2193109 ) ) ( not ( = ?auto_2193099 ?auto_2193110 ) ) ( not ( = ?auto_2193099 ?auto_2193111 ) ) ( not ( = ?auto_2193099 ?auto_2193112 ) ) ( not ( = ?auto_2193100 ?auto_2193102 ) ) ( not ( = ?auto_2193100 ?auto_2193101 ) ) ( not ( = ?auto_2193100 ?auto_2193103 ) ) ( not ( = ?auto_2193100 ?auto_2193104 ) ) ( not ( = ?auto_2193100 ?auto_2193105 ) ) ( not ( = ?auto_2193100 ?auto_2193106 ) ) ( not ( = ?auto_2193100 ?auto_2193107 ) ) ( not ( = ?auto_2193100 ?auto_2193108 ) ) ( not ( = ?auto_2193100 ?auto_2193109 ) ) ( not ( = ?auto_2193100 ?auto_2193110 ) ) ( not ( = ?auto_2193100 ?auto_2193111 ) ) ( not ( = ?auto_2193100 ?auto_2193112 ) ) ( not ( = ?auto_2193102 ?auto_2193101 ) ) ( not ( = ?auto_2193102 ?auto_2193103 ) ) ( not ( = ?auto_2193102 ?auto_2193104 ) ) ( not ( = ?auto_2193102 ?auto_2193105 ) ) ( not ( = ?auto_2193102 ?auto_2193106 ) ) ( not ( = ?auto_2193102 ?auto_2193107 ) ) ( not ( = ?auto_2193102 ?auto_2193108 ) ) ( not ( = ?auto_2193102 ?auto_2193109 ) ) ( not ( = ?auto_2193102 ?auto_2193110 ) ) ( not ( = ?auto_2193102 ?auto_2193111 ) ) ( not ( = ?auto_2193102 ?auto_2193112 ) ) ( not ( = ?auto_2193101 ?auto_2193103 ) ) ( not ( = ?auto_2193101 ?auto_2193104 ) ) ( not ( = ?auto_2193101 ?auto_2193105 ) ) ( not ( = ?auto_2193101 ?auto_2193106 ) ) ( not ( = ?auto_2193101 ?auto_2193107 ) ) ( not ( = ?auto_2193101 ?auto_2193108 ) ) ( not ( = ?auto_2193101 ?auto_2193109 ) ) ( not ( = ?auto_2193101 ?auto_2193110 ) ) ( not ( = ?auto_2193101 ?auto_2193111 ) ) ( not ( = ?auto_2193101 ?auto_2193112 ) ) ( not ( = ?auto_2193103 ?auto_2193104 ) ) ( not ( = ?auto_2193103 ?auto_2193105 ) ) ( not ( = ?auto_2193103 ?auto_2193106 ) ) ( not ( = ?auto_2193103 ?auto_2193107 ) ) ( not ( = ?auto_2193103 ?auto_2193108 ) ) ( not ( = ?auto_2193103 ?auto_2193109 ) ) ( not ( = ?auto_2193103 ?auto_2193110 ) ) ( not ( = ?auto_2193103 ?auto_2193111 ) ) ( not ( = ?auto_2193103 ?auto_2193112 ) ) ( not ( = ?auto_2193104 ?auto_2193105 ) ) ( not ( = ?auto_2193104 ?auto_2193106 ) ) ( not ( = ?auto_2193104 ?auto_2193107 ) ) ( not ( = ?auto_2193104 ?auto_2193108 ) ) ( not ( = ?auto_2193104 ?auto_2193109 ) ) ( not ( = ?auto_2193104 ?auto_2193110 ) ) ( not ( = ?auto_2193104 ?auto_2193111 ) ) ( not ( = ?auto_2193104 ?auto_2193112 ) ) ( not ( = ?auto_2193105 ?auto_2193106 ) ) ( not ( = ?auto_2193105 ?auto_2193107 ) ) ( not ( = ?auto_2193105 ?auto_2193108 ) ) ( not ( = ?auto_2193105 ?auto_2193109 ) ) ( not ( = ?auto_2193105 ?auto_2193110 ) ) ( not ( = ?auto_2193105 ?auto_2193111 ) ) ( not ( = ?auto_2193105 ?auto_2193112 ) ) ( not ( = ?auto_2193106 ?auto_2193107 ) ) ( not ( = ?auto_2193106 ?auto_2193108 ) ) ( not ( = ?auto_2193106 ?auto_2193109 ) ) ( not ( = ?auto_2193106 ?auto_2193110 ) ) ( not ( = ?auto_2193106 ?auto_2193111 ) ) ( not ( = ?auto_2193106 ?auto_2193112 ) ) ( not ( = ?auto_2193107 ?auto_2193108 ) ) ( not ( = ?auto_2193107 ?auto_2193109 ) ) ( not ( = ?auto_2193107 ?auto_2193110 ) ) ( not ( = ?auto_2193107 ?auto_2193111 ) ) ( not ( = ?auto_2193107 ?auto_2193112 ) ) ( not ( = ?auto_2193108 ?auto_2193109 ) ) ( not ( = ?auto_2193108 ?auto_2193110 ) ) ( not ( = ?auto_2193108 ?auto_2193111 ) ) ( not ( = ?auto_2193108 ?auto_2193112 ) ) ( not ( = ?auto_2193109 ?auto_2193110 ) ) ( not ( = ?auto_2193109 ?auto_2193111 ) ) ( not ( = ?auto_2193109 ?auto_2193112 ) ) ( not ( = ?auto_2193110 ?auto_2193111 ) ) ( not ( = ?auto_2193110 ?auto_2193112 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2193111 ?auto_2193112 )
      ( MAKE-14CRATE-VERIFY ?auto_2193098 ?auto_2193099 ?auto_2193100 ?auto_2193102 ?auto_2193101 ?auto_2193103 ?auto_2193104 ?auto_2193105 ?auto_2193106 ?auto_2193107 ?auto_2193108 ?auto_2193109 ?auto_2193110 ?auto_2193111 ?auto_2193112 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2193258 - SURFACE
      ?auto_2193259 - SURFACE
      ?auto_2193260 - SURFACE
      ?auto_2193262 - SURFACE
      ?auto_2193261 - SURFACE
      ?auto_2193263 - SURFACE
      ?auto_2193264 - SURFACE
      ?auto_2193265 - SURFACE
      ?auto_2193266 - SURFACE
      ?auto_2193267 - SURFACE
      ?auto_2193268 - SURFACE
      ?auto_2193269 - SURFACE
      ?auto_2193270 - SURFACE
      ?auto_2193271 - SURFACE
      ?auto_2193272 - SURFACE
    )
    :vars
    (
      ?auto_2193274 - HOIST
      ?auto_2193275 - PLACE
      ?auto_2193273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2193274 ?auto_2193275 ) ( SURFACE-AT ?auto_2193271 ?auto_2193275 ) ( CLEAR ?auto_2193271 ) ( IS-CRATE ?auto_2193272 ) ( not ( = ?auto_2193271 ?auto_2193272 ) ) ( TRUCK-AT ?auto_2193273 ?auto_2193275 ) ( AVAILABLE ?auto_2193274 ) ( IN ?auto_2193272 ?auto_2193273 ) ( ON ?auto_2193271 ?auto_2193270 ) ( not ( = ?auto_2193270 ?auto_2193271 ) ) ( not ( = ?auto_2193270 ?auto_2193272 ) ) ( ON ?auto_2193259 ?auto_2193258 ) ( ON ?auto_2193260 ?auto_2193259 ) ( ON ?auto_2193262 ?auto_2193260 ) ( ON ?auto_2193261 ?auto_2193262 ) ( ON ?auto_2193263 ?auto_2193261 ) ( ON ?auto_2193264 ?auto_2193263 ) ( ON ?auto_2193265 ?auto_2193264 ) ( ON ?auto_2193266 ?auto_2193265 ) ( ON ?auto_2193267 ?auto_2193266 ) ( ON ?auto_2193268 ?auto_2193267 ) ( ON ?auto_2193269 ?auto_2193268 ) ( ON ?auto_2193270 ?auto_2193269 ) ( not ( = ?auto_2193258 ?auto_2193259 ) ) ( not ( = ?auto_2193258 ?auto_2193260 ) ) ( not ( = ?auto_2193258 ?auto_2193262 ) ) ( not ( = ?auto_2193258 ?auto_2193261 ) ) ( not ( = ?auto_2193258 ?auto_2193263 ) ) ( not ( = ?auto_2193258 ?auto_2193264 ) ) ( not ( = ?auto_2193258 ?auto_2193265 ) ) ( not ( = ?auto_2193258 ?auto_2193266 ) ) ( not ( = ?auto_2193258 ?auto_2193267 ) ) ( not ( = ?auto_2193258 ?auto_2193268 ) ) ( not ( = ?auto_2193258 ?auto_2193269 ) ) ( not ( = ?auto_2193258 ?auto_2193270 ) ) ( not ( = ?auto_2193258 ?auto_2193271 ) ) ( not ( = ?auto_2193258 ?auto_2193272 ) ) ( not ( = ?auto_2193259 ?auto_2193260 ) ) ( not ( = ?auto_2193259 ?auto_2193262 ) ) ( not ( = ?auto_2193259 ?auto_2193261 ) ) ( not ( = ?auto_2193259 ?auto_2193263 ) ) ( not ( = ?auto_2193259 ?auto_2193264 ) ) ( not ( = ?auto_2193259 ?auto_2193265 ) ) ( not ( = ?auto_2193259 ?auto_2193266 ) ) ( not ( = ?auto_2193259 ?auto_2193267 ) ) ( not ( = ?auto_2193259 ?auto_2193268 ) ) ( not ( = ?auto_2193259 ?auto_2193269 ) ) ( not ( = ?auto_2193259 ?auto_2193270 ) ) ( not ( = ?auto_2193259 ?auto_2193271 ) ) ( not ( = ?auto_2193259 ?auto_2193272 ) ) ( not ( = ?auto_2193260 ?auto_2193262 ) ) ( not ( = ?auto_2193260 ?auto_2193261 ) ) ( not ( = ?auto_2193260 ?auto_2193263 ) ) ( not ( = ?auto_2193260 ?auto_2193264 ) ) ( not ( = ?auto_2193260 ?auto_2193265 ) ) ( not ( = ?auto_2193260 ?auto_2193266 ) ) ( not ( = ?auto_2193260 ?auto_2193267 ) ) ( not ( = ?auto_2193260 ?auto_2193268 ) ) ( not ( = ?auto_2193260 ?auto_2193269 ) ) ( not ( = ?auto_2193260 ?auto_2193270 ) ) ( not ( = ?auto_2193260 ?auto_2193271 ) ) ( not ( = ?auto_2193260 ?auto_2193272 ) ) ( not ( = ?auto_2193262 ?auto_2193261 ) ) ( not ( = ?auto_2193262 ?auto_2193263 ) ) ( not ( = ?auto_2193262 ?auto_2193264 ) ) ( not ( = ?auto_2193262 ?auto_2193265 ) ) ( not ( = ?auto_2193262 ?auto_2193266 ) ) ( not ( = ?auto_2193262 ?auto_2193267 ) ) ( not ( = ?auto_2193262 ?auto_2193268 ) ) ( not ( = ?auto_2193262 ?auto_2193269 ) ) ( not ( = ?auto_2193262 ?auto_2193270 ) ) ( not ( = ?auto_2193262 ?auto_2193271 ) ) ( not ( = ?auto_2193262 ?auto_2193272 ) ) ( not ( = ?auto_2193261 ?auto_2193263 ) ) ( not ( = ?auto_2193261 ?auto_2193264 ) ) ( not ( = ?auto_2193261 ?auto_2193265 ) ) ( not ( = ?auto_2193261 ?auto_2193266 ) ) ( not ( = ?auto_2193261 ?auto_2193267 ) ) ( not ( = ?auto_2193261 ?auto_2193268 ) ) ( not ( = ?auto_2193261 ?auto_2193269 ) ) ( not ( = ?auto_2193261 ?auto_2193270 ) ) ( not ( = ?auto_2193261 ?auto_2193271 ) ) ( not ( = ?auto_2193261 ?auto_2193272 ) ) ( not ( = ?auto_2193263 ?auto_2193264 ) ) ( not ( = ?auto_2193263 ?auto_2193265 ) ) ( not ( = ?auto_2193263 ?auto_2193266 ) ) ( not ( = ?auto_2193263 ?auto_2193267 ) ) ( not ( = ?auto_2193263 ?auto_2193268 ) ) ( not ( = ?auto_2193263 ?auto_2193269 ) ) ( not ( = ?auto_2193263 ?auto_2193270 ) ) ( not ( = ?auto_2193263 ?auto_2193271 ) ) ( not ( = ?auto_2193263 ?auto_2193272 ) ) ( not ( = ?auto_2193264 ?auto_2193265 ) ) ( not ( = ?auto_2193264 ?auto_2193266 ) ) ( not ( = ?auto_2193264 ?auto_2193267 ) ) ( not ( = ?auto_2193264 ?auto_2193268 ) ) ( not ( = ?auto_2193264 ?auto_2193269 ) ) ( not ( = ?auto_2193264 ?auto_2193270 ) ) ( not ( = ?auto_2193264 ?auto_2193271 ) ) ( not ( = ?auto_2193264 ?auto_2193272 ) ) ( not ( = ?auto_2193265 ?auto_2193266 ) ) ( not ( = ?auto_2193265 ?auto_2193267 ) ) ( not ( = ?auto_2193265 ?auto_2193268 ) ) ( not ( = ?auto_2193265 ?auto_2193269 ) ) ( not ( = ?auto_2193265 ?auto_2193270 ) ) ( not ( = ?auto_2193265 ?auto_2193271 ) ) ( not ( = ?auto_2193265 ?auto_2193272 ) ) ( not ( = ?auto_2193266 ?auto_2193267 ) ) ( not ( = ?auto_2193266 ?auto_2193268 ) ) ( not ( = ?auto_2193266 ?auto_2193269 ) ) ( not ( = ?auto_2193266 ?auto_2193270 ) ) ( not ( = ?auto_2193266 ?auto_2193271 ) ) ( not ( = ?auto_2193266 ?auto_2193272 ) ) ( not ( = ?auto_2193267 ?auto_2193268 ) ) ( not ( = ?auto_2193267 ?auto_2193269 ) ) ( not ( = ?auto_2193267 ?auto_2193270 ) ) ( not ( = ?auto_2193267 ?auto_2193271 ) ) ( not ( = ?auto_2193267 ?auto_2193272 ) ) ( not ( = ?auto_2193268 ?auto_2193269 ) ) ( not ( = ?auto_2193268 ?auto_2193270 ) ) ( not ( = ?auto_2193268 ?auto_2193271 ) ) ( not ( = ?auto_2193268 ?auto_2193272 ) ) ( not ( = ?auto_2193269 ?auto_2193270 ) ) ( not ( = ?auto_2193269 ?auto_2193271 ) ) ( not ( = ?auto_2193269 ?auto_2193272 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2193270 ?auto_2193271 ?auto_2193272 )
      ( MAKE-14CRATE-VERIFY ?auto_2193258 ?auto_2193259 ?auto_2193260 ?auto_2193262 ?auto_2193261 ?auto_2193263 ?auto_2193264 ?auto_2193265 ?auto_2193266 ?auto_2193267 ?auto_2193268 ?auto_2193269 ?auto_2193270 ?auto_2193271 ?auto_2193272 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2193433 - SURFACE
      ?auto_2193434 - SURFACE
      ?auto_2193435 - SURFACE
      ?auto_2193437 - SURFACE
      ?auto_2193436 - SURFACE
      ?auto_2193438 - SURFACE
      ?auto_2193439 - SURFACE
      ?auto_2193440 - SURFACE
      ?auto_2193441 - SURFACE
      ?auto_2193442 - SURFACE
      ?auto_2193443 - SURFACE
      ?auto_2193444 - SURFACE
      ?auto_2193445 - SURFACE
      ?auto_2193446 - SURFACE
      ?auto_2193447 - SURFACE
    )
    :vars
    (
      ?auto_2193450 - HOIST
      ?auto_2193449 - PLACE
      ?auto_2193448 - TRUCK
      ?auto_2193451 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2193450 ?auto_2193449 ) ( SURFACE-AT ?auto_2193446 ?auto_2193449 ) ( CLEAR ?auto_2193446 ) ( IS-CRATE ?auto_2193447 ) ( not ( = ?auto_2193446 ?auto_2193447 ) ) ( AVAILABLE ?auto_2193450 ) ( IN ?auto_2193447 ?auto_2193448 ) ( ON ?auto_2193446 ?auto_2193445 ) ( not ( = ?auto_2193445 ?auto_2193446 ) ) ( not ( = ?auto_2193445 ?auto_2193447 ) ) ( TRUCK-AT ?auto_2193448 ?auto_2193451 ) ( not ( = ?auto_2193451 ?auto_2193449 ) ) ( ON ?auto_2193434 ?auto_2193433 ) ( ON ?auto_2193435 ?auto_2193434 ) ( ON ?auto_2193437 ?auto_2193435 ) ( ON ?auto_2193436 ?auto_2193437 ) ( ON ?auto_2193438 ?auto_2193436 ) ( ON ?auto_2193439 ?auto_2193438 ) ( ON ?auto_2193440 ?auto_2193439 ) ( ON ?auto_2193441 ?auto_2193440 ) ( ON ?auto_2193442 ?auto_2193441 ) ( ON ?auto_2193443 ?auto_2193442 ) ( ON ?auto_2193444 ?auto_2193443 ) ( ON ?auto_2193445 ?auto_2193444 ) ( not ( = ?auto_2193433 ?auto_2193434 ) ) ( not ( = ?auto_2193433 ?auto_2193435 ) ) ( not ( = ?auto_2193433 ?auto_2193437 ) ) ( not ( = ?auto_2193433 ?auto_2193436 ) ) ( not ( = ?auto_2193433 ?auto_2193438 ) ) ( not ( = ?auto_2193433 ?auto_2193439 ) ) ( not ( = ?auto_2193433 ?auto_2193440 ) ) ( not ( = ?auto_2193433 ?auto_2193441 ) ) ( not ( = ?auto_2193433 ?auto_2193442 ) ) ( not ( = ?auto_2193433 ?auto_2193443 ) ) ( not ( = ?auto_2193433 ?auto_2193444 ) ) ( not ( = ?auto_2193433 ?auto_2193445 ) ) ( not ( = ?auto_2193433 ?auto_2193446 ) ) ( not ( = ?auto_2193433 ?auto_2193447 ) ) ( not ( = ?auto_2193434 ?auto_2193435 ) ) ( not ( = ?auto_2193434 ?auto_2193437 ) ) ( not ( = ?auto_2193434 ?auto_2193436 ) ) ( not ( = ?auto_2193434 ?auto_2193438 ) ) ( not ( = ?auto_2193434 ?auto_2193439 ) ) ( not ( = ?auto_2193434 ?auto_2193440 ) ) ( not ( = ?auto_2193434 ?auto_2193441 ) ) ( not ( = ?auto_2193434 ?auto_2193442 ) ) ( not ( = ?auto_2193434 ?auto_2193443 ) ) ( not ( = ?auto_2193434 ?auto_2193444 ) ) ( not ( = ?auto_2193434 ?auto_2193445 ) ) ( not ( = ?auto_2193434 ?auto_2193446 ) ) ( not ( = ?auto_2193434 ?auto_2193447 ) ) ( not ( = ?auto_2193435 ?auto_2193437 ) ) ( not ( = ?auto_2193435 ?auto_2193436 ) ) ( not ( = ?auto_2193435 ?auto_2193438 ) ) ( not ( = ?auto_2193435 ?auto_2193439 ) ) ( not ( = ?auto_2193435 ?auto_2193440 ) ) ( not ( = ?auto_2193435 ?auto_2193441 ) ) ( not ( = ?auto_2193435 ?auto_2193442 ) ) ( not ( = ?auto_2193435 ?auto_2193443 ) ) ( not ( = ?auto_2193435 ?auto_2193444 ) ) ( not ( = ?auto_2193435 ?auto_2193445 ) ) ( not ( = ?auto_2193435 ?auto_2193446 ) ) ( not ( = ?auto_2193435 ?auto_2193447 ) ) ( not ( = ?auto_2193437 ?auto_2193436 ) ) ( not ( = ?auto_2193437 ?auto_2193438 ) ) ( not ( = ?auto_2193437 ?auto_2193439 ) ) ( not ( = ?auto_2193437 ?auto_2193440 ) ) ( not ( = ?auto_2193437 ?auto_2193441 ) ) ( not ( = ?auto_2193437 ?auto_2193442 ) ) ( not ( = ?auto_2193437 ?auto_2193443 ) ) ( not ( = ?auto_2193437 ?auto_2193444 ) ) ( not ( = ?auto_2193437 ?auto_2193445 ) ) ( not ( = ?auto_2193437 ?auto_2193446 ) ) ( not ( = ?auto_2193437 ?auto_2193447 ) ) ( not ( = ?auto_2193436 ?auto_2193438 ) ) ( not ( = ?auto_2193436 ?auto_2193439 ) ) ( not ( = ?auto_2193436 ?auto_2193440 ) ) ( not ( = ?auto_2193436 ?auto_2193441 ) ) ( not ( = ?auto_2193436 ?auto_2193442 ) ) ( not ( = ?auto_2193436 ?auto_2193443 ) ) ( not ( = ?auto_2193436 ?auto_2193444 ) ) ( not ( = ?auto_2193436 ?auto_2193445 ) ) ( not ( = ?auto_2193436 ?auto_2193446 ) ) ( not ( = ?auto_2193436 ?auto_2193447 ) ) ( not ( = ?auto_2193438 ?auto_2193439 ) ) ( not ( = ?auto_2193438 ?auto_2193440 ) ) ( not ( = ?auto_2193438 ?auto_2193441 ) ) ( not ( = ?auto_2193438 ?auto_2193442 ) ) ( not ( = ?auto_2193438 ?auto_2193443 ) ) ( not ( = ?auto_2193438 ?auto_2193444 ) ) ( not ( = ?auto_2193438 ?auto_2193445 ) ) ( not ( = ?auto_2193438 ?auto_2193446 ) ) ( not ( = ?auto_2193438 ?auto_2193447 ) ) ( not ( = ?auto_2193439 ?auto_2193440 ) ) ( not ( = ?auto_2193439 ?auto_2193441 ) ) ( not ( = ?auto_2193439 ?auto_2193442 ) ) ( not ( = ?auto_2193439 ?auto_2193443 ) ) ( not ( = ?auto_2193439 ?auto_2193444 ) ) ( not ( = ?auto_2193439 ?auto_2193445 ) ) ( not ( = ?auto_2193439 ?auto_2193446 ) ) ( not ( = ?auto_2193439 ?auto_2193447 ) ) ( not ( = ?auto_2193440 ?auto_2193441 ) ) ( not ( = ?auto_2193440 ?auto_2193442 ) ) ( not ( = ?auto_2193440 ?auto_2193443 ) ) ( not ( = ?auto_2193440 ?auto_2193444 ) ) ( not ( = ?auto_2193440 ?auto_2193445 ) ) ( not ( = ?auto_2193440 ?auto_2193446 ) ) ( not ( = ?auto_2193440 ?auto_2193447 ) ) ( not ( = ?auto_2193441 ?auto_2193442 ) ) ( not ( = ?auto_2193441 ?auto_2193443 ) ) ( not ( = ?auto_2193441 ?auto_2193444 ) ) ( not ( = ?auto_2193441 ?auto_2193445 ) ) ( not ( = ?auto_2193441 ?auto_2193446 ) ) ( not ( = ?auto_2193441 ?auto_2193447 ) ) ( not ( = ?auto_2193442 ?auto_2193443 ) ) ( not ( = ?auto_2193442 ?auto_2193444 ) ) ( not ( = ?auto_2193442 ?auto_2193445 ) ) ( not ( = ?auto_2193442 ?auto_2193446 ) ) ( not ( = ?auto_2193442 ?auto_2193447 ) ) ( not ( = ?auto_2193443 ?auto_2193444 ) ) ( not ( = ?auto_2193443 ?auto_2193445 ) ) ( not ( = ?auto_2193443 ?auto_2193446 ) ) ( not ( = ?auto_2193443 ?auto_2193447 ) ) ( not ( = ?auto_2193444 ?auto_2193445 ) ) ( not ( = ?auto_2193444 ?auto_2193446 ) ) ( not ( = ?auto_2193444 ?auto_2193447 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2193445 ?auto_2193446 ?auto_2193447 )
      ( MAKE-14CRATE-VERIFY ?auto_2193433 ?auto_2193434 ?auto_2193435 ?auto_2193437 ?auto_2193436 ?auto_2193438 ?auto_2193439 ?auto_2193440 ?auto_2193441 ?auto_2193442 ?auto_2193443 ?auto_2193444 ?auto_2193445 ?auto_2193446 ?auto_2193447 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2193622 - SURFACE
      ?auto_2193623 - SURFACE
      ?auto_2193624 - SURFACE
      ?auto_2193626 - SURFACE
      ?auto_2193625 - SURFACE
      ?auto_2193627 - SURFACE
      ?auto_2193628 - SURFACE
      ?auto_2193629 - SURFACE
      ?auto_2193630 - SURFACE
      ?auto_2193631 - SURFACE
      ?auto_2193632 - SURFACE
      ?auto_2193633 - SURFACE
      ?auto_2193634 - SURFACE
      ?auto_2193635 - SURFACE
      ?auto_2193636 - SURFACE
    )
    :vars
    (
      ?auto_2193641 - HOIST
      ?auto_2193637 - PLACE
      ?auto_2193638 - TRUCK
      ?auto_2193639 - PLACE
      ?auto_2193640 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2193641 ?auto_2193637 ) ( SURFACE-AT ?auto_2193635 ?auto_2193637 ) ( CLEAR ?auto_2193635 ) ( IS-CRATE ?auto_2193636 ) ( not ( = ?auto_2193635 ?auto_2193636 ) ) ( AVAILABLE ?auto_2193641 ) ( ON ?auto_2193635 ?auto_2193634 ) ( not ( = ?auto_2193634 ?auto_2193635 ) ) ( not ( = ?auto_2193634 ?auto_2193636 ) ) ( TRUCK-AT ?auto_2193638 ?auto_2193639 ) ( not ( = ?auto_2193639 ?auto_2193637 ) ) ( HOIST-AT ?auto_2193640 ?auto_2193639 ) ( LIFTING ?auto_2193640 ?auto_2193636 ) ( not ( = ?auto_2193641 ?auto_2193640 ) ) ( ON ?auto_2193623 ?auto_2193622 ) ( ON ?auto_2193624 ?auto_2193623 ) ( ON ?auto_2193626 ?auto_2193624 ) ( ON ?auto_2193625 ?auto_2193626 ) ( ON ?auto_2193627 ?auto_2193625 ) ( ON ?auto_2193628 ?auto_2193627 ) ( ON ?auto_2193629 ?auto_2193628 ) ( ON ?auto_2193630 ?auto_2193629 ) ( ON ?auto_2193631 ?auto_2193630 ) ( ON ?auto_2193632 ?auto_2193631 ) ( ON ?auto_2193633 ?auto_2193632 ) ( ON ?auto_2193634 ?auto_2193633 ) ( not ( = ?auto_2193622 ?auto_2193623 ) ) ( not ( = ?auto_2193622 ?auto_2193624 ) ) ( not ( = ?auto_2193622 ?auto_2193626 ) ) ( not ( = ?auto_2193622 ?auto_2193625 ) ) ( not ( = ?auto_2193622 ?auto_2193627 ) ) ( not ( = ?auto_2193622 ?auto_2193628 ) ) ( not ( = ?auto_2193622 ?auto_2193629 ) ) ( not ( = ?auto_2193622 ?auto_2193630 ) ) ( not ( = ?auto_2193622 ?auto_2193631 ) ) ( not ( = ?auto_2193622 ?auto_2193632 ) ) ( not ( = ?auto_2193622 ?auto_2193633 ) ) ( not ( = ?auto_2193622 ?auto_2193634 ) ) ( not ( = ?auto_2193622 ?auto_2193635 ) ) ( not ( = ?auto_2193622 ?auto_2193636 ) ) ( not ( = ?auto_2193623 ?auto_2193624 ) ) ( not ( = ?auto_2193623 ?auto_2193626 ) ) ( not ( = ?auto_2193623 ?auto_2193625 ) ) ( not ( = ?auto_2193623 ?auto_2193627 ) ) ( not ( = ?auto_2193623 ?auto_2193628 ) ) ( not ( = ?auto_2193623 ?auto_2193629 ) ) ( not ( = ?auto_2193623 ?auto_2193630 ) ) ( not ( = ?auto_2193623 ?auto_2193631 ) ) ( not ( = ?auto_2193623 ?auto_2193632 ) ) ( not ( = ?auto_2193623 ?auto_2193633 ) ) ( not ( = ?auto_2193623 ?auto_2193634 ) ) ( not ( = ?auto_2193623 ?auto_2193635 ) ) ( not ( = ?auto_2193623 ?auto_2193636 ) ) ( not ( = ?auto_2193624 ?auto_2193626 ) ) ( not ( = ?auto_2193624 ?auto_2193625 ) ) ( not ( = ?auto_2193624 ?auto_2193627 ) ) ( not ( = ?auto_2193624 ?auto_2193628 ) ) ( not ( = ?auto_2193624 ?auto_2193629 ) ) ( not ( = ?auto_2193624 ?auto_2193630 ) ) ( not ( = ?auto_2193624 ?auto_2193631 ) ) ( not ( = ?auto_2193624 ?auto_2193632 ) ) ( not ( = ?auto_2193624 ?auto_2193633 ) ) ( not ( = ?auto_2193624 ?auto_2193634 ) ) ( not ( = ?auto_2193624 ?auto_2193635 ) ) ( not ( = ?auto_2193624 ?auto_2193636 ) ) ( not ( = ?auto_2193626 ?auto_2193625 ) ) ( not ( = ?auto_2193626 ?auto_2193627 ) ) ( not ( = ?auto_2193626 ?auto_2193628 ) ) ( not ( = ?auto_2193626 ?auto_2193629 ) ) ( not ( = ?auto_2193626 ?auto_2193630 ) ) ( not ( = ?auto_2193626 ?auto_2193631 ) ) ( not ( = ?auto_2193626 ?auto_2193632 ) ) ( not ( = ?auto_2193626 ?auto_2193633 ) ) ( not ( = ?auto_2193626 ?auto_2193634 ) ) ( not ( = ?auto_2193626 ?auto_2193635 ) ) ( not ( = ?auto_2193626 ?auto_2193636 ) ) ( not ( = ?auto_2193625 ?auto_2193627 ) ) ( not ( = ?auto_2193625 ?auto_2193628 ) ) ( not ( = ?auto_2193625 ?auto_2193629 ) ) ( not ( = ?auto_2193625 ?auto_2193630 ) ) ( not ( = ?auto_2193625 ?auto_2193631 ) ) ( not ( = ?auto_2193625 ?auto_2193632 ) ) ( not ( = ?auto_2193625 ?auto_2193633 ) ) ( not ( = ?auto_2193625 ?auto_2193634 ) ) ( not ( = ?auto_2193625 ?auto_2193635 ) ) ( not ( = ?auto_2193625 ?auto_2193636 ) ) ( not ( = ?auto_2193627 ?auto_2193628 ) ) ( not ( = ?auto_2193627 ?auto_2193629 ) ) ( not ( = ?auto_2193627 ?auto_2193630 ) ) ( not ( = ?auto_2193627 ?auto_2193631 ) ) ( not ( = ?auto_2193627 ?auto_2193632 ) ) ( not ( = ?auto_2193627 ?auto_2193633 ) ) ( not ( = ?auto_2193627 ?auto_2193634 ) ) ( not ( = ?auto_2193627 ?auto_2193635 ) ) ( not ( = ?auto_2193627 ?auto_2193636 ) ) ( not ( = ?auto_2193628 ?auto_2193629 ) ) ( not ( = ?auto_2193628 ?auto_2193630 ) ) ( not ( = ?auto_2193628 ?auto_2193631 ) ) ( not ( = ?auto_2193628 ?auto_2193632 ) ) ( not ( = ?auto_2193628 ?auto_2193633 ) ) ( not ( = ?auto_2193628 ?auto_2193634 ) ) ( not ( = ?auto_2193628 ?auto_2193635 ) ) ( not ( = ?auto_2193628 ?auto_2193636 ) ) ( not ( = ?auto_2193629 ?auto_2193630 ) ) ( not ( = ?auto_2193629 ?auto_2193631 ) ) ( not ( = ?auto_2193629 ?auto_2193632 ) ) ( not ( = ?auto_2193629 ?auto_2193633 ) ) ( not ( = ?auto_2193629 ?auto_2193634 ) ) ( not ( = ?auto_2193629 ?auto_2193635 ) ) ( not ( = ?auto_2193629 ?auto_2193636 ) ) ( not ( = ?auto_2193630 ?auto_2193631 ) ) ( not ( = ?auto_2193630 ?auto_2193632 ) ) ( not ( = ?auto_2193630 ?auto_2193633 ) ) ( not ( = ?auto_2193630 ?auto_2193634 ) ) ( not ( = ?auto_2193630 ?auto_2193635 ) ) ( not ( = ?auto_2193630 ?auto_2193636 ) ) ( not ( = ?auto_2193631 ?auto_2193632 ) ) ( not ( = ?auto_2193631 ?auto_2193633 ) ) ( not ( = ?auto_2193631 ?auto_2193634 ) ) ( not ( = ?auto_2193631 ?auto_2193635 ) ) ( not ( = ?auto_2193631 ?auto_2193636 ) ) ( not ( = ?auto_2193632 ?auto_2193633 ) ) ( not ( = ?auto_2193632 ?auto_2193634 ) ) ( not ( = ?auto_2193632 ?auto_2193635 ) ) ( not ( = ?auto_2193632 ?auto_2193636 ) ) ( not ( = ?auto_2193633 ?auto_2193634 ) ) ( not ( = ?auto_2193633 ?auto_2193635 ) ) ( not ( = ?auto_2193633 ?auto_2193636 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2193634 ?auto_2193635 ?auto_2193636 )
      ( MAKE-14CRATE-VERIFY ?auto_2193622 ?auto_2193623 ?auto_2193624 ?auto_2193626 ?auto_2193625 ?auto_2193627 ?auto_2193628 ?auto_2193629 ?auto_2193630 ?auto_2193631 ?auto_2193632 ?auto_2193633 ?auto_2193634 ?auto_2193635 ?auto_2193636 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2193825 - SURFACE
      ?auto_2193826 - SURFACE
      ?auto_2193827 - SURFACE
      ?auto_2193829 - SURFACE
      ?auto_2193828 - SURFACE
      ?auto_2193830 - SURFACE
      ?auto_2193831 - SURFACE
      ?auto_2193832 - SURFACE
      ?auto_2193833 - SURFACE
      ?auto_2193834 - SURFACE
      ?auto_2193835 - SURFACE
      ?auto_2193836 - SURFACE
      ?auto_2193837 - SURFACE
      ?auto_2193838 - SURFACE
      ?auto_2193839 - SURFACE
    )
    :vars
    (
      ?auto_2193840 - HOIST
      ?auto_2193844 - PLACE
      ?auto_2193842 - TRUCK
      ?auto_2193843 - PLACE
      ?auto_2193841 - HOIST
      ?auto_2193845 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2193840 ?auto_2193844 ) ( SURFACE-AT ?auto_2193838 ?auto_2193844 ) ( CLEAR ?auto_2193838 ) ( IS-CRATE ?auto_2193839 ) ( not ( = ?auto_2193838 ?auto_2193839 ) ) ( AVAILABLE ?auto_2193840 ) ( ON ?auto_2193838 ?auto_2193837 ) ( not ( = ?auto_2193837 ?auto_2193838 ) ) ( not ( = ?auto_2193837 ?auto_2193839 ) ) ( TRUCK-AT ?auto_2193842 ?auto_2193843 ) ( not ( = ?auto_2193843 ?auto_2193844 ) ) ( HOIST-AT ?auto_2193841 ?auto_2193843 ) ( not ( = ?auto_2193840 ?auto_2193841 ) ) ( AVAILABLE ?auto_2193841 ) ( SURFACE-AT ?auto_2193839 ?auto_2193843 ) ( ON ?auto_2193839 ?auto_2193845 ) ( CLEAR ?auto_2193839 ) ( not ( = ?auto_2193838 ?auto_2193845 ) ) ( not ( = ?auto_2193839 ?auto_2193845 ) ) ( not ( = ?auto_2193837 ?auto_2193845 ) ) ( ON ?auto_2193826 ?auto_2193825 ) ( ON ?auto_2193827 ?auto_2193826 ) ( ON ?auto_2193829 ?auto_2193827 ) ( ON ?auto_2193828 ?auto_2193829 ) ( ON ?auto_2193830 ?auto_2193828 ) ( ON ?auto_2193831 ?auto_2193830 ) ( ON ?auto_2193832 ?auto_2193831 ) ( ON ?auto_2193833 ?auto_2193832 ) ( ON ?auto_2193834 ?auto_2193833 ) ( ON ?auto_2193835 ?auto_2193834 ) ( ON ?auto_2193836 ?auto_2193835 ) ( ON ?auto_2193837 ?auto_2193836 ) ( not ( = ?auto_2193825 ?auto_2193826 ) ) ( not ( = ?auto_2193825 ?auto_2193827 ) ) ( not ( = ?auto_2193825 ?auto_2193829 ) ) ( not ( = ?auto_2193825 ?auto_2193828 ) ) ( not ( = ?auto_2193825 ?auto_2193830 ) ) ( not ( = ?auto_2193825 ?auto_2193831 ) ) ( not ( = ?auto_2193825 ?auto_2193832 ) ) ( not ( = ?auto_2193825 ?auto_2193833 ) ) ( not ( = ?auto_2193825 ?auto_2193834 ) ) ( not ( = ?auto_2193825 ?auto_2193835 ) ) ( not ( = ?auto_2193825 ?auto_2193836 ) ) ( not ( = ?auto_2193825 ?auto_2193837 ) ) ( not ( = ?auto_2193825 ?auto_2193838 ) ) ( not ( = ?auto_2193825 ?auto_2193839 ) ) ( not ( = ?auto_2193825 ?auto_2193845 ) ) ( not ( = ?auto_2193826 ?auto_2193827 ) ) ( not ( = ?auto_2193826 ?auto_2193829 ) ) ( not ( = ?auto_2193826 ?auto_2193828 ) ) ( not ( = ?auto_2193826 ?auto_2193830 ) ) ( not ( = ?auto_2193826 ?auto_2193831 ) ) ( not ( = ?auto_2193826 ?auto_2193832 ) ) ( not ( = ?auto_2193826 ?auto_2193833 ) ) ( not ( = ?auto_2193826 ?auto_2193834 ) ) ( not ( = ?auto_2193826 ?auto_2193835 ) ) ( not ( = ?auto_2193826 ?auto_2193836 ) ) ( not ( = ?auto_2193826 ?auto_2193837 ) ) ( not ( = ?auto_2193826 ?auto_2193838 ) ) ( not ( = ?auto_2193826 ?auto_2193839 ) ) ( not ( = ?auto_2193826 ?auto_2193845 ) ) ( not ( = ?auto_2193827 ?auto_2193829 ) ) ( not ( = ?auto_2193827 ?auto_2193828 ) ) ( not ( = ?auto_2193827 ?auto_2193830 ) ) ( not ( = ?auto_2193827 ?auto_2193831 ) ) ( not ( = ?auto_2193827 ?auto_2193832 ) ) ( not ( = ?auto_2193827 ?auto_2193833 ) ) ( not ( = ?auto_2193827 ?auto_2193834 ) ) ( not ( = ?auto_2193827 ?auto_2193835 ) ) ( not ( = ?auto_2193827 ?auto_2193836 ) ) ( not ( = ?auto_2193827 ?auto_2193837 ) ) ( not ( = ?auto_2193827 ?auto_2193838 ) ) ( not ( = ?auto_2193827 ?auto_2193839 ) ) ( not ( = ?auto_2193827 ?auto_2193845 ) ) ( not ( = ?auto_2193829 ?auto_2193828 ) ) ( not ( = ?auto_2193829 ?auto_2193830 ) ) ( not ( = ?auto_2193829 ?auto_2193831 ) ) ( not ( = ?auto_2193829 ?auto_2193832 ) ) ( not ( = ?auto_2193829 ?auto_2193833 ) ) ( not ( = ?auto_2193829 ?auto_2193834 ) ) ( not ( = ?auto_2193829 ?auto_2193835 ) ) ( not ( = ?auto_2193829 ?auto_2193836 ) ) ( not ( = ?auto_2193829 ?auto_2193837 ) ) ( not ( = ?auto_2193829 ?auto_2193838 ) ) ( not ( = ?auto_2193829 ?auto_2193839 ) ) ( not ( = ?auto_2193829 ?auto_2193845 ) ) ( not ( = ?auto_2193828 ?auto_2193830 ) ) ( not ( = ?auto_2193828 ?auto_2193831 ) ) ( not ( = ?auto_2193828 ?auto_2193832 ) ) ( not ( = ?auto_2193828 ?auto_2193833 ) ) ( not ( = ?auto_2193828 ?auto_2193834 ) ) ( not ( = ?auto_2193828 ?auto_2193835 ) ) ( not ( = ?auto_2193828 ?auto_2193836 ) ) ( not ( = ?auto_2193828 ?auto_2193837 ) ) ( not ( = ?auto_2193828 ?auto_2193838 ) ) ( not ( = ?auto_2193828 ?auto_2193839 ) ) ( not ( = ?auto_2193828 ?auto_2193845 ) ) ( not ( = ?auto_2193830 ?auto_2193831 ) ) ( not ( = ?auto_2193830 ?auto_2193832 ) ) ( not ( = ?auto_2193830 ?auto_2193833 ) ) ( not ( = ?auto_2193830 ?auto_2193834 ) ) ( not ( = ?auto_2193830 ?auto_2193835 ) ) ( not ( = ?auto_2193830 ?auto_2193836 ) ) ( not ( = ?auto_2193830 ?auto_2193837 ) ) ( not ( = ?auto_2193830 ?auto_2193838 ) ) ( not ( = ?auto_2193830 ?auto_2193839 ) ) ( not ( = ?auto_2193830 ?auto_2193845 ) ) ( not ( = ?auto_2193831 ?auto_2193832 ) ) ( not ( = ?auto_2193831 ?auto_2193833 ) ) ( not ( = ?auto_2193831 ?auto_2193834 ) ) ( not ( = ?auto_2193831 ?auto_2193835 ) ) ( not ( = ?auto_2193831 ?auto_2193836 ) ) ( not ( = ?auto_2193831 ?auto_2193837 ) ) ( not ( = ?auto_2193831 ?auto_2193838 ) ) ( not ( = ?auto_2193831 ?auto_2193839 ) ) ( not ( = ?auto_2193831 ?auto_2193845 ) ) ( not ( = ?auto_2193832 ?auto_2193833 ) ) ( not ( = ?auto_2193832 ?auto_2193834 ) ) ( not ( = ?auto_2193832 ?auto_2193835 ) ) ( not ( = ?auto_2193832 ?auto_2193836 ) ) ( not ( = ?auto_2193832 ?auto_2193837 ) ) ( not ( = ?auto_2193832 ?auto_2193838 ) ) ( not ( = ?auto_2193832 ?auto_2193839 ) ) ( not ( = ?auto_2193832 ?auto_2193845 ) ) ( not ( = ?auto_2193833 ?auto_2193834 ) ) ( not ( = ?auto_2193833 ?auto_2193835 ) ) ( not ( = ?auto_2193833 ?auto_2193836 ) ) ( not ( = ?auto_2193833 ?auto_2193837 ) ) ( not ( = ?auto_2193833 ?auto_2193838 ) ) ( not ( = ?auto_2193833 ?auto_2193839 ) ) ( not ( = ?auto_2193833 ?auto_2193845 ) ) ( not ( = ?auto_2193834 ?auto_2193835 ) ) ( not ( = ?auto_2193834 ?auto_2193836 ) ) ( not ( = ?auto_2193834 ?auto_2193837 ) ) ( not ( = ?auto_2193834 ?auto_2193838 ) ) ( not ( = ?auto_2193834 ?auto_2193839 ) ) ( not ( = ?auto_2193834 ?auto_2193845 ) ) ( not ( = ?auto_2193835 ?auto_2193836 ) ) ( not ( = ?auto_2193835 ?auto_2193837 ) ) ( not ( = ?auto_2193835 ?auto_2193838 ) ) ( not ( = ?auto_2193835 ?auto_2193839 ) ) ( not ( = ?auto_2193835 ?auto_2193845 ) ) ( not ( = ?auto_2193836 ?auto_2193837 ) ) ( not ( = ?auto_2193836 ?auto_2193838 ) ) ( not ( = ?auto_2193836 ?auto_2193839 ) ) ( not ( = ?auto_2193836 ?auto_2193845 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2193837 ?auto_2193838 ?auto_2193839 )
      ( MAKE-14CRATE-VERIFY ?auto_2193825 ?auto_2193826 ?auto_2193827 ?auto_2193829 ?auto_2193828 ?auto_2193830 ?auto_2193831 ?auto_2193832 ?auto_2193833 ?auto_2193834 ?auto_2193835 ?auto_2193836 ?auto_2193837 ?auto_2193838 ?auto_2193839 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2194029 - SURFACE
      ?auto_2194030 - SURFACE
      ?auto_2194031 - SURFACE
      ?auto_2194033 - SURFACE
      ?auto_2194032 - SURFACE
      ?auto_2194034 - SURFACE
      ?auto_2194035 - SURFACE
      ?auto_2194036 - SURFACE
      ?auto_2194037 - SURFACE
      ?auto_2194038 - SURFACE
      ?auto_2194039 - SURFACE
      ?auto_2194040 - SURFACE
      ?auto_2194041 - SURFACE
      ?auto_2194042 - SURFACE
      ?auto_2194043 - SURFACE
    )
    :vars
    (
      ?auto_2194044 - HOIST
      ?auto_2194049 - PLACE
      ?auto_2194045 - PLACE
      ?auto_2194046 - HOIST
      ?auto_2194048 - SURFACE
      ?auto_2194047 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194044 ?auto_2194049 ) ( SURFACE-AT ?auto_2194042 ?auto_2194049 ) ( CLEAR ?auto_2194042 ) ( IS-CRATE ?auto_2194043 ) ( not ( = ?auto_2194042 ?auto_2194043 ) ) ( AVAILABLE ?auto_2194044 ) ( ON ?auto_2194042 ?auto_2194041 ) ( not ( = ?auto_2194041 ?auto_2194042 ) ) ( not ( = ?auto_2194041 ?auto_2194043 ) ) ( not ( = ?auto_2194045 ?auto_2194049 ) ) ( HOIST-AT ?auto_2194046 ?auto_2194045 ) ( not ( = ?auto_2194044 ?auto_2194046 ) ) ( AVAILABLE ?auto_2194046 ) ( SURFACE-AT ?auto_2194043 ?auto_2194045 ) ( ON ?auto_2194043 ?auto_2194048 ) ( CLEAR ?auto_2194043 ) ( not ( = ?auto_2194042 ?auto_2194048 ) ) ( not ( = ?auto_2194043 ?auto_2194048 ) ) ( not ( = ?auto_2194041 ?auto_2194048 ) ) ( TRUCK-AT ?auto_2194047 ?auto_2194049 ) ( ON ?auto_2194030 ?auto_2194029 ) ( ON ?auto_2194031 ?auto_2194030 ) ( ON ?auto_2194033 ?auto_2194031 ) ( ON ?auto_2194032 ?auto_2194033 ) ( ON ?auto_2194034 ?auto_2194032 ) ( ON ?auto_2194035 ?auto_2194034 ) ( ON ?auto_2194036 ?auto_2194035 ) ( ON ?auto_2194037 ?auto_2194036 ) ( ON ?auto_2194038 ?auto_2194037 ) ( ON ?auto_2194039 ?auto_2194038 ) ( ON ?auto_2194040 ?auto_2194039 ) ( ON ?auto_2194041 ?auto_2194040 ) ( not ( = ?auto_2194029 ?auto_2194030 ) ) ( not ( = ?auto_2194029 ?auto_2194031 ) ) ( not ( = ?auto_2194029 ?auto_2194033 ) ) ( not ( = ?auto_2194029 ?auto_2194032 ) ) ( not ( = ?auto_2194029 ?auto_2194034 ) ) ( not ( = ?auto_2194029 ?auto_2194035 ) ) ( not ( = ?auto_2194029 ?auto_2194036 ) ) ( not ( = ?auto_2194029 ?auto_2194037 ) ) ( not ( = ?auto_2194029 ?auto_2194038 ) ) ( not ( = ?auto_2194029 ?auto_2194039 ) ) ( not ( = ?auto_2194029 ?auto_2194040 ) ) ( not ( = ?auto_2194029 ?auto_2194041 ) ) ( not ( = ?auto_2194029 ?auto_2194042 ) ) ( not ( = ?auto_2194029 ?auto_2194043 ) ) ( not ( = ?auto_2194029 ?auto_2194048 ) ) ( not ( = ?auto_2194030 ?auto_2194031 ) ) ( not ( = ?auto_2194030 ?auto_2194033 ) ) ( not ( = ?auto_2194030 ?auto_2194032 ) ) ( not ( = ?auto_2194030 ?auto_2194034 ) ) ( not ( = ?auto_2194030 ?auto_2194035 ) ) ( not ( = ?auto_2194030 ?auto_2194036 ) ) ( not ( = ?auto_2194030 ?auto_2194037 ) ) ( not ( = ?auto_2194030 ?auto_2194038 ) ) ( not ( = ?auto_2194030 ?auto_2194039 ) ) ( not ( = ?auto_2194030 ?auto_2194040 ) ) ( not ( = ?auto_2194030 ?auto_2194041 ) ) ( not ( = ?auto_2194030 ?auto_2194042 ) ) ( not ( = ?auto_2194030 ?auto_2194043 ) ) ( not ( = ?auto_2194030 ?auto_2194048 ) ) ( not ( = ?auto_2194031 ?auto_2194033 ) ) ( not ( = ?auto_2194031 ?auto_2194032 ) ) ( not ( = ?auto_2194031 ?auto_2194034 ) ) ( not ( = ?auto_2194031 ?auto_2194035 ) ) ( not ( = ?auto_2194031 ?auto_2194036 ) ) ( not ( = ?auto_2194031 ?auto_2194037 ) ) ( not ( = ?auto_2194031 ?auto_2194038 ) ) ( not ( = ?auto_2194031 ?auto_2194039 ) ) ( not ( = ?auto_2194031 ?auto_2194040 ) ) ( not ( = ?auto_2194031 ?auto_2194041 ) ) ( not ( = ?auto_2194031 ?auto_2194042 ) ) ( not ( = ?auto_2194031 ?auto_2194043 ) ) ( not ( = ?auto_2194031 ?auto_2194048 ) ) ( not ( = ?auto_2194033 ?auto_2194032 ) ) ( not ( = ?auto_2194033 ?auto_2194034 ) ) ( not ( = ?auto_2194033 ?auto_2194035 ) ) ( not ( = ?auto_2194033 ?auto_2194036 ) ) ( not ( = ?auto_2194033 ?auto_2194037 ) ) ( not ( = ?auto_2194033 ?auto_2194038 ) ) ( not ( = ?auto_2194033 ?auto_2194039 ) ) ( not ( = ?auto_2194033 ?auto_2194040 ) ) ( not ( = ?auto_2194033 ?auto_2194041 ) ) ( not ( = ?auto_2194033 ?auto_2194042 ) ) ( not ( = ?auto_2194033 ?auto_2194043 ) ) ( not ( = ?auto_2194033 ?auto_2194048 ) ) ( not ( = ?auto_2194032 ?auto_2194034 ) ) ( not ( = ?auto_2194032 ?auto_2194035 ) ) ( not ( = ?auto_2194032 ?auto_2194036 ) ) ( not ( = ?auto_2194032 ?auto_2194037 ) ) ( not ( = ?auto_2194032 ?auto_2194038 ) ) ( not ( = ?auto_2194032 ?auto_2194039 ) ) ( not ( = ?auto_2194032 ?auto_2194040 ) ) ( not ( = ?auto_2194032 ?auto_2194041 ) ) ( not ( = ?auto_2194032 ?auto_2194042 ) ) ( not ( = ?auto_2194032 ?auto_2194043 ) ) ( not ( = ?auto_2194032 ?auto_2194048 ) ) ( not ( = ?auto_2194034 ?auto_2194035 ) ) ( not ( = ?auto_2194034 ?auto_2194036 ) ) ( not ( = ?auto_2194034 ?auto_2194037 ) ) ( not ( = ?auto_2194034 ?auto_2194038 ) ) ( not ( = ?auto_2194034 ?auto_2194039 ) ) ( not ( = ?auto_2194034 ?auto_2194040 ) ) ( not ( = ?auto_2194034 ?auto_2194041 ) ) ( not ( = ?auto_2194034 ?auto_2194042 ) ) ( not ( = ?auto_2194034 ?auto_2194043 ) ) ( not ( = ?auto_2194034 ?auto_2194048 ) ) ( not ( = ?auto_2194035 ?auto_2194036 ) ) ( not ( = ?auto_2194035 ?auto_2194037 ) ) ( not ( = ?auto_2194035 ?auto_2194038 ) ) ( not ( = ?auto_2194035 ?auto_2194039 ) ) ( not ( = ?auto_2194035 ?auto_2194040 ) ) ( not ( = ?auto_2194035 ?auto_2194041 ) ) ( not ( = ?auto_2194035 ?auto_2194042 ) ) ( not ( = ?auto_2194035 ?auto_2194043 ) ) ( not ( = ?auto_2194035 ?auto_2194048 ) ) ( not ( = ?auto_2194036 ?auto_2194037 ) ) ( not ( = ?auto_2194036 ?auto_2194038 ) ) ( not ( = ?auto_2194036 ?auto_2194039 ) ) ( not ( = ?auto_2194036 ?auto_2194040 ) ) ( not ( = ?auto_2194036 ?auto_2194041 ) ) ( not ( = ?auto_2194036 ?auto_2194042 ) ) ( not ( = ?auto_2194036 ?auto_2194043 ) ) ( not ( = ?auto_2194036 ?auto_2194048 ) ) ( not ( = ?auto_2194037 ?auto_2194038 ) ) ( not ( = ?auto_2194037 ?auto_2194039 ) ) ( not ( = ?auto_2194037 ?auto_2194040 ) ) ( not ( = ?auto_2194037 ?auto_2194041 ) ) ( not ( = ?auto_2194037 ?auto_2194042 ) ) ( not ( = ?auto_2194037 ?auto_2194043 ) ) ( not ( = ?auto_2194037 ?auto_2194048 ) ) ( not ( = ?auto_2194038 ?auto_2194039 ) ) ( not ( = ?auto_2194038 ?auto_2194040 ) ) ( not ( = ?auto_2194038 ?auto_2194041 ) ) ( not ( = ?auto_2194038 ?auto_2194042 ) ) ( not ( = ?auto_2194038 ?auto_2194043 ) ) ( not ( = ?auto_2194038 ?auto_2194048 ) ) ( not ( = ?auto_2194039 ?auto_2194040 ) ) ( not ( = ?auto_2194039 ?auto_2194041 ) ) ( not ( = ?auto_2194039 ?auto_2194042 ) ) ( not ( = ?auto_2194039 ?auto_2194043 ) ) ( not ( = ?auto_2194039 ?auto_2194048 ) ) ( not ( = ?auto_2194040 ?auto_2194041 ) ) ( not ( = ?auto_2194040 ?auto_2194042 ) ) ( not ( = ?auto_2194040 ?auto_2194043 ) ) ( not ( = ?auto_2194040 ?auto_2194048 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194041 ?auto_2194042 ?auto_2194043 )
      ( MAKE-14CRATE-VERIFY ?auto_2194029 ?auto_2194030 ?auto_2194031 ?auto_2194033 ?auto_2194032 ?auto_2194034 ?auto_2194035 ?auto_2194036 ?auto_2194037 ?auto_2194038 ?auto_2194039 ?auto_2194040 ?auto_2194041 ?auto_2194042 ?auto_2194043 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2194233 - SURFACE
      ?auto_2194234 - SURFACE
      ?auto_2194235 - SURFACE
      ?auto_2194237 - SURFACE
      ?auto_2194236 - SURFACE
      ?auto_2194238 - SURFACE
      ?auto_2194239 - SURFACE
      ?auto_2194240 - SURFACE
      ?auto_2194241 - SURFACE
      ?auto_2194242 - SURFACE
      ?auto_2194243 - SURFACE
      ?auto_2194244 - SURFACE
      ?auto_2194245 - SURFACE
      ?auto_2194246 - SURFACE
      ?auto_2194247 - SURFACE
    )
    :vars
    (
      ?auto_2194248 - HOIST
      ?auto_2194252 - PLACE
      ?auto_2194249 - PLACE
      ?auto_2194253 - HOIST
      ?auto_2194250 - SURFACE
      ?auto_2194251 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194248 ?auto_2194252 ) ( IS-CRATE ?auto_2194247 ) ( not ( = ?auto_2194246 ?auto_2194247 ) ) ( not ( = ?auto_2194245 ?auto_2194246 ) ) ( not ( = ?auto_2194245 ?auto_2194247 ) ) ( not ( = ?auto_2194249 ?auto_2194252 ) ) ( HOIST-AT ?auto_2194253 ?auto_2194249 ) ( not ( = ?auto_2194248 ?auto_2194253 ) ) ( AVAILABLE ?auto_2194253 ) ( SURFACE-AT ?auto_2194247 ?auto_2194249 ) ( ON ?auto_2194247 ?auto_2194250 ) ( CLEAR ?auto_2194247 ) ( not ( = ?auto_2194246 ?auto_2194250 ) ) ( not ( = ?auto_2194247 ?auto_2194250 ) ) ( not ( = ?auto_2194245 ?auto_2194250 ) ) ( TRUCK-AT ?auto_2194251 ?auto_2194252 ) ( SURFACE-AT ?auto_2194245 ?auto_2194252 ) ( CLEAR ?auto_2194245 ) ( LIFTING ?auto_2194248 ?auto_2194246 ) ( IS-CRATE ?auto_2194246 ) ( ON ?auto_2194234 ?auto_2194233 ) ( ON ?auto_2194235 ?auto_2194234 ) ( ON ?auto_2194237 ?auto_2194235 ) ( ON ?auto_2194236 ?auto_2194237 ) ( ON ?auto_2194238 ?auto_2194236 ) ( ON ?auto_2194239 ?auto_2194238 ) ( ON ?auto_2194240 ?auto_2194239 ) ( ON ?auto_2194241 ?auto_2194240 ) ( ON ?auto_2194242 ?auto_2194241 ) ( ON ?auto_2194243 ?auto_2194242 ) ( ON ?auto_2194244 ?auto_2194243 ) ( ON ?auto_2194245 ?auto_2194244 ) ( not ( = ?auto_2194233 ?auto_2194234 ) ) ( not ( = ?auto_2194233 ?auto_2194235 ) ) ( not ( = ?auto_2194233 ?auto_2194237 ) ) ( not ( = ?auto_2194233 ?auto_2194236 ) ) ( not ( = ?auto_2194233 ?auto_2194238 ) ) ( not ( = ?auto_2194233 ?auto_2194239 ) ) ( not ( = ?auto_2194233 ?auto_2194240 ) ) ( not ( = ?auto_2194233 ?auto_2194241 ) ) ( not ( = ?auto_2194233 ?auto_2194242 ) ) ( not ( = ?auto_2194233 ?auto_2194243 ) ) ( not ( = ?auto_2194233 ?auto_2194244 ) ) ( not ( = ?auto_2194233 ?auto_2194245 ) ) ( not ( = ?auto_2194233 ?auto_2194246 ) ) ( not ( = ?auto_2194233 ?auto_2194247 ) ) ( not ( = ?auto_2194233 ?auto_2194250 ) ) ( not ( = ?auto_2194234 ?auto_2194235 ) ) ( not ( = ?auto_2194234 ?auto_2194237 ) ) ( not ( = ?auto_2194234 ?auto_2194236 ) ) ( not ( = ?auto_2194234 ?auto_2194238 ) ) ( not ( = ?auto_2194234 ?auto_2194239 ) ) ( not ( = ?auto_2194234 ?auto_2194240 ) ) ( not ( = ?auto_2194234 ?auto_2194241 ) ) ( not ( = ?auto_2194234 ?auto_2194242 ) ) ( not ( = ?auto_2194234 ?auto_2194243 ) ) ( not ( = ?auto_2194234 ?auto_2194244 ) ) ( not ( = ?auto_2194234 ?auto_2194245 ) ) ( not ( = ?auto_2194234 ?auto_2194246 ) ) ( not ( = ?auto_2194234 ?auto_2194247 ) ) ( not ( = ?auto_2194234 ?auto_2194250 ) ) ( not ( = ?auto_2194235 ?auto_2194237 ) ) ( not ( = ?auto_2194235 ?auto_2194236 ) ) ( not ( = ?auto_2194235 ?auto_2194238 ) ) ( not ( = ?auto_2194235 ?auto_2194239 ) ) ( not ( = ?auto_2194235 ?auto_2194240 ) ) ( not ( = ?auto_2194235 ?auto_2194241 ) ) ( not ( = ?auto_2194235 ?auto_2194242 ) ) ( not ( = ?auto_2194235 ?auto_2194243 ) ) ( not ( = ?auto_2194235 ?auto_2194244 ) ) ( not ( = ?auto_2194235 ?auto_2194245 ) ) ( not ( = ?auto_2194235 ?auto_2194246 ) ) ( not ( = ?auto_2194235 ?auto_2194247 ) ) ( not ( = ?auto_2194235 ?auto_2194250 ) ) ( not ( = ?auto_2194237 ?auto_2194236 ) ) ( not ( = ?auto_2194237 ?auto_2194238 ) ) ( not ( = ?auto_2194237 ?auto_2194239 ) ) ( not ( = ?auto_2194237 ?auto_2194240 ) ) ( not ( = ?auto_2194237 ?auto_2194241 ) ) ( not ( = ?auto_2194237 ?auto_2194242 ) ) ( not ( = ?auto_2194237 ?auto_2194243 ) ) ( not ( = ?auto_2194237 ?auto_2194244 ) ) ( not ( = ?auto_2194237 ?auto_2194245 ) ) ( not ( = ?auto_2194237 ?auto_2194246 ) ) ( not ( = ?auto_2194237 ?auto_2194247 ) ) ( not ( = ?auto_2194237 ?auto_2194250 ) ) ( not ( = ?auto_2194236 ?auto_2194238 ) ) ( not ( = ?auto_2194236 ?auto_2194239 ) ) ( not ( = ?auto_2194236 ?auto_2194240 ) ) ( not ( = ?auto_2194236 ?auto_2194241 ) ) ( not ( = ?auto_2194236 ?auto_2194242 ) ) ( not ( = ?auto_2194236 ?auto_2194243 ) ) ( not ( = ?auto_2194236 ?auto_2194244 ) ) ( not ( = ?auto_2194236 ?auto_2194245 ) ) ( not ( = ?auto_2194236 ?auto_2194246 ) ) ( not ( = ?auto_2194236 ?auto_2194247 ) ) ( not ( = ?auto_2194236 ?auto_2194250 ) ) ( not ( = ?auto_2194238 ?auto_2194239 ) ) ( not ( = ?auto_2194238 ?auto_2194240 ) ) ( not ( = ?auto_2194238 ?auto_2194241 ) ) ( not ( = ?auto_2194238 ?auto_2194242 ) ) ( not ( = ?auto_2194238 ?auto_2194243 ) ) ( not ( = ?auto_2194238 ?auto_2194244 ) ) ( not ( = ?auto_2194238 ?auto_2194245 ) ) ( not ( = ?auto_2194238 ?auto_2194246 ) ) ( not ( = ?auto_2194238 ?auto_2194247 ) ) ( not ( = ?auto_2194238 ?auto_2194250 ) ) ( not ( = ?auto_2194239 ?auto_2194240 ) ) ( not ( = ?auto_2194239 ?auto_2194241 ) ) ( not ( = ?auto_2194239 ?auto_2194242 ) ) ( not ( = ?auto_2194239 ?auto_2194243 ) ) ( not ( = ?auto_2194239 ?auto_2194244 ) ) ( not ( = ?auto_2194239 ?auto_2194245 ) ) ( not ( = ?auto_2194239 ?auto_2194246 ) ) ( not ( = ?auto_2194239 ?auto_2194247 ) ) ( not ( = ?auto_2194239 ?auto_2194250 ) ) ( not ( = ?auto_2194240 ?auto_2194241 ) ) ( not ( = ?auto_2194240 ?auto_2194242 ) ) ( not ( = ?auto_2194240 ?auto_2194243 ) ) ( not ( = ?auto_2194240 ?auto_2194244 ) ) ( not ( = ?auto_2194240 ?auto_2194245 ) ) ( not ( = ?auto_2194240 ?auto_2194246 ) ) ( not ( = ?auto_2194240 ?auto_2194247 ) ) ( not ( = ?auto_2194240 ?auto_2194250 ) ) ( not ( = ?auto_2194241 ?auto_2194242 ) ) ( not ( = ?auto_2194241 ?auto_2194243 ) ) ( not ( = ?auto_2194241 ?auto_2194244 ) ) ( not ( = ?auto_2194241 ?auto_2194245 ) ) ( not ( = ?auto_2194241 ?auto_2194246 ) ) ( not ( = ?auto_2194241 ?auto_2194247 ) ) ( not ( = ?auto_2194241 ?auto_2194250 ) ) ( not ( = ?auto_2194242 ?auto_2194243 ) ) ( not ( = ?auto_2194242 ?auto_2194244 ) ) ( not ( = ?auto_2194242 ?auto_2194245 ) ) ( not ( = ?auto_2194242 ?auto_2194246 ) ) ( not ( = ?auto_2194242 ?auto_2194247 ) ) ( not ( = ?auto_2194242 ?auto_2194250 ) ) ( not ( = ?auto_2194243 ?auto_2194244 ) ) ( not ( = ?auto_2194243 ?auto_2194245 ) ) ( not ( = ?auto_2194243 ?auto_2194246 ) ) ( not ( = ?auto_2194243 ?auto_2194247 ) ) ( not ( = ?auto_2194243 ?auto_2194250 ) ) ( not ( = ?auto_2194244 ?auto_2194245 ) ) ( not ( = ?auto_2194244 ?auto_2194246 ) ) ( not ( = ?auto_2194244 ?auto_2194247 ) ) ( not ( = ?auto_2194244 ?auto_2194250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194245 ?auto_2194246 ?auto_2194247 )
      ( MAKE-14CRATE-VERIFY ?auto_2194233 ?auto_2194234 ?auto_2194235 ?auto_2194237 ?auto_2194236 ?auto_2194238 ?auto_2194239 ?auto_2194240 ?auto_2194241 ?auto_2194242 ?auto_2194243 ?auto_2194244 ?auto_2194245 ?auto_2194246 ?auto_2194247 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2194437 - SURFACE
      ?auto_2194438 - SURFACE
      ?auto_2194439 - SURFACE
      ?auto_2194441 - SURFACE
      ?auto_2194440 - SURFACE
      ?auto_2194442 - SURFACE
      ?auto_2194443 - SURFACE
      ?auto_2194444 - SURFACE
      ?auto_2194445 - SURFACE
      ?auto_2194446 - SURFACE
      ?auto_2194447 - SURFACE
      ?auto_2194448 - SURFACE
      ?auto_2194449 - SURFACE
      ?auto_2194450 - SURFACE
      ?auto_2194451 - SURFACE
    )
    :vars
    (
      ?auto_2194453 - HOIST
      ?auto_2194456 - PLACE
      ?auto_2194454 - PLACE
      ?auto_2194452 - HOIST
      ?auto_2194457 - SURFACE
      ?auto_2194455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194453 ?auto_2194456 ) ( IS-CRATE ?auto_2194451 ) ( not ( = ?auto_2194450 ?auto_2194451 ) ) ( not ( = ?auto_2194449 ?auto_2194450 ) ) ( not ( = ?auto_2194449 ?auto_2194451 ) ) ( not ( = ?auto_2194454 ?auto_2194456 ) ) ( HOIST-AT ?auto_2194452 ?auto_2194454 ) ( not ( = ?auto_2194453 ?auto_2194452 ) ) ( AVAILABLE ?auto_2194452 ) ( SURFACE-AT ?auto_2194451 ?auto_2194454 ) ( ON ?auto_2194451 ?auto_2194457 ) ( CLEAR ?auto_2194451 ) ( not ( = ?auto_2194450 ?auto_2194457 ) ) ( not ( = ?auto_2194451 ?auto_2194457 ) ) ( not ( = ?auto_2194449 ?auto_2194457 ) ) ( TRUCK-AT ?auto_2194455 ?auto_2194456 ) ( SURFACE-AT ?auto_2194449 ?auto_2194456 ) ( CLEAR ?auto_2194449 ) ( IS-CRATE ?auto_2194450 ) ( AVAILABLE ?auto_2194453 ) ( IN ?auto_2194450 ?auto_2194455 ) ( ON ?auto_2194438 ?auto_2194437 ) ( ON ?auto_2194439 ?auto_2194438 ) ( ON ?auto_2194441 ?auto_2194439 ) ( ON ?auto_2194440 ?auto_2194441 ) ( ON ?auto_2194442 ?auto_2194440 ) ( ON ?auto_2194443 ?auto_2194442 ) ( ON ?auto_2194444 ?auto_2194443 ) ( ON ?auto_2194445 ?auto_2194444 ) ( ON ?auto_2194446 ?auto_2194445 ) ( ON ?auto_2194447 ?auto_2194446 ) ( ON ?auto_2194448 ?auto_2194447 ) ( ON ?auto_2194449 ?auto_2194448 ) ( not ( = ?auto_2194437 ?auto_2194438 ) ) ( not ( = ?auto_2194437 ?auto_2194439 ) ) ( not ( = ?auto_2194437 ?auto_2194441 ) ) ( not ( = ?auto_2194437 ?auto_2194440 ) ) ( not ( = ?auto_2194437 ?auto_2194442 ) ) ( not ( = ?auto_2194437 ?auto_2194443 ) ) ( not ( = ?auto_2194437 ?auto_2194444 ) ) ( not ( = ?auto_2194437 ?auto_2194445 ) ) ( not ( = ?auto_2194437 ?auto_2194446 ) ) ( not ( = ?auto_2194437 ?auto_2194447 ) ) ( not ( = ?auto_2194437 ?auto_2194448 ) ) ( not ( = ?auto_2194437 ?auto_2194449 ) ) ( not ( = ?auto_2194437 ?auto_2194450 ) ) ( not ( = ?auto_2194437 ?auto_2194451 ) ) ( not ( = ?auto_2194437 ?auto_2194457 ) ) ( not ( = ?auto_2194438 ?auto_2194439 ) ) ( not ( = ?auto_2194438 ?auto_2194441 ) ) ( not ( = ?auto_2194438 ?auto_2194440 ) ) ( not ( = ?auto_2194438 ?auto_2194442 ) ) ( not ( = ?auto_2194438 ?auto_2194443 ) ) ( not ( = ?auto_2194438 ?auto_2194444 ) ) ( not ( = ?auto_2194438 ?auto_2194445 ) ) ( not ( = ?auto_2194438 ?auto_2194446 ) ) ( not ( = ?auto_2194438 ?auto_2194447 ) ) ( not ( = ?auto_2194438 ?auto_2194448 ) ) ( not ( = ?auto_2194438 ?auto_2194449 ) ) ( not ( = ?auto_2194438 ?auto_2194450 ) ) ( not ( = ?auto_2194438 ?auto_2194451 ) ) ( not ( = ?auto_2194438 ?auto_2194457 ) ) ( not ( = ?auto_2194439 ?auto_2194441 ) ) ( not ( = ?auto_2194439 ?auto_2194440 ) ) ( not ( = ?auto_2194439 ?auto_2194442 ) ) ( not ( = ?auto_2194439 ?auto_2194443 ) ) ( not ( = ?auto_2194439 ?auto_2194444 ) ) ( not ( = ?auto_2194439 ?auto_2194445 ) ) ( not ( = ?auto_2194439 ?auto_2194446 ) ) ( not ( = ?auto_2194439 ?auto_2194447 ) ) ( not ( = ?auto_2194439 ?auto_2194448 ) ) ( not ( = ?auto_2194439 ?auto_2194449 ) ) ( not ( = ?auto_2194439 ?auto_2194450 ) ) ( not ( = ?auto_2194439 ?auto_2194451 ) ) ( not ( = ?auto_2194439 ?auto_2194457 ) ) ( not ( = ?auto_2194441 ?auto_2194440 ) ) ( not ( = ?auto_2194441 ?auto_2194442 ) ) ( not ( = ?auto_2194441 ?auto_2194443 ) ) ( not ( = ?auto_2194441 ?auto_2194444 ) ) ( not ( = ?auto_2194441 ?auto_2194445 ) ) ( not ( = ?auto_2194441 ?auto_2194446 ) ) ( not ( = ?auto_2194441 ?auto_2194447 ) ) ( not ( = ?auto_2194441 ?auto_2194448 ) ) ( not ( = ?auto_2194441 ?auto_2194449 ) ) ( not ( = ?auto_2194441 ?auto_2194450 ) ) ( not ( = ?auto_2194441 ?auto_2194451 ) ) ( not ( = ?auto_2194441 ?auto_2194457 ) ) ( not ( = ?auto_2194440 ?auto_2194442 ) ) ( not ( = ?auto_2194440 ?auto_2194443 ) ) ( not ( = ?auto_2194440 ?auto_2194444 ) ) ( not ( = ?auto_2194440 ?auto_2194445 ) ) ( not ( = ?auto_2194440 ?auto_2194446 ) ) ( not ( = ?auto_2194440 ?auto_2194447 ) ) ( not ( = ?auto_2194440 ?auto_2194448 ) ) ( not ( = ?auto_2194440 ?auto_2194449 ) ) ( not ( = ?auto_2194440 ?auto_2194450 ) ) ( not ( = ?auto_2194440 ?auto_2194451 ) ) ( not ( = ?auto_2194440 ?auto_2194457 ) ) ( not ( = ?auto_2194442 ?auto_2194443 ) ) ( not ( = ?auto_2194442 ?auto_2194444 ) ) ( not ( = ?auto_2194442 ?auto_2194445 ) ) ( not ( = ?auto_2194442 ?auto_2194446 ) ) ( not ( = ?auto_2194442 ?auto_2194447 ) ) ( not ( = ?auto_2194442 ?auto_2194448 ) ) ( not ( = ?auto_2194442 ?auto_2194449 ) ) ( not ( = ?auto_2194442 ?auto_2194450 ) ) ( not ( = ?auto_2194442 ?auto_2194451 ) ) ( not ( = ?auto_2194442 ?auto_2194457 ) ) ( not ( = ?auto_2194443 ?auto_2194444 ) ) ( not ( = ?auto_2194443 ?auto_2194445 ) ) ( not ( = ?auto_2194443 ?auto_2194446 ) ) ( not ( = ?auto_2194443 ?auto_2194447 ) ) ( not ( = ?auto_2194443 ?auto_2194448 ) ) ( not ( = ?auto_2194443 ?auto_2194449 ) ) ( not ( = ?auto_2194443 ?auto_2194450 ) ) ( not ( = ?auto_2194443 ?auto_2194451 ) ) ( not ( = ?auto_2194443 ?auto_2194457 ) ) ( not ( = ?auto_2194444 ?auto_2194445 ) ) ( not ( = ?auto_2194444 ?auto_2194446 ) ) ( not ( = ?auto_2194444 ?auto_2194447 ) ) ( not ( = ?auto_2194444 ?auto_2194448 ) ) ( not ( = ?auto_2194444 ?auto_2194449 ) ) ( not ( = ?auto_2194444 ?auto_2194450 ) ) ( not ( = ?auto_2194444 ?auto_2194451 ) ) ( not ( = ?auto_2194444 ?auto_2194457 ) ) ( not ( = ?auto_2194445 ?auto_2194446 ) ) ( not ( = ?auto_2194445 ?auto_2194447 ) ) ( not ( = ?auto_2194445 ?auto_2194448 ) ) ( not ( = ?auto_2194445 ?auto_2194449 ) ) ( not ( = ?auto_2194445 ?auto_2194450 ) ) ( not ( = ?auto_2194445 ?auto_2194451 ) ) ( not ( = ?auto_2194445 ?auto_2194457 ) ) ( not ( = ?auto_2194446 ?auto_2194447 ) ) ( not ( = ?auto_2194446 ?auto_2194448 ) ) ( not ( = ?auto_2194446 ?auto_2194449 ) ) ( not ( = ?auto_2194446 ?auto_2194450 ) ) ( not ( = ?auto_2194446 ?auto_2194451 ) ) ( not ( = ?auto_2194446 ?auto_2194457 ) ) ( not ( = ?auto_2194447 ?auto_2194448 ) ) ( not ( = ?auto_2194447 ?auto_2194449 ) ) ( not ( = ?auto_2194447 ?auto_2194450 ) ) ( not ( = ?auto_2194447 ?auto_2194451 ) ) ( not ( = ?auto_2194447 ?auto_2194457 ) ) ( not ( = ?auto_2194448 ?auto_2194449 ) ) ( not ( = ?auto_2194448 ?auto_2194450 ) ) ( not ( = ?auto_2194448 ?auto_2194451 ) ) ( not ( = ?auto_2194448 ?auto_2194457 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194449 ?auto_2194450 ?auto_2194451 )
      ( MAKE-14CRATE-VERIFY ?auto_2194437 ?auto_2194438 ?auto_2194439 ?auto_2194441 ?auto_2194440 ?auto_2194442 ?auto_2194443 ?auto_2194444 ?auto_2194445 ?auto_2194446 ?auto_2194447 ?auto_2194448 ?auto_2194449 ?auto_2194450 ?auto_2194451 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2194458 - SURFACE
      ?auto_2194459 - SURFACE
    )
    :vars
    (
      ?auto_2194461 - HOIST
      ?auto_2194464 - PLACE
      ?auto_2194466 - SURFACE
      ?auto_2194462 - PLACE
      ?auto_2194460 - HOIST
      ?auto_2194465 - SURFACE
      ?auto_2194463 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194461 ?auto_2194464 ) ( IS-CRATE ?auto_2194459 ) ( not ( = ?auto_2194458 ?auto_2194459 ) ) ( not ( = ?auto_2194466 ?auto_2194458 ) ) ( not ( = ?auto_2194466 ?auto_2194459 ) ) ( not ( = ?auto_2194462 ?auto_2194464 ) ) ( HOIST-AT ?auto_2194460 ?auto_2194462 ) ( not ( = ?auto_2194461 ?auto_2194460 ) ) ( AVAILABLE ?auto_2194460 ) ( SURFACE-AT ?auto_2194459 ?auto_2194462 ) ( ON ?auto_2194459 ?auto_2194465 ) ( CLEAR ?auto_2194459 ) ( not ( = ?auto_2194458 ?auto_2194465 ) ) ( not ( = ?auto_2194459 ?auto_2194465 ) ) ( not ( = ?auto_2194466 ?auto_2194465 ) ) ( SURFACE-AT ?auto_2194466 ?auto_2194464 ) ( CLEAR ?auto_2194466 ) ( IS-CRATE ?auto_2194458 ) ( AVAILABLE ?auto_2194461 ) ( IN ?auto_2194458 ?auto_2194463 ) ( TRUCK-AT ?auto_2194463 ?auto_2194462 ) )
    :subtasks
    ( ( !DRIVE ?auto_2194463 ?auto_2194462 ?auto_2194464 )
      ( MAKE-2CRATE ?auto_2194466 ?auto_2194458 ?auto_2194459 )
      ( MAKE-1CRATE-VERIFY ?auto_2194458 ?auto_2194459 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2194467 - SURFACE
      ?auto_2194468 - SURFACE
      ?auto_2194469 - SURFACE
    )
    :vars
    (
      ?auto_2194475 - HOIST
      ?auto_2194471 - PLACE
      ?auto_2194470 - PLACE
      ?auto_2194473 - HOIST
      ?auto_2194472 - SURFACE
      ?auto_2194474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194475 ?auto_2194471 ) ( IS-CRATE ?auto_2194469 ) ( not ( = ?auto_2194468 ?auto_2194469 ) ) ( not ( = ?auto_2194467 ?auto_2194468 ) ) ( not ( = ?auto_2194467 ?auto_2194469 ) ) ( not ( = ?auto_2194470 ?auto_2194471 ) ) ( HOIST-AT ?auto_2194473 ?auto_2194470 ) ( not ( = ?auto_2194475 ?auto_2194473 ) ) ( AVAILABLE ?auto_2194473 ) ( SURFACE-AT ?auto_2194469 ?auto_2194470 ) ( ON ?auto_2194469 ?auto_2194472 ) ( CLEAR ?auto_2194469 ) ( not ( = ?auto_2194468 ?auto_2194472 ) ) ( not ( = ?auto_2194469 ?auto_2194472 ) ) ( not ( = ?auto_2194467 ?auto_2194472 ) ) ( SURFACE-AT ?auto_2194467 ?auto_2194471 ) ( CLEAR ?auto_2194467 ) ( IS-CRATE ?auto_2194468 ) ( AVAILABLE ?auto_2194475 ) ( IN ?auto_2194468 ?auto_2194474 ) ( TRUCK-AT ?auto_2194474 ?auto_2194470 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2194468 ?auto_2194469 )
      ( MAKE-2CRATE-VERIFY ?auto_2194467 ?auto_2194468 ?auto_2194469 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2194476 - SURFACE
      ?auto_2194477 - SURFACE
      ?auto_2194478 - SURFACE
      ?auto_2194479 - SURFACE
    )
    :vars
    (
      ?auto_2194483 - HOIST
      ?auto_2194484 - PLACE
      ?auto_2194480 - PLACE
      ?auto_2194481 - HOIST
      ?auto_2194485 - SURFACE
      ?auto_2194482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194483 ?auto_2194484 ) ( IS-CRATE ?auto_2194479 ) ( not ( = ?auto_2194478 ?auto_2194479 ) ) ( not ( = ?auto_2194477 ?auto_2194478 ) ) ( not ( = ?auto_2194477 ?auto_2194479 ) ) ( not ( = ?auto_2194480 ?auto_2194484 ) ) ( HOIST-AT ?auto_2194481 ?auto_2194480 ) ( not ( = ?auto_2194483 ?auto_2194481 ) ) ( AVAILABLE ?auto_2194481 ) ( SURFACE-AT ?auto_2194479 ?auto_2194480 ) ( ON ?auto_2194479 ?auto_2194485 ) ( CLEAR ?auto_2194479 ) ( not ( = ?auto_2194478 ?auto_2194485 ) ) ( not ( = ?auto_2194479 ?auto_2194485 ) ) ( not ( = ?auto_2194477 ?auto_2194485 ) ) ( SURFACE-AT ?auto_2194477 ?auto_2194484 ) ( CLEAR ?auto_2194477 ) ( IS-CRATE ?auto_2194478 ) ( AVAILABLE ?auto_2194483 ) ( IN ?auto_2194478 ?auto_2194482 ) ( TRUCK-AT ?auto_2194482 ?auto_2194480 ) ( ON ?auto_2194477 ?auto_2194476 ) ( not ( = ?auto_2194476 ?auto_2194477 ) ) ( not ( = ?auto_2194476 ?auto_2194478 ) ) ( not ( = ?auto_2194476 ?auto_2194479 ) ) ( not ( = ?auto_2194476 ?auto_2194485 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194477 ?auto_2194478 ?auto_2194479 )
      ( MAKE-3CRATE-VERIFY ?auto_2194476 ?auto_2194477 ?auto_2194478 ?auto_2194479 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2194486 - SURFACE
      ?auto_2194487 - SURFACE
      ?auto_2194488 - SURFACE
      ?auto_2194490 - SURFACE
      ?auto_2194489 - SURFACE
    )
    :vars
    (
      ?auto_2194494 - HOIST
      ?auto_2194495 - PLACE
      ?auto_2194491 - PLACE
      ?auto_2194492 - HOIST
      ?auto_2194496 - SURFACE
      ?auto_2194493 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194494 ?auto_2194495 ) ( IS-CRATE ?auto_2194489 ) ( not ( = ?auto_2194490 ?auto_2194489 ) ) ( not ( = ?auto_2194488 ?auto_2194490 ) ) ( not ( = ?auto_2194488 ?auto_2194489 ) ) ( not ( = ?auto_2194491 ?auto_2194495 ) ) ( HOIST-AT ?auto_2194492 ?auto_2194491 ) ( not ( = ?auto_2194494 ?auto_2194492 ) ) ( AVAILABLE ?auto_2194492 ) ( SURFACE-AT ?auto_2194489 ?auto_2194491 ) ( ON ?auto_2194489 ?auto_2194496 ) ( CLEAR ?auto_2194489 ) ( not ( = ?auto_2194490 ?auto_2194496 ) ) ( not ( = ?auto_2194489 ?auto_2194496 ) ) ( not ( = ?auto_2194488 ?auto_2194496 ) ) ( SURFACE-AT ?auto_2194488 ?auto_2194495 ) ( CLEAR ?auto_2194488 ) ( IS-CRATE ?auto_2194490 ) ( AVAILABLE ?auto_2194494 ) ( IN ?auto_2194490 ?auto_2194493 ) ( TRUCK-AT ?auto_2194493 ?auto_2194491 ) ( ON ?auto_2194487 ?auto_2194486 ) ( ON ?auto_2194488 ?auto_2194487 ) ( not ( = ?auto_2194486 ?auto_2194487 ) ) ( not ( = ?auto_2194486 ?auto_2194488 ) ) ( not ( = ?auto_2194486 ?auto_2194490 ) ) ( not ( = ?auto_2194486 ?auto_2194489 ) ) ( not ( = ?auto_2194486 ?auto_2194496 ) ) ( not ( = ?auto_2194487 ?auto_2194488 ) ) ( not ( = ?auto_2194487 ?auto_2194490 ) ) ( not ( = ?auto_2194487 ?auto_2194489 ) ) ( not ( = ?auto_2194487 ?auto_2194496 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194488 ?auto_2194490 ?auto_2194489 )
      ( MAKE-4CRATE-VERIFY ?auto_2194486 ?auto_2194487 ?auto_2194488 ?auto_2194490 ?auto_2194489 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2194497 - SURFACE
      ?auto_2194498 - SURFACE
      ?auto_2194499 - SURFACE
      ?auto_2194501 - SURFACE
      ?auto_2194500 - SURFACE
      ?auto_2194502 - SURFACE
    )
    :vars
    (
      ?auto_2194506 - HOIST
      ?auto_2194507 - PLACE
      ?auto_2194503 - PLACE
      ?auto_2194504 - HOIST
      ?auto_2194508 - SURFACE
      ?auto_2194505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194506 ?auto_2194507 ) ( IS-CRATE ?auto_2194502 ) ( not ( = ?auto_2194500 ?auto_2194502 ) ) ( not ( = ?auto_2194501 ?auto_2194500 ) ) ( not ( = ?auto_2194501 ?auto_2194502 ) ) ( not ( = ?auto_2194503 ?auto_2194507 ) ) ( HOIST-AT ?auto_2194504 ?auto_2194503 ) ( not ( = ?auto_2194506 ?auto_2194504 ) ) ( AVAILABLE ?auto_2194504 ) ( SURFACE-AT ?auto_2194502 ?auto_2194503 ) ( ON ?auto_2194502 ?auto_2194508 ) ( CLEAR ?auto_2194502 ) ( not ( = ?auto_2194500 ?auto_2194508 ) ) ( not ( = ?auto_2194502 ?auto_2194508 ) ) ( not ( = ?auto_2194501 ?auto_2194508 ) ) ( SURFACE-AT ?auto_2194501 ?auto_2194507 ) ( CLEAR ?auto_2194501 ) ( IS-CRATE ?auto_2194500 ) ( AVAILABLE ?auto_2194506 ) ( IN ?auto_2194500 ?auto_2194505 ) ( TRUCK-AT ?auto_2194505 ?auto_2194503 ) ( ON ?auto_2194498 ?auto_2194497 ) ( ON ?auto_2194499 ?auto_2194498 ) ( ON ?auto_2194501 ?auto_2194499 ) ( not ( = ?auto_2194497 ?auto_2194498 ) ) ( not ( = ?auto_2194497 ?auto_2194499 ) ) ( not ( = ?auto_2194497 ?auto_2194501 ) ) ( not ( = ?auto_2194497 ?auto_2194500 ) ) ( not ( = ?auto_2194497 ?auto_2194502 ) ) ( not ( = ?auto_2194497 ?auto_2194508 ) ) ( not ( = ?auto_2194498 ?auto_2194499 ) ) ( not ( = ?auto_2194498 ?auto_2194501 ) ) ( not ( = ?auto_2194498 ?auto_2194500 ) ) ( not ( = ?auto_2194498 ?auto_2194502 ) ) ( not ( = ?auto_2194498 ?auto_2194508 ) ) ( not ( = ?auto_2194499 ?auto_2194501 ) ) ( not ( = ?auto_2194499 ?auto_2194500 ) ) ( not ( = ?auto_2194499 ?auto_2194502 ) ) ( not ( = ?auto_2194499 ?auto_2194508 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194501 ?auto_2194500 ?auto_2194502 )
      ( MAKE-5CRATE-VERIFY ?auto_2194497 ?auto_2194498 ?auto_2194499 ?auto_2194501 ?auto_2194500 ?auto_2194502 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2194509 - SURFACE
      ?auto_2194510 - SURFACE
      ?auto_2194511 - SURFACE
      ?auto_2194513 - SURFACE
      ?auto_2194512 - SURFACE
      ?auto_2194514 - SURFACE
      ?auto_2194515 - SURFACE
    )
    :vars
    (
      ?auto_2194519 - HOIST
      ?auto_2194520 - PLACE
      ?auto_2194516 - PLACE
      ?auto_2194517 - HOIST
      ?auto_2194521 - SURFACE
      ?auto_2194518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194519 ?auto_2194520 ) ( IS-CRATE ?auto_2194515 ) ( not ( = ?auto_2194514 ?auto_2194515 ) ) ( not ( = ?auto_2194512 ?auto_2194514 ) ) ( not ( = ?auto_2194512 ?auto_2194515 ) ) ( not ( = ?auto_2194516 ?auto_2194520 ) ) ( HOIST-AT ?auto_2194517 ?auto_2194516 ) ( not ( = ?auto_2194519 ?auto_2194517 ) ) ( AVAILABLE ?auto_2194517 ) ( SURFACE-AT ?auto_2194515 ?auto_2194516 ) ( ON ?auto_2194515 ?auto_2194521 ) ( CLEAR ?auto_2194515 ) ( not ( = ?auto_2194514 ?auto_2194521 ) ) ( not ( = ?auto_2194515 ?auto_2194521 ) ) ( not ( = ?auto_2194512 ?auto_2194521 ) ) ( SURFACE-AT ?auto_2194512 ?auto_2194520 ) ( CLEAR ?auto_2194512 ) ( IS-CRATE ?auto_2194514 ) ( AVAILABLE ?auto_2194519 ) ( IN ?auto_2194514 ?auto_2194518 ) ( TRUCK-AT ?auto_2194518 ?auto_2194516 ) ( ON ?auto_2194510 ?auto_2194509 ) ( ON ?auto_2194511 ?auto_2194510 ) ( ON ?auto_2194513 ?auto_2194511 ) ( ON ?auto_2194512 ?auto_2194513 ) ( not ( = ?auto_2194509 ?auto_2194510 ) ) ( not ( = ?auto_2194509 ?auto_2194511 ) ) ( not ( = ?auto_2194509 ?auto_2194513 ) ) ( not ( = ?auto_2194509 ?auto_2194512 ) ) ( not ( = ?auto_2194509 ?auto_2194514 ) ) ( not ( = ?auto_2194509 ?auto_2194515 ) ) ( not ( = ?auto_2194509 ?auto_2194521 ) ) ( not ( = ?auto_2194510 ?auto_2194511 ) ) ( not ( = ?auto_2194510 ?auto_2194513 ) ) ( not ( = ?auto_2194510 ?auto_2194512 ) ) ( not ( = ?auto_2194510 ?auto_2194514 ) ) ( not ( = ?auto_2194510 ?auto_2194515 ) ) ( not ( = ?auto_2194510 ?auto_2194521 ) ) ( not ( = ?auto_2194511 ?auto_2194513 ) ) ( not ( = ?auto_2194511 ?auto_2194512 ) ) ( not ( = ?auto_2194511 ?auto_2194514 ) ) ( not ( = ?auto_2194511 ?auto_2194515 ) ) ( not ( = ?auto_2194511 ?auto_2194521 ) ) ( not ( = ?auto_2194513 ?auto_2194512 ) ) ( not ( = ?auto_2194513 ?auto_2194514 ) ) ( not ( = ?auto_2194513 ?auto_2194515 ) ) ( not ( = ?auto_2194513 ?auto_2194521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194512 ?auto_2194514 ?auto_2194515 )
      ( MAKE-6CRATE-VERIFY ?auto_2194509 ?auto_2194510 ?auto_2194511 ?auto_2194513 ?auto_2194512 ?auto_2194514 ?auto_2194515 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2194522 - SURFACE
      ?auto_2194523 - SURFACE
      ?auto_2194524 - SURFACE
      ?auto_2194526 - SURFACE
      ?auto_2194525 - SURFACE
      ?auto_2194527 - SURFACE
      ?auto_2194528 - SURFACE
      ?auto_2194529 - SURFACE
    )
    :vars
    (
      ?auto_2194533 - HOIST
      ?auto_2194534 - PLACE
      ?auto_2194530 - PLACE
      ?auto_2194531 - HOIST
      ?auto_2194535 - SURFACE
      ?auto_2194532 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194533 ?auto_2194534 ) ( IS-CRATE ?auto_2194529 ) ( not ( = ?auto_2194528 ?auto_2194529 ) ) ( not ( = ?auto_2194527 ?auto_2194528 ) ) ( not ( = ?auto_2194527 ?auto_2194529 ) ) ( not ( = ?auto_2194530 ?auto_2194534 ) ) ( HOIST-AT ?auto_2194531 ?auto_2194530 ) ( not ( = ?auto_2194533 ?auto_2194531 ) ) ( AVAILABLE ?auto_2194531 ) ( SURFACE-AT ?auto_2194529 ?auto_2194530 ) ( ON ?auto_2194529 ?auto_2194535 ) ( CLEAR ?auto_2194529 ) ( not ( = ?auto_2194528 ?auto_2194535 ) ) ( not ( = ?auto_2194529 ?auto_2194535 ) ) ( not ( = ?auto_2194527 ?auto_2194535 ) ) ( SURFACE-AT ?auto_2194527 ?auto_2194534 ) ( CLEAR ?auto_2194527 ) ( IS-CRATE ?auto_2194528 ) ( AVAILABLE ?auto_2194533 ) ( IN ?auto_2194528 ?auto_2194532 ) ( TRUCK-AT ?auto_2194532 ?auto_2194530 ) ( ON ?auto_2194523 ?auto_2194522 ) ( ON ?auto_2194524 ?auto_2194523 ) ( ON ?auto_2194526 ?auto_2194524 ) ( ON ?auto_2194525 ?auto_2194526 ) ( ON ?auto_2194527 ?auto_2194525 ) ( not ( = ?auto_2194522 ?auto_2194523 ) ) ( not ( = ?auto_2194522 ?auto_2194524 ) ) ( not ( = ?auto_2194522 ?auto_2194526 ) ) ( not ( = ?auto_2194522 ?auto_2194525 ) ) ( not ( = ?auto_2194522 ?auto_2194527 ) ) ( not ( = ?auto_2194522 ?auto_2194528 ) ) ( not ( = ?auto_2194522 ?auto_2194529 ) ) ( not ( = ?auto_2194522 ?auto_2194535 ) ) ( not ( = ?auto_2194523 ?auto_2194524 ) ) ( not ( = ?auto_2194523 ?auto_2194526 ) ) ( not ( = ?auto_2194523 ?auto_2194525 ) ) ( not ( = ?auto_2194523 ?auto_2194527 ) ) ( not ( = ?auto_2194523 ?auto_2194528 ) ) ( not ( = ?auto_2194523 ?auto_2194529 ) ) ( not ( = ?auto_2194523 ?auto_2194535 ) ) ( not ( = ?auto_2194524 ?auto_2194526 ) ) ( not ( = ?auto_2194524 ?auto_2194525 ) ) ( not ( = ?auto_2194524 ?auto_2194527 ) ) ( not ( = ?auto_2194524 ?auto_2194528 ) ) ( not ( = ?auto_2194524 ?auto_2194529 ) ) ( not ( = ?auto_2194524 ?auto_2194535 ) ) ( not ( = ?auto_2194526 ?auto_2194525 ) ) ( not ( = ?auto_2194526 ?auto_2194527 ) ) ( not ( = ?auto_2194526 ?auto_2194528 ) ) ( not ( = ?auto_2194526 ?auto_2194529 ) ) ( not ( = ?auto_2194526 ?auto_2194535 ) ) ( not ( = ?auto_2194525 ?auto_2194527 ) ) ( not ( = ?auto_2194525 ?auto_2194528 ) ) ( not ( = ?auto_2194525 ?auto_2194529 ) ) ( not ( = ?auto_2194525 ?auto_2194535 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194527 ?auto_2194528 ?auto_2194529 )
      ( MAKE-7CRATE-VERIFY ?auto_2194522 ?auto_2194523 ?auto_2194524 ?auto_2194526 ?auto_2194525 ?auto_2194527 ?auto_2194528 ?auto_2194529 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2194536 - SURFACE
      ?auto_2194537 - SURFACE
      ?auto_2194538 - SURFACE
      ?auto_2194540 - SURFACE
      ?auto_2194539 - SURFACE
      ?auto_2194541 - SURFACE
      ?auto_2194542 - SURFACE
      ?auto_2194543 - SURFACE
      ?auto_2194544 - SURFACE
    )
    :vars
    (
      ?auto_2194548 - HOIST
      ?auto_2194549 - PLACE
      ?auto_2194545 - PLACE
      ?auto_2194546 - HOIST
      ?auto_2194550 - SURFACE
      ?auto_2194547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194548 ?auto_2194549 ) ( IS-CRATE ?auto_2194544 ) ( not ( = ?auto_2194543 ?auto_2194544 ) ) ( not ( = ?auto_2194542 ?auto_2194543 ) ) ( not ( = ?auto_2194542 ?auto_2194544 ) ) ( not ( = ?auto_2194545 ?auto_2194549 ) ) ( HOIST-AT ?auto_2194546 ?auto_2194545 ) ( not ( = ?auto_2194548 ?auto_2194546 ) ) ( AVAILABLE ?auto_2194546 ) ( SURFACE-AT ?auto_2194544 ?auto_2194545 ) ( ON ?auto_2194544 ?auto_2194550 ) ( CLEAR ?auto_2194544 ) ( not ( = ?auto_2194543 ?auto_2194550 ) ) ( not ( = ?auto_2194544 ?auto_2194550 ) ) ( not ( = ?auto_2194542 ?auto_2194550 ) ) ( SURFACE-AT ?auto_2194542 ?auto_2194549 ) ( CLEAR ?auto_2194542 ) ( IS-CRATE ?auto_2194543 ) ( AVAILABLE ?auto_2194548 ) ( IN ?auto_2194543 ?auto_2194547 ) ( TRUCK-AT ?auto_2194547 ?auto_2194545 ) ( ON ?auto_2194537 ?auto_2194536 ) ( ON ?auto_2194538 ?auto_2194537 ) ( ON ?auto_2194540 ?auto_2194538 ) ( ON ?auto_2194539 ?auto_2194540 ) ( ON ?auto_2194541 ?auto_2194539 ) ( ON ?auto_2194542 ?auto_2194541 ) ( not ( = ?auto_2194536 ?auto_2194537 ) ) ( not ( = ?auto_2194536 ?auto_2194538 ) ) ( not ( = ?auto_2194536 ?auto_2194540 ) ) ( not ( = ?auto_2194536 ?auto_2194539 ) ) ( not ( = ?auto_2194536 ?auto_2194541 ) ) ( not ( = ?auto_2194536 ?auto_2194542 ) ) ( not ( = ?auto_2194536 ?auto_2194543 ) ) ( not ( = ?auto_2194536 ?auto_2194544 ) ) ( not ( = ?auto_2194536 ?auto_2194550 ) ) ( not ( = ?auto_2194537 ?auto_2194538 ) ) ( not ( = ?auto_2194537 ?auto_2194540 ) ) ( not ( = ?auto_2194537 ?auto_2194539 ) ) ( not ( = ?auto_2194537 ?auto_2194541 ) ) ( not ( = ?auto_2194537 ?auto_2194542 ) ) ( not ( = ?auto_2194537 ?auto_2194543 ) ) ( not ( = ?auto_2194537 ?auto_2194544 ) ) ( not ( = ?auto_2194537 ?auto_2194550 ) ) ( not ( = ?auto_2194538 ?auto_2194540 ) ) ( not ( = ?auto_2194538 ?auto_2194539 ) ) ( not ( = ?auto_2194538 ?auto_2194541 ) ) ( not ( = ?auto_2194538 ?auto_2194542 ) ) ( not ( = ?auto_2194538 ?auto_2194543 ) ) ( not ( = ?auto_2194538 ?auto_2194544 ) ) ( not ( = ?auto_2194538 ?auto_2194550 ) ) ( not ( = ?auto_2194540 ?auto_2194539 ) ) ( not ( = ?auto_2194540 ?auto_2194541 ) ) ( not ( = ?auto_2194540 ?auto_2194542 ) ) ( not ( = ?auto_2194540 ?auto_2194543 ) ) ( not ( = ?auto_2194540 ?auto_2194544 ) ) ( not ( = ?auto_2194540 ?auto_2194550 ) ) ( not ( = ?auto_2194539 ?auto_2194541 ) ) ( not ( = ?auto_2194539 ?auto_2194542 ) ) ( not ( = ?auto_2194539 ?auto_2194543 ) ) ( not ( = ?auto_2194539 ?auto_2194544 ) ) ( not ( = ?auto_2194539 ?auto_2194550 ) ) ( not ( = ?auto_2194541 ?auto_2194542 ) ) ( not ( = ?auto_2194541 ?auto_2194543 ) ) ( not ( = ?auto_2194541 ?auto_2194544 ) ) ( not ( = ?auto_2194541 ?auto_2194550 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194542 ?auto_2194543 ?auto_2194544 )
      ( MAKE-8CRATE-VERIFY ?auto_2194536 ?auto_2194537 ?auto_2194538 ?auto_2194540 ?auto_2194539 ?auto_2194541 ?auto_2194542 ?auto_2194543 ?auto_2194544 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2194551 - SURFACE
      ?auto_2194552 - SURFACE
      ?auto_2194553 - SURFACE
      ?auto_2194555 - SURFACE
      ?auto_2194554 - SURFACE
      ?auto_2194556 - SURFACE
      ?auto_2194557 - SURFACE
      ?auto_2194558 - SURFACE
      ?auto_2194559 - SURFACE
      ?auto_2194560 - SURFACE
    )
    :vars
    (
      ?auto_2194564 - HOIST
      ?auto_2194565 - PLACE
      ?auto_2194561 - PLACE
      ?auto_2194562 - HOIST
      ?auto_2194566 - SURFACE
      ?auto_2194563 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194564 ?auto_2194565 ) ( IS-CRATE ?auto_2194560 ) ( not ( = ?auto_2194559 ?auto_2194560 ) ) ( not ( = ?auto_2194558 ?auto_2194559 ) ) ( not ( = ?auto_2194558 ?auto_2194560 ) ) ( not ( = ?auto_2194561 ?auto_2194565 ) ) ( HOIST-AT ?auto_2194562 ?auto_2194561 ) ( not ( = ?auto_2194564 ?auto_2194562 ) ) ( AVAILABLE ?auto_2194562 ) ( SURFACE-AT ?auto_2194560 ?auto_2194561 ) ( ON ?auto_2194560 ?auto_2194566 ) ( CLEAR ?auto_2194560 ) ( not ( = ?auto_2194559 ?auto_2194566 ) ) ( not ( = ?auto_2194560 ?auto_2194566 ) ) ( not ( = ?auto_2194558 ?auto_2194566 ) ) ( SURFACE-AT ?auto_2194558 ?auto_2194565 ) ( CLEAR ?auto_2194558 ) ( IS-CRATE ?auto_2194559 ) ( AVAILABLE ?auto_2194564 ) ( IN ?auto_2194559 ?auto_2194563 ) ( TRUCK-AT ?auto_2194563 ?auto_2194561 ) ( ON ?auto_2194552 ?auto_2194551 ) ( ON ?auto_2194553 ?auto_2194552 ) ( ON ?auto_2194555 ?auto_2194553 ) ( ON ?auto_2194554 ?auto_2194555 ) ( ON ?auto_2194556 ?auto_2194554 ) ( ON ?auto_2194557 ?auto_2194556 ) ( ON ?auto_2194558 ?auto_2194557 ) ( not ( = ?auto_2194551 ?auto_2194552 ) ) ( not ( = ?auto_2194551 ?auto_2194553 ) ) ( not ( = ?auto_2194551 ?auto_2194555 ) ) ( not ( = ?auto_2194551 ?auto_2194554 ) ) ( not ( = ?auto_2194551 ?auto_2194556 ) ) ( not ( = ?auto_2194551 ?auto_2194557 ) ) ( not ( = ?auto_2194551 ?auto_2194558 ) ) ( not ( = ?auto_2194551 ?auto_2194559 ) ) ( not ( = ?auto_2194551 ?auto_2194560 ) ) ( not ( = ?auto_2194551 ?auto_2194566 ) ) ( not ( = ?auto_2194552 ?auto_2194553 ) ) ( not ( = ?auto_2194552 ?auto_2194555 ) ) ( not ( = ?auto_2194552 ?auto_2194554 ) ) ( not ( = ?auto_2194552 ?auto_2194556 ) ) ( not ( = ?auto_2194552 ?auto_2194557 ) ) ( not ( = ?auto_2194552 ?auto_2194558 ) ) ( not ( = ?auto_2194552 ?auto_2194559 ) ) ( not ( = ?auto_2194552 ?auto_2194560 ) ) ( not ( = ?auto_2194552 ?auto_2194566 ) ) ( not ( = ?auto_2194553 ?auto_2194555 ) ) ( not ( = ?auto_2194553 ?auto_2194554 ) ) ( not ( = ?auto_2194553 ?auto_2194556 ) ) ( not ( = ?auto_2194553 ?auto_2194557 ) ) ( not ( = ?auto_2194553 ?auto_2194558 ) ) ( not ( = ?auto_2194553 ?auto_2194559 ) ) ( not ( = ?auto_2194553 ?auto_2194560 ) ) ( not ( = ?auto_2194553 ?auto_2194566 ) ) ( not ( = ?auto_2194555 ?auto_2194554 ) ) ( not ( = ?auto_2194555 ?auto_2194556 ) ) ( not ( = ?auto_2194555 ?auto_2194557 ) ) ( not ( = ?auto_2194555 ?auto_2194558 ) ) ( not ( = ?auto_2194555 ?auto_2194559 ) ) ( not ( = ?auto_2194555 ?auto_2194560 ) ) ( not ( = ?auto_2194555 ?auto_2194566 ) ) ( not ( = ?auto_2194554 ?auto_2194556 ) ) ( not ( = ?auto_2194554 ?auto_2194557 ) ) ( not ( = ?auto_2194554 ?auto_2194558 ) ) ( not ( = ?auto_2194554 ?auto_2194559 ) ) ( not ( = ?auto_2194554 ?auto_2194560 ) ) ( not ( = ?auto_2194554 ?auto_2194566 ) ) ( not ( = ?auto_2194556 ?auto_2194557 ) ) ( not ( = ?auto_2194556 ?auto_2194558 ) ) ( not ( = ?auto_2194556 ?auto_2194559 ) ) ( not ( = ?auto_2194556 ?auto_2194560 ) ) ( not ( = ?auto_2194556 ?auto_2194566 ) ) ( not ( = ?auto_2194557 ?auto_2194558 ) ) ( not ( = ?auto_2194557 ?auto_2194559 ) ) ( not ( = ?auto_2194557 ?auto_2194560 ) ) ( not ( = ?auto_2194557 ?auto_2194566 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194558 ?auto_2194559 ?auto_2194560 )
      ( MAKE-9CRATE-VERIFY ?auto_2194551 ?auto_2194552 ?auto_2194553 ?auto_2194555 ?auto_2194554 ?auto_2194556 ?auto_2194557 ?auto_2194558 ?auto_2194559 ?auto_2194560 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2194567 - SURFACE
      ?auto_2194568 - SURFACE
      ?auto_2194569 - SURFACE
      ?auto_2194571 - SURFACE
      ?auto_2194570 - SURFACE
      ?auto_2194572 - SURFACE
      ?auto_2194573 - SURFACE
      ?auto_2194574 - SURFACE
      ?auto_2194575 - SURFACE
      ?auto_2194576 - SURFACE
      ?auto_2194577 - SURFACE
    )
    :vars
    (
      ?auto_2194581 - HOIST
      ?auto_2194582 - PLACE
      ?auto_2194578 - PLACE
      ?auto_2194579 - HOIST
      ?auto_2194583 - SURFACE
      ?auto_2194580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194581 ?auto_2194582 ) ( IS-CRATE ?auto_2194577 ) ( not ( = ?auto_2194576 ?auto_2194577 ) ) ( not ( = ?auto_2194575 ?auto_2194576 ) ) ( not ( = ?auto_2194575 ?auto_2194577 ) ) ( not ( = ?auto_2194578 ?auto_2194582 ) ) ( HOIST-AT ?auto_2194579 ?auto_2194578 ) ( not ( = ?auto_2194581 ?auto_2194579 ) ) ( AVAILABLE ?auto_2194579 ) ( SURFACE-AT ?auto_2194577 ?auto_2194578 ) ( ON ?auto_2194577 ?auto_2194583 ) ( CLEAR ?auto_2194577 ) ( not ( = ?auto_2194576 ?auto_2194583 ) ) ( not ( = ?auto_2194577 ?auto_2194583 ) ) ( not ( = ?auto_2194575 ?auto_2194583 ) ) ( SURFACE-AT ?auto_2194575 ?auto_2194582 ) ( CLEAR ?auto_2194575 ) ( IS-CRATE ?auto_2194576 ) ( AVAILABLE ?auto_2194581 ) ( IN ?auto_2194576 ?auto_2194580 ) ( TRUCK-AT ?auto_2194580 ?auto_2194578 ) ( ON ?auto_2194568 ?auto_2194567 ) ( ON ?auto_2194569 ?auto_2194568 ) ( ON ?auto_2194571 ?auto_2194569 ) ( ON ?auto_2194570 ?auto_2194571 ) ( ON ?auto_2194572 ?auto_2194570 ) ( ON ?auto_2194573 ?auto_2194572 ) ( ON ?auto_2194574 ?auto_2194573 ) ( ON ?auto_2194575 ?auto_2194574 ) ( not ( = ?auto_2194567 ?auto_2194568 ) ) ( not ( = ?auto_2194567 ?auto_2194569 ) ) ( not ( = ?auto_2194567 ?auto_2194571 ) ) ( not ( = ?auto_2194567 ?auto_2194570 ) ) ( not ( = ?auto_2194567 ?auto_2194572 ) ) ( not ( = ?auto_2194567 ?auto_2194573 ) ) ( not ( = ?auto_2194567 ?auto_2194574 ) ) ( not ( = ?auto_2194567 ?auto_2194575 ) ) ( not ( = ?auto_2194567 ?auto_2194576 ) ) ( not ( = ?auto_2194567 ?auto_2194577 ) ) ( not ( = ?auto_2194567 ?auto_2194583 ) ) ( not ( = ?auto_2194568 ?auto_2194569 ) ) ( not ( = ?auto_2194568 ?auto_2194571 ) ) ( not ( = ?auto_2194568 ?auto_2194570 ) ) ( not ( = ?auto_2194568 ?auto_2194572 ) ) ( not ( = ?auto_2194568 ?auto_2194573 ) ) ( not ( = ?auto_2194568 ?auto_2194574 ) ) ( not ( = ?auto_2194568 ?auto_2194575 ) ) ( not ( = ?auto_2194568 ?auto_2194576 ) ) ( not ( = ?auto_2194568 ?auto_2194577 ) ) ( not ( = ?auto_2194568 ?auto_2194583 ) ) ( not ( = ?auto_2194569 ?auto_2194571 ) ) ( not ( = ?auto_2194569 ?auto_2194570 ) ) ( not ( = ?auto_2194569 ?auto_2194572 ) ) ( not ( = ?auto_2194569 ?auto_2194573 ) ) ( not ( = ?auto_2194569 ?auto_2194574 ) ) ( not ( = ?auto_2194569 ?auto_2194575 ) ) ( not ( = ?auto_2194569 ?auto_2194576 ) ) ( not ( = ?auto_2194569 ?auto_2194577 ) ) ( not ( = ?auto_2194569 ?auto_2194583 ) ) ( not ( = ?auto_2194571 ?auto_2194570 ) ) ( not ( = ?auto_2194571 ?auto_2194572 ) ) ( not ( = ?auto_2194571 ?auto_2194573 ) ) ( not ( = ?auto_2194571 ?auto_2194574 ) ) ( not ( = ?auto_2194571 ?auto_2194575 ) ) ( not ( = ?auto_2194571 ?auto_2194576 ) ) ( not ( = ?auto_2194571 ?auto_2194577 ) ) ( not ( = ?auto_2194571 ?auto_2194583 ) ) ( not ( = ?auto_2194570 ?auto_2194572 ) ) ( not ( = ?auto_2194570 ?auto_2194573 ) ) ( not ( = ?auto_2194570 ?auto_2194574 ) ) ( not ( = ?auto_2194570 ?auto_2194575 ) ) ( not ( = ?auto_2194570 ?auto_2194576 ) ) ( not ( = ?auto_2194570 ?auto_2194577 ) ) ( not ( = ?auto_2194570 ?auto_2194583 ) ) ( not ( = ?auto_2194572 ?auto_2194573 ) ) ( not ( = ?auto_2194572 ?auto_2194574 ) ) ( not ( = ?auto_2194572 ?auto_2194575 ) ) ( not ( = ?auto_2194572 ?auto_2194576 ) ) ( not ( = ?auto_2194572 ?auto_2194577 ) ) ( not ( = ?auto_2194572 ?auto_2194583 ) ) ( not ( = ?auto_2194573 ?auto_2194574 ) ) ( not ( = ?auto_2194573 ?auto_2194575 ) ) ( not ( = ?auto_2194573 ?auto_2194576 ) ) ( not ( = ?auto_2194573 ?auto_2194577 ) ) ( not ( = ?auto_2194573 ?auto_2194583 ) ) ( not ( = ?auto_2194574 ?auto_2194575 ) ) ( not ( = ?auto_2194574 ?auto_2194576 ) ) ( not ( = ?auto_2194574 ?auto_2194577 ) ) ( not ( = ?auto_2194574 ?auto_2194583 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194575 ?auto_2194576 ?auto_2194577 )
      ( MAKE-10CRATE-VERIFY ?auto_2194567 ?auto_2194568 ?auto_2194569 ?auto_2194571 ?auto_2194570 ?auto_2194572 ?auto_2194573 ?auto_2194574 ?auto_2194575 ?auto_2194576 ?auto_2194577 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2194584 - SURFACE
      ?auto_2194585 - SURFACE
      ?auto_2194586 - SURFACE
      ?auto_2194588 - SURFACE
      ?auto_2194587 - SURFACE
      ?auto_2194589 - SURFACE
      ?auto_2194590 - SURFACE
      ?auto_2194591 - SURFACE
      ?auto_2194592 - SURFACE
      ?auto_2194593 - SURFACE
      ?auto_2194594 - SURFACE
      ?auto_2194595 - SURFACE
    )
    :vars
    (
      ?auto_2194599 - HOIST
      ?auto_2194600 - PLACE
      ?auto_2194596 - PLACE
      ?auto_2194597 - HOIST
      ?auto_2194601 - SURFACE
      ?auto_2194598 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194599 ?auto_2194600 ) ( IS-CRATE ?auto_2194595 ) ( not ( = ?auto_2194594 ?auto_2194595 ) ) ( not ( = ?auto_2194593 ?auto_2194594 ) ) ( not ( = ?auto_2194593 ?auto_2194595 ) ) ( not ( = ?auto_2194596 ?auto_2194600 ) ) ( HOIST-AT ?auto_2194597 ?auto_2194596 ) ( not ( = ?auto_2194599 ?auto_2194597 ) ) ( AVAILABLE ?auto_2194597 ) ( SURFACE-AT ?auto_2194595 ?auto_2194596 ) ( ON ?auto_2194595 ?auto_2194601 ) ( CLEAR ?auto_2194595 ) ( not ( = ?auto_2194594 ?auto_2194601 ) ) ( not ( = ?auto_2194595 ?auto_2194601 ) ) ( not ( = ?auto_2194593 ?auto_2194601 ) ) ( SURFACE-AT ?auto_2194593 ?auto_2194600 ) ( CLEAR ?auto_2194593 ) ( IS-CRATE ?auto_2194594 ) ( AVAILABLE ?auto_2194599 ) ( IN ?auto_2194594 ?auto_2194598 ) ( TRUCK-AT ?auto_2194598 ?auto_2194596 ) ( ON ?auto_2194585 ?auto_2194584 ) ( ON ?auto_2194586 ?auto_2194585 ) ( ON ?auto_2194588 ?auto_2194586 ) ( ON ?auto_2194587 ?auto_2194588 ) ( ON ?auto_2194589 ?auto_2194587 ) ( ON ?auto_2194590 ?auto_2194589 ) ( ON ?auto_2194591 ?auto_2194590 ) ( ON ?auto_2194592 ?auto_2194591 ) ( ON ?auto_2194593 ?auto_2194592 ) ( not ( = ?auto_2194584 ?auto_2194585 ) ) ( not ( = ?auto_2194584 ?auto_2194586 ) ) ( not ( = ?auto_2194584 ?auto_2194588 ) ) ( not ( = ?auto_2194584 ?auto_2194587 ) ) ( not ( = ?auto_2194584 ?auto_2194589 ) ) ( not ( = ?auto_2194584 ?auto_2194590 ) ) ( not ( = ?auto_2194584 ?auto_2194591 ) ) ( not ( = ?auto_2194584 ?auto_2194592 ) ) ( not ( = ?auto_2194584 ?auto_2194593 ) ) ( not ( = ?auto_2194584 ?auto_2194594 ) ) ( not ( = ?auto_2194584 ?auto_2194595 ) ) ( not ( = ?auto_2194584 ?auto_2194601 ) ) ( not ( = ?auto_2194585 ?auto_2194586 ) ) ( not ( = ?auto_2194585 ?auto_2194588 ) ) ( not ( = ?auto_2194585 ?auto_2194587 ) ) ( not ( = ?auto_2194585 ?auto_2194589 ) ) ( not ( = ?auto_2194585 ?auto_2194590 ) ) ( not ( = ?auto_2194585 ?auto_2194591 ) ) ( not ( = ?auto_2194585 ?auto_2194592 ) ) ( not ( = ?auto_2194585 ?auto_2194593 ) ) ( not ( = ?auto_2194585 ?auto_2194594 ) ) ( not ( = ?auto_2194585 ?auto_2194595 ) ) ( not ( = ?auto_2194585 ?auto_2194601 ) ) ( not ( = ?auto_2194586 ?auto_2194588 ) ) ( not ( = ?auto_2194586 ?auto_2194587 ) ) ( not ( = ?auto_2194586 ?auto_2194589 ) ) ( not ( = ?auto_2194586 ?auto_2194590 ) ) ( not ( = ?auto_2194586 ?auto_2194591 ) ) ( not ( = ?auto_2194586 ?auto_2194592 ) ) ( not ( = ?auto_2194586 ?auto_2194593 ) ) ( not ( = ?auto_2194586 ?auto_2194594 ) ) ( not ( = ?auto_2194586 ?auto_2194595 ) ) ( not ( = ?auto_2194586 ?auto_2194601 ) ) ( not ( = ?auto_2194588 ?auto_2194587 ) ) ( not ( = ?auto_2194588 ?auto_2194589 ) ) ( not ( = ?auto_2194588 ?auto_2194590 ) ) ( not ( = ?auto_2194588 ?auto_2194591 ) ) ( not ( = ?auto_2194588 ?auto_2194592 ) ) ( not ( = ?auto_2194588 ?auto_2194593 ) ) ( not ( = ?auto_2194588 ?auto_2194594 ) ) ( not ( = ?auto_2194588 ?auto_2194595 ) ) ( not ( = ?auto_2194588 ?auto_2194601 ) ) ( not ( = ?auto_2194587 ?auto_2194589 ) ) ( not ( = ?auto_2194587 ?auto_2194590 ) ) ( not ( = ?auto_2194587 ?auto_2194591 ) ) ( not ( = ?auto_2194587 ?auto_2194592 ) ) ( not ( = ?auto_2194587 ?auto_2194593 ) ) ( not ( = ?auto_2194587 ?auto_2194594 ) ) ( not ( = ?auto_2194587 ?auto_2194595 ) ) ( not ( = ?auto_2194587 ?auto_2194601 ) ) ( not ( = ?auto_2194589 ?auto_2194590 ) ) ( not ( = ?auto_2194589 ?auto_2194591 ) ) ( not ( = ?auto_2194589 ?auto_2194592 ) ) ( not ( = ?auto_2194589 ?auto_2194593 ) ) ( not ( = ?auto_2194589 ?auto_2194594 ) ) ( not ( = ?auto_2194589 ?auto_2194595 ) ) ( not ( = ?auto_2194589 ?auto_2194601 ) ) ( not ( = ?auto_2194590 ?auto_2194591 ) ) ( not ( = ?auto_2194590 ?auto_2194592 ) ) ( not ( = ?auto_2194590 ?auto_2194593 ) ) ( not ( = ?auto_2194590 ?auto_2194594 ) ) ( not ( = ?auto_2194590 ?auto_2194595 ) ) ( not ( = ?auto_2194590 ?auto_2194601 ) ) ( not ( = ?auto_2194591 ?auto_2194592 ) ) ( not ( = ?auto_2194591 ?auto_2194593 ) ) ( not ( = ?auto_2194591 ?auto_2194594 ) ) ( not ( = ?auto_2194591 ?auto_2194595 ) ) ( not ( = ?auto_2194591 ?auto_2194601 ) ) ( not ( = ?auto_2194592 ?auto_2194593 ) ) ( not ( = ?auto_2194592 ?auto_2194594 ) ) ( not ( = ?auto_2194592 ?auto_2194595 ) ) ( not ( = ?auto_2194592 ?auto_2194601 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194593 ?auto_2194594 ?auto_2194595 )
      ( MAKE-11CRATE-VERIFY ?auto_2194584 ?auto_2194585 ?auto_2194586 ?auto_2194588 ?auto_2194587 ?auto_2194589 ?auto_2194590 ?auto_2194591 ?auto_2194592 ?auto_2194593 ?auto_2194594 ?auto_2194595 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2194602 - SURFACE
      ?auto_2194603 - SURFACE
      ?auto_2194604 - SURFACE
      ?auto_2194606 - SURFACE
      ?auto_2194605 - SURFACE
      ?auto_2194607 - SURFACE
      ?auto_2194608 - SURFACE
      ?auto_2194609 - SURFACE
      ?auto_2194610 - SURFACE
      ?auto_2194611 - SURFACE
      ?auto_2194612 - SURFACE
      ?auto_2194613 - SURFACE
      ?auto_2194614 - SURFACE
    )
    :vars
    (
      ?auto_2194618 - HOIST
      ?auto_2194619 - PLACE
      ?auto_2194615 - PLACE
      ?auto_2194616 - HOIST
      ?auto_2194620 - SURFACE
      ?auto_2194617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194618 ?auto_2194619 ) ( IS-CRATE ?auto_2194614 ) ( not ( = ?auto_2194613 ?auto_2194614 ) ) ( not ( = ?auto_2194612 ?auto_2194613 ) ) ( not ( = ?auto_2194612 ?auto_2194614 ) ) ( not ( = ?auto_2194615 ?auto_2194619 ) ) ( HOIST-AT ?auto_2194616 ?auto_2194615 ) ( not ( = ?auto_2194618 ?auto_2194616 ) ) ( AVAILABLE ?auto_2194616 ) ( SURFACE-AT ?auto_2194614 ?auto_2194615 ) ( ON ?auto_2194614 ?auto_2194620 ) ( CLEAR ?auto_2194614 ) ( not ( = ?auto_2194613 ?auto_2194620 ) ) ( not ( = ?auto_2194614 ?auto_2194620 ) ) ( not ( = ?auto_2194612 ?auto_2194620 ) ) ( SURFACE-AT ?auto_2194612 ?auto_2194619 ) ( CLEAR ?auto_2194612 ) ( IS-CRATE ?auto_2194613 ) ( AVAILABLE ?auto_2194618 ) ( IN ?auto_2194613 ?auto_2194617 ) ( TRUCK-AT ?auto_2194617 ?auto_2194615 ) ( ON ?auto_2194603 ?auto_2194602 ) ( ON ?auto_2194604 ?auto_2194603 ) ( ON ?auto_2194606 ?auto_2194604 ) ( ON ?auto_2194605 ?auto_2194606 ) ( ON ?auto_2194607 ?auto_2194605 ) ( ON ?auto_2194608 ?auto_2194607 ) ( ON ?auto_2194609 ?auto_2194608 ) ( ON ?auto_2194610 ?auto_2194609 ) ( ON ?auto_2194611 ?auto_2194610 ) ( ON ?auto_2194612 ?auto_2194611 ) ( not ( = ?auto_2194602 ?auto_2194603 ) ) ( not ( = ?auto_2194602 ?auto_2194604 ) ) ( not ( = ?auto_2194602 ?auto_2194606 ) ) ( not ( = ?auto_2194602 ?auto_2194605 ) ) ( not ( = ?auto_2194602 ?auto_2194607 ) ) ( not ( = ?auto_2194602 ?auto_2194608 ) ) ( not ( = ?auto_2194602 ?auto_2194609 ) ) ( not ( = ?auto_2194602 ?auto_2194610 ) ) ( not ( = ?auto_2194602 ?auto_2194611 ) ) ( not ( = ?auto_2194602 ?auto_2194612 ) ) ( not ( = ?auto_2194602 ?auto_2194613 ) ) ( not ( = ?auto_2194602 ?auto_2194614 ) ) ( not ( = ?auto_2194602 ?auto_2194620 ) ) ( not ( = ?auto_2194603 ?auto_2194604 ) ) ( not ( = ?auto_2194603 ?auto_2194606 ) ) ( not ( = ?auto_2194603 ?auto_2194605 ) ) ( not ( = ?auto_2194603 ?auto_2194607 ) ) ( not ( = ?auto_2194603 ?auto_2194608 ) ) ( not ( = ?auto_2194603 ?auto_2194609 ) ) ( not ( = ?auto_2194603 ?auto_2194610 ) ) ( not ( = ?auto_2194603 ?auto_2194611 ) ) ( not ( = ?auto_2194603 ?auto_2194612 ) ) ( not ( = ?auto_2194603 ?auto_2194613 ) ) ( not ( = ?auto_2194603 ?auto_2194614 ) ) ( not ( = ?auto_2194603 ?auto_2194620 ) ) ( not ( = ?auto_2194604 ?auto_2194606 ) ) ( not ( = ?auto_2194604 ?auto_2194605 ) ) ( not ( = ?auto_2194604 ?auto_2194607 ) ) ( not ( = ?auto_2194604 ?auto_2194608 ) ) ( not ( = ?auto_2194604 ?auto_2194609 ) ) ( not ( = ?auto_2194604 ?auto_2194610 ) ) ( not ( = ?auto_2194604 ?auto_2194611 ) ) ( not ( = ?auto_2194604 ?auto_2194612 ) ) ( not ( = ?auto_2194604 ?auto_2194613 ) ) ( not ( = ?auto_2194604 ?auto_2194614 ) ) ( not ( = ?auto_2194604 ?auto_2194620 ) ) ( not ( = ?auto_2194606 ?auto_2194605 ) ) ( not ( = ?auto_2194606 ?auto_2194607 ) ) ( not ( = ?auto_2194606 ?auto_2194608 ) ) ( not ( = ?auto_2194606 ?auto_2194609 ) ) ( not ( = ?auto_2194606 ?auto_2194610 ) ) ( not ( = ?auto_2194606 ?auto_2194611 ) ) ( not ( = ?auto_2194606 ?auto_2194612 ) ) ( not ( = ?auto_2194606 ?auto_2194613 ) ) ( not ( = ?auto_2194606 ?auto_2194614 ) ) ( not ( = ?auto_2194606 ?auto_2194620 ) ) ( not ( = ?auto_2194605 ?auto_2194607 ) ) ( not ( = ?auto_2194605 ?auto_2194608 ) ) ( not ( = ?auto_2194605 ?auto_2194609 ) ) ( not ( = ?auto_2194605 ?auto_2194610 ) ) ( not ( = ?auto_2194605 ?auto_2194611 ) ) ( not ( = ?auto_2194605 ?auto_2194612 ) ) ( not ( = ?auto_2194605 ?auto_2194613 ) ) ( not ( = ?auto_2194605 ?auto_2194614 ) ) ( not ( = ?auto_2194605 ?auto_2194620 ) ) ( not ( = ?auto_2194607 ?auto_2194608 ) ) ( not ( = ?auto_2194607 ?auto_2194609 ) ) ( not ( = ?auto_2194607 ?auto_2194610 ) ) ( not ( = ?auto_2194607 ?auto_2194611 ) ) ( not ( = ?auto_2194607 ?auto_2194612 ) ) ( not ( = ?auto_2194607 ?auto_2194613 ) ) ( not ( = ?auto_2194607 ?auto_2194614 ) ) ( not ( = ?auto_2194607 ?auto_2194620 ) ) ( not ( = ?auto_2194608 ?auto_2194609 ) ) ( not ( = ?auto_2194608 ?auto_2194610 ) ) ( not ( = ?auto_2194608 ?auto_2194611 ) ) ( not ( = ?auto_2194608 ?auto_2194612 ) ) ( not ( = ?auto_2194608 ?auto_2194613 ) ) ( not ( = ?auto_2194608 ?auto_2194614 ) ) ( not ( = ?auto_2194608 ?auto_2194620 ) ) ( not ( = ?auto_2194609 ?auto_2194610 ) ) ( not ( = ?auto_2194609 ?auto_2194611 ) ) ( not ( = ?auto_2194609 ?auto_2194612 ) ) ( not ( = ?auto_2194609 ?auto_2194613 ) ) ( not ( = ?auto_2194609 ?auto_2194614 ) ) ( not ( = ?auto_2194609 ?auto_2194620 ) ) ( not ( = ?auto_2194610 ?auto_2194611 ) ) ( not ( = ?auto_2194610 ?auto_2194612 ) ) ( not ( = ?auto_2194610 ?auto_2194613 ) ) ( not ( = ?auto_2194610 ?auto_2194614 ) ) ( not ( = ?auto_2194610 ?auto_2194620 ) ) ( not ( = ?auto_2194611 ?auto_2194612 ) ) ( not ( = ?auto_2194611 ?auto_2194613 ) ) ( not ( = ?auto_2194611 ?auto_2194614 ) ) ( not ( = ?auto_2194611 ?auto_2194620 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194612 ?auto_2194613 ?auto_2194614 )
      ( MAKE-12CRATE-VERIFY ?auto_2194602 ?auto_2194603 ?auto_2194604 ?auto_2194606 ?auto_2194605 ?auto_2194607 ?auto_2194608 ?auto_2194609 ?auto_2194610 ?auto_2194611 ?auto_2194612 ?auto_2194613 ?auto_2194614 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2194621 - SURFACE
      ?auto_2194622 - SURFACE
      ?auto_2194623 - SURFACE
      ?auto_2194625 - SURFACE
      ?auto_2194624 - SURFACE
      ?auto_2194626 - SURFACE
      ?auto_2194627 - SURFACE
      ?auto_2194628 - SURFACE
      ?auto_2194629 - SURFACE
      ?auto_2194630 - SURFACE
      ?auto_2194631 - SURFACE
      ?auto_2194632 - SURFACE
      ?auto_2194633 - SURFACE
      ?auto_2194634 - SURFACE
    )
    :vars
    (
      ?auto_2194638 - HOIST
      ?auto_2194639 - PLACE
      ?auto_2194635 - PLACE
      ?auto_2194636 - HOIST
      ?auto_2194640 - SURFACE
      ?auto_2194637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194638 ?auto_2194639 ) ( IS-CRATE ?auto_2194634 ) ( not ( = ?auto_2194633 ?auto_2194634 ) ) ( not ( = ?auto_2194632 ?auto_2194633 ) ) ( not ( = ?auto_2194632 ?auto_2194634 ) ) ( not ( = ?auto_2194635 ?auto_2194639 ) ) ( HOIST-AT ?auto_2194636 ?auto_2194635 ) ( not ( = ?auto_2194638 ?auto_2194636 ) ) ( AVAILABLE ?auto_2194636 ) ( SURFACE-AT ?auto_2194634 ?auto_2194635 ) ( ON ?auto_2194634 ?auto_2194640 ) ( CLEAR ?auto_2194634 ) ( not ( = ?auto_2194633 ?auto_2194640 ) ) ( not ( = ?auto_2194634 ?auto_2194640 ) ) ( not ( = ?auto_2194632 ?auto_2194640 ) ) ( SURFACE-AT ?auto_2194632 ?auto_2194639 ) ( CLEAR ?auto_2194632 ) ( IS-CRATE ?auto_2194633 ) ( AVAILABLE ?auto_2194638 ) ( IN ?auto_2194633 ?auto_2194637 ) ( TRUCK-AT ?auto_2194637 ?auto_2194635 ) ( ON ?auto_2194622 ?auto_2194621 ) ( ON ?auto_2194623 ?auto_2194622 ) ( ON ?auto_2194625 ?auto_2194623 ) ( ON ?auto_2194624 ?auto_2194625 ) ( ON ?auto_2194626 ?auto_2194624 ) ( ON ?auto_2194627 ?auto_2194626 ) ( ON ?auto_2194628 ?auto_2194627 ) ( ON ?auto_2194629 ?auto_2194628 ) ( ON ?auto_2194630 ?auto_2194629 ) ( ON ?auto_2194631 ?auto_2194630 ) ( ON ?auto_2194632 ?auto_2194631 ) ( not ( = ?auto_2194621 ?auto_2194622 ) ) ( not ( = ?auto_2194621 ?auto_2194623 ) ) ( not ( = ?auto_2194621 ?auto_2194625 ) ) ( not ( = ?auto_2194621 ?auto_2194624 ) ) ( not ( = ?auto_2194621 ?auto_2194626 ) ) ( not ( = ?auto_2194621 ?auto_2194627 ) ) ( not ( = ?auto_2194621 ?auto_2194628 ) ) ( not ( = ?auto_2194621 ?auto_2194629 ) ) ( not ( = ?auto_2194621 ?auto_2194630 ) ) ( not ( = ?auto_2194621 ?auto_2194631 ) ) ( not ( = ?auto_2194621 ?auto_2194632 ) ) ( not ( = ?auto_2194621 ?auto_2194633 ) ) ( not ( = ?auto_2194621 ?auto_2194634 ) ) ( not ( = ?auto_2194621 ?auto_2194640 ) ) ( not ( = ?auto_2194622 ?auto_2194623 ) ) ( not ( = ?auto_2194622 ?auto_2194625 ) ) ( not ( = ?auto_2194622 ?auto_2194624 ) ) ( not ( = ?auto_2194622 ?auto_2194626 ) ) ( not ( = ?auto_2194622 ?auto_2194627 ) ) ( not ( = ?auto_2194622 ?auto_2194628 ) ) ( not ( = ?auto_2194622 ?auto_2194629 ) ) ( not ( = ?auto_2194622 ?auto_2194630 ) ) ( not ( = ?auto_2194622 ?auto_2194631 ) ) ( not ( = ?auto_2194622 ?auto_2194632 ) ) ( not ( = ?auto_2194622 ?auto_2194633 ) ) ( not ( = ?auto_2194622 ?auto_2194634 ) ) ( not ( = ?auto_2194622 ?auto_2194640 ) ) ( not ( = ?auto_2194623 ?auto_2194625 ) ) ( not ( = ?auto_2194623 ?auto_2194624 ) ) ( not ( = ?auto_2194623 ?auto_2194626 ) ) ( not ( = ?auto_2194623 ?auto_2194627 ) ) ( not ( = ?auto_2194623 ?auto_2194628 ) ) ( not ( = ?auto_2194623 ?auto_2194629 ) ) ( not ( = ?auto_2194623 ?auto_2194630 ) ) ( not ( = ?auto_2194623 ?auto_2194631 ) ) ( not ( = ?auto_2194623 ?auto_2194632 ) ) ( not ( = ?auto_2194623 ?auto_2194633 ) ) ( not ( = ?auto_2194623 ?auto_2194634 ) ) ( not ( = ?auto_2194623 ?auto_2194640 ) ) ( not ( = ?auto_2194625 ?auto_2194624 ) ) ( not ( = ?auto_2194625 ?auto_2194626 ) ) ( not ( = ?auto_2194625 ?auto_2194627 ) ) ( not ( = ?auto_2194625 ?auto_2194628 ) ) ( not ( = ?auto_2194625 ?auto_2194629 ) ) ( not ( = ?auto_2194625 ?auto_2194630 ) ) ( not ( = ?auto_2194625 ?auto_2194631 ) ) ( not ( = ?auto_2194625 ?auto_2194632 ) ) ( not ( = ?auto_2194625 ?auto_2194633 ) ) ( not ( = ?auto_2194625 ?auto_2194634 ) ) ( not ( = ?auto_2194625 ?auto_2194640 ) ) ( not ( = ?auto_2194624 ?auto_2194626 ) ) ( not ( = ?auto_2194624 ?auto_2194627 ) ) ( not ( = ?auto_2194624 ?auto_2194628 ) ) ( not ( = ?auto_2194624 ?auto_2194629 ) ) ( not ( = ?auto_2194624 ?auto_2194630 ) ) ( not ( = ?auto_2194624 ?auto_2194631 ) ) ( not ( = ?auto_2194624 ?auto_2194632 ) ) ( not ( = ?auto_2194624 ?auto_2194633 ) ) ( not ( = ?auto_2194624 ?auto_2194634 ) ) ( not ( = ?auto_2194624 ?auto_2194640 ) ) ( not ( = ?auto_2194626 ?auto_2194627 ) ) ( not ( = ?auto_2194626 ?auto_2194628 ) ) ( not ( = ?auto_2194626 ?auto_2194629 ) ) ( not ( = ?auto_2194626 ?auto_2194630 ) ) ( not ( = ?auto_2194626 ?auto_2194631 ) ) ( not ( = ?auto_2194626 ?auto_2194632 ) ) ( not ( = ?auto_2194626 ?auto_2194633 ) ) ( not ( = ?auto_2194626 ?auto_2194634 ) ) ( not ( = ?auto_2194626 ?auto_2194640 ) ) ( not ( = ?auto_2194627 ?auto_2194628 ) ) ( not ( = ?auto_2194627 ?auto_2194629 ) ) ( not ( = ?auto_2194627 ?auto_2194630 ) ) ( not ( = ?auto_2194627 ?auto_2194631 ) ) ( not ( = ?auto_2194627 ?auto_2194632 ) ) ( not ( = ?auto_2194627 ?auto_2194633 ) ) ( not ( = ?auto_2194627 ?auto_2194634 ) ) ( not ( = ?auto_2194627 ?auto_2194640 ) ) ( not ( = ?auto_2194628 ?auto_2194629 ) ) ( not ( = ?auto_2194628 ?auto_2194630 ) ) ( not ( = ?auto_2194628 ?auto_2194631 ) ) ( not ( = ?auto_2194628 ?auto_2194632 ) ) ( not ( = ?auto_2194628 ?auto_2194633 ) ) ( not ( = ?auto_2194628 ?auto_2194634 ) ) ( not ( = ?auto_2194628 ?auto_2194640 ) ) ( not ( = ?auto_2194629 ?auto_2194630 ) ) ( not ( = ?auto_2194629 ?auto_2194631 ) ) ( not ( = ?auto_2194629 ?auto_2194632 ) ) ( not ( = ?auto_2194629 ?auto_2194633 ) ) ( not ( = ?auto_2194629 ?auto_2194634 ) ) ( not ( = ?auto_2194629 ?auto_2194640 ) ) ( not ( = ?auto_2194630 ?auto_2194631 ) ) ( not ( = ?auto_2194630 ?auto_2194632 ) ) ( not ( = ?auto_2194630 ?auto_2194633 ) ) ( not ( = ?auto_2194630 ?auto_2194634 ) ) ( not ( = ?auto_2194630 ?auto_2194640 ) ) ( not ( = ?auto_2194631 ?auto_2194632 ) ) ( not ( = ?auto_2194631 ?auto_2194633 ) ) ( not ( = ?auto_2194631 ?auto_2194634 ) ) ( not ( = ?auto_2194631 ?auto_2194640 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194632 ?auto_2194633 ?auto_2194634 )
      ( MAKE-13CRATE-VERIFY ?auto_2194621 ?auto_2194622 ?auto_2194623 ?auto_2194625 ?auto_2194624 ?auto_2194626 ?auto_2194627 ?auto_2194628 ?auto_2194629 ?auto_2194630 ?auto_2194631 ?auto_2194632 ?auto_2194633 ?auto_2194634 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2194641 - SURFACE
      ?auto_2194642 - SURFACE
      ?auto_2194643 - SURFACE
      ?auto_2194645 - SURFACE
      ?auto_2194644 - SURFACE
      ?auto_2194646 - SURFACE
      ?auto_2194647 - SURFACE
      ?auto_2194648 - SURFACE
      ?auto_2194649 - SURFACE
      ?auto_2194650 - SURFACE
      ?auto_2194651 - SURFACE
      ?auto_2194652 - SURFACE
      ?auto_2194653 - SURFACE
      ?auto_2194654 - SURFACE
      ?auto_2194655 - SURFACE
    )
    :vars
    (
      ?auto_2194659 - HOIST
      ?auto_2194660 - PLACE
      ?auto_2194656 - PLACE
      ?auto_2194657 - HOIST
      ?auto_2194661 - SURFACE
      ?auto_2194658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194659 ?auto_2194660 ) ( IS-CRATE ?auto_2194655 ) ( not ( = ?auto_2194654 ?auto_2194655 ) ) ( not ( = ?auto_2194653 ?auto_2194654 ) ) ( not ( = ?auto_2194653 ?auto_2194655 ) ) ( not ( = ?auto_2194656 ?auto_2194660 ) ) ( HOIST-AT ?auto_2194657 ?auto_2194656 ) ( not ( = ?auto_2194659 ?auto_2194657 ) ) ( AVAILABLE ?auto_2194657 ) ( SURFACE-AT ?auto_2194655 ?auto_2194656 ) ( ON ?auto_2194655 ?auto_2194661 ) ( CLEAR ?auto_2194655 ) ( not ( = ?auto_2194654 ?auto_2194661 ) ) ( not ( = ?auto_2194655 ?auto_2194661 ) ) ( not ( = ?auto_2194653 ?auto_2194661 ) ) ( SURFACE-AT ?auto_2194653 ?auto_2194660 ) ( CLEAR ?auto_2194653 ) ( IS-CRATE ?auto_2194654 ) ( AVAILABLE ?auto_2194659 ) ( IN ?auto_2194654 ?auto_2194658 ) ( TRUCK-AT ?auto_2194658 ?auto_2194656 ) ( ON ?auto_2194642 ?auto_2194641 ) ( ON ?auto_2194643 ?auto_2194642 ) ( ON ?auto_2194645 ?auto_2194643 ) ( ON ?auto_2194644 ?auto_2194645 ) ( ON ?auto_2194646 ?auto_2194644 ) ( ON ?auto_2194647 ?auto_2194646 ) ( ON ?auto_2194648 ?auto_2194647 ) ( ON ?auto_2194649 ?auto_2194648 ) ( ON ?auto_2194650 ?auto_2194649 ) ( ON ?auto_2194651 ?auto_2194650 ) ( ON ?auto_2194652 ?auto_2194651 ) ( ON ?auto_2194653 ?auto_2194652 ) ( not ( = ?auto_2194641 ?auto_2194642 ) ) ( not ( = ?auto_2194641 ?auto_2194643 ) ) ( not ( = ?auto_2194641 ?auto_2194645 ) ) ( not ( = ?auto_2194641 ?auto_2194644 ) ) ( not ( = ?auto_2194641 ?auto_2194646 ) ) ( not ( = ?auto_2194641 ?auto_2194647 ) ) ( not ( = ?auto_2194641 ?auto_2194648 ) ) ( not ( = ?auto_2194641 ?auto_2194649 ) ) ( not ( = ?auto_2194641 ?auto_2194650 ) ) ( not ( = ?auto_2194641 ?auto_2194651 ) ) ( not ( = ?auto_2194641 ?auto_2194652 ) ) ( not ( = ?auto_2194641 ?auto_2194653 ) ) ( not ( = ?auto_2194641 ?auto_2194654 ) ) ( not ( = ?auto_2194641 ?auto_2194655 ) ) ( not ( = ?auto_2194641 ?auto_2194661 ) ) ( not ( = ?auto_2194642 ?auto_2194643 ) ) ( not ( = ?auto_2194642 ?auto_2194645 ) ) ( not ( = ?auto_2194642 ?auto_2194644 ) ) ( not ( = ?auto_2194642 ?auto_2194646 ) ) ( not ( = ?auto_2194642 ?auto_2194647 ) ) ( not ( = ?auto_2194642 ?auto_2194648 ) ) ( not ( = ?auto_2194642 ?auto_2194649 ) ) ( not ( = ?auto_2194642 ?auto_2194650 ) ) ( not ( = ?auto_2194642 ?auto_2194651 ) ) ( not ( = ?auto_2194642 ?auto_2194652 ) ) ( not ( = ?auto_2194642 ?auto_2194653 ) ) ( not ( = ?auto_2194642 ?auto_2194654 ) ) ( not ( = ?auto_2194642 ?auto_2194655 ) ) ( not ( = ?auto_2194642 ?auto_2194661 ) ) ( not ( = ?auto_2194643 ?auto_2194645 ) ) ( not ( = ?auto_2194643 ?auto_2194644 ) ) ( not ( = ?auto_2194643 ?auto_2194646 ) ) ( not ( = ?auto_2194643 ?auto_2194647 ) ) ( not ( = ?auto_2194643 ?auto_2194648 ) ) ( not ( = ?auto_2194643 ?auto_2194649 ) ) ( not ( = ?auto_2194643 ?auto_2194650 ) ) ( not ( = ?auto_2194643 ?auto_2194651 ) ) ( not ( = ?auto_2194643 ?auto_2194652 ) ) ( not ( = ?auto_2194643 ?auto_2194653 ) ) ( not ( = ?auto_2194643 ?auto_2194654 ) ) ( not ( = ?auto_2194643 ?auto_2194655 ) ) ( not ( = ?auto_2194643 ?auto_2194661 ) ) ( not ( = ?auto_2194645 ?auto_2194644 ) ) ( not ( = ?auto_2194645 ?auto_2194646 ) ) ( not ( = ?auto_2194645 ?auto_2194647 ) ) ( not ( = ?auto_2194645 ?auto_2194648 ) ) ( not ( = ?auto_2194645 ?auto_2194649 ) ) ( not ( = ?auto_2194645 ?auto_2194650 ) ) ( not ( = ?auto_2194645 ?auto_2194651 ) ) ( not ( = ?auto_2194645 ?auto_2194652 ) ) ( not ( = ?auto_2194645 ?auto_2194653 ) ) ( not ( = ?auto_2194645 ?auto_2194654 ) ) ( not ( = ?auto_2194645 ?auto_2194655 ) ) ( not ( = ?auto_2194645 ?auto_2194661 ) ) ( not ( = ?auto_2194644 ?auto_2194646 ) ) ( not ( = ?auto_2194644 ?auto_2194647 ) ) ( not ( = ?auto_2194644 ?auto_2194648 ) ) ( not ( = ?auto_2194644 ?auto_2194649 ) ) ( not ( = ?auto_2194644 ?auto_2194650 ) ) ( not ( = ?auto_2194644 ?auto_2194651 ) ) ( not ( = ?auto_2194644 ?auto_2194652 ) ) ( not ( = ?auto_2194644 ?auto_2194653 ) ) ( not ( = ?auto_2194644 ?auto_2194654 ) ) ( not ( = ?auto_2194644 ?auto_2194655 ) ) ( not ( = ?auto_2194644 ?auto_2194661 ) ) ( not ( = ?auto_2194646 ?auto_2194647 ) ) ( not ( = ?auto_2194646 ?auto_2194648 ) ) ( not ( = ?auto_2194646 ?auto_2194649 ) ) ( not ( = ?auto_2194646 ?auto_2194650 ) ) ( not ( = ?auto_2194646 ?auto_2194651 ) ) ( not ( = ?auto_2194646 ?auto_2194652 ) ) ( not ( = ?auto_2194646 ?auto_2194653 ) ) ( not ( = ?auto_2194646 ?auto_2194654 ) ) ( not ( = ?auto_2194646 ?auto_2194655 ) ) ( not ( = ?auto_2194646 ?auto_2194661 ) ) ( not ( = ?auto_2194647 ?auto_2194648 ) ) ( not ( = ?auto_2194647 ?auto_2194649 ) ) ( not ( = ?auto_2194647 ?auto_2194650 ) ) ( not ( = ?auto_2194647 ?auto_2194651 ) ) ( not ( = ?auto_2194647 ?auto_2194652 ) ) ( not ( = ?auto_2194647 ?auto_2194653 ) ) ( not ( = ?auto_2194647 ?auto_2194654 ) ) ( not ( = ?auto_2194647 ?auto_2194655 ) ) ( not ( = ?auto_2194647 ?auto_2194661 ) ) ( not ( = ?auto_2194648 ?auto_2194649 ) ) ( not ( = ?auto_2194648 ?auto_2194650 ) ) ( not ( = ?auto_2194648 ?auto_2194651 ) ) ( not ( = ?auto_2194648 ?auto_2194652 ) ) ( not ( = ?auto_2194648 ?auto_2194653 ) ) ( not ( = ?auto_2194648 ?auto_2194654 ) ) ( not ( = ?auto_2194648 ?auto_2194655 ) ) ( not ( = ?auto_2194648 ?auto_2194661 ) ) ( not ( = ?auto_2194649 ?auto_2194650 ) ) ( not ( = ?auto_2194649 ?auto_2194651 ) ) ( not ( = ?auto_2194649 ?auto_2194652 ) ) ( not ( = ?auto_2194649 ?auto_2194653 ) ) ( not ( = ?auto_2194649 ?auto_2194654 ) ) ( not ( = ?auto_2194649 ?auto_2194655 ) ) ( not ( = ?auto_2194649 ?auto_2194661 ) ) ( not ( = ?auto_2194650 ?auto_2194651 ) ) ( not ( = ?auto_2194650 ?auto_2194652 ) ) ( not ( = ?auto_2194650 ?auto_2194653 ) ) ( not ( = ?auto_2194650 ?auto_2194654 ) ) ( not ( = ?auto_2194650 ?auto_2194655 ) ) ( not ( = ?auto_2194650 ?auto_2194661 ) ) ( not ( = ?auto_2194651 ?auto_2194652 ) ) ( not ( = ?auto_2194651 ?auto_2194653 ) ) ( not ( = ?auto_2194651 ?auto_2194654 ) ) ( not ( = ?auto_2194651 ?auto_2194655 ) ) ( not ( = ?auto_2194651 ?auto_2194661 ) ) ( not ( = ?auto_2194652 ?auto_2194653 ) ) ( not ( = ?auto_2194652 ?auto_2194654 ) ) ( not ( = ?auto_2194652 ?auto_2194655 ) ) ( not ( = ?auto_2194652 ?auto_2194661 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194653 ?auto_2194654 ?auto_2194655 )
      ( MAKE-14CRATE-VERIFY ?auto_2194641 ?auto_2194642 ?auto_2194643 ?auto_2194645 ?auto_2194644 ?auto_2194646 ?auto_2194647 ?auto_2194648 ?auto_2194649 ?auto_2194650 ?auto_2194651 ?auto_2194652 ?auto_2194653 ?auto_2194654 ?auto_2194655 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2194662 - SURFACE
      ?auto_2194663 - SURFACE
    )
    :vars
    (
      ?auto_2194668 - HOIST
      ?auto_2194669 - PLACE
      ?auto_2194667 - SURFACE
      ?auto_2194664 - PLACE
      ?auto_2194665 - HOIST
      ?auto_2194670 - SURFACE
      ?auto_2194666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194668 ?auto_2194669 ) ( IS-CRATE ?auto_2194663 ) ( not ( = ?auto_2194662 ?auto_2194663 ) ) ( not ( = ?auto_2194667 ?auto_2194662 ) ) ( not ( = ?auto_2194667 ?auto_2194663 ) ) ( not ( = ?auto_2194664 ?auto_2194669 ) ) ( HOIST-AT ?auto_2194665 ?auto_2194664 ) ( not ( = ?auto_2194668 ?auto_2194665 ) ) ( SURFACE-AT ?auto_2194663 ?auto_2194664 ) ( ON ?auto_2194663 ?auto_2194670 ) ( CLEAR ?auto_2194663 ) ( not ( = ?auto_2194662 ?auto_2194670 ) ) ( not ( = ?auto_2194663 ?auto_2194670 ) ) ( not ( = ?auto_2194667 ?auto_2194670 ) ) ( SURFACE-AT ?auto_2194667 ?auto_2194669 ) ( CLEAR ?auto_2194667 ) ( IS-CRATE ?auto_2194662 ) ( AVAILABLE ?auto_2194668 ) ( TRUCK-AT ?auto_2194666 ?auto_2194664 ) ( LIFTING ?auto_2194665 ?auto_2194662 ) )
    :subtasks
    ( ( !LOAD ?auto_2194665 ?auto_2194662 ?auto_2194666 ?auto_2194664 )
      ( MAKE-2CRATE ?auto_2194667 ?auto_2194662 ?auto_2194663 )
      ( MAKE-1CRATE-VERIFY ?auto_2194662 ?auto_2194663 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2194671 - SURFACE
      ?auto_2194672 - SURFACE
      ?auto_2194673 - SURFACE
    )
    :vars
    (
      ?auto_2194674 - HOIST
      ?auto_2194679 - PLACE
      ?auto_2194677 - PLACE
      ?auto_2194675 - HOIST
      ?auto_2194676 - SURFACE
      ?auto_2194678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194674 ?auto_2194679 ) ( IS-CRATE ?auto_2194673 ) ( not ( = ?auto_2194672 ?auto_2194673 ) ) ( not ( = ?auto_2194671 ?auto_2194672 ) ) ( not ( = ?auto_2194671 ?auto_2194673 ) ) ( not ( = ?auto_2194677 ?auto_2194679 ) ) ( HOIST-AT ?auto_2194675 ?auto_2194677 ) ( not ( = ?auto_2194674 ?auto_2194675 ) ) ( SURFACE-AT ?auto_2194673 ?auto_2194677 ) ( ON ?auto_2194673 ?auto_2194676 ) ( CLEAR ?auto_2194673 ) ( not ( = ?auto_2194672 ?auto_2194676 ) ) ( not ( = ?auto_2194673 ?auto_2194676 ) ) ( not ( = ?auto_2194671 ?auto_2194676 ) ) ( SURFACE-AT ?auto_2194671 ?auto_2194679 ) ( CLEAR ?auto_2194671 ) ( IS-CRATE ?auto_2194672 ) ( AVAILABLE ?auto_2194674 ) ( TRUCK-AT ?auto_2194678 ?auto_2194677 ) ( LIFTING ?auto_2194675 ?auto_2194672 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2194672 ?auto_2194673 )
      ( MAKE-2CRATE-VERIFY ?auto_2194671 ?auto_2194672 ?auto_2194673 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2194680 - SURFACE
      ?auto_2194681 - SURFACE
      ?auto_2194682 - SURFACE
      ?auto_2194683 - SURFACE
    )
    :vars
    (
      ?auto_2194688 - HOIST
      ?auto_2194686 - PLACE
      ?auto_2194685 - PLACE
      ?auto_2194684 - HOIST
      ?auto_2194687 - SURFACE
      ?auto_2194689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194688 ?auto_2194686 ) ( IS-CRATE ?auto_2194683 ) ( not ( = ?auto_2194682 ?auto_2194683 ) ) ( not ( = ?auto_2194681 ?auto_2194682 ) ) ( not ( = ?auto_2194681 ?auto_2194683 ) ) ( not ( = ?auto_2194685 ?auto_2194686 ) ) ( HOIST-AT ?auto_2194684 ?auto_2194685 ) ( not ( = ?auto_2194688 ?auto_2194684 ) ) ( SURFACE-AT ?auto_2194683 ?auto_2194685 ) ( ON ?auto_2194683 ?auto_2194687 ) ( CLEAR ?auto_2194683 ) ( not ( = ?auto_2194682 ?auto_2194687 ) ) ( not ( = ?auto_2194683 ?auto_2194687 ) ) ( not ( = ?auto_2194681 ?auto_2194687 ) ) ( SURFACE-AT ?auto_2194681 ?auto_2194686 ) ( CLEAR ?auto_2194681 ) ( IS-CRATE ?auto_2194682 ) ( AVAILABLE ?auto_2194688 ) ( TRUCK-AT ?auto_2194689 ?auto_2194685 ) ( LIFTING ?auto_2194684 ?auto_2194682 ) ( ON ?auto_2194681 ?auto_2194680 ) ( not ( = ?auto_2194680 ?auto_2194681 ) ) ( not ( = ?auto_2194680 ?auto_2194682 ) ) ( not ( = ?auto_2194680 ?auto_2194683 ) ) ( not ( = ?auto_2194680 ?auto_2194687 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194681 ?auto_2194682 ?auto_2194683 )
      ( MAKE-3CRATE-VERIFY ?auto_2194680 ?auto_2194681 ?auto_2194682 ?auto_2194683 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2194690 - SURFACE
      ?auto_2194691 - SURFACE
      ?auto_2194692 - SURFACE
      ?auto_2194694 - SURFACE
      ?auto_2194693 - SURFACE
    )
    :vars
    (
      ?auto_2194699 - HOIST
      ?auto_2194697 - PLACE
      ?auto_2194696 - PLACE
      ?auto_2194695 - HOIST
      ?auto_2194698 - SURFACE
      ?auto_2194700 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194699 ?auto_2194697 ) ( IS-CRATE ?auto_2194693 ) ( not ( = ?auto_2194694 ?auto_2194693 ) ) ( not ( = ?auto_2194692 ?auto_2194694 ) ) ( not ( = ?auto_2194692 ?auto_2194693 ) ) ( not ( = ?auto_2194696 ?auto_2194697 ) ) ( HOIST-AT ?auto_2194695 ?auto_2194696 ) ( not ( = ?auto_2194699 ?auto_2194695 ) ) ( SURFACE-AT ?auto_2194693 ?auto_2194696 ) ( ON ?auto_2194693 ?auto_2194698 ) ( CLEAR ?auto_2194693 ) ( not ( = ?auto_2194694 ?auto_2194698 ) ) ( not ( = ?auto_2194693 ?auto_2194698 ) ) ( not ( = ?auto_2194692 ?auto_2194698 ) ) ( SURFACE-AT ?auto_2194692 ?auto_2194697 ) ( CLEAR ?auto_2194692 ) ( IS-CRATE ?auto_2194694 ) ( AVAILABLE ?auto_2194699 ) ( TRUCK-AT ?auto_2194700 ?auto_2194696 ) ( LIFTING ?auto_2194695 ?auto_2194694 ) ( ON ?auto_2194691 ?auto_2194690 ) ( ON ?auto_2194692 ?auto_2194691 ) ( not ( = ?auto_2194690 ?auto_2194691 ) ) ( not ( = ?auto_2194690 ?auto_2194692 ) ) ( not ( = ?auto_2194690 ?auto_2194694 ) ) ( not ( = ?auto_2194690 ?auto_2194693 ) ) ( not ( = ?auto_2194690 ?auto_2194698 ) ) ( not ( = ?auto_2194691 ?auto_2194692 ) ) ( not ( = ?auto_2194691 ?auto_2194694 ) ) ( not ( = ?auto_2194691 ?auto_2194693 ) ) ( not ( = ?auto_2194691 ?auto_2194698 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194692 ?auto_2194694 ?auto_2194693 )
      ( MAKE-4CRATE-VERIFY ?auto_2194690 ?auto_2194691 ?auto_2194692 ?auto_2194694 ?auto_2194693 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2194701 - SURFACE
      ?auto_2194702 - SURFACE
      ?auto_2194703 - SURFACE
      ?auto_2194705 - SURFACE
      ?auto_2194704 - SURFACE
      ?auto_2194706 - SURFACE
    )
    :vars
    (
      ?auto_2194711 - HOIST
      ?auto_2194709 - PLACE
      ?auto_2194708 - PLACE
      ?auto_2194707 - HOIST
      ?auto_2194710 - SURFACE
      ?auto_2194712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194711 ?auto_2194709 ) ( IS-CRATE ?auto_2194706 ) ( not ( = ?auto_2194704 ?auto_2194706 ) ) ( not ( = ?auto_2194705 ?auto_2194704 ) ) ( not ( = ?auto_2194705 ?auto_2194706 ) ) ( not ( = ?auto_2194708 ?auto_2194709 ) ) ( HOIST-AT ?auto_2194707 ?auto_2194708 ) ( not ( = ?auto_2194711 ?auto_2194707 ) ) ( SURFACE-AT ?auto_2194706 ?auto_2194708 ) ( ON ?auto_2194706 ?auto_2194710 ) ( CLEAR ?auto_2194706 ) ( not ( = ?auto_2194704 ?auto_2194710 ) ) ( not ( = ?auto_2194706 ?auto_2194710 ) ) ( not ( = ?auto_2194705 ?auto_2194710 ) ) ( SURFACE-AT ?auto_2194705 ?auto_2194709 ) ( CLEAR ?auto_2194705 ) ( IS-CRATE ?auto_2194704 ) ( AVAILABLE ?auto_2194711 ) ( TRUCK-AT ?auto_2194712 ?auto_2194708 ) ( LIFTING ?auto_2194707 ?auto_2194704 ) ( ON ?auto_2194702 ?auto_2194701 ) ( ON ?auto_2194703 ?auto_2194702 ) ( ON ?auto_2194705 ?auto_2194703 ) ( not ( = ?auto_2194701 ?auto_2194702 ) ) ( not ( = ?auto_2194701 ?auto_2194703 ) ) ( not ( = ?auto_2194701 ?auto_2194705 ) ) ( not ( = ?auto_2194701 ?auto_2194704 ) ) ( not ( = ?auto_2194701 ?auto_2194706 ) ) ( not ( = ?auto_2194701 ?auto_2194710 ) ) ( not ( = ?auto_2194702 ?auto_2194703 ) ) ( not ( = ?auto_2194702 ?auto_2194705 ) ) ( not ( = ?auto_2194702 ?auto_2194704 ) ) ( not ( = ?auto_2194702 ?auto_2194706 ) ) ( not ( = ?auto_2194702 ?auto_2194710 ) ) ( not ( = ?auto_2194703 ?auto_2194705 ) ) ( not ( = ?auto_2194703 ?auto_2194704 ) ) ( not ( = ?auto_2194703 ?auto_2194706 ) ) ( not ( = ?auto_2194703 ?auto_2194710 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194705 ?auto_2194704 ?auto_2194706 )
      ( MAKE-5CRATE-VERIFY ?auto_2194701 ?auto_2194702 ?auto_2194703 ?auto_2194705 ?auto_2194704 ?auto_2194706 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2194713 - SURFACE
      ?auto_2194714 - SURFACE
      ?auto_2194715 - SURFACE
      ?auto_2194717 - SURFACE
      ?auto_2194716 - SURFACE
      ?auto_2194718 - SURFACE
      ?auto_2194719 - SURFACE
    )
    :vars
    (
      ?auto_2194724 - HOIST
      ?auto_2194722 - PLACE
      ?auto_2194721 - PLACE
      ?auto_2194720 - HOIST
      ?auto_2194723 - SURFACE
      ?auto_2194725 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194724 ?auto_2194722 ) ( IS-CRATE ?auto_2194719 ) ( not ( = ?auto_2194718 ?auto_2194719 ) ) ( not ( = ?auto_2194716 ?auto_2194718 ) ) ( not ( = ?auto_2194716 ?auto_2194719 ) ) ( not ( = ?auto_2194721 ?auto_2194722 ) ) ( HOIST-AT ?auto_2194720 ?auto_2194721 ) ( not ( = ?auto_2194724 ?auto_2194720 ) ) ( SURFACE-AT ?auto_2194719 ?auto_2194721 ) ( ON ?auto_2194719 ?auto_2194723 ) ( CLEAR ?auto_2194719 ) ( not ( = ?auto_2194718 ?auto_2194723 ) ) ( not ( = ?auto_2194719 ?auto_2194723 ) ) ( not ( = ?auto_2194716 ?auto_2194723 ) ) ( SURFACE-AT ?auto_2194716 ?auto_2194722 ) ( CLEAR ?auto_2194716 ) ( IS-CRATE ?auto_2194718 ) ( AVAILABLE ?auto_2194724 ) ( TRUCK-AT ?auto_2194725 ?auto_2194721 ) ( LIFTING ?auto_2194720 ?auto_2194718 ) ( ON ?auto_2194714 ?auto_2194713 ) ( ON ?auto_2194715 ?auto_2194714 ) ( ON ?auto_2194717 ?auto_2194715 ) ( ON ?auto_2194716 ?auto_2194717 ) ( not ( = ?auto_2194713 ?auto_2194714 ) ) ( not ( = ?auto_2194713 ?auto_2194715 ) ) ( not ( = ?auto_2194713 ?auto_2194717 ) ) ( not ( = ?auto_2194713 ?auto_2194716 ) ) ( not ( = ?auto_2194713 ?auto_2194718 ) ) ( not ( = ?auto_2194713 ?auto_2194719 ) ) ( not ( = ?auto_2194713 ?auto_2194723 ) ) ( not ( = ?auto_2194714 ?auto_2194715 ) ) ( not ( = ?auto_2194714 ?auto_2194717 ) ) ( not ( = ?auto_2194714 ?auto_2194716 ) ) ( not ( = ?auto_2194714 ?auto_2194718 ) ) ( not ( = ?auto_2194714 ?auto_2194719 ) ) ( not ( = ?auto_2194714 ?auto_2194723 ) ) ( not ( = ?auto_2194715 ?auto_2194717 ) ) ( not ( = ?auto_2194715 ?auto_2194716 ) ) ( not ( = ?auto_2194715 ?auto_2194718 ) ) ( not ( = ?auto_2194715 ?auto_2194719 ) ) ( not ( = ?auto_2194715 ?auto_2194723 ) ) ( not ( = ?auto_2194717 ?auto_2194716 ) ) ( not ( = ?auto_2194717 ?auto_2194718 ) ) ( not ( = ?auto_2194717 ?auto_2194719 ) ) ( not ( = ?auto_2194717 ?auto_2194723 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194716 ?auto_2194718 ?auto_2194719 )
      ( MAKE-6CRATE-VERIFY ?auto_2194713 ?auto_2194714 ?auto_2194715 ?auto_2194717 ?auto_2194716 ?auto_2194718 ?auto_2194719 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2194726 - SURFACE
      ?auto_2194727 - SURFACE
      ?auto_2194728 - SURFACE
      ?auto_2194730 - SURFACE
      ?auto_2194729 - SURFACE
      ?auto_2194731 - SURFACE
      ?auto_2194732 - SURFACE
      ?auto_2194733 - SURFACE
    )
    :vars
    (
      ?auto_2194738 - HOIST
      ?auto_2194736 - PLACE
      ?auto_2194735 - PLACE
      ?auto_2194734 - HOIST
      ?auto_2194737 - SURFACE
      ?auto_2194739 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194738 ?auto_2194736 ) ( IS-CRATE ?auto_2194733 ) ( not ( = ?auto_2194732 ?auto_2194733 ) ) ( not ( = ?auto_2194731 ?auto_2194732 ) ) ( not ( = ?auto_2194731 ?auto_2194733 ) ) ( not ( = ?auto_2194735 ?auto_2194736 ) ) ( HOIST-AT ?auto_2194734 ?auto_2194735 ) ( not ( = ?auto_2194738 ?auto_2194734 ) ) ( SURFACE-AT ?auto_2194733 ?auto_2194735 ) ( ON ?auto_2194733 ?auto_2194737 ) ( CLEAR ?auto_2194733 ) ( not ( = ?auto_2194732 ?auto_2194737 ) ) ( not ( = ?auto_2194733 ?auto_2194737 ) ) ( not ( = ?auto_2194731 ?auto_2194737 ) ) ( SURFACE-AT ?auto_2194731 ?auto_2194736 ) ( CLEAR ?auto_2194731 ) ( IS-CRATE ?auto_2194732 ) ( AVAILABLE ?auto_2194738 ) ( TRUCK-AT ?auto_2194739 ?auto_2194735 ) ( LIFTING ?auto_2194734 ?auto_2194732 ) ( ON ?auto_2194727 ?auto_2194726 ) ( ON ?auto_2194728 ?auto_2194727 ) ( ON ?auto_2194730 ?auto_2194728 ) ( ON ?auto_2194729 ?auto_2194730 ) ( ON ?auto_2194731 ?auto_2194729 ) ( not ( = ?auto_2194726 ?auto_2194727 ) ) ( not ( = ?auto_2194726 ?auto_2194728 ) ) ( not ( = ?auto_2194726 ?auto_2194730 ) ) ( not ( = ?auto_2194726 ?auto_2194729 ) ) ( not ( = ?auto_2194726 ?auto_2194731 ) ) ( not ( = ?auto_2194726 ?auto_2194732 ) ) ( not ( = ?auto_2194726 ?auto_2194733 ) ) ( not ( = ?auto_2194726 ?auto_2194737 ) ) ( not ( = ?auto_2194727 ?auto_2194728 ) ) ( not ( = ?auto_2194727 ?auto_2194730 ) ) ( not ( = ?auto_2194727 ?auto_2194729 ) ) ( not ( = ?auto_2194727 ?auto_2194731 ) ) ( not ( = ?auto_2194727 ?auto_2194732 ) ) ( not ( = ?auto_2194727 ?auto_2194733 ) ) ( not ( = ?auto_2194727 ?auto_2194737 ) ) ( not ( = ?auto_2194728 ?auto_2194730 ) ) ( not ( = ?auto_2194728 ?auto_2194729 ) ) ( not ( = ?auto_2194728 ?auto_2194731 ) ) ( not ( = ?auto_2194728 ?auto_2194732 ) ) ( not ( = ?auto_2194728 ?auto_2194733 ) ) ( not ( = ?auto_2194728 ?auto_2194737 ) ) ( not ( = ?auto_2194730 ?auto_2194729 ) ) ( not ( = ?auto_2194730 ?auto_2194731 ) ) ( not ( = ?auto_2194730 ?auto_2194732 ) ) ( not ( = ?auto_2194730 ?auto_2194733 ) ) ( not ( = ?auto_2194730 ?auto_2194737 ) ) ( not ( = ?auto_2194729 ?auto_2194731 ) ) ( not ( = ?auto_2194729 ?auto_2194732 ) ) ( not ( = ?auto_2194729 ?auto_2194733 ) ) ( not ( = ?auto_2194729 ?auto_2194737 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194731 ?auto_2194732 ?auto_2194733 )
      ( MAKE-7CRATE-VERIFY ?auto_2194726 ?auto_2194727 ?auto_2194728 ?auto_2194730 ?auto_2194729 ?auto_2194731 ?auto_2194732 ?auto_2194733 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2194740 - SURFACE
      ?auto_2194741 - SURFACE
      ?auto_2194742 - SURFACE
      ?auto_2194744 - SURFACE
      ?auto_2194743 - SURFACE
      ?auto_2194745 - SURFACE
      ?auto_2194746 - SURFACE
      ?auto_2194747 - SURFACE
      ?auto_2194748 - SURFACE
    )
    :vars
    (
      ?auto_2194753 - HOIST
      ?auto_2194751 - PLACE
      ?auto_2194750 - PLACE
      ?auto_2194749 - HOIST
      ?auto_2194752 - SURFACE
      ?auto_2194754 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194753 ?auto_2194751 ) ( IS-CRATE ?auto_2194748 ) ( not ( = ?auto_2194747 ?auto_2194748 ) ) ( not ( = ?auto_2194746 ?auto_2194747 ) ) ( not ( = ?auto_2194746 ?auto_2194748 ) ) ( not ( = ?auto_2194750 ?auto_2194751 ) ) ( HOIST-AT ?auto_2194749 ?auto_2194750 ) ( not ( = ?auto_2194753 ?auto_2194749 ) ) ( SURFACE-AT ?auto_2194748 ?auto_2194750 ) ( ON ?auto_2194748 ?auto_2194752 ) ( CLEAR ?auto_2194748 ) ( not ( = ?auto_2194747 ?auto_2194752 ) ) ( not ( = ?auto_2194748 ?auto_2194752 ) ) ( not ( = ?auto_2194746 ?auto_2194752 ) ) ( SURFACE-AT ?auto_2194746 ?auto_2194751 ) ( CLEAR ?auto_2194746 ) ( IS-CRATE ?auto_2194747 ) ( AVAILABLE ?auto_2194753 ) ( TRUCK-AT ?auto_2194754 ?auto_2194750 ) ( LIFTING ?auto_2194749 ?auto_2194747 ) ( ON ?auto_2194741 ?auto_2194740 ) ( ON ?auto_2194742 ?auto_2194741 ) ( ON ?auto_2194744 ?auto_2194742 ) ( ON ?auto_2194743 ?auto_2194744 ) ( ON ?auto_2194745 ?auto_2194743 ) ( ON ?auto_2194746 ?auto_2194745 ) ( not ( = ?auto_2194740 ?auto_2194741 ) ) ( not ( = ?auto_2194740 ?auto_2194742 ) ) ( not ( = ?auto_2194740 ?auto_2194744 ) ) ( not ( = ?auto_2194740 ?auto_2194743 ) ) ( not ( = ?auto_2194740 ?auto_2194745 ) ) ( not ( = ?auto_2194740 ?auto_2194746 ) ) ( not ( = ?auto_2194740 ?auto_2194747 ) ) ( not ( = ?auto_2194740 ?auto_2194748 ) ) ( not ( = ?auto_2194740 ?auto_2194752 ) ) ( not ( = ?auto_2194741 ?auto_2194742 ) ) ( not ( = ?auto_2194741 ?auto_2194744 ) ) ( not ( = ?auto_2194741 ?auto_2194743 ) ) ( not ( = ?auto_2194741 ?auto_2194745 ) ) ( not ( = ?auto_2194741 ?auto_2194746 ) ) ( not ( = ?auto_2194741 ?auto_2194747 ) ) ( not ( = ?auto_2194741 ?auto_2194748 ) ) ( not ( = ?auto_2194741 ?auto_2194752 ) ) ( not ( = ?auto_2194742 ?auto_2194744 ) ) ( not ( = ?auto_2194742 ?auto_2194743 ) ) ( not ( = ?auto_2194742 ?auto_2194745 ) ) ( not ( = ?auto_2194742 ?auto_2194746 ) ) ( not ( = ?auto_2194742 ?auto_2194747 ) ) ( not ( = ?auto_2194742 ?auto_2194748 ) ) ( not ( = ?auto_2194742 ?auto_2194752 ) ) ( not ( = ?auto_2194744 ?auto_2194743 ) ) ( not ( = ?auto_2194744 ?auto_2194745 ) ) ( not ( = ?auto_2194744 ?auto_2194746 ) ) ( not ( = ?auto_2194744 ?auto_2194747 ) ) ( not ( = ?auto_2194744 ?auto_2194748 ) ) ( not ( = ?auto_2194744 ?auto_2194752 ) ) ( not ( = ?auto_2194743 ?auto_2194745 ) ) ( not ( = ?auto_2194743 ?auto_2194746 ) ) ( not ( = ?auto_2194743 ?auto_2194747 ) ) ( not ( = ?auto_2194743 ?auto_2194748 ) ) ( not ( = ?auto_2194743 ?auto_2194752 ) ) ( not ( = ?auto_2194745 ?auto_2194746 ) ) ( not ( = ?auto_2194745 ?auto_2194747 ) ) ( not ( = ?auto_2194745 ?auto_2194748 ) ) ( not ( = ?auto_2194745 ?auto_2194752 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194746 ?auto_2194747 ?auto_2194748 )
      ( MAKE-8CRATE-VERIFY ?auto_2194740 ?auto_2194741 ?auto_2194742 ?auto_2194744 ?auto_2194743 ?auto_2194745 ?auto_2194746 ?auto_2194747 ?auto_2194748 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2194755 - SURFACE
      ?auto_2194756 - SURFACE
      ?auto_2194757 - SURFACE
      ?auto_2194759 - SURFACE
      ?auto_2194758 - SURFACE
      ?auto_2194760 - SURFACE
      ?auto_2194761 - SURFACE
      ?auto_2194762 - SURFACE
      ?auto_2194763 - SURFACE
      ?auto_2194764 - SURFACE
    )
    :vars
    (
      ?auto_2194769 - HOIST
      ?auto_2194767 - PLACE
      ?auto_2194766 - PLACE
      ?auto_2194765 - HOIST
      ?auto_2194768 - SURFACE
      ?auto_2194770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194769 ?auto_2194767 ) ( IS-CRATE ?auto_2194764 ) ( not ( = ?auto_2194763 ?auto_2194764 ) ) ( not ( = ?auto_2194762 ?auto_2194763 ) ) ( not ( = ?auto_2194762 ?auto_2194764 ) ) ( not ( = ?auto_2194766 ?auto_2194767 ) ) ( HOIST-AT ?auto_2194765 ?auto_2194766 ) ( not ( = ?auto_2194769 ?auto_2194765 ) ) ( SURFACE-AT ?auto_2194764 ?auto_2194766 ) ( ON ?auto_2194764 ?auto_2194768 ) ( CLEAR ?auto_2194764 ) ( not ( = ?auto_2194763 ?auto_2194768 ) ) ( not ( = ?auto_2194764 ?auto_2194768 ) ) ( not ( = ?auto_2194762 ?auto_2194768 ) ) ( SURFACE-AT ?auto_2194762 ?auto_2194767 ) ( CLEAR ?auto_2194762 ) ( IS-CRATE ?auto_2194763 ) ( AVAILABLE ?auto_2194769 ) ( TRUCK-AT ?auto_2194770 ?auto_2194766 ) ( LIFTING ?auto_2194765 ?auto_2194763 ) ( ON ?auto_2194756 ?auto_2194755 ) ( ON ?auto_2194757 ?auto_2194756 ) ( ON ?auto_2194759 ?auto_2194757 ) ( ON ?auto_2194758 ?auto_2194759 ) ( ON ?auto_2194760 ?auto_2194758 ) ( ON ?auto_2194761 ?auto_2194760 ) ( ON ?auto_2194762 ?auto_2194761 ) ( not ( = ?auto_2194755 ?auto_2194756 ) ) ( not ( = ?auto_2194755 ?auto_2194757 ) ) ( not ( = ?auto_2194755 ?auto_2194759 ) ) ( not ( = ?auto_2194755 ?auto_2194758 ) ) ( not ( = ?auto_2194755 ?auto_2194760 ) ) ( not ( = ?auto_2194755 ?auto_2194761 ) ) ( not ( = ?auto_2194755 ?auto_2194762 ) ) ( not ( = ?auto_2194755 ?auto_2194763 ) ) ( not ( = ?auto_2194755 ?auto_2194764 ) ) ( not ( = ?auto_2194755 ?auto_2194768 ) ) ( not ( = ?auto_2194756 ?auto_2194757 ) ) ( not ( = ?auto_2194756 ?auto_2194759 ) ) ( not ( = ?auto_2194756 ?auto_2194758 ) ) ( not ( = ?auto_2194756 ?auto_2194760 ) ) ( not ( = ?auto_2194756 ?auto_2194761 ) ) ( not ( = ?auto_2194756 ?auto_2194762 ) ) ( not ( = ?auto_2194756 ?auto_2194763 ) ) ( not ( = ?auto_2194756 ?auto_2194764 ) ) ( not ( = ?auto_2194756 ?auto_2194768 ) ) ( not ( = ?auto_2194757 ?auto_2194759 ) ) ( not ( = ?auto_2194757 ?auto_2194758 ) ) ( not ( = ?auto_2194757 ?auto_2194760 ) ) ( not ( = ?auto_2194757 ?auto_2194761 ) ) ( not ( = ?auto_2194757 ?auto_2194762 ) ) ( not ( = ?auto_2194757 ?auto_2194763 ) ) ( not ( = ?auto_2194757 ?auto_2194764 ) ) ( not ( = ?auto_2194757 ?auto_2194768 ) ) ( not ( = ?auto_2194759 ?auto_2194758 ) ) ( not ( = ?auto_2194759 ?auto_2194760 ) ) ( not ( = ?auto_2194759 ?auto_2194761 ) ) ( not ( = ?auto_2194759 ?auto_2194762 ) ) ( not ( = ?auto_2194759 ?auto_2194763 ) ) ( not ( = ?auto_2194759 ?auto_2194764 ) ) ( not ( = ?auto_2194759 ?auto_2194768 ) ) ( not ( = ?auto_2194758 ?auto_2194760 ) ) ( not ( = ?auto_2194758 ?auto_2194761 ) ) ( not ( = ?auto_2194758 ?auto_2194762 ) ) ( not ( = ?auto_2194758 ?auto_2194763 ) ) ( not ( = ?auto_2194758 ?auto_2194764 ) ) ( not ( = ?auto_2194758 ?auto_2194768 ) ) ( not ( = ?auto_2194760 ?auto_2194761 ) ) ( not ( = ?auto_2194760 ?auto_2194762 ) ) ( not ( = ?auto_2194760 ?auto_2194763 ) ) ( not ( = ?auto_2194760 ?auto_2194764 ) ) ( not ( = ?auto_2194760 ?auto_2194768 ) ) ( not ( = ?auto_2194761 ?auto_2194762 ) ) ( not ( = ?auto_2194761 ?auto_2194763 ) ) ( not ( = ?auto_2194761 ?auto_2194764 ) ) ( not ( = ?auto_2194761 ?auto_2194768 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194762 ?auto_2194763 ?auto_2194764 )
      ( MAKE-9CRATE-VERIFY ?auto_2194755 ?auto_2194756 ?auto_2194757 ?auto_2194759 ?auto_2194758 ?auto_2194760 ?auto_2194761 ?auto_2194762 ?auto_2194763 ?auto_2194764 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2194771 - SURFACE
      ?auto_2194772 - SURFACE
      ?auto_2194773 - SURFACE
      ?auto_2194775 - SURFACE
      ?auto_2194774 - SURFACE
      ?auto_2194776 - SURFACE
      ?auto_2194777 - SURFACE
      ?auto_2194778 - SURFACE
      ?auto_2194779 - SURFACE
      ?auto_2194780 - SURFACE
      ?auto_2194781 - SURFACE
    )
    :vars
    (
      ?auto_2194786 - HOIST
      ?auto_2194784 - PLACE
      ?auto_2194783 - PLACE
      ?auto_2194782 - HOIST
      ?auto_2194785 - SURFACE
      ?auto_2194787 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194786 ?auto_2194784 ) ( IS-CRATE ?auto_2194781 ) ( not ( = ?auto_2194780 ?auto_2194781 ) ) ( not ( = ?auto_2194779 ?auto_2194780 ) ) ( not ( = ?auto_2194779 ?auto_2194781 ) ) ( not ( = ?auto_2194783 ?auto_2194784 ) ) ( HOIST-AT ?auto_2194782 ?auto_2194783 ) ( not ( = ?auto_2194786 ?auto_2194782 ) ) ( SURFACE-AT ?auto_2194781 ?auto_2194783 ) ( ON ?auto_2194781 ?auto_2194785 ) ( CLEAR ?auto_2194781 ) ( not ( = ?auto_2194780 ?auto_2194785 ) ) ( not ( = ?auto_2194781 ?auto_2194785 ) ) ( not ( = ?auto_2194779 ?auto_2194785 ) ) ( SURFACE-AT ?auto_2194779 ?auto_2194784 ) ( CLEAR ?auto_2194779 ) ( IS-CRATE ?auto_2194780 ) ( AVAILABLE ?auto_2194786 ) ( TRUCK-AT ?auto_2194787 ?auto_2194783 ) ( LIFTING ?auto_2194782 ?auto_2194780 ) ( ON ?auto_2194772 ?auto_2194771 ) ( ON ?auto_2194773 ?auto_2194772 ) ( ON ?auto_2194775 ?auto_2194773 ) ( ON ?auto_2194774 ?auto_2194775 ) ( ON ?auto_2194776 ?auto_2194774 ) ( ON ?auto_2194777 ?auto_2194776 ) ( ON ?auto_2194778 ?auto_2194777 ) ( ON ?auto_2194779 ?auto_2194778 ) ( not ( = ?auto_2194771 ?auto_2194772 ) ) ( not ( = ?auto_2194771 ?auto_2194773 ) ) ( not ( = ?auto_2194771 ?auto_2194775 ) ) ( not ( = ?auto_2194771 ?auto_2194774 ) ) ( not ( = ?auto_2194771 ?auto_2194776 ) ) ( not ( = ?auto_2194771 ?auto_2194777 ) ) ( not ( = ?auto_2194771 ?auto_2194778 ) ) ( not ( = ?auto_2194771 ?auto_2194779 ) ) ( not ( = ?auto_2194771 ?auto_2194780 ) ) ( not ( = ?auto_2194771 ?auto_2194781 ) ) ( not ( = ?auto_2194771 ?auto_2194785 ) ) ( not ( = ?auto_2194772 ?auto_2194773 ) ) ( not ( = ?auto_2194772 ?auto_2194775 ) ) ( not ( = ?auto_2194772 ?auto_2194774 ) ) ( not ( = ?auto_2194772 ?auto_2194776 ) ) ( not ( = ?auto_2194772 ?auto_2194777 ) ) ( not ( = ?auto_2194772 ?auto_2194778 ) ) ( not ( = ?auto_2194772 ?auto_2194779 ) ) ( not ( = ?auto_2194772 ?auto_2194780 ) ) ( not ( = ?auto_2194772 ?auto_2194781 ) ) ( not ( = ?auto_2194772 ?auto_2194785 ) ) ( not ( = ?auto_2194773 ?auto_2194775 ) ) ( not ( = ?auto_2194773 ?auto_2194774 ) ) ( not ( = ?auto_2194773 ?auto_2194776 ) ) ( not ( = ?auto_2194773 ?auto_2194777 ) ) ( not ( = ?auto_2194773 ?auto_2194778 ) ) ( not ( = ?auto_2194773 ?auto_2194779 ) ) ( not ( = ?auto_2194773 ?auto_2194780 ) ) ( not ( = ?auto_2194773 ?auto_2194781 ) ) ( not ( = ?auto_2194773 ?auto_2194785 ) ) ( not ( = ?auto_2194775 ?auto_2194774 ) ) ( not ( = ?auto_2194775 ?auto_2194776 ) ) ( not ( = ?auto_2194775 ?auto_2194777 ) ) ( not ( = ?auto_2194775 ?auto_2194778 ) ) ( not ( = ?auto_2194775 ?auto_2194779 ) ) ( not ( = ?auto_2194775 ?auto_2194780 ) ) ( not ( = ?auto_2194775 ?auto_2194781 ) ) ( not ( = ?auto_2194775 ?auto_2194785 ) ) ( not ( = ?auto_2194774 ?auto_2194776 ) ) ( not ( = ?auto_2194774 ?auto_2194777 ) ) ( not ( = ?auto_2194774 ?auto_2194778 ) ) ( not ( = ?auto_2194774 ?auto_2194779 ) ) ( not ( = ?auto_2194774 ?auto_2194780 ) ) ( not ( = ?auto_2194774 ?auto_2194781 ) ) ( not ( = ?auto_2194774 ?auto_2194785 ) ) ( not ( = ?auto_2194776 ?auto_2194777 ) ) ( not ( = ?auto_2194776 ?auto_2194778 ) ) ( not ( = ?auto_2194776 ?auto_2194779 ) ) ( not ( = ?auto_2194776 ?auto_2194780 ) ) ( not ( = ?auto_2194776 ?auto_2194781 ) ) ( not ( = ?auto_2194776 ?auto_2194785 ) ) ( not ( = ?auto_2194777 ?auto_2194778 ) ) ( not ( = ?auto_2194777 ?auto_2194779 ) ) ( not ( = ?auto_2194777 ?auto_2194780 ) ) ( not ( = ?auto_2194777 ?auto_2194781 ) ) ( not ( = ?auto_2194777 ?auto_2194785 ) ) ( not ( = ?auto_2194778 ?auto_2194779 ) ) ( not ( = ?auto_2194778 ?auto_2194780 ) ) ( not ( = ?auto_2194778 ?auto_2194781 ) ) ( not ( = ?auto_2194778 ?auto_2194785 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194779 ?auto_2194780 ?auto_2194781 )
      ( MAKE-10CRATE-VERIFY ?auto_2194771 ?auto_2194772 ?auto_2194773 ?auto_2194775 ?auto_2194774 ?auto_2194776 ?auto_2194777 ?auto_2194778 ?auto_2194779 ?auto_2194780 ?auto_2194781 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2194788 - SURFACE
      ?auto_2194789 - SURFACE
      ?auto_2194790 - SURFACE
      ?auto_2194792 - SURFACE
      ?auto_2194791 - SURFACE
      ?auto_2194793 - SURFACE
      ?auto_2194794 - SURFACE
      ?auto_2194795 - SURFACE
      ?auto_2194796 - SURFACE
      ?auto_2194797 - SURFACE
      ?auto_2194798 - SURFACE
      ?auto_2194799 - SURFACE
    )
    :vars
    (
      ?auto_2194804 - HOIST
      ?auto_2194802 - PLACE
      ?auto_2194801 - PLACE
      ?auto_2194800 - HOIST
      ?auto_2194803 - SURFACE
      ?auto_2194805 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194804 ?auto_2194802 ) ( IS-CRATE ?auto_2194799 ) ( not ( = ?auto_2194798 ?auto_2194799 ) ) ( not ( = ?auto_2194797 ?auto_2194798 ) ) ( not ( = ?auto_2194797 ?auto_2194799 ) ) ( not ( = ?auto_2194801 ?auto_2194802 ) ) ( HOIST-AT ?auto_2194800 ?auto_2194801 ) ( not ( = ?auto_2194804 ?auto_2194800 ) ) ( SURFACE-AT ?auto_2194799 ?auto_2194801 ) ( ON ?auto_2194799 ?auto_2194803 ) ( CLEAR ?auto_2194799 ) ( not ( = ?auto_2194798 ?auto_2194803 ) ) ( not ( = ?auto_2194799 ?auto_2194803 ) ) ( not ( = ?auto_2194797 ?auto_2194803 ) ) ( SURFACE-AT ?auto_2194797 ?auto_2194802 ) ( CLEAR ?auto_2194797 ) ( IS-CRATE ?auto_2194798 ) ( AVAILABLE ?auto_2194804 ) ( TRUCK-AT ?auto_2194805 ?auto_2194801 ) ( LIFTING ?auto_2194800 ?auto_2194798 ) ( ON ?auto_2194789 ?auto_2194788 ) ( ON ?auto_2194790 ?auto_2194789 ) ( ON ?auto_2194792 ?auto_2194790 ) ( ON ?auto_2194791 ?auto_2194792 ) ( ON ?auto_2194793 ?auto_2194791 ) ( ON ?auto_2194794 ?auto_2194793 ) ( ON ?auto_2194795 ?auto_2194794 ) ( ON ?auto_2194796 ?auto_2194795 ) ( ON ?auto_2194797 ?auto_2194796 ) ( not ( = ?auto_2194788 ?auto_2194789 ) ) ( not ( = ?auto_2194788 ?auto_2194790 ) ) ( not ( = ?auto_2194788 ?auto_2194792 ) ) ( not ( = ?auto_2194788 ?auto_2194791 ) ) ( not ( = ?auto_2194788 ?auto_2194793 ) ) ( not ( = ?auto_2194788 ?auto_2194794 ) ) ( not ( = ?auto_2194788 ?auto_2194795 ) ) ( not ( = ?auto_2194788 ?auto_2194796 ) ) ( not ( = ?auto_2194788 ?auto_2194797 ) ) ( not ( = ?auto_2194788 ?auto_2194798 ) ) ( not ( = ?auto_2194788 ?auto_2194799 ) ) ( not ( = ?auto_2194788 ?auto_2194803 ) ) ( not ( = ?auto_2194789 ?auto_2194790 ) ) ( not ( = ?auto_2194789 ?auto_2194792 ) ) ( not ( = ?auto_2194789 ?auto_2194791 ) ) ( not ( = ?auto_2194789 ?auto_2194793 ) ) ( not ( = ?auto_2194789 ?auto_2194794 ) ) ( not ( = ?auto_2194789 ?auto_2194795 ) ) ( not ( = ?auto_2194789 ?auto_2194796 ) ) ( not ( = ?auto_2194789 ?auto_2194797 ) ) ( not ( = ?auto_2194789 ?auto_2194798 ) ) ( not ( = ?auto_2194789 ?auto_2194799 ) ) ( not ( = ?auto_2194789 ?auto_2194803 ) ) ( not ( = ?auto_2194790 ?auto_2194792 ) ) ( not ( = ?auto_2194790 ?auto_2194791 ) ) ( not ( = ?auto_2194790 ?auto_2194793 ) ) ( not ( = ?auto_2194790 ?auto_2194794 ) ) ( not ( = ?auto_2194790 ?auto_2194795 ) ) ( not ( = ?auto_2194790 ?auto_2194796 ) ) ( not ( = ?auto_2194790 ?auto_2194797 ) ) ( not ( = ?auto_2194790 ?auto_2194798 ) ) ( not ( = ?auto_2194790 ?auto_2194799 ) ) ( not ( = ?auto_2194790 ?auto_2194803 ) ) ( not ( = ?auto_2194792 ?auto_2194791 ) ) ( not ( = ?auto_2194792 ?auto_2194793 ) ) ( not ( = ?auto_2194792 ?auto_2194794 ) ) ( not ( = ?auto_2194792 ?auto_2194795 ) ) ( not ( = ?auto_2194792 ?auto_2194796 ) ) ( not ( = ?auto_2194792 ?auto_2194797 ) ) ( not ( = ?auto_2194792 ?auto_2194798 ) ) ( not ( = ?auto_2194792 ?auto_2194799 ) ) ( not ( = ?auto_2194792 ?auto_2194803 ) ) ( not ( = ?auto_2194791 ?auto_2194793 ) ) ( not ( = ?auto_2194791 ?auto_2194794 ) ) ( not ( = ?auto_2194791 ?auto_2194795 ) ) ( not ( = ?auto_2194791 ?auto_2194796 ) ) ( not ( = ?auto_2194791 ?auto_2194797 ) ) ( not ( = ?auto_2194791 ?auto_2194798 ) ) ( not ( = ?auto_2194791 ?auto_2194799 ) ) ( not ( = ?auto_2194791 ?auto_2194803 ) ) ( not ( = ?auto_2194793 ?auto_2194794 ) ) ( not ( = ?auto_2194793 ?auto_2194795 ) ) ( not ( = ?auto_2194793 ?auto_2194796 ) ) ( not ( = ?auto_2194793 ?auto_2194797 ) ) ( not ( = ?auto_2194793 ?auto_2194798 ) ) ( not ( = ?auto_2194793 ?auto_2194799 ) ) ( not ( = ?auto_2194793 ?auto_2194803 ) ) ( not ( = ?auto_2194794 ?auto_2194795 ) ) ( not ( = ?auto_2194794 ?auto_2194796 ) ) ( not ( = ?auto_2194794 ?auto_2194797 ) ) ( not ( = ?auto_2194794 ?auto_2194798 ) ) ( not ( = ?auto_2194794 ?auto_2194799 ) ) ( not ( = ?auto_2194794 ?auto_2194803 ) ) ( not ( = ?auto_2194795 ?auto_2194796 ) ) ( not ( = ?auto_2194795 ?auto_2194797 ) ) ( not ( = ?auto_2194795 ?auto_2194798 ) ) ( not ( = ?auto_2194795 ?auto_2194799 ) ) ( not ( = ?auto_2194795 ?auto_2194803 ) ) ( not ( = ?auto_2194796 ?auto_2194797 ) ) ( not ( = ?auto_2194796 ?auto_2194798 ) ) ( not ( = ?auto_2194796 ?auto_2194799 ) ) ( not ( = ?auto_2194796 ?auto_2194803 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194797 ?auto_2194798 ?auto_2194799 )
      ( MAKE-11CRATE-VERIFY ?auto_2194788 ?auto_2194789 ?auto_2194790 ?auto_2194792 ?auto_2194791 ?auto_2194793 ?auto_2194794 ?auto_2194795 ?auto_2194796 ?auto_2194797 ?auto_2194798 ?auto_2194799 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2194806 - SURFACE
      ?auto_2194807 - SURFACE
      ?auto_2194808 - SURFACE
      ?auto_2194810 - SURFACE
      ?auto_2194809 - SURFACE
      ?auto_2194811 - SURFACE
      ?auto_2194812 - SURFACE
      ?auto_2194813 - SURFACE
      ?auto_2194814 - SURFACE
      ?auto_2194815 - SURFACE
      ?auto_2194816 - SURFACE
      ?auto_2194817 - SURFACE
      ?auto_2194818 - SURFACE
    )
    :vars
    (
      ?auto_2194823 - HOIST
      ?auto_2194821 - PLACE
      ?auto_2194820 - PLACE
      ?auto_2194819 - HOIST
      ?auto_2194822 - SURFACE
      ?auto_2194824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194823 ?auto_2194821 ) ( IS-CRATE ?auto_2194818 ) ( not ( = ?auto_2194817 ?auto_2194818 ) ) ( not ( = ?auto_2194816 ?auto_2194817 ) ) ( not ( = ?auto_2194816 ?auto_2194818 ) ) ( not ( = ?auto_2194820 ?auto_2194821 ) ) ( HOIST-AT ?auto_2194819 ?auto_2194820 ) ( not ( = ?auto_2194823 ?auto_2194819 ) ) ( SURFACE-AT ?auto_2194818 ?auto_2194820 ) ( ON ?auto_2194818 ?auto_2194822 ) ( CLEAR ?auto_2194818 ) ( not ( = ?auto_2194817 ?auto_2194822 ) ) ( not ( = ?auto_2194818 ?auto_2194822 ) ) ( not ( = ?auto_2194816 ?auto_2194822 ) ) ( SURFACE-AT ?auto_2194816 ?auto_2194821 ) ( CLEAR ?auto_2194816 ) ( IS-CRATE ?auto_2194817 ) ( AVAILABLE ?auto_2194823 ) ( TRUCK-AT ?auto_2194824 ?auto_2194820 ) ( LIFTING ?auto_2194819 ?auto_2194817 ) ( ON ?auto_2194807 ?auto_2194806 ) ( ON ?auto_2194808 ?auto_2194807 ) ( ON ?auto_2194810 ?auto_2194808 ) ( ON ?auto_2194809 ?auto_2194810 ) ( ON ?auto_2194811 ?auto_2194809 ) ( ON ?auto_2194812 ?auto_2194811 ) ( ON ?auto_2194813 ?auto_2194812 ) ( ON ?auto_2194814 ?auto_2194813 ) ( ON ?auto_2194815 ?auto_2194814 ) ( ON ?auto_2194816 ?auto_2194815 ) ( not ( = ?auto_2194806 ?auto_2194807 ) ) ( not ( = ?auto_2194806 ?auto_2194808 ) ) ( not ( = ?auto_2194806 ?auto_2194810 ) ) ( not ( = ?auto_2194806 ?auto_2194809 ) ) ( not ( = ?auto_2194806 ?auto_2194811 ) ) ( not ( = ?auto_2194806 ?auto_2194812 ) ) ( not ( = ?auto_2194806 ?auto_2194813 ) ) ( not ( = ?auto_2194806 ?auto_2194814 ) ) ( not ( = ?auto_2194806 ?auto_2194815 ) ) ( not ( = ?auto_2194806 ?auto_2194816 ) ) ( not ( = ?auto_2194806 ?auto_2194817 ) ) ( not ( = ?auto_2194806 ?auto_2194818 ) ) ( not ( = ?auto_2194806 ?auto_2194822 ) ) ( not ( = ?auto_2194807 ?auto_2194808 ) ) ( not ( = ?auto_2194807 ?auto_2194810 ) ) ( not ( = ?auto_2194807 ?auto_2194809 ) ) ( not ( = ?auto_2194807 ?auto_2194811 ) ) ( not ( = ?auto_2194807 ?auto_2194812 ) ) ( not ( = ?auto_2194807 ?auto_2194813 ) ) ( not ( = ?auto_2194807 ?auto_2194814 ) ) ( not ( = ?auto_2194807 ?auto_2194815 ) ) ( not ( = ?auto_2194807 ?auto_2194816 ) ) ( not ( = ?auto_2194807 ?auto_2194817 ) ) ( not ( = ?auto_2194807 ?auto_2194818 ) ) ( not ( = ?auto_2194807 ?auto_2194822 ) ) ( not ( = ?auto_2194808 ?auto_2194810 ) ) ( not ( = ?auto_2194808 ?auto_2194809 ) ) ( not ( = ?auto_2194808 ?auto_2194811 ) ) ( not ( = ?auto_2194808 ?auto_2194812 ) ) ( not ( = ?auto_2194808 ?auto_2194813 ) ) ( not ( = ?auto_2194808 ?auto_2194814 ) ) ( not ( = ?auto_2194808 ?auto_2194815 ) ) ( not ( = ?auto_2194808 ?auto_2194816 ) ) ( not ( = ?auto_2194808 ?auto_2194817 ) ) ( not ( = ?auto_2194808 ?auto_2194818 ) ) ( not ( = ?auto_2194808 ?auto_2194822 ) ) ( not ( = ?auto_2194810 ?auto_2194809 ) ) ( not ( = ?auto_2194810 ?auto_2194811 ) ) ( not ( = ?auto_2194810 ?auto_2194812 ) ) ( not ( = ?auto_2194810 ?auto_2194813 ) ) ( not ( = ?auto_2194810 ?auto_2194814 ) ) ( not ( = ?auto_2194810 ?auto_2194815 ) ) ( not ( = ?auto_2194810 ?auto_2194816 ) ) ( not ( = ?auto_2194810 ?auto_2194817 ) ) ( not ( = ?auto_2194810 ?auto_2194818 ) ) ( not ( = ?auto_2194810 ?auto_2194822 ) ) ( not ( = ?auto_2194809 ?auto_2194811 ) ) ( not ( = ?auto_2194809 ?auto_2194812 ) ) ( not ( = ?auto_2194809 ?auto_2194813 ) ) ( not ( = ?auto_2194809 ?auto_2194814 ) ) ( not ( = ?auto_2194809 ?auto_2194815 ) ) ( not ( = ?auto_2194809 ?auto_2194816 ) ) ( not ( = ?auto_2194809 ?auto_2194817 ) ) ( not ( = ?auto_2194809 ?auto_2194818 ) ) ( not ( = ?auto_2194809 ?auto_2194822 ) ) ( not ( = ?auto_2194811 ?auto_2194812 ) ) ( not ( = ?auto_2194811 ?auto_2194813 ) ) ( not ( = ?auto_2194811 ?auto_2194814 ) ) ( not ( = ?auto_2194811 ?auto_2194815 ) ) ( not ( = ?auto_2194811 ?auto_2194816 ) ) ( not ( = ?auto_2194811 ?auto_2194817 ) ) ( not ( = ?auto_2194811 ?auto_2194818 ) ) ( not ( = ?auto_2194811 ?auto_2194822 ) ) ( not ( = ?auto_2194812 ?auto_2194813 ) ) ( not ( = ?auto_2194812 ?auto_2194814 ) ) ( not ( = ?auto_2194812 ?auto_2194815 ) ) ( not ( = ?auto_2194812 ?auto_2194816 ) ) ( not ( = ?auto_2194812 ?auto_2194817 ) ) ( not ( = ?auto_2194812 ?auto_2194818 ) ) ( not ( = ?auto_2194812 ?auto_2194822 ) ) ( not ( = ?auto_2194813 ?auto_2194814 ) ) ( not ( = ?auto_2194813 ?auto_2194815 ) ) ( not ( = ?auto_2194813 ?auto_2194816 ) ) ( not ( = ?auto_2194813 ?auto_2194817 ) ) ( not ( = ?auto_2194813 ?auto_2194818 ) ) ( not ( = ?auto_2194813 ?auto_2194822 ) ) ( not ( = ?auto_2194814 ?auto_2194815 ) ) ( not ( = ?auto_2194814 ?auto_2194816 ) ) ( not ( = ?auto_2194814 ?auto_2194817 ) ) ( not ( = ?auto_2194814 ?auto_2194818 ) ) ( not ( = ?auto_2194814 ?auto_2194822 ) ) ( not ( = ?auto_2194815 ?auto_2194816 ) ) ( not ( = ?auto_2194815 ?auto_2194817 ) ) ( not ( = ?auto_2194815 ?auto_2194818 ) ) ( not ( = ?auto_2194815 ?auto_2194822 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194816 ?auto_2194817 ?auto_2194818 )
      ( MAKE-12CRATE-VERIFY ?auto_2194806 ?auto_2194807 ?auto_2194808 ?auto_2194810 ?auto_2194809 ?auto_2194811 ?auto_2194812 ?auto_2194813 ?auto_2194814 ?auto_2194815 ?auto_2194816 ?auto_2194817 ?auto_2194818 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2194825 - SURFACE
      ?auto_2194826 - SURFACE
      ?auto_2194827 - SURFACE
      ?auto_2194829 - SURFACE
      ?auto_2194828 - SURFACE
      ?auto_2194830 - SURFACE
      ?auto_2194831 - SURFACE
      ?auto_2194832 - SURFACE
      ?auto_2194833 - SURFACE
      ?auto_2194834 - SURFACE
      ?auto_2194835 - SURFACE
      ?auto_2194836 - SURFACE
      ?auto_2194837 - SURFACE
      ?auto_2194838 - SURFACE
    )
    :vars
    (
      ?auto_2194843 - HOIST
      ?auto_2194841 - PLACE
      ?auto_2194840 - PLACE
      ?auto_2194839 - HOIST
      ?auto_2194842 - SURFACE
      ?auto_2194844 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194843 ?auto_2194841 ) ( IS-CRATE ?auto_2194838 ) ( not ( = ?auto_2194837 ?auto_2194838 ) ) ( not ( = ?auto_2194836 ?auto_2194837 ) ) ( not ( = ?auto_2194836 ?auto_2194838 ) ) ( not ( = ?auto_2194840 ?auto_2194841 ) ) ( HOIST-AT ?auto_2194839 ?auto_2194840 ) ( not ( = ?auto_2194843 ?auto_2194839 ) ) ( SURFACE-AT ?auto_2194838 ?auto_2194840 ) ( ON ?auto_2194838 ?auto_2194842 ) ( CLEAR ?auto_2194838 ) ( not ( = ?auto_2194837 ?auto_2194842 ) ) ( not ( = ?auto_2194838 ?auto_2194842 ) ) ( not ( = ?auto_2194836 ?auto_2194842 ) ) ( SURFACE-AT ?auto_2194836 ?auto_2194841 ) ( CLEAR ?auto_2194836 ) ( IS-CRATE ?auto_2194837 ) ( AVAILABLE ?auto_2194843 ) ( TRUCK-AT ?auto_2194844 ?auto_2194840 ) ( LIFTING ?auto_2194839 ?auto_2194837 ) ( ON ?auto_2194826 ?auto_2194825 ) ( ON ?auto_2194827 ?auto_2194826 ) ( ON ?auto_2194829 ?auto_2194827 ) ( ON ?auto_2194828 ?auto_2194829 ) ( ON ?auto_2194830 ?auto_2194828 ) ( ON ?auto_2194831 ?auto_2194830 ) ( ON ?auto_2194832 ?auto_2194831 ) ( ON ?auto_2194833 ?auto_2194832 ) ( ON ?auto_2194834 ?auto_2194833 ) ( ON ?auto_2194835 ?auto_2194834 ) ( ON ?auto_2194836 ?auto_2194835 ) ( not ( = ?auto_2194825 ?auto_2194826 ) ) ( not ( = ?auto_2194825 ?auto_2194827 ) ) ( not ( = ?auto_2194825 ?auto_2194829 ) ) ( not ( = ?auto_2194825 ?auto_2194828 ) ) ( not ( = ?auto_2194825 ?auto_2194830 ) ) ( not ( = ?auto_2194825 ?auto_2194831 ) ) ( not ( = ?auto_2194825 ?auto_2194832 ) ) ( not ( = ?auto_2194825 ?auto_2194833 ) ) ( not ( = ?auto_2194825 ?auto_2194834 ) ) ( not ( = ?auto_2194825 ?auto_2194835 ) ) ( not ( = ?auto_2194825 ?auto_2194836 ) ) ( not ( = ?auto_2194825 ?auto_2194837 ) ) ( not ( = ?auto_2194825 ?auto_2194838 ) ) ( not ( = ?auto_2194825 ?auto_2194842 ) ) ( not ( = ?auto_2194826 ?auto_2194827 ) ) ( not ( = ?auto_2194826 ?auto_2194829 ) ) ( not ( = ?auto_2194826 ?auto_2194828 ) ) ( not ( = ?auto_2194826 ?auto_2194830 ) ) ( not ( = ?auto_2194826 ?auto_2194831 ) ) ( not ( = ?auto_2194826 ?auto_2194832 ) ) ( not ( = ?auto_2194826 ?auto_2194833 ) ) ( not ( = ?auto_2194826 ?auto_2194834 ) ) ( not ( = ?auto_2194826 ?auto_2194835 ) ) ( not ( = ?auto_2194826 ?auto_2194836 ) ) ( not ( = ?auto_2194826 ?auto_2194837 ) ) ( not ( = ?auto_2194826 ?auto_2194838 ) ) ( not ( = ?auto_2194826 ?auto_2194842 ) ) ( not ( = ?auto_2194827 ?auto_2194829 ) ) ( not ( = ?auto_2194827 ?auto_2194828 ) ) ( not ( = ?auto_2194827 ?auto_2194830 ) ) ( not ( = ?auto_2194827 ?auto_2194831 ) ) ( not ( = ?auto_2194827 ?auto_2194832 ) ) ( not ( = ?auto_2194827 ?auto_2194833 ) ) ( not ( = ?auto_2194827 ?auto_2194834 ) ) ( not ( = ?auto_2194827 ?auto_2194835 ) ) ( not ( = ?auto_2194827 ?auto_2194836 ) ) ( not ( = ?auto_2194827 ?auto_2194837 ) ) ( not ( = ?auto_2194827 ?auto_2194838 ) ) ( not ( = ?auto_2194827 ?auto_2194842 ) ) ( not ( = ?auto_2194829 ?auto_2194828 ) ) ( not ( = ?auto_2194829 ?auto_2194830 ) ) ( not ( = ?auto_2194829 ?auto_2194831 ) ) ( not ( = ?auto_2194829 ?auto_2194832 ) ) ( not ( = ?auto_2194829 ?auto_2194833 ) ) ( not ( = ?auto_2194829 ?auto_2194834 ) ) ( not ( = ?auto_2194829 ?auto_2194835 ) ) ( not ( = ?auto_2194829 ?auto_2194836 ) ) ( not ( = ?auto_2194829 ?auto_2194837 ) ) ( not ( = ?auto_2194829 ?auto_2194838 ) ) ( not ( = ?auto_2194829 ?auto_2194842 ) ) ( not ( = ?auto_2194828 ?auto_2194830 ) ) ( not ( = ?auto_2194828 ?auto_2194831 ) ) ( not ( = ?auto_2194828 ?auto_2194832 ) ) ( not ( = ?auto_2194828 ?auto_2194833 ) ) ( not ( = ?auto_2194828 ?auto_2194834 ) ) ( not ( = ?auto_2194828 ?auto_2194835 ) ) ( not ( = ?auto_2194828 ?auto_2194836 ) ) ( not ( = ?auto_2194828 ?auto_2194837 ) ) ( not ( = ?auto_2194828 ?auto_2194838 ) ) ( not ( = ?auto_2194828 ?auto_2194842 ) ) ( not ( = ?auto_2194830 ?auto_2194831 ) ) ( not ( = ?auto_2194830 ?auto_2194832 ) ) ( not ( = ?auto_2194830 ?auto_2194833 ) ) ( not ( = ?auto_2194830 ?auto_2194834 ) ) ( not ( = ?auto_2194830 ?auto_2194835 ) ) ( not ( = ?auto_2194830 ?auto_2194836 ) ) ( not ( = ?auto_2194830 ?auto_2194837 ) ) ( not ( = ?auto_2194830 ?auto_2194838 ) ) ( not ( = ?auto_2194830 ?auto_2194842 ) ) ( not ( = ?auto_2194831 ?auto_2194832 ) ) ( not ( = ?auto_2194831 ?auto_2194833 ) ) ( not ( = ?auto_2194831 ?auto_2194834 ) ) ( not ( = ?auto_2194831 ?auto_2194835 ) ) ( not ( = ?auto_2194831 ?auto_2194836 ) ) ( not ( = ?auto_2194831 ?auto_2194837 ) ) ( not ( = ?auto_2194831 ?auto_2194838 ) ) ( not ( = ?auto_2194831 ?auto_2194842 ) ) ( not ( = ?auto_2194832 ?auto_2194833 ) ) ( not ( = ?auto_2194832 ?auto_2194834 ) ) ( not ( = ?auto_2194832 ?auto_2194835 ) ) ( not ( = ?auto_2194832 ?auto_2194836 ) ) ( not ( = ?auto_2194832 ?auto_2194837 ) ) ( not ( = ?auto_2194832 ?auto_2194838 ) ) ( not ( = ?auto_2194832 ?auto_2194842 ) ) ( not ( = ?auto_2194833 ?auto_2194834 ) ) ( not ( = ?auto_2194833 ?auto_2194835 ) ) ( not ( = ?auto_2194833 ?auto_2194836 ) ) ( not ( = ?auto_2194833 ?auto_2194837 ) ) ( not ( = ?auto_2194833 ?auto_2194838 ) ) ( not ( = ?auto_2194833 ?auto_2194842 ) ) ( not ( = ?auto_2194834 ?auto_2194835 ) ) ( not ( = ?auto_2194834 ?auto_2194836 ) ) ( not ( = ?auto_2194834 ?auto_2194837 ) ) ( not ( = ?auto_2194834 ?auto_2194838 ) ) ( not ( = ?auto_2194834 ?auto_2194842 ) ) ( not ( = ?auto_2194835 ?auto_2194836 ) ) ( not ( = ?auto_2194835 ?auto_2194837 ) ) ( not ( = ?auto_2194835 ?auto_2194838 ) ) ( not ( = ?auto_2194835 ?auto_2194842 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194836 ?auto_2194837 ?auto_2194838 )
      ( MAKE-13CRATE-VERIFY ?auto_2194825 ?auto_2194826 ?auto_2194827 ?auto_2194829 ?auto_2194828 ?auto_2194830 ?auto_2194831 ?auto_2194832 ?auto_2194833 ?auto_2194834 ?auto_2194835 ?auto_2194836 ?auto_2194837 ?auto_2194838 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2194845 - SURFACE
      ?auto_2194846 - SURFACE
      ?auto_2194847 - SURFACE
      ?auto_2194849 - SURFACE
      ?auto_2194848 - SURFACE
      ?auto_2194850 - SURFACE
      ?auto_2194851 - SURFACE
      ?auto_2194852 - SURFACE
      ?auto_2194853 - SURFACE
      ?auto_2194854 - SURFACE
      ?auto_2194855 - SURFACE
      ?auto_2194856 - SURFACE
      ?auto_2194857 - SURFACE
      ?auto_2194858 - SURFACE
      ?auto_2194859 - SURFACE
    )
    :vars
    (
      ?auto_2194864 - HOIST
      ?auto_2194862 - PLACE
      ?auto_2194861 - PLACE
      ?auto_2194860 - HOIST
      ?auto_2194863 - SURFACE
      ?auto_2194865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194864 ?auto_2194862 ) ( IS-CRATE ?auto_2194859 ) ( not ( = ?auto_2194858 ?auto_2194859 ) ) ( not ( = ?auto_2194857 ?auto_2194858 ) ) ( not ( = ?auto_2194857 ?auto_2194859 ) ) ( not ( = ?auto_2194861 ?auto_2194862 ) ) ( HOIST-AT ?auto_2194860 ?auto_2194861 ) ( not ( = ?auto_2194864 ?auto_2194860 ) ) ( SURFACE-AT ?auto_2194859 ?auto_2194861 ) ( ON ?auto_2194859 ?auto_2194863 ) ( CLEAR ?auto_2194859 ) ( not ( = ?auto_2194858 ?auto_2194863 ) ) ( not ( = ?auto_2194859 ?auto_2194863 ) ) ( not ( = ?auto_2194857 ?auto_2194863 ) ) ( SURFACE-AT ?auto_2194857 ?auto_2194862 ) ( CLEAR ?auto_2194857 ) ( IS-CRATE ?auto_2194858 ) ( AVAILABLE ?auto_2194864 ) ( TRUCK-AT ?auto_2194865 ?auto_2194861 ) ( LIFTING ?auto_2194860 ?auto_2194858 ) ( ON ?auto_2194846 ?auto_2194845 ) ( ON ?auto_2194847 ?auto_2194846 ) ( ON ?auto_2194849 ?auto_2194847 ) ( ON ?auto_2194848 ?auto_2194849 ) ( ON ?auto_2194850 ?auto_2194848 ) ( ON ?auto_2194851 ?auto_2194850 ) ( ON ?auto_2194852 ?auto_2194851 ) ( ON ?auto_2194853 ?auto_2194852 ) ( ON ?auto_2194854 ?auto_2194853 ) ( ON ?auto_2194855 ?auto_2194854 ) ( ON ?auto_2194856 ?auto_2194855 ) ( ON ?auto_2194857 ?auto_2194856 ) ( not ( = ?auto_2194845 ?auto_2194846 ) ) ( not ( = ?auto_2194845 ?auto_2194847 ) ) ( not ( = ?auto_2194845 ?auto_2194849 ) ) ( not ( = ?auto_2194845 ?auto_2194848 ) ) ( not ( = ?auto_2194845 ?auto_2194850 ) ) ( not ( = ?auto_2194845 ?auto_2194851 ) ) ( not ( = ?auto_2194845 ?auto_2194852 ) ) ( not ( = ?auto_2194845 ?auto_2194853 ) ) ( not ( = ?auto_2194845 ?auto_2194854 ) ) ( not ( = ?auto_2194845 ?auto_2194855 ) ) ( not ( = ?auto_2194845 ?auto_2194856 ) ) ( not ( = ?auto_2194845 ?auto_2194857 ) ) ( not ( = ?auto_2194845 ?auto_2194858 ) ) ( not ( = ?auto_2194845 ?auto_2194859 ) ) ( not ( = ?auto_2194845 ?auto_2194863 ) ) ( not ( = ?auto_2194846 ?auto_2194847 ) ) ( not ( = ?auto_2194846 ?auto_2194849 ) ) ( not ( = ?auto_2194846 ?auto_2194848 ) ) ( not ( = ?auto_2194846 ?auto_2194850 ) ) ( not ( = ?auto_2194846 ?auto_2194851 ) ) ( not ( = ?auto_2194846 ?auto_2194852 ) ) ( not ( = ?auto_2194846 ?auto_2194853 ) ) ( not ( = ?auto_2194846 ?auto_2194854 ) ) ( not ( = ?auto_2194846 ?auto_2194855 ) ) ( not ( = ?auto_2194846 ?auto_2194856 ) ) ( not ( = ?auto_2194846 ?auto_2194857 ) ) ( not ( = ?auto_2194846 ?auto_2194858 ) ) ( not ( = ?auto_2194846 ?auto_2194859 ) ) ( not ( = ?auto_2194846 ?auto_2194863 ) ) ( not ( = ?auto_2194847 ?auto_2194849 ) ) ( not ( = ?auto_2194847 ?auto_2194848 ) ) ( not ( = ?auto_2194847 ?auto_2194850 ) ) ( not ( = ?auto_2194847 ?auto_2194851 ) ) ( not ( = ?auto_2194847 ?auto_2194852 ) ) ( not ( = ?auto_2194847 ?auto_2194853 ) ) ( not ( = ?auto_2194847 ?auto_2194854 ) ) ( not ( = ?auto_2194847 ?auto_2194855 ) ) ( not ( = ?auto_2194847 ?auto_2194856 ) ) ( not ( = ?auto_2194847 ?auto_2194857 ) ) ( not ( = ?auto_2194847 ?auto_2194858 ) ) ( not ( = ?auto_2194847 ?auto_2194859 ) ) ( not ( = ?auto_2194847 ?auto_2194863 ) ) ( not ( = ?auto_2194849 ?auto_2194848 ) ) ( not ( = ?auto_2194849 ?auto_2194850 ) ) ( not ( = ?auto_2194849 ?auto_2194851 ) ) ( not ( = ?auto_2194849 ?auto_2194852 ) ) ( not ( = ?auto_2194849 ?auto_2194853 ) ) ( not ( = ?auto_2194849 ?auto_2194854 ) ) ( not ( = ?auto_2194849 ?auto_2194855 ) ) ( not ( = ?auto_2194849 ?auto_2194856 ) ) ( not ( = ?auto_2194849 ?auto_2194857 ) ) ( not ( = ?auto_2194849 ?auto_2194858 ) ) ( not ( = ?auto_2194849 ?auto_2194859 ) ) ( not ( = ?auto_2194849 ?auto_2194863 ) ) ( not ( = ?auto_2194848 ?auto_2194850 ) ) ( not ( = ?auto_2194848 ?auto_2194851 ) ) ( not ( = ?auto_2194848 ?auto_2194852 ) ) ( not ( = ?auto_2194848 ?auto_2194853 ) ) ( not ( = ?auto_2194848 ?auto_2194854 ) ) ( not ( = ?auto_2194848 ?auto_2194855 ) ) ( not ( = ?auto_2194848 ?auto_2194856 ) ) ( not ( = ?auto_2194848 ?auto_2194857 ) ) ( not ( = ?auto_2194848 ?auto_2194858 ) ) ( not ( = ?auto_2194848 ?auto_2194859 ) ) ( not ( = ?auto_2194848 ?auto_2194863 ) ) ( not ( = ?auto_2194850 ?auto_2194851 ) ) ( not ( = ?auto_2194850 ?auto_2194852 ) ) ( not ( = ?auto_2194850 ?auto_2194853 ) ) ( not ( = ?auto_2194850 ?auto_2194854 ) ) ( not ( = ?auto_2194850 ?auto_2194855 ) ) ( not ( = ?auto_2194850 ?auto_2194856 ) ) ( not ( = ?auto_2194850 ?auto_2194857 ) ) ( not ( = ?auto_2194850 ?auto_2194858 ) ) ( not ( = ?auto_2194850 ?auto_2194859 ) ) ( not ( = ?auto_2194850 ?auto_2194863 ) ) ( not ( = ?auto_2194851 ?auto_2194852 ) ) ( not ( = ?auto_2194851 ?auto_2194853 ) ) ( not ( = ?auto_2194851 ?auto_2194854 ) ) ( not ( = ?auto_2194851 ?auto_2194855 ) ) ( not ( = ?auto_2194851 ?auto_2194856 ) ) ( not ( = ?auto_2194851 ?auto_2194857 ) ) ( not ( = ?auto_2194851 ?auto_2194858 ) ) ( not ( = ?auto_2194851 ?auto_2194859 ) ) ( not ( = ?auto_2194851 ?auto_2194863 ) ) ( not ( = ?auto_2194852 ?auto_2194853 ) ) ( not ( = ?auto_2194852 ?auto_2194854 ) ) ( not ( = ?auto_2194852 ?auto_2194855 ) ) ( not ( = ?auto_2194852 ?auto_2194856 ) ) ( not ( = ?auto_2194852 ?auto_2194857 ) ) ( not ( = ?auto_2194852 ?auto_2194858 ) ) ( not ( = ?auto_2194852 ?auto_2194859 ) ) ( not ( = ?auto_2194852 ?auto_2194863 ) ) ( not ( = ?auto_2194853 ?auto_2194854 ) ) ( not ( = ?auto_2194853 ?auto_2194855 ) ) ( not ( = ?auto_2194853 ?auto_2194856 ) ) ( not ( = ?auto_2194853 ?auto_2194857 ) ) ( not ( = ?auto_2194853 ?auto_2194858 ) ) ( not ( = ?auto_2194853 ?auto_2194859 ) ) ( not ( = ?auto_2194853 ?auto_2194863 ) ) ( not ( = ?auto_2194854 ?auto_2194855 ) ) ( not ( = ?auto_2194854 ?auto_2194856 ) ) ( not ( = ?auto_2194854 ?auto_2194857 ) ) ( not ( = ?auto_2194854 ?auto_2194858 ) ) ( not ( = ?auto_2194854 ?auto_2194859 ) ) ( not ( = ?auto_2194854 ?auto_2194863 ) ) ( not ( = ?auto_2194855 ?auto_2194856 ) ) ( not ( = ?auto_2194855 ?auto_2194857 ) ) ( not ( = ?auto_2194855 ?auto_2194858 ) ) ( not ( = ?auto_2194855 ?auto_2194859 ) ) ( not ( = ?auto_2194855 ?auto_2194863 ) ) ( not ( = ?auto_2194856 ?auto_2194857 ) ) ( not ( = ?auto_2194856 ?auto_2194858 ) ) ( not ( = ?auto_2194856 ?auto_2194859 ) ) ( not ( = ?auto_2194856 ?auto_2194863 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194857 ?auto_2194858 ?auto_2194859 )
      ( MAKE-14CRATE-VERIFY ?auto_2194845 ?auto_2194846 ?auto_2194847 ?auto_2194849 ?auto_2194848 ?auto_2194850 ?auto_2194851 ?auto_2194852 ?auto_2194853 ?auto_2194854 ?auto_2194855 ?auto_2194856 ?auto_2194857 ?auto_2194858 ?auto_2194859 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2194866 - SURFACE
      ?auto_2194867 - SURFACE
    )
    :vars
    (
      ?auto_2194872 - HOIST
      ?auto_2194870 - PLACE
      ?auto_2194874 - SURFACE
      ?auto_2194869 - PLACE
      ?auto_2194868 - HOIST
      ?auto_2194871 - SURFACE
      ?auto_2194873 - TRUCK
      ?auto_2194875 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194872 ?auto_2194870 ) ( IS-CRATE ?auto_2194867 ) ( not ( = ?auto_2194866 ?auto_2194867 ) ) ( not ( = ?auto_2194874 ?auto_2194866 ) ) ( not ( = ?auto_2194874 ?auto_2194867 ) ) ( not ( = ?auto_2194869 ?auto_2194870 ) ) ( HOIST-AT ?auto_2194868 ?auto_2194869 ) ( not ( = ?auto_2194872 ?auto_2194868 ) ) ( SURFACE-AT ?auto_2194867 ?auto_2194869 ) ( ON ?auto_2194867 ?auto_2194871 ) ( CLEAR ?auto_2194867 ) ( not ( = ?auto_2194866 ?auto_2194871 ) ) ( not ( = ?auto_2194867 ?auto_2194871 ) ) ( not ( = ?auto_2194874 ?auto_2194871 ) ) ( SURFACE-AT ?auto_2194874 ?auto_2194870 ) ( CLEAR ?auto_2194874 ) ( IS-CRATE ?auto_2194866 ) ( AVAILABLE ?auto_2194872 ) ( TRUCK-AT ?auto_2194873 ?auto_2194869 ) ( AVAILABLE ?auto_2194868 ) ( SURFACE-AT ?auto_2194866 ?auto_2194869 ) ( ON ?auto_2194866 ?auto_2194875 ) ( CLEAR ?auto_2194866 ) ( not ( = ?auto_2194866 ?auto_2194875 ) ) ( not ( = ?auto_2194867 ?auto_2194875 ) ) ( not ( = ?auto_2194874 ?auto_2194875 ) ) ( not ( = ?auto_2194871 ?auto_2194875 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2194868 ?auto_2194866 ?auto_2194875 ?auto_2194869 )
      ( MAKE-2CRATE ?auto_2194874 ?auto_2194866 ?auto_2194867 )
      ( MAKE-1CRATE-VERIFY ?auto_2194866 ?auto_2194867 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2194876 - SURFACE
      ?auto_2194877 - SURFACE
      ?auto_2194878 - SURFACE
    )
    :vars
    (
      ?auto_2194885 - HOIST
      ?auto_2194881 - PLACE
      ?auto_2194884 - PLACE
      ?auto_2194880 - HOIST
      ?auto_2194883 - SURFACE
      ?auto_2194882 - TRUCK
      ?auto_2194879 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194885 ?auto_2194881 ) ( IS-CRATE ?auto_2194878 ) ( not ( = ?auto_2194877 ?auto_2194878 ) ) ( not ( = ?auto_2194876 ?auto_2194877 ) ) ( not ( = ?auto_2194876 ?auto_2194878 ) ) ( not ( = ?auto_2194884 ?auto_2194881 ) ) ( HOIST-AT ?auto_2194880 ?auto_2194884 ) ( not ( = ?auto_2194885 ?auto_2194880 ) ) ( SURFACE-AT ?auto_2194878 ?auto_2194884 ) ( ON ?auto_2194878 ?auto_2194883 ) ( CLEAR ?auto_2194878 ) ( not ( = ?auto_2194877 ?auto_2194883 ) ) ( not ( = ?auto_2194878 ?auto_2194883 ) ) ( not ( = ?auto_2194876 ?auto_2194883 ) ) ( SURFACE-AT ?auto_2194876 ?auto_2194881 ) ( CLEAR ?auto_2194876 ) ( IS-CRATE ?auto_2194877 ) ( AVAILABLE ?auto_2194885 ) ( TRUCK-AT ?auto_2194882 ?auto_2194884 ) ( AVAILABLE ?auto_2194880 ) ( SURFACE-AT ?auto_2194877 ?auto_2194884 ) ( ON ?auto_2194877 ?auto_2194879 ) ( CLEAR ?auto_2194877 ) ( not ( = ?auto_2194877 ?auto_2194879 ) ) ( not ( = ?auto_2194878 ?auto_2194879 ) ) ( not ( = ?auto_2194876 ?auto_2194879 ) ) ( not ( = ?auto_2194883 ?auto_2194879 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2194877 ?auto_2194878 )
      ( MAKE-2CRATE-VERIFY ?auto_2194876 ?auto_2194877 ?auto_2194878 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2194886 - SURFACE
      ?auto_2194887 - SURFACE
      ?auto_2194888 - SURFACE
      ?auto_2194889 - SURFACE
    )
    :vars
    (
      ?auto_2194895 - HOIST
      ?auto_2194890 - PLACE
      ?auto_2194894 - PLACE
      ?auto_2194892 - HOIST
      ?auto_2194893 - SURFACE
      ?auto_2194896 - TRUCK
      ?auto_2194891 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194895 ?auto_2194890 ) ( IS-CRATE ?auto_2194889 ) ( not ( = ?auto_2194888 ?auto_2194889 ) ) ( not ( = ?auto_2194887 ?auto_2194888 ) ) ( not ( = ?auto_2194887 ?auto_2194889 ) ) ( not ( = ?auto_2194894 ?auto_2194890 ) ) ( HOIST-AT ?auto_2194892 ?auto_2194894 ) ( not ( = ?auto_2194895 ?auto_2194892 ) ) ( SURFACE-AT ?auto_2194889 ?auto_2194894 ) ( ON ?auto_2194889 ?auto_2194893 ) ( CLEAR ?auto_2194889 ) ( not ( = ?auto_2194888 ?auto_2194893 ) ) ( not ( = ?auto_2194889 ?auto_2194893 ) ) ( not ( = ?auto_2194887 ?auto_2194893 ) ) ( SURFACE-AT ?auto_2194887 ?auto_2194890 ) ( CLEAR ?auto_2194887 ) ( IS-CRATE ?auto_2194888 ) ( AVAILABLE ?auto_2194895 ) ( TRUCK-AT ?auto_2194896 ?auto_2194894 ) ( AVAILABLE ?auto_2194892 ) ( SURFACE-AT ?auto_2194888 ?auto_2194894 ) ( ON ?auto_2194888 ?auto_2194891 ) ( CLEAR ?auto_2194888 ) ( not ( = ?auto_2194888 ?auto_2194891 ) ) ( not ( = ?auto_2194889 ?auto_2194891 ) ) ( not ( = ?auto_2194887 ?auto_2194891 ) ) ( not ( = ?auto_2194893 ?auto_2194891 ) ) ( ON ?auto_2194887 ?auto_2194886 ) ( not ( = ?auto_2194886 ?auto_2194887 ) ) ( not ( = ?auto_2194886 ?auto_2194888 ) ) ( not ( = ?auto_2194886 ?auto_2194889 ) ) ( not ( = ?auto_2194886 ?auto_2194893 ) ) ( not ( = ?auto_2194886 ?auto_2194891 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194887 ?auto_2194888 ?auto_2194889 )
      ( MAKE-3CRATE-VERIFY ?auto_2194886 ?auto_2194887 ?auto_2194888 ?auto_2194889 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2194897 - SURFACE
      ?auto_2194898 - SURFACE
      ?auto_2194899 - SURFACE
      ?auto_2194901 - SURFACE
      ?auto_2194900 - SURFACE
    )
    :vars
    (
      ?auto_2194907 - HOIST
      ?auto_2194902 - PLACE
      ?auto_2194906 - PLACE
      ?auto_2194904 - HOIST
      ?auto_2194905 - SURFACE
      ?auto_2194908 - TRUCK
      ?auto_2194903 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194907 ?auto_2194902 ) ( IS-CRATE ?auto_2194900 ) ( not ( = ?auto_2194901 ?auto_2194900 ) ) ( not ( = ?auto_2194899 ?auto_2194901 ) ) ( not ( = ?auto_2194899 ?auto_2194900 ) ) ( not ( = ?auto_2194906 ?auto_2194902 ) ) ( HOIST-AT ?auto_2194904 ?auto_2194906 ) ( not ( = ?auto_2194907 ?auto_2194904 ) ) ( SURFACE-AT ?auto_2194900 ?auto_2194906 ) ( ON ?auto_2194900 ?auto_2194905 ) ( CLEAR ?auto_2194900 ) ( not ( = ?auto_2194901 ?auto_2194905 ) ) ( not ( = ?auto_2194900 ?auto_2194905 ) ) ( not ( = ?auto_2194899 ?auto_2194905 ) ) ( SURFACE-AT ?auto_2194899 ?auto_2194902 ) ( CLEAR ?auto_2194899 ) ( IS-CRATE ?auto_2194901 ) ( AVAILABLE ?auto_2194907 ) ( TRUCK-AT ?auto_2194908 ?auto_2194906 ) ( AVAILABLE ?auto_2194904 ) ( SURFACE-AT ?auto_2194901 ?auto_2194906 ) ( ON ?auto_2194901 ?auto_2194903 ) ( CLEAR ?auto_2194901 ) ( not ( = ?auto_2194901 ?auto_2194903 ) ) ( not ( = ?auto_2194900 ?auto_2194903 ) ) ( not ( = ?auto_2194899 ?auto_2194903 ) ) ( not ( = ?auto_2194905 ?auto_2194903 ) ) ( ON ?auto_2194898 ?auto_2194897 ) ( ON ?auto_2194899 ?auto_2194898 ) ( not ( = ?auto_2194897 ?auto_2194898 ) ) ( not ( = ?auto_2194897 ?auto_2194899 ) ) ( not ( = ?auto_2194897 ?auto_2194901 ) ) ( not ( = ?auto_2194897 ?auto_2194900 ) ) ( not ( = ?auto_2194897 ?auto_2194905 ) ) ( not ( = ?auto_2194897 ?auto_2194903 ) ) ( not ( = ?auto_2194898 ?auto_2194899 ) ) ( not ( = ?auto_2194898 ?auto_2194901 ) ) ( not ( = ?auto_2194898 ?auto_2194900 ) ) ( not ( = ?auto_2194898 ?auto_2194905 ) ) ( not ( = ?auto_2194898 ?auto_2194903 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194899 ?auto_2194901 ?auto_2194900 )
      ( MAKE-4CRATE-VERIFY ?auto_2194897 ?auto_2194898 ?auto_2194899 ?auto_2194901 ?auto_2194900 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2194909 - SURFACE
      ?auto_2194910 - SURFACE
      ?auto_2194911 - SURFACE
      ?auto_2194913 - SURFACE
      ?auto_2194912 - SURFACE
      ?auto_2194914 - SURFACE
    )
    :vars
    (
      ?auto_2194920 - HOIST
      ?auto_2194915 - PLACE
      ?auto_2194919 - PLACE
      ?auto_2194917 - HOIST
      ?auto_2194918 - SURFACE
      ?auto_2194921 - TRUCK
      ?auto_2194916 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194920 ?auto_2194915 ) ( IS-CRATE ?auto_2194914 ) ( not ( = ?auto_2194912 ?auto_2194914 ) ) ( not ( = ?auto_2194913 ?auto_2194912 ) ) ( not ( = ?auto_2194913 ?auto_2194914 ) ) ( not ( = ?auto_2194919 ?auto_2194915 ) ) ( HOIST-AT ?auto_2194917 ?auto_2194919 ) ( not ( = ?auto_2194920 ?auto_2194917 ) ) ( SURFACE-AT ?auto_2194914 ?auto_2194919 ) ( ON ?auto_2194914 ?auto_2194918 ) ( CLEAR ?auto_2194914 ) ( not ( = ?auto_2194912 ?auto_2194918 ) ) ( not ( = ?auto_2194914 ?auto_2194918 ) ) ( not ( = ?auto_2194913 ?auto_2194918 ) ) ( SURFACE-AT ?auto_2194913 ?auto_2194915 ) ( CLEAR ?auto_2194913 ) ( IS-CRATE ?auto_2194912 ) ( AVAILABLE ?auto_2194920 ) ( TRUCK-AT ?auto_2194921 ?auto_2194919 ) ( AVAILABLE ?auto_2194917 ) ( SURFACE-AT ?auto_2194912 ?auto_2194919 ) ( ON ?auto_2194912 ?auto_2194916 ) ( CLEAR ?auto_2194912 ) ( not ( = ?auto_2194912 ?auto_2194916 ) ) ( not ( = ?auto_2194914 ?auto_2194916 ) ) ( not ( = ?auto_2194913 ?auto_2194916 ) ) ( not ( = ?auto_2194918 ?auto_2194916 ) ) ( ON ?auto_2194910 ?auto_2194909 ) ( ON ?auto_2194911 ?auto_2194910 ) ( ON ?auto_2194913 ?auto_2194911 ) ( not ( = ?auto_2194909 ?auto_2194910 ) ) ( not ( = ?auto_2194909 ?auto_2194911 ) ) ( not ( = ?auto_2194909 ?auto_2194913 ) ) ( not ( = ?auto_2194909 ?auto_2194912 ) ) ( not ( = ?auto_2194909 ?auto_2194914 ) ) ( not ( = ?auto_2194909 ?auto_2194918 ) ) ( not ( = ?auto_2194909 ?auto_2194916 ) ) ( not ( = ?auto_2194910 ?auto_2194911 ) ) ( not ( = ?auto_2194910 ?auto_2194913 ) ) ( not ( = ?auto_2194910 ?auto_2194912 ) ) ( not ( = ?auto_2194910 ?auto_2194914 ) ) ( not ( = ?auto_2194910 ?auto_2194918 ) ) ( not ( = ?auto_2194910 ?auto_2194916 ) ) ( not ( = ?auto_2194911 ?auto_2194913 ) ) ( not ( = ?auto_2194911 ?auto_2194912 ) ) ( not ( = ?auto_2194911 ?auto_2194914 ) ) ( not ( = ?auto_2194911 ?auto_2194918 ) ) ( not ( = ?auto_2194911 ?auto_2194916 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194913 ?auto_2194912 ?auto_2194914 )
      ( MAKE-5CRATE-VERIFY ?auto_2194909 ?auto_2194910 ?auto_2194911 ?auto_2194913 ?auto_2194912 ?auto_2194914 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2194922 - SURFACE
      ?auto_2194923 - SURFACE
      ?auto_2194924 - SURFACE
      ?auto_2194926 - SURFACE
      ?auto_2194925 - SURFACE
      ?auto_2194927 - SURFACE
      ?auto_2194928 - SURFACE
    )
    :vars
    (
      ?auto_2194934 - HOIST
      ?auto_2194929 - PLACE
      ?auto_2194933 - PLACE
      ?auto_2194931 - HOIST
      ?auto_2194932 - SURFACE
      ?auto_2194935 - TRUCK
      ?auto_2194930 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194934 ?auto_2194929 ) ( IS-CRATE ?auto_2194928 ) ( not ( = ?auto_2194927 ?auto_2194928 ) ) ( not ( = ?auto_2194925 ?auto_2194927 ) ) ( not ( = ?auto_2194925 ?auto_2194928 ) ) ( not ( = ?auto_2194933 ?auto_2194929 ) ) ( HOIST-AT ?auto_2194931 ?auto_2194933 ) ( not ( = ?auto_2194934 ?auto_2194931 ) ) ( SURFACE-AT ?auto_2194928 ?auto_2194933 ) ( ON ?auto_2194928 ?auto_2194932 ) ( CLEAR ?auto_2194928 ) ( not ( = ?auto_2194927 ?auto_2194932 ) ) ( not ( = ?auto_2194928 ?auto_2194932 ) ) ( not ( = ?auto_2194925 ?auto_2194932 ) ) ( SURFACE-AT ?auto_2194925 ?auto_2194929 ) ( CLEAR ?auto_2194925 ) ( IS-CRATE ?auto_2194927 ) ( AVAILABLE ?auto_2194934 ) ( TRUCK-AT ?auto_2194935 ?auto_2194933 ) ( AVAILABLE ?auto_2194931 ) ( SURFACE-AT ?auto_2194927 ?auto_2194933 ) ( ON ?auto_2194927 ?auto_2194930 ) ( CLEAR ?auto_2194927 ) ( not ( = ?auto_2194927 ?auto_2194930 ) ) ( not ( = ?auto_2194928 ?auto_2194930 ) ) ( not ( = ?auto_2194925 ?auto_2194930 ) ) ( not ( = ?auto_2194932 ?auto_2194930 ) ) ( ON ?auto_2194923 ?auto_2194922 ) ( ON ?auto_2194924 ?auto_2194923 ) ( ON ?auto_2194926 ?auto_2194924 ) ( ON ?auto_2194925 ?auto_2194926 ) ( not ( = ?auto_2194922 ?auto_2194923 ) ) ( not ( = ?auto_2194922 ?auto_2194924 ) ) ( not ( = ?auto_2194922 ?auto_2194926 ) ) ( not ( = ?auto_2194922 ?auto_2194925 ) ) ( not ( = ?auto_2194922 ?auto_2194927 ) ) ( not ( = ?auto_2194922 ?auto_2194928 ) ) ( not ( = ?auto_2194922 ?auto_2194932 ) ) ( not ( = ?auto_2194922 ?auto_2194930 ) ) ( not ( = ?auto_2194923 ?auto_2194924 ) ) ( not ( = ?auto_2194923 ?auto_2194926 ) ) ( not ( = ?auto_2194923 ?auto_2194925 ) ) ( not ( = ?auto_2194923 ?auto_2194927 ) ) ( not ( = ?auto_2194923 ?auto_2194928 ) ) ( not ( = ?auto_2194923 ?auto_2194932 ) ) ( not ( = ?auto_2194923 ?auto_2194930 ) ) ( not ( = ?auto_2194924 ?auto_2194926 ) ) ( not ( = ?auto_2194924 ?auto_2194925 ) ) ( not ( = ?auto_2194924 ?auto_2194927 ) ) ( not ( = ?auto_2194924 ?auto_2194928 ) ) ( not ( = ?auto_2194924 ?auto_2194932 ) ) ( not ( = ?auto_2194924 ?auto_2194930 ) ) ( not ( = ?auto_2194926 ?auto_2194925 ) ) ( not ( = ?auto_2194926 ?auto_2194927 ) ) ( not ( = ?auto_2194926 ?auto_2194928 ) ) ( not ( = ?auto_2194926 ?auto_2194932 ) ) ( not ( = ?auto_2194926 ?auto_2194930 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194925 ?auto_2194927 ?auto_2194928 )
      ( MAKE-6CRATE-VERIFY ?auto_2194922 ?auto_2194923 ?auto_2194924 ?auto_2194926 ?auto_2194925 ?auto_2194927 ?auto_2194928 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2194936 - SURFACE
      ?auto_2194937 - SURFACE
      ?auto_2194938 - SURFACE
      ?auto_2194940 - SURFACE
      ?auto_2194939 - SURFACE
      ?auto_2194941 - SURFACE
      ?auto_2194942 - SURFACE
      ?auto_2194943 - SURFACE
    )
    :vars
    (
      ?auto_2194949 - HOIST
      ?auto_2194944 - PLACE
      ?auto_2194948 - PLACE
      ?auto_2194946 - HOIST
      ?auto_2194947 - SURFACE
      ?auto_2194950 - TRUCK
      ?auto_2194945 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194949 ?auto_2194944 ) ( IS-CRATE ?auto_2194943 ) ( not ( = ?auto_2194942 ?auto_2194943 ) ) ( not ( = ?auto_2194941 ?auto_2194942 ) ) ( not ( = ?auto_2194941 ?auto_2194943 ) ) ( not ( = ?auto_2194948 ?auto_2194944 ) ) ( HOIST-AT ?auto_2194946 ?auto_2194948 ) ( not ( = ?auto_2194949 ?auto_2194946 ) ) ( SURFACE-AT ?auto_2194943 ?auto_2194948 ) ( ON ?auto_2194943 ?auto_2194947 ) ( CLEAR ?auto_2194943 ) ( not ( = ?auto_2194942 ?auto_2194947 ) ) ( not ( = ?auto_2194943 ?auto_2194947 ) ) ( not ( = ?auto_2194941 ?auto_2194947 ) ) ( SURFACE-AT ?auto_2194941 ?auto_2194944 ) ( CLEAR ?auto_2194941 ) ( IS-CRATE ?auto_2194942 ) ( AVAILABLE ?auto_2194949 ) ( TRUCK-AT ?auto_2194950 ?auto_2194948 ) ( AVAILABLE ?auto_2194946 ) ( SURFACE-AT ?auto_2194942 ?auto_2194948 ) ( ON ?auto_2194942 ?auto_2194945 ) ( CLEAR ?auto_2194942 ) ( not ( = ?auto_2194942 ?auto_2194945 ) ) ( not ( = ?auto_2194943 ?auto_2194945 ) ) ( not ( = ?auto_2194941 ?auto_2194945 ) ) ( not ( = ?auto_2194947 ?auto_2194945 ) ) ( ON ?auto_2194937 ?auto_2194936 ) ( ON ?auto_2194938 ?auto_2194937 ) ( ON ?auto_2194940 ?auto_2194938 ) ( ON ?auto_2194939 ?auto_2194940 ) ( ON ?auto_2194941 ?auto_2194939 ) ( not ( = ?auto_2194936 ?auto_2194937 ) ) ( not ( = ?auto_2194936 ?auto_2194938 ) ) ( not ( = ?auto_2194936 ?auto_2194940 ) ) ( not ( = ?auto_2194936 ?auto_2194939 ) ) ( not ( = ?auto_2194936 ?auto_2194941 ) ) ( not ( = ?auto_2194936 ?auto_2194942 ) ) ( not ( = ?auto_2194936 ?auto_2194943 ) ) ( not ( = ?auto_2194936 ?auto_2194947 ) ) ( not ( = ?auto_2194936 ?auto_2194945 ) ) ( not ( = ?auto_2194937 ?auto_2194938 ) ) ( not ( = ?auto_2194937 ?auto_2194940 ) ) ( not ( = ?auto_2194937 ?auto_2194939 ) ) ( not ( = ?auto_2194937 ?auto_2194941 ) ) ( not ( = ?auto_2194937 ?auto_2194942 ) ) ( not ( = ?auto_2194937 ?auto_2194943 ) ) ( not ( = ?auto_2194937 ?auto_2194947 ) ) ( not ( = ?auto_2194937 ?auto_2194945 ) ) ( not ( = ?auto_2194938 ?auto_2194940 ) ) ( not ( = ?auto_2194938 ?auto_2194939 ) ) ( not ( = ?auto_2194938 ?auto_2194941 ) ) ( not ( = ?auto_2194938 ?auto_2194942 ) ) ( not ( = ?auto_2194938 ?auto_2194943 ) ) ( not ( = ?auto_2194938 ?auto_2194947 ) ) ( not ( = ?auto_2194938 ?auto_2194945 ) ) ( not ( = ?auto_2194940 ?auto_2194939 ) ) ( not ( = ?auto_2194940 ?auto_2194941 ) ) ( not ( = ?auto_2194940 ?auto_2194942 ) ) ( not ( = ?auto_2194940 ?auto_2194943 ) ) ( not ( = ?auto_2194940 ?auto_2194947 ) ) ( not ( = ?auto_2194940 ?auto_2194945 ) ) ( not ( = ?auto_2194939 ?auto_2194941 ) ) ( not ( = ?auto_2194939 ?auto_2194942 ) ) ( not ( = ?auto_2194939 ?auto_2194943 ) ) ( not ( = ?auto_2194939 ?auto_2194947 ) ) ( not ( = ?auto_2194939 ?auto_2194945 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194941 ?auto_2194942 ?auto_2194943 )
      ( MAKE-7CRATE-VERIFY ?auto_2194936 ?auto_2194937 ?auto_2194938 ?auto_2194940 ?auto_2194939 ?auto_2194941 ?auto_2194942 ?auto_2194943 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2194951 - SURFACE
      ?auto_2194952 - SURFACE
      ?auto_2194953 - SURFACE
      ?auto_2194955 - SURFACE
      ?auto_2194954 - SURFACE
      ?auto_2194956 - SURFACE
      ?auto_2194957 - SURFACE
      ?auto_2194958 - SURFACE
      ?auto_2194959 - SURFACE
    )
    :vars
    (
      ?auto_2194965 - HOIST
      ?auto_2194960 - PLACE
      ?auto_2194964 - PLACE
      ?auto_2194962 - HOIST
      ?auto_2194963 - SURFACE
      ?auto_2194966 - TRUCK
      ?auto_2194961 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194965 ?auto_2194960 ) ( IS-CRATE ?auto_2194959 ) ( not ( = ?auto_2194958 ?auto_2194959 ) ) ( not ( = ?auto_2194957 ?auto_2194958 ) ) ( not ( = ?auto_2194957 ?auto_2194959 ) ) ( not ( = ?auto_2194964 ?auto_2194960 ) ) ( HOIST-AT ?auto_2194962 ?auto_2194964 ) ( not ( = ?auto_2194965 ?auto_2194962 ) ) ( SURFACE-AT ?auto_2194959 ?auto_2194964 ) ( ON ?auto_2194959 ?auto_2194963 ) ( CLEAR ?auto_2194959 ) ( not ( = ?auto_2194958 ?auto_2194963 ) ) ( not ( = ?auto_2194959 ?auto_2194963 ) ) ( not ( = ?auto_2194957 ?auto_2194963 ) ) ( SURFACE-AT ?auto_2194957 ?auto_2194960 ) ( CLEAR ?auto_2194957 ) ( IS-CRATE ?auto_2194958 ) ( AVAILABLE ?auto_2194965 ) ( TRUCK-AT ?auto_2194966 ?auto_2194964 ) ( AVAILABLE ?auto_2194962 ) ( SURFACE-AT ?auto_2194958 ?auto_2194964 ) ( ON ?auto_2194958 ?auto_2194961 ) ( CLEAR ?auto_2194958 ) ( not ( = ?auto_2194958 ?auto_2194961 ) ) ( not ( = ?auto_2194959 ?auto_2194961 ) ) ( not ( = ?auto_2194957 ?auto_2194961 ) ) ( not ( = ?auto_2194963 ?auto_2194961 ) ) ( ON ?auto_2194952 ?auto_2194951 ) ( ON ?auto_2194953 ?auto_2194952 ) ( ON ?auto_2194955 ?auto_2194953 ) ( ON ?auto_2194954 ?auto_2194955 ) ( ON ?auto_2194956 ?auto_2194954 ) ( ON ?auto_2194957 ?auto_2194956 ) ( not ( = ?auto_2194951 ?auto_2194952 ) ) ( not ( = ?auto_2194951 ?auto_2194953 ) ) ( not ( = ?auto_2194951 ?auto_2194955 ) ) ( not ( = ?auto_2194951 ?auto_2194954 ) ) ( not ( = ?auto_2194951 ?auto_2194956 ) ) ( not ( = ?auto_2194951 ?auto_2194957 ) ) ( not ( = ?auto_2194951 ?auto_2194958 ) ) ( not ( = ?auto_2194951 ?auto_2194959 ) ) ( not ( = ?auto_2194951 ?auto_2194963 ) ) ( not ( = ?auto_2194951 ?auto_2194961 ) ) ( not ( = ?auto_2194952 ?auto_2194953 ) ) ( not ( = ?auto_2194952 ?auto_2194955 ) ) ( not ( = ?auto_2194952 ?auto_2194954 ) ) ( not ( = ?auto_2194952 ?auto_2194956 ) ) ( not ( = ?auto_2194952 ?auto_2194957 ) ) ( not ( = ?auto_2194952 ?auto_2194958 ) ) ( not ( = ?auto_2194952 ?auto_2194959 ) ) ( not ( = ?auto_2194952 ?auto_2194963 ) ) ( not ( = ?auto_2194952 ?auto_2194961 ) ) ( not ( = ?auto_2194953 ?auto_2194955 ) ) ( not ( = ?auto_2194953 ?auto_2194954 ) ) ( not ( = ?auto_2194953 ?auto_2194956 ) ) ( not ( = ?auto_2194953 ?auto_2194957 ) ) ( not ( = ?auto_2194953 ?auto_2194958 ) ) ( not ( = ?auto_2194953 ?auto_2194959 ) ) ( not ( = ?auto_2194953 ?auto_2194963 ) ) ( not ( = ?auto_2194953 ?auto_2194961 ) ) ( not ( = ?auto_2194955 ?auto_2194954 ) ) ( not ( = ?auto_2194955 ?auto_2194956 ) ) ( not ( = ?auto_2194955 ?auto_2194957 ) ) ( not ( = ?auto_2194955 ?auto_2194958 ) ) ( not ( = ?auto_2194955 ?auto_2194959 ) ) ( not ( = ?auto_2194955 ?auto_2194963 ) ) ( not ( = ?auto_2194955 ?auto_2194961 ) ) ( not ( = ?auto_2194954 ?auto_2194956 ) ) ( not ( = ?auto_2194954 ?auto_2194957 ) ) ( not ( = ?auto_2194954 ?auto_2194958 ) ) ( not ( = ?auto_2194954 ?auto_2194959 ) ) ( not ( = ?auto_2194954 ?auto_2194963 ) ) ( not ( = ?auto_2194954 ?auto_2194961 ) ) ( not ( = ?auto_2194956 ?auto_2194957 ) ) ( not ( = ?auto_2194956 ?auto_2194958 ) ) ( not ( = ?auto_2194956 ?auto_2194959 ) ) ( not ( = ?auto_2194956 ?auto_2194963 ) ) ( not ( = ?auto_2194956 ?auto_2194961 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194957 ?auto_2194958 ?auto_2194959 )
      ( MAKE-8CRATE-VERIFY ?auto_2194951 ?auto_2194952 ?auto_2194953 ?auto_2194955 ?auto_2194954 ?auto_2194956 ?auto_2194957 ?auto_2194958 ?auto_2194959 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2194967 - SURFACE
      ?auto_2194968 - SURFACE
      ?auto_2194969 - SURFACE
      ?auto_2194971 - SURFACE
      ?auto_2194970 - SURFACE
      ?auto_2194972 - SURFACE
      ?auto_2194973 - SURFACE
      ?auto_2194974 - SURFACE
      ?auto_2194975 - SURFACE
      ?auto_2194976 - SURFACE
    )
    :vars
    (
      ?auto_2194982 - HOIST
      ?auto_2194977 - PLACE
      ?auto_2194981 - PLACE
      ?auto_2194979 - HOIST
      ?auto_2194980 - SURFACE
      ?auto_2194983 - TRUCK
      ?auto_2194978 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194982 ?auto_2194977 ) ( IS-CRATE ?auto_2194976 ) ( not ( = ?auto_2194975 ?auto_2194976 ) ) ( not ( = ?auto_2194974 ?auto_2194975 ) ) ( not ( = ?auto_2194974 ?auto_2194976 ) ) ( not ( = ?auto_2194981 ?auto_2194977 ) ) ( HOIST-AT ?auto_2194979 ?auto_2194981 ) ( not ( = ?auto_2194982 ?auto_2194979 ) ) ( SURFACE-AT ?auto_2194976 ?auto_2194981 ) ( ON ?auto_2194976 ?auto_2194980 ) ( CLEAR ?auto_2194976 ) ( not ( = ?auto_2194975 ?auto_2194980 ) ) ( not ( = ?auto_2194976 ?auto_2194980 ) ) ( not ( = ?auto_2194974 ?auto_2194980 ) ) ( SURFACE-AT ?auto_2194974 ?auto_2194977 ) ( CLEAR ?auto_2194974 ) ( IS-CRATE ?auto_2194975 ) ( AVAILABLE ?auto_2194982 ) ( TRUCK-AT ?auto_2194983 ?auto_2194981 ) ( AVAILABLE ?auto_2194979 ) ( SURFACE-AT ?auto_2194975 ?auto_2194981 ) ( ON ?auto_2194975 ?auto_2194978 ) ( CLEAR ?auto_2194975 ) ( not ( = ?auto_2194975 ?auto_2194978 ) ) ( not ( = ?auto_2194976 ?auto_2194978 ) ) ( not ( = ?auto_2194974 ?auto_2194978 ) ) ( not ( = ?auto_2194980 ?auto_2194978 ) ) ( ON ?auto_2194968 ?auto_2194967 ) ( ON ?auto_2194969 ?auto_2194968 ) ( ON ?auto_2194971 ?auto_2194969 ) ( ON ?auto_2194970 ?auto_2194971 ) ( ON ?auto_2194972 ?auto_2194970 ) ( ON ?auto_2194973 ?auto_2194972 ) ( ON ?auto_2194974 ?auto_2194973 ) ( not ( = ?auto_2194967 ?auto_2194968 ) ) ( not ( = ?auto_2194967 ?auto_2194969 ) ) ( not ( = ?auto_2194967 ?auto_2194971 ) ) ( not ( = ?auto_2194967 ?auto_2194970 ) ) ( not ( = ?auto_2194967 ?auto_2194972 ) ) ( not ( = ?auto_2194967 ?auto_2194973 ) ) ( not ( = ?auto_2194967 ?auto_2194974 ) ) ( not ( = ?auto_2194967 ?auto_2194975 ) ) ( not ( = ?auto_2194967 ?auto_2194976 ) ) ( not ( = ?auto_2194967 ?auto_2194980 ) ) ( not ( = ?auto_2194967 ?auto_2194978 ) ) ( not ( = ?auto_2194968 ?auto_2194969 ) ) ( not ( = ?auto_2194968 ?auto_2194971 ) ) ( not ( = ?auto_2194968 ?auto_2194970 ) ) ( not ( = ?auto_2194968 ?auto_2194972 ) ) ( not ( = ?auto_2194968 ?auto_2194973 ) ) ( not ( = ?auto_2194968 ?auto_2194974 ) ) ( not ( = ?auto_2194968 ?auto_2194975 ) ) ( not ( = ?auto_2194968 ?auto_2194976 ) ) ( not ( = ?auto_2194968 ?auto_2194980 ) ) ( not ( = ?auto_2194968 ?auto_2194978 ) ) ( not ( = ?auto_2194969 ?auto_2194971 ) ) ( not ( = ?auto_2194969 ?auto_2194970 ) ) ( not ( = ?auto_2194969 ?auto_2194972 ) ) ( not ( = ?auto_2194969 ?auto_2194973 ) ) ( not ( = ?auto_2194969 ?auto_2194974 ) ) ( not ( = ?auto_2194969 ?auto_2194975 ) ) ( not ( = ?auto_2194969 ?auto_2194976 ) ) ( not ( = ?auto_2194969 ?auto_2194980 ) ) ( not ( = ?auto_2194969 ?auto_2194978 ) ) ( not ( = ?auto_2194971 ?auto_2194970 ) ) ( not ( = ?auto_2194971 ?auto_2194972 ) ) ( not ( = ?auto_2194971 ?auto_2194973 ) ) ( not ( = ?auto_2194971 ?auto_2194974 ) ) ( not ( = ?auto_2194971 ?auto_2194975 ) ) ( not ( = ?auto_2194971 ?auto_2194976 ) ) ( not ( = ?auto_2194971 ?auto_2194980 ) ) ( not ( = ?auto_2194971 ?auto_2194978 ) ) ( not ( = ?auto_2194970 ?auto_2194972 ) ) ( not ( = ?auto_2194970 ?auto_2194973 ) ) ( not ( = ?auto_2194970 ?auto_2194974 ) ) ( not ( = ?auto_2194970 ?auto_2194975 ) ) ( not ( = ?auto_2194970 ?auto_2194976 ) ) ( not ( = ?auto_2194970 ?auto_2194980 ) ) ( not ( = ?auto_2194970 ?auto_2194978 ) ) ( not ( = ?auto_2194972 ?auto_2194973 ) ) ( not ( = ?auto_2194972 ?auto_2194974 ) ) ( not ( = ?auto_2194972 ?auto_2194975 ) ) ( not ( = ?auto_2194972 ?auto_2194976 ) ) ( not ( = ?auto_2194972 ?auto_2194980 ) ) ( not ( = ?auto_2194972 ?auto_2194978 ) ) ( not ( = ?auto_2194973 ?auto_2194974 ) ) ( not ( = ?auto_2194973 ?auto_2194975 ) ) ( not ( = ?auto_2194973 ?auto_2194976 ) ) ( not ( = ?auto_2194973 ?auto_2194980 ) ) ( not ( = ?auto_2194973 ?auto_2194978 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194974 ?auto_2194975 ?auto_2194976 )
      ( MAKE-9CRATE-VERIFY ?auto_2194967 ?auto_2194968 ?auto_2194969 ?auto_2194971 ?auto_2194970 ?auto_2194972 ?auto_2194973 ?auto_2194974 ?auto_2194975 ?auto_2194976 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2194984 - SURFACE
      ?auto_2194985 - SURFACE
      ?auto_2194986 - SURFACE
      ?auto_2194988 - SURFACE
      ?auto_2194987 - SURFACE
      ?auto_2194989 - SURFACE
      ?auto_2194990 - SURFACE
      ?auto_2194991 - SURFACE
      ?auto_2194992 - SURFACE
      ?auto_2194993 - SURFACE
      ?auto_2194994 - SURFACE
    )
    :vars
    (
      ?auto_2195000 - HOIST
      ?auto_2194995 - PLACE
      ?auto_2194999 - PLACE
      ?auto_2194997 - HOIST
      ?auto_2194998 - SURFACE
      ?auto_2195001 - TRUCK
      ?auto_2194996 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195000 ?auto_2194995 ) ( IS-CRATE ?auto_2194994 ) ( not ( = ?auto_2194993 ?auto_2194994 ) ) ( not ( = ?auto_2194992 ?auto_2194993 ) ) ( not ( = ?auto_2194992 ?auto_2194994 ) ) ( not ( = ?auto_2194999 ?auto_2194995 ) ) ( HOIST-AT ?auto_2194997 ?auto_2194999 ) ( not ( = ?auto_2195000 ?auto_2194997 ) ) ( SURFACE-AT ?auto_2194994 ?auto_2194999 ) ( ON ?auto_2194994 ?auto_2194998 ) ( CLEAR ?auto_2194994 ) ( not ( = ?auto_2194993 ?auto_2194998 ) ) ( not ( = ?auto_2194994 ?auto_2194998 ) ) ( not ( = ?auto_2194992 ?auto_2194998 ) ) ( SURFACE-AT ?auto_2194992 ?auto_2194995 ) ( CLEAR ?auto_2194992 ) ( IS-CRATE ?auto_2194993 ) ( AVAILABLE ?auto_2195000 ) ( TRUCK-AT ?auto_2195001 ?auto_2194999 ) ( AVAILABLE ?auto_2194997 ) ( SURFACE-AT ?auto_2194993 ?auto_2194999 ) ( ON ?auto_2194993 ?auto_2194996 ) ( CLEAR ?auto_2194993 ) ( not ( = ?auto_2194993 ?auto_2194996 ) ) ( not ( = ?auto_2194994 ?auto_2194996 ) ) ( not ( = ?auto_2194992 ?auto_2194996 ) ) ( not ( = ?auto_2194998 ?auto_2194996 ) ) ( ON ?auto_2194985 ?auto_2194984 ) ( ON ?auto_2194986 ?auto_2194985 ) ( ON ?auto_2194988 ?auto_2194986 ) ( ON ?auto_2194987 ?auto_2194988 ) ( ON ?auto_2194989 ?auto_2194987 ) ( ON ?auto_2194990 ?auto_2194989 ) ( ON ?auto_2194991 ?auto_2194990 ) ( ON ?auto_2194992 ?auto_2194991 ) ( not ( = ?auto_2194984 ?auto_2194985 ) ) ( not ( = ?auto_2194984 ?auto_2194986 ) ) ( not ( = ?auto_2194984 ?auto_2194988 ) ) ( not ( = ?auto_2194984 ?auto_2194987 ) ) ( not ( = ?auto_2194984 ?auto_2194989 ) ) ( not ( = ?auto_2194984 ?auto_2194990 ) ) ( not ( = ?auto_2194984 ?auto_2194991 ) ) ( not ( = ?auto_2194984 ?auto_2194992 ) ) ( not ( = ?auto_2194984 ?auto_2194993 ) ) ( not ( = ?auto_2194984 ?auto_2194994 ) ) ( not ( = ?auto_2194984 ?auto_2194998 ) ) ( not ( = ?auto_2194984 ?auto_2194996 ) ) ( not ( = ?auto_2194985 ?auto_2194986 ) ) ( not ( = ?auto_2194985 ?auto_2194988 ) ) ( not ( = ?auto_2194985 ?auto_2194987 ) ) ( not ( = ?auto_2194985 ?auto_2194989 ) ) ( not ( = ?auto_2194985 ?auto_2194990 ) ) ( not ( = ?auto_2194985 ?auto_2194991 ) ) ( not ( = ?auto_2194985 ?auto_2194992 ) ) ( not ( = ?auto_2194985 ?auto_2194993 ) ) ( not ( = ?auto_2194985 ?auto_2194994 ) ) ( not ( = ?auto_2194985 ?auto_2194998 ) ) ( not ( = ?auto_2194985 ?auto_2194996 ) ) ( not ( = ?auto_2194986 ?auto_2194988 ) ) ( not ( = ?auto_2194986 ?auto_2194987 ) ) ( not ( = ?auto_2194986 ?auto_2194989 ) ) ( not ( = ?auto_2194986 ?auto_2194990 ) ) ( not ( = ?auto_2194986 ?auto_2194991 ) ) ( not ( = ?auto_2194986 ?auto_2194992 ) ) ( not ( = ?auto_2194986 ?auto_2194993 ) ) ( not ( = ?auto_2194986 ?auto_2194994 ) ) ( not ( = ?auto_2194986 ?auto_2194998 ) ) ( not ( = ?auto_2194986 ?auto_2194996 ) ) ( not ( = ?auto_2194988 ?auto_2194987 ) ) ( not ( = ?auto_2194988 ?auto_2194989 ) ) ( not ( = ?auto_2194988 ?auto_2194990 ) ) ( not ( = ?auto_2194988 ?auto_2194991 ) ) ( not ( = ?auto_2194988 ?auto_2194992 ) ) ( not ( = ?auto_2194988 ?auto_2194993 ) ) ( not ( = ?auto_2194988 ?auto_2194994 ) ) ( not ( = ?auto_2194988 ?auto_2194998 ) ) ( not ( = ?auto_2194988 ?auto_2194996 ) ) ( not ( = ?auto_2194987 ?auto_2194989 ) ) ( not ( = ?auto_2194987 ?auto_2194990 ) ) ( not ( = ?auto_2194987 ?auto_2194991 ) ) ( not ( = ?auto_2194987 ?auto_2194992 ) ) ( not ( = ?auto_2194987 ?auto_2194993 ) ) ( not ( = ?auto_2194987 ?auto_2194994 ) ) ( not ( = ?auto_2194987 ?auto_2194998 ) ) ( not ( = ?auto_2194987 ?auto_2194996 ) ) ( not ( = ?auto_2194989 ?auto_2194990 ) ) ( not ( = ?auto_2194989 ?auto_2194991 ) ) ( not ( = ?auto_2194989 ?auto_2194992 ) ) ( not ( = ?auto_2194989 ?auto_2194993 ) ) ( not ( = ?auto_2194989 ?auto_2194994 ) ) ( not ( = ?auto_2194989 ?auto_2194998 ) ) ( not ( = ?auto_2194989 ?auto_2194996 ) ) ( not ( = ?auto_2194990 ?auto_2194991 ) ) ( not ( = ?auto_2194990 ?auto_2194992 ) ) ( not ( = ?auto_2194990 ?auto_2194993 ) ) ( not ( = ?auto_2194990 ?auto_2194994 ) ) ( not ( = ?auto_2194990 ?auto_2194998 ) ) ( not ( = ?auto_2194990 ?auto_2194996 ) ) ( not ( = ?auto_2194991 ?auto_2194992 ) ) ( not ( = ?auto_2194991 ?auto_2194993 ) ) ( not ( = ?auto_2194991 ?auto_2194994 ) ) ( not ( = ?auto_2194991 ?auto_2194998 ) ) ( not ( = ?auto_2194991 ?auto_2194996 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194992 ?auto_2194993 ?auto_2194994 )
      ( MAKE-10CRATE-VERIFY ?auto_2194984 ?auto_2194985 ?auto_2194986 ?auto_2194988 ?auto_2194987 ?auto_2194989 ?auto_2194990 ?auto_2194991 ?auto_2194992 ?auto_2194993 ?auto_2194994 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2195002 - SURFACE
      ?auto_2195003 - SURFACE
      ?auto_2195004 - SURFACE
      ?auto_2195006 - SURFACE
      ?auto_2195005 - SURFACE
      ?auto_2195007 - SURFACE
      ?auto_2195008 - SURFACE
      ?auto_2195009 - SURFACE
      ?auto_2195010 - SURFACE
      ?auto_2195011 - SURFACE
      ?auto_2195012 - SURFACE
      ?auto_2195013 - SURFACE
    )
    :vars
    (
      ?auto_2195019 - HOIST
      ?auto_2195014 - PLACE
      ?auto_2195018 - PLACE
      ?auto_2195016 - HOIST
      ?auto_2195017 - SURFACE
      ?auto_2195020 - TRUCK
      ?auto_2195015 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195019 ?auto_2195014 ) ( IS-CRATE ?auto_2195013 ) ( not ( = ?auto_2195012 ?auto_2195013 ) ) ( not ( = ?auto_2195011 ?auto_2195012 ) ) ( not ( = ?auto_2195011 ?auto_2195013 ) ) ( not ( = ?auto_2195018 ?auto_2195014 ) ) ( HOIST-AT ?auto_2195016 ?auto_2195018 ) ( not ( = ?auto_2195019 ?auto_2195016 ) ) ( SURFACE-AT ?auto_2195013 ?auto_2195018 ) ( ON ?auto_2195013 ?auto_2195017 ) ( CLEAR ?auto_2195013 ) ( not ( = ?auto_2195012 ?auto_2195017 ) ) ( not ( = ?auto_2195013 ?auto_2195017 ) ) ( not ( = ?auto_2195011 ?auto_2195017 ) ) ( SURFACE-AT ?auto_2195011 ?auto_2195014 ) ( CLEAR ?auto_2195011 ) ( IS-CRATE ?auto_2195012 ) ( AVAILABLE ?auto_2195019 ) ( TRUCK-AT ?auto_2195020 ?auto_2195018 ) ( AVAILABLE ?auto_2195016 ) ( SURFACE-AT ?auto_2195012 ?auto_2195018 ) ( ON ?auto_2195012 ?auto_2195015 ) ( CLEAR ?auto_2195012 ) ( not ( = ?auto_2195012 ?auto_2195015 ) ) ( not ( = ?auto_2195013 ?auto_2195015 ) ) ( not ( = ?auto_2195011 ?auto_2195015 ) ) ( not ( = ?auto_2195017 ?auto_2195015 ) ) ( ON ?auto_2195003 ?auto_2195002 ) ( ON ?auto_2195004 ?auto_2195003 ) ( ON ?auto_2195006 ?auto_2195004 ) ( ON ?auto_2195005 ?auto_2195006 ) ( ON ?auto_2195007 ?auto_2195005 ) ( ON ?auto_2195008 ?auto_2195007 ) ( ON ?auto_2195009 ?auto_2195008 ) ( ON ?auto_2195010 ?auto_2195009 ) ( ON ?auto_2195011 ?auto_2195010 ) ( not ( = ?auto_2195002 ?auto_2195003 ) ) ( not ( = ?auto_2195002 ?auto_2195004 ) ) ( not ( = ?auto_2195002 ?auto_2195006 ) ) ( not ( = ?auto_2195002 ?auto_2195005 ) ) ( not ( = ?auto_2195002 ?auto_2195007 ) ) ( not ( = ?auto_2195002 ?auto_2195008 ) ) ( not ( = ?auto_2195002 ?auto_2195009 ) ) ( not ( = ?auto_2195002 ?auto_2195010 ) ) ( not ( = ?auto_2195002 ?auto_2195011 ) ) ( not ( = ?auto_2195002 ?auto_2195012 ) ) ( not ( = ?auto_2195002 ?auto_2195013 ) ) ( not ( = ?auto_2195002 ?auto_2195017 ) ) ( not ( = ?auto_2195002 ?auto_2195015 ) ) ( not ( = ?auto_2195003 ?auto_2195004 ) ) ( not ( = ?auto_2195003 ?auto_2195006 ) ) ( not ( = ?auto_2195003 ?auto_2195005 ) ) ( not ( = ?auto_2195003 ?auto_2195007 ) ) ( not ( = ?auto_2195003 ?auto_2195008 ) ) ( not ( = ?auto_2195003 ?auto_2195009 ) ) ( not ( = ?auto_2195003 ?auto_2195010 ) ) ( not ( = ?auto_2195003 ?auto_2195011 ) ) ( not ( = ?auto_2195003 ?auto_2195012 ) ) ( not ( = ?auto_2195003 ?auto_2195013 ) ) ( not ( = ?auto_2195003 ?auto_2195017 ) ) ( not ( = ?auto_2195003 ?auto_2195015 ) ) ( not ( = ?auto_2195004 ?auto_2195006 ) ) ( not ( = ?auto_2195004 ?auto_2195005 ) ) ( not ( = ?auto_2195004 ?auto_2195007 ) ) ( not ( = ?auto_2195004 ?auto_2195008 ) ) ( not ( = ?auto_2195004 ?auto_2195009 ) ) ( not ( = ?auto_2195004 ?auto_2195010 ) ) ( not ( = ?auto_2195004 ?auto_2195011 ) ) ( not ( = ?auto_2195004 ?auto_2195012 ) ) ( not ( = ?auto_2195004 ?auto_2195013 ) ) ( not ( = ?auto_2195004 ?auto_2195017 ) ) ( not ( = ?auto_2195004 ?auto_2195015 ) ) ( not ( = ?auto_2195006 ?auto_2195005 ) ) ( not ( = ?auto_2195006 ?auto_2195007 ) ) ( not ( = ?auto_2195006 ?auto_2195008 ) ) ( not ( = ?auto_2195006 ?auto_2195009 ) ) ( not ( = ?auto_2195006 ?auto_2195010 ) ) ( not ( = ?auto_2195006 ?auto_2195011 ) ) ( not ( = ?auto_2195006 ?auto_2195012 ) ) ( not ( = ?auto_2195006 ?auto_2195013 ) ) ( not ( = ?auto_2195006 ?auto_2195017 ) ) ( not ( = ?auto_2195006 ?auto_2195015 ) ) ( not ( = ?auto_2195005 ?auto_2195007 ) ) ( not ( = ?auto_2195005 ?auto_2195008 ) ) ( not ( = ?auto_2195005 ?auto_2195009 ) ) ( not ( = ?auto_2195005 ?auto_2195010 ) ) ( not ( = ?auto_2195005 ?auto_2195011 ) ) ( not ( = ?auto_2195005 ?auto_2195012 ) ) ( not ( = ?auto_2195005 ?auto_2195013 ) ) ( not ( = ?auto_2195005 ?auto_2195017 ) ) ( not ( = ?auto_2195005 ?auto_2195015 ) ) ( not ( = ?auto_2195007 ?auto_2195008 ) ) ( not ( = ?auto_2195007 ?auto_2195009 ) ) ( not ( = ?auto_2195007 ?auto_2195010 ) ) ( not ( = ?auto_2195007 ?auto_2195011 ) ) ( not ( = ?auto_2195007 ?auto_2195012 ) ) ( not ( = ?auto_2195007 ?auto_2195013 ) ) ( not ( = ?auto_2195007 ?auto_2195017 ) ) ( not ( = ?auto_2195007 ?auto_2195015 ) ) ( not ( = ?auto_2195008 ?auto_2195009 ) ) ( not ( = ?auto_2195008 ?auto_2195010 ) ) ( not ( = ?auto_2195008 ?auto_2195011 ) ) ( not ( = ?auto_2195008 ?auto_2195012 ) ) ( not ( = ?auto_2195008 ?auto_2195013 ) ) ( not ( = ?auto_2195008 ?auto_2195017 ) ) ( not ( = ?auto_2195008 ?auto_2195015 ) ) ( not ( = ?auto_2195009 ?auto_2195010 ) ) ( not ( = ?auto_2195009 ?auto_2195011 ) ) ( not ( = ?auto_2195009 ?auto_2195012 ) ) ( not ( = ?auto_2195009 ?auto_2195013 ) ) ( not ( = ?auto_2195009 ?auto_2195017 ) ) ( not ( = ?auto_2195009 ?auto_2195015 ) ) ( not ( = ?auto_2195010 ?auto_2195011 ) ) ( not ( = ?auto_2195010 ?auto_2195012 ) ) ( not ( = ?auto_2195010 ?auto_2195013 ) ) ( not ( = ?auto_2195010 ?auto_2195017 ) ) ( not ( = ?auto_2195010 ?auto_2195015 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195011 ?auto_2195012 ?auto_2195013 )
      ( MAKE-11CRATE-VERIFY ?auto_2195002 ?auto_2195003 ?auto_2195004 ?auto_2195006 ?auto_2195005 ?auto_2195007 ?auto_2195008 ?auto_2195009 ?auto_2195010 ?auto_2195011 ?auto_2195012 ?auto_2195013 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2195021 - SURFACE
      ?auto_2195022 - SURFACE
      ?auto_2195023 - SURFACE
      ?auto_2195025 - SURFACE
      ?auto_2195024 - SURFACE
      ?auto_2195026 - SURFACE
      ?auto_2195027 - SURFACE
      ?auto_2195028 - SURFACE
      ?auto_2195029 - SURFACE
      ?auto_2195030 - SURFACE
      ?auto_2195031 - SURFACE
      ?auto_2195032 - SURFACE
      ?auto_2195033 - SURFACE
    )
    :vars
    (
      ?auto_2195039 - HOIST
      ?auto_2195034 - PLACE
      ?auto_2195038 - PLACE
      ?auto_2195036 - HOIST
      ?auto_2195037 - SURFACE
      ?auto_2195040 - TRUCK
      ?auto_2195035 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195039 ?auto_2195034 ) ( IS-CRATE ?auto_2195033 ) ( not ( = ?auto_2195032 ?auto_2195033 ) ) ( not ( = ?auto_2195031 ?auto_2195032 ) ) ( not ( = ?auto_2195031 ?auto_2195033 ) ) ( not ( = ?auto_2195038 ?auto_2195034 ) ) ( HOIST-AT ?auto_2195036 ?auto_2195038 ) ( not ( = ?auto_2195039 ?auto_2195036 ) ) ( SURFACE-AT ?auto_2195033 ?auto_2195038 ) ( ON ?auto_2195033 ?auto_2195037 ) ( CLEAR ?auto_2195033 ) ( not ( = ?auto_2195032 ?auto_2195037 ) ) ( not ( = ?auto_2195033 ?auto_2195037 ) ) ( not ( = ?auto_2195031 ?auto_2195037 ) ) ( SURFACE-AT ?auto_2195031 ?auto_2195034 ) ( CLEAR ?auto_2195031 ) ( IS-CRATE ?auto_2195032 ) ( AVAILABLE ?auto_2195039 ) ( TRUCK-AT ?auto_2195040 ?auto_2195038 ) ( AVAILABLE ?auto_2195036 ) ( SURFACE-AT ?auto_2195032 ?auto_2195038 ) ( ON ?auto_2195032 ?auto_2195035 ) ( CLEAR ?auto_2195032 ) ( not ( = ?auto_2195032 ?auto_2195035 ) ) ( not ( = ?auto_2195033 ?auto_2195035 ) ) ( not ( = ?auto_2195031 ?auto_2195035 ) ) ( not ( = ?auto_2195037 ?auto_2195035 ) ) ( ON ?auto_2195022 ?auto_2195021 ) ( ON ?auto_2195023 ?auto_2195022 ) ( ON ?auto_2195025 ?auto_2195023 ) ( ON ?auto_2195024 ?auto_2195025 ) ( ON ?auto_2195026 ?auto_2195024 ) ( ON ?auto_2195027 ?auto_2195026 ) ( ON ?auto_2195028 ?auto_2195027 ) ( ON ?auto_2195029 ?auto_2195028 ) ( ON ?auto_2195030 ?auto_2195029 ) ( ON ?auto_2195031 ?auto_2195030 ) ( not ( = ?auto_2195021 ?auto_2195022 ) ) ( not ( = ?auto_2195021 ?auto_2195023 ) ) ( not ( = ?auto_2195021 ?auto_2195025 ) ) ( not ( = ?auto_2195021 ?auto_2195024 ) ) ( not ( = ?auto_2195021 ?auto_2195026 ) ) ( not ( = ?auto_2195021 ?auto_2195027 ) ) ( not ( = ?auto_2195021 ?auto_2195028 ) ) ( not ( = ?auto_2195021 ?auto_2195029 ) ) ( not ( = ?auto_2195021 ?auto_2195030 ) ) ( not ( = ?auto_2195021 ?auto_2195031 ) ) ( not ( = ?auto_2195021 ?auto_2195032 ) ) ( not ( = ?auto_2195021 ?auto_2195033 ) ) ( not ( = ?auto_2195021 ?auto_2195037 ) ) ( not ( = ?auto_2195021 ?auto_2195035 ) ) ( not ( = ?auto_2195022 ?auto_2195023 ) ) ( not ( = ?auto_2195022 ?auto_2195025 ) ) ( not ( = ?auto_2195022 ?auto_2195024 ) ) ( not ( = ?auto_2195022 ?auto_2195026 ) ) ( not ( = ?auto_2195022 ?auto_2195027 ) ) ( not ( = ?auto_2195022 ?auto_2195028 ) ) ( not ( = ?auto_2195022 ?auto_2195029 ) ) ( not ( = ?auto_2195022 ?auto_2195030 ) ) ( not ( = ?auto_2195022 ?auto_2195031 ) ) ( not ( = ?auto_2195022 ?auto_2195032 ) ) ( not ( = ?auto_2195022 ?auto_2195033 ) ) ( not ( = ?auto_2195022 ?auto_2195037 ) ) ( not ( = ?auto_2195022 ?auto_2195035 ) ) ( not ( = ?auto_2195023 ?auto_2195025 ) ) ( not ( = ?auto_2195023 ?auto_2195024 ) ) ( not ( = ?auto_2195023 ?auto_2195026 ) ) ( not ( = ?auto_2195023 ?auto_2195027 ) ) ( not ( = ?auto_2195023 ?auto_2195028 ) ) ( not ( = ?auto_2195023 ?auto_2195029 ) ) ( not ( = ?auto_2195023 ?auto_2195030 ) ) ( not ( = ?auto_2195023 ?auto_2195031 ) ) ( not ( = ?auto_2195023 ?auto_2195032 ) ) ( not ( = ?auto_2195023 ?auto_2195033 ) ) ( not ( = ?auto_2195023 ?auto_2195037 ) ) ( not ( = ?auto_2195023 ?auto_2195035 ) ) ( not ( = ?auto_2195025 ?auto_2195024 ) ) ( not ( = ?auto_2195025 ?auto_2195026 ) ) ( not ( = ?auto_2195025 ?auto_2195027 ) ) ( not ( = ?auto_2195025 ?auto_2195028 ) ) ( not ( = ?auto_2195025 ?auto_2195029 ) ) ( not ( = ?auto_2195025 ?auto_2195030 ) ) ( not ( = ?auto_2195025 ?auto_2195031 ) ) ( not ( = ?auto_2195025 ?auto_2195032 ) ) ( not ( = ?auto_2195025 ?auto_2195033 ) ) ( not ( = ?auto_2195025 ?auto_2195037 ) ) ( not ( = ?auto_2195025 ?auto_2195035 ) ) ( not ( = ?auto_2195024 ?auto_2195026 ) ) ( not ( = ?auto_2195024 ?auto_2195027 ) ) ( not ( = ?auto_2195024 ?auto_2195028 ) ) ( not ( = ?auto_2195024 ?auto_2195029 ) ) ( not ( = ?auto_2195024 ?auto_2195030 ) ) ( not ( = ?auto_2195024 ?auto_2195031 ) ) ( not ( = ?auto_2195024 ?auto_2195032 ) ) ( not ( = ?auto_2195024 ?auto_2195033 ) ) ( not ( = ?auto_2195024 ?auto_2195037 ) ) ( not ( = ?auto_2195024 ?auto_2195035 ) ) ( not ( = ?auto_2195026 ?auto_2195027 ) ) ( not ( = ?auto_2195026 ?auto_2195028 ) ) ( not ( = ?auto_2195026 ?auto_2195029 ) ) ( not ( = ?auto_2195026 ?auto_2195030 ) ) ( not ( = ?auto_2195026 ?auto_2195031 ) ) ( not ( = ?auto_2195026 ?auto_2195032 ) ) ( not ( = ?auto_2195026 ?auto_2195033 ) ) ( not ( = ?auto_2195026 ?auto_2195037 ) ) ( not ( = ?auto_2195026 ?auto_2195035 ) ) ( not ( = ?auto_2195027 ?auto_2195028 ) ) ( not ( = ?auto_2195027 ?auto_2195029 ) ) ( not ( = ?auto_2195027 ?auto_2195030 ) ) ( not ( = ?auto_2195027 ?auto_2195031 ) ) ( not ( = ?auto_2195027 ?auto_2195032 ) ) ( not ( = ?auto_2195027 ?auto_2195033 ) ) ( not ( = ?auto_2195027 ?auto_2195037 ) ) ( not ( = ?auto_2195027 ?auto_2195035 ) ) ( not ( = ?auto_2195028 ?auto_2195029 ) ) ( not ( = ?auto_2195028 ?auto_2195030 ) ) ( not ( = ?auto_2195028 ?auto_2195031 ) ) ( not ( = ?auto_2195028 ?auto_2195032 ) ) ( not ( = ?auto_2195028 ?auto_2195033 ) ) ( not ( = ?auto_2195028 ?auto_2195037 ) ) ( not ( = ?auto_2195028 ?auto_2195035 ) ) ( not ( = ?auto_2195029 ?auto_2195030 ) ) ( not ( = ?auto_2195029 ?auto_2195031 ) ) ( not ( = ?auto_2195029 ?auto_2195032 ) ) ( not ( = ?auto_2195029 ?auto_2195033 ) ) ( not ( = ?auto_2195029 ?auto_2195037 ) ) ( not ( = ?auto_2195029 ?auto_2195035 ) ) ( not ( = ?auto_2195030 ?auto_2195031 ) ) ( not ( = ?auto_2195030 ?auto_2195032 ) ) ( not ( = ?auto_2195030 ?auto_2195033 ) ) ( not ( = ?auto_2195030 ?auto_2195037 ) ) ( not ( = ?auto_2195030 ?auto_2195035 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195031 ?auto_2195032 ?auto_2195033 )
      ( MAKE-12CRATE-VERIFY ?auto_2195021 ?auto_2195022 ?auto_2195023 ?auto_2195025 ?auto_2195024 ?auto_2195026 ?auto_2195027 ?auto_2195028 ?auto_2195029 ?auto_2195030 ?auto_2195031 ?auto_2195032 ?auto_2195033 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2195041 - SURFACE
      ?auto_2195042 - SURFACE
      ?auto_2195043 - SURFACE
      ?auto_2195045 - SURFACE
      ?auto_2195044 - SURFACE
      ?auto_2195046 - SURFACE
      ?auto_2195047 - SURFACE
      ?auto_2195048 - SURFACE
      ?auto_2195049 - SURFACE
      ?auto_2195050 - SURFACE
      ?auto_2195051 - SURFACE
      ?auto_2195052 - SURFACE
      ?auto_2195053 - SURFACE
      ?auto_2195054 - SURFACE
    )
    :vars
    (
      ?auto_2195060 - HOIST
      ?auto_2195055 - PLACE
      ?auto_2195059 - PLACE
      ?auto_2195057 - HOIST
      ?auto_2195058 - SURFACE
      ?auto_2195061 - TRUCK
      ?auto_2195056 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195060 ?auto_2195055 ) ( IS-CRATE ?auto_2195054 ) ( not ( = ?auto_2195053 ?auto_2195054 ) ) ( not ( = ?auto_2195052 ?auto_2195053 ) ) ( not ( = ?auto_2195052 ?auto_2195054 ) ) ( not ( = ?auto_2195059 ?auto_2195055 ) ) ( HOIST-AT ?auto_2195057 ?auto_2195059 ) ( not ( = ?auto_2195060 ?auto_2195057 ) ) ( SURFACE-AT ?auto_2195054 ?auto_2195059 ) ( ON ?auto_2195054 ?auto_2195058 ) ( CLEAR ?auto_2195054 ) ( not ( = ?auto_2195053 ?auto_2195058 ) ) ( not ( = ?auto_2195054 ?auto_2195058 ) ) ( not ( = ?auto_2195052 ?auto_2195058 ) ) ( SURFACE-AT ?auto_2195052 ?auto_2195055 ) ( CLEAR ?auto_2195052 ) ( IS-CRATE ?auto_2195053 ) ( AVAILABLE ?auto_2195060 ) ( TRUCK-AT ?auto_2195061 ?auto_2195059 ) ( AVAILABLE ?auto_2195057 ) ( SURFACE-AT ?auto_2195053 ?auto_2195059 ) ( ON ?auto_2195053 ?auto_2195056 ) ( CLEAR ?auto_2195053 ) ( not ( = ?auto_2195053 ?auto_2195056 ) ) ( not ( = ?auto_2195054 ?auto_2195056 ) ) ( not ( = ?auto_2195052 ?auto_2195056 ) ) ( not ( = ?auto_2195058 ?auto_2195056 ) ) ( ON ?auto_2195042 ?auto_2195041 ) ( ON ?auto_2195043 ?auto_2195042 ) ( ON ?auto_2195045 ?auto_2195043 ) ( ON ?auto_2195044 ?auto_2195045 ) ( ON ?auto_2195046 ?auto_2195044 ) ( ON ?auto_2195047 ?auto_2195046 ) ( ON ?auto_2195048 ?auto_2195047 ) ( ON ?auto_2195049 ?auto_2195048 ) ( ON ?auto_2195050 ?auto_2195049 ) ( ON ?auto_2195051 ?auto_2195050 ) ( ON ?auto_2195052 ?auto_2195051 ) ( not ( = ?auto_2195041 ?auto_2195042 ) ) ( not ( = ?auto_2195041 ?auto_2195043 ) ) ( not ( = ?auto_2195041 ?auto_2195045 ) ) ( not ( = ?auto_2195041 ?auto_2195044 ) ) ( not ( = ?auto_2195041 ?auto_2195046 ) ) ( not ( = ?auto_2195041 ?auto_2195047 ) ) ( not ( = ?auto_2195041 ?auto_2195048 ) ) ( not ( = ?auto_2195041 ?auto_2195049 ) ) ( not ( = ?auto_2195041 ?auto_2195050 ) ) ( not ( = ?auto_2195041 ?auto_2195051 ) ) ( not ( = ?auto_2195041 ?auto_2195052 ) ) ( not ( = ?auto_2195041 ?auto_2195053 ) ) ( not ( = ?auto_2195041 ?auto_2195054 ) ) ( not ( = ?auto_2195041 ?auto_2195058 ) ) ( not ( = ?auto_2195041 ?auto_2195056 ) ) ( not ( = ?auto_2195042 ?auto_2195043 ) ) ( not ( = ?auto_2195042 ?auto_2195045 ) ) ( not ( = ?auto_2195042 ?auto_2195044 ) ) ( not ( = ?auto_2195042 ?auto_2195046 ) ) ( not ( = ?auto_2195042 ?auto_2195047 ) ) ( not ( = ?auto_2195042 ?auto_2195048 ) ) ( not ( = ?auto_2195042 ?auto_2195049 ) ) ( not ( = ?auto_2195042 ?auto_2195050 ) ) ( not ( = ?auto_2195042 ?auto_2195051 ) ) ( not ( = ?auto_2195042 ?auto_2195052 ) ) ( not ( = ?auto_2195042 ?auto_2195053 ) ) ( not ( = ?auto_2195042 ?auto_2195054 ) ) ( not ( = ?auto_2195042 ?auto_2195058 ) ) ( not ( = ?auto_2195042 ?auto_2195056 ) ) ( not ( = ?auto_2195043 ?auto_2195045 ) ) ( not ( = ?auto_2195043 ?auto_2195044 ) ) ( not ( = ?auto_2195043 ?auto_2195046 ) ) ( not ( = ?auto_2195043 ?auto_2195047 ) ) ( not ( = ?auto_2195043 ?auto_2195048 ) ) ( not ( = ?auto_2195043 ?auto_2195049 ) ) ( not ( = ?auto_2195043 ?auto_2195050 ) ) ( not ( = ?auto_2195043 ?auto_2195051 ) ) ( not ( = ?auto_2195043 ?auto_2195052 ) ) ( not ( = ?auto_2195043 ?auto_2195053 ) ) ( not ( = ?auto_2195043 ?auto_2195054 ) ) ( not ( = ?auto_2195043 ?auto_2195058 ) ) ( not ( = ?auto_2195043 ?auto_2195056 ) ) ( not ( = ?auto_2195045 ?auto_2195044 ) ) ( not ( = ?auto_2195045 ?auto_2195046 ) ) ( not ( = ?auto_2195045 ?auto_2195047 ) ) ( not ( = ?auto_2195045 ?auto_2195048 ) ) ( not ( = ?auto_2195045 ?auto_2195049 ) ) ( not ( = ?auto_2195045 ?auto_2195050 ) ) ( not ( = ?auto_2195045 ?auto_2195051 ) ) ( not ( = ?auto_2195045 ?auto_2195052 ) ) ( not ( = ?auto_2195045 ?auto_2195053 ) ) ( not ( = ?auto_2195045 ?auto_2195054 ) ) ( not ( = ?auto_2195045 ?auto_2195058 ) ) ( not ( = ?auto_2195045 ?auto_2195056 ) ) ( not ( = ?auto_2195044 ?auto_2195046 ) ) ( not ( = ?auto_2195044 ?auto_2195047 ) ) ( not ( = ?auto_2195044 ?auto_2195048 ) ) ( not ( = ?auto_2195044 ?auto_2195049 ) ) ( not ( = ?auto_2195044 ?auto_2195050 ) ) ( not ( = ?auto_2195044 ?auto_2195051 ) ) ( not ( = ?auto_2195044 ?auto_2195052 ) ) ( not ( = ?auto_2195044 ?auto_2195053 ) ) ( not ( = ?auto_2195044 ?auto_2195054 ) ) ( not ( = ?auto_2195044 ?auto_2195058 ) ) ( not ( = ?auto_2195044 ?auto_2195056 ) ) ( not ( = ?auto_2195046 ?auto_2195047 ) ) ( not ( = ?auto_2195046 ?auto_2195048 ) ) ( not ( = ?auto_2195046 ?auto_2195049 ) ) ( not ( = ?auto_2195046 ?auto_2195050 ) ) ( not ( = ?auto_2195046 ?auto_2195051 ) ) ( not ( = ?auto_2195046 ?auto_2195052 ) ) ( not ( = ?auto_2195046 ?auto_2195053 ) ) ( not ( = ?auto_2195046 ?auto_2195054 ) ) ( not ( = ?auto_2195046 ?auto_2195058 ) ) ( not ( = ?auto_2195046 ?auto_2195056 ) ) ( not ( = ?auto_2195047 ?auto_2195048 ) ) ( not ( = ?auto_2195047 ?auto_2195049 ) ) ( not ( = ?auto_2195047 ?auto_2195050 ) ) ( not ( = ?auto_2195047 ?auto_2195051 ) ) ( not ( = ?auto_2195047 ?auto_2195052 ) ) ( not ( = ?auto_2195047 ?auto_2195053 ) ) ( not ( = ?auto_2195047 ?auto_2195054 ) ) ( not ( = ?auto_2195047 ?auto_2195058 ) ) ( not ( = ?auto_2195047 ?auto_2195056 ) ) ( not ( = ?auto_2195048 ?auto_2195049 ) ) ( not ( = ?auto_2195048 ?auto_2195050 ) ) ( not ( = ?auto_2195048 ?auto_2195051 ) ) ( not ( = ?auto_2195048 ?auto_2195052 ) ) ( not ( = ?auto_2195048 ?auto_2195053 ) ) ( not ( = ?auto_2195048 ?auto_2195054 ) ) ( not ( = ?auto_2195048 ?auto_2195058 ) ) ( not ( = ?auto_2195048 ?auto_2195056 ) ) ( not ( = ?auto_2195049 ?auto_2195050 ) ) ( not ( = ?auto_2195049 ?auto_2195051 ) ) ( not ( = ?auto_2195049 ?auto_2195052 ) ) ( not ( = ?auto_2195049 ?auto_2195053 ) ) ( not ( = ?auto_2195049 ?auto_2195054 ) ) ( not ( = ?auto_2195049 ?auto_2195058 ) ) ( not ( = ?auto_2195049 ?auto_2195056 ) ) ( not ( = ?auto_2195050 ?auto_2195051 ) ) ( not ( = ?auto_2195050 ?auto_2195052 ) ) ( not ( = ?auto_2195050 ?auto_2195053 ) ) ( not ( = ?auto_2195050 ?auto_2195054 ) ) ( not ( = ?auto_2195050 ?auto_2195058 ) ) ( not ( = ?auto_2195050 ?auto_2195056 ) ) ( not ( = ?auto_2195051 ?auto_2195052 ) ) ( not ( = ?auto_2195051 ?auto_2195053 ) ) ( not ( = ?auto_2195051 ?auto_2195054 ) ) ( not ( = ?auto_2195051 ?auto_2195058 ) ) ( not ( = ?auto_2195051 ?auto_2195056 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195052 ?auto_2195053 ?auto_2195054 )
      ( MAKE-13CRATE-VERIFY ?auto_2195041 ?auto_2195042 ?auto_2195043 ?auto_2195045 ?auto_2195044 ?auto_2195046 ?auto_2195047 ?auto_2195048 ?auto_2195049 ?auto_2195050 ?auto_2195051 ?auto_2195052 ?auto_2195053 ?auto_2195054 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2195062 - SURFACE
      ?auto_2195063 - SURFACE
      ?auto_2195064 - SURFACE
      ?auto_2195066 - SURFACE
      ?auto_2195065 - SURFACE
      ?auto_2195067 - SURFACE
      ?auto_2195068 - SURFACE
      ?auto_2195069 - SURFACE
      ?auto_2195070 - SURFACE
      ?auto_2195071 - SURFACE
      ?auto_2195072 - SURFACE
      ?auto_2195073 - SURFACE
      ?auto_2195074 - SURFACE
      ?auto_2195075 - SURFACE
      ?auto_2195076 - SURFACE
    )
    :vars
    (
      ?auto_2195082 - HOIST
      ?auto_2195077 - PLACE
      ?auto_2195081 - PLACE
      ?auto_2195079 - HOIST
      ?auto_2195080 - SURFACE
      ?auto_2195083 - TRUCK
      ?auto_2195078 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195082 ?auto_2195077 ) ( IS-CRATE ?auto_2195076 ) ( not ( = ?auto_2195075 ?auto_2195076 ) ) ( not ( = ?auto_2195074 ?auto_2195075 ) ) ( not ( = ?auto_2195074 ?auto_2195076 ) ) ( not ( = ?auto_2195081 ?auto_2195077 ) ) ( HOIST-AT ?auto_2195079 ?auto_2195081 ) ( not ( = ?auto_2195082 ?auto_2195079 ) ) ( SURFACE-AT ?auto_2195076 ?auto_2195081 ) ( ON ?auto_2195076 ?auto_2195080 ) ( CLEAR ?auto_2195076 ) ( not ( = ?auto_2195075 ?auto_2195080 ) ) ( not ( = ?auto_2195076 ?auto_2195080 ) ) ( not ( = ?auto_2195074 ?auto_2195080 ) ) ( SURFACE-AT ?auto_2195074 ?auto_2195077 ) ( CLEAR ?auto_2195074 ) ( IS-CRATE ?auto_2195075 ) ( AVAILABLE ?auto_2195082 ) ( TRUCK-AT ?auto_2195083 ?auto_2195081 ) ( AVAILABLE ?auto_2195079 ) ( SURFACE-AT ?auto_2195075 ?auto_2195081 ) ( ON ?auto_2195075 ?auto_2195078 ) ( CLEAR ?auto_2195075 ) ( not ( = ?auto_2195075 ?auto_2195078 ) ) ( not ( = ?auto_2195076 ?auto_2195078 ) ) ( not ( = ?auto_2195074 ?auto_2195078 ) ) ( not ( = ?auto_2195080 ?auto_2195078 ) ) ( ON ?auto_2195063 ?auto_2195062 ) ( ON ?auto_2195064 ?auto_2195063 ) ( ON ?auto_2195066 ?auto_2195064 ) ( ON ?auto_2195065 ?auto_2195066 ) ( ON ?auto_2195067 ?auto_2195065 ) ( ON ?auto_2195068 ?auto_2195067 ) ( ON ?auto_2195069 ?auto_2195068 ) ( ON ?auto_2195070 ?auto_2195069 ) ( ON ?auto_2195071 ?auto_2195070 ) ( ON ?auto_2195072 ?auto_2195071 ) ( ON ?auto_2195073 ?auto_2195072 ) ( ON ?auto_2195074 ?auto_2195073 ) ( not ( = ?auto_2195062 ?auto_2195063 ) ) ( not ( = ?auto_2195062 ?auto_2195064 ) ) ( not ( = ?auto_2195062 ?auto_2195066 ) ) ( not ( = ?auto_2195062 ?auto_2195065 ) ) ( not ( = ?auto_2195062 ?auto_2195067 ) ) ( not ( = ?auto_2195062 ?auto_2195068 ) ) ( not ( = ?auto_2195062 ?auto_2195069 ) ) ( not ( = ?auto_2195062 ?auto_2195070 ) ) ( not ( = ?auto_2195062 ?auto_2195071 ) ) ( not ( = ?auto_2195062 ?auto_2195072 ) ) ( not ( = ?auto_2195062 ?auto_2195073 ) ) ( not ( = ?auto_2195062 ?auto_2195074 ) ) ( not ( = ?auto_2195062 ?auto_2195075 ) ) ( not ( = ?auto_2195062 ?auto_2195076 ) ) ( not ( = ?auto_2195062 ?auto_2195080 ) ) ( not ( = ?auto_2195062 ?auto_2195078 ) ) ( not ( = ?auto_2195063 ?auto_2195064 ) ) ( not ( = ?auto_2195063 ?auto_2195066 ) ) ( not ( = ?auto_2195063 ?auto_2195065 ) ) ( not ( = ?auto_2195063 ?auto_2195067 ) ) ( not ( = ?auto_2195063 ?auto_2195068 ) ) ( not ( = ?auto_2195063 ?auto_2195069 ) ) ( not ( = ?auto_2195063 ?auto_2195070 ) ) ( not ( = ?auto_2195063 ?auto_2195071 ) ) ( not ( = ?auto_2195063 ?auto_2195072 ) ) ( not ( = ?auto_2195063 ?auto_2195073 ) ) ( not ( = ?auto_2195063 ?auto_2195074 ) ) ( not ( = ?auto_2195063 ?auto_2195075 ) ) ( not ( = ?auto_2195063 ?auto_2195076 ) ) ( not ( = ?auto_2195063 ?auto_2195080 ) ) ( not ( = ?auto_2195063 ?auto_2195078 ) ) ( not ( = ?auto_2195064 ?auto_2195066 ) ) ( not ( = ?auto_2195064 ?auto_2195065 ) ) ( not ( = ?auto_2195064 ?auto_2195067 ) ) ( not ( = ?auto_2195064 ?auto_2195068 ) ) ( not ( = ?auto_2195064 ?auto_2195069 ) ) ( not ( = ?auto_2195064 ?auto_2195070 ) ) ( not ( = ?auto_2195064 ?auto_2195071 ) ) ( not ( = ?auto_2195064 ?auto_2195072 ) ) ( not ( = ?auto_2195064 ?auto_2195073 ) ) ( not ( = ?auto_2195064 ?auto_2195074 ) ) ( not ( = ?auto_2195064 ?auto_2195075 ) ) ( not ( = ?auto_2195064 ?auto_2195076 ) ) ( not ( = ?auto_2195064 ?auto_2195080 ) ) ( not ( = ?auto_2195064 ?auto_2195078 ) ) ( not ( = ?auto_2195066 ?auto_2195065 ) ) ( not ( = ?auto_2195066 ?auto_2195067 ) ) ( not ( = ?auto_2195066 ?auto_2195068 ) ) ( not ( = ?auto_2195066 ?auto_2195069 ) ) ( not ( = ?auto_2195066 ?auto_2195070 ) ) ( not ( = ?auto_2195066 ?auto_2195071 ) ) ( not ( = ?auto_2195066 ?auto_2195072 ) ) ( not ( = ?auto_2195066 ?auto_2195073 ) ) ( not ( = ?auto_2195066 ?auto_2195074 ) ) ( not ( = ?auto_2195066 ?auto_2195075 ) ) ( not ( = ?auto_2195066 ?auto_2195076 ) ) ( not ( = ?auto_2195066 ?auto_2195080 ) ) ( not ( = ?auto_2195066 ?auto_2195078 ) ) ( not ( = ?auto_2195065 ?auto_2195067 ) ) ( not ( = ?auto_2195065 ?auto_2195068 ) ) ( not ( = ?auto_2195065 ?auto_2195069 ) ) ( not ( = ?auto_2195065 ?auto_2195070 ) ) ( not ( = ?auto_2195065 ?auto_2195071 ) ) ( not ( = ?auto_2195065 ?auto_2195072 ) ) ( not ( = ?auto_2195065 ?auto_2195073 ) ) ( not ( = ?auto_2195065 ?auto_2195074 ) ) ( not ( = ?auto_2195065 ?auto_2195075 ) ) ( not ( = ?auto_2195065 ?auto_2195076 ) ) ( not ( = ?auto_2195065 ?auto_2195080 ) ) ( not ( = ?auto_2195065 ?auto_2195078 ) ) ( not ( = ?auto_2195067 ?auto_2195068 ) ) ( not ( = ?auto_2195067 ?auto_2195069 ) ) ( not ( = ?auto_2195067 ?auto_2195070 ) ) ( not ( = ?auto_2195067 ?auto_2195071 ) ) ( not ( = ?auto_2195067 ?auto_2195072 ) ) ( not ( = ?auto_2195067 ?auto_2195073 ) ) ( not ( = ?auto_2195067 ?auto_2195074 ) ) ( not ( = ?auto_2195067 ?auto_2195075 ) ) ( not ( = ?auto_2195067 ?auto_2195076 ) ) ( not ( = ?auto_2195067 ?auto_2195080 ) ) ( not ( = ?auto_2195067 ?auto_2195078 ) ) ( not ( = ?auto_2195068 ?auto_2195069 ) ) ( not ( = ?auto_2195068 ?auto_2195070 ) ) ( not ( = ?auto_2195068 ?auto_2195071 ) ) ( not ( = ?auto_2195068 ?auto_2195072 ) ) ( not ( = ?auto_2195068 ?auto_2195073 ) ) ( not ( = ?auto_2195068 ?auto_2195074 ) ) ( not ( = ?auto_2195068 ?auto_2195075 ) ) ( not ( = ?auto_2195068 ?auto_2195076 ) ) ( not ( = ?auto_2195068 ?auto_2195080 ) ) ( not ( = ?auto_2195068 ?auto_2195078 ) ) ( not ( = ?auto_2195069 ?auto_2195070 ) ) ( not ( = ?auto_2195069 ?auto_2195071 ) ) ( not ( = ?auto_2195069 ?auto_2195072 ) ) ( not ( = ?auto_2195069 ?auto_2195073 ) ) ( not ( = ?auto_2195069 ?auto_2195074 ) ) ( not ( = ?auto_2195069 ?auto_2195075 ) ) ( not ( = ?auto_2195069 ?auto_2195076 ) ) ( not ( = ?auto_2195069 ?auto_2195080 ) ) ( not ( = ?auto_2195069 ?auto_2195078 ) ) ( not ( = ?auto_2195070 ?auto_2195071 ) ) ( not ( = ?auto_2195070 ?auto_2195072 ) ) ( not ( = ?auto_2195070 ?auto_2195073 ) ) ( not ( = ?auto_2195070 ?auto_2195074 ) ) ( not ( = ?auto_2195070 ?auto_2195075 ) ) ( not ( = ?auto_2195070 ?auto_2195076 ) ) ( not ( = ?auto_2195070 ?auto_2195080 ) ) ( not ( = ?auto_2195070 ?auto_2195078 ) ) ( not ( = ?auto_2195071 ?auto_2195072 ) ) ( not ( = ?auto_2195071 ?auto_2195073 ) ) ( not ( = ?auto_2195071 ?auto_2195074 ) ) ( not ( = ?auto_2195071 ?auto_2195075 ) ) ( not ( = ?auto_2195071 ?auto_2195076 ) ) ( not ( = ?auto_2195071 ?auto_2195080 ) ) ( not ( = ?auto_2195071 ?auto_2195078 ) ) ( not ( = ?auto_2195072 ?auto_2195073 ) ) ( not ( = ?auto_2195072 ?auto_2195074 ) ) ( not ( = ?auto_2195072 ?auto_2195075 ) ) ( not ( = ?auto_2195072 ?auto_2195076 ) ) ( not ( = ?auto_2195072 ?auto_2195080 ) ) ( not ( = ?auto_2195072 ?auto_2195078 ) ) ( not ( = ?auto_2195073 ?auto_2195074 ) ) ( not ( = ?auto_2195073 ?auto_2195075 ) ) ( not ( = ?auto_2195073 ?auto_2195076 ) ) ( not ( = ?auto_2195073 ?auto_2195080 ) ) ( not ( = ?auto_2195073 ?auto_2195078 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195074 ?auto_2195075 ?auto_2195076 )
      ( MAKE-14CRATE-VERIFY ?auto_2195062 ?auto_2195063 ?auto_2195064 ?auto_2195066 ?auto_2195065 ?auto_2195067 ?auto_2195068 ?auto_2195069 ?auto_2195070 ?auto_2195071 ?auto_2195072 ?auto_2195073 ?auto_2195074 ?auto_2195075 ?auto_2195076 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2195084 - SURFACE
      ?auto_2195085 - SURFACE
    )
    :vars
    (
      ?auto_2195091 - HOIST
      ?auto_2195086 - PLACE
      ?auto_2195093 - SURFACE
      ?auto_2195090 - PLACE
      ?auto_2195088 - HOIST
      ?auto_2195089 - SURFACE
      ?auto_2195087 - SURFACE
      ?auto_2195092 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195091 ?auto_2195086 ) ( IS-CRATE ?auto_2195085 ) ( not ( = ?auto_2195084 ?auto_2195085 ) ) ( not ( = ?auto_2195093 ?auto_2195084 ) ) ( not ( = ?auto_2195093 ?auto_2195085 ) ) ( not ( = ?auto_2195090 ?auto_2195086 ) ) ( HOIST-AT ?auto_2195088 ?auto_2195090 ) ( not ( = ?auto_2195091 ?auto_2195088 ) ) ( SURFACE-AT ?auto_2195085 ?auto_2195090 ) ( ON ?auto_2195085 ?auto_2195089 ) ( CLEAR ?auto_2195085 ) ( not ( = ?auto_2195084 ?auto_2195089 ) ) ( not ( = ?auto_2195085 ?auto_2195089 ) ) ( not ( = ?auto_2195093 ?auto_2195089 ) ) ( SURFACE-AT ?auto_2195093 ?auto_2195086 ) ( CLEAR ?auto_2195093 ) ( IS-CRATE ?auto_2195084 ) ( AVAILABLE ?auto_2195091 ) ( AVAILABLE ?auto_2195088 ) ( SURFACE-AT ?auto_2195084 ?auto_2195090 ) ( ON ?auto_2195084 ?auto_2195087 ) ( CLEAR ?auto_2195084 ) ( not ( = ?auto_2195084 ?auto_2195087 ) ) ( not ( = ?auto_2195085 ?auto_2195087 ) ) ( not ( = ?auto_2195093 ?auto_2195087 ) ) ( not ( = ?auto_2195089 ?auto_2195087 ) ) ( TRUCK-AT ?auto_2195092 ?auto_2195086 ) )
    :subtasks
    ( ( !DRIVE ?auto_2195092 ?auto_2195086 ?auto_2195090 )
      ( MAKE-2CRATE ?auto_2195093 ?auto_2195084 ?auto_2195085 )
      ( MAKE-1CRATE-VERIFY ?auto_2195084 ?auto_2195085 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2195094 - SURFACE
      ?auto_2195095 - SURFACE
      ?auto_2195096 - SURFACE
    )
    :vars
    (
      ?auto_2195100 - HOIST
      ?auto_2195097 - PLACE
      ?auto_2195098 - PLACE
      ?auto_2195103 - HOIST
      ?auto_2195102 - SURFACE
      ?auto_2195099 - SURFACE
      ?auto_2195101 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195100 ?auto_2195097 ) ( IS-CRATE ?auto_2195096 ) ( not ( = ?auto_2195095 ?auto_2195096 ) ) ( not ( = ?auto_2195094 ?auto_2195095 ) ) ( not ( = ?auto_2195094 ?auto_2195096 ) ) ( not ( = ?auto_2195098 ?auto_2195097 ) ) ( HOIST-AT ?auto_2195103 ?auto_2195098 ) ( not ( = ?auto_2195100 ?auto_2195103 ) ) ( SURFACE-AT ?auto_2195096 ?auto_2195098 ) ( ON ?auto_2195096 ?auto_2195102 ) ( CLEAR ?auto_2195096 ) ( not ( = ?auto_2195095 ?auto_2195102 ) ) ( not ( = ?auto_2195096 ?auto_2195102 ) ) ( not ( = ?auto_2195094 ?auto_2195102 ) ) ( SURFACE-AT ?auto_2195094 ?auto_2195097 ) ( CLEAR ?auto_2195094 ) ( IS-CRATE ?auto_2195095 ) ( AVAILABLE ?auto_2195100 ) ( AVAILABLE ?auto_2195103 ) ( SURFACE-AT ?auto_2195095 ?auto_2195098 ) ( ON ?auto_2195095 ?auto_2195099 ) ( CLEAR ?auto_2195095 ) ( not ( = ?auto_2195095 ?auto_2195099 ) ) ( not ( = ?auto_2195096 ?auto_2195099 ) ) ( not ( = ?auto_2195094 ?auto_2195099 ) ) ( not ( = ?auto_2195102 ?auto_2195099 ) ) ( TRUCK-AT ?auto_2195101 ?auto_2195097 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2195095 ?auto_2195096 )
      ( MAKE-2CRATE-VERIFY ?auto_2195094 ?auto_2195095 ?auto_2195096 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2195104 - SURFACE
      ?auto_2195105 - SURFACE
      ?auto_2195106 - SURFACE
      ?auto_2195107 - SURFACE
    )
    :vars
    (
      ?auto_2195110 - HOIST
      ?auto_2195108 - PLACE
      ?auto_2195114 - PLACE
      ?auto_2195109 - HOIST
      ?auto_2195112 - SURFACE
      ?auto_2195111 - SURFACE
      ?auto_2195113 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195110 ?auto_2195108 ) ( IS-CRATE ?auto_2195107 ) ( not ( = ?auto_2195106 ?auto_2195107 ) ) ( not ( = ?auto_2195105 ?auto_2195106 ) ) ( not ( = ?auto_2195105 ?auto_2195107 ) ) ( not ( = ?auto_2195114 ?auto_2195108 ) ) ( HOIST-AT ?auto_2195109 ?auto_2195114 ) ( not ( = ?auto_2195110 ?auto_2195109 ) ) ( SURFACE-AT ?auto_2195107 ?auto_2195114 ) ( ON ?auto_2195107 ?auto_2195112 ) ( CLEAR ?auto_2195107 ) ( not ( = ?auto_2195106 ?auto_2195112 ) ) ( not ( = ?auto_2195107 ?auto_2195112 ) ) ( not ( = ?auto_2195105 ?auto_2195112 ) ) ( SURFACE-AT ?auto_2195105 ?auto_2195108 ) ( CLEAR ?auto_2195105 ) ( IS-CRATE ?auto_2195106 ) ( AVAILABLE ?auto_2195110 ) ( AVAILABLE ?auto_2195109 ) ( SURFACE-AT ?auto_2195106 ?auto_2195114 ) ( ON ?auto_2195106 ?auto_2195111 ) ( CLEAR ?auto_2195106 ) ( not ( = ?auto_2195106 ?auto_2195111 ) ) ( not ( = ?auto_2195107 ?auto_2195111 ) ) ( not ( = ?auto_2195105 ?auto_2195111 ) ) ( not ( = ?auto_2195112 ?auto_2195111 ) ) ( TRUCK-AT ?auto_2195113 ?auto_2195108 ) ( ON ?auto_2195105 ?auto_2195104 ) ( not ( = ?auto_2195104 ?auto_2195105 ) ) ( not ( = ?auto_2195104 ?auto_2195106 ) ) ( not ( = ?auto_2195104 ?auto_2195107 ) ) ( not ( = ?auto_2195104 ?auto_2195112 ) ) ( not ( = ?auto_2195104 ?auto_2195111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195105 ?auto_2195106 ?auto_2195107 )
      ( MAKE-3CRATE-VERIFY ?auto_2195104 ?auto_2195105 ?auto_2195106 ?auto_2195107 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2195115 - SURFACE
      ?auto_2195116 - SURFACE
      ?auto_2195117 - SURFACE
      ?auto_2195119 - SURFACE
      ?auto_2195118 - SURFACE
    )
    :vars
    (
      ?auto_2195122 - HOIST
      ?auto_2195120 - PLACE
      ?auto_2195126 - PLACE
      ?auto_2195121 - HOIST
      ?auto_2195124 - SURFACE
      ?auto_2195123 - SURFACE
      ?auto_2195125 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195122 ?auto_2195120 ) ( IS-CRATE ?auto_2195118 ) ( not ( = ?auto_2195119 ?auto_2195118 ) ) ( not ( = ?auto_2195117 ?auto_2195119 ) ) ( not ( = ?auto_2195117 ?auto_2195118 ) ) ( not ( = ?auto_2195126 ?auto_2195120 ) ) ( HOIST-AT ?auto_2195121 ?auto_2195126 ) ( not ( = ?auto_2195122 ?auto_2195121 ) ) ( SURFACE-AT ?auto_2195118 ?auto_2195126 ) ( ON ?auto_2195118 ?auto_2195124 ) ( CLEAR ?auto_2195118 ) ( not ( = ?auto_2195119 ?auto_2195124 ) ) ( not ( = ?auto_2195118 ?auto_2195124 ) ) ( not ( = ?auto_2195117 ?auto_2195124 ) ) ( SURFACE-AT ?auto_2195117 ?auto_2195120 ) ( CLEAR ?auto_2195117 ) ( IS-CRATE ?auto_2195119 ) ( AVAILABLE ?auto_2195122 ) ( AVAILABLE ?auto_2195121 ) ( SURFACE-AT ?auto_2195119 ?auto_2195126 ) ( ON ?auto_2195119 ?auto_2195123 ) ( CLEAR ?auto_2195119 ) ( not ( = ?auto_2195119 ?auto_2195123 ) ) ( not ( = ?auto_2195118 ?auto_2195123 ) ) ( not ( = ?auto_2195117 ?auto_2195123 ) ) ( not ( = ?auto_2195124 ?auto_2195123 ) ) ( TRUCK-AT ?auto_2195125 ?auto_2195120 ) ( ON ?auto_2195116 ?auto_2195115 ) ( ON ?auto_2195117 ?auto_2195116 ) ( not ( = ?auto_2195115 ?auto_2195116 ) ) ( not ( = ?auto_2195115 ?auto_2195117 ) ) ( not ( = ?auto_2195115 ?auto_2195119 ) ) ( not ( = ?auto_2195115 ?auto_2195118 ) ) ( not ( = ?auto_2195115 ?auto_2195124 ) ) ( not ( = ?auto_2195115 ?auto_2195123 ) ) ( not ( = ?auto_2195116 ?auto_2195117 ) ) ( not ( = ?auto_2195116 ?auto_2195119 ) ) ( not ( = ?auto_2195116 ?auto_2195118 ) ) ( not ( = ?auto_2195116 ?auto_2195124 ) ) ( not ( = ?auto_2195116 ?auto_2195123 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195117 ?auto_2195119 ?auto_2195118 )
      ( MAKE-4CRATE-VERIFY ?auto_2195115 ?auto_2195116 ?auto_2195117 ?auto_2195119 ?auto_2195118 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2195127 - SURFACE
      ?auto_2195128 - SURFACE
      ?auto_2195129 - SURFACE
      ?auto_2195131 - SURFACE
      ?auto_2195130 - SURFACE
      ?auto_2195132 - SURFACE
    )
    :vars
    (
      ?auto_2195135 - HOIST
      ?auto_2195133 - PLACE
      ?auto_2195139 - PLACE
      ?auto_2195134 - HOIST
      ?auto_2195137 - SURFACE
      ?auto_2195136 - SURFACE
      ?auto_2195138 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195135 ?auto_2195133 ) ( IS-CRATE ?auto_2195132 ) ( not ( = ?auto_2195130 ?auto_2195132 ) ) ( not ( = ?auto_2195131 ?auto_2195130 ) ) ( not ( = ?auto_2195131 ?auto_2195132 ) ) ( not ( = ?auto_2195139 ?auto_2195133 ) ) ( HOIST-AT ?auto_2195134 ?auto_2195139 ) ( not ( = ?auto_2195135 ?auto_2195134 ) ) ( SURFACE-AT ?auto_2195132 ?auto_2195139 ) ( ON ?auto_2195132 ?auto_2195137 ) ( CLEAR ?auto_2195132 ) ( not ( = ?auto_2195130 ?auto_2195137 ) ) ( not ( = ?auto_2195132 ?auto_2195137 ) ) ( not ( = ?auto_2195131 ?auto_2195137 ) ) ( SURFACE-AT ?auto_2195131 ?auto_2195133 ) ( CLEAR ?auto_2195131 ) ( IS-CRATE ?auto_2195130 ) ( AVAILABLE ?auto_2195135 ) ( AVAILABLE ?auto_2195134 ) ( SURFACE-AT ?auto_2195130 ?auto_2195139 ) ( ON ?auto_2195130 ?auto_2195136 ) ( CLEAR ?auto_2195130 ) ( not ( = ?auto_2195130 ?auto_2195136 ) ) ( not ( = ?auto_2195132 ?auto_2195136 ) ) ( not ( = ?auto_2195131 ?auto_2195136 ) ) ( not ( = ?auto_2195137 ?auto_2195136 ) ) ( TRUCK-AT ?auto_2195138 ?auto_2195133 ) ( ON ?auto_2195128 ?auto_2195127 ) ( ON ?auto_2195129 ?auto_2195128 ) ( ON ?auto_2195131 ?auto_2195129 ) ( not ( = ?auto_2195127 ?auto_2195128 ) ) ( not ( = ?auto_2195127 ?auto_2195129 ) ) ( not ( = ?auto_2195127 ?auto_2195131 ) ) ( not ( = ?auto_2195127 ?auto_2195130 ) ) ( not ( = ?auto_2195127 ?auto_2195132 ) ) ( not ( = ?auto_2195127 ?auto_2195137 ) ) ( not ( = ?auto_2195127 ?auto_2195136 ) ) ( not ( = ?auto_2195128 ?auto_2195129 ) ) ( not ( = ?auto_2195128 ?auto_2195131 ) ) ( not ( = ?auto_2195128 ?auto_2195130 ) ) ( not ( = ?auto_2195128 ?auto_2195132 ) ) ( not ( = ?auto_2195128 ?auto_2195137 ) ) ( not ( = ?auto_2195128 ?auto_2195136 ) ) ( not ( = ?auto_2195129 ?auto_2195131 ) ) ( not ( = ?auto_2195129 ?auto_2195130 ) ) ( not ( = ?auto_2195129 ?auto_2195132 ) ) ( not ( = ?auto_2195129 ?auto_2195137 ) ) ( not ( = ?auto_2195129 ?auto_2195136 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195131 ?auto_2195130 ?auto_2195132 )
      ( MAKE-5CRATE-VERIFY ?auto_2195127 ?auto_2195128 ?auto_2195129 ?auto_2195131 ?auto_2195130 ?auto_2195132 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2195140 - SURFACE
      ?auto_2195141 - SURFACE
      ?auto_2195142 - SURFACE
      ?auto_2195144 - SURFACE
      ?auto_2195143 - SURFACE
      ?auto_2195145 - SURFACE
      ?auto_2195146 - SURFACE
    )
    :vars
    (
      ?auto_2195149 - HOIST
      ?auto_2195147 - PLACE
      ?auto_2195153 - PLACE
      ?auto_2195148 - HOIST
      ?auto_2195151 - SURFACE
      ?auto_2195150 - SURFACE
      ?auto_2195152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195149 ?auto_2195147 ) ( IS-CRATE ?auto_2195146 ) ( not ( = ?auto_2195145 ?auto_2195146 ) ) ( not ( = ?auto_2195143 ?auto_2195145 ) ) ( not ( = ?auto_2195143 ?auto_2195146 ) ) ( not ( = ?auto_2195153 ?auto_2195147 ) ) ( HOIST-AT ?auto_2195148 ?auto_2195153 ) ( not ( = ?auto_2195149 ?auto_2195148 ) ) ( SURFACE-AT ?auto_2195146 ?auto_2195153 ) ( ON ?auto_2195146 ?auto_2195151 ) ( CLEAR ?auto_2195146 ) ( not ( = ?auto_2195145 ?auto_2195151 ) ) ( not ( = ?auto_2195146 ?auto_2195151 ) ) ( not ( = ?auto_2195143 ?auto_2195151 ) ) ( SURFACE-AT ?auto_2195143 ?auto_2195147 ) ( CLEAR ?auto_2195143 ) ( IS-CRATE ?auto_2195145 ) ( AVAILABLE ?auto_2195149 ) ( AVAILABLE ?auto_2195148 ) ( SURFACE-AT ?auto_2195145 ?auto_2195153 ) ( ON ?auto_2195145 ?auto_2195150 ) ( CLEAR ?auto_2195145 ) ( not ( = ?auto_2195145 ?auto_2195150 ) ) ( not ( = ?auto_2195146 ?auto_2195150 ) ) ( not ( = ?auto_2195143 ?auto_2195150 ) ) ( not ( = ?auto_2195151 ?auto_2195150 ) ) ( TRUCK-AT ?auto_2195152 ?auto_2195147 ) ( ON ?auto_2195141 ?auto_2195140 ) ( ON ?auto_2195142 ?auto_2195141 ) ( ON ?auto_2195144 ?auto_2195142 ) ( ON ?auto_2195143 ?auto_2195144 ) ( not ( = ?auto_2195140 ?auto_2195141 ) ) ( not ( = ?auto_2195140 ?auto_2195142 ) ) ( not ( = ?auto_2195140 ?auto_2195144 ) ) ( not ( = ?auto_2195140 ?auto_2195143 ) ) ( not ( = ?auto_2195140 ?auto_2195145 ) ) ( not ( = ?auto_2195140 ?auto_2195146 ) ) ( not ( = ?auto_2195140 ?auto_2195151 ) ) ( not ( = ?auto_2195140 ?auto_2195150 ) ) ( not ( = ?auto_2195141 ?auto_2195142 ) ) ( not ( = ?auto_2195141 ?auto_2195144 ) ) ( not ( = ?auto_2195141 ?auto_2195143 ) ) ( not ( = ?auto_2195141 ?auto_2195145 ) ) ( not ( = ?auto_2195141 ?auto_2195146 ) ) ( not ( = ?auto_2195141 ?auto_2195151 ) ) ( not ( = ?auto_2195141 ?auto_2195150 ) ) ( not ( = ?auto_2195142 ?auto_2195144 ) ) ( not ( = ?auto_2195142 ?auto_2195143 ) ) ( not ( = ?auto_2195142 ?auto_2195145 ) ) ( not ( = ?auto_2195142 ?auto_2195146 ) ) ( not ( = ?auto_2195142 ?auto_2195151 ) ) ( not ( = ?auto_2195142 ?auto_2195150 ) ) ( not ( = ?auto_2195144 ?auto_2195143 ) ) ( not ( = ?auto_2195144 ?auto_2195145 ) ) ( not ( = ?auto_2195144 ?auto_2195146 ) ) ( not ( = ?auto_2195144 ?auto_2195151 ) ) ( not ( = ?auto_2195144 ?auto_2195150 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195143 ?auto_2195145 ?auto_2195146 )
      ( MAKE-6CRATE-VERIFY ?auto_2195140 ?auto_2195141 ?auto_2195142 ?auto_2195144 ?auto_2195143 ?auto_2195145 ?auto_2195146 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2195154 - SURFACE
      ?auto_2195155 - SURFACE
      ?auto_2195156 - SURFACE
      ?auto_2195158 - SURFACE
      ?auto_2195157 - SURFACE
      ?auto_2195159 - SURFACE
      ?auto_2195160 - SURFACE
      ?auto_2195161 - SURFACE
    )
    :vars
    (
      ?auto_2195164 - HOIST
      ?auto_2195162 - PLACE
      ?auto_2195168 - PLACE
      ?auto_2195163 - HOIST
      ?auto_2195166 - SURFACE
      ?auto_2195165 - SURFACE
      ?auto_2195167 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195164 ?auto_2195162 ) ( IS-CRATE ?auto_2195161 ) ( not ( = ?auto_2195160 ?auto_2195161 ) ) ( not ( = ?auto_2195159 ?auto_2195160 ) ) ( not ( = ?auto_2195159 ?auto_2195161 ) ) ( not ( = ?auto_2195168 ?auto_2195162 ) ) ( HOIST-AT ?auto_2195163 ?auto_2195168 ) ( not ( = ?auto_2195164 ?auto_2195163 ) ) ( SURFACE-AT ?auto_2195161 ?auto_2195168 ) ( ON ?auto_2195161 ?auto_2195166 ) ( CLEAR ?auto_2195161 ) ( not ( = ?auto_2195160 ?auto_2195166 ) ) ( not ( = ?auto_2195161 ?auto_2195166 ) ) ( not ( = ?auto_2195159 ?auto_2195166 ) ) ( SURFACE-AT ?auto_2195159 ?auto_2195162 ) ( CLEAR ?auto_2195159 ) ( IS-CRATE ?auto_2195160 ) ( AVAILABLE ?auto_2195164 ) ( AVAILABLE ?auto_2195163 ) ( SURFACE-AT ?auto_2195160 ?auto_2195168 ) ( ON ?auto_2195160 ?auto_2195165 ) ( CLEAR ?auto_2195160 ) ( not ( = ?auto_2195160 ?auto_2195165 ) ) ( not ( = ?auto_2195161 ?auto_2195165 ) ) ( not ( = ?auto_2195159 ?auto_2195165 ) ) ( not ( = ?auto_2195166 ?auto_2195165 ) ) ( TRUCK-AT ?auto_2195167 ?auto_2195162 ) ( ON ?auto_2195155 ?auto_2195154 ) ( ON ?auto_2195156 ?auto_2195155 ) ( ON ?auto_2195158 ?auto_2195156 ) ( ON ?auto_2195157 ?auto_2195158 ) ( ON ?auto_2195159 ?auto_2195157 ) ( not ( = ?auto_2195154 ?auto_2195155 ) ) ( not ( = ?auto_2195154 ?auto_2195156 ) ) ( not ( = ?auto_2195154 ?auto_2195158 ) ) ( not ( = ?auto_2195154 ?auto_2195157 ) ) ( not ( = ?auto_2195154 ?auto_2195159 ) ) ( not ( = ?auto_2195154 ?auto_2195160 ) ) ( not ( = ?auto_2195154 ?auto_2195161 ) ) ( not ( = ?auto_2195154 ?auto_2195166 ) ) ( not ( = ?auto_2195154 ?auto_2195165 ) ) ( not ( = ?auto_2195155 ?auto_2195156 ) ) ( not ( = ?auto_2195155 ?auto_2195158 ) ) ( not ( = ?auto_2195155 ?auto_2195157 ) ) ( not ( = ?auto_2195155 ?auto_2195159 ) ) ( not ( = ?auto_2195155 ?auto_2195160 ) ) ( not ( = ?auto_2195155 ?auto_2195161 ) ) ( not ( = ?auto_2195155 ?auto_2195166 ) ) ( not ( = ?auto_2195155 ?auto_2195165 ) ) ( not ( = ?auto_2195156 ?auto_2195158 ) ) ( not ( = ?auto_2195156 ?auto_2195157 ) ) ( not ( = ?auto_2195156 ?auto_2195159 ) ) ( not ( = ?auto_2195156 ?auto_2195160 ) ) ( not ( = ?auto_2195156 ?auto_2195161 ) ) ( not ( = ?auto_2195156 ?auto_2195166 ) ) ( not ( = ?auto_2195156 ?auto_2195165 ) ) ( not ( = ?auto_2195158 ?auto_2195157 ) ) ( not ( = ?auto_2195158 ?auto_2195159 ) ) ( not ( = ?auto_2195158 ?auto_2195160 ) ) ( not ( = ?auto_2195158 ?auto_2195161 ) ) ( not ( = ?auto_2195158 ?auto_2195166 ) ) ( not ( = ?auto_2195158 ?auto_2195165 ) ) ( not ( = ?auto_2195157 ?auto_2195159 ) ) ( not ( = ?auto_2195157 ?auto_2195160 ) ) ( not ( = ?auto_2195157 ?auto_2195161 ) ) ( not ( = ?auto_2195157 ?auto_2195166 ) ) ( not ( = ?auto_2195157 ?auto_2195165 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195159 ?auto_2195160 ?auto_2195161 )
      ( MAKE-7CRATE-VERIFY ?auto_2195154 ?auto_2195155 ?auto_2195156 ?auto_2195158 ?auto_2195157 ?auto_2195159 ?auto_2195160 ?auto_2195161 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2195169 - SURFACE
      ?auto_2195170 - SURFACE
      ?auto_2195171 - SURFACE
      ?auto_2195173 - SURFACE
      ?auto_2195172 - SURFACE
      ?auto_2195174 - SURFACE
      ?auto_2195175 - SURFACE
      ?auto_2195176 - SURFACE
      ?auto_2195177 - SURFACE
    )
    :vars
    (
      ?auto_2195180 - HOIST
      ?auto_2195178 - PLACE
      ?auto_2195184 - PLACE
      ?auto_2195179 - HOIST
      ?auto_2195182 - SURFACE
      ?auto_2195181 - SURFACE
      ?auto_2195183 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195180 ?auto_2195178 ) ( IS-CRATE ?auto_2195177 ) ( not ( = ?auto_2195176 ?auto_2195177 ) ) ( not ( = ?auto_2195175 ?auto_2195176 ) ) ( not ( = ?auto_2195175 ?auto_2195177 ) ) ( not ( = ?auto_2195184 ?auto_2195178 ) ) ( HOIST-AT ?auto_2195179 ?auto_2195184 ) ( not ( = ?auto_2195180 ?auto_2195179 ) ) ( SURFACE-AT ?auto_2195177 ?auto_2195184 ) ( ON ?auto_2195177 ?auto_2195182 ) ( CLEAR ?auto_2195177 ) ( not ( = ?auto_2195176 ?auto_2195182 ) ) ( not ( = ?auto_2195177 ?auto_2195182 ) ) ( not ( = ?auto_2195175 ?auto_2195182 ) ) ( SURFACE-AT ?auto_2195175 ?auto_2195178 ) ( CLEAR ?auto_2195175 ) ( IS-CRATE ?auto_2195176 ) ( AVAILABLE ?auto_2195180 ) ( AVAILABLE ?auto_2195179 ) ( SURFACE-AT ?auto_2195176 ?auto_2195184 ) ( ON ?auto_2195176 ?auto_2195181 ) ( CLEAR ?auto_2195176 ) ( not ( = ?auto_2195176 ?auto_2195181 ) ) ( not ( = ?auto_2195177 ?auto_2195181 ) ) ( not ( = ?auto_2195175 ?auto_2195181 ) ) ( not ( = ?auto_2195182 ?auto_2195181 ) ) ( TRUCK-AT ?auto_2195183 ?auto_2195178 ) ( ON ?auto_2195170 ?auto_2195169 ) ( ON ?auto_2195171 ?auto_2195170 ) ( ON ?auto_2195173 ?auto_2195171 ) ( ON ?auto_2195172 ?auto_2195173 ) ( ON ?auto_2195174 ?auto_2195172 ) ( ON ?auto_2195175 ?auto_2195174 ) ( not ( = ?auto_2195169 ?auto_2195170 ) ) ( not ( = ?auto_2195169 ?auto_2195171 ) ) ( not ( = ?auto_2195169 ?auto_2195173 ) ) ( not ( = ?auto_2195169 ?auto_2195172 ) ) ( not ( = ?auto_2195169 ?auto_2195174 ) ) ( not ( = ?auto_2195169 ?auto_2195175 ) ) ( not ( = ?auto_2195169 ?auto_2195176 ) ) ( not ( = ?auto_2195169 ?auto_2195177 ) ) ( not ( = ?auto_2195169 ?auto_2195182 ) ) ( not ( = ?auto_2195169 ?auto_2195181 ) ) ( not ( = ?auto_2195170 ?auto_2195171 ) ) ( not ( = ?auto_2195170 ?auto_2195173 ) ) ( not ( = ?auto_2195170 ?auto_2195172 ) ) ( not ( = ?auto_2195170 ?auto_2195174 ) ) ( not ( = ?auto_2195170 ?auto_2195175 ) ) ( not ( = ?auto_2195170 ?auto_2195176 ) ) ( not ( = ?auto_2195170 ?auto_2195177 ) ) ( not ( = ?auto_2195170 ?auto_2195182 ) ) ( not ( = ?auto_2195170 ?auto_2195181 ) ) ( not ( = ?auto_2195171 ?auto_2195173 ) ) ( not ( = ?auto_2195171 ?auto_2195172 ) ) ( not ( = ?auto_2195171 ?auto_2195174 ) ) ( not ( = ?auto_2195171 ?auto_2195175 ) ) ( not ( = ?auto_2195171 ?auto_2195176 ) ) ( not ( = ?auto_2195171 ?auto_2195177 ) ) ( not ( = ?auto_2195171 ?auto_2195182 ) ) ( not ( = ?auto_2195171 ?auto_2195181 ) ) ( not ( = ?auto_2195173 ?auto_2195172 ) ) ( not ( = ?auto_2195173 ?auto_2195174 ) ) ( not ( = ?auto_2195173 ?auto_2195175 ) ) ( not ( = ?auto_2195173 ?auto_2195176 ) ) ( not ( = ?auto_2195173 ?auto_2195177 ) ) ( not ( = ?auto_2195173 ?auto_2195182 ) ) ( not ( = ?auto_2195173 ?auto_2195181 ) ) ( not ( = ?auto_2195172 ?auto_2195174 ) ) ( not ( = ?auto_2195172 ?auto_2195175 ) ) ( not ( = ?auto_2195172 ?auto_2195176 ) ) ( not ( = ?auto_2195172 ?auto_2195177 ) ) ( not ( = ?auto_2195172 ?auto_2195182 ) ) ( not ( = ?auto_2195172 ?auto_2195181 ) ) ( not ( = ?auto_2195174 ?auto_2195175 ) ) ( not ( = ?auto_2195174 ?auto_2195176 ) ) ( not ( = ?auto_2195174 ?auto_2195177 ) ) ( not ( = ?auto_2195174 ?auto_2195182 ) ) ( not ( = ?auto_2195174 ?auto_2195181 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195175 ?auto_2195176 ?auto_2195177 )
      ( MAKE-8CRATE-VERIFY ?auto_2195169 ?auto_2195170 ?auto_2195171 ?auto_2195173 ?auto_2195172 ?auto_2195174 ?auto_2195175 ?auto_2195176 ?auto_2195177 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2195185 - SURFACE
      ?auto_2195186 - SURFACE
      ?auto_2195187 - SURFACE
      ?auto_2195189 - SURFACE
      ?auto_2195188 - SURFACE
      ?auto_2195190 - SURFACE
      ?auto_2195191 - SURFACE
      ?auto_2195192 - SURFACE
      ?auto_2195193 - SURFACE
      ?auto_2195194 - SURFACE
    )
    :vars
    (
      ?auto_2195197 - HOIST
      ?auto_2195195 - PLACE
      ?auto_2195201 - PLACE
      ?auto_2195196 - HOIST
      ?auto_2195199 - SURFACE
      ?auto_2195198 - SURFACE
      ?auto_2195200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195197 ?auto_2195195 ) ( IS-CRATE ?auto_2195194 ) ( not ( = ?auto_2195193 ?auto_2195194 ) ) ( not ( = ?auto_2195192 ?auto_2195193 ) ) ( not ( = ?auto_2195192 ?auto_2195194 ) ) ( not ( = ?auto_2195201 ?auto_2195195 ) ) ( HOIST-AT ?auto_2195196 ?auto_2195201 ) ( not ( = ?auto_2195197 ?auto_2195196 ) ) ( SURFACE-AT ?auto_2195194 ?auto_2195201 ) ( ON ?auto_2195194 ?auto_2195199 ) ( CLEAR ?auto_2195194 ) ( not ( = ?auto_2195193 ?auto_2195199 ) ) ( not ( = ?auto_2195194 ?auto_2195199 ) ) ( not ( = ?auto_2195192 ?auto_2195199 ) ) ( SURFACE-AT ?auto_2195192 ?auto_2195195 ) ( CLEAR ?auto_2195192 ) ( IS-CRATE ?auto_2195193 ) ( AVAILABLE ?auto_2195197 ) ( AVAILABLE ?auto_2195196 ) ( SURFACE-AT ?auto_2195193 ?auto_2195201 ) ( ON ?auto_2195193 ?auto_2195198 ) ( CLEAR ?auto_2195193 ) ( not ( = ?auto_2195193 ?auto_2195198 ) ) ( not ( = ?auto_2195194 ?auto_2195198 ) ) ( not ( = ?auto_2195192 ?auto_2195198 ) ) ( not ( = ?auto_2195199 ?auto_2195198 ) ) ( TRUCK-AT ?auto_2195200 ?auto_2195195 ) ( ON ?auto_2195186 ?auto_2195185 ) ( ON ?auto_2195187 ?auto_2195186 ) ( ON ?auto_2195189 ?auto_2195187 ) ( ON ?auto_2195188 ?auto_2195189 ) ( ON ?auto_2195190 ?auto_2195188 ) ( ON ?auto_2195191 ?auto_2195190 ) ( ON ?auto_2195192 ?auto_2195191 ) ( not ( = ?auto_2195185 ?auto_2195186 ) ) ( not ( = ?auto_2195185 ?auto_2195187 ) ) ( not ( = ?auto_2195185 ?auto_2195189 ) ) ( not ( = ?auto_2195185 ?auto_2195188 ) ) ( not ( = ?auto_2195185 ?auto_2195190 ) ) ( not ( = ?auto_2195185 ?auto_2195191 ) ) ( not ( = ?auto_2195185 ?auto_2195192 ) ) ( not ( = ?auto_2195185 ?auto_2195193 ) ) ( not ( = ?auto_2195185 ?auto_2195194 ) ) ( not ( = ?auto_2195185 ?auto_2195199 ) ) ( not ( = ?auto_2195185 ?auto_2195198 ) ) ( not ( = ?auto_2195186 ?auto_2195187 ) ) ( not ( = ?auto_2195186 ?auto_2195189 ) ) ( not ( = ?auto_2195186 ?auto_2195188 ) ) ( not ( = ?auto_2195186 ?auto_2195190 ) ) ( not ( = ?auto_2195186 ?auto_2195191 ) ) ( not ( = ?auto_2195186 ?auto_2195192 ) ) ( not ( = ?auto_2195186 ?auto_2195193 ) ) ( not ( = ?auto_2195186 ?auto_2195194 ) ) ( not ( = ?auto_2195186 ?auto_2195199 ) ) ( not ( = ?auto_2195186 ?auto_2195198 ) ) ( not ( = ?auto_2195187 ?auto_2195189 ) ) ( not ( = ?auto_2195187 ?auto_2195188 ) ) ( not ( = ?auto_2195187 ?auto_2195190 ) ) ( not ( = ?auto_2195187 ?auto_2195191 ) ) ( not ( = ?auto_2195187 ?auto_2195192 ) ) ( not ( = ?auto_2195187 ?auto_2195193 ) ) ( not ( = ?auto_2195187 ?auto_2195194 ) ) ( not ( = ?auto_2195187 ?auto_2195199 ) ) ( not ( = ?auto_2195187 ?auto_2195198 ) ) ( not ( = ?auto_2195189 ?auto_2195188 ) ) ( not ( = ?auto_2195189 ?auto_2195190 ) ) ( not ( = ?auto_2195189 ?auto_2195191 ) ) ( not ( = ?auto_2195189 ?auto_2195192 ) ) ( not ( = ?auto_2195189 ?auto_2195193 ) ) ( not ( = ?auto_2195189 ?auto_2195194 ) ) ( not ( = ?auto_2195189 ?auto_2195199 ) ) ( not ( = ?auto_2195189 ?auto_2195198 ) ) ( not ( = ?auto_2195188 ?auto_2195190 ) ) ( not ( = ?auto_2195188 ?auto_2195191 ) ) ( not ( = ?auto_2195188 ?auto_2195192 ) ) ( not ( = ?auto_2195188 ?auto_2195193 ) ) ( not ( = ?auto_2195188 ?auto_2195194 ) ) ( not ( = ?auto_2195188 ?auto_2195199 ) ) ( not ( = ?auto_2195188 ?auto_2195198 ) ) ( not ( = ?auto_2195190 ?auto_2195191 ) ) ( not ( = ?auto_2195190 ?auto_2195192 ) ) ( not ( = ?auto_2195190 ?auto_2195193 ) ) ( not ( = ?auto_2195190 ?auto_2195194 ) ) ( not ( = ?auto_2195190 ?auto_2195199 ) ) ( not ( = ?auto_2195190 ?auto_2195198 ) ) ( not ( = ?auto_2195191 ?auto_2195192 ) ) ( not ( = ?auto_2195191 ?auto_2195193 ) ) ( not ( = ?auto_2195191 ?auto_2195194 ) ) ( not ( = ?auto_2195191 ?auto_2195199 ) ) ( not ( = ?auto_2195191 ?auto_2195198 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195192 ?auto_2195193 ?auto_2195194 )
      ( MAKE-9CRATE-VERIFY ?auto_2195185 ?auto_2195186 ?auto_2195187 ?auto_2195189 ?auto_2195188 ?auto_2195190 ?auto_2195191 ?auto_2195192 ?auto_2195193 ?auto_2195194 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2195202 - SURFACE
      ?auto_2195203 - SURFACE
      ?auto_2195204 - SURFACE
      ?auto_2195206 - SURFACE
      ?auto_2195205 - SURFACE
      ?auto_2195207 - SURFACE
      ?auto_2195208 - SURFACE
      ?auto_2195209 - SURFACE
      ?auto_2195210 - SURFACE
      ?auto_2195211 - SURFACE
      ?auto_2195212 - SURFACE
    )
    :vars
    (
      ?auto_2195215 - HOIST
      ?auto_2195213 - PLACE
      ?auto_2195219 - PLACE
      ?auto_2195214 - HOIST
      ?auto_2195217 - SURFACE
      ?auto_2195216 - SURFACE
      ?auto_2195218 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195215 ?auto_2195213 ) ( IS-CRATE ?auto_2195212 ) ( not ( = ?auto_2195211 ?auto_2195212 ) ) ( not ( = ?auto_2195210 ?auto_2195211 ) ) ( not ( = ?auto_2195210 ?auto_2195212 ) ) ( not ( = ?auto_2195219 ?auto_2195213 ) ) ( HOIST-AT ?auto_2195214 ?auto_2195219 ) ( not ( = ?auto_2195215 ?auto_2195214 ) ) ( SURFACE-AT ?auto_2195212 ?auto_2195219 ) ( ON ?auto_2195212 ?auto_2195217 ) ( CLEAR ?auto_2195212 ) ( not ( = ?auto_2195211 ?auto_2195217 ) ) ( not ( = ?auto_2195212 ?auto_2195217 ) ) ( not ( = ?auto_2195210 ?auto_2195217 ) ) ( SURFACE-AT ?auto_2195210 ?auto_2195213 ) ( CLEAR ?auto_2195210 ) ( IS-CRATE ?auto_2195211 ) ( AVAILABLE ?auto_2195215 ) ( AVAILABLE ?auto_2195214 ) ( SURFACE-AT ?auto_2195211 ?auto_2195219 ) ( ON ?auto_2195211 ?auto_2195216 ) ( CLEAR ?auto_2195211 ) ( not ( = ?auto_2195211 ?auto_2195216 ) ) ( not ( = ?auto_2195212 ?auto_2195216 ) ) ( not ( = ?auto_2195210 ?auto_2195216 ) ) ( not ( = ?auto_2195217 ?auto_2195216 ) ) ( TRUCK-AT ?auto_2195218 ?auto_2195213 ) ( ON ?auto_2195203 ?auto_2195202 ) ( ON ?auto_2195204 ?auto_2195203 ) ( ON ?auto_2195206 ?auto_2195204 ) ( ON ?auto_2195205 ?auto_2195206 ) ( ON ?auto_2195207 ?auto_2195205 ) ( ON ?auto_2195208 ?auto_2195207 ) ( ON ?auto_2195209 ?auto_2195208 ) ( ON ?auto_2195210 ?auto_2195209 ) ( not ( = ?auto_2195202 ?auto_2195203 ) ) ( not ( = ?auto_2195202 ?auto_2195204 ) ) ( not ( = ?auto_2195202 ?auto_2195206 ) ) ( not ( = ?auto_2195202 ?auto_2195205 ) ) ( not ( = ?auto_2195202 ?auto_2195207 ) ) ( not ( = ?auto_2195202 ?auto_2195208 ) ) ( not ( = ?auto_2195202 ?auto_2195209 ) ) ( not ( = ?auto_2195202 ?auto_2195210 ) ) ( not ( = ?auto_2195202 ?auto_2195211 ) ) ( not ( = ?auto_2195202 ?auto_2195212 ) ) ( not ( = ?auto_2195202 ?auto_2195217 ) ) ( not ( = ?auto_2195202 ?auto_2195216 ) ) ( not ( = ?auto_2195203 ?auto_2195204 ) ) ( not ( = ?auto_2195203 ?auto_2195206 ) ) ( not ( = ?auto_2195203 ?auto_2195205 ) ) ( not ( = ?auto_2195203 ?auto_2195207 ) ) ( not ( = ?auto_2195203 ?auto_2195208 ) ) ( not ( = ?auto_2195203 ?auto_2195209 ) ) ( not ( = ?auto_2195203 ?auto_2195210 ) ) ( not ( = ?auto_2195203 ?auto_2195211 ) ) ( not ( = ?auto_2195203 ?auto_2195212 ) ) ( not ( = ?auto_2195203 ?auto_2195217 ) ) ( not ( = ?auto_2195203 ?auto_2195216 ) ) ( not ( = ?auto_2195204 ?auto_2195206 ) ) ( not ( = ?auto_2195204 ?auto_2195205 ) ) ( not ( = ?auto_2195204 ?auto_2195207 ) ) ( not ( = ?auto_2195204 ?auto_2195208 ) ) ( not ( = ?auto_2195204 ?auto_2195209 ) ) ( not ( = ?auto_2195204 ?auto_2195210 ) ) ( not ( = ?auto_2195204 ?auto_2195211 ) ) ( not ( = ?auto_2195204 ?auto_2195212 ) ) ( not ( = ?auto_2195204 ?auto_2195217 ) ) ( not ( = ?auto_2195204 ?auto_2195216 ) ) ( not ( = ?auto_2195206 ?auto_2195205 ) ) ( not ( = ?auto_2195206 ?auto_2195207 ) ) ( not ( = ?auto_2195206 ?auto_2195208 ) ) ( not ( = ?auto_2195206 ?auto_2195209 ) ) ( not ( = ?auto_2195206 ?auto_2195210 ) ) ( not ( = ?auto_2195206 ?auto_2195211 ) ) ( not ( = ?auto_2195206 ?auto_2195212 ) ) ( not ( = ?auto_2195206 ?auto_2195217 ) ) ( not ( = ?auto_2195206 ?auto_2195216 ) ) ( not ( = ?auto_2195205 ?auto_2195207 ) ) ( not ( = ?auto_2195205 ?auto_2195208 ) ) ( not ( = ?auto_2195205 ?auto_2195209 ) ) ( not ( = ?auto_2195205 ?auto_2195210 ) ) ( not ( = ?auto_2195205 ?auto_2195211 ) ) ( not ( = ?auto_2195205 ?auto_2195212 ) ) ( not ( = ?auto_2195205 ?auto_2195217 ) ) ( not ( = ?auto_2195205 ?auto_2195216 ) ) ( not ( = ?auto_2195207 ?auto_2195208 ) ) ( not ( = ?auto_2195207 ?auto_2195209 ) ) ( not ( = ?auto_2195207 ?auto_2195210 ) ) ( not ( = ?auto_2195207 ?auto_2195211 ) ) ( not ( = ?auto_2195207 ?auto_2195212 ) ) ( not ( = ?auto_2195207 ?auto_2195217 ) ) ( not ( = ?auto_2195207 ?auto_2195216 ) ) ( not ( = ?auto_2195208 ?auto_2195209 ) ) ( not ( = ?auto_2195208 ?auto_2195210 ) ) ( not ( = ?auto_2195208 ?auto_2195211 ) ) ( not ( = ?auto_2195208 ?auto_2195212 ) ) ( not ( = ?auto_2195208 ?auto_2195217 ) ) ( not ( = ?auto_2195208 ?auto_2195216 ) ) ( not ( = ?auto_2195209 ?auto_2195210 ) ) ( not ( = ?auto_2195209 ?auto_2195211 ) ) ( not ( = ?auto_2195209 ?auto_2195212 ) ) ( not ( = ?auto_2195209 ?auto_2195217 ) ) ( not ( = ?auto_2195209 ?auto_2195216 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195210 ?auto_2195211 ?auto_2195212 )
      ( MAKE-10CRATE-VERIFY ?auto_2195202 ?auto_2195203 ?auto_2195204 ?auto_2195206 ?auto_2195205 ?auto_2195207 ?auto_2195208 ?auto_2195209 ?auto_2195210 ?auto_2195211 ?auto_2195212 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2195220 - SURFACE
      ?auto_2195221 - SURFACE
      ?auto_2195222 - SURFACE
      ?auto_2195224 - SURFACE
      ?auto_2195223 - SURFACE
      ?auto_2195225 - SURFACE
      ?auto_2195226 - SURFACE
      ?auto_2195227 - SURFACE
      ?auto_2195228 - SURFACE
      ?auto_2195229 - SURFACE
      ?auto_2195230 - SURFACE
      ?auto_2195231 - SURFACE
    )
    :vars
    (
      ?auto_2195234 - HOIST
      ?auto_2195232 - PLACE
      ?auto_2195238 - PLACE
      ?auto_2195233 - HOIST
      ?auto_2195236 - SURFACE
      ?auto_2195235 - SURFACE
      ?auto_2195237 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195234 ?auto_2195232 ) ( IS-CRATE ?auto_2195231 ) ( not ( = ?auto_2195230 ?auto_2195231 ) ) ( not ( = ?auto_2195229 ?auto_2195230 ) ) ( not ( = ?auto_2195229 ?auto_2195231 ) ) ( not ( = ?auto_2195238 ?auto_2195232 ) ) ( HOIST-AT ?auto_2195233 ?auto_2195238 ) ( not ( = ?auto_2195234 ?auto_2195233 ) ) ( SURFACE-AT ?auto_2195231 ?auto_2195238 ) ( ON ?auto_2195231 ?auto_2195236 ) ( CLEAR ?auto_2195231 ) ( not ( = ?auto_2195230 ?auto_2195236 ) ) ( not ( = ?auto_2195231 ?auto_2195236 ) ) ( not ( = ?auto_2195229 ?auto_2195236 ) ) ( SURFACE-AT ?auto_2195229 ?auto_2195232 ) ( CLEAR ?auto_2195229 ) ( IS-CRATE ?auto_2195230 ) ( AVAILABLE ?auto_2195234 ) ( AVAILABLE ?auto_2195233 ) ( SURFACE-AT ?auto_2195230 ?auto_2195238 ) ( ON ?auto_2195230 ?auto_2195235 ) ( CLEAR ?auto_2195230 ) ( not ( = ?auto_2195230 ?auto_2195235 ) ) ( not ( = ?auto_2195231 ?auto_2195235 ) ) ( not ( = ?auto_2195229 ?auto_2195235 ) ) ( not ( = ?auto_2195236 ?auto_2195235 ) ) ( TRUCK-AT ?auto_2195237 ?auto_2195232 ) ( ON ?auto_2195221 ?auto_2195220 ) ( ON ?auto_2195222 ?auto_2195221 ) ( ON ?auto_2195224 ?auto_2195222 ) ( ON ?auto_2195223 ?auto_2195224 ) ( ON ?auto_2195225 ?auto_2195223 ) ( ON ?auto_2195226 ?auto_2195225 ) ( ON ?auto_2195227 ?auto_2195226 ) ( ON ?auto_2195228 ?auto_2195227 ) ( ON ?auto_2195229 ?auto_2195228 ) ( not ( = ?auto_2195220 ?auto_2195221 ) ) ( not ( = ?auto_2195220 ?auto_2195222 ) ) ( not ( = ?auto_2195220 ?auto_2195224 ) ) ( not ( = ?auto_2195220 ?auto_2195223 ) ) ( not ( = ?auto_2195220 ?auto_2195225 ) ) ( not ( = ?auto_2195220 ?auto_2195226 ) ) ( not ( = ?auto_2195220 ?auto_2195227 ) ) ( not ( = ?auto_2195220 ?auto_2195228 ) ) ( not ( = ?auto_2195220 ?auto_2195229 ) ) ( not ( = ?auto_2195220 ?auto_2195230 ) ) ( not ( = ?auto_2195220 ?auto_2195231 ) ) ( not ( = ?auto_2195220 ?auto_2195236 ) ) ( not ( = ?auto_2195220 ?auto_2195235 ) ) ( not ( = ?auto_2195221 ?auto_2195222 ) ) ( not ( = ?auto_2195221 ?auto_2195224 ) ) ( not ( = ?auto_2195221 ?auto_2195223 ) ) ( not ( = ?auto_2195221 ?auto_2195225 ) ) ( not ( = ?auto_2195221 ?auto_2195226 ) ) ( not ( = ?auto_2195221 ?auto_2195227 ) ) ( not ( = ?auto_2195221 ?auto_2195228 ) ) ( not ( = ?auto_2195221 ?auto_2195229 ) ) ( not ( = ?auto_2195221 ?auto_2195230 ) ) ( not ( = ?auto_2195221 ?auto_2195231 ) ) ( not ( = ?auto_2195221 ?auto_2195236 ) ) ( not ( = ?auto_2195221 ?auto_2195235 ) ) ( not ( = ?auto_2195222 ?auto_2195224 ) ) ( not ( = ?auto_2195222 ?auto_2195223 ) ) ( not ( = ?auto_2195222 ?auto_2195225 ) ) ( not ( = ?auto_2195222 ?auto_2195226 ) ) ( not ( = ?auto_2195222 ?auto_2195227 ) ) ( not ( = ?auto_2195222 ?auto_2195228 ) ) ( not ( = ?auto_2195222 ?auto_2195229 ) ) ( not ( = ?auto_2195222 ?auto_2195230 ) ) ( not ( = ?auto_2195222 ?auto_2195231 ) ) ( not ( = ?auto_2195222 ?auto_2195236 ) ) ( not ( = ?auto_2195222 ?auto_2195235 ) ) ( not ( = ?auto_2195224 ?auto_2195223 ) ) ( not ( = ?auto_2195224 ?auto_2195225 ) ) ( not ( = ?auto_2195224 ?auto_2195226 ) ) ( not ( = ?auto_2195224 ?auto_2195227 ) ) ( not ( = ?auto_2195224 ?auto_2195228 ) ) ( not ( = ?auto_2195224 ?auto_2195229 ) ) ( not ( = ?auto_2195224 ?auto_2195230 ) ) ( not ( = ?auto_2195224 ?auto_2195231 ) ) ( not ( = ?auto_2195224 ?auto_2195236 ) ) ( not ( = ?auto_2195224 ?auto_2195235 ) ) ( not ( = ?auto_2195223 ?auto_2195225 ) ) ( not ( = ?auto_2195223 ?auto_2195226 ) ) ( not ( = ?auto_2195223 ?auto_2195227 ) ) ( not ( = ?auto_2195223 ?auto_2195228 ) ) ( not ( = ?auto_2195223 ?auto_2195229 ) ) ( not ( = ?auto_2195223 ?auto_2195230 ) ) ( not ( = ?auto_2195223 ?auto_2195231 ) ) ( not ( = ?auto_2195223 ?auto_2195236 ) ) ( not ( = ?auto_2195223 ?auto_2195235 ) ) ( not ( = ?auto_2195225 ?auto_2195226 ) ) ( not ( = ?auto_2195225 ?auto_2195227 ) ) ( not ( = ?auto_2195225 ?auto_2195228 ) ) ( not ( = ?auto_2195225 ?auto_2195229 ) ) ( not ( = ?auto_2195225 ?auto_2195230 ) ) ( not ( = ?auto_2195225 ?auto_2195231 ) ) ( not ( = ?auto_2195225 ?auto_2195236 ) ) ( not ( = ?auto_2195225 ?auto_2195235 ) ) ( not ( = ?auto_2195226 ?auto_2195227 ) ) ( not ( = ?auto_2195226 ?auto_2195228 ) ) ( not ( = ?auto_2195226 ?auto_2195229 ) ) ( not ( = ?auto_2195226 ?auto_2195230 ) ) ( not ( = ?auto_2195226 ?auto_2195231 ) ) ( not ( = ?auto_2195226 ?auto_2195236 ) ) ( not ( = ?auto_2195226 ?auto_2195235 ) ) ( not ( = ?auto_2195227 ?auto_2195228 ) ) ( not ( = ?auto_2195227 ?auto_2195229 ) ) ( not ( = ?auto_2195227 ?auto_2195230 ) ) ( not ( = ?auto_2195227 ?auto_2195231 ) ) ( not ( = ?auto_2195227 ?auto_2195236 ) ) ( not ( = ?auto_2195227 ?auto_2195235 ) ) ( not ( = ?auto_2195228 ?auto_2195229 ) ) ( not ( = ?auto_2195228 ?auto_2195230 ) ) ( not ( = ?auto_2195228 ?auto_2195231 ) ) ( not ( = ?auto_2195228 ?auto_2195236 ) ) ( not ( = ?auto_2195228 ?auto_2195235 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195229 ?auto_2195230 ?auto_2195231 )
      ( MAKE-11CRATE-VERIFY ?auto_2195220 ?auto_2195221 ?auto_2195222 ?auto_2195224 ?auto_2195223 ?auto_2195225 ?auto_2195226 ?auto_2195227 ?auto_2195228 ?auto_2195229 ?auto_2195230 ?auto_2195231 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2195239 - SURFACE
      ?auto_2195240 - SURFACE
      ?auto_2195241 - SURFACE
      ?auto_2195243 - SURFACE
      ?auto_2195242 - SURFACE
      ?auto_2195244 - SURFACE
      ?auto_2195245 - SURFACE
      ?auto_2195246 - SURFACE
      ?auto_2195247 - SURFACE
      ?auto_2195248 - SURFACE
      ?auto_2195249 - SURFACE
      ?auto_2195250 - SURFACE
      ?auto_2195251 - SURFACE
    )
    :vars
    (
      ?auto_2195254 - HOIST
      ?auto_2195252 - PLACE
      ?auto_2195258 - PLACE
      ?auto_2195253 - HOIST
      ?auto_2195256 - SURFACE
      ?auto_2195255 - SURFACE
      ?auto_2195257 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195254 ?auto_2195252 ) ( IS-CRATE ?auto_2195251 ) ( not ( = ?auto_2195250 ?auto_2195251 ) ) ( not ( = ?auto_2195249 ?auto_2195250 ) ) ( not ( = ?auto_2195249 ?auto_2195251 ) ) ( not ( = ?auto_2195258 ?auto_2195252 ) ) ( HOIST-AT ?auto_2195253 ?auto_2195258 ) ( not ( = ?auto_2195254 ?auto_2195253 ) ) ( SURFACE-AT ?auto_2195251 ?auto_2195258 ) ( ON ?auto_2195251 ?auto_2195256 ) ( CLEAR ?auto_2195251 ) ( not ( = ?auto_2195250 ?auto_2195256 ) ) ( not ( = ?auto_2195251 ?auto_2195256 ) ) ( not ( = ?auto_2195249 ?auto_2195256 ) ) ( SURFACE-AT ?auto_2195249 ?auto_2195252 ) ( CLEAR ?auto_2195249 ) ( IS-CRATE ?auto_2195250 ) ( AVAILABLE ?auto_2195254 ) ( AVAILABLE ?auto_2195253 ) ( SURFACE-AT ?auto_2195250 ?auto_2195258 ) ( ON ?auto_2195250 ?auto_2195255 ) ( CLEAR ?auto_2195250 ) ( not ( = ?auto_2195250 ?auto_2195255 ) ) ( not ( = ?auto_2195251 ?auto_2195255 ) ) ( not ( = ?auto_2195249 ?auto_2195255 ) ) ( not ( = ?auto_2195256 ?auto_2195255 ) ) ( TRUCK-AT ?auto_2195257 ?auto_2195252 ) ( ON ?auto_2195240 ?auto_2195239 ) ( ON ?auto_2195241 ?auto_2195240 ) ( ON ?auto_2195243 ?auto_2195241 ) ( ON ?auto_2195242 ?auto_2195243 ) ( ON ?auto_2195244 ?auto_2195242 ) ( ON ?auto_2195245 ?auto_2195244 ) ( ON ?auto_2195246 ?auto_2195245 ) ( ON ?auto_2195247 ?auto_2195246 ) ( ON ?auto_2195248 ?auto_2195247 ) ( ON ?auto_2195249 ?auto_2195248 ) ( not ( = ?auto_2195239 ?auto_2195240 ) ) ( not ( = ?auto_2195239 ?auto_2195241 ) ) ( not ( = ?auto_2195239 ?auto_2195243 ) ) ( not ( = ?auto_2195239 ?auto_2195242 ) ) ( not ( = ?auto_2195239 ?auto_2195244 ) ) ( not ( = ?auto_2195239 ?auto_2195245 ) ) ( not ( = ?auto_2195239 ?auto_2195246 ) ) ( not ( = ?auto_2195239 ?auto_2195247 ) ) ( not ( = ?auto_2195239 ?auto_2195248 ) ) ( not ( = ?auto_2195239 ?auto_2195249 ) ) ( not ( = ?auto_2195239 ?auto_2195250 ) ) ( not ( = ?auto_2195239 ?auto_2195251 ) ) ( not ( = ?auto_2195239 ?auto_2195256 ) ) ( not ( = ?auto_2195239 ?auto_2195255 ) ) ( not ( = ?auto_2195240 ?auto_2195241 ) ) ( not ( = ?auto_2195240 ?auto_2195243 ) ) ( not ( = ?auto_2195240 ?auto_2195242 ) ) ( not ( = ?auto_2195240 ?auto_2195244 ) ) ( not ( = ?auto_2195240 ?auto_2195245 ) ) ( not ( = ?auto_2195240 ?auto_2195246 ) ) ( not ( = ?auto_2195240 ?auto_2195247 ) ) ( not ( = ?auto_2195240 ?auto_2195248 ) ) ( not ( = ?auto_2195240 ?auto_2195249 ) ) ( not ( = ?auto_2195240 ?auto_2195250 ) ) ( not ( = ?auto_2195240 ?auto_2195251 ) ) ( not ( = ?auto_2195240 ?auto_2195256 ) ) ( not ( = ?auto_2195240 ?auto_2195255 ) ) ( not ( = ?auto_2195241 ?auto_2195243 ) ) ( not ( = ?auto_2195241 ?auto_2195242 ) ) ( not ( = ?auto_2195241 ?auto_2195244 ) ) ( not ( = ?auto_2195241 ?auto_2195245 ) ) ( not ( = ?auto_2195241 ?auto_2195246 ) ) ( not ( = ?auto_2195241 ?auto_2195247 ) ) ( not ( = ?auto_2195241 ?auto_2195248 ) ) ( not ( = ?auto_2195241 ?auto_2195249 ) ) ( not ( = ?auto_2195241 ?auto_2195250 ) ) ( not ( = ?auto_2195241 ?auto_2195251 ) ) ( not ( = ?auto_2195241 ?auto_2195256 ) ) ( not ( = ?auto_2195241 ?auto_2195255 ) ) ( not ( = ?auto_2195243 ?auto_2195242 ) ) ( not ( = ?auto_2195243 ?auto_2195244 ) ) ( not ( = ?auto_2195243 ?auto_2195245 ) ) ( not ( = ?auto_2195243 ?auto_2195246 ) ) ( not ( = ?auto_2195243 ?auto_2195247 ) ) ( not ( = ?auto_2195243 ?auto_2195248 ) ) ( not ( = ?auto_2195243 ?auto_2195249 ) ) ( not ( = ?auto_2195243 ?auto_2195250 ) ) ( not ( = ?auto_2195243 ?auto_2195251 ) ) ( not ( = ?auto_2195243 ?auto_2195256 ) ) ( not ( = ?auto_2195243 ?auto_2195255 ) ) ( not ( = ?auto_2195242 ?auto_2195244 ) ) ( not ( = ?auto_2195242 ?auto_2195245 ) ) ( not ( = ?auto_2195242 ?auto_2195246 ) ) ( not ( = ?auto_2195242 ?auto_2195247 ) ) ( not ( = ?auto_2195242 ?auto_2195248 ) ) ( not ( = ?auto_2195242 ?auto_2195249 ) ) ( not ( = ?auto_2195242 ?auto_2195250 ) ) ( not ( = ?auto_2195242 ?auto_2195251 ) ) ( not ( = ?auto_2195242 ?auto_2195256 ) ) ( not ( = ?auto_2195242 ?auto_2195255 ) ) ( not ( = ?auto_2195244 ?auto_2195245 ) ) ( not ( = ?auto_2195244 ?auto_2195246 ) ) ( not ( = ?auto_2195244 ?auto_2195247 ) ) ( not ( = ?auto_2195244 ?auto_2195248 ) ) ( not ( = ?auto_2195244 ?auto_2195249 ) ) ( not ( = ?auto_2195244 ?auto_2195250 ) ) ( not ( = ?auto_2195244 ?auto_2195251 ) ) ( not ( = ?auto_2195244 ?auto_2195256 ) ) ( not ( = ?auto_2195244 ?auto_2195255 ) ) ( not ( = ?auto_2195245 ?auto_2195246 ) ) ( not ( = ?auto_2195245 ?auto_2195247 ) ) ( not ( = ?auto_2195245 ?auto_2195248 ) ) ( not ( = ?auto_2195245 ?auto_2195249 ) ) ( not ( = ?auto_2195245 ?auto_2195250 ) ) ( not ( = ?auto_2195245 ?auto_2195251 ) ) ( not ( = ?auto_2195245 ?auto_2195256 ) ) ( not ( = ?auto_2195245 ?auto_2195255 ) ) ( not ( = ?auto_2195246 ?auto_2195247 ) ) ( not ( = ?auto_2195246 ?auto_2195248 ) ) ( not ( = ?auto_2195246 ?auto_2195249 ) ) ( not ( = ?auto_2195246 ?auto_2195250 ) ) ( not ( = ?auto_2195246 ?auto_2195251 ) ) ( not ( = ?auto_2195246 ?auto_2195256 ) ) ( not ( = ?auto_2195246 ?auto_2195255 ) ) ( not ( = ?auto_2195247 ?auto_2195248 ) ) ( not ( = ?auto_2195247 ?auto_2195249 ) ) ( not ( = ?auto_2195247 ?auto_2195250 ) ) ( not ( = ?auto_2195247 ?auto_2195251 ) ) ( not ( = ?auto_2195247 ?auto_2195256 ) ) ( not ( = ?auto_2195247 ?auto_2195255 ) ) ( not ( = ?auto_2195248 ?auto_2195249 ) ) ( not ( = ?auto_2195248 ?auto_2195250 ) ) ( not ( = ?auto_2195248 ?auto_2195251 ) ) ( not ( = ?auto_2195248 ?auto_2195256 ) ) ( not ( = ?auto_2195248 ?auto_2195255 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195249 ?auto_2195250 ?auto_2195251 )
      ( MAKE-12CRATE-VERIFY ?auto_2195239 ?auto_2195240 ?auto_2195241 ?auto_2195243 ?auto_2195242 ?auto_2195244 ?auto_2195245 ?auto_2195246 ?auto_2195247 ?auto_2195248 ?auto_2195249 ?auto_2195250 ?auto_2195251 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2195259 - SURFACE
      ?auto_2195260 - SURFACE
      ?auto_2195261 - SURFACE
      ?auto_2195263 - SURFACE
      ?auto_2195262 - SURFACE
      ?auto_2195264 - SURFACE
      ?auto_2195265 - SURFACE
      ?auto_2195266 - SURFACE
      ?auto_2195267 - SURFACE
      ?auto_2195268 - SURFACE
      ?auto_2195269 - SURFACE
      ?auto_2195270 - SURFACE
      ?auto_2195271 - SURFACE
      ?auto_2195272 - SURFACE
    )
    :vars
    (
      ?auto_2195275 - HOIST
      ?auto_2195273 - PLACE
      ?auto_2195279 - PLACE
      ?auto_2195274 - HOIST
      ?auto_2195277 - SURFACE
      ?auto_2195276 - SURFACE
      ?auto_2195278 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195275 ?auto_2195273 ) ( IS-CRATE ?auto_2195272 ) ( not ( = ?auto_2195271 ?auto_2195272 ) ) ( not ( = ?auto_2195270 ?auto_2195271 ) ) ( not ( = ?auto_2195270 ?auto_2195272 ) ) ( not ( = ?auto_2195279 ?auto_2195273 ) ) ( HOIST-AT ?auto_2195274 ?auto_2195279 ) ( not ( = ?auto_2195275 ?auto_2195274 ) ) ( SURFACE-AT ?auto_2195272 ?auto_2195279 ) ( ON ?auto_2195272 ?auto_2195277 ) ( CLEAR ?auto_2195272 ) ( not ( = ?auto_2195271 ?auto_2195277 ) ) ( not ( = ?auto_2195272 ?auto_2195277 ) ) ( not ( = ?auto_2195270 ?auto_2195277 ) ) ( SURFACE-AT ?auto_2195270 ?auto_2195273 ) ( CLEAR ?auto_2195270 ) ( IS-CRATE ?auto_2195271 ) ( AVAILABLE ?auto_2195275 ) ( AVAILABLE ?auto_2195274 ) ( SURFACE-AT ?auto_2195271 ?auto_2195279 ) ( ON ?auto_2195271 ?auto_2195276 ) ( CLEAR ?auto_2195271 ) ( not ( = ?auto_2195271 ?auto_2195276 ) ) ( not ( = ?auto_2195272 ?auto_2195276 ) ) ( not ( = ?auto_2195270 ?auto_2195276 ) ) ( not ( = ?auto_2195277 ?auto_2195276 ) ) ( TRUCK-AT ?auto_2195278 ?auto_2195273 ) ( ON ?auto_2195260 ?auto_2195259 ) ( ON ?auto_2195261 ?auto_2195260 ) ( ON ?auto_2195263 ?auto_2195261 ) ( ON ?auto_2195262 ?auto_2195263 ) ( ON ?auto_2195264 ?auto_2195262 ) ( ON ?auto_2195265 ?auto_2195264 ) ( ON ?auto_2195266 ?auto_2195265 ) ( ON ?auto_2195267 ?auto_2195266 ) ( ON ?auto_2195268 ?auto_2195267 ) ( ON ?auto_2195269 ?auto_2195268 ) ( ON ?auto_2195270 ?auto_2195269 ) ( not ( = ?auto_2195259 ?auto_2195260 ) ) ( not ( = ?auto_2195259 ?auto_2195261 ) ) ( not ( = ?auto_2195259 ?auto_2195263 ) ) ( not ( = ?auto_2195259 ?auto_2195262 ) ) ( not ( = ?auto_2195259 ?auto_2195264 ) ) ( not ( = ?auto_2195259 ?auto_2195265 ) ) ( not ( = ?auto_2195259 ?auto_2195266 ) ) ( not ( = ?auto_2195259 ?auto_2195267 ) ) ( not ( = ?auto_2195259 ?auto_2195268 ) ) ( not ( = ?auto_2195259 ?auto_2195269 ) ) ( not ( = ?auto_2195259 ?auto_2195270 ) ) ( not ( = ?auto_2195259 ?auto_2195271 ) ) ( not ( = ?auto_2195259 ?auto_2195272 ) ) ( not ( = ?auto_2195259 ?auto_2195277 ) ) ( not ( = ?auto_2195259 ?auto_2195276 ) ) ( not ( = ?auto_2195260 ?auto_2195261 ) ) ( not ( = ?auto_2195260 ?auto_2195263 ) ) ( not ( = ?auto_2195260 ?auto_2195262 ) ) ( not ( = ?auto_2195260 ?auto_2195264 ) ) ( not ( = ?auto_2195260 ?auto_2195265 ) ) ( not ( = ?auto_2195260 ?auto_2195266 ) ) ( not ( = ?auto_2195260 ?auto_2195267 ) ) ( not ( = ?auto_2195260 ?auto_2195268 ) ) ( not ( = ?auto_2195260 ?auto_2195269 ) ) ( not ( = ?auto_2195260 ?auto_2195270 ) ) ( not ( = ?auto_2195260 ?auto_2195271 ) ) ( not ( = ?auto_2195260 ?auto_2195272 ) ) ( not ( = ?auto_2195260 ?auto_2195277 ) ) ( not ( = ?auto_2195260 ?auto_2195276 ) ) ( not ( = ?auto_2195261 ?auto_2195263 ) ) ( not ( = ?auto_2195261 ?auto_2195262 ) ) ( not ( = ?auto_2195261 ?auto_2195264 ) ) ( not ( = ?auto_2195261 ?auto_2195265 ) ) ( not ( = ?auto_2195261 ?auto_2195266 ) ) ( not ( = ?auto_2195261 ?auto_2195267 ) ) ( not ( = ?auto_2195261 ?auto_2195268 ) ) ( not ( = ?auto_2195261 ?auto_2195269 ) ) ( not ( = ?auto_2195261 ?auto_2195270 ) ) ( not ( = ?auto_2195261 ?auto_2195271 ) ) ( not ( = ?auto_2195261 ?auto_2195272 ) ) ( not ( = ?auto_2195261 ?auto_2195277 ) ) ( not ( = ?auto_2195261 ?auto_2195276 ) ) ( not ( = ?auto_2195263 ?auto_2195262 ) ) ( not ( = ?auto_2195263 ?auto_2195264 ) ) ( not ( = ?auto_2195263 ?auto_2195265 ) ) ( not ( = ?auto_2195263 ?auto_2195266 ) ) ( not ( = ?auto_2195263 ?auto_2195267 ) ) ( not ( = ?auto_2195263 ?auto_2195268 ) ) ( not ( = ?auto_2195263 ?auto_2195269 ) ) ( not ( = ?auto_2195263 ?auto_2195270 ) ) ( not ( = ?auto_2195263 ?auto_2195271 ) ) ( not ( = ?auto_2195263 ?auto_2195272 ) ) ( not ( = ?auto_2195263 ?auto_2195277 ) ) ( not ( = ?auto_2195263 ?auto_2195276 ) ) ( not ( = ?auto_2195262 ?auto_2195264 ) ) ( not ( = ?auto_2195262 ?auto_2195265 ) ) ( not ( = ?auto_2195262 ?auto_2195266 ) ) ( not ( = ?auto_2195262 ?auto_2195267 ) ) ( not ( = ?auto_2195262 ?auto_2195268 ) ) ( not ( = ?auto_2195262 ?auto_2195269 ) ) ( not ( = ?auto_2195262 ?auto_2195270 ) ) ( not ( = ?auto_2195262 ?auto_2195271 ) ) ( not ( = ?auto_2195262 ?auto_2195272 ) ) ( not ( = ?auto_2195262 ?auto_2195277 ) ) ( not ( = ?auto_2195262 ?auto_2195276 ) ) ( not ( = ?auto_2195264 ?auto_2195265 ) ) ( not ( = ?auto_2195264 ?auto_2195266 ) ) ( not ( = ?auto_2195264 ?auto_2195267 ) ) ( not ( = ?auto_2195264 ?auto_2195268 ) ) ( not ( = ?auto_2195264 ?auto_2195269 ) ) ( not ( = ?auto_2195264 ?auto_2195270 ) ) ( not ( = ?auto_2195264 ?auto_2195271 ) ) ( not ( = ?auto_2195264 ?auto_2195272 ) ) ( not ( = ?auto_2195264 ?auto_2195277 ) ) ( not ( = ?auto_2195264 ?auto_2195276 ) ) ( not ( = ?auto_2195265 ?auto_2195266 ) ) ( not ( = ?auto_2195265 ?auto_2195267 ) ) ( not ( = ?auto_2195265 ?auto_2195268 ) ) ( not ( = ?auto_2195265 ?auto_2195269 ) ) ( not ( = ?auto_2195265 ?auto_2195270 ) ) ( not ( = ?auto_2195265 ?auto_2195271 ) ) ( not ( = ?auto_2195265 ?auto_2195272 ) ) ( not ( = ?auto_2195265 ?auto_2195277 ) ) ( not ( = ?auto_2195265 ?auto_2195276 ) ) ( not ( = ?auto_2195266 ?auto_2195267 ) ) ( not ( = ?auto_2195266 ?auto_2195268 ) ) ( not ( = ?auto_2195266 ?auto_2195269 ) ) ( not ( = ?auto_2195266 ?auto_2195270 ) ) ( not ( = ?auto_2195266 ?auto_2195271 ) ) ( not ( = ?auto_2195266 ?auto_2195272 ) ) ( not ( = ?auto_2195266 ?auto_2195277 ) ) ( not ( = ?auto_2195266 ?auto_2195276 ) ) ( not ( = ?auto_2195267 ?auto_2195268 ) ) ( not ( = ?auto_2195267 ?auto_2195269 ) ) ( not ( = ?auto_2195267 ?auto_2195270 ) ) ( not ( = ?auto_2195267 ?auto_2195271 ) ) ( not ( = ?auto_2195267 ?auto_2195272 ) ) ( not ( = ?auto_2195267 ?auto_2195277 ) ) ( not ( = ?auto_2195267 ?auto_2195276 ) ) ( not ( = ?auto_2195268 ?auto_2195269 ) ) ( not ( = ?auto_2195268 ?auto_2195270 ) ) ( not ( = ?auto_2195268 ?auto_2195271 ) ) ( not ( = ?auto_2195268 ?auto_2195272 ) ) ( not ( = ?auto_2195268 ?auto_2195277 ) ) ( not ( = ?auto_2195268 ?auto_2195276 ) ) ( not ( = ?auto_2195269 ?auto_2195270 ) ) ( not ( = ?auto_2195269 ?auto_2195271 ) ) ( not ( = ?auto_2195269 ?auto_2195272 ) ) ( not ( = ?auto_2195269 ?auto_2195277 ) ) ( not ( = ?auto_2195269 ?auto_2195276 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195270 ?auto_2195271 ?auto_2195272 )
      ( MAKE-13CRATE-VERIFY ?auto_2195259 ?auto_2195260 ?auto_2195261 ?auto_2195263 ?auto_2195262 ?auto_2195264 ?auto_2195265 ?auto_2195266 ?auto_2195267 ?auto_2195268 ?auto_2195269 ?auto_2195270 ?auto_2195271 ?auto_2195272 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2195280 - SURFACE
      ?auto_2195281 - SURFACE
      ?auto_2195282 - SURFACE
      ?auto_2195284 - SURFACE
      ?auto_2195283 - SURFACE
      ?auto_2195285 - SURFACE
      ?auto_2195286 - SURFACE
      ?auto_2195287 - SURFACE
      ?auto_2195288 - SURFACE
      ?auto_2195289 - SURFACE
      ?auto_2195290 - SURFACE
      ?auto_2195291 - SURFACE
      ?auto_2195292 - SURFACE
      ?auto_2195293 - SURFACE
      ?auto_2195294 - SURFACE
    )
    :vars
    (
      ?auto_2195297 - HOIST
      ?auto_2195295 - PLACE
      ?auto_2195301 - PLACE
      ?auto_2195296 - HOIST
      ?auto_2195299 - SURFACE
      ?auto_2195298 - SURFACE
      ?auto_2195300 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195297 ?auto_2195295 ) ( IS-CRATE ?auto_2195294 ) ( not ( = ?auto_2195293 ?auto_2195294 ) ) ( not ( = ?auto_2195292 ?auto_2195293 ) ) ( not ( = ?auto_2195292 ?auto_2195294 ) ) ( not ( = ?auto_2195301 ?auto_2195295 ) ) ( HOIST-AT ?auto_2195296 ?auto_2195301 ) ( not ( = ?auto_2195297 ?auto_2195296 ) ) ( SURFACE-AT ?auto_2195294 ?auto_2195301 ) ( ON ?auto_2195294 ?auto_2195299 ) ( CLEAR ?auto_2195294 ) ( not ( = ?auto_2195293 ?auto_2195299 ) ) ( not ( = ?auto_2195294 ?auto_2195299 ) ) ( not ( = ?auto_2195292 ?auto_2195299 ) ) ( SURFACE-AT ?auto_2195292 ?auto_2195295 ) ( CLEAR ?auto_2195292 ) ( IS-CRATE ?auto_2195293 ) ( AVAILABLE ?auto_2195297 ) ( AVAILABLE ?auto_2195296 ) ( SURFACE-AT ?auto_2195293 ?auto_2195301 ) ( ON ?auto_2195293 ?auto_2195298 ) ( CLEAR ?auto_2195293 ) ( not ( = ?auto_2195293 ?auto_2195298 ) ) ( not ( = ?auto_2195294 ?auto_2195298 ) ) ( not ( = ?auto_2195292 ?auto_2195298 ) ) ( not ( = ?auto_2195299 ?auto_2195298 ) ) ( TRUCK-AT ?auto_2195300 ?auto_2195295 ) ( ON ?auto_2195281 ?auto_2195280 ) ( ON ?auto_2195282 ?auto_2195281 ) ( ON ?auto_2195284 ?auto_2195282 ) ( ON ?auto_2195283 ?auto_2195284 ) ( ON ?auto_2195285 ?auto_2195283 ) ( ON ?auto_2195286 ?auto_2195285 ) ( ON ?auto_2195287 ?auto_2195286 ) ( ON ?auto_2195288 ?auto_2195287 ) ( ON ?auto_2195289 ?auto_2195288 ) ( ON ?auto_2195290 ?auto_2195289 ) ( ON ?auto_2195291 ?auto_2195290 ) ( ON ?auto_2195292 ?auto_2195291 ) ( not ( = ?auto_2195280 ?auto_2195281 ) ) ( not ( = ?auto_2195280 ?auto_2195282 ) ) ( not ( = ?auto_2195280 ?auto_2195284 ) ) ( not ( = ?auto_2195280 ?auto_2195283 ) ) ( not ( = ?auto_2195280 ?auto_2195285 ) ) ( not ( = ?auto_2195280 ?auto_2195286 ) ) ( not ( = ?auto_2195280 ?auto_2195287 ) ) ( not ( = ?auto_2195280 ?auto_2195288 ) ) ( not ( = ?auto_2195280 ?auto_2195289 ) ) ( not ( = ?auto_2195280 ?auto_2195290 ) ) ( not ( = ?auto_2195280 ?auto_2195291 ) ) ( not ( = ?auto_2195280 ?auto_2195292 ) ) ( not ( = ?auto_2195280 ?auto_2195293 ) ) ( not ( = ?auto_2195280 ?auto_2195294 ) ) ( not ( = ?auto_2195280 ?auto_2195299 ) ) ( not ( = ?auto_2195280 ?auto_2195298 ) ) ( not ( = ?auto_2195281 ?auto_2195282 ) ) ( not ( = ?auto_2195281 ?auto_2195284 ) ) ( not ( = ?auto_2195281 ?auto_2195283 ) ) ( not ( = ?auto_2195281 ?auto_2195285 ) ) ( not ( = ?auto_2195281 ?auto_2195286 ) ) ( not ( = ?auto_2195281 ?auto_2195287 ) ) ( not ( = ?auto_2195281 ?auto_2195288 ) ) ( not ( = ?auto_2195281 ?auto_2195289 ) ) ( not ( = ?auto_2195281 ?auto_2195290 ) ) ( not ( = ?auto_2195281 ?auto_2195291 ) ) ( not ( = ?auto_2195281 ?auto_2195292 ) ) ( not ( = ?auto_2195281 ?auto_2195293 ) ) ( not ( = ?auto_2195281 ?auto_2195294 ) ) ( not ( = ?auto_2195281 ?auto_2195299 ) ) ( not ( = ?auto_2195281 ?auto_2195298 ) ) ( not ( = ?auto_2195282 ?auto_2195284 ) ) ( not ( = ?auto_2195282 ?auto_2195283 ) ) ( not ( = ?auto_2195282 ?auto_2195285 ) ) ( not ( = ?auto_2195282 ?auto_2195286 ) ) ( not ( = ?auto_2195282 ?auto_2195287 ) ) ( not ( = ?auto_2195282 ?auto_2195288 ) ) ( not ( = ?auto_2195282 ?auto_2195289 ) ) ( not ( = ?auto_2195282 ?auto_2195290 ) ) ( not ( = ?auto_2195282 ?auto_2195291 ) ) ( not ( = ?auto_2195282 ?auto_2195292 ) ) ( not ( = ?auto_2195282 ?auto_2195293 ) ) ( not ( = ?auto_2195282 ?auto_2195294 ) ) ( not ( = ?auto_2195282 ?auto_2195299 ) ) ( not ( = ?auto_2195282 ?auto_2195298 ) ) ( not ( = ?auto_2195284 ?auto_2195283 ) ) ( not ( = ?auto_2195284 ?auto_2195285 ) ) ( not ( = ?auto_2195284 ?auto_2195286 ) ) ( not ( = ?auto_2195284 ?auto_2195287 ) ) ( not ( = ?auto_2195284 ?auto_2195288 ) ) ( not ( = ?auto_2195284 ?auto_2195289 ) ) ( not ( = ?auto_2195284 ?auto_2195290 ) ) ( not ( = ?auto_2195284 ?auto_2195291 ) ) ( not ( = ?auto_2195284 ?auto_2195292 ) ) ( not ( = ?auto_2195284 ?auto_2195293 ) ) ( not ( = ?auto_2195284 ?auto_2195294 ) ) ( not ( = ?auto_2195284 ?auto_2195299 ) ) ( not ( = ?auto_2195284 ?auto_2195298 ) ) ( not ( = ?auto_2195283 ?auto_2195285 ) ) ( not ( = ?auto_2195283 ?auto_2195286 ) ) ( not ( = ?auto_2195283 ?auto_2195287 ) ) ( not ( = ?auto_2195283 ?auto_2195288 ) ) ( not ( = ?auto_2195283 ?auto_2195289 ) ) ( not ( = ?auto_2195283 ?auto_2195290 ) ) ( not ( = ?auto_2195283 ?auto_2195291 ) ) ( not ( = ?auto_2195283 ?auto_2195292 ) ) ( not ( = ?auto_2195283 ?auto_2195293 ) ) ( not ( = ?auto_2195283 ?auto_2195294 ) ) ( not ( = ?auto_2195283 ?auto_2195299 ) ) ( not ( = ?auto_2195283 ?auto_2195298 ) ) ( not ( = ?auto_2195285 ?auto_2195286 ) ) ( not ( = ?auto_2195285 ?auto_2195287 ) ) ( not ( = ?auto_2195285 ?auto_2195288 ) ) ( not ( = ?auto_2195285 ?auto_2195289 ) ) ( not ( = ?auto_2195285 ?auto_2195290 ) ) ( not ( = ?auto_2195285 ?auto_2195291 ) ) ( not ( = ?auto_2195285 ?auto_2195292 ) ) ( not ( = ?auto_2195285 ?auto_2195293 ) ) ( not ( = ?auto_2195285 ?auto_2195294 ) ) ( not ( = ?auto_2195285 ?auto_2195299 ) ) ( not ( = ?auto_2195285 ?auto_2195298 ) ) ( not ( = ?auto_2195286 ?auto_2195287 ) ) ( not ( = ?auto_2195286 ?auto_2195288 ) ) ( not ( = ?auto_2195286 ?auto_2195289 ) ) ( not ( = ?auto_2195286 ?auto_2195290 ) ) ( not ( = ?auto_2195286 ?auto_2195291 ) ) ( not ( = ?auto_2195286 ?auto_2195292 ) ) ( not ( = ?auto_2195286 ?auto_2195293 ) ) ( not ( = ?auto_2195286 ?auto_2195294 ) ) ( not ( = ?auto_2195286 ?auto_2195299 ) ) ( not ( = ?auto_2195286 ?auto_2195298 ) ) ( not ( = ?auto_2195287 ?auto_2195288 ) ) ( not ( = ?auto_2195287 ?auto_2195289 ) ) ( not ( = ?auto_2195287 ?auto_2195290 ) ) ( not ( = ?auto_2195287 ?auto_2195291 ) ) ( not ( = ?auto_2195287 ?auto_2195292 ) ) ( not ( = ?auto_2195287 ?auto_2195293 ) ) ( not ( = ?auto_2195287 ?auto_2195294 ) ) ( not ( = ?auto_2195287 ?auto_2195299 ) ) ( not ( = ?auto_2195287 ?auto_2195298 ) ) ( not ( = ?auto_2195288 ?auto_2195289 ) ) ( not ( = ?auto_2195288 ?auto_2195290 ) ) ( not ( = ?auto_2195288 ?auto_2195291 ) ) ( not ( = ?auto_2195288 ?auto_2195292 ) ) ( not ( = ?auto_2195288 ?auto_2195293 ) ) ( not ( = ?auto_2195288 ?auto_2195294 ) ) ( not ( = ?auto_2195288 ?auto_2195299 ) ) ( not ( = ?auto_2195288 ?auto_2195298 ) ) ( not ( = ?auto_2195289 ?auto_2195290 ) ) ( not ( = ?auto_2195289 ?auto_2195291 ) ) ( not ( = ?auto_2195289 ?auto_2195292 ) ) ( not ( = ?auto_2195289 ?auto_2195293 ) ) ( not ( = ?auto_2195289 ?auto_2195294 ) ) ( not ( = ?auto_2195289 ?auto_2195299 ) ) ( not ( = ?auto_2195289 ?auto_2195298 ) ) ( not ( = ?auto_2195290 ?auto_2195291 ) ) ( not ( = ?auto_2195290 ?auto_2195292 ) ) ( not ( = ?auto_2195290 ?auto_2195293 ) ) ( not ( = ?auto_2195290 ?auto_2195294 ) ) ( not ( = ?auto_2195290 ?auto_2195299 ) ) ( not ( = ?auto_2195290 ?auto_2195298 ) ) ( not ( = ?auto_2195291 ?auto_2195292 ) ) ( not ( = ?auto_2195291 ?auto_2195293 ) ) ( not ( = ?auto_2195291 ?auto_2195294 ) ) ( not ( = ?auto_2195291 ?auto_2195299 ) ) ( not ( = ?auto_2195291 ?auto_2195298 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195292 ?auto_2195293 ?auto_2195294 )
      ( MAKE-14CRATE-VERIFY ?auto_2195280 ?auto_2195281 ?auto_2195282 ?auto_2195284 ?auto_2195283 ?auto_2195285 ?auto_2195286 ?auto_2195287 ?auto_2195288 ?auto_2195289 ?auto_2195290 ?auto_2195291 ?auto_2195292 ?auto_2195293 ?auto_2195294 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2195302 - SURFACE
      ?auto_2195303 - SURFACE
    )
    :vars
    (
      ?auto_2195307 - HOIST
      ?auto_2195305 - PLACE
      ?auto_2195304 - SURFACE
      ?auto_2195311 - PLACE
      ?auto_2195306 - HOIST
      ?auto_2195309 - SURFACE
      ?auto_2195308 - SURFACE
      ?auto_2195310 - TRUCK
      ?auto_2195312 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195307 ?auto_2195305 ) ( IS-CRATE ?auto_2195303 ) ( not ( = ?auto_2195302 ?auto_2195303 ) ) ( not ( = ?auto_2195304 ?auto_2195302 ) ) ( not ( = ?auto_2195304 ?auto_2195303 ) ) ( not ( = ?auto_2195311 ?auto_2195305 ) ) ( HOIST-AT ?auto_2195306 ?auto_2195311 ) ( not ( = ?auto_2195307 ?auto_2195306 ) ) ( SURFACE-AT ?auto_2195303 ?auto_2195311 ) ( ON ?auto_2195303 ?auto_2195309 ) ( CLEAR ?auto_2195303 ) ( not ( = ?auto_2195302 ?auto_2195309 ) ) ( not ( = ?auto_2195303 ?auto_2195309 ) ) ( not ( = ?auto_2195304 ?auto_2195309 ) ) ( IS-CRATE ?auto_2195302 ) ( AVAILABLE ?auto_2195306 ) ( SURFACE-AT ?auto_2195302 ?auto_2195311 ) ( ON ?auto_2195302 ?auto_2195308 ) ( CLEAR ?auto_2195302 ) ( not ( = ?auto_2195302 ?auto_2195308 ) ) ( not ( = ?auto_2195303 ?auto_2195308 ) ) ( not ( = ?auto_2195304 ?auto_2195308 ) ) ( not ( = ?auto_2195309 ?auto_2195308 ) ) ( TRUCK-AT ?auto_2195310 ?auto_2195305 ) ( SURFACE-AT ?auto_2195312 ?auto_2195305 ) ( CLEAR ?auto_2195312 ) ( LIFTING ?auto_2195307 ?auto_2195304 ) ( IS-CRATE ?auto_2195304 ) ( not ( = ?auto_2195312 ?auto_2195304 ) ) ( not ( = ?auto_2195302 ?auto_2195312 ) ) ( not ( = ?auto_2195303 ?auto_2195312 ) ) ( not ( = ?auto_2195309 ?auto_2195312 ) ) ( not ( = ?auto_2195308 ?auto_2195312 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2195312 ?auto_2195304 )
      ( MAKE-2CRATE ?auto_2195304 ?auto_2195302 ?auto_2195303 )
      ( MAKE-1CRATE-VERIFY ?auto_2195302 ?auto_2195303 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2195313 - SURFACE
      ?auto_2195314 - SURFACE
      ?auto_2195315 - SURFACE
    )
    :vars
    (
      ?auto_2195318 - HOIST
      ?auto_2195319 - PLACE
      ?auto_2195317 - PLACE
      ?auto_2195320 - HOIST
      ?auto_2195323 - SURFACE
      ?auto_2195322 - SURFACE
      ?auto_2195316 - TRUCK
      ?auto_2195321 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195318 ?auto_2195319 ) ( IS-CRATE ?auto_2195315 ) ( not ( = ?auto_2195314 ?auto_2195315 ) ) ( not ( = ?auto_2195313 ?auto_2195314 ) ) ( not ( = ?auto_2195313 ?auto_2195315 ) ) ( not ( = ?auto_2195317 ?auto_2195319 ) ) ( HOIST-AT ?auto_2195320 ?auto_2195317 ) ( not ( = ?auto_2195318 ?auto_2195320 ) ) ( SURFACE-AT ?auto_2195315 ?auto_2195317 ) ( ON ?auto_2195315 ?auto_2195323 ) ( CLEAR ?auto_2195315 ) ( not ( = ?auto_2195314 ?auto_2195323 ) ) ( not ( = ?auto_2195315 ?auto_2195323 ) ) ( not ( = ?auto_2195313 ?auto_2195323 ) ) ( IS-CRATE ?auto_2195314 ) ( AVAILABLE ?auto_2195320 ) ( SURFACE-AT ?auto_2195314 ?auto_2195317 ) ( ON ?auto_2195314 ?auto_2195322 ) ( CLEAR ?auto_2195314 ) ( not ( = ?auto_2195314 ?auto_2195322 ) ) ( not ( = ?auto_2195315 ?auto_2195322 ) ) ( not ( = ?auto_2195313 ?auto_2195322 ) ) ( not ( = ?auto_2195323 ?auto_2195322 ) ) ( TRUCK-AT ?auto_2195316 ?auto_2195319 ) ( SURFACE-AT ?auto_2195321 ?auto_2195319 ) ( CLEAR ?auto_2195321 ) ( LIFTING ?auto_2195318 ?auto_2195313 ) ( IS-CRATE ?auto_2195313 ) ( not ( = ?auto_2195321 ?auto_2195313 ) ) ( not ( = ?auto_2195314 ?auto_2195321 ) ) ( not ( = ?auto_2195315 ?auto_2195321 ) ) ( not ( = ?auto_2195323 ?auto_2195321 ) ) ( not ( = ?auto_2195322 ?auto_2195321 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2195314 ?auto_2195315 )
      ( MAKE-2CRATE-VERIFY ?auto_2195313 ?auto_2195314 ?auto_2195315 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2195324 - SURFACE
      ?auto_2195325 - SURFACE
      ?auto_2195326 - SURFACE
      ?auto_2195327 - SURFACE
    )
    :vars
    (
      ?auto_2195332 - HOIST
      ?auto_2195333 - PLACE
      ?auto_2195330 - PLACE
      ?auto_2195329 - HOIST
      ?auto_2195334 - SURFACE
      ?auto_2195331 - SURFACE
      ?auto_2195328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195332 ?auto_2195333 ) ( IS-CRATE ?auto_2195327 ) ( not ( = ?auto_2195326 ?auto_2195327 ) ) ( not ( = ?auto_2195325 ?auto_2195326 ) ) ( not ( = ?auto_2195325 ?auto_2195327 ) ) ( not ( = ?auto_2195330 ?auto_2195333 ) ) ( HOIST-AT ?auto_2195329 ?auto_2195330 ) ( not ( = ?auto_2195332 ?auto_2195329 ) ) ( SURFACE-AT ?auto_2195327 ?auto_2195330 ) ( ON ?auto_2195327 ?auto_2195334 ) ( CLEAR ?auto_2195327 ) ( not ( = ?auto_2195326 ?auto_2195334 ) ) ( not ( = ?auto_2195327 ?auto_2195334 ) ) ( not ( = ?auto_2195325 ?auto_2195334 ) ) ( IS-CRATE ?auto_2195326 ) ( AVAILABLE ?auto_2195329 ) ( SURFACE-AT ?auto_2195326 ?auto_2195330 ) ( ON ?auto_2195326 ?auto_2195331 ) ( CLEAR ?auto_2195326 ) ( not ( = ?auto_2195326 ?auto_2195331 ) ) ( not ( = ?auto_2195327 ?auto_2195331 ) ) ( not ( = ?auto_2195325 ?auto_2195331 ) ) ( not ( = ?auto_2195334 ?auto_2195331 ) ) ( TRUCK-AT ?auto_2195328 ?auto_2195333 ) ( SURFACE-AT ?auto_2195324 ?auto_2195333 ) ( CLEAR ?auto_2195324 ) ( LIFTING ?auto_2195332 ?auto_2195325 ) ( IS-CRATE ?auto_2195325 ) ( not ( = ?auto_2195324 ?auto_2195325 ) ) ( not ( = ?auto_2195326 ?auto_2195324 ) ) ( not ( = ?auto_2195327 ?auto_2195324 ) ) ( not ( = ?auto_2195334 ?auto_2195324 ) ) ( not ( = ?auto_2195331 ?auto_2195324 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195325 ?auto_2195326 ?auto_2195327 )
      ( MAKE-3CRATE-VERIFY ?auto_2195324 ?auto_2195325 ?auto_2195326 ?auto_2195327 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2195335 - SURFACE
      ?auto_2195336 - SURFACE
      ?auto_2195337 - SURFACE
      ?auto_2195339 - SURFACE
      ?auto_2195338 - SURFACE
    )
    :vars
    (
      ?auto_2195344 - HOIST
      ?auto_2195345 - PLACE
      ?auto_2195342 - PLACE
      ?auto_2195341 - HOIST
      ?auto_2195346 - SURFACE
      ?auto_2195343 - SURFACE
      ?auto_2195340 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195344 ?auto_2195345 ) ( IS-CRATE ?auto_2195338 ) ( not ( = ?auto_2195339 ?auto_2195338 ) ) ( not ( = ?auto_2195337 ?auto_2195339 ) ) ( not ( = ?auto_2195337 ?auto_2195338 ) ) ( not ( = ?auto_2195342 ?auto_2195345 ) ) ( HOIST-AT ?auto_2195341 ?auto_2195342 ) ( not ( = ?auto_2195344 ?auto_2195341 ) ) ( SURFACE-AT ?auto_2195338 ?auto_2195342 ) ( ON ?auto_2195338 ?auto_2195346 ) ( CLEAR ?auto_2195338 ) ( not ( = ?auto_2195339 ?auto_2195346 ) ) ( not ( = ?auto_2195338 ?auto_2195346 ) ) ( not ( = ?auto_2195337 ?auto_2195346 ) ) ( IS-CRATE ?auto_2195339 ) ( AVAILABLE ?auto_2195341 ) ( SURFACE-AT ?auto_2195339 ?auto_2195342 ) ( ON ?auto_2195339 ?auto_2195343 ) ( CLEAR ?auto_2195339 ) ( not ( = ?auto_2195339 ?auto_2195343 ) ) ( not ( = ?auto_2195338 ?auto_2195343 ) ) ( not ( = ?auto_2195337 ?auto_2195343 ) ) ( not ( = ?auto_2195346 ?auto_2195343 ) ) ( TRUCK-AT ?auto_2195340 ?auto_2195345 ) ( SURFACE-AT ?auto_2195336 ?auto_2195345 ) ( CLEAR ?auto_2195336 ) ( LIFTING ?auto_2195344 ?auto_2195337 ) ( IS-CRATE ?auto_2195337 ) ( not ( = ?auto_2195336 ?auto_2195337 ) ) ( not ( = ?auto_2195339 ?auto_2195336 ) ) ( not ( = ?auto_2195338 ?auto_2195336 ) ) ( not ( = ?auto_2195346 ?auto_2195336 ) ) ( not ( = ?auto_2195343 ?auto_2195336 ) ) ( ON ?auto_2195336 ?auto_2195335 ) ( not ( = ?auto_2195335 ?auto_2195336 ) ) ( not ( = ?auto_2195335 ?auto_2195337 ) ) ( not ( = ?auto_2195335 ?auto_2195339 ) ) ( not ( = ?auto_2195335 ?auto_2195338 ) ) ( not ( = ?auto_2195335 ?auto_2195346 ) ) ( not ( = ?auto_2195335 ?auto_2195343 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195337 ?auto_2195339 ?auto_2195338 )
      ( MAKE-4CRATE-VERIFY ?auto_2195335 ?auto_2195336 ?auto_2195337 ?auto_2195339 ?auto_2195338 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2195347 - SURFACE
      ?auto_2195348 - SURFACE
      ?auto_2195349 - SURFACE
      ?auto_2195351 - SURFACE
      ?auto_2195350 - SURFACE
      ?auto_2195352 - SURFACE
    )
    :vars
    (
      ?auto_2195357 - HOIST
      ?auto_2195358 - PLACE
      ?auto_2195355 - PLACE
      ?auto_2195354 - HOIST
      ?auto_2195359 - SURFACE
      ?auto_2195356 - SURFACE
      ?auto_2195353 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195357 ?auto_2195358 ) ( IS-CRATE ?auto_2195352 ) ( not ( = ?auto_2195350 ?auto_2195352 ) ) ( not ( = ?auto_2195351 ?auto_2195350 ) ) ( not ( = ?auto_2195351 ?auto_2195352 ) ) ( not ( = ?auto_2195355 ?auto_2195358 ) ) ( HOIST-AT ?auto_2195354 ?auto_2195355 ) ( not ( = ?auto_2195357 ?auto_2195354 ) ) ( SURFACE-AT ?auto_2195352 ?auto_2195355 ) ( ON ?auto_2195352 ?auto_2195359 ) ( CLEAR ?auto_2195352 ) ( not ( = ?auto_2195350 ?auto_2195359 ) ) ( not ( = ?auto_2195352 ?auto_2195359 ) ) ( not ( = ?auto_2195351 ?auto_2195359 ) ) ( IS-CRATE ?auto_2195350 ) ( AVAILABLE ?auto_2195354 ) ( SURFACE-AT ?auto_2195350 ?auto_2195355 ) ( ON ?auto_2195350 ?auto_2195356 ) ( CLEAR ?auto_2195350 ) ( not ( = ?auto_2195350 ?auto_2195356 ) ) ( not ( = ?auto_2195352 ?auto_2195356 ) ) ( not ( = ?auto_2195351 ?auto_2195356 ) ) ( not ( = ?auto_2195359 ?auto_2195356 ) ) ( TRUCK-AT ?auto_2195353 ?auto_2195358 ) ( SURFACE-AT ?auto_2195349 ?auto_2195358 ) ( CLEAR ?auto_2195349 ) ( LIFTING ?auto_2195357 ?auto_2195351 ) ( IS-CRATE ?auto_2195351 ) ( not ( = ?auto_2195349 ?auto_2195351 ) ) ( not ( = ?auto_2195350 ?auto_2195349 ) ) ( not ( = ?auto_2195352 ?auto_2195349 ) ) ( not ( = ?auto_2195359 ?auto_2195349 ) ) ( not ( = ?auto_2195356 ?auto_2195349 ) ) ( ON ?auto_2195348 ?auto_2195347 ) ( ON ?auto_2195349 ?auto_2195348 ) ( not ( = ?auto_2195347 ?auto_2195348 ) ) ( not ( = ?auto_2195347 ?auto_2195349 ) ) ( not ( = ?auto_2195347 ?auto_2195351 ) ) ( not ( = ?auto_2195347 ?auto_2195350 ) ) ( not ( = ?auto_2195347 ?auto_2195352 ) ) ( not ( = ?auto_2195347 ?auto_2195359 ) ) ( not ( = ?auto_2195347 ?auto_2195356 ) ) ( not ( = ?auto_2195348 ?auto_2195349 ) ) ( not ( = ?auto_2195348 ?auto_2195351 ) ) ( not ( = ?auto_2195348 ?auto_2195350 ) ) ( not ( = ?auto_2195348 ?auto_2195352 ) ) ( not ( = ?auto_2195348 ?auto_2195359 ) ) ( not ( = ?auto_2195348 ?auto_2195356 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195351 ?auto_2195350 ?auto_2195352 )
      ( MAKE-5CRATE-VERIFY ?auto_2195347 ?auto_2195348 ?auto_2195349 ?auto_2195351 ?auto_2195350 ?auto_2195352 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2195360 - SURFACE
      ?auto_2195361 - SURFACE
      ?auto_2195362 - SURFACE
      ?auto_2195364 - SURFACE
      ?auto_2195363 - SURFACE
      ?auto_2195365 - SURFACE
      ?auto_2195366 - SURFACE
    )
    :vars
    (
      ?auto_2195371 - HOIST
      ?auto_2195372 - PLACE
      ?auto_2195369 - PLACE
      ?auto_2195368 - HOIST
      ?auto_2195373 - SURFACE
      ?auto_2195370 - SURFACE
      ?auto_2195367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195371 ?auto_2195372 ) ( IS-CRATE ?auto_2195366 ) ( not ( = ?auto_2195365 ?auto_2195366 ) ) ( not ( = ?auto_2195363 ?auto_2195365 ) ) ( not ( = ?auto_2195363 ?auto_2195366 ) ) ( not ( = ?auto_2195369 ?auto_2195372 ) ) ( HOIST-AT ?auto_2195368 ?auto_2195369 ) ( not ( = ?auto_2195371 ?auto_2195368 ) ) ( SURFACE-AT ?auto_2195366 ?auto_2195369 ) ( ON ?auto_2195366 ?auto_2195373 ) ( CLEAR ?auto_2195366 ) ( not ( = ?auto_2195365 ?auto_2195373 ) ) ( not ( = ?auto_2195366 ?auto_2195373 ) ) ( not ( = ?auto_2195363 ?auto_2195373 ) ) ( IS-CRATE ?auto_2195365 ) ( AVAILABLE ?auto_2195368 ) ( SURFACE-AT ?auto_2195365 ?auto_2195369 ) ( ON ?auto_2195365 ?auto_2195370 ) ( CLEAR ?auto_2195365 ) ( not ( = ?auto_2195365 ?auto_2195370 ) ) ( not ( = ?auto_2195366 ?auto_2195370 ) ) ( not ( = ?auto_2195363 ?auto_2195370 ) ) ( not ( = ?auto_2195373 ?auto_2195370 ) ) ( TRUCK-AT ?auto_2195367 ?auto_2195372 ) ( SURFACE-AT ?auto_2195364 ?auto_2195372 ) ( CLEAR ?auto_2195364 ) ( LIFTING ?auto_2195371 ?auto_2195363 ) ( IS-CRATE ?auto_2195363 ) ( not ( = ?auto_2195364 ?auto_2195363 ) ) ( not ( = ?auto_2195365 ?auto_2195364 ) ) ( not ( = ?auto_2195366 ?auto_2195364 ) ) ( not ( = ?auto_2195373 ?auto_2195364 ) ) ( not ( = ?auto_2195370 ?auto_2195364 ) ) ( ON ?auto_2195361 ?auto_2195360 ) ( ON ?auto_2195362 ?auto_2195361 ) ( ON ?auto_2195364 ?auto_2195362 ) ( not ( = ?auto_2195360 ?auto_2195361 ) ) ( not ( = ?auto_2195360 ?auto_2195362 ) ) ( not ( = ?auto_2195360 ?auto_2195364 ) ) ( not ( = ?auto_2195360 ?auto_2195363 ) ) ( not ( = ?auto_2195360 ?auto_2195365 ) ) ( not ( = ?auto_2195360 ?auto_2195366 ) ) ( not ( = ?auto_2195360 ?auto_2195373 ) ) ( not ( = ?auto_2195360 ?auto_2195370 ) ) ( not ( = ?auto_2195361 ?auto_2195362 ) ) ( not ( = ?auto_2195361 ?auto_2195364 ) ) ( not ( = ?auto_2195361 ?auto_2195363 ) ) ( not ( = ?auto_2195361 ?auto_2195365 ) ) ( not ( = ?auto_2195361 ?auto_2195366 ) ) ( not ( = ?auto_2195361 ?auto_2195373 ) ) ( not ( = ?auto_2195361 ?auto_2195370 ) ) ( not ( = ?auto_2195362 ?auto_2195364 ) ) ( not ( = ?auto_2195362 ?auto_2195363 ) ) ( not ( = ?auto_2195362 ?auto_2195365 ) ) ( not ( = ?auto_2195362 ?auto_2195366 ) ) ( not ( = ?auto_2195362 ?auto_2195373 ) ) ( not ( = ?auto_2195362 ?auto_2195370 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195363 ?auto_2195365 ?auto_2195366 )
      ( MAKE-6CRATE-VERIFY ?auto_2195360 ?auto_2195361 ?auto_2195362 ?auto_2195364 ?auto_2195363 ?auto_2195365 ?auto_2195366 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2195374 - SURFACE
      ?auto_2195375 - SURFACE
      ?auto_2195376 - SURFACE
      ?auto_2195378 - SURFACE
      ?auto_2195377 - SURFACE
      ?auto_2195379 - SURFACE
      ?auto_2195380 - SURFACE
      ?auto_2195381 - SURFACE
    )
    :vars
    (
      ?auto_2195386 - HOIST
      ?auto_2195387 - PLACE
      ?auto_2195384 - PLACE
      ?auto_2195383 - HOIST
      ?auto_2195388 - SURFACE
      ?auto_2195385 - SURFACE
      ?auto_2195382 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195386 ?auto_2195387 ) ( IS-CRATE ?auto_2195381 ) ( not ( = ?auto_2195380 ?auto_2195381 ) ) ( not ( = ?auto_2195379 ?auto_2195380 ) ) ( not ( = ?auto_2195379 ?auto_2195381 ) ) ( not ( = ?auto_2195384 ?auto_2195387 ) ) ( HOIST-AT ?auto_2195383 ?auto_2195384 ) ( not ( = ?auto_2195386 ?auto_2195383 ) ) ( SURFACE-AT ?auto_2195381 ?auto_2195384 ) ( ON ?auto_2195381 ?auto_2195388 ) ( CLEAR ?auto_2195381 ) ( not ( = ?auto_2195380 ?auto_2195388 ) ) ( not ( = ?auto_2195381 ?auto_2195388 ) ) ( not ( = ?auto_2195379 ?auto_2195388 ) ) ( IS-CRATE ?auto_2195380 ) ( AVAILABLE ?auto_2195383 ) ( SURFACE-AT ?auto_2195380 ?auto_2195384 ) ( ON ?auto_2195380 ?auto_2195385 ) ( CLEAR ?auto_2195380 ) ( not ( = ?auto_2195380 ?auto_2195385 ) ) ( not ( = ?auto_2195381 ?auto_2195385 ) ) ( not ( = ?auto_2195379 ?auto_2195385 ) ) ( not ( = ?auto_2195388 ?auto_2195385 ) ) ( TRUCK-AT ?auto_2195382 ?auto_2195387 ) ( SURFACE-AT ?auto_2195377 ?auto_2195387 ) ( CLEAR ?auto_2195377 ) ( LIFTING ?auto_2195386 ?auto_2195379 ) ( IS-CRATE ?auto_2195379 ) ( not ( = ?auto_2195377 ?auto_2195379 ) ) ( not ( = ?auto_2195380 ?auto_2195377 ) ) ( not ( = ?auto_2195381 ?auto_2195377 ) ) ( not ( = ?auto_2195388 ?auto_2195377 ) ) ( not ( = ?auto_2195385 ?auto_2195377 ) ) ( ON ?auto_2195375 ?auto_2195374 ) ( ON ?auto_2195376 ?auto_2195375 ) ( ON ?auto_2195378 ?auto_2195376 ) ( ON ?auto_2195377 ?auto_2195378 ) ( not ( = ?auto_2195374 ?auto_2195375 ) ) ( not ( = ?auto_2195374 ?auto_2195376 ) ) ( not ( = ?auto_2195374 ?auto_2195378 ) ) ( not ( = ?auto_2195374 ?auto_2195377 ) ) ( not ( = ?auto_2195374 ?auto_2195379 ) ) ( not ( = ?auto_2195374 ?auto_2195380 ) ) ( not ( = ?auto_2195374 ?auto_2195381 ) ) ( not ( = ?auto_2195374 ?auto_2195388 ) ) ( not ( = ?auto_2195374 ?auto_2195385 ) ) ( not ( = ?auto_2195375 ?auto_2195376 ) ) ( not ( = ?auto_2195375 ?auto_2195378 ) ) ( not ( = ?auto_2195375 ?auto_2195377 ) ) ( not ( = ?auto_2195375 ?auto_2195379 ) ) ( not ( = ?auto_2195375 ?auto_2195380 ) ) ( not ( = ?auto_2195375 ?auto_2195381 ) ) ( not ( = ?auto_2195375 ?auto_2195388 ) ) ( not ( = ?auto_2195375 ?auto_2195385 ) ) ( not ( = ?auto_2195376 ?auto_2195378 ) ) ( not ( = ?auto_2195376 ?auto_2195377 ) ) ( not ( = ?auto_2195376 ?auto_2195379 ) ) ( not ( = ?auto_2195376 ?auto_2195380 ) ) ( not ( = ?auto_2195376 ?auto_2195381 ) ) ( not ( = ?auto_2195376 ?auto_2195388 ) ) ( not ( = ?auto_2195376 ?auto_2195385 ) ) ( not ( = ?auto_2195378 ?auto_2195377 ) ) ( not ( = ?auto_2195378 ?auto_2195379 ) ) ( not ( = ?auto_2195378 ?auto_2195380 ) ) ( not ( = ?auto_2195378 ?auto_2195381 ) ) ( not ( = ?auto_2195378 ?auto_2195388 ) ) ( not ( = ?auto_2195378 ?auto_2195385 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195379 ?auto_2195380 ?auto_2195381 )
      ( MAKE-7CRATE-VERIFY ?auto_2195374 ?auto_2195375 ?auto_2195376 ?auto_2195378 ?auto_2195377 ?auto_2195379 ?auto_2195380 ?auto_2195381 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2195389 - SURFACE
      ?auto_2195390 - SURFACE
      ?auto_2195391 - SURFACE
      ?auto_2195393 - SURFACE
      ?auto_2195392 - SURFACE
      ?auto_2195394 - SURFACE
      ?auto_2195395 - SURFACE
      ?auto_2195396 - SURFACE
      ?auto_2195397 - SURFACE
    )
    :vars
    (
      ?auto_2195402 - HOIST
      ?auto_2195403 - PLACE
      ?auto_2195400 - PLACE
      ?auto_2195399 - HOIST
      ?auto_2195404 - SURFACE
      ?auto_2195401 - SURFACE
      ?auto_2195398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195402 ?auto_2195403 ) ( IS-CRATE ?auto_2195397 ) ( not ( = ?auto_2195396 ?auto_2195397 ) ) ( not ( = ?auto_2195395 ?auto_2195396 ) ) ( not ( = ?auto_2195395 ?auto_2195397 ) ) ( not ( = ?auto_2195400 ?auto_2195403 ) ) ( HOIST-AT ?auto_2195399 ?auto_2195400 ) ( not ( = ?auto_2195402 ?auto_2195399 ) ) ( SURFACE-AT ?auto_2195397 ?auto_2195400 ) ( ON ?auto_2195397 ?auto_2195404 ) ( CLEAR ?auto_2195397 ) ( not ( = ?auto_2195396 ?auto_2195404 ) ) ( not ( = ?auto_2195397 ?auto_2195404 ) ) ( not ( = ?auto_2195395 ?auto_2195404 ) ) ( IS-CRATE ?auto_2195396 ) ( AVAILABLE ?auto_2195399 ) ( SURFACE-AT ?auto_2195396 ?auto_2195400 ) ( ON ?auto_2195396 ?auto_2195401 ) ( CLEAR ?auto_2195396 ) ( not ( = ?auto_2195396 ?auto_2195401 ) ) ( not ( = ?auto_2195397 ?auto_2195401 ) ) ( not ( = ?auto_2195395 ?auto_2195401 ) ) ( not ( = ?auto_2195404 ?auto_2195401 ) ) ( TRUCK-AT ?auto_2195398 ?auto_2195403 ) ( SURFACE-AT ?auto_2195394 ?auto_2195403 ) ( CLEAR ?auto_2195394 ) ( LIFTING ?auto_2195402 ?auto_2195395 ) ( IS-CRATE ?auto_2195395 ) ( not ( = ?auto_2195394 ?auto_2195395 ) ) ( not ( = ?auto_2195396 ?auto_2195394 ) ) ( not ( = ?auto_2195397 ?auto_2195394 ) ) ( not ( = ?auto_2195404 ?auto_2195394 ) ) ( not ( = ?auto_2195401 ?auto_2195394 ) ) ( ON ?auto_2195390 ?auto_2195389 ) ( ON ?auto_2195391 ?auto_2195390 ) ( ON ?auto_2195393 ?auto_2195391 ) ( ON ?auto_2195392 ?auto_2195393 ) ( ON ?auto_2195394 ?auto_2195392 ) ( not ( = ?auto_2195389 ?auto_2195390 ) ) ( not ( = ?auto_2195389 ?auto_2195391 ) ) ( not ( = ?auto_2195389 ?auto_2195393 ) ) ( not ( = ?auto_2195389 ?auto_2195392 ) ) ( not ( = ?auto_2195389 ?auto_2195394 ) ) ( not ( = ?auto_2195389 ?auto_2195395 ) ) ( not ( = ?auto_2195389 ?auto_2195396 ) ) ( not ( = ?auto_2195389 ?auto_2195397 ) ) ( not ( = ?auto_2195389 ?auto_2195404 ) ) ( not ( = ?auto_2195389 ?auto_2195401 ) ) ( not ( = ?auto_2195390 ?auto_2195391 ) ) ( not ( = ?auto_2195390 ?auto_2195393 ) ) ( not ( = ?auto_2195390 ?auto_2195392 ) ) ( not ( = ?auto_2195390 ?auto_2195394 ) ) ( not ( = ?auto_2195390 ?auto_2195395 ) ) ( not ( = ?auto_2195390 ?auto_2195396 ) ) ( not ( = ?auto_2195390 ?auto_2195397 ) ) ( not ( = ?auto_2195390 ?auto_2195404 ) ) ( not ( = ?auto_2195390 ?auto_2195401 ) ) ( not ( = ?auto_2195391 ?auto_2195393 ) ) ( not ( = ?auto_2195391 ?auto_2195392 ) ) ( not ( = ?auto_2195391 ?auto_2195394 ) ) ( not ( = ?auto_2195391 ?auto_2195395 ) ) ( not ( = ?auto_2195391 ?auto_2195396 ) ) ( not ( = ?auto_2195391 ?auto_2195397 ) ) ( not ( = ?auto_2195391 ?auto_2195404 ) ) ( not ( = ?auto_2195391 ?auto_2195401 ) ) ( not ( = ?auto_2195393 ?auto_2195392 ) ) ( not ( = ?auto_2195393 ?auto_2195394 ) ) ( not ( = ?auto_2195393 ?auto_2195395 ) ) ( not ( = ?auto_2195393 ?auto_2195396 ) ) ( not ( = ?auto_2195393 ?auto_2195397 ) ) ( not ( = ?auto_2195393 ?auto_2195404 ) ) ( not ( = ?auto_2195393 ?auto_2195401 ) ) ( not ( = ?auto_2195392 ?auto_2195394 ) ) ( not ( = ?auto_2195392 ?auto_2195395 ) ) ( not ( = ?auto_2195392 ?auto_2195396 ) ) ( not ( = ?auto_2195392 ?auto_2195397 ) ) ( not ( = ?auto_2195392 ?auto_2195404 ) ) ( not ( = ?auto_2195392 ?auto_2195401 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195395 ?auto_2195396 ?auto_2195397 )
      ( MAKE-8CRATE-VERIFY ?auto_2195389 ?auto_2195390 ?auto_2195391 ?auto_2195393 ?auto_2195392 ?auto_2195394 ?auto_2195395 ?auto_2195396 ?auto_2195397 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2195405 - SURFACE
      ?auto_2195406 - SURFACE
      ?auto_2195407 - SURFACE
      ?auto_2195409 - SURFACE
      ?auto_2195408 - SURFACE
      ?auto_2195410 - SURFACE
      ?auto_2195411 - SURFACE
      ?auto_2195412 - SURFACE
      ?auto_2195413 - SURFACE
      ?auto_2195414 - SURFACE
    )
    :vars
    (
      ?auto_2195419 - HOIST
      ?auto_2195420 - PLACE
      ?auto_2195417 - PLACE
      ?auto_2195416 - HOIST
      ?auto_2195421 - SURFACE
      ?auto_2195418 - SURFACE
      ?auto_2195415 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195419 ?auto_2195420 ) ( IS-CRATE ?auto_2195414 ) ( not ( = ?auto_2195413 ?auto_2195414 ) ) ( not ( = ?auto_2195412 ?auto_2195413 ) ) ( not ( = ?auto_2195412 ?auto_2195414 ) ) ( not ( = ?auto_2195417 ?auto_2195420 ) ) ( HOIST-AT ?auto_2195416 ?auto_2195417 ) ( not ( = ?auto_2195419 ?auto_2195416 ) ) ( SURFACE-AT ?auto_2195414 ?auto_2195417 ) ( ON ?auto_2195414 ?auto_2195421 ) ( CLEAR ?auto_2195414 ) ( not ( = ?auto_2195413 ?auto_2195421 ) ) ( not ( = ?auto_2195414 ?auto_2195421 ) ) ( not ( = ?auto_2195412 ?auto_2195421 ) ) ( IS-CRATE ?auto_2195413 ) ( AVAILABLE ?auto_2195416 ) ( SURFACE-AT ?auto_2195413 ?auto_2195417 ) ( ON ?auto_2195413 ?auto_2195418 ) ( CLEAR ?auto_2195413 ) ( not ( = ?auto_2195413 ?auto_2195418 ) ) ( not ( = ?auto_2195414 ?auto_2195418 ) ) ( not ( = ?auto_2195412 ?auto_2195418 ) ) ( not ( = ?auto_2195421 ?auto_2195418 ) ) ( TRUCK-AT ?auto_2195415 ?auto_2195420 ) ( SURFACE-AT ?auto_2195411 ?auto_2195420 ) ( CLEAR ?auto_2195411 ) ( LIFTING ?auto_2195419 ?auto_2195412 ) ( IS-CRATE ?auto_2195412 ) ( not ( = ?auto_2195411 ?auto_2195412 ) ) ( not ( = ?auto_2195413 ?auto_2195411 ) ) ( not ( = ?auto_2195414 ?auto_2195411 ) ) ( not ( = ?auto_2195421 ?auto_2195411 ) ) ( not ( = ?auto_2195418 ?auto_2195411 ) ) ( ON ?auto_2195406 ?auto_2195405 ) ( ON ?auto_2195407 ?auto_2195406 ) ( ON ?auto_2195409 ?auto_2195407 ) ( ON ?auto_2195408 ?auto_2195409 ) ( ON ?auto_2195410 ?auto_2195408 ) ( ON ?auto_2195411 ?auto_2195410 ) ( not ( = ?auto_2195405 ?auto_2195406 ) ) ( not ( = ?auto_2195405 ?auto_2195407 ) ) ( not ( = ?auto_2195405 ?auto_2195409 ) ) ( not ( = ?auto_2195405 ?auto_2195408 ) ) ( not ( = ?auto_2195405 ?auto_2195410 ) ) ( not ( = ?auto_2195405 ?auto_2195411 ) ) ( not ( = ?auto_2195405 ?auto_2195412 ) ) ( not ( = ?auto_2195405 ?auto_2195413 ) ) ( not ( = ?auto_2195405 ?auto_2195414 ) ) ( not ( = ?auto_2195405 ?auto_2195421 ) ) ( not ( = ?auto_2195405 ?auto_2195418 ) ) ( not ( = ?auto_2195406 ?auto_2195407 ) ) ( not ( = ?auto_2195406 ?auto_2195409 ) ) ( not ( = ?auto_2195406 ?auto_2195408 ) ) ( not ( = ?auto_2195406 ?auto_2195410 ) ) ( not ( = ?auto_2195406 ?auto_2195411 ) ) ( not ( = ?auto_2195406 ?auto_2195412 ) ) ( not ( = ?auto_2195406 ?auto_2195413 ) ) ( not ( = ?auto_2195406 ?auto_2195414 ) ) ( not ( = ?auto_2195406 ?auto_2195421 ) ) ( not ( = ?auto_2195406 ?auto_2195418 ) ) ( not ( = ?auto_2195407 ?auto_2195409 ) ) ( not ( = ?auto_2195407 ?auto_2195408 ) ) ( not ( = ?auto_2195407 ?auto_2195410 ) ) ( not ( = ?auto_2195407 ?auto_2195411 ) ) ( not ( = ?auto_2195407 ?auto_2195412 ) ) ( not ( = ?auto_2195407 ?auto_2195413 ) ) ( not ( = ?auto_2195407 ?auto_2195414 ) ) ( not ( = ?auto_2195407 ?auto_2195421 ) ) ( not ( = ?auto_2195407 ?auto_2195418 ) ) ( not ( = ?auto_2195409 ?auto_2195408 ) ) ( not ( = ?auto_2195409 ?auto_2195410 ) ) ( not ( = ?auto_2195409 ?auto_2195411 ) ) ( not ( = ?auto_2195409 ?auto_2195412 ) ) ( not ( = ?auto_2195409 ?auto_2195413 ) ) ( not ( = ?auto_2195409 ?auto_2195414 ) ) ( not ( = ?auto_2195409 ?auto_2195421 ) ) ( not ( = ?auto_2195409 ?auto_2195418 ) ) ( not ( = ?auto_2195408 ?auto_2195410 ) ) ( not ( = ?auto_2195408 ?auto_2195411 ) ) ( not ( = ?auto_2195408 ?auto_2195412 ) ) ( not ( = ?auto_2195408 ?auto_2195413 ) ) ( not ( = ?auto_2195408 ?auto_2195414 ) ) ( not ( = ?auto_2195408 ?auto_2195421 ) ) ( not ( = ?auto_2195408 ?auto_2195418 ) ) ( not ( = ?auto_2195410 ?auto_2195411 ) ) ( not ( = ?auto_2195410 ?auto_2195412 ) ) ( not ( = ?auto_2195410 ?auto_2195413 ) ) ( not ( = ?auto_2195410 ?auto_2195414 ) ) ( not ( = ?auto_2195410 ?auto_2195421 ) ) ( not ( = ?auto_2195410 ?auto_2195418 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195412 ?auto_2195413 ?auto_2195414 )
      ( MAKE-9CRATE-VERIFY ?auto_2195405 ?auto_2195406 ?auto_2195407 ?auto_2195409 ?auto_2195408 ?auto_2195410 ?auto_2195411 ?auto_2195412 ?auto_2195413 ?auto_2195414 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2195422 - SURFACE
      ?auto_2195423 - SURFACE
      ?auto_2195424 - SURFACE
      ?auto_2195426 - SURFACE
      ?auto_2195425 - SURFACE
      ?auto_2195427 - SURFACE
      ?auto_2195428 - SURFACE
      ?auto_2195429 - SURFACE
      ?auto_2195430 - SURFACE
      ?auto_2195431 - SURFACE
      ?auto_2195432 - SURFACE
    )
    :vars
    (
      ?auto_2195437 - HOIST
      ?auto_2195438 - PLACE
      ?auto_2195435 - PLACE
      ?auto_2195434 - HOIST
      ?auto_2195439 - SURFACE
      ?auto_2195436 - SURFACE
      ?auto_2195433 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195437 ?auto_2195438 ) ( IS-CRATE ?auto_2195432 ) ( not ( = ?auto_2195431 ?auto_2195432 ) ) ( not ( = ?auto_2195430 ?auto_2195431 ) ) ( not ( = ?auto_2195430 ?auto_2195432 ) ) ( not ( = ?auto_2195435 ?auto_2195438 ) ) ( HOIST-AT ?auto_2195434 ?auto_2195435 ) ( not ( = ?auto_2195437 ?auto_2195434 ) ) ( SURFACE-AT ?auto_2195432 ?auto_2195435 ) ( ON ?auto_2195432 ?auto_2195439 ) ( CLEAR ?auto_2195432 ) ( not ( = ?auto_2195431 ?auto_2195439 ) ) ( not ( = ?auto_2195432 ?auto_2195439 ) ) ( not ( = ?auto_2195430 ?auto_2195439 ) ) ( IS-CRATE ?auto_2195431 ) ( AVAILABLE ?auto_2195434 ) ( SURFACE-AT ?auto_2195431 ?auto_2195435 ) ( ON ?auto_2195431 ?auto_2195436 ) ( CLEAR ?auto_2195431 ) ( not ( = ?auto_2195431 ?auto_2195436 ) ) ( not ( = ?auto_2195432 ?auto_2195436 ) ) ( not ( = ?auto_2195430 ?auto_2195436 ) ) ( not ( = ?auto_2195439 ?auto_2195436 ) ) ( TRUCK-AT ?auto_2195433 ?auto_2195438 ) ( SURFACE-AT ?auto_2195429 ?auto_2195438 ) ( CLEAR ?auto_2195429 ) ( LIFTING ?auto_2195437 ?auto_2195430 ) ( IS-CRATE ?auto_2195430 ) ( not ( = ?auto_2195429 ?auto_2195430 ) ) ( not ( = ?auto_2195431 ?auto_2195429 ) ) ( not ( = ?auto_2195432 ?auto_2195429 ) ) ( not ( = ?auto_2195439 ?auto_2195429 ) ) ( not ( = ?auto_2195436 ?auto_2195429 ) ) ( ON ?auto_2195423 ?auto_2195422 ) ( ON ?auto_2195424 ?auto_2195423 ) ( ON ?auto_2195426 ?auto_2195424 ) ( ON ?auto_2195425 ?auto_2195426 ) ( ON ?auto_2195427 ?auto_2195425 ) ( ON ?auto_2195428 ?auto_2195427 ) ( ON ?auto_2195429 ?auto_2195428 ) ( not ( = ?auto_2195422 ?auto_2195423 ) ) ( not ( = ?auto_2195422 ?auto_2195424 ) ) ( not ( = ?auto_2195422 ?auto_2195426 ) ) ( not ( = ?auto_2195422 ?auto_2195425 ) ) ( not ( = ?auto_2195422 ?auto_2195427 ) ) ( not ( = ?auto_2195422 ?auto_2195428 ) ) ( not ( = ?auto_2195422 ?auto_2195429 ) ) ( not ( = ?auto_2195422 ?auto_2195430 ) ) ( not ( = ?auto_2195422 ?auto_2195431 ) ) ( not ( = ?auto_2195422 ?auto_2195432 ) ) ( not ( = ?auto_2195422 ?auto_2195439 ) ) ( not ( = ?auto_2195422 ?auto_2195436 ) ) ( not ( = ?auto_2195423 ?auto_2195424 ) ) ( not ( = ?auto_2195423 ?auto_2195426 ) ) ( not ( = ?auto_2195423 ?auto_2195425 ) ) ( not ( = ?auto_2195423 ?auto_2195427 ) ) ( not ( = ?auto_2195423 ?auto_2195428 ) ) ( not ( = ?auto_2195423 ?auto_2195429 ) ) ( not ( = ?auto_2195423 ?auto_2195430 ) ) ( not ( = ?auto_2195423 ?auto_2195431 ) ) ( not ( = ?auto_2195423 ?auto_2195432 ) ) ( not ( = ?auto_2195423 ?auto_2195439 ) ) ( not ( = ?auto_2195423 ?auto_2195436 ) ) ( not ( = ?auto_2195424 ?auto_2195426 ) ) ( not ( = ?auto_2195424 ?auto_2195425 ) ) ( not ( = ?auto_2195424 ?auto_2195427 ) ) ( not ( = ?auto_2195424 ?auto_2195428 ) ) ( not ( = ?auto_2195424 ?auto_2195429 ) ) ( not ( = ?auto_2195424 ?auto_2195430 ) ) ( not ( = ?auto_2195424 ?auto_2195431 ) ) ( not ( = ?auto_2195424 ?auto_2195432 ) ) ( not ( = ?auto_2195424 ?auto_2195439 ) ) ( not ( = ?auto_2195424 ?auto_2195436 ) ) ( not ( = ?auto_2195426 ?auto_2195425 ) ) ( not ( = ?auto_2195426 ?auto_2195427 ) ) ( not ( = ?auto_2195426 ?auto_2195428 ) ) ( not ( = ?auto_2195426 ?auto_2195429 ) ) ( not ( = ?auto_2195426 ?auto_2195430 ) ) ( not ( = ?auto_2195426 ?auto_2195431 ) ) ( not ( = ?auto_2195426 ?auto_2195432 ) ) ( not ( = ?auto_2195426 ?auto_2195439 ) ) ( not ( = ?auto_2195426 ?auto_2195436 ) ) ( not ( = ?auto_2195425 ?auto_2195427 ) ) ( not ( = ?auto_2195425 ?auto_2195428 ) ) ( not ( = ?auto_2195425 ?auto_2195429 ) ) ( not ( = ?auto_2195425 ?auto_2195430 ) ) ( not ( = ?auto_2195425 ?auto_2195431 ) ) ( not ( = ?auto_2195425 ?auto_2195432 ) ) ( not ( = ?auto_2195425 ?auto_2195439 ) ) ( not ( = ?auto_2195425 ?auto_2195436 ) ) ( not ( = ?auto_2195427 ?auto_2195428 ) ) ( not ( = ?auto_2195427 ?auto_2195429 ) ) ( not ( = ?auto_2195427 ?auto_2195430 ) ) ( not ( = ?auto_2195427 ?auto_2195431 ) ) ( not ( = ?auto_2195427 ?auto_2195432 ) ) ( not ( = ?auto_2195427 ?auto_2195439 ) ) ( not ( = ?auto_2195427 ?auto_2195436 ) ) ( not ( = ?auto_2195428 ?auto_2195429 ) ) ( not ( = ?auto_2195428 ?auto_2195430 ) ) ( not ( = ?auto_2195428 ?auto_2195431 ) ) ( not ( = ?auto_2195428 ?auto_2195432 ) ) ( not ( = ?auto_2195428 ?auto_2195439 ) ) ( not ( = ?auto_2195428 ?auto_2195436 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195430 ?auto_2195431 ?auto_2195432 )
      ( MAKE-10CRATE-VERIFY ?auto_2195422 ?auto_2195423 ?auto_2195424 ?auto_2195426 ?auto_2195425 ?auto_2195427 ?auto_2195428 ?auto_2195429 ?auto_2195430 ?auto_2195431 ?auto_2195432 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2195440 - SURFACE
      ?auto_2195441 - SURFACE
      ?auto_2195442 - SURFACE
      ?auto_2195444 - SURFACE
      ?auto_2195443 - SURFACE
      ?auto_2195445 - SURFACE
      ?auto_2195446 - SURFACE
      ?auto_2195447 - SURFACE
      ?auto_2195448 - SURFACE
      ?auto_2195449 - SURFACE
      ?auto_2195450 - SURFACE
      ?auto_2195451 - SURFACE
    )
    :vars
    (
      ?auto_2195456 - HOIST
      ?auto_2195457 - PLACE
      ?auto_2195454 - PLACE
      ?auto_2195453 - HOIST
      ?auto_2195458 - SURFACE
      ?auto_2195455 - SURFACE
      ?auto_2195452 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195456 ?auto_2195457 ) ( IS-CRATE ?auto_2195451 ) ( not ( = ?auto_2195450 ?auto_2195451 ) ) ( not ( = ?auto_2195449 ?auto_2195450 ) ) ( not ( = ?auto_2195449 ?auto_2195451 ) ) ( not ( = ?auto_2195454 ?auto_2195457 ) ) ( HOIST-AT ?auto_2195453 ?auto_2195454 ) ( not ( = ?auto_2195456 ?auto_2195453 ) ) ( SURFACE-AT ?auto_2195451 ?auto_2195454 ) ( ON ?auto_2195451 ?auto_2195458 ) ( CLEAR ?auto_2195451 ) ( not ( = ?auto_2195450 ?auto_2195458 ) ) ( not ( = ?auto_2195451 ?auto_2195458 ) ) ( not ( = ?auto_2195449 ?auto_2195458 ) ) ( IS-CRATE ?auto_2195450 ) ( AVAILABLE ?auto_2195453 ) ( SURFACE-AT ?auto_2195450 ?auto_2195454 ) ( ON ?auto_2195450 ?auto_2195455 ) ( CLEAR ?auto_2195450 ) ( not ( = ?auto_2195450 ?auto_2195455 ) ) ( not ( = ?auto_2195451 ?auto_2195455 ) ) ( not ( = ?auto_2195449 ?auto_2195455 ) ) ( not ( = ?auto_2195458 ?auto_2195455 ) ) ( TRUCK-AT ?auto_2195452 ?auto_2195457 ) ( SURFACE-AT ?auto_2195448 ?auto_2195457 ) ( CLEAR ?auto_2195448 ) ( LIFTING ?auto_2195456 ?auto_2195449 ) ( IS-CRATE ?auto_2195449 ) ( not ( = ?auto_2195448 ?auto_2195449 ) ) ( not ( = ?auto_2195450 ?auto_2195448 ) ) ( not ( = ?auto_2195451 ?auto_2195448 ) ) ( not ( = ?auto_2195458 ?auto_2195448 ) ) ( not ( = ?auto_2195455 ?auto_2195448 ) ) ( ON ?auto_2195441 ?auto_2195440 ) ( ON ?auto_2195442 ?auto_2195441 ) ( ON ?auto_2195444 ?auto_2195442 ) ( ON ?auto_2195443 ?auto_2195444 ) ( ON ?auto_2195445 ?auto_2195443 ) ( ON ?auto_2195446 ?auto_2195445 ) ( ON ?auto_2195447 ?auto_2195446 ) ( ON ?auto_2195448 ?auto_2195447 ) ( not ( = ?auto_2195440 ?auto_2195441 ) ) ( not ( = ?auto_2195440 ?auto_2195442 ) ) ( not ( = ?auto_2195440 ?auto_2195444 ) ) ( not ( = ?auto_2195440 ?auto_2195443 ) ) ( not ( = ?auto_2195440 ?auto_2195445 ) ) ( not ( = ?auto_2195440 ?auto_2195446 ) ) ( not ( = ?auto_2195440 ?auto_2195447 ) ) ( not ( = ?auto_2195440 ?auto_2195448 ) ) ( not ( = ?auto_2195440 ?auto_2195449 ) ) ( not ( = ?auto_2195440 ?auto_2195450 ) ) ( not ( = ?auto_2195440 ?auto_2195451 ) ) ( not ( = ?auto_2195440 ?auto_2195458 ) ) ( not ( = ?auto_2195440 ?auto_2195455 ) ) ( not ( = ?auto_2195441 ?auto_2195442 ) ) ( not ( = ?auto_2195441 ?auto_2195444 ) ) ( not ( = ?auto_2195441 ?auto_2195443 ) ) ( not ( = ?auto_2195441 ?auto_2195445 ) ) ( not ( = ?auto_2195441 ?auto_2195446 ) ) ( not ( = ?auto_2195441 ?auto_2195447 ) ) ( not ( = ?auto_2195441 ?auto_2195448 ) ) ( not ( = ?auto_2195441 ?auto_2195449 ) ) ( not ( = ?auto_2195441 ?auto_2195450 ) ) ( not ( = ?auto_2195441 ?auto_2195451 ) ) ( not ( = ?auto_2195441 ?auto_2195458 ) ) ( not ( = ?auto_2195441 ?auto_2195455 ) ) ( not ( = ?auto_2195442 ?auto_2195444 ) ) ( not ( = ?auto_2195442 ?auto_2195443 ) ) ( not ( = ?auto_2195442 ?auto_2195445 ) ) ( not ( = ?auto_2195442 ?auto_2195446 ) ) ( not ( = ?auto_2195442 ?auto_2195447 ) ) ( not ( = ?auto_2195442 ?auto_2195448 ) ) ( not ( = ?auto_2195442 ?auto_2195449 ) ) ( not ( = ?auto_2195442 ?auto_2195450 ) ) ( not ( = ?auto_2195442 ?auto_2195451 ) ) ( not ( = ?auto_2195442 ?auto_2195458 ) ) ( not ( = ?auto_2195442 ?auto_2195455 ) ) ( not ( = ?auto_2195444 ?auto_2195443 ) ) ( not ( = ?auto_2195444 ?auto_2195445 ) ) ( not ( = ?auto_2195444 ?auto_2195446 ) ) ( not ( = ?auto_2195444 ?auto_2195447 ) ) ( not ( = ?auto_2195444 ?auto_2195448 ) ) ( not ( = ?auto_2195444 ?auto_2195449 ) ) ( not ( = ?auto_2195444 ?auto_2195450 ) ) ( not ( = ?auto_2195444 ?auto_2195451 ) ) ( not ( = ?auto_2195444 ?auto_2195458 ) ) ( not ( = ?auto_2195444 ?auto_2195455 ) ) ( not ( = ?auto_2195443 ?auto_2195445 ) ) ( not ( = ?auto_2195443 ?auto_2195446 ) ) ( not ( = ?auto_2195443 ?auto_2195447 ) ) ( not ( = ?auto_2195443 ?auto_2195448 ) ) ( not ( = ?auto_2195443 ?auto_2195449 ) ) ( not ( = ?auto_2195443 ?auto_2195450 ) ) ( not ( = ?auto_2195443 ?auto_2195451 ) ) ( not ( = ?auto_2195443 ?auto_2195458 ) ) ( not ( = ?auto_2195443 ?auto_2195455 ) ) ( not ( = ?auto_2195445 ?auto_2195446 ) ) ( not ( = ?auto_2195445 ?auto_2195447 ) ) ( not ( = ?auto_2195445 ?auto_2195448 ) ) ( not ( = ?auto_2195445 ?auto_2195449 ) ) ( not ( = ?auto_2195445 ?auto_2195450 ) ) ( not ( = ?auto_2195445 ?auto_2195451 ) ) ( not ( = ?auto_2195445 ?auto_2195458 ) ) ( not ( = ?auto_2195445 ?auto_2195455 ) ) ( not ( = ?auto_2195446 ?auto_2195447 ) ) ( not ( = ?auto_2195446 ?auto_2195448 ) ) ( not ( = ?auto_2195446 ?auto_2195449 ) ) ( not ( = ?auto_2195446 ?auto_2195450 ) ) ( not ( = ?auto_2195446 ?auto_2195451 ) ) ( not ( = ?auto_2195446 ?auto_2195458 ) ) ( not ( = ?auto_2195446 ?auto_2195455 ) ) ( not ( = ?auto_2195447 ?auto_2195448 ) ) ( not ( = ?auto_2195447 ?auto_2195449 ) ) ( not ( = ?auto_2195447 ?auto_2195450 ) ) ( not ( = ?auto_2195447 ?auto_2195451 ) ) ( not ( = ?auto_2195447 ?auto_2195458 ) ) ( not ( = ?auto_2195447 ?auto_2195455 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195449 ?auto_2195450 ?auto_2195451 )
      ( MAKE-11CRATE-VERIFY ?auto_2195440 ?auto_2195441 ?auto_2195442 ?auto_2195444 ?auto_2195443 ?auto_2195445 ?auto_2195446 ?auto_2195447 ?auto_2195448 ?auto_2195449 ?auto_2195450 ?auto_2195451 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2195459 - SURFACE
      ?auto_2195460 - SURFACE
      ?auto_2195461 - SURFACE
      ?auto_2195463 - SURFACE
      ?auto_2195462 - SURFACE
      ?auto_2195464 - SURFACE
      ?auto_2195465 - SURFACE
      ?auto_2195466 - SURFACE
      ?auto_2195467 - SURFACE
      ?auto_2195468 - SURFACE
      ?auto_2195469 - SURFACE
      ?auto_2195470 - SURFACE
      ?auto_2195471 - SURFACE
    )
    :vars
    (
      ?auto_2195476 - HOIST
      ?auto_2195477 - PLACE
      ?auto_2195474 - PLACE
      ?auto_2195473 - HOIST
      ?auto_2195478 - SURFACE
      ?auto_2195475 - SURFACE
      ?auto_2195472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195476 ?auto_2195477 ) ( IS-CRATE ?auto_2195471 ) ( not ( = ?auto_2195470 ?auto_2195471 ) ) ( not ( = ?auto_2195469 ?auto_2195470 ) ) ( not ( = ?auto_2195469 ?auto_2195471 ) ) ( not ( = ?auto_2195474 ?auto_2195477 ) ) ( HOIST-AT ?auto_2195473 ?auto_2195474 ) ( not ( = ?auto_2195476 ?auto_2195473 ) ) ( SURFACE-AT ?auto_2195471 ?auto_2195474 ) ( ON ?auto_2195471 ?auto_2195478 ) ( CLEAR ?auto_2195471 ) ( not ( = ?auto_2195470 ?auto_2195478 ) ) ( not ( = ?auto_2195471 ?auto_2195478 ) ) ( not ( = ?auto_2195469 ?auto_2195478 ) ) ( IS-CRATE ?auto_2195470 ) ( AVAILABLE ?auto_2195473 ) ( SURFACE-AT ?auto_2195470 ?auto_2195474 ) ( ON ?auto_2195470 ?auto_2195475 ) ( CLEAR ?auto_2195470 ) ( not ( = ?auto_2195470 ?auto_2195475 ) ) ( not ( = ?auto_2195471 ?auto_2195475 ) ) ( not ( = ?auto_2195469 ?auto_2195475 ) ) ( not ( = ?auto_2195478 ?auto_2195475 ) ) ( TRUCK-AT ?auto_2195472 ?auto_2195477 ) ( SURFACE-AT ?auto_2195468 ?auto_2195477 ) ( CLEAR ?auto_2195468 ) ( LIFTING ?auto_2195476 ?auto_2195469 ) ( IS-CRATE ?auto_2195469 ) ( not ( = ?auto_2195468 ?auto_2195469 ) ) ( not ( = ?auto_2195470 ?auto_2195468 ) ) ( not ( = ?auto_2195471 ?auto_2195468 ) ) ( not ( = ?auto_2195478 ?auto_2195468 ) ) ( not ( = ?auto_2195475 ?auto_2195468 ) ) ( ON ?auto_2195460 ?auto_2195459 ) ( ON ?auto_2195461 ?auto_2195460 ) ( ON ?auto_2195463 ?auto_2195461 ) ( ON ?auto_2195462 ?auto_2195463 ) ( ON ?auto_2195464 ?auto_2195462 ) ( ON ?auto_2195465 ?auto_2195464 ) ( ON ?auto_2195466 ?auto_2195465 ) ( ON ?auto_2195467 ?auto_2195466 ) ( ON ?auto_2195468 ?auto_2195467 ) ( not ( = ?auto_2195459 ?auto_2195460 ) ) ( not ( = ?auto_2195459 ?auto_2195461 ) ) ( not ( = ?auto_2195459 ?auto_2195463 ) ) ( not ( = ?auto_2195459 ?auto_2195462 ) ) ( not ( = ?auto_2195459 ?auto_2195464 ) ) ( not ( = ?auto_2195459 ?auto_2195465 ) ) ( not ( = ?auto_2195459 ?auto_2195466 ) ) ( not ( = ?auto_2195459 ?auto_2195467 ) ) ( not ( = ?auto_2195459 ?auto_2195468 ) ) ( not ( = ?auto_2195459 ?auto_2195469 ) ) ( not ( = ?auto_2195459 ?auto_2195470 ) ) ( not ( = ?auto_2195459 ?auto_2195471 ) ) ( not ( = ?auto_2195459 ?auto_2195478 ) ) ( not ( = ?auto_2195459 ?auto_2195475 ) ) ( not ( = ?auto_2195460 ?auto_2195461 ) ) ( not ( = ?auto_2195460 ?auto_2195463 ) ) ( not ( = ?auto_2195460 ?auto_2195462 ) ) ( not ( = ?auto_2195460 ?auto_2195464 ) ) ( not ( = ?auto_2195460 ?auto_2195465 ) ) ( not ( = ?auto_2195460 ?auto_2195466 ) ) ( not ( = ?auto_2195460 ?auto_2195467 ) ) ( not ( = ?auto_2195460 ?auto_2195468 ) ) ( not ( = ?auto_2195460 ?auto_2195469 ) ) ( not ( = ?auto_2195460 ?auto_2195470 ) ) ( not ( = ?auto_2195460 ?auto_2195471 ) ) ( not ( = ?auto_2195460 ?auto_2195478 ) ) ( not ( = ?auto_2195460 ?auto_2195475 ) ) ( not ( = ?auto_2195461 ?auto_2195463 ) ) ( not ( = ?auto_2195461 ?auto_2195462 ) ) ( not ( = ?auto_2195461 ?auto_2195464 ) ) ( not ( = ?auto_2195461 ?auto_2195465 ) ) ( not ( = ?auto_2195461 ?auto_2195466 ) ) ( not ( = ?auto_2195461 ?auto_2195467 ) ) ( not ( = ?auto_2195461 ?auto_2195468 ) ) ( not ( = ?auto_2195461 ?auto_2195469 ) ) ( not ( = ?auto_2195461 ?auto_2195470 ) ) ( not ( = ?auto_2195461 ?auto_2195471 ) ) ( not ( = ?auto_2195461 ?auto_2195478 ) ) ( not ( = ?auto_2195461 ?auto_2195475 ) ) ( not ( = ?auto_2195463 ?auto_2195462 ) ) ( not ( = ?auto_2195463 ?auto_2195464 ) ) ( not ( = ?auto_2195463 ?auto_2195465 ) ) ( not ( = ?auto_2195463 ?auto_2195466 ) ) ( not ( = ?auto_2195463 ?auto_2195467 ) ) ( not ( = ?auto_2195463 ?auto_2195468 ) ) ( not ( = ?auto_2195463 ?auto_2195469 ) ) ( not ( = ?auto_2195463 ?auto_2195470 ) ) ( not ( = ?auto_2195463 ?auto_2195471 ) ) ( not ( = ?auto_2195463 ?auto_2195478 ) ) ( not ( = ?auto_2195463 ?auto_2195475 ) ) ( not ( = ?auto_2195462 ?auto_2195464 ) ) ( not ( = ?auto_2195462 ?auto_2195465 ) ) ( not ( = ?auto_2195462 ?auto_2195466 ) ) ( not ( = ?auto_2195462 ?auto_2195467 ) ) ( not ( = ?auto_2195462 ?auto_2195468 ) ) ( not ( = ?auto_2195462 ?auto_2195469 ) ) ( not ( = ?auto_2195462 ?auto_2195470 ) ) ( not ( = ?auto_2195462 ?auto_2195471 ) ) ( not ( = ?auto_2195462 ?auto_2195478 ) ) ( not ( = ?auto_2195462 ?auto_2195475 ) ) ( not ( = ?auto_2195464 ?auto_2195465 ) ) ( not ( = ?auto_2195464 ?auto_2195466 ) ) ( not ( = ?auto_2195464 ?auto_2195467 ) ) ( not ( = ?auto_2195464 ?auto_2195468 ) ) ( not ( = ?auto_2195464 ?auto_2195469 ) ) ( not ( = ?auto_2195464 ?auto_2195470 ) ) ( not ( = ?auto_2195464 ?auto_2195471 ) ) ( not ( = ?auto_2195464 ?auto_2195478 ) ) ( not ( = ?auto_2195464 ?auto_2195475 ) ) ( not ( = ?auto_2195465 ?auto_2195466 ) ) ( not ( = ?auto_2195465 ?auto_2195467 ) ) ( not ( = ?auto_2195465 ?auto_2195468 ) ) ( not ( = ?auto_2195465 ?auto_2195469 ) ) ( not ( = ?auto_2195465 ?auto_2195470 ) ) ( not ( = ?auto_2195465 ?auto_2195471 ) ) ( not ( = ?auto_2195465 ?auto_2195478 ) ) ( not ( = ?auto_2195465 ?auto_2195475 ) ) ( not ( = ?auto_2195466 ?auto_2195467 ) ) ( not ( = ?auto_2195466 ?auto_2195468 ) ) ( not ( = ?auto_2195466 ?auto_2195469 ) ) ( not ( = ?auto_2195466 ?auto_2195470 ) ) ( not ( = ?auto_2195466 ?auto_2195471 ) ) ( not ( = ?auto_2195466 ?auto_2195478 ) ) ( not ( = ?auto_2195466 ?auto_2195475 ) ) ( not ( = ?auto_2195467 ?auto_2195468 ) ) ( not ( = ?auto_2195467 ?auto_2195469 ) ) ( not ( = ?auto_2195467 ?auto_2195470 ) ) ( not ( = ?auto_2195467 ?auto_2195471 ) ) ( not ( = ?auto_2195467 ?auto_2195478 ) ) ( not ( = ?auto_2195467 ?auto_2195475 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195469 ?auto_2195470 ?auto_2195471 )
      ( MAKE-12CRATE-VERIFY ?auto_2195459 ?auto_2195460 ?auto_2195461 ?auto_2195463 ?auto_2195462 ?auto_2195464 ?auto_2195465 ?auto_2195466 ?auto_2195467 ?auto_2195468 ?auto_2195469 ?auto_2195470 ?auto_2195471 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2195479 - SURFACE
      ?auto_2195480 - SURFACE
      ?auto_2195481 - SURFACE
      ?auto_2195483 - SURFACE
      ?auto_2195482 - SURFACE
      ?auto_2195484 - SURFACE
      ?auto_2195485 - SURFACE
      ?auto_2195486 - SURFACE
      ?auto_2195487 - SURFACE
      ?auto_2195488 - SURFACE
      ?auto_2195489 - SURFACE
      ?auto_2195490 - SURFACE
      ?auto_2195491 - SURFACE
      ?auto_2195492 - SURFACE
    )
    :vars
    (
      ?auto_2195497 - HOIST
      ?auto_2195498 - PLACE
      ?auto_2195495 - PLACE
      ?auto_2195494 - HOIST
      ?auto_2195499 - SURFACE
      ?auto_2195496 - SURFACE
      ?auto_2195493 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195497 ?auto_2195498 ) ( IS-CRATE ?auto_2195492 ) ( not ( = ?auto_2195491 ?auto_2195492 ) ) ( not ( = ?auto_2195490 ?auto_2195491 ) ) ( not ( = ?auto_2195490 ?auto_2195492 ) ) ( not ( = ?auto_2195495 ?auto_2195498 ) ) ( HOIST-AT ?auto_2195494 ?auto_2195495 ) ( not ( = ?auto_2195497 ?auto_2195494 ) ) ( SURFACE-AT ?auto_2195492 ?auto_2195495 ) ( ON ?auto_2195492 ?auto_2195499 ) ( CLEAR ?auto_2195492 ) ( not ( = ?auto_2195491 ?auto_2195499 ) ) ( not ( = ?auto_2195492 ?auto_2195499 ) ) ( not ( = ?auto_2195490 ?auto_2195499 ) ) ( IS-CRATE ?auto_2195491 ) ( AVAILABLE ?auto_2195494 ) ( SURFACE-AT ?auto_2195491 ?auto_2195495 ) ( ON ?auto_2195491 ?auto_2195496 ) ( CLEAR ?auto_2195491 ) ( not ( = ?auto_2195491 ?auto_2195496 ) ) ( not ( = ?auto_2195492 ?auto_2195496 ) ) ( not ( = ?auto_2195490 ?auto_2195496 ) ) ( not ( = ?auto_2195499 ?auto_2195496 ) ) ( TRUCK-AT ?auto_2195493 ?auto_2195498 ) ( SURFACE-AT ?auto_2195489 ?auto_2195498 ) ( CLEAR ?auto_2195489 ) ( LIFTING ?auto_2195497 ?auto_2195490 ) ( IS-CRATE ?auto_2195490 ) ( not ( = ?auto_2195489 ?auto_2195490 ) ) ( not ( = ?auto_2195491 ?auto_2195489 ) ) ( not ( = ?auto_2195492 ?auto_2195489 ) ) ( not ( = ?auto_2195499 ?auto_2195489 ) ) ( not ( = ?auto_2195496 ?auto_2195489 ) ) ( ON ?auto_2195480 ?auto_2195479 ) ( ON ?auto_2195481 ?auto_2195480 ) ( ON ?auto_2195483 ?auto_2195481 ) ( ON ?auto_2195482 ?auto_2195483 ) ( ON ?auto_2195484 ?auto_2195482 ) ( ON ?auto_2195485 ?auto_2195484 ) ( ON ?auto_2195486 ?auto_2195485 ) ( ON ?auto_2195487 ?auto_2195486 ) ( ON ?auto_2195488 ?auto_2195487 ) ( ON ?auto_2195489 ?auto_2195488 ) ( not ( = ?auto_2195479 ?auto_2195480 ) ) ( not ( = ?auto_2195479 ?auto_2195481 ) ) ( not ( = ?auto_2195479 ?auto_2195483 ) ) ( not ( = ?auto_2195479 ?auto_2195482 ) ) ( not ( = ?auto_2195479 ?auto_2195484 ) ) ( not ( = ?auto_2195479 ?auto_2195485 ) ) ( not ( = ?auto_2195479 ?auto_2195486 ) ) ( not ( = ?auto_2195479 ?auto_2195487 ) ) ( not ( = ?auto_2195479 ?auto_2195488 ) ) ( not ( = ?auto_2195479 ?auto_2195489 ) ) ( not ( = ?auto_2195479 ?auto_2195490 ) ) ( not ( = ?auto_2195479 ?auto_2195491 ) ) ( not ( = ?auto_2195479 ?auto_2195492 ) ) ( not ( = ?auto_2195479 ?auto_2195499 ) ) ( not ( = ?auto_2195479 ?auto_2195496 ) ) ( not ( = ?auto_2195480 ?auto_2195481 ) ) ( not ( = ?auto_2195480 ?auto_2195483 ) ) ( not ( = ?auto_2195480 ?auto_2195482 ) ) ( not ( = ?auto_2195480 ?auto_2195484 ) ) ( not ( = ?auto_2195480 ?auto_2195485 ) ) ( not ( = ?auto_2195480 ?auto_2195486 ) ) ( not ( = ?auto_2195480 ?auto_2195487 ) ) ( not ( = ?auto_2195480 ?auto_2195488 ) ) ( not ( = ?auto_2195480 ?auto_2195489 ) ) ( not ( = ?auto_2195480 ?auto_2195490 ) ) ( not ( = ?auto_2195480 ?auto_2195491 ) ) ( not ( = ?auto_2195480 ?auto_2195492 ) ) ( not ( = ?auto_2195480 ?auto_2195499 ) ) ( not ( = ?auto_2195480 ?auto_2195496 ) ) ( not ( = ?auto_2195481 ?auto_2195483 ) ) ( not ( = ?auto_2195481 ?auto_2195482 ) ) ( not ( = ?auto_2195481 ?auto_2195484 ) ) ( not ( = ?auto_2195481 ?auto_2195485 ) ) ( not ( = ?auto_2195481 ?auto_2195486 ) ) ( not ( = ?auto_2195481 ?auto_2195487 ) ) ( not ( = ?auto_2195481 ?auto_2195488 ) ) ( not ( = ?auto_2195481 ?auto_2195489 ) ) ( not ( = ?auto_2195481 ?auto_2195490 ) ) ( not ( = ?auto_2195481 ?auto_2195491 ) ) ( not ( = ?auto_2195481 ?auto_2195492 ) ) ( not ( = ?auto_2195481 ?auto_2195499 ) ) ( not ( = ?auto_2195481 ?auto_2195496 ) ) ( not ( = ?auto_2195483 ?auto_2195482 ) ) ( not ( = ?auto_2195483 ?auto_2195484 ) ) ( not ( = ?auto_2195483 ?auto_2195485 ) ) ( not ( = ?auto_2195483 ?auto_2195486 ) ) ( not ( = ?auto_2195483 ?auto_2195487 ) ) ( not ( = ?auto_2195483 ?auto_2195488 ) ) ( not ( = ?auto_2195483 ?auto_2195489 ) ) ( not ( = ?auto_2195483 ?auto_2195490 ) ) ( not ( = ?auto_2195483 ?auto_2195491 ) ) ( not ( = ?auto_2195483 ?auto_2195492 ) ) ( not ( = ?auto_2195483 ?auto_2195499 ) ) ( not ( = ?auto_2195483 ?auto_2195496 ) ) ( not ( = ?auto_2195482 ?auto_2195484 ) ) ( not ( = ?auto_2195482 ?auto_2195485 ) ) ( not ( = ?auto_2195482 ?auto_2195486 ) ) ( not ( = ?auto_2195482 ?auto_2195487 ) ) ( not ( = ?auto_2195482 ?auto_2195488 ) ) ( not ( = ?auto_2195482 ?auto_2195489 ) ) ( not ( = ?auto_2195482 ?auto_2195490 ) ) ( not ( = ?auto_2195482 ?auto_2195491 ) ) ( not ( = ?auto_2195482 ?auto_2195492 ) ) ( not ( = ?auto_2195482 ?auto_2195499 ) ) ( not ( = ?auto_2195482 ?auto_2195496 ) ) ( not ( = ?auto_2195484 ?auto_2195485 ) ) ( not ( = ?auto_2195484 ?auto_2195486 ) ) ( not ( = ?auto_2195484 ?auto_2195487 ) ) ( not ( = ?auto_2195484 ?auto_2195488 ) ) ( not ( = ?auto_2195484 ?auto_2195489 ) ) ( not ( = ?auto_2195484 ?auto_2195490 ) ) ( not ( = ?auto_2195484 ?auto_2195491 ) ) ( not ( = ?auto_2195484 ?auto_2195492 ) ) ( not ( = ?auto_2195484 ?auto_2195499 ) ) ( not ( = ?auto_2195484 ?auto_2195496 ) ) ( not ( = ?auto_2195485 ?auto_2195486 ) ) ( not ( = ?auto_2195485 ?auto_2195487 ) ) ( not ( = ?auto_2195485 ?auto_2195488 ) ) ( not ( = ?auto_2195485 ?auto_2195489 ) ) ( not ( = ?auto_2195485 ?auto_2195490 ) ) ( not ( = ?auto_2195485 ?auto_2195491 ) ) ( not ( = ?auto_2195485 ?auto_2195492 ) ) ( not ( = ?auto_2195485 ?auto_2195499 ) ) ( not ( = ?auto_2195485 ?auto_2195496 ) ) ( not ( = ?auto_2195486 ?auto_2195487 ) ) ( not ( = ?auto_2195486 ?auto_2195488 ) ) ( not ( = ?auto_2195486 ?auto_2195489 ) ) ( not ( = ?auto_2195486 ?auto_2195490 ) ) ( not ( = ?auto_2195486 ?auto_2195491 ) ) ( not ( = ?auto_2195486 ?auto_2195492 ) ) ( not ( = ?auto_2195486 ?auto_2195499 ) ) ( not ( = ?auto_2195486 ?auto_2195496 ) ) ( not ( = ?auto_2195487 ?auto_2195488 ) ) ( not ( = ?auto_2195487 ?auto_2195489 ) ) ( not ( = ?auto_2195487 ?auto_2195490 ) ) ( not ( = ?auto_2195487 ?auto_2195491 ) ) ( not ( = ?auto_2195487 ?auto_2195492 ) ) ( not ( = ?auto_2195487 ?auto_2195499 ) ) ( not ( = ?auto_2195487 ?auto_2195496 ) ) ( not ( = ?auto_2195488 ?auto_2195489 ) ) ( not ( = ?auto_2195488 ?auto_2195490 ) ) ( not ( = ?auto_2195488 ?auto_2195491 ) ) ( not ( = ?auto_2195488 ?auto_2195492 ) ) ( not ( = ?auto_2195488 ?auto_2195499 ) ) ( not ( = ?auto_2195488 ?auto_2195496 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195490 ?auto_2195491 ?auto_2195492 )
      ( MAKE-13CRATE-VERIFY ?auto_2195479 ?auto_2195480 ?auto_2195481 ?auto_2195483 ?auto_2195482 ?auto_2195484 ?auto_2195485 ?auto_2195486 ?auto_2195487 ?auto_2195488 ?auto_2195489 ?auto_2195490 ?auto_2195491 ?auto_2195492 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2195500 - SURFACE
      ?auto_2195501 - SURFACE
      ?auto_2195502 - SURFACE
      ?auto_2195504 - SURFACE
      ?auto_2195503 - SURFACE
      ?auto_2195505 - SURFACE
      ?auto_2195506 - SURFACE
      ?auto_2195507 - SURFACE
      ?auto_2195508 - SURFACE
      ?auto_2195509 - SURFACE
      ?auto_2195510 - SURFACE
      ?auto_2195511 - SURFACE
      ?auto_2195512 - SURFACE
      ?auto_2195513 - SURFACE
      ?auto_2195514 - SURFACE
    )
    :vars
    (
      ?auto_2195519 - HOIST
      ?auto_2195520 - PLACE
      ?auto_2195517 - PLACE
      ?auto_2195516 - HOIST
      ?auto_2195521 - SURFACE
      ?auto_2195518 - SURFACE
      ?auto_2195515 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195519 ?auto_2195520 ) ( IS-CRATE ?auto_2195514 ) ( not ( = ?auto_2195513 ?auto_2195514 ) ) ( not ( = ?auto_2195512 ?auto_2195513 ) ) ( not ( = ?auto_2195512 ?auto_2195514 ) ) ( not ( = ?auto_2195517 ?auto_2195520 ) ) ( HOIST-AT ?auto_2195516 ?auto_2195517 ) ( not ( = ?auto_2195519 ?auto_2195516 ) ) ( SURFACE-AT ?auto_2195514 ?auto_2195517 ) ( ON ?auto_2195514 ?auto_2195521 ) ( CLEAR ?auto_2195514 ) ( not ( = ?auto_2195513 ?auto_2195521 ) ) ( not ( = ?auto_2195514 ?auto_2195521 ) ) ( not ( = ?auto_2195512 ?auto_2195521 ) ) ( IS-CRATE ?auto_2195513 ) ( AVAILABLE ?auto_2195516 ) ( SURFACE-AT ?auto_2195513 ?auto_2195517 ) ( ON ?auto_2195513 ?auto_2195518 ) ( CLEAR ?auto_2195513 ) ( not ( = ?auto_2195513 ?auto_2195518 ) ) ( not ( = ?auto_2195514 ?auto_2195518 ) ) ( not ( = ?auto_2195512 ?auto_2195518 ) ) ( not ( = ?auto_2195521 ?auto_2195518 ) ) ( TRUCK-AT ?auto_2195515 ?auto_2195520 ) ( SURFACE-AT ?auto_2195511 ?auto_2195520 ) ( CLEAR ?auto_2195511 ) ( LIFTING ?auto_2195519 ?auto_2195512 ) ( IS-CRATE ?auto_2195512 ) ( not ( = ?auto_2195511 ?auto_2195512 ) ) ( not ( = ?auto_2195513 ?auto_2195511 ) ) ( not ( = ?auto_2195514 ?auto_2195511 ) ) ( not ( = ?auto_2195521 ?auto_2195511 ) ) ( not ( = ?auto_2195518 ?auto_2195511 ) ) ( ON ?auto_2195501 ?auto_2195500 ) ( ON ?auto_2195502 ?auto_2195501 ) ( ON ?auto_2195504 ?auto_2195502 ) ( ON ?auto_2195503 ?auto_2195504 ) ( ON ?auto_2195505 ?auto_2195503 ) ( ON ?auto_2195506 ?auto_2195505 ) ( ON ?auto_2195507 ?auto_2195506 ) ( ON ?auto_2195508 ?auto_2195507 ) ( ON ?auto_2195509 ?auto_2195508 ) ( ON ?auto_2195510 ?auto_2195509 ) ( ON ?auto_2195511 ?auto_2195510 ) ( not ( = ?auto_2195500 ?auto_2195501 ) ) ( not ( = ?auto_2195500 ?auto_2195502 ) ) ( not ( = ?auto_2195500 ?auto_2195504 ) ) ( not ( = ?auto_2195500 ?auto_2195503 ) ) ( not ( = ?auto_2195500 ?auto_2195505 ) ) ( not ( = ?auto_2195500 ?auto_2195506 ) ) ( not ( = ?auto_2195500 ?auto_2195507 ) ) ( not ( = ?auto_2195500 ?auto_2195508 ) ) ( not ( = ?auto_2195500 ?auto_2195509 ) ) ( not ( = ?auto_2195500 ?auto_2195510 ) ) ( not ( = ?auto_2195500 ?auto_2195511 ) ) ( not ( = ?auto_2195500 ?auto_2195512 ) ) ( not ( = ?auto_2195500 ?auto_2195513 ) ) ( not ( = ?auto_2195500 ?auto_2195514 ) ) ( not ( = ?auto_2195500 ?auto_2195521 ) ) ( not ( = ?auto_2195500 ?auto_2195518 ) ) ( not ( = ?auto_2195501 ?auto_2195502 ) ) ( not ( = ?auto_2195501 ?auto_2195504 ) ) ( not ( = ?auto_2195501 ?auto_2195503 ) ) ( not ( = ?auto_2195501 ?auto_2195505 ) ) ( not ( = ?auto_2195501 ?auto_2195506 ) ) ( not ( = ?auto_2195501 ?auto_2195507 ) ) ( not ( = ?auto_2195501 ?auto_2195508 ) ) ( not ( = ?auto_2195501 ?auto_2195509 ) ) ( not ( = ?auto_2195501 ?auto_2195510 ) ) ( not ( = ?auto_2195501 ?auto_2195511 ) ) ( not ( = ?auto_2195501 ?auto_2195512 ) ) ( not ( = ?auto_2195501 ?auto_2195513 ) ) ( not ( = ?auto_2195501 ?auto_2195514 ) ) ( not ( = ?auto_2195501 ?auto_2195521 ) ) ( not ( = ?auto_2195501 ?auto_2195518 ) ) ( not ( = ?auto_2195502 ?auto_2195504 ) ) ( not ( = ?auto_2195502 ?auto_2195503 ) ) ( not ( = ?auto_2195502 ?auto_2195505 ) ) ( not ( = ?auto_2195502 ?auto_2195506 ) ) ( not ( = ?auto_2195502 ?auto_2195507 ) ) ( not ( = ?auto_2195502 ?auto_2195508 ) ) ( not ( = ?auto_2195502 ?auto_2195509 ) ) ( not ( = ?auto_2195502 ?auto_2195510 ) ) ( not ( = ?auto_2195502 ?auto_2195511 ) ) ( not ( = ?auto_2195502 ?auto_2195512 ) ) ( not ( = ?auto_2195502 ?auto_2195513 ) ) ( not ( = ?auto_2195502 ?auto_2195514 ) ) ( not ( = ?auto_2195502 ?auto_2195521 ) ) ( not ( = ?auto_2195502 ?auto_2195518 ) ) ( not ( = ?auto_2195504 ?auto_2195503 ) ) ( not ( = ?auto_2195504 ?auto_2195505 ) ) ( not ( = ?auto_2195504 ?auto_2195506 ) ) ( not ( = ?auto_2195504 ?auto_2195507 ) ) ( not ( = ?auto_2195504 ?auto_2195508 ) ) ( not ( = ?auto_2195504 ?auto_2195509 ) ) ( not ( = ?auto_2195504 ?auto_2195510 ) ) ( not ( = ?auto_2195504 ?auto_2195511 ) ) ( not ( = ?auto_2195504 ?auto_2195512 ) ) ( not ( = ?auto_2195504 ?auto_2195513 ) ) ( not ( = ?auto_2195504 ?auto_2195514 ) ) ( not ( = ?auto_2195504 ?auto_2195521 ) ) ( not ( = ?auto_2195504 ?auto_2195518 ) ) ( not ( = ?auto_2195503 ?auto_2195505 ) ) ( not ( = ?auto_2195503 ?auto_2195506 ) ) ( not ( = ?auto_2195503 ?auto_2195507 ) ) ( not ( = ?auto_2195503 ?auto_2195508 ) ) ( not ( = ?auto_2195503 ?auto_2195509 ) ) ( not ( = ?auto_2195503 ?auto_2195510 ) ) ( not ( = ?auto_2195503 ?auto_2195511 ) ) ( not ( = ?auto_2195503 ?auto_2195512 ) ) ( not ( = ?auto_2195503 ?auto_2195513 ) ) ( not ( = ?auto_2195503 ?auto_2195514 ) ) ( not ( = ?auto_2195503 ?auto_2195521 ) ) ( not ( = ?auto_2195503 ?auto_2195518 ) ) ( not ( = ?auto_2195505 ?auto_2195506 ) ) ( not ( = ?auto_2195505 ?auto_2195507 ) ) ( not ( = ?auto_2195505 ?auto_2195508 ) ) ( not ( = ?auto_2195505 ?auto_2195509 ) ) ( not ( = ?auto_2195505 ?auto_2195510 ) ) ( not ( = ?auto_2195505 ?auto_2195511 ) ) ( not ( = ?auto_2195505 ?auto_2195512 ) ) ( not ( = ?auto_2195505 ?auto_2195513 ) ) ( not ( = ?auto_2195505 ?auto_2195514 ) ) ( not ( = ?auto_2195505 ?auto_2195521 ) ) ( not ( = ?auto_2195505 ?auto_2195518 ) ) ( not ( = ?auto_2195506 ?auto_2195507 ) ) ( not ( = ?auto_2195506 ?auto_2195508 ) ) ( not ( = ?auto_2195506 ?auto_2195509 ) ) ( not ( = ?auto_2195506 ?auto_2195510 ) ) ( not ( = ?auto_2195506 ?auto_2195511 ) ) ( not ( = ?auto_2195506 ?auto_2195512 ) ) ( not ( = ?auto_2195506 ?auto_2195513 ) ) ( not ( = ?auto_2195506 ?auto_2195514 ) ) ( not ( = ?auto_2195506 ?auto_2195521 ) ) ( not ( = ?auto_2195506 ?auto_2195518 ) ) ( not ( = ?auto_2195507 ?auto_2195508 ) ) ( not ( = ?auto_2195507 ?auto_2195509 ) ) ( not ( = ?auto_2195507 ?auto_2195510 ) ) ( not ( = ?auto_2195507 ?auto_2195511 ) ) ( not ( = ?auto_2195507 ?auto_2195512 ) ) ( not ( = ?auto_2195507 ?auto_2195513 ) ) ( not ( = ?auto_2195507 ?auto_2195514 ) ) ( not ( = ?auto_2195507 ?auto_2195521 ) ) ( not ( = ?auto_2195507 ?auto_2195518 ) ) ( not ( = ?auto_2195508 ?auto_2195509 ) ) ( not ( = ?auto_2195508 ?auto_2195510 ) ) ( not ( = ?auto_2195508 ?auto_2195511 ) ) ( not ( = ?auto_2195508 ?auto_2195512 ) ) ( not ( = ?auto_2195508 ?auto_2195513 ) ) ( not ( = ?auto_2195508 ?auto_2195514 ) ) ( not ( = ?auto_2195508 ?auto_2195521 ) ) ( not ( = ?auto_2195508 ?auto_2195518 ) ) ( not ( = ?auto_2195509 ?auto_2195510 ) ) ( not ( = ?auto_2195509 ?auto_2195511 ) ) ( not ( = ?auto_2195509 ?auto_2195512 ) ) ( not ( = ?auto_2195509 ?auto_2195513 ) ) ( not ( = ?auto_2195509 ?auto_2195514 ) ) ( not ( = ?auto_2195509 ?auto_2195521 ) ) ( not ( = ?auto_2195509 ?auto_2195518 ) ) ( not ( = ?auto_2195510 ?auto_2195511 ) ) ( not ( = ?auto_2195510 ?auto_2195512 ) ) ( not ( = ?auto_2195510 ?auto_2195513 ) ) ( not ( = ?auto_2195510 ?auto_2195514 ) ) ( not ( = ?auto_2195510 ?auto_2195521 ) ) ( not ( = ?auto_2195510 ?auto_2195518 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195512 ?auto_2195513 ?auto_2195514 )
      ( MAKE-14CRATE-VERIFY ?auto_2195500 ?auto_2195501 ?auto_2195502 ?auto_2195504 ?auto_2195503 ?auto_2195505 ?auto_2195506 ?auto_2195507 ?auto_2195508 ?auto_2195509 ?auto_2195510 ?auto_2195511 ?auto_2195512 ?auto_2195513 ?auto_2195514 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2199827 - SURFACE
      ?auto_2199828 - SURFACE
    )
    :vars
    (
      ?auto_2199836 - HOIST
      ?auto_2199833 - PLACE
      ?auto_2199829 - SURFACE
      ?auto_2199835 - PLACE
      ?auto_2199832 - HOIST
      ?auto_2199830 - SURFACE
      ?auto_2199834 - TRUCK
      ?auto_2199831 - SURFACE
      ?auto_2199837 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2199836 ?auto_2199833 ) ( IS-CRATE ?auto_2199828 ) ( not ( = ?auto_2199827 ?auto_2199828 ) ) ( not ( = ?auto_2199829 ?auto_2199827 ) ) ( not ( = ?auto_2199829 ?auto_2199828 ) ) ( not ( = ?auto_2199835 ?auto_2199833 ) ) ( HOIST-AT ?auto_2199832 ?auto_2199835 ) ( not ( = ?auto_2199836 ?auto_2199832 ) ) ( SURFACE-AT ?auto_2199828 ?auto_2199835 ) ( ON ?auto_2199828 ?auto_2199830 ) ( CLEAR ?auto_2199828 ) ( not ( = ?auto_2199827 ?auto_2199830 ) ) ( not ( = ?auto_2199828 ?auto_2199830 ) ) ( not ( = ?auto_2199829 ?auto_2199830 ) ) ( SURFACE-AT ?auto_2199829 ?auto_2199833 ) ( CLEAR ?auto_2199829 ) ( IS-CRATE ?auto_2199827 ) ( AVAILABLE ?auto_2199836 ) ( TRUCK-AT ?auto_2199834 ?auto_2199835 ) ( SURFACE-AT ?auto_2199827 ?auto_2199835 ) ( ON ?auto_2199827 ?auto_2199831 ) ( CLEAR ?auto_2199827 ) ( not ( = ?auto_2199827 ?auto_2199831 ) ) ( not ( = ?auto_2199828 ?auto_2199831 ) ) ( not ( = ?auto_2199829 ?auto_2199831 ) ) ( not ( = ?auto_2199830 ?auto_2199831 ) ) ( LIFTING ?auto_2199832 ?auto_2199837 ) ( IS-CRATE ?auto_2199837 ) ( not ( = ?auto_2199827 ?auto_2199837 ) ) ( not ( = ?auto_2199828 ?auto_2199837 ) ) ( not ( = ?auto_2199829 ?auto_2199837 ) ) ( not ( = ?auto_2199830 ?auto_2199837 ) ) ( not ( = ?auto_2199831 ?auto_2199837 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2199832 ?auto_2199837 ?auto_2199834 ?auto_2199835 )
      ( MAKE-2CRATE ?auto_2199829 ?auto_2199827 ?auto_2199828 )
      ( MAKE-1CRATE-VERIFY ?auto_2199827 ?auto_2199828 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2199838 - SURFACE
      ?auto_2199839 - SURFACE
      ?auto_2199840 - SURFACE
    )
    :vars
    (
      ?auto_2199844 - HOIST
      ?auto_2199841 - PLACE
      ?auto_2199846 - PLACE
      ?auto_2199847 - HOIST
      ?auto_2199842 - SURFACE
      ?auto_2199845 - TRUCK
      ?auto_2199843 - SURFACE
      ?auto_2199848 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2199844 ?auto_2199841 ) ( IS-CRATE ?auto_2199840 ) ( not ( = ?auto_2199839 ?auto_2199840 ) ) ( not ( = ?auto_2199838 ?auto_2199839 ) ) ( not ( = ?auto_2199838 ?auto_2199840 ) ) ( not ( = ?auto_2199846 ?auto_2199841 ) ) ( HOIST-AT ?auto_2199847 ?auto_2199846 ) ( not ( = ?auto_2199844 ?auto_2199847 ) ) ( SURFACE-AT ?auto_2199840 ?auto_2199846 ) ( ON ?auto_2199840 ?auto_2199842 ) ( CLEAR ?auto_2199840 ) ( not ( = ?auto_2199839 ?auto_2199842 ) ) ( not ( = ?auto_2199840 ?auto_2199842 ) ) ( not ( = ?auto_2199838 ?auto_2199842 ) ) ( SURFACE-AT ?auto_2199838 ?auto_2199841 ) ( CLEAR ?auto_2199838 ) ( IS-CRATE ?auto_2199839 ) ( AVAILABLE ?auto_2199844 ) ( TRUCK-AT ?auto_2199845 ?auto_2199846 ) ( SURFACE-AT ?auto_2199839 ?auto_2199846 ) ( ON ?auto_2199839 ?auto_2199843 ) ( CLEAR ?auto_2199839 ) ( not ( = ?auto_2199839 ?auto_2199843 ) ) ( not ( = ?auto_2199840 ?auto_2199843 ) ) ( not ( = ?auto_2199838 ?auto_2199843 ) ) ( not ( = ?auto_2199842 ?auto_2199843 ) ) ( LIFTING ?auto_2199847 ?auto_2199848 ) ( IS-CRATE ?auto_2199848 ) ( not ( = ?auto_2199839 ?auto_2199848 ) ) ( not ( = ?auto_2199840 ?auto_2199848 ) ) ( not ( = ?auto_2199838 ?auto_2199848 ) ) ( not ( = ?auto_2199842 ?auto_2199848 ) ) ( not ( = ?auto_2199843 ?auto_2199848 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2199839 ?auto_2199840 )
      ( MAKE-2CRATE-VERIFY ?auto_2199838 ?auto_2199839 ?auto_2199840 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2211387 - SURFACE
      ?auto_2211388 - SURFACE
      ?auto_2211389 - SURFACE
      ?auto_2211391 - SURFACE
      ?auto_2211390 - SURFACE
      ?auto_2211392 - SURFACE
      ?auto_2211393 - SURFACE
      ?auto_2211394 - SURFACE
      ?auto_2211395 - SURFACE
      ?auto_2211396 - SURFACE
      ?auto_2211397 - SURFACE
      ?auto_2211398 - SURFACE
      ?auto_2211399 - SURFACE
      ?auto_2211400 - SURFACE
      ?auto_2211401 - SURFACE
      ?auto_2211402 - SURFACE
    )
    :vars
    (
      ?auto_2211403 - HOIST
      ?auto_2211404 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2211403 ?auto_2211404 ) ( SURFACE-AT ?auto_2211401 ?auto_2211404 ) ( CLEAR ?auto_2211401 ) ( LIFTING ?auto_2211403 ?auto_2211402 ) ( IS-CRATE ?auto_2211402 ) ( not ( = ?auto_2211401 ?auto_2211402 ) ) ( ON ?auto_2211388 ?auto_2211387 ) ( ON ?auto_2211389 ?auto_2211388 ) ( ON ?auto_2211391 ?auto_2211389 ) ( ON ?auto_2211390 ?auto_2211391 ) ( ON ?auto_2211392 ?auto_2211390 ) ( ON ?auto_2211393 ?auto_2211392 ) ( ON ?auto_2211394 ?auto_2211393 ) ( ON ?auto_2211395 ?auto_2211394 ) ( ON ?auto_2211396 ?auto_2211395 ) ( ON ?auto_2211397 ?auto_2211396 ) ( ON ?auto_2211398 ?auto_2211397 ) ( ON ?auto_2211399 ?auto_2211398 ) ( ON ?auto_2211400 ?auto_2211399 ) ( ON ?auto_2211401 ?auto_2211400 ) ( not ( = ?auto_2211387 ?auto_2211388 ) ) ( not ( = ?auto_2211387 ?auto_2211389 ) ) ( not ( = ?auto_2211387 ?auto_2211391 ) ) ( not ( = ?auto_2211387 ?auto_2211390 ) ) ( not ( = ?auto_2211387 ?auto_2211392 ) ) ( not ( = ?auto_2211387 ?auto_2211393 ) ) ( not ( = ?auto_2211387 ?auto_2211394 ) ) ( not ( = ?auto_2211387 ?auto_2211395 ) ) ( not ( = ?auto_2211387 ?auto_2211396 ) ) ( not ( = ?auto_2211387 ?auto_2211397 ) ) ( not ( = ?auto_2211387 ?auto_2211398 ) ) ( not ( = ?auto_2211387 ?auto_2211399 ) ) ( not ( = ?auto_2211387 ?auto_2211400 ) ) ( not ( = ?auto_2211387 ?auto_2211401 ) ) ( not ( = ?auto_2211387 ?auto_2211402 ) ) ( not ( = ?auto_2211388 ?auto_2211389 ) ) ( not ( = ?auto_2211388 ?auto_2211391 ) ) ( not ( = ?auto_2211388 ?auto_2211390 ) ) ( not ( = ?auto_2211388 ?auto_2211392 ) ) ( not ( = ?auto_2211388 ?auto_2211393 ) ) ( not ( = ?auto_2211388 ?auto_2211394 ) ) ( not ( = ?auto_2211388 ?auto_2211395 ) ) ( not ( = ?auto_2211388 ?auto_2211396 ) ) ( not ( = ?auto_2211388 ?auto_2211397 ) ) ( not ( = ?auto_2211388 ?auto_2211398 ) ) ( not ( = ?auto_2211388 ?auto_2211399 ) ) ( not ( = ?auto_2211388 ?auto_2211400 ) ) ( not ( = ?auto_2211388 ?auto_2211401 ) ) ( not ( = ?auto_2211388 ?auto_2211402 ) ) ( not ( = ?auto_2211389 ?auto_2211391 ) ) ( not ( = ?auto_2211389 ?auto_2211390 ) ) ( not ( = ?auto_2211389 ?auto_2211392 ) ) ( not ( = ?auto_2211389 ?auto_2211393 ) ) ( not ( = ?auto_2211389 ?auto_2211394 ) ) ( not ( = ?auto_2211389 ?auto_2211395 ) ) ( not ( = ?auto_2211389 ?auto_2211396 ) ) ( not ( = ?auto_2211389 ?auto_2211397 ) ) ( not ( = ?auto_2211389 ?auto_2211398 ) ) ( not ( = ?auto_2211389 ?auto_2211399 ) ) ( not ( = ?auto_2211389 ?auto_2211400 ) ) ( not ( = ?auto_2211389 ?auto_2211401 ) ) ( not ( = ?auto_2211389 ?auto_2211402 ) ) ( not ( = ?auto_2211391 ?auto_2211390 ) ) ( not ( = ?auto_2211391 ?auto_2211392 ) ) ( not ( = ?auto_2211391 ?auto_2211393 ) ) ( not ( = ?auto_2211391 ?auto_2211394 ) ) ( not ( = ?auto_2211391 ?auto_2211395 ) ) ( not ( = ?auto_2211391 ?auto_2211396 ) ) ( not ( = ?auto_2211391 ?auto_2211397 ) ) ( not ( = ?auto_2211391 ?auto_2211398 ) ) ( not ( = ?auto_2211391 ?auto_2211399 ) ) ( not ( = ?auto_2211391 ?auto_2211400 ) ) ( not ( = ?auto_2211391 ?auto_2211401 ) ) ( not ( = ?auto_2211391 ?auto_2211402 ) ) ( not ( = ?auto_2211390 ?auto_2211392 ) ) ( not ( = ?auto_2211390 ?auto_2211393 ) ) ( not ( = ?auto_2211390 ?auto_2211394 ) ) ( not ( = ?auto_2211390 ?auto_2211395 ) ) ( not ( = ?auto_2211390 ?auto_2211396 ) ) ( not ( = ?auto_2211390 ?auto_2211397 ) ) ( not ( = ?auto_2211390 ?auto_2211398 ) ) ( not ( = ?auto_2211390 ?auto_2211399 ) ) ( not ( = ?auto_2211390 ?auto_2211400 ) ) ( not ( = ?auto_2211390 ?auto_2211401 ) ) ( not ( = ?auto_2211390 ?auto_2211402 ) ) ( not ( = ?auto_2211392 ?auto_2211393 ) ) ( not ( = ?auto_2211392 ?auto_2211394 ) ) ( not ( = ?auto_2211392 ?auto_2211395 ) ) ( not ( = ?auto_2211392 ?auto_2211396 ) ) ( not ( = ?auto_2211392 ?auto_2211397 ) ) ( not ( = ?auto_2211392 ?auto_2211398 ) ) ( not ( = ?auto_2211392 ?auto_2211399 ) ) ( not ( = ?auto_2211392 ?auto_2211400 ) ) ( not ( = ?auto_2211392 ?auto_2211401 ) ) ( not ( = ?auto_2211392 ?auto_2211402 ) ) ( not ( = ?auto_2211393 ?auto_2211394 ) ) ( not ( = ?auto_2211393 ?auto_2211395 ) ) ( not ( = ?auto_2211393 ?auto_2211396 ) ) ( not ( = ?auto_2211393 ?auto_2211397 ) ) ( not ( = ?auto_2211393 ?auto_2211398 ) ) ( not ( = ?auto_2211393 ?auto_2211399 ) ) ( not ( = ?auto_2211393 ?auto_2211400 ) ) ( not ( = ?auto_2211393 ?auto_2211401 ) ) ( not ( = ?auto_2211393 ?auto_2211402 ) ) ( not ( = ?auto_2211394 ?auto_2211395 ) ) ( not ( = ?auto_2211394 ?auto_2211396 ) ) ( not ( = ?auto_2211394 ?auto_2211397 ) ) ( not ( = ?auto_2211394 ?auto_2211398 ) ) ( not ( = ?auto_2211394 ?auto_2211399 ) ) ( not ( = ?auto_2211394 ?auto_2211400 ) ) ( not ( = ?auto_2211394 ?auto_2211401 ) ) ( not ( = ?auto_2211394 ?auto_2211402 ) ) ( not ( = ?auto_2211395 ?auto_2211396 ) ) ( not ( = ?auto_2211395 ?auto_2211397 ) ) ( not ( = ?auto_2211395 ?auto_2211398 ) ) ( not ( = ?auto_2211395 ?auto_2211399 ) ) ( not ( = ?auto_2211395 ?auto_2211400 ) ) ( not ( = ?auto_2211395 ?auto_2211401 ) ) ( not ( = ?auto_2211395 ?auto_2211402 ) ) ( not ( = ?auto_2211396 ?auto_2211397 ) ) ( not ( = ?auto_2211396 ?auto_2211398 ) ) ( not ( = ?auto_2211396 ?auto_2211399 ) ) ( not ( = ?auto_2211396 ?auto_2211400 ) ) ( not ( = ?auto_2211396 ?auto_2211401 ) ) ( not ( = ?auto_2211396 ?auto_2211402 ) ) ( not ( = ?auto_2211397 ?auto_2211398 ) ) ( not ( = ?auto_2211397 ?auto_2211399 ) ) ( not ( = ?auto_2211397 ?auto_2211400 ) ) ( not ( = ?auto_2211397 ?auto_2211401 ) ) ( not ( = ?auto_2211397 ?auto_2211402 ) ) ( not ( = ?auto_2211398 ?auto_2211399 ) ) ( not ( = ?auto_2211398 ?auto_2211400 ) ) ( not ( = ?auto_2211398 ?auto_2211401 ) ) ( not ( = ?auto_2211398 ?auto_2211402 ) ) ( not ( = ?auto_2211399 ?auto_2211400 ) ) ( not ( = ?auto_2211399 ?auto_2211401 ) ) ( not ( = ?auto_2211399 ?auto_2211402 ) ) ( not ( = ?auto_2211400 ?auto_2211401 ) ) ( not ( = ?auto_2211400 ?auto_2211402 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2211401 ?auto_2211402 )
      ( MAKE-15CRATE-VERIFY ?auto_2211387 ?auto_2211388 ?auto_2211389 ?auto_2211391 ?auto_2211390 ?auto_2211392 ?auto_2211393 ?auto_2211394 ?auto_2211395 ?auto_2211396 ?auto_2211397 ?auto_2211398 ?auto_2211399 ?auto_2211400 ?auto_2211401 ?auto_2211402 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2211566 - SURFACE
      ?auto_2211567 - SURFACE
      ?auto_2211568 - SURFACE
      ?auto_2211570 - SURFACE
      ?auto_2211569 - SURFACE
      ?auto_2211571 - SURFACE
      ?auto_2211572 - SURFACE
      ?auto_2211573 - SURFACE
      ?auto_2211574 - SURFACE
      ?auto_2211575 - SURFACE
      ?auto_2211576 - SURFACE
      ?auto_2211577 - SURFACE
      ?auto_2211578 - SURFACE
      ?auto_2211579 - SURFACE
      ?auto_2211580 - SURFACE
      ?auto_2211581 - SURFACE
    )
    :vars
    (
      ?auto_2211584 - HOIST
      ?auto_2211582 - PLACE
      ?auto_2211583 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2211584 ?auto_2211582 ) ( SURFACE-AT ?auto_2211580 ?auto_2211582 ) ( CLEAR ?auto_2211580 ) ( IS-CRATE ?auto_2211581 ) ( not ( = ?auto_2211580 ?auto_2211581 ) ) ( TRUCK-AT ?auto_2211583 ?auto_2211582 ) ( AVAILABLE ?auto_2211584 ) ( IN ?auto_2211581 ?auto_2211583 ) ( ON ?auto_2211580 ?auto_2211579 ) ( not ( = ?auto_2211579 ?auto_2211580 ) ) ( not ( = ?auto_2211579 ?auto_2211581 ) ) ( ON ?auto_2211567 ?auto_2211566 ) ( ON ?auto_2211568 ?auto_2211567 ) ( ON ?auto_2211570 ?auto_2211568 ) ( ON ?auto_2211569 ?auto_2211570 ) ( ON ?auto_2211571 ?auto_2211569 ) ( ON ?auto_2211572 ?auto_2211571 ) ( ON ?auto_2211573 ?auto_2211572 ) ( ON ?auto_2211574 ?auto_2211573 ) ( ON ?auto_2211575 ?auto_2211574 ) ( ON ?auto_2211576 ?auto_2211575 ) ( ON ?auto_2211577 ?auto_2211576 ) ( ON ?auto_2211578 ?auto_2211577 ) ( ON ?auto_2211579 ?auto_2211578 ) ( not ( = ?auto_2211566 ?auto_2211567 ) ) ( not ( = ?auto_2211566 ?auto_2211568 ) ) ( not ( = ?auto_2211566 ?auto_2211570 ) ) ( not ( = ?auto_2211566 ?auto_2211569 ) ) ( not ( = ?auto_2211566 ?auto_2211571 ) ) ( not ( = ?auto_2211566 ?auto_2211572 ) ) ( not ( = ?auto_2211566 ?auto_2211573 ) ) ( not ( = ?auto_2211566 ?auto_2211574 ) ) ( not ( = ?auto_2211566 ?auto_2211575 ) ) ( not ( = ?auto_2211566 ?auto_2211576 ) ) ( not ( = ?auto_2211566 ?auto_2211577 ) ) ( not ( = ?auto_2211566 ?auto_2211578 ) ) ( not ( = ?auto_2211566 ?auto_2211579 ) ) ( not ( = ?auto_2211566 ?auto_2211580 ) ) ( not ( = ?auto_2211566 ?auto_2211581 ) ) ( not ( = ?auto_2211567 ?auto_2211568 ) ) ( not ( = ?auto_2211567 ?auto_2211570 ) ) ( not ( = ?auto_2211567 ?auto_2211569 ) ) ( not ( = ?auto_2211567 ?auto_2211571 ) ) ( not ( = ?auto_2211567 ?auto_2211572 ) ) ( not ( = ?auto_2211567 ?auto_2211573 ) ) ( not ( = ?auto_2211567 ?auto_2211574 ) ) ( not ( = ?auto_2211567 ?auto_2211575 ) ) ( not ( = ?auto_2211567 ?auto_2211576 ) ) ( not ( = ?auto_2211567 ?auto_2211577 ) ) ( not ( = ?auto_2211567 ?auto_2211578 ) ) ( not ( = ?auto_2211567 ?auto_2211579 ) ) ( not ( = ?auto_2211567 ?auto_2211580 ) ) ( not ( = ?auto_2211567 ?auto_2211581 ) ) ( not ( = ?auto_2211568 ?auto_2211570 ) ) ( not ( = ?auto_2211568 ?auto_2211569 ) ) ( not ( = ?auto_2211568 ?auto_2211571 ) ) ( not ( = ?auto_2211568 ?auto_2211572 ) ) ( not ( = ?auto_2211568 ?auto_2211573 ) ) ( not ( = ?auto_2211568 ?auto_2211574 ) ) ( not ( = ?auto_2211568 ?auto_2211575 ) ) ( not ( = ?auto_2211568 ?auto_2211576 ) ) ( not ( = ?auto_2211568 ?auto_2211577 ) ) ( not ( = ?auto_2211568 ?auto_2211578 ) ) ( not ( = ?auto_2211568 ?auto_2211579 ) ) ( not ( = ?auto_2211568 ?auto_2211580 ) ) ( not ( = ?auto_2211568 ?auto_2211581 ) ) ( not ( = ?auto_2211570 ?auto_2211569 ) ) ( not ( = ?auto_2211570 ?auto_2211571 ) ) ( not ( = ?auto_2211570 ?auto_2211572 ) ) ( not ( = ?auto_2211570 ?auto_2211573 ) ) ( not ( = ?auto_2211570 ?auto_2211574 ) ) ( not ( = ?auto_2211570 ?auto_2211575 ) ) ( not ( = ?auto_2211570 ?auto_2211576 ) ) ( not ( = ?auto_2211570 ?auto_2211577 ) ) ( not ( = ?auto_2211570 ?auto_2211578 ) ) ( not ( = ?auto_2211570 ?auto_2211579 ) ) ( not ( = ?auto_2211570 ?auto_2211580 ) ) ( not ( = ?auto_2211570 ?auto_2211581 ) ) ( not ( = ?auto_2211569 ?auto_2211571 ) ) ( not ( = ?auto_2211569 ?auto_2211572 ) ) ( not ( = ?auto_2211569 ?auto_2211573 ) ) ( not ( = ?auto_2211569 ?auto_2211574 ) ) ( not ( = ?auto_2211569 ?auto_2211575 ) ) ( not ( = ?auto_2211569 ?auto_2211576 ) ) ( not ( = ?auto_2211569 ?auto_2211577 ) ) ( not ( = ?auto_2211569 ?auto_2211578 ) ) ( not ( = ?auto_2211569 ?auto_2211579 ) ) ( not ( = ?auto_2211569 ?auto_2211580 ) ) ( not ( = ?auto_2211569 ?auto_2211581 ) ) ( not ( = ?auto_2211571 ?auto_2211572 ) ) ( not ( = ?auto_2211571 ?auto_2211573 ) ) ( not ( = ?auto_2211571 ?auto_2211574 ) ) ( not ( = ?auto_2211571 ?auto_2211575 ) ) ( not ( = ?auto_2211571 ?auto_2211576 ) ) ( not ( = ?auto_2211571 ?auto_2211577 ) ) ( not ( = ?auto_2211571 ?auto_2211578 ) ) ( not ( = ?auto_2211571 ?auto_2211579 ) ) ( not ( = ?auto_2211571 ?auto_2211580 ) ) ( not ( = ?auto_2211571 ?auto_2211581 ) ) ( not ( = ?auto_2211572 ?auto_2211573 ) ) ( not ( = ?auto_2211572 ?auto_2211574 ) ) ( not ( = ?auto_2211572 ?auto_2211575 ) ) ( not ( = ?auto_2211572 ?auto_2211576 ) ) ( not ( = ?auto_2211572 ?auto_2211577 ) ) ( not ( = ?auto_2211572 ?auto_2211578 ) ) ( not ( = ?auto_2211572 ?auto_2211579 ) ) ( not ( = ?auto_2211572 ?auto_2211580 ) ) ( not ( = ?auto_2211572 ?auto_2211581 ) ) ( not ( = ?auto_2211573 ?auto_2211574 ) ) ( not ( = ?auto_2211573 ?auto_2211575 ) ) ( not ( = ?auto_2211573 ?auto_2211576 ) ) ( not ( = ?auto_2211573 ?auto_2211577 ) ) ( not ( = ?auto_2211573 ?auto_2211578 ) ) ( not ( = ?auto_2211573 ?auto_2211579 ) ) ( not ( = ?auto_2211573 ?auto_2211580 ) ) ( not ( = ?auto_2211573 ?auto_2211581 ) ) ( not ( = ?auto_2211574 ?auto_2211575 ) ) ( not ( = ?auto_2211574 ?auto_2211576 ) ) ( not ( = ?auto_2211574 ?auto_2211577 ) ) ( not ( = ?auto_2211574 ?auto_2211578 ) ) ( not ( = ?auto_2211574 ?auto_2211579 ) ) ( not ( = ?auto_2211574 ?auto_2211580 ) ) ( not ( = ?auto_2211574 ?auto_2211581 ) ) ( not ( = ?auto_2211575 ?auto_2211576 ) ) ( not ( = ?auto_2211575 ?auto_2211577 ) ) ( not ( = ?auto_2211575 ?auto_2211578 ) ) ( not ( = ?auto_2211575 ?auto_2211579 ) ) ( not ( = ?auto_2211575 ?auto_2211580 ) ) ( not ( = ?auto_2211575 ?auto_2211581 ) ) ( not ( = ?auto_2211576 ?auto_2211577 ) ) ( not ( = ?auto_2211576 ?auto_2211578 ) ) ( not ( = ?auto_2211576 ?auto_2211579 ) ) ( not ( = ?auto_2211576 ?auto_2211580 ) ) ( not ( = ?auto_2211576 ?auto_2211581 ) ) ( not ( = ?auto_2211577 ?auto_2211578 ) ) ( not ( = ?auto_2211577 ?auto_2211579 ) ) ( not ( = ?auto_2211577 ?auto_2211580 ) ) ( not ( = ?auto_2211577 ?auto_2211581 ) ) ( not ( = ?auto_2211578 ?auto_2211579 ) ) ( not ( = ?auto_2211578 ?auto_2211580 ) ) ( not ( = ?auto_2211578 ?auto_2211581 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2211579 ?auto_2211580 ?auto_2211581 )
      ( MAKE-15CRATE-VERIFY ?auto_2211566 ?auto_2211567 ?auto_2211568 ?auto_2211570 ?auto_2211569 ?auto_2211571 ?auto_2211572 ?auto_2211573 ?auto_2211574 ?auto_2211575 ?auto_2211576 ?auto_2211577 ?auto_2211578 ?auto_2211579 ?auto_2211580 ?auto_2211581 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2211761 - SURFACE
      ?auto_2211762 - SURFACE
      ?auto_2211763 - SURFACE
      ?auto_2211765 - SURFACE
      ?auto_2211764 - SURFACE
      ?auto_2211766 - SURFACE
      ?auto_2211767 - SURFACE
      ?auto_2211768 - SURFACE
      ?auto_2211769 - SURFACE
      ?auto_2211770 - SURFACE
      ?auto_2211771 - SURFACE
      ?auto_2211772 - SURFACE
      ?auto_2211773 - SURFACE
      ?auto_2211774 - SURFACE
      ?auto_2211775 - SURFACE
      ?auto_2211776 - SURFACE
    )
    :vars
    (
      ?auto_2211777 - HOIST
      ?auto_2211778 - PLACE
      ?auto_2211779 - TRUCK
      ?auto_2211780 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2211777 ?auto_2211778 ) ( SURFACE-AT ?auto_2211775 ?auto_2211778 ) ( CLEAR ?auto_2211775 ) ( IS-CRATE ?auto_2211776 ) ( not ( = ?auto_2211775 ?auto_2211776 ) ) ( AVAILABLE ?auto_2211777 ) ( IN ?auto_2211776 ?auto_2211779 ) ( ON ?auto_2211775 ?auto_2211774 ) ( not ( = ?auto_2211774 ?auto_2211775 ) ) ( not ( = ?auto_2211774 ?auto_2211776 ) ) ( TRUCK-AT ?auto_2211779 ?auto_2211780 ) ( not ( = ?auto_2211780 ?auto_2211778 ) ) ( ON ?auto_2211762 ?auto_2211761 ) ( ON ?auto_2211763 ?auto_2211762 ) ( ON ?auto_2211765 ?auto_2211763 ) ( ON ?auto_2211764 ?auto_2211765 ) ( ON ?auto_2211766 ?auto_2211764 ) ( ON ?auto_2211767 ?auto_2211766 ) ( ON ?auto_2211768 ?auto_2211767 ) ( ON ?auto_2211769 ?auto_2211768 ) ( ON ?auto_2211770 ?auto_2211769 ) ( ON ?auto_2211771 ?auto_2211770 ) ( ON ?auto_2211772 ?auto_2211771 ) ( ON ?auto_2211773 ?auto_2211772 ) ( ON ?auto_2211774 ?auto_2211773 ) ( not ( = ?auto_2211761 ?auto_2211762 ) ) ( not ( = ?auto_2211761 ?auto_2211763 ) ) ( not ( = ?auto_2211761 ?auto_2211765 ) ) ( not ( = ?auto_2211761 ?auto_2211764 ) ) ( not ( = ?auto_2211761 ?auto_2211766 ) ) ( not ( = ?auto_2211761 ?auto_2211767 ) ) ( not ( = ?auto_2211761 ?auto_2211768 ) ) ( not ( = ?auto_2211761 ?auto_2211769 ) ) ( not ( = ?auto_2211761 ?auto_2211770 ) ) ( not ( = ?auto_2211761 ?auto_2211771 ) ) ( not ( = ?auto_2211761 ?auto_2211772 ) ) ( not ( = ?auto_2211761 ?auto_2211773 ) ) ( not ( = ?auto_2211761 ?auto_2211774 ) ) ( not ( = ?auto_2211761 ?auto_2211775 ) ) ( not ( = ?auto_2211761 ?auto_2211776 ) ) ( not ( = ?auto_2211762 ?auto_2211763 ) ) ( not ( = ?auto_2211762 ?auto_2211765 ) ) ( not ( = ?auto_2211762 ?auto_2211764 ) ) ( not ( = ?auto_2211762 ?auto_2211766 ) ) ( not ( = ?auto_2211762 ?auto_2211767 ) ) ( not ( = ?auto_2211762 ?auto_2211768 ) ) ( not ( = ?auto_2211762 ?auto_2211769 ) ) ( not ( = ?auto_2211762 ?auto_2211770 ) ) ( not ( = ?auto_2211762 ?auto_2211771 ) ) ( not ( = ?auto_2211762 ?auto_2211772 ) ) ( not ( = ?auto_2211762 ?auto_2211773 ) ) ( not ( = ?auto_2211762 ?auto_2211774 ) ) ( not ( = ?auto_2211762 ?auto_2211775 ) ) ( not ( = ?auto_2211762 ?auto_2211776 ) ) ( not ( = ?auto_2211763 ?auto_2211765 ) ) ( not ( = ?auto_2211763 ?auto_2211764 ) ) ( not ( = ?auto_2211763 ?auto_2211766 ) ) ( not ( = ?auto_2211763 ?auto_2211767 ) ) ( not ( = ?auto_2211763 ?auto_2211768 ) ) ( not ( = ?auto_2211763 ?auto_2211769 ) ) ( not ( = ?auto_2211763 ?auto_2211770 ) ) ( not ( = ?auto_2211763 ?auto_2211771 ) ) ( not ( = ?auto_2211763 ?auto_2211772 ) ) ( not ( = ?auto_2211763 ?auto_2211773 ) ) ( not ( = ?auto_2211763 ?auto_2211774 ) ) ( not ( = ?auto_2211763 ?auto_2211775 ) ) ( not ( = ?auto_2211763 ?auto_2211776 ) ) ( not ( = ?auto_2211765 ?auto_2211764 ) ) ( not ( = ?auto_2211765 ?auto_2211766 ) ) ( not ( = ?auto_2211765 ?auto_2211767 ) ) ( not ( = ?auto_2211765 ?auto_2211768 ) ) ( not ( = ?auto_2211765 ?auto_2211769 ) ) ( not ( = ?auto_2211765 ?auto_2211770 ) ) ( not ( = ?auto_2211765 ?auto_2211771 ) ) ( not ( = ?auto_2211765 ?auto_2211772 ) ) ( not ( = ?auto_2211765 ?auto_2211773 ) ) ( not ( = ?auto_2211765 ?auto_2211774 ) ) ( not ( = ?auto_2211765 ?auto_2211775 ) ) ( not ( = ?auto_2211765 ?auto_2211776 ) ) ( not ( = ?auto_2211764 ?auto_2211766 ) ) ( not ( = ?auto_2211764 ?auto_2211767 ) ) ( not ( = ?auto_2211764 ?auto_2211768 ) ) ( not ( = ?auto_2211764 ?auto_2211769 ) ) ( not ( = ?auto_2211764 ?auto_2211770 ) ) ( not ( = ?auto_2211764 ?auto_2211771 ) ) ( not ( = ?auto_2211764 ?auto_2211772 ) ) ( not ( = ?auto_2211764 ?auto_2211773 ) ) ( not ( = ?auto_2211764 ?auto_2211774 ) ) ( not ( = ?auto_2211764 ?auto_2211775 ) ) ( not ( = ?auto_2211764 ?auto_2211776 ) ) ( not ( = ?auto_2211766 ?auto_2211767 ) ) ( not ( = ?auto_2211766 ?auto_2211768 ) ) ( not ( = ?auto_2211766 ?auto_2211769 ) ) ( not ( = ?auto_2211766 ?auto_2211770 ) ) ( not ( = ?auto_2211766 ?auto_2211771 ) ) ( not ( = ?auto_2211766 ?auto_2211772 ) ) ( not ( = ?auto_2211766 ?auto_2211773 ) ) ( not ( = ?auto_2211766 ?auto_2211774 ) ) ( not ( = ?auto_2211766 ?auto_2211775 ) ) ( not ( = ?auto_2211766 ?auto_2211776 ) ) ( not ( = ?auto_2211767 ?auto_2211768 ) ) ( not ( = ?auto_2211767 ?auto_2211769 ) ) ( not ( = ?auto_2211767 ?auto_2211770 ) ) ( not ( = ?auto_2211767 ?auto_2211771 ) ) ( not ( = ?auto_2211767 ?auto_2211772 ) ) ( not ( = ?auto_2211767 ?auto_2211773 ) ) ( not ( = ?auto_2211767 ?auto_2211774 ) ) ( not ( = ?auto_2211767 ?auto_2211775 ) ) ( not ( = ?auto_2211767 ?auto_2211776 ) ) ( not ( = ?auto_2211768 ?auto_2211769 ) ) ( not ( = ?auto_2211768 ?auto_2211770 ) ) ( not ( = ?auto_2211768 ?auto_2211771 ) ) ( not ( = ?auto_2211768 ?auto_2211772 ) ) ( not ( = ?auto_2211768 ?auto_2211773 ) ) ( not ( = ?auto_2211768 ?auto_2211774 ) ) ( not ( = ?auto_2211768 ?auto_2211775 ) ) ( not ( = ?auto_2211768 ?auto_2211776 ) ) ( not ( = ?auto_2211769 ?auto_2211770 ) ) ( not ( = ?auto_2211769 ?auto_2211771 ) ) ( not ( = ?auto_2211769 ?auto_2211772 ) ) ( not ( = ?auto_2211769 ?auto_2211773 ) ) ( not ( = ?auto_2211769 ?auto_2211774 ) ) ( not ( = ?auto_2211769 ?auto_2211775 ) ) ( not ( = ?auto_2211769 ?auto_2211776 ) ) ( not ( = ?auto_2211770 ?auto_2211771 ) ) ( not ( = ?auto_2211770 ?auto_2211772 ) ) ( not ( = ?auto_2211770 ?auto_2211773 ) ) ( not ( = ?auto_2211770 ?auto_2211774 ) ) ( not ( = ?auto_2211770 ?auto_2211775 ) ) ( not ( = ?auto_2211770 ?auto_2211776 ) ) ( not ( = ?auto_2211771 ?auto_2211772 ) ) ( not ( = ?auto_2211771 ?auto_2211773 ) ) ( not ( = ?auto_2211771 ?auto_2211774 ) ) ( not ( = ?auto_2211771 ?auto_2211775 ) ) ( not ( = ?auto_2211771 ?auto_2211776 ) ) ( not ( = ?auto_2211772 ?auto_2211773 ) ) ( not ( = ?auto_2211772 ?auto_2211774 ) ) ( not ( = ?auto_2211772 ?auto_2211775 ) ) ( not ( = ?auto_2211772 ?auto_2211776 ) ) ( not ( = ?auto_2211773 ?auto_2211774 ) ) ( not ( = ?auto_2211773 ?auto_2211775 ) ) ( not ( = ?auto_2211773 ?auto_2211776 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2211774 ?auto_2211775 ?auto_2211776 )
      ( MAKE-15CRATE-VERIFY ?auto_2211761 ?auto_2211762 ?auto_2211763 ?auto_2211765 ?auto_2211764 ?auto_2211766 ?auto_2211767 ?auto_2211768 ?auto_2211769 ?auto_2211770 ?auto_2211771 ?auto_2211772 ?auto_2211773 ?auto_2211774 ?auto_2211775 ?auto_2211776 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2211971 - SURFACE
      ?auto_2211972 - SURFACE
      ?auto_2211973 - SURFACE
      ?auto_2211975 - SURFACE
      ?auto_2211974 - SURFACE
      ?auto_2211976 - SURFACE
      ?auto_2211977 - SURFACE
      ?auto_2211978 - SURFACE
      ?auto_2211979 - SURFACE
      ?auto_2211980 - SURFACE
      ?auto_2211981 - SURFACE
      ?auto_2211982 - SURFACE
      ?auto_2211983 - SURFACE
      ?auto_2211984 - SURFACE
      ?auto_2211985 - SURFACE
      ?auto_2211986 - SURFACE
    )
    :vars
    (
      ?auto_2211987 - HOIST
      ?auto_2211991 - PLACE
      ?auto_2211989 - TRUCK
      ?auto_2211990 - PLACE
      ?auto_2211988 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2211987 ?auto_2211991 ) ( SURFACE-AT ?auto_2211985 ?auto_2211991 ) ( CLEAR ?auto_2211985 ) ( IS-CRATE ?auto_2211986 ) ( not ( = ?auto_2211985 ?auto_2211986 ) ) ( AVAILABLE ?auto_2211987 ) ( ON ?auto_2211985 ?auto_2211984 ) ( not ( = ?auto_2211984 ?auto_2211985 ) ) ( not ( = ?auto_2211984 ?auto_2211986 ) ) ( TRUCK-AT ?auto_2211989 ?auto_2211990 ) ( not ( = ?auto_2211990 ?auto_2211991 ) ) ( HOIST-AT ?auto_2211988 ?auto_2211990 ) ( LIFTING ?auto_2211988 ?auto_2211986 ) ( not ( = ?auto_2211987 ?auto_2211988 ) ) ( ON ?auto_2211972 ?auto_2211971 ) ( ON ?auto_2211973 ?auto_2211972 ) ( ON ?auto_2211975 ?auto_2211973 ) ( ON ?auto_2211974 ?auto_2211975 ) ( ON ?auto_2211976 ?auto_2211974 ) ( ON ?auto_2211977 ?auto_2211976 ) ( ON ?auto_2211978 ?auto_2211977 ) ( ON ?auto_2211979 ?auto_2211978 ) ( ON ?auto_2211980 ?auto_2211979 ) ( ON ?auto_2211981 ?auto_2211980 ) ( ON ?auto_2211982 ?auto_2211981 ) ( ON ?auto_2211983 ?auto_2211982 ) ( ON ?auto_2211984 ?auto_2211983 ) ( not ( = ?auto_2211971 ?auto_2211972 ) ) ( not ( = ?auto_2211971 ?auto_2211973 ) ) ( not ( = ?auto_2211971 ?auto_2211975 ) ) ( not ( = ?auto_2211971 ?auto_2211974 ) ) ( not ( = ?auto_2211971 ?auto_2211976 ) ) ( not ( = ?auto_2211971 ?auto_2211977 ) ) ( not ( = ?auto_2211971 ?auto_2211978 ) ) ( not ( = ?auto_2211971 ?auto_2211979 ) ) ( not ( = ?auto_2211971 ?auto_2211980 ) ) ( not ( = ?auto_2211971 ?auto_2211981 ) ) ( not ( = ?auto_2211971 ?auto_2211982 ) ) ( not ( = ?auto_2211971 ?auto_2211983 ) ) ( not ( = ?auto_2211971 ?auto_2211984 ) ) ( not ( = ?auto_2211971 ?auto_2211985 ) ) ( not ( = ?auto_2211971 ?auto_2211986 ) ) ( not ( = ?auto_2211972 ?auto_2211973 ) ) ( not ( = ?auto_2211972 ?auto_2211975 ) ) ( not ( = ?auto_2211972 ?auto_2211974 ) ) ( not ( = ?auto_2211972 ?auto_2211976 ) ) ( not ( = ?auto_2211972 ?auto_2211977 ) ) ( not ( = ?auto_2211972 ?auto_2211978 ) ) ( not ( = ?auto_2211972 ?auto_2211979 ) ) ( not ( = ?auto_2211972 ?auto_2211980 ) ) ( not ( = ?auto_2211972 ?auto_2211981 ) ) ( not ( = ?auto_2211972 ?auto_2211982 ) ) ( not ( = ?auto_2211972 ?auto_2211983 ) ) ( not ( = ?auto_2211972 ?auto_2211984 ) ) ( not ( = ?auto_2211972 ?auto_2211985 ) ) ( not ( = ?auto_2211972 ?auto_2211986 ) ) ( not ( = ?auto_2211973 ?auto_2211975 ) ) ( not ( = ?auto_2211973 ?auto_2211974 ) ) ( not ( = ?auto_2211973 ?auto_2211976 ) ) ( not ( = ?auto_2211973 ?auto_2211977 ) ) ( not ( = ?auto_2211973 ?auto_2211978 ) ) ( not ( = ?auto_2211973 ?auto_2211979 ) ) ( not ( = ?auto_2211973 ?auto_2211980 ) ) ( not ( = ?auto_2211973 ?auto_2211981 ) ) ( not ( = ?auto_2211973 ?auto_2211982 ) ) ( not ( = ?auto_2211973 ?auto_2211983 ) ) ( not ( = ?auto_2211973 ?auto_2211984 ) ) ( not ( = ?auto_2211973 ?auto_2211985 ) ) ( not ( = ?auto_2211973 ?auto_2211986 ) ) ( not ( = ?auto_2211975 ?auto_2211974 ) ) ( not ( = ?auto_2211975 ?auto_2211976 ) ) ( not ( = ?auto_2211975 ?auto_2211977 ) ) ( not ( = ?auto_2211975 ?auto_2211978 ) ) ( not ( = ?auto_2211975 ?auto_2211979 ) ) ( not ( = ?auto_2211975 ?auto_2211980 ) ) ( not ( = ?auto_2211975 ?auto_2211981 ) ) ( not ( = ?auto_2211975 ?auto_2211982 ) ) ( not ( = ?auto_2211975 ?auto_2211983 ) ) ( not ( = ?auto_2211975 ?auto_2211984 ) ) ( not ( = ?auto_2211975 ?auto_2211985 ) ) ( not ( = ?auto_2211975 ?auto_2211986 ) ) ( not ( = ?auto_2211974 ?auto_2211976 ) ) ( not ( = ?auto_2211974 ?auto_2211977 ) ) ( not ( = ?auto_2211974 ?auto_2211978 ) ) ( not ( = ?auto_2211974 ?auto_2211979 ) ) ( not ( = ?auto_2211974 ?auto_2211980 ) ) ( not ( = ?auto_2211974 ?auto_2211981 ) ) ( not ( = ?auto_2211974 ?auto_2211982 ) ) ( not ( = ?auto_2211974 ?auto_2211983 ) ) ( not ( = ?auto_2211974 ?auto_2211984 ) ) ( not ( = ?auto_2211974 ?auto_2211985 ) ) ( not ( = ?auto_2211974 ?auto_2211986 ) ) ( not ( = ?auto_2211976 ?auto_2211977 ) ) ( not ( = ?auto_2211976 ?auto_2211978 ) ) ( not ( = ?auto_2211976 ?auto_2211979 ) ) ( not ( = ?auto_2211976 ?auto_2211980 ) ) ( not ( = ?auto_2211976 ?auto_2211981 ) ) ( not ( = ?auto_2211976 ?auto_2211982 ) ) ( not ( = ?auto_2211976 ?auto_2211983 ) ) ( not ( = ?auto_2211976 ?auto_2211984 ) ) ( not ( = ?auto_2211976 ?auto_2211985 ) ) ( not ( = ?auto_2211976 ?auto_2211986 ) ) ( not ( = ?auto_2211977 ?auto_2211978 ) ) ( not ( = ?auto_2211977 ?auto_2211979 ) ) ( not ( = ?auto_2211977 ?auto_2211980 ) ) ( not ( = ?auto_2211977 ?auto_2211981 ) ) ( not ( = ?auto_2211977 ?auto_2211982 ) ) ( not ( = ?auto_2211977 ?auto_2211983 ) ) ( not ( = ?auto_2211977 ?auto_2211984 ) ) ( not ( = ?auto_2211977 ?auto_2211985 ) ) ( not ( = ?auto_2211977 ?auto_2211986 ) ) ( not ( = ?auto_2211978 ?auto_2211979 ) ) ( not ( = ?auto_2211978 ?auto_2211980 ) ) ( not ( = ?auto_2211978 ?auto_2211981 ) ) ( not ( = ?auto_2211978 ?auto_2211982 ) ) ( not ( = ?auto_2211978 ?auto_2211983 ) ) ( not ( = ?auto_2211978 ?auto_2211984 ) ) ( not ( = ?auto_2211978 ?auto_2211985 ) ) ( not ( = ?auto_2211978 ?auto_2211986 ) ) ( not ( = ?auto_2211979 ?auto_2211980 ) ) ( not ( = ?auto_2211979 ?auto_2211981 ) ) ( not ( = ?auto_2211979 ?auto_2211982 ) ) ( not ( = ?auto_2211979 ?auto_2211983 ) ) ( not ( = ?auto_2211979 ?auto_2211984 ) ) ( not ( = ?auto_2211979 ?auto_2211985 ) ) ( not ( = ?auto_2211979 ?auto_2211986 ) ) ( not ( = ?auto_2211980 ?auto_2211981 ) ) ( not ( = ?auto_2211980 ?auto_2211982 ) ) ( not ( = ?auto_2211980 ?auto_2211983 ) ) ( not ( = ?auto_2211980 ?auto_2211984 ) ) ( not ( = ?auto_2211980 ?auto_2211985 ) ) ( not ( = ?auto_2211980 ?auto_2211986 ) ) ( not ( = ?auto_2211981 ?auto_2211982 ) ) ( not ( = ?auto_2211981 ?auto_2211983 ) ) ( not ( = ?auto_2211981 ?auto_2211984 ) ) ( not ( = ?auto_2211981 ?auto_2211985 ) ) ( not ( = ?auto_2211981 ?auto_2211986 ) ) ( not ( = ?auto_2211982 ?auto_2211983 ) ) ( not ( = ?auto_2211982 ?auto_2211984 ) ) ( not ( = ?auto_2211982 ?auto_2211985 ) ) ( not ( = ?auto_2211982 ?auto_2211986 ) ) ( not ( = ?auto_2211983 ?auto_2211984 ) ) ( not ( = ?auto_2211983 ?auto_2211985 ) ) ( not ( = ?auto_2211983 ?auto_2211986 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2211984 ?auto_2211985 ?auto_2211986 )
      ( MAKE-15CRATE-VERIFY ?auto_2211971 ?auto_2211972 ?auto_2211973 ?auto_2211975 ?auto_2211974 ?auto_2211976 ?auto_2211977 ?auto_2211978 ?auto_2211979 ?auto_2211980 ?auto_2211981 ?auto_2211982 ?auto_2211983 ?auto_2211984 ?auto_2211985 ?auto_2211986 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2212196 - SURFACE
      ?auto_2212197 - SURFACE
      ?auto_2212198 - SURFACE
      ?auto_2212200 - SURFACE
      ?auto_2212199 - SURFACE
      ?auto_2212201 - SURFACE
      ?auto_2212202 - SURFACE
      ?auto_2212203 - SURFACE
      ?auto_2212204 - SURFACE
      ?auto_2212205 - SURFACE
      ?auto_2212206 - SURFACE
      ?auto_2212207 - SURFACE
      ?auto_2212208 - SURFACE
      ?auto_2212209 - SURFACE
      ?auto_2212210 - SURFACE
      ?auto_2212211 - SURFACE
    )
    :vars
    (
      ?auto_2212214 - HOIST
      ?auto_2212212 - PLACE
      ?auto_2212216 - TRUCK
      ?auto_2212215 - PLACE
      ?auto_2212213 - HOIST
      ?auto_2212217 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2212214 ?auto_2212212 ) ( SURFACE-AT ?auto_2212210 ?auto_2212212 ) ( CLEAR ?auto_2212210 ) ( IS-CRATE ?auto_2212211 ) ( not ( = ?auto_2212210 ?auto_2212211 ) ) ( AVAILABLE ?auto_2212214 ) ( ON ?auto_2212210 ?auto_2212209 ) ( not ( = ?auto_2212209 ?auto_2212210 ) ) ( not ( = ?auto_2212209 ?auto_2212211 ) ) ( TRUCK-AT ?auto_2212216 ?auto_2212215 ) ( not ( = ?auto_2212215 ?auto_2212212 ) ) ( HOIST-AT ?auto_2212213 ?auto_2212215 ) ( not ( = ?auto_2212214 ?auto_2212213 ) ) ( AVAILABLE ?auto_2212213 ) ( SURFACE-AT ?auto_2212211 ?auto_2212215 ) ( ON ?auto_2212211 ?auto_2212217 ) ( CLEAR ?auto_2212211 ) ( not ( = ?auto_2212210 ?auto_2212217 ) ) ( not ( = ?auto_2212211 ?auto_2212217 ) ) ( not ( = ?auto_2212209 ?auto_2212217 ) ) ( ON ?auto_2212197 ?auto_2212196 ) ( ON ?auto_2212198 ?auto_2212197 ) ( ON ?auto_2212200 ?auto_2212198 ) ( ON ?auto_2212199 ?auto_2212200 ) ( ON ?auto_2212201 ?auto_2212199 ) ( ON ?auto_2212202 ?auto_2212201 ) ( ON ?auto_2212203 ?auto_2212202 ) ( ON ?auto_2212204 ?auto_2212203 ) ( ON ?auto_2212205 ?auto_2212204 ) ( ON ?auto_2212206 ?auto_2212205 ) ( ON ?auto_2212207 ?auto_2212206 ) ( ON ?auto_2212208 ?auto_2212207 ) ( ON ?auto_2212209 ?auto_2212208 ) ( not ( = ?auto_2212196 ?auto_2212197 ) ) ( not ( = ?auto_2212196 ?auto_2212198 ) ) ( not ( = ?auto_2212196 ?auto_2212200 ) ) ( not ( = ?auto_2212196 ?auto_2212199 ) ) ( not ( = ?auto_2212196 ?auto_2212201 ) ) ( not ( = ?auto_2212196 ?auto_2212202 ) ) ( not ( = ?auto_2212196 ?auto_2212203 ) ) ( not ( = ?auto_2212196 ?auto_2212204 ) ) ( not ( = ?auto_2212196 ?auto_2212205 ) ) ( not ( = ?auto_2212196 ?auto_2212206 ) ) ( not ( = ?auto_2212196 ?auto_2212207 ) ) ( not ( = ?auto_2212196 ?auto_2212208 ) ) ( not ( = ?auto_2212196 ?auto_2212209 ) ) ( not ( = ?auto_2212196 ?auto_2212210 ) ) ( not ( = ?auto_2212196 ?auto_2212211 ) ) ( not ( = ?auto_2212196 ?auto_2212217 ) ) ( not ( = ?auto_2212197 ?auto_2212198 ) ) ( not ( = ?auto_2212197 ?auto_2212200 ) ) ( not ( = ?auto_2212197 ?auto_2212199 ) ) ( not ( = ?auto_2212197 ?auto_2212201 ) ) ( not ( = ?auto_2212197 ?auto_2212202 ) ) ( not ( = ?auto_2212197 ?auto_2212203 ) ) ( not ( = ?auto_2212197 ?auto_2212204 ) ) ( not ( = ?auto_2212197 ?auto_2212205 ) ) ( not ( = ?auto_2212197 ?auto_2212206 ) ) ( not ( = ?auto_2212197 ?auto_2212207 ) ) ( not ( = ?auto_2212197 ?auto_2212208 ) ) ( not ( = ?auto_2212197 ?auto_2212209 ) ) ( not ( = ?auto_2212197 ?auto_2212210 ) ) ( not ( = ?auto_2212197 ?auto_2212211 ) ) ( not ( = ?auto_2212197 ?auto_2212217 ) ) ( not ( = ?auto_2212198 ?auto_2212200 ) ) ( not ( = ?auto_2212198 ?auto_2212199 ) ) ( not ( = ?auto_2212198 ?auto_2212201 ) ) ( not ( = ?auto_2212198 ?auto_2212202 ) ) ( not ( = ?auto_2212198 ?auto_2212203 ) ) ( not ( = ?auto_2212198 ?auto_2212204 ) ) ( not ( = ?auto_2212198 ?auto_2212205 ) ) ( not ( = ?auto_2212198 ?auto_2212206 ) ) ( not ( = ?auto_2212198 ?auto_2212207 ) ) ( not ( = ?auto_2212198 ?auto_2212208 ) ) ( not ( = ?auto_2212198 ?auto_2212209 ) ) ( not ( = ?auto_2212198 ?auto_2212210 ) ) ( not ( = ?auto_2212198 ?auto_2212211 ) ) ( not ( = ?auto_2212198 ?auto_2212217 ) ) ( not ( = ?auto_2212200 ?auto_2212199 ) ) ( not ( = ?auto_2212200 ?auto_2212201 ) ) ( not ( = ?auto_2212200 ?auto_2212202 ) ) ( not ( = ?auto_2212200 ?auto_2212203 ) ) ( not ( = ?auto_2212200 ?auto_2212204 ) ) ( not ( = ?auto_2212200 ?auto_2212205 ) ) ( not ( = ?auto_2212200 ?auto_2212206 ) ) ( not ( = ?auto_2212200 ?auto_2212207 ) ) ( not ( = ?auto_2212200 ?auto_2212208 ) ) ( not ( = ?auto_2212200 ?auto_2212209 ) ) ( not ( = ?auto_2212200 ?auto_2212210 ) ) ( not ( = ?auto_2212200 ?auto_2212211 ) ) ( not ( = ?auto_2212200 ?auto_2212217 ) ) ( not ( = ?auto_2212199 ?auto_2212201 ) ) ( not ( = ?auto_2212199 ?auto_2212202 ) ) ( not ( = ?auto_2212199 ?auto_2212203 ) ) ( not ( = ?auto_2212199 ?auto_2212204 ) ) ( not ( = ?auto_2212199 ?auto_2212205 ) ) ( not ( = ?auto_2212199 ?auto_2212206 ) ) ( not ( = ?auto_2212199 ?auto_2212207 ) ) ( not ( = ?auto_2212199 ?auto_2212208 ) ) ( not ( = ?auto_2212199 ?auto_2212209 ) ) ( not ( = ?auto_2212199 ?auto_2212210 ) ) ( not ( = ?auto_2212199 ?auto_2212211 ) ) ( not ( = ?auto_2212199 ?auto_2212217 ) ) ( not ( = ?auto_2212201 ?auto_2212202 ) ) ( not ( = ?auto_2212201 ?auto_2212203 ) ) ( not ( = ?auto_2212201 ?auto_2212204 ) ) ( not ( = ?auto_2212201 ?auto_2212205 ) ) ( not ( = ?auto_2212201 ?auto_2212206 ) ) ( not ( = ?auto_2212201 ?auto_2212207 ) ) ( not ( = ?auto_2212201 ?auto_2212208 ) ) ( not ( = ?auto_2212201 ?auto_2212209 ) ) ( not ( = ?auto_2212201 ?auto_2212210 ) ) ( not ( = ?auto_2212201 ?auto_2212211 ) ) ( not ( = ?auto_2212201 ?auto_2212217 ) ) ( not ( = ?auto_2212202 ?auto_2212203 ) ) ( not ( = ?auto_2212202 ?auto_2212204 ) ) ( not ( = ?auto_2212202 ?auto_2212205 ) ) ( not ( = ?auto_2212202 ?auto_2212206 ) ) ( not ( = ?auto_2212202 ?auto_2212207 ) ) ( not ( = ?auto_2212202 ?auto_2212208 ) ) ( not ( = ?auto_2212202 ?auto_2212209 ) ) ( not ( = ?auto_2212202 ?auto_2212210 ) ) ( not ( = ?auto_2212202 ?auto_2212211 ) ) ( not ( = ?auto_2212202 ?auto_2212217 ) ) ( not ( = ?auto_2212203 ?auto_2212204 ) ) ( not ( = ?auto_2212203 ?auto_2212205 ) ) ( not ( = ?auto_2212203 ?auto_2212206 ) ) ( not ( = ?auto_2212203 ?auto_2212207 ) ) ( not ( = ?auto_2212203 ?auto_2212208 ) ) ( not ( = ?auto_2212203 ?auto_2212209 ) ) ( not ( = ?auto_2212203 ?auto_2212210 ) ) ( not ( = ?auto_2212203 ?auto_2212211 ) ) ( not ( = ?auto_2212203 ?auto_2212217 ) ) ( not ( = ?auto_2212204 ?auto_2212205 ) ) ( not ( = ?auto_2212204 ?auto_2212206 ) ) ( not ( = ?auto_2212204 ?auto_2212207 ) ) ( not ( = ?auto_2212204 ?auto_2212208 ) ) ( not ( = ?auto_2212204 ?auto_2212209 ) ) ( not ( = ?auto_2212204 ?auto_2212210 ) ) ( not ( = ?auto_2212204 ?auto_2212211 ) ) ( not ( = ?auto_2212204 ?auto_2212217 ) ) ( not ( = ?auto_2212205 ?auto_2212206 ) ) ( not ( = ?auto_2212205 ?auto_2212207 ) ) ( not ( = ?auto_2212205 ?auto_2212208 ) ) ( not ( = ?auto_2212205 ?auto_2212209 ) ) ( not ( = ?auto_2212205 ?auto_2212210 ) ) ( not ( = ?auto_2212205 ?auto_2212211 ) ) ( not ( = ?auto_2212205 ?auto_2212217 ) ) ( not ( = ?auto_2212206 ?auto_2212207 ) ) ( not ( = ?auto_2212206 ?auto_2212208 ) ) ( not ( = ?auto_2212206 ?auto_2212209 ) ) ( not ( = ?auto_2212206 ?auto_2212210 ) ) ( not ( = ?auto_2212206 ?auto_2212211 ) ) ( not ( = ?auto_2212206 ?auto_2212217 ) ) ( not ( = ?auto_2212207 ?auto_2212208 ) ) ( not ( = ?auto_2212207 ?auto_2212209 ) ) ( not ( = ?auto_2212207 ?auto_2212210 ) ) ( not ( = ?auto_2212207 ?auto_2212211 ) ) ( not ( = ?auto_2212207 ?auto_2212217 ) ) ( not ( = ?auto_2212208 ?auto_2212209 ) ) ( not ( = ?auto_2212208 ?auto_2212210 ) ) ( not ( = ?auto_2212208 ?auto_2212211 ) ) ( not ( = ?auto_2212208 ?auto_2212217 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2212209 ?auto_2212210 ?auto_2212211 )
      ( MAKE-15CRATE-VERIFY ?auto_2212196 ?auto_2212197 ?auto_2212198 ?auto_2212200 ?auto_2212199 ?auto_2212201 ?auto_2212202 ?auto_2212203 ?auto_2212204 ?auto_2212205 ?auto_2212206 ?auto_2212207 ?auto_2212208 ?auto_2212209 ?auto_2212210 ?auto_2212211 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2212422 - SURFACE
      ?auto_2212423 - SURFACE
      ?auto_2212424 - SURFACE
      ?auto_2212426 - SURFACE
      ?auto_2212425 - SURFACE
      ?auto_2212427 - SURFACE
      ?auto_2212428 - SURFACE
      ?auto_2212429 - SURFACE
      ?auto_2212430 - SURFACE
      ?auto_2212431 - SURFACE
      ?auto_2212432 - SURFACE
      ?auto_2212433 - SURFACE
      ?auto_2212434 - SURFACE
      ?auto_2212435 - SURFACE
      ?auto_2212436 - SURFACE
      ?auto_2212437 - SURFACE
    )
    :vars
    (
      ?auto_2212442 - HOIST
      ?auto_2212439 - PLACE
      ?auto_2212443 - PLACE
      ?auto_2212438 - HOIST
      ?auto_2212441 - SURFACE
      ?auto_2212440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2212442 ?auto_2212439 ) ( SURFACE-AT ?auto_2212436 ?auto_2212439 ) ( CLEAR ?auto_2212436 ) ( IS-CRATE ?auto_2212437 ) ( not ( = ?auto_2212436 ?auto_2212437 ) ) ( AVAILABLE ?auto_2212442 ) ( ON ?auto_2212436 ?auto_2212435 ) ( not ( = ?auto_2212435 ?auto_2212436 ) ) ( not ( = ?auto_2212435 ?auto_2212437 ) ) ( not ( = ?auto_2212443 ?auto_2212439 ) ) ( HOIST-AT ?auto_2212438 ?auto_2212443 ) ( not ( = ?auto_2212442 ?auto_2212438 ) ) ( AVAILABLE ?auto_2212438 ) ( SURFACE-AT ?auto_2212437 ?auto_2212443 ) ( ON ?auto_2212437 ?auto_2212441 ) ( CLEAR ?auto_2212437 ) ( not ( = ?auto_2212436 ?auto_2212441 ) ) ( not ( = ?auto_2212437 ?auto_2212441 ) ) ( not ( = ?auto_2212435 ?auto_2212441 ) ) ( TRUCK-AT ?auto_2212440 ?auto_2212439 ) ( ON ?auto_2212423 ?auto_2212422 ) ( ON ?auto_2212424 ?auto_2212423 ) ( ON ?auto_2212426 ?auto_2212424 ) ( ON ?auto_2212425 ?auto_2212426 ) ( ON ?auto_2212427 ?auto_2212425 ) ( ON ?auto_2212428 ?auto_2212427 ) ( ON ?auto_2212429 ?auto_2212428 ) ( ON ?auto_2212430 ?auto_2212429 ) ( ON ?auto_2212431 ?auto_2212430 ) ( ON ?auto_2212432 ?auto_2212431 ) ( ON ?auto_2212433 ?auto_2212432 ) ( ON ?auto_2212434 ?auto_2212433 ) ( ON ?auto_2212435 ?auto_2212434 ) ( not ( = ?auto_2212422 ?auto_2212423 ) ) ( not ( = ?auto_2212422 ?auto_2212424 ) ) ( not ( = ?auto_2212422 ?auto_2212426 ) ) ( not ( = ?auto_2212422 ?auto_2212425 ) ) ( not ( = ?auto_2212422 ?auto_2212427 ) ) ( not ( = ?auto_2212422 ?auto_2212428 ) ) ( not ( = ?auto_2212422 ?auto_2212429 ) ) ( not ( = ?auto_2212422 ?auto_2212430 ) ) ( not ( = ?auto_2212422 ?auto_2212431 ) ) ( not ( = ?auto_2212422 ?auto_2212432 ) ) ( not ( = ?auto_2212422 ?auto_2212433 ) ) ( not ( = ?auto_2212422 ?auto_2212434 ) ) ( not ( = ?auto_2212422 ?auto_2212435 ) ) ( not ( = ?auto_2212422 ?auto_2212436 ) ) ( not ( = ?auto_2212422 ?auto_2212437 ) ) ( not ( = ?auto_2212422 ?auto_2212441 ) ) ( not ( = ?auto_2212423 ?auto_2212424 ) ) ( not ( = ?auto_2212423 ?auto_2212426 ) ) ( not ( = ?auto_2212423 ?auto_2212425 ) ) ( not ( = ?auto_2212423 ?auto_2212427 ) ) ( not ( = ?auto_2212423 ?auto_2212428 ) ) ( not ( = ?auto_2212423 ?auto_2212429 ) ) ( not ( = ?auto_2212423 ?auto_2212430 ) ) ( not ( = ?auto_2212423 ?auto_2212431 ) ) ( not ( = ?auto_2212423 ?auto_2212432 ) ) ( not ( = ?auto_2212423 ?auto_2212433 ) ) ( not ( = ?auto_2212423 ?auto_2212434 ) ) ( not ( = ?auto_2212423 ?auto_2212435 ) ) ( not ( = ?auto_2212423 ?auto_2212436 ) ) ( not ( = ?auto_2212423 ?auto_2212437 ) ) ( not ( = ?auto_2212423 ?auto_2212441 ) ) ( not ( = ?auto_2212424 ?auto_2212426 ) ) ( not ( = ?auto_2212424 ?auto_2212425 ) ) ( not ( = ?auto_2212424 ?auto_2212427 ) ) ( not ( = ?auto_2212424 ?auto_2212428 ) ) ( not ( = ?auto_2212424 ?auto_2212429 ) ) ( not ( = ?auto_2212424 ?auto_2212430 ) ) ( not ( = ?auto_2212424 ?auto_2212431 ) ) ( not ( = ?auto_2212424 ?auto_2212432 ) ) ( not ( = ?auto_2212424 ?auto_2212433 ) ) ( not ( = ?auto_2212424 ?auto_2212434 ) ) ( not ( = ?auto_2212424 ?auto_2212435 ) ) ( not ( = ?auto_2212424 ?auto_2212436 ) ) ( not ( = ?auto_2212424 ?auto_2212437 ) ) ( not ( = ?auto_2212424 ?auto_2212441 ) ) ( not ( = ?auto_2212426 ?auto_2212425 ) ) ( not ( = ?auto_2212426 ?auto_2212427 ) ) ( not ( = ?auto_2212426 ?auto_2212428 ) ) ( not ( = ?auto_2212426 ?auto_2212429 ) ) ( not ( = ?auto_2212426 ?auto_2212430 ) ) ( not ( = ?auto_2212426 ?auto_2212431 ) ) ( not ( = ?auto_2212426 ?auto_2212432 ) ) ( not ( = ?auto_2212426 ?auto_2212433 ) ) ( not ( = ?auto_2212426 ?auto_2212434 ) ) ( not ( = ?auto_2212426 ?auto_2212435 ) ) ( not ( = ?auto_2212426 ?auto_2212436 ) ) ( not ( = ?auto_2212426 ?auto_2212437 ) ) ( not ( = ?auto_2212426 ?auto_2212441 ) ) ( not ( = ?auto_2212425 ?auto_2212427 ) ) ( not ( = ?auto_2212425 ?auto_2212428 ) ) ( not ( = ?auto_2212425 ?auto_2212429 ) ) ( not ( = ?auto_2212425 ?auto_2212430 ) ) ( not ( = ?auto_2212425 ?auto_2212431 ) ) ( not ( = ?auto_2212425 ?auto_2212432 ) ) ( not ( = ?auto_2212425 ?auto_2212433 ) ) ( not ( = ?auto_2212425 ?auto_2212434 ) ) ( not ( = ?auto_2212425 ?auto_2212435 ) ) ( not ( = ?auto_2212425 ?auto_2212436 ) ) ( not ( = ?auto_2212425 ?auto_2212437 ) ) ( not ( = ?auto_2212425 ?auto_2212441 ) ) ( not ( = ?auto_2212427 ?auto_2212428 ) ) ( not ( = ?auto_2212427 ?auto_2212429 ) ) ( not ( = ?auto_2212427 ?auto_2212430 ) ) ( not ( = ?auto_2212427 ?auto_2212431 ) ) ( not ( = ?auto_2212427 ?auto_2212432 ) ) ( not ( = ?auto_2212427 ?auto_2212433 ) ) ( not ( = ?auto_2212427 ?auto_2212434 ) ) ( not ( = ?auto_2212427 ?auto_2212435 ) ) ( not ( = ?auto_2212427 ?auto_2212436 ) ) ( not ( = ?auto_2212427 ?auto_2212437 ) ) ( not ( = ?auto_2212427 ?auto_2212441 ) ) ( not ( = ?auto_2212428 ?auto_2212429 ) ) ( not ( = ?auto_2212428 ?auto_2212430 ) ) ( not ( = ?auto_2212428 ?auto_2212431 ) ) ( not ( = ?auto_2212428 ?auto_2212432 ) ) ( not ( = ?auto_2212428 ?auto_2212433 ) ) ( not ( = ?auto_2212428 ?auto_2212434 ) ) ( not ( = ?auto_2212428 ?auto_2212435 ) ) ( not ( = ?auto_2212428 ?auto_2212436 ) ) ( not ( = ?auto_2212428 ?auto_2212437 ) ) ( not ( = ?auto_2212428 ?auto_2212441 ) ) ( not ( = ?auto_2212429 ?auto_2212430 ) ) ( not ( = ?auto_2212429 ?auto_2212431 ) ) ( not ( = ?auto_2212429 ?auto_2212432 ) ) ( not ( = ?auto_2212429 ?auto_2212433 ) ) ( not ( = ?auto_2212429 ?auto_2212434 ) ) ( not ( = ?auto_2212429 ?auto_2212435 ) ) ( not ( = ?auto_2212429 ?auto_2212436 ) ) ( not ( = ?auto_2212429 ?auto_2212437 ) ) ( not ( = ?auto_2212429 ?auto_2212441 ) ) ( not ( = ?auto_2212430 ?auto_2212431 ) ) ( not ( = ?auto_2212430 ?auto_2212432 ) ) ( not ( = ?auto_2212430 ?auto_2212433 ) ) ( not ( = ?auto_2212430 ?auto_2212434 ) ) ( not ( = ?auto_2212430 ?auto_2212435 ) ) ( not ( = ?auto_2212430 ?auto_2212436 ) ) ( not ( = ?auto_2212430 ?auto_2212437 ) ) ( not ( = ?auto_2212430 ?auto_2212441 ) ) ( not ( = ?auto_2212431 ?auto_2212432 ) ) ( not ( = ?auto_2212431 ?auto_2212433 ) ) ( not ( = ?auto_2212431 ?auto_2212434 ) ) ( not ( = ?auto_2212431 ?auto_2212435 ) ) ( not ( = ?auto_2212431 ?auto_2212436 ) ) ( not ( = ?auto_2212431 ?auto_2212437 ) ) ( not ( = ?auto_2212431 ?auto_2212441 ) ) ( not ( = ?auto_2212432 ?auto_2212433 ) ) ( not ( = ?auto_2212432 ?auto_2212434 ) ) ( not ( = ?auto_2212432 ?auto_2212435 ) ) ( not ( = ?auto_2212432 ?auto_2212436 ) ) ( not ( = ?auto_2212432 ?auto_2212437 ) ) ( not ( = ?auto_2212432 ?auto_2212441 ) ) ( not ( = ?auto_2212433 ?auto_2212434 ) ) ( not ( = ?auto_2212433 ?auto_2212435 ) ) ( not ( = ?auto_2212433 ?auto_2212436 ) ) ( not ( = ?auto_2212433 ?auto_2212437 ) ) ( not ( = ?auto_2212433 ?auto_2212441 ) ) ( not ( = ?auto_2212434 ?auto_2212435 ) ) ( not ( = ?auto_2212434 ?auto_2212436 ) ) ( not ( = ?auto_2212434 ?auto_2212437 ) ) ( not ( = ?auto_2212434 ?auto_2212441 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2212435 ?auto_2212436 ?auto_2212437 )
      ( MAKE-15CRATE-VERIFY ?auto_2212422 ?auto_2212423 ?auto_2212424 ?auto_2212426 ?auto_2212425 ?auto_2212427 ?auto_2212428 ?auto_2212429 ?auto_2212430 ?auto_2212431 ?auto_2212432 ?auto_2212433 ?auto_2212434 ?auto_2212435 ?auto_2212436 ?auto_2212437 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2212648 - SURFACE
      ?auto_2212649 - SURFACE
      ?auto_2212650 - SURFACE
      ?auto_2212652 - SURFACE
      ?auto_2212651 - SURFACE
      ?auto_2212653 - SURFACE
      ?auto_2212654 - SURFACE
      ?auto_2212655 - SURFACE
      ?auto_2212656 - SURFACE
      ?auto_2212657 - SURFACE
      ?auto_2212658 - SURFACE
      ?auto_2212659 - SURFACE
      ?auto_2212660 - SURFACE
      ?auto_2212661 - SURFACE
      ?auto_2212662 - SURFACE
      ?auto_2212663 - SURFACE
    )
    :vars
    (
      ?auto_2212666 - HOIST
      ?auto_2212667 - PLACE
      ?auto_2212669 - PLACE
      ?auto_2212668 - HOIST
      ?auto_2212664 - SURFACE
      ?auto_2212665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2212666 ?auto_2212667 ) ( IS-CRATE ?auto_2212663 ) ( not ( = ?auto_2212662 ?auto_2212663 ) ) ( not ( = ?auto_2212661 ?auto_2212662 ) ) ( not ( = ?auto_2212661 ?auto_2212663 ) ) ( not ( = ?auto_2212669 ?auto_2212667 ) ) ( HOIST-AT ?auto_2212668 ?auto_2212669 ) ( not ( = ?auto_2212666 ?auto_2212668 ) ) ( AVAILABLE ?auto_2212668 ) ( SURFACE-AT ?auto_2212663 ?auto_2212669 ) ( ON ?auto_2212663 ?auto_2212664 ) ( CLEAR ?auto_2212663 ) ( not ( = ?auto_2212662 ?auto_2212664 ) ) ( not ( = ?auto_2212663 ?auto_2212664 ) ) ( not ( = ?auto_2212661 ?auto_2212664 ) ) ( TRUCK-AT ?auto_2212665 ?auto_2212667 ) ( SURFACE-AT ?auto_2212661 ?auto_2212667 ) ( CLEAR ?auto_2212661 ) ( LIFTING ?auto_2212666 ?auto_2212662 ) ( IS-CRATE ?auto_2212662 ) ( ON ?auto_2212649 ?auto_2212648 ) ( ON ?auto_2212650 ?auto_2212649 ) ( ON ?auto_2212652 ?auto_2212650 ) ( ON ?auto_2212651 ?auto_2212652 ) ( ON ?auto_2212653 ?auto_2212651 ) ( ON ?auto_2212654 ?auto_2212653 ) ( ON ?auto_2212655 ?auto_2212654 ) ( ON ?auto_2212656 ?auto_2212655 ) ( ON ?auto_2212657 ?auto_2212656 ) ( ON ?auto_2212658 ?auto_2212657 ) ( ON ?auto_2212659 ?auto_2212658 ) ( ON ?auto_2212660 ?auto_2212659 ) ( ON ?auto_2212661 ?auto_2212660 ) ( not ( = ?auto_2212648 ?auto_2212649 ) ) ( not ( = ?auto_2212648 ?auto_2212650 ) ) ( not ( = ?auto_2212648 ?auto_2212652 ) ) ( not ( = ?auto_2212648 ?auto_2212651 ) ) ( not ( = ?auto_2212648 ?auto_2212653 ) ) ( not ( = ?auto_2212648 ?auto_2212654 ) ) ( not ( = ?auto_2212648 ?auto_2212655 ) ) ( not ( = ?auto_2212648 ?auto_2212656 ) ) ( not ( = ?auto_2212648 ?auto_2212657 ) ) ( not ( = ?auto_2212648 ?auto_2212658 ) ) ( not ( = ?auto_2212648 ?auto_2212659 ) ) ( not ( = ?auto_2212648 ?auto_2212660 ) ) ( not ( = ?auto_2212648 ?auto_2212661 ) ) ( not ( = ?auto_2212648 ?auto_2212662 ) ) ( not ( = ?auto_2212648 ?auto_2212663 ) ) ( not ( = ?auto_2212648 ?auto_2212664 ) ) ( not ( = ?auto_2212649 ?auto_2212650 ) ) ( not ( = ?auto_2212649 ?auto_2212652 ) ) ( not ( = ?auto_2212649 ?auto_2212651 ) ) ( not ( = ?auto_2212649 ?auto_2212653 ) ) ( not ( = ?auto_2212649 ?auto_2212654 ) ) ( not ( = ?auto_2212649 ?auto_2212655 ) ) ( not ( = ?auto_2212649 ?auto_2212656 ) ) ( not ( = ?auto_2212649 ?auto_2212657 ) ) ( not ( = ?auto_2212649 ?auto_2212658 ) ) ( not ( = ?auto_2212649 ?auto_2212659 ) ) ( not ( = ?auto_2212649 ?auto_2212660 ) ) ( not ( = ?auto_2212649 ?auto_2212661 ) ) ( not ( = ?auto_2212649 ?auto_2212662 ) ) ( not ( = ?auto_2212649 ?auto_2212663 ) ) ( not ( = ?auto_2212649 ?auto_2212664 ) ) ( not ( = ?auto_2212650 ?auto_2212652 ) ) ( not ( = ?auto_2212650 ?auto_2212651 ) ) ( not ( = ?auto_2212650 ?auto_2212653 ) ) ( not ( = ?auto_2212650 ?auto_2212654 ) ) ( not ( = ?auto_2212650 ?auto_2212655 ) ) ( not ( = ?auto_2212650 ?auto_2212656 ) ) ( not ( = ?auto_2212650 ?auto_2212657 ) ) ( not ( = ?auto_2212650 ?auto_2212658 ) ) ( not ( = ?auto_2212650 ?auto_2212659 ) ) ( not ( = ?auto_2212650 ?auto_2212660 ) ) ( not ( = ?auto_2212650 ?auto_2212661 ) ) ( not ( = ?auto_2212650 ?auto_2212662 ) ) ( not ( = ?auto_2212650 ?auto_2212663 ) ) ( not ( = ?auto_2212650 ?auto_2212664 ) ) ( not ( = ?auto_2212652 ?auto_2212651 ) ) ( not ( = ?auto_2212652 ?auto_2212653 ) ) ( not ( = ?auto_2212652 ?auto_2212654 ) ) ( not ( = ?auto_2212652 ?auto_2212655 ) ) ( not ( = ?auto_2212652 ?auto_2212656 ) ) ( not ( = ?auto_2212652 ?auto_2212657 ) ) ( not ( = ?auto_2212652 ?auto_2212658 ) ) ( not ( = ?auto_2212652 ?auto_2212659 ) ) ( not ( = ?auto_2212652 ?auto_2212660 ) ) ( not ( = ?auto_2212652 ?auto_2212661 ) ) ( not ( = ?auto_2212652 ?auto_2212662 ) ) ( not ( = ?auto_2212652 ?auto_2212663 ) ) ( not ( = ?auto_2212652 ?auto_2212664 ) ) ( not ( = ?auto_2212651 ?auto_2212653 ) ) ( not ( = ?auto_2212651 ?auto_2212654 ) ) ( not ( = ?auto_2212651 ?auto_2212655 ) ) ( not ( = ?auto_2212651 ?auto_2212656 ) ) ( not ( = ?auto_2212651 ?auto_2212657 ) ) ( not ( = ?auto_2212651 ?auto_2212658 ) ) ( not ( = ?auto_2212651 ?auto_2212659 ) ) ( not ( = ?auto_2212651 ?auto_2212660 ) ) ( not ( = ?auto_2212651 ?auto_2212661 ) ) ( not ( = ?auto_2212651 ?auto_2212662 ) ) ( not ( = ?auto_2212651 ?auto_2212663 ) ) ( not ( = ?auto_2212651 ?auto_2212664 ) ) ( not ( = ?auto_2212653 ?auto_2212654 ) ) ( not ( = ?auto_2212653 ?auto_2212655 ) ) ( not ( = ?auto_2212653 ?auto_2212656 ) ) ( not ( = ?auto_2212653 ?auto_2212657 ) ) ( not ( = ?auto_2212653 ?auto_2212658 ) ) ( not ( = ?auto_2212653 ?auto_2212659 ) ) ( not ( = ?auto_2212653 ?auto_2212660 ) ) ( not ( = ?auto_2212653 ?auto_2212661 ) ) ( not ( = ?auto_2212653 ?auto_2212662 ) ) ( not ( = ?auto_2212653 ?auto_2212663 ) ) ( not ( = ?auto_2212653 ?auto_2212664 ) ) ( not ( = ?auto_2212654 ?auto_2212655 ) ) ( not ( = ?auto_2212654 ?auto_2212656 ) ) ( not ( = ?auto_2212654 ?auto_2212657 ) ) ( not ( = ?auto_2212654 ?auto_2212658 ) ) ( not ( = ?auto_2212654 ?auto_2212659 ) ) ( not ( = ?auto_2212654 ?auto_2212660 ) ) ( not ( = ?auto_2212654 ?auto_2212661 ) ) ( not ( = ?auto_2212654 ?auto_2212662 ) ) ( not ( = ?auto_2212654 ?auto_2212663 ) ) ( not ( = ?auto_2212654 ?auto_2212664 ) ) ( not ( = ?auto_2212655 ?auto_2212656 ) ) ( not ( = ?auto_2212655 ?auto_2212657 ) ) ( not ( = ?auto_2212655 ?auto_2212658 ) ) ( not ( = ?auto_2212655 ?auto_2212659 ) ) ( not ( = ?auto_2212655 ?auto_2212660 ) ) ( not ( = ?auto_2212655 ?auto_2212661 ) ) ( not ( = ?auto_2212655 ?auto_2212662 ) ) ( not ( = ?auto_2212655 ?auto_2212663 ) ) ( not ( = ?auto_2212655 ?auto_2212664 ) ) ( not ( = ?auto_2212656 ?auto_2212657 ) ) ( not ( = ?auto_2212656 ?auto_2212658 ) ) ( not ( = ?auto_2212656 ?auto_2212659 ) ) ( not ( = ?auto_2212656 ?auto_2212660 ) ) ( not ( = ?auto_2212656 ?auto_2212661 ) ) ( not ( = ?auto_2212656 ?auto_2212662 ) ) ( not ( = ?auto_2212656 ?auto_2212663 ) ) ( not ( = ?auto_2212656 ?auto_2212664 ) ) ( not ( = ?auto_2212657 ?auto_2212658 ) ) ( not ( = ?auto_2212657 ?auto_2212659 ) ) ( not ( = ?auto_2212657 ?auto_2212660 ) ) ( not ( = ?auto_2212657 ?auto_2212661 ) ) ( not ( = ?auto_2212657 ?auto_2212662 ) ) ( not ( = ?auto_2212657 ?auto_2212663 ) ) ( not ( = ?auto_2212657 ?auto_2212664 ) ) ( not ( = ?auto_2212658 ?auto_2212659 ) ) ( not ( = ?auto_2212658 ?auto_2212660 ) ) ( not ( = ?auto_2212658 ?auto_2212661 ) ) ( not ( = ?auto_2212658 ?auto_2212662 ) ) ( not ( = ?auto_2212658 ?auto_2212663 ) ) ( not ( = ?auto_2212658 ?auto_2212664 ) ) ( not ( = ?auto_2212659 ?auto_2212660 ) ) ( not ( = ?auto_2212659 ?auto_2212661 ) ) ( not ( = ?auto_2212659 ?auto_2212662 ) ) ( not ( = ?auto_2212659 ?auto_2212663 ) ) ( not ( = ?auto_2212659 ?auto_2212664 ) ) ( not ( = ?auto_2212660 ?auto_2212661 ) ) ( not ( = ?auto_2212660 ?auto_2212662 ) ) ( not ( = ?auto_2212660 ?auto_2212663 ) ) ( not ( = ?auto_2212660 ?auto_2212664 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2212661 ?auto_2212662 ?auto_2212663 )
      ( MAKE-15CRATE-VERIFY ?auto_2212648 ?auto_2212649 ?auto_2212650 ?auto_2212652 ?auto_2212651 ?auto_2212653 ?auto_2212654 ?auto_2212655 ?auto_2212656 ?auto_2212657 ?auto_2212658 ?auto_2212659 ?auto_2212660 ?auto_2212661 ?auto_2212662 ?auto_2212663 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2212874 - SURFACE
      ?auto_2212875 - SURFACE
      ?auto_2212876 - SURFACE
      ?auto_2212878 - SURFACE
      ?auto_2212877 - SURFACE
      ?auto_2212879 - SURFACE
      ?auto_2212880 - SURFACE
      ?auto_2212881 - SURFACE
      ?auto_2212882 - SURFACE
      ?auto_2212883 - SURFACE
      ?auto_2212884 - SURFACE
      ?auto_2212885 - SURFACE
      ?auto_2212886 - SURFACE
      ?auto_2212887 - SURFACE
      ?auto_2212888 - SURFACE
      ?auto_2212889 - SURFACE
    )
    :vars
    (
      ?auto_2212890 - HOIST
      ?auto_2212891 - PLACE
      ?auto_2212892 - PLACE
      ?auto_2212893 - HOIST
      ?auto_2212895 - SURFACE
      ?auto_2212894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2212890 ?auto_2212891 ) ( IS-CRATE ?auto_2212889 ) ( not ( = ?auto_2212888 ?auto_2212889 ) ) ( not ( = ?auto_2212887 ?auto_2212888 ) ) ( not ( = ?auto_2212887 ?auto_2212889 ) ) ( not ( = ?auto_2212892 ?auto_2212891 ) ) ( HOIST-AT ?auto_2212893 ?auto_2212892 ) ( not ( = ?auto_2212890 ?auto_2212893 ) ) ( AVAILABLE ?auto_2212893 ) ( SURFACE-AT ?auto_2212889 ?auto_2212892 ) ( ON ?auto_2212889 ?auto_2212895 ) ( CLEAR ?auto_2212889 ) ( not ( = ?auto_2212888 ?auto_2212895 ) ) ( not ( = ?auto_2212889 ?auto_2212895 ) ) ( not ( = ?auto_2212887 ?auto_2212895 ) ) ( TRUCK-AT ?auto_2212894 ?auto_2212891 ) ( SURFACE-AT ?auto_2212887 ?auto_2212891 ) ( CLEAR ?auto_2212887 ) ( IS-CRATE ?auto_2212888 ) ( AVAILABLE ?auto_2212890 ) ( IN ?auto_2212888 ?auto_2212894 ) ( ON ?auto_2212875 ?auto_2212874 ) ( ON ?auto_2212876 ?auto_2212875 ) ( ON ?auto_2212878 ?auto_2212876 ) ( ON ?auto_2212877 ?auto_2212878 ) ( ON ?auto_2212879 ?auto_2212877 ) ( ON ?auto_2212880 ?auto_2212879 ) ( ON ?auto_2212881 ?auto_2212880 ) ( ON ?auto_2212882 ?auto_2212881 ) ( ON ?auto_2212883 ?auto_2212882 ) ( ON ?auto_2212884 ?auto_2212883 ) ( ON ?auto_2212885 ?auto_2212884 ) ( ON ?auto_2212886 ?auto_2212885 ) ( ON ?auto_2212887 ?auto_2212886 ) ( not ( = ?auto_2212874 ?auto_2212875 ) ) ( not ( = ?auto_2212874 ?auto_2212876 ) ) ( not ( = ?auto_2212874 ?auto_2212878 ) ) ( not ( = ?auto_2212874 ?auto_2212877 ) ) ( not ( = ?auto_2212874 ?auto_2212879 ) ) ( not ( = ?auto_2212874 ?auto_2212880 ) ) ( not ( = ?auto_2212874 ?auto_2212881 ) ) ( not ( = ?auto_2212874 ?auto_2212882 ) ) ( not ( = ?auto_2212874 ?auto_2212883 ) ) ( not ( = ?auto_2212874 ?auto_2212884 ) ) ( not ( = ?auto_2212874 ?auto_2212885 ) ) ( not ( = ?auto_2212874 ?auto_2212886 ) ) ( not ( = ?auto_2212874 ?auto_2212887 ) ) ( not ( = ?auto_2212874 ?auto_2212888 ) ) ( not ( = ?auto_2212874 ?auto_2212889 ) ) ( not ( = ?auto_2212874 ?auto_2212895 ) ) ( not ( = ?auto_2212875 ?auto_2212876 ) ) ( not ( = ?auto_2212875 ?auto_2212878 ) ) ( not ( = ?auto_2212875 ?auto_2212877 ) ) ( not ( = ?auto_2212875 ?auto_2212879 ) ) ( not ( = ?auto_2212875 ?auto_2212880 ) ) ( not ( = ?auto_2212875 ?auto_2212881 ) ) ( not ( = ?auto_2212875 ?auto_2212882 ) ) ( not ( = ?auto_2212875 ?auto_2212883 ) ) ( not ( = ?auto_2212875 ?auto_2212884 ) ) ( not ( = ?auto_2212875 ?auto_2212885 ) ) ( not ( = ?auto_2212875 ?auto_2212886 ) ) ( not ( = ?auto_2212875 ?auto_2212887 ) ) ( not ( = ?auto_2212875 ?auto_2212888 ) ) ( not ( = ?auto_2212875 ?auto_2212889 ) ) ( not ( = ?auto_2212875 ?auto_2212895 ) ) ( not ( = ?auto_2212876 ?auto_2212878 ) ) ( not ( = ?auto_2212876 ?auto_2212877 ) ) ( not ( = ?auto_2212876 ?auto_2212879 ) ) ( not ( = ?auto_2212876 ?auto_2212880 ) ) ( not ( = ?auto_2212876 ?auto_2212881 ) ) ( not ( = ?auto_2212876 ?auto_2212882 ) ) ( not ( = ?auto_2212876 ?auto_2212883 ) ) ( not ( = ?auto_2212876 ?auto_2212884 ) ) ( not ( = ?auto_2212876 ?auto_2212885 ) ) ( not ( = ?auto_2212876 ?auto_2212886 ) ) ( not ( = ?auto_2212876 ?auto_2212887 ) ) ( not ( = ?auto_2212876 ?auto_2212888 ) ) ( not ( = ?auto_2212876 ?auto_2212889 ) ) ( not ( = ?auto_2212876 ?auto_2212895 ) ) ( not ( = ?auto_2212878 ?auto_2212877 ) ) ( not ( = ?auto_2212878 ?auto_2212879 ) ) ( not ( = ?auto_2212878 ?auto_2212880 ) ) ( not ( = ?auto_2212878 ?auto_2212881 ) ) ( not ( = ?auto_2212878 ?auto_2212882 ) ) ( not ( = ?auto_2212878 ?auto_2212883 ) ) ( not ( = ?auto_2212878 ?auto_2212884 ) ) ( not ( = ?auto_2212878 ?auto_2212885 ) ) ( not ( = ?auto_2212878 ?auto_2212886 ) ) ( not ( = ?auto_2212878 ?auto_2212887 ) ) ( not ( = ?auto_2212878 ?auto_2212888 ) ) ( not ( = ?auto_2212878 ?auto_2212889 ) ) ( not ( = ?auto_2212878 ?auto_2212895 ) ) ( not ( = ?auto_2212877 ?auto_2212879 ) ) ( not ( = ?auto_2212877 ?auto_2212880 ) ) ( not ( = ?auto_2212877 ?auto_2212881 ) ) ( not ( = ?auto_2212877 ?auto_2212882 ) ) ( not ( = ?auto_2212877 ?auto_2212883 ) ) ( not ( = ?auto_2212877 ?auto_2212884 ) ) ( not ( = ?auto_2212877 ?auto_2212885 ) ) ( not ( = ?auto_2212877 ?auto_2212886 ) ) ( not ( = ?auto_2212877 ?auto_2212887 ) ) ( not ( = ?auto_2212877 ?auto_2212888 ) ) ( not ( = ?auto_2212877 ?auto_2212889 ) ) ( not ( = ?auto_2212877 ?auto_2212895 ) ) ( not ( = ?auto_2212879 ?auto_2212880 ) ) ( not ( = ?auto_2212879 ?auto_2212881 ) ) ( not ( = ?auto_2212879 ?auto_2212882 ) ) ( not ( = ?auto_2212879 ?auto_2212883 ) ) ( not ( = ?auto_2212879 ?auto_2212884 ) ) ( not ( = ?auto_2212879 ?auto_2212885 ) ) ( not ( = ?auto_2212879 ?auto_2212886 ) ) ( not ( = ?auto_2212879 ?auto_2212887 ) ) ( not ( = ?auto_2212879 ?auto_2212888 ) ) ( not ( = ?auto_2212879 ?auto_2212889 ) ) ( not ( = ?auto_2212879 ?auto_2212895 ) ) ( not ( = ?auto_2212880 ?auto_2212881 ) ) ( not ( = ?auto_2212880 ?auto_2212882 ) ) ( not ( = ?auto_2212880 ?auto_2212883 ) ) ( not ( = ?auto_2212880 ?auto_2212884 ) ) ( not ( = ?auto_2212880 ?auto_2212885 ) ) ( not ( = ?auto_2212880 ?auto_2212886 ) ) ( not ( = ?auto_2212880 ?auto_2212887 ) ) ( not ( = ?auto_2212880 ?auto_2212888 ) ) ( not ( = ?auto_2212880 ?auto_2212889 ) ) ( not ( = ?auto_2212880 ?auto_2212895 ) ) ( not ( = ?auto_2212881 ?auto_2212882 ) ) ( not ( = ?auto_2212881 ?auto_2212883 ) ) ( not ( = ?auto_2212881 ?auto_2212884 ) ) ( not ( = ?auto_2212881 ?auto_2212885 ) ) ( not ( = ?auto_2212881 ?auto_2212886 ) ) ( not ( = ?auto_2212881 ?auto_2212887 ) ) ( not ( = ?auto_2212881 ?auto_2212888 ) ) ( not ( = ?auto_2212881 ?auto_2212889 ) ) ( not ( = ?auto_2212881 ?auto_2212895 ) ) ( not ( = ?auto_2212882 ?auto_2212883 ) ) ( not ( = ?auto_2212882 ?auto_2212884 ) ) ( not ( = ?auto_2212882 ?auto_2212885 ) ) ( not ( = ?auto_2212882 ?auto_2212886 ) ) ( not ( = ?auto_2212882 ?auto_2212887 ) ) ( not ( = ?auto_2212882 ?auto_2212888 ) ) ( not ( = ?auto_2212882 ?auto_2212889 ) ) ( not ( = ?auto_2212882 ?auto_2212895 ) ) ( not ( = ?auto_2212883 ?auto_2212884 ) ) ( not ( = ?auto_2212883 ?auto_2212885 ) ) ( not ( = ?auto_2212883 ?auto_2212886 ) ) ( not ( = ?auto_2212883 ?auto_2212887 ) ) ( not ( = ?auto_2212883 ?auto_2212888 ) ) ( not ( = ?auto_2212883 ?auto_2212889 ) ) ( not ( = ?auto_2212883 ?auto_2212895 ) ) ( not ( = ?auto_2212884 ?auto_2212885 ) ) ( not ( = ?auto_2212884 ?auto_2212886 ) ) ( not ( = ?auto_2212884 ?auto_2212887 ) ) ( not ( = ?auto_2212884 ?auto_2212888 ) ) ( not ( = ?auto_2212884 ?auto_2212889 ) ) ( not ( = ?auto_2212884 ?auto_2212895 ) ) ( not ( = ?auto_2212885 ?auto_2212886 ) ) ( not ( = ?auto_2212885 ?auto_2212887 ) ) ( not ( = ?auto_2212885 ?auto_2212888 ) ) ( not ( = ?auto_2212885 ?auto_2212889 ) ) ( not ( = ?auto_2212885 ?auto_2212895 ) ) ( not ( = ?auto_2212886 ?auto_2212887 ) ) ( not ( = ?auto_2212886 ?auto_2212888 ) ) ( not ( = ?auto_2212886 ?auto_2212889 ) ) ( not ( = ?auto_2212886 ?auto_2212895 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2212887 ?auto_2212888 ?auto_2212889 )
      ( MAKE-15CRATE-VERIFY ?auto_2212874 ?auto_2212875 ?auto_2212876 ?auto_2212878 ?auto_2212877 ?auto_2212879 ?auto_2212880 ?auto_2212881 ?auto_2212882 ?auto_2212883 ?auto_2212884 ?auto_2212885 ?auto_2212886 ?auto_2212887 ?auto_2212888 ?auto_2212889 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2233229 - SURFACE
      ?auto_2233230 - SURFACE
      ?auto_2233231 - SURFACE
      ?auto_2233233 - SURFACE
      ?auto_2233232 - SURFACE
      ?auto_2233234 - SURFACE
      ?auto_2233235 - SURFACE
      ?auto_2233236 - SURFACE
      ?auto_2233237 - SURFACE
      ?auto_2233238 - SURFACE
      ?auto_2233239 - SURFACE
      ?auto_2233240 - SURFACE
      ?auto_2233241 - SURFACE
      ?auto_2233242 - SURFACE
      ?auto_2233243 - SURFACE
      ?auto_2233244 - SURFACE
      ?auto_2233245 - SURFACE
    )
    :vars
    (
      ?auto_2233246 - HOIST
      ?auto_2233247 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2233246 ?auto_2233247 ) ( SURFACE-AT ?auto_2233244 ?auto_2233247 ) ( CLEAR ?auto_2233244 ) ( LIFTING ?auto_2233246 ?auto_2233245 ) ( IS-CRATE ?auto_2233245 ) ( not ( = ?auto_2233244 ?auto_2233245 ) ) ( ON ?auto_2233230 ?auto_2233229 ) ( ON ?auto_2233231 ?auto_2233230 ) ( ON ?auto_2233233 ?auto_2233231 ) ( ON ?auto_2233232 ?auto_2233233 ) ( ON ?auto_2233234 ?auto_2233232 ) ( ON ?auto_2233235 ?auto_2233234 ) ( ON ?auto_2233236 ?auto_2233235 ) ( ON ?auto_2233237 ?auto_2233236 ) ( ON ?auto_2233238 ?auto_2233237 ) ( ON ?auto_2233239 ?auto_2233238 ) ( ON ?auto_2233240 ?auto_2233239 ) ( ON ?auto_2233241 ?auto_2233240 ) ( ON ?auto_2233242 ?auto_2233241 ) ( ON ?auto_2233243 ?auto_2233242 ) ( ON ?auto_2233244 ?auto_2233243 ) ( not ( = ?auto_2233229 ?auto_2233230 ) ) ( not ( = ?auto_2233229 ?auto_2233231 ) ) ( not ( = ?auto_2233229 ?auto_2233233 ) ) ( not ( = ?auto_2233229 ?auto_2233232 ) ) ( not ( = ?auto_2233229 ?auto_2233234 ) ) ( not ( = ?auto_2233229 ?auto_2233235 ) ) ( not ( = ?auto_2233229 ?auto_2233236 ) ) ( not ( = ?auto_2233229 ?auto_2233237 ) ) ( not ( = ?auto_2233229 ?auto_2233238 ) ) ( not ( = ?auto_2233229 ?auto_2233239 ) ) ( not ( = ?auto_2233229 ?auto_2233240 ) ) ( not ( = ?auto_2233229 ?auto_2233241 ) ) ( not ( = ?auto_2233229 ?auto_2233242 ) ) ( not ( = ?auto_2233229 ?auto_2233243 ) ) ( not ( = ?auto_2233229 ?auto_2233244 ) ) ( not ( = ?auto_2233229 ?auto_2233245 ) ) ( not ( = ?auto_2233230 ?auto_2233231 ) ) ( not ( = ?auto_2233230 ?auto_2233233 ) ) ( not ( = ?auto_2233230 ?auto_2233232 ) ) ( not ( = ?auto_2233230 ?auto_2233234 ) ) ( not ( = ?auto_2233230 ?auto_2233235 ) ) ( not ( = ?auto_2233230 ?auto_2233236 ) ) ( not ( = ?auto_2233230 ?auto_2233237 ) ) ( not ( = ?auto_2233230 ?auto_2233238 ) ) ( not ( = ?auto_2233230 ?auto_2233239 ) ) ( not ( = ?auto_2233230 ?auto_2233240 ) ) ( not ( = ?auto_2233230 ?auto_2233241 ) ) ( not ( = ?auto_2233230 ?auto_2233242 ) ) ( not ( = ?auto_2233230 ?auto_2233243 ) ) ( not ( = ?auto_2233230 ?auto_2233244 ) ) ( not ( = ?auto_2233230 ?auto_2233245 ) ) ( not ( = ?auto_2233231 ?auto_2233233 ) ) ( not ( = ?auto_2233231 ?auto_2233232 ) ) ( not ( = ?auto_2233231 ?auto_2233234 ) ) ( not ( = ?auto_2233231 ?auto_2233235 ) ) ( not ( = ?auto_2233231 ?auto_2233236 ) ) ( not ( = ?auto_2233231 ?auto_2233237 ) ) ( not ( = ?auto_2233231 ?auto_2233238 ) ) ( not ( = ?auto_2233231 ?auto_2233239 ) ) ( not ( = ?auto_2233231 ?auto_2233240 ) ) ( not ( = ?auto_2233231 ?auto_2233241 ) ) ( not ( = ?auto_2233231 ?auto_2233242 ) ) ( not ( = ?auto_2233231 ?auto_2233243 ) ) ( not ( = ?auto_2233231 ?auto_2233244 ) ) ( not ( = ?auto_2233231 ?auto_2233245 ) ) ( not ( = ?auto_2233233 ?auto_2233232 ) ) ( not ( = ?auto_2233233 ?auto_2233234 ) ) ( not ( = ?auto_2233233 ?auto_2233235 ) ) ( not ( = ?auto_2233233 ?auto_2233236 ) ) ( not ( = ?auto_2233233 ?auto_2233237 ) ) ( not ( = ?auto_2233233 ?auto_2233238 ) ) ( not ( = ?auto_2233233 ?auto_2233239 ) ) ( not ( = ?auto_2233233 ?auto_2233240 ) ) ( not ( = ?auto_2233233 ?auto_2233241 ) ) ( not ( = ?auto_2233233 ?auto_2233242 ) ) ( not ( = ?auto_2233233 ?auto_2233243 ) ) ( not ( = ?auto_2233233 ?auto_2233244 ) ) ( not ( = ?auto_2233233 ?auto_2233245 ) ) ( not ( = ?auto_2233232 ?auto_2233234 ) ) ( not ( = ?auto_2233232 ?auto_2233235 ) ) ( not ( = ?auto_2233232 ?auto_2233236 ) ) ( not ( = ?auto_2233232 ?auto_2233237 ) ) ( not ( = ?auto_2233232 ?auto_2233238 ) ) ( not ( = ?auto_2233232 ?auto_2233239 ) ) ( not ( = ?auto_2233232 ?auto_2233240 ) ) ( not ( = ?auto_2233232 ?auto_2233241 ) ) ( not ( = ?auto_2233232 ?auto_2233242 ) ) ( not ( = ?auto_2233232 ?auto_2233243 ) ) ( not ( = ?auto_2233232 ?auto_2233244 ) ) ( not ( = ?auto_2233232 ?auto_2233245 ) ) ( not ( = ?auto_2233234 ?auto_2233235 ) ) ( not ( = ?auto_2233234 ?auto_2233236 ) ) ( not ( = ?auto_2233234 ?auto_2233237 ) ) ( not ( = ?auto_2233234 ?auto_2233238 ) ) ( not ( = ?auto_2233234 ?auto_2233239 ) ) ( not ( = ?auto_2233234 ?auto_2233240 ) ) ( not ( = ?auto_2233234 ?auto_2233241 ) ) ( not ( = ?auto_2233234 ?auto_2233242 ) ) ( not ( = ?auto_2233234 ?auto_2233243 ) ) ( not ( = ?auto_2233234 ?auto_2233244 ) ) ( not ( = ?auto_2233234 ?auto_2233245 ) ) ( not ( = ?auto_2233235 ?auto_2233236 ) ) ( not ( = ?auto_2233235 ?auto_2233237 ) ) ( not ( = ?auto_2233235 ?auto_2233238 ) ) ( not ( = ?auto_2233235 ?auto_2233239 ) ) ( not ( = ?auto_2233235 ?auto_2233240 ) ) ( not ( = ?auto_2233235 ?auto_2233241 ) ) ( not ( = ?auto_2233235 ?auto_2233242 ) ) ( not ( = ?auto_2233235 ?auto_2233243 ) ) ( not ( = ?auto_2233235 ?auto_2233244 ) ) ( not ( = ?auto_2233235 ?auto_2233245 ) ) ( not ( = ?auto_2233236 ?auto_2233237 ) ) ( not ( = ?auto_2233236 ?auto_2233238 ) ) ( not ( = ?auto_2233236 ?auto_2233239 ) ) ( not ( = ?auto_2233236 ?auto_2233240 ) ) ( not ( = ?auto_2233236 ?auto_2233241 ) ) ( not ( = ?auto_2233236 ?auto_2233242 ) ) ( not ( = ?auto_2233236 ?auto_2233243 ) ) ( not ( = ?auto_2233236 ?auto_2233244 ) ) ( not ( = ?auto_2233236 ?auto_2233245 ) ) ( not ( = ?auto_2233237 ?auto_2233238 ) ) ( not ( = ?auto_2233237 ?auto_2233239 ) ) ( not ( = ?auto_2233237 ?auto_2233240 ) ) ( not ( = ?auto_2233237 ?auto_2233241 ) ) ( not ( = ?auto_2233237 ?auto_2233242 ) ) ( not ( = ?auto_2233237 ?auto_2233243 ) ) ( not ( = ?auto_2233237 ?auto_2233244 ) ) ( not ( = ?auto_2233237 ?auto_2233245 ) ) ( not ( = ?auto_2233238 ?auto_2233239 ) ) ( not ( = ?auto_2233238 ?auto_2233240 ) ) ( not ( = ?auto_2233238 ?auto_2233241 ) ) ( not ( = ?auto_2233238 ?auto_2233242 ) ) ( not ( = ?auto_2233238 ?auto_2233243 ) ) ( not ( = ?auto_2233238 ?auto_2233244 ) ) ( not ( = ?auto_2233238 ?auto_2233245 ) ) ( not ( = ?auto_2233239 ?auto_2233240 ) ) ( not ( = ?auto_2233239 ?auto_2233241 ) ) ( not ( = ?auto_2233239 ?auto_2233242 ) ) ( not ( = ?auto_2233239 ?auto_2233243 ) ) ( not ( = ?auto_2233239 ?auto_2233244 ) ) ( not ( = ?auto_2233239 ?auto_2233245 ) ) ( not ( = ?auto_2233240 ?auto_2233241 ) ) ( not ( = ?auto_2233240 ?auto_2233242 ) ) ( not ( = ?auto_2233240 ?auto_2233243 ) ) ( not ( = ?auto_2233240 ?auto_2233244 ) ) ( not ( = ?auto_2233240 ?auto_2233245 ) ) ( not ( = ?auto_2233241 ?auto_2233242 ) ) ( not ( = ?auto_2233241 ?auto_2233243 ) ) ( not ( = ?auto_2233241 ?auto_2233244 ) ) ( not ( = ?auto_2233241 ?auto_2233245 ) ) ( not ( = ?auto_2233242 ?auto_2233243 ) ) ( not ( = ?auto_2233242 ?auto_2233244 ) ) ( not ( = ?auto_2233242 ?auto_2233245 ) ) ( not ( = ?auto_2233243 ?auto_2233244 ) ) ( not ( = ?auto_2233243 ?auto_2233245 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2233244 ?auto_2233245 )
      ( MAKE-16CRATE-VERIFY ?auto_2233229 ?auto_2233230 ?auto_2233231 ?auto_2233233 ?auto_2233232 ?auto_2233234 ?auto_2233235 ?auto_2233236 ?auto_2233237 ?auto_2233238 ?auto_2233239 ?auto_2233240 ?auto_2233241 ?auto_2233242 ?auto_2233243 ?auto_2233244 ?auto_2233245 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2233428 - SURFACE
      ?auto_2233429 - SURFACE
      ?auto_2233430 - SURFACE
      ?auto_2233432 - SURFACE
      ?auto_2233431 - SURFACE
      ?auto_2233433 - SURFACE
      ?auto_2233434 - SURFACE
      ?auto_2233435 - SURFACE
      ?auto_2233436 - SURFACE
      ?auto_2233437 - SURFACE
      ?auto_2233438 - SURFACE
      ?auto_2233439 - SURFACE
      ?auto_2233440 - SURFACE
      ?auto_2233441 - SURFACE
      ?auto_2233442 - SURFACE
      ?auto_2233443 - SURFACE
      ?auto_2233444 - SURFACE
    )
    :vars
    (
      ?auto_2233447 - HOIST
      ?auto_2233445 - PLACE
      ?auto_2233446 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2233447 ?auto_2233445 ) ( SURFACE-AT ?auto_2233443 ?auto_2233445 ) ( CLEAR ?auto_2233443 ) ( IS-CRATE ?auto_2233444 ) ( not ( = ?auto_2233443 ?auto_2233444 ) ) ( TRUCK-AT ?auto_2233446 ?auto_2233445 ) ( AVAILABLE ?auto_2233447 ) ( IN ?auto_2233444 ?auto_2233446 ) ( ON ?auto_2233443 ?auto_2233442 ) ( not ( = ?auto_2233442 ?auto_2233443 ) ) ( not ( = ?auto_2233442 ?auto_2233444 ) ) ( ON ?auto_2233429 ?auto_2233428 ) ( ON ?auto_2233430 ?auto_2233429 ) ( ON ?auto_2233432 ?auto_2233430 ) ( ON ?auto_2233431 ?auto_2233432 ) ( ON ?auto_2233433 ?auto_2233431 ) ( ON ?auto_2233434 ?auto_2233433 ) ( ON ?auto_2233435 ?auto_2233434 ) ( ON ?auto_2233436 ?auto_2233435 ) ( ON ?auto_2233437 ?auto_2233436 ) ( ON ?auto_2233438 ?auto_2233437 ) ( ON ?auto_2233439 ?auto_2233438 ) ( ON ?auto_2233440 ?auto_2233439 ) ( ON ?auto_2233441 ?auto_2233440 ) ( ON ?auto_2233442 ?auto_2233441 ) ( not ( = ?auto_2233428 ?auto_2233429 ) ) ( not ( = ?auto_2233428 ?auto_2233430 ) ) ( not ( = ?auto_2233428 ?auto_2233432 ) ) ( not ( = ?auto_2233428 ?auto_2233431 ) ) ( not ( = ?auto_2233428 ?auto_2233433 ) ) ( not ( = ?auto_2233428 ?auto_2233434 ) ) ( not ( = ?auto_2233428 ?auto_2233435 ) ) ( not ( = ?auto_2233428 ?auto_2233436 ) ) ( not ( = ?auto_2233428 ?auto_2233437 ) ) ( not ( = ?auto_2233428 ?auto_2233438 ) ) ( not ( = ?auto_2233428 ?auto_2233439 ) ) ( not ( = ?auto_2233428 ?auto_2233440 ) ) ( not ( = ?auto_2233428 ?auto_2233441 ) ) ( not ( = ?auto_2233428 ?auto_2233442 ) ) ( not ( = ?auto_2233428 ?auto_2233443 ) ) ( not ( = ?auto_2233428 ?auto_2233444 ) ) ( not ( = ?auto_2233429 ?auto_2233430 ) ) ( not ( = ?auto_2233429 ?auto_2233432 ) ) ( not ( = ?auto_2233429 ?auto_2233431 ) ) ( not ( = ?auto_2233429 ?auto_2233433 ) ) ( not ( = ?auto_2233429 ?auto_2233434 ) ) ( not ( = ?auto_2233429 ?auto_2233435 ) ) ( not ( = ?auto_2233429 ?auto_2233436 ) ) ( not ( = ?auto_2233429 ?auto_2233437 ) ) ( not ( = ?auto_2233429 ?auto_2233438 ) ) ( not ( = ?auto_2233429 ?auto_2233439 ) ) ( not ( = ?auto_2233429 ?auto_2233440 ) ) ( not ( = ?auto_2233429 ?auto_2233441 ) ) ( not ( = ?auto_2233429 ?auto_2233442 ) ) ( not ( = ?auto_2233429 ?auto_2233443 ) ) ( not ( = ?auto_2233429 ?auto_2233444 ) ) ( not ( = ?auto_2233430 ?auto_2233432 ) ) ( not ( = ?auto_2233430 ?auto_2233431 ) ) ( not ( = ?auto_2233430 ?auto_2233433 ) ) ( not ( = ?auto_2233430 ?auto_2233434 ) ) ( not ( = ?auto_2233430 ?auto_2233435 ) ) ( not ( = ?auto_2233430 ?auto_2233436 ) ) ( not ( = ?auto_2233430 ?auto_2233437 ) ) ( not ( = ?auto_2233430 ?auto_2233438 ) ) ( not ( = ?auto_2233430 ?auto_2233439 ) ) ( not ( = ?auto_2233430 ?auto_2233440 ) ) ( not ( = ?auto_2233430 ?auto_2233441 ) ) ( not ( = ?auto_2233430 ?auto_2233442 ) ) ( not ( = ?auto_2233430 ?auto_2233443 ) ) ( not ( = ?auto_2233430 ?auto_2233444 ) ) ( not ( = ?auto_2233432 ?auto_2233431 ) ) ( not ( = ?auto_2233432 ?auto_2233433 ) ) ( not ( = ?auto_2233432 ?auto_2233434 ) ) ( not ( = ?auto_2233432 ?auto_2233435 ) ) ( not ( = ?auto_2233432 ?auto_2233436 ) ) ( not ( = ?auto_2233432 ?auto_2233437 ) ) ( not ( = ?auto_2233432 ?auto_2233438 ) ) ( not ( = ?auto_2233432 ?auto_2233439 ) ) ( not ( = ?auto_2233432 ?auto_2233440 ) ) ( not ( = ?auto_2233432 ?auto_2233441 ) ) ( not ( = ?auto_2233432 ?auto_2233442 ) ) ( not ( = ?auto_2233432 ?auto_2233443 ) ) ( not ( = ?auto_2233432 ?auto_2233444 ) ) ( not ( = ?auto_2233431 ?auto_2233433 ) ) ( not ( = ?auto_2233431 ?auto_2233434 ) ) ( not ( = ?auto_2233431 ?auto_2233435 ) ) ( not ( = ?auto_2233431 ?auto_2233436 ) ) ( not ( = ?auto_2233431 ?auto_2233437 ) ) ( not ( = ?auto_2233431 ?auto_2233438 ) ) ( not ( = ?auto_2233431 ?auto_2233439 ) ) ( not ( = ?auto_2233431 ?auto_2233440 ) ) ( not ( = ?auto_2233431 ?auto_2233441 ) ) ( not ( = ?auto_2233431 ?auto_2233442 ) ) ( not ( = ?auto_2233431 ?auto_2233443 ) ) ( not ( = ?auto_2233431 ?auto_2233444 ) ) ( not ( = ?auto_2233433 ?auto_2233434 ) ) ( not ( = ?auto_2233433 ?auto_2233435 ) ) ( not ( = ?auto_2233433 ?auto_2233436 ) ) ( not ( = ?auto_2233433 ?auto_2233437 ) ) ( not ( = ?auto_2233433 ?auto_2233438 ) ) ( not ( = ?auto_2233433 ?auto_2233439 ) ) ( not ( = ?auto_2233433 ?auto_2233440 ) ) ( not ( = ?auto_2233433 ?auto_2233441 ) ) ( not ( = ?auto_2233433 ?auto_2233442 ) ) ( not ( = ?auto_2233433 ?auto_2233443 ) ) ( not ( = ?auto_2233433 ?auto_2233444 ) ) ( not ( = ?auto_2233434 ?auto_2233435 ) ) ( not ( = ?auto_2233434 ?auto_2233436 ) ) ( not ( = ?auto_2233434 ?auto_2233437 ) ) ( not ( = ?auto_2233434 ?auto_2233438 ) ) ( not ( = ?auto_2233434 ?auto_2233439 ) ) ( not ( = ?auto_2233434 ?auto_2233440 ) ) ( not ( = ?auto_2233434 ?auto_2233441 ) ) ( not ( = ?auto_2233434 ?auto_2233442 ) ) ( not ( = ?auto_2233434 ?auto_2233443 ) ) ( not ( = ?auto_2233434 ?auto_2233444 ) ) ( not ( = ?auto_2233435 ?auto_2233436 ) ) ( not ( = ?auto_2233435 ?auto_2233437 ) ) ( not ( = ?auto_2233435 ?auto_2233438 ) ) ( not ( = ?auto_2233435 ?auto_2233439 ) ) ( not ( = ?auto_2233435 ?auto_2233440 ) ) ( not ( = ?auto_2233435 ?auto_2233441 ) ) ( not ( = ?auto_2233435 ?auto_2233442 ) ) ( not ( = ?auto_2233435 ?auto_2233443 ) ) ( not ( = ?auto_2233435 ?auto_2233444 ) ) ( not ( = ?auto_2233436 ?auto_2233437 ) ) ( not ( = ?auto_2233436 ?auto_2233438 ) ) ( not ( = ?auto_2233436 ?auto_2233439 ) ) ( not ( = ?auto_2233436 ?auto_2233440 ) ) ( not ( = ?auto_2233436 ?auto_2233441 ) ) ( not ( = ?auto_2233436 ?auto_2233442 ) ) ( not ( = ?auto_2233436 ?auto_2233443 ) ) ( not ( = ?auto_2233436 ?auto_2233444 ) ) ( not ( = ?auto_2233437 ?auto_2233438 ) ) ( not ( = ?auto_2233437 ?auto_2233439 ) ) ( not ( = ?auto_2233437 ?auto_2233440 ) ) ( not ( = ?auto_2233437 ?auto_2233441 ) ) ( not ( = ?auto_2233437 ?auto_2233442 ) ) ( not ( = ?auto_2233437 ?auto_2233443 ) ) ( not ( = ?auto_2233437 ?auto_2233444 ) ) ( not ( = ?auto_2233438 ?auto_2233439 ) ) ( not ( = ?auto_2233438 ?auto_2233440 ) ) ( not ( = ?auto_2233438 ?auto_2233441 ) ) ( not ( = ?auto_2233438 ?auto_2233442 ) ) ( not ( = ?auto_2233438 ?auto_2233443 ) ) ( not ( = ?auto_2233438 ?auto_2233444 ) ) ( not ( = ?auto_2233439 ?auto_2233440 ) ) ( not ( = ?auto_2233439 ?auto_2233441 ) ) ( not ( = ?auto_2233439 ?auto_2233442 ) ) ( not ( = ?auto_2233439 ?auto_2233443 ) ) ( not ( = ?auto_2233439 ?auto_2233444 ) ) ( not ( = ?auto_2233440 ?auto_2233441 ) ) ( not ( = ?auto_2233440 ?auto_2233442 ) ) ( not ( = ?auto_2233440 ?auto_2233443 ) ) ( not ( = ?auto_2233440 ?auto_2233444 ) ) ( not ( = ?auto_2233441 ?auto_2233442 ) ) ( not ( = ?auto_2233441 ?auto_2233443 ) ) ( not ( = ?auto_2233441 ?auto_2233444 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2233442 ?auto_2233443 ?auto_2233444 )
      ( MAKE-16CRATE-VERIFY ?auto_2233428 ?auto_2233429 ?auto_2233430 ?auto_2233432 ?auto_2233431 ?auto_2233433 ?auto_2233434 ?auto_2233435 ?auto_2233436 ?auto_2233437 ?auto_2233438 ?auto_2233439 ?auto_2233440 ?auto_2233441 ?auto_2233442 ?auto_2233443 ?auto_2233444 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2233644 - SURFACE
      ?auto_2233645 - SURFACE
      ?auto_2233646 - SURFACE
      ?auto_2233648 - SURFACE
      ?auto_2233647 - SURFACE
      ?auto_2233649 - SURFACE
      ?auto_2233650 - SURFACE
      ?auto_2233651 - SURFACE
      ?auto_2233652 - SURFACE
      ?auto_2233653 - SURFACE
      ?auto_2233654 - SURFACE
      ?auto_2233655 - SURFACE
      ?auto_2233656 - SURFACE
      ?auto_2233657 - SURFACE
      ?auto_2233658 - SURFACE
      ?auto_2233659 - SURFACE
      ?auto_2233660 - SURFACE
    )
    :vars
    (
      ?auto_2233664 - HOIST
      ?auto_2233661 - PLACE
      ?auto_2233662 - TRUCK
      ?auto_2233663 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2233664 ?auto_2233661 ) ( SURFACE-AT ?auto_2233659 ?auto_2233661 ) ( CLEAR ?auto_2233659 ) ( IS-CRATE ?auto_2233660 ) ( not ( = ?auto_2233659 ?auto_2233660 ) ) ( AVAILABLE ?auto_2233664 ) ( IN ?auto_2233660 ?auto_2233662 ) ( ON ?auto_2233659 ?auto_2233658 ) ( not ( = ?auto_2233658 ?auto_2233659 ) ) ( not ( = ?auto_2233658 ?auto_2233660 ) ) ( TRUCK-AT ?auto_2233662 ?auto_2233663 ) ( not ( = ?auto_2233663 ?auto_2233661 ) ) ( ON ?auto_2233645 ?auto_2233644 ) ( ON ?auto_2233646 ?auto_2233645 ) ( ON ?auto_2233648 ?auto_2233646 ) ( ON ?auto_2233647 ?auto_2233648 ) ( ON ?auto_2233649 ?auto_2233647 ) ( ON ?auto_2233650 ?auto_2233649 ) ( ON ?auto_2233651 ?auto_2233650 ) ( ON ?auto_2233652 ?auto_2233651 ) ( ON ?auto_2233653 ?auto_2233652 ) ( ON ?auto_2233654 ?auto_2233653 ) ( ON ?auto_2233655 ?auto_2233654 ) ( ON ?auto_2233656 ?auto_2233655 ) ( ON ?auto_2233657 ?auto_2233656 ) ( ON ?auto_2233658 ?auto_2233657 ) ( not ( = ?auto_2233644 ?auto_2233645 ) ) ( not ( = ?auto_2233644 ?auto_2233646 ) ) ( not ( = ?auto_2233644 ?auto_2233648 ) ) ( not ( = ?auto_2233644 ?auto_2233647 ) ) ( not ( = ?auto_2233644 ?auto_2233649 ) ) ( not ( = ?auto_2233644 ?auto_2233650 ) ) ( not ( = ?auto_2233644 ?auto_2233651 ) ) ( not ( = ?auto_2233644 ?auto_2233652 ) ) ( not ( = ?auto_2233644 ?auto_2233653 ) ) ( not ( = ?auto_2233644 ?auto_2233654 ) ) ( not ( = ?auto_2233644 ?auto_2233655 ) ) ( not ( = ?auto_2233644 ?auto_2233656 ) ) ( not ( = ?auto_2233644 ?auto_2233657 ) ) ( not ( = ?auto_2233644 ?auto_2233658 ) ) ( not ( = ?auto_2233644 ?auto_2233659 ) ) ( not ( = ?auto_2233644 ?auto_2233660 ) ) ( not ( = ?auto_2233645 ?auto_2233646 ) ) ( not ( = ?auto_2233645 ?auto_2233648 ) ) ( not ( = ?auto_2233645 ?auto_2233647 ) ) ( not ( = ?auto_2233645 ?auto_2233649 ) ) ( not ( = ?auto_2233645 ?auto_2233650 ) ) ( not ( = ?auto_2233645 ?auto_2233651 ) ) ( not ( = ?auto_2233645 ?auto_2233652 ) ) ( not ( = ?auto_2233645 ?auto_2233653 ) ) ( not ( = ?auto_2233645 ?auto_2233654 ) ) ( not ( = ?auto_2233645 ?auto_2233655 ) ) ( not ( = ?auto_2233645 ?auto_2233656 ) ) ( not ( = ?auto_2233645 ?auto_2233657 ) ) ( not ( = ?auto_2233645 ?auto_2233658 ) ) ( not ( = ?auto_2233645 ?auto_2233659 ) ) ( not ( = ?auto_2233645 ?auto_2233660 ) ) ( not ( = ?auto_2233646 ?auto_2233648 ) ) ( not ( = ?auto_2233646 ?auto_2233647 ) ) ( not ( = ?auto_2233646 ?auto_2233649 ) ) ( not ( = ?auto_2233646 ?auto_2233650 ) ) ( not ( = ?auto_2233646 ?auto_2233651 ) ) ( not ( = ?auto_2233646 ?auto_2233652 ) ) ( not ( = ?auto_2233646 ?auto_2233653 ) ) ( not ( = ?auto_2233646 ?auto_2233654 ) ) ( not ( = ?auto_2233646 ?auto_2233655 ) ) ( not ( = ?auto_2233646 ?auto_2233656 ) ) ( not ( = ?auto_2233646 ?auto_2233657 ) ) ( not ( = ?auto_2233646 ?auto_2233658 ) ) ( not ( = ?auto_2233646 ?auto_2233659 ) ) ( not ( = ?auto_2233646 ?auto_2233660 ) ) ( not ( = ?auto_2233648 ?auto_2233647 ) ) ( not ( = ?auto_2233648 ?auto_2233649 ) ) ( not ( = ?auto_2233648 ?auto_2233650 ) ) ( not ( = ?auto_2233648 ?auto_2233651 ) ) ( not ( = ?auto_2233648 ?auto_2233652 ) ) ( not ( = ?auto_2233648 ?auto_2233653 ) ) ( not ( = ?auto_2233648 ?auto_2233654 ) ) ( not ( = ?auto_2233648 ?auto_2233655 ) ) ( not ( = ?auto_2233648 ?auto_2233656 ) ) ( not ( = ?auto_2233648 ?auto_2233657 ) ) ( not ( = ?auto_2233648 ?auto_2233658 ) ) ( not ( = ?auto_2233648 ?auto_2233659 ) ) ( not ( = ?auto_2233648 ?auto_2233660 ) ) ( not ( = ?auto_2233647 ?auto_2233649 ) ) ( not ( = ?auto_2233647 ?auto_2233650 ) ) ( not ( = ?auto_2233647 ?auto_2233651 ) ) ( not ( = ?auto_2233647 ?auto_2233652 ) ) ( not ( = ?auto_2233647 ?auto_2233653 ) ) ( not ( = ?auto_2233647 ?auto_2233654 ) ) ( not ( = ?auto_2233647 ?auto_2233655 ) ) ( not ( = ?auto_2233647 ?auto_2233656 ) ) ( not ( = ?auto_2233647 ?auto_2233657 ) ) ( not ( = ?auto_2233647 ?auto_2233658 ) ) ( not ( = ?auto_2233647 ?auto_2233659 ) ) ( not ( = ?auto_2233647 ?auto_2233660 ) ) ( not ( = ?auto_2233649 ?auto_2233650 ) ) ( not ( = ?auto_2233649 ?auto_2233651 ) ) ( not ( = ?auto_2233649 ?auto_2233652 ) ) ( not ( = ?auto_2233649 ?auto_2233653 ) ) ( not ( = ?auto_2233649 ?auto_2233654 ) ) ( not ( = ?auto_2233649 ?auto_2233655 ) ) ( not ( = ?auto_2233649 ?auto_2233656 ) ) ( not ( = ?auto_2233649 ?auto_2233657 ) ) ( not ( = ?auto_2233649 ?auto_2233658 ) ) ( not ( = ?auto_2233649 ?auto_2233659 ) ) ( not ( = ?auto_2233649 ?auto_2233660 ) ) ( not ( = ?auto_2233650 ?auto_2233651 ) ) ( not ( = ?auto_2233650 ?auto_2233652 ) ) ( not ( = ?auto_2233650 ?auto_2233653 ) ) ( not ( = ?auto_2233650 ?auto_2233654 ) ) ( not ( = ?auto_2233650 ?auto_2233655 ) ) ( not ( = ?auto_2233650 ?auto_2233656 ) ) ( not ( = ?auto_2233650 ?auto_2233657 ) ) ( not ( = ?auto_2233650 ?auto_2233658 ) ) ( not ( = ?auto_2233650 ?auto_2233659 ) ) ( not ( = ?auto_2233650 ?auto_2233660 ) ) ( not ( = ?auto_2233651 ?auto_2233652 ) ) ( not ( = ?auto_2233651 ?auto_2233653 ) ) ( not ( = ?auto_2233651 ?auto_2233654 ) ) ( not ( = ?auto_2233651 ?auto_2233655 ) ) ( not ( = ?auto_2233651 ?auto_2233656 ) ) ( not ( = ?auto_2233651 ?auto_2233657 ) ) ( not ( = ?auto_2233651 ?auto_2233658 ) ) ( not ( = ?auto_2233651 ?auto_2233659 ) ) ( not ( = ?auto_2233651 ?auto_2233660 ) ) ( not ( = ?auto_2233652 ?auto_2233653 ) ) ( not ( = ?auto_2233652 ?auto_2233654 ) ) ( not ( = ?auto_2233652 ?auto_2233655 ) ) ( not ( = ?auto_2233652 ?auto_2233656 ) ) ( not ( = ?auto_2233652 ?auto_2233657 ) ) ( not ( = ?auto_2233652 ?auto_2233658 ) ) ( not ( = ?auto_2233652 ?auto_2233659 ) ) ( not ( = ?auto_2233652 ?auto_2233660 ) ) ( not ( = ?auto_2233653 ?auto_2233654 ) ) ( not ( = ?auto_2233653 ?auto_2233655 ) ) ( not ( = ?auto_2233653 ?auto_2233656 ) ) ( not ( = ?auto_2233653 ?auto_2233657 ) ) ( not ( = ?auto_2233653 ?auto_2233658 ) ) ( not ( = ?auto_2233653 ?auto_2233659 ) ) ( not ( = ?auto_2233653 ?auto_2233660 ) ) ( not ( = ?auto_2233654 ?auto_2233655 ) ) ( not ( = ?auto_2233654 ?auto_2233656 ) ) ( not ( = ?auto_2233654 ?auto_2233657 ) ) ( not ( = ?auto_2233654 ?auto_2233658 ) ) ( not ( = ?auto_2233654 ?auto_2233659 ) ) ( not ( = ?auto_2233654 ?auto_2233660 ) ) ( not ( = ?auto_2233655 ?auto_2233656 ) ) ( not ( = ?auto_2233655 ?auto_2233657 ) ) ( not ( = ?auto_2233655 ?auto_2233658 ) ) ( not ( = ?auto_2233655 ?auto_2233659 ) ) ( not ( = ?auto_2233655 ?auto_2233660 ) ) ( not ( = ?auto_2233656 ?auto_2233657 ) ) ( not ( = ?auto_2233656 ?auto_2233658 ) ) ( not ( = ?auto_2233656 ?auto_2233659 ) ) ( not ( = ?auto_2233656 ?auto_2233660 ) ) ( not ( = ?auto_2233657 ?auto_2233658 ) ) ( not ( = ?auto_2233657 ?auto_2233659 ) ) ( not ( = ?auto_2233657 ?auto_2233660 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2233658 ?auto_2233659 ?auto_2233660 )
      ( MAKE-16CRATE-VERIFY ?auto_2233644 ?auto_2233645 ?auto_2233646 ?auto_2233648 ?auto_2233647 ?auto_2233649 ?auto_2233650 ?auto_2233651 ?auto_2233652 ?auto_2233653 ?auto_2233654 ?auto_2233655 ?auto_2233656 ?auto_2233657 ?auto_2233658 ?auto_2233659 ?auto_2233660 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2233876 - SURFACE
      ?auto_2233877 - SURFACE
      ?auto_2233878 - SURFACE
      ?auto_2233880 - SURFACE
      ?auto_2233879 - SURFACE
      ?auto_2233881 - SURFACE
      ?auto_2233882 - SURFACE
      ?auto_2233883 - SURFACE
      ?auto_2233884 - SURFACE
      ?auto_2233885 - SURFACE
      ?auto_2233886 - SURFACE
      ?auto_2233887 - SURFACE
      ?auto_2233888 - SURFACE
      ?auto_2233889 - SURFACE
      ?auto_2233890 - SURFACE
      ?auto_2233891 - SURFACE
      ?auto_2233892 - SURFACE
    )
    :vars
    (
      ?auto_2233894 - HOIST
      ?auto_2233897 - PLACE
      ?auto_2233896 - TRUCK
      ?auto_2233893 - PLACE
      ?auto_2233895 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2233894 ?auto_2233897 ) ( SURFACE-AT ?auto_2233891 ?auto_2233897 ) ( CLEAR ?auto_2233891 ) ( IS-CRATE ?auto_2233892 ) ( not ( = ?auto_2233891 ?auto_2233892 ) ) ( AVAILABLE ?auto_2233894 ) ( ON ?auto_2233891 ?auto_2233890 ) ( not ( = ?auto_2233890 ?auto_2233891 ) ) ( not ( = ?auto_2233890 ?auto_2233892 ) ) ( TRUCK-AT ?auto_2233896 ?auto_2233893 ) ( not ( = ?auto_2233893 ?auto_2233897 ) ) ( HOIST-AT ?auto_2233895 ?auto_2233893 ) ( LIFTING ?auto_2233895 ?auto_2233892 ) ( not ( = ?auto_2233894 ?auto_2233895 ) ) ( ON ?auto_2233877 ?auto_2233876 ) ( ON ?auto_2233878 ?auto_2233877 ) ( ON ?auto_2233880 ?auto_2233878 ) ( ON ?auto_2233879 ?auto_2233880 ) ( ON ?auto_2233881 ?auto_2233879 ) ( ON ?auto_2233882 ?auto_2233881 ) ( ON ?auto_2233883 ?auto_2233882 ) ( ON ?auto_2233884 ?auto_2233883 ) ( ON ?auto_2233885 ?auto_2233884 ) ( ON ?auto_2233886 ?auto_2233885 ) ( ON ?auto_2233887 ?auto_2233886 ) ( ON ?auto_2233888 ?auto_2233887 ) ( ON ?auto_2233889 ?auto_2233888 ) ( ON ?auto_2233890 ?auto_2233889 ) ( not ( = ?auto_2233876 ?auto_2233877 ) ) ( not ( = ?auto_2233876 ?auto_2233878 ) ) ( not ( = ?auto_2233876 ?auto_2233880 ) ) ( not ( = ?auto_2233876 ?auto_2233879 ) ) ( not ( = ?auto_2233876 ?auto_2233881 ) ) ( not ( = ?auto_2233876 ?auto_2233882 ) ) ( not ( = ?auto_2233876 ?auto_2233883 ) ) ( not ( = ?auto_2233876 ?auto_2233884 ) ) ( not ( = ?auto_2233876 ?auto_2233885 ) ) ( not ( = ?auto_2233876 ?auto_2233886 ) ) ( not ( = ?auto_2233876 ?auto_2233887 ) ) ( not ( = ?auto_2233876 ?auto_2233888 ) ) ( not ( = ?auto_2233876 ?auto_2233889 ) ) ( not ( = ?auto_2233876 ?auto_2233890 ) ) ( not ( = ?auto_2233876 ?auto_2233891 ) ) ( not ( = ?auto_2233876 ?auto_2233892 ) ) ( not ( = ?auto_2233877 ?auto_2233878 ) ) ( not ( = ?auto_2233877 ?auto_2233880 ) ) ( not ( = ?auto_2233877 ?auto_2233879 ) ) ( not ( = ?auto_2233877 ?auto_2233881 ) ) ( not ( = ?auto_2233877 ?auto_2233882 ) ) ( not ( = ?auto_2233877 ?auto_2233883 ) ) ( not ( = ?auto_2233877 ?auto_2233884 ) ) ( not ( = ?auto_2233877 ?auto_2233885 ) ) ( not ( = ?auto_2233877 ?auto_2233886 ) ) ( not ( = ?auto_2233877 ?auto_2233887 ) ) ( not ( = ?auto_2233877 ?auto_2233888 ) ) ( not ( = ?auto_2233877 ?auto_2233889 ) ) ( not ( = ?auto_2233877 ?auto_2233890 ) ) ( not ( = ?auto_2233877 ?auto_2233891 ) ) ( not ( = ?auto_2233877 ?auto_2233892 ) ) ( not ( = ?auto_2233878 ?auto_2233880 ) ) ( not ( = ?auto_2233878 ?auto_2233879 ) ) ( not ( = ?auto_2233878 ?auto_2233881 ) ) ( not ( = ?auto_2233878 ?auto_2233882 ) ) ( not ( = ?auto_2233878 ?auto_2233883 ) ) ( not ( = ?auto_2233878 ?auto_2233884 ) ) ( not ( = ?auto_2233878 ?auto_2233885 ) ) ( not ( = ?auto_2233878 ?auto_2233886 ) ) ( not ( = ?auto_2233878 ?auto_2233887 ) ) ( not ( = ?auto_2233878 ?auto_2233888 ) ) ( not ( = ?auto_2233878 ?auto_2233889 ) ) ( not ( = ?auto_2233878 ?auto_2233890 ) ) ( not ( = ?auto_2233878 ?auto_2233891 ) ) ( not ( = ?auto_2233878 ?auto_2233892 ) ) ( not ( = ?auto_2233880 ?auto_2233879 ) ) ( not ( = ?auto_2233880 ?auto_2233881 ) ) ( not ( = ?auto_2233880 ?auto_2233882 ) ) ( not ( = ?auto_2233880 ?auto_2233883 ) ) ( not ( = ?auto_2233880 ?auto_2233884 ) ) ( not ( = ?auto_2233880 ?auto_2233885 ) ) ( not ( = ?auto_2233880 ?auto_2233886 ) ) ( not ( = ?auto_2233880 ?auto_2233887 ) ) ( not ( = ?auto_2233880 ?auto_2233888 ) ) ( not ( = ?auto_2233880 ?auto_2233889 ) ) ( not ( = ?auto_2233880 ?auto_2233890 ) ) ( not ( = ?auto_2233880 ?auto_2233891 ) ) ( not ( = ?auto_2233880 ?auto_2233892 ) ) ( not ( = ?auto_2233879 ?auto_2233881 ) ) ( not ( = ?auto_2233879 ?auto_2233882 ) ) ( not ( = ?auto_2233879 ?auto_2233883 ) ) ( not ( = ?auto_2233879 ?auto_2233884 ) ) ( not ( = ?auto_2233879 ?auto_2233885 ) ) ( not ( = ?auto_2233879 ?auto_2233886 ) ) ( not ( = ?auto_2233879 ?auto_2233887 ) ) ( not ( = ?auto_2233879 ?auto_2233888 ) ) ( not ( = ?auto_2233879 ?auto_2233889 ) ) ( not ( = ?auto_2233879 ?auto_2233890 ) ) ( not ( = ?auto_2233879 ?auto_2233891 ) ) ( not ( = ?auto_2233879 ?auto_2233892 ) ) ( not ( = ?auto_2233881 ?auto_2233882 ) ) ( not ( = ?auto_2233881 ?auto_2233883 ) ) ( not ( = ?auto_2233881 ?auto_2233884 ) ) ( not ( = ?auto_2233881 ?auto_2233885 ) ) ( not ( = ?auto_2233881 ?auto_2233886 ) ) ( not ( = ?auto_2233881 ?auto_2233887 ) ) ( not ( = ?auto_2233881 ?auto_2233888 ) ) ( not ( = ?auto_2233881 ?auto_2233889 ) ) ( not ( = ?auto_2233881 ?auto_2233890 ) ) ( not ( = ?auto_2233881 ?auto_2233891 ) ) ( not ( = ?auto_2233881 ?auto_2233892 ) ) ( not ( = ?auto_2233882 ?auto_2233883 ) ) ( not ( = ?auto_2233882 ?auto_2233884 ) ) ( not ( = ?auto_2233882 ?auto_2233885 ) ) ( not ( = ?auto_2233882 ?auto_2233886 ) ) ( not ( = ?auto_2233882 ?auto_2233887 ) ) ( not ( = ?auto_2233882 ?auto_2233888 ) ) ( not ( = ?auto_2233882 ?auto_2233889 ) ) ( not ( = ?auto_2233882 ?auto_2233890 ) ) ( not ( = ?auto_2233882 ?auto_2233891 ) ) ( not ( = ?auto_2233882 ?auto_2233892 ) ) ( not ( = ?auto_2233883 ?auto_2233884 ) ) ( not ( = ?auto_2233883 ?auto_2233885 ) ) ( not ( = ?auto_2233883 ?auto_2233886 ) ) ( not ( = ?auto_2233883 ?auto_2233887 ) ) ( not ( = ?auto_2233883 ?auto_2233888 ) ) ( not ( = ?auto_2233883 ?auto_2233889 ) ) ( not ( = ?auto_2233883 ?auto_2233890 ) ) ( not ( = ?auto_2233883 ?auto_2233891 ) ) ( not ( = ?auto_2233883 ?auto_2233892 ) ) ( not ( = ?auto_2233884 ?auto_2233885 ) ) ( not ( = ?auto_2233884 ?auto_2233886 ) ) ( not ( = ?auto_2233884 ?auto_2233887 ) ) ( not ( = ?auto_2233884 ?auto_2233888 ) ) ( not ( = ?auto_2233884 ?auto_2233889 ) ) ( not ( = ?auto_2233884 ?auto_2233890 ) ) ( not ( = ?auto_2233884 ?auto_2233891 ) ) ( not ( = ?auto_2233884 ?auto_2233892 ) ) ( not ( = ?auto_2233885 ?auto_2233886 ) ) ( not ( = ?auto_2233885 ?auto_2233887 ) ) ( not ( = ?auto_2233885 ?auto_2233888 ) ) ( not ( = ?auto_2233885 ?auto_2233889 ) ) ( not ( = ?auto_2233885 ?auto_2233890 ) ) ( not ( = ?auto_2233885 ?auto_2233891 ) ) ( not ( = ?auto_2233885 ?auto_2233892 ) ) ( not ( = ?auto_2233886 ?auto_2233887 ) ) ( not ( = ?auto_2233886 ?auto_2233888 ) ) ( not ( = ?auto_2233886 ?auto_2233889 ) ) ( not ( = ?auto_2233886 ?auto_2233890 ) ) ( not ( = ?auto_2233886 ?auto_2233891 ) ) ( not ( = ?auto_2233886 ?auto_2233892 ) ) ( not ( = ?auto_2233887 ?auto_2233888 ) ) ( not ( = ?auto_2233887 ?auto_2233889 ) ) ( not ( = ?auto_2233887 ?auto_2233890 ) ) ( not ( = ?auto_2233887 ?auto_2233891 ) ) ( not ( = ?auto_2233887 ?auto_2233892 ) ) ( not ( = ?auto_2233888 ?auto_2233889 ) ) ( not ( = ?auto_2233888 ?auto_2233890 ) ) ( not ( = ?auto_2233888 ?auto_2233891 ) ) ( not ( = ?auto_2233888 ?auto_2233892 ) ) ( not ( = ?auto_2233889 ?auto_2233890 ) ) ( not ( = ?auto_2233889 ?auto_2233891 ) ) ( not ( = ?auto_2233889 ?auto_2233892 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2233890 ?auto_2233891 ?auto_2233892 )
      ( MAKE-16CRATE-VERIFY ?auto_2233876 ?auto_2233877 ?auto_2233878 ?auto_2233880 ?auto_2233879 ?auto_2233881 ?auto_2233882 ?auto_2233883 ?auto_2233884 ?auto_2233885 ?auto_2233886 ?auto_2233887 ?auto_2233888 ?auto_2233889 ?auto_2233890 ?auto_2233891 ?auto_2233892 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2234124 - SURFACE
      ?auto_2234125 - SURFACE
      ?auto_2234126 - SURFACE
      ?auto_2234128 - SURFACE
      ?auto_2234127 - SURFACE
      ?auto_2234129 - SURFACE
      ?auto_2234130 - SURFACE
      ?auto_2234131 - SURFACE
      ?auto_2234132 - SURFACE
      ?auto_2234133 - SURFACE
      ?auto_2234134 - SURFACE
      ?auto_2234135 - SURFACE
      ?auto_2234136 - SURFACE
      ?auto_2234137 - SURFACE
      ?auto_2234138 - SURFACE
      ?auto_2234139 - SURFACE
      ?auto_2234140 - SURFACE
    )
    :vars
    (
      ?auto_2234145 - HOIST
      ?auto_2234143 - PLACE
      ?auto_2234146 - TRUCK
      ?auto_2234141 - PLACE
      ?auto_2234144 - HOIST
      ?auto_2234142 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2234145 ?auto_2234143 ) ( SURFACE-AT ?auto_2234139 ?auto_2234143 ) ( CLEAR ?auto_2234139 ) ( IS-CRATE ?auto_2234140 ) ( not ( = ?auto_2234139 ?auto_2234140 ) ) ( AVAILABLE ?auto_2234145 ) ( ON ?auto_2234139 ?auto_2234138 ) ( not ( = ?auto_2234138 ?auto_2234139 ) ) ( not ( = ?auto_2234138 ?auto_2234140 ) ) ( TRUCK-AT ?auto_2234146 ?auto_2234141 ) ( not ( = ?auto_2234141 ?auto_2234143 ) ) ( HOIST-AT ?auto_2234144 ?auto_2234141 ) ( not ( = ?auto_2234145 ?auto_2234144 ) ) ( AVAILABLE ?auto_2234144 ) ( SURFACE-AT ?auto_2234140 ?auto_2234141 ) ( ON ?auto_2234140 ?auto_2234142 ) ( CLEAR ?auto_2234140 ) ( not ( = ?auto_2234139 ?auto_2234142 ) ) ( not ( = ?auto_2234140 ?auto_2234142 ) ) ( not ( = ?auto_2234138 ?auto_2234142 ) ) ( ON ?auto_2234125 ?auto_2234124 ) ( ON ?auto_2234126 ?auto_2234125 ) ( ON ?auto_2234128 ?auto_2234126 ) ( ON ?auto_2234127 ?auto_2234128 ) ( ON ?auto_2234129 ?auto_2234127 ) ( ON ?auto_2234130 ?auto_2234129 ) ( ON ?auto_2234131 ?auto_2234130 ) ( ON ?auto_2234132 ?auto_2234131 ) ( ON ?auto_2234133 ?auto_2234132 ) ( ON ?auto_2234134 ?auto_2234133 ) ( ON ?auto_2234135 ?auto_2234134 ) ( ON ?auto_2234136 ?auto_2234135 ) ( ON ?auto_2234137 ?auto_2234136 ) ( ON ?auto_2234138 ?auto_2234137 ) ( not ( = ?auto_2234124 ?auto_2234125 ) ) ( not ( = ?auto_2234124 ?auto_2234126 ) ) ( not ( = ?auto_2234124 ?auto_2234128 ) ) ( not ( = ?auto_2234124 ?auto_2234127 ) ) ( not ( = ?auto_2234124 ?auto_2234129 ) ) ( not ( = ?auto_2234124 ?auto_2234130 ) ) ( not ( = ?auto_2234124 ?auto_2234131 ) ) ( not ( = ?auto_2234124 ?auto_2234132 ) ) ( not ( = ?auto_2234124 ?auto_2234133 ) ) ( not ( = ?auto_2234124 ?auto_2234134 ) ) ( not ( = ?auto_2234124 ?auto_2234135 ) ) ( not ( = ?auto_2234124 ?auto_2234136 ) ) ( not ( = ?auto_2234124 ?auto_2234137 ) ) ( not ( = ?auto_2234124 ?auto_2234138 ) ) ( not ( = ?auto_2234124 ?auto_2234139 ) ) ( not ( = ?auto_2234124 ?auto_2234140 ) ) ( not ( = ?auto_2234124 ?auto_2234142 ) ) ( not ( = ?auto_2234125 ?auto_2234126 ) ) ( not ( = ?auto_2234125 ?auto_2234128 ) ) ( not ( = ?auto_2234125 ?auto_2234127 ) ) ( not ( = ?auto_2234125 ?auto_2234129 ) ) ( not ( = ?auto_2234125 ?auto_2234130 ) ) ( not ( = ?auto_2234125 ?auto_2234131 ) ) ( not ( = ?auto_2234125 ?auto_2234132 ) ) ( not ( = ?auto_2234125 ?auto_2234133 ) ) ( not ( = ?auto_2234125 ?auto_2234134 ) ) ( not ( = ?auto_2234125 ?auto_2234135 ) ) ( not ( = ?auto_2234125 ?auto_2234136 ) ) ( not ( = ?auto_2234125 ?auto_2234137 ) ) ( not ( = ?auto_2234125 ?auto_2234138 ) ) ( not ( = ?auto_2234125 ?auto_2234139 ) ) ( not ( = ?auto_2234125 ?auto_2234140 ) ) ( not ( = ?auto_2234125 ?auto_2234142 ) ) ( not ( = ?auto_2234126 ?auto_2234128 ) ) ( not ( = ?auto_2234126 ?auto_2234127 ) ) ( not ( = ?auto_2234126 ?auto_2234129 ) ) ( not ( = ?auto_2234126 ?auto_2234130 ) ) ( not ( = ?auto_2234126 ?auto_2234131 ) ) ( not ( = ?auto_2234126 ?auto_2234132 ) ) ( not ( = ?auto_2234126 ?auto_2234133 ) ) ( not ( = ?auto_2234126 ?auto_2234134 ) ) ( not ( = ?auto_2234126 ?auto_2234135 ) ) ( not ( = ?auto_2234126 ?auto_2234136 ) ) ( not ( = ?auto_2234126 ?auto_2234137 ) ) ( not ( = ?auto_2234126 ?auto_2234138 ) ) ( not ( = ?auto_2234126 ?auto_2234139 ) ) ( not ( = ?auto_2234126 ?auto_2234140 ) ) ( not ( = ?auto_2234126 ?auto_2234142 ) ) ( not ( = ?auto_2234128 ?auto_2234127 ) ) ( not ( = ?auto_2234128 ?auto_2234129 ) ) ( not ( = ?auto_2234128 ?auto_2234130 ) ) ( not ( = ?auto_2234128 ?auto_2234131 ) ) ( not ( = ?auto_2234128 ?auto_2234132 ) ) ( not ( = ?auto_2234128 ?auto_2234133 ) ) ( not ( = ?auto_2234128 ?auto_2234134 ) ) ( not ( = ?auto_2234128 ?auto_2234135 ) ) ( not ( = ?auto_2234128 ?auto_2234136 ) ) ( not ( = ?auto_2234128 ?auto_2234137 ) ) ( not ( = ?auto_2234128 ?auto_2234138 ) ) ( not ( = ?auto_2234128 ?auto_2234139 ) ) ( not ( = ?auto_2234128 ?auto_2234140 ) ) ( not ( = ?auto_2234128 ?auto_2234142 ) ) ( not ( = ?auto_2234127 ?auto_2234129 ) ) ( not ( = ?auto_2234127 ?auto_2234130 ) ) ( not ( = ?auto_2234127 ?auto_2234131 ) ) ( not ( = ?auto_2234127 ?auto_2234132 ) ) ( not ( = ?auto_2234127 ?auto_2234133 ) ) ( not ( = ?auto_2234127 ?auto_2234134 ) ) ( not ( = ?auto_2234127 ?auto_2234135 ) ) ( not ( = ?auto_2234127 ?auto_2234136 ) ) ( not ( = ?auto_2234127 ?auto_2234137 ) ) ( not ( = ?auto_2234127 ?auto_2234138 ) ) ( not ( = ?auto_2234127 ?auto_2234139 ) ) ( not ( = ?auto_2234127 ?auto_2234140 ) ) ( not ( = ?auto_2234127 ?auto_2234142 ) ) ( not ( = ?auto_2234129 ?auto_2234130 ) ) ( not ( = ?auto_2234129 ?auto_2234131 ) ) ( not ( = ?auto_2234129 ?auto_2234132 ) ) ( not ( = ?auto_2234129 ?auto_2234133 ) ) ( not ( = ?auto_2234129 ?auto_2234134 ) ) ( not ( = ?auto_2234129 ?auto_2234135 ) ) ( not ( = ?auto_2234129 ?auto_2234136 ) ) ( not ( = ?auto_2234129 ?auto_2234137 ) ) ( not ( = ?auto_2234129 ?auto_2234138 ) ) ( not ( = ?auto_2234129 ?auto_2234139 ) ) ( not ( = ?auto_2234129 ?auto_2234140 ) ) ( not ( = ?auto_2234129 ?auto_2234142 ) ) ( not ( = ?auto_2234130 ?auto_2234131 ) ) ( not ( = ?auto_2234130 ?auto_2234132 ) ) ( not ( = ?auto_2234130 ?auto_2234133 ) ) ( not ( = ?auto_2234130 ?auto_2234134 ) ) ( not ( = ?auto_2234130 ?auto_2234135 ) ) ( not ( = ?auto_2234130 ?auto_2234136 ) ) ( not ( = ?auto_2234130 ?auto_2234137 ) ) ( not ( = ?auto_2234130 ?auto_2234138 ) ) ( not ( = ?auto_2234130 ?auto_2234139 ) ) ( not ( = ?auto_2234130 ?auto_2234140 ) ) ( not ( = ?auto_2234130 ?auto_2234142 ) ) ( not ( = ?auto_2234131 ?auto_2234132 ) ) ( not ( = ?auto_2234131 ?auto_2234133 ) ) ( not ( = ?auto_2234131 ?auto_2234134 ) ) ( not ( = ?auto_2234131 ?auto_2234135 ) ) ( not ( = ?auto_2234131 ?auto_2234136 ) ) ( not ( = ?auto_2234131 ?auto_2234137 ) ) ( not ( = ?auto_2234131 ?auto_2234138 ) ) ( not ( = ?auto_2234131 ?auto_2234139 ) ) ( not ( = ?auto_2234131 ?auto_2234140 ) ) ( not ( = ?auto_2234131 ?auto_2234142 ) ) ( not ( = ?auto_2234132 ?auto_2234133 ) ) ( not ( = ?auto_2234132 ?auto_2234134 ) ) ( not ( = ?auto_2234132 ?auto_2234135 ) ) ( not ( = ?auto_2234132 ?auto_2234136 ) ) ( not ( = ?auto_2234132 ?auto_2234137 ) ) ( not ( = ?auto_2234132 ?auto_2234138 ) ) ( not ( = ?auto_2234132 ?auto_2234139 ) ) ( not ( = ?auto_2234132 ?auto_2234140 ) ) ( not ( = ?auto_2234132 ?auto_2234142 ) ) ( not ( = ?auto_2234133 ?auto_2234134 ) ) ( not ( = ?auto_2234133 ?auto_2234135 ) ) ( not ( = ?auto_2234133 ?auto_2234136 ) ) ( not ( = ?auto_2234133 ?auto_2234137 ) ) ( not ( = ?auto_2234133 ?auto_2234138 ) ) ( not ( = ?auto_2234133 ?auto_2234139 ) ) ( not ( = ?auto_2234133 ?auto_2234140 ) ) ( not ( = ?auto_2234133 ?auto_2234142 ) ) ( not ( = ?auto_2234134 ?auto_2234135 ) ) ( not ( = ?auto_2234134 ?auto_2234136 ) ) ( not ( = ?auto_2234134 ?auto_2234137 ) ) ( not ( = ?auto_2234134 ?auto_2234138 ) ) ( not ( = ?auto_2234134 ?auto_2234139 ) ) ( not ( = ?auto_2234134 ?auto_2234140 ) ) ( not ( = ?auto_2234134 ?auto_2234142 ) ) ( not ( = ?auto_2234135 ?auto_2234136 ) ) ( not ( = ?auto_2234135 ?auto_2234137 ) ) ( not ( = ?auto_2234135 ?auto_2234138 ) ) ( not ( = ?auto_2234135 ?auto_2234139 ) ) ( not ( = ?auto_2234135 ?auto_2234140 ) ) ( not ( = ?auto_2234135 ?auto_2234142 ) ) ( not ( = ?auto_2234136 ?auto_2234137 ) ) ( not ( = ?auto_2234136 ?auto_2234138 ) ) ( not ( = ?auto_2234136 ?auto_2234139 ) ) ( not ( = ?auto_2234136 ?auto_2234140 ) ) ( not ( = ?auto_2234136 ?auto_2234142 ) ) ( not ( = ?auto_2234137 ?auto_2234138 ) ) ( not ( = ?auto_2234137 ?auto_2234139 ) ) ( not ( = ?auto_2234137 ?auto_2234140 ) ) ( not ( = ?auto_2234137 ?auto_2234142 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2234138 ?auto_2234139 ?auto_2234140 )
      ( MAKE-16CRATE-VERIFY ?auto_2234124 ?auto_2234125 ?auto_2234126 ?auto_2234128 ?auto_2234127 ?auto_2234129 ?auto_2234130 ?auto_2234131 ?auto_2234132 ?auto_2234133 ?auto_2234134 ?auto_2234135 ?auto_2234136 ?auto_2234137 ?auto_2234138 ?auto_2234139 ?auto_2234140 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2234373 - SURFACE
      ?auto_2234374 - SURFACE
      ?auto_2234375 - SURFACE
      ?auto_2234377 - SURFACE
      ?auto_2234376 - SURFACE
      ?auto_2234378 - SURFACE
      ?auto_2234379 - SURFACE
      ?auto_2234380 - SURFACE
      ?auto_2234381 - SURFACE
      ?auto_2234382 - SURFACE
      ?auto_2234383 - SURFACE
      ?auto_2234384 - SURFACE
      ?auto_2234385 - SURFACE
      ?auto_2234386 - SURFACE
      ?auto_2234387 - SURFACE
      ?auto_2234388 - SURFACE
      ?auto_2234389 - SURFACE
    )
    :vars
    (
      ?auto_2234391 - HOIST
      ?auto_2234390 - PLACE
      ?auto_2234394 - PLACE
      ?auto_2234395 - HOIST
      ?auto_2234392 - SURFACE
      ?auto_2234393 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2234391 ?auto_2234390 ) ( SURFACE-AT ?auto_2234388 ?auto_2234390 ) ( CLEAR ?auto_2234388 ) ( IS-CRATE ?auto_2234389 ) ( not ( = ?auto_2234388 ?auto_2234389 ) ) ( AVAILABLE ?auto_2234391 ) ( ON ?auto_2234388 ?auto_2234387 ) ( not ( = ?auto_2234387 ?auto_2234388 ) ) ( not ( = ?auto_2234387 ?auto_2234389 ) ) ( not ( = ?auto_2234394 ?auto_2234390 ) ) ( HOIST-AT ?auto_2234395 ?auto_2234394 ) ( not ( = ?auto_2234391 ?auto_2234395 ) ) ( AVAILABLE ?auto_2234395 ) ( SURFACE-AT ?auto_2234389 ?auto_2234394 ) ( ON ?auto_2234389 ?auto_2234392 ) ( CLEAR ?auto_2234389 ) ( not ( = ?auto_2234388 ?auto_2234392 ) ) ( not ( = ?auto_2234389 ?auto_2234392 ) ) ( not ( = ?auto_2234387 ?auto_2234392 ) ) ( TRUCK-AT ?auto_2234393 ?auto_2234390 ) ( ON ?auto_2234374 ?auto_2234373 ) ( ON ?auto_2234375 ?auto_2234374 ) ( ON ?auto_2234377 ?auto_2234375 ) ( ON ?auto_2234376 ?auto_2234377 ) ( ON ?auto_2234378 ?auto_2234376 ) ( ON ?auto_2234379 ?auto_2234378 ) ( ON ?auto_2234380 ?auto_2234379 ) ( ON ?auto_2234381 ?auto_2234380 ) ( ON ?auto_2234382 ?auto_2234381 ) ( ON ?auto_2234383 ?auto_2234382 ) ( ON ?auto_2234384 ?auto_2234383 ) ( ON ?auto_2234385 ?auto_2234384 ) ( ON ?auto_2234386 ?auto_2234385 ) ( ON ?auto_2234387 ?auto_2234386 ) ( not ( = ?auto_2234373 ?auto_2234374 ) ) ( not ( = ?auto_2234373 ?auto_2234375 ) ) ( not ( = ?auto_2234373 ?auto_2234377 ) ) ( not ( = ?auto_2234373 ?auto_2234376 ) ) ( not ( = ?auto_2234373 ?auto_2234378 ) ) ( not ( = ?auto_2234373 ?auto_2234379 ) ) ( not ( = ?auto_2234373 ?auto_2234380 ) ) ( not ( = ?auto_2234373 ?auto_2234381 ) ) ( not ( = ?auto_2234373 ?auto_2234382 ) ) ( not ( = ?auto_2234373 ?auto_2234383 ) ) ( not ( = ?auto_2234373 ?auto_2234384 ) ) ( not ( = ?auto_2234373 ?auto_2234385 ) ) ( not ( = ?auto_2234373 ?auto_2234386 ) ) ( not ( = ?auto_2234373 ?auto_2234387 ) ) ( not ( = ?auto_2234373 ?auto_2234388 ) ) ( not ( = ?auto_2234373 ?auto_2234389 ) ) ( not ( = ?auto_2234373 ?auto_2234392 ) ) ( not ( = ?auto_2234374 ?auto_2234375 ) ) ( not ( = ?auto_2234374 ?auto_2234377 ) ) ( not ( = ?auto_2234374 ?auto_2234376 ) ) ( not ( = ?auto_2234374 ?auto_2234378 ) ) ( not ( = ?auto_2234374 ?auto_2234379 ) ) ( not ( = ?auto_2234374 ?auto_2234380 ) ) ( not ( = ?auto_2234374 ?auto_2234381 ) ) ( not ( = ?auto_2234374 ?auto_2234382 ) ) ( not ( = ?auto_2234374 ?auto_2234383 ) ) ( not ( = ?auto_2234374 ?auto_2234384 ) ) ( not ( = ?auto_2234374 ?auto_2234385 ) ) ( not ( = ?auto_2234374 ?auto_2234386 ) ) ( not ( = ?auto_2234374 ?auto_2234387 ) ) ( not ( = ?auto_2234374 ?auto_2234388 ) ) ( not ( = ?auto_2234374 ?auto_2234389 ) ) ( not ( = ?auto_2234374 ?auto_2234392 ) ) ( not ( = ?auto_2234375 ?auto_2234377 ) ) ( not ( = ?auto_2234375 ?auto_2234376 ) ) ( not ( = ?auto_2234375 ?auto_2234378 ) ) ( not ( = ?auto_2234375 ?auto_2234379 ) ) ( not ( = ?auto_2234375 ?auto_2234380 ) ) ( not ( = ?auto_2234375 ?auto_2234381 ) ) ( not ( = ?auto_2234375 ?auto_2234382 ) ) ( not ( = ?auto_2234375 ?auto_2234383 ) ) ( not ( = ?auto_2234375 ?auto_2234384 ) ) ( not ( = ?auto_2234375 ?auto_2234385 ) ) ( not ( = ?auto_2234375 ?auto_2234386 ) ) ( not ( = ?auto_2234375 ?auto_2234387 ) ) ( not ( = ?auto_2234375 ?auto_2234388 ) ) ( not ( = ?auto_2234375 ?auto_2234389 ) ) ( not ( = ?auto_2234375 ?auto_2234392 ) ) ( not ( = ?auto_2234377 ?auto_2234376 ) ) ( not ( = ?auto_2234377 ?auto_2234378 ) ) ( not ( = ?auto_2234377 ?auto_2234379 ) ) ( not ( = ?auto_2234377 ?auto_2234380 ) ) ( not ( = ?auto_2234377 ?auto_2234381 ) ) ( not ( = ?auto_2234377 ?auto_2234382 ) ) ( not ( = ?auto_2234377 ?auto_2234383 ) ) ( not ( = ?auto_2234377 ?auto_2234384 ) ) ( not ( = ?auto_2234377 ?auto_2234385 ) ) ( not ( = ?auto_2234377 ?auto_2234386 ) ) ( not ( = ?auto_2234377 ?auto_2234387 ) ) ( not ( = ?auto_2234377 ?auto_2234388 ) ) ( not ( = ?auto_2234377 ?auto_2234389 ) ) ( not ( = ?auto_2234377 ?auto_2234392 ) ) ( not ( = ?auto_2234376 ?auto_2234378 ) ) ( not ( = ?auto_2234376 ?auto_2234379 ) ) ( not ( = ?auto_2234376 ?auto_2234380 ) ) ( not ( = ?auto_2234376 ?auto_2234381 ) ) ( not ( = ?auto_2234376 ?auto_2234382 ) ) ( not ( = ?auto_2234376 ?auto_2234383 ) ) ( not ( = ?auto_2234376 ?auto_2234384 ) ) ( not ( = ?auto_2234376 ?auto_2234385 ) ) ( not ( = ?auto_2234376 ?auto_2234386 ) ) ( not ( = ?auto_2234376 ?auto_2234387 ) ) ( not ( = ?auto_2234376 ?auto_2234388 ) ) ( not ( = ?auto_2234376 ?auto_2234389 ) ) ( not ( = ?auto_2234376 ?auto_2234392 ) ) ( not ( = ?auto_2234378 ?auto_2234379 ) ) ( not ( = ?auto_2234378 ?auto_2234380 ) ) ( not ( = ?auto_2234378 ?auto_2234381 ) ) ( not ( = ?auto_2234378 ?auto_2234382 ) ) ( not ( = ?auto_2234378 ?auto_2234383 ) ) ( not ( = ?auto_2234378 ?auto_2234384 ) ) ( not ( = ?auto_2234378 ?auto_2234385 ) ) ( not ( = ?auto_2234378 ?auto_2234386 ) ) ( not ( = ?auto_2234378 ?auto_2234387 ) ) ( not ( = ?auto_2234378 ?auto_2234388 ) ) ( not ( = ?auto_2234378 ?auto_2234389 ) ) ( not ( = ?auto_2234378 ?auto_2234392 ) ) ( not ( = ?auto_2234379 ?auto_2234380 ) ) ( not ( = ?auto_2234379 ?auto_2234381 ) ) ( not ( = ?auto_2234379 ?auto_2234382 ) ) ( not ( = ?auto_2234379 ?auto_2234383 ) ) ( not ( = ?auto_2234379 ?auto_2234384 ) ) ( not ( = ?auto_2234379 ?auto_2234385 ) ) ( not ( = ?auto_2234379 ?auto_2234386 ) ) ( not ( = ?auto_2234379 ?auto_2234387 ) ) ( not ( = ?auto_2234379 ?auto_2234388 ) ) ( not ( = ?auto_2234379 ?auto_2234389 ) ) ( not ( = ?auto_2234379 ?auto_2234392 ) ) ( not ( = ?auto_2234380 ?auto_2234381 ) ) ( not ( = ?auto_2234380 ?auto_2234382 ) ) ( not ( = ?auto_2234380 ?auto_2234383 ) ) ( not ( = ?auto_2234380 ?auto_2234384 ) ) ( not ( = ?auto_2234380 ?auto_2234385 ) ) ( not ( = ?auto_2234380 ?auto_2234386 ) ) ( not ( = ?auto_2234380 ?auto_2234387 ) ) ( not ( = ?auto_2234380 ?auto_2234388 ) ) ( not ( = ?auto_2234380 ?auto_2234389 ) ) ( not ( = ?auto_2234380 ?auto_2234392 ) ) ( not ( = ?auto_2234381 ?auto_2234382 ) ) ( not ( = ?auto_2234381 ?auto_2234383 ) ) ( not ( = ?auto_2234381 ?auto_2234384 ) ) ( not ( = ?auto_2234381 ?auto_2234385 ) ) ( not ( = ?auto_2234381 ?auto_2234386 ) ) ( not ( = ?auto_2234381 ?auto_2234387 ) ) ( not ( = ?auto_2234381 ?auto_2234388 ) ) ( not ( = ?auto_2234381 ?auto_2234389 ) ) ( not ( = ?auto_2234381 ?auto_2234392 ) ) ( not ( = ?auto_2234382 ?auto_2234383 ) ) ( not ( = ?auto_2234382 ?auto_2234384 ) ) ( not ( = ?auto_2234382 ?auto_2234385 ) ) ( not ( = ?auto_2234382 ?auto_2234386 ) ) ( not ( = ?auto_2234382 ?auto_2234387 ) ) ( not ( = ?auto_2234382 ?auto_2234388 ) ) ( not ( = ?auto_2234382 ?auto_2234389 ) ) ( not ( = ?auto_2234382 ?auto_2234392 ) ) ( not ( = ?auto_2234383 ?auto_2234384 ) ) ( not ( = ?auto_2234383 ?auto_2234385 ) ) ( not ( = ?auto_2234383 ?auto_2234386 ) ) ( not ( = ?auto_2234383 ?auto_2234387 ) ) ( not ( = ?auto_2234383 ?auto_2234388 ) ) ( not ( = ?auto_2234383 ?auto_2234389 ) ) ( not ( = ?auto_2234383 ?auto_2234392 ) ) ( not ( = ?auto_2234384 ?auto_2234385 ) ) ( not ( = ?auto_2234384 ?auto_2234386 ) ) ( not ( = ?auto_2234384 ?auto_2234387 ) ) ( not ( = ?auto_2234384 ?auto_2234388 ) ) ( not ( = ?auto_2234384 ?auto_2234389 ) ) ( not ( = ?auto_2234384 ?auto_2234392 ) ) ( not ( = ?auto_2234385 ?auto_2234386 ) ) ( not ( = ?auto_2234385 ?auto_2234387 ) ) ( not ( = ?auto_2234385 ?auto_2234388 ) ) ( not ( = ?auto_2234385 ?auto_2234389 ) ) ( not ( = ?auto_2234385 ?auto_2234392 ) ) ( not ( = ?auto_2234386 ?auto_2234387 ) ) ( not ( = ?auto_2234386 ?auto_2234388 ) ) ( not ( = ?auto_2234386 ?auto_2234389 ) ) ( not ( = ?auto_2234386 ?auto_2234392 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2234387 ?auto_2234388 ?auto_2234389 )
      ( MAKE-16CRATE-VERIFY ?auto_2234373 ?auto_2234374 ?auto_2234375 ?auto_2234377 ?auto_2234376 ?auto_2234378 ?auto_2234379 ?auto_2234380 ?auto_2234381 ?auto_2234382 ?auto_2234383 ?auto_2234384 ?auto_2234385 ?auto_2234386 ?auto_2234387 ?auto_2234388 ?auto_2234389 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2234622 - SURFACE
      ?auto_2234623 - SURFACE
      ?auto_2234624 - SURFACE
      ?auto_2234626 - SURFACE
      ?auto_2234625 - SURFACE
      ?auto_2234627 - SURFACE
      ?auto_2234628 - SURFACE
      ?auto_2234629 - SURFACE
      ?auto_2234630 - SURFACE
      ?auto_2234631 - SURFACE
      ?auto_2234632 - SURFACE
      ?auto_2234633 - SURFACE
      ?auto_2234634 - SURFACE
      ?auto_2234635 - SURFACE
      ?auto_2234636 - SURFACE
      ?auto_2234637 - SURFACE
      ?auto_2234638 - SURFACE
    )
    :vars
    (
      ?auto_2234641 - HOIST
      ?auto_2234642 - PLACE
      ?auto_2234640 - PLACE
      ?auto_2234644 - HOIST
      ?auto_2234643 - SURFACE
      ?auto_2234639 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2234641 ?auto_2234642 ) ( IS-CRATE ?auto_2234638 ) ( not ( = ?auto_2234637 ?auto_2234638 ) ) ( not ( = ?auto_2234636 ?auto_2234637 ) ) ( not ( = ?auto_2234636 ?auto_2234638 ) ) ( not ( = ?auto_2234640 ?auto_2234642 ) ) ( HOIST-AT ?auto_2234644 ?auto_2234640 ) ( not ( = ?auto_2234641 ?auto_2234644 ) ) ( AVAILABLE ?auto_2234644 ) ( SURFACE-AT ?auto_2234638 ?auto_2234640 ) ( ON ?auto_2234638 ?auto_2234643 ) ( CLEAR ?auto_2234638 ) ( not ( = ?auto_2234637 ?auto_2234643 ) ) ( not ( = ?auto_2234638 ?auto_2234643 ) ) ( not ( = ?auto_2234636 ?auto_2234643 ) ) ( TRUCK-AT ?auto_2234639 ?auto_2234642 ) ( SURFACE-AT ?auto_2234636 ?auto_2234642 ) ( CLEAR ?auto_2234636 ) ( LIFTING ?auto_2234641 ?auto_2234637 ) ( IS-CRATE ?auto_2234637 ) ( ON ?auto_2234623 ?auto_2234622 ) ( ON ?auto_2234624 ?auto_2234623 ) ( ON ?auto_2234626 ?auto_2234624 ) ( ON ?auto_2234625 ?auto_2234626 ) ( ON ?auto_2234627 ?auto_2234625 ) ( ON ?auto_2234628 ?auto_2234627 ) ( ON ?auto_2234629 ?auto_2234628 ) ( ON ?auto_2234630 ?auto_2234629 ) ( ON ?auto_2234631 ?auto_2234630 ) ( ON ?auto_2234632 ?auto_2234631 ) ( ON ?auto_2234633 ?auto_2234632 ) ( ON ?auto_2234634 ?auto_2234633 ) ( ON ?auto_2234635 ?auto_2234634 ) ( ON ?auto_2234636 ?auto_2234635 ) ( not ( = ?auto_2234622 ?auto_2234623 ) ) ( not ( = ?auto_2234622 ?auto_2234624 ) ) ( not ( = ?auto_2234622 ?auto_2234626 ) ) ( not ( = ?auto_2234622 ?auto_2234625 ) ) ( not ( = ?auto_2234622 ?auto_2234627 ) ) ( not ( = ?auto_2234622 ?auto_2234628 ) ) ( not ( = ?auto_2234622 ?auto_2234629 ) ) ( not ( = ?auto_2234622 ?auto_2234630 ) ) ( not ( = ?auto_2234622 ?auto_2234631 ) ) ( not ( = ?auto_2234622 ?auto_2234632 ) ) ( not ( = ?auto_2234622 ?auto_2234633 ) ) ( not ( = ?auto_2234622 ?auto_2234634 ) ) ( not ( = ?auto_2234622 ?auto_2234635 ) ) ( not ( = ?auto_2234622 ?auto_2234636 ) ) ( not ( = ?auto_2234622 ?auto_2234637 ) ) ( not ( = ?auto_2234622 ?auto_2234638 ) ) ( not ( = ?auto_2234622 ?auto_2234643 ) ) ( not ( = ?auto_2234623 ?auto_2234624 ) ) ( not ( = ?auto_2234623 ?auto_2234626 ) ) ( not ( = ?auto_2234623 ?auto_2234625 ) ) ( not ( = ?auto_2234623 ?auto_2234627 ) ) ( not ( = ?auto_2234623 ?auto_2234628 ) ) ( not ( = ?auto_2234623 ?auto_2234629 ) ) ( not ( = ?auto_2234623 ?auto_2234630 ) ) ( not ( = ?auto_2234623 ?auto_2234631 ) ) ( not ( = ?auto_2234623 ?auto_2234632 ) ) ( not ( = ?auto_2234623 ?auto_2234633 ) ) ( not ( = ?auto_2234623 ?auto_2234634 ) ) ( not ( = ?auto_2234623 ?auto_2234635 ) ) ( not ( = ?auto_2234623 ?auto_2234636 ) ) ( not ( = ?auto_2234623 ?auto_2234637 ) ) ( not ( = ?auto_2234623 ?auto_2234638 ) ) ( not ( = ?auto_2234623 ?auto_2234643 ) ) ( not ( = ?auto_2234624 ?auto_2234626 ) ) ( not ( = ?auto_2234624 ?auto_2234625 ) ) ( not ( = ?auto_2234624 ?auto_2234627 ) ) ( not ( = ?auto_2234624 ?auto_2234628 ) ) ( not ( = ?auto_2234624 ?auto_2234629 ) ) ( not ( = ?auto_2234624 ?auto_2234630 ) ) ( not ( = ?auto_2234624 ?auto_2234631 ) ) ( not ( = ?auto_2234624 ?auto_2234632 ) ) ( not ( = ?auto_2234624 ?auto_2234633 ) ) ( not ( = ?auto_2234624 ?auto_2234634 ) ) ( not ( = ?auto_2234624 ?auto_2234635 ) ) ( not ( = ?auto_2234624 ?auto_2234636 ) ) ( not ( = ?auto_2234624 ?auto_2234637 ) ) ( not ( = ?auto_2234624 ?auto_2234638 ) ) ( not ( = ?auto_2234624 ?auto_2234643 ) ) ( not ( = ?auto_2234626 ?auto_2234625 ) ) ( not ( = ?auto_2234626 ?auto_2234627 ) ) ( not ( = ?auto_2234626 ?auto_2234628 ) ) ( not ( = ?auto_2234626 ?auto_2234629 ) ) ( not ( = ?auto_2234626 ?auto_2234630 ) ) ( not ( = ?auto_2234626 ?auto_2234631 ) ) ( not ( = ?auto_2234626 ?auto_2234632 ) ) ( not ( = ?auto_2234626 ?auto_2234633 ) ) ( not ( = ?auto_2234626 ?auto_2234634 ) ) ( not ( = ?auto_2234626 ?auto_2234635 ) ) ( not ( = ?auto_2234626 ?auto_2234636 ) ) ( not ( = ?auto_2234626 ?auto_2234637 ) ) ( not ( = ?auto_2234626 ?auto_2234638 ) ) ( not ( = ?auto_2234626 ?auto_2234643 ) ) ( not ( = ?auto_2234625 ?auto_2234627 ) ) ( not ( = ?auto_2234625 ?auto_2234628 ) ) ( not ( = ?auto_2234625 ?auto_2234629 ) ) ( not ( = ?auto_2234625 ?auto_2234630 ) ) ( not ( = ?auto_2234625 ?auto_2234631 ) ) ( not ( = ?auto_2234625 ?auto_2234632 ) ) ( not ( = ?auto_2234625 ?auto_2234633 ) ) ( not ( = ?auto_2234625 ?auto_2234634 ) ) ( not ( = ?auto_2234625 ?auto_2234635 ) ) ( not ( = ?auto_2234625 ?auto_2234636 ) ) ( not ( = ?auto_2234625 ?auto_2234637 ) ) ( not ( = ?auto_2234625 ?auto_2234638 ) ) ( not ( = ?auto_2234625 ?auto_2234643 ) ) ( not ( = ?auto_2234627 ?auto_2234628 ) ) ( not ( = ?auto_2234627 ?auto_2234629 ) ) ( not ( = ?auto_2234627 ?auto_2234630 ) ) ( not ( = ?auto_2234627 ?auto_2234631 ) ) ( not ( = ?auto_2234627 ?auto_2234632 ) ) ( not ( = ?auto_2234627 ?auto_2234633 ) ) ( not ( = ?auto_2234627 ?auto_2234634 ) ) ( not ( = ?auto_2234627 ?auto_2234635 ) ) ( not ( = ?auto_2234627 ?auto_2234636 ) ) ( not ( = ?auto_2234627 ?auto_2234637 ) ) ( not ( = ?auto_2234627 ?auto_2234638 ) ) ( not ( = ?auto_2234627 ?auto_2234643 ) ) ( not ( = ?auto_2234628 ?auto_2234629 ) ) ( not ( = ?auto_2234628 ?auto_2234630 ) ) ( not ( = ?auto_2234628 ?auto_2234631 ) ) ( not ( = ?auto_2234628 ?auto_2234632 ) ) ( not ( = ?auto_2234628 ?auto_2234633 ) ) ( not ( = ?auto_2234628 ?auto_2234634 ) ) ( not ( = ?auto_2234628 ?auto_2234635 ) ) ( not ( = ?auto_2234628 ?auto_2234636 ) ) ( not ( = ?auto_2234628 ?auto_2234637 ) ) ( not ( = ?auto_2234628 ?auto_2234638 ) ) ( not ( = ?auto_2234628 ?auto_2234643 ) ) ( not ( = ?auto_2234629 ?auto_2234630 ) ) ( not ( = ?auto_2234629 ?auto_2234631 ) ) ( not ( = ?auto_2234629 ?auto_2234632 ) ) ( not ( = ?auto_2234629 ?auto_2234633 ) ) ( not ( = ?auto_2234629 ?auto_2234634 ) ) ( not ( = ?auto_2234629 ?auto_2234635 ) ) ( not ( = ?auto_2234629 ?auto_2234636 ) ) ( not ( = ?auto_2234629 ?auto_2234637 ) ) ( not ( = ?auto_2234629 ?auto_2234638 ) ) ( not ( = ?auto_2234629 ?auto_2234643 ) ) ( not ( = ?auto_2234630 ?auto_2234631 ) ) ( not ( = ?auto_2234630 ?auto_2234632 ) ) ( not ( = ?auto_2234630 ?auto_2234633 ) ) ( not ( = ?auto_2234630 ?auto_2234634 ) ) ( not ( = ?auto_2234630 ?auto_2234635 ) ) ( not ( = ?auto_2234630 ?auto_2234636 ) ) ( not ( = ?auto_2234630 ?auto_2234637 ) ) ( not ( = ?auto_2234630 ?auto_2234638 ) ) ( not ( = ?auto_2234630 ?auto_2234643 ) ) ( not ( = ?auto_2234631 ?auto_2234632 ) ) ( not ( = ?auto_2234631 ?auto_2234633 ) ) ( not ( = ?auto_2234631 ?auto_2234634 ) ) ( not ( = ?auto_2234631 ?auto_2234635 ) ) ( not ( = ?auto_2234631 ?auto_2234636 ) ) ( not ( = ?auto_2234631 ?auto_2234637 ) ) ( not ( = ?auto_2234631 ?auto_2234638 ) ) ( not ( = ?auto_2234631 ?auto_2234643 ) ) ( not ( = ?auto_2234632 ?auto_2234633 ) ) ( not ( = ?auto_2234632 ?auto_2234634 ) ) ( not ( = ?auto_2234632 ?auto_2234635 ) ) ( not ( = ?auto_2234632 ?auto_2234636 ) ) ( not ( = ?auto_2234632 ?auto_2234637 ) ) ( not ( = ?auto_2234632 ?auto_2234638 ) ) ( not ( = ?auto_2234632 ?auto_2234643 ) ) ( not ( = ?auto_2234633 ?auto_2234634 ) ) ( not ( = ?auto_2234633 ?auto_2234635 ) ) ( not ( = ?auto_2234633 ?auto_2234636 ) ) ( not ( = ?auto_2234633 ?auto_2234637 ) ) ( not ( = ?auto_2234633 ?auto_2234638 ) ) ( not ( = ?auto_2234633 ?auto_2234643 ) ) ( not ( = ?auto_2234634 ?auto_2234635 ) ) ( not ( = ?auto_2234634 ?auto_2234636 ) ) ( not ( = ?auto_2234634 ?auto_2234637 ) ) ( not ( = ?auto_2234634 ?auto_2234638 ) ) ( not ( = ?auto_2234634 ?auto_2234643 ) ) ( not ( = ?auto_2234635 ?auto_2234636 ) ) ( not ( = ?auto_2234635 ?auto_2234637 ) ) ( not ( = ?auto_2234635 ?auto_2234638 ) ) ( not ( = ?auto_2234635 ?auto_2234643 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2234636 ?auto_2234637 ?auto_2234638 )
      ( MAKE-16CRATE-VERIFY ?auto_2234622 ?auto_2234623 ?auto_2234624 ?auto_2234626 ?auto_2234625 ?auto_2234627 ?auto_2234628 ?auto_2234629 ?auto_2234630 ?auto_2234631 ?auto_2234632 ?auto_2234633 ?auto_2234634 ?auto_2234635 ?auto_2234636 ?auto_2234637 ?auto_2234638 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2234871 - SURFACE
      ?auto_2234872 - SURFACE
      ?auto_2234873 - SURFACE
      ?auto_2234875 - SURFACE
      ?auto_2234874 - SURFACE
      ?auto_2234876 - SURFACE
      ?auto_2234877 - SURFACE
      ?auto_2234878 - SURFACE
      ?auto_2234879 - SURFACE
      ?auto_2234880 - SURFACE
      ?auto_2234881 - SURFACE
      ?auto_2234882 - SURFACE
      ?auto_2234883 - SURFACE
      ?auto_2234884 - SURFACE
      ?auto_2234885 - SURFACE
      ?auto_2234886 - SURFACE
      ?auto_2234887 - SURFACE
    )
    :vars
    (
      ?auto_2234890 - HOIST
      ?auto_2234893 - PLACE
      ?auto_2234892 - PLACE
      ?auto_2234891 - HOIST
      ?auto_2234889 - SURFACE
      ?auto_2234888 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2234890 ?auto_2234893 ) ( IS-CRATE ?auto_2234887 ) ( not ( = ?auto_2234886 ?auto_2234887 ) ) ( not ( = ?auto_2234885 ?auto_2234886 ) ) ( not ( = ?auto_2234885 ?auto_2234887 ) ) ( not ( = ?auto_2234892 ?auto_2234893 ) ) ( HOIST-AT ?auto_2234891 ?auto_2234892 ) ( not ( = ?auto_2234890 ?auto_2234891 ) ) ( AVAILABLE ?auto_2234891 ) ( SURFACE-AT ?auto_2234887 ?auto_2234892 ) ( ON ?auto_2234887 ?auto_2234889 ) ( CLEAR ?auto_2234887 ) ( not ( = ?auto_2234886 ?auto_2234889 ) ) ( not ( = ?auto_2234887 ?auto_2234889 ) ) ( not ( = ?auto_2234885 ?auto_2234889 ) ) ( TRUCK-AT ?auto_2234888 ?auto_2234893 ) ( SURFACE-AT ?auto_2234885 ?auto_2234893 ) ( CLEAR ?auto_2234885 ) ( IS-CRATE ?auto_2234886 ) ( AVAILABLE ?auto_2234890 ) ( IN ?auto_2234886 ?auto_2234888 ) ( ON ?auto_2234872 ?auto_2234871 ) ( ON ?auto_2234873 ?auto_2234872 ) ( ON ?auto_2234875 ?auto_2234873 ) ( ON ?auto_2234874 ?auto_2234875 ) ( ON ?auto_2234876 ?auto_2234874 ) ( ON ?auto_2234877 ?auto_2234876 ) ( ON ?auto_2234878 ?auto_2234877 ) ( ON ?auto_2234879 ?auto_2234878 ) ( ON ?auto_2234880 ?auto_2234879 ) ( ON ?auto_2234881 ?auto_2234880 ) ( ON ?auto_2234882 ?auto_2234881 ) ( ON ?auto_2234883 ?auto_2234882 ) ( ON ?auto_2234884 ?auto_2234883 ) ( ON ?auto_2234885 ?auto_2234884 ) ( not ( = ?auto_2234871 ?auto_2234872 ) ) ( not ( = ?auto_2234871 ?auto_2234873 ) ) ( not ( = ?auto_2234871 ?auto_2234875 ) ) ( not ( = ?auto_2234871 ?auto_2234874 ) ) ( not ( = ?auto_2234871 ?auto_2234876 ) ) ( not ( = ?auto_2234871 ?auto_2234877 ) ) ( not ( = ?auto_2234871 ?auto_2234878 ) ) ( not ( = ?auto_2234871 ?auto_2234879 ) ) ( not ( = ?auto_2234871 ?auto_2234880 ) ) ( not ( = ?auto_2234871 ?auto_2234881 ) ) ( not ( = ?auto_2234871 ?auto_2234882 ) ) ( not ( = ?auto_2234871 ?auto_2234883 ) ) ( not ( = ?auto_2234871 ?auto_2234884 ) ) ( not ( = ?auto_2234871 ?auto_2234885 ) ) ( not ( = ?auto_2234871 ?auto_2234886 ) ) ( not ( = ?auto_2234871 ?auto_2234887 ) ) ( not ( = ?auto_2234871 ?auto_2234889 ) ) ( not ( = ?auto_2234872 ?auto_2234873 ) ) ( not ( = ?auto_2234872 ?auto_2234875 ) ) ( not ( = ?auto_2234872 ?auto_2234874 ) ) ( not ( = ?auto_2234872 ?auto_2234876 ) ) ( not ( = ?auto_2234872 ?auto_2234877 ) ) ( not ( = ?auto_2234872 ?auto_2234878 ) ) ( not ( = ?auto_2234872 ?auto_2234879 ) ) ( not ( = ?auto_2234872 ?auto_2234880 ) ) ( not ( = ?auto_2234872 ?auto_2234881 ) ) ( not ( = ?auto_2234872 ?auto_2234882 ) ) ( not ( = ?auto_2234872 ?auto_2234883 ) ) ( not ( = ?auto_2234872 ?auto_2234884 ) ) ( not ( = ?auto_2234872 ?auto_2234885 ) ) ( not ( = ?auto_2234872 ?auto_2234886 ) ) ( not ( = ?auto_2234872 ?auto_2234887 ) ) ( not ( = ?auto_2234872 ?auto_2234889 ) ) ( not ( = ?auto_2234873 ?auto_2234875 ) ) ( not ( = ?auto_2234873 ?auto_2234874 ) ) ( not ( = ?auto_2234873 ?auto_2234876 ) ) ( not ( = ?auto_2234873 ?auto_2234877 ) ) ( not ( = ?auto_2234873 ?auto_2234878 ) ) ( not ( = ?auto_2234873 ?auto_2234879 ) ) ( not ( = ?auto_2234873 ?auto_2234880 ) ) ( not ( = ?auto_2234873 ?auto_2234881 ) ) ( not ( = ?auto_2234873 ?auto_2234882 ) ) ( not ( = ?auto_2234873 ?auto_2234883 ) ) ( not ( = ?auto_2234873 ?auto_2234884 ) ) ( not ( = ?auto_2234873 ?auto_2234885 ) ) ( not ( = ?auto_2234873 ?auto_2234886 ) ) ( not ( = ?auto_2234873 ?auto_2234887 ) ) ( not ( = ?auto_2234873 ?auto_2234889 ) ) ( not ( = ?auto_2234875 ?auto_2234874 ) ) ( not ( = ?auto_2234875 ?auto_2234876 ) ) ( not ( = ?auto_2234875 ?auto_2234877 ) ) ( not ( = ?auto_2234875 ?auto_2234878 ) ) ( not ( = ?auto_2234875 ?auto_2234879 ) ) ( not ( = ?auto_2234875 ?auto_2234880 ) ) ( not ( = ?auto_2234875 ?auto_2234881 ) ) ( not ( = ?auto_2234875 ?auto_2234882 ) ) ( not ( = ?auto_2234875 ?auto_2234883 ) ) ( not ( = ?auto_2234875 ?auto_2234884 ) ) ( not ( = ?auto_2234875 ?auto_2234885 ) ) ( not ( = ?auto_2234875 ?auto_2234886 ) ) ( not ( = ?auto_2234875 ?auto_2234887 ) ) ( not ( = ?auto_2234875 ?auto_2234889 ) ) ( not ( = ?auto_2234874 ?auto_2234876 ) ) ( not ( = ?auto_2234874 ?auto_2234877 ) ) ( not ( = ?auto_2234874 ?auto_2234878 ) ) ( not ( = ?auto_2234874 ?auto_2234879 ) ) ( not ( = ?auto_2234874 ?auto_2234880 ) ) ( not ( = ?auto_2234874 ?auto_2234881 ) ) ( not ( = ?auto_2234874 ?auto_2234882 ) ) ( not ( = ?auto_2234874 ?auto_2234883 ) ) ( not ( = ?auto_2234874 ?auto_2234884 ) ) ( not ( = ?auto_2234874 ?auto_2234885 ) ) ( not ( = ?auto_2234874 ?auto_2234886 ) ) ( not ( = ?auto_2234874 ?auto_2234887 ) ) ( not ( = ?auto_2234874 ?auto_2234889 ) ) ( not ( = ?auto_2234876 ?auto_2234877 ) ) ( not ( = ?auto_2234876 ?auto_2234878 ) ) ( not ( = ?auto_2234876 ?auto_2234879 ) ) ( not ( = ?auto_2234876 ?auto_2234880 ) ) ( not ( = ?auto_2234876 ?auto_2234881 ) ) ( not ( = ?auto_2234876 ?auto_2234882 ) ) ( not ( = ?auto_2234876 ?auto_2234883 ) ) ( not ( = ?auto_2234876 ?auto_2234884 ) ) ( not ( = ?auto_2234876 ?auto_2234885 ) ) ( not ( = ?auto_2234876 ?auto_2234886 ) ) ( not ( = ?auto_2234876 ?auto_2234887 ) ) ( not ( = ?auto_2234876 ?auto_2234889 ) ) ( not ( = ?auto_2234877 ?auto_2234878 ) ) ( not ( = ?auto_2234877 ?auto_2234879 ) ) ( not ( = ?auto_2234877 ?auto_2234880 ) ) ( not ( = ?auto_2234877 ?auto_2234881 ) ) ( not ( = ?auto_2234877 ?auto_2234882 ) ) ( not ( = ?auto_2234877 ?auto_2234883 ) ) ( not ( = ?auto_2234877 ?auto_2234884 ) ) ( not ( = ?auto_2234877 ?auto_2234885 ) ) ( not ( = ?auto_2234877 ?auto_2234886 ) ) ( not ( = ?auto_2234877 ?auto_2234887 ) ) ( not ( = ?auto_2234877 ?auto_2234889 ) ) ( not ( = ?auto_2234878 ?auto_2234879 ) ) ( not ( = ?auto_2234878 ?auto_2234880 ) ) ( not ( = ?auto_2234878 ?auto_2234881 ) ) ( not ( = ?auto_2234878 ?auto_2234882 ) ) ( not ( = ?auto_2234878 ?auto_2234883 ) ) ( not ( = ?auto_2234878 ?auto_2234884 ) ) ( not ( = ?auto_2234878 ?auto_2234885 ) ) ( not ( = ?auto_2234878 ?auto_2234886 ) ) ( not ( = ?auto_2234878 ?auto_2234887 ) ) ( not ( = ?auto_2234878 ?auto_2234889 ) ) ( not ( = ?auto_2234879 ?auto_2234880 ) ) ( not ( = ?auto_2234879 ?auto_2234881 ) ) ( not ( = ?auto_2234879 ?auto_2234882 ) ) ( not ( = ?auto_2234879 ?auto_2234883 ) ) ( not ( = ?auto_2234879 ?auto_2234884 ) ) ( not ( = ?auto_2234879 ?auto_2234885 ) ) ( not ( = ?auto_2234879 ?auto_2234886 ) ) ( not ( = ?auto_2234879 ?auto_2234887 ) ) ( not ( = ?auto_2234879 ?auto_2234889 ) ) ( not ( = ?auto_2234880 ?auto_2234881 ) ) ( not ( = ?auto_2234880 ?auto_2234882 ) ) ( not ( = ?auto_2234880 ?auto_2234883 ) ) ( not ( = ?auto_2234880 ?auto_2234884 ) ) ( not ( = ?auto_2234880 ?auto_2234885 ) ) ( not ( = ?auto_2234880 ?auto_2234886 ) ) ( not ( = ?auto_2234880 ?auto_2234887 ) ) ( not ( = ?auto_2234880 ?auto_2234889 ) ) ( not ( = ?auto_2234881 ?auto_2234882 ) ) ( not ( = ?auto_2234881 ?auto_2234883 ) ) ( not ( = ?auto_2234881 ?auto_2234884 ) ) ( not ( = ?auto_2234881 ?auto_2234885 ) ) ( not ( = ?auto_2234881 ?auto_2234886 ) ) ( not ( = ?auto_2234881 ?auto_2234887 ) ) ( not ( = ?auto_2234881 ?auto_2234889 ) ) ( not ( = ?auto_2234882 ?auto_2234883 ) ) ( not ( = ?auto_2234882 ?auto_2234884 ) ) ( not ( = ?auto_2234882 ?auto_2234885 ) ) ( not ( = ?auto_2234882 ?auto_2234886 ) ) ( not ( = ?auto_2234882 ?auto_2234887 ) ) ( not ( = ?auto_2234882 ?auto_2234889 ) ) ( not ( = ?auto_2234883 ?auto_2234884 ) ) ( not ( = ?auto_2234883 ?auto_2234885 ) ) ( not ( = ?auto_2234883 ?auto_2234886 ) ) ( not ( = ?auto_2234883 ?auto_2234887 ) ) ( not ( = ?auto_2234883 ?auto_2234889 ) ) ( not ( = ?auto_2234884 ?auto_2234885 ) ) ( not ( = ?auto_2234884 ?auto_2234886 ) ) ( not ( = ?auto_2234884 ?auto_2234887 ) ) ( not ( = ?auto_2234884 ?auto_2234889 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2234885 ?auto_2234886 ?auto_2234887 )
      ( MAKE-16CRATE-VERIFY ?auto_2234871 ?auto_2234872 ?auto_2234873 ?auto_2234875 ?auto_2234874 ?auto_2234876 ?auto_2234877 ?auto_2234878 ?auto_2234879 ?auto_2234880 ?auto_2234881 ?auto_2234882 ?auto_2234883 ?auto_2234884 ?auto_2234885 ?auto_2234886 ?auto_2234887 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2235098 - SURFACE
      ?auto_2235099 - SURFACE
      ?auto_2235100 - SURFACE
      ?auto_2235102 - SURFACE
      ?auto_2235101 - SURFACE
      ?auto_2235103 - SURFACE
      ?auto_2235104 - SURFACE
      ?auto_2235105 - SURFACE
      ?auto_2235106 - SURFACE
      ?auto_2235107 - SURFACE
      ?auto_2235108 - SURFACE
      ?auto_2235109 - SURFACE
      ?auto_2235110 - SURFACE
      ?auto_2235111 - SURFACE
      ?auto_2235112 - SURFACE
      ?auto_2235113 - SURFACE
    )
    :vars
    (
      ?auto_2235119 - HOIST
      ?auto_2235115 - PLACE
      ?auto_2235114 - PLACE
      ?auto_2235116 - HOIST
      ?auto_2235117 - SURFACE
      ?auto_2235118 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2235119 ?auto_2235115 ) ( IS-CRATE ?auto_2235113 ) ( not ( = ?auto_2235112 ?auto_2235113 ) ) ( not ( = ?auto_2235111 ?auto_2235112 ) ) ( not ( = ?auto_2235111 ?auto_2235113 ) ) ( not ( = ?auto_2235114 ?auto_2235115 ) ) ( HOIST-AT ?auto_2235116 ?auto_2235114 ) ( not ( = ?auto_2235119 ?auto_2235116 ) ) ( AVAILABLE ?auto_2235116 ) ( SURFACE-AT ?auto_2235113 ?auto_2235114 ) ( ON ?auto_2235113 ?auto_2235117 ) ( CLEAR ?auto_2235113 ) ( not ( = ?auto_2235112 ?auto_2235117 ) ) ( not ( = ?auto_2235113 ?auto_2235117 ) ) ( not ( = ?auto_2235111 ?auto_2235117 ) ) ( SURFACE-AT ?auto_2235111 ?auto_2235115 ) ( CLEAR ?auto_2235111 ) ( IS-CRATE ?auto_2235112 ) ( AVAILABLE ?auto_2235119 ) ( IN ?auto_2235112 ?auto_2235118 ) ( TRUCK-AT ?auto_2235118 ?auto_2235114 ) ( ON ?auto_2235099 ?auto_2235098 ) ( ON ?auto_2235100 ?auto_2235099 ) ( ON ?auto_2235102 ?auto_2235100 ) ( ON ?auto_2235101 ?auto_2235102 ) ( ON ?auto_2235103 ?auto_2235101 ) ( ON ?auto_2235104 ?auto_2235103 ) ( ON ?auto_2235105 ?auto_2235104 ) ( ON ?auto_2235106 ?auto_2235105 ) ( ON ?auto_2235107 ?auto_2235106 ) ( ON ?auto_2235108 ?auto_2235107 ) ( ON ?auto_2235109 ?auto_2235108 ) ( ON ?auto_2235110 ?auto_2235109 ) ( ON ?auto_2235111 ?auto_2235110 ) ( not ( = ?auto_2235098 ?auto_2235099 ) ) ( not ( = ?auto_2235098 ?auto_2235100 ) ) ( not ( = ?auto_2235098 ?auto_2235102 ) ) ( not ( = ?auto_2235098 ?auto_2235101 ) ) ( not ( = ?auto_2235098 ?auto_2235103 ) ) ( not ( = ?auto_2235098 ?auto_2235104 ) ) ( not ( = ?auto_2235098 ?auto_2235105 ) ) ( not ( = ?auto_2235098 ?auto_2235106 ) ) ( not ( = ?auto_2235098 ?auto_2235107 ) ) ( not ( = ?auto_2235098 ?auto_2235108 ) ) ( not ( = ?auto_2235098 ?auto_2235109 ) ) ( not ( = ?auto_2235098 ?auto_2235110 ) ) ( not ( = ?auto_2235098 ?auto_2235111 ) ) ( not ( = ?auto_2235098 ?auto_2235112 ) ) ( not ( = ?auto_2235098 ?auto_2235113 ) ) ( not ( = ?auto_2235098 ?auto_2235117 ) ) ( not ( = ?auto_2235099 ?auto_2235100 ) ) ( not ( = ?auto_2235099 ?auto_2235102 ) ) ( not ( = ?auto_2235099 ?auto_2235101 ) ) ( not ( = ?auto_2235099 ?auto_2235103 ) ) ( not ( = ?auto_2235099 ?auto_2235104 ) ) ( not ( = ?auto_2235099 ?auto_2235105 ) ) ( not ( = ?auto_2235099 ?auto_2235106 ) ) ( not ( = ?auto_2235099 ?auto_2235107 ) ) ( not ( = ?auto_2235099 ?auto_2235108 ) ) ( not ( = ?auto_2235099 ?auto_2235109 ) ) ( not ( = ?auto_2235099 ?auto_2235110 ) ) ( not ( = ?auto_2235099 ?auto_2235111 ) ) ( not ( = ?auto_2235099 ?auto_2235112 ) ) ( not ( = ?auto_2235099 ?auto_2235113 ) ) ( not ( = ?auto_2235099 ?auto_2235117 ) ) ( not ( = ?auto_2235100 ?auto_2235102 ) ) ( not ( = ?auto_2235100 ?auto_2235101 ) ) ( not ( = ?auto_2235100 ?auto_2235103 ) ) ( not ( = ?auto_2235100 ?auto_2235104 ) ) ( not ( = ?auto_2235100 ?auto_2235105 ) ) ( not ( = ?auto_2235100 ?auto_2235106 ) ) ( not ( = ?auto_2235100 ?auto_2235107 ) ) ( not ( = ?auto_2235100 ?auto_2235108 ) ) ( not ( = ?auto_2235100 ?auto_2235109 ) ) ( not ( = ?auto_2235100 ?auto_2235110 ) ) ( not ( = ?auto_2235100 ?auto_2235111 ) ) ( not ( = ?auto_2235100 ?auto_2235112 ) ) ( not ( = ?auto_2235100 ?auto_2235113 ) ) ( not ( = ?auto_2235100 ?auto_2235117 ) ) ( not ( = ?auto_2235102 ?auto_2235101 ) ) ( not ( = ?auto_2235102 ?auto_2235103 ) ) ( not ( = ?auto_2235102 ?auto_2235104 ) ) ( not ( = ?auto_2235102 ?auto_2235105 ) ) ( not ( = ?auto_2235102 ?auto_2235106 ) ) ( not ( = ?auto_2235102 ?auto_2235107 ) ) ( not ( = ?auto_2235102 ?auto_2235108 ) ) ( not ( = ?auto_2235102 ?auto_2235109 ) ) ( not ( = ?auto_2235102 ?auto_2235110 ) ) ( not ( = ?auto_2235102 ?auto_2235111 ) ) ( not ( = ?auto_2235102 ?auto_2235112 ) ) ( not ( = ?auto_2235102 ?auto_2235113 ) ) ( not ( = ?auto_2235102 ?auto_2235117 ) ) ( not ( = ?auto_2235101 ?auto_2235103 ) ) ( not ( = ?auto_2235101 ?auto_2235104 ) ) ( not ( = ?auto_2235101 ?auto_2235105 ) ) ( not ( = ?auto_2235101 ?auto_2235106 ) ) ( not ( = ?auto_2235101 ?auto_2235107 ) ) ( not ( = ?auto_2235101 ?auto_2235108 ) ) ( not ( = ?auto_2235101 ?auto_2235109 ) ) ( not ( = ?auto_2235101 ?auto_2235110 ) ) ( not ( = ?auto_2235101 ?auto_2235111 ) ) ( not ( = ?auto_2235101 ?auto_2235112 ) ) ( not ( = ?auto_2235101 ?auto_2235113 ) ) ( not ( = ?auto_2235101 ?auto_2235117 ) ) ( not ( = ?auto_2235103 ?auto_2235104 ) ) ( not ( = ?auto_2235103 ?auto_2235105 ) ) ( not ( = ?auto_2235103 ?auto_2235106 ) ) ( not ( = ?auto_2235103 ?auto_2235107 ) ) ( not ( = ?auto_2235103 ?auto_2235108 ) ) ( not ( = ?auto_2235103 ?auto_2235109 ) ) ( not ( = ?auto_2235103 ?auto_2235110 ) ) ( not ( = ?auto_2235103 ?auto_2235111 ) ) ( not ( = ?auto_2235103 ?auto_2235112 ) ) ( not ( = ?auto_2235103 ?auto_2235113 ) ) ( not ( = ?auto_2235103 ?auto_2235117 ) ) ( not ( = ?auto_2235104 ?auto_2235105 ) ) ( not ( = ?auto_2235104 ?auto_2235106 ) ) ( not ( = ?auto_2235104 ?auto_2235107 ) ) ( not ( = ?auto_2235104 ?auto_2235108 ) ) ( not ( = ?auto_2235104 ?auto_2235109 ) ) ( not ( = ?auto_2235104 ?auto_2235110 ) ) ( not ( = ?auto_2235104 ?auto_2235111 ) ) ( not ( = ?auto_2235104 ?auto_2235112 ) ) ( not ( = ?auto_2235104 ?auto_2235113 ) ) ( not ( = ?auto_2235104 ?auto_2235117 ) ) ( not ( = ?auto_2235105 ?auto_2235106 ) ) ( not ( = ?auto_2235105 ?auto_2235107 ) ) ( not ( = ?auto_2235105 ?auto_2235108 ) ) ( not ( = ?auto_2235105 ?auto_2235109 ) ) ( not ( = ?auto_2235105 ?auto_2235110 ) ) ( not ( = ?auto_2235105 ?auto_2235111 ) ) ( not ( = ?auto_2235105 ?auto_2235112 ) ) ( not ( = ?auto_2235105 ?auto_2235113 ) ) ( not ( = ?auto_2235105 ?auto_2235117 ) ) ( not ( = ?auto_2235106 ?auto_2235107 ) ) ( not ( = ?auto_2235106 ?auto_2235108 ) ) ( not ( = ?auto_2235106 ?auto_2235109 ) ) ( not ( = ?auto_2235106 ?auto_2235110 ) ) ( not ( = ?auto_2235106 ?auto_2235111 ) ) ( not ( = ?auto_2235106 ?auto_2235112 ) ) ( not ( = ?auto_2235106 ?auto_2235113 ) ) ( not ( = ?auto_2235106 ?auto_2235117 ) ) ( not ( = ?auto_2235107 ?auto_2235108 ) ) ( not ( = ?auto_2235107 ?auto_2235109 ) ) ( not ( = ?auto_2235107 ?auto_2235110 ) ) ( not ( = ?auto_2235107 ?auto_2235111 ) ) ( not ( = ?auto_2235107 ?auto_2235112 ) ) ( not ( = ?auto_2235107 ?auto_2235113 ) ) ( not ( = ?auto_2235107 ?auto_2235117 ) ) ( not ( = ?auto_2235108 ?auto_2235109 ) ) ( not ( = ?auto_2235108 ?auto_2235110 ) ) ( not ( = ?auto_2235108 ?auto_2235111 ) ) ( not ( = ?auto_2235108 ?auto_2235112 ) ) ( not ( = ?auto_2235108 ?auto_2235113 ) ) ( not ( = ?auto_2235108 ?auto_2235117 ) ) ( not ( = ?auto_2235109 ?auto_2235110 ) ) ( not ( = ?auto_2235109 ?auto_2235111 ) ) ( not ( = ?auto_2235109 ?auto_2235112 ) ) ( not ( = ?auto_2235109 ?auto_2235113 ) ) ( not ( = ?auto_2235109 ?auto_2235117 ) ) ( not ( = ?auto_2235110 ?auto_2235111 ) ) ( not ( = ?auto_2235110 ?auto_2235112 ) ) ( not ( = ?auto_2235110 ?auto_2235113 ) ) ( not ( = ?auto_2235110 ?auto_2235117 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2235111 ?auto_2235112 ?auto_2235113 )
      ( MAKE-15CRATE-VERIFY ?auto_2235098 ?auto_2235099 ?auto_2235100 ?auto_2235102 ?auto_2235101 ?auto_2235103 ?auto_2235104 ?auto_2235105 ?auto_2235106 ?auto_2235107 ?auto_2235108 ?auto_2235109 ?auto_2235110 ?auto_2235111 ?auto_2235112 ?auto_2235113 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2235120 - SURFACE
      ?auto_2235121 - SURFACE
      ?auto_2235122 - SURFACE
      ?auto_2235124 - SURFACE
      ?auto_2235123 - SURFACE
      ?auto_2235125 - SURFACE
      ?auto_2235126 - SURFACE
      ?auto_2235127 - SURFACE
      ?auto_2235128 - SURFACE
      ?auto_2235129 - SURFACE
      ?auto_2235130 - SURFACE
      ?auto_2235131 - SURFACE
      ?auto_2235132 - SURFACE
      ?auto_2235133 - SURFACE
      ?auto_2235134 - SURFACE
      ?auto_2235135 - SURFACE
      ?auto_2235136 - SURFACE
    )
    :vars
    (
      ?auto_2235142 - HOIST
      ?auto_2235138 - PLACE
      ?auto_2235137 - PLACE
      ?auto_2235139 - HOIST
      ?auto_2235140 - SURFACE
      ?auto_2235141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2235142 ?auto_2235138 ) ( IS-CRATE ?auto_2235136 ) ( not ( = ?auto_2235135 ?auto_2235136 ) ) ( not ( = ?auto_2235134 ?auto_2235135 ) ) ( not ( = ?auto_2235134 ?auto_2235136 ) ) ( not ( = ?auto_2235137 ?auto_2235138 ) ) ( HOIST-AT ?auto_2235139 ?auto_2235137 ) ( not ( = ?auto_2235142 ?auto_2235139 ) ) ( AVAILABLE ?auto_2235139 ) ( SURFACE-AT ?auto_2235136 ?auto_2235137 ) ( ON ?auto_2235136 ?auto_2235140 ) ( CLEAR ?auto_2235136 ) ( not ( = ?auto_2235135 ?auto_2235140 ) ) ( not ( = ?auto_2235136 ?auto_2235140 ) ) ( not ( = ?auto_2235134 ?auto_2235140 ) ) ( SURFACE-AT ?auto_2235134 ?auto_2235138 ) ( CLEAR ?auto_2235134 ) ( IS-CRATE ?auto_2235135 ) ( AVAILABLE ?auto_2235142 ) ( IN ?auto_2235135 ?auto_2235141 ) ( TRUCK-AT ?auto_2235141 ?auto_2235137 ) ( ON ?auto_2235121 ?auto_2235120 ) ( ON ?auto_2235122 ?auto_2235121 ) ( ON ?auto_2235124 ?auto_2235122 ) ( ON ?auto_2235123 ?auto_2235124 ) ( ON ?auto_2235125 ?auto_2235123 ) ( ON ?auto_2235126 ?auto_2235125 ) ( ON ?auto_2235127 ?auto_2235126 ) ( ON ?auto_2235128 ?auto_2235127 ) ( ON ?auto_2235129 ?auto_2235128 ) ( ON ?auto_2235130 ?auto_2235129 ) ( ON ?auto_2235131 ?auto_2235130 ) ( ON ?auto_2235132 ?auto_2235131 ) ( ON ?auto_2235133 ?auto_2235132 ) ( ON ?auto_2235134 ?auto_2235133 ) ( not ( = ?auto_2235120 ?auto_2235121 ) ) ( not ( = ?auto_2235120 ?auto_2235122 ) ) ( not ( = ?auto_2235120 ?auto_2235124 ) ) ( not ( = ?auto_2235120 ?auto_2235123 ) ) ( not ( = ?auto_2235120 ?auto_2235125 ) ) ( not ( = ?auto_2235120 ?auto_2235126 ) ) ( not ( = ?auto_2235120 ?auto_2235127 ) ) ( not ( = ?auto_2235120 ?auto_2235128 ) ) ( not ( = ?auto_2235120 ?auto_2235129 ) ) ( not ( = ?auto_2235120 ?auto_2235130 ) ) ( not ( = ?auto_2235120 ?auto_2235131 ) ) ( not ( = ?auto_2235120 ?auto_2235132 ) ) ( not ( = ?auto_2235120 ?auto_2235133 ) ) ( not ( = ?auto_2235120 ?auto_2235134 ) ) ( not ( = ?auto_2235120 ?auto_2235135 ) ) ( not ( = ?auto_2235120 ?auto_2235136 ) ) ( not ( = ?auto_2235120 ?auto_2235140 ) ) ( not ( = ?auto_2235121 ?auto_2235122 ) ) ( not ( = ?auto_2235121 ?auto_2235124 ) ) ( not ( = ?auto_2235121 ?auto_2235123 ) ) ( not ( = ?auto_2235121 ?auto_2235125 ) ) ( not ( = ?auto_2235121 ?auto_2235126 ) ) ( not ( = ?auto_2235121 ?auto_2235127 ) ) ( not ( = ?auto_2235121 ?auto_2235128 ) ) ( not ( = ?auto_2235121 ?auto_2235129 ) ) ( not ( = ?auto_2235121 ?auto_2235130 ) ) ( not ( = ?auto_2235121 ?auto_2235131 ) ) ( not ( = ?auto_2235121 ?auto_2235132 ) ) ( not ( = ?auto_2235121 ?auto_2235133 ) ) ( not ( = ?auto_2235121 ?auto_2235134 ) ) ( not ( = ?auto_2235121 ?auto_2235135 ) ) ( not ( = ?auto_2235121 ?auto_2235136 ) ) ( not ( = ?auto_2235121 ?auto_2235140 ) ) ( not ( = ?auto_2235122 ?auto_2235124 ) ) ( not ( = ?auto_2235122 ?auto_2235123 ) ) ( not ( = ?auto_2235122 ?auto_2235125 ) ) ( not ( = ?auto_2235122 ?auto_2235126 ) ) ( not ( = ?auto_2235122 ?auto_2235127 ) ) ( not ( = ?auto_2235122 ?auto_2235128 ) ) ( not ( = ?auto_2235122 ?auto_2235129 ) ) ( not ( = ?auto_2235122 ?auto_2235130 ) ) ( not ( = ?auto_2235122 ?auto_2235131 ) ) ( not ( = ?auto_2235122 ?auto_2235132 ) ) ( not ( = ?auto_2235122 ?auto_2235133 ) ) ( not ( = ?auto_2235122 ?auto_2235134 ) ) ( not ( = ?auto_2235122 ?auto_2235135 ) ) ( not ( = ?auto_2235122 ?auto_2235136 ) ) ( not ( = ?auto_2235122 ?auto_2235140 ) ) ( not ( = ?auto_2235124 ?auto_2235123 ) ) ( not ( = ?auto_2235124 ?auto_2235125 ) ) ( not ( = ?auto_2235124 ?auto_2235126 ) ) ( not ( = ?auto_2235124 ?auto_2235127 ) ) ( not ( = ?auto_2235124 ?auto_2235128 ) ) ( not ( = ?auto_2235124 ?auto_2235129 ) ) ( not ( = ?auto_2235124 ?auto_2235130 ) ) ( not ( = ?auto_2235124 ?auto_2235131 ) ) ( not ( = ?auto_2235124 ?auto_2235132 ) ) ( not ( = ?auto_2235124 ?auto_2235133 ) ) ( not ( = ?auto_2235124 ?auto_2235134 ) ) ( not ( = ?auto_2235124 ?auto_2235135 ) ) ( not ( = ?auto_2235124 ?auto_2235136 ) ) ( not ( = ?auto_2235124 ?auto_2235140 ) ) ( not ( = ?auto_2235123 ?auto_2235125 ) ) ( not ( = ?auto_2235123 ?auto_2235126 ) ) ( not ( = ?auto_2235123 ?auto_2235127 ) ) ( not ( = ?auto_2235123 ?auto_2235128 ) ) ( not ( = ?auto_2235123 ?auto_2235129 ) ) ( not ( = ?auto_2235123 ?auto_2235130 ) ) ( not ( = ?auto_2235123 ?auto_2235131 ) ) ( not ( = ?auto_2235123 ?auto_2235132 ) ) ( not ( = ?auto_2235123 ?auto_2235133 ) ) ( not ( = ?auto_2235123 ?auto_2235134 ) ) ( not ( = ?auto_2235123 ?auto_2235135 ) ) ( not ( = ?auto_2235123 ?auto_2235136 ) ) ( not ( = ?auto_2235123 ?auto_2235140 ) ) ( not ( = ?auto_2235125 ?auto_2235126 ) ) ( not ( = ?auto_2235125 ?auto_2235127 ) ) ( not ( = ?auto_2235125 ?auto_2235128 ) ) ( not ( = ?auto_2235125 ?auto_2235129 ) ) ( not ( = ?auto_2235125 ?auto_2235130 ) ) ( not ( = ?auto_2235125 ?auto_2235131 ) ) ( not ( = ?auto_2235125 ?auto_2235132 ) ) ( not ( = ?auto_2235125 ?auto_2235133 ) ) ( not ( = ?auto_2235125 ?auto_2235134 ) ) ( not ( = ?auto_2235125 ?auto_2235135 ) ) ( not ( = ?auto_2235125 ?auto_2235136 ) ) ( not ( = ?auto_2235125 ?auto_2235140 ) ) ( not ( = ?auto_2235126 ?auto_2235127 ) ) ( not ( = ?auto_2235126 ?auto_2235128 ) ) ( not ( = ?auto_2235126 ?auto_2235129 ) ) ( not ( = ?auto_2235126 ?auto_2235130 ) ) ( not ( = ?auto_2235126 ?auto_2235131 ) ) ( not ( = ?auto_2235126 ?auto_2235132 ) ) ( not ( = ?auto_2235126 ?auto_2235133 ) ) ( not ( = ?auto_2235126 ?auto_2235134 ) ) ( not ( = ?auto_2235126 ?auto_2235135 ) ) ( not ( = ?auto_2235126 ?auto_2235136 ) ) ( not ( = ?auto_2235126 ?auto_2235140 ) ) ( not ( = ?auto_2235127 ?auto_2235128 ) ) ( not ( = ?auto_2235127 ?auto_2235129 ) ) ( not ( = ?auto_2235127 ?auto_2235130 ) ) ( not ( = ?auto_2235127 ?auto_2235131 ) ) ( not ( = ?auto_2235127 ?auto_2235132 ) ) ( not ( = ?auto_2235127 ?auto_2235133 ) ) ( not ( = ?auto_2235127 ?auto_2235134 ) ) ( not ( = ?auto_2235127 ?auto_2235135 ) ) ( not ( = ?auto_2235127 ?auto_2235136 ) ) ( not ( = ?auto_2235127 ?auto_2235140 ) ) ( not ( = ?auto_2235128 ?auto_2235129 ) ) ( not ( = ?auto_2235128 ?auto_2235130 ) ) ( not ( = ?auto_2235128 ?auto_2235131 ) ) ( not ( = ?auto_2235128 ?auto_2235132 ) ) ( not ( = ?auto_2235128 ?auto_2235133 ) ) ( not ( = ?auto_2235128 ?auto_2235134 ) ) ( not ( = ?auto_2235128 ?auto_2235135 ) ) ( not ( = ?auto_2235128 ?auto_2235136 ) ) ( not ( = ?auto_2235128 ?auto_2235140 ) ) ( not ( = ?auto_2235129 ?auto_2235130 ) ) ( not ( = ?auto_2235129 ?auto_2235131 ) ) ( not ( = ?auto_2235129 ?auto_2235132 ) ) ( not ( = ?auto_2235129 ?auto_2235133 ) ) ( not ( = ?auto_2235129 ?auto_2235134 ) ) ( not ( = ?auto_2235129 ?auto_2235135 ) ) ( not ( = ?auto_2235129 ?auto_2235136 ) ) ( not ( = ?auto_2235129 ?auto_2235140 ) ) ( not ( = ?auto_2235130 ?auto_2235131 ) ) ( not ( = ?auto_2235130 ?auto_2235132 ) ) ( not ( = ?auto_2235130 ?auto_2235133 ) ) ( not ( = ?auto_2235130 ?auto_2235134 ) ) ( not ( = ?auto_2235130 ?auto_2235135 ) ) ( not ( = ?auto_2235130 ?auto_2235136 ) ) ( not ( = ?auto_2235130 ?auto_2235140 ) ) ( not ( = ?auto_2235131 ?auto_2235132 ) ) ( not ( = ?auto_2235131 ?auto_2235133 ) ) ( not ( = ?auto_2235131 ?auto_2235134 ) ) ( not ( = ?auto_2235131 ?auto_2235135 ) ) ( not ( = ?auto_2235131 ?auto_2235136 ) ) ( not ( = ?auto_2235131 ?auto_2235140 ) ) ( not ( = ?auto_2235132 ?auto_2235133 ) ) ( not ( = ?auto_2235132 ?auto_2235134 ) ) ( not ( = ?auto_2235132 ?auto_2235135 ) ) ( not ( = ?auto_2235132 ?auto_2235136 ) ) ( not ( = ?auto_2235132 ?auto_2235140 ) ) ( not ( = ?auto_2235133 ?auto_2235134 ) ) ( not ( = ?auto_2235133 ?auto_2235135 ) ) ( not ( = ?auto_2235133 ?auto_2235136 ) ) ( not ( = ?auto_2235133 ?auto_2235140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2235134 ?auto_2235135 ?auto_2235136 )
      ( MAKE-16CRATE-VERIFY ?auto_2235120 ?auto_2235121 ?auto_2235122 ?auto_2235124 ?auto_2235123 ?auto_2235125 ?auto_2235126 ?auto_2235127 ?auto_2235128 ?auto_2235129 ?auto_2235130 ?auto_2235131 ?auto_2235132 ?auto_2235133 ?auto_2235134 ?auto_2235135 ?auto_2235136 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2235347 - SURFACE
      ?auto_2235348 - SURFACE
      ?auto_2235349 - SURFACE
      ?auto_2235351 - SURFACE
      ?auto_2235350 - SURFACE
      ?auto_2235352 - SURFACE
      ?auto_2235353 - SURFACE
      ?auto_2235354 - SURFACE
      ?auto_2235355 - SURFACE
      ?auto_2235356 - SURFACE
      ?auto_2235357 - SURFACE
      ?auto_2235358 - SURFACE
      ?auto_2235359 - SURFACE
      ?auto_2235360 - SURFACE
      ?auto_2235361 - SURFACE
      ?auto_2235362 - SURFACE
    )
    :vars
    (
      ?auto_2235368 - HOIST
      ?auto_2235365 - PLACE
      ?auto_2235366 - PLACE
      ?auto_2235367 - HOIST
      ?auto_2235364 - SURFACE
      ?auto_2235363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2235368 ?auto_2235365 ) ( IS-CRATE ?auto_2235362 ) ( not ( = ?auto_2235361 ?auto_2235362 ) ) ( not ( = ?auto_2235360 ?auto_2235361 ) ) ( not ( = ?auto_2235360 ?auto_2235362 ) ) ( not ( = ?auto_2235366 ?auto_2235365 ) ) ( HOIST-AT ?auto_2235367 ?auto_2235366 ) ( not ( = ?auto_2235368 ?auto_2235367 ) ) ( SURFACE-AT ?auto_2235362 ?auto_2235366 ) ( ON ?auto_2235362 ?auto_2235364 ) ( CLEAR ?auto_2235362 ) ( not ( = ?auto_2235361 ?auto_2235364 ) ) ( not ( = ?auto_2235362 ?auto_2235364 ) ) ( not ( = ?auto_2235360 ?auto_2235364 ) ) ( SURFACE-AT ?auto_2235360 ?auto_2235365 ) ( CLEAR ?auto_2235360 ) ( IS-CRATE ?auto_2235361 ) ( AVAILABLE ?auto_2235368 ) ( TRUCK-AT ?auto_2235363 ?auto_2235366 ) ( LIFTING ?auto_2235367 ?auto_2235361 ) ( ON ?auto_2235348 ?auto_2235347 ) ( ON ?auto_2235349 ?auto_2235348 ) ( ON ?auto_2235351 ?auto_2235349 ) ( ON ?auto_2235350 ?auto_2235351 ) ( ON ?auto_2235352 ?auto_2235350 ) ( ON ?auto_2235353 ?auto_2235352 ) ( ON ?auto_2235354 ?auto_2235353 ) ( ON ?auto_2235355 ?auto_2235354 ) ( ON ?auto_2235356 ?auto_2235355 ) ( ON ?auto_2235357 ?auto_2235356 ) ( ON ?auto_2235358 ?auto_2235357 ) ( ON ?auto_2235359 ?auto_2235358 ) ( ON ?auto_2235360 ?auto_2235359 ) ( not ( = ?auto_2235347 ?auto_2235348 ) ) ( not ( = ?auto_2235347 ?auto_2235349 ) ) ( not ( = ?auto_2235347 ?auto_2235351 ) ) ( not ( = ?auto_2235347 ?auto_2235350 ) ) ( not ( = ?auto_2235347 ?auto_2235352 ) ) ( not ( = ?auto_2235347 ?auto_2235353 ) ) ( not ( = ?auto_2235347 ?auto_2235354 ) ) ( not ( = ?auto_2235347 ?auto_2235355 ) ) ( not ( = ?auto_2235347 ?auto_2235356 ) ) ( not ( = ?auto_2235347 ?auto_2235357 ) ) ( not ( = ?auto_2235347 ?auto_2235358 ) ) ( not ( = ?auto_2235347 ?auto_2235359 ) ) ( not ( = ?auto_2235347 ?auto_2235360 ) ) ( not ( = ?auto_2235347 ?auto_2235361 ) ) ( not ( = ?auto_2235347 ?auto_2235362 ) ) ( not ( = ?auto_2235347 ?auto_2235364 ) ) ( not ( = ?auto_2235348 ?auto_2235349 ) ) ( not ( = ?auto_2235348 ?auto_2235351 ) ) ( not ( = ?auto_2235348 ?auto_2235350 ) ) ( not ( = ?auto_2235348 ?auto_2235352 ) ) ( not ( = ?auto_2235348 ?auto_2235353 ) ) ( not ( = ?auto_2235348 ?auto_2235354 ) ) ( not ( = ?auto_2235348 ?auto_2235355 ) ) ( not ( = ?auto_2235348 ?auto_2235356 ) ) ( not ( = ?auto_2235348 ?auto_2235357 ) ) ( not ( = ?auto_2235348 ?auto_2235358 ) ) ( not ( = ?auto_2235348 ?auto_2235359 ) ) ( not ( = ?auto_2235348 ?auto_2235360 ) ) ( not ( = ?auto_2235348 ?auto_2235361 ) ) ( not ( = ?auto_2235348 ?auto_2235362 ) ) ( not ( = ?auto_2235348 ?auto_2235364 ) ) ( not ( = ?auto_2235349 ?auto_2235351 ) ) ( not ( = ?auto_2235349 ?auto_2235350 ) ) ( not ( = ?auto_2235349 ?auto_2235352 ) ) ( not ( = ?auto_2235349 ?auto_2235353 ) ) ( not ( = ?auto_2235349 ?auto_2235354 ) ) ( not ( = ?auto_2235349 ?auto_2235355 ) ) ( not ( = ?auto_2235349 ?auto_2235356 ) ) ( not ( = ?auto_2235349 ?auto_2235357 ) ) ( not ( = ?auto_2235349 ?auto_2235358 ) ) ( not ( = ?auto_2235349 ?auto_2235359 ) ) ( not ( = ?auto_2235349 ?auto_2235360 ) ) ( not ( = ?auto_2235349 ?auto_2235361 ) ) ( not ( = ?auto_2235349 ?auto_2235362 ) ) ( not ( = ?auto_2235349 ?auto_2235364 ) ) ( not ( = ?auto_2235351 ?auto_2235350 ) ) ( not ( = ?auto_2235351 ?auto_2235352 ) ) ( not ( = ?auto_2235351 ?auto_2235353 ) ) ( not ( = ?auto_2235351 ?auto_2235354 ) ) ( not ( = ?auto_2235351 ?auto_2235355 ) ) ( not ( = ?auto_2235351 ?auto_2235356 ) ) ( not ( = ?auto_2235351 ?auto_2235357 ) ) ( not ( = ?auto_2235351 ?auto_2235358 ) ) ( not ( = ?auto_2235351 ?auto_2235359 ) ) ( not ( = ?auto_2235351 ?auto_2235360 ) ) ( not ( = ?auto_2235351 ?auto_2235361 ) ) ( not ( = ?auto_2235351 ?auto_2235362 ) ) ( not ( = ?auto_2235351 ?auto_2235364 ) ) ( not ( = ?auto_2235350 ?auto_2235352 ) ) ( not ( = ?auto_2235350 ?auto_2235353 ) ) ( not ( = ?auto_2235350 ?auto_2235354 ) ) ( not ( = ?auto_2235350 ?auto_2235355 ) ) ( not ( = ?auto_2235350 ?auto_2235356 ) ) ( not ( = ?auto_2235350 ?auto_2235357 ) ) ( not ( = ?auto_2235350 ?auto_2235358 ) ) ( not ( = ?auto_2235350 ?auto_2235359 ) ) ( not ( = ?auto_2235350 ?auto_2235360 ) ) ( not ( = ?auto_2235350 ?auto_2235361 ) ) ( not ( = ?auto_2235350 ?auto_2235362 ) ) ( not ( = ?auto_2235350 ?auto_2235364 ) ) ( not ( = ?auto_2235352 ?auto_2235353 ) ) ( not ( = ?auto_2235352 ?auto_2235354 ) ) ( not ( = ?auto_2235352 ?auto_2235355 ) ) ( not ( = ?auto_2235352 ?auto_2235356 ) ) ( not ( = ?auto_2235352 ?auto_2235357 ) ) ( not ( = ?auto_2235352 ?auto_2235358 ) ) ( not ( = ?auto_2235352 ?auto_2235359 ) ) ( not ( = ?auto_2235352 ?auto_2235360 ) ) ( not ( = ?auto_2235352 ?auto_2235361 ) ) ( not ( = ?auto_2235352 ?auto_2235362 ) ) ( not ( = ?auto_2235352 ?auto_2235364 ) ) ( not ( = ?auto_2235353 ?auto_2235354 ) ) ( not ( = ?auto_2235353 ?auto_2235355 ) ) ( not ( = ?auto_2235353 ?auto_2235356 ) ) ( not ( = ?auto_2235353 ?auto_2235357 ) ) ( not ( = ?auto_2235353 ?auto_2235358 ) ) ( not ( = ?auto_2235353 ?auto_2235359 ) ) ( not ( = ?auto_2235353 ?auto_2235360 ) ) ( not ( = ?auto_2235353 ?auto_2235361 ) ) ( not ( = ?auto_2235353 ?auto_2235362 ) ) ( not ( = ?auto_2235353 ?auto_2235364 ) ) ( not ( = ?auto_2235354 ?auto_2235355 ) ) ( not ( = ?auto_2235354 ?auto_2235356 ) ) ( not ( = ?auto_2235354 ?auto_2235357 ) ) ( not ( = ?auto_2235354 ?auto_2235358 ) ) ( not ( = ?auto_2235354 ?auto_2235359 ) ) ( not ( = ?auto_2235354 ?auto_2235360 ) ) ( not ( = ?auto_2235354 ?auto_2235361 ) ) ( not ( = ?auto_2235354 ?auto_2235362 ) ) ( not ( = ?auto_2235354 ?auto_2235364 ) ) ( not ( = ?auto_2235355 ?auto_2235356 ) ) ( not ( = ?auto_2235355 ?auto_2235357 ) ) ( not ( = ?auto_2235355 ?auto_2235358 ) ) ( not ( = ?auto_2235355 ?auto_2235359 ) ) ( not ( = ?auto_2235355 ?auto_2235360 ) ) ( not ( = ?auto_2235355 ?auto_2235361 ) ) ( not ( = ?auto_2235355 ?auto_2235362 ) ) ( not ( = ?auto_2235355 ?auto_2235364 ) ) ( not ( = ?auto_2235356 ?auto_2235357 ) ) ( not ( = ?auto_2235356 ?auto_2235358 ) ) ( not ( = ?auto_2235356 ?auto_2235359 ) ) ( not ( = ?auto_2235356 ?auto_2235360 ) ) ( not ( = ?auto_2235356 ?auto_2235361 ) ) ( not ( = ?auto_2235356 ?auto_2235362 ) ) ( not ( = ?auto_2235356 ?auto_2235364 ) ) ( not ( = ?auto_2235357 ?auto_2235358 ) ) ( not ( = ?auto_2235357 ?auto_2235359 ) ) ( not ( = ?auto_2235357 ?auto_2235360 ) ) ( not ( = ?auto_2235357 ?auto_2235361 ) ) ( not ( = ?auto_2235357 ?auto_2235362 ) ) ( not ( = ?auto_2235357 ?auto_2235364 ) ) ( not ( = ?auto_2235358 ?auto_2235359 ) ) ( not ( = ?auto_2235358 ?auto_2235360 ) ) ( not ( = ?auto_2235358 ?auto_2235361 ) ) ( not ( = ?auto_2235358 ?auto_2235362 ) ) ( not ( = ?auto_2235358 ?auto_2235364 ) ) ( not ( = ?auto_2235359 ?auto_2235360 ) ) ( not ( = ?auto_2235359 ?auto_2235361 ) ) ( not ( = ?auto_2235359 ?auto_2235362 ) ) ( not ( = ?auto_2235359 ?auto_2235364 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2235360 ?auto_2235361 ?auto_2235362 )
      ( MAKE-15CRATE-VERIFY ?auto_2235347 ?auto_2235348 ?auto_2235349 ?auto_2235351 ?auto_2235350 ?auto_2235352 ?auto_2235353 ?auto_2235354 ?auto_2235355 ?auto_2235356 ?auto_2235357 ?auto_2235358 ?auto_2235359 ?auto_2235360 ?auto_2235361 ?auto_2235362 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2235369 - SURFACE
      ?auto_2235370 - SURFACE
      ?auto_2235371 - SURFACE
      ?auto_2235373 - SURFACE
      ?auto_2235372 - SURFACE
      ?auto_2235374 - SURFACE
      ?auto_2235375 - SURFACE
      ?auto_2235376 - SURFACE
      ?auto_2235377 - SURFACE
      ?auto_2235378 - SURFACE
      ?auto_2235379 - SURFACE
      ?auto_2235380 - SURFACE
      ?auto_2235381 - SURFACE
      ?auto_2235382 - SURFACE
      ?auto_2235383 - SURFACE
      ?auto_2235384 - SURFACE
      ?auto_2235385 - SURFACE
    )
    :vars
    (
      ?auto_2235391 - HOIST
      ?auto_2235388 - PLACE
      ?auto_2235389 - PLACE
      ?auto_2235390 - HOIST
      ?auto_2235387 - SURFACE
      ?auto_2235386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2235391 ?auto_2235388 ) ( IS-CRATE ?auto_2235385 ) ( not ( = ?auto_2235384 ?auto_2235385 ) ) ( not ( = ?auto_2235383 ?auto_2235384 ) ) ( not ( = ?auto_2235383 ?auto_2235385 ) ) ( not ( = ?auto_2235389 ?auto_2235388 ) ) ( HOIST-AT ?auto_2235390 ?auto_2235389 ) ( not ( = ?auto_2235391 ?auto_2235390 ) ) ( SURFACE-AT ?auto_2235385 ?auto_2235389 ) ( ON ?auto_2235385 ?auto_2235387 ) ( CLEAR ?auto_2235385 ) ( not ( = ?auto_2235384 ?auto_2235387 ) ) ( not ( = ?auto_2235385 ?auto_2235387 ) ) ( not ( = ?auto_2235383 ?auto_2235387 ) ) ( SURFACE-AT ?auto_2235383 ?auto_2235388 ) ( CLEAR ?auto_2235383 ) ( IS-CRATE ?auto_2235384 ) ( AVAILABLE ?auto_2235391 ) ( TRUCK-AT ?auto_2235386 ?auto_2235389 ) ( LIFTING ?auto_2235390 ?auto_2235384 ) ( ON ?auto_2235370 ?auto_2235369 ) ( ON ?auto_2235371 ?auto_2235370 ) ( ON ?auto_2235373 ?auto_2235371 ) ( ON ?auto_2235372 ?auto_2235373 ) ( ON ?auto_2235374 ?auto_2235372 ) ( ON ?auto_2235375 ?auto_2235374 ) ( ON ?auto_2235376 ?auto_2235375 ) ( ON ?auto_2235377 ?auto_2235376 ) ( ON ?auto_2235378 ?auto_2235377 ) ( ON ?auto_2235379 ?auto_2235378 ) ( ON ?auto_2235380 ?auto_2235379 ) ( ON ?auto_2235381 ?auto_2235380 ) ( ON ?auto_2235382 ?auto_2235381 ) ( ON ?auto_2235383 ?auto_2235382 ) ( not ( = ?auto_2235369 ?auto_2235370 ) ) ( not ( = ?auto_2235369 ?auto_2235371 ) ) ( not ( = ?auto_2235369 ?auto_2235373 ) ) ( not ( = ?auto_2235369 ?auto_2235372 ) ) ( not ( = ?auto_2235369 ?auto_2235374 ) ) ( not ( = ?auto_2235369 ?auto_2235375 ) ) ( not ( = ?auto_2235369 ?auto_2235376 ) ) ( not ( = ?auto_2235369 ?auto_2235377 ) ) ( not ( = ?auto_2235369 ?auto_2235378 ) ) ( not ( = ?auto_2235369 ?auto_2235379 ) ) ( not ( = ?auto_2235369 ?auto_2235380 ) ) ( not ( = ?auto_2235369 ?auto_2235381 ) ) ( not ( = ?auto_2235369 ?auto_2235382 ) ) ( not ( = ?auto_2235369 ?auto_2235383 ) ) ( not ( = ?auto_2235369 ?auto_2235384 ) ) ( not ( = ?auto_2235369 ?auto_2235385 ) ) ( not ( = ?auto_2235369 ?auto_2235387 ) ) ( not ( = ?auto_2235370 ?auto_2235371 ) ) ( not ( = ?auto_2235370 ?auto_2235373 ) ) ( not ( = ?auto_2235370 ?auto_2235372 ) ) ( not ( = ?auto_2235370 ?auto_2235374 ) ) ( not ( = ?auto_2235370 ?auto_2235375 ) ) ( not ( = ?auto_2235370 ?auto_2235376 ) ) ( not ( = ?auto_2235370 ?auto_2235377 ) ) ( not ( = ?auto_2235370 ?auto_2235378 ) ) ( not ( = ?auto_2235370 ?auto_2235379 ) ) ( not ( = ?auto_2235370 ?auto_2235380 ) ) ( not ( = ?auto_2235370 ?auto_2235381 ) ) ( not ( = ?auto_2235370 ?auto_2235382 ) ) ( not ( = ?auto_2235370 ?auto_2235383 ) ) ( not ( = ?auto_2235370 ?auto_2235384 ) ) ( not ( = ?auto_2235370 ?auto_2235385 ) ) ( not ( = ?auto_2235370 ?auto_2235387 ) ) ( not ( = ?auto_2235371 ?auto_2235373 ) ) ( not ( = ?auto_2235371 ?auto_2235372 ) ) ( not ( = ?auto_2235371 ?auto_2235374 ) ) ( not ( = ?auto_2235371 ?auto_2235375 ) ) ( not ( = ?auto_2235371 ?auto_2235376 ) ) ( not ( = ?auto_2235371 ?auto_2235377 ) ) ( not ( = ?auto_2235371 ?auto_2235378 ) ) ( not ( = ?auto_2235371 ?auto_2235379 ) ) ( not ( = ?auto_2235371 ?auto_2235380 ) ) ( not ( = ?auto_2235371 ?auto_2235381 ) ) ( not ( = ?auto_2235371 ?auto_2235382 ) ) ( not ( = ?auto_2235371 ?auto_2235383 ) ) ( not ( = ?auto_2235371 ?auto_2235384 ) ) ( not ( = ?auto_2235371 ?auto_2235385 ) ) ( not ( = ?auto_2235371 ?auto_2235387 ) ) ( not ( = ?auto_2235373 ?auto_2235372 ) ) ( not ( = ?auto_2235373 ?auto_2235374 ) ) ( not ( = ?auto_2235373 ?auto_2235375 ) ) ( not ( = ?auto_2235373 ?auto_2235376 ) ) ( not ( = ?auto_2235373 ?auto_2235377 ) ) ( not ( = ?auto_2235373 ?auto_2235378 ) ) ( not ( = ?auto_2235373 ?auto_2235379 ) ) ( not ( = ?auto_2235373 ?auto_2235380 ) ) ( not ( = ?auto_2235373 ?auto_2235381 ) ) ( not ( = ?auto_2235373 ?auto_2235382 ) ) ( not ( = ?auto_2235373 ?auto_2235383 ) ) ( not ( = ?auto_2235373 ?auto_2235384 ) ) ( not ( = ?auto_2235373 ?auto_2235385 ) ) ( not ( = ?auto_2235373 ?auto_2235387 ) ) ( not ( = ?auto_2235372 ?auto_2235374 ) ) ( not ( = ?auto_2235372 ?auto_2235375 ) ) ( not ( = ?auto_2235372 ?auto_2235376 ) ) ( not ( = ?auto_2235372 ?auto_2235377 ) ) ( not ( = ?auto_2235372 ?auto_2235378 ) ) ( not ( = ?auto_2235372 ?auto_2235379 ) ) ( not ( = ?auto_2235372 ?auto_2235380 ) ) ( not ( = ?auto_2235372 ?auto_2235381 ) ) ( not ( = ?auto_2235372 ?auto_2235382 ) ) ( not ( = ?auto_2235372 ?auto_2235383 ) ) ( not ( = ?auto_2235372 ?auto_2235384 ) ) ( not ( = ?auto_2235372 ?auto_2235385 ) ) ( not ( = ?auto_2235372 ?auto_2235387 ) ) ( not ( = ?auto_2235374 ?auto_2235375 ) ) ( not ( = ?auto_2235374 ?auto_2235376 ) ) ( not ( = ?auto_2235374 ?auto_2235377 ) ) ( not ( = ?auto_2235374 ?auto_2235378 ) ) ( not ( = ?auto_2235374 ?auto_2235379 ) ) ( not ( = ?auto_2235374 ?auto_2235380 ) ) ( not ( = ?auto_2235374 ?auto_2235381 ) ) ( not ( = ?auto_2235374 ?auto_2235382 ) ) ( not ( = ?auto_2235374 ?auto_2235383 ) ) ( not ( = ?auto_2235374 ?auto_2235384 ) ) ( not ( = ?auto_2235374 ?auto_2235385 ) ) ( not ( = ?auto_2235374 ?auto_2235387 ) ) ( not ( = ?auto_2235375 ?auto_2235376 ) ) ( not ( = ?auto_2235375 ?auto_2235377 ) ) ( not ( = ?auto_2235375 ?auto_2235378 ) ) ( not ( = ?auto_2235375 ?auto_2235379 ) ) ( not ( = ?auto_2235375 ?auto_2235380 ) ) ( not ( = ?auto_2235375 ?auto_2235381 ) ) ( not ( = ?auto_2235375 ?auto_2235382 ) ) ( not ( = ?auto_2235375 ?auto_2235383 ) ) ( not ( = ?auto_2235375 ?auto_2235384 ) ) ( not ( = ?auto_2235375 ?auto_2235385 ) ) ( not ( = ?auto_2235375 ?auto_2235387 ) ) ( not ( = ?auto_2235376 ?auto_2235377 ) ) ( not ( = ?auto_2235376 ?auto_2235378 ) ) ( not ( = ?auto_2235376 ?auto_2235379 ) ) ( not ( = ?auto_2235376 ?auto_2235380 ) ) ( not ( = ?auto_2235376 ?auto_2235381 ) ) ( not ( = ?auto_2235376 ?auto_2235382 ) ) ( not ( = ?auto_2235376 ?auto_2235383 ) ) ( not ( = ?auto_2235376 ?auto_2235384 ) ) ( not ( = ?auto_2235376 ?auto_2235385 ) ) ( not ( = ?auto_2235376 ?auto_2235387 ) ) ( not ( = ?auto_2235377 ?auto_2235378 ) ) ( not ( = ?auto_2235377 ?auto_2235379 ) ) ( not ( = ?auto_2235377 ?auto_2235380 ) ) ( not ( = ?auto_2235377 ?auto_2235381 ) ) ( not ( = ?auto_2235377 ?auto_2235382 ) ) ( not ( = ?auto_2235377 ?auto_2235383 ) ) ( not ( = ?auto_2235377 ?auto_2235384 ) ) ( not ( = ?auto_2235377 ?auto_2235385 ) ) ( not ( = ?auto_2235377 ?auto_2235387 ) ) ( not ( = ?auto_2235378 ?auto_2235379 ) ) ( not ( = ?auto_2235378 ?auto_2235380 ) ) ( not ( = ?auto_2235378 ?auto_2235381 ) ) ( not ( = ?auto_2235378 ?auto_2235382 ) ) ( not ( = ?auto_2235378 ?auto_2235383 ) ) ( not ( = ?auto_2235378 ?auto_2235384 ) ) ( not ( = ?auto_2235378 ?auto_2235385 ) ) ( not ( = ?auto_2235378 ?auto_2235387 ) ) ( not ( = ?auto_2235379 ?auto_2235380 ) ) ( not ( = ?auto_2235379 ?auto_2235381 ) ) ( not ( = ?auto_2235379 ?auto_2235382 ) ) ( not ( = ?auto_2235379 ?auto_2235383 ) ) ( not ( = ?auto_2235379 ?auto_2235384 ) ) ( not ( = ?auto_2235379 ?auto_2235385 ) ) ( not ( = ?auto_2235379 ?auto_2235387 ) ) ( not ( = ?auto_2235380 ?auto_2235381 ) ) ( not ( = ?auto_2235380 ?auto_2235382 ) ) ( not ( = ?auto_2235380 ?auto_2235383 ) ) ( not ( = ?auto_2235380 ?auto_2235384 ) ) ( not ( = ?auto_2235380 ?auto_2235385 ) ) ( not ( = ?auto_2235380 ?auto_2235387 ) ) ( not ( = ?auto_2235381 ?auto_2235382 ) ) ( not ( = ?auto_2235381 ?auto_2235383 ) ) ( not ( = ?auto_2235381 ?auto_2235384 ) ) ( not ( = ?auto_2235381 ?auto_2235385 ) ) ( not ( = ?auto_2235381 ?auto_2235387 ) ) ( not ( = ?auto_2235382 ?auto_2235383 ) ) ( not ( = ?auto_2235382 ?auto_2235384 ) ) ( not ( = ?auto_2235382 ?auto_2235385 ) ) ( not ( = ?auto_2235382 ?auto_2235387 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2235383 ?auto_2235384 ?auto_2235385 )
      ( MAKE-16CRATE-VERIFY ?auto_2235369 ?auto_2235370 ?auto_2235371 ?auto_2235373 ?auto_2235372 ?auto_2235374 ?auto_2235375 ?auto_2235376 ?auto_2235377 ?auto_2235378 ?auto_2235379 ?auto_2235380 ?auto_2235381 ?auto_2235382 ?auto_2235383 ?auto_2235384 ?auto_2235385 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2235610 - SURFACE
      ?auto_2235611 - SURFACE
      ?auto_2235612 - SURFACE
      ?auto_2235614 - SURFACE
      ?auto_2235613 - SURFACE
      ?auto_2235615 - SURFACE
      ?auto_2235616 - SURFACE
      ?auto_2235617 - SURFACE
      ?auto_2235618 - SURFACE
      ?auto_2235619 - SURFACE
      ?auto_2235620 - SURFACE
      ?auto_2235621 - SURFACE
      ?auto_2235622 - SURFACE
      ?auto_2235623 - SURFACE
      ?auto_2235624 - SURFACE
      ?auto_2235625 - SURFACE
    )
    :vars
    (
      ?auto_2235629 - HOIST
      ?auto_2235632 - PLACE
      ?auto_2235631 - PLACE
      ?auto_2235628 - HOIST
      ?auto_2235626 - SURFACE
      ?auto_2235630 - TRUCK
      ?auto_2235627 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2235629 ?auto_2235632 ) ( IS-CRATE ?auto_2235625 ) ( not ( = ?auto_2235624 ?auto_2235625 ) ) ( not ( = ?auto_2235623 ?auto_2235624 ) ) ( not ( = ?auto_2235623 ?auto_2235625 ) ) ( not ( = ?auto_2235631 ?auto_2235632 ) ) ( HOIST-AT ?auto_2235628 ?auto_2235631 ) ( not ( = ?auto_2235629 ?auto_2235628 ) ) ( SURFACE-AT ?auto_2235625 ?auto_2235631 ) ( ON ?auto_2235625 ?auto_2235626 ) ( CLEAR ?auto_2235625 ) ( not ( = ?auto_2235624 ?auto_2235626 ) ) ( not ( = ?auto_2235625 ?auto_2235626 ) ) ( not ( = ?auto_2235623 ?auto_2235626 ) ) ( SURFACE-AT ?auto_2235623 ?auto_2235632 ) ( CLEAR ?auto_2235623 ) ( IS-CRATE ?auto_2235624 ) ( AVAILABLE ?auto_2235629 ) ( TRUCK-AT ?auto_2235630 ?auto_2235631 ) ( AVAILABLE ?auto_2235628 ) ( SURFACE-AT ?auto_2235624 ?auto_2235631 ) ( ON ?auto_2235624 ?auto_2235627 ) ( CLEAR ?auto_2235624 ) ( not ( = ?auto_2235624 ?auto_2235627 ) ) ( not ( = ?auto_2235625 ?auto_2235627 ) ) ( not ( = ?auto_2235623 ?auto_2235627 ) ) ( not ( = ?auto_2235626 ?auto_2235627 ) ) ( ON ?auto_2235611 ?auto_2235610 ) ( ON ?auto_2235612 ?auto_2235611 ) ( ON ?auto_2235614 ?auto_2235612 ) ( ON ?auto_2235613 ?auto_2235614 ) ( ON ?auto_2235615 ?auto_2235613 ) ( ON ?auto_2235616 ?auto_2235615 ) ( ON ?auto_2235617 ?auto_2235616 ) ( ON ?auto_2235618 ?auto_2235617 ) ( ON ?auto_2235619 ?auto_2235618 ) ( ON ?auto_2235620 ?auto_2235619 ) ( ON ?auto_2235621 ?auto_2235620 ) ( ON ?auto_2235622 ?auto_2235621 ) ( ON ?auto_2235623 ?auto_2235622 ) ( not ( = ?auto_2235610 ?auto_2235611 ) ) ( not ( = ?auto_2235610 ?auto_2235612 ) ) ( not ( = ?auto_2235610 ?auto_2235614 ) ) ( not ( = ?auto_2235610 ?auto_2235613 ) ) ( not ( = ?auto_2235610 ?auto_2235615 ) ) ( not ( = ?auto_2235610 ?auto_2235616 ) ) ( not ( = ?auto_2235610 ?auto_2235617 ) ) ( not ( = ?auto_2235610 ?auto_2235618 ) ) ( not ( = ?auto_2235610 ?auto_2235619 ) ) ( not ( = ?auto_2235610 ?auto_2235620 ) ) ( not ( = ?auto_2235610 ?auto_2235621 ) ) ( not ( = ?auto_2235610 ?auto_2235622 ) ) ( not ( = ?auto_2235610 ?auto_2235623 ) ) ( not ( = ?auto_2235610 ?auto_2235624 ) ) ( not ( = ?auto_2235610 ?auto_2235625 ) ) ( not ( = ?auto_2235610 ?auto_2235626 ) ) ( not ( = ?auto_2235610 ?auto_2235627 ) ) ( not ( = ?auto_2235611 ?auto_2235612 ) ) ( not ( = ?auto_2235611 ?auto_2235614 ) ) ( not ( = ?auto_2235611 ?auto_2235613 ) ) ( not ( = ?auto_2235611 ?auto_2235615 ) ) ( not ( = ?auto_2235611 ?auto_2235616 ) ) ( not ( = ?auto_2235611 ?auto_2235617 ) ) ( not ( = ?auto_2235611 ?auto_2235618 ) ) ( not ( = ?auto_2235611 ?auto_2235619 ) ) ( not ( = ?auto_2235611 ?auto_2235620 ) ) ( not ( = ?auto_2235611 ?auto_2235621 ) ) ( not ( = ?auto_2235611 ?auto_2235622 ) ) ( not ( = ?auto_2235611 ?auto_2235623 ) ) ( not ( = ?auto_2235611 ?auto_2235624 ) ) ( not ( = ?auto_2235611 ?auto_2235625 ) ) ( not ( = ?auto_2235611 ?auto_2235626 ) ) ( not ( = ?auto_2235611 ?auto_2235627 ) ) ( not ( = ?auto_2235612 ?auto_2235614 ) ) ( not ( = ?auto_2235612 ?auto_2235613 ) ) ( not ( = ?auto_2235612 ?auto_2235615 ) ) ( not ( = ?auto_2235612 ?auto_2235616 ) ) ( not ( = ?auto_2235612 ?auto_2235617 ) ) ( not ( = ?auto_2235612 ?auto_2235618 ) ) ( not ( = ?auto_2235612 ?auto_2235619 ) ) ( not ( = ?auto_2235612 ?auto_2235620 ) ) ( not ( = ?auto_2235612 ?auto_2235621 ) ) ( not ( = ?auto_2235612 ?auto_2235622 ) ) ( not ( = ?auto_2235612 ?auto_2235623 ) ) ( not ( = ?auto_2235612 ?auto_2235624 ) ) ( not ( = ?auto_2235612 ?auto_2235625 ) ) ( not ( = ?auto_2235612 ?auto_2235626 ) ) ( not ( = ?auto_2235612 ?auto_2235627 ) ) ( not ( = ?auto_2235614 ?auto_2235613 ) ) ( not ( = ?auto_2235614 ?auto_2235615 ) ) ( not ( = ?auto_2235614 ?auto_2235616 ) ) ( not ( = ?auto_2235614 ?auto_2235617 ) ) ( not ( = ?auto_2235614 ?auto_2235618 ) ) ( not ( = ?auto_2235614 ?auto_2235619 ) ) ( not ( = ?auto_2235614 ?auto_2235620 ) ) ( not ( = ?auto_2235614 ?auto_2235621 ) ) ( not ( = ?auto_2235614 ?auto_2235622 ) ) ( not ( = ?auto_2235614 ?auto_2235623 ) ) ( not ( = ?auto_2235614 ?auto_2235624 ) ) ( not ( = ?auto_2235614 ?auto_2235625 ) ) ( not ( = ?auto_2235614 ?auto_2235626 ) ) ( not ( = ?auto_2235614 ?auto_2235627 ) ) ( not ( = ?auto_2235613 ?auto_2235615 ) ) ( not ( = ?auto_2235613 ?auto_2235616 ) ) ( not ( = ?auto_2235613 ?auto_2235617 ) ) ( not ( = ?auto_2235613 ?auto_2235618 ) ) ( not ( = ?auto_2235613 ?auto_2235619 ) ) ( not ( = ?auto_2235613 ?auto_2235620 ) ) ( not ( = ?auto_2235613 ?auto_2235621 ) ) ( not ( = ?auto_2235613 ?auto_2235622 ) ) ( not ( = ?auto_2235613 ?auto_2235623 ) ) ( not ( = ?auto_2235613 ?auto_2235624 ) ) ( not ( = ?auto_2235613 ?auto_2235625 ) ) ( not ( = ?auto_2235613 ?auto_2235626 ) ) ( not ( = ?auto_2235613 ?auto_2235627 ) ) ( not ( = ?auto_2235615 ?auto_2235616 ) ) ( not ( = ?auto_2235615 ?auto_2235617 ) ) ( not ( = ?auto_2235615 ?auto_2235618 ) ) ( not ( = ?auto_2235615 ?auto_2235619 ) ) ( not ( = ?auto_2235615 ?auto_2235620 ) ) ( not ( = ?auto_2235615 ?auto_2235621 ) ) ( not ( = ?auto_2235615 ?auto_2235622 ) ) ( not ( = ?auto_2235615 ?auto_2235623 ) ) ( not ( = ?auto_2235615 ?auto_2235624 ) ) ( not ( = ?auto_2235615 ?auto_2235625 ) ) ( not ( = ?auto_2235615 ?auto_2235626 ) ) ( not ( = ?auto_2235615 ?auto_2235627 ) ) ( not ( = ?auto_2235616 ?auto_2235617 ) ) ( not ( = ?auto_2235616 ?auto_2235618 ) ) ( not ( = ?auto_2235616 ?auto_2235619 ) ) ( not ( = ?auto_2235616 ?auto_2235620 ) ) ( not ( = ?auto_2235616 ?auto_2235621 ) ) ( not ( = ?auto_2235616 ?auto_2235622 ) ) ( not ( = ?auto_2235616 ?auto_2235623 ) ) ( not ( = ?auto_2235616 ?auto_2235624 ) ) ( not ( = ?auto_2235616 ?auto_2235625 ) ) ( not ( = ?auto_2235616 ?auto_2235626 ) ) ( not ( = ?auto_2235616 ?auto_2235627 ) ) ( not ( = ?auto_2235617 ?auto_2235618 ) ) ( not ( = ?auto_2235617 ?auto_2235619 ) ) ( not ( = ?auto_2235617 ?auto_2235620 ) ) ( not ( = ?auto_2235617 ?auto_2235621 ) ) ( not ( = ?auto_2235617 ?auto_2235622 ) ) ( not ( = ?auto_2235617 ?auto_2235623 ) ) ( not ( = ?auto_2235617 ?auto_2235624 ) ) ( not ( = ?auto_2235617 ?auto_2235625 ) ) ( not ( = ?auto_2235617 ?auto_2235626 ) ) ( not ( = ?auto_2235617 ?auto_2235627 ) ) ( not ( = ?auto_2235618 ?auto_2235619 ) ) ( not ( = ?auto_2235618 ?auto_2235620 ) ) ( not ( = ?auto_2235618 ?auto_2235621 ) ) ( not ( = ?auto_2235618 ?auto_2235622 ) ) ( not ( = ?auto_2235618 ?auto_2235623 ) ) ( not ( = ?auto_2235618 ?auto_2235624 ) ) ( not ( = ?auto_2235618 ?auto_2235625 ) ) ( not ( = ?auto_2235618 ?auto_2235626 ) ) ( not ( = ?auto_2235618 ?auto_2235627 ) ) ( not ( = ?auto_2235619 ?auto_2235620 ) ) ( not ( = ?auto_2235619 ?auto_2235621 ) ) ( not ( = ?auto_2235619 ?auto_2235622 ) ) ( not ( = ?auto_2235619 ?auto_2235623 ) ) ( not ( = ?auto_2235619 ?auto_2235624 ) ) ( not ( = ?auto_2235619 ?auto_2235625 ) ) ( not ( = ?auto_2235619 ?auto_2235626 ) ) ( not ( = ?auto_2235619 ?auto_2235627 ) ) ( not ( = ?auto_2235620 ?auto_2235621 ) ) ( not ( = ?auto_2235620 ?auto_2235622 ) ) ( not ( = ?auto_2235620 ?auto_2235623 ) ) ( not ( = ?auto_2235620 ?auto_2235624 ) ) ( not ( = ?auto_2235620 ?auto_2235625 ) ) ( not ( = ?auto_2235620 ?auto_2235626 ) ) ( not ( = ?auto_2235620 ?auto_2235627 ) ) ( not ( = ?auto_2235621 ?auto_2235622 ) ) ( not ( = ?auto_2235621 ?auto_2235623 ) ) ( not ( = ?auto_2235621 ?auto_2235624 ) ) ( not ( = ?auto_2235621 ?auto_2235625 ) ) ( not ( = ?auto_2235621 ?auto_2235626 ) ) ( not ( = ?auto_2235621 ?auto_2235627 ) ) ( not ( = ?auto_2235622 ?auto_2235623 ) ) ( not ( = ?auto_2235622 ?auto_2235624 ) ) ( not ( = ?auto_2235622 ?auto_2235625 ) ) ( not ( = ?auto_2235622 ?auto_2235626 ) ) ( not ( = ?auto_2235622 ?auto_2235627 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2235623 ?auto_2235624 ?auto_2235625 )
      ( MAKE-15CRATE-VERIFY ?auto_2235610 ?auto_2235611 ?auto_2235612 ?auto_2235614 ?auto_2235613 ?auto_2235615 ?auto_2235616 ?auto_2235617 ?auto_2235618 ?auto_2235619 ?auto_2235620 ?auto_2235621 ?auto_2235622 ?auto_2235623 ?auto_2235624 ?auto_2235625 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2235633 - SURFACE
      ?auto_2235634 - SURFACE
      ?auto_2235635 - SURFACE
      ?auto_2235637 - SURFACE
      ?auto_2235636 - SURFACE
      ?auto_2235638 - SURFACE
      ?auto_2235639 - SURFACE
      ?auto_2235640 - SURFACE
      ?auto_2235641 - SURFACE
      ?auto_2235642 - SURFACE
      ?auto_2235643 - SURFACE
      ?auto_2235644 - SURFACE
      ?auto_2235645 - SURFACE
      ?auto_2235646 - SURFACE
      ?auto_2235647 - SURFACE
      ?auto_2235648 - SURFACE
      ?auto_2235649 - SURFACE
    )
    :vars
    (
      ?auto_2235653 - HOIST
      ?auto_2235656 - PLACE
      ?auto_2235655 - PLACE
      ?auto_2235652 - HOIST
      ?auto_2235650 - SURFACE
      ?auto_2235654 - TRUCK
      ?auto_2235651 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2235653 ?auto_2235656 ) ( IS-CRATE ?auto_2235649 ) ( not ( = ?auto_2235648 ?auto_2235649 ) ) ( not ( = ?auto_2235647 ?auto_2235648 ) ) ( not ( = ?auto_2235647 ?auto_2235649 ) ) ( not ( = ?auto_2235655 ?auto_2235656 ) ) ( HOIST-AT ?auto_2235652 ?auto_2235655 ) ( not ( = ?auto_2235653 ?auto_2235652 ) ) ( SURFACE-AT ?auto_2235649 ?auto_2235655 ) ( ON ?auto_2235649 ?auto_2235650 ) ( CLEAR ?auto_2235649 ) ( not ( = ?auto_2235648 ?auto_2235650 ) ) ( not ( = ?auto_2235649 ?auto_2235650 ) ) ( not ( = ?auto_2235647 ?auto_2235650 ) ) ( SURFACE-AT ?auto_2235647 ?auto_2235656 ) ( CLEAR ?auto_2235647 ) ( IS-CRATE ?auto_2235648 ) ( AVAILABLE ?auto_2235653 ) ( TRUCK-AT ?auto_2235654 ?auto_2235655 ) ( AVAILABLE ?auto_2235652 ) ( SURFACE-AT ?auto_2235648 ?auto_2235655 ) ( ON ?auto_2235648 ?auto_2235651 ) ( CLEAR ?auto_2235648 ) ( not ( = ?auto_2235648 ?auto_2235651 ) ) ( not ( = ?auto_2235649 ?auto_2235651 ) ) ( not ( = ?auto_2235647 ?auto_2235651 ) ) ( not ( = ?auto_2235650 ?auto_2235651 ) ) ( ON ?auto_2235634 ?auto_2235633 ) ( ON ?auto_2235635 ?auto_2235634 ) ( ON ?auto_2235637 ?auto_2235635 ) ( ON ?auto_2235636 ?auto_2235637 ) ( ON ?auto_2235638 ?auto_2235636 ) ( ON ?auto_2235639 ?auto_2235638 ) ( ON ?auto_2235640 ?auto_2235639 ) ( ON ?auto_2235641 ?auto_2235640 ) ( ON ?auto_2235642 ?auto_2235641 ) ( ON ?auto_2235643 ?auto_2235642 ) ( ON ?auto_2235644 ?auto_2235643 ) ( ON ?auto_2235645 ?auto_2235644 ) ( ON ?auto_2235646 ?auto_2235645 ) ( ON ?auto_2235647 ?auto_2235646 ) ( not ( = ?auto_2235633 ?auto_2235634 ) ) ( not ( = ?auto_2235633 ?auto_2235635 ) ) ( not ( = ?auto_2235633 ?auto_2235637 ) ) ( not ( = ?auto_2235633 ?auto_2235636 ) ) ( not ( = ?auto_2235633 ?auto_2235638 ) ) ( not ( = ?auto_2235633 ?auto_2235639 ) ) ( not ( = ?auto_2235633 ?auto_2235640 ) ) ( not ( = ?auto_2235633 ?auto_2235641 ) ) ( not ( = ?auto_2235633 ?auto_2235642 ) ) ( not ( = ?auto_2235633 ?auto_2235643 ) ) ( not ( = ?auto_2235633 ?auto_2235644 ) ) ( not ( = ?auto_2235633 ?auto_2235645 ) ) ( not ( = ?auto_2235633 ?auto_2235646 ) ) ( not ( = ?auto_2235633 ?auto_2235647 ) ) ( not ( = ?auto_2235633 ?auto_2235648 ) ) ( not ( = ?auto_2235633 ?auto_2235649 ) ) ( not ( = ?auto_2235633 ?auto_2235650 ) ) ( not ( = ?auto_2235633 ?auto_2235651 ) ) ( not ( = ?auto_2235634 ?auto_2235635 ) ) ( not ( = ?auto_2235634 ?auto_2235637 ) ) ( not ( = ?auto_2235634 ?auto_2235636 ) ) ( not ( = ?auto_2235634 ?auto_2235638 ) ) ( not ( = ?auto_2235634 ?auto_2235639 ) ) ( not ( = ?auto_2235634 ?auto_2235640 ) ) ( not ( = ?auto_2235634 ?auto_2235641 ) ) ( not ( = ?auto_2235634 ?auto_2235642 ) ) ( not ( = ?auto_2235634 ?auto_2235643 ) ) ( not ( = ?auto_2235634 ?auto_2235644 ) ) ( not ( = ?auto_2235634 ?auto_2235645 ) ) ( not ( = ?auto_2235634 ?auto_2235646 ) ) ( not ( = ?auto_2235634 ?auto_2235647 ) ) ( not ( = ?auto_2235634 ?auto_2235648 ) ) ( not ( = ?auto_2235634 ?auto_2235649 ) ) ( not ( = ?auto_2235634 ?auto_2235650 ) ) ( not ( = ?auto_2235634 ?auto_2235651 ) ) ( not ( = ?auto_2235635 ?auto_2235637 ) ) ( not ( = ?auto_2235635 ?auto_2235636 ) ) ( not ( = ?auto_2235635 ?auto_2235638 ) ) ( not ( = ?auto_2235635 ?auto_2235639 ) ) ( not ( = ?auto_2235635 ?auto_2235640 ) ) ( not ( = ?auto_2235635 ?auto_2235641 ) ) ( not ( = ?auto_2235635 ?auto_2235642 ) ) ( not ( = ?auto_2235635 ?auto_2235643 ) ) ( not ( = ?auto_2235635 ?auto_2235644 ) ) ( not ( = ?auto_2235635 ?auto_2235645 ) ) ( not ( = ?auto_2235635 ?auto_2235646 ) ) ( not ( = ?auto_2235635 ?auto_2235647 ) ) ( not ( = ?auto_2235635 ?auto_2235648 ) ) ( not ( = ?auto_2235635 ?auto_2235649 ) ) ( not ( = ?auto_2235635 ?auto_2235650 ) ) ( not ( = ?auto_2235635 ?auto_2235651 ) ) ( not ( = ?auto_2235637 ?auto_2235636 ) ) ( not ( = ?auto_2235637 ?auto_2235638 ) ) ( not ( = ?auto_2235637 ?auto_2235639 ) ) ( not ( = ?auto_2235637 ?auto_2235640 ) ) ( not ( = ?auto_2235637 ?auto_2235641 ) ) ( not ( = ?auto_2235637 ?auto_2235642 ) ) ( not ( = ?auto_2235637 ?auto_2235643 ) ) ( not ( = ?auto_2235637 ?auto_2235644 ) ) ( not ( = ?auto_2235637 ?auto_2235645 ) ) ( not ( = ?auto_2235637 ?auto_2235646 ) ) ( not ( = ?auto_2235637 ?auto_2235647 ) ) ( not ( = ?auto_2235637 ?auto_2235648 ) ) ( not ( = ?auto_2235637 ?auto_2235649 ) ) ( not ( = ?auto_2235637 ?auto_2235650 ) ) ( not ( = ?auto_2235637 ?auto_2235651 ) ) ( not ( = ?auto_2235636 ?auto_2235638 ) ) ( not ( = ?auto_2235636 ?auto_2235639 ) ) ( not ( = ?auto_2235636 ?auto_2235640 ) ) ( not ( = ?auto_2235636 ?auto_2235641 ) ) ( not ( = ?auto_2235636 ?auto_2235642 ) ) ( not ( = ?auto_2235636 ?auto_2235643 ) ) ( not ( = ?auto_2235636 ?auto_2235644 ) ) ( not ( = ?auto_2235636 ?auto_2235645 ) ) ( not ( = ?auto_2235636 ?auto_2235646 ) ) ( not ( = ?auto_2235636 ?auto_2235647 ) ) ( not ( = ?auto_2235636 ?auto_2235648 ) ) ( not ( = ?auto_2235636 ?auto_2235649 ) ) ( not ( = ?auto_2235636 ?auto_2235650 ) ) ( not ( = ?auto_2235636 ?auto_2235651 ) ) ( not ( = ?auto_2235638 ?auto_2235639 ) ) ( not ( = ?auto_2235638 ?auto_2235640 ) ) ( not ( = ?auto_2235638 ?auto_2235641 ) ) ( not ( = ?auto_2235638 ?auto_2235642 ) ) ( not ( = ?auto_2235638 ?auto_2235643 ) ) ( not ( = ?auto_2235638 ?auto_2235644 ) ) ( not ( = ?auto_2235638 ?auto_2235645 ) ) ( not ( = ?auto_2235638 ?auto_2235646 ) ) ( not ( = ?auto_2235638 ?auto_2235647 ) ) ( not ( = ?auto_2235638 ?auto_2235648 ) ) ( not ( = ?auto_2235638 ?auto_2235649 ) ) ( not ( = ?auto_2235638 ?auto_2235650 ) ) ( not ( = ?auto_2235638 ?auto_2235651 ) ) ( not ( = ?auto_2235639 ?auto_2235640 ) ) ( not ( = ?auto_2235639 ?auto_2235641 ) ) ( not ( = ?auto_2235639 ?auto_2235642 ) ) ( not ( = ?auto_2235639 ?auto_2235643 ) ) ( not ( = ?auto_2235639 ?auto_2235644 ) ) ( not ( = ?auto_2235639 ?auto_2235645 ) ) ( not ( = ?auto_2235639 ?auto_2235646 ) ) ( not ( = ?auto_2235639 ?auto_2235647 ) ) ( not ( = ?auto_2235639 ?auto_2235648 ) ) ( not ( = ?auto_2235639 ?auto_2235649 ) ) ( not ( = ?auto_2235639 ?auto_2235650 ) ) ( not ( = ?auto_2235639 ?auto_2235651 ) ) ( not ( = ?auto_2235640 ?auto_2235641 ) ) ( not ( = ?auto_2235640 ?auto_2235642 ) ) ( not ( = ?auto_2235640 ?auto_2235643 ) ) ( not ( = ?auto_2235640 ?auto_2235644 ) ) ( not ( = ?auto_2235640 ?auto_2235645 ) ) ( not ( = ?auto_2235640 ?auto_2235646 ) ) ( not ( = ?auto_2235640 ?auto_2235647 ) ) ( not ( = ?auto_2235640 ?auto_2235648 ) ) ( not ( = ?auto_2235640 ?auto_2235649 ) ) ( not ( = ?auto_2235640 ?auto_2235650 ) ) ( not ( = ?auto_2235640 ?auto_2235651 ) ) ( not ( = ?auto_2235641 ?auto_2235642 ) ) ( not ( = ?auto_2235641 ?auto_2235643 ) ) ( not ( = ?auto_2235641 ?auto_2235644 ) ) ( not ( = ?auto_2235641 ?auto_2235645 ) ) ( not ( = ?auto_2235641 ?auto_2235646 ) ) ( not ( = ?auto_2235641 ?auto_2235647 ) ) ( not ( = ?auto_2235641 ?auto_2235648 ) ) ( not ( = ?auto_2235641 ?auto_2235649 ) ) ( not ( = ?auto_2235641 ?auto_2235650 ) ) ( not ( = ?auto_2235641 ?auto_2235651 ) ) ( not ( = ?auto_2235642 ?auto_2235643 ) ) ( not ( = ?auto_2235642 ?auto_2235644 ) ) ( not ( = ?auto_2235642 ?auto_2235645 ) ) ( not ( = ?auto_2235642 ?auto_2235646 ) ) ( not ( = ?auto_2235642 ?auto_2235647 ) ) ( not ( = ?auto_2235642 ?auto_2235648 ) ) ( not ( = ?auto_2235642 ?auto_2235649 ) ) ( not ( = ?auto_2235642 ?auto_2235650 ) ) ( not ( = ?auto_2235642 ?auto_2235651 ) ) ( not ( = ?auto_2235643 ?auto_2235644 ) ) ( not ( = ?auto_2235643 ?auto_2235645 ) ) ( not ( = ?auto_2235643 ?auto_2235646 ) ) ( not ( = ?auto_2235643 ?auto_2235647 ) ) ( not ( = ?auto_2235643 ?auto_2235648 ) ) ( not ( = ?auto_2235643 ?auto_2235649 ) ) ( not ( = ?auto_2235643 ?auto_2235650 ) ) ( not ( = ?auto_2235643 ?auto_2235651 ) ) ( not ( = ?auto_2235644 ?auto_2235645 ) ) ( not ( = ?auto_2235644 ?auto_2235646 ) ) ( not ( = ?auto_2235644 ?auto_2235647 ) ) ( not ( = ?auto_2235644 ?auto_2235648 ) ) ( not ( = ?auto_2235644 ?auto_2235649 ) ) ( not ( = ?auto_2235644 ?auto_2235650 ) ) ( not ( = ?auto_2235644 ?auto_2235651 ) ) ( not ( = ?auto_2235645 ?auto_2235646 ) ) ( not ( = ?auto_2235645 ?auto_2235647 ) ) ( not ( = ?auto_2235645 ?auto_2235648 ) ) ( not ( = ?auto_2235645 ?auto_2235649 ) ) ( not ( = ?auto_2235645 ?auto_2235650 ) ) ( not ( = ?auto_2235645 ?auto_2235651 ) ) ( not ( = ?auto_2235646 ?auto_2235647 ) ) ( not ( = ?auto_2235646 ?auto_2235648 ) ) ( not ( = ?auto_2235646 ?auto_2235649 ) ) ( not ( = ?auto_2235646 ?auto_2235650 ) ) ( not ( = ?auto_2235646 ?auto_2235651 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2235647 ?auto_2235648 ?auto_2235649 )
      ( MAKE-16CRATE-VERIFY ?auto_2235633 ?auto_2235634 ?auto_2235635 ?auto_2235637 ?auto_2235636 ?auto_2235638 ?auto_2235639 ?auto_2235640 ?auto_2235641 ?auto_2235642 ?auto_2235643 ?auto_2235644 ?auto_2235645 ?auto_2235646 ?auto_2235647 ?auto_2235648 ?auto_2235649 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2235875 - SURFACE
      ?auto_2235876 - SURFACE
      ?auto_2235877 - SURFACE
      ?auto_2235879 - SURFACE
      ?auto_2235878 - SURFACE
      ?auto_2235880 - SURFACE
      ?auto_2235881 - SURFACE
      ?auto_2235882 - SURFACE
      ?auto_2235883 - SURFACE
      ?auto_2235884 - SURFACE
      ?auto_2235885 - SURFACE
      ?auto_2235886 - SURFACE
      ?auto_2235887 - SURFACE
      ?auto_2235888 - SURFACE
      ?auto_2235889 - SURFACE
      ?auto_2235890 - SURFACE
    )
    :vars
    (
      ?auto_2235892 - HOIST
      ?auto_2235895 - PLACE
      ?auto_2235897 - PLACE
      ?auto_2235896 - HOIST
      ?auto_2235893 - SURFACE
      ?auto_2235894 - SURFACE
      ?auto_2235891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2235892 ?auto_2235895 ) ( IS-CRATE ?auto_2235890 ) ( not ( = ?auto_2235889 ?auto_2235890 ) ) ( not ( = ?auto_2235888 ?auto_2235889 ) ) ( not ( = ?auto_2235888 ?auto_2235890 ) ) ( not ( = ?auto_2235897 ?auto_2235895 ) ) ( HOIST-AT ?auto_2235896 ?auto_2235897 ) ( not ( = ?auto_2235892 ?auto_2235896 ) ) ( SURFACE-AT ?auto_2235890 ?auto_2235897 ) ( ON ?auto_2235890 ?auto_2235893 ) ( CLEAR ?auto_2235890 ) ( not ( = ?auto_2235889 ?auto_2235893 ) ) ( not ( = ?auto_2235890 ?auto_2235893 ) ) ( not ( = ?auto_2235888 ?auto_2235893 ) ) ( SURFACE-AT ?auto_2235888 ?auto_2235895 ) ( CLEAR ?auto_2235888 ) ( IS-CRATE ?auto_2235889 ) ( AVAILABLE ?auto_2235892 ) ( AVAILABLE ?auto_2235896 ) ( SURFACE-AT ?auto_2235889 ?auto_2235897 ) ( ON ?auto_2235889 ?auto_2235894 ) ( CLEAR ?auto_2235889 ) ( not ( = ?auto_2235889 ?auto_2235894 ) ) ( not ( = ?auto_2235890 ?auto_2235894 ) ) ( not ( = ?auto_2235888 ?auto_2235894 ) ) ( not ( = ?auto_2235893 ?auto_2235894 ) ) ( TRUCK-AT ?auto_2235891 ?auto_2235895 ) ( ON ?auto_2235876 ?auto_2235875 ) ( ON ?auto_2235877 ?auto_2235876 ) ( ON ?auto_2235879 ?auto_2235877 ) ( ON ?auto_2235878 ?auto_2235879 ) ( ON ?auto_2235880 ?auto_2235878 ) ( ON ?auto_2235881 ?auto_2235880 ) ( ON ?auto_2235882 ?auto_2235881 ) ( ON ?auto_2235883 ?auto_2235882 ) ( ON ?auto_2235884 ?auto_2235883 ) ( ON ?auto_2235885 ?auto_2235884 ) ( ON ?auto_2235886 ?auto_2235885 ) ( ON ?auto_2235887 ?auto_2235886 ) ( ON ?auto_2235888 ?auto_2235887 ) ( not ( = ?auto_2235875 ?auto_2235876 ) ) ( not ( = ?auto_2235875 ?auto_2235877 ) ) ( not ( = ?auto_2235875 ?auto_2235879 ) ) ( not ( = ?auto_2235875 ?auto_2235878 ) ) ( not ( = ?auto_2235875 ?auto_2235880 ) ) ( not ( = ?auto_2235875 ?auto_2235881 ) ) ( not ( = ?auto_2235875 ?auto_2235882 ) ) ( not ( = ?auto_2235875 ?auto_2235883 ) ) ( not ( = ?auto_2235875 ?auto_2235884 ) ) ( not ( = ?auto_2235875 ?auto_2235885 ) ) ( not ( = ?auto_2235875 ?auto_2235886 ) ) ( not ( = ?auto_2235875 ?auto_2235887 ) ) ( not ( = ?auto_2235875 ?auto_2235888 ) ) ( not ( = ?auto_2235875 ?auto_2235889 ) ) ( not ( = ?auto_2235875 ?auto_2235890 ) ) ( not ( = ?auto_2235875 ?auto_2235893 ) ) ( not ( = ?auto_2235875 ?auto_2235894 ) ) ( not ( = ?auto_2235876 ?auto_2235877 ) ) ( not ( = ?auto_2235876 ?auto_2235879 ) ) ( not ( = ?auto_2235876 ?auto_2235878 ) ) ( not ( = ?auto_2235876 ?auto_2235880 ) ) ( not ( = ?auto_2235876 ?auto_2235881 ) ) ( not ( = ?auto_2235876 ?auto_2235882 ) ) ( not ( = ?auto_2235876 ?auto_2235883 ) ) ( not ( = ?auto_2235876 ?auto_2235884 ) ) ( not ( = ?auto_2235876 ?auto_2235885 ) ) ( not ( = ?auto_2235876 ?auto_2235886 ) ) ( not ( = ?auto_2235876 ?auto_2235887 ) ) ( not ( = ?auto_2235876 ?auto_2235888 ) ) ( not ( = ?auto_2235876 ?auto_2235889 ) ) ( not ( = ?auto_2235876 ?auto_2235890 ) ) ( not ( = ?auto_2235876 ?auto_2235893 ) ) ( not ( = ?auto_2235876 ?auto_2235894 ) ) ( not ( = ?auto_2235877 ?auto_2235879 ) ) ( not ( = ?auto_2235877 ?auto_2235878 ) ) ( not ( = ?auto_2235877 ?auto_2235880 ) ) ( not ( = ?auto_2235877 ?auto_2235881 ) ) ( not ( = ?auto_2235877 ?auto_2235882 ) ) ( not ( = ?auto_2235877 ?auto_2235883 ) ) ( not ( = ?auto_2235877 ?auto_2235884 ) ) ( not ( = ?auto_2235877 ?auto_2235885 ) ) ( not ( = ?auto_2235877 ?auto_2235886 ) ) ( not ( = ?auto_2235877 ?auto_2235887 ) ) ( not ( = ?auto_2235877 ?auto_2235888 ) ) ( not ( = ?auto_2235877 ?auto_2235889 ) ) ( not ( = ?auto_2235877 ?auto_2235890 ) ) ( not ( = ?auto_2235877 ?auto_2235893 ) ) ( not ( = ?auto_2235877 ?auto_2235894 ) ) ( not ( = ?auto_2235879 ?auto_2235878 ) ) ( not ( = ?auto_2235879 ?auto_2235880 ) ) ( not ( = ?auto_2235879 ?auto_2235881 ) ) ( not ( = ?auto_2235879 ?auto_2235882 ) ) ( not ( = ?auto_2235879 ?auto_2235883 ) ) ( not ( = ?auto_2235879 ?auto_2235884 ) ) ( not ( = ?auto_2235879 ?auto_2235885 ) ) ( not ( = ?auto_2235879 ?auto_2235886 ) ) ( not ( = ?auto_2235879 ?auto_2235887 ) ) ( not ( = ?auto_2235879 ?auto_2235888 ) ) ( not ( = ?auto_2235879 ?auto_2235889 ) ) ( not ( = ?auto_2235879 ?auto_2235890 ) ) ( not ( = ?auto_2235879 ?auto_2235893 ) ) ( not ( = ?auto_2235879 ?auto_2235894 ) ) ( not ( = ?auto_2235878 ?auto_2235880 ) ) ( not ( = ?auto_2235878 ?auto_2235881 ) ) ( not ( = ?auto_2235878 ?auto_2235882 ) ) ( not ( = ?auto_2235878 ?auto_2235883 ) ) ( not ( = ?auto_2235878 ?auto_2235884 ) ) ( not ( = ?auto_2235878 ?auto_2235885 ) ) ( not ( = ?auto_2235878 ?auto_2235886 ) ) ( not ( = ?auto_2235878 ?auto_2235887 ) ) ( not ( = ?auto_2235878 ?auto_2235888 ) ) ( not ( = ?auto_2235878 ?auto_2235889 ) ) ( not ( = ?auto_2235878 ?auto_2235890 ) ) ( not ( = ?auto_2235878 ?auto_2235893 ) ) ( not ( = ?auto_2235878 ?auto_2235894 ) ) ( not ( = ?auto_2235880 ?auto_2235881 ) ) ( not ( = ?auto_2235880 ?auto_2235882 ) ) ( not ( = ?auto_2235880 ?auto_2235883 ) ) ( not ( = ?auto_2235880 ?auto_2235884 ) ) ( not ( = ?auto_2235880 ?auto_2235885 ) ) ( not ( = ?auto_2235880 ?auto_2235886 ) ) ( not ( = ?auto_2235880 ?auto_2235887 ) ) ( not ( = ?auto_2235880 ?auto_2235888 ) ) ( not ( = ?auto_2235880 ?auto_2235889 ) ) ( not ( = ?auto_2235880 ?auto_2235890 ) ) ( not ( = ?auto_2235880 ?auto_2235893 ) ) ( not ( = ?auto_2235880 ?auto_2235894 ) ) ( not ( = ?auto_2235881 ?auto_2235882 ) ) ( not ( = ?auto_2235881 ?auto_2235883 ) ) ( not ( = ?auto_2235881 ?auto_2235884 ) ) ( not ( = ?auto_2235881 ?auto_2235885 ) ) ( not ( = ?auto_2235881 ?auto_2235886 ) ) ( not ( = ?auto_2235881 ?auto_2235887 ) ) ( not ( = ?auto_2235881 ?auto_2235888 ) ) ( not ( = ?auto_2235881 ?auto_2235889 ) ) ( not ( = ?auto_2235881 ?auto_2235890 ) ) ( not ( = ?auto_2235881 ?auto_2235893 ) ) ( not ( = ?auto_2235881 ?auto_2235894 ) ) ( not ( = ?auto_2235882 ?auto_2235883 ) ) ( not ( = ?auto_2235882 ?auto_2235884 ) ) ( not ( = ?auto_2235882 ?auto_2235885 ) ) ( not ( = ?auto_2235882 ?auto_2235886 ) ) ( not ( = ?auto_2235882 ?auto_2235887 ) ) ( not ( = ?auto_2235882 ?auto_2235888 ) ) ( not ( = ?auto_2235882 ?auto_2235889 ) ) ( not ( = ?auto_2235882 ?auto_2235890 ) ) ( not ( = ?auto_2235882 ?auto_2235893 ) ) ( not ( = ?auto_2235882 ?auto_2235894 ) ) ( not ( = ?auto_2235883 ?auto_2235884 ) ) ( not ( = ?auto_2235883 ?auto_2235885 ) ) ( not ( = ?auto_2235883 ?auto_2235886 ) ) ( not ( = ?auto_2235883 ?auto_2235887 ) ) ( not ( = ?auto_2235883 ?auto_2235888 ) ) ( not ( = ?auto_2235883 ?auto_2235889 ) ) ( not ( = ?auto_2235883 ?auto_2235890 ) ) ( not ( = ?auto_2235883 ?auto_2235893 ) ) ( not ( = ?auto_2235883 ?auto_2235894 ) ) ( not ( = ?auto_2235884 ?auto_2235885 ) ) ( not ( = ?auto_2235884 ?auto_2235886 ) ) ( not ( = ?auto_2235884 ?auto_2235887 ) ) ( not ( = ?auto_2235884 ?auto_2235888 ) ) ( not ( = ?auto_2235884 ?auto_2235889 ) ) ( not ( = ?auto_2235884 ?auto_2235890 ) ) ( not ( = ?auto_2235884 ?auto_2235893 ) ) ( not ( = ?auto_2235884 ?auto_2235894 ) ) ( not ( = ?auto_2235885 ?auto_2235886 ) ) ( not ( = ?auto_2235885 ?auto_2235887 ) ) ( not ( = ?auto_2235885 ?auto_2235888 ) ) ( not ( = ?auto_2235885 ?auto_2235889 ) ) ( not ( = ?auto_2235885 ?auto_2235890 ) ) ( not ( = ?auto_2235885 ?auto_2235893 ) ) ( not ( = ?auto_2235885 ?auto_2235894 ) ) ( not ( = ?auto_2235886 ?auto_2235887 ) ) ( not ( = ?auto_2235886 ?auto_2235888 ) ) ( not ( = ?auto_2235886 ?auto_2235889 ) ) ( not ( = ?auto_2235886 ?auto_2235890 ) ) ( not ( = ?auto_2235886 ?auto_2235893 ) ) ( not ( = ?auto_2235886 ?auto_2235894 ) ) ( not ( = ?auto_2235887 ?auto_2235888 ) ) ( not ( = ?auto_2235887 ?auto_2235889 ) ) ( not ( = ?auto_2235887 ?auto_2235890 ) ) ( not ( = ?auto_2235887 ?auto_2235893 ) ) ( not ( = ?auto_2235887 ?auto_2235894 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2235888 ?auto_2235889 ?auto_2235890 )
      ( MAKE-15CRATE-VERIFY ?auto_2235875 ?auto_2235876 ?auto_2235877 ?auto_2235879 ?auto_2235878 ?auto_2235880 ?auto_2235881 ?auto_2235882 ?auto_2235883 ?auto_2235884 ?auto_2235885 ?auto_2235886 ?auto_2235887 ?auto_2235888 ?auto_2235889 ?auto_2235890 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2235898 - SURFACE
      ?auto_2235899 - SURFACE
      ?auto_2235900 - SURFACE
      ?auto_2235902 - SURFACE
      ?auto_2235901 - SURFACE
      ?auto_2235903 - SURFACE
      ?auto_2235904 - SURFACE
      ?auto_2235905 - SURFACE
      ?auto_2235906 - SURFACE
      ?auto_2235907 - SURFACE
      ?auto_2235908 - SURFACE
      ?auto_2235909 - SURFACE
      ?auto_2235910 - SURFACE
      ?auto_2235911 - SURFACE
      ?auto_2235912 - SURFACE
      ?auto_2235913 - SURFACE
      ?auto_2235914 - SURFACE
    )
    :vars
    (
      ?auto_2235916 - HOIST
      ?auto_2235919 - PLACE
      ?auto_2235921 - PLACE
      ?auto_2235920 - HOIST
      ?auto_2235917 - SURFACE
      ?auto_2235918 - SURFACE
      ?auto_2235915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2235916 ?auto_2235919 ) ( IS-CRATE ?auto_2235914 ) ( not ( = ?auto_2235913 ?auto_2235914 ) ) ( not ( = ?auto_2235912 ?auto_2235913 ) ) ( not ( = ?auto_2235912 ?auto_2235914 ) ) ( not ( = ?auto_2235921 ?auto_2235919 ) ) ( HOIST-AT ?auto_2235920 ?auto_2235921 ) ( not ( = ?auto_2235916 ?auto_2235920 ) ) ( SURFACE-AT ?auto_2235914 ?auto_2235921 ) ( ON ?auto_2235914 ?auto_2235917 ) ( CLEAR ?auto_2235914 ) ( not ( = ?auto_2235913 ?auto_2235917 ) ) ( not ( = ?auto_2235914 ?auto_2235917 ) ) ( not ( = ?auto_2235912 ?auto_2235917 ) ) ( SURFACE-AT ?auto_2235912 ?auto_2235919 ) ( CLEAR ?auto_2235912 ) ( IS-CRATE ?auto_2235913 ) ( AVAILABLE ?auto_2235916 ) ( AVAILABLE ?auto_2235920 ) ( SURFACE-AT ?auto_2235913 ?auto_2235921 ) ( ON ?auto_2235913 ?auto_2235918 ) ( CLEAR ?auto_2235913 ) ( not ( = ?auto_2235913 ?auto_2235918 ) ) ( not ( = ?auto_2235914 ?auto_2235918 ) ) ( not ( = ?auto_2235912 ?auto_2235918 ) ) ( not ( = ?auto_2235917 ?auto_2235918 ) ) ( TRUCK-AT ?auto_2235915 ?auto_2235919 ) ( ON ?auto_2235899 ?auto_2235898 ) ( ON ?auto_2235900 ?auto_2235899 ) ( ON ?auto_2235902 ?auto_2235900 ) ( ON ?auto_2235901 ?auto_2235902 ) ( ON ?auto_2235903 ?auto_2235901 ) ( ON ?auto_2235904 ?auto_2235903 ) ( ON ?auto_2235905 ?auto_2235904 ) ( ON ?auto_2235906 ?auto_2235905 ) ( ON ?auto_2235907 ?auto_2235906 ) ( ON ?auto_2235908 ?auto_2235907 ) ( ON ?auto_2235909 ?auto_2235908 ) ( ON ?auto_2235910 ?auto_2235909 ) ( ON ?auto_2235911 ?auto_2235910 ) ( ON ?auto_2235912 ?auto_2235911 ) ( not ( = ?auto_2235898 ?auto_2235899 ) ) ( not ( = ?auto_2235898 ?auto_2235900 ) ) ( not ( = ?auto_2235898 ?auto_2235902 ) ) ( not ( = ?auto_2235898 ?auto_2235901 ) ) ( not ( = ?auto_2235898 ?auto_2235903 ) ) ( not ( = ?auto_2235898 ?auto_2235904 ) ) ( not ( = ?auto_2235898 ?auto_2235905 ) ) ( not ( = ?auto_2235898 ?auto_2235906 ) ) ( not ( = ?auto_2235898 ?auto_2235907 ) ) ( not ( = ?auto_2235898 ?auto_2235908 ) ) ( not ( = ?auto_2235898 ?auto_2235909 ) ) ( not ( = ?auto_2235898 ?auto_2235910 ) ) ( not ( = ?auto_2235898 ?auto_2235911 ) ) ( not ( = ?auto_2235898 ?auto_2235912 ) ) ( not ( = ?auto_2235898 ?auto_2235913 ) ) ( not ( = ?auto_2235898 ?auto_2235914 ) ) ( not ( = ?auto_2235898 ?auto_2235917 ) ) ( not ( = ?auto_2235898 ?auto_2235918 ) ) ( not ( = ?auto_2235899 ?auto_2235900 ) ) ( not ( = ?auto_2235899 ?auto_2235902 ) ) ( not ( = ?auto_2235899 ?auto_2235901 ) ) ( not ( = ?auto_2235899 ?auto_2235903 ) ) ( not ( = ?auto_2235899 ?auto_2235904 ) ) ( not ( = ?auto_2235899 ?auto_2235905 ) ) ( not ( = ?auto_2235899 ?auto_2235906 ) ) ( not ( = ?auto_2235899 ?auto_2235907 ) ) ( not ( = ?auto_2235899 ?auto_2235908 ) ) ( not ( = ?auto_2235899 ?auto_2235909 ) ) ( not ( = ?auto_2235899 ?auto_2235910 ) ) ( not ( = ?auto_2235899 ?auto_2235911 ) ) ( not ( = ?auto_2235899 ?auto_2235912 ) ) ( not ( = ?auto_2235899 ?auto_2235913 ) ) ( not ( = ?auto_2235899 ?auto_2235914 ) ) ( not ( = ?auto_2235899 ?auto_2235917 ) ) ( not ( = ?auto_2235899 ?auto_2235918 ) ) ( not ( = ?auto_2235900 ?auto_2235902 ) ) ( not ( = ?auto_2235900 ?auto_2235901 ) ) ( not ( = ?auto_2235900 ?auto_2235903 ) ) ( not ( = ?auto_2235900 ?auto_2235904 ) ) ( not ( = ?auto_2235900 ?auto_2235905 ) ) ( not ( = ?auto_2235900 ?auto_2235906 ) ) ( not ( = ?auto_2235900 ?auto_2235907 ) ) ( not ( = ?auto_2235900 ?auto_2235908 ) ) ( not ( = ?auto_2235900 ?auto_2235909 ) ) ( not ( = ?auto_2235900 ?auto_2235910 ) ) ( not ( = ?auto_2235900 ?auto_2235911 ) ) ( not ( = ?auto_2235900 ?auto_2235912 ) ) ( not ( = ?auto_2235900 ?auto_2235913 ) ) ( not ( = ?auto_2235900 ?auto_2235914 ) ) ( not ( = ?auto_2235900 ?auto_2235917 ) ) ( not ( = ?auto_2235900 ?auto_2235918 ) ) ( not ( = ?auto_2235902 ?auto_2235901 ) ) ( not ( = ?auto_2235902 ?auto_2235903 ) ) ( not ( = ?auto_2235902 ?auto_2235904 ) ) ( not ( = ?auto_2235902 ?auto_2235905 ) ) ( not ( = ?auto_2235902 ?auto_2235906 ) ) ( not ( = ?auto_2235902 ?auto_2235907 ) ) ( not ( = ?auto_2235902 ?auto_2235908 ) ) ( not ( = ?auto_2235902 ?auto_2235909 ) ) ( not ( = ?auto_2235902 ?auto_2235910 ) ) ( not ( = ?auto_2235902 ?auto_2235911 ) ) ( not ( = ?auto_2235902 ?auto_2235912 ) ) ( not ( = ?auto_2235902 ?auto_2235913 ) ) ( not ( = ?auto_2235902 ?auto_2235914 ) ) ( not ( = ?auto_2235902 ?auto_2235917 ) ) ( not ( = ?auto_2235902 ?auto_2235918 ) ) ( not ( = ?auto_2235901 ?auto_2235903 ) ) ( not ( = ?auto_2235901 ?auto_2235904 ) ) ( not ( = ?auto_2235901 ?auto_2235905 ) ) ( not ( = ?auto_2235901 ?auto_2235906 ) ) ( not ( = ?auto_2235901 ?auto_2235907 ) ) ( not ( = ?auto_2235901 ?auto_2235908 ) ) ( not ( = ?auto_2235901 ?auto_2235909 ) ) ( not ( = ?auto_2235901 ?auto_2235910 ) ) ( not ( = ?auto_2235901 ?auto_2235911 ) ) ( not ( = ?auto_2235901 ?auto_2235912 ) ) ( not ( = ?auto_2235901 ?auto_2235913 ) ) ( not ( = ?auto_2235901 ?auto_2235914 ) ) ( not ( = ?auto_2235901 ?auto_2235917 ) ) ( not ( = ?auto_2235901 ?auto_2235918 ) ) ( not ( = ?auto_2235903 ?auto_2235904 ) ) ( not ( = ?auto_2235903 ?auto_2235905 ) ) ( not ( = ?auto_2235903 ?auto_2235906 ) ) ( not ( = ?auto_2235903 ?auto_2235907 ) ) ( not ( = ?auto_2235903 ?auto_2235908 ) ) ( not ( = ?auto_2235903 ?auto_2235909 ) ) ( not ( = ?auto_2235903 ?auto_2235910 ) ) ( not ( = ?auto_2235903 ?auto_2235911 ) ) ( not ( = ?auto_2235903 ?auto_2235912 ) ) ( not ( = ?auto_2235903 ?auto_2235913 ) ) ( not ( = ?auto_2235903 ?auto_2235914 ) ) ( not ( = ?auto_2235903 ?auto_2235917 ) ) ( not ( = ?auto_2235903 ?auto_2235918 ) ) ( not ( = ?auto_2235904 ?auto_2235905 ) ) ( not ( = ?auto_2235904 ?auto_2235906 ) ) ( not ( = ?auto_2235904 ?auto_2235907 ) ) ( not ( = ?auto_2235904 ?auto_2235908 ) ) ( not ( = ?auto_2235904 ?auto_2235909 ) ) ( not ( = ?auto_2235904 ?auto_2235910 ) ) ( not ( = ?auto_2235904 ?auto_2235911 ) ) ( not ( = ?auto_2235904 ?auto_2235912 ) ) ( not ( = ?auto_2235904 ?auto_2235913 ) ) ( not ( = ?auto_2235904 ?auto_2235914 ) ) ( not ( = ?auto_2235904 ?auto_2235917 ) ) ( not ( = ?auto_2235904 ?auto_2235918 ) ) ( not ( = ?auto_2235905 ?auto_2235906 ) ) ( not ( = ?auto_2235905 ?auto_2235907 ) ) ( not ( = ?auto_2235905 ?auto_2235908 ) ) ( not ( = ?auto_2235905 ?auto_2235909 ) ) ( not ( = ?auto_2235905 ?auto_2235910 ) ) ( not ( = ?auto_2235905 ?auto_2235911 ) ) ( not ( = ?auto_2235905 ?auto_2235912 ) ) ( not ( = ?auto_2235905 ?auto_2235913 ) ) ( not ( = ?auto_2235905 ?auto_2235914 ) ) ( not ( = ?auto_2235905 ?auto_2235917 ) ) ( not ( = ?auto_2235905 ?auto_2235918 ) ) ( not ( = ?auto_2235906 ?auto_2235907 ) ) ( not ( = ?auto_2235906 ?auto_2235908 ) ) ( not ( = ?auto_2235906 ?auto_2235909 ) ) ( not ( = ?auto_2235906 ?auto_2235910 ) ) ( not ( = ?auto_2235906 ?auto_2235911 ) ) ( not ( = ?auto_2235906 ?auto_2235912 ) ) ( not ( = ?auto_2235906 ?auto_2235913 ) ) ( not ( = ?auto_2235906 ?auto_2235914 ) ) ( not ( = ?auto_2235906 ?auto_2235917 ) ) ( not ( = ?auto_2235906 ?auto_2235918 ) ) ( not ( = ?auto_2235907 ?auto_2235908 ) ) ( not ( = ?auto_2235907 ?auto_2235909 ) ) ( not ( = ?auto_2235907 ?auto_2235910 ) ) ( not ( = ?auto_2235907 ?auto_2235911 ) ) ( not ( = ?auto_2235907 ?auto_2235912 ) ) ( not ( = ?auto_2235907 ?auto_2235913 ) ) ( not ( = ?auto_2235907 ?auto_2235914 ) ) ( not ( = ?auto_2235907 ?auto_2235917 ) ) ( not ( = ?auto_2235907 ?auto_2235918 ) ) ( not ( = ?auto_2235908 ?auto_2235909 ) ) ( not ( = ?auto_2235908 ?auto_2235910 ) ) ( not ( = ?auto_2235908 ?auto_2235911 ) ) ( not ( = ?auto_2235908 ?auto_2235912 ) ) ( not ( = ?auto_2235908 ?auto_2235913 ) ) ( not ( = ?auto_2235908 ?auto_2235914 ) ) ( not ( = ?auto_2235908 ?auto_2235917 ) ) ( not ( = ?auto_2235908 ?auto_2235918 ) ) ( not ( = ?auto_2235909 ?auto_2235910 ) ) ( not ( = ?auto_2235909 ?auto_2235911 ) ) ( not ( = ?auto_2235909 ?auto_2235912 ) ) ( not ( = ?auto_2235909 ?auto_2235913 ) ) ( not ( = ?auto_2235909 ?auto_2235914 ) ) ( not ( = ?auto_2235909 ?auto_2235917 ) ) ( not ( = ?auto_2235909 ?auto_2235918 ) ) ( not ( = ?auto_2235910 ?auto_2235911 ) ) ( not ( = ?auto_2235910 ?auto_2235912 ) ) ( not ( = ?auto_2235910 ?auto_2235913 ) ) ( not ( = ?auto_2235910 ?auto_2235914 ) ) ( not ( = ?auto_2235910 ?auto_2235917 ) ) ( not ( = ?auto_2235910 ?auto_2235918 ) ) ( not ( = ?auto_2235911 ?auto_2235912 ) ) ( not ( = ?auto_2235911 ?auto_2235913 ) ) ( not ( = ?auto_2235911 ?auto_2235914 ) ) ( not ( = ?auto_2235911 ?auto_2235917 ) ) ( not ( = ?auto_2235911 ?auto_2235918 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2235912 ?auto_2235913 ?auto_2235914 )
      ( MAKE-16CRATE-VERIFY ?auto_2235898 ?auto_2235899 ?auto_2235900 ?auto_2235902 ?auto_2235901 ?auto_2235903 ?auto_2235904 ?auto_2235905 ?auto_2235906 ?auto_2235907 ?auto_2235908 ?auto_2235909 ?auto_2235910 ?auto_2235911 ?auto_2235912 ?auto_2235913 ?auto_2235914 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2236142 - SURFACE
      ?auto_2236143 - SURFACE
      ?auto_2236144 - SURFACE
      ?auto_2236146 - SURFACE
      ?auto_2236145 - SURFACE
      ?auto_2236147 - SURFACE
      ?auto_2236148 - SURFACE
      ?auto_2236149 - SURFACE
      ?auto_2236150 - SURFACE
      ?auto_2236151 - SURFACE
      ?auto_2236152 - SURFACE
      ?auto_2236153 - SURFACE
      ?auto_2236154 - SURFACE
      ?auto_2236155 - SURFACE
      ?auto_2236156 - SURFACE
      ?auto_2236157 - SURFACE
    )
    :vars
    (
      ?auto_2236159 - HOIST
      ?auto_2236161 - PLACE
      ?auto_2236163 - PLACE
      ?auto_2236160 - HOIST
      ?auto_2236164 - SURFACE
      ?auto_2236162 - SURFACE
      ?auto_2236158 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2236159 ?auto_2236161 ) ( IS-CRATE ?auto_2236157 ) ( not ( = ?auto_2236156 ?auto_2236157 ) ) ( not ( = ?auto_2236155 ?auto_2236156 ) ) ( not ( = ?auto_2236155 ?auto_2236157 ) ) ( not ( = ?auto_2236163 ?auto_2236161 ) ) ( HOIST-AT ?auto_2236160 ?auto_2236163 ) ( not ( = ?auto_2236159 ?auto_2236160 ) ) ( SURFACE-AT ?auto_2236157 ?auto_2236163 ) ( ON ?auto_2236157 ?auto_2236164 ) ( CLEAR ?auto_2236157 ) ( not ( = ?auto_2236156 ?auto_2236164 ) ) ( not ( = ?auto_2236157 ?auto_2236164 ) ) ( not ( = ?auto_2236155 ?auto_2236164 ) ) ( IS-CRATE ?auto_2236156 ) ( AVAILABLE ?auto_2236160 ) ( SURFACE-AT ?auto_2236156 ?auto_2236163 ) ( ON ?auto_2236156 ?auto_2236162 ) ( CLEAR ?auto_2236156 ) ( not ( = ?auto_2236156 ?auto_2236162 ) ) ( not ( = ?auto_2236157 ?auto_2236162 ) ) ( not ( = ?auto_2236155 ?auto_2236162 ) ) ( not ( = ?auto_2236164 ?auto_2236162 ) ) ( TRUCK-AT ?auto_2236158 ?auto_2236161 ) ( SURFACE-AT ?auto_2236154 ?auto_2236161 ) ( CLEAR ?auto_2236154 ) ( LIFTING ?auto_2236159 ?auto_2236155 ) ( IS-CRATE ?auto_2236155 ) ( not ( = ?auto_2236154 ?auto_2236155 ) ) ( not ( = ?auto_2236156 ?auto_2236154 ) ) ( not ( = ?auto_2236157 ?auto_2236154 ) ) ( not ( = ?auto_2236164 ?auto_2236154 ) ) ( not ( = ?auto_2236162 ?auto_2236154 ) ) ( ON ?auto_2236143 ?auto_2236142 ) ( ON ?auto_2236144 ?auto_2236143 ) ( ON ?auto_2236146 ?auto_2236144 ) ( ON ?auto_2236145 ?auto_2236146 ) ( ON ?auto_2236147 ?auto_2236145 ) ( ON ?auto_2236148 ?auto_2236147 ) ( ON ?auto_2236149 ?auto_2236148 ) ( ON ?auto_2236150 ?auto_2236149 ) ( ON ?auto_2236151 ?auto_2236150 ) ( ON ?auto_2236152 ?auto_2236151 ) ( ON ?auto_2236153 ?auto_2236152 ) ( ON ?auto_2236154 ?auto_2236153 ) ( not ( = ?auto_2236142 ?auto_2236143 ) ) ( not ( = ?auto_2236142 ?auto_2236144 ) ) ( not ( = ?auto_2236142 ?auto_2236146 ) ) ( not ( = ?auto_2236142 ?auto_2236145 ) ) ( not ( = ?auto_2236142 ?auto_2236147 ) ) ( not ( = ?auto_2236142 ?auto_2236148 ) ) ( not ( = ?auto_2236142 ?auto_2236149 ) ) ( not ( = ?auto_2236142 ?auto_2236150 ) ) ( not ( = ?auto_2236142 ?auto_2236151 ) ) ( not ( = ?auto_2236142 ?auto_2236152 ) ) ( not ( = ?auto_2236142 ?auto_2236153 ) ) ( not ( = ?auto_2236142 ?auto_2236154 ) ) ( not ( = ?auto_2236142 ?auto_2236155 ) ) ( not ( = ?auto_2236142 ?auto_2236156 ) ) ( not ( = ?auto_2236142 ?auto_2236157 ) ) ( not ( = ?auto_2236142 ?auto_2236164 ) ) ( not ( = ?auto_2236142 ?auto_2236162 ) ) ( not ( = ?auto_2236143 ?auto_2236144 ) ) ( not ( = ?auto_2236143 ?auto_2236146 ) ) ( not ( = ?auto_2236143 ?auto_2236145 ) ) ( not ( = ?auto_2236143 ?auto_2236147 ) ) ( not ( = ?auto_2236143 ?auto_2236148 ) ) ( not ( = ?auto_2236143 ?auto_2236149 ) ) ( not ( = ?auto_2236143 ?auto_2236150 ) ) ( not ( = ?auto_2236143 ?auto_2236151 ) ) ( not ( = ?auto_2236143 ?auto_2236152 ) ) ( not ( = ?auto_2236143 ?auto_2236153 ) ) ( not ( = ?auto_2236143 ?auto_2236154 ) ) ( not ( = ?auto_2236143 ?auto_2236155 ) ) ( not ( = ?auto_2236143 ?auto_2236156 ) ) ( not ( = ?auto_2236143 ?auto_2236157 ) ) ( not ( = ?auto_2236143 ?auto_2236164 ) ) ( not ( = ?auto_2236143 ?auto_2236162 ) ) ( not ( = ?auto_2236144 ?auto_2236146 ) ) ( not ( = ?auto_2236144 ?auto_2236145 ) ) ( not ( = ?auto_2236144 ?auto_2236147 ) ) ( not ( = ?auto_2236144 ?auto_2236148 ) ) ( not ( = ?auto_2236144 ?auto_2236149 ) ) ( not ( = ?auto_2236144 ?auto_2236150 ) ) ( not ( = ?auto_2236144 ?auto_2236151 ) ) ( not ( = ?auto_2236144 ?auto_2236152 ) ) ( not ( = ?auto_2236144 ?auto_2236153 ) ) ( not ( = ?auto_2236144 ?auto_2236154 ) ) ( not ( = ?auto_2236144 ?auto_2236155 ) ) ( not ( = ?auto_2236144 ?auto_2236156 ) ) ( not ( = ?auto_2236144 ?auto_2236157 ) ) ( not ( = ?auto_2236144 ?auto_2236164 ) ) ( not ( = ?auto_2236144 ?auto_2236162 ) ) ( not ( = ?auto_2236146 ?auto_2236145 ) ) ( not ( = ?auto_2236146 ?auto_2236147 ) ) ( not ( = ?auto_2236146 ?auto_2236148 ) ) ( not ( = ?auto_2236146 ?auto_2236149 ) ) ( not ( = ?auto_2236146 ?auto_2236150 ) ) ( not ( = ?auto_2236146 ?auto_2236151 ) ) ( not ( = ?auto_2236146 ?auto_2236152 ) ) ( not ( = ?auto_2236146 ?auto_2236153 ) ) ( not ( = ?auto_2236146 ?auto_2236154 ) ) ( not ( = ?auto_2236146 ?auto_2236155 ) ) ( not ( = ?auto_2236146 ?auto_2236156 ) ) ( not ( = ?auto_2236146 ?auto_2236157 ) ) ( not ( = ?auto_2236146 ?auto_2236164 ) ) ( not ( = ?auto_2236146 ?auto_2236162 ) ) ( not ( = ?auto_2236145 ?auto_2236147 ) ) ( not ( = ?auto_2236145 ?auto_2236148 ) ) ( not ( = ?auto_2236145 ?auto_2236149 ) ) ( not ( = ?auto_2236145 ?auto_2236150 ) ) ( not ( = ?auto_2236145 ?auto_2236151 ) ) ( not ( = ?auto_2236145 ?auto_2236152 ) ) ( not ( = ?auto_2236145 ?auto_2236153 ) ) ( not ( = ?auto_2236145 ?auto_2236154 ) ) ( not ( = ?auto_2236145 ?auto_2236155 ) ) ( not ( = ?auto_2236145 ?auto_2236156 ) ) ( not ( = ?auto_2236145 ?auto_2236157 ) ) ( not ( = ?auto_2236145 ?auto_2236164 ) ) ( not ( = ?auto_2236145 ?auto_2236162 ) ) ( not ( = ?auto_2236147 ?auto_2236148 ) ) ( not ( = ?auto_2236147 ?auto_2236149 ) ) ( not ( = ?auto_2236147 ?auto_2236150 ) ) ( not ( = ?auto_2236147 ?auto_2236151 ) ) ( not ( = ?auto_2236147 ?auto_2236152 ) ) ( not ( = ?auto_2236147 ?auto_2236153 ) ) ( not ( = ?auto_2236147 ?auto_2236154 ) ) ( not ( = ?auto_2236147 ?auto_2236155 ) ) ( not ( = ?auto_2236147 ?auto_2236156 ) ) ( not ( = ?auto_2236147 ?auto_2236157 ) ) ( not ( = ?auto_2236147 ?auto_2236164 ) ) ( not ( = ?auto_2236147 ?auto_2236162 ) ) ( not ( = ?auto_2236148 ?auto_2236149 ) ) ( not ( = ?auto_2236148 ?auto_2236150 ) ) ( not ( = ?auto_2236148 ?auto_2236151 ) ) ( not ( = ?auto_2236148 ?auto_2236152 ) ) ( not ( = ?auto_2236148 ?auto_2236153 ) ) ( not ( = ?auto_2236148 ?auto_2236154 ) ) ( not ( = ?auto_2236148 ?auto_2236155 ) ) ( not ( = ?auto_2236148 ?auto_2236156 ) ) ( not ( = ?auto_2236148 ?auto_2236157 ) ) ( not ( = ?auto_2236148 ?auto_2236164 ) ) ( not ( = ?auto_2236148 ?auto_2236162 ) ) ( not ( = ?auto_2236149 ?auto_2236150 ) ) ( not ( = ?auto_2236149 ?auto_2236151 ) ) ( not ( = ?auto_2236149 ?auto_2236152 ) ) ( not ( = ?auto_2236149 ?auto_2236153 ) ) ( not ( = ?auto_2236149 ?auto_2236154 ) ) ( not ( = ?auto_2236149 ?auto_2236155 ) ) ( not ( = ?auto_2236149 ?auto_2236156 ) ) ( not ( = ?auto_2236149 ?auto_2236157 ) ) ( not ( = ?auto_2236149 ?auto_2236164 ) ) ( not ( = ?auto_2236149 ?auto_2236162 ) ) ( not ( = ?auto_2236150 ?auto_2236151 ) ) ( not ( = ?auto_2236150 ?auto_2236152 ) ) ( not ( = ?auto_2236150 ?auto_2236153 ) ) ( not ( = ?auto_2236150 ?auto_2236154 ) ) ( not ( = ?auto_2236150 ?auto_2236155 ) ) ( not ( = ?auto_2236150 ?auto_2236156 ) ) ( not ( = ?auto_2236150 ?auto_2236157 ) ) ( not ( = ?auto_2236150 ?auto_2236164 ) ) ( not ( = ?auto_2236150 ?auto_2236162 ) ) ( not ( = ?auto_2236151 ?auto_2236152 ) ) ( not ( = ?auto_2236151 ?auto_2236153 ) ) ( not ( = ?auto_2236151 ?auto_2236154 ) ) ( not ( = ?auto_2236151 ?auto_2236155 ) ) ( not ( = ?auto_2236151 ?auto_2236156 ) ) ( not ( = ?auto_2236151 ?auto_2236157 ) ) ( not ( = ?auto_2236151 ?auto_2236164 ) ) ( not ( = ?auto_2236151 ?auto_2236162 ) ) ( not ( = ?auto_2236152 ?auto_2236153 ) ) ( not ( = ?auto_2236152 ?auto_2236154 ) ) ( not ( = ?auto_2236152 ?auto_2236155 ) ) ( not ( = ?auto_2236152 ?auto_2236156 ) ) ( not ( = ?auto_2236152 ?auto_2236157 ) ) ( not ( = ?auto_2236152 ?auto_2236164 ) ) ( not ( = ?auto_2236152 ?auto_2236162 ) ) ( not ( = ?auto_2236153 ?auto_2236154 ) ) ( not ( = ?auto_2236153 ?auto_2236155 ) ) ( not ( = ?auto_2236153 ?auto_2236156 ) ) ( not ( = ?auto_2236153 ?auto_2236157 ) ) ( not ( = ?auto_2236153 ?auto_2236164 ) ) ( not ( = ?auto_2236153 ?auto_2236162 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2236155 ?auto_2236156 ?auto_2236157 )
      ( MAKE-15CRATE-VERIFY ?auto_2236142 ?auto_2236143 ?auto_2236144 ?auto_2236146 ?auto_2236145 ?auto_2236147 ?auto_2236148 ?auto_2236149 ?auto_2236150 ?auto_2236151 ?auto_2236152 ?auto_2236153 ?auto_2236154 ?auto_2236155 ?auto_2236156 ?auto_2236157 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2236165 - SURFACE
      ?auto_2236166 - SURFACE
      ?auto_2236167 - SURFACE
      ?auto_2236169 - SURFACE
      ?auto_2236168 - SURFACE
      ?auto_2236170 - SURFACE
      ?auto_2236171 - SURFACE
      ?auto_2236172 - SURFACE
      ?auto_2236173 - SURFACE
      ?auto_2236174 - SURFACE
      ?auto_2236175 - SURFACE
      ?auto_2236176 - SURFACE
      ?auto_2236177 - SURFACE
      ?auto_2236178 - SURFACE
      ?auto_2236179 - SURFACE
      ?auto_2236180 - SURFACE
      ?auto_2236181 - SURFACE
    )
    :vars
    (
      ?auto_2236183 - HOIST
      ?auto_2236185 - PLACE
      ?auto_2236187 - PLACE
      ?auto_2236184 - HOIST
      ?auto_2236188 - SURFACE
      ?auto_2236186 - SURFACE
      ?auto_2236182 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2236183 ?auto_2236185 ) ( IS-CRATE ?auto_2236181 ) ( not ( = ?auto_2236180 ?auto_2236181 ) ) ( not ( = ?auto_2236179 ?auto_2236180 ) ) ( not ( = ?auto_2236179 ?auto_2236181 ) ) ( not ( = ?auto_2236187 ?auto_2236185 ) ) ( HOIST-AT ?auto_2236184 ?auto_2236187 ) ( not ( = ?auto_2236183 ?auto_2236184 ) ) ( SURFACE-AT ?auto_2236181 ?auto_2236187 ) ( ON ?auto_2236181 ?auto_2236188 ) ( CLEAR ?auto_2236181 ) ( not ( = ?auto_2236180 ?auto_2236188 ) ) ( not ( = ?auto_2236181 ?auto_2236188 ) ) ( not ( = ?auto_2236179 ?auto_2236188 ) ) ( IS-CRATE ?auto_2236180 ) ( AVAILABLE ?auto_2236184 ) ( SURFACE-AT ?auto_2236180 ?auto_2236187 ) ( ON ?auto_2236180 ?auto_2236186 ) ( CLEAR ?auto_2236180 ) ( not ( = ?auto_2236180 ?auto_2236186 ) ) ( not ( = ?auto_2236181 ?auto_2236186 ) ) ( not ( = ?auto_2236179 ?auto_2236186 ) ) ( not ( = ?auto_2236188 ?auto_2236186 ) ) ( TRUCK-AT ?auto_2236182 ?auto_2236185 ) ( SURFACE-AT ?auto_2236178 ?auto_2236185 ) ( CLEAR ?auto_2236178 ) ( LIFTING ?auto_2236183 ?auto_2236179 ) ( IS-CRATE ?auto_2236179 ) ( not ( = ?auto_2236178 ?auto_2236179 ) ) ( not ( = ?auto_2236180 ?auto_2236178 ) ) ( not ( = ?auto_2236181 ?auto_2236178 ) ) ( not ( = ?auto_2236188 ?auto_2236178 ) ) ( not ( = ?auto_2236186 ?auto_2236178 ) ) ( ON ?auto_2236166 ?auto_2236165 ) ( ON ?auto_2236167 ?auto_2236166 ) ( ON ?auto_2236169 ?auto_2236167 ) ( ON ?auto_2236168 ?auto_2236169 ) ( ON ?auto_2236170 ?auto_2236168 ) ( ON ?auto_2236171 ?auto_2236170 ) ( ON ?auto_2236172 ?auto_2236171 ) ( ON ?auto_2236173 ?auto_2236172 ) ( ON ?auto_2236174 ?auto_2236173 ) ( ON ?auto_2236175 ?auto_2236174 ) ( ON ?auto_2236176 ?auto_2236175 ) ( ON ?auto_2236177 ?auto_2236176 ) ( ON ?auto_2236178 ?auto_2236177 ) ( not ( = ?auto_2236165 ?auto_2236166 ) ) ( not ( = ?auto_2236165 ?auto_2236167 ) ) ( not ( = ?auto_2236165 ?auto_2236169 ) ) ( not ( = ?auto_2236165 ?auto_2236168 ) ) ( not ( = ?auto_2236165 ?auto_2236170 ) ) ( not ( = ?auto_2236165 ?auto_2236171 ) ) ( not ( = ?auto_2236165 ?auto_2236172 ) ) ( not ( = ?auto_2236165 ?auto_2236173 ) ) ( not ( = ?auto_2236165 ?auto_2236174 ) ) ( not ( = ?auto_2236165 ?auto_2236175 ) ) ( not ( = ?auto_2236165 ?auto_2236176 ) ) ( not ( = ?auto_2236165 ?auto_2236177 ) ) ( not ( = ?auto_2236165 ?auto_2236178 ) ) ( not ( = ?auto_2236165 ?auto_2236179 ) ) ( not ( = ?auto_2236165 ?auto_2236180 ) ) ( not ( = ?auto_2236165 ?auto_2236181 ) ) ( not ( = ?auto_2236165 ?auto_2236188 ) ) ( not ( = ?auto_2236165 ?auto_2236186 ) ) ( not ( = ?auto_2236166 ?auto_2236167 ) ) ( not ( = ?auto_2236166 ?auto_2236169 ) ) ( not ( = ?auto_2236166 ?auto_2236168 ) ) ( not ( = ?auto_2236166 ?auto_2236170 ) ) ( not ( = ?auto_2236166 ?auto_2236171 ) ) ( not ( = ?auto_2236166 ?auto_2236172 ) ) ( not ( = ?auto_2236166 ?auto_2236173 ) ) ( not ( = ?auto_2236166 ?auto_2236174 ) ) ( not ( = ?auto_2236166 ?auto_2236175 ) ) ( not ( = ?auto_2236166 ?auto_2236176 ) ) ( not ( = ?auto_2236166 ?auto_2236177 ) ) ( not ( = ?auto_2236166 ?auto_2236178 ) ) ( not ( = ?auto_2236166 ?auto_2236179 ) ) ( not ( = ?auto_2236166 ?auto_2236180 ) ) ( not ( = ?auto_2236166 ?auto_2236181 ) ) ( not ( = ?auto_2236166 ?auto_2236188 ) ) ( not ( = ?auto_2236166 ?auto_2236186 ) ) ( not ( = ?auto_2236167 ?auto_2236169 ) ) ( not ( = ?auto_2236167 ?auto_2236168 ) ) ( not ( = ?auto_2236167 ?auto_2236170 ) ) ( not ( = ?auto_2236167 ?auto_2236171 ) ) ( not ( = ?auto_2236167 ?auto_2236172 ) ) ( not ( = ?auto_2236167 ?auto_2236173 ) ) ( not ( = ?auto_2236167 ?auto_2236174 ) ) ( not ( = ?auto_2236167 ?auto_2236175 ) ) ( not ( = ?auto_2236167 ?auto_2236176 ) ) ( not ( = ?auto_2236167 ?auto_2236177 ) ) ( not ( = ?auto_2236167 ?auto_2236178 ) ) ( not ( = ?auto_2236167 ?auto_2236179 ) ) ( not ( = ?auto_2236167 ?auto_2236180 ) ) ( not ( = ?auto_2236167 ?auto_2236181 ) ) ( not ( = ?auto_2236167 ?auto_2236188 ) ) ( not ( = ?auto_2236167 ?auto_2236186 ) ) ( not ( = ?auto_2236169 ?auto_2236168 ) ) ( not ( = ?auto_2236169 ?auto_2236170 ) ) ( not ( = ?auto_2236169 ?auto_2236171 ) ) ( not ( = ?auto_2236169 ?auto_2236172 ) ) ( not ( = ?auto_2236169 ?auto_2236173 ) ) ( not ( = ?auto_2236169 ?auto_2236174 ) ) ( not ( = ?auto_2236169 ?auto_2236175 ) ) ( not ( = ?auto_2236169 ?auto_2236176 ) ) ( not ( = ?auto_2236169 ?auto_2236177 ) ) ( not ( = ?auto_2236169 ?auto_2236178 ) ) ( not ( = ?auto_2236169 ?auto_2236179 ) ) ( not ( = ?auto_2236169 ?auto_2236180 ) ) ( not ( = ?auto_2236169 ?auto_2236181 ) ) ( not ( = ?auto_2236169 ?auto_2236188 ) ) ( not ( = ?auto_2236169 ?auto_2236186 ) ) ( not ( = ?auto_2236168 ?auto_2236170 ) ) ( not ( = ?auto_2236168 ?auto_2236171 ) ) ( not ( = ?auto_2236168 ?auto_2236172 ) ) ( not ( = ?auto_2236168 ?auto_2236173 ) ) ( not ( = ?auto_2236168 ?auto_2236174 ) ) ( not ( = ?auto_2236168 ?auto_2236175 ) ) ( not ( = ?auto_2236168 ?auto_2236176 ) ) ( not ( = ?auto_2236168 ?auto_2236177 ) ) ( not ( = ?auto_2236168 ?auto_2236178 ) ) ( not ( = ?auto_2236168 ?auto_2236179 ) ) ( not ( = ?auto_2236168 ?auto_2236180 ) ) ( not ( = ?auto_2236168 ?auto_2236181 ) ) ( not ( = ?auto_2236168 ?auto_2236188 ) ) ( not ( = ?auto_2236168 ?auto_2236186 ) ) ( not ( = ?auto_2236170 ?auto_2236171 ) ) ( not ( = ?auto_2236170 ?auto_2236172 ) ) ( not ( = ?auto_2236170 ?auto_2236173 ) ) ( not ( = ?auto_2236170 ?auto_2236174 ) ) ( not ( = ?auto_2236170 ?auto_2236175 ) ) ( not ( = ?auto_2236170 ?auto_2236176 ) ) ( not ( = ?auto_2236170 ?auto_2236177 ) ) ( not ( = ?auto_2236170 ?auto_2236178 ) ) ( not ( = ?auto_2236170 ?auto_2236179 ) ) ( not ( = ?auto_2236170 ?auto_2236180 ) ) ( not ( = ?auto_2236170 ?auto_2236181 ) ) ( not ( = ?auto_2236170 ?auto_2236188 ) ) ( not ( = ?auto_2236170 ?auto_2236186 ) ) ( not ( = ?auto_2236171 ?auto_2236172 ) ) ( not ( = ?auto_2236171 ?auto_2236173 ) ) ( not ( = ?auto_2236171 ?auto_2236174 ) ) ( not ( = ?auto_2236171 ?auto_2236175 ) ) ( not ( = ?auto_2236171 ?auto_2236176 ) ) ( not ( = ?auto_2236171 ?auto_2236177 ) ) ( not ( = ?auto_2236171 ?auto_2236178 ) ) ( not ( = ?auto_2236171 ?auto_2236179 ) ) ( not ( = ?auto_2236171 ?auto_2236180 ) ) ( not ( = ?auto_2236171 ?auto_2236181 ) ) ( not ( = ?auto_2236171 ?auto_2236188 ) ) ( not ( = ?auto_2236171 ?auto_2236186 ) ) ( not ( = ?auto_2236172 ?auto_2236173 ) ) ( not ( = ?auto_2236172 ?auto_2236174 ) ) ( not ( = ?auto_2236172 ?auto_2236175 ) ) ( not ( = ?auto_2236172 ?auto_2236176 ) ) ( not ( = ?auto_2236172 ?auto_2236177 ) ) ( not ( = ?auto_2236172 ?auto_2236178 ) ) ( not ( = ?auto_2236172 ?auto_2236179 ) ) ( not ( = ?auto_2236172 ?auto_2236180 ) ) ( not ( = ?auto_2236172 ?auto_2236181 ) ) ( not ( = ?auto_2236172 ?auto_2236188 ) ) ( not ( = ?auto_2236172 ?auto_2236186 ) ) ( not ( = ?auto_2236173 ?auto_2236174 ) ) ( not ( = ?auto_2236173 ?auto_2236175 ) ) ( not ( = ?auto_2236173 ?auto_2236176 ) ) ( not ( = ?auto_2236173 ?auto_2236177 ) ) ( not ( = ?auto_2236173 ?auto_2236178 ) ) ( not ( = ?auto_2236173 ?auto_2236179 ) ) ( not ( = ?auto_2236173 ?auto_2236180 ) ) ( not ( = ?auto_2236173 ?auto_2236181 ) ) ( not ( = ?auto_2236173 ?auto_2236188 ) ) ( not ( = ?auto_2236173 ?auto_2236186 ) ) ( not ( = ?auto_2236174 ?auto_2236175 ) ) ( not ( = ?auto_2236174 ?auto_2236176 ) ) ( not ( = ?auto_2236174 ?auto_2236177 ) ) ( not ( = ?auto_2236174 ?auto_2236178 ) ) ( not ( = ?auto_2236174 ?auto_2236179 ) ) ( not ( = ?auto_2236174 ?auto_2236180 ) ) ( not ( = ?auto_2236174 ?auto_2236181 ) ) ( not ( = ?auto_2236174 ?auto_2236188 ) ) ( not ( = ?auto_2236174 ?auto_2236186 ) ) ( not ( = ?auto_2236175 ?auto_2236176 ) ) ( not ( = ?auto_2236175 ?auto_2236177 ) ) ( not ( = ?auto_2236175 ?auto_2236178 ) ) ( not ( = ?auto_2236175 ?auto_2236179 ) ) ( not ( = ?auto_2236175 ?auto_2236180 ) ) ( not ( = ?auto_2236175 ?auto_2236181 ) ) ( not ( = ?auto_2236175 ?auto_2236188 ) ) ( not ( = ?auto_2236175 ?auto_2236186 ) ) ( not ( = ?auto_2236176 ?auto_2236177 ) ) ( not ( = ?auto_2236176 ?auto_2236178 ) ) ( not ( = ?auto_2236176 ?auto_2236179 ) ) ( not ( = ?auto_2236176 ?auto_2236180 ) ) ( not ( = ?auto_2236176 ?auto_2236181 ) ) ( not ( = ?auto_2236176 ?auto_2236188 ) ) ( not ( = ?auto_2236176 ?auto_2236186 ) ) ( not ( = ?auto_2236177 ?auto_2236178 ) ) ( not ( = ?auto_2236177 ?auto_2236179 ) ) ( not ( = ?auto_2236177 ?auto_2236180 ) ) ( not ( = ?auto_2236177 ?auto_2236181 ) ) ( not ( = ?auto_2236177 ?auto_2236188 ) ) ( not ( = ?auto_2236177 ?auto_2236186 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2236179 ?auto_2236180 ?auto_2236181 )
      ( MAKE-16CRATE-VERIFY ?auto_2236165 ?auto_2236166 ?auto_2236167 ?auto_2236169 ?auto_2236168 ?auto_2236170 ?auto_2236171 ?auto_2236172 ?auto_2236173 ?auto_2236174 ?auto_2236175 ?auto_2236176 ?auto_2236177 ?auto_2236178 ?auto_2236179 ?auto_2236180 ?auto_2236181 ) )
  )

)

