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
      ?auto_17089 - SURFACE
      ?auto_17090 - SURFACE
    )
    :vars
    (
      ?auto_17091 - HOIST
      ?auto_17092 - PLACE
      ?auto_17094 - PLACE
      ?auto_17095 - HOIST
      ?auto_17096 - SURFACE
      ?auto_17093 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17091 ?auto_17092 ) ( SURFACE-AT ?auto_17089 ?auto_17092 ) ( CLEAR ?auto_17089 ) ( IS-CRATE ?auto_17090 ) ( AVAILABLE ?auto_17091 ) ( not ( = ?auto_17094 ?auto_17092 ) ) ( HOIST-AT ?auto_17095 ?auto_17094 ) ( AVAILABLE ?auto_17095 ) ( SURFACE-AT ?auto_17090 ?auto_17094 ) ( ON ?auto_17090 ?auto_17096 ) ( CLEAR ?auto_17090 ) ( TRUCK-AT ?auto_17093 ?auto_17092 ) ( not ( = ?auto_17089 ?auto_17090 ) ) ( not ( = ?auto_17089 ?auto_17096 ) ) ( not ( = ?auto_17090 ?auto_17096 ) ) ( not ( = ?auto_17091 ?auto_17095 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17093 ?auto_17092 ?auto_17094 )
      ( !LIFT ?auto_17095 ?auto_17090 ?auto_17096 ?auto_17094 )
      ( !LOAD ?auto_17095 ?auto_17090 ?auto_17093 ?auto_17094 )
      ( !DRIVE ?auto_17093 ?auto_17094 ?auto_17092 )
      ( !UNLOAD ?auto_17091 ?auto_17090 ?auto_17093 ?auto_17092 )
      ( !DROP ?auto_17091 ?auto_17090 ?auto_17089 ?auto_17092 )
      ( MAKE-1CRATE-VERIFY ?auto_17089 ?auto_17090 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17099 - SURFACE
      ?auto_17100 - SURFACE
    )
    :vars
    (
      ?auto_17101 - HOIST
      ?auto_17102 - PLACE
      ?auto_17104 - PLACE
      ?auto_17105 - HOIST
      ?auto_17106 - SURFACE
      ?auto_17103 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17101 ?auto_17102 ) ( SURFACE-AT ?auto_17099 ?auto_17102 ) ( CLEAR ?auto_17099 ) ( IS-CRATE ?auto_17100 ) ( AVAILABLE ?auto_17101 ) ( not ( = ?auto_17104 ?auto_17102 ) ) ( HOIST-AT ?auto_17105 ?auto_17104 ) ( AVAILABLE ?auto_17105 ) ( SURFACE-AT ?auto_17100 ?auto_17104 ) ( ON ?auto_17100 ?auto_17106 ) ( CLEAR ?auto_17100 ) ( TRUCK-AT ?auto_17103 ?auto_17102 ) ( not ( = ?auto_17099 ?auto_17100 ) ) ( not ( = ?auto_17099 ?auto_17106 ) ) ( not ( = ?auto_17100 ?auto_17106 ) ) ( not ( = ?auto_17101 ?auto_17105 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17103 ?auto_17102 ?auto_17104 )
      ( !LIFT ?auto_17105 ?auto_17100 ?auto_17106 ?auto_17104 )
      ( !LOAD ?auto_17105 ?auto_17100 ?auto_17103 ?auto_17104 )
      ( !DRIVE ?auto_17103 ?auto_17104 ?auto_17102 )
      ( !UNLOAD ?auto_17101 ?auto_17100 ?auto_17103 ?auto_17102 )
      ( !DROP ?auto_17101 ?auto_17100 ?auto_17099 ?auto_17102 )
      ( MAKE-1CRATE-VERIFY ?auto_17099 ?auto_17100 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17110 - SURFACE
      ?auto_17111 - SURFACE
      ?auto_17112 - SURFACE
    )
    :vars
    (
      ?auto_17116 - HOIST
      ?auto_17118 - PLACE
      ?auto_17117 - PLACE
      ?auto_17115 - HOIST
      ?auto_17114 - SURFACE
      ?auto_17119 - PLACE
      ?auto_17121 - HOIST
      ?auto_17120 - SURFACE
      ?auto_17113 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17116 ?auto_17118 ) ( IS-CRATE ?auto_17112 ) ( not ( = ?auto_17117 ?auto_17118 ) ) ( HOIST-AT ?auto_17115 ?auto_17117 ) ( AVAILABLE ?auto_17115 ) ( SURFACE-AT ?auto_17112 ?auto_17117 ) ( ON ?auto_17112 ?auto_17114 ) ( CLEAR ?auto_17112 ) ( not ( = ?auto_17111 ?auto_17112 ) ) ( not ( = ?auto_17111 ?auto_17114 ) ) ( not ( = ?auto_17112 ?auto_17114 ) ) ( not ( = ?auto_17116 ?auto_17115 ) ) ( SURFACE-AT ?auto_17110 ?auto_17118 ) ( CLEAR ?auto_17110 ) ( IS-CRATE ?auto_17111 ) ( AVAILABLE ?auto_17116 ) ( not ( = ?auto_17119 ?auto_17118 ) ) ( HOIST-AT ?auto_17121 ?auto_17119 ) ( AVAILABLE ?auto_17121 ) ( SURFACE-AT ?auto_17111 ?auto_17119 ) ( ON ?auto_17111 ?auto_17120 ) ( CLEAR ?auto_17111 ) ( TRUCK-AT ?auto_17113 ?auto_17118 ) ( not ( = ?auto_17110 ?auto_17111 ) ) ( not ( = ?auto_17110 ?auto_17120 ) ) ( not ( = ?auto_17111 ?auto_17120 ) ) ( not ( = ?auto_17116 ?auto_17121 ) ) ( not ( = ?auto_17110 ?auto_17112 ) ) ( not ( = ?auto_17110 ?auto_17114 ) ) ( not ( = ?auto_17112 ?auto_17120 ) ) ( not ( = ?auto_17117 ?auto_17119 ) ) ( not ( = ?auto_17115 ?auto_17121 ) ) ( not ( = ?auto_17114 ?auto_17120 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17110 ?auto_17111 )
      ( MAKE-1CRATE ?auto_17111 ?auto_17112 )
      ( MAKE-2CRATE-VERIFY ?auto_17110 ?auto_17111 ?auto_17112 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17124 - SURFACE
      ?auto_17125 - SURFACE
    )
    :vars
    (
      ?auto_17126 - HOIST
      ?auto_17127 - PLACE
      ?auto_17129 - PLACE
      ?auto_17130 - HOIST
      ?auto_17131 - SURFACE
      ?auto_17128 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17126 ?auto_17127 ) ( SURFACE-AT ?auto_17124 ?auto_17127 ) ( CLEAR ?auto_17124 ) ( IS-CRATE ?auto_17125 ) ( AVAILABLE ?auto_17126 ) ( not ( = ?auto_17129 ?auto_17127 ) ) ( HOIST-AT ?auto_17130 ?auto_17129 ) ( AVAILABLE ?auto_17130 ) ( SURFACE-AT ?auto_17125 ?auto_17129 ) ( ON ?auto_17125 ?auto_17131 ) ( CLEAR ?auto_17125 ) ( TRUCK-AT ?auto_17128 ?auto_17127 ) ( not ( = ?auto_17124 ?auto_17125 ) ) ( not ( = ?auto_17124 ?auto_17131 ) ) ( not ( = ?auto_17125 ?auto_17131 ) ) ( not ( = ?auto_17126 ?auto_17130 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17128 ?auto_17127 ?auto_17129 )
      ( !LIFT ?auto_17130 ?auto_17125 ?auto_17131 ?auto_17129 )
      ( !LOAD ?auto_17130 ?auto_17125 ?auto_17128 ?auto_17129 )
      ( !DRIVE ?auto_17128 ?auto_17129 ?auto_17127 )
      ( !UNLOAD ?auto_17126 ?auto_17125 ?auto_17128 ?auto_17127 )
      ( !DROP ?auto_17126 ?auto_17125 ?auto_17124 ?auto_17127 )
      ( MAKE-1CRATE-VERIFY ?auto_17124 ?auto_17125 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17136 - SURFACE
      ?auto_17137 - SURFACE
      ?auto_17138 - SURFACE
      ?auto_17139 - SURFACE
    )
    :vars
    (
      ?auto_17145 - HOIST
      ?auto_17140 - PLACE
      ?auto_17142 - PLACE
      ?auto_17144 - HOIST
      ?auto_17141 - SURFACE
      ?auto_17147 - PLACE
      ?auto_17149 - HOIST
      ?auto_17146 - SURFACE
      ?auto_17148 - SURFACE
      ?auto_17143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17145 ?auto_17140 ) ( IS-CRATE ?auto_17139 ) ( not ( = ?auto_17142 ?auto_17140 ) ) ( HOIST-AT ?auto_17144 ?auto_17142 ) ( SURFACE-AT ?auto_17139 ?auto_17142 ) ( ON ?auto_17139 ?auto_17141 ) ( CLEAR ?auto_17139 ) ( not ( = ?auto_17138 ?auto_17139 ) ) ( not ( = ?auto_17138 ?auto_17141 ) ) ( not ( = ?auto_17139 ?auto_17141 ) ) ( not ( = ?auto_17145 ?auto_17144 ) ) ( IS-CRATE ?auto_17138 ) ( not ( = ?auto_17147 ?auto_17140 ) ) ( HOIST-AT ?auto_17149 ?auto_17147 ) ( AVAILABLE ?auto_17149 ) ( SURFACE-AT ?auto_17138 ?auto_17147 ) ( ON ?auto_17138 ?auto_17146 ) ( CLEAR ?auto_17138 ) ( not ( = ?auto_17137 ?auto_17138 ) ) ( not ( = ?auto_17137 ?auto_17146 ) ) ( not ( = ?auto_17138 ?auto_17146 ) ) ( not ( = ?auto_17145 ?auto_17149 ) ) ( SURFACE-AT ?auto_17136 ?auto_17140 ) ( CLEAR ?auto_17136 ) ( IS-CRATE ?auto_17137 ) ( AVAILABLE ?auto_17145 ) ( AVAILABLE ?auto_17144 ) ( SURFACE-AT ?auto_17137 ?auto_17142 ) ( ON ?auto_17137 ?auto_17148 ) ( CLEAR ?auto_17137 ) ( TRUCK-AT ?auto_17143 ?auto_17140 ) ( not ( = ?auto_17136 ?auto_17137 ) ) ( not ( = ?auto_17136 ?auto_17148 ) ) ( not ( = ?auto_17137 ?auto_17148 ) ) ( not ( = ?auto_17136 ?auto_17138 ) ) ( not ( = ?auto_17136 ?auto_17146 ) ) ( not ( = ?auto_17138 ?auto_17148 ) ) ( not ( = ?auto_17147 ?auto_17142 ) ) ( not ( = ?auto_17149 ?auto_17144 ) ) ( not ( = ?auto_17146 ?auto_17148 ) ) ( not ( = ?auto_17136 ?auto_17139 ) ) ( not ( = ?auto_17136 ?auto_17141 ) ) ( not ( = ?auto_17137 ?auto_17139 ) ) ( not ( = ?auto_17137 ?auto_17141 ) ) ( not ( = ?auto_17139 ?auto_17146 ) ) ( not ( = ?auto_17139 ?auto_17148 ) ) ( not ( = ?auto_17141 ?auto_17146 ) ) ( not ( = ?auto_17141 ?auto_17148 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17136 ?auto_17137 ?auto_17138 )
      ( MAKE-1CRATE ?auto_17138 ?auto_17139 )
      ( MAKE-3CRATE-VERIFY ?auto_17136 ?auto_17137 ?auto_17138 ?auto_17139 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17152 - SURFACE
      ?auto_17153 - SURFACE
    )
    :vars
    (
      ?auto_17154 - HOIST
      ?auto_17155 - PLACE
      ?auto_17157 - PLACE
      ?auto_17158 - HOIST
      ?auto_17159 - SURFACE
      ?auto_17156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17154 ?auto_17155 ) ( SURFACE-AT ?auto_17152 ?auto_17155 ) ( CLEAR ?auto_17152 ) ( IS-CRATE ?auto_17153 ) ( AVAILABLE ?auto_17154 ) ( not ( = ?auto_17157 ?auto_17155 ) ) ( HOIST-AT ?auto_17158 ?auto_17157 ) ( AVAILABLE ?auto_17158 ) ( SURFACE-AT ?auto_17153 ?auto_17157 ) ( ON ?auto_17153 ?auto_17159 ) ( CLEAR ?auto_17153 ) ( TRUCK-AT ?auto_17156 ?auto_17155 ) ( not ( = ?auto_17152 ?auto_17153 ) ) ( not ( = ?auto_17152 ?auto_17159 ) ) ( not ( = ?auto_17153 ?auto_17159 ) ) ( not ( = ?auto_17154 ?auto_17158 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17156 ?auto_17155 ?auto_17157 )
      ( !LIFT ?auto_17158 ?auto_17153 ?auto_17159 ?auto_17157 )
      ( !LOAD ?auto_17158 ?auto_17153 ?auto_17156 ?auto_17157 )
      ( !DRIVE ?auto_17156 ?auto_17157 ?auto_17155 )
      ( !UNLOAD ?auto_17154 ?auto_17153 ?auto_17156 ?auto_17155 )
      ( !DROP ?auto_17154 ?auto_17153 ?auto_17152 ?auto_17155 )
      ( MAKE-1CRATE-VERIFY ?auto_17152 ?auto_17153 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17165 - SURFACE
      ?auto_17166 - SURFACE
      ?auto_17167 - SURFACE
      ?auto_17168 - SURFACE
      ?auto_17169 - SURFACE
    )
    :vars
    (
      ?auto_17172 - HOIST
      ?auto_17175 - PLACE
      ?auto_17170 - PLACE
      ?auto_17173 - HOIST
      ?auto_17171 - SURFACE
      ?auto_17178 - PLACE
      ?auto_17182 - HOIST
      ?auto_17180 - SURFACE
      ?auto_17176 - PLACE
      ?auto_17177 - HOIST
      ?auto_17179 - SURFACE
      ?auto_17181 - SURFACE
      ?auto_17174 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17172 ?auto_17175 ) ( IS-CRATE ?auto_17169 ) ( not ( = ?auto_17170 ?auto_17175 ) ) ( HOIST-AT ?auto_17173 ?auto_17170 ) ( AVAILABLE ?auto_17173 ) ( SURFACE-AT ?auto_17169 ?auto_17170 ) ( ON ?auto_17169 ?auto_17171 ) ( CLEAR ?auto_17169 ) ( not ( = ?auto_17168 ?auto_17169 ) ) ( not ( = ?auto_17168 ?auto_17171 ) ) ( not ( = ?auto_17169 ?auto_17171 ) ) ( not ( = ?auto_17172 ?auto_17173 ) ) ( IS-CRATE ?auto_17168 ) ( not ( = ?auto_17178 ?auto_17175 ) ) ( HOIST-AT ?auto_17182 ?auto_17178 ) ( SURFACE-AT ?auto_17168 ?auto_17178 ) ( ON ?auto_17168 ?auto_17180 ) ( CLEAR ?auto_17168 ) ( not ( = ?auto_17167 ?auto_17168 ) ) ( not ( = ?auto_17167 ?auto_17180 ) ) ( not ( = ?auto_17168 ?auto_17180 ) ) ( not ( = ?auto_17172 ?auto_17182 ) ) ( IS-CRATE ?auto_17167 ) ( not ( = ?auto_17176 ?auto_17175 ) ) ( HOIST-AT ?auto_17177 ?auto_17176 ) ( AVAILABLE ?auto_17177 ) ( SURFACE-AT ?auto_17167 ?auto_17176 ) ( ON ?auto_17167 ?auto_17179 ) ( CLEAR ?auto_17167 ) ( not ( = ?auto_17166 ?auto_17167 ) ) ( not ( = ?auto_17166 ?auto_17179 ) ) ( not ( = ?auto_17167 ?auto_17179 ) ) ( not ( = ?auto_17172 ?auto_17177 ) ) ( SURFACE-AT ?auto_17165 ?auto_17175 ) ( CLEAR ?auto_17165 ) ( IS-CRATE ?auto_17166 ) ( AVAILABLE ?auto_17172 ) ( AVAILABLE ?auto_17182 ) ( SURFACE-AT ?auto_17166 ?auto_17178 ) ( ON ?auto_17166 ?auto_17181 ) ( CLEAR ?auto_17166 ) ( TRUCK-AT ?auto_17174 ?auto_17175 ) ( not ( = ?auto_17165 ?auto_17166 ) ) ( not ( = ?auto_17165 ?auto_17181 ) ) ( not ( = ?auto_17166 ?auto_17181 ) ) ( not ( = ?auto_17165 ?auto_17167 ) ) ( not ( = ?auto_17165 ?auto_17179 ) ) ( not ( = ?auto_17167 ?auto_17181 ) ) ( not ( = ?auto_17176 ?auto_17178 ) ) ( not ( = ?auto_17177 ?auto_17182 ) ) ( not ( = ?auto_17179 ?auto_17181 ) ) ( not ( = ?auto_17165 ?auto_17168 ) ) ( not ( = ?auto_17165 ?auto_17180 ) ) ( not ( = ?auto_17166 ?auto_17168 ) ) ( not ( = ?auto_17166 ?auto_17180 ) ) ( not ( = ?auto_17168 ?auto_17179 ) ) ( not ( = ?auto_17168 ?auto_17181 ) ) ( not ( = ?auto_17180 ?auto_17179 ) ) ( not ( = ?auto_17180 ?auto_17181 ) ) ( not ( = ?auto_17165 ?auto_17169 ) ) ( not ( = ?auto_17165 ?auto_17171 ) ) ( not ( = ?auto_17166 ?auto_17169 ) ) ( not ( = ?auto_17166 ?auto_17171 ) ) ( not ( = ?auto_17167 ?auto_17169 ) ) ( not ( = ?auto_17167 ?auto_17171 ) ) ( not ( = ?auto_17169 ?auto_17180 ) ) ( not ( = ?auto_17169 ?auto_17179 ) ) ( not ( = ?auto_17169 ?auto_17181 ) ) ( not ( = ?auto_17170 ?auto_17178 ) ) ( not ( = ?auto_17170 ?auto_17176 ) ) ( not ( = ?auto_17173 ?auto_17182 ) ) ( not ( = ?auto_17173 ?auto_17177 ) ) ( not ( = ?auto_17171 ?auto_17180 ) ) ( not ( = ?auto_17171 ?auto_17179 ) ) ( not ( = ?auto_17171 ?auto_17181 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_17165 ?auto_17166 ?auto_17167 ?auto_17168 )
      ( MAKE-1CRATE ?auto_17168 ?auto_17169 )
      ( MAKE-4CRATE-VERIFY ?auto_17165 ?auto_17166 ?auto_17167 ?auto_17168 ?auto_17169 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17185 - SURFACE
      ?auto_17186 - SURFACE
    )
    :vars
    (
      ?auto_17187 - HOIST
      ?auto_17188 - PLACE
      ?auto_17190 - PLACE
      ?auto_17191 - HOIST
      ?auto_17192 - SURFACE
      ?auto_17189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17187 ?auto_17188 ) ( SURFACE-AT ?auto_17185 ?auto_17188 ) ( CLEAR ?auto_17185 ) ( IS-CRATE ?auto_17186 ) ( AVAILABLE ?auto_17187 ) ( not ( = ?auto_17190 ?auto_17188 ) ) ( HOIST-AT ?auto_17191 ?auto_17190 ) ( AVAILABLE ?auto_17191 ) ( SURFACE-AT ?auto_17186 ?auto_17190 ) ( ON ?auto_17186 ?auto_17192 ) ( CLEAR ?auto_17186 ) ( TRUCK-AT ?auto_17189 ?auto_17188 ) ( not ( = ?auto_17185 ?auto_17186 ) ) ( not ( = ?auto_17185 ?auto_17192 ) ) ( not ( = ?auto_17186 ?auto_17192 ) ) ( not ( = ?auto_17187 ?auto_17191 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17189 ?auto_17188 ?auto_17190 )
      ( !LIFT ?auto_17191 ?auto_17186 ?auto_17192 ?auto_17190 )
      ( !LOAD ?auto_17191 ?auto_17186 ?auto_17189 ?auto_17190 )
      ( !DRIVE ?auto_17189 ?auto_17190 ?auto_17188 )
      ( !UNLOAD ?auto_17187 ?auto_17186 ?auto_17189 ?auto_17188 )
      ( !DROP ?auto_17187 ?auto_17186 ?auto_17185 ?auto_17188 )
      ( MAKE-1CRATE-VERIFY ?auto_17185 ?auto_17186 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17199 - SURFACE
      ?auto_17200 - SURFACE
      ?auto_17201 - SURFACE
      ?auto_17202 - SURFACE
      ?auto_17203 - SURFACE
      ?auto_17204 - SURFACE
    )
    :vars
    (
      ?auto_17205 - HOIST
      ?auto_17206 - PLACE
      ?auto_17208 - PLACE
      ?auto_17209 - HOIST
      ?auto_17207 - SURFACE
      ?auto_17213 - PLACE
      ?auto_17212 - HOIST
      ?auto_17217 - SURFACE
      ?auto_17218 - PLACE
      ?auto_17211 - HOIST
      ?auto_17216 - SURFACE
      ?auto_17214 - PLACE
      ?auto_17220 - HOIST
      ?auto_17219 - SURFACE
      ?auto_17215 - SURFACE
      ?auto_17210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17205 ?auto_17206 ) ( IS-CRATE ?auto_17204 ) ( not ( = ?auto_17208 ?auto_17206 ) ) ( HOIST-AT ?auto_17209 ?auto_17208 ) ( AVAILABLE ?auto_17209 ) ( SURFACE-AT ?auto_17204 ?auto_17208 ) ( ON ?auto_17204 ?auto_17207 ) ( CLEAR ?auto_17204 ) ( not ( = ?auto_17203 ?auto_17204 ) ) ( not ( = ?auto_17203 ?auto_17207 ) ) ( not ( = ?auto_17204 ?auto_17207 ) ) ( not ( = ?auto_17205 ?auto_17209 ) ) ( IS-CRATE ?auto_17203 ) ( not ( = ?auto_17213 ?auto_17206 ) ) ( HOIST-AT ?auto_17212 ?auto_17213 ) ( AVAILABLE ?auto_17212 ) ( SURFACE-AT ?auto_17203 ?auto_17213 ) ( ON ?auto_17203 ?auto_17217 ) ( CLEAR ?auto_17203 ) ( not ( = ?auto_17202 ?auto_17203 ) ) ( not ( = ?auto_17202 ?auto_17217 ) ) ( not ( = ?auto_17203 ?auto_17217 ) ) ( not ( = ?auto_17205 ?auto_17212 ) ) ( IS-CRATE ?auto_17202 ) ( not ( = ?auto_17218 ?auto_17206 ) ) ( HOIST-AT ?auto_17211 ?auto_17218 ) ( SURFACE-AT ?auto_17202 ?auto_17218 ) ( ON ?auto_17202 ?auto_17216 ) ( CLEAR ?auto_17202 ) ( not ( = ?auto_17201 ?auto_17202 ) ) ( not ( = ?auto_17201 ?auto_17216 ) ) ( not ( = ?auto_17202 ?auto_17216 ) ) ( not ( = ?auto_17205 ?auto_17211 ) ) ( IS-CRATE ?auto_17201 ) ( not ( = ?auto_17214 ?auto_17206 ) ) ( HOIST-AT ?auto_17220 ?auto_17214 ) ( AVAILABLE ?auto_17220 ) ( SURFACE-AT ?auto_17201 ?auto_17214 ) ( ON ?auto_17201 ?auto_17219 ) ( CLEAR ?auto_17201 ) ( not ( = ?auto_17200 ?auto_17201 ) ) ( not ( = ?auto_17200 ?auto_17219 ) ) ( not ( = ?auto_17201 ?auto_17219 ) ) ( not ( = ?auto_17205 ?auto_17220 ) ) ( SURFACE-AT ?auto_17199 ?auto_17206 ) ( CLEAR ?auto_17199 ) ( IS-CRATE ?auto_17200 ) ( AVAILABLE ?auto_17205 ) ( AVAILABLE ?auto_17211 ) ( SURFACE-AT ?auto_17200 ?auto_17218 ) ( ON ?auto_17200 ?auto_17215 ) ( CLEAR ?auto_17200 ) ( TRUCK-AT ?auto_17210 ?auto_17206 ) ( not ( = ?auto_17199 ?auto_17200 ) ) ( not ( = ?auto_17199 ?auto_17215 ) ) ( not ( = ?auto_17200 ?auto_17215 ) ) ( not ( = ?auto_17199 ?auto_17201 ) ) ( not ( = ?auto_17199 ?auto_17219 ) ) ( not ( = ?auto_17201 ?auto_17215 ) ) ( not ( = ?auto_17214 ?auto_17218 ) ) ( not ( = ?auto_17220 ?auto_17211 ) ) ( not ( = ?auto_17219 ?auto_17215 ) ) ( not ( = ?auto_17199 ?auto_17202 ) ) ( not ( = ?auto_17199 ?auto_17216 ) ) ( not ( = ?auto_17200 ?auto_17202 ) ) ( not ( = ?auto_17200 ?auto_17216 ) ) ( not ( = ?auto_17202 ?auto_17219 ) ) ( not ( = ?auto_17202 ?auto_17215 ) ) ( not ( = ?auto_17216 ?auto_17219 ) ) ( not ( = ?auto_17216 ?auto_17215 ) ) ( not ( = ?auto_17199 ?auto_17203 ) ) ( not ( = ?auto_17199 ?auto_17217 ) ) ( not ( = ?auto_17200 ?auto_17203 ) ) ( not ( = ?auto_17200 ?auto_17217 ) ) ( not ( = ?auto_17201 ?auto_17203 ) ) ( not ( = ?auto_17201 ?auto_17217 ) ) ( not ( = ?auto_17203 ?auto_17216 ) ) ( not ( = ?auto_17203 ?auto_17219 ) ) ( not ( = ?auto_17203 ?auto_17215 ) ) ( not ( = ?auto_17213 ?auto_17218 ) ) ( not ( = ?auto_17213 ?auto_17214 ) ) ( not ( = ?auto_17212 ?auto_17211 ) ) ( not ( = ?auto_17212 ?auto_17220 ) ) ( not ( = ?auto_17217 ?auto_17216 ) ) ( not ( = ?auto_17217 ?auto_17219 ) ) ( not ( = ?auto_17217 ?auto_17215 ) ) ( not ( = ?auto_17199 ?auto_17204 ) ) ( not ( = ?auto_17199 ?auto_17207 ) ) ( not ( = ?auto_17200 ?auto_17204 ) ) ( not ( = ?auto_17200 ?auto_17207 ) ) ( not ( = ?auto_17201 ?auto_17204 ) ) ( not ( = ?auto_17201 ?auto_17207 ) ) ( not ( = ?auto_17202 ?auto_17204 ) ) ( not ( = ?auto_17202 ?auto_17207 ) ) ( not ( = ?auto_17204 ?auto_17217 ) ) ( not ( = ?auto_17204 ?auto_17216 ) ) ( not ( = ?auto_17204 ?auto_17219 ) ) ( not ( = ?auto_17204 ?auto_17215 ) ) ( not ( = ?auto_17208 ?auto_17213 ) ) ( not ( = ?auto_17208 ?auto_17218 ) ) ( not ( = ?auto_17208 ?auto_17214 ) ) ( not ( = ?auto_17209 ?auto_17212 ) ) ( not ( = ?auto_17209 ?auto_17211 ) ) ( not ( = ?auto_17209 ?auto_17220 ) ) ( not ( = ?auto_17207 ?auto_17217 ) ) ( not ( = ?auto_17207 ?auto_17216 ) ) ( not ( = ?auto_17207 ?auto_17219 ) ) ( not ( = ?auto_17207 ?auto_17215 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_17199 ?auto_17200 ?auto_17201 ?auto_17202 ?auto_17203 )
      ( MAKE-1CRATE ?auto_17203 ?auto_17204 )
      ( MAKE-5CRATE-VERIFY ?auto_17199 ?auto_17200 ?auto_17201 ?auto_17202 ?auto_17203 ?auto_17204 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17223 - SURFACE
      ?auto_17224 - SURFACE
    )
    :vars
    (
      ?auto_17225 - HOIST
      ?auto_17226 - PLACE
      ?auto_17228 - PLACE
      ?auto_17229 - HOIST
      ?auto_17230 - SURFACE
      ?auto_17227 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17225 ?auto_17226 ) ( SURFACE-AT ?auto_17223 ?auto_17226 ) ( CLEAR ?auto_17223 ) ( IS-CRATE ?auto_17224 ) ( AVAILABLE ?auto_17225 ) ( not ( = ?auto_17228 ?auto_17226 ) ) ( HOIST-AT ?auto_17229 ?auto_17228 ) ( AVAILABLE ?auto_17229 ) ( SURFACE-AT ?auto_17224 ?auto_17228 ) ( ON ?auto_17224 ?auto_17230 ) ( CLEAR ?auto_17224 ) ( TRUCK-AT ?auto_17227 ?auto_17226 ) ( not ( = ?auto_17223 ?auto_17224 ) ) ( not ( = ?auto_17223 ?auto_17230 ) ) ( not ( = ?auto_17224 ?auto_17230 ) ) ( not ( = ?auto_17225 ?auto_17229 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17227 ?auto_17226 ?auto_17228 )
      ( !LIFT ?auto_17229 ?auto_17224 ?auto_17230 ?auto_17228 )
      ( !LOAD ?auto_17229 ?auto_17224 ?auto_17227 ?auto_17228 )
      ( !DRIVE ?auto_17227 ?auto_17228 ?auto_17226 )
      ( !UNLOAD ?auto_17225 ?auto_17224 ?auto_17227 ?auto_17226 )
      ( !DROP ?auto_17225 ?auto_17224 ?auto_17223 ?auto_17226 )
      ( MAKE-1CRATE-VERIFY ?auto_17223 ?auto_17224 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_17238 - SURFACE
      ?auto_17239 - SURFACE
      ?auto_17240 - SURFACE
      ?auto_17241 - SURFACE
      ?auto_17242 - SURFACE
      ?auto_17243 - SURFACE
      ?auto_17244 - SURFACE
    )
    :vars
    (
      ?auto_17247 - HOIST
      ?auto_17248 - PLACE
      ?auto_17249 - PLACE
      ?auto_17246 - HOIST
      ?auto_17245 - SURFACE
      ?auto_17257 - PLACE
      ?auto_17263 - HOIST
      ?auto_17251 - SURFACE
      ?auto_17255 - PLACE
      ?auto_17256 - HOIST
      ?auto_17252 - SURFACE
      ?auto_17262 - PLACE
      ?auto_17253 - HOIST
      ?auto_17254 - SURFACE
      ?auto_17259 - PLACE
      ?auto_17261 - HOIST
      ?auto_17258 - SURFACE
      ?auto_17260 - SURFACE
      ?auto_17250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17247 ?auto_17248 ) ( IS-CRATE ?auto_17244 ) ( not ( = ?auto_17249 ?auto_17248 ) ) ( HOIST-AT ?auto_17246 ?auto_17249 ) ( AVAILABLE ?auto_17246 ) ( SURFACE-AT ?auto_17244 ?auto_17249 ) ( ON ?auto_17244 ?auto_17245 ) ( CLEAR ?auto_17244 ) ( not ( = ?auto_17243 ?auto_17244 ) ) ( not ( = ?auto_17243 ?auto_17245 ) ) ( not ( = ?auto_17244 ?auto_17245 ) ) ( not ( = ?auto_17247 ?auto_17246 ) ) ( IS-CRATE ?auto_17243 ) ( not ( = ?auto_17257 ?auto_17248 ) ) ( HOIST-AT ?auto_17263 ?auto_17257 ) ( AVAILABLE ?auto_17263 ) ( SURFACE-AT ?auto_17243 ?auto_17257 ) ( ON ?auto_17243 ?auto_17251 ) ( CLEAR ?auto_17243 ) ( not ( = ?auto_17242 ?auto_17243 ) ) ( not ( = ?auto_17242 ?auto_17251 ) ) ( not ( = ?auto_17243 ?auto_17251 ) ) ( not ( = ?auto_17247 ?auto_17263 ) ) ( IS-CRATE ?auto_17242 ) ( not ( = ?auto_17255 ?auto_17248 ) ) ( HOIST-AT ?auto_17256 ?auto_17255 ) ( AVAILABLE ?auto_17256 ) ( SURFACE-AT ?auto_17242 ?auto_17255 ) ( ON ?auto_17242 ?auto_17252 ) ( CLEAR ?auto_17242 ) ( not ( = ?auto_17241 ?auto_17242 ) ) ( not ( = ?auto_17241 ?auto_17252 ) ) ( not ( = ?auto_17242 ?auto_17252 ) ) ( not ( = ?auto_17247 ?auto_17256 ) ) ( IS-CRATE ?auto_17241 ) ( not ( = ?auto_17262 ?auto_17248 ) ) ( HOIST-AT ?auto_17253 ?auto_17262 ) ( SURFACE-AT ?auto_17241 ?auto_17262 ) ( ON ?auto_17241 ?auto_17254 ) ( CLEAR ?auto_17241 ) ( not ( = ?auto_17240 ?auto_17241 ) ) ( not ( = ?auto_17240 ?auto_17254 ) ) ( not ( = ?auto_17241 ?auto_17254 ) ) ( not ( = ?auto_17247 ?auto_17253 ) ) ( IS-CRATE ?auto_17240 ) ( not ( = ?auto_17259 ?auto_17248 ) ) ( HOIST-AT ?auto_17261 ?auto_17259 ) ( AVAILABLE ?auto_17261 ) ( SURFACE-AT ?auto_17240 ?auto_17259 ) ( ON ?auto_17240 ?auto_17258 ) ( CLEAR ?auto_17240 ) ( not ( = ?auto_17239 ?auto_17240 ) ) ( not ( = ?auto_17239 ?auto_17258 ) ) ( not ( = ?auto_17240 ?auto_17258 ) ) ( not ( = ?auto_17247 ?auto_17261 ) ) ( SURFACE-AT ?auto_17238 ?auto_17248 ) ( CLEAR ?auto_17238 ) ( IS-CRATE ?auto_17239 ) ( AVAILABLE ?auto_17247 ) ( AVAILABLE ?auto_17253 ) ( SURFACE-AT ?auto_17239 ?auto_17262 ) ( ON ?auto_17239 ?auto_17260 ) ( CLEAR ?auto_17239 ) ( TRUCK-AT ?auto_17250 ?auto_17248 ) ( not ( = ?auto_17238 ?auto_17239 ) ) ( not ( = ?auto_17238 ?auto_17260 ) ) ( not ( = ?auto_17239 ?auto_17260 ) ) ( not ( = ?auto_17238 ?auto_17240 ) ) ( not ( = ?auto_17238 ?auto_17258 ) ) ( not ( = ?auto_17240 ?auto_17260 ) ) ( not ( = ?auto_17259 ?auto_17262 ) ) ( not ( = ?auto_17261 ?auto_17253 ) ) ( not ( = ?auto_17258 ?auto_17260 ) ) ( not ( = ?auto_17238 ?auto_17241 ) ) ( not ( = ?auto_17238 ?auto_17254 ) ) ( not ( = ?auto_17239 ?auto_17241 ) ) ( not ( = ?auto_17239 ?auto_17254 ) ) ( not ( = ?auto_17241 ?auto_17258 ) ) ( not ( = ?auto_17241 ?auto_17260 ) ) ( not ( = ?auto_17254 ?auto_17258 ) ) ( not ( = ?auto_17254 ?auto_17260 ) ) ( not ( = ?auto_17238 ?auto_17242 ) ) ( not ( = ?auto_17238 ?auto_17252 ) ) ( not ( = ?auto_17239 ?auto_17242 ) ) ( not ( = ?auto_17239 ?auto_17252 ) ) ( not ( = ?auto_17240 ?auto_17242 ) ) ( not ( = ?auto_17240 ?auto_17252 ) ) ( not ( = ?auto_17242 ?auto_17254 ) ) ( not ( = ?auto_17242 ?auto_17258 ) ) ( not ( = ?auto_17242 ?auto_17260 ) ) ( not ( = ?auto_17255 ?auto_17262 ) ) ( not ( = ?auto_17255 ?auto_17259 ) ) ( not ( = ?auto_17256 ?auto_17253 ) ) ( not ( = ?auto_17256 ?auto_17261 ) ) ( not ( = ?auto_17252 ?auto_17254 ) ) ( not ( = ?auto_17252 ?auto_17258 ) ) ( not ( = ?auto_17252 ?auto_17260 ) ) ( not ( = ?auto_17238 ?auto_17243 ) ) ( not ( = ?auto_17238 ?auto_17251 ) ) ( not ( = ?auto_17239 ?auto_17243 ) ) ( not ( = ?auto_17239 ?auto_17251 ) ) ( not ( = ?auto_17240 ?auto_17243 ) ) ( not ( = ?auto_17240 ?auto_17251 ) ) ( not ( = ?auto_17241 ?auto_17243 ) ) ( not ( = ?auto_17241 ?auto_17251 ) ) ( not ( = ?auto_17243 ?auto_17252 ) ) ( not ( = ?auto_17243 ?auto_17254 ) ) ( not ( = ?auto_17243 ?auto_17258 ) ) ( not ( = ?auto_17243 ?auto_17260 ) ) ( not ( = ?auto_17257 ?auto_17255 ) ) ( not ( = ?auto_17257 ?auto_17262 ) ) ( not ( = ?auto_17257 ?auto_17259 ) ) ( not ( = ?auto_17263 ?auto_17256 ) ) ( not ( = ?auto_17263 ?auto_17253 ) ) ( not ( = ?auto_17263 ?auto_17261 ) ) ( not ( = ?auto_17251 ?auto_17252 ) ) ( not ( = ?auto_17251 ?auto_17254 ) ) ( not ( = ?auto_17251 ?auto_17258 ) ) ( not ( = ?auto_17251 ?auto_17260 ) ) ( not ( = ?auto_17238 ?auto_17244 ) ) ( not ( = ?auto_17238 ?auto_17245 ) ) ( not ( = ?auto_17239 ?auto_17244 ) ) ( not ( = ?auto_17239 ?auto_17245 ) ) ( not ( = ?auto_17240 ?auto_17244 ) ) ( not ( = ?auto_17240 ?auto_17245 ) ) ( not ( = ?auto_17241 ?auto_17244 ) ) ( not ( = ?auto_17241 ?auto_17245 ) ) ( not ( = ?auto_17242 ?auto_17244 ) ) ( not ( = ?auto_17242 ?auto_17245 ) ) ( not ( = ?auto_17244 ?auto_17251 ) ) ( not ( = ?auto_17244 ?auto_17252 ) ) ( not ( = ?auto_17244 ?auto_17254 ) ) ( not ( = ?auto_17244 ?auto_17258 ) ) ( not ( = ?auto_17244 ?auto_17260 ) ) ( not ( = ?auto_17249 ?auto_17257 ) ) ( not ( = ?auto_17249 ?auto_17255 ) ) ( not ( = ?auto_17249 ?auto_17262 ) ) ( not ( = ?auto_17249 ?auto_17259 ) ) ( not ( = ?auto_17246 ?auto_17263 ) ) ( not ( = ?auto_17246 ?auto_17256 ) ) ( not ( = ?auto_17246 ?auto_17253 ) ) ( not ( = ?auto_17246 ?auto_17261 ) ) ( not ( = ?auto_17245 ?auto_17251 ) ) ( not ( = ?auto_17245 ?auto_17252 ) ) ( not ( = ?auto_17245 ?auto_17254 ) ) ( not ( = ?auto_17245 ?auto_17258 ) ) ( not ( = ?auto_17245 ?auto_17260 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_17238 ?auto_17239 ?auto_17240 ?auto_17241 ?auto_17242 ?auto_17243 )
      ( MAKE-1CRATE ?auto_17243 ?auto_17244 )
      ( MAKE-6CRATE-VERIFY ?auto_17238 ?auto_17239 ?auto_17240 ?auto_17241 ?auto_17242 ?auto_17243 ?auto_17244 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17266 - SURFACE
      ?auto_17267 - SURFACE
    )
    :vars
    (
      ?auto_17268 - HOIST
      ?auto_17269 - PLACE
      ?auto_17271 - PLACE
      ?auto_17272 - HOIST
      ?auto_17273 - SURFACE
      ?auto_17270 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17268 ?auto_17269 ) ( SURFACE-AT ?auto_17266 ?auto_17269 ) ( CLEAR ?auto_17266 ) ( IS-CRATE ?auto_17267 ) ( AVAILABLE ?auto_17268 ) ( not ( = ?auto_17271 ?auto_17269 ) ) ( HOIST-AT ?auto_17272 ?auto_17271 ) ( AVAILABLE ?auto_17272 ) ( SURFACE-AT ?auto_17267 ?auto_17271 ) ( ON ?auto_17267 ?auto_17273 ) ( CLEAR ?auto_17267 ) ( TRUCK-AT ?auto_17270 ?auto_17269 ) ( not ( = ?auto_17266 ?auto_17267 ) ) ( not ( = ?auto_17266 ?auto_17273 ) ) ( not ( = ?auto_17267 ?auto_17273 ) ) ( not ( = ?auto_17268 ?auto_17272 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17270 ?auto_17269 ?auto_17271 )
      ( !LIFT ?auto_17272 ?auto_17267 ?auto_17273 ?auto_17271 )
      ( !LOAD ?auto_17272 ?auto_17267 ?auto_17270 ?auto_17271 )
      ( !DRIVE ?auto_17270 ?auto_17271 ?auto_17269 )
      ( !UNLOAD ?auto_17268 ?auto_17267 ?auto_17270 ?auto_17269 )
      ( !DROP ?auto_17268 ?auto_17267 ?auto_17266 ?auto_17269 )
      ( MAKE-1CRATE-VERIFY ?auto_17266 ?auto_17267 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_17282 - SURFACE
      ?auto_17283 - SURFACE
      ?auto_17284 - SURFACE
      ?auto_17285 - SURFACE
      ?auto_17286 - SURFACE
      ?auto_17287 - SURFACE
      ?auto_17289 - SURFACE
      ?auto_17288 - SURFACE
    )
    :vars
    (
      ?auto_17291 - HOIST
      ?auto_17295 - PLACE
      ?auto_17292 - PLACE
      ?auto_17293 - HOIST
      ?auto_17290 - SURFACE
      ?auto_17301 - PLACE
      ?auto_17309 - HOIST
      ?auto_17308 - SURFACE
      ?auto_17302 - PLACE
      ?auto_17310 - HOIST
      ?auto_17305 - SURFACE
      ?auto_17304 - PLACE
      ?auto_17303 - HOIST
      ?auto_17299 - SURFACE
      ?auto_17297 - PLACE
      ?auto_17300 - HOIST
      ?auto_17298 - SURFACE
      ?auto_17306 - PLACE
      ?auto_17307 - HOIST
      ?auto_17311 - SURFACE
      ?auto_17296 - SURFACE
      ?auto_17294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17291 ?auto_17295 ) ( IS-CRATE ?auto_17288 ) ( not ( = ?auto_17292 ?auto_17295 ) ) ( HOIST-AT ?auto_17293 ?auto_17292 ) ( AVAILABLE ?auto_17293 ) ( SURFACE-AT ?auto_17288 ?auto_17292 ) ( ON ?auto_17288 ?auto_17290 ) ( CLEAR ?auto_17288 ) ( not ( = ?auto_17289 ?auto_17288 ) ) ( not ( = ?auto_17289 ?auto_17290 ) ) ( not ( = ?auto_17288 ?auto_17290 ) ) ( not ( = ?auto_17291 ?auto_17293 ) ) ( IS-CRATE ?auto_17289 ) ( not ( = ?auto_17301 ?auto_17295 ) ) ( HOIST-AT ?auto_17309 ?auto_17301 ) ( AVAILABLE ?auto_17309 ) ( SURFACE-AT ?auto_17289 ?auto_17301 ) ( ON ?auto_17289 ?auto_17308 ) ( CLEAR ?auto_17289 ) ( not ( = ?auto_17287 ?auto_17289 ) ) ( not ( = ?auto_17287 ?auto_17308 ) ) ( not ( = ?auto_17289 ?auto_17308 ) ) ( not ( = ?auto_17291 ?auto_17309 ) ) ( IS-CRATE ?auto_17287 ) ( not ( = ?auto_17302 ?auto_17295 ) ) ( HOIST-AT ?auto_17310 ?auto_17302 ) ( AVAILABLE ?auto_17310 ) ( SURFACE-AT ?auto_17287 ?auto_17302 ) ( ON ?auto_17287 ?auto_17305 ) ( CLEAR ?auto_17287 ) ( not ( = ?auto_17286 ?auto_17287 ) ) ( not ( = ?auto_17286 ?auto_17305 ) ) ( not ( = ?auto_17287 ?auto_17305 ) ) ( not ( = ?auto_17291 ?auto_17310 ) ) ( IS-CRATE ?auto_17286 ) ( not ( = ?auto_17304 ?auto_17295 ) ) ( HOIST-AT ?auto_17303 ?auto_17304 ) ( AVAILABLE ?auto_17303 ) ( SURFACE-AT ?auto_17286 ?auto_17304 ) ( ON ?auto_17286 ?auto_17299 ) ( CLEAR ?auto_17286 ) ( not ( = ?auto_17285 ?auto_17286 ) ) ( not ( = ?auto_17285 ?auto_17299 ) ) ( not ( = ?auto_17286 ?auto_17299 ) ) ( not ( = ?auto_17291 ?auto_17303 ) ) ( IS-CRATE ?auto_17285 ) ( not ( = ?auto_17297 ?auto_17295 ) ) ( HOIST-AT ?auto_17300 ?auto_17297 ) ( SURFACE-AT ?auto_17285 ?auto_17297 ) ( ON ?auto_17285 ?auto_17298 ) ( CLEAR ?auto_17285 ) ( not ( = ?auto_17284 ?auto_17285 ) ) ( not ( = ?auto_17284 ?auto_17298 ) ) ( not ( = ?auto_17285 ?auto_17298 ) ) ( not ( = ?auto_17291 ?auto_17300 ) ) ( IS-CRATE ?auto_17284 ) ( not ( = ?auto_17306 ?auto_17295 ) ) ( HOIST-AT ?auto_17307 ?auto_17306 ) ( AVAILABLE ?auto_17307 ) ( SURFACE-AT ?auto_17284 ?auto_17306 ) ( ON ?auto_17284 ?auto_17311 ) ( CLEAR ?auto_17284 ) ( not ( = ?auto_17283 ?auto_17284 ) ) ( not ( = ?auto_17283 ?auto_17311 ) ) ( not ( = ?auto_17284 ?auto_17311 ) ) ( not ( = ?auto_17291 ?auto_17307 ) ) ( SURFACE-AT ?auto_17282 ?auto_17295 ) ( CLEAR ?auto_17282 ) ( IS-CRATE ?auto_17283 ) ( AVAILABLE ?auto_17291 ) ( AVAILABLE ?auto_17300 ) ( SURFACE-AT ?auto_17283 ?auto_17297 ) ( ON ?auto_17283 ?auto_17296 ) ( CLEAR ?auto_17283 ) ( TRUCK-AT ?auto_17294 ?auto_17295 ) ( not ( = ?auto_17282 ?auto_17283 ) ) ( not ( = ?auto_17282 ?auto_17296 ) ) ( not ( = ?auto_17283 ?auto_17296 ) ) ( not ( = ?auto_17282 ?auto_17284 ) ) ( not ( = ?auto_17282 ?auto_17311 ) ) ( not ( = ?auto_17284 ?auto_17296 ) ) ( not ( = ?auto_17306 ?auto_17297 ) ) ( not ( = ?auto_17307 ?auto_17300 ) ) ( not ( = ?auto_17311 ?auto_17296 ) ) ( not ( = ?auto_17282 ?auto_17285 ) ) ( not ( = ?auto_17282 ?auto_17298 ) ) ( not ( = ?auto_17283 ?auto_17285 ) ) ( not ( = ?auto_17283 ?auto_17298 ) ) ( not ( = ?auto_17285 ?auto_17311 ) ) ( not ( = ?auto_17285 ?auto_17296 ) ) ( not ( = ?auto_17298 ?auto_17311 ) ) ( not ( = ?auto_17298 ?auto_17296 ) ) ( not ( = ?auto_17282 ?auto_17286 ) ) ( not ( = ?auto_17282 ?auto_17299 ) ) ( not ( = ?auto_17283 ?auto_17286 ) ) ( not ( = ?auto_17283 ?auto_17299 ) ) ( not ( = ?auto_17284 ?auto_17286 ) ) ( not ( = ?auto_17284 ?auto_17299 ) ) ( not ( = ?auto_17286 ?auto_17298 ) ) ( not ( = ?auto_17286 ?auto_17311 ) ) ( not ( = ?auto_17286 ?auto_17296 ) ) ( not ( = ?auto_17304 ?auto_17297 ) ) ( not ( = ?auto_17304 ?auto_17306 ) ) ( not ( = ?auto_17303 ?auto_17300 ) ) ( not ( = ?auto_17303 ?auto_17307 ) ) ( not ( = ?auto_17299 ?auto_17298 ) ) ( not ( = ?auto_17299 ?auto_17311 ) ) ( not ( = ?auto_17299 ?auto_17296 ) ) ( not ( = ?auto_17282 ?auto_17287 ) ) ( not ( = ?auto_17282 ?auto_17305 ) ) ( not ( = ?auto_17283 ?auto_17287 ) ) ( not ( = ?auto_17283 ?auto_17305 ) ) ( not ( = ?auto_17284 ?auto_17287 ) ) ( not ( = ?auto_17284 ?auto_17305 ) ) ( not ( = ?auto_17285 ?auto_17287 ) ) ( not ( = ?auto_17285 ?auto_17305 ) ) ( not ( = ?auto_17287 ?auto_17299 ) ) ( not ( = ?auto_17287 ?auto_17298 ) ) ( not ( = ?auto_17287 ?auto_17311 ) ) ( not ( = ?auto_17287 ?auto_17296 ) ) ( not ( = ?auto_17302 ?auto_17304 ) ) ( not ( = ?auto_17302 ?auto_17297 ) ) ( not ( = ?auto_17302 ?auto_17306 ) ) ( not ( = ?auto_17310 ?auto_17303 ) ) ( not ( = ?auto_17310 ?auto_17300 ) ) ( not ( = ?auto_17310 ?auto_17307 ) ) ( not ( = ?auto_17305 ?auto_17299 ) ) ( not ( = ?auto_17305 ?auto_17298 ) ) ( not ( = ?auto_17305 ?auto_17311 ) ) ( not ( = ?auto_17305 ?auto_17296 ) ) ( not ( = ?auto_17282 ?auto_17289 ) ) ( not ( = ?auto_17282 ?auto_17308 ) ) ( not ( = ?auto_17283 ?auto_17289 ) ) ( not ( = ?auto_17283 ?auto_17308 ) ) ( not ( = ?auto_17284 ?auto_17289 ) ) ( not ( = ?auto_17284 ?auto_17308 ) ) ( not ( = ?auto_17285 ?auto_17289 ) ) ( not ( = ?auto_17285 ?auto_17308 ) ) ( not ( = ?auto_17286 ?auto_17289 ) ) ( not ( = ?auto_17286 ?auto_17308 ) ) ( not ( = ?auto_17289 ?auto_17305 ) ) ( not ( = ?auto_17289 ?auto_17299 ) ) ( not ( = ?auto_17289 ?auto_17298 ) ) ( not ( = ?auto_17289 ?auto_17311 ) ) ( not ( = ?auto_17289 ?auto_17296 ) ) ( not ( = ?auto_17301 ?auto_17302 ) ) ( not ( = ?auto_17301 ?auto_17304 ) ) ( not ( = ?auto_17301 ?auto_17297 ) ) ( not ( = ?auto_17301 ?auto_17306 ) ) ( not ( = ?auto_17309 ?auto_17310 ) ) ( not ( = ?auto_17309 ?auto_17303 ) ) ( not ( = ?auto_17309 ?auto_17300 ) ) ( not ( = ?auto_17309 ?auto_17307 ) ) ( not ( = ?auto_17308 ?auto_17305 ) ) ( not ( = ?auto_17308 ?auto_17299 ) ) ( not ( = ?auto_17308 ?auto_17298 ) ) ( not ( = ?auto_17308 ?auto_17311 ) ) ( not ( = ?auto_17308 ?auto_17296 ) ) ( not ( = ?auto_17282 ?auto_17288 ) ) ( not ( = ?auto_17282 ?auto_17290 ) ) ( not ( = ?auto_17283 ?auto_17288 ) ) ( not ( = ?auto_17283 ?auto_17290 ) ) ( not ( = ?auto_17284 ?auto_17288 ) ) ( not ( = ?auto_17284 ?auto_17290 ) ) ( not ( = ?auto_17285 ?auto_17288 ) ) ( not ( = ?auto_17285 ?auto_17290 ) ) ( not ( = ?auto_17286 ?auto_17288 ) ) ( not ( = ?auto_17286 ?auto_17290 ) ) ( not ( = ?auto_17287 ?auto_17288 ) ) ( not ( = ?auto_17287 ?auto_17290 ) ) ( not ( = ?auto_17288 ?auto_17308 ) ) ( not ( = ?auto_17288 ?auto_17305 ) ) ( not ( = ?auto_17288 ?auto_17299 ) ) ( not ( = ?auto_17288 ?auto_17298 ) ) ( not ( = ?auto_17288 ?auto_17311 ) ) ( not ( = ?auto_17288 ?auto_17296 ) ) ( not ( = ?auto_17292 ?auto_17301 ) ) ( not ( = ?auto_17292 ?auto_17302 ) ) ( not ( = ?auto_17292 ?auto_17304 ) ) ( not ( = ?auto_17292 ?auto_17297 ) ) ( not ( = ?auto_17292 ?auto_17306 ) ) ( not ( = ?auto_17293 ?auto_17309 ) ) ( not ( = ?auto_17293 ?auto_17310 ) ) ( not ( = ?auto_17293 ?auto_17303 ) ) ( not ( = ?auto_17293 ?auto_17300 ) ) ( not ( = ?auto_17293 ?auto_17307 ) ) ( not ( = ?auto_17290 ?auto_17308 ) ) ( not ( = ?auto_17290 ?auto_17305 ) ) ( not ( = ?auto_17290 ?auto_17299 ) ) ( not ( = ?auto_17290 ?auto_17298 ) ) ( not ( = ?auto_17290 ?auto_17311 ) ) ( not ( = ?auto_17290 ?auto_17296 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_17282 ?auto_17283 ?auto_17284 ?auto_17285 ?auto_17286 ?auto_17287 ?auto_17289 )
      ( MAKE-1CRATE ?auto_17289 ?auto_17288 )
      ( MAKE-7CRATE-VERIFY ?auto_17282 ?auto_17283 ?auto_17284 ?auto_17285 ?auto_17286 ?auto_17287 ?auto_17289 ?auto_17288 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17314 - SURFACE
      ?auto_17315 - SURFACE
    )
    :vars
    (
      ?auto_17316 - HOIST
      ?auto_17317 - PLACE
      ?auto_17319 - PLACE
      ?auto_17320 - HOIST
      ?auto_17321 - SURFACE
      ?auto_17318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17316 ?auto_17317 ) ( SURFACE-AT ?auto_17314 ?auto_17317 ) ( CLEAR ?auto_17314 ) ( IS-CRATE ?auto_17315 ) ( AVAILABLE ?auto_17316 ) ( not ( = ?auto_17319 ?auto_17317 ) ) ( HOIST-AT ?auto_17320 ?auto_17319 ) ( AVAILABLE ?auto_17320 ) ( SURFACE-AT ?auto_17315 ?auto_17319 ) ( ON ?auto_17315 ?auto_17321 ) ( CLEAR ?auto_17315 ) ( TRUCK-AT ?auto_17318 ?auto_17317 ) ( not ( = ?auto_17314 ?auto_17315 ) ) ( not ( = ?auto_17314 ?auto_17321 ) ) ( not ( = ?auto_17315 ?auto_17321 ) ) ( not ( = ?auto_17316 ?auto_17320 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17318 ?auto_17317 ?auto_17319 )
      ( !LIFT ?auto_17320 ?auto_17315 ?auto_17321 ?auto_17319 )
      ( !LOAD ?auto_17320 ?auto_17315 ?auto_17318 ?auto_17319 )
      ( !DRIVE ?auto_17318 ?auto_17319 ?auto_17317 )
      ( !UNLOAD ?auto_17316 ?auto_17315 ?auto_17318 ?auto_17317 )
      ( !DROP ?auto_17316 ?auto_17315 ?auto_17314 ?auto_17317 )
      ( MAKE-1CRATE-VERIFY ?auto_17314 ?auto_17315 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_17331 - SURFACE
      ?auto_17332 - SURFACE
      ?auto_17333 - SURFACE
      ?auto_17334 - SURFACE
      ?auto_17335 - SURFACE
      ?auto_17336 - SURFACE
      ?auto_17339 - SURFACE
      ?auto_17338 - SURFACE
      ?auto_17337 - SURFACE
    )
    :vars
    (
      ?auto_17340 - HOIST
      ?auto_17344 - PLACE
      ?auto_17343 - PLACE
      ?auto_17341 - HOIST
      ?auto_17345 - SURFACE
      ?auto_17364 - PLACE
      ?auto_17347 - HOIST
      ?auto_17346 - SURFACE
      ?auto_17362 - PLACE
      ?auto_17359 - HOIST
      ?auto_17358 - SURFACE
      ?auto_17361 - PLACE
      ?auto_17351 - HOIST
      ?auto_17355 - SURFACE
      ?auto_17353 - PLACE
      ?auto_17360 - HOIST
      ?auto_17348 - SURFACE
      ?auto_17349 - PLACE
      ?auto_17363 - HOIST
      ?auto_17350 - SURFACE
      ?auto_17357 - PLACE
      ?auto_17356 - HOIST
      ?auto_17354 - SURFACE
      ?auto_17352 - SURFACE
      ?auto_17342 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17340 ?auto_17344 ) ( IS-CRATE ?auto_17337 ) ( not ( = ?auto_17343 ?auto_17344 ) ) ( HOIST-AT ?auto_17341 ?auto_17343 ) ( AVAILABLE ?auto_17341 ) ( SURFACE-AT ?auto_17337 ?auto_17343 ) ( ON ?auto_17337 ?auto_17345 ) ( CLEAR ?auto_17337 ) ( not ( = ?auto_17338 ?auto_17337 ) ) ( not ( = ?auto_17338 ?auto_17345 ) ) ( not ( = ?auto_17337 ?auto_17345 ) ) ( not ( = ?auto_17340 ?auto_17341 ) ) ( IS-CRATE ?auto_17338 ) ( not ( = ?auto_17364 ?auto_17344 ) ) ( HOIST-AT ?auto_17347 ?auto_17364 ) ( AVAILABLE ?auto_17347 ) ( SURFACE-AT ?auto_17338 ?auto_17364 ) ( ON ?auto_17338 ?auto_17346 ) ( CLEAR ?auto_17338 ) ( not ( = ?auto_17339 ?auto_17338 ) ) ( not ( = ?auto_17339 ?auto_17346 ) ) ( not ( = ?auto_17338 ?auto_17346 ) ) ( not ( = ?auto_17340 ?auto_17347 ) ) ( IS-CRATE ?auto_17339 ) ( not ( = ?auto_17362 ?auto_17344 ) ) ( HOIST-AT ?auto_17359 ?auto_17362 ) ( AVAILABLE ?auto_17359 ) ( SURFACE-AT ?auto_17339 ?auto_17362 ) ( ON ?auto_17339 ?auto_17358 ) ( CLEAR ?auto_17339 ) ( not ( = ?auto_17336 ?auto_17339 ) ) ( not ( = ?auto_17336 ?auto_17358 ) ) ( not ( = ?auto_17339 ?auto_17358 ) ) ( not ( = ?auto_17340 ?auto_17359 ) ) ( IS-CRATE ?auto_17336 ) ( not ( = ?auto_17361 ?auto_17344 ) ) ( HOIST-AT ?auto_17351 ?auto_17361 ) ( AVAILABLE ?auto_17351 ) ( SURFACE-AT ?auto_17336 ?auto_17361 ) ( ON ?auto_17336 ?auto_17355 ) ( CLEAR ?auto_17336 ) ( not ( = ?auto_17335 ?auto_17336 ) ) ( not ( = ?auto_17335 ?auto_17355 ) ) ( not ( = ?auto_17336 ?auto_17355 ) ) ( not ( = ?auto_17340 ?auto_17351 ) ) ( IS-CRATE ?auto_17335 ) ( not ( = ?auto_17353 ?auto_17344 ) ) ( HOIST-AT ?auto_17360 ?auto_17353 ) ( AVAILABLE ?auto_17360 ) ( SURFACE-AT ?auto_17335 ?auto_17353 ) ( ON ?auto_17335 ?auto_17348 ) ( CLEAR ?auto_17335 ) ( not ( = ?auto_17334 ?auto_17335 ) ) ( not ( = ?auto_17334 ?auto_17348 ) ) ( not ( = ?auto_17335 ?auto_17348 ) ) ( not ( = ?auto_17340 ?auto_17360 ) ) ( IS-CRATE ?auto_17334 ) ( not ( = ?auto_17349 ?auto_17344 ) ) ( HOIST-AT ?auto_17363 ?auto_17349 ) ( SURFACE-AT ?auto_17334 ?auto_17349 ) ( ON ?auto_17334 ?auto_17350 ) ( CLEAR ?auto_17334 ) ( not ( = ?auto_17333 ?auto_17334 ) ) ( not ( = ?auto_17333 ?auto_17350 ) ) ( not ( = ?auto_17334 ?auto_17350 ) ) ( not ( = ?auto_17340 ?auto_17363 ) ) ( IS-CRATE ?auto_17333 ) ( not ( = ?auto_17357 ?auto_17344 ) ) ( HOIST-AT ?auto_17356 ?auto_17357 ) ( AVAILABLE ?auto_17356 ) ( SURFACE-AT ?auto_17333 ?auto_17357 ) ( ON ?auto_17333 ?auto_17354 ) ( CLEAR ?auto_17333 ) ( not ( = ?auto_17332 ?auto_17333 ) ) ( not ( = ?auto_17332 ?auto_17354 ) ) ( not ( = ?auto_17333 ?auto_17354 ) ) ( not ( = ?auto_17340 ?auto_17356 ) ) ( SURFACE-AT ?auto_17331 ?auto_17344 ) ( CLEAR ?auto_17331 ) ( IS-CRATE ?auto_17332 ) ( AVAILABLE ?auto_17340 ) ( AVAILABLE ?auto_17363 ) ( SURFACE-AT ?auto_17332 ?auto_17349 ) ( ON ?auto_17332 ?auto_17352 ) ( CLEAR ?auto_17332 ) ( TRUCK-AT ?auto_17342 ?auto_17344 ) ( not ( = ?auto_17331 ?auto_17332 ) ) ( not ( = ?auto_17331 ?auto_17352 ) ) ( not ( = ?auto_17332 ?auto_17352 ) ) ( not ( = ?auto_17331 ?auto_17333 ) ) ( not ( = ?auto_17331 ?auto_17354 ) ) ( not ( = ?auto_17333 ?auto_17352 ) ) ( not ( = ?auto_17357 ?auto_17349 ) ) ( not ( = ?auto_17356 ?auto_17363 ) ) ( not ( = ?auto_17354 ?auto_17352 ) ) ( not ( = ?auto_17331 ?auto_17334 ) ) ( not ( = ?auto_17331 ?auto_17350 ) ) ( not ( = ?auto_17332 ?auto_17334 ) ) ( not ( = ?auto_17332 ?auto_17350 ) ) ( not ( = ?auto_17334 ?auto_17354 ) ) ( not ( = ?auto_17334 ?auto_17352 ) ) ( not ( = ?auto_17350 ?auto_17354 ) ) ( not ( = ?auto_17350 ?auto_17352 ) ) ( not ( = ?auto_17331 ?auto_17335 ) ) ( not ( = ?auto_17331 ?auto_17348 ) ) ( not ( = ?auto_17332 ?auto_17335 ) ) ( not ( = ?auto_17332 ?auto_17348 ) ) ( not ( = ?auto_17333 ?auto_17335 ) ) ( not ( = ?auto_17333 ?auto_17348 ) ) ( not ( = ?auto_17335 ?auto_17350 ) ) ( not ( = ?auto_17335 ?auto_17354 ) ) ( not ( = ?auto_17335 ?auto_17352 ) ) ( not ( = ?auto_17353 ?auto_17349 ) ) ( not ( = ?auto_17353 ?auto_17357 ) ) ( not ( = ?auto_17360 ?auto_17363 ) ) ( not ( = ?auto_17360 ?auto_17356 ) ) ( not ( = ?auto_17348 ?auto_17350 ) ) ( not ( = ?auto_17348 ?auto_17354 ) ) ( not ( = ?auto_17348 ?auto_17352 ) ) ( not ( = ?auto_17331 ?auto_17336 ) ) ( not ( = ?auto_17331 ?auto_17355 ) ) ( not ( = ?auto_17332 ?auto_17336 ) ) ( not ( = ?auto_17332 ?auto_17355 ) ) ( not ( = ?auto_17333 ?auto_17336 ) ) ( not ( = ?auto_17333 ?auto_17355 ) ) ( not ( = ?auto_17334 ?auto_17336 ) ) ( not ( = ?auto_17334 ?auto_17355 ) ) ( not ( = ?auto_17336 ?auto_17348 ) ) ( not ( = ?auto_17336 ?auto_17350 ) ) ( not ( = ?auto_17336 ?auto_17354 ) ) ( not ( = ?auto_17336 ?auto_17352 ) ) ( not ( = ?auto_17361 ?auto_17353 ) ) ( not ( = ?auto_17361 ?auto_17349 ) ) ( not ( = ?auto_17361 ?auto_17357 ) ) ( not ( = ?auto_17351 ?auto_17360 ) ) ( not ( = ?auto_17351 ?auto_17363 ) ) ( not ( = ?auto_17351 ?auto_17356 ) ) ( not ( = ?auto_17355 ?auto_17348 ) ) ( not ( = ?auto_17355 ?auto_17350 ) ) ( not ( = ?auto_17355 ?auto_17354 ) ) ( not ( = ?auto_17355 ?auto_17352 ) ) ( not ( = ?auto_17331 ?auto_17339 ) ) ( not ( = ?auto_17331 ?auto_17358 ) ) ( not ( = ?auto_17332 ?auto_17339 ) ) ( not ( = ?auto_17332 ?auto_17358 ) ) ( not ( = ?auto_17333 ?auto_17339 ) ) ( not ( = ?auto_17333 ?auto_17358 ) ) ( not ( = ?auto_17334 ?auto_17339 ) ) ( not ( = ?auto_17334 ?auto_17358 ) ) ( not ( = ?auto_17335 ?auto_17339 ) ) ( not ( = ?auto_17335 ?auto_17358 ) ) ( not ( = ?auto_17339 ?auto_17355 ) ) ( not ( = ?auto_17339 ?auto_17348 ) ) ( not ( = ?auto_17339 ?auto_17350 ) ) ( not ( = ?auto_17339 ?auto_17354 ) ) ( not ( = ?auto_17339 ?auto_17352 ) ) ( not ( = ?auto_17362 ?auto_17361 ) ) ( not ( = ?auto_17362 ?auto_17353 ) ) ( not ( = ?auto_17362 ?auto_17349 ) ) ( not ( = ?auto_17362 ?auto_17357 ) ) ( not ( = ?auto_17359 ?auto_17351 ) ) ( not ( = ?auto_17359 ?auto_17360 ) ) ( not ( = ?auto_17359 ?auto_17363 ) ) ( not ( = ?auto_17359 ?auto_17356 ) ) ( not ( = ?auto_17358 ?auto_17355 ) ) ( not ( = ?auto_17358 ?auto_17348 ) ) ( not ( = ?auto_17358 ?auto_17350 ) ) ( not ( = ?auto_17358 ?auto_17354 ) ) ( not ( = ?auto_17358 ?auto_17352 ) ) ( not ( = ?auto_17331 ?auto_17338 ) ) ( not ( = ?auto_17331 ?auto_17346 ) ) ( not ( = ?auto_17332 ?auto_17338 ) ) ( not ( = ?auto_17332 ?auto_17346 ) ) ( not ( = ?auto_17333 ?auto_17338 ) ) ( not ( = ?auto_17333 ?auto_17346 ) ) ( not ( = ?auto_17334 ?auto_17338 ) ) ( not ( = ?auto_17334 ?auto_17346 ) ) ( not ( = ?auto_17335 ?auto_17338 ) ) ( not ( = ?auto_17335 ?auto_17346 ) ) ( not ( = ?auto_17336 ?auto_17338 ) ) ( not ( = ?auto_17336 ?auto_17346 ) ) ( not ( = ?auto_17338 ?auto_17358 ) ) ( not ( = ?auto_17338 ?auto_17355 ) ) ( not ( = ?auto_17338 ?auto_17348 ) ) ( not ( = ?auto_17338 ?auto_17350 ) ) ( not ( = ?auto_17338 ?auto_17354 ) ) ( not ( = ?auto_17338 ?auto_17352 ) ) ( not ( = ?auto_17364 ?auto_17362 ) ) ( not ( = ?auto_17364 ?auto_17361 ) ) ( not ( = ?auto_17364 ?auto_17353 ) ) ( not ( = ?auto_17364 ?auto_17349 ) ) ( not ( = ?auto_17364 ?auto_17357 ) ) ( not ( = ?auto_17347 ?auto_17359 ) ) ( not ( = ?auto_17347 ?auto_17351 ) ) ( not ( = ?auto_17347 ?auto_17360 ) ) ( not ( = ?auto_17347 ?auto_17363 ) ) ( not ( = ?auto_17347 ?auto_17356 ) ) ( not ( = ?auto_17346 ?auto_17358 ) ) ( not ( = ?auto_17346 ?auto_17355 ) ) ( not ( = ?auto_17346 ?auto_17348 ) ) ( not ( = ?auto_17346 ?auto_17350 ) ) ( not ( = ?auto_17346 ?auto_17354 ) ) ( not ( = ?auto_17346 ?auto_17352 ) ) ( not ( = ?auto_17331 ?auto_17337 ) ) ( not ( = ?auto_17331 ?auto_17345 ) ) ( not ( = ?auto_17332 ?auto_17337 ) ) ( not ( = ?auto_17332 ?auto_17345 ) ) ( not ( = ?auto_17333 ?auto_17337 ) ) ( not ( = ?auto_17333 ?auto_17345 ) ) ( not ( = ?auto_17334 ?auto_17337 ) ) ( not ( = ?auto_17334 ?auto_17345 ) ) ( not ( = ?auto_17335 ?auto_17337 ) ) ( not ( = ?auto_17335 ?auto_17345 ) ) ( not ( = ?auto_17336 ?auto_17337 ) ) ( not ( = ?auto_17336 ?auto_17345 ) ) ( not ( = ?auto_17339 ?auto_17337 ) ) ( not ( = ?auto_17339 ?auto_17345 ) ) ( not ( = ?auto_17337 ?auto_17346 ) ) ( not ( = ?auto_17337 ?auto_17358 ) ) ( not ( = ?auto_17337 ?auto_17355 ) ) ( not ( = ?auto_17337 ?auto_17348 ) ) ( not ( = ?auto_17337 ?auto_17350 ) ) ( not ( = ?auto_17337 ?auto_17354 ) ) ( not ( = ?auto_17337 ?auto_17352 ) ) ( not ( = ?auto_17343 ?auto_17364 ) ) ( not ( = ?auto_17343 ?auto_17362 ) ) ( not ( = ?auto_17343 ?auto_17361 ) ) ( not ( = ?auto_17343 ?auto_17353 ) ) ( not ( = ?auto_17343 ?auto_17349 ) ) ( not ( = ?auto_17343 ?auto_17357 ) ) ( not ( = ?auto_17341 ?auto_17347 ) ) ( not ( = ?auto_17341 ?auto_17359 ) ) ( not ( = ?auto_17341 ?auto_17351 ) ) ( not ( = ?auto_17341 ?auto_17360 ) ) ( not ( = ?auto_17341 ?auto_17363 ) ) ( not ( = ?auto_17341 ?auto_17356 ) ) ( not ( = ?auto_17345 ?auto_17346 ) ) ( not ( = ?auto_17345 ?auto_17358 ) ) ( not ( = ?auto_17345 ?auto_17355 ) ) ( not ( = ?auto_17345 ?auto_17348 ) ) ( not ( = ?auto_17345 ?auto_17350 ) ) ( not ( = ?auto_17345 ?auto_17354 ) ) ( not ( = ?auto_17345 ?auto_17352 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_17331 ?auto_17332 ?auto_17333 ?auto_17334 ?auto_17335 ?auto_17336 ?auto_17339 ?auto_17338 )
      ( MAKE-1CRATE ?auto_17338 ?auto_17337 )
      ( MAKE-8CRATE-VERIFY ?auto_17331 ?auto_17332 ?auto_17333 ?auto_17334 ?auto_17335 ?auto_17336 ?auto_17339 ?auto_17338 ?auto_17337 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17367 - SURFACE
      ?auto_17368 - SURFACE
    )
    :vars
    (
      ?auto_17369 - HOIST
      ?auto_17370 - PLACE
      ?auto_17372 - PLACE
      ?auto_17373 - HOIST
      ?auto_17374 - SURFACE
      ?auto_17371 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17369 ?auto_17370 ) ( SURFACE-AT ?auto_17367 ?auto_17370 ) ( CLEAR ?auto_17367 ) ( IS-CRATE ?auto_17368 ) ( AVAILABLE ?auto_17369 ) ( not ( = ?auto_17372 ?auto_17370 ) ) ( HOIST-AT ?auto_17373 ?auto_17372 ) ( AVAILABLE ?auto_17373 ) ( SURFACE-AT ?auto_17368 ?auto_17372 ) ( ON ?auto_17368 ?auto_17374 ) ( CLEAR ?auto_17368 ) ( TRUCK-AT ?auto_17371 ?auto_17370 ) ( not ( = ?auto_17367 ?auto_17368 ) ) ( not ( = ?auto_17367 ?auto_17374 ) ) ( not ( = ?auto_17368 ?auto_17374 ) ) ( not ( = ?auto_17369 ?auto_17373 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17371 ?auto_17370 ?auto_17372 )
      ( !LIFT ?auto_17373 ?auto_17368 ?auto_17374 ?auto_17372 )
      ( !LOAD ?auto_17373 ?auto_17368 ?auto_17371 ?auto_17372 )
      ( !DRIVE ?auto_17371 ?auto_17372 ?auto_17370 )
      ( !UNLOAD ?auto_17369 ?auto_17368 ?auto_17371 ?auto_17370 )
      ( !DROP ?auto_17369 ?auto_17368 ?auto_17367 ?auto_17370 )
      ( MAKE-1CRATE-VERIFY ?auto_17367 ?auto_17368 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_17385 - SURFACE
      ?auto_17386 - SURFACE
      ?auto_17387 - SURFACE
      ?auto_17388 - SURFACE
      ?auto_17389 - SURFACE
      ?auto_17390 - SURFACE
      ?auto_17393 - SURFACE
      ?auto_17392 - SURFACE
      ?auto_17391 - SURFACE
      ?auto_17394 - SURFACE
    )
    :vars
    (
      ?auto_17395 - HOIST
      ?auto_17397 - PLACE
      ?auto_17399 - PLACE
      ?auto_17400 - HOIST
      ?auto_17398 - SURFACE
      ?auto_17418 - PLACE
      ?auto_17419 - HOIST
      ?auto_17422 - SURFACE
      ?auto_17404 - PLACE
      ?auto_17401 - HOIST
      ?auto_17402 - SURFACE
      ?auto_17403 - PLACE
      ?auto_17411 - HOIST
      ?auto_17410 - SURFACE
      ?auto_17405 - PLACE
      ?auto_17414 - HOIST
      ?auto_17408 - SURFACE
      ?auto_17412 - PLACE
      ?auto_17417 - HOIST
      ?auto_17420 - SURFACE
      ?auto_17416 - PLACE
      ?auto_17421 - HOIST
      ?auto_17415 - SURFACE
      ?auto_17409 - PLACE
      ?auto_17407 - HOIST
      ?auto_17406 - SURFACE
      ?auto_17413 - SURFACE
      ?auto_17396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17395 ?auto_17397 ) ( IS-CRATE ?auto_17394 ) ( not ( = ?auto_17399 ?auto_17397 ) ) ( HOIST-AT ?auto_17400 ?auto_17399 ) ( AVAILABLE ?auto_17400 ) ( SURFACE-AT ?auto_17394 ?auto_17399 ) ( ON ?auto_17394 ?auto_17398 ) ( CLEAR ?auto_17394 ) ( not ( = ?auto_17391 ?auto_17394 ) ) ( not ( = ?auto_17391 ?auto_17398 ) ) ( not ( = ?auto_17394 ?auto_17398 ) ) ( not ( = ?auto_17395 ?auto_17400 ) ) ( IS-CRATE ?auto_17391 ) ( not ( = ?auto_17418 ?auto_17397 ) ) ( HOIST-AT ?auto_17419 ?auto_17418 ) ( AVAILABLE ?auto_17419 ) ( SURFACE-AT ?auto_17391 ?auto_17418 ) ( ON ?auto_17391 ?auto_17422 ) ( CLEAR ?auto_17391 ) ( not ( = ?auto_17392 ?auto_17391 ) ) ( not ( = ?auto_17392 ?auto_17422 ) ) ( not ( = ?auto_17391 ?auto_17422 ) ) ( not ( = ?auto_17395 ?auto_17419 ) ) ( IS-CRATE ?auto_17392 ) ( not ( = ?auto_17404 ?auto_17397 ) ) ( HOIST-AT ?auto_17401 ?auto_17404 ) ( AVAILABLE ?auto_17401 ) ( SURFACE-AT ?auto_17392 ?auto_17404 ) ( ON ?auto_17392 ?auto_17402 ) ( CLEAR ?auto_17392 ) ( not ( = ?auto_17393 ?auto_17392 ) ) ( not ( = ?auto_17393 ?auto_17402 ) ) ( not ( = ?auto_17392 ?auto_17402 ) ) ( not ( = ?auto_17395 ?auto_17401 ) ) ( IS-CRATE ?auto_17393 ) ( not ( = ?auto_17403 ?auto_17397 ) ) ( HOIST-AT ?auto_17411 ?auto_17403 ) ( AVAILABLE ?auto_17411 ) ( SURFACE-AT ?auto_17393 ?auto_17403 ) ( ON ?auto_17393 ?auto_17410 ) ( CLEAR ?auto_17393 ) ( not ( = ?auto_17390 ?auto_17393 ) ) ( not ( = ?auto_17390 ?auto_17410 ) ) ( not ( = ?auto_17393 ?auto_17410 ) ) ( not ( = ?auto_17395 ?auto_17411 ) ) ( IS-CRATE ?auto_17390 ) ( not ( = ?auto_17405 ?auto_17397 ) ) ( HOIST-AT ?auto_17414 ?auto_17405 ) ( AVAILABLE ?auto_17414 ) ( SURFACE-AT ?auto_17390 ?auto_17405 ) ( ON ?auto_17390 ?auto_17408 ) ( CLEAR ?auto_17390 ) ( not ( = ?auto_17389 ?auto_17390 ) ) ( not ( = ?auto_17389 ?auto_17408 ) ) ( not ( = ?auto_17390 ?auto_17408 ) ) ( not ( = ?auto_17395 ?auto_17414 ) ) ( IS-CRATE ?auto_17389 ) ( not ( = ?auto_17412 ?auto_17397 ) ) ( HOIST-AT ?auto_17417 ?auto_17412 ) ( AVAILABLE ?auto_17417 ) ( SURFACE-AT ?auto_17389 ?auto_17412 ) ( ON ?auto_17389 ?auto_17420 ) ( CLEAR ?auto_17389 ) ( not ( = ?auto_17388 ?auto_17389 ) ) ( not ( = ?auto_17388 ?auto_17420 ) ) ( not ( = ?auto_17389 ?auto_17420 ) ) ( not ( = ?auto_17395 ?auto_17417 ) ) ( IS-CRATE ?auto_17388 ) ( not ( = ?auto_17416 ?auto_17397 ) ) ( HOIST-AT ?auto_17421 ?auto_17416 ) ( SURFACE-AT ?auto_17388 ?auto_17416 ) ( ON ?auto_17388 ?auto_17415 ) ( CLEAR ?auto_17388 ) ( not ( = ?auto_17387 ?auto_17388 ) ) ( not ( = ?auto_17387 ?auto_17415 ) ) ( not ( = ?auto_17388 ?auto_17415 ) ) ( not ( = ?auto_17395 ?auto_17421 ) ) ( IS-CRATE ?auto_17387 ) ( not ( = ?auto_17409 ?auto_17397 ) ) ( HOIST-AT ?auto_17407 ?auto_17409 ) ( AVAILABLE ?auto_17407 ) ( SURFACE-AT ?auto_17387 ?auto_17409 ) ( ON ?auto_17387 ?auto_17406 ) ( CLEAR ?auto_17387 ) ( not ( = ?auto_17386 ?auto_17387 ) ) ( not ( = ?auto_17386 ?auto_17406 ) ) ( not ( = ?auto_17387 ?auto_17406 ) ) ( not ( = ?auto_17395 ?auto_17407 ) ) ( SURFACE-AT ?auto_17385 ?auto_17397 ) ( CLEAR ?auto_17385 ) ( IS-CRATE ?auto_17386 ) ( AVAILABLE ?auto_17395 ) ( AVAILABLE ?auto_17421 ) ( SURFACE-AT ?auto_17386 ?auto_17416 ) ( ON ?auto_17386 ?auto_17413 ) ( CLEAR ?auto_17386 ) ( TRUCK-AT ?auto_17396 ?auto_17397 ) ( not ( = ?auto_17385 ?auto_17386 ) ) ( not ( = ?auto_17385 ?auto_17413 ) ) ( not ( = ?auto_17386 ?auto_17413 ) ) ( not ( = ?auto_17385 ?auto_17387 ) ) ( not ( = ?auto_17385 ?auto_17406 ) ) ( not ( = ?auto_17387 ?auto_17413 ) ) ( not ( = ?auto_17409 ?auto_17416 ) ) ( not ( = ?auto_17407 ?auto_17421 ) ) ( not ( = ?auto_17406 ?auto_17413 ) ) ( not ( = ?auto_17385 ?auto_17388 ) ) ( not ( = ?auto_17385 ?auto_17415 ) ) ( not ( = ?auto_17386 ?auto_17388 ) ) ( not ( = ?auto_17386 ?auto_17415 ) ) ( not ( = ?auto_17388 ?auto_17406 ) ) ( not ( = ?auto_17388 ?auto_17413 ) ) ( not ( = ?auto_17415 ?auto_17406 ) ) ( not ( = ?auto_17415 ?auto_17413 ) ) ( not ( = ?auto_17385 ?auto_17389 ) ) ( not ( = ?auto_17385 ?auto_17420 ) ) ( not ( = ?auto_17386 ?auto_17389 ) ) ( not ( = ?auto_17386 ?auto_17420 ) ) ( not ( = ?auto_17387 ?auto_17389 ) ) ( not ( = ?auto_17387 ?auto_17420 ) ) ( not ( = ?auto_17389 ?auto_17415 ) ) ( not ( = ?auto_17389 ?auto_17406 ) ) ( not ( = ?auto_17389 ?auto_17413 ) ) ( not ( = ?auto_17412 ?auto_17416 ) ) ( not ( = ?auto_17412 ?auto_17409 ) ) ( not ( = ?auto_17417 ?auto_17421 ) ) ( not ( = ?auto_17417 ?auto_17407 ) ) ( not ( = ?auto_17420 ?auto_17415 ) ) ( not ( = ?auto_17420 ?auto_17406 ) ) ( not ( = ?auto_17420 ?auto_17413 ) ) ( not ( = ?auto_17385 ?auto_17390 ) ) ( not ( = ?auto_17385 ?auto_17408 ) ) ( not ( = ?auto_17386 ?auto_17390 ) ) ( not ( = ?auto_17386 ?auto_17408 ) ) ( not ( = ?auto_17387 ?auto_17390 ) ) ( not ( = ?auto_17387 ?auto_17408 ) ) ( not ( = ?auto_17388 ?auto_17390 ) ) ( not ( = ?auto_17388 ?auto_17408 ) ) ( not ( = ?auto_17390 ?auto_17420 ) ) ( not ( = ?auto_17390 ?auto_17415 ) ) ( not ( = ?auto_17390 ?auto_17406 ) ) ( not ( = ?auto_17390 ?auto_17413 ) ) ( not ( = ?auto_17405 ?auto_17412 ) ) ( not ( = ?auto_17405 ?auto_17416 ) ) ( not ( = ?auto_17405 ?auto_17409 ) ) ( not ( = ?auto_17414 ?auto_17417 ) ) ( not ( = ?auto_17414 ?auto_17421 ) ) ( not ( = ?auto_17414 ?auto_17407 ) ) ( not ( = ?auto_17408 ?auto_17420 ) ) ( not ( = ?auto_17408 ?auto_17415 ) ) ( not ( = ?auto_17408 ?auto_17406 ) ) ( not ( = ?auto_17408 ?auto_17413 ) ) ( not ( = ?auto_17385 ?auto_17393 ) ) ( not ( = ?auto_17385 ?auto_17410 ) ) ( not ( = ?auto_17386 ?auto_17393 ) ) ( not ( = ?auto_17386 ?auto_17410 ) ) ( not ( = ?auto_17387 ?auto_17393 ) ) ( not ( = ?auto_17387 ?auto_17410 ) ) ( not ( = ?auto_17388 ?auto_17393 ) ) ( not ( = ?auto_17388 ?auto_17410 ) ) ( not ( = ?auto_17389 ?auto_17393 ) ) ( not ( = ?auto_17389 ?auto_17410 ) ) ( not ( = ?auto_17393 ?auto_17408 ) ) ( not ( = ?auto_17393 ?auto_17420 ) ) ( not ( = ?auto_17393 ?auto_17415 ) ) ( not ( = ?auto_17393 ?auto_17406 ) ) ( not ( = ?auto_17393 ?auto_17413 ) ) ( not ( = ?auto_17403 ?auto_17405 ) ) ( not ( = ?auto_17403 ?auto_17412 ) ) ( not ( = ?auto_17403 ?auto_17416 ) ) ( not ( = ?auto_17403 ?auto_17409 ) ) ( not ( = ?auto_17411 ?auto_17414 ) ) ( not ( = ?auto_17411 ?auto_17417 ) ) ( not ( = ?auto_17411 ?auto_17421 ) ) ( not ( = ?auto_17411 ?auto_17407 ) ) ( not ( = ?auto_17410 ?auto_17408 ) ) ( not ( = ?auto_17410 ?auto_17420 ) ) ( not ( = ?auto_17410 ?auto_17415 ) ) ( not ( = ?auto_17410 ?auto_17406 ) ) ( not ( = ?auto_17410 ?auto_17413 ) ) ( not ( = ?auto_17385 ?auto_17392 ) ) ( not ( = ?auto_17385 ?auto_17402 ) ) ( not ( = ?auto_17386 ?auto_17392 ) ) ( not ( = ?auto_17386 ?auto_17402 ) ) ( not ( = ?auto_17387 ?auto_17392 ) ) ( not ( = ?auto_17387 ?auto_17402 ) ) ( not ( = ?auto_17388 ?auto_17392 ) ) ( not ( = ?auto_17388 ?auto_17402 ) ) ( not ( = ?auto_17389 ?auto_17392 ) ) ( not ( = ?auto_17389 ?auto_17402 ) ) ( not ( = ?auto_17390 ?auto_17392 ) ) ( not ( = ?auto_17390 ?auto_17402 ) ) ( not ( = ?auto_17392 ?auto_17410 ) ) ( not ( = ?auto_17392 ?auto_17408 ) ) ( not ( = ?auto_17392 ?auto_17420 ) ) ( not ( = ?auto_17392 ?auto_17415 ) ) ( not ( = ?auto_17392 ?auto_17406 ) ) ( not ( = ?auto_17392 ?auto_17413 ) ) ( not ( = ?auto_17404 ?auto_17403 ) ) ( not ( = ?auto_17404 ?auto_17405 ) ) ( not ( = ?auto_17404 ?auto_17412 ) ) ( not ( = ?auto_17404 ?auto_17416 ) ) ( not ( = ?auto_17404 ?auto_17409 ) ) ( not ( = ?auto_17401 ?auto_17411 ) ) ( not ( = ?auto_17401 ?auto_17414 ) ) ( not ( = ?auto_17401 ?auto_17417 ) ) ( not ( = ?auto_17401 ?auto_17421 ) ) ( not ( = ?auto_17401 ?auto_17407 ) ) ( not ( = ?auto_17402 ?auto_17410 ) ) ( not ( = ?auto_17402 ?auto_17408 ) ) ( not ( = ?auto_17402 ?auto_17420 ) ) ( not ( = ?auto_17402 ?auto_17415 ) ) ( not ( = ?auto_17402 ?auto_17406 ) ) ( not ( = ?auto_17402 ?auto_17413 ) ) ( not ( = ?auto_17385 ?auto_17391 ) ) ( not ( = ?auto_17385 ?auto_17422 ) ) ( not ( = ?auto_17386 ?auto_17391 ) ) ( not ( = ?auto_17386 ?auto_17422 ) ) ( not ( = ?auto_17387 ?auto_17391 ) ) ( not ( = ?auto_17387 ?auto_17422 ) ) ( not ( = ?auto_17388 ?auto_17391 ) ) ( not ( = ?auto_17388 ?auto_17422 ) ) ( not ( = ?auto_17389 ?auto_17391 ) ) ( not ( = ?auto_17389 ?auto_17422 ) ) ( not ( = ?auto_17390 ?auto_17391 ) ) ( not ( = ?auto_17390 ?auto_17422 ) ) ( not ( = ?auto_17393 ?auto_17391 ) ) ( not ( = ?auto_17393 ?auto_17422 ) ) ( not ( = ?auto_17391 ?auto_17402 ) ) ( not ( = ?auto_17391 ?auto_17410 ) ) ( not ( = ?auto_17391 ?auto_17408 ) ) ( not ( = ?auto_17391 ?auto_17420 ) ) ( not ( = ?auto_17391 ?auto_17415 ) ) ( not ( = ?auto_17391 ?auto_17406 ) ) ( not ( = ?auto_17391 ?auto_17413 ) ) ( not ( = ?auto_17418 ?auto_17404 ) ) ( not ( = ?auto_17418 ?auto_17403 ) ) ( not ( = ?auto_17418 ?auto_17405 ) ) ( not ( = ?auto_17418 ?auto_17412 ) ) ( not ( = ?auto_17418 ?auto_17416 ) ) ( not ( = ?auto_17418 ?auto_17409 ) ) ( not ( = ?auto_17419 ?auto_17401 ) ) ( not ( = ?auto_17419 ?auto_17411 ) ) ( not ( = ?auto_17419 ?auto_17414 ) ) ( not ( = ?auto_17419 ?auto_17417 ) ) ( not ( = ?auto_17419 ?auto_17421 ) ) ( not ( = ?auto_17419 ?auto_17407 ) ) ( not ( = ?auto_17422 ?auto_17402 ) ) ( not ( = ?auto_17422 ?auto_17410 ) ) ( not ( = ?auto_17422 ?auto_17408 ) ) ( not ( = ?auto_17422 ?auto_17420 ) ) ( not ( = ?auto_17422 ?auto_17415 ) ) ( not ( = ?auto_17422 ?auto_17406 ) ) ( not ( = ?auto_17422 ?auto_17413 ) ) ( not ( = ?auto_17385 ?auto_17394 ) ) ( not ( = ?auto_17385 ?auto_17398 ) ) ( not ( = ?auto_17386 ?auto_17394 ) ) ( not ( = ?auto_17386 ?auto_17398 ) ) ( not ( = ?auto_17387 ?auto_17394 ) ) ( not ( = ?auto_17387 ?auto_17398 ) ) ( not ( = ?auto_17388 ?auto_17394 ) ) ( not ( = ?auto_17388 ?auto_17398 ) ) ( not ( = ?auto_17389 ?auto_17394 ) ) ( not ( = ?auto_17389 ?auto_17398 ) ) ( not ( = ?auto_17390 ?auto_17394 ) ) ( not ( = ?auto_17390 ?auto_17398 ) ) ( not ( = ?auto_17393 ?auto_17394 ) ) ( not ( = ?auto_17393 ?auto_17398 ) ) ( not ( = ?auto_17392 ?auto_17394 ) ) ( not ( = ?auto_17392 ?auto_17398 ) ) ( not ( = ?auto_17394 ?auto_17422 ) ) ( not ( = ?auto_17394 ?auto_17402 ) ) ( not ( = ?auto_17394 ?auto_17410 ) ) ( not ( = ?auto_17394 ?auto_17408 ) ) ( not ( = ?auto_17394 ?auto_17420 ) ) ( not ( = ?auto_17394 ?auto_17415 ) ) ( not ( = ?auto_17394 ?auto_17406 ) ) ( not ( = ?auto_17394 ?auto_17413 ) ) ( not ( = ?auto_17399 ?auto_17418 ) ) ( not ( = ?auto_17399 ?auto_17404 ) ) ( not ( = ?auto_17399 ?auto_17403 ) ) ( not ( = ?auto_17399 ?auto_17405 ) ) ( not ( = ?auto_17399 ?auto_17412 ) ) ( not ( = ?auto_17399 ?auto_17416 ) ) ( not ( = ?auto_17399 ?auto_17409 ) ) ( not ( = ?auto_17400 ?auto_17419 ) ) ( not ( = ?auto_17400 ?auto_17401 ) ) ( not ( = ?auto_17400 ?auto_17411 ) ) ( not ( = ?auto_17400 ?auto_17414 ) ) ( not ( = ?auto_17400 ?auto_17417 ) ) ( not ( = ?auto_17400 ?auto_17421 ) ) ( not ( = ?auto_17400 ?auto_17407 ) ) ( not ( = ?auto_17398 ?auto_17422 ) ) ( not ( = ?auto_17398 ?auto_17402 ) ) ( not ( = ?auto_17398 ?auto_17410 ) ) ( not ( = ?auto_17398 ?auto_17408 ) ) ( not ( = ?auto_17398 ?auto_17420 ) ) ( not ( = ?auto_17398 ?auto_17415 ) ) ( not ( = ?auto_17398 ?auto_17406 ) ) ( not ( = ?auto_17398 ?auto_17413 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_17385 ?auto_17386 ?auto_17387 ?auto_17388 ?auto_17389 ?auto_17390 ?auto_17393 ?auto_17392 ?auto_17391 )
      ( MAKE-1CRATE ?auto_17391 ?auto_17394 )
      ( MAKE-9CRATE-VERIFY ?auto_17385 ?auto_17386 ?auto_17387 ?auto_17388 ?auto_17389 ?auto_17390 ?auto_17393 ?auto_17392 ?auto_17391 ?auto_17394 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17425 - SURFACE
      ?auto_17426 - SURFACE
    )
    :vars
    (
      ?auto_17427 - HOIST
      ?auto_17428 - PLACE
      ?auto_17430 - PLACE
      ?auto_17431 - HOIST
      ?auto_17432 - SURFACE
      ?auto_17429 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17427 ?auto_17428 ) ( SURFACE-AT ?auto_17425 ?auto_17428 ) ( CLEAR ?auto_17425 ) ( IS-CRATE ?auto_17426 ) ( AVAILABLE ?auto_17427 ) ( not ( = ?auto_17430 ?auto_17428 ) ) ( HOIST-AT ?auto_17431 ?auto_17430 ) ( AVAILABLE ?auto_17431 ) ( SURFACE-AT ?auto_17426 ?auto_17430 ) ( ON ?auto_17426 ?auto_17432 ) ( CLEAR ?auto_17426 ) ( TRUCK-AT ?auto_17429 ?auto_17428 ) ( not ( = ?auto_17425 ?auto_17426 ) ) ( not ( = ?auto_17425 ?auto_17432 ) ) ( not ( = ?auto_17426 ?auto_17432 ) ) ( not ( = ?auto_17427 ?auto_17431 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17429 ?auto_17428 ?auto_17430 )
      ( !LIFT ?auto_17431 ?auto_17426 ?auto_17432 ?auto_17430 )
      ( !LOAD ?auto_17431 ?auto_17426 ?auto_17429 ?auto_17430 )
      ( !DRIVE ?auto_17429 ?auto_17430 ?auto_17428 )
      ( !UNLOAD ?auto_17427 ?auto_17426 ?auto_17429 ?auto_17428 )
      ( !DROP ?auto_17427 ?auto_17426 ?auto_17425 ?auto_17428 )
      ( MAKE-1CRATE-VERIFY ?auto_17425 ?auto_17426 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_17444 - SURFACE
      ?auto_17445 - SURFACE
      ?auto_17446 - SURFACE
      ?auto_17447 - SURFACE
      ?auto_17448 - SURFACE
      ?auto_17449 - SURFACE
      ?auto_17452 - SURFACE
      ?auto_17451 - SURFACE
      ?auto_17450 - SURFACE
      ?auto_17453 - SURFACE
      ?auto_17454 - SURFACE
    )
    :vars
    (
      ?auto_17457 - HOIST
      ?auto_17460 - PLACE
      ?auto_17455 - PLACE
      ?auto_17458 - HOIST
      ?auto_17456 - SURFACE
      ?auto_17469 - PLACE
      ?auto_17470 - HOIST
      ?auto_17471 - SURFACE
      ?auto_17473 - PLACE
      ?auto_17463 - HOIST
      ?auto_17475 - SURFACE
      ?auto_17472 - PLACE
      ?auto_17474 - HOIST
      ?auto_17464 - SURFACE
      ?auto_17467 - PLACE
      ?auto_17468 - HOIST
      ?auto_17477 - SURFACE
      ?auto_17481 - PLACE
      ?auto_17462 - HOIST
      ?auto_17482 - SURFACE
      ?auto_17478 - PLACE
      ?auto_17466 - HOIST
      ?auto_17484 - SURFACE
      ?auto_17480 - PLACE
      ?auto_17483 - HOIST
      ?auto_17465 - SURFACE
      ?auto_17476 - PLACE
      ?auto_17485 - HOIST
      ?auto_17461 - SURFACE
      ?auto_17479 - SURFACE
      ?auto_17459 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17457 ?auto_17460 ) ( IS-CRATE ?auto_17454 ) ( not ( = ?auto_17455 ?auto_17460 ) ) ( HOIST-AT ?auto_17458 ?auto_17455 ) ( AVAILABLE ?auto_17458 ) ( SURFACE-AT ?auto_17454 ?auto_17455 ) ( ON ?auto_17454 ?auto_17456 ) ( CLEAR ?auto_17454 ) ( not ( = ?auto_17453 ?auto_17454 ) ) ( not ( = ?auto_17453 ?auto_17456 ) ) ( not ( = ?auto_17454 ?auto_17456 ) ) ( not ( = ?auto_17457 ?auto_17458 ) ) ( IS-CRATE ?auto_17453 ) ( not ( = ?auto_17469 ?auto_17460 ) ) ( HOIST-AT ?auto_17470 ?auto_17469 ) ( AVAILABLE ?auto_17470 ) ( SURFACE-AT ?auto_17453 ?auto_17469 ) ( ON ?auto_17453 ?auto_17471 ) ( CLEAR ?auto_17453 ) ( not ( = ?auto_17450 ?auto_17453 ) ) ( not ( = ?auto_17450 ?auto_17471 ) ) ( not ( = ?auto_17453 ?auto_17471 ) ) ( not ( = ?auto_17457 ?auto_17470 ) ) ( IS-CRATE ?auto_17450 ) ( not ( = ?auto_17473 ?auto_17460 ) ) ( HOIST-AT ?auto_17463 ?auto_17473 ) ( AVAILABLE ?auto_17463 ) ( SURFACE-AT ?auto_17450 ?auto_17473 ) ( ON ?auto_17450 ?auto_17475 ) ( CLEAR ?auto_17450 ) ( not ( = ?auto_17451 ?auto_17450 ) ) ( not ( = ?auto_17451 ?auto_17475 ) ) ( not ( = ?auto_17450 ?auto_17475 ) ) ( not ( = ?auto_17457 ?auto_17463 ) ) ( IS-CRATE ?auto_17451 ) ( not ( = ?auto_17472 ?auto_17460 ) ) ( HOIST-AT ?auto_17474 ?auto_17472 ) ( AVAILABLE ?auto_17474 ) ( SURFACE-AT ?auto_17451 ?auto_17472 ) ( ON ?auto_17451 ?auto_17464 ) ( CLEAR ?auto_17451 ) ( not ( = ?auto_17452 ?auto_17451 ) ) ( not ( = ?auto_17452 ?auto_17464 ) ) ( not ( = ?auto_17451 ?auto_17464 ) ) ( not ( = ?auto_17457 ?auto_17474 ) ) ( IS-CRATE ?auto_17452 ) ( not ( = ?auto_17467 ?auto_17460 ) ) ( HOIST-AT ?auto_17468 ?auto_17467 ) ( AVAILABLE ?auto_17468 ) ( SURFACE-AT ?auto_17452 ?auto_17467 ) ( ON ?auto_17452 ?auto_17477 ) ( CLEAR ?auto_17452 ) ( not ( = ?auto_17449 ?auto_17452 ) ) ( not ( = ?auto_17449 ?auto_17477 ) ) ( not ( = ?auto_17452 ?auto_17477 ) ) ( not ( = ?auto_17457 ?auto_17468 ) ) ( IS-CRATE ?auto_17449 ) ( not ( = ?auto_17481 ?auto_17460 ) ) ( HOIST-AT ?auto_17462 ?auto_17481 ) ( AVAILABLE ?auto_17462 ) ( SURFACE-AT ?auto_17449 ?auto_17481 ) ( ON ?auto_17449 ?auto_17482 ) ( CLEAR ?auto_17449 ) ( not ( = ?auto_17448 ?auto_17449 ) ) ( not ( = ?auto_17448 ?auto_17482 ) ) ( not ( = ?auto_17449 ?auto_17482 ) ) ( not ( = ?auto_17457 ?auto_17462 ) ) ( IS-CRATE ?auto_17448 ) ( not ( = ?auto_17478 ?auto_17460 ) ) ( HOIST-AT ?auto_17466 ?auto_17478 ) ( AVAILABLE ?auto_17466 ) ( SURFACE-AT ?auto_17448 ?auto_17478 ) ( ON ?auto_17448 ?auto_17484 ) ( CLEAR ?auto_17448 ) ( not ( = ?auto_17447 ?auto_17448 ) ) ( not ( = ?auto_17447 ?auto_17484 ) ) ( not ( = ?auto_17448 ?auto_17484 ) ) ( not ( = ?auto_17457 ?auto_17466 ) ) ( IS-CRATE ?auto_17447 ) ( not ( = ?auto_17480 ?auto_17460 ) ) ( HOIST-AT ?auto_17483 ?auto_17480 ) ( SURFACE-AT ?auto_17447 ?auto_17480 ) ( ON ?auto_17447 ?auto_17465 ) ( CLEAR ?auto_17447 ) ( not ( = ?auto_17446 ?auto_17447 ) ) ( not ( = ?auto_17446 ?auto_17465 ) ) ( not ( = ?auto_17447 ?auto_17465 ) ) ( not ( = ?auto_17457 ?auto_17483 ) ) ( IS-CRATE ?auto_17446 ) ( not ( = ?auto_17476 ?auto_17460 ) ) ( HOIST-AT ?auto_17485 ?auto_17476 ) ( AVAILABLE ?auto_17485 ) ( SURFACE-AT ?auto_17446 ?auto_17476 ) ( ON ?auto_17446 ?auto_17461 ) ( CLEAR ?auto_17446 ) ( not ( = ?auto_17445 ?auto_17446 ) ) ( not ( = ?auto_17445 ?auto_17461 ) ) ( not ( = ?auto_17446 ?auto_17461 ) ) ( not ( = ?auto_17457 ?auto_17485 ) ) ( SURFACE-AT ?auto_17444 ?auto_17460 ) ( CLEAR ?auto_17444 ) ( IS-CRATE ?auto_17445 ) ( AVAILABLE ?auto_17457 ) ( AVAILABLE ?auto_17483 ) ( SURFACE-AT ?auto_17445 ?auto_17480 ) ( ON ?auto_17445 ?auto_17479 ) ( CLEAR ?auto_17445 ) ( TRUCK-AT ?auto_17459 ?auto_17460 ) ( not ( = ?auto_17444 ?auto_17445 ) ) ( not ( = ?auto_17444 ?auto_17479 ) ) ( not ( = ?auto_17445 ?auto_17479 ) ) ( not ( = ?auto_17444 ?auto_17446 ) ) ( not ( = ?auto_17444 ?auto_17461 ) ) ( not ( = ?auto_17446 ?auto_17479 ) ) ( not ( = ?auto_17476 ?auto_17480 ) ) ( not ( = ?auto_17485 ?auto_17483 ) ) ( not ( = ?auto_17461 ?auto_17479 ) ) ( not ( = ?auto_17444 ?auto_17447 ) ) ( not ( = ?auto_17444 ?auto_17465 ) ) ( not ( = ?auto_17445 ?auto_17447 ) ) ( not ( = ?auto_17445 ?auto_17465 ) ) ( not ( = ?auto_17447 ?auto_17461 ) ) ( not ( = ?auto_17447 ?auto_17479 ) ) ( not ( = ?auto_17465 ?auto_17461 ) ) ( not ( = ?auto_17465 ?auto_17479 ) ) ( not ( = ?auto_17444 ?auto_17448 ) ) ( not ( = ?auto_17444 ?auto_17484 ) ) ( not ( = ?auto_17445 ?auto_17448 ) ) ( not ( = ?auto_17445 ?auto_17484 ) ) ( not ( = ?auto_17446 ?auto_17448 ) ) ( not ( = ?auto_17446 ?auto_17484 ) ) ( not ( = ?auto_17448 ?auto_17465 ) ) ( not ( = ?auto_17448 ?auto_17461 ) ) ( not ( = ?auto_17448 ?auto_17479 ) ) ( not ( = ?auto_17478 ?auto_17480 ) ) ( not ( = ?auto_17478 ?auto_17476 ) ) ( not ( = ?auto_17466 ?auto_17483 ) ) ( not ( = ?auto_17466 ?auto_17485 ) ) ( not ( = ?auto_17484 ?auto_17465 ) ) ( not ( = ?auto_17484 ?auto_17461 ) ) ( not ( = ?auto_17484 ?auto_17479 ) ) ( not ( = ?auto_17444 ?auto_17449 ) ) ( not ( = ?auto_17444 ?auto_17482 ) ) ( not ( = ?auto_17445 ?auto_17449 ) ) ( not ( = ?auto_17445 ?auto_17482 ) ) ( not ( = ?auto_17446 ?auto_17449 ) ) ( not ( = ?auto_17446 ?auto_17482 ) ) ( not ( = ?auto_17447 ?auto_17449 ) ) ( not ( = ?auto_17447 ?auto_17482 ) ) ( not ( = ?auto_17449 ?auto_17484 ) ) ( not ( = ?auto_17449 ?auto_17465 ) ) ( not ( = ?auto_17449 ?auto_17461 ) ) ( not ( = ?auto_17449 ?auto_17479 ) ) ( not ( = ?auto_17481 ?auto_17478 ) ) ( not ( = ?auto_17481 ?auto_17480 ) ) ( not ( = ?auto_17481 ?auto_17476 ) ) ( not ( = ?auto_17462 ?auto_17466 ) ) ( not ( = ?auto_17462 ?auto_17483 ) ) ( not ( = ?auto_17462 ?auto_17485 ) ) ( not ( = ?auto_17482 ?auto_17484 ) ) ( not ( = ?auto_17482 ?auto_17465 ) ) ( not ( = ?auto_17482 ?auto_17461 ) ) ( not ( = ?auto_17482 ?auto_17479 ) ) ( not ( = ?auto_17444 ?auto_17452 ) ) ( not ( = ?auto_17444 ?auto_17477 ) ) ( not ( = ?auto_17445 ?auto_17452 ) ) ( not ( = ?auto_17445 ?auto_17477 ) ) ( not ( = ?auto_17446 ?auto_17452 ) ) ( not ( = ?auto_17446 ?auto_17477 ) ) ( not ( = ?auto_17447 ?auto_17452 ) ) ( not ( = ?auto_17447 ?auto_17477 ) ) ( not ( = ?auto_17448 ?auto_17452 ) ) ( not ( = ?auto_17448 ?auto_17477 ) ) ( not ( = ?auto_17452 ?auto_17482 ) ) ( not ( = ?auto_17452 ?auto_17484 ) ) ( not ( = ?auto_17452 ?auto_17465 ) ) ( not ( = ?auto_17452 ?auto_17461 ) ) ( not ( = ?auto_17452 ?auto_17479 ) ) ( not ( = ?auto_17467 ?auto_17481 ) ) ( not ( = ?auto_17467 ?auto_17478 ) ) ( not ( = ?auto_17467 ?auto_17480 ) ) ( not ( = ?auto_17467 ?auto_17476 ) ) ( not ( = ?auto_17468 ?auto_17462 ) ) ( not ( = ?auto_17468 ?auto_17466 ) ) ( not ( = ?auto_17468 ?auto_17483 ) ) ( not ( = ?auto_17468 ?auto_17485 ) ) ( not ( = ?auto_17477 ?auto_17482 ) ) ( not ( = ?auto_17477 ?auto_17484 ) ) ( not ( = ?auto_17477 ?auto_17465 ) ) ( not ( = ?auto_17477 ?auto_17461 ) ) ( not ( = ?auto_17477 ?auto_17479 ) ) ( not ( = ?auto_17444 ?auto_17451 ) ) ( not ( = ?auto_17444 ?auto_17464 ) ) ( not ( = ?auto_17445 ?auto_17451 ) ) ( not ( = ?auto_17445 ?auto_17464 ) ) ( not ( = ?auto_17446 ?auto_17451 ) ) ( not ( = ?auto_17446 ?auto_17464 ) ) ( not ( = ?auto_17447 ?auto_17451 ) ) ( not ( = ?auto_17447 ?auto_17464 ) ) ( not ( = ?auto_17448 ?auto_17451 ) ) ( not ( = ?auto_17448 ?auto_17464 ) ) ( not ( = ?auto_17449 ?auto_17451 ) ) ( not ( = ?auto_17449 ?auto_17464 ) ) ( not ( = ?auto_17451 ?auto_17477 ) ) ( not ( = ?auto_17451 ?auto_17482 ) ) ( not ( = ?auto_17451 ?auto_17484 ) ) ( not ( = ?auto_17451 ?auto_17465 ) ) ( not ( = ?auto_17451 ?auto_17461 ) ) ( not ( = ?auto_17451 ?auto_17479 ) ) ( not ( = ?auto_17472 ?auto_17467 ) ) ( not ( = ?auto_17472 ?auto_17481 ) ) ( not ( = ?auto_17472 ?auto_17478 ) ) ( not ( = ?auto_17472 ?auto_17480 ) ) ( not ( = ?auto_17472 ?auto_17476 ) ) ( not ( = ?auto_17474 ?auto_17468 ) ) ( not ( = ?auto_17474 ?auto_17462 ) ) ( not ( = ?auto_17474 ?auto_17466 ) ) ( not ( = ?auto_17474 ?auto_17483 ) ) ( not ( = ?auto_17474 ?auto_17485 ) ) ( not ( = ?auto_17464 ?auto_17477 ) ) ( not ( = ?auto_17464 ?auto_17482 ) ) ( not ( = ?auto_17464 ?auto_17484 ) ) ( not ( = ?auto_17464 ?auto_17465 ) ) ( not ( = ?auto_17464 ?auto_17461 ) ) ( not ( = ?auto_17464 ?auto_17479 ) ) ( not ( = ?auto_17444 ?auto_17450 ) ) ( not ( = ?auto_17444 ?auto_17475 ) ) ( not ( = ?auto_17445 ?auto_17450 ) ) ( not ( = ?auto_17445 ?auto_17475 ) ) ( not ( = ?auto_17446 ?auto_17450 ) ) ( not ( = ?auto_17446 ?auto_17475 ) ) ( not ( = ?auto_17447 ?auto_17450 ) ) ( not ( = ?auto_17447 ?auto_17475 ) ) ( not ( = ?auto_17448 ?auto_17450 ) ) ( not ( = ?auto_17448 ?auto_17475 ) ) ( not ( = ?auto_17449 ?auto_17450 ) ) ( not ( = ?auto_17449 ?auto_17475 ) ) ( not ( = ?auto_17452 ?auto_17450 ) ) ( not ( = ?auto_17452 ?auto_17475 ) ) ( not ( = ?auto_17450 ?auto_17464 ) ) ( not ( = ?auto_17450 ?auto_17477 ) ) ( not ( = ?auto_17450 ?auto_17482 ) ) ( not ( = ?auto_17450 ?auto_17484 ) ) ( not ( = ?auto_17450 ?auto_17465 ) ) ( not ( = ?auto_17450 ?auto_17461 ) ) ( not ( = ?auto_17450 ?auto_17479 ) ) ( not ( = ?auto_17473 ?auto_17472 ) ) ( not ( = ?auto_17473 ?auto_17467 ) ) ( not ( = ?auto_17473 ?auto_17481 ) ) ( not ( = ?auto_17473 ?auto_17478 ) ) ( not ( = ?auto_17473 ?auto_17480 ) ) ( not ( = ?auto_17473 ?auto_17476 ) ) ( not ( = ?auto_17463 ?auto_17474 ) ) ( not ( = ?auto_17463 ?auto_17468 ) ) ( not ( = ?auto_17463 ?auto_17462 ) ) ( not ( = ?auto_17463 ?auto_17466 ) ) ( not ( = ?auto_17463 ?auto_17483 ) ) ( not ( = ?auto_17463 ?auto_17485 ) ) ( not ( = ?auto_17475 ?auto_17464 ) ) ( not ( = ?auto_17475 ?auto_17477 ) ) ( not ( = ?auto_17475 ?auto_17482 ) ) ( not ( = ?auto_17475 ?auto_17484 ) ) ( not ( = ?auto_17475 ?auto_17465 ) ) ( not ( = ?auto_17475 ?auto_17461 ) ) ( not ( = ?auto_17475 ?auto_17479 ) ) ( not ( = ?auto_17444 ?auto_17453 ) ) ( not ( = ?auto_17444 ?auto_17471 ) ) ( not ( = ?auto_17445 ?auto_17453 ) ) ( not ( = ?auto_17445 ?auto_17471 ) ) ( not ( = ?auto_17446 ?auto_17453 ) ) ( not ( = ?auto_17446 ?auto_17471 ) ) ( not ( = ?auto_17447 ?auto_17453 ) ) ( not ( = ?auto_17447 ?auto_17471 ) ) ( not ( = ?auto_17448 ?auto_17453 ) ) ( not ( = ?auto_17448 ?auto_17471 ) ) ( not ( = ?auto_17449 ?auto_17453 ) ) ( not ( = ?auto_17449 ?auto_17471 ) ) ( not ( = ?auto_17452 ?auto_17453 ) ) ( not ( = ?auto_17452 ?auto_17471 ) ) ( not ( = ?auto_17451 ?auto_17453 ) ) ( not ( = ?auto_17451 ?auto_17471 ) ) ( not ( = ?auto_17453 ?auto_17475 ) ) ( not ( = ?auto_17453 ?auto_17464 ) ) ( not ( = ?auto_17453 ?auto_17477 ) ) ( not ( = ?auto_17453 ?auto_17482 ) ) ( not ( = ?auto_17453 ?auto_17484 ) ) ( not ( = ?auto_17453 ?auto_17465 ) ) ( not ( = ?auto_17453 ?auto_17461 ) ) ( not ( = ?auto_17453 ?auto_17479 ) ) ( not ( = ?auto_17469 ?auto_17473 ) ) ( not ( = ?auto_17469 ?auto_17472 ) ) ( not ( = ?auto_17469 ?auto_17467 ) ) ( not ( = ?auto_17469 ?auto_17481 ) ) ( not ( = ?auto_17469 ?auto_17478 ) ) ( not ( = ?auto_17469 ?auto_17480 ) ) ( not ( = ?auto_17469 ?auto_17476 ) ) ( not ( = ?auto_17470 ?auto_17463 ) ) ( not ( = ?auto_17470 ?auto_17474 ) ) ( not ( = ?auto_17470 ?auto_17468 ) ) ( not ( = ?auto_17470 ?auto_17462 ) ) ( not ( = ?auto_17470 ?auto_17466 ) ) ( not ( = ?auto_17470 ?auto_17483 ) ) ( not ( = ?auto_17470 ?auto_17485 ) ) ( not ( = ?auto_17471 ?auto_17475 ) ) ( not ( = ?auto_17471 ?auto_17464 ) ) ( not ( = ?auto_17471 ?auto_17477 ) ) ( not ( = ?auto_17471 ?auto_17482 ) ) ( not ( = ?auto_17471 ?auto_17484 ) ) ( not ( = ?auto_17471 ?auto_17465 ) ) ( not ( = ?auto_17471 ?auto_17461 ) ) ( not ( = ?auto_17471 ?auto_17479 ) ) ( not ( = ?auto_17444 ?auto_17454 ) ) ( not ( = ?auto_17444 ?auto_17456 ) ) ( not ( = ?auto_17445 ?auto_17454 ) ) ( not ( = ?auto_17445 ?auto_17456 ) ) ( not ( = ?auto_17446 ?auto_17454 ) ) ( not ( = ?auto_17446 ?auto_17456 ) ) ( not ( = ?auto_17447 ?auto_17454 ) ) ( not ( = ?auto_17447 ?auto_17456 ) ) ( not ( = ?auto_17448 ?auto_17454 ) ) ( not ( = ?auto_17448 ?auto_17456 ) ) ( not ( = ?auto_17449 ?auto_17454 ) ) ( not ( = ?auto_17449 ?auto_17456 ) ) ( not ( = ?auto_17452 ?auto_17454 ) ) ( not ( = ?auto_17452 ?auto_17456 ) ) ( not ( = ?auto_17451 ?auto_17454 ) ) ( not ( = ?auto_17451 ?auto_17456 ) ) ( not ( = ?auto_17450 ?auto_17454 ) ) ( not ( = ?auto_17450 ?auto_17456 ) ) ( not ( = ?auto_17454 ?auto_17471 ) ) ( not ( = ?auto_17454 ?auto_17475 ) ) ( not ( = ?auto_17454 ?auto_17464 ) ) ( not ( = ?auto_17454 ?auto_17477 ) ) ( not ( = ?auto_17454 ?auto_17482 ) ) ( not ( = ?auto_17454 ?auto_17484 ) ) ( not ( = ?auto_17454 ?auto_17465 ) ) ( not ( = ?auto_17454 ?auto_17461 ) ) ( not ( = ?auto_17454 ?auto_17479 ) ) ( not ( = ?auto_17455 ?auto_17469 ) ) ( not ( = ?auto_17455 ?auto_17473 ) ) ( not ( = ?auto_17455 ?auto_17472 ) ) ( not ( = ?auto_17455 ?auto_17467 ) ) ( not ( = ?auto_17455 ?auto_17481 ) ) ( not ( = ?auto_17455 ?auto_17478 ) ) ( not ( = ?auto_17455 ?auto_17480 ) ) ( not ( = ?auto_17455 ?auto_17476 ) ) ( not ( = ?auto_17458 ?auto_17470 ) ) ( not ( = ?auto_17458 ?auto_17463 ) ) ( not ( = ?auto_17458 ?auto_17474 ) ) ( not ( = ?auto_17458 ?auto_17468 ) ) ( not ( = ?auto_17458 ?auto_17462 ) ) ( not ( = ?auto_17458 ?auto_17466 ) ) ( not ( = ?auto_17458 ?auto_17483 ) ) ( not ( = ?auto_17458 ?auto_17485 ) ) ( not ( = ?auto_17456 ?auto_17471 ) ) ( not ( = ?auto_17456 ?auto_17475 ) ) ( not ( = ?auto_17456 ?auto_17464 ) ) ( not ( = ?auto_17456 ?auto_17477 ) ) ( not ( = ?auto_17456 ?auto_17482 ) ) ( not ( = ?auto_17456 ?auto_17484 ) ) ( not ( = ?auto_17456 ?auto_17465 ) ) ( not ( = ?auto_17456 ?auto_17461 ) ) ( not ( = ?auto_17456 ?auto_17479 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_17444 ?auto_17445 ?auto_17446 ?auto_17447 ?auto_17448 ?auto_17449 ?auto_17452 ?auto_17451 ?auto_17450 ?auto_17453 )
      ( MAKE-1CRATE ?auto_17453 ?auto_17454 )
      ( MAKE-10CRATE-VERIFY ?auto_17444 ?auto_17445 ?auto_17446 ?auto_17447 ?auto_17448 ?auto_17449 ?auto_17452 ?auto_17451 ?auto_17450 ?auto_17453 ?auto_17454 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17488 - SURFACE
      ?auto_17489 - SURFACE
    )
    :vars
    (
      ?auto_17490 - HOIST
      ?auto_17491 - PLACE
      ?auto_17493 - PLACE
      ?auto_17494 - HOIST
      ?auto_17495 - SURFACE
      ?auto_17492 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17490 ?auto_17491 ) ( SURFACE-AT ?auto_17488 ?auto_17491 ) ( CLEAR ?auto_17488 ) ( IS-CRATE ?auto_17489 ) ( AVAILABLE ?auto_17490 ) ( not ( = ?auto_17493 ?auto_17491 ) ) ( HOIST-AT ?auto_17494 ?auto_17493 ) ( AVAILABLE ?auto_17494 ) ( SURFACE-AT ?auto_17489 ?auto_17493 ) ( ON ?auto_17489 ?auto_17495 ) ( CLEAR ?auto_17489 ) ( TRUCK-AT ?auto_17492 ?auto_17491 ) ( not ( = ?auto_17488 ?auto_17489 ) ) ( not ( = ?auto_17488 ?auto_17495 ) ) ( not ( = ?auto_17489 ?auto_17495 ) ) ( not ( = ?auto_17490 ?auto_17494 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17492 ?auto_17491 ?auto_17493 )
      ( !LIFT ?auto_17494 ?auto_17489 ?auto_17495 ?auto_17493 )
      ( !LOAD ?auto_17494 ?auto_17489 ?auto_17492 ?auto_17493 )
      ( !DRIVE ?auto_17492 ?auto_17493 ?auto_17491 )
      ( !UNLOAD ?auto_17490 ?auto_17489 ?auto_17492 ?auto_17491 )
      ( !DROP ?auto_17490 ?auto_17489 ?auto_17488 ?auto_17491 )
      ( MAKE-1CRATE-VERIFY ?auto_17488 ?auto_17489 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_17508 - SURFACE
      ?auto_17509 - SURFACE
      ?auto_17510 - SURFACE
      ?auto_17511 - SURFACE
      ?auto_17512 - SURFACE
      ?auto_17513 - SURFACE
      ?auto_17516 - SURFACE
      ?auto_17515 - SURFACE
      ?auto_17514 - SURFACE
      ?auto_17517 - SURFACE
      ?auto_17519 - SURFACE
      ?auto_17518 - SURFACE
    )
    :vars
    (
      ?auto_17521 - HOIST
      ?auto_17523 - PLACE
      ?auto_17520 - PLACE
      ?auto_17522 - HOIST
      ?auto_17524 - SURFACE
      ?auto_17538 - PLACE
      ?auto_17548 - HOIST
      ?auto_17545 - SURFACE
      ?auto_17536 - PLACE
      ?auto_17542 - HOIST
      ?auto_17537 - SURFACE
      ?auto_17546 - PLACE
      ?auto_17527 - HOIST
      ?auto_17530 - SURFACE
      ?auto_17539 - PLACE
      ?auto_17547 - HOIST
      ?auto_17552 - SURFACE
      ?auto_17526 - PLACE
      ?auto_17533 - HOIST
      ?auto_17528 - SURFACE
      ?auto_17534 - PLACE
      ?auto_17544 - HOIST
      ?auto_17535 - SURFACE
      ?auto_17540 - PLACE
      ?auto_17551 - HOIST
      ?auto_17550 - SURFACE
      ?auto_17532 - PLACE
      ?auto_17531 - HOIST
      ?auto_17541 - SURFACE
      ?auto_17543 - PLACE
      ?auto_17549 - HOIST
      ?auto_17553 - SURFACE
      ?auto_17529 - SURFACE
      ?auto_17525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17521 ?auto_17523 ) ( IS-CRATE ?auto_17518 ) ( not ( = ?auto_17520 ?auto_17523 ) ) ( HOIST-AT ?auto_17522 ?auto_17520 ) ( AVAILABLE ?auto_17522 ) ( SURFACE-AT ?auto_17518 ?auto_17520 ) ( ON ?auto_17518 ?auto_17524 ) ( CLEAR ?auto_17518 ) ( not ( = ?auto_17519 ?auto_17518 ) ) ( not ( = ?auto_17519 ?auto_17524 ) ) ( not ( = ?auto_17518 ?auto_17524 ) ) ( not ( = ?auto_17521 ?auto_17522 ) ) ( IS-CRATE ?auto_17519 ) ( not ( = ?auto_17538 ?auto_17523 ) ) ( HOIST-AT ?auto_17548 ?auto_17538 ) ( AVAILABLE ?auto_17548 ) ( SURFACE-AT ?auto_17519 ?auto_17538 ) ( ON ?auto_17519 ?auto_17545 ) ( CLEAR ?auto_17519 ) ( not ( = ?auto_17517 ?auto_17519 ) ) ( not ( = ?auto_17517 ?auto_17545 ) ) ( not ( = ?auto_17519 ?auto_17545 ) ) ( not ( = ?auto_17521 ?auto_17548 ) ) ( IS-CRATE ?auto_17517 ) ( not ( = ?auto_17536 ?auto_17523 ) ) ( HOIST-AT ?auto_17542 ?auto_17536 ) ( AVAILABLE ?auto_17542 ) ( SURFACE-AT ?auto_17517 ?auto_17536 ) ( ON ?auto_17517 ?auto_17537 ) ( CLEAR ?auto_17517 ) ( not ( = ?auto_17514 ?auto_17517 ) ) ( not ( = ?auto_17514 ?auto_17537 ) ) ( not ( = ?auto_17517 ?auto_17537 ) ) ( not ( = ?auto_17521 ?auto_17542 ) ) ( IS-CRATE ?auto_17514 ) ( not ( = ?auto_17546 ?auto_17523 ) ) ( HOIST-AT ?auto_17527 ?auto_17546 ) ( AVAILABLE ?auto_17527 ) ( SURFACE-AT ?auto_17514 ?auto_17546 ) ( ON ?auto_17514 ?auto_17530 ) ( CLEAR ?auto_17514 ) ( not ( = ?auto_17515 ?auto_17514 ) ) ( not ( = ?auto_17515 ?auto_17530 ) ) ( not ( = ?auto_17514 ?auto_17530 ) ) ( not ( = ?auto_17521 ?auto_17527 ) ) ( IS-CRATE ?auto_17515 ) ( not ( = ?auto_17539 ?auto_17523 ) ) ( HOIST-AT ?auto_17547 ?auto_17539 ) ( AVAILABLE ?auto_17547 ) ( SURFACE-AT ?auto_17515 ?auto_17539 ) ( ON ?auto_17515 ?auto_17552 ) ( CLEAR ?auto_17515 ) ( not ( = ?auto_17516 ?auto_17515 ) ) ( not ( = ?auto_17516 ?auto_17552 ) ) ( not ( = ?auto_17515 ?auto_17552 ) ) ( not ( = ?auto_17521 ?auto_17547 ) ) ( IS-CRATE ?auto_17516 ) ( not ( = ?auto_17526 ?auto_17523 ) ) ( HOIST-AT ?auto_17533 ?auto_17526 ) ( AVAILABLE ?auto_17533 ) ( SURFACE-AT ?auto_17516 ?auto_17526 ) ( ON ?auto_17516 ?auto_17528 ) ( CLEAR ?auto_17516 ) ( not ( = ?auto_17513 ?auto_17516 ) ) ( not ( = ?auto_17513 ?auto_17528 ) ) ( not ( = ?auto_17516 ?auto_17528 ) ) ( not ( = ?auto_17521 ?auto_17533 ) ) ( IS-CRATE ?auto_17513 ) ( not ( = ?auto_17534 ?auto_17523 ) ) ( HOIST-AT ?auto_17544 ?auto_17534 ) ( AVAILABLE ?auto_17544 ) ( SURFACE-AT ?auto_17513 ?auto_17534 ) ( ON ?auto_17513 ?auto_17535 ) ( CLEAR ?auto_17513 ) ( not ( = ?auto_17512 ?auto_17513 ) ) ( not ( = ?auto_17512 ?auto_17535 ) ) ( not ( = ?auto_17513 ?auto_17535 ) ) ( not ( = ?auto_17521 ?auto_17544 ) ) ( IS-CRATE ?auto_17512 ) ( not ( = ?auto_17540 ?auto_17523 ) ) ( HOIST-AT ?auto_17551 ?auto_17540 ) ( AVAILABLE ?auto_17551 ) ( SURFACE-AT ?auto_17512 ?auto_17540 ) ( ON ?auto_17512 ?auto_17550 ) ( CLEAR ?auto_17512 ) ( not ( = ?auto_17511 ?auto_17512 ) ) ( not ( = ?auto_17511 ?auto_17550 ) ) ( not ( = ?auto_17512 ?auto_17550 ) ) ( not ( = ?auto_17521 ?auto_17551 ) ) ( IS-CRATE ?auto_17511 ) ( not ( = ?auto_17532 ?auto_17523 ) ) ( HOIST-AT ?auto_17531 ?auto_17532 ) ( SURFACE-AT ?auto_17511 ?auto_17532 ) ( ON ?auto_17511 ?auto_17541 ) ( CLEAR ?auto_17511 ) ( not ( = ?auto_17510 ?auto_17511 ) ) ( not ( = ?auto_17510 ?auto_17541 ) ) ( not ( = ?auto_17511 ?auto_17541 ) ) ( not ( = ?auto_17521 ?auto_17531 ) ) ( IS-CRATE ?auto_17510 ) ( not ( = ?auto_17543 ?auto_17523 ) ) ( HOIST-AT ?auto_17549 ?auto_17543 ) ( AVAILABLE ?auto_17549 ) ( SURFACE-AT ?auto_17510 ?auto_17543 ) ( ON ?auto_17510 ?auto_17553 ) ( CLEAR ?auto_17510 ) ( not ( = ?auto_17509 ?auto_17510 ) ) ( not ( = ?auto_17509 ?auto_17553 ) ) ( not ( = ?auto_17510 ?auto_17553 ) ) ( not ( = ?auto_17521 ?auto_17549 ) ) ( SURFACE-AT ?auto_17508 ?auto_17523 ) ( CLEAR ?auto_17508 ) ( IS-CRATE ?auto_17509 ) ( AVAILABLE ?auto_17521 ) ( AVAILABLE ?auto_17531 ) ( SURFACE-AT ?auto_17509 ?auto_17532 ) ( ON ?auto_17509 ?auto_17529 ) ( CLEAR ?auto_17509 ) ( TRUCK-AT ?auto_17525 ?auto_17523 ) ( not ( = ?auto_17508 ?auto_17509 ) ) ( not ( = ?auto_17508 ?auto_17529 ) ) ( not ( = ?auto_17509 ?auto_17529 ) ) ( not ( = ?auto_17508 ?auto_17510 ) ) ( not ( = ?auto_17508 ?auto_17553 ) ) ( not ( = ?auto_17510 ?auto_17529 ) ) ( not ( = ?auto_17543 ?auto_17532 ) ) ( not ( = ?auto_17549 ?auto_17531 ) ) ( not ( = ?auto_17553 ?auto_17529 ) ) ( not ( = ?auto_17508 ?auto_17511 ) ) ( not ( = ?auto_17508 ?auto_17541 ) ) ( not ( = ?auto_17509 ?auto_17511 ) ) ( not ( = ?auto_17509 ?auto_17541 ) ) ( not ( = ?auto_17511 ?auto_17553 ) ) ( not ( = ?auto_17511 ?auto_17529 ) ) ( not ( = ?auto_17541 ?auto_17553 ) ) ( not ( = ?auto_17541 ?auto_17529 ) ) ( not ( = ?auto_17508 ?auto_17512 ) ) ( not ( = ?auto_17508 ?auto_17550 ) ) ( not ( = ?auto_17509 ?auto_17512 ) ) ( not ( = ?auto_17509 ?auto_17550 ) ) ( not ( = ?auto_17510 ?auto_17512 ) ) ( not ( = ?auto_17510 ?auto_17550 ) ) ( not ( = ?auto_17512 ?auto_17541 ) ) ( not ( = ?auto_17512 ?auto_17553 ) ) ( not ( = ?auto_17512 ?auto_17529 ) ) ( not ( = ?auto_17540 ?auto_17532 ) ) ( not ( = ?auto_17540 ?auto_17543 ) ) ( not ( = ?auto_17551 ?auto_17531 ) ) ( not ( = ?auto_17551 ?auto_17549 ) ) ( not ( = ?auto_17550 ?auto_17541 ) ) ( not ( = ?auto_17550 ?auto_17553 ) ) ( not ( = ?auto_17550 ?auto_17529 ) ) ( not ( = ?auto_17508 ?auto_17513 ) ) ( not ( = ?auto_17508 ?auto_17535 ) ) ( not ( = ?auto_17509 ?auto_17513 ) ) ( not ( = ?auto_17509 ?auto_17535 ) ) ( not ( = ?auto_17510 ?auto_17513 ) ) ( not ( = ?auto_17510 ?auto_17535 ) ) ( not ( = ?auto_17511 ?auto_17513 ) ) ( not ( = ?auto_17511 ?auto_17535 ) ) ( not ( = ?auto_17513 ?auto_17550 ) ) ( not ( = ?auto_17513 ?auto_17541 ) ) ( not ( = ?auto_17513 ?auto_17553 ) ) ( not ( = ?auto_17513 ?auto_17529 ) ) ( not ( = ?auto_17534 ?auto_17540 ) ) ( not ( = ?auto_17534 ?auto_17532 ) ) ( not ( = ?auto_17534 ?auto_17543 ) ) ( not ( = ?auto_17544 ?auto_17551 ) ) ( not ( = ?auto_17544 ?auto_17531 ) ) ( not ( = ?auto_17544 ?auto_17549 ) ) ( not ( = ?auto_17535 ?auto_17550 ) ) ( not ( = ?auto_17535 ?auto_17541 ) ) ( not ( = ?auto_17535 ?auto_17553 ) ) ( not ( = ?auto_17535 ?auto_17529 ) ) ( not ( = ?auto_17508 ?auto_17516 ) ) ( not ( = ?auto_17508 ?auto_17528 ) ) ( not ( = ?auto_17509 ?auto_17516 ) ) ( not ( = ?auto_17509 ?auto_17528 ) ) ( not ( = ?auto_17510 ?auto_17516 ) ) ( not ( = ?auto_17510 ?auto_17528 ) ) ( not ( = ?auto_17511 ?auto_17516 ) ) ( not ( = ?auto_17511 ?auto_17528 ) ) ( not ( = ?auto_17512 ?auto_17516 ) ) ( not ( = ?auto_17512 ?auto_17528 ) ) ( not ( = ?auto_17516 ?auto_17535 ) ) ( not ( = ?auto_17516 ?auto_17550 ) ) ( not ( = ?auto_17516 ?auto_17541 ) ) ( not ( = ?auto_17516 ?auto_17553 ) ) ( not ( = ?auto_17516 ?auto_17529 ) ) ( not ( = ?auto_17526 ?auto_17534 ) ) ( not ( = ?auto_17526 ?auto_17540 ) ) ( not ( = ?auto_17526 ?auto_17532 ) ) ( not ( = ?auto_17526 ?auto_17543 ) ) ( not ( = ?auto_17533 ?auto_17544 ) ) ( not ( = ?auto_17533 ?auto_17551 ) ) ( not ( = ?auto_17533 ?auto_17531 ) ) ( not ( = ?auto_17533 ?auto_17549 ) ) ( not ( = ?auto_17528 ?auto_17535 ) ) ( not ( = ?auto_17528 ?auto_17550 ) ) ( not ( = ?auto_17528 ?auto_17541 ) ) ( not ( = ?auto_17528 ?auto_17553 ) ) ( not ( = ?auto_17528 ?auto_17529 ) ) ( not ( = ?auto_17508 ?auto_17515 ) ) ( not ( = ?auto_17508 ?auto_17552 ) ) ( not ( = ?auto_17509 ?auto_17515 ) ) ( not ( = ?auto_17509 ?auto_17552 ) ) ( not ( = ?auto_17510 ?auto_17515 ) ) ( not ( = ?auto_17510 ?auto_17552 ) ) ( not ( = ?auto_17511 ?auto_17515 ) ) ( not ( = ?auto_17511 ?auto_17552 ) ) ( not ( = ?auto_17512 ?auto_17515 ) ) ( not ( = ?auto_17512 ?auto_17552 ) ) ( not ( = ?auto_17513 ?auto_17515 ) ) ( not ( = ?auto_17513 ?auto_17552 ) ) ( not ( = ?auto_17515 ?auto_17528 ) ) ( not ( = ?auto_17515 ?auto_17535 ) ) ( not ( = ?auto_17515 ?auto_17550 ) ) ( not ( = ?auto_17515 ?auto_17541 ) ) ( not ( = ?auto_17515 ?auto_17553 ) ) ( not ( = ?auto_17515 ?auto_17529 ) ) ( not ( = ?auto_17539 ?auto_17526 ) ) ( not ( = ?auto_17539 ?auto_17534 ) ) ( not ( = ?auto_17539 ?auto_17540 ) ) ( not ( = ?auto_17539 ?auto_17532 ) ) ( not ( = ?auto_17539 ?auto_17543 ) ) ( not ( = ?auto_17547 ?auto_17533 ) ) ( not ( = ?auto_17547 ?auto_17544 ) ) ( not ( = ?auto_17547 ?auto_17551 ) ) ( not ( = ?auto_17547 ?auto_17531 ) ) ( not ( = ?auto_17547 ?auto_17549 ) ) ( not ( = ?auto_17552 ?auto_17528 ) ) ( not ( = ?auto_17552 ?auto_17535 ) ) ( not ( = ?auto_17552 ?auto_17550 ) ) ( not ( = ?auto_17552 ?auto_17541 ) ) ( not ( = ?auto_17552 ?auto_17553 ) ) ( not ( = ?auto_17552 ?auto_17529 ) ) ( not ( = ?auto_17508 ?auto_17514 ) ) ( not ( = ?auto_17508 ?auto_17530 ) ) ( not ( = ?auto_17509 ?auto_17514 ) ) ( not ( = ?auto_17509 ?auto_17530 ) ) ( not ( = ?auto_17510 ?auto_17514 ) ) ( not ( = ?auto_17510 ?auto_17530 ) ) ( not ( = ?auto_17511 ?auto_17514 ) ) ( not ( = ?auto_17511 ?auto_17530 ) ) ( not ( = ?auto_17512 ?auto_17514 ) ) ( not ( = ?auto_17512 ?auto_17530 ) ) ( not ( = ?auto_17513 ?auto_17514 ) ) ( not ( = ?auto_17513 ?auto_17530 ) ) ( not ( = ?auto_17516 ?auto_17514 ) ) ( not ( = ?auto_17516 ?auto_17530 ) ) ( not ( = ?auto_17514 ?auto_17552 ) ) ( not ( = ?auto_17514 ?auto_17528 ) ) ( not ( = ?auto_17514 ?auto_17535 ) ) ( not ( = ?auto_17514 ?auto_17550 ) ) ( not ( = ?auto_17514 ?auto_17541 ) ) ( not ( = ?auto_17514 ?auto_17553 ) ) ( not ( = ?auto_17514 ?auto_17529 ) ) ( not ( = ?auto_17546 ?auto_17539 ) ) ( not ( = ?auto_17546 ?auto_17526 ) ) ( not ( = ?auto_17546 ?auto_17534 ) ) ( not ( = ?auto_17546 ?auto_17540 ) ) ( not ( = ?auto_17546 ?auto_17532 ) ) ( not ( = ?auto_17546 ?auto_17543 ) ) ( not ( = ?auto_17527 ?auto_17547 ) ) ( not ( = ?auto_17527 ?auto_17533 ) ) ( not ( = ?auto_17527 ?auto_17544 ) ) ( not ( = ?auto_17527 ?auto_17551 ) ) ( not ( = ?auto_17527 ?auto_17531 ) ) ( not ( = ?auto_17527 ?auto_17549 ) ) ( not ( = ?auto_17530 ?auto_17552 ) ) ( not ( = ?auto_17530 ?auto_17528 ) ) ( not ( = ?auto_17530 ?auto_17535 ) ) ( not ( = ?auto_17530 ?auto_17550 ) ) ( not ( = ?auto_17530 ?auto_17541 ) ) ( not ( = ?auto_17530 ?auto_17553 ) ) ( not ( = ?auto_17530 ?auto_17529 ) ) ( not ( = ?auto_17508 ?auto_17517 ) ) ( not ( = ?auto_17508 ?auto_17537 ) ) ( not ( = ?auto_17509 ?auto_17517 ) ) ( not ( = ?auto_17509 ?auto_17537 ) ) ( not ( = ?auto_17510 ?auto_17517 ) ) ( not ( = ?auto_17510 ?auto_17537 ) ) ( not ( = ?auto_17511 ?auto_17517 ) ) ( not ( = ?auto_17511 ?auto_17537 ) ) ( not ( = ?auto_17512 ?auto_17517 ) ) ( not ( = ?auto_17512 ?auto_17537 ) ) ( not ( = ?auto_17513 ?auto_17517 ) ) ( not ( = ?auto_17513 ?auto_17537 ) ) ( not ( = ?auto_17516 ?auto_17517 ) ) ( not ( = ?auto_17516 ?auto_17537 ) ) ( not ( = ?auto_17515 ?auto_17517 ) ) ( not ( = ?auto_17515 ?auto_17537 ) ) ( not ( = ?auto_17517 ?auto_17530 ) ) ( not ( = ?auto_17517 ?auto_17552 ) ) ( not ( = ?auto_17517 ?auto_17528 ) ) ( not ( = ?auto_17517 ?auto_17535 ) ) ( not ( = ?auto_17517 ?auto_17550 ) ) ( not ( = ?auto_17517 ?auto_17541 ) ) ( not ( = ?auto_17517 ?auto_17553 ) ) ( not ( = ?auto_17517 ?auto_17529 ) ) ( not ( = ?auto_17536 ?auto_17546 ) ) ( not ( = ?auto_17536 ?auto_17539 ) ) ( not ( = ?auto_17536 ?auto_17526 ) ) ( not ( = ?auto_17536 ?auto_17534 ) ) ( not ( = ?auto_17536 ?auto_17540 ) ) ( not ( = ?auto_17536 ?auto_17532 ) ) ( not ( = ?auto_17536 ?auto_17543 ) ) ( not ( = ?auto_17542 ?auto_17527 ) ) ( not ( = ?auto_17542 ?auto_17547 ) ) ( not ( = ?auto_17542 ?auto_17533 ) ) ( not ( = ?auto_17542 ?auto_17544 ) ) ( not ( = ?auto_17542 ?auto_17551 ) ) ( not ( = ?auto_17542 ?auto_17531 ) ) ( not ( = ?auto_17542 ?auto_17549 ) ) ( not ( = ?auto_17537 ?auto_17530 ) ) ( not ( = ?auto_17537 ?auto_17552 ) ) ( not ( = ?auto_17537 ?auto_17528 ) ) ( not ( = ?auto_17537 ?auto_17535 ) ) ( not ( = ?auto_17537 ?auto_17550 ) ) ( not ( = ?auto_17537 ?auto_17541 ) ) ( not ( = ?auto_17537 ?auto_17553 ) ) ( not ( = ?auto_17537 ?auto_17529 ) ) ( not ( = ?auto_17508 ?auto_17519 ) ) ( not ( = ?auto_17508 ?auto_17545 ) ) ( not ( = ?auto_17509 ?auto_17519 ) ) ( not ( = ?auto_17509 ?auto_17545 ) ) ( not ( = ?auto_17510 ?auto_17519 ) ) ( not ( = ?auto_17510 ?auto_17545 ) ) ( not ( = ?auto_17511 ?auto_17519 ) ) ( not ( = ?auto_17511 ?auto_17545 ) ) ( not ( = ?auto_17512 ?auto_17519 ) ) ( not ( = ?auto_17512 ?auto_17545 ) ) ( not ( = ?auto_17513 ?auto_17519 ) ) ( not ( = ?auto_17513 ?auto_17545 ) ) ( not ( = ?auto_17516 ?auto_17519 ) ) ( not ( = ?auto_17516 ?auto_17545 ) ) ( not ( = ?auto_17515 ?auto_17519 ) ) ( not ( = ?auto_17515 ?auto_17545 ) ) ( not ( = ?auto_17514 ?auto_17519 ) ) ( not ( = ?auto_17514 ?auto_17545 ) ) ( not ( = ?auto_17519 ?auto_17537 ) ) ( not ( = ?auto_17519 ?auto_17530 ) ) ( not ( = ?auto_17519 ?auto_17552 ) ) ( not ( = ?auto_17519 ?auto_17528 ) ) ( not ( = ?auto_17519 ?auto_17535 ) ) ( not ( = ?auto_17519 ?auto_17550 ) ) ( not ( = ?auto_17519 ?auto_17541 ) ) ( not ( = ?auto_17519 ?auto_17553 ) ) ( not ( = ?auto_17519 ?auto_17529 ) ) ( not ( = ?auto_17538 ?auto_17536 ) ) ( not ( = ?auto_17538 ?auto_17546 ) ) ( not ( = ?auto_17538 ?auto_17539 ) ) ( not ( = ?auto_17538 ?auto_17526 ) ) ( not ( = ?auto_17538 ?auto_17534 ) ) ( not ( = ?auto_17538 ?auto_17540 ) ) ( not ( = ?auto_17538 ?auto_17532 ) ) ( not ( = ?auto_17538 ?auto_17543 ) ) ( not ( = ?auto_17548 ?auto_17542 ) ) ( not ( = ?auto_17548 ?auto_17527 ) ) ( not ( = ?auto_17548 ?auto_17547 ) ) ( not ( = ?auto_17548 ?auto_17533 ) ) ( not ( = ?auto_17548 ?auto_17544 ) ) ( not ( = ?auto_17548 ?auto_17551 ) ) ( not ( = ?auto_17548 ?auto_17531 ) ) ( not ( = ?auto_17548 ?auto_17549 ) ) ( not ( = ?auto_17545 ?auto_17537 ) ) ( not ( = ?auto_17545 ?auto_17530 ) ) ( not ( = ?auto_17545 ?auto_17552 ) ) ( not ( = ?auto_17545 ?auto_17528 ) ) ( not ( = ?auto_17545 ?auto_17535 ) ) ( not ( = ?auto_17545 ?auto_17550 ) ) ( not ( = ?auto_17545 ?auto_17541 ) ) ( not ( = ?auto_17545 ?auto_17553 ) ) ( not ( = ?auto_17545 ?auto_17529 ) ) ( not ( = ?auto_17508 ?auto_17518 ) ) ( not ( = ?auto_17508 ?auto_17524 ) ) ( not ( = ?auto_17509 ?auto_17518 ) ) ( not ( = ?auto_17509 ?auto_17524 ) ) ( not ( = ?auto_17510 ?auto_17518 ) ) ( not ( = ?auto_17510 ?auto_17524 ) ) ( not ( = ?auto_17511 ?auto_17518 ) ) ( not ( = ?auto_17511 ?auto_17524 ) ) ( not ( = ?auto_17512 ?auto_17518 ) ) ( not ( = ?auto_17512 ?auto_17524 ) ) ( not ( = ?auto_17513 ?auto_17518 ) ) ( not ( = ?auto_17513 ?auto_17524 ) ) ( not ( = ?auto_17516 ?auto_17518 ) ) ( not ( = ?auto_17516 ?auto_17524 ) ) ( not ( = ?auto_17515 ?auto_17518 ) ) ( not ( = ?auto_17515 ?auto_17524 ) ) ( not ( = ?auto_17514 ?auto_17518 ) ) ( not ( = ?auto_17514 ?auto_17524 ) ) ( not ( = ?auto_17517 ?auto_17518 ) ) ( not ( = ?auto_17517 ?auto_17524 ) ) ( not ( = ?auto_17518 ?auto_17545 ) ) ( not ( = ?auto_17518 ?auto_17537 ) ) ( not ( = ?auto_17518 ?auto_17530 ) ) ( not ( = ?auto_17518 ?auto_17552 ) ) ( not ( = ?auto_17518 ?auto_17528 ) ) ( not ( = ?auto_17518 ?auto_17535 ) ) ( not ( = ?auto_17518 ?auto_17550 ) ) ( not ( = ?auto_17518 ?auto_17541 ) ) ( not ( = ?auto_17518 ?auto_17553 ) ) ( not ( = ?auto_17518 ?auto_17529 ) ) ( not ( = ?auto_17520 ?auto_17538 ) ) ( not ( = ?auto_17520 ?auto_17536 ) ) ( not ( = ?auto_17520 ?auto_17546 ) ) ( not ( = ?auto_17520 ?auto_17539 ) ) ( not ( = ?auto_17520 ?auto_17526 ) ) ( not ( = ?auto_17520 ?auto_17534 ) ) ( not ( = ?auto_17520 ?auto_17540 ) ) ( not ( = ?auto_17520 ?auto_17532 ) ) ( not ( = ?auto_17520 ?auto_17543 ) ) ( not ( = ?auto_17522 ?auto_17548 ) ) ( not ( = ?auto_17522 ?auto_17542 ) ) ( not ( = ?auto_17522 ?auto_17527 ) ) ( not ( = ?auto_17522 ?auto_17547 ) ) ( not ( = ?auto_17522 ?auto_17533 ) ) ( not ( = ?auto_17522 ?auto_17544 ) ) ( not ( = ?auto_17522 ?auto_17551 ) ) ( not ( = ?auto_17522 ?auto_17531 ) ) ( not ( = ?auto_17522 ?auto_17549 ) ) ( not ( = ?auto_17524 ?auto_17545 ) ) ( not ( = ?auto_17524 ?auto_17537 ) ) ( not ( = ?auto_17524 ?auto_17530 ) ) ( not ( = ?auto_17524 ?auto_17552 ) ) ( not ( = ?auto_17524 ?auto_17528 ) ) ( not ( = ?auto_17524 ?auto_17535 ) ) ( not ( = ?auto_17524 ?auto_17550 ) ) ( not ( = ?auto_17524 ?auto_17541 ) ) ( not ( = ?auto_17524 ?auto_17553 ) ) ( not ( = ?auto_17524 ?auto_17529 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_17508 ?auto_17509 ?auto_17510 ?auto_17511 ?auto_17512 ?auto_17513 ?auto_17516 ?auto_17515 ?auto_17514 ?auto_17517 ?auto_17519 )
      ( MAKE-1CRATE ?auto_17519 ?auto_17518 )
      ( MAKE-11CRATE-VERIFY ?auto_17508 ?auto_17509 ?auto_17510 ?auto_17511 ?auto_17512 ?auto_17513 ?auto_17516 ?auto_17515 ?auto_17514 ?auto_17517 ?auto_17519 ?auto_17518 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17556 - SURFACE
      ?auto_17557 - SURFACE
    )
    :vars
    (
      ?auto_17558 - HOIST
      ?auto_17559 - PLACE
      ?auto_17561 - PLACE
      ?auto_17562 - HOIST
      ?auto_17563 - SURFACE
      ?auto_17560 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17558 ?auto_17559 ) ( SURFACE-AT ?auto_17556 ?auto_17559 ) ( CLEAR ?auto_17556 ) ( IS-CRATE ?auto_17557 ) ( AVAILABLE ?auto_17558 ) ( not ( = ?auto_17561 ?auto_17559 ) ) ( HOIST-AT ?auto_17562 ?auto_17561 ) ( AVAILABLE ?auto_17562 ) ( SURFACE-AT ?auto_17557 ?auto_17561 ) ( ON ?auto_17557 ?auto_17563 ) ( CLEAR ?auto_17557 ) ( TRUCK-AT ?auto_17560 ?auto_17559 ) ( not ( = ?auto_17556 ?auto_17557 ) ) ( not ( = ?auto_17556 ?auto_17563 ) ) ( not ( = ?auto_17557 ?auto_17563 ) ) ( not ( = ?auto_17558 ?auto_17562 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17560 ?auto_17559 ?auto_17561 )
      ( !LIFT ?auto_17562 ?auto_17557 ?auto_17563 ?auto_17561 )
      ( !LOAD ?auto_17562 ?auto_17557 ?auto_17560 ?auto_17561 )
      ( !DRIVE ?auto_17560 ?auto_17561 ?auto_17559 )
      ( !UNLOAD ?auto_17558 ?auto_17557 ?auto_17560 ?auto_17559 )
      ( !DROP ?auto_17558 ?auto_17557 ?auto_17556 ?auto_17559 )
      ( MAKE-1CRATE-VERIFY ?auto_17556 ?auto_17557 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_17577 - SURFACE
      ?auto_17578 - SURFACE
      ?auto_17579 - SURFACE
      ?auto_17580 - SURFACE
      ?auto_17581 - SURFACE
      ?auto_17582 - SURFACE
      ?auto_17585 - SURFACE
      ?auto_17584 - SURFACE
      ?auto_17583 - SURFACE
      ?auto_17586 - SURFACE
      ?auto_17588 - SURFACE
      ?auto_17587 - SURFACE
      ?auto_17589 - SURFACE
    )
    :vars
    (
      ?auto_17592 - HOIST
      ?auto_17593 - PLACE
      ?auto_17594 - PLACE
      ?auto_17590 - HOIST
      ?auto_17595 - SURFACE
      ?auto_17621 - PLACE
      ?auto_17625 - HOIST
      ?auto_17623 - SURFACE
      ?auto_17605 - PLACE
      ?auto_17597 - HOIST
      ?auto_17600 - SURFACE
      ?auto_17620 - PLACE
      ?auto_17617 - HOIST
      ?auto_17626 - SURFACE
      ?auto_17601 - PLACE
      ?auto_17624 - HOIST
      ?auto_17613 - SURFACE
      ?auto_17612 - PLACE
      ?auto_17618 - HOIST
      ?auto_17608 - SURFACE
      ?auto_17611 - PLACE
      ?auto_17606 - HOIST
      ?auto_17615 - SURFACE
      ?auto_17609 - PLACE
      ?auto_17619 - HOIST
      ?auto_17622 - SURFACE
      ?auto_17607 - PLACE
      ?auto_17604 - HOIST
      ?auto_17616 - SURFACE
      ?auto_17602 - PLACE
      ?auto_17599 - HOIST
      ?auto_17596 - SURFACE
      ?auto_17603 - PLACE
      ?auto_17614 - HOIST
      ?auto_17598 - SURFACE
      ?auto_17610 - SURFACE
      ?auto_17591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17592 ?auto_17593 ) ( IS-CRATE ?auto_17589 ) ( not ( = ?auto_17594 ?auto_17593 ) ) ( HOIST-AT ?auto_17590 ?auto_17594 ) ( AVAILABLE ?auto_17590 ) ( SURFACE-AT ?auto_17589 ?auto_17594 ) ( ON ?auto_17589 ?auto_17595 ) ( CLEAR ?auto_17589 ) ( not ( = ?auto_17587 ?auto_17589 ) ) ( not ( = ?auto_17587 ?auto_17595 ) ) ( not ( = ?auto_17589 ?auto_17595 ) ) ( not ( = ?auto_17592 ?auto_17590 ) ) ( IS-CRATE ?auto_17587 ) ( not ( = ?auto_17621 ?auto_17593 ) ) ( HOIST-AT ?auto_17625 ?auto_17621 ) ( AVAILABLE ?auto_17625 ) ( SURFACE-AT ?auto_17587 ?auto_17621 ) ( ON ?auto_17587 ?auto_17623 ) ( CLEAR ?auto_17587 ) ( not ( = ?auto_17588 ?auto_17587 ) ) ( not ( = ?auto_17588 ?auto_17623 ) ) ( not ( = ?auto_17587 ?auto_17623 ) ) ( not ( = ?auto_17592 ?auto_17625 ) ) ( IS-CRATE ?auto_17588 ) ( not ( = ?auto_17605 ?auto_17593 ) ) ( HOIST-AT ?auto_17597 ?auto_17605 ) ( AVAILABLE ?auto_17597 ) ( SURFACE-AT ?auto_17588 ?auto_17605 ) ( ON ?auto_17588 ?auto_17600 ) ( CLEAR ?auto_17588 ) ( not ( = ?auto_17586 ?auto_17588 ) ) ( not ( = ?auto_17586 ?auto_17600 ) ) ( not ( = ?auto_17588 ?auto_17600 ) ) ( not ( = ?auto_17592 ?auto_17597 ) ) ( IS-CRATE ?auto_17586 ) ( not ( = ?auto_17620 ?auto_17593 ) ) ( HOIST-AT ?auto_17617 ?auto_17620 ) ( AVAILABLE ?auto_17617 ) ( SURFACE-AT ?auto_17586 ?auto_17620 ) ( ON ?auto_17586 ?auto_17626 ) ( CLEAR ?auto_17586 ) ( not ( = ?auto_17583 ?auto_17586 ) ) ( not ( = ?auto_17583 ?auto_17626 ) ) ( not ( = ?auto_17586 ?auto_17626 ) ) ( not ( = ?auto_17592 ?auto_17617 ) ) ( IS-CRATE ?auto_17583 ) ( not ( = ?auto_17601 ?auto_17593 ) ) ( HOIST-AT ?auto_17624 ?auto_17601 ) ( AVAILABLE ?auto_17624 ) ( SURFACE-AT ?auto_17583 ?auto_17601 ) ( ON ?auto_17583 ?auto_17613 ) ( CLEAR ?auto_17583 ) ( not ( = ?auto_17584 ?auto_17583 ) ) ( not ( = ?auto_17584 ?auto_17613 ) ) ( not ( = ?auto_17583 ?auto_17613 ) ) ( not ( = ?auto_17592 ?auto_17624 ) ) ( IS-CRATE ?auto_17584 ) ( not ( = ?auto_17612 ?auto_17593 ) ) ( HOIST-AT ?auto_17618 ?auto_17612 ) ( AVAILABLE ?auto_17618 ) ( SURFACE-AT ?auto_17584 ?auto_17612 ) ( ON ?auto_17584 ?auto_17608 ) ( CLEAR ?auto_17584 ) ( not ( = ?auto_17585 ?auto_17584 ) ) ( not ( = ?auto_17585 ?auto_17608 ) ) ( not ( = ?auto_17584 ?auto_17608 ) ) ( not ( = ?auto_17592 ?auto_17618 ) ) ( IS-CRATE ?auto_17585 ) ( not ( = ?auto_17611 ?auto_17593 ) ) ( HOIST-AT ?auto_17606 ?auto_17611 ) ( AVAILABLE ?auto_17606 ) ( SURFACE-AT ?auto_17585 ?auto_17611 ) ( ON ?auto_17585 ?auto_17615 ) ( CLEAR ?auto_17585 ) ( not ( = ?auto_17582 ?auto_17585 ) ) ( not ( = ?auto_17582 ?auto_17615 ) ) ( not ( = ?auto_17585 ?auto_17615 ) ) ( not ( = ?auto_17592 ?auto_17606 ) ) ( IS-CRATE ?auto_17582 ) ( not ( = ?auto_17609 ?auto_17593 ) ) ( HOIST-AT ?auto_17619 ?auto_17609 ) ( AVAILABLE ?auto_17619 ) ( SURFACE-AT ?auto_17582 ?auto_17609 ) ( ON ?auto_17582 ?auto_17622 ) ( CLEAR ?auto_17582 ) ( not ( = ?auto_17581 ?auto_17582 ) ) ( not ( = ?auto_17581 ?auto_17622 ) ) ( not ( = ?auto_17582 ?auto_17622 ) ) ( not ( = ?auto_17592 ?auto_17619 ) ) ( IS-CRATE ?auto_17581 ) ( not ( = ?auto_17607 ?auto_17593 ) ) ( HOIST-AT ?auto_17604 ?auto_17607 ) ( AVAILABLE ?auto_17604 ) ( SURFACE-AT ?auto_17581 ?auto_17607 ) ( ON ?auto_17581 ?auto_17616 ) ( CLEAR ?auto_17581 ) ( not ( = ?auto_17580 ?auto_17581 ) ) ( not ( = ?auto_17580 ?auto_17616 ) ) ( not ( = ?auto_17581 ?auto_17616 ) ) ( not ( = ?auto_17592 ?auto_17604 ) ) ( IS-CRATE ?auto_17580 ) ( not ( = ?auto_17602 ?auto_17593 ) ) ( HOIST-AT ?auto_17599 ?auto_17602 ) ( SURFACE-AT ?auto_17580 ?auto_17602 ) ( ON ?auto_17580 ?auto_17596 ) ( CLEAR ?auto_17580 ) ( not ( = ?auto_17579 ?auto_17580 ) ) ( not ( = ?auto_17579 ?auto_17596 ) ) ( not ( = ?auto_17580 ?auto_17596 ) ) ( not ( = ?auto_17592 ?auto_17599 ) ) ( IS-CRATE ?auto_17579 ) ( not ( = ?auto_17603 ?auto_17593 ) ) ( HOIST-AT ?auto_17614 ?auto_17603 ) ( AVAILABLE ?auto_17614 ) ( SURFACE-AT ?auto_17579 ?auto_17603 ) ( ON ?auto_17579 ?auto_17598 ) ( CLEAR ?auto_17579 ) ( not ( = ?auto_17578 ?auto_17579 ) ) ( not ( = ?auto_17578 ?auto_17598 ) ) ( not ( = ?auto_17579 ?auto_17598 ) ) ( not ( = ?auto_17592 ?auto_17614 ) ) ( SURFACE-AT ?auto_17577 ?auto_17593 ) ( CLEAR ?auto_17577 ) ( IS-CRATE ?auto_17578 ) ( AVAILABLE ?auto_17592 ) ( AVAILABLE ?auto_17599 ) ( SURFACE-AT ?auto_17578 ?auto_17602 ) ( ON ?auto_17578 ?auto_17610 ) ( CLEAR ?auto_17578 ) ( TRUCK-AT ?auto_17591 ?auto_17593 ) ( not ( = ?auto_17577 ?auto_17578 ) ) ( not ( = ?auto_17577 ?auto_17610 ) ) ( not ( = ?auto_17578 ?auto_17610 ) ) ( not ( = ?auto_17577 ?auto_17579 ) ) ( not ( = ?auto_17577 ?auto_17598 ) ) ( not ( = ?auto_17579 ?auto_17610 ) ) ( not ( = ?auto_17603 ?auto_17602 ) ) ( not ( = ?auto_17614 ?auto_17599 ) ) ( not ( = ?auto_17598 ?auto_17610 ) ) ( not ( = ?auto_17577 ?auto_17580 ) ) ( not ( = ?auto_17577 ?auto_17596 ) ) ( not ( = ?auto_17578 ?auto_17580 ) ) ( not ( = ?auto_17578 ?auto_17596 ) ) ( not ( = ?auto_17580 ?auto_17598 ) ) ( not ( = ?auto_17580 ?auto_17610 ) ) ( not ( = ?auto_17596 ?auto_17598 ) ) ( not ( = ?auto_17596 ?auto_17610 ) ) ( not ( = ?auto_17577 ?auto_17581 ) ) ( not ( = ?auto_17577 ?auto_17616 ) ) ( not ( = ?auto_17578 ?auto_17581 ) ) ( not ( = ?auto_17578 ?auto_17616 ) ) ( not ( = ?auto_17579 ?auto_17581 ) ) ( not ( = ?auto_17579 ?auto_17616 ) ) ( not ( = ?auto_17581 ?auto_17596 ) ) ( not ( = ?auto_17581 ?auto_17598 ) ) ( not ( = ?auto_17581 ?auto_17610 ) ) ( not ( = ?auto_17607 ?auto_17602 ) ) ( not ( = ?auto_17607 ?auto_17603 ) ) ( not ( = ?auto_17604 ?auto_17599 ) ) ( not ( = ?auto_17604 ?auto_17614 ) ) ( not ( = ?auto_17616 ?auto_17596 ) ) ( not ( = ?auto_17616 ?auto_17598 ) ) ( not ( = ?auto_17616 ?auto_17610 ) ) ( not ( = ?auto_17577 ?auto_17582 ) ) ( not ( = ?auto_17577 ?auto_17622 ) ) ( not ( = ?auto_17578 ?auto_17582 ) ) ( not ( = ?auto_17578 ?auto_17622 ) ) ( not ( = ?auto_17579 ?auto_17582 ) ) ( not ( = ?auto_17579 ?auto_17622 ) ) ( not ( = ?auto_17580 ?auto_17582 ) ) ( not ( = ?auto_17580 ?auto_17622 ) ) ( not ( = ?auto_17582 ?auto_17616 ) ) ( not ( = ?auto_17582 ?auto_17596 ) ) ( not ( = ?auto_17582 ?auto_17598 ) ) ( not ( = ?auto_17582 ?auto_17610 ) ) ( not ( = ?auto_17609 ?auto_17607 ) ) ( not ( = ?auto_17609 ?auto_17602 ) ) ( not ( = ?auto_17609 ?auto_17603 ) ) ( not ( = ?auto_17619 ?auto_17604 ) ) ( not ( = ?auto_17619 ?auto_17599 ) ) ( not ( = ?auto_17619 ?auto_17614 ) ) ( not ( = ?auto_17622 ?auto_17616 ) ) ( not ( = ?auto_17622 ?auto_17596 ) ) ( not ( = ?auto_17622 ?auto_17598 ) ) ( not ( = ?auto_17622 ?auto_17610 ) ) ( not ( = ?auto_17577 ?auto_17585 ) ) ( not ( = ?auto_17577 ?auto_17615 ) ) ( not ( = ?auto_17578 ?auto_17585 ) ) ( not ( = ?auto_17578 ?auto_17615 ) ) ( not ( = ?auto_17579 ?auto_17585 ) ) ( not ( = ?auto_17579 ?auto_17615 ) ) ( not ( = ?auto_17580 ?auto_17585 ) ) ( not ( = ?auto_17580 ?auto_17615 ) ) ( not ( = ?auto_17581 ?auto_17585 ) ) ( not ( = ?auto_17581 ?auto_17615 ) ) ( not ( = ?auto_17585 ?auto_17622 ) ) ( not ( = ?auto_17585 ?auto_17616 ) ) ( not ( = ?auto_17585 ?auto_17596 ) ) ( not ( = ?auto_17585 ?auto_17598 ) ) ( not ( = ?auto_17585 ?auto_17610 ) ) ( not ( = ?auto_17611 ?auto_17609 ) ) ( not ( = ?auto_17611 ?auto_17607 ) ) ( not ( = ?auto_17611 ?auto_17602 ) ) ( not ( = ?auto_17611 ?auto_17603 ) ) ( not ( = ?auto_17606 ?auto_17619 ) ) ( not ( = ?auto_17606 ?auto_17604 ) ) ( not ( = ?auto_17606 ?auto_17599 ) ) ( not ( = ?auto_17606 ?auto_17614 ) ) ( not ( = ?auto_17615 ?auto_17622 ) ) ( not ( = ?auto_17615 ?auto_17616 ) ) ( not ( = ?auto_17615 ?auto_17596 ) ) ( not ( = ?auto_17615 ?auto_17598 ) ) ( not ( = ?auto_17615 ?auto_17610 ) ) ( not ( = ?auto_17577 ?auto_17584 ) ) ( not ( = ?auto_17577 ?auto_17608 ) ) ( not ( = ?auto_17578 ?auto_17584 ) ) ( not ( = ?auto_17578 ?auto_17608 ) ) ( not ( = ?auto_17579 ?auto_17584 ) ) ( not ( = ?auto_17579 ?auto_17608 ) ) ( not ( = ?auto_17580 ?auto_17584 ) ) ( not ( = ?auto_17580 ?auto_17608 ) ) ( not ( = ?auto_17581 ?auto_17584 ) ) ( not ( = ?auto_17581 ?auto_17608 ) ) ( not ( = ?auto_17582 ?auto_17584 ) ) ( not ( = ?auto_17582 ?auto_17608 ) ) ( not ( = ?auto_17584 ?auto_17615 ) ) ( not ( = ?auto_17584 ?auto_17622 ) ) ( not ( = ?auto_17584 ?auto_17616 ) ) ( not ( = ?auto_17584 ?auto_17596 ) ) ( not ( = ?auto_17584 ?auto_17598 ) ) ( not ( = ?auto_17584 ?auto_17610 ) ) ( not ( = ?auto_17612 ?auto_17611 ) ) ( not ( = ?auto_17612 ?auto_17609 ) ) ( not ( = ?auto_17612 ?auto_17607 ) ) ( not ( = ?auto_17612 ?auto_17602 ) ) ( not ( = ?auto_17612 ?auto_17603 ) ) ( not ( = ?auto_17618 ?auto_17606 ) ) ( not ( = ?auto_17618 ?auto_17619 ) ) ( not ( = ?auto_17618 ?auto_17604 ) ) ( not ( = ?auto_17618 ?auto_17599 ) ) ( not ( = ?auto_17618 ?auto_17614 ) ) ( not ( = ?auto_17608 ?auto_17615 ) ) ( not ( = ?auto_17608 ?auto_17622 ) ) ( not ( = ?auto_17608 ?auto_17616 ) ) ( not ( = ?auto_17608 ?auto_17596 ) ) ( not ( = ?auto_17608 ?auto_17598 ) ) ( not ( = ?auto_17608 ?auto_17610 ) ) ( not ( = ?auto_17577 ?auto_17583 ) ) ( not ( = ?auto_17577 ?auto_17613 ) ) ( not ( = ?auto_17578 ?auto_17583 ) ) ( not ( = ?auto_17578 ?auto_17613 ) ) ( not ( = ?auto_17579 ?auto_17583 ) ) ( not ( = ?auto_17579 ?auto_17613 ) ) ( not ( = ?auto_17580 ?auto_17583 ) ) ( not ( = ?auto_17580 ?auto_17613 ) ) ( not ( = ?auto_17581 ?auto_17583 ) ) ( not ( = ?auto_17581 ?auto_17613 ) ) ( not ( = ?auto_17582 ?auto_17583 ) ) ( not ( = ?auto_17582 ?auto_17613 ) ) ( not ( = ?auto_17585 ?auto_17583 ) ) ( not ( = ?auto_17585 ?auto_17613 ) ) ( not ( = ?auto_17583 ?auto_17608 ) ) ( not ( = ?auto_17583 ?auto_17615 ) ) ( not ( = ?auto_17583 ?auto_17622 ) ) ( not ( = ?auto_17583 ?auto_17616 ) ) ( not ( = ?auto_17583 ?auto_17596 ) ) ( not ( = ?auto_17583 ?auto_17598 ) ) ( not ( = ?auto_17583 ?auto_17610 ) ) ( not ( = ?auto_17601 ?auto_17612 ) ) ( not ( = ?auto_17601 ?auto_17611 ) ) ( not ( = ?auto_17601 ?auto_17609 ) ) ( not ( = ?auto_17601 ?auto_17607 ) ) ( not ( = ?auto_17601 ?auto_17602 ) ) ( not ( = ?auto_17601 ?auto_17603 ) ) ( not ( = ?auto_17624 ?auto_17618 ) ) ( not ( = ?auto_17624 ?auto_17606 ) ) ( not ( = ?auto_17624 ?auto_17619 ) ) ( not ( = ?auto_17624 ?auto_17604 ) ) ( not ( = ?auto_17624 ?auto_17599 ) ) ( not ( = ?auto_17624 ?auto_17614 ) ) ( not ( = ?auto_17613 ?auto_17608 ) ) ( not ( = ?auto_17613 ?auto_17615 ) ) ( not ( = ?auto_17613 ?auto_17622 ) ) ( not ( = ?auto_17613 ?auto_17616 ) ) ( not ( = ?auto_17613 ?auto_17596 ) ) ( not ( = ?auto_17613 ?auto_17598 ) ) ( not ( = ?auto_17613 ?auto_17610 ) ) ( not ( = ?auto_17577 ?auto_17586 ) ) ( not ( = ?auto_17577 ?auto_17626 ) ) ( not ( = ?auto_17578 ?auto_17586 ) ) ( not ( = ?auto_17578 ?auto_17626 ) ) ( not ( = ?auto_17579 ?auto_17586 ) ) ( not ( = ?auto_17579 ?auto_17626 ) ) ( not ( = ?auto_17580 ?auto_17586 ) ) ( not ( = ?auto_17580 ?auto_17626 ) ) ( not ( = ?auto_17581 ?auto_17586 ) ) ( not ( = ?auto_17581 ?auto_17626 ) ) ( not ( = ?auto_17582 ?auto_17586 ) ) ( not ( = ?auto_17582 ?auto_17626 ) ) ( not ( = ?auto_17585 ?auto_17586 ) ) ( not ( = ?auto_17585 ?auto_17626 ) ) ( not ( = ?auto_17584 ?auto_17586 ) ) ( not ( = ?auto_17584 ?auto_17626 ) ) ( not ( = ?auto_17586 ?auto_17613 ) ) ( not ( = ?auto_17586 ?auto_17608 ) ) ( not ( = ?auto_17586 ?auto_17615 ) ) ( not ( = ?auto_17586 ?auto_17622 ) ) ( not ( = ?auto_17586 ?auto_17616 ) ) ( not ( = ?auto_17586 ?auto_17596 ) ) ( not ( = ?auto_17586 ?auto_17598 ) ) ( not ( = ?auto_17586 ?auto_17610 ) ) ( not ( = ?auto_17620 ?auto_17601 ) ) ( not ( = ?auto_17620 ?auto_17612 ) ) ( not ( = ?auto_17620 ?auto_17611 ) ) ( not ( = ?auto_17620 ?auto_17609 ) ) ( not ( = ?auto_17620 ?auto_17607 ) ) ( not ( = ?auto_17620 ?auto_17602 ) ) ( not ( = ?auto_17620 ?auto_17603 ) ) ( not ( = ?auto_17617 ?auto_17624 ) ) ( not ( = ?auto_17617 ?auto_17618 ) ) ( not ( = ?auto_17617 ?auto_17606 ) ) ( not ( = ?auto_17617 ?auto_17619 ) ) ( not ( = ?auto_17617 ?auto_17604 ) ) ( not ( = ?auto_17617 ?auto_17599 ) ) ( not ( = ?auto_17617 ?auto_17614 ) ) ( not ( = ?auto_17626 ?auto_17613 ) ) ( not ( = ?auto_17626 ?auto_17608 ) ) ( not ( = ?auto_17626 ?auto_17615 ) ) ( not ( = ?auto_17626 ?auto_17622 ) ) ( not ( = ?auto_17626 ?auto_17616 ) ) ( not ( = ?auto_17626 ?auto_17596 ) ) ( not ( = ?auto_17626 ?auto_17598 ) ) ( not ( = ?auto_17626 ?auto_17610 ) ) ( not ( = ?auto_17577 ?auto_17588 ) ) ( not ( = ?auto_17577 ?auto_17600 ) ) ( not ( = ?auto_17578 ?auto_17588 ) ) ( not ( = ?auto_17578 ?auto_17600 ) ) ( not ( = ?auto_17579 ?auto_17588 ) ) ( not ( = ?auto_17579 ?auto_17600 ) ) ( not ( = ?auto_17580 ?auto_17588 ) ) ( not ( = ?auto_17580 ?auto_17600 ) ) ( not ( = ?auto_17581 ?auto_17588 ) ) ( not ( = ?auto_17581 ?auto_17600 ) ) ( not ( = ?auto_17582 ?auto_17588 ) ) ( not ( = ?auto_17582 ?auto_17600 ) ) ( not ( = ?auto_17585 ?auto_17588 ) ) ( not ( = ?auto_17585 ?auto_17600 ) ) ( not ( = ?auto_17584 ?auto_17588 ) ) ( not ( = ?auto_17584 ?auto_17600 ) ) ( not ( = ?auto_17583 ?auto_17588 ) ) ( not ( = ?auto_17583 ?auto_17600 ) ) ( not ( = ?auto_17588 ?auto_17626 ) ) ( not ( = ?auto_17588 ?auto_17613 ) ) ( not ( = ?auto_17588 ?auto_17608 ) ) ( not ( = ?auto_17588 ?auto_17615 ) ) ( not ( = ?auto_17588 ?auto_17622 ) ) ( not ( = ?auto_17588 ?auto_17616 ) ) ( not ( = ?auto_17588 ?auto_17596 ) ) ( not ( = ?auto_17588 ?auto_17598 ) ) ( not ( = ?auto_17588 ?auto_17610 ) ) ( not ( = ?auto_17605 ?auto_17620 ) ) ( not ( = ?auto_17605 ?auto_17601 ) ) ( not ( = ?auto_17605 ?auto_17612 ) ) ( not ( = ?auto_17605 ?auto_17611 ) ) ( not ( = ?auto_17605 ?auto_17609 ) ) ( not ( = ?auto_17605 ?auto_17607 ) ) ( not ( = ?auto_17605 ?auto_17602 ) ) ( not ( = ?auto_17605 ?auto_17603 ) ) ( not ( = ?auto_17597 ?auto_17617 ) ) ( not ( = ?auto_17597 ?auto_17624 ) ) ( not ( = ?auto_17597 ?auto_17618 ) ) ( not ( = ?auto_17597 ?auto_17606 ) ) ( not ( = ?auto_17597 ?auto_17619 ) ) ( not ( = ?auto_17597 ?auto_17604 ) ) ( not ( = ?auto_17597 ?auto_17599 ) ) ( not ( = ?auto_17597 ?auto_17614 ) ) ( not ( = ?auto_17600 ?auto_17626 ) ) ( not ( = ?auto_17600 ?auto_17613 ) ) ( not ( = ?auto_17600 ?auto_17608 ) ) ( not ( = ?auto_17600 ?auto_17615 ) ) ( not ( = ?auto_17600 ?auto_17622 ) ) ( not ( = ?auto_17600 ?auto_17616 ) ) ( not ( = ?auto_17600 ?auto_17596 ) ) ( not ( = ?auto_17600 ?auto_17598 ) ) ( not ( = ?auto_17600 ?auto_17610 ) ) ( not ( = ?auto_17577 ?auto_17587 ) ) ( not ( = ?auto_17577 ?auto_17623 ) ) ( not ( = ?auto_17578 ?auto_17587 ) ) ( not ( = ?auto_17578 ?auto_17623 ) ) ( not ( = ?auto_17579 ?auto_17587 ) ) ( not ( = ?auto_17579 ?auto_17623 ) ) ( not ( = ?auto_17580 ?auto_17587 ) ) ( not ( = ?auto_17580 ?auto_17623 ) ) ( not ( = ?auto_17581 ?auto_17587 ) ) ( not ( = ?auto_17581 ?auto_17623 ) ) ( not ( = ?auto_17582 ?auto_17587 ) ) ( not ( = ?auto_17582 ?auto_17623 ) ) ( not ( = ?auto_17585 ?auto_17587 ) ) ( not ( = ?auto_17585 ?auto_17623 ) ) ( not ( = ?auto_17584 ?auto_17587 ) ) ( not ( = ?auto_17584 ?auto_17623 ) ) ( not ( = ?auto_17583 ?auto_17587 ) ) ( not ( = ?auto_17583 ?auto_17623 ) ) ( not ( = ?auto_17586 ?auto_17587 ) ) ( not ( = ?auto_17586 ?auto_17623 ) ) ( not ( = ?auto_17587 ?auto_17600 ) ) ( not ( = ?auto_17587 ?auto_17626 ) ) ( not ( = ?auto_17587 ?auto_17613 ) ) ( not ( = ?auto_17587 ?auto_17608 ) ) ( not ( = ?auto_17587 ?auto_17615 ) ) ( not ( = ?auto_17587 ?auto_17622 ) ) ( not ( = ?auto_17587 ?auto_17616 ) ) ( not ( = ?auto_17587 ?auto_17596 ) ) ( not ( = ?auto_17587 ?auto_17598 ) ) ( not ( = ?auto_17587 ?auto_17610 ) ) ( not ( = ?auto_17621 ?auto_17605 ) ) ( not ( = ?auto_17621 ?auto_17620 ) ) ( not ( = ?auto_17621 ?auto_17601 ) ) ( not ( = ?auto_17621 ?auto_17612 ) ) ( not ( = ?auto_17621 ?auto_17611 ) ) ( not ( = ?auto_17621 ?auto_17609 ) ) ( not ( = ?auto_17621 ?auto_17607 ) ) ( not ( = ?auto_17621 ?auto_17602 ) ) ( not ( = ?auto_17621 ?auto_17603 ) ) ( not ( = ?auto_17625 ?auto_17597 ) ) ( not ( = ?auto_17625 ?auto_17617 ) ) ( not ( = ?auto_17625 ?auto_17624 ) ) ( not ( = ?auto_17625 ?auto_17618 ) ) ( not ( = ?auto_17625 ?auto_17606 ) ) ( not ( = ?auto_17625 ?auto_17619 ) ) ( not ( = ?auto_17625 ?auto_17604 ) ) ( not ( = ?auto_17625 ?auto_17599 ) ) ( not ( = ?auto_17625 ?auto_17614 ) ) ( not ( = ?auto_17623 ?auto_17600 ) ) ( not ( = ?auto_17623 ?auto_17626 ) ) ( not ( = ?auto_17623 ?auto_17613 ) ) ( not ( = ?auto_17623 ?auto_17608 ) ) ( not ( = ?auto_17623 ?auto_17615 ) ) ( not ( = ?auto_17623 ?auto_17622 ) ) ( not ( = ?auto_17623 ?auto_17616 ) ) ( not ( = ?auto_17623 ?auto_17596 ) ) ( not ( = ?auto_17623 ?auto_17598 ) ) ( not ( = ?auto_17623 ?auto_17610 ) ) ( not ( = ?auto_17577 ?auto_17589 ) ) ( not ( = ?auto_17577 ?auto_17595 ) ) ( not ( = ?auto_17578 ?auto_17589 ) ) ( not ( = ?auto_17578 ?auto_17595 ) ) ( not ( = ?auto_17579 ?auto_17589 ) ) ( not ( = ?auto_17579 ?auto_17595 ) ) ( not ( = ?auto_17580 ?auto_17589 ) ) ( not ( = ?auto_17580 ?auto_17595 ) ) ( not ( = ?auto_17581 ?auto_17589 ) ) ( not ( = ?auto_17581 ?auto_17595 ) ) ( not ( = ?auto_17582 ?auto_17589 ) ) ( not ( = ?auto_17582 ?auto_17595 ) ) ( not ( = ?auto_17585 ?auto_17589 ) ) ( not ( = ?auto_17585 ?auto_17595 ) ) ( not ( = ?auto_17584 ?auto_17589 ) ) ( not ( = ?auto_17584 ?auto_17595 ) ) ( not ( = ?auto_17583 ?auto_17589 ) ) ( not ( = ?auto_17583 ?auto_17595 ) ) ( not ( = ?auto_17586 ?auto_17589 ) ) ( not ( = ?auto_17586 ?auto_17595 ) ) ( not ( = ?auto_17588 ?auto_17589 ) ) ( not ( = ?auto_17588 ?auto_17595 ) ) ( not ( = ?auto_17589 ?auto_17623 ) ) ( not ( = ?auto_17589 ?auto_17600 ) ) ( not ( = ?auto_17589 ?auto_17626 ) ) ( not ( = ?auto_17589 ?auto_17613 ) ) ( not ( = ?auto_17589 ?auto_17608 ) ) ( not ( = ?auto_17589 ?auto_17615 ) ) ( not ( = ?auto_17589 ?auto_17622 ) ) ( not ( = ?auto_17589 ?auto_17616 ) ) ( not ( = ?auto_17589 ?auto_17596 ) ) ( not ( = ?auto_17589 ?auto_17598 ) ) ( not ( = ?auto_17589 ?auto_17610 ) ) ( not ( = ?auto_17594 ?auto_17621 ) ) ( not ( = ?auto_17594 ?auto_17605 ) ) ( not ( = ?auto_17594 ?auto_17620 ) ) ( not ( = ?auto_17594 ?auto_17601 ) ) ( not ( = ?auto_17594 ?auto_17612 ) ) ( not ( = ?auto_17594 ?auto_17611 ) ) ( not ( = ?auto_17594 ?auto_17609 ) ) ( not ( = ?auto_17594 ?auto_17607 ) ) ( not ( = ?auto_17594 ?auto_17602 ) ) ( not ( = ?auto_17594 ?auto_17603 ) ) ( not ( = ?auto_17590 ?auto_17625 ) ) ( not ( = ?auto_17590 ?auto_17597 ) ) ( not ( = ?auto_17590 ?auto_17617 ) ) ( not ( = ?auto_17590 ?auto_17624 ) ) ( not ( = ?auto_17590 ?auto_17618 ) ) ( not ( = ?auto_17590 ?auto_17606 ) ) ( not ( = ?auto_17590 ?auto_17619 ) ) ( not ( = ?auto_17590 ?auto_17604 ) ) ( not ( = ?auto_17590 ?auto_17599 ) ) ( not ( = ?auto_17590 ?auto_17614 ) ) ( not ( = ?auto_17595 ?auto_17623 ) ) ( not ( = ?auto_17595 ?auto_17600 ) ) ( not ( = ?auto_17595 ?auto_17626 ) ) ( not ( = ?auto_17595 ?auto_17613 ) ) ( not ( = ?auto_17595 ?auto_17608 ) ) ( not ( = ?auto_17595 ?auto_17615 ) ) ( not ( = ?auto_17595 ?auto_17622 ) ) ( not ( = ?auto_17595 ?auto_17616 ) ) ( not ( = ?auto_17595 ?auto_17596 ) ) ( not ( = ?auto_17595 ?auto_17598 ) ) ( not ( = ?auto_17595 ?auto_17610 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_17577 ?auto_17578 ?auto_17579 ?auto_17580 ?auto_17581 ?auto_17582 ?auto_17585 ?auto_17584 ?auto_17583 ?auto_17586 ?auto_17588 ?auto_17587 )
      ( MAKE-1CRATE ?auto_17587 ?auto_17589 )
      ( MAKE-12CRATE-VERIFY ?auto_17577 ?auto_17578 ?auto_17579 ?auto_17580 ?auto_17581 ?auto_17582 ?auto_17585 ?auto_17584 ?auto_17583 ?auto_17586 ?auto_17588 ?auto_17587 ?auto_17589 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17629 - SURFACE
      ?auto_17630 - SURFACE
    )
    :vars
    (
      ?auto_17631 - HOIST
      ?auto_17632 - PLACE
      ?auto_17634 - PLACE
      ?auto_17635 - HOIST
      ?auto_17636 - SURFACE
      ?auto_17633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17631 ?auto_17632 ) ( SURFACE-AT ?auto_17629 ?auto_17632 ) ( CLEAR ?auto_17629 ) ( IS-CRATE ?auto_17630 ) ( AVAILABLE ?auto_17631 ) ( not ( = ?auto_17634 ?auto_17632 ) ) ( HOIST-AT ?auto_17635 ?auto_17634 ) ( AVAILABLE ?auto_17635 ) ( SURFACE-AT ?auto_17630 ?auto_17634 ) ( ON ?auto_17630 ?auto_17636 ) ( CLEAR ?auto_17630 ) ( TRUCK-AT ?auto_17633 ?auto_17632 ) ( not ( = ?auto_17629 ?auto_17630 ) ) ( not ( = ?auto_17629 ?auto_17636 ) ) ( not ( = ?auto_17630 ?auto_17636 ) ) ( not ( = ?auto_17631 ?auto_17635 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17633 ?auto_17632 ?auto_17634 )
      ( !LIFT ?auto_17635 ?auto_17630 ?auto_17636 ?auto_17634 )
      ( !LOAD ?auto_17635 ?auto_17630 ?auto_17633 ?auto_17634 )
      ( !DRIVE ?auto_17633 ?auto_17634 ?auto_17632 )
      ( !UNLOAD ?auto_17631 ?auto_17630 ?auto_17633 ?auto_17632 )
      ( !DROP ?auto_17631 ?auto_17630 ?auto_17629 ?auto_17632 )
      ( MAKE-1CRATE-VERIFY ?auto_17629 ?auto_17630 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_17651 - SURFACE
      ?auto_17652 - SURFACE
      ?auto_17653 - SURFACE
      ?auto_17654 - SURFACE
      ?auto_17655 - SURFACE
      ?auto_17656 - SURFACE
      ?auto_17659 - SURFACE
      ?auto_17658 - SURFACE
      ?auto_17657 - SURFACE
      ?auto_17660 - SURFACE
      ?auto_17662 - SURFACE
      ?auto_17661 - SURFACE
      ?auto_17663 - SURFACE
      ?auto_17664 - SURFACE
    )
    :vars
    (
      ?auto_17666 - HOIST
      ?auto_17670 - PLACE
      ?auto_17665 - PLACE
      ?auto_17667 - HOIST
      ?auto_17669 - SURFACE
      ?auto_17701 - PLACE
      ?auto_17677 - HOIST
      ?auto_17699 - SURFACE
      ?auto_17689 - PLACE
      ?auto_17679 - HOIST
      ?auto_17697 - SURFACE
      ?auto_17675 - PLACE
      ?auto_17684 - HOIST
      ?auto_17688 - SURFACE
      ?auto_17692 - PLACE
      ?auto_17676 - HOIST
      ?auto_17680 - SURFACE
      ?auto_17698 - SURFACE
      ?auto_17685 - PLACE
      ?auto_17693 - HOIST
      ?auto_17691 - SURFACE
      ?auto_17683 - PLACE
      ?auto_17672 - HOIST
      ?auto_17695 - SURFACE
      ?auto_17702 - PLACE
      ?auto_17687 - HOIST
      ?auto_17700 - SURFACE
      ?auto_17678 - PLACE
      ?auto_17682 - HOIST
      ?auto_17681 - SURFACE
      ?auto_17696 - PLACE
      ?auto_17673 - HOIST
      ?auto_17686 - SURFACE
      ?auto_17671 - PLACE
      ?auto_17690 - HOIST
      ?auto_17674 - SURFACE
      ?auto_17694 - SURFACE
      ?auto_17668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17666 ?auto_17670 ) ( IS-CRATE ?auto_17664 ) ( not ( = ?auto_17665 ?auto_17670 ) ) ( HOIST-AT ?auto_17667 ?auto_17665 ) ( SURFACE-AT ?auto_17664 ?auto_17665 ) ( ON ?auto_17664 ?auto_17669 ) ( CLEAR ?auto_17664 ) ( not ( = ?auto_17663 ?auto_17664 ) ) ( not ( = ?auto_17663 ?auto_17669 ) ) ( not ( = ?auto_17664 ?auto_17669 ) ) ( not ( = ?auto_17666 ?auto_17667 ) ) ( IS-CRATE ?auto_17663 ) ( not ( = ?auto_17701 ?auto_17670 ) ) ( HOIST-AT ?auto_17677 ?auto_17701 ) ( AVAILABLE ?auto_17677 ) ( SURFACE-AT ?auto_17663 ?auto_17701 ) ( ON ?auto_17663 ?auto_17699 ) ( CLEAR ?auto_17663 ) ( not ( = ?auto_17661 ?auto_17663 ) ) ( not ( = ?auto_17661 ?auto_17699 ) ) ( not ( = ?auto_17663 ?auto_17699 ) ) ( not ( = ?auto_17666 ?auto_17677 ) ) ( IS-CRATE ?auto_17661 ) ( not ( = ?auto_17689 ?auto_17670 ) ) ( HOIST-AT ?auto_17679 ?auto_17689 ) ( AVAILABLE ?auto_17679 ) ( SURFACE-AT ?auto_17661 ?auto_17689 ) ( ON ?auto_17661 ?auto_17697 ) ( CLEAR ?auto_17661 ) ( not ( = ?auto_17662 ?auto_17661 ) ) ( not ( = ?auto_17662 ?auto_17697 ) ) ( not ( = ?auto_17661 ?auto_17697 ) ) ( not ( = ?auto_17666 ?auto_17679 ) ) ( IS-CRATE ?auto_17662 ) ( not ( = ?auto_17675 ?auto_17670 ) ) ( HOIST-AT ?auto_17684 ?auto_17675 ) ( AVAILABLE ?auto_17684 ) ( SURFACE-AT ?auto_17662 ?auto_17675 ) ( ON ?auto_17662 ?auto_17688 ) ( CLEAR ?auto_17662 ) ( not ( = ?auto_17660 ?auto_17662 ) ) ( not ( = ?auto_17660 ?auto_17688 ) ) ( not ( = ?auto_17662 ?auto_17688 ) ) ( not ( = ?auto_17666 ?auto_17684 ) ) ( IS-CRATE ?auto_17660 ) ( not ( = ?auto_17692 ?auto_17670 ) ) ( HOIST-AT ?auto_17676 ?auto_17692 ) ( AVAILABLE ?auto_17676 ) ( SURFACE-AT ?auto_17660 ?auto_17692 ) ( ON ?auto_17660 ?auto_17680 ) ( CLEAR ?auto_17660 ) ( not ( = ?auto_17657 ?auto_17660 ) ) ( not ( = ?auto_17657 ?auto_17680 ) ) ( not ( = ?auto_17660 ?auto_17680 ) ) ( not ( = ?auto_17666 ?auto_17676 ) ) ( IS-CRATE ?auto_17657 ) ( AVAILABLE ?auto_17667 ) ( SURFACE-AT ?auto_17657 ?auto_17665 ) ( ON ?auto_17657 ?auto_17698 ) ( CLEAR ?auto_17657 ) ( not ( = ?auto_17658 ?auto_17657 ) ) ( not ( = ?auto_17658 ?auto_17698 ) ) ( not ( = ?auto_17657 ?auto_17698 ) ) ( IS-CRATE ?auto_17658 ) ( not ( = ?auto_17685 ?auto_17670 ) ) ( HOIST-AT ?auto_17693 ?auto_17685 ) ( AVAILABLE ?auto_17693 ) ( SURFACE-AT ?auto_17658 ?auto_17685 ) ( ON ?auto_17658 ?auto_17691 ) ( CLEAR ?auto_17658 ) ( not ( = ?auto_17659 ?auto_17658 ) ) ( not ( = ?auto_17659 ?auto_17691 ) ) ( not ( = ?auto_17658 ?auto_17691 ) ) ( not ( = ?auto_17666 ?auto_17693 ) ) ( IS-CRATE ?auto_17659 ) ( not ( = ?auto_17683 ?auto_17670 ) ) ( HOIST-AT ?auto_17672 ?auto_17683 ) ( AVAILABLE ?auto_17672 ) ( SURFACE-AT ?auto_17659 ?auto_17683 ) ( ON ?auto_17659 ?auto_17695 ) ( CLEAR ?auto_17659 ) ( not ( = ?auto_17656 ?auto_17659 ) ) ( not ( = ?auto_17656 ?auto_17695 ) ) ( not ( = ?auto_17659 ?auto_17695 ) ) ( not ( = ?auto_17666 ?auto_17672 ) ) ( IS-CRATE ?auto_17656 ) ( not ( = ?auto_17702 ?auto_17670 ) ) ( HOIST-AT ?auto_17687 ?auto_17702 ) ( AVAILABLE ?auto_17687 ) ( SURFACE-AT ?auto_17656 ?auto_17702 ) ( ON ?auto_17656 ?auto_17700 ) ( CLEAR ?auto_17656 ) ( not ( = ?auto_17655 ?auto_17656 ) ) ( not ( = ?auto_17655 ?auto_17700 ) ) ( not ( = ?auto_17656 ?auto_17700 ) ) ( not ( = ?auto_17666 ?auto_17687 ) ) ( IS-CRATE ?auto_17655 ) ( not ( = ?auto_17678 ?auto_17670 ) ) ( HOIST-AT ?auto_17682 ?auto_17678 ) ( AVAILABLE ?auto_17682 ) ( SURFACE-AT ?auto_17655 ?auto_17678 ) ( ON ?auto_17655 ?auto_17681 ) ( CLEAR ?auto_17655 ) ( not ( = ?auto_17654 ?auto_17655 ) ) ( not ( = ?auto_17654 ?auto_17681 ) ) ( not ( = ?auto_17655 ?auto_17681 ) ) ( not ( = ?auto_17666 ?auto_17682 ) ) ( IS-CRATE ?auto_17654 ) ( not ( = ?auto_17696 ?auto_17670 ) ) ( HOIST-AT ?auto_17673 ?auto_17696 ) ( SURFACE-AT ?auto_17654 ?auto_17696 ) ( ON ?auto_17654 ?auto_17686 ) ( CLEAR ?auto_17654 ) ( not ( = ?auto_17653 ?auto_17654 ) ) ( not ( = ?auto_17653 ?auto_17686 ) ) ( not ( = ?auto_17654 ?auto_17686 ) ) ( not ( = ?auto_17666 ?auto_17673 ) ) ( IS-CRATE ?auto_17653 ) ( not ( = ?auto_17671 ?auto_17670 ) ) ( HOIST-AT ?auto_17690 ?auto_17671 ) ( AVAILABLE ?auto_17690 ) ( SURFACE-AT ?auto_17653 ?auto_17671 ) ( ON ?auto_17653 ?auto_17674 ) ( CLEAR ?auto_17653 ) ( not ( = ?auto_17652 ?auto_17653 ) ) ( not ( = ?auto_17652 ?auto_17674 ) ) ( not ( = ?auto_17653 ?auto_17674 ) ) ( not ( = ?auto_17666 ?auto_17690 ) ) ( SURFACE-AT ?auto_17651 ?auto_17670 ) ( CLEAR ?auto_17651 ) ( IS-CRATE ?auto_17652 ) ( AVAILABLE ?auto_17666 ) ( AVAILABLE ?auto_17673 ) ( SURFACE-AT ?auto_17652 ?auto_17696 ) ( ON ?auto_17652 ?auto_17694 ) ( CLEAR ?auto_17652 ) ( TRUCK-AT ?auto_17668 ?auto_17670 ) ( not ( = ?auto_17651 ?auto_17652 ) ) ( not ( = ?auto_17651 ?auto_17694 ) ) ( not ( = ?auto_17652 ?auto_17694 ) ) ( not ( = ?auto_17651 ?auto_17653 ) ) ( not ( = ?auto_17651 ?auto_17674 ) ) ( not ( = ?auto_17653 ?auto_17694 ) ) ( not ( = ?auto_17671 ?auto_17696 ) ) ( not ( = ?auto_17690 ?auto_17673 ) ) ( not ( = ?auto_17674 ?auto_17694 ) ) ( not ( = ?auto_17651 ?auto_17654 ) ) ( not ( = ?auto_17651 ?auto_17686 ) ) ( not ( = ?auto_17652 ?auto_17654 ) ) ( not ( = ?auto_17652 ?auto_17686 ) ) ( not ( = ?auto_17654 ?auto_17674 ) ) ( not ( = ?auto_17654 ?auto_17694 ) ) ( not ( = ?auto_17686 ?auto_17674 ) ) ( not ( = ?auto_17686 ?auto_17694 ) ) ( not ( = ?auto_17651 ?auto_17655 ) ) ( not ( = ?auto_17651 ?auto_17681 ) ) ( not ( = ?auto_17652 ?auto_17655 ) ) ( not ( = ?auto_17652 ?auto_17681 ) ) ( not ( = ?auto_17653 ?auto_17655 ) ) ( not ( = ?auto_17653 ?auto_17681 ) ) ( not ( = ?auto_17655 ?auto_17686 ) ) ( not ( = ?auto_17655 ?auto_17674 ) ) ( not ( = ?auto_17655 ?auto_17694 ) ) ( not ( = ?auto_17678 ?auto_17696 ) ) ( not ( = ?auto_17678 ?auto_17671 ) ) ( not ( = ?auto_17682 ?auto_17673 ) ) ( not ( = ?auto_17682 ?auto_17690 ) ) ( not ( = ?auto_17681 ?auto_17686 ) ) ( not ( = ?auto_17681 ?auto_17674 ) ) ( not ( = ?auto_17681 ?auto_17694 ) ) ( not ( = ?auto_17651 ?auto_17656 ) ) ( not ( = ?auto_17651 ?auto_17700 ) ) ( not ( = ?auto_17652 ?auto_17656 ) ) ( not ( = ?auto_17652 ?auto_17700 ) ) ( not ( = ?auto_17653 ?auto_17656 ) ) ( not ( = ?auto_17653 ?auto_17700 ) ) ( not ( = ?auto_17654 ?auto_17656 ) ) ( not ( = ?auto_17654 ?auto_17700 ) ) ( not ( = ?auto_17656 ?auto_17681 ) ) ( not ( = ?auto_17656 ?auto_17686 ) ) ( not ( = ?auto_17656 ?auto_17674 ) ) ( not ( = ?auto_17656 ?auto_17694 ) ) ( not ( = ?auto_17702 ?auto_17678 ) ) ( not ( = ?auto_17702 ?auto_17696 ) ) ( not ( = ?auto_17702 ?auto_17671 ) ) ( not ( = ?auto_17687 ?auto_17682 ) ) ( not ( = ?auto_17687 ?auto_17673 ) ) ( not ( = ?auto_17687 ?auto_17690 ) ) ( not ( = ?auto_17700 ?auto_17681 ) ) ( not ( = ?auto_17700 ?auto_17686 ) ) ( not ( = ?auto_17700 ?auto_17674 ) ) ( not ( = ?auto_17700 ?auto_17694 ) ) ( not ( = ?auto_17651 ?auto_17659 ) ) ( not ( = ?auto_17651 ?auto_17695 ) ) ( not ( = ?auto_17652 ?auto_17659 ) ) ( not ( = ?auto_17652 ?auto_17695 ) ) ( not ( = ?auto_17653 ?auto_17659 ) ) ( not ( = ?auto_17653 ?auto_17695 ) ) ( not ( = ?auto_17654 ?auto_17659 ) ) ( not ( = ?auto_17654 ?auto_17695 ) ) ( not ( = ?auto_17655 ?auto_17659 ) ) ( not ( = ?auto_17655 ?auto_17695 ) ) ( not ( = ?auto_17659 ?auto_17700 ) ) ( not ( = ?auto_17659 ?auto_17681 ) ) ( not ( = ?auto_17659 ?auto_17686 ) ) ( not ( = ?auto_17659 ?auto_17674 ) ) ( not ( = ?auto_17659 ?auto_17694 ) ) ( not ( = ?auto_17683 ?auto_17702 ) ) ( not ( = ?auto_17683 ?auto_17678 ) ) ( not ( = ?auto_17683 ?auto_17696 ) ) ( not ( = ?auto_17683 ?auto_17671 ) ) ( not ( = ?auto_17672 ?auto_17687 ) ) ( not ( = ?auto_17672 ?auto_17682 ) ) ( not ( = ?auto_17672 ?auto_17673 ) ) ( not ( = ?auto_17672 ?auto_17690 ) ) ( not ( = ?auto_17695 ?auto_17700 ) ) ( not ( = ?auto_17695 ?auto_17681 ) ) ( not ( = ?auto_17695 ?auto_17686 ) ) ( not ( = ?auto_17695 ?auto_17674 ) ) ( not ( = ?auto_17695 ?auto_17694 ) ) ( not ( = ?auto_17651 ?auto_17658 ) ) ( not ( = ?auto_17651 ?auto_17691 ) ) ( not ( = ?auto_17652 ?auto_17658 ) ) ( not ( = ?auto_17652 ?auto_17691 ) ) ( not ( = ?auto_17653 ?auto_17658 ) ) ( not ( = ?auto_17653 ?auto_17691 ) ) ( not ( = ?auto_17654 ?auto_17658 ) ) ( not ( = ?auto_17654 ?auto_17691 ) ) ( not ( = ?auto_17655 ?auto_17658 ) ) ( not ( = ?auto_17655 ?auto_17691 ) ) ( not ( = ?auto_17656 ?auto_17658 ) ) ( not ( = ?auto_17656 ?auto_17691 ) ) ( not ( = ?auto_17658 ?auto_17695 ) ) ( not ( = ?auto_17658 ?auto_17700 ) ) ( not ( = ?auto_17658 ?auto_17681 ) ) ( not ( = ?auto_17658 ?auto_17686 ) ) ( not ( = ?auto_17658 ?auto_17674 ) ) ( not ( = ?auto_17658 ?auto_17694 ) ) ( not ( = ?auto_17685 ?auto_17683 ) ) ( not ( = ?auto_17685 ?auto_17702 ) ) ( not ( = ?auto_17685 ?auto_17678 ) ) ( not ( = ?auto_17685 ?auto_17696 ) ) ( not ( = ?auto_17685 ?auto_17671 ) ) ( not ( = ?auto_17693 ?auto_17672 ) ) ( not ( = ?auto_17693 ?auto_17687 ) ) ( not ( = ?auto_17693 ?auto_17682 ) ) ( not ( = ?auto_17693 ?auto_17673 ) ) ( not ( = ?auto_17693 ?auto_17690 ) ) ( not ( = ?auto_17691 ?auto_17695 ) ) ( not ( = ?auto_17691 ?auto_17700 ) ) ( not ( = ?auto_17691 ?auto_17681 ) ) ( not ( = ?auto_17691 ?auto_17686 ) ) ( not ( = ?auto_17691 ?auto_17674 ) ) ( not ( = ?auto_17691 ?auto_17694 ) ) ( not ( = ?auto_17651 ?auto_17657 ) ) ( not ( = ?auto_17651 ?auto_17698 ) ) ( not ( = ?auto_17652 ?auto_17657 ) ) ( not ( = ?auto_17652 ?auto_17698 ) ) ( not ( = ?auto_17653 ?auto_17657 ) ) ( not ( = ?auto_17653 ?auto_17698 ) ) ( not ( = ?auto_17654 ?auto_17657 ) ) ( not ( = ?auto_17654 ?auto_17698 ) ) ( not ( = ?auto_17655 ?auto_17657 ) ) ( not ( = ?auto_17655 ?auto_17698 ) ) ( not ( = ?auto_17656 ?auto_17657 ) ) ( not ( = ?auto_17656 ?auto_17698 ) ) ( not ( = ?auto_17659 ?auto_17657 ) ) ( not ( = ?auto_17659 ?auto_17698 ) ) ( not ( = ?auto_17657 ?auto_17691 ) ) ( not ( = ?auto_17657 ?auto_17695 ) ) ( not ( = ?auto_17657 ?auto_17700 ) ) ( not ( = ?auto_17657 ?auto_17681 ) ) ( not ( = ?auto_17657 ?auto_17686 ) ) ( not ( = ?auto_17657 ?auto_17674 ) ) ( not ( = ?auto_17657 ?auto_17694 ) ) ( not ( = ?auto_17665 ?auto_17685 ) ) ( not ( = ?auto_17665 ?auto_17683 ) ) ( not ( = ?auto_17665 ?auto_17702 ) ) ( not ( = ?auto_17665 ?auto_17678 ) ) ( not ( = ?auto_17665 ?auto_17696 ) ) ( not ( = ?auto_17665 ?auto_17671 ) ) ( not ( = ?auto_17667 ?auto_17693 ) ) ( not ( = ?auto_17667 ?auto_17672 ) ) ( not ( = ?auto_17667 ?auto_17687 ) ) ( not ( = ?auto_17667 ?auto_17682 ) ) ( not ( = ?auto_17667 ?auto_17673 ) ) ( not ( = ?auto_17667 ?auto_17690 ) ) ( not ( = ?auto_17698 ?auto_17691 ) ) ( not ( = ?auto_17698 ?auto_17695 ) ) ( not ( = ?auto_17698 ?auto_17700 ) ) ( not ( = ?auto_17698 ?auto_17681 ) ) ( not ( = ?auto_17698 ?auto_17686 ) ) ( not ( = ?auto_17698 ?auto_17674 ) ) ( not ( = ?auto_17698 ?auto_17694 ) ) ( not ( = ?auto_17651 ?auto_17660 ) ) ( not ( = ?auto_17651 ?auto_17680 ) ) ( not ( = ?auto_17652 ?auto_17660 ) ) ( not ( = ?auto_17652 ?auto_17680 ) ) ( not ( = ?auto_17653 ?auto_17660 ) ) ( not ( = ?auto_17653 ?auto_17680 ) ) ( not ( = ?auto_17654 ?auto_17660 ) ) ( not ( = ?auto_17654 ?auto_17680 ) ) ( not ( = ?auto_17655 ?auto_17660 ) ) ( not ( = ?auto_17655 ?auto_17680 ) ) ( not ( = ?auto_17656 ?auto_17660 ) ) ( not ( = ?auto_17656 ?auto_17680 ) ) ( not ( = ?auto_17659 ?auto_17660 ) ) ( not ( = ?auto_17659 ?auto_17680 ) ) ( not ( = ?auto_17658 ?auto_17660 ) ) ( not ( = ?auto_17658 ?auto_17680 ) ) ( not ( = ?auto_17660 ?auto_17698 ) ) ( not ( = ?auto_17660 ?auto_17691 ) ) ( not ( = ?auto_17660 ?auto_17695 ) ) ( not ( = ?auto_17660 ?auto_17700 ) ) ( not ( = ?auto_17660 ?auto_17681 ) ) ( not ( = ?auto_17660 ?auto_17686 ) ) ( not ( = ?auto_17660 ?auto_17674 ) ) ( not ( = ?auto_17660 ?auto_17694 ) ) ( not ( = ?auto_17692 ?auto_17665 ) ) ( not ( = ?auto_17692 ?auto_17685 ) ) ( not ( = ?auto_17692 ?auto_17683 ) ) ( not ( = ?auto_17692 ?auto_17702 ) ) ( not ( = ?auto_17692 ?auto_17678 ) ) ( not ( = ?auto_17692 ?auto_17696 ) ) ( not ( = ?auto_17692 ?auto_17671 ) ) ( not ( = ?auto_17676 ?auto_17667 ) ) ( not ( = ?auto_17676 ?auto_17693 ) ) ( not ( = ?auto_17676 ?auto_17672 ) ) ( not ( = ?auto_17676 ?auto_17687 ) ) ( not ( = ?auto_17676 ?auto_17682 ) ) ( not ( = ?auto_17676 ?auto_17673 ) ) ( not ( = ?auto_17676 ?auto_17690 ) ) ( not ( = ?auto_17680 ?auto_17698 ) ) ( not ( = ?auto_17680 ?auto_17691 ) ) ( not ( = ?auto_17680 ?auto_17695 ) ) ( not ( = ?auto_17680 ?auto_17700 ) ) ( not ( = ?auto_17680 ?auto_17681 ) ) ( not ( = ?auto_17680 ?auto_17686 ) ) ( not ( = ?auto_17680 ?auto_17674 ) ) ( not ( = ?auto_17680 ?auto_17694 ) ) ( not ( = ?auto_17651 ?auto_17662 ) ) ( not ( = ?auto_17651 ?auto_17688 ) ) ( not ( = ?auto_17652 ?auto_17662 ) ) ( not ( = ?auto_17652 ?auto_17688 ) ) ( not ( = ?auto_17653 ?auto_17662 ) ) ( not ( = ?auto_17653 ?auto_17688 ) ) ( not ( = ?auto_17654 ?auto_17662 ) ) ( not ( = ?auto_17654 ?auto_17688 ) ) ( not ( = ?auto_17655 ?auto_17662 ) ) ( not ( = ?auto_17655 ?auto_17688 ) ) ( not ( = ?auto_17656 ?auto_17662 ) ) ( not ( = ?auto_17656 ?auto_17688 ) ) ( not ( = ?auto_17659 ?auto_17662 ) ) ( not ( = ?auto_17659 ?auto_17688 ) ) ( not ( = ?auto_17658 ?auto_17662 ) ) ( not ( = ?auto_17658 ?auto_17688 ) ) ( not ( = ?auto_17657 ?auto_17662 ) ) ( not ( = ?auto_17657 ?auto_17688 ) ) ( not ( = ?auto_17662 ?auto_17680 ) ) ( not ( = ?auto_17662 ?auto_17698 ) ) ( not ( = ?auto_17662 ?auto_17691 ) ) ( not ( = ?auto_17662 ?auto_17695 ) ) ( not ( = ?auto_17662 ?auto_17700 ) ) ( not ( = ?auto_17662 ?auto_17681 ) ) ( not ( = ?auto_17662 ?auto_17686 ) ) ( not ( = ?auto_17662 ?auto_17674 ) ) ( not ( = ?auto_17662 ?auto_17694 ) ) ( not ( = ?auto_17675 ?auto_17692 ) ) ( not ( = ?auto_17675 ?auto_17665 ) ) ( not ( = ?auto_17675 ?auto_17685 ) ) ( not ( = ?auto_17675 ?auto_17683 ) ) ( not ( = ?auto_17675 ?auto_17702 ) ) ( not ( = ?auto_17675 ?auto_17678 ) ) ( not ( = ?auto_17675 ?auto_17696 ) ) ( not ( = ?auto_17675 ?auto_17671 ) ) ( not ( = ?auto_17684 ?auto_17676 ) ) ( not ( = ?auto_17684 ?auto_17667 ) ) ( not ( = ?auto_17684 ?auto_17693 ) ) ( not ( = ?auto_17684 ?auto_17672 ) ) ( not ( = ?auto_17684 ?auto_17687 ) ) ( not ( = ?auto_17684 ?auto_17682 ) ) ( not ( = ?auto_17684 ?auto_17673 ) ) ( not ( = ?auto_17684 ?auto_17690 ) ) ( not ( = ?auto_17688 ?auto_17680 ) ) ( not ( = ?auto_17688 ?auto_17698 ) ) ( not ( = ?auto_17688 ?auto_17691 ) ) ( not ( = ?auto_17688 ?auto_17695 ) ) ( not ( = ?auto_17688 ?auto_17700 ) ) ( not ( = ?auto_17688 ?auto_17681 ) ) ( not ( = ?auto_17688 ?auto_17686 ) ) ( not ( = ?auto_17688 ?auto_17674 ) ) ( not ( = ?auto_17688 ?auto_17694 ) ) ( not ( = ?auto_17651 ?auto_17661 ) ) ( not ( = ?auto_17651 ?auto_17697 ) ) ( not ( = ?auto_17652 ?auto_17661 ) ) ( not ( = ?auto_17652 ?auto_17697 ) ) ( not ( = ?auto_17653 ?auto_17661 ) ) ( not ( = ?auto_17653 ?auto_17697 ) ) ( not ( = ?auto_17654 ?auto_17661 ) ) ( not ( = ?auto_17654 ?auto_17697 ) ) ( not ( = ?auto_17655 ?auto_17661 ) ) ( not ( = ?auto_17655 ?auto_17697 ) ) ( not ( = ?auto_17656 ?auto_17661 ) ) ( not ( = ?auto_17656 ?auto_17697 ) ) ( not ( = ?auto_17659 ?auto_17661 ) ) ( not ( = ?auto_17659 ?auto_17697 ) ) ( not ( = ?auto_17658 ?auto_17661 ) ) ( not ( = ?auto_17658 ?auto_17697 ) ) ( not ( = ?auto_17657 ?auto_17661 ) ) ( not ( = ?auto_17657 ?auto_17697 ) ) ( not ( = ?auto_17660 ?auto_17661 ) ) ( not ( = ?auto_17660 ?auto_17697 ) ) ( not ( = ?auto_17661 ?auto_17688 ) ) ( not ( = ?auto_17661 ?auto_17680 ) ) ( not ( = ?auto_17661 ?auto_17698 ) ) ( not ( = ?auto_17661 ?auto_17691 ) ) ( not ( = ?auto_17661 ?auto_17695 ) ) ( not ( = ?auto_17661 ?auto_17700 ) ) ( not ( = ?auto_17661 ?auto_17681 ) ) ( not ( = ?auto_17661 ?auto_17686 ) ) ( not ( = ?auto_17661 ?auto_17674 ) ) ( not ( = ?auto_17661 ?auto_17694 ) ) ( not ( = ?auto_17689 ?auto_17675 ) ) ( not ( = ?auto_17689 ?auto_17692 ) ) ( not ( = ?auto_17689 ?auto_17665 ) ) ( not ( = ?auto_17689 ?auto_17685 ) ) ( not ( = ?auto_17689 ?auto_17683 ) ) ( not ( = ?auto_17689 ?auto_17702 ) ) ( not ( = ?auto_17689 ?auto_17678 ) ) ( not ( = ?auto_17689 ?auto_17696 ) ) ( not ( = ?auto_17689 ?auto_17671 ) ) ( not ( = ?auto_17679 ?auto_17684 ) ) ( not ( = ?auto_17679 ?auto_17676 ) ) ( not ( = ?auto_17679 ?auto_17667 ) ) ( not ( = ?auto_17679 ?auto_17693 ) ) ( not ( = ?auto_17679 ?auto_17672 ) ) ( not ( = ?auto_17679 ?auto_17687 ) ) ( not ( = ?auto_17679 ?auto_17682 ) ) ( not ( = ?auto_17679 ?auto_17673 ) ) ( not ( = ?auto_17679 ?auto_17690 ) ) ( not ( = ?auto_17697 ?auto_17688 ) ) ( not ( = ?auto_17697 ?auto_17680 ) ) ( not ( = ?auto_17697 ?auto_17698 ) ) ( not ( = ?auto_17697 ?auto_17691 ) ) ( not ( = ?auto_17697 ?auto_17695 ) ) ( not ( = ?auto_17697 ?auto_17700 ) ) ( not ( = ?auto_17697 ?auto_17681 ) ) ( not ( = ?auto_17697 ?auto_17686 ) ) ( not ( = ?auto_17697 ?auto_17674 ) ) ( not ( = ?auto_17697 ?auto_17694 ) ) ( not ( = ?auto_17651 ?auto_17663 ) ) ( not ( = ?auto_17651 ?auto_17699 ) ) ( not ( = ?auto_17652 ?auto_17663 ) ) ( not ( = ?auto_17652 ?auto_17699 ) ) ( not ( = ?auto_17653 ?auto_17663 ) ) ( not ( = ?auto_17653 ?auto_17699 ) ) ( not ( = ?auto_17654 ?auto_17663 ) ) ( not ( = ?auto_17654 ?auto_17699 ) ) ( not ( = ?auto_17655 ?auto_17663 ) ) ( not ( = ?auto_17655 ?auto_17699 ) ) ( not ( = ?auto_17656 ?auto_17663 ) ) ( not ( = ?auto_17656 ?auto_17699 ) ) ( not ( = ?auto_17659 ?auto_17663 ) ) ( not ( = ?auto_17659 ?auto_17699 ) ) ( not ( = ?auto_17658 ?auto_17663 ) ) ( not ( = ?auto_17658 ?auto_17699 ) ) ( not ( = ?auto_17657 ?auto_17663 ) ) ( not ( = ?auto_17657 ?auto_17699 ) ) ( not ( = ?auto_17660 ?auto_17663 ) ) ( not ( = ?auto_17660 ?auto_17699 ) ) ( not ( = ?auto_17662 ?auto_17663 ) ) ( not ( = ?auto_17662 ?auto_17699 ) ) ( not ( = ?auto_17663 ?auto_17697 ) ) ( not ( = ?auto_17663 ?auto_17688 ) ) ( not ( = ?auto_17663 ?auto_17680 ) ) ( not ( = ?auto_17663 ?auto_17698 ) ) ( not ( = ?auto_17663 ?auto_17691 ) ) ( not ( = ?auto_17663 ?auto_17695 ) ) ( not ( = ?auto_17663 ?auto_17700 ) ) ( not ( = ?auto_17663 ?auto_17681 ) ) ( not ( = ?auto_17663 ?auto_17686 ) ) ( not ( = ?auto_17663 ?auto_17674 ) ) ( not ( = ?auto_17663 ?auto_17694 ) ) ( not ( = ?auto_17701 ?auto_17689 ) ) ( not ( = ?auto_17701 ?auto_17675 ) ) ( not ( = ?auto_17701 ?auto_17692 ) ) ( not ( = ?auto_17701 ?auto_17665 ) ) ( not ( = ?auto_17701 ?auto_17685 ) ) ( not ( = ?auto_17701 ?auto_17683 ) ) ( not ( = ?auto_17701 ?auto_17702 ) ) ( not ( = ?auto_17701 ?auto_17678 ) ) ( not ( = ?auto_17701 ?auto_17696 ) ) ( not ( = ?auto_17701 ?auto_17671 ) ) ( not ( = ?auto_17677 ?auto_17679 ) ) ( not ( = ?auto_17677 ?auto_17684 ) ) ( not ( = ?auto_17677 ?auto_17676 ) ) ( not ( = ?auto_17677 ?auto_17667 ) ) ( not ( = ?auto_17677 ?auto_17693 ) ) ( not ( = ?auto_17677 ?auto_17672 ) ) ( not ( = ?auto_17677 ?auto_17687 ) ) ( not ( = ?auto_17677 ?auto_17682 ) ) ( not ( = ?auto_17677 ?auto_17673 ) ) ( not ( = ?auto_17677 ?auto_17690 ) ) ( not ( = ?auto_17699 ?auto_17697 ) ) ( not ( = ?auto_17699 ?auto_17688 ) ) ( not ( = ?auto_17699 ?auto_17680 ) ) ( not ( = ?auto_17699 ?auto_17698 ) ) ( not ( = ?auto_17699 ?auto_17691 ) ) ( not ( = ?auto_17699 ?auto_17695 ) ) ( not ( = ?auto_17699 ?auto_17700 ) ) ( not ( = ?auto_17699 ?auto_17681 ) ) ( not ( = ?auto_17699 ?auto_17686 ) ) ( not ( = ?auto_17699 ?auto_17674 ) ) ( not ( = ?auto_17699 ?auto_17694 ) ) ( not ( = ?auto_17651 ?auto_17664 ) ) ( not ( = ?auto_17651 ?auto_17669 ) ) ( not ( = ?auto_17652 ?auto_17664 ) ) ( not ( = ?auto_17652 ?auto_17669 ) ) ( not ( = ?auto_17653 ?auto_17664 ) ) ( not ( = ?auto_17653 ?auto_17669 ) ) ( not ( = ?auto_17654 ?auto_17664 ) ) ( not ( = ?auto_17654 ?auto_17669 ) ) ( not ( = ?auto_17655 ?auto_17664 ) ) ( not ( = ?auto_17655 ?auto_17669 ) ) ( not ( = ?auto_17656 ?auto_17664 ) ) ( not ( = ?auto_17656 ?auto_17669 ) ) ( not ( = ?auto_17659 ?auto_17664 ) ) ( not ( = ?auto_17659 ?auto_17669 ) ) ( not ( = ?auto_17658 ?auto_17664 ) ) ( not ( = ?auto_17658 ?auto_17669 ) ) ( not ( = ?auto_17657 ?auto_17664 ) ) ( not ( = ?auto_17657 ?auto_17669 ) ) ( not ( = ?auto_17660 ?auto_17664 ) ) ( not ( = ?auto_17660 ?auto_17669 ) ) ( not ( = ?auto_17662 ?auto_17664 ) ) ( not ( = ?auto_17662 ?auto_17669 ) ) ( not ( = ?auto_17661 ?auto_17664 ) ) ( not ( = ?auto_17661 ?auto_17669 ) ) ( not ( = ?auto_17664 ?auto_17699 ) ) ( not ( = ?auto_17664 ?auto_17697 ) ) ( not ( = ?auto_17664 ?auto_17688 ) ) ( not ( = ?auto_17664 ?auto_17680 ) ) ( not ( = ?auto_17664 ?auto_17698 ) ) ( not ( = ?auto_17664 ?auto_17691 ) ) ( not ( = ?auto_17664 ?auto_17695 ) ) ( not ( = ?auto_17664 ?auto_17700 ) ) ( not ( = ?auto_17664 ?auto_17681 ) ) ( not ( = ?auto_17664 ?auto_17686 ) ) ( not ( = ?auto_17664 ?auto_17674 ) ) ( not ( = ?auto_17664 ?auto_17694 ) ) ( not ( = ?auto_17669 ?auto_17699 ) ) ( not ( = ?auto_17669 ?auto_17697 ) ) ( not ( = ?auto_17669 ?auto_17688 ) ) ( not ( = ?auto_17669 ?auto_17680 ) ) ( not ( = ?auto_17669 ?auto_17698 ) ) ( not ( = ?auto_17669 ?auto_17691 ) ) ( not ( = ?auto_17669 ?auto_17695 ) ) ( not ( = ?auto_17669 ?auto_17700 ) ) ( not ( = ?auto_17669 ?auto_17681 ) ) ( not ( = ?auto_17669 ?auto_17686 ) ) ( not ( = ?auto_17669 ?auto_17674 ) ) ( not ( = ?auto_17669 ?auto_17694 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_17651 ?auto_17652 ?auto_17653 ?auto_17654 ?auto_17655 ?auto_17656 ?auto_17659 ?auto_17658 ?auto_17657 ?auto_17660 ?auto_17662 ?auto_17661 ?auto_17663 )
      ( MAKE-1CRATE ?auto_17663 ?auto_17664 )
      ( MAKE-13CRATE-VERIFY ?auto_17651 ?auto_17652 ?auto_17653 ?auto_17654 ?auto_17655 ?auto_17656 ?auto_17659 ?auto_17658 ?auto_17657 ?auto_17660 ?auto_17662 ?auto_17661 ?auto_17663 ?auto_17664 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17705 - SURFACE
      ?auto_17706 - SURFACE
    )
    :vars
    (
      ?auto_17707 - HOIST
      ?auto_17708 - PLACE
      ?auto_17710 - PLACE
      ?auto_17711 - HOIST
      ?auto_17712 - SURFACE
      ?auto_17709 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17707 ?auto_17708 ) ( SURFACE-AT ?auto_17705 ?auto_17708 ) ( CLEAR ?auto_17705 ) ( IS-CRATE ?auto_17706 ) ( AVAILABLE ?auto_17707 ) ( not ( = ?auto_17710 ?auto_17708 ) ) ( HOIST-AT ?auto_17711 ?auto_17710 ) ( AVAILABLE ?auto_17711 ) ( SURFACE-AT ?auto_17706 ?auto_17710 ) ( ON ?auto_17706 ?auto_17712 ) ( CLEAR ?auto_17706 ) ( TRUCK-AT ?auto_17709 ?auto_17708 ) ( not ( = ?auto_17705 ?auto_17706 ) ) ( not ( = ?auto_17705 ?auto_17712 ) ) ( not ( = ?auto_17706 ?auto_17712 ) ) ( not ( = ?auto_17707 ?auto_17711 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17709 ?auto_17708 ?auto_17710 )
      ( !LIFT ?auto_17711 ?auto_17706 ?auto_17712 ?auto_17710 )
      ( !LOAD ?auto_17711 ?auto_17706 ?auto_17709 ?auto_17710 )
      ( !DRIVE ?auto_17709 ?auto_17710 ?auto_17708 )
      ( !UNLOAD ?auto_17707 ?auto_17706 ?auto_17709 ?auto_17708 )
      ( !DROP ?auto_17707 ?auto_17706 ?auto_17705 ?auto_17708 )
      ( MAKE-1CRATE-VERIFY ?auto_17705 ?auto_17706 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_17728 - SURFACE
      ?auto_17729 - SURFACE
      ?auto_17730 - SURFACE
      ?auto_17731 - SURFACE
      ?auto_17732 - SURFACE
      ?auto_17733 - SURFACE
      ?auto_17736 - SURFACE
      ?auto_17735 - SURFACE
      ?auto_17734 - SURFACE
      ?auto_17737 - SURFACE
      ?auto_17739 - SURFACE
      ?auto_17738 - SURFACE
      ?auto_17740 - SURFACE
      ?auto_17742 - SURFACE
      ?auto_17741 - SURFACE
    )
    :vars
    (
      ?auto_17746 - HOIST
      ?auto_17744 - PLACE
      ?auto_17747 - PLACE
      ?auto_17748 - HOIST
      ?auto_17745 - SURFACE
      ?auto_17764 - PLACE
      ?auto_17781 - HOIST
      ?auto_17780 - SURFACE
      ?auto_17783 - PLACE
      ?auto_17765 - HOIST
      ?auto_17752 - SURFACE
      ?auto_17759 - PLACE
      ?auto_17753 - HOIST
      ?auto_17751 - SURFACE
      ?auto_17771 - PLACE
      ?auto_17754 - HOIST
      ?auto_17749 - SURFACE
      ?auto_17766 - PLACE
      ?auto_17782 - HOIST
      ?auto_17756 - SURFACE
      ?auto_17769 - SURFACE
      ?auto_17774 - PLACE
      ?auto_17779 - HOIST
      ?auto_17760 - SURFACE
      ?auto_17776 - PLACE
      ?auto_17772 - HOIST
      ?auto_17761 - SURFACE
      ?auto_17773 - PLACE
      ?auto_17767 - HOIST
      ?auto_17758 - SURFACE
      ?auto_17775 - PLACE
      ?auto_17768 - HOIST
      ?auto_17778 - SURFACE
      ?auto_17762 - PLACE
      ?auto_17755 - HOIST
      ?auto_17777 - SURFACE
      ?auto_17763 - PLACE
      ?auto_17750 - HOIST
      ?auto_17770 - SURFACE
      ?auto_17757 - SURFACE
      ?auto_17743 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17746 ?auto_17744 ) ( IS-CRATE ?auto_17741 ) ( not ( = ?auto_17747 ?auto_17744 ) ) ( HOIST-AT ?auto_17748 ?auto_17747 ) ( AVAILABLE ?auto_17748 ) ( SURFACE-AT ?auto_17741 ?auto_17747 ) ( ON ?auto_17741 ?auto_17745 ) ( CLEAR ?auto_17741 ) ( not ( = ?auto_17742 ?auto_17741 ) ) ( not ( = ?auto_17742 ?auto_17745 ) ) ( not ( = ?auto_17741 ?auto_17745 ) ) ( not ( = ?auto_17746 ?auto_17748 ) ) ( IS-CRATE ?auto_17742 ) ( not ( = ?auto_17764 ?auto_17744 ) ) ( HOIST-AT ?auto_17781 ?auto_17764 ) ( SURFACE-AT ?auto_17742 ?auto_17764 ) ( ON ?auto_17742 ?auto_17780 ) ( CLEAR ?auto_17742 ) ( not ( = ?auto_17740 ?auto_17742 ) ) ( not ( = ?auto_17740 ?auto_17780 ) ) ( not ( = ?auto_17742 ?auto_17780 ) ) ( not ( = ?auto_17746 ?auto_17781 ) ) ( IS-CRATE ?auto_17740 ) ( not ( = ?auto_17783 ?auto_17744 ) ) ( HOIST-AT ?auto_17765 ?auto_17783 ) ( AVAILABLE ?auto_17765 ) ( SURFACE-AT ?auto_17740 ?auto_17783 ) ( ON ?auto_17740 ?auto_17752 ) ( CLEAR ?auto_17740 ) ( not ( = ?auto_17738 ?auto_17740 ) ) ( not ( = ?auto_17738 ?auto_17752 ) ) ( not ( = ?auto_17740 ?auto_17752 ) ) ( not ( = ?auto_17746 ?auto_17765 ) ) ( IS-CRATE ?auto_17738 ) ( not ( = ?auto_17759 ?auto_17744 ) ) ( HOIST-AT ?auto_17753 ?auto_17759 ) ( AVAILABLE ?auto_17753 ) ( SURFACE-AT ?auto_17738 ?auto_17759 ) ( ON ?auto_17738 ?auto_17751 ) ( CLEAR ?auto_17738 ) ( not ( = ?auto_17739 ?auto_17738 ) ) ( not ( = ?auto_17739 ?auto_17751 ) ) ( not ( = ?auto_17738 ?auto_17751 ) ) ( not ( = ?auto_17746 ?auto_17753 ) ) ( IS-CRATE ?auto_17739 ) ( not ( = ?auto_17771 ?auto_17744 ) ) ( HOIST-AT ?auto_17754 ?auto_17771 ) ( AVAILABLE ?auto_17754 ) ( SURFACE-AT ?auto_17739 ?auto_17771 ) ( ON ?auto_17739 ?auto_17749 ) ( CLEAR ?auto_17739 ) ( not ( = ?auto_17737 ?auto_17739 ) ) ( not ( = ?auto_17737 ?auto_17749 ) ) ( not ( = ?auto_17739 ?auto_17749 ) ) ( not ( = ?auto_17746 ?auto_17754 ) ) ( IS-CRATE ?auto_17737 ) ( not ( = ?auto_17766 ?auto_17744 ) ) ( HOIST-AT ?auto_17782 ?auto_17766 ) ( AVAILABLE ?auto_17782 ) ( SURFACE-AT ?auto_17737 ?auto_17766 ) ( ON ?auto_17737 ?auto_17756 ) ( CLEAR ?auto_17737 ) ( not ( = ?auto_17734 ?auto_17737 ) ) ( not ( = ?auto_17734 ?auto_17756 ) ) ( not ( = ?auto_17737 ?auto_17756 ) ) ( not ( = ?auto_17746 ?auto_17782 ) ) ( IS-CRATE ?auto_17734 ) ( AVAILABLE ?auto_17781 ) ( SURFACE-AT ?auto_17734 ?auto_17764 ) ( ON ?auto_17734 ?auto_17769 ) ( CLEAR ?auto_17734 ) ( not ( = ?auto_17735 ?auto_17734 ) ) ( not ( = ?auto_17735 ?auto_17769 ) ) ( not ( = ?auto_17734 ?auto_17769 ) ) ( IS-CRATE ?auto_17735 ) ( not ( = ?auto_17774 ?auto_17744 ) ) ( HOIST-AT ?auto_17779 ?auto_17774 ) ( AVAILABLE ?auto_17779 ) ( SURFACE-AT ?auto_17735 ?auto_17774 ) ( ON ?auto_17735 ?auto_17760 ) ( CLEAR ?auto_17735 ) ( not ( = ?auto_17736 ?auto_17735 ) ) ( not ( = ?auto_17736 ?auto_17760 ) ) ( not ( = ?auto_17735 ?auto_17760 ) ) ( not ( = ?auto_17746 ?auto_17779 ) ) ( IS-CRATE ?auto_17736 ) ( not ( = ?auto_17776 ?auto_17744 ) ) ( HOIST-AT ?auto_17772 ?auto_17776 ) ( AVAILABLE ?auto_17772 ) ( SURFACE-AT ?auto_17736 ?auto_17776 ) ( ON ?auto_17736 ?auto_17761 ) ( CLEAR ?auto_17736 ) ( not ( = ?auto_17733 ?auto_17736 ) ) ( not ( = ?auto_17733 ?auto_17761 ) ) ( not ( = ?auto_17736 ?auto_17761 ) ) ( not ( = ?auto_17746 ?auto_17772 ) ) ( IS-CRATE ?auto_17733 ) ( not ( = ?auto_17773 ?auto_17744 ) ) ( HOIST-AT ?auto_17767 ?auto_17773 ) ( AVAILABLE ?auto_17767 ) ( SURFACE-AT ?auto_17733 ?auto_17773 ) ( ON ?auto_17733 ?auto_17758 ) ( CLEAR ?auto_17733 ) ( not ( = ?auto_17732 ?auto_17733 ) ) ( not ( = ?auto_17732 ?auto_17758 ) ) ( not ( = ?auto_17733 ?auto_17758 ) ) ( not ( = ?auto_17746 ?auto_17767 ) ) ( IS-CRATE ?auto_17732 ) ( not ( = ?auto_17775 ?auto_17744 ) ) ( HOIST-AT ?auto_17768 ?auto_17775 ) ( AVAILABLE ?auto_17768 ) ( SURFACE-AT ?auto_17732 ?auto_17775 ) ( ON ?auto_17732 ?auto_17778 ) ( CLEAR ?auto_17732 ) ( not ( = ?auto_17731 ?auto_17732 ) ) ( not ( = ?auto_17731 ?auto_17778 ) ) ( not ( = ?auto_17732 ?auto_17778 ) ) ( not ( = ?auto_17746 ?auto_17768 ) ) ( IS-CRATE ?auto_17731 ) ( not ( = ?auto_17762 ?auto_17744 ) ) ( HOIST-AT ?auto_17755 ?auto_17762 ) ( SURFACE-AT ?auto_17731 ?auto_17762 ) ( ON ?auto_17731 ?auto_17777 ) ( CLEAR ?auto_17731 ) ( not ( = ?auto_17730 ?auto_17731 ) ) ( not ( = ?auto_17730 ?auto_17777 ) ) ( not ( = ?auto_17731 ?auto_17777 ) ) ( not ( = ?auto_17746 ?auto_17755 ) ) ( IS-CRATE ?auto_17730 ) ( not ( = ?auto_17763 ?auto_17744 ) ) ( HOIST-AT ?auto_17750 ?auto_17763 ) ( AVAILABLE ?auto_17750 ) ( SURFACE-AT ?auto_17730 ?auto_17763 ) ( ON ?auto_17730 ?auto_17770 ) ( CLEAR ?auto_17730 ) ( not ( = ?auto_17729 ?auto_17730 ) ) ( not ( = ?auto_17729 ?auto_17770 ) ) ( not ( = ?auto_17730 ?auto_17770 ) ) ( not ( = ?auto_17746 ?auto_17750 ) ) ( SURFACE-AT ?auto_17728 ?auto_17744 ) ( CLEAR ?auto_17728 ) ( IS-CRATE ?auto_17729 ) ( AVAILABLE ?auto_17746 ) ( AVAILABLE ?auto_17755 ) ( SURFACE-AT ?auto_17729 ?auto_17762 ) ( ON ?auto_17729 ?auto_17757 ) ( CLEAR ?auto_17729 ) ( TRUCK-AT ?auto_17743 ?auto_17744 ) ( not ( = ?auto_17728 ?auto_17729 ) ) ( not ( = ?auto_17728 ?auto_17757 ) ) ( not ( = ?auto_17729 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17730 ) ) ( not ( = ?auto_17728 ?auto_17770 ) ) ( not ( = ?auto_17730 ?auto_17757 ) ) ( not ( = ?auto_17763 ?auto_17762 ) ) ( not ( = ?auto_17750 ?auto_17755 ) ) ( not ( = ?auto_17770 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17731 ) ) ( not ( = ?auto_17728 ?auto_17777 ) ) ( not ( = ?auto_17729 ?auto_17731 ) ) ( not ( = ?auto_17729 ?auto_17777 ) ) ( not ( = ?auto_17731 ?auto_17770 ) ) ( not ( = ?auto_17731 ?auto_17757 ) ) ( not ( = ?auto_17777 ?auto_17770 ) ) ( not ( = ?auto_17777 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17732 ) ) ( not ( = ?auto_17728 ?auto_17778 ) ) ( not ( = ?auto_17729 ?auto_17732 ) ) ( not ( = ?auto_17729 ?auto_17778 ) ) ( not ( = ?auto_17730 ?auto_17732 ) ) ( not ( = ?auto_17730 ?auto_17778 ) ) ( not ( = ?auto_17732 ?auto_17777 ) ) ( not ( = ?auto_17732 ?auto_17770 ) ) ( not ( = ?auto_17732 ?auto_17757 ) ) ( not ( = ?auto_17775 ?auto_17762 ) ) ( not ( = ?auto_17775 ?auto_17763 ) ) ( not ( = ?auto_17768 ?auto_17755 ) ) ( not ( = ?auto_17768 ?auto_17750 ) ) ( not ( = ?auto_17778 ?auto_17777 ) ) ( not ( = ?auto_17778 ?auto_17770 ) ) ( not ( = ?auto_17778 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17733 ) ) ( not ( = ?auto_17728 ?auto_17758 ) ) ( not ( = ?auto_17729 ?auto_17733 ) ) ( not ( = ?auto_17729 ?auto_17758 ) ) ( not ( = ?auto_17730 ?auto_17733 ) ) ( not ( = ?auto_17730 ?auto_17758 ) ) ( not ( = ?auto_17731 ?auto_17733 ) ) ( not ( = ?auto_17731 ?auto_17758 ) ) ( not ( = ?auto_17733 ?auto_17778 ) ) ( not ( = ?auto_17733 ?auto_17777 ) ) ( not ( = ?auto_17733 ?auto_17770 ) ) ( not ( = ?auto_17733 ?auto_17757 ) ) ( not ( = ?auto_17773 ?auto_17775 ) ) ( not ( = ?auto_17773 ?auto_17762 ) ) ( not ( = ?auto_17773 ?auto_17763 ) ) ( not ( = ?auto_17767 ?auto_17768 ) ) ( not ( = ?auto_17767 ?auto_17755 ) ) ( not ( = ?auto_17767 ?auto_17750 ) ) ( not ( = ?auto_17758 ?auto_17778 ) ) ( not ( = ?auto_17758 ?auto_17777 ) ) ( not ( = ?auto_17758 ?auto_17770 ) ) ( not ( = ?auto_17758 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17736 ) ) ( not ( = ?auto_17728 ?auto_17761 ) ) ( not ( = ?auto_17729 ?auto_17736 ) ) ( not ( = ?auto_17729 ?auto_17761 ) ) ( not ( = ?auto_17730 ?auto_17736 ) ) ( not ( = ?auto_17730 ?auto_17761 ) ) ( not ( = ?auto_17731 ?auto_17736 ) ) ( not ( = ?auto_17731 ?auto_17761 ) ) ( not ( = ?auto_17732 ?auto_17736 ) ) ( not ( = ?auto_17732 ?auto_17761 ) ) ( not ( = ?auto_17736 ?auto_17758 ) ) ( not ( = ?auto_17736 ?auto_17778 ) ) ( not ( = ?auto_17736 ?auto_17777 ) ) ( not ( = ?auto_17736 ?auto_17770 ) ) ( not ( = ?auto_17736 ?auto_17757 ) ) ( not ( = ?auto_17776 ?auto_17773 ) ) ( not ( = ?auto_17776 ?auto_17775 ) ) ( not ( = ?auto_17776 ?auto_17762 ) ) ( not ( = ?auto_17776 ?auto_17763 ) ) ( not ( = ?auto_17772 ?auto_17767 ) ) ( not ( = ?auto_17772 ?auto_17768 ) ) ( not ( = ?auto_17772 ?auto_17755 ) ) ( not ( = ?auto_17772 ?auto_17750 ) ) ( not ( = ?auto_17761 ?auto_17758 ) ) ( not ( = ?auto_17761 ?auto_17778 ) ) ( not ( = ?auto_17761 ?auto_17777 ) ) ( not ( = ?auto_17761 ?auto_17770 ) ) ( not ( = ?auto_17761 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17735 ) ) ( not ( = ?auto_17728 ?auto_17760 ) ) ( not ( = ?auto_17729 ?auto_17735 ) ) ( not ( = ?auto_17729 ?auto_17760 ) ) ( not ( = ?auto_17730 ?auto_17735 ) ) ( not ( = ?auto_17730 ?auto_17760 ) ) ( not ( = ?auto_17731 ?auto_17735 ) ) ( not ( = ?auto_17731 ?auto_17760 ) ) ( not ( = ?auto_17732 ?auto_17735 ) ) ( not ( = ?auto_17732 ?auto_17760 ) ) ( not ( = ?auto_17733 ?auto_17735 ) ) ( not ( = ?auto_17733 ?auto_17760 ) ) ( not ( = ?auto_17735 ?auto_17761 ) ) ( not ( = ?auto_17735 ?auto_17758 ) ) ( not ( = ?auto_17735 ?auto_17778 ) ) ( not ( = ?auto_17735 ?auto_17777 ) ) ( not ( = ?auto_17735 ?auto_17770 ) ) ( not ( = ?auto_17735 ?auto_17757 ) ) ( not ( = ?auto_17774 ?auto_17776 ) ) ( not ( = ?auto_17774 ?auto_17773 ) ) ( not ( = ?auto_17774 ?auto_17775 ) ) ( not ( = ?auto_17774 ?auto_17762 ) ) ( not ( = ?auto_17774 ?auto_17763 ) ) ( not ( = ?auto_17779 ?auto_17772 ) ) ( not ( = ?auto_17779 ?auto_17767 ) ) ( not ( = ?auto_17779 ?auto_17768 ) ) ( not ( = ?auto_17779 ?auto_17755 ) ) ( not ( = ?auto_17779 ?auto_17750 ) ) ( not ( = ?auto_17760 ?auto_17761 ) ) ( not ( = ?auto_17760 ?auto_17758 ) ) ( not ( = ?auto_17760 ?auto_17778 ) ) ( not ( = ?auto_17760 ?auto_17777 ) ) ( not ( = ?auto_17760 ?auto_17770 ) ) ( not ( = ?auto_17760 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17734 ) ) ( not ( = ?auto_17728 ?auto_17769 ) ) ( not ( = ?auto_17729 ?auto_17734 ) ) ( not ( = ?auto_17729 ?auto_17769 ) ) ( not ( = ?auto_17730 ?auto_17734 ) ) ( not ( = ?auto_17730 ?auto_17769 ) ) ( not ( = ?auto_17731 ?auto_17734 ) ) ( not ( = ?auto_17731 ?auto_17769 ) ) ( not ( = ?auto_17732 ?auto_17734 ) ) ( not ( = ?auto_17732 ?auto_17769 ) ) ( not ( = ?auto_17733 ?auto_17734 ) ) ( not ( = ?auto_17733 ?auto_17769 ) ) ( not ( = ?auto_17736 ?auto_17734 ) ) ( not ( = ?auto_17736 ?auto_17769 ) ) ( not ( = ?auto_17734 ?auto_17760 ) ) ( not ( = ?auto_17734 ?auto_17761 ) ) ( not ( = ?auto_17734 ?auto_17758 ) ) ( not ( = ?auto_17734 ?auto_17778 ) ) ( not ( = ?auto_17734 ?auto_17777 ) ) ( not ( = ?auto_17734 ?auto_17770 ) ) ( not ( = ?auto_17734 ?auto_17757 ) ) ( not ( = ?auto_17764 ?auto_17774 ) ) ( not ( = ?auto_17764 ?auto_17776 ) ) ( not ( = ?auto_17764 ?auto_17773 ) ) ( not ( = ?auto_17764 ?auto_17775 ) ) ( not ( = ?auto_17764 ?auto_17762 ) ) ( not ( = ?auto_17764 ?auto_17763 ) ) ( not ( = ?auto_17781 ?auto_17779 ) ) ( not ( = ?auto_17781 ?auto_17772 ) ) ( not ( = ?auto_17781 ?auto_17767 ) ) ( not ( = ?auto_17781 ?auto_17768 ) ) ( not ( = ?auto_17781 ?auto_17755 ) ) ( not ( = ?auto_17781 ?auto_17750 ) ) ( not ( = ?auto_17769 ?auto_17760 ) ) ( not ( = ?auto_17769 ?auto_17761 ) ) ( not ( = ?auto_17769 ?auto_17758 ) ) ( not ( = ?auto_17769 ?auto_17778 ) ) ( not ( = ?auto_17769 ?auto_17777 ) ) ( not ( = ?auto_17769 ?auto_17770 ) ) ( not ( = ?auto_17769 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17737 ) ) ( not ( = ?auto_17728 ?auto_17756 ) ) ( not ( = ?auto_17729 ?auto_17737 ) ) ( not ( = ?auto_17729 ?auto_17756 ) ) ( not ( = ?auto_17730 ?auto_17737 ) ) ( not ( = ?auto_17730 ?auto_17756 ) ) ( not ( = ?auto_17731 ?auto_17737 ) ) ( not ( = ?auto_17731 ?auto_17756 ) ) ( not ( = ?auto_17732 ?auto_17737 ) ) ( not ( = ?auto_17732 ?auto_17756 ) ) ( not ( = ?auto_17733 ?auto_17737 ) ) ( not ( = ?auto_17733 ?auto_17756 ) ) ( not ( = ?auto_17736 ?auto_17737 ) ) ( not ( = ?auto_17736 ?auto_17756 ) ) ( not ( = ?auto_17735 ?auto_17737 ) ) ( not ( = ?auto_17735 ?auto_17756 ) ) ( not ( = ?auto_17737 ?auto_17769 ) ) ( not ( = ?auto_17737 ?auto_17760 ) ) ( not ( = ?auto_17737 ?auto_17761 ) ) ( not ( = ?auto_17737 ?auto_17758 ) ) ( not ( = ?auto_17737 ?auto_17778 ) ) ( not ( = ?auto_17737 ?auto_17777 ) ) ( not ( = ?auto_17737 ?auto_17770 ) ) ( not ( = ?auto_17737 ?auto_17757 ) ) ( not ( = ?auto_17766 ?auto_17764 ) ) ( not ( = ?auto_17766 ?auto_17774 ) ) ( not ( = ?auto_17766 ?auto_17776 ) ) ( not ( = ?auto_17766 ?auto_17773 ) ) ( not ( = ?auto_17766 ?auto_17775 ) ) ( not ( = ?auto_17766 ?auto_17762 ) ) ( not ( = ?auto_17766 ?auto_17763 ) ) ( not ( = ?auto_17782 ?auto_17781 ) ) ( not ( = ?auto_17782 ?auto_17779 ) ) ( not ( = ?auto_17782 ?auto_17772 ) ) ( not ( = ?auto_17782 ?auto_17767 ) ) ( not ( = ?auto_17782 ?auto_17768 ) ) ( not ( = ?auto_17782 ?auto_17755 ) ) ( not ( = ?auto_17782 ?auto_17750 ) ) ( not ( = ?auto_17756 ?auto_17769 ) ) ( not ( = ?auto_17756 ?auto_17760 ) ) ( not ( = ?auto_17756 ?auto_17761 ) ) ( not ( = ?auto_17756 ?auto_17758 ) ) ( not ( = ?auto_17756 ?auto_17778 ) ) ( not ( = ?auto_17756 ?auto_17777 ) ) ( not ( = ?auto_17756 ?auto_17770 ) ) ( not ( = ?auto_17756 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17739 ) ) ( not ( = ?auto_17728 ?auto_17749 ) ) ( not ( = ?auto_17729 ?auto_17739 ) ) ( not ( = ?auto_17729 ?auto_17749 ) ) ( not ( = ?auto_17730 ?auto_17739 ) ) ( not ( = ?auto_17730 ?auto_17749 ) ) ( not ( = ?auto_17731 ?auto_17739 ) ) ( not ( = ?auto_17731 ?auto_17749 ) ) ( not ( = ?auto_17732 ?auto_17739 ) ) ( not ( = ?auto_17732 ?auto_17749 ) ) ( not ( = ?auto_17733 ?auto_17739 ) ) ( not ( = ?auto_17733 ?auto_17749 ) ) ( not ( = ?auto_17736 ?auto_17739 ) ) ( not ( = ?auto_17736 ?auto_17749 ) ) ( not ( = ?auto_17735 ?auto_17739 ) ) ( not ( = ?auto_17735 ?auto_17749 ) ) ( not ( = ?auto_17734 ?auto_17739 ) ) ( not ( = ?auto_17734 ?auto_17749 ) ) ( not ( = ?auto_17739 ?auto_17756 ) ) ( not ( = ?auto_17739 ?auto_17769 ) ) ( not ( = ?auto_17739 ?auto_17760 ) ) ( not ( = ?auto_17739 ?auto_17761 ) ) ( not ( = ?auto_17739 ?auto_17758 ) ) ( not ( = ?auto_17739 ?auto_17778 ) ) ( not ( = ?auto_17739 ?auto_17777 ) ) ( not ( = ?auto_17739 ?auto_17770 ) ) ( not ( = ?auto_17739 ?auto_17757 ) ) ( not ( = ?auto_17771 ?auto_17766 ) ) ( not ( = ?auto_17771 ?auto_17764 ) ) ( not ( = ?auto_17771 ?auto_17774 ) ) ( not ( = ?auto_17771 ?auto_17776 ) ) ( not ( = ?auto_17771 ?auto_17773 ) ) ( not ( = ?auto_17771 ?auto_17775 ) ) ( not ( = ?auto_17771 ?auto_17762 ) ) ( not ( = ?auto_17771 ?auto_17763 ) ) ( not ( = ?auto_17754 ?auto_17782 ) ) ( not ( = ?auto_17754 ?auto_17781 ) ) ( not ( = ?auto_17754 ?auto_17779 ) ) ( not ( = ?auto_17754 ?auto_17772 ) ) ( not ( = ?auto_17754 ?auto_17767 ) ) ( not ( = ?auto_17754 ?auto_17768 ) ) ( not ( = ?auto_17754 ?auto_17755 ) ) ( not ( = ?auto_17754 ?auto_17750 ) ) ( not ( = ?auto_17749 ?auto_17756 ) ) ( not ( = ?auto_17749 ?auto_17769 ) ) ( not ( = ?auto_17749 ?auto_17760 ) ) ( not ( = ?auto_17749 ?auto_17761 ) ) ( not ( = ?auto_17749 ?auto_17758 ) ) ( not ( = ?auto_17749 ?auto_17778 ) ) ( not ( = ?auto_17749 ?auto_17777 ) ) ( not ( = ?auto_17749 ?auto_17770 ) ) ( not ( = ?auto_17749 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17738 ) ) ( not ( = ?auto_17728 ?auto_17751 ) ) ( not ( = ?auto_17729 ?auto_17738 ) ) ( not ( = ?auto_17729 ?auto_17751 ) ) ( not ( = ?auto_17730 ?auto_17738 ) ) ( not ( = ?auto_17730 ?auto_17751 ) ) ( not ( = ?auto_17731 ?auto_17738 ) ) ( not ( = ?auto_17731 ?auto_17751 ) ) ( not ( = ?auto_17732 ?auto_17738 ) ) ( not ( = ?auto_17732 ?auto_17751 ) ) ( not ( = ?auto_17733 ?auto_17738 ) ) ( not ( = ?auto_17733 ?auto_17751 ) ) ( not ( = ?auto_17736 ?auto_17738 ) ) ( not ( = ?auto_17736 ?auto_17751 ) ) ( not ( = ?auto_17735 ?auto_17738 ) ) ( not ( = ?auto_17735 ?auto_17751 ) ) ( not ( = ?auto_17734 ?auto_17738 ) ) ( not ( = ?auto_17734 ?auto_17751 ) ) ( not ( = ?auto_17737 ?auto_17738 ) ) ( not ( = ?auto_17737 ?auto_17751 ) ) ( not ( = ?auto_17738 ?auto_17749 ) ) ( not ( = ?auto_17738 ?auto_17756 ) ) ( not ( = ?auto_17738 ?auto_17769 ) ) ( not ( = ?auto_17738 ?auto_17760 ) ) ( not ( = ?auto_17738 ?auto_17761 ) ) ( not ( = ?auto_17738 ?auto_17758 ) ) ( not ( = ?auto_17738 ?auto_17778 ) ) ( not ( = ?auto_17738 ?auto_17777 ) ) ( not ( = ?auto_17738 ?auto_17770 ) ) ( not ( = ?auto_17738 ?auto_17757 ) ) ( not ( = ?auto_17759 ?auto_17771 ) ) ( not ( = ?auto_17759 ?auto_17766 ) ) ( not ( = ?auto_17759 ?auto_17764 ) ) ( not ( = ?auto_17759 ?auto_17774 ) ) ( not ( = ?auto_17759 ?auto_17776 ) ) ( not ( = ?auto_17759 ?auto_17773 ) ) ( not ( = ?auto_17759 ?auto_17775 ) ) ( not ( = ?auto_17759 ?auto_17762 ) ) ( not ( = ?auto_17759 ?auto_17763 ) ) ( not ( = ?auto_17753 ?auto_17754 ) ) ( not ( = ?auto_17753 ?auto_17782 ) ) ( not ( = ?auto_17753 ?auto_17781 ) ) ( not ( = ?auto_17753 ?auto_17779 ) ) ( not ( = ?auto_17753 ?auto_17772 ) ) ( not ( = ?auto_17753 ?auto_17767 ) ) ( not ( = ?auto_17753 ?auto_17768 ) ) ( not ( = ?auto_17753 ?auto_17755 ) ) ( not ( = ?auto_17753 ?auto_17750 ) ) ( not ( = ?auto_17751 ?auto_17749 ) ) ( not ( = ?auto_17751 ?auto_17756 ) ) ( not ( = ?auto_17751 ?auto_17769 ) ) ( not ( = ?auto_17751 ?auto_17760 ) ) ( not ( = ?auto_17751 ?auto_17761 ) ) ( not ( = ?auto_17751 ?auto_17758 ) ) ( not ( = ?auto_17751 ?auto_17778 ) ) ( not ( = ?auto_17751 ?auto_17777 ) ) ( not ( = ?auto_17751 ?auto_17770 ) ) ( not ( = ?auto_17751 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17740 ) ) ( not ( = ?auto_17728 ?auto_17752 ) ) ( not ( = ?auto_17729 ?auto_17740 ) ) ( not ( = ?auto_17729 ?auto_17752 ) ) ( not ( = ?auto_17730 ?auto_17740 ) ) ( not ( = ?auto_17730 ?auto_17752 ) ) ( not ( = ?auto_17731 ?auto_17740 ) ) ( not ( = ?auto_17731 ?auto_17752 ) ) ( not ( = ?auto_17732 ?auto_17740 ) ) ( not ( = ?auto_17732 ?auto_17752 ) ) ( not ( = ?auto_17733 ?auto_17740 ) ) ( not ( = ?auto_17733 ?auto_17752 ) ) ( not ( = ?auto_17736 ?auto_17740 ) ) ( not ( = ?auto_17736 ?auto_17752 ) ) ( not ( = ?auto_17735 ?auto_17740 ) ) ( not ( = ?auto_17735 ?auto_17752 ) ) ( not ( = ?auto_17734 ?auto_17740 ) ) ( not ( = ?auto_17734 ?auto_17752 ) ) ( not ( = ?auto_17737 ?auto_17740 ) ) ( not ( = ?auto_17737 ?auto_17752 ) ) ( not ( = ?auto_17739 ?auto_17740 ) ) ( not ( = ?auto_17739 ?auto_17752 ) ) ( not ( = ?auto_17740 ?auto_17751 ) ) ( not ( = ?auto_17740 ?auto_17749 ) ) ( not ( = ?auto_17740 ?auto_17756 ) ) ( not ( = ?auto_17740 ?auto_17769 ) ) ( not ( = ?auto_17740 ?auto_17760 ) ) ( not ( = ?auto_17740 ?auto_17761 ) ) ( not ( = ?auto_17740 ?auto_17758 ) ) ( not ( = ?auto_17740 ?auto_17778 ) ) ( not ( = ?auto_17740 ?auto_17777 ) ) ( not ( = ?auto_17740 ?auto_17770 ) ) ( not ( = ?auto_17740 ?auto_17757 ) ) ( not ( = ?auto_17783 ?auto_17759 ) ) ( not ( = ?auto_17783 ?auto_17771 ) ) ( not ( = ?auto_17783 ?auto_17766 ) ) ( not ( = ?auto_17783 ?auto_17764 ) ) ( not ( = ?auto_17783 ?auto_17774 ) ) ( not ( = ?auto_17783 ?auto_17776 ) ) ( not ( = ?auto_17783 ?auto_17773 ) ) ( not ( = ?auto_17783 ?auto_17775 ) ) ( not ( = ?auto_17783 ?auto_17762 ) ) ( not ( = ?auto_17783 ?auto_17763 ) ) ( not ( = ?auto_17765 ?auto_17753 ) ) ( not ( = ?auto_17765 ?auto_17754 ) ) ( not ( = ?auto_17765 ?auto_17782 ) ) ( not ( = ?auto_17765 ?auto_17781 ) ) ( not ( = ?auto_17765 ?auto_17779 ) ) ( not ( = ?auto_17765 ?auto_17772 ) ) ( not ( = ?auto_17765 ?auto_17767 ) ) ( not ( = ?auto_17765 ?auto_17768 ) ) ( not ( = ?auto_17765 ?auto_17755 ) ) ( not ( = ?auto_17765 ?auto_17750 ) ) ( not ( = ?auto_17752 ?auto_17751 ) ) ( not ( = ?auto_17752 ?auto_17749 ) ) ( not ( = ?auto_17752 ?auto_17756 ) ) ( not ( = ?auto_17752 ?auto_17769 ) ) ( not ( = ?auto_17752 ?auto_17760 ) ) ( not ( = ?auto_17752 ?auto_17761 ) ) ( not ( = ?auto_17752 ?auto_17758 ) ) ( not ( = ?auto_17752 ?auto_17778 ) ) ( not ( = ?auto_17752 ?auto_17777 ) ) ( not ( = ?auto_17752 ?auto_17770 ) ) ( not ( = ?auto_17752 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17742 ) ) ( not ( = ?auto_17728 ?auto_17780 ) ) ( not ( = ?auto_17729 ?auto_17742 ) ) ( not ( = ?auto_17729 ?auto_17780 ) ) ( not ( = ?auto_17730 ?auto_17742 ) ) ( not ( = ?auto_17730 ?auto_17780 ) ) ( not ( = ?auto_17731 ?auto_17742 ) ) ( not ( = ?auto_17731 ?auto_17780 ) ) ( not ( = ?auto_17732 ?auto_17742 ) ) ( not ( = ?auto_17732 ?auto_17780 ) ) ( not ( = ?auto_17733 ?auto_17742 ) ) ( not ( = ?auto_17733 ?auto_17780 ) ) ( not ( = ?auto_17736 ?auto_17742 ) ) ( not ( = ?auto_17736 ?auto_17780 ) ) ( not ( = ?auto_17735 ?auto_17742 ) ) ( not ( = ?auto_17735 ?auto_17780 ) ) ( not ( = ?auto_17734 ?auto_17742 ) ) ( not ( = ?auto_17734 ?auto_17780 ) ) ( not ( = ?auto_17737 ?auto_17742 ) ) ( not ( = ?auto_17737 ?auto_17780 ) ) ( not ( = ?auto_17739 ?auto_17742 ) ) ( not ( = ?auto_17739 ?auto_17780 ) ) ( not ( = ?auto_17738 ?auto_17742 ) ) ( not ( = ?auto_17738 ?auto_17780 ) ) ( not ( = ?auto_17742 ?auto_17752 ) ) ( not ( = ?auto_17742 ?auto_17751 ) ) ( not ( = ?auto_17742 ?auto_17749 ) ) ( not ( = ?auto_17742 ?auto_17756 ) ) ( not ( = ?auto_17742 ?auto_17769 ) ) ( not ( = ?auto_17742 ?auto_17760 ) ) ( not ( = ?auto_17742 ?auto_17761 ) ) ( not ( = ?auto_17742 ?auto_17758 ) ) ( not ( = ?auto_17742 ?auto_17778 ) ) ( not ( = ?auto_17742 ?auto_17777 ) ) ( not ( = ?auto_17742 ?auto_17770 ) ) ( not ( = ?auto_17742 ?auto_17757 ) ) ( not ( = ?auto_17780 ?auto_17752 ) ) ( not ( = ?auto_17780 ?auto_17751 ) ) ( not ( = ?auto_17780 ?auto_17749 ) ) ( not ( = ?auto_17780 ?auto_17756 ) ) ( not ( = ?auto_17780 ?auto_17769 ) ) ( not ( = ?auto_17780 ?auto_17760 ) ) ( not ( = ?auto_17780 ?auto_17761 ) ) ( not ( = ?auto_17780 ?auto_17758 ) ) ( not ( = ?auto_17780 ?auto_17778 ) ) ( not ( = ?auto_17780 ?auto_17777 ) ) ( not ( = ?auto_17780 ?auto_17770 ) ) ( not ( = ?auto_17780 ?auto_17757 ) ) ( not ( = ?auto_17728 ?auto_17741 ) ) ( not ( = ?auto_17728 ?auto_17745 ) ) ( not ( = ?auto_17729 ?auto_17741 ) ) ( not ( = ?auto_17729 ?auto_17745 ) ) ( not ( = ?auto_17730 ?auto_17741 ) ) ( not ( = ?auto_17730 ?auto_17745 ) ) ( not ( = ?auto_17731 ?auto_17741 ) ) ( not ( = ?auto_17731 ?auto_17745 ) ) ( not ( = ?auto_17732 ?auto_17741 ) ) ( not ( = ?auto_17732 ?auto_17745 ) ) ( not ( = ?auto_17733 ?auto_17741 ) ) ( not ( = ?auto_17733 ?auto_17745 ) ) ( not ( = ?auto_17736 ?auto_17741 ) ) ( not ( = ?auto_17736 ?auto_17745 ) ) ( not ( = ?auto_17735 ?auto_17741 ) ) ( not ( = ?auto_17735 ?auto_17745 ) ) ( not ( = ?auto_17734 ?auto_17741 ) ) ( not ( = ?auto_17734 ?auto_17745 ) ) ( not ( = ?auto_17737 ?auto_17741 ) ) ( not ( = ?auto_17737 ?auto_17745 ) ) ( not ( = ?auto_17739 ?auto_17741 ) ) ( not ( = ?auto_17739 ?auto_17745 ) ) ( not ( = ?auto_17738 ?auto_17741 ) ) ( not ( = ?auto_17738 ?auto_17745 ) ) ( not ( = ?auto_17740 ?auto_17741 ) ) ( not ( = ?auto_17740 ?auto_17745 ) ) ( not ( = ?auto_17741 ?auto_17780 ) ) ( not ( = ?auto_17741 ?auto_17752 ) ) ( not ( = ?auto_17741 ?auto_17751 ) ) ( not ( = ?auto_17741 ?auto_17749 ) ) ( not ( = ?auto_17741 ?auto_17756 ) ) ( not ( = ?auto_17741 ?auto_17769 ) ) ( not ( = ?auto_17741 ?auto_17760 ) ) ( not ( = ?auto_17741 ?auto_17761 ) ) ( not ( = ?auto_17741 ?auto_17758 ) ) ( not ( = ?auto_17741 ?auto_17778 ) ) ( not ( = ?auto_17741 ?auto_17777 ) ) ( not ( = ?auto_17741 ?auto_17770 ) ) ( not ( = ?auto_17741 ?auto_17757 ) ) ( not ( = ?auto_17747 ?auto_17764 ) ) ( not ( = ?auto_17747 ?auto_17783 ) ) ( not ( = ?auto_17747 ?auto_17759 ) ) ( not ( = ?auto_17747 ?auto_17771 ) ) ( not ( = ?auto_17747 ?auto_17766 ) ) ( not ( = ?auto_17747 ?auto_17774 ) ) ( not ( = ?auto_17747 ?auto_17776 ) ) ( not ( = ?auto_17747 ?auto_17773 ) ) ( not ( = ?auto_17747 ?auto_17775 ) ) ( not ( = ?auto_17747 ?auto_17762 ) ) ( not ( = ?auto_17747 ?auto_17763 ) ) ( not ( = ?auto_17748 ?auto_17781 ) ) ( not ( = ?auto_17748 ?auto_17765 ) ) ( not ( = ?auto_17748 ?auto_17753 ) ) ( not ( = ?auto_17748 ?auto_17754 ) ) ( not ( = ?auto_17748 ?auto_17782 ) ) ( not ( = ?auto_17748 ?auto_17779 ) ) ( not ( = ?auto_17748 ?auto_17772 ) ) ( not ( = ?auto_17748 ?auto_17767 ) ) ( not ( = ?auto_17748 ?auto_17768 ) ) ( not ( = ?auto_17748 ?auto_17755 ) ) ( not ( = ?auto_17748 ?auto_17750 ) ) ( not ( = ?auto_17745 ?auto_17780 ) ) ( not ( = ?auto_17745 ?auto_17752 ) ) ( not ( = ?auto_17745 ?auto_17751 ) ) ( not ( = ?auto_17745 ?auto_17749 ) ) ( not ( = ?auto_17745 ?auto_17756 ) ) ( not ( = ?auto_17745 ?auto_17769 ) ) ( not ( = ?auto_17745 ?auto_17760 ) ) ( not ( = ?auto_17745 ?auto_17761 ) ) ( not ( = ?auto_17745 ?auto_17758 ) ) ( not ( = ?auto_17745 ?auto_17778 ) ) ( not ( = ?auto_17745 ?auto_17777 ) ) ( not ( = ?auto_17745 ?auto_17770 ) ) ( not ( = ?auto_17745 ?auto_17757 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_17728 ?auto_17729 ?auto_17730 ?auto_17731 ?auto_17732 ?auto_17733 ?auto_17736 ?auto_17735 ?auto_17734 ?auto_17737 ?auto_17739 ?auto_17738 ?auto_17740 ?auto_17742 )
      ( MAKE-1CRATE ?auto_17742 ?auto_17741 )
      ( MAKE-14CRATE-VERIFY ?auto_17728 ?auto_17729 ?auto_17730 ?auto_17731 ?auto_17732 ?auto_17733 ?auto_17736 ?auto_17735 ?auto_17734 ?auto_17737 ?auto_17739 ?auto_17738 ?auto_17740 ?auto_17742 ?auto_17741 ) )
  )

)

