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
      ?auto_27090 - SURFACE
      ?auto_27091 - SURFACE
    )
    :vars
    (
      ?auto_27092 - HOIST
      ?auto_27093 - PLACE
      ?auto_27095 - PLACE
      ?auto_27096 - HOIST
      ?auto_27097 - SURFACE
      ?auto_27094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27092 ?auto_27093 ) ( SURFACE-AT ?auto_27090 ?auto_27093 ) ( CLEAR ?auto_27090 ) ( IS-CRATE ?auto_27091 ) ( AVAILABLE ?auto_27092 ) ( not ( = ?auto_27095 ?auto_27093 ) ) ( HOIST-AT ?auto_27096 ?auto_27095 ) ( AVAILABLE ?auto_27096 ) ( SURFACE-AT ?auto_27091 ?auto_27095 ) ( ON ?auto_27091 ?auto_27097 ) ( CLEAR ?auto_27091 ) ( TRUCK-AT ?auto_27094 ?auto_27093 ) ( not ( = ?auto_27090 ?auto_27091 ) ) ( not ( = ?auto_27090 ?auto_27097 ) ) ( not ( = ?auto_27091 ?auto_27097 ) ) ( not ( = ?auto_27092 ?auto_27096 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27094 ?auto_27093 ?auto_27095 )
      ( !LIFT ?auto_27096 ?auto_27091 ?auto_27097 ?auto_27095 )
      ( !LOAD ?auto_27096 ?auto_27091 ?auto_27094 ?auto_27095 )
      ( !DRIVE ?auto_27094 ?auto_27095 ?auto_27093 )
      ( !UNLOAD ?auto_27092 ?auto_27091 ?auto_27094 ?auto_27093 )
      ( !DROP ?auto_27092 ?auto_27091 ?auto_27090 ?auto_27093 )
      ( MAKE-1CRATE-VERIFY ?auto_27090 ?auto_27091 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27100 - SURFACE
      ?auto_27101 - SURFACE
    )
    :vars
    (
      ?auto_27102 - HOIST
      ?auto_27103 - PLACE
      ?auto_27105 - PLACE
      ?auto_27106 - HOIST
      ?auto_27107 - SURFACE
      ?auto_27104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27102 ?auto_27103 ) ( SURFACE-AT ?auto_27100 ?auto_27103 ) ( CLEAR ?auto_27100 ) ( IS-CRATE ?auto_27101 ) ( AVAILABLE ?auto_27102 ) ( not ( = ?auto_27105 ?auto_27103 ) ) ( HOIST-AT ?auto_27106 ?auto_27105 ) ( AVAILABLE ?auto_27106 ) ( SURFACE-AT ?auto_27101 ?auto_27105 ) ( ON ?auto_27101 ?auto_27107 ) ( CLEAR ?auto_27101 ) ( TRUCK-AT ?auto_27104 ?auto_27103 ) ( not ( = ?auto_27100 ?auto_27101 ) ) ( not ( = ?auto_27100 ?auto_27107 ) ) ( not ( = ?auto_27101 ?auto_27107 ) ) ( not ( = ?auto_27102 ?auto_27106 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27104 ?auto_27103 ?auto_27105 )
      ( !LIFT ?auto_27106 ?auto_27101 ?auto_27107 ?auto_27105 )
      ( !LOAD ?auto_27106 ?auto_27101 ?auto_27104 ?auto_27105 )
      ( !DRIVE ?auto_27104 ?auto_27105 ?auto_27103 )
      ( !UNLOAD ?auto_27102 ?auto_27101 ?auto_27104 ?auto_27103 )
      ( !DROP ?auto_27102 ?auto_27101 ?auto_27100 ?auto_27103 )
      ( MAKE-1CRATE-VERIFY ?auto_27100 ?auto_27101 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27111 - SURFACE
      ?auto_27112 - SURFACE
      ?auto_27113 - SURFACE
    )
    :vars
    (
      ?auto_27118 - HOIST
      ?auto_27114 - PLACE
      ?auto_27119 - PLACE
      ?auto_27116 - HOIST
      ?auto_27117 - SURFACE
      ?auto_27121 - PLACE
      ?auto_27122 - HOIST
      ?auto_27120 - SURFACE
      ?auto_27115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27118 ?auto_27114 ) ( IS-CRATE ?auto_27113 ) ( not ( = ?auto_27119 ?auto_27114 ) ) ( HOIST-AT ?auto_27116 ?auto_27119 ) ( AVAILABLE ?auto_27116 ) ( SURFACE-AT ?auto_27113 ?auto_27119 ) ( ON ?auto_27113 ?auto_27117 ) ( CLEAR ?auto_27113 ) ( not ( = ?auto_27112 ?auto_27113 ) ) ( not ( = ?auto_27112 ?auto_27117 ) ) ( not ( = ?auto_27113 ?auto_27117 ) ) ( not ( = ?auto_27118 ?auto_27116 ) ) ( SURFACE-AT ?auto_27111 ?auto_27114 ) ( CLEAR ?auto_27111 ) ( IS-CRATE ?auto_27112 ) ( AVAILABLE ?auto_27118 ) ( not ( = ?auto_27121 ?auto_27114 ) ) ( HOIST-AT ?auto_27122 ?auto_27121 ) ( AVAILABLE ?auto_27122 ) ( SURFACE-AT ?auto_27112 ?auto_27121 ) ( ON ?auto_27112 ?auto_27120 ) ( CLEAR ?auto_27112 ) ( TRUCK-AT ?auto_27115 ?auto_27114 ) ( not ( = ?auto_27111 ?auto_27112 ) ) ( not ( = ?auto_27111 ?auto_27120 ) ) ( not ( = ?auto_27112 ?auto_27120 ) ) ( not ( = ?auto_27118 ?auto_27122 ) ) ( not ( = ?auto_27111 ?auto_27113 ) ) ( not ( = ?auto_27111 ?auto_27117 ) ) ( not ( = ?auto_27113 ?auto_27120 ) ) ( not ( = ?auto_27119 ?auto_27121 ) ) ( not ( = ?auto_27116 ?auto_27122 ) ) ( not ( = ?auto_27117 ?auto_27120 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27111 ?auto_27112 )
      ( MAKE-1CRATE ?auto_27112 ?auto_27113 )
      ( MAKE-2CRATE-VERIFY ?auto_27111 ?auto_27112 ?auto_27113 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27125 - SURFACE
      ?auto_27126 - SURFACE
    )
    :vars
    (
      ?auto_27127 - HOIST
      ?auto_27128 - PLACE
      ?auto_27130 - PLACE
      ?auto_27131 - HOIST
      ?auto_27132 - SURFACE
      ?auto_27129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27127 ?auto_27128 ) ( SURFACE-AT ?auto_27125 ?auto_27128 ) ( CLEAR ?auto_27125 ) ( IS-CRATE ?auto_27126 ) ( AVAILABLE ?auto_27127 ) ( not ( = ?auto_27130 ?auto_27128 ) ) ( HOIST-AT ?auto_27131 ?auto_27130 ) ( AVAILABLE ?auto_27131 ) ( SURFACE-AT ?auto_27126 ?auto_27130 ) ( ON ?auto_27126 ?auto_27132 ) ( CLEAR ?auto_27126 ) ( TRUCK-AT ?auto_27129 ?auto_27128 ) ( not ( = ?auto_27125 ?auto_27126 ) ) ( not ( = ?auto_27125 ?auto_27132 ) ) ( not ( = ?auto_27126 ?auto_27132 ) ) ( not ( = ?auto_27127 ?auto_27131 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27129 ?auto_27128 ?auto_27130 )
      ( !LIFT ?auto_27131 ?auto_27126 ?auto_27132 ?auto_27130 )
      ( !LOAD ?auto_27131 ?auto_27126 ?auto_27129 ?auto_27130 )
      ( !DRIVE ?auto_27129 ?auto_27130 ?auto_27128 )
      ( !UNLOAD ?auto_27127 ?auto_27126 ?auto_27129 ?auto_27128 )
      ( !DROP ?auto_27127 ?auto_27126 ?auto_27125 ?auto_27128 )
      ( MAKE-1CRATE-VERIFY ?auto_27125 ?auto_27126 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27137 - SURFACE
      ?auto_27138 - SURFACE
      ?auto_27139 - SURFACE
      ?auto_27140 - SURFACE
    )
    :vars
    (
      ?auto_27141 - HOIST
      ?auto_27146 - PLACE
      ?auto_27143 - PLACE
      ?auto_27144 - HOIST
      ?auto_27142 - SURFACE
      ?auto_27152 - PLACE
      ?auto_27149 - HOIST
      ?auto_27150 - SURFACE
      ?auto_27148 - PLACE
      ?auto_27151 - HOIST
      ?auto_27147 - SURFACE
      ?auto_27145 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27141 ?auto_27146 ) ( IS-CRATE ?auto_27140 ) ( not ( = ?auto_27143 ?auto_27146 ) ) ( HOIST-AT ?auto_27144 ?auto_27143 ) ( AVAILABLE ?auto_27144 ) ( SURFACE-AT ?auto_27140 ?auto_27143 ) ( ON ?auto_27140 ?auto_27142 ) ( CLEAR ?auto_27140 ) ( not ( = ?auto_27139 ?auto_27140 ) ) ( not ( = ?auto_27139 ?auto_27142 ) ) ( not ( = ?auto_27140 ?auto_27142 ) ) ( not ( = ?auto_27141 ?auto_27144 ) ) ( IS-CRATE ?auto_27139 ) ( not ( = ?auto_27152 ?auto_27146 ) ) ( HOIST-AT ?auto_27149 ?auto_27152 ) ( AVAILABLE ?auto_27149 ) ( SURFACE-AT ?auto_27139 ?auto_27152 ) ( ON ?auto_27139 ?auto_27150 ) ( CLEAR ?auto_27139 ) ( not ( = ?auto_27138 ?auto_27139 ) ) ( not ( = ?auto_27138 ?auto_27150 ) ) ( not ( = ?auto_27139 ?auto_27150 ) ) ( not ( = ?auto_27141 ?auto_27149 ) ) ( SURFACE-AT ?auto_27137 ?auto_27146 ) ( CLEAR ?auto_27137 ) ( IS-CRATE ?auto_27138 ) ( AVAILABLE ?auto_27141 ) ( not ( = ?auto_27148 ?auto_27146 ) ) ( HOIST-AT ?auto_27151 ?auto_27148 ) ( AVAILABLE ?auto_27151 ) ( SURFACE-AT ?auto_27138 ?auto_27148 ) ( ON ?auto_27138 ?auto_27147 ) ( CLEAR ?auto_27138 ) ( TRUCK-AT ?auto_27145 ?auto_27146 ) ( not ( = ?auto_27137 ?auto_27138 ) ) ( not ( = ?auto_27137 ?auto_27147 ) ) ( not ( = ?auto_27138 ?auto_27147 ) ) ( not ( = ?auto_27141 ?auto_27151 ) ) ( not ( = ?auto_27137 ?auto_27139 ) ) ( not ( = ?auto_27137 ?auto_27150 ) ) ( not ( = ?auto_27139 ?auto_27147 ) ) ( not ( = ?auto_27152 ?auto_27148 ) ) ( not ( = ?auto_27149 ?auto_27151 ) ) ( not ( = ?auto_27150 ?auto_27147 ) ) ( not ( = ?auto_27137 ?auto_27140 ) ) ( not ( = ?auto_27137 ?auto_27142 ) ) ( not ( = ?auto_27138 ?auto_27140 ) ) ( not ( = ?auto_27138 ?auto_27142 ) ) ( not ( = ?auto_27140 ?auto_27150 ) ) ( not ( = ?auto_27140 ?auto_27147 ) ) ( not ( = ?auto_27143 ?auto_27152 ) ) ( not ( = ?auto_27143 ?auto_27148 ) ) ( not ( = ?auto_27144 ?auto_27149 ) ) ( not ( = ?auto_27144 ?auto_27151 ) ) ( not ( = ?auto_27142 ?auto_27150 ) ) ( not ( = ?auto_27142 ?auto_27147 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27137 ?auto_27138 ?auto_27139 )
      ( MAKE-1CRATE ?auto_27139 ?auto_27140 )
      ( MAKE-3CRATE-VERIFY ?auto_27137 ?auto_27138 ?auto_27139 ?auto_27140 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27155 - SURFACE
      ?auto_27156 - SURFACE
    )
    :vars
    (
      ?auto_27157 - HOIST
      ?auto_27158 - PLACE
      ?auto_27160 - PLACE
      ?auto_27161 - HOIST
      ?auto_27162 - SURFACE
      ?auto_27159 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27157 ?auto_27158 ) ( SURFACE-AT ?auto_27155 ?auto_27158 ) ( CLEAR ?auto_27155 ) ( IS-CRATE ?auto_27156 ) ( AVAILABLE ?auto_27157 ) ( not ( = ?auto_27160 ?auto_27158 ) ) ( HOIST-AT ?auto_27161 ?auto_27160 ) ( AVAILABLE ?auto_27161 ) ( SURFACE-AT ?auto_27156 ?auto_27160 ) ( ON ?auto_27156 ?auto_27162 ) ( CLEAR ?auto_27156 ) ( TRUCK-AT ?auto_27159 ?auto_27158 ) ( not ( = ?auto_27155 ?auto_27156 ) ) ( not ( = ?auto_27155 ?auto_27162 ) ) ( not ( = ?auto_27156 ?auto_27162 ) ) ( not ( = ?auto_27157 ?auto_27161 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27159 ?auto_27158 ?auto_27160 )
      ( !LIFT ?auto_27161 ?auto_27156 ?auto_27162 ?auto_27160 )
      ( !LOAD ?auto_27161 ?auto_27156 ?auto_27159 ?auto_27160 )
      ( !DRIVE ?auto_27159 ?auto_27160 ?auto_27158 )
      ( !UNLOAD ?auto_27157 ?auto_27156 ?auto_27159 ?auto_27158 )
      ( !DROP ?auto_27157 ?auto_27156 ?auto_27155 ?auto_27158 )
      ( MAKE-1CRATE-VERIFY ?auto_27155 ?auto_27156 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27168 - SURFACE
      ?auto_27169 - SURFACE
      ?auto_27170 - SURFACE
      ?auto_27171 - SURFACE
      ?auto_27172 - SURFACE
    )
    :vars
    (
      ?auto_27177 - HOIST
      ?auto_27173 - PLACE
      ?auto_27175 - PLACE
      ?auto_27178 - HOIST
      ?auto_27176 - SURFACE
      ?auto_27186 - PLACE
      ?auto_27179 - HOIST
      ?auto_27184 - SURFACE
      ?auto_27180 - PLACE
      ?auto_27182 - HOIST
      ?auto_27185 - SURFACE
      ?auto_27181 - PLACE
      ?auto_27183 - HOIST
      ?auto_27187 - SURFACE
      ?auto_27174 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27177 ?auto_27173 ) ( IS-CRATE ?auto_27172 ) ( not ( = ?auto_27175 ?auto_27173 ) ) ( HOIST-AT ?auto_27178 ?auto_27175 ) ( AVAILABLE ?auto_27178 ) ( SURFACE-AT ?auto_27172 ?auto_27175 ) ( ON ?auto_27172 ?auto_27176 ) ( CLEAR ?auto_27172 ) ( not ( = ?auto_27171 ?auto_27172 ) ) ( not ( = ?auto_27171 ?auto_27176 ) ) ( not ( = ?auto_27172 ?auto_27176 ) ) ( not ( = ?auto_27177 ?auto_27178 ) ) ( IS-CRATE ?auto_27171 ) ( not ( = ?auto_27186 ?auto_27173 ) ) ( HOIST-AT ?auto_27179 ?auto_27186 ) ( AVAILABLE ?auto_27179 ) ( SURFACE-AT ?auto_27171 ?auto_27186 ) ( ON ?auto_27171 ?auto_27184 ) ( CLEAR ?auto_27171 ) ( not ( = ?auto_27170 ?auto_27171 ) ) ( not ( = ?auto_27170 ?auto_27184 ) ) ( not ( = ?auto_27171 ?auto_27184 ) ) ( not ( = ?auto_27177 ?auto_27179 ) ) ( IS-CRATE ?auto_27170 ) ( not ( = ?auto_27180 ?auto_27173 ) ) ( HOIST-AT ?auto_27182 ?auto_27180 ) ( AVAILABLE ?auto_27182 ) ( SURFACE-AT ?auto_27170 ?auto_27180 ) ( ON ?auto_27170 ?auto_27185 ) ( CLEAR ?auto_27170 ) ( not ( = ?auto_27169 ?auto_27170 ) ) ( not ( = ?auto_27169 ?auto_27185 ) ) ( not ( = ?auto_27170 ?auto_27185 ) ) ( not ( = ?auto_27177 ?auto_27182 ) ) ( SURFACE-AT ?auto_27168 ?auto_27173 ) ( CLEAR ?auto_27168 ) ( IS-CRATE ?auto_27169 ) ( AVAILABLE ?auto_27177 ) ( not ( = ?auto_27181 ?auto_27173 ) ) ( HOIST-AT ?auto_27183 ?auto_27181 ) ( AVAILABLE ?auto_27183 ) ( SURFACE-AT ?auto_27169 ?auto_27181 ) ( ON ?auto_27169 ?auto_27187 ) ( CLEAR ?auto_27169 ) ( TRUCK-AT ?auto_27174 ?auto_27173 ) ( not ( = ?auto_27168 ?auto_27169 ) ) ( not ( = ?auto_27168 ?auto_27187 ) ) ( not ( = ?auto_27169 ?auto_27187 ) ) ( not ( = ?auto_27177 ?auto_27183 ) ) ( not ( = ?auto_27168 ?auto_27170 ) ) ( not ( = ?auto_27168 ?auto_27185 ) ) ( not ( = ?auto_27170 ?auto_27187 ) ) ( not ( = ?auto_27180 ?auto_27181 ) ) ( not ( = ?auto_27182 ?auto_27183 ) ) ( not ( = ?auto_27185 ?auto_27187 ) ) ( not ( = ?auto_27168 ?auto_27171 ) ) ( not ( = ?auto_27168 ?auto_27184 ) ) ( not ( = ?auto_27169 ?auto_27171 ) ) ( not ( = ?auto_27169 ?auto_27184 ) ) ( not ( = ?auto_27171 ?auto_27185 ) ) ( not ( = ?auto_27171 ?auto_27187 ) ) ( not ( = ?auto_27186 ?auto_27180 ) ) ( not ( = ?auto_27186 ?auto_27181 ) ) ( not ( = ?auto_27179 ?auto_27182 ) ) ( not ( = ?auto_27179 ?auto_27183 ) ) ( not ( = ?auto_27184 ?auto_27185 ) ) ( not ( = ?auto_27184 ?auto_27187 ) ) ( not ( = ?auto_27168 ?auto_27172 ) ) ( not ( = ?auto_27168 ?auto_27176 ) ) ( not ( = ?auto_27169 ?auto_27172 ) ) ( not ( = ?auto_27169 ?auto_27176 ) ) ( not ( = ?auto_27170 ?auto_27172 ) ) ( not ( = ?auto_27170 ?auto_27176 ) ) ( not ( = ?auto_27172 ?auto_27184 ) ) ( not ( = ?auto_27172 ?auto_27185 ) ) ( not ( = ?auto_27172 ?auto_27187 ) ) ( not ( = ?auto_27175 ?auto_27186 ) ) ( not ( = ?auto_27175 ?auto_27180 ) ) ( not ( = ?auto_27175 ?auto_27181 ) ) ( not ( = ?auto_27178 ?auto_27179 ) ) ( not ( = ?auto_27178 ?auto_27182 ) ) ( not ( = ?auto_27178 ?auto_27183 ) ) ( not ( = ?auto_27176 ?auto_27184 ) ) ( not ( = ?auto_27176 ?auto_27185 ) ) ( not ( = ?auto_27176 ?auto_27187 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_27168 ?auto_27169 ?auto_27170 ?auto_27171 )
      ( MAKE-1CRATE ?auto_27171 ?auto_27172 )
      ( MAKE-4CRATE-VERIFY ?auto_27168 ?auto_27169 ?auto_27170 ?auto_27171 ?auto_27172 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27190 - SURFACE
      ?auto_27191 - SURFACE
    )
    :vars
    (
      ?auto_27192 - HOIST
      ?auto_27193 - PLACE
      ?auto_27195 - PLACE
      ?auto_27196 - HOIST
      ?auto_27197 - SURFACE
      ?auto_27194 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27192 ?auto_27193 ) ( SURFACE-AT ?auto_27190 ?auto_27193 ) ( CLEAR ?auto_27190 ) ( IS-CRATE ?auto_27191 ) ( AVAILABLE ?auto_27192 ) ( not ( = ?auto_27195 ?auto_27193 ) ) ( HOIST-AT ?auto_27196 ?auto_27195 ) ( AVAILABLE ?auto_27196 ) ( SURFACE-AT ?auto_27191 ?auto_27195 ) ( ON ?auto_27191 ?auto_27197 ) ( CLEAR ?auto_27191 ) ( TRUCK-AT ?auto_27194 ?auto_27193 ) ( not ( = ?auto_27190 ?auto_27191 ) ) ( not ( = ?auto_27190 ?auto_27197 ) ) ( not ( = ?auto_27191 ?auto_27197 ) ) ( not ( = ?auto_27192 ?auto_27196 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27194 ?auto_27193 ?auto_27195 )
      ( !LIFT ?auto_27196 ?auto_27191 ?auto_27197 ?auto_27195 )
      ( !LOAD ?auto_27196 ?auto_27191 ?auto_27194 ?auto_27195 )
      ( !DRIVE ?auto_27194 ?auto_27195 ?auto_27193 )
      ( !UNLOAD ?auto_27192 ?auto_27191 ?auto_27194 ?auto_27193 )
      ( !DROP ?auto_27192 ?auto_27191 ?auto_27190 ?auto_27193 )
      ( MAKE-1CRATE-VERIFY ?auto_27190 ?auto_27191 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27204 - SURFACE
      ?auto_27205 - SURFACE
      ?auto_27206 - SURFACE
      ?auto_27207 - SURFACE
      ?auto_27208 - SURFACE
      ?auto_27209 - SURFACE
    )
    :vars
    (
      ?auto_27212 - HOIST
      ?auto_27214 - PLACE
      ?auto_27213 - PLACE
      ?auto_27211 - HOIST
      ?auto_27210 - SURFACE
      ?auto_27224 - SURFACE
      ?auto_27223 - PLACE
      ?auto_27217 - HOIST
      ?auto_27220 - SURFACE
      ?auto_27222 - PLACE
      ?auto_27225 - HOIST
      ?auto_27219 - SURFACE
      ?auto_27221 - PLACE
      ?auto_27216 - HOIST
      ?auto_27218 - SURFACE
      ?auto_27215 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27212 ?auto_27214 ) ( IS-CRATE ?auto_27209 ) ( not ( = ?auto_27213 ?auto_27214 ) ) ( HOIST-AT ?auto_27211 ?auto_27213 ) ( SURFACE-AT ?auto_27209 ?auto_27213 ) ( ON ?auto_27209 ?auto_27210 ) ( CLEAR ?auto_27209 ) ( not ( = ?auto_27208 ?auto_27209 ) ) ( not ( = ?auto_27208 ?auto_27210 ) ) ( not ( = ?auto_27209 ?auto_27210 ) ) ( not ( = ?auto_27212 ?auto_27211 ) ) ( IS-CRATE ?auto_27208 ) ( AVAILABLE ?auto_27211 ) ( SURFACE-AT ?auto_27208 ?auto_27213 ) ( ON ?auto_27208 ?auto_27224 ) ( CLEAR ?auto_27208 ) ( not ( = ?auto_27207 ?auto_27208 ) ) ( not ( = ?auto_27207 ?auto_27224 ) ) ( not ( = ?auto_27208 ?auto_27224 ) ) ( IS-CRATE ?auto_27207 ) ( not ( = ?auto_27223 ?auto_27214 ) ) ( HOIST-AT ?auto_27217 ?auto_27223 ) ( AVAILABLE ?auto_27217 ) ( SURFACE-AT ?auto_27207 ?auto_27223 ) ( ON ?auto_27207 ?auto_27220 ) ( CLEAR ?auto_27207 ) ( not ( = ?auto_27206 ?auto_27207 ) ) ( not ( = ?auto_27206 ?auto_27220 ) ) ( not ( = ?auto_27207 ?auto_27220 ) ) ( not ( = ?auto_27212 ?auto_27217 ) ) ( IS-CRATE ?auto_27206 ) ( not ( = ?auto_27222 ?auto_27214 ) ) ( HOIST-AT ?auto_27225 ?auto_27222 ) ( AVAILABLE ?auto_27225 ) ( SURFACE-AT ?auto_27206 ?auto_27222 ) ( ON ?auto_27206 ?auto_27219 ) ( CLEAR ?auto_27206 ) ( not ( = ?auto_27205 ?auto_27206 ) ) ( not ( = ?auto_27205 ?auto_27219 ) ) ( not ( = ?auto_27206 ?auto_27219 ) ) ( not ( = ?auto_27212 ?auto_27225 ) ) ( SURFACE-AT ?auto_27204 ?auto_27214 ) ( CLEAR ?auto_27204 ) ( IS-CRATE ?auto_27205 ) ( AVAILABLE ?auto_27212 ) ( not ( = ?auto_27221 ?auto_27214 ) ) ( HOIST-AT ?auto_27216 ?auto_27221 ) ( AVAILABLE ?auto_27216 ) ( SURFACE-AT ?auto_27205 ?auto_27221 ) ( ON ?auto_27205 ?auto_27218 ) ( CLEAR ?auto_27205 ) ( TRUCK-AT ?auto_27215 ?auto_27214 ) ( not ( = ?auto_27204 ?auto_27205 ) ) ( not ( = ?auto_27204 ?auto_27218 ) ) ( not ( = ?auto_27205 ?auto_27218 ) ) ( not ( = ?auto_27212 ?auto_27216 ) ) ( not ( = ?auto_27204 ?auto_27206 ) ) ( not ( = ?auto_27204 ?auto_27219 ) ) ( not ( = ?auto_27206 ?auto_27218 ) ) ( not ( = ?auto_27222 ?auto_27221 ) ) ( not ( = ?auto_27225 ?auto_27216 ) ) ( not ( = ?auto_27219 ?auto_27218 ) ) ( not ( = ?auto_27204 ?auto_27207 ) ) ( not ( = ?auto_27204 ?auto_27220 ) ) ( not ( = ?auto_27205 ?auto_27207 ) ) ( not ( = ?auto_27205 ?auto_27220 ) ) ( not ( = ?auto_27207 ?auto_27219 ) ) ( not ( = ?auto_27207 ?auto_27218 ) ) ( not ( = ?auto_27223 ?auto_27222 ) ) ( not ( = ?auto_27223 ?auto_27221 ) ) ( not ( = ?auto_27217 ?auto_27225 ) ) ( not ( = ?auto_27217 ?auto_27216 ) ) ( not ( = ?auto_27220 ?auto_27219 ) ) ( not ( = ?auto_27220 ?auto_27218 ) ) ( not ( = ?auto_27204 ?auto_27208 ) ) ( not ( = ?auto_27204 ?auto_27224 ) ) ( not ( = ?auto_27205 ?auto_27208 ) ) ( not ( = ?auto_27205 ?auto_27224 ) ) ( not ( = ?auto_27206 ?auto_27208 ) ) ( not ( = ?auto_27206 ?auto_27224 ) ) ( not ( = ?auto_27208 ?auto_27220 ) ) ( not ( = ?auto_27208 ?auto_27219 ) ) ( not ( = ?auto_27208 ?auto_27218 ) ) ( not ( = ?auto_27213 ?auto_27223 ) ) ( not ( = ?auto_27213 ?auto_27222 ) ) ( not ( = ?auto_27213 ?auto_27221 ) ) ( not ( = ?auto_27211 ?auto_27217 ) ) ( not ( = ?auto_27211 ?auto_27225 ) ) ( not ( = ?auto_27211 ?auto_27216 ) ) ( not ( = ?auto_27224 ?auto_27220 ) ) ( not ( = ?auto_27224 ?auto_27219 ) ) ( not ( = ?auto_27224 ?auto_27218 ) ) ( not ( = ?auto_27204 ?auto_27209 ) ) ( not ( = ?auto_27204 ?auto_27210 ) ) ( not ( = ?auto_27205 ?auto_27209 ) ) ( not ( = ?auto_27205 ?auto_27210 ) ) ( not ( = ?auto_27206 ?auto_27209 ) ) ( not ( = ?auto_27206 ?auto_27210 ) ) ( not ( = ?auto_27207 ?auto_27209 ) ) ( not ( = ?auto_27207 ?auto_27210 ) ) ( not ( = ?auto_27209 ?auto_27224 ) ) ( not ( = ?auto_27209 ?auto_27220 ) ) ( not ( = ?auto_27209 ?auto_27219 ) ) ( not ( = ?auto_27209 ?auto_27218 ) ) ( not ( = ?auto_27210 ?auto_27224 ) ) ( not ( = ?auto_27210 ?auto_27220 ) ) ( not ( = ?auto_27210 ?auto_27219 ) ) ( not ( = ?auto_27210 ?auto_27218 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_27204 ?auto_27205 ?auto_27206 ?auto_27207 ?auto_27208 )
      ( MAKE-1CRATE ?auto_27208 ?auto_27209 )
      ( MAKE-5CRATE-VERIFY ?auto_27204 ?auto_27205 ?auto_27206 ?auto_27207 ?auto_27208 ?auto_27209 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27228 - SURFACE
      ?auto_27229 - SURFACE
    )
    :vars
    (
      ?auto_27230 - HOIST
      ?auto_27231 - PLACE
      ?auto_27233 - PLACE
      ?auto_27234 - HOIST
      ?auto_27235 - SURFACE
      ?auto_27232 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27230 ?auto_27231 ) ( SURFACE-AT ?auto_27228 ?auto_27231 ) ( CLEAR ?auto_27228 ) ( IS-CRATE ?auto_27229 ) ( AVAILABLE ?auto_27230 ) ( not ( = ?auto_27233 ?auto_27231 ) ) ( HOIST-AT ?auto_27234 ?auto_27233 ) ( AVAILABLE ?auto_27234 ) ( SURFACE-AT ?auto_27229 ?auto_27233 ) ( ON ?auto_27229 ?auto_27235 ) ( CLEAR ?auto_27229 ) ( TRUCK-AT ?auto_27232 ?auto_27231 ) ( not ( = ?auto_27228 ?auto_27229 ) ) ( not ( = ?auto_27228 ?auto_27235 ) ) ( not ( = ?auto_27229 ?auto_27235 ) ) ( not ( = ?auto_27230 ?auto_27234 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27232 ?auto_27231 ?auto_27233 )
      ( !LIFT ?auto_27234 ?auto_27229 ?auto_27235 ?auto_27233 )
      ( !LOAD ?auto_27234 ?auto_27229 ?auto_27232 ?auto_27233 )
      ( !DRIVE ?auto_27232 ?auto_27233 ?auto_27231 )
      ( !UNLOAD ?auto_27230 ?auto_27229 ?auto_27232 ?auto_27231 )
      ( !DROP ?auto_27230 ?auto_27229 ?auto_27228 ?auto_27231 )
      ( MAKE-1CRATE-VERIFY ?auto_27228 ?auto_27229 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_27243 - SURFACE
      ?auto_27244 - SURFACE
      ?auto_27245 - SURFACE
      ?auto_27246 - SURFACE
      ?auto_27247 - SURFACE
      ?auto_27248 - SURFACE
      ?auto_27249 - SURFACE
    )
    :vars
    (
      ?auto_27253 - HOIST
      ?auto_27255 - PLACE
      ?auto_27252 - PLACE
      ?auto_27254 - HOIST
      ?auto_27251 - SURFACE
      ?auto_27266 - PLACE
      ?auto_27257 - HOIST
      ?auto_27262 - SURFACE
      ?auto_27265 - SURFACE
      ?auto_27258 - PLACE
      ?auto_27259 - HOIST
      ?auto_27261 - SURFACE
      ?auto_27263 - PLACE
      ?auto_27260 - HOIST
      ?auto_27264 - SURFACE
      ?auto_27267 - PLACE
      ?auto_27256 - HOIST
      ?auto_27268 - SURFACE
      ?auto_27250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27253 ?auto_27255 ) ( IS-CRATE ?auto_27249 ) ( not ( = ?auto_27252 ?auto_27255 ) ) ( HOIST-AT ?auto_27254 ?auto_27252 ) ( AVAILABLE ?auto_27254 ) ( SURFACE-AT ?auto_27249 ?auto_27252 ) ( ON ?auto_27249 ?auto_27251 ) ( CLEAR ?auto_27249 ) ( not ( = ?auto_27248 ?auto_27249 ) ) ( not ( = ?auto_27248 ?auto_27251 ) ) ( not ( = ?auto_27249 ?auto_27251 ) ) ( not ( = ?auto_27253 ?auto_27254 ) ) ( IS-CRATE ?auto_27248 ) ( not ( = ?auto_27266 ?auto_27255 ) ) ( HOIST-AT ?auto_27257 ?auto_27266 ) ( SURFACE-AT ?auto_27248 ?auto_27266 ) ( ON ?auto_27248 ?auto_27262 ) ( CLEAR ?auto_27248 ) ( not ( = ?auto_27247 ?auto_27248 ) ) ( not ( = ?auto_27247 ?auto_27262 ) ) ( not ( = ?auto_27248 ?auto_27262 ) ) ( not ( = ?auto_27253 ?auto_27257 ) ) ( IS-CRATE ?auto_27247 ) ( AVAILABLE ?auto_27257 ) ( SURFACE-AT ?auto_27247 ?auto_27266 ) ( ON ?auto_27247 ?auto_27265 ) ( CLEAR ?auto_27247 ) ( not ( = ?auto_27246 ?auto_27247 ) ) ( not ( = ?auto_27246 ?auto_27265 ) ) ( not ( = ?auto_27247 ?auto_27265 ) ) ( IS-CRATE ?auto_27246 ) ( not ( = ?auto_27258 ?auto_27255 ) ) ( HOIST-AT ?auto_27259 ?auto_27258 ) ( AVAILABLE ?auto_27259 ) ( SURFACE-AT ?auto_27246 ?auto_27258 ) ( ON ?auto_27246 ?auto_27261 ) ( CLEAR ?auto_27246 ) ( not ( = ?auto_27245 ?auto_27246 ) ) ( not ( = ?auto_27245 ?auto_27261 ) ) ( not ( = ?auto_27246 ?auto_27261 ) ) ( not ( = ?auto_27253 ?auto_27259 ) ) ( IS-CRATE ?auto_27245 ) ( not ( = ?auto_27263 ?auto_27255 ) ) ( HOIST-AT ?auto_27260 ?auto_27263 ) ( AVAILABLE ?auto_27260 ) ( SURFACE-AT ?auto_27245 ?auto_27263 ) ( ON ?auto_27245 ?auto_27264 ) ( CLEAR ?auto_27245 ) ( not ( = ?auto_27244 ?auto_27245 ) ) ( not ( = ?auto_27244 ?auto_27264 ) ) ( not ( = ?auto_27245 ?auto_27264 ) ) ( not ( = ?auto_27253 ?auto_27260 ) ) ( SURFACE-AT ?auto_27243 ?auto_27255 ) ( CLEAR ?auto_27243 ) ( IS-CRATE ?auto_27244 ) ( AVAILABLE ?auto_27253 ) ( not ( = ?auto_27267 ?auto_27255 ) ) ( HOIST-AT ?auto_27256 ?auto_27267 ) ( AVAILABLE ?auto_27256 ) ( SURFACE-AT ?auto_27244 ?auto_27267 ) ( ON ?auto_27244 ?auto_27268 ) ( CLEAR ?auto_27244 ) ( TRUCK-AT ?auto_27250 ?auto_27255 ) ( not ( = ?auto_27243 ?auto_27244 ) ) ( not ( = ?auto_27243 ?auto_27268 ) ) ( not ( = ?auto_27244 ?auto_27268 ) ) ( not ( = ?auto_27253 ?auto_27256 ) ) ( not ( = ?auto_27243 ?auto_27245 ) ) ( not ( = ?auto_27243 ?auto_27264 ) ) ( not ( = ?auto_27245 ?auto_27268 ) ) ( not ( = ?auto_27263 ?auto_27267 ) ) ( not ( = ?auto_27260 ?auto_27256 ) ) ( not ( = ?auto_27264 ?auto_27268 ) ) ( not ( = ?auto_27243 ?auto_27246 ) ) ( not ( = ?auto_27243 ?auto_27261 ) ) ( not ( = ?auto_27244 ?auto_27246 ) ) ( not ( = ?auto_27244 ?auto_27261 ) ) ( not ( = ?auto_27246 ?auto_27264 ) ) ( not ( = ?auto_27246 ?auto_27268 ) ) ( not ( = ?auto_27258 ?auto_27263 ) ) ( not ( = ?auto_27258 ?auto_27267 ) ) ( not ( = ?auto_27259 ?auto_27260 ) ) ( not ( = ?auto_27259 ?auto_27256 ) ) ( not ( = ?auto_27261 ?auto_27264 ) ) ( not ( = ?auto_27261 ?auto_27268 ) ) ( not ( = ?auto_27243 ?auto_27247 ) ) ( not ( = ?auto_27243 ?auto_27265 ) ) ( not ( = ?auto_27244 ?auto_27247 ) ) ( not ( = ?auto_27244 ?auto_27265 ) ) ( not ( = ?auto_27245 ?auto_27247 ) ) ( not ( = ?auto_27245 ?auto_27265 ) ) ( not ( = ?auto_27247 ?auto_27261 ) ) ( not ( = ?auto_27247 ?auto_27264 ) ) ( not ( = ?auto_27247 ?auto_27268 ) ) ( not ( = ?auto_27266 ?auto_27258 ) ) ( not ( = ?auto_27266 ?auto_27263 ) ) ( not ( = ?auto_27266 ?auto_27267 ) ) ( not ( = ?auto_27257 ?auto_27259 ) ) ( not ( = ?auto_27257 ?auto_27260 ) ) ( not ( = ?auto_27257 ?auto_27256 ) ) ( not ( = ?auto_27265 ?auto_27261 ) ) ( not ( = ?auto_27265 ?auto_27264 ) ) ( not ( = ?auto_27265 ?auto_27268 ) ) ( not ( = ?auto_27243 ?auto_27248 ) ) ( not ( = ?auto_27243 ?auto_27262 ) ) ( not ( = ?auto_27244 ?auto_27248 ) ) ( not ( = ?auto_27244 ?auto_27262 ) ) ( not ( = ?auto_27245 ?auto_27248 ) ) ( not ( = ?auto_27245 ?auto_27262 ) ) ( not ( = ?auto_27246 ?auto_27248 ) ) ( not ( = ?auto_27246 ?auto_27262 ) ) ( not ( = ?auto_27248 ?auto_27265 ) ) ( not ( = ?auto_27248 ?auto_27261 ) ) ( not ( = ?auto_27248 ?auto_27264 ) ) ( not ( = ?auto_27248 ?auto_27268 ) ) ( not ( = ?auto_27262 ?auto_27265 ) ) ( not ( = ?auto_27262 ?auto_27261 ) ) ( not ( = ?auto_27262 ?auto_27264 ) ) ( not ( = ?auto_27262 ?auto_27268 ) ) ( not ( = ?auto_27243 ?auto_27249 ) ) ( not ( = ?auto_27243 ?auto_27251 ) ) ( not ( = ?auto_27244 ?auto_27249 ) ) ( not ( = ?auto_27244 ?auto_27251 ) ) ( not ( = ?auto_27245 ?auto_27249 ) ) ( not ( = ?auto_27245 ?auto_27251 ) ) ( not ( = ?auto_27246 ?auto_27249 ) ) ( not ( = ?auto_27246 ?auto_27251 ) ) ( not ( = ?auto_27247 ?auto_27249 ) ) ( not ( = ?auto_27247 ?auto_27251 ) ) ( not ( = ?auto_27249 ?auto_27262 ) ) ( not ( = ?auto_27249 ?auto_27265 ) ) ( not ( = ?auto_27249 ?auto_27261 ) ) ( not ( = ?auto_27249 ?auto_27264 ) ) ( not ( = ?auto_27249 ?auto_27268 ) ) ( not ( = ?auto_27252 ?auto_27266 ) ) ( not ( = ?auto_27252 ?auto_27258 ) ) ( not ( = ?auto_27252 ?auto_27263 ) ) ( not ( = ?auto_27252 ?auto_27267 ) ) ( not ( = ?auto_27254 ?auto_27257 ) ) ( not ( = ?auto_27254 ?auto_27259 ) ) ( not ( = ?auto_27254 ?auto_27260 ) ) ( not ( = ?auto_27254 ?auto_27256 ) ) ( not ( = ?auto_27251 ?auto_27262 ) ) ( not ( = ?auto_27251 ?auto_27265 ) ) ( not ( = ?auto_27251 ?auto_27261 ) ) ( not ( = ?auto_27251 ?auto_27264 ) ) ( not ( = ?auto_27251 ?auto_27268 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_27243 ?auto_27244 ?auto_27245 ?auto_27246 ?auto_27247 ?auto_27248 )
      ( MAKE-1CRATE ?auto_27248 ?auto_27249 )
      ( MAKE-6CRATE-VERIFY ?auto_27243 ?auto_27244 ?auto_27245 ?auto_27246 ?auto_27247 ?auto_27248 ?auto_27249 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27271 - SURFACE
      ?auto_27272 - SURFACE
    )
    :vars
    (
      ?auto_27273 - HOIST
      ?auto_27274 - PLACE
      ?auto_27276 - PLACE
      ?auto_27277 - HOIST
      ?auto_27278 - SURFACE
      ?auto_27275 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27273 ?auto_27274 ) ( SURFACE-AT ?auto_27271 ?auto_27274 ) ( CLEAR ?auto_27271 ) ( IS-CRATE ?auto_27272 ) ( AVAILABLE ?auto_27273 ) ( not ( = ?auto_27276 ?auto_27274 ) ) ( HOIST-AT ?auto_27277 ?auto_27276 ) ( AVAILABLE ?auto_27277 ) ( SURFACE-AT ?auto_27272 ?auto_27276 ) ( ON ?auto_27272 ?auto_27278 ) ( CLEAR ?auto_27272 ) ( TRUCK-AT ?auto_27275 ?auto_27274 ) ( not ( = ?auto_27271 ?auto_27272 ) ) ( not ( = ?auto_27271 ?auto_27278 ) ) ( not ( = ?auto_27272 ?auto_27278 ) ) ( not ( = ?auto_27273 ?auto_27277 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27275 ?auto_27274 ?auto_27276 )
      ( !LIFT ?auto_27277 ?auto_27272 ?auto_27278 ?auto_27276 )
      ( !LOAD ?auto_27277 ?auto_27272 ?auto_27275 ?auto_27276 )
      ( !DRIVE ?auto_27275 ?auto_27276 ?auto_27274 )
      ( !UNLOAD ?auto_27273 ?auto_27272 ?auto_27275 ?auto_27274 )
      ( !DROP ?auto_27273 ?auto_27272 ?auto_27271 ?auto_27274 )
      ( MAKE-1CRATE-VERIFY ?auto_27271 ?auto_27272 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_27287 - SURFACE
      ?auto_27288 - SURFACE
      ?auto_27289 - SURFACE
      ?auto_27290 - SURFACE
      ?auto_27291 - SURFACE
      ?auto_27292 - SURFACE
      ?auto_27293 - SURFACE
      ?auto_27294 - SURFACE
    )
    :vars
    (
      ?auto_27298 - HOIST
      ?auto_27299 - PLACE
      ?auto_27297 - PLACE
      ?auto_27295 - HOIST
      ?auto_27296 - SURFACE
      ?auto_27311 - PLACE
      ?auto_27309 - HOIST
      ?auto_27307 - SURFACE
      ?auto_27304 - PLACE
      ?auto_27314 - HOIST
      ?auto_27315 - SURFACE
      ?auto_27305 - SURFACE
      ?auto_27312 - PLACE
      ?auto_27313 - HOIST
      ?auto_27316 - SURFACE
      ?auto_27303 - PLACE
      ?auto_27308 - HOIST
      ?auto_27306 - SURFACE
      ?auto_27301 - PLACE
      ?auto_27310 - HOIST
      ?auto_27302 - SURFACE
      ?auto_27300 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27298 ?auto_27299 ) ( IS-CRATE ?auto_27294 ) ( not ( = ?auto_27297 ?auto_27299 ) ) ( HOIST-AT ?auto_27295 ?auto_27297 ) ( AVAILABLE ?auto_27295 ) ( SURFACE-AT ?auto_27294 ?auto_27297 ) ( ON ?auto_27294 ?auto_27296 ) ( CLEAR ?auto_27294 ) ( not ( = ?auto_27293 ?auto_27294 ) ) ( not ( = ?auto_27293 ?auto_27296 ) ) ( not ( = ?auto_27294 ?auto_27296 ) ) ( not ( = ?auto_27298 ?auto_27295 ) ) ( IS-CRATE ?auto_27293 ) ( not ( = ?auto_27311 ?auto_27299 ) ) ( HOIST-AT ?auto_27309 ?auto_27311 ) ( AVAILABLE ?auto_27309 ) ( SURFACE-AT ?auto_27293 ?auto_27311 ) ( ON ?auto_27293 ?auto_27307 ) ( CLEAR ?auto_27293 ) ( not ( = ?auto_27292 ?auto_27293 ) ) ( not ( = ?auto_27292 ?auto_27307 ) ) ( not ( = ?auto_27293 ?auto_27307 ) ) ( not ( = ?auto_27298 ?auto_27309 ) ) ( IS-CRATE ?auto_27292 ) ( not ( = ?auto_27304 ?auto_27299 ) ) ( HOIST-AT ?auto_27314 ?auto_27304 ) ( SURFACE-AT ?auto_27292 ?auto_27304 ) ( ON ?auto_27292 ?auto_27315 ) ( CLEAR ?auto_27292 ) ( not ( = ?auto_27291 ?auto_27292 ) ) ( not ( = ?auto_27291 ?auto_27315 ) ) ( not ( = ?auto_27292 ?auto_27315 ) ) ( not ( = ?auto_27298 ?auto_27314 ) ) ( IS-CRATE ?auto_27291 ) ( AVAILABLE ?auto_27314 ) ( SURFACE-AT ?auto_27291 ?auto_27304 ) ( ON ?auto_27291 ?auto_27305 ) ( CLEAR ?auto_27291 ) ( not ( = ?auto_27290 ?auto_27291 ) ) ( not ( = ?auto_27290 ?auto_27305 ) ) ( not ( = ?auto_27291 ?auto_27305 ) ) ( IS-CRATE ?auto_27290 ) ( not ( = ?auto_27312 ?auto_27299 ) ) ( HOIST-AT ?auto_27313 ?auto_27312 ) ( AVAILABLE ?auto_27313 ) ( SURFACE-AT ?auto_27290 ?auto_27312 ) ( ON ?auto_27290 ?auto_27316 ) ( CLEAR ?auto_27290 ) ( not ( = ?auto_27289 ?auto_27290 ) ) ( not ( = ?auto_27289 ?auto_27316 ) ) ( not ( = ?auto_27290 ?auto_27316 ) ) ( not ( = ?auto_27298 ?auto_27313 ) ) ( IS-CRATE ?auto_27289 ) ( not ( = ?auto_27303 ?auto_27299 ) ) ( HOIST-AT ?auto_27308 ?auto_27303 ) ( AVAILABLE ?auto_27308 ) ( SURFACE-AT ?auto_27289 ?auto_27303 ) ( ON ?auto_27289 ?auto_27306 ) ( CLEAR ?auto_27289 ) ( not ( = ?auto_27288 ?auto_27289 ) ) ( not ( = ?auto_27288 ?auto_27306 ) ) ( not ( = ?auto_27289 ?auto_27306 ) ) ( not ( = ?auto_27298 ?auto_27308 ) ) ( SURFACE-AT ?auto_27287 ?auto_27299 ) ( CLEAR ?auto_27287 ) ( IS-CRATE ?auto_27288 ) ( AVAILABLE ?auto_27298 ) ( not ( = ?auto_27301 ?auto_27299 ) ) ( HOIST-AT ?auto_27310 ?auto_27301 ) ( AVAILABLE ?auto_27310 ) ( SURFACE-AT ?auto_27288 ?auto_27301 ) ( ON ?auto_27288 ?auto_27302 ) ( CLEAR ?auto_27288 ) ( TRUCK-AT ?auto_27300 ?auto_27299 ) ( not ( = ?auto_27287 ?auto_27288 ) ) ( not ( = ?auto_27287 ?auto_27302 ) ) ( not ( = ?auto_27288 ?auto_27302 ) ) ( not ( = ?auto_27298 ?auto_27310 ) ) ( not ( = ?auto_27287 ?auto_27289 ) ) ( not ( = ?auto_27287 ?auto_27306 ) ) ( not ( = ?auto_27289 ?auto_27302 ) ) ( not ( = ?auto_27303 ?auto_27301 ) ) ( not ( = ?auto_27308 ?auto_27310 ) ) ( not ( = ?auto_27306 ?auto_27302 ) ) ( not ( = ?auto_27287 ?auto_27290 ) ) ( not ( = ?auto_27287 ?auto_27316 ) ) ( not ( = ?auto_27288 ?auto_27290 ) ) ( not ( = ?auto_27288 ?auto_27316 ) ) ( not ( = ?auto_27290 ?auto_27306 ) ) ( not ( = ?auto_27290 ?auto_27302 ) ) ( not ( = ?auto_27312 ?auto_27303 ) ) ( not ( = ?auto_27312 ?auto_27301 ) ) ( not ( = ?auto_27313 ?auto_27308 ) ) ( not ( = ?auto_27313 ?auto_27310 ) ) ( not ( = ?auto_27316 ?auto_27306 ) ) ( not ( = ?auto_27316 ?auto_27302 ) ) ( not ( = ?auto_27287 ?auto_27291 ) ) ( not ( = ?auto_27287 ?auto_27305 ) ) ( not ( = ?auto_27288 ?auto_27291 ) ) ( not ( = ?auto_27288 ?auto_27305 ) ) ( not ( = ?auto_27289 ?auto_27291 ) ) ( not ( = ?auto_27289 ?auto_27305 ) ) ( not ( = ?auto_27291 ?auto_27316 ) ) ( not ( = ?auto_27291 ?auto_27306 ) ) ( not ( = ?auto_27291 ?auto_27302 ) ) ( not ( = ?auto_27304 ?auto_27312 ) ) ( not ( = ?auto_27304 ?auto_27303 ) ) ( not ( = ?auto_27304 ?auto_27301 ) ) ( not ( = ?auto_27314 ?auto_27313 ) ) ( not ( = ?auto_27314 ?auto_27308 ) ) ( not ( = ?auto_27314 ?auto_27310 ) ) ( not ( = ?auto_27305 ?auto_27316 ) ) ( not ( = ?auto_27305 ?auto_27306 ) ) ( not ( = ?auto_27305 ?auto_27302 ) ) ( not ( = ?auto_27287 ?auto_27292 ) ) ( not ( = ?auto_27287 ?auto_27315 ) ) ( not ( = ?auto_27288 ?auto_27292 ) ) ( not ( = ?auto_27288 ?auto_27315 ) ) ( not ( = ?auto_27289 ?auto_27292 ) ) ( not ( = ?auto_27289 ?auto_27315 ) ) ( not ( = ?auto_27290 ?auto_27292 ) ) ( not ( = ?auto_27290 ?auto_27315 ) ) ( not ( = ?auto_27292 ?auto_27305 ) ) ( not ( = ?auto_27292 ?auto_27316 ) ) ( not ( = ?auto_27292 ?auto_27306 ) ) ( not ( = ?auto_27292 ?auto_27302 ) ) ( not ( = ?auto_27315 ?auto_27305 ) ) ( not ( = ?auto_27315 ?auto_27316 ) ) ( not ( = ?auto_27315 ?auto_27306 ) ) ( not ( = ?auto_27315 ?auto_27302 ) ) ( not ( = ?auto_27287 ?auto_27293 ) ) ( not ( = ?auto_27287 ?auto_27307 ) ) ( not ( = ?auto_27288 ?auto_27293 ) ) ( not ( = ?auto_27288 ?auto_27307 ) ) ( not ( = ?auto_27289 ?auto_27293 ) ) ( not ( = ?auto_27289 ?auto_27307 ) ) ( not ( = ?auto_27290 ?auto_27293 ) ) ( not ( = ?auto_27290 ?auto_27307 ) ) ( not ( = ?auto_27291 ?auto_27293 ) ) ( not ( = ?auto_27291 ?auto_27307 ) ) ( not ( = ?auto_27293 ?auto_27315 ) ) ( not ( = ?auto_27293 ?auto_27305 ) ) ( not ( = ?auto_27293 ?auto_27316 ) ) ( not ( = ?auto_27293 ?auto_27306 ) ) ( not ( = ?auto_27293 ?auto_27302 ) ) ( not ( = ?auto_27311 ?auto_27304 ) ) ( not ( = ?auto_27311 ?auto_27312 ) ) ( not ( = ?auto_27311 ?auto_27303 ) ) ( not ( = ?auto_27311 ?auto_27301 ) ) ( not ( = ?auto_27309 ?auto_27314 ) ) ( not ( = ?auto_27309 ?auto_27313 ) ) ( not ( = ?auto_27309 ?auto_27308 ) ) ( not ( = ?auto_27309 ?auto_27310 ) ) ( not ( = ?auto_27307 ?auto_27315 ) ) ( not ( = ?auto_27307 ?auto_27305 ) ) ( not ( = ?auto_27307 ?auto_27316 ) ) ( not ( = ?auto_27307 ?auto_27306 ) ) ( not ( = ?auto_27307 ?auto_27302 ) ) ( not ( = ?auto_27287 ?auto_27294 ) ) ( not ( = ?auto_27287 ?auto_27296 ) ) ( not ( = ?auto_27288 ?auto_27294 ) ) ( not ( = ?auto_27288 ?auto_27296 ) ) ( not ( = ?auto_27289 ?auto_27294 ) ) ( not ( = ?auto_27289 ?auto_27296 ) ) ( not ( = ?auto_27290 ?auto_27294 ) ) ( not ( = ?auto_27290 ?auto_27296 ) ) ( not ( = ?auto_27291 ?auto_27294 ) ) ( not ( = ?auto_27291 ?auto_27296 ) ) ( not ( = ?auto_27292 ?auto_27294 ) ) ( not ( = ?auto_27292 ?auto_27296 ) ) ( not ( = ?auto_27294 ?auto_27307 ) ) ( not ( = ?auto_27294 ?auto_27315 ) ) ( not ( = ?auto_27294 ?auto_27305 ) ) ( not ( = ?auto_27294 ?auto_27316 ) ) ( not ( = ?auto_27294 ?auto_27306 ) ) ( not ( = ?auto_27294 ?auto_27302 ) ) ( not ( = ?auto_27297 ?auto_27311 ) ) ( not ( = ?auto_27297 ?auto_27304 ) ) ( not ( = ?auto_27297 ?auto_27312 ) ) ( not ( = ?auto_27297 ?auto_27303 ) ) ( not ( = ?auto_27297 ?auto_27301 ) ) ( not ( = ?auto_27295 ?auto_27309 ) ) ( not ( = ?auto_27295 ?auto_27314 ) ) ( not ( = ?auto_27295 ?auto_27313 ) ) ( not ( = ?auto_27295 ?auto_27308 ) ) ( not ( = ?auto_27295 ?auto_27310 ) ) ( not ( = ?auto_27296 ?auto_27307 ) ) ( not ( = ?auto_27296 ?auto_27315 ) ) ( not ( = ?auto_27296 ?auto_27305 ) ) ( not ( = ?auto_27296 ?auto_27316 ) ) ( not ( = ?auto_27296 ?auto_27306 ) ) ( not ( = ?auto_27296 ?auto_27302 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_27287 ?auto_27288 ?auto_27289 ?auto_27290 ?auto_27291 ?auto_27292 ?auto_27293 )
      ( MAKE-1CRATE ?auto_27293 ?auto_27294 )
      ( MAKE-7CRATE-VERIFY ?auto_27287 ?auto_27288 ?auto_27289 ?auto_27290 ?auto_27291 ?auto_27292 ?auto_27293 ?auto_27294 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27319 - SURFACE
      ?auto_27320 - SURFACE
    )
    :vars
    (
      ?auto_27321 - HOIST
      ?auto_27322 - PLACE
      ?auto_27324 - PLACE
      ?auto_27325 - HOIST
      ?auto_27326 - SURFACE
      ?auto_27323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27321 ?auto_27322 ) ( SURFACE-AT ?auto_27319 ?auto_27322 ) ( CLEAR ?auto_27319 ) ( IS-CRATE ?auto_27320 ) ( AVAILABLE ?auto_27321 ) ( not ( = ?auto_27324 ?auto_27322 ) ) ( HOIST-AT ?auto_27325 ?auto_27324 ) ( AVAILABLE ?auto_27325 ) ( SURFACE-AT ?auto_27320 ?auto_27324 ) ( ON ?auto_27320 ?auto_27326 ) ( CLEAR ?auto_27320 ) ( TRUCK-AT ?auto_27323 ?auto_27322 ) ( not ( = ?auto_27319 ?auto_27320 ) ) ( not ( = ?auto_27319 ?auto_27326 ) ) ( not ( = ?auto_27320 ?auto_27326 ) ) ( not ( = ?auto_27321 ?auto_27325 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27323 ?auto_27322 ?auto_27324 )
      ( !LIFT ?auto_27325 ?auto_27320 ?auto_27326 ?auto_27324 )
      ( !LOAD ?auto_27325 ?auto_27320 ?auto_27323 ?auto_27324 )
      ( !DRIVE ?auto_27323 ?auto_27324 ?auto_27322 )
      ( !UNLOAD ?auto_27321 ?auto_27320 ?auto_27323 ?auto_27322 )
      ( !DROP ?auto_27321 ?auto_27320 ?auto_27319 ?auto_27322 )
      ( MAKE-1CRATE-VERIFY ?auto_27319 ?auto_27320 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_27336 - SURFACE
      ?auto_27337 - SURFACE
      ?auto_27338 - SURFACE
      ?auto_27339 - SURFACE
      ?auto_27340 - SURFACE
      ?auto_27341 - SURFACE
      ?auto_27342 - SURFACE
      ?auto_27344 - SURFACE
      ?auto_27343 - SURFACE
    )
    :vars
    (
      ?auto_27346 - HOIST
      ?auto_27349 - PLACE
      ?auto_27345 - PLACE
      ?auto_27348 - HOIST
      ?auto_27350 - SURFACE
      ?auto_27365 - PLACE
      ?auto_27357 - HOIST
      ?auto_27364 - SURFACE
      ?auto_27363 - PLACE
      ?auto_27367 - HOIST
      ?auto_27353 - SURFACE
      ?auto_27358 - PLACE
      ?auto_27354 - HOIST
      ?auto_27356 - SURFACE
      ?auto_27352 - SURFACE
      ?auto_27362 - PLACE
      ?auto_27355 - HOIST
      ?auto_27360 - SURFACE
      ?auto_27351 - SURFACE
      ?auto_27366 - PLACE
      ?auto_27361 - HOIST
      ?auto_27359 - SURFACE
      ?auto_27347 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27346 ?auto_27349 ) ( IS-CRATE ?auto_27343 ) ( not ( = ?auto_27345 ?auto_27349 ) ) ( HOIST-AT ?auto_27348 ?auto_27345 ) ( SURFACE-AT ?auto_27343 ?auto_27345 ) ( ON ?auto_27343 ?auto_27350 ) ( CLEAR ?auto_27343 ) ( not ( = ?auto_27344 ?auto_27343 ) ) ( not ( = ?auto_27344 ?auto_27350 ) ) ( not ( = ?auto_27343 ?auto_27350 ) ) ( not ( = ?auto_27346 ?auto_27348 ) ) ( IS-CRATE ?auto_27344 ) ( not ( = ?auto_27365 ?auto_27349 ) ) ( HOIST-AT ?auto_27357 ?auto_27365 ) ( AVAILABLE ?auto_27357 ) ( SURFACE-AT ?auto_27344 ?auto_27365 ) ( ON ?auto_27344 ?auto_27364 ) ( CLEAR ?auto_27344 ) ( not ( = ?auto_27342 ?auto_27344 ) ) ( not ( = ?auto_27342 ?auto_27364 ) ) ( not ( = ?auto_27344 ?auto_27364 ) ) ( not ( = ?auto_27346 ?auto_27357 ) ) ( IS-CRATE ?auto_27342 ) ( not ( = ?auto_27363 ?auto_27349 ) ) ( HOIST-AT ?auto_27367 ?auto_27363 ) ( AVAILABLE ?auto_27367 ) ( SURFACE-AT ?auto_27342 ?auto_27363 ) ( ON ?auto_27342 ?auto_27353 ) ( CLEAR ?auto_27342 ) ( not ( = ?auto_27341 ?auto_27342 ) ) ( not ( = ?auto_27341 ?auto_27353 ) ) ( not ( = ?auto_27342 ?auto_27353 ) ) ( not ( = ?auto_27346 ?auto_27367 ) ) ( IS-CRATE ?auto_27341 ) ( not ( = ?auto_27358 ?auto_27349 ) ) ( HOIST-AT ?auto_27354 ?auto_27358 ) ( SURFACE-AT ?auto_27341 ?auto_27358 ) ( ON ?auto_27341 ?auto_27356 ) ( CLEAR ?auto_27341 ) ( not ( = ?auto_27340 ?auto_27341 ) ) ( not ( = ?auto_27340 ?auto_27356 ) ) ( not ( = ?auto_27341 ?auto_27356 ) ) ( not ( = ?auto_27346 ?auto_27354 ) ) ( IS-CRATE ?auto_27340 ) ( AVAILABLE ?auto_27354 ) ( SURFACE-AT ?auto_27340 ?auto_27358 ) ( ON ?auto_27340 ?auto_27352 ) ( CLEAR ?auto_27340 ) ( not ( = ?auto_27339 ?auto_27340 ) ) ( not ( = ?auto_27339 ?auto_27352 ) ) ( not ( = ?auto_27340 ?auto_27352 ) ) ( IS-CRATE ?auto_27339 ) ( not ( = ?auto_27362 ?auto_27349 ) ) ( HOIST-AT ?auto_27355 ?auto_27362 ) ( AVAILABLE ?auto_27355 ) ( SURFACE-AT ?auto_27339 ?auto_27362 ) ( ON ?auto_27339 ?auto_27360 ) ( CLEAR ?auto_27339 ) ( not ( = ?auto_27338 ?auto_27339 ) ) ( not ( = ?auto_27338 ?auto_27360 ) ) ( not ( = ?auto_27339 ?auto_27360 ) ) ( not ( = ?auto_27346 ?auto_27355 ) ) ( IS-CRATE ?auto_27338 ) ( AVAILABLE ?auto_27348 ) ( SURFACE-AT ?auto_27338 ?auto_27345 ) ( ON ?auto_27338 ?auto_27351 ) ( CLEAR ?auto_27338 ) ( not ( = ?auto_27337 ?auto_27338 ) ) ( not ( = ?auto_27337 ?auto_27351 ) ) ( not ( = ?auto_27338 ?auto_27351 ) ) ( SURFACE-AT ?auto_27336 ?auto_27349 ) ( CLEAR ?auto_27336 ) ( IS-CRATE ?auto_27337 ) ( AVAILABLE ?auto_27346 ) ( not ( = ?auto_27366 ?auto_27349 ) ) ( HOIST-AT ?auto_27361 ?auto_27366 ) ( AVAILABLE ?auto_27361 ) ( SURFACE-AT ?auto_27337 ?auto_27366 ) ( ON ?auto_27337 ?auto_27359 ) ( CLEAR ?auto_27337 ) ( TRUCK-AT ?auto_27347 ?auto_27349 ) ( not ( = ?auto_27336 ?auto_27337 ) ) ( not ( = ?auto_27336 ?auto_27359 ) ) ( not ( = ?auto_27337 ?auto_27359 ) ) ( not ( = ?auto_27346 ?auto_27361 ) ) ( not ( = ?auto_27336 ?auto_27338 ) ) ( not ( = ?auto_27336 ?auto_27351 ) ) ( not ( = ?auto_27338 ?auto_27359 ) ) ( not ( = ?auto_27345 ?auto_27366 ) ) ( not ( = ?auto_27348 ?auto_27361 ) ) ( not ( = ?auto_27351 ?auto_27359 ) ) ( not ( = ?auto_27336 ?auto_27339 ) ) ( not ( = ?auto_27336 ?auto_27360 ) ) ( not ( = ?auto_27337 ?auto_27339 ) ) ( not ( = ?auto_27337 ?auto_27360 ) ) ( not ( = ?auto_27339 ?auto_27351 ) ) ( not ( = ?auto_27339 ?auto_27359 ) ) ( not ( = ?auto_27362 ?auto_27345 ) ) ( not ( = ?auto_27362 ?auto_27366 ) ) ( not ( = ?auto_27355 ?auto_27348 ) ) ( not ( = ?auto_27355 ?auto_27361 ) ) ( not ( = ?auto_27360 ?auto_27351 ) ) ( not ( = ?auto_27360 ?auto_27359 ) ) ( not ( = ?auto_27336 ?auto_27340 ) ) ( not ( = ?auto_27336 ?auto_27352 ) ) ( not ( = ?auto_27337 ?auto_27340 ) ) ( not ( = ?auto_27337 ?auto_27352 ) ) ( not ( = ?auto_27338 ?auto_27340 ) ) ( not ( = ?auto_27338 ?auto_27352 ) ) ( not ( = ?auto_27340 ?auto_27360 ) ) ( not ( = ?auto_27340 ?auto_27351 ) ) ( not ( = ?auto_27340 ?auto_27359 ) ) ( not ( = ?auto_27358 ?auto_27362 ) ) ( not ( = ?auto_27358 ?auto_27345 ) ) ( not ( = ?auto_27358 ?auto_27366 ) ) ( not ( = ?auto_27354 ?auto_27355 ) ) ( not ( = ?auto_27354 ?auto_27348 ) ) ( not ( = ?auto_27354 ?auto_27361 ) ) ( not ( = ?auto_27352 ?auto_27360 ) ) ( not ( = ?auto_27352 ?auto_27351 ) ) ( not ( = ?auto_27352 ?auto_27359 ) ) ( not ( = ?auto_27336 ?auto_27341 ) ) ( not ( = ?auto_27336 ?auto_27356 ) ) ( not ( = ?auto_27337 ?auto_27341 ) ) ( not ( = ?auto_27337 ?auto_27356 ) ) ( not ( = ?auto_27338 ?auto_27341 ) ) ( not ( = ?auto_27338 ?auto_27356 ) ) ( not ( = ?auto_27339 ?auto_27341 ) ) ( not ( = ?auto_27339 ?auto_27356 ) ) ( not ( = ?auto_27341 ?auto_27352 ) ) ( not ( = ?auto_27341 ?auto_27360 ) ) ( not ( = ?auto_27341 ?auto_27351 ) ) ( not ( = ?auto_27341 ?auto_27359 ) ) ( not ( = ?auto_27356 ?auto_27352 ) ) ( not ( = ?auto_27356 ?auto_27360 ) ) ( not ( = ?auto_27356 ?auto_27351 ) ) ( not ( = ?auto_27356 ?auto_27359 ) ) ( not ( = ?auto_27336 ?auto_27342 ) ) ( not ( = ?auto_27336 ?auto_27353 ) ) ( not ( = ?auto_27337 ?auto_27342 ) ) ( not ( = ?auto_27337 ?auto_27353 ) ) ( not ( = ?auto_27338 ?auto_27342 ) ) ( not ( = ?auto_27338 ?auto_27353 ) ) ( not ( = ?auto_27339 ?auto_27342 ) ) ( not ( = ?auto_27339 ?auto_27353 ) ) ( not ( = ?auto_27340 ?auto_27342 ) ) ( not ( = ?auto_27340 ?auto_27353 ) ) ( not ( = ?auto_27342 ?auto_27356 ) ) ( not ( = ?auto_27342 ?auto_27352 ) ) ( not ( = ?auto_27342 ?auto_27360 ) ) ( not ( = ?auto_27342 ?auto_27351 ) ) ( not ( = ?auto_27342 ?auto_27359 ) ) ( not ( = ?auto_27363 ?auto_27358 ) ) ( not ( = ?auto_27363 ?auto_27362 ) ) ( not ( = ?auto_27363 ?auto_27345 ) ) ( not ( = ?auto_27363 ?auto_27366 ) ) ( not ( = ?auto_27367 ?auto_27354 ) ) ( not ( = ?auto_27367 ?auto_27355 ) ) ( not ( = ?auto_27367 ?auto_27348 ) ) ( not ( = ?auto_27367 ?auto_27361 ) ) ( not ( = ?auto_27353 ?auto_27356 ) ) ( not ( = ?auto_27353 ?auto_27352 ) ) ( not ( = ?auto_27353 ?auto_27360 ) ) ( not ( = ?auto_27353 ?auto_27351 ) ) ( not ( = ?auto_27353 ?auto_27359 ) ) ( not ( = ?auto_27336 ?auto_27344 ) ) ( not ( = ?auto_27336 ?auto_27364 ) ) ( not ( = ?auto_27337 ?auto_27344 ) ) ( not ( = ?auto_27337 ?auto_27364 ) ) ( not ( = ?auto_27338 ?auto_27344 ) ) ( not ( = ?auto_27338 ?auto_27364 ) ) ( not ( = ?auto_27339 ?auto_27344 ) ) ( not ( = ?auto_27339 ?auto_27364 ) ) ( not ( = ?auto_27340 ?auto_27344 ) ) ( not ( = ?auto_27340 ?auto_27364 ) ) ( not ( = ?auto_27341 ?auto_27344 ) ) ( not ( = ?auto_27341 ?auto_27364 ) ) ( not ( = ?auto_27344 ?auto_27353 ) ) ( not ( = ?auto_27344 ?auto_27356 ) ) ( not ( = ?auto_27344 ?auto_27352 ) ) ( not ( = ?auto_27344 ?auto_27360 ) ) ( not ( = ?auto_27344 ?auto_27351 ) ) ( not ( = ?auto_27344 ?auto_27359 ) ) ( not ( = ?auto_27365 ?auto_27363 ) ) ( not ( = ?auto_27365 ?auto_27358 ) ) ( not ( = ?auto_27365 ?auto_27362 ) ) ( not ( = ?auto_27365 ?auto_27345 ) ) ( not ( = ?auto_27365 ?auto_27366 ) ) ( not ( = ?auto_27357 ?auto_27367 ) ) ( not ( = ?auto_27357 ?auto_27354 ) ) ( not ( = ?auto_27357 ?auto_27355 ) ) ( not ( = ?auto_27357 ?auto_27348 ) ) ( not ( = ?auto_27357 ?auto_27361 ) ) ( not ( = ?auto_27364 ?auto_27353 ) ) ( not ( = ?auto_27364 ?auto_27356 ) ) ( not ( = ?auto_27364 ?auto_27352 ) ) ( not ( = ?auto_27364 ?auto_27360 ) ) ( not ( = ?auto_27364 ?auto_27351 ) ) ( not ( = ?auto_27364 ?auto_27359 ) ) ( not ( = ?auto_27336 ?auto_27343 ) ) ( not ( = ?auto_27336 ?auto_27350 ) ) ( not ( = ?auto_27337 ?auto_27343 ) ) ( not ( = ?auto_27337 ?auto_27350 ) ) ( not ( = ?auto_27338 ?auto_27343 ) ) ( not ( = ?auto_27338 ?auto_27350 ) ) ( not ( = ?auto_27339 ?auto_27343 ) ) ( not ( = ?auto_27339 ?auto_27350 ) ) ( not ( = ?auto_27340 ?auto_27343 ) ) ( not ( = ?auto_27340 ?auto_27350 ) ) ( not ( = ?auto_27341 ?auto_27343 ) ) ( not ( = ?auto_27341 ?auto_27350 ) ) ( not ( = ?auto_27342 ?auto_27343 ) ) ( not ( = ?auto_27342 ?auto_27350 ) ) ( not ( = ?auto_27343 ?auto_27364 ) ) ( not ( = ?auto_27343 ?auto_27353 ) ) ( not ( = ?auto_27343 ?auto_27356 ) ) ( not ( = ?auto_27343 ?auto_27352 ) ) ( not ( = ?auto_27343 ?auto_27360 ) ) ( not ( = ?auto_27343 ?auto_27351 ) ) ( not ( = ?auto_27343 ?auto_27359 ) ) ( not ( = ?auto_27350 ?auto_27364 ) ) ( not ( = ?auto_27350 ?auto_27353 ) ) ( not ( = ?auto_27350 ?auto_27356 ) ) ( not ( = ?auto_27350 ?auto_27352 ) ) ( not ( = ?auto_27350 ?auto_27360 ) ) ( not ( = ?auto_27350 ?auto_27351 ) ) ( not ( = ?auto_27350 ?auto_27359 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_27336 ?auto_27337 ?auto_27338 ?auto_27339 ?auto_27340 ?auto_27341 ?auto_27342 ?auto_27344 )
      ( MAKE-1CRATE ?auto_27344 ?auto_27343 )
      ( MAKE-8CRATE-VERIFY ?auto_27336 ?auto_27337 ?auto_27338 ?auto_27339 ?auto_27340 ?auto_27341 ?auto_27342 ?auto_27344 ?auto_27343 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27370 - SURFACE
      ?auto_27371 - SURFACE
    )
    :vars
    (
      ?auto_27372 - HOIST
      ?auto_27373 - PLACE
      ?auto_27375 - PLACE
      ?auto_27376 - HOIST
      ?auto_27377 - SURFACE
      ?auto_27374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27372 ?auto_27373 ) ( SURFACE-AT ?auto_27370 ?auto_27373 ) ( CLEAR ?auto_27370 ) ( IS-CRATE ?auto_27371 ) ( AVAILABLE ?auto_27372 ) ( not ( = ?auto_27375 ?auto_27373 ) ) ( HOIST-AT ?auto_27376 ?auto_27375 ) ( AVAILABLE ?auto_27376 ) ( SURFACE-AT ?auto_27371 ?auto_27375 ) ( ON ?auto_27371 ?auto_27377 ) ( CLEAR ?auto_27371 ) ( TRUCK-AT ?auto_27374 ?auto_27373 ) ( not ( = ?auto_27370 ?auto_27371 ) ) ( not ( = ?auto_27370 ?auto_27377 ) ) ( not ( = ?auto_27371 ?auto_27377 ) ) ( not ( = ?auto_27372 ?auto_27376 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27374 ?auto_27373 ?auto_27375 )
      ( !LIFT ?auto_27376 ?auto_27371 ?auto_27377 ?auto_27375 )
      ( !LOAD ?auto_27376 ?auto_27371 ?auto_27374 ?auto_27375 )
      ( !DRIVE ?auto_27374 ?auto_27375 ?auto_27373 )
      ( !UNLOAD ?auto_27372 ?auto_27371 ?auto_27374 ?auto_27373 )
      ( !DROP ?auto_27372 ?auto_27371 ?auto_27370 ?auto_27373 )
      ( MAKE-1CRATE-VERIFY ?auto_27370 ?auto_27371 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_27388 - SURFACE
      ?auto_27389 - SURFACE
      ?auto_27390 - SURFACE
      ?auto_27391 - SURFACE
      ?auto_27392 - SURFACE
      ?auto_27393 - SURFACE
      ?auto_27394 - SURFACE
      ?auto_27397 - SURFACE
      ?auto_27396 - SURFACE
      ?auto_27395 - SURFACE
    )
    :vars
    (
      ?auto_27398 - HOIST
      ?auto_27399 - PLACE
      ?auto_27401 - PLACE
      ?auto_27400 - HOIST
      ?auto_27403 - SURFACE
      ?auto_27406 - PLACE
      ?auto_27414 - HOIST
      ?auto_27420 - SURFACE
      ?auto_27407 - PLACE
      ?auto_27418 - HOIST
      ?auto_27416 - SURFACE
      ?auto_27415 - PLACE
      ?auto_27413 - HOIST
      ?auto_27404 - SURFACE
      ?auto_27417 - PLACE
      ?auto_27405 - HOIST
      ?auto_27419 - SURFACE
      ?auto_27408 - SURFACE
      ?auto_27421 - SURFACE
      ?auto_27409 - SURFACE
      ?auto_27412 - PLACE
      ?auto_27410 - HOIST
      ?auto_27411 - SURFACE
      ?auto_27402 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27398 ?auto_27399 ) ( IS-CRATE ?auto_27395 ) ( not ( = ?auto_27401 ?auto_27399 ) ) ( HOIST-AT ?auto_27400 ?auto_27401 ) ( SURFACE-AT ?auto_27395 ?auto_27401 ) ( ON ?auto_27395 ?auto_27403 ) ( CLEAR ?auto_27395 ) ( not ( = ?auto_27396 ?auto_27395 ) ) ( not ( = ?auto_27396 ?auto_27403 ) ) ( not ( = ?auto_27395 ?auto_27403 ) ) ( not ( = ?auto_27398 ?auto_27400 ) ) ( IS-CRATE ?auto_27396 ) ( not ( = ?auto_27406 ?auto_27399 ) ) ( HOIST-AT ?auto_27414 ?auto_27406 ) ( SURFACE-AT ?auto_27396 ?auto_27406 ) ( ON ?auto_27396 ?auto_27420 ) ( CLEAR ?auto_27396 ) ( not ( = ?auto_27397 ?auto_27396 ) ) ( not ( = ?auto_27397 ?auto_27420 ) ) ( not ( = ?auto_27396 ?auto_27420 ) ) ( not ( = ?auto_27398 ?auto_27414 ) ) ( IS-CRATE ?auto_27397 ) ( not ( = ?auto_27407 ?auto_27399 ) ) ( HOIST-AT ?auto_27418 ?auto_27407 ) ( AVAILABLE ?auto_27418 ) ( SURFACE-AT ?auto_27397 ?auto_27407 ) ( ON ?auto_27397 ?auto_27416 ) ( CLEAR ?auto_27397 ) ( not ( = ?auto_27394 ?auto_27397 ) ) ( not ( = ?auto_27394 ?auto_27416 ) ) ( not ( = ?auto_27397 ?auto_27416 ) ) ( not ( = ?auto_27398 ?auto_27418 ) ) ( IS-CRATE ?auto_27394 ) ( not ( = ?auto_27415 ?auto_27399 ) ) ( HOIST-AT ?auto_27413 ?auto_27415 ) ( AVAILABLE ?auto_27413 ) ( SURFACE-AT ?auto_27394 ?auto_27415 ) ( ON ?auto_27394 ?auto_27404 ) ( CLEAR ?auto_27394 ) ( not ( = ?auto_27393 ?auto_27394 ) ) ( not ( = ?auto_27393 ?auto_27404 ) ) ( not ( = ?auto_27394 ?auto_27404 ) ) ( not ( = ?auto_27398 ?auto_27413 ) ) ( IS-CRATE ?auto_27393 ) ( not ( = ?auto_27417 ?auto_27399 ) ) ( HOIST-AT ?auto_27405 ?auto_27417 ) ( SURFACE-AT ?auto_27393 ?auto_27417 ) ( ON ?auto_27393 ?auto_27419 ) ( CLEAR ?auto_27393 ) ( not ( = ?auto_27392 ?auto_27393 ) ) ( not ( = ?auto_27392 ?auto_27419 ) ) ( not ( = ?auto_27393 ?auto_27419 ) ) ( not ( = ?auto_27398 ?auto_27405 ) ) ( IS-CRATE ?auto_27392 ) ( AVAILABLE ?auto_27405 ) ( SURFACE-AT ?auto_27392 ?auto_27417 ) ( ON ?auto_27392 ?auto_27408 ) ( CLEAR ?auto_27392 ) ( not ( = ?auto_27391 ?auto_27392 ) ) ( not ( = ?auto_27391 ?auto_27408 ) ) ( not ( = ?auto_27392 ?auto_27408 ) ) ( IS-CRATE ?auto_27391 ) ( AVAILABLE ?auto_27400 ) ( SURFACE-AT ?auto_27391 ?auto_27401 ) ( ON ?auto_27391 ?auto_27421 ) ( CLEAR ?auto_27391 ) ( not ( = ?auto_27390 ?auto_27391 ) ) ( not ( = ?auto_27390 ?auto_27421 ) ) ( not ( = ?auto_27391 ?auto_27421 ) ) ( IS-CRATE ?auto_27390 ) ( AVAILABLE ?auto_27414 ) ( SURFACE-AT ?auto_27390 ?auto_27406 ) ( ON ?auto_27390 ?auto_27409 ) ( CLEAR ?auto_27390 ) ( not ( = ?auto_27389 ?auto_27390 ) ) ( not ( = ?auto_27389 ?auto_27409 ) ) ( not ( = ?auto_27390 ?auto_27409 ) ) ( SURFACE-AT ?auto_27388 ?auto_27399 ) ( CLEAR ?auto_27388 ) ( IS-CRATE ?auto_27389 ) ( AVAILABLE ?auto_27398 ) ( not ( = ?auto_27412 ?auto_27399 ) ) ( HOIST-AT ?auto_27410 ?auto_27412 ) ( AVAILABLE ?auto_27410 ) ( SURFACE-AT ?auto_27389 ?auto_27412 ) ( ON ?auto_27389 ?auto_27411 ) ( CLEAR ?auto_27389 ) ( TRUCK-AT ?auto_27402 ?auto_27399 ) ( not ( = ?auto_27388 ?auto_27389 ) ) ( not ( = ?auto_27388 ?auto_27411 ) ) ( not ( = ?auto_27389 ?auto_27411 ) ) ( not ( = ?auto_27398 ?auto_27410 ) ) ( not ( = ?auto_27388 ?auto_27390 ) ) ( not ( = ?auto_27388 ?auto_27409 ) ) ( not ( = ?auto_27390 ?auto_27411 ) ) ( not ( = ?auto_27406 ?auto_27412 ) ) ( not ( = ?auto_27414 ?auto_27410 ) ) ( not ( = ?auto_27409 ?auto_27411 ) ) ( not ( = ?auto_27388 ?auto_27391 ) ) ( not ( = ?auto_27388 ?auto_27421 ) ) ( not ( = ?auto_27389 ?auto_27391 ) ) ( not ( = ?auto_27389 ?auto_27421 ) ) ( not ( = ?auto_27391 ?auto_27409 ) ) ( not ( = ?auto_27391 ?auto_27411 ) ) ( not ( = ?auto_27401 ?auto_27406 ) ) ( not ( = ?auto_27401 ?auto_27412 ) ) ( not ( = ?auto_27400 ?auto_27414 ) ) ( not ( = ?auto_27400 ?auto_27410 ) ) ( not ( = ?auto_27421 ?auto_27409 ) ) ( not ( = ?auto_27421 ?auto_27411 ) ) ( not ( = ?auto_27388 ?auto_27392 ) ) ( not ( = ?auto_27388 ?auto_27408 ) ) ( not ( = ?auto_27389 ?auto_27392 ) ) ( not ( = ?auto_27389 ?auto_27408 ) ) ( not ( = ?auto_27390 ?auto_27392 ) ) ( not ( = ?auto_27390 ?auto_27408 ) ) ( not ( = ?auto_27392 ?auto_27421 ) ) ( not ( = ?auto_27392 ?auto_27409 ) ) ( not ( = ?auto_27392 ?auto_27411 ) ) ( not ( = ?auto_27417 ?auto_27401 ) ) ( not ( = ?auto_27417 ?auto_27406 ) ) ( not ( = ?auto_27417 ?auto_27412 ) ) ( not ( = ?auto_27405 ?auto_27400 ) ) ( not ( = ?auto_27405 ?auto_27414 ) ) ( not ( = ?auto_27405 ?auto_27410 ) ) ( not ( = ?auto_27408 ?auto_27421 ) ) ( not ( = ?auto_27408 ?auto_27409 ) ) ( not ( = ?auto_27408 ?auto_27411 ) ) ( not ( = ?auto_27388 ?auto_27393 ) ) ( not ( = ?auto_27388 ?auto_27419 ) ) ( not ( = ?auto_27389 ?auto_27393 ) ) ( not ( = ?auto_27389 ?auto_27419 ) ) ( not ( = ?auto_27390 ?auto_27393 ) ) ( not ( = ?auto_27390 ?auto_27419 ) ) ( not ( = ?auto_27391 ?auto_27393 ) ) ( not ( = ?auto_27391 ?auto_27419 ) ) ( not ( = ?auto_27393 ?auto_27408 ) ) ( not ( = ?auto_27393 ?auto_27421 ) ) ( not ( = ?auto_27393 ?auto_27409 ) ) ( not ( = ?auto_27393 ?auto_27411 ) ) ( not ( = ?auto_27419 ?auto_27408 ) ) ( not ( = ?auto_27419 ?auto_27421 ) ) ( not ( = ?auto_27419 ?auto_27409 ) ) ( not ( = ?auto_27419 ?auto_27411 ) ) ( not ( = ?auto_27388 ?auto_27394 ) ) ( not ( = ?auto_27388 ?auto_27404 ) ) ( not ( = ?auto_27389 ?auto_27394 ) ) ( not ( = ?auto_27389 ?auto_27404 ) ) ( not ( = ?auto_27390 ?auto_27394 ) ) ( not ( = ?auto_27390 ?auto_27404 ) ) ( not ( = ?auto_27391 ?auto_27394 ) ) ( not ( = ?auto_27391 ?auto_27404 ) ) ( not ( = ?auto_27392 ?auto_27394 ) ) ( not ( = ?auto_27392 ?auto_27404 ) ) ( not ( = ?auto_27394 ?auto_27419 ) ) ( not ( = ?auto_27394 ?auto_27408 ) ) ( not ( = ?auto_27394 ?auto_27421 ) ) ( not ( = ?auto_27394 ?auto_27409 ) ) ( not ( = ?auto_27394 ?auto_27411 ) ) ( not ( = ?auto_27415 ?auto_27417 ) ) ( not ( = ?auto_27415 ?auto_27401 ) ) ( not ( = ?auto_27415 ?auto_27406 ) ) ( not ( = ?auto_27415 ?auto_27412 ) ) ( not ( = ?auto_27413 ?auto_27405 ) ) ( not ( = ?auto_27413 ?auto_27400 ) ) ( not ( = ?auto_27413 ?auto_27414 ) ) ( not ( = ?auto_27413 ?auto_27410 ) ) ( not ( = ?auto_27404 ?auto_27419 ) ) ( not ( = ?auto_27404 ?auto_27408 ) ) ( not ( = ?auto_27404 ?auto_27421 ) ) ( not ( = ?auto_27404 ?auto_27409 ) ) ( not ( = ?auto_27404 ?auto_27411 ) ) ( not ( = ?auto_27388 ?auto_27397 ) ) ( not ( = ?auto_27388 ?auto_27416 ) ) ( not ( = ?auto_27389 ?auto_27397 ) ) ( not ( = ?auto_27389 ?auto_27416 ) ) ( not ( = ?auto_27390 ?auto_27397 ) ) ( not ( = ?auto_27390 ?auto_27416 ) ) ( not ( = ?auto_27391 ?auto_27397 ) ) ( not ( = ?auto_27391 ?auto_27416 ) ) ( not ( = ?auto_27392 ?auto_27397 ) ) ( not ( = ?auto_27392 ?auto_27416 ) ) ( not ( = ?auto_27393 ?auto_27397 ) ) ( not ( = ?auto_27393 ?auto_27416 ) ) ( not ( = ?auto_27397 ?auto_27404 ) ) ( not ( = ?auto_27397 ?auto_27419 ) ) ( not ( = ?auto_27397 ?auto_27408 ) ) ( not ( = ?auto_27397 ?auto_27421 ) ) ( not ( = ?auto_27397 ?auto_27409 ) ) ( not ( = ?auto_27397 ?auto_27411 ) ) ( not ( = ?auto_27407 ?auto_27415 ) ) ( not ( = ?auto_27407 ?auto_27417 ) ) ( not ( = ?auto_27407 ?auto_27401 ) ) ( not ( = ?auto_27407 ?auto_27406 ) ) ( not ( = ?auto_27407 ?auto_27412 ) ) ( not ( = ?auto_27418 ?auto_27413 ) ) ( not ( = ?auto_27418 ?auto_27405 ) ) ( not ( = ?auto_27418 ?auto_27400 ) ) ( not ( = ?auto_27418 ?auto_27414 ) ) ( not ( = ?auto_27418 ?auto_27410 ) ) ( not ( = ?auto_27416 ?auto_27404 ) ) ( not ( = ?auto_27416 ?auto_27419 ) ) ( not ( = ?auto_27416 ?auto_27408 ) ) ( not ( = ?auto_27416 ?auto_27421 ) ) ( not ( = ?auto_27416 ?auto_27409 ) ) ( not ( = ?auto_27416 ?auto_27411 ) ) ( not ( = ?auto_27388 ?auto_27396 ) ) ( not ( = ?auto_27388 ?auto_27420 ) ) ( not ( = ?auto_27389 ?auto_27396 ) ) ( not ( = ?auto_27389 ?auto_27420 ) ) ( not ( = ?auto_27390 ?auto_27396 ) ) ( not ( = ?auto_27390 ?auto_27420 ) ) ( not ( = ?auto_27391 ?auto_27396 ) ) ( not ( = ?auto_27391 ?auto_27420 ) ) ( not ( = ?auto_27392 ?auto_27396 ) ) ( not ( = ?auto_27392 ?auto_27420 ) ) ( not ( = ?auto_27393 ?auto_27396 ) ) ( not ( = ?auto_27393 ?auto_27420 ) ) ( not ( = ?auto_27394 ?auto_27396 ) ) ( not ( = ?auto_27394 ?auto_27420 ) ) ( not ( = ?auto_27396 ?auto_27416 ) ) ( not ( = ?auto_27396 ?auto_27404 ) ) ( not ( = ?auto_27396 ?auto_27419 ) ) ( not ( = ?auto_27396 ?auto_27408 ) ) ( not ( = ?auto_27396 ?auto_27421 ) ) ( not ( = ?auto_27396 ?auto_27409 ) ) ( not ( = ?auto_27396 ?auto_27411 ) ) ( not ( = ?auto_27420 ?auto_27416 ) ) ( not ( = ?auto_27420 ?auto_27404 ) ) ( not ( = ?auto_27420 ?auto_27419 ) ) ( not ( = ?auto_27420 ?auto_27408 ) ) ( not ( = ?auto_27420 ?auto_27421 ) ) ( not ( = ?auto_27420 ?auto_27409 ) ) ( not ( = ?auto_27420 ?auto_27411 ) ) ( not ( = ?auto_27388 ?auto_27395 ) ) ( not ( = ?auto_27388 ?auto_27403 ) ) ( not ( = ?auto_27389 ?auto_27395 ) ) ( not ( = ?auto_27389 ?auto_27403 ) ) ( not ( = ?auto_27390 ?auto_27395 ) ) ( not ( = ?auto_27390 ?auto_27403 ) ) ( not ( = ?auto_27391 ?auto_27395 ) ) ( not ( = ?auto_27391 ?auto_27403 ) ) ( not ( = ?auto_27392 ?auto_27395 ) ) ( not ( = ?auto_27392 ?auto_27403 ) ) ( not ( = ?auto_27393 ?auto_27395 ) ) ( not ( = ?auto_27393 ?auto_27403 ) ) ( not ( = ?auto_27394 ?auto_27395 ) ) ( not ( = ?auto_27394 ?auto_27403 ) ) ( not ( = ?auto_27397 ?auto_27395 ) ) ( not ( = ?auto_27397 ?auto_27403 ) ) ( not ( = ?auto_27395 ?auto_27420 ) ) ( not ( = ?auto_27395 ?auto_27416 ) ) ( not ( = ?auto_27395 ?auto_27404 ) ) ( not ( = ?auto_27395 ?auto_27419 ) ) ( not ( = ?auto_27395 ?auto_27408 ) ) ( not ( = ?auto_27395 ?auto_27421 ) ) ( not ( = ?auto_27395 ?auto_27409 ) ) ( not ( = ?auto_27395 ?auto_27411 ) ) ( not ( = ?auto_27403 ?auto_27420 ) ) ( not ( = ?auto_27403 ?auto_27416 ) ) ( not ( = ?auto_27403 ?auto_27404 ) ) ( not ( = ?auto_27403 ?auto_27419 ) ) ( not ( = ?auto_27403 ?auto_27408 ) ) ( not ( = ?auto_27403 ?auto_27421 ) ) ( not ( = ?auto_27403 ?auto_27409 ) ) ( not ( = ?auto_27403 ?auto_27411 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_27388 ?auto_27389 ?auto_27390 ?auto_27391 ?auto_27392 ?auto_27393 ?auto_27394 ?auto_27397 ?auto_27396 )
      ( MAKE-1CRATE ?auto_27396 ?auto_27395 )
      ( MAKE-9CRATE-VERIFY ?auto_27388 ?auto_27389 ?auto_27390 ?auto_27391 ?auto_27392 ?auto_27393 ?auto_27394 ?auto_27397 ?auto_27396 ?auto_27395 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27424 - SURFACE
      ?auto_27425 - SURFACE
    )
    :vars
    (
      ?auto_27426 - HOIST
      ?auto_27427 - PLACE
      ?auto_27429 - PLACE
      ?auto_27430 - HOIST
      ?auto_27431 - SURFACE
      ?auto_27428 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27426 ?auto_27427 ) ( SURFACE-AT ?auto_27424 ?auto_27427 ) ( CLEAR ?auto_27424 ) ( IS-CRATE ?auto_27425 ) ( AVAILABLE ?auto_27426 ) ( not ( = ?auto_27429 ?auto_27427 ) ) ( HOIST-AT ?auto_27430 ?auto_27429 ) ( AVAILABLE ?auto_27430 ) ( SURFACE-AT ?auto_27425 ?auto_27429 ) ( ON ?auto_27425 ?auto_27431 ) ( CLEAR ?auto_27425 ) ( TRUCK-AT ?auto_27428 ?auto_27427 ) ( not ( = ?auto_27424 ?auto_27425 ) ) ( not ( = ?auto_27424 ?auto_27431 ) ) ( not ( = ?auto_27425 ?auto_27431 ) ) ( not ( = ?auto_27426 ?auto_27430 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27428 ?auto_27427 ?auto_27429 )
      ( !LIFT ?auto_27430 ?auto_27425 ?auto_27431 ?auto_27429 )
      ( !LOAD ?auto_27430 ?auto_27425 ?auto_27428 ?auto_27429 )
      ( !DRIVE ?auto_27428 ?auto_27429 ?auto_27427 )
      ( !UNLOAD ?auto_27426 ?auto_27425 ?auto_27428 ?auto_27427 )
      ( !DROP ?auto_27426 ?auto_27425 ?auto_27424 ?auto_27427 )
      ( MAKE-1CRATE-VERIFY ?auto_27424 ?auto_27425 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_27443 - SURFACE
      ?auto_27444 - SURFACE
      ?auto_27445 - SURFACE
      ?auto_27446 - SURFACE
      ?auto_27447 - SURFACE
      ?auto_27448 - SURFACE
      ?auto_27449 - SURFACE
      ?auto_27452 - SURFACE
      ?auto_27451 - SURFACE
      ?auto_27450 - SURFACE
      ?auto_27453 - SURFACE
    )
    :vars
    (
      ?auto_27459 - HOIST
      ?auto_27454 - PLACE
      ?auto_27456 - PLACE
      ?auto_27455 - HOIST
      ?auto_27457 - SURFACE
      ?auto_27478 - PLACE
      ?auto_27476 - HOIST
      ?auto_27464 - SURFACE
      ?auto_27471 - PLACE
      ?auto_27470 - HOIST
      ?auto_27469 - SURFACE
      ?auto_27468 - PLACE
      ?auto_27475 - HOIST
      ?auto_27461 - SURFACE
      ?auto_27479 - PLACE
      ?auto_27463 - HOIST
      ?auto_27473 - SURFACE
      ?auto_27462 - PLACE
      ?auto_27477 - HOIST
      ?auto_27480 - SURFACE
      ?auto_27467 - SURFACE
      ?auto_27474 - SURFACE
      ?auto_27466 - SURFACE
      ?auto_27460 - PLACE
      ?auto_27465 - HOIST
      ?auto_27472 - SURFACE
      ?auto_27458 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27459 ?auto_27454 ) ( IS-CRATE ?auto_27453 ) ( not ( = ?auto_27456 ?auto_27454 ) ) ( HOIST-AT ?auto_27455 ?auto_27456 ) ( AVAILABLE ?auto_27455 ) ( SURFACE-AT ?auto_27453 ?auto_27456 ) ( ON ?auto_27453 ?auto_27457 ) ( CLEAR ?auto_27453 ) ( not ( = ?auto_27450 ?auto_27453 ) ) ( not ( = ?auto_27450 ?auto_27457 ) ) ( not ( = ?auto_27453 ?auto_27457 ) ) ( not ( = ?auto_27459 ?auto_27455 ) ) ( IS-CRATE ?auto_27450 ) ( not ( = ?auto_27478 ?auto_27454 ) ) ( HOIST-AT ?auto_27476 ?auto_27478 ) ( SURFACE-AT ?auto_27450 ?auto_27478 ) ( ON ?auto_27450 ?auto_27464 ) ( CLEAR ?auto_27450 ) ( not ( = ?auto_27451 ?auto_27450 ) ) ( not ( = ?auto_27451 ?auto_27464 ) ) ( not ( = ?auto_27450 ?auto_27464 ) ) ( not ( = ?auto_27459 ?auto_27476 ) ) ( IS-CRATE ?auto_27451 ) ( not ( = ?auto_27471 ?auto_27454 ) ) ( HOIST-AT ?auto_27470 ?auto_27471 ) ( SURFACE-AT ?auto_27451 ?auto_27471 ) ( ON ?auto_27451 ?auto_27469 ) ( CLEAR ?auto_27451 ) ( not ( = ?auto_27452 ?auto_27451 ) ) ( not ( = ?auto_27452 ?auto_27469 ) ) ( not ( = ?auto_27451 ?auto_27469 ) ) ( not ( = ?auto_27459 ?auto_27470 ) ) ( IS-CRATE ?auto_27452 ) ( not ( = ?auto_27468 ?auto_27454 ) ) ( HOIST-AT ?auto_27475 ?auto_27468 ) ( AVAILABLE ?auto_27475 ) ( SURFACE-AT ?auto_27452 ?auto_27468 ) ( ON ?auto_27452 ?auto_27461 ) ( CLEAR ?auto_27452 ) ( not ( = ?auto_27449 ?auto_27452 ) ) ( not ( = ?auto_27449 ?auto_27461 ) ) ( not ( = ?auto_27452 ?auto_27461 ) ) ( not ( = ?auto_27459 ?auto_27475 ) ) ( IS-CRATE ?auto_27449 ) ( not ( = ?auto_27479 ?auto_27454 ) ) ( HOIST-AT ?auto_27463 ?auto_27479 ) ( AVAILABLE ?auto_27463 ) ( SURFACE-AT ?auto_27449 ?auto_27479 ) ( ON ?auto_27449 ?auto_27473 ) ( CLEAR ?auto_27449 ) ( not ( = ?auto_27448 ?auto_27449 ) ) ( not ( = ?auto_27448 ?auto_27473 ) ) ( not ( = ?auto_27449 ?auto_27473 ) ) ( not ( = ?auto_27459 ?auto_27463 ) ) ( IS-CRATE ?auto_27448 ) ( not ( = ?auto_27462 ?auto_27454 ) ) ( HOIST-AT ?auto_27477 ?auto_27462 ) ( SURFACE-AT ?auto_27448 ?auto_27462 ) ( ON ?auto_27448 ?auto_27480 ) ( CLEAR ?auto_27448 ) ( not ( = ?auto_27447 ?auto_27448 ) ) ( not ( = ?auto_27447 ?auto_27480 ) ) ( not ( = ?auto_27448 ?auto_27480 ) ) ( not ( = ?auto_27459 ?auto_27477 ) ) ( IS-CRATE ?auto_27447 ) ( AVAILABLE ?auto_27477 ) ( SURFACE-AT ?auto_27447 ?auto_27462 ) ( ON ?auto_27447 ?auto_27467 ) ( CLEAR ?auto_27447 ) ( not ( = ?auto_27446 ?auto_27447 ) ) ( not ( = ?auto_27446 ?auto_27467 ) ) ( not ( = ?auto_27447 ?auto_27467 ) ) ( IS-CRATE ?auto_27446 ) ( AVAILABLE ?auto_27476 ) ( SURFACE-AT ?auto_27446 ?auto_27478 ) ( ON ?auto_27446 ?auto_27474 ) ( CLEAR ?auto_27446 ) ( not ( = ?auto_27445 ?auto_27446 ) ) ( not ( = ?auto_27445 ?auto_27474 ) ) ( not ( = ?auto_27446 ?auto_27474 ) ) ( IS-CRATE ?auto_27445 ) ( AVAILABLE ?auto_27470 ) ( SURFACE-AT ?auto_27445 ?auto_27471 ) ( ON ?auto_27445 ?auto_27466 ) ( CLEAR ?auto_27445 ) ( not ( = ?auto_27444 ?auto_27445 ) ) ( not ( = ?auto_27444 ?auto_27466 ) ) ( not ( = ?auto_27445 ?auto_27466 ) ) ( SURFACE-AT ?auto_27443 ?auto_27454 ) ( CLEAR ?auto_27443 ) ( IS-CRATE ?auto_27444 ) ( AVAILABLE ?auto_27459 ) ( not ( = ?auto_27460 ?auto_27454 ) ) ( HOIST-AT ?auto_27465 ?auto_27460 ) ( AVAILABLE ?auto_27465 ) ( SURFACE-AT ?auto_27444 ?auto_27460 ) ( ON ?auto_27444 ?auto_27472 ) ( CLEAR ?auto_27444 ) ( TRUCK-AT ?auto_27458 ?auto_27454 ) ( not ( = ?auto_27443 ?auto_27444 ) ) ( not ( = ?auto_27443 ?auto_27472 ) ) ( not ( = ?auto_27444 ?auto_27472 ) ) ( not ( = ?auto_27459 ?auto_27465 ) ) ( not ( = ?auto_27443 ?auto_27445 ) ) ( not ( = ?auto_27443 ?auto_27466 ) ) ( not ( = ?auto_27445 ?auto_27472 ) ) ( not ( = ?auto_27471 ?auto_27460 ) ) ( not ( = ?auto_27470 ?auto_27465 ) ) ( not ( = ?auto_27466 ?auto_27472 ) ) ( not ( = ?auto_27443 ?auto_27446 ) ) ( not ( = ?auto_27443 ?auto_27474 ) ) ( not ( = ?auto_27444 ?auto_27446 ) ) ( not ( = ?auto_27444 ?auto_27474 ) ) ( not ( = ?auto_27446 ?auto_27466 ) ) ( not ( = ?auto_27446 ?auto_27472 ) ) ( not ( = ?auto_27478 ?auto_27471 ) ) ( not ( = ?auto_27478 ?auto_27460 ) ) ( not ( = ?auto_27476 ?auto_27470 ) ) ( not ( = ?auto_27476 ?auto_27465 ) ) ( not ( = ?auto_27474 ?auto_27466 ) ) ( not ( = ?auto_27474 ?auto_27472 ) ) ( not ( = ?auto_27443 ?auto_27447 ) ) ( not ( = ?auto_27443 ?auto_27467 ) ) ( not ( = ?auto_27444 ?auto_27447 ) ) ( not ( = ?auto_27444 ?auto_27467 ) ) ( not ( = ?auto_27445 ?auto_27447 ) ) ( not ( = ?auto_27445 ?auto_27467 ) ) ( not ( = ?auto_27447 ?auto_27474 ) ) ( not ( = ?auto_27447 ?auto_27466 ) ) ( not ( = ?auto_27447 ?auto_27472 ) ) ( not ( = ?auto_27462 ?auto_27478 ) ) ( not ( = ?auto_27462 ?auto_27471 ) ) ( not ( = ?auto_27462 ?auto_27460 ) ) ( not ( = ?auto_27477 ?auto_27476 ) ) ( not ( = ?auto_27477 ?auto_27470 ) ) ( not ( = ?auto_27477 ?auto_27465 ) ) ( not ( = ?auto_27467 ?auto_27474 ) ) ( not ( = ?auto_27467 ?auto_27466 ) ) ( not ( = ?auto_27467 ?auto_27472 ) ) ( not ( = ?auto_27443 ?auto_27448 ) ) ( not ( = ?auto_27443 ?auto_27480 ) ) ( not ( = ?auto_27444 ?auto_27448 ) ) ( not ( = ?auto_27444 ?auto_27480 ) ) ( not ( = ?auto_27445 ?auto_27448 ) ) ( not ( = ?auto_27445 ?auto_27480 ) ) ( not ( = ?auto_27446 ?auto_27448 ) ) ( not ( = ?auto_27446 ?auto_27480 ) ) ( not ( = ?auto_27448 ?auto_27467 ) ) ( not ( = ?auto_27448 ?auto_27474 ) ) ( not ( = ?auto_27448 ?auto_27466 ) ) ( not ( = ?auto_27448 ?auto_27472 ) ) ( not ( = ?auto_27480 ?auto_27467 ) ) ( not ( = ?auto_27480 ?auto_27474 ) ) ( not ( = ?auto_27480 ?auto_27466 ) ) ( not ( = ?auto_27480 ?auto_27472 ) ) ( not ( = ?auto_27443 ?auto_27449 ) ) ( not ( = ?auto_27443 ?auto_27473 ) ) ( not ( = ?auto_27444 ?auto_27449 ) ) ( not ( = ?auto_27444 ?auto_27473 ) ) ( not ( = ?auto_27445 ?auto_27449 ) ) ( not ( = ?auto_27445 ?auto_27473 ) ) ( not ( = ?auto_27446 ?auto_27449 ) ) ( not ( = ?auto_27446 ?auto_27473 ) ) ( not ( = ?auto_27447 ?auto_27449 ) ) ( not ( = ?auto_27447 ?auto_27473 ) ) ( not ( = ?auto_27449 ?auto_27480 ) ) ( not ( = ?auto_27449 ?auto_27467 ) ) ( not ( = ?auto_27449 ?auto_27474 ) ) ( not ( = ?auto_27449 ?auto_27466 ) ) ( not ( = ?auto_27449 ?auto_27472 ) ) ( not ( = ?auto_27479 ?auto_27462 ) ) ( not ( = ?auto_27479 ?auto_27478 ) ) ( not ( = ?auto_27479 ?auto_27471 ) ) ( not ( = ?auto_27479 ?auto_27460 ) ) ( not ( = ?auto_27463 ?auto_27477 ) ) ( not ( = ?auto_27463 ?auto_27476 ) ) ( not ( = ?auto_27463 ?auto_27470 ) ) ( not ( = ?auto_27463 ?auto_27465 ) ) ( not ( = ?auto_27473 ?auto_27480 ) ) ( not ( = ?auto_27473 ?auto_27467 ) ) ( not ( = ?auto_27473 ?auto_27474 ) ) ( not ( = ?auto_27473 ?auto_27466 ) ) ( not ( = ?auto_27473 ?auto_27472 ) ) ( not ( = ?auto_27443 ?auto_27452 ) ) ( not ( = ?auto_27443 ?auto_27461 ) ) ( not ( = ?auto_27444 ?auto_27452 ) ) ( not ( = ?auto_27444 ?auto_27461 ) ) ( not ( = ?auto_27445 ?auto_27452 ) ) ( not ( = ?auto_27445 ?auto_27461 ) ) ( not ( = ?auto_27446 ?auto_27452 ) ) ( not ( = ?auto_27446 ?auto_27461 ) ) ( not ( = ?auto_27447 ?auto_27452 ) ) ( not ( = ?auto_27447 ?auto_27461 ) ) ( not ( = ?auto_27448 ?auto_27452 ) ) ( not ( = ?auto_27448 ?auto_27461 ) ) ( not ( = ?auto_27452 ?auto_27473 ) ) ( not ( = ?auto_27452 ?auto_27480 ) ) ( not ( = ?auto_27452 ?auto_27467 ) ) ( not ( = ?auto_27452 ?auto_27474 ) ) ( not ( = ?auto_27452 ?auto_27466 ) ) ( not ( = ?auto_27452 ?auto_27472 ) ) ( not ( = ?auto_27468 ?auto_27479 ) ) ( not ( = ?auto_27468 ?auto_27462 ) ) ( not ( = ?auto_27468 ?auto_27478 ) ) ( not ( = ?auto_27468 ?auto_27471 ) ) ( not ( = ?auto_27468 ?auto_27460 ) ) ( not ( = ?auto_27475 ?auto_27463 ) ) ( not ( = ?auto_27475 ?auto_27477 ) ) ( not ( = ?auto_27475 ?auto_27476 ) ) ( not ( = ?auto_27475 ?auto_27470 ) ) ( not ( = ?auto_27475 ?auto_27465 ) ) ( not ( = ?auto_27461 ?auto_27473 ) ) ( not ( = ?auto_27461 ?auto_27480 ) ) ( not ( = ?auto_27461 ?auto_27467 ) ) ( not ( = ?auto_27461 ?auto_27474 ) ) ( not ( = ?auto_27461 ?auto_27466 ) ) ( not ( = ?auto_27461 ?auto_27472 ) ) ( not ( = ?auto_27443 ?auto_27451 ) ) ( not ( = ?auto_27443 ?auto_27469 ) ) ( not ( = ?auto_27444 ?auto_27451 ) ) ( not ( = ?auto_27444 ?auto_27469 ) ) ( not ( = ?auto_27445 ?auto_27451 ) ) ( not ( = ?auto_27445 ?auto_27469 ) ) ( not ( = ?auto_27446 ?auto_27451 ) ) ( not ( = ?auto_27446 ?auto_27469 ) ) ( not ( = ?auto_27447 ?auto_27451 ) ) ( not ( = ?auto_27447 ?auto_27469 ) ) ( not ( = ?auto_27448 ?auto_27451 ) ) ( not ( = ?auto_27448 ?auto_27469 ) ) ( not ( = ?auto_27449 ?auto_27451 ) ) ( not ( = ?auto_27449 ?auto_27469 ) ) ( not ( = ?auto_27451 ?auto_27461 ) ) ( not ( = ?auto_27451 ?auto_27473 ) ) ( not ( = ?auto_27451 ?auto_27480 ) ) ( not ( = ?auto_27451 ?auto_27467 ) ) ( not ( = ?auto_27451 ?auto_27474 ) ) ( not ( = ?auto_27451 ?auto_27466 ) ) ( not ( = ?auto_27451 ?auto_27472 ) ) ( not ( = ?auto_27469 ?auto_27461 ) ) ( not ( = ?auto_27469 ?auto_27473 ) ) ( not ( = ?auto_27469 ?auto_27480 ) ) ( not ( = ?auto_27469 ?auto_27467 ) ) ( not ( = ?auto_27469 ?auto_27474 ) ) ( not ( = ?auto_27469 ?auto_27466 ) ) ( not ( = ?auto_27469 ?auto_27472 ) ) ( not ( = ?auto_27443 ?auto_27450 ) ) ( not ( = ?auto_27443 ?auto_27464 ) ) ( not ( = ?auto_27444 ?auto_27450 ) ) ( not ( = ?auto_27444 ?auto_27464 ) ) ( not ( = ?auto_27445 ?auto_27450 ) ) ( not ( = ?auto_27445 ?auto_27464 ) ) ( not ( = ?auto_27446 ?auto_27450 ) ) ( not ( = ?auto_27446 ?auto_27464 ) ) ( not ( = ?auto_27447 ?auto_27450 ) ) ( not ( = ?auto_27447 ?auto_27464 ) ) ( not ( = ?auto_27448 ?auto_27450 ) ) ( not ( = ?auto_27448 ?auto_27464 ) ) ( not ( = ?auto_27449 ?auto_27450 ) ) ( not ( = ?auto_27449 ?auto_27464 ) ) ( not ( = ?auto_27452 ?auto_27450 ) ) ( not ( = ?auto_27452 ?auto_27464 ) ) ( not ( = ?auto_27450 ?auto_27469 ) ) ( not ( = ?auto_27450 ?auto_27461 ) ) ( not ( = ?auto_27450 ?auto_27473 ) ) ( not ( = ?auto_27450 ?auto_27480 ) ) ( not ( = ?auto_27450 ?auto_27467 ) ) ( not ( = ?auto_27450 ?auto_27474 ) ) ( not ( = ?auto_27450 ?auto_27466 ) ) ( not ( = ?auto_27450 ?auto_27472 ) ) ( not ( = ?auto_27464 ?auto_27469 ) ) ( not ( = ?auto_27464 ?auto_27461 ) ) ( not ( = ?auto_27464 ?auto_27473 ) ) ( not ( = ?auto_27464 ?auto_27480 ) ) ( not ( = ?auto_27464 ?auto_27467 ) ) ( not ( = ?auto_27464 ?auto_27474 ) ) ( not ( = ?auto_27464 ?auto_27466 ) ) ( not ( = ?auto_27464 ?auto_27472 ) ) ( not ( = ?auto_27443 ?auto_27453 ) ) ( not ( = ?auto_27443 ?auto_27457 ) ) ( not ( = ?auto_27444 ?auto_27453 ) ) ( not ( = ?auto_27444 ?auto_27457 ) ) ( not ( = ?auto_27445 ?auto_27453 ) ) ( not ( = ?auto_27445 ?auto_27457 ) ) ( not ( = ?auto_27446 ?auto_27453 ) ) ( not ( = ?auto_27446 ?auto_27457 ) ) ( not ( = ?auto_27447 ?auto_27453 ) ) ( not ( = ?auto_27447 ?auto_27457 ) ) ( not ( = ?auto_27448 ?auto_27453 ) ) ( not ( = ?auto_27448 ?auto_27457 ) ) ( not ( = ?auto_27449 ?auto_27453 ) ) ( not ( = ?auto_27449 ?auto_27457 ) ) ( not ( = ?auto_27452 ?auto_27453 ) ) ( not ( = ?auto_27452 ?auto_27457 ) ) ( not ( = ?auto_27451 ?auto_27453 ) ) ( not ( = ?auto_27451 ?auto_27457 ) ) ( not ( = ?auto_27453 ?auto_27464 ) ) ( not ( = ?auto_27453 ?auto_27469 ) ) ( not ( = ?auto_27453 ?auto_27461 ) ) ( not ( = ?auto_27453 ?auto_27473 ) ) ( not ( = ?auto_27453 ?auto_27480 ) ) ( not ( = ?auto_27453 ?auto_27467 ) ) ( not ( = ?auto_27453 ?auto_27474 ) ) ( not ( = ?auto_27453 ?auto_27466 ) ) ( not ( = ?auto_27453 ?auto_27472 ) ) ( not ( = ?auto_27456 ?auto_27478 ) ) ( not ( = ?auto_27456 ?auto_27471 ) ) ( not ( = ?auto_27456 ?auto_27468 ) ) ( not ( = ?auto_27456 ?auto_27479 ) ) ( not ( = ?auto_27456 ?auto_27462 ) ) ( not ( = ?auto_27456 ?auto_27460 ) ) ( not ( = ?auto_27455 ?auto_27476 ) ) ( not ( = ?auto_27455 ?auto_27470 ) ) ( not ( = ?auto_27455 ?auto_27475 ) ) ( not ( = ?auto_27455 ?auto_27463 ) ) ( not ( = ?auto_27455 ?auto_27477 ) ) ( not ( = ?auto_27455 ?auto_27465 ) ) ( not ( = ?auto_27457 ?auto_27464 ) ) ( not ( = ?auto_27457 ?auto_27469 ) ) ( not ( = ?auto_27457 ?auto_27461 ) ) ( not ( = ?auto_27457 ?auto_27473 ) ) ( not ( = ?auto_27457 ?auto_27480 ) ) ( not ( = ?auto_27457 ?auto_27467 ) ) ( not ( = ?auto_27457 ?auto_27474 ) ) ( not ( = ?auto_27457 ?auto_27466 ) ) ( not ( = ?auto_27457 ?auto_27472 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_27443 ?auto_27444 ?auto_27445 ?auto_27446 ?auto_27447 ?auto_27448 ?auto_27449 ?auto_27452 ?auto_27451 ?auto_27450 )
      ( MAKE-1CRATE ?auto_27450 ?auto_27453 )
      ( MAKE-10CRATE-VERIFY ?auto_27443 ?auto_27444 ?auto_27445 ?auto_27446 ?auto_27447 ?auto_27448 ?auto_27449 ?auto_27452 ?auto_27451 ?auto_27450 ?auto_27453 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27483 - SURFACE
      ?auto_27484 - SURFACE
    )
    :vars
    (
      ?auto_27485 - HOIST
      ?auto_27486 - PLACE
      ?auto_27488 - PLACE
      ?auto_27489 - HOIST
      ?auto_27490 - SURFACE
      ?auto_27487 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27485 ?auto_27486 ) ( SURFACE-AT ?auto_27483 ?auto_27486 ) ( CLEAR ?auto_27483 ) ( IS-CRATE ?auto_27484 ) ( AVAILABLE ?auto_27485 ) ( not ( = ?auto_27488 ?auto_27486 ) ) ( HOIST-AT ?auto_27489 ?auto_27488 ) ( AVAILABLE ?auto_27489 ) ( SURFACE-AT ?auto_27484 ?auto_27488 ) ( ON ?auto_27484 ?auto_27490 ) ( CLEAR ?auto_27484 ) ( TRUCK-AT ?auto_27487 ?auto_27486 ) ( not ( = ?auto_27483 ?auto_27484 ) ) ( not ( = ?auto_27483 ?auto_27490 ) ) ( not ( = ?auto_27484 ?auto_27490 ) ) ( not ( = ?auto_27485 ?auto_27489 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27487 ?auto_27486 ?auto_27488 )
      ( !LIFT ?auto_27489 ?auto_27484 ?auto_27490 ?auto_27488 )
      ( !LOAD ?auto_27489 ?auto_27484 ?auto_27487 ?auto_27488 )
      ( !DRIVE ?auto_27487 ?auto_27488 ?auto_27486 )
      ( !UNLOAD ?auto_27485 ?auto_27484 ?auto_27487 ?auto_27486 )
      ( !DROP ?auto_27485 ?auto_27484 ?auto_27483 ?auto_27486 )
      ( MAKE-1CRATE-VERIFY ?auto_27483 ?auto_27484 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_27503 - SURFACE
      ?auto_27504 - SURFACE
      ?auto_27505 - SURFACE
      ?auto_27506 - SURFACE
      ?auto_27507 - SURFACE
      ?auto_27508 - SURFACE
      ?auto_27509 - SURFACE
      ?auto_27512 - SURFACE
      ?auto_27511 - SURFACE
      ?auto_27510 - SURFACE
      ?auto_27513 - SURFACE
      ?auto_27514 - SURFACE
    )
    :vars
    (
      ?auto_27518 - HOIST
      ?auto_27517 - PLACE
      ?auto_27516 - PLACE
      ?auto_27519 - HOIST
      ?auto_27520 - SURFACE
      ?auto_27526 - PLACE
      ?auto_27522 - HOIST
      ?auto_27523 - SURFACE
      ?auto_27529 - PLACE
      ?auto_27531 - HOIST
      ?auto_27535 - SURFACE
      ?auto_27533 - PLACE
      ?auto_27525 - HOIST
      ?auto_27528 - SURFACE
      ?auto_27530 - PLACE
      ?auto_27539 - HOIST
      ?auto_27536 - SURFACE
      ?auto_27521 - PLACE
      ?auto_27542 - HOIST
      ?auto_27538 - SURFACE
      ?auto_27532 - PLACE
      ?auto_27534 - HOIST
      ?auto_27541 - SURFACE
      ?auto_27540 - SURFACE
      ?auto_27527 - SURFACE
      ?auto_27537 - SURFACE
      ?auto_27524 - SURFACE
      ?auto_27515 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27518 ?auto_27517 ) ( IS-CRATE ?auto_27514 ) ( not ( = ?auto_27516 ?auto_27517 ) ) ( HOIST-AT ?auto_27519 ?auto_27516 ) ( SURFACE-AT ?auto_27514 ?auto_27516 ) ( ON ?auto_27514 ?auto_27520 ) ( CLEAR ?auto_27514 ) ( not ( = ?auto_27513 ?auto_27514 ) ) ( not ( = ?auto_27513 ?auto_27520 ) ) ( not ( = ?auto_27514 ?auto_27520 ) ) ( not ( = ?auto_27518 ?auto_27519 ) ) ( IS-CRATE ?auto_27513 ) ( not ( = ?auto_27526 ?auto_27517 ) ) ( HOIST-AT ?auto_27522 ?auto_27526 ) ( AVAILABLE ?auto_27522 ) ( SURFACE-AT ?auto_27513 ?auto_27526 ) ( ON ?auto_27513 ?auto_27523 ) ( CLEAR ?auto_27513 ) ( not ( = ?auto_27510 ?auto_27513 ) ) ( not ( = ?auto_27510 ?auto_27523 ) ) ( not ( = ?auto_27513 ?auto_27523 ) ) ( not ( = ?auto_27518 ?auto_27522 ) ) ( IS-CRATE ?auto_27510 ) ( not ( = ?auto_27529 ?auto_27517 ) ) ( HOIST-AT ?auto_27531 ?auto_27529 ) ( SURFACE-AT ?auto_27510 ?auto_27529 ) ( ON ?auto_27510 ?auto_27535 ) ( CLEAR ?auto_27510 ) ( not ( = ?auto_27511 ?auto_27510 ) ) ( not ( = ?auto_27511 ?auto_27535 ) ) ( not ( = ?auto_27510 ?auto_27535 ) ) ( not ( = ?auto_27518 ?auto_27531 ) ) ( IS-CRATE ?auto_27511 ) ( not ( = ?auto_27533 ?auto_27517 ) ) ( HOIST-AT ?auto_27525 ?auto_27533 ) ( SURFACE-AT ?auto_27511 ?auto_27533 ) ( ON ?auto_27511 ?auto_27528 ) ( CLEAR ?auto_27511 ) ( not ( = ?auto_27512 ?auto_27511 ) ) ( not ( = ?auto_27512 ?auto_27528 ) ) ( not ( = ?auto_27511 ?auto_27528 ) ) ( not ( = ?auto_27518 ?auto_27525 ) ) ( IS-CRATE ?auto_27512 ) ( not ( = ?auto_27530 ?auto_27517 ) ) ( HOIST-AT ?auto_27539 ?auto_27530 ) ( AVAILABLE ?auto_27539 ) ( SURFACE-AT ?auto_27512 ?auto_27530 ) ( ON ?auto_27512 ?auto_27536 ) ( CLEAR ?auto_27512 ) ( not ( = ?auto_27509 ?auto_27512 ) ) ( not ( = ?auto_27509 ?auto_27536 ) ) ( not ( = ?auto_27512 ?auto_27536 ) ) ( not ( = ?auto_27518 ?auto_27539 ) ) ( IS-CRATE ?auto_27509 ) ( not ( = ?auto_27521 ?auto_27517 ) ) ( HOIST-AT ?auto_27542 ?auto_27521 ) ( AVAILABLE ?auto_27542 ) ( SURFACE-AT ?auto_27509 ?auto_27521 ) ( ON ?auto_27509 ?auto_27538 ) ( CLEAR ?auto_27509 ) ( not ( = ?auto_27508 ?auto_27509 ) ) ( not ( = ?auto_27508 ?auto_27538 ) ) ( not ( = ?auto_27509 ?auto_27538 ) ) ( not ( = ?auto_27518 ?auto_27542 ) ) ( IS-CRATE ?auto_27508 ) ( not ( = ?auto_27532 ?auto_27517 ) ) ( HOIST-AT ?auto_27534 ?auto_27532 ) ( SURFACE-AT ?auto_27508 ?auto_27532 ) ( ON ?auto_27508 ?auto_27541 ) ( CLEAR ?auto_27508 ) ( not ( = ?auto_27507 ?auto_27508 ) ) ( not ( = ?auto_27507 ?auto_27541 ) ) ( not ( = ?auto_27508 ?auto_27541 ) ) ( not ( = ?auto_27518 ?auto_27534 ) ) ( IS-CRATE ?auto_27507 ) ( AVAILABLE ?auto_27534 ) ( SURFACE-AT ?auto_27507 ?auto_27532 ) ( ON ?auto_27507 ?auto_27540 ) ( CLEAR ?auto_27507 ) ( not ( = ?auto_27506 ?auto_27507 ) ) ( not ( = ?auto_27506 ?auto_27540 ) ) ( not ( = ?auto_27507 ?auto_27540 ) ) ( IS-CRATE ?auto_27506 ) ( AVAILABLE ?auto_27531 ) ( SURFACE-AT ?auto_27506 ?auto_27529 ) ( ON ?auto_27506 ?auto_27527 ) ( CLEAR ?auto_27506 ) ( not ( = ?auto_27505 ?auto_27506 ) ) ( not ( = ?auto_27505 ?auto_27527 ) ) ( not ( = ?auto_27506 ?auto_27527 ) ) ( IS-CRATE ?auto_27505 ) ( AVAILABLE ?auto_27525 ) ( SURFACE-AT ?auto_27505 ?auto_27533 ) ( ON ?auto_27505 ?auto_27537 ) ( CLEAR ?auto_27505 ) ( not ( = ?auto_27504 ?auto_27505 ) ) ( not ( = ?auto_27504 ?auto_27537 ) ) ( not ( = ?auto_27505 ?auto_27537 ) ) ( SURFACE-AT ?auto_27503 ?auto_27517 ) ( CLEAR ?auto_27503 ) ( IS-CRATE ?auto_27504 ) ( AVAILABLE ?auto_27518 ) ( AVAILABLE ?auto_27519 ) ( SURFACE-AT ?auto_27504 ?auto_27516 ) ( ON ?auto_27504 ?auto_27524 ) ( CLEAR ?auto_27504 ) ( TRUCK-AT ?auto_27515 ?auto_27517 ) ( not ( = ?auto_27503 ?auto_27504 ) ) ( not ( = ?auto_27503 ?auto_27524 ) ) ( not ( = ?auto_27504 ?auto_27524 ) ) ( not ( = ?auto_27503 ?auto_27505 ) ) ( not ( = ?auto_27503 ?auto_27537 ) ) ( not ( = ?auto_27505 ?auto_27524 ) ) ( not ( = ?auto_27533 ?auto_27516 ) ) ( not ( = ?auto_27525 ?auto_27519 ) ) ( not ( = ?auto_27537 ?auto_27524 ) ) ( not ( = ?auto_27503 ?auto_27506 ) ) ( not ( = ?auto_27503 ?auto_27527 ) ) ( not ( = ?auto_27504 ?auto_27506 ) ) ( not ( = ?auto_27504 ?auto_27527 ) ) ( not ( = ?auto_27506 ?auto_27537 ) ) ( not ( = ?auto_27506 ?auto_27524 ) ) ( not ( = ?auto_27529 ?auto_27533 ) ) ( not ( = ?auto_27529 ?auto_27516 ) ) ( not ( = ?auto_27531 ?auto_27525 ) ) ( not ( = ?auto_27531 ?auto_27519 ) ) ( not ( = ?auto_27527 ?auto_27537 ) ) ( not ( = ?auto_27527 ?auto_27524 ) ) ( not ( = ?auto_27503 ?auto_27507 ) ) ( not ( = ?auto_27503 ?auto_27540 ) ) ( not ( = ?auto_27504 ?auto_27507 ) ) ( not ( = ?auto_27504 ?auto_27540 ) ) ( not ( = ?auto_27505 ?auto_27507 ) ) ( not ( = ?auto_27505 ?auto_27540 ) ) ( not ( = ?auto_27507 ?auto_27527 ) ) ( not ( = ?auto_27507 ?auto_27537 ) ) ( not ( = ?auto_27507 ?auto_27524 ) ) ( not ( = ?auto_27532 ?auto_27529 ) ) ( not ( = ?auto_27532 ?auto_27533 ) ) ( not ( = ?auto_27532 ?auto_27516 ) ) ( not ( = ?auto_27534 ?auto_27531 ) ) ( not ( = ?auto_27534 ?auto_27525 ) ) ( not ( = ?auto_27534 ?auto_27519 ) ) ( not ( = ?auto_27540 ?auto_27527 ) ) ( not ( = ?auto_27540 ?auto_27537 ) ) ( not ( = ?auto_27540 ?auto_27524 ) ) ( not ( = ?auto_27503 ?auto_27508 ) ) ( not ( = ?auto_27503 ?auto_27541 ) ) ( not ( = ?auto_27504 ?auto_27508 ) ) ( not ( = ?auto_27504 ?auto_27541 ) ) ( not ( = ?auto_27505 ?auto_27508 ) ) ( not ( = ?auto_27505 ?auto_27541 ) ) ( not ( = ?auto_27506 ?auto_27508 ) ) ( not ( = ?auto_27506 ?auto_27541 ) ) ( not ( = ?auto_27508 ?auto_27540 ) ) ( not ( = ?auto_27508 ?auto_27527 ) ) ( not ( = ?auto_27508 ?auto_27537 ) ) ( not ( = ?auto_27508 ?auto_27524 ) ) ( not ( = ?auto_27541 ?auto_27540 ) ) ( not ( = ?auto_27541 ?auto_27527 ) ) ( not ( = ?auto_27541 ?auto_27537 ) ) ( not ( = ?auto_27541 ?auto_27524 ) ) ( not ( = ?auto_27503 ?auto_27509 ) ) ( not ( = ?auto_27503 ?auto_27538 ) ) ( not ( = ?auto_27504 ?auto_27509 ) ) ( not ( = ?auto_27504 ?auto_27538 ) ) ( not ( = ?auto_27505 ?auto_27509 ) ) ( not ( = ?auto_27505 ?auto_27538 ) ) ( not ( = ?auto_27506 ?auto_27509 ) ) ( not ( = ?auto_27506 ?auto_27538 ) ) ( not ( = ?auto_27507 ?auto_27509 ) ) ( not ( = ?auto_27507 ?auto_27538 ) ) ( not ( = ?auto_27509 ?auto_27541 ) ) ( not ( = ?auto_27509 ?auto_27540 ) ) ( not ( = ?auto_27509 ?auto_27527 ) ) ( not ( = ?auto_27509 ?auto_27537 ) ) ( not ( = ?auto_27509 ?auto_27524 ) ) ( not ( = ?auto_27521 ?auto_27532 ) ) ( not ( = ?auto_27521 ?auto_27529 ) ) ( not ( = ?auto_27521 ?auto_27533 ) ) ( not ( = ?auto_27521 ?auto_27516 ) ) ( not ( = ?auto_27542 ?auto_27534 ) ) ( not ( = ?auto_27542 ?auto_27531 ) ) ( not ( = ?auto_27542 ?auto_27525 ) ) ( not ( = ?auto_27542 ?auto_27519 ) ) ( not ( = ?auto_27538 ?auto_27541 ) ) ( not ( = ?auto_27538 ?auto_27540 ) ) ( not ( = ?auto_27538 ?auto_27527 ) ) ( not ( = ?auto_27538 ?auto_27537 ) ) ( not ( = ?auto_27538 ?auto_27524 ) ) ( not ( = ?auto_27503 ?auto_27512 ) ) ( not ( = ?auto_27503 ?auto_27536 ) ) ( not ( = ?auto_27504 ?auto_27512 ) ) ( not ( = ?auto_27504 ?auto_27536 ) ) ( not ( = ?auto_27505 ?auto_27512 ) ) ( not ( = ?auto_27505 ?auto_27536 ) ) ( not ( = ?auto_27506 ?auto_27512 ) ) ( not ( = ?auto_27506 ?auto_27536 ) ) ( not ( = ?auto_27507 ?auto_27512 ) ) ( not ( = ?auto_27507 ?auto_27536 ) ) ( not ( = ?auto_27508 ?auto_27512 ) ) ( not ( = ?auto_27508 ?auto_27536 ) ) ( not ( = ?auto_27512 ?auto_27538 ) ) ( not ( = ?auto_27512 ?auto_27541 ) ) ( not ( = ?auto_27512 ?auto_27540 ) ) ( not ( = ?auto_27512 ?auto_27527 ) ) ( not ( = ?auto_27512 ?auto_27537 ) ) ( not ( = ?auto_27512 ?auto_27524 ) ) ( not ( = ?auto_27530 ?auto_27521 ) ) ( not ( = ?auto_27530 ?auto_27532 ) ) ( not ( = ?auto_27530 ?auto_27529 ) ) ( not ( = ?auto_27530 ?auto_27533 ) ) ( not ( = ?auto_27530 ?auto_27516 ) ) ( not ( = ?auto_27539 ?auto_27542 ) ) ( not ( = ?auto_27539 ?auto_27534 ) ) ( not ( = ?auto_27539 ?auto_27531 ) ) ( not ( = ?auto_27539 ?auto_27525 ) ) ( not ( = ?auto_27539 ?auto_27519 ) ) ( not ( = ?auto_27536 ?auto_27538 ) ) ( not ( = ?auto_27536 ?auto_27541 ) ) ( not ( = ?auto_27536 ?auto_27540 ) ) ( not ( = ?auto_27536 ?auto_27527 ) ) ( not ( = ?auto_27536 ?auto_27537 ) ) ( not ( = ?auto_27536 ?auto_27524 ) ) ( not ( = ?auto_27503 ?auto_27511 ) ) ( not ( = ?auto_27503 ?auto_27528 ) ) ( not ( = ?auto_27504 ?auto_27511 ) ) ( not ( = ?auto_27504 ?auto_27528 ) ) ( not ( = ?auto_27505 ?auto_27511 ) ) ( not ( = ?auto_27505 ?auto_27528 ) ) ( not ( = ?auto_27506 ?auto_27511 ) ) ( not ( = ?auto_27506 ?auto_27528 ) ) ( not ( = ?auto_27507 ?auto_27511 ) ) ( not ( = ?auto_27507 ?auto_27528 ) ) ( not ( = ?auto_27508 ?auto_27511 ) ) ( not ( = ?auto_27508 ?auto_27528 ) ) ( not ( = ?auto_27509 ?auto_27511 ) ) ( not ( = ?auto_27509 ?auto_27528 ) ) ( not ( = ?auto_27511 ?auto_27536 ) ) ( not ( = ?auto_27511 ?auto_27538 ) ) ( not ( = ?auto_27511 ?auto_27541 ) ) ( not ( = ?auto_27511 ?auto_27540 ) ) ( not ( = ?auto_27511 ?auto_27527 ) ) ( not ( = ?auto_27511 ?auto_27537 ) ) ( not ( = ?auto_27511 ?auto_27524 ) ) ( not ( = ?auto_27528 ?auto_27536 ) ) ( not ( = ?auto_27528 ?auto_27538 ) ) ( not ( = ?auto_27528 ?auto_27541 ) ) ( not ( = ?auto_27528 ?auto_27540 ) ) ( not ( = ?auto_27528 ?auto_27527 ) ) ( not ( = ?auto_27528 ?auto_27537 ) ) ( not ( = ?auto_27528 ?auto_27524 ) ) ( not ( = ?auto_27503 ?auto_27510 ) ) ( not ( = ?auto_27503 ?auto_27535 ) ) ( not ( = ?auto_27504 ?auto_27510 ) ) ( not ( = ?auto_27504 ?auto_27535 ) ) ( not ( = ?auto_27505 ?auto_27510 ) ) ( not ( = ?auto_27505 ?auto_27535 ) ) ( not ( = ?auto_27506 ?auto_27510 ) ) ( not ( = ?auto_27506 ?auto_27535 ) ) ( not ( = ?auto_27507 ?auto_27510 ) ) ( not ( = ?auto_27507 ?auto_27535 ) ) ( not ( = ?auto_27508 ?auto_27510 ) ) ( not ( = ?auto_27508 ?auto_27535 ) ) ( not ( = ?auto_27509 ?auto_27510 ) ) ( not ( = ?auto_27509 ?auto_27535 ) ) ( not ( = ?auto_27512 ?auto_27510 ) ) ( not ( = ?auto_27512 ?auto_27535 ) ) ( not ( = ?auto_27510 ?auto_27528 ) ) ( not ( = ?auto_27510 ?auto_27536 ) ) ( not ( = ?auto_27510 ?auto_27538 ) ) ( not ( = ?auto_27510 ?auto_27541 ) ) ( not ( = ?auto_27510 ?auto_27540 ) ) ( not ( = ?auto_27510 ?auto_27527 ) ) ( not ( = ?auto_27510 ?auto_27537 ) ) ( not ( = ?auto_27510 ?auto_27524 ) ) ( not ( = ?auto_27535 ?auto_27528 ) ) ( not ( = ?auto_27535 ?auto_27536 ) ) ( not ( = ?auto_27535 ?auto_27538 ) ) ( not ( = ?auto_27535 ?auto_27541 ) ) ( not ( = ?auto_27535 ?auto_27540 ) ) ( not ( = ?auto_27535 ?auto_27527 ) ) ( not ( = ?auto_27535 ?auto_27537 ) ) ( not ( = ?auto_27535 ?auto_27524 ) ) ( not ( = ?auto_27503 ?auto_27513 ) ) ( not ( = ?auto_27503 ?auto_27523 ) ) ( not ( = ?auto_27504 ?auto_27513 ) ) ( not ( = ?auto_27504 ?auto_27523 ) ) ( not ( = ?auto_27505 ?auto_27513 ) ) ( not ( = ?auto_27505 ?auto_27523 ) ) ( not ( = ?auto_27506 ?auto_27513 ) ) ( not ( = ?auto_27506 ?auto_27523 ) ) ( not ( = ?auto_27507 ?auto_27513 ) ) ( not ( = ?auto_27507 ?auto_27523 ) ) ( not ( = ?auto_27508 ?auto_27513 ) ) ( not ( = ?auto_27508 ?auto_27523 ) ) ( not ( = ?auto_27509 ?auto_27513 ) ) ( not ( = ?auto_27509 ?auto_27523 ) ) ( not ( = ?auto_27512 ?auto_27513 ) ) ( not ( = ?auto_27512 ?auto_27523 ) ) ( not ( = ?auto_27511 ?auto_27513 ) ) ( not ( = ?auto_27511 ?auto_27523 ) ) ( not ( = ?auto_27513 ?auto_27535 ) ) ( not ( = ?auto_27513 ?auto_27528 ) ) ( not ( = ?auto_27513 ?auto_27536 ) ) ( not ( = ?auto_27513 ?auto_27538 ) ) ( not ( = ?auto_27513 ?auto_27541 ) ) ( not ( = ?auto_27513 ?auto_27540 ) ) ( not ( = ?auto_27513 ?auto_27527 ) ) ( not ( = ?auto_27513 ?auto_27537 ) ) ( not ( = ?auto_27513 ?auto_27524 ) ) ( not ( = ?auto_27526 ?auto_27529 ) ) ( not ( = ?auto_27526 ?auto_27533 ) ) ( not ( = ?auto_27526 ?auto_27530 ) ) ( not ( = ?auto_27526 ?auto_27521 ) ) ( not ( = ?auto_27526 ?auto_27532 ) ) ( not ( = ?auto_27526 ?auto_27516 ) ) ( not ( = ?auto_27522 ?auto_27531 ) ) ( not ( = ?auto_27522 ?auto_27525 ) ) ( not ( = ?auto_27522 ?auto_27539 ) ) ( not ( = ?auto_27522 ?auto_27542 ) ) ( not ( = ?auto_27522 ?auto_27534 ) ) ( not ( = ?auto_27522 ?auto_27519 ) ) ( not ( = ?auto_27523 ?auto_27535 ) ) ( not ( = ?auto_27523 ?auto_27528 ) ) ( not ( = ?auto_27523 ?auto_27536 ) ) ( not ( = ?auto_27523 ?auto_27538 ) ) ( not ( = ?auto_27523 ?auto_27541 ) ) ( not ( = ?auto_27523 ?auto_27540 ) ) ( not ( = ?auto_27523 ?auto_27527 ) ) ( not ( = ?auto_27523 ?auto_27537 ) ) ( not ( = ?auto_27523 ?auto_27524 ) ) ( not ( = ?auto_27503 ?auto_27514 ) ) ( not ( = ?auto_27503 ?auto_27520 ) ) ( not ( = ?auto_27504 ?auto_27514 ) ) ( not ( = ?auto_27504 ?auto_27520 ) ) ( not ( = ?auto_27505 ?auto_27514 ) ) ( not ( = ?auto_27505 ?auto_27520 ) ) ( not ( = ?auto_27506 ?auto_27514 ) ) ( not ( = ?auto_27506 ?auto_27520 ) ) ( not ( = ?auto_27507 ?auto_27514 ) ) ( not ( = ?auto_27507 ?auto_27520 ) ) ( not ( = ?auto_27508 ?auto_27514 ) ) ( not ( = ?auto_27508 ?auto_27520 ) ) ( not ( = ?auto_27509 ?auto_27514 ) ) ( not ( = ?auto_27509 ?auto_27520 ) ) ( not ( = ?auto_27512 ?auto_27514 ) ) ( not ( = ?auto_27512 ?auto_27520 ) ) ( not ( = ?auto_27511 ?auto_27514 ) ) ( not ( = ?auto_27511 ?auto_27520 ) ) ( not ( = ?auto_27510 ?auto_27514 ) ) ( not ( = ?auto_27510 ?auto_27520 ) ) ( not ( = ?auto_27514 ?auto_27523 ) ) ( not ( = ?auto_27514 ?auto_27535 ) ) ( not ( = ?auto_27514 ?auto_27528 ) ) ( not ( = ?auto_27514 ?auto_27536 ) ) ( not ( = ?auto_27514 ?auto_27538 ) ) ( not ( = ?auto_27514 ?auto_27541 ) ) ( not ( = ?auto_27514 ?auto_27540 ) ) ( not ( = ?auto_27514 ?auto_27527 ) ) ( not ( = ?auto_27514 ?auto_27537 ) ) ( not ( = ?auto_27514 ?auto_27524 ) ) ( not ( = ?auto_27520 ?auto_27523 ) ) ( not ( = ?auto_27520 ?auto_27535 ) ) ( not ( = ?auto_27520 ?auto_27528 ) ) ( not ( = ?auto_27520 ?auto_27536 ) ) ( not ( = ?auto_27520 ?auto_27538 ) ) ( not ( = ?auto_27520 ?auto_27541 ) ) ( not ( = ?auto_27520 ?auto_27540 ) ) ( not ( = ?auto_27520 ?auto_27527 ) ) ( not ( = ?auto_27520 ?auto_27537 ) ) ( not ( = ?auto_27520 ?auto_27524 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_27503 ?auto_27504 ?auto_27505 ?auto_27506 ?auto_27507 ?auto_27508 ?auto_27509 ?auto_27512 ?auto_27511 ?auto_27510 ?auto_27513 )
      ( MAKE-1CRATE ?auto_27513 ?auto_27514 )
      ( MAKE-11CRATE-VERIFY ?auto_27503 ?auto_27504 ?auto_27505 ?auto_27506 ?auto_27507 ?auto_27508 ?auto_27509 ?auto_27512 ?auto_27511 ?auto_27510 ?auto_27513 ?auto_27514 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27545 - SURFACE
      ?auto_27546 - SURFACE
    )
    :vars
    (
      ?auto_27547 - HOIST
      ?auto_27548 - PLACE
      ?auto_27550 - PLACE
      ?auto_27551 - HOIST
      ?auto_27552 - SURFACE
      ?auto_27549 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27547 ?auto_27548 ) ( SURFACE-AT ?auto_27545 ?auto_27548 ) ( CLEAR ?auto_27545 ) ( IS-CRATE ?auto_27546 ) ( AVAILABLE ?auto_27547 ) ( not ( = ?auto_27550 ?auto_27548 ) ) ( HOIST-AT ?auto_27551 ?auto_27550 ) ( AVAILABLE ?auto_27551 ) ( SURFACE-AT ?auto_27546 ?auto_27550 ) ( ON ?auto_27546 ?auto_27552 ) ( CLEAR ?auto_27546 ) ( TRUCK-AT ?auto_27549 ?auto_27548 ) ( not ( = ?auto_27545 ?auto_27546 ) ) ( not ( = ?auto_27545 ?auto_27552 ) ) ( not ( = ?auto_27546 ?auto_27552 ) ) ( not ( = ?auto_27547 ?auto_27551 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27549 ?auto_27548 ?auto_27550 )
      ( !LIFT ?auto_27551 ?auto_27546 ?auto_27552 ?auto_27550 )
      ( !LOAD ?auto_27551 ?auto_27546 ?auto_27549 ?auto_27550 )
      ( !DRIVE ?auto_27549 ?auto_27550 ?auto_27548 )
      ( !UNLOAD ?auto_27547 ?auto_27546 ?auto_27549 ?auto_27548 )
      ( !DROP ?auto_27547 ?auto_27546 ?auto_27545 ?auto_27548 )
      ( MAKE-1CRATE-VERIFY ?auto_27545 ?auto_27546 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_27566 - SURFACE
      ?auto_27567 - SURFACE
      ?auto_27568 - SURFACE
      ?auto_27569 - SURFACE
      ?auto_27570 - SURFACE
      ?auto_27571 - SURFACE
      ?auto_27572 - SURFACE
      ?auto_27575 - SURFACE
      ?auto_27574 - SURFACE
      ?auto_27573 - SURFACE
      ?auto_27576 - SURFACE
      ?auto_27577 - SURFACE
      ?auto_27578 - SURFACE
    )
    :vars
    (
      ?auto_27580 - HOIST
      ?auto_27584 - PLACE
      ?auto_27581 - PLACE
      ?auto_27582 - HOIST
      ?auto_27583 - SURFACE
      ?auto_27590 - PLACE
      ?auto_27594 - HOIST
      ?auto_27603 - SURFACE
      ?auto_27599 - PLACE
      ?auto_27593 - HOIST
      ?auto_27606 - SURFACE
      ?auto_27602 - PLACE
      ?auto_27596 - HOIST
      ?auto_27588 - SURFACE
      ?auto_27585 - SURFACE
      ?auto_27601 - PLACE
      ?auto_27587 - HOIST
      ?auto_27597 - SURFACE
      ?auto_27605 - PLACE
      ?auto_27586 - HOIST
      ?auto_27592 - SURFACE
      ?auto_27589 - PLACE
      ?auto_27600 - HOIST
      ?auto_27595 - SURFACE
      ?auto_27598 - SURFACE
      ?auto_27591 - SURFACE
      ?auto_27607 - SURFACE
      ?auto_27604 - SURFACE
      ?auto_27579 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27580 ?auto_27584 ) ( IS-CRATE ?auto_27578 ) ( not ( = ?auto_27581 ?auto_27584 ) ) ( HOIST-AT ?auto_27582 ?auto_27581 ) ( SURFACE-AT ?auto_27578 ?auto_27581 ) ( ON ?auto_27578 ?auto_27583 ) ( CLEAR ?auto_27578 ) ( not ( = ?auto_27577 ?auto_27578 ) ) ( not ( = ?auto_27577 ?auto_27583 ) ) ( not ( = ?auto_27578 ?auto_27583 ) ) ( not ( = ?auto_27580 ?auto_27582 ) ) ( IS-CRATE ?auto_27577 ) ( not ( = ?auto_27590 ?auto_27584 ) ) ( HOIST-AT ?auto_27594 ?auto_27590 ) ( SURFACE-AT ?auto_27577 ?auto_27590 ) ( ON ?auto_27577 ?auto_27603 ) ( CLEAR ?auto_27577 ) ( not ( = ?auto_27576 ?auto_27577 ) ) ( not ( = ?auto_27576 ?auto_27603 ) ) ( not ( = ?auto_27577 ?auto_27603 ) ) ( not ( = ?auto_27580 ?auto_27594 ) ) ( IS-CRATE ?auto_27576 ) ( not ( = ?auto_27599 ?auto_27584 ) ) ( HOIST-AT ?auto_27593 ?auto_27599 ) ( AVAILABLE ?auto_27593 ) ( SURFACE-AT ?auto_27576 ?auto_27599 ) ( ON ?auto_27576 ?auto_27606 ) ( CLEAR ?auto_27576 ) ( not ( = ?auto_27573 ?auto_27576 ) ) ( not ( = ?auto_27573 ?auto_27606 ) ) ( not ( = ?auto_27576 ?auto_27606 ) ) ( not ( = ?auto_27580 ?auto_27593 ) ) ( IS-CRATE ?auto_27573 ) ( not ( = ?auto_27602 ?auto_27584 ) ) ( HOIST-AT ?auto_27596 ?auto_27602 ) ( SURFACE-AT ?auto_27573 ?auto_27602 ) ( ON ?auto_27573 ?auto_27588 ) ( CLEAR ?auto_27573 ) ( not ( = ?auto_27574 ?auto_27573 ) ) ( not ( = ?auto_27574 ?auto_27588 ) ) ( not ( = ?auto_27573 ?auto_27588 ) ) ( not ( = ?auto_27580 ?auto_27596 ) ) ( IS-CRATE ?auto_27574 ) ( SURFACE-AT ?auto_27574 ?auto_27581 ) ( ON ?auto_27574 ?auto_27585 ) ( CLEAR ?auto_27574 ) ( not ( = ?auto_27575 ?auto_27574 ) ) ( not ( = ?auto_27575 ?auto_27585 ) ) ( not ( = ?auto_27574 ?auto_27585 ) ) ( IS-CRATE ?auto_27575 ) ( not ( = ?auto_27601 ?auto_27584 ) ) ( HOIST-AT ?auto_27587 ?auto_27601 ) ( AVAILABLE ?auto_27587 ) ( SURFACE-AT ?auto_27575 ?auto_27601 ) ( ON ?auto_27575 ?auto_27597 ) ( CLEAR ?auto_27575 ) ( not ( = ?auto_27572 ?auto_27575 ) ) ( not ( = ?auto_27572 ?auto_27597 ) ) ( not ( = ?auto_27575 ?auto_27597 ) ) ( not ( = ?auto_27580 ?auto_27587 ) ) ( IS-CRATE ?auto_27572 ) ( not ( = ?auto_27605 ?auto_27584 ) ) ( HOIST-AT ?auto_27586 ?auto_27605 ) ( AVAILABLE ?auto_27586 ) ( SURFACE-AT ?auto_27572 ?auto_27605 ) ( ON ?auto_27572 ?auto_27592 ) ( CLEAR ?auto_27572 ) ( not ( = ?auto_27571 ?auto_27572 ) ) ( not ( = ?auto_27571 ?auto_27592 ) ) ( not ( = ?auto_27572 ?auto_27592 ) ) ( not ( = ?auto_27580 ?auto_27586 ) ) ( IS-CRATE ?auto_27571 ) ( not ( = ?auto_27589 ?auto_27584 ) ) ( HOIST-AT ?auto_27600 ?auto_27589 ) ( SURFACE-AT ?auto_27571 ?auto_27589 ) ( ON ?auto_27571 ?auto_27595 ) ( CLEAR ?auto_27571 ) ( not ( = ?auto_27570 ?auto_27571 ) ) ( not ( = ?auto_27570 ?auto_27595 ) ) ( not ( = ?auto_27571 ?auto_27595 ) ) ( not ( = ?auto_27580 ?auto_27600 ) ) ( IS-CRATE ?auto_27570 ) ( AVAILABLE ?auto_27600 ) ( SURFACE-AT ?auto_27570 ?auto_27589 ) ( ON ?auto_27570 ?auto_27598 ) ( CLEAR ?auto_27570 ) ( not ( = ?auto_27569 ?auto_27570 ) ) ( not ( = ?auto_27569 ?auto_27598 ) ) ( not ( = ?auto_27570 ?auto_27598 ) ) ( IS-CRATE ?auto_27569 ) ( AVAILABLE ?auto_27596 ) ( SURFACE-AT ?auto_27569 ?auto_27602 ) ( ON ?auto_27569 ?auto_27591 ) ( CLEAR ?auto_27569 ) ( not ( = ?auto_27568 ?auto_27569 ) ) ( not ( = ?auto_27568 ?auto_27591 ) ) ( not ( = ?auto_27569 ?auto_27591 ) ) ( IS-CRATE ?auto_27568 ) ( AVAILABLE ?auto_27582 ) ( SURFACE-AT ?auto_27568 ?auto_27581 ) ( ON ?auto_27568 ?auto_27607 ) ( CLEAR ?auto_27568 ) ( not ( = ?auto_27567 ?auto_27568 ) ) ( not ( = ?auto_27567 ?auto_27607 ) ) ( not ( = ?auto_27568 ?auto_27607 ) ) ( SURFACE-AT ?auto_27566 ?auto_27584 ) ( CLEAR ?auto_27566 ) ( IS-CRATE ?auto_27567 ) ( AVAILABLE ?auto_27580 ) ( AVAILABLE ?auto_27594 ) ( SURFACE-AT ?auto_27567 ?auto_27590 ) ( ON ?auto_27567 ?auto_27604 ) ( CLEAR ?auto_27567 ) ( TRUCK-AT ?auto_27579 ?auto_27584 ) ( not ( = ?auto_27566 ?auto_27567 ) ) ( not ( = ?auto_27566 ?auto_27604 ) ) ( not ( = ?auto_27567 ?auto_27604 ) ) ( not ( = ?auto_27566 ?auto_27568 ) ) ( not ( = ?auto_27566 ?auto_27607 ) ) ( not ( = ?auto_27568 ?auto_27604 ) ) ( not ( = ?auto_27581 ?auto_27590 ) ) ( not ( = ?auto_27582 ?auto_27594 ) ) ( not ( = ?auto_27607 ?auto_27604 ) ) ( not ( = ?auto_27566 ?auto_27569 ) ) ( not ( = ?auto_27566 ?auto_27591 ) ) ( not ( = ?auto_27567 ?auto_27569 ) ) ( not ( = ?auto_27567 ?auto_27591 ) ) ( not ( = ?auto_27569 ?auto_27607 ) ) ( not ( = ?auto_27569 ?auto_27604 ) ) ( not ( = ?auto_27602 ?auto_27581 ) ) ( not ( = ?auto_27602 ?auto_27590 ) ) ( not ( = ?auto_27596 ?auto_27582 ) ) ( not ( = ?auto_27596 ?auto_27594 ) ) ( not ( = ?auto_27591 ?auto_27607 ) ) ( not ( = ?auto_27591 ?auto_27604 ) ) ( not ( = ?auto_27566 ?auto_27570 ) ) ( not ( = ?auto_27566 ?auto_27598 ) ) ( not ( = ?auto_27567 ?auto_27570 ) ) ( not ( = ?auto_27567 ?auto_27598 ) ) ( not ( = ?auto_27568 ?auto_27570 ) ) ( not ( = ?auto_27568 ?auto_27598 ) ) ( not ( = ?auto_27570 ?auto_27591 ) ) ( not ( = ?auto_27570 ?auto_27607 ) ) ( not ( = ?auto_27570 ?auto_27604 ) ) ( not ( = ?auto_27589 ?auto_27602 ) ) ( not ( = ?auto_27589 ?auto_27581 ) ) ( not ( = ?auto_27589 ?auto_27590 ) ) ( not ( = ?auto_27600 ?auto_27596 ) ) ( not ( = ?auto_27600 ?auto_27582 ) ) ( not ( = ?auto_27600 ?auto_27594 ) ) ( not ( = ?auto_27598 ?auto_27591 ) ) ( not ( = ?auto_27598 ?auto_27607 ) ) ( not ( = ?auto_27598 ?auto_27604 ) ) ( not ( = ?auto_27566 ?auto_27571 ) ) ( not ( = ?auto_27566 ?auto_27595 ) ) ( not ( = ?auto_27567 ?auto_27571 ) ) ( not ( = ?auto_27567 ?auto_27595 ) ) ( not ( = ?auto_27568 ?auto_27571 ) ) ( not ( = ?auto_27568 ?auto_27595 ) ) ( not ( = ?auto_27569 ?auto_27571 ) ) ( not ( = ?auto_27569 ?auto_27595 ) ) ( not ( = ?auto_27571 ?auto_27598 ) ) ( not ( = ?auto_27571 ?auto_27591 ) ) ( not ( = ?auto_27571 ?auto_27607 ) ) ( not ( = ?auto_27571 ?auto_27604 ) ) ( not ( = ?auto_27595 ?auto_27598 ) ) ( not ( = ?auto_27595 ?auto_27591 ) ) ( not ( = ?auto_27595 ?auto_27607 ) ) ( not ( = ?auto_27595 ?auto_27604 ) ) ( not ( = ?auto_27566 ?auto_27572 ) ) ( not ( = ?auto_27566 ?auto_27592 ) ) ( not ( = ?auto_27567 ?auto_27572 ) ) ( not ( = ?auto_27567 ?auto_27592 ) ) ( not ( = ?auto_27568 ?auto_27572 ) ) ( not ( = ?auto_27568 ?auto_27592 ) ) ( not ( = ?auto_27569 ?auto_27572 ) ) ( not ( = ?auto_27569 ?auto_27592 ) ) ( not ( = ?auto_27570 ?auto_27572 ) ) ( not ( = ?auto_27570 ?auto_27592 ) ) ( not ( = ?auto_27572 ?auto_27595 ) ) ( not ( = ?auto_27572 ?auto_27598 ) ) ( not ( = ?auto_27572 ?auto_27591 ) ) ( not ( = ?auto_27572 ?auto_27607 ) ) ( not ( = ?auto_27572 ?auto_27604 ) ) ( not ( = ?auto_27605 ?auto_27589 ) ) ( not ( = ?auto_27605 ?auto_27602 ) ) ( not ( = ?auto_27605 ?auto_27581 ) ) ( not ( = ?auto_27605 ?auto_27590 ) ) ( not ( = ?auto_27586 ?auto_27600 ) ) ( not ( = ?auto_27586 ?auto_27596 ) ) ( not ( = ?auto_27586 ?auto_27582 ) ) ( not ( = ?auto_27586 ?auto_27594 ) ) ( not ( = ?auto_27592 ?auto_27595 ) ) ( not ( = ?auto_27592 ?auto_27598 ) ) ( not ( = ?auto_27592 ?auto_27591 ) ) ( not ( = ?auto_27592 ?auto_27607 ) ) ( not ( = ?auto_27592 ?auto_27604 ) ) ( not ( = ?auto_27566 ?auto_27575 ) ) ( not ( = ?auto_27566 ?auto_27597 ) ) ( not ( = ?auto_27567 ?auto_27575 ) ) ( not ( = ?auto_27567 ?auto_27597 ) ) ( not ( = ?auto_27568 ?auto_27575 ) ) ( not ( = ?auto_27568 ?auto_27597 ) ) ( not ( = ?auto_27569 ?auto_27575 ) ) ( not ( = ?auto_27569 ?auto_27597 ) ) ( not ( = ?auto_27570 ?auto_27575 ) ) ( not ( = ?auto_27570 ?auto_27597 ) ) ( not ( = ?auto_27571 ?auto_27575 ) ) ( not ( = ?auto_27571 ?auto_27597 ) ) ( not ( = ?auto_27575 ?auto_27592 ) ) ( not ( = ?auto_27575 ?auto_27595 ) ) ( not ( = ?auto_27575 ?auto_27598 ) ) ( not ( = ?auto_27575 ?auto_27591 ) ) ( not ( = ?auto_27575 ?auto_27607 ) ) ( not ( = ?auto_27575 ?auto_27604 ) ) ( not ( = ?auto_27601 ?auto_27605 ) ) ( not ( = ?auto_27601 ?auto_27589 ) ) ( not ( = ?auto_27601 ?auto_27602 ) ) ( not ( = ?auto_27601 ?auto_27581 ) ) ( not ( = ?auto_27601 ?auto_27590 ) ) ( not ( = ?auto_27587 ?auto_27586 ) ) ( not ( = ?auto_27587 ?auto_27600 ) ) ( not ( = ?auto_27587 ?auto_27596 ) ) ( not ( = ?auto_27587 ?auto_27582 ) ) ( not ( = ?auto_27587 ?auto_27594 ) ) ( not ( = ?auto_27597 ?auto_27592 ) ) ( not ( = ?auto_27597 ?auto_27595 ) ) ( not ( = ?auto_27597 ?auto_27598 ) ) ( not ( = ?auto_27597 ?auto_27591 ) ) ( not ( = ?auto_27597 ?auto_27607 ) ) ( not ( = ?auto_27597 ?auto_27604 ) ) ( not ( = ?auto_27566 ?auto_27574 ) ) ( not ( = ?auto_27566 ?auto_27585 ) ) ( not ( = ?auto_27567 ?auto_27574 ) ) ( not ( = ?auto_27567 ?auto_27585 ) ) ( not ( = ?auto_27568 ?auto_27574 ) ) ( not ( = ?auto_27568 ?auto_27585 ) ) ( not ( = ?auto_27569 ?auto_27574 ) ) ( not ( = ?auto_27569 ?auto_27585 ) ) ( not ( = ?auto_27570 ?auto_27574 ) ) ( not ( = ?auto_27570 ?auto_27585 ) ) ( not ( = ?auto_27571 ?auto_27574 ) ) ( not ( = ?auto_27571 ?auto_27585 ) ) ( not ( = ?auto_27572 ?auto_27574 ) ) ( not ( = ?auto_27572 ?auto_27585 ) ) ( not ( = ?auto_27574 ?auto_27597 ) ) ( not ( = ?auto_27574 ?auto_27592 ) ) ( not ( = ?auto_27574 ?auto_27595 ) ) ( not ( = ?auto_27574 ?auto_27598 ) ) ( not ( = ?auto_27574 ?auto_27591 ) ) ( not ( = ?auto_27574 ?auto_27607 ) ) ( not ( = ?auto_27574 ?auto_27604 ) ) ( not ( = ?auto_27585 ?auto_27597 ) ) ( not ( = ?auto_27585 ?auto_27592 ) ) ( not ( = ?auto_27585 ?auto_27595 ) ) ( not ( = ?auto_27585 ?auto_27598 ) ) ( not ( = ?auto_27585 ?auto_27591 ) ) ( not ( = ?auto_27585 ?auto_27607 ) ) ( not ( = ?auto_27585 ?auto_27604 ) ) ( not ( = ?auto_27566 ?auto_27573 ) ) ( not ( = ?auto_27566 ?auto_27588 ) ) ( not ( = ?auto_27567 ?auto_27573 ) ) ( not ( = ?auto_27567 ?auto_27588 ) ) ( not ( = ?auto_27568 ?auto_27573 ) ) ( not ( = ?auto_27568 ?auto_27588 ) ) ( not ( = ?auto_27569 ?auto_27573 ) ) ( not ( = ?auto_27569 ?auto_27588 ) ) ( not ( = ?auto_27570 ?auto_27573 ) ) ( not ( = ?auto_27570 ?auto_27588 ) ) ( not ( = ?auto_27571 ?auto_27573 ) ) ( not ( = ?auto_27571 ?auto_27588 ) ) ( not ( = ?auto_27572 ?auto_27573 ) ) ( not ( = ?auto_27572 ?auto_27588 ) ) ( not ( = ?auto_27575 ?auto_27573 ) ) ( not ( = ?auto_27575 ?auto_27588 ) ) ( not ( = ?auto_27573 ?auto_27585 ) ) ( not ( = ?auto_27573 ?auto_27597 ) ) ( not ( = ?auto_27573 ?auto_27592 ) ) ( not ( = ?auto_27573 ?auto_27595 ) ) ( not ( = ?auto_27573 ?auto_27598 ) ) ( not ( = ?auto_27573 ?auto_27591 ) ) ( not ( = ?auto_27573 ?auto_27607 ) ) ( not ( = ?auto_27573 ?auto_27604 ) ) ( not ( = ?auto_27588 ?auto_27585 ) ) ( not ( = ?auto_27588 ?auto_27597 ) ) ( not ( = ?auto_27588 ?auto_27592 ) ) ( not ( = ?auto_27588 ?auto_27595 ) ) ( not ( = ?auto_27588 ?auto_27598 ) ) ( not ( = ?auto_27588 ?auto_27591 ) ) ( not ( = ?auto_27588 ?auto_27607 ) ) ( not ( = ?auto_27588 ?auto_27604 ) ) ( not ( = ?auto_27566 ?auto_27576 ) ) ( not ( = ?auto_27566 ?auto_27606 ) ) ( not ( = ?auto_27567 ?auto_27576 ) ) ( not ( = ?auto_27567 ?auto_27606 ) ) ( not ( = ?auto_27568 ?auto_27576 ) ) ( not ( = ?auto_27568 ?auto_27606 ) ) ( not ( = ?auto_27569 ?auto_27576 ) ) ( not ( = ?auto_27569 ?auto_27606 ) ) ( not ( = ?auto_27570 ?auto_27576 ) ) ( not ( = ?auto_27570 ?auto_27606 ) ) ( not ( = ?auto_27571 ?auto_27576 ) ) ( not ( = ?auto_27571 ?auto_27606 ) ) ( not ( = ?auto_27572 ?auto_27576 ) ) ( not ( = ?auto_27572 ?auto_27606 ) ) ( not ( = ?auto_27575 ?auto_27576 ) ) ( not ( = ?auto_27575 ?auto_27606 ) ) ( not ( = ?auto_27574 ?auto_27576 ) ) ( not ( = ?auto_27574 ?auto_27606 ) ) ( not ( = ?auto_27576 ?auto_27588 ) ) ( not ( = ?auto_27576 ?auto_27585 ) ) ( not ( = ?auto_27576 ?auto_27597 ) ) ( not ( = ?auto_27576 ?auto_27592 ) ) ( not ( = ?auto_27576 ?auto_27595 ) ) ( not ( = ?auto_27576 ?auto_27598 ) ) ( not ( = ?auto_27576 ?auto_27591 ) ) ( not ( = ?auto_27576 ?auto_27607 ) ) ( not ( = ?auto_27576 ?auto_27604 ) ) ( not ( = ?auto_27599 ?auto_27602 ) ) ( not ( = ?auto_27599 ?auto_27581 ) ) ( not ( = ?auto_27599 ?auto_27601 ) ) ( not ( = ?auto_27599 ?auto_27605 ) ) ( not ( = ?auto_27599 ?auto_27589 ) ) ( not ( = ?auto_27599 ?auto_27590 ) ) ( not ( = ?auto_27593 ?auto_27596 ) ) ( not ( = ?auto_27593 ?auto_27582 ) ) ( not ( = ?auto_27593 ?auto_27587 ) ) ( not ( = ?auto_27593 ?auto_27586 ) ) ( not ( = ?auto_27593 ?auto_27600 ) ) ( not ( = ?auto_27593 ?auto_27594 ) ) ( not ( = ?auto_27606 ?auto_27588 ) ) ( not ( = ?auto_27606 ?auto_27585 ) ) ( not ( = ?auto_27606 ?auto_27597 ) ) ( not ( = ?auto_27606 ?auto_27592 ) ) ( not ( = ?auto_27606 ?auto_27595 ) ) ( not ( = ?auto_27606 ?auto_27598 ) ) ( not ( = ?auto_27606 ?auto_27591 ) ) ( not ( = ?auto_27606 ?auto_27607 ) ) ( not ( = ?auto_27606 ?auto_27604 ) ) ( not ( = ?auto_27566 ?auto_27577 ) ) ( not ( = ?auto_27566 ?auto_27603 ) ) ( not ( = ?auto_27567 ?auto_27577 ) ) ( not ( = ?auto_27567 ?auto_27603 ) ) ( not ( = ?auto_27568 ?auto_27577 ) ) ( not ( = ?auto_27568 ?auto_27603 ) ) ( not ( = ?auto_27569 ?auto_27577 ) ) ( not ( = ?auto_27569 ?auto_27603 ) ) ( not ( = ?auto_27570 ?auto_27577 ) ) ( not ( = ?auto_27570 ?auto_27603 ) ) ( not ( = ?auto_27571 ?auto_27577 ) ) ( not ( = ?auto_27571 ?auto_27603 ) ) ( not ( = ?auto_27572 ?auto_27577 ) ) ( not ( = ?auto_27572 ?auto_27603 ) ) ( not ( = ?auto_27575 ?auto_27577 ) ) ( not ( = ?auto_27575 ?auto_27603 ) ) ( not ( = ?auto_27574 ?auto_27577 ) ) ( not ( = ?auto_27574 ?auto_27603 ) ) ( not ( = ?auto_27573 ?auto_27577 ) ) ( not ( = ?auto_27573 ?auto_27603 ) ) ( not ( = ?auto_27577 ?auto_27606 ) ) ( not ( = ?auto_27577 ?auto_27588 ) ) ( not ( = ?auto_27577 ?auto_27585 ) ) ( not ( = ?auto_27577 ?auto_27597 ) ) ( not ( = ?auto_27577 ?auto_27592 ) ) ( not ( = ?auto_27577 ?auto_27595 ) ) ( not ( = ?auto_27577 ?auto_27598 ) ) ( not ( = ?auto_27577 ?auto_27591 ) ) ( not ( = ?auto_27577 ?auto_27607 ) ) ( not ( = ?auto_27577 ?auto_27604 ) ) ( not ( = ?auto_27603 ?auto_27606 ) ) ( not ( = ?auto_27603 ?auto_27588 ) ) ( not ( = ?auto_27603 ?auto_27585 ) ) ( not ( = ?auto_27603 ?auto_27597 ) ) ( not ( = ?auto_27603 ?auto_27592 ) ) ( not ( = ?auto_27603 ?auto_27595 ) ) ( not ( = ?auto_27603 ?auto_27598 ) ) ( not ( = ?auto_27603 ?auto_27591 ) ) ( not ( = ?auto_27603 ?auto_27607 ) ) ( not ( = ?auto_27603 ?auto_27604 ) ) ( not ( = ?auto_27566 ?auto_27578 ) ) ( not ( = ?auto_27566 ?auto_27583 ) ) ( not ( = ?auto_27567 ?auto_27578 ) ) ( not ( = ?auto_27567 ?auto_27583 ) ) ( not ( = ?auto_27568 ?auto_27578 ) ) ( not ( = ?auto_27568 ?auto_27583 ) ) ( not ( = ?auto_27569 ?auto_27578 ) ) ( not ( = ?auto_27569 ?auto_27583 ) ) ( not ( = ?auto_27570 ?auto_27578 ) ) ( not ( = ?auto_27570 ?auto_27583 ) ) ( not ( = ?auto_27571 ?auto_27578 ) ) ( not ( = ?auto_27571 ?auto_27583 ) ) ( not ( = ?auto_27572 ?auto_27578 ) ) ( not ( = ?auto_27572 ?auto_27583 ) ) ( not ( = ?auto_27575 ?auto_27578 ) ) ( not ( = ?auto_27575 ?auto_27583 ) ) ( not ( = ?auto_27574 ?auto_27578 ) ) ( not ( = ?auto_27574 ?auto_27583 ) ) ( not ( = ?auto_27573 ?auto_27578 ) ) ( not ( = ?auto_27573 ?auto_27583 ) ) ( not ( = ?auto_27576 ?auto_27578 ) ) ( not ( = ?auto_27576 ?auto_27583 ) ) ( not ( = ?auto_27578 ?auto_27603 ) ) ( not ( = ?auto_27578 ?auto_27606 ) ) ( not ( = ?auto_27578 ?auto_27588 ) ) ( not ( = ?auto_27578 ?auto_27585 ) ) ( not ( = ?auto_27578 ?auto_27597 ) ) ( not ( = ?auto_27578 ?auto_27592 ) ) ( not ( = ?auto_27578 ?auto_27595 ) ) ( not ( = ?auto_27578 ?auto_27598 ) ) ( not ( = ?auto_27578 ?auto_27591 ) ) ( not ( = ?auto_27578 ?auto_27607 ) ) ( not ( = ?auto_27578 ?auto_27604 ) ) ( not ( = ?auto_27583 ?auto_27603 ) ) ( not ( = ?auto_27583 ?auto_27606 ) ) ( not ( = ?auto_27583 ?auto_27588 ) ) ( not ( = ?auto_27583 ?auto_27585 ) ) ( not ( = ?auto_27583 ?auto_27597 ) ) ( not ( = ?auto_27583 ?auto_27592 ) ) ( not ( = ?auto_27583 ?auto_27595 ) ) ( not ( = ?auto_27583 ?auto_27598 ) ) ( not ( = ?auto_27583 ?auto_27591 ) ) ( not ( = ?auto_27583 ?auto_27607 ) ) ( not ( = ?auto_27583 ?auto_27604 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_27566 ?auto_27567 ?auto_27568 ?auto_27569 ?auto_27570 ?auto_27571 ?auto_27572 ?auto_27575 ?auto_27574 ?auto_27573 ?auto_27576 ?auto_27577 )
      ( MAKE-1CRATE ?auto_27577 ?auto_27578 )
      ( MAKE-12CRATE-VERIFY ?auto_27566 ?auto_27567 ?auto_27568 ?auto_27569 ?auto_27570 ?auto_27571 ?auto_27572 ?auto_27575 ?auto_27574 ?auto_27573 ?auto_27576 ?auto_27577 ?auto_27578 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27610 - SURFACE
      ?auto_27611 - SURFACE
    )
    :vars
    (
      ?auto_27612 - HOIST
      ?auto_27613 - PLACE
      ?auto_27615 - PLACE
      ?auto_27616 - HOIST
      ?auto_27617 - SURFACE
      ?auto_27614 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27612 ?auto_27613 ) ( SURFACE-AT ?auto_27610 ?auto_27613 ) ( CLEAR ?auto_27610 ) ( IS-CRATE ?auto_27611 ) ( AVAILABLE ?auto_27612 ) ( not ( = ?auto_27615 ?auto_27613 ) ) ( HOIST-AT ?auto_27616 ?auto_27615 ) ( AVAILABLE ?auto_27616 ) ( SURFACE-AT ?auto_27611 ?auto_27615 ) ( ON ?auto_27611 ?auto_27617 ) ( CLEAR ?auto_27611 ) ( TRUCK-AT ?auto_27614 ?auto_27613 ) ( not ( = ?auto_27610 ?auto_27611 ) ) ( not ( = ?auto_27610 ?auto_27617 ) ) ( not ( = ?auto_27611 ?auto_27617 ) ) ( not ( = ?auto_27612 ?auto_27616 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27614 ?auto_27613 ?auto_27615 )
      ( !LIFT ?auto_27616 ?auto_27611 ?auto_27617 ?auto_27615 )
      ( !LOAD ?auto_27616 ?auto_27611 ?auto_27614 ?auto_27615 )
      ( !DRIVE ?auto_27614 ?auto_27615 ?auto_27613 )
      ( !UNLOAD ?auto_27612 ?auto_27611 ?auto_27614 ?auto_27613 )
      ( !DROP ?auto_27612 ?auto_27611 ?auto_27610 ?auto_27613 )
      ( MAKE-1CRATE-VERIFY ?auto_27610 ?auto_27611 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_27632 - SURFACE
      ?auto_27633 - SURFACE
      ?auto_27634 - SURFACE
      ?auto_27635 - SURFACE
      ?auto_27636 - SURFACE
      ?auto_27637 - SURFACE
      ?auto_27638 - SURFACE
      ?auto_27641 - SURFACE
      ?auto_27640 - SURFACE
      ?auto_27639 - SURFACE
      ?auto_27642 - SURFACE
      ?auto_27643 - SURFACE
      ?auto_27644 - SURFACE
      ?auto_27645 - SURFACE
    )
    :vars
    (
      ?auto_27647 - HOIST
      ?auto_27649 - PLACE
      ?auto_27650 - PLACE
      ?auto_27648 - HOIST
      ?auto_27646 - SURFACE
      ?auto_27671 - SURFACE
      ?auto_27669 - PLACE
      ?auto_27670 - HOIST
      ?auto_27674 - SURFACE
      ?auto_27664 - PLACE
      ?auto_27658 - HOIST
      ?auto_27654 - SURFACE
      ?auto_27662 - PLACE
      ?auto_27656 - HOIST
      ?auto_27667 - SURFACE
      ?auto_27666 - SURFACE
      ?auto_27652 - PLACE
      ?auto_27668 - HOIST
      ?auto_27673 - SURFACE
      ?auto_27657 - PLACE
      ?auto_27660 - HOIST
      ?auto_27672 - SURFACE
      ?auto_27655 - PLACE
      ?auto_27659 - HOIST
      ?auto_27675 - SURFACE
      ?auto_27653 - SURFACE
      ?auto_27661 - SURFACE
      ?auto_27663 - SURFACE
      ?auto_27665 - SURFACE
      ?auto_27651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27647 ?auto_27649 ) ( IS-CRATE ?auto_27645 ) ( not ( = ?auto_27650 ?auto_27649 ) ) ( HOIST-AT ?auto_27648 ?auto_27650 ) ( SURFACE-AT ?auto_27645 ?auto_27650 ) ( ON ?auto_27645 ?auto_27646 ) ( CLEAR ?auto_27645 ) ( not ( = ?auto_27644 ?auto_27645 ) ) ( not ( = ?auto_27644 ?auto_27646 ) ) ( not ( = ?auto_27645 ?auto_27646 ) ) ( not ( = ?auto_27647 ?auto_27648 ) ) ( IS-CRATE ?auto_27644 ) ( SURFACE-AT ?auto_27644 ?auto_27650 ) ( ON ?auto_27644 ?auto_27671 ) ( CLEAR ?auto_27644 ) ( not ( = ?auto_27643 ?auto_27644 ) ) ( not ( = ?auto_27643 ?auto_27671 ) ) ( not ( = ?auto_27644 ?auto_27671 ) ) ( IS-CRATE ?auto_27643 ) ( not ( = ?auto_27669 ?auto_27649 ) ) ( HOIST-AT ?auto_27670 ?auto_27669 ) ( SURFACE-AT ?auto_27643 ?auto_27669 ) ( ON ?auto_27643 ?auto_27674 ) ( CLEAR ?auto_27643 ) ( not ( = ?auto_27642 ?auto_27643 ) ) ( not ( = ?auto_27642 ?auto_27674 ) ) ( not ( = ?auto_27643 ?auto_27674 ) ) ( not ( = ?auto_27647 ?auto_27670 ) ) ( IS-CRATE ?auto_27642 ) ( not ( = ?auto_27664 ?auto_27649 ) ) ( HOIST-AT ?auto_27658 ?auto_27664 ) ( AVAILABLE ?auto_27658 ) ( SURFACE-AT ?auto_27642 ?auto_27664 ) ( ON ?auto_27642 ?auto_27654 ) ( CLEAR ?auto_27642 ) ( not ( = ?auto_27639 ?auto_27642 ) ) ( not ( = ?auto_27639 ?auto_27654 ) ) ( not ( = ?auto_27642 ?auto_27654 ) ) ( not ( = ?auto_27647 ?auto_27658 ) ) ( IS-CRATE ?auto_27639 ) ( not ( = ?auto_27662 ?auto_27649 ) ) ( HOIST-AT ?auto_27656 ?auto_27662 ) ( SURFACE-AT ?auto_27639 ?auto_27662 ) ( ON ?auto_27639 ?auto_27667 ) ( CLEAR ?auto_27639 ) ( not ( = ?auto_27640 ?auto_27639 ) ) ( not ( = ?auto_27640 ?auto_27667 ) ) ( not ( = ?auto_27639 ?auto_27667 ) ) ( not ( = ?auto_27647 ?auto_27656 ) ) ( IS-CRATE ?auto_27640 ) ( SURFACE-AT ?auto_27640 ?auto_27650 ) ( ON ?auto_27640 ?auto_27666 ) ( CLEAR ?auto_27640 ) ( not ( = ?auto_27641 ?auto_27640 ) ) ( not ( = ?auto_27641 ?auto_27666 ) ) ( not ( = ?auto_27640 ?auto_27666 ) ) ( IS-CRATE ?auto_27641 ) ( not ( = ?auto_27652 ?auto_27649 ) ) ( HOIST-AT ?auto_27668 ?auto_27652 ) ( AVAILABLE ?auto_27668 ) ( SURFACE-AT ?auto_27641 ?auto_27652 ) ( ON ?auto_27641 ?auto_27673 ) ( CLEAR ?auto_27641 ) ( not ( = ?auto_27638 ?auto_27641 ) ) ( not ( = ?auto_27638 ?auto_27673 ) ) ( not ( = ?auto_27641 ?auto_27673 ) ) ( not ( = ?auto_27647 ?auto_27668 ) ) ( IS-CRATE ?auto_27638 ) ( not ( = ?auto_27657 ?auto_27649 ) ) ( HOIST-AT ?auto_27660 ?auto_27657 ) ( AVAILABLE ?auto_27660 ) ( SURFACE-AT ?auto_27638 ?auto_27657 ) ( ON ?auto_27638 ?auto_27672 ) ( CLEAR ?auto_27638 ) ( not ( = ?auto_27637 ?auto_27638 ) ) ( not ( = ?auto_27637 ?auto_27672 ) ) ( not ( = ?auto_27638 ?auto_27672 ) ) ( not ( = ?auto_27647 ?auto_27660 ) ) ( IS-CRATE ?auto_27637 ) ( not ( = ?auto_27655 ?auto_27649 ) ) ( HOIST-AT ?auto_27659 ?auto_27655 ) ( SURFACE-AT ?auto_27637 ?auto_27655 ) ( ON ?auto_27637 ?auto_27675 ) ( CLEAR ?auto_27637 ) ( not ( = ?auto_27636 ?auto_27637 ) ) ( not ( = ?auto_27636 ?auto_27675 ) ) ( not ( = ?auto_27637 ?auto_27675 ) ) ( not ( = ?auto_27647 ?auto_27659 ) ) ( IS-CRATE ?auto_27636 ) ( AVAILABLE ?auto_27659 ) ( SURFACE-AT ?auto_27636 ?auto_27655 ) ( ON ?auto_27636 ?auto_27653 ) ( CLEAR ?auto_27636 ) ( not ( = ?auto_27635 ?auto_27636 ) ) ( not ( = ?auto_27635 ?auto_27653 ) ) ( not ( = ?auto_27636 ?auto_27653 ) ) ( IS-CRATE ?auto_27635 ) ( AVAILABLE ?auto_27656 ) ( SURFACE-AT ?auto_27635 ?auto_27662 ) ( ON ?auto_27635 ?auto_27661 ) ( CLEAR ?auto_27635 ) ( not ( = ?auto_27634 ?auto_27635 ) ) ( not ( = ?auto_27634 ?auto_27661 ) ) ( not ( = ?auto_27635 ?auto_27661 ) ) ( IS-CRATE ?auto_27634 ) ( AVAILABLE ?auto_27648 ) ( SURFACE-AT ?auto_27634 ?auto_27650 ) ( ON ?auto_27634 ?auto_27663 ) ( CLEAR ?auto_27634 ) ( not ( = ?auto_27633 ?auto_27634 ) ) ( not ( = ?auto_27633 ?auto_27663 ) ) ( not ( = ?auto_27634 ?auto_27663 ) ) ( SURFACE-AT ?auto_27632 ?auto_27649 ) ( CLEAR ?auto_27632 ) ( IS-CRATE ?auto_27633 ) ( AVAILABLE ?auto_27647 ) ( AVAILABLE ?auto_27670 ) ( SURFACE-AT ?auto_27633 ?auto_27669 ) ( ON ?auto_27633 ?auto_27665 ) ( CLEAR ?auto_27633 ) ( TRUCK-AT ?auto_27651 ?auto_27649 ) ( not ( = ?auto_27632 ?auto_27633 ) ) ( not ( = ?auto_27632 ?auto_27665 ) ) ( not ( = ?auto_27633 ?auto_27665 ) ) ( not ( = ?auto_27632 ?auto_27634 ) ) ( not ( = ?auto_27632 ?auto_27663 ) ) ( not ( = ?auto_27634 ?auto_27665 ) ) ( not ( = ?auto_27650 ?auto_27669 ) ) ( not ( = ?auto_27648 ?auto_27670 ) ) ( not ( = ?auto_27663 ?auto_27665 ) ) ( not ( = ?auto_27632 ?auto_27635 ) ) ( not ( = ?auto_27632 ?auto_27661 ) ) ( not ( = ?auto_27633 ?auto_27635 ) ) ( not ( = ?auto_27633 ?auto_27661 ) ) ( not ( = ?auto_27635 ?auto_27663 ) ) ( not ( = ?auto_27635 ?auto_27665 ) ) ( not ( = ?auto_27662 ?auto_27650 ) ) ( not ( = ?auto_27662 ?auto_27669 ) ) ( not ( = ?auto_27656 ?auto_27648 ) ) ( not ( = ?auto_27656 ?auto_27670 ) ) ( not ( = ?auto_27661 ?auto_27663 ) ) ( not ( = ?auto_27661 ?auto_27665 ) ) ( not ( = ?auto_27632 ?auto_27636 ) ) ( not ( = ?auto_27632 ?auto_27653 ) ) ( not ( = ?auto_27633 ?auto_27636 ) ) ( not ( = ?auto_27633 ?auto_27653 ) ) ( not ( = ?auto_27634 ?auto_27636 ) ) ( not ( = ?auto_27634 ?auto_27653 ) ) ( not ( = ?auto_27636 ?auto_27661 ) ) ( not ( = ?auto_27636 ?auto_27663 ) ) ( not ( = ?auto_27636 ?auto_27665 ) ) ( not ( = ?auto_27655 ?auto_27662 ) ) ( not ( = ?auto_27655 ?auto_27650 ) ) ( not ( = ?auto_27655 ?auto_27669 ) ) ( not ( = ?auto_27659 ?auto_27656 ) ) ( not ( = ?auto_27659 ?auto_27648 ) ) ( not ( = ?auto_27659 ?auto_27670 ) ) ( not ( = ?auto_27653 ?auto_27661 ) ) ( not ( = ?auto_27653 ?auto_27663 ) ) ( not ( = ?auto_27653 ?auto_27665 ) ) ( not ( = ?auto_27632 ?auto_27637 ) ) ( not ( = ?auto_27632 ?auto_27675 ) ) ( not ( = ?auto_27633 ?auto_27637 ) ) ( not ( = ?auto_27633 ?auto_27675 ) ) ( not ( = ?auto_27634 ?auto_27637 ) ) ( not ( = ?auto_27634 ?auto_27675 ) ) ( not ( = ?auto_27635 ?auto_27637 ) ) ( not ( = ?auto_27635 ?auto_27675 ) ) ( not ( = ?auto_27637 ?auto_27653 ) ) ( not ( = ?auto_27637 ?auto_27661 ) ) ( not ( = ?auto_27637 ?auto_27663 ) ) ( not ( = ?auto_27637 ?auto_27665 ) ) ( not ( = ?auto_27675 ?auto_27653 ) ) ( not ( = ?auto_27675 ?auto_27661 ) ) ( not ( = ?auto_27675 ?auto_27663 ) ) ( not ( = ?auto_27675 ?auto_27665 ) ) ( not ( = ?auto_27632 ?auto_27638 ) ) ( not ( = ?auto_27632 ?auto_27672 ) ) ( not ( = ?auto_27633 ?auto_27638 ) ) ( not ( = ?auto_27633 ?auto_27672 ) ) ( not ( = ?auto_27634 ?auto_27638 ) ) ( not ( = ?auto_27634 ?auto_27672 ) ) ( not ( = ?auto_27635 ?auto_27638 ) ) ( not ( = ?auto_27635 ?auto_27672 ) ) ( not ( = ?auto_27636 ?auto_27638 ) ) ( not ( = ?auto_27636 ?auto_27672 ) ) ( not ( = ?auto_27638 ?auto_27675 ) ) ( not ( = ?auto_27638 ?auto_27653 ) ) ( not ( = ?auto_27638 ?auto_27661 ) ) ( not ( = ?auto_27638 ?auto_27663 ) ) ( not ( = ?auto_27638 ?auto_27665 ) ) ( not ( = ?auto_27657 ?auto_27655 ) ) ( not ( = ?auto_27657 ?auto_27662 ) ) ( not ( = ?auto_27657 ?auto_27650 ) ) ( not ( = ?auto_27657 ?auto_27669 ) ) ( not ( = ?auto_27660 ?auto_27659 ) ) ( not ( = ?auto_27660 ?auto_27656 ) ) ( not ( = ?auto_27660 ?auto_27648 ) ) ( not ( = ?auto_27660 ?auto_27670 ) ) ( not ( = ?auto_27672 ?auto_27675 ) ) ( not ( = ?auto_27672 ?auto_27653 ) ) ( not ( = ?auto_27672 ?auto_27661 ) ) ( not ( = ?auto_27672 ?auto_27663 ) ) ( not ( = ?auto_27672 ?auto_27665 ) ) ( not ( = ?auto_27632 ?auto_27641 ) ) ( not ( = ?auto_27632 ?auto_27673 ) ) ( not ( = ?auto_27633 ?auto_27641 ) ) ( not ( = ?auto_27633 ?auto_27673 ) ) ( not ( = ?auto_27634 ?auto_27641 ) ) ( not ( = ?auto_27634 ?auto_27673 ) ) ( not ( = ?auto_27635 ?auto_27641 ) ) ( not ( = ?auto_27635 ?auto_27673 ) ) ( not ( = ?auto_27636 ?auto_27641 ) ) ( not ( = ?auto_27636 ?auto_27673 ) ) ( not ( = ?auto_27637 ?auto_27641 ) ) ( not ( = ?auto_27637 ?auto_27673 ) ) ( not ( = ?auto_27641 ?auto_27672 ) ) ( not ( = ?auto_27641 ?auto_27675 ) ) ( not ( = ?auto_27641 ?auto_27653 ) ) ( not ( = ?auto_27641 ?auto_27661 ) ) ( not ( = ?auto_27641 ?auto_27663 ) ) ( not ( = ?auto_27641 ?auto_27665 ) ) ( not ( = ?auto_27652 ?auto_27657 ) ) ( not ( = ?auto_27652 ?auto_27655 ) ) ( not ( = ?auto_27652 ?auto_27662 ) ) ( not ( = ?auto_27652 ?auto_27650 ) ) ( not ( = ?auto_27652 ?auto_27669 ) ) ( not ( = ?auto_27668 ?auto_27660 ) ) ( not ( = ?auto_27668 ?auto_27659 ) ) ( not ( = ?auto_27668 ?auto_27656 ) ) ( not ( = ?auto_27668 ?auto_27648 ) ) ( not ( = ?auto_27668 ?auto_27670 ) ) ( not ( = ?auto_27673 ?auto_27672 ) ) ( not ( = ?auto_27673 ?auto_27675 ) ) ( not ( = ?auto_27673 ?auto_27653 ) ) ( not ( = ?auto_27673 ?auto_27661 ) ) ( not ( = ?auto_27673 ?auto_27663 ) ) ( not ( = ?auto_27673 ?auto_27665 ) ) ( not ( = ?auto_27632 ?auto_27640 ) ) ( not ( = ?auto_27632 ?auto_27666 ) ) ( not ( = ?auto_27633 ?auto_27640 ) ) ( not ( = ?auto_27633 ?auto_27666 ) ) ( not ( = ?auto_27634 ?auto_27640 ) ) ( not ( = ?auto_27634 ?auto_27666 ) ) ( not ( = ?auto_27635 ?auto_27640 ) ) ( not ( = ?auto_27635 ?auto_27666 ) ) ( not ( = ?auto_27636 ?auto_27640 ) ) ( not ( = ?auto_27636 ?auto_27666 ) ) ( not ( = ?auto_27637 ?auto_27640 ) ) ( not ( = ?auto_27637 ?auto_27666 ) ) ( not ( = ?auto_27638 ?auto_27640 ) ) ( not ( = ?auto_27638 ?auto_27666 ) ) ( not ( = ?auto_27640 ?auto_27673 ) ) ( not ( = ?auto_27640 ?auto_27672 ) ) ( not ( = ?auto_27640 ?auto_27675 ) ) ( not ( = ?auto_27640 ?auto_27653 ) ) ( not ( = ?auto_27640 ?auto_27661 ) ) ( not ( = ?auto_27640 ?auto_27663 ) ) ( not ( = ?auto_27640 ?auto_27665 ) ) ( not ( = ?auto_27666 ?auto_27673 ) ) ( not ( = ?auto_27666 ?auto_27672 ) ) ( not ( = ?auto_27666 ?auto_27675 ) ) ( not ( = ?auto_27666 ?auto_27653 ) ) ( not ( = ?auto_27666 ?auto_27661 ) ) ( not ( = ?auto_27666 ?auto_27663 ) ) ( not ( = ?auto_27666 ?auto_27665 ) ) ( not ( = ?auto_27632 ?auto_27639 ) ) ( not ( = ?auto_27632 ?auto_27667 ) ) ( not ( = ?auto_27633 ?auto_27639 ) ) ( not ( = ?auto_27633 ?auto_27667 ) ) ( not ( = ?auto_27634 ?auto_27639 ) ) ( not ( = ?auto_27634 ?auto_27667 ) ) ( not ( = ?auto_27635 ?auto_27639 ) ) ( not ( = ?auto_27635 ?auto_27667 ) ) ( not ( = ?auto_27636 ?auto_27639 ) ) ( not ( = ?auto_27636 ?auto_27667 ) ) ( not ( = ?auto_27637 ?auto_27639 ) ) ( not ( = ?auto_27637 ?auto_27667 ) ) ( not ( = ?auto_27638 ?auto_27639 ) ) ( not ( = ?auto_27638 ?auto_27667 ) ) ( not ( = ?auto_27641 ?auto_27639 ) ) ( not ( = ?auto_27641 ?auto_27667 ) ) ( not ( = ?auto_27639 ?auto_27666 ) ) ( not ( = ?auto_27639 ?auto_27673 ) ) ( not ( = ?auto_27639 ?auto_27672 ) ) ( not ( = ?auto_27639 ?auto_27675 ) ) ( not ( = ?auto_27639 ?auto_27653 ) ) ( not ( = ?auto_27639 ?auto_27661 ) ) ( not ( = ?auto_27639 ?auto_27663 ) ) ( not ( = ?auto_27639 ?auto_27665 ) ) ( not ( = ?auto_27667 ?auto_27666 ) ) ( not ( = ?auto_27667 ?auto_27673 ) ) ( not ( = ?auto_27667 ?auto_27672 ) ) ( not ( = ?auto_27667 ?auto_27675 ) ) ( not ( = ?auto_27667 ?auto_27653 ) ) ( not ( = ?auto_27667 ?auto_27661 ) ) ( not ( = ?auto_27667 ?auto_27663 ) ) ( not ( = ?auto_27667 ?auto_27665 ) ) ( not ( = ?auto_27632 ?auto_27642 ) ) ( not ( = ?auto_27632 ?auto_27654 ) ) ( not ( = ?auto_27633 ?auto_27642 ) ) ( not ( = ?auto_27633 ?auto_27654 ) ) ( not ( = ?auto_27634 ?auto_27642 ) ) ( not ( = ?auto_27634 ?auto_27654 ) ) ( not ( = ?auto_27635 ?auto_27642 ) ) ( not ( = ?auto_27635 ?auto_27654 ) ) ( not ( = ?auto_27636 ?auto_27642 ) ) ( not ( = ?auto_27636 ?auto_27654 ) ) ( not ( = ?auto_27637 ?auto_27642 ) ) ( not ( = ?auto_27637 ?auto_27654 ) ) ( not ( = ?auto_27638 ?auto_27642 ) ) ( not ( = ?auto_27638 ?auto_27654 ) ) ( not ( = ?auto_27641 ?auto_27642 ) ) ( not ( = ?auto_27641 ?auto_27654 ) ) ( not ( = ?auto_27640 ?auto_27642 ) ) ( not ( = ?auto_27640 ?auto_27654 ) ) ( not ( = ?auto_27642 ?auto_27667 ) ) ( not ( = ?auto_27642 ?auto_27666 ) ) ( not ( = ?auto_27642 ?auto_27673 ) ) ( not ( = ?auto_27642 ?auto_27672 ) ) ( not ( = ?auto_27642 ?auto_27675 ) ) ( not ( = ?auto_27642 ?auto_27653 ) ) ( not ( = ?auto_27642 ?auto_27661 ) ) ( not ( = ?auto_27642 ?auto_27663 ) ) ( not ( = ?auto_27642 ?auto_27665 ) ) ( not ( = ?auto_27664 ?auto_27662 ) ) ( not ( = ?auto_27664 ?auto_27650 ) ) ( not ( = ?auto_27664 ?auto_27652 ) ) ( not ( = ?auto_27664 ?auto_27657 ) ) ( not ( = ?auto_27664 ?auto_27655 ) ) ( not ( = ?auto_27664 ?auto_27669 ) ) ( not ( = ?auto_27658 ?auto_27656 ) ) ( not ( = ?auto_27658 ?auto_27648 ) ) ( not ( = ?auto_27658 ?auto_27668 ) ) ( not ( = ?auto_27658 ?auto_27660 ) ) ( not ( = ?auto_27658 ?auto_27659 ) ) ( not ( = ?auto_27658 ?auto_27670 ) ) ( not ( = ?auto_27654 ?auto_27667 ) ) ( not ( = ?auto_27654 ?auto_27666 ) ) ( not ( = ?auto_27654 ?auto_27673 ) ) ( not ( = ?auto_27654 ?auto_27672 ) ) ( not ( = ?auto_27654 ?auto_27675 ) ) ( not ( = ?auto_27654 ?auto_27653 ) ) ( not ( = ?auto_27654 ?auto_27661 ) ) ( not ( = ?auto_27654 ?auto_27663 ) ) ( not ( = ?auto_27654 ?auto_27665 ) ) ( not ( = ?auto_27632 ?auto_27643 ) ) ( not ( = ?auto_27632 ?auto_27674 ) ) ( not ( = ?auto_27633 ?auto_27643 ) ) ( not ( = ?auto_27633 ?auto_27674 ) ) ( not ( = ?auto_27634 ?auto_27643 ) ) ( not ( = ?auto_27634 ?auto_27674 ) ) ( not ( = ?auto_27635 ?auto_27643 ) ) ( not ( = ?auto_27635 ?auto_27674 ) ) ( not ( = ?auto_27636 ?auto_27643 ) ) ( not ( = ?auto_27636 ?auto_27674 ) ) ( not ( = ?auto_27637 ?auto_27643 ) ) ( not ( = ?auto_27637 ?auto_27674 ) ) ( not ( = ?auto_27638 ?auto_27643 ) ) ( not ( = ?auto_27638 ?auto_27674 ) ) ( not ( = ?auto_27641 ?auto_27643 ) ) ( not ( = ?auto_27641 ?auto_27674 ) ) ( not ( = ?auto_27640 ?auto_27643 ) ) ( not ( = ?auto_27640 ?auto_27674 ) ) ( not ( = ?auto_27639 ?auto_27643 ) ) ( not ( = ?auto_27639 ?auto_27674 ) ) ( not ( = ?auto_27643 ?auto_27654 ) ) ( not ( = ?auto_27643 ?auto_27667 ) ) ( not ( = ?auto_27643 ?auto_27666 ) ) ( not ( = ?auto_27643 ?auto_27673 ) ) ( not ( = ?auto_27643 ?auto_27672 ) ) ( not ( = ?auto_27643 ?auto_27675 ) ) ( not ( = ?auto_27643 ?auto_27653 ) ) ( not ( = ?auto_27643 ?auto_27661 ) ) ( not ( = ?auto_27643 ?auto_27663 ) ) ( not ( = ?auto_27643 ?auto_27665 ) ) ( not ( = ?auto_27674 ?auto_27654 ) ) ( not ( = ?auto_27674 ?auto_27667 ) ) ( not ( = ?auto_27674 ?auto_27666 ) ) ( not ( = ?auto_27674 ?auto_27673 ) ) ( not ( = ?auto_27674 ?auto_27672 ) ) ( not ( = ?auto_27674 ?auto_27675 ) ) ( not ( = ?auto_27674 ?auto_27653 ) ) ( not ( = ?auto_27674 ?auto_27661 ) ) ( not ( = ?auto_27674 ?auto_27663 ) ) ( not ( = ?auto_27674 ?auto_27665 ) ) ( not ( = ?auto_27632 ?auto_27644 ) ) ( not ( = ?auto_27632 ?auto_27671 ) ) ( not ( = ?auto_27633 ?auto_27644 ) ) ( not ( = ?auto_27633 ?auto_27671 ) ) ( not ( = ?auto_27634 ?auto_27644 ) ) ( not ( = ?auto_27634 ?auto_27671 ) ) ( not ( = ?auto_27635 ?auto_27644 ) ) ( not ( = ?auto_27635 ?auto_27671 ) ) ( not ( = ?auto_27636 ?auto_27644 ) ) ( not ( = ?auto_27636 ?auto_27671 ) ) ( not ( = ?auto_27637 ?auto_27644 ) ) ( not ( = ?auto_27637 ?auto_27671 ) ) ( not ( = ?auto_27638 ?auto_27644 ) ) ( not ( = ?auto_27638 ?auto_27671 ) ) ( not ( = ?auto_27641 ?auto_27644 ) ) ( not ( = ?auto_27641 ?auto_27671 ) ) ( not ( = ?auto_27640 ?auto_27644 ) ) ( not ( = ?auto_27640 ?auto_27671 ) ) ( not ( = ?auto_27639 ?auto_27644 ) ) ( not ( = ?auto_27639 ?auto_27671 ) ) ( not ( = ?auto_27642 ?auto_27644 ) ) ( not ( = ?auto_27642 ?auto_27671 ) ) ( not ( = ?auto_27644 ?auto_27674 ) ) ( not ( = ?auto_27644 ?auto_27654 ) ) ( not ( = ?auto_27644 ?auto_27667 ) ) ( not ( = ?auto_27644 ?auto_27666 ) ) ( not ( = ?auto_27644 ?auto_27673 ) ) ( not ( = ?auto_27644 ?auto_27672 ) ) ( not ( = ?auto_27644 ?auto_27675 ) ) ( not ( = ?auto_27644 ?auto_27653 ) ) ( not ( = ?auto_27644 ?auto_27661 ) ) ( not ( = ?auto_27644 ?auto_27663 ) ) ( not ( = ?auto_27644 ?auto_27665 ) ) ( not ( = ?auto_27671 ?auto_27674 ) ) ( not ( = ?auto_27671 ?auto_27654 ) ) ( not ( = ?auto_27671 ?auto_27667 ) ) ( not ( = ?auto_27671 ?auto_27666 ) ) ( not ( = ?auto_27671 ?auto_27673 ) ) ( not ( = ?auto_27671 ?auto_27672 ) ) ( not ( = ?auto_27671 ?auto_27675 ) ) ( not ( = ?auto_27671 ?auto_27653 ) ) ( not ( = ?auto_27671 ?auto_27661 ) ) ( not ( = ?auto_27671 ?auto_27663 ) ) ( not ( = ?auto_27671 ?auto_27665 ) ) ( not ( = ?auto_27632 ?auto_27645 ) ) ( not ( = ?auto_27632 ?auto_27646 ) ) ( not ( = ?auto_27633 ?auto_27645 ) ) ( not ( = ?auto_27633 ?auto_27646 ) ) ( not ( = ?auto_27634 ?auto_27645 ) ) ( not ( = ?auto_27634 ?auto_27646 ) ) ( not ( = ?auto_27635 ?auto_27645 ) ) ( not ( = ?auto_27635 ?auto_27646 ) ) ( not ( = ?auto_27636 ?auto_27645 ) ) ( not ( = ?auto_27636 ?auto_27646 ) ) ( not ( = ?auto_27637 ?auto_27645 ) ) ( not ( = ?auto_27637 ?auto_27646 ) ) ( not ( = ?auto_27638 ?auto_27645 ) ) ( not ( = ?auto_27638 ?auto_27646 ) ) ( not ( = ?auto_27641 ?auto_27645 ) ) ( not ( = ?auto_27641 ?auto_27646 ) ) ( not ( = ?auto_27640 ?auto_27645 ) ) ( not ( = ?auto_27640 ?auto_27646 ) ) ( not ( = ?auto_27639 ?auto_27645 ) ) ( not ( = ?auto_27639 ?auto_27646 ) ) ( not ( = ?auto_27642 ?auto_27645 ) ) ( not ( = ?auto_27642 ?auto_27646 ) ) ( not ( = ?auto_27643 ?auto_27645 ) ) ( not ( = ?auto_27643 ?auto_27646 ) ) ( not ( = ?auto_27645 ?auto_27671 ) ) ( not ( = ?auto_27645 ?auto_27674 ) ) ( not ( = ?auto_27645 ?auto_27654 ) ) ( not ( = ?auto_27645 ?auto_27667 ) ) ( not ( = ?auto_27645 ?auto_27666 ) ) ( not ( = ?auto_27645 ?auto_27673 ) ) ( not ( = ?auto_27645 ?auto_27672 ) ) ( not ( = ?auto_27645 ?auto_27675 ) ) ( not ( = ?auto_27645 ?auto_27653 ) ) ( not ( = ?auto_27645 ?auto_27661 ) ) ( not ( = ?auto_27645 ?auto_27663 ) ) ( not ( = ?auto_27645 ?auto_27665 ) ) ( not ( = ?auto_27646 ?auto_27671 ) ) ( not ( = ?auto_27646 ?auto_27674 ) ) ( not ( = ?auto_27646 ?auto_27654 ) ) ( not ( = ?auto_27646 ?auto_27667 ) ) ( not ( = ?auto_27646 ?auto_27666 ) ) ( not ( = ?auto_27646 ?auto_27673 ) ) ( not ( = ?auto_27646 ?auto_27672 ) ) ( not ( = ?auto_27646 ?auto_27675 ) ) ( not ( = ?auto_27646 ?auto_27653 ) ) ( not ( = ?auto_27646 ?auto_27661 ) ) ( not ( = ?auto_27646 ?auto_27663 ) ) ( not ( = ?auto_27646 ?auto_27665 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_27632 ?auto_27633 ?auto_27634 ?auto_27635 ?auto_27636 ?auto_27637 ?auto_27638 ?auto_27641 ?auto_27640 ?auto_27639 ?auto_27642 ?auto_27643 ?auto_27644 )
      ( MAKE-1CRATE ?auto_27644 ?auto_27645 )
      ( MAKE-13CRATE-VERIFY ?auto_27632 ?auto_27633 ?auto_27634 ?auto_27635 ?auto_27636 ?auto_27637 ?auto_27638 ?auto_27641 ?auto_27640 ?auto_27639 ?auto_27642 ?auto_27643 ?auto_27644 ?auto_27645 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27678 - SURFACE
      ?auto_27679 - SURFACE
    )
    :vars
    (
      ?auto_27680 - HOIST
      ?auto_27681 - PLACE
      ?auto_27683 - PLACE
      ?auto_27684 - HOIST
      ?auto_27685 - SURFACE
      ?auto_27682 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27680 ?auto_27681 ) ( SURFACE-AT ?auto_27678 ?auto_27681 ) ( CLEAR ?auto_27678 ) ( IS-CRATE ?auto_27679 ) ( AVAILABLE ?auto_27680 ) ( not ( = ?auto_27683 ?auto_27681 ) ) ( HOIST-AT ?auto_27684 ?auto_27683 ) ( AVAILABLE ?auto_27684 ) ( SURFACE-AT ?auto_27679 ?auto_27683 ) ( ON ?auto_27679 ?auto_27685 ) ( CLEAR ?auto_27679 ) ( TRUCK-AT ?auto_27682 ?auto_27681 ) ( not ( = ?auto_27678 ?auto_27679 ) ) ( not ( = ?auto_27678 ?auto_27685 ) ) ( not ( = ?auto_27679 ?auto_27685 ) ) ( not ( = ?auto_27680 ?auto_27684 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27682 ?auto_27681 ?auto_27683 )
      ( !LIFT ?auto_27684 ?auto_27679 ?auto_27685 ?auto_27683 )
      ( !LOAD ?auto_27684 ?auto_27679 ?auto_27682 ?auto_27683 )
      ( !DRIVE ?auto_27682 ?auto_27683 ?auto_27681 )
      ( !UNLOAD ?auto_27680 ?auto_27679 ?auto_27682 ?auto_27681 )
      ( !DROP ?auto_27680 ?auto_27679 ?auto_27678 ?auto_27681 )
      ( MAKE-1CRATE-VERIFY ?auto_27678 ?auto_27679 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_27701 - SURFACE
      ?auto_27702 - SURFACE
      ?auto_27703 - SURFACE
      ?auto_27704 - SURFACE
      ?auto_27705 - SURFACE
      ?auto_27706 - SURFACE
      ?auto_27707 - SURFACE
      ?auto_27710 - SURFACE
      ?auto_27709 - SURFACE
      ?auto_27708 - SURFACE
      ?auto_27711 - SURFACE
      ?auto_27712 - SURFACE
      ?auto_27713 - SURFACE
      ?auto_27714 - SURFACE
      ?auto_27715 - SURFACE
    )
    :vars
    (
      ?auto_27720 - HOIST
      ?auto_27717 - PLACE
      ?auto_27719 - PLACE
      ?auto_27718 - HOIST
      ?auto_27721 - SURFACE
      ?auto_27742 - PLACE
      ?auto_27734 - HOIST
      ?auto_27736 - SURFACE
      ?auto_27731 - SURFACE
      ?auto_27730 - PLACE
      ?auto_27732 - HOIST
      ?auto_27741 - SURFACE
      ?auto_27722 - PLACE
      ?auto_27738 - HOIST
      ?auto_27733 - SURFACE
      ?auto_27724 - PLACE
      ?auto_27727 - HOIST
      ?auto_27723 - SURFACE
      ?auto_27735 - SURFACE
      ?auto_27739 - SURFACE
      ?auto_27725 - PLACE
      ?auto_27740 - HOIST
      ?auto_27737 - SURFACE
      ?auto_27744 - PLACE
      ?auto_27726 - HOIST
      ?auto_27729 - SURFACE
      ?auto_27743 - SURFACE
      ?auto_27728 - SURFACE
      ?auto_27746 - SURFACE
      ?auto_27745 - SURFACE
      ?auto_27716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27720 ?auto_27717 ) ( IS-CRATE ?auto_27715 ) ( not ( = ?auto_27719 ?auto_27717 ) ) ( HOIST-AT ?auto_27718 ?auto_27719 ) ( SURFACE-AT ?auto_27715 ?auto_27719 ) ( ON ?auto_27715 ?auto_27721 ) ( CLEAR ?auto_27715 ) ( not ( = ?auto_27714 ?auto_27715 ) ) ( not ( = ?auto_27714 ?auto_27721 ) ) ( not ( = ?auto_27715 ?auto_27721 ) ) ( not ( = ?auto_27720 ?auto_27718 ) ) ( IS-CRATE ?auto_27714 ) ( not ( = ?auto_27742 ?auto_27717 ) ) ( HOIST-AT ?auto_27734 ?auto_27742 ) ( SURFACE-AT ?auto_27714 ?auto_27742 ) ( ON ?auto_27714 ?auto_27736 ) ( CLEAR ?auto_27714 ) ( not ( = ?auto_27713 ?auto_27714 ) ) ( not ( = ?auto_27713 ?auto_27736 ) ) ( not ( = ?auto_27714 ?auto_27736 ) ) ( not ( = ?auto_27720 ?auto_27734 ) ) ( IS-CRATE ?auto_27713 ) ( SURFACE-AT ?auto_27713 ?auto_27742 ) ( ON ?auto_27713 ?auto_27731 ) ( CLEAR ?auto_27713 ) ( not ( = ?auto_27712 ?auto_27713 ) ) ( not ( = ?auto_27712 ?auto_27731 ) ) ( not ( = ?auto_27713 ?auto_27731 ) ) ( IS-CRATE ?auto_27712 ) ( not ( = ?auto_27730 ?auto_27717 ) ) ( HOIST-AT ?auto_27732 ?auto_27730 ) ( SURFACE-AT ?auto_27712 ?auto_27730 ) ( ON ?auto_27712 ?auto_27741 ) ( CLEAR ?auto_27712 ) ( not ( = ?auto_27711 ?auto_27712 ) ) ( not ( = ?auto_27711 ?auto_27741 ) ) ( not ( = ?auto_27712 ?auto_27741 ) ) ( not ( = ?auto_27720 ?auto_27732 ) ) ( IS-CRATE ?auto_27711 ) ( not ( = ?auto_27722 ?auto_27717 ) ) ( HOIST-AT ?auto_27738 ?auto_27722 ) ( AVAILABLE ?auto_27738 ) ( SURFACE-AT ?auto_27711 ?auto_27722 ) ( ON ?auto_27711 ?auto_27733 ) ( CLEAR ?auto_27711 ) ( not ( = ?auto_27708 ?auto_27711 ) ) ( not ( = ?auto_27708 ?auto_27733 ) ) ( not ( = ?auto_27711 ?auto_27733 ) ) ( not ( = ?auto_27720 ?auto_27738 ) ) ( IS-CRATE ?auto_27708 ) ( not ( = ?auto_27724 ?auto_27717 ) ) ( HOIST-AT ?auto_27727 ?auto_27724 ) ( SURFACE-AT ?auto_27708 ?auto_27724 ) ( ON ?auto_27708 ?auto_27723 ) ( CLEAR ?auto_27708 ) ( not ( = ?auto_27709 ?auto_27708 ) ) ( not ( = ?auto_27709 ?auto_27723 ) ) ( not ( = ?auto_27708 ?auto_27723 ) ) ( not ( = ?auto_27720 ?auto_27727 ) ) ( IS-CRATE ?auto_27709 ) ( SURFACE-AT ?auto_27709 ?auto_27742 ) ( ON ?auto_27709 ?auto_27735 ) ( CLEAR ?auto_27709 ) ( not ( = ?auto_27710 ?auto_27709 ) ) ( not ( = ?auto_27710 ?auto_27735 ) ) ( not ( = ?auto_27709 ?auto_27735 ) ) ( IS-CRATE ?auto_27710 ) ( AVAILABLE ?auto_27718 ) ( SURFACE-AT ?auto_27710 ?auto_27719 ) ( ON ?auto_27710 ?auto_27739 ) ( CLEAR ?auto_27710 ) ( not ( = ?auto_27707 ?auto_27710 ) ) ( not ( = ?auto_27707 ?auto_27739 ) ) ( not ( = ?auto_27710 ?auto_27739 ) ) ( IS-CRATE ?auto_27707 ) ( not ( = ?auto_27725 ?auto_27717 ) ) ( HOIST-AT ?auto_27740 ?auto_27725 ) ( AVAILABLE ?auto_27740 ) ( SURFACE-AT ?auto_27707 ?auto_27725 ) ( ON ?auto_27707 ?auto_27737 ) ( CLEAR ?auto_27707 ) ( not ( = ?auto_27706 ?auto_27707 ) ) ( not ( = ?auto_27706 ?auto_27737 ) ) ( not ( = ?auto_27707 ?auto_27737 ) ) ( not ( = ?auto_27720 ?auto_27740 ) ) ( IS-CRATE ?auto_27706 ) ( not ( = ?auto_27744 ?auto_27717 ) ) ( HOIST-AT ?auto_27726 ?auto_27744 ) ( SURFACE-AT ?auto_27706 ?auto_27744 ) ( ON ?auto_27706 ?auto_27729 ) ( CLEAR ?auto_27706 ) ( not ( = ?auto_27705 ?auto_27706 ) ) ( not ( = ?auto_27705 ?auto_27729 ) ) ( not ( = ?auto_27706 ?auto_27729 ) ) ( not ( = ?auto_27720 ?auto_27726 ) ) ( IS-CRATE ?auto_27705 ) ( AVAILABLE ?auto_27726 ) ( SURFACE-AT ?auto_27705 ?auto_27744 ) ( ON ?auto_27705 ?auto_27743 ) ( CLEAR ?auto_27705 ) ( not ( = ?auto_27704 ?auto_27705 ) ) ( not ( = ?auto_27704 ?auto_27743 ) ) ( not ( = ?auto_27705 ?auto_27743 ) ) ( IS-CRATE ?auto_27704 ) ( AVAILABLE ?auto_27727 ) ( SURFACE-AT ?auto_27704 ?auto_27724 ) ( ON ?auto_27704 ?auto_27728 ) ( CLEAR ?auto_27704 ) ( not ( = ?auto_27703 ?auto_27704 ) ) ( not ( = ?auto_27703 ?auto_27728 ) ) ( not ( = ?auto_27704 ?auto_27728 ) ) ( IS-CRATE ?auto_27703 ) ( AVAILABLE ?auto_27734 ) ( SURFACE-AT ?auto_27703 ?auto_27742 ) ( ON ?auto_27703 ?auto_27746 ) ( CLEAR ?auto_27703 ) ( not ( = ?auto_27702 ?auto_27703 ) ) ( not ( = ?auto_27702 ?auto_27746 ) ) ( not ( = ?auto_27703 ?auto_27746 ) ) ( SURFACE-AT ?auto_27701 ?auto_27717 ) ( CLEAR ?auto_27701 ) ( IS-CRATE ?auto_27702 ) ( AVAILABLE ?auto_27720 ) ( AVAILABLE ?auto_27732 ) ( SURFACE-AT ?auto_27702 ?auto_27730 ) ( ON ?auto_27702 ?auto_27745 ) ( CLEAR ?auto_27702 ) ( TRUCK-AT ?auto_27716 ?auto_27717 ) ( not ( = ?auto_27701 ?auto_27702 ) ) ( not ( = ?auto_27701 ?auto_27745 ) ) ( not ( = ?auto_27702 ?auto_27745 ) ) ( not ( = ?auto_27701 ?auto_27703 ) ) ( not ( = ?auto_27701 ?auto_27746 ) ) ( not ( = ?auto_27703 ?auto_27745 ) ) ( not ( = ?auto_27742 ?auto_27730 ) ) ( not ( = ?auto_27734 ?auto_27732 ) ) ( not ( = ?auto_27746 ?auto_27745 ) ) ( not ( = ?auto_27701 ?auto_27704 ) ) ( not ( = ?auto_27701 ?auto_27728 ) ) ( not ( = ?auto_27702 ?auto_27704 ) ) ( not ( = ?auto_27702 ?auto_27728 ) ) ( not ( = ?auto_27704 ?auto_27746 ) ) ( not ( = ?auto_27704 ?auto_27745 ) ) ( not ( = ?auto_27724 ?auto_27742 ) ) ( not ( = ?auto_27724 ?auto_27730 ) ) ( not ( = ?auto_27727 ?auto_27734 ) ) ( not ( = ?auto_27727 ?auto_27732 ) ) ( not ( = ?auto_27728 ?auto_27746 ) ) ( not ( = ?auto_27728 ?auto_27745 ) ) ( not ( = ?auto_27701 ?auto_27705 ) ) ( not ( = ?auto_27701 ?auto_27743 ) ) ( not ( = ?auto_27702 ?auto_27705 ) ) ( not ( = ?auto_27702 ?auto_27743 ) ) ( not ( = ?auto_27703 ?auto_27705 ) ) ( not ( = ?auto_27703 ?auto_27743 ) ) ( not ( = ?auto_27705 ?auto_27728 ) ) ( not ( = ?auto_27705 ?auto_27746 ) ) ( not ( = ?auto_27705 ?auto_27745 ) ) ( not ( = ?auto_27744 ?auto_27724 ) ) ( not ( = ?auto_27744 ?auto_27742 ) ) ( not ( = ?auto_27744 ?auto_27730 ) ) ( not ( = ?auto_27726 ?auto_27727 ) ) ( not ( = ?auto_27726 ?auto_27734 ) ) ( not ( = ?auto_27726 ?auto_27732 ) ) ( not ( = ?auto_27743 ?auto_27728 ) ) ( not ( = ?auto_27743 ?auto_27746 ) ) ( not ( = ?auto_27743 ?auto_27745 ) ) ( not ( = ?auto_27701 ?auto_27706 ) ) ( not ( = ?auto_27701 ?auto_27729 ) ) ( not ( = ?auto_27702 ?auto_27706 ) ) ( not ( = ?auto_27702 ?auto_27729 ) ) ( not ( = ?auto_27703 ?auto_27706 ) ) ( not ( = ?auto_27703 ?auto_27729 ) ) ( not ( = ?auto_27704 ?auto_27706 ) ) ( not ( = ?auto_27704 ?auto_27729 ) ) ( not ( = ?auto_27706 ?auto_27743 ) ) ( not ( = ?auto_27706 ?auto_27728 ) ) ( not ( = ?auto_27706 ?auto_27746 ) ) ( not ( = ?auto_27706 ?auto_27745 ) ) ( not ( = ?auto_27729 ?auto_27743 ) ) ( not ( = ?auto_27729 ?auto_27728 ) ) ( not ( = ?auto_27729 ?auto_27746 ) ) ( not ( = ?auto_27729 ?auto_27745 ) ) ( not ( = ?auto_27701 ?auto_27707 ) ) ( not ( = ?auto_27701 ?auto_27737 ) ) ( not ( = ?auto_27702 ?auto_27707 ) ) ( not ( = ?auto_27702 ?auto_27737 ) ) ( not ( = ?auto_27703 ?auto_27707 ) ) ( not ( = ?auto_27703 ?auto_27737 ) ) ( not ( = ?auto_27704 ?auto_27707 ) ) ( not ( = ?auto_27704 ?auto_27737 ) ) ( not ( = ?auto_27705 ?auto_27707 ) ) ( not ( = ?auto_27705 ?auto_27737 ) ) ( not ( = ?auto_27707 ?auto_27729 ) ) ( not ( = ?auto_27707 ?auto_27743 ) ) ( not ( = ?auto_27707 ?auto_27728 ) ) ( not ( = ?auto_27707 ?auto_27746 ) ) ( not ( = ?auto_27707 ?auto_27745 ) ) ( not ( = ?auto_27725 ?auto_27744 ) ) ( not ( = ?auto_27725 ?auto_27724 ) ) ( not ( = ?auto_27725 ?auto_27742 ) ) ( not ( = ?auto_27725 ?auto_27730 ) ) ( not ( = ?auto_27740 ?auto_27726 ) ) ( not ( = ?auto_27740 ?auto_27727 ) ) ( not ( = ?auto_27740 ?auto_27734 ) ) ( not ( = ?auto_27740 ?auto_27732 ) ) ( not ( = ?auto_27737 ?auto_27729 ) ) ( not ( = ?auto_27737 ?auto_27743 ) ) ( not ( = ?auto_27737 ?auto_27728 ) ) ( not ( = ?auto_27737 ?auto_27746 ) ) ( not ( = ?auto_27737 ?auto_27745 ) ) ( not ( = ?auto_27701 ?auto_27710 ) ) ( not ( = ?auto_27701 ?auto_27739 ) ) ( not ( = ?auto_27702 ?auto_27710 ) ) ( not ( = ?auto_27702 ?auto_27739 ) ) ( not ( = ?auto_27703 ?auto_27710 ) ) ( not ( = ?auto_27703 ?auto_27739 ) ) ( not ( = ?auto_27704 ?auto_27710 ) ) ( not ( = ?auto_27704 ?auto_27739 ) ) ( not ( = ?auto_27705 ?auto_27710 ) ) ( not ( = ?auto_27705 ?auto_27739 ) ) ( not ( = ?auto_27706 ?auto_27710 ) ) ( not ( = ?auto_27706 ?auto_27739 ) ) ( not ( = ?auto_27710 ?auto_27737 ) ) ( not ( = ?auto_27710 ?auto_27729 ) ) ( not ( = ?auto_27710 ?auto_27743 ) ) ( not ( = ?auto_27710 ?auto_27728 ) ) ( not ( = ?auto_27710 ?auto_27746 ) ) ( not ( = ?auto_27710 ?auto_27745 ) ) ( not ( = ?auto_27719 ?auto_27725 ) ) ( not ( = ?auto_27719 ?auto_27744 ) ) ( not ( = ?auto_27719 ?auto_27724 ) ) ( not ( = ?auto_27719 ?auto_27742 ) ) ( not ( = ?auto_27719 ?auto_27730 ) ) ( not ( = ?auto_27718 ?auto_27740 ) ) ( not ( = ?auto_27718 ?auto_27726 ) ) ( not ( = ?auto_27718 ?auto_27727 ) ) ( not ( = ?auto_27718 ?auto_27734 ) ) ( not ( = ?auto_27718 ?auto_27732 ) ) ( not ( = ?auto_27739 ?auto_27737 ) ) ( not ( = ?auto_27739 ?auto_27729 ) ) ( not ( = ?auto_27739 ?auto_27743 ) ) ( not ( = ?auto_27739 ?auto_27728 ) ) ( not ( = ?auto_27739 ?auto_27746 ) ) ( not ( = ?auto_27739 ?auto_27745 ) ) ( not ( = ?auto_27701 ?auto_27709 ) ) ( not ( = ?auto_27701 ?auto_27735 ) ) ( not ( = ?auto_27702 ?auto_27709 ) ) ( not ( = ?auto_27702 ?auto_27735 ) ) ( not ( = ?auto_27703 ?auto_27709 ) ) ( not ( = ?auto_27703 ?auto_27735 ) ) ( not ( = ?auto_27704 ?auto_27709 ) ) ( not ( = ?auto_27704 ?auto_27735 ) ) ( not ( = ?auto_27705 ?auto_27709 ) ) ( not ( = ?auto_27705 ?auto_27735 ) ) ( not ( = ?auto_27706 ?auto_27709 ) ) ( not ( = ?auto_27706 ?auto_27735 ) ) ( not ( = ?auto_27707 ?auto_27709 ) ) ( not ( = ?auto_27707 ?auto_27735 ) ) ( not ( = ?auto_27709 ?auto_27739 ) ) ( not ( = ?auto_27709 ?auto_27737 ) ) ( not ( = ?auto_27709 ?auto_27729 ) ) ( not ( = ?auto_27709 ?auto_27743 ) ) ( not ( = ?auto_27709 ?auto_27728 ) ) ( not ( = ?auto_27709 ?auto_27746 ) ) ( not ( = ?auto_27709 ?auto_27745 ) ) ( not ( = ?auto_27735 ?auto_27739 ) ) ( not ( = ?auto_27735 ?auto_27737 ) ) ( not ( = ?auto_27735 ?auto_27729 ) ) ( not ( = ?auto_27735 ?auto_27743 ) ) ( not ( = ?auto_27735 ?auto_27728 ) ) ( not ( = ?auto_27735 ?auto_27746 ) ) ( not ( = ?auto_27735 ?auto_27745 ) ) ( not ( = ?auto_27701 ?auto_27708 ) ) ( not ( = ?auto_27701 ?auto_27723 ) ) ( not ( = ?auto_27702 ?auto_27708 ) ) ( not ( = ?auto_27702 ?auto_27723 ) ) ( not ( = ?auto_27703 ?auto_27708 ) ) ( not ( = ?auto_27703 ?auto_27723 ) ) ( not ( = ?auto_27704 ?auto_27708 ) ) ( not ( = ?auto_27704 ?auto_27723 ) ) ( not ( = ?auto_27705 ?auto_27708 ) ) ( not ( = ?auto_27705 ?auto_27723 ) ) ( not ( = ?auto_27706 ?auto_27708 ) ) ( not ( = ?auto_27706 ?auto_27723 ) ) ( not ( = ?auto_27707 ?auto_27708 ) ) ( not ( = ?auto_27707 ?auto_27723 ) ) ( not ( = ?auto_27710 ?auto_27708 ) ) ( not ( = ?auto_27710 ?auto_27723 ) ) ( not ( = ?auto_27708 ?auto_27735 ) ) ( not ( = ?auto_27708 ?auto_27739 ) ) ( not ( = ?auto_27708 ?auto_27737 ) ) ( not ( = ?auto_27708 ?auto_27729 ) ) ( not ( = ?auto_27708 ?auto_27743 ) ) ( not ( = ?auto_27708 ?auto_27728 ) ) ( not ( = ?auto_27708 ?auto_27746 ) ) ( not ( = ?auto_27708 ?auto_27745 ) ) ( not ( = ?auto_27723 ?auto_27735 ) ) ( not ( = ?auto_27723 ?auto_27739 ) ) ( not ( = ?auto_27723 ?auto_27737 ) ) ( not ( = ?auto_27723 ?auto_27729 ) ) ( not ( = ?auto_27723 ?auto_27743 ) ) ( not ( = ?auto_27723 ?auto_27728 ) ) ( not ( = ?auto_27723 ?auto_27746 ) ) ( not ( = ?auto_27723 ?auto_27745 ) ) ( not ( = ?auto_27701 ?auto_27711 ) ) ( not ( = ?auto_27701 ?auto_27733 ) ) ( not ( = ?auto_27702 ?auto_27711 ) ) ( not ( = ?auto_27702 ?auto_27733 ) ) ( not ( = ?auto_27703 ?auto_27711 ) ) ( not ( = ?auto_27703 ?auto_27733 ) ) ( not ( = ?auto_27704 ?auto_27711 ) ) ( not ( = ?auto_27704 ?auto_27733 ) ) ( not ( = ?auto_27705 ?auto_27711 ) ) ( not ( = ?auto_27705 ?auto_27733 ) ) ( not ( = ?auto_27706 ?auto_27711 ) ) ( not ( = ?auto_27706 ?auto_27733 ) ) ( not ( = ?auto_27707 ?auto_27711 ) ) ( not ( = ?auto_27707 ?auto_27733 ) ) ( not ( = ?auto_27710 ?auto_27711 ) ) ( not ( = ?auto_27710 ?auto_27733 ) ) ( not ( = ?auto_27709 ?auto_27711 ) ) ( not ( = ?auto_27709 ?auto_27733 ) ) ( not ( = ?auto_27711 ?auto_27723 ) ) ( not ( = ?auto_27711 ?auto_27735 ) ) ( not ( = ?auto_27711 ?auto_27739 ) ) ( not ( = ?auto_27711 ?auto_27737 ) ) ( not ( = ?auto_27711 ?auto_27729 ) ) ( not ( = ?auto_27711 ?auto_27743 ) ) ( not ( = ?auto_27711 ?auto_27728 ) ) ( not ( = ?auto_27711 ?auto_27746 ) ) ( not ( = ?auto_27711 ?auto_27745 ) ) ( not ( = ?auto_27722 ?auto_27724 ) ) ( not ( = ?auto_27722 ?auto_27742 ) ) ( not ( = ?auto_27722 ?auto_27719 ) ) ( not ( = ?auto_27722 ?auto_27725 ) ) ( not ( = ?auto_27722 ?auto_27744 ) ) ( not ( = ?auto_27722 ?auto_27730 ) ) ( not ( = ?auto_27738 ?auto_27727 ) ) ( not ( = ?auto_27738 ?auto_27734 ) ) ( not ( = ?auto_27738 ?auto_27718 ) ) ( not ( = ?auto_27738 ?auto_27740 ) ) ( not ( = ?auto_27738 ?auto_27726 ) ) ( not ( = ?auto_27738 ?auto_27732 ) ) ( not ( = ?auto_27733 ?auto_27723 ) ) ( not ( = ?auto_27733 ?auto_27735 ) ) ( not ( = ?auto_27733 ?auto_27739 ) ) ( not ( = ?auto_27733 ?auto_27737 ) ) ( not ( = ?auto_27733 ?auto_27729 ) ) ( not ( = ?auto_27733 ?auto_27743 ) ) ( not ( = ?auto_27733 ?auto_27728 ) ) ( not ( = ?auto_27733 ?auto_27746 ) ) ( not ( = ?auto_27733 ?auto_27745 ) ) ( not ( = ?auto_27701 ?auto_27712 ) ) ( not ( = ?auto_27701 ?auto_27741 ) ) ( not ( = ?auto_27702 ?auto_27712 ) ) ( not ( = ?auto_27702 ?auto_27741 ) ) ( not ( = ?auto_27703 ?auto_27712 ) ) ( not ( = ?auto_27703 ?auto_27741 ) ) ( not ( = ?auto_27704 ?auto_27712 ) ) ( not ( = ?auto_27704 ?auto_27741 ) ) ( not ( = ?auto_27705 ?auto_27712 ) ) ( not ( = ?auto_27705 ?auto_27741 ) ) ( not ( = ?auto_27706 ?auto_27712 ) ) ( not ( = ?auto_27706 ?auto_27741 ) ) ( not ( = ?auto_27707 ?auto_27712 ) ) ( not ( = ?auto_27707 ?auto_27741 ) ) ( not ( = ?auto_27710 ?auto_27712 ) ) ( not ( = ?auto_27710 ?auto_27741 ) ) ( not ( = ?auto_27709 ?auto_27712 ) ) ( not ( = ?auto_27709 ?auto_27741 ) ) ( not ( = ?auto_27708 ?auto_27712 ) ) ( not ( = ?auto_27708 ?auto_27741 ) ) ( not ( = ?auto_27712 ?auto_27733 ) ) ( not ( = ?auto_27712 ?auto_27723 ) ) ( not ( = ?auto_27712 ?auto_27735 ) ) ( not ( = ?auto_27712 ?auto_27739 ) ) ( not ( = ?auto_27712 ?auto_27737 ) ) ( not ( = ?auto_27712 ?auto_27729 ) ) ( not ( = ?auto_27712 ?auto_27743 ) ) ( not ( = ?auto_27712 ?auto_27728 ) ) ( not ( = ?auto_27712 ?auto_27746 ) ) ( not ( = ?auto_27712 ?auto_27745 ) ) ( not ( = ?auto_27741 ?auto_27733 ) ) ( not ( = ?auto_27741 ?auto_27723 ) ) ( not ( = ?auto_27741 ?auto_27735 ) ) ( not ( = ?auto_27741 ?auto_27739 ) ) ( not ( = ?auto_27741 ?auto_27737 ) ) ( not ( = ?auto_27741 ?auto_27729 ) ) ( not ( = ?auto_27741 ?auto_27743 ) ) ( not ( = ?auto_27741 ?auto_27728 ) ) ( not ( = ?auto_27741 ?auto_27746 ) ) ( not ( = ?auto_27741 ?auto_27745 ) ) ( not ( = ?auto_27701 ?auto_27713 ) ) ( not ( = ?auto_27701 ?auto_27731 ) ) ( not ( = ?auto_27702 ?auto_27713 ) ) ( not ( = ?auto_27702 ?auto_27731 ) ) ( not ( = ?auto_27703 ?auto_27713 ) ) ( not ( = ?auto_27703 ?auto_27731 ) ) ( not ( = ?auto_27704 ?auto_27713 ) ) ( not ( = ?auto_27704 ?auto_27731 ) ) ( not ( = ?auto_27705 ?auto_27713 ) ) ( not ( = ?auto_27705 ?auto_27731 ) ) ( not ( = ?auto_27706 ?auto_27713 ) ) ( not ( = ?auto_27706 ?auto_27731 ) ) ( not ( = ?auto_27707 ?auto_27713 ) ) ( not ( = ?auto_27707 ?auto_27731 ) ) ( not ( = ?auto_27710 ?auto_27713 ) ) ( not ( = ?auto_27710 ?auto_27731 ) ) ( not ( = ?auto_27709 ?auto_27713 ) ) ( not ( = ?auto_27709 ?auto_27731 ) ) ( not ( = ?auto_27708 ?auto_27713 ) ) ( not ( = ?auto_27708 ?auto_27731 ) ) ( not ( = ?auto_27711 ?auto_27713 ) ) ( not ( = ?auto_27711 ?auto_27731 ) ) ( not ( = ?auto_27713 ?auto_27741 ) ) ( not ( = ?auto_27713 ?auto_27733 ) ) ( not ( = ?auto_27713 ?auto_27723 ) ) ( not ( = ?auto_27713 ?auto_27735 ) ) ( not ( = ?auto_27713 ?auto_27739 ) ) ( not ( = ?auto_27713 ?auto_27737 ) ) ( not ( = ?auto_27713 ?auto_27729 ) ) ( not ( = ?auto_27713 ?auto_27743 ) ) ( not ( = ?auto_27713 ?auto_27728 ) ) ( not ( = ?auto_27713 ?auto_27746 ) ) ( not ( = ?auto_27713 ?auto_27745 ) ) ( not ( = ?auto_27731 ?auto_27741 ) ) ( not ( = ?auto_27731 ?auto_27733 ) ) ( not ( = ?auto_27731 ?auto_27723 ) ) ( not ( = ?auto_27731 ?auto_27735 ) ) ( not ( = ?auto_27731 ?auto_27739 ) ) ( not ( = ?auto_27731 ?auto_27737 ) ) ( not ( = ?auto_27731 ?auto_27729 ) ) ( not ( = ?auto_27731 ?auto_27743 ) ) ( not ( = ?auto_27731 ?auto_27728 ) ) ( not ( = ?auto_27731 ?auto_27746 ) ) ( not ( = ?auto_27731 ?auto_27745 ) ) ( not ( = ?auto_27701 ?auto_27714 ) ) ( not ( = ?auto_27701 ?auto_27736 ) ) ( not ( = ?auto_27702 ?auto_27714 ) ) ( not ( = ?auto_27702 ?auto_27736 ) ) ( not ( = ?auto_27703 ?auto_27714 ) ) ( not ( = ?auto_27703 ?auto_27736 ) ) ( not ( = ?auto_27704 ?auto_27714 ) ) ( not ( = ?auto_27704 ?auto_27736 ) ) ( not ( = ?auto_27705 ?auto_27714 ) ) ( not ( = ?auto_27705 ?auto_27736 ) ) ( not ( = ?auto_27706 ?auto_27714 ) ) ( not ( = ?auto_27706 ?auto_27736 ) ) ( not ( = ?auto_27707 ?auto_27714 ) ) ( not ( = ?auto_27707 ?auto_27736 ) ) ( not ( = ?auto_27710 ?auto_27714 ) ) ( not ( = ?auto_27710 ?auto_27736 ) ) ( not ( = ?auto_27709 ?auto_27714 ) ) ( not ( = ?auto_27709 ?auto_27736 ) ) ( not ( = ?auto_27708 ?auto_27714 ) ) ( not ( = ?auto_27708 ?auto_27736 ) ) ( not ( = ?auto_27711 ?auto_27714 ) ) ( not ( = ?auto_27711 ?auto_27736 ) ) ( not ( = ?auto_27712 ?auto_27714 ) ) ( not ( = ?auto_27712 ?auto_27736 ) ) ( not ( = ?auto_27714 ?auto_27731 ) ) ( not ( = ?auto_27714 ?auto_27741 ) ) ( not ( = ?auto_27714 ?auto_27733 ) ) ( not ( = ?auto_27714 ?auto_27723 ) ) ( not ( = ?auto_27714 ?auto_27735 ) ) ( not ( = ?auto_27714 ?auto_27739 ) ) ( not ( = ?auto_27714 ?auto_27737 ) ) ( not ( = ?auto_27714 ?auto_27729 ) ) ( not ( = ?auto_27714 ?auto_27743 ) ) ( not ( = ?auto_27714 ?auto_27728 ) ) ( not ( = ?auto_27714 ?auto_27746 ) ) ( not ( = ?auto_27714 ?auto_27745 ) ) ( not ( = ?auto_27736 ?auto_27731 ) ) ( not ( = ?auto_27736 ?auto_27741 ) ) ( not ( = ?auto_27736 ?auto_27733 ) ) ( not ( = ?auto_27736 ?auto_27723 ) ) ( not ( = ?auto_27736 ?auto_27735 ) ) ( not ( = ?auto_27736 ?auto_27739 ) ) ( not ( = ?auto_27736 ?auto_27737 ) ) ( not ( = ?auto_27736 ?auto_27729 ) ) ( not ( = ?auto_27736 ?auto_27743 ) ) ( not ( = ?auto_27736 ?auto_27728 ) ) ( not ( = ?auto_27736 ?auto_27746 ) ) ( not ( = ?auto_27736 ?auto_27745 ) ) ( not ( = ?auto_27701 ?auto_27715 ) ) ( not ( = ?auto_27701 ?auto_27721 ) ) ( not ( = ?auto_27702 ?auto_27715 ) ) ( not ( = ?auto_27702 ?auto_27721 ) ) ( not ( = ?auto_27703 ?auto_27715 ) ) ( not ( = ?auto_27703 ?auto_27721 ) ) ( not ( = ?auto_27704 ?auto_27715 ) ) ( not ( = ?auto_27704 ?auto_27721 ) ) ( not ( = ?auto_27705 ?auto_27715 ) ) ( not ( = ?auto_27705 ?auto_27721 ) ) ( not ( = ?auto_27706 ?auto_27715 ) ) ( not ( = ?auto_27706 ?auto_27721 ) ) ( not ( = ?auto_27707 ?auto_27715 ) ) ( not ( = ?auto_27707 ?auto_27721 ) ) ( not ( = ?auto_27710 ?auto_27715 ) ) ( not ( = ?auto_27710 ?auto_27721 ) ) ( not ( = ?auto_27709 ?auto_27715 ) ) ( not ( = ?auto_27709 ?auto_27721 ) ) ( not ( = ?auto_27708 ?auto_27715 ) ) ( not ( = ?auto_27708 ?auto_27721 ) ) ( not ( = ?auto_27711 ?auto_27715 ) ) ( not ( = ?auto_27711 ?auto_27721 ) ) ( not ( = ?auto_27712 ?auto_27715 ) ) ( not ( = ?auto_27712 ?auto_27721 ) ) ( not ( = ?auto_27713 ?auto_27715 ) ) ( not ( = ?auto_27713 ?auto_27721 ) ) ( not ( = ?auto_27715 ?auto_27736 ) ) ( not ( = ?auto_27715 ?auto_27731 ) ) ( not ( = ?auto_27715 ?auto_27741 ) ) ( not ( = ?auto_27715 ?auto_27733 ) ) ( not ( = ?auto_27715 ?auto_27723 ) ) ( not ( = ?auto_27715 ?auto_27735 ) ) ( not ( = ?auto_27715 ?auto_27739 ) ) ( not ( = ?auto_27715 ?auto_27737 ) ) ( not ( = ?auto_27715 ?auto_27729 ) ) ( not ( = ?auto_27715 ?auto_27743 ) ) ( not ( = ?auto_27715 ?auto_27728 ) ) ( not ( = ?auto_27715 ?auto_27746 ) ) ( not ( = ?auto_27715 ?auto_27745 ) ) ( not ( = ?auto_27721 ?auto_27736 ) ) ( not ( = ?auto_27721 ?auto_27731 ) ) ( not ( = ?auto_27721 ?auto_27741 ) ) ( not ( = ?auto_27721 ?auto_27733 ) ) ( not ( = ?auto_27721 ?auto_27723 ) ) ( not ( = ?auto_27721 ?auto_27735 ) ) ( not ( = ?auto_27721 ?auto_27739 ) ) ( not ( = ?auto_27721 ?auto_27737 ) ) ( not ( = ?auto_27721 ?auto_27729 ) ) ( not ( = ?auto_27721 ?auto_27743 ) ) ( not ( = ?auto_27721 ?auto_27728 ) ) ( not ( = ?auto_27721 ?auto_27746 ) ) ( not ( = ?auto_27721 ?auto_27745 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_27701 ?auto_27702 ?auto_27703 ?auto_27704 ?auto_27705 ?auto_27706 ?auto_27707 ?auto_27710 ?auto_27709 ?auto_27708 ?auto_27711 ?auto_27712 ?auto_27713 ?auto_27714 )
      ( MAKE-1CRATE ?auto_27714 ?auto_27715 )
      ( MAKE-14CRATE-VERIFY ?auto_27701 ?auto_27702 ?auto_27703 ?auto_27704 ?auto_27705 ?auto_27706 ?auto_27707 ?auto_27710 ?auto_27709 ?auto_27708 ?auto_27711 ?auto_27712 ?auto_27713 ?auto_27714 ?auto_27715 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27749 - SURFACE
      ?auto_27750 - SURFACE
    )
    :vars
    (
      ?auto_27751 - HOIST
      ?auto_27752 - PLACE
      ?auto_27754 - PLACE
      ?auto_27755 - HOIST
      ?auto_27756 - SURFACE
      ?auto_27753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27751 ?auto_27752 ) ( SURFACE-AT ?auto_27749 ?auto_27752 ) ( CLEAR ?auto_27749 ) ( IS-CRATE ?auto_27750 ) ( AVAILABLE ?auto_27751 ) ( not ( = ?auto_27754 ?auto_27752 ) ) ( HOIST-AT ?auto_27755 ?auto_27754 ) ( AVAILABLE ?auto_27755 ) ( SURFACE-AT ?auto_27750 ?auto_27754 ) ( ON ?auto_27750 ?auto_27756 ) ( CLEAR ?auto_27750 ) ( TRUCK-AT ?auto_27753 ?auto_27752 ) ( not ( = ?auto_27749 ?auto_27750 ) ) ( not ( = ?auto_27749 ?auto_27756 ) ) ( not ( = ?auto_27750 ?auto_27756 ) ) ( not ( = ?auto_27751 ?auto_27755 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27753 ?auto_27752 ?auto_27754 )
      ( !LIFT ?auto_27755 ?auto_27750 ?auto_27756 ?auto_27754 )
      ( !LOAD ?auto_27755 ?auto_27750 ?auto_27753 ?auto_27754 )
      ( !DRIVE ?auto_27753 ?auto_27754 ?auto_27752 )
      ( !UNLOAD ?auto_27751 ?auto_27750 ?auto_27753 ?auto_27752 )
      ( !DROP ?auto_27751 ?auto_27750 ?auto_27749 ?auto_27752 )
      ( MAKE-1CRATE-VERIFY ?auto_27749 ?auto_27750 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_27773 - SURFACE
      ?auto_27774 - SURFACE
      ?auto_27775 - SURFACE
      ?auto_27776 - SURFACE
      ?auto_27777 - SURFACE
      ?auto_27778 - SURFACE
      ?auto_27779 - SURFACE
      ?auto_27782 - SURFACE
      ?auto_27781 - SURFACE
      ?auto_27780 - SURFACE
      ?auto_27783 - SURFACE
      ?auto_27784 - SURFACE
      ?auto_27785 - SURFACE
      ?auto_27786 - SURFACE
      ?auto_27788 - SURFACE
      ?auto_27787 - SURFACE
    )
    :vars
    (
      ?auto_27794 - HOIST
      ?auto_27791 - PLACE
      ?auto_27790 - PLACE
      ?auto_27793 - HOIST
      ?auto_27789 - SURFACE
      ?auto_27815 - PLACE
      ?auto_27801 - HOIST
      ?auto_27797 - SURFACE
      ?auto_27805 - PLACE
      ?auto_27802 - HOIST
      ?auto_27814 - SURFACE
      ?auto_27808 - SURFACE
      ?auto_27804 - SURFACE
      ?auto_27799 - PLACE
      ?auto_27800 - HOIST
      ?auto_27811 - SURFACE
      ?auto_27806 - PLACE
      ?auto_27820 - HOIST
      ?auto_27796 - SURFACE
      ?auto_27817 - SURFACE
      ?auto_27816 - SURFACE
      ?auto_27813 - PLACE
      ?auto_27795 - HOIST
      ?auto_27812 - SURFACE
      ?auto_27810 - PLACE
      ?auto_27819 - HOIST
      ?auto_27803 - SURFACE
      ?auto_27818 - SURFACE
      ?auto_27807 - SURFACE
      ?auto_27798 - SURFACE
      ?auto_27809 - SURFACE
      ?auto_27792 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27794 ?auto_27791 ) ( IS-CRATE ?auto_27787 ) ( not ( = ?auto_27790 ?auto_27791 ) ) ( HOIST-AT ?auto_27793 ?auto_27790 ) ( SURFACE-AT ?auto_27787 ?auto_27790 ) ( ON ?auto_27787 ?auto_27789 ) ( CLEAR ?auto_27787 ) ( not ( = ?auto_27788 ?auto_27787 ) ) ( not ( = ?auto_27788 ?auto_27789 ) ) ( not ( = ?auto_27787 ?auto_27789 ) ) ( not ( = ?auto_27794 ?auto_27793 ) ) ( IS-CRATE ?auto_27788 ) ( not ( = ?auto_27815 ?auto_27791 ) ) ( HOIST-AT ?auto_27801 ?auto_27815 ) ( SURFACE-AT ?auto_27788 ?auto_27815 ) ( ON ?auto_27788 ?auto_27797 ) ( CLEAR ?auto_27788 ) ( not ( = ?auto_27786 ?auto_27788 ) ) ( not ( = ?auto_27786 ?auto_27797 ) ) ( not ( = ?auto_27788 ?auto_27797 ) ) ( not ( = ?auto_27794 ?auto_27801 ) ) ( IS-CRATE ?auto_27786 ) ( not ( = ?auto_27805 ?auto_27791 ) ) ( HOIST-AT ?auto_27802 ?auto_27805 ) ( SURFACE-AT ?auto_27786 ?auto_27805 ) ( ON ?auto_27786 ?auto_27814 ) ( CLEAR ?auto_27786 ) ( not ( = ?auto_27785 ?auto_27786 ) ) ( not ( = ?auto_27785 ?auto_27814 ) ) ( not ( = ?auto_27786 ?auto_27814 ) ) ( not ( = ?auto_27794 ?auto_27802 ) ) ( IS-CRATE ?auto_27785 ) ( SURFACE-AT ?auto_27785 ?auto_27805 ) ( ON ?auto_27785 ?auto_27808 ) ( CLEAR ?auto_27785 ) ( not ( = ?auto_27784 ?auto_27785 ) ) ( not ( = ?auto_27784 ?auto_27808 ) ) ( not ( = ?auto_27785 ?auto_27808 ) ) ( IS-CRATE ?auto_27784 ) ( SURFACE-AT ?auto_27784 ?auto_27790 ) ( ON ?auto_27784 ?auto_27804 ) ( CLEAR ?auto_27784 ) ( not ( = ?auto_27783 ?auto_27784 ) ) ( not ( = ?auto_27783 ?auto_27804 ) ) ( not ( = ?auto_27784 ?auto_27804 ) ) ( IS-CRATE ?auto_27783 ) ( not ( = ?auto_27799 ?auto_27791 ) ) ( HOIST-AT ?auto_27800 ?auto_27799 ) ( AVAILABLE ?auto_27800 ) ( SURFACE-AT ?auto_27783 ?auto_27799 ) ( ON ?auto_27783 ?auto_27811 ) ( CLEAR ?auto_27783 ) ( not ( = ?auto_27780 ?auto_27783 ) ) ( not ( = ?auto_27780 ?auto_27811 ) ) ( not ( = ?auto_27783 ?auto_27811 ) ) ( not ( = ?auto_27794 ?auto_27800 ) ) ( IS-CRATE ?auto_27780 ) ( not ( = ?auto_27806 ?auto_27791 ) ) ( HOIST-AT ?auto_27820 ?auto_27806 ) ( SURFACE-AT ?auto_27780 ?auto_27806 ) ( ON ?auto_27780 ?auto_27796 ) ( CLEAR ?auto_27780 ) ( not ( = ?auto_27781 ?auto_27780 ) ) ( not ( = ?auto_27781 ?auto_27796 ) ) ( not ( = ?auto_27780 ?auto_27796 ) ) ( not ( = ?auto_27794 ?auto_27820 ) ) ( IS-CRATE ?auto_27781 ) ( SURFACE-AT ?auto_27781 ?auto_27805 ) ( ON ?auto_27781 ?auto_27817 ) ( CLEAR ?auto_27781 ) ( not ( = ?auto_27782 ?auto_27781 ) ) ( not ( = ?auto_27782 ?auto_27817 ) ) ( not ( = ?auto_27781 ?auto_27817 ) ) ( IS-CRATE ?auto_27782 ) ( AVAILABLE ?auto_27801 ) ( SURFACE-AT ?auto_27782 ?auto_27815 ) ( ON ?auto_27782 ?auto_27816 ) ( CLEAR ?auto_27782 ) ( not ( = ?auto_27779 ?auto_27782 ) ) ( not ( = ?auto_27779 ?auto_27816 ) ) ( not ( = ?auto_27782 ?auto_27816 ) ) ( IS-CRATE ?auto_27779 ) ( not ( = ?auto_27813 ?auto_27791 ) ) ( HOIST-AT ?auto_27795 ?auto_27813 ) ( AVAILABLE ?auto_27795 ) ( SURFACE-AT ?auto_27779 ?auto_27813 ) ( ON ?auto_27779 ?auto_27812 ) ( CLEAR ?auto_27779 ) ( not ( = ?auto_27778 ?auto_27779 ) ) ( not ( = ?auto_27778 ?auto_27812 ) ) ( not ( = ?auto_27779 ?auto_27812 ) ) ( not ( = ?auto_27794 ?auto_27795 ) ) ( IS-CRATE ?auto_27778 ) ( not ( = ?auto_27810 ?auto_27791 ) ) ( HOIST-AT ?auto_27819 ?auto_27810 ) ( SURFACE-AT ?auto_27778 ?auto_27810 ) ( ON ?auto_27778 ?auto_27803 ) ( CLEAR ?auto_27778 ) ( not ( = ?auto_27777 ?auto_27778 ) ) ( not ( = ?auto_27777 ?auto_27803 ) ) ( not ( = ?auto_27778 ?auto_27803 ) ) ( not ( = ?auto_27794 ?auto_27819 ) ) ( IS-CRATE ?auto_27777 ) ( AVAILABLE ?auto_27819 ) ( SURFACE-AT ?auto_27777 ?auto_27810 ) ( ON ?auto_27777 ?auto_27818 ) ( CLEAR ?auto_27777 ) ( not ( = ?auto_27776 ?auto_27777 ) ) ( not ( = ?auto_27776 ?auto_27818 ) ) ( not ( = ?auto_27777 ?auto_27818 ) ) ( IS-CRATE ?auto_27776 ) ( AVAILABLE ?auto_27820 ) ( SURFACE-AT ?auto_27776 ?auto_27806 ) ( ON ?auto_27776 ?auto_27807 ) ( CLEAR ?auto_27776 ) ( not ( = ?auto_27775 ?auto_27776 ) ) ( not ( = ?auto_27775 ?auto_27807 ) ) ( not ( = ?auto_27776 ?auto_27807 ) ) ( IS-CRATE ?auto_27775 ) ( AVAILABLE ?auto_27802 ) ( SURFACE-AT ?auto_27775 ?auto_27805 ) ( ON ?auto_27775 ?auto_27798 ) ( CLEAR ?auto_27775 ) ( not ( = ?auto_27774 ?auto_27775 ) ) ( not ( = ?auto_27774 ?auto_27798 ) ) ( not ( = ?auto_27775 ?auto_27798 ) ) ( SURFACE-AT ?auto_27773 ?auto_27791 ) ( CLEAR ?auto_27773 ) ( IS-CRATE ?auto_27774 ) ( AVAILABLE ?auto_27794 ) ( AVAILABLE ?auto_27793 ) ( SURFACE-AT ?auto_27774 ?auto_27790 ) ( ON ?auto_27774 ?auto_27809 ) ( CLEAR ?auto_27774 ) ( TRUCK-AT ?auto_27792 ?auto_27791 ) ( not ( = ?auto_27773 ?auto_27774 ) ) ( not ( = ?auto_27773 ?auto_27809 ) ) ( not ( = ?auto_27774 ?auto_27809 ) ) ( not ( = ?auto_27773 ?auto_27775 ) ) ( not ( = ?auto_27773 ?auto_27798 ) ) ( not ( = ?auto_27775 ?auto_27809 ) ) ( not ( = ?auto_27805 ?auto_27790 ) ) ( not ( = ?auto_27802 ?auto_27793 ) ) ( not ( = ?auto_27798 ?auto_27809 ) ) ( not ( = ?auto_27773 ?auto_27776 ) ) ( not ( = ?auto_27773 ?auto_27807 ) ) ( not ( = ?auto_27774 ?auto_27776 ) ) ( not ( = ?auto_27774 ?auto_27807 ) ) ( not ( = ?auto_27776 ?auto_27798 ) ) ( not ( = ?auto_27776 ?auto_27809 ) ) ( not ( = ?auto_27806 ?auto_27805 ) ) ( not ( = ?auto_27806 ?auto_27790 ) ) ( not ( = ?auto_27820 ?auto_27802 ) ) ( not ( = ?auto_27820 ?auto_27793 ) ) ( not ( = ?auto_27807 ?auto_27798 ) ) ( not ( = ?auto_27807 ?auto_27809 ) ) ( not ( = ?auto_27773 ?auto_27777 ) ) ( not ( = ?auto_27773 ?auto_27818 ) ) ( not ( = ?auto_27774 ?auto_27777 ) ) ( not ( = ?auto_27774 ?auto_27818 ) ) ( not ( = ?auto_27775 ?auto_27777 ) ) ( not ( = ?auto_27775 ?auto_27818 ) ) ( not ( = ?auto_27777 ?auto_27807 ) ) ( not ( = ?auto_27777 ?auto_27798 ) ) ( not ( = ?auto_27777 ?auto_27809 ) ) ( not ( = ?auto_27810 ?auto_27806 ) ) ( not ( = ?auto_27810 ?auto_27805 ) ) ( not ( = ?auto_27810 ?auto_27790 ) ) ( not ( = ?auto_27819 ?auto_27820 ) ) ( not ( = ?auto_27819 ?auto_27802 ) ) ( not ( = ?auto_27819 ?auto_27793 ) ) ( not ( = ?auto_27818 ?auto_27807 ) ) ( not ( = ?auto_27818 ?auto_27798 ) ) ( not ( = ?auto_27818 ?auto_27809 ) ) ( not ( = ?auto_27773 ?auto_27778 ) ) ( not ( = ?auto_27773 ?auto_27803 ) ) ( not ( = ?auto_27774 ?auto_27778 ) ) ( not ( = ?auto_27774 ?auto_27803 ) ) ( not ( = ?auto_27775 ?auto_27778 ) ) ( not ( = ?auto_27775 ?auto_27803 ) ) ( not ( = ?auto_27776 ?auto_27778 ) ) ( not ( = ?auto_27776 ?auto_27803 ) ) ( not ( = ?auto_27778 ?auto_27818 ) ) ( not ( = ?auto_27778 ?auto_27807 ) ) ( not ( = ?auto_27778 ?auto_27798 ) ) ( not ( = ?auto_27778 ?auto_27809 ) ) ( not ( = ?auto_27803 ?auto_27818 ) ) ( not ( = ?auto_27803 ?auto_27807 ) ) ( not ( = ?auto_27803 ?auto_27798 ) ) ( not ( = ?auto_27803 ?auto_27809 ) ) ( not ( = ?auto_27773 ?auto_27779 ) ) ( not ( = ?auto_27773 ?auto_27812 ) ) ( not ( = ?auto_27774 ?auto_27779 ) ) ( not ( = ?auto_27774 ?auto_27812 ) ) ( not ( = ?auto_27775 ?auto_27779 ) ) ( not ( = ?auto_27775 ?auto_27812 ) ) ( not ( = ?auto_27776 ?auto_27779 ) ) ( not ( = ?auto_27776 ?auto_27812 ) ) ( not ( = ?auto_27777 ?auto_27779 ) ) ( not ( = ?auto_27777 ?auto_27812 ) ) ( not ( = ?auto_27779 ?auto_27803 ) ) ( not ( = ?auto_27779 ?auto_27818 ) ) ( not ( = ?auto_27779 ?auto_27807 ) ) ( not ( = ?auto_27779 ?auto_27798 ) ) ( not ( = ?auto_27779 ?auto_27809 ) ) ( not ( = ?auto_27813 ?auto_27810 ) ) ( not ( = ?auto_27813 ?auto_27806 ) ) ( not ( = ?auto_27813 ?auto_27805 ) ) ( not ( = ?auto_27813 ?auto_27790 ) ) ( not ( = ?auto_27795 ?auto_27819 ) ) ( not ( = ?auto_27795 ?auto_27820 ) ) ( not ( = ?auto_27795 ?auto_27802 ) ) ( not ( = ?auto_27795 ?auto_27793 ) ) ( not ( = ?auto_27812 ?auto_27803 ) ) ( not ( = ?auto_27812 ?auto_27818 ) ) ( not ( = ?auto_27812 ?auto_27807 ) ) ( not ( = ?auto_27812 ?auto_27798 ) ) ( not ( = ?auto_27812 ?auto_27809 ) ) ( not ( = ?auto_27773 ?auto_27782 ) ) ( not ( = ?auto_27773 ?auto_27816 ) ) ( not ( = ?auto_27774 ?auto_27782 ) ) ( not ( = ?auto_27774 ?auto_27816 ) ) ( not ( = ?auto_27775 ?auto_27782 ) ) ( not ( = ?auto_27775 ?auto_27816 ) ) ( not ( = ?auto_27776 ?auto_27782 ) ) ( not ( = ?auto_27776 ?auto_27816 ) ) ( not ( = ?auto_27777 ?auto_27782 ) ) ( not ( = ?auto_27777 ?auto_27816 ) ) ( not ( = ?auto_27778 ?auto_27782 ) ) ( not ( = ?auto_27778 ?auto_27816 ) ) ( not ( = ?auto_27782 ?auto_27812 ) ) ( not ( = ?auto_27782 ?auto_27803 ) ) ( not ( = ?auto_27782 ?auto_27818 ) ) ( not ( = ?auto_27782 ?auto_27807 ) ) ( not ( = ?auto_27782 ?auto_27798 ) ) ( not ( = ?auto_27782 ?auto_27809 ) ) ( not ( = ?auto_27815 ?auto_27813 ) ) ( not ( = ?auto_27815 ?auto_27810 ) ) ( not ( = ?auto_27815 ?auto_27806 ) ) ( not ( = ?auto_27815 ?auto_27805 ) ) ( not ( = ?auto_27815 ?auto_27790 ) ) ( not ( = ?auto_27801 ?auto_27795 ) ) ( not ( = ?auto_27801 ?auto_27819 ) ) ( not ( = ?auto_27801 ?auto_27820 ) ) ( not ( = ?auto_27801 ?auto_27802 ) ) ( not ( = ?auto_27801 ?auto_27793 ) ) ( not ( = ?auto_27816 ?auto_27812 ) ) ( not ( = ?auto_27816 ?auto_27803 ) ) ( not ( = ?auto_27816 ?auto_27818 ) ) ( not ( = ?auto_27816 ?auto_27807 ) ) ( not ( = ?auto_27816 ?auto_27798 ) ) ( not ( = ?auto_27816 ?auto_27809 ) ) ( not ( = ?auto_27773 ?auto_27781 ) ) ( not ( = ?auto_27773 ?auto_27817 ) ) ( not ( = ?auto_27774 ?auto_27781 ) ) ( not ( = ?auto_27774 ?auto_27817 ) ) ( not ( = ?auto_27775 ?auto_27781 ) ) ( not ( = ?auto_27775 ?auto_27817 ) ) ( not ( = ?auto_27776 ?auto_27781 ) ) ( not ( = ?auto_27776 ?auto_27817 ) ) ( not ( = ?auto_27777 ?auto_27781 ) ) ( not ( = ?auto_27777 ?auto_27817 ) ) ( not ( = ?auto_27778 ?auto_27781 ) ) ( not ( = ?auto_27778 ?auto_27817 ) ) ( not ( = ?auto_27779 ?auto_27781 ) ) ( not ( = ?auto_27779 ?auto_27817 ) ) ( not ( = ?auto_27781 ?auto_27816 ) ) ( not ( = ?auto_27781 ?auto_27812 ) ) ( not ( = ?auto_27781 ?auto_27803 ) ) ( not ( = ?auto_27781 ?auto_27818 ) ) ( not ( = ?auto_27781 ?auto_27807 ) ) ( not ( = ?auto_27781 ?auto_27798 ) ) ( not ( = ?auto_27781 ?auto_27809 ) ) ( not ( = ?auto_27817 ?auto_27816 ) ) ( not ( = ?auto_27817 ?auto_27812 ) ) ( not ( = ?auto_27817 ?auto_27803 ) ) ( not ( = ?auto_27817 ?auto_27818 ) ) ( not ( = ?auto_27817 ?auto_27807 ) ) ( not ( = ?auto_27817 ?auto_27798 ) ) ( not ( = ?auto_27817 ?auto_27809 ) ) ( not ( = ?auto_27773 ?auto_27780 ) ) ( not ( = ?auto_27773 ?auto_27796 ) ) ( not ( = ?auto_27774 ?auto_27780 ) ) ( not ( = ?auto_27774 ?auto_27796 ) ) ( not ( = ?auto_27775 ?auto_27780 ) ) ( not ( = ?auto_27775 ?auto_27796 ) ) ( not ( = ?auto_27776 ?auto_27780 ) ) ( not ( = ?auto_27776 ?auto_27796 ) ) ( not ( = ?auto_27777 ?auto_27780 ) ) ( not ( = ?auto_27777 ?auto_27796 ) ) ( not ( = ?auto_27778 ?auto_27780 ) ) ( not ( = ?auto_27778 ?auto_27796 ) ) ( not ( = ?auto_27779 ?auto_27780 ) ) ( not ( = ?auto_27779 ?auto_27796 ) ) ( not ( = ?auto_27782 ?auto_27780 ) ) ( not ( = ?auto_27782 ?auto_27796 ) ) ( not ( = ?auto_27780 ?auto_27817 ) ) ( not ( = ?auto_27780 ?auto_27816 ) ) ( not ( = ?auto_27780 ?auto_27812 ) ) ( not ( = ?auto_27780 ?auto_27803 ) ) ( not ( = ?auto_27780 ?auto_27818 ) ) ( not ( = ?auto_27780 ?auto_27807 ) ) ( not ( = ?auto_27780 ?auto_27798 ) ) ( not ( = ?auto_27780 ?auto_27809 ) ) ( not ( = ?auto_27796 ?auto_27817 ) ) ( not ( = ?auto_27796 ?auto_27816 ) ) ( not ( = ?auto_27796 ?auto_27812 ) ) ( not ( = ?auto_27796 ?auto_27803 ) ) ( not ( = ?auto_27796 ?auto_27818 ) ) ( not ( = ?auto_27796 ?auto_27807 ) ) ( not ( = ?auto_27796 ?auto_27798 ) ) ( not ( = ?auto_27796 ?auto_27809 ) ) ( not ( = ?auto_27773 ?auto_27783 ) ) ( not ( = ?auto_27773 ?auto_27811 ) ) ( not ( = ?auto_27774 ?auto_27783 ) ) ( not ( = ?auto_27774 ?auto_27811 ) ) ( not ( = ?auto_27775 ?auto_27783 ) ) ( not ( = ?auto_27775 ?auto_27811 ) ) ( not ( = ?auto_27776 ?auto_27783 ) ) ( not ( = ?auto_27776 ?auto_27811 ) ) ( not ( = ?auto_27777 ?auto_27783 ) ) ( not ( = ?auto_27777 ?auto_27811 ) ) ( not ( = ?auto_27778 ?auto_27783 ) ) ( not ( = ?auto_27778 ?auto_27811 ) ) ( not ( = ?auto_27779 ?auto_27783 ) ) ( not ( = ?auto_27779 ?auto_27811 ) ) ( not ( = ?auto_27782 ?auto_27783 ) ) ( not ( = ?auto_27782 ?auto_27811 ) ) ( not ( = ?auto_27781 ?auto_27783 ) ) ( not ( = ?auto_27781 ?auto_27811 ) ) ( not ( = ?auto_27783 ?auto_27796 ) ) ( not ( = ?auto_27783 ?auto_27817 ) ) ( not ( = ?auto_27783 ?auto_27816 ) ) ( not ( = ?auto_27783 ?auto_27812 ) ) ( not ( = ?auto_27783 ?auto_27803 ) ) ( not ( = ?auto_27783 ?auto_27818 ) ) ( not ( = ?auto_27783 ?auto_27807 ) ) ( not ( = ?auto_27783 ?auto_27798 ) ) ( not ( = ?auto_27783 ?auto_27809 ) ) ( not ( = ?auto_27799 ?auto_27806 ) ) ( not ( = ?auto_27799 ?auto_27805 ) ) ( not ( = ?auto_27799 ?auto_27815 ) ) ( not ( = ?auto_27799 ?auto_27813 ) ) ( not ( = ?auto_27799 ?auto_27810 ) ) ( not ( = ?auto_27799 ?auto_27790 ) ) ( not ( = ?auto_27800 ?auto_27820 ) ) ( not ( = ?auto_27800 ?auto_27802 ) ) ( not ( = ?auto_27800 ?auto_27801 ) ) ( not ( = ?auto_27800 ?auto_27795 ) ) ( not ( = ?auto_27800 ?auto_27819 ) ) ( not ( = ?auto_27800 ?auto_27793 ) ) ( not ( = ?auto_27811 ?auto_27796 ) ) ( not ( = ?auto_27811 ?auto_27817 ) ) ( not ( = ?auto_27811 ?auto_27816 ) ) ( not ( = ?auto_27811 ?auto_27812 ) ) ( not ( = ?auto_27811 ?auto_27803 ) ) ( not ( = ?auto_27811 ?auto_27818 ) ) ( not ( = ?auto_27811 ?auto_27807 ) ) ( not ( = ?auto_27811 ?auto_27798 ) ) ( not ( = ?auto_27811 ?auto_27809 ) ) ( not ( = ?auto_27773 ?auto_27784 ) ) ( not ( = ?auto_27773 ?auto_27804 ) ) ( not ( = ?auto_27774 ?auto_27784 ) ) ( not ( = ?auto_27774 ?auto_27804 ) ) ( not ( = ?auto_27775 ?auto_27784 ) ) ( not ( = ?auto_27775 ?auto_27804 ) ) ( not ( = ?auto_27776 ?auto_27784 ) ) ( not ( = ?auto_27776 ?auto_27804 ) ) ( not ( = ?auto_27777 ?auto_27784 ) ) ( not ( = ?auto_27777 ?auto_27804 ) ) ( not ( = ?auto_27778 ?auto_27784 ) ) ( not ( = ?auto_27778 ?auto_27804 ) ) ( not ( = ?auto_27779 ?auto_27784 ) ) ( not ( = ?auto_27779 ?auto_27804 ) ) ( not ( = ?auto_27782 ?auto_27784 ) ) ( not ( = ?auto_27782 ?auto_27804 ) ) ( not ( = ?auto_27781 ?auto_27784 ) ) ( not ( = ?auto_27781 ?auto_27804 ) ) ( not ( = ?auto_27780 ?auto_27784 ) ) ( not ( = ?auto_27780 ?auto_27804 ) ) ( not ( = ?auto_27784 ?auto_27811 ) ) ( not ( = ?auto_27784 ?auto_27796 ) ) ( not ( = ?auto_27784 ?auto_27817 ) ) ( not ( = ?auto_27784 ?auto_27816 ) ) ( not ( = ?auto_27784 ?auto_27812 ) ) ( not ( = ?auto_27784 ?auto_27803 ) ) ( not ( = ?auto_27784 ?auto_27818 ) ) ( not ( = ?auto_27784 ?auto_27807 ) ) ( not ( = ?auto_27784 ?auto_27798 ) ) ( not ( = ?auto_27784 ?auto_27809 ) ) ( not ( = ?auto_27804 ?auto_27811 ) ) ( not ( = ?auto_27804 ?auto_27796 ) ) ( not ( = ?auto_27804 ?auto_27817 ) ) ( not ( = ?auto_27804 ?auto_27816 ) ) ( not ( = ?auto_27804 ?auto_27812 ) ) ( not ( = ?auto_27804 ?auto_27803 ) ) ( not ( = ?auto_27804 ?auto_27818 ) ) ( not ( = ?auto_27804 ?auto_27807 ) ) ( not ( = ?auto_27804 ?auto_27798 ) ) ( not ( = ?auto_27804 ?auto_27809 ) ) ( not ( = ?auto_27773 ?auto_27785 ) ) ( not ( = ?auto_27773 ?auto_27808 ) ) ( not ( = ?auto_27774 ?auto_27785 ) ) ( not ( = ?auto_27774 ?auto_27808 ) ) ( not ( = ?auto_27775 ?auto_27785 ) ) ( not ( = ?auto_27775 ?auto_27808 ) ) ( not ( = ?auto_27776 ?auto_27785 ) ) ( not ( = ?auto_27776 ?auto_27808 ) ) ( not ( = ?auto_27777 ?auto_27785 ) ) ( not ( = ?auto_27777 ?auto_27808 ) ) ( not ( = ?auto_27778 ?auto_27785 ) ) ( not ( = ?auto_27778 ?auto_27808 ) ) ( not ( = ?auto_27779 ?auto_27785 ) ) ( not ( = ?auto_27779 ?auto_27808 ) ) ( not ( = ?auto_27782 ?auto_27785 ) ) ( not ( = ?auto_27782 ?auto_27808 ) ) ( not ( = ?auto_27781 ?auto_27785 ) ) ( not ( = ?auto_27781 ?auto_27808 ) ) ( not ( = ?auto_27780 ?auto_27785 ) ) ( not ( = ?auto_27780 ?auto_27808 ) ) ( not ( = ?auto_27783 ?auto_27785 ) ) ( not ( = ?auto_27783 ?auto_27808 ) ) ( not ( = ?auto_27785 ?auto_27804 ) ) ( not ( = ?auto_27785 ?auto_27811 ) ) ( not ( = ?auto_27785 ?auto_27796 ) ) ( not ( = ?auto_27785 ?auto_27817 ) ) ( not ( = ?auto_27785 ?auto_27816 ) ) ( not ( = ?auto_27785 ?auto_27812 ) ) ( not ( = ?auto_27785 ?auto_27803 ) ) ( not ( = ?auto_27785 ?auto_27818 ) ) ( not ( = ?auto_27785 ?auto_27807 ) ) ( not ( = ?auto_27785 ?auto_27798 ) ) ( not ( = ?auto_27785 ?auto_27809 ) ) ( not ( = ?auto_27808 ?auto_27804 ) ) ( not ( = ?auto_27808 ?auto_27811 ) ) ( not ( = ?auto_27808 ?auto_27796 ) ) ( not ( = ?auto_27808 ?auto_27817 ) ) ( not ( = ?auto_27808 ?auto_27816 ) ) ( not ( = ?auto_27808 ?auto_27812 ) ) ( not ( = ?auto_27808 ?auto_27803 ) ) ( not ( = ?auto_27808 ?auto_27818 ) ) ( not ( = ?auto_27808 ?auto_27807 ) ) ( not ( = ?auto_27808 ?auto_27798 ) ) ( not ( = ?auto_27808 ?auto_27809 ) ) ( not ( = ?auto_27773 ?auto_27786 ) ) ( not ( = ?auto_27773 ?auto_27814 ) ) ( not ( = ?auto_27774 ?auto_27786 ) ) ( not ( = ?auto_27774 ?auto_27814 ) ) ( not ( = ?auto_27775 ?auto_27786 ) ) ( not ( = ?auto_27775 ?auto_27814 ) ) ( not ( = ?auto_27776 ?auto_27786 ) ) ( not ( = ?auto_27776 ?auto_27814 ) ) ( not ( = ?auto_27777 ?auto_27786 ) ) ( not ( = ?auto_27777 ?auto_27814 ) ) ( not ( = ?auto_27778 ?auto_27786 ) ) ( not ( = ?auto_27778 ?auto_27814 ) ) ( not ( = ?auto_27779 ?auto_27786 ) ) ( not ( = ?auto_27779 ?auto_27814 ) ) ( not ( = ?auto_27782 ?auto_27786 ) ) ( not ( = ?auto_27782 ?auto_27814 ) ) ( not ( = ?auto_27781 ?auto_27786 ) ) ( not ( = ?auto_27781 ?auto_27814 ) ) ( not ( = ?auto_27780 ?auto_27786 ) ) ( not ( = ?auto_27780 ?auto_27814 ) ) ( not ( = ?auto_27783 ?auto_27786 ) ) ( not ( = ?auto_27783 ?auto_27814 ) ) ( not ( = ?auto_27784 ?auto_27786 ) ) ( not ( = ?auto_27784 ?auto_27814 ) ) ( not ( = ?auto_27786 ?auto_27808 ) ) ( not ( = ?auto_27786 ?auto_27804 ) ) ( not ( = ?auto_27786 ?auto_27811 ) ) ( not ( = ?auto_27786 ?auto_27796 ) ) ( not ( = ?auto_27786 ?auto_27817 ) ) ( not ( = ?auto_27786 ?auto_27816 ) ) ( not ( = ?auto_27786 ?auto_27812 ) ) ( not ( = ?auto_27786 ?auto_27803 ) ) ( not ( = ?auto_27786 ?auto_27818 ) ) ( not ( = ?auto_27786 ?auto_27807 ) ) ( not ( = ?auto_27786 ?auto_27798 ) ) ( not ( = ?auto_27786 ?auto_27809 ) ) ( not ( = ?auto_27814 ?auto_27808 ) ) ( not ( = ?auto_27814 ?auto_27804 ) ) ( not ( = ?auto_27814 ?auto_27811 ) ) ( not ( = ?auto_27814 ?auto_27796 ) ) ( not ( = ?auto_27814 ?auto_27817 ) ) ( not ( = ?auto_27814 ?auto_27816 ) ) ( not ( = ?auto_27814 ?auto_27812 ) ) ( not ( = ?auto_27814 ?auto_27803 ) ) ( not ( = ?auto_27814 ?auto_27818 ) ) ( not ( = ?auto_27814 ?auto_27807 ) ) ( not ( = ?auto_27814 ?auto_27798 ) ) ( not ( = ?auto_27814 ?auto_27809 ) ) ( not ( = ?auto_27773 ?auto_27788 ) ) ( not ( = ?auto_27773 ?auto_27797 ) ) ( not ( = ?auto_27774 ?auto_27788 ) ) ( not ( = ?auto_27774 ?auto_27797 ) ) ( not ( = ?auto_27775 ?auto_27788 ) ) ( not ( = ?auto_27775 ?auto_27797 ) ) ( not ( = ?auto_27776 ?auto_27788 ) ) ( not ( = ?auto_27776 ?auto_27797 ) ) ( not ( = ?auto_27777 ?auto_27788 ) ) ( not ( = ?auto_27777 ?auto_27797 ) ) ( not ( = ?auto_27778 ?auto_27788 ) ) ( not ( = ?auto_27778 ?auto_27797 ) ) ( not ( = ?auto_27779 ?auto_27788 ) ) ( not ( = ?auto_27779 ?auto_27797 ) ) ( not ( = ?auto_27782 ?auto_27788 ) ) ( not ( = ?auto_27782 ?auto_27797 ) ) ( not ( = ?auto_27781 ?auto_27788 ) ) ( not ( = ?auto_27781 ?auto_27797 ) ) ( not ( = ?auto_27780 ?auto_27788 ) ) ( not ( = ?auto_27780 ?auto_27797 ) ) ( not ( = ?auto_27783 ?auto_27788 ) ) ( not ( = ?auto_27783 ?auto_27797 ) ) ( not ( = ?auto_27784 ?auto_27788 ) ) ( not ( = ?auto_27784 ?auto_27797 ) ) ( not ( = ?auto_27785 ?auto_27788 ) ) ( not ( = ?auto_27785 ?auto_27797 ) ) ( not ( = ?auto_27788 ?auto_27814 ) ) ( not ( = ?auto_27788 ?auto_27808 ) ) ( not ( = ?auto_27788 ?auto_27804 ) ) ( not ( = ?auto_27788 ?auto_27811 ) ) ( not ( = ?auto_27788 ?auto_27796 ) ) ( not ( = ?auto_27788 ?auto_27817 ) ) ( not ( = ?auto_27788 ?auto_27816 ) ) ( not ( = ?auto_27788 ?auto_27812 ) ) ( not ( = ?auto_27788 ?auto_27803 ) ) ( not ( = ?auto_27788 ?auto_27818 ) ) ( not ( = ?auto_27788 ?auto_27807 ) ) ( not ( = ?auto_27788 ?auto_27798 ) ) ( not ( = ?auto_27788 ?auto_27809 ) ) ( not ( = ?auto_27797 ?auto_27814 ) ) ( not ( = ?auto_27797 ?auto_27808 ) ) ( not ( = ?auto_27797 ?auto_27804 ) ) ( not ( = ?auto_27797 ?auto_27811 ) ) ( not ( = ?auto_27797 ?auto_27796 ) ) ( not ( = ?auto_27797 ?auto_27817 ) ) ( not ( = ?auto_27797 ?auto_27816 ) ) ( not ( = ?auto_27797 ?auto_27812 ) ) ( not ( = ?auto_27797 ?auto_27803 ) ) ( not ( = ?auto_27797 ?auto_27818 ) ) ( not ( = ?auto_27797 ?auto_27807 ) ) ( not ( = ?auto_27797 ?auto_27798 ) ) ( not ( = ?auto_27797 ?auto_27809 ) ) ( not ( = ?auto_27773 ?auto_27787 ) ) ( not ( = ?auto_27773 ?auto_27789 ) ) ( not ( = ?auto_27774 ?auto_27787 ) ) ( not ( = ?auto_27774 ?auto_27789 ) ) ( not ( = ?auto_27775 ?auto_27787 ) ) ( not ( = ?auto_27775 ?auto_27789 ) ) ( not ( = ?auto_27776 ?auto_27787 ) ) ( not ( = ?auto_27776 ?auto_27789 ) ) ( not ( = ?auto_27777 ?auto_27787 ) ) ( not ( = ?auto_27777 ?auto_27789 ) ) ( not ( = ?auto_27778 ?auto_27787 ) ) ( not ( = ?auto_27778 ?auto_27789 ) ) ( not ( = ?auto_27779 ?auto_27787 ) ) ( not ( = ?auto_27779 ?auto_27789 ) ) ( not ( = ?auto_27782 ?auto_27787 ) ) ( not ( = ?auto_27782 ?auto_27789 ) ) ( not ( = ?auto_27781 ?auto_27787 ) ) ( not ( = ?auto_27781 ?auto_27789 ) ) ( not ( = ?auto_27780 ?auto_27787 ) ) ( not ( = ?auto_27780 ?auto_27789 ) ) ( not ( = ?auto_27783 ?auto_27787 ) ) ( not ( = ?auto_27783 ?auto_27789 ) ) ( not ( = ?auto_27784 ?auto_27787 ) ) ( not ( = ?auto_27784 ?auto_27789 ) ) ( not ( = ?auto_27785 ?auto_27787 ) ) ( not ( = ?auto_27785 ?auto_27789 ) ) ( not ( = ?auto_27786 ?auto_27787 ) ) ( not ( = ?auto_27786 ?auto_27789 ) ) ( not ( = ?auto_27787 ?auto_27797 ) ) ( not ( = ?auto_27787 ?auto_27814 ) ) ( not ( = ?auto_27787 ?auto_27808 ) ) ( not ( = ?auto_27787 ?auto_27804 ) ) ( not ( = ?auto_27787 ?auto_27811 ) ) ( not ( = ?auto_27787 ?auto_27796 ) ) ( not ( = ?auto_27787 ?auto_27817 ) ) ( not ( = ?auto_27787 ?auto_27816 ) ) ( not ( = ?auto_27787 ?auto_27812 ) ) ( not ( = ?auto_27787 ?auto_27803 ) ) ( not ( = ?auto_27787 ?auto_27818 ) ) ( not ( = ?auto_27787 ?auto_27807 ) ) ( not ( = ?auto_27787 ?auto_27798 ) ) ( not ( = ?auto_27787 ?auto_27809 ) ) ( not ( = ?auto_27789 ?auto_27797 ) ) ( not ( = ?auto_27789 ?auto_27814 ) ) ( not ( = ?auto_27789 ?auto_27808 ) ) ( not ( = ?auto_27789 ?auto_27804 ) ) ( not ( = ?auto_27789 ?auto_27811 ) ) ( not ( = ?auto_27789 ?auto_27796 ) ) ( not ( = ?auto_27789 ?auto_27817 ) ) ( not ( = ?auto_27789 ?auto_27816 ) ) ( not ( = ?auto_27789 ?auto_27812 ) ) ( not ( = ?auto_27789 ?auto_27803 ) ) ( not ( = ?auto_27789 ?auto_27818 ) ) ( not ( = ?auto_27789 ?auto_27807 ) ) ( not ( = ?auto_27789 ?auto_27798 ) ) ( not ( = ?auto_27789 ?auto_27809 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_27773 ?auto_27774 ?auto_27775 ?auto_27776 ?auto_27777 ?auto_27778 ?auto_27779 ?auto_27782 ?auto_27781 ?auto_27780 ?auto_27783 ?auto_27784 ?auto_27785 ?auto_27786 ?auto_27788 )
      ( MAKE-1CRATE ?auto_27788 ?auto_27787 )
      ( MAKE-15CRATE-VERIFY ?auto_27773 ?auto_27774 ?auto_27775 ?auto_27776 ?auto_27777 ?auto_27778 ?auto_27779 ?auto_27782 ?auto_27781 ?auto_27780 ?auto_27783 ?auto_27784 ?auto_27785 ?auto_27786 ?auto_27788 ?auto_27787 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27823 - SURFACE
      ?auto_27824 - SURFACE
    )
    :vars
    (
      ?auto_27825 - HOIST
      ?auto_27826 - PLACE
      ?auto_27828 - PLACE
      ?auto_27829 - HOIST
      ?auto_27830 - SURFACE
      ?auto_27827 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27825 ?auto_27826 ) ( SURFACE-AT ?auto_27823 ?auto_27826 ) ( CLEAR ?auto_27823 ) ( IS-CRATE ?auto_27824 ) ( AVAILABLE ?auto_27825 ) ( not ( = ?auto_27828 ?auto_27826 ) ) ( HOIST-AT ?auto_27829 ?auto_27828 ) ( AVAILABLE ?auto_27829 ) ( SURFACE-AT ?auto_27824 ?auto_27828 ) ( ON ?auto_27824 ?auto_27830 ) ( CLEAR ?auto_27824 ) ( TRUCK-AT ?auto_27827 ?auto_27826 ) ( not ( = ?auto_27823 ?auto_27824 ) ) ( not ( = ?auto_27823 ?auto_27830 ) ) ( not ( = ?auto_27824 ?auto_27830 ) ) ( not ( = ?auto_27825 ?auto_27829 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27827 ?auto_27826 ?auto_27828 )
      ( !LIFT ?auto_27829 ?auto_27824 ?auto_27830 ?auto_27828 )
      ( !LOAD ?auto_27829 ?auto_27824 ?auto_27827 ?auto_27828 )
      ( !DRIVE ?auto_27827 ?auto_27828 ?auto_27826 )
      ( !UNLOAD ?auto_27825 ?auto_27824 ?auto_27827 ?auto_27826 )
      ( !DROP ?auto_27825 ?auto_27824 ?auto_27823 ?auto_27826 )
      ( MAKE-1CRATE-VERIFY ?auto_27823 ?auto_27824 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_27848 - SURFACE
      ?auto_27849 - SURFACE
      ?auto_27850 - SURFACE
      ?auto_27851 - SURFACE
      ?auto_27852 - SURFACE
      ?auto_27853 - SURFACE
      ?auto_27854 - SURFACE
      ?auto_27857 - SURFACE
      ?auto_27856 - SURFACE
      ?auto_27855 - SURFACE
      ?auto_27858 - SURFACE
      ?auto_27859 - SURFACE
      ?auto_27860 - SURFACE
      ?auto_27861 - SURFACE
      ?auto_27863 - SURFACE
      ?auto_27862 - SURFACE
      ?auto_27864 - SURFACE
    )
    :vars
    (
      ?auto_27867 - HOIST
      ?auto_27870 - PLACE
      ?auto_27866 - PLACE
      ?auto_27869 - HOIST
      ?auto_27868 - SURFACE
      ?auto_27885 - PLACE
      ?auto_27884 - HOIST
      ?auto_27895 - SURFACE
      ?auto_27897 - PLACE
      ?auto_27875 - HOIST
      ?auto_27883 - SURFACE
      ?auto_27882 - PLACE
      ?auto_27879 - HOIST
      ?auto_27881 - SURFACE
      ?auto_27872 - SURFACE
      ?auto_27894 - SURFACE
      ?auto_27886 - PLACE
      ?auto_27880 - HOIST
      ?auto_27876 - SURFACE
      ?auto_27891 - PLACE
      ?auto_27890 - HOIST
      ?auto_27878 - SURFACE
      ?auto_27888 - SURFACE
      ?auto_27873 - SURFACE
      ?auto_27893 - SURFACE
      ?auto_27889 - PLACE
      ?auto_27896 - HOIST
      ?auto_27877 - SURFACE
      ?auto_27887 - SURFACE
      ?auto_27874 - SURFACE
      ?auto_27871 - SURFACE
      ?auto_27892 - SURFACE
      ?auto_27865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27867 ?auto_27870 ) ( IS-CRATE ?auto_27864 ) ( not ( = ?auto_27866 ?auto_27870 ) ) ( HOIST-AT ?auto_27869 ?auto_27866 ) ( SURFACE-AT ?auto_27864 ?auto_27866 ) ( ON ?auto_27864 ?auto_27868 ) ( CLEAR ?auto_27864 ) ( not ( = ?auto_27862 ?auto_27864 ) ) ( not ( = ?auto_27862 ?auto_27868 ) ) ( not ( = ?auto_27864 ?auto_27868 ) ) ( not ( = ?auto_27867 ?auto_27869 ) ) ( IS-CRATE ?auto_27862 ) ( not ( = ?auto_27885 ?auto_27870 ) ) ( HOIST-AT ?auto_27884 ?auto_27885 ) ( SURFACE-AT ?auto_27862 ?auto_27885 ) ( ON ?auto_27862 ?auto_27895 ) ( CLEAR ?auto_27862 ) ( not ( = ?auto_27863 ?auto_27862 ) ) ( not ( = ?auto_27863 ?auto_27895 ) ) ( not ( = ?auto_27862 ?auto_27895 ) ) ( not ( = ?auto_27867 ?auto_27884 ) ) ( IS-CRATE ?auto_27863 ) ( not ( = ?auto_27897 ?auto_27870 ) ) ( HOIST-AT ?auto_27875 ?auto_27897 ) ( SURFACE-AT ?auto_27863 ?auto_27897 ) ( ON ?auto_27863 ?auto_27883 ) ( CLEAR ?auto_27863 ) ( not ( = ?auto_27861 ?auto_27863 ) ) ( not ( = ?auto_27861 ?auto_27883 ) ) ( not ( = ?auto_27863 ?auto_27883 ) ) ( not ( = ?auto_27867 ?auto_27875 ) ) ( IS-CRATE ?auto_27861 ) ( not ( = ?auto_27882 ?auto_27870 ) ) ( HOIST-AT ?auto_27879 ?auto_27882 ) ( SURFACE-AT ?auto_27861 ?auto_27882 ) ( ON ?auto_27861 ?auto_27881 ) ( CLEAR ?auto_27861 ) ( not ( = ?auto_27860 ?auto_27861 ) ) ( not ( = ?auto_27860 ?auto_27881 ) ) ( not ( = ?auto_27861 ?auto_27881 ) ) ( not ( = ?auto_27867 ?auto_27879 ) ) ( IS-CRATE ?auto_27860 ) ( SURFACE-AT ?auto_27860 ?auto_27882 ) ( ON ?auto_27860 ?auto_27872 ) ( CLEAR ?auto_27860 ) ( not ( = ?auto_27859 ?auto_27860 ) ) ( not ( = ?auto_27859 ?auto_27872 ) ) ( not ( = ?auto_27860 ?auto_27872 ) ) ( IS-CRATE ?auto_27859 ) ( SURFACE-AT ?auto_27859 ?auto_27885 ) ( ON ?auto_27859 ?auto_27894 ) ( CLEAR ?auto_27859 ) ( not ( = ?auto_27858 ?auto_27859 ) ) ( not ( = ?auto_27858 ?auto_27894 ) ) ( not ( = ?auto_27859 ?auto_27894 ) ) ( IS-CRATE ?auto_27858 ) ( not ( = ?auto_27886 ?auto_27870 ) ) ( HOIST-AT ?auto_27880 ?auto_27886 ) ( AVAILABLE ?auto_27880 ) ( SURFACE-AT ?auto_27858 ?auto_27886 ) ( ON ?auto_27858 ?auto_27876 ) ( CLEAR ?auto_27858 ) ( not ( = ?auto_27855 ?auto_27858 ) ) ( not ( = ?auto_27855 ?auto_27876 ) ) ( not ( = ?auto_27858 ?auto_27876 ) ) ( not ( = ?auto_27867 ?auto_27880 ) ) ( IS-CRATE ?auto_27855 ) ( not ( = ?auto_27891 ?auto_27870 ) ) ( HOIST-AT ?auto_27890 ?auto_27891 ) ( SURFACE-AT ?auto_27855 ?auto_27891 ) ( ON ?auto_27855 ?auto_27878 ) ( CLEAR ?auto_27855 ) ( not ( = ?auto_27856 ?auto_27855 ) ) ( not ( = ?auto_27856 ?auto_27878 ) ) ( not ( = ?auto_27855 ?auto_27878 ) ) ( not ( = ?auto_27867 ?auto_27890 ) ) ( IS-CRATE ?auto_27856 ) ( SURFACE-AT ?auto_27856 ?auto_27882 ) ( ON ?auto_27856 ?auto_27888 ) ( CLEAR ?auto_27856 ) ( not ( = ?auto_27857 ?auto_27856 ) ) ( not ( = ?auto_27857 ?auto_27888 ) ) ( not ( = ?auto_27856 ?auto_27888 ) ) ( IS-CRATE ?auto_27857 ) ( AVAILABLE ?auto_27875 ) ( SURFACE-AT ?auto_27857 ?auto_27897 ) ( ON ?auto_27857 ?auto_27873 ) ( CLEAR ?auto_27857 ) ( not ( = ?auto_27854 ?auto_27857 ) ) ( not ( = ?auto_27854 ?auto_27873 ) ) ( not ( = ?auto_27857 ?auto_27873 ) ) ( IS-CRATE ?auto_27854 ) ( AVAILABLE ?auto_27869 ) ( SURFACE-AT ?auto_27854 ?auto_27866 ) ( ON ?auto_27854 ?auto_27893 ) ( CLEAR ?auto_27854 ) ( not ( = ?auto_27853 ?auto_27854 ) ) ( not ( = ?auto_27853 ?auto_27893 ) ) ( not ( = ?auto_27854 ?auto_27893 ) ) ( IS-CRATE ?auto_27853 ) ( not ( = ?auto_27889 ?auto_27870 ) ) ( HOIST-AT ?auto_27896 ?auto_27889 ) ( SURFACE-AT ?auto_27853 ?auto_27889 ) ( ON ?auto_27853 ?auto_27877 ) ( CLEAR ?auto_27853 ) ( not ( = ?auto_27852 ?auto_27853 ) ) ( not ( = ?auto_27852 ?auto_27877 ) ) ( not ( = ?auto_27853 ?auto_27877 ) ) ( not ( = ?auto_27867 ?auto_27896 ) ) ( IS-CRATE ?auto_27852 ) ( AVAILABLE ?auto_27896 ) ( SURFACE-AT ?auto_27852 ?auto_27889 ) ( ON ?auto_27852 ?auto_27887 ) ( CLEAR ?auto_27852 ) ( not ( = ?auto_27851 ?auto_27852 ) ) ( not ( = ?auto_27851 ?auto_27887 ) ) ( not ( = ?auto_27852 ?auto_27887 ) ) ( IS-CRATE ?auto_27851 ) ( AVAILABLE ?auto_27890 ) ( SURFACE-AT ?auto_27851 ?auto_27891 ) ( ON ?auto_27851 ?auto_27874 ) ( CLEAR ?auto_27851 ) ( not ( = ?auto_27850 ?auto_27851 ) ) ( not ( = ?auto_27850 ?auto_27874 ) ) ( not ( = ?auto_27851 ?auto_27874 ) ) ( IS-CRATE ?auto_27850 ) ( AVAILABLE ?auto_27879 ) ( SURFACE-AT ?auto_27850 ?auto_27882 ) ( ON ?auto_27850 ?auto_27871 ) ( CLEAR ?auto_27850 ) ( not ( = ?auto_27849 ?auto_27850 ) ) ( not ( = ?auto_27849 ?auto_27871 ) ) ( not ( = ?auto_27850 ?auto_27871 ) ) ( SURFACE-AT ?auto_27848 ?auto_27870 ) ( CLEAR ?auto_27848 ) ( IS-CRATE ?auto_27849 ) ( AVAILABLE ?auto_27867 ) ( AVAILABLE ?auto_27884 ) ( SURFACE-AT ?auto_27849 ?auto_27885 ) ( ON ?auto_27849 ?auto_27892 ) ( CLEAR ?auto_27849 ) ( TRUCK-AT ?auto_27865 ?auto_27870 ) ( not ( = ?auto_27848 ?auto_27849 ) ) ( not ( = ?auto_27848 ?auto_27892 ) ) ( not ( = ?auto_27849 ?auto_27892 ) ) ( not ( = ?auto_27848 ?auto_27850 ) ) ( not ( = ?auto_27848 ?auto_27871 ) ) ( not ( = ?auto_27850 ?auto_27892 ) ) ( not ( = ?auto_27882 ?auto_27885 ) ) ( not ( = ?auto_27879 ?auto_27884 ) ) ( not ( = ?auto_27871 ?auto_27892 ) ) ( not ( = ?auto_27848 ?auto_27851 ) ) ( not ( = ?auto_27848 ?auto_27874 ) ) ( not ( = ?auto_27849 ?auto_27851 ) ) ( not ( = ?auto_27849 ?auto_27874 ) ) ( not ( = ?auto_27851 ?auto_27871 ) ) ( not ( = ?auto_27851 ?auto_27892 ) ) ( not ( = ?auto_27891 ?auto_27882 ) ) ( not ( = ?auto_27891 ?auto_27885 ) ) ( not ( = ?auto_27890 ?auto_27879 ) ) ( not ( = ?auto_27890 ?auto_27884 ) ) ( not ( = ?auto_27874 ?auto_27871 ) ) ( not ( = ?auto_27874 ?auto_27892 ) ) ( not ( = ?auto_27848 ?auto_27852 ) ) ( not ( = ?auto_27848 ?auto_27887 ) ) ( not ( = ?auto_27849 ?auto_27852 ) ) ( not ( = ?auto_27849 ?auto_27887 ) ) ( not ( = ?auto_27850 ?auto_27852 ) ) ( not ( = ?auto_27850 ?auto_27887 ) ) ( not ( = ?auto_27852 ?auto_27874 ) ) ( not ( = ?auto_27852 ?auto_27871 ) ) ( not ( = ?auto_27852 ?auto_27892 ) ) ( not ( = ?auto_27889 ?auto_27891 ) ) ( not ( = ?auto_27889 ?auto_27882 ) ) ( not ( = ?auto_27889 ?auto_27885 ) ) ( not ( = ?auto_27896 ?auto_27890 ) ) ( not ( = ?auto_27896 ?auto_27879 ) ) ( not ( = ?auto_27896 ?auto_27884 ) ) ( not ( = ?auto_27887 ?auto_27874 ) ) ( not ( = ?auto_27887 ?auto_27871 ) ) ( not ( = ?auto_27887 ?auto_27892 ) ) ( not ( = ?auto_27848 ?auto_27853 ) ) ( not ( = ?auto_27848 ?auto_27877 ) ) ( not ( = ?auto_27849 ?auto_27853 ) ) ( not ( = ?auto_27849 ?auto_27877 ) ) ( not ( = ?auto_27850 ?auto_27853 ) ) ( not ( = ?auto_27850 ?auto_27877 ) ) ( not ( = ?auto_27851 ?auto_27853 ) ) ( not ( = ?auto_27851 ?auto_27877 ) ) ( not ( = ?auto_27853 ?auto_27887 ) ) ( not ( = ?auto_27853 ?auto_27874 ) ) ( not ( = ?auto_27853 ?auto_27871 ) ) ( not ( = ?auto_27853 ?auto_27892 ) ) ( not ( = ?auto_27877 ?auto_27887 ) ) ( not ( = ?auto_27877 ?auto_27874 ) ) ( not ( = ?auto_27877 ?auto_27871 ) ) ( not ( = ?auto_27877 ?auto_27892 ) ) ( not ( = ?auto_27848 ?auto_27854 ) ) ( not ( = ?auto_27848 ?auto_27893 ) ) ( not ( = ?auto_27849 ?auto_27854 ) ) ( not ( = ?auto_27849 ?auto_27893 ) ) ( not ( = ?auto_27850 ?auto_27854 ) ) ( not ( = ?auto_27850 ?auto_27893 ) ) ( not ( = ?auto_27851 ?auto_27854 ) ) ( not ( = ?auto_27851 ?auto_27893 ) ) ( not ( = ?auto_27852 ?auto_27854 ) ) ( not ( = ?auto_27852 ?auto_27893 ) ) ( not ( = ?auto_27854 ?auto_27877 ) ) ( not ( = ?auto_27854 ?auto_27887 ) ) ( not ( = ?auto_27854 ?auto_27874 ) ) ( not ( = ?auto_27854 ?auto_27871 ) ) ( not ( = ?auto_27854 ?auto_27892 ) ) ( not ( = ?auto_27866 ?auto_27889 ) ) ( not ( = ?auto_27866 ?auto_27891 ) ) ( not ( = ?auto_27866 ?auto_27882 ) ) ( not ( = ?auto_27866 ?auto_27885 ) ) ( not ( = ?auto_27869 ?auto_27896 ) ) ( not ( = ?auto_27869 ?auto_27890 ) ) ( not ( = ?auto_27869 ?auto_27879 ) ) ( not ( = ?auto_27869 ?auto_27884 ) ) ( not ( = ?auto_27893 ?auto_27877 ) ) ( not ( = ?auto_27893 ?auto_27887 ) ) ( not ( = ?auto_27893 ?auto_27874 ) ) ( not ( = ?auto_27893 ?auto_27871 ) ) ( not ( = ?auto_27893 ?auto_27892 ) ) ( not ( = ?auto_27848 ?auto_27857 ) ) ( not ( = ?auto_27848 ?auto_27873 ) ) ( not ( = ?auto_27849 ?auto_27857 ) ) ( not ( = ?auto_27849 ?auto_27873 ) ) ( not ( = ?auto_27850 ?auto_27857 ) ) ( not ( = ?auto_27850 ?auto_27873 ) ) ( not ( = ?auto_27851 ?auto_27857 ) ) ( not ( = ?auto_27851 ?auto_27873 ) ) ( not ( = ?auto_27852 ?auto_27857 ) ) ( not ( = ?auto_27852 ?auto_27873 ) ) ( not ( = ?auto_27853 ?auto_27857 ) ) ( not ( = ?auto_27853 ?auto_27873 ) ) ( not ( = ?auto_27857 ?auto_27893 ) ) ( not ( = ?auto_27857 ?auto_27877 ) ) ( not ( = ?auto_27857 ?auto_27887 ) ) ( not ( = ?auto_27857 ?auto_27874 ) ) ( not ( = ?auto_27857 ?auto_27871 ) ) ( not ( = ?auto_27857 ?auto_27892 ) ) ( not ( = ?auto_27897 ?auto_27866 ) ) ( not ( = ?auto_27897 ?auto_27889 ) ) ( not ( = ?auto_27897 ?auto_27891 ) ) ( not ( = ?auto_27897 ?auto_27882 ) ) ( not ( = ?auto_27897 ?auto_27885 ) ) ( not ( = ?auto_27875 ?auto_27869 ) ) ( not ( = ?auto_27875 ?auto_27896 ) ) ( not ( = ?auto_27875 ?auto_27890 ) ) ( not ( = ?auto_27875 ?auto_27879 ) ) ( not ( = ?auto_27875 ?auto_27884 ) ) ( not ( = ?auto_27873 ?auto_27893 ) ) ( not ( = ?auto_27873 ?auto_27877 ) ) ( not ( = ?auto_27873 ?auto_27887 ) ) ( not ( = ?auto_27873 ?auto_27874 ) ) ( not ( = ?auto_27873 ?auto_27871 ) ) ( not ( = ?auto_27873 ?auto_27892 ) ) ( not ( = ?auto_27848 ?auto_27856 ) ) ( not ( = ?auto_27848 ?auto_27888 ) ) ( not ( = ?auto_27849 ?auto_27856 ) ) ( not ( = ?auto_27849 ?auto_27888 ) ) ( not ( = ?auto_27850 ?auto_27856 ) ) ( not ( = ?auto_27850 ?auto_27888 ) ) ( not ( = ?auto_27851 ?auto_27856 ) ) ( not ( = ?auto_27851 ?auto_27888 ) ) ( not ( = ?auto_27852 ?auto_27856 ) ) ( not ( = ?auto_27852 ?auto_27888 ) ) ( not ( = ?auto_27853 ?auto_27856 ) ) ( not ( = ?auto_27853 ?auto_27888 ) ) ( not ( = ?auto_27854 ?auto_27856 ) ) ( not ( = ?auto_27854 ?auto_27888 ) ) ( not ( = ?auto_27856 ?auto_27873 ) ) ( not ( = ?auto_27856 ?auto_27893 ) ) ( not ( = ?auto_27856 ?auto_27877 ) ) ( not ( = ?auto_27856 ?auto_27887 ) ) ( not ( = ?auto_27856 ?auto_27874 ) ) ( not ( = ?auto_27856 ?auto_27871 ) ) ( not ( = ?auto_27856 ?auto_27892 ) ) ( not ( = ?auto_27888 ?auto_27873 ) ) ( not ( = ?auto_27888 ?auto_27893 ) ) ( not ( = ?auto_27888 ?auto_27877 ) ) ( not ( = ?auto_27888 ?auto_27887 ) ) ( not ( = ?auto_27888 ?auto_27874 ) ) ( not ( = ?auto_27888 ?auto_27871 ) ) ( not ( = ?auto_27888 ?auto_27892 ) ) ( not ( = ?auto_27848 ?auto_27855 ) ) ( not ( = ?auto_27848 ?auto_27878 ) ) ( not ( = ?auto_27849 ?auto_27855 ) ) ( not ( = ?auto_27849 ?auto_27878 ) ) ( not ( = ?auto_27850 ?auto_27855 ) ) ( not ( = ?auto_27850 ?auto_27878 ) ) ( not ( = ?auto_27851 ?auto_27855 ) ) ( not ( = ?auto_27851 ?auto_27878 ) ) ( not ( = ?auto_27852 ?auto_27855 ) ) ( not ( = ?auto_27852 ?auto_27878 ) ) ( not ( = ?auto_27853 ?auto_27855 ) ) ( not ( = ?auto_27853 ?auto_27878 ) ) ( not ( = ?auto_27854 ?auto_27855 ) ) ( not ( = ?auto_27854 ?auto_27878 ) ) ( not ( = ?auto_27857 ?auto_27855 ) ) ( not ( = ?auto_27857 ?auto_27878 ) ) ( not ( = ?auto_27855 ?auto_27888 ) ) ( not ( = ?auto_27855 ?auto_27873 ) ) ( not ( = ?auto_27855 ?auto_27893 ) ) ( not ( = ?auto_27855 ?auto_27877 ) ) ( not ( = ?auto_27855 ?auto_27887 ) ) ( not ( = ?auto_27855 ?auto_27874 ) ) ( not ( = ?auto_27855 ?auto_27871 ) ) ( not ( = ?auto_27855 ?auto_27892 ) ) ( not ( = ?auto_27878 ?auto_27888 ) ) ( not ( = ?auto_27878 ?auto_27873 ) ) ( not ( = ?auto_27878 ?auto_27893 ) ) ( not ( = ?auto_27878 ?auto_27877 ) ) ( not ( = ?auto_27878 ?auto_27887 ) ) ( not ( = ?auto_27878 ?auto_27874 ) ) ( not ( = ?auto_27878 ?auto_27871 ) ) ( not ( = ?auto_27878 ?auto_27892 ) ) ( not ( = ?auto_27848 ?auto_27858 ) ) ( not ( = ?auto_27848 ?auto_27876 ) ) ( not ( = ?auto_27849 ?auto_27858 ) ) ( not ( = ?auto_27849 ?auto_27876 ) ) ( not ( = ?auto_27850 ?auto_27858 ) ) ( not ( = ?auto_27850 ?auto_27876 ) ) ( not ( = ?auto_27851 ?auto_27858 ) ) ( not ( = ?auto_27851 ?auto_27876 ) ) ( not ( = ?auto_27852 ?auto_27858 ) ) ( not ( = ?auto_27852 ?auto_27876 ) ) ( not ( = ?auto_27853 ?auto_27858 ) ) ( not ( = ?auto_27853 ?auto_27876 ) ) ( not ( = ?auto_27854 ?auto_27858 ) ) ( not ( = ?auto_27854 ?auto_27876 ) ) ( not ( = ?auto_27857 ?auto_27858 ) ) ( not ( = ?auto_27857 ?auto_27876 ) ) ( not ( = ?auto_27856 ?auto_27858 ) ) ( not ( = ?auto_27856 ?auto_27876 ) ) ( not ( = ?auto_27858 ?auto_27878 ) ) ( not ( = ?auto_27858 ?auto_27888 ) ) ( not ( = ?auto_27858 ?auto_27873 ) ) ( not ( = ?auto_27858 ?auto_27893 ) ) ( not ( = ?auto_27858 ?auto_27877 ) ) ( not ( = ?auto_27858 ?auto_27887 ) ) ( not ( = ?auto_27858 ?auto_27874 ) ) ( not ( = ?auto_27858 ?auto_27871 ) ) ( not ( = ?auto_27858 ?auto_27892 ) ) ( not ( = ?auto_27886 ?auto_27891 ) ) ( not ( = ?auto_27886 ?auto_27882 ) ) ( not ( = ?auto_27886 ?auto_27897 ) ) ( not ( = ?auto_27886 ?auto_27866 ) ) ( not ( = ?auto_27886 ?auto_27889 ) ) ( not ( = ?auto_27886 ?auto_27885 ) ) ( not ( = ?auto_27880 ?auto_27890 ) ) ( not ( = ?auto_27880 ?auto_27879 ) ) ( not ( = ?auto_27880 ?auto_27875 ) ) ( not ( = ?auto_27880 ?auto_27869 ) ) ( not ( = ?auto_27880 ?auto_27896 ) ) ( not ( = ?auto_27880 ?auto_27884 ) ) ( not ( = ?auto_27876 ?auto_27878 ) ) ( not ( = ?auto_27876 ?auto_27888 ) ) ( not ( = ?auto_27876 ?auto_27873 ) ) ( not ( = ?auto_27876 ?auto_27893 ) ) ( not ( = ?auto_27876 ?auto_27877 ) ) ( not ( = ?auto_27876 ?auto_27887 ) ) ( not ( = ?auto_27876 ?auto_27874 ) ) ( not ( = ?auto_27876 ?auto_27871 ) ) ( not ( = ?auto_27876 ?auto_27892 ) ) ( not ( = ?auto_27848 ?auto_27859 ) ) ( not ( = ?auto_27848 ?auto_27894 ) ) ( not ( = ?auto_27849 ?auto_27859 ) ) ( not ( = ?auto_27849 ?auto_27894 ) ) ( not ( = ?auto_27850 ?auto_27859 ) ) ( not ( = ?auto_27850 ?auto_27894 ) ) ( not ( = ?auto_27851 ?auto_27859 ) ) ( not ( = ?auto_27851 ?auto_27894 ) ) ( not ( = ?auto_27852 ?auto_27859 ) ) ( not ( = ?auto_27852 ?auto_27894 ) ) ( not ( = ?auto_27853 ?auto_27859 ) ) ( not ( = ?auto_27853 ?auto_27894 ) ) ( not ( = ?auto_27854 ?auto_27859 ) ) ( not ( = ?auto_27854 ?auto_27894 ) ) ( not ( = ?auto_27857 ?auto_27859 ) ) ( not ( = ?auto_27857 ?auto_27894 ) ) ( not ( = ?auto_27856 ?auto_27859 ) ) ( not ( = ?auto_27856 ?auto_27894 ) ) ( not ( = ?auto_27855 ?auto_27859 ) ) ( not ( = ?auto_27855 ?auto_27894 ) ) ( not ( = ?auto_27859 ?auto_27876 ) ) ( not ( = ?auto_27859 ?auto_27878 ) ) ( not ( = ?auto_27859 ?auto_27888 ) ) ( not ( = ?auto_27859 ?auto_27873 ) ) ( not ( = ?auto_27859 ?auto_27893 ) ) ( not ( = ?auto_27859 ?auto_27877 ) ) ( not ( = ?auto_27859 ?auto_27887 ) ) ( not ( = ?auto_27859 ?auto_27874 ) ) ( not ( = ?auto_27859 ?auto_27871 ) ) ( not ( = ?auto_27859 ?auto_27892 ) ) ( not ( = ?auto_27894 ?auto_27876 ) ) ( not ( = ?auto_27894 ?auto_27878 ) ) ( not ( = ?auto_27894 ?auto_27888 ) ) ( not ( = ?auto_27894 ?auto_27873 ) ) ( not ( = ?auto_27894 ?auto_27893 ) ) ( not ( = ?auto_27894 ?auto_27877 ) ) ( not ( = ?auto_27894 ?auto_27887 ) ) ( not ( = ?auto_27894 ?auto_27874 ) ) ( not ( = ?auto_27894 ?auto_27871 ) ) ( not ( = ?auto_27894 ?auto_27892 ) ) ( not ( = ?auto_27848 ?auto_27860 ) ) ( not ( = ?auto_27848 ?auto_27872 ) ) ( not ( = ?auto_27849 ?auto_27860 ) ) ( not ( = ?auto_27849 ?auto_27872 ) ) ( not ( = ?auto_27850 ?auto_27860 ) ) ( not ( = ?auto_27850 ?auto_27872 ) ) ( not ( = ?auto_27851 ?auto_27860 ) ) ( not ( = ?auto_27851 ?auto_27872 ) ) ( not ( = ?auto_27852 ?auto_27860 ) ) ( not ( = ?auto_27852 ?auto_27872 ) ) ( not ( = ?auto_27853 ?auto_27860 ) ) ( not ( = ?auto_27853 ?auto_27872 ) ) ( not ( = ?auto_27854 ?auto_27860 ) ) ( not ( = ?auto_27854 ?auto_27872 ) ) ( not ( = ?auto_27857 ?auto_27860 ) ) ( not ( = ?auto_27857 ?auto_27872 ) ) ( not ( = ?auto_27856 ?auto_27860 ) ) ( not ( = ?auto_27856 ?auto_27872 ) ) ( not ( = ?auto_27855 ?auto_27860 ) ) ( not ( = ?auto_27855 ?auto_27872 ) ) ( not ( = ?auto_27858 ?auto_27860 ) ) ( not ( = ?auto_27858 ?auto_27872 ) ) ( not ( = ?auto_27860 ?auto_27894 ) ) ( not ( = ?auto_27860 ?auto_27876 ) ) ( not ( = ?auto_27860 ?auto_27878 ) ) ( not ( = ?auto_27860 ?auto_27888 ) ) ( not ( = ?auto_27860 ?auto_27873 ) ) ( not ( = ?auto_27860 ?auto_27893 ) ) ( not ( = ?auto_27860 ?auto_27877 ) ) ( not ( = ?auto_27860 ?auto_27887 ) ) ( not ( = ?auto_27860 ?auto_27874 ) ) ( not ( = ?auto_27860 ?auto_27871 ) ) ( not ( = ?auto_27860 ?auto_27892 ) ) ( not ( = ?auto_27872 ?auto_27894 ) ) ( not ( = ?auto_27872 ?auto_27876 ) ) ( not ( = ?auto_27872 ?auto_27878 ) ) ( not ( = ?auto_27872 ?auto_27888 ) ) ( not ( = ?auto_27872 ?auto_27873 ) ) ( not ( = ?auto_27872 ?auto_27893 ) ) ( not ( = ?auto_27872 ?auto_27877 ) ) ( not ( = ?auto_27872 ?auto_27887 ) ) ( not ( = ?auto_27872 ?auto_27874 ) ) ( not ( = ?auto_27872 ?auto_27871 ) ) ( not ( = ?auto_27872 ?auto_27892 ) ) ( not ( = ?auto_27848 ?auto_27861 ) ) ( not ( = ?auto_27848 ?auto_27881 ) ) ( not ( = ?auto_27849 ?auto_27861 ) ) ( not ( = ?auto_27849 ?auto_27881 ) ) ( not ( = ?auto_27850 ?auto_27861 ) ) ( not ( = ?auto_27850 ?auto_27881 ) ) ( not ( = ?auto_27851 ?auto_27861 ) ) ( not ( = ?auto_27851 ?auto_27881 ) ) ( not ( = ?auto_27852 ?auto_27861 ) ) ( not ( = ?auto_27852 ?auto_27881 ) ) ( not ( = ?auto_27853 ?auto_27861 ) ) ( not ( = ?auto_27853 ?auto_27881 ) ) ( not ( = ?auto_27854 ?auto_27861 ) ) ( not ( = ?auto_27854 ?auto_27881 ) ) ( not ( = ?auto_27857 ?auto_27861 ) ) ( not ( = ?auto_27857 ?auto_27881 ) ) ( not ( = ?auto_27856 ?auto_27861 ) ) ( not ( = ?auto_27856 ?auto_27881 ) ) ( not ( = ?auto_27855 ?auto_27861 ) ) ( not ( = ?auto_27855 ?auto_27881 ) ) ( not ( = ?auto_27858 ?auto_27861 ) ) ( not ( = ?auto_27858 ?auto_27881 ) ) ( not ( = ?auto_27859 ?auto_27861 ) ) ( not ( = ?auto_27859 ?auto_27881 ) ) ( not ( = ?auto_27861 ?auto_27872 ) ) ( not ( = ?auto_27861 ?auto_27894 ) ) ( not ( = ?auto_27861 ?auto_27876 ) ) ( not ( = ?auto_27861 ?auto_27878 ) ) ( not ( = ?auto_27861 ?auto_27888 ) ) ( not ( = ?auto_27861 ?auto_27873 ) ) ( not ( = ?auto_27861 ?auto_27893 ) ) ( not ( = ?auto_27861 ?auto_27877 ) ) ( not ( = ?auto_27861 ?auto_27887 ) ) ( not ( = ?auto_27861 ?auto_27874 ) ) ( not ( = ?auto_27861 ?auto_27871 ) ) ( not ( = ?auto_27861 ?auto_27892 ) ) ( not ( = ?auto_27881 ?auto_27872 ) ) ( not ( = ?auto_27881 ?auto_27894 ) ) ( not ( = ?auto_27881 ?auto_27876 ) ) ( not ( = ?auto_27881 ?auto_27878 ) ) ( not ( = ?auto_27881 ?auto_27888 ) ) ( not ( = ?auto_27881 ?auto_27873 ) ) ( not ( = ?auto_27881 ?auto_27893 ) ) ( not ( = ?auto_27881 ?auto_27877 ) ) ( not ( = ?auto_27881 ?auto_27887 ) ) ( not ( = ?auto_27881 ?auto_27874 ) ) ( not ( = ?auto_27881 ?auto_27871 ) ) ( not ( = ?auto_27881 ?auto_27892 ) ) ( not ( = ?auto_27848 ?auto_27863 ) ) ( not ( = ?auto_27848 ?auto_27883 ) ) ( not ( = ?auto_27849 ?auto_27863 ) ) ( not ( = ?auto_27849 ?auto_27883 ) ) ( not ( = ?auto_27850 ?auto_27863 ) ) ( not ( = ?auto_27850 ?auto_27883 ) ) ( not ( = ?auto_27851 ?auto_27863 ) ) ( not ( = ?auto_27851 ?auto_27883 ) ) ( not ( = ?auto_27852 ?auto_27863 ) ) ( not ( = ?auto_27852 ?auto_27883 ) ) ( not ( = ?auto_27853 ?auto_27863 ) ) ( not ( = ?auto_27853 ?auto_27883 ) ) ( not ( = ?auto_27854 ?auto_27863 ) ) ( not ( = ?auto_27854 ?auto_27883 ) ) ( not ( = ?auto_27857 ?auto_27863 ) ) ( not ( = ?auto_27857 ?auto_27883 ) ) ( not ( = ?auto_27856 ?auto_27863 ) ) ( not ( = ?auto_27856 ?auto_27883 ) ) ( not ( = ?auto_27855 ?auto_27863 ) ) ( not ( = ?auto_27855 ?auto_27883 ) ) ( not ( = ?auto_27858 ?auto_27863 ) ) ( not ( = ?auto_27858 ?auto_27883 ) ) ( not ( = ?auto_27859 ?auto_27863 ) ) ( not ( = ?auto_27859 ?auto_27883 ) ) ( not ( = ?auto_27860 ?auto_27863 ) ) ( not ( = ?auto_27860 ?auto_27883 ) ) ( not ( = ?auto_27863 ?auto_27881 ) ) ( not ( = ?auto_27863 ?auto_27872 ) ) ( not ( = ?auto_27863 ?auto_27894 ) ) ( not ( = ?auto_27863 ?auto_27876 ) ) ( not ( = ?auto_27863 ?auto_27878 ) ) ( not ( = ?auto_27863 ?auto_27888 ) ) ( not ( = ?auto_27863 ?auto_27873 ) ) ( not ( = ?auto_27863 ?auto_27893 ) ) ( not ( = ?auto_27863 ?auto_27877 ) ) ( not ( = ?auto_27863 ?auto_27887 ) ) ( not ( = ?auto_27863 ?auto_27874 ) ) ( not ( = ?auto_27863 ?auto_27871 ) ) ( not ( = ?auto_27863 ?auto_27892 ) ) ( not ( = ?auto_27883 ?auto_27881 ) ) ( not ( = ?auto_27883 ?auto_27872 ) ) ( not ( = ?auto_27883 ?auto_27894 ) ) ( not ( = ?auto_27883 ?auto_27876 ) ) ( not ( = ?auto_27883 ?auto_27878 ) ) ( not ( = ?auto_27883 ?auto_27888 ) ) ( not ( = ?auto_27883 ?auto_27873 ) ) ( not ( = ?auto_27883 ?auto_27893 ) ) ( not ( = ?auto_27883 ?auto_27877 ) ) ( not ( = ?auto_27883 ?auto_27887 ) ) ( not ( = ?auto_27883 ?auto_27874 ) ) ( not ( = ?auto_27883 ?auto_27871 ) ) ( not ( = ?auto_27883 ?auto_27892 ) ) ( not ( = ?auto_27848 ?auto_27862 ) ) ( not ( = ?auto_27848 ?auto_27895 ) ) ( not ( = ?auto_27849 ?auto_27862 ) ) ( not ( = ?auto_27849 ?auto_27895 ) ) ( not ( = ?auto_27850 ?auto_27862 ) ) ( not ( = ?auto_27850 ?auto_27895 ) ) ( not ( = ?auto_27851 ?auto_27862 ) ) ( not ( = ?auto_27851 ?auto_27895 ) ) ( not ( = ?auto_27852 ?auto_27862 ) ) ( not ( = ?auto_27852 ?auto_27895 ) ) ( not ( = ?auto_27853 ?auto_27862 ) ) ( not ( = ?auto_27853 ?auto_27895 ) ) ( not ( = ?auto_27854 ?auto_27862 ) ) ( not ( = ?auto_27854 ?auto_27895 ) ) ( not ( = ?auto_27857 ?auto_27862 ) ) ( not ( = ?auto_27857 ?auto_27895 ) ) ( not ( = ?auto_27856 ?auto_27862 ) ) ( not ( = ?auto_27856 ?auto_27895 ) ) ( not ( = ?auto_27855 ?auto_27862 ) ) ( not ( = ?auto_27855 ?auto_27895 ) ) ( not ( = ?auto_27858 ?auto_27862 ) ) ( not ( = ?auto_27858 ?auto_27895 ) ) ( not ( = ?auto_27859 ?auto_27862 ) ) ( not ( = ?auto_27859 ?auto_27895 ) ) ( not ( = ?auto_27860 ?auto_27862 ) ) ( not ( = ?auto_27860 ?auto_27895 ) ) ( not ( = ?auto_27861 ?auto_27862 ) ) ( not ( = ?auto_27861 ?auto_27895 ) ) ( not ( = ?auto_27862 ?auto_27883 ) ) ( not ( = ?auto_27862 ?auto_27881 ) ) ( not ( = ?auto_27862 ?auto_27872 ) ) ( not ( = ?auto_27862 ?auto_27894 ) ) ( not ( = ?auto_27862 ?auto_27876 ) ) ( not ( = ?auto_27862 ?auto_27878 ) ) ( not ( = ?auto_27862 ?auto_27888 ) ) ( not ( = ?auto_27862 ?auto_27873 ) ) ( not ( = ?auto_27862 ?auto_27893 ) ) ( not ( = ?auto_27862 ?auto_27877 ) ) ( not ( = ?auto_27862 ?auto_27887 ) ) ( not ( = ?auto_27862 ?auto_27874 ) ) ( not ( = ?auto_27862 ?auto_27871 ) ) ( not ( = ?auto_27862 ?auto_27892 ) ) ( not ( = ?auto_27895 ?auto_27883 ) ) ( not ( = ?auto_27895 ?auto_27881 ) ) ( not ( = ?auto_27895 ?auto_27872 ) ) ( not ( = ?auto_27895 ?auto_27894 ) ) ( not ( = ?auto_27895 ?auto_27876 ) ) ( not ( = ?auto_27895 ?auto_27878 ) ) ( not ( = ?auto_27895 ?auto_27888 ) ) ( not ( = ?auto_27895 ?auto_27873 ) ) ( not ( = ?auto_27895 ?auto_27893 ) ) ( not ( = ?auto_27895 ?auto_27877 ) ) ( not ( = ?auto_27895 ?auto_27887 ) ) ( not ( = ?auto_27895 ?auto_27874 ) ) ( not ( = ?auto_27895 ?auto_27871 ) ) ( not ( = ?auto_27895 ?auto_27892 ) ) ( not ( = ?auto_27848 ?auto_27864 ) ) ( not ( = ?auto_27848 ?auto_27868 ) ) ( not ( = ?auto_27849 ?auto_27864 ) ) ( not ( = ?auto_27849 ?auto_27868 ) ) ( not ( = ?auto_27850 ?auto_27864 ) ) ( not ( = ?auto_27850 ?auto_27868 ) ) ( not ( = ?auto_27851 ?auto_27864 ) ) ( not ( = ?auto_27851 ?auto_27868 ) ) ( not ( = ?auto_27852 ?auto_27864 ) ) ( not ( = ?auto_27852 ?auto_27868 ) ) ( not ( = ?auto_27853 ?auto_27864 ) ) ( not ( = ?auto_27853 ?auto_27868 ) ) ( not ( = ?auto_27854 ?auto_27864 ) ) ( not ( = ?auto_27854 ?auto_27868 ) ) ( not ( = ?auto_27857 ?auto_27864 ) ) ( not ( = ?auto_27857 ?auto_27868 ) ) ( not ( = ?auto_27856 ?auto_27864 ) ) ( not ( = ?auto_27856 ?auto_27868 ) ) ( not ( = ?auto_27855 ?auto_27864 ) ) ( not ( = ?auto_27855 ?auto_27868 ) ) ( not ( = ?auto_27858 ?auto_27864 ) ) ( not ( = ?auto_27858 ?auto_27868 ) ) ( not ( = ?auto_27859 ?auto_27864 ) ) ( not ( = ?auto_27859 ?auto_27868 ) ) ( not ( = ?auto_27860 ?auto_27864 ) ) ( not ( = ?auto_27860 ?auto_27868 ) ) ( not ( = ?auto_27861 ?auto_27864 ) ) ( not ( = ?auto_27861 ?auto_27868 ) ) ( not ( = ?auto_27863 ?auto_27864 ) ) ( not ( = ?auto_27863 ?auto_27868 ) ) ( not ( = ?auto_27864 ?auto_27895 ) ) ( not ( = ?auto_27864 ?auto_27883 ) ) ( not ( = ?auto_27864 ?auto_27881 ) ) ( not ( = ?auto_27864 ?auto_27872 ) ) ( not ( = ?auto_27864 ?auto_27894 ) ) ( not ( = ?auto_27864 ?auto_27876 ) ) ( not ( = ?auto_27864 ?auto_27878 ) ) ( not ( = ?auto_27864 ?auto_27888 ) ) ( not ( = ?auto_27864 ?auto_27873 ) ) ( not ( = ?auto_27864 ?auto_27893 ) ) ( not ( = ?auto_27864 ?auto_27877 ) ) ( not ( = ?auto_27864 ?auto_27887 ) ) ( not ( = ?auto_27864 ?auto_27874 ) ) ( not ( = ?auto_27864 ?auto_27871 ) ) ( not ( = ?auto_27864 ?auto_27892 ) ) ( not ( = ?auto_27868 ?auto_27895 ) ) ( not ( = ?auto_27868 ?auto_27883 ) ) ( not ( = ?auto_27868 ?auto_27881 ) ) ( not ( = ?auto_27868 ?auto_27872 ) ) ( not ( = ?auto_27868 ?auto_27894 ) ) ( not ( = ?auto_27868 ?auto_27876 ) ) ( not ( = ?auto_27868 ?auto_27878 ) ) ( not ( = ?auto_27868 ?auto_27888 ) ) ( not ( = ?auto_27868 ?auto_27873 ) ) ( not ( = ?auto_27868 ?auto_27893 ) ) ( not ( = ?auto_27868 ?auto_27877 ) ) ( not ( = ?auto_27868 ?auto_27887 ) ) ( not ( = ?auto_27868 ?auto_27874 ) ) ( not ( = ?auto_27868 ?auto_27871 ) ) ( not ( = ?auto_27868 ?auto_27892 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_27848 ?auto_27849 ?auto_27850 ?auto_27851 ?auto_27852 ?auto_27853 ?auto_27854 ?auto_27857 ?auto_27856 ?auto_27855 ?auto_27858 ?auto_27859 ?auto_27860 ?auto_27861 ?auto_27863 ?auto_27862 )
      ( MAKE-1CRATE ?auto_27862 ?auto_27864 )
      ( MAKE-16CRATE-VERIFY ?auto_27848 ?auto_27849 ?auto_27850 ?auto_27851 ?auto_27852 ?auto_27853 ?auto_27854 ?auto_27857 ?auto_27856 ?auto_27855 ?auto_27858 ?auto_27859 ?auto_27860 ?auto_27861 ?auto_27863 ?auto_27862 ?auto_27864 ) )
  )

)

